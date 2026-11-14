#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A hyperbolic group with no geometric CAT(0) action]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

A linear isoperimetric inequality is a large-scale expression of negative curvature:
  for finitely presented groups, it characterizes word hyperbolicity.
  Local comparison geometry is more restrictive. The geometric realization question asks whether every hyperbolic
  group admits a geometric action on a proper $"CAT" \( 0 \)$ space, or on a proper $"CAT" \( - 1 \)$ space.
  We construct a group for which neither action exists.

Throughout the paper, a #emph[geometric action] is a proper, cocompact action by isometries,
  and metric models of finite complexes carry geodesic length metrics inducing the given complex topology.

#thm([Theorem 1.1.])[
  #emph[There exist a finite connected two-dimensional aspherical simplicial complex $K$ and a constant $C <
    oo$ with the following properties.]
  + #emph[Every combinatorial edge loop of length $ell$ in the universal cover of $K$ bounds a disk diagram with
    at most $C ell$ triangular faces.]
  + #emph[The group $pi_1 K$ admits no geometric action on a proper complete $"CAT" \( 0 \)$ space.]
  #emph[In particular, $pi_1 K$ is word-hyperbolic, and no finite simplicial complex homotopy equivalent to $K$
    admits a locally $"CAT" \( 0 \)$ geodesic length metric inducing its given topology.
    Consequently, no such model admits a compatible locally $"CAT" \( - 1 \)$ geodesic length metric.]
] <thm:main>

The proof is an existence argument and does not give an effective size for $K$.
  The filling constant may depend on the selected finite presentation.

=== 1.1 Context <context>

The realization problem goes back to the development of hyperbolic groups.
  In his account of that development, Gromov recalls introducing linear isoperimetry as a group-theoretic form of
  negative curvature and then spending years seeking geometric realizations by negatively curved
  spaces #cite(label("RaussenSkau2010")) p. 396. The equivalence between linear filling and word hyperbolicity
  became part of the foundational theory #cite(label("Gromov1987"));
  see also #cite(label("BH1999")) Theorem III.$Gamma$.2.6 and Remark III.$Gamma$.2.7(2).
  The $"CAT" \( - 1 \)$ realization question appears as Problem H11 in Baumslag–Myasnikov–Shpilrain’s 1999 problem
  list #cite(label("BaumslagMyasnikovShpilrain1999")). Both the $"CAT" \( - 1 \)$ and $"CAT" \( 0 \)$ questions
  appear as open problems in Stark’s 2025 survey #cite(label("Stark2025")) Open Problem 2.15 and in the March 2026
  preprint of Duchesne–Simon #cite(label("DuchesneSimon2026")) Question W.

There are several successful ways to obtain such geometric actions.
  Finitely generated free groups act on trees and closed hyperbolic manifold groups act on hyperbolic space.
  More generally, a finite complex carrying a locally $"CAT" \( - 1 \)$ or locally $"CAT" \( 0 \)$ geodesic length
  metric inducing its topology has a universal cover with the corresponding global curvature bound;
  its deck action is geometric #cite(label("BH1999")) Theorem II.4.1.
  Cubulation provides another route to $"CAT" \( 0 \)$ models.
  For example, Ollivier–Wise prove that random groups in the density model at density less than $1 \/
  6$ act freely and cocompactly on $"CAT" \( 0 \)$ cube complexes with probability tending to one as relator
  length grows, with the number of generators fixed #cite(label("OllivierWise2011")) Theorem 10.4.
  Thus random presentations can produce geometric $"CAT" \( 0 \)$ actions as well as hyperbolicity;
  the relations used here must enforce an additional obstruction.

Dimension restrictions already yield obstructions. Brady–Crisp #cite(label("BradyCrisp2007")) Theorem 2 construct
  infinitely many torsion-free hyperbolic groups of geometric dimension two which admit no proper isometric action
  on a proper two-dimensional $"CAT" \( 0 \)$ space. Their Theorem 1 gives a hyperbolic group of $"CAT" \( 0 \)$
  dimension two and $"CAT" \( - 1 \)$ dimension three. These conclusions rely on constraints on translation
  lengths in two-dimensional targets. Theorem 1 excludes geometric $"CAT" \( 0 \)$ actions in every dimension.
  Its finite-model consequence also allows the entire simplicial complex to change within its homotopy type:
  any compatible locally $"CAT" \( 0 \)$ geodesic length metric on such a model would recover a geometric action
  by passing to the universal cover.

Random-presentation proofs of hyperbolicity combine counting for bounded diagrams with a local-to-global argument.
  Our treatment of repeated relator occurrences is related to the multiplicity and constraint methods in
  Ollivier #cite(label("Ollivier2004")) Section 2.2 and
  Antoniuk–Friedgut–Łuczak #cite(label("AntoniukFriedgutLuczak2017")) Section 3.
  Within each finite presentation we first sample small labelled graphs,
  then larger labelled graphs whose required small graphs have already been selected.
  The same prerequisite can support several larger graphs, so its probability cost must be charged only once.
  Section 3 proves the resulting estimate directly.

The obstruction to actions uses the harmonic-energy framework of Gromov #cite(label("Gromov2003")) Sections 3.3
  and 3.7 and Izeki–Nayatani #cite(label("IzekiNayatani2005")).
  In this framework, expansion in a finite graph can force a fixed point when the target satisfies a suitable
  nonlinear spectral inequality. The target hypothesis matters:
  Izeki–Kondo–Nayatani obtain random hyperbolic groups with fixed-point properties for target classes whose
  tangent-cone invariant is bounded by a prescribed constant strictly less than
  one #cite(label("IzekiKondoNayatani2012")) Corollary 3.8.
  Toyoda #cite(label("Toyoda2016")) Theorem 1.4 supplies such spectral bounds for a prescribed finite family of
  geodesically complete $"CAT" \( 0 \)$ spaces admitting proper cocompact actions,
  with constants depending on that family. Here a hypothetical target and its action can be chosen after the
  finite presentation is known. We obtain the required uniformity from bounds on every generator displacement and
  total-variation couplings of table matches. Sturm’s inductive means #cite(label("Sturm2003")) Definition 4.6 and
  Theorem 4.7, proof (a) then turn those couplings into the averaging estimate used in the energy argument.

=== 1.2 Structure of the proof <structure-of-the-proof>

The construction must satisfy two requirements: its relations must be sparse enough to preserve hyperbolicity and
  asphericity, yet impose enough metric constraints to exclude geometric actions on proper $"CAT" \( 0 \)$ spaces.
  We organize the relations using a fixed modification of the incidence graph of the projective plane over
  $bb(F)_2$. Four point vertices are doubled. At one of them we omit one incidence and keep its counterpart at the
  other representative separate. The remaining edges over each point form a small connected graph, called a fan.
  We call the resulting incidence graph the core. Edges receive signed generator labels,
  and every closed walk in a selected labelled graph gives a relation.
  Fans are selected first; a labelled copy of the whole graph is selected only when its seven fan restrictions
  have already been selected. We study copies for which further four-letter relations close every nonbacktracking
  two-edge core path to a square. An independent collection of six-letter relations will control individual
  generator displacements. A labelled core copy together with one chosen square completion for every
  nonbacktracking two-edge core path is a #emph[match].

We choose a sequence of such finite presentations, with progressively stronger finite counting requirements.
  At each stage, a finite list of statistical tests is fixed before choosing the sampling parameters;
  those parameters then remain fixed while the alphabet grows.
  If infinitely many of their groups admitted geometric actions on proper complete $"CAT" \( 0 \)$ spaces,
  choose one action for each of those groups. The closed-walk relations realize the fixed graph by orbit points in
  every chosen action. After normalizing the average squared generator displacement,
  products of these configurations have a limiting configuration in a complete $"CAT" \( 0 \)$ space.
  The counting requirements force exact metric identities in that limit,
  and a finite geometric contradiction excludes it. Thus every sufficiently late group in the chosen sequence
  admits no such action. The argument uses the following three ingredients.

+ #strong[A positive deficit in diagram counting.] A fan shared by several copies of the whole graph supplies only
  one random table entry, so its probability cost must be counted once.
  At the same time, a disk or sphere diagram may use the same relation many times.
  We reconcile these two counts by assigning multiplicity weights to distinct table entries.
  Local incidence estimates at vertices then leave a positive multiple of the diagram’s area to be paid by its
  boundary. This is first proved for bounded fragments. Planar separators extend it to all diagrams,
  yielding both a linear filling inequality and asphericity in Section 3.
+ #strong[Sampling that is uniform over later actions.] The metric argument compares a bounded function of one or
  two edge labels with a further edge label. The relevant tuples need not have dense projections in the sampled
  tables. Instead, we couple several matches so that the conditioning labels agree,
  each match is approximately uniform among all matches, and the further labels are approximately independent
  uniform generators. Section 4 obtains this coupling by gluing copies along an enlarged conditioning tuple and
  proving concentration of the numbers of extensions. The enlargement is chosen by counting exponents so that
  every further collection of label positions has a strictly positive margin.
  The conclusions concern total variation of finite probability laws.
  They therefore apply to bounded tests from any action chosen after the tables are revealed.
  The common conditioning tuple may still depend on the further labels;
  the averaging estimate allows this dependence. The six-letter relations supply the uniform displacement bound
  that makes these tests bounded.
+ #strong[A rigid configuration and incompatible scalar products.] Energy minimization and the coupling yield
  lower bounds for squared orbit distances along short paths.
  In the limit, the decoration squares force squared two-step distances to equal two.
  The six-cycles through three noncollinear point vertices then have a common center,
  and their central triangles are flat (Section 5). The doubled points give four unit vectors obtained by doubling
  certain midpoints in the tangent cone at that center. The line incidences force two of these vectors to have
  nonnegative scalar product. A three-field test involving the separated incidence edge forces the other two
  vectors to be antipodal. Splitting the parallel set of the resulting line exposes a flat square in the
  transverse factor, which makes the first pair antipodal as well.
  Their scalar product is consequently $- 1$, the contradiction in Section 6.

Section 2 defines the finite graph and its random tables.
  Section 7 makes the finite-test selection precise and transfers one resulting finite classifying complex to the
  simplicial model in Theorem 1. Its filling constant may depend on that chosen presentation.

=== 1.3 Conventions <conventions>

A disk diagram may have boundary spurs or edges collapsed to the target’s $1$-skeleton;
  such features have zero area and can be removed. Its area is the number of its noncollapsed $2$-cells.
  Constants in filling estimates may depend on a fixed finite presentation.
  A statement holds #emph[with high probability] if its probability tends to one as the alphabet size tends to
  infinity, with all parameters in that statement fixed. Finite-test limits and the final diagonal selection will
  always be distinguished.

We use completed tangent cones and completed spaces of directions.
  The latter are $"CAT" \( 1 \)$ and the former are $"CAT" \( 0 \)$ #cite(label("BH1999")) Theorem II.3.19.
  For the tangent-cone construction in this generality, see also Kleiner–Leeb #cite(label("KleinerLeeb1997"))
  Section 2.1.3, who credit Nikolaev’s tangent-cone theorem.
  Subsequent products and limits need not be proper; properness is used only for the original geometric actions.
  Standard comparison, covering-space and topological results are cited with the hypotheses needed here.
  All estimates specific to the new construction are proved below.

== 2 The incidence template and the nested tables <sec:model>

We begin with the fixed finite combinatorics. All randomness will be in the labels, not in the template.

=== 2.1 Points, lines, and fans <points-lines-and-fans>

#prodef([Definition 2.1.])[
  (The incidence template).  Identify the points of the projective plane over $bb(F)_2$ with the seven nonzero
    vectors of $bb(F)_2^3$. A line consists of the three nonzero vectors in a two-dimensional subspace. Fix
  $ A = e_1 \, wide B = e_2 \, wide C = e_3 \, wide D = e_1 + e_2 + e_3 . $
  No three of these four points are collinear. For distinct points $i \, j$, write $i j$ for their line.
  The bipartite graph $Gamma$ has a vertex $X_i$ for every point, an additional vertex $Y_i$ for $i in { A \, B \,
    C \, D }$, and a vertex for every line. Both representatives over a point are joined to each incident line,
    with one exception: the edge $Y_D$–$C D$ is omitted. The edge
  $ e_0 = X_D upright("–") C D $
  is called the #emph[loose edge]. Every other edge belongs to the #emph[fan] $F_i$ at its point $i$.
    At $D$, the fan uses only the two lines other than $C D$, so $C D$ is not a vertex of $F_D$.
] <def:template>

Each $F_i$ is connected. At $A \, B \, C$ it is $K_(2 \, 3)$, at $D$ it is $K_(2 \, 2)$,
  and at each of the other three points it is a three-edge star. Let $g = 7$ and $k_i = \| E \( F_i \) \|$. Thus

#[#set math.equation(numbering: n => "(2.1)")
 $ \( k_i \)_i = \( 6 \, 6 \, 6 \, 4 \, 3 \, 3 \, 3 \) \, wide sum_i k_i = 31 \, wide \| E \( Gamma \) \| =
   32 . $ <eq:model-counts>]

The graph has $18$ vertices. Its cycle rank is $15$; the sum of the cycle ranks of the fans is $7$.
  We will first impose the cycles within the fans, then use a smaller graph of cycle rank $8$ to impose the
  remaining core relations. The cone construction below makes this decomposition explicit.

Figures 1 and 2 show the incidence pattern and the exceptional fan.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-2.165, -1.25), (2.165, -1.25), (0, 2.5), close: true, stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((-2.165, -1.25), (1.083, 0.625), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((1.083, 0.625), (2.165, -1.25), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((2.165, -1.25), (-1.083, 0.625), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  circle((0, 0), radius: 1.25, stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 2.5), (0, -1.25), stroke: (paint: rgb("#bf6000"), thickness: 1.35pt, miter-limit: 10))
  circle((-2.165, -1.25), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((2.165, -1.25), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((0, 2.5), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((0, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((0, -1.25), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((-1.083, 0.625), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((1.083, 0.625), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  content((-2.165, -1.25), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$A=e_1$]]])], anchor: "north-east")
  content((2.165, -1.25), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B=e_2$]]])], anchor: "north-west")
  content((0, 2.5), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$C=e_3$]]])], anchor: "south")
  content((0.0875, -0.0375), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$D$]]])], anchor: "north-west")
  content((0, -1.35), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$A+B$]]])], anchor: "north")
  content((-1.17, 0.625), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$A+C$]]])], anchor: "east")
  content((1.17, 0.625), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B+C$]]])], anchor: "west")
  content((0.0625, 0.8125), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#bf6000"))[#text(size: 9pt)[$"CD"$]]]])], anchor: "west")
})],
  caption: [Figure 1: The seven points and seven lines of the Fano plane. The three sides, three medians, and dashed circle each represent one projective line; only marked dots represent projective points. The points $A \, B \, C \, D = A + B + C$ form a quadrangle: no three are collinear. The thick median is the line $C D = { C \, D \, A + B }$, at which the incidence graph is modified. ],
) <fig:fano-template>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-4.838, -1.732), (-1.162, 1.732), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000073"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"), radius: 7pt)
  content((-3, 2.1), [#text(size: 9pt)[$F_C=K_(2,3)$]])
  line((-4.365, 0), (-3, 1.26), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((-3, 1.26), (-1.635, 0), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((-4.365, 0), (-3, 0), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((-3, 0), (-1.635, 0), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((-4.365, 0), (-3, -1.26), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((-3, -1.26), (-1.635, 0), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  circle((-4.365, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((-1.635, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((-3, 1.26), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((-3, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((-3, -1.26), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  content((-4.428, 0), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$X_C$]]])], anchor: "east")
  content((-1.572, 0), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y_C$]]])], anchor: "west")
  content((-3, 1.302), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"AC"$]]])], anchor: "south")
  content((-3, 0.042), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"BC"$]]])], anchor: "south")
  content((-3, -1.302), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"CD"$]]])], anchor: "north")
  rect((1.162, -0.399), (4.838, 1.732), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000073"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"), radius: 7pt)
  content((3, 2.1), [#text(size: 9pt)[$F_D=K_(2,2)$]])
  line((1.635, 0), (3, 1.26), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((3, 1.26), (4.365, 0), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((1.635, 0), (3, 0), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((3, 0), (4.365, 0), stroke: (paint: rgb("#000099"), thickness: 0.85pt, miter-limit: 10))
  line((1.635, 0), (3, -1.26), stroke: (paint: rgb("#bf6000"), thickness: 1.25pt, miter-limit: 10))
  line((4.365, 0), (3, -1.26), stroke: (paint: rgb("#999999"), thickness: 0.5pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.557, -0.504), (3.808, -0.756), (3.557, -0.756), (3.808, -0.504), stroke: (paint: rgb("#595959"), thickness: 0.7pt, miter-limit: 10))
  circle((1.635, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((4.365, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((3, 1.26), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((3, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((3, -1.26), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  content((1.572, 0), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$X_D$]]])], anchor: "east")
  content((4.428, 0), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y_D$]]])], anchor: "west")
  content((3, 1.302), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"AD"$]]])], anchor: "south")
  content((3, 0.042), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"BD"$]]])], anchor: "south")
  content((3, -1.302), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"CD"$]]])], anchor: "north")
  content((2.16, -0.735), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#bf6000"))[#text(size: 9pt)[$e_0$]]]])], anchor: "east")
  content((3.956, -0.7665), [#text(fill: rgb("#595959"))[#text(size: 7pt)[omitted]]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: A full fan and the exceptional fan. The blue edges and their endpoints form the indicated fans. The loose edge $e_0 = X_D upright("–") C D$ belongs to $Gamma$ but not to $F_D$; the crossed dashed segment $Y_D upright("–") C D$ is absent from $Gamma$. In particular, $C D$ is not a vertex of $F_D$. The two occurrences of $C D$ denote the same line vertex of $Gamma$. ],
) <fig:fans>

Choose an orientation for each edge once and for all. A #emph[field] is an edge position in a template or a
  position in a polygon word. An assignment gives one signed letter to each field.
  A walk reads that letter in the specified orientation and its inverse in the other orientation.
  The fields are bookkeeping coordinates; they all take values in the same alphabet.

A #emph[core hexagon] is the six-cycle obtained from three noncollinear points, the three lines joining them,
  and one representative over each point for which all six incidences are present.
  In particular, the all-$X$ choice is always permitted. Any three successive edges of a core hexagon contain at
  most two fields from each fan; the loose field, if present, belongs to no fan.

=== 2.2 The independent tables <the-independent-tables>

For $n gt.eq 1$, let

$ S_n = { a_1 \, a_1^(- 1) \, dots.h \, a_n \, a_n^(- 1) } \, wide N = 2 n . $

These are formal signed letters; assignments are not required to use distinct letters or to produce freely reduced
  words. Let

#[#set math.equation(numbering: n => "(2.2)")
 $ f = 2 - alpha \, wide p = 3 - beta \, wide 0 < alpha \, delta < 1 \, wide
   7 alpha < beta < 1 . $ <eq:model-parameters>]

Additional smallness requirements will be imposed when we choose finitely many sampling tests.

#prodef([Definition 2.2.])[
  (The tables).  Use the following mutually independent Bernoulli arrays.
  + For each point $i$, an array indexed by $S_n^(E \( F_i \))$ includes every tuple with probability
    $N^(f - k_i)$. An included tuple, together with its type $i$, is a #emph[fan occurrence] $b$.
  + An array indexed by $S_n^(E \( Gamma \))$ marks every full core tuple with probability $N^(p - g f - 1)$.
    A #emph[top occurrence] $a$ is a marked tuple whose restriction to every $F_i$ is an included fan occurrence.
    We write $a arrow.r b$ when $b$ is the fan in one of the seven slots of $a$.
  + For each unoriented nonbacktracking two-edge path $tau$ in $Gamma$, choose one order and direction.
    Give $tau$ a separate four-field array: its first two coordinates are the two core fields on $tau$,
    and its last two are new coordinates. Include each row with probability $N^(- 2 - delta)$.
    Its relator reads $tau$, with the required orientation signs, followed by the two new letters around a closing path.
  + A separate six-field array includes each word in $S_n^6$ with probability $N^(- 3 - delta)$. Its word is a relator.
  All included rows in (iii) and (iv) are imposed, not only rows matching some top occurrence.
    We call them #emph[decorations]; their lengths are $2 h$, with $h in { 2 \, 3 }$.
] <def:tables>

There is no ambiguity from opposite path directions: reversing one chosen convention simply inverts or reorders
  the corresponding coordinates, preserving the Bernoulli law. There are $90$ tables in Definition 3(iii).
  Indeed, the eleven point-representative vertices contribute $10 binom(3, 2) + binom(2, 2) = 31$ two-edge paths;
  the line degrees are $5 \, 5 \, 4 \, 5 \, 5 \, 5 \, 3$, contributing $59$ more.

The exponents in Definition 3 are negative. In particular,

$ p - g f - 1 = - 12 - \( beta - 7 alpha \) < 0 . $

Each is therefore a valid probability. Distinct numerical tuples of a fixed table are independent.
  Top #emph[occurrences] are correlated because they may share fan slots; top #emph[marks] remain independent.

The expected counts explain the normalization of these probabilities.
  For each fan type there are $N^(k_i)$ candidate tuples, so the expected number of included fans is $N^f$.
  A fixed core tuple requires its mark and seven independent fan entries.
  Since the fans contain $31$ fields in total, the expected number of top occurrences is

$ N^32 thin N^(p - 7 f - 1) product_i N^(f - k_i) = N^p . $

Each square table has expected size $N^(2 - delta)$, and the six-letter table has expected size $N^(3 - delta)$.
  Thus the expected exponents are just below $2$ for fans and squares, and just below $3$ for tops and hexagons.
  Section 3 explains how these deficits, together with $beta > 7 alpha$,
  leave a positive margin in the diagram estimates. The correlation between top occurrences is the reason that
  their shared fan costs must be counted only once.

=== 2.3 The group and its two-complex <the-group-and-its-two-complex>

The letter presentation has the generators $a_1 \, dots.h \, a_n$.
  For each included fan and each top occurrence, impose the labels of all closed walks in its graph.
  Impose also the decoration words. This is a finite presentation:
  in each connected graph a fixed spanning tree supplies a finite basis of closed walks that suffices.

For the diagram arguments we use a specific finite two-dimensional CW complex $P$.
  Start with the letter bouquet, with vertex $o$. For each fan occurrence $b$ of type $i$,
  attach the cone on $F_i$ along its labelled map to the bouquet. The cone apex is a new vertex, also denoted $b$.
  For each vertex $v$ of $F_i$, its radial edge $r_(b \, v)$ joins $b$ to the image $o$ of $v$.
  Every fan edge gives one triangle with one letter side and two radial sides.
  Different radial edges can have the same endpoints; they retain their distinct labels $v$.

The fan cones already fill all fan cycles. To impose the remaining relations of a top occurrence $a$,
  take the ordinary Fano incidence graph and subdivide the edge $D$–$C D$ once. Call the resulting graph $B$.
  It has $15$ vertices and $22$ edges, hence cycle rank $8$, matching the difference $15 - 7$ computed above.
  Map a point vertex $i$ to the apex of the fan in slot $i$ of $a$,
  and map all line vertices and the subdivision vertex to $o$.
  An ordinary incidence at $i$ maps to the radial edge indexed by its line. The subdivided exceptional incidence maps to

$ r_(b_D \, X_D) quad upright("followed by the loose letter edge,") $

with the orientation giving the path from $X_D$ to $C D$.
  Attach the cone on this mapped graph, with its own new apex. We call its radial triangles #emph[top triangles].
  Finally attach every decoration polygon. All these attachments are finite, and $P$ has dimension two.

#thm([Lemma 2.3.])[
  (Presentation equivalence).  #emph[The complex $P$ has the fundamental group of the letter presentation above.
    In particular, it has a quotient isomorphic to $C_2$.]
] <lem:model-presentation>

#proof[
  For a connected graph $H$ and a map $H arrow.r X$ into a connected complex,
    attaching its cone changes $pi_1 X$ by the normal closure of the image of $pi_1 H$.
    It introduces no extra generator. This follows from van Kampen,
    or by choosing a spanning tree of $H$ and eliminating all but one of the new radial edges successively.
    The statement does not require distinct graph vertices to have distinct images.
  It remains to check that the top macro graph imposes the required core relations after the fan relations.
    Each fan triangle replaces a fan edge by the two radial edges from its endpoints to the fan apex.
    A path in a fan can therefore be replaced, relative its endpoints, by the radial path through that apex.
    Apply these replacements to a closed core walk. Excursions through $X_i$ or $Y_i$ then cancel,
    leaving a closed walk in the mapped macro graph. At $D$, the only unreplaced edge is the loose edge;
    together with $r_(b_D \, X_D)$ it gives exactly the exceptional subdivided incidence.
    Conversely, every macro turn can be replaced by a path in its connected fan.
    The two sets of relations have the same normal closure modulo the fan relations.
    This proves the presentation assertion.
  The graph $Gamma$, and each fan, is bipartite, so every closed-walk word has even length.
    The decorations have lengths four and six. Sending each original generator to the nonidentity element of $C_2$
    respects all the defining relations and is surjective. ◻
]

#prodef([Remark 2.4.])[
  The cone description records occurrences, not just relator words.
    If the same fan occurs in several tops, its cone is attached only once.
    A top occurrence has its own cone, and a decoration occurrence has its own disk.
    These distinctions are essential in the multiplicity count of Section 3.
] <rem:model-finite>

=== 2.4 The master pattern and admissible tests <the-master-pattern-and-admissible-tests>

Define the finite #emph[master pattern] $cal(M)$ by taking one top occurrence with its seven fan slots and,
  for each of the $90$ two-edge paths, one matching row of its square table.
  The two core coordinates of that row are identified with their core fields; its two closing coordinates are new.
  The separate six-letter array is not part of $cal(M)$.

A #emph[match] is an assignment to the fields of $cal(M)$ for which every required table entry is present,
  including the top mark. We denote the set of matches by $Omega_n$.
  When it is nonempty, it carries its uniform probability measure.
  Its $32 + 2 dot.op 90$ fields include the shared core fields only once.

#prodef([Definition 2.5.])[
  (Admissible fields).  A set of fields is #emph[admissible] if it is either
  + a set of at most three distinct core fields containing at most two fields of each fan, or
  + a set of at most two fields of a single square decoration in $cal(M)$.
  The loose core field does not count against any fan quota.
] <def:admissible>

The first case includes all three-edge half-paths of core hexagons.
  It also includes two $F_C$ fields together with the loose field,
  the combination that will produce the decisive midpoint identity.
  The second case includes every two-edge half-path in a decoration square.

Every match has a labelled realization of the core graph and the closing paths of its square decorations in the
  group: fix an anchor, and label a vertex by the word read along any path from the anchor.
  All closed-path labels are trivial by Lemma 4 and the square relators.
  Consequently this group-valued vertex assignment is independent of the chosen path.
  For any action and basepoint, it gives a corresponding configuration of orbit points.

== 3 Diagrams and linear filling <sec:diagrams>

This section proves the combinatorial properties of the random complex $P$ of Section 2.
  An #emph[occurrence] means an included tuple, together with its table type;
  copies of a cell in a diagram need not be distinct occurrences.
  All constants in this section may depend on the fixed incidence template and on the fixed parameters, but not on $n$.

#thm([Theorem 3.1.])[
  #emph[Fix sufficiently small positive $alpha \, beta \, delta$ with $beta > 7 alpha$, and put $f = 2 -
    alpha$ and $p = 3 - beta$. As $n arrow.r oo$, the probability tends to one that $P$ is aspherical and its
    letter presentation satisfies a linear disk isoperimetric inequality.]
] <thm:diagram>

The central estimate will bound the number of faces in a bounded piece of a normalized diagram by the number of
  its exposed sides. The expected occurrence counts in Section 2 have exponents $2 - alpha$, $3 - beta$, and $h -
  delta$ for fans, tops, and decorations of length $2 h$. The local incidence geometry compares these with the
  values $2$, $3$, and $h$. After shared fan costs have been accounted for, the differences $alpha$, $beta -
  7 alpha$, and $delta$ supply the strictly positive margin in the boundary estimate.

We first obtain a probability bound for every bounded collection of distinct occurrences.
  We then normalize disk and sphere pictures so that this bound also controls repeated copies of their cells.
  The resulting estimate applies to arbitrary sets of faces,
  which lets us partition a large picture by planar separators and sum the bounds on its pieces.
  The same estimate proves linear filling for disks and rules out nonzero two-cycles in the universal cover.

We retain every fan slot of a top occurrence when making a collection of occurrences,
  even if a diagram uses only some of those slots. This convention is essential to the counting argument.

=== 3.1 Coincidence ranks <coincidence-ranks>

Counting constraints while retaining repeated relator occurrences is standard in random-group diagram arguments;
  see Ollivier #cite(label("Ollivier2004")) Section 2 and
  Antoniuk–Friedgut–Łuczak #cite(label("AntoniukFriedgutLuczak2017")) Section 3.
  We count the shared fan entries explicitly in the estimate below.

For a finite collection of top, fan, and decoration occurrences, its #emph[field positions] are the following:
  the loose field of each top, the $k_i$ fields of each fan occurrence of type $i$,
  and all fields of each decoration occurrence. A fan field is included only once when the same fan occurrence
  occupies slots in several tops. The #emph[unsigned coincidence rank] $R$ is the number of positions minus the
  number of distinct underlying generators represented at those positions.
  Thus a letter and its inverse have the same unsigned value.

#thm([Lemma 3.2.])[
  #emph[For each fixed integer $M$, with probability tending to one the following holds simultaneously for every
    collection of at most $M$ distinct occurrences that contains all fan slots of its tops.
    If the collection has $s$ tops and $u$ fans, then
#[#set math.equation(numbering: n => "(3.1)")
 $ R lt.eq \( p - 7 f \) s + f u + sum_e \( h_e - delta \) \, $ <diagram:rank-bound>]

 where the sum is over its decorations and $2 h_e in { 4 \, 6 }$ is the length of decoration $e$.]
] <diagram:rank>

#proof[
  Fix the table types, the incidence of the fan slots, and a partition of the field positions into unsigned-value
    classes. There are only finitely many such choices for fixed $M$. Write $J$ for the number of positions.
    Assigning letters to a pattern of rank $R$ has at most $C_M N^(J - R)$ possibilities:
    first choose one underlying generator per class, then choose the signs of the positions.
    The latter contributes only a factor bounded in terms of $M$.
  We count only choices whose occurrences are distinct within their respective tables.
    For such choices all the required Bernoulli trials are independent.
    Their product contributes the power of $N$ with exponent
  $ \( p - 7 f - 1 \) s + sum_b \( f - k_b \) + sum_e \( h_e - delta - 2 h_e \) . $
  Here a shared fan occurrence appears once in the second sum, not once per top using it.
    Since $J = s + sum_b k_b + sum_e 2 h_e$, the expected number of realizations of the chosen pattern is at most
  $ C_M N^(\( p - 7 f \) s + f u + sum_e \( h_e - delta \) - R) . $
  If Equation (3.1) fails, this exponent is negative. There are finitely many exponents to consider for the fixed
    size bound, so summing these expectations proves the assertion. ◻
]

=== 3.2 Spherical pictures and their reductions <spherical-pictures-and-their-reductions>

Lemma 8 counts distinct occurrences, whereas a filling diagram may use the same occurrence many times.
  We normalize the diagram in two ways: the triangles incident to each top apex will be grouped into polygons
  tracing simple macro cycles, and the cyclic link at a fan apex will have no repeated radial label.
  These properties will bound how often a field can appear near each apex.
  For the asphericity argument, the normalization must also preserve a prescribed lifted two-cycle.

An #emph[elementary picture] is a finite collection of oriented polygons with orientation-reversing pairings of
  their sides, such that the resulting closed oriented surfaces are spheres.
  Vertex links are taken to be circles, with a separate source vertex for each link circle.
  An interior face maps to a fan triangle, a triangle of a top cone, or a decoration disk of $P$,
  with either orientation. In the disk problem there is one distinguished outside polygon whose boundary reads the
  prescribed letter word; no extension of its interior to $P$ is required.
  In the sphere problem there is no outside polygon. Collapsed regions mapping to vertices and free cancellations
  of edge paths have zero face cost. They can equivalently be recorded by thickening the paired sides to strips
  and capping the boundary circles of the resulting vertex regions.

Every cell has a specified map to $P$, including the index of each of its sides.
  Equal edge labels alone do not identify two side indices.
  For a picture mapped to $tilde(P)$, its #emph[cellular chain] is the sum of its signed lifted two-cells;
  the outside polygon is omitted.

#thm([Lemma 3.3.])[
  #emph[Every null letter word has a disk picture. If $c eq.not 0$ is a cellular two-cycle of $tilde(P)$,
    there is a finite collection of spherical pictures with total cellular chain exactly $c$.]
] <diagram:existence>

#proof[
  The disk assertion is the cellular van Kampen construction, applied to the finite cone and polygon complex.
    Here is also a description that applies to the sphere assertion.
    Since $tilde(P)$ is simply connected, the Hurewicz map $pi_2 \( tilde(P) \) arrow.r
    H_2 \( tilde(P) \; bb(Z) \)$ is an isomorphism #cite(label("Hatcher2002")) Theorem 4.32.
    There are no three-cells. Consequently a sphere map representing the class of $c$ has cellular two-chain equal
    to $c$, not merely congruent to it modulo boundaries of three-cells.
  Put this map in cellular general position. One way to do so is to choose an interior point in each two-cell,
    make its inverse image a finite set of regular points, and take small disks about those preimages.
    Each such disk maps, with a sign, across that two-cell. Retracting each punctured target cell to its boundary
    moves the complement of these disks into the one-skeleton.
    Inverse images of interior edge points now give strips pairing the corresponding cell sides;
    the remaining regions map to vertices. Circular strips not meeting cell sides may be cut and capped.
    A vertex region with several boundary components may likewise be replaced by a separate cap for each
    component. These operations are compressions along curves in an oriented sphere.
    They therefore produce a collection of oriented spheres, not surfaces of positive genus.
    They change none of the signed cell disks or their lifts. Components with no cell disks may be discarded.
    This gives the claimed spherical pictures and preserves the chain $c$ exactly.
  For a disk map, adjoin the distinguished outside polygon before the same construction.
    Keep that polygon as a single face throughout. The construction preserves its word and gives one picture
    containing it, possibly together with sphere components. All the required pictures are finite. ◻
]

At a vertex mapping to the apex of a top cone, every incident face is a triangle of that cone.
  Grouping its incident triangles gives a polygon whose boundary is a closed walk in the macro graph of that top
  occurrence. We call it a #emph[top polygon]; its filling in $P$ is always the indicated radial cone filling.
  Its perimeter is the number of these cone triangles. The other interior faces remain fan triangles and
  decoration disks.

The macro graph is the Fano incidence graph with one subdivided edge. It has fifteen vertices.
  A simple macro cycle has at most fifteen sides, visits each point at most once,
  and visits at least three points. At a point it turns between two distinct #emph[ports],
  namely the radial labels of the fan there. The ports are the incident line vertices,
  except that the exceptional port at $D$ is $X_D$.

#thm([Lemma 3.4.])[
  #emph[A null letter word has a picture of minimum total top perimeter and, subject to this,
    minimum number of remaining interior faces, with the following properties.
    The same assertion holds for a fixed nonzero cellular two-cycle $c$,
    minimizing among finite collections of sphere pictures whose total lifted cellular chain is exactly $c$.]
  + #emph[Every top polygon is a simple macro cycle.]
  + #emph[Adjacent top polygons do not use the same side of the same top occurrence.
    Two copies of one fan triangle cannot be adjacent along equally indexed sides,
    and two copies of one decoration cannot be adjacent along the same position of that decoration.]
  + #emph[At each fan-apex instance, the cyclic list of radial labels has no repetition.
    A circuit with two distinct parallel steps is permitted. Each such circuit has at most five steps.
    If it contains no top turn, it has at least four fan triangles.]
  #emph[The modifications establishing these properties preserve the outside word and, in the sphere problem,
    the exact lifted cellular chain.]
] <diagram:normal-form>

#proof[
  The nonempty class of finite pictures in Lemma 9 has a lexicographic minimum for the stated pair of nonnegative
    integer costs. In the sphere case fix the chain $c$ once and for all in taking this minimum.
  #emph[Simple macro cycles.] Consider a top polygon whose macro walk repeats a template vertex.
    Its two boundary points at that repetition have the same lifted value:
    both are joined to the same lifted top apex by the same indexed cone spoke.
    Split the polygon by a chord collapsed to that vertex. The two resulting macro walks have the same total
    perimeter and the same total cone chain. A free backtrack cancels two oppositely oriented copies of a single
    lifted cone triangle and reduces total perimeter by two. Delete any resulting empty polygons.
    Repeating splitting and removal of backtracks therefore gives simple macro cycles.
    Collapsed chords may be put in the picture form of Lemma 9; they carry no two-chain. This proves the first property.
  #emph[Cancellation.] Suppose two top polygons meet at the same macro side of one occurrence.
    The two elementary cone triangles incident to that side are copies of the same triangle with opposite
    orientations. Their lifts agree, because the common lifted macro side determines the lifted triangle and its
    apex. Cancel the pair and merge the remaining cone walks. This reduces total top perimeter by two.
    It is an ordinary diagram cancellation: one uses the two face interiors and a thin strip across the specified
    common side, so other contacts between their boundaries cause no obstruction.
    Any vertex regions produced by the cancellation are capped as above.
    A same-template contact cannot occur between two sides of a single simple top polygon,
    because a simple macro cycle uses each edge at most once.
    The identical cancellation of two fan triangles or two decoration disks along equally indexed sides reduces
    the second cost without increasing the first. These cancellations preserve the cellular chain,
    so they are forbidden by minimality in both problems.
  #emph[Fan-apex links.] Fix a source vertex $v$ mapping to a fan apex $b$.
    A step in its link is either a fan triangle or a corner of a top polygon.
    Suppose two different outgoing spokes at $v$ have the same radial label.
    Each spoke is an edge from $v$ to a vertex mapping to the letter-bouquet vertex.
    Cut the side pairings of these two edges and pair them crosswise,
    with the outgoing orientations at $v$ agreeing. This preserves the orientation of every face and all face
    maps. In terms of vertex-link cycles, it splits the link cycle of $v$ into two.
    At the far ends it either merges two distinct vertex cycles or splits one vertex cycle.
  For completeness, this switch preserves the genus-zero condition. The numbers of faces and edges do not change.
    When the two far vertices were distinct, the total vertex count does not change,
    and the affected surface remains connected: both switched edges are incident to the merged far vertex.
    When the far vertices were the same, the total vertex count increases by two.
    There can be at most two affected components after either switch.
    To see this, cut the two corresponding edges of the connected dual graph before re-pairing their four exposed
    half-edges. Every component of the cut graph contains an exposed half-edge:
    otherwise it was already disconnected before the cut. After re-pairing,
    every component therefore contains one of the two switched edges.
    This argument includes loops and parallel edges in the dual graph.
    In the first case the connected oriented surface consequently has Euler characteristic two.
    In the second case the total Euler characteristic is four, which forces exactly two oriented spheres.
    All unaffected spheres are retained, and the outside polygon remains one unchanged face.
  The switch is also valid for the fixed lifted chain. The repeated radial label and the lifted initial fan vertex
    determine the same lifted radial edge and far endpoint. Thus the new vertex identifications agree in
    $tilde(P)$, and every lifted face is unchanged. Each switch increases the number of fan-apex instances while
    keeping the finite set of polygon corners fixed. Repetition therefore terminates.
    The two minimized costs are unchanged, so a newly created forbidden adjacency would still contradict their
    minimality by the cancellation just described.
  The resulting link uses each radial label at most once. There are at most five labels in any fan.
    A two-step link made only of fan triangles is the reverse traversal of one edge of the simple fan graph;
    the two triangles would cancel along an equally indexed radial side.
    Every other nonempty triangle-only link is a circuit in the simple bipartite fan graph and has length at least
    four. This proves the last property. ◻
]

The outside word uses only letter edges, so an outside polygon never meets a fan-apex instance.
  In particular each full link considered in Lemma 10 is a cyclic link of interior faces.

=== 3.3 Weights on a bounded fragment <weights-on-a-bounded-fragment>

Fix a normal picture. A #emph[fragment] is any selection of its interior faces;
  the selection need not be connected or simply connected. Keep a pairing of sides precisely when both incident
  faces are selected. All other selected sides are fragment boundary sides.
  Let $T \, Q \, E$ be the numbers of selected top polygons, fan triangles, and decoration disks, respectively,
  and put $A = T + Q + E$.

For a top occurrence $a$ let $t_a$ be its number of selected top polygons,
  and for a decoration occurrence $e$ let $t_e$ be its selected multiplicity.
  At a fan-apex instance $z$ represented in the fragment, let $d_z$ count selected top turns and $q_z$ count
  selected fan triangles. It is #emph[partial] if not every step of its full cyclic link is selected.

For a fan occurrence $b$, two multiplicities must be distinguished.
  The number of represented apex instances bounds the actual use of each fan field.
  We must also retain this fan whenever we retain a top of sufficiently large multiplicity that requires it.
  The fan weight must therefore dominate the largest such top multiplicity. Write

$ r_b = \# { z : z upright(" is represented over ") b } \, wide m_b = max_(a arrow.r b) t_a \, wide S_b =
  sum_(a arrow.r b) t_a \, wide w_b = max { r_b \, m_b } . $

Empty maxima are zero. All fan slots of every selected top are included in these definitions,
  whether or not a polygon of that top visits the fan. In particular

#[#set math.equation(numbering: n => "(3.2)")
 $ sum_b S_b = 7 T . $ <diagram:slot-sum>]

Write $J_b$ for the number of partial instances over $b$,
  and let $P_b^(*)$ count the selected loose top sides belonging to turns at this fan.
  This number is zero unless $b$ has type $D$. Each such loose side records one incidence with the exceptional
  radial port $X_D$.

Let $I$ count internal contacts between two letter sides of the fragment.
  Radial side contacts are not counted in $I$. Denote the numbers of letter and radial fragment boundary sides by
  $B_(upright("raw"))$ and $B_(upright("rad"))$, and put $B = B_(upright("raw")) + B_(upright("rad"))$.

We first use the coincidence bound to control internal letter contacts.
  The remaining estimate is local at fan apices: full links contribute no error,
  while partial links contribute an error paid by radial boundary sides.
  Combining the two estimates will bound the fragment’s area by its total boundary length.

#thm([Lemma 3.5.])[
  #emph[Suppose Equation (3.1) holds for collections of at most $8 A$ occurrences. Then
#[#set math.equation(numbering: n => "(3.3)")
 $ I lt.eq p T + f sum_b \( w_b - S_b \) + sum_e \( h_e - delta \) t_e . $ <diagram:contact-bound>]

]
] <diagram:weighted-rank>

#proof[
  Give each fan field of $b$ weight $w_b$, each loose field of $a$ weight $t_a$,
    and each field of a decoration $e$ weight $t_e$. These are upper bounds for their side multiplicities in the
    fragment. Indeed a fan field is used at most once at a given normalized fan-apex link,
    so its multiplicity is at most $r_b$. A simple top polygon uses its loose field at most once,
    and a copy of a decoration uses each indexed field once.
  For each integer $j gt.eq 1$, apply Equation (3.1) to the positions of weight at least $j$.
    This is an eligible collection: $t_a gt.eq j$ implies $w_b gt.eq m_b gt.eq t_a gt.eq
    j$ for every slot $a arrow.r b$. Its size is at most $8 A$, since there are at most $T$ distinct tops,
    at most $7 T + Q$ fans, and at most $E$ decorations. Sum the resulting inequalities over $j$.
    Within an unsigned-value class, the sum of its ranks is its total weight minus its largest position weight.
    Thus, writing $cal(C)$ for the unsigned-value classes, we obtain
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(C in cal(C)) (sum_(v in C) "wt" \( v \) - max_(v in C) "wt" \( v \)) lt.eq \( p - 7 f \) T +
     f sum_b w_b + sum_e \( h_e - delta \) t_e . $ <diagram:weighted-coincidence>]
  Every internal letter contact joins two different field positions.
    For fan triangles and decorations this follows from the cancellations in Lemma 10;
    for two loose top sides it follows from the same-occurrence top cancellation.
    A contact between different kinds of cells automatically has different positions.
    In each class $C$, choose one maximum-weight position. Charge each internal contact to one of its endpoints
    other than that position. Such an endpoint always exists.
    Different contacts use different actual side copies, so the charge to any position is at most its side
    multiplicity and hence at most its weight. This proves that $I$ is bounded by the left side of Equation (3.4).
    Using Equation (3.2) on its right side gives Equation (3.3). ◻
]

This argument allows arbitrary cycles and repetitions in the contact graph.
  It charges side copies, and does not require the contacts to form a forest.

#thm([Lemma 3.6.])[
  #emph[For every fan occurrence $b$ in a fragment,
#[#set math.equation(numbering: n => "(3.5)")
 $ sum_(z mapsto b) d_z + 2 \( w_b - S_b \) lt.eq 1 / 2 (sum_(z mapsto b) q_z + P_b^(*)) +
   2 J_b . $ <diagram:apex-bound>]

 Moreover
#[#set math.equation(numbering: n => "(3.6)")
 $ 2 sum_b J_b lt.eq B_(upright("rad")) . $ <diagram:partial-bound>]

]
] <diagram:apex>

#proof[
  First suppose $w_b = r_b$. A simple top polygon has at most one turn at this fan, so $S_b gt.eq
    sum_(z mapsto b) d_z$. Consequently the left side of Equation (3.5) is at most
    $sum_(z mapsto b) \( 2 - d_z \)$. For a full link with $d_z = 0$,
    at least four fan triangles give the required inequality.
    For a full link with $d_z = 1$, the triangles form a path in the fan between the two distinct ports of that
    top turn. Ordinary ports are distinct line vertices, so this path has at least two edges.
    The only exception is a path incident to the port $X_D$; it may have one edge,
    in which case its top turn has the loose side counted by $P_b^(*)$.
    Thus in either case its triangle count plus its loose-side payment is at least two.
    For $d_z gt.eq 2$ the expression $2 - d_z$ is nonpositive.
    At a represented partial link with $d_z = 0$ there is at least one selected fan triangle,
    so its deficit is at most $3 \/ 2$. With $d_z = 1$ its deficit is at most one, and with $d_z gt.eq
    2$ it is nonpositive. Thus the error $2 J_b$ suffices in this case.
  Now suppose $w_b = m_b > r_b$, and choose a top occurrence $a_0$ with $t_(a_0) = m_b$. Call its turns dominant.
    Let $x$ and $y$ be the total numbers of selected dominant and nondominant turns over $b$.
    Nondominant selected faces have at most one turn each at this fan,
    including when other selected faces omit the fan entirely; hence $y lt.eq S_b - m_b$. It follows that
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_(z mapsto b) d_z + 2 \( m_b - S_b \) = x + y - 2 \( S_b - m_b \) lt.eq x - y . $ <diagram:dominant-algebra>]
  Consider a full link. In its cyclic list of turns the number of consecutive dominant-to-dominant interfaces is
    at least the number of dominant turns minus the number of other turns.
    To see this, assign to each dominant turn its following turn:
    at most as many dominant turns can be followed by a nondominant one as there are nondominant turns.
    A single turn is followed by itself. Between a counted pair of turns there is a path of fan triangles.
    This path cannot have length zero, because then the two top polygons use the same radial side of the same
    occurrence $a_0$, forbidden by Lemma 10. If the path has length one, it must have an exceptional port,
    since the other ports lie in the line part of the bipartite fan graph. That port has its loose-side payment.
    Thus the path length plus the available payments is at least two for each counted interface.
    The triangle paths are disjoint portions of the link. A port incidence is an endpoint of just one such
    intervening path, so no loose-side payment is used twice.
    The triangle counts and payments at full links therefore bound twice their total dominant-minus-nondominant
    count from below.
  At a partial link, the selected steps form a nonempty proper subset of a cyclic list of at most five steps.
    Split this subset into maximal consecutive selected runs.
    Each run and each intervening unselected gap contains a step, so there are at most two runs.
    In a run containing turns, let $k$ and $l$ be the numbers of dominant and nondominant turns.
    Their linear turn list has at most $l + 1$ blocks of dominant turns.
    Consequently, if $H$ counts its consecutive dominant-to-dominant interfaces, then
  $ H gt.eq k - l - 1 \, wide k - l lt.eq H + 1 . $
  The fan-triangle path at each of these interfaces is entirely selected.
    The same indexed-side cancellation and exceptional-port argument used for a full link shows that its length
    plus its available loose-side payments is at least two. Different interfaces,
    including those in different runs, use disjoint triangle paths and distinct port incidences,
    so no payment is used twice. A run without turns contributes zero to the dominant-minus-nondominant count.
    Summing over the at most two runs therefore bounds that count by half the selected triangle count and
    loose-side payments, plus two.
  Choose the dominant occurrence $a_0$ once for the entire fan occurrence $b$,
    and apply these estimates separately at all its apex instances.
    They do not require the fragment to be connected, or every selected polygon of $a_0$ to visit this fan.
    Summing the partial- and full-link estimates, and then using Equation (3.7),
    proves Equation (3.5) also in the second case.
  Finally, a represented partial cyclic link has at least two transitions between selected and unselected steps.
    Each transition is a radial edge with exactly one selected incident face,
    and hence is a radial fragment boundary side. A radial side belongs to only one fan-apex instance.
    This proves Equation (3.6). ◻
]

#thm([Lemma 3.7.])[
  #emph[Put
#[#set math.equation(numbering: n => "(3.8)")
 $ kappa = min { beta - 7 alpha \, alpha \/ 5 \, delta } > 0 . $ <diagram:kappa>]

 If Equation (3.1) holds for collections of at most $8 A$ occurrences, then every fragment of area $A$ satisfies
#[#set math.equation(numbering: n => "(3.9)")
 $ A lt.eq C_0 B \, wide C_0 = 1 / kappa . $ <diagram:fragment-bound>]

]
] <diagram:fragment>

#proof[
  Write $W = sum_b w_b$ and $P^(*) = sum_b P_b^(*)$. Every simple top polygon has at least three turns.
    Summing Equation (3.5), and using Equation (3.2), gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ 3 T + 2 \( W - 7 T \) lt.eq frac(Q + P^(*), 2) + 2 sum_b J_b . $ <diagram:nominal-apex>]
  The right side of Equation (3.3) can be written as
  $ 3 T + 2 \( W - 7 T \) + sum_e h_e t_e - Delta \, wide Delta = \( beta - 7 alpha \) T + alpha W + delta E . $
  There are at most five selected triangles at a represented fan-apex instance, so $Q lt.eq 5 sum_b r_b lt.eq
    5 W$. Therefore
  #[#set math.equation(numbering: n => "(3.11)")
   $ Delta gt.eq kappa \( T + Q + E \) = kappa A . $ <diagram:defect>]
  The total number of raw side copies in the fragment is
  $ R_(upright("raw")) = Q + P^(*) + sum_e 2 h_e t_e . $
  Equations (3.3) and (3.10) imply
  $ I lt.eq R_(upright("raw")) / 2 - Delta + 2 sum_b J_b . $
  Since $B_(upright("raw")) = R_(upright("raw")) - 2 I$, Equations (3.6) and (3.11) give
  $ 2 kappa A lt.eq 2 Delta lt.eq B_(upright("raw")) + 4 sum_b J_b lt.eq B_(upright("raw")) +
    2 B_(upright("rad")) lt.eq 2 B . $
  This is Equation (3.9). ◻
]

=== 3.4 From bounded fragments to all pictures <from-bounded-fragments-to-all-pictures>

The probability estimate controls only bounded collections of occurrences.
  To use it for an arbitrarily large picture, we partition the faces into bounded sets while cutting few contacts.
  A fragment was allowed to be disconnected and to have holes,
  so any partition of the dual graph gives eligible fragments.
  The following separator estimate makes their total new boundary small enough to absorb into the area bound.

#thm([Lemma 3.8.])[
  #emph[For every $D < oo$ and $eta > 0$ there is an integer $K =
    K \( D \, eta \)$ such that the vertices of any finite planar multigraph of maximum degree at most $D$ can be
    partitioned into sets of size at most $K$, with at most $eta$ times the total number of vertices edges
    crossing between sets.]
] <diagram:separator>

#proof[
  Ignore loops and apply the planar separator theorem to the underlying simple graph.
    In a graph with $q$ vertices it gives a set of at most $c sqrt(q)$ vertices whose removal leaves two sets,
    with no edges between them, each of size at most $2 q \/ 3$; one may take $c =
    2 sqrt(2)$ #cite(label("LiptonTarjan1979")) Corollary 2. Repeat inside every set larger than $K$,
    and make every removed separator vertex a singleton part.
  Charge $c \/ sqrt(q)$ to every vertex present in a recursive set of size $q$.
    These charges pay for all removed separator vertices. For any fixed original vertex,
    the successive set sizes containing it decrease by a factor at most $2 \/ 3$ while they exceed $K$.
    Reading that sequence backward shows that its total charge is at most
  $ c / sqrt(K) sum_(j gt.eq 0) \( sqrt(2 \/ 3) \)^j = frac(c, \( 1 - sqrt(2 \/ 3) \) sqrt(K)) . $
  If the original graph has $A$ vertices, the number of removed separator vertices is at most $C A \/ sqrt(K)$,
    where $C = c \/ \( 1 - sqrt(2 \/ 3) \)$. Every edge crossing between final parts has a removed separator
    vertex as an endpoint. The degree bound therefore limits their number, counting multiplicity,
    to $D C A \/ sqrt(K)$. Choose $K$ so large that $D C \/ sqrt(K) lt.eq eta$.
    Disconnected graphs are treated component by component. ◻
]

#proof[
  Fix the parameters, so that $kappa$ and $C_0$ in Lemma 13 are positive constants.
    Choose $eta > 0$ with $2 C_0 eta lt.eq 1 \/ 2$, and apply Lemma 14 with $D = 15$.
    This gives a fixed finite threshold $K$. By Lemma 8, with probability tending to one Equation (3.1) holds for
    all collections of at most $8 K$ occurrences. Work with any realization having that property.
    The remainder of the proof is deterministic and applies simultaneously to every picture for this realization.
  For a normal picture, the dual graph of its interior faces and their contacts is planar of degree at most
    fifteen. Fan triangles have three sides, decorations have at most six,
    and simple top polygons have at most fifteen. Parallel contacts and self-contacts cause no problem in
    Lemma 14. Partition its $A$ interior faces into fragments of size at most $K$,
    cutting at most $eta A$ contacts. Let $B_0$ count contacts with the outside polygon;
    in the sphere problem set $B_0 = 0$. The sum of fragment boundary lengths is at most $B_0 + 2 eta A$.
    Lemma 13 applies to every fragment, and summing it gives
  $ A lt.eq C_0 \( B_0 + 2 eta A \) \, wide upright("hence") wide A lt.eq 2 C_0 B_0 . $
  In a disk picture whose outside word has length $ell$, one has $B_0 lt.eq ell$;
    outside-to-outside pairings represent free boundary cancellations and do not add an interior contact.
    Thus the normal picture uses at most $2 C_0 ell$ interior faces.
  If a nonzero cellular two-cycle $c$ existed in $tilde(P)$,
    use its normal spherical picture supplied by Lemmas 9 and 10. For it $B_0 = 0$, forcing $A = 0$.
    Its cellular chain would then be zero, contrary to its construction.
    Therefore $H_2 \( tilde(P) \; bb(Z) \) = 0$. The universal cover is a simply connected two-dimensional CW
    complex, so all its reduced homology groups vanish. If it had a first nonzero homotopy group,
    the Hurewicz theorem would identify it with a nonzero homology group #cite(label("Hatcher2002")) Theorem 4.32.
    It is consequently weakly contractible, and the Whitehead theorem makes it
    contractible #cite(label("Hatcher2002")) Theorem 4.5. This proves asphericity.
  We finish by making explicit the claimed filling inequality over letters.
    Choose a vertex of every fan template and, for each of its vertices,
    a fixed path from the chosen vertex to that vertex. These paths have length at most two.
    Send every fan-apex vertex of a normal picture to the bouquet vertex,
    and replace its indexed radial edge by the label word of the corresponding fixed fan path,
    with the appropriate orientation. A fan triangle boundary becomes a closed walk in that fan of length at most
    five. A top polygon boundary becomes a closed walk in its copy of $Gamma$:
    at an ordinary point, its two radial paths concatenate to a fan path between the two ports;
    at the exceptional point the path to $X_D$ is followed by the loose edge.
    Its expanded length is at most thirty. A decoration boundary is unchanged.
  Use as a finite letter presentation all simple cycle relators in each included fan and top graph,
    together with the decoration rows. This presents the same group by the cone construction in Section 2.
    Any closed graph walk of length at most thirty splits at repeated vertices into at most thirty simple cycles,
    after free backtracks are erased. Each expanded face above thus has a filling with at most thirty relator
    disks in this presentation. Replacing the faces of the normal picture by these fillings leaves the outside
    letter word unchanged and produces a disk diagram, with free folds allowed, of area at most $60 C_0 ell$.
    Sphere components can be discarded. Any other fixed finite choice of defining cycle relators gives the same
    linear inequality after bounded relator substitutions. This proves the theorem. ◻
]

#prodef([Remark 3.9.])[
  The separator threshold is chosen after the positive parameters are fixed and before $n$ tends to infinity.
    No uniform bound as $alpha \, beta \, delta arrow.r 0$ is asserted or required.
    For each fixed parameter choice, the single finite-collection event in Lemma 8 controls all disk words and all
    cellular two-cycles simultaneously.
] <diagram:quantifiers>

== 4 Conditional sampling from the nested tables <sec:sampling>

The relations will be tested against an action chosen after all the tables have been sampled.
  We therefore prove statements about total variation of finite distributions on table matches.
  These statements do not refer to a target metric space. In particular,
  they will apply simultaneously to all uniformly bounded functions on the relevant assignments,
  including functions obtained from a subsequently chosen action.

=== 4.1 The master pattern and its critical exponents <the-master-pattern-and-its-critical-exponents>

Recall the master pattern $cal(M)$ from Section 2, and let $cal(F)$ be its field set.
  Its required entries are the seven fan entries, the top-mark entry,
  and one entry from each of the $90$ four-letter tables. In each four-letter entry its first two fields are
  identified with the corresponding core fields; its other two fields are new and are used in no other entry.
  The six-letter table is not part of $cal(M)$. Thus $\| cal(F) \| = 212$.
  Write $cal(R)$ for the set of its $98$ array entries and $E_rho subset.eq cal(F)$ for the field support of $rho
  in cal(R)$. Each $rho$ belongs to a different Bernoulli array. The order of its coordinates is fixed throughout.

A #emph[match] is a map $sigma : cal(F) arrow.r S_n$ for which every required array entry is present.
  No injectivity is required of a single match. We write $Omega_n$ for the random set of matches and,
  when it is nonempty, write $mu_N$ for its uniform probability measure.

Recall from Definition 6 that a set of fields is admissible if it consists either of at most three core fields,
  at most two in each fan, or of at most two fields of one square decoration. The loose field belongs to no fan.

#prodef([Definition 4.1.])[
  A #emph[conditional test] is a triple $\( I \, e \, t \)$ with $I subset.eq cal(F)$, $e in cal(F) \\ I$,
    $I union { e }$ admissible, and $t$ a positive integer.
] <sample:def-test>

For $theta = \( alpha \, beta \, delta \)$ define $c_rho \( theta \)$ so that the inclusion probability of entry
  $rho$ is $N^(- c_rho \( theta \))$. Its value and its critical value $c_rho = c_rho \( 0 \)$ are

#[#set math.equation(numbering: n => "(4.1)")
 $ upright("entry") & c_rho \( theta \) & c_rho\
upright("fan ") i & k_i - 2 + alpha & k_i - 2\
upright("top mark") & 12 + beta - 7 alpha & 12\
upright("four-letter entry") & 2 + delta & 2 . $ <sample:eq-costs>]

For a set of fields $W$ put

#[#set math.equation(numbering: n => "(4.2)")
 $ h_theta \( W \) = \| W \| - sum_(rho : E_rho subset.eq W) c_rho \( theta \) \, wide h \( W \) =
   h_0 \( W \) . $ <sample:eq-h>]

Thus $N^(h_theta \( W \))$ is the expected number of assignments to $W$ for which all required entries supported
  in $W$ are present. The function $h$ is submodular. Indeed, for each fixed $E_rho$,
  the indicator of $E_rho subset.eq W$ is supermodular, and all $c_rho$ are nonnegative. Notice also that

#[#set math.equation(numbering: n => "(4.3)")
 $ h \( cal(F) \) = 212 - \( 17 + 12 + 180 \) = 3 \, wide bb(E) \| Omega_n \| = N^(h_theta \( cal(F) \)) =
   N^(3 - beta - 90 delta) . $ <sample:eq-master-mean>]

The expectation is exact: each assignment uses one entry from each of the distinct arrays,
  so all of its inclusion requirements are independent.

#thm([Lemma 4.2.])[
  #emph[For every $W subset.eq cal(F)$,
#[#set math.equation(numbering: n => "(4.4)")
 $ h \( W \) gt.eq min { 2 \, \| W \| } . $ <sample:eq-budget>]

 If $S$ is admissible and $S subset.eq W$, then
#[#set math.equation(numbering: n => "(4.5)")
 $ h \( W \) gt.eq \| S \| . $ <sample:eq-admissible-budget>]

]
] <sample:lem-budget>

#proof[
  First consider only the core part of $W$. Let $a_i$ be its number of fields in $F_i$, and let $ell in { 0 \,
    1 }$ indicate the loose field. Before charging the top mark, the exponent is
  $ sum_i #scale(x: 120%, y: 120%)[\(] a_i - \( k_i - 2 \) upright(bold(1))_({ a_i = k_i })
    #scale(x: 120%, y: 120%)[\)] + ell med gt.eq med sum_i min { a_i \, 2 } + ell . $
  The top-mark cost is charged only for the complete core. For that set the exponent is $32 - 17 - 12 = 3$.
    Consequently every core subset has exponent at least the size of any admissible core subset it contains,
    and at least the smaller of two and its own cardinality.
  Now add the fresh fields of the four-letter entries. Adding one fresh field of an entry adds one to the
    exponent. Adding both adds two and can charge the cost two only if that entry’s two core fields are also
    present. The net contribution of each pair of fresh fields is therefore nonnegative.
    This proves Equation (4.5) when $S$ consists of core fields,
    and proves Equation (4.4) when $W$ has at least two core fields.
    If $W$ has fewer than two core fields, no four-letter entry is charged,
    and no fan or top entry is charged either. In that case $h \( W \) = \| W \|$.
    This proves Equation (4.4) in all cases. Finally, an admissible subset of one four-letter entry has size at
    most two, so its required bound follows from Equation (4.4). ◻
]

Fix a conditional test $\( I \, e \, t \)$. To couple $t$ matches agreeing on $I$,
  we will require them to agree on a possibly larger set $U$.
  The purpose of this enlargement is to make every further extension increase the critical exponent.
  For example, if $I$ consists of two fields in one fan $F_i$, then completing that fan leaves the exponent unchanged:

$ h \( I \) = 2 = h \( E \( F_i \) \) . $

Once the fan fields have been included, adjoining both fresh fields of any square whose two core fields lie in
  that fan also leaves the exponent unchanged. These are examples of the enlargements that the choice of $U$ must
  absorb.

In general, $\| I \| lt.eq 2$, and every entry support has at least three fields, so $h \( I \) = \| I \|$.
  Choose an inclusion-maximal set $U supset.eq I$ such that

#[#set math.equation(numbering: n => "(4.6)")
 $ h \( U \) = \| I \| . $ <sample:eq-closure>]

Such a set exists because the field set is finite. The next two properties are the reason for this choice:

#[#set math.equation(numbering: n => "(4.7)")
 $ e in.not U \, wide h \( U union V \) - h \( U \) gt.eq 1 quad
   upright("for every nonempty ") V subset.eq cal(F) \\ U . $ <sample:eq-closure-gap>]

The first follows from Equation (4.5) applied to $I union { e }$.
  For the second, every superset of $U$ has exponent at least $\| I \|$ by the same lemma applied to $I$.
  Maximality rules out equality for a strict superset, and all critical exponents are integers.

=== 4.2 Stars and their overlap estimates <stars-and-their-overlap-estimates>

Form a star $cal(M)_U^(\( t \))$ from $t$ ordered copies of $cal(M)$ by identifying all copies of each field in
  $U$. Entries supported entirely in $U$ are also identified. Each other entry retains one copy in each branch.
  We require assignments to this star to be #emph[injective in each field]:
  for each $s in cal(F) \\ U$, its $t$ branch values must be pairwise distinct.
  Values in different fields may coincide. All fields continue to take values in the same alphabet $S_n$.

This injectivity has two consequences. First, copies of an entry not supported in $U$ are distinct tuples in their
  array, since some one of their coordinates lies outside $U$.
  Second, when one branch is fixed, an entry in another branch that is not supported in $U$ cannot equal the
  corresponding entry of the fixed branch. Thus all random variables counted below are products of distinct
  Bernoulli trials, after explicitly removing any trials on which we have conditioned.

We give the overlap count in detail because the coordinates are not disjoint letter domains.
  An #emph[overlap type] between two star assignments specifies precisely which entries of each array coincide
  across the two stars. There are finitely many such types for fixed $t$.
  Each equality of array entries equates corresponding coordinates.
  For a given field $s in.not U$, injectivity implies that these equalities give a partial matching between the
  $t$ branch variables of the first star and those of the second.
  Different arrays may use different partial matchings; their union must still be a partial matching whenever the
  overlap type is realizable. Otherwise two different branch values of the same field would be forced equal.
  For $s in U$ there is just one variable in each star. In particular,
  an equality never compares two different coordinate fields, even if their numerical letter values happen to be equal.

Here is the resulting counting rule. Reveal the first assignment.
  Suppose the equalities of an overlap type prescribe the values of $q$ distinct,
  previously unpinned variables in the second assignment. For each field with unpinned variables,
  there are a bounded number of those variables, and they are chosen uniformly without replacement,
  possibly avoiding one already pinned value. A field whose variables are all pinned contributes a factor one.
  Prescribing $q_s$ of them has probability at most $C_t N^(- q_s)$:
  the number of remaining choices is at most $N^(r - q_s)$,
  whereas the number of unrestricted choices is a falling factorial $\( N - a \)_r$, with $r lt.eq
  t$ and $a in { 0 \, 1 }$. Multiplying over the finitely many fields gives

#[#set math.equation(numbering: n => "(4.8)")
 $ upright("fraction of pairs having the specified overlap") med lt.eq med
   C_t N^(- q) . $ <sample:eq-assignment-penalty>]

Incompatible specifications simply contribute zero.

If the coincident, unconditioned entries have total actual cost $C$,
  their joint inclusion probability divided by the product of the two individual inclusion probabilities is $N^C$.
  All other trials are independent. Consequently this overlap type contributes at most

#[#set math.equation(numbering: n => "(4.9)")
 $ C_t N^(- q + C) $ <sample:eq-variance-rule>]

to the relative variance of the count in question. Pairs with no coincident unconditioned entry have covariance
  zero, including when they have coincident values that do not complete any common entry.
  To justify the relative-variance normalization directly, all candidate assignments in any one of our counting
  problems have the same probability of inclusion, and Equation (4.8) bounds the fraction of pairs of such
  candidates. Summing their covariances and dividing by the square of the expectation gives Equation (4.9),
  summed over the finitely many nonempty overlap types.

We first apply this rule to a single copy of $cal(M)$. If $W$ is the set of fields belonging to its shared
  entries, then $q = \| W \|$ and the recovered cost is at most the sum of the costs of all entries supported in
  $W$. Its critical excess is therefore at least $h \( W \) > 0$.
  For sufficiently small actual parameters, every one of these finitely many positive excesses stays positive.
  It follows that

#[#set math.equation(numbering: n => "(4.10)")
 $ frac("Var" \| Omega_n \|, \( bb(E) \| Omega_n \| \)^2) = o \( 1 \) . $ <sample:eq-single-concentration>]

In particular the master count is asymptotic to its expectation in probability.
  We always choose the parameters small enough that the exponent in Equation (4.3) is positive.

For the two star counts, write

$ C_U \( theta \) = sum_(rho : E_rho subset.eq U) c_rho \( theta \) \, wide C_(upright("out")) \( theta \) =
  sum_(rho : E_rho subset.eq.not U) c_rho \( theta \) \, wide d = \| cal(F) \\ U \| . $

Let $Z_N$ be the number of present injective stars. With $\( N \)_t = N \( N - 1 \) dots.h.c \( N - t + 1 \)$,

#[#set math.equation(numbering: n => "(4.11)")
 $ bb(E) Z_N = N^(\| U \|) \( N \)_t^d N^(- C_U \( theta \) - t C_(upright("out")) \( theta \)) .
   $ <sample:eq-star-mean>]

#thm([Lemma 4.3.])[
  #emph[For each fixed conditional test, sufficiently small actual parameters have the following properties as $N
    arrow.r oo$.]
  + #emph[Fix any assignment $sigma : cal(F) arrow.r S_n$, place it in a specified branch,
    and condition on it being a match. Let $A_sigma$ count its extensions to a present injective star.
    Its conditional mean is independent of $sigma$ and equals
#[#set math.equation(numbering: n => "(4.12)")
 $ a_N = \( \( N - 1 \)_(t - 1) \)^d N^(- \( t - 1 \) C_(upright("out")) \( theta \)) . $ <sample:eq-extension-mean>]

 Uniformly in $sigma$, its conditional relative variance is $o \( 1 \)$.]
  + #emph[Fix any ordered list $b = \( b_1 \, dots.h \, b_t \)$ of distinct letters as the values of field $e$ in
    the branches. Let $B_b$ count the present injective stars having those values.
    Its mean is independent of $b$ and equals
#[#set math.equation(numbering: n => "(4.13)")
 $ b_N = N^(\| U \|) \( N \)_t^(d - 1) N^(- C_U \( theta \) - t C_(upright("out")) \( theta \)) .
   $ <sample:eq-leaf-mean>]

 Uniformly in $b$, its relative variance is $o \( 1 \)$.]
] <sample:lem-conditional-counts>

#proof[
  For the first assertion, condition only on the Bernoulli trials used by $sigma$.
    All other trials retain their original independent laws. Entries supported in $U$ have thereby been fixed
    present, as have the other entries of the specified branch.
    Every other branch uses new entries distinct from those conditioned trials.
    For each field outside $U$, its other $t - 1$ values are distinct and avoid the value in $sigma$,
    giving $\( N - 1 \)_(t - 1)$ choices. Each extra branch requires all the entries not supported in $U$,
    giving exactly Equation (4.12).
  Consider an overlap of the unconditioned entries of two such extensions.
    In extra branch $j$ of the first extension let $V_j$ consist of the outside-$U$ fields involved in its shared
    entries. The assignment penalty in Equation (4.8) is $sum_j \| V_j \|$:
    all $U$-values are fixed, whereas every involved outside-$U$ variable is free and, by injectivity,
    cannot match a value in the pinned branch. Charge each shared entry to its branch in the first extension.
    The recovered critical cost there is at most
  $ sum_(rho : E_rho subset.eq U union V_j \, med E_rho subset.eq.not U) c_rho . $
  Thus the critical excess of assignment penalty over recovered cost is at least
  $ sum_(j : V_j eq.not diameter) #scale(x: 120%, y: 120%)[\[] h \( U union V_j \) -
    h \( U \) #scale(x: 120%, y: 120%)[\]] gt.eq 1 $
  for every nonempty overlap, by Equation (4.7). The finitely many bounds remain strict for small actual
    parameters. Equations (4.8) and (4.9) prove the conditional relative variance claim,
    uniformly in the values of $sigma$. If $t = 1$, the extension count is identically one and there is no
    variance to estimate.
  For the second assertion, no Bernoulli trials are conditioned on; only letter values are pinned.
    Since $e in.not U$, its $t$ pinned values satisfy precisely its field-injectivity constraint.
    The other fields have $N^(\| U \|) \( N \)_t^(d - 1)$ choices, proving Equation (4.13).
  For an overlap let $W$ be the set of variables in the first star belonging to shared entries.
    Write $A = W ∩ U$, and let $V_j$ be its outside-$U$ fields in branch $j$.
    Let $m \( W \)$ be the number of its $e$-variables. In a realizable overlap an $e$-variable can only match the
    variable with the same pinned value; those equalities impose no further assignment penalty.
    All other involved variables do impose one. Thus $q = \| W \| - m \( W \)$ in Equation (4.8).
  Define $h_star.op \( W \)$ using the critical entry costs in the star,
    counting entries entirely in $U$ once and the other entries separately in each branch.
    The recovered cost is at most the cost of all star entries supported in $W$.
    Therefore the critical excess is at least
  #[#set math.equation(numbering: n => "(4.14)")
   $ h_star.op \( W \) - m \( W \) . $ <sample:eq-leaf-excess>]
  If $A eq.not diameter$, separating entries entirely in $U$ from the entries in each branch gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ h_star.op \( W \) & gt.eq h \( A \) + sum_(j : V_j eq.not diameter) #scale(x: 120%, y: 120%)[\[]
     h \( U union V_j \) - h \( U \) #scale(x: 120%, y: 120%)[\]] . $ <sample:eq-star-submodular>]
  Indeed the exact contribution of branch $j$ is $\| V_j \|$ minus the costs of entries supported in $A union
    V_j$ but not entirely in $U$; replacing $A$ by $U$ can only increase those costs.
    This proves the displayed inequality directly. Its first term is at least one by Lemma 17,
    and each nonempty summand is at least one by Equation (4.7).
    Each such branch contains at most one pinned $e$-variable. Hence the excess in Equation (4.14) is at least one.
  If $A = diameter$, no shared entry meets $U$, and entries in different branches use disjoint variables.
    Consequently $h_star.op \( W \) = sum_j h \( V_j \)$. An active branch contains the full support of at least
    one shared entry. Every entry support has at least three fields, so $\| V_j \| gt.eq
    3$ in such a branch and Lemma 17 gives $h \( V_j \) gt.eq 2$.
    Subtracting at most one pinned leaf per branch again leaves a positive excess.
    This argument is applied to supports of shared entries, not to arbitrary nonempty field subsets.
  All nonempty overlap types thus have critical excess at least one.
    Perturbing to sufficiently small actual parameters preserves a positive excess for every type.
    Equation (4.9), summed over those types, proves the second relative variance assertion.
    The bounds are uniform in the pinned letters because all assignment counts and Bernoulli probabilities used
    above are independent of their particular values. ◻
]

=== 4.3 Normalization to probability couplings <normalization-to-probability-couplings>

For probability measures $lambda \, lambda'$ on a finite set we use

$ d_(upright("TV")) \( lambda \, lambda' \) = 1 / 2 sum_z \| lambda \( z \) - lambda' \( z \) \| . $

All convergence statements about the random tables below are in probability as $N arrow.r oo$;
  equivalently one can choose deterministic error bounds tending to zero for which the corresponding assertions
  hold with probability tending to one.

#thm([Lemma 4.4.])[
  #emph[For each fixed conditional test and sufficiently small actual parameters,
    with probability tending to one there is a probability law on $t$ matches $\( sigma_1 \, dots.h \, sigma_t \)$
    such that:]
  + #emph[their restrictions to $I$ agree identically;]
  + #emph[every branch marginal has total-variation distance $o \( 1 \)$ from $mu_N$;]
  + #emph[the law of $\( sigma_1 \( e \) \, dots.h \, sigma_t \( e \) \)$ has total-variation distance $o \( 1 \)$
    from the uniform product law on $S_n^t$.]
] <sample:lem-coupling>

#proof[
  Use the uniform law on present injective stars. We verify that its normalization is nonzero and has the stated
    properties.
  Put $L_N = \| Omega_n \|$ and $lambda_N = bb(E) L_N$. For a specified branch let
  $ D_N = sum_(sigma in Omega_n) \| A_sigma - a_N \| . $
  The conditional variance bound of Lemma 18, followed by the Cauchy–Schwarz inequality,
    gives uniformly in each possible assignment $sigma$
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \| A_sigma - a_N \| divides sigma in Omega_n #scale(x: 120%, y: 120%)[\]] =
    o \( a_N \) . $
  Multiplying by the probability that $sigma$ is present and summing over all assignments shows $bb(E) D_N =
    o \( lambda_N a_N \)$. Markov’s inequality yields $D_N = o \( lambda_N a_N \)$ in probability.
    By Equation (4.10), $L_N \/ lambda_N arrow.r 1$ in probability. Since
  $ Z_N = sum_(sigma in Omega_n) A_sigma \, wide \| Z_N - L_N a_N \| lt.eq D_N \, $
  we have $Z_N \/ \( L_N a_N \) arrow.r 1$ in probability, and in particular $Z_N >
    0$ with probability tending to one. Moreover,
  $ sum_(sigma in Omega_n) lr(|A_sigma / Z_N - 1 / L_N|) & lt.eq D_N / Z_N + lr(|frac(L_N a_N, Z_N) - 1|) arrow.r 0 . $
  The same argument applies to each of the finitely many branches. This proves the marginal assertion.
    Agreement on $I$ is exact because the branches agree on $U supset.eq I$.
  For the leaves, let $cal(B)_N$ be the set of ordered distinct letter lists of length $t$,
    so $\| cal(B)_N \| = \( N \)_t$. By the second part of Lemma 18,
  $ bb(E) sum_(b in cal(B)_N) \| B_b - b_N \| = o \( \( N \)_t b_N \) . $
  Markov’s inequality and $sum_b B_b = Z_N$ imply that the total variation between the leaf distribution $B_b \/
    Z_N$ and the uniform distribution on $cal(B)_N$ tends to zero,
    by the same displayed normalization estimate with $\( N \)_t \, b_N$ in place of $L_N \, a_N$.
    Finally, an iid uniform list in $S_n^t$ has a repeated value with probability at most $binom(t, 2) \/ N$.
    Its distribution conditioned on distinctness is uniform on $cal(B)_N$. This proves the final assertion. ◻
]

=== 4.4 Finite tests, parameter choices, and the six-letter table <finite-tests-parameter-choices-and-the-six-letter-table>

The two marginal conclusions of the coupling serve different purposes.
  The branch comparison transfers averages of bounded tests between the coupled branches and a uniform match.
  In Lemma 25, a pointwise norm estimate bounds the average over the $t$ branches by a function of the $e$-labels
  alone; the common $I$-labels enter only through a uniform bound.
  The comparison with independent uniform letters then controls that function of the leaves.
  Thus the argument needs no independence between the common $I$-tuple and the test labels.

All critical overlap margins above are at least one. Each shared trial is charged once to its occurrence in the
  first star, which has at most $t$ copies of each array entry.
  Since $beta > 7 alpha$, all cost increments are positive.
  Replacing critical costs by actual costs therefore increases any recovered-cost sum by at most

$ t #scale(x: 120%, y: 120%)[\[] 7 alpha + \( beta - 7 alpha \) + 90 delta #scale(x: 120%, y: 120%)[\]] =
  t \( beta + 90 delta \) . $

Conditioning removes trials and can only decrease this bound; a single master match is covered by $t = 1$.
  For a finite family of tests, let $t_max$ be the largest requested value of $t$, or one if the family is empty.
  Choosing $t_max \( beta + 90 delta \) < 1 \/ 2$ preserves every overlap margin at a value at least $1 \/ 2$,
  including the singleton tests used below. This is compatible with $beta > 7 alpha > 0$:
  take $beta = 8 alpha$ and then take $alpha \, delta$ sufficiently small.
  The parameters are held fixed while $N$ tends to infinity.
  In particular, none of the variance arguments asserts uniformity for unbounded $t$ at a single fixed choice of
  parameters.

Let $cal(D)_N subset.eq S_n^6$ be the separate six-letter table.
  For positions $1 lt.eq r < q lt.eq 6$ and letters $u \, v$, write

$ Q_(r q) \( u \, v \) = \# { \( s_1 \, dots.h \, s_6 \) in cal(D)_N : s_r = u \, s_q = v } . $

Each such count is a sum of $N^4$ independent Bernoulli variables of parameter $N^(- 3 - delta)$,
  and so has mean $N^(1 - delta)$. For fixed $0 < delta < 1$, put $epsilon_N = N^(- \( 1 - delta \) \/ 4)$.
  The binomial Chernoff bound gives

$ bb(P) #scale(x: 120%, y: 120%)[\(] \| Q_(r q) \( u \, v \) -
  N^(1 - delta) \| > epsilon_N N^(1 - delta) #scale(x: 120%, y: 120%)[\)] lt.eq
  2 exp #scale(x: 120%, y: 120%)[\(] - epsilon_N^2 N^(1 - delta) \/ 3 #scale(x: 120%, y: 120%)[\)] . $

A union bound over the $15 N^2$ choices of positions and letters therefore proves

#[#set math.equation(numbering: n => "(4.16)")
 $ max_(r < q) max_(u \, v in S_n) lr(|frac(Q_(r q) \( u \, v \), N^(1 - delta)) - 1|) =
   o \( 1 \) $ <sample:eq-six-pair>]

with probability tending to one. No independence between these different counts is needed.

We collect the conclusions in the form used below.

#thm([Proposition 4.5.])[
  #emph[For any finite family $cal(T)$ of conditional tests,
    there is a neighborhood of the critical parameters such that every sufficiently small fixed positive
    $\( alpha \, beta \, delta \)$ in that neighborhood with $beta > 7 alpha$ has the following properties as $N
    arrow.r oo$. With probability tending to one, the master pattern has a nonempty set of matches, its count is
$ \| Omega_n \| = \( 1 + o \( 1 \) \) N^(3 - beta - 90 delta) \, $

 every single-field marginal of its uniform law $mu_N$ is $o \( 1 \)$ in total variation from the uniform law on
   $S_n$, and every test in $cal(T)$ has the coupling of Lemma 19.
   The six-letter counts also satisfy Equation (4.16). All these properties concern only the tables and are
   independent of any choice of action or metric space.]
] <prop:sampling>

#proof[
  Adjoin to $cal(T)$ the finitely many tests $\( diameter \, e \, 1 \)$, one for each field $e$.
    For such a test Equation (4.4) forces $U = diameter$, and its one-branch star is exactly a master match.
    The leaf assertion in Lemma 19 therefore gives single-field uniformity.
    Choose parameters satisfying all the finite overlap margins just described, $beta + 90 delta < 3$,
    and $delta < 1$. Equation (4.10), Lemma 19, and Equation (4.16), combined over this finite set of events,
    prove the proposition. ◻
]

#prodef([Remark 4.6.])[
  Proposition 20 is compatible with Theorem 7: for each finite family of tests,
    choose positive parameters sufficiently small for that family and the theorem,
    then the diagram fragment threshold, and finally $N$. The diagram and sampling events then hold simultaneously
    with probability tending to one. Lemma 36 constructs the deterministic diagonal sequence used below,
    with parameters tending to zero and every fixed test valid in the limit.
] <sample:rem-diagonal>

== 5 Energy and a limiting configuration <sec:energy>

The sampling statements in Proposition 20 concern finite tables alone.
  In this section they will be applied to functions obtained from an isometric action chosen after those tables
  are known. The order is important: we first obtain a bound on every generator displacement using the pointwise
  relative counts in the six-letter table. Only then do we use total variation estimates for action-dependent functions.

We use the following standard notation for a complete $"CAT" \( 0 \)$ space $X$.
  Its completed tangent cone at $x$ is denoted by $T_x X$, with vertex $0$.
  For $y in X$, the vector $log_x y$ has length $d \( x \, y \)$ and the direction of the geodesic from $x$ to
  $y$. In a Euclidean metric cone set

$ chevron.l u \, v chevron.r =
  frac(lr(bar.v.double u bar.v.double)^2 + lr(bar.v.double v bar.v.double)^2 - d \( u \, v \)^2, 2) . $

Thus $chevron.l u \, v chevron.r = lr(bar.v.double u bar.v.double) lr(bar.v.double v bar.v.double) cos
  angle \( u \, v \)$, where the angle is truncated at $pi$.
  Multiplication of a vector by a nonnegative real number always means radial dilation.
  No additive vector-space structure on a cone is assumed.

We will use strong convexity of squared distance, first variation, the flat-triangle equality theorem,
  and the tangent-cone theorem for $"CAT" \( 0 \)$ spaces; see #cite(label("BH1999")) Chapters II.1–II.3,
  in particular II.2.9–II.2.10, II.3.6, and II.3.19. These results do not require properness.
  In particular, comparison of angles with comparison angles gives

#[#set math.equation(numbering: n => "(5.1)")
 $ d \( y \, z \)^2 gt.eq d \( x \, y \)^2 + d \( x \, z \)^2 - 2 chevron.l log_x y \,
   log_x z chevron.r . $ <energy:log-comparison>]

All the tangent cones below are completed cones.

=== 5.1 A minimizing basepoint and uniform displacement bounds <a-minimizing-basepoint-and-uniform-displacement-bounds>

The first-variation characterization of an energy minimizer in a tangent cone is part of the harmonic-map
  framework of Gromov #cite(label("Gromov2003")) Sections 3.3 and 3.7 and
  Izeki–Nayatani #cite(label("IzekiNayatani2005")). We give the argument together with the existence of a
  minimizing basepoint under the action hypotheses used here.

#thm([Lemma 5.1.])[
  #emph[Let an infinite finitely generated group $G$ act properly and cocompactly by isometries on a proper
    complete $"CAT" \( 0 \)$ space $X$. For a finite symmetric generating alphabet $S$,
    counted with its given multiplicities, the function
$ E \( x \) = frac(1, \| S \|) sum_(s in S) d \( x \, s x \)^2 $

 has a minimizer and its minimum is positive. At any minimizing basepoint, the vectors $v_s = log_x \( s x \)$ satisfy
#[#set math.equation(numbering: n => "(5.2)")
 $ frac(1, \| S \|) sum_(s in S) chevron.l h \, v_s chevron.r lt.eq
   0 quad \( h in T_x X \) . $ <energy:zero-barycenter>]

 Equivalently, $0$ is their barycenter, and
#[#set math.equation(numbering: n => "(5.3)")
 $ frac(1, \| S \|) sum_(s in S) d \( h \, v_s \)^2 gt.eq lr(bar.v.double h bar.v.double)^2 +
   frac(1, \| S \|) sum_(s in S) lr(bar.v.double v_s bar.v.double)^2 . $ <energy:variance>]

]
] <energy:minimizer>

#proof[
  Choose a minimizing sequence $x_j$ and a compact set $C$ with $G C = X$.
    There are $g_j in G$ such that $y_j = g_j x_j in C$. Bounded energy bounds each individual displacement
    $d \( x_j \, s x_j \)$, since $S$ is finite. It therefore bounds
  $ d \( y_j \, \( g_j s g_j^(- 1) \) y_j \) . $
  The closed neighborhood of $C$ of any fixed finite radius is compact, by properness of $X$.
    Properness of the action implies that only finitely many group elements can carry a point of $C$ into that
    neighborhood. For each $s$ there are consequently only finitely many possibilities for $g_j s g_j^(- 1)$.
    Passing to a subsequence, the entire conjugated generating tuple is constant and $y_j$ converges to a point $y
    in C$. Its energy for that tuple is the original infimum.
    Fixing one element $g_(j_0)$ in the subsequence, the point $g_(j_0)^(- 1)
    y$ attains the infimum for the original tuple. An energy of zero would make all generators, and hence $G$,
    fix a point. A proper action has finite point stabilizers, so the minimum is positive.
  Fix a minimizing point $x$. First let $h$ be a tangent vector represented by a geodesic $x_t$ issuing from $x$,
    parameterized with initial speed $lr(bar.v.double  bar.v.double) h$.
    For sufficiently small $t > 0$, convexity at the midpoints of the crossed geodesics gives
  $ d \( x_t \, s x_t \)^2 lt.eq 1 / 2 d \( x_(2 t) \, s x \)^2 + 1 / 2 d \( x \, s x_(2 t) \)^2 . $
  After averaging over the symmetric alphabet, the two terms on the right have the same average:
    apply $s^(- 1)$ to the second distance and replace $s$ by $s^(- 1)$. Minimality and first variation now imply
  $ 0 lt.eq frac(d, d t)\|_(0 +) frac(1, \| S \|) sum_s d \( x_(2 t) \, s x \)^2 = -
    frac(4, \| S \|) sum_s chevron.l h \, v_s chevron.r . $
  Represented vectors are dense in the completed tangent cone, so continuity gives Equation (5.2) for every $h$.
    The cone cosine formula immediately gives Equation (5.3);
    in particular $0$ minimizes the mean squared distance to the $v_s$. ◻
]

For each aspherical instance $P$ of Theorem 7, its group $G$ is infinite.
  Indeed, the parity quotient in Lemma 4 makes $G$ nontrivial.
  If $G$ were finite, the universal cover would be a finite contractible complex and

$ 1 = chi \( tilde(P) \) = \| G \| chi \( P \) \, $

which forces $\| G \| = 1$. Thus Lemma 22 applies to any geometric action considered here.
  Rescale its metric so that at the minimizing basepoint

#[#set math.equation(numbering: n => "(5.4)")
 $ 1 / N sum_(s in S_n) lr(bar.v.double v_s bar.v.double)^2 = 1 . $ <energy:normalization>]

Rescaling preserves completeness, properness, and the $"CAT" \( 0 \)$ condition.

#thm([Lemma 5.2.])[
  #emph[Suppose the six-letter table has pointwise relative error at most $epsilon <
    1$ in the counts for positions $1$ and $k$, for every $2 lt.eq k lt.eq 6$.
    Then every action normalized as in Equation (5.4) satisfies
#[#set math.equation(numbering: n => "(5.5)")
 $ max_(s in S_n) lr(bar.v.double v_s bar.v.double)^2 lt.eq
   25 frac(1 + epsilon, 1 - epsilon) . $ <energy:max-displacement>]

 The bound is independent of the action.]
] <energy:displacement-bound>

#proof[
  Write $Q_(1 k) \( a \, b \)$ for the number of included rows whose first coordinate is $a$ and whose $k$th
    coordinate is $b$. The asserted relative estimate is
  $ \( 1 - epsilon \) N^(1 - delta) lt.eq Q_(1 k) \( a \, b \) lt.eq \( 1 + epsilon \) N^(1 - delta) . $
  Summing over $b$ shows that rows beginning with any fixed $a$ are nonempty and that their conditional
    $k$th-coordinate distribution is bounded above, pointwise, by
  $ frac(1 + epsilon, 1 - epsilon) 1 / N . $
  The relation attached to a row $\( a \, s_2 \, dots.h \, s_6 \)$ gives $a^(- 1) = s_2 dots.h.c s_6$.
    Since $d \( x \, a^(- 1) x \) = d \( x \, a x \)$, the triangle inequality and Cauchy–Schwarz give
  $ lr(bar.v.double v_a bar.v.double)^2 lt.eq 5 sum_(k = 2)^6 lr(bar.v.double v_(s_k) bar.v.double)^2 . $
  Average over the rows beginning with $a$ and use the preceding pointwise bound and Equation (5.4).
    Each of the five conditional averages is at most $\( 1 + epsilon \) \/ \( 1 - epsilon \)$,
    proving the assertion. This uses only nonnegative weights,
    and therefore holds even when the weights were chosen from an action after the table was revealed. ◻
]

=== 5.2 Conditional tests in tangent cones <conditional-tests-in-tangent-cones>

For a geodesic from $u$ to $v$ in a $"CAT" \( 0 \)$ Euclidean cone,
  write $\[ u \, v \]_t$ for its point at parameter $t$. Its squared radial norm satisfies the exact identity

#[#set math.equation(numbering: n => "(5.6)")
 $ lr(bar.v.double \[ u \, v \]_t bar.v.double)^2 = \( 1 - t \) lr(bar.v.double  bar.v.double) u^2 +
   t lr(bar.v.double  bar.v.double) v^2 - t \( 1 - t \) d \( u \, v \)^2 . $ <energy:radial-identity>]

If either endpoint is the cone vertex, the identity is immediate.
  Otherwise the segment is a Euclidean segment in the sector between its two rays when their angular distance is
  less than $pi$. When their angular distance is at least $pi$, it passes through the cone vertex,
  and $lr(bar.v.double \[ u \, v \]_t bar.v.double) = \| \( 1 - t \) lr(bar.v.double  bar.v.double) u -
  t lr(bar.v.double  bar.v.double) v \|$ gives the same identity.
  These two cases follow directly from the Euclidean-cone metric;
  see #cite(label("BH1999")) Definition I.5.6 and Proposition I.5.10(1)–(2).

The scalar-product concavity used next is recorded by Gigli–Nobili #cite(label("GigliNobili2021"))
  Proposition 2.6, equation (2.7f), and the proof of Proposition 3.8.
  The inductive-mean estimate is the unit-variance case of Sturm’s bound #cite(label("Sturm2003")) Definition 4.6
  and Theorem 4.7, proof (a). We include the short proofs in the present normalization.

#thm([Lemma 5.3.])[
  #emph[In a complete $"CAT" \( 0 \)$ metric cone, $u mapsto chevron.l h \,
    u chevron.r$ is concave along every geodesic, for fixed $h$.
    Suppose a finite probability distribution of vectors $V$ has barycenter $0$ and $bb(E)
    lr(bar.v.double  bar.v.double) V^2 = 1$. If $V_1 \, dots.h \, V_t$ are independent samples and
$ m_1 = V_1 \, wide m_j = \[ m_(j - 1) \, V_j \]_(1 \/ j) \, $

 then
#[#set math.equation(numbering: n => "(5.7)")
 $ bb(E) lr(bar.v.double m_t bar.v.double)^2 lt.eq 1 / t . $ <energy:inductive-mean>]

 For any deterministic list $V_1 \, dots.h \, V_t$ one also has
#[#set math.equation(numbering: n => "(5.8)")
 $ 1 / t sum_(j = 1)^t chevron.l h \, V_j chevron.r lt.eq chevron.l h \, m_t chevron.r . $ <energy:mean-concavity>]

]
] <energy:cone-mean>

#proof[
  Subtract strong convexity of $d \( h \, dot.op \)^2$ from Equation (5.6) in the identity $2 chevron.l h \,
    u chevron.r = lr(bar.v.double  bar.v.double) h^2 + lr(bar.v.double  bar.v.double) u^2 - d \( h \, u \)^2$.
    The quadratic terms cancel, proving concavity. Induction gives Equation (5.8).
  For the independent samples, condition on $m_(j - 1) = u$.
    The barycenter variance inequality gives $bb(E) \[ d \( u \, V_j \)^2 divides u \] gt.eq
    lr(bar.v.double  bar.v.double) u^2 + 1$. Strong convexity of squared distance from the cone vertex therefore
    gives, with $a_j = bb(E) lr(bar.v.double m_j bar.v.double)^2$,
  $ a_j lt.eq \( 1 - 1 \/ j \)^2 a_(j - 1) + 1 \/ j^2 . $
  Starting with $a_1 = 1$, induction yields $a_j lt.eq 1 \/ j$. ◻
]

Consider now a sequence of table instances indexed by $nu$ for which the conclusions of Proposition 20 hold with
  errors tending to zero, for every fixed test and every fixed positive integer $t$.
  Suppose their groups have geometric actions as above, and choose the normalized minimizing basepoints $x_nu$.
  Write $Omega_nu = Omega_(n_nu)$ for the nonempty finite set of master matches and $mu_nu =
  mu_(N_nu)$ for its uniform distribution. Lemma 23 gives an absolute constant $M$ such that

#[#set math.equation(numbering: n => "(5.9)")
 $ lr(bar.v.double v_s bar.v.double) lt.eq M quad upright("for all letters in all sufficiently large instances.")
   $ <energy:uniform-bound>]

All statements about the limit are unchanged by discarding finitely many instances.
  The actions, their spaces, and the functions in the next lemma may depend on the complete table instances.

#thm([Lemma 5.4.])[
  (Uniform conditional test).  #emph[Let $I$ and ${ e }$ be disjoint sets of fields with admissible union.
    For each $nu$, let $h_I$ be a function of the labels on $I$ with values in $T_(x_nu) X_nu$,
    and suppose $lr(bar.v.double h_I bar.v.double) lt.eq B$ for a constant independent of $nu$ and the match.
    For either fixed choice $sigma \( s \) = s$ or $sigma \( s \) = s^(- 1)$,
#[#set math.equation(numbering: n => "(5.10)")
 $ limsup_(nu arrow.r oo) bb(E)_(mu_nu) chevron.l h_I \, v_(sigma \( e \)) chevron.r lt.eq
   0 . $ <energy:conditional-test>]

 Here $e$ in a subscript denotes the letter occupying that field.]
] <lem:conditional-test>

#proof[
  Fix $t$. Use the coupling in Proposition 20: it gives $t$ matches agreeing on $I$,
    each branch marginal at total variation distance at most $eta_(nu \, t)$ from $mu_nu$,
    and their $e$-labels at distance at most $eta_(nu \, t)$ from independent uniform letters,
    where $eta_(nu \, t) arrow.r 0$. Increasing the error if necessary allows one bound for all these comparisons.
    Applying the fixed inversion $sigma$ preserves this assertion.
  The vector $h_I$ has the same value in every branch. Form the inductive mean $m_t$ of the branch vectors
    $v_(sigma \( e_j \))$. Equation (5.8) gives, for every coupled tuple,
  $ 1 / t sum_(j = 1)^t chevron.l h_I \, v_(sigma \( e_j \)) chevron.r lt.eq chevron.l h_I \, m_t chevron.r lt.eq
    B lr(bar.v.double m_t bar.v.double) . $
  The last step uses only the norm bound; it does not assume that $h_I$ is independent of the leaves.
  Under independent uniform leaves, Equation (5.7) applies by Equations (5.3) and (5.4).
    Under the coupling, $lr(bar.v.double m_t bar.v.double) lt.eq M$, by convexity of the ball of radius $M$.
    Consequently the total variation comparison changes the expected squared norm by at most $2 M^2
    eta_(nu \, t)$. The branch comparisons change the expectation of each scalar-product test by at most $2 B M
    eta_(nu \, t)$. It follows that
  $ bb(E)_(mu_nu) chevron.l h_I \, v_(sigma \( e \)) chevron.r lt.eq B sqrt(1 \/ t + 2 M^2 eta_(nu \, t)) +
    2 B M eta_(nu \, t) . $
  First take the upper limit in $nu$ with $t$ fixed, and then let $t arrow.r oo$.
    All error bounds used only $B$ and $M$, so the conclusion is uniform over the action-dependent functions in
    the statement. ◻
]

=== 5.3 Products of orbit configurations <products-of-orbit-configurations>

Enlarge $Gamma$ by adding, for each of its prescribed two-edge paths,
  the complementary two-edge path of its decoration square.
  Denote this fixed finite graph by $hat(Gamma)$; its additional midpoint vertices are distinct abstract vertices.
  A master match gives a consistent orbit realization of this graph in $X_nu$:
  choose one anchor at $x_nu$, and send a vertex reached by the successive letters $s_1 \, dots.h \,
  s_k$ to $s_1 dots.h.c s_k x_nu$. All core closed walks are relations,
  and the decoration square relations guarantee consistency on the added paths.
  Fixing one path for each vertex shows that these orbit points are at distance at most $L M$ from $x_nu$,
  where $L$ depends only on $hat(Gamma)$.

Take the finite product over the matches with metric

#[#set math.equation(numbering: n => "(5.11)")
 $ d_nu \( \( y_m \) \, \( z_m \) \)^2 = frac(1, \| Omega_nu \|) sum_(m in Omega_nu) d \( y_m \, z_m \)^2 \,
   $ <energy:product-metric>]

based at the tuple of minimizing basepoints. It is a complete $"CAT" \( 0 \)$ space.
  The vertex tuples have bounded distance from this basepoint.
  Fix a nonprincipal ultrafilter on the sequence index set $bb(N)$ and take the pointed metric ultralimit $Z$.
  This space is complete by #cite(label("BH1999")) Lemma I.5.53,
  and it is $"CAT" \( 0 \)$ by #cite(label("BH1999")) Corollary II.3.10(2).
  The bounded vertex tuples give a configuration in $Z$ indexed by the vertices of $hat(Gamma)$.
  Midpoints and fixed-fraction points on segments in the products are formed coordinatewise,
  and their ultralimits are the corresponding points in $Z$ by uniqueness of geodesics.
  We identify the abstract vertex names with the resulting points.
  Neither properness nor a dimension bound for $Z$ is needed.

#thm([Lemma 5.5.])[
  #emph[Every edge in $hat(Gamma)$ has length one in $Z$. Every two-step path using two distinct fields of one
    decoration square has squared endpoint distance at least two.
    More generally, a path of $k lt.eq 3$ distinct core fields whose field set is admissible has squared endpoint
    distance at least $k$.]
] <energy:path-bounds>

#proof[
  For an edge with letter $s$, translation at its initial orbit vertex identifies its squared length with
    $lr(bar.v.double v_s bar.v.double)^2$, or with the same quantity for $s^(- 1)$.
    Single-field total variation convergence, Equation (5.9),
    and the normalization show that its squared product length tends to one.
  For a path with oriented readings $a_1 \, dots.h \, a_k$, translate its penultimate orbit vertex to $x_nu$.
    Its earlier endpoint then becomes $a_(k - 1)^(- 1) dots.h.c a_1^(- 1) x_nu$,
    and its next endpoint becomes $a_k x_nu$. Set
  $ h_I = log_(x_nu) \( a_(k - 1)^(- 1) dots.h.c a_1^(- 1) x_nu \) . $
  This is a function of precisely the preceding labels, and $lr(bar.v.double h_I bar.v.double) lt.eq \( k - 1 \)
    M$. Equation (5.1) gives
  $ d \( u_0 \, u_k \)^2 gt.eq d \( u_0 \, u_(k - 1) \)^2 + lr(bar.v.double v_(a_k) bar.v.double)^2 -
    2 chevron.l h_I \, v_(a_k) chevron.r $
  in every factor. Average, apply Lemma 25, and take the ultralimit. Induction adds at least one at each step.
    Every prefix of the field sets in the statement is admissible,
    so the conditional test is available at each step. Distinct fields here need not carry distinct numerical
    letter values. ◻
]

=== 5.4 Quadrilateral equality and hexagon centers <quadrilateral-equality-and-hexagon-centers>

The path estimates give lower bounds on squared distances.
  We now compare them with a $"CAT" \( 0 \)$ upper bound on the sum of the two diagonal squares of a
  quadrilateral. Equality will first determine the diagonals of every decoration square,
  and then force the three opposite pairs in each core hexagon to share a midpoint.

#thm([Lemma 5.6.])[
  #emph[For four points $z_1 \, z_2 \, z_3 \, z_4$ in a $"CAT" \( 0 \)$ space, let $m =
    "mid" \( z_1 \, z_3 \)$ and $n = "mid" \( z_2 \, z_4 \)$. Then
#[#set math.equation(numbering: n => "(5.12)")
 $ d \( z_1 \, z_3 \)^2 + d \( z_2 \, z_4 \)^2 + 4 d \( m \, n \)^2 lt.eq
   sum_(i = 1)^4 d \( z_i \, z_(i + 1) \)^2 \, wide z_5 = z_1 . $ <energy:quadrilateral-inequality>]

 In particular, equality between the two diagonal-square sum and the side-square sum forces the diagonal midpoints
   to coincide.]
] <energy:quadrilateral>

#proof[
  Apply midpoint convexity to $d \( m \, z_2 \)^2$ and $d \( m \, z_4 \)^2$ using the segment $z_1 z_3$,
    and then to $d \( m \, n \)^2$ using $z_2 z_4$. Substituting the first two inequalities into the third and
    multiplying by four gives Equation (5.12). ◻
]

Each decoration square has unit sides. Both of its diagonals have squared length at least two by Lemma 26.
  Lemma 27 forces both squared lengths to equal two. In particular,

#[#set math.equation(numbering: n => "(5.13)")
 $ d \( u \, w \)^2 = 2 quad upright("for every nonbacktracking two-edge core path ") u \, v \,
   w . $ <energy:two-step-equality>]

Every such path was assigned a decoration table, including paths whose two fields lie in the same fan.

Recall that a core hexagon is obtained from three noncollinear Fano points $i \, j \, k$, their joining lines,
  and a choice of $X$ or an available $Y$ representative at each of the three points,
  with all six required edges present. The squared distances of its vertices $z_0 \, dots.h \,
  z_5$ at cyclic separation one and two are, respectively, one and two.
  Each three-edge half-path uses at most two fields of any one fan,
  so its opposite endpoints have squared distance at least three.

Apply Lemma 27 to $\( z_0 \, z_1 \, z_3 \, z_4 \)$. The side-square sum is $1 + 2 + 1 + 2 = 6$,
  whereas each diagonal-square is at least three. Both are therefore three and their midpoints coincide.
  Applying the same argument to $\( z_1 \, z_2 \, z_4 \, z_5 \)$ identifies the third opposite-pair midpoint with
  the first two. Denote the resulting center of this hexagon by $c$. Every vertex has distance

#[#set math.equation(numbering: n => "(5.14)")
 $ r = sqrt(3) / 2 $ <energy:radius>]

from $c$.

#thm([Lemma 5.7.])[
  #emph[For a core hexagon, every triangle formed by its center and two of its vertices is Euclidean flat,
    including the degenerate case of opposite vertices. The corresponding tangent vectors satisfy
#[#set math.equation(numbering: n => "(5.15)")
 $ chevron.l log_c z_i \, log_c z_j chevron.r = r^2 - 1 / 2 d \( z_i \, z_j \)^2 . $ <energy:hexagon-products>]

]
] <energy:hexagon-flatness>

#proof[
  The opposite pairs are geodesic segments through $c$, so their directions in $T_c
    Z$ are antipodal and their radial lengths are $r$. If $v^(+)$ and $v^(-)$ are any such opposite vectors,
    the angular triangle inequality implies
  #[#set math.equation(numbering: n => "(5.16)")
   $ chevron.l u \, v^(+) chevron.r + chevron.l u \, v^(-) chevron.r lt.eq
     0 quad \( u in T_c Z \) . $ <energy:antipodal-products>]
  Indeed, the two angles from $u$ to their directions have sum at least $pi$,
    and the sum of their cosines is nonpositive.
  Set $u = log_c z_i$, $v^(+) = log_c z_j$, and $v^(-) = log_c z_(j + 3)$, with indices modulo six. Log comparison gives
  $ chevron.l u \, v^(+) chevron.r gt.eq r^2 - 1 / 2 d \( z_i \, z_j \)^2 \, wide chevron.l u \,
    v^(-) chevron.r gt.eq r^2 - 1 / 2 d \( z_i \, z_(j + 3) \)^2 . $
  The two prescribed squared distances sum to $3 = 4 r^2$, so the lower bounds sum to zero.
    Equation (5.16) forces equality in each bound. Thus the angle at $c$ equals its Euclidean comparison angle.
    For a nondegenerate triangle the flat-triangle equality theorem gives a flat triangle;
    for an opposite or repeated pair the statement is a segment or a point. ◻
]

#thm([Lemma 5.8.])[
  #emph[All core hexagons have the same center $c$. Every core vertex lies in a core hexagon,
    and hence is at distance $r$ from $c$.]
] <energy:common-center>

#proof[
  First use only $X$ representatives. A noncollinear ordered triple of Fano points is a basis of $bb(F)_2^3$.
    Reordering a basis does not change its hexagon, and replacing one basis vector $i$ by $i +
    j$ preserves the line $i j$ and the third point $k$. The old and new hexagons therefore share the opposite
    pair $\( X_k \, i j \)$, and their centers are its common midpoint.
    Permutations and elementary additions generate all changes of basis over $bb(F)_2$,
    so the centers of all $X$ hexagons agree.
  Replace one $Y$ representative in a core hexagon by its $X$ representative.
    The new hexagon is a core hexagon, since every corresponding $X$ edge exists.
    Either of the unchanged point representatives, together with its opposite line,
    is an opposite pair shared by the two hexagons. Their centers agree.
    Repeating this replacement connects every core hexagon to one using only $X$ representatives.
  Every $X_i$ lies in a hexagon obtained by extending $i$ to a basis.
    Every line lies in one by choosing two points spanning that line and a third point outside it.
    Each $Y_i$ has two distinct incident lines available. Choose a point other than $i$ on each of them;
    these two points together with $i$ are noncollinear and yield a core hexagon containing $Y_i$.
    This includes $Y_D$, using its two full lines. The radius assertion follows. ◻
]

=== 5.5 The ternary midpoint test <the-ternary-midpoint-test>

The square and hexagon comparisons have supplied a common center.
  We now use three admissible core fields to control one further angle:
  the angle at $C D$ between the segment to the midpoint of $X_C \, Y_C$ and the loose edge to $X_D$.

Put

$ H_0 = C D \, wide p = X_C \, wide q = Y_C \, wide z = X_D \, wide J = "mid" \( p \, q \) $

in $Z$. The following argument gives an angle statement in $Z$ without any assumption that angles commute with
  ultralimits.

Choose another line $H eq.not H_0$ through $C$. The core four-cycle $\( p \, H_0 \, q \, H \)$ has unit sides and
  both diagonals of squared length two, by Equation (5.13). Its diagonal midpoints coincide by Lemma 27, so

#[#set math.equation(numbering: n => "(5.17)")
 $ J = "mid" \( H_0 \, H \) \, wide d \( H_0 \, J \)^2 = 1 / 2 \, wide d \( H_0 \, z \) = 1 . $ <energy:ternary-radii>]

In each orbit factor let $J_m$ be the midpoint of the realizations of $p$ and $q$.
  Translate the realization of $H_0$ to $x_nu$. The realizations of $p \,
  q$ are then given by the two letters on the adjacent $F_C$ edges, with their fixed orientation signs.
  Therefore the translated vector toward $J_m$ is a function $h_I$ of just those two fields,
  with norm at most $M$. The translated vector toward $z$ is $v_(sigma \( e_0 \))$,
  where $e_0$ is the loose field. These three fields are admissible.
  Lemma 25 shows that the upper limit of the averaged scalar product of these two vectors is at most zero.

Fix $a \, b in \( 0 \, 1 \]$. In each factor take the points at fractions $a \,
  b$ along the segments from $H_0$ to $J_m \, z$. Their tangent vectors are the corresponding scalar multiples of
  the two vectors just considered. Apply Equation (5.1), average over factors, and take the ultralimit.
  Denoting the limiting fractional points by $J_a \, z_b$, respectively, gives

#[#set math.equation(numbering: n => "(5.18)")
 $ d \( J_a \, z_b \)^2 gt.eq a^2 d \( H_0 \, J \)^2 + b^2 d \( H_0 \, z \)^2 = a^2 / 2 +
   b^2 . $ <energy:fractional-angle>]

Thus every such comparison angle at $H_0$ is at least $pi \/ 2$. Letting both fractions decrease to zero in $Z$ proves

#[#set math.equation(numbering: n => "(5.19)")
 $ angle_(H_0) \( J \, z \) gt.eq pi / 2 . $ <energy:ternary-angle>]

Only distances of fixed-fraction points passed through the ultralimit;
  the angle was computed afterwards in the limiting space.

=== 5.6 The resulting finite configuration <the-resulting-finite-configuration>

We collect the conclusions in the form needed in Section 6.

#thm([Proposition 5.9.])[
  #emph[Let $P_nu$ be a sequence of aspherical instances whose master-match statistics and six-letter relative
    counts satisfy the conclusions of Proposition 20, with errors tending to zero for every fixed test and every
    fixed $t$. If every $pi_1 \( P_nu \)$ has a proper cocompact isometric action on a proper complete
    $"CAT" \( 0 \)$ space, then there are a complete $"CAT" \( 0 \)$ space $Z$,
    a configuration indexed by the core vertices of $Gamma$, and a point $c in Z$ with the following properties.]
  + #emph[Every core edge has length one. Every nonbacktracking two-edge core path has squared endpoint distance
    two. Every three-edge core path with distinct admissible fields has squared endpoint distance at least three.]
  + #emph[Every core hexagon has its three opposite-pair midpoints equal to $c$.
    All core vertices have distance $r = sqrt(3) \/ 2$ from $c$.
    For any two vertices occurring in one core hexagon, their central triangle with $c$ is flat and their tangent
    scalar product is given by Equation (5.15).]
  + #emph[With $H_0 = C D$ and $J = "mid" \( X_C \, Y_C \)$, one has
$ d \( H_0 \, J \)^2 = 1 / 2 \, wide d \( H_0 \, X_D \) = 1 \, wide angle_(H_0) \( J \, X_D \) gt.eq pi / 2 . $

 More precisely, all the fractional-point inequalities in Equation (5.18) hold.]
] <prop:configuration>

#proof[
  Use the normalized minimizing actions of Lemma 22 and the uniform bound of Lemma 23.
    The product construction, Lemma 26, and the decoration-square argument give the first assertion.
    Lemmas 28 and 29 give the second. The fixed-fraction argument above gives the third. ◻
]

== 6 The geometric obstruction <sec:obstruction>

We now show that the configuration obtained in Proposition 30 cannot occur in a complete $"CAT" \( 0 \)$ space.
  The argument takes place first in that space and then in its completed tangent cone at the common hexagon
  center. The tangent cone is not assumed to be a vector space,
  so we specify the meaning of its sums and use concavity whenever an additive inequality is required.

=== 6.1 Cone notation and square rigidity <cone-notation-and-square-rigidity>

For a $"CAT" \( 0 \)$ Euclidean cone $T$ with vertex $0$, let $delta_a$ denote radial dilation by $a gt.eq 0$.
  Write $a u = delta_a \( u \)$ and

$ lr(bar.v.double u bar.v.double) = d_T \( 0 \, u \) \, wide chevron.l u \, v chevron.r =
  frac(lr(bar.v.double u bar.v.double)^2 + lr(bar.v.double v bar.v.double)^2 - d_T \( u \, v \)^2, 2) . $

For nonzero vectors this last expression is $lr(bar.v.double u bar.v.double) lr(bar.v.double v bar.v.double) cos
  angle \( u \, v \)$, where the angular distance is truncated at $pi$. Define

#[#set math.equation(numbering: n => "(6.1)")
 $ u xor v = 2 "mid" \( u \, v \) . $ <geom:cone-addition>]

This operation is commutative, but no associativity or cancellation law will be used.
  If the directions of $u \, v$ are joined by a geodesic of length less than $pi$, its cone is a Euclidean sector,
  and $u xor v$ is the ordinary vector sum in that sector. More generally,
  all two-vector calculations below are either made in such a sector or follow from the metric definition in
  Equation (6.1).

The scalar-product concavity established in Lemma 24 implies

#[#set math.equation(numbering: n => "(6.2)")
 $ chevron.l w \, u xor v chevron.r gt.eq chevron.l w \, u chevron.r + chevron.l w \,
   v chevron.r . $ <geom:sum-concavity>]

Indeed, apply concavity at the midpoint of $u \, v$ and use homogeneity under radial dilation.
  This is an inequality in a general cone; we will not replace it by an equality without establishing rigidity.

We use two established equality principles for $"CAT" \( 0 \)$ spaces.
  A triangle is flat if one vertex angle equals its Euclidean comparison angle,
  or if a nontrivial interior comparison inequality is an equality;
  see #cite(label("BH1999")) Proposition II.2.9 and Exercise II.2.10(1) and #cite(label("Ballmann1995"))
  Proposition I.3.13(ii). Here and below, flat means that the convex hull is isometric to the corresponding
  Euclidean triangle.

#thm([Lemma 6.1.])[
  (Square rigidity).  #emph[Let $p_0 \, p_1 \, p_2 \, p_3$ be points of a $"CAT" \( 0 \)$ space,
    with indices taken modulo four. Suppose
$ d \( p_i \, p_(i + 1) \) = 1 \, wide d \( p_0 \, p_2 \) = d \( p_1 \, p_3 \) = sqrt(2) . $

 Their convex hull is a unit Euclidean square, in the indicated cyclic order.
   In particular, the two diagonals have the same midpoint.]
] <geom:square>

#proof[
  Let $o$ be the midpoint of $p_0 \, p_2$. Squared-distance convexity gives
  $ d \( o \, p_1 \)^2 lt.eq 1 / 2 \, wide d \( o \, p_3 \)^2 lt.eq 1 / 2 . $
  Since
  $ sqrt(2) = d \( p_1 \, p_3 \) lt.eq d \( p_1 \, o \) + d \( o \, p_3 \) lt.eq sqrt(2) \, $
  both inequalities are equalities and $o$ is also the midpoint of $p_1 \, p_3$.
    The equality for $d \( o \, p_1 \)$ is an interior comparison equality in the triangle $p_1 \, p_0 \, p_2$,
    so that triangle is flat. The same argument, with each of the four vertices as the vertex opposite a diagonal
    midpoint, makes each triangle on three consecutive vertices flat.
    The angle at each corner of the quadrilateral is therefore $pi \/ 2$.
    The flat quadrilateral theorem #cite(label("BH1999")) Theorem II.2.11 applies:
    the sum of these four angles is $2 pi$. Its Euclidean quadrilateral has the prescribed sides and diagonals,
    and hence is a unit square. ◻
]

=== 6.2 The sums at the four doubled points <the-sums-at-the-four-doubled-points>

Suppose that $Z$ is a complete $"CAT" \( 0 \)$ space containing the configuration from Proposition 30.
  Use the graph vertex names for the corresponding points of $Z$. Let $c$ be the common hexagon center and put

$ r = sqrt(3) / 2 \, wide T = T_c Z . $

The completed tangent cone $T$ is $"CAT" \( 0 \)$, and its completed space of directions is $"CAT" \( 1 \)$ by
  #cite(label("BH1999")) Theorem II.3.19. Write

$ x_i = log_c X_i \, wide y_i = log_c Y_i \, wide h_H = log_c H $

for the named radial vectors, and abbreviate $h_(i j) = h_H$ when $H = i j$. All these vectors have norm $r$.

Any two distinct line vertices $H \, H'$ occur together in a core hexagon:
  take their intersection point $i$, choose a point $j eq.not i$ on $H$ and a point $k eq.not i$ on $H'$,
  and use the $X$ representatives of the noncollinear triple $i \, j \, k$.
  Their central triangle is flat by Proposition 30, and their distance is $sqrt(2)$. Consequently

#[#set math.equation(numbering: n => "(6.3)")
 $ chevron.l h_H \, h_(H') chevron.r = - 1 / 4 quad upright("for distinct lines ") H \, H' . $ <geom:line-products>]

A line through a doubled point $i in { A \, B \, C \, D }$ is called #emph[full at $i$] if it is adjacent to both
  $X_i$ and $Y_i$. All lines through $A \, B \, C$ are full; the full lines at $D$ are $A D \, B D$.

#thm([Lemma 6.2.])[
  (Fan identities).  #emph[For $i in { A \, B \, C \, D }$ there is a unit vector $M_i in T$ such that
#[#set math.equation(numbering: n => "(6.4)")
 $ M_i = x_i xor y_i = h_H xor h_(H') quad upright("whenever ") H \,
   H' upright(" are distinct full lines at ") i . $ <geom:fan-identities>]

 Each sum displayed here is computed in a nondegenerate Euclidean sector. Moreover,
#[#set math.equation(numbering: n => "(6.5)")
 $ chevron.l x_i \, y_i chevron.r = - 1 / 4 \, wide chevron.l M_i \, h_H chevron.r = chevron.l M_i \,
   h_(H') chevron.r = 1 / 2 . $ <geom:fan-products>]

]
] <geom:fan-sums>

#proof[
  The four-cycle $X_i \, H \, Y_i \, H'$ has unit sides and diagonals of length $sqrt(2)$,
    by the two-step assertions of Proposition 30. Lemma 31 makes it a flat square.
    Let $J_i$ be its center, which is the midpoint of $X_i \, Y_i$ and also of $H \, H'$.
  The triangle $c \, H \, H'$ is flat. Its median therefore gives
  $ d \( c \, J_i \)^2 = r^2 - 1 / 4 d \( H \, H' \)^2 = 1 / 4 . $
  On the other hand, squared-distance convexity in the triangle $c \, X_i \, Y_i$ has right-hand side
  $ 1 / 2 d \( c \, X_i \)^2 + 1 / 2 d \( c \, Y_i \)^2 - 1 / 4 d \( X_i \, Y_i \)^2 = 1 / 4 . $
  Thus this is also an equality, and $c \, X_i \, Y_i$ is a flat triangle.
    Taking its midpoint in the tangent cone proves
  $ x_i xor y_i = 2 log_c J_i = h_H xor h_(H') . $
  Define $M_i = 2 log_c J_i$; it has norm one. The left-hand side makes it independent of the full-line pair
    chosen. The cosine law gives $chevron.l x_i \, y_i chevron.r = - 1 \/ 4$.
    The pair $h_H \, h_(H')$ has angular separation $arccos \( - 1 \/ 3 \) < pi$, and in its Euclidean sector
  $ chevron.l h_H xor h_(H') \, h_H chevron.r = lr(bar.v.double h_H bar.v.double)^2 + chevron.l h_(H') \,
    h_H chevron.r = 3 / 4 - 1 / 4 = 1 / 2 . $
  The same computation applies to $h_(H')$. ◻
]

We will obtain a contradiction by evaluating the scalar product of the unit vectors $M_A \, M_B$ in two ways.
  One bound is already available. At $A \, B$, the fan identities give

$ M_A = h_(A B) xor h_(A C) \, wide M_B = h_(A B) xor h_(B C) . $

Apply Equation (6.2) in both entries. The three lines $A B \, A C \, B C$ are distinct, so Equation (6.3) yields

#[#set math.equation(numbering: n => "(6.6)")
 $ chevron.l M_A \, M_B chevron.r gt.eq lr(bar.v.double h_(A B) bar.v.double)^2 + chevron.l h_(A B) \,
   h_(B C) chevron.r + chevron.l h_(A C) \, h_(A B) chevron.r + chevron.l h_(A C) \, h_(B C) chevron.r =
   0 . $ <geom:nonnegative>]

The remaining argument will force $M_A \, M_B$ to be antipodal, with scalar product $- 1$.
  We first use the exceptional incidence to show that $M_C \, M_D$ are antipodal.
  Their axis will let us place $h_(A C) \, h_(B C) \, h_(A D) \, h_(B D)$ in a product $bb(R) times Q$,
  where the $"CAT" \( 0 \)$ factor $Q$ contains a flat square formed by their second coordinates.
  The opposite side midpoints of that square will then force $M_A \,
  M_B$ to be antipodal through the fan identities at $A \, B$.

=== 6.3 The identity at the exceptional incidence <the-identity-at-the-exceptional-incidence>

Set

$ H_0 = C D \, wide h_0 = h_(C D) \, wide p = X_C \, quad q = Y_C \, quad z = X_D \, $

and let $J$ be the midpoint of $p \, q$. The missing edge from $Y_D$ to $H_0$ is responsible for the asymmetry
  used in the next lemma.

#thm([Lemma 6.3.])[
  (Exceptional-incidence identity).  #emph[The vectors $M_C \, x_D$ lie in a Euclidean sector in $T$, and
#[#set math.equation(numbering: n => "(6.7)")
 $ h_0 = M_C xor x_D . $ <geom:exceptional-sum>]

 Within this sector,
#[#set math.equation(numbering: n => "(6.8)")
 $ chevron.l M_C \, x_D chevron.r = - 1 / 2 \, wide chevron.l M_C \, h_0 chevron.r = 1 / 2 \, wide
   chevron.l h_0 \, x_D chevron.r = 1 / 4 . $ <geom:exceptional-products>]

]
] <geom:exceptional>

#proof[
  Apply the square construction in Lemma 32 at $C$, using $H_0$ and any other line through $C$. Since $J$ is its center,
  #[#set math.equation(numbering: n => "(6.9)")
   $ d \( H_0 \, J \)^2 = 1 / 2 \, wide d \( c \, J \)^2 = 1 / 4 . $ <geom:exceptional-distances>]
  Also $d \( H_0 \, z \) = 1$, $d \( c \, z \) = d \( c \, H_0 \) = r$, and the two paths $p \, H_0 \,
    z$ and $q \, H_0 \, z$ give
  $ d \( p \, z \)^2 = d \( q \, z \)^2 = 2 . $
  The ternary midpoint conclusion of Proposition 30 states that the angle at $H_0$ between the segments to $J \,
    z$ is at least $pi \/ 2$. Angle comparison and Equation (6.9) therefore imply
  $ d \( J \, z \)^2 gt.eq d \( H_0 \, J \)^2 + d \( H_0 \, z \)^2 = 3 / 2 . $
  The reverse inequality follows from the fact that $J$ is the midpoint of $p \, q$:
  $ d \( J \, z \)^2 lt.eq 1 / 2 d \( p \, z \)^2 + 1 / 2 d \( q \, z \)^2 - 1 / 4 d \( p \, q \)^2 = 3 / 2 . $
  The angle and distance comparisons are consequently equalities.
    The triangle $H_0 \, J \, z$ is flat, with a right angle at $H_0$.
  Let $B_0$ be the point of $\[ J \, z \]$ at parameter $1 \/ 3$ from $J$. Calculating in this right triangle gives
  $ d \( H_0 \, B_0 \)^2 = (2 / 3)^2 1 / 2 + (1 / 3)^2 = 1 / 3 . $
  Squared-distance convexity toward $c$ gives
  $ d \( c \, B_0 \)^2 & lt.eq 2 / 3 d \( c \, J \)^2 + 1 / 3 d \( c \, z \)^2 - 2 / 9 d \( J \, z \)^2\
 & = 2 / 3 1 / 4 + 1 / 3 3 / 4 - 2 / 9 3 / 2 = 1 / 12 . $
  The triangle inequality now reads
  $ sqrt(3) / 2 = d \( H_0 \, c \) lt.eq d \( H_0 \, B_0 \) + d \( B_0 \, c \) lt.eq 1 / sqrt(3) +
    frac(1, 2 sqrt(3)) = sqrt(3) / 2 . $
  Hence every inequality is an equality. In particular, $B_0$ lies on $\[ H_0 \, c \]$, in that order,
    and the triangle $c \, J \, z$ is flat by its interior comparison equality. Put $j = log_c J$.
    In the Euclidean sector containing $j \, x_D$, the vector to $B_0$ is $\( 2 \/ 3 \) j + \( 1 \/ 3 \) x_D$.
    The collinearity just proved and the distances $d \( c \, H_0 \) = 3 d \( c \, B_0 \)$ therefore imply
  $ h_0 = 3 log_c B_0 = 2 j + x_D = M_C xor x_D . $
  Here the two ordinary additions take place in that Euclidean sector, and $M_C = 2 j$ by Lemma 32.
  The norm identity in this sector gives
  $ 3 / 4 = lr(bar.v.double h_0 bar.v.double)^2 = 1 + 3 / 4 + 2 chevron.l M_C \, x_D chevron.r \, $
  so $chevron.l M_C \, x_D chevron.r = - 1 \/ 2$. Pairing the sector identity with either summand yields the
    remaining two products in Equation (6.8). ◻
]

=== 6.4 A semicircle in the space of directions <a-semicircle-in-the-space-of-directions>

#thm([Lemma 6.4.])[
  #emph[The unit vectors $M_C \, M_D$ are antipodal in $T$:
$ d_T \( M_C \, M_D \) = 2 \, wide chevron.l M_C \, M_D chevron.r = - 1 . $

]
] <geom:antipodal>

#proof[
  Take either full line $H$ at $D$. The path $Y_D \, H \, X_D \,
    H_0$ uses two fields of $F_D$ and the loose field, so it is one of the admissible three-step paths. Thus
  $ d \( Y_D \, H_0 \) gt.eq sqrt(3) = d \( Y_D \, c \) + d \( c \, H_0 \) . $
  Equality follows from the triangle inequality. The segment from $Y_D$ to $H_0$ passes through $c$,
    and the directions of $y_D \, h_0$ are antipodal.
  Let $Sigma$ be the completed space of directions of $Z$ at $c$,
    and use a hat for the direction of a nonzero vector. Define
  $ a = arccos \( 1 \/ sqrt(3) \) \, wide b = arccos \( 1 \/ 3 \) . $
  Both lie strictly between zero and $pi \/ 2$, and $2 a + b = pi$. Equation (6.8) gives
  $ d_Sigma \( hat(M)_C \, hat(h)_0 \) = a \, wide d_Sigma \( hat(h)_0 \, hat(x)_D \) = b . $
  The two arcs occur consecutively in the Euclidean sector of Lemma 33;
    their concatenation is its geodesic direction arc. By Equation (6.5),
  $ d_Sigma \( hat(x)_D \, hat(y)_D \) = arccos \( - 1 \/ 3 \) = pi - b . $
  The direction of $M_D = x_D xor y_D$ bisects this last arc, because its two summands have equal length.
    Consequently $d_Sigma \( hat(x)_D \, hat(M)_D \) = a$.
  The concatenation $hat(h)_0 \, hat(x)_D \, hat(y)_D$ has length $pi$ and antipodal endpoints.
    It is therefore minimizing, so its two arcs continue geodesically through $hat(x)_D$. It follows that
  $ hat(M)_C \, quad hat(h)_0 \, quad hat(x)_D \, quad hat(M)_D $
  is a local geodesic in $Sigma$: continuation at $hat(h)_0$ holds inside the first sector,
    and continuation at $hat(x)_D$ holds inside the minimizing semicircle just described.
    Its length is $a + b + a = pi$. The space $Sigma$ is $"CAT" \( 1 \)$,
    so #cite(label("BH1999")) Proposition II.1.4(2) makes this local geodesic globally minimizing,
    including the endpoint case of length exactly $pi$. Equivalently,
    apply the short local-geodesic assertion to every strict initial subarc and pass to the endpoint by continuity
    of distance. Its endpoints are antipodal. Since $M_C \, M_D$ have norm one,
    the cone distance and scalar product have the stated values. ◻
]

=== 6.5 Splitting the axis and obtaining a flat square <splitting-the-axis-and-obtaining-a-flat-square>

#thm([Proposition 6.5.])[
  #emph[No complete $"CAT" \( 0 \)$ space contains the configuration asserted in Proposition 30.]
] <prop:no-configuration>

#proof[
  Suppose otherwise and retain the notation above. By Equation (6.6), $chevron.l M_A \, M_B chevron.r gt.eq 0$.
    We will contradict this bound by splitting the axis supplied by Lemma 34. Use the fan identities
  $ M_C = h_(A C) xor h_(B C) \, wide M_D = h_(A D) xor h_(B D) . $
  The four lines in these expressions are pairwise distinct. Therefore Equation (6.2) implies
  $ chevron.l M_C \, h_(A D) chevron.r gt.eq - 1 / 2 \, wide chevron.l M_C \, h_(B D) chevron.r gt.eq - 1 / 2 . $
  Lemma 34 forces equality in the chain
  $ - 1 = chevron.l M_C \, M_D chevron.r gt.eq chevron.l M_C \, h_(A D) chevron.r + chevron.l M_C \,
    h_(B D) chevron.r gt.eq - 1 . $
  Interchanging the roles of the two sums gives the symmetric equalities. Combining these with Equation (6.5), we obtain
  #[#set math.equation(numbering: n => "(6.10)")
   $ & h_(A C) & h_(B C) & h_(A D) & h_(B D)\
chevron.l M_C \, thin dot.op thin chevron.r & 1 \/ 2 & 1 \/ 2 & - 1 \/ 2 & - 1 \/ 2\
chevron.l M_D \, thin dot.op thin chevron.r & - 1 \/ 2 & - 1 \/ 2 & 1 \/ 2 & 1 \/ 2 . $ <geom:axis-products>]
  The opposite rays $M_C \, M_D$ form a complete geodesic line $ell subset T$ through the cone vertex.
    Put $a = arccos \( 1 \/ sqrt(3) \)$. For each vector in the four columns of Equation (6.10),
    the angles to the two ends of $ell$ are $a$ and $pi - a$, in one order or the other.
    The two corresponding direction arcs concatenate to a minimizing semicircle.
    Its Euclidean cone is an isometric flat half-plane with boundary $ell$ and containing the vector.
    In particular, that vector lies on a complete line parallel to $ell$.
  The parallel-set product decomposition #cite(label("BH1999")) Theorem II.2.14 now applies in $T$;
    it requires no properness. Write its convex parallel set as
  $ P \( ell \) = bb(R) times Q \, wide ell = bb(R) times { q_0 } \, wide 0 = \( 0 \, q_0 \) \, quad
    M_C = \( 1 \, q_0 \) \, quad M_D = \( - 1 \, q_0 \) . $
  The factor $Q$ is a $"CAT" \( 0 \)$ space. Within each of the flat half-planes above,
    projection onto $ell$ shows that the axial coordinate is the scalar product with the unit vector $M_C$.
    Thus Equation (6.10) gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ h_(A C) = \( 1 \/ 2 \, u \) \, quad h_(B C) = \( 1 \/ 2 \, u' \) \, quad h_(A D) = \( - 1 \/ 2 \, v \) \,
     quad h_(B D) = \( - 1 \/ 2 \, v' \) $ <geom:split-coordinates>]
  for points $u \, u' \, v \, v' in Q$. Their distances to $q_0$ are all $1 \/ sqrt(2)$,
    since each original vector has squared norm $3 \/ 4$.
  Distinct line vectors have squared cone distance two, by Equation (6.3).
    The product metric in Equation (6.11) therefore gives
  $ d_Q \( u \, u' \) = d_Q \( v \, v' \) = sqrt(2) \, $
  and
  $ d_Q \( u \, v \) = d_Q \( u \, v' \) = d_Q \( u' \, v \) = d_Q \( u' \, v' \) = 1 . $
  Furthermore, $h_(A C) xor h_(B C) = M_C$ means that the midpoint of these two line vectors is
    $\( 1 \/ 2 \, q_0 \)$: the midpoint is the half-dilation of $M_C$ on the axis.
    Product midpoints consequently give $q_0 = "mid" \( u \, u' \)$.
    The identity at $D$ likewise gives $q_0 = "mid" \( v \, v' \)$.
  In cyclic order $u \, v \, u' \, v'$, these points satisfy Lemma 31.
    They therefore span a unit flat square in $Q$, centered at $q_0$. Let
  $ m = "mid" \( u \, v \) \, wide m' = "mid" \( u' \, v' \) . $
  They are the midpoints of opposite sides of that square, and hence
  #[#set math.equation(numbering: n => "(6.12)")
   $ d_Q \( q_0 \, m \) = d_Q \( q_0 \, m' \) = 1 / 2 \, wide d_Q \( m \, m' \) = 1 . $ <geom:opposite-midpoints>]
  This square lies in the transverse factor only; no planar realization of the original incidence configuration
    has been assumed. Figure 3 records the square and the axis that has been split off.
  #figure(
    [#grid(
    columns: (0.43fr, 0.53fr,),
    column-gutter: 4%,
    [
      #cetz.canvas({
  import cetz.draw: *
  line((-1.65, 1.65), (1.65, 1.65), (1.65, -1.65), (-1.65, -1.65), close: true, fill: rgb("#f7f7ff"), stroke: none)
  line((-1.65, 1.65), (1.65, -1.65), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.65, -1.65), (1.65, 1.65), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((1.65, 1.65), (-1.65, -1.65), stroke: (paint: rgb("#999999"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-1.65, 1.65), (1.65, 1.65), (1.65, -1.65), (-1.65, -1.65), close: true, stroke: (thickness: 0.85pt, miter-limit: 10))
  line((0, 1.65), (0, -1.65), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((-1.65, 1.65), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((1.65, 1.65), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((1.65, -1.65), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((-1.65, -1.65), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((0, 1.65), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((0, -1.65), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  circle((0, 0), radius: 0.08232, fill: rgb("#000000"), stroke: none)
  content((-1.65, 1.65), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$u$]]])], anchor: "south-east")
  content((1.65, 1.65), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$v$]]])], anchor: "south-west")
  content((1.65, -1.65), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$u'$]]])], anchor: "north-west")
  content((-1.65, -1.65), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$v'$]]])], anchor: "north-east")
  content((0, 1.716), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$m$]]])], anchor: "south")
  content((0, -1.716), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$m'$]]])], anchor: "north")
  content((-0.0825, 0), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$q_0$]]])], anchor: "east")
  content((0.0825, 0.825), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$frac(1, 2)$]]])], anchor: "west")
  content((0.0825, -0.825), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$frac(1, 2)$]]])], anchor: "west")
  content((1.782, 0), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$1$]]])], anchor: "west")
  content((0, 2.805), [#text(size: 9pt)[Transverse factor $Q$]])
})
    ],
    [
      #cetz.canvas({
  import cetz.draw: *
  line((-2.501, 0), (2.501, 0), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (start: (symbol: ">>", length: 0.1411cm, fill: black), end: (symbol: ">>", length: 0.1411cm, fill: black)))
  circle((-2.05, 0), radius: 0.05821, fill: black, stroke: none)
  circle((0, 0), radius: 0.05821, fill: black, stroke: none)
  circle((2.05, 0), radius: 0.05821, fill: black, stroke: none)
  content((-2.05, 0.07), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$M_D$]]])], anchor: "south")
  content((2.05, 0.07), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$M_C$]]])], anchor: "south")
  content((0, -0.07), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$0_T$]]])], anchor: "north")
  content((0, 0.9), [#text(size: 9pt)[Axis $ell = bb(R) times \{q_0\}$]])
})
      $P \( ell \) tilde.equiv bb(R) times Q$
      $M_A = 2 \( 0 \, m \) \, wide M_B = 2 \( 0 \, m' \)$
    ],
  )],
    caption: [Figure 3: The final contradiction takes place in the transverse factor after splitting off the $M_C \, M_D$ axis. The cyclically ordered points $u \, v \, u' \, v'$ form a flat unit square in $Q$, with common diagonal midpoint $q_0$. The opposite-side midpoints $m \, m'$ are distance $1 \/ 2$ from $q_0$ and distance $1$ apart. Dilation in the original tangent cone $T$ therefore makes $M_A = 2 \( 0 \, m \)$ and $M_B = 2 \( 0 \, m' \)$ antipodal unit vectors. The panels display the two distinct factors of the parallel set. ],
  ) <fig:transverse-square>
  Finally, the full-line choices $A C \, A D$ at $A$ and $B C \, B D$ at $B$ give
  $ M_A = h_(A C) xor h_(A D) = delta_2 \( 0 \, m \) \, wide M_B = h_(B C) xor h_(B D) = delta_2 \( 0 \, m' \) . $
  Here $delta_2$ is dilation in the original cone $T$; no cone structure on $Q$ is needed.
    It doubles all distances. By Equation (6.12),
  $ lr(bar.v.double M_A bar.v.double) = lr(bar.v.double M_B bar.v.double) = 1 \, wide d_T \( M_A \, M_B \) = 2 \, $
  so $chevron.l M_A \, M_B chevron.r = - 1$. This contradicts Equation (6.6) and proves the proposition. ◻
]

== 7 Selection and the finite-model conclusion <sec:completion>

We now assemble the arguments, keeping the order of all choices explicit.

#thm([Lemma 7.1.])[
  (A deterministic diagonal sequence).  #emph[There is a sequence of realizations of the tables, with $n_j arrow.r
    oo$ and positive parameters $alpha_j \, beta_j \, delta_j arrow.r 0$, such that]
  + #emph[the associated complexes $P_j$ are aspherical and have a linear letter disk-filling inequality;]
  + #emph[the master match sets are nonempty and their single-field marginals tend to uniformity in total variation;]
  + #emph[for every admissible pair $I \, { e }$ and every fixed integer $t$,
    the common-$I$ coupling in Proposition 20 has both of its total variation errors tending to zero along the
    sequence;]
  + #emph[the six-letter table pair counts have uniformly vanishing relative error.]
  #emph[The groups $G_j = pi_1 P_j$ are infinite.]
] <lem:completion-diagonal>

#proof[
  At stage $j$, request all the admissible tests in the fixed master pattern with $1 lt.eq t lt.eq j$.
    This is a finite list. Choose $epsilon_j > 0$ small enough for Proposition 20 for this list and for Theorem 7,
    with $epsilon_j < 1 \/ \( 400 j \)$, and set
  $ alpha_j = delta_j = epsilon_j \, wide beta_j = 8 epsilon_j . $
  These parameters satisfy $beta_j > 7 alpha_j$, and the exponent $3 - beta_j -
    90 delta_j$ of the master count is positive. Moreover,
  $ j \( beta_j + 90 delta_j \) = 98 j epsilon_j < 98 / 400 < 1 / 2 \, $
  so the explicit bound in Section 4 preserves every overlap margin required for the finite list.
  Fix these parameters. The proof of Theorem 7 selects a finite fragment threshold, possibly depending on $j$.
    Its coincidence inequalities hold with probability tending to one as $n arrow.r oo$.
    For the same fixed parameters, Proposition 20 gives the requested finite collection of sampling properties
    with probability tending to one. Choose $n_j > n_(j - 1)$ so large that there is positive probability that all
    these events hold and all requested sampling errors are at most $1 \/ j$.
    Select one realization in their intersection. No comparison between the fragment threshold and $n$ is needed
    before fixing the parameters and threshold. This proves (i)–(iv).
  Each $G_j$ has a quotient $C_2$ by Lemma 4. If it were finite,
    its universal cover would be a finite contractible CW complex,
    and multiplicativity of Euler characteristic would give
  $ 1 = chi \( tilde(P)_j \) = \| G_j \| chi \( P_j \) . $
  Since $chi \( P_j \)$ is an integer, this forces $\| G_j \| = 1$, contrary to the quotient. Hence $G_j$ is infinite. ◻
]

#thm([Proposition 7.2.])[
  #emph[For all sufficiently large $j$, the group $G_j$ in Lemma 36 admits no geometric action on any proper
    complete $"CAT" \( 0 \)$ space.]
] <prop:completion-no-action>

#proof[
  Suppose, more generally, that infinitely many $G_j$ admitted such actions.
    Restrict to that subsequence and choose one action for each of its groups.
    All fixed-test limits in Lemma 36 remain valid. The action spaces, their dimensions,
    and their local geometries are allowed to vary.
  Normalize the minimizing generator energy for each action as in Equation (5.4).
    The infinitude just proved makes this energy positive. The displacement estimate and Lemma 25 hold uniformly
    for these choices of actions. Proposition 30 therefore supplies the limiting configuration.
    Proposition 35 excludes it. Thus only finitely many of the selected groups can admit such actions;
    in particular, an instance with no action exists. ◻
]

=== 7.1 Passing to a finite simplicial model <passing-to-a-finite-simplicial-model>

We record the filling transfer because the conclusion is about edge loops in a finite simplicial complex,
  rather than just words in a presentation.

#thm([Lemma 7.3.])[
  (Finite-model filling transfer).  #emph[Let $P$ be a finite connected CW complex with contractible universal
    cover. Suppose a finite presentation of $pi_1 P$ has a linear disk-filling inequality.
    Then $P$ has a finite connected simplicial homotopy model $K$,
    whose universal cover is contractible and satisfies a linear combinatorial disk-filling inequality.]
] <lem:completion-transfer>

#proof[
  A finite CW complex has a finite simplicial homotopy model of the same dimension #cite(label("Hatcher2002"))
    Theorem 2C.5. One construction proceeds over its finitely many cells:
    approximate attaching maps by simplicial maps after finite subdivisions,
    and use simplicial analogues of their mapping cylinders for the attachments.
    Let $K$ be the resulting finite simplicial model. A homotopy equivalence lifts to a homotopy equivalence of
    universal covers, so $tilde(K)$ is contractible.
  For completeness, the linear estimate is independent of the chosen finite presentation.
    Choose substitutions $phi.alt$ from new generators to old words and $psi$ from old generators to new words,
    inducing inverse group identifications. Let $L$ bound the lengths of the words $phi.alt \( b \)$,
    let $M$ bound the new-presentation filling areas of the finitely many substituted old relators $psi \( r \)$,
    and let $D$ bound the filling areas of the words $b psi \( phi.alt \( b \) \)^(- 1)$.
    The latter two lists consist of null words, and all three lists are finite, so these bounds exist.
    A new null word of length $ell$ substitutes to an old word of length at most $L ell$.
    If the old filling constant is $C_(upright("old"))$, filling that word and replacing its relator cells costs
    at most $M C_(upright("old")) L ell$ new cells. The boundary substitutions cost at most $D ell$ more.
    Thus the new filling constant is at most $M C_(upright("old")) L + D$.
  Apply this to the maximal-tree presentation of the finite complex $K$.
    Its generators correspond to the non-tree edges, and its relators to its triangular faces.
    A null-homotopic combinatorial edge loop in $K$ of length $ell$ gives a null word of length at most $ell$ in
    these generators after inserting paths in the fixed maximal tree.
    The tree has finitely many edges, so the inserted paths have uniformly bounded lengths.
    Fill the word linearly in the maximal-tree presentation; each relator cell is replaced by the corresponding
    triangular face and tree-path cancellations. The boundary collar likewise cancels the inserted tree paths with
    linear overhead. Thus the original loop bounds a diagram over $K$ with at most $C
    ell$ triangular faces for a fixed finite $C$.
  An edge loop in $tilde(K)$ projects to a null loop in $K$.
    Its disk diagram lifts with the chosen boundary lift, giving the required estimate in the universal cover. ◻
]

#proof[
  Choose an instance $P_j$ supplied by Proposition 37. Its finite letter presentation has a linear disk bound by
    Theorem 7. Apply Lemma 38 to obtain $K$. Since $P_j$ has dimension two,
    the same-dimension construction gives a two-dimensional $K$.
    This proves the asserted asphericity and linear filling estimate.
    Its fundamental group is $G_j$, so it has the no-action property.
    The equivalence between a linear Dehn function and word hyperbolicity gives the final group-theoretic
    assertion #cite(label("BH1999")) Exercise III.H.2.5(5), Proposition III.H.2.7, and Theorem III.H.2.9.
  Suppose that a finite simplicial complex $L$ homotopy equivalent to $K$ admitted a compatible locally
    $"CAT" \( 0 \)$ geodesic length metric. The metric space $L$ is compact, hence complete and locally compact.
    Give its universal cover the induced length metric, for which the covering map is a local
    isometry #cite(label("BH1999")) Proposition I.3.25. This cover is complete:
    a Cauchy sequence upstairs projects to a convergent sequence downstairs;
    sufficiently short connecting paths force a tail into one sheet over an evenly covered neighborhood of the
    limit, where it converges. The Cartan–Hadamard theorem makes the cover globally
    $"CAT" \( 0 \)$ #cite(label("BH1999")) Theorem II.4.1(2).
    It is locally compact, and the length-space Hopf–Rinow theorem makes it proper #cite(label("BH1999"))
    Proposition I.3.7. Its deck transformations act freely, properly and cocompactly by isometries.
  The isomorphism $pi_1 L tilde.equiv pi_1 K = G_j$ therefore gives a geometric action of $G_j$ on a proper
    complete $"CAT" \( 0 \)$ space, a contradiction. This also excludes compatible locally $"CAT" \( - 1 \)$
    geodesic length metrics, since a $"CAT" \( - 1 \)$ space is $"CAT" \( 0 \)$ #cite(label("BH1999"))
    Theorem II.1.12(1). ◻
]

#prodef([Remark 7.4.])[
  The argument makes no curvature assumption on the random complexes $P_j$.
    Curvature comparison is used only in a hypothetical action space,
    after the combinatorial filling and asphericity statements have been established.
    Nor is a common filling constant needed for the diagonal sequence:
    only the constant for the single chosen finite complex appears in Theorem 1.
]

#bibliography("refs.bib", style: "ieee", title: [References])
