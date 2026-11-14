#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Failure of rational injectivity for maximal coarse assembly]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Coarse assembly relates the topology visible at bounded scales in a metric space to the indices of operators
  controlled by its large-scale geometry. Its rational injectivity asks whether a non-torsion topological class
  can have zero coarse index. We prove that this can occur even when the analytic target is the maximal Roe
  algebra and the space is a coarse disjoint union of finite graphs of bounded degree.

Let $Z$ be a uniformly discrete proper metric space of bounded geometry;
  thus every ball of a fixed radius contains a uniformly bounded number of points.
  Write $P_r \( Z \)$ for the Rips complex whose simplices are the finite subsets of diameter at most $r$, and set

$ "KX"_q \( Z \) = "inj lim"_(r arrow.r oo) "KK"_q \( C_0 \( P_r \( Z \) \) \, bb(C) \) . $

All K-theory and K-homology in this article are complex. On the ample module $H_Z =
  ell^2 \( Z \) ⊗ ell^2 \( bb(N) \)$, let $bb(C) \[ Z \]$ be the algebra of bounded, locally compact,
  finite-propagation operators. Local compactness means that $a T$ and $T a$ are compact for every $a in
  C_0 \( Z \)$, and finite propagation means that $T_(x y) =
  0$ whenever $d \( x \, y \)$ exceeds some fixed bound. In particular,
  the compact matrix entries of $T$ need not satisfy a uniform rank bound.
  The universal C\*-completion is the #emph[maximal Roe algebra] $C_max^(*) \( Z \)$.
  The canonical maximal coarse assembly map is

$ mu_Z^max : "KX"_q \( Z \) arrow.r K_q \( C_max^(*) \( Z \) \) . $

We recall the needed norm estimates and the index construction in Section 4.

A #emph[coarse disjoint union] of finite graphs is a metric on their disjoint union which restricts to the graph
  path metric on each component and for which only finitely many pairs of distinct components are within any fixed
  distance. We take such metrics to be uniformly discrete.

#thm([Theorem 1.1.])[
  #emph[There exist finite connected graphs $\( X_j \)_(j gt.eq 1)$ with a common finite bound on vertex degree,
    a coarse disjoint union $X = union.sq.big_(j gt.eq 1) X_j$,
    and an infinite-order class $alpha in "KX"_1 \( X \)$ such that
$ mu_X^max \( alpha \) = 0 . $

 Consequently, $mu_X^max ⊗ bb(Q)$ is not injective.]
] <thm:main>

The theorem strengthens the reduced coarse-assembly result proved in the companion paper [13].
  If $C^(*) \( X \)$ denotes the operator-norm closure of $bb(C) \[ X \]$,
  the canonical quotient $C_max^(*) \( X \) arrow.r C^(*) \( X \)$ carries the maximal index to the reduced index.
  Our class $alpha$ therefore also lies in the reduced assembly kernel.
  The stronger conclusion requires a proof in the universal norm:
  vanishing of a reduced index alone does not imply vanishing of its maximal lift.

=== 1.1 Context and prior work <context-and-prior-work>

Roe developed coarse cohomology and coarse index theory as tools for large-scale geometry and index-theoretic
  questions on noncompact manifolds [15]. Higson and Roe formulated and studied the coarse Baum–Connes conjecture
  in this framework [10]. The connection with Novikov-type questions is that injectivity retains the topological
  information carried by higher indices. The present theorem concerns the non-equivariant coarse assembly map
  displayed above.

Several fundamental positive results relate assembly to geometric control.
  Yu proved coarse assembly isomorphism for bounded-geometry spaces of finite asymptotic dimension [20]
  Theorem 7.1 and established the coarse Baum–Connes conjecture for bounded-geometry spaces admitting a uniform
  embedding into Hilbert space [21]. Skandalis, Tu, and Yu developed the coarse-groupoid approach and its relation
  to these embedding methods [17]. These results explain the importance of geometric hypotheses when seeking
  injectivity or isomorphism theorems.

Earlier failures of injectivity also show why bounded geometry and the domain of assembly matter.
  Yu constructed a coarse-assembly kernel class for a space without bounded geometry [20] Section 8,
  Proposition 8.1. Dranishnikov, Ferry, and Weinberger constructed integral index-kernel examples with locally
  finite K-homology as domain; their kernel classes disappear under coarsening [6] Section 6, Remark 6.2.
  Here the class belongs to the actual Rips colimit for a bounded-geometry graph union and remains nonzero after
  rationalization.

Finite quotients and expanding graphs also exposed limitations of general assembly assertions.
  Higson, Lafforgue, and Skandalis constructed counterexamples in group and groupoid settings and proved reduced
  coarse nonsurjectivity for certain unions of congruence Cayley graphs [9] Section 6.
  Nonsurjectivity is a different obstruction from the kernel in Theorem 1.
  Their separate Hausdorff-groupoid kernel construction combines an odd Bott class with a Kazhdan projection:
  a nonzero full-assembly image becomes zero after reduction [9] Section 5.
  This is a methodological predecessor, but its behavior also makes it essential to distinguish the two analytic
  targets.

The maximal Roe algebra and its assembly map were developed in work of Gong, Wang,
  and Yu [7] and Oyono-Oyono and Yu [14]; the latter analyzed maximal assembly for specific families of expanders
  arising from finite group quotients. Willett and Yu further studied higher indices for expanding and large-girth
  graph families [19]. Špakula and Willett proved that the maximal-to-reduced comparison induces a K-theory
  isomorphism for spaces admitting a coarse embedding into Hilbert space [18].
  Chen, Wang, and Yu proved the maximal coarse Baum–Connes conjecture under the more general hypothesis of a
  fibred coarse embedding into Hilbert space [4]. More recent injectivity results concern finite-group extensions
  whose kernel and quotient families admit such fibred embeddings [5];
  maximal isomorphism results also hold for coarse fibrations with uniformly property-A fibers,
  a fibred-coarsely-embeddable base, and uniform coarse equivalences between fibers and preimages of fixed-radius
  balls [8]. Finite fibers alone do not supply these uniform hypotheses.
  Theorem 1 shows that rational injectivity cannot hold for all bounded-geometry graph unions without further
  assumptions.

Our analytic tools belong to this established maximal-index framework.
  We give the norm and functoriality arguments needed here,
  with particular attention to the points where the universal and operator norms must be distinguished;
  see also [14,18,16]. Kazhdan’s property (T) [12,2] supplies averaging in the full group C\*-algebra.
  The topological part uses integral line-bundle classification, the K-theory of projective spaces,
  and the standard K-homology pairing [1,3,11].

=== 1.2 The construction and the proof <the-construction-and-the-proof>

The base graphs are three-dimensional discrete tori $B_j$ whose side lengths tend to infinity.
  Over each $B_j$ we place a finite quotient of $"SL"_3 \( bb(Z) \)$,
  obtaining a graph $Y_j$ with Cayley edges inside the fibers.
  Transport around the first two base circles is given by commuting elements of that quotient.
  These elements cease to commute at a higher congruence level.
  The graph $X_j$ joins two copies of $B_j$ through $Y_j$: its middle has a long product collar,
  and toward either end the fiber quotients are reduced one level at a time until they become trivial.
  This keeps all vertex degrees bounded. Section 2 gives the construction.

Write $B = union.sq.big_j B_j$, $Y = union.sq.big_j Y_j$, and let

$ f : Y arrow.r B \, wide i_plus.minus : B arrow.r X $

be the middle projection and the two end inclusions. A torus K-homology class on each component defines a single
  class $beta in "KX"_1 \( B \)$. The class of interest is

$ alpha = \( i_(+) \)_(*) beta - \( i_(-) \)_(*) beta . $

Its persistence and its zero index come from different features of the middle projection.

For persistence, take a line bundle $cal(L)$ on each continuous base torus,
  with first Chern class the product of the first two circle classes.
  Its reduced K-theory class, multiplied by the third circle’s odd class,
  pairs to one with the chosen K-homology class. At every fixed Rips scale,
  the lifted commutator calculation shows that the pullback of $cal(L)$ to the middle admits a $2^j$-th root for
  all sufficiently large $j$. A uniform dimension bound for the Rips complexes converts these roots into
  divisibility by a growing power of two in integral K-theory.
  Mayer–Vietoris then prevents any fixed nonzero multiple of the endpoint difference from vanishing.
  Section 3 makes this argument before taking either the scale colimit or rational coefficients.

For the index, projection from the middle induces a surjection

$ f_(*) : K_1 \( C_max^(*) \( Y \) \) arrow.r K_1 \( C_max^(*) \( B \) \) . $

To construct a splitting, we transport each base matrix entry horizontally between the fibers and then apply the
  Kazhdan projection onto the constant vectors in each fiber.
  The transport lift need not preserve products; averaging makes it multiplicative,
  and projecting the resulting homomorphism back to the base induces the identity on K-theory.
  Section 5 proves these identities in the maximal completion using two controls from Section 4:
  agreement of maximal and operator norms on finite vertex supports, and uniform norm estimates at fixed propagation.

Finally, Section 6 shows that the two composites $\( i_(+) \)_(*) f_(*)$ and $\( i_(-) \)_(*)
  f_(*)$ agree on analytic $K_1$. The end maps are not uniformly close: their separation grows with $j$.
  Instead, we place orthogonal copies of an operator at every height and rotate these copies simultaneously by one
  vertical step. After cancelling the common interior copies, the endpoint maps agree modulo compact operators,
  and injectivity of $K_1 \( C_max^(*) \( X \) \) arrow.r K_1 \( C_max^(*) \( X \) \/ cal(K) \)$ removes that
  quotient. Surjectivity of $f_(*)$ and naturality of assembly then give the zero index.

== 2 Congruence fibers over discrete tori <sec:geometry>

We construct a graph with two torus ends and a long central region of constant fiber size.
  The fiber quotient changes one congruence level at a time outside this region.
  These gradual changes keep the degrees bounded, while the long central region will isolate the topological
  obstruction at any fixed Rips scale.

=== 2.1 The finite quotients and their twists <the-finite-quotients-and-their-twists>

Fix a finite symmetric generating set $S$ of $Gamma = "SL"_3 \( bb(Z) \)$.
  We use Kazhdan’s theorem that $Gamma$ has property (T) [12,2].
  For $k gt.eq 1$, let $Q_k$ be the image of $Gamma$ under entrywise reduction modulo $2^k$, and put $Q_0 =
  { 1 }$. The natural reduction maps will always be denoted by their source and target.

#thm([Lemma 2.1.])[
  #emph[The maps $Q_(k + 1) arrow.r Q_k$ are surjective and have kernels of size at most $2^9$.
    For every fixed word radius $R$, the reduction $Gamma arrow.r
    Q_k$ is injective on the $S$-word ball of radius $R$ for all sufficiently large $k$.]
] <geom:quotients>

#proof[
  Surjectivity follows from the definition as images of the same group.
    For $k gt.eq 1$, each matrix modulo $2^k$ has at most $2^9$ entrywise lifts modulo $2^(k + 1)$.
    For $k = 0$, the same bound follows by counting all binary $3 times 3$ matrices.
    Finally, a word ball is a finite set of integral matrices.
    If two of its elements differ, some difference of entries is a nonzero integer and is not divisible by
    arbitrarily large powers of two. Taking the maximum of the finitely many required levels proves injectivity. ◻
]

For each $j gt.eq 1$, set

#[#set math.equation(numbering: n => "(2.1)")
 $ m_j = 2^j \, wide l_j = 100 \( j + 1 \) \, wide U_j = 1 + m_j E_12 \, wide V_j = 1 + m_j E_23 \, $ <geom:parameters>]

where $E_(a b)$ denotes a matrix unit. A direct multiplication gives

#[#set math.equation(numbering: n => "(2.2)")
 $ U_j V_j U_j^(- 1) V_j^(- 1) = 1 + m_j^2 E_13 . $ <geom:commutator>]

Thus $U_j$ and $V_j$ commute in $Q_(2 j)$ and in every lower quotient,
  although their commutator remains visible in $Q_(3 j)$. This difference between the two levels is the source of
  the divisibility argument in Section 3.

Let $B_j = \( bb(Z) \/ l_j bb(Z) \)^3$ with its axis-neighbor graph.
  Represent each coordinate by an integer in ${ 0 \, dots.h \, l_j - 1 }$.
  An oriented edge has signed seam numbers $\( a \, b \, c \) in bb(Z)^3$:
  a positive step from $l_j - 1$ to $0$ contributes $1$ in that coordinate, a reverse step contributes $- 1$,
  and all other contributions vanish. Equivalently, the unit displacement along the edge is the difference of the
  chosen representatives plus $l_j \( a \, b \, c \)$. For $0 lt.eq k lt.eq 2 j$, define

#[#set math.equation(numbering: n => "(2.3)")
 $ g_(j \, k) \( a \, b \) = V_j^b U_j^a med \( mod med 2^k \) in Q_k \, $ <geom:transport>]

with the evident interpretation in $Q_0$. Only the first two circle coordinates will twist the fibers.

The graph $Y_(j \, k)$ has vertex set $B_j times Q_k$. Its edges are of two types:

- over a fixed $u in B_j$, connect $\( u \, q \)$ to $\( u \, s q \)$ for $s in S$;
- for an oriented base edge $u arrow.r v$ with seam numbers $\( a \, b \, c \)$,
  connect $\( u \, q \)$ to $\( v \, q g_(j \, k) \( a \, b \) \)$.

The first action is on the left and the second on the right, so they commute.
  Reversing a base edge reverses its matching, because $U_j$ and $V_j$ commute in $Q_k$.
  We discard loops and repeated edges. Each fiber Cayley graph is connected,
  and the horizontal matchings connect the fibers over the connected graph $B_j$. Hence $Y_(j \, k)$ is connected. Write

$ Y_j = Y_(j \, 2 j) . $

The metric on $Y_j$ is its intrinsic graph metric.

=== 2.2 The two ends and the central collar <the-two-ends-and-the-central-collar>

For each integer $t$ with $- 3 j lt.eq t lt.eq 3 j$, put

#[#set math.equation(numbering: n => "(2.4)")
 $ k_j \( t \) = cases(delim: "{", 2 j \, & \| t \| lt.eq j \,, 3 j - \| t \| \, & j lt.eq \| t \| lt.eq 3 j .)
   $ <geom:height-profile>]

At height $t$, place a copy of $Y_(j \, k_j \( t \))$. Connect successive slices over the same base vertex by the
  reduction map from the larger quotient to the smaller one, or by the identity when the levels agree.
  The resulting finite graph is $X_j$.

At height $plus.minus 3 j$ the quotient is trivial, so each end is a copy of $B_j$.
  The induced graph on the heights $- j \, dots.h \, j$ is the product of $Y_j$ with the interval graph:
  its horizontal edges are those of $Y_j$, and its vertical edges preserve both $u$ and $q$.
  We call this subgraph the #emph[central collar]. Paths in $X_j$ may take shortcuts outside the collar;
  whenever we use its product structure, we will first show that the paths under consideration cannot leave it.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1.45, -0.084), (1.45, 2.384), fill: rgb("#ededff"), stroke: none)
  line((-5.003, 0), (5.22, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((5.22, 0), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((-4.35, 0), (-1.45, 2.1), (1.45, 2.1), (4.35, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((-1.45, 0), (-1.45, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.45, 0), (1.45, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 0), (0, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-4.35, 0.0525), (-4.35, -0.0525), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-4.35, -0.063), [#text(size: 9pt)[$-3j$]], anchor: "north", padding: 0.1176cm)
  line((-1.45, 0.0525), (-1.45, -0.0525), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.45, -0.063), [#text(size: 9pt)[$-j$]], anchor: "north", padding: 0.1176cm)
  line((0, 0.0525), (0, -0.0525), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.063), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  line((1.45, 0.0525), (1.45, -0.0525), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.45, -0.063), [#text(size: 9pt)[$j$]], anchor: "north", padding: 0.1176cm)
  line((4.35, 0.0525), (4.35, -0.0525), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.35, -0.063), [#text(size: 9pt)[$3j$]], anchor: "north", padding: 0.1176cm)
  circle((-4.35, 0), radius: 0.05997, fill: black, stroke: none)
  circle((4.35, 0), radius: 0.05997, fill: black, stroke: none)
  circle((0, 2.1), radius: 0.05997, fill: black, stroke: none)
  content((-4.35, 0.084), [#text(size: 9pt)[$B_j$]], anchor: "south-east", padding: 0.1176cm)
  content((4.35, 0.084), [#text(size: 9pt)[$B_j$]], anchor: "south-west", padding: 0.1176cm)
  content((0, 2.173), [#text(size: 9pt)[$Y_j$ \(fiber $Q_2j$\)]], anchor: "south", padding: 0.1176cm)
  content((0, 1.134), [#text(size: 9pt)[central collar]])
  content((-2.9, 1.05), [#text(size: 9pt)[$Q_(k_j(t))$]], anchor: "south", angle: 45deg, padding: 0.1176cm)
  content((2.9, 1.05), [#text(size: 9pt)[$Q_(k_j(t))$]], anchor: "south", angle: -45deg, padding: 0.1176cm)
  content((-4.857, 2.1), [#text(size: 9pt)[$k_j(t)=2j$]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: The congruence level as a function of height in $X_j$. Every slice lies over the same discrete torus $B_j$. Outside the central collar, each vertical step changes the quotient level by one. The drawing records the level profile, not a geometric embedding of the graph or its fiber cardinalities. ],
) <fig:profile>

The gradual reductions in Figure 1 have bounded fibers by Lemma 2.
  They therefore preserve a uniform degree bound even though the middle quotient grows rapidly with $j$.

#thm([Lemma 2.2.])[
  #emph[The graphs $B_j \, Y_j \, X_j$ are finite and connected, with vertex degrees bounded independently of $j$.
    Their projections to $B_j$ are $1$-Lipschitz. Each end copy of $B_j$ is isometrically embedded in $X_j$.]
] <geom:basic>

#proof[
  Only the claims about $X_j$ remain to be checked. Consecutive slices are connected by surjective reduction maps,
    so $X_j$ is connected. A vertex has at most $\| S \|$ fiber neighbors, six base neighbors,
    and at most $2^9$ vertical neighbors on either side. Thus $\| S \| + 6 + 2^10$ is a common bound.
    Projection sends an edge to a base edge or a point, proving the Lipschitz assertion.
    Within an end, every base path is available. Projection gives the opposite distance inequality,
    so the end metric is exactly the metric of $B_j$. ◻
]

=== 2.3 Coarse disjoint unions <coarse-disjoint-unions>

We now fix metrics on

$ B = union.sq.big_(j gt.eq 1) B_j \, wide Y = union.sq.big_(j gt.eq 1) Y_j \, wide X = union.sq.big_(j gt.eq 1) X_j . $

In $B_j$ choose the zero vertex, in $Y_j$ the vertex $\( 0 \, 1 \)$,
  and in $X_j$ the vertex $\( 0 \, 1 \)$ at height zero. In each union,
  join the chosen vertices of components $j$ and $j + 1$ by an auxiliary edge of length $100 + j^2$,
  and use the resulting path distances on the original vertex set.
  These edges define the metric; they add no vertices to the space.

A path which leaves and returns to the same component must pass through its chosen vertex both times.
  Consequently its use of the auxiliary edges cannot shorten an intrinsic component distance.
  At each fixed distance bound, cross-component pairs occur in only finitely many finite components.
  The resulting metrics are uniformly discrete and proper. They have bounded geometry because the weighted graphs
  have uniformly bounded degrees and all edge lengths are at least one:
  a ball of radius $R$ contains no more vertices than a ball of graph radius $floor.l R
  floor.r$ in a graph of the same degree bound.

Projection and end inclusion define maps

#[#set math.equation(numbering: n => "(2.5)")
 $ f : Y arrow.r B \, wide i_plus.minus : B arrow.r X . $ <geom:coarse-maps>]

On each component they are $1$-Lipschitz. For a fixed input distance bound,
  the remaining pairs lie in a finite set, so their image distances also have a finite bound.
  Thus the maps are bornologous. Preimages of bounded sets are finite, so the maps are proper.
  At scale $3$ none of the Rips complexes has a cross-component simplex.
  In particular, the end maps induce proper simplicial inclusions

$ i_(plus.minus \, 3) : P_3 \( B \) arrow.r P_3 \( X \) . $

These are the maps used to form the K-homology class. The next section shows why its two endpoint contributions
  remain distinct at every fixed scale.

== 3 An integral class that persists at every scale <sec:persistence>

We construct a class $beta in "KX"_1 \( B \)$ whose images at the two ends of $X$ have an infinite-order
  difference. The obstruction to identifying these images will be integral:
  at any fixed Rips scale, an appropriate $K$-cohomology class becomes divisible by larger and larger powers of
  two over the middle graphs $Y_j$.

All $K$-groups in this section are complex and integral. For a finite complex $M$,
  we write $K^(*) \( M \)$ for topological $K$-theory and $K_(*) \( M \) =
  "KK"_(*) \( C \( M \) \, bb(C) \)$ for analytic $K$-homology. The pairing

$ chevron.l med \, med chevron.r : K^1 \( M \) times K_1 \( M \) arrow.r bb(Z) $

is the Kasparov index pairing. In particular, for a continuous map $h : M arrow.r N$ between finite complexes,

#[#set math.equation(numbering: n => "(3.1)")
 $ chevron.l eta \, h_(*) xi chevron.r = chevron.l h^(*) eta \, xi chevron.r . $ <top:pairing-naturality>]

We use the usual Mayer–Vietoris sequence for a finite complex covered by two subcomplexes;
  see [11] for these $K$-homology constructions.

=== 3.1 The classes on the two ends <the-classes-on-the-two-ends>

Let

$ T_j = \( bb(R) \/ l_j bb(Z) \)^3 . $

Give $T_j$ its unit cubical subdivision and triangulate the cubes periodically.
  The vertices are $B_j$, and the vertices of every cube have graph distance at most $3$.
  The resulting triangulated torus is therefore a subcomplex of $P_3 \( B_j \)$; write $kappa_j :
  T_j arrow.r.hook P_3 \( B_j \)$ for its inclusion.

Let $u_1 \, u_2 \, u_3 in H^1 \( T_j \; bb(Z) \)$ be the positively oriented coordinate classes.
  Choose a line bundle $cal(L)_j$ pulled back from the first two circles with

$ c_1 \( cal(L)_j \) = u_1 smile u_2 \, $

and let $e_3 in K^1 \( T_j \)$ be the pullback of the positive generator of $K^1 \( S^1 \)$ under projection to
  the third circle. Define

#[#set math.equation(numbering: n => "(3.2)")
 $ theta_j = \( \[ cal(L)_j \] - 1 \) e_3 in K^1 \( T_j \) . $ <top:theta>]

This class is primitive. Indeed, the exterior-algebra description of $K^(*) \( \( S^1 \)^3 \)$ identifies
  $\[ cal(L)_j \] - 1$ with a generator of the reduced $K^0$ of the first two circles,
  and $theta_j$ with the product of the three circle generators.
  Here the first assertion also follows from the first Chern class,
  which identifies $tilde(K)^0 \( \( S^1 \)^2 \)$ with $H^2 \( \( S^1 \)^2 \; bb(Z) \)$.
  The Künneth and universal coefficient theorems therefore give a class

#[#set math.equation(numbering: n => "(3.3)")
 $ tau_j in K_1 \( T_j \) \, wide chevron.l theta_j \, tau_j chevron.r = 1 . $ <top:tau>]

More explicitly, $K^(*) \( T_j \)$ is free abelian, so the universal coefficient theorem identifies
  $K_1 \( T_j \)$ with $"Hom" \( K^1 \( T_j \) \, bb(Z) \)$,
  and a primitive element admits an integer-valued functional taking value $1$ on it;
  see [3] Theorems 23.1.1 and 23.1.3.

The component separation gives $P_3 \( B \) = union.sq.big_j P_3 \( B_j \)$.
  Countable additivity in the first variable of $"KK"$ gives

#[#set math.equation(numbering: n => "(3.4)")
 $ "KK"_1 \( C_0 \( P_3 \( B \) \) \, bb(C) \) tilde.equiv product_(j gt.eq 1) K_1 \( P_3 \( B_j \) \) .
   $ <top:kk-product>]

This is a product, so the entire sequence $\( \( kappa_j \)_(*) tau_j \)_j$ determines a class $beta_3$ in the
  group on the left; see [3] Theorem 19.7.1. Write $beta$ for its image in $"KX"_1 \( B \)$ and set

#[#set math.equation(numbering: n => "(3.5)")
 $ alpha_3 = \( i_(+ \, 3) \)_(*) beta_3 - \( i_(- \, 3) \)_(*) beta_3 \, wide
   alpha = \[ alpha_3 \] in "KX"_1 \( X \) . $ <top:alpha>]

Thus $alpha = \( i_(+) \)_(*) beta - \( i_(-) \)_(*) beta$.
  We will prove that every nonzero integer multiple of $alpha_3$ remains nonzero at every later Rips scale.

=== 3.2 Retractions to the tori <retractions-to-the-tori>

Fix an integer $r gt.eq 3$. From now on, thresholds on $j$ may depend on $r$,
  but not on a simplex or a vertex of the corresponding component.

#thm([Lemma 3.1.])[
  #emph[If $l_j > 4 r$, there is a continuous map
$ p_(B \, j) : P_r \( B_j \) arrow.r T_j $

 whose restriction to $T_j subset.eq P_3 \( B_j \) subset.eq P_r \( B_j \)$ is the identity.
   The graph projections define continuous maps
$ p_(Y \, j) : P_r \( Y_j \) arrow.r T_j \, wide p_(X \, j) : P_r \( X_j \) arrow.r T_j $

 by composition with $p_(B \, j)$.]
] <top:interpolation>

#proof[
  For vertices $u \, v$ of a Rips simplex, each coordinate difference has a unique representative
    $delta_i \( u \, v \) in bb(Z)$ with $\| delta_i \( u \, v \) \| lt.eq r$.
    On a triangle $\( u \, v \, w \)$, the integer
  $ delta_i \( u \, v \) + delta_i \( v \, w \) - delta_i \( u \, w \) $
  is a multiple of $l_j$ and has absolute value at most $3 r < l_j$; it therefore vanishes.
    Consequently the vertices of each simplex admit lifts to $bb(Z)^3$ realizing all these differences.
    The lifts are unique up to a common element of $l_j bb(Z)^3$.
    Affine interpolation, followed by reduction modulo $l_j bb(Z)^3$,
    gives a map on the simplex independent of that choice. The maps agree on faces and define $p_(B \, j)$.
  On each simplex of the triangulated torus, this interpolation is its original parametrization,
    so the restriction is the identity. The projections $Y_j arrow.r B_j$ and $X_j arrow.r
    B_j$ are $1$-Lipschitz by Lemma 3; hence they induce simplicial maps of the corresponding Rips complexes. ◻
]

The maps in Lemma 4 allow us to compare the same torus class at the ends and in the middle.
  At either end its pairing with $tau_j$ is $1$. In the middle, a congruence calculation forces divisibility.

=== 3.3 The congruence calculation <the-congruence-calculation>

#thm([Lemma 3.2.])[
  #emph[For every fixed integer $r gt.eq 3$ and all sufficiently large $j$,
#[#set math.equation(numbering: n => "(3.6)")
 $ p_(Y \, j)^(*) \( u_1 smile u_2 \) in 2^j H^2 \( P_r \( Y_j \) \; bb(Z) \) . $ <top:chern-divisibility-eq>]

 Equivalently, there is a line bundle $cal(L)'_(j \, r)$ on $P_r \( Y_j \)$ such that
#[#set math.equation(numbering: n => "(3.7)")
 $ p_(Y \, j)^(*) cal(L)_j tilde.equiv \( cal(L)'_(j \, r) \)^(⊗ 2^j) . $ <top:line-root>]

]
] <top:chern-divisibility>

#proof[
  Take $j$ large enough that $l_j > 4 r$ and reduction $Gamma arrow.r
    Q_(2 j)$ is injective on the word ball of radius $2 r$; the latter condition is available from Lemma 2.
    In this proof write $m = 2^j$, suppress $j$ in $U_j \, V_j$, and abbreviate $g_(j \, k)$ to $g_k$.
  We first describe integral cocycles representing $p_(Y \, j)^(*) u_1 \, p_(Y \, j)^(*) u_2$.
    For an oriented Rips edge $\( x \, y \)$, let $v_x \, v_y in
    B_j$ be its projected endpoints and choose their coordinate representatives in ${ 0 \, dots.h \, l_j - 1 }$.
    Define its first two seam numbers $a_(x y) \, b_(x y) in bb(Z)$ by
  $ delta_1 \( v_x \, v_y \) = \( v_y \)_1 - \( v_x \)_1 + l_j a_(x y) \, wide
    delta_2 \( v_x \, v_y \) = \( v_y \)_2 - \( v_x \)_2 + l_j b_(x y) . $
  The triangle identities in the proof of Lemma 4 show that $a \, b$ are cocycles.
    The seam numbers record the winding of the interpolated coordinate maps, so $\[ a \] =
    p_(Y \, j)^(*) u_1$ and $\[ b \] = p_(Y \, j)^(*) u_2$.
  To prove divisibility by $m$, it suffices to show that $a smile b$ becomes a coboundary modulo $m$.
    We will construct a $bb(Z) \/ m bb(Z)$-valued $1$-cochain $c$ with $delta c = -
    a smile b$ by comparing edge transports after lifting from $Q_(2 j)$ to $Q_(3 j)$.
  Order the vertices of $P_r \( Y_j \)$. For every edge $x < y$,
    choose a graph path from $x$ to $y$ of length at most $r$,
    and write $x = \( v_x \, q_x \)$ and $y = \( v_y \, q_y \)$.
    The left Cayley steps along this path give a word $w_(x y) in Gamma$ of length at most $r$.
    Left multiplications commute with all horizontal right multiplications.
    Moreover, $U \, V$ commute modulo $m^2$, and the total seam numbers of the projected path are $a_(x y) \,
    b_(x y)$: its coordinate displacement is bounded by $r$ and therefore is the unique small lift used above.
    It follows that
  #[#set math.equation(numbering: n => "(3.8)")
   $ q_y = overline(w)_(x y) thin q_x thin g_(2 j) \( a_(x y) \, b_(x y) \) quad
     upright("in ") Q_(2 j) . $ <top:edge-transport>]
  Here a bar denotes reduction modulo $m^2$.
  On an ordered triangle with vertices $x_0 < x_1 < x_2$, cocycle additivity and commutation modulo $m^2$ give
  $ g_(2 j) \( a_01 \, b_01 \) g_(2 j) \( a_12 \, b_12 \) = g_(2 j) \( a_02 \, b_02 \) . $
  Substitution in (3.8) and cancellation give $overline(w)_02 = overline(w)_12 overline(w)_01$.
    Both $w_02$ and $w_12 w_01$ lie in the word ball of radius $2 r$,
    so our injectivity assumption yields the equality in $Gamma$:
  #[#set math.equation(numbering: n => "(3.9)")
   $ w_02 = w_12 w_01 . $ <top:word-triangle>]
  We now lift this calculation from modulus $m^2$ to modulus $m^3$. Every element of
  $ N = ker \( Q_(3 j) arrow.r Q_(2 j) \) $
  has the form $1 + m^2 D$ modulo $m^3$, with $D$ determined modulo $m$.
    Multiplication adds the matrices $D$, since $m^4$ is divisible by $m^3$. Thus $N$ is abelian and
  $ d : N arrow.r bb(Z) \/ m bb(Z) \, wide d \( 1 + m^2 D \) = D_13 med \( mod med m \) $
  is a homomorphism. Every element of $N$ commutes with every matrix that is $1$ modulo $m$, in particular with
  $ tilde(g) \( a \, b \) = V^b U^a med \( mod med m^3 \) . $
  Direct multiplication of the elementary matrices gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ C & = U V U^(- 1) V^(- 1) = 1 + m^2 E_13 med \( mod med m^3 \) \, wide d \( C \) = 1 \,\
tilde(g) \( a \, b \) tilde(g) \( a' \, b' \) & = tilde(g) \( a + a' \, b + b' \) C^(a b') . $ <top:central-extension>]
  Choose a lift $tilde(q)_x in Q_(3 j)$ of each $q_x$, and denote the reduction of $w in
    Gamma$ to $Q_(3 j)$ by $tilde(w)$. Equation (3.8) defines $n_(x y) in N$ by
  #[#set math.equation(numbering: n => "(3.11)")
   $ tilde(q)_y = tilde(w)_(x y) tilde(q)_x tilde(g) \( a_(x y) \, b_(x y) \) n_(x y) . $ <top:lifted-edge>]
  For an ordered triangle, abbreviate $tilde(g) \( a_(a b) \, b_(a b) \)$ to $tilde(g)_(a b)$.
    Substituting twice in (3.11) gives
  $ tilde(q)_2 & = tilde(w)_12 tilde(w)_01 tilde(q)_0 tilde(g)_01 n_01 tilde(g)_12 n_12\
 & = tilde(w)_02 tilde(q)_0 tilde(g)_01 tilde(g)_12 n_01 n_12\
 & = tilde(w)_02 tilde(q)_0 tilde(g)_02 C^(a_01 b_12) n_01 n_12 . $
  The second equality moves $n_01$ only past $tilde(g)_12$, which it commutes with;
    it uses no commutation with $tilde(q)_0$ or with a Cayley word. Comparing with the direct edge $02$ therefore gives
  $ n_02 = C^(a_01 b_12) n_01 n_12 . $
  Apply $d$ and put $c_(x y) = d \( n_(x y) \)$. With the usual simplicial coboundary convention, this identity becomes
  $ \( a smile b \)_012 = a_01 b_12 = c_02 - c_01 - c_12 = - \( delta c \)_012 quad upright("in ") bb(Z) \/ m bb(Z) . $
  Hence the reduction of $\[ a smile b \]$ modulo $m$ is zero. The cohomology sequence of
  $ 0 arrow.r bb(Z) arrow.r^(thin m thin) bb(Z) arrow.r bb(Z) \/ m bb(Z) arrow.r 0 $
  identifies the kernel of reduction on $H^2$ with the image of multiplication by $m$.
    This proves (3.6), without a torsion-freeness assumption on $H^2 \( P_r \( Y_j \) \; bb(Z) \)$.
    Finally, line bundles on a finite complex are classified by their integral first Chern class,
    and the first Chern class of a tensor power is the corresponding integer multiple. This proves (3.7). ◻
]

=== 3.4 From line-bundle roots to divisibility in $K^1$ <from-line-bundle-roots-to-divisibility-in-k1>

For fixed $r$, bounded geometry supplies an integer $D_r gt.eq 1$ such that

$ dim P_r \( Y_j \) lt.eq D_r wide \( j gt.eq 1 \) . $

Indeed, the vertices of a Rips simplex all belong to the radius-$r$ ball about any one of them,
  and these balls have uniformly bounded cardinality. The dimension bound converts the line-bundle roots into
  integral divisibility in $K$-theory.

#thm([Lemma 3.3.])[
  #emph[For every fixed integer $r gt.eq 3$ and all sufficiently large $j$,
#[#set math.equation(numbering: n => "(3.12)")
 $ p_(Y \, j)^(*) theta_j in 2^(thin j - floor.l log_2 D_r floor.r) K^1 \( P_r \( Y_j \) \) . $ <top:k-divisibility-eq>]

]
] <top:k-divisibility>

#proof[
  Take $j$ satisfying Lemma 5 and $2^j > D_r$, and put $z = \[ cal(L)'_(j \, r) \] -
    1 in K^0 \( P_r \( Y_j \) \)$. The classifying map of this line bundle can be taken to land in $bb(C P)^(D_r)$
    by cellular approximation. The relation $\( \[ cal(H) \] - 1 \)^(D_r + 1) =
    0$ for the tautological line bundle $cal(H)$ on $bb(C P)^(D_r)$ therefore implies $z^(D_r + 1) = 0$;
    see [1] Corollary 2.7.9. Consequently (3.7) gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ \[ p_(Y \, j)^(*) cal(L)_j \] - 1 = \( 1 + z \)^(2^j) - 1 = sum_(h = 1)^(D_r) binom(2^j, h) z^h . $ <top:binomial>]
  For $1 lt.eq h lt.eq D_r$, let $v_2 \( h \)$ be the exponent of $2$ dividing $h$. The identity
  $ h binom(2^j, h) = 2^j binom(2^j - 1, h - 1) $
  shows that $binom(2^j, h)$ is divisible by $2^(j - v_2 \( h \))$, hence by $2^(j - floor.l log_2 D_r floor.r)$.
    Every coefficient in (3.13) has this common divisor. Multiplying the resulting divisibility in $K^0$ by
    $p_(Y \, j)^(*) e_3$ proves the claim. ◻
]

We have now obtained the growing divisor over the middle.
  It remains to show that an equality between the classes at the two ends would force their common pairing to have
  this divisor.

=== 3.5 Mayer–Vietoris detection and the direct limit <mayervietoris-detection-and-the-direct-limit>

For $r gt.eq 3$, let

$ t_(plus.minus \, j \, r) : T_j arrow.r P_r \( X_j \) $

denote the inclusion of the triangulated torus at height $plus.minus 3 j$.

#thm([Lemma 3.4.])[
  #emph[Fix an integer $r gt.eq 3$ and a nonzero integer $n$. For all sufficiently large $j$,
#[#set math.equation(numbering: n => "(3.14)")
 $ n \( t_(+ \, j \, r) \)_(*) tau_j - n \( t_(- \, j \, r) \)_(*) tau_j eq.not 0 quad
   upright("in ") K_1 \( P_r \( X_j \) \) . $ <top:component-nonzero>]

]
] <top:component-detection>

#proof[
  In addition to the hypotheses needed for Lemma 6, take $j > 2 r$. Cover $P_r \( X_j \)$ by the induced subcomplexes
  $ M^(+) = P_r \( X_j \) \|_({ t gt.eq - r }) \, wide M^(-) = P_r \( X_j \) \|_({ t lt.eq r }) \, $
  and put $I = M^(+) ∩ M^(-)$. These subcomplexes cover: a simplex not contained in either would contain vertices
    at heights below $- r$ and above $r$, contradicting its diameter bound because height is $1$-Lipschitz.
    Their intersection is induced on the vertices at heights in $\[ - r \, r \]$.
  There is a simplicial map
  $ h : I arrow.r P_r \( Y_j \) $
  that forgets height. To check this, join any two vertices in a simplex of $I$ by a graph path of length at most
    $r$ in $X_j$. Every vertex of this path has height in $\[ - 2 r \, 2 r \]$,
    which lies in the product collar since $j > 2 r$. Forgetting height sends the path to a path in $Y_j$ of no
    greater length. Thus the images of the simplex vertices have diameter at most $r$. The interpolation maps satisfy
  #[#set math.equation(numbering: n => "(3.15)")
   $ p_(X \, j) \|_I = p_(Y \, j) compose h . $ <top:collar-factorization>]
  Let $a_plus.minus : I arrow.r.hook M^plus.minus$ and $b_plus.minus :
    M^plus.minus arrow.r.hook P_r \( X_j \)$ be the inclusions, and write $t^plus.minus : T_j arrow.r
    M^plus.minus$ for the endpoint inclusions. The relevant part of the Mayer–Vietoris sequence is
  $ K_1 \( I \) arrow.r^(\( \( a_(+) \)_(*) \, - \( a_(-) \)_(*) \)) K_1 \( M^(+) \) xor K_1 \( M^(-) \)
    arrow.r^(\( b_(+) \)_(*) + \( b_(-) \)_(*)) K_1 \( P_r \( X_j \) \) . $
  If the difference in (3.14) were zero, exactness would give $eta in K_1 \( I \)$ with
  $ \( a_(+) \)_(*) eta = n \( t^(+) \)_(*) tau_j \, wide \( a_(-) \)_(*) eta = n \( t^(-) \)_(*) tau_j . $
  Pair the first equality with $\( p_(X \, j) \|_(M^(+)) \)^(*) theta_j$.
    Since $p_(X \, j) compose t_(+ \, j \, r) = "id"_(T_j)$, naturality (3.1) and (3.3) give
  #[#set math.equation(numbering: n => "(3.16)")
   $ n = chevron.l \( p_(X \, j) \|_I \)^(*) theta_j \, eta chevron.r = chevron.l h^(*) p_(Y \, j)^(*) theta_j \,
     eta chevron.r . $ <top:divisibility-contradiction>]
  By Lemma 6, the last integer is divisible by $2^(j - floor.l log_2 D_r floor.r)$. Taking $j$ large enough that
  $ j - floor.l log_2 D_r floor.r > v_2 \( \| n \| \) $
  contradicts (3.16). ◻
]

#thm([Proposition 3.5.])[
  #emph[The class $alpha in "KX"_1 \( X \)$ defined in (3.5) has infinite order.
    In particular, $alpha ⊗ 1 eq.not 0$ in $"KX"_1 \( X \) ⊗ bb(Q)$.]
] <top:infinite-order>

#proof[
  Fix a nonzero integer $n$ and an integer $r gt.eq 3$. Let $alpha_r$ be the image of $alpha_3$ under the map
    induced by $P_3 \( X \) arrow.r.hook P_r \( X \)$. For all sufficiently large $j$,
    the component separation ensures that no simplex of $P_r \( X \)$ meets both $X_j$ and its complement.
    Thus $P_r \( X_j \)$ is a clopen subcomplex, and extension by zero on functions gives a $*$-homomorphism
  $ C \( P_r \( X_j \) \) arrow.r C_0 \( P_r \( X \) \) . $
  Contravariance of $"KK"$ in its first variable defines restriction
  $ "KK"_1 \( C_0 \( P_r \( X \) \) \, bb(C) \) arrow.r K_1 \( P_r \( X_j \) \) . $
  By (3.4) and functoriality, the restriction of $n alpha_r$ is exactly the difference in (3.14).
    Choosing $j$ also large enough for Lemma 7 proves $n alpha_r eq.not 0$.
  We have proved that for every nonzero $n$ and every integer $r gt.eq 3$,
    the scale-$r$ image of $n alpha_3$ is nonzero. If $n alpha$ vanished in the filtered direct limit defining
    $"KX"_1 \( X \)$, it would vanish at some finite later scale; integer scales are cofinal,
    so this is impossible. Hence $alpha$ has infinite order. The kernel of the map from any abelian group to its
    tensor product with $bb(Q)$ is its torsion subgroup, which proves the final assertion. ◻
]

== 4 Maximal Roe algebras and the coarse index <sec:maximal-index>

The infinite-order class is now constructed. It remains to show that its two end contributions have the same
  maximal index. The subsequent averaging and sliding arguments will use operator formulas on the standard
  modules. We therefore establish the norm estimates that allow those formulas to be used in the maximal
  completion, and then verify the required naturality of the index.
  These are standard features of maximal Roe theory; see [14] Section 2 and [16] Section 2.
  We give the details needed here because the distinction between operator norm and maximal norm is essential to
  the proof.

=== 4.1 Norm control and multipliers <norm-control-and-multipliers>

Let $Z$ be a uniformly discrete proper metric space of bounded geometry, and write

$ H_0 = ell^2 \( bb(N) \) \, wide H_Z = ell^2 \( Z \) ⊗ H_0 \, wide A_Z = C_max^(*) \( Z \) . $

The algebra $bb(C) \[ Z \]$ consists of the bounded finite-propagation operators on $H_Z$ that are locally compact
  for the multiplication representation of $C_0 \( Z \)$. We denote their concrete operator norm by $parallel
  dot.op parallel_(upright("op"))$ and their maximal norm by $parallel dot.op parallel_max$.
  Write $T_(x y) : H_0 arrow.r H_0$ for the matrix entries of an operator $T$.

For a bounded finite-propagation operator, local compactness is equivalent to compactness of every entry
  $T_(x y)$. In one direction, compress by the characteristic functions of single vertices.
  Conversely, every row and column of a finite-propagation matrix has only finitely many entries.
  Multiplication on either side by a finitely supported function therefore gives a finite matrix of compact
  operators. Approximation by finitely supported functions proves the assertion for every function in
  $C_0 \( Z \)$. In particular, no uniform bound on the ranks, or on finite-rank approximations to the entries,
  is part of this definition.

#thm([Lemma 4.1.])[
  (Fixed-propagation norm control).  #emph[For every $R gt.eq 0$ there is a constant $c_Z \( R \) < oo$ such that
$ parallel T parallel_(upright("op")) lt.eq parallel T parallel_max lt.eq
  c_Z \( R \) parallel T parallel_(upright("op")) wide \( T in bb(C) \[ Z \] \, med "prop" \( T \) lt.eq R \) . $

 Consequently, operator-norm convergence of algebraic Roe operators with one common propagation bound implies
   convergence in maximal norm.]
] <ana:fixed-propagation>

#proof[
  Put $N_R = sup_(z in Z) \| B_Z \( z \, R \) \|$. The support of $T$,
    viewed as a bipartite graph with a row copy and a column copy of $Z$, has degree at most $N_R$.
    A greedy edge coloring partitions it into at most $2 N_R - 1$ matchings.
    Accordingly, $T = sum_(a = 1)^(2 N_R - 1) T^(\( a \))$, where each $T^(\( a \))$ has at most one nonzero entry
    in each row and column, and $parallel T^(\( a \)) parallel_(upright("op")) lt.eq
    parallel T parallel_(upright("op"))$.
  The diagonal algebra
  $ product_(z in Z) cal(K) \( H_0 \) = {"diag" \( k_z \) : k_z in cal(K) \( H_0 \) \, med
    sup_z parallel k_z parallel < oo} $
  is a $C^(*)$-subalgebra of $bb(C) \[ Z \]$. Every $*$-representation of $bb(C) \[ Z \]$ restricts to a
    contractive representation of this algebra. Since $\( T^(\( a \)) \)^(*) T^(\( a \))$ is diagonal,
    every such representation $pi$ satisfies
  $ parallel pi \( T^(\( a \)) \) parallel^2 lt.eq parallel \( T^(\( a \)) \)^(*) T^(\( a \))
    parallel_(upright("op")) lt.eq parallel T parallel_(upright("op"))^2 . $
  The upper bound follows with $c_Z \( R \) = 2 N_R - 1$. The concrete representation on $H_Z$ gives the lower
    bound. Apply the estimate to differences to obtain the convergence assertion. ◻
]

This matching argument is the discrete-module form of the maximal-norm estimate in [14] Lemma 2.1;
  compare [18] Lemma 1.10. We shall also use the following stronger statement when the vertex support,
  rather than merely the propagation, is fixed.

#thm([Lemma 4.2.])[
  (The compact ideal).  #emph[An operator in $bb(C) \[ Z \]$ supported on $F times F$,
    for a finite set $F subset Z$, has the same maximal and concrete norms.
    The closure in $A_Z$ of all such operators is an ideal $cal(K)_Z$,
    canonically isomorphic to $cal(K) \( H_Z \)$. In particular, $K_1 \( cal(K)_Z \) = 0$.]
] <ana:compacts>

#proof[
  The operators supported on $F times F$ form the $C^(*)$-algebra $cal(K) \( ell^2 \( F \) ⊗ H_0 \)$.
    Restriction of any representation is contractive, and the concrete representation gives the reverse
    inequality. These finite-vertex algebras have dense union in $cal(K) \( H_Z \)$.
    Multiplying one of their elements on either side by a finite-propagation operator with compact entries gives
    another compact operator of finite vertex support: only a finite metric neighborhood of $F$ can occur.
    Density proves the ideal assertion. ◻
]

We will need finite-propagation operators whose entries are bounded but need not be compact,
  such as the unitaries implementing the group action. Here and below $M \( A_Z \)$ denotes the multiplier algebra
  of $A_Z$.

#thm([Lemma 4.3.])[
  (Finite-propagation multipliers).  #emph[Every bounded finite-propagation operator $D$ on $H_Z$ acts by left and
    right multiplication on $bb(C) \[ Z \]$, and these actions extend to a multiplier of $A_Z$.
    This assignment is a faithful $*$-homomorphism and satisfies
$ parallel D parallel_(upright("op")) lt.eq parallel D parallel_(M \( A_Z \)) lt.eq
  c_Z \( R \) parallel D parallel_(upright("op")) wide upright("if ") "prop" \( D \) lt.eq R . $

 For an operator supported on a single matching, the multiplier norm equals the concrete norm.]
] <ana:multipliers>

#proof[
  Products of $D$ with elements of $bb(C) \[ Z \]$ have finite propagation and compact entries.
    Decompose $D$ into matchings as in Lemma 9. It suffices to show that a matching operator whose entries have
    norm at most one acts contractively. For such an operator, $D^(*) D$ is a diagonal positive contraction.
    The operator $W = \( 1 - D^(*) D \)^(1 \/ 2)$ is bounded and diagonal. For $T in bb(C) \[ Z \]$, all terms in
  $ T^(*) T - \( D T \)^(*) \( D T \) = \( W T \)^(*) \( W T \) $
  belong to $bb(C) \[ Z \]$. Applying each $*$-representation gives $parallel D T parallel_max lt.eq
    parallel T parallel_max$. Applying this to $D^(*)$ and taking adjoints gives the corresponding
    right-multiplication bound. The algebraic compatibility identities between these left and right actions pass
    to the completion, so they define a multiplier. Summing the matching estimates gives the asserted upper bound.
  The assignment preserves products and adjoints on the dense algebra $bb(C) \[ Z \]$.
    The concrete representation of $A_Z$ on $H_Z$ is nondegenerate, since it contains $cal(K) \( H_Z \)$,
    and hence extends to the multiplier algebra. It sends the multiplier just constructed to the original operator
    $D$, proving the lower bound and faithfulness. ◻
]

In particular, an operator identity involving bounded finite-propagation operators remains an identity between
  their multipliers. This statement does not assert that the concrete representation of the entire maximal Roe
  algebra is faithful. The finite-propagation control in the preceding lemmas is what will justify the specific
  limits below.

=== 4.2 Maps induced by coarse maps <maps-induced-by-coarse-maps>

A map $h : Z arrow.r W$ between uniformly discrete proper bounded-geometry spaces is coarse if inverse images of
  bounded sets are bounded and, for every $R$, there is $S$ such that $d_Z \( x \, y \) lt.eq
  R$ implies $d_W \( h \( x \) \, h \( y \) \) lt.eq S$. Choose an isometry $V_h : H_Z arrow.r
  H_W$ that sends the summand over $z$ into the summand over $h \( z \)$,
  using orthogonal ranges when several vertices have the same image.
  Such a choice is possible because the vertex fibers are finite and $H_0$ is infinite dimensional.
  We call $V_h$ an exact covering isometry for $h$.

#thm([Proposition 4.4.])[
  (Coarse functoriality).  #emph[Conjugation by an exact covering isometry defines a $*$-homomorphism
$ h_A = "Ad" \( V_h \) : A_Z arrow.r A_W . $

 Its induced map on $K$-theory is independent of the covering isometry.
   These induced maps respect composition, and an exact covering isometry over $"id"_Z$ induces the identity on
   $K_(*) \( A_Z \)$.]
] <ana:functoriality>

#proof[
  For $T in bb(C) \[ Z \]$, coarse control bounds the propagation of $V_h T V_h^(*)$.
    Each of its vertex entries is a finite sum of compact operators,
    because $h^(- 1) \( w \)$ is finite for each $w$. Thus conjugation is a $*$-homomorphism $bb(C) \[ Z \]
    arrow.r bb(C) \[ W \]$, and the universal property extends it contractively to the maximal completions.
  For two choices $V_0 \, V_1$, put
  $ V_lambda = vec(cos lambda thin V_0, sin lambda thin V_1) : H_Z arrow.r H_W xor H_W \, wide 0 lt.eq
    lambda lt.eq pi \/ 2 . $
  Each $V_lambda$ is an isometry. Conjugation defines a homomorphism to $M_2 \( A_W \)$:
    its four matrix entries have compact vertex entries and one common propagation bound for every fixed $T in
    bb(C) \[ Z \]$. Moreover,
  $ parallel V_lambda T V_lambda^(*) - V_nu T V_nu^(*) parallel_(upright("op")) lt.eq
    2 parallel T parallel_(upright("op")) \| lambda - nu \| . $
  Lemma 9, applied to the four entries, promotes this estimate to maximal-norm continuity on $bb(C) \[ Z \]$;
    contractivity and density give continuity on $A_Z$. The two endpoint homomorphisms are $"Ad" \( V_0 \)$ and
    $"Ad" \( V_1 \)$ in the two standard matrix corners, which induce the same stabilized $K$-theory map.
    Composing covering isometries proves functoriality, and comparison with the identity isometry proves the last
    assertion. ◻
]

This is the exact-covering version of [14] Lemma 2.15. For the maps in our construction we henceforth choose such
  homomorphisms and write

$ f_A : A_Y arrow.r A_B \, wide i_(plus.minus \, A) : A_B arrow.r A_X . $

By Proposition 12, all statements about their $K$-theory maps are independent of these choices.

=== 4.3 The canonical odd index and naturality <the-canonical-odd-index-and-naturality>

The remaining index-theoretic input is compatibility with the two end inclusions.

#thm([Proposition 4.5.])[
  (Naturality for the end classes).  #emph[For the classes $beta in "KX"_1 \( B \)$ and $alpha = \( i_(+) \)_(*)
    beta - \( i_(-) \)_(*) beta in "KX"_1 \( X \)$ constructed above,
#[#set math.equation(numbering: n => "(4.1)")
 $ mu_X^max \( alpha \) = \( i_(+ \, A) \)_(*) mu_B^max \( beta \) - \( i_(- \, A) \)_(*) mu_B^max \( beta \) .
   $ <eq:ana-naturality>]

]
] <ana:naturality>

To verify this identity in the maximal completion, we first identify the Roe algebra of a Rips complex with the
  vertex algebra and then recall the exponential formula for its canonical odd index.

For $r > 0$, regard a point of $P_r \( Z \)$ as a finitely supported probability measure on $Z$ whose support has
  diameter at most $r$. Equip the complex with the $1$-Wasserstein metric induced by $d_Z$.
  Every point is within $r$ of every vertex of its support.
  Moreover, a bounded set in this metric uses only vertices from one bounded subset of $Z$:
  if $v$ is a support vertex of $p$, then

$ d_Z \( v \, z_0 \) lt.eq r + integral_Z d_Z \( z \, z_0 \) thin d p \( z \) = r + d_(W_1) \( p \, delta_(z_0) \) . $

That subset is finite. Consequently this metric is proper and induces the usual topology on the locally finite
  complex. The vertex inclusion and any selection of a support vertex are coarse inverses.

Choose a countable dense subset $E subset P_r \( Z \)$ containing the vertices,
  and use the ample module $ell^2 \( E \) ⊗ H_0$ with pointwise multiplication by $C_0 \( P_r \( Z \) \)$.
  Assign each point of $E$ to one vertex of its support, assigning a vertex to itself.
  This partitions the module into infinite-dimensional separable blocks $H_v$, one for each $v in Z$;
  choose identifications $H_v tilde.equiv H_0$.

Under this regrouping, the algebraic Roe algebra of $P_r \( Z \)$ is exactly $bb(C) \[ Z \]$.
  Propagation bounds in the two descriptions differ by at most $2 r$.
  For local compactness, the points in $H_v$ lie in the compact closed star of $v$,
  so a compactly supported continuous cutoff equal to one on that star shows that a locally compact operator has
  compact vertex-block entries. Conversely, a compact subset of $P_r \( Z \)$ meets only finitely many blocks.
  Compact vertex-block entries and finite propagation therefore give local compactness after multiplication by a
  compactly supported function, and then by any function in $C_0 \( P_r \( Z \) \)$.
  The algebraic identification extends to the maximal completions by universality.
  It is the coarse identification induced by the chosen support-vertex map.
  Pseudolocality below is always taken relative to $C_0 \( P_r \( Z \) \)$;
  the regrouping is used only for the Roe algebra and for Lemma 11.

We recall the cycle description of the odd index. On an ample module for $P_r \( Z \)$,
  an odd $K$-homology class is represented, after stabilization and addition of degenerate cycles,
  by a bounded self-adjoint operator $F$ such that

$ \[ F \, a \] upright(" is compact") \, wide a \( F^2 - 1 \) upright(" is compact")
  quad \( a in C_0 \( P_r \( Z \) \) \) . $

The first condition is pseudolocality. The use of a fixed ample module is the usual Paschke realization of locally
  finite $K$-homology; see [11].

Such a representative may be taken to have finite propagation.
  Indeed, let $phi_v$ be the square roots of the barycentric coordinate functions.
  Their supports are compact, have diameter at most $2 r$, and form a locally finite family with $sum_v phi_v^2 =
  1$. Set

$ F' = sum_v phi_v F phi_v . $

The sum converges strongly and has norm at most $parallel F parallel$:
  it is the compression of the direct sum of copies of $F$ by the isometry $xi mapsto \( phi_v xi \)_v$.
  It has propagation at most $2 r$. Furthermore,

$ F' - F = sum_v phi_v \[ F \, phi_v \] $

is locally compact, since multiplication on the left by a compactly supported function leaves only finitely many
  compact summands; use self-adjointness for the right-hand assertion.
  Thus the straight-line path from $F$ to $F'$ consists of cycles and does not change the $K$-homology class.
  Replace $F$ by $F'$.

After regrouping into vertex blocks, Lemma 11 makes $F$ a self-adjoint multiplier of $A_Z$,
  and finite propagation gives $F^2 - 1 in bb(C) \[ Z \]$. Hence

$ p = frac(1 + F, 2) in M \( A_Z \) \, wide p^2 - p in bb(C) \[ Z \] \, wide u_F = exp \( 2 pi i p \) in 1 + A_Z . $

The odd maximal index is

#[#set math.equation(numbering: n => "(4.2)")
 $ "Ind"_(Z \, max) \( F \) = \[ u_F \] in K_1 \( A_Z \) . $ <eq:ana-odd-index>]

To relate this formula to the canonical index, let $D_max^(*) \( P_r \( Z \) \)$ be the universal completion of
  the algebra of finite-propagation pseudolocal operators on the Rips module.
  It contains $A_Z$ as an ideal, and Paschke duality identifies

$ "KK"_1 \( C_0 \( P_r \( Z \) \) \, bb(C) \) tilde.equiv K_0 #scale(x: 120%, y: 120%)[\(]
  D_max^(*) \( P_r \( Z \) \) \/ A_Z #scale(x: 120%, y: 120%)[\)] \, wide \[ F \] mapsto \[ p med mod med A_Z \] . $

These assertions, including existence of the universal completion, are proved in [16] Proposition 2.22,
  Propositions 2.27–2.28, and Corollary 2.29. The index is the boundary map of this extension.
  The multiplier action of Lemma 11 agrees with the inclusion on $A_Z$,
  so its exponential boundary formula is exactly (4.2). Thus this formula computes the canonical index,
  with its usual boundary-map sign convention. It agrees with the cycle construction in [14] Corollary 2.18.
  Passing to the Rips direct limit gives $mu_Z^max$.

#proof[
  Both classes are represented at Rips scale $3$, where the end maps are proper continuous coarse simplicial
    inclusions $i_(plus.minus \, 3) : P_3 \( B \) arrow.r P_3 \( X \)$. Choose the dense-set modules compatibly:
    the target dense set contains the images of the source dense set,
    and the support-vertex choices agree on these images. The resulting module isometry $V$ is an exact covering
    isometry for the end map after regrouping.
  If $F$ represents a source odd class and has finite propagation,
    its push-forward is represented on the target module by
  $ tilde(F) = V F V^(*) - \( 1 - V V^(*) \) . $
  The complement is a degenerate cycle. Properness ensures that pullbacks of $C_0$ functions lie in $C_0$,
    so $tilde(F)$ is pseudolocal and $tilde(F)^2 - 1$ is locally compact.
    Coarse control preserves finite propagation. Writing $p = \( 1 + F \) \/ 2$,
    we have $tilde(p) = \( 1 + tilde(F) \) \/ 2 = V p V^(*)$.
  For completeness, compatibility of the exponential with conjugation holds in the maximal completion itself.
    The function
  $ h \( z \) = frac(exp \( 2 pi i z \) - 1, z^2 - z) $
  extends to an entire function. Approximate $h$ uniformly by polynomials on disks containing the spectra of the
    two multipliers. Since
  $ exp \( 2 pi i p \) - 1 = \( p^2 - p \) h \( p \) \, $
  and $p^2 - p in bb(C) \[ B \]$, all polynomial identities are identities on the algebraic Roe algebras,
    and their limits hold in maximal norm. They give
  $ exp \( 2 pi i tilde(p) \) - 1 = i_(plus.minus \, A) #scale(x: 120%, y: 120%)[\(] exp \( 2 pi i p \) -
    1 #scale(x: 120%, y: 120%)[\)] . $
  Thus the two indices commute with the end inclusion. Apply this to $beta_3$, subtract the two identities,
    and use the definition of the Rips direct-limit assembly map.
    Independence of the covering choices follows from Proposition 12. ◻
]

== 5 A transfer in the maximal Roe algebra <sec:transfer>

The projection $f : Y arrow.r B$ forgets a finite Cayley graph over each base vertex.
  We will lift operators on $B$ to operators on $Y$ by transporting their matrix entries between these fibers and
  then projecting onto the constant vectors. The resulting map supplies the analytic class that we will move from
  one end of $X$ to the other.

#thm([Proposition 5.1.])[
  #emph[For the projection $f : Y arrow.r B$ there is a $*$-homomorphism
$ Phi : A_B arrow.r A_Y $

 such that $\( f_A Phi \)_(*) = "id"$ on $K_(*) \( A_B \)$. In particular,
$ \( f_A \)_(*) : K_1 \( A_Y \) arrow.r K_1 \( A_B \) $

 is surjective.]
] <ana:transfer>

Throughout this section, $u \, v \, w$ denote vertices of $B$. Write $F_u = f^(- 1) \( u \)$ and let

$ xi_u = \| F_u \|^(- 1 \/ 2) sum_(y in F_u) delta_y quad upright("in ") ell^2 \( F_u \) . $

These vectors define an isometry

#[#set math.equation(numbering: n => "(5.1)")
 $ V : H_B arrow.r H_Y \, wide V \( delta_u ⊗ h \) = xi_u ⊗ h . $ <eq:constant-isometry>]

The diameters of the fibers are not uniformly bounded, so $V$ itself need not be a covering isometry for a coarse
  map. We will obtain an element of the maximal Roe algebra from this averaging operation by using property (T).

=== 5.1 The projection onto fiber constants <the-projection-onto-fiber-constants>

For $gamma in Gamma$, let $U_gamma$ act by left multiplication by $gamma$ on every fiber,
  with the identity on $H_0$. This is a unitary operator of propagation at most the word length of $gamma$.
  Lemma 11 therefore gives a unitary representation

$ Gamma arrow.r M \( A_Y \) \, wide gamma mapsto U_gamma \, $

and hence a unital $*$-homomorphism from $C_max^(*) \( Gamma \)$ into $M \( A_Y \)$.

We recall explicitly the consequence of property (T) that will be used; see [2]. In $C_max^(*) \( Gamma \)$ put

$ Delta = 1 - frac(1, \| S \|) sum_(s in S) s . $

For every unitary representation $pi$ and every vector $eta$,

$ chevron.l pi \( Delta \) eta \, eta chevron.r = frac(1, 2 \| S \|) sum_(s in S) parallel pi \( s \) eta -
  eta parallel^2 . $

In particular, $0 lt.eq Delta lt.eq 2$, and the kernel of $pi \( Delta \)$ is the invariant subspace.
  Property (T), applied to the fixed finite generating set $S$,
  gives $kappa > 0$ such that every unit vector orthogonal to that subspace is moved by at least $kappa$ by some
  $s in S$. Consequently, with $epsilon = kappa^2 \/ \( 2 \| S \| \)$,

$ sigma_(C_max^(*) \( Gamma \)) \( Delta \) subset.eq { 0 } union \[ epsilon \, 2 \] . $

The continuous functional calculus thus gives a projection onto the invariant vectors in every representation, and

$ (1 - Delta / 2)^n $

converges to this projection in the maximal group norm. Denote its image in $M \( A_Y \)$ by $P$,
  and denote the images of the displayed approximants by $P_n$. We have

#[#set math.equation(numbering: n => "(5.2)")
 $ parallel P_n - P parallel_(M \( A_Y \)) arrow.r 0 . $ <eq:kazhdan-convergence>]

Each $P_n$ is a finite-propagation multiplier preserving every fiber.

In the concrete representation on $H_Y$, the invariant vectors in $ell^2 \( F_u \)$ are precisely the constant
  vectors: the map $Gamma arrow.r Q_(2 j)$ is onto and its left action on $F_u$ is transitive.
  Thus the concrete image of $P$ is $V V^(*)$. The transfer itself will use $P$ in the maximal multiplier algebra
  $M \( A_Y \)$.

=== 5.2 Transporting matrix entries <transporting-matrix-entries>

For each pair $u \, v$ in the same component $B_j$, choose a shortest edge path from $v$ to $u$,
  choosing the reverse path for the reversed pair. Horizontal transport along this path is a permutation

$ O_(u v) : ell^2 \( F_v \) arrow.r ell^2 \( F_u \) . $

Take $O_(u u) = 1$. When $u \, v$ lie in different components, instead put

$ O_(u v) = \| xi_u chevron.r chevron.l xi_v \| . $

In both cases,

#[#set math.equation(numbering: n => "(5.3)")
 $ O_(v u) = O_(u v)^(*) \, wide O_(u v) xi_v = xi_u \, wide O_(u v)^(*) xi_u = xi_v . $ <eq:transport-constants>]

Moreover, $O_(u v)$ intertwines the left $Gamma$-actions.
  For horizontal transport this follows because the matchings use right multiplication;
  for the rank-one operators it follows because both vectors are invariant.

Given $T in bb(C) \[ B \]$, use the decomposition $H_Y = xor.big_(u in B) ell^2 \( F_u \) ⊗ H_0$ to define

#[#set math.equation(numbering: n => "(5.4)")
 $ L \( T \)_(u v) = O_(u v) ⊗ T_(u v) . $ <eq:transport-lift>]

This is a linear, adjoint-preserving lift, but it need not be multiplicative.
  The next lemma isolates both its control and the precise failure of multiplicativity.

#thm([Lemma 5.2.])[
  #emph[For $T in bb(C) \[ B \]$, the operator $L \( T \)$ belongs to $bb(C) \[ Y \]$ and commutes with $P$.
    For $T \, T' in bb(C) \[ B \]$, the defect
#[#set math.equation(numbering: n => "(5.5)")
 $ D = L \( T \) L \( T' \) - L \( T T' \) $ <eq:transport-defect>]

 has finite vertex support and satisfies $P D = 0$ in $A_Y$.]
] <ana:transport-defect>

#proof[
  Let $R$ be a propagation bound for $T$. The matrix support of $T$ can be partitioned into finitely many
    matchings of the base vertices, with a number depending only on $R$ and the bounded geometry of $B$.
    On one such matching, the blocks in (5.4) have disjoint domain and range blocks,
    and their norms are at most $parallel T parallel_(upright("op"))$.
    Summing over the matchings proves that $L \( T \)$ is bounded.
  Within a component, any nonzero vertex entry of $O_(u v)$ joins vertices connected by the chosen horizontal
    path. Its length is $d_B \( u \, v \) lt.eq R$. Among different components,
    only finitely many vertex pairs $\( u \, v \)$ can occur at this propagation bound; their fibers are finite.
    The remaining entries therefore also have a finite propagation bound.
    Each vertex entry of $L \( T \)$ is a scalar multiple of a compact operator $T_(u v)$.
    It follows that $L \( T \) in bb(C) \[ Y \]$. The intertwining property of $O_(u v)$ shows that $L \( T \)$
    commutes with every $U_gamma$, hence with every $P_n$ and with $P$.
  We next locate the defect. Let $R'$ be a propagation bound for $T'$.
    Outside finitely many components, all entries involved in (5.5) stay in a single component $B_j$.
    For a summand with intermediate vertex $v$, the concatenated path from $w$ to $v$ to $u$ has length at most
    $R + R'$, as does the chosen path from $w$ to $u$. If $l_j > 2 \( R + R' \)$,
    these two paths have the same total seam crossing numbers.
    Indeed, their lifted coordinate displacements differ by a multiple of $l_j$ and have difference of absolute
    value at most $2 \( R + R' \)$ in each coordinate. That multiple must be zero.
    Since $U_j$ and $V_j$ commute in $Q_(2 j)$, horizontal transport depends only on these seam totals. It follows that
  $ O_(u v) O_(v w) = O_(u w) $
  for every summand under consideration. The defect therefore vanishes on all sufficiently large components.
    The omitted components and any cross-component entries lie in a finite union of finite graphs,
    so $D$ has finite vertex support.
  Equations (5.3) give, on the concrete Hilbert spaces,
  $ L \( T \) V = V T \, wide V^(*) L \( T \) = T V^(*) . $
  The concrete image of $P D$ is consequently zero. To obtain the equality in the maximal completion,
    choose a finite union $E$ of components of $Y$ containing the vertex support of $D$.
    Every $P_n$ preserves each fiber, so $P_n D$ has vertex support in the same finite set $E$.
    Lemma 10 identifies its maximal norm with its concrete operator norm.
    On $H_Y$, we have $P_n D arrow.r 0$ in operator norm; hence $P_n D arrow.r 0$ in maximal norm.
    On the other hand, (5.2) gives $P_n D arrow.r P D$ in $A_Y$. Thus $P D = 0$ in $A_Y$. ◻
]

=== 5.3 The splitting <the-splitting>

We can now define the transfer and compute its composition with $f_A$. The first task used finite vertex support.
  The second will use a different control: averaging can increase propagation inside a fiber,
  but it does not increase propagation after the fiber is projected to its base vertex.

#proof[
  For $T in bb(C) \[ B \]$, put
  $ Phi \( T \) = P L \( T \) in A_Y . $
  Since $P$ is a projection commuting with the lifts, Lemma 15 gives
  $ Phi \( T \) Phi \( T' \) = P L \( T \) L \( T' \) = P L \( T T' \) = Phi \( T T' \) . $
  The lift preserves adjoints, so $Phi$ is a $*$-homomorphism on $bb(C) \[ B \]$.
    The universal property of the maximal norm extends it to a $*$-homomorphism $A_B arrow.r A_Y$.
  Let $J : H_Y arrow.r H_B$ be the covering isometry defining $f_A$;
    it sends the summand at $y in F_u$ isometrically into the summand at $u$,
    with orthogonal ranges for distinct $y$ in the same fiber. For $T in bb(C) \[ B \]$, continuity gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ f_A Phi \( T \) = lim_(n arrow.r oo) J P_n L \( T \) J^(*) wide upright("in ") A_B . $ <eq:split-approximants>]
  All operators in this limit have propagation at most $"prop" \( T \)$ on $B$,
    because $P_n$ preserves the fibers. In concrete operator norm they converge to
  $ J V V^(*) L \( T \) J^(*) = J V T V^(*) J^(*) . $
  The isometry $J V : H_B arrow.r H_B$ lies over the identity of $B$,
    so $J V T V^(*) J^(*)$ belongs to $bb(C) \[ B \]$ and has the same propagation bound.
    The difference from each approximant in (5.6) has this fixed propagation bound as well.
    Lemma 9 promotes the concrete convergence to maximal-norm convergence. Hence
  #[#set math.equation(numbering: n => "(5.7)")
   $ f_A Phi \( T \) = "Ad" \( J V \) \( T \) . $ <eq:split-identity>]
  By density this identity holds on $A_B$. Finally, Proposition 12 says that a covering isometry over the identity
    induces the identity on $K$-theory. Applying it to $J V$ proves $\( f_A Phi \)_(*) = "id"$. ◻
]

== 6 Moving the analytic class to the two ends <sec:sliding>

The two endpoint maps $i_(-) f \, i_(+) f : Y arrow.r X$ are connected componentwise by the height slices of
  $X_j$. The distance between the endpoints grows with $j$,
  so a single bounded-distance homotopy does not compare their Roe-algebra maps.
  Instead, we place a copy of an operator at every height and compare this stack with its shift by one height.
  The common interior copies will cancel on $K$-theory.

#thm([Proposition 6.1.])[
  #emph[The endpoint maps induce the same homomorphism
$ \( i_(+ \, A) f_A \)_(*) = \( i_(- \, A) f_A \)_(*) : K_1 \( A_Y \) arrow.r K_1 \( A_X \) . $

]
] <ana:endpoints>

For $- 3 j lt.eq t lt.eq 3 j$, let

$ s_(j \, t) : Y_j arrow.r X_j \, wide \( u \, q \) mapsto \( u \, overline(q) \, t \) \, $

where $overline(q)$ is reduction from $Q_(2 j)$ to $Q_(k_j \( t \))$. The map is $1$-Lipschitz:
  it carries both Cayley edges and horizontal matchings to edges or to vertices. Consecutive slices satisfy

#[#set math.equation(numbering: n => "(6.1)")
 $ d_X \( s_(j \, t) \( y \) \, s_(j \, t + 1) \( y \) \) = 1 . $ <eq:successive-slices>]

Choose exact covering isometries

$ D_(j \, t) : H_(Y_j) arrow.r H_(X_j) $

over these vertex maps. They exist because every vertex summand is a copy of the infinite-dimensional Hilbert
  space $H_0$. At the endpoints choose them to be the restrictions of the covering isometries defining $i_(- \, A)
  f_A$ and $i_(+ \, A) f_A$, respectively. For fixed $j$, the ranges of the $D_(j \, t)$ for distinct $t$ are
  orthogonal, since they lie at distinct heights.

=== 6.1 Stacks modulo the compact operators <stacks-modulo-the-compact-operators>

Let

$ q : A_X arrow.r A_X \/ cal(K)_X $

be the quotient map. If $T in bb(C) \[ Y \]$, write $T_j = chi_(Y_j) T chi_(Y_j)$.
  The difference $T - xor.big_j T_j$ has finite vertex support:
  at a fixed propagation bound there are only finitely many cross-component entries. In particular it is compact. Define

#[#set math.equation(numbering: n => "(6.2)")
 $ S_0 \( T \) & = xor.big_j sum_(t = - 3 j)^(3 j - 1) D_(j \, t) T_j D_(j \, t)^(*) \,\
S_1 \( T \) & = xor.big_j sum_(t = - 3 j)^(3 j - 1) D_(j \, t + 1) T_j D_(j \, t + 1)^(*) . $ <eq:stack-zero>]

The number of copies is unbounded, but their ranges are orthogonal.
  Thus $parallel S_a \( T \) parallel_(upright("op")) lt.eq parallel T parallel_(upright("op"))$, for $a = 0 \,
  1$. If $"prop" \( T \) lt.eq R$, the $1$-Lipschitz property gives $"prop" \( S_a \( T \) \) lt.eq R$.
  Every vertex entry is compact: it is a finite sum of isometric images of compact entries of $T_j$,
  since each $Y_j$ is finite. Hence $S_a \( T \) in bb(C) \[ X \]$.
  No bound on the ranks of these compact entries is required in the algebra used here.

The maps $S_a$ need not be multiplicative before taking the quotient. For $T \, T' in bb(C) \[ Y \]$, however,

#[#set math.equation(numbering: n => "(6.3)")
 $ \( T T' \)_j - T_j T'_j = chi_(Y_j) T \( 1 - chi_(Y_j) \) T' chi_(Y_j) $ <eq:compression-defect>]

is zero except for finitely many $j$. Each nonzero term is compact on $H_(Y_j)$,
  since it is a matrix of compact operators over a finite vertex set.
  Copying it into the finitely many heights of the corresponding $X_j$ remains compact.
  Orthogonality of the height ranges and (6.3) therefore show that

$ overline(S)_a = q S_a : bb(C) \[ Y \] arrow.r A_X \/ cal(K)_X $

is a $*$-homomorphism. By maximal universality, it extends to a $*$-homomorphism with domain $A_Y$.

=== 6.2 A continuous rotation between the stacks <a-continuous-rotation-between-the-stacks>

We next prove that $overline(S)_0$ and $overline(S)_1$ induce the same map on $K$-theory.
  The rotation takes place in a doubled target module; this ensures that the ranges stay orthogonal at every
  intermediate angle.

For $0 lt.eq lambda lt.eq pi \/ 2$, define

$ W_(lambda \, j \, t) = vec(cos lambda thin D_(j \, t), sin lambda thin D_(j \, t + 1)) : H_(Y_j) arrow.r
  H_(X_j) xor H_(X_j) \, wide - 3 j lt.eq t < 3 j . $

Each $W_(lambda \, j \, t)$ is an isometry. For distinct pairs $\( j \, t \)$, their ranges are orthogonal:
  they lie in different components or, within one component, at different heights in each target copy.
  In the first copy the heights are $t$, and in the second they are $t + 1$. Thus they assemble to an isometry

$ W_lambda : xor.big_j xor.big_(t = - 3 j)^(3 j - 1) H_(Y_j) arrow.r H_X xor H_X . $

On $bb(C) \[ Y \]$ define

#[#set math.equation(numbering: n => "(6.4)")
 $ F_lambda \( T \) = W_lambda (xor.big_j xor.big_(t = - 3 j)^(3 j - 1) T_j) W_lambda^(*) . $ <eq:stack-rotation>]

Its diagonal matrix blocks are scalar multiples of the stacks in (6.2)–(6.2).
  The off-diagonal blocks are sums of $D_(j \, t) T_j D_(j \, t + 1)^(*)$ and their counterparts.
  If $"prop" \( T \) lt.eq R$, then (6.1) gives propagation at most $R + 1$ for these blocks.
  Their vertex entries are again finite sums of compact operators. We conclude that

$ F_lambda \( T \) in M_2 \( bb(C) \[ X \] \) \, wide "prop" \( F_lambda \( T \) \) lt.eq R + 1 . $

The same calculation as (6.3), using $W_lambda^(*) W_lambda = 1$,
  shows that the images of $F_lambda$ in $M_2 \( A_X \/ cal(K)_X \)$ are $*$-homomorphisms on $bb(C) \[ Y \]$.
  Each extends to $A_Y$ by maximal universality.

For completeness, continuity is uniform in the number of height slices. The orthogonality just established gives

$ parallel W_lambda - W_mu parallel =
  #scale(x: 120%, y: 120%)[\(] \( cos lambda - cos mu \)^2 + \( sin lambda - sin mu \)^2
  #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq \| lambda - mu \| . $

Consequently, in concrete operator norm,

#[#set math.equation(numbering: n => "(6.5)")
 $ parallel F_lambda \( T \) - F_mu \( T \) parallel_(upright("op")) lt.eq
   2 parallel T parallel_(upright("op")) thin \| lambda - mu \| . $ <eq:rotation-continuity>]

The difference has propagation at most $R + 1$, independently of the angles.
  Applying Lemma 9 to its four matrix blocks promotes (6.5) to an estimate

$ parallel F_lambda \( T \) - F_mu \( T \) parallel_(M_2 \( A_X \)) lt.eq
  C_R parallel T parallel_(upright("op")) thin \| lambda - mu \| $

for a constant independent of $j \, lambda \, mu$. This proves point-norm continuity on the dense algebra
  $bb(C) \[ Y \]$. The extended homomorphisms are contractive for the maximal norm,
  so density proves point-norm continuity on all of $A_Y$.

At $lambda = 0$ the homomorphism is $overline(S)_0$ in the first matrix corner, and at $lambda =
  pi \/ 2$ it is $overline(S)_1$ in the second. The corner identifications on $K$-theory agree, so

#[#set math.equation(numbering: n => "(6.6)")
 $ \( overline(S)_0 \)_(*) = \( overline(S)_1 \)_(*) . $ <eq:equal-stacks>]

=== 6.3 Canceling the interior copies <canceling-the-interior-copies>

#proof[
  Define the interior stack by
  $ I \( T \) = xor.big_j sum_(t = - 3 j + 1)^(3 j - 1) D_(j \, t) T_j D_(j \, t)^(*) . $
  Its image $overline(I) = q I$ is a $*$-homomorphism on $A_Y$ by the same compact-defect argument. Let
  $ E_(-) = i_(- \, A) f_A \, wide E_(+) = i_(+ \, A) f_A . $
  The endpoints in the two stacks agree modulo $cal(K)_X$ with $E_(-)$ and $E_(+)$, respectively.
    Indeed, our endpoint covering isometries agree with those defining $E_plus.minus$,
    and discarding the cross-component part of $T$ changes its image by a compact operator. Hence
  $ overline(S)_0 = overline(I) + q E_(-) \, wide overline(S)_1 = overline(I) + q E_(+) . $
  In each sum, the two homomorphisms have orthogonal ranges:
    one is supported on the strictly interior heights and the other on an endpoint.
  Orthogonal sums induce sums on $K_1$. Explicitly, if $phi$ and $psi$ are orthogonal homomorphisms and $u$ is a
    matrix unitary with $u - 1$ in the domain algebra, then
  $ 1 + \( phi + psi \) \( u - 1 \) = #scale(x: 120%, y: 120%)[\(] 1 +
    phi \( u - 1 \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] 1 +
    psi \( u - 1 \) #scale(x: 120%, y: 120%)[\)] \, $
  and multiplication of unitaries gives addition of their $K_1$-classes.
    Using this additivity in (6.6) and canceling $overline(I)_(*)$ gives
  $ q_(*) \( E_(-) \)_(*) = q_(*) \( E_(+) \)_(*) . $
  By Lemma 10, $cal(K)_X$ is the algebra of compact operators on $H_X$, so $K_1 \( cal(K)_X \) = 0$.
    The six-term exact sequence for
  $ 0 arrow.r cal(K)_X arrow.r A_X arrow.r^q A_X \/ cal(K)_X arrow.r 0 $
  therefore makes $q_(*) : K_1 \( A_X \) arrow.r K_1 \( A_X \/ cal(K)_X \)$ injective.
    It follows that $\( E_(-) \)_(*) = \( E_(+) \)_(*)$, as asserted. ◻
]

#proof[
  The graphs $X_j$ constructed above are finite and connected with a uniform degree bound,
    and their coarse disjoint union $X$ is uniformly discrete and has bounded geometry.
    Proposition 8 gives an infinite-order class
  $ alpha = \( i_(+) \)_(*) beta - \( i_(-) \)_(*) beta in "KX"_1 \( X \) . $
  By Proposition 14, choose $b in K_1 \( A_Y \)$ satisfying
  $ \( f_A \)_(*) \( b \) = mu_B^max \( beta \) . $
  Naturality of the maximal coarse index (Proposition 13) and Proposition 16 now give
  $ mu_X^max \( alpha \) & = \( i_(+ \, A) \)_(*) mu_B^max \( beta \) - \( i_(- \, A) \)_(*) mu_B^max \( beta \)\
 & = \( i_(+ \, A) f_A \)_(*) \( b \) - \( i_(- \, A) f_A \)_(*) \( b \) = 0 . $
  An infinite-order element remains nonzero after tensoring with $bb(Q)$,
    so $alpha ⊗ 1$ is a nonzero element of the kernel of the rationalized maximal coarse assembly map. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~F.~Atiyah, #emph[K-Theory], notes by D.~W.~Anderson, W.~A.~Benjamin, New York--Amsterdam, 1967.]
#bibitem([2])[B.~Bekka, P.~de~la~Harpe, and A.~Valette, #emph[Kazhdan's Property~\(T)],
  New Mathematical Monographs, vol.~11, Cambridge University Press, Cambridge, 2008.
  #link("https://doi.org/10.1017/CBO9780511542749")[doi:10.1017/CBO9780511542749].]
#bibitem([3])[B.~Blackadar, #emph[K-Theory for Operator Algebras], second ed.,
  Mathematical Sciences Research Institute Publications, vol.~5, Cambridge University Press, Cambridge, 1998.]
#bibitem([4])[X.~Chen, Q.~Wang, and G.~Yu, The maximal coarse Baum--Connes conjecture for spaces which admit a
  fibred coarse embedding into Hilbert space, #emph[Adv. Math.] #strong[249] (2013), 88--130.
  #link("https://doi.org/10.1016/j.aim.2013.09.003")[doi:10.1016/j.aim.2013.09.003].]
#bibitem([5])[J.~Deng, L.~Guo, Q.~Wang, and G.~Yu, Higher index theory for spaces with an FCE-by-FCE structure,
  #emph[J. Funct. Anal.] #strong[288] (2025), no.~1, article~110679.
  #link("https://doi.org/10.1016/j.jfa.2024.110679")[doi:10.1016/j.jfa.2024.110679].]
#bibitem([6])[A.~N.~Dranishnikov, S.~C.~Ferry, and S.~Weinberger, Large Riemannian manifolds which are flexible,
  #emph[Ann. of Math.] (2) #strong[157] (2003), no.~3, 919--938.
  #link("https://doi.org/10.4007/annals.2003.157.919")[doi:10.4007/annals.2003.157.919].]
#bibitem([7])[G.~Gong, Q.~Wang, and G.~Yu, Geometrization of the Strong Novikov Conjecture for residually finite
  groups, #emph[J. Reine Angew. Math.] #strong[621] (2008), 159--189.
  #link("https://doi.org/10.1515/CRELLE.2008.061")[doi:10.1515/CRELLE.2008.061].]
#bibitem([8])[L.~Guo, Q.~Wang, and C.~Zhang, The maximal coarse Baum--Connes conjecture for spaces that admit an
  A-by-FCE coarse fibration structure, #emph[J. Noncommut. Geom.], published online December~11, 2025.
  #link("https://doi.org/10.4171/JNCG/639")[doi:10.4171/JNCG/639].]
#bibitem([9])[N.~Higson, V.~Lafforgue, and G.~Skandalis, Counterexamples to the Baum--Connes conjecture,
  #emph[Geom. Funct. Anal.] #strong[12] (2002), no.~2, 330--354.
  #link("https://doi.org/10.1007/s00039-002-8249-5")[doi:10.1007/s00039-002-8249-5].]
#bibitem([10])[N.~Higson and J.~Roe, On the coarse Baum--Connes conjecture, in #emph[Novikov Conjectures,
  Index Theorems and Rigidity, Vol.~2], S.~Ferry, A.~Ranicki, and J.~Rosenberg (eds.),
  London Mathematical Society Lecture Note Series, vol.~227, Cambridge University Press, Cambridge, 1995,
  pp.~227--254. #link("https://doi.org/10.1017/CBO9780511629365.008")[doi:10.1017/CBO9780511629365.008].]
#bibitem([11])[N.~Higson and J.~Roe, #emph[Analytic K-Homology], Oxford Mathematical Monographs,
  Oxford University Press, Oxford, 2000.
  #link("https://doi.org/10.1093/oso/9780198511762.001.0001")[doi:10.1093/oso/9780198511762.001.0001].]
#bibitem([12])[D.~A.~Kazhdan, Connection of the dual space of a group with the structure of its close subgroups,
  #emph[Funct. Anal. Appl.] #strong[1] (1967), no.~1, 63--65.
  #link("https://doi.org/10.1007/BF01075866")[doi:10.1007/BF01075866].]
#bibitem([13])[OpenAI, A counterexample to the coarse Novikov conjecture,
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-counterexample-to-the-coarse-Novikov-conjecture-September-23-2026/paper.pdf")[OAI:A-counterexample-to-the-coarse-Novikov-conjecture-September-23-2026],
  2026.]
#bibitem([14])[H.~Oyono-Oyono and G.~Yu, K-theory for the maximal Roe algebra of certain expanders, #emph[J.
  Funct. Anal.] #strong[257] (2009), no.~10, 3239--3292.
  #link("https://doi.org/10.1016/j.jfa.2009.04.017")[doi:10.1016/j.jfa.2009.04.017].
  #link("https://arxiv.org/abs/0902.2317v1")[arXiv:0902.2317v1] (numbered citations follow this version).]
#bibitem([15])[J.~Roe, #emph[Coarse Cohomology and Index Theory on Complete Riemannian Manifolds],
  Memoirs of the American Mathematical Society, vol.~104, no.~497, American Mathematical Society, Providence,
  RI, 1993. #link("https://doi.org/10.1090/memo/0497")[doi:10.1090/memo/0497].]
#bibitem([16])[T.~Schick and M.~Seyedhosseini, On an index theorem of Chang, Weinberger and Yu, #emph[Münster J.
  Math.] #strong[14] (2021), no.~1, 123--154. #link("https://doi.org/10.17879/59019522628")[doi:10.17879/59019522628].]
#bibitem([17])[G.~Skandalis, J.-L.~Tu, and G.~Yu, The coarse Baum--Connes conjecture and groupoids,
  #emph[Topology] #strong[41] (2002), no.~4, 807--834.
  #link("https://doi.org/10.1016/S0040-9383(01)00004-0")[doi:10.1016/S0040-9383(01)00004-0].]
#bibitem([18])[J.~Špakula and R.~Willett, Maximal and reduced Roe algebras of coarsely embeddable spaces, #emph[J.
  Reine Angew. Math.] #strong[678] (2013), 35--68.
  #link("https://doi.org/10.1515/crelle.2012.019")[doi:10.1515/crelle.2012.019].]
#bibitem([19])[R.~Willett and G.~Yu, Higher index theory for certain expanders and Gromov monster groups,~I,
  #emph[Adv. Math.] #strong[229] (2012), no.~3, 1380--1416.
  #link("https://doi.org/10.1016/j.aim.2011.10.024")[doi:10.1016/j.aim.2011.10.024].]
#bibitem([20])[G.~Yu, The Novikov conjecture for groups with finite asymptotic dimension, #emph[Ann.
  of Math.] (2) #strong[147] (1998), no.~2, 325--355. #link("https://doi.org/10.2307/121011")[doi:10.2307/121011].]
#bibitem([21])[G.~Yu, The coarse Baum--Connes conjecture for spaces which admit a uniform embedding into Hilbert
  space, #emph[Invent. Math.] #strong[139] (2000), no.~1, 201--240.
  #link("https://doi.org/10.1007/s002229900032")[doi:10.1007/s002229900032].]
