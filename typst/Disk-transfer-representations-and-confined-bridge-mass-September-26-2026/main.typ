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

#align(center)[#text(size: 16pt, weight: "bold")[Disk transfer representations and confined bridge mass]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

A self-avoiding path crossing a wide strip can make long excursions parallel to its walls. We prove a mean-length exponent of $4 \/ 3$ for critical honeycomb walks, both with these excursions unrestricted and with their lateral displacement bounded by a sufficiently large fixed multiple of the strip width. The starting boundary point is fixed, the terminal point is summed over the opposite wall, and all finite lengths receive their critical weights. We also obtain the corresponding mean for large half-plane arches and a bulk visit law for chords in a triangle.

=== 1.1 The lattice and the positive path measures <the-lattice-and-the-positive-path-measures>

The honeycomb lattice has unit edges in directions

$ e_2 = \( 0 \, - 1 \) \, #h(2em) e_0 = \( sqrt(3) \/ 2 \, 1 \/ 2 \) \, #h(2em) e_1 = \( - sqrt(3) \/ 2 \, 1 \/ 2 \) . $

Put $U = e_0 - e_1$ and $V = e_0 - e_2$. The two vertex classes are $j U + k V$ and $j U + k V + e_0$, for $j \, k in bb(Z)$; the three edges from a vertex of the first class have directions $e_0 \, e_1 \, e_2$. For $i in { 0 \, 1 \, 2 }$ and $t in 1 / 2 + 3 / 2 bb(Z)$, the line $e_i dot.op y = t$ is an admissible wall. It avoids vertices and cuts edges orthogonally at their midpoints. These midpoints are boundary #emph[ports]. A port-to-port path visits distinct lattice vertices, all strictly inside its prescribed domain. Its two terminal half-edges have no additional weight.

Throughout, a path $gamma$ with $ell \( gamma \)$ visited vertices has weight

$ w \( gamma \) = x^(ell \( gamma \)) \, #h(2em) x = \( 2 cos \( pi \/ 8 \) \)^(- 1) = \( 2 + sqrt(2) \)^(- 1 \/ 2) . $

The connective constant of the honeycomb lattice is $x^(- 1)$ by Duminil-Copin and Smirnov [3] Theorem 1. For a nonempty path between ordinary vertices, vertex count is edge count plus one. All normalizations below use vertex count. We write $f \( R \) asymp g \( R \)$ when their ratio stays between positive constants, and $f \( R \) = R^(a + o \( 1 \))$ when $log f \( R \) \/ log R arrow.r a$.

Fix two parallel admissible walls at distance $R in 3 / 2 bb(Z)_(> 0)$, call them the lower and upper walls, and fix a port $a$ on the lower wall. Let $tau$ be either unit tangent to the walls and write $xi \( y \) = tau dot.op \( y - a \)$ for lateral displacement from the source. A #emph[bridge] joins $a$ to any port of the upper wall and otherwise stays strictly between the walls. Write

$ B \( R \) = sum_(gamma upright(" bridge")) w \( gamma \) \, #h(2em) M \( R \) = sum_(gamma upright(" bridge")) w \( gamma \) ell \( gamma \) . $

The normalized critical bridge law assigns probability $w \( gamma \) \/ B \( R \)$. For $C > 0$, let $B_C \( R \)$ and $M_C \( R \)$ be the same sums restricted to paths satisfying $sup_(y in gamma) \| xi \( y \) \| lt.eq C R$, where the supremum includes the terminal ports. The sign chosen for $tau$ does not affect this restriction.

#thm([Theorem 1.1.])[
  (Bridge mass retained in a fixed corridor).  #emph[There is a constant $C_0 < oo$ such that, for every fixed $C gt.eq C_0$, 
$ B_C \( R \) asymp B \( R \) asymp R^(- 1 \/ 4) \, #h(2em) M_C \( R \) = R^(13 \/ 12 + o \( 1 \)) \, #h(2em) M \( R \) = R^(13 \/ 12 + o \( 1 \)) . $

 Consequently the mean number of visited vertices is $R^(4 \/ 3 + o \( 1 \))$ both under the unrestricted critical bridge law and under its restriction to this fixed corridor.]
] <thm:confined-bridge>

The constant $C_0$ is independent of the exponent slack implicit in $o \( 1 \)$. The theorem concerns a mean under a law that sums all lengths. Its proof will expose why two further distinctions matter: a bulk visit estimate initially counts both arches and bridges, and an endpoint-separation estimate is needed before two disjoint exterior arms can turn those visits into confined bridges.

=== 1.2 Boundary and finite-domain consequences <boundary-and-finite-domain-consequences>

A half-plane #emph[arch] starts at one fixed port and ends at another port of the same wall. Let $h \( m \)$ be its total critical mass when the terminal port lies $m > 0$ port spacings to the right. Let $mu$ be the unnormalized critical measure with that initial port and the terminal port summed over the wall. Height is distance from the wall; diameter is Euclidean diameter.

#thm([Theorem 1.2.])[
  (Sharp boundary mass and annealed chord laws).  #emph[ The following conclusions hold as the indicated scale tends to infinity.]
  + #emph[The arch kernel is nonincreasing and 
$ h \( m \) asymp m^(- 5 \/ 4) \, #h(2em) mu \( "height" > R \) asymp mu \( "diameter" > R \) asymp R^(- 1 \/ 4) . $

]
  + #emph[For every sufficiently large fixed $C$, normalize $mu$ either on $R lt.eq "diameter" lt.eq C R$, or on $"height" gt.eq R$ and $"diameter" lt.eq C R$. Under either law, $bb(E) ell = R^(4 \/ 3 + o \( 1 \))$.]
  + #emph[Let 
$ D_R = { y : e_i dot.op y < R \, med i = 0 \, 1 \, 2 } \, #h(2em) I_R = { v upright(" a lattice vertex") : e_i dot.op v < \( 1 - epsilon \) R \, med i = 0 \, 1 \, 2 } \, $

 where $R in 1 / 2 + 3 / 2 bb(Z)$ and $epsilon > 0$ is sufficiently small and fixed. Sum critical chord weights over the ordered pair of boundary ports and normalize on chords visiting $I_R$. Uniformly for $v in I_R$, their visit probability is $R^(- 2 \/ 3 + o \( 1 \))$. The expected total number of visited vertices, and the expected number in $I_R$, are both $R^(4 \/ 3 + o \( 1 \))$.]
] <thm:boundary>

The endpoints in the last two conclusions are summed. Prescribing both endpoints is a different conditioning problem. The finite bridge reward in Theorem 1 also supplies an input to renewal arguments for infinite walks; those arguments concern different probability laws and are not needed here.

=== 1.3 Historical context and related representations <historical-context-and-related-representations>

Nienhuis’s solid-on-solid and Coulomb-gas analysis of the dilute $O \( n \)$ model gives the two-dimensional polymer exponent predictions at $n = 0$ [17]. Lawler, Schramm and Werner formulated the conjectural $upright("SLE")_(8 \/ 3)$ scaling description of planar self-avoiding walk and recovered the predicted displacement exponent $nu = 3 \/ 4$ [16]. That prediction concerns displacement under a fixed-length law. Our theorem determines a mean length under the critical measure that sums lengths and terminal ports. On the square lattice, Dyhr, Gilbert, Kennedy, Lawler and Passon studied this critical strip ensemble with one fixed endpoint and the other summed, relating it to a conditioned infinite half-plane walk [4].

Duminil-Copin and Smirnov proved the exact honeycomb connective constant using a para­fermionic observable [3]. Their strip argument gives $c \/ R lt.eq B \( R \) lt.eq 1$ and records the sharper power $R^(- 1 \/ 4)$ as a prediction. Beaton, Bousquet-Mélou, de Gier, Duminil-Copin and Guttmann later proved $B \( R \) arrow.r 0$ in their study of surface adsorption [1]. Glazman and Manolescu gave a shorter proof and a logarithmic subsequence bound, together with boundary two-point-function invariance for a specified class of columnwise rhombic half-plane tilings [10]. Krachun and Panagiotis obtained a polynomial upper bound on the critical bridge mass and quantitative sub-ballisticity for uniform honeycomb walks [14].

Our boundary exploration is a nonbacktracking form of the same parafermionic cancellation, with winding phases and positive masses kept distinct. Its relation to integrable rhombic loop weights was developed by Ikhlef and Cardy [13]; Glazman gives criticality and corrected general weight formulas in that setting [9]. The local dilute diagram algebra and its Yang–Baxter parametrization belong to the braid–monoid construction of Grimm and Pearce [11]. Zhou and Batchelor’s periodic transfer analysis supplies the spectral context, including a seam controlling winding-loop weights [21]. We fix the boundary gauge, caps and scalar factors explicitly here.

Polynomial exchange equations and special-rapidity reductions have counterparts in the dense $O \( 1 \)$ sum rule of Di Francesco and Zinn-Justin [2] and the dilute open-boundary $O \( 1 \)$ ground states and first fusion sum rule of Garbali and Nienhuis [7,8]. Garbali and Nienhuis also observed that polynomial ground states and the associated exchange and recurrence construction persist at $n = 0$ [7] Section 4. Our $n = 0$ disk vector, two-site compatibility and scalar normalization are proved below. The reflected current calculation uses the classical level-one lattice realization of Frenkel–Kac and Segal [6,20,5]; we give the mode and vacuum-sign calculations required by the physical normalization.

The related polynomial-vacuum construction [19] Theorem 1.1 gives the bridge mean exponent and retains it in a corridor whose width is of order $R log^2 R$. The present argument gives sharp boundary mass comparisons and confinement to a fixed multiple of $R$. The two constructions have the same even scalar polynomial and, after a change of lattice scale, the same homogeneous separator partition function (Remark 4). The disk interpolation, normalization estimates and spatial arguments used here are proved directly.

=== 1.4 Two exact calculations and the spatial conversion <two-exact-calculations-and-the-spatial-conversion>

Our proof uses the dilute-loop representation at loop weight zero. One calculation determines a boundary deficit. On a cylinder with $N$ sites around its circumference, let $h_N \( m \)$ be the mass of a single upper-half- cylinder arch from a fixed site to the site $m$ spacings to its right, with that oriented boundary interval specifying its lift. We prove

$ 1 - 2 cos \( 3 pi \/ 8 \) sum_(m = 1)^(N - 1) h_N \( m \) asymp N^(- 1 \/ 4) . $

We first deform the transfer weights by distinct rapidities. Their finite permutation orbit lets us solve the endpoint equations as a matrix-inverse pairing. At coincident rapidities this pairing is comparable to the squared norm of polynomial evaluation against a positive measure. Its asymptotics give the deficit; boundary exploration identities then convert it into height, strip and pointwise endpoint bounds.

The second calculation concerns bulk polygons. Fix two opposite face centers on a cylinder of circumference $2 n \| U \|$, on the same horizontal cut. Give each collection of pairwise vertex-disjoint simple polygons separating the marks the product of weights $2 x^(\| Gamma \|)$; polygons are unrooted and unoriented, and the empty collection has weight one. We prove that this partition function is $n^(1 \/ 6 + o \( 1 \))$. A finite disk transfer vector, normalized by polynomial interpolation, gives the partition function as a pairing of two disk vectors. To estimate it, replace the factor two per polygon by $2 cos theta$. The pairing has a scalar-gas representation. A reflection of its currents gives an upper bound for complex $theta$, while an independent determinant calculation fixes the scalar normalization. The resulting upper exponent is harmonic in $theta$. At zero polygon fugacity the partition function equals one. A maximum-principle argument, using this exact value and the monotonicity of the positive polygon sum, forces the upper exponent to be attained also at fugacity two.

To localize this cylinder calculation, we bound translation classes of large polygons and winding polygons on a cylinder. The small polygons around the two marks then contribute two copies of the same planar nesting sum; the remaining polygons cost only a bounded factor. This gives

$ Z_R \( f \) = R^(1 \/ 12 + o \( 1 \)) \, $

where $Z_R \( f \)$ sums nested polygons surrounding a planar face center $f$ and contained in its radius-$R$ ball. An exact finite exploration identity converts this sum into the weight of boundary paths visiting a bulk vertex. It gives the triangle law and, after sewing one exterior arm, the arch mean.

For bridges, both ends need exterior arms. A marked three-leg exploration identity first shows that enough bulk-visit mass has well-separated chord endpoints. Straight tubes with fixed endpoints, widening first tubes and routes with at most two bends supply two disjoint arms. Summing over possible sewing cuts produces many representations of one path; a weighted second-moment estimate controls that multiplicity and recovers the mass of distinct bridges. The resulting bridges stay in one fixed corridor. Summing over order $R^2$ bulk vertices and accounting for order $R$ starting ports gives the raw first-moment exponent $1 + 1 \/ 12 = 13 \/ 12$. The same nesting identity gives the unrestricted upper bound. Division by the bridge mass then yields the mean exponent $4 \/ 3$.

The boundary calculation occupies Sections 2–4. Sections 5–7 prove the cylinder partition estimate. Sections 8–10 pass to planar nesting and bulk visits. Section 11 proves the arch law; Sections 12 and 13 establish endpoint separation and complete the confined bridge proof.

== 2 Local exploration and the transfer row <c2:boundary>

We first determine the critical mass of a half-plane arch reaching height $T$, and the corresponding strip and endpoint masses. The exponent will be $1 \/ 4$. The calculation has two inputs: a positive bound from finite boundary exploration, and an exact equation for arcs on a half-cylinder. The latter requires a transfer row whose normalized fixed vector really counts the physical arcs. We construct that vector here and derive its endpoint exchange equations; Section 3 will solve them.

All positive path sums use the critical vertex weight $x = \( 2 cos \( pi \/ 8 \) \)^(- 1)$ from the introduction. A path specified by an unordered pair of endpoints is counted once. We use $lt.tilde$ for an upper bound up to a scale-independent constant, and $asymp$ for bounds in both directions.

=== 2.1 Finite exploration and a positive arch bound <finite-exploration-and-a-positive-arch-bound>

Write $upright(bold(a))_(j k) = j U + k V$ and $upright(bold(b))_(j k) = upright(bold(a))_(j k) + e_0$. Use the half-plane consisting of the vertices with $k gt.eq 0$, above the bottom wall $e_2 dot.op z = 1 \/ 2$. Let $h \( d \)$ be the mass of finite paths from $e_2 \/ 2$ to $e_2 \/ 2 + d U$, for $d in bb(Z) \\ { 0 }$. A multipath is a collection of paths with disjoint vertices and distinct endpoints.

Put

$ s = 3 \/ 8 \, #h(2em) lambda = pi \/ 8 \, #h(2em) r = pi s \, #h(2em) c = 2 cos r . $

The following finite exploration is a nonbacktracking form of the honeycomb parafermionic cancellation [3]. Let $D$ be a bounded convex polygon cut out by the admissible lines $e_nu dot.op z in 1 \/ 2 + \( 3 \/ 2 \) bb(Z)$. These lines avoid lattice vertices and cut edges orthogonally at their midpoints. Indeed the $e_nu$-levels of the $upright(bold(a))$ vertices lie in $\( 3 \/ 2 \) bb(Z)$, and increments toward the $upright(bold(b))$ vertices are $1 \, - 1 \/ 2 \, - 1 \/ 2$. Only one cut family passes through any port, so no port is a corner.

Start at a port $a$ and explore inward. At each fresh vertex take the two nonbacktracking turns by $plus.minus pi \/ 3$, with complex weights $x e^(plus.minus upright(i) s pi \/ 3)$. Their sum is one. Stop at the first exit or the first repeated vertex, before choosing another turn there. Thus a fresh vertex contributes one factor $x$, while the terminal repeated vertex contributes no new factor. There are finitely many histories, and their total complex weight is one.

A repeated-vertex history has a simple stem followed by one traversal of a simple polygon. The stem lies outside that polygon: it begins at the exterior source and cannot cross the polygon before the first repeat. At their attachment the unused third honeycomb edge is therefore exterior. A counterclockwise traversal of the closed polygon has turn $+ pi \/ 3$ at the attachment; entering from the stem and departing around the polygon replaces this by $- pi \/ 3$. The two possible traversals consequently add turns $+ 4 pi \/ 3$ and $- 4 pi \/ 3$ relative to the incoming stem. Their phase ratio is $e^(upright(i) s \( 8 pi \/ 3 \)) = - 1$, so all repeat histories cancel in pairs.

For a simple exit path from $a$ to $b$, its turn $W_(a b)$ depends only on the ports. It is the lifted increase of the outward-normal angle along the counterclockwise boundary from $a$ to $b$, minus $pi$. To see this, close the chord by the complementary counterclockwise boundary arc. The resulting Jordan polygon has total turn $2 pi$ and contributes $+ pi \/ 2$ at each of the two joins. In particular $\| W_(a b) \| lt.eq pi$. Writing $h_D \( a \, b \)$ for the positive mass of chords in $D$, we obtain

#[#set math.equation(numbering: n => "(2.1)")
 $ sum_b e^(upright(i) s W_(a b)) h_D \( a \, b \) = 1 . $ <c2:eq-1>]

Every summand’s real part is at least its positive mass times $cos \( pi s \) > 0$. Exhaust the half-plane by adding cuts $e_nu dot.op z lt.eq M$, $nu = 0 \, 1$, on the admissible grids. Bottom exits to the right and left have turns $- pi$ and $+ pi$, respectively. Monotone convergence of their positive masses and reflection symmetry give

#[#set math.equation(numbering: n => "(2.2)")
 $ h \( d \) = h \( - d \) \, #h(2em) c sum_(d > 0) h \( d \) lt.eq 1 . $ <c2:eq-2>]

This bound will control every component of the finite-cylinder transfer vector without assuming the boundary exponent that we seek.

=== 2.2 The local diagram weights and braid identity <the-local-diagram-weights-and-braid-identity>

We use the trigonometric dilute-loop weights in [10]. The normalized coefficients below also follow by dividing the weights in [21] Eq. (1.2) by their empty-tile weight. Their diagram algebra is the braid–monoid calculus of Grimm and Pearce [11] Eq. (4.20). Boundary contractions depend on the gauge. We therefore fix the coefficients explicitly and verify the braid identity in this normalization. This identity will let an adjacent column exchange pass through the transfer row.

Put $S = 3 lambda \, med a_0 = 2 lambda \, med b = sin \( 2 lambda \) = cos \( 2 lambda \) \, med d = sin \( 3 lambda \) = cos lambda$, and

$ P_u = sin u \, quad Q_u = sin \( S - u \) \, quad I_u = sin \( a_0 - u \) \, quad J_u = sin \( u - lambda \) . $

Make a two-strand braid box $caron(R) \( u \)$ with ports in order input left, input right, output right, output left around the box. Use weights below, all divided by $T_u$:

$ upright("configuration") & upright("numerator")\
nothing & T_u = b d + P_u Q_u = sin \( 2 lambda + u \) sin \( 3 lambda + u \)\
upright("one strand at the same position in/out") & A_u = b Q_u\
upright("one input cap or one output cup") & B_u = b P_u\
upright("one strand changing position") & C_u = P_u Q_u\
upright("both through at same positions") & D_u = I_u Q_u\
upright("cap and cup") & E_u = J_u P_u . $

Figure 1(a) fixes the cyclic order used by the table. A rotation of a box rotates its ports and connectivities together.

Only noncrossing diagrams are used. In compositions sum linearly over compatible diagrams (occupancies must match at glued ports, and strands concatenate), discarding terms with any closed loop. An untouched line has the vacant identity term and the single through-strand identity term.

In this calculus the boxes satisfy the additive braid identity

#[#set math.equation(numbering: n => "(2.3)")
 $ caron(R)_1 \( v \) caron(R)_2 \( u + v \) caron(R)_1 \( u \) = caron(R)_2 \( u \) caron(R)_1 \( u + v \) caron(R)_2 \( v \) \, $ <c2:eq-3>]

where the subscripts are first and second neighboring pairs among three lines. Here is a verification using unnormalized weights (the denominators are common). Under $u mapsto S - u$ the box turns a quarter turn in the diagram sense, i.e. $A \, B$ exchange and $D \, E$ exchange (other weights unchanged).

In the three boxes of the left side of (2.3) the six external ports in order (three inputs left to right, then three outputs right to left) belong in consecutive pairs to the first, middle and last crossings (input first ordering). The remaining ports form the internal triangle (each box connects to the next and the previous). Thus write the external pairs as $L_i \, R_i \; med L_j \, R_j \; med L_k \, R_k$ in cyclic order, with box parameters $i \, j \, k$ respectively, satisfying $i + j + k = S$ (these parameters are $u \, S - u - v \, v$; the middle box has used the quarter turn). In each box $B$ pairs the two exterior (or two interior) ports, and $A$ connects an exterior port to the nearest interior port ($R$ towards the next tile, $L$ towards the previous); $D$ gives both latter connections, $E$ gives both caps, $C$ gives one opposite connection.

For the right side of (2.3) the whole placement, with the parameters, shifts by three external ports (the $u$-box is now last at outputs three and two, and the $v$-box first at inputs two and three). We just need invariance of all connectivity weights under this inversion of the boundary data.

Figure 1(b) records this triangle incidence and the boundary inversion. The picture allows the connectivity comparison to be made independently of geometric rhombus angles.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-4.15, -0.37), (-2.55, 0.67), fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  content((-3.35, 0.15), [#text(size: 9pt)[$caron(R) (u)$]])
  line((-3.79, -0.746), (-3.79, -0.37), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((-3.79, 0.67), (-3.79, 1.046), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((-2.91, -0.746), (-2.91, -0.37), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((-2.91, 0.67), (-2.91, 1.046), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  circle((-3.79, -0.746), radius: 0.04939, fill: black, stroke: none)
  content((-3.79, -0.746), [#text(size: 9pt)[input left]], anchor: "north-east", padding: 0.1176cm)
  circle((-2.91, -0.746), radius: 0.04939, fill: black, stroke: none)
  content((-2.91, -0.746), [#text(size: 9pt)[input right]], anchor: "north-west", padding: 0.1176cm)
  circle((-2.91, 1.046), radius: 0.04939, fill: black, stroke: none)
  content((-2.91, 1.046), [#text(size: 9pt)[output right]], anchor: "south-west", padding: 0.1176cm)
  circle((-3.79, 1.046), radius: 0.04939, fill: black, stroke: none)
  content((-3.79, 1.046), [#text(size: 9pt)[output left]], anchor: "south-east", padding: 0.1176cm)
  line((-2.214, -0.21), (-2.214, 0.51), stroke: (paint: rgb("#4d4d4d"), thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: ">"))
  content((-2.134, 0.15), [#text(size: 7pt)[cyclic order]], anchor: "west", padding: 0.1176cm)
  content((-3.35, -1.97), [#text(size: 9pt)[\(a\) A single box]])
  rect((2.816, 1.002), (3.584, 1.598), fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((2.979, 1.598), (2.979, 1.982), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((3.421, 1.598), (3.421, 1.982), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((2.61, -0.6838), (2.226, -0.01865), (1.711, -0.3162), (2.095, -0.9814), close: true, fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((2.013, -0.84), (1.681, -1.032), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((1.793, -0.4576), (1.46, -0.6496), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((4.174, -0.01865), (3.79, -0.6838), (4.305, -0.9814), (4.689, -0.3162), close: true, fill: rgb("#f6f6f6"), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((4.607, -0.4576), (4.94, -0.6496), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((4.387, -0.84), (4.719, -1.032), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((2.979, 1.002), (2.308, -0.16), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((2.529, -0.5424), (3.871, -0.5424), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((4.092, -0.16), (3.421, 1.002), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10))
  content((3.2, 1.3), [#text(size: 9pt)[$i$]])
  content((2.161, -0.5), [#text(size: 9pt)[$j$]])
  content((4.239, -0.5), [#text(size: 9pt)[$k$]])
  circle((3.421, 1.982), radius: 0.04233, fill: black, stroke: none)
  circle((2.979, 1.982), radius: 0.04233, fill: black, stroke: none)
  circle((1.46, -0.6496), radius: 0.04233, fill: black, stroke: none)
  circle((1.681, -1.032), radius: 0.04233, fill: black, stroke: none)
  circle((4.719, -1.032), radius: 0.04233, fill: black, stroke: none)
  circle((4.94, -0.6496), radius: 0.04233, fill: black, stroke: none)
  content((3.421, 1.982), [#text(size: 9pt)[$L_i#h(0.3333em) (1)$]], anchor: "south-west", padding: 0.1176cm)
  content((2.979, 1.982), [#text(size: 9pt)[$R_i#h(0.3333em) (2)$]], anchor: "south-east", padding: 0.1176cm)
  content((1.46, -0.6496), [#text(size: 9pt)[$L_j#h(0.3333em) (3)$]], anchor: "south-east", padding: 0.1176cm)
  content((1.681, -1.032), [#text(size: 9pt)[$R_j#h(0.3333em) (4)$]], anchor: "north-east", padding: 0.1176cm)
  content((4.719, -1.032), [#text(size: 9pt)[$L_k#h(0.3333em) (5)$]], anchor: "north-west", padding: 0.1176cm)
  content((4.94, -0.6496), [#text(size: 9pt)[$R_k#h(0.3333em) (6)$]], anchor: "south-west", padding: 0.1176cm)
  content((3.2, -1.868), [#text(size: 9pt)[\(b\) Internal triangle: $i+j+k=S$]])
  content((3.2, -2.262), [#text(size: 7pt)[inversion: $1 arrow.l.r 4$, $2 arrow.l.r 5$, $3 arrow.l.r 6$]])
})],
  caption: [Figure 1: (a) The four ports of a braid box, in cyclic order. (b) After rotating the middle box in the three-box product, the exterior ports occur in the numbered cyclic order shown. An edge between boxes is a glued internal edge. The opposite product uses the boundary data shifted by three positions, as indicated. The picture records incidence and cyclic order, rather than geometric rhombus angles. ],
) <fig:box-order>

Here is the nontrivial scalar list for this comparison (up to cyclic triangle symmetry, reflection and reversing the comparison):

$ & upright("weight") & upright("after inversion")\
2 upright(" ports") \, L_i \, R_i & B_i T_j T_k + D_i B_j B_k & T_i A_j A_k + B_i C_j C_k\
2 \, med L_i \, L_j & C_i A_j T_k + A_i C_j B_k & A_j C_k T_i + C_j A_k B_i\
4 \, med L_i \, R_i upright(" absent") & T_i B_j B_k + B_i \( D_j E_k + E_j D_k \) & D_i A_j A_k\
 & B_i D_j D_k & B_i C_j C_k + E_i A_j A_k\
4 \, med L_i \, L_j upright(" absent") & A_i C_j B_k + C_i A_j E_k & A_j C_k D_i\
6 & B_i B_j B_k + sum_(upright("cyc")) D_i E_j E_k & D_i D_j D_k . $

For example, in the first line only $L_i \, R_i$ are occupied. They can pair directly in box $i$, leaving boxes $j \, k$ empty, with weight $B_i T_j T_k$. Otherwise $D_i$ sends both endpoints into the triangle, and caps in $j \, k$ complete the route, with weight $D_i B_j B_k$. After inversion the active endpoints are $R_j \, L_k$. Their route through the $j$–$k$ edge has weight $T_i A_j A_k$; the route through box $i$ has weight $B_i C_j C_k$.

Indeed internal occupancies have even parity combined with external ones at each box. For all exterior counts even per box, this means no internal strands or else all three internal edges active (a closed internal triangle contributes zero); for two odd counts they are linked by either of the two paths in the triangle, with the two possible pairings at any box having degree four.

For four ports with $L_i \, R_i$ absent the first line for that case pairs the exterior pairs within $j \, k$, the second exchanges. With $L_i \, L_j$ absent the displayed line pairs $R_i \, R_j$ to each other and $L_k \, R_k$ to each other; the other equality just switches $k \, i$. The six-port comparison shown pairs within each exterior pair versus pairing across the gaps. Cases with only two opposite ports occupied or only two opposite absent have matchings themselves invariant under inversion, as do the three remaining matchings in the six-port case (those with one within-box exterior pair and one opposite pair). Together with the empty exterior this exhausts the cases: a two-site subset (occupied or absent) is at separation one, two or three along the hexagon.

For clarity the two columns agree by the following identities. $Q_j Q_k = P_j P_k + d P_i$, $C_j + C_k = C_i + 2 cos i thin P_j P_k$, $I_j I_k - P_j P_k = b J_i$, $I_i Q_k - P_i J_k = b P_j$ by angle sums. The difference in line one, divided by $b^2$, reduces to $P_j P_k \[ D_i - b d + P_i sin \( S + i \) \]$, zero ($D_i = T_(- i)$).

In line two use $T = b d + C \, med C_i - C_k = P_j sin \( i - k \)$, $Q_i P_k - Q_k P_i = d sin \( k - i \)$. In line four cancel $b P_i Q_j Q_k$ to use $I_j I_k = P_j P_k + b J_i$, and in line five cancel $b Q_i Q_j P_k$ to use $I_i Q_k = b P_j + P_i J_k$; as throughout one can check generic parameters and then continue.

Line three, using $Q_j Q_k = P_j P_k + d P_i$ and $D_i - T_i = - 2 d P_i cos i$, reduces to

$ D_j E_k + E_j D_k = b d \( D_i - 2 cos i thin P_j P_k \) . $

To check it put $tau_u = 2 u - lambda$, so $D_u = \( d - sin tau_u \) \/ 2 \, med E_u = \( d - cos tau_u \) \/ 2$. The left hand side is $d^2 \/ 2 + cos \( 2 i \) \/ 4 - b d cos i cos \( j - k \)$ using $tau_j + tau_k = 4 lambda - 2 i$; $D_i + cos i cos \( S - i \) = b d + sin lambda cos \( 2 i \)$ and $b d sin lambda = 1 \/ 4$.

Finally $2 \( D_u + upright(i) E_u \) = d \( 1 + upright(i) \) - upright(i) e^(upright(i) lambda - 2 upright(i) u)$, hence

$ 8 thin Re product_(u = i \, j \, k) \( D_u + upright(i) E_u \) = - b d + b sum_(u = i \, j \, k) sin \( S - 2 u \) = 8 b^3 P_i P_j P_k . $

Here expansion gives constant real part $- 2 d^3 + d = - b d$; the linear real part is $Re \[ d \( e^(2 upright(i) lambda) - upright(i) \) sum_u e^(- 2 upright(i) u) \]$ where $d \( e^(2 upright(i) lambda) - upright(i) \) = b e^(- upright(i) lambda)$. Here also $sum_(u = i \, j \, k) sin \( S - 2 u \) - sin S = 4 P_i P_j P_k$. This checks line six (first for real parameters, so also analytically). This proves (2.3) as a meromorphic identity per disk connectivity, hence also when glued into larger diagrams.

=== 2.3 The physical half-cylinder vacuum <the-physical-half-cylinder-vacuum>

The local identity now lets us compare neighboring rapidity orders. Before using it, we construct the analytic vector to which it will be applied and identify its homogeneous coordinates with positive path masses.

Next take the quotient by $N U$ (circle direction), $N gt.eq 3$, using the same half-plane bottom; closed loops of any kind will be given weight zero. Index the $N$ cut ports $1 \, dots.h \, N$ cyclically in the positive $U$ direction. A state at the cut records some ports paired by disjoint simple (compact) arcs in the upper half-cylinder, including for each pair the relative homotopy of that arc, equivalently which lifts of the ports are joined (modulo simultaneous translation by periods). Each arc, lifted, connects endpoints less than $N$ spacings apart (otherwise endpoints interlace with those of a translate, impossible by disjointness in the half-plane; equality projecting to one endpoint is disallowed). The disk side of the arc at the cut thus gives an interval from one endpoint to the other in the positive circle direction (lifted left endpoint to lifted right endpoint). In particular there are finitely many states. Denote the mass of a single arc with interval from $i$ to $j$, $i eq.not j$, by $H_(i j) \( 0 \)$; we will deform this to an analytic function $H_(i j) \( bold(eta) \)$ near $bold(eta) = 0$.

Form a transfer row $cal(T) \( bold(eta) \)$ on cylinder states by sending an auxiliary line from left to right once around the circle across the $N$ vertical lines (input above, output below), with $caron(R) \( lambda + eta_j \)$ at the crossing with column $j$. Thus a cell uses left, upper side as ordered input ports and lower, right side as ordered outputs. Glue the auxiliary ends, and as before discard any closed loops. At $eta_j = 0$ all these cells describe exactly the weighted honeycomb trajectories: the cell with $upright(bold(a))_(j k) \, upright(bold(b))_(j k)$ as its two vertices has its left and lower ports incident to the former (towards $upright(bold(b))_(j - 1 \, k) \, upright(bold(b))_(j \, k - 1)$), and upper and right to the latter (towards $upright(bold(a))_(j \, k + 1) \, upright(bold(a))_(j + 1 \, k)$). Thus successive cuts can be indexed by the same columns, with a translation in the actual plane between levels. At $u = lambda$ we have $A_u \/ T_u = x \, med B_u \/ T_u = C_u \/ T_u = D_u \/ T_u = x^2 \, med E_u = 0$, precisely allowing the two vertices once each.

The empty component is preserved by a row: closing off any nonempty input without an output would create a loop, whose weight is zero. In a basis starting with the empty state the transfer matrix therefore has block form

$ mat(delim: "(", 1, 0; g, K) . $

At homogeneity, applying its $h$th power to the empty state gives

$ cal(T) \( 0 \)^h binom(1, 0) = binom(1, sum_(m = 0)^(h - 1) K \( 0 \)^m g \( 0 \)) . $

These coordinates count multipaths in finite row stacks and are bounded componentwise as $h$ increases. For each prescribed state, lift its arcs to the half-plane and discard mutual avoidance and avoidance of period translates. The resulting product of one-arc masses is finite by (2.2).

Every nonempty state is accessible with positive weight. Its lifted cut intervals form a periodic laminar family. Remove an innermost pair whose open interval contains no other active port, and construct the remaining state inductively. In one additional row below that stack, insert the removed pair by a lower-to-right corner, horizontal passages along its interval, and a left-to-lower corner at the other endpoint. Propagate all other active ports by single upper-to-lower strands in their columns. All these homogeneous weights are positive, and the chosen open interval has no active port to obstruct the insertion.

Write $e_alpha$ for a coordinate vector of the nonempty-state space. Accessibility gives an integer $j_alpha gt.eq 0$ and a constant $C_alpha < oo$ such that $e_alpha lt.eq C_alpha K \( 0 \)^(j_alpha) g \( 0 \)$ componentwise. Hence

$ sum_(m gt.eq 0) K \( 0 \)^m e_alpha lt.eq C_alpha sum_(m gt.eq 0) K \( 0 \)^(m + j_alpha) g \( 0 \) < oo . $

Thus $sum_m K \( 0 \)^m$ converges entrywise. In particular $1 - K \( 0 \)$ is invertible, and the normalized fixed vector

$ Psi \( bold(eta) \) = #scale(x: 120%, y: 120%)[\(] 1 \, \( 1 - K \( bold(eta) \) \)^(- 1) g \( bold(eta) \) #scale(x: 120%, y: 120%)[\)] $

exists analytically near zero and is unique with empty component one. Positivity was used at homogeneity; the nearby coordinates may be complex. Its single-arc components $H_(i j)$ agree at homogeneity with the excursion sums above by increasing the finite row stacks from empty. It rotates covariantly by construction.

===== 2.3.1 Endpoint exchange. <endpoint-exchange.>

For $u = eta_(ell + 1) - eta_ell$ and $S_ell$ the parameter swap (positions $ell \, ell + 1$), (2.3) moves the box $caron(R)_ell \( u \)$ through the row and intertwines it with the swapped row. Indeed the crossing parameters are differences of successive visiting lines’ labels (right minus left for the ordered inputs, exchanging labels at outputs), with auxiliary label $- lambda$: at the two columns (take $1 lt.eq ell < N$) formula (2.3) uses the ordered labels $- lambda \, eta_ell \, eta_(ell + 1)$, sliding the column exchange from below the two auxiliary crossings to above them. Thus $caron(R)_ell \( u \) Psi \( bold(eta) \) = Psi \( S_ell bold(eta) \)$ by uniqueness and preservation of the empty projection. The one-arc coordinates satisfy a closed system. If one of $i \, j$ equals $ell$ or $ell + 1$ and the other lies outside this pair, then

$ T_u H_(i j) \( S_ell bold(eta) \) = A_u H_(i j) \( bold(eta) \) + C_u H_(i' j') \( bold(eta) \) \, $

where the prime switches $ell \, ell + 1$ on indices. Moving one port across the neighbor preserves the oriented interval type. For the two neighboring interval types the equations are

#[#set math.equation(numbering: n => "(2.4)")
 $ T_u H_(ell \, ell + 1) \( S_ell bold(eta) \) & = D_u H_(ell \, ell + 1) \( bold(eta) \) + B_u \,\
T_u H_(ell + 1 \, ell) \( S_ell bold(eta) \) & = D_u H_(ell + 1 \, ell) \( bold(eta) \) . $ <c2:eq-4>]

These equations use only one-arc coordinates. Outside the exchanged pair, occupancies are unchanged; inside it, a box cannot remove an additional arc while retaining an active output port. A cap on an already paired input pair creates a loop and gives zero. Insertion from the vacuum creates only the short interval $ell arrow.r ell + 1$, explaining the source term $B_u$.

== 3 A rapidity orbit and an inverse-matrix formula <sec:orbit>

The preceding construction gives analytic one-arc masses $H_(i j)$ near homogeneity. We now calculate a particular sum of these masses. Put $gamma = 2 lambda$, $q = e^(upright(i) gamma)$ and $kappa = q^(- 1) - q$, so $q^2 = upright(i)$ and $q^3 = - q^(- 1)$. For distinct rapidities write $x_i = e^(2 upright(i) eta_i)$; these multiplication variables are separate from the critical path weight $x$.

#thm([Proposition 3.1.])[
  (The half-cylinder inverse pairing).  #emph[For $N gt.eq 3$ and generic distinct rapidities sufficiently near zero, define 
$ cal(C)_(i j) = frac(1, x_i + q x_j) #h(2em) \( 1 lt.eq i \, j lt.eq N \) . $

 Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_i x_i - c sum_(i eq.not j) e^(upright(i) \( eta_i + eta_j \)) H_(i j) \( bold(eta) \) = upright(bold(1))^(sans(T)) \( cal(C)^(sans(T)) + q cal(C) \)^(- 1) upright(bold(1)) . $ <c2:eq-9>]

 The scalar pairing on the right has a removable continuation to a neighborhood of homogeneous rapidities. This does not assert that the matrix inverse itself extends to coincident rapidities.]
] <prop:boundary-inverse>

We prove the formula on a finite permutation orbit and then continue it. The same Cauchy matrix will appear in the generalized eigenproblem for the one-coordinate reduction. Endpoint exchange first gives operators on the $N !$ points of that orbit. An $N$-dimensional space of functions of one coordinate supplies their spectral information. We use that information to show that every operator commuting with the endpoint transports is scalar, and finally compute the scalar that sums the arc coordinates.

=== 3.1 Endpoint transport on a finite orbit <endpoint-transport-on-a-finite-orbit>

Let $N$ be fixed and work on the permutation orbit of $eta_j = \( j - 1 \) epsilon.alt$ for sufficiently small real $epsilon.alt > 0$. Functions live on $N !$ tuples. The multiset of the $x_i$ is fixed throughout. Operators permuting variables in a function are $s_l$ for the swap of $l \, l + 1$ and $rho f \( eta \) = f \( eta_2 \, dots.h \, eta_N \, eta_1 \)$. Put

$ delta = product_(i < j) sin \( S + eta_i - eta_j \) \, quad Omega = delta rho delta^(- 1) \, #h(2em) F_(i j) = delta e^(upright(i) \( eta_i + eta_j - S \)) H_(i j) . $

Thus $Omega delta = delta \, med Omega F_(i j) = F_(i + 1 \, j + 1)$ using rotation covariance. Define, for $l < N$ and $u = eta_(l + 1) - eta_l$,

$ g_l = frac(sin \( gamma + u \), sin u) thin s_l - frac(b e^(upright(i) u), sin u) = A \( x_l \, x_(l + 1) \) thin s_l + B \( x_l \, x_(l + 1) \) \, quad B \( v \, w \) = kappa thin frac(w, w - v) \, quad A = q^(- 1) - B . $

By (2.4) and the single-endpoint equation preceding it, applying $g_l$ to $F_(i j)$ moves an endpoint at $l$ to $l + 1$ if the other endpoint is not at $l + 1$ (leaving the order of the two labels fixed). For the neighboring pair, with $g = g_1$, the two equations are

#[#set math.equation(numbering: n => "(3.2)")
 $ \( g + q \) F_12 = x_1 \( g - 1 \) delta \, #h(2em) \( g + q \) F_21 = 0 . $ <c2:eq-5>]

Indeed under the swap the $delta$ ratio (swapped over original) is $sin \( S + u \) \/ sin \( S - u \)$. For a moving endpoint at $l$, the swap also contributes $e^(upright(i) u)$ from its exponential, so the swapped term of $g_l$ uses the multiplier $e^(upright(i) u) T_u \/ \( P_u Q_u \)$ relative to the original prefactor. The $A_u$ term then cancels the unswapped multiplication of $g_l$, and the $C_u$ term gives the moved $F$. With both sites occupied there is no extra swap exponential; $I_u - b e^(upright(i) u) = - q P_u$, so only the source survives after adding $q$. For the short neighboring arc equation it is $b e^(upright(i) \( eta_1 + eta_2 - S \)) delta \/ sin \( S - u \) = x_1 \( g - 1 \) delta$, the latter by $T_u - P_u Q_u = b d$, $d - e^(upright(i) u) Q_u = e^(upright(i) \( u - S \)) P_u$.

We give details of the operator calculation on this orbit. The following relations hold:

#[#set math.equation(numbering: n => "(3.3)")
 $ g_l^2 = 1 + kappa g_l \, quad g_l g_(l + 1) g_l = g_(l + 1) g_l g_(l + 1) \, quad \[ g_l \, g_j \] = 0 med \( \| l - j \| > 1 \) \, quad g_l x_l = x_(l + 1) g_l^(- 1) \, $ <c2:eq-6>]

for ordinary indices less than $N$ (other $x_j$ commute if $j eq.not l \, l + 1$). These follow from the formulas: $B \( v \, w \) + B \( w \, v \) = kappa \, med A \( v \, w \) A \( w \, v \) = 1 + B \( v \, w \) B \( w \, v \)$, and on any triple $v \, w \, z$ $B \( v \, w \) B \( w \, z \) = B \( v \, z \) \( B \( v \, w \) + B \( w \, z \) - kappa \)$. In the braid expansion the length 2 and 3 permutations agree at once, the identity terms are $B \( v \, w \)^2 B \( w \, z \) + A \( v \, w \) A \( w \, v \) B \( v \, z \)$ and its counterpart $B \( w \, z \)^2 B \( v \, w \) + A \( w \, z \) A \( z \, w \) B \( v \, z \)$; for the swap of $v \, w$ the factors besides $A \( v \, w \)$ are $B \( v \, z \) B \( w \, v \) + B \( v \, w \) B \( w \, z \) = B \( w \, z \) B \( v \, z \)$, and likewise for $w \, z$. Also

$ Omega = d_1 rho \, #h(2em) d_i = product_j frac(x_i + q x_j, x_j + q x_i) . $

Indeed each factor of the rotation ratio has that form using $e^(2 upright(i) S) = q^3$. Thus $Omega^N = 1 \, med Omega g_l Omega^(- 1) = g_(l + 1) med \( l < N - 1 \) \, med Omega^2 g_(N - 1) Omega^(- 2) = g_1$ (in the last identity $d_1 d_2$ commutes with $s_1$). We can use cyclic indices, with $g_N$ defined by rotating; all the local relations rotate with them.

=== 3.2 The spectral reduction and scalar commutant <the-spectral-reduction-and-scalar-commutant>

The endpoint calculation will use two properties of this representation: every operator commuting with $g_1 \, dots.h \, g_(N - 1) \, Omega$ is scalar, and $q^2 - Y^2$ is invertible, where

$ M = Omega g_(N - 1) dots.h.c g_2 \, #h(2em) Y = M g_1 . $

Here and below small $epsilon.alt > 0$ may depend on $N$.

===== 3.2.1 Commuting transports. <commuting-transports.>

Set $Y_1 = Y$ and $Y_(l + 1) = g_l^(- 1) Y_l g_l^(- 1)$. We first establish their commutation relations directly from the braid relations. $Y$ commutes with $g_j$, $2 lt.eq j < N$, by rotating and braiding $g_(j - 1)$ through $g_(N - 1) dots.h.c g_1$. More generally $g_j$ commutes with $Y_i$ for ordinary $j eq.not i - 1 \, i$: for $j gt.eq i + 1$ this follows already by recursion, and $g_j$ passes through $g_(j + 1)^(- 1) g_j^(- 1)$ as $g_(j + 1)$, commutes then with $Y_j$, and passes back through $g_j^(- 1) g_(j + 1)^(- 1)$ as $g_j$. This handles $Y_(j + 2)$ and thus later indices. $Y_1 Y_2 = M^2$ commutes with $g_1$: it is $Omega^2 \( g_(N - 2) dots.h.c g_1 \) \( g_(N - 1) dots.h.c g_2 \)$, and $g_1$ passes through the rotation as $g_(N - 1)$, then through the two words as $g_1$. For the last step note their product begins $g_(N - 2) g_(N - 1)$ times the analogous product one size smaller; braid and induct down to the ordinary braid at size three. Thus $Y_2 Y_1 = g_1^(- 1) \( Y_1 Y_2 \) g_1 = Y_1 Y_2$.

All $Y_i$ commute by induction: commutation at $j \, j + 1$ implies it at $j \, j + 2$ by $g_(j + 1)^(- 1)$, then at $j + 1 \, j + 2$ by $g_j^(- 1)$, and distant pairs follow similarly. Finally $g_l$ commutes with $Y_l Y_(l + 1)$ and $Y_l + Y_(l + 1)$ by the recursion and $g_l - g_l^(- 1) = kappa$ (for the product use $g_l Y_(l + 1) = Y_l g_l^(- 1)$, $g_l^(- 1) Y_l = Y_(l + 1) g_l$ and the commuting pair). Hence the elementary symmetrics in the $Y_i$ commute with all generators (use $Y_1$ and the $g$’s to express $Omega$).

Let $upright(bold(e))$ be the constant function one, and let $cal(W)$ be the span of all words in $g_1 \, dots.h \, g_(N - 1) \, Omega$ applied to $upright(bold(e))$. The common $q^(- 1)$ eigenspace of the ordinary $g_l$ is exactly the line $bb(C) upright(bold(e))$: because $A eq.not 0$ for our small distinct rapidities, those eigen-equations are precisely permutation symmetry. Each coefficient of $product_i \( y - Y_i \)$ commutes with the generators, so it preserves that line. It follows that there is a scalar monic polynomial $p \( y \)$ of degree $N$ with

$ product_i \( y - Y_i \) = p \( y \) I quad upright("on ") cal(W) . $

As the $Y_i$ commute, substitution gives $p \( Y_i \) = 0$ on $cal(W)$. We will identify the roots of $p$ without assuming that $cal(W)$ is already the full orbit space.

===== 3.2.2 Reduction to one coordinate. <reduction-to-one-coordinate.>

Let $cal(V)_1$ be the $N$-dimensional space of functions of $x_1$ alone. It is the common $q^(- 1)$ eigenspace of $g_l$, $2 lt.eq l < N$, which express symmetry in sites $2 \, dots.h \, N$. Since $Y$ commutes with these operators, it preserves $cal(V)_1$. We coordinatize this space by values $f \( xi_i \)$ where $xi_i = e^(2 upright(i) \( i - 1 \) epsilon.alt)$; write

$ P \( z \) = product_i \( z - xi_i \) \, quad d \( z \) = product_i frac(z + q xi_i, xi_i + q z) \, #h(2em) \( L f \) \( xi_i \) = q^(1 - N) d \( xi_i \) f \( q^2 xi_i \) . $

In $L$, the input $f$ is interpreted as the interpolation polynomial of degree less than $N$. With $J_i = d \( xi_i \) xi_i P' \( xi_i \)$ as diagonal components one has

#[#set math.equation(numbering: n => "(3.4)")
 $ Y \|_(cal(V)_1) = "diag" \( J \) med L^(sans(T)) med "diag" \( J \)^(- 1) . $ <c2:eq-7>]

In fact for $h_w \( z \) = z \/ \( z - w \)$,

$ g_l h_w \( x_l \) = q^(- 1) frac(x_l - q^2 w, x_l - w) thin h_w \( x_(l + 1) \) \, quad Y h_w \( x_1 \) = q^(1 - N) d_1 thin frac(P \( q^2 w \), P \( w \)) h_(q^2 w) \( x_1 \) . $

Taking residues at $w = xi_j$ gives $Y_(i j) = q^(1 - N) d \( xi_i \) P \( q^2 xi_j \) xi_i \/ \[ xi_j P' \( xi_j \) \( q^2 xi_j - xi_i \) \]$, proving (3.4) by interpolation.

===== 3.2.3 A positive limiting moment problem. <a-positive-limiting-moment-problem.>

We claim $L$ has $N$ distinct eigenvalues near positive numbers (as $epsilon.alt arrow.r 0$), and $upright(bold(e))$ is cyclic for (3.4) on $cal(V)_1$. Write $D \( z \) = product_i \( z + q xi_i \)$; then $d \( z \) = q^N D \( z \) \/ D \( q^2 z \)$. The partial fractions $f \( z \) \/ D \( z \) = sum_j v_j \/ \( z + q xi_j \)$ for the input polynomial reduce $L f = y f$ to

$ cal(C)^(sans(T)) v = y cal(C) v \, #h(2em) cal(C)_(i j) = frac(1, xi_i + q xi_j) . $

To take the confluence write $eta_i^0 = \( i - 1 \) epsilon.alt$. Extract the common matrix factors

$ \( e^(- upright(i) lambda) \/ 2 \) e^(- upright(i) eta_i^0) e^(- upright(i) eta_j^0) . $

The entries of $cal(C) \, cal(C)^(sans(T))$ respectively become

$ sec \( eta_i^0 - eta_j^0 - lambda \) \, #h(2em) sec \( eta_i^0 - eta_j^0 + lambda \) . $

Use

#[#set math.equation(numbering: n => "(3.5)")
 $ sec z = integral_(bb(R)) e^(z t) w_0 \( t \) thin d t \, #h(2em) w_0 \( t \) = frac(1, 2 cosh \( pi t \/ 2 \)) \, quad \| Re z \| < pi \/ 2 . $ <c2:eq-8>]

For real $z$ this follows by shifting the contour in $t$ up by $2 upright(i)$ and taking the residue at $upright(i)$ (the exponential decay controls the ends, and for the integral $I$ one gets $\( 1 + e^(2 upright(i) z) \) I \( z \) = 2 e^(upright(i) z)$); the rest by analyticity. Thus $alpha \( t \) = sum v_j e^(- upright(i) eta_j^0) e^(- eta_j^0 t)$ paired against the rows $e^(eta_i^0 t)$ solves the moment eigenproblem for weights $e^(lambda t) w_0$ relative to $e^(- lambda t) w_0$. In polynomial-like bases

$ U_m^epsilon.alt \( t \) = \( \( e^(epsilon.alt t) - 1 \) \/ epsilon.alt \)^m \, quad V_m^epsilon.alt \( t \) = \( \( 1 - e^(- epsilon.alt t) \) \/ epsilon.alt \)^m #h(2em) \( 0 lt.eq m < N \) $

for rows and for $alpha$, the two matrices converge by dominated convergence to positive definite real symmetric polynomial moment matrices (fixed $N$; each powered difference quotient bounded by a polynomial times $e^(N epsilon.alt \| t \|)$). This positive definite limiting pair has positive generalized eigenvalues and is diagonalizable.

Each nonzero real limiting eigenpolynomial $r$ satisfies that $r \( t \) \( e^(lambda t) - y e^(- lambda t) \)$ is orthogonal to all polynomials of degree less than $N$ for $w_0$. It must have at least $N$ real sign changes (otherwise multiply by the product of linear factors at the sign changes). Since the exponential difference for $y > 0$ has just one zero, $r$ hence has degree $N - 1$ with all simple real zeros and $r \( upright(i) \) eq.not 0$. If two linearly independent eigenpolynomials had the same eigenvalue, a linear combination would cancel their leading coefficient, contradicting the required degree $N - 1$. Thus every eigenvalue is simple.

By convergence of that finite matrix pair (invert the nonsingular denominator), for small $epsilon.alt > 0$ the eigenvalues are distinct, tending to those simple limits, and $alpha \( upright(i) \) = sum v_j \/ xi_j eq.not 0$ for any eigenvector (normalize coefficients in $V^epsilon.alt$; any converging eigenvector subsequence gives a nonzero scalar multiple of a limiting real eigenpolynomial).

===== 3.2.4 Cyclicity and the full orbit. <cyclicity-and-the-full-orbit.>

For a left eigenvector of (3.4) obtained from $f$, its pairing with $upright(bold(e))$ is

$ sum_i f \( xi_i \) \/ J_i = q^(1 - N) / y sum_i frac(f \( q^2 xi_i \), xi_i P' \( xi_i \)) = - q^(1 - N) / y frac(f \( 0 \), P \( 0 \)) eq.not 0 $

by interpolation and $f \( 0 \) = D \( 0 \) q^(- 1) alpha \( upright(i) \)$. Since every left eigenline has nonzero pairing with $upright(bold(e))$ and the eigenvalues are distinct, this proves the cyclicity (polynomial interpolation in $Y$).

Cyclicity has placed the whole space $cal(V)_1$ inside $cal(W)$. Since $p \( Y \) = 0$ there, the degree-$N$ polynomial $p$ has exactly the $N$ distinct eigenvalues just found as its roots. For small enough $epsilon.alt$, none has square $q^2$, and no two have ratio $q^(plus.minus 2)$: their limits are distinct positive numbers, whereas $q^(plus.minus 2) = plus.minus upright(i)$.

The commuting operators $Y_i$ on $cal(W)$ therefore simultaneously diagonalize. On a joint eigenvector, the identity $product_i \( y - Y_i \) = p \( y \) I$ says that its eigenvalue tuple is a permutation of the $N$ roots, each used once. Suppose neighboring entries are $a \, b'$. Commutation with every other $Y_i$ and with $Y_l + Y_(l + 1)$ and $Y_l Y_(l + 1)$ implies that $g_l$ can send this vector only into the joint eigenspaces with the original tuple or the tuple with these entries swapped. If the swapped component vanished, the relation $g_l Y_(l + 1) = Y_l g_l^(- 1)$ would imply

$ b' g_l v = a \( g_l - kappa \) v . $

Together with (3.3), this forces $b' \/ a = q^(plus.minus 2)$, which was excluded. Thus the swapped component is nonzero.

Starting from any joint eigenvector and successively swapping adjacent entries produces all $N !$ distinct tuples in $cal(W)$. The ambient space of functions on the orbit has dimension $N !$. Hence $cal(W)$ is that entire space and every joint eigenspace is one-dimensional. An operator commuting with the generators is diagonal on these joint eigenspaces; the nonzero adjacent connections force all its diagonal entries to agree. Its value is therefore scalar. The same spectrum also proves that $q^2 - Y^2$ is invertible.

=== 3.3 Summing the endpoint equations <summing-the-endpoint-equations>

The orbit calculation has now supplied a scalar commutant and the invertibility needed for the endpoint equations. We next extract the sum of all single-arc components; its homogeneous deficit controls the boundary exponents. Return to (3.2). Write $f \( y \) = \( q^2 - y^2 \)^(- 1)$, and use cyclic conjugates $A_j^(\#) = Omega^(j - 1) Y Omega^(1 - j)$ so $A_(j + 1)^(\#) = g_j A_j^(\#) g_j^(- 1)$ (first $Omega Y Omega^(- 1) = Omega g_N dots.h.c g_2 = g Y g^(- 1)$). Moving an endpoint successively from site 2 to $N$, then rotating, gives $M F_12 = F_21 \, med M F_21 = F_12$. Using $g F_21 = - q F_21$ we get $\( q^2 - \( g M \)^2 \) F_12 = q \( g + q \) F_12$; use $g M = g Y g^(- 1)$ and $g^(- 1) \( g + q \) = q \( g + q \)$ to obtain

$ F_12 = q^2 thin g f \( Y \) thin x_1 \( g - 1 \) delta . $

Moving its second endpoint right and using $g_l x_l = x_(l + 1) g_l^(- 1)$, then rotating, gives for all ordered distinct pairs (products from $j - 1$ down the cyclic interval, empty products allowed)

$ F_(i j) = q^2 f \( A_j^(\#) \) x_j \( g_(j - 1)^(- 1) dots.h.c g_(i + 1)^(- 1) - g_(j - 1)^(- 1) dots.h.c g_i^(- 1) \) delta . $

For each fixed $j$, sum over the $N - 1$ possible cyclic distances from $i$ to $j$. The products telescope; the last term involves

$ x_j g_(j - 1)^(- 1) dots.h.c g_(j - N + 1)^(- 1) delta = g_(j - 1) dots.h.c g_(j - N + 1) Omega x_j delta = A_j^(\#) x_j delta . $

It follows that the sum over all ordered pairs is $q^2 cal(O) delta$, where

$ beta \( y \) = \( 1 - y \) f \( y \) \, #h(2em) cal(O) = sum_j C_j^(\#) \, quad C_j^(\#) = beta \( A_j^(\#) \) x_j . $

This operator commutes with $Omega$ by rotation. It also commutes with the $g$’s: $C_j^(\#)$ commutes with $g_l$ when $l in.not { j - 1 \, j }$ (indices interpreted cyclically), by rotating the corresponding relation for $Y$, and $C_(l + 1)^(\#) = g_l C_l^(\#) g_l$, so their sum commutes by the quadratic (3.3). Hence $cal(O) = o$ is scalar.

=== 3.4 Evaluating the scalar by the Cauchy matrix <evaluating-the-scalar-by-the-cauchy-matrix>

The endpoint transport has reduced the arc sum to the scalar $o$. Its remaining evaluation uses the same interpolation operator $L$, so that the resulting formula can be taken to coincident rapidities. To calculate it, put $h \( x_1 \) = \( C_1^(\#) upright(bold(e)) \) \( x_1 \)$, i.e. in (3.4) coordinates $h = beta \( Y \) xi$. Then

$ o upright(bold(e)) = sum_(j = 1)^N q^(1 - j) g_(j - 1) dots.h.c g_1 h \( x_1 \) \, #h(2em) o = frac(q^(2 - 2 N), q^2 - 1) sum_i frac(P \( q^2 xi_i \), xi_i P' \( xi_i \)) thin h \( xi_i \) . $

For the second equality, on $h_w \( z \)$ the operator sum gives by the earlier transport formula the telescoping product $\( product_i \[ 1 + \( q^(- 2) - 1 \) h_w \( xi_i \) \] - 1 \) \/ \( q^(- 2) - 1 \) = \( q^(- 2 N) P \( q^2 w \) \/ P \( w \) - 1 \) \/ \( q^(- 2) - 1 \)$; take residues. Thus inserting (3.4),

$ \( q^2 - 1 \) o = q^(1 - N) sum_i frac(\[ beta \( L \) r_0 \] \( xi_i \), d \( xi_i \) P' \( xi_i \)) \, quad r_0 \( xi_i \) = q^(1 - N) d \( xi_i \) P \( q^2 xi_i \) . $

The functional on $beta \( L \) r_0$ on the right gives the degree $N - 1$ coefficient of its preimage under $L$: on $L h$ it is $q^(2 - 2 N) sum_i h \( q^2 xi_i \) \/ P' \( xi_i \) = \[ z^(N - 1) \] h$ by interpolation (degree $< N$). Also $L^(- 1) r_0 = u_0 = P \( z \) - product_i \( z - q^2 xi_i \)$. Therefore

$ \( q^2 - 1 \) o = \[ z^(N - 1) \] beta \( L \) u_0 . $

We have reduced the orbit scalar to one polynomial coefficient. It remains to evaluate that coefficient using the two resolvents at $plus.minus q$. For $y = plus.minus q$ let $T_y$ be the monic polynomial of degree $N$ solving $q^(1 - N) d \( xi_i \) T_y \( q^2 xi_i \) = y T_y \( xi_i \)$, existing uniquely since $y - L$ invertible. Then $T_y - P = \( y - L \)^(- 1) L u_0$ and $\( y - L \)^(- 1) u_0 = \( T_y - product_i \( z - q^2 xi_i \) \) \/ y$. Use

$ beta \( L \) = a_(+) \( q - L \)^(- 1) - a_(-) \( - q - L \)^(- 1) \, #h(2em) a_plus.minus = \( q^(- 1) minus.plus 1 \) \/ 2 $

to get, with $t_y = \[ z^(N - 1) \] T_y \, med s_xi = sum_i xi_i$,

$ \( q^2 - 1 \) o = s_xi + q^(- 1) \( a_(+) t_q + a_(-) t_(- q) \) . $

Write

$ frac(T_y \( z \), D \( z \)) = 1 + sum_i frac(v_i, z + q xi_i) . $

Since $q^(1 - N) d \( z \) = q D \( z \) \/ D \( q^2 z \)$, evaluating the defining relation at $xi_i$ and dividing by $D \( xi_i \)$ gives

$ q + \( cal(C)^(sans(T)) v \)_i = y #scale(x: 120%, y: 120%)[\(] 1 + \( cal(C) v \)_i #scale(x: 120%, y: 120%)[\)] \, #h(2em) \( cal(C)^(sans(T)) - y cal(C) \) v = \( y - q \) upright(bold(1)) . $

Expansion at infinity therefore yields

$ t_q = q s_xi \, #h(2em) t_(- q) = q s_xi - 2 q thin upright(bold(1))^(sans(T)) \( cal(C)^(sans(T)) + q cal(C) \)^(- 1) upright(bold(1)) . $

Substitution into the coefficient identity gives

$ \( q^2 - 1 \) o = \( 1 + q^(- 1) \) #scale(x: 120%, y: 120%)[\(] s_xi - upright(bold(1))^(sans(T)) \( cal(C)^(sans(T)) + q cal(C) \)^(- 1) upright(bold(1)) #scale(x: 120%, y: 120%)[\)] . $

Finally $sum F_(i j) = q^2 o delta$ and $c e^(upright(i) S) = 1 - q^(- 1)$. Substituting the definition of $F_(i j)$ into the last identity gives (3.1) on the chosen orbit.

The calculation initially used the permutation orbit of one sufficiently small arithmetic progression of rapidities. To record the scope of (3.1), regard its finite orbit matrices as meromorphic functions of the distinct rapidity values. Simple spectrum, cyclicity of the constant vector, and the exclusions of $plus.minus q$ and of eigenvalue ratios $q^(plus.minus 2)$ are open conditions. They hold at the progression just analyzed, hence throughout a full neighborhood of it. The same endpoint transport and scalar-commutant calculation proves (3.1) on that neighborhood. The meromorphic identity theorem extends the identity to a sufficiently small rapidity polydisk. At collisions the left side is analytic by the finite transfer construction, so it supplies the removable continuation of the inverse-matrix pairing. In particular the confluent limit below can be taken along the progression used in the proof. This completes the proof of Proposition 3.

== 4 The boundary deficit and its geometric consequences <sec:deficit>

Formula (3.1) has reduced the arc deficit to a finite inverse-matrix pairing. In the homogeneous limit, this pairing is comparable to the squared norm of polynomial evaluation against a positive weight. We first estimate this squared norm, then recover height, width and pointwise endpoint estimates by positive boundary comparisons.

=== 4.1 Size of the boundary deficit <size-of-the-boundary-deficit>

At homogeneity write $h_N \( m \) = H_(i \, i + m) \( 0 \)$, $1 lt.eq m < N$, independent of $i$. Take $epsilon.alt arrow.b 0$ in (3.1) for the unpermuted tuple. By the moment representation used after (3.4), $cal(C)^(sans(T)) + q cal(C)$ up to the indicated common factors is the row-column moment matrix with weight $\( e^(lambda t) + q e^(- lambda t) \) w_0 \( t \)$. Extracting the factors, the vectors $upright(bold(1))$ for the inverse evaluation become vectors with entries $e^(upright(i) eta_i^0)$, namely evaluation of row functions at $upright(i)$ and column functions at $- upright(i)$. Passing to $U_m^epsilon.alt \, V_m^epsilon.alt$ and the limit, we obtain

#[#set math.equation(numbering: n => "(4.1)")
 $ N #scale(x: 180%, y: 180%)[\(] 1 - c sum_(0 < m < N) h_N \( m \) #scale(x: 180%, y: 180%)[\)] = 2 thin w^(*) frak(M)^(- 1) w \, #h(2em) w = \( upright(i)^m \)_(0 lt.eq m < N) \,\
frak(M)_(m n) = integral t^(m + n) \( e^(lambda t - upright(i) lambda) + e^(- lambda t + upright(i) lambda) \) w_0 \( t \) thin d t . $ <c2:eq-10>]

The simultaneous changes of row and column bases act on the matrix and on their evaluation vectors, preserving the inverse pairing. The row evaluation at $upright(i)$ appears on the right, and the column evaluation at $- upright(i)$ appears on the left as $w^(*)$. The common phase $e^(- upright(i) lambda)$ has been included in the moment weight. The left side is continuous by the transfer construction.

To see that the limiting inverse is legitimate and estimate it, write $frak(M) = G + upright(i) J$, with $G \, J$ real symmetric. The positive matrix $G$ is the moment matrix for $2 d cosh \( lambda t \) w_0 \( t \)$. Pointwise comparison of the imaginary weight with this real weight gives $- \( tan lambda \) G lt.eq J lt.eq \( tan lambda \) G$. Consequently

$ frak(M) = G^(1 \/ 2) \( I + upright(i) frak(A) \) G^(1 \/ 2) \, #h(2em) frak(A) = G^(- 1 \/ 2) J G^(- 1 \/ 2) \, #h(2em) parallel frak(A) parallel lt.eq tan lambda . $

Since $Re \( I + upright(i) frak(A) \)^(- 1) = \( I + frak(A)^2 \)^(- 1)$,

$ frac(w^(*) G^(- 1) w, 1 + tan^2 lambda) lt.eq Re \( w^(*) frak(M)^(- 1) w \) lt.eq w^(*) G^(- 1) w . $

The constants are independent of $N$. Moreover $2 d cosh \( lambda t \) w_0 \( t \) asymp 1 \/ cosh \( 3 pi t \/ 8 \)$. By the extremal characterization of the norm of polynomial evaluation, the right side of (4.1) is therefore comparable to the squared norm of evaluation at $3 upright(i) \/ 8$ on polynomials of degree $< N$ with real-axis measure $d v \/ cosh \( pi v \)$. Here we used the change of variable $v = 3 t \/ 8$.

To compute the latter order, the coefficients $p_m \( v \)$ in $z$ of

$ \( 1 - upright(i) z \)^(- 1 \/ 2 + upright(i) v) \( 1 + upright(i) z \)^(- 1 \/ 2 - upright(i) v) = \( 1 + z^2 \)^(- 1 \/ 2) exp \( 2 v arctan z \) $

are the Meixner–Pollaczek polynomials $P_m^(\( 1 \/ 2 \)) \( v \; pi \/ 2 \)$ [18] 18.23.7 and 18.19.6–18.19.9. Their standard weight, after normalization to mass one, is the measure above. They are real polynomials of degree $m$; the following direct calculation fixes their normalization here. Indeed the generating functions at $z \, z'$ paired bilinearly give $1 \/ \( 1 - z z' \)$ by (3.5), for small arguments with differentiation justified by exponential decay. So the squared norm in question is $sum_(m < N) \| p_m \( 3 upright(i) \/ 8 \) \|^2$. Here the absolute value is the positive coefficient of $y^m$ in

$ \( 1 - y \)^(- 7 \/ 8) \( 1 + y \)^(- 1 \/ 8) = \( 1 - y \)^(- 3 \/ 4) \( 1 - y^2 \)^(- 1 \/ 8) . $

It has order $\( 1 + m \)^(- 1 \/ 8)$: the coefficients of $\( 1 - y \)^(- a)$ for fixed $a > 0$ have order $\( 1 + m \)^(a - 1)$ by their product formula (or summing the log of successive ratios), and splitting the positive convolution sum over $k lt.eq m \/ 4 \, med m \/ 4 < k lt.eq m \/ 2$ gives $sum_k \( 1 + k \)^(- 7 \/ 8) \( 1 + m - 2 k \)^(- 1 \/ 4) asymp \( 1 + m \)^(- 1 \/ 8)$. Thus the squared evaluation norm is

$ sum_(m < N) \| p_m \( 3 upright(i) \/ 8 \) \|^2 asymp sum_(m < N) \( 1 + m \)^(- 1 \/ 4) asymp N^(3 \/ 4) . $

Dividing (4.1) by $N$ proves

#[#set math.equation(numbering: n => "(4.2)")
 $ 1 - c sum_(m = 1)^(N - 1) h_N \( m \) asymp N^(- 1 \/ 4) . $ <c2:eq-11>]

=== 4.2 Half-plane and strip estimates <half-plane-and-strip-estimates>

===== 4.2.1 Lost arcs and saturation. <lost-arcs-and-saturation.>

On lifting (fixing the first port), an arc counted by $h_N \( m \)$ is exactly a planar half-plane excursion from $e_2 \/ 2$ to $e_2 \/ 2 + m U$ which projects to a self-avoiding path mod $N U$; the choice of positive cut interval specifies this lift displacement rather than $\( m - N \) U$. Since $sum_(m < N \, thin m gt.eq 1) h_N \( m \) lt.eq sum_(m gt.eq 1) h \( m \)$, (2.2) and (4.2) thus imply equality $c sum_(m > 0) h \( m \) = 1$, with deficit of order $N^(- 1 \/ 4)$ from the lost arcs (endpoint spacing at least $N$ or intersecting translates). Let $mu_(+)$ denote the measure with weights $x^(\# upright("vertices"))$ on half-plane excursions from $e_2 \/ 2$ ending strictly to the right on the bottom. If $cal(R)$ is horizontal reflection, the full-wall measure in the introduction is $mu = mu_(+) + cal(R)_(*) mu_(+)$. Thus $mu \( E \) = 2 mu_(+) \( E \)$ for reflection-invariant events, including the height and diameter restrictions below. Use horizontal $z$ and upward $y$ coordinates from the start, endpoint displacement $X > 0$, extrema

$ M = - min z \, quad P_(+) = max z - X \, quad W = X + M + P_(+) \, quad H = max y . $

Reversing the path and reflecting $z mapsto X - z$ (a lattice symmetry for this $X$) exchanges $M \, P_(+)$. Every excursion with $X gt.eq N \| U \|$ is lost in the comparison at period $N U$, and every lost excursion has $W gt.eq N \| U \|$. Taking $N$ on the appropriate side of $t \/ \| U \|$ therefore gives, with $p = 1 \/ 4$,

#[#set math.equation(numbering: n => "(4.3)")
 $ mu_(+) \( X > t \) med lt.tilde med t^(- p) \, #h(2em) mu_(+) \( W > t \) med gt.tilde med t^(- p) #h(2em) \( t arrow.r oo \) . $ <c2:eq-12>]

The lost-arc bounds distinguish endpoint displacement from total horizontal width. To obtain a height estimate, we compare the domain with two wedges whose slanted walls respond differently to height.

===== 4.2.2 The two wedge identities. <the-two-wedge-identities.>

Half-plane saturation and (2.1) show that the mass of exits on the receding sides of the half-plane exhaustion tends to zero: bottom real parts increase to one, and every other real part controls its positive mass by the same strictly positive cosine bound.

Add a slanted left boundary starting at horizontal coordinate $- t$ on the bottom and making angle $alpha$ with the rightward direction, where $alpha = pi \/ 3$ or $2 pi \/ 3$. Retain the wedge to its right. Choose $t > 0$ on the admissible arithmetic progression for that angle; the wall normals are $e_1 \, e_0$, respectively. The wedge exhaustion has vanishing mass on its receding faces as well, since those exits are a subset of the corresponding half-plane exits.

The turn for an exit on the new slanted side is $alpha$: the positive boundary tangent has rotated by $pi + alpha$ from the source. The old bottom exit turns remain $- pi$ to the right and $+ pi$ to the left. Subtracting the two domain identities gives

$ e^(- upright(i) pi s) E_R + e^(upright(i) pi s) E_L = e^(upright(i) alpha s) C \, $

where $E_R \, E_L$ are the lost rightward and leftward bottom masses, and $C$ is the mass exiting the new side. Define

$ L_alpha = max \( y cot alpha - z \) \, #h(2em) A_alpha \( t \) = mu_(+) \( L_alpha > t \) \, #h(2em) B_alpha \( t \) = mu_(+) \( X + L_alpha > t \) . $

The first lost mass is $E_R = A_alpha \( t \)$. Translating and reversing the leftward arches gives $E_L = B_alpha \( t \)$. At an admissible cut a bottom arch cannot attain its maximum on the slant, since the line contains no vertex or bottom port. Rotate the last complex identity by $e^(- upright(i) alpha s)$ and take imaginary parts. With subscripts $+$ and $-$ denoting $pi \/ 3$ and $2 pi \/ 3$, respectively, this yields

#[#set math.equation(numbering: n => "(4.4)")
 $ A_alpha \( t \) = c_alpha B_alpha \( t \) \, #h(2em) c_alpha = frac(sin \( s \( pi - alpha \) \), sin \( s \( pi + alpha \) \)) \, #h(2em) 0 < c_(-) < c_(+) < 1 . $ <c2:eq-13>]

===== 4.2.3 Upper tails. <upper-tails.>

First $A_(+) \( t \) lt.tilde t^(- p)$. Indeed on allowed cuts, $A_(+) \( t \) lt.eq c_(+) \[ A_(+) \( a t \) + O \( t^(- p) \) \]$ for fixed $0 < a < 1$ by (4.3). Choose $a_0 < a < 1$ so $c_(+) a_0^(- p) < 1$, and round $a t$ down to an allowed cut still $gt.eq a_0 t$ for large $t$. Induction and monotonicity prove the bound. Since $L_(-) lt.eq M lt.eq L_(+)$, symmetry for $P_(+)$ and (4.3) now give upper tails $lt.tilde t^(- p)$ also for $M \, W$, for $B_plus.minus \( t \)$, and for $H$ by $H \/ sqrt(3) lt.eq L_(+) + max z$.

===== 4.2.4 Lower height and endpoint tails. <lower-height-and-endpoint-tails.>

For a tail function $F$, write $macron(F) = R^(- 1) integral_R^(2 R) F \( t \) thin d t$. Then $macron(B)_(+) gt.tilde R^(- p)$ since $X + L_(+) gt.eq X + M$ and $mu_(+) \( X + M > t \) gt.eq mu_(+) \( W > 2 t \) \/ 2$ by symmetry. The grid restriction in (4.4) costs $O \( R^(- 1 - p) \)$ on taking averages (round down/up; each tail is monotone with upper bound as above). Hence

$ macron(A)_(+) - macron(A)_(-) = \( c_(+) - c_(-) \) macron(B)_(+) + c_(-) \( macron(B)_(+) - macron(B)_(-) \) + O \( R^(- 1 - p) \) gt.tilde R^(- p) . $

To bound this difference in the other direction, observe that $0 lt.eq L_(+) - L_(-) lt.eq 2 H \/ sqrt(3)$. For each arch with $H lt.eq epsilon R$, the set of $t in \[ R \, 2 R \]$ lying between $L_(-)$ and $L_(+)$ has length at most $2 epsilon R \/ sqrt(3)$, and is empty unless $L_(+) > R$. Integrating the indicator difference therefore gives

$ macron(A)_(+) - macron(A)_(-) lt.eq \( 2 epsilon \/ sqrt(3) \) A_(+) \( R \) + mu_(+) \( H > epsilon R \) . $

The first term is at most a fixed constant times $epsilon R^(- p)$. Choosing $epsilon > 0$ sufficiently small proves the matching lower height tail.

Likewise (4.4) gives $macron(B)_(+) - macron(A)_(+) gt.tilde R^(- p)$. The interval between $L_(+)$ and $X + L_(+)$ has length $X$. Splitting according to $X lt.eq epsilon R$ now gives

$ macron(B)_(+) - macron(A)_(+) lt.eq epsilon B_(+) \( R \) + mu_(+) \( X > epsilon R \) \, $

and the same absorption proves the endpoint lower tail. Thus

#[#set math.equation(numbering: n => "(4.5)")
 $ mu_(+) \( H > t \) asymp mu_(+) \( X > t \) asymp t^(- 1 \/ 4) . $ <c2:eq-14>]

In particular $mu_(+) \( "diam" > t \) asymp t^(- 1 \/ 4)$ for Euclidean diameter, by the height lower tail and the width and height upper tails. For a strip of height $T$ with top line in the cut family (parallel to bottom), let $B \( T \)$ be the total excursion weight from the fixed start to that top. By the same vanishing of side masses and (2.1), now top turn zero, $B \( T \) = c thin mu_(+) \( H > T \) asymp T^(- 1 \/ 4)$.

=== 4.3 The decreasing boundary kernel <the-decreasing-boundary-kernel>

The endpoint tail just proved is a summed estimate. To recover the mass at a specified displacement, we show that $h \( m \)$ is nonincreasing. Choose bottom ports $a < a' < b'$ from left to right, with $a \, a'$ consecutive. Sum over fixed simple paths from $a$ to $b'$ in a bounded half-plane exhaustion, with complex turn weights as in (2.1), and for each run an independent continuation experiment from $a'$, stopped also at hitting any vertex of the fixed path. Its total weight is one, with self-repeat contributions zero by the same loop reversal (it still avoids the fixed path). Hits of the fixed path produce a Y-shaped tree with three legs (arriving at the branch vertex by its unused edge, not counting a turn there in the continuation). They pair exactly with the hits in the corresponding construction starting with $a' arrow.r b'$, then from $a$; the turn ratio is $e^(upright(i) theta)$, $theta = 2 pi s \/ 3$, since at the branch the three outgoing rays to $a \, a' \, b'$ are counterclockwise in that order (cyclic order given by the boundary order for three disjoint legs), giving through turn $+ pi \/ 3$ instead of $- pi \/ 3$, and all three legs are traversed in the same respective directions before and after the switch. Subtract the experiments with this factor, pass to the full half-plane (exiting on receding sides costs vanishing mass by product bounds), and divide by their common target phase $e^(- upright(i) pi s)$. Noncrossing and adjacency give

$ h \( a \, b' \) - e^(upright(i) theta) h \( a' \, b' \) = e^(- upright(i) pi s) sum_(a' < d' < b') h \( a b' \| a' d' \) - e^(upright(i) theta) [e^(upright(i) pi s) sum_(d' < a) h \( a' b' \| a d' \) + e^(- upright(i) pi s) sum_(d' > b') h \( a' b' \| a d' \)] \, $

with $h \( a \, b' \)$ denoting the corresponding one-arc weight, and double terms the disjoint positive two-arc weights. Multiply by $e^(upright(i) pi s)$ and take imaginary parts. Because $2 pi s + theta = pi$ and $sin \( pi s + theta \) = sin \( pi s \)$, the only nonzero imaginary term on the right is nonpositive. More explicitly,

$ sin \( pi s \) #scale(x: 120%, y: 120%)[\(] h \( a \, b' \) - h \( a' \, b' \) #scale(x: 120%, y: 120%)[\)] = - sin theta sum_(d' > b') h \( a' b' divides a d' \) lt.eq 0 . $

Hence $h \( m \)$ is nonincreasing. The upper bound $h \( m \) lt.tilde m^(- 5 \/ 4)$ follows by summing over $\[ m \/ 2 \, m \]$ and applying (4.5). For the lower bound choose a sufficiently large fixed $K$ so that the tail beyond $K m$ is less than half the lower bound for the tail beyond $m$. Summing over $\[ m \, K m \]$ and using monotonicity then gives $h \( m \) gt.tilde m^(- 5 \/ 4)$. These half-plane and strip estimates transport to lattice-congruent walls by symmetry.

=== 4.4 Criticality and quantitative unfolding <c2:unfolding>

The value $x = \( 2 + sqrt(2) \)^(- 1 \/ 2)$ agrees with the exact connective-constant theorem of Duminil-Copin and Smirnov [3] Theorem 1. We retain a direct unfolding argument because it also gives a quantitative bound on $c_n x^n$, where $c_n$ counts $n$-edge walks from a fixed vertex. The successive-extrema decomposition follows the unfolding principle of Hammersley and Welsh [12]; see also the honeycomb adaptation in [3] Section 3.

For ordinary vertex walks, the lower strip estimate gives $sum_n c_n x^n = oo$. Indeed, sum $B \( T \) gt.tilde T^(- 1 \/ 4)$ over admissible heights $T in \( 3 \/ 2 \) bb(Z)_(> 0)$ and delete the terminal half-edges. The source vertex is $upright(bold(a))_00$, and the terminal vertex determines the top height, so this conversion has bounded multiplicity and a fixed weight factor. The length-generating series therefore has radius at most $x$. For the reverse inequality we bound the weighted counts of length $n$ subexponentially.

Split each path at its first minimum of vertical height and read the two pieces out from that point, translating both by the same lattice translation so the minimum vertex becomes $upright(bold(a))_00$ or $upright(bold(b))_00$ according to type. The ordered pair determines the path (the endpoint of the reversed first piece recovers the translation for fixed original start). An empty piece has weight one and an empty span list.

Each piece starting at its minimum decomposes into slab bridges (between its minimum and maximum on each successive segment): cut at the last global maximum, then the last minimum on the remainder, and so on until finished, alternating upwards/downwards. Their spans are nonincreasing and strictly decreasing after a possible tie on the first pair (the later remainders cannot again reach the previous last extreme). There are no horizontal steps, spans are positive multiples of $1 \/ 2$, and their sum is at most the length. Thus each piece needs $O \( sqrt(n) \)$ such spans with at most $exp \( O \( sqrt(n) log n \) \)$ choices.

For any such upward span and fixed starting vertex the total bridge mass, summing $x^(\# upright("steps"))$ over paths starting at their minimum and ending at maximum in that vertex slab, is bounded uniformly. Indeed extend the start strictly down by one edge to a type $upright(bold(a))$ vertex if necessary (from type $upright(bold(b))$ choose a fixed lower neighbor), similarly the upper endpoint strictly up to a type $upright(bold(b))$ vertex if necessary (using a fixed upper neighbor), then by the exterior vertical half-edges at each end to ports. This produces simple paths exactly in a translated strip of the admissible kind above with fixed bottom start; the extension is injective for given endpoint heights (they specify the vertex types, hence what was appended), with bounded weight conversion, so use the uniform upper bound on $B \( T \)$. Downward bridges follow by a lattice half-turn. Thus ignoring mutual avoidance and multiplying these bounds along both pieces gives the stated subexponential upper growth. Together with the divergence already proved, this shows that the radius of convergence is $x$. The other vertex type has the same counts by symmetry.

More precisely, the span-list count and the uniform mass per piece give

#[#set math.equation(numbering: n => "(4.6)")
 $ c_n x^n lt.eq exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C sqrt(n) log \( n + 1 \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( n gt.eq 1 \) \, $ <c2:eq-unfolding>]

for an absolute constant $C$. The endpoint factor in each conversion is explicit: an $m$-edge vertex bridge has $m + 1$ vertices, and if its extension adds $a$ vertices below and $b$ above, with $a \, b in { 0 \, 1 }$, its port weight is $x^(m + 1 + a + b)$. The exterior half-edges add no visited vertices.

== 5 Disk matchings and the two-gap cylinder sum <c2:sec-disk-gluing>

The boundary calculation has given finite masses for collections of disjoint arcs and the braid identity (2.3). We now use those arcs to study polygons on a cylinder. Fix two opposite gaps on a cylinder of circumference $2 n \| U \|$, and give each collection of disjoint polygons separating those gaps its critical vertex weight, with an additional factor $2$ per polygon. Our goal is to prove that the total weight is $n^(1 \/ 6 + o \( 1 \))$.

The argument has three parts. First we construct a finite vector indexed by disk matchings, and calculate a twisted pairing of two such vectors. Gluing the matchings interprets that pairing as the required polygon sum. Next a contour representation bounds the pairing after its scalar normalization has been removed. Finally an independent determinant calculation determines that normalization. Positivity of the polygon sum then makes the upper bound sharp.

Throughout the disk and contour calculations set

$ lambda = pi \/ 8 \, #h(2em) q = e^(2 i lambda) \, #h(2em) mu = 2 cos \( 3 lambda \) \, #h(2em) d = sqrt(2) . $

In particular, the letter $d$ in these sections denotes $sqrt(2)$, rather than the sine abbreviation used in the boundary calculation.

=== 5.1 Disk states and their local maps <c2:sec-disk-states>

Let $cal(D)_N$ be the vector space with basis the partial noncrossing pairings of $N$ cyclically ordered boundary points of a disk. A point is either vacant or the endpoint of one arc. Composition joins arcs at occupied ports and gives weight zero to every closed loop. Forgetting the filled cylinder end sends each annular state from Section 2 to such a disk matching. The different annular states with that matching contribute to the same disk coordinate.

We will check local diagram identities in a faithful spin realization. At each port use the three-dimensional space with basis $0 \, + 1 \, - 1$, where $0$ means vacancy. An arc with earlier endpoint $s$ and later endpoint $t$ contributes

$ sans(c)_(s t) = q^s delta_(s \, - t) \, #h(2em) s \, t in { + 1 \, - 1 } . $

A matching is the tensor product of these arc coefficients and its vacant coordinates. The same symbol $sans(c)$ denotes the resulting cup vector or its two-by-two coefficient matrix. Caps use the transpose cup, without complex conjugation; through-lines preserve spins. Hence

$ sans(c)^t sans(c) = q^2 + q^(- 2) = 0 \, #h(2em) sum_(t = plus.minus 1) sans(c)_(s t) sans(c)_(t u) = delta_(s u) . $

The first identity removes a closed loop; the second straightens a cup followed by a cap. The boundary constant $c$ keeps its earlier meaning.

The matching vectors are linearly independent. Fix the occupied sites and encode a noncrossing matching by its Dyck word: opening endpoints have spin $+ 1$, closing endpoints spin $- 1$. Every spin word with nonzero coefficient in that matching has partial sums no larger than those of its Dyck word. The coefficient at the Dyck word is nonzero, and stack pairing recovers its unique matching. Ordering Dyck words by partial sums therefore gives a triangular coefficient matrix with nonzero diagonal. Different occupied sets have disjoint spin support. For a rectangle, bend its input ports to outputs in reverse order using nested cups, allowing vacancy with coefficient one at each bend. This preserves distinct diagrams, so the same argument proves faithfulness for the local maps used below. A rotation always means rotation of disk diagrams; its spin realization need not be plain cyclic permutation.

Write $A \( u \) \, B \( u \) \, C \( u \) \, D \( u \) \, E \( u \)$ for the #emph[normalized] five nonvacant weights, and $M \( u \) = T_u caron(R) \( u \)$ for the numerator braid. With $P_w = sin w \, med b = sin \( 2 lambda \)$ they are

$ T_u & = P_(u + 2 lambda) P_(u + 3 lambda) \, & A \( u \) & = frac(b P_(3 lambda - u), T_u) \, & B \( u \) & = frac(b P_u, T_u) \,\
C \( u \) & = frac(P_u P_(3 lambda - u), T_u) \, & D \( u \) & = frac(P_(2 lambda - u) P_(3 lambda - u), T_u) \, & E \( u \) & = frac(P_u P_(u - lambda), T_u) . $

Use rapidities $z_i$, variables $x_i = e^(2 i z_i)$; an adjacent exchange acting on columns uses $caron(R) \( z_(i + 1) - z_i \)$. Half powers of $x_i$ always mean $e^(i z_i)$. Unitarity $caron(R) \( - u \) caron(R) \( u \) = 1$ follows directly (on a single occupied spin use the matrix with diagonal $A$ and off-diagonal $C$; on 00 and the doubly occupied space the blocks are $1 \, B sans(c)^t \, B sans(c) \, D + E sans(c) sans(c)^t$). Indeed

$ A \( - u \) A \( u \) + C \( - u \) C \( u \) = 1 \, quad A \( - u \) C \( u \) + A \( u \) C \( - u \) = 0 \, quad D \( u \) D \( - u \) = 1 \, $

$ B \( u \) + B \( - u \) D \( u \) = 0 \, quad D \( u \) E \( - u \) + E \( u \) D \( - u \) + B \( u \) B \( - u \) = 0 $

by angle sums (use $D \( u \) = T_(- u) \/ T_u \, med b^2 - P_u^2 = P_(2 lambda - u) P_(2 lambda + u) \, med P_(u + lambda) T_(- u) + P_(u - lambda) T_u = b^2 P_u$, the latter by $T_u = b sin \( 3 lambda \) + P_u P_(3 lambda - u)$).

===== 5.1.1 Fusion maps. <fusion-maps.>

Fusion replaces a special adjacent pair by a single site, or deletes that pair. On the spin spaces the corresponding insertion maps are $J : bb(C)^3 arrow.r \( bb(C)^3 \)^(⊗ 2)$ and $K : bb(C) arrow.r \( bb(C)^3 \)^(⊗ 2)$:

$ J 0 = 00 + b_0 sans(c) \, quad J s = b_0 \( 0 s + s 0 \) \, #h(2em) b_0 = \( 2 cos lambda \)^(- 1) \; #h(2em) K \( 1 \) = 00 + sans(c) . $

Here $J 0$ is the image of a vacancy, while $J s$ is the image of an occupied spin. Both maps are injective. The identities we need say that the braid at the fusion parameter factors through the smaller space, and that an auxiliary strand can pass the inserted pair: for $\( L \, h \) = \( J \, lambda \) \, \( K \, 3 lambda \/ 2 \)$, respectively,

#[#set math.equation(numbering: n => "(5.1)")
 $ caron(R) \( 2 h \) = L L^t \, #h(2em) caron(R)_12 \( u - h \) caron(R)_23 \( u + h \) \( L ⊗ 1 \) = \( 1 ⊗ L \) R_f \, quad R_f = cases(delim: "{", caron(R) \( u \) \, & L = J \,, I \, & L = K .) $ <c2:eq-20>]

The reflected identity also holds (reverse sites and simultaneously reverse all spins). Embeddings between differently ordered tensor products always use the displayed order. The first identity follows by substitution. For the second, (2.3) forces the left-hand image into $1 ⊗ L$, since $L^t$ is onto. Projection of the third output to vacancy is injective on the image of $J$, up to its nonzero diagonal coefficients; for $K$, project both inserted outputs to vacancy. This recovers the induced operator on the smaller space. Its coefficients are checked as follows: writing $+ \, -$ for $u + h \, u - h$, the needed coefficients reduce to

#[#set math.equation(numbering: n => "(5.2)")
 $ B_(-) + b_0 A_(+) D_(-) = b_0 B \( u \) \, & C_(+) A_(-) + b_0 B_(+) C_(-) = b_0 A \( u \) \, quad C_(+) C_(-) + b_0 B_(+) A_(-) = C \( u \) \,\
b_0 \( A_(-) + A_(+) C_(-) \) = A \( u \) \, & C_(-) + A_(+) A_(-) = C \( u \) \,\
b_0 \( B_(+) + C_(+) B_(-) \) = B \( u \) \, & C_(+) D_(-) = D \( u \) \, quad C_(+) E_(-) + B_(+) B_(-) = E \( u \) $ <c2:eq-21>]

for $h = lambda$; for $3 lambda \/ 2$ only $C_(+) C_(-) + B_(+) A_(-) = 1$ besides the vacuum. For example for occupied pair input of $R_f$, projecting the third site after the first crossing gives $b_0 \( C_(+) s t + B_(+) sans(c)_(s t) 00 \)$; the next crossing gives the last three coefficients. For the scalar check put $s_j = P_(u + j lambda) \, med t_0 = 2 cos lambda$; the ordered identities for $h = lambda$, after substitution/cancellation, are

$ t_0 s_(- 1) s_3 + s_6 s_5 = s_0 s_1 \, #h(2em) t_0 s_6 + s_(- 1) = s_5 \, #h(2em) s_6 s_(- 1) + b^2 \/ t_0 = s_0 s_5 \,\
s_4 s_3 + s_6 s_(- 1) = t_0 s_5 s_1 \, #h(2em) s_(- 1) s_4 s_3 + b^2 s_6 = s_0 s_5 s_1 \,\
s_1 s_2 + s_6 s_(- 1) = t_0 s_0 s_4 \, #h(2em) D = D \, #h(2em) s_6 s_(- 2) + b^2 = s_0 s_4 . $

They follow by $s_(j + 8) = - s_j \, med s_(j + 1) + s_(j - 1) = t_0 s_j$ and product to sum (for the fifth, use the fourth and $b^2 - s_(- 1)^2 = - s_1 s_(- 3)$). The $3 lambda \/ 2$ identity similarly reduces to $b^2 - s_(- 3 \/ 2)^2 = s_(1 \/ 2) s_(9 \/ 2)$. Thus (5.1) holds per diagram.

=== 5.2 Pfaffian specialization and disk-vector interpolation <c2:sec-pfaffian-interpolation>

The use of polynomial exchange equations and fusion values follows a well-established finite-method pattern: see the dense $O \( 1 \)$ sum rule [2] and the open dilute $O \( 1 \)$ constructions [7,8]. Here the loop weight is zero. The polynomial below will clear denominators of the empty-normalized disk vector; it is not a free rescaling of that vector. We prove the required interpolation, including the compatibility at intersecting fusion hyperplanes, in the present disk normalization.

Let $H$ be the skew-symmetric matrix whose entries $H_(i j)$ for $i < j$ are given below. When $N$ is odd, append a final boundary index $*$ with $H_(i \, *) = 1$. Define the symmetric polynomial

$ p_N \( x \) = "Pf" \( H \) product_(i < j) frac(d_(i j), x_j - x_i) \, #h(2em) d_(i j) = x_i^2 + x_j^2 + d x_i x_j \, quad d = sqrt(2) \, quad H_(i j) = frac(x_j^2 - x_i^2, d_(i j)) \, #h(2em) p_0 = p_1 = 1 . $

The cleared Pfaffian numerator is alternating, so this is a homogeneous polynomial (total degree $N \( N - 1 \) \/ 2$) of individual degrees at most $N - 1$, with inversion symmetry $p_N \( x^(- 1) \) = p_N \( x \) product x_i^(- \( N - 1 \))$. Needed specializations, with spectators called $x$ and the size understood, are

#[#set math.equation(numbering: n => "(5.3)")
 $ p \( q^3 y \, y \, x \) & = \( q^3 y + y \) product_k f \( x_k \; y \) med p \( x \) \,\
f \( t \; y \) & = \( t - q^(- 2) y \) \( t - q^(- 3) y \) \,\
p \( q h \, h \/ q \, x \) & = d h product_k \( x_k + h \) med p \( h \, x \) \,\
p \( rho \, x \) \/ rho^(N - 1) & arrow.r p \( x \) #h(2em) \( rho arrow.r oo \) . $ <c2:eq-22>]

Indeed $d_(i j) = \( x_i - q^3 x_j \) \( x_i - q^(- 3) x_j \)$, so only the summands pairing the first two entries survive in the first specialization; spectator factors simplify as displayed. In particular $p_N equiv.not 0$. At infinity order the large variable last (before the boundary index); the extra row/column then either gives the boundary index or cancels the boundary index already present by column/row subtraction. For the middle specialization compare in a spectator variable $x_s$ at $q^(plus.minus 3) x_k$ for every other spectator (use the first reduction and induction, noting $f \( q h \; y \) f \( h \/ q \; y \) = \( h + y \) \( h + q^3 y \) f \( h \; y \)$); also compare at zero and in top degree by the single-site limit and inversion. This suffices for $N gt.eq 4$. For $N = 2 \, 3$ use $p_2 = x + y \, med p_3 = \( x + y + z \) \( x y + x z + y z \) + \( 2 d - 3 \) x y z$ (already determined by the other specializations).

#prodef([Remark 5.1.])[
  (The common even scalar polynomial).  For $N = 2 n$, replacing $x_j - x_i$ by $x_i - x_j$ in the prefactor and $x_j^2 - x_i^2$ by $x_i^2 - x_j^2$ in every upper-triangular Pfaffian entry leaves $p_N$ unchanged. The two signs are $\( - 1 \)^(n \( 2 n - 1 \))$ and $\( - 1 \)^n$, whose product is one. This is the scalar polynomial used in the polynomial-vacuum construction [19] Section 3.1. The homogeneous physical pairing below is likewise the same separator partition sum after multiplying that paper’s coordinates by $sqrt(3)$, which changes honeycomb edge length $1 \/ sqrt(3)$ to one; the companion’s physical pairing is proved in [19] Proposition 4.1. This identifies the scalar and the positive observable; the vector interpolation, normalization estimates and spatial proofs here are given independently.
] <rem:pd:scalar-comparison>

===== 5.2.1 The transfer vector and the induction statement. <the-transfer-vector-and-the-induction-statement.>

Consider the normalized disk transfer vector $psi_N$ near homogeneity for the same cyclic row with auxiliary label $- lambda$. Its empty coordinate is one and it is the unique fixed vector with that normalization there. Indeed at homogeneity powers of the row applied to the empty state count the same multipaths as before, only forgetting the annular data. This bounds them by (2.2) (finitely many possible lifts up to translations for each arc); all disk states are reachable (use laminar cut intervals as before, which can even be chosen within a single period by linear ordering). So the same matrix convergence argument applies, including for two sites; at one site there is only vacancy. At size zero we just use the formal vacuum of scalar one, its row having the vacant auxiliary term only. At homogeneity it gives the actual arc-configuration masses by increasing finite heights as before. Thus the fixed vector continues rationally in the exponentials $e^(i z_i)$, and is rotation-covariant in disk diagrams.

#thm([Proposition 5.2.])[
  (Polynomial disk transfer vector).  #emph[]
  + #emph[For each disk matching $alpha$, let $a_i in { 0 \, 1 }$ record whether its site $i$ is occupied. Its coordinate satisfies 
#[#set math.equation(numbering: n => "(5.4)")
 $ Phi_(N \, alpha) = (product_i x_i^(- a_i \/ 2)) p_N \( x \) psi_(N \, alpha) quad upright("is polynomial, of degree ") lt.eq N - 1 - a_i upright(" in ") x_i . $ <c2:eq-23>]

 This prescription is for $N gt.eq 1$; we suppress the coordinate subscript when the matching is fixed.]
  + #emph[Exchange of adjacent labels is implemented by $caron(R)$ as above. At adjacent pairs with earlier rapidity equal to later rapidity plus $3 lambda \, 2 lambda$, respectively, $psi_N$ reduces to $K psi_(N - 2) \, J psi_(N - 1)$ inserted at that pair; the new single label for $J$ has midpoint rapidity. Here these are identities for generic parameters subject to the indicated condition, with disk rotation allowed (we call these the descending pairs). The row fixes $psi_N$. With one variable tending to zero or infinity and the rest generic, the normalized vector tends to the one with that site vacant and deleted.]
] <c2:prop-disk-vector>

#proof[
  We prove the polynomial bound, exchange rule and reductions together. The induction first prescribes the vector on every fusion hyperplane, then interpolates the polynomial components. Compatibility of the prescriptions is the essential point: it makes interpolation independent of the occupied endpoint chosen for the construction. We finish by checking the transfer equation, which identifies the constructed vector with the fixed vector.
  Size $0 \, 1$ consists of plain vacancies; at size two take the candidate
  $ 00 + frac(mu, 2 cos \( z_1 - z_2 \)) sans(c) . $
  It has (5.4), both reductions, the deletion limit, rotation in disk diagrams, and exchange directly ($mu \( T_u - T_(- u) \) \/ \( 2 cos u \) = b P_u$). To check it is indeed the fixed vector, the empty output is automatic. In the cup output equation clear by multiplying by $x_1^(1 \/ 2) T_(lambda + z_1) p_2$; this gives degree at most two in $x_1$: as the vertical-site occupancy changes from input 0 to output 1 the box uses a single-sine numerator ($A \, B$); without change use (5.4) for the occupied input and $x_1$ times a two-sine numerator. Test at $x_1 = q^(plus.minus 3) x_2 \, q^(plus.minus 2) x_2$, taking the sheets with exact differences as above. Rotate if needed to have a descending pair, so the candidate inserts $L psi_(upright("reduced"))$ by its formula; pass the auxiliary line past it by reflected (5.1) to use the smaller row. This proves fixedness by the degree bound and hence the assertion by uniqueness.
  ===== 5.2.2 Prescriptions on fusion hyperplanes. <prescriptions-on-fusion-hyperplanes.>
  Now $N gt.eq 3$. Given smaller sizes, prescribe on every hyperplane $x_i = q^3 x_j$ the following value $B_(i j)$ for $p_N psi_N$; denote its componentwise gauge as in (5.4) by $hat(B)_(i j)$. Use the sheet $z_i = z_j + 3 lambda$. Start with $j$ next to $i$, just after it in the positive cyclic order; insert $K psi_(N - 2)$ there, then slide the smaller label $j$ back in that order across the intervening spectators by the adjacent-exchange boxes. Multiply by $p_N$, i.e. the first prefactor in (5.3) times lower $p$. Normalized prescriptions (without the $p_N$) are interpreted generically; comparisons at poles below use cleared expressions.
  ===== 5.2.3 Covariance of the transported values. <covariance-of-the-transported-values.>
  The prescriptions transform correctly under an adjacent exchange unless it swaps the two distinguished labels themselves. The labels here carry their rapidities. To see the covariance, distinguish the position of the exchange relative to the slide defining $B_(i j)$. Exchanges inside either open boundary interval between $i$ and $j$ commute or braid through that slide, by (2.3) and the lower-size exchange rule. At the moving endpoint $j$, an exchange appends a crossing or cancels one by unitarity. At the anchored endpoint $i$, first pass the spectator across the whole fused pair using (5.1) or its reflection. Its crossing with $j$ then cancels or is added to the slide, while the remaining slide steps are disjoint and commute. These are diagram identities, so disk rotation is allowed throughout. Clearing denominators extends the resulting covariance to further specializations wherever the final exchange box is nonsingular.
  ===== 5.2.4 Polynomiality and degree bounds. <polynomiality-and-degree-bounds.>
  We next show that the gauged prescription $hat(B)_(i j)$ is a polynomial on $x_i = q^3 x_j$. Each denominator $T_(z_k - z_j)$ introduced by the slide cancels, up to a monomial and a nonzero constant, against $f \( x_k \; x_j \)$ in (5.3). After inserting the lower polynomial, only monomial denominators and possible half-powers remain.
  The gauge removes the half-powers. If a spectator rapidity increases by $pi$, the lower coefficient acquires its occupancy sign. Among the normalized weights, exactly $A \, B$ change sign; these are the terms that flip occupancy of the traveling label, with positions exchanged along with labels. The final occupancy gauge cancels the accumulated sign. The same argument applies when both designated rapidities increase by $pi$, since $K$ inserts even total occupancy. Thus the gauged expression has integer powers of the spectator variables and of the common paired variable $x_j$. At intersections we choose half-power sheets satisfying the stated rapidity differences simultaneously.
  It remains to control these powers at zero and infinity. Fix a spectator $x_k$, write $b_k$ for its occupancy in a term of the lower vector and $a_k$ for its final occupancy. The lower gauged coefficient has degree at most $N - 3 - b_k$; the scalar $f \( x_k \; x_j \)$ has degree two. Restoring the lower half-power and applying the final gauge contributes $x_k^(\( b_k - a_k \) \/ 2)$. For an uncrossed spectator, $a_k = b_k$ and the crossing factor is one. At a crossed spectator, the parity of the local occupied ports makes a change of spectator occupancy equivalent to a change of traveling-label occupancy. The normalized crossing is bounded at both extremes; if occupancy changes it contributes $O \( min \( \| x_k \|^(1 \/ 2) \, \| x_k \|^(- 1 \/ 2) \) \)$. Thus the degree at infinity is at most
  $ N - 3 - b_k + 2 + frac(b_k - a_k, 2) - frac(\| a_k - b_k \|, 2) = N - 1 - max \( a_k \, b_k \) lt.eq N - 1 - a_k . $
  At zero the lower polynomial and $f$ are regular, and the remaining power is
  $ frac(b_k - a_k + \| a_k - b_k \|, 2) gt.eq 0 . $
  This proves both spectator bounds. When the paired variables $x_i = q^3 x_j$ move together, the scalar prefactor in (5.3) vanishes at zero, grows as $O \( x_j^(2 N - 3) \)$ at infinity, and all slide matrices remain bounded. After the gauge we obtain regularity at zero and
  $ deg_(x_k) hat(B)_(i j) lt.eq N - 1 - a_k quad \( k eq.not i \, j \) \, #h(2em) deg_(x_j) hat(B)_(i j) \|_(x_i = q^3 x_j) lt.eq ⌊2 N - 3 - frac(a_i + a_j, 2)⌋ . $
  The integer-power property and regularity at zero prove polynomiality. We will use the spectator bound to test identities by interpolation, and the paired-variable bound to control the interpolation coefficients.
  ===== 5.2.5 Compatibility at intersecting hyperplanes. <compatibility-at-intersecting-hyperplanes.>
  At the generic nonzero hyperplane intersections needed below (disjoint pairs or sharing one endpoint), the prescriptions are consistent:
  + For disjoint pairs, adjacently order both descending around the circle to apply their reductions together. This needs only nonsingular exchanges at generic points of the intersection: first group one pair without exchanging its two labels (move its smaller just after its larger), then if necessary move a member of the other pair past the grouped pair as a unit, without internal exchanges. The resulting normalized insertions clearly agree by induction. More generally on the prescription for $i \, j$, a further external descending adjacent pair at difference $2 lambda$ reduces by the smaller-size $J$-rule. If the slide passes over the pair, use reflected (5.1) to replace its two exchanges by one. Thus $B_(i j)$ there is $J$ applied to the smaller $B_(i j)$ after merging, times the second prefactor of (5.3) for this external pair. Likewise for a descending external adjacent $3 lambda$ pair by $K$ and the first prefactor. These identities, first obtained generically, still hold at any further specialization (nonzero variables with fixed half powers) by polynomiality, without dividing by a possibly vanishing lower $p$.
  + For a shared large or shared small endpoint, take the other two rapidities equal. Bring the three sites consecutively by generic exterior exchanges. For two equal small labels just after the large one, sliding over the other uses $caron(R) \( 0 \) = 1$. For two equal large labels just before the small one, sliding the small one over the second large uses $caron(R) \( 3 lambda \) = K K^t$, and $\( 1 ⊗ K^t \) \( K ⊗ 1 \) = 1$ by the snake identity on vacancy and doublet. Rotation, relabeling, and moving other sites generically exhaust the orders.
  + For a chain take $z_i = z_r + 6 lambda \, med z_j = z_r + 3 lambda$. In forward cyclic order $i \, j \, r$, bring them together by generic other exchanges; both prescriptions vanish by (5.3). In either order with external sites present, first check equality of the prescriptions ($hat(B)_(i j) \, hat(B)_(j r)$ after gauge) also specializing a chosen spectator $x_s = q^(plus.minus 2) x_t$ or $q^(plus.minus 3) x_t$ for each other spectator. Use nonsingular exchanges to order this new pair as adjacent descending without any exchange internal to it or among the three chain members, and apply point 1 (including the cleared identities there) and lower-size consistency. This gives $4 \( N - 4 \)$ values of $x_s$, enough for the degree bound when $N gt.eq 6$, or $N = 5 \, med a_s = 1$. For a vacant spectator compare also its top degree at infinity: each prescription then reduces to its one-site-deleted version, by (5.3), the single-site limit at smaller size and the vacant-label exchange limit (coefficient 1 for the position-changing strand or for both vacant, $C arrow.r 1 \, med A \, B arrow.r 0$). This leading-coefficient relation is computed first at a generic $q^3$ pair before the chain specialization, so extends by polynomiality. It gives the extra test for $N = 5$.
  ===== 5.2.6 The reverse-chain compatibility check. <the-reverse-chain-compatibility-check.>
  The preceding spectator tests settle the chain case for $N gt.eq 5$. At the two remaining sizes there are too few spectators, so we compute the reverse cyclic order directly. This closes the compatibility step before interpolation begins. For $N = 4$ arrange cyclic order $j \, i \, r \, k$ with $z_k = z_r + w$ by generic exchanges. Use normalized polynomials with denominator $product x_m^(\( N - 1 \) \/ 2)$. Write $mu = 2 cos \( 3 lambda \) \, med Z = 2 cos \( w - 6 lambda \) \, med z = 2 cos w$. At size two we have normalized polynomial vacuum $2 cos \( z_1 - z_2 \)$ and cup coefficient $mu$. Each q-cubed fusion prefactor in this normalization is $mu product_t 4 T_(z_t - z_(upright("small")))$. Thus dividing by $16 mu$, the two prescriptions are
  $ T_w M_23 \( 6 lambda \) U \( Z \) \, #h(2em) "rot" thin M_34 \( w - 3 lambda \) M_23 \( - 3 lambda \) U \( z \) \, #h(2em) U \( v \) = \( 00 + sans(c) \) ⊗ \( v 00 + mu sans(c) \) $
  where rot moves the last site to first. The following rows give their diagram coefficients, left column before multiplication by $T_w$; write $\( t \, p \, s \, c \, h \, e \) = \( T \, T C \, T A \, T B \, T D \, T E \)$ at arguments $6 lambda \, - 3 lambda \, w - 3 lambda$ with subscripts $1 \, 2 \, 3$.
  $ nothing & Z t_1 & t_2 t_3 z\
23 & Z c_1 & c_3 e_2 mu + s_2 t_3 z\
12 \, 34 & h_1 mu & e_2 h_3 mu\
14 & c_1 mu & c_3 t_2 z + h_3 mu s_2\
24 & mu p_1 & c_2 mu p_3 + p_2 s_3 z\
34 & mu s_1 & c_2 s_3 z + mu p_2 p_3\
13 & Z p_1 & c_2 p_3 z + mu p_2 s_3\
14 \, 23 & e_1 mu & c_3 s_2 z + e_2 e_3 mu + h_2 h_3 mu\
12 & Z s_1 & c_2 mu s_3 + p_2 p_3 z $
  Indeed with $k_0 = b cos lambda$ the first two weight lists are
  $ \( 0 \, - k_0 \, - k_0 \, 1 \/ 2 \, cos lambda \, k_0 \) \, #h(2em) \( 0 \, - k_0 \, 1 \/ 2 \, - k_0 \, k_0 \, cos lambda \) \, $
  and $T_w = h_3$. The columns now agree by angle sums (for $y = w - 3 lambda$, use $Z = 2 sin \( lambda + y \) \, med z = 2 sin \( lambda - y \) \, med Z sin \( 2 lambda - y \) - z sin y = mu b \, med mu \( sin \( 2 lambda - y \) - sin y \) = b z \, med Z h_3 - z t_3 = sin y$). For $N = 3$ the check follows as well by taking a vacant fourth site to infinity in this explicit identity (single-site leading relation above applied to the formal size-four prescriptions, which here needs only sizes at most two). This finishes chain consistency. We have now prescribed mutually compatible polynomial values on every hyperplane $x_i = q^3 x_j$. The remaining task is to construct a polynomial having all these values, and then identify it with the transfer vector.
  ===== 5.2.7 Interpolation and independence of the occupied label. <interpolation-and-independence-of-the-occupied-label.>
  Take the empty component in (5.4) to be $p_N$ (all prescriptions agree on it: ending empty from a nonempty input forces a closed loop). In a nonempty component choose an occupied label $r$. Interpolate $Phi^(\( r \))$ in $x_r$, degree $N - 2$, using $hat(B)_(i r)$ at $x_r = q^(- 3) x_i$ for every other site. Shared-small consistency removes the possible simple collision poles in Lagrange interpolation. Thus the interpolation is polynomial in all variables, not just in $x_r$. Its degree for $x_i \, med i eq.not r$ is at most $N - 1 - a_i$: in terms testing against a different site use the spectator estimate, and in the term testing against $i$ the paired growth bound above is at most $2 N - 4$ (integer degree), with denominator degree $N - 2$. For any hyperplane with both labels distinct from $r$, this polynomial satisfies its prescription too, by comparing the same $N - 1$ values of $x_r$ using consistency. It remains to show that choosing a different occupied site gives the same polynomial. For two choices $r \, s$, the difference has the factor
  $ product_(i eq.not r \, s) \( x_i - q^3 x_r \) \( x_i - q^3 x_s \) $
  with quotient independent of $x_r \, x_s$, by their degree bounds. We can therefore settle the comparison at the single point $x_r = x_s = 0$, keeping the other variables generic. At this point the displayed factor is nonzero. Evaluate the two interpolants using $hat(B)_(s r) \, hat(B)_(r s)$ respectively at the origin of their paired-variable lines. In fact there (5.3), divided by the two occupied half-powers, gives the common prefactor $mu product_(k eq.not r \, s) x_k^2$ times the lower $Phi$; normalized slides have $A \, B arrow.r 0 \, C arrow.r 1$ (so preserve traveling occupancies), and on double occupancies become the constant braid
  $ a I + a^(- 1) sans(c) sans(c)^t \, #h(2em) a = q^3 . $
  In this limit each ratio $x_k \/ x_(upright("moving"))$ tends to infinity, so the displayed braid is precisely the limit of the $D \, E$ terms. The $A \, B$ terms vanish and cannot flip a traveling occupancy. Consequently the spectator gauges reproduce the lower gauging, and both evaluations contain the same lower matching vector. The anchor is occupied, so the $K$ insertion contributes its cup. Equality at the origin is therefore reduced to comparing the two possible routes of this inserted cup around the disk.
  Place the cup in a thin collar of the boundary interval traversed from the anchor to the moving endpoint. Extend its chord across the tails of the intervening matching strands, in boundary order, always as the over-strand. Resolve each crossing by the displayed limiting braid, with weights $a \, a^(- 1)$. This convention is the same on the two complementary boundary intervals. Indeed the local cyclic port order is input earlier, input later, output later, output earlier; the traveling strand joins input earlier to output later. The $a I$ smoothing connects each of its half-edges to the preceding port. Thus choosing the other boundary interval changes the route, not the smoothing convention.
  To compare the routes, view the disk as a rectangle whose vertical sides collapse to the two chord endpoints. Draw the lower matching as disjoint piecewise-linear arcs away from these sides. Horizontal chords near the top and bottom represent the two collar routes. Sweeping one chord to the other only creates or cancels tangent pairs of crossings with a single underlying arc; both crossings have the chord as over-strand. The local resolutions are invariant under such a move because
  $ \( a I + a^(- 1) E \) \( a^(- 1) I + a E \) = I \, #h(2em) E^2 = 0 \, #h(2em) a^2 + a^(- 2) = 0 \, $
  where $E$ is the cap-cup operator. Hence the two routes give the same vector. This proves equality at the origin and, by the degree factorization above, independence of the occupied site used for interpolation.
  Since a nonempty diagram has at least two occupied sites, every required hyperplane can be tested choosing either a distinct spectator or its small endpoint among them. Thus the polynomials have all the prescribed values. They rotate covariantly by construction.
  ===== 5.2.8 Exchange, transfer invariance, and the remaining reductions. <exchange-transfer-invariance-and-the-remaining-reductions.>
  Exchange follows for $N gt.eq 3$ by testing after clearing $p_N$ and gauging in a spectator $x_r$ not in the exchanging pair (degree at most $N - 1$, spectator occupancy unchanged), on all $2 \( N - 1 \)$ values $x_r = q^(plus.minus 3) x_i \, med i eq.not r$, by covariance of prescriptions. Test also transfer invariance. Empty output is unchanged (closing off any nonempty input creates a loop). For a nonempty output choose $a_r = 1$, and clear the equation by $p_N x_r^(1 - a_r \/ 2) T_(lambda + z_r)$. This gives degree $lt.eq N + 1 - a_r = N$: for input occupancy $b_r$ at $r$ multiply its gauged polynomial of degree $lt.eq N - 1 - b_r$ there by $x_r^(1 + \( b_r - a_r \) \/ 2)$ times the box numerator. This is polynomial with the stated bound because one uses a single sine ($A \, B$ numerator) if occupancy flips, two sine factors otherwise. Test on the same $2 \( N - 1 \) > N$ prescribed values. There transfer invariance holds: nonsingular exchanges with spectators intertwine rows by (2.3) and preserve exchange covariance of our candidate, so bring the $q$-cubed pair to adjacent descending without swapping its two labels; rotate if needed, then apply the $K$ prescription and reflected (5.1) to reduce to the smaller row. Thus the constructed normalized vector is indeed $psi_N$ by uniqueness.
  On an adjacent descending $2 lambda$ pair it lies in the image of $J$ by exchange from the opposite order and (5.1) (both orders regular by (5.3) generically). Its antecedent is a disk vector ($J^t$ applied in that exchange) fixed by the reduced row by reflected (5.1) and transfer invariance ($J$ injective), with vacuum coordinate one. Uniqueness for generic reduced labels gives the reduction. With one variable at zero or infinity, (5.4),(5.3) yield finite limits vanishing on its occupied components; the vacant label passes freely through the row in the limit ($A \, B arrow.r 0 \, med C arrow.r 1$). So transfer uniqueness with that site deleted gives the limit as asserted. This completes the induction. ◻
]

===== 5.2.9 The two-site limit. <the-two-site-limit.>

The scalar pairing below needs one further consequence of the construction: two adjacent sites separating from all the others must carry their own two-site vector. With an adjacent pair $i \, j$ of variables tending to zero proportionally (in linear order here, generic proportions/rest), $psi$ also factors to leading order into the two-site $psi_2$ inserted disjointly into $psi_(N - 2)$. Indeed read (5.4) at both zero by the direct descending $q^3$ specialization: for both occupied the constant term is $mu product_(k med upright("ext")) x_k^2$ times the lower $Phi$ with a cup inserted, for just one occupied it is zero. For both vacant the constant is zero and the linear term is $\( x_i + x_j \) product_(k med upright("ext")) x_k^2$ times lower $Phi$, as read on both $q^3$ slopes. On the reversed slope one slides across all exterior sites; a vacant anchor forces vacant insertion by $K$, and at leading order one simply transports this vacancy ($A \, B arrow.r 0 \, med C arrow.r 1$). This includes the empty coordinate $p_N$; restoring gauges and dividing by it gives the claim. Similarly at infinity, put $X = x^(- 1)$ with half-powers $e^(- i z)$ and work with $tilde(Phi) \( X \) = Phi \( x \) product X_k^(N - 1 - a_k)$, polynomial by (5.4). Then $psi \( z \) = product X_k^(a_k \/ 2) tilde(Phi) \( X \) \/ p_N \( X \)$. On the same original sheets $z_i - z_j = plus.minus 3 lambda$, (5.3) for $p_N \( X \)$ still has leading prefactor $\( X_i + X_j \) product_(k med upright("ext")) X_k^2$ there, and $\( X_i + X_j \) \/ \( X_i^(1 \/ 2) X_j^(1 \/ 2) \) = mu$; the $K$ insertions and the vacant slide argument still apply. This gives the identical Taylor reasoning in $X$.

=== 5.3 The physical pairing and its scalar gas <c2:sec-scalar-gas>

We next pair two disk vectors, inserting a phase across one block of boundary sites. At balanced homogeneity, with $k = l = n$, this pairing is the polygon partition function. We first establish that interpretation, then characterize the pairing by its scalar reductions and express it as a sum over three labels per site.

Let $A = { 1 \, dots.h \, k }$ and $B = { k + 1 \, dots.h \, N }$, where $k \, l gt.eq 0$ and $k + l = N$. In spin coordinates put $s_i = 0$ at a vacancy and $s_i = plus.minus 1$ at an occupied site. For $theta in bb(C)$, set

$ V_(k \, l) = psi_N \( - z \)^t m^(sum_(i in A) s_i) psi_N \( z \) \, #h(2em) m = q^(- 2) e^(i theta) \, $

Here we use the spin embeddings and pair identical spins without complex conjugation.

===== 5.3.1 Gluing into separating polygons. <sec:pd:physical-pairing>

We now identify the physical observable represented by the pairing. Set $k = l = n gt.eq 3$ and $z_1 = dots.h.c = z_(2 n) = 0$. The angle $theta$ is an auxiliary parameter, and the polygon fugacity is $eta = 2 cos theta$; it is nonnegative for $theta in \[ 0 \, pi \/ 2 \]$. In particular, angle zero means fugacity two, whereas $theta = pi \/ 2$ means fugacity zero. Geometrically at these homogeneous parameters $V_(n \, n)$ counts collections of full-cylinder vertex-disjoint finite simple honeycomb polygons separating two points $f \, f' = f + n U$, unoriented and unrooted, with weight $x^(\| gamma \|) \( 2 cos theta \)$ per polygon $gamma$, $\| gamma \|$ its vertex count. Here $x$ is the homogeneous vertex weight from the boundary part, period $2 n U$, and $f$ is a point on the bottom line $y = - 1 \/ 2$ in the gap just before the first port. Indeed reflect one half-cylinder in that line ($upright(bold(a))_(j k)$ maps to $upright(bold(b))_(j + k \, - 1 - k)$) and glue the multipaths with identical occupancies to form disjoint polygons. Every separator must cross this line and splits uniquely into such arcs. Sum orientations by giving spin $+ 1$ at upward crossings and $- 1$ at downward crossings (to both factors); these are exactly the compatible assignments. Termwise gluing and sums here are absolutely convergent by the finite multipath masses at fixed period.

Compactifying the two cylinder ends gives two disks with the seam as their common boundary (Figure 2). The annular data forgotten by a disk state record which interior face contains its filled cylinder end. The marks $f \, f'$ remain on the seam, so forgetting those interior end marks preserves their separation test and the block twist.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.176, fill: rgb("#fafafa"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  arc((-1.176, 1.44e-16), start: 180deg, stop: 0deg, radius: 1.176, stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  content((0, 1.732), [#text(fill: rgb("#0000a6"))[block $A$]])
  content((0, 2.184), [Upper disk])
  bezier((-1.018, 0.588), (7.201e-17, 1.176), (-0.4387, 0.5228), (-0.2334, 0.6413), stroke: (paint: rgb("#404040"), thickness: 0.8pt, cap: "round", join: "round"))
  bezier((1.018, 0.588), (1.018, -0.588), (0.6721, 0.1185), (0.6721, -0.1185), stroke: (paint: rgb("#404040"), thickness: 0.8pt, cap: "round", join: "round"))
  bezier((7.201e-17, -1.176), (-1.018, -0.588), (-0.2334, -0.6413), (-0.4387, -0.5228), stroke: (paint: rgb("#404040"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((-1.018, 0.588), radius: 0.04586, fill: black, stroke: none)
  content((-1.218, 0.7035), [$1$])
  circle((7.201e-17, 1.176), radius: 0.04586, fill: black, stroke: none)
  content((8.615e-17, 1.407), [$2$])
  circle((1.018, 0.588), radius: 0.04586, fill: black, stroke: none)
  content((1.218, 0.7035), [$3$])
  circle((1.018, -0.588), radius: 0.04586, fill: black, stroke: none)
  content((1.218, -0.7035), [$4$])
  circle((7.201e-17, -1.176), radius: 0.04586, fill: black, stroke: none)
  content((8.615e-17, -1.407), [$5$])
  circle((-1.018, -0.588), radius: 0.04586, fill: black, stroke: none)
  content((-1.218, -0.7035), [$6$])
  circle((0, 0), radius: 0.07761, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round"))
  content((0, -0.2625), [#text(fill: rgb("#808080"))[end]])
  circle((-1.176, 0), radius: 0.0635, fill: rgb("#b20000"), stroke: none)
  content((-1.317, 0), [$f$], anchor: "east", padding: 0.1176cm)
  circle((1.176, 0), radius: 0.0635, fill: rgb("#b20000"), stroke: none)
  content((1.317, 0), [$f'$], anchor: "west", padding: 0.1176cm)
  circle((5.46, 0), radius: 1.176, fill: rgb("#fafafa"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  arc((4.284, -1.44e-16), start: -180deg, stop: 0deg, radius: 1.176, stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  content((5.46, -1.732), [#text(fill: rgb("#0000a6"))[block $A$]])
  content((5.46, 2.184), [Lower disk])
  bezier((4.442, -0.588), (4.442, 0.588), (4.788, -0.1185), (4.788, 0.1185), stroke: (paint: rgb("#404040"), thickness: 0.8pt, cap: "round", join: "round"))
  bezier((5.46, -1.176), (6.478, -0.588), (5.693, -0.6413), (5.899, -0.5228), stroke: (paint: rgb("#404040"), thickness: 0.8pt, cap: "round", join: "round"))
  bezier((6.478, 0.588), (5.46, 1.176), (5.899, 0.5228), (5.693, 0.6413), stroke: (paint: rgb("#404040"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((4.442, -0.588), radius: 0.04586, fill: black, stroke: none)
  content((4.242, -0.7035), [$1$])
  circle((5.46, -1.176), radius: 0.04586, fill: black, stroke: none)
  content((5.46, -1.407), [$2$])
  circle((6.478, -0.588), radius: 0.04586, fill: black, stroke: none)
  content((6.678, -0.7035), [$3$])
  circle((6.478, 0.588), radius: 0.04586, fill: black, stroke: none)
  content((6.678, 0.7035), [$4$])
  circle((5.46, 1.176), radius: 0.04586, fill: black, stroke: none)
  content((5.46, 1.407), [$5$])
  circle((4.442, 0.588), radius: 0.04586, fill: black, stroke: none)
  content((4.242, 0.7035), [$6$])
  circle((5.46, 0), radius: 0.07761, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round"))
  content((5.46, -0.2625), [#text(fill: rgb("#808080"))[end]])
  circle((4.284, 0), radius: 0.0635, fill: rgb("#b20000"), stroke: none)
  content((4.143, 0), [$f$], anchor: "east", padding: 0.1176cm)
  circle((6.636, 0), radius: 0.0635, fill: rgb("#b20000"), stroke: none)
  content((6.777, 0), [$f'$], anchor: "west", padding: 0.1176cm)
  content((2.73, -2.247), [Identify equally numbered ports and the two copies of the seam.])
})],
  caption: [Figure 2: A six-port gluing example. The two disks have opposite boundary orientations, and equally numbered ports are identified. The hollow interior marks are the compactified cylinder ends; their faces are forgotten by the disk state. The seam marks $f \, f'$ and the highlighted block $A$ remain fixed. In the spin pairing this block carries $m^(sum_(i in A) s_i)$, with $m = q^(- 2) e^(i theta)$. ],
) <fig:disk-gluing>

For an oriented polygon, its arc factors in the two vectors together multiply to $q^2$ if $f$ lies to its left, $q^(- 2)$ otherwise (sides can be taken on the sphere compactifying both ends of the cylinder). Indeed flatten that sphere minus $f$ to the oriented plane with the seam as horizontal line in increasing port order, orthogonality at crossings maintained. For instance in complex plane coordinates of the cylinder use $xi = exp \( 2 pi i \( Z - f \) \/ L \)$ with period $L = 2 n \| U \|$, then $i \( 1 + xi \) \/ \( 1 - xi \)$. Each upper or lower simple arc has total turn $- pi$ times its earlier-endpoint spin, by closing against the line; joins go straight. The polygon turn is $- 2 pi$ if its unbounded side is on its left and $+ 2 pi$ otherwise, giving the asserted product of $q^(s_(upright("earlier")))$. The sum of spins in the initial block for this polygon equals its $f$-left indicator minus its $f'$-left indicator (the indicator drops across an upward crossing moving positively on the seam). Thus if it separates, the twist $m$ with the arc product gives $e^(plus.minus i theta)$; otherwise the two orientations cancel since $q^2 + q^(- 2) = 0$. This proves the interpretation, in particular $V_(n \, n) = 1$ at $theta = pi \/ 2$ and positivity and monotonicity in $2 cos theta gt.eq 0$. Every separator crosses the seam segment from $f$ to $f'$ at one of its $n$ ports. Disjoint polygons use distinct ports, so there are at most $n$ separators. Thus the partition function is a polynomial in $2 cos theta$, with finite nonnegative coefficients. This physical interpretation is only asserted at balanced homogeneity; the rapidity-dependent pairing remains an algebraic object.

===== 5.3.2 Scalar reductions. <scalar-reductions.>

We return to generic rapidities. The pairing is separately symmetric by exchange, transpose symmetry of the noncyclic boxes, conservation of total spin there and unitarity. Multiplying by $p_N \( x \)^2$ gives polynomial of degrees $lt.eq 2 N - 2$ each by (5.4), inversion and pairing equal occupancies. Within a block, paired reductions give simple deletion at difference $3 lambda$ or merging at $2 lambda$ for $V$: order adjacently descending in the block. One vector inserts $L$; the other reduces on application of $L^t$, since its exchange by $L L^t$ gives $L$ of the reduced vector and $L$ is injective. The twist passes through $L$ by spin conservation. There is single-site deletion also at zero and infinity, and clustering the adjacent sites on either side of the internal block boundary (say at zero) factors off $V_(1 \, 1)$.

For clarity, we record these normalized scalar rules explicitly. Fix $theta$ and write $V_(k \, l) \( X_A \; X_B \)$, where the subscripts give the lengths of the two variable lists; put $N = k + l$ and $X = \( X_A \, X_B \)$. All specializations below are at generic nonzero values of the remaining variables. For $k gt.eq 2$, the two same-block rules in $A$ are

$ V_(k \, l) \( X_A \, q^3 y \, y \; X_B \) & = V_(k - 2 \, l) \( X_A \; X_B \) \,\
V_(k \, l) \( X_A \, q u \, u \/ q \; X_B \) & = V_(k - 1 \, l) \( X_A \, u \; X_B \) . $

Here $X_A$ has length $k - 2$ on both left-hand sides; the identical rules apply in $B$. These identities concern the normalized pairing $V$. After multiplication by $p_N^2$, their scalar factors are the corresponding factors in (5.3), squared. For $k gt.eq 1$, single-site deletion is

$ lim_(x arrow.r 0) V_(k \, l) \( X_A \, x \; X_B \) = lim_(x arrow.r oo) V_(k \, l) \( X_A \, x \; X_B \) = V_(k - 1 \, l) \( X_A \; X_B \) \, $

and likewise in $B$. For $k \, l gt.eq 1$, the two sites adjacent across the block boundary satisfy, for fixed generic $u \, v$,

$ lim_(epsilon arrow.r 0) V_(k \, l) \( X_A \, epsilon u \; epsilon v \, X_B \) = V_(k - 1 \, l - 1) \( X_A \; X_B \) V_(1 \, 1) \( u \; v \) . $

The same $theta$ is used in all factors. Separate symmetry permits the sites involved in a same-block rule to be moved next to each other.

#thm([Lemma 5.3.])[
  (Uniqueness of the scalar pairing).  #emph[Suppose $V_(k \, l) \( X_A \; X_B \)$, for $k \, l gt.eq 0$, are separately symmetric rational functions of the two variable lists. Assume that $p_N \( X \)^2 V_(k \, l) \( X_A \; X_B \)$ is a polynomial of degree at most $2 N - 2$ in each variable for $N gt.eq 1$, and that the deletion, merging, single-site and two-site scalar rules above hold. Then the family is determined by $V_(0 \, 0)$ and $V_(1 \, 1)$.]
] <c2:lem-scalar-uniqueness>

#proof[
  Compare two families and choose the least total size $N$ at which they differ. Write $D = p_N^2 \( V - tilde(V) \)$. The single-site rules make $D$ vanish at $x_i = 0$ and remove its top coefficient in $x_i$: indeed (5.3) and inversion give nonzero generic leading and constant coefficients for $p_N$. Thus $deg_(x_i) D lt.eq 2 N - 3$. For a site in block $A$, the pair rules supply another $4 \( k - 1 \)$ distinct generic roots $x_i = q^(plus.minus 2) x_j \, q^(plus.minus 3) x_j$ with $j$ in that block. The corresponding count in block $B$ is $4 \( l - 1 \)$. If $k > l$, the first count together with the zero root exceeds $2 N - 3$; if $l > k$, use the second. Either case forces $D = 0$. The same single-site argument covers total size one.
  When $k = l$, the roots account for the full degree in every variable. Hence the only possible difference is a constant times
  $ product_i x_i med product_(i < j med upright(s a m e med b l o c k)) product_(b in { 2 \, 3 \, - 2 \, - 3 }) \( x_j - q^b x_i \) . $
  To determine the constant, take one site from each block to zero proportionally. The two-site rule and minimality of $N$ give $V - tilde(V) = o \( 1 \)$; its lower factor and $V_(1 \, 1)$ agree in the two families. The two-site limit above shows that $p_N$ vanishes linearly along this specialization at generic proportions. Therefore $D = o \( epsilon^2 \)$. The displayed product vanishes to exactly order two, so its constant is zero. The prescribed sizes zero and $\( 1 \, 1 \)$ finish the induction. ◻
]

===== 5.3.3 An explicit scalar gas. <an-explicit-scalar-gas.>

The preceding reductions characterize the scalar pairing. We now give a gas with those reductions and verify all of them. Its labels $r_i in { - 1 \, 0 \, 1 }$ are gas variables, not the spin coordinates $s_i$ of the disk vector. Label zero is a vacant gas site; the two nonzero labels will later become contour residues. The gas sum imposes signed neutrality $sum_A r_i - sum_B r_i = 0$. Its equality with the twisted contraction will follow from the scalar characterization, rather than a direct identification of gas labels with spins.

We use a centered version of the fixed scalar polynomial, so that its pair factors depend on rapidity differences. Put $frak(p)_j \( w \) = 2 sin \( w - j lambda \)$ for a rapidity argument; write $cal(P)_N = p_N \( x \) product_i x_i^(- \( N - 1 \) \/ 2)$ for the centered Pf polynomial. For labels $r \, s = - 1 \, 0 \, 1$ in that order use factors $g_(t \, r \, s) \( w \)$, row-column entries with $t = 0$ (same block) or $1$ (opposite blocks), argument later rapidity minus earlier:

$ g_0 = mat(delim: "(", frak(p)_2 frak(p)_3 frak(p)_5 frak(p)_6, - frak(p)_3 frak(p)_5 frak(p)_6 \/ frak(p)_0, frak(p)_5 frak(p)_6 \/ \( frak(p)_0 frak(p)_1 \); frak(p)_2 frak(p)_3 frak(p)_5 \/ frak(p)_0, frak(p)_2 frak(p)_3 frak(p)_5 frak(p)_6 \/ \( frak(p)_1 frak(p)_7 \), - frak(p)_3 frak(p)_5 frak(p)_6 \/ frak(p)_0; - frak(p)_2 frak(p)_3 \/ \( frak(p)_0 frak(p)_7 \), frak(p)_2 frak(p)_3 frak(p)_5 \/ frak(p)_0, frak(p)_2 frak(p)_3 frak(p)_5 frak(p)_6) \, #h(2em) g_1 = mat(delim: "(", 1, frak(p)_5^2, frak(p)_5^2 frak(p)_6^2; frak(p)_3^2, frak(p)_4^2, frak(p)_5^2; frak(p)_2^2 frak(p)_3^2, frak(p)_3^2, 1) . $

#thm([Proposition 5.4.])[
  (Scalar-gas identity).  #emph[For the two consecutive blocks and the factors just defined, 
#[#set math.equation(numbering: n => "(5.5)")
 $ cal(P)_N^2 V_(k \, l) = sum_(sum_A r_i = sum_B r_i = j) e^(i theta j) mu^(sum_i \| r_i \|) product_(i < h) g_(t \( i \, h \) \, r_i \, r_h) \( z_h - z_i \) \, $ <c2:eq-24>]

 where $j$ also ranges over the integers.]
] <c2:prop-scalar-gas>

#proof[
  We apply Lemma 6. There are three checks: cancellation of the apparent poles, agreement with fusion, and the single-site and two-site limits. We work after dividing the proposed expression by $cal(P)_N^2$ at generic parameters. Each matrix has reversal symmetry $g_t \( - w \) = g_t \( w \)^t$, giving the required symmetry of the sum. Thus simple poles at same-block coincidences vanish. At argument $lambda$ in that block there are two possible residues, from $\( - \, + \)$ and $\( 0 \, 0 \)$; they cancel including the $mu^2$ weight ($mu^2 = 2 - d$, and $g_(0 \, 0 \, 0) \/ g_(0 \, - \, +) = frak(p)_2 frak(p)_3 frak(p)_0 \/ frak(p)_7$ there by cancellation). Spectators see identical factors since
  $ g_(t \, 0 \, v) \( u \) g_(t \, 0 \, v) \( u - lambda \) = g_(t \, - \, v) \( u \) g_(t \, + \, v) \( u - lambda \) . $
  Use reversal for $- lambda$; there are no other finite rapidity poles modulo $pi$. With block signs $epsilon.alt_i = + 1 \, - 1$, the net number of sine powers per pair is $2 + 2 epsilon.alt_i epsilon.alt_h r_i r_h$, even; thus these are rational functions of the $x$’s. A term grows at most with power $N - 1 - r_i^2$ of $x_i^(plus.minus 1)$ at infinity and zero by signed neutrality. Multiplying the sum by $product x_i^(N - 1)$ now gives a polynomial with the required degrees.
  At same-block argument $2 lambda$ only $\( - \, 0 \) \, \( - \, + \) \, \( 0 \, + \)$ survive with factors $2 \, 2 + d \, 2$, and give new label $r + s$ at the midpoint. At $3 lambda$ only $\( - \, + \)$ survives with factor one, the pair deleting. In these respective cases
  $ g_(t \, r \, v) \( u \) g_(t \, s \, v) \( u - 2 lambda \) & = frak(p)_5 \( u \)^2 g_(t \, r + s \, v) \( u - lambda \) \,\
g_(t \, - \, v) \( u \) g_(t \, + \, v) \( u - 3 lambda \) & = frak(p)_5 \( u \)^2 frak(p)_6 \( u \)^2 . $
  All three spectator identities follow by termwise shifts in the displayed arrays, using
  $ frak(p)_j \( u - m lambda \) = frak(p)_(j + m) \( u \) \, #h(2em) frak(p)_(j + 8) = - frak(p)_j . $
  For instance for $\( t \, r \, s \) = \( 0 \, - \, 0 \)$ the quotients by $g_(t \, - \, v) \( u - lambda \)$ read successively
  $ \( frak(p)_2 frak(p)_3 frak(p)_5 frak(p)_6 \) \( frak(p)_4 frak(p)_5 frak(p)_7 \/ frak(p)_2 \) \/ \( frak(p)_3 frak(p)_4 frak(p)_6 frak(p)_7 \)\
\( - frak(p)_3 frak(p)_5 frak(p)_6 \/ frak(p)_0 \) \( frak(p)_4 frak(p)_5 frak(p)_7 frak(p)_8 \/ \( frak(p)_3 frak(p)_9 \) \) \/ \( - frak(p)_4 frak(p)_6 frak(p)_7 \/ frak(p)_1 \)\
\( frak(p)_5 frak(p)_6 \/ \( frak(p)_0 frak(p)_1 \) \) \( - frak(p)_5 frak(p)_7 frak(p)_8 \/ frak(p)_2 \) \/ \( frak(p)_6 frak(p)_7 \/ \( frak(p)_1 frak(p)_2 \) \) . $
  all $frak(p)_5^2$. Including one-body factors, the new pair constants relative to the lower weights are always $2$ or $mu^2$ in the $2 lambda$ or $3 lambda$ case ($\( 2 + d \) mu^2 = 2$). Together with the spectator factors these are exactly (5.3) squared in centered normalization: for $z_j = z_i + 2 lambda$ the prefactor there before squaring is $d product_(k med upright("ext")) 2 cos \( z_k - z_i - lambda \)$, and for $3 lambda$ it is $mu product_(k med upright("ext")) frak(p)_5 \( z_k - z_i \) frak(p)_6 \( z_k - z_i \)$. Each lower label choice has a unique surviving lift.
  For the needed clusters (one small variable, one large, or the adjacent cross-block pair small proportionally), place the smaller-in-magnitude group first for the cross products by reversal symmetry. If this group has nonzero signed charge $a = sum epsilon.alt_i r_i$, its relative term decays with scale power $a^2$ compared to the leading $product_(i med upright("small") \, h med upright("large")) x_h \/ x_i$. Otherwise both groups are neutral and factor independently with leading coefficient one for their interaction. Indeed the constant for large $x_h \/ x_i$ in $g_(t \( i \, h \) \, r_i \, r_h)$ after pulling out $\( x_h \/ x_i \)^(1 + epsilon.alt_i epsilon.alt_h r_i r_h)$ is $exp \[ i lambda epsilon.alt_i epsilon.alt_h \( 2 - r_i r_h \) \( r_h - r_i \) \]$, using $frak(p)_b \( w \) tilde.op - i e^(i w - i b lambda)$. Both phases and extra powers therefore cancel across separately neutral groups by summing exponents. $cal(P)_N^2$ has the same product clustering with this leading interaction: use (5.3) and inversion for single-variable tests, and the linear term of $p_N$ above for the pair test. Thus the proposed normalized gas has the required cluster rules (one site alone neutral just contributes one). Size zero is clear and at $\( 1 \, 1 \)$ both sides of (5.5) equal $4 cos^2 \( z_1 - z_2 \) + 2 mu^2 cos theta$. This proves (5.5). ◻
]

=== 5.4 From the scalar gas to contour residues <c2:sec-contour-representation>

The finite scalar identity has one nonzero label at most at each site. We encode its occupied sites as residues of contour integrals. The apparent sum over arbitrarily many contour variables will still be finite: repeated use of one site has zero residue. Letters have labels $X = A \, B$ and charges $R = r e_X \, med r = plus.minus 1$, in a two-dimensional space (unit coordinate vectors). Recall $frak(p)_j \( v \) = 2 sin \( v - j lambda \)$,

$ K_(A A) = K_(B B) = - frak(p)_0^2 frak(p)_2 frak(p)_6 \/ \( frak(p)_1 frak(p)_7 \) \, #h(2em) K_(A B) = K_(B A) = frak(p)_4^2 \/ \( frak(p)_3^2 frak(p)_5^2 \) \, #h(2em) c_star.op = lim_(s arrow.b 0) sqrt(K_(A A) \( i s \)) \/ s . $

Use the pair factors $K_(X_i X_j) \( v_i - v_j \)^(r_i r_j)$, and the one-letter factors $r c_star.op F \( v \)^(n r) thin d v \/ \( 2 pi i \)$ with

$ F \( v \) = frac(sin \( v - lambda \/ 2 \) sin \( v + 3 lambda \/ 2 \) cos^2 \( v - lambda \/ 2 \), sin \( v + lambda \/ 2 \) sin \( v - 3 lambda \/ 2 \) cos^2 \( v + lambda \/ 2 \)) . $

For nonnegative counts $n_(A \, +) \, n_(A \, -) \, n_(B \, +) \, n_(B \, -)$, take the product of these one-letter and pair factors and divide by $product_(X \, r) n_(X \, r) !$. Integrate on small positively oriented circles about $- r lambda \/ 2$ and sum over the four counts. Keep $sum R_i = \( frak(q) \, frak(q) \)$, $frak(q)$ unrestricted, and include $e^(i theta frak(q))$. Write $cal(Z)_n$ for this sum.

===== 5.4.1 Matching the scalar gas with contour residues. <matching-the-scalar-gas-with-contour-residues.>

At balanced homogeneity (5.5) is precisely

$ p_(2 n) \( 1 \, dots.h \, 1 \)^2 V_(n \, n) = \( 2 + d \)^(2 n \( n - 1 \)) 4^(n^2) cal(Z)_n \( theta \) \, $

The large factor on the right is the product of all vacant pair weights. In particular, the physical identity $V_(n \, n) \( pi \/ 2 \) = 1$ fixes a nontrivial value of $cal(Z)_n \( pi \/ 2 \)$; it does not normalize that contour gas to one. To prove the residue identity, abbreviate $K_0 = K_(A A) = K_(B B)$ and $K_1 = K_(A B) = K_(B A)$; the normalization above is $c_star.op = 4 cos lambda$. Extract the product of all $\( 0 \, 0 \)$ pair factors from (5.5) and associate each nonzero label to a letter at $v_i = z_i - r_i lambda \/ 2$. Put $u_(t \, r) = g_(t \, 0 \, r) \/ g_(t \, 0 \, 0)$. Direct substitution gives, for nonzero charges,

$ frac(g_(t \, r \, s) \( w \) g_(t \, 0 \, 0) \( w \), g_(t \, r \, 0) \( w \) g_(t \, 0 \, s) \( w \)) & = K_t \( w - \( s - r \) lambda \/ 2 \)^(r s) \,\
u_(0 \, r) \( w \) u_(1 \, r) \( w \) & = F \( w - r lambda \/ 2 \)^r \,\
r c_star.op "Res"_(w = 0) u_(0 \, r) \( w \) & = mu . $

For example $u_(0 \, +) = - frak(p)_1 frak(p)_7 \/ \( frak(p)_0 frak(p)_2 \) \, med u_(1 \, +) = frak(p)_5^2 \/ frak(p)_4^2 \, med u_(t \, -) \( w \) = u_(t \, +) \( - w \)$; for $\( r \, s \) = \( - \, + \)$ the left quotient is $frak(p)_2 frak(p)_0 \/ \( frak(p)_3 frak(p)_1^2 frak(p)_7 \)$ if $t = 0$, $frak(p)_6^2 frak(p)_4^2 \/ frak(p)_5^2$ if $t = 1$, with equal-charge quotients just $K_t \( w \)$.

Use identical generic small rapidity lists $\( zeta_j \)_(j lt.eq n)$ in each block, replacing $F \( v \)^(n r)$ under the integral by $product_j F \( v - zeta_j \)^r$. Small circles then enclose simple individual poles at the shifted sites; all pair factors with indicated powers are regular on these small polydisks. Repeating a site within the same block costs a zero (of $K_0$ at 0 for equal charges, or of $1 \/ K_0$ at $plus.minus lambda$ for opposite). Thus residues choose nonzero labels on distinct sites in each block, orderings canceled by the factorials. For an active site $i$, the missing same-block self factor is supplied as $r_i c_star.op "Res" u_(0 \, r_i) = mu$, while the opposite-block site at the same rapidity contributes the ordinary $u_(1 \, r_i) \( 0 \)$. The other $u$ factors and the pair corrections in the identities then give exactly (5.5) divided by the extracted product. Take the lists back to zero by continuity (each order with more than $2 n$ letters already vanishes separately); the extracted factor is regular there with same-block value $\( 2 + d \)^2$ per pair and cross-block value $4$.

== 6 A contour bound for the two-gap cylinder sum <c2:sec-contour>

We estimate the homogeneous gas $cal(Z)_n$ defined above. Throughout the analysis,

$ nu = frac(pi, 3 lambda) \, #h(2em) c_s = 9 / 8 \, #h(2em) lambda = pi / 8 \, quad d = sqrt(2) . $

#thm([Theorem 6.1.])[
  (Homogeneous gas bound).  #emph[As $n arrow.r oo$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ log \| cal(Z)_n \( theta \) e^(- A_oo n^2) \| \/ log n med lt.eq med 3 / 8 - frac(2, 3 pi^2) Re \( theta^2 \) + o \( 1 \) \, #h(2em) A_oo = log #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] 4 \( 2 + d \)^2 \/ 81 #scale(x: 120%, y: 120%)[\)] $ <c2:eq-V1>]

 uniformly in a fixed complex neighborhood of $\[ 0 \, pi \/ 2 \]$.]
] <c2:thm-contour-bound>

The proof has two analytic steps. In Section 6.1 we periodize the gas, express it as an oscillator trace, and reflect the currents. The reflection replaces an oscillating source by a decaying one, but also replaces the interaction matrix by its inverse. In Section 6.2 we prove coercivity for this new interaction, including every residue created when the contours move. These estimates control the complete sum over particle numbers and permit the period to return to infinity. The determinant estimate in Section 7 gives sharpness at $pi \/ 2$ in the gluing identity

$ P_(2 n)^2 V_(n \, n) \( theta \) = \( 2 + d \)^(2 n \( n - 1 \)) 4^(n^2) cal(Z)_n \( theta \) \, #h(2em) P_m = p_m \( 1 \, dots.h \, 1 \) $

($p_m$ here is the Pfaffian polynomial, as distinct from the sine factors $frak(p)_j$). Thus this analysis uses the gluing identity and positivity from the algebra/geometric parts only when applying (6.1).

=== 6.1 Elliptic deformation and reflection of currents <c2:sec-currents>

We begin with a real period $T$. The period is an analytic device and will eventually tend to infinity; it is not the circumference of the physical cylinder. Fourier analysis determines the interaction before we introduce its oscillator representation.

Take $T$ large and put $y = - i v \, med omega = 2 pi \/ T \, med a = lambda p$ for Fourier variable $p$. Use projectors $P_s \, P_d$ onto $\( 1 \, 1 \) \, \( 1 \, - 1 \)$, respectively (these projector symbols below do not denote Pfaffians), and write suffixes $+ \, -$ for the two corresponding eigenvalues. Set

$ M_plus.minus \( p \) = frac(cosh 4 a - cosh 3 a + cosh 2 a med plus.minus \( 1 - 2 cosh a \), sinh 4 a) \, #h(2em) M = M_(+) P_s + M_(-) P_d . $

For $p > 0$ the numerators factor as $\( C - 1 \) \( 2 C - 1 \) \( 2 C + 1 \)^2 \, med \( C + 1 \) \( 2 C - 1 \)^3 \, med C = cosh a$. At zero $M_(+) = c_s a + O \( a^3 \) \, med M_(-) = 1 \/ \( 2 a \) + O \( a \)$; at $+ oo$, $M = I + O \( e^(- a) \)$. With physical-axis notation $cal(K)_(X Y) \( s \) = log K_(X Y) \( i s \)$ (real there), and transform convention $e^(- i p s)$, we have

$ accent(cal(K) - 4 P_d \| dot.op \|, ̂) = - 2 pi (M \/ p - P_d \/ \( 2 lambda p^2 \)) . $

In fact the diagonal and off-diagonal entries of $cal(K)$ are $S_0 + S_2 - S_1 \, med S_4 - 2 S_3$, with $S_j \( s \) = log \( 4 \| sin \( i s - j lambda \) \|^2 \)$. Expand in $e^(- 2 \| s \|)$: the transform of $S_j - 2 \| s \|$ is $- 8 sum_(h gt.eq 1) cos \( 2 h j lambda \) \/ \( 4 h^2 + p^2 \) = - 2 pi cosh \( \( 4 - j \) a \) \/ \( p sinh 4 a \) + 4 \/ p^2$, for $0 lt.eq j lt.eq 8$. The Fourier sum follows by periodizing a decaying exponential and computing its coefficients.

Replace $F$ by $F_T \( v \) = product_(k in bb(Z)) F \( v + i k T \)$ (unit tails); use pair logs

$ cal(K)^T \( s \) = 4 P_d \| s \| + sum_(k in bb(Z)) (cal(K) \( s + k T \) - 4 P_d \| s + k T \|) \, $

with the corresponding half diagonal finite part for $log c_star.op$ (subtract $2 log \| s \|$ before taking half), and meromorphic continuation of factors. For coordinates write $D = sum y_i R_i \, med Q = sum R_i$; subscripts $s \, d$ on a vector denote #emph[unnormalized] components (sum, difference). Insert also

$ frac(sum_(j in bb(Z)) exp \( - 2 T j^2 + 4 j D_d \), sum_(j in bb(Z)) exp \( - 2 T j^2 \)) . $

On the small circles the prescriptions are analytic near nome $e^(- 2 T) = 0$, with value there the trigonometric integrands (denote the new sum by $cal(Z)_(n \, T)$); indeed each nonzero pair image uses the trigonometric ratio divided by its own exponential leading term (continue from bounded real $s$ with the real sign of the translate), and the self constant uses the branch fixed by $c_star.op$ at nome zero. One can take fixed sufficiently small circles and nome disk independent of $n$, since the pole positions and this local continuation of the factors do not depend on the powers $n$. Only orders with at most $2 n$ letters can contribute: split the $n$ coincident sources into slightly translated ones (same translations for plus and minus on one label). Picking simple residues, repeating a chosen site on that label costs a zero at displacement 0 or $plus.minus lambda$; the other pair factors are regular. Take translations back to zero.

==== 6.1.1 Oscillator traces and the initial contour deformation <oscillator-traces-and-the-initial-contour-deformation>

We represent the elliptic gas as a trace so that a current reflection can exchange the interaction matrix with its inverse. The momentum lattice is

$ upright(bold(p))_A = \( upright(bold(p))_s + upright(bold(p))_d \) \/ 2 \, #h(2em) upright(bold(p))_B = \( upright(bold(p))_s - upright(bold(p))_d \) \/ 2 \, #h(2em) \( upright(bold(p))_s \, upright(bold(p))_d \) in bb(Z)^2 . $

Thus the two label momenta are either both integers or both half-integers. Use the shifts $V_R \| upright(bold(p)) chevron.r = \| upright(bold(p)) + R chevron.r$, and at each level $m gt.eq 1$ two ordinary oscillators $\[ a_m \, a_m^(*) \] = I$ (on oscillator polynomials: multiplication $a^(*)$, derivatives $a$, orthogonal monomials of norms squared the multifactorials). All independent variables commute. With $z = e^(omega v)$ insert fields in smaller-radius-#emph[left] order:

$ E_R \( v \) = omega V_R z^(- 2 R dot.op upright(bold(p)) - 1) exp (- sum_(m > 0) sqrt(2 \/ m) thin z^(- m) R dot.op a_m^(*)) exp (sum_(m > 0) sqrt(2 \/ m) thin z^m R dot.op a_m) . $

The momentum transfer in $U$ is $\| upright(bold(p)) chevron.r mapsto w \( upright(bold(p)) \) \| \( - upright(bold(p))_B \, - upright(bold(p))_A \) chevron.r \, med w = exp \[ - omega lambda \( c_s upright(bold(p))_s^2 + 2 upright(bold(p))_d^2 \) \]$. On oscillator monomials it is the induced action of $r_m = \( M - I \) \( M + I \)^(- 1) \|_(p = m omega)$. Use $"Tr" \( U thin dots.h.c \) \/ "Tr" U$.

To check, the oscillator factor (including $omega^N$ for $N$ letters) on the axis at distinct points has log-modulus

#[#set math.equation(numbering: n => "(6.2)")
 $ N log omega - sum_(m > 0) 1 / m (sum_(i j) R_i dot.op M \( m omega \) R_j cos \( m omega \( y_i - y_j \) \) - N) . $ <c2:eq-V2>]

There are three parts to the trace calculation. First separate the radii slightly, commute annihilations past creations, and pass to boundary values. For a scalar oscillator under transfer $r^k$ on degree $k$, the normalized trace of $e^(h a^(*)) e^(b a)$ equals $exp \( h b r \/ \( 1 - r \) \)$ by summing the geometric series and its derivatives. Second, keep the phases and momentum shifts that the log-modulus does not record. The ordered-commutator phase per $i < j$ is $exp \[ i R_i dot.op R_j \( omega \( y_i - y_j \) - pi "sign" \( y_i - y_j \) \) \]$ on one period by the sine series. The sign product under neutrality is $\( - 1 \)^(frak(q)^2 - N \/ 2) = product r_i$. Combining linear parts with all the field powers gives $exp \[ - i omega D dot.op \( 2 upright(bold(p)) + Q \) \]$, using initial momentum $upright(bold(p))$ on the right. Since the fields first change the rightmost momentum from $upright(bold(p))$ to $upright(bold(p)) + Q$, the trace closes exactly when

$ \( upright(bold(p))_A \, upright(bold(p))_B \) = \( - upright(bold(p))_B - Q_B \, - upright(bold(p))_A - Q_A \) . $

Equivalently $Q = \( frak(q) \, frak(q) \)$ and $upright(bold(p))_s = - frak(q)$, while $upright(bold(p))_d$ is free. Gaussian Poisson summation of $upright(bold(p))_d$ gives the inserted theta ratio times $exp \[ - omega D_d^2 \/ \( 8 lambda \) - omega lambda c_s frak(q)^2 \]$. Third, compare this answer with the periodized pair and self energies. The Gaussian factors just obtained supply exactly their zero and quadratic modes: $cal(K)^T - 4 P_d \( s^2 \/ T + T \/ 6 \)$ on $\[ - T \, T \]$ is periodic with modes $- M \( m omega \) \/ m$ at $plus.minus m$, by the transform and the Fourier series of $\| s \| - s^2 \/ T - T \/ 6$. The regular mean and the quadratic part, applied to $Q_d = 0$, give the two extra exponents; point-splitting the $i = j$ singular term gives $log omega$ by the cosine series. This proves the representation using $F_T \( v \)^(n r) eta_X^r E_R \( v \) thin d v \/ \( 2 pi i \)$, where $eta_A eta_B = e^(i theta)$. It also shows the full neutral integrands have imaginary period $i T$ in each variable.

Take outer axes at $plus.minus b lambda$ in real part of $v$, for $b > 1 \/ 2$ sufficiently close to $1 \/ 2$, and central axes at small $plus.minus epsilon.alt_1 lambda$. Deform the circles coefficientwise to differences of ascending axes: for a plus letter, center (at $- epsilon.alt_1 lambda$) minus left outer axis; for a minus, right outer minus center (at $+ epsilon.alt_1 lambda$). Indeed they bound cylinders enclosing the desired respective source poles; no pairwise poles intervene (at relative distance $lambda$ between opposite charges one can have zeros). We spell out convergence estimates below. Per label put $f_X = eta_X F_T^n$. Let $C_(+)$ and $C_(-)$ be the ascending central lines at real parts $- epsilon.alt_1 lambda$ and $+ epsilon.alt_1 lambda$, respectively, traversed for one imaginary period. For one label define the ordered contour exponentials by their power series:

$ cal(E)_plus.minus \( g \) = exp #h(-0.16667em) (integral_(C_plus.minus) g \( v \) E_(plus.minus e_X) \( v \) thin frac(d v, 2 pi i)) . $

At this stage identities are coefficientwise; convergence of the summed expressions is proved below. The central product can be written

$ cal(E)_(+) \( f_X \) cal(E)_(-) \( - 1 \/ f_X \) = W \( f_X \) cal(E)_(+) \( - f_X \) \, #h(2em) W \( f \) = cal(E)_(+) \( f \) cal(E)_(-) \( - 1 \/ f \) cal(E)_(+) \( f \) . $

Operators on different labels commute in this manipulation.

==== 6.1.2 The Weyl action and reflected one-body factor <the-weyl-action-and-reflected-one-body-factor>

This is the level-one lattice current construction of Frenkel–Kac and Segal [6,20]; an explicit classical realization is given in [5] Section 2.1. The calculation here fixes the action on momentum vacua and the signs that determine the reflected interaction.

We compute the current reflection on each energy shell, and then its action on the full gas. The energy operator is $cal(H) = upright(bold(p))^2 + sum m a_m^(*) dot.op a_m$. On one label write $X_plus.minus \( z \) = E_(plus.minus e_X) \/ omega$, and $e \, f_(-)$ for their integrated zero modes ($d z \/ \( 2 pi i z \)$), without multipliers. They preserve finite-dimensional energy shells, since the $z$-power in a field matrix element is energy in minus energy out. On these shells $e^(*) = f_(-)$, by reversing the normal product on the unit circle. Set

$ H \( z \) = 2 upright(bold(p))_X - sum_(m > 0) sqrt(2 m) \( z^(- m) a_(X m)^(*) + z^m a_(X m) \) . $

Then $\[ e \, X_(-) \( z \) \] = H \( z \) \, med \[ f_(-) \, X_(+) \( z \) \] = - H \( z \)$; same-sign commutators vanish. In fact the ordered product $X_(+) \( zeta \) X_(-) \( z \) thin d zeta \/ zeta$ after contraction has prefactor $z \( z \/ zeta \)^(2 upright(bold(p))_X) d zeta \/ \( z - zeta \)^2$, times the combined oscillator normal product. For the commutator take the negative residue (inner minus outer contour). The calculation is coefficientwise between finite shells, where the radial expansions of the contraction times Laurent polynomials suffice. Also $\[ H \( z \) \, e \] = 2 X_(+) \( z \) \, \[ H \( z \) \, f_(-) \] = - 2 X_(-) \( z \)$ directly by oscillator commutation (the Laurent delta against a field, before taking its zero mode). Thus $\[ e \, f_(-) \] = 2 upright(bold(p))_X$, and field coefficients transform in the adjoint representation. Finite-dimensional $frak(s l)_2$ on the energy shells gives $W \( 1 \) = exp \( e \) exp \( - f_(-) \) exp \( e \)$ acting by sign flip on $H$ (including oscillators) and by $X_plus.minus mapsto - X_minus.plus$. Its action on a momentum vacuum of this boson sends $\| h chevron.r$ to $sigma \( h \) \| - h chevron.r$; the vacuum field matrix element between $h \, h + 1$ gives $sigma \( h + 1 \) = - sigma \( h \)$. Here $sigma \( 0 \) = 1 \, med sigma \( - 1 \/ 2 \) = 1$ from the singlet and defining doublet, respectively (on those minimal-energy vacua the root mode actions are read directly from $X_plus.minus$). Thus the product Weyl sign on the two vacuum labels is $\( - 1 \)^(upright(bold(p))_d)$. For integer momenta the two signs multiply to $\( - 1 \)^(upright(bold(p))_A + upright(bold(p))_B) = \( - 1 \)^(upright(bold(p))_d)$. For half-integer momenta they multiply to $\( - 1 \)^(upright(bold(p))_A + upright(bold(p))_B + 1)$, with the same value because $upright(bold(p))_s$ and $upright(bold(p))_d$ then have opposite parity.

We now insert the nonconstant source by a Cartan conjugation. Unlike the zero-mode reflection, this conjugation mixes oscillator levels; its analytic use will be justified after the contraction calculation. Define

$ cal(D) = (product_X eta_X^(upright(bold(p))_X)) exp [- n / 2 sum_(X \, m > 0) sqrt(2 m) \( L_m a_(X m)^(*) + L_(- m) a_(X m) \)] \,\
L_m = T^(- 1) hat(L) \( m omega \) \, #h(2em) L \( y \) = log F \( i y \) . $

Fixed compatible logarithms can be chosen in the powers. Use the odd imaginary decaying branch $L$, so that $log F_T = L^T$ (periodized) on the axis. Explicitly

$ hat(L) \( p \) = - frac(2 pi, p) J \( a \) \, #h(2em) J \( a \) = frac(sinh \( 7 a \/ 2 \) - sinh \( 5 a \/ 2 \) - 2 sinh \( a \/ 2 \), sinh 4 a) \, #h(2em) L_0 = 0 . $

Indeed on $y > 0$, $L = 2 i sum_(h > 0) e^(- 2 h y) \[ \( 1 + 2 \( - 1 \)^h \) sin \( lambda h \) - sin \( 3 lambda h \) \] \/ h$, with limit zero at 0 by the sine series. In transforming the odd extension, split $4 p \/ \[ h \( 4 h^2 + p^2 \) \] = \( 4 \/ p \) \( 1 \/ h - 4 h \/ \( 4 h^2 + p^2 \) \)$; the bracket’s $1 \/ h$ sums cancel, and sum the other terms by differentiating the periodic exponential formula above (or its Abel limit). Cartan commutation now gives $cal(D) E_R cal(D)^(- 1) = f_X^r E_R$ near the axis, and hence $product_X W \( f_X \) = product_X W \( 1 \)_X thin cal(D)^(- 2)$.

Push this joint $W \( f_X \)$ insertion all the way to the left (immediately after $U$), converting left outer plus fields times $f_X$ to minus fields times $- 1 \/ f_X$. The remaining central insertion consists only of plus fields, which can now be taken at 0 in real part, with the two outer axes carrying minus fields. The reflection has three effects on the trace. First, under the new transfer $U product_X W \( 1 \)_X$ the oscillator matrix is $- r_m$, hence $M$ is replaced in (6.2) by $M' = M^(- 1)$, with trace ratio $product_(m > 0) det M \( m omega \)^(- 1)$. Second, the leftmost $cal(D)^(- 2)$ changes the source and contributes a common factor $exp \( n^2 A_T \)$, where

#[#set math.equation(numbering: n => "(6.3)")
 $ A_T = 2 sum_(m > 0) frac(m thin L_m L_(- m), M_(+) \( m omega \)) . $ <c2:eq-V3>]

Indeed its unordered oscillator exponential at level $m$ has creation and annihilation vectors

$ n sqrt(2 m) thin upright(bold(1)) L_m \, #h(2em) n sqrt(2 m) thin upright(bold(1)) L_(- m) \, $

respectively. Their log self-contraction uses $M' \/ 2$; against a field on the right they give

$ n r \[ \( 1 \/ M_(+) - 1 \) L_m z^m - \( 1 \/ M_(+) + 1 \) L_(- m) z^(- m) \] . $

Thus after including $F_T^(n r)$ the nonzero modes of the one-body exponent are those of $n r log G_T$, with

$ G \( v \) = frac(cos \( nu v \) - cos \( pi \/ 6 \), cos \( nu v \) + cos \( pi \/ 6 \)) \, #h(2em) G_T \( v \) = product_(j in bb(Z)) G \( v + i j T \) . $

In fact

$ frac(J \( a \), M_(+) \( p \)) = frac(sinh a, cosh \( 3 a \/ 2 \)) . $

The same sine-pair transform, now with spacing $nu$, gives the transform of $log G \( i y \)$, for $p > 0$, as

$ - frac(2 pi sinh a, p cosh \( 3 a \/ 2 \)) . $

Third, the momentum constraint changes. The reflected transfer swaps rather than negates the two labels, so closing the trace requires

$ \( upright(bold(p))_A \, upright(bold(p))_B \) = \( upright(bold(p))_B + Q_B \, upright(bold(p))_A + Q_A \) . $

Equivalently, $Q_s = 0$ and $upright(bold(p))_d = - Q_d \/ 2$, while $upright(bold(p))_s$ ranges over all integers. The constraint $Q_s = 0$ also cancels the missing common mean in the replacement of the source. The Weyl vacuum sign, applied after the fields, is $\( - 1 \)^(upright(bold(p))_d + Q_d) = \( - 1 \)^(upright(bold(p))_d)$, independent of the remaining momentum sum. Combining the field multipliers with the $eta$-powers of $cal(D)^(- 2)$ gives $product_X eta_X^(- 2 upright(bold(p))_X - Q_X) = e^(- i theta upright(bold(p))_s)$. Since $2 upright(bold(p)) + Q = \( upright(bold(p))_s \, upright(bold(p))_s \)$, the linear position phase is $e^(- i omega D_s upright(bold(p))_s)$. Poisson summation of this Gaussian momentum sum therefore gives

#[#set math.equation(numbering: n => "(6.4)")
 $ Theta_T \( theta \, D_s \) := sum_(j in bb(Z)) exp \[ - \( theta + 2 pi j + omega D_s \)^2 \/ \( 4 omega lambda c_s \) \] . $ <c2:eq-V4>]

We collect the factors for later use. Put

$ Delta_T = product_(m > 0) det M \( m omega \)^(- 1) \, #h(2em) cal(N)_T = frac(sqrt(pi \/ \( omega lambda c_s \)), sum_(h in bb(Z)) e^(- 2 omega lambda h^2)) . $

For a fixed reflected letter list $cal(L)$, let $cal(C)_(M') \( cal(L) \)$ denote the right side of (6.2) with $M' = M^(- 1)$. On distinct physical-axis positions $v_i = i y_i$, with $T > 0$ real and $Q_s = 0$, the modulus of its scalar coefficient before integration and factorials is

$ e^(n^2 A_T) Delta_T cal(N)_T exp #h(-0.16667em) (cal(C)_(M') \( cal(L) \) - 2 omega lambda \( Q_d \/ 2 \)^2) product_i G_T \( i y_i \)^(n r_i) lr(|Theta_T \( theta \, D_s \)|) . $

Here $G_T \( i y \) > 0$; the contour and ordering signs have modulus one. The signed coefficient itself is the trace contraction just computed. Its extension away from the axis is obtained by meromorphic continuation of those factors, not by continuation of a modulus.

After collecting the linear phase, the axis logarithms of the signed pair product are the cosine series in (6.2). The remaining ordering signs are constant on each ordered region. High-mode coefficients expanded in $x = e^(- a)$ are integral, since $M$ and $M^(- 1)$ have integral Taylor coefficients. On any finite-width strip, extracting finitely many elementary factors associated with $log \( 1 - e^(- omega k lambda plus.minus i omega s) \)$ leaves an exponentially convergent remainder. Thus the continued pair factors have integer orders of zeros and poles. In Section 6.2 we estimate this continuation together with the source and momentum factors above.

==== 6.1.3 Convergence and the operator meaning of reflection <convergence-and-the-operator-meaning-of-reflection>

The algebraic reflection must also hold for the integrated trace. We justify it first for nearby contours, where energy damping gives absolute convergence, and then continue the finite outer-point expressions. Fix a finite list of unintegrated outer points on the two appropriate sides of the center. Initially place them very close to the central axes, all within the Cartan Fourier strip, and take strict radial order very near the unit circle. The old transfer at fixed real $T$ decays exponentially in energy; indeed $parallel r_m parallel lt.eq exp \( - c m omega lambda \)$ follows by positivity and continuity, with the given small/large-frequency asymptotics. Choose the small central displacements (and the starting positions in this argument) well inside the scale allowed by that decay and by the Cartan coefficients.

===== 6.1.3.1 Finite products under energy damping. <finite-products-under-energy-damping.>

Fields between energy shells have the indicated radius powers, and at unit radius $e^(- delta cal(H)) X_plus.minus e^(- delta cal(H))$ is bounded for every $delta > 0$. Indeed commute part of the side dampings toward the creation and annihilation coefficients to make them square summable. For square summable vector $h$, a creation exponential with right-hand damping $e^(- epsilon.alt cal(H))$ is bounded for each $epsilon.alt > 0$, and likewise for annihilation (or with damping on the left): on total particle number $l$, use $parallel \( h dot.op a^(*) \)^k parallel \/ sqrt(k !) lt.eq \| h \|^k binom(l + k, k)^(1 \/ 2)$, also bounding annihilations, then the exponential series ($t^l binom(l + k, k) lt.eq \( 1 - t \)^(- 1 - k)$ for $0 < t < 1$). Also $"Tr" e^(- epsilon.alt cal(H)) < oo$ by geometric products. Thus strict radial order and transfers allow absolute multiplication of fixed finite lists on nearby axes by distributing small energy dampings. More explicitly, for radius log $t$ the bound just given for fields is that $e^(\( t - delta \) cal(H)) X_plus.minus \( z \) e^(- \( t + delta \) cal(H))$ is bounded. One puts increasing weights $u_0 < u_1 < dots.h.c < u_k$ across an ordered product in the trace, estimating each insertion $Y_i$ between $e^(u_(i - 1) cal(H))$ and $e^(- u_i cal(H))$ (straddle its radius log for a field). Take the net increase inside the energy decay of the transfer, which preserves shells, so it closes the estimates in trace class. Spare strict gaps and the same trace bound for small dampings make intermediate energy matrix sums absolute.

===== 6.1.3.2 Cartan conjugations and the central series. <cartan-conjugations-and-the-central-series.>

The same estimates control $cal(D)$. Specifically, $e^(u cal(H)) cal(D)^(plus.minus 1) e^(- \( u + epsilon.alt \) cal(H))$ is bounded for sufficiently small $\| u \|$ and arbitrarily small $epsilon.alt > 0$: the shifted exponent coefficients decay exponentially and normal ordering followed by the same bounds (inserting a small intermediate loss) uses only small damping loss; momentum factors exponential in the charges do also. In these products one can first cut off the creation/annihilation vectors at finite levels and then pass to limits by the damped estimates, justifying normal-exponential commutations with convergent scalar contractions (in particular the inverse and field conjugations of $cal(D)$; for fields take the above two-sided radius margins).

The zero root modes have norms $O \( sqrt(cal(H) + 1) \)$ on shells: indeed, writing $e_h$ for the raising map from charge $h = upright(bold(p))_X$, adjointness and $\[ e \, f_(-) \] = 2 upright(bold(p))_X$ give $parallel e_h parallel^2 lt.eq parallel e_(h - 1) parallel^2 + 2 \| h \|$; iterate using $\| upright(bold(p))_X \| lt.eq sqrt(cal(H))$. These estimates justify Cartan conjugations and integration of powers in the traces there (strictly separate contours slightly where needed; same-sign powers introduce no poles there). In fact at each finite powers product on those contours one can first apply simultaneous Cartan conjugation (cancelling adjacent inverse pairs between the bare fields), then take each bare contour integral as the zero mode. The resulting conjugated products of ordinary zero-root powers can be summed with their factorials with arbitrarily small fixed damping loss, by the shell bound just proved. This applies also to realizing the remaining plus exponential after reflection by contour powers on nearby lines between the strict outer radii. In pushing the insertion, $W \( 1 \)$ preserves shells and acts coefficientwise on each field as above; conjugate by $cal(D)$, consuming arbitrarily small parts of the available radius/transfer gaps. This proves the central-exponential identity and the push through finitely many outer fields in that starting neighborhood.

===== 6.1.3.3 Continuation of the scalar contour evaluations. <continuation-of-the-scalar-contour-evaluations.>

The preceding estimates prove the reflected trace identity with finitely many outer points in a neighborhood of the central lines. We now use that identity to reach the outer axes needed for the gas. Both before and after the push, the contour evaluations of the central exponential series continue with those points to the desired outer radii at generic imaginary coordinates: keep point-to-central distances in real part strictly between 0 and $lambda$, avoiding point poles by generic paths/heights; no point-to-central pole intervenes. Absolute convergence of the central evaluations near this continuation, and of the subsequent full outer sums at the chosen radii (so the individual circle deformations and the above identities can be summed and integrated), follows by the real-$T$ bounds below. This use of continuation avoids asserting an operator trace at remote radii.

==== 6.1.4 The common scalar factor <the-common-scalar-factor>

The reflection has isolated the factor $exp \( n^2 A_T \)$. To remove the periodization later, we need its value at infinite period and analyticity in the small nome. We compute both now.

The quantity $A_T$ itself extends analytically in the nome $e^(- 2 T \/ 3)$ at zero. Put $l = omega lambda$. Then (6.3) is $- l sum_(m in bb(Z)) H \( m l \) \/ \( m l \)$, where the even function $H \( a \) \/ a$ vanishes at 0 and

$ H \( a \) = J \( a \) sinh a \/ cosh \( 3 a \/ 2 \) = frac(x \( 1 - x^2 \) \( 1 - x \) \( 1 - x^3 \)^2, \( 1 - x^8 \) \( 1 + x^3 \)) = frac(sum_(j = 1)^23 c_j x^j, 1 - x^24) \, quad x = e^(- a) . $

Coefficients $c_1 \, dots.h \, c_12 = 1 \, - 1 \, - 1 \, - 2 \, 3 \, 3 \, 1 \, - 4 \, - 3 \, - 1 \, 3 \, 2$, with $c_j = c_(24 - j)$ thereafter, follow by multiplication. Poisson summation (periodize the decaying integrand) now has image frequencies $k T \/ lambda$. Shifting Fourier contours past the simple poles $i pi j \/ 12$, with bounded residues away from 0, gives a convergent power series in the indicated nome: horizontal contours midway between poles have uniformly exponentially decaying rational factor in real direction. The constant term is

$ - 2 integral_0^oo H \( a \) thin frac(d a, a) = sum_j c_j log sin \( pi j \/ 24 \) = A_oo . $

Indeed use complete geometric-series packets ($sum c_j = sum j c_j = 0$, giving summable integrated packet bounds) and $integral \( e^(- u a) - e^(- v a) \) thin d a \/ a = log \( v \/ u \)$; pairing reflected indices gives the sine product. We use here the elementary product $sin \( pi h \) \/ \( pi h \) = product_(k gt.eq 1) \( 1 - h^2 \/ k^2 \)$: for imaginary $h$ it follows by logarithmic differentiation from the same periodized exponential sum giving $sum_(k in bb(Z)) 1 \/ \( k^2 + t^2 \) = pi coth \( pi t \) \/ t$, then by analytic continuation. For $w = pi \/ 24$, the half-exponent sine product above reduces by double angles to $sin^2 \( 6 w \) cos^2 w sin^2 \( 5 w \) \/ \( 2 sin^2 \( 4 w \) sin^4 \( 8 w \) cos^2 \( 3 w \) \) = 2 \( 2 + sqrt(2) \) \/ 9$.

=== 6.2 Stability of the contour expansions <c2:sec-stability>

The reflection has replaced the interaction by $M' = M^(- 1)$ and the source by $G_T$. We must bound the resulting sum uniformly in its particle order. Two different costs will do this. The long-wave part of the interaction penalizes the twist $theta$, while its remaining positive energy penalizes particles crowded into a short interval. The source confines a fixed fraction of the particles to short intervals near the period ends. Together these estimates give a summable bound.

We first prove the estimates for a real period. They also supply the absolute convergence used in the preceding current calculation. We then compare bent contours at complex periods with the real ones and pass to nome zero. The order of these steps matters: positivity is used only for the real comparison energy.

==== 6.2.1 Residue particles and source decay <residue-particles-and-source-decay>

Let $N$ denote the number of elementary letters in one term of the reflected expansion; it is independent of the source exponent $n$. Move the outer minus axes from $plus.minus b lambda$ to $plus.minus beta lambda$, where $beta = 3 \/ 2 + kappa$ and $kappa > 0$ will be small and fixed. The central plus axis stays at zero. For either label $A$ or $B$, write $alpha_t$ for a plus letter at offset $t lambda$; a minus sign reverses its charge. Residues bind letters at a common longitudinal coordinate. The possible compound particles are

#[#set math.equation(numbering: n => "(6.5)")
 $ gamma_J = alpha_0 - sum_(t in J) alpha_t quad \( J subset { - 1 \, 1 } \) \, #h(2em) - alpha_(plus.minus beta) \, #h(2em) delta = - alpha_(- 3 \/ 2) - alpha_(3 \/ 2) . $ <c2:eq-V5>]

Here each compound has a single label. The list can be read directly from the singularities crossed during the two contour moves. In fact the high-frequency expansion is

$ M' = I \( 1 + x \) + H_3 x^3 + O \( x^4 \) \, #h(2em) H_3 = mat(delim: "(", - 1, 2; 2, - 1) . $

Its coefficients at $x^k$ for $k gt.eq 1$ are the plus-plus orders at displacement $plus.minus k lambda$, by the log expansions above; order at 0 is $2 I$. The source $G_T^(- n)$ has no pole between old and new outer radii. Work first at real $T$. Move left minus fields first: the simple pole at $- lambda$ from a center of the same label can bind one such field (a second has cancellation from a double zero). Likewise right minus fields can bind at $+ lambda$; and they can bind to a free left minus field at distance $3 lambda$, same label, yielding the across-pair $delta$, initially centered at offset $- kappa$ and then translated to the indicated symmetric position.

These moves may be done one point at a time with generic spectators and generic small cut parameters. In the left moves the unbound right minuses are still at $+ b$, too near for the order at distance 3 in offset units; in the right moves any already center-bound left minus is at $- 1$, again too near. A bound left minus does not interfere with right binding at the same center (zero logarithmic order at distance 2).

During the right shifts an already formed across-pair contributes cancellation at a potential aligned binding position by an end-point zero. During translation of across-pairs a minus at an aligned end interacts with nonnegative combined order; two aligned across-pairs give order $2$ on the same label or $4$ across labels. They stay at noninteger offsets from center compounds. Two center compounds on the same label have mutual order $2 - \| J \| - \| J' \| + 2 \| J ∩ J' \| gt.eq 0$; the order across labels is zero there. Thus resulting lists have no point-to-point poles on their streams (also for intermediate bound lists in the one-variable moves); the generic residue identities with simple poles integrate directly, with no differentiated factors.

Here one uses a common representative of the period for the longitudinal points at a binding (in the periodic Poisson sum). At elementary order $N$ diagram and combinatorial costs are at most $exp \( O \( N log \( N + 2 \) \) \)$, since each unbound-point move branches to at most $O \( N + 1 \)$ terms. Infinite-order convergence is only needed on the pre- and post-deformation sides when summing these coefficient identities.

The functional identities

$ G \( v - lambda \) G \( v + lambda \) = G \( v \) \, #h(2em) G \( v - 3 lambda \/ 2 \) G \( v + 3 lambda \/ 2 \) = 1 $

also determine the source carried by each compound. Write $G_(T \, u)$ for $G_T$ evaluated at offset $u lambda$, with the same longitudinal coordinate as the compound. Then

$ upright("particle") & upright("elementary letters") & upright("scalar charge") & upright("source")\
gamma_diameter & 1 & 1 & G_(T \, 0)^(thin n)\
gamma_({ t }) \, quad t = plus.minus 1 & 2 & 0 & G_(T \, - t)^(thin n)\
gamma_({ - 1 \, 1 }) & 3 & - 1 & 1\
- alpha_(plus.minus beta) & 1 & - 1 & G_(T \, plus.minus beta)^(- n)\
delta & 2 & - 2 & 1 $

Call the first two rows #emph[good particles]. If there are $K$ compounds, their scalar charges sum to $Q_s = 0$. Each nongood particle has charge at most $- 1$, whereas a good one has charge at most $1$, so at least $K \/ 2$ are good. Since each compound contains at most three letters, $K gt.eq N \/ 3$; there are therefore at least $N \/ 6$ good particles. This is the proportion needed in the final particle-count estimate.

The scale at which the source confines these particles is

#[#set math.equation(numbering: n => "(6.6)")
 $ Re T = B = \( 2 \/ nu \) log n \, #h(2em) \| Im T \| lt.eq C_(upright("im")) $ <c2:eq-V6>]

for sufficiently large fixed $C_(upright("im")) > 3 pi \/ 2$; allowing $B$ to vary by order one also in continuation. Use streams

$ y = s + i \( h \( s \) - u lambda \) \, quad - B \/ 2 lt.eq s lt.eq B \/ 2 \, $

where $u$ is the offset and $h \( s + B \) = h \( s \) + Im T \, med h \( plus.minus B \/ 2 \) = plus.minus Im T \/ 2$. Take $h = 0$ in the period except within a sufficiently large fixed distance of its ends, with arbitrarily small fixed Lipschitz bound, and bounded on the period. The sources of other particles are bounded there by $exp \( O \( 1 \) \)$ each. Those of good particles are bounded by

$ exp \( O \( 1 \) - c thin e^(nu d_s) \) \, #h(2em) d_s = B \/ 2 - \| s \| \, quad c > 0 . $

Indeed on good offsets the central $G$ has modulus strictly less than one ($Re cos \( nu v \) > 0$ on those straight lines) and its real log on the tail is negative of order $e^(- nu \| s \|)$; on outer offsets the modulus is greater than one. Bending near the ends and noncentral images have arbitrary phases but cost bounded error including the power $n$.

==== 6.2.2 A coercive quadratic form on the real circle <a-coercive-quadratic-form-on-the-real-circle>

Start with a real period $T = B$. Here is the bound we will prove. Partition the circle into bins of lengths bounded above and below by fixed positive constants, and let $n_l$ count the compounds in bin $l$. For a fixed residue list, let $W_j$ be its integrand with the source factors and the two common factors $exp \( n^2 A_T \)$ and $product_(m > 0) det M \( m omega \)^(- 1)$ removed. It retains the Gaussian normalization, the Poisson branch $j$, and the binding and self finite parts. For every fixed $0 < epsilon.alt < 1$,

#[#set math.equation(numbering: n => "(6.7)")
 $ sum_(j in bb(Z)) \| W_j \| lt.eq C exp {- frac(\( 1 - epsilon.alt \) B \( theta' \)^2, 8 pi c_s lambda) - c sum_l n_l^2 + C N log \( B + N + 2 \)} . $ <c2:eq-real-stability>]

This holds uniformly for real $theta'$ in a fixed compact subinterval of $\( - pi \, pi \)$, for all sufficiently large $B$. The constants may depend on that interval, $epsilon.alt$, and a sufficiently small fixed $kappa > 0$. We will keep a positive fraction of the bin-count term for the later complex-contour comparison. The proof occupies the present subsubsection and the smearing argument that follows.

We retain two parts of the interaction: a symmetric total-charge pole for the electric cost, and a strictly positive remainder for the local particle counts. A cross-label term that is positive only after integration must first be separated from that remainder.

===== 6.2.2.1 The real energy and its charge coordinates. <the-real-energy-and-its-charge-coordinates.>

In the transformed real pair logs with offset difference $t = \| u - v \| lt.eq 2 beta$ (here $u \, v$ are offset indices) the nonzero Fourier modes are $- 1 \/ m$ times

$ Xi \( p \; t \) = M' \( p \) cosh \( a t \) - I sinh \( a t \) - I sinh \( a \( t - 1 \)_(+) \) - H_3 sinh \( a \( t - 3 \)_(+) \) \, #h(2em) p = m omega > 0 . $

Indeed switch each growing elementary log to its decaying expansion: the factor $cosh \( a t \) e^(- a k)$ becomes

$ frac(e^(- a \( t + k \)) + e^(- a \| t - k \|), 2) . $

At mode zero this crossing adds constant $omega lambda \( t - k \)_(+)$ times the expansion coefficient. Thus the real log for branch $j$ in (6.4) with real twist $theta'$, excluding sources and the two common large factors, consists up to harmless normalization of:

- minus the charge energy with nonzero positive frequencies $p = m omega$, kernel $Xi \( p \; t \) \/ m$ on unnormalized Fourier charge sums per offset and label;
- minus $omega \/ 2$ times the regular part at zero of $Xi \( p \; t \) \/ p$ on the row totals (subtract $P_s \/ \( c_s lambda p^2 \)$ first);
- $- \( theta' + 2 pi j + omega sum_i r_i s_i \)^2 \/ \( 4 omega lambda c_s \)$.

Indeed $2 lambda P_d$ in the regular part yields the $Q_d$ Gaussian; the $t^2$ part of the leading-pole continuation on $Q_s = 0$ gives exactly the positive log from squaring the imaginary offset sum. Self energies and simple binding-pole energies use point-split finite parts in the additive coordinate.

We specify the charge space on which this energy is coercive. Let

$ cal(U) = { 0 \, plus.minus 1 \, plus.minus 3 \/ 2 \, plus.minus beta } \, quad cal(T) = { 1 \, 3 \/ 2 \, beta } \, quad cal(O) = { 1 \, beta } . $

For a particle list, let $mu_u^X$ be its signed constituent measure at offset $u lambda$ and label $X$: a constituent of sign $r$ at longitudinal coordinate $s$ contributes $r delta_s$. The central measures are nonnegative; every noncentral measure is nonpositive. An across-pair places equal measures at offsets $3 \/ 2$ and $- 3 \/ 2$. Define the unnormalized Fourier sums and their even and odd combinations by

$ q_u \( p \) = vec(integral e^(i p s) thin d mu_u^A \( s \), integral e^(i p s) thin d mu_u^B \( s \)) \, #h(2em) q_t^(upright(e)) = q_t + q_(- t) \, quad q_t^(upright(o)) = q_t - q_(- t) . $

Thus $q_(3 \/ 2)^(upright(o)) = 0$. The independent coordinates are

$ upright(bold(z)) = \( q_0 \, q_1^(upright(e)) \, q_(3 \/ 2)^(upright(e)) \, q_beta^(upright(e)) \, q_1^(upright(o)) \, q_beta^(upright(o)) \) in \( bb(C)^2 \)^6 . $

At frequency $p > 0$, their quadratic form is

$ cal(Q)_p \( upright(bold(z)) \) & = q_0^(*) M' q_0 + 2 Re sum_(t in cal(T)) q_0^(*) Xi \( p \; t \) q_t^(upright(e))\
 & quad + sum_(t \, u in cal(T)) \( q_t^(upright(e)) \)^(*) frac(Xi \( p \; \| t - u \| \) + Xi \( p \; t + u \), 2) q_u^(upright(e))\
 & quad + sum_(t \, u in cal(O)) \( q_t^(upright(o)) \)^(*) frac(Xi \( p \; \| t - u \| \) - Xi \( p \; t + u \), 2) q_u^(upright(o)) . $

These factors of two follow from using sums and differences, without normalizing the even and odd coordinates.

===== 6.2.2.2 A cross-label interaction positive after integration. <a-cross-label-interaction-positive-after-integration.>

Complete squares in the even part using $Xi \( p \; 0 \) = M'$. We single out the cross-label entries of the remaining matrix because their inverse Fourier transforms have a sign on the measures at hand. Put $P_t = sinh \( a t \) + sinh \( a \( t - 1 \)_(+) \)$. The remaining Schur entries are

$ I thin \[ cosh \( a t \) P_u + cosh \( a u \) P_t - \( P_(\| t - u \|) + P_(t + u) \) \/ 2 \] - M P_t P_u - H_3 sinh \( a \( t + u - 3 \)_(+) \) \/ 2 . $

Subtract just their cross-label part, whose $A B$ entry is

$ E \( a \; t \, u \) = frac(\( 2 cosh a - 1 \) P_t P_u, sinh 4 a) - sinh \( a \( t + u - 3 \)_(+) \) . $

In terms of the specified coordinates, the removed form is

$ cal(E)_p \( upright(bold(z)) \) = sum_(t \, u in cal(T)) E \( a \; t \, u \) #scale(x: 120%, y: 120%)[\(] overline(\( q_t^(upright(e)) \)_A) \( q_u^(upright(e)) \)_B + overline(\( q_t^(upright(e)) \)_B) \( q_u^(upright(e)) \)_A #scale(x: 120%, y: 120%)[\)] . $

It has nonnegative #emph[integrated] energy: $E \/ p$ has nonnegative inverse Fourier transform, and the even charges on noncentral rows are nonpositive measures. This assertion concerns the Fourier sum, including the regular zero mode; it does not assert that $cal(E)_p$ is nonnegative at each frequency. To see the transform, sum over $i = t \, t - 1 \, med j = u \, u - 1$. Each term uses one half of the difference at $b = i + j \, i - j$ of

$ \[ cosh \( a \( b + 1 \) \) + cosh \( a \( b - 1 \) \) - cosh \( a b \) \] \/ \( p sinh 4 a \) \, $

folding $b + 1$ to $7 - b$ when $b > 3$ (this gives the subtracted $sinh$). By the transform for $S_j$ (with general real $0 lt.eq j lt.eq 8$), the inverse of each folded difference, up to positive factor, is

$ log frac(J_y \( d_0 \), J_y \( c_0 \)) \, quad J_y \( c \) = frac(y^2 + sqrt(2) y c + c^2 - 1 \/ 2, y + c) \, quad c_0 = cos \( pi \( i + j \) \/ 4 \) \, quad d_0 = cos \( pi \( i - j \) \/ 4 \) \, $

with $y = cosh \( 2 s \)$. This integrable kernel includes the regular zero mode (periodize for the frequency sum). It is nonnegative: $d_0 gt.eq c_0 \, med c_0 + d_0 gt.eq 0 \, med c_0 gt.eq - 0.8$ for small $kappa$, hence $\( sqrt(2) - 1 \) y^2 + y \( c_0 + d_0 \) + c_0 d_0 + 1 \/ 2 > 0$, which gives the log order (by limits at singularities). Indeed the sign of $J_y \( d_0 \) - J_y \( c_0 \)$ follows by multiplying this positive expression by $d_0 - c_0$ and dividing by $\( y + c_0 \) \( y + d_0 \)$. Thus on smooth smeared rows (used below) the full energy of the subtracted term is nonnegative by Fourier pairing: the $1 \/ m$ nonzero-frequency weight and regular zero term together give $omega \/ 2$ times the sum over all integer modes with kernel $E \/ p$, including its limit.

===== 6.2.2.3 Strict positivity of the remaining frequency form. <strict-positivity-of-the-remaining-frequency-form.>

After the preceding term is removed, the complementary form satisfies the pointwise estimate

$ tilde(cal(Q))_p \( upright(bold(z)) \) := cal(Q)_p \( upright(bold(z)) \) - cal(E)_p \( upright(bold(z)) \) gt.eq c_kappa min \( a \, 1 \) parallel upright(bold(z)) parallel^2 \, #h(2em) p > 0 . $

Here $kappa > 0$ is fixed and sufficiently small; the constant may depend on this contour separation. We give the algebraic and perturbation details. In the odd block first take $beta = 3 \/ 2$ in the two matrices on distances $1 \, beta$ (one per $plus.minus$ channel), and put $zeta = e^(a \/ 2)$. Their first diagonals factor as

$ frac(\( zeta^4 - 1 \) \( 2 zeta^8 plus.minus 2 zeta^6 + 3 zeta^4 plus.minus 2 zeta^2 + 2 \), 4 D_plus.minus) \, quad D_(+) = \( zeta^4 + zeta^2 + 1 \)^2 \( zeta^4 - zeta^2 + 1 \) \, quad D_(-) = \( zeta^4 - zeta^2 + 1 \)^3 \; $

their determinants are $\( zeta^2 - 1 \)^2 \/ \( 16 D_plus.minus \)$ times respectively $2 zeta^8 + 4 zeta^6 + 7 zeta^4 + 4 zeta^2 + 2 \, med 10 zeta^8 - 16 zeta^6 + 23 zeta^4 - 16 zeta^2 + 10$, positive on $zeta gt.eq 1$ (for the latter divide by $zeta^4$ and use $zeta^2 + zeta^(- 2) gt.eq 2$). The even Schur same-label submatrix on $1 \, 3 \/ 2$ has first diagonal $\( zeta^4 - 1 \) \( zeta^4 - zeta^2 + 1 \) \/ \( 4 \( zeta^8 + 1 \) \)$, determinant $\( zeta^2 - 1 \)^2 \( zeta^4 + 1 \) \/ \( 16 \( zeta^8 + 1 \) \)$. These identities result by substituting $sinh \( a k \) \, cosh \( a k \) = \( zeta^(2 k) minus.plus zeta^(- 2 k) \) \/ 2$, respectively, into the difference kernel and Schur entries above. Entries are $O \( min \( a \, 1 \) \)$ (the common leading pole cancels). Thus these base matrices have the required strict bounds.

#emph[Bounded frequencies and separation of the new row.] On bounded $a$-intervals down to 0 the odd bound persists for small $kappa$ by one-sided smooth perturbation (changes $O \( a kappa \)$). For the even Schur part the new distance $beta$, taken in difference from $3 \/ 2$, adds a diagonal $a kappa + O \( a kappa^2 \)$ with couplings $O \( a kappa \)$ to the old. Indeed in the same-label entries the only nonsmooth contribution to the diagonal second difference to first order comes from $- P_(\| t - u \|) \/ 2$; all $t + u$ near 3 here are on the same side. This proves strict bounds on these ranges.

#emph[Large frequencies.] Uniformly for large $a$ the folded expansion is

$ Xi \( t \) = I e^(- a t) + 1 / 2 I \( e^(- a \| t - 1 \|) + e^(- a \( t + 1 \)) \) + 1 / 2 H_3 \( e^(- a \| t - 3 \|) + e^(- a \( t + 3 \)) \) + O \( e^(- c a) \) $

at the used separations, with the vanishing terms/remainders having one-sided derivative $O \( a e^(- c a) \)$ where away from their singular offsets. Thus the odd block has negligible off-diagonals and diagonals with leading eigenvalues at least $1 \/ 4$. The even same-label Schur block has leading $1 \/ 4$ at distance 1 with negligible off-block coupling, and on $3 \/ 2 \, beta$ the leading matrix

$ 1 / 4 mat(delim: "(", 1, j; j, 2 - j^2) \, #h(2em) j = e^(- a kappa) . $

Errors are $O \( e^(- c a) \)$ and on their difference row/column have an additional factor $min \( a kappa \, 1 \)$ by the derivative bound. Using sum and difference, the leading matrix controls the sum square and $min \( a kappa \, 1 \)$ times the difference square. Thus the large-$a$ threshold can be fixed uniformly before taking small fixed $kappa > 0$.

Square completion used bounded column operations ($M Xi \( t \)$ bounded from the folded formula and zero asymptotics), and $M'$ itself has the lower bound. Together these estimates prove the stated bound.

At frequency zero the coordinates are real row totals, and the constraint is exactly

$ Q_s = upright(bold(1))^t (q_0 + sum_(t in cal(T)) q_t^(upright(e))) = 0 \, #h(2em) upright(bold(1)) = \( 1 \, 1 \)^t . $

The common pole of $cal(Q)_p$ is $parallel P_s \( q_0 + sum_t q_t^(upright(e)) \) parallel^2 \/ \( c_s lambda p \)$, which vanishes on this subspace. Consequently its modified regular zero form obeys

$ lim_(p arrow.b 0) frac(tilde(cal(Q))_p \( upright(bold(z)) \), p) gt.eq lambda c_kappa parallel upright(bold(z)) parallel^2 . $

This limit enters the energy with coefficient $omega \/ 2$; the positive-frequency forms enter with coefficient $1 \/ m$.

===== 6.2.2.4 Retaining the long-wave electric energy. <retaining-the-long-wave-electric-energy.>

For any fixed $0 < epsilon.alt < 1$ we can still keep such a positive bound after subtracting from the #emph[symmetric-channel total] the additional common kernel

$ \( 1 - epsilon.alt \) \| hat(h)_R \( p \) \|^2 \/ \( c_s a \) \, $

multiplying the squared norm of $P_s$ applied to the sum of all charge rows, where $h_R$ is a smooth nonnegative even compactly supported mass-one mollifier of sufficiently large fixed scale $R$. For small $a$ (before choosing $R$), even keeping $epsilon.alt$ fraction of the leading total pole suffices since on its null subspace the positive bound above applies unchanged, and cross couplings to it are only $O \( a \)$. For larger $a$ choose $R$ by Fourier decay.

===== 6.2.2.5 The initial contours. <the-initial-contours.>

The preceding estimates concern the residue contours. The current reflection also used absolute convergence on its initial contours. For the real-$T$ contour manipulations on those lines, a similar positive bound holds without the cross-label subtraction or the extra pole extraction. For $M'$ use lines $0 \, plus.minus b$; for $M$ use $plus.minus epsilon.alt_1 \, plus.minus b$ in offset units, with the same folding convention using its own high-frequency coefficients. The original leading pole is $P_d \/ \( 2 a \)$, with total-zero constraint $Q_d = 0$; the original Poisson Gaussian and charge weight reconstruct the regular zero form analogously. To check positivity, start on $0 \, plus.minus 1 \/ 2$. In each channel with central entry $D = M_plus.minus$ or $M_plus.minus^(- 1)$, the odd entry and remaining even Schur entry are $sinh \( a \) \( 1 - D tanh \( a \/ 2 \) \) \/ 2 \, med sinh \( a \) \( 1 - tanh \( a \/ 2 \) \/ D \) \/ 2$. Both have the strict bound by the factorizations of $M_plus.minus$: $M_(+) > tanh \( a \/ 2 \) \, med M_(-) < coth \( a \/ 2 \) \, med M_(-) gt.eq M_(+)$, where comparing numerators after cancellation gives $4 C^2 + 2 C - 1 > 0 \, med - 12 C^2 + 10 C - 1 < 0$ for the first two tests, so margins in the entries are nonvanishing multiples of $min \( a \, 1 \)$. Square-completion coefficients again are bounded. Perturb first to $b > 1 \/ 2$, with $O \( a \| b - 1 \/ 2 \| \)$ changes on compact intervals (one-sided folding). When needed split the center into $plus.minus epsilon.alt_1$: the even sector has unchanged leading pole and $O \( a epsilon.alt_1 \)$ error there, the new odd diagonal is $a epsilon.alt_1 + O \( a epsilon.alt_1^2 \)$ from the distance cusp, with couplings $O \( a epsilon.alt_1 \)$. At large $a$ the only nonnegligible off-diagonals in original row coordinates are between the two outer lines (coupling at most $1 \/ 2 + o \( 1 \)$ by the order-1 term $plus.minus I e^(- a)$ before folding) and between the split central lines (leading $I e^(- 2 a epsilon.alt_1)$ with unit leading diagonals). Differences of errors for the central rows have the factor $min \( a epsilon.alt_1 \, 1 \)$ by the same one-sided derivative estimate, giving the bound as above. Choose the position parameters sufficiently small accordingly.

==== 6.2.3 Smearing, the electric cost, and particle-count bounds <smearing-the-electric-cost-and-particle-count-bounds>

We now convert the quadratic-form estimate into a bound on the actual integrand. The comparison is one-sided: after collecting each pair of compound particles, its point interaction is bounded above by the interaction of suitably smeared charges, with a controlled loss at internal finite parts. Work first on the real circle. Replace elementary point rows by smeared measures in the $s$-variable using the circular Poisson kernel $cal(P)_rho$ of width $rho = \( B + N + 2 \)^(- 4)$ (convolution multiplier $e^(- \| m \| omega rho)$, positive density proportional to $\( 1 - 2 e^(- omega rho) cos \( omega s \) + e^(- 2 omega rho) \)^(- 1)$, mass one). We compare the original finite parts with the smeared energy. The total error is $O \( N log \( B + N + 2 \) \)$, uniformly in particle order. The estimate must be applied to whole compound particles: elementary pairs can have negative logarithmic coefficients before their residues are combined.

Here are the quantitative details of the smearing comparison. Fix the contour separation $kappa > 0$. For every used offset difference $t$, put $C_t = lim_(p arrow.r oo) Xi \( p \; t \)$. The pole at zero and the folded exponential expansion imply, with constants allowed to depend on $kappa$,

$ parallel Xi \( p \; t \) - C_t parallel lt.eq cases(delim: "{", C \/ p \, & 0 < p lt.eq 1 \,, C e^(- c p) \, & p gt.eq 1 .) $

Indeed the only terms of the folded expansion that do not decay are those whose shifted distance is zero; these are precisely $C_t$. The finite set of other distances has a positive minimum after $kappa$ is fixed. For $B gt.eq 2$, $omega = 2 pi \/ B$, the smooth remainder of each pair kernel is

$ R_(B \, t) \( s \) = - 2 sum_(m gt.eq 1) frac(Xi \( m omega \; t \) - C_t, m) cos \( m omega s \) \, #h(2em) parallel R'_(B \, t) parallel_oo lt.eq C \( 1 + log B \) . $

The last estimate follows by splitting the differentiated series at $m omega = 1$: the first part is bounded by a harmonic sum and the second by a geometric sum.

The circular Poisson kernel $cal(P)_rho$ is a probability density and satisfies $cal(P)_rho * cal(P)_rho = cal(P)_(2 rho)$. Writing $\| s \|_B$ for circular distance to zero, for $0 < rho lt.eq 1$ we have

$ integral \| s \|_B cal(P)_(2 rho) \( s \) thin d s lt.eq C rho #scale(x: 120%, y: 120%)[\(] 1 + log \( B \/ rho \) #scale(x: 120%, y: 120%)[\)] . $

Consequently replacing a smooth pair remainder by its twice-smeared version changes it by at most

$ C rho #scale(x: 120%, y: 120%)[\(] 1 + log \( B \/ rho \) #scale(x: 120%, y: 120%)[\)] \( 1 + log B \) . $

For the singular part put $L_B \( s \) = log \| 1 - e^(i omega s) \|$. Its exact Poisson average and a one-sided comparison are

$ \( cal(P)_(2 rho) * L_B \) \( s \) = log \| 1 - e^(- 2 omega rho + i omega s) \| \, #h(2em) L_B \( s \) lt.eq \( cal(P)_(2 rho) * L_B \) \( s \) + omega rho . $

For the inequality, square both sides after exponentiation and use $e^(2 omega rho) + e^(- 2 omega rho) gt.eq 2$. Apply this inequality after collecting all elementary interactions between a pair of compound particles. Their total coincident-log coefficient is nonnegative; individual elementary interactions need not have this property. All constituents of one compound have the same longitudinal coordinate, so the collection uses one and the same $L_B \( s - s' \)$.

For a diagonal or binding finite part, subtraction is in the additive coordinate: $L_B \( s \) - log \| s \| arrow.r log omega$ as $s arrow.r 0$. In contrast, the smeared singular part at zero is $log \( 1 - e^(- 2 omega rho) \) = log omega + log \( 2 rho \) + O \( omega rho \)$. Their difference is therefore $O \( 1 + \| log rho \| \)$, with the $log omega$ terms cancelling. There are $O \( N \)$ such internal terms and $O \( N^2 \)$ external pairs, with uniformly bounded constituent multiplicities and log coefficients. On taking $rho = \( B + N + 2 \)^(- 4)$, the total comparison error is

$ O #h(-0.16667em) (N \( 1 + \| log rho \| \) + N^2 omega rho + N^2 rho \( 1 + log \( B \/ rho \) \) \( 1 + log B \)) = O #scale(x: 120%, y: 120%)[\(] N log \( B + N + 2 \) #scale(x: 120%, y: 120%)[\)] . $

This compares finite parts as well as the off-diagonal kernel and preserves the nonpositive signs of all noncentral even-row measures. The same comparison applies at fixed real $T$ on the initial lines: independent same-sign letters have nonnegative coincident orders, and the other line separations are nonsingular.

===== 6.2.3.1 The electric cost. <the-electric-cost.>

For the smeared energy the nonnegative off-label Schur term can now be dropped, and the long-wave pole can be retained, as proved above. The extracted pole and $1 - epsilon.alt$ fraction of the Gaussian give log contribution at most

$ - frac(\( 1 - epsilon.alt \) B, 8 pi c_s lambda) thin upright("avg") \| theta' + 2 pi j - 2 pi \( h_R * cal(P)_rho * H_0 \) \( s \) \|^2 \, $

where $H_0$ is periodic integer cumulative sum of scalar charges $r_i$ from just before the representative period, with mean $- sum_i r_i s_i \/ B$. This is Parseval (nonzero coefficients of $H_0$ are the unnormalized Fourier charges divided by $2 pi i m$); zero-frequency regular estimates are unchanged under the null-total constraint. Outside length $O_R \( N \)$ around jumps the convolved height is within $O \( N rho \)$ of an integer. Thus for $\| theta' \| < pi$ the suppression cost in log is at least $\( 1 - epsilon.alt \) B \( theta' \)^2 \/ \( 8 pi c_s lambda \) - O \( 1 + N \)$, with a spare bound of order $B j^2$ for $\| j \|$ larger than a sufficiently large multiple of $N + 1$ (then the convolved height is itself uniformly bounded by $N$).

===== 6.2.3.2 Local particle counts and the convergence needed earlier. <local-particle-counts-and-the-convergence-needed-earlier.>

Use the bin counts $n_l$ specified in (6.7). The remaining coercive energy bounds $c sum_l n_l^2$. In fact its Fourier prefactors on unnormalized smeared row sums are at least $c \/ \[ B \( 1 + p \) \]$ and at zero at least $c \/ B$ under the constraint. Thus by Parseval they control integrated squares of further convolution with a periodized fixed nonnegative smooth bump positive on bin-size neighborhoods (its line transform decays rapidly; take compact support). Each elementary charge contributes density bounded below in magnitude throughout its bin after the two convolutions. Since charges on each used offset/label have fixed sign, this controls the asserted bin counts. Together with the finite-part loss and the electric estimate, this proves (6.7); the spare large-$j$ Gaussian bound sums the remaining Poisson branches.

For fixed real $T \, n$ the initial contours have only $O_T \( 1 \)$ bins. Their positivity estimate therefore gives, by Cauchy–Schwarz,

$ sum_l n_l^2 gt.eq c_T N^2 \, #h(2em) exp #scale(x: 120%, y: 120%)[\[] - c_T N^2 + O_(T \, n) \( N log \( N + 2 \) \) #scale(x: 120%, y: 120%)[\]] $

as a bound on either the original or the reflected expansion, including its combinatorial costs. This is summable in $N$; no source refinement is needed for this fixed-period assertion. Shifted real Gaussian sums cost bounded factors after accounting for imaginary-offset additions included in the regular zero form (complex twist gives at most $exp \( O_T \( 1 + N \) \)$ besides). For the central operator step with fixed finite generic outer points only use the bound on the central subspace; finite point couplings there cost $O_T \( N \)$ locally in the continuation, and any failure of the central totals #emph[alone] to satisfy the zero constraint is a fixed charge so the regular zero comparison has at most linear extra errors. These fixed-period estimates justify the earlier absolute-convergence claims.

==== 6.2.4 Continuation to complex periods <continuation-to-complex-periods>

The real estimates have now justified the initial contour sums and the current reflection. To obtain the bound at nome zero, we need them also for bounded imaginary parts of the period in (6.6). We compare with the real energy; no positive quadratic form is asserted on the bent contours.

===== 6.2.4.1 A kernel suitable for continuation. <a-kernel-suitable-for-continuation.>

Inverse-transform

$ hat(g) \( p \) = - 2 pi (M' \( p \) \/ p - P_s \/ \( c_s lambda p^2 \)) \, #h(2em) L_(*) = pi P_s \/ \( c_s lambda \) \, #h(2em) k \( s \) = L_(*) \| s \| + g \( s \) . $

As in the pre-reflection computation, use $k^T \( s \) = L_(*) \| s \| + sum_j g \( s + j T \)$ on real coordinates first (representative point differences in $\( - T \, T \)$); subtract $L_(*) \( s^2 \/ T + T \/ 6 \)$ for its periodic Fourier form. Inserting this kernel (with finite parts as above) now absorbs the mode and charge factors and the $D_s^2$ part of the Poisson exponent: the quadratic contribution is $- pi D_s^2 \/ \( 2 c_s lambda T \)$ by $Q_s = 0$, the regular mean gives $- omega lambda Q_d^2 \/ 2$. Thus use continuation of $k^T$, leaving the external exponent at index $j$

#[#set math.equation(numbering: n => "(6.8)")
 $ - frac(T \( theta + 2 pi j \)^2, 8 pi c_s lambda) - frac(\( theta + 2 pi j \) D_s, 2 c_s lambda) . $ <c2:eq-V7>]

(In pair logs branches can be taken by continuation sidewise; fixed phase signs have no effect.)

Here are useful regularity details. The even transform defining $g$ is regular at zero, conditionally invertible off $s = 0$, with poles on the imaginary lattice $i nu bb(Z) \\ { 0 }$, of bounded order and bounded principal coefficients by the displayed rational factorizations. For real $s > 0$ shift Fourier contours up successively halfway between poles. Horizontal integrals of the $O \( 1 \/ \| p \| \)$ tail are bounded before the shift damping, by integration by parts at fixed $s > 0$ (first derivatives integrable uniformly on those lines). Thus residues expand $g$ in decaying exponentials with polynomial prefactors of bounded degrees/coefficients. This gives continuation on $Re s > 0$ with exponential decay, also for its derivative when $Re s arrow.r + oo \, med \| Im s \| = O \( 1 + \| Re s \| \)$; similarly on the left. Near bounded separations

$ k \( s \) - I log \( s^2 \) - I log \( s^2 + lambda^2 \) - H_3 log \( s^2 + 9 lambda^2 \) $

extends analytically to $\| Im s \| < 4 lambda$. Indeed its second derivative has exponentially integrable transform there: the linear absolute term cancels the subtracted zero pole after differentiation, and each $log \( s^2 + b^2 \)$ has second-derivative transform $2 pi \| p \| e^(- b \| p \|)$. The latter follows by differentiation of the elementary Cauchy kernel transform, with the $b = 0$ limit as distributions. Now use the high-mode expansion; integrating the regular derivative proves the assertion up to harmless affine terms. This also justifies the transforms with real log singularities.

===== 6.2.4.2 Comparison with the real contours. <comparison-with-the-real-contours.>

Compare complex positions to their straight counterparts at real $B$, with real comparison twist $theta' = Re theta$. For each real signed longitudinal difference $x$, including period translates, the imaginary longitudinal change due to bending/period is at most $parallel h' parallel_oo \| x \|$. The real part of the unsummed signed linear term (continue with the given real sign) is unchanged. Each image remainder therefore costs $O \( parallel h' parallel_oo \( 1 + \| x \| \) e^(- c \| x \|) \)$: far away by the derivative decay, and nearby by the local logs and strip analyticity (choose the slope sufficiently small). Even at a shifted log singularity, changing imaginary difference by this much only changes the real log by $O \( parallel h' parallel_oo \)$ at approach; the same bound applies to binding/self finite parts. Summing by bins gives at most $C parallel h' parallel_oo sum_l n_l^2$, absorbed by the spare coercivity.

The change of real part in (6.8) is $B \( Im theta \)^2 \/ \( 8 pi c_s lambda \) + O \( N + 1 + \| j \| \)$ exactly up to that error (the imaginary part of $D_s$ stays $O \( N \)$). Normalizing Gaussian factors other than those treated explicitly stay bounded, by the same convergent Gaussian sums/Poisson formula. Sum indices $j$ with the spare large-$j$ bound.

===== 6.2.4.3 Summing all particle orders. <summing-all-particle-orders.>

Combining (6.7) with the complex-contour comparison and the source bound, extract the common factors and the electric estimate. The total logarithmic absolute cost at elementary order $N$, including diagram counts and integration measures, is bounded up to $O \( 1 \)$ by the supremum of

$ C N log \( B + N + 2 \) - c sum_l n_l^2 - c sum_(upright("good")) e^(nu d_s) . $

To see the suppression, put $L_N = 2 log \( N + 2 \) \/ nu$. If at least half of the good particles satisfy $d_s gt.eq L_N$, their source cost alone is at least $c N \( N + 2 \)^2$. Otherwise at least $N \/ 12$ particles lie in the two end regions $d_s < L_N$, which together meet $O \( log \( N + 2 \) \)$ bins. Cauchy–Schwarz then gives

$ sum_l n_l^2 gt.eq c frac(N^2, log \( N + 2 \)) . $

In either case the two negative terms dominate $c' N^2 \/ log \( N + 2 \)$. For $N lt.eq \( log B \)^3$ the positive term is $O \( \( log B \)^4 \) = o \( B \)$. Above that threshold it is absorbed by half of this suppression, uniformly for large $B$, and the remaining tail is summable. Thus the complete particle sum costs only $exp \( o \( B \) \)$.

===== 6.2.4.4 Holomorphic dependence and the continued identity. <holomorphic-dependence-and-the-continued-identity.>

These estimates also justify continuation of the identity, not only an absolute bound on formal integrands. For fixed large $n$, put $B_n = \( 2 \/ nu \) log n$ and parametrize streams by $y = s + \( T - B_n \) chi \( s \) - i u lambda$, $chi \( plus.minus B_n \/ 2 \) = plus.minus 1 \/ 2$, supported near the ends, real with small derivative and period-lifted by 1. On an open rectangle near those periods reparametrize by actual real coordinate for the uniform bounds just proved. The parametrized lists are holomorphic there. To see this, remove sufficiently many of the elementary log factors from the high-mode series as above (depending on the bounded complex period range), leaving locally exponentially summable tails.

The possible collisions require a point difference equal to an integer offset modulo the period. Equality of the real longitudinal parts modulo the period forces the bent heights also to agree modulo its lift, so there are the very same nonnegative interparticle alignment orders, and no new poles (at real longitudinal zero for sources the lift is zero). Indeed the coinciding orders between compounds use the very same longitudinal difference (all offset constituents move together), so cancel meromorphically. Internal simple-binding residues are just regular parts times the other inserted factors.

Thus the parameter integrals are holomorphic, and their full sum converges locally uniformly by the bound just proved. At real $T$ therein the identity held by the coefficientwise moves and summability on both sides, so it continues to the rectangle.

==== 6.2.5 The oscillator determinant and the nome limit <the-oscillator-determinant-and-the-nome-limit>

The oscillator determinant is

$ det M = frac(\( 1 + x^3 \)^4 \( 1 - x^3 \)^2, \( 1 + x \)^2 \( 1 - x^8 \)^2) . $

Integrating its logarithmic series gives

$ - integral_0^oo log det M thin d a & = - 4 pi^2 / 36 + 2 pi^2 / 18 + 2 pi^2 / 12 - 2 pi^2 / 48\
 & = pi^2 / 8 . $

Here we used $integral_0^oo log \( 1 - e^(- k a) \) thin d a = - pi^2 \/ \( 6 k \)$ and $integral_0^oo log \( 1 + e^(- k a) \) thin d a = pi^2 \/ \( 12 k \)$. Riemann summation, uniform also with the bounded imaginary period parts, gives log-modulus of $product_(m > 0) det M \( m omega \)^(- 1)$ equal to $B pi^2 \/ \( 8 dot.op 2 pi lambda \) + o \( B \)$. Since $B = \( 2 \/ nu \) log n$, the determinant contributes $pi \/ \( 8 lambda nu \) = 3 \/ 8$ on the logarithmic scale. The electric coefficient is $1 \/ \( 4 pi c_s lambda nu \) = 2 \/ \( 3 pi^2 \)$. Together with the particle bound, these give the log-modulus divided by $log n$, after removing $exp \( A_T n^2 \)$, at most

$ 3 / 8 - frac(2, 3 pi^2) #scale(x: 120%, y: 120%)[\(] \( 1 - epsilon.alt \) \( Re theta \)^2 - \( Im theta \)^2 #scale(x: 120%, y: 120%)[\)] + o \( 1 \) $

on (6.6), uniformly for bounded complex $theta$ near the real segment. The analytic factor $A_T$ from (6.3) agrees by continuation with its nome series there. Put $q_T = e^(- 2 T \/ 3)$. At fixed $Re T = B$, an interval of imaginary parts of length $3 pi$ traverses the entire circle $\| q_T \| = e^(- 2 B \/ 3)$; our choice $C_(upright("im")) > 3 pi \/ 2$ therefore supplies its maximum. The initial small-circle prescription is holomorphic at $e^(- 2 T) = q_T^3 = 0$, and $A_T$ is holomorphic in $q_T$. The maximum principle applied to $cal(Z)_(n \, T) exp \( - A_T n^2 \)$ gives the same upper bound at $q_T = 0$, where it equals $cal(Z)_n exp \( - A_oo n^2 \)$. For each fixed $epsilon.alt > 0$ the error tends to zero uniformly on the stated compact angle sets. Take the upper limit as $n arrow.r oo$, then let $epsilon.alt arrow.b 0$. This proves (6.1).

== 7 Determinant normalization and saturation <c2:sec-normalization>

The contour estimate bounds a normalized scalar gas. To recover the polygon partition function, we must determine the homogeneous value $P_(2 n) = p_(2 n) \( 1 \, dots.h \, 1 \)$ of the polynomial appearing in its exact finite identity. We calculate its exponential factor and its logarithmic correction independently of the contour bound. The even-size polynomial is

$ product_(i < j) frac(D_(i j), x_j - x_i) "Pf" [frac(x_j^2 - x_i^2, D_(i j))] \, #h(2em) D_(i j) = x_i^2 + x_j^2 + d x_i x_j . $

#thm([Lemma 7.1.])[
  (Homogeneous Pfaffian normalization).  #emph[For $m = 2 n$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ P_m^2 = \[ \( 2 + d \) 2 \/ 3 \]^(m \( m - 1 \)) \( 2 \/ 3 \)^m thin n^(5 \/ 24 + o \( 1 \)) . $ <c2:eq-V8>]

]
] <c2:lem-pfaffian-normalization>

#proof[
  We compare two moment determinants. One is the confluent limit of the Pfaffian squared. The other has a Cauchy determinant that can be evaluated exactly. The comparison leaves a multiplication operator compressed to a polynomial space; its logarithmic determinant supplies the power $5 \/ 24$.
  ===== 7.1 From the Pfaffian to a relative moment determinant. <from-the-pfaffian-to-a-relative-moment-determinant.>
  For an even skew-symmetric matrix $H$, adding the all-ones matrix does not change the determinant. If $H$ is invertible, the determinant lemma gives
  $ det \( H + upright(bold(1)) upright(bold(1))^t \) = det H thin \( 1 + upright(bold(1))^t H^(- 1) upright(bold(1)) \) = det H \, $
  because $H^(- 1)$ is skew-symmetric; polynomial continuation covers the singular case. Apply this to the matrix defining $p_m$. With $x_i = e^(2 i z_i)$, the row-column gauge $e^(- i u)$, $u = z_j - z_i$, has determinant one and turns $H + upright(bold(1)) upright(bold(1))^t$ into the kernel
  $ k_1 \( u \) = 1 / 2 sum_plus.minus e^(plus.minus i lambda) sec \( u plus.minus lambda \) = integral_(bb(R)) e^(u t) w_1 \( t \) thin d t \, #h(2em) w_1 \( t \) = frac(cosh \( lambda t + i lambda \), 2 cosh \( 4 lambda t \)) . $
  We used the secant transform $integral e^(u t) thin d t \/ \( 2 cosh \( pi t \/ 2 \) \) = sec u$ near zero. One direct proof shifts the contour up by $2 i$; the one crossed pole at $i$ gives the identity.
  For comparison take
  $ w_0 \( t \) = frac(1, 4 cosh \( 3 lambda t \)) \, #h(2em) k_0 \( u \) = integral_(bb(R)) e^(u t) w_0 \( t \) thin d t = 2 / 3 sec \( 4 u \/ 3 \) . $
  The Cauchy alternant gives
  $ det \[ k_0 \( z_j - z_i \) \]_(i \, j = 1)^m = \( 2 \/ 3 \)^m product_(i < j) - tan^2 \( 4 \( z_j - z_i \) \/ 3 \) . $
  Indeed write $sec \( y_j - y_i \) = 2 e^(i \( y_j + y_i \)) \/ \( e^(2 i y_j) + e^(2 i y_i) \)$. The ordinary Cauchy determinant follows by clearing the product denominator, factoring the two Vandermondes by alternation, and fixing the constant by a simple-pole residue that lowers the size.
  The large scalar factor can now be read one pair at a time. As $z_i \, z_j arrow.r 0$, with $u = z_j - z_i eq.not 0$,
  $ (frac(D_(i j), x_j - x_i))^2 #scale(x: 120%, y: 120%)[\[] - tan^2 \( 4 u \/ 3 \) #scale(x: 120%, y: 120%)[\]] arrow.r frac(4 \( 2 + d \)^2, 9) . $
  Expanding analytic rows and columns, or taking divided differences, gives
  $ lim_(z arrow.r 0) frac(det \[ k_1 \( z_j - z_i \) \], det \[ k_0 \( z_j - z_i \) \]) = frac(det \[ integral t^(r + s) w_1 \( t \) thin d t \]_(r \, s = 0)^(m - 1), det \[ integral t^(r + s) w_0 \( t \) thin d t \]_(r \, s = 0)^(m - 1)) . $
  The factorials and row signs in the two confluent limits cancel. Consequently, with $B_m = \[ \( 2 + d \) 2 \/ 3 \]^(m \( m - 1 \)) \( 2 \/ 3 \)^m$,
  #[#set math.equation(numbering: n => "(7.2)")
   $ P_m^2 = B_m thin frac(det \[ integral t^(r + s) w_1 \( t \) thin d t \]_(r \, s = 0)^(m - 1), det \[ integral t^(r + s) w_0 \( t \) thin d t \]_(r \, s = 0)^(m - 1)) . $ <c2:eq-relative-moment>]
  Translate the numerator weight to $w_1 \( t + i \/ 3 \)$. The nearest poles of its denominator before translation are at $t = plus.minus i$, so no pole is crossed. Translation replaces the monomial basis by a monic triangular basis and preserves its moment determinant. The resulting weight ratio is
  $ S \( t \) = frac(w_1 \( t + i \/ 3 \), w_0 \( t \)) = frac(2 cosh \( 3 lambda t \) cosh \( lambda t + i phi.alt \), cosh \( 4 lambda t + i phi.alt \)) \, #h(2em) phi.alt = 4 lambda \/ 3 = pi \/ 6 . $
  The phases of the two complex coshes have the same sign and absolute value at most $phi.alt$. Thus $\| arg S \( t \) \| lt.eq phi.alt < pi \/ 2$. Moreover $S \( t \) arrow.r 1$ exponentially at both ends. By continuity, $Re S \( t \) gt.eq delta > 0$ uniformly on the real line.
  ===== 7.2 The polynomial projection kernel. <the-polynomial-projection-kernel.>
  The remaining determinant is not evaluated by its individual eigenvalues. Instead we need two facts about the polynomial projection: its local average density grows like $log n$, and multiplication by a fixed continuous decaying function nearly preserves its range on that scale. Let $P$ be the orthogonal projection in $L^2 \( d t \)$ onto $sqrt(w_0)$ times the polynomials of degree less than $m$. Changing to real orthonormal polynomials in (7.2) gives the exact identity
  $ P_m^2 = B_m det \( P S P \|_("ran" P) \) . $
  Accretivity makes the compression invertible. In particular the real number $P_m^2$ is nonzero and hence positive. It remains to determine the logarithmic modulus of the relative determinant.
  We need two estimates. For every continuous exponentially decaying function $b$,
  #[#set math.equation(numbering: n => "(7.3)")
   $ frac("Tr" P b P, log n) arrow.r frac(3 lambda, pi^2) integral b \( t \) thin d t \, #h(2em) parallel \( 1 - P \) b P parallel_(upright("HS")) = o \( sqrt(log n) \) . $ <c2:eq-V9>]
  Here is the kernel verification. The polynomials are the same Meixner–Pollaczek family used in the boundary calculation [18] 18.23.7; we derive the kernel estimates needed here. In variable $v = 3 lambda t \/ pi$ use weight $"sech" pi v$. Its orthonormal polynomials are coefficients of
  $ \( 1 - i z \)^(- 1 \/ 2 + i v) \( 1 + i z \)^(- 1 \/ 2 - i v) \; $
  indeed this function equals $\( 1 + z^2 \)^(- 1 \/ 2) exp \( 2 v arctan z \)$ near zero and Laplace-pairing two by the secant transform gives $\( 1 - z z' \)^(- 1)$. Uniformly on compact $v$-sets the coefficient of order $k$, times the square root of the weight, is
  $ k^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\[] d \( v \) i^k k^(- i v) + overline(d \( v \) i^k k^(- i v)) #scale(x: 120%, y: 120%)[\]] + o \( k^(- 1 \/ 2) \) \, quad \| d \( v \) \|^2 = 1 \/ \( 2 pi \) . $
  To see this, unrotated binomial coefficients from the first factor behave as $C \( v \) k^(- 1 \/ 2 - i v)$, with first differences $O \( k^(- 3 \/ 2) \)$, by their product formula (log remainder uniformly convergent on compacts). Here $C \( v \)$ continuous and $\| C \( v \) \/ C \( 0 \) \|^2 = product_(l gt.eq 1) \( 1 + v^2 \/ \( l - 1 \/ 2 \)^2 \) = cosh pi v \, med C \( 0 \) = 1 \/ sqrt(pi)$ by Wallis (if $a_k = product_(l = 1)^k \( 1 - 1 \/ \( 2 l \) \)$, the integrals of $sin^(2 k) \, sin^(2 k + 1)$ over $\[ 0 \, pi \/ 2 \]$ equal $\( pi \/ 2 \) a_k \, 1 \/ \( \( 2 k + 1 \) a_k \)$ by parts and their ratio tends to one by sandwiching).
  Convolving the two factors gives $d \( v \) = sqrt("sech" pi v) thin 2^(- 1 \/ 2 - i v) C \( v \)$; the alternating interior sum from distances $M \, dots.h \, k \/ 2$ from either end costs $O \( k^(- 1 \/ 2) M^(- 1 \/ 2) \)$ by partial summation.
  Summing these coefficient asymptotics gives the local kernel limit
  $ frac(P \( t \, t + h \/ log n \), log n) arrow.r alpha "sinc" \( beta h \) \, #h(2em) alpha = frac(3 lambda, pi^2) \, quad beta = frac(3 lambda, pi) \, quad "sinc" u = frac(sin u, u) \, $
  uniformly for $t \, h$ in compact sets. The nonalternating terms give an integral of a cosine in $log k \/ log n$; the alternating terms are negligible. In particular $P \( t \, t \) \/ log n arrow.r alpha$ locally uniformly.
  We also need a bound valid for every $t$. Square the generating function on the circle $\| z \| = 1 - 1 \/ m$ and average. The angle difference of $1 plus.minus i z$ is at most $pi \/ 2$, so the weight absorbs its exponential factor. The remaining angular mean of $1 \/ \| 1 + z^2 \|$ is $O \( log m \)$. Parseval, and $\( 1 - 1 \/ m \)^(- 2 m) = O \( 1 \)$, therefore give
  $ 0 lt.eq P \( t \, t \) lt.eq C log n #h(2em) \( t in bb(R) \) . $
  The diagonal limit and this bound prove the trace limit in (7.3) by dominated convergence.
  For the second estimate, the projection identity and the sine integral have matching masses:
  $ integral_(bb(R)) \| P \( t \, t' \) \|^2 thin d t' = P \( t \, t \) \, #h(2em) alpha^2 integral_(bb(R)) "sinc"^2 \( beta h \) thin d h = alpha . $
  Integrate the local kernel limit first over $\| h \| lt.eq L$. Uniformly for $t$ in a fixed compact set, the normalized mass outside $\| t' - t \| lt.eq L \/ log n$ has upper limit at most $alpha - alpha^2 integral_(- L)^L "sinc"^2 \( beta h \) thin d h$. Letting $L arrow.r oo$ shows that the mass outside every fixed neighborhood of the diagonal is $o \( log n \)$, uniformly on that compact set.
  Now use the exact identity
  $ parallel \( 1 - P \) b P parallel_(upright("HS"))^2 = 1 / 2 integral.double_(bb(R)^2) \| b \( t \) - b \( t' \) \|^2 \| P \( t \, t' \) \|^2 thin d t thin d t' . $
  For compactly supported continuous $b$, uniform continuity controls the near-diagonal part, and the preceding localization controls the rest. This proves the $o \( log n \)$ bound for the square. For a general exponentially decaying $b$, approximate by a continuous compactly supported $b_c$; the global diagonal bound gives
  $ parallel \( 1 - P \) \( b - b_c \) P parallel_(upright("HS"))^2 lt.eq "Tr" P \| b - b_c \|^2 P lt.eq C log n thin parallel b - b_c parallel_(L^2)^2 . $
  Let the approximation error tend to zero. This proves both assertions of (7.3).
  ===== 7.3 The relative determinant. <the-relative-determinant.>
  We now apply the projection estimates to $S$. Uniform accretivity keeps the finite-dimensional determinant away from zero throughout the interpolation, so its logarithmic derivative can be integrated without choosing discontinuous branches. Comparing a function of a compression with compressed functional calculus is a standard step in generalized Szegő estimates; see Laptev and Safarov [15] Corollary 7, (5) for the selfadjoint case. Our multiplier is complex and accretive, so we use a direct logarithmic-derivative comparison.
  Interpolate $s_tau = 1 + tau \( S - 1 \)$, $0 lt.eq tau lt.eq 1$, and write $Q = I - P$, $T = P s_tau P \|_("ran" P)$, and $r = \( partial_tau s_tau \) \/ s_tau$. Accretivity gives $parallel T^(- 1) parallel lt.eq delta^(- 1)$ for a fixed $delta > 0$. Since the multipliers commute,
  $ T \( P r P \|_("ran" P) \) = P \( partial_tau s_tau \) P - P s_tau Q r P . $
  Thus the logarithmic derivative differs from $"Tr" P r P$ by
  $ "Tr"_("ran" P) \( T^(- 1) P s_tau Q r P \) \, #h(2em) \| "Tr"_("ran" P) \( T^(- 1) P s_tau Q r P \) \| lt.eq delta^(- 1) parallel P s_tau Q parallel_(upright("HS")) parallel r P parallel_(upright("HS")) = o \( log n \) . $
  Since $P Q = 0$, we have
  $ P s_tau Q = tau P \( S - 1 \) Q . $
  Thus (7.3) applies to the exponentially decaying multiplier $overline(S - 1)$; taking adjoints gives the first factor $o \( sqrt(log n) \)$. Its diagonal bound applied to $\| r \|^2$ gives the second factor $O \( sqrt(log n) \)$. These estimates are uniform in $tau$: the multipliers form compact families in the continuous exponentially weighted norm, and the global diagonal bound used above controls the approximation error. Integrate real parts from $tau = 0$ to $1$. The accretive half-plane supplies a continuous logarithm along the interpolation, and (7.3) yields
  $ frac(log \| det \( P S P \|_("ran" P) \) \|, log n) arrow.r frac(3 lambda, pi^2) integral_(bb(R)) log \| S \( t \) \| thin d t . $
  The integral can be evaluated without an undetermined constant. On $X = lambda t > 0$, removal of the leading exponentials gives
  $ log \| S \( t \) \| =  & log \( 1 + e^(- 6 X) \) + Re log \( 1 + e^(- 2 X - 2 i phi.alt) \)\
 & - Re log \( 1 + e^(- 8 X - 2 i phi.alt) \) . $
  For $\| phi.alt \| lt.eq pi \/ 2$, put
  $ C \( phi.alt \) = sum_(k > 0) frac(\( - 1 \)^(k + 1) cos \( 2 k phi.alt \), k^2) = pi^2 / 12 - phi.alt^2 . $
  At $phi.alt = pi \/ 6$, the half-line integral in $d X$ is
  $ pi^2 / 72 + (1 / 2 - 1 / 8) C \( pi \/ 6 \) = frac(5 pi^2, 144) . $
  Since $S \( - t \) = overline(S \( t \))$, the full integral is twice this value divided by $lambda$. Its coefficient is therefore $\( 3 lambda \/ pi^2 \) \( 2 \/ lambda \) \( 5 pi^2 \/ 144 \) = 5 \/ 24$. Together with the exact relative determinant identity, this proves (7.1). ◻
]

The last step is analytic but uses the positivity of the physical partition function. We isolate it to make clear why an upper bound at complex angles is enough.

#thm([Lemma 7.2.])[
  (Propagation of equality in a harmonic upper bound).  #emph[Let $b > 0$, let $Omega subset bb(C)$ be an open neighborhood of $\[ 0 \, b \]$, and let $F_n$ be holomorphic on $Omega$. Suppose $F_n \( t \) > 0$ and $F_n \( t \) lt.eq F_n \( 0 \)$ for $0 lt.eq t lt.eq b$. Let $h$ be harmonic on $Omega$, and suppose, locally uniformly there, 
$ frac(log \| F_n \( z \) \|, log n) lt.eq h \( z \) + o \( 1 \) \, #h(2em) frac(log F_n \( b \), log n) arrow.r h \( b \) . $

 Then $log F_n \( 0 \) \/ log n arrow.r h \( 0 \)$.]
] <c2:lem-saturation>

#proof[
  The upper limit follows from the assumed upper bound. If the lower limit failed, a subsequence and $delta > 0$ would satisfy $log F_n \( 0 \) \/ log n lt.eq h \( 0 \) - delta$. Choose $0 < a < b$ so small that $\| h \( t \) - h \( 0 \) \| < delta \/ 4$ on $\[ 0 \, a \]$. Take a compact rectangle $K subset Omega$ containing $\[ 0 \, b \]$ in its interior, and choose a uniform upper-error sequence $epsilon.alt_n arrow.b 0$ there. The subharmonic functions
  $ u_n \( z \) = frac(log \| F_n \( z \) \|, log n) - h \( z \) - epsilon.alt_n $
  are nonpositive on that rectangle and at most $- delta \/ 2$ on $\[ 0 \, a \]$, for all sufficiently large members of the subsequence. Zeros of $F_n$ are allowed: the value $- oo$ causes no difficulty in the subharmonic maximum principle.
  For completeness, the deficit propagates by two elementary rectangular barriers. Choose a small height $H > 0$ so that both rectangles below lie in $K$. On $\( a \/ 4 \, 3 a \/ 4 \) times \( 0 \, H \)$, compare $u_n$ with $- delta w \/ 2$, where
  $ w \( x \, y \) = sin #h(-0.16667em) (frac(2 pi \( x - a \/ 4 \), a)) frac(sinh \( 2 pi \( H - y \) \/ a \), sinh \( 2 pi H \/ a \)) . $
  The function $w$ is harmonic, vanishes on the other three sides, and lies between zero and one on the bottom side. The maximum principle gives the comparison throughout the rectangle. Reflect the construction below the real axis. It follows that, for some $c_1 > 0$ independent of $n$, $u_n \( a \/ 2 + i y \) lt.eq - c_1 delta$ when $\| y \| lt.eq H \/ 2$.
  Choose $r > 0$ such that $\[ a \/ 2 \, b + r \] times \[ - H \/ 2 \, H \/ 2 \] subset K$, reducing $H$ if needed. On this rectangle compare with $- c_1 delta w_2$, where
  $ w_2 \( x \, y \) = frac(sinh \( pi \( b + r - x \) \/ H \), sinh \( pi \( b + r - a \/ 2 \) \/ H \)) sin #h(-0.16667em) (frac(pi \( y + H \/ 2 \), H)) . $
  Again the boundary inequalities hold. Since $w_2 \( b \, 0 \) > 0$, this gives $u_n \( b \) lt.eq - c_1 delta w_2 \( b \, 0 \) < 0$, uniformly along the subsequence. But the assumed equality at $b$ gives $u_n \( b \) arrow.r 0$, a contradiction. ◻
]

#thm([Proposition 7.3.])[
  (Two-gap separator exponent).  #emph[On the unit-edge honeycomb cylinder of period $2 n U$, $n gt.eq 3$, choose the seam face centers $f$ and $f + n U$ from the gluing construction in Section 5.3.0.1. Let $V_(n \, n) \( theta \)$ sum collections of vertex-disjoint finite simple polygons separating these marks, with weight $x^(\| gamma \|) \( 2 cos theta \)$ per polygon. Polygons are unrooted and unoriented, $\| gamma \|$ counts their vertices, and the empty collection has weight one. At angle zero, equivalently at polygon fugacity two, 
$ V_(n \, n) \( 0 \) = n^(1 \/ 6 + o \( 1 \)) . $

]
] <c2:prop-cylinder-exponent>

#proof[
  The normalization in Lemma 9 and the exact gluing identity cancel all exponential bases:
  $ frac(P_(2 n)^2, \( 2 + d \)^(2 n \( n - 1 \)) 4^(n^2)) = e^(A_oo n^2) thin n^(5 \/ 24 + o \( 1 \)) . $
  Indeed (7.1) gives $P_(2 n)^2 = \( 2 + d \)^(4 n^2 - 2 n) \( 2 \/ 3 \)^(4 n^2) n^(5 \/ 24 + o \( 1 \))$, so the remaining base is exactly $\[ 4 \( 2 + d \)^2 \/ 81 \]^(n^2)$. Theorem 8 therefore gives, uniformly in a fixed complex neighborhood of $\[ 0 \, pi \/ 2 \]$,
  $ frac(log \| V_(n \, n) \( theta \) \|, log n) lt.eq h \( theta \) + o \( 1 \) \, #h(2em) h \( theta \) = 1 / 6 - frac(2 Re \( theta^2 \), 3 pi^2) . $
  Here the scalar exponent is $3 \/ 8 - 5 \/ 24 = 1 \/ 6$, and $h$ is harmonic. The finite spin pairing shows that $V_(n \, n)$ is entire in $theta$. Its polygon interpretation shows that it is positive and bounded above by $V_(n \, n) \( 0 \)$ on $\[ 0 \, pi \/ 2 \]$. Finally, $V_(n \, n) \( pi \/ 2 \) = 1$ and $h \( pi \/ 2 \) = 0$. Apply Lemma 10 with $b = pi \/ 2$. ◻
]

== 8 A two-bridge estimate and polygon shape mass <c2:two-bridge>

To localize the cylinder partition function in the plane, we need a positive bound on large polygon shapes. We obtain it by cutting a polygon at its extreme rows and estimating the resulting pair of disjoint bridges. The boundary inputs are $h \( d \) asymp d^(- 5 \/ 4)$ and $B \( R \) asymp R^(- 1 \/ 4)$; write $p = 1 \/ 4$. The independent cylinder calculation will enter only when we pass from shapes to nesting.

We work in the same horizontal strip as in the boundary part, of admissible physical height $R = \( 3 \/ 2 \) H$, $H$ a positive integer (bottom line at vertical coordinate $- 1 \/ 2$). Index each line of ports by increasing integers. Thus bottom index $j$ has horizontal coordinate $j \| U \|$, top index $j$ has coordinate $\( j + H \/ 2 \) \| U \|$. The letter $x$ for weights is again the critical vertex weight. Orient bridges from bottom to top; their turning phase $e^(upright(i) s W)$ is 1, by enclosing any particular path in a large bounded cut strip and using the turn rule of (2.1). Disjoint bridges with given sets of endpoints must match in increasing order, by planarity. Use

$ sigma = sum_(d gt.eq 1) h \( d \) = frac(1, 2 cos r) \, #h(2em) Q \( n \) = sum_(d gt.eq 1) min \( d \, n \) h \( d \) asymp n^(1 - p) \, #h(2em) B = B \( R \) asymp R^(- p) . $

These are the half-plane and strip bounds already proved (in particular $h \( d \) asymp d^(- 1 - p)$, giving the estimate on $Q$ by summation). $B$ is the total strip bridge mass from one fixed bottom port. For tuple weights specified only by successive gaps on each wall we always #strong[sum over relative horizontal offset], i.e. fix the first bottom site and sum the first top index over all integers. Translating both lists by $U$ reindexes, so one could equivalently fix a top base. Let $f_(l \, k)$ be the total mass $x^(\# upright("vertices"))$ of disjoint pairs with bottom gap $l gt.eq 1$ and top gap $k gt.eq 1$ in this convention. Independent-bridge bounds apply, e.g. $sum_(k gt.eq 1) f_(l \, k) lt.eq B^2$.

#thm([Proposition 8.1.])[
  (Adjacent bridges and polygon shapes).  #emph[For an admissible strip of height $R$, let $F \( R \) = f_(1 \, 1)$ be the critical mass of pairs of vertex-disjoint bridges with adjacent endpoints on each wall, fixing the first bottom port and summing the first top port. For a full-plane simple polygon $gamma$, let $\[ gamma \]$ denote its unrooted, unoriented translation class under the lattice generated by $U \, V$. There is an absolute constant $C$ such that 
$ F \( R \) lt.eq C R^(- 3) \, #h(2em) sum_(\[ gamma \]\
L lt.eq "diam" gamma < 2 L) x^(\| gamma \|) lt.eq C L^(- 2) #h(2em) \( L gt.eq 1 \) . $

]
] <prop:adjacent-bridges-shapes>

#proof[
  We first gain adjacency at one wall, then at the other, by moving a vacant source among existing ordered bridges. The last step cuts a polygon at its two extreme rows and recovers it from the resulting bridge pair.
  === 8.1 Vacancies among ordered bridges <vacancies-among-ordered-bridges>
  An extra bottom source can either form a new bridge or an arch; the arch mass lost to the existing bridges measures the obstruction. Moving the extra source among the bottom roots cancels its first collisions with those bridges.
  Here is the precise identity. Initially fix the offset and all sites: take an increasing list of bottom sites and an increasing list of top sites with one fewer element. For each choice of one vacant bottom site consider disjoint existing bridges from the other sites to the top list in order, and label these cases by consecutive integers $j$ from left vacancy to right vacancy (any starting integer). For each existing tuple take the bare critical arch masses in the full upper half-plane from the vacancy to the bottom line, separately to its left and its right. Let $L_j \, R_j$ be the masses #strong[lost] in these two directions upon demanding that the arch stay in the strip and be disjoint from the existing paths (including distinct endpoints), weighted and summed over the existing tuples. Let $T_j$ be the weight of the existing tuples with an additional disjoint bridge from the vacancy to any free top port. Then
  #[#set math.equation(numbering: n => "(8.1)")
   $ sum_j e^(\( 2 j - 2 \) upright(i) r) #scale(x: 120%, y: 120%)[\(] e^(upright(i) r) L_j + e^(- upright(i) r) R_j - T_j #scale(x: 120%, y: 120%)[\)] = 0 . $ <c2:eq-B1>]
  To prove it, cut the strip first by distant sides of the convex-polygon exhaustion in (2.1), restricting also the existing tuples to that polygon and giving each path its complex turn weights. Explore non-backtracking from the vacancy as in (2.1), stopping at an exit, a self-repeat or on hitting any occupied vertex (in the last two cases before another turn). Its total weight is one. Self-repeat terms cancel by reversing the newly closed loop as before. A hit of an existing bridge comes along its unused edge at the branch vertex. This can be only a bridge with a bottom source neighboring the vacancy in the list: an intervening disjoint bottom-to-top bridge separates them. Switch the two initial legs, i.e. pass to the neighboring vacancy case by retaining the target leg of the hit bridge for the new through path and using its old initial leg now as the stopped exploration. All paths satisfy the same simplicity/disjointness requirements up to this first hit, and this operation is a bijection of collision terms.
  The cyclic order of the three rays towards left source, right source and top target is counterclockwise (the order at the boundary for three disjoint legs). Thus the through turn for the left vacancy case is $- pi \/ 3$, and for the right vacancy case $+ pi \/ 3$; all other directed turns on the legs agree, with unchanged magnitude of weight. The ratio from left to right including the coefficients in (8.1) is $e^(upright(i) \( 2 r + 2 r \/ 3 \)) = - 1$, giving cancellation.
  On exhaustion, exits on the receding sides cost vanishing mass even ignoring avoidance, by half-plane saturation for that vacancy start, with existing weights bounded by products of $B$’s. Existing bridges have phase 1 and allowed arch exits on the bottom have phases $e^(upright(i) r) \, e^(- upright(i) r)$ to left, right. These disjoint exit terms pass to the strip limit with finite positive masses (times the indicated phases). After the collision cancellation their weighted sum over vacancy cases equals the similarly weighted sum of the bare existing-tuple masses by the exploration total. Subtract the exit terms from the independent half-plane arch comparison (mass $sigma$ in each direction per tuple, so total with its phases one) to get (8.1). We may also sum the identity over offsets and the top gap choices used below: the absolute masses $L_j \, R_j \, T_j$ are bounded by independent $sigma \, sigma \, B$ times existing bridge masses, and summed existing lists by independent bridges from fixed bottom starts.
  Multiplying (8.1) by $e^(upright(i) r)$, taking imaginary parts and dividing by $sin \( 2 r \) > 0$, the coefficient triples on $L_j \, R_j \, T_j$ for the cases needed are
  $ j & L_j & R_j & T_j\
- 1 & - 1 & sqrt(2) & - b_(*)\
0 & 0 & - 1 & a_(*)\
1 & 1 & 0 & - a_(*)\
2 & - sqrt(2) & 1 & b_(*) #h(2em) a_(*) = frac(sin r, sin \( 2 r \)) = sigma \, #h(2em) b_(*) = frac(- sin \( 3 r \), sin \( 2 r \)) \, #h(2em) a_(*) > b_(*) > 0 . $
  === 8.2 A positive estimate for summed arch losses <a-positive-estimate-for-summed-arch-losses>
  The individual differences of left and right losses below can have either sign. We use them only after summing the vacancy over an interval, when symmetry of the lost-arch kernel supplies a positive lower bound.
  We will place vacancies outside a fixed weighted ensemble $cal(E)$ of one or more existing ordered strip bridges (fixed bottom list, possibly summed top choices), writing $\| cal(E) \|$ for its mass. For insertion $i gt.eq 1$ sites to the right of the rightmost bottom root let $D_(cal(E))^(upright("right")) \( i \) = sqrt(2) L - R'$, where $L \, R'$ are the same left and right losses integrated over $cal(E)$. For insertion $i$ sites to the left of the leftmost root set $D_(cal(E))^(upright("left")) \( i \) = sqrt(2) R' - L$. For either convention use the outward integer coordinate from the extreme root (0 there, positive outwards), and write $cal(K) \( i \, j \)$ for the integrated lost arch weight between two distinct sites in this coordinate, so it is symmetric and $cal(K) \( i \, j \) lt.eq h \( \| i - j \| \) \| cal(E) \|$. For $i > 0 \, med j lt.eq 0$ this last bound is an equality: any such arch staying in the strip is blocked by a bottom-to-top bridge at the extreme root. With $I_(cal(E)) \( n \) = sum_(1 lt.eq i < j lt.eq n) cal(K) \( i \, j \)$ in the chosen convention and $c_0 = sqrt(2) - 1$, it follows that
  #[#set math.equation(numbering: n => "(8.2)")
   $ c_0 #scale(x: 120%, y: 120%)[\(] Q \( n \) \| cal(E) \| + I_(cal(E)) \( n \) #scale(x: 120%, y: 120%)[\)] med lt.eq med sum_(i = 1)^n D_(cal(E)) \( i \) lt.eq med sqrt(2) Q \( n \) \| cal(E) \| + c_0 I_(cal(E)) \( n \) . $ <c2:eq-B2>]
  Indeed the within-interval terms have net coefficient $c_0$. Across the edge towards the bridges the loss contributes $sqrt(2) Q \( n \) \| cal(E) \|$, while across the far edge the negative term costs at most $Q \( n \) \| cal(E) \|$.
  === 8.3 Adjacency at one wall <adjacency-at-one-wall>
  Take now three bottom sites $w \, w + 1 \, w + 1 + l$, vacancies indexed $0 \, 1 \, 2$, and two top sites $s' \, s' + k$ ($l \, k gt.eq 1$), integrating $s'$ over indices (including in the $T_j$’s below). Let $cal(F)_k$ be the existing ensemble for vacancy 2 (mass $f_(1 \, k)$, independent of $l$). Losses $R_0 \, L_1$ are full in their directions because the consecutive bottom pair allows no endpoint in between and a bridge blocks crossing. Thus (8.1) with the coefficient table gives
  #[#set math.equation(numbering: n => "(8.3)")
   $ sigma \( f_(l + 1 \, k) - f_(l \, k) \) = D_(cal(F)_k)^(upright("right")) \( l \) - a_(*) T_0 + a_(*) T_1 - b_(*) T_2 . $ <c2:eq-B3>]
  When summed over all $k gt.eq 1$, the $T_0 \, T_1$ masses are equal (each counts the triples with those bottom roots and all increasing top choices; the extra top port is first, respectively second). Also $T_2 lt.eq B f_(1 \, k)$. Sum (8.3) over $k$ and $1 lt.eq l lt.eq m = floor.l delta R floor.r$ with small constant $delta > 0$, for large $R$. By (8.2) the right side is at least $\( c_0 Q \( m \) - b_(*) m B \) sum_k f_(1 \, k)$. The telescoped left side is at most $sigma B^2$. We can make $m B \/ Q \( m \)$ small since it is $O \( delta^p \)$; hence
  #[#set math.equation(numbering: n => "(8.4)")
   $ sum_k f_(1 \, k) lt.tilde B^2 \/ Q \( m \) \, #h(2em) sum_k f_(k \, 1) lt.tilde B^2 \/ Q \( m \) . $ <c2:eq-B4>]
  For the second inequality exchange top and bottom. Explicitly the lattice strip symmetry on horizontal and vertical coordinates is $\( u \, v \) mapsto \( u + H \| U \| \/ 2 \, \( 3 \/ 2 \) H - 1 - v \)$, sending $upright(bold(a))_(j k)$ to $upright(bold(b))_(j + k \, H - 1 - k)$ and $upright(bold(b))_(j k)$ to $upright(bold(a))_(j + k + 1 \, H - 1 - k)$; offsets reindex.
  === 8.4 Adjacency at both walls <adjacency-at-both-walls>
  The estimates in (8.4) impose adjacency at one wall while summing the gap at the other. Our target is the sharper individual term $F = f_(1 \, 1) = O \( R^(- 3) \)$. To gain that second adjacency constraint, we now compare three-bridge ensembles by moving a vacancy among four bottom sites. The resulting two-variable telescoping identity will feed back into the first vacancy relation.
  Write $f_l = f_(l \, 1)$, $F = f_1$, $cal(F) = cal(F)_1$, $D \( l \) = D_(cal(F))^(upright("right")) \( l \)$. Use triple masses $g_l \, A_l$ for bottom gaps $1 \, l$; $g_l$ uses top gaps $t \, 1$ summing $t gt.eq 1$, and $A_l$ uses $1 \, t$ summing $t gt.eq 1$. Denote the latter ensemble on bottom roots $w \, w + 1 \, w + 1 + l$ by $cal(A)_l$. For $k = 1$ in (8.3) there is no intermediate top site, so
  #[#set math.equation(numbering: n => "(8.5)")
   $ sigma \( f_(l + 1) - f_l \) = D \( l \) - a_(*) g_l - b_(*) A_l \, #h(2em) A_l lt.eq B F . $ <c2:eq-B5>]
  Use four bottom sites $w - k \, w \, w + 1 \, w + 1 + l$, $k \, l gt.eq 1$, vacancy indices $- 1 \, 0 \, 1 \, 2$, and three top sites with gaps $1 \, t$ summing offset and $t gt.eq 1$. Write $K_(k \, l)$ for the triple mass with bottom gaps $k \, l$ and those summed top choices. The existing ensemble in case 2 has bottom roots $w - k \, w \, w + 1$; call it $cal(E)_k$. Its mass equals $g_k$ by left-right reflection (reversing both lists). We have also the left-right lattice symmetry on a strip, $\( u \, v \) mapsto \( - u \, v \)$, with shifts of base indices absorbed by the offset sum. Case $- 1$ has existing ensemble $cal(A)_l$. Again the consecutive bottom pair gives full losses in cases 0 to right and 1 to left. Thus
  #[#set math.equation(numbering: n => "(8.6)")
   $ sigma \( K_(k \, l + 1) - K_(k + 1 \, l) \) & = D_(cal(E)_k)^(upright("right")) \( l \) - D_(cal(A)_l)^(upright("left")) \( k \) + b_(*) T_(- 1) - a_(*) T_0 + a_(*) T_1 - b_(*) T_2\
 & gt.eq D_(cal(E)_k)^(upright("right")) \( l \) - D_(cal(A)_l)^(upright("left")) \( k \) . $ <c2:eq-B6>]
  Indeed $T_0 = 0$ (no extra port in the consecutive top gap); $T_1 = T_2$ after the $t$ integration (both count all ordered quadruples with the first top gap 1), and $a_(*) gt.eq b_(*)$.
  For two vacancy endpoints both to the left of $w$, the kernel $cal(K)$ for $cal(A)_l$ is bounded by $B$ times that for $cal(F)$ on the left. In fact an arch there which stays in the strip disjoint from the first two bridges remains on their left and cannot touch the third (crosscut separation); for any fixed first two forming a tuple in $cal(F)$, possible third bridges cost at most $B$. Use the leftward coordinate for both ensembles. The positive kernel comparison gives
  $ I_(cal(A)_l) \( n \) lt.eq B I_(cal(F))^(upright("left")) \( n \) \, #h(2em) \| cal(A)_l \| = A_l lt.eq B F . $
  The upper and lower bounds in (8.2) now imply
  $ sum_(k = 1)^n D_(cal(A)_l)^(upright("left")) \( k \) & lt.eq B #scale(x: 120%, y: 120%)[\(] sqrt(2) Q \( n \) F + c_0 I_(cal(F))^(upright("left")) \( n \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq sqrt(2) / c_0 B sum_(k = 1)^n D_(cal(F))^(upright("left")) \( k \) = sqrt(2) / c_0 B sum_(k = 1)^n D \( k \) . $
  The last equality uses left-right reflection of the adjacent-pair ensemble. This argument compares interval sums of the signed losses; it makes no pointwise comparison of the individual $D$’s.
  Sum (8.6) over $1 lt.eq k \, l lt.eq n$. The positive boundary sums remaining on telescoping the $K$’s are bounded by $sum_(k = 1)^n K_(k \, n + 1) + sum_(l = 1)^n K_(1 \, l) lt.eq B \( sum_k f_k + n F \)$ by dropping the last bridge. By (8.2) and the preceding comparison we get
  #[#set math.equation(numbering: n => "(8.7)")
   $ c_0 Q \( n \) sum_(k = 1)^n g_k lt.eq sigma B #scale(x: 120%, y: 120%)[\(] sum_k f_k + n F #scale(x: 120%, y: 120%)[\)] + C B n thin D_Sigma \( n \) \, #h(2em) D_Sigma \( n \) := sum_(l = 1)^n D \( l \) gt.eq c_0 Q \( n \) F . $ <c2:eq-B7>]
  It remains to close the two estimates: (8.5) bounds the summed losses by triple masses, and (8.7) bounds those triple masses by the summed losses with a small coefficient. Set $S_f = sum_(k gt.eq 1) f_k$. Summing (8.5) and then applying (8.7) gives, for $m \/ 2 lt.eq n lt.eq m$,
  $ D_Sigma \( n \) & lt.eq sigma f_(n + 1) + a_(*) sum_(l = 1)^n g_l + b_(*) n B F\
 & lt.eq sigma f_(n + 1) + C frac(B S_f, Q \( n \)) + C frac(B n F, Q \( n \)) + C frac(B n, Q \( n \)) D_Sigma \( n \) + b_(*) n B F . $
  Since $Q \( n \) gt.eq c > 0$ and $F lt.eq D_Sigma \( n \) \/ \( c_0 Q \( n \) \)$, all the terms in the second line containing $F$ or $D_Sigma \( n \)$ are at most $C' B n D_Sigma \( n \) \/ Q \( n \)$. The coefficient is $O \( delta^p \)$, uniformly for these $n$. Choose $delta$ once so that it is less than one half. Absorbing it and using $Q \( n \) asymp Q \( m \)$ yields
  $ Q \( m \) F lt.tilde f_(n + 1) + B sum_k f_k \/ Q \( m \) #h(2em) \( m \/ 2 lt.eq n lt.eq m \) . $
  Average in $n$, then use (8.4):
  #[#set math.equation(numbering: n => "(8.8)")
   $ F med lt.tilde med Q \( m \)^(- 1) #scale(x: 120%, y: 120%)[\(] m^(- 1) + B \/ Q \( m \) #scale(x: 120%, y: 120%)[\)] thin B^2 \/ Q \( m \) med = med O \( R^(- 3) \) . $ <c2:eq-B8>]
  === 8.5 Cutting polygon shapes into adjacent bridges <cutting-polygon-shapes-into-adjacent-bridges>
  It follows that the total critical mass of translation classes of full-plane simple polygons of Euclidean diameter in $\[ L \, 2 L \)$ is $O \( L^(- 2) \)$ as $L arrow.r oo$. Here a polygon is an unoriented unrooted simple lattice cycle $gamma$ of weight $x^(\| gamma \|)$ (vertex count $\| gamma \|$), and translations are by the lattice generated by $U \, V$. The estimate is on translation classes, so we retain an injective encoding by choosing the leftmost vertex at each extreme height. One of the three lattice axes gives a height projection span comparable to $L$; sum over these choices and use a $120^compose$-multiple lattice rotation to make it the usual vertical height. Minimum vertices of the polygon in this direction are all of type $upright(bold(a))$ (a $upright(bold(b))$ has only one upward edge), and maximum vertices all of type $upright(bold(b))$, both using their two slanted edges. At the leftmost minimum $upright(bold(a))_(j k)$ delete its polygon edge to the upper-left neighbor $upright(bold(b))_(j - 1 \, k)$; attach a downward exterior half-edge from $upright(bold(a))_(j k)$ to a port, and at the unused minimum-row vertex $upright(bold(a))_(j - 1 \, k)$ attach its downward half-edge to the adjacent port and the edge to $upright(bold(b))_(j - 1 \, k)$. Similarly at the leftmost maximum $upright(bold(b))_(d h)$ delete the edge to the lower-left neighbor $upright(bold(a))_(d \, h)$; attach an upward exterior half-edge from $upright(bold(b))_(d h)$ to a port, and at the unused maximum-row vertex $upright(bold(b))_(d - 1 \, h)$ attach its upward half-edge to the adjacent port and the edge to $upright(bold(a))_(d \, h)$.
  For these large spans the changes are apart. Cutting the two edges on a simple cycle gives two paths each running from one cut to the other; the attachments now make two vertex-disjoint bottom-to-top bridges of a strip, in order by planarity, with adjacent endpoints at each wall. Its height is the vertex span plus one, hence admissible and comparable to $L$. Translate to fix the bottom neighboring pair (left added vertex at $upright(bold(a))_00$). The resulting pair is counted by $F$ at that height, with joint weight $x^(\| gamma \| + 2)$; the encoding on translation classes for that direction is injective (trim the added left vertex on each wall and restore the specified edges). There are $O \( L \)$ height choices, proving the claim by (8.8). ◻
]

In particular on a full cylinder of horizontal period $N U$, contractible simple polygons enclosing a specified point, with planar lift diameter in a dyad $\[ L \, 2 L \)$ where $L gt.tilde N$, cost $O \( N \/ L \)$ total positive mass. Lift a polygon to its planar closed copy; for any translation class there are at most $O \( N L \)$ placements modulo the cylinder period which can enclose the point (vertical translation has $O \( L \)$ choices to put its height in the span, horizontal index at most $N$ modulo period). This bound sums to $O \( 1 \)$ on dyads above any fixed constant times $N$.

== 9 Winding polygons on the cylinder <c2:winding>

We also need a uniform single-loop cost bound for the noncontractible polygons that separate two antipodal gaps. Work on the full cylinder of period $2 n U$, $n gt.eq 3$, and first restrict polygons to a strip of finitely many whole consecutive layers as above on this cylinder. A winding polygon is a simple polygon noncontractible on the cylinder (unoriented and unrooted). For winding polygons write $eta < gamma$ if they are disjoint and $eta$ is below $gamma$, i.e. on its side towards the lower end. Any two disjoint ones are ordered. These separation conventions follow for example by mapping the cylinder in horizontal and vertical coordinates $u \, v$ to the punctured plane by $exp \( 2 pi upright(i) \( u + upright(i) v \) \/ \( 2 n \| U \| \) \)$. A winding simple curve surrounds 0 in that plane, with upper end on the bounded side; it winds once up to sign by Jordan curve separation (index of a simple closed curve). The positive traversal (lift displacement $+ 2 n U$) has lower side on its right.

Set $t_0 = 2 cos \( 2 pi s \/ 3 \) = sqrt(2)$.

#thm([Proposition 9.1.])[
  (Uniform mass of winding separators).  #emph[On the honeycomb cylinder of period $2 n U$, $n gt.eq 3$, let $f$ be a point off the lattice edges and put $f' = f + n U$. Then 
#[#set math.equation(numbering: n => "(9.1)")
 $ sum_(eta med upright(w i n d i n g med o n med f u l l med c y l i n d e r)\
eta med upright("separates") med f \, f') x^(\| eta \|) lt.eq 2 \/ t_0 . $ <c2:eq-C3>]

 The polygons in this sum are simple, unrooted and unoriented.]
] <prop:winding-separators>

#proof[
  We first work in a strip of finitely many complete layers. Exploration excludes eigenvalue one for a matrix that records which winding polygons can lie below one another. Adding layers continuously then places its spectral radius below one. Finally, the two opposite assignments of $f \, f'$ to the sides of a separator give two intersecting classes; their equal masses are bounded by that spectral radius.
  === 9.1 A finite matrix and a deformation of the top row <a-finite-matrix-and-a-deformation-of-the-top-row>
  On the finite list of winding polygons in the strip consider the nonnegative matrix
  $ A_(gamma eta) = t_0 w_eta thin upright(bold(1))_({ eta lt.not gamma }) \, #h(2em) w_eta = x^(\| eta \|) . $
  Deform at the top layer by $0 lt.eq theta lt.eq 1$, replacing $w_eta$ by
  $ w_eta \( theta \) = x^(\| eta \|) theta^(thin \# { upright("topmost ") upright(bold(b)) upright("-row vertices on ") eta }) $
  (with zero exponent giving 1 for that factor), and call the corresponding matrix $A \( theta \)$.
  Fix a bottom starting port. Explore non-backtracking with the complex transition weights of (2.1), stopping on first repeat of a cylinder vertex before turning there, or at an exit. Modify only the turns upon arrival at a topmost $upright(bold(b))$-vertex (necessarily arriving from an internal edge below). Of the two choices, the transit to the other internal edge, of turn $tau_i = plus.minus pi \/ 3$, gets weight $theta x e^(upright(i) s tau_i)$; the upward exit, of opposite turn $tau_e$, gets weight $1 - theta x e^(upright(i) s tau_i)$. Total outgoing weight stays one (the standard rule is recovered at $theta = 1$). Besides this full-strip experiment with flat top $*$, run one for each winding ceiling $gamma$ by stopping also upon first hit of a vertex of that polygon, before turning there; then there can be no flat top exit before such a hit. Denote by $S \( gamma \)$ the real part of the ceiling hit terms, by $S \( * \)$ the real part of flat top exit terms in the full experiment, and by $D \( gamma \) \, D \( * \)$ one minus the real part of the respective bottom exit sums, all with these same rules at fixed $theta$. The finite explorations give
  #[#set math.equation(numbering: n => "(9.2)")
   $ S \( gamma \) = D \( gamma \) - t_0 sum_(eta < gamma) w_eta \( theta \) S \( eta \) \, #h(2em) S \( * \) = D \( * \) - t_0 sum_eta w_eta \( theta \) S \( eta \) . $ <c2:eq-C1>]
  ===== 9.1.1 Repeated vertices and loop turns. <repeated-vertices-and-loop-turns.>
  To verify the repeat contributions here, a first repeat has a simple stem reaching the attachment of a simple cylinder polygon along the third edge there. For a contractible loop the stem reaches from exterior (the bottom port is outside, toward the lower end); as in the plane its two loop orientations add turns $plus.minus 4 pi \/ 3$ relative to the incoming stem, and cancel. For a winding loop $eta$ the stem reaches instead from its lower side. The closed positive traversal has net turn zero in the local lifted directions, with a turn $+ pi \/ 3$ at this attachment: the right-side local sector contains the unused third ray (from the lower side), so is the larger $4 pi \/ 3$ sector, corresponding to that positive turn. For the net turn assertion cut a lift at a minimum-height vertex of the polygon (type $upright(bold(a))$ with both upward slants used, exiting upper-right in the positive traversal). Extend both ends straight down to a lower line. This makes a simple planar chord with positive horizontal displacement, going up from and down to the line, of total turn $- pi$ by closing clockwise on the line (two closing joins of $- pi \/ 2$); the two $- pi \/ 3$ turns added at the endpoint copies replace the single cyclic $+ pi \/ 3$ turn. Thus the loop has turn zero as claimed. At the stem attachment the turn on actual positive departure from the incoming stem is $- pi \/ 3$ instead of $+ pi \/ 3$; the two orientations therefore add relative turns $- 2 pi \/ 3 \, + 2 pi \/ 3$.
  All extra $theta$ factors from internal transits respect these calculations under reversal: a topmost $upright(bold(b))$-vertex cannot be the attachment (the stem arrives from inside there and three distinct internal edges would be required), and any passage on a loop there uses the two internal edges. Repeat histories with winding loop $eta$ are exactly first-hit stems to $eta$ followed by either traversal (the stem avoids it before that vertex and hence arrives along the unused edge). Under ceiling $gamma$ such loops necessarily satisfy $eta < gamma$; conversely for any such $eta$ the stems to it from the bottom cannot previously hit $gamma$ by separation. The weight factor for the two added traversals together is $t_0 w_eta \( theta \)$. This proves (9.2) by taking real parts of the total-weight identities.
  ===== 9.1.2 Positive flat exits and exclusion of eigenvalue one. <positive-flat-exits-and-exclusion-of-eigenvalue-one.>
  Bottom arch exits have turns $plus.minus pi$ on lifting to plane chords, so still have nonnegative real weights (the modification only scales their prior internal transits by $theta$). Under $gamma$ these arches are a subset of the flat experiment’s arches, so $D \( gamma \) gt.eq D \( * \)$. Through bridges to the flat top would have total turn zero by lifting. Thus in a top exit term its prefix phase before the final turn is $e^(- upright(i) s tau_e)$, with the extra nonnegative scaling for earlier top-row transits, and including the exit weight the resulting real factor is $cos \( pi s \/ 3 \) - theta x cos \( 2 pi s \/ 3 \) gt.eq x > 0$. A strictly ascending simple bridge with no earlier such transit exists even at $theta = 0$. Hence $S \( * \) > 0$. From (9.2) the real vector $S = \( S \( gamma \) \)_gamma$ satisfies
  #[#set math.equation(numbering: n => "(9.3)")
   $ \( I - A \( theta \) \) S = #scale(x: 120%, y: 120%)[\(] S \( * \) + D \( gamma \) - D \( * \) #scale(x: 120%, y: 120%)[\)]_gamma > 0 . $ <c2:eq-C2>]
  The vector $S$ need not have positive coordinates. Nevertheless $rho \( A \( theta \) \) eq.not 1$: otherwise there is a nonnegative nonzero left eigenvector for eigenvalue 1, contradicting (9.3). To see that eigenvector fact directly for a finite nonnegative matrix (write it as $A$) of spectral radius 1, apply the resolvent of its transpose to the all-ones column at real $z > 1$; this is nonnegative by the power series. These columns must become unbounded as $z arrow.b 1$, since a bounded subsequential limit $v$ would satisfy $v = A^(sans(T)) v + upright(bold(1)) > 0$, and diagonal scaling by $v$ would give row sums strictly below one for the scaled transpose. Normalizing the unbounded columns and taking a limit yields the desired eigenvector.
  ===== 9.1.3 Adding layers. <adding-layers.>
  Now induct by adding one strip layer at a time on top. At $theta = 0$ any polygon using the added layer has zero modified weight (it must use a topmost $upright(bold(b))$, since a new $upright(bold(a))$ has only one edge below). Hence the columns for the new polygons vanish and the old-polygon submatrix is exactly the old matrix, so the spectral radius is the old one (zero initially; empty lists are harmless). Eigenvalues as a multiset, hence spectral radius, vary continuously with $theta$ (finite matrices, continuity of polynomial roots). By (9.3) it follows inductively that $rho \( A \( 1 \) \) < 1$ in every such strip.
  === 9.2 Separators of two antipodal points <separators-of-two-antipodal-points>
  The spectral bound now controls the positive mass of the loops we need. Take any point $f$ off the lattice edges on the cylinder and $f' = f + n U$. Among winding polygons in the strip let $cal(C)$ be those with $f$ on the lower side and $f'$ on the upper, and $cal(C)'$ those with the opposite assignment. Half-period translation interchanges these classes, so both have the same total $w$-mass $W_0$. Any opposite-class pair intersects by the ordering of disjoint winding curves. Therefore $A = A \( 1 \)$ applied to the indicator vector of their union dominates $t_0 W_0$ times that vector (cross-blocks are full), implying $rho \( A \) gt.eq t_0 W_0$ by taking powers if $W_0 > 0$. Consequently their combined mass is at most $2 \/ t_0$. Exhausting vertically by whole-layer strips proves (9.1). ◻
]

== 10 Planar nesting exponent and a bulk visit identity <c2:nesting>

For a lattice face center $f$ in the plane let $Z_R \( f \)$ be the sum over collections of pairwise vertex-disjoint simple polygons all enclosing $f$, with their vertices in the Euclidean ball of radius $R$ about $f$. Include the empty collection, and use product weight with $2 x^(\| gamma \|)$ per polygon. We claim

#[#set math.equation(numbering: n => "(10.1)")
 $ Z_R \( f \) = R^(z + o \( 1 \)) \, #h(2em) z = 1 / 12 . $ <c2:eq-G1>]

The face centers are lattice-congruent by translations. In $V_(n \, n) \( 0 \)$ of the gluing identity (angle zero, polygon fugacity 2), choose $f$ to be the midpoint in the seam gap before the initial block, i.e. a face center (up to translation we can take $e_2 \/ 2 + U \/ 2$), and $f' = f + n U$, as points on the cylinder of period $2 n U$. By the contour estimate and the polygon interpretation, this positive separator partition sum is $n^(1 \/ 6 + o \( 1 \))$.

The square of a planar nesting partition appears because a small separator surrounds exactly one of the two cylinder marks. We show that all other separators change the partition function by only a bounded factor.

Fix $0 < c < \| U \| \/ 3$. Any two planar collections counted in radius $c n$ balls around lifts of $f \, f'$ project together to an allowed cylinder collection: the balls and their relevant period-translates are disjoint, and the polygons separate the two points. This is injective using the specified balls. Thus $V_(n \, n) \( 0 \) gt.eq Z_(c n) \( f \)^2$.

Conversely a contractible separator encloses exactly one of the two points in its disk side, and lifts uniquely around the chosen lift of that point (the lifted polygon and its period translates have disjoint disks by simplicity; such translated bounded disks with disjoint boundaries cannot nest). Unless all vertices are in this $c n$ ball, its planar lift diameter is at least $c n$ since the enclosed point is in the convex hull. These large contractible separators have total single-polygon $2 x^(\| gamma \|)$ mass $O \( 1 \)$ by the cylinder consequence of Proposition 12. Winding separators have bounded total mass by Proposition 13. Dropping all disjointness requirements on this large-or-winding group costs a partition factor at most the exponential of their total mass. Every remaining subcollection around either point lifts into its indicated ball as disjoint planar polygons. Together with the earlier injection, this gives

#[#set math.equation(numbering: n => "(10.2)")
 $ Z_(c n) \( f \)^2 lt.eq V_(n \, n) \( 0 \) lt.eq e^C Z_(c n) \( f \)^2 \, $ <eq:disk-localization>]

where $C$ is independent of $n$. The cylinder exponent is $1 \/ 6$, so the square in (10.2) gives the planar exponent $z = 1 \/ 12$. Monotonicity between the scales $c n$ proves (10.1) for all large radii.

=== 10.1 A finite identity converting nesting into visits <sec:finite-visits>

The nesting estimate counts polygons. We now insert a visited vertex using an identity in a finite domain. No limiting path law is needed. The same finite recursion appears in [19] Proposition 8.1; we include its proof because positivity on filled sets is needed after deleting a chord.

A finite vertex set $D$ is #emph[filled] if every lattice vertex strictly inside a simple polygon in its induced graph also belongs to $D$. Its boundary ports are midpoints of edges with one endpoint in $D$ and the other outside. Sum excursions with both orders on their distinct endpoints. For $v in D$, define

$ T \( v \, D \) = sum_(gamma upright(" excursion in ") D\
v in gamma) x^(ell \( gamma \)) e^(i s W \( gamma \)) \, #h(2em) s = 3 \/ 8 \, $

where $W$ is the signed sum of the turns, including those at the first and last visited vertices. Reversal conjugates each term, so $T \( v \, D \)$ is real. For a general filled set its individual terms need not have positive real part.

For a face center $f$, let $Z \( D \; f \)$ sum collections of pairwise vertex-disjoint simple polygons in $D$ enclosing $f$, with weight $2 x^(\| Gamma \|)$ per polygon and empty weight one. For a polygon $Gamma$, write $Gamma^compose$ for its strict interior vertex set. If $v in Gamma$, let $tau_v \( Gamma \) = plus.minus pi \/ 3$ be its turn at $v$ in counterclockwise traversal.

#thm([Proposition 10.1.])[
  (Visit recursion and nesting comparison).  #emph[For every finite filled $D$ and $v in D$, 
#[#set math.equation(numbering: n => "(10.3)")
 $ T \( v \, D \) = 3 & + sum_(Gamma subset D\
v in Gamma) 2 x^(\| Gamma \| - 1) #scale(x: 120%, y: 120%)[\[] - cos #scale(x: 120%, y: 120%)[\(] s \( 2 pi - tau_v \( Gamma \) \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\]]\
 & + sum_(Gamma subset D\
v in Gamma^compose) 2 x^(\| Gamma \|) T \( v \, Gamma^compose \) . $ <c2:eq-G2>]

 Every coefficient on the right is positive. In particular, $T \( v \, D \) gt.eq 3$ and $T \( v \, D \)$ is monotone under inclusion of finite filled sets containing $v$. There are absolute positive constants such that 
#[#set math.equation(numbering: n => "(10.4)")
 $ T \( v \, D \) asymp sum_(f upright(" incident to ") v) Z \( D \; f \) . $ <c2:eq-G3>]

 If $D$ is the vertex set inside a bounded convex polygon cut out by admissible walls, and $A_D \( v \)$ denotes the corresponding positive, ordered excursion weight through $v$, then 
#[#set math.equation(numbering: n => "(10.5)")
 $ cos \( 3 pi \/ 8 \) A_D \( v \) lt.eq T \( v \, D \) lt.eq A_D \( v \) . $ <eq:positive-visits>]

]
] <prop:visits>

#proof[
  On arriving at a fresh vertex along one edge, take either nonbacktracking continuation with weight $x e^(i s pi \/ 3)$ or $x e^(- i s pi \/ 3)$. These weights sum to one. Stop at a port exit or before making a choice at the first repeated vertex. The exploration tree is finite; replacing a node by its children preserves total weight. Consequently all terminal weights sum to one. A prefix stopped upon arrival at a vertex has not yet taken that vertex’s weight or turn.
  Start at a boundary port of $D$. A first repeat consists of a simple stem and a simple attached polygon. The stem reaches the polygon from its exterior. Otherwise the outside neighbor of its initial port would lie strictly inside that polygon: the stem could not leave the interior without previously hitting the polygon. This contradicts filling. Reversing the attached loop changes its added turn from $4 pi \/ 3$ to $- 4 pi \/ 3$. The two phases sum to $2 cos \( 4 pi s \/ 3 \) = 0$. This pairing preserves the visited vertices, so it still cancels when we retain only histories that have visited $v$. Continuing any first-arrival prefix at $v$ has total weight one. Thus the sum of such prefixes, over all initial ports, equals $T \( v \, D \)$.
  Next start at $v$ along each of its three edges with weight one and no turn or vertex weight at $v$. Stop at an exit, a return to $v$, or the first repeat of another vertex. These three experiments have total weight three. Exit terms are reversals of the first-arrival prefixes, so their sum is $overline(T \( v \, D \)) = T \( v \, D \)$.
  A return to $v$ traverses a simple polygon $Gamma$ through it. The counterclockwise turn omits the turn at $v$ and equals $2 pi - tau_v \( Gamma \)$; the reverse orientation has opposite turn. Their total terminal contribution is
  $ 2 x^(\| Gamma \| - 1) cos #scale(x: 120%, y: 120%)[\(] s \( 2 pi - tau_v \( Gamma \) \) #scale(x: 120%, y: 120%)[\)] . $
  The missing factor of $x$ is exactly the unweighted starting vertex.
  For a repeat at another vertex, the attached polygon avoids $v$. If $v$ is outside, the same exterior cancellation applies. If $v$ is inside, its stem reaches the attachment along the interior third edge. The turn there in counterclockwise traversal is $- pi \/ 3$, whereas arriving from the stem gives $+ pi \/ 3$. The two possible added turns are therefore $8 pi \/ 3$ and $- 8 pi \/ 3$, both with phase $- 1$. The combined factor is $- 2 x^(\| Gamma \|)$.
  For a fixed polygon enclosing $v$, these stems are exactly the simple paths from $v$ exiting $Gamma^compose$, with no weight or turn at $v$. Filling gives $Gamma^compose subset D$, and planarity implies that an edge leaving the strict interior ends on $Gamma$. Completing the last half-edge therefore reaches the attachment without adding another weighted vertex. The stem sum is $T \( v \, Gamma^compose \)$, by the prefix reversal just proved in that smaller filled domain. Summing all terminal contributions and moving the non-exit terms to the other side proves (10.3).
  To prove positivity and the comparison, there are only two local cases. A through-polygon encloses one incident face center when its turn at $v$ is $+ pi \/ 3$, and two when that turn is $- pi \/ 3$. The omitted-turn angles are respectively $5 pi \/ 3$ and $7 pi \/ 3$. In these cases set
  $ c_1 = - cos \( 5 pi \/ 8 \) > 0 \, #h(2em) c_2 = - cos \( 7 pi \/ 8 \) > 0 . $
  The recursion terminates, since taking strict interior reduces the number of vertices. Unroll it into an outer-to-inner chain of disjoint polygons strictly enclosing $v$. Each chain carries the product of factors $2 x^(\| Gamma \|)$. In its remaining interior $D'$, the last factor is
  $ 3 + 2 / x sum_(Q subset D'\
v in Q) c_(m_Q) x^(\| Q \|) \, #h(2em) m_Q in { 1 \, 2 } . $
  This positive expansion gives both $T \( v \, D \) gt.eq 3$ and monotonicity: inclusion only adds eligible chains and through-polygons.
  The same chains enumerate the three incident-face partition functions. A polygon strictly enclosing $v$ surrounds all three incident face centers. A polygon through $v$ surrounds precisely $m_Q$ of them. Conversely, a polygon surrounding one incident center has $v$ inside or on its boundary, since the open face approaches $v$ and does not meet the polygon. At most one polygon of a disjoint collection can pass through $v$, and that polygon is innermost. Hence the final factor for the incident-face sum is
  $ 3 + 2 sum_(Q subset D'\
v in Q) m_Q x^(\| Q \|) . $
  The ratios $c_m \/ \( x m \)$, for $m = 1 \, 2$, are fixed positive numbers. Termwise comparison proves (10.4).
  Finally, for an admissible convex domain the turn rule proved with (2.1) gives $- pi lt.eq W lt.eq pi$. Every real part is therefore between $cos \( 3 pi \/ 8 \)$ and one times its positive path weight. This proves (10.5). ◻
]

Proposition 14 has completed the conversion from polygon nesting to bulk-visit weight. It has not chosen the path’s terminal side. We first use it for the triangle law, where both endpoints are summed; the subsequent sewing arguments select arches and then bridges.

=== 10.2 The triangle visit law <the-triangle-visit-law>

For example take triangles $D_R = { y : e_nu dot.op y < R \, med nu = 0 \, 1 \, 2 }$, $R arrow.r oo$ in the wall family $1 \/ 2 + \( 3 \/ 2 \) bb(Z)$, with vertex sets $V_R$, and let $I_R$ be the vertices of the inner triangle using $\( 1 - epsilon \) R$, for a sufficiently small fixed $epsilon > 0$. By (10.1),(10.4),

$ T \( v \, V_R \) = R^(z + o \( 1 \)) quad \( v in I_R \) \, #h(2em) T \( v \, V_R \) lt.eq R^(z + o \( 1 \)) quad \( v in V_R \) \, $

uniformly, by fitting balls about incident face centers. These masses are comparable to the positive $x^ell$ weights of excursions through $v$, since (2.1)’s turn bound gives cosines between $cos r > 0$ and 1.

The total ordered positive mass $M_R$ of excursions visiting $I_R$ satisfies $M_R asymp R^(1 - p)$, $p = 1 \/ 4$. Indeed at a starting port on a given side, subtract the real part of (2.1) from the saturated half-plane comparison for that side. The mass exiting on other sides is at most the mass of same-wall half-plane arches lost by adding those sides (all exit cosines at least $cos r$); this is $O \( \( 1 + d \)^(- p) \)$ if $d$ is distance to the nearer of the other two lines, by the diameter upper tail. Summing regularly spaced starts along the sides gives $O \( R^(1 - p) \)$. Same-side visits to $I_R$ cost at most that order also by the half-plane height tail. Conversely take starts in the middle of the bottom line (horizontal coordinate bounded by $R \/ 4$). Half-plane arches with height exceeding $epsilon R$ have mass at least $c_1 \( epsilon R \)^(- p)$ per start; those with height or horizontal width above $R \/ 4$ have mass at most $C_1 R^(- p)$. For small fixed $epsilon$, the remaining high arches thus give order $R^(- p)$ mass, stay in the triangle, and visit $I_R$ (their horizontal coordinates have magnitude at most $R \/ 2$, vertical between $- R$ and $- 3 R \/ 4$). This proves the lower bound.

Normalizing these macroscopic excursion weights, each $v in I_R$ has visit probability $R^(z + p - 1 + o \( 1 \)) = R^(- 2 \/ 3 + o \( 1 \))$. Summation over $I_R$, and the upper bound using all $v in V_R$, show that the expected number of visited vertices (also just counting those in $I_R$) is

#[#set math.equation(numbering: n => "(10.6)")
 $ R^(1 + p + z + o \( 1 \)) = R^(4 \/ 3 + o \( 1 \)) . $ <c2:eq-G4>]

== 11 Mass dimension for macroscopic half-plane SAW arches <c2:arches>

Use the critical half-plane arches of the boundary part, from a fixed bottom port to any other bottom port, each given positive weight $x^ell$, where $ell$ counts visited lattice vertices. We include both ending directions (or equivalently, by symmetry for length and size statistics, can restrict to rightward endpoints). For all sufficiently large fixed $K_0$, conditioning and normalizing this weight on diameter in $\[ H \, K_0 H \]$ gives

#[#set math.equation(numbering: n => "(11.1)")
 $ bb(E) \[ ell \] = H^(4 \/ 3 + o \( 1 \)) #h(2em) \( H arrow.r oo \) . $ <c2:eq-H1>]

The same conclusion holds using height at least $H$ and diameter at most $K_0 H$. Either normalizing mass is $asymp H^(- p)$ by (4.3)–(4.5) and the derived height and diameter bounds, choosing $K_0$ large. We show the corresponding unnormalized length sum has order in powers $H^(1 + z + o \( 1 \))$.

First, for the upper bound it is enough to require diameter at most $K_0 H$. Translate the starting port along the wall to $asymp H$ consecutive positions. All these translated arches fit, still as same-side excursions, in a single admissible equilateral triangle on that wall of size $O \( H \)$ (translate the first port to the standard one, and add distant sides from the other two cut families). Their aggregate length sum is at most $H^(2 + z + o \( 1 \))$ by summing (10.1),(10.4) over vertices and using $cos \( s W \) gt.eq cos r$ for all triangle exits. Division by the number of starts gives the bound.

=== 11.1 Recoverable representations and one exterior arm <recoverable-representations-and-one-exterior-arm>

Glazman and Manolescu concatenate triangle walks in disjoint wedges [10] Section 4.1; Krachun and Panagiotis control the number of reconstructions through renewal cuts [14] Section 3. Here we bound two weighted moments of the representation count and apply Cauchy–Schwarz.

We use the following elementary weighted form throughout the sewing arguments. If distinct paths $xi$ have positive weights $w_xi$ and nonnegative representation weights $m \( xi \)$, with $0 < sum_xi w_xi m \( xi \)^2 < oo$, then

#[#set math.equation(numbering: n => "(11.2)")
 $ sum_(xi : m \( xi \) > 0) w_xi gt.eq frac(#scale(x: 120%, y: 120%)[\(] sum_xi w_xi m \( xi \) #scale(x: 120%, y: 120%)[\)]^2, sum_xi w_xi m \( xi \)^2) . $ <eq:sewing-cauchy>]

Here a representation specifies the cuts at which pieces were joined. The first moment counts all such constructions. To bound the second, we recover pieces of the same path from two sets of cuts. Each application below will give its own recovery argument; disjointness of the pieces in one construction alone would not control the multiplicity.

For the arch lower bound, put $R = 2 H$; take triangles bounded by $e_i dot.op y < d_i \, med i = 0 \, 1 \, 2$, where the offsets $d_i$ range independently over the allowed grid in $\[ R \, 2 R \]$. Each such triangle has diameter $O \( R \)$. Fix any vertex $v$ with $\| v \| lt.eq R \/ 2$. The mass of ordered excursions through $v$ for each triangle is $R^(z + o \( 1 \))$, uniformly by (2.1),(10.1),(10.4) as before. Partition by starting and ending sides. Keeping one ordered pair of sides $A \, B$ (indices in ${ 0 \, 1 \, 2 }$, the same pair for all offsets kept), we have aggregate mass at least $R^(3 + z - o \( 1 \))$ through $v$. We want half-plane arches from side $A$, with only that wall enforced, visiting $v$; we count distinct ordered arches over the wall locations. If $A = B$ the chosen excursions already have this kind, of diameter $O \( R \)$, with multiplicity at most $O \( R^2 \)$ since the starting port determines $d_A$. Their distinct mass is thus at least $R^(1 + z - o \( 1 \))$.

Suppose $A eq.not B$. From any ending port on $B$ append an arm outside that wall ($e_B dot.op y > d_B$) staying inside the $A$ half-plane until exiting on $A$. Such arms of diameter $lt.eq C R$ have total mass at least $c_1 R^(- p)$ for suitable universal $C \, c_1 > 0$. In detail, consider the half-plane exterior to $B$ from that port (congruent to the earlier half-plane by lattice symmetries, using also a half-turn at the port). Truncate it by two distant sides of the admissible triangle kind, at distances comparable to $K R$ from the start, $K$ a large fixed constant. Exit mass to the two distant sides is $O \( \( K R \)^(- p) \)$: subtract the real row identity (2.1) from half-plane saturation, use the common cosine $cos r$ on bottom exits and the diameter upper tail for bottom exits lost by the truncation. Now cut additionally by $A$. The starting port is strictly on the retained side of $A$, whose line intersects the $B$ line at distance $O \( R \)$ from it. Indeed no ports for one orientation lie on cut lines of another, and the ending port of the triangle excursion lies on its $B$ side. The mass of bottom arches lost relative to the full exterior half-plane now is at least $c_2 R^(- p)$, since they include arches ending beyond that corner on the removed ray of the $B$ line, and we have the displacement tail (4.5). So by the same real identity, the mass exiting on sides other than $B$ is at least $c_2 \( cos r \) R^(- p)$. Exits on the truncating distant sides are a subset of those before adding the cut and still cost at most $O \( \( K R \)^(- p) \)$; choose $K$ large. This proves the asserted arm supply. Use bounded arms as here, thinning their weights by a constant scalar $lambda' lt.eq 1$ per ending port and offset triple (the ending port of the triangle piece) so that the arm mass after thinning is exactly $c_1 R^(- p)$.

===== 11.1.1 Recovering two representations. <recovering-two-representations.>

The excursion and arm live on opposite sides of $B$, so concatenate simply at the port (weight multiplicative before thinning), giving an ordered arch in the $A$ half-plane through $v$ of diameter $lt.eq C' R$. For each such arch $xi$ define $m_D \( xi \)$ for offset triple $D$ to equal the thinning scalar if represented at that triple, zero otherwise. Indeed at a fixed triple the crossing of the $B$ line is unique, so both pieces are uniquely specified by $xi$. Write $m = sum_D m_D$. Over distinct resulting arches, with unthinned weight $w_xi$,

#[#set math.equation(numbering: n => "(11.3)")
 $ sum_xi w_xi m \( xi \) gt.eq R^(3 + z - p - o \( 1 \)) \, #h(2em) sum_xi w_xi m \( xi \)^2 lt.eq R^(5 + z - 2 p + o \( 1 \)) . $ <c2:eq-H2>]

For the second bound take two triples; they need the same $A$ line, and order them so the first $B$ offset is at most the second. The crossing at the first precedes or equals the crossing at the second (at each the path goes from strict interior to strict exterior for that $B$ wall). The prefix through $v$ up to the first crossing is a first-triple triangle chord and costs $lt.eq R^(z + o \( 1 \))$ in total. The segment between crossings if distinct stays between the parallel lines and is a strip bridge, costing $lt.eq C \( 1 + Delta \)^(- p)$ from a fixed first crossing by the strip bound at (4.5), where $Delta$ is the offset difference (if zero there is no segment). The remainder is the second-triple arm and costs $c_1 R^(- p)$ including its thinning, given the second crossing. Dropping other restrictions and the first thinning gives the desired bound after summing: there are $O \( R \)$ choices for the common $A$ offset, $O \( R^2 \)$ for the two offsets of the remaining third side, and the sum of $\( 1 + Delta \)^(- p)$ for $B$ offsets is $O \( R^(2 - p) \)$. Thus (11.2) gives distinct arch mass at least $R^(1 + z - o \( 1 \))$.

All these bounds are uniform over the indicated $v$; all produced arches have height from their $A$ line at least $R \/ 2$ since they visit $v$. Sum over the $asymp R^2$ choices of $v$: the aggregate arch mass with a marked visited vertex is at least $R^(3 + z - o \( 1 \))$, allowing all of the $O \( R^2 \)$ possible starts with their oriented walls (triangle ports within distance $O \( R \)$ of the origin). For any one such start and wall the mass is bounded by the full unnormalized length sum in a congruent standard half-plane with that height constraint and diameter $lt.eq K_0 H$, by lattice symmetry and taking $K_0$ sufficiently large. So this latter sum per fixed start is at least $R^(1 + z - o \( 1 \))$, completing (11.1).

== 12 A bulk mark with separated chord endpoints <c2:separated>

To attach two exterior arms, we must retain the full bulk-visit order after excluding chords whose endpoints are closer than a sublinear scale. We first derive a finite three-leg identity comparing marked chords with intersecting chord pairs. We then average the positions of the triangular walls; this makes the loss from small endpoint gaps negligible. The conclusion is the separated-endpoint supply in (12.5); it is an average over triangles, exactly the form needed by the final sewing argument.

=== 12.1 The marked three-leg identity <the-marked-three-leg-identity>

Use a bounded admissible convex lattice polygon $D$ as in (2.1), also denoting its interior vertex set by $D$, with a vertex $v$ there. Ports $a \, b \, dots.h$ are physical exits from $D$. Write $u_(a b) = e^(upright(i) s W_(a b))$ for the exit phase from $a$ to $b$, $u_(b a) = overline(u)_(a b)$. Denote the positive chord mass by $h_(a b)$, counting each simple chord between the two ports once, and the portion visiting $v$ by $K_(a b)$. At identical indices these masses are zero (phases there irrelevant). Put $T_v = T \( v \, D \)$ and $c_(*) = 2 cos \( 2 lambda \) = sqrt(2)$ with $s = 3 \/ 8 \, med lambda = pi \/ 8 \, med r = pi s$ as before.

Let $A_b$ be the spin-weighted sum of simple paths from $v$ to $b$, with three initial directions allowed and no weight or turn at $v$. By the first-hit argument of (10.3) from $b$, and reversal, $A_b = sum_d u_(d b) K_(b d)$. In particular $Re A_b gt.eq 0 \, med sum_b A_b = T_v$, and $sum_(a b) K_(a b) asymp T_v$. Denote by $P_(d divides a b)$ the same kind of sum as $A_d$ with a disjoint simple chord $beta : a - b$ present, weighted positively by $w_beta = x^ell$. Define

$ H_(a b) = sum_(beta : a - b \, med v in.not beta) w_beta thin T \( v \, D \\ V \( beta \) \) . $

This is between zero and $h_(a b) T_v$ by (10.3); deletion preserves filling (the connected deleted path leads to the exterior). For two distinct valid endpoint pairs let

$ R_(a b \, d e) = K_(a b) h_(d e) + h_(a b) K_(d e) - U_(a b \, d e) gt.eq 0 \, $

where $U$ is the derivative at 1 of the disjoint positive chord-pair mass with a multiplier per visit to $v$. Thus $R$ is the independent intersecting-pair mass with a mark at $v$ on one of the two paths, summed over both marking choices. Shared endpoints are allowed here, with $U = 0$ then. Set $U \, R = 0$ if one pair is invalid (a doubled site).

We use the identity for $a eq.not b$

#[#set math.equation(numbering: n => "(12.1)")
 $ sum_(d eq.not a \, b) sum_e Re #scale(x: 120%, y: 120%)[\[] c_(*) u_(e d) R_(a b \, d e) - u_(b a) u_(a d) u_(e b) R_(a d \, b e) - u_(a b) u_(b d) u_(e a) R_(b d \, a e) #scale(x: 120%, y: 120%)[\]] & = c_(*) \( h_(a b) T_v - H_(a b) \) - \( 2 + c_(*) \) K_(a b)\
 & quad - \( c_(*) - 1 \) h_(a b) Re \( A_a + A_b \) . $ <c2:eq-K1>]

Here $d eq.not a \, b$ means distinct from both. We derive the identity in two stages. First three explorations cancel ordinary three-leg collisions and give a relation in the $P$’s. Then a marked boundary exploration replaces those $P$’s by intersecting-pair masses; its collision terms cancel in the same linear combination.

===== 12.1.1 Three choices of the incoming leg. <three-choices-of-the-incoming-leg.>

First $H_(a b)$ is the sum with $beta$ present of the simple exit terms from $v$ in its complement, by the prefix form of (10.3). Physical exits cost $sum P_(d divides a b)$; other exits hit $beta$, forming tripod terms $C_I$. Alternatively take an existing spin path $v arrow.r b$ in $D$; run the non-backtracking experiment from $a$ stopping also at first hit to that path. This gives $A_b = sum_(d eq.not a \, b) u_(a d) P_(b divides a d) + C_(I I)$ by physical exits, exterior self-repeat cancellation as in (2.1), and hits. Similarly $A_a = sum_(d eq.not a \, b) u_(b d) P_(a divides b d) + C_(I I I)$.

On a hit-tree branching at a vertex other than $v$, all three options exist with the same magnitude. Compare option II to I oriented for its through chord $a arrow.r b$ (to give the chord spin weight in I one multiplies I by $u_(a b)$). Switching which incoming leg (from $v \, a$) passes toward $b$ then changes the branch turn, giving a ratio $e^(plus.minus 2 upright(i) lambda)$ according to the ray order. For III compare to I oriented as $b arrow.r a$, giving $e^(minus.plus 2 upright(i) lambda)$ (turns between consecutive rays in counterclockwise order are $- pi \/ 3$, between reverse-ordered ones $+ pi \/ 3$); other directed turns agree in each comparison. Thus $u_(b a) C_(I I) + u_(a b) C_(I I I)$ contributes $c_(*) C_I$ there. Hits branching at $v$ occur only in II,III and form the marked chords in opposite orientations, with a missing weight and turn at $v$; together their normalized factor after removing the full chord phase is $2 cos lambda \/ x = 2 + c_(*)$. We get

#[#set math.equation(numbering: n => "(12.2)")
 $ sum_(d eq.not a \, b) #scale(x: 120%, y: 120%)[\[] c_(*) P_(d divides a b) - u_(b a) u_(a d) P_(b divides a d) - u_(a b) u_(b d) P_(a divides b d) #scale(x: 120%, y: 120%)[\]] = c_(*) H_(a b) + \( 2 + c_(*) \) K_(a b) - u_(b a) A_b - u_(a b) A_a . $ <c2:eq-K1a>]

===== 12.1.2 Marking the boundary exploration. <marking-the-boundary-exploration.>

Define

$ tilde(P)_(d divides a b) = sum_e u_(e d) U_(a b \, d e) - K_(a b) = h_(a b) A_d - sum_e u_(e d) R_(a b \, d e) . $

The second equality uses the conjugate of (2.1). We do not assert $P_(d divides a b) = tilde(P)_(d divides a b)$. What we need, and now prove, is the equality of the three-term combinations

$ & c_(*) P_(d divides a b) - u_(b a) u_(a d) P_(b divides a d) - u_(a b) u_(b d) P_(a divides b d)\
 & #h(2em) = c_(*) tilde(P)_(d divides a b) - u_(b a) u_(a d) tilde(P)_(b divides a d) - u_(a b) u_(b d) tilde(P)_(a divides b d) . $

With a positive existing chord $a - b$, run the complex exploration from $d$, stopping also on its first hit to that chord. Give every occurrence of the vertex weight at $v$, in the existing chord or the exploration, an extra fugacity and differentiate at fugacity one. The derivative at fugacity 1 of the total terminal weight is $K_(a b) + overline(P)_(d divides a b)$. The first term differentiates the existing chord, after which the undeformed continuation has total weight one. The second differentiates the transition at a fresh, nonterminal $v$. At fugacity one the sum of the two differentiated outgoing weights is one, and so is the total weight of all subsequent continuations. What remains is the first-arrival prefix at $v$, whose reversal gives $overline(P)_(d divides a b)$. Exterior self-repeats still cancel, physical exits give derivative $sum_e u_(d e) U_(a b \, d e)$, and remaining hits give tripod terms carrying the mark on their union (once if $v$ is there, including at a branch where it is the chord that counts the vertex). For any one such marked tripod, write $C_i$ for the weight when the leg from $i$ is the orphan exploration (the other two forming the positive chord). If $i \, j \, k$ are the boundary ports in counterclockwise order then $C_i \/ C_j = u_(i j) e^(upright(i) lambda)$: the magnitudes agree and joining the two legs into $i arrow.r j$ adds the turn $- pi \/ 3$ at branching by planar ray order. Thus

$ c_(*) overline(C)_d = u_(b a) u_(a d) overline(C)_b + u_(a b) u_(b d) overline(C)_a . $

For instance in order $a \, b \, d$, for increasing indices write $u_(i j) = p_j \/ p_i thin e^(- upright(i) r)$ with $p_i = e^(upright(i) s phi.alt_i)$ for lifted outward normal angles by (2.1). Then $overline(C)_b \/ overline(C)_d = p_b \/ p_d thin e^(2 upright(i) lambda)$, $overline(C)_a \/ overline(C)_d = p_a \/ p_d thin e^(4 upright(i) lambda)$; exchange $a \, b$ for the other order. This cancels the conjugated hit derivatives in the stated replacement.

===== 12.1.3 Collecting the one-path terms. <collecting-the-one-path-terms.>

Substituting in (12.2), the terms with $A$’s on the left sum by (2.1) to $c_(*) h_(a b) T_v - \( c_(*) - 1 \) h_(a b) \( A_a + A_b \) - u_(b a) A_b - u_(a b) A_a$. Taking real parts gives (12.1).

=== 12.2 A weighted bound for short endpoint gaps <a-weighted-bound-for-short-endpoint-gaps>

The identity becomes useful after summing against a slowly decaying endpoint weight. Its positive intersecting-pair terms force every marked chord to meet many ordinary chords. The remaining terms measure how much the visit sum decreases when an ordinary chord is removed.

Use equilateral triangles of normals $e_nu$ of size comparable to a scale $H$, with $v$ at distance $gt.tilde H$ from the sides. Set $alpha = 1 - p \, med p = 1 \/ 4 \, med G_(a b) = \( 1 + \| b - a \| \)^(- tau)$ for fixed $0 < tau < alpha$. We claim

#[#set math.equation(numbering: n => "(12.3)")
 $ H^alpha sum_(a b) G_(a b) K_(a b) med lt.tilde med sum_(a b) G_(a b) \( h_(a b) T_v - H_(a b) \) + H^(alpha - tau) T_v . $ <c2:eq-K2>]

Sum (12.1) over pairs with the $G$ weights. On the left, for any two distinct valid chord types (endpoint pairs) $beta \, eta$, the explicitly positive terms containing $R_(beta \, eta)$ have combined coefficient at least $c_(*) cos r thin \( G_beta + G_eta \)$, even for a shared endpoint (orient to use a $d$ outside the first pair, and likewise exchanging the pairs). Negative incidences are bounded in number for those same chord types, each of size at most $G_(a b)$ for $a \, b$ endpoints one of each. Absorb those with $G_(a b)$ a sufficiently small absolute fraction of $G_beta + G_eta$ using at most half the positive coefficients. For remaining ones bound $R$ above by independent products. Calling $beta$ from $a$ marked and $eta = \( b \, e \)$ unmarked in such a product, we have $1 + \| e - b \| gt.tilde_tau 1 + \| a - b \|$. Given $a$, for dyadic $1 + \| b - a \| tilde.op g$ the sum of $h_(b e)$ on these choices is $O_tau \( g^alpha \)$. Indeed same-side endings from $b$ cost $O \( g^(- p) \)$ per start by half-plane displacement, and different-side endings cost $O \( \( 1 + "dist" \( b \, upright("corners") \) \)^(- p) \)$ by the row comparison used at (10.6); summing the latter over any $O \( g \)$ ports costs $O \( g^alpha \)$ as well by side spacing. Summing over $g$ with the negative-incidence weight costs $O \( H^(alpha - tau) \)$ per marked endpoint, as required.

===== 12.2.1 A supply of chords intersecting each marked chord. <a-supply-of-chords-intersecting-each-marked-chord.>

For the positive terms left over, given any chord $beta$ from $a$ through $v$, there is mass $gt.tilde H^alpha$ of chords with distinct unused endpoints separating $a$ from $v$, hence intersecting $beta$, giving the needed lower from $G_beta R_(beta \, eta)$. Here are details. Near a corner use a smaller equilateral triangle there of small fixed proportional size, sharing the two adjacent faces (cut the third on the allowed grid), not containing $v$. Chords between its two shared faces, with endpoints bounded away from corners by another sufficiently small proportional amount, have total mass $gt.tilde H^alpha$. Indeed in that triangle subtracting (2.1) from half-plane saturation loses bottom arches of mass $gt.tilde H^(- p)$ per port by long displacements (4.5), so this lower bound holds for all different-side chords summed, and then for each pair of sides by cyclic symmetry. The grid triangles have this symmetry: after rotation by $120^compose$, any cut-offset differences are $\( 3 \/ 2 \)$-integer triples summing to zero and are restored by lattice translation. Endpoint trimming costs arbitrarily little of the bound by the different-side upper just used. Thus for $a$ sufficiently close proportionally to the shared corner these chords cut it off in a corner region away from $v$. For $a$ bounded away from corners proportionally, use same-side half-plane arches bracketing $a$: take starts on one side of $a$ along its wall at distance between $gamma H$ and $2 gamma H$, ending towards and past $a$ with gap $> 3 gamma H$ and diameter $lt.eq C gamma H$, cost $gt.tilde H^(- p)$ per start by (4.5) and the diameter upper choosing $C$ large. For sufficiently small fixed $gamma$ they stay triangle chords and close off $a$ in a region away from $v$. In both constructions removing specified endpoints of $beta$ costs only $O \( 1 \)$ mass. This justifies the positive lower in (12.3); on the right of (12.1) discard the last two nonpositive terms.

=== 12.3 Averaging the walls <averaging-the-walls>

We now average each of the three cut offsets independently over intervals of length comparable to $H$ on their allowed grids, maintaining the size and depth conditions. Uniformly with these assumptions,

#[#set math.equation(numbering: n => "(12.4)")
 $ ⟨sum_(a b) G_(a b) K_(a b)⟩ lt.eq H^(z - tau + o \( 1 \)) . $ <c2:eq-K3>]

The point of averaging is that the difference between a visit sum and its inward translate telescopes over an offset window. Only the two end intervals remain, containing an $O \( L \/ H \)$ fraction of its offsets. To use this gain, we first bound the mass of ordinary chords at scale $L$.

===== 12.3.1 Chords of a prescribed diameter. <chords-of-a-prescribed-diameter.>

To estimate the first right term of (12.3), classify ordinary chords by dyadic $1 + "diam" tilde.op L$ ($1 lt.eq L lt.tilde H$). Uniformly per triangle their total at this scale with $G$ included costs $O \( H L^(- p - tau) \)$. Indeed different-side chords with dyadic gap $1 + \| b - a \| tilde.op g lt.tilde L$ have both ports within $O \( g \)$ of their corner, hence cost unweighted $O \( g^alpha \)$ as above, sufficient after summing $g$. For the same-side bound, let $a_(g \, L)$ be the half-plane mass from a fixed left endpoint to right endpoints at these gap and diameter scales. Complete each such upper arch by an opposite-half-plane arch with the same endpoints. Its mass, with endpoints fixed, is $asymp g^(- 1 - p)$ by the pointwise bound for $h$. The two arches form a simple polygon.

Let $m \( gamma \)$ count representations of its unoriented translation class. A representation specifies a horizontal cut meeting the polygon exactly twice; translating the left crossing to the standard port then recovers both arches. Thus its first moment satisfies

$ E_1 := sum_gamma x^(\| gamma \|) m \( gamma \) gt.tilde a_(g \, L) g^(- 1 - p) . $

For two such cuts, normalize the higher one. Their height difference $Delta$ is $O \( L \)$, because both designated upper arches have diameter $O \( L \)$. The high-cut upper arch costs $a_(g \, L)$. Between the cuts there are two strip bridges, costing at most $B \( Delta \)^2$ from the revealed crossings. Below them remains a fixed-end arch, costing at most $C g^(- 1 - p)$; the lower cut must also have endpoint gap of order $g$. At coincident cuts use factor one. Summing the height gap gives

$ E_2 := sum_gamma x^(\| gamma \|) m \( gamma \)^2 lt.tilde a_(g \, L) g^(- 1 - p) sum_(0 lt.eq Delta lt.tilde L) \( 1 + Delta \)^(- 2 p) lt.tilde a_(g \, L) g^(- 1 - p) L^(1 - 2 p) . $

Every eligible polygon has diameter at least $c L$, since it contains a designated upper arch of that diameter. The lower completing arch is unrestricted and may make the polygon much larger. Sum the bound in Proposition 12 over #emph[all] diameter dyads above $c L$ to obtain

$ S := sum_(gamma : m \( gamma \) > 0) x^(\| gamma \|) lt.tilde sum_(j gt.eq 0) \( 2^j L \)^(- 2) = O \( L^(- 2) \) . $

The inequality $E_1^2 lt.eq S E_2$ now yields $a_(g \, L) lt.tilde g^(1 + p) L^(- 1 - 2 p)$. For $tau < 1 - p$, the dyadic sum satisfies

$ sum_(g lt.tilde L) g^(- tau) a_(g \, L) lt.tilde L^(- 1 - 2 p) sum_(g lt.tilde L) g^(1 + p - tau) lt.tilde L^(- p - tau) . $

There are $O \( H \)$ starting ports; reversal accounts for the other endpoint order. This proves the required $O \( H L^(- p - tau) \)$ bound.

===== 12.3.2 The averaged loss under deletion. <the-averaged-loss-under-deletion.>

Shrink every side inward by a grid amount $m_L asymp L$, choosing its constant larger than the diameter bound for this dyad, and call the remaining vertex set $D_(-)$. A chord at scale $L$ has an endpoint on one original side; every vertex of that chord lies within $O \( L \)$ of that side. It therefore avoids $D_(-)$, so $D_(-) subset D \\ V \( beta \)$. By filled-domain monotonicity their contribution in the difference term of (12.3) is bounded by their $G$-weighted mass times $T \( v \, D \) - T \( v \, D_(-) \)$ (take the latter $T \( v \, D_(-) \) = 0$ if $v in.not D_(-)$). To average this difference, shift the three coordinates one at a time. For one coordinate, write its consecutive allowed levels as integers $a lt.eq d lt.eq b$, and write $q = O \( L \)$ for the shift in grid steps. For any nonnegative monotone sequence $F$,

$ sum_(d = a)^b #scale(x: 120%, y: 120%)[\(] F \( d \) - F \( d - q \) #scale(x: 120%, y: 120%)[\)] = sum_(d = b - q + 1)^b F \( d \) - sum_(d = a - q)^(a - 1) F \( d \) lt.eq q sup F . $

Extend the visit sum by zero when the domain no longer contains $v$. This remains monotone. The uniform bound $sup F lt.eq H^(z + o \( 1 \))$ follows from (10.4); each offset window has order $H$ levels. The three-coordinate difference therefore averages to $O \( L \/ H \) H^(z + o \( 1 \))$. The averaged right-hand deletion term in (12.3) is therefore at most

$ sum_(L lt.tilde H) H L^(- p - tau) L / H H^(z + o \( 1 \)) lt.tilde H^(z + 1 - p - tau + o \( 1 \)) . $

The sum is dyadic and $1 - p - tau = alpha - tau > 0$. Divide by $H^alpha$ in (12.3) to obtain (12.4).

===== 12.3.3 Retaining separated endpoints. <retaining-separated-endpoints.>

We now derive the retained endpoint estimate for every fixed $epsilon.alt > 0$. It suffices to consider $0 < epsilon.alt < 1$; the assertion for larger $epsilon.alt$ follows by monotonicity of the retained endpoint set. On the set $\| b - a \| < H^(1 - epsilon.alt)$, the weight $G_(a b) = \( 1 + \| b - a \| \)^(- tau)$ is at least a constant times $H^(- tau \( 1 - epsilon.alt \))$. Equation (12.4) therefore gives

$ ⟨sum_(\| b - a \| < H^(1 - epsilon.alt)) K_(a b)⟩ lt.eq H^(z - tau epsilon.alt + o \( 1 \)) . $

The total average $chevron.l sum_(a \, b) K_(a b) chevron.r$ is $H^(z + o \( 1 \))$, uniformly under the size and depth assumptions above, by (10.1), (10.4), and the positive cosine comparison. Since $tau epsilon.alt > 0$, the small-gap contribution has a strictly smaller exponent. Hence

#[#set math.equation(numbering: n => "(12.5)")
 $ ⟨sum_(\| b - a \| gt.eq H^(1 - epsilon.alt)) K_(a b)⟩ = H^(z + o \( 1 \)) #h(2em) \( epsilon.alt > 0 upright(" fixed") \) . $ <c2:eq-separated-supply>]

The sums are over ordered endpoint pairs, and the average is over the same three independent offset windows as in (12.4).

== 13 Strip bridges: extension to two outer arms <c2:strips>

A bridge of height $R in \( 3 \/ 2 \) bb(Z)_(> 0)$ here is a SAW from a fixed port on one wall of an admissible strip to the other wall (i.e. a strip excursion crossing it). Its length $ell$ is again the number of vertices. We prove, with $d_(upright("mass")) = 1 + p + z = 4 \/ 3$,

#[#set math.equation(numbering: n => "(13.1)")
 $ M \( R \) := sum_(upright("bridges")) x^ell ell = R^(1 + z + o \( 1 \)) \, #h(2em) bb(E)_R \[ ell \] = M \( R \) \/ B \( R \) = R^(d_(upright("mass")) + o \( 1 \)) . $ <c2:eq-E1>]

Moreover the lower for $M \( R \)$ is achievable with lateral wandering at most $C R$. Use any forward normal $n in { plus.minus e_i }$; levels of the parallel cuts for each such direction form an arithmetic progression of spacing $3 \/ 2$ as in (2.1), and the half-plane or strip estimates with a port root apply by lattice symmetry. Lateral positions on the cuts live in equally spaced cosets; slopes/tube widths below use Euclidean distances.

=== 13.1 Straight tubes with fixed terminal ports <straight-tubes-with-fixed-terminal-ports>

Write $b_L \( a \, t \)$ for the fixed-end positive bridge mass across a strip of height $L$. We first have

#[#set math.equation(numbering: n => "(13.2)")
 $ sup_(a \, t) b_L \( a \, t \) lt.tilde L^(- 1 - p) \, #h(2em) sum_a \| b_L \( a \, t \) - b_L \( a' \, t \) \| lt.tilde L^(- 1 - p) $ <c2:eq-E2>]

for $a'$ the next bottom port. Indeed (8.1) for consecutive $a \, a'$ and fixed top $t$, with vacancies 0,1 and its coefficient table, gives $b_L \( a \, t \) - b_L \( a' \, t \) = T_1 - T_0$ (losses $R_0 \, L_1$ full). Each $T_j$ summed over $a$ counts adjacent-root pairs with one given top endpoint, costing $sum_k f_(1 \, k)$ in the notation there, bounded by (8.4). Summability then gives the supremum; by translation the variation bound holds as well in the top index with bottom fixed.

Total bridge mass from a fixed port wandering laterally more than $K L$ costs $O \( \( K L \)^(- p) \)$ for $K$ large. In fact cut the strip by two slants of the half-plane triangle exhaustion at distances comparable to $K L$ (to stay within the lateral limit). By (2.1) subtracting real parts in the full strip (using half-plane saturation and exhaustion as at (4.5)) and the truncated one, the lost through mass is at most the new slant exit mass. These side exits are a subset of those in the analogous half-plane truncation without the top, costing the claimed bound by the same comparison and the diameter tail there.

===== 13.1.1 A plateau of fixed-end masses. <a-plateau-of-fixed-end-masses.>

Consequently as a function of allowed endpoint displacement $b_L$ has a plateau of lateral width $gt.tilde L$ centered at some $u_L = O \( L \)$, where it is everywhere $gt.tilde L^(- 1 - p)$, and also such a plateau centered at $- u_L$ by reflection. Indeed order $L$ sites in a fixed tightness range reach a small absolute constant times $L^(- 1 - p)$, by the total lower and (13.2), and by the variation bound the number of clusters containing them separated by dips below half that threshold is bounded. Even requiring bridges to stay within lateral distance $K' L$ of their start we retain (say) half the plateau bound except at a set of at most an arbitrarily small fixed constant times $L$ sites in the plateau, by choosing a fixed large $K'$ via the same tightness bound.

#thm([Lemma 13.1.])[
  (Fixed-end bridges in a straight tube).  #emph[There is an absolute $delta > 0$ with the following property. For every fixed $eta > 0$ there are $c_eta > 0$ and $L_eta < oo$ such that, for admissible strip width $L gt.eq L_eta$ and prescribed initial and terminal ports with lateral offset at most $delta L$, the total critical bridge mass within lateral distance $eta L$ of their linear interpolation is at least $c_eta L^(- 1 - p)$, where $p = 1 \/ 4$.]
] <lem:pd:tube>

#proof[
  #strong[Constructing confined pieces.] Take $k$ subslabs with an intermediate cut at each junction, varying each independently in small fixed-proportion windows so that the spans $l_i$ stay comparable to $L \/ k$ by absolute factors. Choose signs for the plateau centers $u_(l_i)$ greedily so their partial signed sums have magnitude $lt.eq max \| u_(l_i) \|$. Correct each of these proposed step displacements by $l_i \/ L$ times the residual required for the final offset. For sufficiently small $delta$ and large $k$ this stays centrally in each plateau, and the new partial positions are within $O \( L \/ k \)$ of interpolation.
  Vary intermediate positions about these targets over allowed sites in windows of width $c L \/ k$, for sufficiently small fixed $c > 0$, keeping all differences in the plateaus. A positive fraction (depending on fixed $k$) of the $asymp_k L^(k - 1)$ choices use only good differences for confinement at $K' l_i$: given a previous site at most a small fixed fraction of the next window fails if $K'$ was chosen sufficiently large #emph[before] choosing $k$; at the last intermediate window omit also the small fraction failing connection to the prescribed final endpoint (goodness depends on displacement by translation). Now $k$ can be taken large enough relative to $K' \, eta^(- 1)$ for the concatenations to satisfy the tube constraint.
  ===== 13.1.2 Counting representations. <counting-representations.>
  A cut vector $upright(bold(c))$ specifies the $k - 1$ intermediate normal levels. For a path $xi$, let $m \( xi \)$ count the cut vectors for which it is produced by the preceding construction. Its intermediate ports are then recovered as the unique crossings of those cuts; they are not additional choices in $m$.
  For each cut vector the raw mass assembled is $gt.tilde_k L^(- 1 - k p)$. Designated seams are crossed only once, so these are simple bridges and the cuts determine each decomposition.
  ===== 13.1.3 Recovering a path from two cut vectors. <recovering-a-path-from-two-cut-vectors.>
  A bridge counted for two cut vectors splits at all their cuts into $k$ main slab bridges across normal distances comparable to $L$ (fixed $k$) and bridges in the intervening gaps of widths $Delta_i$ (none needed at a coincidence). The joint mass is at most $C_k L^(- 1 - k p) product_i \( 1 + Delta_i \)^(- p)$ by (13.2) on one main interval to absorb the total displacement constraint (sum the others from the two ends), using $B$ on the rest. For each pair of cut windows,
  $ sum_(c \, c') \( 1 + \| c - c' \| \)^(- p) = O_k \( L^(2 - p) \) . $
  There are $k - 1$ such windows. Thus
  $ sum_xi w_xi m \( xi \) & gt.eq c_k L^(- 1 - k p + k - 1) \,\
sum_xi w_xi m \( xi \)^2 & lt.eq C_k L^(- 1 - k p + \( 2 - p \) \( k - 1 \)) . $
  The quotient in (11.2) has exponent $2 \( - 1 - k p + k - 1 \) - \[ - 1 - k p + \( 2 - p \) \( k - 1 \) \] = - 1 - p$, proving the lemma. ◻
]

=== 13.2 A tube that widens from the endpoint scale <a-tube-that-widens-from-the-endpoint-scale>

Two exterior arms may start only a sublinear distance apart. Their first tubes must therefore be narrow at the initial ports and widen as the arms separate. We use an expanding first tube, of allowed width $eta \( g + y \)$ about the interpolation at normal depth $0 lt.eq y lt.eq L$, with $L asymp R \, med g = R^(1 - epsilon.alt)$ ($epsilon.alt in \( 0 \, 1 \/ 2 \)$ fixed and $R$ large), endpoint offset at most $delta L \/ 2$. Its fixed-end bridge mass is at least $R^(- 1 - p - O \( epsilon.alt \))$, where the loss exponent constant may depend on the tube parameters fixed independently of $epsilon.alt$.

===== 13.2.1 Geometric slabs. <geometric-slabs.>

Subdivide at geometric scales into $k = O \( 1 + log \( L \/ g \) \)$ slabs with spans comparable to nominal sizes $l_i$ increasing from scale $g$ by factors of order two to scale $L$ (e.g. interior depths $2^j g \, med j gt.eq 0 \, med 2^j g lt.eq L \/ 2$). Thus successive sizes are comparable by absolute factors. Vary the interior cuts at tops of slabs $i < k$ in small windows of lengths comparable to $l_i$, and the endpoints there in small windows on the same scales about the interpolation. Take the endpoint-window proportions small enough that each fixed-end slab has slope of magnitude at most $delta$; since $l_i asymp g + y$ at depths in that slab, taking them and the sub-tube widths sufficiently small allows the preceding ordinary straight-tube estimate while satisfying the desired growing width throughout. All scales tend to infinity and constants are uniform. The mass per cut vector is then $gt.eq c^k L^(- 1) product_i l_i^(- p)$, including the counts of intermediate positions.

===== 13.2.2 The cost of varying the cuts. <the-cost-of-varying-the-cuts.>

For two vectors the common paths split as in the straight-tube proof, with mass $lt.eq C^k L^(- 1) product_i l_i^(- p) product_(i < k) \( 1 + Delta_i \)^(- p)$ (use the supremum bound on a scale-$L$ main interval). Each summed gap pair costs $O \( l_i^(2 - p) \)$, and the number of single vectors is $gt.eq c^k product_(i < k) l_i$. In the quotient of (11.2), the factors from the $k - 1$ variable cuts cancel all $l_i^(- p)$ except the final one, whose scale is $L$. The result is at least $c_1^k L^(- 1 - p)$. Since $k lt.eq C_1 + C_2 log \( L \/ g \) = O \( 1 \) + O \( epsilon.alt log R \)$, this is $R^(- 1 - p - O \( epsilon.alt \))$. All constants here depend on the fixed tube geometry, while $epsilon.alt$ affects only the number of scales.

=== 13.3 Sewing through bends <sewing-through-bends>

We describe the sewing estimate for the simple polygonal routes below. A route starts at a port on a cut, ends at a prescribed port (to within a window for its selection) on another cut, and has a bounded number $j lt.eq 2$ of macroscopic bends. Nominal straight piece lengths are comparable to $R$, in successive normal directions changing by $+ 60^compose$ or $- 60^compose$ (the first piece may instead be tilted by a sufficiently small fixed slope about its designated normal). The endpoint cuts are normal to the designated first and last directions, respectively. The centerline is simple with different bends away from each other, endpoints and nonincident pieces, and nonconsecutive pieces apart, all with fixed macroscopic clearance. We connect in arbitrarily narrow fixed-proportion neighborhoods, with the initial tube opening from scale $g$. In particular the first bridge leaves the starting cut and stays on its strictly forward side until the first bend. The ending port can vary over a sufficiently small window of width comparable to $R$ about the nominal endpoint, still counting mass per fixed choice here.

===== 13.3.1 Supplying the pieces. <supplying-the-pieces.>

Insert small admissible equilateral triangles near the bend vertices with face outward normals for entry and exit $- n_(upright("prev")) \, + n_(upright("next"))$, at angle $120^compose$. Take side distances from the bend of a tiny fixed order $h R$, then vary the locations of both used faces independently in tiny macroscopic windows (sizes also small relative to $h R$). Within each triangle the total mass of chords connecting the two specified faces, with both ports trimmed away from corners by a small fixed fraction of face length, is $gt.tilde R^alpha$, $alpha = 1 - p$, as in the proof of (12.3) by different-side comparison and cyclic symmetry (valid for either triangle orientation). Connect intervening gaps in the route by fixed-end normal-slab bridges using narrow tubes as above (the expanding one for the first). Indeed each slab’s lateral offset comes from the nominal line (possible small first tilt), terminal window and deviations of ports of size $O \( h R \)$, allowing small slopes. We can take $h$ and the terminal window sufficiently tiny before choosing tube widths. In the first segment the bend-port shift (or terminal shift if $j = 0$) changes the slope from the prescribed one by an arbitrarily small amount, so the growing tube stays within arbitrarily small fixed multiples of $g + y$ about the intended ray, up to the bend (or terminal). Thus per bend-cut vector the product mass is at least

$ R^(- 1 - p - 2 j p - O \( epsilon.alt \)) $

by $j$ triangle masses and $j + 1$ straight estimates.

===== 13.3.2 Disjointness and localization of all possible seams. <disjointness-and-localization-of-all-possible-seams.>

Here the constituent paths concatenate disjointly. The bridges incident to a bend are on the outside of its respective cuts; moreover each stays away from the other used face’s possible seam ports (trimmed and with small cut windows), on the strictly interior side of that face’s supporting lines near and along the bridge. Indeed a trimmed incident port has such a margin already of fixed proportional order, and the ray heading back or onward away from the triangle moves deeper relative to the other face (dot product of the two outward normals $- 1 \/ 2$, robust to small slopes); take tube widths sufficiently small relative to the margins. Thus the two incident bridges are also apart. Nonincident pieces stay away by the macroscopic layout. In particular for any path representation only the appropriate incident straight bridge and that bend’s chord can visit the possible entry seam ports of the bend (across all its varying cuts); similarly for exit ports. For fixed cuts the designated crossings among such ports are unique.

===== 13.3.3 Comparing two representations. <comparing-two-representations.>

For two bend-cut vectors representing the same path, the more exterior entry-line crossing at a bend occurs before the inner one if different: it must lie on the incoming bridge under the other representation by the localization just given, and conversely the inner crossing on the other bend chord (coincident cuts give a single crossing). The exit comparison is reversed. Every entry here is before every exit even across representations by the same localization. Thus the segment between latest entry and earliest exit is a chord in the intersection triangle, between the two specified sides, cost $O \( R^alpha \)$ with endpoints summed as in (12.3). Segments between the compared crossings are bridges in the parallel gap strips (part of one straight bridge and the other chord, hence between the cuts), cost $O \( \( 1 + Delta \)^(- p) \)$ with inner port given. Across consecutive bends the latest exit is before the earliest next entry (under the representation with that exit the other entry is on the connecting bridge or the next chord). Remaining segments between exterior cuts are therefore fixed-end strip bridges, lying on the shared straight portions, costing $O \( R^(- 1 - p) \)$ each by (13.2) after gap bridges have fixed their ports (including first and last pieces here). This decomposition contains $j$ common bend chords, $j + 1$ fixed-end straight pieces, and $2 j$ possible gap bridges. Its mass is at most

$ C underbrace(R^(j \( 1 - p \)), upright("bend chords")) underbrace(R^(- \( j + 1 \) \( 1 + p \)), upright("straight pieces")) product_(h = 1)^(2 j) \( 1 + Delta_h \)^(- p) = C R^(- 1 - p - 2 j p) product_(h = 1)^(2 j) \( 1 + Delta_h \)^(- p) . $

Let $m$ count the valid bend-cut vectors. There are order $R^(2 j)$ single vectors, while each paired window contributes $O \( R^(2 - p) \)$. Consequently the first moment is at least $R^(- 1 - p - 2 j p + 2 j - O \( epsilon.alt \))$, and the second at most $C R^(- 1 - p - 2 j p + 2 j \( 2 - p \))$. Equation (11.2) gives distinct mass $R^(- 1 - p - O \( epsilon.alt \))$ per fixed endpoint. When $j = 0$, the widening-tube estimate already gives this conclusion.

=== 13.4 Two exterior arms from a marked chord <two-exterior-arms-from-a-marked-chord>

Take central triangles $D$ as in (12.5) with $d_i in \[ c R \, 2 c R \]$ for outward normals $e_i$, $c > 0$ a sufficiently small absolute constant, and $v$ any vertex in $\| v \| lt.eq c R \/ 2$. Keep ordered chords through $v$ with endpoint gap $gt.eq g$. Apply (12.5) with $epsilon.alt \/ 2$ in place of $epsilon.alt$. Since $H asymp R$, for all sufficiently large $R$ the retained gap $H^(1 - epsilon.alt \/ 2)$ is at least $R^(1 - epsilon.alt) = g$. The offset windows contain $asymp R^3$ triples, so their summed mass is at least $R^(3 + z - o \( 1 \))$. Pigeonhole to keep a constant fraction using one starting side $A$ and ending side $B$ (if same side, also fix their ordering along it).

Here are explicit layouts for the two arms, described outwards from the two central ports. Use a target strip in direction $m$, levels $s_(-) \, s_(+)$ with $s_(+) - s_(-) = R$ and midpoint bounded, chosen once on the grid. Each terminal port ranges in a tiny proportional window on its strip wall (the same estimate for every choice). All routes including bends are inside that strip up to exit and within $O \( R \)$ of zero.

===== 13.4.1 Different incident sides. <different-incident-sides.>

If $A eq.not B$, write $n = e_A \, med m = e_B$. From the $B$ port take the ray $+ m$ to the upper wall. From the $A$ port take the ray $+ n$ for $R \/ 4$, then bend to $- m$ to the lower wall ($n dot.op m = - 1 \/ 2$).

===== 13.4.2 The same incident side. <the-same-incident-side.>

If $A = B$, write $n = e_A \, med t$ its counterclockwise perpendicular unit vector, $m = n \/ 2 + \( sqrt(3) \/ 2 \) t \, med n_(-) = n \/ 2 - \( sqrt(3) \/ 2 \) t$. Order ports left to right by $t$-coordinate, reversing the marked chord if necessary. Take initial rays $n - kappa t \, med n + kappa t$ respectively, to forward depth $R \/ 8$ along $n$, for sufficiently small fixed $kappa > 0$. Bend the right one to $+ m$ to the upper wall. Bend the left one to $n_(-)$ until $m$-coordinate $s_(-) + R \/ 8$, then bend to $- m$ to the lower wall.

Figure 3 records the two layouts. The central chord is retained, while the added arms occupy disjoint exterior neighborhoods; the bends are the locations where the preceding triangle sewing is used.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1.288, -1.624), (1.96, -1.624), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round"))
  line((-1.288, 1.848), (1.96, 1.848), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round"))
  line((-0.616, -0.3584), (0.616, -0.3584), (0, 0.7056), close: true, fill: rgb("#f5f5f5"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((-0.0336, 0.28), [$D$])
  bezier((5.6, 0.2733), (-0.0336, -0.1344), (0.224, 0.0112), (-0.1344, 0.0224), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round"))
  bezier((-0.0336, -0.1344), (6.048, 0.2733), (0.0336, -0.2016), (0.0784, -0.28), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((-0.0336, -0.1344), radius: 0.04939, fill: black, stroke: none)
  line((-0.9296, -0.056), (-0.0336, -0.1344), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"))
  content((-1.008, -0.0336), [$v$], anchor: "east", padding: 0.1176cm)
  line((6.048, 0.2733), (0.0896, -1.624), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((5.6, 0.2733), (1.254, 0.5824), (1.254, 1.848), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  circle((5.6, 0.2733), radius: 0.05292, fill: black, stroke: none)
  line((0.728, -0.112), (5.6, 0.2733), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"))
  content((0.8064, -0.1456), [$a$], anchor: "west", padding: 0.1176cm)
  circle((6.048, 0.2733), radius: 0.05292, fill: black, stroke: none)
  line((-0.1568, -0.6608), (6.048, 0.2733), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"))
  content((-0.224, -0.728), [$b$], anchor: "east", padding: 0.1176cm)
  content((0.336, -2.072), [Different sides])
  content((1.322, 1.512), [$-m$], anchor: "west", padding: 0.1176cm)
  content((0.112, -1.176), [$m$], anchor: "west", padding: 0.1176cm)
  content((0.896, 0.224), [$n$], anchor: "west", padding: 0.1176cm)
  line((3.476, -1.578), (4.372, -0.02598), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round"))
  line((6.89, -2.011), (7.965, -0.1487), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round"))
  line((5.331, 0.2733), (6.317, 0.2733), (5.824, 1.124), close: true, fill: rgb("#f5f5f5"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((5.824, 1.214), [$D$], anchor: "south", padding: 0.1176cm)
  bezier((5.6, 0.2733), (5.824, 0.5421), (5.636, 0.4973), (5.734, 0.5869), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round"))
  bezier((5.824, 0.5421), (6.048, 0.2733), (5.932, 0.5958), (6.021, 0.4883), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, cap: "round", join: "round"))
  circle((5.824, 0.5421), radius: 0.04939, fill: black, stroke: none)
  line((5.824, 0.7213), (5.824, 0.5421), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"))
  content((5.824, 0.8467), [$v$])
  line((5.6, 0.2733), (5.475, -0.3539), (4.31, -1.026), (3.924, -0.8019), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((6.048, 0.2733), (6.173, -0.3539), (7.428, -1.08), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  circle((5.6, 0.2733), radius: 0.05292, fill: black, stroke: none)
  line((5.268, 0.112), (5.6, 0.2733), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"))
  content((5.197, 0.09408), [$a$], anchor: "east", padding: 0.1176cm)
  circle((6.048, 0.2733), radius: 0.05292, fill: black, stroke: none)
  line((6.38, 0.112), (6.048, 0.2733), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"))
  content((6.451, 0.09408), [$b$], anchor: "west", padding: 0.1176cm)
  content((5.824, -2.038), [Same side])
  content((6.684, -0.4883), [$m$])
  content((4.677, -0.3718), [$n_-$])
  content((3.942, -1.214), [$-m$])
})],
  caption: [Figure 3: Exterior-arm layouts, schematically. The red chord visits the marked vertex inside the central triangle. Blue routes leave its incident sides into the exterior and reach opposite strip walls. Different sides require at most one bend on one arm; equal sides use separating initial rays and at most two bends. Actual walks occupy narrow neighborhoods of these routes, with widening first tubes at separated ports. ],
) <fig:exterior-arms>

In the first layout put $d = a - b$, where $a \, b$ are the $A \, B$ ports. Since $n dot.op d gt.eq 0$, $m dot.op d lt.eq 0$, and $n dot.op m = - 1 \/ 2$, the initial rays satisfy

$ \| d + y n - t' m \|^2 gt.eq \| d \|^2 + y^2 + \( t' \)^2 + y t' #h(2em) \( y \, t' gt.eq 0 \) . $

Their separation is therefore at least a constant times $g + y + t'$. The later $A$-arm has macroscopic separation in $n$-projection from the $B$-ray and from the central $A$ line, towards its exterior. In the second layout the initial separation in $t$-projection is at least $g + kappa \( y + t' \)$; thereafter there is macroscopic separation in this projection, with the two arms continuing away from each other (also each later piece is apart from the opposite initial piece). Both beyond their first rays stay macroscopically to the exterior of the $A$ line: the long $n_(-)$ piece moves farther out. The first bend already has normal depth $R \/ 8$ outside that line, and the final length $R \/ 8$ toward $- m$ reduces that depth by only $R \/ 16$. Thus a margin of at least $R \/ 16$ remains. The left arm’s nonconsecutive pieces are apart in $t$-projection. Thus these are uniformly simple routes of the bend type just discussed, with target-wall clearance except at the respective aligned terminal pieces, and we can ensure for the actual paths that each arm stays strictly outside its incident central line and the two are disjoint. Indeed first straight bridges remain strictly exterior to their starting line and opening widths and slope deviations can be made arbitrarily small relative to the displayed initial separation; tiny fixed-proportion bend and tube neighborhoods suffice afterwards. Nominal depths/lengths are comparable to $R$, with $c$ small as stipulated, and all subsequent parameter choices for the sewing estimates can be uniform over the central locations and independent of $epsilon.alt$.

===== 13.4.3 Normalizing an arm using only its own initial port. <normalizing-an-arm-using-only-its-own-initial-port.>

Fix the ordered side pair, the target strip, and each arm’s role once and for all. In the equal-side case these roles are left and right along $t$; otherwise they are the $A$ and $B$ sides. For a fixed triangle $D$ and role, the route and its permitted narrow neighborhoods depend only on that arm’s own starting port $a$. The second port is needed only to verify the separation of the two already chosen neighborhoods. All tube widths, bend sizes and terminal windows are chosen uniformly in the allowed ports and independently of $epsilon.alt$.

Let $Q_(D \, upright("role")) \( a \)$ be the mass of this one-arm family, with its terminal port summed over the fixed target window. The bend estimates give $Q_(D \, upright("role")) \( a \) gt.eq R^(- p - K_(upright("loss")) epsilon.alt)$ for a uniform $K_(upright("loss"))$ and large $R$. Multiply every weight in this family by

$ lambda_(D \, upright("role")) \( a \) = frac(R^(- p - K_(upright("loss")) epsilon.alt), Q_(D \, upright("role")) \( a \)) lt.eq 1 . $

Its thinned total mass is exactly $R^(- p - K_(upright("loss")) epsilon.alt)$. In particular, this scalar does not depend on the other endpoint of the central chord. Concatenating with the chord gives bridges through $v$; the central interval is uniquely determined given the triangle by the interior condition and the exterior arm constraints. Over full distinct bridges visiting $v$ write $m_D$ for the product of thinning factors when represented for that triple, zero otherwise. Thus

$ sum_xi w_xi sum_D m_D \( xi \) med gt.eq med R^(3 + z - o \( 1 \) - 2 p - 2 K_(upright("loss")) epsilon.alt) . $

===== 13.4.4 The two-representation decomposition. <the-two-representation-decomposition.>

For two offset triples representing the same bridge the central intervals both contain $v$ (visited only once). Entry at the more exterior $A$ line precedes entry at the inner one if distinct (both before $v$, and the former point cannot be inside the other chord); likewise exits in reverse order at side $B$. Equal entry or exit offsets give the same corresponding crossing. Overlap between inner crossings is a marked excursion of the intersection triangle, total mass $lt.eq R^(z + o \( 1 \))$. Segments between crossings at offset gaps $Delta_A \, Delta_B$ are strip bridges (within the more exterior chord and the other extension which stays strictly outside its central wall), costing the corresponding $O \( \( 1 + Delta \)^(- p) \)$ given inner ports. Remaining segments are full arms for the respective exterior-crossing representations. For this second-moment estimate the pair $D \, D'$ is fixed. Select the representation with the exterior entry crossing and the one with the exterior exit crossing, making a fixed choice at a tie. These known representation labels, roles and recovered own initial ports fix the two arm families and their thinning factors. The two selections may come from different offset triples. Retain these two factors from $m_D m_(D')$, and drop the unused factors, which are at most one. Each recovered full arm then costs at most $R^(- p)$, by its prescribed thinned total mass.

Figure 4 shows a mixed ordering when $A eq.not B$. It records order along the path; the preceding localization argument is what makes the marked interval a chord in the intersection triangle. When $A = B$, the offset order is the same at entry and exit, so one triangle supplies both exterior arms. The decomposition still has two possible gap bridges, now with the same normal width.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (1.9, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  line((1.9, 0), (3.7, 0), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  line((3.7, 0), (7.3, 0), stroke: (paint: rgb("#b20000"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  line((7.3, 0), (9.1, 0), stroke: (paint: rgb("#bf6000"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  line((9.1, 0), (11, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", miter-limit: 10), mark: (end: ">"))
  line((1.9, 0.17), (1.9, -1.4), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  line((3.7, 0.17), (3.7, -1.4), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  line((7.3, 0.17), (7.3, -1.4), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  line((9.1, 0.17), (9.1, -1.4), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  circle((5.5, 0), radius: 0.05644, fill: black, stroke: none)
  content((5.5, 0.08), [$v$], anchor: "south", padding: 0.1176cm)
  content((0.85, 0.35), [arm from $D$], anchor: "south", padding: 0.1176cm)
  content((2.8, 0.35), [gap $Delta_A$], anchor: "south", padding: 0.1176cm)
  content((5.5, 0.7), [common marked chord], anchor: "south", padding: 0.1176cm)
  content((8.2, 0.35), [gap $Delta_B$], anchor: "south", padding: 0.1176cm)
  content((10.15, 0.35), [arm from $D'$], anchor: "south", padding: 0.1176cm)
  content((1.9, -0.05), [$a_D$], anchor: "north", padding: 0.1176cm)
  content((3.7, -0.05), [$a_(D')$], anchor: "north", padding: 0.1176cm)
  content((7.3, -0.05), [$b_D$], anchor: "north", padding: 0.1176cm)
  content((9.1, -0.05), [$b_(D')$], anchor: "north", padding: 0.1176cm)
  line((1.9, -0.67), (1.9, -0.8), (7.3, -0.8), (7.3, -0.67), stroke: (paint: rgb("#a0a0a0"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  content((5.3, -0.8), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[chord in $D$]])])
  line((3.7, -1.17), (3.7, -1.3), (9.1, -1.3), (9.1, -1.17), stroke: (paint: rgb("#a0a0a0"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  content((6.5, -1.3), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[chord in $D'$]])])
  content((5.5, -1.85), [#text(size: 9pt)[Order along one path; spatial geometry is not shown.]])
})],
  caption: [Figure 4: Two representations of one bridge, shown in path order. In this mixed ordering the exterior entry comes from $D$ and the exterior exit from $D'$. The inner crossings delimit the marked chord in $D ∩ D'$; the adjacent pieces cross the two parallel cut gaps. The remaining ends are complete arms from the indicated representations. The drawing asserts no spatial monotonicity of the path. ],
) <fig:recoverable-cuts>

The joint second moment bound is

$ sum_xi w_xi #scale(x: 120%, y: 120%)[\(] sum_D m_D \( xi \) #scale(x: 120%, y: 120%)[\)]^2 lt.eq R^(6 + z + o \( 1 \) - 4 p) . $

Here is the offset sum in both cases. If $A eq.not B$, the two used side offsets vary independently and each has

$ sum_(d \, d') \( 1 + \| d - d' \| \)^(- p) = O \( R^(2 - p) \) . $

The unused side gives $O \( R^2 \)$ further pairs. If $A = B$, the two gaps coincide, and instead

$ sum_(d \, d') \( 1 + \| d - d' \| \)^(- 2 p) = O \( R^(2 - 2 p) \) \, $

while the other two side offsets give $O \( R^4 \)$ pairs. The latter sum uses $2 p < 1$. Thus in either case the offset sum is $O \( R^(6 - 2 p) \)$. The marked chord and the two normalized exterior arms supply the remaining factor $R^(z - 2 p + o \( 1 \))$, proving the second-moment bound.

Apply (11.2) to obtain distinct bridge mass through $v$ at least $R^(z - 4 K_(upright("loss")) epsilon.alt - o \( 1 \))$. Sum this for $asymp R^2$ vertices $v$, with only boundedly many oriented strip choices and $O \( R \)$ starting ports total; use lattice symmetry to translate to standard strip bridges from a fixed port. This proves the confined length-sum lower of (13.1), since $epsilon.alt$ was arbitrary. The constant $K_(upright("loss"))$ affects only the exponent. The corridor width was fixed by the layouts and tube widths independently of $epsilon.alt$, so letting $epsilon.alt arrow.b 0$ keeps one fixed corridor.

For the upper, in convex bounded truncations of the strip the positive mass of bridges through any vertex $v$, allowing all starts, is at most $C T_v$ by (2.1). Uniformly $T_v lt.eq R^(z + o \( 1 \))$ by (10.4): polygons around an incident face with dyadic diameter $L gt.eq R$ cost only $O \( R \/ L \)$ total mass in each such dyad, by Proposition 12 and at most $O \( R L \)$ translations per shape (normal translation strip-constrained, lateral shift limited by enclosure). The large loops thus cost bounded partition factor and the others are in a ball of order $R$ for (10.1). Exhaust to count all finite bridges. To make the last translation count explicit, let $cal(F)_R$ be one set of vertex representatives in the strip modulo translation by $U$, and let $A_R \( v \)$ be the positive mass of bridges through $v$ with the bottom starting port also summed. Then

$ M \( R \) = sum_(v in cal(F)_R) A_R \( v \) \, #h(2em) \| cal(F)_R \| = O \( R \) . $

Indeed translate a bridge with one marked visited vertex so that its starting port is the fixed standard port. Conversely a bridge from that port, together with any one of its vertices, has a unique translate that places the marked vertex in $cal(F)_R$. All weights are preserved. The bound $A_R \( v \) lt.eq R^(z + o \( 1 \))$ therefore proves the upper bound in (13.1).

We can now assemble Theorem 1. The lateral tightness proved at the start of this section makes $B \( R \) - B_C \( R \)$ an arbitrarily small fixed fraction of $B \( R \)$ when the fixed constant $C$ is large. Together with the boundary estimate, this gives $B_C \( R \) asymp B \( R \) asymp R^(- 1 \/ 4)$. The two-arm construction gives the confined first-moment lower bound with a corridor constant independent of $epsilon.alt$; the preceding upper bound and $M_C \( R \) lt.eq M \( R \)$ give both $M_C \( R \) = R^(13 \/ 12 + o \( 1 \))$ and $M \( R \) = R^(13 \/ 12 + o \( 1 \))$. Dividing either first moment by its corresponding mass yields the mean exponent $13 \/ 12 + 1 \/ 4 = 4 \/ 3$.

#heading(level: 1)[References]
#bibitem([1])[N.~R.~Beaton, M.~Bousquet-Mélou, J.~de~Gier, H.~Duminil-Copin and A.~J.~Guttmann. The critical fugacity for surface adsorption of self-avoiding walks on the honeycomb lattice is $1 + sqrt(2)$. #emph[Communications in Mathematical Physics] #strong[326] (2014), 727--754. #link("https://doi.org/10.1007/s00220-014-1896-1")[doi:10.1007/s00220-014-1896-1].]
#bibitem([2])[P.~Di Francesco and P.~Zinn-Justin. Around the Razumov--Stroganov conjecture: proof of a multi-parameter sum rule. #emph[Electronic Journal of Combinatorics] #strong[12] (2005), Research Paper~6. #link("https://doi.org/10.37236/1903")[doi:10.37236/1903]. #link("https://arxiv.org/abs/math-ph/0410061")[arXiv:math-ph/0410061].]
#bibitem([3])[H.~Duminil-Copin and S.~Smirnov. The connective constant of the honeycomb lattice equals $sqrt(2 + sqrt(2))$. #emph[Annals of Mathematics] #strong[175] (2012), 1653--1665. #link("https://doi.org/10.4007/annals.2012.175.3.14")[doi:10.4007/annals.2012.175.3.14].]
#bibitem([4])[B.~Dyhr, M.~Gilbert, T.~Kennedy, G.~F.~Lawler and S.~Passon. The self-avoiding walk spanning a strip. #emph[Journal of Statistical Physics] #strong[144] (2011), 1--22. #link("https://doi.org/10.1007/s10955-011-0258-z")[doi:10.1007/s10955-011-0258-z]. #link("https://arxiv.org/abs/1008.4321")[arXiv:1008.4321].]
#bibitem([5])[I.~B. Frenkel, #emph[Representations of Kac--Moody algebras and dual resonance models], in #emph[Applications of Group Theory in Physics and Mathematical Physics] (Chicago, 1982), Lectures in Applied Mathematics #strong[21], American Mathematical Society, Providence, RI, 1985, 325--353. #link("https://cpb-us-w2.wpmucdn.com/campuspress.yale.edu/dist/2/3739/files/2021/06/frenkel_representations_kac_moody.pdf")[Author's copy].]
#bibitem([6])[I.~B. Frenkel and V.~G. Kac, #emph[Basic representations of affine Lie algebras and dual resonance models], Invent. Math. #strong[62] (1980), 23--66. #link("https://doi.org/10.1007/BF01391662")[doi:10.1007/BF01391662].]
#bibitem([7])[A.~Garbali and B.~Nienhuis. The dilute Temperley--Lieb $O \( n = 1 \)$ loop model on a semi infinite strip: the ground state. #emph[Journal of Statistical Mechanics: Theory and Experiment] (2017), 043108. #link("https://doi.org/10.1088/1742-5468/aa6a30")[doi:10.1088/1742-5468/aa6a30]. #link("https://arxiv.org/abs/1411.7020")[arXiv:1411.7020].]
#bibitem([8])[A.~Garbali and B.~Nienhuis. The dilute Temperley--Lieb $O \( n = 1 \)$ loop model on a semi infinite strip: the sum rule. #emph[Journal of Statistical Mechanics: Theory and Experiment] (2017), 053102. #link("https://doi.org/10.1088/1742-5468/aa6bc3")[doi:10.1088/1742-5468/aa6bc3]. #link("https://arxiv.org/abs/1411.7160")[arXiv:1411.7160].]
#bibitem([9])[A.~Glazman. Connective constant for a weighted self-avoiding walk on $bb(Z)^2$. #emph[Electronic Communications in Probability] #strong[20] (2015), no.~86, 1--13. #link("https://doi.org/10.1214/ECP.v20-3844")[doi:10.1214/ECP.v20-3844].]
#bibitem([10])[A.~Glazman and I.~Manolescu. Self-avoiding walk on $bb(Z)^2$ with Yang--Baxter weights: universality of critical fugacity and 2-point function. #emph[Annales de l'Institut Henri Poincaré, Probabilités et Statistiques] #strong[56] (2020), 2281--2300. #link("https://doi.org/10.1214/19-AIHP1024")[doi:10.1214/19-AIHP1024].]
#bibitem([11])[U.~Grimm and P.~A.~Pearce. Multi-colour braid--monoid algebras. #emph[Journal of Physics A: Mathematical and General] #strong[26] (1993), 7435. #link("https://doi.org/10.1088/0305-4470/26/24/018")[doi:10.1088/0305-4470/26/24/018]. #link("https://arxiv.org/abs/hep-th/9303161")[arXiv:hep-th/9303161].]
#bibitem([12])[J.~M.~Hammersley and D.~J.~A.~Welsh. Further results on the rate of convergence to the connective constant of the hypercubical lattice. #emph[Quarterly Journal of Mathematics] #strong[13] (1962), 108--110. #link("https://doi.org/10.1093/qmath/13.1.108")[doi:10.1093/qmath/13.1.108].]
#bibitem([13])[Y.~Ikhlef and J.~Cardy. Discretely holomorphic parafermions and integrable loop models. #emph[Journal of Physics A: Mathematical and Theoretical] #strong[42] (2009), 102001. #link("https://doi.org/10.1088/1751-8113/42/10/102001")[doi:10.1088/1751-8113/42/10/102001].]
#bibitem([14])[D.~Krachun and C.~Panagiotis. Quantitative sub-ballisticity of self-avoiding walk on the hexagonal lattice. #emph[Annals of Probability] #strong[54] (2026), 1109--1125. #link("https://doi.org/10.1214/24-AOP1730")[doi:10.1214/24-AOP1730].]
#bibitem([15])[A. Laptev and Yu. Safarov. Error estimate in the generalized Szegő theorem. #emph[Journées Équations aux Dérivées Partielles] (1991), article XV, 1--7. #link("https://doi.org/10.5802/jedp.417")[doi:10.5802/jedp.417].]
#bibitem([16])[G.~F.~Lawler, O.~Schramm and W.~Werner. On the scaling limit of planar self-avoiding walk. In #emph[Fractal geometry and applications: a jubilee of Benoît Mandelbrot], Part~2, Proceedings of Symposia in Pure Mathematics #strong[72], Part~2, American Mathematical Society, Providence, RI, 2004, 339--364. #link("https://arxiv.org/abs/math/0204277")[arXiv:math/0204277].]
#bibitem([17])[B.~Nienhuis. Exact critical point and critical exponents of $O \( n \)$ models in two dimensions. #emph[Physical Review Letters] #strong[49] (1982), 1062--1065. #link("https://doi.org/10.1103/PhysRevLett.49.1062")[doi:10.1103/PhysRevLett.49.1062].]
#bibitem([18])[NIST Digital Library of Mathematical Functions. Sections 18.19 and 18.23. #link("https://dlmf.nist.gov/18.19")\; #link("https://dlmf.nist.gov/18.23").]
#bibitem([19])[OpenAI. Polynomial vacuum representations and bridge mass for honeycomb walks. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Polynomial-vacuum-representations-and-bridge-mass-for-honeycomb-walks-September-26-2026/main.pdf")[OAI:Polynomial-vacuum-representations-and-bridge-mass-for-honeycomb-walks-September-26-2026], 2026.]
#bibitem([20])[G. Segal, #emph[Unitary representations of some infinite dimensional groups], Comm. Math. Phys. #strong[80] (1981), 301--342. #link("https://doi.org/10.1007/BF01208274")[doi:10.1007/BF01208274].]
#bibitem([21])[Y.~K.~Zhou and M.~T.~Batchelor. Critical behaviour of the dilute $O \( n \)$, Izergin--Korepin and dilute $A_L$ face models: Bulk properties. #emph[Nuclear Physics B] #strong[485] (1997), 646--664. #link("https://doi.org/10.1016/S0550-3213(96)00654-2")[doi:10.1016/S0550-3213(96)00654-2]. #link("https://arxiv.org/abs/cond-mat/9611156")[arXiv:cond-mat/9611156].]


