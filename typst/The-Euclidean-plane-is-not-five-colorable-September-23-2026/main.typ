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

#align(center)[#text(size: 16pt, weight: "bold")[The Euclidean plane is not five-colorable]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A proper $k$-coloring of the Euclidean plane is a function $c : bb(R)^2 arrow.r { 1 \, dots.h \,
  k }$ such that $c \( x \) eq.not c \( y \)$ whenever $lr(bar.v.double x - y bar.v.double) = 1$.
  The Hadwiger–Nelson problem asks for the least such $k$, denoted by $chi \( bb(R)^2 \)$,
  with no regularity imposed on the color classes. Equivalently,
  it asks for the chromatic number of the graph whose vertices are all points of the plane and whose edges are the
  unit-distance pairs. Edges in a finite drawing of this graph may cross.

The problem dates to Edward Nelson in 1950. Nelson obtained the lower bound four,
  and John Isbell found the upper bound seven by a hexagonal coloring;
  the historical record of these unpublished observations is recounted by
  #cite(label("Soifer2003History"), form: "prose") pp. 15–19.
  Hadwiger’s published formulation #cite(label("Hadwiger1961")) asks for a covering by sets that avoid unit
  distance and gives the bounds four and seven. The seven-point construction of
  #cite(label("MoserMoser1961"), form: "prose"), now called the Moser spindle,
  gives a particularly small finite obstruction to three colors.
  We use its two overlapping-triangle constraints again in the final step of our proof and verify the required
  placement explicitly.

The lower bound remained four until #cite(label("deGrey2018"), form: "prose") constructed a finite unit-distance
  graph that is not four-colorable in 2018. His corrected construction has 1,581 vertices.
  Subsequent work made these finite obstructions smaller and their verification more accessible:
  #cite(label("Heule2018"), form: "prose") used satisfiability proofs and extraction of unsatisfiable cores to
  obtain 553-vertex examples, and #cite(label("Parts2020Minimization"), form: "prose") obtained a 509-vertex
  graph. #cite(label("ExooIsmailescu2020"), form: "prose") gave an alternative proof of the lower bound five,
  and Parts gave a human-verifiable proof #cite(label("Parts2020Human")).
  These advances concern finite obstructions to four colors.
  The compactness theorem of #cite(label("deBruijnErdos1951"), form: "prose") Theorem 1 says that a graph is
  $k$-colorable, for fixed finite $k$, if and only if every finite subgraph is $k$-colorable.
  Consequently an unrestricted lower bound can also be established without first displaying a finite graph
  witnessing it.

The problem with measurable color classes has a different history.
  Write $chi_m \( bb(R)^2 \)$ for the least number of colors when each class must be Lebesgue measurable.
  #cite(label("Falconer1981"), form: "prose") proved $chi_m \( bb(R)^2 \) gt.eq
  5$ using density points and rotations. #cite(label("Payne2009"), form: "prose") developed this method for
  translation-invariant unit-distance subgraphs. In particular,
  the graph on all of $bb(R)^2$ whose edges have rational unit displacement vectors is two-colorable,
  while every measurable coloring requires at least five colors.
  Thus measurable and unrestricted colorings cannot be identified merely because their distance constraints look
  the same.

For colorings by regular regions, #cite(label("Woodall1973"), form: "prose") studied distance-avoiding closed
  covers and region decompositions. Townsend corrected Woodall’s argument for a six-color lower bound in the
  planar-map setting, announcing the repair in 1981 and giving its details in 2005 #cite(label("Townsend1981"))
  #cite(label("Townsend2005")). More recently, #cite(label("SokolovVoronov2025"), form: "prose") proved a lower
  bound seven for polygonal colorings in a locally finite map framework.
  Their interface argument excludes both adjacent colors wherever distances to the interface take values both
  below and above one. We derive corresponding exclusions from weak measurable data,
  without assuming regular color boundaries.

We prove the following result, working throughout in ZFC.

#thm([Theorem 1.1.])[
  #emph[The Euclidean plane has no proper five-coloring, even when arbitrary color classes are allowed. Consequently,
$ 6 lt.eq chi \( bb(R)^2 \) lt.eq 7 . $

]
] <thm:main>

The remaining alternatives six and seven are unresolved.#footnote[The May 14,
  2026 manuscript of #cite(label("Reed2026"), form: "prose") announces $chi \( bb(R)^2 \) =
  7$ through a circle-density argument. Its proposed strict bound of $pi \/
  3$ on the angular measure of a unit-independent subset of the unit circle fails for the half-open arc ${
  e^(i t) : 0 lt.eq t < pi \/ 3 }$: this arc has angular measure $pi \/ 3$ and contains no unit pair.
  The displayed formal theorem assumes that density bound as a hypothesis,
  so the argument does not establish the announced equality.] The proof has two parts:
  a transfer from unrestricted proper colorings to a measurable condition,
  and a geometric obstruction to five labels under that condition. The transfer holds for every finite number of colors.

#prodef([Definition 1.2.])[
  (Weak measurable coloring).  Let $k$ be a positive integer, let $S^1 subset bb(R)^2$ be the unit circle,
    and let $sigma$ be its normalized arc-length measure. A #emph[weak measurable $k$-coloring] is a Lebesgue
    measurable function $c : bb(R)^2 arrow.r { 1 \, dots.h \, k }$, with color classes $A_i =
    c^(- 1) \( { i } \)$, such that, for every $R > 0$,
  $ sum_(i = 1)^k integral_(B \( 0 \, R \)) integral_(S^1) upright(bold(1))_(A_i) \( x \)
    upright(bold(1))_(A_i) \( x + u \) thin d sigma \( u \) thin d x = 0 . $
  The integrals use the completed product measure; equivalently,
    one may first choose Borel representatives of the color classes forming a partition of the plane.
] <def:weak-coloring>

This definition permits exceptional unit pairs. It is unchanged by modifying the coloring on a plane Lebesgue null
  set: by Fubini, the pairs for which either $x$ or $x + u$ belongs to that set have product measure zero.
  The required bridge to the unrestricted problem is the following equivalence.

#thm([Theorem 1.3.])[
  (Transfer of colorability).  #emph[For every positive integer $k$, in ZFC,
#[#set math.equation(numbering: n => "(1.1)")
 $ upright("a proper ") k upright("-coloring of ") bb(R)^2 upright(" exists")\
arrow.l.r.double\
upright("a weak measurable ") k upright("-coloring of ") bb(R)^2 upright(" exists") . $ <eq:source-1>]

]
] <thm:transfer>

#thm([Theorem 1.4.])[
  #emph[There is no weak measurable five-coloring of the Euclidean plane.]
] <thm:weak-five>

#proof[
  #emph[Deduction of Theorem 1.] A proper five-coloring would give a weak measurable five-coloring by Theorem 3,
    contrary to Theorem 4.
  For the upper bound, use the hexagonal construction described by #cite(label("Hadwiger1961"), form: "prose").
    Take Voronoi hexagons of a triangular lattice, each with circumradius $r = 2 \/ 5$.
    Their centers have nearest-neighbor distance $sqrt(3) r$.
    Write the lattice as a scaled copy of $bb(Z) + bb(Z) omega$, where $omega = e^(2 pi i \/ 3)$.
    Multiplication by $2 - omega$ gives a similar sublattice of index seven, since $\| 2 - omega \|^2 = 7$.
    Color centers by its seven cosets, and give each point the color of its hexagon,
    assigning boundary points to any incident hexagon. Distances inside one hexagon are at most $2 r < 1$.
    Centers of distinct same-color hexagons are at least $sqrt(21) r$ apart,
    so points in those hexagons are at least $\( sqrt(21) - 2 \) r > 1$ apart.
    This is a proper seven-coloring, including all boundaries. ◻
]

=== 1.1 Proof overview and the role of earlier methods <proof-overview-and-the-role-of-earlier-methods>

The two parts of the proof address different obstacles. A coloring with arbitrary classes provides no
  density-point structure to use, while a measurable coloring may have boundaries far too irregular to analyze as
  a planar map. Theorem 3 supplies the measurable input. The proof of Theorem 4 then constructs the connected
  interfaces it needs instead of assuming them. Figure 1 shows how these two parts combine.

===== 1.1.1 From arbitrary labels to measurable fields. <from-arbitrary-labels-to-measurable-fields.>

Let $F$ be the field of real algebraic numbers, $E = F \( i \)$ the algebraic plane, and $K = { u in E : \| u \| =
  1 }$ its group of algebraic rotations. Restricting a proper coloring to the countable set $E$ and averaging its
  translates and rotations gives an invariant probability law on proper labelings of $E$.
  This is a standard amenable averaging construction. Probabilistic approaches to the Hadwiger–Nelson problem
  already use invariant randomization and finite-graph compactness
  #cite(label("BourgeatHeinrichMelottiRobert2015")) #cite(label("GwynStavrianos2020"));
  Følner averaging over countable groups of plane isometries also occurs in the fractional-coloring work of
  #cite(label("MatolcsiRuzsaVargaZsamboki2025"), form: "prose"). These methods supply symmetry.
  Here a further argument must retain the unit-distance exclusions while producing ordinary measurable functions
  on the plane.

For this purpose let $D$ be the compact group of all characters of the additive discrete group $E$.
  A character is a homomorphism from $E$ to the unit complex circle.
  The ordinary continuous characters form the Borel subgroup

$ C = { z mapsto exp \( i xi dot.op z \) : xi in bb(R)^2 } subset D . $

Rotations act on characters by $\( u d \) \( z \) = d \( u z \)$.
  The spectral theorem, in $L^2$ of the invariant labeling law,
  separates each label indicator into the part supported on $C$ and its orthogonal remainder.
  The central rigidity statement, Theorem 8, says that every $K$-invariant probability on $D$ assigning zero mass
  to $C$ is Haar probability. The remainder therefore has zero correlation under every nonzero algebraic
  translation, so removing it preserves the zero unit correlations.
  The $C$-supported subspace is the space of functions on a probability factor,
  so projection onto it is conditional expectation and preserves nonnegativity and keeps the sum of the label
  coordinates equal to one. Translation operators on this factor extend continuously to $bb(R)^2$.
  The translated coordinates admit jointly measurable versions,
  giving fields on the plane and the probability space. For a suitable sample,
  choose the least label with positive coordinate at each point where the coordinates sum to one,
  and assign arbitrary labels on the remaining plane-null set.
  The zero unit correlations give the weak measurable coloring condition.
  Section 4 carries out this passage, including the measurable-version and exceptional-pair details.

The rigidity proof occupies Sections 2 and 3. Its structural ingredient is the Furstenberg–Zimmer
  compact-extension method #cite(label("Furstenberg1977")) #cite(label("ZimmerExtensions1976"))
  #cite(label("ZimmerDiscrete1976")). We give the particular compact-factor tower and conditional averaging
  arguments used here; the corrected modern account of #cite(label("JamneshanStructure"), form: "prose")
  #cite(label("JamneshanCorrigendum"), form: "prose") supplies further context.
  For an ergodic law, a relative singularity lemma along that tower shows that the law of the difference of two
  characters, sampled conditionally independently over its terminal factor, still gives $C$ measure zero.
  Its Fourier coefficient is nonnegative and radial, and its line averages defined by an invariant mean vanish.
  Two identities between sums of algebraic unit directions give a difference inequality for this coefficient.
  A finite number-field argument shows that a positive value at any nonzero radius would force a uniform positive
  lower bound on an interval of algebraic radii, contradicting those averages.
  This proves Haar rigidity without a regularity assumption on the original coloring.

For the converse transfer, density points of a weak color class contain no unit pair (Lemma 20).
  This adapts the familiar density-point mechanism of Falconer and Payne to product-almost-everywhere unit-pair
  exclusion. A common translation places any fixed finite configuration among points having density one in their
  assigned color, called typical points, and graph compactness then gives a proper coloring of the whole plane.
  The weak condition uses Lebesgue measure in position and arc length in direction;
  it is distinct from the invariant-mean notion of monochromatic-pair frequency in
  #cite(label("GwynStavrianos2020"), form: "prose").

===== 1.1.2 From weak labels to connected exclusions. <from-weak-labels-to-connected-exclusions.>

For the five-color obstruction, fix a center $x$ and take weak-\* limits of the typical angular samples $e
  mapsto \( upright(bold(1))_(A_i) \( y + r e \) \)_(i = 1)^5$, where $e in S^1$, $y arrow.r x$, and $r arrow.r
  1$. The #emph[palette] at $\( x \, e \)$ collects, up to angular null sets,
  all labels having positive weight at $e$ in these limits.
  Smooth transport of two unit directions gives exclusions between palettes.
  Section 5 shows that almost every palette contains at most two labels, at every fixed center.
  Section 6 records abundant transitions between labels in a finite graph at each center and proves that centers
  where this graph contains a cycle form a closed locally finite set.
  The estimates use the decay of the Fourier transform of circle measure;
  no finite perimeter or smoothness of a color boundary is assumed.

Section 7 smooths the color indicators by disk averages, then thresholds and renormalizes the resulting
  probability vectors. Outside disks with vanishing total radii,
  these modified vectors have at most two positive coordinates,
  so they lie in the complete graph on the five labels. The forest structure away from cyclic centers lets us fill
  the holes in those regions continuously in that graph. A planar cover obstruction forces a nontrivial loop
  around one cyclic-center disk. A simple cycle in the reduced edge path of that loop supplies the label cycle.
  For each edge midpoint, a connected component of its inverse image crosses the annulus.
  Limits of these components give compact connected sets $K_j$ with a common point $x$.
  Each $K_j$ is assigned the two endpoint labels of its edge.
  Both endpoint labels are absent almost everywhere from the open region

$ Delta \( K_j \) = { z : min_(q in K_j) \| z - q \| < 1 < max_(q in K_j) \| z - q \| } . $

This connected-set exclusion has a geometric predecessor in the interface arguments of
  #cite(label("SokolovVoronov2025"), form: "prose") Propositions 1–2.
  Here the continua and their common point are consequences of the measure estimates and the topological extraction.

A simple cycle on five labels has length three, four, or five. Section 8 excludes each possibility.
  Chosen limiting directions of sequences in the continua approaching $x$ determine allowed labels just inside and
  just outside the unit circle about $x$. A five-cycle gives incompatible six-position angular words.
  A four-cycle gives two antipodal pairs of directions and an impossible parity rule.
  A three-cycle forces six alternating sectors for the two outside labels.
  The last configuration leaves an open region using only the three cycle labels almost everywhere;
  a rational placement certificate puts all seven vertices of the Moser obstruction in that region.
  These contradictions complete the proof of Theorem 4.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.833cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Arbitrary proper#linebreak()five-coloring]]])])
  content((3.313, 0), [#box(width: 2.833cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Invariant probability#linebreak()on proper labelings]]])])
  content((6.626, 0), [#box(width: 2.833cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Continuous#linebreak()translation factor]]])])
  content((9.938, 0), [#box(width: 2.833cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Weak measurable#linebreak()five-coloring]]])])
  content((9.938, -2.28), [#box(width: 2.833cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Angular palettes#linebreak()of size at most two]]])])
  content((6.626, -2.28), [#box(width: 2.833cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Common exclusion#linebreak()continua on a cycle#linebreak()of length $3$, $4$, or $5$]]])])
  content((3.313, -2.28), [#box(width: 2.833cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$3$: Moser graph#linebreak()$4$: parity obstruction#linebreak()$5$: six-step words]]])])
  content((0, -2.28), [#box(width: 2.833cm, height: 1.05cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#e8e8e8"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Contradiction]]])])
  line((1.416, 0), (1.896, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((4.729, 0), (5.209, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((8.042, 0), (8.522, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((9.938, -0.525), (9.938, -1.755), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((8.522, -2.28), (8.042, -2.28), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((5.209, -2.28), (4.729, -2.28), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  line((1.896, -2.28), (1.416, -2.28), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
})],
  caption: [Figure 1: The contradiction argument for five colors. The transfer from arbitrary proper colorings to weak measurable colorings is proved for every finite number of colors; the geometric obstruction uses five labels. ],
) <fig:proof-route>

=== 1.2 A probabilistic consequence <a-probabilistic-consequence>

#thm([Corollary 1.5.])[
  (Positive five-color badness).  #emph[There is a constant $delta > 0$ with the following properties.]
  + #emph[For every coloring $c : bb(R)^2 arrow.r { 1 \, dots.h \,
    5 }$ and every normalized finitely additive left-invariant measure $mu$ on all subsets of the plane-isometry
    group $E \( 2 \)$, the invariant-mean badness satisfies
$ p_5^mu \( c \) := mu #scale(x: 120%, y: 120%)[\(] { T in E \( 2 \) : c \( T^(- 1) 0 \) =
  c \( T^(- 1) 1 \) } #scale(x: 120%, y: 120%)[\)] gt.eq delta \, $

 where $bb(R)^2$ is identified with $bb(C)$.]
  + #emph[If $c$ is a Lebesgue-measurable five-coloring with two linearly independent periods,
    then $bb(P) \( c \( A \) = c \( A + U \) \) gt.eq delta$,
    where $A$ is uniform in a fundamental parallelogram and $U$ is an independent uniform unit direction.
    For any Lebesgue-measurable five-coloring, if the conditional square-table frequencies
$ bb(P) #scale(x: 120%, y: 120%)[\(] c \( A_R \) = c \( A_R + U \) divides A_R +
  U in \[ - R \, R \]^2 #scale(x: 120%, y: 120%)[\)] wide \( R > 1 \) $

 converge as $R arrow.r oo$, their limit is at least $delta$;
   here $A_R$ is uniform in $\[ - R \, R \]^2$ and independent of $U$.]
] <cor:positive-badness>

#proof[
  Theorem 1 and graph compactness #cite(label("deBruijnErdos1951")) Theorem 1 give a finite unit-distance graph
    $H$ that is not five-colorable. Set $m = \| E \( H \) \|$ and $delta = 1 \/ m$.
    Every five-coloring of $H$ has at least one monochromatic edge.
    Averaging this count with any of the measures in (i) gives $m p_5^mu \( c \) gt.eq 1$,
    by isometry invariance and finite additivity; this is the finite-graph bound of
    #cite(label("GwynStavrianos2020"), form: "prose") Lemma 2.10 and Theorem 2.11.
    The periodic and asymptotic needle frequencies in (ii) are bounded below by the minimum monochromatic-edge
    fraction of $H$, hence by $1 \/ m$, by #cite(label("BourgeatHeinrichMelottiRobert2015"), form: "prose")
    Theorems 1–2. Borel representatives give the same needle frequencies by Fubini;
    for a periodic coloring choose them in one cell and extend periodically.
    The graph and the positive constant here are existential. ◻
]

== 2 Spectral preliminaries and relative singularity <sec:spectral>

This section and Section 3 establish the probability-law rigidity used in the coloring transfer of Section 4.
  The laws live on the character group of the discrete algebraic plane.
  We state the rigidity theorem after defining that group, then prove that exclusion of ordinary continuous
  characters persists in the conditional difference laws arising along compact towers.
  This relative singularity is the input to the Fourier argument in Section 3.

=== 2.1 Algebraic rotations and continuous characters <algebraic-rotations-and-continuous-characters>

#prodef([Definition 2.1.])[
  Identify the plane with $bb(C)$, and set
  $ F = overline(bb(Q)) ∩ bb(R) \, wide E = F \( i \) \, wide K = { u in E : u macron(u) = 1 } . $
  We regard $E$ as an additive discrete group and $K$ as a multiplicative discrete group. Let
  $ D = hat(E_(upright("disc"))) $
  be the compact character group of $E$. A point $d in D$ is a homomorphism from the additive group $E$ to the
    unit complex group $bb(T)$. We use additive notation on $D$, so $\( d + d' \) \( z \) = d \( z \) d' \( z \)$.
    For $a \, z in E$, put
  $ \( a d \) \( z \) = d \( a z \) \, wide psi_z \( d \) = d \( z \) . $
  The subgroup of ordinary continuous characters is
  #[#set math.equation(numbering: n => "(2.1)")
   $ C = j \( bb(R)^2 \) \, wide j \( xi \) \( z \) = exp \( i xi dot.op z \) \, $ <eq:spectral-continuous-characters>]
  where the dot product uses the real coordinates of $z$.
] <def:spectral-groups>

Both $E$ and $K$ are countable abelian groups. Every nonzero power map $u mapsto u^n$ on $K$ is onto:
  a complex $n$th root of an algebraic number of modulus one is again algebraic and has modulus one;
  negative powers also cause no difficulty. Thus $K$ is divisible.
  The compact group $D$ is metrizable because $E$ is countable.

The map $j$ is continuous and injective. Indeed, a continuous plane character that is one on the dense subgroup
  $E$ is one everywhere, and its frequency is zero. Its image is the union of the compact images of closed balls
  in $bb(R)^2$, so $C$ is Borel. The inverse of $j$ on each such compact image is continuous;
  consequently $j^(- 1) : C arrow.r bb(R)^2$ is Borel. For $a eq.not 0$,
  multiplication by $a$ is an automorphism of $D$ and carries $C$ onto itself.
  On the frequency parameters it acts by the transpose of the real linear map of multiplication by $a$.
  In particular, an element of $K$ acts on these parameters by an orthogonal map.

#prodef([Definition 2.2.])[
  A $K$-invariant Borel probability measure $nu$ on $D$ is called #emph[wild] if $nu \( C \) = 0$.
    Its Fourier coefficients are denoted by
  $ f_nu \( z \) = integral_D psi_z \( d \) thin d nu \( d \) \, wide z in E . $
] <def:spectral-wild>

#thm([Theorem 2.3.])[
  (Rigidity of wild character laws).  #emph[Every $K$-invariant probability measure $nu$ on $D$ with $nu \( C \) =
    0$ is Haar measure. Equivalently, writing $m_D$ for normalized Haar measure,
#[#set math.equation(numbering: n => "(2.2)")
 $ nu upright(" is wild") quad arrow.r.double quad nu = m_D . $ <eq:source-3>]

]
] <thm:rigidity>

The Fourier coefficients of Haar probability vanish at every nonzero $z in E$.
  This is the conclusion needed in Section 4: a rotation-fixed label indicator has a $K$-invariant finite spectral
  measure, and its part off $C$ is again invariant. If that part is nonzero,
  normalization allows the theorem to be applied; its correlations at every nonzero algebraic translation then
  vanish. The factor argument in Lemma 18 will make the $C$-supported projections nonnegative,
  with $L^2$-continuous translation orbits.

There is a classical analogue for measurable radial positive-definite functions on the full real plane:
  each is the sum of a continuous positive-definite function and a nonnegative multiple of
  $upright(bold(1))_({ 0 })$ #cite(label("Crum1956")) #cite(label("GneitingSasvari1999")).
  Here the Fourier coefficients are initially defined only on $E$,
  with invariance under its algebraic rotations $K$; no measurable radial positive-definite extension to $bb(R)^2$
  is assumed. We prove the required rigidity directly on $D$.

The proof of the theorem is completed in Section 3. Here we first obtain null-event and line-average consequences
  of $nu \( C \) = 0$. We then show that this condition survives when the law is replaced by the difference of two
  conditionally independent samples over a factor in a compact tower.

#thm([Lemma 2.4.])[
  #emph[Let $nu$ be wild. Then every coset of $C$ has $nu$-measure zero,
    and the law of the difference of two independent $nu$-samples gives $C$ measure zero.
    Moreover, for each $a in E \\ { 0 }$, the event
$ L_a = { d in D : t mapsto d \( a t \) upright(" is continuous on ") F upright(" in its usual topology") } $

 is Borel and has $nu$-measure zero.]
] <lem:spectral-null-events>

#proof[
  If a coset $d + C$ has positive mass, its $K$-orbit is finite,
    since the cosets in that orbit are disjoint and have the same mass.
    The action on this finite orbit gives a finite image of the divisible abelian group $K$.
    Such an image is trivial: a finite abelian group cannot be divisible unless it is trivial.
    Hence every $u in K$ fixes the coset, and $\( u - 1 \) d in C$.
    Taking $u eq.not 1$ and applying the inverse scalar shows $d in C$, contrary to $nu \( C \) = 0$.
    The difference assertion now follows by integrating $nu \( d + C \) = 0$ against $nu \( d \)$;
    the relation $d' - d in C$ is Borel.
  Restriction to the line $a F$ is a continuous map from $D$ to $hat(F_(upright("disc")))$.
    The ordinary continuous characters on $F$ are exactly $t mapsto e^(i lambda t)$, $lambda in bb(R)$.
    Their parametrization is continuous and injective, with Borel image by compact exhaustion, as for $j$.
    This proves the Borel assertion for $L_a$.
  If $a F \, b F$ are nonparallel, then $a \, b$ form an $F$-basis of $E$.
    A character continuous on both lines has the form
  $ d \( a t + b s \) = e^(i \( lambda t + eta s \)) wide \( t \, s in F \) $
  for real $lambda \, eta$. The corresponding real coordinate change is invertible and continuous,
    so this character belongs to $C$. Thus $L_a ∩ L_b subset C$ for nonparallel lines.
    Rotations give infinitely many distinct unoriented lines $u a F$, and their events have the same $nu$-measure.
    Any finite collection of them is pairwise disjoint modulo $nu$-null sets.
    Their common measure must therefore be zero. ◻
]

=== 2.2 A line average without a measurability assumption <a-line-average-without-a-measurability-assumption>

Fix a translation-invariant mean $frak(m)$ on the bounded functions on the discrete abelian group $F \/ bb(Z)$.
  Such a normalized positive mean exists by amenability of abelian groups;
  see #cite(label("Bekka2008"), form: "prose") Theorem G.2.1.
  Because the group is discrete, the mean is defined on every bounded function.
  Invariant means and the finite-set averaging criterion originate in the work of
  #cite(label("vonNeumann1929"), form: "prose") and #cite(label("Folner1955"), form: "prose").
  The restriction of $frak(m)$ to ordinary continuous periodic functions is integration over the usual circle.
  To check this, every nonconstant ordinary circle character is multiplied by a nontrivial scalar under some
  translation from $F \/ bb(Z)$, and hence has mean zero. Trigonometric-polynomial approximation gives the
  assertion for all continuous periodic functions.

For a bounded function $h : F arrow.r bb(C)$ supported in a bounded interval, define

#[#set math.equation(numbering: n => "(2.3)")
 $ I \( h \) = frak(m) (t + bb(Z) mapsto sum_(k in bb(Z)) h \( t + k \)) . $ <eq:spectral-invariant-integral>]

The periodization is well defined and bounded: only a uniformly bounded number of summands can be nonzero.
  The functional $I$ is positive and translation invariant under $F$.
  For a continuous compactly supported function $phi.alt$ on $bb(R)$, it satisfies

$ I \( phi.alt \|_F \) = integral_(bb(R)) phi.alt \( t \) thin d t . $

We also use $I$ to integrate bounded, boundedly supported functions with values in a Hilbert space,
  in the weak sense. Scalar pairings define a bounded functional on the Hilbert space,
  and Hilbert-space duality gives the resulting vector. In particular, if $V \( t \)$ is such a function, then

$ lr(bar.v.double I \( V \) bar.v.double) lt.eq I #scale(x: 120%, y: 120%)[\(]
  lr(bar.v.double V \( t \) bar.v.double) #scale(x: 120%, y: 120%)[\)] . $

This construction does not impose ordinary real-variable measurability on $V$ or on a Fourier coefficient
  restricted to $F$.

#thm([Lemma 2.5.])[
  (Vanishing line average).  #emph[If $nu$ is wild, then
#[#set math.equation(numbering: n => "(2.4)")
 $ I #scale(x: 120%, y: 120%)[\(] phi.alt \( t \) f_nu \( a t \) #scale(x: 120%, y: 120%)[\)] = 0 wide
   #scale(x: 120%, y: 120%)[\(] a in E \\ { 0 } \, med phi.alt in C_c \( bb(R) \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:source-2>]

]
] <lem:line-average>

#proof[
  On $L^2 \( nu \)$ consider the unitary representation of the additive group $F$ given by
  $ T_t v = psi_(a t) v . $
  First, this representation has no nonzero vector that is strongly continuous for the usual topology on $F$.
    Suppose that $v$ is such a vector. Put
  $ c_v \( t \) = integral_D \| v \|^2 psi_(a t) thin d nu . $
  It is positive definite and uniformly continuous on $F$, since
  $ \| c_v \( t + s \) - c_v \( t \) \| lt.eq lr(bar.v.double v bar.v.double)_2
    lr(bar.v.double T_s v - v bar.v.double)_2 . $
  It therefore extends continuously to $bb(R)$. The extension remains positive definite,
    by approximation of each finite set of real arguments by elements of $F$.
  Apply the ordinary Bochner theorem to this continuous positive-definite function on $bb(R)$;
    see #cite(label("Bekka2008"), form: "prose") Theorem D.2.2.
    It is important here that the coefficient has first been extended to $bb(R)$;
    no local compactness of $F$ in its usual topology is assumed.
    Push its finite positive representing measure to $hat(F_(upright("disc")))$ using the continuous-character
    parametrization. Its Fourier coefficients agree with those of the restriction-map pushforward of $\| v \|^2
    nu$. Uniqueness of Fourier coefficients for finite measures on the compact character group identifies these
    two measures. Indeed, the characters form a unital conjugation-closed algebra separating its points,
    so their uniform density in the continuous functions gives this uniqueness.
    The pushforward of $\| v \|^2 nu$ is thus concentrated on the ordinary continuous characters,
    so $\| v \|^2 nu$ is concentrated on $L_a$. Lemma 9 gives $nu \( L_a \) = 0$, and hence $v = 0$.
  Now form the weak integral
  $ V_phi.alt = I #scale(x: 120%, y: 120%)[\(] phi.alt \( t \) T_t 1 #scale(x: 120%, y: 120%)[\)] in L^2 \( nu \) . $
  Translation invariance of $I$ gives
  $ T_s V_phi.alt - V_phi.alt = I #scale(x: 120%, y: 120%)[\(] \( phi.alt \( t - s \) - phi.alt \( t \) \) T_t 1
    #scale(x: 120%, y: 120%)[\)] \, $
  and consequently
  $ lr(bar.v.double T_s V_phi.alt - V_phi.alt bar.v.double)_2 lt.eq
    I \( \| phi.alt \( dot.op - s \) - phi.alt \| \) = integral_(bb(R)) \| phi.alt \( t - s \) -
    phi.alt \( t \) \| thin d t arrow.r 0 $
  as $s in F$ tends to zero. Thus $V_phi.alt$ is strongly continuous and must be zero by the preceding argument.
    Pairing with the constant function proves (2.4). ◻
]

=== 2.3 A measurable equivariant center <a-measurable-equivariant-center>

The subgroup $C$ need not be closed. We will nevertheless choose a canonical representative of a positive-mass
  $C$-coset when a probability kernel on that coset is available.
  The following elementary location rule avoids any moment assumption on that kernel.

#thm([Lemma 2.6.])[
  #emph[For every Borel probability measure $lambda$ on $bb(R)^2$, the function
#[#set math.equation(numbering: n => "(2.5)")
 $ J_lambda \( s \) = integral_(bb(R)^2) (sqrt(1 + \| s - t \|^2) - sqrt(1 + \| t \|^2)) thin d lambda \( t \)
   $ <eq:spectral-location-objective>]

 has a unique minimizer $L \( lambda \)$. The map $lambda mapsto
   L \( lambda \)$ is Borel for the usual Borel structure on the space of probability measures.
   It is equivariant under translations and orthogonal maps.]
] <lem:spectral-location>

#proof[
  The difference in (2.5) is bounded in absolute value by $\| s \|$.
    The objective is therefore finite without a first-moment assumption.
    It is Lipschitz in $s$ and strictly convex, because $s mapsto
    sqrt(1 + \| s - t \|^2)$ is strictly convex for every $t$.
  Choose $R > 0$ with $p = lambda \( overline(B \( 0 \, R \)) \) > 1 \/ 2$.
    On this ball the integrand is at least $\| s \| - R - sqrt(1 + R^2)$,
    and elsewhere it is at least $- \| s \|$. Hence
  $ J_lambda \( s \) gt.eq \( 2 p - 1 \) \| s \| - p #scale(x: 120%, y: 120%)[\(] R +
    sqrt(1 + R^2) #scale(x: 120%, y: 120%)[\)] arrow.r oo . $
  Coercivity and continuity give a minimizer, and strict convexity gives uniqueness.
  For each fixed $s$, the integrand is bounded and continuous in $t$,
    so $lambda mapsto J_lambda \( s \)$ is Borel. The infimum over rational points equals the minimum.
    Enumerate $bb(Q)^2$ and, for each positive integer $n$, choose its first point whose objective is less than
    that infimum plus $1 \/ n$. These choices are measurable.
    For a fixed $lambda$ they converge to the unique minimizer:
    coercivity confines all sufficiently accurate choices to a compact set,
    and every cluster point minimizes $J_lambda$. Their limit is therefore the Borel map $L$.
  If $lambda'$ is the law of $t - r$ for $t$ of law $lambda$, then an identity of bounded differences gives
  $ J_(lambda') \( s \) = J_lambda \( s + r \) - J_lambda \( r \) . $
  Thus $L \( lambda' \) = L \( lambda \) - r$. Orthogonal covariance follows from $J_(O_(*) lambda) \( O s \) =
    J_lambda \( s \)$. These identities prove both asserted equivariances. ◻
]

=== 2.4 Compact towers and relative singularity <compact-towers-and-relative-singularity>

We use standard probability spaces and probability-preserving actions of the countable group $K$.
  Factors are countably generated modulo null sets. For an action write $U_k H \( x \) = H \( k x \)$,
  and identify functions on a factor with their pullbacks. Conditional kernels, factor actions,
  and equivariant maps may be chosen on common conull sets whenever needed; the acting group is countable.

We use disintegration in the following precise form. A factor map $pi : X arrow.r
  Y$ between standard Borel probability models admits a measurable probability kernel $y mapsto mu_y$,
  concentrated on $pi^(- 1) \( y \)$ for almost every $y$, such that $mu = integral mu_y thin d nu \( y \)$.
  The kernel gives conditional expectations by integration and is unique almost everywhere;
  see #cite(label("TaoDisintegration2008"), form: "prose") Theorem 4 and Remark 5.
  For an equivariant factor map, uniqueness makes the kernel equivariant for each group element.
  Intersecting the corresponding conull sets makes equivariance simultaneous for the countable group $K$.
  This is the fiber-measure input to all relative products below.

Consider a tower $\( Y_alpha \)_(alpha lt.eq theta)$ of factors of an ergodic system $X$,
  where $theta$ is a countable ordinal. Start with the trivial factor $Y_0$,
  and at a limit ordinal take the factor generated by the preceding ones.
  Require the following approximation property at each successor $Y$ over its predecessor $W$:
  for every bounded $H$ on $Y$ and every $epsilon > 0$, there are bounded functions $H_1 \, dots.h \,
  H_q$ on $Y$ and a finite constant $B$ such that, for every $k in K$,

#[#set math.equation(numbering: n => "(2.6)")
 $ ∥U_k H - sum_(r = 1)^q b_r^k H_r∥_2 < epsilon quad upright("for some ") b_r^k in L^oo \( W \) upright(" with ")
   parallel b_r^k parallel_oo lt.eq B . $ <eq:source-4>]

The basis functions and bounds are fixed before $k$ is chosen.

#thm([Lemma 2.7.])[
  (Relative singularity).  #emph[Let $X$ be an ergodic standard probability-preserving $K$-system, and let $d :
    X arrow.r D$ be an equivariant measurable map with wild law.
    For every countable tower of factors as above, and every factor $Y$ in that tower, the law $nu_Y$ of
$ d \( x \) - d \( x' \) $

 for two conditionally independent samples of $X$ over $Y$ satisfies $nu_Y \( C \) = 0$.]
] <lem:relative-singularity>

#proof[
  All relative difference laws in the statement are $K$-invariant, by equivariance of conditional kernels.
    We use transfinite induction in its universal form: at each ordinal the assertion ranges over #emph[all]
    ambient ergodic standard systems, equivariant maps with wild law, and towers satisfying (2.6).
    This allows an earlier induction assertion to be applied below to a new factor system and a new equivariant map.
  At the trivial factor the assertion is Lemma 9. Suppose that it holds at every earlier ordinal,
    and that it fails at a noninitial stage $Y$ of a tower in a system $X$.
    Write $kappa_y$ for the conditional law of $d$ over $y in Y$.
  ===== 2.4.1 Positive-mass cosets and their centers. <positive-mass-cosets-and-their-centers.>
  The function
  $ r \( y \, z \) = kappa_y \( z + C \) = integral_D upright(bold(1))_C \( d' - z \) thin d kappa_y \( d' \) $
  is Borel in $\( y \, z \)$, by Borel parameter integration.
    This uses only that $C$ is Borel, not that it is closed. The function $x mapsto
    r \( y \( x \) \, d \( x \) \)$ is invariant and has integral $nu_Y \( C \) > 0$.
    Ergodicity makes it a positive constant $a$ almost everywhere.
  For almost every $y$, therefore, $kappa_y$-almost every sampled coset has mass $a$.
    Such cosets are disjoint and there are only finitely many; they exhaust the probability.
    Their number $m$ satisfies $m a = 1$, and is consequently independent of $y$.
    Thus $kappa_y$ is concentrated on $m$ distinct cosets of mass $1 \/ m$ each.
    None is $C$ almost surely, because the original marginal law gives $C$ measure zero.
  On the Borel set $r \( y \, z \) > 0$, define the probability kernel $lambda_(y \, z)$ on $bb(R)^2$ by
  $ lambda_(y \, z) \( A \) = frac(1, r \( y \, z \)) integral_D upright(bold(1))_C \( d' - z \)
    upright(bold(1))_A #scale(x: 120%, y: 120%)[\(] j^(- 1) \( d' - z \) #scale(x: 120%, y: 120%)[\)] thin d
    kappa_y \( d' \) $
  for Borel $A subset bb(R)^2$, interpreting the integrand as zero off $C$.
    The Borel inverse of $j$ makes this a measurable kernel. Set
  $ b \( y \, z \) = z + j #scale(x: 120%, y: 120%)[\(] L \( lambda_(y \, z) \) #scale(x: 120%, y: 120%)[\)] . $
  If $z$ is replaced by $z + j \( r_0 \)$, the kernel is translated by $- r_0$;
    Lemma 11 shows that $b \( y \, z \)$ is unchanged. It is therefore constant on each positive-mass coset,
    and remains in that coset. The same lemma and the orthogonal action of $K$ on frequency parameters show
  $ b \( k y \, k z \) = k b \( y \, z \) $
  on the relevant conull sets.
  Let $Z$ be the factor of $X$ generated by $Y$ and $b \( x \) = b \( y \( x \) \, d \( x \) \)$.
    It is a standard ergodic factor. The map $b : Z arrow.r D$ is equivariant and has wild law.
    Its conditional law $beta_y$ over $Y$ is uniform on the $m$ distinct centers of the positive-mass cosets.
    We have converted the hypothetical failure of singularity into a finite set of equivariant centers over each
    fiber. The earlier induction hypothesis and the line average will give selected real algebraic frequencies
    with small conditional collision probabilities on a common fiber.
    Compact approximation, however, will force many pairs of unit-direction phase lists to match one pair of
    lists. Writing each selected frequency as a sum of its two directions then places its phases near at most
    $m^2$ products, forcing a larger collision probability.
  ===== 2.4.2 A finite list of phases. <a-finite-list-of-phases.>
  For each $y$, consider the unordered list of $m$ phases $psi_1$ at the points of $beta_y$,
    retaining repetitions when phases coincide. Encode this list by the vector $H \( y \) in
    bb(C)^m$ of its elementary symmetric functions. The vector is measurable:
    its power sums are $m integral psi_1^n thin d beta_y$, and Newton’s identities recover the elementary
    symmetric functions. It is bounded.
  The encoding is a continuous injection of the compact space $bb(T)^m \/ S_m$ into $bb(C)^m$.
    On unordered lists use maximum matching distance,
  $ d_(upright("match")) \( \[ z_1 \, dots.h \, z_m \] \, \[ z'_1 \, dots.h \, z'_m \] \) =
    min_(pi in S_m) max_(1 lt.eq r lt.eq m) \| z_r - z'_(pi \( r \)) \| . $
  The inverse encoding is uniformly continuous for this metric.
    Equivariance of $beta_y$ and $psi_1 \( k d \) = psi_k \( d \)$ show that $U_k
    H$ encodes the list of phases at $psi_k$.
  Choose $rho > 0$ so small that uniform-circle probability of ${ \| z - 1 \| lt.eq
    5 rho }$ is less than $1 \/ \( 16 m^2 \)$. There are an integer $N gt.eq
    1$ and a constant $c > 0$ with the following property: if a probability $omega$ on $bb(T)$ satisfies
  $ lr(|integral z^n thin d omega \( z \)|) < c wide \( 1 lt.eq n lt.eq N \) \, $
  then
  #[#set math.equation(numbering: n => "(2.7)")
   $ omega { \| z - 1 \| lt.eq 4 rho } < frac(1, 4 m^2) . $ <eq:spectral-small-arc>]
  Indeed, choose a continuous majorant of the smaller arc that takes values in $\[ 0 \, 1 \]$ and vanishes outside
    the larger arc. Approximate it uniformly within $1 \/ \( 64 m^2 \)$ by a real trigonometric polynomial of
    degree at most $N$. The constant coefficient is within that error of its circle integral.
    Choose $c$ so that $c$ times the sum of the absolute values of its nonconstant coefficients is less than
    $1 \/ \( 32 m^2 \)$. The integral against $omega$ of the majorant is then less than $1 \/ \( 8 m^2 \)$,
    which proves (2.7). Negative moments are controlled by the positive ones because $omega$ is a positive measure.
  Choose $s > 0$ such that two encoding vectors at distance less than $s$ have phase lists matching within $rho$.
    Put $tau = s \/ 100$, and fix $gamma > 0$ such that
  #[#set math.equation(numbering: n => "(2.8)")
   $ frac(2 gamma^2, tau^2) < 10^(- 4) . $ <eq:spectral-error-choice>]
  ===== 2.4.3 Return to an earlier factor. <return-to-an-earlier-factor.>
  The rotations of $H$ admit vector-valued approximations of the form
  #[#set math.equation(numbering: n => "(2.9)")
   $ ∥U_k H - sum_(r = 1)^q b_r^k H_r∥_2 < gamma \, wide parallel b_r^k parallel_oo lt.eq B \,
     $ <eq:spectral-vector-approximation>]
  with fixed bounded $bb(C)^m$-valued functions $H_r$ on $Y$ and coefficients over some earlier factor $W$.
    At a successor this follows from (2.6), applied to the finitely many coordinates and combining their data.
    At a limit, first approximate $H$ in $L^2$, within $gamma \/ 2$,
    by bounded functions on an earlier successor factor. Such approximation follows from generation of the limit
    factor, for example by conditional expectations. Its error remains unchanged under rotation.
    Then use (2.6) at that successor, with its predecessor as $W$,
    to obtain a further error less than $gamma \/ 2$. Combining coordinates gives (2.9).
    The coordinate count, number of basis functions, their uniform bounds, and $B$ are all fixed independently of $k$.
  The earlier tower through $W$ is also a tower of factors of $Z$:
    $Z$ contains $Y$ and hence every predecessor of $Y$. All measures, actions, limit joins,
    and approximation properties of those factors are unchanged.
    The universal earlier induction assertion therefore applies in $Z$ to the map $b$.
    It says that the difference law of $b$ over $W$ is wild. Its Fourier coefficient at $a in E$ is
  #[#set math.equation(numbering: n => "(2.10)")
   $ p \( a \) = ∥bb(E)_Z \( psi_a \( b \) divides W \)∥_2^2 gt.eq 0 \, $ <eq:spectral-conditional-coefficient>]
  by conditional independence. Lemma 10 applies to this coefficient function.
  ===== 2.4.4 Fixing the number of tests before choosing a small parameter. <fixing-the-number-of-tests-before-choosing-a-small-parameter.>
  At any fixed fiber of $W$, the two coefficient arrays for two approximations in (2.9) belong to a fixed bounded
    subset of $bb(C)^(2 q)$. Partition this subset into a finite number $L$ of bins so fine that, within one bin,
    the corresponding approximating functions differ pointwise by at most $tau$ for each of the two vectors.
    For example, coordinate diameters less than
  $ frac(tau, 1 + sum_(r = 1)^q parallel H_r parallel_oo) $
  suffice. The number $L$ is independent of the fiber and of the chosen rotations.
    Fix an integer $M gt.eq 2$ so large that
  $ frac(0.9 M, L) > 10 m^2 . $
  All approximation data have been fixed before this choice.
  There is a nonzero $t in F$ with $\| t \| < 1 \/ M$ for which every value
  $ p #scale(x: 120%, y: 120%)[\(] n \( j - l \) t #scale(x: 120%, y: 120%)[\)] \, wide 1 lt.eq n lt.eq N \, quad
    1 lt.eq j \, l lt.eq M \, quad j eq.not l \, $
  is as small as we prescribe. To see this, choose a nonnegative $phi.alt in
    C_c \( \( - 1 \/ M \, 1 \/ M \) \)$ with positive integral.
    Each indicated nonnegative test has zero $phi.alt$-weighted $I$-integral by (2.4). Their finite sum does too.
    If that sum were bounded below by a prescribed positive number at every point where $phi.alt > 0$,
    positivity of $I$ would contradict $I \( phi.alt \) > 0$.
    Thus some such point makes their sum, and hence every test, as small as required.
    Choosing this bound below one also ensures $t eq.not 0$, since $p \( 0 \) = 1$.
  Set $x_j = j t$. Choose the prescribed smallness so that Markov’s inequality and a finite union bound give,
    on a set of $W$-probability greater than $0.99$, all of the bounds
  $
    lr(|bb(E)_Z #scale(x: 120%, y: 120%)[\(] psi_(n \( x_j - x_l \)) \( b \) divides W = w
    #scale(x: 120%, y: 120%)[\)]|) < c wide \( 1 lt.eq n lt.eq N \, med j < l \) . $
  More explicitly, the probability of failure of any one bound is at most $p \( n \( x_j - x_l \) \) \/ c^2$,
    by (2.10); there are finitely many bounds. Apply (2.7) to the conditional law of $psi_(x_j - x_l) \( b \)$.
    On the same set of fibers,
  #[#set math.equation(numbering: n => "(2.11)")
   $ bb(P)_Z #scale(x: 120%, y: 120%)[\(] \| psi_(x_j) \( b \) - psi_(x_l) \( b \) \| lt.eq 4 rho divides W =
     w #scale(x: 120%, y: 120%)[\)] < frac(1, 4 m^2) wide \( 1 lt.eq j < l lt.eq M \) . $ <eq:source-5>]
  ===== 2.4.5 A common coefficient bin on a good fiber. <a-common-coefficient-bin-on-a-good-fiber.>
  Each $\| x_j \| < 1$ is a sum of two elements of $K$. One explicit choice is
  $ k_j = x_j / 2 + i sqrt(1 - x_j^2 / 4) \, wide k'_j = x_j / 2 - i sqrt(1 - x_j^2 / 4) . $
  The square roots belong to $F$, and $x_j = k_j + k'_j$. Apply the fixed approximations (2.9) to $U_(k_j)
    H$ and $U_(k'_j) H$ for every $j$.
  Let $e_j^(+) \( w \) \, e_j^(-) \( w \)$ be the respective conditional squared $L^2$ errors on the fiber of $Y$
    over $w$. Their global integrals are less than $gamma^2$.
    If at least $0.1 M$ indices fail to have both conditional $L^2$ errors less than $tau$, then
  $ 1 / M sum_(j = 1)^M \( e_j^(+) \( w \) + e_j^(-) \( w \) \) gt.eq 0.1 tau^2 . $
  Markov’s inequality and (2.8) bound the probability of this event by
  $ frac(20 gamma^2, tau^2) < 0.001 . $
  In particular, on a set of fibers of probability greater than $0.99$,
    more than $0.9 M$ indices have both conditional errors less than $tau$.
  Fix a fiber $w$ satisfying this property and all of (2.11),
    and avoid the null sets for the finitely many identities and bounds used here.
    Bin the two coefficient arrays at this $w$ as above. There is a subset $J$ of the good indices in a single bin
    with $\| J \| > 10 m^2$. Fix $j_0 in J$. For either type of encoding the conditional $L^2$ distance from index
    $j$ to index $j_0$ is at most $3 tau$: the two approximation errors each cost less than $tau$,
    and the approximants differ pointwise by at most $tau$.
  For a uniform $j in J$ and a conditional point $y$ over $w$,
    the probability that either encoding distance is at least $s$ is at most
  $ frac(18 tau^2, s^2) = 0.0018 . $
  Thus, with probability greater than $0.95$, both phase lists for index $j$ match their respective representative
    lists for $j_0$ within $rho$. Let $q \( y \)$ be the fraction of indices in $J$ for which both matches hold. We have
  #[#set math.equation(numbering: n => "(2.12)")
   $ bb(E) \( q divides W = w \) > 0.95 . $ <eq:spectral-matching-fraction>]
  ===== 2.4.6 The collision contradiction. <the-collision-contradiction.>
  Fix such a fiber point $y$ and any point $b_0$ in the support of $beta_y$.
    For every matching index $j$, the two phases $psi_(k_j) \( b_0 \)$ and $psi_(k'_j) \( b_0 \)$ are within $rho$
    of entries of their respective representative lists. Consequently
  $ psi_(x_j) \( b_0 \) = psi_(k_j) \( b_0 \) psi_(k'_j) \( b_0 \) $
  is within $2 rho$ of one of the at most $m^2$ products of entries from those two lists.
    The matchings need not identify the same center in the two lists; allowing all $m^2$ products accounts for this.
  Assign each of the $q \( y \) \| J \|$ matching indices to one such product.
    By the sum-of-squares inequality, the number of ordered pairs assigned to the same product is at least
    $q \( y \)^2 \| J \|^2 \/ m^2$. Removing diagonal pairs discards at most $\| J \|$ pairs.
    Hence, for independent uniform $j \, l in J$,
  $ bb(P)_(j \, l) #scale(x: 120%, y: 120%)[\(] j eq.not l \, med \| psi_(x_j) \( b_0 \) -
    psi_(x_l) \( b_0 \) \| lt.eq 4 rho #scale(x: 120%, y: 120%)[\)] gt.eq frac(q \( y \)^2, m^2) - frac(1, \| J \|) . $
  This bound holds for every possible center $b_0$, so it can be integrated first over $beta_y$ and then over the
    conditional law of $y$ given $w$. Jensen’s inequality and (2.12) give a lower bound strictly greater than
  $ 0.95^2 / m^2 - frac(1, \| J \|) > frac(0.95^2 - 0.1, m^2) > frac(1, 4 m^2) . $
  But (2.11) bounds the conditional collision probability for every distinct pair in the original set of $M$
    indices by $1 \/ \( 4 m^2 \)$. Averaging those bounds over the selected $J$ gives an upper bound smaller than
    $1 \/ \( 4 m^2 \)$. Choosing $J$ after fixing $w$ is harmless because all those pair bounds hold
    simultaneously at that fiber. This contradiction completes the induction step,
    and hence the universal transfinite induction. ◻
]

== 3 Compact factors, multiple averages, and Haar rigidity <sec:rigidity>

We complete the proof of Theorem 8. The first step constructs a factor to which Lemma 12 applies and above which
  conditional correlations decouple. Two identities among algebraic unit directions then turn this decoupling into
  a difference inequality for a radial function. A finite number-field argument forces that function to vanish
  away from zero.

Throughout this section a relative product uses conditional independence over the indicated factor.
  If $pi : X arrow.r Y$ is a factor map and $mu = integral mu_y thin d nu \( y \)$ is its disintegration,
  its relative product has measure

$ mu times_Y mu = integral mu_y ⊗ mu_y thin d nu \( y \) $

on $X times_Y X$. The action on this product is diagonal.
  All factors are understood modulo null sets; countability of $K$ permits all the countably many equivariance
  identities to be imposed simultaneously.

=== 3.1 A compact-factor tower <a-compact-factor-tower>

The following construction is the compact/relative-weak-mixing part of the Furstenberg–Zimmer structure theorem
  and relative dichotomy #cite(label("Furstenberg1977")) #cite(label("ZimmerExtensions1976"))
  #cite(label("ZimmerDiscrete1976")) #cite(label("JamneshanStructure")) #cite(label("JamneshanCorrigendum")).
  The passage from invariant Hilbert–Schmidt kernels to finite-rank modules,
  and the boundedness of their bases in the ergodic case, appear in #cite(label("Furstenberg1977"), form: "prose")
  Lemmas 6.6 and 7.2. We give the fiberwise proof because the particular approximation property (2.6) is needed here.

#thm([Lemma 3.1.])[
  (Compact tower).  #emph[Let $X$ be an ergodic standard probability-preserving $K$-system.
    There is a countable ordinal $eta$ and an increasing tower of factors $\( Y_alpha \)_(alpha lt.eq eta)$ with
    the following properties:]
  + #emph[$Y_0$ is the trivial factor, and each limit stage is the factor generated by its predecessors;]
  + #emph[every successor extension $Y_(alpha + 1) arrow.r Y_alpha$ satisfies (2.6);]
  + #emph[for $Y = Y_eta$, the system $X times_Y X$ is ergodic.]
] <lem:compact-tower>

#proof[
  We first construct a strict extension $Y'$ of any factor $Y$ whose relative product is not ergodic.
    An invariant kernel on that product will provide an equivariant finite-rank space on almost every fiber.
    Its bounded basis generates $Y'$ and supplies the approximation property (2.6). We then iterate this enlargement.
  Suppose that $Y$ has already been constructed and that $X times_Y X$ is not ergodic.
    Choose a bounded invariant nonconstant kernel $L \( x \, x' \)$ on this relative product.
    Its conditional expectations onto either coordinate are invariant functions on $X$,
    so both are the constant $integral L thin d \( mu times_Y mu \)$. Subtract this constant.
    The result is still nonzero, and its two coordinate conditional expectations are zero.
  For almost every $y$, let $A_y$ be the integral operator with kernel $L$ on the fiber Hilbert space $cal(H)_y =
    L^2 \( mu_y \)$. These are Hilbert–Schmidt operators, with
  $ lr(bar.v.double A_y bar.v.double)_(upright("HS")) lt.eq lr(bar.v.double L bar.v.double)_oo \, wide A_y 1 =
    A_y^(*) 1 = 0 . $
  Invariance of the kernel makes the operator field equivariant under the unitary maps between fibers.
    For a sufficiently small fixed $delta > 0$, the spectral projection
  $ Q_y = upright(bold(1))_(\( delta \, oo \)) \( A_y^(*) A_y \) $
  is nonzero on a positive-measure set of fibers. Its rank is finite and bounded above by
    $lr(bar.v.double L bar.v.double)_oo^2 \/ delta$. The rank is invariant on $Y$,
    and $Y$ is ergodic as a factor of $X$. It is therefore a constant integer $d gt.eq 1$ almost everywhere.
    The range of $Q_y$ is orthogonal to the fiber constants.
  Here are the measurability details for this construction.
    Work with standard Borel models and fiber-supported conditional probabilities.
    Choose a countable algebra generating the Borel structure of $X$ and its simple functions with
    complex-rational coefficients. Their restrictions are dense in each $L^2 \( mu_y \)$.
    Conditional integration against the bounded kernel represents the images of these sections under $A_y$ and
    $A_y^(*)$ by measurable functions on $X$; the same holds for polynomials in $A_y^(*) A_y$.
    On their common bounded spectral interval, there are uniformly bounded polynomials converging pointwise to
    $upright(bold(1))_(\( delta \, oo \))$: first choose bounded continuous approximations to this indicator,
    with value zero at $delta$, and then uniformly approximate them by polynomials.
    Spectral calculus gives convergence in each fiber Hilbert norm.
    Domination gives convergence in global $L^2 \( X \)$ as well.
    A subsequence converges in fiber norm for almost every $y$,
    identifying the global limit with the projected section. Thus the projected dense sections are measurable.
    Their fiber scalar products make rank and linear-independence tests measurable.
    Selecting the first available independent section at each step and applying fiberwise Gram–Schmidt gives
    measurable fiber-orthonormal sections $e_1 \, dots.h \, e_d$ spanning the range of $Q_y$.
  For each $k in K$ the sections $U_k e_i$ differ from the $e_i$ by a unitary coefficient matrix over $Y$.
    Consequently $sum_(i = 1)^d \| e_i \( x \) \|^2$ is invariant on $X$. Its integral is $d$, so ergodicity gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ sum_(i = 1)^d \| e_i \( x \) \|^2 = d quad upright("almost everywhere") . $ <eq:rigidity-bounded-basis>]
  In particular, the sections are bounded. Adjoin them to $Y$ to generate an invariant factor $Y'$.
    This is a strict extension: every $e_i$ has conditional mean zero over $Y$ and has unit fiber norm,
    and hence is not $Y$-measurable.
  Bounded polynomials in the $e_i \, macron(e)_i$, with bounded coefficients from $Y$,
    are dense in $L^2 \( Y' \)$. Indeed these functions form a bounded unital conjugation-closed algebra
    generating $Y'$, and approximation first by functions of finitely many generators and then by polynomials
    gives the density. A rotation of a fixed polynomial expands into finitely many fixed bounded monomials in the
    $e_i \, macron(e)_i$. Its coefficients are functions on $Y$, uniformly bounded independently of the rotation:
    the original coefficient sup norms are preserved, and the entries of the unitary matrices have modulus at most
    one. For a bounded $H$ on $Y'$, choose one polynomial approximation in $L^2$.
    Rotating preserves its approximation error. The finite expansion of the rotated polynomial proves (2.6) for
    $Y' arrow.r Y$.
  Starting at the trivial factor, repeat this step whenever the relative product is not ergodic,
    and take generated joins at limit ordinals. Every countable stage is a standard factor modulo null sets.
    The process stops at a countable ordinal. Otherwise, at every successor through all countable ordinals,
    choose a unit vector in the new factor orthogonal to the preceding factor.
    Nestedness makes these vectors pairwise orthogonal. There would be $ℵ_1$ such vectors,
    contradicting separability of $L^2 \( X \)$. At the stopping stage the relative product is ergodic by the
    stopping rule. ◻
]

=== 3.2 Conditional multiple averages <conditional-multiple-averages>

A Følner sequence in $K$ means nonempty finite sets $Phi_N subset K$ such that

$ frac(\| h Phi_N triangle.stroked.t Phi_N \|, \| Phi_N \|) arrow.r 0 wide \( h in K \) . $

Such sequences exist because $K$ is countable abelian. Write $"Avg"_(u in Phi) b_u = \| Phi \|^(- 1)
  sum_(u in Phi) b_u$. Every average below is a finite-set average in this discrete group.

We use the Hilbert-space mean ergodic theorem in its every-Følner form.
  For a unitary representation $V$ of $K$, these averages converge strongly to the invariant projection along
  every Følner sequence. For completeness, the orthogonal complement of the invariant vectors is the closed span
  of vectors $V_h v - v$. The average of such a vector has norm at most $\| h Phi_N triangle.stroked.t Phi_N \|
  lr(bar.v.double v bar.v.double) \/ \| Phi_N \|$, and density proves the claim.
  In particular, the representation $u mapsto U_(u^d)$, for $d in bb(Z) \\ { 0 }$,
  has the same invariant vectors as $U$, because the power map $u mapsto u^d$ is onto.
  No assertion about unweighted images of Følner sets under a power map is needed.

The proof below uses the relative weak-mixing induction for multiple averages,
  with a Hilbert-space van der Corput estimate; compare #cite(label("Furstenberg1977"), form: "prose").
  We give the argument for the power maps of $K$ along every Følner sequence, since both features are used below.

#thm([Lemma 3.2.])[
  (Conditional multiple averages).  #emph[Suppose that $X$ is an ergodic standard probability-preserving
    $K$-system, that $Y$ is an invariant factor, and that $X times_Y X$ is ergodic.
    Let $P = bb(E) \( thin dot.op divides Y \)$. For pairwise distinct integers $n_1 \, dots.h \,
    n_l$ and bounded functions $v_1 \, dots.h \, v_l$ on $X$,
#[#set math.equation(numbering: n => "(3.2)")
 $ "Avg"_(u in Phi_N) ∥P (product_(j = 1)^l U_(u^(n_j)) v_j) - product_(j = 1)^l U_(u^(n_j)) P v_j∥_2^2 arrow.r
   0 $ <eq:source-6>]

 along every Følner sequence $\( Phi_N \)$ in $K$. The pair criterion used in the proof is, for bounded $v \,
   w$ and $d eq.not 0$,
#[#set math.equation(numbering: n => "(3.3)")
 $ "Avg"_(u in Phi_N) lr(bar.v.double P \( v U_(u^d) w \) - P v thin U_(u^d) P w bar.v.double)_2^2 arrow.r
   0 . $ <eq:source-7>]

]
] <lem:multiple-averages>

#proof[
  Put $cal(R) = X times_Y X$ and denote its conditional expectation onto $Y$ by $P_(cal(R))$. First prove (3.3).
    With $v_0 = v - P v$ and $w_0 = w - P w$, its difference equals $P \( v_0 U_(u^d) w_0 \)$.
    Conditional independence gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ lr(bar.v.double P \( v_0 U_(u^d) w_0 \) bar.v.double)_2^2 =
     integral_(cal(R)) \( v_0 ⊗ macron(v)_0 \) U_(u^d) \( w_0 ⊗ macron(w)_0 \) thin d mu_(cal(R)) .
     $ <eq:rigidity-pair-tensor>]
  The integral of $w_0 ⊗ macron(w)_0$ is $integral_Y \| P w_0 \|^2 thin d nu = 0$.
    The mean ergodic theorem on the ergodic system $cal(R)$, applied through the surjective power map,
    makes the average of the right side tend to zero. This proves the pair criterion along every Følner sequence.
  The same criterion holds on $cal(R)$ over $Y$. To see this first for simple tensors $v = a_1 ⊗ a_2$ and $w =
    b_1 ⊗ b_2$, use
  $ P_(cal(R)) \( v U_(u^d) w \) = P \( a_1 U_(u^d) b_1 \) P \( a_2 U_(u^d) b_2 \) . $
  Subtract the analogous product of the factor parts. The difference is a sum of two terms,
    each containing one error from (3.3) on $X$ and one uniformly bounded factor.
    Its averaged squared $L^2 \( Y \)$ norm therefore tends to zero.
    Linearity gives the result for finite sums of tensors. Such sums can approximate any bounded function on
    $cal(R)$ in $L^2$, with a common sup bound: use conditional expectations onto finite partitions generated by
    rectangles in the two coordinates. Approximate one of $v \, w$ at a time;
    conditional-expectation contraction and measure preservation bound the error uniformly in $u$.
    The pair criterion follows for all bounded functions on $cal(R)$.
  We next prove the following vector assertion on either $X$ or $cal(R)$.
    On either system use $P$ for its expectation onto $Y$. If $n_1 \, dots.h \,
    n_l$ are distinct #emph[nonzero] integers, the $v_j$ are bounded, and $P v_(j_(*)) = 0$ for some $j_(*)$, then
  #[#set math.equation(numbering: n => "(3.5)")
   $ ∥"Avg"_(u in Phi_N) product_(j = 1)^l U_(u^(n_j)) v_j∥_2 arrow.r 0 $ <eq:rigidity-centered-vector>]
  for every Følner sequence. Both systems are ergodic and satisfy the pair criterion,
    so the same induction proves the assertion on each. By rescaling we may assume
    $lr(bar.v.double v_j bar.v.double)_oo lt.eq 1$.
  For $l = 1$, the assertion is mean ergodicity and $integral v_1 = integral P v_1 = 0$.
    Suppose it is proved for $l - 1$, and set
  $ V_u = product_(j = 1)^l U_(u^(n_j)) v_j \, wide F_(j \, h) = U_(h^(n_j)) v_j thin macron(v)_j quad \( h in K \) . $
  For each fixed $h$, invariance of the integral gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ integral V_(h u) overline(V_u) thin d mu & = integral product_(j = 1)^l U_(u^(n_j)) F_(j \, h) thin d mu\
 & = integral F_(l \, h) product_(j < l) U_(u^(n_j - n_l)) F_(j \, h) thin d mu . $ <eq:rigidity-vdc-correlation>]
  The $l - 1$ shifted exponents in the last expression are distinct and nonzero.
    Expand each shifted $F_(j \, h)$ into $P F_(j \, h)$ and its centered remainder.
    The induction hypothesis makes the average of every term with a centered shifted factor tend to zero in $L^2$;
    multiplying by the fixed bounded $F_(l \, h)$ does not affect that conclusion after integration.
    The remaining shifted product is $Y$-measurable, so the unshifted $F_(l \, h)$ may also be replaced by $P
    F_(l \, h)$ inside its integral. All the conditional factors are bounded by one. Hence, for every Følner sequence,
  #[#set math.equation(numbering: n => "(3.7)")
   $ limsup_(N arrow.r oo) lr(|"Avg"_(u in Phi_N) integral V_(h u) overline(V_u) thin d mu|) lt.eq a \( h \) \,
     wide a \( h \) = lr(bar.v.double P F_(j_(*) \, h) bar.v.double)_2 . $ <eq:rigidity-correlation-bound>]
  This bound also covers $j_(*) = l$: bound that unshifted factor in $L^1$, then in $L^2$,
    and the others in $L^oo$. If $j_(*) < l$, use the same bound on its shifted factor and measure preservation.
    The centered factor is therefore not lost by moving one exponent to zero.
  The pair criterion with $v = macron(v)_(j_(*))$, $w = v_(j_(*))$, and $d =
    n_(j_(*)) eq.not 0$ shows that averages of $a \( h \)^2$ tend to zero along #emph[every] Følner sequence;
    the same is true of $a \( h \)$ by Cauchy–Schwarz. If $\( Psi_M \)$ is any chosen Følner sequence, it follows that
  #[#set math.equation(numbering: n => "(3.8)")
   $ sup_(t in K) "Avg"_(h in Psi_M) a \( h t \) arrow.r 0 . $ <eq:rigidity-uniform-translates>]
  Indeed, a subsequence of bad translates would itself be a Følner sequence, because $K$ is abelian,
    contradicting the every-sequence vanishing just proved.
  To finish the induction, fix a finite nonempty shift set $S subset K$.
    The difference between the averages of $V_u$ and of $\| S \|^(- 1) sum_(h in S)
    V_(h u)$ tends to zero in norm by the Følner property. Jensen’s inequality and expansion in pairs of shifts give
  $ limsup_(N arrow.r oo) ∥"Avg"_(u in Phi_N) V_u∥_2^2 & lt.eq
    frac(1, \| S \|^2) sum_(h \, h' in S) limsup_(N arrow.r oo)
    lr(|"Avg"_(u in Phi_N) integral V_(h u) overline(V_(h' u)) thin d mu|)\
 & lt.eq frac(1, \| S \|^2) sum_(h \, h' in S) a \( h \( h' \)^(- 1) \) . $
  For the second inequality substitute $u' = h' u$ and apply (3.7) along the translated Følner sequence.
    Now take $S = Psi_M$. The last expression is bounded by $sup_t "Avg"_(h in Psi_M)
    a \( h t \)$ and tends to zero by (3.8). The limits are taken first in $N$ for fixed finite $S$,
    and only then in $M$. This proves (3.5).
  Finally, expand the product in (3.2) by writing each $v_j = P v_j + \( v_j - P v_j \)$.
    Consider a term $W_u = product_j U_(u^(n_j)) w_j$ with at least one $P w_j = 0$. Conditional independence gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ lr(bar.v.double P W_u bar.v.double)_2^2 = integral_(cal(R)) product_j U_(u^(n_j)) \( w_j ⊗ macron(w)_j \)
     thin d mu_(cal(R)) . $ <eq:rigidity-multiple-tensor>]
  The corresponding tensor is centered over $Y$, since $P_(cal(R)) \( w_j ⊗ macron(w)_j \) = \| P w_j \|^2$.
    In this scalar integral we may add one common integer to all exponents, by measure preservation,
    and choose it so that none of them is zero. Apply (3.5) on $cal(R)$. The average of (3.9) tends to zero.
    There are finitely many centered terms, so the squared norm of their sum has vanishing average as well.
    The term with no centered factor is already $Y$-measurable and equals the product of projections in (3.2).
    This proves the lemma. ◻
]

=== 3.3 The radial difference inequality <the-radial-difference-inequality>

Fix an ergodic wild $K$-invariant probability $mu$ on $D$.
  Apply Lemma 13 to the system $\( D \, mu \)$, and let $Y$ be its terminal factor.
  Lemma 12, applied to the identity map of $D$, says that the conditional difference law $nu_Y$ over this factor
  is wild. Set

#[#set math.equation(numbering: n => "(3.10)")
 $ P = bb(E) \( thin dot.op divides Y \) \, wide g_z = P psi_z \, wide m \( z \) =
   lr(bar.v.double g_z bar.v.double)_2^2 quad \( z in E \) . $ <eq:rigidity-projected-characters>]

Conditional independence identifies its Fourier transform as

#[#set math.equation(numbering: n => "(3.11)")
 $ integral_D psi_z thin d nu_Y = m \( z \) . $ <eq:rigidity-difference-fourier>]

In particular $0 lt.eq m \( z \) lt.eq 1$, $m \( 0 \) = 1$, and Lemma 10 gives (2.4) with $f_(nu_Y) = m$.

Conditional expectation commutes with the action, so $g_(u z) = U_u g_z$ and $m \( u z \) =
  m \( z \)$ for $u in K$. Equal nonzero moduli in $E$ differ by an element of $K$.
  Thus $m$ is radial; its radii lie in $F_(gt.eq 0)$, and we write $m \( r \)$ on that set.
  Also $g_(- z) = macron(g)_z$ and $lr(bar.v.double g_z bar.v.double)_oo lt.eq 1$.

#thm([Lemma 3.3.])[
  (Radial identities).  #emph[For $w \( r \) = - log m \( r \) in \[ 0 \, oo \]$, with $- log 0 = oo$, one has
#[#set math.equation(numbering: n => "(3.12)")
 $ w \( \| A - B \| \) lt.eq w \( A \) + w \( B \) wide \( A \, B in F_(gt.eq 0) \) . $ <eq:source-8>]

 For every $r in F$ with $r > 0$ and every Følner sequence in $K$,
#[#set math.equation(numbering: n => "(3.13)")
 $ "Avg"_(u in Phi_N) m \( 2 r \| "Re" u \| \) arrow.r m \( r \)^2 . $ <eq:source-9>]

]
] <lem:rigidity-radial>

#proof[
  First take $A \, B > 0$ and put $L = sqrt(A B) in F$. For every $u in K$,
  #[#set math.equation(numbering: n => "(3.14)")
   $ \| A - B u^2 \|^2 = \( A - B \)^2 + 4 A B \( "Im" u \)^2 = \| - L + \( A - B \) u +
     L u^2 \|^2 . $ <eq:rigidity-equal-moduli>]
  For the second equality, factor the last expression as $u \( \( A - B \) + L \( u - u^(- 1) \) \)$ and use $u -
    u^(- 1) = 2 i "Im" u$.
  On the first side, $psi_(A - B u^2) = psi_A U_(u^2) psi_(- B)$.
    By (3.2) the projection of this product may be replaced, in averaged squared $L^2$ error,
    by $g_A U_(u^2) g_(- B)$. Both have $L^2$ norm at most one,
    so their squared norms differ in averaged absolute value by a quantity tending to zero.
    Indeed the absolute difference is at most twice their $L^2$ distance,
    and then Cauchy–Schwarz applies to the finite average. Ergodicity of $Y$ and surjectivity of the square map now give
  #[#set math.equation(numbering: n => "(3.15)")
   $ "Avg"_(u in Phi_N) m \( A - B u^2 \) & arrow.r (integral_Y \| g_A \|^2 thin d nu)
     (integral_Y \| g_(- B) \|^2 thin d nu)\
 & = m \( A \) m \( B \) . $ <eq:rigidity-two-term-limit>]
  Here the intervening squared norm is $integral_Y \| g_A \|^2 U_(u^2) \| g_(- B) \|^2 thin d nu$.
  On the second side of (3.14), apply (3.2) with exponents $0 \, 1 \, 2$. The projected character is approximated by
  $ g_(- L) thin U_u g_(A - B) thin U_(u^2) g_L . $
  Its squared norm is at most $lr(bar.v.double g_(A - B) bar.v.double)_2^2 = m \( \| A - B \| \)$,
    since the two outside factors have modulus at most one. Equal moduli give equal $m$-values,
    so (3.15) implies $m \( A \) m \( B \) lt.eq m \( \| A - B \| \)$.
    Taking negative logarithms proves (3.12), including zero values of $m$ with the stated extended-real
    convention. If $A = 0$ or $B = 0$, the inequality is an identity because $w \( 0 \) = 0$.
  For (3.13), use $r u + r macron(u) = 2 r "Re" u$ and the distinct exponents $1 \, - 1$.
    The same approximation reduces the average to squared norms of $U_u g_r thin U_(u^(- 1)) g_r$.
    Those squared norms equal
  $ integral_Y \| g_r \|^2 U_(u^(- 2)) \| g_r \|^2 thin d nu . $
  Mean ergodicity on $Y$ through the surjective power map $u mapsto u^(- 2)$ gives the limit $m \( r \)^2$.
    Radiality replaces the real argument by its absolute value, proving (3.13). ◻
]

=== 3.4 General-position rotations and bounded residues <general-position-rotations-and-bounded-residues>

The remaining task is to show that $m \( r \) = 0$ for every positive $r in F$.
  Assuming instead that $m \( r \) > 0$, we will obtain a uniform lower bound $m \( s \) gt.eq
  c > 0$ on some interval $\( 0 \, epsilon \) ∩ F$, contradicting the vanishing line average.
  By (3.13), a suitable set of rotations with bounded $w \( 2 r \| "Re" u \| \)$ has finitely many translates
  covering $K$. The first lemma below provides rotations in rational general position from which the proof will
  extract bases. The second controls the resulting integer combinations of nonnegative lengths under a fixed cap,
  using only the difference inequality (3.12).

#thm([Lemma 3.4.])[
  (General position in a number field).  #emph[Let $N_0 subset F$ be a number field, let $N = N_0 \( i \)$,
    and let $d_0 = \[ N : bb(Q) \]$. There are arbitrarily large finite sets $S subset K ∩
    N$ such that every $d_0$ distinct elements of $S$ form a $bb(Q)$-basis of $N$.]
] <lem:rigidity-general-position>

#proof[
  For $t in N_0$ put
  $ u \( t \) = frac(1 + i t, 1 - i t) in K ∩ N . $
  Choose a $bb(Q)$-basis of $N_0$. In the rational coordinates of $t$,
    the coordinates of $u \( t \)$ in a $bb(Q)$-basis of $N$ are rational functions over $bb(Q)$.
    This follows, for example, by inverting the matrix for multiplication by $1 - i t$.
    Its denominator is nonzero for all parameters in $N_0$, since $t$ is real.
  No nonzero $bb(Q)$-linear functional $ell : N arrow.r bb(Q)$ vanishes on all $u \( t \)$. Suppose one did.
    For every fixed $a in N_0$, the rational function $ell \( u \( h a \) \)$ vanishes at every rational $h$,
    and hence is identically zero. Its formal expansion at $h = 0$ comes from
  $ u \( h a \) = 1 + 2 i h a - 2 h^2 a^2 + dots.h.c . $
  The first three coefficients imply $ell \( 1 \) = ell \( i a \) = ell \( a^2 \) = 0$ for every $a in N_0$.
    Squares span $N_0$ over $bb(Q)$, as $4 a = \( a + 1 \)^2 - \( a - 1 \)^2$.
    Thus $ell$ vanishes on $N_0 + i N_0 = N$, a contradiction.
    This is a calculation in rational function coordinates and formal series;
    it uses no usual-topology continuity of $ell$.
  For any proper rational subspace of $N$, choose a nonzero rational linear functional annihilating it.
    Its value on $u \( t \)$ has a nonzero numerator polynomial in the rational coordinates of $t$.
    A finite union of such proper subspaces therefore cannot contain all $u \( t \)$:
    the product of their nonzero numerator polynomials is nonzero,
    and a nonzero polynomial over the infinite field $bb(Q)$ cannot vanish on all of rational affine space.
    Inductively choose each new element outside the spans of all subsets of at most $d_0 - 1$ earlier elements.
    Every subset of at most $d_0$ chosen elements remains independent.
    This constructs finite sets of every required size. ◻
]

#thm([Lemma 3.5.])[
  (Addition under a cap).  #emph[Let $w : F_(gt.eq 0) arrow.r \[ 0 \, oo \]$ satisfy $w \( 0 \) = 0$ and (3.12).
    Let $p_1 \, dots.h \, p_q in F_(gt.eq 0)$ with $p = max_j p_j > 0$ and $w \( p_j \) lt.eq H < oo$. If
$ z = sum_(j = 1)^q a_j p_j in \[ 0 \, p \) \, wide a_j in bb(Z) \, wide sum_j \| a_j \| lt.eq M \, $

 then $w \( z \) lt.eq 4 M H$.]
] <lem:rigidity-capped-residues>

#proof[
  Keep every partial sum as its residue in $\[ 0 \, p \)$. A positive input $p_j < p$ has cost at most $H$,
    while the input $p$ has zero residue. The inverse of a nonzero residue $b$ is $p -
    b$ and satisfies $w \( p - b \) lt.eq w \( p \) + w \( b \)$.
    Thus each signed input $plus.minus p_j$ has a residue of cost at most $2 H$; the zero cases cause no difficulty.
  For two current residues $a \, b in \[ 0 \, p \)$, if $a + b < p$,
    use three successive applications of the difference inequality:
  $ w \( a + b \) & = w #scale(x: 120%, y: 120%)[\(] p - \( \( p - a \) - b \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq w \( p \) + w \( \( p - a \) - b \)\
 & lt.eq w \( p \) + w \( p - a \) + w \( b \)\
 & lt.eq 2 w \( p \) + w \( a \) + w \( b \) . $
  All arguments are nonnegative. If $a + b > p$, the new residue is $a - \( p - b \)$,
    whose cost is at most $w \( a \) + w \( p \) + w \( b \)$. If $a + b = p$, its cost is zero.
    Adding a signed input therefore increases the current cost by at most $4 H$.
    Expand the integer combination into at most $M$ signed inputs and start from residue zero.
    Its final residue is $z$ itself, proving the bound. ◻
]

=== 3.5 Completion of the rigidity theorem <completion-of-the-rigidity-theorem>

#proof[
  First let $mu$ be ergodic and wild, and use the factor and radial function constructed above.
    Suppose that $m \( r \) > 0$ for some $r in F$, $r > 0$. Choose $H > 0$ finite so that $e^(- H) <
    m \( r \)^2$. The set
  $ A_0 = { u in K : w \( 2 r \| "Re" u \| \) lt.eq H } $
  is syndetic. Indeed, if no finite translates cover $K$, then for every finite $S subset K$ some translate $S
    v$ avoids $A_0$. Apply this to the sets of a Følner sequence and choose the avoiding translate separately for
    each set. Those translates still form a Følner sequence, whereas all their averaged $m$-values are at most
    $e^(- H)$. This contradicts (3.13). Hence there are $q_1 \, dots.h \, q_J in K$ such that
  #[#set math.equation(numbering: n => "(3.16)")
   $ upright("for every ") v in K upright(", some ") q_j v upright(" belongs to ") A_0 . $ <eq:rigidity-syndetic-cover>]
  Choose a number field $N_0 subset F$ containing the real and imaginary parts of every $q_j$, and put $N =
    N_0 \( i \)$ and $d_0 = \[ N : bb(Q) \]$. Lemma 16 supplies a finite $S subset K ∩
    N$ of size greater than $J \( d_0 - 1 \)$ in rational linear general position.
    For each $v in K$, apply (3.16) to all the points $s v$, $s in S$.
    Pigeonhole gives an index $j$ and $d_0$ elements $s$ for which $q_j s v in A_0$.
    Their coefficients $k = q_j s$ form a $bb(Q)$-basis of $N$,
    since multiplication by $q_j$ is an invertible $bb(Q)$-linear map. Call such a basis a good selection for $v$.
  There are only finitely many possible selections. Clearing the rational denominators in the basis expression of
    $1$, choose one positive integer $D_0$ such that, for each possible selection $cal(T)$,
  #[#set math.equation(numbering: n => "(3.17)")
   $ D_0 thin 1 = sum_(k in cal(T)) a_k k \, wide a_k in bb(Z) \, wide sum_(k in cal(T)) \| a_k \| lt.eq M_0 \,
     $ <eq:rigidity-integer-selection>]
  where the finite bound $M_0$ is common to all selections. There is also a common $c_0 > 0$ such that
  #[#set math.equation(numbering: n => "(3.18)")
   $ max_(k in cal(T)) \| "Re" \( k v \) \| gt.eq c_0 wide \( v in bb(T) \) $ <eq:rigidity-selection-transversality>]
  for every selection. To prove this, for a fixed selection the maximum is a continuous function of the ordinary
    unit direction $v$. It never vanishes: the rational span of the selection contains $1$ and $i$,
    so vanishing would imply both $"Re" v = 0$ and $"Re" \( i v \) = 0$.
    Take a positive minimum on the compact unit circle and then the minimum over the finitely many selections.
    We may and do take $c_0 lt.eq 1$.
  Now let $v in K$ satisfy $\| "Re" v \| < c_0 \/ D_0$, and choose a good selection $cal(T)$ for it.
    Its nonnegative numbers
  $ p_k = 2 r \| "Re" \( k v \) \| quad \( k in cal(T) \) \, wide p = max_(k in cal(T)) p_k $
  satisfy $w \( p_k \) lt.eq H$ and $p gt.eq 2 r c_0$. Taking real parts of (3.17),
    and inserting the signs of the real parts and then the overall sign, expresses
  $ z = 2 r D_0 \| "Re" v \| < p $
  as an integer combination of the $p_k$ with coefficient length at most $M_0$. All these numbers lie in $F$.
    Lemma 17 therefore gives
  #[#set math.equation(numbering: n => "(3.19)")
   $ w \( 2 r D_0 \| "Re" v \| \) lt.eq 4 M_0 H wide (v in K \, med \| "Re" v \| < c_0 \/ D_0) .
     $ <eq:rigidity-small-radius-bound>]
  Every $t in F ∩ \[ - 1 \, 1 \]$ is the real part of an element of $K$, namely $t + i sqrt(1 - t^2)$.
    For every $s in F ∩ \( 0 \, 2 r c_0 \)$ apply (3.19) with $t = s \/ \( 2 r D_0 \)$. It follows that
  $ m \( s \) gt.eq e^(- 4 M_0 H) > 0 wide #scale(x: 120%, y: 120%)[\(] s in F ∩ \( 0 \, 2 r c_0 \)
    #scale(x: 120%, y: 120%)[\)] . $
  Choose a nonnegative $phi.alt in C_c \( bb(R) \)$ supported in this open interval with positive integral.
    Positivity of the functional $I$ and its agreement with Lebesgue integration on continuous test functions give
  $ I #scale(x: 120%, y: 120%)[\(] phi.alt \( t \) m \( t \) #scale(x: 120%, y: 120%)[\)] gt.eq
    e^(- 4 M_0 H) I \( phi.alt \) = e^(- 4 M_0 H) integral_(bb(R)) phi.alt \( t \) thin d t > 0 . $
  This contradicts (2.4) for the wild law $nu_Y$, with $a = 1$, in view of (3.11).
    This step uses no ordinary-measure measurability of the radial function:
    $I$ is defined on all the bounded, boundedly supported functions in question.
  Thus $m \( r \) = 0$ for every positive $r in F$, and radiality gives $m \( z \) = 0$ for all nonzero $z in E$.
    Consequently
  $ lr(|integral_D psi_z thin d mu|) = lr(|integral_Y g_z thin d nu|) lt.eq lr(bar.v.double g_z bar.v.double)_2 =
    0 wide \( z eq.not 0 \) . $
  Fourier uniqueness on the compact abelian group $D$ identifies $mu$ with Haar probability.
  Finally, an arbitrary wild invariant probability has an ergodic decomposition for the countable group $K$ on the
    standard compact space $D$. Since $C$ is invariant Borel and has measure zero,
    almost every ergodic component also gives $C$ measure zero.
    The ergodic case just proved makes each such component Haar probability.
    Their integral is therefore Haar probability as well. This proves the theorem. ◻
]

== 4 Transfer between proper and weak measurable colorings <sec:transfer>

We prove Theorem 3 for every positive integer $k$. Starting from an arbitrary proper coloring,
  we first average its translations and rotations on the algebraic plane.
  The resulting probability space carries label indicators,
  but its translations need not be strongly continuous in the usual plane topology.
  We project those indicators onto the functions whose translation orbits are continuous in $L^2$.
  The projection must preserve nonnegativity and the sum of the label coordinates;
  the next lemma establishes this by identifying it as conditional expectation.
  Haar rigidity then preserves the zero unit correlations, and one measurable sample yields a weak coloring.
  The converse uses density points and finite graph compactness.

=== 4.1 The continuous part of a stationary labeling system <the-continuous-part-of-a-stationary-labeling-system>

Retain the groups $E \, K \, D$, the Borel subgroup $C subset D$, and the parametrization $j : bb(R)^2 arrow.r
  C$ from Definition 6. In the following lemma, the topology on $E$ used to define continuity is its usual
  subspace topology in $bb(R)^2$, although its measure-preserving action is initially only an action of the
  countable discrete group.

#thm([Lemma 4.1.])[
  (Continuous vectors and positivity).  #emph[Let a standard probability space carry a measure-preserving action
    of the additive group $E$, with Koopman operators $T_z$. The subspace
$ cal(H)_c = {v in L^2 : lim_(z arrow.r 0\
z in E) lr(bar.v.double T_z v - v bar.v.double)_2 = 0} $

 is $L^2$ of a factor. It is also the spectral subspace on $C$ for the representation of $E_(upright("disc"))$.
   The operators on this subspace extend to a strongly continuous unitary representation $T_x$, $x in bb(R)^2$,
   which preserves the positive cone and the constant one.]
  #emph[If the system also has rotations $V_u$, $u in K$, satisfying $V_u T_z V_u^(- 1) = T_(u z)$,
    then $cal(H)_c$ and its orthogonal projection are rotation invariant.]
] <lem:palettes-continuous-factor>

#proof[
  The subspace is closed. Indeed, if $v$ is close in $L^2$ to a continuous vector $w$, then
  $ lr(bar.v.double T_z v - v bar.v.double)_2 lt.eq 2 lr(bar.v.double v - w bar.v.double)_2 +
    lr(bar.v.double T_z w - w bar.v.double)_2 . $
  It contains the constants and is invariant under the translations.
  Apply the spectral theorem for the discrete abelian group $E$, with dual group $D$.
    For $v in L^2$, write $lambda_v$ for its finite scalar spectral measure, so
  $ chevron.l v \, T_z v chevron.r = integral_D psi_z \( d \) thin d lambda_v \( d \) \, wide
    lr(bar.v.double T_z v - v bar.v.double)_2^2 = integral_D \| psi_z \( d \) - 1 \|^2 thin d lambda_v \( d \) . $
  If $lambda_v \( C^c \) = 0$, the second integral tends to zero as $z arrow.r 0$ in the usual topology,
    by dominated convergence and the continuous-character parametrization.
  Conversely, suppose $v in cal(H)_c$. Its coefficient $F_v \( z \) = chevron.l v \,
    T_z v chevron.r$ is uniformly continuous on $E$:
  $ \| F_v \( z + h \) - F_v \( z \) \| lt.eq lr(bar.v.double v bar.v.double)_2 thin
    lr(bar.v.double T_h v - v bar.v.double)_2 . $
  It extends to a continuous positive-definite function on $bb(R)^2$.
    Positive definiteness follows by approximating each finite list of real-plane points by points of $E$ and
    passing to the limit in its defining quadratic form. Bochner’s theorem supplies a finite measure on $bb(R)^2$
    representing this extension. Its pushforward under $j$ has the same Fourier coefficients on $D$ as $lambda_v$,
    so Fourier uniqueness identifies the two measures. Thus $lambda_v \( C^c \) = 0$.
    The representation result is the abelian spectral theorem (also called the Stone–Naimark–Ambrose–Godement
    theorem); it and Bochner’s theorem are given in #cite(label("Bekka2008"), form: "prose") Theorems D.3.1
    and D.2.2. The spectral theorem is applied to the discrete locally compact group $E$,
    while Bochner’s theorem is applied to $bb(R)^2$. This identifies $cal(H)_c$ with the range of the spectral
    projection on the Borel set $C$.
  To obtain the factor assertion, it is essential that the original $T_z$ are Koopman operators.
    They commute with complex conjugation and with pointwise composition. For bounded $v \, w in cal(H)_c$,
  $ lr(bar.v.double T_z \( v w \) - v w bar.v.double)_2 lt.eq
    lr(bar.v.double v bar.v.double)_oo lr(bar.v.double T_z w - w bar.v.double)_2 +
    lr(bar.v.double w bar.v.double)_oo lr(bar.v.double T_z v - v bar.v.double)_2 \, $
  so $v w in cal(H)_c$. For a Lipschitz function $Phi : bb(C) arrow.r bb(C)$,
  $ lr(bar.v.double T_z Phi \( v \) - Phi \( v \) bar.v.double)_2 lt.eq
    upright("Lip") \( Phi \) lr(bar.v.double T_z v - v bar.v.double)_2 . $
  In particular, radial projection of $v$ onto a bounded complex disk is still in $cal(H)_c$.
    Such projections converge to $v$ in $L^2$ as the disk radius tends to infinity.
  Let $cal(F)_c$ be the completed factor generated by the bounded members of $cal(H)_c$.
    Those members form a bounded unital star-algebra. Its $L^2$ closure is $L^2 \( cal(F)_c \)$:
    for a finite list of its bounded generators, polynomials in their coordinates and conjugates approximate
    continuous functions on the compact range by Stone–Weierstrass;
    continuous functions are dense in $L^2$ of the corresponding finite-dimensional distribution.
    Finite-coordinate measurable functions are dense in the generated factor, by the monotone-class theorem.
    The closedness already proved therefore gives $L^2 \( cal(F)_c \) subset cal(H)_c$.
    Conversely, the bounded truncations of every $v in cal(H)_c$ are $cal(F)_c$-measurable and converge to $v$ in
    $L^2$. Hence $cal(H)_c = L^2 \( cal(F)_c \)$. Its orthogonal projection is conditional expectation.
  For $x in bb(R)^2$, choose $z_n in E$ with $z_n arrow.r x$. For $v in cal(H)_c$,
  $ lr(bar.v.double T_(z_n) v - T_(z_m) v bar.v.double)_2 =
    lr(bar.v.double T_(z_n - z_m) v - v bar.v.double)_2 arrow.r 0 . $
  Define $T_x v$ by this limit. The definition is independent of the approximating sequence,
    and strong limits together with the original group law give the group law on $bb(R)^2$, inverses,
    and strong continuity. The operators are unitary. The positive cone in $L^2$ is closed,
    so $T_x$ preserves positivity, and $T_x 1 = 1$. No pointwise action of $bb(R)^2$ is needed for these conclusions.
  Finally, for $u in K$, covariance gives
  $ lr(bar.v.double T_z V_u v - V_u v bar.v.double)_2 = lr(bar.v.double T_(u^(- 1) z) v - v bar.v.double)_2
    arrow.r 0 . $
  Thus rotations preserve $cal(H)_c$; their inverses do as well, so its orthogonal projection commutes with them. ◻
]

#thm([Proposition 4.2.])[
  (From proper to weak measurable colorings).  #emph[Let $k$ be a positive integer.
    If the plane admits an unrestricted proper $k$-coloring, then it admits a weak measurable $k$-coloring.]
] <prop:palettes-forward>

#proof[
  #emph[An invariant law on proper labelings.] Restrict the given coloring to $E$.
    In the compact metrizable space ${ 1 \, dots.h \, k }^E$,
    let $Omega$ be the closed set of proper labelings of the unit-distance graph on $E$. It is nonempty.
    The countable group $E times.r K$ acts continuously on $Omega$;
    translations and rotations preserve the unit-edge constraints.
    This group is amenable, being an extension of two abelian groups #cite(label("Bekka2008")) Theorem G.2.1 and
    Proposition G.2.2(ii). The Følner criterion #cite(label("Bekka2008")) Theorem G.5.1,
    applied to successive finite subsets of this countable group, gives a finite-set Følner sequence.
    Averages of a point mass over a finite-set Følner sequence have a weakly convergent subsequence,
    and every limit is invariant. This gives an invariant Borel probability $mu$ on $Omega$.
  Let $f_i$ be the indicator that the origin has label $i$.
    Choose the translation convention so $T_z f_i$ is the indicator of label $i$ at $z$.
    The rotations about the origin fix each $f_i$, and properness gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ integral_Omega f_i thin T_u f_i thin d mu = 0 wide \( u in K \, med 1 lt.eq i lt.eq k \) .
     $ <eq:palettes-proper-correlation>]
  #emph[The continuous factor and zero correlations.] Use Lemma 18 to write
  $ p_i = bb(E) \( f_i divides cal(F)_c \) \, wide b_i = f_i - p_i . $
  Then $0 lt.eq p_i lt.eq 1$ and $sum_i p_i = 1$. Both $p_i$ and $b_i$ are rotation-fixed.
    The scalar translation spectral measure of $b_i$ is $K$-invariant:
    covariance gives equality of its Fourier coefficients at $z$ and $u z$,
    and Fourier uniqueness gives invariance of the measure. It gives $C$ measure zero,
    by the spectral-subspace assertion of the lemma. If it is nonzero, normalize it and apply Theorem 8.
    The scalar spectral measure is therefore a multiple of Haar measure, including the zero multiple. It follows that
  $ chevron.l b_i \, T_z b_i chevron.r = 0 wide \( z in E \\ { 0 } \) . $
  The subspace $cal(H)_c$ and its orthogonal complement are translation invariant,
    so both cross terms in (4.1) vanish. Consequently
  $ integral_Omega p_i thin T_u p_i thin d mu = 0 wide \( u in K \) . $
  The algebraic unit directions are dense in the usual unit circle,
    as is seen already from the rational tangent-half-angle parametrization.
    Strong continuity of the extended operators therefore gives this identity for every usual unit direction $u in
    S^1$. For every $x in bb(R)^2$, unitarity and the group law then give
  #[#set math.equation(numbering: n => "(4.2)")
   $ integral_Omega \( T_x p_i \) \( T_(x + u) p_i \) thin d mu = chevron.l T_x p_i \, T_x T_u p_i chevron.r =
     chevron.l p_i \, T_u p_i chevron.r = 0 . $ <eq:palettes-field-correlation>]
  The functions here are nonnegative equivalence classes. This calculation uses no pointwise realization or
    multiplicativity of the extended $bb(R)^2$ action.
  #emph[A measurable sample.] The continuous map $x mapsto T_x
    p_i$ takes values in the separable space $L^2 \( mu \)$. On a bounded spatial domain,
    approximate it by finite-valued simple maps in the $L^2 \( mu \)$ norm,
    choosing the integrals of their squared approximation errors to be summable.
    Choose measurable representatives for their finitely many values.
    The resulting jointly measurable functions converge in the product $L^2$ space.
    A subsequence converges in $L^2 \( mu \)$ for almost every $x$,
    so its product-space limit represents $T_x p_i$ at almost every $x$.
    Applying this on a countable exhaustion, or on its disjoint measurable annuli,
    gives a jointly measurable field $H_i \( x \, omega \)$ on $bb(R)^2 times Omega$,
    correct as an $L^2 \( mu \)$ representative for almost every $x$.
    Since the probability model is standard, Borel versions may be used.
    Taking real parts and clamping each $H_i$ to $\[ 0 \, 1 \]$ preserves this representation property and makes
    all the fields everywhere nonnegative.
  There is a plane-null set $N$ outside which all these representations are correct.
    For almost every $x$, their sum is one for $mu$-almost every $omega$. Moreover, on every bounded spatial domain,
  $ integral #h(-0.16667em) integral_(S^1) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_N \( x \) +
    upright(bold(1))_N \( x + u \) #scale(x: 120%, y: 120%)[\)] thin d sigma \( u \) thin d x = 0 . $
  The assertion about $x + u$ follows by translation invariance of Lebesgue measure for each fixed $u$,
    followed by Fubini. Thus (4.2) applies to the chosen representatives for almost every pair $\( x \, u \)$.
    Tonelli gives, for every positive integer $m$,
  $ integral_Omega sum_(i = 1)^k integral_(B \( 0 \, m \)) integral_(S^1) H_i \( x \, omega \)
    H_i \( x + u \, omega \) thin d sigma \( u \) thin d x thin d mu \( omega \) = 0 . $
  Choose one sample $omega$ for which all the inner integrals vanish, and for which $sum_i H_i \( x \, omega \) =
    1$ for almost every $x$. There are only countably many conditions here.
    At every point where the sum is one, assign the least index with positive field;
    on the remaining plane-null set assign any index. This is measurable.
    A same-color pair outside that null set would have positive product of the corresponding fields,
    which occurs only on a $d x thin d sigma \( u \)$-null set.
    Hitting the spatial exceptional set at either endpoint is also a product-null event.
    This proves the weak measurable condition. ◻
]

=== 4.2 Density points and the converse transfer <density-points-and-the-converse-transfer>

The next argument is a version of the density-point method used by #cite(label("Falconer1981"), form: "prose") and
  #cite(label("Payne2009"), form: "prose") Lemma 1 and Proposition 1.
  Here the hypothesis excludes unit pairs only in product measure,
  so we first show directly that density-one points still form independent sets.

#thm([Lemma 4.3.])[
  (Density-point properness).  #emph[In a weak measurable $k$-coloring with classes $A_1 \, dots.h \, A_k$,
    the full-density-point set of each $A_i$ contains no unit pair.
    These density-point sets are disjoint and their union is conull.]
] <lem:palettes-density-proper>

#proof[
  Suppose $x$ and $y = x + u$, with $\| u \| = 1$, both have density one of $A_i$.
    For $h > 0$ small, choose $x'$ uniformly in $B \( x \, h \)$ and independently choose $u'$ uniformly on an arc
    of positive angular measure satisfying $\| u' - u \| < h$.
    Density at $x$ gives $bb(P) \( x' in.not A_i \) = o \( 1 \)$ as $h arrow.b 0$.
    The distribution of $x' + u'$ is a mixture of translated uniform disk distributions.
    Its density is bounded by $1 \/ \( pi h^2 \)$, and its support is in $B \( y \, 2 h \)$. Therefore
  $ bb(P) \( x' + u' in.not A_i \) lt.eq frac(\| B \( y \, 2 h \) \\ A_i \|, pi h^2) = o \( 1 \) . $
  For small $h$ the probability that both points lie in $A_i$ is positive.
    But the pair-parameter distribution is absolutely continuous with respect to $d x thin d sigma \( u \)$,
    and the two points have distance one. This contradicts the weak condition.
  Lebesgue differentiation makes the union of the density-point sets conull.
    Two different color classes, being disjoint up to null sets, cannot both have density one at the same point,
    so these sets are disjoint. ◻
]

#proof[
  The forward implication is Proposition 19. For the reverse implication,
    Lemma 20 gives a conull set partitioned into strictly unit-independent density-point classes.
    Any fixed finite configuration of plane points has a translate entirely inside that conull set:
    the permissible translation vectors are a finite intersection of conull sets.
    Its unit-distance graph therefore has a proper $k$-coloring.
  In the compact product space ${ 1 \, dots.h \, k }^(bb(R)^2)$,
    each unit-edge condition is closed and depends on two coordinates.
    Every finite family of these conditions involves a finite configuration and is satisfiable by the preceding
    paragraph. The finite intersection property, using product compactness in ZFC,
    produces a coloring satisfying every unit-edge condition.
    This is the graph compactness principle of #cite(label("deBruijnErdos1951")) Theorem 1;
    the argument just given specifies its application to the unrestricted plane. It proves (1.1). ◻
]

== 5 Circle palettes and their cardinality <sec:palettes>

We now assume a weak measurable five-coloring and develop angular palettes at every center.
  Their labels record all possible limiting circle samples.
  The main result of this section is that almost every palette contains at most two labels, at every fixed center.
  We obtain this bound from exclusions between circle samples and a separation property for centers whose palettes
  meet one fixed pair of labels.

=== 5.1 Typical samples, traces, and maximal palettes <typical-samples-traces-and-maximal-palettes>

For this section and the subsequent contradiction, the label set is ${ 1 \, dots.h \, 5 }$;
  write $A_i$ for the classes, $a_i = upright(bold(1))_(A_i)$, and $c$ for the coloring.
  We choose Borel representatives forming a partition. Changing a coloring on a plane-null set leaves the weak
  condition unchanged, because that set is hit at either endpoint only on a $d x thin d sigma \( u \)$-null set.

Call a point #emph[typical] if it has density one of its actual color. Typical points form a conull set.
  By Lemma 20, any unit pair of typical points has different colors.
  The same lemma applies to two density-one points of a class regardless of the values assigned to the coloring at
  those individual points. For each label let

$ H_i = { q in bb(R)^2 : \| A_i ∩ B \( q \, r \) \| > 0 upright(" for every ") r > 0 } $

be its closed spatial essential support.

Let $S = S^1$ carry uniform angular probability $sigma$. Let $R$ denote rotation by $kappa = pi \/ 3$,
  and $J$ rotation by $pi \/ 2$. We identify unit directions with angles modulo $2 pi$.
  Two directions are called parallel if they are equal or opposite;
  all angular density and essential-support statements refer to angular Lebesgue measure.

Call $\( y \, r \)$, with $y in bb(R)^2$ and $r > 0$, a #emph[typical circle sampling] if $y +
  r e$ is typical for almost every $e in S$. For each fixed $r$,
  this holds for almost every $y$ by Fubini and translation invariance of plane measure.
  For each fixed $y$, it holds for almost every $r > 0$ by polar coordinates and Fubini.

#prodef([Definition 5.1.])[
  (Circle traces and maximal palettes).  For each fixed center $x$,
    let $cal(W)_x$ be the family of vector functions in $L^oo \( S \; bb(R)^5 \)$ that can be obtained as
  $ b = "w"^(*) #h(-0.16667em) - #h(-0.16667em) lim_(n arrow.r oo) \( a_i \( y_n + r_n e \) \)_(i = 1)^5 \, wide
    y_n arrow.r x \, quad r_n arrow.r 1 \, $
  where every $\( y_n \, r_n \)$ is a typical circle sampling. Constant sequences are permitted.
    For a label $i$, form the essential measurable union
  $ D_(x \, i) = "ess union"_(b in cal(W)_x) { e : b_i \( e \) > 0 } . $
  The maximal palette is the measurable set-valued function
  $ P_x \( e \) = { i : e in D_(x \, i) } \, $
  defined up to angular null sets.
] <def:palettes-traces>

Here are the compactness and countability facts in this definition.
  Typical samplings with radius one can be chosen at centers approaching any prescribed $x$.
  Their bounded vectors have weak-\* convergent subsequences,
  since $L^1 \( S \)$ is separable and the bounded ball of its dual is weak-\* compact and metrizable.
  Thus $cal(W)_x$ is nonempty. Every $b in cal(W)_x$ has nonnegative coordinates and $sum_i b_i =
  1$ almost everywhere, since these assertions pass to a weak-\* limit by integration against nonnegative test
  functions.

The family also has the following closure under varying centers:

#[#set math.equation(numbering: n => "(5.1)")
 $ x_n arrow.r x \, quad b^n in cal(W)_(x_n) \, quad b^n harpoon.rt^(*) b quad arrow.r.double quad
   b in cal(W)_x . $ <eq:palettes-trace-closure>]

To see this, fix a metric for the bounded-ball weak-\* topology.
  From a sequence realizing $b^n$, choose one sample within $1 \/ n$ of $b^n$ in that metric,
  with center within $1 \/ n$ of $x_n$ and radius within $1 \/ n$ of one. These chosen samples realize $b$ at $x$.
  In particular $cal(W)_x$ is compact.

For completeness, the essential union for a fixed label can always be taken over a countable subfamily.
  Let $M_i$ be the supremum of the measures of finite unions of the sets ${ b_i > 0 }$.
  Choose finite unions approaching $M_i$, and let $D_(x \, i)$ be their countable union. Its measure is $M_i$.
  If another member ${ b_i > 0 }$ had positive measure outside this union,
  adjoining it to sufficiently large finite partial unions would contradict the definition of $M_i$.
  This proves that every individual trace has its positive coordinates in the palette almost everywhere.
  It also gives nonemptiness of $P_x \( e \)$ almost everywhere, by using any one trace and its sum-one property.

The null set in the last assertion may depend on the individual trace,
  and the angular null sets may depend on $x$. We shall use countable generating trace families whenever a
  conclusion is to be asserted for the whole palette. No joint measurability of $P_x$ in its center is assumed.

=== 5.2 Exclusion, density, and smooth transport <exclusion-density-and-smooth-transport>

#thm([Lemma 5.2.])[
  (Palette transfer).  #emph[The following assertions hold at every fixed center $x$.]
  + #emph[For almost every independent-angle pair $\( e \, v \) in S times S$,
#[#set math.equation(numbering: n => "(5.2)")
 $ c \( x + e + v \) in.not P_x \( e \) union P_x \( v \) . $ <eq:source-10>]

]
  + #emph[If $e$ is an angular density-one point of $D_(x \, i) = { e' : i in P_x \( e' \) }$,
    then for each $v$ nonparallel to $e$, the spatial density of $A_i$ at $x + e + v$ is zero.]
  + #emph[Let $z$ be any fixed center, possibly $z = x$. Suppose on an open angular arc,
    or locally on a union of such arcs, there is a smooth representation
$ z + f = x + s \( f \) + t \( f \) \, wide s \( f \) \, t \( f \) in S \, $

 with $s \( f \) \, t \( f \)$ nonparallel and $s$ a local diffeomorphism in the angular coordinate.
   Then almost everywhere on that domain,
#[#set math.equation(numbering: n => "(5.3)")
 $ P_z \( f \) ∩ P_x \( s \( f \) \) = diameter . $ <eq:source-11>]

]
  #emph[Each assertion permits an exceptional angular set depending on the fixed centers and on the specified maps.]
] <lem:palette-transfer>

#proof[
  Fix $b in cal(W)_x$, with realizing samplings $\( y_n \, r_n \)$.
    For every $n$, the point $y_n + r_n e$ is typical for almost every $e$.
    The second point $y_n + r_n e + v$ is typical for almost every pair $\( e \, v \)$: in angular coordinates the map
  $ G_n \( e \, v \) = y_n + r_n e + v $
  has Jacobian of absolute value $r_n \| sin \( arg v - arg e \) \|$, which is nonsingular off a product-null set.
    On countably many smaller coordinate patches away from that set,
    change of variables pulls back any plane-null set to a product-null set.
    The two typical points have distance one. Lemma 20 therefore gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ a_i \( y_n + r_n e \) a_i \( y_n + r_n e + v \) = 0 quad
     upright("for almost every ") \( e \, v \) . $ <eq:palettes-sample-disjoint>]
  We need the following strong convergence for the second factor:
  #[#set math.equation(numbering: n => "(5.5)")
   $ a_i \( y_n + r_n e + v \) arrow.r a_i \( x + e + v \) quad
     upright("in ") L^1 \( S times S \) . $ <eq:palettes-strong-circle-sum>]
  Here is a change-of-variables proof which also covers arbitrary measurable color boundaries.
    For $delta > 0$, discard the angular pairs with $\| sin \( arg v - arg e \) \| lt.eq delta$.
    Their measure tends to zero with $delta$. On the remaining set, for large $n$,
    the Jacobian is bounded below by $delta \/ 2$. The multiplicity of $G_n$ there is at most two:
    an inverse image of a specified sum amounts to an intersection of the circle of radius $r_n$ with a translated
    circle of radius one. A coincident-circle case can occur only at the antiparallel, hence discarded,
    directions. The same assertions hold for $G \( e \, v \) = x + e + v$.
    Their images lie in one fixed compact plane region for all large $n$.
  It follows that on the retained angular set the pushforwards of angular product measure have densities bounded
    by a constant depending only on $delta$, uniformly in $n$.
    Approximate $a_i$ on a compact neighborhood of those images by a continuous function taking values in
    $\[ 0 \, 1 \]$, in plane $L^1$. The density bounds control its composition errors uniformly.
    For the continuous approximant the compositions converge uniformly, since $y_n arrow.r x$ and $r_n arrow.r 1$.
    First making the approximation error small, then letting $n arrow.r oo$,
    and finally letting $delta arrow.b 0$, proves (5.5).
  Set $B_n \( e \) = a_i \( y_n + r_n e \)$ and $Q \( e \, v \) = a_i \( x + e + v \)$.
    The error in replacing the second factor of (5.4) by $Q$, after integration,
    is at most the $L^1$ error in (5.5). Weak-\* convergence of $B_n$ then applies to the fixed $L^1 \( S \)$ test
    $integral_S Q \( e \, v \) thin d sigma \( v \)$. We obtain
  $ integral_(S times S) b_i \( e \) a_i \( x + e + v \) thin d sigma \( e \) thin d sigma \( v \) = 0 . $
  Both factors are nonnegative, so their product is zero almost everywhere.
    Taking the countable generating trace families in Definition 21, for all five labels,
    proves exclusion of $P_x \( e \)$. Interchanging $e \, v$ proves exclusion of $P_x \( v \)$, and gives (5.2).
    In particular this passage used a strongly convergent factor against a weak-\* limit,
    not a product of two weak-\* limits.
  Next fix an angular density-one point $e$ of $D_(x \, i)$ and any nonparallel direction $v$. The map
  $ \( e' \, v' \) mapsto x + e' + v' $
  is a smooth local diffeomorphism near $\( e \, v \)$. Choose real angular coordinates near $e \,
    v$ and an inverse branch on a plane neighborhood of $x + e + v$.
    For small $h$, the inverse image under this branch of $B \( x + e + v \, h \)$ lies in a product of angular
    intervals of length $O \( h \)$ about $e \, v$, and its change-of-variables factors are bounded.
    On this branch, (5.2) implies that a point of $A_i$ has first coordinate outside $D_(x \, i)$,
    apart from a spatial null set. Therefore
  $ \| A_i ∩ B \( x + e + v \, h \) \| lt.eq C h thin \| \[ e - C h \, e + C h \] \\ D_(x \, i) \| = o \( h^2 \) . $
  The constants can depend on the fixed nonparallel pair. This establishes assertion 2 for each such $v$.
    It is a two-dimensional neighborhood argument and does not restrict (5.2) to a possibly exceptional
    single-angle fiber.
  Finally fix the centers and representation in assertion 3,
    and work first on a smaller compact arc on which one inverse branch of the two-angle sum map is available.
    Let a trace $b in cal(W)_z$ be realized by $\( z_n \, r_n \)$.
    Applying this inverse branch to $z_n + r_n f - x$ gives perturbed representations
  $ z_n + r_n f = x + s_n \( f \) + t_n \( f \) \, $
  where $s_n \, t_n$ are nonparallel and converge to $s \, t$ in $C^1$ on the smaller arc.
    Shrinking the arc if necessary, $s$ is a diffeomorphism with derivative bounded away from zero,
    and the $s_n$ have uniformly bounded inverse derivatives for large $n$.
  For $D_i = D_(x \, i)$, these facts imply
  #[#set math.equation(numbering: n => "(5.6)")
   $ upright(bold(1))_(D_i) \( s_n \( f \) \) arrow.r upright(bold(1))_(D_i) \( s \( f \) \) quad
     upright("in ") L^1 upright(" on the smaller arc") . $ <eq:palettes-pullback-continuity>]
  To verify it, approximate $upright(bold(1))_(D_i)$ on a common image interval by a continuous function in
    angular $L^1$. Change of variables and the inverse-derivative bounds control the errors of composition
    uniformly for $s_n$ and for $s$. Uniform convergence of $s_n$ handles the continuous approximant.
  Almost every $f$ with $s_n \( f \) in D_i$ has $s_n \( f \)$ a density-one point of $D_i$.
    Indeed the set of exceptions in $D_i$ is angular null by differentiation,
    and $s_n$ pulls it back to a null set. Assertion 2 makes the density of $A_i$ at $z_n +
    r_n f$ zero for all these $f$. The sampling $\( z_n \, r_n \)$ is typical on its circle,
    so for almost every such $f$ its actual color cannot be $i$. Consequently
  $ a_i \( z_n + r_n f \) upright(bold(1))_(D_i) \( s_n \( f \) \) = 0 quad
    upright("almost everywhere on the smaller arc") . $
  Use (5.6) to replace the second factor strongly in $L^1$, and then use weak-\* convergence of the first factor.
    Nonnegativity gives
  $ b_i \( f \) upright(bold(1))_(D_i) \( s \( f \) \) = 0 quad upright("almost everywhere") . $
  Taking a countable generating family of traces at $z$ and the five labels proves (5.3) on this arc.
    A countable cover by smaller arcs proves it on the stated domain. ◻
]

#prodef([Remark 5.3.])[
  In assertion 3 of Lemma 22, the second endpoint map $t$ may be constant.
    Nonparallelness makes the two-dimensional sum map invertible,
    while the local diffeomorphism requirement on $s$ alone controls preimages of angular null sets.
    In particular, for any fixed direction $a$, the representation
  $ \( x + a \) + f = x + f + a $
  is admissible off $f = plus.minus a$. The proof applies at every fixed pair of centers and never needs a common
    exceptional angular set over an uncountable family of centers.
] <rem:palettes-transport-scope>

#thm([Corollary 5.4.])[
  (Sixty-degree exclusion).  #emph[At every fixed center $x$,
#[#set math.equation(numbering: n => "(5.7)")
 $ P_x \( f \) ∩ P_x \( R f \) = diameter wide upright("for almost every ") f in S . $ <eq:source-12>]

]
] <cor:palettes-sixty-degree>

#proof[
  Use $x + f = x + R f + R^(- 1) f$ in Lemma 22. The endpoint directions are nonparallel and the first endpoint
    map is a rotation. ◻
]

=== 5.3 Separation of binary centers <subsec:palettes-binary>

Fix two distinct labels $i_(+) \, i_(-)$. Call a center $x$ #emph[binary for ${ i_(+) \, i_(-) }$] if

$ P_x \( e \) ∩ { i_(+) \, i_(-) } eq.not diameter wide upright("for almost every ") e in S . $

The exclusion (5.7) makes this intersection a singleton almost everywhere.
  Indeed, at almost every $e$, the intersections at $e$ and $R
  e$ are nonempty disjoint subsets of a two-element set; they must therefore be the two different singletons.
  Thus there is a unique measurable selection from this pair, up to a null set, and it alternates under $R$.
  Conversely, the existence of an alternating selection from the pair plainly implies the displayed intersection
  condition.

Write this selection as a measurable $2 pi$-periodic sign function $s_x : bb(R) arrow.r { - 1 \, 1 }$,
  assigning the signs $+ 1 \, - 1$ to $i_(+) \, i_(-)$ respectively and choosing arbitrary values on the
  exceptional null set. With $kappa = pi \/ 3$, it satisfies

#[#set math.equation(numbering: n => "(5.8)")
 $ s_x \( t + kappa \) = - s_x \( t \) wide upright("for almost every ") t . $ <eq:palettes-binary-signs>]

In particular, either sign occupies angular measure $pi$ in a period.

#thm([Lemma 5.5.])[
  (Binary-center separation).  #emph[There is an absolute constant $delta_(*) > 0$ such that,
    for every fixed pair of labels, any two distinct centers binary for that pair are at distance at least $delta_(*)$.]
] <lem:binary-separation>

#proof[
  Suppose that $x \, y$ are distinct binary centers for the same pair, and put $d = \| y - x \|$.
    We will derive a contradiction whenever $0 < d < delta_(*)$,
    with $delta_(*)$ chosen below independently of the coloring, the pair, and the centers.
    Rotate angular coordinates so that $y - x = d$ lies on the positive real axis.
  #emph[The maps forced by palette transport.] For $d < 1 \/ 2$, the vector $d +
    e^(i t)$ has length strictly between zero and two. Define real lifts
  $ Theta_d \( t \) & = t + "Im" log \( 1 + d e^(- i t) \) \,\
alpha_plus.minus \( t \) & = Theta_d \( t \) plus.minus arccos #scale(x: 120%, y: 120%)[\(] \| d +
  e^(i t) \| \/ 2 #scale(x: 120%, y: 120%)[\)] \, $
  where the logarithm is the branch near $1$. These formulas give the exact representation
  $ y + e^(i t) = x + e^(i alpha_(+) \( t \)) + e^(i alpha_(-) \( t \)) . $
  Its two unit directions are nonparallel. Their angular difference is twice an angle strictly between zero and
    $pi \/ 2$, and stays away from both parallel cases for sufficiently small $d$.
  The functions $alpha_plus.minus$ are smooth degree-one lifts:
    $alpha_plus.minus \( t + 2 pi \) = alpha_plus.minus \( t \) + 2 pi$.
    Their derivatives converge uniformly to $1$ as $d arrow.r 0$,
    so for small $d$ they induce orientation-preserving circle diffeomorphisms.
    We may therefore apply Lemma 22 locally, with either endpoint as its first direction,
    and cover the angular circle by finitely many such domains. It follows that
  $ P_y \( e^(i t) \) ∩ P_x \( e^(i alpha_plus.minus \( t \)) \) = diameter wide upright("for almost every ") t . $
  Both binary selections belong to the same fixed pair of labels. Consequently,
  $ s_x \( alpha_(+) \( t \) \) = s_x \( alpha_(-) \( t \) \) = - s_y \( t \) wide upright("for almost every ") t . $
  Since $alpha_(-)$ is nonsingular for angular Lebesgue measure, $s_x$ is invariant almost everywhere under $H =
    alpha_(+) compose alpha_(-)^(- 1)$.
  By (5.8), $s_x$ is also invariant under translation by $2 kappa$. Define
  $ F \( t \) = H \( t \) - 2 kappa \, wide F_j \( t \) = j kappa + F \( t - j kappa \) \, wide 0 lt.eq j lt.eq 5 . $
  Then $s_x compose F = s_x$ almost everywhere. More generally,
    (5.8) gives $s_x \( t + j kappa \) = \( - 1 \)^j s_x \( t \)$ almost everywhere, and hence
  $ s_x \( F_j \( t \) \) = \( - 1 \)^j s_x \( F \( t - j kappa \) \) = \( - 1 \)^(2 j) s_x \( t \) = s_x \( t \) $
  almost everywhere. The changes of variables in these identities are legitimate because all the maps involved are
    diffeomorphisms.
  #emph[Uniform expansions of the six maps.] For a periodic function,
    an $O_(C^2) \( d^2 \)$ remainder means that its value and its first two derivatives in $t$ are bounded by a
    fixed constant times $d^2$, uniformly in $t$. Taylor expansion gives
  $ "Im" log \( 1 + d e^(- i t) \) & = - d sin t + O_(C^2) \( d^2 \) \,\
\| d + e^(i t) \| & = 1 + d cos t + O_(C^2) \( d^2 \) \,\
alpha_plus.minus \( t \) & = t plus.minus kappa - d sin t minus.plus d / sqrt(3) cos t + O_(C^2) \( d^2 \) . $
  All the bounds are uniform: the logarithm, square root, and arccosine in these formulas range in fixed smooth
    domains for $d < 1 \/ 2$. The inverse maps also depend smoothly on $d$,
    with uniformly bounded derivatives on a period.
  For the composition, put
  $ a_plus.minus \( t \) = - sin t minus.plus 1 / sqrt(3) cos t . $
  Then
  $ alpha_(-)^(- 1) \( t \) = t + kappa - d a_(-) \( t + kappa \) + O_(C^2) \( d^2 \) \, $
  and therefore
  #[#set math.equation(numbering: n => "(5.9)")
   $ F \( t \) & = t + d #scale(x: 120%, y: 120%)[\(] a_(+) \( t + kappa \) -
     a_(-) \( t + kappa \) #scale(x: 120%, y: 120%)[\)] + O_(C^2) \( d^2 \)\
 & = t - frac(2 d, sqrt(3)) cos \( t + kappa \) + O_(C^2) \( d^2 \)\
 & = t + frac(2 d, sqrt(3)) sin \( t - pi \/ 6 \) + O_(C^2) \( d^2 \) . $ <eq:palettes-binary-map-expansion>]
  Thus
  $ F_j \( t \) = t + frac(2 d, sqrt(3)) sin \( t - j kappa - pi \/ 6 \) + O_(C^2) \( d^2 \) . $
  Among six phases spaced by $pi \/ 3$, the maximum sine and the maximum cosine are each at least $sqrt(3) \/ 2$.
    Absorbing the quadratic remainders, we obtain absolute constants $c_0 \, C_0 \, d_1 > 0$, with $d_1 < 1 \/ 2$,
    such that whenever $0 < d < d_1$, for every $t$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ max_(0 lt.eq j lt.eq 5) \( F_j \( t \) - t \) & gt.eq c_0 d \,\
max_(0 lt.eq j lt.eq 5) F'_j \( t \) & gt.eq 1 + c_0 d \,\
\| F_j \( t \) - t \| \, quad \| F'_j \( t \) - 1 \| \, quad \| F''_j \( t \) \| & lt.eq
  C_0 d wide \( 0 lt.eq j lt.eq 5 \) . $ <eq:palettes-binary-control>]
  The map attaining the first maximum need not attain the second.
    We will use the derivative maximum to enlarge small intervals,
    and the displacement maximum later to extend a conull interval.
  Choose once and for all
  $ 0 < L lt.eq min { c_0 \/ C_0 \, pi \/ 4 } \, wide delta_(*) = min { d_1 \, \( 2 C_0 \)^(- 1) \,
    L \/ \( 2 C_0 \) } \, $
  and assume $0 < d < delta_(*)$. In particular every $F_j$ and its inverse is Lipschitz, since
  $ 1 / 2 lt.eq F'_j lt.eq 3 / 2 . $
  #emph[Enlarging density intervals with bounded distortion.] This is an adaptation of Sullivan’s expanding-action
    and bounded-distortion strategy; see Deroin–Kleptsyn–Navas #cite(label("DeroinKleptsynNavas2008"))
    Section 2.1. The argument below replaces the usual minimality step by explicit small-displacement overlap
    propagation when extending the conull interval. Let
  $ A = { t in bb(R) : s_x \( t \) = 1 } . $
  It is measurable and $2 pi$-periodic, and has measure $pi$ in every period.
    The identities already proved say that $F_j^(- 1) \( A \)$ and $A$ differ by a null set.
    Because $F_j$ and its inverse preserve null sets, the same holds for $F_j \( A \)$ and $A$,
    and for every finite composition of the maps. There is no difficulty from choosing the compositions
    adaptively: there are only countably many finite words in the six maps and their inverses.
    Equivalently, one may discard the union of the images of the finitely many exceptional null sets under this
    countable group, obtaining a common invariant conull set on which all the membership identities hold.
  Take an interval $I_0$ of positive length $ell_0 < L$. Given $I_r$ with length $ell_r < L$,
    choose $F_(j_r)$ whose derivative at the midpoint of $I_r$ is at least $1 + c_0 d$, and put $I_(r + 1) =
    F_(j_r) \( I_r \)$. For every $t in I_r$,
  $ F'_(j_r) \( t \) gt.eq 1 + c_0 d - 1 / 2 C_0 d ell_r gt.eq 1 + 1 / 2 c_0 d . $
  Writing $lambda = 1 + c_0 d \/ 2 > 1$, we therefore have $ell_(r + 1) gt.eq lambda ell_r$.
    The process stops after finitely many steps, at the first $N$ for which $ell_N gt.eq L$, and
  $ L lt.eq ell_N lt.eq \( 1 + C_0 d \) L . $
  Let $G = F_(j_(N - 1)) compose dots.h.c compose F_(j_0)$. For each elementary map,
  $ \| \( log F'_j \)' \| = lr(|F''_j / F'_j|) lt.eq 2 C_0 d . $
  Applying the chain rule at two points of $I_0$, whose images before step $r$ lie in $I_r$, gives
  $ "osc"_(I_0) log G' lt.eq 2 C_0 d sum_(r = 0)^(N - 1) ell_r . $
  The geometric growth bounds the sum independently of $N$:
  $ sum_(r = 0)^(N - 1) ell_r lt.eq ell_N sum_(q = 1)^N lambda^(- q) lt.eq frac(ell_N, lambda - 1) . $
  Consequently,
  #[#set math.equation(numbering: n => "(5.11)")
   $ "osc"_(I_0) log G' lt.eq frac(4 C_0 \( 1 + C_0 d \) L, c_0) lt.eq
     frac(6 C_0 L, c_0) . $ <eq:palettes-binary-distortion>]
  In particular,
  $ frac(sup_(I_0) G', inf_(I_0) G') lt.eq D_(upright("dist")) \, wide D_(upright("dist")) =
    exp \( 6 C_0 L \/ c_0 \) \, $
  uniformly in the initial interval, the number of steps, and $0 < d < delta_(*)$.
  The invariance of $A$, together with preservation of null sets,
    implies that $G \( I_0 \) \\ A$ and $G \( I_0 \\ A \)$ differ by a null set.
    Change of variables and the distortion bound therefore give
  $ frac(\| I_N \\ A \|, \| I_N \|) lt.eq frac(sup_(I_0) G', inf_(I_0) G') frac(\| I_0 \\ A \|, \| I_0 \|) lt.eq
    D_(upright("dist")) thin frac(\| I_0 \\ A \|, \| I_0 \|) . $
  This is the only measure comparison needed; the maps need not preserve Lebesgue measure.
  Since $A$ has positive measure, choose a Lebesgue density point of $A$ and a sequence of centered intervals
    shrinking to it. Their relative complements in $A$ tend to zero. Apply the construction to each interval.
    The resulting intervals $J_n$ have lengths in $\[ L \, \( 1 + C_0 d \) L \]$, and
  $ \| J_n \\ A \| arrow.r 0 . $
  Translate $J_n$ by an integer multiple of $2 pi$ so that its left endpoint lies in $\[ 0 \, 2 pi \)$.
    This leaves the preceding measure statement unchanged. Passing to a subsequence,
    their two endpoints converge to those of an interval $J = \[ a \, b \]$ of length at least $L$.
    Endpoint convergence gives $\| J_n triangle.stroked.t J \| arrow.r 0$, and hence
  $ \| J \\ A \| lt.eq \| J triangle.stroked.t J_n \| + \| J_n \\ A \| arrow.r 0 . $
  We have obtained an interval of fixed positive length on which $A$ is conull.
  #emph[Extending a conull interval.] Suppose $A$ is conull on $\[ a \, b \]$, with $b - a gt.eq L$.
    By the first inequality in (5.10), choose $j$ so that
  $ F_j \( b \) gt.eq b + c_0 d . $
  The image $F_j \( \[ a \, b \] \)$ is also conull in $A$. Moreover,
  $ F_j \( a \) lt.eq a + C_0 d < a + L lt.eq b . $
  Thus this image overlaps $\[ a \, b \]$, and their union contains $\[ a \, F_j \( b \) \]$,
    on which $A$ is conull. Its right endpoint has advanced by at least $c_0 d$.
    This argument concerns geometric endpoints only; no membership in $A$ is asserted at either endpoint.
  Repeat, retaining the left endpoint $a$. After finitely many steps the conull interval has length at least $2
    pi$. Periodicity then forces $A$ to have full measure in a period,
    contrary to the measure $pi$ forced by (5.8). This contradiction excludes $0 < \| y -
    x \| < delta_(*)$ and proves the lemma. ◻
]

=== 5.4 At most two labels in an angular palette <at-most-two-labels-in-an-angular-palette>

#thm([Proposition 5.6.])[
  (Palette cardinality).  #emph[For every center $x in bb(R)^2$,
#[#set math.equation(numbering: n => "(5.12)")
 $ 1 lt.eq \| P_x \( e \) \| lt.eq 2 wide upright("for almost every ") e in S . $ <eq:source-13>]

 The angular exceptional set may depend on $x$.]
] <prop:palette-size>

#proof[
  Nonemptiness follows from any one trace in $cal(W)_x$, whose coordinates are nonnegative and sum to one.
    Suppose the upper bound fails on a positive-measure set of angles.
    There are only finitely many triples of labels, so some fixed triple $cal(A) subset { 1 \, dots.h \,
    5 }$ is contained in $P_x \( e \)$ on a positive-measure angular set $B$.
  By (5.2) and Fubini, for almost every $e in B$, the actual coloring on the circle
  $ v mapsto x + e + v $
  uses only the complementary pair ${ 1 \, dots.h \, 5 } \\ cal(A)$ almost everywhere.
    For almost every such $e$, this exact radius-one circle sampling is also typical.
    Indeed the map $\( e \, v \) mapsto x + e + v$ is nonsingular off a product-null set,
    so the inverse image of the plane-null set of atypical points is product-null;
    Fubini then gives the asserted slices.
  For each of these $e$, the actual sampling at center $x + e$, radius exactly one,
    is itself a trace in $cal(W)_(x + e)$, using a constant sequence.
    Its coordinates sum to one and are supported in the complementary pair.
    Hence the maximal palette at $x + e$ intersects that pair almost everywhere.
    By (5.7), it has a unique member of the pair almost everywhere, alternating at an $R$-step.
    Thus $x + e$ is binary for that same fixed pair, even if other traces add further labels to the maximal palette.
  The good angles still have positive measure, so they give infinitely many distinct binary centers on the compact
    circle $x + S$. Lemma 25 makes these centers uniformly separated.
    A uniformly separated subset of a compact metric space is finite,
    by a finite cover with sufficiently small balls. This contradiction proves the upper bound. ◻
]

== 6 Transitions and local finiteness of cyclic centers <sec:transitions>

Continue to assume that a weak measurable five-coloring is given,
  with the notation and null-set conventions of Section 5. Write $cal(I)$ for the five-element label set.
  As before, $H_i$ is the closed spatial essential support of $A_i$, and $P_x$ is defined at every center $x$,
  modulo angular null sets. We first use transitions between two colors to obtain circle traces that avoid both
  labels. The resulting angular restrictions show that centers whose transition graphs contain a cycle form a
  locally finite set. In Section 7 we construct a continuous graph-valued map on a square after removing small
  disks about these centers.

=== 6.1 Transition graphs and avoiding traces <transition-graphs-and-avoiding-traces>

For distinct $i \, j in cal(I)$, a bounded ball $B subset bb(R)^2$, and $h in bb(R)^2$, define

$ D_(i j) \( B \, h \) = \| { q in B : \( c \( q \) \, c \( q + h \) \) in { \( i \, j \) \, \( j \, i \) } }
  #scale(x: 120%, y: 120%)[\|] \, $

where vertical bars on a plane set denote Lebesgue area. The second endpoint $q +
  h$ is not required to belong to $B$. The normalization by $\|
  h \|$ below is chosen to match the circle-averaging estimate used in Lemma 28:
  transition sets of area comparable to $\| h \|$ will yield traces avoiding both endpoint labels.

#prodef([Definition 6.1.])[
  (Transition graph).  For $x in bb(R)^2$, let $Gamma_x$ be the simple graph on $cal(I)$ in which $i
    j$ is an edge precisely when, for every ball $B$ centered at $x$ with positive finite radius,
  #[#set math.equation(numbering: n => "(6.1)")
   $ limsup_(h arrow.r 0\
h eq.not 0) frac(D_(i j) \( B \, h \), \| h \|) > 0 . $ <eq:source-14>]
] <def:transitions-graph>

For each fixed pair $i j$, its edge-presence locus is closed.
  Indeed, a ball centered at a limit of points of that locus contains a smaller ball centered at one of those
  points, and $D_(i j)$ is monotone in its ball argument. Moreover,

$ i j in Gamma_x quad arrow.r.double quad x in H_i ∩ H_j . $

To check this in any neighborhood of $x$, use a smaller ball and then choose $h$ small enough that both endpoints
  of every transition under consideration remain in the neighborhood.
  A positive-area transition set gives positive area of each endpoint color there; translation preserves area.

#thm([Lemma 6.2.])[
  (An edge has an avoiding trace).  #emph[If $i j in Gamma_x$,
    there is a trace $b^(i j) in cal(W)_x$ with $b_i^(i j) = b_j^(i j) = 0$ almost everywhere. Consequently,
#[#set math.equation(numbering: n => "(6.2)")
 $ P_x \( e \) subset.not { i \, j } quad upright("for almost every ") e in S \, wide i j in Gamma_x . $ <eq:source-15>]

]
] <lem:transitions-avoiding-trace>

#proof[
  Write
  $ cal(S) g \( q \) = integral_S g \( q + e \) thin d sigma \( e \) . $
  The estimate we need, for every fixed bounded ball $B$ and every label $s$, is
  #[#set math.equation(numbering: n => "(6.3)")
   $ parallel cal(S) #scale(x: 120%, y: 120%)[\(] a_s - a_s \( thin dot.op + h \) #scale(x: 120%, y: 120%)[\)]
     #scale(x: 120%, y: 120%)[parallel]_(L^2 \( B \)) = o #scale(x: 120%, y: 120%)[\(] sqrt(\| h \|)
     #scale(x: 120%, y: 120%)[\)] wide \( h arrow.r 0 \) . $ <eq:source-16>]
  Here and in (6.1), the vector $h$ may approach zero in any direction.
  Choose a boundedly supported $g in L^2 \( bb(R)^2 \)$ agreeing with $a_s$ on a ball containing $B + S +
    h$ for all sufficiently small $h$, as well as $B + S$. The Fourier transform of normalized circle measure satisfies
  $ \| hat(sigma) \( xi \) \| lt.eq C \( 1 + \| xi \| \)^(- 1 \/ 2) . $
  For completeness, after rotating coordinates the relevant integral is a constant multiple of $integral_0^(2 pi)
    exp \( i r cos t \) thin d t$, where $r$ is proportional to $\| xi \|$.
    For $r gt.eq 1$, removing the arcs on which $\| sin t \| lt.eq r^(- 1 \/ 2)$ costs $O \( r^(- 1 \/ 2) \)$.
    On each remaining interval, integration by parts using the derivative $-
    i r sin t$ gives endpoint terms $O \( r^(- 1 \/ 2) \)$, while the integral of $\| cos
    t \| \/ \( r sin^2 t \)$ is also $O \( r^(- 1 \/ 2) \)$. The bound for $r lt.eq 1$ is immediate.
  By Plancherel, the square of the global $L^2$ norm of $cal(S) \( g - g \( thin dot.op + h \) \)$,
    divided by $\| h \|$, is bounded by the integral of $\| hat(g) \( xi \) \|^2$ times
  $ frac(C, 1 + \| xi \|) frac(min { C \| h \|^2 \| xi \|^2 \, 4 }, \| h \|) . $
  This multiplier is uniformly bounded: split at $\| xi \| = \| h \|^(- 1)$.
    For each fixed $xi$ it tends to zero as $h arrow.r 0$. Dominated convergence therefore proves (6.3);
    the cutoff is fixed before $h$ tends to zero.
  For a fixed displacement $h$, almost every root $q$ has both $q \, q + h$ typical,
    and both exact unit-circle samplings centered at these points typical on their circles.
    At a transition from color $s$ to color $t$, the first circle avoids $s$ and the second avoids $t$,
    by properness of the coloring on typical points. Thus the mass of color $t$ on the first circle equals
    $cal(S) \( a_t - a_t \( thin dot.op + h \) \) \( q \)$. For a transition between $i$ and $j$ in either order,
    the first-circle mass of these two colors together is consequently bounded by
  $ \| cal(S) \( a_i - a_i \( thin dot.op + h \) \) \( q \) #scale(x: 120%, y: 120%)[\|] + \|
    cal(S) \( a_j - a_j \( thin dot.op + h \) \) \( q \) #scale(x: 120%, y: 120%)[\|] . $
  Fix a ball $B$ about $x$. Since $i j in Gamma_x$, there is a constant $c_B >
    0$ and arbitrarily small nonzero $h$ for which the transition set in $B$ has area at least $c_B \| h \|$.
    Cauchy–Schwarz and (6.3) show that the average of the preceding mass over this transition set is at most
  $ frac(o \( sqrt(\| h \|) \), sqrt(c_B \| h \|)) = o \( 1 \) . $
  Now take balls $B_m$ of radii tending to zero about $x$. After fixing $B_m$ and its constant $c_(B_m)$,
    choose $h_m$ sufficiently small and then a transition root $q_m in B_m$ from the preceding full-measure set,
    whose first-circle mass of $i \, j$ is less than $1 \/ m$.
    This order of choice requires no lower bound on $c_(B_m)$ uniform in $m$.
    The circle samples at $q_m$ have radius one; a weak-\* subsequential limit belongs to $cal(W)_x$ and has zero
    mass in the two specified coordinates. Since it is nonnegative, sums to one,
    and is supported within $P_x$ almost everywhere, it also proves (6.2). ◻
]

=== 6.2 Two angular state lemmas <two-angular-state-lemmas>

A #emph[state] at a center $x$ will mean a measurable angular set together with a specified nonempty group of
  labels contained in $P_x \( e \)$ almost everywhere on that set.
  For a measurable set $A subset S$, its closed essential support is

$ "ess supp"_S A = { a in S : sigma \( A ∩ I \) > 0 upright(" for every open arc ") I in.rev a } . $

It is empty exactly when $A$ is null. Almost every point of $A$ is both a density-one direction for $A$ and a
  member of this support. Changing the representative of a state on a null set changes neither its support nor any
  assertion below.

#thm([Lemma 6.3.])[
  (Strict state separation).  #emph[Suppose $A \, B subset S$ are states at $x$ representing disjoint label groups
    whose union is $cal(I) \\ { X }$, for a fixed label $X$. At any nonparallel density-one directions $a$ of $A$
    and $b$ of $B$, the point $x + a + b$ has spatial density one of $X$.]
  #emph[If $sigma \( A \) > 0$, the closed essential support of $B$ contains no pair at chordal distance one.
    In particular, it has a strict angular separation from its image under $R$ and under $R^(- 1)$,
    with the empty-support case interpreted vacuously.]
  #emph[The separation is uniform along a sequence of centers and states $\( x_n \, A_n \, B_n \)$ with the same
    represented groups, provided $upright(bold(1))_(A_n) arrow.r
    upright(bold(1))_A$ in $L^1 \( S \)$ for a set $A$ of positive measure.
    More precisely, for all sufficiently large $n$, angular differences between two points of $"ess supp"_S
    B_n$ stay a fixed positive distance from both $kappa$ and $- kappa$ modulo $2 pi$.]
] <lem:transitions-strict-separation>

#proof[
  The density conclusion of Lemma 22, following (5.2), gives density zero of each of the four represented labels
    at the nonparallel sum. Their complement, the singleton $X$, therefore has density one there.
  We prove the uniform assertion by contradiction; the fixed-center case follows by using a constant sequence.
    If it fails, choose pairs in the supports of $B_n$ with chordal distances tending to one.
    Each support point is approximable by density-one directions of $B_n$.
    We may thus choose density directions $b_n \, d_n$ in those states such that, after a subsequence,
  $ b_n arrow.r b \, wide d_n arrow.r d \, wide w_n = b_n - d_n arrow.r w = b - d \, wide \| w \| = 1 . $
  Choose a small angular interval $I$ with $sigma \( A ∩ I \) > 0$,
    whose closure is separated from the directions parallel to any of $w \, b \, d$.
    Such an interval exists because only finitely many directions are excluded and $A$ has positive measure.
  For $a in I$, the implicit function theorem gives a unit direction $c_n \( a \)$, smoothly depending on $a$, with
  $ \| w_n + a - c_n \( a \) \| = 1 \, wide c_n arrow.r "id" quad upright("in ") C^1 \( I \) . $
  Indeed, at $w_n = w$ and $c_n \( a \) = a$ the squared-length equation is satisfied and its derivative in the
    angle of $c_n \( a \)$ is $- 2 w dot.op J a eq.not 0$. Shrinking $I$ around a density point of $A$ if
    necessary makes this construction uniform on its closure.
  The maps $c_n$ have uniformly bounded inverse derivatives.
    It follows that $upright(bold(1))_(A_n) compose c_n arrow.r upright(bold(1))_A$ in $L^1 \( I \)$:
    the difference between $upright(bold(1))_(A_n) compose c_n$ and $upright(bold(1))_A compose
    c_n$ is controlled by the $L^1$ convergence under change of variables;
    continuous approximation of $upright(bold(1))_A$ and $c_n arrow.r "id"$ treat the remaining difference.
    Together with $upright(bold(1))_(A_n) arrow.r upright(bold(1))_A$ on $I$,
    this shows that the set of $a in I$ for which both $a$ and $c_n \( a \)$ lie in $A_n$ has positive measure for
    large $n$. Excluding null sets, choose such an $a$ for which both are density-one directions.
    The choice of $I$ ensures that $\( a \, b_n \)$ and $\( c_n \( a \) \, d_n \)$ are nonparallel. The points
  $ x_n + a + b_n \, wide x_n + c_n \( a \) + d_n $
  both have density one of color $X$, yet their distance is $\| w_n + a - c_n \( a \) \| = 1$.
    This contradicts properness of density-one points. At a single center,
    compactness of the support turns exclusion of distance-one pairs into the asserted strict margin. ◻
]

#thm([Lemma 6.4.])[
  (Singleton–pair alternation is impossible).  #emph[At a fixed center,
    there is no measurable state function with only the two values $X \, D$,
    representing respectively a singleton ${ X }$ and a fixed disjoint pair $D$,
    and changing state under $R$ almost everywhere.]
] <lem:transitions-two-state>

#proof[
  Put
  $ gamma = 2 arcsin frac(1, 2 sqrt(3)) \, wide cos gamma = 5 / 6 . $
  The ratio $gamma \/ pi$ is irrational. Otherwise $e^(i gamma)$ would be a root of unity, making $2 cos gamma =
    5 \/ 3$ a rational algebraic integer, hence an integer, a contradiction.
  There is a positive-measure set of angles $t$ whose states at $t$ and $t + gamma$ are equal.
    If not, the state would flip almost everywhere under $gamma$, and hence be invariant under $2 gamma$.
    A measurable function invariant under an irrational circle rotation is constant almost everywhere:
    its nonconstant Fourier coefficients vanish, since the corresponding rotation eigenvalues differ from one.
    This would contradict the flip under $kappa$.
  Choose $t$ from the positive-measure equality set, also imposing all finitely many needed $R$-alternation
    identities and density-direction conditions. For $j = 0 \, 1 \, 2$, form the points
  $ z_j = x + e^(i \( t + 2 j kappa \)) + e^(i \( t + pi + gamma + 2 j kappa \)) = x +
    e^(i \( t + 2 j kappa \)) \( 1 - e^(i gamma) \) . $
  They have distance $\| 1 - e^(i gamma) \| = 1 \/ sqrt(3)$ from $x$ and form an equilateral triangle of side one.
    In each sum the two nonparallel endpoints have opposite states:
    $2 kappa$ preserves the state and $pi = 3 kappa$ flips it.
    The density consequence of Lemma 22 therefore gives density one at each $z_j$ to the union of the two labels
    outside ${ X } union D$. A uniform common translation in a sufficiently small disk puts all three vertices in
    that union and in the typical set with positive probability;
    the three failure probabilities tend to zero by density one.
    The resulting unit equilateral triangle would be properly colored with two labels, a contradiction. ◻
]

=== 6.3 The cyclic-center locus <the-cyclic-center-locus>

#thm([Theorem 6.5.])[
  (Local finiteness of cyclic centers).  #emph[The set
#[#set math.equation(numbering: n => "(6.4)")
 $ cal(L) = { x in bb(R)^2 : Gamma_x upright(" contains a cycle") } $ <eq:source-19>]

 is closed and locally finite: it has finite intersection with every compact subset of the plane.]
] <thm:cyclic-local-finiteness>

For any specified simple label cycle, its locus is the intersection of its finitely many closed edge-presence
  loci, hence is closed. There are only finitely many simple cycles on five labels.
  It therefore suffices to prove local finiteness separately for each triangle, four-cycle, and five-cycle.

For a triangle, (6.2) for its three edges and Proposition 26 force $P_x \( e \)$ to intersect the pair of outside
  labels almost everywhere. Indeed, a nonempty subset of the three triangle labels of size at most two lies in
  some triangle edge, which is forbidden. By (5.7) the intersection with the outside pair is unique almost
  everywhere and alternates under $R$. Thus every such $x$ is binary for that fixed pair.
  Lemma 25 proves local finiteness of the triangle locus.

==== 6.3.1 Four-cycles: continuity of states <four-cycles-continuity-of-states>

Fix a four-cycle and relabel its vertices $0 \, 1 \, 2 \, 3$ in cyclic order, with fifth label $X$.
  Let $L$ be its closed locus and write

$ U = { 0 \, 2 } \, wide V = { 1 \, 3 } . $

For $x in L$ define the canonical state $w_x \( e \)$ as follows:
  it is $X$ if $X in P_x \( e \)$, and otherwise it is $U$ or $V$ according to which of these two pairs equals
  $P_x \( e \)$. This is exhaustive almost everywhere. A palette not containing $X$ has size at most two,
  and (6.2) excludes every singleton and every adjacent pair of the four-cycle,
  leaving precisely the two diagonals. The states represent the groups ${ X } \, U \,
  V$ contained in their palettes, and (5.7) gives

$ w_x \( e \) eq.not w_x \( R e \) quad upright("almost everywhere") . $

Both diagonal states have positive angular measure. If either were null,
  the other and $X$ would give the impossible alternation of Lemma 30.

#thm([Lemma 6.6.])[
  (Continuity of four-cycle states).  #emph[For each $s in { X \, U \, V }$,
    the map $x mapsto upright(bold(1))_({ w_x = s })$ is continuous from $L$ into $L^1 \( S \)$.]
] <lem:transitions-four-continuity>

#proof[
  At each $y in L$ choose an avoiding trace $b_y^(i j)$ for each of its four specified edges.
    If $k$ belongs to the group represented by a state $s$, then
  #[#set math.equation(numbering: n => "(6.5)")
   $ upright(bold(1))_({ w_y = s }) lt.eq sum_(i j upright(" in the four-cycle")) b_(y \, k)^(i j) quad
     upright("almost everywhere") . $ <eq:source-20>]
  To see this, fix a generic direction in state $s$. If the palette has another member besides $k$,
    some cycle edge contains that member but does not contain $k$.
    For a diagonal state, choose an edge incident to its other member; for $k = X$,
    choose an edge incident to the possible additional label. If no other member exists, any cycle edge suffices.
    The corresponding trace avoids its edge endpoints and is supported within the palette,
    so its $k$-coordinate equals one. There are only finitely many chosen traces,
    allowing one common conull set of directions for this argument.
  Let $y_n arrow.r x$ in $L$. Along any subsequence, pass further to weak-\* limits of the three state indicators
    and all four chosen traces. Denote the former limits by $f_X \, f_U \, f_V$.
    The trace limits belong to $cal(W)_x$ by its closed-graph property.
    Inequality (6.5) passes to the weak-\* limits, and its nonnegative right-hand side shows that wherever $f_s >
    0$, every label represented by $s$ belongs to $P_x$, almost everywhere.
    Two different state groups would require at least three palette labels, contradicting Proposition 26.
    Since the $f_s$ are nonnegative and sum to one, exactly one equals one at almost every direction.
    Its group determines precisely the canonical state $w_x$:
    a diagonal already fills both palette slots, while a positive singleton state requires $X in P_x$.
    Thus $f_s = upright(bold(1))_({ w_x = s })$ almost everywhere.
  Weak-\* convergence of indicators to an indicator implies $L^1$ convergence:
    for indicators $f_n \, f$, test against $1$ and $f$ in $integral \| f_n - f \| = integral f_n + integral f -
    2 integral f_n f$. Every subsequence has a further subsequence with this same $L^1$ limit,
    which proves the claimed continuity. ◻
]

Let $S_(U \, x) \, S_(V \, x)$ be the closed essential supports of the two diagonal states, and put $N_x =
  S_(U \, x) union S_(V \, x)$. Both supports are nonempty.
  Across their nonparallel density directions, the four represented labels force singleton density one of $X$.
  Lemma 29 therefore gives a strict margin between each support and its own $R$-shift.
  These margins are uniform along any convergent sequence in $L$,
  by Lemma 32 and positivity of both limiting diagonal states.
  We also have the following consequence of that continuity:

$ b in S_(s \, x) \, quad y_n arrow.r x upright(" in ") L quad arrow.r.double quad
  upright("there are ") b_n in S_(s \, y_n) upright(" with ") b_n arrow.r b quad \( s = U \, V \) . $

Indeed, every neighborhood of $b$ has positive limiting state measure,
  hence positive state measure at all sufficiently large $n$. Successively smaller neighborhoods give the sequence.

The set $N_x$ is a proper subset of $S$. Otherwise a point in the intersection of the two supports would rotate
  under $R$ outside both, by their strict separations. The two nonempty supports would therefore have to be
  disjoint and cover the connected circle, which is impossible.
  On every component gap of $S \\ N_x$ the state is $X$ almost everywhere.
  Such a gap has angular length at most $kappa$, since an interval of greater length overlaps its $R$-translate in
  an open interval, contrary to the state-change rule.

==== 6.3.2 Four-cycles: transport and the accumulation contradiction <four-cycles-transport-and-the-accumulation-contradiction>

For nonparallel $a \, b in S$ and $h$ sufficiently small, the local inverse of the sum map defines

$ T_h \( a \, b \) = \( c \, d \) \, wide c + d = a + b - h \, wide \( c \, d \) upright(" near ") \( a \, b \) . $

It is smooth in the two angular variables and in $h$, and for fixed $h$ it is a local diffeomorphism of the
  angular pair. Its branch at $h = 0$ is the identity.

We will use the following support transport rule. If $y = x + h in L$ and $a in S_(U \, x)$,
  $b in S_(V \, x)$ are nonparallel, then

$ T_h \( a \, b \) in N_y times N_y $

whenever the indicated nearby branch is defined. In arbitrarily small product neighborhoods of $\( a \, b \)$
  there is a positive-measure set of pairs of density directions for $U \, V$ at $x$.
  The spatial sums of every such nonparallel pair have density one of $X$.
  The local diffeomorphism $T_h$ permits removal of all null sets needed to make both output directions density
  directions of their states at $y$ and members of the corresponding essential supports.
  Neither output state can be $X$: the density consequence of Lemma 22 at $y$ would then give density zero of $X$
  at the same spatial sum. Both outputs consequently belong to $N_y$.
  Approximating the initial support pair by these generic pairs and using closedness proves the rule.
  It also holds with $U \, V$ interchanged, and in the reverse direction under $T_(- h)$.
  All null sets here concern the two fixed centers in a single application;
  no joint measurability in the center is used.

Suppose now that distinct points $y_n = x + h_n$ of $L$ tend to $x$. After a subsequence, write

$ delta_n = \| h_n \| > 0 \, wide H_n = h_n \/ delta_n arrow.r H in S . $

Take any endpoint $a$ of a gap of $N_x$, first with the gap just to its right in real angular coordinates.
  It belongs to at least one diagonal support, say $S_(U \, x)$; the other case is symmetric.
  Assume $H dot.op a eq.not 0$.

The first output angle of $T_h \( a \, b \)$ has directional velocity

$ V_H \( a \; b \) = - frac(H dot.op b, a times b) = - H dot.op J a - \( H dot.op a \) cot \( arg b - arg a \) \,
  wide a times b = sin \( arg b - arg a \) . $

Indeed, differentiating $c + d = a + b - h$ at $h = 0$ in direction $H$ gives $J a thin dot(theta) +
  J b thin dot(phi.alt) = - H$; take the dot product with $b$.
  Since $H dot.op a eq.not 0$, this velocity takes different values at projectively different nonparallel
  directions $b$. The positive measure of the $V$ state allows choices $b \, b' in S_(V \, x)$,
  neither parallel to $a$, with $V_H \( a \; b \) > V_H \( a \; b' \)$.

Set $c_n = T_(h_n)^1 \( a \, b \)$. By support transport, $c_n in N_(y_n)$, and smoothness gives

$ arg c_n = arg a + delta_n V_H \( a \; b \) + o \( delta_n \) . $

If $c_n in S_(U \, y_n)$ along an infinite subsequence, choose $b'_n in S_(V \, y_n)$ with $b'_n arrow.r b'$.
  Transporting $\( c_n \, b'_n \)$ back by $T_(- h_n)$ gives a first endpoint in $N_x$ whose angle is

$ arg a + delta_n #scale(x: 120%, y: 120%)[\(] V_H \( a \; b \) - V_H \( a \; b' \) #scale(x: 120%, y: 120%)[\)] +
  o \( delta_n \) . $

This lies strictly inside the gap for large $n$, a contradiction.
  To justify the error term without any convergence rate for $b'_n$,
  let $tau \( h \, theta \, beta \)$ be a real lift of the first output angle on a fixed branch near
  $\( 0 \, arg a \, arg b' \)$. The identity $tau \( 0 \, theta \, beta \) = theta$ gives,
  uniformly on a smaller neighborhood,

$ tau \( h \, theta \, beta \) = theta + D_h tau \( 0 \, theta \, beta \) h + O \( \| h \|^2 \) . $

Thus the change in the auxiliary angle $beta$ affects only the coefficient multiplied by $h$.
  Continuity of that coefficient, $c_n arrow.r a$, $b'_n arrow.r b'$, and $H_n arrow.r
  H$ give the claimed $o \( delta_n \)$ remainder.

It follows that $c_n in S_(V \, y_n)$ for all large $n$. The strict separation for $U$ leaves a neighborhood of $R
  a$ free of $S_(U \, x)$. Immediately to the right of $a$ the state is $X$ almost everywhere,
  so immediately to the right of $R a$ it is non-$X$ almost everywhere.
  It must therefore be $V$ on a one-sided neighborhood of $R a$, giving $R a in S_(V \, x)$.
  There are points of $S_(V \, y_n)$ tending to $R a$. Together with $c_n arrow.r a$,
  these violate the uniform strict separation of $S_(V \, y_n)$ from its own $R$-shift.

For a gap lying to the left of $a$, choose $V_H \( a \; b \) <
  V_H \( a \; b' \)$ and repeat the argument on that side. Thus every gap endpoint would have to satisfy $H dot.op
  a = 0$. There are only two such directions, and they are antipodal.
  A nonempty gap has distinct endpoints and length at most $kappa < pi$,
  so its two endpoints cannot both be these directions. This contradiction rules out accumulation in $L$ and
  proves local finiteness for the specified four-cycle.

==== 6.3.3 Five-cycles: support lists and a global step ban <five-cycles-support-lists-and-a-global-step-ban>

Fix a five-cycle, labeled in cyclic order by $bb(Z) \/ 5 bb(Z)$, and a center $x$ in its locus.
  By (6.2) and Proposition 26, almost every palette is exactly one of its diagonals

$ D_i = { i \, i + 2 } \, wide i in bb(Z) \/ 5 bb(Z) . $

Write $w_x \( e \) = i$ for this state. Two such diagonals are disjoint exactly when their indices differ by one, so

#[#set math.equation(numbering: n => "(6.6)")
 $ w_x \( R e \) = w_x \( e \) plus.minus 1 med \( mod med 5 \) quad upright("almost everywhere") . $ <eq:source-21>]

Let $S_i$ be the closed essential support of state $i$, and let

$ S \( a \) = { i : a in S_i } wide \( a in S \) $

be its support list. Every list is nonempty, since the finitely many supports cover the circle:
  an uncovered direction would have a neighborhood on which all five state sets were null.

Every nonempty $S_i$ has strict separation from its own $R$-shift.
  Indeed, state $i$ then has positive measure, and (6.6) forces at least one of its adjacent states to have
  positive measure. Their two disjoint diagonals cover four labels, so Lemma 29 applies.
  It follows that, for every direction $a$,

$ S \( a \) ∩ S \( R a \) = diameter . $

Also, each $i in S \( a \)$ has an index adjacent to it in each of $S \( R a \)$ and $S \( R^(- 1) a \)$.
  Approach $a$ by generic directions of state $i$, use (6.6),
  and pass to a constant adjacent index along a subsequence and then to its closed support.

#thm([Lemma 6.7.])[
  (A support contact bans an angular step).  #emph[If $i \, i + 1 in S \( a \)$ at any direction $a$,
    then the transitions $i arrow.r i + 1$ and $i + 1 arrow.r
    i$ under $R$ are absent almost everywhere on the entire angular circle at $x$.]
] <lem:transitions-step-ban>

#proof[
  Set $z = x + a$. There is a trace in $cal(W)_z$ avoiding $D_i$.
    In fact, in each neighborhood of $a$ the state-$i$ set has positive measure.
    By (5.2), the two-angle sum map, and Fubini, almost every direction in this set has a typical actual
    unit-circle sampling at the center $x$ plus that direction, avoiding $D_i$ almost everywhere.
    Choose such directions tending to $a$ and pass to a weak-\* limit.
    The same construction gives, separately, a trace at $z$ avoiding $D_(i + 1)$. Consequently, almost everywhere,
  $ P_z \( f \) subset.not D_i \, wide P_z \( f \) subset.not D_(i + 1) . $
  On the other hand, (5.3) applied to $z + f = x + f + a$ gives $P_z \( f \) ∩ P_x \( f \) =
    diameter$ almost everywhere. Its first endpoint map is $f mapsto f$, a local angular diffeomorphism;
    its second endpoint is constant, which is permitted. The excluded parallel directions $f =
    plus.minus a$ form a null set.
  Let $X$ be the label outside $D_i union D_(i + 1)$. Whenever $w_x \( f \) = i$, disjointness from $P_x \( f \) =
    D_i$ leaves only $D_(i + 1) union { X }$ available to $P_z \( f \)$,
    and the avoiding trace for $D_(i + 1)$ forces $X in P_z \( f \)$.
    The same reasoning applies when $w_x \( f \) = i + 1$. A step in either order between these states would
    therefore put $X$ into both $P_z \( f \)$ and $P_z \( R f \)$, contrary to (5.7).
    The statements used hold on a common conull set, also after pulling back by $R$, proving the global step ban. ◻
]

==== 6.3.4 Five-cycles: the accumulation contradiction <five-cycles-the-accumulation-contradiction>

Suppose distinct centers $y_n = x + h_n$ of this same five-cycle locus tend to $x$.
  Pass to a subsequence with $h_n \/ \| h_n \| arrow.r H in S$. For large $n$, write

$ y_n = x + a_n^(+) + a_n^(-) \, wide a_n^plus.minus = h_n /
  2 plus.minus sqrt(1 - frac(\| h_n \|^2, 4)) thin J frac(h_n, \| h_n \|) . $

These are unit directions and are nonparallel for each large $n$,
  although their limits are the antipodal pair $a = J H$ and $- a$.

For either endpoint $s = a_n^(+)$ or $s = a_n^(-)$, the diagonals in $S \( s \)$ have no common label.
  Suppose instead that every $D_i$ with $i in S \( s \)$ contained a label $k$.
  The finitely many closed supports not containing $s$ can be excluded by a sufficiently small neighborhood of
  $s$. Almost every direction in that neighborhood therefore has $k in P_x$.
  In a product neighborhood of the nonparallel pair $\( a_n^(+) \, a_n^(-) \)$,
  (5.2) and the local diffeomorphism of the sum map now imply that $A_k$ has zero area in an open spatial
  neighborhood of $y_n$. This contradicts $y_n in H_k$, which holds for every label because all five cycle edges
  are present at $y_n$. The neighborhoods in this argument may depend on $n$;
  no uniform nonparallelness of the endpoint pairs is needed.

The no-common-label property passes to $a$ and $- a$. In fact, for any fixed direction $u$,
  finiteness and closedness of the supports give $S \( v \) subset
  S \( u \)$ for every $v$ in some neighborhood of $u$. Thus eventually $S \( a_n^(+) \) subset S \( a \)$,
  and intersecting the diagonals over the larger list $S \( a \)$ still gives the empty set; likewise at $- a$.
  A nonempty index list whose diagonals have empty intersection contains adjacent indices.
  Otherwise it is an independent set in the index five-cycle, of size at most two,
  and any two nonadjacent diagonals have a common label.

Let $S^(\( r \)) = S \( R^r a \)$ for $r in bb(Z) \/ 6 bb(Z)$.
  Both $S^(\( 0 \))$ and $S^(\( 3 \))$ contain adjacent index pairs.
  Rotate the label indices so that $0 \, 1 in S^(\( 0 \))$. Then

$ 2 \, 4 in S^(\( 1 \)) ∩ S^(\( 5 \)) : $

these lists must avoid $0 \, 1$ and must contain a neighbor of each, forcing $4$ for $0$ and $2$ for $1$.
  If $j \, j + 1 in S^(\( 3 \))$, the same argument gives $j - 1 \, j + 2 in S^(\( 2 \)) ∩ S^(\( 4 \))$.
  Adjacent position lists are disjoint, so neither of $j - 1 \, j + 2$ can be $2$ or $4$.
  Checking the five possible residues of $j$ leaves only $j = 1$ or $j = 4$:
  their pairs ${ j - 1 \, j + 2 }$ are respectively ${ 0 \, 3 }$ and ${ 3 \, 1 }$; each of $j = 0 \, 2 \,
  3$ contains $2$ or $4$.

If $j = 1$, the adjacent pairs at $a$ and $- a$ are ${ 0 \, 1 }$ and ${ 1 \, 2 }$,
  so Lemma 33 bans both possible steps from state $1$. If $j = 4$, the pairs are ${ 0 \, 1 }$ and ${ 4 \, 0 }$,
  banning both steps from state $0$. In either case (6.6) makes the shared state null,
  contradicting its membership in $S^(\( 0 \))$. Only the step bans at the two fixed directions $a \, -
  a$ have been used, so no union of exceptional null sets over arbitrary directions is involved.
  This rules out accumulation in the five-cycle locus.

Each specified simple-cycle locus is closed and has no accumulation point.
  Its intersection with a compact set is therefore finite, by compactness.
  Taking the finite union over all specified simple cycles proves Theorem 31.

== 7 Extraction of common exclusion continua <sec:interfaces>

Continue to assume that a weak measurable five-coloring is given.
  We retain the labels $cal(I)$ and their closed essential supports $H_i$.
  Section 6 supplies the transition graphs $Gamma_x$ and the closed locally finite set $cal(L)$ of centers where
  those graphs contain a cycle. We now construct a simple label cycle and one compact connected exclusion set for
  each edge. The distance exclusions will hold for both endpoint labels.
  The connected-interface mechanism has a precedent in #cite(label("SokolovVoronov2025"), form: "prose")
  Propositions 1–2, where interfaces come from a regular map.
  Here the sets will be limits of inverse images under continuous approximations to the weak measurable coloring.

For a nonempty compact set $K subset bb(R)^2$, define its open straddling region by

#[#set math.equation(numbering: n => "(7.1)")
 $ Delta \( K \) = {z in bb(R)^2 : min_(q in K) \| z - q \| < 1 < max_(q in K) \| z - q \|} . $ <eq:source-24>]

The two distance extrema are continuous, indeed $1$-Lipschitz, as functions of $z$, so this region is open.
  Connectedness of $K$ implies that every point of $Delta \( K \)$ is at unit distance from a point of $K$.
  The proposition below gives one such region excluding both labels attached to each edge of a label cycle.

#thm([Proposition 7.1.])[
  (A cycle of common exclusion continua).  #emph[For the weak measurable five-coloring under consideration,
    there exist an integer $ell in { 3 \, 4 \, 5 }$, distinct labels $i_0 \, dots.h \, i_(ell - 1) in cal(I)$,
    a point $x in bb(R)^2$, and a radius $rho > 0$ with the following properties.
    For each edge $i_j i_(j + 1)$ of the simple label cycle, with indices modulo $ell$,
    there are a compact connected set $K_j subset overline(B \( x \, rho \))$, a direction $v_j in S$,
    and a sequence $q_(j \, k) in K_j \\ { x }$ such that]
  + #emph[$x in K_j$ and $K_j ∩ partial B \( x \, rho \) eq.not diameter$;]
  + #emph[$q_(j \, k) arrow.r x$ and $\( q_(j \, k) - x \) \/ \| q_(j \, k) - x \| arrow.r v_j$;]
  + #emph[both endpoint supports are excluded from the same open set:
$ H_(i_j) ∩ Delta \( K_j \) = H_(i_(j + 1)) ∩ Delta \( K_j \) = diameter . $

]
  #emph[The extracted cycle need not consist of edges of $Gamma_x$.]
] <prop:interface-cycle>

The cyclic transition centers determine which small disks remain unfilled in our approximation;
  the cycle in the proposition comes from a loop of the resulting continuous graph-valued map.
  We first construct that map by averaging the color indicators and removing disks whose total radii tend to zero.
  A planar cover obstruction forces a nontrivial loop around one remaining disk.
  Connected components of the inverse images of its edge midpoints then cross an annulus,
  and their limits give the sets $K_j$.

Figure 2 illustrates the straddling mechanism for one of these continua.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((3.312, 0), radius: 2.65, fill: rgb("#fafafa"), stroke: none)
  circle((0, 0), radius: 2.65, stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-1.537, 2.2), [#text(fill: rgb("#666666"))[#text(size: 9pt)[$partial B(x, rho )$]]], anchor: "south-east", padding: 0.1176cm)
  circle((3.312, 0), radius: 2.65, stroke: (paint: rgb("#595959"), thickness: 0.6pt, miter-limit: 10, dash: "densely-dotted"))
  content((4.717, -2.252), [#text(fill: rgb("#595959"))[#text(size: 9pt)[$\{y:|y-z|=1\}$]]], anchor: "north-west", padding: 0.1176cm)
  line((0, 0), (3.312, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((1.656, -0.1764), [#text(size: 9pt)[$|z-x|>1$]], anchor: "north", padding: 0.1176cm)
  line((1.722, 1.192), (3.312, 0), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  content((2.567, 0.6461), [#text(size: 9pt)[$|z-q|<1$]], anchor: "south-west", padding: 0.1176cm)
  bezier((0, 0), (0.2253, 0.371), (0.1192, 0.0265), (0.06625, 0.3445), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((0.2253, 0.371), (0.4505, 0.2253), (0.3578, 0.3975), (0.318, 0.1855), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((0.4505, 0.2253), (0.6227, 0.7817), (0.6492, 0.2782), (0.477, 0.742), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((0.6227, 0.7817), (0.795, 0.8275), (0.689, 0.848), (0.742, 0.795), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((0.795, 0.8275), (1.073, 1.259), (0.901, 0.901), (0.9275, 1.272), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((1.073, 1.259), (1.444, 1.06), (1.272, 1.245), (1.272, 1.02), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((1.444, 1.06), (1.722, 1.192), (1.563, 1.086), (1.643, 1.219), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((1.722, 1.192), (1.895, 1.563), (1.855, 1.139), (1.749, 1.524), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  bezier((1.895, 1.563), (2.03, 1.703), (1.961, 1.603), (1.987, 1.656), stroke: (paint: rgb("#00008c"), thickness: 1.45pt, cap: "round", miter-limit: 10))
  content((1.139, 1.458), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$K_j$]]], anchor: "south", padding: 0.1176cm)
  circle((0, 0), radius: 0.07234, fill: rgb("#000000"), stroke: none)
  content((-0.1411, 0), [$x$], anchor: "east")
  circle((3.312, 0), radius: 0.07234, fill: rgb("#000000"), stroke: none)
  content((3.454, 0), [$z$], anchor: "west")
  circle((1.722, 1.192), radius: 0.07234, fill: rgb("#000000"), stroke: none)
  content((1.623, 1.093), [$q$], anchor: "north-east")
  circle((0.795, 0.8275), radius: 0.07234, fill: rgb("#000000"), stroke: none)
  content((0.6952, 0.9272), [$p$], anchor: "south-east")
  circle((2.03, 1.703), radius: 0.07234, fill: rgb("#00008c"), stroke: none)
  content((1.722, -3.471), [#text(size: 9pt)[$z in Delta (K_j)$ and $z in.not H_(i_j) union H_(i_(j+1))$]])
})],
  caption: [Figure 2: The strict inequalities $\| z - q \| < 1 < \| z - x \|$, with $x \, q in K_j$, put $z$ in $Delta \( K_j \)$. Connectedness supplies a point $p in K_j$ with $\| z - p \| = 1$. Both endpoint essential supports are excluded from $Delta \( K_j \)$. The shape is schematic: the proof assumes neither an arc nor a smooth interface nor a tangent at $x$. ],
) <fig:exclusion-continuum>

=== 7.1 Disk averages and missing edges <disk-averages-and-missing-edges>

We begin with continuous probability coordinates. Their unit-distance inequality will yield color exclusions from
  the straddling regions of the limiting sets. Small overlaps for missing transition edges will control the disks
  removed from the approximation.

For $epsilon.alt > 0$, set

$ p_i^epsilon.alt \( q \) = frac(1, pi epsilon.alt^2) integral_(B \( 0 \, epsilon.alt \)) a_i \( q + v \) thin d v . $

These are continuous probability coordinates: $p_i^epsilon.alt gt.eq 0$ and $sum_i p_i^epsilon.alt =
  1$ everywhere. The symmetric-difference estimate for two disks gives $"Lip" \( p_i^epsilon.alt \) lt.eq
  C \/ epsilon.alt$, with an absolute constant $C$. Approximation by local averages and Lebesgue differentiation
  give $p_i^epsilon.alt arrow.r a_i$ in $L_(upright("loc"))^1$ and almost everywhere as $epsilon.alt arrow.b 0$.

#thm([Lemma 7.2.])[
  (Disk inequalities and support detection).  #emph[For every pair $q \, z in bb(R)^2$ with $\| q - z \| =
    1$ and every label $i$,
#[#set math.equation(numbering: n => "(7.2)")
 $ p_i^epsilon.alt \( q \) + p_i^epsilon.alt \( z \) lt.eq 1 . $ <eq:source-17>]

 If $q_n arrow.r q$, $epsilon.alt_n arrow.r 0$, and $liminf_n p_i^(epsilon.alt_n) \( q_n \) > 0$, then $q in H_i$.]
] <lem:transitions-disk-averages>

#proof[
  Translate $q$ and $z$ by the same vector uniformly distributed in $B \( 0 \, epsilon.alt \)$.
    Almost every such translation puts both points in the typical set.
    They cannot then both have color $i$; averaging proves (7.2).
    Thus this inequality has no exceptional unit pairs. For the last assertion,
    every neighborhood of $q$ eventually contains $B \( q_n \, epsilon.alt_n \)$,
    and the stated lower bound makes its intersection with $A_i$ have positive area. ◻
]

#thm([Lemma 7.3.])[
  (A missing edge has small overlap).  #emph[If $i j in.not Gamma_x$, there is a ball $B$ about $x$ such that,
    for every smaller ball $B'$ with $overline(B') subset B$,
#[#set math.equation(numbering: n => "(7.3)")
 $ integral_(B') p_i^epsilon.alt \( q \) p_j^epsilon.alt \( q \) thin d q = o \( epsilon.alt \) . $ <eq:source-18>]

 For any ball $B''$ with $overline(B'') subset B'$ and any fixed $alpha > 0$, the set
$ { q in B'' : p_i^epsilon.alt \( q \) > alpha \, quad p_j^epsilon.alt \( q \) > alpha } $

 can be covered by finitely many open disks whose total radii tend to zero as $epsilon.alt arrow.b 0$.
   Every point of the set lies in a disk interior.]
] <lem:transitions-missing-edge>

#proof[
  The negation of (6.1), and nonnegativity of $D_(i j)$, give a ball $B$ with $D_(i j) \( B \, h \) =
    o \( \| h \| \)$. More explicitly, for all sufficiently small $r > 0$ put
  $ omega \( r \) = sup_(0 < \| h \| lt.eq r) frac(D_(i j) \( B \, h \), \| h \|) \; wide omega \( r \) arrow.r 0 . $
  For independent uniform vectors $h_1 \, h_2 in B \( 0 \, epsilon.alt \)$,
    expand the product of the two disk averages and integrate over $q in B'$.
    When $epsilon.alt < "dist" \( overline(B') \, bb(R)^2 \\ B \)$, the change of root $r = q +
    h_1$ bounds the area where $c \( q + h_1 \) = i$ and $c \( q + h_2 \) = j$ by
  $ D_(i j) \( B \, h_2 - h_1 \) lt.eq 2 epsilon.alt omega \( 2 epsilon.alt \) . $
  For $h_1 = h_2$ the simultaneous event is empty. Fubini now gives (7.3), with a bound uniform over the two shifts.
  Take a square grid with side $ell = c_alpha epsilon.alt$,
    where $c_alpha > 0$ is fixed small enough that the Lipschitz oscillation of either probability on a square is
    at most $alpha \/ 2$. Select all squares touching the displayed violation set in $B''$.
    Their number $N_epsilon.alt$ is finite, and for small $epsilon.alt$ each lies in $B'$ and has both
    probabilities at least $alpha \/ 2$ throughout. Disjointness of their interiors and (7.3) imply
  $ N_epsilon.alt ell^2 alpha^2 / 4 = o \( epsilon.alt \) \, wide N_epsilon.alt epsilon.alt = o \( 1 \) . $
  Cover every selected closed square by the open disk with the same center and radius $ell$.
    These disks strictly contain the squares and have total radii $N_epsilon.alt ell = o \( 1 \)$. ◻
]

=== 7.2 Graph-valued maps outside small core disks <graph-valued-maps-outside-small-core-disks>

The preceding overlap bound allows us to remove all simultaneous threshold violations associated with missing
  edges. Fix $0 < alpha < 1 \/ 5$, and define

#[#set math.equation(numbering: n => "(7.4)")
 $ q_i^epsilon.alt \( z \) =
   frac(\( p_i^epsilon.alt \( z \) - alpha \)_(+), sum_(k in cal(I)) \( p_k^epsilon.alt \( z \) - alpha \)_(+)) \,
   wide i in cal(I) . $ <eq:source-22>]

The denominator is positive because the five probabilities sum to one.
  Thus $q^epsilon.alt$ is a continuous map into the simplex of probability vectors on $cal(I)$.
  Let $cal(G)$ be the one-skeleton of that simplex, realized as the complete graph on its five vertices.
  In particular, $q_i^epsilon.alt \( z \) > 0$ if and only if $p_i^epsilon.alt \( z \) > alpha$.

Choose a closed square $Q$ of side ten with $partial Q ∩ cal(L) = diameter$.
  Such a square is obtained by a small translation: local finiteness leaves only finitely many points to avoid
  near the boundary of all squares in that translation family.
  Choose a larger closed square $Q'$ containing $Q$ in its interior, and write $L_0 = cal(L) ∩ Q'$,
  a finite set by Theorem 31.

#thm([Lemma 7.4.])[
  (Small holes and tree fillings).  #emph[There are $epsilon.alt_n arrow.b
    0$ and finite families $cal(H)_n$ of open disks with pairwise disjoint closures such that their total radii
    tend to zero and the following hold for all sufficiently large $n$.]
  + #emph[For each $x in L_0$, precisely one disk of $cal(H)_n$ is designated the core disk $B_(n \, x)$ and
    contains $x$ in its interior. Different points give different core disks.
    If $x in Q$, then $overline(B_(n \, x)) subset "int" \( Q \)$; if $x in.not Q$,
    then $overline(B_(n \, x)) ∩ Q = diameter$.]
  + #emph[The map $q^(epsilon.alt_n)$ takes values in $cal(G)$ on $Q \\ union.big_(B in cal(H)_n) B$.]
  + #emph[There is a continuous map
#[#set math.equation(numbering: n => "(7.5)")
 $ g_n : Q \\ union.big_(x in L_0 ∩ Q) B_(n \, x) arrow.r cal(G) $ <eq:source-23>]

 equal to $q^(epsilon.alt_n)$ outside all the open disks of $cal(H)_n$.
   It is obtained by filling the non-core disks through trees, preserving their boundary values.]
] <lem:interfaces-hole-maps>

#proof[
  Fix a small $delta > 0$. Start with the original core disks $B \( x \, delta \)$, $x in L_0$, and put
  $ M_delta = Q' \\ union.big_(x in L_0) B \( x \, delta \) . $
  This is compact, and every $Gamma_z$, $z in M_delta$, is a forest, including any isolated vertices.
    For each nonedge of $Gamma_z$, Lemma 36 supplies a ball on which the corresponding simultaneous threshold
    violations admit finite open disk covers with total radii tending to zero as $epsilon.alt arrow.r 0$.
    There are finitely many nonedges, so choose one radius $s_z > 0$ working for all of them.
    More explicitly, choose it small enough to have the transition estimate on $B \( z \, 3 s_z \)$,
    the integral estimate on $B \( z \, 2 s_z \)$, and the disk covers for violations in $B \( z \, s_z \)$.
    The covers include the violation points in the interiors of their disks.
  Choose finitely many balls $B \( z \, s_z \)$ covering $M_delta$,
    and let $lambda_delta > 0$ be a Lebesgue number of this cover on $M_delta$.
    For each selected ball, mark all the disks covering violations for its forest’s nonedges.
    These additional disks form a finite family whose total radii $m_(delta \, epsilon.alt)$ tend to zero for this
    fixed $delta$. At a point of $M_delta$ outside all marked disks,
    the positive coordinates of (7.4) form a clique in the forest of every selected ball containing the point.
    They therefore number at most two, and a two-element set is a forest edge.
    This proves the required local graph-valued assertion.
  We next merge disks until their closures are pairwise disjoint.
    Whenever two current disks have intersecting closures, replace them by an open disk strictly containing both
    closures, with radius at most the sum of their radii plus a prescribed positive error.
    An enclosing disk with radius at most the sum exists by choosing its center on the line of centers;
    in the containment case the larger disk suffices. A slight enlargement makes containment strict.
    Each merge reduces the finite number of disks, so the sum of all enlargement errors can be made less than any
    specified $eta > 0$, using the initial number as a bound on the number of merges.
  A final disk is called core if its merger class contains an original core disk.
    Every final boundary avoids every original disk interior. The total final radii are at most
  $ \| L_0 \| delta + m_(delta \, epsilon.alt) + eta \, $
  and each final non-core radius is at most $m_(delta \, epsilon.alt) + eta$. Take $delta_n arrow.b 0$.
    After fixing $delta_n$, its finite cover, and its Lebesgue number,
    choose $epsilon.alt_n$ and the merger errors so that
  $ epsilon.alt_n < min { 1 \/ n \, epsilon.alt_(n - 1) \/ 2 } \, wide m_(delta_n \, epsilon.alt_n) +
    eta_n < min { 1 \/ n \, lambda_(delta_n) \/ 3 } \, $
  omitting the preceding-$epsilon.alt$ condition at $n = 1$. The total final radii now tend to zero.
  For large $n$, no final disk can contain two distinct points of $L_0$:
    its diameter is smaller than their minimum positive separation.
    Every original core disk belongs to some final disk, so this gives exactly one core disk for each point.
    Since a disk of radius $r$ containing $x$ lies in $B \( x \, 2 r \)$,
    the positive distances between the finitely many points of $L_0$ and $partial
    Q$ give the asserted positions of the core disks.
  Consider a final non-core disk whose closure meets $Q$. Its vanishing diameter puts its entire closed disk
    inside $Q'$ for large $n$. Moreover, its closure is disjoint from every final core closure,
    and these final core disks contain all the original core disks.
    It therefore lies outside all original core interiors, hence in $M_(delta_n)$.
    Its diameter is less than $lambda_(delta_n)$, so its entire closed disk lies in one selected forest ball.
    Its boundary avoids all original marked interiors. The original map $q^(epsilon.alt_n)$ thus maps that
    boundary into the selected forest, and its connected boundary image lies in one component tree,
    possibly a single vertex. A finite tree is contractible, so the boundary map extends continuously over the
    closed disk with values in that tree. If the disk crosses $partial Q$,
    make the extension on the whole disk and restrict it to $Q$.
  Outside all final open disks, every point of $Q$ belongs to $M_(delta_n)$ and avoids all original marked disks,
    so the original map is graph-valued there. Paste it to the finitely many tree extensions.
    Their closed disks have disjoint closures and agree with the original map on their boundaries,
    so finite pasting proves (7.5). Empty disk lists require no operation. ◻
]

=== 7.3 A nontrivial core boundary <a-nontrivial-core-boundary>

We will repeatedly use the following area estimate. For a closed disk $overline(B \( u \, r \))$ with $r < 1$,
  every point at distance one from some point of that disk belongs to

$ E \( u \, r \) = { z : 1 - r lt.eq \| z - u \| lt.eq 1 + r } . $

The triangle inequality proves this containment, and the annulus has area $4 pi r$. For the families in Lemma 37, write

#[#set math.equation(numbering: n => "(7.6)")
 $ E_n = union.big_(B \( u \, r \) in cal(H)_n) E \( u \, r \) \, wide \| E_n \| lt.eq
   4 pi sum_(B \( u \, r \) in cal(H)_n) r arrow.r 0 . $ <eq:interfaces-annulus-area>]

Here all radii are less than one for large $n$. If $z in.not E_n$,
  no exact unit-distance point from $z$ lies in any closed hole disk, regardless of how many disks there are.

#thm([Lemma 7.5.])[
  (A cover obstruction on a square).  #emph[A closed square of side ten has no relatively open cover of
    multiplicity at most two and mesh at most two, where mesh is the supremum of the Euclidean diameters of its
    members.]
] <lem:interfaces-cover>

#proof[
  Compactness gives a finite subcover $U_1 \, dots.h \, U_N$ with the same bounds. Choose $z_a in U_a$.
    There is a continuous partition of unity $phi.alt_a$ with $phi.alt_a \( z \) > 0$ only when $z in U_a$;
    explicitly, use $"dist" \( z \, Q \\ U_a \)$ and normalize their sum.
    None of the $U_a$ equals $Q$, since its diameter would exceed two, so these distance functions are well defined. Set
  $ F \( z \) = sum_(a = 1)^N phi.alt_a \( z \) z_a . $
  Convexity gives $F \( Q \) subset Q$. At most two weights are positive at any point,
    so the image is contained in the finite union of segments $\[ z_a \, z_b \]$ and singleton vertices. Also
  $ \| F \( z \) - z \| lt.eq sum_a phi.alt_a \( z \) \| z_a - z \| lt.eq 2 . $
  For any $y in Q$ with $"dist" \( y \, partial Q \) > 2$, the continuous map $z mapsto y + z -
    F \( z \)$ takes $Q$ into $Q$, since its image lies in the closed radius-two disk about $y$.
    The Brouwer fixed point theorem, in its planar form #cite(label("Hatcher2002")) Theorem 1.9,
    therefore supplies a fixed point, and at that point $F \( z \) = y$.
    Thus $F \( Q \)$ contains the nonempty open central region ${ y in Q : "dist" \( y \, partial Q \) > 2 }$,
    impossible for a finite union of segments. ◻
]

#thm([Lemma 7.6.])[
  (Non-null core loops).  #emph[For all sufficiently large $n$,
    some core disk $B_(n \, x)$ contained in $Q$ has a boundary loop whose image under $g_n$ is not null homotopic
    in $cal(G)$.]
] <lem:interfaces-core-loop>

#proof[
  Otherwise, along an infinite subsequence all the core boundary loops are null homotopic.
    Extend each such loop over its disk in $cal(G)$, and paste to obtain a continuous map $tilde(g)_n : Q arrow.r
    cal(G)$, still equal to $q^(epsilon.alt_n)$ outside all holes.
    For each $i in cal(I)$, take the components of the relatively open set
  $ U_(n \, i) = { z in Q : \( tilde(g)_n \( z \) \)_i > 0 } . $
  The square and its relatively open subsets are locally path connected;
    hence these components are open and path connected. They form a cover of $Q$ of multiplicity at most two,
    since every point of $cal(G)$ has at most two positive coordinates.
  We claim that the mesh of this component cover is at most $1 + o \( 1 \)$.
    If not, after restricting to a subsequence there are a fixed constant $c > 0$, a fixed label $i$,
    and paths in $U_(n \, i)$ joining points at distance greater than $1 + c$.
    Replace either endpoint lying in a hole by a boundary point on the path.
    The path must exit that disk because the other endpoint is distant,
    and the replacement changes the endpoint by at most the disk’s diameter.
    If both endpoints require replacement, their disks are distinct for large $n$.
    On every hole boundary the original map is preserved. Thus the replacement endpoints $a_n \, b_n$ satisfy
  $ p_i^(epsilon.alt_n) \( a_n \) > alpha \, wide p_i^(epsilon.alt_n) \( b_n \) > alpha $
  and remain at distance at least $1 + c - o \( 1 \)$. Pass to limits $a_n arrow.r a$, $b_n arrow.r b$ in $Q$,
    with $\| a - b \| > 1$. Lemma 35 gives $a in H_i$.
  Choose a sufficiently small fixed open plane ball $U$ about $a$.
    For all large $n$ and every $z in U$, the distances to $a_n$ and $b_n$ are strictly below and strictly above
    one, respectively. Continuity along the path supplies a point at exact distance one from $z$.
    If $z in.not E_n$, every such crossing point is outside all closed hole disks by (7.6).
    At this point $tilde(g)_n = q^(epsilon.alt_n)$ and its $i$th coordinate is positive,
    so $p_i^(epsilon.alt_n) > alpha$. The pointwise inequality (7.2) therefore gives $p_i^(epsilon.alt_n) \( z \)
    lt.eq 1 - alpha$.
  It follows that
  #[#set math.equation(numbering: n => "(7.7)")
   $ alpha \| A_i ∩ U \| lt.eq lr(bar.v.double p_i^(epsilon.alt_n) - a_i bar.v.double)_(L^1 \( U \)) +
     alpha \| E_n ∩ U \| arrow.r 0 . $ <eq:interfaces-mesh-measure>]
  The convergence uses local $L^1$ convergence of disk averages and (7.6).
    This contradicts $a in H_i$, which requires positive $A_i$-measure in $U$. The mesh claim follows.
    For large $n$ the mesh is therefore at most two, contradicting Lemma 38.
    This argument also rules out the possibility of having no core disks in $Q$. ◻
]

=== 7.4 Graph words and annular crossings <graph-words-and-annular-crossings>

We now have a graph-valued map with a non-null loop around a core disk.
  To turn that loop into connected crossing sets, we identify edge midpoints that every homotopic loop must meet.
  We first recall the reduced-path argument for graphs; compare #cite(label("Hatcher2002"), form: "prose") Section 1.A.

#thm([Lemma 7.7.])[
  (Midpoint detection by a reduced circuit).  #emph[Let $G$ be a finite connected simple graph.
    Every nontrivial free homotopy class of loops in $G$ has a nonempty cyclically reduced closed edge word $W$.
    Such a word contains a simple cycle. Moreover, if $m$ is the midpoint of any edge occurring in $W$,
    every loop freely homotopic to a nonzero power of $W$ meets $m$.]
] <lem:interfaces-graph-word>

#proof[
  An edge path is reduced when consecutive edges never reverse each other,
    and a reduced closed edge path is cyclically reduced when its last and first edges do not reverse each other
    either. Paths between vertices, up to homotopy fixing their endpoints,
    have unique reduced edge representatives. One way to see this is to construct the covering tree based at a
    vertex $v$: its vertices are reduced paths starting at $v$, and its edges append one edge and then reduce.
    Deleting the last edge gives the unique path toward the empty word, so this covering graph is a tree.
    The map recording the endpoint is a bijection on each incident-edge star and hence a covering map.
    Lifting a path to this tree and contracting it to the unique simple path between its lifted endpoints proves
    existence and uniqueness of the reduced representative. These contractions apply to arbitrary continuous
    paths: their compact images in the locally finite covering tree lie in finite subtrees.
  Move a loop’s basepoint to a vertex along a path, reduce its edge word,
    and successively trim inverse first and last edges. The result is cyclically reduced and is empty precisely
    when the loop is null homotopic. Moving the basepoint, or following the basepoint during a free homotopy,
    changes the based class by conjugation.
  We record how conjugation affects a nonempty cyclically reduced word.
    First reduce the conjugating path $P$ in $P W P^(- 1)$. At the last edge of $P$,
    cancellation against one end of $W$ shortens $P$ and moves one edge of $W$ to its other end.
    This only rotates $W$ cyclically. Cancellation at both ends of $W$ at once is impossible because $W$ is
    cyclically reduced. If there is no cancellation at either end,
    the conjugating path is simply removed when the whole closed word is cyclically trimmed.
    Induction on the length of $P$ shows that conjugation leaves the cyclically reduced circuit unchanged up to
    cyclic rotation.
  A nonzero power of $W$ is already cyclically reduced: concatenate copies of $W$ for a positive power,
    or copies of its reversed inverse for a negative power. Its cyclic reduction therefore uses every edge of $W$.
    On the other hand, $G \\ { m }$ deformation retracts onto the graph with the edge containing $m$ deleted:
    contract its two remaining half-open stubs to their endpoint vertices.
    A loop avoiding $m$ consequently has a reduced circuit using no such edge,
    and cannot be freely homotopic to a nonzero power of $W$.
  Finally, take a shortest nonempty subloop between repeated vertices of $W$. It has no repeated interior vertex.
    Its length is not one, since $G$ has no loop edges, and is not two,
    since that would be an immediate reversal in a simple graph. Thus it is a simple cycle. ◻
]

#thm([Lemma 7.8.])[
  (A connected midpoint preimage crosses the annulus).  #emph[Let $B$ be an open disk containing $x$,
    with $overline(B) subset B \( x \, rho \)$, and set $cal(A) = overline(B \( x \, rho \)) \\ B$.
    Suppose $g : cal(A) arrow.r G$ is continuous, where $G$ is a finite connected simple graph,
    and the image of the counterclockwise inner boundary has nonempty cyclically reduced word $W$.
    If $m$ is the midpoint of an edge occurring in $W$, then $g^(- 1) \( { m } \)$ has a compact connected
    component meeting both boundary circles of $cal(A)$.]
] <lem:interfaces-annular-crossing>

#proof[
  Every ray from $x$ meets $partial B$ once, at a positive radius $r \( theta \)$ depending continuously on the
    angle. Radial interpolation between $r \( theta \)$ and $rho$ identifies $cal(A)$ with a closed annulus.
    In particular, winding number about $x$ identifies its fundamental group with $bb(Z)$,
    with the counterclockwise inner boundary as generator.
  Put $Z = g^(- 1) \( { m } \)$. This is a compact metric space.
    Suppose no component of $Z$ meets both boundaries, and write $I = Z ∩ partial B$ and $O =
    Z ∩ partial B \( x \, rho \)$ for its compact inner and outer contact sets.
    We first obtain a disjoint compact partition $Z = Z_1 union.sq Z_2$ with $I subset Z_1$ and $O subset Z_2$.
  In any compact metric space, a point’s component is the intersection of all of its clopen neighborhoods.
    Indeed, this intersection contains the component. If it were disconnected,
    its two nonempty compact parts could be enclosed in disjoint open sets.
    A finite intersection of clopen neighborhoods already lies in their union,
    by compactness of the complement of that union. Intersecting this clopen set with the open set containing the
    original point gives a smaller clopen neighborhood omitting the other part, a contradiction.
    The intersection is therefore connected and equals the component.
  Thus, for each point of $I$ and each point of $O$, some clopen neighborhood of the first omits the second.
    Compactness of $O$ permits a finite intersection producing a clopen neighborhood of the first point disjoint
    from all of $O$. Compactness of $I$ then permits a finite union containing all of $I$ and still disjoint from
    $O$. Take this union as $Z_1$ and its complement in $Z$ as $Z_2$.
    If either $I$ or $O$ is empty, use $Z_1 = diameter$ or $Z_1 = Z$, respectively. This proves the partition assertion.
  The set
  $ C_1 = Z_1 union overline(B) $
  is compact, lies in the open outer disk, and is disjoint from $Z_2$.
    Choose a sufficiently fine translated square grid, with $x$ on no grid line,
    and take every closed grid cell meeting $C_1$. Their finite union $V$ lies in the open outer disk and avoids
    $Z_2$, by the positive compact separations. Also $C_1 subset "int" \( V \)$:
    at a point of $C_1$ on a grid edge or vertex, all adjacent cells are included.
    Consequently $partial V$ lies in $cal(A)$ and avoids $Z_1 union Z_2 = Z$.
  Orient each selected square boundary counterclockwise and cancel shared edges.
    The remaining edges lie on $partial V$ and form a balanced finite directed chain,
    so they decompose into closed polygonal loops. Their total winding about $x$ is one.
    Indeed, winding is additive before and after cancellation,
    and exactly one selected square contains $x$ in its interior;
    its winding is one and that of every other selected square is zero.
    At least one of the resulting loops has nonzero winding, say $d$.
    Its image under $g$ avoids $m$, but the annulus calculation makes that image freely homotopic to $W^d$.
    This contradicts Lemma 40. ◻
]

=== 7.5 Limiting continua and simultaneous color exclusions <limiting-continua-and-simultaneous-color-exclusions>

#proof[
  Use the maps of Lemma 37 and the non-null loops from Lemma 39.
    Since $L_0 ∩ Q$ is finite, pass to a subsequence with a fixed $x in L_0 ∩
    "int" \( Q \)$ whose core boundary loop is non-null at every index.
    Choose $rho > 0$ so small that $overline(B \( x \, rho \)) subset
    "int" \( Q \)$ and contains no other point of $L_0$. Decreasing $rho$ if necessary,
    the other core closed disks are disjoint from $overline(B \( x \, rho \))$ for large $n$,
    while $overline(B_(n \, x)) subset B \( x \, rho \)$. The map $g_n$ is therefore defined on the closed annulus
  $ cal(A)_n = overline(B \( x \, rho \)) \\ B_(n \, x) . $
  The inner disk contains $x$ strictly; its possibly eccentric position causes no difficulty for the radial
    annulus coordinates used in Lemma 41.
  Let $W_n$ be a nonempty cyclically reduced circuit representing the image of the counterclockwise inner
    boundary. By Lemma 40, it contains a simple cycle. There are only finitely many simple cycles in the complete
    graph on five vertices. Pass to a subsequence with one chosen cycle, of length $ell in { 3 \, 4 \, 5 }$,
    and label its vertices $i_0 \, dots.h \, i_(ell - 1)$ in cyclic order.
    For each of its edge midpoints $m_j$, Lemma 41 gives a compact connected component
  $ K_(n \, j) subset g_n^(- 1) \( { m_j } \) ∩ cal(A)_n $
  meeting both annulus boundaries.
  Take Hausdorff limits along a common further subsequence for the finitely many indices $j$:
  $ K_(n \, j) arrow.r K_j subset overline(B \( x \, rho \)) . $
  The nonempty compact subsets of a compact metric space are compact in the Hausdorff metric.
    For completeness, finite nets give total boundedness of this hyperspace,
    and for a Hausdorff-Cauchy sequence the set of limits of convergent point selections is its nonempty compact
    Hausdorff limit, proving completeness. Connectedness also passes to the limit:
    a disconnection of $K_j$ into two nonempty compact parts gives disjoint separated neighborhoods containing
    every sufficiently close $K_(n \, j)$, with each neighborhood met, contradicting connectedness of $K_(n \, j)$.
  Each $K_(n \, j)$ meets $partial B_(n \, x)$. These contact points tend to $x$,
    because the disk contains $x$ and its diameter tends to zero. Hence $x in K_j$.
    Outer-boundary contact and compactness likewise give $K_j ∩ partial B \( x \, rho \) eq.not diameter$.
    In particular each $K_j$ is nontrivial.
  We prove the support exclusion for either endpoint $i in { i_j \, i_(j + 1) }$.
    At a point of $K_(n \, j)$ outside all holes, $g_n = q^(epsilon.alt_n)$ has value $m_j$,
    whose two endpoint coordinates are $1 \/ 2$. Formula (7.4) therefore gives $p_i^(epsilon.alt_n) > alpha$ there.
  Fix any closed ball $U$ of positive radius contained in $Delta \( K_j \)$.
    The strict inequalities defining the straddling region hold with a positive uniform margin on $U$.
    For every $z$, either distance extremum changes by at most $d_(upright(H)) \( K_(n \, j) \, K_j \)$ when $K_j$
    is replaced by $K_(n \, j)$. Thus, for all sufficiently large $n$,
    the distances from every $z in U$ to points of $K_(n \, j)$ straddle one.
    The continuous image of the connected set $K_(n \, j)$ under $q mapsto \| z - q \|$ is an interval,
    so some point of $K_(n \, j)$ is at exact distance one from $z$.
  For $z in U \\ E_n$, that point is outside every closed hole disk.
    The preceding endpoint probability bound and (7.2) give $p_i^(epsilon.alt_n) \( z \) lt.eq 1 - alpha$.
    Exactly as in (7.7),
  $ alpha \| A_i ∩ U \| lt.eq lr(bar.v.double p_i^(epsilon.alt_n) - a_i bar.v.double)_(L^1 \( U \)) +
    alpha \| E_n ∩ U \| arrow.r 0 . $
  Thus $A_i$ has zero measure in $U$. Every point of the open set $Delta \( K_j \)$ lies in the interior of such a
    ball, and consequently has a neighborhood of zero $A_i$-measure.
    By the definition of $H_i$, this proves $H_i ∩ Delta \( K_j \) = diameter$ for both endpoint labels.
  Finally, connectedness and the two contact conditions imply
  $ { \| q - x \| : q in K_j } = \[ 0 \, rho \] . $
  Choose points in $K_j$ at radii $rho \/ k$, $k gt.eq 2$, and pass to a subsequence of their unit directions
    converging to some $v_j in S$. Relabel these points as $q_(j \, k)$.
    They supply the required sequences and complete the proof. ◻
]

== 8 Angular obstructions and the final contradiction <sec:angular>

We now show that none of the three cycle lengths supplied by Proposition 34 is possible.
  Fix its common center $x$, cyclically index the cycle labels by $j$, and let edge $j$ join labels $j$ and $j +
  1$. Write $K_j$ for its continuum and $v_j$ for its limiting unit direction. Thus there are points

$ q_(j \, n) = x + r_(j \, n) w_(j \, n) in K_j \, wide r_(j \, n) > 0 \, quad r_(j \, n) arrow.r 0 \, quad
  w_(j \, n) in S \, quad w_(j \, n) arrow.r v_j . $

The rays used below record only these selected limiting directions $v_j$;
  no straight ray segment is assumed to lie in $K_j$. All palettes in this section are at this fixed center.
  As before, $R$ rotates by $kappa = pi \/ 3$, and $J$ by $pi \/ 2$.

=== 8.1 Restrictions on the two sides of the unit circle <restrictions-on-the-two-sides-of-the-unit-circle>

The one-sided strips below are a counterpart of the complementary-color strips in
  #cite(label("SokolovVoronov2025"), form: "prose") Proposition 9.
  Related circle and complementary-arc arguments also occur in #cite(label("Voronov2025Interval"), form: "prose")
  Sections 3–5, for a positive interval of forbidden distances.
  We use only the single forbidden distance one; the input is the exclusion continua just extracted.

Let $cal(B) subset S$ be the finite, antipodally symmetric set of directions perpendicular to at least one $v_j$.
  At $e in.not cal(B)$, give edge $j$ sign $+$ or $-$ according as $e dot.op v_j$ is positive or negative.
  Let $O \( e \)$ be the set of labels remaining after the endpoints of every positive edge are removed,
  and let $I \( e \)$ be the set remaining after the endpoints of every negative edge are removed.
  Labels outside the cycle belong to both sets.

#thm([Lemma 8.1.])[
  (One-sided strip restrictions).  #emph[Both $O \( e \)$ and $I \( e \)$ are nonempty for every $e in.not
    cal(B)$. On an angular neighborhood of $e$, an open strip just outside radius one uses only $O \( e \)$,
    and an open strip just inside radius one uses only $I \( e \)$, in both cases up to plane-null sets. Moreover,
#[#set math.equation(numbering: n => "(8.1)")
 $ P_x \( e \) ∩ O \( e \) eq.not diameter \, wide P_x \( e \) ∩ I \( e \) eq.not diameter quad
   upright("for almost every ") e in S \\ cal(B) . $ <eq:source-25>]

]
] <lem:angular-strips>

#proof[
  For a positive edge sign, the identity
  $ \| x + e - q_(j \, n) \|^2 = 1 + r_(j \, n)^2 - 2 r_(j \, n) \( e dot.op w_(j \, n) \) $
  is strictly less than one for some sufficiently large fixed $n$.
    By continuity, the strict inequality holds when $e$ varies in a small angular neighborhood and its radius
    increases slightly above one. Such points have distance greater than one from $x in
    K_j$ and less than one from $q_(j \, n) in K_j$; they lie in $Delta \( K_j \)$.
    Proposition 34 excludes both endpoint essential supports there.
    If the sign is negative, the displayed distance is greater than one for large $n$,
    and the same argument at radii slightly below one gives the inner strip.
    There are finitely many edges, so the angular neighborhoods and positive radial widths can be intersected.
    An empty allowed set would exclude every color from a nonempty open strip, contrary to the measurable partition.
  Cover $S \\ cal(B)$ by countably many smaller arcs on each of which all signs are constant and both strip
    restrictions hold with positive widths. For each such arc,
    polar-coordinate Fubini gives the relevant restriction almost everywhere angularly for almost every radius in
    its permitted interval. Impose no condition from that arc outside its permitted interval;
    its failures then exclude only a null set from the whole radial half-line.
    Intersect these countably many full-measure radial conditions with the full-measure condition of typical
    sampling at center $x$. Choose radii from this intersection tending to one from above.
    For each fixed arc the outer restriction eventually holds along the entire sequence.
    A weak-\* subsequential trace in $cal(W)_x$ has zero coordinates for the excluded labels on that arc.
    Its coordinates sum to one, and its positive coordinates belong to $P_x$ almost everywhere,
    so it supplies an outer allowed palette member. Countably many arcs suffice.
    A separate sequence tending to one from below proves the inner assertion.
    The two sides need not use the same trace. ◻
]

=== 8.2 Exclusion of a five-cycle <exclusion-of-a-five-cycle>

#thm([Proposition 8.2.])[
  #emph[The extracted interface cycle cannot have length five.]
] <prop:angular-five>

#proof[
  Index its five labels modulo five. A label belongs to $I \( e \)$ exactly when its two incident signs are
    positive, and to $O \( e \)$ exactly when both are negative.
    Their nonemptiness requires a pair of consecutive signs of each kind.
    If there were two or more runs of each kind, the two required runs of length at least two and the other two
    nonempty runs would occupy at least six positions. Thus the five signs consist of one positive run and one
    negative run, of lengths two and three in some order.
  The allowed sets are the internal vertices of these runs, of sizes one and two. They are disjoint.
    The palette size bound (5.12) and (8.1) imply that almost every palette is a pair,
    containing one vertex from each allowed set. Put $D_i = { i \, i + 2 }$.
    After a cyclic relabeling, the length-two run occupies edges $0 \, 1$, with middle vertex $1$,
    and the length-three run occupies edges $2 \, 3 \, 4$, with internal vertices $3 \, 4$.
    The two possible palettes are therefore $D_1 = { 1 \, 3 }$ and $D_4 = { 4 \, 1 }$,
    whose indices differ by two modulo five. Reversing every sign interchanges the two allowed sets and preserves
    these options. Consequently the palette options at antipodal directions are identical.
  Choose a direction on a full six-position $R$-orbit for which all the preceding almost-everywhere assertions and
    (5.7) hold. Write $p_j in bb(Z) \/ 5 bb(Z)$ for the index of its palette $D_(p_j)$ at $R^j e$.
    Two diagonals $D_a \, D_b$ are disjoint exactly when $b - a = plus.minus 1$ modulo five.
    Thus successive indices make steps $epsilon_j in { 1 \, - 1 }$,
    including the closing step from position five to position zero.
    For antipodal positions $j \, j + 3$, the common two-element option set allows index difference only $0$ or
    $plus.minus 2$. But the possible sums of three steps are $- 3 \, - 1 \, 1 \, 3$; none is zero modulo five,
    and a sum is $plus.minus 2$ modulo five only if all three steps have the same sign.
    Every consecutive triple of steps must therefore be constant.
    Overlapping triples force all six signs to agree, whereas six equal steps do not close modulo five.
    This is the desired contradiction. ◻
]

=== 8.3 Four-cycle words and projective ray geometry <four-cycle-words-and-projective-ray-geometry>

Suppose next that the cycle labels are $0 \, 1 \, 2 \, 3$, with outsider $X$, and put $U = { 0 \, 2 }$, $V =
  { 1 \, 3 }$. If $X in.not P_x \( e \)$, the two requirements in (8.1) force a consecutive pair of positive signs
  and a consecutive pair of negative signs. Hence the four signs are a cyclic run of two of each sign,
  which we call a #emph[split]. The two allowed sets, after removing $X$,
  are the opposite middle vertices of the runs. They determine a diagonal $d \( e \) in { U \, V }$,
  and $d \( - e \) = d \( e \)$.

Define the effective state $p \( e \)$ to be $X$ whenever $X in P_x \( e \)$,
  and otherwise to be the forced diagonal $d \( e \)$. The group represented by this state is contained in the
  palette: it is the singleton ${ X }$ in the first case and the entire diagonal in the second. Consequently,

#[#set math.equation(numbering: n => "(8.2)")
 $ p \( e \) eq.not p \( R e \) \, wide p \( e \) = p \( - e \) med
   upright("if both states are different from ") X \, quad upright("almost everywhere") . $ <eq:source-26>]

If a diagonal occurs only on a null set, the remaining singleton-versus-pair state system contradicts Lemma 30;
  a single remaining state already contradicts the first assertion in (8.2).
  We may therefore suppose that both diagonal states have positive angular measure.

For a nonparallel pair of density-one directions of the $U$ and $V$ state sets,
  the density conclusion of Lemma 22 excludes all four cycle labels at their sum with $x$.
  That sum has density one of $X$. Lemma 29 now applies to these three represented groups.
  If $F_U \, F_V$ denote the compact angular essential supports of the diagonal state sets, then

$ F_D ∩ R F_D = diameter wide \( D = U \, V \) . $

The same holds for $R^(- 1)$. Compactness provides a common positive angular separation margin.

Choose a dense conull set $G$ of angular parameters, invariant under addition of $kappa$,
  on which all six orbit positions avoid $cal(B)$, satisfy the state rules,
  and belong to $F_U$ or $F_V$ whenever the respective state occurs. Define

$ w \( t \)_j = p \( e^(i \( t + j kappa \)) \) \, wide j in bb(Z) \/ 6 bb(Z) \, quad t in G . $

There exists $eta > 0$ such that whenever $t \, t' in G$ have circular angular distance less than $eta$,
  a diagonal at any position of $w \( t \)$ cannot equal a diagonal at an adjacent position of $w \( t' \)$.
  Indeed, such equality would give points of the same compact essential support at angular distance less than the
  margin from an $R$- or $R^(- 1)$-pair. We refer to this as the cross-word restriction.

#thm([Lemma 8.3.])[
  (Six-position word alternatives).  #emph[Every word $w \( t \)$ contains $X$,
    and all its $X$ positions have the same parity. Every direction outside $cal(B)$ is split.]
] <lem:angular-words>

#proof[
  A word without $X$ alternates $U \, V$ by adjacent inequality, contradicting the antipodal equality in (8.2).
    Suppose that $X$ occurs on both parities. Any pair of its opposite-parity positions must be antipodal,
    since otherwise they are adjacent on the six-cycle. There are exactly two such occurrences:
    fixing one on each parity prevents any additional occurrence on either parity.
    Cyclically shift them to positions zero and three. Positions one and two are distinct non-$X$ states,
    and their antipodes four and five have the same respective values.
    Thus the word is a three-periodic permutation of $X \, U \, V$.
  Such a word is isolated under the cross-word restriction.
    In any compatible nearby word, each of its positions zero and three has neighbors $U \,
    V$ in the original word; it must therefore be $X$. The remaining four positions are non-$X$ by their own
    adjacent inequality. If the original positions one and two are $U \, V$,
    the cross-word restrictions against position two and position one, respectively,
    force the new positions one and two to be $U \, V$; the other block is forced in the same way.
    Hence the new word is identical.
  Any two points of a dense subset of the circle can be joined by a finite chain within that subset whose steps
    have angular distance less than $eta$: subdivide a connecting arc into steps smaller than $eta \/
    3$ and approximate its intermediate vertices by points of the dense set.
    Isolation would therefore propagate this word throughout $G$.
    But $w \( t + kappa \)_j = w \( t \)_(j + 1)$, and a three-periodic permutation word is not equal to its
    one-position shift. Since $G$ is shift invariant, this is impossible.
  It follows that the nonempty set of $X$ positions has a unique parity, denoted $h \( t \) in bb(Z) \/ 2 bb(Z)$.
    The three positions of the other parity are non-$X$, hence split.
    They contain one representative from each antipodal pair of positions.
    Since splitting is antipodally invariant, all six positions are split.
    In particular almost every direction is split. Signs are locally constant outside the finite set $cal(B)$.
    A nonsplit direction there would have a nonsplit open neighborhood of positive measure, which is impossible. ◻
]

#thm([Lemma 8.4.])[
  (Geometry of four split rays).  #emph[Under the conclusions of Lemma 44,
    the four rays consist of two distinct antipodal pairs. Opposite directions occupy opposite edge positions.
    On the projective angular circle of circumference $pi$, the forced diagonal $d$ equals $U$ on one open arc and
    $V$ on its complementary open arc. One of these arcs has length at most $pi \/ 2$.]
] <lem:angular-four-rays>

#proof[
  Every generic open semicircle ${ v : e dot.op v > 0 }$ selects exactly two rays, counted with multiplicity,
    and the selected edge positions are adjacent. At a boundary perpendicular to one unoriented ray line,
    cross the boundary without crossing any other such boundary.
    The selected multiplicity on that line changes from the number of its rays in one direction to the number in
    the opposite direction; all other selections stay fixed. Equality of the total count before and after shows
    that these two multiplicities coincide. Thus all rays are antipodally paired.
  If only one unoriented line occurs, it has two rays in each direction.
    The selected edge positions are a fixed adjacent pair or its complement.
    These two split patterns give the same diagonal. The other diagonal could not occur on a set of positive
    measure, contrary to our assumption. There are therefore two distinct lines,
    with one ray in each of their two directions.
  A specified ray on one line can be positive simultaneously with either ray on the other line:
    the corresponding two nonopposite unit directions fit in an open semicircle.
    Its edge position is consequently adjacent to both positions from the other line.
    In a four-cycle the remaining position is its opposite, so its antipodal ray occupies the opposite edge
    position. This applies to both lines.
  Modulo antipodes, the two perpendicular boundaries divide the angular circle into two open arcs.
    The signs, up to global reversal, are constant on each arc.
    Crossing a boundary replaces one selected edge by its opposite while keeping the selected edge from the other
    line. The two middle vertices of the resulting split are the other diagonal.
    Thus the forced diagonal takes the two different values on the two arcs.
    Their lengths sum to $pi$, which proves the last assertion. ◻
]

#thm([Proposition 8.5.])[
  #emph[The extracted interface cycle cannot have length four.]
] <prop:angular-four>

#proof[
  Suppose $t \, t' in G$ are less than $eta$ apart and $h \( t \) eq.not h \( t' \)$.
    Select the three positions opposite to the $X$ parity in $w \( t \)$,
    and the other three positions opposite to the $X$ parity in $w \( t' \)$.
    All selected states are diagonals; around the six positions they alternate between the two words.
    Cross-word adjacent states differ. Since only $U \, V$ are available,
    all three selected entries of the first word have one diagonal value,
    and all three of the second have the other value.
  For either word the three selected directions, projected modulo antipodes, are spaced equally by $kappa$.
    Each is a non-$X$ direction, so the forced diagonal there is its selected value.
    Both of the open diagonal arcs in Lemma 45 would therefore contain three equally spaced projective positions.
    An open arc containing such three positions has length greater than $2 pi \/ 3$:
    its closed complementary arc avoids the three points, so lies strictly inside one of the three gaps and has
    length less than $pi \/ 3$. This contradicts the diagonal arc of length at most $pi \/ 2$.
  Thus $h$ agrees at all sufficiently close points of $G$. The dense-set chain argument from Lemma 44 makes it
    constant on $G$. Yet shifting by $kappa$ shifts every word by one position and reverses this parity.
    The shift invariance of $G$ gives a contradiction. ◻
]

=== 8.4 Triangle interfaces force alternating sectors <triangle-interfaces-force-alternating-sectors>

It remains to consider a triangle cycle. Call its labels the #emph[triangle labels], and write $X \,
  Y$ for the outsiders. At every $e in.not cal(B)$, two of the three edge signs agree.
  Those two edges cover all three triangle labels. Lemma 42 therefore provides an open strip on an angular
  neighborhood of $e$, approaching radius one from one side, which uses only $X \, Y$ almost everywhere.
  Equation (8.1) gives an outsider in $P_x \( e \)$ almost everywhere.
  There cannot be two outsiders in such a palette, since (5.7) would leave no outsider at $R e$.
  We obtain a measurable binary state

$ s \( e \) in { X \, Y } \, wide s \( R e \) eq.not s \( e \) quad upright("almost everywhere") . $

The use of two complementary colors near a unit circle has a predecessor in Townsend’s annulus argument
  #cite(label("Townsend2005")) Theorems 1 and 4; here the restrictions hold almost everywhere and need not form an
  annulus. The next lemma extracts local constancy directly from the open strips.

#thm([Lemma 8.6.])[
  (Local binary rigidity).  #emph[If $e_0 \, R e_0 in.not cal(B)$,
    then $s$ is almost everywhere constant on an angular neighborhood of $e_0$.]
] <lem:angular-binary-local>

#proof[
  Let $cal(U) \, cal(V)$ be the open strips restricted to $X \, Y$ near $e_0 \, R e_0$, respectively.
    Each approaches radius one from its prescribed side, and these sides may differ. Put $z_0 = x + e_0$.
    There are two nonparallel unit directions $v'_1 \, v'_2$ such that $z_0 + v'_j in cal(V)$.
    To verify this, rotate so $e_0 = 1$ and consider
  $ F \( r \, theta \) = \| r e^(i theta) - 1 \|^2 - 1 = r^2 - 2 r cos theta . $
  At $\( 1 \, pi \/ 3 \)$, $F = 0$ and $partial_theta F = sqrt(3) eq.not 0$.
    The implicit function theorem permits $r$ to move onto either desired radial side while $theta$ stays in the
    angular arc of $cal(V)$. This gives a point strictly inside $cal(V)$ at unit distance from $z_0$.
    Openness then gives an open set of such unit directions, containing two nonparallel choices.
  Choose a smaller connected polar product strip $cal(U)' subset cal(U)$,
    still approaching radius one on an angular neighborhood of $e_0$, close enough to $z_0$ that $q + v'_1 \, q +
    v'_2 in cal(V)$ for every $q in cal(U)'$. We claim that $c$ is almost everywhere constant on $cal(U)'$.
  Fix a point of $cal(U)'$. On a sufficiently small ball around it,
    all starting points $q$ and sufficiently small shifts $h$ admit the following construction inside $cal(U)$ and
    $cal(V)$. Since $J v'_1 \, J v'_2$ form a basis, write $h = t_1 J v'_1 + t_2 J v'_2$,
    with coefficients linear in $h$. Move first by $t_1 J v'_1$ and then by $t_2 J v'_2$.
    For either move, starting at $q'$ and using $t = t_j$, $v' = v'_j$,
    its two endpoints in $cal(U)$ have the common unit neighbor
  #[#set math.equation(numbering: n => "(8.3)")
   $ q' + t / 2 J v' + sqrt(1 - t^2 \/ 4) thin v' in cal(V) . $ <eq:angular-even-path>]
  The two distances are one because $v'$ and $J v'$ are orthogonal unit vectors.
    Smallness keeps $\| t \| < 2$ and every constructed point in the stated open set.
    The combined path has four unit edges, with repetitions allowed.
  Fix such an $h$. Every vertex of the path is a translation of $q$,
    so for almost every starting point all five vertices are typical and have colors in ${ X \, Y }$.
    Typical-point properness makes the colors alternate along the path.
    Consequently $c \( q \) = c \( q + h \)$ for almost every $q$ in the small ball,
    for each fixed permissible $h$. All path maps are jointly measurable in $\( q \, h \)$:
    the coefficients are linear and the square-root terms continuous.
    Fubini gives this equality for almost every $\( q \, h \)$.
    In a still smaller ball, every ordered pair $\( q \, q' \)$ has $q' - q$ within the permissible shift range;
    the invertible change $\( q \, h \) mapsto \( q \, q + h \)$ shows that almost every pair in that ball has
    equal colors. Choosing one typical first point by Fubini proves local essential constancy of $c$.
  The sets of points of $cal(U)'$ with local essential color $X$, or local essential color $Y$,
    are disjoint open sets covering $cal(U)'$; they are disjoint because overlapping open neighborhoods have
    positive area. Connectedness forces just one of these sets to be nonempty.
    A countable subcover of monochromatic neighborhoods then shows that $cal(U)'$ uses one color almost everywhere.
  Finally choose typical radial samplings at $x$ tending to one from the side of $cal(U)'$.
    Polar Fubini ensures that the samples equal this color almost everywhere on its angular arc.
    A weak-\* trace puts that outsider in $P_x$ almost everywhere on the arc.
    It is the unique outsider there, so $s$ is essentially constant near $e_0$, as asserted. ◻
]

#thm([Lemma 8.7.])[
  (The boundary is one orbit).  #emph[The essential boundary of $s$ consists of exactly one six-position
    $R$-orbit. Its complementary sectors have angle $pi \/ 3$, with alternating essential values $X \, Y$.]
] <lem:angular-boundary>

#proof[
  Let $E_s$ be the set of directions at which $s$ is not almost everywhere constant on any open neighborhood.
    Its complement is open, so $E_s$ is closed. If it were empty,
    local essential constancy and connectedness of the circle, followed by a countable subcover,
    would make $s$ globally constant almost everywhere. The flip under $R$ excludes this.
    That same almost-everywhere flip transports local essential constancy in both directions, so $E_s$ is $R$-invariant.
  Consider any six-position orbit contained in $E_s$. By Lemma 47,
    every consecutive pair in it has at least one vertex in $cal(B)$.
    Because $cal(B)$ is antipodally symmetric, project the orbit modulo antipodes.
    Its three positions form a triangle, and every edge has an endpoint among the projective classes of $cal(B)$.
    At least two such classes are needed. There are at most three projective classes in $cal(B)$,
    one for each interface ray. Distinct $R$-orbits have disjoint projective positions:
    a shared class means a shared direction or its antipode, and the antipode is already the third rotation in the
    orbit. Thus two distinct boundary orbits would require at least four projective classes in $cal(B)$.
    There can be at most one orbit, and nonemptiness supplies exactly one.
  On each of the six complementary open sectors, local essential constancy and connectedness give one essential
    value. Rotation maps each sector to the next and flips that value, proving the assertion. ◻
]

=== 8.5 An open three-label region and the triangle contradiction <an-open-three-label-region-and-the-triangle-contradiction>

Rotate coordinates about $x$ so that the sector boundaries of Lemma 48 have angles that are multiples of $pi \/
  3$. The outsider state is then determined by the sign of $sin \( 3 theta \)$,
  in one of the two possible orders of $X \, Y$.

#thm([Lemma 8.8.])[
  (Polynomial three-label region).  #emph[Put $z = xi + i upsilon$, $l = xi^2 + upsilon^2$. If $0 < l < 4$ and
#[#set math.equation(numbering: n => "(8.4)")
 $ P := upsilon^2 \( 3 xi^2 - upsilon^2 \)^2 < P' := l^3 \( 1 - l \/ 4 \) \( l - 1 \)^2 \, $ <eq:source-27>]

 then a neighborhood of $x + z$ uses only the three triangle labels up to a plane-null set.]
] <lem:angular-region>

#proof[
  Write $z = r e^(i phi.alt)$, with $0 < r < 2$, and let $delta = arccos \( r \/ 2 \) in \( 0 \, pi \/ 2 \)$.
    The unit directions with angles $phi.alt - delta$ and $phi.alt + delta$ sum to $z$, and they are nonparallel.
    Triple-angle identities give
  $ sin^2 \( 3 phi.alt \) = frac(upsilon^2 \( 3 xi^2 - upsilon^2 \)^2, l^3) \, wide sin \( 3 delta \) =
    sin delta thin \( 4 cos^2 delta - 1 \) = sqrt(1 - l \/ 4) thin \( l - 1 \) . $
  Also,
  $ sin #scale(x: 120%, y: 120%)[\(] 3 \( phi.alt - delta \) #scale(x: 120%, y: 120%)[\)] sin
    #scale(x: 120%, y: 120%)[\(] 3 \( phi.alt + delta \) #scale(x: 120%, y: 120%)[\)] = sin^2 \( 3 phi.alt \) -
    sin^2 \( 3 delta \) . $
  Equation (8.4) makes this product negative. Both endpoints therefore lie strictly inside sectors,
    with opposite outsider values. Take open arc neighborhoods of the endpoints staying in their respective
    sectors. Their palettes contain the respective outsiders almost everywhere.
    Equation (5.2) excludes both outsiders at almost every sum of the two directions.
    The sum map is a local diffeomorphism at this nonparallel pair, with Jacobian $sin \( 2 delta \) eq.not 0$.
    On a smaller coordinate neighborhood its image is open and contains $z$,
    and change of variables transports the product-null exceptions to a spatial null set.
    Translating by $x$ gives the claim. ◻
]

The following coordinates realize the seven-vertex obstruction of #cite(label("MoserMoser1961"), form: "prose"),
  a unit-distance graph that cannot be colored with three labels:

#[#set math.equation(numbering: n => "(8.5)")
 $ cal(G) = { 0 \, A \, B \, T \, u A \, u B \, u T } \, wide A = frac(sqrt(3) + i, 2) \, quad B =
   frac(sqrt(3) - i, 2) \, quad T = sqrt(3) \, quad u = frac(5 + i sqrt(11), 6) . $ <eq:angular-seven-vectors>]

Indeed, $0 \, A \, B$ and $T \, A \, B$ are unit equilateral triangles sharing $A B$.
  In any proper three-coloring, the third vertices $0 \, T$ have the same color.
  Since $\| u \|^2 = \( 25 + 11 \) \/ 36 = 1$, their rotated copies similarly force $0 \,
  u T$ to have the same color. But

$ \| T - u T \|^2 = 3 \| 1 - u \|^2 = 3 frac(1 + 11, 36) = 1 \, $

which is incompatible with those two forced equalities.

We place this graph using

#[#set math.equation(numbering: n => "(8.6)")
 $ z_g = frac(35 + 12 i, 37) (g + frac(- 290 + 149 i, 250)) \, wide g in cal(G) . $ <eq:angular-placement>]

The multiplier has norm one because $35^2 + 12^2 = 37^2$,
  so this is a rotation followed by a translation in the sector coordinates.
  Figure 3 shows the placed graph, with all seven vertices in the three-label region,
  and its two forced equal-color pairs.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0.033, 0.01884), (0.06619, 0.03734), (0.09957, 0.05551), (0.1331, 0.07335), (0.1669, 0.09086), (0.2008, 0.108), (0.2349, 0.1249), (0.2691, 0.1413), (0.3036, 0.1575), (0.3382, 0.1733), (0.3729, 0.1888), (0.4079, 0.2039), (0.443, 0.2187), (0.4782, 0.2331), (0.5136, 0.2472), (0.5492, 0.2609), (0.5849, 0.2743), (0.6207, 0.2873), (0.6567, 0.3), (0.6929, 0.3123), (0.7292, 0.3242), (0.7656, 0.3358), (0.8021, 0.3471), (0.8388, 0.3579), (0.8756, 0.3684), (0.9126, 0.3786), (0.9497, 0.3884), (0.9869, 0.3978), (1.024, 0.4068), (1.062, 0.4155), (1.099, 0.4238), (1.137, 0.4317), (1.175, 0.4392), (1.212, 0.4464), (1.25, 0.4532), (1.288, 0.4596), (1.327, 0.4656), (1.365, 0.4712), (1.403, 0.4765), (1.442, 0.4814), (1.48, 0.4859), (1.519, 0.4899), (1.558, 0.4937), (1.596, 0.497), (1.635, 0.4999), (1.674, 0.5024), (1.713, 0.5045), (1.752, 0.5062), (1.791, 0.5076), (1.831, 0.5085), (1.87, 0.509), (1.909, 0.5091), (1.949, 0.5088), (1.988, 0.5081), (2.028, 0.507), (2.067, 0.5054), (2.107, 0.5035), (2.146, 0.5011), (2.186, 0.4983), (2.226, 0.4951), (2.265, 0.4915), (2.305, 0.4875), (2.345, 0.483), (2.385, 0.4781), (2.424, 0.4728), (2.464, 0.467), (2.504, 0.4608), (2.544, 0.4542), (2.584, 0.4471), (2.623, 0.4396), (2.663, 0.4317), (2.703, 0.4233), (2.743, 0.4144), (2.783, 0.4052), (2.822, 0.3954), (2.862, 0.3853), (2.902, 0.3746), (2.942, 0.3636), (2.981, 0.352), (3.021, 0.34), (3.061, 0.3276), (3.1, 0.3146), (3.14, 0.3012), (3.179, 0.2874), (3.218, 0.2731), (3.258, 0.2582), (3.297, 0.243), (3.336, 0.2272), (3.375, 0.211), (3.414, 0.1943), (3.453, 0.1771), (3.492, 0.1594), (3.531, 0.1412), (3.57, 0.1225), (3.609, 0.1034), (3.647, 0.08369), (3.685, 0.06353), (3.724, 0.04286), (3.762, 0.02168), (3.8, 4.712e-16), (3.8, -4.712e-16), (3.762, -0.02168), (3.724, -0.04286), (3.685, -0.06353), (3.647, -0.08369), (3.609, -0.1034), (3.57, -0.1225), (3.531, -0.1412), (3.492, -0.1594), (3.453, -0.1771), (3.414, -0.1943), (3.375, -0.211), (3.336, -0.2272), (3.297, -0.243), (3.258, -0.2582), (3.218, -0.2731), (3.179, -0.2874), (3.14, -0.3012), (3.1, -0.3146), (3.061, -0.3276), (3.021, -0.34), (2.981, -0.352), (2.942, -0.3636), (2.902, -0.3746), (2.862, -0.3853), (2.822, -0.3954), (2.783, -0.4052), (2.743, -0.4144), (2.703, -0.4233), (2.663, -0.4317), (2.623, -0.4396), (2.584, -0.4471), (2.544, -0.4542), (2.504, -0.4608), (2.464, -0.467), (2.424, -0.4728), (2.385, -0.4781), (2.345, -0.483), (2.305, -0.4875), (2.265, -0.4915), (2.226, -0.4951), (2.186, -0.4983), (2.146, -0.5011), (2.107, -0.5035), (2.067, -0.5054), (2.028, -0.507), (1.988, -0.5081), (1.949, -0.5088), (1.909, -0.5091), (1.87, -0.509), (1.831, -0.5085), (1.791, -0.5076), (1.752, -0.5062), (1.713, -0.5045), (1.674, -0.5024), (1.635, -0.4999), (1.596, -0.497), (1.558, -0.4937), (1.519, -0.4899), (1.48, -0.4859), (1.442, -0.4814), (1.403, -0.4765), (1.365, -0.4712), (1.327, -0.4656), (1.288, -0.4596), (1.25, -0.4532), (1.212, -0.4464), (1.175, -0.4392), (1.137, -0.4317), (1.099, -0.4238), (1.062, -0.4155), (1.024, -0.4068), (0.9869, -0.3978), (0.9497, -0.3884), (0.9126, -0.3786), (0.8756, -0.3684), (0.8388, -0.3579), (0.8021, -0.3471), (0.7656, -0.3358), (0.7292, -0.3242), (0.6929, -0.3123), (0.6567, -0.3), (0.6207, -0.2873), (0.5849, -0.2743), (0.5492, -0.2609), (0.5136, -0.2472), (0.4782, -0.2331), (0.443, -0.2187), (0.4079, -0.2039), (0.3729, -0.1888), (0.3382, -0.1733), (0.3036, -0.1575), (0.2691, -0.1413), (0.2349, -0.1249), (0.2008, -0.108), (0.1669, -0.09086), (0.1331, -0.07335), (0.09957, -0.05551), (0.06619, -0.03734), (0.033, -0.01884), (0, 0), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((3.8, -4.712e-16), (3.828, 0.0162), (3.855, 0.03267), (3.883, 0.04942), (3.911, 0.06645), (3.938, 0.08376), (3.966, 0.1013), (3.993, 0.1192), (4.02, 0.1374), (4.047, 0.1558), (4.074, 0.1745), (4.101, 0.1935), (4.128, 0.2128), (4.155, 0.2324), (4.182, 0.2523), (4.208, 0.2725), (4.235, 0.2929), (4.261, 0.3137), (4.288, 0.3347), (4.314, 0.3561), (4.34, 0.3777), (4.366, 0.3997), (4.392, 0.4219), (4.418, 0.4445), (4.443, 0.4673), (4.469, 0.4905), (4.494, 0.514), (4.519, 0.5378), (4.544, 0.5619), (4.569, 0.5863), (4.594, 0.611), (4.619, 0.636), (4.643, 0.6614), (4.668, 0.6871), (4.692, 0.7131), (4.716, 0.7394), (4.74, 0.7661), (4.764, 0.7931), (4.787, 0.8204), (4.811, 0.848), (4.834, 0.876), (4.857, 0.9043), (4.88, 0.933), (4.903, 0.962), (4.925, 0.9913), (4.948, 1.021), (4.97, 1.051), (4.992, 1.081), (5.013, 1.112), (5.035, 1.143), (5.056, 1.175), (5.077, 1.207), (5.098, 1.239), (5.119, 1.271), (5.139, 1.304), (5.159, 1.337), (5.179, 1.371), (5.199, 1.405), (5.219, 1.44), (5.238, 1.474), (5.257, 1.51), (5.275, 1.545), (5.294, 1.581), (5.312, 1.618), (5.33, 1.654), (5.347, 1.691), (5.364, 1.729), (5.381, 1.767), (5.398, 1.806), (5.414, 1.844), (5.43, 1.884), (5.445, 1.923), (5.461, 1.963), (5.475, 2.004), (5.49, 2.045), (5.504, 2.087), (5.518, 2.129), (5.531, 2.171), (5.544, 2.214), (5.557, 2.257), (5.569, 2.301), (5.58, 2.345), (5.592, 2.39), (5.602, 2.435), (5.613, 2.481), (5.623, 2.528), (5.632, 2.574), (5.641, 2.622), (5.649, 2.67), (5.657, 2.718), (5.664, 2.767), (5.67, 2.817), (5.676, 2.867), (5.682, 2.918), (5.686, 2.969), (5.69, 3.021), (5.694, 3.074), (5.696, 3.127), (5.698, 3.181), (5.7, 3.236), (5.7, 3.291), (5.7, 3.291), (5.718, 3.281), (5.735, 3.27), (5.753, 3.26), (5.771, 3.249), (5.789, 3.238), (5.806, 3.227), (5.824, 3.216), (5.842, 3.205), (5.86, 3.193), (5.878, 3.182), (5.896, 3.17), (5.914, 3.158), (5.932, 3.146), (5.95, 3.134), (5.968, 3.121), (5.986, 3.109), (6.004, 3.096), (6.022, 3.083), (6.04, 3.07), (6.058, 3.056), (6.076, 3.043), (6.095, 3.029), (6.113, 3.015), (6.131, 3.001), (6.149, 2.987), (6.168, 2.972), (6.186, 2.957), (6.204, 2.943), (6.223, 2.927), (6.241, 2.912), (6.26, 2.896), (6.278, 2.881), (6.297, 2.865), (6.315, 2.848), (6.334, 2.832), (6.353, 2.815), (6.371, 2.798), (6.39, 2.781), (6.409, 2.763), (6.427, 2.745), (6.446, 2.727), (6.465, 2.709), (6.484, 2.69), (6.502, 2.672), (6.521, 2.652), (6.54, 2.633), (6.559, 2.613), (6.578, 2.593), (6.597, 2.572), (6.616, 2.552), (6.635, 2.53), (6.654, 2.509), (6.673, 2.487), (6.692, 2.465), (6.711, 2.442), (6.73, 2.419), (6.75, 2.396), (6.769, 2.372), (6.788, 2.348), (6.807, 2.323), (6.827, 2.298), (6.846, 2.272), (6.865, 2.246), (6.885, 2.219), (6.904, 2.192), (6.923, 2.164), (6.943, 2.136), (6.962, 2.107), (6.982, 2.078), (7.001, 2.047), (7.021, 2.016), (7.04, 1.985), (7.06, 1.952), (7.08, 1.919), (7.099, 1.885), (7.119, 1.85), (7.139, 1.814), (7.159, 1.778), (7.178, 1.74), (7.198, 1.701), (7.218, 1.66), (7.238, 1.619), (7.258, 1.576), (7.278, 1.532), (7.298, 1.486), (7.318, 1.438), (7.338, 1.388), (7.358, 1.335), (7.378, 1.281), (7.398, 1.223), (7.418, 1.162), (7.438, 1.098), (7.458, 1.029), (7.478, 0.954), (7.499, 0.8723), (7.519, 0.7815), (7.539, 0.678), (7.559, 0.5545), (7.58, 0.3927), (7.6, 0), (7.6, 0), (7.58, -0.3927), (7.559, -0.5545), (7.539, -0.678), (7.519, -0.7815), (7.499, -0.8723), (7.478, -0.954), (7.458, -1.029), (7.438, -1.098), (7.418, -1.162), (7.398, -1.223), (7.378, -1.281), (7.358, -1.335), (7.338, -1.388), (7.318, -1.438), (7.298, -1.486), (7.278, -1.532), (7.258, -1.576), (7.238, -1.619), (7.218, -1.66), (7.198, -1.701), (7.178, -1.74), (7.159, -1.778), (7.139, -1.814), (7.119, -1.85), (7.099, -1.885), (7.08, -1.919), (7.06, -1.952), (7.04, -1.985), (7.021, -2.016), (7.001, -2.047), (6.982, -2.078), (6.962, -2.107), (6.943, -2.136), (6.923, -2.164), (6.904, -2.192), (6.885, -2.219), (6.865, -2.246), (6.846, -2.272), (6.827, -2.298), (6.807, -2.323), (6.788, -2.348), (6.769, -2.372), (6.75, -2.396), (6.73, -2.419), (6.711, -2.442), (6.692, -2.465), (6.673, -2.487), (6.654, -2.509), (6.635, -2.53), (6.616, -2.552), (6.597, -2.572), (6.578, -2.593), (6.559, -2.613), (6.54, -2.633), (6.521, -2.652), (6.502, -2.672), (6.484, -2.69), (6.465, -2.709), (6.446, -2.727), (6.427, -2.745), (6.409, -2.763), (6.39, -2.781), (6.371, -2.798), (6.353, -2.815), (6.334, -2.832), (6.315, -2.848), (6.297, -2.865), (6.278, -2.881), (6.26, -2.896), (6.241, -2.912), (6.223, -2.927), (6.204, -2.943), (6.186, -2.957), (6.168, -2.972), (6.149, -2.987), (6.131, -3.001), (6.113, -3.015), (6.095, -3.029), (6.076, -3.043), (6.058, -3.056), (6.04, -3.07), (6.022, -3.083), (6.004, -3.096), (5.986, -3.109), (5.968, -3.121), (5.95, -3.134), (5.932, -3.146), (5.914, -3.158), (5.896, -3.17), (5.878, -3.182), (5.86, -3.193), (5.842, -3.205), (5.824, -3.216), (5.806, -3.227), (5.789, -3.238), (5.771, -3.249), (5.753, -3.26), (5.735, -3.27), (5.718, -3.281), (5.7, -3.291), (5.7, -3.291), (5.7, -3.236), (5.698, -3.181), (5.696, -3.127), (5.694, -3.074), (5.69, -3.021), (5.686, -2.969), (5.682, -2.918), (5.676, -2.867), (5.67, -2.817), (5.664, -2.767), (5.657, -2.718), (5.649, -2.67), (5.641, -2.622), (5.632, -2.574), (5.623, -2.528), (5.613, -2.481), (5.602, -2.435), (5.592, -2.39), (5.58, -2.345), (5.569, -2.301), (5.557, -2.257), (5.544, -2.214), (5.531, -2.171), (5.518, -2.129), (5.504, -2.087), (5.49, -2.045), (5.475, -2.004), (5.461, -1.963), (5.445, -1.923), (5.43, -1.884), (5.414, -1.844), (5.398, -1.806), (5.381, -1.767), (5.364, -1.729), (5.347, -1.691), (5.33, -1.654), (5.312, -1.618), (5.294, -1.581), (5.275, -1.545), (5.257, -1.51), (5.238, -1.474), (5.219, -1.44), (5.199, -1.405), (5.179, -1.371), (5.159, -1.337), (5.139, -1.304), (5.119, -1.271), (5.098, -1.239), (5.077, -1.207), (5.056, -1.175), (5.035, -1.143), (5.013, -1.112), (4.992, -1.081), (4.97, -1.051), (4.948, -1.021), (4.925, -0.9913), (4.903, -0.962), (4.88, -0.933), (4.857, -0.9043), (4.834, -0.876), (4.811, -0.848), (4.787, -0.8204), (4.764, -0.7931), (4.74, -0.7661), (4.716, -0.7394), (4.692, -0.7131), (4.668, -0.6871), (4.643, -0.6614), (4.619, -0.636), (4.594, -0.611), (4.569, -0.5863), (4.544, -0.5619), (4.519, -0.5378), (4.494, -0.514), (4.469, -0.4905), (4.443, -0.4673), (4.418, -0.4445), (4.392, -0.4219), (4.366, -0.3997), (4.34, -0.3777), (4.314, -0.3561), (4.288, -0.3347), (4.261, -0.3137), (4.235, -0.2929), (4.208, -0.2725), (4.182, -0.2523), (4.155, -0.2324), (4.128, -0.2128), (4.101, -0.1935), (4.074, -0.1745), (4.047, -0.1558), (4.02, -0.1374), (3.993, -0.1192), (3.966, -0.1013), (3.938, -0.08376), (3.911, -0.06645), (3.883, -0.04942), (3.855, -0.03267), (3.828, -0.0162), (3.8, 4.712e-16), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((0, 0), (0.00019, 0.038), (0.00076, 0.076), (0.00171, 0.114), (0.00304, 0.152), (0.00475, 0.1899), (0.00684, 0.2279), (0.00931, 0.2658), (0.01216, 0.3038), (0.01539, 0.3417), (0.019, 0.3795), (0.02299, 0.4174), (0.02736, 0.4552), (0.03211, 0.493), (0.03724, 0.5307), (0.04275, 0.5684), (0.04864, 0.6061), (0.05491, 0.6437), (0.06156, 0.6812), (0.06859, 0.7187), (0.076, 0.7562), (0.08379, 0.7936), (0.09196, 0.8309), (0.1005, 0.8682), (0.1094, 0.9054), (0.1188, 0.9425), (0.1284, 0.9796), (0.1385, 1.017), (0.149, 1.054), (0.1598, 1.09), (0.171, 1.127), (0.1826, 1.164), (0.1946, 1.2), (0.2069, 1.237), (0.2196, 1.273), (0.2327, 1.309), (0.2462, 1.346), (0.2601, 1.382), (0.2744, 1.418), (0.289, 1.454), (0.304, 1.489), (0.3194, 1.525), (0.3352, 1.56), (0.3513, 1.596), (0.3678, 1.631), (0.3847, 1.666), (0.402, 1.701), (0.4197, 1.736), (0.4378, 1.771), (0.4562, 1.805), (0.475, 1.84), (0.4942, 1.874), (0.5138, 1.908), (0.5337, 1.942), (0.554, 1.976), (0.5748, 2.009), (0.5958, 2.043), (0.6173, 2.076), (0.6392, 2.109), (0.6614, 2.142), (0.684, 2.175), (0.707, 2.208), (0.7304, 2.24), (0.7541, 2.272), (0.7782, 2.304), (0.8027, 2.336), (0.8276, 2.368), (0.8529, 2.399), (0.8786, 2.43), (0.9046, 2.461), (0.931, 2.492), (0.9578, 2.522), (0.985, 2.553), (1.013, 2.583), (1.04, 2.612), (1.069, 2.642), (1.097, 2.671), (1.127, 2.7), (1.156, 2.729), (1.186, 2.758), (1.216, 2.786), (1.247, 2.814), (1.278, 2.842), (1.309, 2.87), (1.341, 2.897), (1.373, 2.924), (1.405, 2.95), (1.438, 2.977), (1.471, 3.003), (1.505, 3.029), (1.539, 3.054), (1.573, 3.079), (1.608, 3.104), (1.643, 3.129), (1.679, 3.153), (1.715, 3.177), (1.751, 3.2), (1.788, 3.223), (1.825, 3.246), (1.862, 3.269), (1.9, 3.291), (1.9, 3.291), (1.9, 3.247), (1.899, 3.203), (1.898, 3.16), (1.896, 3.117), (1.894, 3.073), (1.891, 3.03), (1.888, 2.987), (1.884, 2.945), (1.88, 2.902), (1.875, 2.86), (1.87, 2.818), (1.865, 2.776), (1.859, 2.734), (1.853, 2.692), (1.846, 2.651), (1.838, 2.609), (1.831, 2.568), (1.823, 2.527), (1.814, 2.487), (1.805, 2.446), (1.795, 2.406), (1.786, 2.366), (1.775, 2.326), (1.765, 2.286), (1.754, 2.247), (1.742, 2.207), (1.73, 2.168), (1.718, 2.129), (1.705, 2.091), (1.692, 2.052), (1.679, 2.014), (1.665, 1.976), (1.651, 1.938), (1.636, 1.901), (1.622, 1.863), (1.606, 1.826), (1.591, 1.789), (1.575, 1.752), (1.558, 1.716), (1.542, 1.68), (1.525, 1.644), (1.507, 1.608), (1.489, 1.573), (1.471, 1.537), (1.453, 1.502), (1.434, 1.468), (1.415, 1.433), (1.396, 1.399), (1.376, 1.365), (1.356, 1.331), (1.335, 1.298), (1.315, 1.264), (1.294, 1.231), (1.272, 1.199), (1.251, 1.166), (1.229, 1.134), (1.206, 1.102), (1.184, 1.07), (1.161, 1.039), (1.138, 1.008), (1.114, 0.977), (1.091, 0.9465), (1.067, 0.9161), (1.042, 0.8861), (1.018, 0.8563), (0.9928, 0.8268), (0.9677, 0.7976), (0.9422, 0.7687), (0.9166, 0.74), (0.8906, 0.7116), (0.8644, 0.6836), (0.8379, 0.6558), (0.8112, 0.6283), (0.7842, 0.601), (0.7569, 0.5741), (0.7294, 0.5475), (0.7016, 0.5211), (0.6736, 0.4951), (0.6454, 0.4694), (0.6169, 0.4439), (0.5881, 0.4188), (0.5592, 0.3939), (0.53, 0.3694), (0.5005, 0.3451), (0.4709, 0.3212), (0.441, 0.2976), (0.4109, 0.2743), (0.3805, 0.2513), (0.35, 0.2286), (0.3192, 0.2062), (0.2882, 0.1842), (0.257, 0.1624), (0.2256, 0.141), (0.1939, 0.1199), (0.1621, 0.09908), (0.1301, 0.07862), (0.09786, 0.05847), (0.06543, 0.03866), (0.03281, 0.01916), (0, 0), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((1.9, 3.291), (1.9, 3.323), (1.899, 3.355), (1.899, 3.388), (1.898, 3.42), (1.897, 3.452), (1.895, 3.485), (1.893, 3.518), (1.891, 3.55), (1.889, 3.583), (1.886, 3.616), (1.883, 3.649), (1.88, 3.682), (1.876, 3.715), (1.872, 3.748), (1.868, 3.781), (1.864, 3.814), (1.859, 3.847), (1.854, 3.881), (1.849, 3.914), (1.843, 3.947), (1.837, 3.981), (1.83, 4.014), (1.824, 4.048), (1.817, 4.082), (1.81, 4.115), (1.802, 4.149), (1.794, 4.183), (1.786, 4.216), (1.777, 4.25), (1.768, 4.284), (1.759, 4.318), (1.749, 4.352), (1.739, 4.386), (1.728, 4.42), (1.718, 4.454), (1.707, 4.488), (1.695, 4.522), (1.683, 4.556), (1.671, 4.59), (1.658, 4.624), (1.645, 4.659), (1.632, 4.693), (1.618, 4.727), (1.604, 4.761), (1.59, 4.795), (1.575, 4.829), (1.559, 4.864), (1.544, 4.898), (1.527, 4.932), (1.511, 4.966), (1.494, 5), (1.476, 5.035), (1.458, 5.069), (1.44, 5.103), (1.421, 5.137), (1.402, 5.171), (1.383, 5.205), (1.363, 5.239), (1.342, 5.273), (1.321, 5.307), (1.299, 5.341), (1.278, 5.375), (1.255, 5.409), (1.232, 5.443), (1.209, 5.476), (1.185, 5.51), (1.16, 5.544), (1.135, 5.577), (1.11, 5.611), (1.084, 5.644), (1.057, 5.678), (1.03, 5.711), (1.002, 5.744), (0.9739, 5.777), (0.945, 5.81), (0.9156, 5.843), (0.8855, 5.876), (0.8549, 5.908), (0.8236, 5.941), (0.7917, 5.973), (0.7592, 6.005), (0.726, 6.038), (0.6921, 6.07), (0.6576, 6.101), (0.6224, 6.133), (0.5864, 6.165), (0.5498, 6.196), (0.5124, 6.227), (0.4743, 6.258), (0.4354, 6.289), (0.3957, 6.319), (0.3552, 6.349), (0.3139, 6.379), (0.2718, 6.409), (0.2288, 6.439), (0.1849, 6.468), (0.1401, 6.497), (0.09437, 6.525), (0.04768, 6.554), (-2.838e-09, 6.582), (2.838e-09, 6.582), (0.0177, 6.592), (0.03555, 6.602), (0.05353, 6.612), (0.07165, 6.622), (0.08992, 6.632), (0.1083, 6.642), (0.1269, 6.652), (0.1456, 6.662), (0.1644, 6.671), (0.1834, 6.681), (0.2026, 6.691), (0.2219, 6.7), (0.2414, 6.71), (0.261, 6.719), (0.2808, 6.729), (0.3008, 6.738), (0.3209, 6.747), (0.3412, 6.756), (0.3617, 6.766), (0.3823, 6.775), (0.4031, 6.784), (0.4241, 6.793), (0.4453, 6.801), (0.4666, 6.81), (0.4882, 6.819), (0.5099, 6.828), (0.5318, 6.836), (0.554, 6.845), (0.5763, 6.853), (0.5988, 6.861), (0.6215, 6.869), (0.6445, 6.877), (0.6676, 6.886), (0.691, 6.893), (0.7146, 6.901), (0.7384, 6.909), (0.7624, 6.917), (0.7867, 6.924), (0.8112, 6.932), (0.836, 6.939), (0.861, 6.946), (0.8863, 6.953), (0.9118, 6.96), (0.9376, 6.967), (0.9636, 6.974), (0.99, 6.98), (1.017, 6.987), (1.043, 6.993), (1.071, 6.999), (1.098, 7.005), (1.126, 7.011), (1.154, 7.017), (1.183, 7.023), (1.211, 7.028), (1.241, 7.033), (1.27, 7.038), (1.3, 7.043), (1.33, 7.048), (1.361, 7.052), (1.392, 7.057), (1.423, 7.061), (1.455, 7.065), (1.488, 7.068), (1.52, 7.072), (1.554, 7.075), (1.587, 7.078), (1.622, 7.081), (1.656, 7.083), (1.692, 7.085), (1.728, 7.087), (1.764, 7.088), (1.801, 7.09), (1.839, 7.09), (1.878, 7.091), (1.917, 7.091), (1.957, 7.09), (1.998, 7.09), (2.04, 7.088), (2.083, 7.087), (2.126, 7.084), (2.171, 7.081), (2.217, 7.078), (2.264, 7.073), (2.312, 7.068), (2.362, 7.063), (2.414, 7.056), (2.467, 7.048), (2.522, 7.04), (2.58, 7.03), (2.639, 7.018), (2.702, 7.005), (2.768, 6.99), (2.838, 6.973), (2.913, 6.953), (2.994, 6.93), (3.083, 6.902), (3.182, 6.868), (3.299, 6.824), (3.45, 6.761), (3.8, 6.582), (3.8, 6.582), (4.13, 6.368), (4.26, 6.269), (4.357, 6.19), (4.436, 6.121), (4.505, 6.058), (4.565, 5.999), (4.62, 5.945), (4.67, 5.893), (4.716, 5.843), (4.758, 5.795), (4.798, 5.749), (4.835, 5.704), (4.871, 5.661), (4.904, 5.618), (4.935, 5.577), (4.965, 5.537), (4.994, 5.497), (5.021, 5.459), (5.047, 5.421), (5.072, 5.383), (5.096, 5.347), (5.119, 5.311), (5.141, 5.275), (5.162, 5.24), (5.182, 5.206), (5.202, 5.172), (5.221, 5.138), (5.239, 5.105), (5.257, 5.072), (5.274, 5.04), (5.29, 5.008), (5.306, 4.976), (5.321, 4.945), (5.336, 4.914), (5.35, 4.883), (5.364, 4.853), (5.378, 4.822), (5.391, 4.793), (5.403, 4.763), (5.415, 4.734), (5.427, 4.705), (5.439, 4.676), (5.45, 4.647), (5.46, 4.619), (5.471, 4.591), (5.481, 4.563), (5.49, 4.535), (5.5, 4.508), (5.509, 4.481), (5.518, 4.454), (5.526, 4.427), (5.534, 4.4), (5.542, 4.374), (5.55, 4.347), (5.558, 4.321), (5.565, 4.295), (5.572, 4.27), (5.578, 4.244), (5.585, 4.219), (5.591, 4.193), (5.597, 4.168), (5.603, 4.143), (5.609, 4.119), (5.614, 4.094), (5.619, 4.069), (5.624, 4.045), (5.629, 4.021), (5.634, 3.997), (5.638, 3.973), (5.643, 3.949), (5.647, 3.926), (5.651, 3.902), (5.654, 3.879), (5.658, 3.855), (5.661, 3.832), (5.664, 3.809), (5.668, 3.786), (5.67, 3.764), (5.673, 3.741), (5.676, 3.718), (5.678, 3.696), (5.681, 3.674), (5.683, 3.652), (5.685, 3.629), (5.687, 3.608), (5.689, 3.586), (5.69, 3.564), (5.692, 3.542), (5.693, 3.521), (5.694, 3.499), (5.695, 3.478), (5.696, 3.457), (5.697, 3.436), (5.698, 3.415), (5.699, 3.394), (5.699, 3.373), (5.7, 3.352), (5.7, 3.332), (5.7, 3.311), (5.7, 3.291), (5.7, 3.291), (5.652, 3.318), (5.604, 3.344), (5.556, 3.37), (5.509, 3.394), (5.462, 3.417), (5.415, 3.44), (5.368, 3.462), (5.321, 3.482), (5.275, 3.502), (5.228, 3.521), (5.182, 3.54), (5.136, 3.557), (5.091, 3.574), (5.045, 3.59), (5, 3.605), (4.955, 3.62), (4.91, 3.634), (4.866, 3.648), (4.821, 3.66), (4.777, 3.672), (4.733, 3.684), (4.689, 3.694), (4.646, 3.705), (4.602, 3.714), (4.559, 3.723), (4.516, 3.732), (4.473, 3.74), (4.431, 3.747), (4.388, 3.754), (4.346, 3.761), (4.304, 3.766), (4.262, 3.772), (4.221, 3.777), (4.18, 3.781), (4.138, 3.785), (4.097, 3.788), (4.057, 3.791), (4.016, 3.794), (3.976, 3.796), (3.936, 3.798), (3.896, 3.799), (3.856, 3.8), (3.816, 3.8), (3.777, 3.8), (3.738, 3.799), (3.699, 3.799), (3.66, 3.797), (3.622, 3.796), (3.584, 3.794), (3.545, 3.791), (3.508, 3.789), (3.47, 3.786), (3.432, 3.782), (3.395, 3.778), (3.358, 3.774), (3.321, 3.77), (3.284, 3.765), (3.248, 3.76), (3.212, 3.754), (3.176, 3.748), (3.14, 3.742), (3.104, 3.736), (3.069, 3.729), (3.033, 3.722), (2.998, 3.714), (2.964, 3.707), (2.929, 3.699), (2.894, 3.691), (2.86, 3.682), (2.826, 3.673), (2.792, 3.664), (2.759, 3.655), (2.725, 3.645), (2.692, 3.635), (2.659, 3.625), (2.626, 3.614), (2.594, 3.603), (2.561, 3.592), (2.529, 3.581), (2.497, 3.57), (2.465, 3.558), (2.434, 3.546), (2.402, 3.534), (2.371, 3.521), (2.34, 3.508), (2.309, 3.495), (2.279, 3.482), (2.248, 3.469), (2.218, 3.455), (2.188, 3.441), (2.159, 3.427), (2.129, 3.413), (2.1, 3.398), (2.071, 3.384), (2.042, 3.369), (2.013, 3.354), (1.984, 3.338), (1.956, 3.323), (1.928, 3.307), (1.9, 3.291), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((0, 0), (-0.03281, 0.01916), (-0.06543, 0.03866), (-0.09786, 0.05847), (-0.1301, 0.07862), (-0.1621, 0.09908), (-0.1939, 0.1199), (-0.2256, 0.141), (-0.257, 0.1624), (-0.2882, 0.1842), (-0.3192, 0.2062), (-0.35, 0.2286), (-0.3805, 0.2513), (-0.4109, 0.2743), (-0.441, 0.2976), (-0.4709, 0.3212), (-0.5005, 0.3451), (-0.53, 0.3694), (-0.5592, 0.3939), (-0.5881, 0.4188), (-0.6169, 0.4439), (-0.6454, 0.4694), (-0.6736, 0.4951), (-0.7016, 0.5211), (-0.7294, 0.5475), (-0.7569, 0.5741), (-0.7842, 0.601), (-0.8112, 0.6283), (-0.8379, 0.6558), (-0.8644, 0.6836), (-0.8906, 0.7116), (-0.9166, 0.74), (-0.9422, 0.7687), (-0.9677, 0.7976), (-0.9928, 0.8268), (-1.018, 0.8563), (-1.042, 0.8861), (-1.067, 0.9161), (-1.091, 0.9465), (-1.114, 0.977), (-1.138, 1.008), (-1.161, 1.039), (-1.184, 1.07), (-1.206, 1.102), (-1.229, 1.134), (-1.251, 1.166), (-1.272, 1.199), (-1.294, 1.231), (-1.315, 1.264), (-1.335, 1.298), (-1.356, 1.331), (-1.376, 1.365), (-1.396, 1.399), (-1.415, 1.433), (-1.434, 1.468), (-1.453, 1.502), (-1.471, 1.537), (-1.489, 1.573), (-1.507, 1.608), (-1.525, 1.644), (-1.542, 1.68), (-1.558, 1.716), (-1.575, 1.752), (-1.591, 1.789), (-1.606, 1.826), (-1.622, 1.863), (-1.636, 1.901), (-1.651, 1.938), (-1.665, 1.976), (-1.679, 2.014), (-1.692, 2.052), (-1.705, 2.091), (-1.718, 2.129), (-1.73, 2.168), (-1.742, 2.207), (-1.754, 2.247), (-1.765, 2.286), (-1.775, 2.326), (-1.786, 2.366), (-1.795, 2.406), (-1.805, 2.446), (-1.814, 2.487), (-1.823, 2.527), (-1.831, 2.568), (-1.838, 2.609), (-1.846, 2.651), (-1.853, 2.692), (-1.859, 2.734), (-1.865, 2.776), (-1.87, 2.818), (-1.875, 2.86), (-1.88, 2.902), (-1.884, 2.945), (-1.888, 2.987), (-1.891, 3.03), (-1.894, 3.073), (-1.896, 3.117), (-1.898, 3.16), (-1.899, 3.203), (-1.9, 3.247), (-1.9, 3.291), (-1.9, 3.291), (-1.862, 3.269), (-1.825, 3.246), (-1.788, 3.223), (-1.751, 3.2), (-1.715, 3.177), (-1.679, 3.153), (-1.643, 3.129), (-1.608, 3.104), (-1.573, 3.079), (-1.539, 3.054), (-1.505, 3.029), (-1.471, 3.003), (-1.438, 2.977), (-1.405, 2.95), (-1.373, 2.924), (-1.341, 2.897), (-1.309, 2.87), (-1.278, 2.842), (-1.247, 2.814), (-1.216, 2.786), (-1.186, 2.758), (-1.156, 2.729), (-1.127, 2.7), (-1.097, 2.671), (-1.069, 2.642), (-1.04, 2.612), (-1.013, 2.583), (-0.985, 2.553), (-0.9578, 2.522), (-0.931, 2.492), (-0.9046, 2.461), (-0.8786, 2.43), (-0.8529, 2.399), (-0.8276, 2.368), (-0.8028, 2.336), (-0.7782, 2.304), (-0.7541, 2.272), (-0.7304, 2.24), (-0.707, 2.208), (-0.684, 2.175), (-0.6614, 2.142), (-0.6392, 2.109), (-0.6173, 2.076), (-0.5958, 2.043), (-0.5747, 2.009), (-0.554, 1.976), (-0.5337, 1.942), (-0.5138, 1.908), (-0.4942, 1.874), (-0.475, 1.84), (-0.4562, 1.805), (-0.4378, 1.771), (-0.4197, 1.736), (-0.402, 1.701), (-0.3848, 1.666), (-0.3678, 1.631), (-0.3513, 1.596), (-0.3352, 1.56), (-0.3194, 1.525), (-0.304, 1.489), (-0.289, 1.454), (-0.2744, 1.418), (-0.2601, 1.382), (-0.2462, 1.346), (-0.2327, 1.309), (-0.2196, 1.273), (-0.2069, 1.237), (-0.1946, 1.2), (-0.1826, 1.164), (-0.171, 1.127), (-0.1598, 1.09), (-0.149, 1.054), (-0.1385, 1.017), (-0.1284, 0.9796), (-0.1187, 0.9425), (-0.1094, 0.9054), (-0.1005, 0.8682), (-0.09196, 0.8309), (-0.08379, 0.7936), (-0.076, 0.7562), (-0.06859, 0.7187), (-0.06156, 0.6812), (-0.05491, 0.6437), (-0.04864, 0.6061), (-0.04275, 0.5684), (-0.03724, 0.5307), (-0.03211, 0.493), (-0.02736, 0.4552), (-0.02299, 0.4174), (-0.019, 0.3795), (-0.01539, 0.3417), (-0.01216, 0.3038), (-0.00931, 0.2658), (-0.00684, 0.2279), (-0.00475, 0.1899), (-0.00304, 0.152), (-0.00171, 0.114), (-0.00076, 0.076), (-0.00019, 0.038), (0, 0), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((-1.9, 3.291), (-1.928, 3.307), (-1.956, 3.323), (-1.984, 3.338), (-2.013, 3.354), (-2.042, 3.369), (-2.071, 3.384), (-2.1, 3.398), (-2.129, 3.413), (-2.159, 3.427), (-2.188, 3.441), (-2.218, 3.455), (-2.248, 3.469), (-2.279, 3.482), (-2.309, 3.495), (-2.34, 3.508), (-2.371, 3.521), (-2.402, 3.534), (-2.434, 3.546), (-2.465, 3.558), (-2.497, 3.57), (-2.529, 3.581), (-2.561, 3.592), (-2.594, 3.603), (-2.626, 3.614), (-2.659, 3.625), (-2.692, 3.635), (-2.725, 3.645), (-2.759, 3.655), (-2.792, 3.664), (-2.826, 3.673), (-2.86, 3.682), (-2.894, 3.691), (-2.929, 3.699), (-2.964, 3.707), (-2.998, 3.714), (-3.033, 3.722), (-3.069, 3.729), (-3.104, 3.736), (-3.14, 3.742), (-3.176, 3.748), (-3.212, 3.754), (-3.248, 3.76), (-3.284, 3.765), (-3.321, 3.77), (-3.358, 3.774), (-3.395, 3.778), (-3.432, 3.782), (-3.47, 3.786), (-3.508, 3.789), (-3.545, 3.791), (-3.584, 3.794), (-3.622, 3.796), (-3.66, 3.797), (-3.699, 3.799), (-3.738, 3.799), (-3.777, 3.8), (-3.816, 3.8), (-3.856, 3.8), (-3.896, 3.799), (-3.936, 3.798), (-3.976, 3.796), (-4.016, 3.794), (-4.057, 3.791), (-4.097, 3.788), (-4.138, 3.785), (-4.18, 3.781), (-4.221, 3.777), (-4.262, 3.772), (-4.304, 3.766), (-4.346, 3.761), (-4.388, 3.754), (-4.431, 3.747), (-4.473, 3.74), (-4.516, 3.732), (-4.559, 3.723), (-4.602, 3.714), (-4.646, 3.705), (-4.689, 3.694), (-4.733, 3.684), (-4.777, 3.672), (-4.821, 3.66), (-4.866, 3.648), (-4.91, 3.634), (-4.955, 3.62), (-5, 3.605), (-5.045, 3.59), (-5.091, 3.574), (-5.136, 3.557), (-5.182, 3.54), (-5.228, 3.521), (-5.275, 3.502), (-5.321, 3.482), (-5.368, 3.462), (-5.415, 3.44), (-5.462, 3.417), (-5.509, 3.394), (-5.556, 3.37), (-5.604, 3.344), (-5.652, 3.318), (-5.7, 3.291), (-5.7, 3.291), (-5.7, 3.311), (-5.7, 3.332), (-5.7, 3.352), (-5.699, 3.373), (-5.699, 3.394), (-5.698, 3.415), (-5.697, 3.436), (-5.696, 3.457), (-5.695, 3.478), (-5.694, 3.499), (-5.693, 3.521), (-5.692, 3.542), (-5.69, 3.564), (-5.689, 3.586), (-5.687, 3.608), (-5.685, 3.629), (-5.683, 3.652), (-5.681, 3.674), (-5.678, 3.696), (-5.676, 3.718), (-5.673, 3.741), (-5.67, 3.764), (-5.668, 3.786), (-5.664, 3.809), (-5.661, 3.832), (-5.658, 3.855), (-5.654, 3.879), (-5.651, 3.902), (-5.647, 3.926), (-5.643, 3.949), (-5.638, 3.973), (-5.634, 3.997), (-5.629, 4.021), (-5.624, 4.045), (-5.619, 4.069), (-5.614, 4.094), (-5.609, 4.119), (-5.603, 4.143), (-5.597, 4.168), (-5.591, 4.193), (-5.585, 4.219), (-5.578, 4.244), (-5.572, 4.27), (-5.565, 4.295), (-5.558, 4.321), (-5.55, 4.347), (-5.542, 4.374), (-5.534, 4.4), (-5.526, 4.427), (-5.518, 4.454), (-5.509, 4.481), (-5.5, 4.508), (-5.49, 4.535), (-5.481, 4.563), (-5.471, 4.591), (-5.46, 4.619), (-5.45, 4.647), (-5.439, 4.676), (-5.427, 4.705), (-5.415, 4.734), (-5.403, 4.763), (-5.391, 4.793), (-5.378, 4.822), (-5.364, 4.853), (-5.35, 4.883), (-5.336, 4.914), (-5.321, 4.945), (-5.306, 4.976), (-5.29, 5.008), (-5.274, 5.04), (-5.257, 5.072), (-5.239, 5.105), (-5.221, 5.138), (-5.202, 5.172), (-5.182, 5.206), (-5.162, 5.24), (-5.141, 5.275), (-5.119, 5.311), (-5.096, 5.347), (-5.072, 5.383), (-5.047, 5.421), (-5.021, 5.459), (-4.994, 5.497), (-4.965, 5.537), (-4.935, 5.577), (-4.904, 5.618), (-4.871, 5.661), (-4.835, 5.704), (-4.798, 5.749), (-4.758, 5.795), (-4.716, 5.843), (-4.67, 5.893), (-4.62, 5.945), (-4.565, 5.999), (-4.505, 6.058), (-4.436, 6.121), (-4.357, 6.19), (-4.26, 6.269), (-4.13, 6.368), (-3.8, 6.582), (-3.8, 6.582), (-3.45, 6.761), (-3.299, 6.824), (-3.182, 6.868), (-3.083, 6.902), (-2.994, 6.93), (-2.913, 6.953), (-2.838, 6.973), (-2.768, 6.99), (-2.702, 7.005), (-2.639, 7.018), (-2.58, 7.03), (-2.522, 7.04), (-2.467, 7.048), (-2.414, 7.056), (-2.362, 7.063), (-2.312, 7.068), (-2.264, 7.073), (-2.217, 7.078), (-2.171, 7.081), (-2.126, 7.084), (-2.083, 7.087), (-2.04, 7.088), (-1.998, 7.09), (-1.957, 7.09), (-1.917, 7.091), (-1.878, 7.091), (-1.839, 7.09), (-1.801, 7.09), (-1.764, 7.088), (-1.728, 7.087), (-1.692, 7.085), (-1.656, 7.083), (-1.622, 7.081), (-1.587, 7.078), (-1.554, 7.075), (-1.52, 7.072), (-1.488, 7.068), (-1.455, 7.065), (-1.423, 7.061), (-1.392, 7.057), (-1.361, 7.052), (-1.33, 7.048), (-1.3, 7.043), (-1.27, 7.038), (-1.241, 7.033), (-1.211, 7.028), (-1.183, 7.023), (-1.154, 7.017), (-1.126, 7.011), (-1.098, 7.005), (-1.071, 6.999), (-1.043, 6.993), (-1.017, 6.987), (-0.99, 6.98), (-0.9636, 6.974), (-0.9376, 6.967), (-0.9118, 6.96), (-0.8863, 6.953), (-0.861, 6.946), (-0.836, 6.939), (-0.8112, 6.932), (-0.7867, 6.924), (-0.7624, 6.917), (-0.7384, 6.909), (-0.7146, 6.901), (-0.691, 6.893), (-0.6676, 6.886), (-0.6445, 6.877), (-0.6215, 6.869), (-0.5988, 6.861), (-0.5763, 6.853), (-0.554, 6.845), (-0.5318, 6.836), (-0.5099, 6.828), (-0.4882, 6.819), (-0.4666, 6.81), (-0.4453, 6.801), (-0.4241, 6.793), (-0.4031, 6.784), (-0.3823, 6.775), (-0.3617, 6.766), (-0.3412, 6.756), (-0.3209, 6.747), (-0.3008, 6.738), (-0.2808, 6.729), (-0.261, 6.719), (-0.2414, 6.71), (-0.2219, 6.7), (-0.2026, 6.691), (-0.1834, 6.681), (-0.1644, 6.671), (-0.1456, 6.662), (-0.1269, 6.652), (-0.1083, 6.642), (-0.08992, 6.632), (-0.07165, 6.622), (-0.05353, 6.612), (-0.03555, 6.602), (-0.0177, 6.592), (-2.838e-09, 6.582), (2.838e-09, 6.582), (-0.04768, 6.554), (-0.09437, 6.525), (-0.1401, 6.497), (-0.1849, 6.468), (-0.2288, 6.439), (-0.2718, 6.409), (-0.3139, 6.379), (-0.3552, 6.349), (-0.3957, 6.319), (-0.4354, 6.289), (-0.4743, 6.258), (-0.5124, 6.227), (-0.5498, 6.196), (-0.5864, 6.165), (-0.6224, 6.133), (-0.6576, 6.101), (-0.6921, 6.07), (-0.726, 6.038), (-0.7592, 6.005), (-0.7917, 5.973), (-0.8236, 5.941), (-0.8549, 5.908), (-0.8855, 5.876), (-0.9156, 5.843), (-0.945, 5.81), (-0.9739, 5.777), (-1.002, 5.744), (-1.03, 5.711), (-1.057, 5.678), (-1.084, 5.644), (-1.11, 5.611), (-1.135, 5.577), (-1.16, 5.544), (-1.185, 5.51), (-1.209, 5.476), (-1.232, 5.443), (-1.255, 5.409), (-1.278, 5.375), (-1.299, 5.341), (-1.321, 5.307), (-1.342, 5.273), (-1.363, 5.239), (-1.383, 5.205), (-1.402, 5.171), (-1.421, 5.137), (-1.44, 5.103), (-1.458, 5.069), (-1.476, 5.035), (-1.494, 5), (-1.511, 4.966), (-1.527, 4.932), (-1.544, 4.898), (-1.559, 4.864), (-1.575, 4.829), (-1.59, 4.795), (-1.604, 4.761), (-1.618, 4.727), (-1.632, 4.693), (-1.645, 4.659), (-1.658, 4.624), (-1.671, 4.59), (-1.683, 4.556), (-1.695, 4.522), (-1.707, 4.488), (-1.718, 4.454), (-1.728, 4.42), (-1.739, 4.386), (-1.749, 4.352), (-1.759, 4.318), (-1.768, 4.284), (-1.777, 4.25), (-1.786, 4.216), (-1.794, 4.183), (-1.802, 4.149), (-1.81, 4.115), (-1.817, 4.082), (-1.824, 4.048), (-1.83, 4.014), (-1.837, 3.981), (-1.843, 3.947), (-1.849, 3.914), (-1.854, 3.881), (-1.859, 3.847), (-1.864, 3.814), (-1.868, 3.781), (-1.872, 3.748), (-1.876, 3.715), (-1.88, 3.682), (-1.883, 3.649), (-1.886, 3.616), (-1.889, 3.583), (-1.891, 3.55), (-1.893, 3.518), (-1.895, 3.485), (-1.897, 3.452), (-1.898, 3.42), (-1.899, 3.388), (-1.899, 3.355), (-1.9, 3.323), (-1.9, 3.291), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((0, 0), (-0.033, -0.01884), (-0.06619, -0.03734), (-0.09957, -0.05551), (-0.1331, -0.07335), (-0.1669, -0.09086), (-0.2008, -0.108), (-0.2349, -0.1249), (-0.2691, -0.1413), (-0.3036, -0.1575), (-0.3382, -0.1733), (-0.3729, -0.1888), (-0.4079, -0.2039), (-0.443, -0.2187), (-0.4782, -0.2331), (-0.5136, -0.2472), (-0.5492, -0.2609), (-0.5849, -0.2743), (-0.6207, -0.2873), (-0.6567, -0.3), (-0.6929, -0.3123), (-0.7292, -0.3242), (-0.7656, -0.3358), (-0.8021, -0.3471), (-0.8388, -0.3579), (-0.8756, -0.3684), (-0.9126, -0.3786), (-0.9497, -0.3884), (-0.9869, -0.3978), (-1.024, -0.4068), (-1.062, -0.4155), (-1.099, -0.4238), (-1.137, -0.4317), (-1.175, -0.4392), (-1.212, -0.4464), (-1.25, -0.4532), (-1.288, -0.4596), (-1.327, -0.4656), (-1.365, -0.4712), (-1.403, -0.4765), (-1.442, -0.4814), (-1.48, -0.4859), (-1.519, -0.4899), (-1.558, -0.4937), (-1.596, -0.497), (-1.635, -0.4999), (-1.674, -0.5024), (-1.713, -0.5045), (-1.752, -0.5062), (-1.791, -0.5076), (-1.831, -0.5085), (-1.87, -0.509), (-1.909, -0.5091), (-1.949, -0.5088), (-1.988, -0.5081), (-2.028, -0.507), (-2.067, -0.5054), (-2.107, -0.5035), (-2.146, -0.5011), (-2.186, -0.4983), (-2.226, -0.4951), (-2.265, -0.4915), (-2.305, -0.4875), (-2.345, -0.483), (-2.385, -0.4781), (-2.424, -0.4728), (-2.464, -0.467), (-2.504, -0.4608), (-2.544, -0.4542), (-2.584, -0.4471), (-2.623, -0.4396), (-2.663, -0.4317), (-2.703, -0.4233), (-2.743, -0.4144), (-2.783, -0.4052), (-2.822, -0.3954), (-2.862, -0.3853), (-2.902, -0.3746), (-2.942, -0.3636), (-2.981, -0.352), (-3.021, -0.34), (-3.061, -0.3276), (-3.1, -0.3146), (-3.14, -0.3012), (-3.179, -0.2874), (-3.218, -0.2731), (-3.258, -0.2582), (-3.297, -0.243), (-3.336, -0.2272), (-3.375, -0.211), (-3.414, -0.1943), (-3.453, -0.1771), (-3.492, -0.1594), (-3.531, -0.1412), (-3.57, -0.1225), (-3.609, -0.1034), (-3.647, -0.08369), (-3.685, -0.06353), (-3.724, -0.04286), (-3.762, -0.02168), (-3.8, 4.654e-16), (-3.8, 4.654e-16), (-3.762, 0.02168), (-3.724, 0.04286), (-3.685, 0.06353), (-3.647, 0.08369), (-3.609, 0.1034), (-3.57, 0.1225), (-3.531, 0.1412), (-3.492, 0.1594), (-3.453, 0.1771), (-3.414, 0.1943), (-3.375, 0.211), (-3.336, 0.2272), (-3.297, 0.243), (-3.258, 0.2582), (-3.218, 0.2731), (-3.179, 0.2874), (-3.14, 0.3012), (-3.1, 0.3146), (-3.061, 0.3276), (-3.021, 0.34), (-2.981, 0.352), (-2.942, 0.3636), (-2.902, 0.3746), (-2.862, 0.3853), (-2.822, 0.3954), (-2.783, 0.4052), (-2.743, 0.4144), (-2.703, 0.4233), (-2.663, 0.4317), (-2.623, 0.4396), (-2.584, 0.4471), (-2.544, 0.4542), (-2.504, 0.4608), (-2.464, 0.467), (-2.424, 0.4728), (-2.385, 0.4781), (-2.345, 0.483), (-2.305, 0.4875), (-2.265, 0.4915), (-2.226, 0.4951), (-2.186, 0.4983), (-2.146, 0.5011), (-2.107, 0.5035), (-2.067, 0.5054), (-2.028, 0.507), (-1.988, 0.5081), (-1.949, 0.5088), (-1.909, 0.5091), (-1.87, 0.509), (-1.831, 0.5085), (-1.791, 0.5076), (-1.752, 0.5062), (-1.713, 0.5045), (-1.674, 0.5024), (-1.635, 0.4999), (-1.596, 0.497), (-1.558, 0.4937), (-1.519, 0.4899), (-1.48, 0.4859), (-1.442, 0.4814), (-1.403, 0.4765), (-1.365, 0.4712), (-1.327, 0.4656), (-1.288, 0.4596), (-1.25, 0.4532), (-1.212, 0.4464), (-1.175, 0.4392), (-1.137, 0.4317), (-1.099, 0.4238), (-1.062, 0.4155), (-1.024, 0.4068), (-0.9869, 0.3978), (-0.9497, 0.3884), (-0.9126, 0.3786), (-0.8756, 0.3684), (-0.8388, 0.3579), (-0.8021, 0.3471), (-0.7656, 0.3358), (-0.7292, 0.3242), (-0.6929, 0.3123), (-0.6567, 0.3), (-0.6207, 0.2873), (-0.5849, 0.2743), (-0.5492, 0.2609), (-0.5136, 0.2472), (-0.4782, 0.2331), (-0.443, 0.2187), (-0.4079, 0.2039), (-0.3729, 0.1888), (-0.3382, 0.1733), (-0.3036, 0.1575), (-0.2691, 0.1413), (-0.2349, 0.1249), (-0.2008, 0.108), (-0.1669, 0.09086), (-0.1331, 0.07335), (-0.09957, 0.05551), (-0.06619, 0.03734), (-0.033, 0.01884), (0, 0), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((-3.8, 4.654e-16), (-3.828, -0.0162), (-3.855, -0.03267), (-3.883, -0.04942), (-3.911, -0.06645), (-3.938, -0.08376), (-3.966, -0.1013), (-3.993, -0.1192), (-4.02, -0.1374), (-4.047, -0.1558), (-4.074, -0.1745), (-4.101, -0.1935), (-4.128, -0.2128), (-4.155, -0.2324), (-4.182, -0.2523), (-4.208, -0.2725), (-4.235, -0.2929), (-4.261, -0.3137), (-4.288, -0.3347), (-4.314, -0.3561), (-4.34, -0.3777), (-4.366, -0.3997), (-4.392, -0.4219), (-4.418, -0.4445), (-4.443, -0.4673), (-4.469, -0.4905), (-4.494, -0.514), (-4.519, -0.5378), (-4.544, -0.5619), (-4.569, -0.5863), (-4.594, -0.611), (-4.619, -0.636), (-4.643, -0.6614), (-4.668, -0.6871), (-4.692, -0.7131), (-4.716, -0.7394), (-4.74, -0.7661), (-4.764, -0.7931), (-4.787, -0.8204), (-4.811, -0.848), (-4.834, -0.876), (-4.857, -0.9043), (-4.88, -0.933), (-4.903, -0.962), (-4.925, -0.9913), (-4.948, -1.021), (-4.97, -1.051), (-4.992, -1.081), (-5.013, -1.112), (-5.035, -1.143), (-5.056, -1.175), (-5.077, -1.207), (-5.098, -1.239), (-5.119, -1.271), (-5.139, -1.304), (-5.159, -1.337), (-5.179, -1.371), (-5.199, -1.405), (-5.219, -1.44), (-5.238, -1.474), (-5.257, -1.51), (-5.275, -1.545), (-5.294, -1.581), (-5.312, -1.618), (-5.33, -1.654), (-5.347, -1.691), (-5.364, -1.729), (-5.381, -1.767), (-5.398, -1.806), (-5.414, -1.844), (-5.43, -1.884), (-5.445, -1.923), (-5.461, -1.963), (-5.475, -2.004), (-5.49, -2.045), (-5.504, -2.087), (-5.518, -2.129), (-5.531, -2.171), (-5.544, -2.214), (-5.557, -2.257), (-5.569, -2.301), (-5.58, -2.345), (-5.592, -2.39), (-5.602, -2.435), (-5.613, -2.481), (-5.623, -2.528), (-5.632, -2.574), (-5.641, -2.622), (-5.649, -2.67), (-5.657, -2.718), (-5.664, -2.767), (-5.67, -2.817), (-5.676, -2.867), (-5.682, -2.918), (-5.686, -2.969), (-5.69, -3.021), (-5.694, -3.074), (-5.696, -3.127), (-5.698, -3.181), (-5.7, -3.236), (-5.7, -3.291), (-5.7, -3.291), (-5.718, -3.281), (-5.735, -3.27), (-5.753, -3.26), (-5.771, -3.249), (-5.789, -3.238), (-5.806, -3.227), (-5.824, -3.216), (-5.842, -3.205), (-5.86, -3.193), (-5.878, -3.182), (-5.896, -3.17), (-5.914, -3.158), (-5.932, -3.146), (-5.95, -3.134), (-5.968, -3.121), (-5.986, -3.109), (-6.004, -3.096), (-6.022, -3.083), (-6.04, -3.07), (-6.058, -3.056), (-6.076, -3.043), (-6.095, -3.029), (-6.113, -3.015), (-6.131, -3.001), (-6.149, -2.987), (-6.168, -2.972), (-6.186, -2.957), (-6.204, -2.943), (-6.223, -2.927), (-6.241, -2.912), (-6.26, -2.896), (-6.278, -2.881), (-6.297, -2.865), (-6.315, -2.848), (-6.334, -2.832), (-6.353, -2.815), (-6.371, -2.798), (-6.39, -2.781), (-6.409, -2.763), (-6.427, -2.745), (-6.446, -2.727), (-6.465, -2.709), (-6.484, -2.69), (-6.502, -2.672), (-6.521, -2.652), (-6.54, -2.633), (-6.559, -2.613), (-6.578, -2.593), (-6.597, -2.572), (-6.616, -2.552), (-6.635, -2.53), (-6.654, -2.509), (-6.673, -2.487), (-6.692, -2.465), (-6.711, -2.442), (-6.73, -2.419), (-6.75, -2.396), (-6.769, -2.372), (-6.788, -2.348), (-6.807, -2.323), (-6.827, -2.298), (-6.846, -2.272), (-6.865, -2.246), (-6.885, -2.219), (-6.904, -2.192), (-6.923, -2.164), (-6.943, -2.136), (-6.962, -2.107), (-6.982, -2.078), (-7.001, -2.047), (-7.021, -2.016), (-7.04, -1.985), (-7.06, -1.952), (-7.08, -1.919), (-7.099, -1.885), (-7.119, -1.85), (-7.139, -1.814), (-7.159, -1.778), (-7.178, -1.74), (-7.198, -1.701), (-7.218, -1.66), (-7.238, -1.619), (-7.258, -1.576), (-7.278, -1.532), (-7.298, -1.486), (-7.318, -1.438), (-7.338, -1.388), (-7.358, -1.335), (-7.378, -1.281), (-7.398, -1.223), (-7.418, -1.162), (-7.438, -1.098), (-7.458, -1.029), (-7.478, -0.954), (-7.499, -0.8723), (-7.519, -0.7815), (-7.539, -0.678), (-7.559, -0.5545), (-7.58, -0.3927), (-7.6, 9.307e-16), (-7.6, 9.307e-16), (-7.58, 0.3927), (-7.559, 0.5545), (-7.539, 0.678), (-7.519, 0.7815), (-7.499, 0.8723), (-7.478, 0.954), (-7.458, 1.029), (-7.438, 1.098), (-7.418, 1.162), (-7.398, 1.223), (-7.378, 1.281), (-7.358, 1.335), (-7.338, 1.388), (-7.318, 1.438), (-7.298, 1.486), (-7.278, 1.532), (-7.258, 1.576), (-7.238, 1.619), (-7.218, 1.66), (-7.198, 1.701), (-7.178, 1.74), (-7.159, 1.778), (-7.139, 1.814), (-7.119, 1.85), (-7.099, 1.885), (-7.08, 1.919), (-7.06, 1.952), (-7.04, 1.985), (-7.021, 2.016), (-7.001, 2.047), (-6.982, 2.078), (-6.962, 2.107), (-6.943, 2.136), (-6.923, 2.164), (-6.904, 2.192), (-6.885, 2.219), (-6.865, 2.246), (-6.846, 2.272), (-6.827, 2.298), (-6.807, 2.323), (-6.788, 2.348), (-6.769, 2.372), (-6.75, 2.396), (-6.73, 2.419), (-6.711, 2.442), (-6.692, 2.465), (-6.673, 2.487), (-6.654, 2.509), (-6.635, 2.53), (-6.616, 2.552), (-6.597, 2.572), (-6.578, 2.593), (-6.559, 2.613), (-6.54, 2.633), (-6.521, 2.652), (-6.502, 2.672), (-6.484, 2.69), (-6.465, 2.709), (-6.446, 2.727), (-6.427, 2.745), (-6.409, 2.763), (-6.39, 2.781), (-6.371, 2.798), (-6.353, 2.815), (-6.334, 2.832), (-6.315, 2.848), (-6.297, 2.865), (-6.278, 2.881), (-6.26, 2.896), (-6.241, 2.912), (-6.223, 2.927), (-6.204, 2.943), (-6.186, 2.957), (-6.168, 2.972), (-6.149, 2.987), (-6.131, 3.001), (-6.113, 3.015), (-6.095, 3.029), (-6.076, 3.043), (-6.058, 3.056), (-6.04, 3.07), (-6.022, 3.083), (-6.004, 3.096), (-5.986, 3.109), (-5.968, 3.121), (-5.95, 3.134), (-5.932, 3.146), (-5.914, 3.158), (-5.896, 3.17), (-5.878, 3.182), (-5.86, 3.193), (-5.842, 3.205), (-5.824, 3.216), (-5.806, 3.227), (-5.789, 3.238), (-5.771, 3.249), (-5.753, 3.26), (-5.735, 3.27), (-5.718, 3.281), (-5.7, 3.291), (-5.7, 3.291), (-5.7, 3.236), (-5.698, 3.181), (-5.696, 3.127), (-5.694, 3.074), (-5.69, 3.021), (-5.686, 2.969), (-5.682, 2.918), (-5.676, 2.867), (-5.67, 2.817), (-5.664, 2.767), (-5.657, 2.718), (-5.649, 2.67), (-5.641, 2.622), (-5.632, 2.574), (-5.623, 2.528), (-5.613, 2.481), (-5.602, 2.435), (-5.592, 2.39), (-5.58, 2.345), (-5.569, 2.301), (-5.557, 2.257), (-5.544, 2.214), (-5.531, 2.171), (-5.518, 2.129), (-5.504, 2.087), (-5.49, 2.045), (-5.475, 2.004), (-5.461, 1.963), (-5.445, 1.923), (-5.43, 1.884), (-5.414, 1.844), (-5.398, 1.806), (-5.381, 1.767), (-5.364, 1.729), (-5.347, 1.691), (-5.33, 1.654), (-5.312, 1.618), (-5.294, 1.581), (-5.275, 1.545), (-5.257, 1.51), (-5.238, 1.474), (-5.219, 1.44), (-5.199, 1.405), (-5.179, 1.371), (-5.159, 1.337), (-5.139, 1.304), (-5.119, 1.271), (-5.098, 1.239), (-5.077, 1.207), (-5.056, 1.175), (-5.035, 1.143), (-5.013, 1.112), (-4.992, 1.081), (-4.97, 1.051), (-4.948, 1.021), (-4.925, 0.9913), (-4.903, 0.962), (-4.88, 0.933), (-4.857, 0.9043), (-4.834, 0.876), (-4.811, 0.848), (-4.787, 0.8204), (-4.764, 0.7931), (-4.74, 0.7661), (-4.716, 0.7394), (-4.692, 0.7131), (-4.668, 0.6871), (-4.643, 0.6614), (-4.619, 0.636), (-4.594, 0.611), (-4.569, 0.5863), (-4.544, 0.5619), (-4.519, 0.5378), (-4.494, 0.514), (-4.469, 0.4905), (-4.443, 0.4673), (-4.418, 0.4445), (-4.392, 0.4219), (-4.366, 0.3997), (-4.34, 0.3777), (-4.314, 0.3561), (-4.288, 0.3347), (-4.261, 0.3137), (-4.235, 0.2929), (-4.208, 0.2725), (-4.182, 0.2523), (-4.155, 0.2324), (-4.128, 0.2128), (-4.101, 0.1935), (-4.074, 0.1745), (-4.047, 0.1558), (-4.02, 0.1374), (-3.993, 0.1192), (-3.966, 0.1013), (-3.938, 0.08376), (-3.911, 0.06645), (-3.883, 0.04942), (-3.855, 0.03267), (-3.828, 0.0162), (-3.8, 4.654e-16), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((0, 0), (-0.00019, -0.038), (-0.00076, -0.076), (-0.00171, -0.114), (-0.00304, -0.152), (-0.00475, -0.1899), (-0.00684, -0.2279), (-0.00931, -0.2658), (-0.01216, -0.3038), (-0.01539, -0.3417), (-0.019, -0.3795), (-0.02299, -0.4174), (-0.02736, -0.4552), (-0.03211, -0.493), (-0.03724, -0.5307), (-0.04275, -0.5684), (-0.04864, -0.6061), (-0.05491, -0.6437), (-0.06156, -0.6812), (-0.06859, -0.7187), (-0.076, -0.7562), (-0.08379, -0.7936), (-0.09196, -0.8309), (-0.1005, -0.8682), (-0.1094, -0.9054), (-0.1188, -0.9425), (-0.1284, -0.9796), (-0.1385, -1.017), (-0.149, -1.054), (-0.1598, -1.09), (-0.171, -1.127), (-0.1826, -1.164), (-0.1946, -1.2), (-0.2069, -1.237), (-0.2196, -1.273), (-0.2327, -1.309), (-0.2462, -1.346), (-0.2601, -1.382), (-0.2744, -1.418), (-0.289, -1.454), (-0.304, -1.489), (-0.3194, -1.525), (-0.3352, -1.56), (-0.3513, -1.596), (-0.3678, -1.631), (-0.3847, -1.666), (-0.402, -1.701), (-0.4197, -1.736), (-0.4378, -1.771), (-0.4562, -1.805), (-0.475, -1.84), (-0.4942, -1.874), (-0.5138, -1.908), (-0.5337, -1.942), (-0.554, -1.976), (-0.5748, -2.009), (-0.5958, -2.043), (-0.6173, -2.076), (-0.6392, -2.109), (-0.6614, -2.142), (-0.684, -2.175), (-0.707, -2.208), (-0.7304, -2.24), (-0.7541, -2.272), (-0.7782, -2.304), (-0.8027, -2.336), (-0.8276, -2.368), (-0.8529, -2.399), (-0.8786, -2.43), (-0.9046, -2.461), (-0.931, -2.492), (-0.9578, -2.522), (-0.985, -2.553), (-1.013, -2.583), (-1.04, -2.612), (-1.069, -2.642), (-1.097, -2.671), (-1.127, -2.7), (-1.156, -2.729), (-1.186, -2.758), (-1.216, -2.786), (-1.247, -2.814), (-1.278, -2.842), (-1.309, -2.87), (-1.341, -2.897), (-1.373, -2.924), (-1.405, -2.95), (-1.438, -2.977), (-1.471, -3.003), (-1.505, -3.029), (-1.539, -3.054), (-1.573, -3.079), (-1.608, -3.104), (-1.643, -3.129), (-1.679, -3.153), (-1.715, -3.177), (-1.751, -3.2), (-1.788, -3.223), (-1.825, -3.246), (-1.862, -3.269), (-1.9, -3.291), (-1.9, -3.291), (-1.9, -3.247), (-1.899, -3.203), (-1.898, -3.16), (-1.896, -3.117), (-1.894, -3.073), (-1.891, -3.03), (-1.888, -2.987), (-1.884, -2.945), (-1.88, -2.902), (-1.875, -2.86), (-1.87, -2.818), (-1.865, -2.776), (-1.859, -2.734), (-1.853, -2.692), (-1.846, -2.651), (-1.838, -2.609), (-1.831, -2.568), (-1.823, -2.527), (-1.814, -2.487), (-1.805, -2.446), (-1.795, -2.406), (-1.786, -2.366), (-1.775, -2.326), (-1.765, -2.286), (-1.754, -2.247), (-1.742, -2.207), (-1.73, -2.168), (-1.718, -2.129), (-1.705, -2.091), (-1.692, -2.052), (-1.679, -2.014), (-1.665, -1.976), (-1.651, -1.938), (-1.636, -1.901), (-1.622, -1.863), (-1.606, -1.826), (-1.591, -1.789), (-1.575, -1.752), (-1.558, -1.716), (-1.542, -1.68), (-1.525, -1.644), (-1.507, -1.608), (-1.489, -1.573), (-1.471, -1.537), (-1.453, -1.502), (-1.434, -1.468), (-1.415, -1.433), (-1.396, -1.399), (-1.376, -1.365), (-1.356, -1.331), (-1.335, -1.298), (-1.315, -1.264), (-1.294, -1.231), (-1.272, -1.199), (-1.251, -1.166), (-1.229, -1.134), (-1.206, -1.102), (-1.184, -1.07), (-1.161, -1.039), (-1.138, -1.008), (-1.114, -0.977), (-1.091, -0.9465), (-1.067, -0.9161), (-1.042, -0.8861), (-1.018, -0.8563), (-0.9928, -0.8268), (-0.9677, -0.7976), (-0.9422, -0.7687), (-0.9166, -0.74), (-0.8906, -0.7116), (-0.8644, -0.6836), (-0.8379, -0.6558), (-0.8112, -0.6283), (-0.7842, -0.601), (-0.7569, -0.5741), (-0.7294, -0.5475), (-0.7016, -0.5211), (-0.6736, -0.4951), (-0.6454, -0.4694), (-0.6169, -0.4439), (-0.5881, -0.4188), (-0.5592, -0.3939), (-0.53, -0.3694), (-0.5005, -0.3451), (-0.4709, -0.3212), (-0.441, -0.2976), (-0.4109, -0.2743), (-0.3805, -0.2513), (-0.35, -0.2286), (-0.3192, -0.2062), (-0.2882, -0.1842), (-0.257, -0.1624), (-0.2256, -0.141), (-0.1939, -0.1199), (-0.1621, -0.09908), (-0.1301, -0.07862), (-0.09786, -0.05847), (-0.06543, -0.03866), (-0.03281, -0.01916), (0, 0), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((-1.9, -3.291), (-1.9, -3.323), (-1.899, -3.355), (-1.899, -3.388), (-1.898, -3.42), (-1.897, -3.452), (-1.895, -3.485), (-1.893, -3.518), (-1.891, -3.55), (-1.889, -3.583), (-1.886, -3.616), (-1.883, -3.649), (-1.88, -3.682), (-1.876, -3.715), (-1.872, -3.748), (-1.868, -3.781), (-1.864, -3.814), (-1.859, -3.847), (-1.854, -3.881), (-1.849, -3.914), (-1.843, -3.947), (-1.837, -3.981), (-1.83, -4.014), (-1.824, -4.048), (-1.817, -4.082), (-1.81, -4.115), (-1.802, -4.149), (-1.794, -4.183), (-1.786, -4.216), (-1.777, -4.25), (-1.768, -4.284), (-1.759, -4.318), (-1.749, -4.352), (-1.739, -4.386), (-1.728, -4.42), (-1.718, -4.454), (-1.707, -4.488), (-1.695, -4.522), (-1.683, -4.556), (-1.671, -4.59), (-1.658, -4.624), (-1.645, -4.659), (-1.632, -4.693), (-1.618, -4.727), (-1.604, -4.761), (-1.59, -4.795), (-1.575, -4.829), (-1.559, -4.864), (-1.544, -4.898), (-1.527, -4.932), (-1.511, -4.966), (-1.494, -5), (-1.476, -5.035), (-1.458, -5.069), (-1.44, -5.103), (-1.421, -5.137), (-1.402, -5.171), (-1.383, -5.205), (-1.363, -5.239), (-1.342, -5.273), (-1.321, -5.307), (-1.299, -5.341), (-1.278, -5.375), (-1.255, -5.409), (-1.232, -5.443), (-1.209, -5.476), (-1.185, -5.51), (-1.16, -5.544), (-1.135, -5.577), (-1.11, -5.611), (-1.084, -5.644), (-1.057, -5.678), (-1.03, -5.711), (-1.002, -5.744), (-0.9739, -5.777), (-0.945, -5.81), (-0.9156, -5.843), (-0.8855, -5.876), (-0.8549, -5.908), (-0.8236, -5.941), (-0.7917, -5.973), (-0.7592, -6.005), (-0.726, -6.038), (-0.6921, -6.07), (-0.6576, -6.101), (-0.6224, -6.133), (-0.5864, -6.165), (-0.5498, -6.196), (-0.5124, -6.227), (-0.4743, -6.258), (-0.4354, -6.289), (-0.3957, -6.319), (-0.3552, -6.349), (-0.3139, -6.379), (-0.2718, -6.409), (-0.2288, -6.439), (-0.1849, -6.468), (-0.1401, -6.497), (-0.09437, -6.525), (-0.04768, -6.554), (2.838e-09, -6.582), (-2.838e-09, -6.582), (-0.0177, -6.592), (-0.03555, -6.602), (-0.05353, -6.612), (-0.07165, -6.622), (-0.08992, -6.632), (-0.1083, -6.642), (-0.1269, -6.652), (-0.1456, -6.662), (-0.1644, -6.671), (-0.1834, -6.681), (-0.2026, -6.691), (-0.2219, -6.7), (-0.2414, -6.71), (-0.261, -6.719), (-0.2808, -6.729), (-0.3008, -6.738), (-0.3209, -6.747), (-0.3412, -6.756), (-0.3617, -6.766), (-0.3823, -6.775), (-0.4031, -6.784), (-0.4241, -6.793), (-0.4453, -6.801), (-0.4666, -6.81), (-0.4882, -6.819), (-0.5099, -6.828), (-0.5318, -6.836), (-0.554, -6.845), (-0.5763, -6.853), (-0.5988, -6.861), (-0.6215, -6.869), (-0.6445, -6.877), (-0.6676, -6.886), (-0.691, -6.893), (-0.7146, -6.901), (-0.7384, -6.909), (-0.7624, -6.917), (-0.7867, -6.924), (-0.8112, -6.932), (-0.836, -6.939), (-0.861, -6.946), (-0.8863, -6.953), (-0.9118, -6.96), (-0.9376, -6.967), (-0.9636, -6.974), (-0.99, -6.98), (-1.017, -6.987), (-1.043, -6.993), (-1.071, -6.999), (-1.098, -7.005), (-1.126, -7.011), (-1.154, -7.017), (-1.183, -7.023), (-1.211, -7.028), (-1.241, -7.033), (-1.27, -7.038), (-1.3, -7.043), (-1.33, -7.048), (-1.361, -7.052), (-1.392, -7.057), (-1.423, -7.061), (-1.455, -7.065), (-1.488, -7.068), (-1.52, -7.072), (-1.554, -7.075), (-1.587, -7.078), (-1.622, -7.081), (-1.656, -7.083), (-1.692, -7.085), (-1.728, -7.087), (-1.764, -7.088), (-1.801, -7.09), (-1.839, -7.09), (-1.878, -7.091), (-1.917, -7.091), (-1.957, -7.09), (-1.998, -7.09), (-2.04, -7.088), (-2.083, -7.087), (-2.126, -7.084), (-2.171, -7.081), (-2.217, -7.078), (-2.264, -7.073), (-2.312, -7.068), (-2.362, -7.063), (-2.414, -7.056), (-2.467, -7.048), (-2.522, -7.04), (-2.58, -7.03), (-2.639, -7.018), (-2.702, -7.005), (-2.768, -6.99), (-2.838, -6.973), (-2.913, -6.953), (-2.994, -6.93), (-3.083, -6.902), (-3.182, -6.868), (-3.299, -6.824), (-3.45, -6.761), (-3.8, -6.582), (-3.8, -6.582), (-4.13, -6.368), (-4.26, -6.269), (-4.357, -6.19), (-4.436, -6.121), (-4.505, -6.058), (-4.565, -5.999), (-4.62, -5.945), (-4.67, -5.893), (-4.716, -5.843), (-4.758, -5.795), (-4.798, -5.749), (-4.835, -5.704), (-4.871, -5.661), (-4.904, -5.618), (-4.935, -5.577), (-4.965, -5.537), (-4.994, -5.497), (-5.021, -5.459), (-5.047, -5.421), (-5.072, -5.383), (-5.096, -5.347), (-5.119, -5.311), (-5.141, -5.275), (-5.162, -5.24), (-5.182, -5.206), (-5.202, -5.172), (-5.221, -5.138), (-5.239, -5.105), (-5.257, -5.072), (-5.274, -5.04), (-5.29, -5.008), (-5.306, -4.976), (-5.321, -4.945), (-5.336, -4.914), (-5.35, -4.883), (-5.364, -4.853), (-5.378, -4.822), (-5.391, -4.793), (-5.403, -4.763), (-5.415, -4.734), (-5.427, -4.705), (-5.439, -4.676), (-5.45, -4.647), (-5.46, -4.619), (-5.471, -4.591), (-5.481, -4.563), (-5.49, -4.535), (-5.5, -4.508), (-5.509, -4.481), (-5.518, -4.454), (-5.526, -4.427), (-5.534, -4.4), (-5.542, -4.374), (-5.55, -4.347), (-5.558, -4.321), (-5.565, -4.295), (-5.572, -4.27), (-5.578, -4.244), (-5.585, -4.219), (-5.591, -4.193), (-5.597, -4.168), (-5.603, -4.143), (-5.609, -4.119), (-5.614, -4.094), (-5.619, -4.069), (-5.624, -4.045), (-5.629, -4.021), (-5.634, -3.997), (-5.638, -3.973), (-5.643, -3.949), (-5.647, -3.926), (-5.651, -3.902), (-5.654, -3.879), (-5.658, -3.855), (-5.661, -3.832), (-5.664, -3.809), (-5.668, -3.786), (-5.67, -3.764), (-5.673, -3.741), (-5.676, -3.718), (-5.678, -3.696), (-5.681, -3.674), (-5.683, -3.652), (-5.685, -3.629), (-5.687, -3.608), (-5.689, -3.586), (-5.69, -3.564), (-5.692, -3.542), (-5.693, -3.521), (-5.694, -3.499), (-5.695, -3.478), (-5.696, -3.457), (-5.697, -3.436), (-5.698, -3.415), (-5.699, -3.394), (-5.699, -3.373), (-5.7, -3.352), (-5.7, -3.332), (-5.7, -3.311), (-5.7, -3.291), (-5.7, -3.291), (-5.652, -3.318), (-5.604, -3.344), (-5.556, -3.37), (-5.509, -3.394), (-5.462, -3.417), (-5.415, -3.44), (-5.368, -3.462), (-5.321, -3.482), (-5.275, -3.502), (-5.228, -3.521), (-5.182, -3.54), (-5.136, -3.557), (-5.091, -3.574), (-5.045, -3.59), (-5, -3.605), (-4.955, -3.62), (-4.91, -3.634), (-4.866, -3.648), (-4.821, -3.66), (-4.777, -3.672), (-4.733, -3.684), (-4.689, -3.694), (-4.646, -3.705), (-4.602, -3.714), (-4.559, -3.723), (-4.516, -3.732), (-4.473, -3.74), (-4.431, -3.747), (-4.388, -3.754), (-4.346, -3.761), (-4.304, -3.766), (-4.262, -3.772), (-4.221, -3.777), (-4.18, -3.781), (-4.138, -3.785), (-4.097, -3.788), (-4.057, -3.791), (-4.016, -3.794), (-3.976, -3.796), (-3.936, -3.798), (-3.896, -3.799), (-3.856, -3.8), (-3.816, -3.8), (-3.777, -3.8), (-3.738, -3.799), (-3.699, -3.799), (-3.66, -3.797), (-3.622, -3.796), (-3.584, -3.794), (-3.545, -3.791), (-3.508, -3.789), (-3.47, -3.786), (-3.432, -3.782), (-3.395, -3.778), (-3.358, -3.774), (-3.321, -3.77), (-3.284, -3.765), (-3.248, -3.76), (-3.212, -3.754), (-3.176, -3.748), (-3.14, -3.742), (-3.104, -3.736), (-3.069, -3.729), (-3.033, -3.722), (-2.998, -3.714), (-2.964, -3.707), (-2.929, -3.699), (-2.894, -3.691), (-2.86, -3.682), (-2.826, -3.673), (-2.792, -3.664), (-2.759, -3.655), (-2.725, -3.645), (-2.692, -3.635), (-2.659, -3.625), (-2.626, -3.614), (-2.594, -3.603), (-2.561, -3.592), (-2.529, -3.581), (-2.497, -3.57), (-2.465, -3.558), (-2.434, -3.546), (-2.402, -3.534), (-2.371, -3.521), (-2.34, -3.508), (-2.309, -3.495), (-2.279, -3.482), (-2.248, -3.469), (-2.218, -3.455), (-2.188, -3.441), (-2.159, -3.427), (-2.129, -3.413), (-2.1, -3.398), (-2.071, -3.384), (-2.042, -3.369), (-2.013, -3.354), (-1.984, -3.338), (-1.956, -3.323), (-1.928, -3.307), (-1.9, -3.291), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((0, 0), (0.03281, -0.01916), (0.06543, -0.03866), (0.09786, -0.05847), (0.1301, -0.07862), (0.1621, -0.09908), (0.1939, -0.1199), (0.2256, -0.141), (0.257, -0.1624), (0.2882, -0.1842), (0.3192, -0.2062), (0.35, -0.2286), (0.3805, -0.2513), (0.4109, -0.2743), (0.441, -0.2976), (0.4709, -0.3212), (0.5005, -0.3451), (0.53, -0.3694), (0.5592, -0.3939), (0.5881, -0.4188), (0.6169, -0.4439), (0.6454, -0.4694), (0.6736, -0.4951), (0.7016, -0.5211), (0.7294, -0.5475), (0.7569, -0.5741), (0.7842, -0.601), (0.8112, -0.6283), (0.8379, -0.6558), (0.8644, -0.6836), (0.8906, -0.7116), (0.9166, -0.74), (0.9422, -0.7687), (0.9677, -0.7976), (0.9928, -0.8268), (1.018, -0.8563), (1.042, -0.8861), (1.067, -0.9161), (1.091, -0.9465), (1.114, -0.977), (1.138, -1.008), (1.161, -1.039), (1.184, -1.07), (1.206, -1.102), (1.229, -1.134), (1.251, -1.166), (1.272, -1.199), (1.294, -1.231), (1.315, -1.264), (1.335, -1.298), (1.356, -1.331), (1.376, -1.365), (1.396, -1.399), (1.415, -1.433), (1.434, -1.468), (1.453, -1.502), (1.471, -1.537), (1.489, -1.573), (1.507, -1.608), (1.525, -1.644), (1.542, -1.68), (1.558, -1.716), (1.575, -1.752), (1.591, -1.789), (1.606, -1.826), (1.622, -1.863), (1.636, -1.901), (1.651, -1.938), (1.665, -1.976), (1.679, -2.014), (1.692, -2.052), (1.705, -2.091), (1.718, -2.129), (1.73, -2.168), (1.742, -2.207), (1.754, -2.247), (1.765, -2.286), (1.775, -2.326), (1.786, -2.366), (1.795, -2.406), (1.805, -2.446), (1.814, -2.487), (1.823, -2.527), (1.831, -2.568), (1.838, -2.609), (1.846, -2.651), (1.853, -2.692), (1.859, -2.734), (1.865, -2.776), (1.87, -2.818), (1.875, -2.86), (1.88, -2.902), (1.884, -2.945), (1.888, -2.987), (1.891, -3.03), (1.894, -3.073), (1.896, -3.117), (1.898, -3.16), (1.899, -3.203), (1.9, -3.247), (1.9, -3.291), (1.9, -3.291), (1.862, -3.269), (1.825, -3.246), (1.788, -3.223), (1.751, -3.2), (1.715, -3.177), (1.679, -3.153), (1.643, -3.129), (1.608, -3.104), (1.573, -3.079), (1.539, -3.054), (1.505, -3.029), (1.471, -3.003), (1.438, -2.977), (1.405, -2.95), (1.373, -2.924), (1.341, -2.897), (1.309, -2.87), (1.278, -2.842), (1.247, -2.814), (1.216, -2.786), (1.186, -2.758), (1.156, -2.729), (1.127, -2.7), (1.097, -2.671), (1.069, -2.642), (1.04, -2.612), (1.013, -2.583), (0.985, -2.553), (0.9578, -2.522), (0.931, -2.492), (0.9046, -2.461), (0.8786, -2.43), (0.8529, -2.399), (0.8276, -2.368), (0.8028, -2.336), (0.7782, -2.304), (0.7541, -2.272), (0.7304, -2.24), (0.707, -2.208), (0.684, -2.175), (0.6614, -2.142), (0.6392, -2.109), (0.6173, -2.076), (0.5958, -2.043), (0.5748, -2.009), (0.554, -1.976), (0.5337, -1.942), (0.5138, -1.908), (0.4942, -1.874), (0.475, -1.84), (0.4562, -1.805), (0.4378, -1.771), (0.4197, -1.736), (0.402, -1.701), (0.3847, -1.666), (0.3678, -1.631), (0.3513, -1.596), (0.3352, -1.56), (0.3194, -1.525), (0.304, -1.489), (0.289, -1.454), (0.2744, -1.418), (0.2601, -1.382), (0.2462, -1.346), (0.2327, -1.309), (0.2196, -1.273), (0.2069, -1.237), (0.1946, -1.2), (0.1826, -1.164), (0.171, -1.127), (0.1598, -1.09), (0.149, -1.054), (0.1385, -1.017), (0.1284, -0.9796), (0.1187, -0.9425), (0.1094, -0.9054), (0.1005, -0.8682), (0.09196, -0.8309), (0.08379, -0.7936), (0.076, -0.7562), (0.06859, -0.7187), (0.06156, -0.6812), (0.05491, -0.6437), (0.04864, -0.6061), (0.04275, -0.5684), (0.03724, -0.5307), (0.03211, -0.493), (0.02736, -0.4552), (0.02299, -0.4174), (0.019, -0.3795), (0.01539, -0.3417), (0.01216, -0.3038), (0.00931, -0.2658), (0.00684, -0.2279), (0.00475, -0.1899), (0.00304, -0.152), (0.00171, -0.114), (0.00076, -0.076), (0.00019, -0.038), (0, 0), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((1.9, -3.291), (1.928, -3.307), (1.956, -3.323), (1.984, -3.338), (2.013, -3.354), (2.042, -3.369), (2.071, -3.384), (2.1, -3.398), (2.129, -3.413), (2.159, -3.427), (2.188, -3.441), (2.218, -3.455), (2.248, -3.469), (2.279, -3.482), (2.309, -3.495), (2.34, -3.508), (2.371, -3.521), (2.402, -3.534), (2.434, -3.546), (2.465, -3.558), (2.497, -3.57), (2.529, -3.581), (2.561, -3.592), (2.594, -3.603), (2.626, -3.614), (2.659, -3.625), (2.692, -3.635), (2.725, -3.645), (2.759, -3.655), (2.792, -3.664), (2.826, -3.673), (2.86, -3.682), (2.894, -3.691), (2.929, -3.699), (2.964, -3.707), (2.998, -3.714), (3.033, -3.722), (3.069, -3.729), (3.104, -3.736), (3.14, -3.742), (3.176, -3.748), (3.212, -3.754), (3.248, -3.76), (3.284, -3.765), (3.321, -3.77), (3.358, -3.774), (3.395, -3.778), (3.432, -3.782), (3.47, -3.786), (3.508, -3.789), (3.545, -3.791), (3.584, -3.794), (3.622, -3.796), (3.66, -3.797), (3.699, -3.799), (3.738, -3.799), (3.777, -3.8), (3.816, -3.8), (3.856, -3.8), (3.896, -3.799), (3.936, -3.798), (3.976, -3.796), (4.016, -3.794), (4.057, -3.791), (4.097, -3.788), (4.138, -3.785), (4.18, -3.781), (4.221, -3.777), (4.262, -3.772), (4.304, -3.766), (4.346, -3.761), (4.388, -3.754), (4.431, -3.747), (4.473, -3.74), (4.516, -3.732), (4.559, -3.723), (4.602, -3.714), (4.646, -3.705), (4.689, -3.694), (4.733, -3.684), (4.777, -3.672), (4.821, -3.66), (4.866, -3.648), (4.91, -3.634), (4.955, -3.62), (5, -3.605), (5.045, -3.59), (5.091, -3.574), (5.136, -3.557), (5.182, -3.54), (5.228, -3.521), (5.275, -3.502), (5.321, -3.482), (5.368, -3.462), (5.415, -3.44), (5.462, -3.417), (5.509, -3.394), (5.556, -3.37), (5.604, -3.344), (5.652, -3.318), (5.7, -3.291), (5.7, -3.291), (5.7, -3.311), (5.7, -3.332), (5.7, -3.352), (5.699, -3.373), (5.699, -3.394), (5.698, -3.415), (5.697, -3.436), (5.696, -3.457), (5.695, -3.478), (5.694, -3.499), (5.693, -3.521), (5.692, -3.542), (5.69, -3.564), (5.689, -3.586), (5.687, -3.608), (5.685, -3.629), (5.683, -3.652), (5.681, -3.674), (5.678, -3.696), (5.676, -3.718), (5.673, -3.741), (5.67, -3.764), (5.668, -3.786), (5.664, -3.809), (5.661, -3.832), (5.658, -3.855), (5.654, -3.879), (5.651, -3.902), (5.647, -3.926), (5.643, -3.949), (5.638, -3.973), (5.634, -3.997), (5.629, -4.021), (5.624, -4.045), (5.619, -4.069), (5.614, -4.094), (5.609, -4.119), (5.603, -4.143), (5.597, -4.168), (5.591, -4.193), (5.585, -4.219), (5.578, -4.244), (5.572, -4.27), (5.565, -4.295), (5.558, -4.321), (5.55, -4.347), (5.542, -4.374), (5.534, -4.4), (5.526, -4.427), (5.518, -4.454), (5.509, -4.481), (5.5, -4.508), (5.49, -4.535), (5.481, -4.563), (5.471, -4.591), (5.46, -4.619), (5.45, -4.647), (5.439, -4.676), (5.427, -4.705), (5.415, -4.734), (5.403, -4.763), (5.391, -4.793), (5.378, -4.822), (5.364, -4.853), (5.35, -4.883), (5.336, -4.914), (5.321, -4.945), (5.306, -4.976), (5.29, -5.008), (5.274, -5.04), (5.257, -5.072), (5.239, -5.105), (5.221, -5.138), (5.202, -5.172), (5.182, -5.206), (5.162, -5.24), (5.141, -5.275), (5.119, -5.311), (5.096, -5.347), (5.072, -5.383), (5.047, -5.421), (5.021, -5.459), (4.994, -5.497), (4.965, -5.537), (4.935, -5.577), (4.904, -5.618), (4.871, -5.661), (4.835, -5.704), (4.798, -5.749), (4.758, -5.795), (4.716, -5.843), (4.67, -5.893), (4.62, -5.945), (4.565, -5.999), (4.505, -6.058), (4.436, -6.121), (4.357, -6.19), (4.26, -6.269), (4.13, -6.368), (3.8, -6.582), (3.8, -6.582), (3.45, -6.761), (3.299, -6.824), (3.182, -6.868), (3.083, -6.902), (2.994, -6.93), (2.913, -6.953), (2.838, -6.973), (2.768, -6.99), (2.702, -7.005), (2.639, -7.018), (2.58, -7.03), (2.522, -7.04), (2.467, -7.048), (2.414, -7.056), (2.362, -7.063), (2.312, -7.068), (2.264, -7.073), (2.217, -7.078), (2.171, -7.081), (2.126, -7.084), (2.083, -7.087), (2.04, -7.088), (1.998, -7.09), (1.957, -7.09), (1.917, -7.091), (1.878, -7.091), (1.839, -7.09), (1.801, -7.09), (1.764, -7.088), (1.728, -7.087), (1.692, -7.085), (1.656, -7.083), (1.622, -7.081), (1.587, -7.078), (1.554, -7.075), (1.52, -7.072), (1.488, -7.068), (1.455, -7.065), (1.423, -7.061), (1.392, -7.057), (1.361, -7.052), (1.33, -7.048), (1.3, -7.043), (1.27, -7.038), (1.241, -7.033), (1.211, -7.028), (1.183, -7.023), (1.154, -7.017), (1.126, -7.011), (1.098, -7.005), (1.071, -6.999), (1.043, -6.993), (1.017, -6.987), (0.99, -6.98), (0.9636, -6.974), (0.9376, -6.967), (0.9118, -6.96), (0.8863, -6.953), (0.861, -6.946), (0.836, -6.939), (0.8112, -6.932), (0.7867, -6.924), (0.7624, -6.917), (0.7384, -6.909), (0.7146, -6.901), (0.691, -6.893), (0.6676, -6.886), (0.6445, -6.877), (0.6215, -6.869), (0.5988, -6.861), (0.5763, -6.853), (0.554, -6.845), (0.5318, -6.836), (0.5099, -6.828), (0.4882, -6.819), (0.4666, -6.81), (0.4453, -6.801), (0.4241, -6.793), (0.4031, -6.784), (0.3823, -6.775), (0.3617, -6.766), (0.3412, -6.756), (0.3209, -6.747), (0.3008, -6.738), (0.2808, -6.729), (0.261, -6.719), (0.2414, -6.71), (0.2219, -6.7), (0.2026, -6.691), (0.1834, -6.681), (0.1644, -6.671), (0.1456, -6.662), (0.1269, -6.652), (0.1083, -6.642), (0.08992, -6.632), (0.07165, -6.622), (0.05353, -6.612), (0.03555, -6.602), (0.0177, -6.592), (2.838e-09, -6.582), (-2.838e-09, -6.582), (0.04768, -6.554), (0.09437, -6.525), (0.1401, -6.497), (0.1849, -6.468), (0.2288, -6.439), (0.2718, -6.409), (0.3139, -6.379), (0.3552, -6.349), (0.3957, -6.319), (0.4354, -6.289), (0.4743, -6.258), (0.5124, -6.227), (0.5498, -6.196), (0.5864, -6.165), (0.6224, -6.133), (0.6576, -6.101), (0.6921, -6.07), (0.726, -6.038), (0.7592, -6.005), (0.7917, -5.973), (0.8236, -5.941), (0.8549, -5.908), (0.8855, -5.876), (0.9156, -5.843), (0.945, -5.81), (0.9739, -5.777), (1.002, -5.744), (1.03, -5.711), (1.057, -5.678), (1.084, -5.644), (1.11, -5.611), (1.135, -5.577), (1.16, -5.544), (1.185, -5.51), (1.209, -5.476), (1.232, -5.443), (1.255, -5.409), (1.278, -5.375), (1.299, -5.341), (1.321, -5.307), (1.342, -5.273), (1.363, -5.239), (1.383, -5.205), (1.402, -5.171), (1.421, -5.137), (1.44, -5.103), (1.458, -5.069), (1.476, -5.035), (1.494, -5), (1.511, -4.966), (1.527, -4.932), (1.544, -4.898), (1.559, -4.864), (1.575, -4.829), (1.59, -4.795), (1.604, -4.761), (1.618, -4.727), (1.632, -4.693), (1.645, -4.659), (1.658, -4.624), (1.671, -4.59), (1.683, -4.556), (1.695, -4.522), (1.707, -4.488), (1.718, -4.454), (1.728, -4.42), (1.739, -4.386), (1.749, -4.352), (1.759, -4.318), (1.768, -4.284), (1.777, -4.25), (1.786, -4.216), (1.794, -4.183), (1.802, -4.149), (1.81, -4.115), (1.817, -4.082), (1.824, -4.048), (1.83, -4.014), (1.837, -3.981), (1.843, -3.947), (1.849, -3.914), (1.854, -3.881), (1.859, -3.847), (1.864, -3.814), (1.868, -3.781), (1.872, -3.748), (1.876, -3.715), (1.88, -3.682), (1.883, -3.649), (1.886, -3.616), (1.889, -3.583), (1.891, -3.55), (1.893, -3.518), (1.895, -3.485), (1.897, -3.452), (1.898, -3.42), (1.899, -3.388), (1.899, -3.355), (1.9, -3.323), (1.9, -3.291), close: true, stroke: (thickness: 0.25pt, miter-limit: 10))
  line((0, 0), (7.6, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((0, 0), (3.8, 6.582), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((0, 0), (-3.8, 6.582), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((0, 0), (-7.6, 9.307e-16), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((0, 0), (-3.8, -6.582), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  line((0, 0), (3.8, -6.582), stroke: (paint: rgb("#bfbfbf"), thickness: 0.35pt, miter-limit: 10, dash: "densely-dotted"))
  circle((0, 0), radius: 0.0456, fill: rgb("#ffffff"), stroke: (paint: rgb("#8c8c8c"), thickness: 0.3pt, miter-limit: 10))
  line((-4.904, 0.7128), (-2.407, 3.577), stroke: (paint: rgb("#00008c"), thickness: 0.9pt, miter-limit: 10))
  line((-2.407, 3.577), (1.322, 2.847), stroke: (paint: rgb("#00008c"), thickness: 0.9pt, miter-limit: 10))
  line((1.322, 2.847), (-1.175, -0.01722), stroke: (paint: rgb("#00008c"), thickness: 0.9pt, miter-limit: 10))
  line((-1.175, -0.01722), (-4.904, 0.7128), stroke: (paint: rgb("#00008c"), thickness: 0.9pt, miter-limit: 10))
  line((-2.407, 3.577), (-1.175, -0.01722), stroke: (paint: rgb("#00008c"), thickness: 0.9pt, miter-limit: 10))
  line((-4.904, 0.7128), (-4.407, 4.48), stroke: (paint: rgb("#595959"), thickness: 0.9pt, miter-limit: 10, dash: "densely-dashed"))
  line((-4.407, 4.48), (-0.8959, 5.933), stroke: (paint: rgb("#595959"), thickness: 0.9pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.8959, 5.933), (-1.393, 2.166), stroke: (paint: rgb("#595959"), thickness: 0.9pt, miter-limit: 10, dash: "densely-dashed"))
  line((-1.393, 2.166), (-4.904, 0.7128), stroke: (paint: rgb("#595959"), thickness: 0.9pt, miter-limit: 10, dash: "densely-dashed"))
  line((-4.407, 4.48), (-1.393, 2.166), stroke: (paint: rgb("#595959"), thickness: 0.9pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.322, 2.847), (-0.8959, 5.933), stroke: (paint: rgb("#b25a00"), thickness: 1.5pt, miter-limit: 10))
  content((0.3893, 4.39), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$1$]]], anchor: "west", padding: 0.1176cm)
  circle((-4.904, 0.7128), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-4.94, 0.7128), [$z_0$], anchor: "east")
  circle((-2.407, 3.577), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-2.407, 3.613), [$z_A$], anchor: "south")
  circle((-1.175, -0.01722), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-1.175, -0.0525), [$z_B$], anchor: "north")
  circle((1.322, 2.847), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((1.357, 2.847), [$z_T$], anchor: "west")
  circle((-4.407, 4.48), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-4.442, 4.48), [$z_(u A)$], anchor: "east")
  circle((-1.393, 2.166), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-1.368, 2.141), [$z_(u B)$], anchor: "north-west")
  circle((-0.8959, 5.933), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-0.8959, 5.968), [$z_(u T)$], anchor: "south")
})],
  caption: [Figure 3: The Moser graph in the placement $z_g$. All eleven drawn edges have unit length. The two triangles sharing $z_A z_B$ force $z_0 \, z_T$ to have the same color in any proper three-coloring; the dashed diamond forces $z_0 \, z_(u T)$ to have the same color. The highlighted edge $z_T z_(u T)$ contradicts these equalities. The shading gives a cropped view of the open region (8.4), using sampled analytic boundaries; the boundaries and radii zero, one, and two are excluded. Dotted rays mark the sector boundaries at multiples of $pi \/ 3$. The rational certificate in Section 8.6 proves strict membership of every vertex in that region, which is restricted almost everywhere to three labels. ],
) <fig:moser-placement>

The following certificate gives the strict membership needed to finish the geometric argument.

#thm([Lemma 8.9.])[
  (Seven-point certificate).  #emph[Every $z_g$ in (8.6) satisfies $0 < \| z_g \|^2 < 4$ and (8.4).]
] <lem:angular-certificate>

The full rational verification is given in Section 8.6. We first use the certificate to finish the geometric argument.

#thm([Proposition 8.10.])[
  #emph[The extracted interface cycle cannot have length three.]
] <prop:angular-three>

#proof[
  Lemmas 49 and 50 give, for each of the seven points $x + z_g$,
    an open neighborhood restricted almost everywhere to the triangle labels.
    Choose $rho > 0$ so that each point remains in its corresponding neighborhood after any common translation $t
    in B \( 0 \, rho \)$. For each vertex, the translations that put it outside the typical set,
    or in the null subset where a nontriangle label occurs, form a null set.
    The union of these seven exceptional translation sets is null. Choose $t$ outside that union.
    All seven translated vertices are then typical and use the three triangle labels.
    Their unit edges are preserved by the placement and common translation,
    and typical-point properness gives a proper three-coloring of the graph in (8.5).
    The two shared-edge triangle pairs proved that this graph has no such coloring. ◻
]

#proof[
  If a weak measurable five-coloring existed, Proposition 34 would produce an interface cycle of length three,
    four, or five with the common-center and exclusion properties used above.
    Propositions 43, 46, and 51 exclude all three possibilities. Thus no weak measurable five-coloring exists. ◻
]

=== 8.6 Rational verification of the seven-point certificate <sec:angular-certificate-verification>

All terminating decimals in this verification denote exact rational numbers.

#proof[
  Table 1 gives coordinate centers $\( xi_0 \, upsilon_0 \)$, each within $h =
    0.00011$ of the corresponding exact coordinate of $z_g$, and strict upper and lower polynomial bounds.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$g$
], table.cell(rowspan: 1, colspan: 1)[$xi_0$
], table.cell(rowspan: 1, colspan: 1)[$upsilon_0$
], table.cell(rowspan: 1, colspan: 1)[$P_(+)$
], table.cell(rowspan: 1, colspan: 1)[$P'_(-)$
]),
  table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$- 1.2906$
], table.cell(rowspan: 1, colspan: 1)[$0.1876$
], table.cell(rowspan: 1, colspan: 1)[$0.90$
], table.cell(rowspan: 1, colspan: 1)[$1.35$
],
  table.cell(rowspan: 1, colspan: 1)[$A$
], table.cell(rowspan: 1, colspan: 1)[$- 0.6335$
], table.cell(rowspan: 1, colspan: 1)[$0.9414$
], table.cell(rowspan: 1, colspan: 1)[$0.095$
], table.cell(rowspan: 1, colspan: 1)[$0.110$
],
  table.cell(rowspan: 1, colspan: 1)[$B$
], table.cell(rowspan: 1, colspan: 1)[$- 0.3092$
], table.cell(rowspan: 1, colspan: 1)[$- 0.0045$
], table.cell(rowspan: 1, colspan: 1)[$0.000002$
], table.cell(rowspan: 1, colspan: 1)[$0.00065$
],
  table.cell(rowspan: 1, colspan: 1)[$T$
], table.cell(rowspan: 1, colspan: 1)[$0.3478$
], table.cell(rowspan: 1, colspan: 1)[$0.7493$
], table.cell(rowspan: 1, colspan: 1)[$0.023$
], table.cell(rowspan: 1, colspan: 1)[$0.026$
],
  table.cell(rowspan: 1, colspan: 1)[$u A$
], table.cell(rowspan: 1, colspan: 1)[$- 1.1598$
], table.cell(rowspan: 1, colspan: 1)[$1.1790$
], table.cell(rowspan: 1, colspan: 1)[$9.8$
], table.cell(rowspan: 1, colspan: 1)[$19.0$
],
  table.cell(rowspan: 1, colspan: 1)[$u B$
], table.cell(rowspan: 1, colspan: 1)[$- 0.3666$
], table.cell(rowspan: 1, colspan: 1)[$0.5700$
], table.cell(rowspan: 1, colspan: 1)[$0.0022$
], table.cell(rowspan: 1, colspan: 1)[$0.024$
],
  table.cell(rowspan: 1, colspan: 1)[$u T$
], table.cell(rowspan: 1, colspan: 1)[$- 0.2358$
], table.cell(rowspan: 1, colspan: 1)[$1.5614$
], table.cell(rowspan: 1, colspan: 1)[$12.65$
], table.cell(rowspan: 1, colspan: 1)[$12.9$
],
)
]],
    caption: [Table 1: Coordinate boxes and bounds $P < P_(+) < P'_(-) < P'$. ],
  )
  Here are explicit checks of the boxes and polynomial bounds. Squaring rational endpoints proves
  $ 1.73205 < sqrt(3) < 1.73206 \, wide 3.31662 < sqrt(11) < 3.31663 . $
  Put $a_(*) = 1.732055$, $b_(*) = 3.316625$, and $epsilon.alt = 0.000005$.
    Replacing the two radicals by these midpoints changes their product by less than
  $ \( a_(*) + b_(*) \) epsilon.alt + epsilon.alt^2 = 0.000025243425 < 0.000026 . $
  The coordinates of the three products in (8.5) are
  $ u A & = (frac(5 sqrt(3) - sqrt(11), 12) \, frac(sqrt(33) + 5, 12)) \,\
u B & = (frac(5 sqrt(3) + sqrt(11), 12) \, frac(sqrt(33) - 5, 12)) \,\
u T & = (frac(5 sqrt(3), 6) \, sqrt(33) / 6) . $
  For each coordinate of every $g$, the midpoint substitution therefore has error at most $epsilon.alt$:
    the largest product error is less than $0.000026 \/ 6 < epsilon.alt$,
    and the other coefficients give this bound directly. The rotation in (8.6) has absolute row sum $47 \/ 37$.
    For an exact check of the displayed centers, let $tilde(z)_g$ denote the placed point after this rational
    midpoint substitution. Direct substitution gives the residuals
  $ tilde(z)_g - \( xi_0 + i upsilon_0 \) = frac(d_x + i d_y, 710400000000) \, wide g & d_x & d_y\
0 & 3840000 & - 23040000\
A & - 29520000 & 10176000\
B & - 12240000 & - 22464000\
T & 25440000 & 10752000\
u A & 32043244 & - 19212795\
u B & 4763244 & - 27212795\
u T & 32966488 & - 23385590 $
  Every residual numerator has magnitude less than $35520000 = 710400000000 \/ 20000$,
    proving that the midpoint-substituted coordinates have the stated four-decimal roundings,
    with error less than $0.00005$. Thus every final coordinate error is bounded by
  $ 47 / 37 epsilon.alt + 0.00005 < 0.00011 = h . $
  For completeness, the remaining interval calculations reduce to the small rational factors in Table 2. Define
  $ x_l & = \( \| xi_0 \| - h \)^2 \, & x_u & = \( \| xi_0 \| + h \)^2 \,\
y_l & = \( \| upsilon_0 \| - h \)^2 \, & y_u & = \( \| upsilon_0 \| + h \)^2 \,\
l_l & = x_l + y_l \, & l_u & = x_u + y_u \,\
H & = max \( \| 3 x_l - y_u \| \, \| 3 x_u - y_l \| \) . $
  All listed absolute coordinate centers exceed $h$, so these intervals enclose $xi^2 \, upsilon^2 \, l$.
    In each row the factors in the second table satisfy
  $ y_u < b_y \, wide H < b_H \, wide a < l_l lt.eq l_u < b . $
  These claims require only squaring integers: with $M = 10^5$, $m = M \| xi_0 \|$, $n = M \| upsilon_0 \|$,
    the four squared-coordinate endpoints are
  $ \( x_l \, x_u \, y_l \, y_u \) = 1 /
    10^10 #scale(x: 120%, y: 120%)[\(] \( m - 11 \)^2 \, \( m + 11 \)^2 \, \( n - 11 \)^2 \, \( n + 11 \)^2
    #scale(x: 120%, y: 120%)[\)] . $
  Thus every entry is verifiable using the displayed coordinate integers, without evaluation of an irrational number.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$g$
], table.cell(rowspan: 1, colspan: 1)[$b_y$
], table.cell(rowspan: 1, colspan: 1)[$b_H$
], table.cell(rowspan: 1, colspan: 1)[$a$
], table.cell(rowspan: 1, colspan: 1)[$b$
]),
  table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$0.0353$
], table.cell(rowspan: 1, colspan: 1)[$4.963$
], table.cell(rowspan: 1, colspan: 1)[$1.70$
], table.cell(rowspan: 1, colspan: 1)[$1.71$
],
  table.cell(rowspan: 1, colspan: 1)[$A$
], table.cell(rowspan: 1, colspan: 1)[$0.887$
], table.cell(rowspan: 1, colspan: 1)[$0.319$
], table.cell(rowspan: 1, colspan: 1)[$1.28$
], table.cell(rowspan: 1, colspan: 1)[$1.29$
],
  table.cell(rowspan: 1, colspan: 1)[$B$
], table.cell(rowspan: 1, colspan: 1)[$0.000022$
], table.cell(rowspan: 1, colspan: 1)[$0.287$
], table.cell(rowspan: 1, colspan: 1)[$0.095$
], table.cell(rowspan: 1, colspan: 1)[$0.096$
],
  table.cell(rowspan: 1, colspan: 1)[$T$
], table.cell(rowspan: 1, colspan: 1)[$0.562$
], table.cell(rowspan: 1, colspan: 1)[$0.199$
], table.cell(rowspan: 1, colspan: 1)[$0.682$
], table.cell(rowspan: 1, colspan: 1)[$0.683$
],
  table.cell(rowspan: 1, colspan: 1)[$u A$
], table.cell(rowspan: 1, colspan: 1)[$1.391$
], table.cell(rowspan: 1, colspan: 1)[$2.647$
], table.cell(rowspan: 1, colspan: 1)[$2.73$
], table.cell(rowspan: 1, colspan: 1)[$2.74$
],
  table.cell(rowspan: 1, colspan: 1)[$u B$
], table.cell(rowspan: 1, colspan: 1)[$0.326$
], table.cell(rowspan: 1, colspan: 1)[$0.079$
], table.cell(rowspan: 1, colspan: 1)[$0.459$
], table.cell(rowspan: 1, colspan: 1)[$0.46$
],
  table.cell(rowspan: 1, colspan: 1)[$u T$
], table.cell(rowspan: 1, colspan: 1)[$2.44$
], table.cell(rowspan: 1, colspan: 1)[$2.273$
], table.cell(rowspan: 1, colspan: 1)[$2.493$
], table.cell(rowspan: 1, colspan: 1)[$2.495$
],
)
]],
    caption: [Table 2: Rational factors bounding the squared-coordinate boxes. ],
  )
  Every interval $\( a \, b \)$ lies in $\( 0 \, 4 \)$ and avoids one. The polynomial factors are therefore bounded by
  $ P & lt.eq y_u H^2 < b_y b_H^2 < P_(+) \,\
P' & gt.eq l_l^3 \( 1 - l_u \/ 4 \) min \( \| l_l - 1 \| \, \| l_u - 1 \| \)^2\
 & > a^3 \( 1 - b \/ 4 \) min \( \| a - 1 \| \, \| b - 1 \| \)^2 > P'_(-) . $
  The last inequalities are direct rational products of the second table, with the target bounds in the first.
    For example, its final row gives
  $ 2.44 \( 2.273 \)^2 < 12.65 \, wide \( 2.493 \)^3 \( 1 - 2.495 \/ 4 \) \( 1.493 \)^2 > 12.9 . $
  The other six rows give the corresponding displayed strict bounds by the same two products.
    The squared-radius intervals also lie respectively in
  $ \( 1.70 \, 1.71 \) \, med \( 1.28 \, 1.29 \) \, med \( 0.095 \, 0.096 \) \, med \( 0.68 \, 0.69 \) \,
    med \( 2.73 \, 2.74 \) \, med \( 0.459 \, 0.46 \) \, med \( 2.49 \, 2.50 \) . $
  Finally $P_(+) < P'_(-)$ in every row of Table 1. This proves (8.4) and the radius conditions for all seven
    vertices. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
