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

#align(center)[#text(size: 16pt, weight: "bold")[Filtered products and boundary-preserving \
compression in complex cobordism]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

We study when a map into a product of cubes can be moved onto many coordinate boundaries while retaining every
  boundary value already present. The input spaces may have arbitrarily large, or infinite, covering dimension.
  The obstruction we use is a relative point class in complex cobordism,
  tested against a family of vectors supported in only a few cube factors.
  Our main results convert the vanishing of this class into compression on arbitrarily large Cartesian powers.

The proof has two coherence requirements. A cobordism-null map on one subcomplex must give a single stable
  nullhomotopy on a union of products, including all their intersections.
  Subsequently, stable avoidance data on small coordinate boxes must agree on adjacent simplices.
  We prove both compatibility statements explicitly. A padding construction then removes the dimension restriction
  needed to turn stable avoidance into an actual map.

=== 1.1 Coherent products <coherent-products>

Write $bb(S)$ for the sphere spectrum and $M U$ for the complex cobordism spectrum.
  A based map is #emph[stably null] if its suspension spectrum is nullhomotopic.
  The unit $bb(S) arrow.r M U$ sends a stable cohomotopy class to its complex-cobordism class.
  Our first result concerns the difference between vanishing on a subcomplex and vanishing on an entire family of
  products.

#thm([Theorem 1.1.])[
  (Filtered products).  #emph[Let $G subset E$ be a finite pointed CW pair, let $d gt.eq 0$ be an integer,
    and let $v : E arrow.r S^d$ be a based map. Suppose that the composite
$ Sigma^oo G arrow.r Sigma^oo E arrow.r^(Sigma^oo v) Sigma^d bb(S) arrow.r Sigma^d M U $

 is nullhomotopic. For $ell gt.eq 1$, let $U_ell subset E^(and ell)$ be the union of the subcomplexes in which at
   least $ceil.l ell \/ 2 ceil.r$ factors are required to belong to $G$.
   Then, for every sufficiently large $ell$, the restriction
$ v^(and ell) \|_(U_ell) : U_ell arrow.r S^(d ell) $

 is stably nullhomotopic.]
] <thm:filtered-product>

The conclusion concerns the union itself. It therefore supplies a nullhomotopy that can be pulled back along any
  map into that union. The fraction $1 \/ 2$ may be replaced by any fixed positive fraction; see 9.
  The proof also gives a more general compatible lift for an arbitrary commutative ring spectrum,
  before invoking a vanishing theorem for $M U$. Its target is the total fiber of a cube of unit maps.
  To produce one null cone over the punctured cube, we use simplex parameters that collapse the entire constrained
  union at once; the number of restricted factors determines how many simplex degrees collapse.

=== 1.2 Cube slots and the torus criterion <cube-slots-and-the-torus-criterion>

For positive integers $t \, n$, put

$ C \( t \, n \) = \( \[ - 1 \, 1 \]^t \)^n \, wide T \( t \, n \) = \( \[ - 2 \, 2 \]^t \)^n . $

A point has $n$ ordered #emph[slots], each a vector in $bb(R)^t$.
  A boundary slot belongs to the whole boundary $partial \[ - 1 \, 1 \]^t$.
  Preserving it means preserving its entire vector, including scalar coordinates that lie in $\( - 1 \, 1 \)$.
  All distances between cube points use the maximum norm. For a real number $s$, define the sparse parameter arrangement

$ Z_s \( t \, n \) = { z in T \( t \, n \) : \# { j : z_j eq.not 0 } lt.eq s } . $

Thus it permits at most $floor.l s floor.r$ nonzero whole slots; $Z_s = diameter$ for $s < 0$, and $Z_s =
  T \( t \, n \)$ for $s gt.eq n$. For $0 lt.eq s < n$ its dimension is $t floor.l s floor.r$.
  For $f : Y arrow.r C \( t \, n \)$, the map $f^(times u) : Y^u arrow.r
  C \( t \, u n \)$ concatenates the values of $f$, in copy order and then slot order.

The following torus data will turn a bundle embedding into a vanishing point class. Fix $c = 1 \/ 32$.
  For each positive integer $p$, choose a smooth embedding

$ L tilde.equiv \( bb(T)^2 \)^p subset \( - c \, c \)^(2 p + 1) $

with a framed real normal line. Choose line bundles $lambda_i$,
  each pulled back from the $i$th two-torus factor and embedded in $bb(C)^2$, so that

$ H = xor.big_(i = 1)^p lambda_i subset L times bb(C)^(2 p) \,
  wide ⟨product_(i = 1)^p c_1 \( lambda_i \) \, \[ L \]⟩ = 1 . $

18 constructs these data. Here $p$ is a rank parameter, with no primality assumption.

#prodef([Notation 1.2.])[
  (Torus locus and slot bundle).  On $L^n$ put
  $ H_n = xor.big_(j = 1)^n "pr"_j^(*) H subset L^n times bb(C)^(2 p n) . $
  For $f : Y arrow.r C \( 2 p + 1 \, n \)$ and $Z subset T \( 2 p + 1 \, n \)$, let
  $ cal(T) \( f \, Z \) = { \( y \, z \) in Y times Z : f \( y \) - z in L^n } \, wide d_f \( y \, z \) =
    f \( y \) - z . $
  The #emph[slot bundle] on this locus is $E_f = d_f^(*) H_n$, of complex rank $p n$,
    with its fixed embedding in the trivial bundle of rank $2 p n$.
] <not:torus-bundle>

#thm([Theorem 1.3.])[
  (Torus compression).  #emph[Let $p \, n gt.eq 1$ be integers, put $t = 2 p + 1$, and choose $L \, H$ as above.
    Let $0 < a < 1 \/ 16$, let $Y$ be any compact metrizable space, and let $f : Y arrow.r
    C \( t \, n \)$ be continuous. Suppose there is one continuous complex bundle monomorphism
$ E_f arrow.r cal(T) \( f \, Z_(a n) \( t \, n \) \) times bb(C)^K $

 over the entire locus $cal(T) \( f \, Z_(a n) \( t \, n \) \)$, for a nonnegative integer $K < 2 p n$.
   Then for every integer $U gt.eq 1$ there are an integer $u gt.eq U$ and a continuous map
$ G : Y^u arrow.r C \( t \, u n \) $

 such that at least $\( a \/ 8 \) u n$ slots of $G \( upright(bold(y)) \)$ lie in $partial \[ - 1 \, 1 \]^t$ for
   every $upright(bold(y)) = \( y_0 \, dots.h \, y_(u - 1) \)$. Moreover, for $0 lt.eq b < u$ and $1 lt.eq j lt.eq n$,
$ f_j \( y_b \) in partial \[ - 1 \, 1 \]^t quad arrow.r.double quad G_(b \, j) \( upright(bold(y)) \) =
  f_j \( y_b \) . $

]
] <thm:torus-compression>

The bundle hypothesis includes continuous dependence on the sparse parameter as its support changes.
  Since the boundary count is an integer, its stated lower bound means at least $ceil.l \( a \/ 8 \) u n
  ceil.r$ slots. The theorem also includes an empty torus locus;
  on a nonempty locus the embedding itself forces $K gt.eq p n$.
  The power $u$ can be arbitrarily large, as stated, and the theorem requires no dimension bound on $Y$.
  The strict rank inequality is essential for this general criterion:
  already for $n = 1$ and $K = 2 p$, the identity map of a cube admits the canonical bundle embedding but no
  boundary-preserving compression with a positive boundary count; see 21.
  This example does not address the optimal boundary fraction under the strict inequality.

=== 1.3 Background and the proof mechanism <background-and-the-proof-mechanism>

The nilpotence theorem of Devinatz–Hopkins–Smith #cite(label("DevinatzHopkinsSmith1988")) provides the
  stable-homotopy background for detecting smash-nilpotence by complex cobordism.
  Here we need the quantitative connective form developed by Mathew #cite(label("Mathew2018")) Section 3.4 and
  recorded for $B P$ in Burklund’s appendix #cite(label("BurklundHahnSenger2023")) Appendix B.
  Its cutoff is sublinear in the degree and uniform over all connective spectra at a fixed prime.
  This uniform statement, together with explicit upper cell bounds,
  converts a linearly growing Adams filtration into vanishing.
  The relation between unit-fiber powers, Adams towers and the cobar construction is standard
  #cite(label("MathewNaumannNoel2017")) Section 2.1, Propositions 2.11 and 2.14.
  The compatible null cone on the whole constrained product union is constructed in 2.

The geometric step belongs to the collapse-and-duality framework of Thom and Atiyah #cite(label("Thom1954"))
  #cite(label("Atiyah1961Thom")). We prove the precise local duality needed for finite unions of coordinate
  planes, including its variance under changes of boxes and arrangements.
  A single relative nullhomotopy then gives a compatible stable lift over all simplices.
  Related stable obstruction criteria for sections in a connectivity range appear in #cite(label("Larmore1972"))
  Theorems 4.2–4.3 and #cite(label("KleinWilliams2007")) Corollary 3.5.
  Here relative support and nested boxes keep the lift compatible and control its displacement.
  Freudenthal stabilization, in the form recalled in #cite(label("Hatcher2002")) Corollary 4.24,
  turns it into a small actual displacement when the parameter dimension is in the indicated range.
  The singular arrangement and diagram compatibility assertions used here are proved in 3.

The bundle criterion is related to the complementary-bundle Chern obstructions used by Hirshberg–Phillips in their
  lower bounds for the radius of comparison; see the proof of Theorem 3.3 in their author preprint
  #cite(label("HirshbergPhillips2022")). We work with a supported point class in $M U$.
  The characteristic-class framework is classical; see Quillen #cite(label("Quillen1971Cobordism")) and the
  precise orientation and Thom formulas in #cite(label("Lurie2010")) Lectures 5–6.
  If $r = p n$, the complementary bundle has rank less than $r$,
  which forces the product of the $r$ square-zero Chern classes to vanish.
  A framed real Thom class and relative excision then give vanishing of the supported point class.
  These steps retain the whole sparse parameter locus.

The resulting theorem can be used in cover constructions.
  Fix a homeomorphism from the cube to a simplex carrying boundary to boundary.
  A boundary output then has at least one zero simplex coordinate.
  Preserving an original boundary vector retains the entire corresponding simplex point,
  and hence every coordinate that was already zero; this is the agreement used in the companion’s reconstruction
  lemma #cite(label("OpenAIRadiusMeanDimension2026")) Lemma 4.3.
  The companion #cite(label("OpenAIRadiusMeanDimension2026")) Theorem 1.1 uses 3,
  together with dynamical comparison and cover reconstruction, to prove $"rc" \( C \( X \) times.r_h bb(Z) \) =
  1 / 2 "mdim" \( X \, h \)$ for every minimal homeomorphism $h$ of an infinite compact metrizable space $X$,
  with both sides allowed to be infinite. Here $"rc"$ denotes radius of comparison and $"mdim"$ denotes mean dimension.

Here is the sequence of constructions in the proof.

+ A point test for $f : P arrow.r C \( t \, n \)$ collapses the difference $f \( x \) - z$ near the origin,
  with $z$ in a prescribed parameter arrangement. Product point tests are smash products.
  1 therefore promotes $M U$-vanishing of a sparse test to stable vanishing for a large batch of copies.
+ Compatible local duality converts stable test vanishing into a map avoiding the sparse arrangement.
  An elementary radial normalization creates boundary slots and restores all original boundary vectors exactly.
+ At each new batch, we keep only the old output as a parameter. Its dimension is bounded by its ambient cube.
  A fixed number of initial unchanged batches then keeps every step within the stable avoidance range.
  The resulting boundary fraction is at least $a \/ 8$ for arbitrarily large powers.
+ The torus-bundle embedding forces the $M U$ point test to vanish.
  For an arbitrary compact metrizable $Y$, finitely many auxiliary coordinates give a polyhedral model,
  while including every coordinate of $f$ preserves $f$ exactly.
  Compression on that model pulls back with the same boundary agreement.

2 proves the filtered-product theorem. 3 develops the point tests, local duality and stable avoidance.
  4 proves the general $M U$-null boundary-compression theorem by padding.
  5 establishes the bundle criterion and the exact compact-to-polyhedral reduction, completing 3.

=== 1.4 Conventions <conventions>

Finite polyhedra and their pairs may be subdivided as needed.
  A quotient $K \/ L$ means $K_(+) \/ L_(+)$, where $+$ adjoins a disjoint basepoint; in particular,
  $K \/ diameter = K_(+)$. Suspension spectra, smash products, cofibers and limits of spectra are derived.
  The notation $F \( K \, E \)$ denotes the function spectrum.
  We retain suspension shifts whenever connectivity or cell dimensions are used.
  A spectrum is $b$-connective when its homotopy groups in degrees below $b$ vanish.

== 2 Compatible smash products and quantitative nilpotence <sec:filtered-products>

The topological argument will produce a complex-cobordism class which vanishes on a finite pointed subspace.
  We need the corresponding stable cohomotopy class to vanish on a union of products.
  The compatibility on the intersections of these products is essential.
  The following result provides it with a fixed positive proportion of restricted factors.

Our goal is 1. We first build a lift through a power of the unit fiber on the entire union.
  We then use quantitative nilpotence at finitely many primes and a separate connectivity estimate at all larger
  primes. The latter step makes the eventual product threshold independent of the prime.

All constructions with spectra in this section are derived,
  and a commutative ring spectrum means an $bb(E)_oo$ ring spectrum.
  A spectrum is $b$-connective if its homotopy groups below degree $b$ vanish.
  We write $\[ K \, Y \]$ for the group of homotopy classes of maps of spectra and $"Map" \( K \, Y \)$ for their
  mapping space. For a ring spectrum $R$ under the sphere, put

$ I_R = "fib" \( bb(S) arrow.r R \) \, wide phi_(R \, n) : I_R^(and n) arrow.r bb(S) . $

The second map is the smash product of the $n$ fiber inclusions, with $I_R^(and 0) = bb(S)$.
  In a prime-local category, the sphere in this notation is $bb(S)_(\( p \))$.

We use the commutative Thom-spectrum model of $M U$ and its canonical complex orientation as recalled in
  #cite(label("Lurie2010")) Lecture 6, Remarks 5 and 7 and Theorem 8.

A map $K arrow.r Y$ has $R$-Adams filtration at least $n$ if it lifts through

$ phi_(R \, n) and "id"_Y : I_R^(and n) and Y arrow.r Y . $

=== 2.1 A compatible lift on the union <a-compatible-lift-on-the-union>

A map to the sphere which becomes null after applying the unit $bb(S) arrow.r R$ lifts through $I_R$.
  On a product with $n$ restricted factors, this suggests a lift through $I_R^(and n)$.
  The difficulty is making these lifts agree where different choices of restricted factors meet.
  We construct one lift on the whole union.

#thm([Proposition 2.1.])[
  (Compatible Adams lift).  #emph[Let $R$ be a commutative ring spectrum,
    let $G subset E$ be a finite pointed CW pair, let $d in bb(Z)$, and let $v : Sigma^oo E arrow.r
    Sigma^d bb(S)$ be a stable map whose restriction to $Sigma^oo G$ becomes null in $Sigma^d R$.
    For integers $1 lt.eq n lt.eq ell$, let $U_(ell \, n) subset
    E^(and ell)$ be the union requiring at least $n$ factors in $G$. Then the restriction of $v^(and ell)$ admits a lift
$ Sigma^oo U_(ell \, n) arrow.r Sigma^(d ell) I_R^(and n) $

 through $Sigma^(d ell) phi_(R \, n)$.]
] <prop:compatible-adams-lift>

We describe the finite diagram in which the lift will be constructed.
  Let $cal(P)_n^times$ be the poset of nonempty subsets of ${ 1 \, dots.h \, n }$.
  Give a subset $S$ the value $R^(and \| S \|)$, with maps inserting units along subset inclusions.
  Adjoining the sphere at the empty subset gives the $n$-fold cube of units. The fiber of its unit-cone map

$ bb(S) arrow.r "holim"_(S in cal(P)_n^times) R^(and \| S \|) $

is $I_R^(and n)$, as we verify at the end of the proof. It therefore suffices to null the composite of
  $v^(and ell) \|_(U_(ell \, n))$ with the $d ell$-fold suspension of this map.

We will produce this nullhomotopy by introducing simplex parameters.
  The given $R$-nullhomotopy on $G$ will supply compatible nullhomotopies at the vertices of every simplex.
  We distribute one simplex parameter among the $ell$ product factors so that in degree $j$ at most $j$ of the
  resulting parameters are away from vertices. When $j < n$,
  at least one of the $n$ restricted factors then receives a vertex and is collapsed.
  The following construction makes this distribution natural in the simplex.
  The relation between unit cubes and the cosimplicial cobar construction is recalled in
  #cite(label("MathewNaumannNoel2017")) Section 2.1, Propositions 2.11 and 2.14.

Let $Delta$ denote the simplex category, with objects $\[ j \] = { 0 \, dots.h \, j }$ and monotone maps.
  The topological simplices $Delta^j$ form a covariant functor:
  a monotone map sends a distribution on its source vertices to the pushforward distribution on its target
  vertices. Write $V^j subset Delta^j$ for the set of vertices.

#thm([Lemma 2.2.])[
  (Slicing a simplex).  #emph[For every $ell gt.eq 1$ there is a natural continuous map
$ rho = \( rho_1 \, dots.h \, rho_ell \) : Delta^j arrow.r \( Delta^j \)^ell $

 in the variable $\[ j \] in Delta$, such that at most $j$ of the points $rho_r \( x \)$ are nonvertices,
   for each $x in Delta^j$.]
] <lem:simplex-slicing>

#proof[
  For $x = \( x_0 \, dots.h \, x_j \)$ put $s_a = sum_(b < a) x_b$, so that $s_0 = 0$ and $s_(j + 1) = 1$.
    For $1 lt.eq r lt.eq ell$ define
  #[#set math.equation(numbering: n => "(2.1)")
   $ rho_r \( x \)_a = ell max {0 \, min (s_(a + 1) \, r / ell) - max (s_a \, frac(r - 1, ell))} \, wide 0 lt.eq
     a lt.eq j . $ <eq:simplex-slicing-formula>]
  This is $ell$ times the length of the intersection of $\[ s_a \, s_(a + 1) \]$ with the $r$th interval of length
    $1 \/ ell$. The coordinates are continuous, nonnegative, and sum to one.
  Every nonempty fiber of a monotone map $alpha : \[ j \] arrow.r \[ k \]$ is a consecutive block.
    Passing from $x$ to $alpha_(*) x$ merges the adjacent mass intervals in that block.
    The intersection length of the merged interval with a fixed slice equals the sum of its constituent
    intersection lengths. Empty fibers contribute zero. It follows that $alpha_(*) rho_r \( x \) =
    rho_r \( alpha_(*) x \)$ for every $r$. This verifies naturality for all maps of $Delta$, including its surjections.
  A nonvertex value $rho_r \( x \)$ requires at least one of the internal breaks $s_1 \, dots.h \,
    s_j$ to lie strictly between $\( r - 1 \) \/ ell$ and $r \/ ell$.
    Distinct such slices have disjoint interiors and therefore require distinct breaks.
    There are at most $j$ of them. Breaks lying at slice endpoints do not create nonvertex values. ◻
]

#figure(
  [(150,37) (0,28)(26,0)\[r\]mass intervals (32,28)(1,0)100 (32,26)(100,0)2(0,1)4 (62,26)(0,1)4 (102,26)(0,1)4 (47,32)(0,0)$x_0 = 3 \/ 10$ (82,32)(0,0)$x_1 = 2 \/ 5$ (117,32)(0,0)$x_2 = 3 \/ 10$ (62,15)(0,3)4(0,1)1.5 (102,15)(0,3)4(0,1)1.5 (0,13)(26,0)\[r\]four slices (32,13)(1,0)100 (32,11)(25,0)5(0,1)4 (44.5,6)(0,0)vertex (69.5,6)(0,0)nonvertex (94.5,6)(0,0)nonvertex (119.5,6)(0,0)vertex],
  caption: [Figure 1: Simplex slicing for $j = 2$ and $ell = 4$. Each slice records the proportions of the three mass intervals that it meets. A nonvertex value requires an internal mass break in the interior of that slice, so there can be at most $j$ such values. ],
) <fig:simplex-slicing>

1 shows the counting mechanism in 5. We now combine this distribution with one chosen nullhomotopy to construct
  the lift.

#proof[
  Work in the stable functor category $cal(D) = "Fun" \( Delta \, upright("Sp") \)$.
    Its equivalences, cofibers, and smash products are computed objectwise.
    Consider the cosimplicial commutative ring spectrum
  $ B^j = R^(and \( j + 1 \)) . $
  For a monotone map $alpha : \[ j \] arrow.r \[ k \]$, its structure map multiplies the factors in each fiber of
    $alpha$ and inserts a unit for each empty fiber. This describes its cofaces and codegeneracies,
    together with their coherences. In particular, the maps $\( B^j \)^(and ell) arrow.r
    B^j$ given by multiplication are natural in $\[ j \]$.
  #emph[The nullhomotopy on the vertices.] The functor $V$ is the covariant representable
    $"Hom"_Delta \( \[ 0 \] \, - \)$. Thus $Sigma^oo \( G and V_(+)^bullet \)$ is the left Kan extension of
    $Sigma^oo G$ from the object $\[ 0 \]$. The resulting adjunction is an equivalence of mapping spaces
  #[#set math.equation(numbering: n => "(2.2)")
   $ "Map"_(cal(D)) #scale(x: 120%, y: 120%)[\(] Sigma^oo \( G and V_(+)^bullet \) \,
     Sigma^d B^bullet #scale(x: 120%, y: 120%)[\)] tilde.eq "Map"_(upright("Sp")) \( Sigma^oo G \, Sigma^d R \) .
     $ <eq:vertices-yoneda>]
  Indeed, the left Kan extension in degree $j$ is the wedge of copies of $Sigma^oo G$ indexed by the $j +
    1$ maps $\[ 0 \] arrow.r \[ j \]$; the adjunction says that a map from this diagram is determined coherently
    by its value on the copy in degree zero.
  There is a natural map
  $ a : Sigma^oo \( E and Delta_(+)^bullet \) arrow.r Sigma^d B^bullet $
  which forgets the simplex coordinate and applies $v$ followed by the unit.
    Its restriction to $G and V_(+)^bullet$ corresponds under (2.2) to the assumed null map into $Sigma^d R$.
    Choose a nullhomotopy there. The mapping-space adjunction supplies a single natural nullhomotopy on the vertex
    diagram. The cofiber universal property therefore gives a map
  $ psi : Q^bullet arrow.r Sigma^d B^bullet \, wide Q^j = Sigma^oo (frac(E and Delta_(+)^j, G and V_(+)^j)) \, $
  and a homotopy $psi q tilde.eq a$ in $cal(D)$, where $q$ is the quotient map.
    The displayed ordinary quotients compute the derived cofibers:
    the inclusion of the indicated pointed CW subspace is a cofibration in each degree.
    This also permits us to use the actual collapse maps in the next step.
  #emph[Collapse on the whole union.] Put $U = U_(ell \, n)$. The maps of 5 give a natural map of pointed spaces
  $ U and Delta_(+)^j arrow.r \( E and Delta_(+)^j \)^(and ell) \,
    quad \( x_1 and dots.h.c and x_ell \, x \) mapsto and.big_(r = 1)^ell \( x_r \, rho_r \( x \) \) . $
  Follow it by the smash of the quotient maps to obtain, after suspension, a map into $\( Q^j \)^(and ell)$.
    If $j < n$, at least $n$ of the factors $x_r$ belong to $G$,
    while at most $j$ of the simplex parameters $rho_r \( x \)$ are nonvertices.
    Some factor is consequently in $G and V_(+)^j$ and is collapsed. The resulting map
  #[#set math.equation(numbering: n => "(2.3)")
   $ Sigma^oo \( U and Delta_(+)^j \) arrow.r \( Q^j \)^(and ell) $ <eq:sliced-union-collapse>]
  is the zero map for every $j < n$. It is the zero natural transformation on these degrees,
    since it is already a literal collapse on the diagrams of spaces.
  Compose (2.3) with $psi^(and ell)$ and multiplication to obtain a natural map into $Sigma^(d ell) B^j$.
    Smashing the chosen factorization homotopy $psi q tilde.eq
    a$ and then multiplying identifies this map with the map which forgets the simplex coordinate and applies
    $v^(and ell) \|_U$ followed by the unit. This identification is natural:
    each map $a$ forgets its own simplex parameter, so it is independent of the particular values of $rho_r \( x \)$.
  The natural projection
  $ Sigma^oo \( U and Delta_(+)^bullet \) arrow.r "const" \( Sigma^oo U \) $
  is an objectwise equivalence, since every $Delta^j$ is contractible.
    Invert this equivalence in the functor category and restrict to the full subcategory $Delta_(lt.eq n - 1)$.
    We have proved that the cone
  $ "const" \( Sigma^oo U \) arrow.r "const" \( Sigma^(d ell) bb(S) \) arrow.r Sigma^(d ell) B^bullet $
  is null on that subcategory. Inverting an objectwise equivalence here does not require a natural choice of a
    simplex vertex or a natural contraction of the simplices.
  #emph[Restriction to the unit cube.] The rule
  $ S mapsto \[ \| S \| - 1 \] $
  defines a functor from the punctured cube $cal(P)_n^times$ to $Delta_(lt.eq n - 1)$:
    an inclusion of subsets induces the ordered injection on their enumerations.
    Restricting $B^bullet$ gives the diagram $S mapsto R^(and \| S \|)$, whose maps insert units.
    The null cone just constructed therefore yields a null composite
  #[#set math.equation(numbering: n => "(2.4)")
   $ Sigma^oo U arrow.r^(v^(and ell)) Sigma^(d ell) bb(S) arrow.r
     Sigma^(d ell) "holim"_(S in cal(P)_n^times) R^(and \| S \|) . $ <eq:unit-cube-null-cone>]
  Only restriction of cones is used; no assertion about cofinality or an identification of partial totalizations
    is needed.
  Adjoin the value $bb(S)$ at the empty subset. The resulting $n$-cube is the external smash product of $n$ copies
    of $bb(S) arrow.r R$. Its total fiber is $I_R^(and n)$. To verify this,
    compute fibers successively in its $n$ directions. Taking the fiber in the last direction replaces every map
    $C and bb(S) arrow.r C and R$ by $C and I_R$, because smash with $C$ preserves finite fiber sequences in
    spectra. Induction on the remaining directions gives $I_R^(and n)$.
    Successive fibers compute the fiber of the initial vertex over the limit of the punctured cube.
    For two directions the relevant identity is
  $ "fib" \( A arrow.r B times_D C \) tilde.eq "fib" #scale(x: 120%, y: 120%)[\(] "fib" \( A arrow.r B \) arrow.r
    "fib" \( C arrow.r D \) #scale(x: 120%, y: 120%)[\)] \, $
  obtained by expressing each fiber as a pullback over zero.
    Repeated application gives the assertion for any number of directions, because finite limits commute.
    Thus there is a fiber sequence
  $ I_R^(and n) arrow.r^(phi_(R \, n)) bb(S) arrow.r "holim"_(S in cal(P)_n^times) R^(and \| S \|) . $
  The chosen nullhomotopy in (2.4) gives the required lift through its suspended fiber. ◻
]

=== 2.2 The quantitative nilpotence input <the-quantitative-nilpotence-input>

The preceding proposition gives Adams filtration at least the number of restricted factors.
  To turn this lift into vanishing, we use a quantitative form of nilpotence for $M U$.
  Its cutoff is sublinear in the degree and uniform over connective spectra at a fixed prime.
  We state it as a null action on a truncated sphere, the form needed below for finite sources which may have
  negative-degree cells. We write $tau_(< k) X$ for the Postnikov truncation of $X$ retaining homotopy groups in
  degrees below $k$.

#thm([Theorem 2.3.])[
  (Quantitative nilpotence).  #emph[Fix a prime $p$, and let $R$ be either $M
    U_(\( p \))$ or the Brown–Peterson spectrum $B P$ at that prime.
    For $k gt.eq 1$, let $f_R \( k \)$ be the least integer $n gt.eq 0$ for which
#[#set math.equation(numbering: n => "(2.5)")
 $ I_R^(and n) and tau_(< k) bb(S)_(\( p \)) arrow.r^(phi_(R \, n) and "id") tau_(< k) bb(S)_(\( p \))
   $ <eq:nilpotence-truncated-action>]

 is nullhomotopic. These integers exist and satisfy
$ lim_(k arrow.r oo) frac(f_R \( k \), k) = 0 . $

 Equivalently, $f_R \( k \)$ is the least $n$ such that, for every connective $p$-local spectrum $X$ and every
   $i < k$, a class in $pi_i X$ of $R$-Adams filtration at least $n$ is zero.]
] <thm:quantitative-nilpotence>

For $M U_(\( p \))$, this is #cite(label("Mathew2018")) Definitions 2.28 and 3.26, Proposition 3.28,
  and Theorem 3.30. For $B P$, the same formulation and its sublinear bound are recorded in
  #cite(label("BurklundHahnSenger2023")) Definition B.3, the discussion following Remark B.4,
  and Proposition B.15. Both rings are connective, have degree-zero homotopy $bb(Z)_(\( p \))$,
  and have finitely generated homotopy in every degree, as required in those statements.

The truncated action gives the formulation for all connective spectra directly.
  If (2.5) is null, smash it with a connective $p$-local spectrum $X$. The map

$ X arrow.r X and tau_(< k) bb(S)_(\( p \)) $

is an isomorphism on homotopy in degrees below $k$: its fiber is $X and tau_(gt.eq k) bb(S)_(\( p \))$,
  which is $k$-connective. A class with the asserted lift maps to zero on the right and therefore was zero in $pi_i X$.

For our application, the key consequence is a null map into the truncated sphere itself.
  Precomposing (2.5) with the truncation unit $eta_k : bb(S)_(\( p \)) arrow.r
  tau_(< k) bb(S)_(\( p \))$ in its second factor gives

#[#set math.equation(numbering: n => "(2.6)")
 $ eta_k compose phi_(R \, n) = 0 wide \( n gt.eq f_R \( k \) \) . $ <eq:nilpotence-truncated-composite>]

The assertion for $n > f_R \( k \)$ follows by applying the fiber inclusions to the additional smash factors.

The next observation explains how truncation detects maps from the finite complexes occurring here.
  It uses an upper bound on cell degrees, without requiring the source to be connective.

#thm([Lemma 2.4.])[
  (Detection by truncation).  #emph[Suppose that a finite spectrum $K$ has a finite cell presentation with all
    cell degrees at most $D$, either in spectra or in $p$-local spectra.
    If $Y$ is $\( D + 1 \)$-connective, then $\[ K \, Y \] = 0$. In particular, for every integer $k > D$, the map
$ \[ K \, bb(S)_(\( p \)) \] arrow.r \[ K \, tau_(< k) bb(S)_(\( p \)) \] $

 is injective.]
] <lem:cell-truncation>

#proof[
  For a single cell in degree $s lt.eq D$, the mapping group is $\[ S^s \, Y \] = pi_s Y = 0$.
    Attaching finitely many such cells proves the first assertion by induction:
    the cofiber of an attaching step is a finite wedge of these spheres,
    and the exact sequence obtained by mapping into $Y$ makes the mapping group of the enlarged complex zero when
    those of the preceding complex and the cofiber are zero. For the second assertion, apply the first to $Y =
    tau_(gt.eq k) bb(S)_(\( p \))$ and use the exact sequence obtained from the fiber sequence
  $ tau_(gt.eq k) bb(S)_(\( p \)) arrow.r bb(S)_(\( p \)) arrow.r tau_(< k) bb(S)_(\( p \)) . $
  ◻
]

=== 2.3 From local vanishing to integral vanishing <from-local-vanishing-to-integral-vanishing>

4 supplies a single lift of filtration proportional to the number of factors.
  We now show that the restricted product class vanishes once the product is large.
  At large primes a uniform connectivity estimate suffices,
  leaving only finitely many prime-dependent nilpotence thresholds.

#thm([Lemma 2.5.])[
  (The unit fiber at large primes).  #emph[For every odd prime $p$,
    the spectrum $B P$ is a retract of $M U_(\( p \))$ by unit-preserving maps of spectra, and
$ I_(B P) in upright("Sp")_(gt.eq 2 p - 3) . $

 Consequently a lift through $\( I_(M U) \)_(\( p \))^(and n)$ induces a lift through a spectrum which is
   $n \( 2 p - 3 \)$-connective.]
] <lem:bp-unit-connectivity>

#proof[
  The unit-preserving retract follows, for example, from the $bb(E)_4$ splitting of $M
    U_(\( p \))$ in #cite(label("BasterraMandell2013")) Theorem 1.1, the following paragraph, and Section 5.
    We use the underlying retract of spectra for ordinary homology and the forward map under $bb(S)_(\( p \))$ to
    transfer unit fibers.
  Let $C$ be the cofiber of $bb(S)_(\( p \)) arrow.r B P$. The mod-$p$ homology calculation in
    #cite(label("BasterraMandell2013")) Section 5 gives
  $ H_0 \( B P \; bb(F)_p \) = bb(F)_p \, wide H_i \( B P \; bb(F)_p \) = 0 quad \( 0 < i < 2 p - 2 \) . $
  The unit induces the degree-zero isomorphism, and $B P$ is connective.
    Its unit cofiber therefore has zero mod-$p$ homology in every degree below $2 p - 2$.
  The splitting above exhibits $B P$ as a retract of $M U_(\( p \))$.
    The ordinary integral homology of $M U$ is $bb(Z) \[ b_1 \, b_2 \, dots.h \]$, with $\| b_i \| =
    2 i$ #cite(label("Lurie2010")) Lecture 7, Proposition 2 and Corollary 3; in particular,
    it is finitely generated in every degree. Taking the retract and then the homology sequence of the unit
    cofiber shows that $H_i \( C \; bb(Z)_(\( p \)) \)$ is finitely generated in every degree.
    For each $i < 2 p - 2$, the universal coefficient sequence contains an injection
  $ H_i \( C \; bb(Z)_(\( p \)) \) \/ p H_i \( C \; bb(Z)_(\( p \)) \) arrow.r.hook H_i \( C \; bb(F)_p \) = 0 . $
  Nakayama’s lemma therefore gives $H_i \( C \; bb(Z)_(\( p \)) \) = 0$ for every $i < 2 p - 2$.
    The spectrum $C$ is connective. If it had a nonzero homotopy group below degree $2 p - 2$, let $b gt.eq
    0$ be the least such degree. The stable Hurewicz isomorphism in the first nonzero degree would give
    $pi_b \( C \) tilde.equiv H_b \( C \; bb(Z)_(\( p \)) \) = 0$, a contradiction.
    Thus $C$ is $\( 2 p - 2 \)$-connective, and $I_(B P) tilde.eq Sigma^(- 1) C$ is $\( 2 p - 3 \)$-connective.
  The map under the sphere induces a map $\( I_(M U) \)_(\( p \)) arrow.r
    I_(B P)$ commuting with the fiber inclusions. Smashing $n$ times proves the last assertion,
    since smash products add connectivity bounds. ◻
]

#proof[
  Put $e = dim E$, $n_ell = ceil.l ell \/ 2 ceil.r$, and
  $ K_ell = Sigma^(- d ell) Sigma^oo U_ell . $
  The finite subcomplex $U_ell subset E^(and ell)$ has cell dimension at most $e ell$, so $K_ell$ has upper cell degree
  #[#set math.equation(numbering: n => "(2.7)")
   $ D_ell = \( e - d \) ell . $ <eq:filtered-product-cell-bound>]
  The class under consideration is now a map $beta_ell : K_ell arrow.r bb(S)$.
    By 4, it lifts through $I_(M U)^(and n_ell)$.
  If $e < d$, 7 applied directly to the connective sphere shows that $beta_ell = 0$ for every $ell$.
    Assume henceforth that $e gt.eq d$ and put
  $ k_ell = \( e - d \) ell + 1 . $
  For a fixed prime $p$, localization of the lift gives a lift through $I_(M U_(\( p \)))^(and n_ell)$.
    If $e > d$, 6 gives
  $ f_(M U_(\( p \))) \( k_ell \) = o \( ell \) \, $
  so that $n_ell gt.eq f_(M U_(\( p \))) \( k_ell \)$ for all sufficiently large $ell$.
    If $e = d$, the same inequality eventually holds because $k_ell = 1$ is fixed and $n_ell arrow.r oo$.
    By (2.6), the composite of $\( beta_ell \)_(\( p \))$ with $tau_(< k_ell) bb(S)_(\( p \))$ is zero.
    By 7 and (2.7), $\( beta_ell \)_(\( p \)) = 0$. This proves eventual vanishing for each fixed prime.
  To obtain a single threshold, choose an integer $P gt.eq 2$ such that
  #[#set math.equation(numbering: n => "(2.8)")
   $ frac(2 p - 3, 2) > max \( e - d \, 0 \) wide upright("for every prime ") p > P .
     $ <eq:filtered-product-prime-cutoff>]
  For such a prime, 8 turns the lift of $\( beta_ell \)_(\( p \))$ into a lift through $I_(B P)^(and n_ell)$.
    Its target has connectivity at least
  $ n_ell \( 2 p - 3 \) gt.eq ell / 2 \( 2 p - 3 \) > \( e - d \) ell = D_ell . $
  The first assertion of 7 makes this lift zero, for every $ell$.
    Only the finitely many primes at most $P$ remain. Take the maximum of their eventual thresholds from the
    preceding paragraph. Above that maximum, $beta_ell$ vanishes after localization at every prime.
  Because $K_ell$ is finite, localization of its stable mapping group agrees with maps from its localization.
    One way to see this is the duality identity
  $ F \( K_ell \, bb(S) \) tilde.eq D K_ell \, wide \( D K_ell \)_(\( p \)) tilde.eq
    F \( \( K_ell \)_(\( p \)) \, bb(S)_(\( p \)) \) \, $
  where $D K_ell$ denotes the finite Spanier–Whitehead dual.
    An element of an abelian group which vanishes in every localization at a prime is zero.
    Indeed, an element of infinite order remains nonzero in every such localization,
    and a nonzero element of finite order remains nonzero at any prime dividing its order.
    Applying this to $\[ K_ell \, bb(S) \]$ gives $beta_ell = 0$ integrally, as required. ◻
]

#prodef([Remark 2.6.])[
  The same proof works with $ceil.l lambda ell ceil.r$ restricted factors for any fixed $0 < lambda lt.eq 1$.
    In 4, take $n = ceil.l lambda ell ceil.r$; in (2.8), replace $1 \/ 2$ by $lambda$.
    The finite pair affects the eventual value of $ell$, but imposes no lower bound on the positive proportion $lambda$.
] <rem:filtered-product-proportions>

== 3 Point tests and controlled avoidance <sec:stable-avoidance>

The next step turns a stable vanishing statement into a small change of a map.
  The parameter in the test records the points to be avoided.
  Keeping this parameter throughout the argument supplies the compatibility needed to make the changes on adjacent
  simplices agree.

=== 3.1 Point tests and their products <point-tests-and-their-products>

We use the cubes $C \( t \, n \)$ and $T \( t \, n \)$ and the sparse arrangements $Z_s \( t \, n \)$ from 1,
  and write $M = t n$. Coordinate subspaces below may also be specified by setting individual scalar coordinates
  to zero, so the terminology includes whole-slot conditions.
  A point test records equality with a parameter $z$ as a relative stable cohomotopy class.
  Its relative support is essential for the later control on displacement.

#prodef([Definition 3.1.])[
  (Point test).  Recall $c = 1 \/ 32$. Let $P$ be a finite polyhedron, let $f : P arrow.r C \( t \, n \)$ be PL,
    and let $Z subset.eq T \( t \, n \)$ be a subpolyhedron. Define
  $ A_c \( f \, Z \) & = { \( x \, z \) in P times Z : parallel f \( x \) - z parallel_oo gt.eq c } \,\
Q_c \( f \, Z \) & = \( P times Z \) \/ A_c \( f \, Z \) . $
  For $0 < rho < c$, take the oriented collapse $kappa_rho : bb(R)^M arrow.r
    S^M$ of the complement of $\( - rho \, rho \)^M$. The #emph[point test] is the based map
  #[#set math.equation(numbering: n => "(3.1)")
   $ phi_rho \( f \, Z \) : Q_c \( f \, Z \) arrow.r S^M \, wide \[ x \, z \] mapsto
     kappa_rho \( f \( x \) - z \) . $ <eq:point-test-map>]
  Its stable class is denoted by
  $ omega_(bb(S)) \( f \, Z \) in \[ Sigma^oo Q_c \( f \, Z \) \, Sigma^M bb(S) \] . $
  Composing with the unit $bb(S) arrow.r M U$ gives $omega_(M U) \( f \, Z \) in
    accent(M U, ̃)^M \( Q_c \( f \, Z \) \)$.
] <def:point-test>

One concrete choice of $kappa_rho$ is the smash product of $M$ oriented one-dimensional interval collapses,
  in the order of the scalar coordinates. Varying $rho$ gives a homotopy through maps constant outside
  $\( - c \, c \)^M$. More generally, any positively oriented collapse supported in that cube represents its
  relative generator and gives the same class. We may therefore shrink the support whenever necessary.
  The difference map is PL, so $A_c \( f \, Z \)$ is a subpolyhedron after a finite subdivision.
  The quotient in 10 is consequently a finite pointed polyhedron.

#thm([Lemma 3.2.])[
  (Restrictions and products).  #emph[Point tests are natural under pullback in the input and under restriction of
    the parameter set. In particular, if $Z subset.eq Z'$ are subpolyhedra of the same parameter cube,
    the induced map $Q_c \( f \, Z \) arrow.r Q_c \( f \, Z' \)$ identifies the former with a pointed
    subpolyhedron after a common subdivision.]
  #emph[Suppose $f_i : P_i arrow.r \[ - 1 \, 1 \]^(M_i)$ and $Z_i
    subset.eq \[ - 2 \, 2 \]^(M_i)$ are finitely many such data.
    With coordinates concatenated in order, there is a canonical based homeomorphism
#[#set math.equation(numbering: n => "(3.2)")
 $ Q_c (product_i f_i \, product_i Z_i) tilde.equiv and.big_i Q_c \( f_i \, Z_i \) . $ <eq:point-test-product-quotient>]

 Under the corresponding identification $S^(sum_i M_i) tilde.equiv and.big_i S^(M_i)$,
   the point test is the smash product of the point tests. The analogous equality for $M
   U$ uses the multiplication of $M U$.]
] <lem:point-test-products>

#proof[
  All restriction maps are induced by maps of the defining pairs.
    For the subpolyhedron assertion, triangulate $P times Z'$ so that $P times
    Z$ and $A_c \( f \, Z' \)$ are subpolyhedra. Collapsing the latter identifies no two points of the former
    except those already collapsed in $Q_c \( f \, Z \)$. Quotients of this finite polyhedral pair give the
    assertion, including the stated basepoint convention.
  For products the relative subset is exactly the union of the subsets on which at least one factor belongs to
    $A_c \( f_i \, Z_i \)$. Its quotient is the smash product of the individual quotients.
    Choosing all collapses as products of the same one-dimensional collapse makes the identity of maps literal.
    Composing with units and multiplying in $M U$ gives the last assertion. ◻
]

=== 3.2 Coordinate complements in boxes <coordinate-complements-in-boxes>

We record explicitly both the local duality and its compatibility.
  The equality-collapse pairing is a local version of the classical collapse and stable-duality constructions
  #cite(label("Thom1954")) #cite(label("Atiyah1961Thom")). We prove it here for coordinate arrangements,
  starting with one plane and passing to unions by excision.
  The proof will also identify the variance needed to assemble maps over the simplices of $P$.
  Write $T = \[ - 2 \, 2 \]^M$. A #emph[coordinate arrangement] in $T$ is a finite union of sets

$ L_J = { z in T : z_i = 0 upright(" for all ") i in J } \, wide J subset.eq { 1 \, dots.h \, M } . $

For a PL map $f : P arrow.r C \( t \, n \)$ from a finite polyhedron and a coordinate arrangement $Z$,
  our goal is to turn $omega_(bb(S)) \( f \, Z \) = 0$ into a displacement of size less than $1 \/
  2$ avoiding $Z$, provided $dim Z lt.eq M - q$ and $dim P lt.eq 2 q - 5$ for an integer $q gt.eq 1$.
  The local complements will be $\( q - 2 \)$-connected. Equality-collapse duality will identify the stable
  obstruction, and this connectivity will let us realize a compatible stable lift by actual maps in 14.

Consider finitely many pairs of full-dimensional closed axis-parallel boxes

#[#set math.equation(numbering: n => "(3.3)")
 $ B_alpha subset "int" B_alpha^(+) subset \( - 2 \, 2 \)^M . $ <eq:box-pairs>]

Assume that no coordinate endpoint is zero, and that corresponding coordinate intervals of $B_alpha$ and
  $B_alpha^(+)$ either both contain zero or both miss zero.
  In particular they meet precisely the same coordinate subspaces.
  Whenever the boxes are indexed by a partial order, we also require both families to be increasing in that order.

Choose $epsilon.alt > 0$ smaller than the absolute value of every endpoint of every box.
  If $Z$ is a nonempty arrangement other than $T$, write $Z =
  union.big_(J in cal(J)) L_J$ with every $J$ nonempty, and put

$ d_Z \( y \) = min_(J in cal(J)) max_(i in J) \| y_i \| \, wide U_epsilon.alt \( Z \) = { y in T :
  d_Z \( y \) < epsilon.alt } \, wide V_alpha \( Z \) = B_alpha \\ U_epsilon.alt \( Z \) . $

Here $d_Z$ is exactly the maximum-norm distance to $Z$: setting the specified coordinates to zero stays inside
  $T$. For the empty and full arrangements put $U_epsilon.alt \( diameter \) =
  diameter$ and $U_epsilon.alt \( T \) = T$.

#thm([Lemma 3.3.])[
  (Thickened complements).  #emph[For sufficiently small $epsilon.alt$ as above, the inclusion
$ V_alpha \( Z \) arrow.r B_alpha \\ Z $

 is a strong deformation retract equivalence, simultaneously for all the boxes.
   The homotopy fixes $V_alpha \( Z \)$ pointwise, preserves each box, and preserves the set of zero coordinates.
   If $dim Z lt.eq M - q$ for an integer $q gt.eq 1$, then a nonempty such complement is $\( q - 2 \)$-connected.]
] <lem:coordinate-thickening>

#proof[
  The empty and full arrangements are immediate. In the remaining case, for $y in.not Z$ set
  $ lambda \( y \) = max { 1 \, epsilon.alt \/ d_Z \( y \) } \, wide lambda_u \( y \) = 1 +
    u \( lambda \( y \) - 1 \) \, quad 0 lt.eq u lt.eq 1 . $
  Define a coordinatewise homotopy by
  #[#set math.equation(numbering: n => "(3.4)")
   $ H_u \( y \)_i = "sgn" \( y_i \) min { lambda_u \( y \) \| y_i \| \, max { \| y_i \| \, epsilon.alt } } \,
     $ <eq:coordinate-expansion>]
  with value zero when $y_i = 0$. It is continuous on $T \\ Z$:
    $lambda_u$ is locally bounded there, which also gives continuity at zero coordinates.
    Coordinates of magnitude at least $epsilon.alt$ are fixed.
    Each smaller coordinate is expanded, without changing sign, by at most enough to reach magnitude $epsilon.alt$.
  Every coordinate interval of a box either contains $\[ - epsilon.alt \, epsilon.alt \]$ or lies outside that
    interval. Thus (3.4) preserves even asymmetric boxes. Coordinate magnitudes never decrease,
    and zero coordinates remain zero, so the homotopy stays in the complement and preserves $V_alpha \( Z \)$ at
    every time. In fact it fixes that subspace pointwise, since $d_Z \( y \) gt.eq
    epsilon.alt$ implies $lambda \( y \) = 1$. If $d_Z \( y \) < epsilon.alt$,
    each set $J$ contains an index with $\| y_i \| gt.eq d_Z \( y \)$,
    and that coordinate has magnitude at least $epsilon.alt$ at time one.
    Hence $d_Z \( H_1 \( y \) \) gt.eq epsilon.alt$. This proves the retraction.
    The formula is the same for every box. In particular it applies to any compact family in the unthickened
    complement, with no need to move arbitrarily small nonzero coordinates discontinuously to a fixed radius.
  For connectivity, first move a compact family from the closed box into its interior without changing its zero
    coordinates: shrink intervals containing zero by a fixed factor in $\( 0 \, 1 \)$,
    and move the other intervals toward an interior point of the same sign.
    A map from $S^i$ into the complement, $i lt.eq q - 2$, can then be approximated by a PL map in the interior
    and extended over a triangulated $D^(i + 1)$ into the convex box.
    A sufficiently small generic perturbation of its vertices misses all the excluded subspaces, since
  $ \( i + 1 \) + \( M - q \) < M . $
  The perturbed boundary map is homotopic to the original within the complement.
    This proves the claimed connectivity, including path connectedness in the applicable range.
    Existence of a point in the complement when $q gt.eq 1$ follows from the same dimension observation.
    The retraction transfers connectivity to $V_alpha \( Z \)$. ◻
]

The local problem is to replace a map into $B_alpha$ by one with values in $V_alpha \( Z \)$.
  We first seek a lift after stabilization. The cofiber of the complement inclusion records its obstruction;
  the corresponding point test retains the parameters of $Z$ inside $B_alpha^(+)$.
  Define finite spectra and finite pointed test spaces by

#[#set math.equation(numbering: n => "(3.5)")
 $ cal(C)_alpha \( Z \) & = "cofib" (Sigma^oo V_alpha \( Z \)_(+) arrow.r Sigma^oo \( B_alpha \)_(+)) \,\
T_alpha \( Z \) & = Z \/ \( Z \\ "int" B_alpha^(+) \) . $ <eq:local-cofiber>]

The letter $T_alpha$ in (3.5) denotes a pointed quotient, rather than the parameter cube $T$.

#thm([Lemma 3.4.])[
  (Compatible local duality).  #emph[For the finite box families in (3.3),
    one sufficiently small collapse support gives equivalences
#[#set math.equation(numbering: n => "(3.6)")
 $ cal(C)_alpha \( Z \) tilde.eq F (Sigma^oo T_alpha \( Z \) \, Sigma^M bb(S)) . $ <eq:box-duality>]

 They are induced by collapse around equality and are natural both under box inclusions and under inclusions of
   coordinate arrangements. In the box variable the cofibers are covariant and the test spaces are contravariant,
   by quotient collapse. In the arrangement variable, the cofibers are contravariant and the test spaces are covariant.]
] <lem:box-duality>

#proof[
  Choose one $rho > 0$ with
  #[#set math.equation(numbering: n => "(3.7)")
   $ rho < epsilon.alt \, wide rho < min_alpha "dist"_oo #scale(x: 120%, y: 120%)[\(] B_alpha \,
     T \\ "int" B_alpha^(+) #scale(x: 120%, y: 120%)[\)] . $ <eq:common-collapse-radius>]
  All minima are positive, by finiteness and strict containment.
    The formula $\( y \, z \) mapsto kappa_rho \( y - z \)$ descends to a pairing
  #[#set math.equation(numbering: n => "(3.8)")
   $ cal(C)_alpha \( Z \) and Sigma^oo T_alpha \( Z \) arrow.r Sigma^M bb(S) . $ <eq:equality-pairing>]
  Indeed, if $y in V_alpha \( Z \)$ and $z in Z$, their distance is at least $epsilon.alt$.
    If $z in.not "int" B_alpha^(+)$ and $y in B_alpha$, the second inequality in (3.7) applies.
    These are exactly the two collapsed subspaces. Since $V_alpha \( Z \)$ is a subpolyhedron,
    its ordinary quotient by inclusion in $B_alpha$ represents the cofiber in (3.5).
  First take $Z = L_J$, with $r = \| J \|$ and $b = M - r$.
    If it misses $B_alpha$, some required coordinate is bounded away from zero by more than $epsilon.alt$,
    so $V_alpha \( Z \) = B_alpha$. It also misses $B_alpha^(+)$, and both sides of (3.6) are zero.
    Otherwise split the box into its normal and tangential factors, $B_alpha = B_N times B_T$. Then
  $ B_alpha \/ V_alpha \( L_J \) tilde.equiv (B_N \/ \( B_N \\ \( - epsilon.alt \, epsilon.alt \)^r \))
    and \( B_T \)_(+) tilde.eq S^r \, wide T_alpha \( L_J \) tilde.equiv S^b . $
  The conventions include $r = 0$ and $b = 0$. Fixing an interior point $w in
    B_T$ identifies the pairing with the collapse of $\( u \, z_T \) mapsto \( u \, w - z_T \)$,
    up to a coordinate permutation. It has degree $plus.minus 1$:
    the origin has one preimage, and its local linear map is $"diag" \( I_r \, - I_b \)$.
    Its adjoint is therefore an equivalence $S^r tilde.eq F \( S^b \, Sigma^M bb(S) \)$.
  Here is the excision argument for unions. For coordinate planes,
  $ U_epsilon.alt \( L_J \) ∩ U_epsilon.alt \( L_K \) = U_epsilon.alt \( L_(J union K) \) . $
  Distributing finite unions gives, for arrangements $Z \, Z'$, the identities
  $ V_alpha \( Z union Z' \) & = V_alpha \( Z \) ∩ V_alpha \( Z' \) \,\
V_alpha \( Z ∩ Z' \) & = V_alpha \( Z \) union V_alpha \( Z' \) . $
  A rectangular subdivision followed by triangulation makes all these closed complements subpolyhedra.
    Their union square is a homotopy pushout. Applying suspension spectra and cofibers into the constant spectrum
    $Sigma^oo \( B_alpha \)_(+)$ gives the homotopy pullback description
  #[#set math.equation(numbering: n => "(3.9)")
   $ cal(C)_alpha \( Z union Z' \) tilde.eq cal(C)_alpha \( Z \) times_(cal(C)_alpha \( Z ∩ Z' \))^h
     cal(C)_alpha \( Z' \) . $ <eq:cofiber-arrangement-excision>]
  We used here that a pushout of spectra is also a pullback.
    On the test-space side there is a pushout of pointed polyhedra along cofibrations
  $ T_alpha \( Z union Z' \) tilde.equiv T_alpha \( Z \) union_(T_alpha \( Z ∩ Z' \)) T_alpha \( Z' \) . $
  Its function spectra give the same pullback as in (3.9), and the pairings commute with these maps.
    Induction on the number of planes proves (3.6): the intersection of one plane with a union of fewer planes is
    again a union of no more than that many coordinate planes. The empty arrangement contributes zero throughout.
  Finally, for an arrangement inclusion $Z subset.eq Z'$, the maps are
  $ cal(C)_alpha \( Z' \) arrow.r cal(C)_alpha \( Z \) \, wide T_alpha \( Z \) arrow.r T_alpha \( Z' \) . $
  For a box inclusion indexed by $alpha lt.eq beta$, the maps are
  $ cal(C)_alpha \( Z \) arrow.r cal(C)_beta \( Z \) \, wide T_beta \( Z \) arrow.r T_alpha \( Z \) \, $
  the second being quotient collapse. On representatives, each required compatibility says that the pairing is
    $kappa_rho \( y - z \)$. If the smaller test quotient additionally collapses $z$,
    the pairing with $y in B_alpha$ was already the basepoint by (3.7).
    Thus the adjoints are natural equivalences of diagrams, not just objectwise identifications. ◻
]

=== 3.3 From a stable lift to a map of complements <from-a-stable-lift-to-a-map-of-complements>

The local duality is now available as an equivalence of diagrams.
  We use a single global nullhomotopy to lift all simplex maps simultaneously,
  and then use connectivity to realize the lift by actual maps into the complements.

#thm([Lemma 3.5.])[
  (Stable avoidance).  #emph[Let $P$ be a finite polyhedron and $f : P arrow.r C \( t \, n \)$ a PL map.
    Let $Z subset.eq T \( t \, n \)$ be a coordinate arrangement, and let $q gt.eq 1$ be an integer. Suppose that
$ omega_(bb(S)) \( f \, Z \) = 0 \, wide dim Z lt.eq M - q \, wide dim P lt.eq 2 q - 5 . $

 There is a continuous map
$ g : P arrow.r \( - 2 \, 2 \)^M \\ Z quad upright("such that") quad parallel g \( x \) -
  f \( x \) parallel_oo < 1 / 2 quad \( x in P \) . $

]
] <lem:stable-avoidance>

#proof[
  The empty domain or empty arrangement needs no argument. Otherwise the dimension hypotheses imply $q gt.eq 3$.
  #emph[Choice of boxes.] Subdivide $P$ so finely that $f \( sigma \)$ has maximum-norm diameter less than $c$ for
    each simplex. Thicken its coordinate bounding box by a radius between $2 c$ and $3 c$,
    increasing strictly with the dimension of $sigma$. A face box is then contained in the interior of its coface
    box. Choose the finitely many radii generically so that no endpoint is zero.
    The resulting boxes $B_sigma$ have the properties
  #[#set math.equation(numbering: n => "(3.10)")
   $ "dist"_oo #scale(x: 120%, y: 120%)[\(] f \( sigma \) \,
     T \\ "int" B_sigma #scale(x: 120%, y: 120%)[\)] > c \, wide
     sup_(x in sigma \, thin y in B_sigma) parallel y - f \( x \) parallel_oo < 1 / 2 . $ <eq:avoidance-box-control>]
  They all lie in $\( - 2 \, 2 \)^M$; indeed the latter supremum is less than $4 c$.
    Enlarge them by one sufficiently small uniform amount to obtain $B_sigma^(+)$,
    preserving the coordinate incidences and all inclusions. Choose a common $epsilon.alt$ and then a common
    collapse radius $rho < c$ as in Lemma 3.3, Lemma 3.4. Write $V_sigma = V_sigma \( Z \)$ and $T_sigma =
    T_sigma \( Z \)$.
  #emph[The stable lift as a map of diagrams.] Index covariant diagrams by the nonempty simplices of $P$,
    with maps from faces to cofaces. Set
  $ cal(D)_sigma = Sigma^oo sigma_(+) \, wide cal(B)_sigma = Sigma^oo \( B_sigma \)_(+) \, wide cal(V)_sigma =
    Sigma^oo \( V_sigma \)_(+) . $
  The maps $f \|_sigma$ define a natural map $cal(D) arrow.r cal(B)$.
    Its obstruction to lifting through $cal(V) arrow.r cal(B)$ is the composite to the cofiber diagram $cal(C)$.
  For clarity, the source cell diagram has latching maps
  #[#set math.equation(numbering: n => "(3.11)")
   $ "colim"_(tau subset.neq sigma) tau_(+) = partial sigma_(+) arrow.r sigma_(+) . $ <eq:cell-latching>]
  They are cofibrations; at a vertex the latching object is the basepoint.
    Consequently this is a cofibrant diagram, and compatible mapping out of its suspension spectrum computes the
    derived mapping spectrum. This fact can also be seen directly: add the simplices in increasing dimension.
    At each step a compatible map is an extension over $sigma$ of the already specified map on $partial sigma$.
    Restriction along (3.11) is a mapping-space fibration after fibrant replacement.
    Induction therefore makes compatible mapping invariant under objectwise equivalences and preserves the fiber
    sequences of mapping spectra used here.
  The duality in 13 identifies the obstruction with the adjoint of the equality test on $sigma_(+) and T_sigma$.
    There is a well-defined based map
  #[#set math.equation(numbering: n => "(3.12)")
   $ sigma_(+) and T_sigma arrow.r Q_c \( f \, Z \) \, wide \[ x \, z \] mapsto \[ x \, z \] .
     $ <eq:local-to-global-test>]
  Indeed, if $z$ lies outside $"int" B_sigma^(+)$, then (3.10) puts $\( x \, z \)$ in the relative set of the
    global test. For a face $sigma subset tau$, compare the two maps on $sigma_(+) and T_tau$:
    including $sigma$ in $tau$ or collapsing $T_tau$ to $T_sigma$ gives the same based map to $Q_c \( f \, Z \)$.
    Every additional collapse already lands in the global relative set by (3.10).
    After adjunction these equalities give the required natural transformation.
    Pulling back one stable nullhomotopy of $phi_rho \( f \, Z \)$ thus gives a compatible nullhomotopy of the
    obstruction diagram. This uses the assumed relative point-test vanishing,
    rather than separately chosen local nullhomotopies.
  The category of spectrum diagrams is stable. Mapping out of $cal(D)$ into the objectwise cofiber sequence
    $cal(V) arrow.r cal(B) arrow.r cal(C)$ now gives a stable lift $cal(D) arrow.r cal(V)$,
    together with a compatible homotopy of its composite to the map given by $f$.
  #emph[Augmentation and desuspension.] For an unbased space $V$, the augmentation $Sigma^oo V_(+) arrow.r
    bb(S)$ sends every point to the nonbasepoint of $S^0$. A map of spaces into $V$ therefore has augmentation
    equal to the unit, whereas an arbitrary stable map need not.
    Each $B_sigma$ is contractible, so its augmentation is an equivalence.
    After adjunction, augmenting the compatible homotopy in the box diagram gives a homotopy from the stable
    lift’s augmentation to the constant unit map. We retain the lift together with this homotopy by setting
  #[#set math.equation(numbering: n => "(3.13)")
   $ E_sigma = "hofib"_1 (Omega^oo Sigma^oo \( V_sigma \)_(+) arrow.r Omega^oo bb(S)) \, $ <eq:augmentation-fiber>]
  where $1$ is the unit point. Naturality of the augmentations makes these data a single derived map from the cell
    diagram $sigma$ into the homotopy-fiber diagram $E$. We keep the lift and its augmentation homotopy together
    when choosing functorial models.
  There is a natural comparison $j_sigma : V_sigma arrow.r E_sigma$.
    Its augmentation is literally the unit, so the path in the homotopy fiber can be taken constant.
    To compute its connectivity, choose a point $v_sigma in V_sigma$.
    The resulting splitting of the augmentation identifies $E_sigma$ with $Omega^oo
    Sigma^oo \( V_sigma \, v_sigma \)$ and identifies $j_sigma$ with stabilization.
    The choices are used only for this objectwise connectivity calculation;
    the comparison itself was defined naturally. By 12, $V_sigma$ is $\( q - 2 \)$-connected.
    Freudenthal therefore makes $j_sigma$ at least $\( 2 q - 3 \)$-connected #cite(label("Hatcher2002"))
    Corollary 4.24. In particular, the weaker bound $2 q - 4$ is available with room for the stated dimension
    hypothesis.
  Here is an explicit way to realize the lift without making compatible basepoint choices.
    Replace $j$ by its natural mapping-path factorization. Objectwise this is
  $ W_sigma = { \( v \, gamma \) : v in V_sigma \, med gamma : \[ 0 \, 1 \] arrow.r E_sigma \, med gamma \( 0 \) =
    j_sigma \( v \) } \, wide p_sigma \( v \, gamma \) = gamma \( 1 \) . $
  The maps $p_sigma$ are fibrations of connectivity at least $2 q - 3$.
    Projection $W_sigma arrow.r V_sigma$ is a natural homotopy equivalence, with section given by constant paths.
    The cofibrant cell diagram allows the preceding compatible derived map to $E$ to be represented by an actual
    map of diagrams, using objectwise fibrant models.
  Inductively lift this map to $W$. At a simplex $sigma$, the chosen lifts on proper faces give a map $partial
    sigma arrow.r W_sigma$ over the prescribed map $sigma arrow.r E_sigma$.
    Its extension is possible because the fibers of $p_sigma$ are $\( 2 q - 4 \)$-connected and $dim sigma lt.eq
    2 q - 5$. This is the ordinary lifting obstruction for a disk and its boundary.
    Projection back to $V$ gives an actual compatible family $sigma arrow.r V_sigma$.
    No dimension of a separate indexing space is added: the extension domains are exactly the simplices in (3.11).
  The family glues to a continuous map $g : P arrow.r \( - 2 \, 2 \)^M \\ Z$.
    Its image on $sigma$ lies in $B_sigma$, so (3.10) gives the claimed displacement bound. ◻
]

=== 3.4 Restoring cube boundaries <restoring-cube-boundaries>

The next elementary step is stated for compact inputs, since no polyhedral hypothesis is needed.
  Its preservation clause is what allows successive applications of 14.

#thm([Lemma 3.6.])[
  (Boundary restoration).  #emph[Let $K$ be compact, let $0 lt.eq s < n$ be an integer, and suppose that $f :
    K arrow.r C \( t \, n \)$ and $g : K arrow.r \( - 2 \, 2 \)^M \\ Z_s \( t \, n \)$ are continuous and satisfy
    $parallel g \( x \) - f \( x \) parallel_oo < 1 \/ 2$ for every $x$.
    There is a continuous map $G : K arrow.r C \( t \, n \)$ such that at least $s +
    1$ of its slots belong to $partial \[ - 1 \, 1 \]^t$ at every point, and
$ f_j \( x \) in partial \[ - 1 \, 1 \]^t quad arrow.r.double quad G_j \( x \) =
  f_j \( x \) wide \( 1 lt.eq j lt.eq n \) . $

]
] <lem:boundary-restoration>

#proof[
  If $K$ is empty the assertion is immediate. Otherwise, choose a continuous $chi : \[ 0 \, 1 \]
    arrow.r \[ 0 \, 1 \]$ which is zero on $\[ 0 \, 3 \/ 4 \]$ and equals one at $1$. Define slotwise
  $ g'_j \( x \) = #scale(x: 120%, y: 120%)[\(] 1 - chi \( parallel f_j \( x \) parallel_oo \)
    #scale(x: 120%, y: 120%)[\)] g_j \( x \) + chi \( parallel f_j \( x \) parallel_oo \) f_j \( x \) . $
  Whenever the cutoff is nonzero, one scalar coordinate of $f_j \( x \)$ has magnitude greater than $3 \/ 4$.
    The corresponding coordinate of $g_j \( x \)$ has the same sign and magnitude greater than $1 \/ 4$.
    The convex interpolation consequently cannot turn that slot into zero. All other slots are unchanged.
    Hence $g'$ still has at least $s + 1$ nonzero slots everywhere,
    and it already agrees with $f$ at each original boundary slot.
  The $\( s + 1 \)$-st largest of the finitely many continuous functions $parallel g'_j \( x \)
    parallel_oo$ is continuous and positive on $K$. By compactness choose $0 < delta < 1$ smaller than its minimum. Set
  $ G_j \( x \) = frac(g'_j \( x \), max { delta \, parallel g'_j \( x \) parallel_oo }) . $
  This is continuous even at zero, belongs to the unit cube,
    and sends every slot of radius at least $delta$ to the boundary. It fixes every slot already of radius one.
    Both conclusions follow. ◻
]

== 4 Boundary compression by padding <sec:compression-cobordism>

We now turn a vanishing point test into a uniform loss of interior cube slots.
  The parameter polyhedron can have arbitrarily large dimension.
  The device that makes this possible is to retain the previous #emph[output],
  whose dimension is bounded by its ambient cube, when a new batch of parameters is introduced.
  The resulting theorem applies to every finite polyhedron, without an upper bound on its dimension.
  In 5, the torus-bundle criterion and exact factorization will extend this construction to arbitrary compact
  metrizable parameter spaces.

We use the cubes $C \( t \, n \)$ and $T \( t \, n \)$, the sparse sets $Z_s \( t \, n \)$,
  and the point tests of 10. Thus $Z_s \( t \, n \)$ allows at most $floor.l s floor.r$ nonzero slots,
  and the fixed relative threshold is $c = 1 \/ 32$. For convenience put $Z_(- 1) \( t \, n \) = diameter$.
  A boundary slot means a slot in $partial \[ - 1 \, 1 \]^t$; in particular, it is a nonzero slot.
  The notation $f^(times u)$ means the product of $u$ copies of $f$,
  with the slots ordered first by copy and then by their original index.

=== 4.1 A stable test for a large batch <a-stable-test-for-a-large-batch>

#thm([Lemma 4.1.])[
  (Batch vanishing).  #emph[Let $P$ be a finite polyhedron, let $f : P arrow.r C \( t \, n \)$ be PL,
    and let $0 < a < 1 \/ 16$. Suppose
$ omega_(M U) #scale(x: 120%, y: 120%)[\(] f \, Z_(a n) \( t \, n \) #scale(x: 120%, y: 120%)[\)] = 0 . $

 For every sufficiently large integer $ell$, with $b = n ell$ and $H = floor.l a b \/ 4 floor.r$, one has
$ omega_(bb(S)) #scale(x: 120%, y: 120%)[\(] f^(times ell) \, Z_H \( t \, b \) #scale(x: 120%, y: 120%)[\)] = 0 . $

]
] <lem:batch-vanishing>

#proof[
  Take the finite pointed pair
  $ E = Q_c #scale(x: 120%, y: 120%)[\(] f \, T \( t \, n \) #scale(x: 120%, y: 120%)[\)] \, wide G =
    Q_c #scale(x: 120%, y: 120%)[\(] f \, Z_(a n) \( t \, n \) #scale(x: 120%, y: 120%)[\)] subset E . $
  A common polyhedral subdivision of the domain, sparse subsets,
    and relative subsets makes this a pointed CW pair. The origin collapse gives a based map $v : E arrow.r
    S^(t n)$ whose restriction to $G$ is zero after applying the unit into $M U$.
    By 1, for all sufficiently large $ell$ the map $v^(and ell)$ is stably null on the union of smash products
    having at least $ceil.l ell \/ 2 ceil.r$ factors in $G$.
  Split a parameter in $T \( t \, b \)$ into $ell$ consecutive groups of $n$ slots.
    Every group outside $Z_(a n) \( t \, n \)$ uses strictly more than $a n$ nonzero slots.
    Consequently a parameter with at most $H lt.eq a n ell \/ 4$ nonzero slots has fewer than $ell \/
    4$ such groups. In particular, at least $ceil.l ell \/ 2 ceil.r$ groups belong to $Z_(a n) \( t \, n \)$.
    By 11, the quotient for the batch test maps into the preceding union and the batch test is the restriction of
    $v^(and ell)$. Pulling back its single stable nullhomotopy proves the assertion. ◻
]

=== 4.2 Padding by previous outputs <padding-by-previous-outputs>

Batch vanishing alone does not put the growing product domain within the stable avoidance range.
  The next argument replaces that domain at each stage by the previous output and one new batch.
  Only the new batch contributes the original parameter dimension.

#thm([Theorem 4.2.])[
  (Boundary compression).  #emph[Let $P$ be a finite polyhedron, let $f : P arrow.r C \( t \, n \)$ be PL,
    and fix $0 < a < 1 \/ 16$. If
$ omega_(M U) #scale(x: 120%, y: 120%)[\(] f \, Z_(a n) \( t \, n \) #scale(x: 120%, y: 120%)[\)] = 0 \, $

 then for arbitrarily large positive integers $u$ there is a continuous map
$ G : P^u arrow.r C \( t \, u n \) $

 with the following properties. At every point of $P^u$, at least $\( a \/ 8 \) u
   n$ output slots are on their cube boundaries. Moreover, if any slot of $f^(times u)$ is on its boundary,
   the corresponding slot of $G$ equals that original slot exactly.]
] <thm:boundary-compression>

#proof[
  The assertion is immediate for an empty $P$, so assume $P$ is nonempty and write $d_P = dim P$.
    Fix $ell$ as in 16, large enough that $a b gt.eq 16$, where
  $ b = n ell \, wide H = floor.l a b \/ 4 floor.r . $
  In particular $H gt.eq 1$. Fix a positive integer $B$ of padding batches so large that
  #[#set math.equation(numbering: n => "(4.1)")
   $ t b \( B + 1 \) gt.eq max { 20 \, 2 ell d_P } . $ <eq:padding-choice>]
  The initial $B$ batches will have output $f^(times ell B)$ and no required boundary count.
  For $N gt.eq 1$ and $0 lt.eq s lt.eq N$, let
  $ Q_s \( t \, N \) = { y in C \( t \, N \) : upright("at least ") s upright(" slots of ") y upright(" lie in ")
    partial \[ - 1 \, 1 \]^t } . $
  This is a finite polyhedron: it is a finite union of products in which specified factors are cube boundaries.
    Its dimension is at most $t N$.
  Suppose $j - 1$ ordinary batches have already been added. Put
  $ N_(j - 1) = b \( B + j - 1 \) \, wide s = \( j - 1 \) H . $
  The previous output lies in $Q_s \( t \, N_(j - 1) \)$. To add the next batch we solve a new problem on the
    finite polyhedron
  #[#set math.equation(numbering: n => "(4.2)")
   $ W_j = Q_s \( t \, N_(j - 1) \) times P^ell \, wide F_j \( y \, x \) = \( y \, f^(times ell) \( x \) \) .
     $ <eq:padding-domain>]
  After a product subdivision $F_j$ is PL. We first show that its sphere point test vanishes on
  $ Z_(j H - 1) #scale(x: 120%, y: 120%)[\(] t \, b \( B + j \) #scale(x: 120%, y: 120%)[\)] . $
  Write the sparse parameter as $\( z_(upright(o)) \, z_(upright(n)) \)$, for the old and new slots.
    On this parameter set the two closed conditions
  $ A_j & : quad z_(upright(o)) in Z_(s - 1) \( t \, N_(j - 1) \) \,\
B_j & : quad z_(upright(n)) in Z_(H - 1) \( t \, b \) $
  cover the whole set: failure of both would give at least $s + H = j H$ nonzero slots.
    If $s = 0$, the first set is empty. On $A_j$, one of the at least $s$ boundary slots of $y$ has zero old
    parameter, and therefore
  #[#set math.equation(numbering: n => "(4.3)")
   $ parallel y - z_(upright(o)) parallel_oo gt.eq 1 . $ <eq:old-test-basepoint>]
  Thus the old relative quotient is at its basepoint there.
  Here is the precise gluing of the relative maps. Set
  $ E_(upright(o)) = Q_c #scale(x: 120%, y: 120%)[\(] "id"_(Q_s \( t \, N_(j - 1) \)) \,
    T \( t \, N_(j - 1) \) #scale(x: 120%, y: 120%)[\)] \, wide G_(upright(n)) =
    Q_c #scale(x: 120%, y: 120%)[\(] f^(times ell) \, Z_(H - 1) \( t \, b \) #scale(x: 120%, y: 120%)[\)] . $
  On the part satisfying $B_j$ send $\( \( y \, x \) \, \( z_(upright(o)) \, z_(upright(n)) \) \)$ to
    $\[ y \, z_(upright(o)) \] and \[ x \, z_(upright(n)) \]$ in $E_(upright(o)) and G_(upright(n))$.
    On the part satisfying $A_j$ send it to the basepoint. These maps agree on their intersection by (4.3),
    and the closed pasting lemma gives a continuous map on the full domain.
    It is constant on the relative subset $parallel F_j - \( z_(upright(o)) \, z_(upright(n)) \) parallel_oo gt.eq
    c$: on $B_j$ at least one smash factor is then the basepoint. It therefore descends to a based map
  #[#set math.equation(numbering: n => "(4.4)")
   $ Q_c #scale(x: 120%, y: 120%)[\(] F_j \, Z_(j H - 1) \( t \, b \( B + j \) \) #scale(x: 120%, y: 120%)[\)]
     arrow.r E_(upright(o)) and G_(upright(n)) . $ <eq:padding-null-map>]
  Composing with the smash of the two point tests gives exactly the point test of $F_j$, by 11;
    on $A_j$ both descriptions are constant by (4.3). The new factor is stably null,
    since its parameter set is contained in the one in 16. Its smash with the old factor is therefore stably null.
    This proves vanishing on the entire sparse union by one relative factorization.
  We check the avoidance range before carrying out the induction.
    The current ambient dimension and the codimension of the excluded sparse set are
  #[#set math.equation(numbering: n => "(4.5)")
   $ D_j = t b \( B + j \) \, wide q_j = D_j - t \( j H - 1 \) . $ <eq:padding-dimensions>]
  Indeed $0 lt.eq j H - 1 < b \( B + j \)$, so that sparse set has dimension $t \( j H - 1 \)$.
    Since $H lt.eq a b \/ 4$ and $a < 1 \/ 16$,
  $ t \( j H - 1 \) < a / 4 D_j < 1 / 8 D_j \, wide q_j > 7 / 8 D_j . $
  On the other hand, (4.2), (4.1) give
  $ dim W_j lt.eq t b \( B + j - 1 \) + ell d_P < 3 / 2 D_j . $
  For all $j gt.eq 1$ we have $D_j gt.eq 20$, and hence
  #[#set math.equation(numbering: n => "(4.6)")
   $ 2 q_j - 5 > 7 / 4 D_j - 5 gt.eq 3 / 2 D_j > dim W_j . $ <eq:padding-stable-range>]
  Thus 14 applies to the null point test just constructed. It gives an output avoiding $Z_(j H - 1)$ within
    distance $1 \/ 2$ of $F_j$. By 15, this output can be changed to a continuous map
  $ g_j : W_j arrow.r Q_(j H) #scale(x: 120%, y: 120%)[\(] t \, b \( B + j \) #scale(x: 120%, y: 120%)[\)] $
  that fixes every boundary slot of $F_j$.
  Starting with $G_0 = f^(times ell B)$, define recursively
  $ G_j \( upright(bold(x)) \, x \) = g_j \( G_(j - 1) \( upright(bold(x)) \) \, x \) \, wide
    upright(bold(x)) in P^(ell \( B + j - 1 \)) \, quad x in P^ell . $
  This is well-defined because $G_(j - 1)$ takes values in the first factor of $W_j$.
    It has at least $j H$ boundary slots. Boundary slots in the new batch are fixed when that batch enters;
    boundary slots already present in the old output are fixed at every later step.
    The padding output initially equals the original input. Induction therefore proves the required agreement with
    every original boundary slot.
  Finally the floor in $H$ and the padding loss have explicit bounds:
  $ H / b gt.eq a / 4 - 1 / b gt.eq frac(3 a, 16) \, wide frac(j H, b \( B + j \)) gt.eq 2 / 3 frac(3 a, 16) = a /
    8 quad \( j gt.eq 2 B \) . $
  Taking $u = ell \( B + j \)$ for these arbitrarily large $j$ proves the theorem.
    The dimension estimate was applied only to $W_j$; no bound on the dimension of the full original parameter
    product is needed. ◻
]

== 5 Torus bundles and compact parameter spaces <sec:torus-criterion>

The remaining task is to verify the $M U$-vanishing hypothesis from a bundle embedding and then remove the
  polyhedral assumption on the input. We first construct the torus data used in 2.
  The Chern-class calculation takes place on a tube, so that its vanishing controls the relative point class
  rather than only its image in absolute cohomology.

=== 5.1 A framed torus detecting the point class <a-framed-torus-detecting-the-point-class>

Fix $p gt.eq 1$ and set $t = 2 p + 1$. We describe once and for all the geometric bundle data used in the criterion.

#thm([Lemma 5.1.])[
  (Torus and line bundles).  #emph[There is a smooth embedding
$ L tilde.equiv \( bb(T)^2 \)^p med subset med \( - c \, c \)^(2 p + 1) $

 with a framed real normal line bundle. There are complex line bundles $lambda_1 \, dots.h \, lambda_p$ on $L$,
   each pulled back from its indicated two-torus factor, such that
$ H = xor.big_(i = 1)^p lambda_i med subset med L times bb(C)^(2 p) \,
  wide ⟨product_(i = 1)^p c_1 \( lambda_i \) \, \[ L \]⟩ = 1 $

 for a choice of orientation on $L$.]
] <lem:framed-torus>

#proof[
  Begin with a circle embedded in $bb(R)^2$ with its outward normal framing.
    If $bb(T)^k$ has been embedded in $bb(R)^(k + 1)$ with a framed normal line,
    its inclusion into $bb(R)^(k + 2)$ has a framed normal two-plane bundle.
    The boundary of a sufficiently small tubular disk bundle is consequently a smooth embedded hypersurface
    $bb(T)^k times S^1$ in $bb(R)^(k + 2)$. Its outward normal is a framing.
    Iteration produces $bb(T)^(2 p)$ in $bb(R)^(2 p + 1)$, and translation and rescaling put it in the specified cube.
  Choose a smooth degree-one map $bb(T)^2 arrow.r S^2 = bb(C P)^1$;
    one may collapse the complement of an oriented disk and then take a smooth approximation.
    The orthogonal complement of the tautological line over $bb(C P)^1$ is a line subbundle of $bb(C)^2$ with
    first Chern number one. Pull it back to $bb(T)^2$, and then to each indicated factor of $L$.
    Taking their direct sum gives the stated embedding. The evaluation follows from the product orientation and
    the Chern number on each factor. ◻
]

Retain the slot bundle $H_n$ and the locus $cal(T) \( f \, Z \)$ of 2.
  The next lemma is valid for every real $a$; the range $0 < a < 1 \/ 16$ is needed later for compression.
  Its complementary-bundle argument is related to the ordinary Chern-class obstruction in
  #cite(label("HirshbergPhillips2022")) proof of Theorem 3.3 in the author preprint.
  We supply the additional $M U$ square-zero calculation and supported Thom-class argument here.

#thm([Lemma 5.2.])[
  (The cobordism criterion).  #emph[Fix positive integers $p \, n$ and a real number $a$.
    Let $P$ be a finite polyhedron, let $f : P arrow.r C \( 2 p + 1 \, n \)$ be PL, and let $Z =
    Z_(a n) \( 2 p + 1 \, n \)$. If the slot bundle on $cal(T) \( f \, Z \)$ embeds into a trivial complex bundle
    of rank $0 lt.eq K < 2 p n$, then
$ omega_(M U) \( f \, Z \) = 0 . $

]
] <lem:torus-mu>

#proof[
  Put $M = \( 2 p + 1 \) n$, $r = p n$, $D = P times Z$, and $d = d_f$.
    The rank bound will force the pulled-back top $M U$ Chern class of $H_n$ to vanish.
    We need this vanishing on the preimage of a neighborhood of $L^n$,
    where multiplication by the normal Thom class will recover the relative point test.
  Fix the normal framing of $L^n$, of real rank $n$, obtained by taking products in 18.
    A tubular neighborhood retraction extends $H_n$ and its orthogonal projection $Pi : L^n arrow.r
    M_(2 r) \( bb(C) \)$ to a neighborhood of $L^n$.
  We first extend the embedding to the pullback of a whole tube.
    On the compact closed subset $cal(T) \( f \, Z \) subset D$,
    compose the assumed embedding with the source projection $Pi compose d$.
    This represents it by a continuous $K$-by-$2 r$ matrix. Extend the real and imaginary parts of its entries to
    $D$ by the Tietze extension theorem #cite(label("Tao2010")) Theorem 1.10.5.
    On the original test locus its restriction to the source fibers has a uniform positive lower bound on unit
    vectors, by compactness. This lower bound persists on the pullback of a sufficiently thin tube:
    otherwise a sequence of unit source vectors over points tending to the central locus would converge to a
    vector contradicting injectivity there. If the central locus is empty,
    compactness instead gives a tube with empty pullback. We may thus choose an open tube $U$ with compact closure
    in $\( - c \, c \)^M$ and retraction $rho : U arrow.r L^n$ such that on $d^(- 1) \( U \)$ the pulled-back
    bundle $d^(*) rho^(*) H_n$ embeds into $bb(C)^K$.
  We use the complex orientation of $M U$ and its Chern and Thom classes,
    with the direct-sum Whitney formula #cite(label("Lurie2010")) Lecture 5,
    Proposition 6 and the following discussion; Lecture 6, Remark 7. List the $r$ line summands of $H_n$ and write
  $ x_i = c_1^(M U) \( lambda_i \) in M U^2 \( L^n \) \, wide 1 lt.eq i lt.eq r \, wide alpha =
    product_(i = 1)^r x_i . $
  Here the indices include both the slot and the two-torus factor.
    Each $x_i$ is pulled back from a two-dimensional torus. Since $M U$ is connective, $M U^4 \( bb(T)^2 \) = 0$:
    filtering that torus by its cells reduces this assertion to $M U^q \( upright("pt") \) = 0$ for $q > 0$.
    Consequently $x_i^2 = 0$.
  Pull these classes to $d^(- 1) \( U \)$. If this space is nonempty,
    the image of the embedded rank-$r$ bundle has an orthogonal complement $F$ in $d^(- 1) \( U \) times bb(C)^K$.
    Thus $F$ has rank $K - r < r$. With a formal variable $v$ recording Chern index,
    the Whitney formula and the square-zero identities give
  #[#set math.equation(numbering: n => "(5.1)")
   $ c_v^(M U) \( F \) = product_(i = 1)^r \( 1 + d^(*) rho^(*) x_i thin v \)^(- 1) =
     product_(i = 1)^r \( 1 - d^(*) rho^(*) x_i thin v \) . $ <eq:inverse-chern>]
  The coefficient of $v^r$ on the left is zero by rank. The coefficient on the right is $\( - 1 \)^r d^(*) rho^(*)
    alpha$. Hence
  #[#set math.equation(numbering: n => "(5.2)")
   $ d^(*) rho^(*) alpha = 0 quad upright("in ") M U^(2 r) \( d^(- 1) \( U \) \) . $ <eq:euler-tube-zero>]
  The same assertion is automatic if the tube pullback is empty.
    This uses only the direct-sum Chern formula; no formula for tensor products of lines is involved.
  For the support pairs below, relative $M U$ means reduced cohomology of homotopy cofibers.
    The collared ambient tube pairs and the final polyhedral pair also admit the literal quotient descriptions
    used here. Choose a closed smaller tubular disk bundle $V$ with $L^n subset "int" V$ and $V subset U$.
    The normal framing gives a Thom class
  $ tau in M U^n \( U \, U \\ "int" V \) . $
  Indeed the relative quotient is the Thom space of a trivial real rank-$n$ bundle,
    whose Thom class is the $n$-fold suspension of the unit. This construction works for odd as well as even $n$
    #cite(label("Lurie2010")) Lecture 5, Example 1. The relative product
  $ eta = \( rho^(*) alpha \) tau in M U^M \( U \, U \\ "int" V \) $
  extends by excision to a class supported in $V$ in $M U^M \( bb(R)^M \, bb(R)^M \\ "int" V \)$. Its image in
  #[#set math.equation(numbering: n => "(5.3)")
   $ M U^M #scale(x: 120%, y: 120%)[\(] bb(R)^M \, bb(R)^M \\ \( - c \, c \)^M #scale(x: 120%, y: 120%)[\)]
     tilde.equiv accent(M U, ̃)^M \( S^M \) tilde.equiv pi_0 M U = bb(Z) $ <eq:ambient-point-group>]
  is a generator, up to the sign of the normal orientation.
    To check the integer, apply the ordinary orientation map $M U arrow.r H bb(Z)$.
    It induces an isomorphism on the group in (5.3). The ordinary image of $eta$ has evaluation
  $ ⟨product_(i = 1)^r c_1 \( lambda_i \) \, \[ L^n \]⟩ = 1 $
  by 18 and the product orientation. Thus the image of $eta$ is exactly the $M U$ origin class up to sign.
  We give the pullback with its relative sets to retain this supported information.
    On $d^(- 1) \( U \)$ the pullback of $eta$ vanishes, because its absolute factor is zero by (5.2).
    Excision for the smaller closed tube therefore gives zero in
  $ M U^M #scale(x: 120%, y: 120%)[\(] D \, D \\ d^(- 1) \( "int" V \) #scale(x: 120%, y: 120%)[\)] . $
  This excision is valid after pullback: the closure of $D \\ d^(- 1) \( U \)$ lies in the interior of
    $D \\ d^(- 1) \( "int" V \)$, since $V subset U$ and $V$ is compact.
    In particular the excision isomorphisms commute with $d$ and with the relative products used above.
    As $V subset \( - c \, c \)^M$, the relative sets satisfy
  $ A_c \( f \, Z \) subset D \\ d^(- 1) \( "int" V \) . $
  The induced map on relative cohomology sends this zero class to
  #[#set math.equation(numbering: n => "(5.4)")
   $ M U^M #scale(x: 120%, y: 120%)[\(] D \, { \( x \, z \) : parallel f \( x \) - z parallel_oo gt.eq
     c } #scale(x: 120%, y: 120%)[\)] . $ <eq:point-test-relative-mu>]
  The image is, up to sign, the pullback of the origin class in (5.3), so it is the $M U$ point test and is zero.
    Finally the pair in (5.4) is a finite polyhedral pair: $f$ is PL, $Z$ is a finite union of coordinate cubes,
    and the relative condition is a finite union of linear inequalities after subdivision.
    Its relative cohomology is therefore the reduced cohomology of the exact quotient in 10.
    This proves the required vanishing. ◻
]

=== 5.2 Compact parameter spaces and exact factorization <compact-parameter-spaces-and-exact-factorization>

#thm([Lemma 5.3.])[
  (Finite parameter reduction).  #emph[Fix positive integers $p \, n$ and a real number $a$.
    Let $Y$ be compact metrizable, let $f : Y arrow.r C \( 2 p + 1 \, n \)$ be continuous, and put $Z =
    Z_(a n) \( 2 p + 1 \, n \)$. Suppose the slot bundle on $cal(T) \( f \, Z \)$ embeds into a trivial complex
    bundle of nonnegative integer rank $K$. There are a finite polyhedron $P$, a continuous map $j : Y arrow.r P$,
    and a PL map $f_P : P arrow.r C \( 2 p + 1 \, n \)$ such that
$ f = f_P compose j \, $

 and the slot bundle on $cal(T) \( f_P \, Z \)$ also embeds into a trivial bundle of rank $K$.]
] <lem:finite-parameter-reduction>

#proof[
  If $Y$ is empty, take $P$ empty and the unique maps. Otherwise put $M = \( 2 p + 1 \) n$ and $r = p n$.
    Represent the embedding on the compact test locus by a $K$-by-$2 r$ matrix $A$,
    by first projecting onto the fixed source bundle. Extend its entries to $Y times
    Z$ by the Tietze theorem #cite(label("Tao2010")) Theorem 1.10.5.
    Choose $delta > 0$ such that on the central test locus
  #[#set math.equation(numbering: n => "(5.5)")
   $ parallel A \( y \, z \) v parallel gt.eq 4 delta parallel v parallel quad
     upright("for ") v in \( H_n \)_(f \( y \) - z) . $ <eq:original-injectivity>]
  Compactness of its unit sphere bundle supplies this number.
    If the locus is empty the condition is vacuous and any $delta > 0$ may be used.
  The real algebra on $Y times Z$ generated by continuous real functions on $Y$ and the Euclidean coordinates of
    $z$ contains the constants and separates points. By the real Stone–Weierstrass theorem #cite(label("Tao2010"))
    Theorem 1.10.18, the real and imaginary entries of $A$ can be uniformly approximated by elements of this
    algebra. Only finitely many functions on $Y$ occur in these approximants.
    Rescale them into $\[ - 1 \, 1 \]$ and denote them by $phi_1 \, dots.h \, phi_q$.
    Include every coordinate of $f$ explicitly, by setting
  $ j_0 \( y \) = \( f \( y \) \, phi_1 \( y \) \, dots.h \, phi_q \( y \) \) in W = \[ - 1 \, 1 \]^(M + q) . $
  The approximating matrix has the form $B \( j_0 \( y \) \, z \)$,
    where $B$ is a matrix of polynomials on $W times Z$. Choose the approximation so that its operator-norm error
    is less than $delta$ everywhere on $Y times Z$. By (5.5),
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel B \( j_0 \( y \) \, z \) v parallel gt.eq 3 delta parallel v parallel quad
     upright("on the original slot bundle") . $ <eq:coordinate-injectivity>]
  Let $C = j_0 \( Y \)$ and let $f_0 : W arrow.r \[ - 1 \, 1 \]^M$ be projection onto the first $M$ coordinates.
    The bundle over a point $\( u \, z \)$ with $f_0 \( u \) - z in L^n$ depends only on $f_0 \( u \) - z$.
    Consequently (5.6) gives the same bound at every such point of $C times Z$,
    regardless of the choice of a preimage of $u$ in $Y$.
  For completeness, consider the following compact bad set:
  $ cal(B) = { \( u \, z \, v \) : thick & u in W \, med z in Z \, med parallel v parallel = 1 \, med
    f_0 \( u \) - z in L^n \,\
 & Pi \( f_0 \( u \) - z \) v = v \, med parallel B \( u \, z \) v parallel lt.eq 2 delta } . $
  Here $Pi$ is the continuous orthogonal projection onto $H_n$.
    The projection of $cal(B)$ onto $W$ is compact and disjoint from $C$, by (5.6).
    Its complement is therefore a relative open neighborhood of $C$ in $W$.
    Subdivide $W$ into sufficiently small closed cubes and take the union $P$ of all cubes meeting $C$.
    Finiteness and the positive distance from $C$ to the bad projection ensure that $P$ is contained in this
    neighborhood. If the bad projection is empty, any such subdivision suffices.
    This construction is relative to $W$; it does not extend the first $M$ coordinates beyond the unit cube.
  Regard $j_0$ as a map $j : Y arrow.r P$ and put $f_P = f_0 \|_P$.
    The map $f_P$ is coordinate-linear and hence PL. On $cal(T) \( f_P \, Z \)$,
    the restriction of $B \( u \, z \)$ to the slot bundle is bounded below by $2 delta$ on unit vectors,
    and thus is the required continuous bundle embedding. Finally $f_P compose j =
    f$ by the choice of the first $M$ coordinates. ◻
]

=== 5.3 Completion of the compact-input theorem <completion-of-the-compact-input-theorem>

The factorization just proved retains the cube map exactly,
  while moving the auxiliary embedding data to a finite polyhedron.
  We can therefore apply boundary compression there and pull it back without losing its pointwise preservation clause.

#proof[
  Apply 20 to obtain $j : Y arrow.r P$ and $f_P$ with the same bundle embedding and $f = f_P compose j$.
    By 19 the $M U$ point test of $f_P$ vanishes. 17 gives the stated compression maps on $P^u$ for arbitrarily
    large $u$. Composing with $j^(times u)$ gives the maps on $Y^u$.
    The factorization of $f$ is exact, so the boundary agreement also pulls back exactly. ◻
]

#prodef([Remark 5.4.])[
  (The strict rank threshold).  The bound $K < 2 p n$ in 3 cannot in general be replaced by $K lt.eq 2 p n$.
    Take $n = 1$, let $Y = C \( 2 p + 1 \, 1 \)$, and let $f$ be the identity.
    For every $0 < a < 1 \/ 16$ the sparse set is $Z_a \( 2 p + 1 \, 1 \) = { 0 }$,
    so the torus locus is $L$ and the canonical inclusion $H subset L times
    bb(C)^(2 p)$ supplies an embedding at the endpoint $K = 2 p$.
  Suppose that, for some $u gt.eq 1$, a continuous map $G : B arrow.r B$, where $B = C \( 2 p + 1 \, u \)$,
    has at least one boundary slot everywhere and fixes every original boundary slot.
    Its image lies in the total boundary $partial B$. For $x in partial B$,
    at least one boundary slot of $x$ remains fixed throughout the straight-line homotopy $\( 1 - s \) x +
    s G \( x \)$, $0 lt.eq s lt.eq 1$. This homotopy therefore stays in $partial B$,
    showing that $G \|_(partial B)$ has degree one. But $G : B arrow.r
    partial B$ extends this restriction over the cube, forcing its degree to be zero.
    This contradiction rules out such a map for every $u$. In particular,
    the positive bound $\( a \/ 8 \) u$ in 3, which requires at least one boundary slot, is impossible at this endpoint.
] <rem:rank-threshold-sharp>

#bibliography("refs.bib", style: "ieee", title: [References])
