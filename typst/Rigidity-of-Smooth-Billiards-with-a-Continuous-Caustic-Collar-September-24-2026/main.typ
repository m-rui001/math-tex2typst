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

#align(center)[#text(size: 16pt, weight: "bold")[Rigidity of Smooth Billiards with a Continuous Caustic Collar]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Birkhoff conjecture asks whether an integrable planar convex billiard must be an ellipse.
  We prove the version in which integrability is assumed only in a neighborhood of the boundary,
  with continuous dependence of the caustics. The individual leaves and the billiard boundary are smooth;
  no differentiability of the foliation across its leaves is required.

#prodef([Definition 1.1.])[
  (A continuous caustic collar).  Let $Omega subset bb(R)^2$ be a bounded strictly convex domain whose boundary is
    a $C^oo$ simple closed regular curve with positive curvature.
    A #emph[smooth closed convex caustic] is a $C^oo$ simple closed regular curve in $Omega$,
    bounding a strictly convex set, such that a billiard segment tangent to the curve remains tangent after
    reflection at either endpoint. Here reflection of an incoming unit velocity $v$ at a boundary point with
    outward unit normal $n$ is
  $ v mapsto v - 2 \( v dot.op n \) n . $
  A #emph[continuous caustic collar] consists of a relatively open set $A subset
    overline(Omega)$ containing $partial Omega$ and a homeomorphism
  $ H_0 : bb(S)^1 times \[ 0 \, 1 \) arrow.r A $
  such that $H_0 \( bb(S)^1 times { 0 } \) = partial Omega$,
    and $H_0 \( bb(S)^1 times { b } \)$ is a smooth closed convex caustic for every $0 < b < 1$.
] <def:caustic-collar>

#thm([Theorem 1.2.])[
  #emph[If $Omega$ has a continuous caustic collar, then $Omega$ is an ellipse.
    Equivalently, there are $c in bb(R)^2$ and a real symmetric positive-definite matrix $Q$ such that
$ Omega = { x in bb(R)^2 : \( x - c \)^T Q \( x - c \) < 1 } . $

 Circles are included.]
] <thm:main>

This resolves the near-boundary Birkhoff conjecture positively in the smooth positively curved class of 1.
  The collar contains every intermediate leaf. A Cantor family of invariant curves,
  even one accumulating at the boundary, does not satisfy this assumption.
  The hypothesis makes no assertion about the billiard dynamics farther inside the domain.

#figure(
  [#grid(
    columns: (0.48fr, 0.48fr,),
    column-gutter: 4%,
    [
      #cetz.canvas({
  import cetz.draw: *
  compound-path({circle((0, 0), radius: (2.55, 1.7), fill: rgb("#ebeff2"), stroke: none); circle((0, 0), radius: (2.295, 1.286), fill: rgb("#ebeff2"), stroke: none); line((0, 0), (0, 0))}, fill: rgb("#ebeff2"), fill-rule: "even-odd", stroke: none)
  circle((0, 0), radius: (2.55, 1.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: (2.465, 1.57), stroke: (paint: rgb("#234f70"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: (2.38, 1.432), stroke: (paint: rgb("#234f70"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: (2.295, 1.286), stroke: (paint: rgb("#234f70"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.901, 0), radius: 0.04939, fill: black, stroke: none)
  circle((1.901, 0), radius: 0.04939, fill: black, stroke: none)
  content((0, -2.023), [#text(size: 9pt)[A full caustic collar]])
  content((1.998, 1.36), [#text(size: 9pt)[$partial Omega$]], anchor: "west", padding: 0.1176cm)
})
    ],
    [
      #cetz.canvas({
  import cetz.draw: *
  line((0.7001, -1.846), (0.772, -1.751), (0.8402, -1.657), (0.9045, -1.562), (0.9651, -1.467), (1.022, -1.373), (1.075, -1.278), (1.124, -1.183), (1.17, -1.089), (1.211, -0.994), (1.249, -0.8993), (1.283, -0.8047), (1.313, -0.71), (1.34, -0.6153), (1.363, -0.5207), (1.382, -0.426), (1.397, -0.3313), (1.408, -0.2367), (1.416, -0.142), (1.42, -0.04733), (1.42, 0.04733), (1.416, 0.142), (1.408, 0.2367), (1.397, 0.3313), (1.382, 0.426), (1.363, 0.5207), (1.34, 0.6153), (1.313, 0.71), (1.283, 0.8047), (1.249, 0.8993), (1.211, 0.994), (1.17, 1.089), (1.124, 1.183), (1.075, 1.278), (1.022, 1.373), (0.9651, 1.467), (0.9045, 1.562), (0.8402, 1.657), (0.772, 1.751), (0.7001, 1.846), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((1.42, -1.818), (1.42, 1.818), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0.6674, -1.59), (1.42, 0), stroke: (paint: rgb("#234f70"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#234f70"))))
  line((1.42, 0), (0.6674, 1.59), stroke: (paint: rgb("#234f70"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#234f70"))))
  line((1.42, 0), (2.911, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.911, 0), [#text(size: 9pt)[$n_ psi$]], anchor: "west", padding: 0.1176cm)
  line((1.42, 0), (2.769, -0.6248), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((1.42, 0), (2.769, 0.6248), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  arc((2.215, 0), start: 0deg, stop: 25deg, radius: 0.7952, stroke: (thickness: 0.4pt, miter-limit: 10))
  arc((2.414, -0.4629), start: -25deg, stop: 0deg, radius: 1.093, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.556, 0.3408), [#text(size: 9pt)[$d$]])
  content((2.741, -0.2414), [#text(size: 9pt)[$d$]])
  content((0.6106, -1.25), [#text(size: 9pt)[$e_( psi -d)$]], anchor: "east", padding: 0.1176cm)
  content((0.6106, 1.25), [#text(size: 9pt)[$e_( psi +d)$]], anchor: "east", padding: 0.1176cm)
  circle((1.42, 0), radius: 0.04586, fill: black, stroke: none)
  content((1.335, 0.1988), [#text(size: 9pt)[$Gamma$]], anchor: "east", padding: 0.1176cm)
  content((1.42, -2.272), [#text(size: 9pt)[Reflection in line coordinates]])
})
    ],
  )],
  caption: [Figure 1: The geometric hypothesis and the local reflection convention. The left panel shows confocal elliptic caustics, the model covered by the theorem. The shaded collar represents a full family of leaves. At the impact point $Gamma$ in the right panel, $n_psi$ is the outward unit normal. The blue arrows give the incoming and outgoing unit-velocity directions $e_(psi - d)$ and $e_(psi + d)$; their line normals have angles $psi - d$ and $psi + d$. ],
) <fig:caustic>

=== 1.1 History and scope <history-and-scope>

Ellipses are the basic integrable examples: their confocal conics supply caustics,
  and a confocal elliptic family fills a collar of the boundary.
  The conjecture is traditionally attributed to Birkhoff; its early printed formulation appears in Poritsky’s
  work #cite(label("Poritsky1950")). For the classical dynamical setting and this historical attribution,
  see #cite(label("Birkhoff1927")) #cite(label("KS2018")). Poritsky’s translation property for nested string
  constructions is stronger than the existence of a foliation #cite(label("Poritsky1950")).
  Lazutkin constructed a positive-measure family of grazing caustics for sufficiently smooth positively curved
  tables #cite(label("Lazutkin1973")); its gaps do not give a full collar.
  Marvizi and Melrose’s interpolating grazing integral is accurate up to a flat error,
  rather than an exact integral #cite(label("MM1982")). Mather’s obstruction when curvature vanishes underscores
  the positive-curvature hypothesis here #cite(label("Mather1982")).

Several rigidity theorems establish parts of the conjecture under additional assumptions.
  Bialy’s rigidity theorem assumes a foliation of the whole phase cylinder by continuous noncontractible invariant
  curves and concludes that the table is a circle #cite(label("Bialy1993")).
  Innami’s theorem concerns convex caustics whose rotation numbers approach $1 \/ 2$,
  the opposite endpoint from grazing rotation zero; Arnold and Bialy give a geometric treatment of that
  result #cite(label("Innami2002")) #cite(label("AB2018")).
  Bialy and Mironov prove ellipse rigidity for centrally symmetric tables when the phase annulus reaches the
  four-periodic curve, with a corresponding $C^1$ foliation by physical caustics through rotation $1 \/
  4$ #cite(label("BM2022")). These hypotheses are not supplied by a small grazing collar.

Perturbative results include the local rigidity work of Avila,
  De Simoi and Kaloshin near low-eccentricity ellipses #cite(label("ADK2016")),
  and Kaloshin and Sorrentino near ellipses of arbitrary eccentricity #cite(label("KS2018")).
  Kaloshin, Koudjinan and Zhang treat nearly centrally symmetric domains under specified caustic
  conditions #cite(label("KKZ2024")); Koval treats small rational-rotation caustics near almost every
  ellipse #cite(label("Koval2026")). Glutsyuk’s classification for complex algebraic caustics lies in a different
  analytic setting #cite(label("Glutsyuk2026")).

2 assumes none of those perturbative, symmetry, or algebraic conditions.
  In particular, we must obtain analytic regularity from the given smooth geometry and merely continuous
  foliation. The proof below does so before using complex continuation.
  Its grazing normalization and action expansions have antecedents in Lazutkin and Marvizi–Melrose;
  its rational-action Fourier test is related to Avila–De Simoi–Kaloshin;
  and its use of complex singularities has a perturbative predecessor in
  Kaloshin–Sorrentino #cite(label("Lazutkin1973")) #cite(label("MM1982")) #cite(label("ADK2016"))
  #cite(label("KS2018")). These are method ancestry, not formal inputs to the arbitrary-table analytic inversion,
  first-wall, or probability arguments proved here.

=== 1.2 The main ideas <the-main-ideas>

The proof has three parts. First, rational caustics force analytic regularity.
  Nesting and area recurrence imply that every sufficiently small rational rotation occurs on a curve entirely
  made of periodic orbits. The actions of these orbits give a high-frequency system whose derivative is the
  identity up to a small operator. An analytic Newton construction then upgrades the boundary from smooth to
  analytic. A second construction uses both values and first parameter jets at rational resonances to obtain a
  jointly analytic conjugacy at glancing.

Second, finite reflected chains determine their intermediate lines algebraically from endpoint jets.
  The proof combines a finite system for one-variable jets with a coalescing-impact scaling.
  This local determination result controls monodromy: a finite first continuation wall cannot have even one local
  joint meromorphic patch. The argument separates finite jet determination from global continuation,
  and the corresponding lemmas are stated independently of the later growth analysis.

Third, we study the complexified boundary through its meromorphic normal and two analytic derivative fields.
  Zeros or poles of that normal force an elliptic form. If there are none,
  continued impacts admit one complex shape coordinate. Growth estimates exclude most possible behaviors at the
  edge of its strip, leaving a critical finite-width case. There,
  moment bounds and paths through regions where the fields are large limit the total angular change,
  an #emph[angle budget]. For one fixed odd periodic chain,
  matrix identities transfer that control to Brownian paths stopped before the shape boundary.
  Finally, we find a horizontal row on which the first field is robustly small or large outside a set of vanishing
  relative measure. The sign test on this row keeps the last moving impact away from the boundary,
  contradicting the assumed first wall.

Two aspects of these arguments may be useful separately. The first is the finite-chain algebraic determination
  principle and its monodromy consequence. The second is the combination of an individual-center quiet-profile
  obstruction with moment bounds: a local analytic passage forces a global width improvement,
  so even an exceptional sequence of quiet centers is ruled out.
  The subsequent probability arguments use this pointwise conclusion explicitly.

=== 1.3 Organization and dependencies <organization-and-dependencies>

The sections and their main deductions are recorded below.
  The arbitrary-input action estimates of 2 are separate from the geometric vanishing supplied by the caustic
  collar. The parameter jets in 3 use the full collar again.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Location
], table.cell(rowspan: 1, colspan: 1)[Role in the proof
]),
  table.cell(rowspan: 1, colspan: 1)[Section 2, Section 3
], table.cell(rowspan: 1, colspan: 1)[Rational-action inversion gives an analytic boundary;
  rational jets give a jointly analytic glancing parametrization.
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[Finite-chain algebraic determination rules out a local patch at a first
  continuation wall.
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[Zeros or poles of the normal force an ellipse;
  otherwise impacts lift to a global shape coordinate.
],
  table.cell(rowspan: 1, colspan: 1)[Section 6, Section 7
], table.cell(rowspan: 1, colspan: 1)[Kernel continuation and profile obstructions reduce growth to a critical
  finite wall.
],
  table.cell(rowspan: 1, colspan: 1)[Section 8, Section 9
], table.cell(rowspan: 1, colspan: 1)[Conditional critical estimates precede the independent exclusion of
  prohibited sequences; only then is the angle budget activated.
],
  table.cell(rowspan: 1, colspan: 1)[Section 10, Section 11
], table.cell(rowspan: 1, colspan: 1)[Stopped odd-chain geometry and a sign row exclude the critical wall and
  complete 2.
],
)
]

There is one deliberate forward reference: the angle-budget reduction uses the exclusion of a precisely stated
  class of sequences, proved in the following section. That exclusion uses the earlier moment and continuation
  estimates, not the angle budget. The final proof of 2 assembles the alternatives after 90.

=== 1.4 Conventions <conventions>

Angles are real lifts of $2 pi$-periodic variables. Complex Euclidean products are bilinear,
  without complex conjugation. A meromorphic projective map means meromorphic affine coordinates in a generic
  chart; all incidence identities are used on their regular locus and then continued.
  Constants denoted by $C$ may increase between estimates. Dependence on a fixed aperture or another fixed
  auxiliary parameter is displayed when it matters for an order of choices.

The normalized generating action is denoted by $D$. Later,
  an uppercase $D$ also denotes a positive rescaled depth inside a local scaling argument;
  its meaning is stated there. To keep the width bookkeeping distinct,
  the phase-width deficit is denoted throughout by $Delta \( t \) = H - h_X \( t \)$.
  Horizontal expectations are normalized averages over one period unless a different probability law is specified.

== 2 Rational caustics and analytic regularity <ana:section>

The first task is to obtain analytic regularity from the continuous foliation in 1.
  The argument uses only the rational leaves with rotation number $1 \/ q$.
  Their critical actions define a system of equations whose derivative on sufficiently high Fourier modes is close
  to the identity. The small loss of complex width in the construction of each individual equation is compatible
  with an inverse on a single exponentially weighted Fourier space.
  The coordinate follows Lazutkin’s grazing normalization, and the action viewpoint is related to
  Marvizi–Melrose’s asymptotic interpolation #cite(label("Lazutkin1973")) #cite(label("MM1982")).
  Rational-caustic Fourier constraints also appear in the perturbative work of Avila,
  De Simoi and Kaloshin #cite(label("ADK2016")). The arbitrary-input mesh, Fourier row,
  and nonperturbative inversion required here are proved below.

#thm([Theorem 2.1.])[
  (Analytic regularity).  #emph[Under the hypotheses of 2, the support function of the table and its boundary are
    real analytic.]
] <thm:analytic>

=== 2.1 The invariant graphs and their rational leaves <the-invariant-graphs-and-their-rational-leaves>

Classical invariant-graph results for twist maps give context for this phase
  description #cite(label("Arnaud2009")); periodic billiard graphs are also studied in #cite(label("FS2026"))
  Appendix A. The all-point rational periodicity needed here follows directly from the filled collar in the next lemma.

Translate an interior point to the origin. Write

$ n_theta = \( cos theta \, sin theta \) \, wide e_theta = \( - sin theta \, cos theta \) . $

The support function $h$ is smooth, and the point with outward normal $n_psi$ is

$ gamma \( psi \) = h \( psi \) n_psi + h' \( psi \) e_psi . $

The curvature assumption gives

$ r \( psi \) = h \( psi \) + h'' \( psi \) > 0 . $

All angles below are real lifts of variables of period $2 pi$.
  An oriented line near a positively oriented supporting line is described by its velocity $e_theta$ and its
  equation $n_theta dot.op x = p$. If its forward reflection has outgoing angle $theta'$,
  put $psi = \( theta + theta' \) \/ 2$ and $d = \( theta' - theta \) \/ 2$.
  On the small positive branch, the reflection law gives

$ theta & = psi - d \, wide theta' = psi + d \,\
p & = h \( psi \) cos d - h' \( psi \) sin d \,\
p' & = h \( psi \) cos d + h' \( psi \) sin d . $

The billiard map has Bialy and Mironov’s support-function generating action #cite(label("BM2017")):

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(S) \( theta \, theta' \) = 2 h (frac(theta + theta', 2)) sin (frac(theta' - theta, 2)) \, wide p = -
   cal(S)_1 \, quad p' = cal(S)_2 . $ <ana:line-generating-function>]

In particular,

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(S)_12 \( theta \, theta' \) = frac(r \( psi \), 2) sin d > 0 . $ <ana:twist>]

This map preserves $thin upright(d) p and thin upright(d) theta$, and $partial theta' \/ partial p = -
  1 \/ cal(S)_12 < 0$.

#thm([Lemma 2.2.])[
  #emph[There is a one-sided phase collar filled by invariant continuous graphs $p = g_b \( theta \)$,
    where $b > 0$ increases towards the interior and $g_b$ strictly decreases pointwise.
    The induced increasing lifts $F_b$ have positive translation numbers $tau \( b \)$,
    tending to zero as $b arrow.b 0$.]
  #emph[For every sufficiently small positive rational number $l \/ q$, in lowest terms,
    there is exactly one graph with $tau \( b \) = 2 pi l \/ q$, and its lift satisfies
#[#set math.equation(numbering: n => "(2.3)")
 $ F_b^q \( theta \) = theta + 2 pi l wide upright("for every ") theta . $ <ana:rational-identity>]

]
] <lem:rational-periodicity>

#proof[
  Restrict the foliation parameter to a compact interval close to zero.
    Continuity of its parametrizing homeomorphism gives uniform convergence of the leaf curves to the outer
    boundary. Support functions are continuous for this convergence.
    Hence the convex bodies bounded by the leaves contain the origin for sufficiently small parameters.
    Two disjoint convex boundary curves surrounding the origin are nested:
    otherwise their radial functions change order and the curves intersect.
    Their compact disjointness makes the nesting strict, including strict ordering of their support functions in
    every direction. It follows, using the limiting outer boundary,
    that $g_b \( theta \)$ is continuous and strictly decreasing in $b$, for each $theta$.
    The intervals it fills, as $theta$ varies, form a phase collar.
  Every positively oriented supporting line of a leaf in this collar reflects to another positively oriented
    supporting line of the same leaf. Indeed the reflected line is tangent by the caustic property.
    For a sufficiently small collar both the incoming and outgoing lines are close to the corresponding positive
    outer supporting lines. The other orientation of a leaf support has coordinate $- g_b \( theta + pi \)$,
    which stays negative because the bodies contain a fixed neighborhood of the origin.
    Thus this orientation cannot occur. The same argument applies to the inverse reflection.
    The billiard map therefore restricts to a circle homeomorphism of each graph.
    It is close to the identity and consequently has degree one.
    Its lift $F_b$ is increasing, has strictly positive increments, and depends continuously on $b$.
    By (2.2), these lifts are strictly ordered as $b$ increases.
  We recall the elementary rotation facts needed here. For an increasing lift $F$ commuting with translation by $2
    pi$, the oscillation of $F^m \( x \) - x$ is at most $2 pi$.
    The maximum and minimum of this displacement are respectively subadditive and superadditive in $m$. It follows that
  $ tau \( F \) = lim_(m arrow.r oo) frac(F^m \( x \) - x, m) $
  exists, is independent of $x$, and satisfies
  $ lr(|tau \( F \) - frac(F^m \( x \) - x, m)|) lt.eq frac(2 pi, m) . $
  This bound gives continuity of $tau$ under uniform convergence of lifts.
    Ordering lifts orders their iterates and hence their translation numbers.
    A lift with translation number zero has a fixed point: if its displacement never vanishes,
    its sign is constant and its absolute value has a positive minimum.
    Applied to $F^q - 2 pi l$, this says that $tau \( F \) = 2 pi l \/
    q$ implies the existence of a $q$-periodic point. Conversely, such a point forces that translation number.
  These facts show that $tau \( b \)$ is continuous and nondecreasing.
    Its positivity follows from the positive minimum of $F_b \( theta \) - theta$ on each fixed graph;
    its limit at zero follows from uniform convergence of the map to the identity.
  There cannot be a nontrivial interval of parameters with the same rational translation number $2 pi l \/ q$.
    Otherwise the closed annulus between two distinct graphs in that interval is invariant and has positive finite
    area. Almost every point in it is recurrent for the $q$-th iterate, by finite-measure recurrence.
    On a graph of the specified rotation number, $F_b^q - 2 pi l$ has fixed points.
    Every point in a component of their complement moves strictly monotonically towards an endpoint of that
    component and is not recurrent. Thus the $q$-th iterate is the identity almost everywhere in the annulus,
    and hence everywhere by continuity. This contradicts strict ordering of the $q$-th iterates on its two
    boundary graphs.
  Continuity now supplies a unique graph at each sufficiently small positive rational rotation,
    with smaller and larger rotations arbitrarily close on its two sides.
    A lift with rotation greater than $2 pi l \/ q$ has $F^q \( theta \) - theta - 2 pi l > 0$ everywhere:
    a zero would force that rational rotation, and a strictly negative displacement would force a smaller one.
    The corresponding inequality is reversed below that rotation. Passing to the graph in question proves (2.3). ◻
]

=== 2.2 The normalized action <the-normalized-action>

Choose $k > 0$ so that the coordinate defined by

$ frac(thin upright(d) x, thin upright(d) theta) = k r \( theta \)^(1 \/ 3) $

has period $2 pi$. Write $theta = phi.alt \( x \)$, and set

#[#set math.equation(numbering: n => "(2.4)")
 $ phi.alt' \( x \) = e^(u \( x \)) \, wide r \( phi.alt \( x \) \) = c e^(- 3 u \( x \)) \, wide c =
   k^(- 3) . $ <ana:normalization>]

For the table, $u$ is real, smooth, and periodic. Subtract $integral_theta^(theta') h \( eta \) thin thin
  upright(d) eta$ from $cal(S)$, change coordinates, and divide by $c$.
  The subtracted term telescopes in every fixed-endpoint action, so these operations preserve stationarity.
  Integration by parts using $h + h'' = r$ gives the resulting action:

#[#set math.equation(numbering: n => "(2.5)")
 $ D \( X \, Y \) =  & - integral_X^mu #scale(x: 120%, y: 120%)[\(] 1 -
   cos \( phi.alt \( z \) - phi.alt \( X \) \) #scale(x: 120%, y: 120%)[\)] e^(- 2 u \( z \)) thin thin upright(d) z\
 & - integral_mu^Y #scale(x: 120%, y: 120%)[\(] 1 - cos \( phi.alt \( Y \) - phi.alt \( z \) \)
   #scale(x: 120%, y: 120%)[\)] e^(- 2 u \( z \)) thin thin upright(d) z \, wide phi.alt \( mu \) =
   frac(phi.alt \( X \) + phi.alt \( Y \), 2) . $ <ana:normalized-action>]

For clarity, before the coordinate change the corresponding two integrands are
  $r \( eta \) \( 1 - cos \( eta - theta \) \)$ and $r \( eta \) \( 1 - cos \( theta' - eta \) \)$, respectively.
  Substitution of $r \( phi.alt \( z \) \) phi.alt' \( z \) \/ c = e^(- 2 u \( z \))$ gives (2.5).

The following action formula and mesh estimates apply to arbitrary input;
  the caustic hypothesis is used separately to make the resulting constraints vanish.
  We will use this formula for arbitrary real smooth periodic $u$.
  In that case let $phi.alt$ be any primitive of $e^u$. Its total increment need not be $2 pi$:
  all occurrences of $phi.alt$ are differences, so $D$ remains diagonally $2 pi$-periodic.
  For small $Y - X$, the midpoint is uniquely defined. The formula also gives

#[#set math.equation(numbering: n => "(2.6)")
 $ D \( X + 2 pi \, Y + 2 pi \) = D \( X \, Y \) \, wide D \( Y \, X \) = - D \( X \, Y \) . $ <ana:action-symmetries>]

If $u$ is holomorphic in a strip, these definitions are holomorphic near its diagonal.
  All small complex integrals may be taken along straight segments.

Differentiating the two integrals in (2.5), the moving-midpoint terms cancel. Thus

#[#set math.equation(numbering: n => "(2.7)")
 $ D_1 \( X \, X + T \) = e^(u \( X \)) integral_X^mu sin \( phi.alt \( z \) - phi.alt \( X \) \)
   e^(- 2 u \( z \)) thin thin upright(d) z . $ <ana:D1-integral>]

The following expansion will also fix the normalization used in the next Section:

#[#set math.equation(numbering: n => "(2.8)")
 $ D_1 \( X \, X + T \) & = T^2 / 8 + a \( X \) T^4 + O \( T^5 \) \,\
a \( X \) & = frac(7 u'' \( X \) - 8 u' \( X \)^2 - e^(2 u \( X \)), 384) \,\
D \( X \, X + T \) & = - T^3 / 24 - frac(a \( X \), 5) T^5 + O \( T^6 \) . $ <ana:action-expansion>]

Here and below the remainders have the differentiated bounds specified in the lemmas where they are used.
  One direct calculation is as follows. Put $alpha = u' \( X \)$, $beta = u'' \( X \)$, $A = e^(u \( X \))$,
  and $z = \( mu - X \) \/ T$. The midpoint equation gives

$ z = 1 / 2 + frac(alpha T, 8) + frac(beta T^2, 16) + O \( T^3 \) . $

After rescaling (2.7), its integrand is

$ v - 3 / 2 alpha T v^2 + frac(7 alpha^2 - 5 beta - A^2, 6) T^2 v^3 + O \( T^3 \) . $

Integrating to $z$ gives the first two lines of (2.8); in particular its linear term in $T$ vanishes.
  The leading term of $D$ follows directly from its integral.
  Antisymmetry forces its fourth-order coefficient to vanish.
  Finally, if $d_5 \( X \)$ is its fifth-order coefficient,
  differentiation with respect to the first endpoint at fixed second endpoint gives $- 5 d_5 = a$,
  proving the last line.

=== 2.3 Uniform stationary meshes <uniform-stationary-meshes>

For $sigma > 0$ let

$ cal(A)_sigma = { z in bb(C) : \| Im z \| < sigma } \, wide parallel f parallel_(a \, sigma) =
  max_(0 lt.eq j lt.eq a) sup_(cal(A)_sigma) \| f^(\( j \)) \| . $

Functions in a positive strip are holomorphic and periodic; they are real symmetric if $f \( macron(z) \) =
  overline(f \( z \))$. For $sigma = 0$, the same norm means the $C^a$ norm on the real circle.
  Constants in the lemmas below do not depend on $sigma$.

#thm([Lemma 2.3.])[
  #emph[Fix an integer $m gt.eq 2$, a bound $M$, and put $p = m + 2$, $r_0 = m + 15$.
    There are $R \, K \, N$, depending only on $M \, m$, with the following properties.
    Suppose $0 lt.eq sigma lt.eq 1$, $u$ is real symmetric, and $parallel u parallel_(r_0 \, sigma) lt.eq M$.
    For every integer $q gt.eq N$, let $delta = 2 pi \/ q$. There is a stationary fixed-endpoint mesh
#[#set math.equation(numbering: n => "(2.9)")
 $ X_j \( x \) = x + j delta + w_j \( x \) \, wide 0 lt.eq j lt.eq q \, wide w_0 = w_q = 0 \, $ <ana:mesh-definition>]

 on $cal(A)_(sigma')$, where $sigma' = \( 1 - K \/ q^2 \) sigma$, satisfying
#[#set math.equation(numbering: n => "(2.10)")
 $ parallel w parallel_(*) := q^2 max_j parallel w_j parallel_(p \, sigma') + q^3 max_j parallel w_(j + 1) -
   w_j parallel_(p \, sigma') lt.eq R . $ <ana:mesh-norm>]

 It depends differentiably on smooth real variations of $u$, and
$ parallel dot(w) parallel_(*) lt.eq C parallel dot(u) parallel_(r_0 \, sigma) . $

 The analogous difference estimate holds for two inputs in this ball.
   On the real axis, the mesh is also unique pointwise in the ball with the same scaled position and step bounds.
   This real uniqueness ball may be enlarged by any fixed amount if $N$ is increased.]
] <ana:mesh-lemma>

#proof[
  We give the composition estimates, including their width dependence. For a trial mesh in the ball (2.10), set
  $ X = X_j \, wide s = X_j - X_(j - 1) \, wide t = X_(j + 1) - X_j . $
  Then $s \, t = delta + O \( q^(- 3) \)$ in $C^p$. For $T = t$ or $T = - s$, and $0 lt.eq lambda lt.eq 1$,
    write $mu = X + lambda T z_lambda$. The midpoint equation is
  #[#set math.equation(numbering: n => "(2.11)")
   $ integral_0^(z_lambda) e^(u \( X + lambda T v \) - u \( X \)) thin thin upright(d) v = 1 /
     2 integral_0^1 e^(u \( X + lambda T v \) - u \( X \)) thin thin upright(d) v . $ <ana:midpoint-equation>]
  Moving the integrals of the exponential minus one to the other side expresses $z_lambda -
    1 \/ 2$ as a contraction on a $C^p$ ball of radius $C \/ q$.
    Indeed the exponential minus one is $O \( q^(- 1) \)$; its derivative with respect to $z_lambda$,
    after writing the left integral as an integral over $v = alpha z_lambda$, has the same bound.
    Products and compositions in this argument are estimated by the ordinary finite-order chain rule.
  All its evaluation points lie in the original strip. Their maps from $x$ are real symmetric and have derivative
    $1 + O \( q^(- 2) \)$:
  $ X' = 1 + O \( q^(- 2) \) \, wide T' = O \( q^(- 3) \) \, wide z'_lambda = O \( q^(- 1) \) . $
  For a real-symmetric map $x + rho + e \( x \)$, with $rho$ real and $parallel e' parallel lt.eq C q^(- 2)$,
    integration along the vertical segment from $Re x$ gives
  $ \| Im \( x + rho + e \( x \) \) \| lt.eq \( 1 + C q^(- 2) \) \| Im x \| . $
  Taking $K$ sufficiently large therefore puts every such point, and every segment used in the integrals,
    inside $cal(A)_sigma$. This is a relative loss $K sigma \/ q^2$, with no reciprocal power of $sigma$.
  Implicit differentiation of (2.11) gives, for $1 lt.eq i lt.eq 3$,
  #[#set math.equation(numbering: n => "(2.12)")
   $ parallel partial_lambda^i z_lambda parallel_(p \, sigma') lt.eq C q^(- i) . $ <ana:midpoint-jets>]
  To see the scaling, the coefficient of the derivative being solved for is
    $e^(u \( X + lambda T z_lambda \) - u \( X \)) = 1 + O \( q^(- 1) \)$.
    Each explicit $lambda$-derivative contributes a factor $T$;
    the lower implicit derivatives satisfy the same induction. For a mesh variation,
  $ parallel dot(X) parallel_(p \, sigma') lt.eq q^(- 2) parallel dot(w) parallel_(*) \, wide
    parallel dot(T) parallel_(p \, sigma') lt.eq q^(- 3) parallel dot(w) parallel_(*) . $
  Differentiating the same equations therefore gives, for $1 lt.eq i lt.eq 3$,
  #[#set math.equation(numbering: n => "(2.13)")
   $ parallel partial_lambda^i dot(z)_lambda parallel_(p \, sigma') lt.eq
     C q^(- i) #scale(x: 120%, y: 120%)[\(] q^(- 2) parallel dot(w) parallel_(*) +
     parallel dot(u) parallel_(r_0 \, sigma) #scale(x: 120%, y: 120%)[\)] . $ <ana:midpoint-variation>]
  For $i = 0$ the right hand side has an additional factor $q^(- 1)$.
    For example, a difference $u \( B \) - u \( X \)$ is written as the integral of $u'$ from $X$ to $B$.
    Its variation in a changed basepoint uses a difference of $u'$, hence retains the factor $B - X =
    O \( q^(- 1) \)$. This proves the extra factor also for variations, rather than merely for the values.
  The rescaled expression for (2.7) is
  $ F \( lambda \) & = \( lambda T \)^(- 2) D_1 \( X \, X + lambda T \)\
 & =
   e^(u \( X \)) integral_0^(z_lambda)
   frac(sin (lambda T integral_0^v e^(u \( X + lambda T v' \)) thin thin upright(d) v'), lambda T)
   e^(- 2 u \( X + lambda T v \)) thin thin upright(d) v . $
  The quotient at zero is removable: write it as $A_lambda \( v \) "sinc" \( lambda T A_lambda \( v \) \)$,
    where $A_lambda \( v \) = integral_0^v e^(u \( X + lambda T v' \)) thin thin upright(d) v'$ and $"sinc" z =
    sin z \/ z$. Thus (2.12), (2.13) apply to this expression and its first variations.
    The calculation following (2.8) gives
  $ F \( 0 \) = 1 / 8 \, wide F' \( 0 \) = 0 \, wide F'' \( 0 \) = 2 a \( X \) T^2 . $
  More explicitly, its third derivative has $C^p$ norm at most $C q^(- 3)$,
    and the third derivative of its first variation has norm at most
  $ C q^(- 3) #scale(x: 120%, y: 120%)[\(] q^(- 2) parallel dot(w) parallel_(*) +
    parallel dot(u) parallel_(r_0 \, sigma) #scale(x: 120%, y: 120%)[\)] . $
  Taylor’s integral remainder gives
  #[#set math.equation(numbering: n => "(2.14)")
   $ D_1 \( X \, X + T \) = T^2 (1 / 8 + a \( X \) T^2 + T^3 b \( X \, T \)) \, $ <ana:D1-uniform-expansion>]
  where the evaluated functions $a \( X \)$, $b \( X \, T \)$ have bounded $C^p$ norms.
    Their first variations are bounded by
  $ C #scale(x: 120%, y: 120%)[\(] q^(- 2) parallel dot(w) parallel_(*) +
    parallel dot(u) parallel_(r_0 \, sigma) #scale(x: 120%, y: 120%)[\)] . $
  In dividing the Taylor remainder by $T^3$, no small denominator is lost:
    $q T$ is $C^p$-close to $2 pi$ or $- 2 pi$, while $dot(T) \/ T = O \( q^(- 2) parallel dot(w) parallel_(*) \)$.
  We record a finite derivative budget for these statements.
    Third $lambda$-derivatives of the midpoint and integrand use derivatives of $u$ through order $p + 3$;
    their first variations use order $p + 4$. The estimates for differences follow from
  $ f compose A - f compose B = integral_0^1 f' \( B + alpha \( A - B \) \) \( A - B \) thin thin upright(d) alpha $
  and the $C^p$ chain rule, with the straight segment inside the input strip.
    Allowing two further derivatives covers all the coefficient and composition bounds just used.
    Thus $p + 6$ derivatives already suffice here, fewer than $r_0 = p + 13$.
    There has been no Cauchy estimate on $u$, so these constants are uniform also as $sigma arrow.b 0$.
  Antisymmetry of $D$ makes the Euler equation at $X_j$
  $ D_1 \( X \, X + t \) - D_1 \( X \, X - s \) = 0 . $
  Using (2.14) and factoring $t^2 - s^2$ rewrites it as
  #[#set math.equation(numbering: n => "(2.15)")
   $ w_(j + 1) - 2 w_j + w_(j - 1) = -
     frac(t^5 b \( X \, t \) + s^5 b \( X \, - s \), \( t + s \) #scale(x: 120%, y: 120%)[\(] 1 \/ 8 + \( t^2 +
     s^2 \) a \( X \) #scale(x: 120%, y: 120%)[\)]) . $ <ana:mesh-fixed-point>]
  The right hand side is $O \( q^(- 4) \)$ in $C^p$, and its Lipschitz constant in the starred mesh norm is
    $O \( q^(- 6) \)$. For example its numerator is $O \( q^(- 5) \)$,
    its denominator has size comparable to $q^(- 1)$, and a unit starred variation changes each coefficient and
    each relative step by $O \( q^(- 2) \)$. These statements hold for complex values as well,
    since the denominator is uniformly separated from zero.
  The Dirichlet inverse of the second difference has norm at most $C
    q^4$ from uniform $C^p$ forcing into the starred norm. Indeed, if the forcing is $f_j$, set $d_j = w_j -
    w_(j - 1)$. Then
  $ d_(j + 1) = d_j + f_j \, wide d_1 = - 1 / q sum_(i = 1)^(q - 1) \( q - i \) f_i . $
  It follows that $max parallel d_j parallel_(C^p) lt.eq C q max parallel f_j parallel_(C^p)$ and $max parallel
    w_j parallel_(C^p) lt.eq C q^2 max parallel f_j parallel_(C^p)$.
    Equation (2.15) is consequently a contraction with constant $C q^(- 2)$.
    Choose $R$ larger than its uniform image bound, then choose the width constant and $N$.
    The image bound can be taken independently of this fixed $R$:
    once $q$ is large depending on $R$, all scaled steps and derivatives in the preceding estimates lie in fixed
    bounded sets.
  Differentiating the contraction gives the asserted input derivative bound;
    comparing its fixed points gives the corresponding Lipschitz bound.
    The same argument with order-zero real norms proves pointwise uniqueness and works in any larger fixed real
    ball after increasing $N$. It follows in particular that constructions made with different fixed smoothness
    bounds or widths agree on their real domains for all sufficiently large $q$. ◻
]

=== 2.4 The high-frequency equations <the-high-frequency-equations>

For the mesh in 5, define its critical action and two associated Fourier coefficients by

#[#set math.equation(numbering: n => "(2.16)")
 $ W_q \( x \; u \) = sum_(j = 0)^(q - 1) D \( X_j \( x \) \, X_(j + 1) \( x \) \) \, wide C_n \( u \) = -
   frac(q^2, 6 pi) \[ W_q \( thin dot.op thin \; u \) \]_n \, quad n = plus.minus q \, $ <ana:constraint-definition>]

where

$ \[ f \]_n = frac(1, 2 pi) integral_0^(2 pi) e^(- upright(i) n x) f \( x \) thin thin upright(d) x . $

Real pointwise uniqueness makes these definitions compatible when the construction is performed on different
  strips or with different fixed smoothness bounds.

#thm([Proposition 2.4.])[
  #emph[For each integer $m gt.eq 2$ and $M < oo$, take $r_0 = m + 15$.
    There are constants $K \, N$, independent of $0 lt.eq sigma lt.eq 1$, such that,
    whenever $parallel u parallel_(r_0 \, sigma) lt.eq M$ and $\| n \| gt.eq N$, the derivative of (2.16) has the form
#[#set math.equation(numbering: n => "(2.17)")
 $ \( thin upright(d) C_n \)_u \( v \) = \[ b_n \( u \) v \]_n . $ <ana:constraint-derivative>]

 Here
#[#set math.equation(numbering: n => "(2.18)")
 $ parallel b_n \( u \) - 1 parallel_(m \, \( 1 - K \/ n^2 \) sigma) lt.eq frac(K, \| n \|) \,
   $ <ana:coefficient-estimate>]

 and, for two such inputs on the same strip,
#[#set math.equation(numbering: n => "(2.19)")
 $ parallel b_n \( u \) - b_n \( tilde(u) \) parallel_(m \, \( 1 - K \/ n^2 \) sigma) lt.eq
   frac(K, \| n \|) parallel u - tilde(u) parallel_(r_0 \, sigma) . $ <ana:coefficient-lipschitz>]

 The derivative identity holds for smooth real variations,
   and for real-symmetric holomorphic variations with the indicated finite norms.]
] <prop:high-frequency-estimate>

#proof[
  Put $q = \| n \|$ and $p = m + 2$. In varying the critical action,
    all interior mesh-variation terms vanish by stationarity. The endpoints $x$ and $x + 2 pi$ are fixed.
    We may therefore keep the vertices fixed and differentiate $D$ directly with respect to $u$.
  On the left half of a cell $\( X \, X + t \)$, differentiation of (2.5) and reversal of the two integrations
    give the kernel
  #[#set math.equation(numbering: n => "(2.20)")
   $ cal(K)_(-) \( z \) =  & 2 #scale(x: 120%, y: 120%)[\(] 1 -
     cos \( phi.alt \( z \) - phi.alt \( X \) \) #scale(x: 120%, y: 120%)[\)] e^(- 2 u \( z \))\
 & - e^(u \( z \)) integral_z^mu sin \( phi.alt \( zeta \) - phi.alt \( X \) \) e^(- 2 u \( zeta \)) thin thin
   upright(d) zeta \, $ <ana:variation-kernel>]
  integrated against $v \( z \) thin thin upright(d) z$. On the right half, the corresponding formula is
  $ cal(K)_(+) \( z \) =  & 2 #scale(x: 120%, y: 120%)[\(] 1 -
    cos \( phi.alt \( X + t \) - phi.alt \( z \) \) #scale(x: 120%, y: 120%)[\)] e^(- 2 u \( z \))\
 & - e^(u \( z \)) integral_mu^z sin \( phi.alt \( X + t \) - phi.alt \( zeta \) \) e^(- 2 u \( zeta \)) thin thin
   upright(d) zeta . $
  The moving-midpoint terms cancel because the two original integrands agree at $mu$.
  Parametrize the two halves, always from left to right, by
  $ z_(-) \( x \, alpha \) = X + alpha \( mu - X \) \, wide z_(+) \( x \, alpha \) = mu +
    alpha \( X + t - mu \) \, wide 0 lt.eq alpha lt.eq 1 \, $
  and set $tau_(-) = alpha \/ 2$, $tau_(+) = \( 1 + alpha \) \/ 2$.
    Uniformly in $j \, alpha$, the mesh and midpoint estimates give
  #[#set math.equation(numbering: n => "(2.21)")
   $ z_plus.minus \( x \, alpha \) & = x + \( j + tau_plus.minus \) delta + O_(C^p) \( q^(- 2) \) \,\
\( z_plus.minus \)_alpha & = pi / q + O_(C^p) \( q^(- 2) \) \,\
cal(K)_plus.minus \( z_plus.minus \( x \, alpha \) \) & = q^(- 2) k_0 \( 2 pi tau_plus.minus \) +
  O_(C^p) \( q^(- 3) \) \, $ <ana:half-cell-estimates>]
  where
  #[#set math.equation(numbering: n => "(2.22)")
   $ k_0 \( xi \) = 3 / 2 min \( xi \, 2 pi - xi \)^2 - pi^2 / 2 \, wide 0 lt.eq xi lt.eq 2 pi . $ <ana:leading-kernel>]
  Each remainder in (2.21) has the corresponding Lipschitz bound, with the same power of $q$, in $parallel u -
    tilde(u) parallel_(r_0 \, sigma)$.
  Here is a verification of both the leading terms and the remainder orders.
    On a cell, replace each occurrence of $u$ by its value at $X$,
    using the integrated identity for differences of $u$. Then replace $sin a$ by $a$ and $1 -
    cos a$ by $a^2 \/ 2$; every phase difference is $O \( q^(- 1) \)$. On the left this gives
  $ cal(K)_(-) \( z \) = \( z - X \)^2 - integral_z^mu \( zeta - X \) thin thin upright(d) zeta +
    O_(C^p) \( q^(- 3) \) = 3 / 2 \( z - X \)^2 - 1 / 2 \( mu - X \)^2 + O_(C^p) \( q^(- 3) \) . $
  The constant exponential factors cancel. The reflected expression gives the right half. Since
  $ z - X = delta tau_(-) + O_(C^p) \( q^(- 2) \) \, wide mu - X = delta \/ 2 + O_(C^p) \( q^(- 2) \) \, $
  and similarly from the right endpoint, these formulas give (2.22).
    An integrated difference gains one factor $q^(- 1)$ also after $p$ derivatives.
    Applying the composition-difference identity used in 5 proves the same gain for input variations.
    For completeness, the mesh coefficient estimates used at most $p + 6$ input derivatives;
    one further derivative for an integrated spatial difference and one for its moving-point variation bound all
    the kernel estimates by $C^(p + 8) = C^(m + 10)$ input norms. This is still below $r_0$.
  For each $j \, alpha$ and sign, the real map $x mapsto z_plus.minus \( x \, alpha \)$ is an increasing lift
    close to a real translation. Write its inverse as $x = x_plus.minus \( z \, alpha \)$.
    On a strip $cal(A)_(sigma'')$, with $sigma'' = \( 1 - K \/ q^2 \) sigma$ and a larger $K$, it satisfies
  #[#set math.equation(numbering: n => "(2.23)")
   $ x_plus.minus \( z \, alpha \) = z - \( j + tau_plus.minus \) delta +
     O_(C^(m + 1)) \( q^(- 2) \) . $ <ana:inverse-half-cell>]
  This estimate and its Lipschitz version use no additional input derivatives.
    In fact the forward error is $O \( q^(- 2) \)$ in $C^(m + 2)$.
    Its inverse equation is a contraction in $C^(m + 1)$, since a composition difference there uses just one
    additional derivative of the forward error. Real symmetry gives exactly the relative imaginary displacement
    used in the mesh construction, so a larger relative strip loss suffices for this inverse as well.
  Change the Fourier integration variable from $x$ to $z$. The integration interval may start at a different
    point, but its length is $2 pi$, and all integrands are periodic. Formula (2.17) follows with
  #[#set math.equation(numbering: n => "(2.24)")
   $ b_n \( z \) = - frac(q^2, 6 pi) sum_(j = 0)^(q - 1) sum_plus.minus integral_0^1 cal(K)_plus.minus \( z \)
     thin \( z_plus.minus \)_alpha \( x_plus.minus \( z \, alpha \) \, alpha \)
     thin \( x_plus.minus \)_z \( z \, alpha \) thin e^(- upright(i) n \( x_plus.minus \( z \, alpha \) - z \))
     thin thin upright(d) alpha . $ <ana:bn-formula>]
  In this formula the kernel is that of the cell belonging to the indicated $j \, alpha \, plus.minus$,
    evaluated after the inverse substitution.
  The phase in (2.24) has leading value
  $ e^(upright(i) n \( j + tau_plus.minus \) delta) = e^(2 pi upright(i) "sgn" \( n \) tau_plus.minus) . $
  Its error, and the error in each of its first $m$ derivatives, is $O \( q^(- 1) \)$, since $\| n \| =
    q$ multiplies the $O_(C^(m + 1)) \( q^(- 2) \)$ inverse displacement.
    The same statement holds for input differences. Substituting the leading terms in (2.24) thus gives
  $ - 1 / 3 integral_0^1 k_0 \( 2 pi tau \) e^(2 pi upright(i) "sgn" \( n \) tau) thin thin upright(d) tau . $
  The integral equals $- 3$. Indeed symmetry reduces it to
  $ 1 / pi integral_0^pi (3 / 2 xi^2 - pi^2 / 2) cos xi thin thin upright(d) xi = - 3 . $
  The leading coefficient is therefore $1$.
  Each cell contributes $O \( q^(- 1) \)$ to the leading coefficient and $O \( q^(- 2) \)$ to its error:
    the kernel, prefactor, and cell Jacobian have respective sizes $q^(- 2) \, q^2 \, q^(- 1)$,
    and their errors have one further factor $q^(- 1)$. These are absolute estimates,
    including at zeros of the leading kernel $k_0$. Summation over $q$ cells proves (2.18).
    Since the leading term is independent of $u$, the same computation with differences proves (2.19).
    The finite derivative budgets above and the relative domain losses prove the stated uniformity in $sigma$,
    including $sigma = 0$. ◻
]

#thm([Lemma 2.5.])[
  #emph[For the function $u$ associated with the actual table by (2.4),
#[#set math.equation(numbering: n => "(2.25)")
 $ C_n \( u \) = 0 wide upright("for all sufficiently large ") \| n \| . $ <ana:constraint-vanishing>]

]
] <ana:real-periodic-mesh>

#proof[
  The rational graphs of rotation $2 pi \/ q$ tend to the boundary:
    otherwise their parameters have a positive subsequential lower bound,
    whereas every fixed positive leaf has positive rotation. By 4,
    the successive $x$-coordinates on each such graph form a positive stationary mesh of $q$ steps whose sum is $2
    pi$. All its steps tend uniformly to zero.
  Let $s \, t$ be consecutive steps. The real Taylor expansion (2.14) first gives $s asymp t$, and then,
    after factoring $t^2 - s^2$, gives $t - s = O \( s^4 \)$. Consequently
  $ \| log t - log s \| lt.eq C s^3 . $
  Summing along any part of a circuit costs at most
  $ C sum_j s_j^3 lt.eq C \( max_j s_j \)^2 sum_j s_j = 2 pi C \( max_j s_j \)^2 . $
  All steps are therefore uniformly comparable. Their sum implies each is $O \( q^(- 1) \)$,
    so adjacent differences are $O \( q^(- 4) \)$. It follows that
  $ s_j = frac(2 pi, q) + O \( q^(- 3) \) \, wide X_j - x - frac(2 pi j, q) = O \( q^(- 2) \) . $
  These are exactly the real position and step bounds in a sufficiently large fixed uniqueness ball of 5.
    Thus this geometric mesh is the mesh defining $W_q$, pointwise for every initial $x$.
    In particular it has the smooth dependence on $x$ supplied by that construction.
  The geometric orbit satisfies the Euler equation also at the glued endpoints.
    In differentiating $W_q \( x \)$, its interior terms vanish by stationarity and its two endpoint derivatives
    sum to zero. Therefore $W'_q \( x \) = 0$, proving (2.25). ◻
]

=== 2.5 A Wiener-space inverse without loss of width <a-wiener-space-inverse-without-loss-of-width>

For a periodic function or Fourier sequence, put

$ \| f \|_sigma = sum_(k in bb(Z)) \| \[ f \]_k \| e^(sigma \| k \|) \, wide \| f \|_(sigma \, A) =
  sum_(k in bb(Z)) \( 1 + \| k \| \)^A \| \[ f \]_k \| e^(sigma \| k \|) . $

Let $Pi_(gt.eq N)$ denote projection onto indices $\| k \| gt.eq N$,
  and restrict the constraint map to those output indices. The following estimate explains why the mode-dependent
  width in (2.18) causes no loss for this operator.

#thm([Lemma 2.6.])[
  #emph[Fix the bounds in 6 for $m = 2$, and increase $N$ if necessary.
    On the Wiener space of width $sigma$, the coefficient formula for $thin upright(d)
    C \( u \)$ defines a bounded operator $A \( u \)$ satisfying
#[#set math.equation(numbering: n => "(2.26)")
 $ A \( u \) = Pi_(gt.eq N) + R \( u \) \, wide parallel R \( u \) parallel lt.eq C / N . $ <ana:wiener-near-identity>]

 For two bounded inputs on the same strip,
#[#set math.equation(numbering: n => "(2.27)")
 $ parallel A \( u \) - A \( tilde(u) \) parallel lt.eq C parallel u -
   tilde(u) parallel_(r_0 \, sigma) . $ <ana:wiener-lipschitz>]

 In particular, the restriction $A_H \( u \)$ to high input modes has inverse of norm at most $2$ when $N$ is
   sufficiently large. All these operators preserve real data.]
] <ana:wiener-estimate>

#proof[
  Contour displacement and two integrations by parts give
  $ \| \[ b_n \( u \) - 1 \]_j \| lt.eq frac(C, \| n \|) \( 1 + \| j \| \)^(- 2)
    e^(- \( 1 - K \/ n^2 \) sigma \| j \|) . $
  At $sigma = 0$ only the integrations by parts are used. For a positive strip one first displaces to a smaller
    closed strip and then lets its width tend to the stated width.
    The same estimate for coefficient differences has the additional factor $parallel u -
    tilde(u) parallel_(r_0 \, sigma)$.
  Take $N^2 gt.eq 2 K$. For all $k in bb(Z)$ and $\| n \| gt.eq N$,
  #[#set math.equation(numbering: n => "(2.28)")
   $ \| n \| - \| k \| - \( 1 - K \/ n^2 \) \| n - k \| lt.eq frac(2 K, \| n \|) . $ <ana:exponential-balance>]
  If $\| k \| lt.eq \| n \|$, the triangle inequality leaves at most $\( K \/ n^2 \) \| n - k \| lt.eq
    2 K \/ \| n \|$. If $\| k \| > \| n \|$, the entire left hand side is nonpositive.
    The weighted matrix entry for $R \( u \)$ is consequently bounded by
  $ frac(C, \| n \|) \( 1 + \| n - k \| \)^(- 2) e^(2 K sigma \/ \| n \|) . $
  Its column sum is at most
  $ C' / N sum_(j in bb(Z)) \( 1 + \| j \| \)^(- 2) lt.eq C'' / N . $
  This proves (2.26). The difference estimate follows from the same calculation.
    A Neumann series gives the high-mode inverse. Finally $C_(- q) \( u \) =
    overline(C_q \( u \))$ for real inputs, so the operators and their inverse preserve real Fourier symmetry. ◻
]

The operator in this lemma is initially obtained from smooth variations and is then extended by the displayed
  bounded matrix. This distinction matters at a strip boundary,
  where an element of the Wiener space need not have $r_0$ bounded derivatives.
  On every smaller strip it does have these derivatives, and the matrix coincides with the actual derivative
  there, by approximation with Fourier polynomials. It also coincides across input strip widths:
  real pointwise mesh uniqueness identifies the critical actions and hence all their derivative Fourier coefficients.

=== 2.6 Analytic approximation and uniqueness <analytic-approximation-and-uniqueness>

#proof[
  Let $u$ be the actual smooth function in (2.4). For the remainder of the proof set $m = 2$ and $r_0 = m + 15$. Choose
  $ M > 4 e #scale(x: 120%, y: 120%)[\(] 1 + \| u \|_(0 \, r_0) #scale(x: 120%, y: 120%)[\)] \, $
  and choose $N$ large enough for (2.25), Lemma 2.6, with $parallel R parallel lt.eq 1 \/ 2$.
    These choices are fixed before the approximation parameter below.
  Let $u_0$ be the Fourier truncation of $u$ to $\| k \| lt.eq P$, where $P > N$, and put $sigma_0 = 1 \/ P$.
    For each fixed integer $a$,
  #[#set math.equation(numbering: n => "(2.29)")
   $ \| u_0 \|_(sigma_0 \, a) lt.eq e \| u \|_(0 \, a) . $ <ana:truncation-bound>]
  We first prove that its residual is arbitrarily small in powers of $P$:
  #[#set math.equation(numbering: n => "(2.30)")
   $ \| C \( u_0 \) \|_(sigma_0) = O \( P^(- A) \) quad upright("for every fixed ") A . $ <ana:initial-residual>]
  The constants and the lower threshold for $P$ may depend on $A$.
  For $N lt.eq \| n \| lt.eq P$, the exponential weight is at most $e$.
    Integrate the derivative on the real segment from $u$ to $u_0$, use $C \( u \) = 0$,
    and apply 8 at width zero. The sum of these weighted coefficients is bounded by
  $ C \| u_0 - u \|_0 = O \( P^(- A) \) $
  for every $A$, since $u$ is smooth. For the remaining tail, $C \( 0 \) = 0$:
    the zero input has a uniform mesh and a constant critical action. Thus
  $ C_n \( u_0 \) = integral_0^1 \( thin upright(d) C_n \)_(lambda u_0) \( u_0 \) thin thin upright(d) lambda . $
  Use 6 here with one fixed integer $m > A + 2$. By (2.29), its higher input norms are uniformly bounded in $P$.
    Once $P$ exceeds the corresponding threshold, the estimate applies to every $\| n \| > P$.
    Real mesh uniqueness identifies these constraints with the ones already chosen using $m = 2$.
    The weighted convolution estimate in the preceding lemma also holds with a factor $\( 1 + \| n \| \)^A$: use
  $ \( 1 + \| n \| \)^A lt.eq \( 1 + \| n - k \| \)^A \( 1 + \| k \| \)^A $
  and sum the resulting power $\( 1 + \| n - k \| \)^(A - m)$. It follows that
  $ sum_(\| n \| > P) \( 1 + \| n \| \)^A \| C_n \( u_0 \) \| e^(sigma_0 \| n \|) lt.eq
    C_A \| u_0 \|_(sigma_0 \, A) lt.eq C'_A . $
  Dividing by $\( 1 + P \)^A$ proves the tail bound and hence (2.30).
    Only one larger fixed smoothness order is used for each requested power;
    no threshold uniform over all smoothness orders is needed.
  We now solve the high-mode equations while keeping every mode $\| k \| < N$ fixed. Set
  $ sigma_j = frac(1 + 2^(- j), 2 P) \, wide sigma_oo = frac(1, 2 P) \, wide epsilon_j = \| C \( u_j \) \|_(sigma_j) . $
  At step $j$, let
  #[#set math.equation(numbering: n => "(2.31)")
   $ eta_j = - A_H \( u_j \)^(- 1) C \( u_j \) \, wide u_(j + 1) = u_j + eta_j . $ <ana:newton-correction>]
  The correction has only high modes and satisfies
  $ \| eta_j \|_(sigma_j) lt.eq 2 epsilon_j . $
  For $a = sigma_j - sigma_(j + 1) = 2^(- j - 2) \/ P$, the elementary inequality $sup_(xi gt.eq 0) xi^(r_0)
    e^(- a xi) lt.eq C_(r_0) a^(- r_0)$ gives
  #[#set math.equation(numbering: n => "(2.32)")
   $ parallel eta_j parallel_(r_0 \, sigma_(j + 1)) lt.eq C P^(r_0) 2^(r_0 j) epsilon_j . $ <ana:correction-smoothing>]
  Thus the correcting segment has the finite input norm required for the derivative estimate on the smaller strip.
  As long as the inputs on that segment stay within the fixed bound $M$,
    integrate the difference of derivatives on it. The linear term cancels exactly by (2.31).
    Although its inverse was computed at width $sigma_j$, it is the same coefficient-defined derivative on the
    smaller strip, by the compatibility following 8. Therefore
  $ \| C \( u_(j + 1) \) \|_(sigma_(j + 1)) & lt.eq C parallel eta_j parallel_(r_0 \, sigma_(j + 1)) \|
    eta_j \|_(sigma_(j + 1))\
 & lt.eq C P^(r_0) 2^(r_0 j) epsilon_j^2 . $
  Equivalently,
  #[#set math.equation(numbering: n => "(2.33)")
   $ epsilon_(j + 1) lt.eq C P^(r_0) 2^(r_0 j) epsilon_j^2 . $ <ana:newton-recurrence>]
  This calculation can first be performed coefficientwise on the real axis, where every variation is smooth,
    and then estimated in the smaller-strip norm. It does not assume differentiability on a Wiener space with
    insufficient boundary derivatives.
  Choose $P$ sufficiently large that $epsilon_0 lt.eq P^(- 2 r_0)$, as permitted by (2.30).
    Increase it further so that the fixed constant in (2.33) satisfies $C P^(- r_0) 2^(r_0 + 1) < 1$. Induction gives
  #[#set math.equation(numbering: n => "(2.34)")
   $ epsilon_j lt.eq P^(- 2 r_0) 2^(- \( r_0 + 1 \) j) . $ <ana:newton-decay>]
  Indeed the ratio of the right hand side of (2.33), with this bound substituted, to the proposed bound at $j +
    1$, is at most $C P^(- r_0) 2^(r_0 + 1) 2^(- j)$. Moreover, (2.32), (2.34) give
  $ sum_(j gt.eq 0) parallel eta_j parallel_(r_0 \, sigma_(j + 1)) lt.eq C P^(- r_0) sum_(j gt.eq 0) 2^(- j) . $
  For sufficiently large $P$ this is smaller than $M \/ 4$. By (2.29), $u_0$ has norm less than $M \/ 4$.
    Every iterate and every correcting segment therefore has the required norm with slack.
    This proves the inductive bounded-input condition rather than assuming it.
    Formally, the induction is simultaneous: before applying (2.33) at step $j$,
    the already known bound on $epsilon_j$ and (2.32) put that entire correcting segment within the same
    cumulative norm bound; the recurrence then proves the next error bound.
  The corrections converge in $C^(r_0) \( cal(A)_(sigma_oo) \)$ to a real-symmetric holomorphic function $u_(*)$.
    Its low Fourier modes agree with those of $u$. For each fixed constraint,
    continuity of the real mesh construction and $epsilon_j arrow.r 0$ give $C_n \( u_(*) \) = 0$.
    The real segment from $u$ to $u_(*)$ remains in the original bounded input set.
    Put $v = u_(*) - u$, which has only high Fourier modes. At width zero,
  $ 0 = C \( u_(*) \) - C \( u \) = v + integral_0^1 R \( u + lambda v \) v thin thin upright(d) lambda . $
  The operator norm of the integral is at most $1 \/ 2$. Hence $\| v \|_0 lt.eq \| v \|_0 \/ 2$, so $v = 0$.
    Thus the original $u$ is real analytic.
  By (2.4), $phi.alt' = e^u > 0$ on the real axis. The primitive $phi.alt$ and its inverse are real analytic.
    The same equation then gives analytic $r$ in the normal-angle coordinate.
    Finally the smooth support function solves $h'' + h = r$, an analytic ordinary differential equation,
    and is therefore analytic. Its boundary parametrization $h n_theta + h' e_theta$ is analytic and regular. ◻
]

#thm([Corollary 2.7.])[
  #emph[For the actual table, the normalized action in (2.5) is holomorphic in a neighborhood of the real
    diagonal, diagonally $2 pi$-periodic, and antisymmetric. It satisfies
$ D \( X \, X + T \) = - T^3 \/ 24 + O \( T^5 \) \, wide D_1 \( X \, X + T \) = T^2 \/ 8 + O \( T^4 \) \, $

 locally uniformly with all fixed derivatives. The unique rational graphs and their identities in 4 are available
   for every sufficiently small positive reduced $l \/ q$.]
] <ana:analytic-action-interface>

#proof[
  Holomorphic extension follows from the analytic $u$, the midpoint implicit equation, and the integral formula.
    The identities and expansions are (2.6), (2.8); the final assertion is 4. ◻
]

== 3 A jointly analytic parametrization of the glancing collar <joint:section>

The analyticity of the boundary does not by itself give analytic dependence of its caustics on a transverse
  parameter. We prove that dependence by constructing a conjugacy in which the transverse parameter is the angular
  translation number. Rational periodicity supplies the compatibility conditions needed to divide the two
  difference operators at their resonances. Both the value and first-parameter-jet conditions use the full collar
  of rational leaves; they do not follow from the arbitrary-input action estimates alone.

By Theorem 2.1, Corollary 2.7, we may use the analytic normalized coordinate and action of (2.5).
  Thus $theta = phi.alt \( x \)$, $r \( phi.alt \( x \) \) phi.alt' \( x \)^3 = c > 0$,
  and $D$ is real analytic near the real diagonal, diagonally $2 pi$-periodic, and antisymmetric.
  On a fixed complex neighborhood of that diagonal,

#[#set math.equation(numbering: n => "(3.1)")
 $ D \( x \, x + b \) = - b^3 / 24 + O \( b^5 \) \, wide D_1 \( x \, x + b \) = b^2 / 8 + b^4 B \( x \, b \) \,
   $ <joint:action-expansion>]

where $B$ is holomorphic and periodic in $x$. All domains below are chosen inside this fixed neighborhood.

#thm([Theorem 3.1.])[
  (Joint glancing parametrization).  #emph[There are $s \, r_1 > 0$, with $r_1 < s$,
    and a real-symmetric holomorphic function $U \( y \, t \)$ on
$ { \( y \, t \) : \| Im y \| < 2 s \, med \| t \| < r_1 } $

 such that $U - y$ is $2 pi$-periodic in $y$, $U$ is even in $t$, $U \( y \, 0 \) = y$, and
#[#set math.equation(numbering: n => "(3.2)")
 $ D_1 #scale(x: 120%, y: 120%)[\(] U \( y \, t \) \, U \( y + t \, t \) #scale(x: 120%, y: 120%)[\)] +
   D_2 #scale(x: 120%, y: 120%)[\(] U \( y - t \, t \) \, U \( y \, t \) #scale(x: 120%, y: 120%)[\)] =
   0 $ <joint:stationary-equation>]

 for $\| Im y \| < s$, $\| t \| < r_1$. Here real symmetry means $U \( macron(y) \, macron(t) \) =
   overline(U \( y \, t \))$.]
  #emph[Set
#[#set math.equation(numbering: n => "(3.3)")
 $ Theta \( y \, t \) = phi.alt \( U \( y \, t \) \) \, wide p \( y \, t \) = -
   cal(S)_1 #scale(x: 120%, y: 120%)[\(] Theta \( y \, t \) \,
   Theta \( y + t \, t \) #scale(x: 120%, y: 120%)[\)] . $ <joint:oriented-coordinates>]

 On a possibly smaller product neighborhood, both functions are holomorphic, real-symmetric, and even in $t$.
   For positive small real $t$, the billiard map sends the line $\( Theta \( y \, t \) \, p \( y \, t \) \)$ to
   the line $\( Theta \( y + t \, t \) \, p \( y + t \, t \) \)$.
   The variables $\( y \, t^2 \)$ give analytic coordinates on a full one-sided phase collar. Moreover,
#[#set math.equation(numbering: n => "(3.4)")
 $ d p and d Theta = A \( t \) thin d y and d t \, wide A \( t \) = c / 4 t + O \( t^3 \) \, $ <eq:area-coefficient>]

 where $A$ is holomorphic and real on the real axis. In particular $t^2$ is a nondegenerate analytic first
   integral on that collar.]
] <thm:joint-parametrization>

=== 3.1 Normalized equations and their linearization <normalized-equations-and-their-linearization>

For a fixed parameter $t$, write

$ T_z v \( y \) = v \( y + z \) \, wide partial_t^(upright(d)) v = frac(T_(t \/ 2) v - T_(- t \/ 2) v, t) . $

The superscript distinguishes this difference operator from an ordinary parameter derivative.
  We abbreviate it to $partial$ when the parameter is understood. A prime always denotes a $y$-derivative.
  For a candidate $U$, define

#[#set math.equation(numbering: n => "(3.5)")
 $ cal(R) \( U \) & = D_1 \( U \, T_t U \) + D_2 \( T_(- t) U \, U \) \,\
E \( U \) & = t^(- 3) U' cal(R) \( U \) \,\
a \( U \) & = t^(- 1) D_12 \( T_(- t \/ 2) U \, T_(t \/ 2) U \) \( T_(- t \/ 2) U' \) \( T_(t \/ 2) U' \) .
  $ <joint:normalized-residual>]

The symbol $a$ in this Section is the coefficient of the linearized equation;
  the complex unit normal used in later Sections will be defined separately.

#thm([Lemma 3.2.])[
  (Regularity and automatic factorization).  #emph[The expressions in (3.5)–(3.5) extend holomorphically to $t =
    0$, with
#[#set math.equation(numbering: n => "(3.6)")
 $ E \( U \) \( y \, 0 \) = frac(\( U' \)^2 U'', 4) \, wide a \( U \) \( y \, 0 \) =
   frac(\( U' \)^3, 4) . $ <joint:zero-parameter>]

 If $U$ is even in $t$, so are $E$ and $a$. The mean of $E$ over a real period in $y$ vanishes.
   For a variation $delta U = U' v$,
#[#set math.equation(numbering: n => "(3.7)")
 $ E_U \( U' v \) = partial \( a partial v \) + \( E v \)' . $ <joint:linearization>]

 At an exact solution at a nonzero real parameter $t_0$, assign an arbitrary parameter jet $dot(U) = U' z$.
   Its total residual jet is
#[#set math.equation(numbering: n => "(3.8)")
 $ dot(E) = partial (a partial z + a / t_0) . $ <joint:parameter-jet>]

 All these identities hold wherever their shifted arguments are defined.]
] <joint:factorization>

#proof[
  By antisymmetry,
  $ cal(R) = D_1 \( U \, T_t U \) - D_1 \( U \, T_(- t) U \) . $
  Put $v_(+) = T_t U - U = t A_(+)$ and $v_(-) = T_(- t) U - U = - t A_(-)$, where
  $ A_plus.minus = integral_0^1 U' \( y plus.minus lambda t \, t \) thin d lambda . $
  The leading part of $t^(- 3) cal(R)$ is
  $ 1 / 8 \( A_(+) + A_(-) \) frac(A_(+) - A_(-), t) . $
  The last quotient is holomorphic, because
  $ frac(A_(+) - A_(-), t) = integral_0^1 integral_(- lambda)^lambda U'' \( y + mu t \, t \) thin d mu thin d lambda . $
  The remaining part, using (3.1), is
  $ t [A_(+)^4 B \( U \, t A_(+) \) - A_(-)^4 B \( U \, - t A_(-) \)] . $
  This proves regularity and the formula for $E \( y \, 0 \)$.
    Differentiating (3.1) in its second argument gives $D_12 \( x \, x + b \) = b \/ 4 + O \( b^3 \)$,
    proving the formula for $a$. The same integral formulas show that, on smaller domains,
    the first two variations of $E$ are bounded by fixed polynomials in the appropriate norms of the variations
    and their first two $y$-derivatives. There is no negative power of $t$ in these bounds.
  Antisymmetry interchanges the forward and backward terms when $t$ is replaced by $- t$, giving evenness.
    For real $t$, the mean action
  $ frac(1, 2 pi) integral_0^(2 pi) D #scale(x: 120%, y: 120%)[\(] U \( y + eta \, t \) \,
    U \( y + eta + t \, t \) #scale(x: 120%, y: 120%)[\)] thin d y $
  does not depend on $eta$. Differentiation at $eta = 0$ gives $chevron.l U' cal(R) chevron.r = 0$.
    Holomorphic continuation gives $chevron.l E chevron.r = 0$ for complex $t$ as well.
  For (3.7), subtract from the off-diagonal Hessian terms those in which $v$ is evaluated at $y$.
    The remaining terms are
  $ t^(- 3) [c_(+) \( T_t v - v \) + c_(-) \( T_(- t) v - v \)] \, $
  where
  $ c_(+) = D_12 \( U \, T_t U \) U' T_t U' \, wide c_(-) = D_12 \( T_(- t) U \, U \) T_(- t) U' U' . $
  Since $T_(plus.minus t \/ 2) a = c_plus.minus \/ t$, this is $partial \( a partial v \)$.
    The factored terms, including the variation of the prefactor $U'$, are $\( E v \)'$.
  Finally, at an exact solution the derivative of $t^(- 3)$ contributes zero.
    Differentiating only the explicit shifts gives $\( c_(+) - c_(-) \) \/ t_0^3 = partial a \/ t_0$.
    The assigned jet contributes $partial \( a partial z \)$ by (3.7). This proves (3.8). ◻
]

We specify the domains used to control complex shifts. For $nu in { 0 \, 1 / 2 \, 1 }$, set

#[#set math.equation(numbering: n => "(3.9)")
 $ cal(D)^nu \( s \, d \) = { \( y \, t \) : \| t \| < d \, med \| Im y \| < s -
   nu \| Im t \| } . $ <joint:slanted-domains>]

Fix $d < s \/ 2$, and choose both sufficiently small relative to the fixed domain of $D$.
  Also take $d$ small enough that every positive real step of size at most $3
  d$ in the normalized coordinate gives a line in the filled phase collar of 4.
  This is possible uniformly around the boundary by the support-point formulas and compactness.
  We work with candidates for which $U - y$ and its first three $y$-derivatives are uniformly small on
  $cal(D)^0 \( s \, d \)$. The smallness constant is fixed once and for all.
  It ensures that every composition above is defined, $U'$ is close to one,
  and $4 a$ is close to one on $cal(D)^(1 \/ 2) \( s \, d \)$.
  Indeed, the leading term of $a$ is the product of three averaged first derivatives divided by four;
  its remaining terms are $O \( d^2 \)$.

For $0 < delta < d \/ 100$, abbreviate

$ cal(D)_j^nu = cal(D)^nu \( s - j delta \, d - j delta \) \, wide Y_j = { y : \| Im y \| < s - j delta } . $

All norms are supremum norms unless derivatives are indicated.
  Cauchy’s estimate between successive such domains costs a fixed power of $delta^(- 1)$.
  For example, polydisks of radius $delta \/ 4$ in each variable based in $cal(D)_(j + 1)^nu$ lie in
  $cal(D)_j^nu$. A shift by $t \/ 2$ increases the required domain index $nu$ by $1 \/ 2$.

#thm([Proposition 3.3.])[
  (A Newton step across all retained resonances).  #emph[There are constants $C \, B_0$,
    depending only on the fixed action domain and the fixed smallness bounds above, with the following property.
    Suppose $U$ is real-symmetric, even in $t$, and $U - y$ is periodic, and
$ parallel E \( U \) parallel_(cal(D)_0^1) lt.eq epsilon < 1 . $

 Let $N gt.eq 1$ satisfy $e^(- N delta) lt.eq epsilon$, and put $Q = 1 + N + delta^(- 1)$.
   If $C Q^(B_0) epsilon$ is sufficiently small, there is a real-symmetric, even correction $Delta U$,
   periodic in $y$, such that
#[#set math.equation(numbering: n => "(3.10)")
 $ max_(0 lt.eq j lt.eq 3) parallel partial_y^j Delta U parallel_(cal(D)_20^0) & lt.eq C Q^(B_0) epsilon \,\
parallel E \( U + Delta U \) parallel_(cal(D)_20^1) & lt.eq C Q^(B_0) epsilon^2 . $ <joint:step-correction>]

 The exponent $B_0$ is fixed; it is independent of $N$, the retained rationals,
   and the order of any formal approximation used to initialize the iteration.]
] <prop:joint-newton>

We prove the Proposition in three parts. In the estimates that follow, $P$ denotes a quantity bounded by $C Q^B$,
  with a fixed exponent $B$. The exponent may increase a fixed finite number of times.
  At the end we choose $B_0$ larger than all these exponents,
  including those needed for the stated smallness conditions.

=== 3.2 Rational corrections and compatible parameter jets <rational-corrections-and-compatible-parameter-jets>

#thm([Lemma 3.4.])[
  (The two rational compatibility conditions).  #emph[Under the hypotheses of 12, let $t_0 =
    2 pi l \/ q eq.not 0$ be reduced, with $q lt.eq N$ and $\| t_0 \| < d - 2 delta$.
    There are holomorphic jets $w \, dot(w)$ on $Y_10$, real-symmetric in $y$, such that
#[#set math.equation(numbering: n => "(3.11)")
 $ E + partial \( a partial w \) & = O \( P epsilon^2 \) \,\
#scale(x: 120%, y: 120%)[\(] E + partial \( a partial w \) #scale(x: 120%, y: 120%)[\)]^dot.op & =
  O \( P epsilon^2 \) \,\
w \, dot(w) & = O \( P epsilon \) . $ <joint:rational-compatibility>]

 The dot differentiates the entire expression with respect to $t$ at $t_0$,
   using the displayed assigned jet for $w$. The bounds also hold after any of the fixed derivative losses used below.]
] <joint:rational-jets>

#proof[
  We first take $t_0 > 0$. Write $U_j \( y \) = U \( y + j t_0 \, t_0 \)$ for $0 lt.eq j lt.eq q$,
    and look for stationary nodes
  $ tilde(X)_j = U_j + U'_j xi_j \, wide xi_0 = xi_q = 0 . $
  The endpoints differ by $q t_0 = 2 pi l$. Scale the interior stationarity equations by $t_0^(- 3) U'_j$.
    Their residual at $xi = 0$ is $T_(j t_0) E$, and their linearization is a divergence matrix plus a diagonal
    potential:
  #[#set math.equation(numbering: n => "(3.12)")
   $ \( A_0 xi \)_j & = frac(a_(j + 1 \/ 2) \( xi_(j + 1) - xi_j \) - a_(j - 1 \/ 2) \( xi_j - xi_(j - 1) \), t_0^2) \,\
V_j & = T_(j t_0) (E' - U'' / U' E) \, wide a_(j + 1 \/ 2) =
  a \( y + \( j + 1 \/ 2 \) t_0 \, t_0 \) . $ <joint:dirichlet-linearization>]
  All translations here are real and preserve the $y$-strip.
  For completeness, the complex Dirichlet inverse has the same polynomial bound as the real one.
    For $A_0 xi = F$, introduce the fluxes $J_(j + 1 \/ 2) = a_(j + 1 \/ 2) \( xi_(j + 1) - xi_j \)$. Then
  $ J_(j + 1 \/ 2) = J_(1 \/ 2) + t_0^2 sum_(i = 1)^j F_i . $
  The condition $sum_(j = 0)^(q - 1) \( xi_(j + 1) - xi_j \) = 0$ determines $J_(1 \/ 2)$.
    Since $a_(j + 1 \/ 2)^(- 1)$ is uniformly close to 4,
  $ lr(|sum_(j = 0)^(q - 1) a_(j + 1 \/ 2)^(- 1)|) gt.eq c_0 q . $
  Consequently
  #[#set math.equation(numbering: n => "(3.13)")
   $ parallel A_0^(- 1) parallel_(oo arrow.r oo) lt.eq C q^2 t_0^2 lt.eq C Q^2 . $ <joint:dirichlet-inverse>]
  Cauchy’s estimate gives $parallel V parallel_(Y_1) lt.eq C Q epsilon$.
    A Neumann perturbation therefore gives the same inverse bound for $A_0 + V$ if $C Q^3 epsilon$ is small.
  There is also a uniform polynomial bound for the nonlinear remainder.
    The scaled equations contain only three adjacent nodes, fixed bounded derivatives of $D$,
    and the factor $t_0^(- 3)$. Since
  #[#set math.equation(numbering: n => "(3.14)")
   $ \| t_0 \|^(- 1) lt.eq frac(N, 2 pi) \, $ <joint:rational-lower-bound>]
  their second derivatives in $xi$ have norm at most $C Q^3$.
    The fixed-point equation obtained with $\( A_0 + V \)^(- 1)$ thus preserves a ball of radius $C Q^2
    epsilon$ and contracts there if $C Q^7 epsilon$ is small.
    This gives holomorphic corrections on $Y_1$, with $parallel xi parallel lt.eq C Q^2 epsilon$.
    Uniqueness preserves periodicity and real symmetry. Further derivatives follow by Cauchy estimates on
    subsequent strips.
  On real $y$, the node increments are positive and small: their uncorrected increments are bounded below by a
    fixed multiple of $t_0$, and the correction is smaller than that by (3.14) and the polynomial smallness
    condition. The stationary nodes therefore describe actual billiard trajectories whose initial lines lie in the
    given phase collar. Such a line belongs to one of the invariant caustic graphs.
    At the q-th step its angle has increased by $2 pi l$; invariance of the graph forces its momentum also to
    return. Its rotation is $l \/ q$. By 4, this is the unique graph of that rotation,
    and every point of it is q-periodic.
  Use the local inverse of $U \( thin dot.op thin \, t_0 \)$ near each $U_j$ to write
  $ tilde(X)_j \( y \) = U \( tilde(y)_j \( y \) \, t_0 \) \, wide tilde(y)_j = y + j t_0 + O \( P epsilon \) . $
  These are holomorphic on $Y_2$. A contraction for the displacement from $y + j t_0$, using $U'$ close to one,
    gives this inverse without any global inverse-domain assumption.
    On real points, the graph just identified implies $tilde(y)_j =
    tilde(y)_1^(thin j)$ as iterates and $tilde(y)_q = y + q t_0$. Hence
  $ G \( y \) = 1 / q sum_(j = 0)^(q - 1) \( tilde(y)_j \( y \) - j t_0 \) $
  satisfies $G \( tilde(y)_1 \( y \) \) = G \( y \) + t_0$.
    It is close to the identity, and Cauchy’s estimate makes $G'$ close to one on $Y_3$.
    Its inverse exists on $Y_4$, again by contraction. The function
  #[#set math.equation(numbering: n => "(3.15)")
   $ U_(*) \( y \) = U \( G^(- 1) \( y \) \, t_0 \) $ <joint:exact-rational-parametrization>]
  is an exact solution at $t_0$, and $U_(*) - U \( thin dot.op thin \, t_0 \) = O \( P epsilon \)$.
    The identities first obtained on the real axis extend throughout the stated complex strips.
  We next assign a compatible parameter jet to $U_(*)$. Start with $dot(U)_(*) =
    U_t \( thin dot.op thin \, t_0 \)$. Its total residual jet is $O \( P epsilon \)$ on $Y_6$.
    Indeed $E_t = O \( P epsilon \)$ by Cauchy’s estimate, and replacing $U$ by $U_(*)$,
    with the same assigned jet, changes the explicit differentiated formula for $E$ by $O \( P epsilon \)$.
    Only finitely many derivatives occur, and every denominator $t_0$ is controlled by (3.14).
    More explicitly, for any assigned jet $V$, the raw derivative is
  #[#set math.equation(numbering: n => "(3.16)")
   $ dot(E) =  & - 3 t^(- 4) U' cal(R) + t^(- 3) V' cal(R)\
 & + t^(- 3) U' #scale(x: 120%, y: 120%)[\[] D_11 \( U \, T_t U \) V + D_12 \( U \, T_t U \) \( T_t V + T_t U' \)\
 & #h(35mm)  + D_21 \( T_(- t) U \, U \) \( T_(- t) V - T_(- t) U' \) +
   D_22 \( T_(- t) U \, U \) V #scale(x: 120%, y: 120%)[\]] . $ <joint:raw-parameter-derivative>]
  This formula makes both the fixed derivative count and the worst explicit denominator $t^(- 4)$ transparent.
  Let
  $ Pi v = 1 / q sum_(j = 0)^(q - 1) T_(j t_0) v $
  be the orbit-average projection. Equation (3.8) shows that $Pi dot(E)_(*) = 0$.
    This uses only $partial = T_(- t_0 \/ 2) \( T_(t_0) - 1 \) \/ t_0$ and $Pi T_(t_0) = Pi$;
    the half-shift need not act trivially. To write the cyclic inverse explicitly, put $T = T_(t_0)$ and
  $ R_q = 1 / q sum_(j = 0)^(q - 1) j T^j . $
  Since $T^q = 1$, one has $\( T - 1 \) R_q = 1 - Pi$. Thus on $ker Pi$, $partial^(- 1) = t_0 R_q T_(t_0 \/ 2)$, and
  $ parallel partial^(- 1) parallel lt.eq C q \| t_0 \| . $
  The polynomial smallness condition makes $U_(*)$ close enough to $U$ through the required derivatives that $4
    a_(*)$ is still close to one. The operator $\( 1 - Pi \) a_(*)$ on $ker Pi$ is therefore invertible:
    its difference from multiplication by $1 \/ 4$ has norm at most $2 parallel a_(*) - 1 \/ 4 parallel$.
    Factoring through these three operators proves
  #[#set math.equation(numbering: n => "(3.17)")
   $ ∥\( partial a_(*) partial \)^(- 1)∥_(ker Pi) lt.eq C q^2 t_0^2 . $ <joint:rational-jet-inverse>]
  Correcting $dot(U)_(*)$ by $U'_(*) z$, with $z in ker Pi$, now makes $dot(E)_(*) = 0$, at cost $O \( P epsilon \)$.
  Define $w = \( U_(*) - U \) \/ U'$ and assign its derivative by differentiating this quotient with the corrected
    jet of $U_(*)$. Both $w$ and $dot(w)$ are $O \( P epsilon \)$. Taylor expansion and (3.7) give
  $ 0 = E \( U_(*) \) = E + partial \( a partial w \) + \( E w \)' + O \( P epsilon^2 \) . $
  Differentiating this Taylor identity once in the assigned parameter jets gives the second assertion in (3.11).
    The term $\( E w \)'$ and its jet are quadratic, because $E \, E_t \, w \,
    dot(w)$ are all bounded by a polynomial times $epsilon$. The same is true of the differentiated Taylor remainder.
  Here is a concrete accounting for the fixed-polynomial assertion.
    The mesh inverse and correction cost at most $C Q^2$; the nonlinear mesh Hessian costs $C Q^3$.
    Using subsequent strip losses for the fixed number of derivatives,
    comparison of the initially assigned residual jet costs at most $C Q^10 epsilon$,
    and its correction costs at most $C Q^12 epsilon$. In a first parameter derivative of a quadratic remainder,
    either one correction is replaced by its assigned jet, or one coefficient is differentiated.
    The latter introduces at most one additional $t_0^(- 1)$, fixed derivatives of $D$, and bounded $U_t \, U'_t$.
    Before further y-derivatives, the value remainder is bounded by $C Q^8 epsilon^2$ and its first jet by $C Q^18
    epsilon^2$: a correction and its first y-derivative cost $Q^2 epsilon \, Q^3 epsilon$,
    whereas the assigned correction jet and its first y-derivative cost $Q^12 epsilon \, Q^13 epsilon$.
    Multiplication by $t_0^(- 3)$ gives these bounds; differentiating that factor or a coefficient costs less.
    Allowing six additional y-derivatives on a fixed smaller strip therefore bounds both remainders by $C Q^24
    epsilon^2$, more than is needed below. Enlarging to $C Q^40$ covers all bounds and smallness conditions in
    this Lemma. These exponents are deliberately inessential upper bounds;
    in particular they do not depend on any formal approximation order.
  For negative $t_0$, apply the positive construction at $- t_0$ and use the even symmetry,
    reversing the sign of the assigned parameter jet. ◻
]

=== 3.3 Division at the resonant parameters <division-at-the-resonant-parameters>

For a periodic function $v$, write

$ v \( y \, t \) = sum_(n in bb(Z)) v_n \( t \) e^(upright(i) n y) \, wide d_n \( t \) =
  frac(2 upright(i) sin \( n t \/ 2 \), t) . $

Thus $\( partial v \)_n = d_n v_n$, with $d_n \( 0 \) = upright(i) n$.
  The nonzero zeros of $d_n$ are simple and occur at $t_j = 2 pi j \/ n$, $j eq.not 0$.

#thm([Lemma 3.5.])[
  (Buffered Fourier division).  #emph[Let $nu in { 1 \/ 2 \, 1 }$,
    and suppose a mean-zero periodic function $F$ is holomorphic on $cal(D)_(j_0)^nu$, with norm at most $M$.
    Suppose, for $1 lt.eq \| n \| lt.eq N$, its values at the divisor zeros $0 < \| t_j \| < d - b delta$,
    where $b gt.eq j_0 + 1$, satisfy
$ \| F_n \( t_j \) \| lt.eq eta e^(- \| n \| \( s - a delta \)) \, wide a gt.eq j_0 . $

 Define, for these retained modes,
#[#set math.equation(numbering: n => "(3.18)")
 $ R_n \( t \) & = sum_(0 < \| t_j \| < d - b delta) F_n \( t_j \)
   frac(sin \( n \( t - t_j \) \/ 2 \), n \( t - t_j \) \/ 2) \,\
H_n \( t \) & = frac(F_n \( t \) - R_n \( t \), d_n \( t \)) \, $ <joint:sinc-interpolant>]

 and put $H_0 = 0$, $H_n = 0$ for $\| n \| > N$. On $\| t \| < d - \( b + 1 \) delta$,
   every retained $H_n$ is holomorphic. For an integer $J$ larger than $a$, $j_0$, and $b + 1$,
#[#set math.equation(numbering: n => "(3.19)")
 $ parallel H parallel_(cal(D)_J^(nu - 1 \/ 2)) & lt.eq P \( M + eta \) \,\
parallel partial H - F parallel_(cal(D)_J^nu) & lt.eq P #scale(x: 120%, y: 120%)[\(] eta +
  M e^(- N delta) #scale(x: 120%, y: 120%)[\)] . $ <joint:division-bounds>]

 Fixed derivatives are bounded after fixed additional domain losses by increasing $P$.
   Real symmetry and evenness in $t$ are preserved.]
] <joint:fourier-division>

#proof[
  At two distinct divisor zeros, the sinc kernel in (3.18) is zero; at its own center it is one.
    Thus $R_n \( t_j \) = F_n \( t_j \)$, so the zeros in the quotient are removable.
    There are at most $C N$ interpolation points for each mode, because $d < 1$. The identity
  $ frac(sin z, z) = integral_0^1 cos \( u z \) thin d u $
  gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ \| R_n \( t \) \| + N^(- 1) \| R'_n \( t \) \| lt.eq P eta
     e^(- \| n \| \( s - a delta - \| Im t \| \/ 2 \)) . $ <joint:interpolant-bound>]
  Outside disks centered at the divisor zeros with radius $c_1 min \( \| n \|^(- 1) \, delta \)$,
    elementary estimates for the sine give
  $ \| d_n \( t \) \|^(- 1) lt.eq P e^(- \| n Im t \| \/ 2) . $
  Here and below a harmless fixed constant can be absorbed into $P$.
    For $\| n t \| lt.eq 1$, the function $sin \( n t \/ 2 \) \/ \( n t \/ 2 \)$ is bounded away from zero.
    Thus $\| d_n \( t \) \|^(- 1) lt.eq C \/ \| n \|$, which has the required bound since $e^(- \| n Im t \| \/ 2)
    gt.eq e^(- 1 \/ 2)$. On the remaining region, write $n t \/ 2 = u +
    upright(i) v$ and use $\| sin \( u + upright(i) v \) \|^2 = sin^2 u + sinh^2 v$.
    Outside the nonzero-root disks, $\| sin \( u + upright(i) v \) \|$ is bounded below by a fixed multiple of
    $min \( 1 \, \| n \| delta \) e^(\| v \|)$: if the nearest sine zero is zero,
    the condition $\| n t \| > 1$ supplies the required fixed separation.
    Multiplication by $\| t \| < 1$ then gives a polynomial bound in $Q$.
    Inside the nonzero-root disks, apply maximum modulus to the holomorphic quotient.
    The change in any exponential weight is bounded by $e^(C \| n \| min \( \| n \|^(- 1) \, delta \))$,
    a fixed constant. The parameter buffer ensures that every disk meeting the target domain is contained in the
    domain of $F_n$ and has its center among the interpolation points.
  The input strip gives
  $ \| F_n \( t \) \| lt.eq M e^(- \| n \| \( s - j_0 delta - nu \| Im t \| \)) . $
  After division its imaginary-parameter loss is $\( nu - 1 \/ 2 \) \| Im t \|$.
    The interpolant contribution after division has no such loss. Hence
  $ \| H_n \( t \) \| lt.eq P \( M + eta \) e^(- \| n \| \( s - a delta - \( nu - 1 \/ 2 \) \| Im t \| \)) . $
  Summing on the smaller y-strip proves the first bound, with a geometric sum of size at most $C \/ delta$.
    The retained-mode residual is $- R_n$, and the omitted tail of $F$ gains at least $e^(- N delta)$;
    summing similarly proves the second bound. Each fixed y-derivative costs only a fixed power of $N$ or
    $delta^(- 1)$. Parameter derivatives follow from the explicit bound on $R'_n$ or from Cauchy’s estimate on a
    further buffered domain.
  For real-symmetric input, conjugate modes have conjugate output, because $d_(- n) \( macron(t) \) =
    overline(d_n \( t \))$. If the input is even, the divisor zeros occur in opposite pairs and the interpolant is
    even; so is the quotient. These properties survive the symmetric truncation. ◻
]

#proof[
  First divide $f = - E$. Its mean is zero by 11. For $\| n \| lt.eq N$,
    every nonzero zero of $d_n$ has reduced denominator at most $N$.
    At those zeros with $\| t_j \| < d - 3 delta$, the first equation of (3.11) gives
  $ \| f_n \( t_j \) \| lt.eq P epsilon^2 e^(- \| n \| \( s - 10 delta \)) . $
  Apply 14 with $nu = 1$, $j_0 = 0$, $a = 10$, $b = 3$, and $J = 11$. Call its output $h$. Then
  #[#set math.equation(numbering: n => "(3.21)")
   $ h = O \( P epsilon \) med upright("on ") cal(D)_11^(1 \/ 2) \, wide partial h + E = O \( P epsilon^2 \) med
     upright("on ") cal(D)_11^1 . $ <joint:first-division>]
  The term involving the interpolation values is absorbed by the smallness condition. Define
  #[#set math.equation(numbering: n => "(3.22)")
   $ b = a^(- 1) \( h + lambda \) \, wide lambda \( t \) = -
     frac(chevron.l a^(- 1) h chevron.r, chevron.l a^(- 1) chevron.r) . $ <joint:mean-adjustment>]
  The denominator is bounded away from zero because $a^(- 1)$ is close to four.
    Thus $b$ has mean zero and is $O \( P epsilon \)$ on $cal(D)_12^(1 \/ 2)$.
  We need new compatibility conditions before dividing $b$.
    Fix a retained rational $t_0$ with $\| t_0 \| < d - 14 delta$, and put $g = a partial w$, using 13.
    For retained nonzero modes the exact first-division identity is
  $ d_n \( h_n - g_n \) = - \( E + partial g \)_n - R_n . $
  Its value and its first parameter derivative at $t_0$ are bounded by $P epsilon^2
    e^(- \| n \| \( s - 10 delta \))$, by the two compatibility conditions and (3.20).
    If $d_n \( t_0 \) eq.not 0$, reducedness of $l \/ q$ gives
  $ \| sin \( pi n l \/ q \) \| gt.eq c \/ q \, wide \| d_n \( t_0 \) \|^(- 1) lt.eq C q \| t_0 \| . $
  If $d_n \( t_0 \) = 0$, then
  $ \| d'_n \( t_0 \) \| = \| n \| \/ \| t_0 \| \, $
  and differentiation of the product gives the same bound for $h_n - g_n$.
    In particular, this comparison does not require the resonant modes of $g$ to vanish.
  For the omitted modes, $h_n = 0$, whereas the analytic function $g$ has norm $P epsilon$ on $Y_10$.
    Its tail on $Y_13$ is bounded by $P epsilon e^(- 3 N delta)$, hence by $P epsilon^2$.
    Summing retained and omitted modes gives
  $ h - \( g - g_0 \) = O \( P epsilon^2 \) quad upright("on ") Y_13 . $
  Since $chevron.l a^(- 1) g chevron.r = chevron.l partial w chevron.r = 0$,
    the mean choice in (3.22) gives $lambda = g_0 + O \( P epsilon^2 \)$. Consequently
  #[#set math.equation(numbering: n => "(3.23)")
   $ b - partial w = O \( P epsilon^2 \) quad upright("on ") Y_13 . $ <joint:second-compatibility>]
  At a nonzero divisor zero for a retained mode, $\( partial w \)_n = 0$.
    Thus (3.23) supplies the values needed for the second division,
    with bound $P epsilon^2 e^(- \| n \| \( s - 13 delta \))$.
  Apply 14 to $b$, now with $nu = 1 \/ 2$, $j_0 = 12$, $a = 13$, $b = 15$, and $J = 17$.
    To avoid ambiguity, the letter $b = 15$ here denotes the integer buffer in that Lemma,
    not the function in (3.22). Call the output $v$. The remaining half of the imaginary-parameter loss is
    canceled, giving
  #[#set math.equation(numbering: n => "(3.24)")
   $ v = O \( P epsilon \) med upright("on ") cal(D)_17^0 \, wide partial v - b = O \( P epsilon^2 \) med
     upright("on ") cal(D)_17^(1 \/ 2) . $ <joint:second-division>]
  Both divisions, multiplication by $a^(- 1)$, and the mean adjustment preserve real symmetry and evenness.
  Because $a b = h + lambda \( t \)$ and $partial lambda = 0$, (3.21) and (3.24) imply
  $ E + partial \( a partial v \) = O \( P epsilon^2 \) quad upright("on ") cal(D)_18^1 . $
  Here application of $partial$ is bounded after the indicated strip loss:
    use $partial F = integral_(- 1 \/ 2)^(1 \/ 2) F' \( y + mu t \, t \) thin d mu$. Take $Delta U = U' v$.
    Cauchy’s estimate on the remaining domains gives the required bounds through three y-derivatives.
    Equation (3.7) gives a quadratic linearized residual, since $\( E v \)' = O \( P epsilon^2 \)$.
    The normalized integral formulas in the proof of 11 give
  $ E \( U + Delta U \) - E \( U \) - E_U \( Delta U \) = O \( P epsilon^2 \) quad upright("on ") cal(D)_20^1 \, $
  uniformly at $t = 0$ as well.
  Every cost used in this proof is a fixed number of additions, multiplications, bounded inverses, Cauchy losses,
    sums over at most $C N$ roots per mode, and Fourier sums bounded by a power of $delta^(- 1)$.
    The rational part has the fixed ledger given in 13. The two divisions add only finitely many powers of $Q$,
    and the normalized remainder adds a fixed derivative cost.
    Choosing one larger exponent $B_0$ proves (3.10)–(3.10), with all required smallness conditions included.
    No step involves a number of derivatives depending on $N$ or on the initialization order. ◻
]

=== 3.4 Initialization and convergence <initialization-and-convergence>

#thm([Lemma 3.6.])[
  (Arbitrarily accurate formal initial data).  #emph[For every fixed integer $m gt.eq 1$,
    there are real analytic periodic functions $u_1 \, dots.h \, u_m$ such that
$ U^(\( m \)) \( y \, t \) = y + sum_(j = 1)^m u_j \( y \) t^(2 j) $

 satisfies $E \( U^(\( m \)) \) = O \( t^(2 m + 2) \)$. All coefficients are holomorphic on a common fixed smaller
   y-strip. For $d_0$ sufficiently small, $U^(\( m \))$ satisfies the fixed smallness conditions with slack and
   $parallel E \( U^(\( m \)) \) parallel lt.eq C_m d_0^(2 m + 2)$ on its initial shifted domain.]
] <joint:formal-initialization>

#proof[
  The coefficient of $t^(2 j)$ involving the newly chosen $u_j$ is $u''_j \/ 4$, by (3.6);
    all other terms at that order depend only on earlier coefficients.
    Their mean is zero, because the full residual has mean zero for every candidate.
    Solve the periodic equation for $u_j$, choosing its mean to be zero.
    Integration, or division of its nonzero Fourier modes by $- n^2$,
    preserves holomorphy on every strictly smaller strip and real symmetry.
    At every fixed order the forcing uses only finitely many derivatives of holomorphic functions on the original
    open strip. We may therefore fix one smaller strip first and carry out any finite number of recursions there,
    with constants allowed to depend on $m$.
  Evenness is built into the construction. On the fixed smaller strip,
    the first three y-derivatives of $U^(\( m \)) - y$ are $O \( C_m d_0^2 \)$,
    and the residual bound follows from its first omitted power. Taking $d_0$ smaller gives all required slack. ◻
]

#proof[
  #emph[Construction of the function in 10.] Choose a fixed sufficiently small y-width $s_0$.
    The constants in 12 are now fixed. Start with 15, choosing its order below,
    and let the initial parameter radius be $d_0 < s_0 \/ 4$. At step $i$, use losses
  $ delta_i = 2^(- i) d_0 \/ 200 \, $
  and reduce both current radii by $20 delta_i$. The limiting parameter radius is at least $4 d_0 \/ 5$,
    and the limiting y-width is at least $s_0 - d_0 \/ 5$. If the current error is $epsilon_i > 0$, choose
  $ N_i = ⌈delta_i^(- 1) log \( 1 \/ epsilon_i \)⌉ . $
  If it is zero, the construction has already finished. Enlarge one fixed integer $B$ if necessary.
    Since every power of $1 + log \( 1 \/ epsilon_i \)$ is bounded by a constant times $epsilon_i^(- 1 \/ 4)$,
    the step estimates imply
  #[#set math.equation(numbering: n => "(3.25)")
   $ epsilon_(i + 1) & lt.eq C d_0^(- B) 2^(B i) epsilon_i^(7 \/ 4) \,\
parallel Delta U_i parallel_(C_y^3) & lt.eq C d_0^(- B) 2^(B i) epsilon_i^(3 \/ 4) . $ <joint:error-iteration>]
  The norms in the second line are on the next domains.
  Choose first $m$ so that $2 m + 2 > 4 B + 4$, then $d_0$ sufficiently small.
    Its initial error is at most $d_0^(4 B + 4)$. Direct substitution in (3.25) shows inductively that
  #[#set math.equation(numbering: n => "(3.26)")
   $ epsilon_i lt.eq d_0^(4 B + 4) 2^(- \( 4 B + 4 \) i) . $ <joint:error-majorant>]
  Indeed the ratio of the resulting right-hand side of (3.25) to the next bound in (3.26) is at most $C
    d_0^(2 B + 3) 2^(4 B + 4 - \( 2 B + 3 \) i)$, which is less than one for small $d_0$.
    Equation (3.25) then bounds the corrections by
  $ C d_0^(2 B + 3) 2^(- \( 2 B + 3 \) i) . $
  They are summable and preserve the fixed smallness hypotheses with slack.
    The same estimates ensure all polynomial smallness conditions needed at every step.
    This order of choices is important: the exponent $B$ is fixed before $m$,
    whereas the possibly large constant $C_m$ is absorbed by choosing $d_0$ afterward.
  The corrections converge uniformly, together with their first three y-derivatives, on the limiting domains.
    Their limit is holomorphic, real-symmetric, even, and periodic modulo $y$.
    The residual tends to zero on the limiting $cal(D)^1$, so the limit solves (3.2).
    At $t = 0$, (3.6) and $U' eq.not 0$ give $U'' = 0$. Periodicity forces $U \( y \, 0 \) = y + c_0$,
    with a real constant $c_0$. Replacing $y$ by $y - c_0$ removes this constant without changing any of the other
    properties. Finally choose a smaller product domain with enough y-margin for the two shifts.
    This gives the first assertion of 10. ◻
]

=== 3.5 The phase collar and its area form <the-phase-collar-and-its-area-form>

#proof[
  #emph[Completion of the proof of 10.] The change from $cal(S)$ to $D$ subtracted a telescoping endpoint integral
    and changed the boundary coordinate. Thus (3.2) is equivalent to
  $ cal(S)_1 \( Theta \, T_t Theta \) + cal(S)_2 \( T_(- t) Theta \, Theta \) = 0 . $
  The momentum formula in (3.3) therefore matches at successive vertices, giving the claimed billiard dynamics.
    All steps are positive and small for positive small real $t$.
  The angle $Theta$ is even. Antisymmetry of $cal(S)$ and the last stationarity equation give
  $ p \( y \, - t \) = - cal(S)_1 \( Theta \, T_(- t) Theta \) = cal(S)_2 \( T_(- t) Theta \, Theta \) =
    p \( y \, t \) . $
  Hence both oriented line coordinates are jointly analytic and even.
    Taylor expansion of the support-point formula for the momentum gives
  #[#set math.equation(numbering: n => "(3.27)")
   $ p \( y \, t \) = h \( Theta \( y \, t \) \) - 1 / 8 r \( Theta \( y \, t \) \) phi.alt' \( y \)^2 t^2 +
     O \( t^4 \) . $ <joint:collar-expansion>]
  For example, if $beta = T_t Theta - Theta$, that formula first gives $p = h \( Theta \) -
    r \( Theta \) beta^2 \/ 8 + O \( beta^3 \)$. Since $beta = phi.alt' \( y \) t + O \( t^2 \)$,
    it determines the quadratic term; evenness then removes the cubic term from the full expression.
  An even holomorphic function of $t$ is holomorphic in $t^2$.
    The derivative of $Theta$ with respect to $y$ at zero is $phi.alt' \( y \) > 0$,
    and the coefficient of $t^2$ in the inward momentum displacement in (3.27) is strictly positive.
    The analytic inverse function theorem, uniformly around the compact real period circle,
    consequently gives local collar coordinates. They are globally one-to-one modulo the period after shrinking
    the collar: for each fixed small real $t^2$, $Theta_y > 0$ determines a unique $y$ from the angle,
    and at a fixed angle the inward momentum displacement has strictly positive derivative in $t^2$.
    Thus the coordinates give a full one-sided phase collar, and the shift preserves the nondegenerate analytic
    coordinate $t^2$.
  Write the pulled-back area form as $B_0 \( y \, t \) thin d y and d t$. It is holomorphic and periodic in $y$.
    The billiard map preserves $d p and d Theta$, and in these coordinates it is $\( y \, t \)
    mapsto \( y + t \, t \)$. Therefore $B_0 \( y + t \, t \) = B_0 \( y \, t \)$.
    For every small real $t$ whose ratio to $2 pi$ is irrational,
    density of the translation orbit makes $B_0 \( thin dot.op thin \, t \)$ constant.
    Its nonzero Fourier coefficients vanish on this set of parameters and hence identically by holomorphy.
    Thus $B_0 \( y \, t \) = A \( t \)$.
  Finally, (3.27) gives the coefficient of $d y and d t$ as
  $ 1 / 4 r \( phi.alt \( y \) \) phi.alt' \( y \)^3 t + O \( t^3 \) = c / 4 t + O \( t^3 \) . $
  The coefficient is odd because the line coordinates are even. This proves (3.4) and completes the theorem. ◻
]

== 4 Endpoint determination and meromorphic continuation <sec:continuation>

The analytic parametrization constructed in 10 will now be continued in its phase variable.
  The main conclusion of this section is an alternative of a particularly rigid kind:
  at a finite first horizontal wall of meromorphy, there is no continuation patch at even one point of the wall.
  The proof combines two ingredients. A finite billiard chain is algebraically determined by derivatives of its
  endpoints, and a local branch change cannot be compatible with the even glancing parametrization.
  Both endpoint formulations will be needed: one with lines as endpoints and one with impact points as endpoints.
  Complex extensions of billiard action-angle data also enter the perturbative rigidity argument of
  #cite(label("KS2018")); the first-wall alternative and endpoint determination below are proved here.

=== 4.1 Joint geometry and horizontal widths <joint-geometry-and-horizontal-widths>

Forget the orientation of the line with coordinates $\( Theta \( y \, t \) \, p \( y \, t \) \)$,
  and denote the resulting line in the complex projective plane by $L \( y \, t \)$. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ X \( y \, t \) = L \( y - t \/ 2 \, t \) ∩ L \( y + t \/ 2 \, t \) . $ <cont:impact-definition>]

For real, sufficiently small $t eq.not 0$, this is a boundary impact.
  The reflection equations identify it with the support point whose normal angle is the mean of the two incident
  line angles. Consequently the apparent singularity in (4.1) at $t = 0$ is removable, and

$ X \( y \, 0 \) = Gamma \( y \) \, $

where $Gamma$ is the boundary parametrized by the normalized coordinate of the preceding sections.
  Both $L$ and $X$ are even in $t$, are $2 pi$-periodic in $y$, and are real-symmetric.

We treat projective maps as meromorphic data: in any fixed generic affine chart their coordinates are meromorphic
  functions. An intersection or a reflection can therefore be used wherever its defining rational expressions are
  not identically degenerate. The identities

#[#set math.equation(numbering: n => "(4.2)")
 $ X \( y \, t \) in L \( y - t \/ 2 \, t \) ∩ L \( y + t \/ 2 \, t \) \, wide "rank" thin upright(d) X lt.eq
   1 $ <cont:incidence-rank>]

and the reflection identity at the tangent $X_y$ hold initially and continue as differential-algebraic identities.
  Here and below the complex Euclidean product is bilinear, not Hermitian.
  In particular, reflection in a nonisotropic tangent is rational in that tangent and the incident line.
  All required nondegeneracies hold near the real collar and thus hold generically on any continuation under
  consideration.

Choose a basic strip ${ \| Im y \| < s_(*) }$ strictly narrower than the initial common domain.
  Then choose a parameter disk $B$ centered at zero sufficiently small compared with $s_(*)$.
  These choices are kept fixed in this section.

#prodef([Definition 4.1.])[
  For $F = L$ or $F = X$, let $h_F \( t \)$ be the supremum of the heights $b >
    s_(*)$ for which the primary branch of $F$ has a single-valued meromorphic extension to
  $ { - s_(*) < Im y < b } times V $
  for some open neighborhood $V subset B$ of $t$, agreeing with the initial branch on the basic strip.
    The neighborhood $V$ may depend on $b$. The value $+ oo$ is allowed.
] <cont:width-definition>

The functions $h_F$ are lower semicontinuous: an extension to height $b$ works on an open parameter neighborhood.
  Uniqueness on the basic strip makes the extensions agree.
  Compactness in $y$ always means compactness modulo the period $2 pi$.

#thm([Lemma 4.2.])[
  #emph[After the parameter disk has been reduced if necessary,
#[#set math.equation(numbering: n => "(4.3)")
 $ h_L \( t \) = h_X \( t \) + frac(\| Im t \|, 2) . $ <cont:width-equality>]

]
] <cont:width-relation>

#proof[
  Intersection in (4.1) gives
  $ h_X \( t \) gt.eq h_L \( t \) - frac(\| Im t \|, 2) . $
  For the opposite inequality suppose first that $Im t gt.eq 0$.
    The line through $X \( y - 3 t \/ 2 \, t \)$ and $X \( y - t \/ 2 \, t \)$ is the preceding billiard line.
    Reflecting it at the second point gives $L \( y \, t \)$.
    Both points, and the tangent at the second one, are available whenever $Im y < h_X \( t \) + Im t \/ 2$,
    at each strict subheight and on a sufficiently small parameter neighborhood.
    This rational formula agrees with the primary line in the basic strip.
    The initially wider domain supplies any lower-strip overlap needed by the shifts.
    For $Im t < 0$, use the succeeding two impacts and backward reflection instead.
    This proves the opposite inequality and hence (4.3). ◻
]

=== 4.2 A finite-type continuation lemma <a-finite-type-continuation-lemma>

In the endpoint arguments, the sampled occurrences of the support or graph function are treated as independent
  one-variable germs. Holding the endpoint data fixed gives a weighted relation among variations of these germs.
  The variations are initially formal; to compare them as the impacts coalesce,
  we need convergence and continuation to the coalescing edge. The following lemma supplies both conclusions.
  Its final hypothesis says that all sampling coordinates approach the same coordinate $a$ at that edge.

#thm([Lemma 4.3.])[
  (Continuation of a finite web relation).  #emph[Let $\( a \, delta \)$ range over a small real rectangle $I
    times \( 0 \, delta_(*) \)$. Suppose that $psi_i \, w_i$, $1 lt.eq i lt.eq m$,
    and $B$ are analytic in a neighborhood of that rectangle,
    that the $psi_i$ are real-valued on the real rectangle, that the $w_i$ are nonzero,
    and that the differentials $thin upright(d) psi_i$ have pairwise distinct directions.
    Suppose formal one-variable germs $f_i$ at one interior basepoint satisfy
#[#set math.equation(numbering: n => "(4.4)")
 $ sum_(i = 1)^m w_i \( a \, delta \) f_i \( psi_i \( a \, delta \) \) = B \( a \, delta \) . $ <cont:web-equation>]

 Then these germs converge and continue along the rectangle. If, in addition,
$ psi_i \( a \, delta \) = a + O \( delta \) \, wide partial_a psi_i \( a \, delta \) = 1 + O \( delta \) $

 analytically up to $delta = 0$, each continued one-variable germ extends to that edge near every smaller interior
   subinterval of $I$. No boundedness of the coefficients of the induced differential system at $delta =
   0$ is required.]
] <cont:web-continuation>

#proof[
  Locally choose a coordinate direction transverse to all the finitely many foliations;
    write it as the $a$-direction. Put
  $ A_i = partial_a psi_i \, quad B_i = partial_delta psi_i \, quad rho_i = B_i \/ A_i \, quad F_(i \, l) =
    f_i^(\( l \)) \( psi_i \) . $
  The $A_i$ are nonzero and the $rho_i$ are distinct. Differentiate (4.4) by $partial_a^(m - r) partial_delta^r$,
    $0 lt.eq r < m$. The terms containing $F_(i \, m)$ have coefficient matrix
  $ #scale(x: 120%, y: 120%)[\(] w_i A_i^m rho_i^r #scale(x: 120%, y: 120%)[\)]_(0 lt.eq r < m\
1 lt.eq i lt.eq m) \, $
  which is invertible by the Vandermonde determinant. All remaining terms are linear in $F_(i \, l)$, $l < m$,
    with analytic coefficients and an analytic inhomogeneous term.
    Thus each $F_(i \, m)$ is an analytic affine-linear expression in the finite vector
  $ V = \( F_(i \, l) : 1 lt.eq i lt.eq m \, med 0 lt.eq l < m \) . $
  The chain rules
  $ partial_a F_(i \, l) = A_i F_(i \, l + 1) \, wide partial_delta F_(i \, l) = B_i F_(i \, l + 1) $
  then give a full first-order system
  #[#set math.equation(numbering: n => "(4.5)")
   $ partial_a V = M_a V + c_a \, wide partial_delta V = M_delta V + c_delta . $ <cont:web-system>]
  To prove convergence, solve the first coordinate linear ODE on the base section and then the second with
    analytic dependence on the first coordinate. The Taylor series of this analytic solution is the unique formal
    solution of those two selected ODE problems. It therefore agrees with the original formal vector.
    The residual in the unused equation of (4.5) is analytic and has zero Taylor series, so it vanishes.
    The web relation and all its differential identities hold near the basepoint.
  Linear ODEs with analytic coefficients continue along finite coordinate segments in the interior.
    Solving first along a horizontal section and then along vertical segments,
    and using analytic uniqueness on overlaps, gives continuation throughout any smaller rectangle.
    The other equations of (4.5) persist by analytic continuation.
    Coordinate changes handle portions where a different transverse direction was used.
    In particular the continued $F_(i \, 0)$ still depends locally only on $psi_i$.
  For the edge assertion, shrink the interval $I$ and fix a small positive section $delta = delta_1$.
    For $psi$ in a neighborhood of the smaller interval, the equation $psi_i \( a \, delta \) =
    psi$ has a solution $a = a_i \( psi \, delta \)$ inside the rectangle for every $0 < delta lt.eq delta_1$.
    Along that path,
  $ frac(thin upright(d), thin upright(d) delta) F_(i \, 0) \( a_i \( psi \, delta \) \, delta \) = - B_i /
    A_i A_i F_(i \, 1) + B_i F_(i \, 1) = 0 . $
  Thus its value is represented by the analytic one-variable germ on the fixed positive section.
    That germ extends to $delta = 0$, regardless of any singular behavior of $M_a \, M_delta \, c_a \, c_delta$ there. ◻
]

=== 4.3 Determination from two endpoint lines <determination-from-two-endpoint-lines>

For a meromorphic field $F \( y \, t \)$, its differential field means the field generated by its affine
  coordinates and all their $y \, t$ derivatives, together with constant scalars.
  Whenever algebraicity is asserted, it is asserted coordinatewise in a generic affine chart.

#thm([Theorem 4.4.])[
  (Line-endpoint determination).  #emph[Fix an integer $k gt.eq 2$, and put $L_i = L \( y + i t \, t \)$.
    Every intermediate line $L_i$, $0 < i < k$, is algebraic over the differential field generated by $L_0 \,
    L_k$. For each fixed $k$, finitely many endpoint derivatives suffice.
    The same assertion holds for translated index intervals. All derivatives of the intermediate fields are
    algebraic over the corresponding endpoint differential field.]
] <thm:lens-lines>

#proof[
  We work first near real glancing trajectories. The proof has four parts:
    elimination of high support jets, convergence of formal variations, isolation by a coalescing limit,
    and specialization back to meromorphic functions.
  ===== 4.3.1 The critical value and its endpoint data. <the-critical-value-and-its-endpoint-data.>
  Use the initial angle $a$ and the total angular increment $delta$ as local parameters.
    This is a nonsingular change from $\( y \, t \)$: at $t = 0$,
    the two nonzero diagonal factors are $phi.alt' \( y \)$ and $k phi.alt' \( y \)$. Write
  $ alpha_0 = a \, quad alpha_k = a + delta \, wide psi_i = frac(alpha_(i - 1) + alpha_i, 2) \, quad d_i =
    frac(alpha_i - alpha_(i - 1), 2) . $
  The intermediate angles are stationary for
  #[#set math.equation(numbering: n => "(4.6)")
   $ cal(A)_(upright("line")) = "crit"_(alpha_1 \, dots.h \, alpha_(k - 1)) sum_(i = 1)^k 2 h \( psi_i \) sin
     d_i . $ <cont:line-critical-value>]
  Its derivatives with respect to the two endpoint angles are $- p_0 \, p_k$.
    Thus all its derivatives of positive order are known from endpoint jets.
    This statement uses only algebraic extensions and algebraic operations on those jets.
    Indeed, oriented unit normals and signed distances are obtained from the unoriented projective lines by square
    roots near the real branch; half-angle exponentials require only further radicals.
    Differentiating angles and changing the two derivations then involve rational expressions in these algebraic
    data and their derivatives.
  On a small rectangle $a in I$, $0 < delta < delta_(*)$, analyticity of the glancing family gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ alpha_i = a + i / k delta + O \( delta^2 \) \, wide psi_i = a + frac(i - 1 / 2, k) delta +
     O \( delta^2 \) . $ <cont:line-coalescence>]
  Consequently the gradients of the $psi_i$ have distinct directions and $partial_a psi_i eq.not 0$.
    The stationary Hessian is invertible. To see its sign and scale,
    subtract the telescoping integral $integral_a^(a + delta) h$. The leading summands become
  $ - frac(r \( a \), 24) \( alpha_i - alpha_(i - 1) \)^3 . $
  At equal steps their Hessian is negative definite on Dirichlet variations of the interior angles.
    The differentiated analytic remainders preserve invertibility for positive sufficiently small $delta$,
    uniformly on a smaller a-interval.
  ===== 4.3.2 Finite algebraic core. <finite-algebraic-core.>
  Fix a generic interior basepoint. Allow the $k$ occurrences of the support in (4.6) to be different germs $h_i$.
    The finite core consists of the interior half-angle exponentials and the jets of every $h_i$ through order
  $ m_0 = max \( 2 \, k \) $
  at its sampled angle. Impose base stationarity and equality of every positive-order critical-value derivative
    with the given endpoint data. Formal critical-point Taylor coefficients are rational functions of the support
    jets: at each order one inverts the same finite stationary Hessian and performs rational operations.
  For an order $m > m_0$, the new support jets $h_i^(\( m \))$ enter the m-th critical-value derivative tensor
    with coefficients
  #[#set math.equation(numbering: n => "(4.8)")
   $ 2 sin d_i thin \( nabla psi_i \)^(⊗ m) . $ <cont:line-high-jet>]
  Indeed a profile change beginning in order $m$ moves the formal stationary point only in order $m - 1$.
    Its critical-value correction beyond direct substitution has order at least $2 m - 2 > m$.
    The direct substitution gives (4.8). Choose tensor components with $0 \, dots.h \, k - 1$ $delta$-derivatives.
    After dividing nonzero column factors, their matrix is Vandermonde in
    $\( partial_delta psi_i \) \/ \( partial_a psi_i \)$. It is invertible.
    The gradients themselves depend only on second-order core jets, by differentiated stationarity.
    Thus every higher support jet is rationally expressible in the core and the endpoint data.
  The denominators are products of powers of a fixed finite collection of nonzero quantities:
    the stationary Hessian, the coordinate normalizations, the weights $sin d_i$,
    the chosen coordinate derivatives, and the differences of gradient ratios.
    Work in the open locus where they are nonzero. After elimination,
    the remaining requirements are polynomial equations in the finite core,
    with coefficients in the endpoint data field. Noetherianity reduces this possibly infinite list to finitely
    many equations on that open locus.
  ===== 4.3.3 Analytic continuation of a hypothetical deformation. <analytic-continuation-of-a-hypothetical-deformation.>
  Suppose the actual core were not isolated. Slicing a positive-dimensional algebraic component to a curve and
    parametrizing a branch gives a nonconstant complex analytic arc of admissible cores, with parameter $epsilon$.
    Every eliminated jet is holomorphic along this arc near zero.
    Move the sampled Taylor centers back to their original locations.
    Since the center changes are $O \( epsilon \)$, formal translation is well-defined in the two formal
    variables: each coefficient uses finitely many shift powers. The resulting support germs have the form
  #[#set math.equation(numbering: n => "(4.9)")
   $ h_i^epsilon = h + sum_(j gt.eq p) epsilon^j f_(i \, j) \, wide p > 0 \, $ <cont:line-formal-deformation>]
  with at least one nonzero $f_(i \, p)$. If all support variations vanished,
    formal implicit uniqueness for the nondegenerate stationary point would also keep the angle core fixed,
    contradicting nonconstancy of the arc. Matching all positive-order derivatives of the critical value means
    that its change is
  $ sum_(j gt.eq p) K_j epsilon^j \, $
  where each $K_j$ is constant in the endpoint parameters.
  We next show that every coefficient $f_(i \, j)$, initially formal,
    is analytic and extends to the coalescing edge. Induct on $j$. First variation at the j-th order gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ sum_(i = 1)^k 2 sin d_i thin f_(i \, j) \( psi_i \) = K_j - B_j \( a \, delta \) . $ <cont:line-variation-web>]
  The term $B_j$ depends only on lower perturbation orders and on the original stationary branch.
    By the induction hypothesis and Hessian inversion it is analytic throughout the positive rectangle.
    Apply 18 with the weights $2 sin d_i$ and the foliations $psi_i$.
    It proves convergence, continuation, and extension to $delta = 0$ near a smaller interior a-interval.
    Notice that this is coefficientwise in $j$; no assertion of convergence of the full $epsilon$-series is needed.
  ===== 4.3.4 The coalescing stationary limit. <the-coalescing-stationary-limit.>
  Fix an interior value of $a$. Put
  $ alpha_i = a + delta x_i \, wide z_i = x_i - x_(i - 1) \, wide sum_(i = 1)^k z_i = 1 \, wide epsilon =
    e delta^(2 \/ p) . $
  Subtract the unperturbed integral of $h$ and divide the action by $delta^3$.
    Coefficientwise in $e$, its stationary value tends to
  #[#set math.equation(numbering: n => "(4.11)")
   $ G \( e^p \) =
     "crit"_(sum z_i = 1) sum_(i = 1)^k (- frac(r \( a \), 24) z_i^3 + e^p f_(i \, p) \( a \) z_i) \, wide
     z_i \( 0 \) = 1 \/ k . $ <cont:line-limit-functional>]
  Here direct Taylor expansion gives the limit of the action and of its derivatives near the equal-step point.
    A perturbation of order $j > p$ carries the factor $delta^(2 j \/ p - 2)$ and therefore disappears.
    The zeroth-order scaled Hessian tends to an invertible one.
    Recursion for the formal stationary coefficients thus gives coefficientwise convergence of the stationary
    point and its value.
  The coefficient of $e^j$ contributed by the matched critical value is $K_j delta^(2 j \/ p - 3)$.
    The limit in (4.11) depends only on $x = e^p$. At $j = p$, boundedness forces $K_p = 0$; at $j = m p$,
    $m gt.eq 2$, the exponent $2 m - 3$ is positive. Therefore every positive x-coefficient of $G$ vanishes,
    and $G$ is constant.
  Write $f_i = f_(i \, p) \( a \)$ and $r = r \( a \)$ in the remainder of this paragraph.
    Differentiating the critical value gives $sum_i f_i z_i = 0$.
    If $Lambda$ is its Lagrange multiplier, stationarity and weighted summation give
  $ - r / 8 z_i^2 + x f_i = Lambda \, wide Lambda = 3 G = - frac(r, 8 k^2) . $
  Taking the roots with constant term $z_i \( 0 \) = 1 \/ k$ and summing them yields
  #[#set math.equation(numbering: n => "(4.12)")
   $ sum_(i = 1)^k sqrt(1 + frac(8 k^2, r) x f_i) = k . $ <cont:line-power-sums>]
  Every coefficient of positive degree in the square-root series is nonzero.
    Hence $sum_i f_i^m = 0$ for every $m gt.eq 1$. Newton’s identities make all elementary symmetric functions of
    the $f_i$ vanish; each $f_i$ is zero. Varying $a$ contradicts the first nonzero coefficient in (4.9).
    The actual core is therefore isolated.
  ===== 4.3.5 From isolated values to algebraic germs. <from-isolated-values-to-algebraic-germs.>
  An isolated point of a complex algebraic set defined over a field $K$ has coordinates algebraic over $K$.
    For example, pass to an algebraic closure of $K$. Its zero-dimensional components remain zero-dimensional
    after further extension of algebraically closed fields, and an isolated point must lie in such a component.
  To apply this fact to functions, do not specialize at an arbitrary point.
    Begin over a countable field containing $bb(Q) \( upright(i) \)$ and the fixed numerical constants used in the
    coordinates. Adjoin the endpoint coordinate functions, all their derivatives,
    the actual local radical branches, and also the actual core functions.
    The resulting function field is countable. Choose the real basepoint outside the poles and the zero sets of
    every nonzero member of this field. This is possible: a nonzero analytic function cannot vanish on an open
    real rectangle, and the excluded countable union has measure zero. Evaluation is then injective on the field.
  The algebraic equations used above are defined over the evaluated endpoint field,
    with its stated algebraic extensions. Isolation makes the evaluated core algebraic over that field.
    Lift the coefficients of such a polynomial relation back to functions.
    Injectivity of evaluation, also after adjoining the actual core,
    makes the lifted polynomial identity hold as a germ. The contact momentum formulas recover the offsets of the
    intermediate lines from the core. Eliminating the endpoint radical extensions proves the asserted algebraicity
    over the original unoriented endpoint differential field.
    Only finitely many endpoint derivatives occur in the resulting polynomial.
    These identities persist under continuation.
  Finally, in characteristic zero an algebraic element is separable.
    Differentiating its minimal polynomial expresses each derivative algebraically over the differential field.
    This proves the assertion about jets, and translation of $\( y \, t \)$ proves the assertion for other index
    intervals. ◻
]

=== 4.4 Determination from two endpoint impacts <determination-from-two-endpoint-impacts>

The impact formulation needs one additional scalar datum: the area coefficient from (3.4).
  It supplies the mixed derivatives of the critical length, which the two endpoint positions alone do not directly give.

#thm([Theorem 4.5.])[
  (Point-endpoint determination).  #emph[Let $k gt.eq 2$, and put $P_i = X \( y + i t \, t \)$, $0 lt.eq i lt.eq
    k$. Every intermediate point and every edge of this chain is algebraic over the differential field generated
    by $P_0 \, P_k$ and the analytic coefficient $A \( t \)$ in
$ thin upright(d) p and thin upright(d) Theta = A \( t \) thin thin upright(d) y and thin upright(d) t . $

 For each fixed $k$, finitely many jets suffice. The assertion persists under translation and analytic continuation.]
] <thm:lens-points>

#proof[
  ===== 4.4.1 The length functional and its mixed derivatives. <the-length-functional-and-its-mixed-derivatives.>
  Near a real glancing configuration choose orthogonal coordinates in which the boundary is $Y = F \( x \)$,
    with $F'' eq.not 0$, and orient the arc so that $x$ increases along the chain. Use the endpoint abscissas
  $ a = x \( P_0 \) \, wide b = x \( P_k \) = a + delta $
  as parameters. This change of coordinates is nonsingular near glancing. Write $x_i = x \( P_i \)$.
    On a small rectangle $a in I$, $0 < delta < delta_(*)$,
  #[#set math.equation(numbering: n => "(4.13)")
   $ x_i = a + i / k delta + O \( delta^2 \) . $ <cont:point-coalescence>]
  Allow the interior occurrences of the graph to be independent functions $F_i$, while keeping $F_0 = F_k =
    F$ fixed. Consider the critical value
  #[#set math.equation(numbering: n => "(4.14)")
   $ cal(A)_(upright("point")) \( a \, b \) = "crit"_(x_1 \, dots.h \, x_(k - 1)) sum_(i = 1)^k
     sqrt(\( x_i - x_(i - 1) \)^2 + \( F_i \( x_i \) - F_(i - 1) \( x_(i - 1) \) \)^2) . $ <cont:point-critical-value>]
  The roots are the positive real lengths at the original configuration and are continued with that choice.
  The endpoint graph jets are determined by the point jets, since $x$ is a regular coordinate.
    All mixed derivatives of $cal(A)_(upright("point"))$ are determined as well.
    Indeed, if $e_(theta_0)$ is the first unit chord velocity, endpoint differentiation gives
  $ \( cal(A)_(upright("point")) \)_a = - P_(0 \, a) dot.op e_(theta_0) . $
  The endpoint momentum identity then gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ \( cal(A)_(upright("point")) \)_(a b) thin thin upright(d) a and thin upright(d) b = thin upright(d) p_0 and
     thin upright(d) theta_0 = A \( t \) thin thin upright(d) y and thin upright(d) t . $ <cont:point-mixed-area>]
  The first edge is $L \( y + t \/ 2 \, t \)$. Its half-shift in $y$ preserves $thin upright(d) y and
    thin upright(d) t$, so the area coefficient is exactly the same $A \( t \)$.
    Equation (4.15), the Jacobian of the endpoint coordinate change,
    and differentiation recover every derivative having at least one $a$- and one $b$-derivative.
  ===== 4.4.2 Elimination of higher graph jets. <elimination-of-higher-graph-jets.>
  At the original configuration subtract the telescoping graph arc lengths between successive endpoints.
    Taylor expansion of chord length minus arc length gives the leading summands
  #[#set math.equation(numbering: n => "(4.16)")
   $ - frac(F'' \( a \)^2, 24 \( 1 + F' \( a \)^2 \)^(3 \/ 2)) \( x_i - x_(i - 1) \)^3 . $ <cont:chord-arc-expansion>]
  For completeness, if $v = F' \( a \)$, $r = F'' \( a \)$, and $g = 1 + v^2$,
    the cubic coefficient of a chord over an interval of length $s$,
    after subtraction of the integral of $sqrt(1 + F' ""^2)$, is $- r^2 \/ \( 24 g^(3 \/ 2) \)$.
    This follows by expanding the square root of $s^2 + \( v s + r s^2 \/ 2 + F''' \( a \) s^3 \/ 6 \)^2$ through
    degree three; the $F''' \( a \)$-terms cancel against the arc integral.
    At equal positive steps the Hessian of the sum in (4.16), on interior variations with fixed endpoints,
    is negative definite. Thus the stationary Hessian is invertible for small positive $delta$.
  Take as finite core the $x_i$, the jets of $F_i$ through order $m_0 = max \( 2 \, k \)$, $0 < i < k$,
    and the nonzero length roots. Impose base stationarity, the algebraic equations for the roots,
    and equality of every mixed critical-value derivative with the given endpoint data,
    including the low-order derivatives. In order $m > m_0$, the new graph jets enter the critical-value
    derivative tensor through
  #[#set math.equation(numbering: n => "(4.17)")
   $ w_i thin \( thin upright(d) x_i \)^(⊗ m) \, wide 0 < i < k \, $ <cont:point-high-jet>]
  where $w_i$ is the vertical component of the incoming unit velocity minus the outgoing unit velocity.
    The same stationary-value differentiation as in (4.8) proves this formula:
    movement of the critical point contributes only in orders greater than $m$.
    The weights are nonzero because the tangent of our graph is nonvertical and the real incidence is nonzero.
  Only mixed tensor components are known here, but they suffice. In $\( a \, b \)$-coordinates,
  $ x_(i \, a) = 1 - i \/ k + O \( delta \) \, wide x_(i \, b) = i \/ k + O \( delta \) . $
  Both derivatives are nonzero and their ratios are distinct.
    Use the components with $1 \, dots.h \, k - 1$ derivatives in $b$ and the remaining derivatives in $a$.
    Since $m > k$, all are mixed components. Their coefficient matrix is an invertible Vandermonde matrix after
    nonzero column factors have been removed. Hence each higher graph jet is a rational function of the finite
    core and the given mixed value derivatives. The gradients of the $x_i$ are obtained by inverting the
    second-order stationary Hessian, so they too are already rational in this data.
  Restrict to the finite open locus where the length roots, Hessian, weights,
    coordinate derivatives and Vandermonde differences are nonzero.
    All denominators in the recursive computation are products of these fixed quantities.
    Elimination and Noetherianity leave an algebraic set of possible cores defined by finitely many equations on
    this open locus. We prove that the actual core is isolated.
  ===== 4.4.3 Continuation of the variation coefficients. <continuation-of-the-variation-coefficients.>
  A nonisolated core would admit a nonconstant analytic arc.
    Translate the moving Taylor centers as in the line proof. The resulting formal graph variations have the form
  #[#set math.equation(numbering: n => "(4.18)")
   $ F_i^epsilon = F + sum_(j gt.eq p) epsilon^j f_(i \, j) \, wide f_(0 \, j) = f_(k \, j) = 0 \,
     $ <cont:point-formal-deformation>]
  with at least one nonzero first coefficient $f_(i \, p)$.
    Equality of all mixed value derivatives says precisely that the positive-order change of critical value is
  $ sum_(j gt.eq p) epsilon^j #scale(x: 120%, y: 120%)[\(] U_j \( a \) + V_j \( b \) #scale(x: 120%, y: 120%)[\)] \, $
  initially as a formal identity. At order $j$, first variation yields
  #[#set math.equation(numbering: n => "(4.19)")
   $ sum_(i = 1)^(k - 1) w_i f_(i \, j) \( x_i \) - U_j \( a \) - V_j \( b \) = B_j \( a \, b \) \,
     $ <cont:point-variation-web>]
  where the right side is determined by lower orders. There are $k + 1$ one-variable unknowns in this web.
    The foliations $x_1 \, dots.h \, x_(k - 1) \, a \, b$ have pairwise distinct gradient directions by (4.13);
    their weights $w_i \, - 1 \, - 1$ are nonzero. A generic coordinate direction is transverse to all of them,
    so the full Vandermonde argument of 18 applies. Induction on $j$ proves that all $f_(i \, j) \, U_j \,
    V_j$ are analytic on the positive rectangle and extend to the coalescing edge near an interior $a$-interval.
    For the edge assertion use $\( a \, delta \)$: all the foliation coordinates, including $b = a + delta$,
    are $a + O \( delta \)$ and have $a$-derivative $1 + O \( delta \)$.
    No bound on the web system at that edge is needed.
  ===== 4.4.4 The scaled critical length. <the-scaled-critical-length.>
  Fix an interior $a$, and abbreviate
  $ r = F'' \( a \) \, quad g = 1 + F' \( a \)^2 \, quad f_i = f_(i \, p) \( a \) \, quad x_i = a + delta u_i \,
    quad z_i = u_i - u_(i - 1) \, quad x = e^p . $
  Thus $f_0 = f_k = 0$, $sum_i z_i = 1$, and $r eq.not 0$. Subtract the unperturbed graph arc from the length,
    multiply by $g^(3 \/ 2) \/ delta^3$, and substitute $epsilon = e delta^(2 \/ p)$.
    The coefficientwise stationary limit is
  #[#set math.equation(numbering: n => "(4.20)")
   $ G \( x \) =
     "crit"_(sum z_i = 1) sum_(i = 1)^k
     [- frac(r^2 z_i^3, 24) - frac(r x \( f_i + f_(i - 1) \) z_i, 2) + frac(x^2 \( f_i - f_(i - 1) \)^2, 2
     z_i)] \, quad z_i \( 0 \) = 1 \/ k . $ <cont:point-limit-functional>]
  Here are the individual terms in this limit. The cubic term is (4.16).
    The constant vertical first-variation coefficient of an edge is $F' \( a \) \/ sqrt(g)$.
    Summed against the graph offsets it telescopes to zero because the endpoints are fixed. The next coefficient is
  $ frac(r delta \( u_i + u_(i - 1) \), 2 g^(3 \/ 2)) . $
  Summation by parts gives
  $ sum_i \( u_i + u_(i - 1) \) \( f_i - f_(i - 1) \) = - sum_i \( f_i + f_(i - 1) \) z_i \, $
  which produces the displayed linear term. The second vertical derivative of ordinary edge length gives the
    inverse-$z_i$ quadratic term. Higher powers of the vertical perturbation vanish in the limit.
    Terms of perturbation order $j > p$ have, after the constant telescoping part has canceled,
    a factor $delta^(2 j \/ p - 2)$ in their linear contribution and vanish as well.
    These expansions hold with derivatives in the stationary variables near $z_i = 1 \/ k$.
    The limiting Hessian at $x = 0$ is invertible, so formal stationary recursion justifies the stated
    coefficientwise limit.
  For each multiple $j = m p gt.eq 2 p$, the separated matched value contributes
  $ g^(3 \/ 2) delta^(2 j \/ p - 3) #scale(x: 120%, y: 120%)[\(] U_j \( a \) +
    V_j \( a + delta \) #scale(x: 120%, y: 120%)[\)] \, $
  which tends to zero. The limit depends only on $x = e^p$. It follows that
  #[#set math.equation(numbering: n => "(4.21)")
   $ G \( x \) = G_0 + g_1 x \, wide G_0 = - frac(r^2, 24 k^2) . $ <cont:point-affine-limit>]
  Let $lambda$ be the stationary multiplier. Differentiating the functional in (4.20) gives
  $ lambda = - frac(r^2 z_i^2, 8) - frac(r x \( f_i + f_(i - 1) \), 2) - frac(x^2 \( f_i - f_(i - 1) \)^2, 2 z_i^2) . $
  Multiply by $z_i$, sum, and compare with the derivative of the critical value in $x$.
    The weighted homogeneity of its three terms gives
  $ lambda = 3 G - 2 x G' = 3 G_0 + g_1 x . $
  Consequently
  #[#set math.equation(numbering: n => "(4.22)")
   $ (frac(r z_i, 2) + frac(x \( f_i - f_(i - 1) \), z_i))^2 & = - 6 G_0 - 2 x \( g_1 + r f_(i - 1) \) \,\
(frac(r z_i, 2) - frac(x \( f_i - f_(i - 1) \), z_i))^2 & = - 6 G_0 -
  2 x \( g_1 + r f_i \) . $ <cont:point-root-identities>]
  Take each square root with constant term $r \/ \( 2 k \)$.
    Adding both roots for each edge and then all edges gives $r sum_i z_i = r$. Equivalently,
  #[#set math.equation(numbering: n => "(4.23)")
   $ sqrt(1 - beta x g_1) + 2 sum_(i = 1)^(k - 1) sqrt(1 - beta x \( g_1 + r f_i \)) + sqrt(1 - beta x g_1) =
     2 k \, wide beta = frac(8 k^2, r^2) . $ <cont:point-power-sums>]
  Every positive power sum of the multiset
  $ g_1 + r f_0 \, quad g_1 + r f_1 \, g_1 + r f_1 \, quad dots.h \, quad g_1 + r f_(k - 1) \, g_1 +
    r f_(k - 1) \, quad g_1 + r f_k $
  therefore vanishes. Newton’s identities make every member zero.
    The fixed endpoints give $g_1 = 0$, and then $f_i = 0$ for every $i$.
    Varying $a$ contradicts the first nonzero term of (4.18). The core is isolated.
  ===== 4.4.5 Return to the endpoint function field. <return-to-the-endpoint-function-field.>
  Use a countable field containing the endpoint functions, their derivatives, the derivatives of $A \( t \)$,
    the actual length roots, and the actual core. Choose the real basepoint outside the zeros and poles of all its
    nonzero members. Evaluation is injective there. Isolation over the evaluated endpoint field gives polynomial
    algebraicity of the core values, and injectivity lifts those polynomial identities to germs,
    exactly as in the last part of 19. Eliminating the finitely many radical extensions leaves the original
    endpoint differential field. The intermediate graph values give all points;
    joining consecutive points gives every edge by rational projective operations.
    Differentiation of separable polynomials gives the assertion for jets.
    This completes the point-endpoint determination. ◻
]

=== 4.5 Product continuation and comparison of widths <product-continuation-and-comparison-of-widths>

Endpoint determination supplies polynomial equations, but leaves open which branches continue from the primary
  collar. A hypothetical meromorphic patch in both variables will give such equations across a whole horizontal
  row for generic nearby irrational real parameters. The monodromy argument below will turn those equations into a
  uniform width improvement at those parameters. To transfer that improvement back to the original parameter,
  we shall use superharmonic comparison for $h_L$ and $h_X$.
  We prove that comparison next, starting with the product-continuation principle also used later for families of
  analytic disks.

#thm([Lemma 4.6.])[
  (Product continuation).  #emph[Let $D_w$ be a connected plane disk and $0 < rho < R$.
    Suppose that $F \( w \, zeta \)$ is meromorphic on
$ D_w times { rho < \| zeta \| < R } . $

 If it extends meromorphically to $D_0 times { \| zeta \| < R }$ for some nonempty open subdisk $D_0 subset D_w$,
   then it extends meromorphically to the whole product $D_w times { \| zeta \| < R }$.
   There is also a holomorphic version: if the original data and the initial extension are holomorphic,
   the resulting extension is holomorphic.]
] <lem:meromorphic-hartogs>

#proof[
  Fix $w_0 in D_w$. There is an intermediate circle $\| zeta \| = r$, $rho < r < R$,
    on a neighborhood of which $\( w - w_0 \)^m F$ is jointly holomorphic for some integer $m gt.eq 0$.
    To see this, write local meromorphic quotients on a compact subannulus at $w = w_0$.
    Remove from their denominators the powers of $w - w_0$ that divide them identically along that slice.
    The remaining denominator zeros on the slice are locally isolated in $zeta$.
    A circle avoiding these zeros exists, and a finite cover of that circle gives one common power $m$.
  On a sufficiently small disk $D'$ about $w_0$, let $c_(- j) \( w \)$, $j gt.eq 1$,
    be the negative Laurent coefficients of $\( w - w_0 \)^m F$ on this circle. They are holomorphic in $w$.
    Suppose that $D'$ meets an open set of parameters already reached by meromorphic extension to the full
    $zeta$-disk. For generic parameters in that open set, the slice has finitely many poles inside the circle.
    Multiplication by a polynomial in $zeta$ removes them. Equivalently, the Hankel matrix
  $ #scale(x: 120%, y: 120%)[\(] c_(- \( i + j + 1 \)) \( w \) #scale(x: 120%, y: 120%)[\)]_(i \, j gt.eq 0) $
  has finite rank there.
  The rank bound can be made independent of $w$. For each fixed integer $r_0$,
    the condition that all minors of size $r_0 + 1$ vanish is an analytic condition on $D'$.
    Unless it holds identically, its solution set is contained in the discrete zero set of one nonzero minor and
    is therefore countable. A countable union of such sets cannot contain the open set of generic extended slices.
    Hence all minors of one fixed size vanish identically on $D'$.
  Over the field of meromorphic functions on $D'$, finite Hankel rank gives a finite recurrence for the negative
    coefficients. Here is the elementary reason. A dependence among the first finitely many columns with nonzero
    last coefficient expresses that last column in terms of its predecessors.
    Shifting the row index gives the same dependence for all later columns.
    Thus, for a nonzero polynomial $Q \( w \, zeta \)$ with meromorphic coefficients in $w$,
    every negative Laurent coefficient of $Q \( w \, zeta \) \( w - w_0 \)^m F$ vanishes.
    Clear the finitely many coefficient denominators locally.
    The remaining Laurent series has a holomorphic extension inside the circle,
    given by its Cauchy integral on that circle. Dividing back by the polynomial and by the cleared factors gives
    the desired meromorphic extension on a neighborhood of $w_0$ times the disk.
  The set of reached parameters is therefore open and relatively closed in $D_w$:
    at a limit point the preceding local argument uses any overlapping reached open set.
    It is nonempty and hence is all of $D_w$. The extensions glue by uniqueness on their annular overlaps,
    and the original annulus completes them to radius $R$.
  In the holomorphic case every negative Laurent coefficient itself vanishes on $D_0$.
    The identity theorem makes it vanish on $D_w$; the same Cauchy integral gives a holomorphic extension without
    a polynomial denominator. ◻
]

#thm([Corollary 4.7.])[
  (Continuation along a family of disks).  #emph[Suppose a continuous path in one complex center variable has a
    neighborhood on which a family of analytic disks is holomorphic in the center and disk variables.
    Assume that the pulled-back primary data are jointly meromorphic on a common boundary collar of these disks,
    that these collar germs agree on overlaps, and that a nonempty open set of starting centers has a full-disk
    extension. The extensions then propagate along the center path. The same statement holds holomorphically.
    In that case a uniform boundary modulus bound, or a uniform bound on the real or imaginary part of a scalar
    holomorphic component, is preserved inside each disk.]
] <cont:disc-sweep>

#proof[
  Cover the compact part of the center path under consideration by finitely many coordinate disks.
    On each one the pulled-back data satisfy 21; the full disks already reached give the nonempty open seed for
    the next one. Uniqueness on the boundary collars gives agreement.
    In the holomorphic case, additional holomorphic parameters can be retained:
    the same Laurent coefficients and Cauchy integrals are holomorphic in them,
    and the identity theorem applies on their common neighborhoods.
    In the holomorphic case the final assertions are the maximum principle and its harmonic real-part version. ◻
]

#thm([Proposition 4.8.])[
  #emph[Both $h_L$ and $h_X$ satisfy superharmonic comparison on $B$.
    They are positive lower semicontinuous superharmonic functions, with the identically infinite case admitted.]
] <prop:width-superharmonic>

#proof[
  Let $t_0 + r overline(bb(D)) subset B$. Choose a nonnegative trigonometric polynomial $q$ satisfying
  $ q \( zeta \) < h_F \( t_0 + r zeta \) \, wide \| zeta \| = 1 \, $
  and let $g$ be a holomorphic polynomial whose boundary imaginary part is $q$. Thus
  $ Im g \( 0 \) = frac(1, 2 pi) integral_0^(2 pi) q \( e^(upright(i) theta) \) thin thin upright(d) theta . $
  For real $x_0$, $0 lt.eq lambda lt.eq 1$, and a small complex variable $w$, consider
  #[#set math.equation(numbering: n => "(4.24)")
   $ t = t_0 + r zeta \, wide y = x_0 + lambda g \( zeta \) + w . $ <cont:width-disks>]
  On $\| zeta \| = 1$, these points lie strictly below the appropriate width.
    Lower semicontinuity and compactness in $\( x_0 med mod med 2 pi \, lambda \, zeta \)$ provide a common
    annular neighborhood in $zeta$ and a common disk $\| w \| <
    d_w$ on which the pulled-back functions are jointly meromorphic.
  At $lambda = 0$, the whole disks are in the initial basic strip.
    Increase $lambda$ in fixed sufficiently small increments satisfying
  $ sup_(\| zeta \| lt.eq 1 + d_zeta) \| \( lambda_(upright("new")) - lambda_(upright("old")) \) g \( zeta \) \| <
    d_w \/ 2 . $
  The full-disk data at the old value provide a full-disk extension at the new value for $\| w \| < d_w \/ 2$.
    Product continuation fills the original $w$-disk. Repeat finitely many times.
  For each $lambda$, uniqueness on the annulus glues the extensions as $x_0$ varies.
    Adjacent values of $lambda$ also glue, because their overlapping strips contain the full-disk seeds just
    described. At $zeta = 0$ these are strips with ordered centers $Im y = lambda Im g \( 0 \)$.
    Consequently the continued branch is attached to the basic strip throughout the ascent and reaches slightly
    above height $Im g \( 0 \)$ at $t_0$. We obtain
  $ h_F \( t_0 \) gt.eq frac(1, 2 pi) integral_0^(2 pi) q \( e^(upright(i) theta) \) thin thin upright(d) theta . $
  Approximate the positive lower semicontinuous boundary function from below by continuous functions and then,
    with a strict margin, by trigonometric polynomials. This gives the supermean inequality,
    including infinite integrals. Together with lower semicontinuity it gives the asserted superharmonic comparison. ◻
]

=== 4.6 No patch at a first wall <no-patch-at-a-first-wall>

A joint patch means a meromorphic continuation on a neighborhood in both $y$ and $t$,
  agreeing as joint germs with the primary branch below the wall.

#thm([Theorem 4.9.])[
  (No-patch property).  #emph[Let $F = L$ or $F = X$, and let $t_0 in B ∩ bb(R)$.
    If $h_F \( t_0 \) = H_1 < oo$, no joint meromorphic patch of the primary branch passes through any point of
    $Im y = H_1$. The corresponding assertion at the lower wall follows by real symmetry.]
] <thm:no-patch>

#proof[
  We first prove the assertion for $L$. Suppose a patch exists.
    Choose a horizontal arc and a vertical band about $H_1$ on which joint data are known for all $t$ in a
    neighborhood of $t_0$. The patch agrees across the bottom of the band with the lower primary tube.
    Fix a narrower concentric band and $eta > 0$ such that $H_1 + eta$ lies strictly inside it.
    These choices are independent of the nearby irrational real shifts used below.
    Shrink the parameter neighborhood so that a common strip below $H_1$,
    reaching the bottom of the narrower band, is available jointly.
  ===== 4.6.1 Endpoint equations across the full band. <endpoint-equations-across-the-full-band.>
  Fix a nearby real $t_1$ with $t_1 \/ \( 2 pi \) in.not bb(Q)$.
    Forward and backward translates of any real phase meet the good arc.
    On a small phase box choose integers $m < 0 < n$ so that both $L \( y + m t \, t \)$ and
    $L \( y + n t \, t \)$ are supplied by the patch throughout the narrower vertical band.
    Compactness modulo $2 pi$ gives finitely many boxes covering the whole band.
    Only finitely many shifts occur, so these assertions hold for $t$ in a complex neighborhood of $t_1$,
    possibly depending on $t_1$. Shrink this neighborhood to retain a common bottom strip on which every shifted
    field is the primary one.
  Apply 19 on that bottom strip in each box. It gives nonzero polynomial equations for the coordinates of
    $L \( y \, t \)$, with coefficients meromorphic across the full band.
    Use squarefree equations with nonzero leading coefficients and discriminants. These remain nonzero as germs:
    their coefficients are continued actual endpoint jets, so a nonzero identity cannot become identically zero
    during continuation. The primary branch below any first wall in the band satisfies the equations,
    by vertical continuation from the bottom strip.
  ===== 4.6.2 A first obstruction has nontrivial monodromy. <a-first-obstruction-has-nontrivial-monodromy.>
  The exceptional sets are the coefficient poles and the zeros of the leading coefficients and discriminants.
    They are locally analytic curves. Outside countably many parameter values,
    a slice meets their reduced union at isolated points where it is a smooth graph over $t$.
    Indeed, use a countable cover by analytic boxes. Vertical components give countably many constant parameter
    values; on nonvertical components, singularities and critical points of projection are discrete.
    Intersections of distinct components are also discrete. Exclude all their parameter images.
    Relatively compact boxes leave only finitely many exceptional points in a periodic row.
  Choose a real irrational $t_2$ outside those exceptions. Suppose $h_L \( t_2 \) lt.eq H_1 + eta$,
    so its first wall is strictly inside the band. Away from exceptional points,
    following simple roots gives joint passage through the wall.
    Near an exceptional point the only exceptional curve is $y = z \( t \)$.
    Off it the roots have finite continuation on a punctured disk times a disk,
    whose fundamental group is generated by a small $y$-loop about $z \( t_2 \)$.
    If the actual branch has trivial monodromy on that loop, it is single-valued on the product.
    After denominators are cleared, the leading coefficient is a unit times a power of $y - z \( t \)$.
    A polynomial root bound therefore gives
  $ \| L_(upright("coord")) \( y \, t \) \| lt.eq C \| y - z \( t \) \|^(- N) $
  for a finite $N$. Multiplication by that power and removal of a bounded singularity gives joint meromorphy.
    If every wall point had trivial monodromy, these extensions would glue on overlaps just below the wall.
    A finite cover of the periodic wall would then continue the tube to a strictly greater height on a parameter
    neighborhood, contrary to the definition of $h_L \( t_2 \)$. Some small loop must act nontrivially.
  ===== 4.6.3 A defect affects only finitely many shifted indices. <a-defect-affects-only-finitely-many-shifted-indices.>
  Put $L_j = L \( y + j t \, t \)$. At a fixed point of the row,
    a small loop can change $L_j$ only if translation by $j t_2$ aligns its center with an exceptional point.
    There are finitely many such points modulo period and $j mapsto j t_2 med \( mod med 2 pi \)$ is injective.
    Only finitely many indices can be aligned. Precisely, for each prescribed finite set of indices one can choose
    the loop sufficiently small to fix all its unaligned members.
    No single loop fixing an infinite collection is asserted.
  First choose the loop sufficiently small for the whole finite set of aligned indices.
    Further shrinking preserves its monodromy on those fields.
    Among the aligned indices with nontrivial monodromy, take the smallest and translate the center along the
    orbit so that this index is $1$. Choose $K$ so that every aligned index now has absolute value at most $K$.
    Choose $b > K$, $b gt.eq 2$, and any further finite collection of far indices,
    including both signs when needed below. Shrink the loop to fix the unaligned members of that collection and
    the unaligned members of ${ - 1 \, 0 }$. Its action on aligned fields is unchanged, so $L_(- 1) \,
    L_0$ return unchanged. It produces
  #[#set math.equation(numbering: n => "(4.25)")
   $ M_1 eq.not L_1 $ <cont:alternate-line>]
  while fixing $L_(- 1) \, L_0 \, L_b$ and all selected far fields.
  ===== 4.6.4 Descent to glancing. <descent-to-glancing.>
  Below the wall at the real parameter $t_2$, all selected primary fields are single-valued jointly near every
    strict subheight. Descend there and then move along real phase and parameter to the original collar.
    A connected open region around this connection carries all selected primary data meromorphically,
    so the outward path is available. The small loop avoids every shifted exceptional point relevant to the finite
    selection.
  On return $M_1$ is algebraic over $L_0 \, L_b$ and their jets, by transporting 19 around the loop.
    In the connected lower region these endpoints are back on their single-valued primary branches.
    Continue the alternative root down along paths avoiding the proper analytic exceptional sets of its squarefree
    equation. Complex detours, including an initial move off such a set within the starting germ, are allowed.
    They do not change the selected primary data.
  Near a generic point $\( y_0 \, 0 \)$, only $t = 0$ can be an exceptional divisor for that polynomial.
    Other analytic curves meet this divisor discretely unless they contain it.
    On a sufficiently small bidisk, a power cover $t = tau^d$ kills the finite monodromy.
    The polynomial root bound makes the root meromorphic in $\( y \, tau \)$.
    Thus $M_1$ has a joint meromorphic Puiseux germ at glancing.
    Its inequality from $L_1$ persists, since the primary $L_1$ is single-valued in the lower region.
  ===== 4.6.5 The alternate germ is even. <the-alternate-germ-is-even.>
  Put $Z = L_0 ∩ M_1$. Continued incidence, rank and reflection identities show that $Z$ has rank at most one and
    that reflection in its tangent relates the two lines. It differs as a germ from the unchanged preceding
    intersection $L_(- 1) ∩ L_0$: continuing back to the original real table would otherwise identify the
    preceding and following intersections.
  On the Puiseux cover there is a projective limit
  $ Z^0 \( y \) = lim_(tau arrow.r 0) Z \( y \, tau^d \) \, $
  holomorphic at generic $y$. It is nonconstant, because it lies on $L \( y \, 0 \)$ and the tangents of the
    original strictly convex arc have no common projective point.
    At a regular point of $Z^0$, rank one implies that the nearby image of $Z$ lies on the same fixed analytic arc
    traced by $Z^0$. This arc cannot lie at infinity or have identically isotropic tangent:
    in either case it would be a fixed projective line, and continuation would force the original real table arc
    into that line. Indeed, the line equation would hold on this rank-one impact branch and continue back along
    the reverse path to the original impact $L_0 ∩ L_1$, contradicting strict convexity.
  If $L \( y \, 0 \)$ were generically tangent to the fixed arc at $Z^0 \( y \)$,
    differentiated incidence and tangency would identify $Z^0$ with the envelope of those lines,
    namely $Gamma \( y \)$. The fixed arc would be the primary boundary germ.
    Near its simple quadratic tangency, $L_0 \( y \, t \)$ has exactly the two primary nearby intersections with
    that germ, distinct for generic small $t eq.not 0$. The preceding intersection has been excluded;
    reflection at the following one gives $L_1$, contrary to (4.25).
  The fixed arc is therefore transverse to $L \( y \, 0 \)$ at a generic point.
    Intersect it with the even line $L_0 \( y \, t \)$ by the ordinary holomorphic implicit function theorem,
    then reflect in its nonisotropic tangent. Both operations are holomorphic and uniquely determined near that
    point. They produce $M_1$, and prove
  #[#set math.equation(numbering: n => "(4.26)")
   $ M_1 \( y \, - t \) = M_1 \( y \, t \) quad upright("as an ordinary holomorphic germ at ") t =
     0 . $ <cont:alternate-even>]
  ===== 4.6.6 A continuation operation reflecting indices. <a-continuation-operation-reflecting-indices.>
  The incoming leg can now end at a regular $\( y_0 \, 0 \)$ itself;
    take the outgoing primary leg from the same point. The resulting closed continuation path is denoted $A$.
    Let $I$ denote pullback by $t mapsto - t$. Perform, in order,
  #[#set math.equation(numbering: n => "(4.27)")
   $ A \, wide I \, wide A^(- 1) \, wide I . $ <cont:monodromy-operation>]
  The distinguished field follows the succession
  $ L_1 mapsto M_1 mapsto M_1 mapsto L_1 mapsto L_(- 1) . $
  This operation fixes $L_0$ and every selected far field, including its jets,
    provided both signs of each far index were selected. Indeed,
    evenness of $L$ makes the middle pullback send $L_j$ to $L_(- j)$;
    the reversed path fixes that selected primary germ, and the last pullback restores $L_j$.
    The total base pullback is the identity, so the derivative chain rules cancel. The operation is depicted in 2.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 1.45cm, height: 0.85cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$L_1$]])])
  content((2.45, 0), [#box(width: 1.45cm, height: 0.85cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$M_1$]])])
  content((4.9, 0), [#box(width: 1.45cm, height: 0.85cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$M_1$]])])
  content((7.35, 0), [#box(width: 1.45cm, height: 0.85cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$L_1$]])])
  content((9.8, 0), [#box(width: 1.45cm, height: 0.85cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$L_(-1)$]])])
  line((0.725, 0), (1.725, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.225, 0), [#text(size: 9pt)[$A$]], anchor: "south", padding: 0.1176cm)
  line((3.175, 0), (4.175, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.675, 0), [#text(size: 9pt)[$I$]], anchor: "south", padding: 0.1176cm)
  line((5.625, 0), (6.625, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.125, 0), [#text(size: 9pt)[$A^(-1)$]], anchor: "south", padding: 0.1176cm)
  line((8.075, 0), (9.075, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.575, 0), [#text(size: 9pt)[$I$]], anchor: "south", padding: 0.1176cm)
  content((4.9, -1.446), [#text(size: 9pt)[$I:t arrow.r.bar -t$, $M_1(y,-t)=M_1(y,t)$#linebreak() $L_0$ and the chosen finite collection of far endpoint jets return unchanged.]])
})],
    caption: [Figure 2: The continuation operation in the no-patch argument. The alternate transverse branch is even at glancing. For each prescribed finite set of far indices, the path $A$ is chosen to fix both signs of those indices. The operation produces another root of the same endpoint polynomial; it requires no common path for infinitely many indices. ],
  ) <fig:monodromy>
  Paths and generic basepoints can be chosen anew for each finite selection.
    The identities before and after are identities of actual primary germs near real glancing,
    and hence transport between those basepoints.
  Apply (4.27) to algebraicity of $L_1$ over the jets of $L_0 \, L_b$.
    It proves algebraicity of $L_(- 1)$ over the same jets. Translate this assertion.
    From the endpoints of any interval $\[ B \, B + b \]$, the line immediately to its left is now algebraic,
    as are all interior lines by 19. Differentiation preserves algebraicity over a characteristic-zero
    differential field. Shift the interval one place left and repeat;
    transitivity proves algebraicity of every line to the left over the original endpoint jets.
  Choose $B > K + 2$. There is one fixed nonzero polynomial over jets of $L_B \,
    L_(B + b)$ for a generic direction coordinate of $L_1$. For each $n gt.eq 0$,
    first shear an identity by $\( y \, t \) mapsto \( y + 2 n t \, t \)$,
    apply (4.27) with far indices including $plus.minus \( B + 2 n \) \, plus.minus \( B + b + 2 n \)$,
    and shear back. It sends
  $ L_(1 - 2 n) mapsto L_(- 1 - 2 n) $
  and fixes the original coefficient jets: the shear sends $L_(1 - 2 n)$ to $L_1$ and the coefficient fields to
    the selected far indices, while the inverse shear returns those fields exactly.
    For $S_q F \( y \, t \) = F \( y + q t \, t \)$, $S_q \( partial_t F \) = partial_t \( S_q F \) -
    q partial_y \( S_q F \)$; thus the shear chain rules cancel with those of its inverse.
    Inductively this same polynomial has the direction coordinates of
  $ L_1 \, L_(- 1) \, L_(- 3) \, L_(- 5) \, dots.h $
  as roots in the field of primary germs. They are distinct:
    since $Theta \( y \, t \) = phi.alt \( y \) + O \( t^2 \)$,
    the first $t$-derivative of a generic slope coordinate of $L_j$ is $j
    phi.alt' \( y \)$ times a nonzero chart factor. A nonzero polynomial over a field cannot have infinitely many
    distinct roots. This contradiction excludes a first wall at or below $H_1 +
    eta$ for generic real irrational parameters in the neighborhood under consideration.
  ===== 4.6.7 Transfer to the original real parameter. <transfer-to-the-original-real-parameter.>
  For every nearby irrational $t_1$, the preceding construction supplies a parameter neighborhood on which
  $ h_L \( t \) gt.eq H_1 + eta $
  for real $t$ outside a countable exceptional set. The increment $eta$ depends only on the initial patch.
    A countable subcover covers all nearby irrational real parameters.
    Discarding their exceptional sets and the countably many rational shifts yields the displayed bound almost
    everywhere on an interval about $t_0$.
  Put $M = H_1 + eta$. On an upper half disk with diameter in that interval,
    approximate the nonnegative lower semicontinuous boundary values of $h_L$ from below by continuous functions
    supported away from the diameter endpoints. Superharmonic comparison and the almost-everywhere bound give
  $ h_L \( t \) gt.eq M omega_(+) \( t \) \, $
  where $omega_(+)$ is the harmonic measure of the diameter. The lower half disk gives $h_L gt.eq M omega_(-)$.
    Both harmonic measures tend to one near the interior diameter point $t_0$.
    The small-circle supermean inequality centered at $t_0$, followed by shrinking the circle,
    gives $h_L \( t_0 \) gt.eq M$. This contradicts $h_L \( t_0 \) = H_1$.
  ===== 4.6.8 The same conclusion for impact patches. <the-same-conclusion-for-impact-patches.>
  Suppose now that $X$ has a joint patch through its finite first wall at a real parameter.
    At real parameters (4.3) gives $h_X = h_L$. For nearby irrational shifts, forward and backward translates
  $ X \( y + \( j + 1 \/ 2 \) t \, t \) $
  of the patch supply enclosing impacts for every edge. Choose a finite covering by phase boxes,
    enclosing indices with at least two steps between them, and a common narrower vertical band exactly as above.
    20, with the analytic coefficient $A \( t \)$, supplies full-band joint polynomial equations for the edge
    $L \( y \, t \)$, attached to the primary branch on a common bottom strip.
  These equations are exactly the input to the first part of the argument.
    Generic slices, root bounds and monodromy turn a first obstruction into a finite defect.
    Its exclusion still uses the line-endpoint identities of 19 and the evenness operation (4.27);
    no additional point identity is needed in that exclusion.
    Thus $h_X \( t \) = h_L \( t \) gt.eq H_1 + eta$ almost everywhere on a real interval.
    Apply the same superharmonic transfer to $h_X$, using 23, to contradict its value at the original parameter.
    Real symmetry supplies the lower-wall assertion. ◻
]

=== 4.7 The boundary parametrization has the same natural wall <the-boundary-parametrization-has-the-same-natural-wall>

The zero slice of the joint impact map is the boundary curve.
  We must rule out the possibility that this slice continues through a wall even though the two-variable family
  does not. The argument first propagates glancing trajectories in steep complex directions and then fills the
  remaining directions by a family of quadratic disks.

#thm([Corollary 4.10.])[
  (Natural boundary of the shape).  #emph[Put $H = h_X \( 0 \) = h_L \( 0 \)$.
    The parametrization $Gamma \( y \) = X \( y \, 0 \)$ is meromorphic on
$ D_H = { y in bb(C) : \| Im y \| < H } . $

 If $H < oo$, it has no meromorphic continuation patch through any point of either boundary line of $D_H$.
   Moreover, on its meromorphic domain,
#[#set math.equation(numbering: n => "(4.28)")
 $ frac(det \( Gamma' \, Gamma'' \)^4, \( Gamma' dot.op Gamma' \)^3) = c^2 \, $ <cont:intrinsic-normalization>]

 where $c eq.not 0$ is the normalized curvature constant from the glancing construction.]
] <cor:shape-natural-boundary>

#proof[
  At each strict upper subheight of $H$, $X$ has a joint meromorphic extension near $t = 0$.
    In generic affine coordinates there is no polar component along the entire zero slice:
    such a component would meet the initial collar, where $X \( y \, 0 \) = Gamma \( y \)$ is regular.
    Restrictions to that slice are therefore meromorphic, with only isolated exceptional points to remove in the
    one-variable projective map. They agree on overlaps by the identity theorem.
    Real symmetry supplies the lower half, proving the first assertion.
  On the original real arc the curvature normalization is $r \( phi.alt \( y \) \) \( phi.alt' \( y \) \)^3 = c$.
    Since the unit tangent is $e_phi.alt$, it gives
  $ Gamma' = frac(c, \( phi.alt' \)^2) e_phi.alt \, wide Gamma' dot.op Gamma' = frac(c^2, \( phi.alt' \)^4) \,
    wide det \( Gamma' \, Gamma'' \) = frac(c^2, \( phi.alt' \)^3) . $
  These equations prove (4.28) on the real arc, hence meromorphically everywhere on $D_H$ and on any continuation patch.
  Suppose $H < oo$ and a patch exists. By real symmetry we may use the upper edge. Choose a regular point
  $ s_(upright("edge")) = x_(*) + upright(i) H $
  of the patch where $Gamma' dot.op Gamma'$ and $det \( Gamma' \, Gamma'' \)$ are both nonzero.
    Such a point exists after a small move along the edge: all exceptional sets are isolated,
    since the corresponding meromorphic functions are nonzero on the original real arc.
    Shrink the patch so that $Gamma$, its normal, a local normal angle $phi.alt$, the inverse angle coordinate,
    and the curvature radius are holomorphic and nondegenerate.
    The normal is obtained from $Gamma'$ by a local square root of its bilinear squared length;
    the angle then comes from a local logarithm. The intrinsic identity (4.28) shows that
    $r \( phi.alt \) \( phi.alt' \)^3$ is a nonzero constant on this patch,
    equal to $c$ up to the local sign choices. The zero slice $L \( y \, 0 \)$ is its tangent,
    by continuation from below.
  ===== 4.7.1 A regular starting segment. <a-regular-starting-segment.>
  Choose a row slightly below $H$, sufficiently close that all short slanted segments with normalized vertical
    component of absolute value at least $1 \/ 3$, ending near $s_(upright("edge"))$,
    remain inside the regular patch. Their starting points lie in a compact horizontal segment.
    Choose the exact row height to avoid joint poles and indeterminacies of $L \, X$ on $t = 0$ over this segment.
    This is possible because in affine charts finite along the segment there is no polar component equal to the
    zero slice; joint exceptions intersect it discretely. Compactness then gives a neighborhood of the segment on
    which $L \, X$ are analytic for small complex $t$. Evenness gives the line angle expansion
  #[#set math.equation(numbering: n => "(4.29)")
   $ Theta \( y \, t \) = phi.alt \( y \) + O \( t^2 \) $ <cont:patch-angle-expansion>]
  uniformly there.
  The rank-one identity identifies the nearby impact image with the fixed regular curve arc traced on $t = 0$.
    The reflection identity is its ordinary local reflection law.
    Thus the successive line angles, expressed in the normalized coordinate
  $ V = phi.alt^(- 1) \( upright("line angle") \) \, $
  satisfy the stationary recurrence of the local action $D$.
    The support and all root branches are chosen locally; the line angles are close enough that their mean is the
    normal angle at the shared impact.
  ===== 4.7.2 Cubic accuracy of the local recurrence. <cubic-accuracy-of-the-local-recurrence.>
  The same local Taylor calculation used for the normalized action,
    now using constancy of $r \( phi.alt \) \( phi.alt' \)^3$, gives
  $ partial_1 D \( V \, V + s \) = kappa s^2 + O \( s^4 \) \, wide kappa eq.not 0 med upright("constant") . $
  There is no cubic term. Antisymmetry of $D$ turns stationarity at a node into equality of this expression for
    the forward and backward increments. Its analytic square root is $s sqrt(kappa + O \( s^2 \))$.
    Choosing the opposite root from the repeated previous node gives the nonrepeated successor analytically and
    uniformly:
  #[#set math.equation(numbering: n => "(4.30)")
   $ V_(j + 1) = 2 V_j - V_(j - 1) + O #scale(x: 120%, y: 120%)[\(] \( V_j - V_(j - 1) \)^3
     #scale(x: 120%, y: 120%)[\)] . $ <cont:steep-recurrence>]
  The offsets of the corresponding lines are also analytic,
    being the endpoint momenta of the local generating function $cal(S)$.
  ===== 4.7.3 Propagation in steep directions. <propagation-in-steep-directions.>
  Assume $\| Im t \| gt.eq \| t \| \/ 3$. Replace $t$ by $- t$ if necessary, using evenness,
    so that the step is upward. For a target $y$ near the edge choose $N$ with $y -
    N t$ in the starting neighborhood. There is a uniform bound $N = O \( 1 \/ \| t \| \)$.
    Initialize the recurrence with
  $ V_0 = y - N t + O \( t^2 \) \, wide V_1 = y - \( N - 1 \) t + O \( t^2 \) \, $
  using (4.29). If the step sizes stay at most $2 \| t \|$, each recurrence error is $O \( \| t \|^3 \)$.
    Summing the errors once gives
  $ V_j - V_(j - 1) = t + O \( t^2 \) \, $
  and summing a second time gives
  $ V_j - #scale(x: 120%, y: 120%)[\(] y - \( N - j \) t #scale(x: 120%, y: 120%)[\)] = O \( \| t \| \) \, wide
    0 lt.eq j lt.eq N . $
  These estimates close the assumed step bound for small $\| t \|$.
    Choose the geometric paths with fixed slack in the regular patch before shrinking $\| t \|$;
    then every iterate remains in that patch.
  For locally constant $N$, this construction is holomorphic in $y \, t$. Choices of different $N$’s agree:
    take their starting points in a thin slab of known analytic data,
    where the exact recurrence relates all intervening indices,
    then apply uniqueness of the nonrepeated successor. It follows that the resulting germs glue near the target
    and along a vertical corridor down to the starting slab, uniformly for all steep directions.
    They are attached to the primary data on a fixed lower part of that corridor.
    At any chosen strict subheight below $H$, make $\| t \|$ smaller if needed so that uniqueness identifies them
    with the already known primary branch. The line construction also gives $X$ by the neighboring intersections.
    All choices have been made in order: first the regular patch and geometric slack,
    then the vertical travel distance, and finally the allowed size of $\| t \|$.
  ===== 4.7.4 Quadratic disks fill the shallow directions. <quadratic-disks-fill-the-shallow-directions.>
  Choose $eta > 0$ small compared with both the corridor size and the depth of the starting row.
    Next choose a sufficiently small parameter radius $r_0 > 0$. Consider the analytic disks
  #[#set math.equation(numbering: n => "(4.31)")
   $ t = r_0 zeta \, wide y = x_(*) + upright(i) sigma - upright(i) eta zeta^2 + w \, wide H - 2 eta lt.eq
     sigma lt.eq H \, $ <cont:quadratic-disks>]
  where $w$ is a small complex transverse parameter. At $\| zeta \| = 1$, write $zeta = e^(upright(i) theta)$.
    On the near-real arcs $\| sin theta \| < 1 \/ 2$,
  $ Im y \|_(w = 0) = sigma - eta cos \( 2 theta \) lt.eq H - eta \/ 2 . $
  These arcs therefore have joint primary data for small $r_0$.
    On the remaining arcs, $\| Im t \| \/ \| t \| gt.eq 1 \/ 2$,
    so the steep continuation just constructed applies with a strict margin over $1 \/ 3$.
    The continued germs glue to the primary ones on the overlaps by their attachment below $H$.
    Compactness supplies a common annular collar in $zeta$ and a common small disk in $w$ on which the pullbacks
    are meromorphic, throughout the indicated interval of $sigma$.
  At $sigma = H - 2 eta$, the full disks have height at most $H - eta$ for $w = 0$.
    Hence they, and a small neighborhood of them, already lie in the primary joint domain when $r_0$ is
    sufficiently small. Increase $sigma$ in small steps. The displacement of one center is absorbed by the
    transverse $w$-disk, so the full disks from the previous step give a nonempty open seed at the next step.
    Apply Lemma 4.6, Corollary 4.7 at each step. Uniqueness on the collars and on the seed overlaps attaches the
    resulting extensions to the lower branch throughout the ascent.
  At $sigma = H$, the disk center $zeta = 0$ gives a joint meromorphic patch through
    $\( y \, t \) = \( x_(*) + upright(i) H \, 0 \)$; varying $w$ and $zeta$ are local coordinates there because
    $r_0 eq.not 0$. This contradicts 24, applied to $L$ at the real parameter $0$.
    The supposed shape patch cannot exist. Real symmetry excludes a lower-edge patch as well. ◻
]

== 5 The shape strip and its intrinsic coordinate <sec:shapes>

Put

$ H = h_X \( 0 \) = h_L \( 0 \) \, wide D_H = { s in bb(C) : \| Im s \| < H } \, $

where $H = oo$ is allowed. The meromorphic curve on this strip is $Gamma \( s \) = X \( s \, 0 \)$.
  By 25, if $H < oo$, the primary curve has no meromorphic continuation through any point of either boundary line
  of $D_H$. We shall first dispose of its isotropic tangencies.
  In their absence we shall construct a global shape coordinate for every continued impact,
  including impacts at poles of the affine curve.

=== 5.1 The meromorphic normal and isotropic centers <the-meromorphic-normal-and-isotropic-centers>

Use isotropic affine coordinates

$ Z = x_1 + upright(i) x_2 \, wide W = x_1 - upright(i) x_2 . $

On the original real curve put

$ a = e^(upright(i) phi.alt) \, wide f = phi.alt' \, wide c = r \( phi.alt \) f^3 > 0 . $

The normalization of the phase coordinate gives

#[#set math.equation(numbering: n => "(5.1)")
 $ Gamma' = c / f^2 e_phi.alt \, wide Z' = frac(upright(i) c a, f^2) \, wide W' = -
   frac(upright(i) c, a f^2) . $ <shape:coordinate-derivatives>]

In particular,

#[#set math.equation(numbering: n => "(5.2)")
 $ a^2 = - Z' / W' \, wide f = frac(1, 2 upright(i)) frac(\( a^2 \)', a^2) \, wide a =
   frac(f^2 Z', upright(i) c) . $ <shape:normal-reconstruction>]

Read the first expression as a meromorphic function, then use its logarithmic derivative in the second expression,
  and finally use the third expression to choose the normal itself.
  These formulas extend $a$ and $f$ meromorphically throughout $D_H$;
  all their identities with the original real data continue there.
  We call a zero or a pole of $a$ an #emph[isotropic center].

We shall repeatedly use the intrinsic normalization

#[#set math.equation(numbering: n => "(5.3)")
 $ frac(det \( Gamma' \, Gamma'' \)^4, \( Gamma' dot.op Gamma' \)^3) = c^2 . $ <shape:intrinsic>]

This is the identity from (4.28). It also follows immediately from (5.1):
  $Gamma' dot.op Gamma' = c^2 \/ f^4$ and $det \( Gamma' \, Gamma'' \) = c^2 \/ f^3$.
  Under a reparametrization $s = sigma \( u \)$, the left side of (5.3) is multiplied by $sigma' \( u \)^6$.

#thm([Lemma 5.1.])[
  (Rational profiles at an isotropic center).  #emph[Suppose that $a$ has a zero of order $n gt.eq
    1$ at $p in D_H$. Then $n eq.not 3$. Set
$ D_(+) = n + 3 \, wide D_(-) = 3 - n . $

 There is a germ $xi \( w \) = w + O \( 1 \)$ at infinity such that both $xi^(D_(+))$ and $xi^(D_(-))$ are
   rational. It satisfies
#[#set math.equation(numbering: n => "(5.4)")
 $ frac(xi \( w + 1 \)^(D_(+)) - xi \( w \)^(D_(+)), xi \( w + 1 \)^(D_(-)) - xi \( w \)^(D_(-)))
   frac(xi \( w - 1 \)^(D_(+)) - xi \( w \)^(D_(+)), xi \( w - 1 \)^(D_(-)) - xi \( w \)^(D_(-))) =
   (D_(+) / D_(-))^2 xi \( w \)^(2 \( D_(+) - D_(-) \)) . $ <shape:profile-reflection>]

 The corresponding assertion for a pole holds after interchanging $Z$ and $W$.]
] <shape:isotropic-profile>

#proof[
  Write $z = s - p$. By (5.2), $f = n \/ \( upright(i) z \) + O \( 1 \)$. Integration of (5.1) therefore gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ Z \( s \) - Z \( p \) tilde.op c_Z z^(n + 3) \, wide W \( s \) - W_0 tilde.op c_W z^(3 - n) \,
     $ <shape:center-powers>]
  with nonzero constants $c_Z \, c_W$. Here $W_0 = W \( p \)$ when $W$ is finite,
    and any fixed constant may be used when $W$ has a pole. If $n = 3$,
    the leading term of $W'$ is a nonzero multiple of $z^(- 1)$,
    which cannot be the derivative of a meromorphic function. This proves $n eq.not 3$.
  At sufficiently close punctured points of the zero-parameter slice, $Gamma$ is finite, regular and nonisotropic.
    Its local inverse, together with the rank-one identity for $X$, gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ X \( y \, t \) = Gamma \( v \( y \, t \) \) \, wide v \( y \, t \) = y +
     sum_(j gt.eq 1) t^(2 j) v_j \( y \) . $ <shape:local-impact-series>]
  The even powers follow from evenness of $X$. Possible joint poles or indeterminacies at points where the
    zero-slice restrictions are regular form a discrete set on that slice.
    After shrinking the punctured disk, there are no such exceptions. The coefficients in (5.6) glue there.
    Recursively inverting one of the coordinates of $Gamma$ shows that every $v_j$ is meromorphic at $p$:
    at each order the new coefficient is divided only by a nonzero meromorphic derivative of that coordinate.
  To take a leading limit with $z = s - p$ and $t$ on the same scale,
    meromorphy of the coefficients alone is not enough. We need the pole bound
  #[#set math.equation(numbering: n => "(5.7)")
   $ "ord"_p v_j gt.eq 1 - 2 j . $ <shape:impact-coefficient-order>]
  Under $z = t w$, this keeps every formal term $t^(2 j) v_j \( p + t w \)$ at order at least $t$,
    just as for the leading displacement $z$. We prove the bound using the arc-minus-chord action, divided by $c$,
    between shape parameters $s$ and $s + h$:
  #[#set math.equation(numbering: n => "(5.8)")
   $ cal(D) \( s \, s + h \) = integral_s^(s + h) f^(- 2) -
     sqrt((integral_s^(s + h) f^(- 2) a) (integral_s^(s + h) f^(- 2) a^(- 1))) = h^3 / 24 +
     O \( h^5 \) . $ <shape:point-action>]
  The square root initially has the arc-length branch. To check the cubic coefficient,
    expand each integral at its midpoint. The difference between the normalized second derivative of $f^(- 2)$ and
    the average of those of $f^(- 2) e^(plus.minus upright(i) phi.alt)$ is $f^2$.
    Multiplication by $f^(- 2)$ leaves the constant coefficient $1 \/ 24$.
  Write $cal(D) \( s \, s + h \) = sum_m d_m \( s \) h^m$. Substituting $s = p + z$, $h = z eta$,
    the two chord integrals factor as $z^(3 + n) eta$ and $z^(3 - n) eta$, respectively,
    times functions holomorphic near $\( z \, eta \) = \( 0 \, 0 \)$ and nonzero there after division by $eta$.
    Their product has the square root $z^3 eta$ times a holomorphic unit, with the chosen glancing sign. Thus
  #[#set math.equation(numbering: n => "(5.9)")
   $ "ord"_p d_m gt.eq 3 - m . $ <shape:action-coefficient-order>]
  This argument concerns short segments away from the center;
    the resulting coefficient identities are meromorphic identities at the center.
  Reflection implies stationarity of the sum of two consecutive actions $cal(D)$ on the lifted impacts in (5.6).
    The arc terms telescope, and the chosen square roots have velocities tending to the same unit tangent,
    so their signs give the ordinary reflected branch. Divide this stationary equation by $t^3$.
    For a general function $v$, its leading expression is
  $ - 1 / 4 v_y v_(y y) . $
  Indeed the cubic action contributes one eighth of the difference of the squared previous and next increments.
    At order $t^(2 j)$, the new coefficient consequently enters as $- v''_j \/ 4$.
  Assign weight one to each of $z \, t$. Assuming (5.7) at preceding orders, the formal truncation of $v -
    p$ through order $t^(2 j - 2)$ and its increments have lower total degree at least one.
    Taylor shifts by $plus.minus t$ preserve this property. Composition of $d_m$ with $v$ preserves its lower
    degree $3 - m$, because each derivative lowers the allowed order by at most one.
    The endpoint derivatives of the unnormalized action therefore have total lower degree at least two.
    After division by $t^3$, the forcing at order $t^(2 j)$ has order at least $- 1 - 2 j$ in $z$.
    Only finitely many terms enter any fixed coefficient, since every step has positive $t$-order.
    Hence $"ord"_p v''_j gt.eq - 1 - 2 j$, which proves (5.7) because $v_j$ is meromorphic.
  Let $P \( z \, t \)$ be a constant-coefficient polynomial combination of the affine coordinates of
    $X \( p + z \, t \)$. Suppose that its zero-slice restriction has order $b in
    bb(Z)$ and leading coefficient $c_P eq.not 0$. Composition with (5.6) and (5.7) show that its coefficient of
    $t^l$ has order at least $b - l$. Consequently
  $ z^(- b) P \( z \, z lambda \) $
  is holomorphic near $\( z \, lambda \) = \( 0 \, 0 \)$. Here is the convergence point in this assertion.
    The expression is a meromorphic germ and its formal expansion in $lambda$, with Laurent coefficients in $z$,
    belongs to $bb(C) \[ \[ z \, lambda \] \]$ by the order bound.
    A meromorphic germ whose quotient is formally a power series is holomorphic:
    apply Weierstrass preparation and division, after a generic linear change of coordinates,
    to its numerator and denominator. More explicitly, replace the denominator by a Weierstrass polynomial times a
    unit, and divide the analytic numerator by that polynomial.
    The analytic remainder has degree below the polynomial degree.
    Uniqueness of formal division, compared with the given formal quotient, makes its formal remainder zero.
    The analytic remainder is consequently zero as well, and the analytic quotient is the desired germ;
    see #cite(label("Hormander1990")) Theorem 6.1.1. Thus formal nonnegative orders imply genuine holomorphy in
    this instance.
  Its restriction to $z = 0$ is rational in $lambda$, since it is the ratio of the first nonzero homogeneous parts
    of a local numerator and denominator after the substitution $t = z lambda$. Formally that restriction equals
  $ c_P cal(U) \( lambda \)^b \, wide cal(U) \( 0 \) = 1 \, $
  where $cal(U)$ collects the total-degree-one terms of $v - p$.
    Taking $P = Z - Z \( p \)$, for which $b = D_(+) > 0$, supplies an analytic $D_(+)$-th root near one and
    proves convergence of $cal(U)$. Set $xi \( w \) = w cal(U) \( 1 \/ w \)$. For sufficiently large $R_0$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ t^(- b) P \( t w \, t \) arrow.r c_P xi \( w \)^b $ <shape:rational-leading-limit>]
  locally uniformly, with derivatives, on $\| w \| > R_0$; the limit is rational.
    Applying this to the two coordinates in (5.5) proves rationality of the stated powers.
  In isotropic coordinates reflection says that the product of the two incident chord slopes,
    expressed as $Z$-increment divided by $W$-increment, is the square of the tangent slope.
    Substitute (5.10) at $w \, w - 1 \, w + 1$. The constants $c_Z \/ c_W$ cancel,
    and the derivative of $xi$ cancels from the tangent ratio.
    This gives (5.4), first near infinity and then as an identity of rational functions.
    Interchanging the isotropic coordinates treats a pole of $a$. ◻
]

#thm([Lemma 5.2.])[
  (Every isotropic center is simple).  #emph[All zeros and poles of $a$ in $D_H$ are simple.
    At each such center $p$, the curve has the local symmetry
#[#set math.equation(numbering: n => "(5.11)")
 $ Gamma \( 2 p - s \) = Gamma \( s \) \, wide a \( 2 p - s \) = - a \( s \) . $ <shape:center-reflection>]

]
] <shape:simple-centers>

#proof[
  It suffices to consider a zero of order $n$. Use the preceding lemma and put
  $ d = gcd \( D_(+) \, \| D_(-) \| \) \, quad R = xi^d \, quad alpha = D_(+) \/ d \, quad beta = D_(-) \/ d \,
    quad rho \( w \) = frac(R \( w + 1 \), R \( w \)) . $
  Bezout’s identity makes $R$ rational from the rationality of the two powers of $xi$.
    Since $R \( w \) tilde.op w^d$, $rho \( w \) = 1 + d \/ w + O \( w^(- 2) \)$.
    Thus $rho$ is a nonconstant rational map of some degree $s gt.eq 1$, with $rho \( oo \) = 1$. Define
  $ F \( x \) = frac(x^alpha - 1, x^beta - 1) . $
  After cancellation of the common powers of $R \( w \)$, (5.4) becomes
  #[#set math.equation(numbering: n => "(5.12)")
   $ F \( rho \( w + 1 \) \) = frac(\( alpha \/ beta \)^2, F \( 1 \/ rho \( w \) \)) .
     $ <shape:rational-shift-equation>]
  We use the Riemann–Hurwitz formula: a rational map of degree $s$ has total ramification $2 s - 2$;
    see #cite(label("Forster1981")).
  If $n = 2$, then $alpha = 5 \, beta = 1$, so $F$ is a polynomial of degree four with simple zeros at the four
    nontrivial fifth roots of unity. At each preimage by $rho$ of one of these four values,
    the right side of (5.12) has a pole whose order is the local multiplicity of that preimage.
    On the left, a pole has order divisible by four. Thus all these multiplicities are divisible by four.
    Each of the four fibers contributes at least $3 s \/ 4$ to ramification, giving total at least $3 s > 2 s -
    2$, a contradiction.
  Suppose next that $n > 3$. Write $gamma = - beta > 0$ and $m = alpha - gamma = 6 \/ d gt.eq 1$. The function
  $ F \( x \) = - x^gamma frac(x^alpha - 1, x^gamma - 1) $
  has a pole of order $alpha$ at infinity. The function on the right of (5.12), considered as a function of $rho$,
    has a pole of order $gamma$ at infinity and simple poles at the nontrivial $alpha$-th roots of unity.
    These roots are distinct from its other possible exceptional values, since $gcd \( alpha \, gamma \) = 1$.
  Group the finitely many poles of $rho$ into maximal runs $w_0 \, w_0 + 1 \, dots.h \, w_0 + ell$,
    with respective orders $p_0 \, dots.h \, p_ell$. Comparing pole orders at the points of the run gives
  $ alpha p_(j + 1) = gamma p_j quad \( 0 lt.eq j < ell \) . $
  At the preceding point $w_0 - 1$, which is not a pole of $rho$,
    $rho$ must take a nontrivial $alpha$-th root with multiplicity
  #[#set math.equation(numbering: n => "(5.13)")
   $ alpha p_0 = m sum_(j = 0)^ell p_j + gamma p_ell . $ <shape:pole-run-seam>]
  The preceding points of different runs are distinct. Their ramification contributions are their displayed
    multiplicities minus one. If $m gt.eq 2$, (5.13) shows that these points alone contribute at least $m s gt.eq
    2 s$, a contradiction.
  If $m = 1$ and $gamma gt.eq 2$, coprimality in the recurrence implies $gamma^ell divides p_ell$.
    Therefore $gamma p_ell - 1 gt.eq ell + 1$. If $N_P$ is the number of distinct poles,
    the preceding points contribute at least $s + N_P$, while the poles themselves contribute $s - N_P$.
    Again the total is at least $2 s$. The only remaining possibility is $m = gamma = 1$, $alpha = 2$.
    All preceding points then take the single value $- 1$, and their total multiplicity, by (5.13),
    is strictly larger than $s$. This is impossible for one fiber of a degree-$s$ map.
    Together with the exclusion of $n = 3$, these arguments leave only $n = 1$.
  For $n = 1$ we have $d = 2 \, alpha = 2 \, beta = 1$. Equation (5.12) reads
  $ \( 1 + rho \( w + 1 \) \) \( 1 + 1 \/ rho \( w \) \) = 4 . $
  Equivalently, $2 \/ \( rho - 1 \)$ increases by one under translation.
    A rational one-periodic function is constant, so
  $ frac(2, rho \( w \) - 1) = w + b_0 \, wide R \( w \) = \( w + b_0 \) \( w + b_0 + 1 \) . $
  The second identity follows by comparing the shift ratios and the asymptotic $R \( w \) tilde.op w^2$.
    In particular $xi$ is not rational, since $xi^2$ has two simple zeros.
  Choose a local coordinate $zeta = z + O \( z^2 \)$ such that $W - W_0 = c_W zeta^2$.
    If the expansion of $Z$ in $zeta$ had a first odd term of order $j$,
    subtracting the preceding even terms as a polynomial in $W -
    W_0$ would give a polynomial combination $P$ with order $j$. By (5.10), $xi^j$ would be rational.
    Since $j$ is odd and $xi^2$ is rational, Bezout’s identity would make $xi$ rational, a contradiction.
    Thus both coordinates of $Gamma$ are even in $zeta$. The involution $zeta mapsto -
    zeta$ induces a local symmetry $sigma$ of the shape parameter, fixing $p$ with derivative $- 1$.
  By (5.3), $sigma' ""^6 = 1$ on regular points. Its derivative is therefore constant, and $sigma \( s \) = 2 p -
    s$. The tangent-ratio identity gives $a \( sigma \( s \) \)^2 = a \( s \)^2$.
    The simple zero fixes the sign to be negative. This proves (5.11);
    the pole case is identical after interchanging $Z \, W$. ◻
]

#thm([Theorem 5.3.])[
  (Classification in the presence of isotropic centers).  #emph[If $a$ has a zero or a pole in $D_H$,
    the boundary is an ellipse.]
] <thm:isotropic-classification>

#proof[
  A center is nonreal, since $\| a \| = 1$ on the real axis.
    If $H < oo$, the symmetry (5.11) extends by identity on the overlap of $D_H$ with its reflection about the
    center. That overlap is connected. The reflected strip extends past one of the edges of $D_H$,
    giving a meromorphic continuation of $Gamma$ through an edge arc. This contradicts 25. Hence $H = oo$.
  Real symmetry supplies the conjugate center, and composition of the two center reflections supplies a nonreal
    period, in addition to $2 pi$. Thus $a$ is a nonconstant elliptic function.
    Let $Lambda$ be its full period lattice. Composing reflections about any two centers shows that twice their
    difference belongs to $Lambda$. Consequently all zeros and poles lie in the four classes of one translate of
    $1 / 2 Lambda \/ Lambda$. They are all simple by 27. The degree of $a$ on $bb(C) \/
    Lambda$ is therefore at most two. It cannot be one, because a degree-one meromorphic map from a torus to the
    sphere would be a biholomorphism. Its degree is exactly two.
  Riemann–Hurwitz now gives four simple ramification points.
    Their branch values $beta_1 \, dots.h \, beta_4$ are distinct and finite:
    a fiber of degree two cannot contain two ramification points, and the poles of $a$ are simple. The quotient
  $ frac(a' ""^2, product_(j = 1)^4 \( a - beta_j \)) $
  has neither zeros nor poles on the torus. At a ramification point both numerator and denominator have order two;
    at a simple pole both have order minus four. Hence the quotient is a nonzero constant. We have obtained
  #[#set math.equation(numbering: n => "(5.14)")
   $ a' ""^2 = P \( a \) \, wide deg P = 4 . $ <shape:elliptic-normal-equation>]
  Differentiating $a \( 2 p - s \) = - a \( s \)$ gives $a' \( 2 p - s \) = a' \( s \)$, so $P \( - a \) =
    P \( a \)$. Thus $P$ is even. On the real curve,
  $ f^2 = - frac(a' ""^2, a^2) = C + B cos \( 2 phi.alt \) + D sin \( 2 phi.alt \) > 0 $
  for real constants $B \, C \, D$. Therefore $f^2 = n_phi.alt^(sans(T)) N
    n_phi.alt$ for a real positive-definite symmetric matrix $N$.
    Positivity follows on all directions since $phi.alt$ runs once around the circle.
  For $q_N \( phi.alt \) = n_phi.alt^(sans(T)) N n_phi.alt$, direct differentiation gives
  $ (sqrt(q_N))'' + sqrt(q_N) = frac(det N, q_N^(3 \/ 2)) . $
  For example, use $q'_N = 2 e_phi.alt^(sans(T)) N n_phi.alt$ and $q''_N = 2 "tr" N - 4 q_N$,
    and evaluate the determinant of $N$ in the orthonormal basis $\( n_phi.alt \, e_phi.alt \)$.
    It follows that the support
  $ h_0 \( phi.alt \) = frac(c, det N) sqrt(n_phi.alt^(sans(T)) N n_phi.alt) $
  has curvature radius $c \/ f^3$, the radius of the given boundary. This is the support of an ellipse.
    The difference $h - h_0$ solves $\( h - h_0 \)'' + \( h - h_0 \) = 0$,
    so it is a linear combination of $cos phi.alt \, sin phi.alt$, precisely a translation of the support. ◻
]

=== 5.2 A global lift when the normal is nonisotropic <a-global-lift-when-the-normal-is-nonisotropic>

For the rest of this section suppose that $a$ has neither zeros nor poles in $D_H$.
  Since the strip is simply connected, it has a holomorphic logarithm.
  Choose $phi.alt$ consistently with the real normal. Then $phi.alt \, f = phi.alt'$ are holomorphic, and

$ phi.alt \( s + 2 pi \) = phi.alt \( s \) + 2 pi . $

The affine curve can still have poles, caused by zeros of $f$.
  The following theorem controls the impact coordinate even there.

#thm([Theorem 5.4.])[
  (The global shape lift).  #emph[Unless the boundary is a circle,
    there is a single-valued holomorphic function $frak(s)$ on the joint tube
#[#set math.equation(numbering: n => "(5.15)")
 $ cal(T) = {\( y \, t \) : t upright(" is in the parameter disk") \, quad -
   h_X \( macron(t) \) < Im y < h_X \( t \)} $ <shape:joint-tube>]

 such that
#[#set math.equation(numbering: n => "(5.16)")
 $ X \( y \, t \) = Gamma \( frak(s) \( y \, t \) \) \, wide \| Im frak(s) \( y \, t \) \| < H .
   $ <shape:global-composition>]

 It satisfies
#[#set math.equation(numbering: n => "(5.17)")
 $ frak(s) \( y \, 0 \) = y \, wide frak(s) \( y + 2 pi \, t \) = frak(s) \( y \, t \) + 2 pi \, wide
   frak(s) \( y \, - t \) = frak(s) \( y \, t \) . $ <shape:lift-symmetries>]

 It also obeys real symmetry, $frak(s) \( macron(y) \, macron(t) \) = overline(frak(s) \( y \, t \))$.
   After shrinking the parameter disk, for every real $t$ the real map $y mapsto
   frak(s) \( y \, t \)$ descends to an orientation-preserving analytic circle diffeomorphism.
   The inequality in (5.16) is void when $H = oo$.]
] <thm:shape-lift>

#proof[
  Near real glancing, the regular parametrization of the curve and the rank-one identity give the asserted lift.
    Its differential satisfies
  #[#set math.equation(numbering: n => "(5.18)")
   $ c^2 frak(s)_y^6 = frac(det \( X_y \, X_(y y) \)^4, \( X_y dot.op X_y \)^3) \, wide frak(s)_t / frak(s)_y =
     frac(X_t dot.op X_y, X_y dot.op X_y) . $ <shape:lift-differential>]
  Remove the proper analytic sets on which the meromorphic quantities needed here have poles,
    vanish in a denominator, or make the chosen sixth root zero.
    The complement containing the initial germ is connected: removing complex analytic sets of positive
    codimension does not disconnect a domain. Along any path in this complement the sixth root,
    the closed differential it determines, and its local primitive continue.
    Closedness continues from the initial germ. On every compact regular path the differential is finite,
    and its $y$-component is nonzero.
  The composition identity persists for as long as the continued primitive lies in $D_H$.
    If $H < oo$, it cannot first reach an edge of that strip.
    At such a first point the primitive is still finite and locally submersive.
    Complete it to local product coordinates $\( frak(s) \, z \)$,
    and restrict the meromorphic map $X$ to a generic constant-$z$ section.
    The identity on the inner side would then continue the primary $Gamma$ meromorphically through its edge,
    contradicting 25. Thus the primitive remains in the strip throughout continuation.
    For $H = oo$ there is no edge to encounter.
  After return along a loop, the continued primitive has the form
  $ frak(s) mapsto omega frak(s) + b \, wide omega^6 = 1 . $
  It consequently induces the symmetry
  #[#set math.equation(numbering: n => "(5.19)")
   $ Gamma \( omega s + b \) = Gamma \( s \) $ <shape:possible-monodromy>]
  on the overlap of the two relevant strips. That overlap is connected, being the intersection of two strips.
    If $H < oo$, a nonreal $omega$ makes the transformed strip cross an edge of $D_H$.
    If $omega = plus.minus 1$, the same is true when $Im b eq.not 0$.
    In either case (5.19) would give an edge patch. Thus only $omega = plus.minus 1$, $b in bb(R)$ remain.
  For $H = oo$, a nonreal $omega$ gives a nonreal period by conjugating the real translation $s mapsto s +
    2 pi$ with the affine symmetry in (5.19). A nonreal translation is already such a period.
    If $omega = - 1$ and $Im b eq.not 0$, compose that reflection with its conjugate,
    which is also a symmetry by reality, to obtain the nonreal period $b - macron(b)$.
    A period of $Gamma$ is a period of $a$ by (5.2). Such a nonreal period, together with $2 pi$,
    would make the entire holomorphic function $a$ doubly periodic and hence constant.
    This contradicts its real winding. Again only the real possibilities remain.
  Real embeddedness rules out a real reflection in (5.19) and makes a real translation an integer multiple of $2
    pi$. We conclude that
  $ v = e^(upright(i) frak(s)) $
  is single-valued on the regular complement. When $H < oo$, both $v$ and $1 \/ v$ are locally bounded,
    in fact between the bounds given by $e^(plus.minus H)$. They extend holomorphically across the removed
    analytic sets by the removable-singularity theorem. The bounds remain strict by the maximum principle,
    since $v$ is nonconstant on the zero slice. Hence the extension is nonvanishing and still has $\| log \|
    v \| \| < H$.
  For completeness we address the unbounded-strip case separately; bounded removability is not available there.
    The differential $thin upright(d) frak(s)$ is already single-valued,
    because all its monodromy is translational. It extends meromorphically by (5.18).
    Indeed, if a single-valued holomorphic function off an analytic set has a meromorphic sixth power,
    multiply it by a local denominator of that power; the result is bounded, since its sixth power is holomorphic,
    and is therefore removable. Apply this to $frak(s)_y$, then use the second identity in (5.18) for the other
    component.
  Write $Gamma \( s \) = G \( e^(upright(i) s) \)$, where $G$ is meromorphic on $bb(C)^(*)$.
    At a generic smooth point of a possible polar divisor, restrict to a transverse disk, with the center deleted.
    The single-valued function $v$ on this punctured disk cannot have an essential singularity.
    If it did, the image of every punctured neighborhood would be dense;
    choosing sequences approaching any regular value $w in bb(C)^(*)$ would force $G \( w \)$ to equal the
    projective limit of the meromorphic map $X = G \( v \)$. The nonconstant map $G$ would be constant.
  Suppose instead that $v$ has a zero of finite order $k$. In a local coordinate, $v \( z \) = z^k u \( z \)$,
    $u \( 0 \) eq.not 0$. Meromorphic affine coordinates of $X$ grow at most like $\| z \|^(- N)$.
    Every sufficiently small nonzero $w$ has preimages satisfying $\| z \| asymp \| w \|^(1 \/ k)$.
    The identity $G \( w \) = X \( z \)$ gives polynomial growth of the affine coordinates of $G$ at zero,
    hence meromorphic extension there. A pole of $v$ gives the analogous extension at infinity.
    Reality, $G \( 1 \/ macron(w) \) = overline(G \( w \))$ in Euclidean coordinates,
    supplies extension at the other end. Consequently $G$ is rational.
    Equations (5.2) then make $a$ rational in $w = e^(upright(i) s)$.
    A rational function with no zeros or poles on $bb(C)^(*)$ is $C w^k$; its real winding is one, so $k = 1$.
    This makes $f$ constant and the boundary a circle, the excluded case.
  It follows that $v$ extends with a nonzero finite value on every generic transverse disk.
    Therefore $thin upright(d) frak(s) = thin upright(d) v \/ \( upright(i) v \)$ has no pole on such a disk.
    Generic transverse directions detect all leading polar coefficients of a meromorphic one-form:
    a nonzero coefficient covector cannot annihilate every direction having nonzero normal component.
    Thus $thin upright(d) frak(s)$ has no polar divisor. Removability in codimension two makes it holomorphic
    throughout $cal(T)$.
  Finally, $cal(T)$ is simply connected. Its vertical fibers in $y$ are intervals containing $Im y = 0$,
    so vertical contraction retracts it to $bb(R)$ times the parameter disk.
    For finite $H$, take a holomorphic logarithm of the nonvanishing extension of $v$.
    For infinite $H$, take a primitive of the holomorphic closed one-form $thin upright(d) frak(s)$.
    Normalize by the original germ. This gives the required single-valued lift.
    The composition and all symmetries in (5.17), including real symmetry,
    follow by identity from the initial domain. On the real phase circle, $frak(s)_y = 1 + O \( t^2 \)$ uniformly.
    Shrinking the disk makes this derivative positive for real $t$;
    the degree-one periodicity then gives the asserted circle diffeomorphism. ◻
]

=== 5.3 Zeros of the speed and the first displacement coefficient <zeros-of-the-speed-and-the-first-displacement-coefficient>

#thm([Lemma 5.5.])[
  (Simple zeros and a holomorphic potential).  #emph[Every zero of $f$ in $D_H$ is simple.
    At each such zero, $f'' = 0$. Consequently
#[#set math.equation(numbering: n => "(5.20)")
 $ q = f'' / f $ <shape:potential-definition>]

 extends holomorphically throughout $D_H$.]
] <lem:f-zeros>

#proof[
  Suppose that $f$ vanishes at $s_0$ to order $m gt.eq 1$. Use fixed tangent and normal coordinates for the angle
    $phi.alt \( s_0 \)$, and write $z = s - s_0$. Since $phi.alt \( s \) - phi.alt \( s_0 \)$ has order $m + 1$,
    the tangent and normal components of $Gamma'$ in (5.1) have leading orders $- 2 m$ and $1 - m$, respectively,
    with nonzero coefficients. If $m = 2$, the normal derivative has a nonzero residue, contrary to meromorphy.
    If $m gt.eq 3$, integration gives tangent and normal coordinate poles of orders $2 m - 1$ and $m - 2$.
  By 29, the lift is holomorphic near $\( s_0 \, 0 \)$. The equation $frak(s) \( y \, t \) = s_0$ defines $y =
    s_0 + O \( t^2 \)$. For sufficiently small $t eq.not 0$, the two neighboring shape coordinates at phase shifts
    $plus.minus t$ are $s_0 plus.minus t + O \( t^2 \)$; their impacts are finite.
    Along the central curve, the chord to the previous impact therefore has normal-to-tangent slope of order at
    least $m + 1$. Its normal angle $theta$ can be chosen holomorphically, and
  $ d = theta - phi.alt \( frak(s) \) = O #scale(x: 120%, y: 120%)[\(] \( frak(s) - s_0 \)^(m + 1)
    #scale(x: 120%, y: 120%)[\)] . $
  For its signed offset $p_(upright("chord"))$, differentiation of $p_(upright("chord")) =
    n_theta dot.op Gamma \( frak(s) \)$ gives
  #[#set math.equation(numbering: n => "(5.21)")
   $ thin upright(d) p_(upright("chord")) and thin upright(d) theta =
     c f \( frak(s) \)^(- 2) sin d thin thin upright(d) frak(s) and thin upright(d) d =
     plus.minus A \( t \) thin thin upright(d) y and thin upright(d) t . $ <shape:chord-area>]
  The final identity is the continued area identity (3.4); choosing a local orientation can change only its sign.
    Since $A \( t \) = c t \/ 4 + O \( t^3 \)$, it is nonzero for small $t eq.not 0$.
  Set $z = frak(s) - s_0$ and write $d = z^(m + 1) b$. Then $thin upright(d) frak(s) and thin upright(d) d =
    z^(m + 1) thin upright(d) frak(s) and thin upright(d) b$.
    The left side of (5.21) thus vanishes to order at least $- 2 m + \( m + 1 \) + \( m + 1 \) = 2$,
    a contradiction. Hence $m = 1$. At a simple zero write $f = A z + B z^2 + O \( z^3 \)$, $A eq.not 0$.
    Since $a' = upright(i) f a$, we have $a = a \( s_0 \) + O \( z^2 \)$.
    The residue of $a \/ f^2$ is $- 2 a \( s_0 \) B \/ A^3$. It vanishes because $upright(i) c a \/ f^2 =
    Z'$ is a derivative of a meromorphic function. Thus $B = 0$, which is $f'' \( s_0 \) = 0$.
    The asserted removability of $q$ follows. ◻
]

We now fix the harmless freedom to translate phase as a function of $t$. Let

$ b \( t \) = frac(1, 2 pi) integral_0^(2 pi) \( frak(s) \( y \, t \) - y \) thin thin upright(d) y . $

This is analytic and even, real for real $t$, and vanishes at zero.
  Precompose $L \, X \, frak(s)$ with $y mapsto y - b \( t \)$, shrinking the parameter disk if necessary.
  Periodicity and contour translation then give

#[#set math.equation(numbering: n => "(5.22)")
 $ ⟨frak(s) \( y \, t \) - y⟩ = 0 . $ <shape:mean-normalization>]

All rotation, area and symmetry identities are preserved.
  The two widths acquire the same harmonic summand $Im b \( t \)$; hence the width relation,
  superharmonic comparison and no-patch properties are also preserved.
  We retain the previous notation for the normalized data. Averaging on any horizontal row in the tube now gives
  $chevron.l Im frak(s) chevron.r = Im y$. The shape constraint therefore implies

#[#set math.equation(numbering: n => "(5.23)")
 $ h_X \( t \) lt.eq H . $ <shape:width-bound>]

#thm([Proposition 5.6.])[
  (The first impact displacement).  #emph[For the normalization (5.22),
$ frak(s) \( y \, t \) = y + t^2 V \( y \) + O \( t^4 \) \, $

 where $V$ is holomorphic and periodic on $D_H$, has zero mean, and satisfies
#[#set math.equation(numbering: n => "(5.24)")
 $ V' = frac(f^2 + 8 q - chevron.l f^2 + 8 q chevron.r, 120) . $ <eq:V-coefficient>]

]
] <shape:first-displacement>

#proof[
  It suffices to calculate on real nonsingular data and then continue by identity.
    In (5.8) put $g = f^(- 2)$, $g_plus.minus = g e^(plus.minus upright(i) phi.alt)$.
    Midpoint integration through the fourth derivative gives
  #[#set math.equation(numbering: n => "(5.25)")
   $ cal(D) \( s \, s + h \) = h^3 / 24 + d_5 \( s + h \/ 2 \) h^5 + O \( h^7 \) . $ <shape:fifth-action>]
  For clarity, define
  $ B_j = 1 / 2 (g_(+)^(\( j \)) / g_(+) + g_(-)^(\( j \)) / g_(-)) \, wide C_2 = 2 \( g' \/ g \) f + f' = - 3 f' . $
  Multiplying the two midpoint integral expansions and taking the glancing square root gives
  $ d_5 = g [frac(g'''' \/ g - B_4, 1920) - frac(C_2^2, 2 dot.op 24^2)] . $
  Differentiating $g_plus.minus$ explicitly yields
  $ g'''' \/ g - B_4 = - 8 f f'' + 15 \( f' \)^2 - f^4 . $
  The two $\( f' \)^2$ contributions cancel, since $15 \/ 1920 = 9 \/ \( 2 dot.op 24^2 \)$. Therefore
  #[#set math.equation(numbering: n => "(5.26)")
   $ d_5 = - frac(f^2 + 8 q, 1920) . $ <shape:d5>]
  At the middle impact $s = frak(s) \( y \, t \)$, the previous and next shape increments are
  $ h_(-) = t + t^3 V' - 1 / 2 t^4 V'' + O \( t^5 \) \, wide h_(+) = t + t^3 V' + 1 / 2 t^4 V'' + O \( t^5 \) . $
  The cubic term in the stationary action contributes $- t^5 V'' \/ 4$.
    The fifth-order terms contribute $- 5 t^5 d'_5 + t^5 d'_5$:
    the first part comes from differentiating the increments and comparing the two midpoint values,
    and the second from differentiating the midpoints. Hence stationarity at order $t^5$ reads
  $ - V'' \/ 4 - 4 d'_5 = 0 . $
  Substitute (5.26), integrate once, and use periodicity of $V$ to determine the integration constant.
    This proves (5.24). The zero mean of $V$ follows from (5.22). ◻
]

== 6 Normalized chord equations and passage through cones <sec:cones>

We work in the nonisotropic alternative of 28. Thus the shape curve has a holomorphic normal on its shape strip,
  the impact lift is the function $frak(s)$ of 29, and

$ f = phi.alt' \, wide q = f'' \/ f \, wide M \( s \) = max { \| f \( s \) \| \, \| q \( s \) \|^(1 \/ 2) } . $

Both $f$ and $q$ are holomorphic by 30. The phase normalization is (5.22): $chevron.l frak(s) - y chevron.r = 0$.
  In particular, $h_X \( t \) lt.eq H$ by (5.23). We first write the billiard equation in a form that remains
  analytic when the affine coordinates of the shape curve have poles.
  We then use its small-field estimate to continue the lift toward a finite boundary of the shape strip.

=== 6.1 Kernel division and the exact recurrence <kernel-division-and-the-exact-recurrence>

Fix a shape point $s$, a nonzero small parameter $t$, and a normalized step $J$; the second endpoint is $s + t J$.
  The variable $u$ below is a fast coordinate, and derivatives with respect to $u$ are denoted by primes. Set

#[#set math.equation(numbering: n => "(6.1)")
 $ F \( u \) = t f \( s + t u \) \, wide Q \( u \) = t^2 q \( s + t u \) \, wide F'' = Q F \, $ <cone:fast-fields>]

and introduce the three potentials

#[#set math.equation(numbering: n => "(6.2)")
 $ Q_0 = Q \, wide Q_plus.minus = Q minus.plus frac(3 upright(i), 2) F' - F^2 / 4 . $ <cone:kernel-potentials>]

For each potential, let $k_j \( u \)$ be the solution of $k''_j = Q_j k_j$ with $k_j \( 0 \) = 0$, $k'_j \( 0 \) =
  1$. The normalized arc-minus-chord action is

#[#set math.equation(numbering: n => "(6.3)")
 $ p \( s \, J \; t \) = frac(upright("arc minus chord"), c t^3) =
   frac(k_0 \( J \) - sqrt(k_(+) \( J \) k_(-) \( J \)), F \( 0 \) F \( J \)) . $ <cone:kernel-action>]

Here and below the square root is the branch continued from short real chords at glancing.
  The letter $p$ in this Section denotes this action, not the offset of an unoriented line.

To verify (6.3), put

$ g_0 = F \, wide g_plus.minus \( u \) =
  F \( u \) exp (minus.plus upright(i) / 2 integral_0^u F \( v \) thin thin upright(d) v) . $

Direct differentiation, using $F'' = Q F$, gives $g''_j = Q_j g_j$. Where $g_j eq.not 0$, reduction of order gives

#[#set math.equation(numbering: n => "(6.4)")
 $ k_j \( J \) = g_j \( 0 \) g_j \( J \) integral_0^J g_j \( u \)^(- 2) thin thin upright(d) u .
   $ <cone:reduction-order>]

The identity extends meromorphically across zeros. In the formula $Gamma' = c e_phi.alt \/ f^2$,
  the arc integral is $c integral f^(- 2)$, and the squared chord length is the product of the integrals of $c
  f^(- 2) e^(upright(i) phi.alt)$ and $c f^(- 2) e^(- upright(i) phi.alt)$.
  Substitution of (6.4), including the change $thin upright(d) s = t thin thin upright(d) u$,
  gives (6.3) first for regular real short chords and then by analytic continuation.

#thm([Lemma 6.1.])[
  (Analytic kernel division).  #emph[Let $Q$ be holomorphic on a fixed neighborhood of an integration segment from
    $0$ to $J$. Regard $Q$, $J$, and the initial data $F \( 0 \) \, F' \( 0 \)$ for $F'' = Q F$ as variables.
    Near zero initial data and a pair $\( Q \, J \)$ for which $k_0 \( J \) eq.not 0$, the right side of (6.3),
    with the square root equal to $k_0 \( J \)$ at zero initial data,
    extends holomorphically through $F \( 0 \) F \( J \) = 0$. This extension is even in $F$.
    Its bounds and analytic dependence, including derivatives on smaller neighborhoods,
    are uniform on compact sets of admissible $\( Q \, J \)$.]
  #emph[In particular, for $J$ in a fixed sufficiently small neighborhood of $1$, and small $Q \, F \( 0 \) \,
    F' \( 0 \)$,
#[#set math.equation(numbering: n => "(6.5)")
 $ p - J^3 / 24 = O (parallel Q parallel + \| F \( 0 \) \|^2 + \| F' \( 0 \) \|^2) . $ <cone:small-action>]

 The same estimate holds for any fixed number of $J$-derivatives on a smaller neighborhood.]
] <lem:kernel-division>

#proof[
  The integral equation
  $ k_j \( u \) = u + integral_0^u \( u - v \) Q_j \( v \) k_j \( v \) thin thin upright(d) v $
  proves analytic dependence and uniform bounds by its uniformly convergent Picard series.
    The same argument applies to $F$ and to a moving endpoint $J$,
    provided the segments and their small thickenings remain in the fixed domain.
  Suppose first that $F \( 0 \) = 0$. If $F equiv.not 0$, uniqueness gives $g_j = g'_j \( 0 \) k_j$,
    and $g'_(+) \( 0 \) g'_(-) \( 0 \) = F' \( 0 \)^2$. Since $g_(+) \( J \) g_(-) \( J \) = F \( J \)^2 =
    F' \( 0 \)^2 k_0 \( J \)^2$, it follows that $k_(+) \( J \) k_(-) \( J \) = k_0 \( J \)^2$.
    The conclusion also holds when $F equiv 0$. If instead $F \( J \) = 0$,
    apply the same argument to kernels started at $J$. The value at $0$ of such a backward kernel is $-
    k_j \( J \)$: this follows by evaluating the constant Wronskian of the forward and backward kernels at both
    endpoints. The two signs cancel in their product, and the same identity follows.
  At zero initial data, $k_(+) k_(-) = k_0^2 eq.not 0$. Consequently the square root agreeing with $k_0$ is
    analytic nearby. On each of the two zero hyperplanes just considered it agrees with $k_0$,
    by uniqueness of that local branch. The map from initial data to endpoint data is
  $ \( F \( 0 \) \, F' \( 0 \) \) mapsto \( F \( 0 \) \, F \( J \) \) \, $
  whose determinant is $k_0 \( J \)$. Its coordinates are therefore independent.
    An analytic function vanishing on both coordinate hyperplanes is divisible by their product,
    as is seen by its convergent power series. This proves the claimed extension.
    Cauchy estimates in these two coordinates prove locally uniform bounds for the quotient and its derivatives,
    also when $Q$ and $J$ vary.
  Replacing $F$ by $- F$ interchanges $k_(+)$ and $k_(-)$, so the quotient is even.
    At $F = Q = 0$, its value is $J^3 \/ 24$, as follows by taking $F$ to be a small constant in the formula
    computed below. Evenness removes the terms linear in the initial data;
    analytic interpolation from $0$ to $Q$ bounds the remaining constant term by $O \( parallel Q parallel \)$.
    This proves (6.5) and its derivative versions. ◻
]

For consecutive endpoints $s_(-)$, $s = s_(-) + t J_(-)$, and $s + t J$,
  stationarity of the sum of the two actions is exactly

#[#set math.equation(numbering: n => "(6.6)")
 $ p_J \( s \, J \; t \) - t p_s \( s \, J \; t \) = p_J \( s_(-) \, J_(-) \; t \) . $ <cone:normalized-recurrence>]

Indeed the derivative in the final endpoint of $c t^3 p \( s_(-) \, \( s - s_(-) \) \/ t \; t \)$ is $c t^2 p_J$,
  whereas the derivative in the initial endpoint of $c t^3 p \( s \, \( s_(+) - s \) \/ t \; t \)$ is $c t^3 p_s -
  c t^2 p_J$. Thus (6.6) has no uncontrolled remainder. By 32 it also makes sense at the exceptional affine points
  of the curve.

=== 6.2 The two frozen actions <the-two-frozen-actions>

The limits needed later are constant fast fields satisfying $F Q = 0$.
  For $F = lambda$, $Q = 0$, set $z = lambda J \/ 2$. Here $k_0 \( J \) = J$ and $k_plus.minus \( J \) =
  2 sin z \/ lambda$. Consequently the action and its energy $E = J p_J - p$ are

#[#set math.equation(numbering: n => "(6.7)")
 $ p_F \( lambda \, J \) = J / lambda^2 - frac(2 sin z, lambda^3) \, wide E_F \( lambda \, J \) =
   frac(2 \( sin z - z cos z \), lambda^3) . $ <eq:frozen-F-energy>]

For $F = 0$, $Q = lambda^2$, the analytically divided action is

#[#set math.equation(numbering: n => "(6.8)")
 $ p_Q \( lambda \, J \) = frac(J, 2 lambda^2) - frac(tanh z, lambda^3) \, wide E_Q \( lambda \, J \) =
   frac(tanh z - z "sech"^2 z, lambda^3) . $ <eq:frozen-Q-energy>]

All quotients have their continuous values at $lambda = 0$.
  For the second calculation, take $F = eta e^(lambda u)$, which solves $F'' = lambda^2 F$,
  and expand the arc and chord in $eta$. The common term of order $eta^(- 2)$ cancels. More explicitly, put

$ A \( u \) = integral_0^u e^(lambda v) thin thin upright(d) v \, wide I_j =
  integral_0^J e^(- 2 lambda u) A \( u \)^j thin thin upright(d) u . $

The two chord factors are $eta^(- 2) \( I_0 plus.minus upright(i) eta I_1 - eta^2 I_2 \/ 2 + O \( eta^3 \) \)$.
  Their product is $eta^(- 4) \( I_0^2 + eta^2 \( I_1^2 - I_0 I_2 \) + O \( eta^4 \) \)$,
  so subtraction from the arc $eta^(- 2) I_0$, with the glancing square root,
  leaves $\( I_2 - I_1^2 \/ I_0 \) \/ 2 + O \( eta^2 \)$. Since $A \( u \) = \( e^(lambda u) - 1 \) \/ lambda$,
  the limit is

$ frac(1, 2 lambda^2)
  (J - frac((integral_0^J e^(- lambda u) thin thin upright(d) u)^2, integral_0^J e^(- 2 lambda u) thin thin
  upright(d) u)) = frac(J, 2 lambda^2) - frac(tanh \( lambda J \/ 2 \), lambda^3) . $

Lemma 32 identifies this limit with the analytic extension at $F = 0$.

For later use, the expansions at zero are

#[#set math.equation(numbering: n => "(6.9)")
 $ p_F & = J^3 / 24 - frac(lambda^2 J^5, 1920) + O \( lambda^4 J^7 \) \, & E_F & = J^3 / 12 -
   frac(lambda^2 J^5, 480) + O \( lambda^4 J^7 \) \,\
p_Q & = J^3 / 24 - frac(lambda^2 J^5, 240) + O \( lambda^4 J^7 \) \, & E_Q & = J^3 / 12 - frac(lambda^2 J^5, 60) +
  O \( lambda^4 J^7 \) . $ <cone:F-series>]

#thm([Lemma 6.2.])[
  (Convergence to a frozen action).  #emph[Fix a compact path of frozen states from the small-field germ to a
    finite point of one of the two displayed actions above, avoiding kernel and root degeneracies,
    with $J eq.not 0$ and $p_(J J) eq.not 0$ at its endpoint.
    Suppose analytic fast fields satisfying $F'' = Q F$ converge locally uniformly to those frozen states on
    complex neighborhoods of the path and of all its swept integration segments.
    Continue their glancing square-root germs along the corresponding perturbed path.
    Their actions then converge analytically, with all derivatives on smaller neighborhoods of the endpoint,
    to the frozen action on that fixed continued sheet. The endpoint alone does not select a sheet after an
    arbitrary loop.]
] <cone:profile-action-convergence>

#proof[
  In the first case, $p_(J J) = sin z \/ \( 2 lambda \)$; hence its nonvanishing excludes the zero of
    $k_plus.minus$, while $k_0 = J eq.not 0$. The ordinary quotient formula and analytic dependence of kernels
    apply. In the second case,
  $ p_(J J) = frac(tanh z thin "sech"^2 z, 2 lambda) \, wide k_0 = k_(+) = k_(-) = frac(sinh \( 2 z \), lambda) . $
  A zero of this last kernel either has $sinh z = 0$, when $p_(J J) = 0$, or $cosh z = 0$,
    when the displayed branch is not finite. Thus the division lemma applies.
    The limiting case $lambda = 0$ has $p_(J J) = J \/ 4$. A compact path can be covered by finitely many of these
    analytic neighborhoods. Uniqueness of the square root on each overlap tracks the chosen branch,
    and Cauchy estimates give convergence of all derivatives. ◻
]

=== 6.3 Continuation in cones of arbitrary fixed aperture <continuation-in-cones-of-arbitrary-fixed-aperture>

For this subsection suppose $H < oo$. Depth always means distance below the upper edge:

$ delta = H - Im y \, wide delta_s = H - Im s . $

The lower edge is treated by real symmetry.

#thm([Theorem 6.3.])[
  (Cone passage).  #emph[Fix $1 \/ 2 < alpha < 1$, a finite target aperture $m_0$,
    and a fixed $delta_b in \( 0 \, H \/ 2 \)$. There is an input aperture $L$, depending on $alpha$ and $m_0$,
    with the following property. Fix $K < oo$, let $d arrow.r 0$, choose real centers $x_0$, and let $0 < r lt.eq
    K d$. Suppose
#[#set math.equation(numbering: n => "(6.10)")
 $ r M \( s \) lt.eq epsilon \( d \/ delta_s \)^alpha quad upright("if") quad d \/ 10 lt.eq delta_s lt.eq
   delta_b \, quad \| Re s - x_0 \| lt.eq L delta_s . $ <cone:input>]

 For sufficiently small $epsilon > 0$ and then sufficiently small $d$,
   the lift continues jointly holomorphically along vertical paths from a fixed lower row throughout
#[#set math.equation(numbering: n => "(6.11)")
 $ d < delta < delta_(*) \, wide \| Re y - x_0 \| < m_0 delta \, wide \| t \| < r \( delta \/ d \)^alpha \,
   $ <cone:target>]

 where $delta_(*) > 0$ is fixed. With $B = 1 + \( epsilon \/ r \) d^alpha$, it satisfies
#[#set math.equation(numbering: n => "(6.12)")
 $ \| frak(s) \( y \, t \) - y \| lt.eq C B^2 \| t \|^2 delta^(1 - 2 alpha) . $ <cone:passage-estimate>]

 The relative depth error is small, so these continuations remain in the shape strip,
   and they agree with the original lift wherever the latter is defined below them.]
  #emph[The input aperture can be chosen independently of $K$.
    Once it contains the fixed geometric enlargements described in the proof,
    the constant $C$ and the smallness requirement on $epsilon$ can be chosen independently of the target
    aperture. They may depend on $K$, $alpha$, and the fixed lower-strip data.]
] <thm:cone>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.156, 3.135), (-3.185, 0), (3.185, 0), (0.156, 3.135), close: true, fill: rgb("#edf1f4"), stroke: none)
  line((-3.9, 3.3), (3.9, 3.3), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((3.9, 3.3), [#text(size: 9pt)[$Im s=H$]], anchor: "west", padding: 0.1176cm)
  line((-3.185, 0), (0, 3.3), (3.185, 0), stroke: (paint: rgb("#234f70"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-3.38, 0.33), (3.38, 0.33), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((3.445, 0.33), [#text(size: 9pt)[starting slab]], anchor: "west", padding: 0.1176cm)
  line((-2.6, 2.2), (2.6, 2.2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  circle((0, 2.2), radius: 0.05997, fill: black, stroke: none)
  content((2.73, 2.2), [#text(size: 9pt)[$x+ upright(i) (H-d)$]], anchor: "west", padding: 0.1176cm)
  line((2.106, 2.244), (2.106, 3.256), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2.106, 2.75), [#text(size: 9pt)[$d$]], anchor: "west", padding: 0.1176cm)
  line((-0.845, 0.385), (-0.637, 0.825), stroke: (paint: rgb("#a34637"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a34637"))))
  line((-0.637, 0.825), (-0.429, 1.265), stroke: (paint: rgb("#a34637"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a34637"))))
  line((-0.429, 1.265), (-0.221, 1.705), stroke: (paint: rgb("#a34637"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a34637"))))
  line((-0.221, 1.705), (0, 2.2), stroke: (paint: rgb("#a34637"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a34637"))))
  content((-2.6, 1.232), [#text(fill: rgb("#a34637"))[#text(size: 9pt)[steps $plus.minus t$]]], anchor: "east", padding: 0.1176cm)
  content((0, -0.462), [#text(size: 9pt)[$| Re s-x| lt.eq L(H- Im s)$ with a fixed enlarged margin]])
})],
  caption: [Figure 3: A cone passage begins in known analytic data and follows steep increments toward the chosen depth. Local error bounds are summed in depth, with exponent greater than $1 \/ 2$. Enlarging a fixed aperture provides geometric margin without changing the local constants. Parameter disks subsequently fill the directions close to real increments. ],
) <fig:cone>

#proof[
  We give separately the recurrence argument in steep parameter directions, illustrated in 3,
    and the analytic-disk argument that fills the remaining directions.
  Fix a small number $gamma > 0$. Suppose first that $\| Im t \| gt.eq gamma \| t \| > 0$.
    By evenness in $t$, use whichever of $t \, - t$ moves upward.
    Start in a fixed slab about depth $delta_b \/ 2$, where joint analyticity and the phase normalization give
  $ frak(s) - y = O \( t^2 \) \, wide frac(frak(s) \( y + t \, t \) - frak(s) \( y \, t \), t) = 1 + O \( t^2 \) $
  with derivative bounds uniform in the real coordinate modulo its period.
    The largest parameters in the construction tend to zero, since $r d^(- alpha) lt.eq K d^(1 - alpha) arrow.r 0$.
  Follow the exact recurrence toward the target, denoting successive unperturbed depths by $x_j$.
    They decrease by $\| Im t \|$. We allow here the slightly larger range $x_j gt.eq d \/ 2$, $\| t \| lt.eq
    10 r \( x_j \/ d \)^alpha$, which will be useful in the disk construction.
    Suppose inductively that position errors are a small fraction of the depths and that normalized steps are
    close to $1$. The shape fields on every required segment and a small thickening satisfy
  $ \| F \( 0 \) \| + \| F' \( 0 \) \| lt.eq C_K \| t \| B x_j^(- alpha) \, wide parallel Q parallel lt.eq
    C_K \| t \|^2 B^2 x_j^(- 2 alpha) . $
  To see the derivative estimate, apply Cauchy on a disk of radius a small fixed fraction of $x_j$.
    Although $\| t \| \/ x_j$ need not tend to zero, it is bounded by a constant depending on $K$.
    Consecutive depths are therefore comparable, with constants depending on $K$,
    and the thickenings may be taken with smaller such fractions. They remain above depth $d \/ 10$.
    Their horizontal displacements lie in the direction cone of slope at most $1 \/ gamma$,
    with a fixed extra margin. Increasing the input aperture by this fixed geometric amount suffices;
    reducing the thickness when $K$ increases does not require a larger aperture.
  The small parameter in the kernel estimates is bounded by
  $ \| t \| B x_j^(- alpha) lt.eq C #scale(x: 120%, y: 120%)[\(] epsilon +
    r d^(- alpha) #scale(x: 120%, y: 120%)[\)] . $
  Thus 32 applies uniformly. If $a \( s \, J \; t \) = p \( s \, J \; t \) - J^3 \/ 24$, then
  #[#set math.equation(numbering: n => "(6.13)")
   $ \| partial_J^nu partial_s^mu a \| lt.eq C_(K \, mu \, nu) \| t \|^2 B^2 x_j^(- 2 alpha - mu)
     $ <cone:action-estimates>]
  for the finitely many derivatives used below. The $s$-derivative bounds follow by Cauchy on the same thickenings.
  Evaluate (6.6) with the trial new step $J = J_(-)$. The cubic contributions cancel.
    The difference of $a_J$ at the two adjacent basepoints, together with $t a_s$,
    is at most $C_K \| t \|^3 B^2 x_j^(- 2 alpha - 1)$. The derivative of the equation in the new $J$ is $J \/ 4 +
    o \( 1 \)$, uniformly bounded away from zero. The analytic implicit function theorem therefore supplies a
    unique nearby step, with
  #[#set math.equation(numbering: n => "(6.14)")
   $ \| J - J_(-) \| lt.eq C_K \| t \|^3 B^2 x_j^(- 2 alpha - 1) . $ <cone:one-step>]
  For $beta > 1$, comparison with an integral on the depth mesh gives
  $ \| t \| sum_(x_j gt.eq x) x_j^(- beta) lt.eq C_(K \, gamma \, beta) x^(1 - beta) . $
  The possible final summand is controlled because $\| t \| \/ x$ is bounded.
    Summing (6.14) first, and then summing the position increments $t \( J - 1 \)$, gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ \| J - 1 \| lt.eq C_K \| t \|^2 B^2 x^(- 2 alpha) \, wide \| frak(s) - y \| lt.eq
     C_K \| t \|^2 B^2 x^(1 - 2 alpha) . $ <cone:steep-estimates>]
  The second sum uses $2 alpha > 1$. Initial errors from the fixed slab are absorbed because $B gt.eq 1$. Moreover
  $ frac(\| frak(s) - y \|, x) + \| J - 1 \| lt.eq C_K #scale(x: 120%, y: 120%)[\(] epsilon +
    r d^(- alpha) #scale(x: 120%, y: 120%)[\)]^2 \, $
  which closes the induction after the prescribed order of choices.
  These recurrences define analytic germs in $\( y \, t \)$.
    Locally choose a fixed integer number of steps back into the starting slab,
    where both initial neighbors are known. Two such choices agree by uniqueness of the near-identity recurrence.
    They consequently give analytic continuation from below on every steep sector under discussion.
  We now fill all parameter directions. Call a germ reached if it is obtained by continuing from the fixed lower
    row along the vertical path with $Re y$ and $t$ fixed. Reached germs form a single-valued holomorphic function
    on their open domain: nearby parallel paths are compared through a finite chain of the same germs from below.
    The steep continuations just constructed agree with these germs. Work with
  $ U \( y \, t \) = frac(frak(s) \( y \, t \) - y, t^2) \, $
  which is regular at $t = 0$ on the initial domain and on its continuations.
  Choose a large fixed $D_0$ with $D_0^alpha > 10$, then a sufficiently small fixed $gamma$.
    For a target $\( y_c \, t_c \)$ of depth $delta$, put $R = r \( delta \/ d \)^alpha$.
    Since $\| t_c \| < R$, the circle $t = t_c + 3 R zeta$, $\| zeta \| = 1$,
    meets the nonsteep sector only on two uniformly short arcs.
    There is a polynomial $g$, with $g \( 0 \) = 0$, such that
  #[#set math.equation(numbering: n => "(6.16)")
   $ \| g \( zeta \) \| lt.eq C_0 delta \, quad Im g lt.eq delta \/ 4 med upright("on the circle") \, quad
     Im g lt.eq - D_0 delta med upright("on those arcs and a collar") . $ <cone:disk-bending>]
  Here $C_0$ is fixed independently of the target aperture.
    For completeness, choose smooth negative bumps equal to a sufficiently large negative constant on the two arcs
    and supported in slightly larger short intervals. Add a constant to make their mean zero.
    The intervals can be made so short that the added constant is less than $1 \/ 8$.
    Approximate the resulting smooth function, with a fixed strict margin in its inequalities,
    by a real trigonometric polynomial of mean zero. It is the boundary imaginary part of an analytic polynomial
    vanishing at zero. Multiplication by $delta$ gives (6.16).
    The centers of the arcs and $t_c \/ \( 3 R \)$ range over a compact set with modulus at most $1 \/ 3$,
    so the bump widths and polynomial degree can be fixed uniformly.
    This also bounds the conjugate real part by $C_0 delta$.
  Increase an auxiliary target aperture $m gt.eq m_0$ so that
  $ m + C_0 < m D_0 . $
  Choose $L$ to contain this aperture, the shifts by $C_0 delta$, and the steep paths and thickenings above,
    all with fixed slack. We induct from a sufficiently small fixed depth down through successive bands whose
    depth thresholds are halved. In a new band use the disks
  #[#set math.equation(numbering: n => "(6.17)")
   $ t = t_c + 3 R zeta \, wide y = y_c + g \( zeta \) + w \, wide \| zeta \| lt.eq 1 \, $ <cone:disks>]
  where $w$ is a small complex parameter. On the nonsteep boundary arcs the depth is at least $D_0 delta$.
    They are therefore in the previous all-direction domain; the inequality $D_0^alpha >
    10$ supplies the parameter margin, and $m + C_0 < m D_0$ supplies the aperture margin.
    On the remaining arcs, steep continuation applies at depth at least $delta \/ 2$,
    with the larger parameter range already allowed. Slight collars of the arcs have the same properties.
  Start $y_c$ lower by a fixed sufficiently large multiple of $delta$;
    then the entire disk and a neighborhood lie in the previous domain.
    Raise $y_c$ to its target value in small steps. The holomorphic disk-continuation principle in Lemma 4.6,
    Corollary 4.7, with the parameter $w$, continues $U$ over the disks and identifies the resulting central germ
    with vertical continuation from below.
  There is no growth of the estimate with the number of bands.
    If the inductive bound is $A B^2 x^(1 - 2 alpha)$, its value on a previous-domain arc of depth $x gt.eq
    D_0 delta$ is at most $A D_0^(1 - 2 alpha) B^2 delta^(1 - 2 alpha)$,
    with the fixed factor $D_0^(1 - 2 alpha) < 1$. On a steep arc (6.15) gives an independent constant times $B^2
    delta^(1 - 2 alpha)$. Choose $A$ once larger than that constant and the initial lower-strip constant.
    Maximum modulus on each disk retains the same $A$. Starting the induction at a sufficiently small fixed depth
    keeps its lower dips below $delta_b$; a partial last band reaches any $delta > d$. This proves (6.12).
  The constants in the depth sums, field bounds, and maximum-modulus argument depend only on the fixed local
    margins. They do not depend on how far the cone extends horizontally.
    Initial data are uniform modulo the real period. Thus increasing a target aperture only increases the input
    aperture needed to contain the indicated geometric enlargements;
    it does not enlarge the estimate constant or change the smallness choice.
    The relative-error estimate already proved keeps the image below the upper shape edge and,
    after reducing $delta_(*)$, above the lower edge. ◻
]

#prodef([Remark 6.4.])[
  (Reference heights).  The local construction in 34 does not use the assertion that $H$ is a singularity height.
    It remains valid with a reference height $h$ in place of $H$,
    provided the stated cone and its thickenings are contained in the actual shape domain,
    lower-row initial data are available, and the relative-error bound keeps the constructed lift in that domain.
    In a rescaled sequence this formulation is applied on fixed compact sets,
    with thresholds allowed to depend on the chosen finite aperture.
    The constants in the estimate remain independent of that aperture.
    A statement about the global width still uses the actual first boundary of the phase domain, as explained next.
] <cone:reference-height>

=== 6.4 Quiet profiles and their consequences <quiet-profiles-and-their-consequences>

At a real parameter $t$, any passage in 34 gives a global lower bound on $h_X \( t \)$.
  Indeed, if the original phase strip ended at an earlier height, the local identity $X \( y \, t \) =
  Gamma \( frak(s) \( y \, t \) \)$, valid jointly in $\( y \, t \)$ and with $\| Im frak(s) \| < H$,
  would give a joint meromorphic patch through that first edge. This contradicts 24.
  This argument uses the no-patch assertion only at a real physical parameter.

#thm([Corollary 6.5.])[
  (Coarse bounds and quiet profiles).  #emph[Let $d_n arrow.r 0$, $b_n gt.eq 1$, and $x_n in bb(R)$.
    Suppose, on a sufficiently large fixed cone starting at depth $d_n$, that
#[#set math.equation(numbering: n => "(6.18)")
 $ d_n / b_n M \( s \) lt.eq C \( d_n \/ delta_s \)^alpha \, wide 1 / 2 < alpha < 1 . $ <cone:coarse-bound>]

 The following statements hold; whenever an arbitrary fixed aperture is used,
   the hypothesis is required on its corresponding fixed enlargement.]
  + #emph[On a strictly coarser cone, starting at a fixed sufficiently large multiple of $d_n$,
    there is a passage with parameter radius $c \( d_n \/ b_n \) \( delta \/ d_n \)^alpha$, and
#[#set math.equation(numbering: n => "(6.19)")
 $ \| frak(s) - y \| = O (b_n^2 \| t \|^2 d_n^(2 alpha - 2) delta^(1 - 2 alpha)) . $ <cone:coarse-error>]

 Equivalently, for $Y = \( y - x_n - upright(i) H \) \/ d_n$, $S = \( frak(s) - x_n - upright(i) H \) \/ d_n$,
   and $T = t b_n \/ d_n$,
$ \| S - Y \| lt.eq C \| T \|^2 \( - Im Y \)^(1 - 2 alpha) $

 far enough down at each bounded $T$.]
  + #emph[Suppose in addition that
#[#set math.equation(numbering: n => "(6.20)")
 $ d_n / b_n M \( x_n + upright(i) H + d_n S \) arrow.r 0 $ <cone:quiet-profile>]

 uniformly on every compact subset of $Im S < 0$. For every $c_1 \, T_1 > 0$,
   lift passages reach depth $c_1 d_n$ for all $\| t \| lt.eq T_1 d_n \/ b_n$, for large $n$.
   At real parameters, with $Delta \( t \) = H - h_X \( t \)$,
#[#set math.equation(numbering: n => "(6.21)")
 $ sup_(\| T \| lt.eq T_1) frac(Delta \( T d_n \/ b_n \), d_n) arrow.r 0 . $ <cone:quiet-width>]

]
  + #emph[The hypotheses in (ii) are impossible if $b_n$ stays bounded.
    In fact a vanishing weighted cone bound down to a sufficiently small fixed positive depth ratio already gives
    this contradiction.]
] <cor:quiet-cone>

#proof[
  For (i), apply 34 with its starting scale a fixed large multiple of $d_n$ and with $r$ a sufficiently small
    fixed multiple of $d_n \/ b_n$. Then its $B$ is bounded by a constant times $b_n d_n^(alpha - 1)$,
    which gives (6.19). Increasing the fixed starting multiple permits any prescribed bounded interval of $T$.
  For (ii), choose $beta$ with $1 \/ 2 < beta < alpha$. On a rescaled cone put $D = delta_s \/ d_n$.
    The weighted norm to be made small is $D^beta \( d_n \/ b_n \) M$.
    On a compact range of $D$ it tends to zero by (6.20); on the tail $D gt.eq R$,
    (6.18) bounds it by $C R^(beta - alpha)$. First take $R$ large, then $n$ large.
    This proves a vanishing weighted bound down to every fixed positive depth ratio.
    Apply 34 with a small fixed multiple of $c_1 d_n$ as its scale and a large enough fixed multiple of $T_1
    d_n \/ b_n$ as its radius. Its ratio $r \/ d$ is bounded because $b_n gt.eq 1$.
    The resulting relative error tends to zero. The real no-patch transfer gives $h_X \( t \) gt.eq H -
    c_1 d_n$ uniformly in the stated real interval. Since $c_1$ is arbitrary and $h_X lt.eq H$, this proves (6.21).
  For (iii), boundedness of $b_n$ turns the vanishing weighted bound into the same statement with normalization
    $d_n M$. Use 34 with starting scale $d_n \/ 20$, radius $2 d_n$, and target aperture at least $50$.
    Its hypotheses need only hold down to a fixed smaller depth ratio.
    We obtain the shifted impact data needed on the boundaries of the disks
  #[#set math.equation(numbering: n => "(6.22)")
   $ t = d_n zeta \, wide y = x_n + upright(i) sigma - frac(upright(i) d_n, 4) zeta^2 + w \, quad \| zeta \| lt.eq
     1 \, $ <cone:quiet-disks>]
  where $w$ is small and $sigma$ rises from $H - 4 d_n$ to $H$.
    On upper imaginary parameter arcs, recover $L \( y \, t \)$ from the preceding two impacts, at phases $y -
    t \/ 2$ and $y - 3 t \/ 2$, and reflection at the nearer impact. On lower arcs use the two forward impacts.
    These are meromorphic identities in the line and point data,
    so exceptional affine configurations are covered by continuation.
    At $sigma = H$, $w = 0$, and $zeta = e^(upright(i) theta)$, the nearer of the two selected impacts has depth
  $ d_n (frac(1 - 2 sin^2 theta, 4) + frac(\| sin theta \|, 2)) gt.eq d_n / 4 . $
  The farther one is deeper, and all horizontal shifts fit the fixed aperture.
    On overlaps near real parameter directions both constructions agree with the primary line by continuation from
    below. At the starting height the full disks have the necessary impact data.
    The meromorphic disk-continuation principle therefore fills (6.22) up to $sigma = H$.
    At their centers it gives a joint patch of $L$ through $\( x_n + upright(i) H \, 0 \)$,
    attached to the primary zero-parameter data, contrary to 24. ◻
]

#thm([Proposition 6.6.])[
  (Subcritical growth is impossible).  #emph[At a finite shape edge,
    a uniform bound $max_(Im s = H - delta) M \( s \) = O \( delta^(- p_0) \)$ with $p_0 <
    1$ is impossible in the nonisotropic alternative.]
] <prop:subcritical-exclusion>

#proof[
  Choose $alpha$ with $max { p_0 \, 1 \/ 2 } < alpha < 1$. On any cone with $delta_s gt.eq d$,
  $ d M \( s \) lt.eq C d^(1 - p_0) \( d \/ delta_s \)^alpha \( delta_s \/ d \)^(alpha - p_0) . $
  More directly, the weighted quantity $d M \( s \) \( delta_s \/ d \)^alpha$ is bounded by $C d^(1 - alpha)
    delta_s^(alpha - p_0)$, which tends to zero uniformly for depths between any fixed multiple of $d$ and the
    fixed starting row. Thus 36(iii) applies with $b = 1$, giving a contradiction. ◻
]

#thm([Proposition 6.7.])[
  (A witness near every center).  #emph[Suppose, for all sufficiently small $delta_s$, that
$ delta_s max_(Im s = H - delta_s) M \( s \) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 +
  log \( 1 \/ delta_s \) #scale(x: 120%, y: 120%)[\)]^A $

 for some fixed $C \, A$. Then there are constants $L \, C_1 \, C_2 \,
   c_(*) > 0$ such that for every sufficiently large $k = log \( 1 \/ d \)$ and every real center $x_0$,
   there is a point $s$ with
#[#set math.equation(numbering: n => "(6.23)")
 $ \| Re s - x_0 \| lt.eq L delta_s \, wide k - C_1 log k lt.eq log \( 1 \/ delta_s \) lt.eq k + C_2 \, wide
   delta_s M \( s \) gt.eq c_(*) . $ <cone:witness-window>]

]
] <cone:no-quiet-witness>

#proof[
  Fix $1 \/ 2 < alpha < 1$ and the cone aperture needed in the bounded-scale quiet contradiction.
    Choose $C_2$ so that $e^(- C_2) d$ is below all the fixed depth ratios required there,
    and then choose $C_1 > A \/ \( 1 - alpha \)$. If no uniform $c_(*)$ exists, there are $k_n arrow.r
    oo$ and centers such that $sup delta_s M \( s \) arrow.r 0$ in their windows. On that window,
  $ d_n M \( s \) \( delta_s \/ d_n \)^alpha = delta_s M \( s \) \( d_n \/ delta_s \)^(1 - alpha) arrow.r 0 $
  uniformly, because the last factor is at most $e^(\( 1 - alpha \) C_2)$.
    Below the window, where $delta_s \/ d_n gt.eq k_n^(C_1)$, the global polynomial bound gives
  $ delta_s M \( s \) \( d_n \/ delta_s \)^(1 - alpha) lt.eq
    C' \( 1 + k_n \)^A k_n^(- C_1 \( 1 - alpha \)) arrow.r 0 . $
  The remaining fixed lower-strip portion has bounded $M$ and is smaller still.
    This is the vanishing cone bound forbidden by 36(iii), with $b_n = 1$. ◻
]

=== 6.5 Exclusion of finite superlinear growth <exclusion-of-finite-superlinear-growth>

#thm([Theorem 6.8.])[
  (Exclusion of finite superlinear growth).  #emph[Suppose $H < oo$, and define
$ g \( k \) = log max_(Im s = H - e^(- k)) M \( s \) . $

 In the nonisotropic alternative it is impossible that
#[#set math.equation(numbering: n => "(6.24)")
 $ 1 < limsup_(k arrow.r oo) frac(g \( k \), k) < oo . $ <cone:finite-order-assumption>]

]
] <thm:finite-superlinear-exclusion>

#proof[
  Write the limsup in (6.24) as $rho$, and fix
  $ 1 < alpha_1 < alpha_2 < rho < P . $
  We first select scales with useful bounds on both sides. There are $k_n arrow.r oo$ such that $g \( k_n \) gt.eq
    alpha_2 k_n$ and
  #[#set math.equation(numbering: n => "(6.25)")
   $ g \( k \) lt.eq g \( k_n \) +
     cases(delim: "{", alpha_1 \( k - k_n \) \, & k_0 lt.eq k lt.eq k_n \,, P \( k - k_n \) \, & k gt.eq k_n .)
     $ <cone:two-sided-envelopes>]
  Here $k_0$ is fixed and sufficiently large. To prove this,
    take arbitrarily late running records $r_n$ of $g \( k \) -
    alpha_1 k$ for which $g \( r_n \) \/ r_n > alpha_2$. Such records exist:
    a time with $g \( k \) > alpha_2 k$ forces the preceding running maximum to occur at a time $r lt.eq
    k$ with $g \( r \) - alpha_1 r > \( alpha_2 - alpha_1 \) k gt.eq \( alpha_2 - alpha_1 \) r$.
    The maximizing times tend to infinity. Since $P > rho$, the function $g \( k \) - P k$ tends to $- oo$;
    let $k_n gt.eq r_n$ maximize it on $\[ r_n \, oo \)$. For $k gt.eq
    k_n$ this gives the second inequality in (6.25). If $r_n lt.eq k lt.eq k_n$, it gives $g \( k \) lt.eq
    g \( k_n \) + P \( k - k_n \) lt.eq g \( k_n \) + alpha_1 \( k - k_n \)$.
    For $k lt.eq r_n$, combine the record bound with $g \( k_n \) gt.eq g \( r_n \) + P \( k_n - r_n \)$,
    obtaining the first inequality again. The same last inequality gives $g \( k_n \) gt.eq alpha_2 k_n$.
  Set
  #[#set math.equation(numbering: n => "(6.26)")
   $ d_n = e^(- k_n) \, wide m_n = e^(g \( k_n \)) \, wide b_n = d_n m_n . $ <cone:superlinear-scales>]
  Then $b_n arrow.r oo$, and in fact
  #[#set math.equation(numbering: n => "(6.27)")
   $ frac(b_n, log m_n) arrow.r oo \, $ <cone:b-dominates-log>]
  because $b_n gt.eq e^(\( alpha_2 - 1 \) k_n)$, whereas $log m_n = O \( k_n \)$.
  #emph[Compact profiles and a trivial pair.] For any choice of real centers $x_n$,
    introduce the rescaled shape coordinate $S = \( s - x_n - upright(i) H \) \/ d_n$ and fields
  #[#set math.equation(numbering: n => "(6.28)")
   $ F_n \( S \) = frac(f \( x_n + upright(i) H + d_n S \), m_n) \, wide Q_n \( S \) =
     frac(q \( x_n + upright(i) H + d_n S \), m_n^2) . $ <cone:superlinear-profiles>]
  Their domains exhaust the lower half-plane. The envelopes give, with $D = - Im S$,
  #[#set math.equation(numbering: n => "(6.29)")
   $ max { \| F_n \( S \) \| \, \| Q_n \( S \) \|^(1 \/ 2) } lt.eq
     cases(delim: "{", D^(- alpha_1) \, & D gt.eq 1 \,, D^(- P) \, & 0 < D lt.eq 1 \,) $ <cone:profile-envelope>]
  on every fixed compact set for all large $n$. These bounds are uniform in all real centers.
    Montel’s theorem gives subsequential holomorphic limits $F \, Q$. The rescaled differential equation is
  #[#set math.equation(numbering: n => "(6.30)")
   $ F''_n = b_n^2 Q_n F_n . $ <cone:profile-ode>]
  Cauchy estimates bound the left side locally, so $F Q = 0$.
    Since the half-plane is connected, either $F equiv 0$ or $Q equiv 0$.
    Every limit also satisfies the deeper bound $D^(- alpha_1)$ in (6.29).
  We claim that some sequence of centers, after passage to a subsequence, has $F = Q = 0$. Suppose otherwise.
    Fix a small closed disk about $- upright(i)$ inside the half-plane and take the supremum norms of the two
    fields on it. Compactness then gives a constant $c > 0$ such that, for all centers and large $n$,
    the larger of the two norms is at least $c$. Otherwise a sequence with both norms tending to zero would have
    the zero pair as its limit everywhere, by analytic uniqueness.
    Purity and compactness likewise imply that the smaller norm tends to zero uniformly over centers:
    any contrary sequence would have a limiting pair with both norms positive.
    The norms depend continuously on the center. Once their smaller value is less than $c \/ 3$,
    the two possible dominant types give disjoint open sets covering the connected circle of centers.
    Thus one type holds at every center. Passing to a subsequence, it is the same type for every $n$.
  Suppose first that it is the $F$-type. All local limiting functions $F$ obtained from arbitrary centers are
    nonzero. This compact family has a uniform bound on the number of zeros in any fixed smaller disk about $-
    upright(i)$, and, for every fixed small $eta > 0$, a uniform positive lower bound away from the
    $eta$-neighborhoods of those zeros. Here is a direct compactness justification.
    A convergent subsequence has a nonzero holomorphic limit;
    choose a slightly larger circle without zeros of that limit.
    The argument principle bounds the number of zeros inside,
    and uniform convergence bounds the function below on a smaller compact set away from the zeros.
    A failure of either uniform assertion would produce a contrary convergent subsequence.
    The same assertions hold on the slightly enlarged scaled neighborhoods needed to cover a narrow band about the
    row $D = 1$.
  Cover the physical periodic row at depth $d_n$ by $O \( d_n^(- 1) \)$ cells of size comparable to $d_n$.
    Around its nearby zeros remove disks of radii between $eta d_n$ and $2 eta d_n$,
    with generic radii to avoid boundary tangencies. Choose $eta$ sufficiently small in terms of the uniform local
    zero count. Every connected cluster meeting the row then has a uniformly bounded number of disks and diameter
    much smaller than $d_n$. Indeed, a minimal chain escaping a fixed enlarged cell would require more zeros in
    that cell than the uniform bound allows. Fill holes in the clusters and discard nested obstacles.
    Detour the row along the outer boundary arcs of these clusters.
    The resulting closed contour $C_n$ winds once around the periodic cylinder,
    stays in a fixed narrow band about depth $d_n$, and satisfies
  #[#set math.equation(numbering: n => "(6.31)")
   $ "length" \( C_n \) = O \( 1 \) \, wide \| f \| gt.eq c_eta m_n quad upright("on ") C_n . $ <cone:large-f-contour>]
  The length estimate follows because the total number of relevant zero disks is $O \( d_n^(- 1) \)$,
    each with circumference $O \( d_n \)$.
  All poles of $f^(- 2)$ in the shape strip are at simple zeros of $f$.
    At such a zero $z$, 30 gives $f'' \( z \) = 0$, and hence
  $ "Res"_z \( f^(- 2) \) = - frac(f'' \( z \), f' \( z \)^3) = 0 . $
  Deforming $C_n$ to the real period, with residues included, therefore gives
  $ integral_(C_n) frac(thin upright(d) s, f \( s \)^2) = integral_0^(2 pi) frac(thin upright(d) s, f \( s \)^2) > 0 . $
  The right side is a fixed positive number because $f$ is positive on the real curve.
    The absolute value of the left side is $O \( m_n^(- 2) \)$ by (6.31). This is a contradiction.
  Suppose next that the common type is the $Q$-type. There are centers $x_n$ with
  #[#set math.equation(numbering: n => "(6.32)")
   $ \| f \( x_n + upright(i) \( H - d_n \) \) \| gt.eq c_0 > 0 . $ <cone:f-lower-center>]
  Indeed the horizontal mean of $log \| f \|$ is convex as a function of height,
    by subharmonicity and periodicity. It is even by real symmetry, so it is at least its finite real-row value.
    At least one point on each row has modulus no smaller than the exponential of that mean.
    Zeros cause no difficulty because $log \| f \|$ is locally integrable.
    At these centers pass to a subsequence with $Q_n arrow.r Q equiv.not 0$.
  Near a point where $Q eq.not 0$, choose a unit complex number $e$ and a fixed short segment in direction $e$ on
    which $Re \( e^2 Q_n \) gt.eq c' > 0$ for all large $n$. On that segment, with real parameter $v$,
    the nonnegative function $u \( v \) = \| F_n \( z + e v \) \|^2$ satisfies
  $ u'' = 2 \| e F'_n \|^2 + 2 b_n^2 Re \( e^2 Q_n \) \| F_n \|^2 gt.eq 2 c' b_n^2 u . $
  The endpoint values are uniformly bounded by normality. Comparison with the solution of $v'' =
    2 c' b_n^2 v$ having those endpoint bounds shows, on a shorter central segment, $u lt.eq C e^(- c b_n)$.
    To justify comparison, subtract that solution; a positive interior maximum of the difference contradicts
    $w'' - 2 c' b_n^2 w gt.eq 0$. The same estimate holds uniformly on a small neighborhood of the chosen point.
  Choose a circle centered at $- upright(i)$, contained in the half-plane,
    and avoiding the discrete zero set of $Q$. A finite cover by these neighborhoods gives $\| F_n \| lt.eq
    C e^(- c b_n)$ on the circle, after changing $c$. Maximum modulus gives the same bound at its center. Therefore
  $ \| f \( x_n + upright(i) \( H - d_n \) \) \| lt.eq C m_n e^(- c b_n) arrow.r 0 $
  by (6.27), contradicting (6.32). Both common types are impossible, proving the existence of trivial profiles.
  #emph[A global width bound and a nontrivial limiting lift.] Use the centers with the trivial pair in 36(ii).
    The bound (6.29) is stronger on the coarse tail than its hypothesis, since $alpha_1 > 1$;
    it may be weakened to any exponent between $1 \/ 2$ and $1$. Since $d_n \/ b_n = 1 \/ m_n$, we obtain
  #[#set math.equation(numbering: n => "(6.33)")
   $ h_X \( T \/ m_n \) gt.eq H - o \( d_n \) $ <cone:superlinear-width>]
  uniformly for $T$ in each fixed bounded real interval. This is a global row width.
    We may therefore choose new centers $x_n$ attaining the row maximum that defines $m_n$.
    At these centers extract limits $F \, Q$. They are pure, and they are not both zero because
  $ max { \| F_n \( - upright(i) \) \| \, \| Q_n \( - upright(i) \) \|^(1 \/ 2) } = 1 . $
  Fix a real $T eq.not 0$. Define, now as a function of the rescaled phase coordinate $Y$,
  $ S_n \( Y \) = frac(frak(s) \( x_n + upright(i) H + d_n Y \, T \/ m_n \) - x_n - upright(i) H, d_n) . $
  By (6.33), its phase domains exhaust $Im Y < 0$. By the shape constraint in 29, $Im S_n < 0$.
    For any $1 \/ 2 < alpha < 1$, the coarse cone estimate anchors these half-plane-valued functions on deep
    compact sets:
  #[#set math.equation(numbering: n => "(6.34)")
   $ \| S_n \( Y \) - Y \| lt.eq C_T D^(1 - 2 alpha) \, wide D = - Im Y gt.eq D_T \, $ <cone:deep-anchor>]
  on the fixed compact portions under consideration, with constants uniform in horizontal position.
    To obtain such uniform constants, apply the cone theorem at each real center;
    the row bounds and the lower-strip data are the same at every center.
  Map the target half-plane conformally to the unit disk. Montel’s theorem then gives a subsequential limit.
    The anchor excludes convergence to a boundary constant or infinity,
    so the limit is a holomorphic map $S$ of the entire lower half-plane into itself.
    Passing to the limit in (6.34) gives the same anchor for $S$.
  #emph[The limiting energy equation.] Set $h_n = T \/ b_n$, which tends to zero. Then
  $ J_n \( Y \) = frac(S_n \( Y + h_n \) - S_n \( Y \), h_n) arrow.r S_Y \( Y \) $
  locally analytically. On a sufficiently deep half-plane, the cone estimates and Cauchy estimates keep these
    steps close to $1$ and the fast fields small. The exact recurrence holds there with its continued glancing
    root, also jointly for $T$ along the segment from $0$ to the fixed value chosen.
    This segment, begun at $T = 0$ in the deep small-field regime, selects the fixed sheet required by 33;
    no additional loop is used. Let $p_n \( A \, J \)$ denote the normalized action with rescaled shape basepoint
    $A$. Its fast fields are
  $ T F_n \( A + h_n u \) \, wide T^2 Q_n \( A + h_n u \) . $
  They converge analytically to the frozen fields $T F \( A \)$, $T^2 Q \( A \)$.
    By 33, the actions and their derivatives converge analytically to
  $ p \( A \, J \) =
    cases(delim: "{", p_F \( T F \( A \) \, J \) \, & Q equiv 0 \,, p_Q \( lambda \( A \) \, J \) \, quad
    lambda \( A \)^2 = T^2 Q \( A \) \, & F equiv 0 .) $
  The second expression depends analytically on $lambda^2$ near zero, so no choice of a square root is needed there.
  In these coordinates (6.6) reads
  $ p_(n \, J) \( S_n \( Y \) \, J_n \( Y \) \) - p_(n \, J) \( S_n \( Y - h_n \) \, J_n \( Y - h_n \) \) =
    h_n p_(n \, A) \( S_n \( Y \) \, J_n \( Y \) \) . $
  Division by $h_n$ is legitimate without any rate of convergence assumption.
    Indeed, if $G_n \( Y \) = p_(n \, J) \( S_n \( Y \) \, J_n \( Y \) \)$, then
  $ frac(G_n \( Y \) - G_n \( Y - h_n \), h_n) = integral_0^1 G'_n \( Y - theta h_n \) thin thin upright(d) theta \, $
  and analytic convergence gives convergence of $G'_n$. The limit is consequently the Euler–Lagrange equation
  $ partial_Y p_J \( S \, S_Y \) = p_A \( S \, S_Y \) . $
  For $E \( A \, J \) = J p_J \( A \, J \) - p \( A \, J \)$, the chain rule now gives
  $ partial_Y E \( S \, S_Y \) = S_Y #scale(x: 120%, y: 120%)[\(] partial_Y p_J \( S \, S_Y \) -
    p_A \( S \, S_Y \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  The deep decay of the fields and the anchor, with Cauchy estimates, give $S_Y arrow.r 1$ as $D arrow.r oo$.
    Hence the constant is
  #[#set math.equation(numbering: n => "(6.35)")
   $ E \( S \, S_Y \) = 1 / 12 . $ <cone:limiting-energy>]
  The stronger exponent $alpha_1$ now improves the anchor. At $\( lambda \, J \) = \( 0 \, 1 \)$,
    both frozen energies have $E_J = 1 \/ 4$; their first field correction is quadratic by (6.9)–(6.9).
    The analytic implicit function theorem applied to (6.35), together with (6.29), yields
  $ \| S_Y - 1 \| lt.eq C_T D^(- 2 alpha_1) $
  on a deeper half-plane. The argument of the fields is $S \( Y \)$,
    whose depth is comparable to $D$ by the original anchor. Integrate along vertical lines from infinity,
    where the original anchor makes $S - Y$ tend uniformly to zero. We obtain
  #[#set math.equation(numbering: n => "(6.36)")
   $ \| S \( Y \) - Y \| lt.eq C_T D^(1 - 2 alpha_1) = o \( D^(- 1) \) . $ <cone:improved-anchor>]
  #emph[Half-plane rigidity and the contradiction.] Put $v \( Y \) = Im \( Y - S \( Y \) \)$.
    It is harmonic and satisfies $v gt.eq - D$, since $S$ maps into the lower half-plane.
    We verify carefully that $v gt.eq 0$. On a slab $epsilon < D < R$, its top boundary is bounded below by $-
    epsilon$, and its bottom boundary is bounded below by $- eta_R$, where $eta_R =
    sup_x \| S \( x - upright(i) R \) - \( x - upright(i) R \) \| arrow.r 0$.
    Compare on finite rectangles with the harmonic function interpolating these two constants on the horizontal
    sides. The extra negative contribution needed on the vertical sides is bounded by a constant depending on $R$
    times their harmonic measure, because $v gt.eq - R$ in the slab.
    Their harmonic measure tends to zero when the sides move to infinity. Thus
  $ v \( Y \) gt.eq - epsilon frac(R - D, R - epsilon) - eta_R frac(D - epsilon, R - epsilon) . $
  First let $epsilon arrow.b 0$, then $R arrow.r oo$, to get $v gt.eq 0$.
    Harnack’s inequality in the half-plane gives, for $R gt.eq 1$,
  $ v \( - upright(i) R \) gt.eq R^(- 1) v \( - upright(i) \) . $
  For example, this is the ordinary disk Harnack inequality after mapping $- upright(i)$ to the origin, since $-
    upright(i) R$ has disk modulus $\( R - 1 \) \/ \( R + 1 \)$. By (6.36) its left side is $o \( R^(- 1) \)$.
    Hence $v \( - upright(i) \) = 0$, and the strong minimum principle gives $v equiv 0$.
    The holomorphic function $S - Y$ is therefore real constant; the anchor makes that constant zero.
    We have proved $S \( Y \) = Y$.
  Finally, set $J = 1$ in (6.35). Deep down the field parameter is small, and the energy expansions are
  $ E_F \( lambda \, 1 \) - 1 / 12 = - lambda^2 / 480 + O \( lambda^4 \) \, wide E_Q \( lambda \, 1 \) - 1 /
    12 = - lambda^2 / 60 + O \( lambda^4 \) . $
  Each right side can vanish near zero only when $lambda^2 = 0$.
    Since $T eq.not 0$, the surviving pure field vanishes on a deep open set, and hence identically.
    This contradicts its normalization at $- upright(i)$, proving the Theorem. ◻
]

== 7 Exponential profiles and exclusion of infinite growth <sec:profiles>

Throughout this Section we are in the nonisotropic, noncircular case of 29.
  Thus $f = phi.alt'$ and $q = f'' \/ f$ are holomorphic on $D_H = { s : \| Im s \| < H }$,
  where $H$ may be infinite, and

$ M \( s \) = max { \| f \( s \) \| \, \| q \( s \) \|^(1 \/ 2) } . $

The impact lift is denoted by $frak(s) \( y \, t \)$. Its normalization is $frak(s) \( y \, 0 \) = y$,
  and it is even in $t$. We shall exclude a particular pair of rapidly varying field profiles.
  The point of retaining both profiles in the statement is that the second can occur even when the normalized
  first field tends to zero.

#thm([Theorem 7.1.])[
  (Exponential-profile obstruction).  #emph[There is no sequence of centers $s_n = x_n + upright(i) h_n in D_H$,
    length scales $ell_n > 0$, and field scales $m_n > 0$ with the following properties. Put $b_n = ell_n m_n$ and
#[#set math.equation(numbering: n => "(7.1)")
 $ F_n \( S \) = frac(f \( s_n + ell_n S \), m_n) \, wide Q_n \( S \) = frac(q \( s_n + ell_n S \), m_n^2) \, wide
   Y = frac(y - s_n, ell_n) \, quad T = m_n t . $ <profile:scales>]

 Assume that $b_n arrow.r oo$, that $\( D_H - s_n \) \/ ell_n$ exhausts $bb(C)$, and that,
   locally uniformly on $bb(C)$, either
#[#set math.equation(numbering: n => "(7.2)")
 $ \( F_n \, Q_n \) arrow.r \( c_0 e^(- upright(i) S) \, 0 \) quad
   upright("or") quad \( F_n \, Q_n \) arrow.r \( 0 \, c_0^2 e^(- 2 upright(i) S) \) \, wide
   c_0 eq.not 0 . $ <profile:exponential-pairs>]

 The following additional assumptions are imposed according to the value of $H$.]
  + #emph[If $H < oo$, then $h_n arrow.r H$, $ell_n arrow.r 0$,
    and there are $alpha_0 in \( 1 \/ 2 \, 1 \)$ and $delta_b in \( 0 \, H \/ 2 \)$ such that,
    for every fixed $L < oo$, there is a constant $C_L$ for which eventually
#[#set math.equation(numbering: n => "(7.3)")
 $ M \( s \) lt.eq C_L m_n (ell_n / delta)^(alpha_0) \, wide ell_n lt.eq delta = h_n - Im s lt.eq delta_b \,
   quad \| Re s - x_n \| lt.eq L delta . $ <profile:coarser-cone>]

 The exponent is independent of $L$; the constant and the eventual sequence threshold may depend on $L$.]
  + #emph[If $H = oo$, then $h_n arrow.r oo$, $0 < ell_n lt.eq C$,
    and (7.3) holds with a single constant for all horizontal positions and for $ell_n lt.eq delta lt.eq h_n$. Moreover,
#[#set math.equation(numbering: n => "(7.4)")
 $ log \( 1 + h_n \/ ell_n \) = o \( log m_n \) . $ <profile:entire-log-condition>]

]
] <thm:exponential-obstruction>

The proof has three parts. First we initialize the lift far below the center height,
  including at complex parameters. Next we identify its unique limiting equation and a branch point of its
  solution. Finally, we use real-parameter width continuation to make that branch point incompatible with a
  single-valued impact lift.

=== 7.1 Joint deep data <joint-deep-data>

For a local continuation of the lift define

$ S_n \( Y \, T \) = frac(frak(s) \( s_n + ell_n Y \, T \/ m_n \) - s_n, ell_n) . $

A continuation is said to be reached vertically if its germs are obtained along the vertical segment with the
  horizontal position and parameter fixed, starting in known lower data.
  Such germs agree on overlapping neighborhoods: a finite chain of neighborhoods along the segment compares any
  two sufficiently close vertical paths.

#thm([Lemma 7.2.])[
  (Deep passages).  #emph[Assume the hypotheses in 40, without assuming its conclusion.
    Fix $alpha in \( 1 \/ 2 \, alpha_0 \)$ and $T_0 < oo$. There are $D_0$ and $C$,
    independent of the fixed aperture $A$, with the following property.
    For every fixed $A < oo$, and eventually in $n$, there are joint holomorphic vertical passages on compact subsets of
#[#set math.equation(numbering: n => "(7.5)")
 $ D = - Im Y > D_0 \, wide \| Re Y \| < A D \, wide \| T \| < T_0 \, $ <profile:deep-domain>]

 and
#[#set math.equation(numbering: n => "(7.6)")
 $ \| S_n \( Y \, T \) - Y \| lt.eq C \| T \|^2 D^(1 - 2 alpha) . $ <profile:deep-estimate>]

 These passages start in the actual lift domain and remain in the shape strip.
   Their eventual sequence threshold may depend on $A$ and on the compact subset.]
] <profile:deep-data>

#proof[
  We first make a uniformity observation. With $D = delta \/ ell_n$, weakening the exponent in (7.3) gives
  $ D^alpha M \/ m_n lt.eq C_L D^(- \( alpha_0 - alpha \)) . $
  For each fixed $L$, this is bounded by an absolute constant beyond a finite depth threshold depending on $L$.
    On the remaining finite cone, (7.2) supplies the same bound eventually:
    the limiting value of $M \/ m_n$ is $\| c_0 \| e^(- D)$, independent of the horizontal position.
    Consequently the weakened cone bound can have a constant independent of $L$,
    provided its eventual sequence threshold is allowed to depend on $L$.
    This permits the choice of $D_0$ before a large aperture.
  Suppose first that $H < oo$. Choose $D_0 gt.eq 10$, so the required input depth $d \/ 10$ is at least $ell_n$.
    Apply 34 and its reference-height formulation in 35 with reference height $h_n$, rather than $H$, and with
  $ d = ell_n D_0 \, wide r = frac(2 T_0, m_n) \, wide epsilon = C' T_0 D_0^(- alpha) . $
  The cone hypothesis is exactly $r M lt.eq epsilon \( d \/ delta \)^alpha$.
    Since $r \/ d = 2 T_0 \/ \( b_n D_0 \) arrow.r 0$, the fixed ratio allowance in that theorem can be chosen to
    be one. Its auxiliary bound satisfies
  $ B = 1 + \( epsilon \/ r \) d^alpha lt.eq C m_n ell_n^alpha . $
  Here $m_n ell_n^alpha arrow.r oo$, since $b_n arrow.r oo$ and $ell_n arrow.r 0$.
    The physical displacement estimate, divided by $ell_n$, is therefore (7.6).
    Increasing $D_0$ makes the required smallness conditions hold.
    The starting slab lies in a fixed strict substrip of the original shape strip.
    The relative displacement is small compared with the depth below $h_n$;
    in particular the image remains in $D_H$. This use of an auxiliary reference height needs no no-patch
    assertion at that height. The aperture assertion of 34, together with the preceding weakening argument,
    gives the stated independence of $D_0 \, C$ from $A$.
  We provide the initializer needed when $H = oo$, because the starting height is then unbounded.
    Retain the same $d \, r$, and put $B = C m_n ell_n^alpha$. All horizontal ranges may now be used.
    Condition (7.4) implies
  #[#set math.equation(numbering: n => "(7.7)")
   $ r \( h_n \/ d \)^alpha arrow.r 0 \, wide B h_n^(- alpha) arrow.r oo . $ <profile:entire-start-smallness>]
  Thus the known data near $Im y = 0$ have uniformly small parameters over the entire range that will be used.
  Consider first $\| Im t \| gt.eq gamma \| t \|$, with a fixed steep cutoff $gamma > 0$.
    Use the upward increment $t$ or $- t$, as appropriate. The normalized chord recurrence and kernel estimates in
    34 apply along the segment from the real-row slab to depth $delta gt.eq d \/ 2$, for $\| t \| lt.eq
    10 r \( delta \/ d \)^alpha$. Indeed the fast fields are small there after increasing $D_0$,
    while $\| t \| \/ delta$ is bounded. Local Cauchy disks have radius a fixed fraction of the depth.
    Any part of a thickening slightly below the real row is covered by real symmetry and the comparable bound
    above that row. The recurrence estimates, with $x$ denoting the current depth, are
  $ \| J - 1 \| lt.eq C \| t \|^2 B^2 x^(- 2 alpha) \, wide \| frak(s) - y \| lt.eq C \| t \|^2 B^2 x^(1 - 2 alpha) . $
  To see the accumulation directly, the change of normalized step is $O \( \| t \|^3 B^2 x^(- 2 alpha - 1) \)$.
    Summation over rows separated by a constant multiple of $\| t \|$ gives the first estimate,
    and a second summation gives the second because $2 alpha > 1$.
    Initial step and position errors of order $\| t \|^2$ contribute at most $C \|
    t \|^2 \( 1 + h_n \)$ to the latter. This is absorbed, uniformly at all $delta lt.eq h_n$, because
  $ B^2 h_n^(1 - 2 alpha) \/ \( 1 + h_n \) arrow.r oo $
  by (7.7). The small relative-error induction consequently closes.
    Choosing the number of backward steps locally constantly, with two starting entries inside the known slab,
    gives holomorphic germs. Different choices agree by the exact recurrence and uniqueness of its nearby root.
  It remains to initialize all parameter directions at large depths. Fix a large constant $K_0$.
    At a target depth $h_n \/ K_0 lt.eq delta lt.eq h_n$, set $R_t = r \( delta \/ d \)^alpha$.
    For $\| t_c \| < R_t$ consider
  #[#set math.equation(numbering: n => "(7.8)")
   $ t' = t_c + 3 R_t zeta \, wide y = x + upright(i) sigma + sigma g \( zeta \) \, wide 0 lt.eq sigma lt.eq h_n -
     delta \, quad g \( 0 \) = 0 . $ <profile:entire-initializer>]
  Choose a smaller fixed steep cutoff for this initializer.
    On the unit circle the nonsteep arcs for $t'$ are uniformly short:
    the circle has radius $3 R_t$, its center has modulus at most $R_t$,
    and its intersections with a sufficiently narrow horizontal sector are transverse.
    We choose a smooth real boundary function of mean zero which equals $-
    1$ on these arcs and slightly larger collars, is nowhere below $- 1$, and is at most $1 \/ \( 6 K_0 \)$.
    This is possible by making the arcs sufficiently short and balancing the negative bumps by a small positive
    part. Approximate it, with its mean removed, by a real trigonometric polynomial with error $o \( 1 \/ h_n \)$.
    It is the boundary imaginary part of a holomorphic polynomial $g$ with $g \( 0 \) = 0$. In particular,
  $ 1 + Im g = o \( 1 \/ h_n \) med upright("on the nonsteep collars") \, wide - o \( 1 \/ h_n \) lt.eq 1 +
    Im g lt.eq 1 + 1 \/ \( 3 K_0 \) $
  on the whole circle. The smooth bumps can be chosen with uniform smooth bounds before approximation,
    so $g$ is uniformly bounded; its degree need not be fixed.
  On the nonsteep collars, (7.8) lands in the original fixed real-row neighborhood.
    On the other arcs its depth is at least $delta - h_n \/ \( 3 K_0 \) gt.eq 2 delta \/ 3$,
    and the steep estimates just proved apply, or the point is still in the base neighborhood.
    All parameter sizes tend to zero by (7.7). These boundary germs glue as vertical continuations from below.
  Here and in subsequent disk fillings we use the following explicit holomorphic continuation argument.
    Pull the boundary data back to a thin annulus about $\| zeta \| = 1$,
    times a complex neighborhood of the center path. Their negative Laurent coefficients in $zeta$ are holomorphic
    functions of the center variables. Initially the full disks lie in known data,
    so all those coefficients vanish. The identity theorem makes them vanish along the whole connected center
    path. The nonnegative Laurent series fills each disk and gives joint holomorphic center germs.
    Applied to $\( frak(s) - y \) \/ \( t' \)^2$, which is regular at $t' = 0$ in the initial data,
    the maximum principle transfers the boundary estimate to the disk center.
    Small complex changes of $sigma \, t_c$ are allowed by the strict margins above,
    so these really are joint germs. This proves the all-direction estimate for $h_n \/ K_0 lt.eq delta lt.eq
    h_n$, with constants independent of $h_n$.
  The dyadic disk construction in 34 now continues it from $h_n \/ K_0$ to $d$.
    Choose $K_0$ first so large that its previous-band dips and starting slabs remain at positive heights.
    No factor accumulates with the number of bands: the exponent $1 -
    2 alpha < 0$ makes the estimates on the deeper, previously known arcs strictly smaller,
    whereas the steep-arc estimates have an independent fixed constant.
    Fix both steep cutoffs and $K_0$, and only then increase $D_0$ to meet their smallness requirements.
    After scaling by $ell_n$, the result is (7.6). In the infinite-width case the shape constraint is automatic.
    This completes both cases. ◻
]

=== 7.2 The unique limiting energy equation <the-unique-limiting-energy-equation>

We use the normalized chord action from 32. Its frozen versions, with the quotients continued at zero, are

#[#set math.equation(numbering: n => "(7.9)")
 $ p_F \( lambda \, J \) & = J / lambda^2 - frac(2 sin \( lambda J \/ 2 \), lambda^3) \, &
   E_F \( lambda \, J \) & = frac(2 \( sin z - z cos z \), lambda^3) \,\
p_Q \( lambda \, J \) & = frac(J, 2 lambda^2) - frac(tanh \( lambda J \/ 2 \), lambda^3) \, &
  E_Q \( lambda \, J \) & = frac(tanh z - z "sech"^2 z, lambda^3) \, wide z =
  lambda J \/ 2 . $ <profile:frozen-actions>]

Here $E = J p_J - p$. In the first case the frozen fast fields are $\( lambda \, 0 \)$,
  and in the second they are $\( 0 \, lambda^2 \)$.

#thm([Lemma 7.3.])[
  (Deep model and its uniqueness).  #emph[On the deep domains of 41, the passages converge locally uniformly,
    with derivatives, to a unique holomorphic model $S_(*) \( Y \, T \)$.
    With $lambda = T c_0 e^(- upright(i) S_(*))$ and $J = partial_Y S_(*)$, it satisfies
#[#set math.equation(numbering: n => "(7.10)")
 $ E_F \( lambda \, J \) = 1 \/ 12 quad upright("or") quad E_Q \( lambda \, J \) = 1 \/ 12 \,
   $ <profile:energy-equation>]

 respectively, and $S_(*) - Y arrow.r 0$, $J arrow.r 1$ as $- Im Y arrow.r oo$ in each fixed cone.]
] <profile:energy-model>

#proof[
  The deep estimates and Cauchy’s inequalities give locally normal families and the asserted anchors for any
    subsequential limit. Fix $T eq.not 0$ and put $a_n = T \/ b_n$. On a compact set with a deep margin,
  $ J_n \( Y \) = frac(S_n \( Y + a_n \, T \) - S_n \( Y \, T \), a_n) arrow.r partial_Y S_(*) \( Y \, T \) . $
  The fast fields used in the normalized action are $T F_n \( S + a_n u \)$ and $T^2 Q_n \( S + a_n u \)$.
    They converge analytically to the appropriate frozen pair in (7.9).
    The action $p_n \( S \, J \; T \)$ and its derivatives converge on these neighborhoods by 33.
    In particular the case $F_n arrow.r 0$ uses the analytic division in 32, rather than division of two limiting zeros.
  The exact recurrence takes the form
  #[#set math.equation(numbering: n => "(7.11)")
   $ p_(n \, J) \( S \, J \) - a_n p_(n \, S) \( S \, J \) = p_(n \, J) \( S_(-) \, J_(-) \) \, wide S = S_(-) +
     a_n J_(-) . $ <profile:scaled-recurrence>]
  It holds on the passages by analytic continuation. To fix its root choice, first take $T$ sufficiently small,
    for each fixed $n$, so that all physical points in question lie in known strict substrips with the glancing
    branch. Continue in the deep $T$-disk. Its shifted arguments remain in the domain with margin,
    and Cauchy estimates keep $J_n$ near one. The fast fields are uniformly small after increasing $D_0$,
    so the relevant kernels and roots remain nondegenerate throughout that continuation.
  Divide the difference in (7.11) by $a_n$. Both terms are evaluations of the same analytic function $p_(n \, J)$
    at neighboring states. Analytic convergence therefore gives
  $ frac(thin upright(d), thin upright(d) Y) p_J \( S_(*) \, J \) = p_S \( S_(*) \, J \) . $
  This step requires no rate of convergence compared with $a_n$.
    Since $S_(* \, Y) = J$, differentiating $J p_J - p$ shows that it is constant in $Y$.
    The deep anchor gives its value $1 \/ 12$. All statements hold on arbitrary compact sets by exhaustion,
    and at $T = 0$ by removability.
  For uniqueness write $w = T c_0 e^(- upright(i) Y)$ and $z = lambda J \/ 2$. The energy equation is
  #[#set math.equation(numbering: n => "(7.12)")
   $ lambda^3 = 24 \( sin z - z cos z \) quad upright("or") quad lambda^3 =
     12 \( tanh z - z "sech"^2 z \) . $ <profile:lambda-equations>]
  At $\( lambda \, J \) = \( 0 \, 1 \)$, $partial_J E = 1 \/ 4$;
    thus it determines $J$ analytically as a function of $lambda$ near that point. Moreover
  $ w frac(thin upright(d) lambda, thin upright(d) w) = lambda J = 2 z \, wide lambda / w arrow.r 1 . $
  Integrating this differential relation gives
  #[#set math.equation(numbering: n => "(7.13)")
   $ w = lambda exp (integral_0^lambda frac(1 \/ J \( v \) - 1, v) thin thin upright(d) v) \, wide S_(*) - Y =
     upright(i) log \( lambda \/ w \) . $ <profile:inverse-lambda>]
  The integrand is analytic at zero, the inverse has derivative one there,
    and the anchor fixes the constant and logarithm. Hence there is a unique deep model.
    Normality now gives convergence of the whole sequence on its compact domains,
    with derivatives by Cauchy’s inequalities. ◻
]

=== 7.3 A branch point of the model <a-branch-point-of-the-model>

#thm([Lemma 7.4.])[
  (Regular model and nontrivial continuation).  #emph[The model of 42, expressed in the variable $w =
    T c_0 e^(- upright(i) Y)$, is analytic for $\| w \| < R$, for some $R > 0$.
    It continues through the boundary circle except possibly at $w = R \, - R$.
    A sufficiently small continuation loop around $w = R$, attached to the inner model,
    changes the value of $S_(*) - Y$. The loop and its two adjoining regular corridors can be chosen so that all
    chord kernels and the twist $p_(J J)$ remain nonzero, including on the changed branch.]
] <profile:branch-model>

#proof[
  In the first case of (7.12) put $v = z$ and define
  #[#set math.equation(numbering: n => "(7.14)")
   $ g \( v \) = frac(3 \( sin v - v cos v \), v^3) \, wide P \( v \) = frac(v g \( v \)^(2 \/ 3), sin v) \, wide
     v_c = pi . $ <profile:trigonometric-g>]
  In the second case put $v = tanh z$ and define
  #[#set math.equation(numbering: n => "(7.15)")
   $ g \( v \) = frac(3, 2 v^3) #scale(x: 120%, y: 120%)[\[] v - \( 1 - v^2 \) "arctanh" v
     #scale(x: 120%, y: 120%)[\]] \, wide P \( v \) = g \( v \)^(2 \/ 3) \, wide v_c = 1 . $ <profile:hyperbolic-g>]
  All branches at zero are normalized by $g \( 0 \) = P \( 0 \) = 1$.
    Direct differentiation of (7.12) gives, in both cases,
  #[#set math.equation(numbering: n => "(7.16)")
   $ lambda = 2 v g \( v \)^(1 \/ 3) \, wide w v' \( w \) = v P \( v \) \, wide
     v \( w \) tilde.op w \/ 2 . $ <profile:v-equation>]
  For example, in the first case $lambda_v = 2 sin v \/ \( v g \( v \)^(2 \/ 3) \)$;
    in the second it is $2 "arctanh" v \/ \( v g \( v \)^(2 \/ 3) \)$.
  We verify the positivity and zero-freeness needed to control the analytic region.
    In (7.14), every nonzero zero of $sin v - v cos v$ is real.
    Indeed $u \( x \) = sin \( v x \)$ solves $- u'' = v^2 u$, $u \( 0 \) = 0$, $u' \( 1 \) = u \( 1 \)$,
    and integration by parts gives the nonnegative quadratic form
  $ integral_0^1 \| u' \|^2 thin thin upright(d) x - \| u \( 1 \) \|^2 gt.eq 0 \; $
  the inequality follows from $u \( 1 \) = integral_0^1 u'$. Hence $v^2$ is real and nonnegative.
    The positive roots $r_k$ are simple and satisfy $k pi < r_k < k pi + pi \/ 2$, by $tan v = v$.
    Hadamard factorization for the even entire function of order one #cite(label("McMullen2017")) Theorem 3.7,
    p. 43 therefore gives
  $ g \( v \) = product_(k gt.eq 1) \( 1 - v^2 \/ r_k^2 \) . $
  Comparison with the sine product yields
  $ log P \( v \) = sum_(j gt.eq 1) v^(2 j) / j sum_(k gt.eq 1) (\( k pi \)^(- 2 j) - 2 / 3 r_k^(- 2 j)) . $
  All its coefficients are strictly positive, and it is analytic for $\| v \| < pi$.
    In particular $P$ has nonnegative even coefficients, with a positive quadratic coefficient.
  In (7.15),
  $ g \( v \) = sum_(j gt.eq 0) a_j v^(2 j) \, wide a_j = frac(3, \( 2 j + 1 \) \( 2 j + 3 \)) \, wide a_0 = 1 . $
  Write its reciprocal formally as $1 - sum_(j gt.eq 1) b_j v^(2 j)$.
    The ratios $a_j \/ a_(j - 1) = \( 2 j - 1 \) \/ \( 2 j + 3 \)$ increase. The recurrence
  $ b_n = a_n - sum_(j = 1)^(n - 1) b_j a_(n - j) $
  shows by induction that $0 lt.eq b_n lt.eq a_n$. For completeness, with $r_n = a_n \/ a_(n - 1)$,
    the induction hypothesis gives
  $ sum_(j = 1)^(n - 2) b_j a_(n - j) lt.eq r_n \( a_(n - 1) - b_(n - 1) \) \, wide b_n gt.eq
    b_(n - 1) \( r_n - a_1 \) gt.eq 0 . $
  These series converge in the unit disk. For real $0 lt.eq r < 1$, $sum b_j r^(2 j) = 1 - 1 \/ g \( r \) < 1$;
    thus its modulus is less than one throughout that disk. Consequently $g$ is zero-free there and
    $P = \( 1 - sum b_j v^(2 j) \)^(- 2 \/ 3)$ has nonnegative even coefficients,
    again with a positive quadratic coefficient.
  The inverse of (7.16) is analytic at zero:
  $ w \( v \) = 2 v exp (integral_0^v frac(1 \/ P \( xi \) - 1, xi) thin thin upright(d) xi) . $
  The differential recurrence for its inverse shows that $v \( w \)$ is odd and has nonnegative Taylor
    coefficients. Its linear coefficient is $1 \/ 2$, and its cubic coefficient is strictly positive.
    On $0 < v < v_c$, $w \( v \)$ increases and
  $ frac(thin upright(d) log w, thin upright(d) v) = frac(1, v P \( v \)) . $
  It tends to a finite positive limit $R$ as $v arrow.t v_c$:
    the last integrand is integrable at $pi$ in the first case and has a finite limit at one in the second.
  The power series of $v \( w \)$ reaches radius $R$. Otherwise, at a smaller radius $rho$,
    positivity bounds its sum of absolute coefficients by the real solution $v \( rho \) < v_c$.
    It converges uniformly on the closed circle and the regular differential equation (7.16) continues it through
    every point of that circle, a contradiction. At radius $R$ its positive sum is $v_c$.
    At phases other than zero and $pi$, the modulus is strictly smaller than $v_c$:
    equality in the triangle inequality for the strictly positive linear and cubic terms would require
    $e^(2 upright(i) theta) = 1$. The differential equation therefore gives continuation through those phases.
  For $0 < \| w \| < R$, the solution $v \( w \)$ never vanishes,
    since uniqueness for the regular differential equation at a nonzero $w$ would otherwise make it identically
    zero. It follows that $lambda \/ w$ is nonzero and holomorphic on the whole disk, with value one at zero.
    Thus (7.13) defines the impact model there. Its regularity tests can be made explicit. In the first case,
  $ J = g \( v \)^(- 1 \/ 3) \, wide p_(J J) = frac(sin v, 2 lambda) \, wide k_0 = J \, quad k_(+) = k_(-) =
    frac(2 sin v, lambda) . $
  In the second case, with $z = "arctanh" v$,
  $ J = frac(2 z, lambda) \, wide p_(J J) = frac(v \( 1 - v^2 \), 2 lambda) \, wide k_0 = k_(+) = k_(-) =
    frac(2 v, \( 1 - v^2 \) lambda) . $
  They are nonzero in the inner disk, with removable values $J = k_j = 1$, $p_(J J) = 1 \/ 4$ at zero.
  We finally verify that continuation at $R$ actually changes the impact model.
    In the first case $w \( v \)$ is analytic at $v = pi$ and has a simple quadratic critical point there.
    If $lambda_c = \( 24 pi \)^(1 \/ 3)$, then $w'' \( pi \) = - 4 R \/ lambda_c^2 eq.not 0$.
    Hence $v \( w \)$ has a nonzero square-root term. The identity $w lambda_w = 2 v$ shows that $lambda \( w \)$,
    though its square-root term cancels, has a nonzero term of order $\( w - R \)^(3 \/ 2)$.
    More explicitly, on the branch from $0 < w < R$, with $eta = 1 - w \/ R$,
  $ lambda = lambda_c - 2 pi eta + frac(2 sqrt(2) lambda_c, 3) eta^(3 \/ 2) + O \( eta^2 \) . $
  A turn around $R$ changes this value.
  In the second case let $x = v - 1$, $G = 3 \/ 2$, and $Lambda = 2 G^(1 \/ 3)$.
    On any fixed bounded range of turning on the logarithmic cover,
  $ g \( v \) = G #scale(x: 120%, y: 120%)[\[] 1 - x log \( - x \) + \( log 2 - 2 \) x +
    O \( x^2 \( 1 + \| log \| x \| \| \) \) #scale(x: 120%, y: 120%)[\]] . $
  Integration of $w_v = w \/ \( v g \( v \)^(2 \/ 3) \)$ gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ w \( v \) = R + a_0 x + O \( x^2 \( 1 + \| log \| x \| \| \) \) \, wide a_0 =
     R \/ G^(2 \/ 3) eq.not 0 . $ <profile:logarithmic-inverse>]
  The inverse on a lifted sector exists with $x = \( w - R \) \/ a_0 +
    O \( \| w - R \|^2 \( 1 + \| log \| w - R \| \| \) \)$. For example,
    Rouche’s theorem on disks of a sufficiently small fixed relative radius gives this inverse and its
    continuation; the derivative tends to $a_0$. Substitution in $lambda = 2 v g \( v \)^(1 \/ 3)$ gives,
    with $delta = w - R$,
  $ lambda = Lambda - delta / R log \( - delta \/ a_0 \) + frac(1 + log 2, R) delta +
    O #scale(x: 120%, y: 120%)[\(] \| delta \|^2 \( 1 + \| log \| delta \| \|^2 \) #scale(x: 120%, y: 120%)[\)] . $
  The same coefficients apply over any fixed bounded amount of turning.
    The logarithmic coefficient is nonzero, so a turn changes the value;
    the remainder is smaller than that change on a sufficiently small fixed bypass.
  These branches attach to the inner model along the real interval $w < R$.
    On a sufficiently small compact bypass, in the first case $v$ stays near but not at $pi$.
    In the second it stays near but not at one, with $v eq.not 0 \, plus.minus 1$,
    and the chosen $"arctanh" v$ is finite and nonzero on each compact lifted corridor.
    The displayed kernel and twist formulas are therefore finite and nonzero, also after the turn.
    Since $lambda$ changes and remains nonzero, $upright(i) log \( lambda \/ w \)$ changes as well.
    This proves the Lemma. ◻
]

=== 7.4 Tracking and passage through regular corridors <tracking-and-passage-through-regular-corridors>

#thm([Lemma 7.5.])[
  (Tracking a regular model corridor).  #emph[Let a compact corridor of a continued branch of the model in 43 have
    nonzero kernels and twist, and let $T$ range over a compact set avoiding zero.
    Suppose two neighboring lift entries are initialized in a joint patch where they converge to that model,
    with convergence of their first divided difference. Along segments of bounded length made of increments $a_n =
    T \/ b_n$, the normalized chord recurrence continues these entries holomorphically and tracks the model with
    error $o \( 1 \)$. The same holds for increments $- T \/ b_n$.
    The statement is uniform on compact thickenings of such segments and their initial patches.]
] <profile:tracking>

#proof[
  Cover the compact model states by finitely many analytic action charts with kernels and $p_(J J)$ bounded away
    from zero. The analytic action convergence in 33 applies on these charts,
    following the branches initialized in the known data. Given the old state $\( S_(-) \, J_(-) \)$, set $S =
    S_(-) + a_n J_(-)$. Equation (7.11) has a unique nearby root for $J$ by the implicit function theorem.
    Evaluating its left side at $J = J_(-)$, and subtracting before taking the limit, gives
  $ J - J_(-) = a_n frac(p_S - J_(-) p_(S J), p_(J J)) \( S_(-) \, J_(-) \) + o \( \| a_n \| \) . $
  The error is uniform with state derivatives on the compact charts.
    Indeed the corresponding expression with $p_n$ has a Taylor remainder $O \( \| a_n \|^2 \)$,
    and its coefficient converges with derivatives to the displayed one. The state map consequently is
  #[#set math.equation(numbering: n => "(7.18)")
   $ \( S_(-) \, J_(-) \) mapsto \( S_(-) \, J_(-) \) +
     a_n (J_(-) \, frac(p_S - J_(-) p_(S J), p_(J J)) \( S_(-) \, J_(-) \)) + o \( \| a_n \| \) \,
     $ <profile:tracking-map>]
  and has local Lipschitz bound $1 + C \| a_n \|$.
  The model solves the ordinary differential equation in (7.18):
    its second component follows by expanding $thin upright(d)_Y p_J = p_S$.
    In $O \( 1 \/ \| a_n \| \)$ steps, the initial error and the local $o \( \| a_n \| \)$ errors sum,
    with a bounded stability factor, to $o \( 1 \)$. This proves tracking and keeps the continued states in the
    chosen regular charts. The shape arguments remain in the exhausting shape domains.
    The implicit roots are holomorphic also in the initial point and parameter;
    the same estimates on slightly larger compact charts give uniform convergence on thickenings.
    For the negative increment use the fast fields with $- T$.
    The frozen actions are even in $lambda$, so their limit is unchanged, and the same calculation applies.
  At an initialization obtained by previous regular passage,
    the required exact recurrence and its branch choice persist by analytic identity from the deep data.
    Cauchy’s integral formula gives convergence of the first divided differences whenever the two-entry functions
    converge on neighborhoods. Thus the construction can be reinitialized in every regular patch it reaches. ◻
]

One consequence will be used repeatedly. If $\| Im T \| gt.eq eta > 0$, choose the upward increment $a_n =
  plus.minus T \/ b_n$. A target can be reached from an initialized lower slab whenever its backward slanted
  segment remains in one regular corridor. Choose the number of backward steps locally constantly so that two
  entries lie well inside the slab, and then apply 44. The germs from different such choices agree:
  within the initial slab their overlapping entries obey the exact recurrence,
  and every subsequent nearby root is unique. Doing this at intermediate targets gives the germs along the
  vertical segment from below. There is room for small changes in both the target and the parameter,
  so the passage is joint and converges on compact neighborhoods.
  Its horizontal drift is bounded by a constant times the vertical distance divided by $eta$.
  Thus any fixed positive $eta$, however small, requires only a fixed finite horizontal range before $n$ tends to
  infinity.

#proof[
  Let
  $ T_(*) = \| c_0 \|^(- 1) \, wide r_0 = T_(*) \/ 32 \, $
  so that $T_(*)$ is real and $\| T_(*) c_0 \| = 1$. Take the parameter bound in 41 larger than all the parameter
    disks below. We first reach, vertically and with joint convergence, the inner regular region
  #[#set math.equation(numbering: n => "(7.19)")
   $ \| T c_0 e^(- upright(i) Y) \| lt.eq R e^(- nu) \, wide \| T - T_(*) \| lt.eq 2 r_0 \, $ <profile:inner-region>]
  for any fixed $nu > 0$ and every needed compact horizontal range.
  Fix a center $T_c$ in this parameter disk and use
  #[#set math.equation(numbering: n => "(7.20)")
   $ T' = T_c + 8 r_0 zeta \, wide Y' = Y_c - upright(i) log \( T' \/ T_c \) + g \( zeta \) \, wide g \( 0 \) =
     0 . $ <profile:inner-disks>]
  The parameter disk is bounded away from zero, so this logarithm is single-valued. Its sign is important:
  $ T' e^(- upright(i) \[ Y_c - upright(i) log \( T' \/ T_c \) \]) = T_c e^(- upright(i) Y_c) . $
  Choose a small fixed $eta > 0$. On the unit circle require the boundary imaginary part of $g$ to be a
    sufficiently large negative constant on the arcs $\| Im T' \| < eta$ and slightly larger collars,
    and to be at most $nu \/ 2$ everywhere. It must also have mean zero. Such a choice is possible:
    the bad arcs have arbitrarily small total length as $eta arrow.b 0$, uniformly in the allowed centers,
    by transversality of the parameter circles. Use smooth negative bumps on those arcs,
    balance their mean by a positive part smaller than $nu \/ 2$,
    then approximate by a trigonometric polynomial with strict margins.
    The corresponding holomorphic polynomial can be normalized by $g \( 0 \) = 0$.
  On the bad arcs the adjusted point lies in deep initialized data.
    On the other arcs, use the upward increment $plus.minus T' \/ b_n$ to track from a deep slab.
    Every intermediate point of its backward slanted segment has smaller $\| T' c_0
    e^(- upright(i) Y) \|$ than the target, so the whole segment lies in the inner regular model region.
    The horizontal range needed for these paths, including the shift by $g$, can be large,
    but it is fixed after $eta$ is chosen. The depth $D_0$ in 41 was independent of that aperture,
    so the initialization remains available. The boundary germs agree as vertical continuations and converge to
    the model on compact neighborhoods.
  Raise $Im Y_c$ from a deep initial position to the desired target in (7.19).
    By the maximum principle for $Im g$, the full model disks in (7.20) stay within radius $R e^(- nu \/ 2)$.
    Initially the full disks lie in known data. The Laurent-coefficient argument used in the proof of 41 fills the
    disks as the center rises, giving joint center germs. Apply the maximum principle to the difference between
    the filled lift and the analytic model. Boundary convergence gives convergence at the centers,
    and on neighborhoods by retaining the strict margins. This proves (7.19).
    The exact chord identities, including neighboring arguments,
    continue through these passages for all sufficiently large $n$.
  We next reach two regular patches just beyond the model circle, near the phases
  #[#set math.equation(numbering: n => "(7.21)")
   $ w = R e^(u + upright(i) theta) quad upright("and") quad w = R e^(u - upright(i) theta) \, wide u lt.eq nu \,
     quad T = T_(*) . $ <profile:outer-patches>]
  First fix a sufficiently small $theta > 0$; then choose $nu > 0$ sufficiently small in terms of $theta$.
    Use parameter circles of radius $r_0$, so that their initial points remain in the parameter range already
    reached, and use the same logarithmic adjustment as in (7.20). This time choose a polynomial with
  $ Im g lt.eq - 4 nu med upright("on ") \| Im T' \| < eta_1 upright(" and collars") \, wide Im g lt.eq nu \,
    wide \| g \| lt.eq C_1 nu . $
  The cutoff $eta_1 > 0$ and constant $C_1$ can be fixed independently of $nu$:
    first choose the sufficiently short bad arcs, construct one mean-zero adjustment, and multiply it by $nu$.
  Raise the centers from $u = - C nu$, with $C$ a sufficiently large fixed constant, to $u = nu$.
    The nonsteep arcs remain in the known inner region. On the steep arcs, tracking starts just below $u = - nu$,
    and the additional vertical distance is $O \( nu \)$. The horizontal drift is therefore $O \( nu \/ eta_1 \)$.
    Choose $nu$ so small that this drift and the real displacement of $g$ stay in the chosen regular phase
    corridor about each sign in (7.21). The full model disks stay in that corridor as well.
    Disk filling and maximum modulus, exactly as above, give vertical joint passages and compact convergence to
    the two radial model continuations.
  At the real physical parameter $t = T_(*) \/ m_n$, one of these passages reaches the physical height
  $ h_n + ell_n \( log R + nu \) . $
  It remains in the shape strip: this was proved in the deep part and follows on the remaining compact path from
    model convergence and the exhaustion of scaled shape domains.
    Consequently it gives joint meromorphic germs for $X = Gamma \( frak(s) \)$,
    attached to the primary branch from below. If the real-parameter joint width ended at an earlier height,
    the passage would give a prohibited joint patch at its first wall, contrary to 24.
    The same argument excludes equality at the endpoint, because the passage has a neighborhood there.
    Thus, for all sufficiently large $n$,
  #[#set math.equation(numbering: n => "(7.22)")
   $ h_X \( T_(*) \/ m_n \) > h_n + ell_n \( log R + nu \) . $ <profile:real-width-passage>]
  This is the one place where a local passage is promoted to an entire horizontal band,
    and the parameter here is real. By 29, $S_n \( Y \, T_(*) \)$ is a single-valued holomorphic function on a
    neighborhood of the full row $Im Y = log R + nu \/ 2$. The two vertical passages agree with this actual lift,
    by analytic identity from their lower starting segments.
  Follow this row from phase $+ theta$ to phase $- theta$, increasing $Re Y$, with real steps $a_n =
    T_(*) \/ b_n > 0$. Initialize in the first of the patches (7.21).
    The continued model follows the outside of $w = R$. At its endpoint it differs from the independent radial
    continuation to the other patch: close the comparison path through the inner disk,
    and the resulting loop winds once around $R$, while avoiding $- R$.
    This is the nontrivial continuation proved in 43. All states of the two paths and their small thickenings are
    regular if $theta \, nu$ have been chosen small enough.
  For clarity, we verify why recurrence tracking on this horizontal path must agree with the actual single-valued
    lift. Take a small fixed complex ball $B_(*)$ in the initial patch,
    and run the tracking construction for each initial offset in $B_(*)$.
    Its successive output germs live on $B_(*) + j a_n$. For an offset $Y$ and the offset $Y + a_n$,
    their first two common entries coincide by the actual data and the exact recurrence in the initial patch;
    take $B_(*)$ with room for two extra steps. Uniqueness of every subsequent nearby root makes the chains
    coincide on their common entries. Hence the germs on adjacent translated balls agree on overlap.
    They glue, and by the identity theorem agree throughout with the actual holomorphic function on the band
    supplied by (7.22). Tracking gives convergence to the horizontally continued model on these balls.
  Choose a number of steps whose endpoint tends to a point in the second regular patch;
    the remaining offset tends to zero. Compact convergence on neighborhoods makes this harmless.
    At that point the same actual function would converge both to the horizontally continued model and to the
    distinct radial model value. This contradiction proves the Theorem. ◻
]

=== 7.5 A log-deficit estimate <a-log-deficit-estimate>

We next produce an exponential profile from either an entire nonconstant first field or growth of infinite order
  at a finite wall. The quotient condition $q = f'' \/ f$ being holomorphic is used to control the second field
  from a logarithmic bound on the first.

#thm([Lemma 7.6.])[
  (Log-deficit estimate).  #emph[There is an absolute constant $C$ such that the following holds.
    Let $f$ be holomorphic and not identically zero on the unit disk, suppose $log \| f \| lt.eq K$,
    and suppose $f'' \/ f$ extends holomorphically through every zero. Then
#[#set math.equation(numbering: n => "(7.23)")
 $ sup_(\| z \| < 1 \/ 4) \| f'' \( z \) \/ f \( z \) \|^(1 \/ 2) lt.eq
   C (1 + integral_(\| z \| < 1) \( K - log \| f \( z \) \| \) thin thin upright(d) A \( z \)) .
   $ <profile:log-deficit-bound>]

 On a disk of radius $Delta$, the corresponding left side is $Delta sup \|
   q \|^(1 \/ 2)$ and the integral on the right is replaced by the disk average of the log deficit.]
] <lem:log-deficit>

#proof[
  Put $U = K - log \| f \| gt.eq 0$ and $A = 1 + integral_(bb(D)) U$. We may assume that this integral is finite.
    The distribution $- Delta U$ is $2 pi$ times the zero-counting measure, including multiplicities.
    Testing it against a nonnegative smooth cutoff equal to one on $\| z \| lt.eq
    0.8$ and supported in the unit disk bounds the number of those zeros by $C A$.
    If they are $z_j$, listed with multiplicity, then
  $ V = U + sum_j log \| z - z_j \| $
  is harmonic on $\| z \| < 0.8$. On a slightly smaller disk it has $L^1$ norm $O \( A \)$,
    since each logarithm has uniformly bounded $L^1$ norm there.
    Interior harmonic estimates bound its first and second derivatives by $C A$, with a further fixed margin.
  Equivalently, divide $f$ by its listed zero factors. The zero-free quotient has a holomorphic logarithm in the
    disk, whose first two derivatives are controlled by the derivatives of $V$.
    Off the zeros, differentiating the logarithm of $f$ gives
  $ \| f'' \/ f \|^(1 \/ 2) lt.eq C A + C sum_j \| z - z_j \|^(- 1) $
  on a fixed smaller disk. Here the second derivative of the logarithm contributes square roots of sums of $\| z -
    z_j \|^(- 2)$, bounded by the displayed sum. Each summand is locally integrable in two real dimensions with a
    uniform integral bound, and there are at most $C A$ of them.
    The resulting $L^1$ bound for $\| q \|^(1 \/ 2)$, followed by submean for that subharmonic function,
    proves (7.23). Its subharmonicity across the zeros uses the assumed holomorphic extension of $q$.
    Rescale the variable to obtain the final assertion. ◻
]

We record the periodic form that will also be useful below. The horizontal mean

$ cal(L) \( h \) = frac(1, 2 pi) integral_0^(2 pi) log \| f \( x + upright(i) h \) \| thin thin upright(d) x $

is convex in height by subharmonicity, and even by real symmetry.
  Thus $cal(L) \( h \) gt.eq cal(L) \( 0 \) > - oo$; the real-row value is finite since $f > 0$ there.
  If $K$ bounds $log \| f \|$ at all heights of disks of radius $Delta$,
  averaging their average deficits over the horizontal centers gives $O \( 1 + K_(+) \)$,
  with constants depending only on the fixed real-row data.
  For each individual center positivity and periodicity give the bound

#[#set math.equation(numbering: n => "(7.24)")
 $ 1 + upright("disk-average") \( K - log \| f \| \) lt.eq
   C \( 1 + Delta^(- 1) \) \( 1 + K_(+) \) . $ <profile:periodic-deficit>]

Indeed, enclose the disk in a rectangle of width and height $2 Delta$.
  At each height an interval of that width is covered by $O \( 1 + Delta \)$ whole periods;
  its integral of the nonnegative deficit is at most $C \( 1 + Delta \) \( 1 + K_(+) \)$.
  Integration in height and division by the disk area gives (7.24). In particular, on a smaller disk,

#[#set math.equation(numbering: n => "(7.25)")
 $ \| q \|^(1 \/ 2) lt.eq C Delta^(- 1) \( 1 + Delta^(- 1) \) \( 1 + K_(+) \) . $ <profile:periodic-q-bound>]

=== 7.6 Selecting a profile at entire or infinite-order growth <selecting-a-profile-at-entire-or-infinite-order-growth>

#thm([Theorem 7.7.])[
  (Exclusion of entire and infinite-order growth).  #emph[In the nonisotropic case, $H =
    oo$ implies that the table is a circle. If $H < oo$, then
$ limsup_(k arrow.r oo) frac(log max_x M \( x + upright(i) \( H - e^(- k) \) \), k) < oo . $

]
] <thm:infinite-growth-exclusion>

#proof[
  We may exclude constant $f$, which gives a circle. Suppose first that $H <
    oo$ and the displayed limsup is infinite. The same is true with $M$ replaced by $\| f \|$.
    Otherwise $log max \| f \| = O \( k \)$ on those rows; disks with radius comparable to $e^(- k)$,
    and with a fixed extra depth margin, have a global log upper bound $O \( k \)$.
    Formula (7.25) then gives a finite power bound in inverse depth for $\| q \|^(1 \/ 2)$,
    contradicting the assumed infinite order of $M$.
  Treat this case and $H = oo$ together. Put
  $ rho \( h \) = log max_x \| f \( x + upright(i) h \) \| . $
  The function $rho$ is convex in height by the three-lines theorem, and even by symmetry.
    In the finite-width case just identified it tends to infinity and has infinite upper order relative to
    $log \( 1 \/ \( H - h \) \)$. In the entire case a nonconstant real-symmetric periodic function has a growing
    Fourier mode: if a nonconstant coefficient is nonzero, its conjugate coefficient is also nonzero,
    and one grows as $h arrow.r oo$. Hence $rho \( h \) gt.eq c h - C$ for some $c > 0$.
    In either case $rho arrow.r oo$, and it is eventually strictly increasing with slope bounded below by a
    positive constant.
  Let $h \( R \)$ denote its inverse at large values, let $N \( R \)$ be its right slope there,
    and put $mu \( R \) = log N \( R \)$. The function $mu$ is nondecreasing and bounded below.
    The inverse is locally absolutely continuous and
  $ h' \( R \) = e^(- mu \( R \)) quad upright("for almost every ") R . $
  We claim that
  #[#set math.equation(numbering: n => "(7.26)")
   $ liminf_(R arrow.r oo) mu \( R \) \/ R = 0 . $ <profile:slow-slope-values>]
  If $mu \( R \) gt.eq c R$ eventually for some $c > 0$, inverse integration would give a finite limiting height
    and $H - h \( R \) lt.eq C e^(- c R)$. This is impossible if $H = oo$.
    For finite $H$ it implies $R \/ log \( 1 \/ \( H - h \( R \) \) \) lt.eq 1 \/ c + o \( 1 \)$,
    contradicting infinite upper order. Since $mu$ is bounded below, the liminf cannot be negative. This proves (7.26).
  Choose $R arrow.r oo$ along values with $mu \( R \) = o \( R \)$, and fix a lower base value $R_b$.
    The positive measure $thin upright(d) mu$ on $\[ R_b \, R \]$ has mass $o \( R \)$.
    The weak maximal-interval inequality gives a number $epsilon_R arrow.r
    0$ and a continuity point $v in \[ R \/ 3 \, 2 R \/ 3 \]$ such that
  #[#set math.equation(numbering: n => "(7.27)")
   $ \| mu \( z \) - mu \( v \) \| lt.eq epsilon_R \| z - v \| wide \( R_b lt.eq z lt.eq R \) .
     $ <profile:flat-slope-selection>]
  Here is a direct measure justification of the choice. The set of points belonging to an interval on which the
    mass divided by its length exceeds $epsilon_R$ has length at most a constant times the total mass divided by
    $epsilon_R$, by the disjoint-interval covering argument. Choose, for example,
    a constant multiple of $sqrt(\( 1 + mu \( R \) - mu \( R_b \) \) \/ R)$ for $epsilon_R$.
    The bad set has length $o \( R \)$, so cannot cover $\[ R \/ 3 \, 2 R \/ 3 \]$.
    Increasing the constant accounts for intervals with one endpoint at the selected point.
    Atoms and discontinuity points may be discarded. This gives both one-sided secant bounds in (7.27).
  Set
  #[#set math.equation(numbering: n => "(7.28)")
   $ h_n = h \( v \) \, wide ell_n = N \( v \)^(- 1) \, wide m_n = e^v . $ <profile:selected-scales>]
  For bounded $u$, integrate the inverse derivative using (7.27), then invert the result.
    It gives, uniformly on each fixed bounded real range,
  #[#set math.equation(numbering: n => "(7.29)")
   $ rho \( h_n + ell_n u \) = v + u + o \( 1 \) . $ <profile:linear-log-maximum>]
  These heights stay in the shape strip: bounded intervals of values about $v$ lie in $\[ R_b \, R \]$ with
    distances tending to infinity from the endpoints, and the inverse integration applies there.
    In particular the upper-wall distance in units of $ell_n$ tends to infinity.
  The slope lower bound, and $mu \( v \) lt.eq mu \( R \) = o \( R \)$, also give
  #[#set math.equation(numbering: n => "(7.30)")
   $ 0 < ell_n lt.eq C \, wide h_n lt.eq C v \, wide \| log ell_n \| = o \( v \) \, wide b_n = ell_n m_n =
     exp \( v - o \( v \) \) arrow.r oo . $ <profile:selected-size-bounds>]
  The centers satisfy $h_n arrow.r H$, with the infinite value allowed.
    For finite $H$, convex divergence at that height forces the slopes to infinity, so $ell_n arrow.r 0$.
    For infinite $H$, $h_n arrow.r oo$ and $ell_n lt.eq C$. Thus the lower wall also escapes in scaled
    coordinates, and the shape domains exhaust $bb(C)$.
  Choose $x_n$ realizing the row maximum at $h_n$. By (7.29), the entire subsequential limits of
  $ F_n \( S \) = m_n^(- 1) f \( x_n + upright(i) h_n + ell_n S \) $
  satisfy $\| F \( S \) \| lt.eq e^(Im S)$ and $\| F \( 0 \) \| = 1$.
    The maximum principle applied to $e^(upright(i) S) F \( S \)$ therefore gives
  #[#set math.equation(numbering: n => "(7.31)")
   $ F \( S \) = c_0 e^(- upright(i) S) \, wide \| c_0 \| = 1 . $ <profile:selected-exponential>]
  Normal-family extraction, including the phase at zero, supplies such locally uniform convergence.
  The normalized second field tends to zero. In fact, for each fixed $C_1$,
    use disks of radius a fixed small multiple of $ell_n$ throughout $\| Im s \| lt.eq h_n + C_1 ell_n$,
    with an extra margin of a few such radii. Symmetry and (7.29) give the global log bound $K = v +
    O_(C_1) \( 1 \)$ on their heights. Equations (7.24)–(7.25) and (7.30) imply
  #[#set math.equation(numbering: n => "(7.32)")
   $ \| q \( s \) \|^(1 \/ 2) lt.eq C \( ell_n^(- 1) + ell_n^(- 2) \) \( 1 + v \) =
     exp \( o \( v \) \) . $ <profile:selected-q-smallness>]
  Consequently $Q_n = q \/ m_n^2 arrow.r 0$ on every scaled compact set.
  We finish by verifying the coarser bounds, including their full range to a fixed physical depth.
    For $R_b lt.eq v' lt.eq v$, inverse integration and (7.27) give
  #[#set math.equation(numbering: n => "(7.33)")
   $ frac(h \( v \) - h \( v' \), ell_n) = integral_(v')^v e^(mu \( v \) - mu \( z \)) thin thin upright(d) z
     lt.eq integral_(v')^v e^(epsilon_R \( v - z \)) thin thin upright(d) z lt.eq \( v - v' \)
     e^(epsilon_R \( v - v' \)) . $ <profile:coarser-inverse-bound>]
  Fix any $alpha_0 in \( 1 \/ 2 \, 1 \)$. At height $h \( v' \)$, multiply the row bound $\| f \| \/ m_n lt.eq
    e^(- \( v - v' \))$ by the $alpha_0$-power of the left side of (7.33). The result is at most
  $ \( v - v' \)^(alpha_0) exp #scale(x: 120%, y: 120%)[\(] - \( 1 - alpha_0 epsilon_R \) \( v - v' \)
    #scale(x: 120%, y: 120%)[\)] \, $
  which is bounded uniformly. Hence the required power bound for $\| f \| \/
    m_n$ holds globally in the horizontal variable, at $ell_n lt.eq delta = h_n - Im s lt.eq h_n - h \( R_b \)$.
    The remaining lower compact range has bounded $f \, q$. Furthermore
  #[#set math.equation(numbering: n => "(7.34)")
   $ log \( 1 + h_n \/ ell_n \) = o \( v \) $ <profile:selected-log-range>]
  by (7.30). This absorbs that compact range and, using (7.32), the entire $q$ contribution:
    their normalized size is $e^(- v + o \( v \))$, whereas the largest power of $delta \/
    ell_n$ in question is only $e^(o \( v \))$. We have therefore proved
  $ M \( s \) \/ m_n lt.eq C \( ell_n \/ delta \)^(alpha_0) wide \( ell_n lt.eq delta lt.eq h_n \) \, $
  uniformly in horizontal position. In the finite-width case retain any fixed smaller range $delta lt.eq
    delta_b < H \/ 2$. In the entire case (7.34) is exactly the additional condition (7.4).
  All hypotheses of 40 now hold, with the first profile in (7.2), by (7.31) and (7.32).
    Its contradiction proves both assertions. ◻
]

We can now assemble the growth alternatives. In the nonisotropic, noncircular case,
  46 makes $H$ finite and the upper growth order finite. An upper order less than one would give a uniform bound
  by a power of inverse depth with exponent less than one, contrary to 37.
  A finite upper order greater than one is excluded by 39. Thus the only remaining case has a finite shape wall
  and upper growth order exactly one. This is the critical case considered next.

== 8 Critical estimates at a finite shape boundary <sec:critical>

We now consider the remaining nonisotropic case. Thus $0 < H < oo$, the functions $f$ and $q =
  f'' \/ f$ are holomorphic in $D_H$, and

$ M \( s \) = max { \| f \( s \) \| \, \| q \( s \) \|^(1 \/ 2) } \, wide
  limsup_(k arrow.r oo) frac(log max_x M \( x + upright(i) \( H - e^(- k) \) \), k) = 1 . $

The bootstrap and no-trivial-profile results below use only this critical growth condition and the results already
  proved. The reductions in the last subsection have one explicit additional hypothesis:
  the exclusion of the sequences in 53. That exclusion is proved in 58,
  without using the angle budget or the polynomial bounds that depend on that exclusion.

Choose $k_0 gt.eq 1$ large enough that $d_(k_0) = e^(- k_0) < H \/ 10$, and write

#[#set math.equation(numbering: n => "(8.1)")
 $ d_k & = e^(- k) \,\
mu_f \( k \) & = d_k #scale(x: 120%, y: 120%)[\(] bb(E) \| f \( x + upright(i) \( H - d_k \) \) \|^2
  #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \,\
mu \( k \) & =
  d_k #scale(x: 120%, y: 120%)[\(]
  bb(E) \( \| f \( x + upright(i) \( H - d_k \) \) \|^2 + \| q \( x + upright(i) \( H - d_k \) \) \| \)
  #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <critical:eq:means>]

Unless a different probability is displayed, $bb(E)$ means integration against $thin upright(d)
  x \/ \( 2 pi \)$ on the horizontal circle. In particular,

$ parallel d_k M parallel_2 lt.eq mu \( k \) lt.eq sqrt(2) parallel d_k M parallel_2 . $

The critical growth assumption gives, for every $epsilon > 0$,

#[#set math.equation(numbering: n => "(8.2)")
 $ mu \( k \) + d_k max_x M \( x + upright(i) \( H - d_k \) \) lt.eq
   C_epsilon e^(epsilon k) . $ <critical:eq:subexponential>]

Moreover, 45, applied on disks whose radii are fixed small multiples of $d_k$, gives

#[#set math.equation(numbering: n => "(8.3)")
 $ d_k bb(E) \| q \( x + upright(i) \( H - d_k \) \) \|^(1 \/ 2) lt.eq C \( 1 + k \) . $ <critical:eq:q-first-moment>]

Indeed, on the slightly enlarged range of heights needed for those disks,
  the critical assumption gives the logarithmic upper bound $log \| f \| lt.eq C \( 1 + k \)$.
  The horizontal mean of $log \| f \|$ is convex in height and even under reflection in the real axis.
  It is therefore bounded below by its finite real-axis mean.
  Averaging the disk deficits in their horizontal centers gives (8.3).

Use the mean-normalized lift of 29, and put

#[#set math.equation(numbering: n => "(8.4)")
 $ P = - Im V \, wide W = f^2 + 8 q \, wide Delta \( t \) = H - h_X \( t \) . $ <critical:eq:P-and-deficit>]

Here $frak(s) \( y \, t \) = y + t^2 V \( y \) + O \( t^4 \)$, and (5.24) says that

#[#set math.equation(numbering: n => "(8.5)")
 $ V' = \( W - chevron.l W chevron.r \) \/ 120 . $ <critical:eq:gradient>]

Thus $P$ is a real harmonic, periodic function, its horizontal mean is zero on every row, and $P =
  0$ on the real row. The number $chevron.l W chevron.r$ is fixed throughout this Section.
  It follows from 23 and the normalized mean of the lift that $Delta$ is a bounded nonnegative subharmonic
  function on a fixed small parameter disk, with $Delta \( 0 \) = 0$.

For real $t$ in this disk and $0 < Im y < h_X \( t \)$,

#[#set math.equation(numbering: n => "(8.6)")
 $ Im #scale(x: 120%, y: 120%)[\(] y - frak(s) \( y \, t \) #scale(x: 120%, y: 120%)[\)] gt.eq -
   Delta \( t \) . $ <critical:eq:lower-lift>]

To verify this, the left side is harmonic and periodic in $y$, and is zero on the real row.
  On a row $Im y = h_X \( t \) - eta$, the shape constraint gives the lower bound $- Delta \( t \) - eta$.
  Harmonic comparison on that finite periodic strip, followed by $eta arrow.b 0$, proves (8.6).

=== 8.1 Envelopes, tiles, and the one-sided estimate <envelopes-tiles-and-the-one-sided-estimate>

#prodef([Definition 8.1.])[
  An envelope is a function $N : \[ k_0 \, oo \) arrow.r \[ 1 \, oo \)$ for which there are fixed constants $C_N
    gt.eq 1$, $0 lt.eq beta < 1 \/ 2$, and $a > 0$ such that
  #[#set math.equation(numbering: n => "(8.7)")
   $ frac(N \( j \), N \( k \)) lt.eq
     C_N cases(delim: "{", e^(beta \( k - j \)) \, & k_0 lt.eq j lt.eq k \,, e^(a \( j - k \)) \, & j gt.eq k .)
     $ <critical:eq:envelope>]
] <critical:def:envelope>

For the estimates below we impose the first-moment bound

#[#set math.equation(numbering: n => "(8.8)")
 $ bb(E) \( d_k M \) lt.eq C_1 N \( k \) \, wide k gt.eq k_0 . $ <critical:eq:first-moment>]

When using a bootstrap, we also assume that $sup_(k gt.eq k_0) mu \( k \) \/ N \( k \) < oo$;
  no bound on this finite number is assumed. All conclusions below are uniform in it.
  In particular, an envelope that eventually grows at any fixed positive exponential rate has this finiteness
  property by (8.2).

The constants in the ensuing estimates may depend on the table, $k_0 \, C_N \, C_1 \, beta \, a$,
  and on specified fixed tile enlargements. They do not depend on $k$, on the finite bootstrap ratio,
  or on the particular envelope in a family with these constants fixed.

For $A gt.eq 1$, a tile about $\( k \, x \)$ will mean a set contained in

#[#set math.equation(numbering: n => "(8.9)")
 $ cal(T)_A \( k \, x \) = { s : med e^(- A) d_k lt.eq H - Im s lt.eq e^A d_k \, med \| Re s - x \| lt.eq
   A \( H - Im s \) } . $ <critical:eq:tile>]

Horizontal distance is interpreted on a real lift and then periodically.
  We intersect tiles with the upper half of the shape strip.
  If a tile reaches a fixed lower region, we use the analytic bounds there.
  In particular, all such fixed lower contributions are harmless because $N gt.eq 1$.

We record the elementary averaging fact used repeatedly. For every $p > 0$, the function $M^p$ is subharmonic:
  it is the maximum of $\| f \|^p$ and $\| q \|^(p \/ 2)$. Covering a fixed tile by a bounded number of disks of
  radius comparable to $d_k$, and using the submean inequality on slightly larger disks,
  bounds its supremum by $C d_k^(- 2)$ times the integral on a fixed enlargement. Consequently,

#[#set math.equation(numbering: n => "(8.10)")
 $ bb(E) sup_(s in cal(T)_A \( k \, x \)) \( d_k M \( s \) \)^p lt.eq
   C_(A \, p) sup_(\| j - k \| lt.eq C_A) bb(E) \( d_j M \)^p \, $ <critical:eq:tile-averaging>]

with the fixed lower-region convention just specified. One may replace the supremum on the right by a bounded
  average of neighboring rows. To obtain the displayed form, integrate the disk bound in $x$;
  each point of the enlargement is counted for a horizontal length $O \( d_k \)$,
  and its vertical range has length $O \( d_k \)$.

Choose $beta < beta_1 < 1 \/ 2$, a sufficiently large fixed aperture $L$, a sufficiently small fixed $c_0 > 0$,
  and a fixed $delta_b in \( 0 \, H \/ 2 \)$. We take $delta_b$ sufficiently small that the fixed enlargements of
  cone tiles used below, in particular in 82, have upper-boundary depth at most $e^(- k_0)$.
  This is possible after the fixed cone and tile apertures have been chosen. Define

#[#set math.equation(numbering: n => "(8.11)")
 $ b \( x \, k \) = 1 + sup_(c_0 d_k lt.eq delta lt.eq delta_b\
\| Re s - x \| lt.eq L delta\
delta = H - Im s) frac(delta M \( s \), N \( k \) \( delta \/ d_k \)^(beta_1)) . $ <critical:eq:cone-cost>]

The constants $L \, c_0$ are chosen to cover the enlarged cones required by 34, with exponent $1 -
  beta_1 > 1 \/ 2$, for a row point and its needed fixed neighborhoods.

Splitting the cone into unit ranges of logarithmic depth proves

#[#set math.equation(numbering: n => "(8.12)")
 $ bb(E) b \( dot.op \, k \) lt.eq C \, wide parallel b \( dot.op \, k \) parallel_p lt.eq
   C_p \( 1 + C_p^(*) \) quad \( p gt.eq 1 \) \, $ <critical:eq:cone-moments>]

whenever $parallel d_j M parallel_p lt.eq C_p^(*) N \( j \)$ on all rows.
  Indeed, at a coarser level $j = k - h$, the normalized tile contribution is at most $C e^(- beta_1 h)
  N \( j \) \/ N \( k \) lt.eq C e^(- \( beta_1 - beta \) h)$ times its normalized row norm.
  These factors are summable. There are only a fixed number of finer levels because of $c_0$.
  The first inequality uses (8.8); the second uses Minkowski’s inequality and (8.10).

#thm([Lemma 8.2.])[
  #emph[Under (8.7) and (8.8), there are constants $c \, z_0 \, C > 0$ such that,
    for real $t$ and $z = \| t \| N \( k \) \/ d_k lt.eq z_0$,
#[#set math.equation(numbering: n => "(8.13)")
 $ Delta \( t \) lt.eq C d_k z^gamma \, wide gamma = frac(1, 1 + a) . $ <critical:eq:real-deficit>]

 Moreover, with
#[#set math.equation(numbering: n => "(8.14)")
 $ m = frac(4 \( 2 - gamma \), 4 - gamma) < 2 \, $ <critical:eq:m-exponent>]

 one has
#[#set math.equation(numbering: n => "(8.15)")
 $ frac(d_k P^(-) \( x + upright(i) \( H - d_k \) \), N \( k \)^2) lt.eq
   C b \( x \, k \)^m . $ <critical:eq:negative-P>]

 Here $P^(-)$ is the nonnegative negative part of $P$.]
] <critical:lem:one-sided>

#proof[
  At a fixed center the cone theorem gives a joint holomorphic vertical passage at the row point for
  $ \| t \| < r_(x \, k) := c frac(d_k, N \( k \) b \( x \, k \)) . $
  By decreasing $c$, and using a fixed slightly shallower target in the application of that theorem,
    it gives $\| frak(s) - y \| lt.eq C d_k$ on this parameter disk and on a fixed neighborhood of the row point.
    The passage is attached to the actual lift from below and stays inside the shape strip.
    Evenness in $t$ and Cauchy’s estimate therefore give
  #[#set math.equation(numbering: n => "(8.16)")
   $ lr(|frak(s) \( y \, t \) - y - t^2 V \( y \)|) lt.eq C d_k \( z b \( x \, k \) \)^4 quad
     upright("when ") \| t \| lt.eq r_(x \, k) \/ 2 . $ <critical:eq:Taylor-error>]
  The fixed factors in $c$ are included in the constant here.
  By (8.12) there is a center with $b \( x \, k \) lt.eq C$. The real no-patch transfer from 24 then implies
  #[#set math.equation(numbering: n => "(8.17)")
   $ Delta \( t \) lt.eq d_k quad upright("for real ") \| t \| lt.eq
     c thin d_k \/ N \( k \) . $ <critical:eq:basic-width>]
  This holds for all sufficiently large $k$; decreasing $c$ handles the remaining fixed compact range by joint
    analyticity near $t = 0$.
  For $j = k + h$, (8.7) gives
  $ frac(d_j, N \( j \)) gt.eq C_N^(- 1) frac(d_k, N \( k \)) e^(- \( 1 + a \) h) . $
  For small $z$, choose $h gt.eq 0$ so that $e^(- h) = C' z^(1 \/ \( 1 + a \))$,
    where the fixed constant $C'$ is large enough for (8.17) to apply at level $j$. This proves (8.13).
    Rounding $h$ to an integer, if desired, changes only a fixed constant.
  For the negative part, take $z = c' b^(- 4 \/ \( 4 - gamma \))$, with $c' > 0$ fixed sufficiently small.
    Since $b gt.eq 1$, this makes both $z b$ and $Delta \( t \) \/ d_k lt.eq C z^gamma$ small.
    In particular the row lies strictly inside the actual strip.
    Its actual lift agrees with the vertical passage in (8.16). Combining that estimate with (8.6) gives
  $ frac(d_k P^(-), N \( k \)^2) lt.eq C (z^(gamma - 2) + z^2 b^4) . $
  The two powers of $b$ coincide and equal the exponent in (8.14).
    Since $gamma > 0$, that exponent is strictly less than two. ◻
]

=== 8.2 The quadratic bootstrap and its moment improvement <the-quadratic-bootstrap-and-its-moment-improvement>

#thm([Lemma 8.3.])[
  #emph[On an inner tile, with a fixed enlargement on the right,
#[#set math.equation(numbering: n => "(8.18)")
 $ \( d_k M \)^2 lt.eq C (1 + sup d_k^2 \| W \|) . $ <critical:eq:disk-bound>]

]
] <critical:lem:disk-bound>

#proof[
  It is enough to prove the assertion on nested disks. In disk coordinates put $g = d_k f$ and $tilde(W) =
    d_k^2 W$. Then
  $ g'' = 1 / 8 g \( tilde(W) - g^2 \) . $
  Suppose that no universal bound $sup_(bb(D)) \| g \| lt.eq
    C \( 1 + sup_(2 bb(D)) \| tilde(W) \| \)^(1 \/ 2)$ holds.
    For a counterexample sequence choose in an intermediate disk a point maximizing $\|
    g \( z \) \|$ times its distance to that disk’s boundary.
    Write $m_n$ for the value of $\| g \|$ there and $r_n$ for that distance.
    Failure of the proposed estimate implies $r_n m_n arrow.r oo$ and $sup \| tilde(W) \| \/ m_n^2 arrow.r 0$.
    On the disk of radius $r_n \/ 2$ about the chosen point, maximality gives $\| g \| lt.eq 2 m_n$.
    Rescale space by $m_n^(- 1)$ and divide the function by $m_n$.
    After passage to a subsequence, the resulting functions converge on every compact subset of $bb(C)$ to an
    entire function $G$ with $\| G \| lt.eq 2$, $\| G \( 0 \) \| = 1$, and $G'' = - G^3 \/ 8$.
    Liouville’s theorem makes $G$ constant, which contradicts this equation and $\| G \( 0 \) \| = 1$.
    This bounds $f$. The identity $8 q = W - f^2$ bounds $q$ on the same inner disk.
    A finite disk covering proves (8.18). ◻
]

#thm([Theorem 8.4.])[
  (Critical moment bootstrap).  #emph[Let $N$ be an envelope as in 47, assume the first-moment bound (8.8),
    and suppose $sup_(k gt.eq k_0) mu \( k \) \/ N \( k \) < oo$. Then
#[#set math.equation(numbering: n => "(8.19)")
 $ mu \( k \) lt.eq C N \( k \) \, wide bb(E) frac(d_k \| P \|, N \( k \)^2) lt.eq C . $ <critical:eq:L2-bootstrap>]

 There is $eta > 0$, depending only on the fixed envelope constants, such that
#[#set math.equation(numbering: n => "(8.20)")
 $ ∥frac(d_k M, N \( k \))∥_(2 + eta) lt.eq C . $ <critical:eq:higher-moment>]

 The estimates for $M$ hold also with suprema on every fixed tile. If $N$ is nondecreasing, then in addition
#[#set math.equation(numbering: n => "(8.21)")
 $ sup_x d_k M lt.eq C \( 1 + k \) N \( k \) \, wide sup_x frac(d_k \| P \|, N \( k \)^2) lt.eq
   C \( 1 + k \)^2 . $ <critical:eq:global-envelope>]

]
] <thm:critical-bootstrap>

#proof[
  Let $C_(*) = sup_(j gt.eq k_0) mu \( j \) \/ N \( j \) < oo$.
    By (8.12), $parallel b \( dot.op \, k \) parallel_2 lt.eq C \( 1 + C_(*) \)$. Hence (8.15) gives
  $ bb(E) frac(d_k P^(-), N \( k \)^2) lt.eq C \( 1 + C_(*)^m \) . $
  The horizontal mean of $P$ is zero, so its positive and negative parts have equal integrals.
    Thus the same bound, with a factor two, holds for $\| P \|$.
  Interior harmonic estimates bound the supremum of $\| nabla P \|$ on a tile by $C
    d_k^(- 3)$ times the integral of $\| P \|$ on a fixed enlargement.
    Averaging in the horizontal center and using the bounds on neighboring rows gives
  $ bb(E) sup_(cal(T)_A \( k \, x \)) frac(d_k^2 \| W \|, N \( k \)^2) lt.eq C_A \( 1 + C_(*)^m \) . $
  Here (8.5) accounts for the fixed additive constant $chevron.l W chevron.r$, which is absorbed because $N gt.eq
    1$. The disk bound now yields $C_(*)^2 lt.eq C \( 1 + C_(*)^m \)$.
    Since $m < 2$, this bounds $C_(*)$ by a fixed constant and proves (8.19),
    including the tile version of its first assertion.
  We give the concentration estimate that improves the moment.
    Put $p = 2 \/ m > 1$ and $theta.alt = 1 - 1 \/ p > 0$. The bound for $b$ and (8.15) give,
    on all rows in any fixed range of depth ratios,
  #[#set math.equation(numbering: n => "(8.22)")
   $ ∥frac(d_k P^(-), N \( k \)^2)∥_p lt.eq C . $ <critical:eq:negative-Lp>]
  Partition the horizontal circle into intervals of lengths comparable to $d_k$.
    Select a nonempty collection of fractional total length $sigma$,
    and let $E$ be its enlargement by a fixed multiple of $d_k$.
    In particular $sigma gt.eq c d_k$, and $\| E \| \/ \( 2 pi \) lt.eq C sigma$.
    We estimate $P$ on $E$ on a row of depth $d'$ comparable to $d_k$.
  Choose $R gt.eq R_0$, with $R_0$ fixed sufficiently large, and suppose $R d_k$ is small.
    Harmonic extension from that row to depth $R d_k$, with zero data on the real row,
    is convolution with a positive periodic strip kernel $K$ of mass at most one. Before periodization its density is
  #[#set math.equation(numbering: n => "(8.23)")
   $ frac(1, 2 h') frac(sin \( pi l \/ h' \), cosh \( pi u \/ h' \) - cos \( pi l \/ h' \)) \, wide h' = H - d' \,
     quad l = R d_k - d' . $ <critical:eq:strip-kernel>]
  It is at least $c \/ \( R d_k \)$ when $\| u \| lt.eq R d_k$.
    Let $E_R$ be the enlargement of $E$ by a sufficiently large multiple of $R d_k$;
    it has fractional length at most $C min { 1 \, R sigma }$.
    Integrating first in the destination variable shows that a fixed fraction of the positive mass of $P$ on $E$
    contributes to $integral_(E_R) K * P^(+)$. As $K * P^(+) = P_(upright("coarse")) + K * P^(-)$, we obtain
  #[#set math.equation(numbering: n => "(8.24)")
   $ integral_E P^(+) thin frac(thin upright(d) x, 2 pi) lt.eq
     C
     (integral \| P_(upright("coarse")) \| thin frac(thin upright(d) x, 2 pi) + integral_(E_R) K * P^(-) thin
     frac(thin upright(d) x, 2 pi)) . $ <critical:eq:selected-P-plus>]
  The normalized first term is at most $C R^(2 beta - 1)$: at the coarse level $j = k - log R$,
    use $N \( j \) lt.eq C R^beta N \( k \)$ and $d_j = R d_k$ in (8.19).
    The convolution is an $L^p$ contraction, so Holder’s inequality and (8.22) bound the second normalized term by
    $C \( R sigma \)^theta.alt$. The negative mass directly on $E$ has the same bound. Consequently
  #[#set math.equation(numbering: n => "(8.25)")
   $ integral_E frac(d_k \| P \( x + upright(i) \( H - d' \) \) \|, N \( k \)^2) thin
     frac(thin upright(d) x, 2 pi) lt.eq C (R^(2 beta - 1) + \( R sigma \)^theta.alt) . $ <critical:eq:concentration-P>]
  The interior harmonic estimates used above, followed by 49, now give
  #[#set math.equation(numbering: n => "(8.26)")
   $ sum_(I med upright("selected")) \| I \| sup_(x in I) sup_(s in cal(T)_A \( k \, x \))
     frac(d_k^2 M \( s \)^2, N \( k \)^2) lt.eq C_A (sigma + R^(2 beta - 1) + \( R sigma \)^theta.alt) .
     $ <critical:eq:concentration-M>]
  To see that no concentration is lost in this passage, enlarge the selected intervals by the fixed horizontal
    margins needed for the harmonic estimates and integrate those estimates over the fixed range of neighboring
    depths. The enlarged intervals have bounded overlap and still total length $O \( sigma \)$,
    so (8.25) applies at every such depth.
  Take $R = R_0 sigma^(- 1 \/ 2)$. This is allowed for all sufficiently large $k$, since $sigma gt.eq
    c d_k$ gives $R d_k lt.eq C sqrt(d_k)$. The remaining compact range of $k$ is harmless.
    There is therefore $0 < zeta < 1$, depending only on $beta$ and $p$,
    such that the right side of (8.26) is at most $C_A sigma^zeta$.
    For example one may take any positive $zeta$ no larger than $min { \( 1 - 2 beta \) \/ 2 \, theta.alt \/ 2 }$.
  Let $A_k \( I \)$ be the supremum appearing in the sum in (8.26).
    Selecting the cells for which $A_k \( I \) > b_0 gt.eq 1$ gives
  $ bb(P) { A_k > b_0 } lt.eq C b_0^(- 1 \/ \( 1 - zeta \)) . $
  The exponent is greater than one. Integrating this distribution bound shows that $A_k$ has a uniformly bounded
    moment of some order $1 + eta \/ 2 > 1$. This proves (8.20), including its fixed-tile versions. ◻
]

#proof[
  Suppose $N$ is nondecreasing. We first prove that, for a fixed small $c_2 > 0$,
  #[#set math.equation(numbering: n => "(8.27)")
   $ Delta \( t \) lt.eq d_k \/ 4 wide (\| t \| lt.eq rho_k := frac(c_2 d_k, \( 1 + k \) N \( k \))) .
     $ <critical:eq:complex-deficit>]
  Choose a fixed $epsilon_0 > 0$ so small that (8.13) bounds $Delta$ by $d_k \/ 16$ on the real interval $\| u \|
    lt.eq u_0 := epsilon_0 d_k \/ N \( k \)$. For a fixed small parameter half-disk,
    harmonic upper comparison for the bounded subharmonic function $Delta$ gives, when $\| t \| lt.eq u_0 \/ 2$,
    an upper bound consisting of this near-diameter contribution,
    an $O \( \| t \| \)$ contribution from the curved boundary, and
  #[#set math.equation(numbering: n => "(8.28)")
   $ C \| t \| integral_(u_0)^(r_0) max { Delta \( u \) \, Delta \( - u \) } thin frac(thin upright(d) u, u^2) .
     $ <critical:eq:diameter-integral>]
  Here $r_0 > 0$ is fixed. The kernel bound follows directly from the upper-half-plane Poisson kernel on the
    diameter; the harmonic measure of the distant curved arc is $O \( \| t \| \)$.
    Upper semicontinuous boundary data cause no difficulty: apply the comparison first to continuous majorants and
    decrease them to the given data. The lower half-disk is handled in the same way.
  We claim that the integral in (8.28) is at most $C_(epsilon_0) \( 1 + k \) N \( k \)$.
    For earlier levels $j lt.eq k$, monotonicity gives $N \( j \) lt.eq N \( k \)$,
    so (8.17) implies $Delta \( u \) lt.eq d_j$ up to $\| u \| lt.eq c d_j \/ N \( k \)$.
    Divide the interval of integration into the corresponding ranges for $j = k \, k - 1 \, dots.h$,
    down to a fixed level. On each such range $Delta \( u \) lt.eq
    C d_j$ and its $u^(- 2)$ integral is at most $C N \( k \)$. The first range costs $C_(epsilon_0) N \( k \)$.
    Beyond the last one the boundedness of $Delta$ costs at most $C N \( k \)$.
    There are $O \( 1 + k \)$ ranges, proving the claim. Choosing $c_2$ small now proves (8.27).
  For $y$ at depth comparable to $d_k$, with a fixed neighborhood of that size,
    the actual lift is consequently holomorphic for $\| t \| <
    rho_k$ and satisfies $Im \( frak(s) \( y \, t \) - y \) lt.eq C d_k$. It vanishes at $t = 0$.
    The coefficient estimate for an analytic function with positive real part, applied to $C d_k +
    upright(i) \( frak(s) - y \)$, gives
  $ \| V \( y \) \| lt.eq C d_k rho_k^(- 2) . $
  This elementary estimate also follows by integrating the nonnegative real part on concentric circles and taking
    its second Fourier coefficient. It proves the asserted bound for $P$.
    Cauchy’s estimate in $y$, followed by (8.5), gives $\| W \| lt.eq C rho_k^(- 2) +
    C$ on a slightly smaller tile. The disk bound therefore gives $d_k M lt.eq C d_k \/ rho_k + C$,
    which is the other assertion in (8.21). ◻
]

=== 8.3 A weighted version with an ancestor row <a-weighted-version-with-an-ancestor-row>

We will need to concentrate horizontal centers near a selected ancestor,
  while retaining estimates at much finer depths. For $0 < d_a lt.double 1$,
  let $K_(d_a)$ be a normalized periodic probability kernel whose density,
  relative to $thin upright(d) x \/ \( 2 pi \)$, is uniformly comparable to

#[#set math.equation(numbering: n => "(8.29)")
 $ frac(d_a, d_a^2 + \| x \|_(upright("per"))^2) . $ <critical:eq:ancestor-kernel>]

The normalization factor in this comparison is bounded above and below independently of $d_a$.
  Given any probability $omega$ on the circle, put $nu = K_(d_a) * omega$.
  The following elementary properties will be used.

First, for every fixed $A$, the density of $nu$ changes by at most a fixed factor under translations of length at
  most $A d_a$. For the kernel this follows from the triangle inequality and

$ d_a^2 + \| u + h \|_(upright("per"))^2 lt.eq C_A \( d_a^2 + \| u \|_(upright("per"))^2 \)
  quad \( \| h \| lt.eq A d_a \) \, $

and convolution preserves the comparison. Second, if $d_j < d_a \/ 2$,
  the unnormalized upper-boundary harmonic-measure law from the ancestor point $x +
  upright(i) \( H - d_a \)$ to the row at depth $d_j$, with real bottom,
  is uniformly comparable to the translated kernel $K_(d_a)$.
  Indeed in (8.23) the distance from the upper row lies between $d_a \/ 2$ and $d_a$.
  On a fundamental horizontal interval the denominator is comparable to $d_a^2 + \| u \|^2$,
  with constants depending only on $H$; periodization contributes a comparable bounded tail.
  Mixing over $omega$ gives an unnormalized law comparable to $nu$.

#thm([Proposition 8.5.])[
  #emph[Let $N$ satisfy the hypotheses of 50, with fixed constants, and let $d_a =
    e^(- k_a)$ be a sufficiently small ancestor depth. Let $omega \, nu$ be as above,
    with fixed kernel comparison constants. Suppose that for every fixed tile enlargement needed below,
#[#set math.equation(numbering: n => "(8.30)")
 $ ∥sup_(s in cal(T)_A \( j \, x \)) d_j M \( s \)∥_(L^2 \( nu \)) lt.eq C_A N \( j \) \, wide k_0 lt.eq j lt.eq
   k_a + 3 \, $ <critical:eq:weighted-coarse>]

 and that
#[#set math.equation(numbering: n => "(8.31)")
 $ integral \| P \( x + upright(i) \( H - d_a \) \) \| thin thin upright(d) omega \( x \) lt.eq
   C frac(N \( k_a \)^2, d_a) . $ <critical:eq:weighted-anchor>]

 Then on all finer levels, and with every fixed tile enlargement,
#[#set math.equation(numbering: n => "(8.32)")
 $ ∥sup_(s in cal(T)_A \( j \, x \)) d_j M \( s \)∥_(L^2 \( nu \)) lt.eq
   C'_A N \( j \) . $ <critical:eq:weighted-conclusion>]

 The constants are independent of $k_a$, of $omega$, and of the finite bootstrap ratio.
   No higher weighted moment is asserted.]
] <prop:weighted-bootstrap>

#proof[
  It suffices first to bound row norms. Let $C_(*)$ be their supremum ratio to $N$ on the fine levels,
    enlarged to include the fixed coarse constants. This number is finite.
    For example, the density of $nu$ is bounded for each fixed ancestor,
    so finiteness follows from the unweighted finite-ratio hypothesis.
    This preliminary bound may depend on $d_a$; none of the estimates below will depend on it.
  Tile averaging on levels whose depths are at most a fixed multiple of $d_a$ is valid for $nu$,
    by its translation-comparison property. In the logarithmic summation defining $b$,
    use these fine tile bounds on that part of the cone, and use (8.30) on the coarser part. This gives
  #[#set math.equation(numbering: n => "(8.33)")
   $ parallel b \( dot.op \, j \) parallel_(L^2 \( nu \)) lt.eq C \( 1 + C_(*) \) . $ <critical:eq:weighted-b>]
  Fixed ranges immediately adjacent to the coarse cutoff are already covered by the assumed fixed tile
    enlargements at levels at most $k_a + 3$. In particular, choosing larger fixed interior-estimate neighborhoods
    does not create a gap at the cutoff.
  For $d_j < d_a \/ 2$, let $kappa_j$ be the mixed unnormalized harmonic-measure law from $omega$ to the row at
    depth $d_j$. Since $P = 0$ on the real bottom,
  $ integral P \( x + upright(i) \( H - d_j \) \) thin thin upright(d) kappa_j \( x \) =
    integral P \( x + upright(i) \( H - d_a \) \) thin thin upright(d) omega \( x \) . $
  The laws $kappa_j$ and $nu$ are comparable. Moreover the absolute value of the right side,
    in fine-row normalization, is at most
  #[#set math.equation(numbering: n => "(8.34)")
   $ C d_j / d_a frac(N \( k_a \)^2, N \( j \)^2) lt.eq C e^(- \( 1 - 2 beta \) \( j - k_a \)) lt.eq
     C . $ <critical:eq:anchor-decay>]
  The negative-part estimate (8.15), integrated using (8.33),
    bounds the normalized negative integral by $C \( 1 + C_(*)^m \)$.
    Taking the signed integral under $kappa_j$ first, and then using comparison of the two positive measures,
    therefore gives
  $ integral frac(d_j \| P \( x + upright(i) \( H - d_j \) \) \|, N \( j \)^2) thin thin upright(d) nu \( x \)
    lt.eq C \( 1 + C_(*)^m \) . $
  The strict inequality $2 beta < 1$ gives uniform decay in (8.34).
  Weighted interior harmonic estimates now follow by the same local averaging argument,
    since the required horizontal translations are of size $O \( d_j \)$.
    Combining them with 49 gives $C_(*)^2 lt.eq C \( 1 + C_(*)^m \)$,
    away from the already controlled fixed cutoff range. This bounds $C_(*)$ uniformly.
    One more application of weighted tile averaging proves (8.32). ◻
]

=== 8.4 A vanishing profile at one center is impossible <a-vanishing-profile-at-one-center-is-impossible>

The next result is deliberately stated for individual centers.
  A single quiet cone forces a global real-parameter width estimate,
  and the latter can then be tested against unweighted horizontal moments.

#thm([Theorem 8.6.])[
  (Exclusion of vanishing profiles at individual centers).  #emph[Consider sequences of levels $k_n arrow.r oo$,
    scales $d_n = e^(- k_n)$, and amplitudes $B_n = mu \( k_n \) arrow.r oo$.
    Suppose there are envelopes $N_n$ satisfying the hypotheses of 50 with constants independent of $n$,
    and $N_n \( k_n \) lt.eq C B_n$.]
  #emph[For a fixed $alpha in \( 1 \/ 2 \, 1 \)$ and a sufficiently large fixed aperture $L$,
    there cannot be centers $x_n$ such that, for every fixed $c > 0$,
#[#set math.equation(numbering: n => "(8.35)")
 $ sup_(c d_n lt.eq delta lt.eq delta_b\
\| Re s - x_n \| lt.eq L delta\
delta = H - Im s) frac(d_n M \( s \), B_n) (delta / d_n)^alpha arrow.r 0 . $ <critical:eq:quiet-cone>]

 In particular, suppose the profiles
#[#set math.equation(numbering: n => "(8.36)")
 $ F_n \( S \) = d_n / B_n f \( x_n + upright(i) H + d_n S \) \, wide Q_n \( S \) =
   (d_n / B_n)^2 q \( x_n + upright(i) H + d_n S \) $ <critical:eq:profiles>]

 converge to $\( 0 \, 0 \)$ on compact subsets of the lower half-plane.
   They cannot also satisfy, for some fixed $alpha_0 > 1 \/ 2$ and an aperture $L$ sufficiently large for a chosen
   exponent $1 \/ 2 < alpha < min \( 1 \, alpha_0 \)$,
#[#set math.equation(numbering: n => "(8.37)")
 $ d_n / B_n M \( s \) lt.eq
   C (d_n / delta)^(alpha_0) quad \( d_n lt.eq delta lt.eq delta_b \, med \| Re s - x_n \| lt.eq L delta \) .
   $ <critical:eq:bounded-coarse-cone>]

 Every compact holomorphic limit of the pair in (8.36) is pure: its product $F Q$ vanishes identically.]
] <thm:no-trivial-profile>

#proof[
  Suppose first that (8.35) holds. For any fixed $c \, T_0 > 0$,
    apply 34 at a depth which is a fixed small multiple of $c d_n$, and with parameter radius $T_0 d_n \/ B_n$.
    The ratio of this radius to the target depth tends to zero.
    Thus its fixed $K = 1$ regime suffices, and its aperture can be chosen once, independently of $c \, T_0$.
    The weighted smallness in (8.35) supplies its small parameter. The real no-patch transfer gives
  $ Delta \( T d_n \/ B_n \) lt.eq c d_n quad \( \| T \| lt.eq T_0 \) $
  for all sufficiently large $n$. Since $c > 0$ is arbitrary,
  #[#set math.equation(numbering: n => "(8.38)")
   $ sup_(\| T \| lt.eq T_0) frac(Delta \( T d_n \/ B_n \), d_n) arrow.r
     0 wide \( T upright(" real") \) . $ <critical:eq:vanishing-width>]
  We show that this width estimate alone contradicts $B_n = mu \( k_n \)$.
    Let $j - k_n$ vary in an arbitrary fixed compact interval.
    The envelope inequalities imply $N_n \( j \) lt.eq C B_n$, with a constant uniform on that interval.
    By the quadratic bootstrap and (8.12), the cone costs $b \( x \, j \)$ have uniformly bounded second moments.
    Also (8.15) gives
  #[#set math.equation(numbering: n => "(8.39)")
   $ frac(d_n P^(-) \( x + upright(i) \( H - d_j \) \), B_n^2) lt.eq C b \( x \, j \)^m \, wide
     m < 2 . $ <critical:eq:uniform-integrability>]
  These variables are uniformly integrable: their $2 \/ m$-moments are bounded, and $2 \/ m > 1$.
  Fix a cutoff $A > 1$ and work where $b \( x \, j \) lt.eq A$.
    Take $t = T d_n \/ B_n$ with a fixed nonzero $T$ small enough for the Taylor estimate at all these points.
    By (8.38), the relevant rows lie in the actual strip for large $n$.
    Combining (8.6) and (8.16), now in this normalization, gives
  $ frac(d_n P^(-), B_n^2) lt.eq C frac(Delta \( T d_n \/ B_n \), T^2 d_n) + C T^2 A^4 . $
  Given a positive threshold, first choose $A$ so that the complement has small probability,
    then choose $\| T \|$ so that the second term is below that threshold, and finally let $n arrow.r oo$.
    This proves convergence to zero in probability. The uniform integrability in (8.39) gives convergence in mean,
    uniformly on every fixed range of $j - k_n$.
  The signed horizontal mean of $P$ is zero, so the same conclusion holds for $d_n \| P \| \/ B_n^2$.
    Interior harmonic estimates, using a fixed range of neighboring depths, imply
  $ bb(E) sup_(upright("fixed tile")) frac(d_n^2 \| W \|, B_n^2) arrow.r 0 . $
  The disk bound and $B_n arrow.r oo$ now imply
  $ frac(mu \( k_n \)^2, B_n^2) arrow.r 0 \, $
  contradicting its value one.
  For the stated consequence, choose $1 \/ 2 < alpha < min { 1 \, alpha_0 }$.
    On the part of the cone with $delta \/ d_n gt.eq R$, (8.37) bounds the expression in (8.35) by $C
    R^(alpha - alpha_0)$. On each remaining compact part with $c lt.eq delta \/ d_n lt.eq R$,
    the assumed profile convergence makes it tend to zero. Letting $R arrow.r oo$ proves (8.35),
    which was just excluded. In fact compact convergence within this fixed cone is enough for the argument.
  Finally the scaled differential identity is
  $ partial_S^2 F_n = B_n^2 Q_n F_n . $
  Compact holomorphic convergence bounds its left side. Dividing by $B_n^2$ and passing to the limit gives $F Q =
    0$. On the connected lower half-plane, a nonzero analytic factor then forces the other factor to vanish
    identically. ◻
]

=== 8.5 The sequence to be excluded and the angle-budget reduction <the-sequence-to-be-excluded-and-the-angle-budget-reduction>

We specify the input to the next Section before deriving the consequences of its exclusion.
  For a probability $nu_n$ on horizontal centers, convergence in probability uniformly on a compact set means that
  the probability of the supremum exceeding each fixed positive threshold tends to zero.

#prodef([Definition 8.7.])[
  A prohibited sequence consists of the following data in the critical setting of this Section:
  + Levels $k_n arrow.r oo$, amplitudes $B_n = mu \( k_n \) arrow.r oo$, and numbers $epsilon_n arrow.b 0$ such that
    #[#set math.equation(numbering: n => "(8.40)")
     $ mu \( j \) lt.eq B_n e^(epsilon_n \| j - k_n \|) wide \( j gt.eq k_0 \) . $ <critical:eq:primary-normality>]
  + Ancestors $k_(a \, n) = k_n - s_n$, with both $k_(a \, n) arrow.r oo$ and $s_n arrow.r oo$,
    and probabilities $omega_n$ and $nu_n = K_(d_(a \, n)) * omega_n$, where $d_(a \, n) =
    e^(- k_(a \, n))$ and the kernels obey (8.29) with comparison constants independent of $n$.
  + For every fixed $0 < beta < 1 \/ 2$ and every fixed tile enlargement $A$,
    there is a constant $C_(beta \, A)$ such that, eventually in $n$, simultaneously for all $k_0 lt.eq j lt.eq
    k_(a \, n) + 3$,
    #[#set math.equation(numbering: n => "(8.41)")
     $ ∥sup_(s in cal(T)_A \( j \, x \)) d_j M \( s \)∥_(L^2 \( nu_n \)) lt.eq
       C_(beta \, A) B_n e^(beta \( k_n - j \)) . $ <critical:eq:prohibited-coarse>]
    For every such $beta$ there is also a constant $C_beta$ such that, eventually,
    #[#set math.equation(numbering: n => "(8.42)")
     $ integral \| P \( x + upright(i) \( H - d_(a \, n) \) \) \| thin thin upright(d) omega_n \( x \) lt.eq
       C_beta frac(B_n^2 e^(2 beta \( k_n - k_(a \, n) \)), d_(a \, n)) . $ <critical:eq:prohibited-anchor>]
    The constants and the threshold for “eventually” may depend on the indicated fixed choices, but not on $j$ or $n$.
  + With $d_n = e^(- k_n)$, for every compact subset $cal(K)$ of ${ Im S < 0 }$,
    #[#set math.equation(numbering: n => "(8.43)")
     $ sup_(S in cal(K)) lr(|(d_n / B_n)^2 q \( x + upright(i) H + d_n S \)|) arrow.r 0 quad
       upright("in ") nu_n upright("-probability") . $ <critical:eq:prohibited-Q>]
] <def:prohibited-sequence>

For fixed $beta \, a > 0$, with $beta < 1 \/ 2$, primary normality controls the unweighted moments by an envelope
  of the form

$ N_n \( j \) = B_n exp #scale(x: 120%, y: 120%)[\(] beta \( k_n - j \)_(+) +
  a \( j - k_n \)_(+) #scale(x: 120%, y: 120%)[\)] . $

Thus 51 applies to this envelope using (8.41) and (8.42).
  This observation uses none of the conditional conclusions below.
  It is the reason the ancestors are included in the definition.

We will also use an elementary way to propagate a logarithmic deficit.
  If $U gt.eq 0$ is superharmonic and two small disks have comparable radii, nearby centers,
  and a sufficiently enlarged common disk contained in its domain, then

#[#set math.equation(numbering: n => "(8.44)")
 $ "av"_(D_2) U lt.eq C "av"_(D_1) U . $ <critical:eq:deficit-step>]

Indeed, for each point of $D_1$, a disk centered there and of a fixed multiple of the common radius contains $D_2$
  and remains inside the domain. Positivity and the supermean inequality bound the average on $D_2$ by a constant
  times the value at that point; integration over $D_1$ proves the claim.
  Starting with a disk centered at a point where $U$ is finite, the first average is at most that value.
  A chain of $m$ such steps therefore costs at most $C^m$. In the upper strip,
  one can connect points with logarithmic depth separation $s$,
  and with a horizontal displacement bounded by a fixed multiple of the larger depth,
  by $O \( 1 + s \)$ disks of radii small fixed multiples of their depths.
  All enlarged disks can be kept in a fixed slightly wider range of logarithmic depths.
  This argument applies to $K - log \| f \|$, including its logarithmic poles at zeros; it uses disk averages,
  not a pointwise Harnack inequality for superharmonic functions.

#thm([Proposition 8.8.])[
  #emph[Assume that no sequence in 53 exists. Then there are $C > 0$ and $epsilon_1 in \( 0 \, 1 \)$ such that
#[#set math.equation(numbering: n => "(8.45)")
 $ mu_f \( k \) lt.eq C \( 1 + k \)^(1 - epsilon_1) wide \( k gt.eq k_0 \) . $ <critical:eq:mu-f-saving>]

]
] <critical:prop:power-saving>

#proof[
  Suppose otherwise. We first choose levels $kappa_n arrow.r oo$ and values $b_n = mu_f \( kappa_n \)$ such that
  #[#set math.equation(numbering: n => "(8.46)")
   $ b_n & gt.eq kappa_n^(1 - o \( 1 \)) \,\
mu_f \( j \) & lt.eq b_n quad \( k_0 lt.eq j lt.eq kappa_n \) \,\
mu_f \( j \) & lt.eq b_n e^(eta_n \( j - kappa_n \)) quad \( j gt.eq kappa_n \) \, wide eta_n arrow.r
  0 . $ <critical:eq:f-record>]
  Here is an explicit selection. Failure of (8.45) provides arbitrarily large levels with $mu_f gt.eq
    k^(1 - 1 \/ n)$. Replace such a level by a maximum of $mu_f$ over all earlier levels;
    denote the resulting record level by $u_n$. The record values tend to infinity, so $u_n arrow.r oo$,
    and they still exceed $u_n^(1 - 1 \/ n)$. Choose $eta_n arrow.r 0$ with $eta_n gt.eq 1 \/ u_n$.
    Maximize $mu_f \( j \) e^(- eta_n \( j - u_n \))$ on $j gt.eq u_n$, and call a maximizer $kappa_n$.
    It exists by (8.2). It is still a record among all earlier levels. Its value satisfies
  $ b_n gt.eq u_n^(1 - 1 \/ n) e^(eta_n \( kappa_n - u_n \)) gt.eq kappa_n^(1 - 1 \/ n) \, $
  where we used $log \( kappa_n \/ u_n \) lt.eq \( kappa_n - u_n \) \/ u_n$.
    The maximizing property gives the last inequality in (8.46).
  For each fixed $eta > 0$, and all sufficiently large $n$, set
  $ N_(n \, eta) \( j \) = \( b_n + kappa_n \) e^(eta \( j - kappa_n \)_(+)) . $
  This nondecreasing envelope controls the first moment uniformly in $n$.
    For $\| f \|$ use (8.46); for $\| q \|^(1 \/ 2)$ use (8.3) and $1 + j lt.eq
    C_eta \( 1 + kappa_n \) e^(eta \( j - kappa_n \))$ on the future side.
    Its finite-ratio hypothesis follows from its exponential tail. 50 consequently gives
  #[#set math.equation(numbering: n => "(8.47)")
   $ mu \( j \) lt.eq C_eta \( b_n + kappa_n \) e^(eta \( j - kappa_n \)_(+)) \, wide d_j max M lt.eq
     C_eta \( 1 + j \) \( b_n + kappa_n \) e^(eta \( j - kappa_n \)_(+)) . $ <critical:eq:record-envelope>]
  Fix one positive $eta$ to use the higher-moment assertion, and let $p > 2$ be the resulting exponent.
    On the row $kappa_n$ put
  $ E_n = { x : d_(kappa_n) \| f \( x + upright(i) \( H - d_(kappa_n) \) \) \| gt.eq b_n \/ 2 } \, wide p_n =
    bb(P) \( E_n \) . $
  Holder’s inequality gives
  $ 3 / 4 b_n^2 lt.eq C \( b_n + kappa_n \)^2 p_n^(1 - 2 \/ p) . $
  Therefore
  #[#set math.equation(numbering: n => "(8.48)")
   $ p_n gt.eq c (frac(b_n, b_n + kappa_n))^(2 p \/ \( p - 2 \)) = kappa_n^(- o \( 1 \)) . $ <critical:eq:event-cost>]
  We next select a normal level for the full moment. For any fixed small $epsilon > 0$,
    maximize $mu \( j \) e^(- epsilon \| j - kappa_n \|)$ over $j gt.eq k_0$.
    Let $k$ be a maximizer and $B = mu \( k \)$. The triangle inequality gives
  #[#set math.equation(numbering: n => "(8.49)")
   $ mu \( j \) lt.eq B e^(epsilon \| j - k \|) \, wide B gt.eq b_n . $ <critical:eq:discount-normality>]
  Using (8.47) with rate $epsilon \/ 2$ also gives
  $ \| k - kappa_n \| lt.eq 2 / epsilon log (frac(C_epsilon \( b_n + kappa_n \), b_n)) . $
  For fixed $epsilon$, the right side is $o \( log kappa_n \)$, by (8.46).
    A slow diagonal choice thus gives $epsilon_n arrow.b 0$ and maximizing levels $k_n$ such that
  #[#set math.equation(numbering: n => "(8.50)")
   $ B_n^(upright("new")) := mu \( k_n \) gt.eq b_n \, wide \| k_n - kappa_n \| = o \( log kappa_n \) \,
     $ <critical:eq:small-shift>]
  while (8.49) holds with $epsilon = epsilon_n$. For the remainder of this proof write $B_n =
    B_n^(upright("new"))$; the record value remains denoted by $b_n$.
  Choose $s_n arrow.r oo$, $s_n = o \( log kappa_n \)$, so slowly that it dominates both $\| k_n -
    kappa_n \|$ and $log \( 1 \/ p_n \)$. Such a choice is possible by (8.48) and (8.50);
    for example take the geometric mean of $log kappa_n$ and $1 + \| k_n - kappa_n \| + log \( 1 \/ p_n \)$.
    Set $k_(a \, n) = k_n - s_n$, let $omega_n$ be uniform horizontal measure conditioned on $E_n$,
    and let $nu_n = K_(d_(a \, n)) * omega_n$. Both $omega_n$ and $nu_n$ have densities at most $p_n^(- 1) =
    e^(o \( s_n \))$ relative to uniform measure.
  We check all ancestor bounds. Fix $0 < beta < 1 \/ 2$, a tile enlargement, and $0 < beta_0 < beta$.
    Primary normality and tile averaging give the unweighted bound
  $ ∥sup_(cal(T)_A \( j \, x \)) d_j M∥_2 lt.eq C_A B_n e^(beta_0 \( k_n - j \)) quad \( j lt.eq k_(a \, n) + 3 \) $
  for large $n$. Passing to $nu_n$ costs at most $p_n^(- 1 \/ 2)$.
    This is absorbed by $e^(\( beta - beta_0 \) \( k_n - j \))$, uniformly on that range because $k_n - j gt.eq
    s_n - 3$. For the anchor, apply the $P$ estimate of 50 to the envelope
  $ B_n exp #scale(x: 120%, y: 120%)[\(] beta_0 \( k_n - j \)_(+) + a_0 \( j - k_n \)_(+) #scale(x: 120%, y: 120%)[\)] $
  with any fixed $a_0 > 0$. Primary normality supplies its hypotheses.
    Conditioning costs $p_n^(- 1)$, which is absorbed by $e^(2 \( beta - beta_0 \) s_n)$.
    This proves (8.41) and (8.42), with constants independent of $n$ for every fixed choice.
  It remains to prove (8.43). Fix a compact set $cal(K)$ in the lower half-plane and a fixed $A > 1$.
    For a center $x_0 in E_n$, consider all target disks needed to control $q$ on $x + upright(i) H + d_n cal(K)$,
    where $\| x - x_0 \|_(upright("per")) lt.eq A d_(a \, n)$.
    One can connect the initial point at level $kappa_n$ to these disks by first moving to the ancestor row,
    moving horizontally there, and then moving to the target depth.
    The number of depth-sized disks required is $O_A \( 1 + s_n + \| k_n - kappa_n \| \) = o \( log kappa_n \)$.
  On a fixed enlargement of this entire range, (8.47) implies
  $ log \| f \| lt.eq U_n^(*) := kappa_n + log b_n + C log kappa_n . $
  Here $C$ can be fixed: all level changes are $o \( log kappa_n \)$, and $log \( \( b_n + kappa_n \) \/ b_n \) =
    o \( log kappa_n \)$. At the initial point in $E_n$, the nonnegative superharmonic deficit $U_n^(*) -
    log \| f \|$ is $O \( log kappa_n \)$. The disk-chain estimate (8.44) bounds its average on every target disk
    by $kappa_n^(o \( 1 \))$, uniformly in the indicated centers. 45, with fixed inner margins, therefore gives
  $ sup_(S in cal(K)) d_n \| q \( x + upright(i) H + d_n S \) \|^(1 \/ 2) lt.eq kappa_n^(o \( 1 \)) . $
  Since $B_n gt.eq b_n gt.eq kappa_n^(1 - o \( 1 \))$, this is negligible relative to $B_n$.
  Under $nu_n$, a center can be sampled by first choosing $x_0$ with law $omega_n$ and then adding the kernel
    increment. The probability that its periodic distance exceeds $A d_(a \, n)$ is at most $C \/ A$,
    uniformly in $n$. For every fixed $A$, the preceding estimate holds on the complement.
    First let $n arrow.r oo$, and then let $A arrow.r oo$. This proves (8.43).
    We have constructed all the data of 53, a contradiction. ◻
]

#thm([Corollary 8.9.])[
  #emph[Assume that no sequence in 53 exists. Then, for all $k gt.eq k_0$,
#[#set math.equation(numbering: n => "(8.51)")
 $ mu \( k \) lt.eq C \( 1 + k \) \, wide d_k max_x M lt.eq C \( 1 + k \)^2 \, wide d_k max_x \| P \| lt.eq
   C \( 1 + k \)^4 . $ <critical:eq:polynomial-bounds>]

 All fixed tile enlargements have the corresponding bounds.]
] <cor:critical-polynomial-bounds>

#proof[
  By 54 and (8.3), $bb(E) d_j M lt.eq C \( 1 + j \)$. At a target level $K$, use the nondecreasing envelope
  $ N_K \( j \) = cases(delim: "{", 1 + j \, & k_0 lt.eq j lt.eq K \,, \( 1 + K \) e^(j - K) \, & j gt.eq K .) $
  Its envelope and first-moment constants are independent of $K$,
    and its exponential tail makes the bootstrap ratio finite. Apply 50 at $K$.
    Since $N_K \( K \) = 1 + K$, all three assertions follow.
    Fixed tile versions follow by applying the same row estimates on their fixed ranges of depth ratios. ◻
]

#thm([Lemma 8.10.])[
  #emph[Assume that no sequence in 53 exists, and fix $0 < alpha < 1 \/ 2$. Set
$ G_f \( j \) = log max_x \| f \( x + upright(i) \( H - e^(- j) \) \) \| . $

 There are constants $C \, c > 0$ and a sufficiently large $K_0$ such that every $kappa gt.eq
   K_0$ with $mu_f \( kappa \) gt.eq kappa^alpha$ satisfies
#[#set math.equation(numbering: n => "(8.52)")
 $ G_f \( kappa + C log kappa \) - G_f \( kappa - C log kappa \) gt.eq
   c mu_f \( kappa \) . $ <critical:eq:growth-charge>]

]
] <critical:lem:growth-charge>

#proof[
  The function $G_f$ is nondecreasing: apply the maximum principle between two opposite rows and use real
    symmetry. Suppose the claimed constants do not exist. We may choose $kappa_n arrow.r oo$ and $C_n arrow.r oo$,
    with $C_n log kappa_n = o \( kappa_n \)$, such that $b_n := mu_f \( kappa_n \) gt.eq kappa_n^alpha$ and
  #[#set math.equation(numbering: n => "(8.53)")
   $ G_f \( kappa_n + C_n log kappa_n \) - G_f \( kappa_n - C_n log kappa_n \) =
     o \( b_n \) . $ <critical:eq:failed-charge>]
  For clarity one can first set $C_n = n$, require the increment to be less than $b_n \/ n$,
    and then choose the violating level larger than any prescribed threshold.
  Maximize $mu \( j \) e^(- epsilon_n \| j - kappa_n \|)$, where $epsilon_n arrow.b 0$ sufficiently slowly,
    and denote the maximizer by $k_n$, with $B_n = mu \( k_n \) gt.eq b_n$.
    The maximizing argument in (8.49) gives primary normality.
    The polynomial bound $mu \( j \) lt.eq C \( 1 + j \)$ shows that
  $ \| k_n - kappa_n \| = O \( epsilon_n^(- 1) log kappa_n \) . $
  Indeed, on the future side use $\( 1 + j \) \/ \( 1 + kappa_n \) lt.eq
    e^(\( j - kappa_n \) \/ \( 1 + kappa_n \))$ and choose $epsilon_n gt.eq 2 \/ \( 1 + kappa_n \)$;
    the past side is immediate. We can therefore arrange
  $ \| k_n - kappa_n \| = o \( C_n log kappa_n \) \, wide log kappa_n + \| k_n -
    kappa_n \| lt.double s_n lt.double C_n log kappa_n . $
  Here both ratios denoted by $lt.double$ tend to zero. For example, after a further slow choice of $C_n$,
    one may use $epsilon_n = C_n^(- 1 \/ 3)$ and $s_n = C_n^(2 \/ 3) log kappa_n$.
    Set $k_(a \, n) = k_n - s_n$; then $k_(a \, n) arrow.r oo$.
    Choose a horizontal maximizer $x_(a \, n)$ of $\| f \|$ on the ancestor row,
    take $omega_n$ to be its point mass, and put $nu_n = K_(d_(a \, n)) * omega_n$.
  For every fixed $beta > 0$, the coarse and anchor hypotheses follow directly from (8.51).
    Indeed all required coarser tile suprema are $O_A \( \( 1 + k_n \)^2 \)$,
    whereas $B_n e^(beta \( k_n - j \))$ is at least $kappa_n^alpha e^(beta \( s_n - 3 \))$ for $j lt.eq
    k_(a \, n) + 3$. The latter dominates every fixed polynomial in $kappa_n$, since $s_n \/ log kappa_n arrow.r
    oo$. Similarly the normalized ancestor bound for $P$ is $O \( \( 1 + k_(a \, n) \)^4 \)$,
    and is dominated by $B_n^2 e^(2 beta s_n)$. These are supremum estimates,
    so no bound on the density of the point mass is needed.
  Fix a compact target set $cal(K) subset { Im S < 0 }$, and choose a fixed $C' > 0$ so that the row $k_n +
    C'$ is above all the target disks and their fixed enlargements.
    On the periodic strip from the real row to that row, put
  $ U_n \( s \) = G_f \( k_n + C' \) - log \| f \( s \) \| gt.eq 0 . $
  At the chosen ancestor point, monotonicity and (8.53) give
  #[#set math.equation(numbering: n => "(8.54)")
   $ U_n \( x_(a \, n) + upright(i) \( H - d_(a \, n) \) \) = G_f \( k_n + C' \) - G_f \( k_(a \, n) \) =
     o \( b_n \) = o \( B_n \) . $ <critical:eq:small-ancestor-deficit>]
  Both levels in this difference lie inside the interval in (8.53), for sufficiently large $n$.
  For any row in the fixed target range, apply positive superharmonic comparison to $U_n$ from the ancestor,
    using the real bottom. The upper-boundary harmonic-measure law is comparable to $nu_n$,
    because its depth is $o \( d_(a \, n) \)$. The bottom contribution is nonnegative. It follows that
  $ integral U_n \( x + upright(i) \( H - d_j \) \) thin thin upright(d) nu_n \( x \) = o \( B_n \) $
  uniformly over that fixed range of $j - k_n$. The comparison can be justified first for the superharmonic
    truncations $min { U_n \, R }$ and then by monotone convergence.
    Averaging over the target disks has the same bound: their horizontal shifts are $O \( d_n \)$,
    and the density of $nu_n$ changes by bounded factors under those shifts.
  Apply 45 on a finite covering of the target compact set by disks with fixed inner margins. It yields
  $ integral sup_(S in cal(K)) d_n \| q \( x + upright(i) H + d_n S \) \|^(1 \/ 2) thin thin upright(d)
    nu_n \( x \) lt.eq C + o \( B_n \) . $
  Since $B_n arrow.r oo$, Markov’s inequality proves (8.43).
    Together with the preceding normality and ancestor estimates this constructs a prohibited sequence,
    the required contradiction. ◻
]

#thm([Theorem 8.11.])[
  (Conditional angle-budget reduction).  #emph[If no sequence in 53 exists, then for some $epsilon > 0$ and $C < oo$,
#[#set math.equation(numbering: n => "(8.55)")
 $ integral_(k_0)^K mu_f \( k \)^2 thin thin upright(d) k lt.eq
   C \( 1 + K \)^(2 - epsilon) wide \( K gt.eq k_0 \) . $ <critical:eq:angle-budget>]

 In particular 58 will establish this conclusion and 55 in the critical case.]
] <thm:angle-budget-reduction>

#proof[
  Fix $0 < alpha < 1 \/ 2$ and split the sufficiently large levels into the high set $cal(A) = { k :
    mu_f \( k \) gt.eq k^alpha }$ and its complement. By 56,
  $ integral_(cal(A) ∩ \[ K_0 \, K \]) mu_f \( k \) thin thin upright(d) k lt.eq
    C integral_(K_0)^K \[ G_f \( k + C log k \) - G_f \( k - C log k \) \] thin thin upright(d) k . $
  The polynomial bound gives $G_f \( v \) lt.eq v + C log \( 2 + v \)$.
    Since $G_f$ is nondecreasing, its positive Stieltjes measure can be used to evaluate the last integral.
    Each point of that measure is counted for a set of $k$’s of length at most $2 C log K$.
    Its total mass over the relevant interval, whose upper endpoint is $K + C log K$, is $O \( K \)$.
    The lower endpoint can be kept fixed by increasing $K_0$. Hence
  $ integral_(cal(A) ∩ \[ K_0 \, K \]) mu_f \( k \) thin thin upright(d) k = O \( K log K \) . $
  Multiplying by the bound from 54 gives
  $ integral_(cal(A) ∩ \[ K_0 \, K \]) mu_f \( k \)^2 thin thin upright(d) k lt.eq C K^(2 - epsilon_1) log K . $
  On the complementary set the integral is at most $integral_(K_0)^K k^(2 alpha) thin thin upright(d) k =
    O \( K^(1 + 2 alpha) \)$. Both have a positive power saving from $K^2$;
    decreasing that power slightly absorbs the logarithm and the initial compact range. This proves (8.55). ◻
]

== 9 The critical moment law and its first-field model <sec:model>

We now establish the missing input to the critical estimates: the exclusion of the sequences in 53.
  The exclusion has two parts. A sufficiently steep part of the moment law produces one of the exponential
  profiles already ruled out by 40. Otherwise, after another change of scale, the first field has a nonzero limit.
  Its limiting impact equation forces both an upper growth estimate and large values near every boundary location.
  These two estimates are incompatible with the fact that the quotient of its second derivative by the field is
  holomorphic.

#thm([Theorem 9.1.])[
  (Exclusion of the critical sequence).  #emph[There is no sequence satisfying 53.]
] <thm:sequence-exclusion>

We prove the theorem below. Until that proof is completed,
  neither the angle budget nor the polynomial bounds conditional on this theorem will be used.

=== 9.1 The limiting moment law <model:moment-subsection>

Suppose, for contradiction, that a prohibited sequence is given. Write its primary level, depth, and normalization as

$ k = k_n \, wide d = d_n = e^(- k_n) \, wide B = B_n = mu \( k_n \) arrow.r oo . $

Thus, for some $epsilon_n arrow.r 0$,

#[#set math.equation(numbering: n => "(9.1)")
 $ mu \( l \) lt.eq B e^(epsilon_n \| l - k \|) wide \( l gt.eq k_0 \) . $ <model:primary-normality>]

Expectation without a subscript in a horizontal moment means normalized Lebesgue measure on one period.
  At physical depth $d D$, set

#[#set math.equation(numbering: n => "(9.2)")
 $ m_n \( D \) = d /
   B
   (bb(E) #scale(x: 120%, y: 120%)[\(] \| f \|^2 + \| q \| #scale(x: 120%, y: 120%)[\)])^(1 \/ 2) = frac(mu \( k -
   log D \), B D) . $ <model:primary-moment>]

Each fixed compact subinterval of $0 < D < oo$ is contained in the domain of this definition for all sufficiently
  large $n$.

#thm([Lemma 9.2.])[
  (Compactness of the moment law).  #emph[After passage to a subsequence,
    $m_n$ converges locally uniformly on $\( 0 \, oo \)$ to a positive function $m$. It satisfies
#[#set math.equation(numbering: n => "(9.3)")
 $ m \( 1 \) = 1 \, wide m \( D \) lt.eq D^(- 1) \, wide log m upright(" is convex as a function of ") D .
   $ <model:moment-properties>]

]
] <model:moment-compactness>

#proof[
  For a periodic holomorphic function, its horizontal $L^p$ norm, $p gt.eq 1$, is log-convex in the height.
    One way to see this is to regard horizontal translates of the function as a Banach-space-valued analytic
    function and apply the three-lines theorem to bounded linear functionals.
    Equivalently, apply the scalar three-lines theorem followed by the dual description of the $L^p$ norm.
    We use this for the $L^2$ norm of $f$ and the $L^1$ norm of $q$.
    If $A$ and $C$ are nonnegative log-convex functions, then their sum is log-convex:
    the required interpolation inequality follows from Holder’s inequality applied to $A_0^(1 - theta) A_1^theta +
    C_0^(1 - theta) C_1^theta$. Consequently $log m_n$ is convex.
    A field which is identically zero can simply be omitted from this argument.
  The normalization gives $m_n \( 1 \) = 1$, and (9.1) gives
  $ m_n \( D \) lt.eq D^(- 1) exp \( epsilon_n \| log D \| \) . $
  Thus $log m_n$ is uniformly bounded above on every compact subinterval.
    Convexity and its value zero at $1$ give a lower bound there as well.
    For example, if $D < 1 < D_(+)$, use the convexity inequality at $1$,
    viewed as a convex combination of $D$ and $D_(+)$, and the upper bound at $D_(+)$.
    For $D > 1$, use a point $D_(-) < 1$. Bounds on a slightly larger compact interval bound the slopes of a
    convex function on the smaller one. Arzela–Ascoli and a diagonal subsequence therefore give a finite locally
    uniform limit for $log m_n$. Exponentiating proves positivity, and all the properties in (9.3) pass to the limit. ◻
]

Put

#[#set math.equation(numbering: n => "(9.4)")
 $ rho \( x \) = - log m \( e^x \) . $ <model:rho-definition>]

This use of $rho$ concerns only the moment law. It is unrelated to the curvature radius of the original billiard.
  The function $rho$ is increasing and locally Lipschitz, and

$ rho \( 0 \) = 0 \, wide rho \( x \) gt.eq x . $

Indeed, the convex function $log m \( D \)$ tends to $- oo$ as $D arrow.r oo$,
  so each of its one-sided derivatives is strictly negative.
  With the left derivative used at exceptional points, let $p \( x \) = rho'_(-) \( x \) > 0$.
  Monotonicity of the one-sided derivative of $log m$ gives

#[#set math.equation(numbering: n => "(9.5)")
 $ p \( v \) lt.eq e^(v - u) p \( u \) wide \( v gt.eq u \) . $ <model:slope-inequality>]

#thm([Lemma 9.3.])[
  (Contact dichotomy).  #emph[Fix $c in \( 1 \/ 2 \, 1 \)$, and define
#[#set math.equation(numbering: n => "(9.6)")
 $ rho_c \( x \) = c x + inf_(v gt.eq x) #scale(x: 120%, y: 120%)[\(] rho \( v \) -
   c v #scale(x: 120%, y: 120%)[\)] . $ <model:contact-envelope>]

 A point is called a contact if $rho \( x \) = rho_c \( x \)$. Exactly one of the following alternatives is needed.]
  + #emph[There are contacts tending to $+ oo$ at which $p$ is unbounded.
    In that case there exist $x_j arrow.r oo$, $P_j = p \( x_j \) arrow.r oo$, and $D_j = e^(x_j)$ such that
#[#set math.equation(numbering: n => "(9.7)")
 $ frac(m \( D_j \( 1 - u \/ P_j \) \), m \( D_j \)) arrow.r e^u $ <model:exponential-moment-tangent>]

 uniformly on bounded real $u$-intervals. For every fixed $alpha_0 in \( 1 \/ 2 \, c \)$, these choices can also satisfy
#[#set math.equation(numbering: n => "(9.8)")
 $ frac(m \( D_j \( 1 + v \/ P_j \) \), m \( D_j \)) lt.eq C \( 1 + v \)^(- alpha_0) wide \( v gt.eq 1 \) \,
   $ <model:contact-power-tail>]

 with $C$ independent of $j$.]
  + #emph[The slopes at all sufficiently large contacts are bounded.
    There exist $x_j arrow.r oo$, a locally Lipschitz function $rho_(*)$ with $rho_(*) \( 0 \) = 0$,
    and a finite $lambda gt.eq 1$ such that
#[#set math.equation(numbering: n => "(9.9)")
 $ rho \( x_j + u \) - rho \( x_j \) arrow.r rho_(*) \( u \) $ <model:rho-translate-limit>]

 locally uniformly, and
#[#set math.equation(numbering: n => "(9.10)")
 $ rho_(*) \( u \) = lambda u + o \( \| u \| \) wide \( u arrow.r + oo upright(" or ") u arrow.r - oo \) .
   $ <model:rho-two-ended-slope>]

 There are constants $C \, P' > 0$, independent of $j$, for which
#[#set math.equation(numbering: n => "(9.11)")
 $ rho \( v \) & gt.eq rho \( x_j \) + c \( v - x_j \) - C &  & \( v gt.eq x_j \) \,\
rho \( v \) & gt.eq rho \( x_j \) - P' \( x_j - v \) - C &  & \( v lt.eq x_j \) . $ <model:rho-coarse-envelope>]

 Moreover $rho \( x_j \) = O \( 1 + x_j \)$.]
] <lem:contact-dichotomy>

#proof[
  Since $rho \( v \) - c v gt.eq \( 1 - c \) v$, the infimum in (9.6) is attained. The same inequality gives
  $ x lt.eq rho_c \( x \) lt.eq rho \( x \) . $
  The running infimum is locally Lipschitz: when its lower endpoint is moved,
    its value can increase only because a minimizer lay in the swept interval,
    where the local Lipschitz bound for $rho - c x$ applies. On an open interval containing no contact the
    minimizer remains to the right, so $rho_c$ is affine of slope $c$.
    Everywhere, $rho_c \( v \) - rho_c \( u \) gt.eq c \( v - u \)$ for $v gt.eq u$.
  First suppose there are contacts $z_j arrow.r oo$ with $p \( z_j \) arrow.r oo$. By (9.5),
  $ p \( x \) gt.eq e^(- 1) p \( z_j \) wide \( z_j - 1 lt.eq x lt.eq z_j \) . $
  For large $j$, $rho \( x \) - c x$ is strictly increasing on this interval.
    Each point in it is itself a contact: values between that point and $z_j$ are larger,
    and values beyond $z_j$ are at least the value at $z_j$ because $z_j$ is a contact.
  Set $g = p^(- 1 \/ 2)$ on this interval. Inequality (9.5) says that $e^(x \/ 2) g \( x \)$ is nondecreasing.
    If $sigma_j$ is the supremum of $g$ on the interval, then $sigma_j arrow.r 0$,
    and the total variation of $g$ there is $O \( sigma_j \)$.
    To choose a point where this small total variation is locally well distributed,
    let $nu_j$ be its variation measure. The elementary weak maximal inequality for intervals gives
  $ lr(|{x : sup_(h > 0) frac(nu_j \( \( x - h \, x + h \) \), 2 h) > sqrt(sigma_j)}|) = O \( sqrt(sigma_j) \) . $
  Here intervals are restricted to the original unit interval.
    This inequality follows by selecting disjoint bad intervals and covering their union by their fivefold
    enlargements. Choose $x_j$ outside this bad set in the middle third of the unit interval.
    Then, whenever $\| h \|$ is smaller than its distance to the endpoints,
  $ \| g \( x_j + h \) - g \( x_j \) \| lt.eq 2 sqrt(sigma_j) \| h \| . $
  Taking $\| h \| lt.eq g \( x_j \) = P_j^(- 1 \/ 2)$ shows that
  $ frac(p \( x_j + h \), P_j) arrow.r 1 quad upright("uniformly for ") \| h \| lt.eq P_j^(- 1 \/ 2) . $
  Integration, with $log \( 1 - u \/ P_j \) = - u \/ P_j + O \( P_j^(- 2) \)$, proves (9.7).
  For the tail estimate write $z = log \( 1 + v \/ P_j \)$.
    If $0 lt.eq z lt.eq P_j^(- 1 \/ 2)$, integration of the last slope estimate gives $rho \( x_j + z \) -
    rho \( x_j \) gt.eq P_j z \/ 2$, which is at least a fixed positive multiple of $v$ in this range.
    At $z = P_j^(- 1 \/ 2)$ the increase is at least a fixed multiple of $sqrt(P_j)$.
    This endpoint is still a contact. For larger $z$, the contact inequality adds at least
    $c \( z - P_j^(- 1 \/ 2) \)$. Since
  $ log \( 1 + v \) lt.eq log P_j + z + O \( 1 \) $
  and $alpha_0 < c$, the increase is at least $alpha_0 log \( 1 + v \) - O \( 1 \)$, uniformly for all $v gt.eq
    1$. Exponentiating proves (9.8).
  Now suppose that $p$ is bounded on contacts in a tail. Almost everywhere on the contact set the derivatives of
    $rho$ and $rho_c$ agree, since the two locally Lipschitz functions agree there.
    Off that set the derivative of $rho_c$ equals $c$. Consequently $rho_c$ has a uniform Lipschitz constant $K_1$
    on some tail. Extend it to the left with a fixed Lipschitz constant. Consider the anchored translates
  $ u mapsto rho_c \( x + u \) - rho_c \( x \) . $
  They lie in a compact space of anchored Lipschitz functions,
    with the topology of uniform convergence on compact intervals.
    Average their point masses over $x in \[ x_0 \, x_0 + R \]$.
    A weak limit as $R arrow.r oo$ is invariant under every anchored translation
  $ \( cal(T)_h q \) \( u \) = q \( u + h \) - q \( h \) . $
  Indeed translating the averaging interval changes its normalized measure by at most $2 \| h \| \/ R$.
  The mean increment at $1$ of this invariant law is at least $1$. To check this, telescope the integral:
  $ 1 / R integral_(x_0)^(x_0 + R) #scale(x: 120%, y: 120%)[\(] rho_c \( x + 1 \) -
    rho_c \( x \) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) x = 1 /
    R (integral_(x_0 + R)^(x_0 + R + 1) rho_c - integral_(x_0)^(x_0 + 1) rho_c) \, $
  and use $rho_c \( x \) gt.eq x$. Birkhoff’s pointwise ergodic theorem #cite(label("Durrett2019")) Theorem 6.2.1
    for the invertible map $cal(T)_1$, applied in both directions to the bounded unit increments,
    now provides a path $q_(*)$ in the support of the law for which
  #[#set math.equation(numbering: n => "(9.12)")
   $ frac(q_(*) \( u \), u) arrow.r lambda gt.eq 1 wide \( u arrow.r + oo upright(" or ") u arrow.r - oo \) .
     $ <model:envelope-ergodic-path>]
  The two limits agree because they are the same invariant conditional expectation of the unit increment.
    Bounded increments between successive integers extend the conclusion to real $u$.
    Such a path is approximated locally uniformly by translates with centers $x_j arrow.r oo$:
    a neighborhood visited only for bounded $x$ has zero mass in every limiting averaged measure.
  We next replace $rho_c$ by $rho$. To the right of any fixed compact $u$-interval,
    (9.12) gives a fixed interval $\[ v \, w \]$ on which the increment of $q_(*)$ exceeds $c \( w - v \)$.
    The approximating translates of $rho_c$ must therefore have a contact in $\[ x_j + v \, x_j + w \]$.
    Monotonicity of $rho$, together with $rho gt.eq rho_c$, bounds $rho \( x_j + u \) -
    rho_c \( x_j \)$ above and below on every compact interval. It also bounds the local slopes of $rho$: from (9.5),
  $ p \( x \) lt.eq e integral_(x - 1)^x p \( v \) thin thin upright(d) v =
    e #scale(x: 120%, y: 120%)[\(] rho \( x \) - rho \( x - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Thus a subsequence of the anchored translates of $rho$ has a locally uniform limit $rho_(*)$,
    and $rho \( x_j \) - rho_c \( x_j \) = O \( 1 \)$.
  For completeness, this limit has the same two-ended slope as $q_(*)$. Fix a small $eta > 0$.
    For every sufficiently large $\| u \|$, the increment of $q_(*)$ on $\[ u \, u + eta \| u \| \]$ exceeds $c
    eta \| u \|$, by (9.12) and $lambda > c$. The same contact argument, followed by passage to the limit,
    bounds the excess of $rho_(*) \( u \)$ over $q_(*) \( u \)$, up to a fixed additive constant,
    by $K_1 eta \| u \|$. The lower bound $rho gt.eq rho_c$ bounds the deficit by a fixed constant.
    Letting $eta arrow.b 0$ proves (9.10).
  Finally, the lower increment bound for $rho_c$, its uniform Lipschitz bound,
    and the bounded difference at $x_j$ give (9.11) and (9.11) as long as $v$ remains in the tail.
    For the remaining left range, use $rho \( v \) gt.eq v$, increasing $P' >
    max \( K_1 \, 1 \)$ and the additive constant if necessary.
    The same Lipschitz bound gives $rho \( x_j \) = O \( 1 + x_j \)$. ◻
]

=== 9.2 The steep-contact alternative <model:steep-subsection>

#thm([Lemma 9.4.])[
  #emph[Alternative (i) of 60 is impossible for the moment law of a prohibited sequence.]
] <model:steep-excluded>

#proof[
  For each fixed $j$, take the original index $n$ sufficiently large and set
  #[#set math.equation(numbering: n => "(9.13)")
   $ h_n = H - d D_j \, wide ell_n = frac(d D_j, P_j) \, wide m_0 = B /
     d thin m_n \( D_j \) . $ <model:contact-physical-scales>]
  The diagonal can be chosen so that
  $ h_n arrow.r H \, wide ell_n arrow.r 0 \, wide m_0 ell_n arrow.r oo . $
  For the last assertion, first keep $j$ fixed: $m_0 ell_n = B D_j m_n \( D_j \) \/ P_j arrow.r oo$.
    The distance from $h_n$ to the upper shape wall, in units of $ell_n$, is $P_j arrow.r oo$;
    the lower wall also escapes in these units.
  Both (9.7) and (9.8) can be transferred to the actual moments on the required ranges. Here is the tail detail.
    Fix $alpha_0 in \( 1 \/ 2 \, c \)$, and require $epsilon_n < \( 1 - alpha_0 \) \/ 2$.
    For each fixed $j$, choose a finite cutoff $D_(upright("cut"))$ large enough that the primary bound
    $m_n \( D \) lt.eq D^(- 1 + epsilon_n)$ is below a fixed multiple of the right side of (9.8),
    with the normalizing factor $m_n \( D_j \)$, whenever $D gt.eq D_(upright("cut"))$.
    Such a cutoff exists because $1 - epsilon_n > alpha_0$ and $m_n \( D_j \) arrow.r m \( D_j \) > 0$.
    On the finite interval below the cutoff use locally uniform moment convergence.
    Choose the fixed physical cutoff $0 < delta_b < H \/ 2$ small enough that the enlarged depth range used for
    submean disks has logarithmic level at least $k_0$. Thus all the coarser depths up to $delta_b$ are
    controlled, with a constant independent of $j$.
  On the row of height $h_n$, define
  $ H_x = frac(\| f \( x + upright(i) h_n \) \|^2 + \| q \( x + upright(i) h_n \) \|, m_0^2) . $
  Its horizontal mean is $1$. Sample $x$ with probability density $H_x$ relative to normalized horizontal measure,
    and set $m_x = m_0 sqrt(H_x)$; the zero-density set $H_x = 0$ can be discarded. In the coordinate
  $ S = frac(s - x - upright(i) h_n, ell_n) \, $
  let
  $ cal(F)_x \( S \) = frac(f \( s \), m_x) \, wide cal(Q)_x \( S \) = frac(q \( s \), m_x^2) . $
  There is an exact cancellation in the expectation:
  #[#set math.equation(numbering: n => "(9.14)")
   $ bb(E)_H #scale(x: 120%, y: 120%)[\(] \| cal(F)_x \( S \) \|^2 + \| cal(Q)_x \( S \) \|
     #scale(x: 120%, y: 120%)[\)] =
     frac(bb(E) #scale(x: 120%, y: 120%)[\(] \| f \|^2 + \| q \| #scale(x: 120%, y: 120%)[\)]
     upright(" on the row ") h_n + ell_n Im S, m_0^2) . $ <model:biased-cancellation>]
  The denominator $H_x$ cancels against the sampling density,
    and the remaining integral is invariant under the horizontal translation $x mapsto x + ell_n Re S$.
    The transferred local moment law therefore makes (9.14) converge locally uniformly to $e^(2 Im S)$.
  Submean estimates applied before taking expectation give the same bounds for suprema on smaller tiles.
    In a cone of fixed aperture $L$, a dyadic band with depth $D gt.eq
    1$ requires only a number of depth-sized tiles depending on $L$.
    The expected squared size of the fields on this band is at most $C_L D^(- 2 alpha_0)$.
    Choose one $alpha in \( 1 \/ 2 \, alpha_0 \)$, independently of $L$.
    Summation of $D^(2 alpha) C_L D^(- 2 alpha_0)$ over dyadic bands proves tightness of the random constants in
    the pointwise bounds
  #[#set math.equation(numbering: n => "(9.15)")
   $ max \( \| cal(F)_x \( S \) \| \, sqrt(\| cal(Q)_x \( S \) \|) \) lt.eq
     C_L \( - Im S \)^(- alpha) $ <model:sampled-coarse-bound>]
  for $1 lt.eq - Im S lt.eq delta_b \/ ell_n$ and $\| Re S \| lt.eq L \( - Im S \)$. Also
  $ bb(P)_H \( H_x lt.eq a \) = bb(E) #scale(x: 120%, y: 120%)[\(] H_x upright(bold(1))_({ H_x lt.eq a })
    #scale(x: 120%, y: 120%)[\)] lt.eq a . $
  Since $m_0 ell_n arrow.r oo$, it follows that $m_x ell_n arrow.r oo$ in probability.
  Now consider the nonnegative subharmonic function
  $ U_x \( S \) = \| e^(upright(i) S) cal(F)_x \( S \) \|^2 + \| e^(2 upright(i) S) cal(Q)_x \( S \) \| . $
  Its mean tends locally uniformly to $1$. If a nonnegative smooth cutoff equals $1$ on a fixed compact set,
    integration against its Laplacian shows that the expected Riesz mass of $U_x$ on that set tends to zero:
    the limiting integral of the Laplacian of the cutoff is zero.
    The mass itself is nonnegative, so it tends to zero in probability.
  We may therefore select deterministic centers and a subsequence with all the following properties:
    local analytic bounds on an exhaustion of the plane; the bounds (9.15) for every fixed aperture;
    $m_x ell_n arrow.r oo$; and vanishing Riesz mass on every fixed compact set.
    To make the quantifier explicit, assign summable failure probabilities to countably increasing apertures and
    compact sets, choose their bound constants once, and then take the sequence index sufficiently large for the
    remaining probability conditions. The union of the bad events has probability less than one.
    This gives fixed eventual constants for each aperture, not constants growing with the sequence index.
  The resulting entire limits $\( cal(F) \, cal(Q) \)$ obey
  $ \| e^(upright(i) S) cal(F) \( S \) \|^2 + \| e^(2 upright(i) S) cal(Q) \( S \) \| quad upright("harmonic") . $
  Each summand is subharmonic, so each is harmonic. An analytic function with harmonic squared modulus is
    constant. An analytic function with harmonic modulus is also constant:
    away from its zeros its Laplacian is $\| G' \|^2 \/ \| G \|$,
    and the assertion follows by analytic continuation. Thus
  $ cal(F) \( S \) = c_1 e^(- upright(i) S) \, wide cal(Q) \( S \) = c_2 e^(- 2 upright(i) S) . $
  At $S = 0$ the normalized sum is exactly $1$, so the limit is nonzero. Moreover
  $ cal(F)''_x = \( m_x ell_n \)^2 cal(Q)_x cal(F)_x . $
  Compact convergence and $m_x ell_n arrow.r oo$ imply $cal(Q) cal(F) = 0$.
    The limit is consequently one of the two nonzero pure exponential profiles in 40.
    All its finite-wall hypotheses were checked above, including a single exponent $alpha > 1 \/
    2$ for every fixed aperture. That theorem gives the contradiction. ◻
]

=== 9.3 Re-centering and selecting a nonzero first field <model:selection-subsection>

We are therefore in alternative (ii) of 60. Choose its $x_j \, rho_(*) \, lambda$.

#thm([Lemma 9.5.])[
  (The second scale).  #emph[There are depths $d' arrow.r 0$, levels $K = - log d' arrow.r oo$,
    normalizations $B' = mu \( K \) arrow.r oo$, and horizontal centers $xi_n$ with the following properties. Set
#[#set math.equation(numbering: n => "(9.16)")
 $ F_n \( S \) = d' / B' f \( xi_n + upright(i) H + d' S \) \, wide Q_n \( S \) =
   (d' / B')^2 q \( xi_n + upright(i) H + d' S \) . $ <model:selected-normalization>]

 Then $F_n arrow.r F equiv.not 0$ and $Q_n arrow.r 0$ locally uniformly on $bb(H)_(-) = { S : Im S < 0 }$,
   and $F'' \/ F$ is holomorphic there. The global normalized moment laws converge locally uniformly to
#[#set math.equation(numbering: n => "(9.17)")
 $ m_(*) \( D \) = exp #scale(x: 120%, y: 120%)[\(] - rho_(*) \( log D \) #scale(x: 120%, y: 120%)[\)] \, wide
   log m_(*) \( D \) = - lambda log D + o \( \| log D \| \) $ <model:star-moment>]

 at both ends of $0 < D < oo$. For fixed $1 - c < beta < 1 \/ 2$ and some fixed $a > 0$,
#[#set math.equation(numbering: n => "(9.18)")
 $ mu \( l \) lt.eq C B' exp #scale(x: 120%, y: 120%)[\(] beta \( K - l \)_(+) +
   a \( l - K \)_(+) #scale(x: 120%, y: 120%)[\)] wide \( l gt.eq k_0 \) \, $ <model:new-global-envelope>]

 with $C$ independent of the sequence index. Finally, one can fix $alpha in \( 1 \/ 2 \, 1 - beta \)$ so that,
   for every fixed aperture $A$,
#[#set math.equation(numbering: n => "(9.19)")
 $ max \( \| F_n \( S \) \| \, sqrt(\| Q_n \( S \) \|) \) lt.eq C_A \( - Im S \)^(- alpha) $ <model:selected-cones>]

 when $1 lt.eq - Im S lt.eq delta_b \/ d'$ and $\| Re S \| lt.eq A \( - Im S \)$, eventually for that aperture.]
] <model:selected-fields>

#proof[
  For each fixed $j$, take the original index $n$ sufficiently large and put
  $ d' = d e^(x_j) \, wide K = k - x_j \, wide B' = mu \( K \) . $
  The identity
  $ B' / B = e^(x_j) m_n \( e^(x_j) \) $
  shows that $K \, B' arrow.r oo$ are compatible with this order of choices.
    We also impose $s_n > x_j + 3$, so the ancestor cutoff lies strictly below the new target level.
    The new normalized moment law is
  $ frac(m_n \( e^(x_j) D \), m_n \( e^(x_j) \)) \, $
  which tends, after the diagonal selection, to (9.17).
  We spell out the global envelope because its constants must remain uniform after diagonalization. With $v = k - l$,
  #[#set math.equation(numbering: n => "(9.20)")
   $ frac(mu \( l \), B') = e^(v - x_j) frac(m_n \( e^v \), m_n \( e^(x_j) \)) . $ <model:moment-ratio-change>]
  On a finite $v$-range, the limiting estimates (9.11) and (9.11) imply an upper exponent $1 - c$ for $v gt.eq
    x_j$ and $P' - 1$ for $v lt.eq x_j$. Choose $beta > 1 - c$ and $a > max \( P' - 1 \, 0 \)$.
    Since $rho \( x_j \) = O \( 1 + x_j \)$, primary normality bounds the logarithm of (9.20) by
  $ C \( 1 + x_j \) + epsilon_n \| v \| . $
  If $epsilon_n$ is small compared with $beta$ and $a$, this is absorbed by the chosen envelope for $\| v \| gt.eq
    C_0 \( 1 + x_j \)$, with $C_0$ fixed sufficiently large. On the remaining finite interval take $n$ large
    enough for moment convergence with a fixed multiplicative error. This proves (9.18) with one constant $C$.
  Let $k_a = k - s_n$ and $omega \, nu$ be the ancestors and measures in 53.
    To apply 51, take an old coarse exponent $0 < beta_0 < beta$.
    For $l lt.eq k_a + 3$, the ratio of the new coarse normalization to the old one equals
  #[#set math.equation(numbering: n => "(9.21)")
   $ frac(B' e^(beta \( K - l \)), B e^(beta_0 \( k - l \))) = B' /
     B e^(- beta x_j) e^(\( beta - beta_0 \) \( k - l \)) gt.eq B' /
     B e^(- beta x_j) e^(\( beta - beta_0 \) \( s_n - 3 \)) . $ <model:ancestor-domination>]
  For fixed $j$, the last expression tends to infinity. We can therefore make it at least one before proceeding to
    the next $j$. The same comparison, squared, applies to the absolute ancestor integral of $P$.
    Thus the coarse hypotheses of the weighted bootstrap hold with constants independent of $j$.
    The global envelope already has this uniformity, so the resulting weighted $L^2$ bounds do as well.
  For each fixed $j$, the new $q$-field on a fixed compact set is the primary $q$-field on another fixed compact
    set, multiplied by the finite factor $m_n \( e^(x_j) \)^(- 2)$.
    The primary convergence to zero in $nu$-probability can therefore be imposed to any prescribed tolerance
    before advancing $j$. Hence the new $q$-field tends to zero in probability on compact sets.
  Weighted submean estimates now give tightness of the analytic fields on every compact subset of $bb(H)_(-)$.
    They also give pointwise cone tightness. At depth ratio $D gt.eq 1$,
    the coarse part of (9.18) bounds the weighted field norm by $C D^(- \( 1 - beta \))$.
    Summing depth-sized tile suprema over dyadic bands, with any fixed $alpha in \( 1 \/ 2 \, 1 - beta \)$,
    proves tightness of the constants in (9.19). Fine tiles use the bounded change of the density of $nu$ on
    shifts of order the ancestor depth. For tiles coarser than that depth,
    the necessary tile estimates are precisely the explicit coarse hypotheses of the weighted bootstrap.
    Thus no translation invariance of $nu$ is required.
  Choose deterministic centers on events with these compact and cone bounds and with the $q$-field small,
    using summable exceptional probabilities as in the preceding proof.
    Extract a locally uniform limit $\( F \, 0 \)$. If $F$ were zero,
    its compact smallness and the coarser bound with exponent $alpha > 1 \/ 2$ would violate 52;
    the global normalization at the target is $B' = mu \( K \)$, as that theorem requires. Therefore $F equiv.not 0$.
  Each quotient $F''_n \/ F_n = \( d' \)^2 q$ is holomorphic.
    Around any zero of $F$, choose a small circle containing no other zero and no zero on the circle.
    The quotients converge on that circle to $F'' \/ F$, so maximum modulus bounds them in its interior.
    Their limit removes the apparent singularity of $F'' \/ F$. This proves the last asserted regularity.
    In particular all zeros of $F$ are simple and $F''$ vanishes at them:
    otherwise the analytic equation $F'' = \( F'' \/ F \) F$ with initial data $F = F' = 0$ would force $F equiv 0$. ◻
]

=== 9.4 The limiting impact equation <model:equation-subsection>

Use the scales and centers of 62. The phase coordinate and parameter are now

#[#set math.equation(numbering: n => "(9.22)")
 $ Y = frac(y - xi_n - upright(i) H, d') \, wide T = frac(B' t, d') \, wide S_n \( Y \, T \) =
   frac(frak(s) \( y \, t \) - xi_n - upright(i) H, d') . $ <model:phase-scaling>]

The cone estimates in this subsection refer to depths $D = - Im Y$ or $D = - Im S$, as indicated.

#thm([Proposition 9.6.])[
  (The pure first-field model).  #emph[There is a limiting impact coordinate $S \( T \, Y \)$ with the following
    properties.]
  + #emph[For every fixed aperture and every bounded complex parameter range,
    it is jointly holomorphic sufficiently deep in the corresponding cone and is the locally uniform limit of
    (9.22). There,
#[#set math.equation(numbering: n => "(9.23)")
 $ S \( T \, Y \) - Y = O #scale(x: 120%, y: 120%)[\(] \| T \|^2 D^(1 - 2 alpha) #scale(x: 120%, y: 120%)[\)] \,
   wide D = - Im Y arrow.r oo . $ <model:deep-anchor>]

]
  + #emph[Put
#[#set math.equation(numbering: n => "(9.24)")
 $ J = S_Y \, wide z = frac(T F \( S \) J, 2) \, wide g \( z \) = frac(3 \( sin z - z cos z \), z^3) \, quad
   g \( 0 \) = 1 . $ <model:energy>]

 The limiting equation is
#[#set math.equation(numbering: n => "(9.25)")
 $ J^3 g \( z \) = 1 . $ <model:energy-equation>]

]
  + #emph[For every fixed $epsilon > 0$, set $r = 1 \/ \( lambda + epsilon \)$.
    There are constants $C_epsilon \, t_0 > 0$ such that, for every real $\| T \| < t_0$,
    the model is holomorphic in $Y$ and maps
#[#set math.equation(numbering: n => "(9.26)")
 $ { Y : Im Y < - C_epsilon \| T \|^r } med arrow.r med bb(H)_(-) . $ <model:real-domains>]

 It satisfies $S \( 0 \, Y \) = Y$, obeys (9.25) throughout this domain, and depends continuously on real $T$,
   locally uniformly on strict common interiors.]
  + #emph[At every strict interior point of (9.26) with $T$ real,
    these functions have a joint holomorphic germ in $\( T \, Y \)$.
    The germs agree when continued along vertical $Y$-paths from the deep model.]
] <prop:pure-model>

#proof[
  For a bounded complex $T$-range, apply 34 to (9.19) at a sufficiently large fixed depth ratio.
    Its smallness condition holds because $\| T \| C_A D^(- alpha)$ is small when $D$ is large.
    The physical parameter is $t = T d' \/ B'$; relative to a fixed positive multiple of $d'$,
    its size tends to zero. Thus the constant bounding the parameter-to-depth ratio in that theorem can be fixed,
    for example at one. The resulting passages are attached vertically to the original lift and satisfy
  $ S_n - Y = O #scale(x: 120%, y: 120%)[\(] \| T \|^2 D^(1 - 2 alpha) #scale(x: 120%, y: 120%)[\)] $
  on each fixed deep cone. They stay in the shape strip. The bound and holomorphic compactness give joint
    subsequential limits.
  We derive their equation before proving uniqueness. Write $h = T \/ B'$, and use the rescaled step
  $ J_n \( Y \) = frac(S_n \( Y + h \, T \) - S_n \( Y \, T \), h) . $
  On the fast segment based at a scaled shape coordinate $S$, the fields entering the normalized chord action are
  $ T F_n \( S + h u \) \, wide T^2 Q_n \( S + h u \) . $
  They converge analytically, including on small thickenings, to the constant fast pair $\( T F \( S \) \, 0 \)$.
    The kernel division in 32 and the frozen first-field formula (6.7) therefore give the local action limit
  $ p \( S \, J \) = frac(J, \( T F \( S \) \)^2) - frac(2 sin \( T F \( S \) J \/ 2 \), \( T F \( S \) \)^3) \, $
  with its removable interpretation at $T F \( S \) = 0$. This passage is initially made where the deep
    near-identity branches have nonvanishing kernels.
  In scaled coordinates the exact stationary equation reads
  $ p_(n \, J) \( S \, J \) - h thin p_(n \, S) \( S \, J \) = p_(n \, J) \( S_(-) \, J_(-) \) . $
  The preceding and current states are evaluations of the same holomorphic functions at phase arguments differing
    by $h$. Dividing their difference by $h$ and using analytic convergence gives
  $ frac(partial, partial Y) p_J = p_S \, wide J = S_Y . $
  In particular no prescribed rate of convergence relative to $h$ is needed.
    Differentiating $E = J p_J - p$ along the limiting solution gives
  $ E_Y = J frac(partial p_J, partial Y) - p_S S_Y = 0 . $
  The deep anchor implies $J arrow.r 1$, while $F \( S \) arrow.r 0$, so $E = 1 \/ 12$. The frozen energy identity
  $ E = frac(2 \( sin z - z cos z \), \( T F \( S \) \)^3) $
  is exactly (9.25).
  Near zero field, (9.25) determines an analytic branch $J = j \( T F \( S \) \)$ with $j \( 0 \) = 1$,
    since its $J$-derivative at zero field and $J = 1$ is $3$. It has $j \( w \)^(- 1) - 1 = O \( w^2 \)$.
    Define the inverse coordinate $cal(Y)_T$ deep in the cone by
  $ cal(Y)'_T \( S \) = j \( T F \( S \) \)^(- 1) \, wide cal(Y)_T \( S \) - S arrow.r 0 quad
    upright("down the cone") . $
  The normalized primitive exists because its derivative minus one is $O \( \| T \|^2 D^(- 2 alpha) \)$ and $2
    alpha > 1$. It can be constructed by integration from a point at depth $R$, then letting $R arrow.r oo$;
    changing the horizontal coordinate of the starting point contributes $O \( R^(1 - 2 alpha) \)$,
    which vanishes. Along every limiting solution,
  $ frac(partial, partial Y) cal(Y)_T \( S \( T \, Y \) \) = 1 . $
  The anchor fixes the additive constant to zero. Hence the solution is the unique nearby inverse of $cal(Y)_T$
    sufficiently deep. All deep subsequential limits agree, and the convergence and holomorphic dependence
    asserted in (i) follow.
  We next obtain the domains for real $T$. Fix
  $ 1 / 2 < c_1 < 1 - beta $
  and a sufficiently large fixed number $C_0$. For a small fixed depth ratio $D > 0$,
    the global moment laws on ratios $v gt.eq D \/ C_0$ have the bound
  #[#set math.equation(numbering: n => "(9.27)")
   $ C_epsilon D^(- lambda - epsilon) \( D \/ v \)^(c_1) . $ <model:width-moment-cone>]
  For $D \/ C_0 lt.eq v lt.eq 1$, first use $m_(*) \( v \) lt.eq C_epsilon v^(- lambda - epsilon \/ 2)$,
    then take the original index sufficiently large at this fixed $D$.
    For $v gt.eq 1$, use (9.18), whose field exponent is $1 - beta > c_1$.
    These give (9.27) with constants independent of $D$, although the required sequence index may depend on $D$.
  Submean and dyadic tile summation, with a slightly smaller exponent still greater than $1 \/ 2$,
    provide at least one horizontal center whose actual fields obey the corresponding pointwise cone bound.
    This step uses uniform horizontal sampling and the global moments; the good center need not be $xi_n$.
    Apply 34 at that center with
  $ \| T \| lt.eq c_epsilon D^(lambda + epsilon) . $
  After choosing its small constant and, if necessary, replacing the base depth by a fixed smaller multiple,
    the passage reaches phase depth $d' D$. The real no-patch transfer, using 24 as after 34,
    consequently gives the global width bound
  #[#set math.equation(numbering: n => "(9.28)")
   $ Delta \( T d' \/ B' \) lt.eq d' D quad upright("for ") \| T \| lt.eq c_epsilon D^(lambda + epsilon) \,
     $ <model:real-width-bound>]
  eventually for each fixed $D$. Recall that $Delta \( t \) = H - h_X \( t \)$.
    This is the point where a successful local passage is converted to a full horizontal domain;
    local analytic continuation alone would not give (9.28).
  The full-width domains in (9.28) exhaust (9.26), with a strict margin on compact sets.
    The shape constraint gives $Im S_n < 0$, and the deep anchor gives a fixed interior normalization.
    Holomorphic maps to a half-plane with such an anchor form a normal family,
    as is seen by mapping the half-plane to the unit disk. Every limit agrees with the unique deep solution.
    This defines $S \( T \, dot.op \)$ on (9.26); the energy identity propagates there by the identity theorem.
    The same argument for a sequence of real parameters $T_j arrow.r T$ proves local uniform continuity:
    on a common strict interior, every convergent subsequence has the same deep germ and hence the same limit.
    This also treats $T = 0$.
  It remains to justify joint germs at all real parameters. Equation (9.25) first shows that $J eq.not 0$.
    At fixed $w = T F \( S \)$, its $J$-derivative is
  #[#set math.equation(numbering: n => "(9.29)")
   $ frac(partial, partial J) #scale(x: 120%, y: 120%)[\(] J^3 g \( w J \/ 2 \) #scale(x: 120%, y: 120%)[\)] =
     3 J^2 frac(sin z, z) . $ <model:twist-derivative>]
  It can vanish only when $z = n pi$, $n in bb(Z) \\ { 0 }$. The equivalent entire equation
  #[#set math.equation(numbering: n => "(9.30)")
   $ \( T F \( S \) \)^3 = 24 \( sin z - z cos z \) $ <model:cubic-energy>]
  then has a nonzero right side. Differentiating in $Y$ gives
  $ 3 T^3 F \( S \)^2 F' \( S \) J = 24 z sin z thin z_Y \, $
  and hence $F' \( S \) = 0$ at such a point. The function $F$ is nonconstant,
    because it is nonzero and decays down the cones. Its critical points are therefore countable.
    At each such point and each nonzero integer $n$, (9.30) allows at most three values of $T$.
    Thus the exceptional real parameters form at most a countable set.
  This countable exception is removable. Fix an exceptional real $T$, a strict interior point,
    and a nearby sequence of nonexceptional real parameters. On a common connected interior $Y$-domain,
    continuity gives local uniform convergence of $z \( Y \, T_j \)$ to $z \( Y \, T \)$.
    For each fixed nonzero integer $n$, Hurwitz’s theorem says that $z \( Y \, T \) -
    n pi$ is either zero-free or identically zero. The latter alternative is impossible on the common domain:
    analytic continuation to its deep part gives $z arrow.r 0$.
    Exhausting the strict interior proves omission of all the exceptional values for every real $T$.
  Consequently (9.29) is nonzero along every compact vertical path in the real-parameter domain.
    Solve the regular implicit equation as an analytic first-order ODE in $Y$, starting with the joint deep data.
    A finite chain of local ODE neighborhoods along the path gives a joint germ in $\( T \, Y \)$ at its endpoint.
    The constructed germ agrees with the given real-parameter functions by their continuity and local ODE
    uniqueness. Germs obtained on overlapping vertical paths agree by the same uniqueness, which proves (iv). ◻
]

=== 9.5 Complex parameter disks and the growth estimate <model:growth-subsection>

The real domains in (9.26) have a cusp at $T = 0$. We fill graphs over a fixed parameter half-disk to produce a
  parameter disk of radius comparable to $D^(1 \/ r)$ at a phase point of depth $D$.
  The shape constraint on this disk will bound the second parameter coefficient.

#thm([Lemma 9.7.])[
  (Holomorphic filling of a moving graph).  #emph[Let $Gamma$ be a piecewise smooth Jordan curve,
    and let $U$ be a connected open neighborhood of a compact path in a complex variable $w$.
    Suppose $A \( T \, w \)$ is holomorphic on a neighborhood of $Gamma times U$.
    If, for $w$ in some nonempty open subset of $U$, it extends holomorphically to the interior of $Gamma$,
    then it has such an extension for every $w in U$, jointly holomorphic in $T \, w$.
    The extension agrees with the original collar germs.]
] <model:graph-filling>

#proof[
  For every integer $n gt.eq 0$, the moment
  $ integral_Gamma T^n A \( T \, w \) thin thin upright(d) T $
  is holomorphic in $w$. It vanishes in the initial open set and hence throughout $U$.
    For an exterior point $z$ of large modulus, expand $\( T - z \)^(- 1)$ in its geometric series.
    The vanishing moments show that the exterior Cauchy transform is zero there,
    and analytic continuation makes it zero on the whole exterior. The interior Cauchy integral
  $ frac(1, 2 pi upright(i)) integral_Gamma frac(A \( T \, w \), T - z) thin thin upright(d) T $
  is jointly holomorphic in $z \, w$. Deforming the contour a short distance inside and outside any collar point
    and using the zero exterior transform shows that it agrees there with $A$. It is the required extension. ◻
]

#thm([Proposition 9.8.])[
  (Growth of the limiting first field).  #emph[For every compact horizontal interval $I subset
    bb(R)$ and every $epsilon > 0$, there is a constant $C_(I \, epsilon)$ such that
#[#set math.equation(numbering: n => "(9.31)")
 $ \| F \( x - upright(i) D \) \| lt.eq C_(I \, epsilon) D^(- lambda - epsilon)
   wide \( x in I \, med 0 < D < 1 \) . $ <model:power-growth>]

 Equivalently,
#[#set math.equation(numbering: n => "(9.32)")
 $ sup_(x in I) log \| F \( x - upright(i) e^(- v) \) \| lt.eq lambda v + o \( v \) wide \( v arrow.r oo \) \,
   $ <model:log-growth>]

 where the error is uniform on $I$.]
] <prop:model-growth>

#proof[
  Fix $epsilon > 0$, use 63 with $r = 1 \/ \( lambda + epsilon \) in \( 0 \, 1 \)$,
    and take a small fixed upper half-disk $\| T \| < t_0$, $Im T > 0$.
    For a target $Y$ with $Re Y in I$, $- Im Y = D$, and for $\| T_c \| lt.eq c_(*) D^(1 \/ r)$ in this half-disk,
    use the graph with phase argument
  #[#set math.equation(numbering: n => "(9.33)")
   $ Y + G \( T \) - G \( T_c \) \, wide G \( T \) = - upright(i) C_(*) \( eta_0 - upright(i) T \)^r \, wide
     0 < eta_0 lt.eq c_(*) D^(1 \/ r) . $ <model:parameter-graph>]
  The fractional power is the branch on the right half-plane;
    $Re \( eta_0 - upright(i) T \) > 0$ in the upper half-disk.
    The auxiliary $eta_0$ is distinct from the fixed growth exponent $epsilon$.
  On the real diameter,
  $ - Im G \( T \) = C_(*) Re \( eta_0 - upright(i) T \)^r gt.eq C_(*) cos \( pi r \/ 2 \) \| T \|^r . $
  Choose $C_(*)$ large compared with the constant in (9.26),
    and then $c_(*)$ so small that $\| G \( T_c \) \| < D \/ 2$.
    Every diameter point then lies strictly in its real-parameter domain.
    On the semicircle $\| T \| = t_0$, $Im T gt.eq 0$,
  $ - Im G \( T \) gt.eq c_r C_(*) t_0^r \, wide \| Re G \( T \) \| lt.eq C_r \( - Im G \( T \) \) . $
  Fix the required cone aperture first and then increase $C_(*)$ further to put this semicircle in the deep joint
    domain. The bounded interval $I$ and the correction $G \( T_c \)$ cost only fixed additional margins.
  The graph has coherent joint germs on a boundary collar. On the diameter these are the germs of 63(iv);
    on the semicircle they are deep joint data. They agree at the corners because both are attached to the same
    deep branch. Overlapping real-parameter neighborhoods agree first for real parameters and then by holomorphic
    identity.
  Lower the center $Y$ until the whole graph lies in deep joint data, then raise it vertically to the target.
    Boundary membership and strict margins persist. On each compact center segment a finite covering gives a
    holomorphic function on a neighborhood of the boundary contour times a connected complex neighborhood of that
    segment. Coherence follows from vertical-path uniqueness.
    Initially the graph interior is filled by deep data, so 64 fills it throughout the motion.
    Its boundary values have negative imaginary part; the harmonic maximum principle therefore gives $Im S <
    0$ on the filled interior.
  For the lower half-disk use $G \( T \) = - upright(i) C_(*) \( eta_0 + upright(i) T \)^r$.
    The two constructions agree on the joint real-parameter germs.
    The germs obtained for different $T_c$ also agree on overlaps:
    at a fixed parameter they follow the same vertical path from the unique deep branch.
    Thus the model is holomorphic on the whole parameter disk
  #[#set math.equation(numbering: n => "(9.34)")
   $ \| T \| < c_(*) D^(1 \/ r) $ <model:small-parameter-disk>]
  at the target, still with $Im S < 0$. Shrinking $c_(*)$ once makes this construction uniform for $Y$ in a disk
    of radius a small fixed multiple of $D$.
  Write
  $ S \( T \, Y \) = Y + T^2 A \( Y \) + O \( T^4 \) . $
  Evenness follows from the deep branch and continuation. The positive harmonic function $-
    Im S \( T \, Y \)$ equals $D$ at $T = 0$. Its Fourier coefficient estimate on circles in (9.34),
    or the Caratheodory coefficient estimate, gives
  $ \| A \( Y \) \| lt.eq C D^(1 - 2 \/ r) . $
  This also holds on the depth-sized $Y$-neighborhood, so Cauchy’s estimate yields
  #[#set math.equation(numbering: n => "(9.35)")
   $ \| A' \( Y \) \| lt.eq C D^(- 2 \/ r) . $ <model:A-derivative-bound>]
  The energy equation determines the derivative:
  $ g \( z \) = 1 - z^2 / 10 + O \( z^4 \) \, quad J = 1 + T^2 A' \( Y \) + O \( T^4 \) \, quad z =
    frac(T F \( Y \), 2) + O \( T^3 \) . $
  Its coefficient of $T^2$ is $3 A' \( Y \) - F \( Y \)^2 \/ 40 = 0$. Hence
  #[#set math.equation(numbering: n => "(9.36)")
   $ A' \( Y \) = F \( Y \)^2 \/ 120 . $ <model:A-coefficient>]
  Combining these bounds gives $\| F \( Y \) \| lt.eq C D^(- 1 \/ r) = C D^(- lambda - epsilon)$.
    Arbitrariness of $epsilon > 0$ gives (9.32). ◻
]

=== 9.6 Uniform high-value witnesses <model:witness-subsection>

Set

#[#set math.equation(numbering: n => "(9.37)")
 $ L \( v \) = log m_(*) \( e^(- v) \) . $ <model:L-definition>]

By (9.17), $L \( v \) = lambda v + o \( \| v \| \)$ at both ends.

#thm([Lemma 9.9.])[
  (Common normal epochs).  #emph[Fix
$ 1 / 2 < c_1 < 1 - beta \, wide P_1 > max \( lambda \, 1 + a \) . $

 There is an unbounded set $E subset \( 0 \, oo \)$, with $"dist" \( v \, E \) = o \( v \)$ as $v arrow.r oo$,
   such that every $u in E$ satisfies, for all real $v$,
#[#set math.equation(numbering: n => "(9.38)")
 $ L \( v \) - L \( u \) lt.eq
   cases(delim: "{", c_1 \( v - u \) \, & v lt.eq u \,, P_1 \( v - u \) \, & v gt.eq u .) $ <model:epoch-envelope>]

]
] <model:normal-epochs>

#proof[
  The coarse part of (9.18) gives $L \( v \) lt.eq C + \( 1 - beta \) v$ for $v lt.eq 0$.
    Thus $L \( v \) - c_1 v arrow.r - oo$ as $v arrow.r - oo$.
    For a large $w$, choose a running record $u_0 lt.eq w$ of $L \( v \) - c_1 v$ on $\( - oo \, w \]$.
    Its positive asymptotic slope $lambda - c_1$ implies $w - u_0 = o \( w \)$:
    for every fixed $eta > 0$, all values at $v lt.eq \( 1 - eta \) w$ are eventually below the value at $w$.
  Next maximize $L \( v \) - P_1 v$ over $v gt.eq u_0$, and call a maximizer $u$.
    It exists because $P_1 > lambda$. The negative asymptotic slope shows $u - u_0 = o \( u_0 \)$.
    Its maximality gives the future bound in (9.38). For $v lt.eq u_0$, the past record and $L \( u \) -
    L \( u_0 \) gt.eq P_1 \( u - u_0 \) gt.eq c_1 \( u - u_0 \)$ give the past bound at $u$.
    For $u_0 lt.eq v lt.eq u$, maximality gives
  $ L \( v \) - L \( u \) lt.eq P_1 \( v - u \) lt.eq c_1 \( v - u \) . $
  The epochs obtained this way are within $o \( w \)$ of every sufficiently large $w$. ◻
]

#thm([Proposition 9.10.])[
  (Witnesses near every horizontal center).  #emph[There is a fixed sufficiently large aperture $L_0$ with the
    following property. For every compact interval $I subset bb(R)$,
    there is an error function $eta_I \( u \) arrow.r 0$, for $u in E$,
    such that every sufficiently large $u in E$ and every $x in I$ admit a point $w = p -
    upright(i) delta in bb(H)_(-)$ satisfying
#[#set math.equation(numbering: n => "(9.39)")
 $ \| p - x \| lt.eq L_0 delta \, wide \| - log delta - u \| lt.eq eta_I \( u \) u \, wide
   log \| F \( w \) \| gt.eq lambda u - eta_I \( u \) u . $ <model:witness-estimate>]

 The epochs are common to all centers; a center-dependent subsequence is not needed.]
] <prop:model-witnesses>

#proof[
  Fix
  $ 1 / 2 < alpha' < min \( alpha \, c_1 \, 1 \) $
  and choose $L_0$ large enough for the quiet-cone form of 52 with this exponent.
    If the conclusion fails, some fixed small $eta > 0$, epochs $u_j arrow.r oo$ in $E$,
    and centers $x_j$ in a fixed compact interval $I$ satisfy
  #[#set math.equation(numbering: n => "(9.40)")
   $ log \| F \( p - upright(i) e^(- v) \) \| < lambda u_j - eta u_j $ <model:failed-witness>]
  for every
  $ \| p - x_j \| lt.eq L_0 e^(- v) \, wide \| v - u_j \| lt.eq eta u_j . $
  Pass to a subsequence with $u_j gt.eq j^2$.
  Return to the actual data of 62, taking their sequence index sufficiently large after each fixed $u = u_j$. Set
  #[#set math.equation(numbering: n => "(9.41)")
   $ d'' = d' e^(- u) \, wide K'' = K + u \, wide B'' = mu \( K + u \) \, $ <model:witness-rescaling>]
  with physical center $xi_n + d' x_j$. We may require $K'' \, B'' arrow.r oo$:
    for fixed $u$, $B'' \/ B'$ tends to the positive number $e^(- u) m_(*) \( e^(- u) \)$.
  First retain a uniform global moment envelope at these scales. Write
  $ M_n \( v \) = e^v frac(mu \( K + v \), B') \, wide M_n \( v \) arrow.r e^(L \( v \)) $
  locally uniformly. The old envelope says
  #[#set math.equation(numbering: n => "(9.42)")
   $ M_n \( v \) lt.eq
     cases(delim: "{", C e^(\( 1 - beta \) v) \, & v lt.eq 0 \,, C e^(\( 1 + a \) v) \, & v gt.eq 0 .)
     $ <model:witness-old-tail>]
  Choose fixed $1 \/ 2 < c_2 < c_1$ and $P_2 > max \( P_1 \, 1 + a \)$.
    On the finite range $0 lt.eq v lt.eq C_0 u$, take the actual index so large that the ratios $M_n \( v \) \/
    M_n \( u \)$ differ from their limits by at most a factor two. The epoch bounds imply
  #[#set math.equation(numbering: n => "(9.43)")
   $ frac(M_n \( v \), M_n \( u \)) & lt.eq 2 e^(c_2 \( v - u \)) &  & \( 0 lt.eq v lt.eq u \) \,\
frac(M_n \( v \), M_n \( u \)) & lt.eq 2 e^(P_2 \( v - u \)) &  & \( u lt.eq v lt.eq C_0 u \) .
  $ <model:witness-local-envelope>]
  For all $v lt.eq 0$, (9.42) supplies the first bound up to one fixed constant, since $1 -
    beta > c_2$ and $L \( u \) = lambda u + o \( u \)$, $lambda gt.eq 1 > c_2$.
    For all $v gt.eq C_0 u$, it supplies the second bound if $C_0$ is a sufficiently large fixed constant:
  $ \( 1 + a - P_2 \) v + P_2 u - L \( u \) lt.eq 0 . $
  In terms of $mu$, this is a uniform new envelope with coarse exponent $1 -
    c_2 < 1 \/ 2$ and fine exponent $P_2 - 1 > 0$. Only a finite range chosen before the actual index used moment
    convergence.
  We next prove quietness on the whole needed cone, including the unbounded coarser tail.
    At old log depth $v$, the denominator for the new weighted quiet-cone assertion is
  #[#set math.equation(numbering: n => "(9.44)")
   $ M_n \( u \) e^(alpha' \( v - u \)) . $ <model:witness-denominator>]
  Indeed the new depth ratio is $e^(u - v)$, and
  $ d'' / B'' M_(upright("shape")) = frac(max \( \| F_n \| \, sqrt(\| Q_n \|) \), M_n \( u \)) \, $
  where $M_(upright("shape")) = max \( \| f \| \, sqrt(\| q \|) \)$.
  Increase the actual index further so that
  #[#set math.equation(numbering: n => "(9.45)")
   $ \| F_n - F \| lt.eq 1 \, wide sqrt(\| Q_n \|) lt.eq 1 $ <model:witness-diagonal>]
  throughout
  $ 0 lt.eq v lt.eq u_j + j \, wide \| p - x_j \| lt.eq L_0 e^(- v) . $
  For each $j$, a small enlargement of this set is a compact subset of $bb(H)_(-)$,
    so compact convergence allows the choice. Throughout the set, (9.44) is at least
  $ exp #scale(x: 120%, y: 120%)[\(] \( lambda - alpha' \) u_j + o \( u_j \) #scale(x: 120%, y: 120%)[\)] . $
  The errors in (9.45) are therefore negligible uniformly.
  For $u_j - eta u_j lt.eq v lt.eq u_j + j$, the upper endpoint is in the failed-witness window for large $j$.
    Equation (9.40) bounds the logarithmic ratio by
  $ - \( 1 - alpha' \) eta u_j + o \( u_j \) . $
  For $0 lt.eq v < u_j - eta u_j$, use (9.32) on the fixed horizontal enlargement of $I$ containing this part of
    the cone. Its errors over $0 lt.eq v lt.eq u_j$ are $o \( u_j \)$:
    separate a fixed compact $v$-range, then use the uniform asymptotic estimate on the remainder.
    The logarithmic ratio is at most
  $ \( lambda - alpha' \) \( v - u_j \) + o \( u_j \) lt.eq - \( lambda - alpha' \) eta u_j + o \( u_j \) . $
  For every $v < 0$ back to fixed physical depth, no convergence transfer is necessary.
    If $I subset \[ - R \, R \]$, the cone at old depth $e^(- v) gt.eq
    1$ lies inside the old cone of aperture $L_0 + R$, because
  $ \| p \| lt.eq R + L_0 e^(- v) lt.eq \( L_0 + R \) e^(- v) . $
  The inherited bound (9.19) gives
  $ frac(max \( \| F_n \| \, sqrt(\| Q_n \|) \), M_n \( u_j \) e^(alpha' \( v - u_j \))) lt.eq
    C_(L_0 + R) exp #scale(x: 120%, y: 120%)[\(] - \( lambda - alpha' \) u_j +
    o \( u_j \) #scale(x: 120%, y: 120%)[\)] e^(\( alpha - alpha' \) v) . $
  It tends uniformly to zero since $alpha > alpha'$. Both the aperture and its constant remain fixed despite
    movement of the centers.
  The three ranges give quietness down to $e^(- j) d''$, and hence down to every fixed positive multiple of $d''$
    eventually. The normalization is exactly $B'' = mu \( K'' \)$, with the uniform moment envelope proved above.
    These are the hypotheses of the quiet-cone form of 52. For clarity,
    at a fixed depth ratio and bounded scaled parameter, the parameter-to-depth ratio tends to zero because $B''
    arrow.r oo$. The local cone theorem uses a fixed ratio bound and a fixed aperture.
    Its quiet passage forces the global real width deficit divided by $d''$ to vanish,
    and the one-sided coefficient and moment argument in that theorem is contradictory.
  Thus, for each fixed small $eta > 0$, all sufficiently large common epochs have the required witnesses uniformly
    over $x in I$. A decreasing diagonal choice of $eta$ yields $eta_I \( u \) arrow.r 0$ in (9.39). ◻
]

=== 9.7 The high-modulus mesh contradiction <the-high-modulus-mesh-contradiction>

We isolate the function-theoretic consequence of the growth bound and the common-epoch witnesses.
  In the following argument a depth is the positive number $delta = - Im z$, and its logarithmic depth is $v = -
  log delta$.

#thm([Theorem 9.11.])[
  (High-modulus mesh contradiction).  #emph[Let $F equiv.not 0$ be holomorphic in $bb(H)_(-) := { z in bb(C) :
    Im z < 0 }$, and suppose that $F'' \/ F$ extends holomorphically to $bb(H)_(-)$.
    There cannot exist a number $lambda gt.eq 1$ and an unbounded set of epochs $E
    subset \( 0 \, oo \)$ with all of the following properties.]
  + #emph[For every compact interval $I subset bb(R)$,
#[#set math.equation(numbering: n => "(9.46)")
 $ sup_(x in I) log \| F \( x - upright(i) e^(- v) \) \| lt.eq lambda v + o \( v \) \, wide v arrow.r
   oo . $ <model:mesh-upper>]

 The error is uniform in $x in I$.]
  + #emph[The epochs are relatively dense in the sense that
#[#set math.equation(numbering: n => "(9.47)")
 $ "dist" \( v \, E \) = o \( v \) \, wide v arrow.r oo . $ <model:mesh-epochs>]

]
  + #emph[For every compact interval $I$, there are a fixed aperture $A_I < oo$ and a function $r_I \( u \)
    arrow.r 0$ such that, for every sufficiently large $u in E$ and every $x in I$, there is a point $w = p -
    upright(i) delta$ satisfying
#[#set math.equation(numbering: n => "(9.48)")
 $ \| p - x \| lt.eq A_I delta \, wide \| - log delta - u \| lt.eq r_I \( u \) u \, wide log \| F \( w \) \| gt.eq
   lambda u - r_I \( u \) u . $ <model:mesh-witness>]

]
  #emph[In particular, the epochs in (iii) are common to all the centers in $I$;
    no choice of an epoch depending on the center is allowed.]
] <thm:mesh-contradiction>

We first prove the two local estimates used to construct the mesh.
  All references to Brownian motion below can equivalently be formulated using harmonic measure and the minimum
  principle for superharmonic functions.

#thm([Lemma 9.12.])[
  (Small shadows of a high-deficit set).  #emph[Fix constants $1 lt.eq a lt.eq b$ and $K > 0$.
    Let $w = p - upright(i) d$, and let $cal(T)$ be a finite family of squares $T$ of sides $rho_T$ and center
    depths $d_T$, with
$ a rho_T lt.eq d_T lt.eq b rho_T \, wide d_T lt.eq d \/ 2 \, wide \| Re c_T - p \| lt.eq K d . $

 Choose a rectangle
$ R = { z : \| Re z - p \| < M d \, quad tau < - Im z < 2 d } \, $

 where $M$ is sufficiently large in terms of $a \, b \, K$, and $0 < tau < 1 / 4 min_T d_T$.
   Suppose that $U gt.eq 0$ is superharmonic in a neighborhood of $overline(R)$, that $U \( w \) < oo$,
   and that $U gt.eq H > 0$ on the concentric disks $D_T$ of radius $rho_T \/ 8$.
   If $I_T$ is the horizontal projection of $T$, then
#[#set math.equation(numbering: n => "(9.49)")
 $ lr(|union.big_(T in cal(T)) I_T|) lt.eq C d thin frac(U \( w \), H) . $ <model:mesh-shadow-bound>]

 Here $C$ depends only on the fixed geometric constants.]
] <model:mesh-shadow>

#proof[
  Let $B$ be Brownian motion started at $w$, stopped when it exits $R$.
    Superharmonic comparison, applied first up to the first hit of the union of the disks and then up to the exit, gives
  #[#set math.equation(numbering: n => "(9.50)")
   $ bb(P)_w { B upright(" hits some ") D_T upright(" before exiting ") R } lt.eq
     U \( w \) \/ H . $ <model:mesh-hitting-upper>]
  This comparison allows logarithmic poles of $U$: one can first stop away from those poles and then use monotone
    exhaustion. Alternatively, the harmonic probability of hitting the disk union, multiplied by $H$,
    is a subfunction of $U$ by the minimum principle on the complement of the disks.
  For each $T$, consider the event that the motion hits $D_T$ and subsequently exits $R$ through its top side at a
    horizontal coordinate in $I_T$. We claim that its probability is at least $c rho_T \/ d$.
    First stop at the horizontal line of depth $d_T$, or at the other sides of the part of $R$ below that line.
    The harmonic measure density on the segment
  $ \| x - Re c_T \| < rho_T \/ 32 \, wide - Im z = d_T \, $
  is bounded below by $c \/ d$. To see the uniformity, divide all lengths by $d$.
    The starting point has depth one, the bottom has depth two, and the new top has depth in $\[ 0 \, 1 \/ 2 \]$;
    the segment lies a fixed positive distance from the lateral sides.
    The interior-to-side Poisson density of a rectangle is positive and continuous in these parameters,
    including top depth zero. Its minimum on this compact family is therefore positive.
    Thus the probability of this first hit inside $D_T$ is at least $c rho_T \/ d$.
  From any point of that segment, the probability of exiting the original rectangle through its top within $I_T$
    has a fixed positive lower bound. Indeed, use a smaller rectangle with horizontal center $Re c_T$,
    horizontal half-width a fixed large multiple of $d_T$, top depth $tau$, and bottom depth $2 d_T$.
    It lies in $R$ after increasing $M$. After division by $d_T$, its starting points,
    top depth in $\[ 0 \, 1 \/ 4 \]$, and target intervals of length $rho_T \/ d_T
    in \[ 1 \/ b \, 1 \/ a \]$ again range over a compact family with nondegenerate margins.
    Positivity and continuity of harmonic measure give the claimed lower bound.
    Exiting this smaller rectangle on the specified top interval also exits $R$ there.
    The strong Markov property proves the claim.
  Choose a subfamily of the intervals $I_T$ with disjoint interiors whose total length is at least one third of
    the length of their union. For completeness, order the finite family by decreasing length,
    retain an interval if its interior is disjoint from those already retained, and discard it otherwise.
    Each discarded interval is contained in the threefold concentric enlargement of an intersecting retained
    interval of at least its length. This proves the asserted covering estimate.
    The events just constructed for the retained intervals are disjoint,
    because their final exit coordinates are in disjoint intervals;
    individual endpoints have harmonic measure zero. Each event is contained in the event in (9.50).
    Summing their lower bounds gives (9.49). In particular, no union bound over the number of tiles is being used. ◻
]

#thm([Lemma 9.13.])[
  (Routing near a good square).  #emph[Let $Q$ be a square of side $rho$ and center $c$.
    Suppose that $F$ is holomorphic on $B \( c \, 100 rho \)$, and that
$ U = M - log \| F \| gt.eq 0 quad upright("there") \, wide inf_Q U lt.eq T \, $

 where $T > 0$. There are disks with sum of radii at most $C h rho$, for any fixed sufficiently small $h > 0$,
   outside which
#[#set math.equation(numbering: n => "(9.51)")
 $ U \( z \) lt.eq C_h T quad upright("on the concentric square ") Q^(*) upright(" of side ") 9 rho .
   $ <model:mesh-local-high>]

 The constants are absolute except for the indicated dependence on $h$.
   A finite simple chain of such squares, in which touching neighbors have side ratios in $\[ 1 \/ 2 \, 2 \]$,
   can consequently be routed through their enlargements by a polygonal path satisfying the same bound with length
   at most $C sum_Q rho_Q$. The endpoints can be chosen in prescribed squares of side comparable to $rho_Q$ near
   the first and last tiles and contained in their respective enlargements;
   the routing constants may depend on these fixed comparability constants.]
] <model:mesh-routing>

#proof[
  Choose $q in Q$ with $U \( q \) lt.eq 2 T$. A disk about $q$ of radius $40
    rho$ lies in the given domain and contains $B \( c \, 30 rho \)$.
    The super-mean inequality, integrated over radii, and nonnegativity give
  #[#set math.equation(numbering: n => "(9.52)")
   $ integral_(B \( c \, 30 rho \)) U thin thin upright(d) A lt.eq C rho^2 T . $ <model:mesh-local-L1>]
  The distributional identity $- Delta U = 2 pi sum_a m_a delta_a$ records the zeros of $F$ with their
    multiplicities. A nonnegative smooth cutoff equal to one on $B \( c \, 20 rho \)$,
    supported in $B \( c \, 30 rho \)$, and with second derivatives bounded by $C rho^(- 2)$ yields
  $ N := sum_(a in B \( c \, 20 rho \)) m_a lt.eq C rho^(- 2) integral_(B \( c \, 30 rho \)) U thin thin
    upright(d) A lt.eq C T . $
  List these zeros with multiplicity as $a_1 \, dots.h \, a_N$. The function
  $ H \( z \) = U \( z \) + sum_(nu = 1)^N log frac(\| z - a_nu \|, rho) $
  extends harmonically across the zeros on $B \( c \, 20 rho \)$.
    Each logarithm has bounded absolute integral in scaled coordinates,
    so (9.52) gives $integral_(B \( c \, 20 rho \)) \| H \| thin thin upright(d) A lt.eq C rho^2 T$.
    The mean-value inequality for the absolute value of a harmonic function then gives $\| H \| lt.eq
    C T$ on $B \( c \, 10 rho \)$.
  Here is the precise elementary covering estimate needed for the logarithmic terms.
    For points $b_1 \, dots.h \, b_N in bb(C)$, outside disks of sum of radii at most $3 h$,
  #[#set math.equation(numbering: n => "(9.53)")
   $ product_(nu = 1)^N \| z - b_nu \| gt.eq \( h \/ e \)^N . $ <model:mesh-cartan>]
  There is nothing to prove when $N = 0$. Otherwise, consider all disks $B \( z \, h i \/ N \)$ whose interiors
    contain at least $i$ of the listed points, for $1 lt.eq i lt.eq N$.
    Starting with the largest of the finitely many possible radii,
    select a maximal disjoint family at each radius, discarding disks that intersect ones already selected.
    Only finitely many disks can be selected: their centers lie in a bounded set and their radii are at least
    $h \/ N$. Each unselected disk intersects a selected one of at least its radius,
    and is contained in that disk’s threefold enlargement. If the selected radii are $h i_k \/ N$,
    disjoint interiors show that $sum_k i_k lt.eq N$, by counting the points they contain.
    The enlarged disks therefore have total radius at most $3 h$.
    Outside them, the $i$-th smallest distance to the points is at least $h i \/ N$, for every $i$.
    Their product is at least $h^N N ! \/ N^N gt.eq \( h \/ e \)^N$, proving (9.53).
  Apply this estimate to $b_nu = \( a_nu - c \) \/ rho$. Outside the resulting disks,
  $ U lt.eq C T + N log \( e \/ h \) lt.eq C_h T quad upright("on ") B \( c \, 10 rho \) . $
  This implies (9.51).
  It remains to justify actual routing, including at corner contacts.
    If $Q \, Q'$ touch and have comparable sizes, choose a square centered at a contact point of side
    $min \( rho_Q \, rho_(Q') \)$. This square lies in $Q^(*) ∩ \( Q' \)^(*)$.
    The sums of the lengths of the horizontal and vertical projections of all exceptional disks for both tiles are
    at most $C h \( rho_Q + rho_(Q') \)$. Fix $h$ so small that each of these sums is less than half the side of
    the contact square. One can then choose an $x$-coordinate and a $y$-coordinate in that square,
    each outside the corresponding projections of both disk families.
    Their intersection is a junction point safe for both tiles.
    Choose the two endpoint coordinates in the same fashion in the prescribed endpoint squares.
    Within a tile, join its two chosen points by one horizontal and one vertical segment.
    Both coordinates at each endpoint avoid all exceptional projections for that tile,
    so these segments avoid all of its exceptional disks. They lie in $Q^(*)$,
    and their combined length is at most $C rho_Q$. Concatenation proves the routing assertion.
    The same construction works when a chain consists of a single tile. ◻
]

#proof[
  We work in fixed horizontal intervals contained in $\[ - 5 \, 5 \]$.
    All errors below are uniform on these intervals. Fix the aperture from (9.48) for this compact interval.
  ===== 9.7.1 Separated bands with neighboring logarithmic depths. <separated-bands-with-neighboring-logarithmic-depths.>
  Choose a nonincreasing function $theta \( v \) arrow.r 0$, with $theta \( v \) gt.eq v^(- 1 \/ 4)$,
    whose square bounds, eventually, the relative errors in (9.47) and (9.48),
    uniformly for all arguments at least $v$. Such a majorant is obtained by taking the decreasing tail supremum
    of these errors, its square root, and the maximum with $v^(- 1 \/ 4)$.
    Enlarging it slightly accommodates approximate nearest epochs if $E$ is not closed.
  Starting at a sufficiently large $u_1 in E$, set $s_j = theta \( u_j \) u_j$, and choose
  #[#set math.equation(numbering: n => "(9.54)")
   $ u_(j + 1) in E \, wide u_(j + 1) = u_j + 8 s_j + o \( s_j \) . $ <model:mesh-band-spacing>]
  Indeed the error in finding an epoch near $u_j + 8 s_j$ is at most $C theta \( u_j \)^2 u_j = o \( s_j \)$.
    The monotonicity of $theta$ implies $s_(j + 1) lt.eq \( 1 + o \( 1 \) \) s_j$.
    Consequently the bands $\[ u_j - s_j \, u_j + s_j \]$ are disjoint, their gaps tend to infinity, $s_j arrow.r
    oo$, and
  #[#set math.equation(numbering: n => "(9.55)")
   $ u_(j + k) = u_j + o \( u_j \) wide \( k = - 1 \, 0 \, 1 \, 2 \) . $ <model:mesh-neighboring-scales>]
  Every witness at epoch $u_j$ has logarithmic depth $u_j + o \( s_j \)$.
    These statements survive any fixed additive changes to the ends of the logarithmic bands.
  Choose dyadic depths $a_j \, b_j$ with
  $ a_j = e^(- u_j - s_j + O \( 1 \)) \, wide b_j = e^(- u_j + s_j + O \( 1 \)) \, wide a_j < b_j . $
  The horizontal rectangle is $R_j = \[ - 3 \, 3 \] times \[ a_j \, b_j \]$ in the coordinates $\( x \, delta \)$.
    The two vertical rectangles have horizontal intervals $\[ - 2 \, - 3 \/ 2 \]$ and $\[ 3 \/ 2 \, 2 \]$,
    and depth interval $\[ a_(j + 2) \/ 8 \, 8 b_j \]$; dyadic rounding can be incorporated into these fixed
    factors. The factors eight leave room at the ends for all subsequent local enlargements.
    A witness at epoch $u_(j - 1)$ is deeper than the entire vertical rectangle by a factor tending to infinity.
    In fact, the logarithmic gap from that witness to its bottom is at least $\( 7 - o \( 1 \) \) s_(j - 1)$.
  Take a slightly larger open region containing these three rectangles, the witnesses at epochs $u_j \,
    u_(j - 1)$ needed for centers in $\[ - 3 \, 3 \]$, and the fixed-factor boxes that will be used about them.
    Its horizontal coordinates lie in $\[ - 5 \, 5 \]$; all its logarithmic depths are $u_j + o \( u_j \)$,
    by (9.55). By (9.46) we can choose
  #[#set math.equation(numbering: n => "(9.56)")
   $ M_j = lambda u_j + o \( u_j \) \, wide M_j gt.eq lambda u_j \, wide U_j = M_j - log \| F \| gt.eq
     0 $ <model:mesh-deficit>]
  throughout this region. The function $U_j$ is superharmonic and may have logarithmic poles at the zeros of $F$.
    Its value at every witness just specified is $o \( u_j \)$, uniformly in its center.
  ===== 9.7.2 Tiles and the exclusion of bad barriers. <tiles-and-the-exclusion-of-bad-barriers.>
  Fix a sufficiently large dyadic integer $N_0$. In the layer $2^(- l - 1) lt.eq delta lt.eq 2^(- l)$,
    tile by squares of side $rho = 2^(- l - 1) \/ N_0$, using the common dyadic horizontal grid.
    The sides of a tile are thus a small fixed fraction of its depth.
    Take $N_0$ large enough that the disks of radius $100 rho$ required in 70 lie within the fixed-factor
    enlargements already allowed. The rectangles have dyadic boundaries, so they are finite unions of these tiles.
    Tiles that touch, even at a corner, have side ratios between one half and two.
  Choose $epsilon_j arrow.r 0$ so slowly that the uniform witness deficits in (9.56) are $o \( epsilon_j u_j \)$,
    and so that $M_j - lambda u_j = o \( epsilon_j u_j \)$. Color a tile good when
  #[#set math.equation(numbering: n => "(9.57)")
   $ sup_T log \| F \| gt.eq lambda u_j - epsilon_j u_j \, $ <model:mesh-good-tile>]
  and bad otherwise. On every bad tile, $U_j gt.eq epsilon_j u_j$.
    For any witness $w$ at one of the two indicated epochs, 69 therefore implies that the union of the projections
    of bad tiles with center depth at most $delta_w \/ 2$ and horizontal center distance at most $K
    delta_w$ from $w$ has length
  #[#set math.equation(numbering: n => "(9.58)")
   $ o \( delta_w \) . $ <model:mesh-small-bad-shadow>]
  Here $K$ is any fixed constant needed below. For this application put the fictitious top of the Brownian
    rectangle a fixed factor shallower than the shallowest tile under consideration.
    The rectangle then lies in the enlarged region of (9.56).
  There is no bad chain in $R_j$ from its shallow edge to its deep edge, even when corner contacts are allowed.
    Suppose such a chain exists and let $x_0$ be a point where it meets the shallow edge.
    Choose the epoch-$u_j$ witness $p - upright(i) delta_w$ for the center $x_0$.
    The shallow edge is much shallower than $delta_w$, and the deep edge is much deeper.
    Follow the chain from its shallow end until it first reaches depth $delta_w \/
    4$ or first leaves the horizontal interval $\[ x_0 - delta_w \, x_0 + delta_w \]$.
    Taking $N_0$ large guarantees that all tiles up to and including this first event have center depths at most
    $delta_w \/ 2$ and center distances from $p$ at most $\( A_I + 2 \) delta_w$.
    In the first case the last tile has side at least $c delta_w \/ N_0$,
    so its shadow alone has length at least a fixed positive multiple of $delta_w$.
    In the second case the projections of this connected chain prefix cover an interval of length at least $c
    delta_w$. Both conclusions contradict (9.58).
  Neither vertical rectangle has a bad chain joining its two lateral sides.
    Choose an epoch-$u_(j - 1)$ witness for the midpoint of its fixed horizontal interval.
    This witness has depth $delta_w$, and every tile of the rectangle has center depth less than $delta_w \/
    2$ for large $j$. Its horizontal coordinate $p$ lies in the interior of the strip,
    since its distance from the midpoint is at most $A_I delta_w arrow.r 0$.
    A lateral bad crossing projects onto the whole strip. The tiles of that crossing with centers in
    $\[ p - 2 delta_w \, p + 2 delta_w \]$ therefore have projections covering $\[ p - delta_w \, p + delta_w \]$,
    once $N_0$ is large. This again contradicts (9.58).
  ===== 9.7.3 Planar duality and routing the good chains. <planar-duality-and-routing-the-good-chains.>
  We include the finite grid argument to specify the corner convention.
    Subdivide every tile of a rectangle to its finest dyadic square grid, retaining the parent tile’s color.
    On a finite square grid, either there is a good left-to-right path using shared edges,
    or there is a bad top-to-bottom path using shared edges or corners.
    To prove this, mark all good cells reachable by shared edges from the left side and adjoin an exterior collar
    along the left. If this set reaches the right, the first alternative holds.
    Otherwise follow its right-hand boundary from the top of the rectangle to the bottom,
    with the marked set on the left. At vertices with several possible continuations,
    keep the marked set on the left, equivalently resolve the vertex by a small rounded arc.
    Closed boundary components can be ignored. The cells immediately on the right of the resulting boundary are
    bad: an edge-adjacent good cell would have been marked. Consecutive such cells share an edge or a corner,
    and they join the top to the bottom. If no cell was marked, the first column itself is such a bad chain.
    This proves the alternative. Interchanging the two coordinate directions gives its vertical version.
    Mapping a chain back to its parent tiles preserves corner adjacency;
    removing loops and repeated tiles gives a simple parent chain.
  The bad barriers have already been excluded. Thus $R_j$ has a good horizontal chain,
    and each vertical rectangle has a good vertical chain. On a good tile the infimum of $U_j$ is at most $M_j -
    lambda u_j + epsilon_j u_j = o \( u_j \)$, uniformly. Apply 70 to route each chain.
    We obtain a horizontal path $gamma_j$, extending from near $- 3$ to near $3$,
    and vertical paths $sigma_j^(-)$, $sigma_j^(+)$ in slight enlargements of the two side strips, with
  #[#set math.equation(numbering: n => "(9.59)")
   $ log \| F \| gt.eq lambda u_j - o \( u_j \) quad upright("on ") gamma_j union sigma_j^(-) union sigma_j^(+) .
     $ <model:mesh-path-height>]
  The horizontal path stays in a fixed-factor enlargement of its band.
    The vertical paths start deeper than all of $gamma_j$ and end shallower than all of $gamma_(j + 2)$.
    They remain to the left or right, respectively, of the entire interval $\[ - 1 \, 1 \]$.
  The length estimate in the routing lemma is subexponential in $u_j$.
    Indeed, in any of these rectangles the smallest tile side is $e^(- u_j + o \( u_j \))$,
    the largest side is $e^(- u_j + o \( u_j \))$, its height is $e^(- u_j + o \( u_j \))$,
    and its width is bounded. Even its entire finest grid contains at most $e^(u_j + o \( u_j \))$ cells.
    Hence the number of parent tiles times their largest side, and therefore each routed path’s length, is at most
  #[#set math.equation(numbering: n => "(9.60)")
   $ exp \( o \( u_j \) \) . $ <model:mesh-path-length>]
  All local constants, including those in the Cartan covering, have been fixed before $j$ tends to infinity.
  Each vertical path intersects each of $gamma_j \, gamma_(j + 1) \, gamma_(j + 2)$.
    One elementary way to verify this is to erase loops from a horizontal polygonal path and trim it at two
    vertical lines outside the side strips. It is then a simple arc joining the opposite sides of a rectangle,
    confined to its horizontal band. Closing this arc along three sides of the rectangle and applying the Jordan
    curve theorem separates points above the band from points below it.
    A vertical path in either side strip has endpoints on these different sides and must meet the arc.
    The fixed-factor margins ensure that local routing has not changed this separation.
  ===== 9.7.4 A primitive with no logarithmic monodromy. <a-primitive-with-no-logarithmic-monodromy.>
  Set $q = F'' \/ F$, holomorphic by hypothesis. Every zero $z_0$ of $F$ is simple.
    Otherwise $F \( z_0 \) = F' \( z_0 \) = 0$, and uniqueness for the holomorphic equation $F'' =
    q F$ would imply $F equiv 0$. At a simple zero this equation also gives $F'' \( z_0 \) = 0$, and hence
  $ F \( z \) = a \( z - z_0 \) + O \( \( z - z_0 \)^3 \) \, wide F \( z \)^(- 2) = a^(- 2) \( z - z_0 \)^(- 2) +
    O \( 1 \) \, quad a eq.not 0 . $
  In particular all residues of $F^(- 2)$ vanish. Integration around any closed curve avoiding its poles is zero:
    the curve is compact in the simply connected half-plane and encloses only finitely many poles,
    so this is the residue theorem. Thus there is a single-valued meromorphic function $C_0$ in $bb(H)_(-)$ with
  #[#set math.equation(numbering: n => "(9.61)")
   $ C'_0 = F^(- 2) . $ <model:mesh-primitive>]
  Its singularity at a zero $z_0$ is $- a^(- 2) \( z - z_0 \)^(- 1)$.
  The paths have no zeros, by (9.59). Equations (9.59)–(9.60) imply that the oscillation of $C_0$ along any one of
    the three paths with index $j$ is at most
  #[#set math.equation(numbering: n => "(9.62)")
   $ e^(- 2 lambda u_j + o \( u_j \)) . $ <model:mesh-oscillation>]
  Choose an arbitrary point $z_j in gamma_j$. The connections just proved join $z_j$ to $z_(j + 1)$ by pieces of
    $gamma_j \, sigma_j^(-) \, gamma_(j + 1)$. Thus $\| C_0 \( z_(j + 1) \) - C_0 \( z_j \) \| lt.eq
    e^(- 2 lambda u_j + o \( u_j \))$. The gaps $u_(j + 1) - u_j$ eventually exceed one.
    For any fixed $eta in \( 0 \, 2 lambda \)$ and all sufficiently large $j$,
    the telescoping tail is therefore bounded by
  $ sum_(k gt.eq j) e^(- \( 2 lambda - eta \) u_k) lt.eq
    frac(e^(- \( 2 lambda - eta \) u_j), 1 - e^(- \( 2 lambda - eta \))) . $
  It follows that $C_0 \( z_j \)$ tends to a constant $c_(*)$.
    Letting $eta$ tend to zero, and using (9.62) to reach every point of the three paths, gives the uniform estimate
  #[#set math.equation(numbering: n => "(9.63)")
   $ \| C_0 - c_(*) \| lt.eq e^(- 2 lambda u_j + o \( u_j \)) quad
     upright("on ") gamma_j union sigma_j^(-) union sigma_j^(+) . $ <model:mesh-primitive-limit>]
  This is one common constant for the whole mesh, not a separate constant for each band or each side strip.
  The function
  #[#set math.equation(numbering: n => "(9.64)")
   $ G = F \( C_0 - c_(*) \) $ <model:mesh-vanishing-function>]
  extends holomorphically through every zero of $F$: its apparent pole cancels, with limiting value $-
    a^(- 1)$ at the zero above. The upper bound on the enlarged regions, together with (9.63), gives
  #[#set math.equation(numbering: n => "(9.65)")
   $ \| G \| lt.eq e^(- lambda u_j + o \( u_j \)) arrow.r 0 quad
     upright("uniformly on ") gamma_j union sigma_j^(-) union sigma_j^(+) . $ <model:mesh-G-bound>]
  ===== 9.7.5 Enclosing every shallow point and reflecting. <enclosing-every-shallow-point-and-reflecting.>
  The arrangement of the paths is illustrated in 4.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-4.805, 3.66), (4.805, 3.66), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.851, 3.66), [#text(size: 9pt)[$Im z=0$]], anchor: "west", padding: 0.1176cm)
  rect((-4.65, 0.36), (4.65, 0.84), fill: rgb("#f0f3f5"), stroke: none)
  rect((-4.65, 1.38), (4.65, 1.86), fill: rgb("#f0f3f5"), stroke: none)
  rect((-4.65, 2.4), (4.65, 2.88), fill: rgb("#f0f3f5"), stroke: none)
  line((-4.65, 0.552), (-3.255, 0.612), (-2.015, 0.516), (-0.775, 0.708), (0.31, 0.576), (1.395, 0.504), (2.635, 0.66), (3.41, 0.552), (4.65, 0.624), stroke: (paint: rgb("#234f70"), thickness: 0.8pt, miter-limit: 10))
  line((-4.65, 1.608), (-3.41, 1.704), (-2.325, 1.524), (-0.93, 1.644), (0.31, 1.548), (1.705, 1.728), (2.945, 1.584), (4.65, 1.644), stroke: (paint: rgb("#234f70"), thickness: 0.8pt, miter-limit: 10))
  line((-4.65, 2.604), (-3.255, 2.736), (-2.17, 2.568), (-0.775, 2.688), (0.465, 2.556), (1.55, 2.712), (2.79, 2.58), (4.65, 2.676), stroke: (paint: rgb("#234f70"), thickness: 0.8pt, miter-limit: 10))
  line((-3.022, 0.348), (-2.899, 0.984), (-3.146, 1.392), (-2.976, 2.052), (-3.162, 2.88), stroke: (paint: rgb("#234f70"), thickness: 0.8pt, miter-limit: 10))
  line((3.022, 0.348), (3.146, 1.02), (2.914, 1.416), (3.131, 2.112), (2.961, 2.88), stroke: (paint: rgb("#234f70"), thickness: 0.8pt, miter-limit: 10))
  circle((0.6975, 2.1), radius: 0.05997, fill: rgb("#a34637"), stroke: none)
  content((0.8215, 2.124), [#text(size: 9pt)[target point]], anchor: "west", padding: 0.1176cm)
  content((-4.805, 0.6), [#text(size: 9pt)[$u_j$]], anchor: "east", padding: 0.1176cm)
  content((-4.805, 1.62), [#text(size: 9pt)[$u_(j+1)$]], anchor: "east", padding: 0.1176cm)
  content((-4.805, 2.64), [#text(size: 9pt)[$u_(j+2)$]], anchor: "east", padding: 0.1176cm)
  content((0, -0.18), [#text(size: 9pt)[$log |F| gt.eq lambda u_j-o(u_j)$ on the connecting paths]])
})],
    caption: [Figure 4: The mesh in the pure first-field model. Vertical spacing is schematic: the bands lie at logarithmic depths $u_j + o \( u_j \)$. Horizontal paths and side connectors enclose every sufficiently shallow point of a smaller interval. Their high-modulus bounds give one common limit $c_(*)$ for the meromorphic primitive $C_0$, where $C'_0 = F^(- 2)$. The product $G = F \( C_0 - c_(*) \)$ is holomorphic even at zeros of $F$; its boundary estimate therefore passes to the enclosed regions by the maximum principle. ],
  ) <fig:mesh>
  Write $\[ alpha_j \, beta_j \]$ for a logarithmic-depth interval containing the entire routed horizontal path
    $gamma_j$. The fixed-factor enlargements give $alpha_j = u_j - s_j - O \( 1 \)$ and $beta_j = u_j + s_j +
    O \( 1 \)$, and $beta_j < alpha_(j + 1)$ for large $j$. Given $z = x -
    upright(i) e^(- v)$ with $x in \[ - 1 \, 1 \]$ and $v$ large, choose $j$ so that
  $ beta_j < v lt.eq beta_(j + 1) . $
  Then $gamma_j$ lies strictly below $z$, whereas $gamma_(j + 2)$ lies strictly above $z$.
    The two paths $sigma_j^(-)$ and $sigma_j^(+)$ connect across both bands and lie strictly to the left and right
    of $z$.
  Choose an intersection of each side path with the lower and upper horizontal paths,
    and use the corresponding path segments to form a closed walk, in the order lower, right, upper, left.
    More explicitly, along either side path take its last lower-path hit before its first subsequent upper-path
    hit; its intervening segment then joins those two paths. Join these endpoints along the horizontal paths.
    Every piece lies in the indicated open half-plane relative to $z$,
    and the four corner points lie in the corresponding quadrants. This walk has winding number one about $z$:
    replace each of its pieces by a straight segment within its open half-plane, which is convex and avoids $z$.
    The resulting quadrilateral traverses successively the four quadrants and has total change of argument $2 pi$.
    Equivalently, the arguments on the lower, right, upper, and left pieces can be chosen in their respective
    half-plane intervals and then joined in this order. Self-intersections of a path or of the walk do not affect
    this winding calculation.
  The complementary component containing $z$ is therefore bounded and has boundary in this walk.
    It lies compactly in the half-plane. The maximum principle for the holomorphic function $G$ gives its bound
    there from the walk. The upper horizontal piece has index $j + 2$, and $u_(j + 2) = u_j + o \( u_j \)$,
    so (9.65) yields
  $ \| G \( x - upright(i) e^(- v) \) \| lt.eq e^(- lambda u_j + o \( u_j \)) . $
  The same estimate is immediate if the point lies on a mesh path.
    As $v arrow.r oo$, the selected $j$ tends to infinity uniformly for $x in \[ - 1 \, 1 \]$.
    Hence $G$ has continuous boundary value zero on $\( - 1 \, 1 \)$, uniformly on compact subintervals.
  Schwarz reflection across this interval extends $G$ holomorphically by $overline(G \( overline(z) \))$.
    The extension vanishes on the interval, so the identity theorem gives $G equiv 0$.
    On any disk where $F eq.not 0$, this says $C_0 equiv c_(*)$, contradicting $C'_0 = F^(- 2) eq.not 0$.
    The contradiction proves the Theorem. ◻
]

#proof[
  Assume that a sequence in 53 exists. Its primary moments have a limit by 59. Apply 60 to its logarithmic law.
    The steep-contact alternative contradicts 40, as proved in 61.
    The bounded-contact alternative gives the fields in 62. Their nonzero first field has holomorphic quotient
    $F'' \/ F$. The limiting impact equation and parameter continuation, Proposition 9.6, Proposition 9.8,
    give its uniform upper growth. Lemma 9.9, Proposition 9.10 give common relatively dense epochs and uniform
    witnesses at every horizontal center. These are precisely the hypotheses contradicted by 68.
    Both alternatives are impossible, proving the Theorem. ◻
]

#thm([Corollary 9.14.])[
  (The critical angle budget is available).  #emph[In the remaining finite-wall critical case,
    the angle budget of 57 and the polynomial bounds of 55 hold unconditionally.
    In particular, for some $epsilon.alt > 0$,
$ integral_(k_0)^K mu_f \( k \)^2 thin thin upright(d) k lt.eq C K^(2 - epsilon.alt) . $

]
] <model:angle-budget-activated>

#proof[
  The sole forward assumption in the critical reduction was the nonexistence of the sequences in 53. This is 58.
    Apply the two stated results. Their conclusions were not used anywhere in the proof of that theorem. ◻
]

== 10 An odd periodic slice and its stopped geometry <sec:odd-slice>

We now work in the remaining nonisotropic case: the shape strip has finite width $H$,
  and the growth at its boundary is critical. By 71, there are constants $0 < rho < 1$ and $C$ such that

#[#set math.equation(numbering: n => "(10.1)")
 $ integral_(k_0)^K mu_f \( v \)^2 thin thin upright(d) v lt.eq
   C K^(2 rho) wide \( K gt.eq k_0 \) . $ <odd:angle-budget>]

We shall use this saving to control the geometry of one fixed periodic orbit family,
  even when its complex continuation approaches the shape wall.
  The estimates will hold up to a stopping time defined by the greatest logarithmic shape depth visited so far.
  Keeping this history in the stopping rule is essential: it permits us to use a finite collection of determinant
  estimates when the sites requiring those estimates change along a path.

=== 10.1 The cyclic geometry and its Jacobi matrix <the-cyclic-geometry-and-its-jacobi-matrix>

Fix a sufficiently small positive parameter

$ t_0 = frac(2 pi, N) \, wide N gt.eq 3 upright(" odd") \, $

inside the real analytic collar. The integer $N$ and the parameter $t_0$ are fixed throughout this section,
  before any limiting depth is chosen. Set

$ h = h_X \( t_0 \) = h_L \( t_0 \) \, wide 0 < h lt.eq H \, $

where equality of the two widths on real parameters and the upper bound follow from the continuation results
  and 29. On $\| Im y \| < h$, put

#[#set math.equation(numbering: n => "(10.2)")
 $ s_j \( y \) & = frak(s) \( y + j t_0 \, t_0 \) \, & X_j \( y \) & = Gamma \( s_j \( y \) \) \,\
psi_j \( y \) & = phi.alt \( s_j \( y \) \) \, & f_j \( y \) & = f \( s_j \( y \) \) . $ <odd:site-data>]

We use indices modulo $N$, with the prescribed lifts $s_(j + N) = s_j + 2 pi$ and $psi_(j + N) = psi_j + 2 pi$.
  The functions $s_j$ and $psi_j$ are holomorphic; the position functions are meromorphic.

Recall

$ n_theta = \( cos theta \, sin theta \) \, wide e_theta = \( - sin theta \, cos theta \) . $

The equations

#[#set math.equation(numbering: n => "(10.3)")
 $ theta_(j - 1) + theta_j = 2 psi_j \, wide theta_(j + N) = theta_j + 2 pi $ <odd:angle-system>]

have a unique solution because $N$ is odd. For example, repeated substitution expresses each $theta_j$ as an
  alternating sum of $N$ consecutive $psi$’s plus a fixed multiple of $pi$.
  These solutions are holomorphic and agree, on the real collar, with the directed angles of the billiard edges.
  Consequently the identities below continue meromorphically from that collar. Define

#[#set math.equation(numbering: n => "(10.4)")
 $ d_j^0 & = theta_j - psi_j \, wide p_j = X_j dot.op n_(theta_j) \,\
X_(j + 1) - X_j & = ell_j e_(theta_j) \, wide H_j^0 = X_j dot.op n_(psi_j) . $ <odd:edge-data>]

Here and below the scalar product is the complex bilinear extension of the Euclidean scalar product.
  The chord lengths $ell_j$ are directed meromorphic lengths; they are positive on the real collar.

The elementary support identities are

#[#set math.equation(numbering: n => "(10.5)")
 $ p_(j - 1) + p_j & = 2 H_j^0 cos d_j^0 \, & p_j - p_(j - 1) & = 2 \( X_j dot.op e_(psi_j) \) sin d_j^0 \,\
thin upright(d) H_j^0 & = \( X_j dot.op e_(psi_j) \) thin thin upright(d) psi_j \, & thin upright(d) X_j & =
  c e_(psi_j) f_j^(- 2) thin thin upright(d) s_j . $ <odd:offset-system>]

Indeed, $theta_(j - 1) = psi_j - d_j^0$ and $theta_j = psi_j + d_j^0$,
  which gives the first line by addition and subtraction. The second line follows from $Gamma' =
  c e_phi.alt f^(- 2)$ and $phi.alt' = f$. Although $X_j$ can have a pole, $H_j^0$ is regular there.
  To see the cancellation, let $s_0$ be a zero of $f$. By 30,

$ f \( s \) = a \( s - s_0 \) + O \( \( s - s_0 \)^3 \) \, wide a eq.not 0 . $

Thus $phi.alt \( s \) - phi.alt \( s_0 \) = O \( \( s - s_0 \)^2 \)$,
  and the residue of $Gamma$ is parallel to $e_(phi.alt \( s_0 \))$.
  Its scalar product with $n_(phi.alt \( s \))$ therefore has no pole.

Oddness also makes the offset system invertible. In fact

$ p_j = sum_(m = 0)^(N - 1) \( - 1 \)^m H_(j - m)^0 cos d_(j - m)^0 . $

After finding the offsets, the second equation in (10.5) recovers the tangential component of every $X_j$.
  In particular, if the angles and the absolute logarithms of $\| sin d_j^0 \|$ are at most $B$, then

#[#set math.equation(numbering: n => "(10.6)")
 $ max_j \| X_j \| lt.eq exp \( C \( 1 + B \) \) max_j \| H_j^0 \| . $ <odd:reconstruction>]

All constants in this section may depend on the fixed slice.

Define the symmetric matrices $M_0$, $cal(V)$, and $cal(H)$ by

#[#set math.equation(numbering: n => "(10.7)")
 $ chevron.l M_0 z \, z chevron.r = sum_(j = 0)^(N - 1) frac(\( z_j + z_(j + 1) \)^2, ell_j) \, wide cal(V)_j =
   frac(2 f_j^3, c sin d_j^0) \, wide cal(H) = M_0 - cal(V) \, $ <odd:Jacobi-matrix>]

where $cal(V)$ is diagonal. Introduce the vector

#[#set math.equation(numbering: n => "(10.8)")
 $ w_j = c sin d_j^0 thin f_j^(- 2) s'_j \( y \) . $ <odd:w-definition>]

#thm([Lemma 10.1.])[
  (Odd-cycle matrices).  #emph[The following identities hold meromorphically on the slice:
#[#set math.equation(numbering: n => "(10.9)")
 $ cal(H) w = 0 \, wide 2 f_j s'_j = \( M_0 w \)_j . $ <odd:jacobi-angle>]

 On the real collar, $w_j > 0$, $cal(H)$ is negative semidefinite,
   and each of its proper principal submatrices is negative definite. The matrix $M_0$ is positive definite there.]
  #emph[More generally, let $I$ be a proper subset of the sites and let $F subset.eq I^c$.
    Retain the sites of $I$ with their actual curvature, retain the sites of $F$ with curvature zero,
    and delete all other sites. The resulting matrix
#[#set math.equation(numbering: n => "(10.10)")
 $ B_(I \, F) = \( M_0 \)_(I union F \, I union F) - "diag" #scale(x: 120%, y: 120%)[\(] cal(V)_i
   upright(bold(1))_({ i in I }) #scale(x: 120%, y: 120%)[\)] $ <odd:modified-matrix>]

 is invertible on the real collar. In particular its meromorphic determinant is not identically zero.
   For an empty retained set we use determinant $1$ and inverse norm $0$.]
] <lem:odd-matrices>

#proof[
  First work on the real collar. If $delta upright("arc")_j$ is an arc-length variation at vertex $j$, put $z_j =
    sin d_j^0 thin delta upright("arc")_j$. The normal projections on edge $j$ of the two endpoint variations are
    $z_j$ and $- z_(j + 1)$. The second variation of that edge length is therefore $\( z_j + z_(j + 1) \)^2 \/
    ell_j$, apart from the acceleration of the endpoint paths.
    The latter acceleration is $- n_(psi_j) f_j^3 \/ c$ per squared arc-length increment.
    Pairing it with the length gradient $e_(theta_(j - 1)) - e_(theta_j)$ gives $-
    2 f_j^3 sin d_j^0 \/ c$ per squared arc-length increment, or $- cal(V)_j z_j^2$.
    Thus $cal(H)$ is the length Hessian in these variables. Differentiation along the periodic family gives
    $cal(H) w = 0$. Since $cal(V)_j w_j = 2 f_j s'_j$, this also gives the second identity in (10.9).
    Analytic continuation proves the meromorphic identities.
  The real collar is sufficiently small that $s'_j > 0$ and $sin d_j^0 > 0$, so $w_j > 0$.
    Let $D_w = "diag" \( w_j \)$ and put $gamma_j = w_j w_(j + 1) \/ ell_j > 0$.
    The off-diagonal entries of $D_w cal(H) D_w$ are $gamma_j$; the identity $cal(H) w =
    0$ fixes its diagonal entries as $- gamma_(j - 1) - gamma_j$. Consequently
  $ chevron.l D_w cal(H) D_w z \, z chevron.r = - sum_j gamma_j \( z_j - z_(j + 1) \)^2 . $
  The cycle is connected. Its only null vectors are constant,
    and fixing any one coordinate to zero removes the nullspace. This proves the two claims concerning $cal(H)$.
    A null vector for $M_0$ would satisfy $z_(j + 1) = - z_j$ for every $j$; oddness then forces $z = 0$.
  For the last assertion, arrange the retained coordinates as $I \, F$.
    The truthful diagonal block is $cal(H)_(I \, I) < 0$, and the flat diagonal block is $\( M_0 \)_(F \, F) > 0$.
    When both are nonempty, the Schur complement of the flat block is
  $ cal(H)_(I \, I) - \( M_0 \)_(I \, F) \( M_0 \)_(F \, F)^(- 1) \( M_0 \)_(F \, I) < 0 . $
  Hence the full matrix is invertible. If one of the two blocks is empty,
    one of the already proved definite-matrix statements applies. ◻
]

#thm([Lemma 10.2.])[
  (Cofactor normalization).  #emph[Let $A \( t_0 \) eq.not 0$ be the signed area coefficient from (3.4),
    in the directed-edge convention used here. Then
#[#set math.equation(numbering: n => "(10.11)")
 $ w_j^2 = \( - 1 \)^(N - 1) frac(A \( t_0 \), N) (product_(i = 0)^(N - 1) ell_i) det cal(H)_(hat(j)) . $ <eq:cofactor>]

 Here $cal(H)_(hat(j))$ denotes the principal matrix with site $j$ deleted.]
] <odd:cofactor-normalization>

#proof[
  On the collar let $v_j$ be the variation obtained by differentiating $frak(s) \( y + j t \, t \)$ with respect
    to $t$, including its argument $j t$, and multiplying by $c sin d_j^0 f_j^(- 2)$, at $t = t_0$. Periodicity gives
  $ v_(j + N) = v_j + N w_j . $
  The endpoint normal differentials on edge $j$ are
  $ n_(theta_j) dot.op thin upright(d) X_j = w_j thin thin upright(d) y + v_j thin thin upright(d) t \, wide
    n_(theta_j) dot.op thin upright(d) X_(j + 1) = - w_(j + 1) thin thin upright(d) y -
    v_(j + 1) thin thin upright(d) t . $
  Differentiating $X_(j + 1) - X_j = ell_j e_(theta_j)$ and taking the normal component yields
  $ thin upright(d) theta_j =
    frac(\( w_j + w_(j + 1) \) thin thin upright(d) y + \( v_j + v_(j + 1) \) thin thin upright(d) t, ell_j) . $
  Since $thin upright(d) p_j and thin upright(d) theta_j = \( n_(theta_j) dot.op thin upright(d) X_j \) and
    thin upright(d) theta_j$, the area identity gives
  $ frac(w_j v_(j + 1) - v_j w_(j + 1), ell_j) = A \( t_0 \) . $
  The shift of the line phase by $\( j + 1 \/ 2 \) t$ does not alter the coefficient of $thin upright(d) y and
    thin upright(d) t$. Summing the successive differences of $v_j \/ w_j$ therefore gives
  #[#set math.equation(numbering: n => "(10.12)")
   $ sum_j frac(ell_j, w_j w_(j + 1)) = frac(N, A \( t_0 \)) . $ <odd:Wronskian-sum>]
  The deleted cofactor of the negative weighted cycle Laplacian is
  $ \( - 1 \)^(N - 1) sum_k product_(i eq.not k) gamma_i = \( - 1 \)^(N - 1) (product_i gamma_i)
    (sum_i gamma_i^(- 1)) . $
  For completeness, write the positive Laplacian as an incidence matrix, times $"diag" \( gamma_i \)$,
    times its transpose, and delete one vertex. Cauchy–Binet expands the determinant over the omitted edge.
    Each remaining edge set is a path tree, whose incidence minor has determinant $plus.minus 1$;
    this gives precisely the displayed sum. Undoing the conjugation by $D_w$, and then using (10.12),
    proves (10.11) on the collar. Both sides are meromorphic functions of $y$,
    so the identity holds throughout the slice. ◻
]

=== 10.2 Contact with the shape wall <contact-with-the-shape-wall>

#thm([Theorem 10.3.])[
  (Boundary contact).  #emph[At almost every point of either horizontal boundary of the phase strip $\| Im y \| <
    h$, the functions $s_0 \, dots.h \, s_(N - 1)$ have finite nontangential limits,
    and at least one of these limits lies on $\| Im s \| = H$.]
] <thm:boundary-contact>

#proof[
  By 29, each $e^(upright(i) s_j)$ is bounded and bounded away from zero.
    The boundary limit theorem for bounded holomorphic functions gives nontangential limits almost everywhere
    #cite(label("Garnett2007")) Chapter I, Theorem 5.3. Near a nonzero limiting value, choose a local logarithm.
    On a connected truncated approach cone it differs from $upright(i) s_j$ by one fixed integral multiple of $2
    pi upright(i)$. Thus $s_j$ itself has a finite nontangential limit.
  Suppose the limiting states are all strictly inside the shape strip on a set of positive measure.
    At a point of this set we can require, in addition, that every $f_j$, $sin d_j^0$, $ell_j$,
    and $det cal(H)_(hat(j))$ have a nonzero limit. To justify the requirement,
    first exclude limiting zeros of the $f_j$. Each $f_j$ is holomorphic on the phase strip and nonzero on the
    real collar. If its angular limit were zero on a positive-measure subset,
    the same boundary uniqueness theorem used below would force $f_j equiv 0$, a contradiction.
    Thus the finite union of these exceptional sets has measure zero.
    The sine and length evaluations are then regular at the interior limiting state tuple.
    Exclude their zero limits next; all cofactor evaluations are regular after those exclusions.
    If any one of these meromorphic functions had limiting value zero on a positive-measure set,
    Privalov’s nontangential boundary uniqueness theorem for meromorphic functions would make it identically zero
    #cite(label("Garnett2007")) Chapter II, p. 91. This is impossible by its nondegenerate real values.
    There are only finitely many functions to exclude. To apply the disk boundary theorems to this strip,
    restrict to a compact boundary subarc of positive measure and use a conformal map to the disk.
    The map extends analytically across that subarc with nonzero derivative,
    preserving null sets and nontangential approach regions.
  Write $upright(bold(s)) = \( s_0 \, dots.h \, s_(N - 1) \)$.
    Near such a limiting tuple the cofactor identity and (10.8) express
  $ \( s'_j \)^2 = G_j \( upright(bold(s)) \) \, $
  where each $G_j$ is analytic and nonzero. Choose the square roots with the signs of the actual functions on a
    truncated approach cone. We obtain a regular analytic vector equation $upright(bold(s))' =
    upright(bold(g)) \( upright(bold(s)) \)$. Local solutions starting sufficiently near the limiting tuple exist
    in disks of a common positive radius. Starting at an interior point sufficiently close to the boundary,
    uniqueness identifies that solution with the actual slice on their overlap.
    This continues the whole slice arc across the chosen boundary point.
  It remains to explain why an extension of this single slice yields a #emph[joint] extension, as required for 24.
    We give the argument at the upper boundary. The states
  $ Z = \( s_0 \, s_1 \) $
  on the extended arc form a regular analytic curve, parameterized by $y$.
    All incidence angles and chords along its orbit are nondegenerate.
    Thus the local billiard return $R$, after $N$ reflections and subtraction of the known $2 pi$ shifts,
    is analytic near these states. At each reflection, this follows by solving the next incidence equation on the
    regular table arc; its derivative in the next intersection coordinate is nonzero because the sine of incidence
    is nonzero. The return fixes the extended curve, by analytic identity from below.
  The determinant of its linearization at a fixed state is one.
    One can see this without choosing symplectic coordinates:
    successive linearized stationarity equations in the Jacobi variables have transfer determinants equal to
    ratios of consecutive off-diagonal entries. The ratios telescope over the cycle.
    The coordinate factors converting $delta s_j$ to $c sin d_j^0 f_j^(- 2) delta
    s_j$ are also periodic along the fixed orbit. Choose local coordinates $\( u \, v \)$ with the fixed arc given
    by $\( u \, v \) = \( y \, 0 \)$. The return consequently has the form
  #[#set math.equation(numbering: n => "(10.13)")
   $ R \( u \, v \) = #scale(x: 120%, y: 120%)[\(] u + sigma \( u \) v + O \( v^2 \) \, med v + tau \( u \) v^2 +
     O \( v^3 \) #scale(x: 120%, y: 120%)[\)] . $ <odd:return-expansion>]
  In a lower part of this neighborhood the original joint data are known. For
  $ Z \( y \, t \) = #scale(x: 120%, y: 120%)[\(] frak(s) \( y \, t \) \,
    frak(s) \( y + t \, t \) #scale(x: 120%, y: 120%)[\)] \, wide b = N \( t - t_0 \) \, $
  the reflection identities give $R \( Z \( y \, t \) \) = Z \( y + b \, t \)$.
    Expanding there in the coordinates just chosen, write
  $ u = y + O \( b \) \, wide v = b p_0 \( y \) + O \( b^2 \) . $
  The first component of the return identity at order $b$, and its second component at order $b^2$, give respectively
  #[#set math.equation(numbering: n => "(10.14)")
   $ sigma p_0 = 1 \, wide p'_0 = tau p_0^2 \, wide sigma' = - tau . $ <odd:return-compatibility>]
  These identities continue along the extended arc. By moving the boundary point slightly within this arc if
    necessary, take a smaller neighborhood where $sigma eq.not 0$, and set $p_0 = 1 \/ sigma$.
  For small nonzero $b$ with $\| Im b \| gt.eq \| b \| \/ 3$,
    the return and its inverse continue the joint states upwards in steps $plus.minus b$.
    Here are the relevant uniform estimates. In the coordinates $\( u \, p \) = \( u \, v \/ b \)$, (10.13) reads
  $ \( u \, p \) mapsto \( u \, p \) + b #scale(x: 120%, y: 120%)[\(] sigma \( u \) p \,
    tau \( u \) p^2 #scale(x: 120%, y: 120%)[\)] + O \( b^2 \) $
  on fixed compact subsets; the inverse has the negative first increment.
    The analytic differential equation with that vector field has the regular solution
    $\( u \, p \) = \( y \, p_0 \( y \) \)$, by (10.14). Choose the arc neighborhood and the height to be crossed
    sufficiently small. The steepness condition keeps all the slanted paths from the lower starting slab inside
    that neighborhood. There are $O \( 1 \/ \| b \| \)$ steps;
    each has error $O \( \| b \|^2 \)$ and stability factor at most $1 + C \| b \|$.
    The continued states therefore stay within $O \( \| b \| \)$ of this regular solution.
    All shape coordinates remain strictly inside the shape strip.
  All intermediate site coordinates are recovered by the regular analytic billiard steps along the orbit.
    Thus their continuations agree with the original $s_j$’s wherever the latter were already defined.
  Use locally constant numbers of backward steps to place initial states in the lower slab.
    On overlaps, the exact return identity in that slab and uniqueness of each forward step identify the
    constructions. They give joint holomorphic germs in the steep sectors,
    attached by vertical continuation to the lower data.
  Finally choose a small $eta > 0$, then a much smaller $r > 0$, and use the analytic disks
  #[#set math.equation(numbering: n => "(10.15)")
   $ t = t_0 + r zeta \, wide y = x_(*) + upright(i) 𝜍 - upright(i) eta zeta^2 + w \, wide \| zeta \| lt.eq 1 \,
     $ <odd:contact-disks>]
  as $𝜍$ rises from $h - 2 eta$ to $h$; $w$ varies in a sufficiently small complex disk.
    On the boundary arcs where $zeta$ is near the real axis, the phase point is a fixed amount below the wall.
    For small $r$, these arcs lie in the original joint tube, by lower semicontinuity of the width.
    On the remaining arcs the parameter is in a fixed steep sector, so the preceding continuation applies.
    The collar germs agree because both are vertical continuations of the lower data.
    The full disks are initially inside known data. Holomorphic product continuation, as in 21,
    fills them as the center is raised. Equivalently, pull the germs back to a collar of the unit circle and a
    complex neighborhood of the center path: the negative Cauchy moments vanish in the initial open part and hence
    throughout that connected neighborhood. More explicitly, combine $x_(*) + upright(i) 𝜍 +
    w$ into one complex center variable $a$. The map $\( a \, zeta \)
    mapsto \( a - upright(i) eta zeta^2 \, t_0 + r zeta \)$ has Jacobian determinant $r eq.not 0$,
    so the filling supplies a joint neighborhood in $\( y \, t \)$.
  The maximum principle preserves $\| Im s_j \| < H$ on the filled disks.
    Composition with $Gamma$ gives a joint meromorphic patch for $X$ at $\( x_(*) + upright(i) h \, t_0 \)$,
    agreeing with the original tube below the wall. This contradicts 24,
    which applies also to the rational parameter $t_0$. The lower boundary is treated in the same way,
    or by real symmetry. The supposed positive-measure set therefore cannot exist. ◻
]

=== 10.3 Brownian motion, history levels, and fixed stopping rules <brownian-motion-history-levels-and-fixed-stopping-rules>

We use the standard conformal time-change, optional-stopping, and martingale maximal theorems for Brownian motion;
  see #cite(label("RevuzYor1999")) Chapters II, IV and V. Their applications, including the stopping cuts,
  are specified below. Let $y_u$ be planar Brownian motion, started with $y_0$ uniform on one real period,
  and let $zeta$ be its first exit from $\| Im y \| < h$. All functions are evaluated on the real lift of this path. Put

#[#set math.equation(numbering: n => "(10.16)")
 $ delta_j \( u \) & = H - \| Im s_j \( y_u \) \| \, & k_j \( u \) & = - log delta_j \( u \) \, & K_j \( u \) & =
   max_(0 lt.eq v lt.eq u) k_j \( v \) \,\
r_y \( u \) & = h - \| Im y_u \| \, & n_y \( u \) & = - log r_y \( u \) \, & tau_L & = inf { u :
  max_j K_j \( u \) = L } . $ <odd:stopping-data>]

For sufficiently large $L$, $tau_L < zeta$ almost surely.
  Indeed the bounded functions $e^(upright(i) s_j)$ are Poisson integrals of their almost everywhere boundary
  values. This follows first on narrower strips and then on the whole strip by dominated convergence.
  Along Brownian motion they are the conditional-expectation martingales of their terminal boundary values.
  Announcing the exit by exits from narrower strips shows that their limits at Brownian exit are those terminal
  values. The exit distribution is absolutely continuous on the horizontal boundary,
  so 74 makes at least one $delta_j$ tend to zero. Continuity then gives every sufficiently large history level
  before exit.

The isolated zeros and poles of the meromorphic slice functions are polar for planar Brownian motion and are
  almost surely avoided. All statements involving them can first be stopped on compact subsets avoiding these
  points, followed by an exhaustion. In what follows, “with probability tending to one through $tau_L$” means that
  one event of probability $1 - o \( 1 \)$ supports the stated bounds simultaneously at every time $0 lt.eq
  u lt.eq tau_L$ and at every site.

#thm([Lemma 10.4.])[
  (Shape time change and its consequences).  #emph[Each process $s_j \( y_u \)$, before phase exit,
    is a Brownian motion in the shape strip under the scalar time change
$ Q_j \( u \) = integral_0^u \| s'_j \( y_v \) \|^2 thin thin upright(d) v \, $

 possibly stopped before shape exit. Its initial horizontal law has a density bounded by a fixed constant relative
   to uniform measure modulo $2 pi$. In particular:]
  + #emph[The expected occupation of any nonnegative periodic shape observable,
    integrated against $thin upright(d) Q_j$, is bounded by a fixed constant times its ordinary shape-strip
    occupation from a uniform real start. The total shape clocks have bounded expectation. Moreover,
#[#set math.equation(numbering: n => "(10.17)")
 $ bb(E) integral_0^(tau_L) upright(bold(1))_({ k_j \( u \) lt.eq K }) \| f_j \( y_u \) s'_j \( y_u \) \|^2 thin
   thin upright(d) u lt.eq C \( 1 + K \)^(2 rho) $ <odd:angle-clock>]

 for large $K$.]
  + #emph[At the first hit of a deterministic shape-depth row,
    the subprobability law of the hit is dominated by a fixed constant times the corresponding law for ordinary
    shape Brownian motion from a uniform real start. In particular that ordinary horizontal law is uniform.]
  + #emph[After a first hit of shape depth $delta$, the remaining shape clock before any later phase stop has tail
    at most
#[#set math.equation(numbering: n => "(10.18)")
 $ C min (1 \, delta / sqrt(T)) $ <odd:remaining-shape-clock>]

 at clock time $T > 0$. This estimate also holds conditionally at that hit whenever it occurs.]
  + #emph[For a sufficiently large fixed $C$, with probability tending to one through $tau_L$,
#[#set math.equation(numbering: n => "(10.19)")
 $ k_j \( u \) gt.eq K_j \( u \) - C log L wide upright("for every ") j . $ <odd:retreat>]

]
] <odd:time-change>

#proof[
  The real and imaginary parts of a holomorphic function of planar Brownian motion are local martingales.
    The Cauchy–Riemann equations give equal quadratic variations $thin upright(d)
    Q_j$ and zero mutual quadratic covariation. The Brownian time-change theorem therefore applies.
    To use it up to a given interior phase stop, append independent Brownian increments in intrinsic time after
    that stop. The extension cannot have exited the shape strip before the part of the path already used,
    because all those states lie in the strip. Approximation by compact interior stops proves the same domination
    for nonnegative occupations over the whole phase interval.
  On the real collar $y mapsto s_j \( y \)$ is an increasing analytic circle diffeomorphism whose derivative is
    bounded above and below. This proves the initial-density assertion.
    Under a uniform real start, the periodic shape-strip Green weight is a constant times $delta =
    H - \| Im s \|$. It has finite integral, proving the total-clock claim.
    At either wall, the contribution of $\| f \|^2$ up to log depth $K$ is bounded by a constant times
  $ integral_(e^(- K))^(delta_(*)) delta thin bb(E) \| f \|^2 thin thin upright(d) delta =
    integral_(k_(*))^K delta^2 bb(E) \| f \|^2 thin thin upright(d) k =
    integral_(k_(*))^K mu_f \( k \)^2 thin thin upright(d) k . $
  The fixed interior region has bounded contribution. Now use (10.1).
    Domination of first-hit laws follows from the same Brownian extension;
    if the original path never reaches the row, it contributes no mass.
  Starting at distance $delta$ from one horizontal wall, the exit time from the strip is no greater than the first
    time the vertical Brownian coordinate hits that particular wall.
    The one-dimensional reflection principle bounds survival to time $T$ by $C min \( 1 \, delta \/ sqrt(T) \)$.
    Applying this after the hit, with the strong Markov property in intrinsic time, proves (iii).
  For (iv), at the first hit of each integer level $m$, the probability of reaching depth $R
    e^(- m)$ before hitting the adjacent wall is at most $1 \/ R$,
    by the linear one-dimensional hitting probability. Take $R$ a sufficiently large fixed power of $L$,
    and sum over the $O \( L \)$ integer levels up to $L$, and the fixed number of sites.
    If a retreat larger than $C log L$ occurred, it would contain one of these integer-level retreats,
    with an immaterial factor from rounding. The union probability tends to zero. ◻
]

We record explicitly the two localization principles used below.

#thm([Lemma 10.5.])[
  (Logarithmic deficit at a stopping cut).  #emph[Let $g$ be a nontrivial meromorphic slice function,
    with $log \| g \( y_0 \) \| gt.eq - C_0$ on the real starting row.
    Suppose $log \| g \( y_u \) \| lt.eq B_0$, where $B_0 gt.eq 1$, up to a specified stopping cut $T$. Then
#[#set math.equation(numbering: n => "(10.20)")
 $ bb(P) {inf_(u lt.eq T) log \| g \( y_u \) \| < - B_1} lt.eq frac(B_0 + C_0, B_0 + B_1) lt.eq
   frac(C \( 1 + B_0 \), 1 + B_1) $ <odd:log-deficit-probability>]

 for $B_1 gt.eq 1$. Earlier bounds may be incorporated by stopping at their first failure;
   their failure probabilities are then added separately.]
] <odd:log-deficit>

#proof[
  Away from the polar zero and pole set, $log \| g \( y_u \) \|$ is a continuous local martingale.
    Before the indicated cut, $B_0 - log \| g \( y_u \) \|$ is nonnegative,
    hence is a supermartingale after localization. Stop additionally at its first hit of $B_0 + B_1$.
    The supermartingale inequality gives the first bound. Exhaustion removes the auxiliary compact localizations. ◻
]

For an analytic differential integrated after a stopping time,
  we shall likewise apply the maximal inequality only after a quadratic-time cut.
  More precisely, if its scalar quadratic time is at most a deterministic $B$ on some collection of paths,
  stop the integral at quadratic time $2 B$ before estimating its maximum.
  The resulting second-moment bound is $O \( B \)$. It applies to the original integral on those paths,
  without conditioning on the collection of paths. This remains true when the integrand is masked by adapted
  status indicators, using their predictable versions. All ensuing probability estimates use these cuts.

Put

#[#set math.equation(numbering: n => "(10.21)")
 $ a_j = log \| f_j \| \, wide cal(G) \( u \) =
   max_j (\| psi_j \| + log \( 1 + \| X_j \| \) + \| log \| sin d_j^0 \| \| + \| log \| ell_j \| \|) \( y_u \) .
   $ <odd:geometry-size>]

By 55, everywhere before the relevant history stop,

#[#set math.equation(numbering: n => "(10.22)")
 $ a_j lt.eq k_j^(+) + C log \( 2 + k_j^(+) \) + C \, wide k_j^(+) = max \( k_j \, 0 \) . $ <odd:amplitude-upper>]

#thm([Lemma 10.6.])[
  (A finite family of modified inverse estimates).  #emph[Let $V gt.eq U gt.eq 1$ be deterministic.
    For each fixed proper truthful set $I$ and flat set $F subset.eq I^c$, stop at $tau_L$,
    at the first failure of $cal(G) lt.eq U$, or at the first time an $I$-history exceeds $U$,
    whichever comes first. Except on an event of probability at most
#[#set math.equation(numbering: n => "(10.23)")
 $ frac(C \( 1 + U \), 1 + V) \, $ <odd:inverse-failure>]

 the bound
#[#set math.equation(numbering: n => "(10.24)")
 $ parallel B_(I \, F)^(- 1) parallel lt.eq exp \( C V \) $ <odd:inverse-bound>]

 holds throughout this stopped interval. The constant is uniform over the finitely many choices of $I \, F$.
   Thus one may secure all these bounds by a finite union, and subsequently choose $I \,
   F$ as functions of the current state before the common geometry cut, whenever their selected history caps hold.]
] <odd:modified-inverses>

#proof[
  On the stopped interval, (10.22) bounds $a_i$ by $C \( 1 + U \)$ for $i in I$.
    The geometry cap bounds the reciprocal lengths, the reciprocal incidence sines, and the angles.
    Hence every entry, determinant, and cofactor of $B_(I \, F)$ has modulus at most $exp \( C \( 1 + U \) \)$.
    There is no amplitude bound required at flat or deleted sites: their curvature terms do not appear.
    By 72, the determinant has a positive minimum in modulus on the compact real starting period.
    Apply 76 to that determinant with upper bound $C \( 1 + U \)$ and lower-log threshold $- V$.
    The adjugate formula gives (10.24) outside the resulting exceptional event. Empty matrices require no estimate.
  There are at most $3^N$ choices. Each matrix is defined and estimated from the original real start,
    with its own fixed stopping rule. If at a later time all the histories selected by that matrix are at most
    $U$, none of them has crossed its cap previously. Thus the estimate already secured for that fixed candidate
    is still valid as long as the common geometry cut has not occurred.
    This is the reason for using history levels rather than current depths.
    No estimate is restarted when the current selection changes. ◻
]

=== 10.4 An initial bound below linear order <an-initial-bound-below-linear-order>

#thm([Lemma 10.7.])[
  (Initial stopped geometry).  #emph[There is a fixed $sigma < 1$ such that
$ cal(G) \( u \) lt.eq L^sigma wide \( 0 lt.eq u lt.eq tau_L \) $

 with probability tending to one as $L arrow.r oo$.]
] <odd:initial-geometry>

#proof[
  The angle differential is $thin upright(d) psi_j = f_j thin thin upright(d) s_j$.
    Up to $tau_L$ all current log depths are at most $L$, so (10.17) and the maximal inequality bound all angles
    by $L^(rho + epsilon)$ with probability tending to one, for each fixed $epsilon > 0$.
    The linear equations (10.3) give the same bound for $theta_j \, d_j^0$.
    They imply an upper bound of this order for $log \| sin d_j^0 \|$.
    The sine has a positive minimum on the real starting collar.
    Applying 76 with a slightly larger power gives, for some fixed $rho < rho' < 1$,
    simultaneous angle and sine cost at most
  $ r_(*) = L^(rho') . $
  We stop at the first failure of these bounds for the estimates that follow,
    and add the already vanishing failure probability at the end.
  Choose
  $ G = L^gamma \, wide frac(1 + rho', 2) < gamma < 1 \, $
  and a small fixed $b > 0$. At each site use two statuses, initially moderate.
    Switch from moderate to tiny at a downcrossing of $a_j = - 2 b G$,
    and switch back at an upcrossing of $a_j = - b G$. The hysteresis gap is $b G$.
    By (10.22), $C L - a_j$ is a nonnegative local martingale, hence a supermartingale,
    up to $tau_L$ and the preceding cuts. Its upcrossing levels are $C L + b G$ and $C L + 2 b G$.
    The upcrossing inequality, and alternation of the two switch directions,
    give an expected number of switches $O \( L \/ G \)$. One can also obtain this bound by holding
    supermartingale increments during attempted passages between the two levels:
    each completed passage earns $b G$, while an unfinished passage has possible loss bounded by $C L + 2 b G$.
    Thus, for any sufficiently small fixed $epsilon_1 > 0$, the total number of switches over the fixed number of
    sites is at most
  #[#set math.equation(numbering: n => "(10.25)")
   $ L^(1 + epsilon_1) \/ G $ <odd:switch-count>]
  with probability tending to one.
  Let
  $ cal(R) \( u \) = 1 + sup_(0 lt.eq v lt.eq u \, thin j) \| X_j \( y_v \) \| . $
  During a moderate interval, $a_j gt.eq - 2 b G$. From (10.5),
    the coefficient of $thin upright(d) s_j$ in $thin upright(d) X_j$ has modulus at most $e^(5 b G)$,
    for large $L$, because $r_(*) = o \( G \)$. During a tiny interval, $a_j lt.eq - b G$,
    and the coefficient of $thin upright(d) s_j$ in $cal(R)^(- 1) thin upright(d)
    H_j^0$ has modulus at most $e^(- b G \/ 2)$. The latter estimate uses
  $ cal(R)^(- 1) \| X_j dot.op e_(psi_j) \| thin \| f_j \| lt.eq exp \( C r_(*) - b G \) . $
  Mask these two differentials by their corresponding status indicators.
    The total expected shape clocks are bounded by 75. The maximal inequality, with the cuts described above,
    shows that the cumulative moderate-position integrals and tiny-support integrals have respective suprema at most
  #[#set math.equation(numbering: n => "(10.26)")
   $ e^(6 b G) \, wide e^(- b G \/ 3) $ <odd:masked-integrals>]
  with probability tending to one.
  On a tiny interval, write $thin upright(d) H_j^0 = cal(R) thin thin upright(d) M_j$,
    where the appropriate masked martingale $M_j$ is bounded as in (10.26).
    Integration by parts against the continuous increasing function $cal(R)$ bounds the support increment on any
    such interval by $C e^(- b G \/ 3) cal(R)$ at its endpoint.
    For example, after subtracting the starting value of $M_j$,
    both the endpoint term and the integral against $thin upright(d) cal(R)$ are bounded by that quantity.
  Between successive switches of the joint status vector, a moderate site’s position differs from its starting
    position by at most $2 e^(6 b G)$, and a tiny site’s support has the preceding increment bound.
    If $cal(R)_(upright("start"))$ is the running maximum at the start of such an interval,
    every support during it is therefore at most
  #[#set math.equation(numbering: n => "(10.27)")
   $ e^(C r_(*)) #scale(x: 120%, y: 120%)[\(] cal(R)_(upright("start")) +
     C e^(6 b G) #scale(x: 120%, y: 120%)[\)] + C e^(- b G \/ 3) cal(R) . $ <odd:support-interval-bound>]
  Use (10.6) and absorb the last term; its coefficient after reconstruction tends to zero because $r_(*) =
    o \( G \)$. Each interval then multiplies the maximum of its starting bound and $C
    e^(6 b G)$ by at most $e^(C r_(*))$. By (10.25), its accumulated logarithmic cost is at most
  $ C r_(*) L^(1 + epsilon_1) \/ G = o \( G \) \, $
  provided $epsilon_1$ is small enough that $2 gamma > 1 + rho' + epsilon_1$.
    Hence $log cal(R) lt.eq C G$ with probability tending to one.
  The identity $ell_j = \( X_(j + 1) - X_j \) dot.op e_(theta_j)$ now gives upper logarithmic length bounds of the
    same order. Apply 76 to each nonzero length, allowing a further small increase of the exponent,
    to obtain lower logarithmic bounds. Choose a fixed $sigma$ strictly between all these exponents and $1$.
    Constants are then absorbed by $L^sigma$ for large $L$, proving the claim.
    Each previous good bound was enforced by its first-failure cut;
    only the sum of their vanishing exceptional probabilities has been added. ◻
]

#thm([Lemma 10.8.])[
  (Phase depth and phase clock).  #emph[For some fixed $C$, with probability tending to one through $tau_L$,
#[#set math.equation(numbering: n => "(10.28)")
 $ n_y \( u \) lt.eq C L \, wide integral_0^(tau_L) r_y \( u \)^(- 2) thin thin upright(d) u lt.eq
   L^C . $ <odd:phase-clock-bounds>]

]
] <odd:phase-clock>

#proof[
  Apply 78 through $tau_(2 L)$. The entries of $cal(H)$ have upper logarithmic size $O \( L \)$, by (10.22);
    the incidence sines and lengths have only sublinear logarithmic cost.
    The cofactor formula (10.11) consequently gives
  #[#set math.equation(numbering: n => "(10.29)")
   $ \| w_j \| + \| s'_j \| lt.eq e^(C_1 L) $ <odd:rough-derivative-bound>]
  through that stop on the good paths. The second bound follows from (10.8), using the amplitude upper bound again.
  Let $T$ be the first phase depth $r_y = e^(- C_2 L)$, with $C_2$ fixed and sufficiently large.
    By the one-dimensional hitting estimate, after $T$ the remaining phase time is at most $e^(- C_2 L)$,
    except with probability at most $C e^(- C_2 L \/ 2)$. Suppose $T < tau_L$.
    At time $T$, all shape depths are at least $e^(- L)$, whereas at $tau_(2 L)$ one of them is $e^(- 2 L)$.
    On the good derivative paths, the quadratic time of each shape increment from $T$ to $tau_(2 L)$ is bounded by
    $e^(2 C_1 L - C_2 L)$. Enforce this by the derivative cut and by a physical time cut of $e^(- C_2 L)$ after
    $T$. The maximal inequality then shows that, for sufficiently large $C_2$,
    all these increments are $o \( e^(- L) \)$ with probability tending to one.
    This contradicts the required change of one imaginary part by at least $e^(- L) - e^(- 2 L)$.
    Thus $T < tau_L$ has probability tending to zero, which proves the first bound.
  Under the uniform real start, the phase-strip Green weight at a wall is proportional to $r_y$. Therefore
  $ bb(E) integral_0^zeta upright(bold(1))_({ r_y gt.eq e^(- C_2 L) }) r_y^(- 2) thin thin upright(d) u lt.eq
    C \( 1 + L \) . $
  On the already established good depth event, the integral through $tau_L$ is part of this truncated occupation.
    Markov’s inequality, for example at threshold $L^2$, gives a polynomial bound with probability tending to one.
    Increasing the single constant $C$ if necessary yields (10.28). ◻
]

=== 10.5 Improvement to every positive power <improvement-to-every-positive-power>

#thm([Theorem 10.9.])[
  (Stopped geometry at every power).  #emph[For every fixed $sigma > 0$,
    with probability tending to one as $L arrow.r oo$,
#[#set math.equation(numbering: n => "(10.30)")
 $ cal(G) \( u \) lt.eq L^sigma wide \( 0 lt.eq u lt.eq tau_L \) . $ <odd:all-power-geometry>]

 The phase-depth and phase-clock bounds of 79 hold simultaneously. All estimates concern the same fixed odd slice.]
] <thm:stopped-geometry>

#proof[
  It suffices to improve an exponent $0 < sigma < 1$ already known to work.
    Choose a small fixed $epsilon > 0$ with $sigma + epsilon < 1$, and put
  $ H_0 = L^(sigma + epsilon) . $
  The old estimate, applied at level $H_0$, gives geometry at most $H_0^sigma$ through $tau_(H_0)$,
    with probability tending to one. We shall show that, after this time,
    angles and supports change by amounts exponentially smaller than this improved initial scale.
  Choose a sufficiently small fixed $eta > 0$, and a finite family of disjoint intervals
    $\( xi_m \, xi_m + eta \)$ inside $\( sigma + epsilon \/ 3 \, sigma + epsilon \)$, with more than $N$ members.
    At every time after $tau_(H_0)$, at least one history is $gt.eq H_0$.
    There is one choice $xi = xi_m$ for which the corresponding power interval $\( L^xi \, L^(xi + eta) \)$
    contains none of the $N$ history levels. For that choice, partition the sites as
  $ I = { j : K_j lt.eq L^xi } \, wide I^c = { j : K_j gt.eq H_(*) } \, wide H_(*) = L^(xi + eta) . $
  Endpoint equalities can be assigned to their respective sets; they do not affect any estimate.
    The set $I$ is proper because one history is $gt.eq H_0$.
    By (10.19), every deep site’s current log depth satisfies $k_j gt.eq H_(*) \/ 2$,
    on an event of probability tending to one.
  We secure all matrix inverses before making any state-dependent selection.
    For each fixed $xi_m$, proper set $I$, and flat subset $F subset.eq I^c$, use 77 with, for instance,
  $ U = L^(xi_m + eta \/ 4) \, wide V = L^(xi_m + eta \/ 2) . $
  The old geometry cap $L^sigma$ and the selected truthful history cap $L^(xi_m)$ both lie below $U$ for large
    $L$. The failure probability is $O \( L^(- eta \/ 4) \)$ for each candidate.
    The number of candidates is fixed, so outside one event of probability tending to zero,
    all required inverses have norm
  #[#set math.equation(numbering: n => "(10.31)")
   $ parallel B_(I \, F)^(- 1) parallel lt.eq exp #scale(x: 120%, y: 120%)[\(] C L^(xi + eta \/ 2)
     #scale(x: 120%, y: 120%)[\)] = exp \( o \( H_(*) \) \) . $ <odd:gap-inverse>]
  These bounds hold whenever the corresponding histories are below their caps,
    regardless of how often the empty gap and the flat subset change.
  Set
  $ z_j = r_y w_j . $
  Schwarz–Pick, transported from the disk by conformal maps of the two strips, gives $r_y \| s'_j \| lt.eq
    C delta_j$ #cite(label("Garnett2007")) Chapter I, Lemma 1.2;
    the strip hyperbolic densities are comparable with reciprocal boundary distance.
    Hence (10.8) and the old geometry bound imply
  #[#set math.equation(numbering: n => "(10.32)")
   $ log \| z_j \| + 2 a_j + k_j lt.eq C L^sigma \, $ <odd:Schwarz-suppression>]
  with the usual interpretation when $z_j = 0$. Fix a sufficiently small positive constant $c_1$.
    Among the deep sites retain as flat exactly those for which
  $ \| z_j \| > e^(- c_1 H_(*)) \; $
  call this set $F$, and delete the other deep sites. At a retained deep site, (10.32) and $k_j gt.eq
    H_(*) \/ 2$ imply $a_j < - c_2 H_(*)$ for a fixed $c_2 > 0$, since $L^sigma = o \( H_(*) \)$.
    Consequently its actual curvature term obeys
  $ \| cal(V)_j \| lt.eq e^(- c_3 H_(*)) $
  for another fixed positive constant. Every deleted coordinate already has modulus at most $e^(- c_1 H_(*))$.
  Apply the equation $\( M_0 - cal(V) \) z = 0$ to the retained coordinates $I union F$.
    Its left matrix is $B_(I \, F)$ minus the tiny curvature diagonal on $F$;
    its right side is the coupling to the deleted coordinates. Entries of $M_0$ cost at most $e^(C L^sigma)$.
    By (10.31), the tiny diagonal is absorbable, and the right side gives
  #[#set math.equation(numbering: n => "(10.33)")
   $ max_j \| z_j \| lt.eq e^(- c_4 H_(*)) $ <odd:all-sites-suppressed>]
  for a fixed $c_4 > 0$, uniformly over all the finite choices.
    The same argument includes an empty deleted set, in which case the retained homogeneous system has only the
    zero solution.
  The important consequence is suppression at #emph[every] site, including the shallow ones. From (10.9),
  #[#set math.equation(numbering: n => "(10.34)")
   $ 2 r_y partial_y psi_j = cal(V)_j z_j = \( M_0 z \)_j . $ <odd:all-angle-suppression>]
  Since $H_(*) gt.eq L^(sigma + epsilon \/ 3)$, the right side has modulus at most
    $exp \( - c L^(sigma + epsilon \/ 3) \)$, with a fixed $c > 0$, after decreasing that constant if necessary.
    The phase-clock bound now makes the quadratic time of each angle increment after $tau_(H_0)$ exponentially
    small. Cut at that deterministic quadratic-time bound and apply the maximal inequality.
    We obtain, with probability tending to one,
  #[#set math.equation(numbering: n => "(10.35)")
   $ sup_(tau_(H_0) lt.eq u lt.eq tau_L) \| psi_j \( y_u \) - psi_j \( y_(tau_(H_0)) \) \| lt.eq
     exp \( - c' L^(sigma + epsilon \/ 3) \) . $ <odd:late-angle-increments>]
  All choices of history gaps and flat sets have disappeared from this martingale statement:
    they were used only to prove the uniform pointwise differential bound on the fixed good event.
  The angles at $tau_(H_0)$ have size at most $H_0^sigma$. Their incidence sines have modulus at least
    $e^(- H_0^sigma)$. The absolute change of each sine is at most the angle change times $exp \( C L^sigma \)$,
    using the old angle bound along the interval. By (10.35),
    this is negligible relative to its improved initial lower bound.
    Thus the angles and both logarithmic sine bounds keep cost $O \( H_0^sigma \)$ throughout the late interval.
  The supports obey the same improvement. By (10.5),
  $ cal(R)^(- 1) thin upright(d) H_j^0 = cal(R)^(- 1) \( X_j dot.op e_(psi_j) \) thin thin upright(d) psi_j . $
  Its coefficient relative to the angle differential has modulus at most $e^(C L^sigma)$ by the old bound.
    Combining (10.34) with the phase clock shows that the martingale integral of this differential over the single
    late interval has exponentially small supremum. Integration by parts against the increasing $cal(R)$,
    as in the initial geometry argument, gives
  $ \| H_j^0 \( y_u \) - H_j^0 \( y_(tau_(H_0)) \) \| lt.eq e^(- c'' L^(sigma + epsilon \/ 3)) cal(R) \( u \) $
  on a further event of probability tending to one. Reconstruct positions with (10.6),
    now using the improved angle and sine cost $O \( H_0^sigma \)$.
    The initial positions and supports have this same logarithmic cost.
    The coefficient of $cal(R) \( u \)$ in the last display remains exponentially small after reconstruction and
    is absorbed. It follows that
  $ log cal(R) \( u \) lt.eq C H_0^sigma = C L^(sigma \( sigma + epsilon \)) wide \( u lt.eq tau_L \) $
  with probability tending to one.
  The length upper logs have the same improved bound. For their lower logs,
    cut at the first failure of this upper bound. Choose $epsilon$ small enough that
  $ sigma \( sigma + epsilon \) < frac(sigma + sigma^2, 2) < sigma . $
  Choose a power strictly between the first two quantities as the lower threshold in 76;
    its failure probability tends to zero. All fixed constants and all needed lower-log slack are then absorbed by
    the new exponent $\( sigma + sigma^2 \) \/ 2$. This proves an improvement of the old assertion.
  Starting with 78, iterate this improvement a finite number of times.
    The sequence generated by $sigma mapsto \( sigma + sigma^2 \) \/ 2$, starting below one, decreases to zero.
    Given any desired positive exponent, choose the number of iterations in advance, independently of $L$.
    There are then only finitely many exceptional events to discard, each with probability tending to zero.
    This proves (10.30); 79 supplies the simultaneous phase estimates. ◻
]

== 11 Sign tests and the last moving site <sign:section>

We finish the exclusion of a finite critical wall. 71 supplies both the angle budget and the polynomial bounds
  of 55. In particular, with $d_k = e^(- k)$ and horizontal means normalized to have mass one,

#[#set math.equation(numbering: n => "(11.1)")
 $ mu \( k \) lt.eq C \( 1 + k \) \, wide d_k sup_x #scale(x: 120%, y: 120%)[\(] \| f \| +
   sqrt(\| q \|) #scale(x: 120%, y: 120%)[\)] \( x + upright(i) \( H - d_k \) \) lt.eq
   C \( 1 + k \)^2 . $ <sign:polynomial-input>]

Real symmetry gives the same estimates at the lower wall.
  All constants below may depend on the fixed billiard and on fixed tile enlargements.
  They never depend on the large parameters $K$ and $L$.

Fix throughout

#[#set math.equation(numbering: n => "(11.2)")
 $ alpha = 1 / 100 . $ <sign:alpha>]

The purpose of the first part of the section is to find a deterministic shape row on which almost every point has
  either very small or very large $\| f \|$. Both alternatives suppress the motion of that site in the odd Jacobi
  system, but by different identities. The final argument applies this suppression to the last site to cross the
  tested row.

=== 11.1 A discrete occupation estimate <a-discrete-occupation-estimate>

We first isolate the probabilistic estimate needed when the row moments are small.
  It does not require a bound on the starting value of the submartingale.

#thm([Lemma 11.1.])[
  (Discrete Tanaka estimate).  #emph[Let $\( X_m \)_(0 lt.eq m lt.eq M)$ be an integrable real submartingale,
    and suppose
$ V = sum_(m = 0)^(M - 1) bb(E) \( X_(m + 1) - X_m \)^2 < oo . $

 For $0 < h < R$, put
$ cal(C)_h =
  sum_(m = 0)^(M - 1) bb(E) [upright(bold(1))_({ \| X_m \| lt.eq h }) min { \( X_(m + 1) - X_m \)^2 \, h^2 }] . $

 There is an absolute constant $C$ such that
#[#set math.equation(numbering: n => "(11.3)")
 $ cal(C)_h lt.eq C h \( h + R + sqrt(V) \) + C M h^2 min {1 \, frac(V, \( R - h \)^2)} . $ <sign:tanaka-bound>]

]
] <lem:discrete-tanaka>

#proof[
  Use the increasing convex function
  $ Phi \( x \) = sqrt(h^2 + x^2) + x . $
  Its derivative is between $0$ and $2$, it is nonnegative, and $Phi \( x \) lt.eq h + 2 x^(+)$.
    Moreover, $Phi'' \( x \) gt.eq c \/ h$ on $\[ - 2 h \, 2 h \]$.
    Integrating this second derivative along the first $min { \| y - x \| \, h }$ of the segment from $x$ to $y$ proves
  #[#set math.equation(numbering: n => "(11.4)")
   $ Phi \( y \) - Phi \( x \) - Phi' \( x \) \( y - x \) gt.eq c /
     h upright(bold(1))_({ \| x \| lt.eq h }) min { \( y - x \)^2 \, h^2 } . $ <sign:ramp-remainder>]
  This includes a displacement that leaves $\[ - 2 h \, 2 h \]$, because the remaining convex remainder is nonnegative.
  Let $T$ be the first index at which $X_m > R$, capped at $M$. If $X_0 > R$, set $T = 0$.
    Sum (11.4) only on $m < T$. Conditional expectation removes the linear term with the correct sign,
    since $Phi' gt.eq 0$ and the conditional drift is nonnegative.
    The resulting sum is at most $C h bb(E) \[ Phi \( X_T \) - Phi \( X_0 \) \]$.
    Paths starting above $R$ contribute zero. On the others the terminal positive part is at most
  $ R + max_(m < M) \| X_(m + 1) - X_m \| \, $
  including the crossing increment. Cauchy–Schwarz therefore bounds the pre-$T$ cost by $C h \( h + R + sqrt(V) \)$.
  Write
  $ b_m = bb(E) \[ X_(m + 1) - X_m divides cal(F)_m \] gt.eq 0 \, wide Z_n =
    sum_(m < n) upright(bold(1))_({ T lt.eq m }) \( X_(m + 1) - X_m - b_m \) . $
  This is a square-integrable martingale starting at zero, with terminal second moment at most $V$.
    If a chain which starts above $R$, or crosses $R$, subsequently returns to $\[ - h \, h \]$,
    then $sup_n \| Z_n \| gt.eq R - h$; accumulated drift cannot assist this downward move.
    The martingale maximal inequality bounds the probability of any such return by $C min { 1 \,
    V \/ \( R - h \)^2 }$. After $T$, the entire cost is at most $M h^2$ on that event.
    Adding the two estimates proves (11.3). In particular, no conditional estimate given the crossing event has
    been used. ◻
]

=== 11.2 The large-moment alternative <the-large-moment-alternative>

#thm([Lemma 11.2.])[
  #emph[Suppose that, along a sequence $K arrow.r oo$, some $j in \[ 0.9 K \, 2.1 K \]$ satisfies $mu \( j \)
    gt.eq K^alpha$. There is a deterministic $k in \[ 0.8 K \, 2.2 K \]$ for which
#[#set math.equation(numbering: n => "(11.5)")
 $ frac(1, 2 pi)
   lr(|{x in \[ 0 \, 2 pi \] : lr(|log \| f \( x + upright(i) \( H - e^(- k) \) \) \||) lt.eq K^(alpha \/ 2)}|)
   arrow.r 0 . $ <sign:row-small-exception>]

]
] <sign:large-moment>

#proof[
  Choose a small fixed $c > 0$, with $c < 1 \/ 4$, and maximize $mu \( l \) e^(- c \| l - j \|)$ over $l gt.eq
    k_0$. The maximum exists by (11.1). A maximizer $k$ satisfies
  $ \| k - j \| = O \( log K \) \, wide B := mu \( k \) gt.eq K^alpha \, wide mu \( l \) lt.eq B e^(c \| l - k \|) . $
  For a uniform random center $x$, use the normalized profiles
  #[#set math.equation(numbering: n => "(11.6)")
   $ F_(K \, x) \( Z \) = d_k / B f \( x + upright(i) H + d_k Z \) \, wide Q_(K \, x) \( Z \) = d_k^2 /
     B^2 q \( x + upright(i) H + d_k Z \) . $ <sign:profile-normalization>]
  Their domains exhaust the lower half-plane. At a depth in the fixed upper collar, $0 < D lt.eq e^(k - k_0)$,
    the moment envelope gives
  #[#set math.equation(numbering: n => "(11.7)")
   $ bb(E) #scale(x: 120%, y: 120%)[\(] \| F_(K \, x) \( X - upright(i) D \) \|^2 + \|
     Q_(K \, x) \( X - upright(i) D \) \| #scale(x: 120%, y: 120%)[\)] lt.eq
     C D^(- 2) e^(2 c \| log D \|) . $ <sign:profile-moments>]
  The bound is uniform in the horizontal coordinate $X$. Submean estimates on fixed disks give tightness in the
    topology of locally uniform convergence. More explicitly, take a countable compact exhaustion,
    view the restrictions in the product of the corresponding continuous-function spaces,
    and put a zero placeholder on compact sets not yet contained in a domain.
    Tightness and diagonal extraction give consistent holomorphic limits.
    Uniformity of the original center makes each limiting law stationary under all real translations.
  The scaled equation is
  $ F''_(K \, x) = B^2 Q_(K \, x) F_(K \, x) . $
  Consequently each limit $\( F \, Q \)$ is pure: $F Q = 0$,
    so at least one of the two holomorphic functions vanishes identically.
    The limit law has no atom at $\( 0 \, 0 \)$. To check precisely the extra hypothesis needed for 52,
    choose $1 \/ 2 < eta < 1 - c$. In a fixed enlarged cone, subdivide the coarser depths $1 lt.eq D lt.eq
    delta_b \/ d_k$ into dyadic bands. The choice of $delta_b$ in 8 keeps even the fixed tile enlargements within
    $d_k D lt.eq e^(- k_0)$, the range of (11.7). Each band contains only a bounded number of tiles of size
    comparable to its depth. By (11.7) and submean, the second moments of
  $ D^eta #scale(x: 120%, y: 120%)[\(] \| F_(K \, x) \| + sqrt(\| Q_(K \, x) \|) #scale(x: 120%, y: 120%)[\)] $
  on these tiles have a summable bound $C D^(- 2 \( 1 - c - eta \))$.
    Thus the required cone bound has a tight random constant.
    Positive mass at the trivial pair would allow selection of centers converging to that pair while this constant
    stayed bounded: first discard a set of probability smaller than half the alleged atom,
    then use successively smaller compact neighborhoods of zero.
    The moment envelope has coarser exponent $c < 1 \/ 2$ and finer exponent $c > 0$, so this selection contradicts 52.
  There is one more degeneracy to exclude. With probability one,
    a nonzero limiting $Q$ is not real on the entire line $Im Z = - 1$.
    Otherwise condition on the event that it is real there and nonzero; this event is translation invariant.
    Schwarz reflection across that line extends $Q$ to an entire function.
    For each fixed $D gt.eq 1$, (11.7) holds for all sufficiently large $k$, so Fatou’s lemma gives
  $ bb(E) \| Q \( X - upright(i) D \) \| lt.eq C D^(- 2 \( 1 - c \)) . $
  Conditioning increases the constant only by the reciprocal probability of the event.
    Reflection supplies the same bound in the reflected half-plane.
    Every point is represented either at depth at least one or by its reflection at such a depth;
    hence the conditional mean modulus is bounded on the entire plane.
    Cauchy’s derivative estimate on circles of radius $R$, followed by expectation,
    gives $bb(E) \| Q' \( z \) \| lt.eq C \/ R$. Letting $R arrow.r oo$ makes $Q$ constant almost surely;
    the decay at large depth makes that constant zero. This contradicts the event on which we conditioned.
  We now examine any deterministic convergent sequence of profiles with one of the allowed limits.
    If $F equiv.not 0$, then, away from its discrete zeros on a fixed row segment,
  $ log \| f \( x + upright(i) H + d_k Z \) \| = k + log B + log \| F_(K \, x) \( Z \) \| . $
  The right side exceeds $K^(alpha \/ 2)$ uniformly on compact subsets away from those zeros.
    Arbitrarily small neighborhoods of the zeros therefore contain all the exceptional points in the limit.
  Suppose instead that $Q equiv.not 0$. Since its imaginary part on $Im Z = -
    1$ is a nonzero real-analytic function, its zeros on compact row intervals are discrete.
    Apart from arbitrarily small neighborhoods of these points,
    cover the row by finitely many short intervals with complex neighborhoods on which consistent branches $p_K =
    sqrt(Q_(K \, x))$ satisfy
  $ Re p_K gt.eq c_1 > 0 $
  and have uniformly bounded derivatives. In the scaled variable the original function $g \( Z \) =
    f \( x + upright(i) H + d_k Z \)$ satisfies $g'' = B^2 Q_(K \, x) g$. A basis on each such interval has the form
  #[#set math.equation(numbering: n => "(11.8)")
   $ g_plus.minus \( u \) = Q_(K \, x) \( u - upright(i) \)^(- 1 \/ 4) exp
     (plus.minus B integral_(u_0)^u p_K \( v - upright(i) \) thin thin upright(d) v) \( 1 + O \( B^(- 1) \) \) .
     $ <sign:wkb-basis>]
  Here and below the error is uniform on the chosen closed interval.
    For completeness, the expressions without the final factor solve the same equation with an added uniformly
    bounded potential; their Wronskian has modulus comparable to $B$.
    Variation of constants, from the left for the growing expression and from the right for the decaying
    expression, gives Volterra equations for the relative factors.
    After division by the leading expressions the nonconstant kernel contains a factor
  $ exp (- 2 B integral_v^u p_K \( r - upright(i) \) thin thin upright(d) r) \, wide v lt.eq u \, $
  whose modulus is at most $e^(- 2 B c_1 \( u - v \))$; the remaining kernel has size $O \( B^(- 1) \)$.
    Successive approximation, or the integral Gronwall inequality,
    therefore gives relative error $O \( B^(- 1) \)$. The two solutions are independent,
    since their modulus ratio changes by an exponential factor along the interval. This proves (11.8).
  Write $g = A_(+) g_(+) + A_(-) g_(-)$, with coefficients allowed to depend on $K$.
    If both coefficients are nonzero, the difference of the two leading logarithmic magnitudes has derivative at
    least $2 c_1 B - O \( 1 \)$. The set on which that difference has modulus at most $sqrt(B)$ has length
    $O \( B^(- 1 \/ 2) \)$. Outside it one term dominates the other by at least $e^(sqrt(B) + O \( 1 \))$.
    Each individual leading logarithmic magnitude is strictly monotone with slope of absolute value at least $c_1
    B - O \( 1 \)$, so it spends at most $O \( \( K^(alpha \/ 2) + 1 \) \/ B \) =
    o \( 1 \)$ length within $K^(alpha \/ 2) + 1$ of zero. The same conclusion holds when one coefficient
    vanishes. Thus the fraction violating (11.5) on every fixed scaled interval tends to zero.
  The countable product of continuous-function spaces used above is Polish.
    By the Skorokhod representation theorem #cite(label("Pollard2002")) Chapter 10, Theorem 4, p. 239,
    any weakly convergent subsequence of profile laws admits an almost-sure coupling.
    The deterministic criterion therefore applies almost surely.
    The local bad fraction is bounded by one, so its expectation tends to zero.
    Translation averaging identifies this expectation with the full-period bad fraction on the selected row.
    Every subsequence has the same conclusion, proving the lemma. ◻
]

=== 11.3 Amplitude control when the row moments are small <amplitude-control-when-the-row-moments-are-small>

Assume for the remainder of this subsection that

#[#set math.equation(numbering: n => "(11.9)")
 $ mu \( v \) lt.eq K^alpha wide \( 0.9 K lt.eq v lt.eq 2.1 K \) . $ <sign:low-moments>]

For a shape point $z$, write

$ delta \( z \) = H - \| Im z \| \, wide a \( z \) = log \| f \( z \) \| \, wide cal(A) \( z \) =
  log #scale(x: 120%, y: 120%)[\(] \| f \( z \) \| + delta \( z \) \| f' \( z \) \| #scale(x: 120%, y: 120%)[\)] . $

The function $cal(A)$ is finite and continuous: a common zero of $f$ and $f'$ would imply $f equiv
  0$ by the equation $f'' = q f$. In contrast, $a$ has logarithmic singularities at the isolated zeros of $f$.
  The next estimate keeps these two issues separate.

#thm([Lemma 11.3.])[
  (Local amplitude and logarithmic deficit).  #emph[Let $z_0 = x + upright(i) \( H - d \)$, $d < H \/ 4$, and put
$ H_b = 1 + sup_(B \( z_0 \, d \/ 2 \)) delta sqrt(\| q \|) . $

 On $B \( z_0 \, d \/ 8 \)$, the oscillation of $cal(A)$ is at most $C H_b$.
   Moreover, the normalized area $L^2$ norm of $cal(A) - a$ on that disk,
   and its normalized length $L^2$ norm on the horizontal diameter, are at most $C H_b$.
   The same estimates hold for fixed smaller disks and for horizontal segments of length comparable to $d$ with
   fixed interior margins.]
] <sign:amplitude>

#proof[
  Scale by $d \/ 8$, writing
  $ F \( zeta \) = f \( z_0 + \( d \/ 8 \) zeta \) \, wide Q \( zeta \) = \( d \/ 8 \)^2
    q \( z_0 + \( d \/ 8 \) zeta \) . $
  These functions are holomorphic on $\| zeta \| < 4$, and $\| Q \|^(1 \/ 2) lt.eq H_b \/ 4$.
    The nonvanishing vector $Y = \( F \, F' \/ H_b \)$ satisfies
  $ Y' = mat(delim: "(", 0, H_b; Q \/ H_b, 0) Y . $
  The matrix norm is at most $C H_b$. Gronwall along a straight segment, used in both directions,
    bounds the change of $log parallel Y parallel$ by $C H_b$ on fixed interior disks.
    Since physical depth there is comparable to $d$, replacing $log parallel Y
    parallel$ by $cal(A)$ changes the oscillation by at most $C log \( 2 + H_b \)$. In particular,
  #[#set math.equation(numbering: n => "(11.10)")
   $ \| cal(A) \( z \) - cal(A) \( z_0 \) \| lt.eq C H_b wide \( \| z - z_0 \| lt.eq 3 d \/ 8 \) .
     $ <sign:amplitude-oscillation>]
  Set $A_0 = cal(A) \( z_0 \)$ and $G = e^(- A_0) F$. Cauchy’s estimate on a sufficiently small fixed circle shows
    that there is a point $\| zeta_(*) \| lt.eq 1 \/ 16$ with $log \| G \( zeta_(*) \) \| gt.eq - C$:
    indeed a fixed multiple of $sup_(\| zeta \| lt.eq 1 \/ 16) \| F \( zeta \) \|$ bounds $\| F \( 0 \) \| +
    8 \| F' \( 0 \) \| = e^(A_0)$. On $\| zeta \| lt.eq 3$, (11.10) gives $log \| G \| lt.eq C H_b$.
    Choose $M = C_0 H_b$ large enough and set $U = M - log \| G \| gt.eq 0$. Then $U \( zeta_(*) \) lt.eq C H_b$.
  Jensen’s formula on a circle centered at $zeta_(*)$, of radius in $\[ 2 \, 9 \/ 4 \]$ avoiding boundary zeros,
    bounds by $C H_b$ the number of zeros in $B \( zeta_(*) \, 7 \/ 4 \)$, with multiplicities.
    Choose a further radius in $\[ 3 \/ 2 \, 7 \/ 4 \]$ avoiding boundary zeros.
    The boundary mean of $U$ is at most $U \( zeta_(*) \)$, by submean for $log \| G \|$.
    Poisson–Jensen expresses $U$ inside this latter circle as the harmonic extension of that nonnegative boundary
    data plus the positive disk Green functions of the zeros.
    On $\| zeta \| lt.eq 1$, the harmonic term is bounded by $C H_b$. Each Green function is bounded there by
  $ C + log^(-) \| zeta - zeta_j \| \, $
  which has uniformly bounded $L^2$ norm on the unit disk and on its horizontal diameter.
    For the segment assertion use $log^(-) \| t + upright(i) b - zeta_j \| lt.eq log^(-) \| t -
    Re zeta_j \|$ and the integrability of $\| log \| t \| \|^2$.
    There are at most $C H_b$ zeros, so the triangle inequality bounds the required $L^2$ norms of $U$ by $C H_b$.
    Finally,
  $ cal(A) - a = \( cal(A) - A_0 - M \) + U \, $
  and (11.10) bounds the other summand. Fixed smaller disks and comparable segments follow by the same fixed
    ratios, or by a finite covering. ◻
]

The tile quantities in 83 obey

#[#set math.equation(numbering: n => "(11.11)")
 $ bb(E)_x H_b \( x \, d_v \)^2 lt.eq C K^(2 alpha) \, wide
   bb(E)_x \( cal(A) - a \)^2 \( x + upright(i) \( H - d_v \) \) lt.eq C K^(2 alpha) \, $ <sign:tile-L2>]

whenever the fixed enlargement stays within the band (11.9).
  To see the first assertion, submean for $\| q \|$, followed by averaging in the center, gives

$ bb(E)_x H_b^2 lt.eq
  C
  (1 + d_v integral_(d_v \/ 4)^(7 d_v \/ 4) bb(E)_x \| q \( x + upright(i) \( H - t \) \) \| thin thin upright(d)
  t) lt.eq C K^(2 alpha) . $

The second follows by integrating the segment estimate of 83 in its center.
  Larger fixed tiles or apertures cost only a fixed covering factor. The lower row follows by symmetry.

Run ordinary Brownian motion in the shape strip from a uniform point of its real period.
  At the first hit of either row of depth $e^(- v)$, write $a \( v \)$ for the value of $a$.
  These variables, sampled on any increasing finite grid, form an integrable submartingale.
  Indeed apply subharmonic comparison in the next substrip to $max { log \| f \| \, - T }$ and then let $T arrow.r
  oo$; row logarithms are integrable, including at isolated zeros.
  Translation invariance makes the horizontal coordinate uniform at each sample,
  and symmetry makes the two sides equiprobable.

#thm([Lemma 11.4.])[
  (Logarithmic increments).  #emph[Under (11.9), uniformly for $1.1 K lt.eq v lt.eq 1.9 K$ and $2 lt.eq s lt.eq 4$,
#[#set math.equation(numbering: n => "(11.12)")
 $ bb(E) \| a \( v + s \) - a \( v \) \|^2 lt.eq C K^(2 alpha) . $ <sign:increment-L2>]

]
] <sign:increments>

#proof[
  Start on the upper row of depth $d = e^(- v)$ and stop on first hitting either row of depth $d' = d e^(- s)$.
    Let $U$ be the unwrapped horizontal displacement. The distance to the upper target line is $d - d' asymp d$.
    Ignoring the lower target line gives half-plane exit with Cauchy density
  $ frac(d - d', pi \( \( d - d' \)^2 + u^2 \)) . $
  Consequently
  #[#set math.equation(numbering: n => "(11.13)")
   $ bb(P) \( upright("same side") \, med \| U \| > R d \) lt.eq C \/ R quad \( R gt.eq 1 \) \, wide
     bb(P) \( upright("opposite side") \) lt.eq C d . $ <sign:jump-tails>]
  The second estimate is also the elementary linear hitting probability between two horizontal lines.
    Conditional on displacement and on both sides, the starting horizontal point is still uniform modulo $2 pi$;
    the terminal point is its translate, hence uniform as well.
    This follows directly by translating the Brownian path and its start.
  For a same-side displacement $u$ with $R = \| u \| \/ d lt.eq e^(K \/ 20)$,
    join the endpoints by a prescribed path going first to depth $D = d + \| u \|$, then horizontally by $u$,
    and then to depth $d'$. Subdivide the vertical pieces in fixed small relative steps.
    The horizontal piece requires only a bounded number of depth-sized tiles.
    The whole chain has at most $C \( 1 + log \( 1 + R \) \)$ tiles.
    All their fixed enlargements lie in the low-moment band for large $K$.
    At fixed $u$, their centers are fixed translates of the uniform starting point. By 83, (11.11), and Minkowski,
  $ parallel cal(A) \( upright("end") \) - cal(A) \( upright("start") \) parallel_(L^2 \( d x \/ \( 2 pi \) \))
    lt.eq C K^alpha \( 1 + log \( 1 + R \) \) . $
  The square of the last factor has bounded expectation by (11.13).
  For all remaining transitions, compare amplitudes by a chain from each endpoint to a fixed real collar,
    connecting there modulo period. The global bound (11.1) makes the sum of the tile costs at most
    $C \( 1 + K \)^3$: there are $O \( K \)$ levels and the cost at level $j$ is $O \( \( 1 + j \)^2 \)$.
    Thus the amplitude difference is pointwise polynomially bounded even when an endpoint is near a zero of $f$.
    The remaining transitions have probability at most $C \( e^(- K \/ 20) + e^(- v) \)$, by (11.13).
    They contribute $o \( 1 \)$ to its second moment. We have proved
  $ bb(E) \| cal(A) \( upright("end") \) - cal(A) \( upright("start") \) \|^2 lt.eq C K^(2 alpha) . $
  Finally subtract $cal(A) - a$ at both endpoints. Their uniform horizontal marginal laws and (11.11) bound each
    squared error by $C K^(2 alpha)$. This proves (11.12). Only the amplitude difference was bounded pointwise on
    rare transitions; no pointwise bound for the logarithmic singularities is needed. ◻
]

=== 11.4 From a curvature witness to an occupation cost <from-a-curvature-witness-to-an-occupation-cost>

Set

#[#set math.equation(numbering: n => "(11.14)")
 $ h_0 = K^(6 alpha) . $ <sign:h0>]

Apply 81 to step-$s$ grids in $\[ 1.1 K \, 1.9 K \]$, including the last increment whose initial point is in the
  interval. The number of increments is $O \( K \)$, and 84 gives $V lt.eq C K^(1 + 2 alpha)$.
  Choose $R = K^(1 \/ 2 + 10 alpha)$. Then

$ h_0 \( h_0 + R + sqrt(V) \) = O \( K^(1 \/ 2 + 16 alpha) \) \, wide K h_0^2 frac(V, \( R - h_0 \)^2) =
  O \( K^(1 - 6 alpha) \) . $

Both quantities are $o \( K \/ log K \)$ for (11.2). Integrate the grid estimate over its initial offset in an
  interval of length $s$, and then over $2 lt.eq s lt.eq 4$. Every starting level is counted once. We obtain

#[#set math.equation(numbering: n => "(11.15)")
 $ integral_(1.1 K)^(1.9 K) integral_2^4 bb(E)
   [upright(bold(1))_({ \| a \( v \) \| lt.eq h_0 }) min { \| a \( v + s \) - a \( v \) \|^2 \, h_0^2 }] thin thin
   upright(d) s thin thin upright(d) v = o \( K \/ log K \) . $ <sign:occupation-cost>]

The estimates at the bounded number of terminal increments are covered by the margins in (11.9).

#thm([Lemma 11.5.])[
  (Witnesses force logarithmic oscillation).  #emph[Under (11.9),
    the fraction of pairs $\( x \, k \) in \[ 0 \, 2 pi \] times \[ 1.2 K \, 1.8 K \]$ for which
$ \| a \( x + upright(i) \( H - e^(- k) \) \) \| lt.eq h_0 \/ 4 $

 tends to zero.]
] <sign:witness-cost>

#proof[
  Choose the aperture and all fixed enlargements large enough for 38, with the polynomial exponent in (11.1).
    That proposition supplies fixed constants $L_0 \, C_1 \, C_2 \, c_(*) > 0$.
    At every target $\( x \, k \)$, there is a witness $z$ with
  #[#set math.equation(numbering: n => "(11.16)")
   $ \| Re z - x \| lt.eq L_0 delta \( z \) \, wide k - C_1 log k lt.eq - log delta \( z \) lt.eq k + C_2 \, wide
     delta \( z \) \( \| f \( z \) \| + sqrt(\| q \( z \) \|) \) gt.eq c_(*) . $ <sign:quiet-witness-window>]
  Increasing the fixed margins allows all disks and paths below to stay inside this enlarged cone window.
  For a uniformly chosen target $\( x \, k \)$ in the stated central band, (11.11) and Markov’s inequality show,
    with probability tending to one, that
  #[#set math.equation(numbering: n => "(11.17)")
   $ \( cal(A) - a \) \( x + upright(i) \( H - e^(- k) \) \) lt.eq K^(2 alpha) \, wide delta sqrt(\| q \|) lt.eq
     K^(2 alpha) $ <sign:typical-target>]
  throughout every required enlarged conic tile. For the second assertion,
    cover the window by a bounded number of tiles in each unit log-depth band and use the union bound over
    $O \( log K \)$ bands. The failure probability is $O \( K^(- 2 alpha) log K \) = o \( 1 \)$.
  Call such a target typical. If it is also moderate, meaning $\| a \| lt.eq h_0 \/ 4$,
    then 83 along tile chains of length $O \( 1 + log K \)$ gives
  #[#set math.equation(numbering: n => "(11.18)")
   $ \| cal(A) \| lt.eq h_0 \/ 3 $ <sign:cone-amplitude>]
  on the needed cone cells, for all large $K$. Indeed the initial error and total variation are
    $O \( K^(2 alpha) \( 1 + log K \) \) = o \( h_0 \)$. On this entire window, $delta \| f \| lt.eq
    exp \( - 1.1 K + h_0 \/ 3 \)$ for large $K$, so the first field cannot provide (11.16).
    At a witness point $z_1$ we therefore have
  #[#set math.equation(numbering: n => "(11.19)")
   $ delta_1 sqrt(\| q \( z_1 \) \|) gt.eq c_(*) \/ 2 \, wide delta_1 = delta \( z_1 \) . $ <sign:q-witness>]
  Let $cal(D)_1$ be a disk centered at $z_1$ of a sufficiently small fixed radius times $delta_1$.
    There is a fixed $c_2 > 0$ such that, for every real number $z$,
  #[#set math.equation(numbering: n => "(11.20)")
   $ frac(1, \| cal(D)_1 \|) integral_(cal(D)_1) \| a - z \| thin thin upright(d) upright("area") gt.eq
     c_2 . $ <sign:log-oscillation>]
  Here $\| cal(D)_1 \|$ denotes its area. To prove uniformity, suppose the assertion failed along a sequence.
    Scale the disks to a fixed disk and multiply $f$ by $e^(- z)$.
    The resulting holomorphic functions $g_n$ satisfy $log \| g_n \| arrow.r 0$ in $L^1$.
    Submean bounds $\| g_n \|$ uniformly on compact subdisks, so a subsequence converges holomorphically.
    The limit is not zero, since uniform convergence to zero on a subdisk would contradict the $L^1$ convergence
    of the logarithms. Off its zeros its modulus is one, again by that convergence. Thus it is a nonzero constant.
    At the center, $g''_n \/ g_n arrow.r 0$, contradicting (11.19) in scaled coordinates.
    This proves (11.20) without an upper bound for the witness curvature independent of $K$.
  For $\| z \| lt.eq h_0 \/ 2$, the lower bound persists after restricting to $\| a \| lt.eq
    h_0$ and truncating $\| a - z \|$ at $h_0$. Indeed, (11.18) and 83 give
  $ frac(1, \| cal(D)_1 \|) integral_(cal(D)_1) \( cal(A) - a \)^2 thin thin upright(d) upright("area") lt.eq
    C K^(4 alpha) . $
  On $\| a \| > h_0$, the upper bound $a lt.eq cal(A) lt.eq h_0 \/ 3$ forces $a < - h_0$, so $cal(A) - a gt.eq
    2 h_0 \/ 3$. The discarded $L^1$ mass of $\| a - z \|$ is at most $C K^(4 alpha) \/ h_0 = o \( 1 \)$,
    by Cauchy–Schwarz or the elementary tail estimate $bb(E) \[ e upright(bold(1))_(e > t) \] lt.eq
    bb(E) e^2 \/ t$. On the retained set, $\| a - z \| lt.eq 3 h_0 \/ 2$,
    and truncation at $h_0$ retains at least two thirds of it. Cauchy–Schwarz now yields
  #[#set math.equation(numbering: n => "(11.21)")
   $ frac(1, \| cal(D)_1 \|) integral_(cal(D)_1) upright(bold(1))_({ \| a \| lt.eq h_0 }) min { \| a - z \|^2 \,
     h_0^2 } thin thin upright(d) upright("area") gt.eq c_3 > 0 wide \( \| z \| lt.eq h_0 \/ 2 \) .
     $ <sign:truncated-witness>]
  Take a second disk $cal(D)_2$, with the same horizontal center, centered at depth $e^(- 3) delta_1$,
    and with radius a small fixed multiple of that depth. It lies in the same enlarged cone window.
    By (11.18) and the disk deficit estimate, all but $o \( 1 \)$ of its normalized area has $\| a \| lt.eq
    h_0 \/ 2$. For every starting point of $cal(D)_1$, the transitions to the upper row at an additional log depth
    $s in \[ 2 \, 4 \]$, integrated in $s$, dominate a fixed positive multiple of normalized area on $cal(D)_2$.
    Here the radii were chosen small enough that all height increments lie in $\[ 2 \, 4 \]$ with room.
    The upper-exit strip Poisson kernel has density at least $c \/ delta_1$ for these displacements,
    since both horizontal displacement and vertical distance to the target row are $O \( delta_1 \)$,
    and the latter is comparable to $delta_1$. Also normalized area at depth comparable to $delta_1$ is comparable
    to $thin upright(d) x thin thin upright(d) v \/ delta_1$, with only fixed factors for the second disk.
  For a starting point $x' + upright(i) \( H - e^(- v) \)$, let
  $ C \( x' \, v \) =
    integral_2^4 bb(E)_(x' \, v)
    [upright(bold(1))_({ \| a \( x' \, v \) \| lt.eq h_0 }) min { \| a \( v + s \) - a \( x' \, v \) \|^2 \,
    h_0^2 }] thin thin upright(d) s \, $
  where the conditional expectation denotes ordinary shape Brownian exit to the two next rows,
    and $a \( x' \, v \)$ abbreviates the starting value. Integrate the kernel lower bound over $cal(D)_1$,
    then over the terminal points of $cal(D)_2$ with $\| a \| lt.eq h_0 \/ 2$.
    Formula (11.21), applied with each such terminal value as $z$, shows that every typical moderate target forces
  #[#set math.equation(numbering: n => "(11.22)")
   $ 1 lt.eq C integral_(cal(W) \( x \, k \)) C \( x' \, v \)
     frac(thin upright(d) x' thin thin upright(d) v, e^(- v)) \, $ <sign:target-cost>]
  where $cal(W) \( x \, k \)$ is the full enlarged cone window.
    Replacing the witness disk by this window is legitimate because the integrand is nonnegative;
    it also avoids any measurable-choice issue for the witness.
  Integrate (11.22) over all typical moderate targets. For a fixed source $\( x' \, v \)$,
    the horizontal measure of target centers whose window contains it is $O \( e^(- v) \)$;
    this cancels the factor $e^v$. Their allowed $k$-range has length $O \( log K \)$.
    Fubini therefore bounds their unnormalized measure by
  $ C log K integral_(1.1 K)^(1.9 K) integral_0^(2 pi) C \( x' \, v \) thin thin upright(d) x' thin thin
    upright(d) v . $
  Uniform horizontal law and the upper-side probability $1 \/
    2$ bound the last integral by a fixed multiple of (11.15). The result is $o \( K \)$.
    Atypical targets already have fraction $o \( 1 \)$, proving the lemma. ◻
]

#thm([Theorem 11.6.])[
  (Deterministic row sign test).  #emph[For every sufficiently large $K$, there is a deterministic $k =
    k \( K \) in \[ 0.8 K \, 2.2 K \]$ such that, on each shape row of depth $e^(- k)$,
#[#set math.equation(numbering: n => "(11.23)")
 $ \| log \| f \| \| > K^(alpha \/ 2) $ <sign:row-test>]

 outside a set of relative horizontal measure tending to zero as $K arrow.r oo$.]
] <thm:row-sign>

#proof[
  If $mu \( j \) gt.eq K^alpha$ for some $j in \[ 0.9 K \, 2.1 K \]$, use 82.
    Otherwise (11.9) holds, and 85 provides a deterministic row in $\[ 1.2 K \, 1.8 K \]$ with exceptional
    fraction tending to zero for the stronger threshold $h_0 \/ 4$.
    Since $K^(alpha \/ 2) = o \( h_0 \)$, it also gives (11.23).
    Real symmetry gives the lower-row conclusion from the upper one.
    The sequential proofs imply the stated conclusion as $K arrow.r oo$,
    without restricting to either alternative along a fixed subsequence. ◻
]

=== 11.5 Robustness of the sign test <robustness-of-the-sign-test>

#thm([Proposition 11.7.])[
  (A robust sign disk).  #emph[For the deterministic level in 86, put
#[#set math.equation(numbering: n => "(11.24)")
 $ h_1 = 1 / 2 K^(alpha \/ 2) \, wide r_(upright("rob")) = e^(- k - h_1 \/ 4) . $ <sign:h1-radius>]

 Outside a set of relative horizontal measure tending to zero on either tested row, each point $z$ has
$ \| log \| f \( zeta \) \| \| gt.eq h_1 wide \( \| zeta - z \| lt.eq r_(upright("rob")) \) \, $

 with constant sign on that disk. In the odd-slice Brownian experiment,
   for each fixed site the probability that its first hit of the tested shape depth occurs at a point without this
   property tends to zero.]
] <prop:robust-sign>

#proof[
  Write $d = e^(- k)$. By (11.1), $\| q \| lt.eq C d^(- 2) K^4$ throughout a fixed depth-sized neighborhood of
    either tested row. Zeros of $f$ in this neighborhood are separated by at least $c d K^(- 2)$.
    Indeed, scale around a zero by $r = c d K^(- 2)$, choosing $c$ small.
    The scaled potential has arbitrarily small supremum on a fixed disk,
    and the solution normalized to have derivative one and value zero at the center satisfies
  $ F \( zeta \) = zeta + integral_0^zeta \( zeta - u \) Q \( u \) F \( u \) thin thin upright(d) u . $
  The integral equation gives $\| F \( zeta \) - zeta \| lt.eq
    C parallel Q parallel_oo \| zeta \|^3$ on a smaller fixed disk. Thus the zero is the only one there.
    This also reproves simplicity in this setting.
  Packing disks of radius comparable to $d K^(- 2)$ in a periodic band of width $O \( d \)$ bounds its number of
    zeros by $C d^(- 1) K^4$. Delete from the tested row the shadows of disks of radius
  $ r_(upright("exc")) = d e^(- h_1 \/ 10) $
  about all these zeros. Their total relative length is at most $C K^4 e^(- h_1 \/ 10) = o \( 1 \)$.
    Zeros outside this band are too far away to affect the following smaller disks.
  At a remaining point, and throughout its disk of radius $r_(upright("rob"))$,
  #[#set math.equation(numbering: n => "(11.25)")
   $ lr(|f' / f|) lt.eq C \/ r_(upright("exc")) . $ <sign:log-derivative>]
  Here is the local zero test proving this bound. If $lambda =
    f' \( z \) \/ f \( z \)$ has modulus much larger than $r_(upright("exc"))^(- 1)$,
    rescale by $1 \/ lambda$ and divide by $f \( z \)$. On $\| u \| lt.eq
    2$ the resulting equation has arbitrarily small potential, because $sup \| q \| \/ \| lambda \|^2 lt.eq
    C K^4 e^(- h_1 \/ 5)$, and its initial data are $F \( 0 \) = F' \( 0 \) = 1$.
    The integral equation makes $F$ uniformly close to $1 + u$.
    Rouche’s theorem gives a zero near $u = - 1$, hence within $2 \/ \| lambda \|$ of $z$.
    That contradicts the distance to the deleted zero disks. Since $r_(upright("rob")) \/ r_(upright("exc")) =
    e^(- 3 h_1 \/ 20)$, the same argument applies throughout the robustness disk.
  The disk is zero-free, so integrating (11.25) along segments bounds the change of $log \| f \|$ by $C
    e^(- 3 h_1 \/ 20) = o \( 1 \)$. The original test has threshold $2 h_1$,
    which proves the assertion after discarding its exceptional set.
    For the Brownian statement, 75 dominates the unconditional first-hit law of each site by a fixed multiple of
    ordinary shape Brownian motion from uniform horizontal start.
    The latter has uniform horizontal distribution on each tested row.
    The bad first-hit probability is therefore $o \( 1 \)$, including paths on which the site is stopped before
    reaching that row. ◻
]

=== 11.6 The last moving site <the-last-moving-site>

Return to the odd periodic phase slice of Lemma 10.1, Theorem 10.9.
  The odd integer $N$ and the real parameter $t_0 = 2 pi \/ N$ are fixed.
  Brownian time in the phase strip is denoted by $u$, so derivatives $s'_j$ always mean derivatives with respect
  to the complex phase coordinate $y$, not derivatives in time. Retain the notation

$ a_j = log \| f \( s_j \) \| \, wide k_j = - log \( H - \| Im s_j \| \) \, wide K_j \( u \) =
  sup_(v lt.eq u) k_j \( v \) \, wide w_max = max_j \| w_j \| . $

The stopping time $tau_L$ is the first time one of the histories $K_j$ reaches $L$.
  By 74, it occurs almost surely before phase exit for all large $L$.

#thm([Lemma 11.8.])[
  (A deterministic history gap).  #emph[There is a fixed finite menu of exponents $0 < gamma_m <
    1$ such that for each large $L$, one deterministic choice $K =
    L^(gamma_m)$ has the following event of probability greater than $0.9$:
    every terminal history $K_j \( tau_L \)$ is either at most $K^(alpha \/ 8)$ or at least $3 K$.
    At least one history is in the second class.]
] <sign:history-gap>

#proof[
  Choose a fixed integer $M > 10 N$. Choose positive exponents $gamma_1 < dots.h.c < gamma_M < 1$,
    small enough and separated so that $gamma_m < gamma_(m + 1) alpha \/ 8$. Then the intervals
  $ \( L^(gamma_m alpha \/ 8) \, 3 L^(gamma_m) \) \, wide 1 lt.eq m lt.eq M \, $
  are pairwise disjoint and lie below $L$, for all large $L$. Each path has at most $N$ failed menu choices:
    a single terminal history belongs to at most one of the intervals.
    Averaging failure probabilities over the menu gives a deterministic choice with failure probability at most
    $N \/ M < 0.1$. One history equals $L$ at $tau_L$, so the large class is nonempty.
    Because the menu is fixed and finite, all subsequent $o \( 1 \)$ estimates can be made uniform over its choices. ◻
]

Fix this deterministic $K$, and set

#[#set math.equation(numbering: n => "(11.26)")
 $ u_0 = K^(alpha \/ 8) \, wide h_2 = K^(alpha \/ 4) = u_0^2 . $ <sign:h2>]

On the event of 88, denote the shallow indices by $I$ and their nonempty complement by $J$.
  These sets depend on the terminal path. In the estimates below, however,
  every candidate set is fixed before a stopping argument is applied.

#thm([Lemma 11.9.])[
  (Two derivative bounds).  #emph[With exceptions of probability tending to zero,
    the following hold through $tau_L$. For every site,
#[#set math.equation(numbering: n => "(11.27)")
 $ \| s'_i \| lt.eq e^(o \( h_2 \) - \| a_i \|) w_max . $ <sign:site-suppression>]

 For each fixed nonempty candidate $J$, put $I = J^c$ and stop additionally when any history in $I$ reaches $2
   u_0$. Up to that stop,
#[#set math.equation(numbering: n => "(11.28)")
 $ w_max lt.eq e^(C h_2) max_(j in J) \| s'_j \| . $ <sign:deep-controls-all>]

 The exceptional probability tends to zero uniformly over the finite family of candidates.
   In particular, both bounds hold throughout $\[ 0 \, tau_L \]$ on the final classification event with its actual
   sets $I \, J$, apart from an event of probability tending to zero.]
] <sign:derivative-bounds>

#proof[
  Choose the arbitrarily small fixed exponent in 80 using the smallest exponent in the menu.
    Its geometry cost is then $o \( u_0 \)$, uniformly through $tau_L$.
    This controls logarithms of the sines and lengths, and hence all entries of $M_0$, at cost $o \( h_2 \)$.
    The identities (10.8) and (10.9) read
  #[#set math.equation(numbering: n => "(11.29)")
   $ w_i = c sin d_i^0 thin f_i^(- 2) s'_i \, wide 2 f_i s'_i = \( M_0 w \)_i . $ <sign:two-identities>]
  If $a_i < 0$, the first gives $\| s'_i \| lt.eq e^(o \( h_2 \) + 2 a_i) w_max$, which implies (11.27).
    If $a_i gt.eq 0$, the second gives that inequality directly.
  We spell out the uniform inverse estimate needed for the second bound. Fix $I$ and a subset $F subset J$.
    Retain the sites $I$ with their actual curvatures, retain $F$ with curvature zero, and delete all other sites.
    This is one of the generically invertible modified matrices of 72; it has at least one deletion or flattening,
    since $J eq.not diameter$. Stop at the first shallow history $2 u_0$, and at the geometry cuts just selected.
    The upper bound for $a_i$ on truthful sites is $O \( u_0 \)$ by (11.1).
    Every entry and the determinant of this fixed matrix thus have upper logarithmic bound $C u_0$.
    At a real starting point its determinant is nonzero, with a uniform lower bound on the compact real period.
    Apply the stopped logarithmic-deficit estimate from 76, with lower threshold $u_0^(3 \/ 2)$.
    Except with probability $O \( u_0^(- 1 \/ 2) \)$, the inverse determinant costs at most $e^(u_0^(3 \/ 2))$.
    The adjugate costs $e^(C u_0)$, so
  #[#set math.equation(numbering: n => "(11.30)")
   $ parallel B_(I \, F)^(- 1) parallel lt.eq exp \( O \( u_0^(3 \/ 2) \) \) =
     e^(o \( h_2 \)) . $ <sign:modified-inverse>]
  Empty determinants are one. This is also the specialization of 77 with upper threshold $O \( u_0 \)$ and lower
    threshold $u_0^(3 \/ 2)$. Take the finite union over all fixed pairs $\( I \, F \)$ before using any
    time-dependent set.
  At a given time put
  $ F = { j in J : a_j < - h_2 } \, wide D = J \\ F . $
  In $cal(H) w = 0$, eliminate the block $I union F$ by (11.30). The curvatures removed on $F$ satisfy
  $ \| cal(V)_j \| = lr(|frac(2 f_j^3, c sin d_j^0)|) lt.eq e^(- 3 h_2 + o \( h_2 \)) . $
  Their diagonal perturbation is absorbed by the inverse bound.
    The coupling entries to $D$ cost only $e^(o \( h_2 \))$. Consequently $w_max lt.eq
    e^(o \( h_2 \)) max_(j in D) \| w_j \|$. If $D$ is empty the same absorption gives $w = 0$,
    so the desired inequality still holds. Otherwise $a_j gt.eq - h_2$ on $D$, and the first identity in (11.29) gives
  $ \| w_j \| lt.eq e^(2 h_2 + o \( h_2 \)) \| s'_j \| . $
  This proves (11.28). All possible flat sets were already included in the finite union;
    no assertion about their switching times is needed. On the final shallow event the additional history cut is
    after $tau_L$, which proves the last assertion. ◻
]

#thm([Theorem 11.10.])[
  (The last-site contradiction).  #emph[The nonisotropic finite critical-wall case is impossible.]
] <thm:last-site>

#proof[
  Use 86 for the deterministic $K$ just chosen, and let $k in \[ 0.8 K \, 2.2 K \]$ be its deterministic tested
    level. Write $d = e^(- k)$, and retain $h_1 = K^(alpha \/ 2) \/ 2$ and $r_(upright("rob")) =
    d e^(- h_1 \/ 4)$ from 87. Notice the strict separation
  #[#set math.equation(numbering: n => "(11.31)")
   $ 1 lt.double u_0 lt.double u_0^(3 \/ 2) lt.double h_2 lt.double h_1 lt.double K . $ <sign:scale-separation>]
  For each site $j$, let $sigma_j$ be its first hit of shape depth $d$, and put $sigma_j =
    oo$ if it never hits that depth before phase exit. Define the remaining intrinsic clock
  $ Q_j = integral_(sigma_j and tau_L)^(tau_L) \| s'_j \( y_u \) \|^2 thin thin upright(d) u . $
  The shape Brownian time-change extension in 75 and the strong Markov property give
  #[#set math.equation(numbering: n => "(11.32)")
   $ bb(P) { Q_j > d^2 e^(sqrt(h_2)) } lt.eq C e^(- sqrt(h_2) \/ 2) . $ <sign:remaining-clock>]
  Indeed, after first hit the point is distance $d$ from its nearest wall.
    Exit from the shape strip occurs no later than first hit of that wall in the Brownian extension.
    For a one-dimensional Brownian motion started at distance $d$ from a line,
    the reflection principle gives $bb(P) \( T_(upright("line")) > t \) lt.eq C d \/ sqrt(t)$.
    Substitute $t = d^2 e^(sqrt(h_2))$. If the tested row has not been reached at $tau_L$, then $Q_j = 0$.
    Thus (11.32) is unconditional and does not depend on later membership of $j$ in a classification set.
  For every fixed nonempty subset $J$, define
  #[#set math.equation(numbering: n => "(11.33)")
   $ T_J = max_(j in J) \( sigma_j and tau_L \) . $ <sign:last-hit-stop>]
  This is a stopping time, as a finite maximum of stopping times, and $T_J lt.eq tau_L$.
    On the event that $J$ is the actual deep class, every one of its sites reaches history $3 K$.
    Since $k < 3 K$, every $sigma_j$ is then strictly before $tau_L$, and $T_J$ is an actual last first hit.
    On the good geometry, inverse, and clock events, the bound (11.28) yields, for the actual classification,
  #[#set math.equation(numbering: n => "(11.34)")
   $ integral_(T_J)^(tau_L) w_max^2 thin thin upright(d) u lt.eq
     e^(C h_2) sum_(j in J) integral_(sigma_j)^(tau_L) \| s'_j \|^2 thin thin upright(d) u lt.eq
     d^2 e^(C' h_2) . $ <sign:w-clock>]
  The constants absorb the fixed number of sites and the squaring of the exponential factor in (11.28).
  We next give the displacement estimate with fixed candidates;
    this is necessary because the terminal classification and last-hit order are not known at time zero.
    Fix $J eq.not diameter$ and $i in J$. At time $T_J$, center a disk of radius $r_(upright("rob"))$ at the
    $cal(F)_(T_J)$-measurable point $s_i \( y_(T_J) \)$. Let $eta_(J \, i)$ be its first exit time after $T_J$,
    capped at $tau_L$. Consider the event that $J$ is the actual deep class and $i$ is an actual last site,
    so $sigma_i = T_J$. Exclude the first-hit failures from 87,
    whose unconditional probability is $o \( 1 \)$ after the finite union over sites.
    On the event under consideration, $\| a_i \| gt.eq h_1$ up to $eta_(J \, i)$. By (11.27) and (11.34),
  #[#set math.equation(numbering: n => "(11.35)")
   $ integral_(T_J)^(eta_(J \, i)) \| s'_i \|^2 thin thin upright(d) u lt.eq d^2 exp \( C'' h_2 - 2 h_1 \) = :
     q_K . $ <sign:suppressed-clock>]
  Choose the fixed constant $C''$ with enough slack to absorb all the deterministic $o \( h_2 \)$ costs.
  Apply the maximal inequality to the actual complex displacement martingale $s_i \( y_u \) - s_i \( y_(T_J) \)$,
    stopped at $eta_(J \, i)$ and also when its scalar quadratic time after $T_J$ reaches $2 q_K$.
    Its expected squared terminal displacement is at most $C q_K$.
    One may first localize inside compact substrips and then pass to the limit.
    On the good event in (11.35), the additional clock cut does not precede $eta_(J \, i)$.
    Therefore the probability of disk exit on that good event is at most
  #[#set math.equation(numbering: n => "(11.36)")
   $ C q_K / r_(upright("rob"))^2 lt.eq C exp \( C'' h_2 - 3 / 2 h_1 \) = o \( 1 \) . $ <sign:escape-probability>]
  This is an unconditional martingale estimate for each fixed $\( J \, i \)$.
    The classification event, last-hit identity, geometry bounds,
    and robustness are intersected with it only afterward. Ties among last sites cause no problem:
    choose any tied index and include it in the same finite union.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-4.455, 2.76), (4.455, 2.76), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.455, 2.76), [#text(size: 9pt)[shape wall]], anchor: "west", padding: 0.1176cm)
  line((-4.455, 2.392), (4.455, 2.392), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((4.62, 2.392), [#text(size: 9pt)[depth $e^(-3K)$]], anchor: "west", padding: 0.1176cm)
  line((-4.455, 0.69), (4.455, 0.69), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((4.62, 0.69), [#text(size: 9pt)[depth $e^(-k)$]], anchor: "west", padding: 0.1176cm)
  circle((0, 0.69), radius: (0.5445, 0.3795), fill: rgb("#edf1f4"), stroke: none)
  circle((0, 0.69), radius: (0.5445, 0.3795), stroke: (paint: rgb("#234f70"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0.69), radius: 0.05644, fill: rgb("#234f70"), stroke: none)
  content((-0.759, 0.6555), [#text(size: 9pt)[$s_i(y_(T_J))$]], anchor: "east", padding: 0.1176cm)
  bezier((-1.155, -0.345), (0, 0.69), (-0.7662, 0.1183), (-0.2069, 0.1216), stroke: (paint: rgb("#a34637"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a34637"))))
  bezier((0, 0.69), (0.825, 2.392), (0.3117, 1.359), (0.7607, 1.657), stroke: (paint: rgb("#a34637"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: rgb("#a34637"))))
  content((0.957, 1.438), [#text(size: 9pt)[Reaching the row nearer the wall#linebreak()requires leaving the disk.]], anchor: "west", padding: 0.1176cm)
  line((0, 0.69), (0.4785, 0.8625), stroke: (paint: rgb("#234f70"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#234f70"))))
  content((0, -0.9085), [#text(size: 9pt)[Robust radius $e^(-k-h_1"/"4)$ quadratic-time cost $lt.eq e^(-2k+"Ch"_2-2h_1)$]])
})],
    caption: [Figure 5: The last-site contradiction, drawn without metric scale. For a fixed candidate set, $T_J$ is the last of its capped first hits of the tested row. The last site’s robust sign suppresses its subsequent quadratic time so strongly that disk exit has vanishing probability. Its prescribed final history would nevertheless require such an exit. ],
  ) <fig:last-site>
  Disk exit is nevertheless compulsory on the classification event.
    An actual last site has depth $d$ at $T_J = sigma_i$, and subsequently attains depth at most $e^(- 3 K)$ by
    $tau_L$. It cannot have attained that depth earlier, since that would already have crossed the tested row.
    The depth function is $1$-Lipschitz, so its displacement before $tau_L$ is at least
  $ d - e^(- 3 K) gt.eq d \/ 2 > r_(upright("rob")) $
  for large $K$. Thus it must leave the disk shown in 5. The finite union of (11.36) over all candidates $J \,
    i$ makes this event have probability $o \( 1 \)$, whereas 88 and all the excluded failure estimates give
    probability at least $0.9 - o \( 1 \)$. This contradiction proves the theorem. ◻
]

=== 11.7 Completion of the rigidity theorem <completion-of-the-rigidity-theorem>

#proof[
  The physical caustic-collar hypothesis gives an analytic boundary by 3,
    and then the even joint parametrization and nonzero area coefficient of 10.
    The continuation and no-patch theorems produce the maximal shape strip $D_H$,
    with the natural-boundary conclusion of 25 when $H < oo$.
  If the meromorphic normal $a = e^(upright(i) phi.alt)$ has a zero or pole inside this strip,
    28 already identifies the boundary as an ellipse. In the remaining case,
    29 and 30 give the holomorphic shape fields and the intrinsic impact lift used above.
    Constant $f$ gives a circle. For nonconstant $f$, 46 excludes both $H =
    oo$ and infinite upper growth order at a finite wall. At a finite wall,
    37 excludes upper growth order below one, and 39 excludes every finite upper growth order above one.
    The only remaining possibility is a finite critical wall.
    The critical bootstrap, 58, and the odd-slice construction place it under the hypotheses of 90,
    which excludes it as well.
  Only an elliptic boundary, including a circle, remains. Convexity then identifies the domain with the interior
    of that ellipse. After translation, it is therefore described by a positive definite quadratic form, as asserted. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
