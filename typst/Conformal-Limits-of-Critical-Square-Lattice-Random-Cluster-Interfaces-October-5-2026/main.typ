#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Conformal Limits of Critical Square-Lattice \
Random-Cluster Interfaces]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction and precise statements <sec:introduction>

Planar critical models are expected to have conformally invariant scaling limits.
  For random-cluster models this prediction identifies the law of an interface,
  the joint law of all surrounding loops, and crossing probabilities in arbitrary shapes.
  These are distinct conclusions: a limit for one interface does not by itself identify its coupling with other
  interfaces, and convergence of loop traces on compact sets does not by itself retain multiplicities, nesting,
  or complete traversals.

Schramm’s characterization of conformally invariant interfaces led to Schramm–Loewner evolution
  #cite(label("Schramm2000")). Cardy’s prediction for critical percolation crossings #cite(label("Cardy1992")) was
  proved by Smirnov for site percolation on the triangular lattice #cite(label("Smirnov2001")).
  The random-cluster Ising model has a discrete holomorphic observable #cite(label("Smirnov2010")),
  and its interface convergence is established in
  #cite(label("ChelkakDCHonglerKemppainenSmirnov2014"), form: "prose").
  Conformal loop ensembles provide the corresponding continuum laws for complete families of interfaces
  #cite(label("SheffieldWerner2012")) #cite(label("Sheffield2009Exploration")).
  The results below concern the nearest-neighbor square lattice,
  with its ordinary Euclidean embedding and its original random-cluster probability law.

=== 1.1 The model and its boundary conventions <intro:model>

Fix a real number $q in \[ 1 \, 4 \]$ and put

#[#set math.equation(numbering: n => "(1.1)")
 $ p_q = frac(sqrt(q), 1 + sqrt(q)) \, wide kappa \( q \) =
   frac(4 pi, arccos \( - sqrt(q) \/ 2 \)) . $ <intro:parameters>]

The inverse cosine has values in $\[ 0 \, pi \]$. Thus $4 lt.eq kappa \( q \) lt.eq 6$, with $kappa \( 1 \) =
  6$ and $kappa \( 4 \) = 4$. On a finite graph $G = \( V \, E \)$,
  let $xi$ be a partition of designated boundary vertices. For $A subset.eq E$,
  let $k_xi \( A \)$ be the number of components of $\( V \, A \)$ after identification within each block of $xi$,
  including isolated vertices. The random-cluster law is

#[#set math.equation(numbering: n => "(1.2)")
 $ phi.alt_(G \, q)^xi \( A \) = 1 / Z_(G \, q)^xi p_q^(\| A \|) \( 1 - p_q \)^(\| E \| - \| A \|)
   q^(k_xi \( A \)) . $ <intro:finite-law>]

An #emph[actual open path] always consists of open edges of $G$.
  Identification in $xi$ is used to compute the probability weight and does not supply an additional edge in such
  a path.

Let $D$ be a bounded Jordan domain. A lattice approximation at mesh $delta_n arrow.b
  0$ is the bounded interior $D_n$ of a simple closed nearest-neighbor polygon on $delta_n bb(Z)^2$.
  Its graph $G_n$ has every lattice vertex in $overline(D_n)$ and every nearest-neighbor edge whose closed segment
  is contained in $overline(D_n)$. In particular, boundary edges are part of $G_n$.

For two marked boundary points $a \, b$, we require counterclockwise parametrizations $beta_n \,
  beta : \[ 0 \, 1 \] arrow.r bb(C)$, injective on $\[ 0 \, 1 \)$, such that

#[#set math.equation(numbering: n => "(1.3)")
 $ beta_n \( 0 \) = beta_n \( 1 \) = a_n \, wide beta_n \( 1 \/ 2 \) = b_n \, wide beta \( 0 \) = beta \( 1 \) =
   a \, wide beta \( 1 \/ 2 \) = b \,\
sup_(t in \[ 0 \, 1 \]) \| beta_n \( t \) - beta \( t \) \| arrow.r 0 . $ <intro:marked-jordan>]

The free arc $F_n$ goes counterclockwise from $a_n$ to $b_n$;
  the other arc $W_n$ goes counterclockwise from $b_n$ to $a_n$.
  Wire together all vertices of $W_n$, including the two marked endpoints.
  All other boundary vertices remain singleton blocks. Remove from the sampled edge set the boundary edges of
  $W_n$ and declare those edges open for the interface drawing.
  This is equivalent on all remaining edges to (1.2) with the same wired partition:
  the endpoints of each removed edge were already identified. Edges on $F_n$ remain random.

The medial graph has vertices at the midpoints of primal edges,
  with medial edges joining the midpoints of consecutive sides of a lattice square.
  At an open primal edge the four incident medial half-edges are paired in quarter turns around the adjacent dual
  faces; at a closed primal edge they are paired around the primal endpoints.
  At the boundary one uses the turns between the primal wired arc and its complementary dual wired arc.
  There is a unique medial strand between the two changes of boundary condition.
  We orient it from $a_n$ to $b_n$ and denote it by $eta_n$.
  This is the usual Dobrushin construction #cite(label("DC2017Lectures")) Section 5.2.2.
  Occurrence order at a twice-visited medial vertex is part of the curve.
  The tile drawings used later preserve this order and differ from the straight medial drawing by at most a
  constant times $delta_n$ in uniform curve distance.

For continuous oriented curves $gamma_1 \, gamma_2 : \[ 0 \, 1 \] arrow.r bb(C)$, write

#[#set math.equation(numbering: n => "(1.4)")
 $ d_(upright("curv")) \( gamma_1 \, gamma_2 \) = inf_(phi_1 \, phi_2) sup_(0 lt.eq t lt.eq 1) \|
   gamma_1 \( phi_1 \( t \) \) - gamma_2 \( phi_2 \( t \) \) \| \, $ <intro:curve-metric>]

where the infimum is over increasing homeomorphisms of $\[ 0 \, 1 \]$. Zero-distance curves are identified.
  Chordal $"SLE"_kappa$ in $\( D \; a \, b \)$ is the conformal image of the upper-half-plane Loewner trace driven
  by $sqrt(kappa) B_t$ from $0$ to $oo$, with $B$ a standard Brownian motion.
  The remaining positive dilation of the conformal coordinate does not change this law.

=== 1.2 Complete loop collections <intro:collections>

Let $phi.alt_q^0$ be the weak limit of (1.2) in increasing square boxes of $bb(Z)^2$ with free boundary
  conditions. Form its complete medial interface collection, using the same local pairings as above,
  and then scale the embedding by $delta$. Denote the resulting collection by $Gamma_delta$.
  It contains every loop at every nesting level. The elementary circuit argument in Section 2 shows that its
  discrete interfaces are almost surely finite, also at $q = 4$.

Individual loops are unrooted and unoriented continuous maps of the circle into the Riemann sphere $hat(bb(C))$.
  Their distance is the infimum of the uniform spherical distance over circular orientation-preserving
  homeomorphisms and reversal, with zero-distance representatives identified.
  We retain distinct loops even when their images coincide.
  For two collections, an $epsilon$-matching is a partial bijection that covers all loops of spherical diameter
  greater than $epsilon$ in both collections, has matched-loop distance at most $epsilon$,
  and leaves only loops of diameter at most $epsilon$ unmatched.
  Convergence of collections means the existence of such matchings with $epsilon arrow.b 0$.
  The continuum law in the next statement is the standard nested whole-plane $"CLE"_kappa$ in this topology.

#thm([Theorem 1.1.])[
  (Interfaces and all nested loops).  #emph[For every fixed real $1 lt.eq q lt.eq 4$, the following assertions hold.]
  + #emph[For every bounded Jordan domain $D$ with distinct boundary marks $a \, b$,
    and every approximation satisfying (1.3), the Dobrushin strand $eta_n$ converges in law, in (1.4),
    to chordal $"SLE"_(kappa \( q \))$ from $a$ to $b$ in $D$.]
  + #emph[Under the specified free infinite-volume law, $Gamma_delta$ converges in law as $delta arrow.b
    0$ to the nested whole-plane $"CLE"_(kappa \( q \))$, in the spherical collection topology just defined.
    The limit is Möbius invariant.]
  #emph[Both conclusions hold along every mesh sequence. No uniformity in $q$ is asserted.]
] <intro:main>

Theorem 1 establishes the SLE/CLE conformal-invariance prediction for critical random-cluster models on the square
  lattice throughout $q in \[ 1 \, 4 \]$. The word “critical” refers to the edge parameter $p_q$.
  At $q = 4$ the limits are chordal $"SLE"_4$ and the standard simple nested whole-plane $"CLE"_4$.

The endpoint proof uses a whole-plane height-field theorem,
  with its precise law and symmetry input verified in Section 16.
  That theorem supplies no finite-domain field convergence, conditional convergence after an exploration,
  or interface convergence. Sections 18– 20 prove these further implications.
  The strict angular and six-arm estimates used for $q < 4$ are not extended to $q = 4$ by a limiting argument.

=== 1.3 Square-lattice bond crossings <intro:crossings>

For four distinct counterclockwise boundary marks $a \, b \, c \, d$ of $D$,
  require the same uniform convergence as in (1.3), with the respective four marks at parameters $0 \, 1 \/ 4 \,
  1 \/ 2 \, 3 \/ 4$. Sample #emph[all] edges of $G_n$ independently with probability $1 \/ 2$,
  including every boundary edge, and make no identifications or external connections.
  Let $C_n$ be the event of an actual open path from the closed counterclockwise arc $\[ a_n \, b_n \]$ to the
  closed counterclockwise arc $\[ c_n \, d_n \]$.

#thm([Theorem 1.2.])[
  (Cardy’s formula for square-lattice bond percolation).  #emph[Let $psi : D arrow.r bb(H)$ send $a \, c \,
    d$ to $0 \, 1 \, oo$, and put $x = psi \( b \) in \( 0 \, 1 \)$.
    Under the boundary and approximation conventions above,
#[#set math.equation(numbering: n => "(1.5)")
 $ lim_(n arrow.r oo) bb(P) \( C_n \) =
   frac(integral_0^x \[ t \( 1 - t \) \]^(- 2 \/ 3) thin upright(d) t, integral_0^1 \[ t \( 1 - t \) \]^(- 2 \/ 3)
   thin upright(d) t) . $ <intro:cardy-formula>]

]
] <intro:cardy>

Theorem 2 proves the square-lattice bond-percolation form of Cardy’s prediction with the free-boundary convention
  specified here. We obtain it directly from the alternating four-change calculation and a deterministic
  comparison on a common lattice graph. In particular, its proof supplies the boundary transfer for the actual
  crossing event; it does not infer continuity of that event from a curve limit.

=== 1.4 Proof structure and technical contributions <proof-structure-and-technical-contributions>

For $1 lt.eq q < 4$, use the parameters

#[#set math.equation(numbering: n => "(1.6)")
 $ d = sqrt(q) = 2 cos lambda \, wide rho = lambda \/ pi \, wide 0 < lambda lt.eq pi \/ 3 . $ <intro:lambda-rho>]

The first part of the proof is a four-change boundary calculation.
  In the upper half-plane, put the boundary changes at $0 \, chi \, 1 \, oo$.
  For the open cap normalization, in which the four unmatched ends carry no additional pairing weights,
  the connection probability is

#[#set math.equation(numbering: n => "(1.7)")
 $ f \( chi \) = frac(I_C \( chi \), I_B \( chi \) + I_C \( chi \)) \, quad {I_B \( chi \) =
   integral_chi^1 u^(rho - 1) \| u - chi \|^(rho - 1) \| u - 1 \|^(1 - 3 rho) thin upright(d) u \,\
I_C \( chi \) = integral_1^oo u^(rho - 1) \| u - chi \|^(rho - 1) \| u -
  1 \|^(1 - 3 rho) thin upright(d) u . $ <intro:fourchange-formula>]

Separate deterministic cap wires on the two designated intervals change this to $f \/ \( f + d \( 1 - f \) \)$.
  Keeping these two normalizations distinct is essential when $d eq.not 1$.

===== 1.4.1 Positive comparisons before complex observables. <positive-comparisons-before-complex-observables.>

Section 2 identifies the capped tile law exactly with the random-cluster law and establishes the collar and
  passage-count comparisons used later. It keeps actual components distinct from boundary partition blocks.
  Bulk box crossing at $q lt.eq 4$ and the stronger up-to-boundary crossing estimates for $q <
  4$ have different roles #cite(label("DCLM2019Isoradial")) #cite(label("DMT2021Fractal")).
  Section 3 derives the local exponent inequalities needed to control corner, tip, and source factors.
  All complex currents are subsequently estimated in these positive laws.

===== 1.4.2 Angular transfer and boundary holomorphicity. <angular-transfer-and-boundary-holomorphicity.>

Sections 4 and 5 construct the transfer operators, their reflected norms, and the path-current primitive.
  The argument distinguishes a common complex continuation radius from norm constants that may depend on a vector
  in the cyclic core. A scalar spectral factorization then suppresses the angular modes that would obstruct
  holomorphicity. The boundary calculation in Section 6 is initially conditional on this holomorphicity.
  Sections 7–9 discharge the condition by a distant-probe comparison, closing finitely many wall gaps,
  and a folded mixed-stencil estimate. The folds retain the external states in their reflected norms;
  local exponent savings pay for extraction and normalization costs.
  This produces (1.7) without assuming a lattice conformal invariance theorem.

===== 1.4.3 Moving domains and the chordal driver. <moving-domains-and-the-chordal-driver.>

The fixed-shape formula must remain useful after a random exploration.
  Section 11 proves this transfer using a finite chart approximation and an averaged six-arm estimate under the
  original switch law. It does not require a uniform six-arm theorem in every possible explored domain.
  Section 12 first normalizes a shrinking test into a bounded martingale and then transfers it to the true
  Dobrushin law. Two tests identify the driver and its bracket.
  Tightness and a separate traversal argument give the Euclidean uniform curve conclusion of Theorem 1(i) for $q < 4$.

===== 1.4.4 Joint branches and loop identities. <joint-branches-and-loop-identities.>

Sections 13–15 construct a target tree by uniform-walled peeling.
  They establish the reflected angular dynamics, exclude forcepoint variation supported on endpoint times,
  and identify independent continuation noises after separation,
  conditional on the common causal history at separation. The resulting branching SLE description is then matched
  to the original discrete loops: winding information determines loop labels,
  while additional estimates determine full traversal order.
  An escape bound upgrades convergence in bounded windows to the spherical matching topology for every nesting
  generation.

===== 1.4.5 The endpoint field argument. <the-endpoint-field-argument.>

At $q = 4$ the loop height uses independent fair signs and unit jumps.
  Section 16 extracts a bijection of selected loops from the public FK homotopy coupling
  #cite(label("DCKKMO2026Rotation")). Even sign moments depend only on loops that separate at least two distinct
  pairs of endpoints. These loops are macroscopic, and the bijection preserves their winding differences up to one
  harmless sign per loop. This supplies the endpoint symmetry input for the whole-plane six-vertex field theorem
  #cite(label("SixVertexGFF2026")), including the multiplicities that a loop-set distance alone would not
  determine. Section 17 combines binary transport and reflection positivity with the whole-plane height input to
  control double contacts. The error estimates are relative to the square of the four-arm probability;
  an absolute error would be insufficient. Section 18 derives the Dirichlet field in regular domains by
  translating separated charge groups and determining the harmonic boundary term.
  Section 19 then treats rough explored pockets by a conditional moment comparison,
  with contour injections at each numerical nesting level and a regular-domain sandwich.
  The final identification verifies locality, thinness, bounded harmonic values,
  and the relevant topology before invoking two-valued local-set uniqueness #cite(label("AruSepulvedaWerner2019"))
  #cite(label("AruLupuSepulveda2020")).

=== 1.5 Conventions on constants and limits <conventions-on-constants-and-limits>

Every theorem is for a fixed $q$. Constants may depend on $q$, macroscopic shapes, positive separations,
  and an explicitly fixed finite set of tests. Mesh limits are taken with those data fixed; auxiliary separations,
  gaps, cutoffs, and localization parameters are removed in the stated order.
  A claim uniform over random exploration histories is made only where the corresponding comparison has been
  proved. In particular, convergence in probability over histories is not replaced by a deterministic estimate for
  every history.

The proof uses established public results at their stated hypotheses.
  It uses no theorem about an annealed random planar map, no random embedding,
  and no transfer from a random-map metric limit to the square lattice.
  The finite Dobrushin experiments and the free infinite-volume experiment are different probability spaces;
  the theorems assert their separate convergence and require no coupling between their samples.

== 2 Tiles, positive laws, and localization <sec:preliminaries>

Except where an endpoint statement is explicitly made, fix $1 lt.eq q < 4$ and write

#[#set math.equation(numbering: n => "(2.1)")
 $ d = sqrt(q) = 2 cos lambda \, wide rho = lambda \/ pi \, wide 0 < lambda lt.eq pi \/ 3 . $ <prelim:parameters>]

All constants may depend on this fixed parameter and on the fixed geometric shapes under consideration.
  In particular, none of the estimates below is asserted uniformly as $q arrow.t 4$.

=== 2.1 Tiles and boundary caps <tiles-and-boundary-caps>

We use a square tile array whose corner sites alternate between primal ($sans(P)$) and dual ($sans(D)$) sites.
  The primal lattice consists of the primal diagonals, so its mesh is $sqrt(2)$ times the tile-edge length.
  Rotating the tile coordinates gives the prescribed orientation of the primal square lattice.
  Each tile carries one of the two noncrossing pairings of its four side midpoints, called #emph[ports].
  Pairing around the dual corners declares the primal diagonal open;
  the other pairing declares the dual diagonal open. An #emph[actual color path] uses these open diagonals and
  never uses boundary identifications as edges. A strand has an actual primal path on one side and an actual dual
  path on the other.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2.1, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (2.1, 2.1), stroke: (thickness: 1.2pt, miter-limit: 10))
  arc((0, 1.05), start: -90deg, stop: 0deg, radius: 1.05, stroke: (thickness: 0.8pt, miter-limit: 10))
  arc((1.05, 0), start: 180deg, stop: 90deg, radius: 1.05, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [$sans(P)$], anchor: "north-east", padding: 0.1176cm)
  content((2.1, 2.1), [$sans(P)$], anchor: "south-west", padding: 0.1176cm)
  content((0, 2.1), [$sans(D)$], anchor: "south-east", padding: 0.1176cm)
  content((2.1, 0), [$sans(D)$], anchor: "north-west", padding: 0.1176cm)
  circle((0, 1.05), radius: 0.05292, fill: black, stroke: none)
  circle((1.05, 0), radius: 0.05292, fill: black, stroke: none)
  circle((2.1, 1.05), radius: 0.05292, fill: black, stroke: none)
  circle((1.05, 2.1), radius: 0.05292, fill: black, stroke: none)
  content((1.05, -0.6825), [primal open])
  rect((5.25, 0), (7.35, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((5.25, 0), (7.35, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  arc((6.3, 0), start: 0deg, stop: 90deg, radius: 1.05, stroke: (thickness: 0.8pt, miter-limit: 10))
  arc((7.35, 1.05), start: -90deg, stop: -180deg, radius: 1.05, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((5.25, 0), [$sans(P)$], anchor: "north-east", padding: 0.1176cm)
  content((7.35, 2.1), [$sans(P)$], anchor: "south-west", padding: 0.1176cm)
  content((5.25, 2.1), [$sans(D)$], anchor: "south-east", padding: 0.1176cm)
  content((7.35, 0), [$sans(D)$], anchor: "north-west", padding: 0.1176cm)
  circle((5.25, 1.05), radius: 0.05292, fill: black, stroke: none)
  circle((6.3, 0), radius: 0.05292, fill: black, stroke: none)
  circle((7.35, 1.05), radius: 0.05292, fill: black, stroke: none)
  circle((6.3, 2.1), radius: 0.05292, fill: black, stroke: none)
  content((6.3, -0.6825), [primal closed])
})],
  caption: [Figure 1: The two tile switches. The solid diagonal is an open primal edge; the dashed diagonal records the absent primal edge. The curved arcs specify the pairing of ports and hence the order of strand occurrences when a medial vertex is visited twice. ],
) <prelim:switch-figure>

For topological arguments, draw the two arcs of a switch disjointly within its tile,
  normally to the sides at their ports. This drawing and the straight medial drawing can be parametrized piece by
  corresponding piece, preserving the order of occurrences at a double visit.
  Their uniform distance is at most twice the tile diameter.
  Thus these local changes of drawing disappear in the curve topology of the theorem.

A wall cuts tile connections at ports. Distinct sectors at a wall corner have distinct copies of that corner,
  as on a surface cut open. The end of a finite slit has one sector of angle $2 pi$.
  All shapes in the tile arguments are unions of whole tiles;
  separating repeated boundary incidences by a small thickening leaves their combinatorics unchanged.

Partition each boundary component into intervals of alternating designated wire colors.
  Within an interval, pair the two intervening ports between successive occurrences of the designated color,
  including eligible end vertices. These are the #emph[local caps].
  A genuine change leaves one unmatched port, on the side whose color differs from the change vertex.
  Use the analogous cyclic caps on a boundary component without changes.
  Intervals will always be much longer than one mesh.

A #emph[positive cap completion] joins the unmatched ports around the primal intervals in the added boundary disk.
  Equivalently, wire each primal interval separately, with a dual sea between these wires.
  This adds only boundedly many connections beyond the local caps when the number of changes is bounded.
  It adds no primal identification on a dual interval.

#thm([Lemma 2.1.])[
  (The positive loop law).  #emph[On a genus-zero tile surface with positive cap completions,
    the switch weight $d^ell$, where $ell$ counts completed medial loops,
    is proportional to the critical FK weight with the corresponding boundary partition.
    Conditional laws on common subdomains are therefore FK laws with induced partitions.
    The same assertion holds after interchanging the colors. On a torus without caps the two weights differ by a
    factor bounded in terms of $q$ alone.]
] <prelim:loop-law>

#proof[
  Draw noncrossing exterior primal trees realizing the designated identifications and thicken the resulting open
    primal graph. Its perimeter is the medial loop collection, apart from a fixed number of exterior components.
    Euler’s formula gives the configuration-dependent part of the perimeter count as
  $ ell = 2 k_xi \( A \) + \| A \| + upright("constant") . $
  Since $d^2 = q$ and $p_q \/ \( 1 - p_q \) = d$, the weights agree up to a constant independent of $A$.
    The domain Markov property gives the conditional-law statement.
    On a torus the thickened graph has Euler characteristic $\| V \| - \| A \| = 2 k - ell - 2 g$, with $g lt.eq
    1$, so the additional factor is bounded. ◻
]

=== 2.2 Crossing estimates and finite plane loops <crossing-estimates-and-finite-plane-loops>

We use two distinct crossing inputs. The buffered bulk box-crossing theorem for canonical weights on doubly
  periodic isoradial graphs applies for $1 lt.eq q lt.eq 4$ #cite(label("DCLM2019Isoradial")) Theorem 1.1.
  Square rhombi have canonical odds $sqrt(q)$, so this includes our square lattice.
  For example, for fixed $a > 0$, horizontal crossing of $\[ - a n \, a n \]
  times \[ - n \, n \]$ inside $\[ - \( a + 1 \) n \, \( a + 1 \) n \]
  times \[ - 2 n \, 2 n \]$ has probability bounded away from zero and one,
  uniformly in the boundary partition on the larger rectangle.
  The same theorem gives equality of the free and wired infinite-volume laws.
  Hence planar duality at these self-dual odds preserves the plane loop law,
  including when a tile translation exchanges the two colors.

When a crossing must reach a domain wall, we use the stronger theorem for critical square FK with $1 lt.eq q < 4$:
  a discrete simple-polygon quad of bounded extremal distance has an actual open crossing with probability bounded
  away from zero, uniformly in its boundary partition #cite(label("DMT2021Fractal")) Theorem 1.2.
  We do not apply this statement at $q = 4$. FKG and the domain Markov property apply because $q gt.eq 1$;
  duality supplies the corresponding statements for the other color.

Here is the concrete wall application needed below. A tile-coordinate rectangle contains a nearest-neighbor quad
  of either color graph with staircase sides within boundedly many mesh layers of its boundary.
  For bounded aspect ratio its discrete extremal distance is bounded:
  there are order its width in mesh units disjoint zigzag paths,
  each of length at most a constant times its length; distributing a unit flow among them bounds the resistance.
  The geometric staircase quad likewise has bounded modulus.
  At an electrode on a wall, the last crossing vertex can be connected to a wall vertex of the same color using
  boundedly many fresh edges. Conditional finite energy bounds the extra cost below uniformly.
  Keep the electrode away from the ends of its designated wall interval.

Crossings in a buffered piecewise rectangular corridor follow by using strips of width a fixed fraction of its
  clearance and overlapping end squares. Transversal crossings in these squares join successive longitudinal
  crossings; FKG combines the finitely many requirements of one color.
  This constructs wall-to-wall paths in annular sectors with openings $pi \/ 2 \, pi \, 3 pi \/ 2 \, 2 pi$,
  including between the two banks of a slit, as well as circuits in a full annulus.
  Different colors in tile-disjoint sectors can be imposed successively by their conditional lower bounds.
  All paths here are actual paths. Radii may use tile sup-norm rims,
  and all buffers have fixed relative width and sufficiently large fixed mesh width.

#thm([Lemma 2.2.])[
  (Finiteness in the plane).  #emph[For every $1 lt.eq q lt.eq 4$,
    all medial strands of the specified free infinite-volume square FK law are almost surely finite loops.
    Finite deterministic surgeries admit positive normalized loop laws with the FK conditional laws of Lemma 3.]
] <prelim:finite-loops>

#proof[
  Buffered bulk crossing gives a conditional probability bounded below for an actual primal circuit around any
    fixed box in each of successively separated annuli. The probability of missing the first $m$ such screens is
    at most $\( 1 - c \)^m$, regardless of the exterior partition.
    The same argument gives arbitrarily large actual dual circuits.
    These two colors of screens prevent a medial strand meeting the box from escaping to infinity.
    Taking the countable union over boxes proves finiteness.
  A surgery at finitely many tile connections changes only finitely many loops at a fixed mesh.
    Relative to the unmodified plane law, its weight ratio is $d^(Delta ell)$,
    bounded above and below by constants that may depend on this finite set of connections.
    Normalization defines its positive law. Equivalently, exhaust by planar domains;
    the same circuit argument makes the local completion independent of remote boundaries.
    Lemma 3 then gives the conditional law. ◻
]

=== 2.3 Comparison through a collar <comparison-through-a-collar>

#thm([Lemma 2.3.])[
  (Bounded densities across a collar).  #emph[Suppose two positive laws have the same graph in a collar between
    radii $r$ and $16 r$. In this collar the graph is a full annulus,
    or a bounded number of sectors separated by straight coordinate walls; coincident slit banks are allowed.
    Their deterministic wire portions agree there. Only boundedly many wire blocks traverse the collar,
    and no other identifications jump it. One radial side faces an arbitrary unknown partition,
    whereas the graph and deterministic wires toward the other side are fixed.
    The marginal densities on edges beyond that other side are mutually bounded by a constant independent of scale
    and of the far graph. Equivalently, their expectations of every nonnegative remote function are comparable
    with this same constant.]
  #emph[The conclusion also holds for a fixed-shape rectangular bulk collar shielding a long box,
    with a constant depending on its shape.]
] <prelim:collar>

#proof[
  First work on a finite graph and a finite remote edge set.
    Split each through wire transversally, preserving its connections on each side and retaining just one
    representative connection across the cut. The unknown data induce a partition $xi$ at their section.
    Include all common deterministic wires for every choice of $xi$.
  For two ordered partitions, the likelihood ratio of the coarser law to the finer law is increasing:
    the rank of the additional identifications decreases as open components merge.
    Its marginal likelihood ratio on the remote set remains increasing,
    by the domain Markov property and conditional FKG. Consequently its maximum is attained at the all-open
    configuration and its minimum at the all-closed configuration.
    It is enough to compare those two events for the maximal and minimal partitions;
    every other partition lies between them.
  An actual primal crosscut in every sector, or a primal circuit in the annulus,
    screens the remote graph with uniformly positive probability.
    Such screens can be discovered from the unknown side without examining edges strictly beyond them.
    In a sector, explore all actual dual paths from its unknown-facing arc and query edges incident to the reached
    dual vertices. If a primal wall-to-wall crossing exists, the search does not reach the remote arc.
    The elementary complementary crossing alternative then places a blocking primal path among the queried edges:
    otherwise, setting the unqueried primal edges closed would produce a dual crossing.
    The alternative follows by tracing the perimeter of the actual component reachable from the starting side;
    corner gap vertices belong to the arcs when their color permits.
    The annular version is the alternative between a primal circuit and a radial dual connection.
    Perform the searches in a subcollar leaving space before both sections.
    Reversing colors gives the dual searches as well.
  Condition on a successful primal search under the minimal law. Each screen is already connected.
    Joining all screens and the bounded number of through-wire representatives requires only boundedly many
    additional block identifications. Each has an unnormalized weight ratio in $\[ q^(- 1) \, 1 \]$,
    hence changes expectations by a bounded density factor. The resulting partition dominates every partition
    transmitted from the unknown side. In particular it dominates the maximal law restricted at this same screen
    geometry, without requiring that law to contain the screen.
    The positive probability of the search proves the desired comparison of all-open probabilities.
  For all-closed probabilities, make the actual dual searches under the maximal law.
    No actual primal path crosses these screens. Only the boundedly many through-wire representatives can still
    transmit ties; remove these ties at bounded cost. The resulting free cut is stochastically smaller on the
    remote graph than any other imposed cut partition, including the restriction of the minimal law.
    This proves the decreasing-event comparison. The extremal likelihood-ratio argument now gives the assertion
    for every remote event and every nonnegative remote function. Exhaustion proves the infinite-exterior version.
    For a rectangular bulk collar use the corresponding enclosing-circuit searches. ◻
]

#thm([Lemma 2.4.])[
  (Relative comparison).  #emph[Under the hypotheses of Lemma 5,
    suppose successive collars have one of the following geometries:]
  + #emph[a full annulus, or one sector whose through wires are precisely continuous primal wire portions along
    its side rays;]
  + #emph[two sectors, with primal wires along both side rays of one sector and no through wires in the other,
    and no further fixed contacts between the sectors.]
  #emph[After $m$ further collars of a sufficiently large fixed radius ratio,
    the remote expectations of every fixed nonnegative function under two possible unknown-side laws have ratio
    $1 + O \( \( 1 - c \)^m \)$, or both expectations vanish.
    The conclusion holds in either radial direction, also after positive modifications or tilts supported on the
    unknown side.]
] <prelim:relative-collar>

#proof[
  Use a radius ratio such as $256$ to leave two subcollars of the preceding type.
    Lemma 5, applied nearer the unknown side, gives a common marginal part of uniformly positive mass on the other
    subcollar. Couple those configurations identically on a fixed fraction of a reference marginal.
    In case (i), additionally impose a primal screen meeting and joining every through wire.
    In case (ii), impose a primal screen on the wired side and a dual screen on the other side.
    These requirements have uniformly positive conditional probability.
    On their occurrence the partition transmitted to the next section depends only on the shared configuration:
    every route through the unknown region must enter and leave through a primal screen already connected to its
    through wires, and the other sector transmits no primal connection.
  For a nonnegative remote function, take the largest and smallest expectations over partitions at each successive
    section. Conditioning nests these intervals of possible expectations.
    The common part just constructed contracts their difference by a factor $1 - c$.
    Their ratio is bounded initially by Lemma 5; iterating therefore gives the stated relative estimate.
    A positive unknown-side tilt is a mixture over the same partitions.
    In particular, when propagating away from a gap, wire connections made or lost inside that gap belong to the
    unknown partition, which explains the need for both colors of screen in case (ii). ◻
]

=== 2.4 Passages and positive local tilts <passages-and-positive-local-tilts>

Raw strands use only tile switches and stop when they reach a wall port.
  A passage count in a buffered annulus counts disjoint strand passages through its prescribed inner and outer
  rims; the outer buffer allows cropping at both rims.

#thm([Lemma 2.5.])[
  (Exponential passage moments).  #emph[In any fixed buffered annulus or sector of the preceding types,
    a raw passage count $X$ satisfies
#[#set math.equation(numbering: n => "(2.2)")
 $ bb(E) \[ exp \( B X \) divides upright("exterior") \] lt.eq C_B wide \( 0 lt.eq B < oo \) \,
   $ <prelim:passage-moment>]

 uniformly in scale and in exterior states inducing the specified graph and arbitrary boundary partition.
   The same holds for a fixed finite family of macroscopic passage counts in a fixed geometry.]
] <prelim:passages>

#proof[
  First obtain one positive exponential rate. Disjoint simple radial strand subarcs split a slightly cropped
    annulus into ordered strips. Along each passage is an actual primal crossing path.
    Paths in distinct strips cannot join in the cropped graph,
    because open primal edges cannot cross the intervening medial separators.
    Choose the endpoint rim bands strictly inside the region traversed by the separators.
    Thus $X$ passages force at least $X \/ 2 - O \( 1 \)$ different crossing components in the actual cropped graph.
  Explore complete actual components successively from one rim,
    ignoring all external identifications when deciding membership in a component.
    After a component is removed, its incident unexplored boundary edges are closed.
    The surviving FK law is dominated by full wiring at the original rims and walls;
    removing vertices can only decrease actual crossings. Even with this full wiring an actual dual blocker across
    the cropped annulus has probability at least $c > 0$. Conditional on every successful discovery,
    the chance of another crossing is therefore at most $1 - c$.
    The number of components has a geometric tail, proving (2.2) for one $B > 0$.
  To obtain any fixed rate, divide the radial distance into $J$ separated slices of thickness comparable to $r \/
    J$. Cover a middle rim in each slice by $O \( J \)$ small boxes whose buffered annuli remain within the slice.
    Use wall-centered boxes near a straight wall and smaller bulk boxes elsewhere,
    counting the two sides of a wall separately. The overlap graph has a bounded coloring independent of $J$.
    Every original passage crosses one small annulus in each slice, so
  $ J X lt.eq sum_i X_i \, $
  with $O \( J^2 \)$ counts having the first exponential bound.
    Conditional iteration within each color class, followed by Hölder across the bounded number of colors,
    gives a rate $c' J$. Choose $J$ arbitrarily large but fixed.
    Before these boxes fit in the mesh, a deterministic finite-size bound suffices.
    A finite covering by bulk, straight-wall, and corner buffers gives the macroscopic version:
    a strand segment of the designated diameter must leave one box of an inner cover whose outer buffer is much
    smaller than that diameter. ◻
]

Let $N_j$ count raw nests wholly inside radius $r_j$, where the radii are dyadic and the local sector geometry
  extends beyond the largest radius by a buffer. A nest is a closed loop surrounding a bulk site,
  or an arc joining the opposite side rays around a boundary gap, corner, change, or slit tip. Then

#[#set math.equation(numbering: n => "(2.3)")
 $ 0 lt.eq N_j - N_(j - 1) lt.eq X_j \, $ <prelim:nest-increments>]

where $X_j$ is a finite family of passage counts in a band near $r_j$.
  Its buffer is disjoint from $B_(r_(j - k))$ for a fixed $k$.
  Indeed a newly included nest either travels a fixed fraction of the radius or goes around the point within the
  band. At a slit tip, reaching the other bank without approaching the tip requires traversing the full-angle
  sector. Small-box coverings away from the center give the asserted $X_j$.
  Start the levels at a fixed mesh radius so the initial count is bounded.

#thm([Lemma 2.6.])[
  (Local tilt bounds).  #emph[For fixed $b > 0$, put
$ F_j = bb(E) b^(N_j) \, wide d nu_j = F_j^(- 1) b^(N_j) thin d bb(P) . $

 The ratios $F_j \/ F_(j - 1)$ are bounded above and below uniformly.
   Under $nu_j$, the shell counts $X_i$ at and beyond the outer tilt level, $i gt.eq j$,
   have all fixed exponential moments uniformly bounded. The assertions remain conditional on exterior data of the
   specified geometry and allow adjoining a fixed family of passage counts with buffers at or beyond that level.]
] <prelim:tilts>

#proof[
  The case $b = 1$ is Lemma 7. For $0 < b < 1$, set $D_i = log \( F_(i - 1) \/ F_i \) gt.eq 0$.
    Jensen’s inequality and the exponential bound give, for any sufficiently small fixed $epsilon > 0$,
  $ D_i & lt.eq \| log b \| thin bb(E)_(nu_(i - 1)) X_i\
 & lt.eq epsilon log bb(E)_(nu_(i - 1)) exp #scale(x: 120%, y: 120%)[\(] \| log b \| X_i \/ epsilon
   #scale(x: 120%, y: 120%)[\)]\
 & lt.eq C_epsilon + epsilon sum_(i - k < l < i) D_l . $
  In the last inequality, drop decreasing factors back to level $i - k$.
    The remaining tilt is supported outside the buffer of $X_i$, so the conditional passage bound applies.
    Choose $epsilon \( k - 1 \) < 1$; induction bounds every $D_i$.
    Dropping the same bounded number of levels then proves every asserted exponential moment.
  For $b > 1$, choose $B > k log b$ as large as desired and induct on $j$ that $bb(E)_(nu_j) e^(B X_i) lt.eq
    C_(*)$ for $i gt.eq j$. When $i gt.eq j + k$, the tilt and the buffer are disjoint.
    Otherwise let $j_0 = i - k < j$. The normalizing increment from $j_0$ to $j$ is at least one, so
  $ bb(E)_(nu_j) e^(B X_i) lt.eq bb(E)_(nu_(j_0)) exp (B X_i + \( log b \) sum_(j_0 < l lt.eq j) X_l) . $
  Give each summand in the sum Hölder weight $log b \/ B$ and use the inductive bound at the earlier tilt $j_0$.
    The remaining Hölder factor is an exponential moment of $X_i$ at a larger fixed rate,
    whose buffer is disjoint from the tilt at $j_0$. The right side is at most $C C_(*)^(k log b \/ B)$,
    which closes the induction for sufficiently large $C_(*)$. Negative levels mean no tilt.
    The moment bounds give the ratio bounds using (2.3). The argument is unchanged after adjoining the indicated
    passage counts. ◻
]

Consequently the expectations of these local weights and their fixed powers have logarithms of size
  $O \( log n \)$ up to radius $O \( n^C \)$ in mesh units.
  Changing a cutoff radius by a fixed factor costs a bounded ratio.
  Spatially separated local tilts can be treated successively by conditioning on their disjoint patches,
  or by Lemma 5. Finally, log convexity between a given power and twice that power shows that increasing the power
  by $epsilon$ costs only $n^(O \( epsilon \))$.

#thm([Lemma 2.7.])[
  (Absorbing macroscopic errors).  #emph[Suppose $Y_n gt.eq 0$, $bb(E) Y_n gt.eq n^(- A) \/ C$,
    and $bb(E) Y_n^2 lt.eq C n^A$, whereas $X_n gt.eq 0$ has uniformly bounded exponential moments at every fixed
    rate. For fixed $C_0 gt.eq 1$ and every $epsilon > 0$,
$ C_epsilon^(- 1) n^(- epsilon) lt.eq frac(bb(E) \[ Y_n C_0^(plus.minus X_n) \], bb(E) Y_n) lt.eq
  C_epsilon n^epsilon . $

]
] <prelim:absorb>

#proof[
  Choose $eta > 0$ so that $eta log C_0 < epsilon$ and split at $X_n = eta log n$.
    On the first event the multiplicative factor lies between $n^(- epsilon)$ and $n^epsilon$.
    Cauchy–Schwarz and the exponential moment bound at an arbitrarily large fixed rate make both
    $bb(E) \[ Y_n \; X_n > eta log n \]$ and $bb(E) \[ Y_n C_0^(X_n) \; X_n > eta log n \]$ smaller than any
    prescribed inverse power after accounting for the polynomial second moment.
    Choose that power larger than $A + 1$. Division by the stated lower bound for $bb(E)
    Y_n$ proves both estimates, enlarging constants for bounded $n$. ◻
]

=== 2.5 Comparing slit partition functions <comparing-slit-partition-functions>

#thm([Lemma 2.8.])[
  (Surface partition comparison).  #emph[Let finitely many straight finite wall segments have fixed macroscopic
    shapes and positive mutual separation. Complete each as a positive isolated boundary slit.
    Let $Z_s$ be its partition function relative to the unmodified plane law,
    and $Z_(upright("all"))$ the corresponding partition function with all slits. Uniformly in the mesh,
#[#set math.equation(numbering: n => "(2.4)")
 $ Z_(upright("all")) asymp product_s Z_s . $ <prelim:surface-factorization>]

 Reversing every cap-wire polarity on both banks of a straight isolated segment with boundedly many changes alters
   $Z_s$ by a bounded factor. The same comparison holds for a segment and its image, with transported cap data,
   under a symmetry of the homogeneous tile lattice, with the two color names exchanged when the symmetry
   exchanges the color lattices.]
] <prelim:surface>

#proof[
  Enclose each segment in its own patch with a vacant bulk tile collar and room for a further disjoint buffer.
    Let $X_s$ be a passage count through that collar. Compare the incremental loop change $Delta
    ell_s$ of the slit surgery with $Delta ell_s^compose$ computed after closing the patch ports by the same
    arbitrary pairing before and after the surgery. Their difference is $O \( X_s \)$.
    To see this, cut the segment ports. The background pairing is determined within the patch except for ends
    whose strand first traverses the collar. There are $O \( X_s \)$ such ends,
    and changing their pairing changes either completed cycle count by at most their number,
    also when other surgeries have been made outside.
  Put $G_s = d^(Delta ell_s^compose) upright(bold(1))_({ X_s lt.eq K })$.
    For fixed sufficiently large $K$, simultaneous truncation has probability bounded below under the normalized
    law with all completed slits, by Lemma 7. On the truncated event the surgery weights and their local versions
    are comparable. Therefore
  $ Z_(upright("all")) asymp bb(E)_0 product_s G_s \, wide Z_s asymp bb(E)_0 G_s \, $
  where $bb(E)_0$ is the unmodified plane expectation. Apply Lemma 5 successively to the separated patch factors
    to obtain (2.4).
  Translate an isolated segment by one tile step in its tangent direction.
    This is a symmetry of the homogeneous plane loop law, with duality interchanging the colors when needed.
    Its shifted local caps agree with the reversed caps except at boundedly many ports near tips and changes.
    Their remaining pairings differ on only boundedly many ends, which has bounded cycle-count cost.
    Applying such a lattice symmetry to the isolated slit and its cap data gives the last assertion.
    This is a comparison of partition functions; it does not assert bounded pointwise density for changing all
    pairings along a wall. ◻
]

== 3 Logarithmic short-distance comparisons <sec:exponents>

Only the strict range $1 lt.eq q < 4$ is considered in this section.
  We require inequalities between logarithmic costs, not the existence of limiting critical exponents. Put

#[#set math.equation(numbering: n => "(3.1)")
 $ Delta = frac(pi, 2 lambda) - 3 / 2 \, wide s = Delta + 1 \, wide t = - Delta \, wide f \( g \) =
   frac(sin \( \( 2 - g \) lambda \) sin \( \( 1 + g \) lambda \), sin \( 2 lambda \) sin lambda) . $ <exp:parameters>]

In the local experiments below, the cutoff radius is comparable to $n$ in mesh units,
  the specified local geometry extends beyond it by a fixed buffer,
  and the exterior has any fixed compatible positive completion.

=== 3.1 Local costs and their conventions <local-costs-and-their-conventions>

At a flat change of wire color, let $P \( n \)$ be the logarithm of the probability of an actual arm of the gap
  vertex’s color reaching the cutoff radius. Let $N$ count raw arcs straddling the change,
  from one side ray to the other, wholly inside that radius, and set

$ D_(*) \( n \) = log bb(E) \[ d^N \] . $

At a corner without a wire flip, write $i = 0$ if the gap color agrees with the designated wire color and $i =
  1$ otherwise. For a convex right-angle corner and a reentrant right-angle turn respectively, define

$ C_i \( n \) = log bb(E) \[ f \( 1 \/ 2 \)^(N \/ 2) \] \, wide L_i \( n \) =
  log bb(E) \[ f \( - 1 \/ 2 \)^(N \/ 2) \] \, $

where again $N$ counts local straddling raw arcs. Finally, at a bulk vertex,
  let $N$ count closed raw nests surrounding it and set

#[#set math.equation(numbering: n => "(3.2)")
 $ F_plus.minus \( a \; n \) = bb(E) \[ u_plus.minus \( a \)^N \] \, wide u_plus.minus \( a \) =
   frac(cos \( \( 1 plus.minus a \) lambda \), cos lambda) \, $ <exp:bulk-weights>]

for fixed

#[#set math.equation(numbering: n => "(3.3)")
 $ 0 < a < 1 \, wide \( 1 + a \) lambda < pi \/ 2 . $ <exp:charge-range>]

We usually suppress $n$. In particular, $D_(*) gt.eq 0$, $C_i gt.eq 0$, and $L_i lt.eq 0$:
  comparing the products of sines at their common mean gives $f \( 1 \/ 2 \) > 1$ and $0 < f \( - 1 \/ 2 \) < 1$.

#thm([Lemma 3.1.])[
  (Local conventions and strict arm decay).  #emph[Changing a cutoff radius by a fixed factor,
    changing the fixed compatible exterior completion, applying a tile-lattice symmetry to the experiment,
    or interchanging both color names and wire designations changes each of these logarithms by $O \( 1 \)$.
    The expectations of the local weights, their fixed powers,
    and the same arm indicator have logarithms of size $O \( log n \)$. For some $c > 0$,
#[#set math.equation(numbering: n => "(3.4)")
 $ P \( n \) lt.eq - c log n + O \( 1 \) . $ <exp:strict-arm>]

]
] <exp:local-costs>

#proof[
  For nest weights these claims, apart from the signs already noted, are Lemmas 5 and 8.
    Symmetries of the local loop weights and caps give the geometric and color symmetries.
    At a flat change reflection exchanges the two assignments relative to the gap color.
    Bending or erasing distant cap connections changes only the possible exterior partition.
  We give the arm argument because it concerns actual connectivity.
    In a tile half-box, boundary regions separated by raw boundary-to-boundary arcs are precisely the actual color
    components touching boundary gaps. Closed interior loops cannot split these boundary classes.
    If the region at the marked gap does not reach the outer rim,
    some raw arc with both ends on the flat wall straddles the gap.
    One way to see this is to form the tree of regions separated by the disjoint arcs.
    The wall and rim walks both traverse the tree path between their common end regions.
    A wall visit to a region absent from the rim excursion is entered and left across the same separating edge
    within the wall portion. Conversely, a straddling arc cuts off the gap and its actual color paths.
    Thus absence of all straddling arcs inside radius $r$ forces an arm to a comparable radius,
    and an arm to a larger fixed multiple excludes all such arcs.
  Arm probabilities at constant multiples of a radius are comparable.
    Given the shorter arm, impose a same-color wall-to-wall screen in an intermediate annulus and a crossing from
    its inner side to the desired outer radius. The arm meets the screen and the added crossing meets it;
    FKG and the wall crossing estimates give a uniform extension cost.
    The construction is valid under arbitrary distant boundary data.
    Starting from a bounded-mesh event and iterating gives a polynomial lower bound.
    Conversely, actual opposite-color screens in separated annuli obstruct the arm and have uniformly positive
    conditional probability. Their iteration gives (3.4). Dual-color requirements use FKG for decreasing primal
    events. No wire identification has been used as an edge of an arm. ◻
]

For clarity, a one-sided error denoted $o \( log n \)$ in an upper bound means an allowance

#[#set math.equation(numbering: n => "(3.5)")
 $ epsilon log n + O_epsilon \( 1 \) quad upright("for every fixed ") epsilon > 0 . $ <exp:error-convention>]

Its constants may depend on all fixed charges and geometric choices.

#thm([Proposition 3.2.])[
  (Three logarithmic comparisons).  #emph[With the definitions above,
#[#set math.equation(numbering: n => "(3.6)")
 $ 2 P + 2 D_(*) + 4 \( C_0 + C_1 \) & lt.eq o \( log n \) \,\
C_0 + C_1 + L_0 + L_1 & lt.eq o \( log n \) \,\
P + sum_j log frac(F_(-) \( a_j \), F_(+) \( a_j \)) & lt.eq o \( log n \) \, $ <exp:rectangle-budget>]

 where the finite list of fixed charges in the last inequality satisfies (3.3) and $sum_j a_j = 1$.]
] <exp:comparisons>

We prove the proposition in three finite auxiliary geometries.
  Their common algebra and cap bookkeeping are recorded first.

=== 3.2 The two winding expansions <the-two-winding-expansions>

Orient every switch strand and, for either global sign, assign the turn weight
  $exp \( plus.minus i rho W \/ 2 \)$, where $W$ is its signed turn.
  Give both switches the common coefficient $sin \( lambda \/ 2 \) \/ sin lambda$ and sum consistent orientations.
  The resulting real arrow tensor is identical for the two signs. Indeed it requires two incoming arrows.
  For adjacent incoming positions only one pairing works and its two turns cancel;
  for opposite positions the two pairing contributions sum to $2 cos \( lambda \/ 2 \)$.
  Thus every finite contraction, with any prescribed boundary spin factors and inserted edge matrices,
  has the same value in these two expansions. Common tile coefficients will always cancel.

Traverse a boundary with the domain on its left. Let $theta_j$ be a lift of its inward normal angle at port $j$,
  continued by the boundary turn at a corner. For spin $c = + 1$ or $-
  1$ according as the arrow points inward or outward, use

#[#set math.equation(numbering: n => "(3.7)")
 $ b_j \( c \) = \( 2 sin lambda \)^(- 1 \/ 2) exp { i c \( rho theta_j \/ 2 + lambda h_j \) } . $ <exp:boundary-spin>]

A raw arc from port $i$ to port $j$ bounding a disk against the intervening forward boundary interval has turn
  $theta_j - theta_i - pi$: close it against that interval, using the normal endpoint tangents.
  Summing its two orientations cancels curvature in the positive-sign expansion and gives

#[#set math.equation(numbering: n => "(3.8)")
 $ w \( h_i - h_j \) \, wide w \( m \) = frac(cos \( \( m - 1 \/ 2 \) lambda \), sin lambda) . $ <exp:arc-weight>]

For the negative-sign expansion set $h'_j = - h_j - theta_j \/ pi$; its weight is $w \( h'_i - h'_j \)$.

Take $h_j = H_j + Delta upright(bold(1))_({ j upright(" high") })$, where $H$ is piecewise constant.
  A port is high if its immediately preceding gap vertex in the interval has the designated wire color.
  Across a wire flip the adjacent ports are both high or both low.
  Since the ports strictly inside a disk arc’s boundary interval pair among themselves,
  its endpoint high statuses are opposite for an even number of flips and equal for an odd number.
  Thus $h_i - h_j$ is the sum of the drops of $H$ plus $r Delta$, where $r =
  plus.minus 1$ for an even number of flips (positive when the first port is high) and $r = 0$ otherwise.
  In the negative-sign expansion, high ports refer to the complementary wires;
  base drops are negated and augmented by the boundary turn divided by $pi$. The identities

#[#set math.equation(numbering: n => "(3.9)")
 $ w \( g + Delta \) = frac(sin \( \( 2 - g \) lambda \), sin lambda) \, wide w \( g - Delta \) =
   frac(sin \( \( 1 + g \) lambda \), sin lambda) $ <exp:staggered-weights>]

give weights $d \, 1$ at zero drop.

#thm([Lemma 3.3.])[
  (Local cap elimination).  #emph[For disk arcs whose boundary intervals contain at most one wire flip,
    their positive cap-loop factors are $d$ for a zero-flip high starting port and $1$ for a zero-flip low
    starting port or a one-flip arc, up to a bounded overall loop-count error and an error $d^(O \( X \))$ for
    remaining macroscopic arcs. A nest of $N$ straddling arcs at a corner of turn $g
    pi$ without a wire flip has negative-expansion weight relative to its caps comparable to $f \( g \)^(N \/ 2)$.]
] <exp:cap-elimination>

#proof[
  Take a family of disk arcs closed under the arcs inside their disks, with no holes,
    and remove them from the inside outward. Removing two adjacent remaining endpoints creates a loop exactly when
    their exterior partners already pair them; otherwise reconnect those partners.
    The caps still pair successive high-low ports on each remaining interval,
    with arbitrary pairings of its unmatched ends. A high-low arc within an interval creates one loop.
    A low-high arc merely transports the pattern. Across a flip,
    equal high statuses transport an unmatched end without creating a loop.
    If two transported unmatched ends were already tied, the extra loop erases an entire remaining interval.
    There are boundedly many such exceptions; also allow the final bounded error for a no-flip circle.
    The unremoved boundary loops are at most the number of remaining arcs.
  Include all sufficiently small arcs, together with arcs inside their disks.
    Any others contribute a macroscopic passage count $X$ in boundary bands.
    Along a local straddling nest the starting parities alternate,
    because ports between consecutive starts pair internally on that side.
    The two relative weights in (3.9) multiply to $f \( g \)$ after division by the corresponding cap weights $d$
    and $1$. One unpaired factor is bounded. This proves the claimed $f \( g \)^(N \/ 2)$ comparison.
    Cutoff patches are disjoint with wider buffers, and a straddling arc omitted because it exits its patch is
    charged to $X$. ◻
]

=== 3.3 A rectangle: the flat-change and convex-corner costs <a-rectangle-the-flat-change-and-convex-corner-costs>

#proof[
  Take a convex tile rectangle with both side lengths comparable to $n$.
    Put a change in the middle of the bottom side and another in the middle of the top side.
    Give $H$ drops $s \, t$ at these changes and no others. Since $s + t =
    1$ and the total boundary turn is $2 pi$, the factors (3.7) are periodic around the contour.
  In the positive-sign expansion, an arc not separating the changes uses an interval containing neither change and
    has its ordinary cap weight. An arc enclosing one change has $w \( s \) = w \( t \) = 1$.
    Closed interior loops have weight $d$. Lemma 13 and Lemma 7 therefore bound the spin partition function above
    by a constant times the positive cap partition $Z_(+)^(upright("cap"))$.
    The latter includes the common tile coefficients.
  In the negative-sign expansion the change drops are $- s \, - t$ and each convex corner contributes $1 \/ 2$.
    An arc containing neither change has an interval containing at most two corners and has positive weight for
    both high statuses. An arc separating the changes can use the interval containing the $s$ mark and $k$
    corners; its weight is $sin \( k lambda \/ 2 \) \/ sin lambda$.
    These weights are nonnegative and vanish exactly for $k = 0$, namely a straddling arc on the bottom side.
    Let $E$ be the event that the $s$-gap vertex has an actual path of its color to another side of the rectangle.
    Every weight is strictly positive on $E$, and the local straddles at $t$ have weight $d$.
    Relative to the cap law with the complementary wires, the spin partition is consequently at least
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(E)_(-)
     [upright(bold(1))_E d^(N_t) product_(v upright(" corner")) f \( 1 \/ 2 \)^(N_v \/ 2) C^(- \( 1 + X \))] .
     $ <exp:rectangle-lower>]
  Here $X$ counts macroscopic boundary passages. For instance,
    choose all small arcs below a fixed diameter fraction so their disks contain at most one feature.
    The cap elimination accounts for those arcs, and remaining factors on $E$ lie in a fixed finite set of
    positive values.
  Without $C^(- \( 1 + X \))$, the expectation in (3.10) is bounded below by a constant times
  $ exp (P + D_(*) + sum_v C_(i \( v \))) . $
  Indeed the separated positive local factors compare conditionally by Lemma 5.
    After conditioning on their small patches, extend the local $s$ arm through a fixed corridor avoiding those
    patches to another side, by the screens and crossing extensions in Lemma 11.
    The remaining law is FK with an induced partition. Lemma 9 loses only $n^epsilon$ upon reinstating the passage
    factor, because all local first and second moments have polynomial cost by Lemma 8.
  Choose odd horizontal tile length and even vertical tile length.
    The four corners then have the same relative gap-versus-wire type,
    since the left and right sides belong to opposite wire intervals.
    Compare the two tensor expansions and repeat on this very same rectangle with every wire polarity reversed.
    The ratios $Z_(+)^(upright("cap")) \/ Z_(-)^(upright("cap"))$ cancel upon multiplication.
    One run has four type-$0$ corners and the other four type-$1$ corners; both have the same $P \,
    D_(*)$ up to bounded changes of local convention. Taking logarithms proves (3.6) with the error convention (3.5). ◻
]

=== 3.4 A long cylinder: balancing the two corner turns <a-long-cylinder-balancing-the-two-corner-turns>

#proof[
  Take a tile cylinder whose spatial period has two positive coordinate components, each comparable to $n$,
    with even sum. In a lift, its lower boundary repeats all the east steps followed by all the north steps.
    The upper boundary is a parallel translated copy at transverse distance of order $K n log n$,
    where $K$ will be a sufficiently large fixed constant. Each boundary has one convex and one concave corner.
    There are no wire flips and $H$ is constant. Use positive caps for the reference laws and free periodic spin
    contraction, with no flux projection, for the tensor. The normal-angle lift is periodic.
  Every same-boundary raw arc bounds a disk against the boundary interval it cuts off.
    Its lifted endpoint interval spans less than one period: otherwise its endpoints and those of a translate
    would interleave, forcing intersecting arcs. Its positive-expansion weights are ordinary cap weights,
    and its negative-expansion drops are $0$ or $plus.minus 1 \/ 2$, so those weights are positive.
    A contractible interior loop has weight $d$. An essential loop has total turn zero and hence weight $2$;
    the zero-turn assertion follows by isotopy of a simple generator in the flat cylinder.
  Reserve bottom and top bands of width $O \( n \)$ containing all boundary features and their enlarged buffers.
    In the empty middle strip let $k_0$ count essential closed medial loops wholly within that strip, and put
  #[#set math.equation(numbering: n => "(3.11)")
   $ M = \( 2 \/ d \)^(k_0) . $ <exp:middle-tilt>]
  It depends only on middle-strip tiles and is at least one. Under either positive cap law,
  #[#set math.equation(numbering: n => "(3.12)")
   $ bb(E) M^p lt.eq n^(O_p \( K \)) wide \( p < oo \) . $ <exp:middle-moments>]
  To prove this, cover the middle strip by $O \( K log n \)$ buffered bulk boxes of size a small fraction of the
    period. Each essential loop supplies a passage, and conditional iteration of Lemma 7 with a bounded coloring
    proves the bound. Essential loops omitted from $M$, macroscopic boundary arcs,
    and other macroscopic loops approaching features are charged to a count $X$ in the enlarged boundary bands.
    This $X$ has all fixed exponential moments uniformly, independently of $K$.
  Let $T$ be the event of a raw arc joining the two boundaries. Then $M = 1$ on $T$, and
  #[#set math.equation(numbering: n => "(3.13)")
   $ bb(P)_plus.minus \( T \) lt.eq C n^(- c K) . $ <exp:through-rarity>]
  Indeed, in each successive transverse band of width comparable to the period,
    actual crossings can form a noncontractible cycle of one color.
    Use a necklace of overlapping strip crossings with transversal joins;
    its buffers are injective on the cylinder. In the lift the connected crossings continue through every
    translate, and their projection contains a noncontractible cycle.
    FKG and crossing estimates give a uniform conditional success probability.
    Such a cycle blocks $T$, so iteration through order $K log n$ bands proves (3.13).
  The positive expansion has absolute partition value at most
  $ Z_(+)^(upright("cap")) thin bb(E)_(+) \[ M C^(1 + X) \] . $
  Off $T$, the negative expansion is positive and its integrand relative to $Z_(-)^(upright("cap"))$ is at least
  $ M product_v f \( g_v \)^(N_v \/ 2) C^(- \( 1 + X \)) \, wide g_v in { 1 \/ 2 \, - 1 \/ 2 } . $
  On $T$, its absolute integrand is bounded by the same local factors times $C^(1 + X)$, without $M$.
    These statements are Lemma 13; through arcs are macroscopic, so their bounded weights are included in $X$.
    Hölder, the polynomial local tilt bounds, and (3.13) bound the possible signed through contribution by
    $n^(- c' K + O \( 1 \))$ relative to its caps.
  Condition on the middle-strip tiles and use the separated feature patches to compare the positive main
    expectation, without its $X$ factor, to
  $ \( bb(E)_(-) M \) exp (sum_(v : g_v = 1 \/ 2) C_(i \( v \)) + sum_(v : g_v = - 1 \/ 2) L_(i \( v \))) . $
  It is bounded below by an inverse power of $n$ whose exponent is independent of $K$, because $M gt.eq 1$.
    Choose $K$ large enough that the through error is negligible.
    Now keep $K$ fixed and apply Lemma 9, using (3.12), to absorb all $C^(plus.minus X)$ factors at an arbitrarily
    small power loss.
  Run the comparison for both choices of the two boundary wire colors,
    then reverse both colors on exactly the same cylinder, cutoffs and middle strip.
    Tensor equality cancels the two ratios of $Z_plus.minus^(upright("cap")) bb(E)_plus.minus
    M$ when the inequalities are multiplied. The two runs together count twice each of $C_0 \, C_1 \, L_0 \, L_1$.
    Taking logarithms and dividing by two proves (3.6). ◻
]

=== 3.5 A charged cylinder: the bulk costs <a-charged-cylinder-the-bulk-costs>

#proof[
  Use a cylinder with straight horizontal boundaries, with even horizontal period comparable to $n$,
    and lower boundary traversed eastward. Put the two flat changes on the bottom, separated by order $n$,
    and no change on top. Place the finitely many bulk points $z_j$ at mutually separated distances of order $n$
    in the bottom band. Their buffered cutoff patches are disjoint;
    make the band wide enough to leave clear corridors nearer the bottom. The height is again of order $K n log n$.
  Draw tile-edge strings from the $s$-gap to each $z_j$ and multiply the spin crossing its string by
    $exp \( - i lambda a_j c \)$, where $c = + 1$ denotes an arrow along the left normal of the oriented string
    step. Use raw drops $s - 1 \, t$ for $H$ on the lower boundary, with total zero, and constant $H$ on top.
    Oriented intersections give the following sign convention:
    in the positive expansion, a string of charge $- a_j$ shifts a boundary disk arc’s cosine argument,
    in units of $lambda$, by $+ a_j$ for a launch in its interval and by $- a_j$ for an endpoint in its disk.
    The boundary child lies to the arc’s right when the arc is followed from the earlier to the later port.
    Thus the local effective bottom drops are $s \, t$; in the negative expansion they are $- s \, - t$, with $a =
    sum_(z_j upright(" in disk")) a_j$ added for the endpoints inside.
  For a boundary disk arc the negative-expansion numerators, over the common denominator $sin lambda$, are
  #[#set math.equation(numbering: n => "(3.14)")
   $ upright("number of enclosed flips") & upright("numerators")\
0 & sin \( \( 2 - a \) lambda \) \, quad sin \( \( 1 + a \) lambda \)\
1 & sin \( a lambda \) quad \[ s \] \, wide sin \( \( 2 - a \) lambda \) quad \[ t \]\
2 & sin \( \( 3 - a \) lambda \) \, quad sin \( a lambda \) . $ <exp:charged-table>]
  The interval spans less than one period, so each change is counted at most once.
    Top boundary disks use the zero-flip row. Since $0 lt.eq a lt.eq 1$ and $0 < lambda lt.eq pi \/ 3$,
    every entry is nonnegative. A vanishing entry always belongs to a child interval containing $s$;
    this includes the additional zero $sin \( 3 lambda \) = 0$ at $q = 1$ in the two-flip row.
    Contractible closed loops in the negative expansion have relative weight $cos \( \( 1 - a \) lambda \) \/ cos
    lambda > 0$; their interior is on the left for counterclockwise orientation.
    The two expansions therefore give the prescribed local weights $u_plus.minus \( a_j \)$.
    Essential loops have positive weight $2 cos \( a lambda \)$,
    where $a$ is the charge separated from the launches, and loops in the empty middle strip have weight $2$.
    Keep $M$ as in (3.11).
  Let $E$ be the event that the $s$-gap vertex connects by actual paths of its color to a noncontractible open
    cycle. Construct that cycle near the bottom, before the conditioned endpoint patches and middle strip.
    Conditionally on those patches and the middle,
  $ bb(P)_(-) \( E divides upright("patches and middle") \) gt.tilde e^P . $
  This follows from the local arm comparison, same-color FKG and crossing extension,
    and the periodic necklace construction used for (3.13). On $E$ no child disk arc can cut off $s$,
    since the noncontractible cycle cannot fit behind it, and there is no through arc.
  Set $U_plus.minus = product_j u_plus.minus \( a_j \)^(N_j)$ and let $Y_plus.minus$ be the spin integrands
    relative to their respective positive cap laws. Local cap and loop counting gives
  $ \| Y_(+) \| & lt.eq M U_(+) C^(1 + X) \,\
Y_(-) & gt.eq M U_(-) C^(- \( 1 + X \)) quad upright("on ") E \,\
Y_(-) & gt.eq 0 quad upright("off ") T . $
  The local $t$-straddles in the negative expansion contribute $d$ each,
    which may be discarded in this lower bound. A loop whose endpoint enclosure differs from a local nest has a
    macroscopic passage near a feature: a contractible disk containing $z_j$ must separate it from the bottom.
    Thus it is charged to $X$, with all cutoffs small compared with the feature separations.
    On the through event $T$ one still has
  $ \| Y_(-) \| lt.eq U_(-) d^(N_t) C^(1 + X) \, wide M = 1 . $
  All these local costs are polynomial and the through probability is $O \( n^(- c K) \)$,
    so choose $K$ fixed and large to dominate the signed through error.
  Conditioning and Lemma 5 compare the separated local factors to $product_j F_plus.minus \( a_j \)$,
    the middle factor to $bb(E)_plus.minus M$, and the event $E$ to its lower arm cost $e^P$.
    Lemma 9 removes the passage errors at $n^epsilon$ cost. Repeat with every wire designation reversed,
    using the same domain, strings, drops, cutoffs and $M$. Equality of the two tensor expansions cancels both cap
    and middle-factor ratios upon multiplying the two comparisons. The resulting inequality is
  $ 2 P + 2 sum_j log frac(F_(-) \( a_j \), F_(+) \( a_j \)) lt.eq o \( log n \) \, $
  which gives (3.6). ◻
]

=== 3.6 The polygon budget <the-polygon-budget>

#thm([Corollary 3.4.])[
  (Balanced corner parities).  #emph[Let a fixed simple rectilinear polygon have $m$ concave and $m +
    4$ convex true corners, with wire changes in side interiors.
    It has tile approximants differing by $O \( 1 \)$ mesh units such that at least $floor.l m \/ 2
    floor.r$ corners of each relative wire type occur in each of the convex and concave sets,
    also after global wire reversal. For these approximants,
#[#set math.equation(numbering: n => "(3.15)")
 $ 3 P + D_(*) + sum_(v thin upright("convex")) C_(i \( v \)) +
   sum_(v thin upright("concave")) L_(i \( v \)) lt.eq 1 / 2 P - 3 / 2 D_(*) + o \( log n \) . $ <exp:polygon-saving>]

 Each fixed family of negative endpoint charges with magnitudes summing to one has total wrong-to-correct local
   logarithmic cost at most $- P + o \( log n \)$.]
] <exp:polygon-budget>

#proof[
  First prescribe the desired relative corner types for one designation.
    There remain at least four spare convex corners, one of which adjusts the parity of the sum of the absolute
    corner parities. If $b_i$ denotes the integer coordinate parity of side $i$, a corner between sides $i -
    1$ and $i$ has parity $p_i = b_(i - 1) + b_i$ modulo two.
    This cyclic system is solvable exactly when $sum_i p_i = 0$ modulo two.
    Choose the side coordinates with those parities within boundedly many mesh units of the prescribed ones.
    For the fixed simple polygon, sufficiently small independent shifts preserve simplicity.
    Global wire reversal just exchanges the relative types.
  Pair the balanced convex and concave sets and apply (3.6).
    If $m$ is even, four convex terms remain; if $m$ is odd, five convex terms and one nonpositive concave term
    remain. Since $C_i gt.eq 0$, Equation (3.6) implies
  $ C_i lt.eq - 1 / 2 \( P + D_(*) \) + o \( log n \) . $
  Paying at most five such terms yields (3.15). With no corner factors, (3.6) alone gives $P + D_(*) lt.eq
    o \( log n \)$, which is the corresponding flat budget. The endpoint-charge assertion is exactly (3.6). ◻
]

== 4 Angular transfer and its two leading modes <sec:angular>

Throughout this section, $1 lt.eq q < 4$, $d = sqrt(q) = 2 cos lambda$, $rho = lambda \/ pi in \( 0 \, 1 \/ 3 \]$,
  $v = pi \/ 2$, and $Q = - e^(i lambda)$. The argument has two parts.
  We first construct a Hilbert space from infinite-plane row correlations and prove an angular estimate there.
  We then identify its scalar products with reflection across diagonal cuts of the physical square array.
  Boundary conditions enter the resulting estimate through the norms of the exterior states.

=== 4.1 Rows, twists, and the estimate <rows-twists-and-the-estimate>

In the spin basis $+ \, -$, set

$ J = mat(delim: "(", 0, 1; 1, 0) \, wide L_(-) = \| - chevron.r chevron.l + \| \, quad L_(+) = \| +
  chevron.r chevron.l - \| \, wide K \( zeta \) = "diag" \( zeta \, zeta^(- 1) \) . $

Here and below twists satisfy $\| zeta \| = 1$. In the ordered pair basis $+ + \, + - \, - + \, - -$, let

#[#set math.equation(numbering: n => "(4.1)")
 $ R \( u \) = mat(delim: "(", a \( u \), 0, 0, 0; 0, b \( u \), 1, 0; 0, 1, b \( u \), 0; 0, 0, 0, a \( u \)) \,
   wide a \( u \) = frac(sin \( lambda - u \), sin lambda) \, quad b \( u \) = frac(sin u, sin lambda) . $ <bulk:R>]

Time and space steps have unit length and angles $alpha_t$ and $omega_j$.
  Their successive sums give a rhombic tile array; initially $0 < omega_j - alpha_t < pi$.
  A spin is positive when its arrow points along the left normal of the corresponding step.
  If $h_0 \, h_1$ are the two time sides before and after advancing in space, and $s_0 \,
  s_1$ the two space sides before and after advancing in time,
  the tile tensor has output indices $\( h_0 \, s_1 \)$, input indices $\( h_1 \, s_0 \)$,
  and value $R \( rho \( omega_j - alpha_t \) \)$.

On a spatial circle of even size $N$, write

#[#set math.equation(numbering: n => "(4.2)")
 $ T_N^D \( alpha \) = "Tr"_c D_c R_(c 0) \( rho \( omega_0 - alpha \) \) dots.h.c
   R_(c \, N - 1) \( rho \( omega_(N - 1) - alpha \) \) . $ <bulk:finite-row>]

The auxiliary index is $c$. At the seam, $D_(x \, y)$ uses the spin $x$ from tile $- 1$ and $y$ from tile $0$.
  Let $Omega_N$ be the positive unit Perron vector of the untwisted rows on the zero-total-spin sector,
  and $Lambda_N \( alpha \)$ their eigenvalue. Normalized rows are $A_N^D \( alpha \) =
  T_N^D \( alpha \) \/ Lambda_N \( alpha \)$. Their common Perron data,
  and the limiting operators $A^D \( alpha \)$, are constructed below.
  In the homogeneous transverse array $omega_j = v$, put

#[#set math.equation(numbering: n => "(4.3)")
 $ P_zeta \( z \) = A^(K \( zeta \)) \( z \) \, wide M \( z \) & = e^(i tau rho z) A^D \( z \) \,\
N \( z \) & = M \( z \) P_zeta \( z \) + P_xi \( z \) M \( z \) \, $ <bulk:MN>]

where

#[#set math.equation(numbering: n => "(4.4)")
 $ zeta \/ xi = Q^epsilon.alt \, quad epsilon.alt in { - 1 \, 1 } \,
   wide \( D \, tau \) = \( L_(-) \, epsilon.alt \) med upright("or") med \( L_(+) \, - epsilon.alt \) .
   $ <bulk:charges>]

#thm([Theorem 4.1.])[
  (Angular transfer estimate).  #emph[Fix a compact interval $I subset \( - v \, v \)$.
    Let $B_(upright("in"))$ be a product of $P_zeta$ rows and $B_(upright("out"))$ a product of $P_xi$ rows,
    at real angles in $\[ - v \, v \]$. Suppose each product contains at least $n gt.eq 1$ angles in $I$.
    Uniformly for $x \, y in \[ - v \, v \]$,
#[#set math.equation(numbering: n => "(4.5)")
 $ parallel B_(upright("out")) N \( x \) B_(upright("in")) parallel & lt.eq C n^(- 1 + rho) \,\
parallel B_(upright("out")) { N \( x \) - e^(i tau \( x - y \)) N \( y \) } B_(upright("in")) parallel & lt.eq
  C n^(- 1 - rho) . $ <bulk:low-estimate>]

 The constant depends on $q$ and $I$. Boundedly many additional pairs of before-twist rows may be inserted
   immediately to the right of $N$, and additional pairs of after-twist rows immediately to its left.
   The two terms in (4.5) may use different such insertions; on each side their counts must be even.
   The constant may depend on a bound for these counts. Multiplication of $D$ by a common scalar multiplies the
   bounds by its absolute value.]
  #emph[The same estimates hold in the physical square array sliced in a diagonal time direction:
    its time angles are $plus.minus gamma_0$, where $gamma_0 = pi \/ 4$,
    and its space angles alternate between $pi - gamma_0$ and $gamma_0$.
    The exterior states may contain any finite number of physical row and spin insertions outside the sandwich.
    A scalar contraction is bounded by the displayed rate times the two reflection norms,
    with the squares centered on a cut included in its reflection kernel.]
] <bulk:angular-estimate>

=== 4.2 Row algebra and the infinite-plane state <row-algebra-and-the-infinite-plane-state>

The finite-dimensional identities used throughout are

#[#set math.equation(numbering: n => "(4.6)")
 $ R_12 \( x - y \) R_13 \( x \) R_23 \( y \) & = R_23 \( y \) R_13 \( x \) R_12 \( x - y \) \,\
R \( u \) R \( - u \) & = \( 1 - b \( u \)^2 \) I \,\
J_c R \( u \)^(t_c) J_c & = R \( lambda - u \) . $ <bulk:YB>]

For completeness, the nontrivial one-minus block of (4.6) is symmetric precisely by the three sine identities

$ b \( x - y \) + a \( x \) b \( y \) = b \( x \) a \( y \) \, wide b \( y \) + a \( x \) b \( x - y \) =
  b \( x \) a \( x - y \) \, $

$ a \( x \) + b \( x - y \) b \( y \) = a \( x - y \) a \( y \) . $

Spin reversal gives the one-plus block; the remaining blocks are scalar.
  The other identities follow directly from (4.1). Sliding the intertwiner in (4.6) through two complete rows
  shows that transfers with a common diagonal twist commute:
  the intertwiner preserves total spin and hence commutes with the tensor square of that twist.
  For arbitrary insertions $D \, E$, the same operation conjugates $D ⊗ E$ by a two-spin intertwiner.
  Expanding the conjugated matrix in matrix units expresses the exchanged rows as a finite sum with new
  insertions. Its coefficients are analytic wherever that intertwiner is invertible.
  Division by the scalar Perron eigenvalues preserves this exchange identity.

For strict angles, the untwisted transfer is primitive on each total-spin sector.
  It has positive diagonal entries; moreover an auxiliary spin can swap with any chosen opposite pair of site
  spins, without swapping at the other sites. Such exchanges connect the sector.
  Commutation therefore gives common positive left and right Perron vectors.
  In the homogeneous array, auxiliary transposition reverses the product in (4.2),
  since the distinct site operators commute. Equation (4.6) then gives

#[#set math.equation(numbering: n => "(4.7)")
 $ A^D \( alpha \)^(*) = A^(J overline(D) J) \( - alpha \) wide \( alpha in bb(R) \) . $ <bulk:adjoint>]

The corresponding finite-volume identity makes the left and right vacua equal.

#thm([Lemma 4.2.])[
  (Plane kernels).  #emph[Finite words of homogeneous normalized strict-angle rows have limiting Gram matrices as
    $N arrow.r oo$. Their quotient and completion give a separable Hilbert space $cal(H)$ with unit vector $Omega$
    and bounded left row actions satisfying
#[#set math.equation(numbering: n => "(4.8)")
 $ parallel A^D \( alpha \) parallel lt.eq 2 parallel D parallel . $ <bulk:row-bound>]

 Bare vacuum coefficients are continuous in strict angles and are unchanged by a common translation of all time
   angles, as long as the translated angles remain in $\( - v \, v \)$.]
] <bulk:plane-kernels>

#proof[
  We first identify the plane state, including the effect of the zero-spin projection.
    Take periodic lists of time and space angles in a strict range,
    with the two direction ranges ordered and transversely separated in a half-circle.
    Use tori whose period sizes are even multiples of the list periods.
    The resulting rhombic square array is embedded and has bounded angles.
    Indeed the cyclic order at each vertex gives local injectivity,
    while averages of runs of either family have uniformly positive length and uniformly transverse directions.
    Thus index distances control Euclidean distances in both directions, giving properness and global embedding.
  Expand each $R$ into its two adjacent-side pairings with oriented turn weight $e^(i rho W \/ 2)$.
    The pairing at the corner between the two positive steps, and at its opposite corner,
    has coefficient $a \( u \)$; the other pairing has coefficient $b \( u \)$.
    For example, the mixed entry follows from $a \( u \) e^(i u) + b \( u \) e^(- i \( lambda - u \)) =
    1$ and its conjugate. In a single-pairing entry the two turns cancel.
    A contractible loop therefore has weight $d$. An essential simple oriented torus loop has total turn zero.
    All essential loops are parallel up to orientation. Their number $k$ is even,
    by the even intersection parities with both period cycles and primitivity of their common homology class.
    The allowed orientation count after projection onto zero spin on either chosen quantum section is
  #[#set math.equation(numbering: n => "(4.9)")
   $ chi = 2^k quad upright("if the intersection is zero") \, wide chi = binom(k, k \/ 2) quad
     upright("otherwise") . $ <bulk:essential-count>]
  Since $d < 2$, there is $c \( d \) > 0$ such that $c \( d \) d^k lt.eq chi lt.eq 2^k$ for every even $k$.
  Replacing $chi$ by $d^k$ gives the canonical isoradial FK law, up to the bounded torus genus factor of Lemma 3.
    To check the parameter, the relative open weight at a primal corner between the positive steps is $sqrt(q)
    thin b \/ a$, and at the other primal corner it is $sqrt(q) thin a \/ b$.
    If $gamma$ is the angle at the primal corner, the odds divided by $sqrt(q)$ are
  $ frac(sin \( rho gamma \), sin \( rho \( pi - gamma \) \)) . $
  This is the canonical weight, with the complementary-angle convention of #cite(label("DCLM2019Isoradial"))
    Theorem 1.1. That theorem applies to these fixed doubly periodic bounded-angle isoradial grids.
    It gives uniqueness and buffered crossing estimates, uniformly over the boundary partition on the outer
    buffer. The bulk passage-count argument of Lemma 7 consequently applies on each such grid.
    No estimate as an angle degenerates is used.
  Here is why the essential-orientation tilt does not change the local limit, even for unbounded aspect ratios.
    Let $r lt.eq R$ denote the shorter and longer period sizes.
    Cover the torus by $O \( R \/ r \)$ buffered boxes of size a small fraction of $r$,
    with a bounded number of disjoint-buffer colors, so that every essential loop crosses one of them.
    Include $O \( R \/ r \)$ translates, by medium periods, of a target annulus about the query.
    Let $Y$ be the sum of the passage counts in this cover. For each fixed $c > 0$, conditional passage moments,
    iteration within each color, and Hölder’s inequality give
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E) e^(c Y) lt.eq e^(C_c R \/ r) \, wide k lt.eq Y . $ <bulk:torus-moment>]
  The density of the tilted law is bounded above by $C e^(c_0 Y)$ before normalization and its normalizing
    denominator is bounded below. Consequently $bb(E)_(upright("tilt")) e^Y lt.eq C e^(C R \/ r)$,
    and Jensen’s inequality gives $bb(E)_(upright("tilt")) Y lt.eq C R \/ r$.
    Translation invariance then bounds the expected count at the target annulus uniformly.
  Condition on the exterior of its inner box. The number of exterior excursions from that boundary to distances
    comparable to $r$ before returning is tight. If it is at most $K$,
    changing the filling can alter only $O \( K \)$ essential loops:
    every affected loop must leave the injective chart along such an excursion.
    The common homology class can change only when no essential loop remains unaffected.
    Thus the ratios of the genus and orientation tilt over all fillings are bounded in terms of $K \, q$.
    For the binomial case this also follows directly by comparing central binomial coefficients with indices
    differing by $O \( K \)$; a switch between the two cases in (4.9) can occur only when there are $O \( K \)$
    essential loops. The conditional inner law is therefore comparable with FK under the induced partition.
    Successive buffered primal and dual circuits show that an arm or medial strand from a fixed window reaches
    toric distances with probability tending to zero under the tilted law as well.
  Now condition outside a large fixed test box containing the query.
    With probability tending to one, no exterior actual cluster or medial path incident to this box reaches toric
    distances. On that event changing its filling leaves both the essential factor and the genus factor exactly
    unchanged. Its conditional law is ordinary FK. Letting the test box grow,
    comparison of increasing cylinder events with free and wired laws and uniqueness identifies the local plane law.
  The same conclusion holds with finitely many marked matrices $D_i$.
    Given the unoriented pairing, the absolute marked orientation ratio is at most $product_i 2 parallel D_i
    parallel$: only marked loops are broken, each newly cut arc has at most two orientations,
    unaffected contractible loops retain weight $d$, and any residual flux constraint has no more orientations
    than the central count in (4.9). When all marked strands stay in a fixed window,
    they do not encounter the distant flux projection. The absence of escaping strands therefore proves marked
    local convergence too.
  Sending the time length to infinity first gives the Perron-normalized coefficient at fixed spatial
    circumference. Sending the circumference to infinity, and diagonalizing the two limits,
    gives the stated plane coefficient. Any finite word can be included in a periodic list;
    unmarked filler rows disappear from its normalized longitudinal vacuum coefficient.
  There is also a transverse quantization. Take a circle in the time index, transfer in decreasing space index,
    and let the auxiliary space spin flow in increasing time.
    The same difference relation makes the untwisted transverse transfers commute and gives common Perron data.
    The seam marks of the original word become one tensor-product quantum insertion.
    Taking cylinder limits in this order shows that its plane coefficient is unchanged when the strict transverse
    angles are changed. Rotating both families and then returning the transverse angles to $v$ proves common
    time-angle translation invariance. Continuity follows from the finite-box FKG sandwich and uniqueness as a
    common finite periodic medium varies; sufficiently large fixed circuits at the limiting medium control long
    marked strands, and all remaining local orientation factors are continuous.
  Finite-volume positivity now gives the limiting Gram form.
    To prove boundedness before completing, let $h$ be a formal word vector and set $T = \( A^D \)^(*) A^D$,
    with the adjoint understood first as the reflected formal row in (4.7).
    The marked expansion bounds $parallel T^j h parallel^2 lt.eq C_h \( 2 parallel D parallel \)^(4 j)$.
    Iterated Cauchy–Schwarz applied to the positive form $chevron.l h \, T h chevron.r$ gives
  $ parallel A^D h parallel^2 lt.eq parallel h parallel^(2 - 2^(1 - m)) parallel T^(2^(m - 1)) h
    parallel^(2^(1 - m)) . $
  Letting $m arrow.r oo$ gives (4.8); the same inequality shows that null vectors remain null.
    Continuity of kernels, and words with rational angles and matrix entries, give separability. ◻
]

We may initially enlarge this construction by finite-position quantum spin insertions and shifts.
  Moving a shift through a word only translates finitely many markings,
  so the same proof gives the enlarged Gram space and bounds. In that space the endpoint rows are already defined by

#[#set math.equation(numbering: n => "(4.11)")
 $ A^D \( v \) = S D_0 \, wide A^D \( - v \) = \( J D^t J \)_0 S^(- 1) \, $ <bulk:endpoint-rows>]

where $\( S sigma \)_j = sigma_(j + 1)$. These formulas follow from $R \( 0 \)$ being the swap and (4.6);
  their vacuum eigenvalue is one. We next show that these endpoints preserve the original cyclic space $cal(H)$.

=== 4.3 A self-adjoint angle generator <a-self-adjoint-angle-generator>

For a formal word $h$, translate all its angles by $t$ and call the result $V_t h$,
  for $t$ in a neighborhood of zero where the word is strict.
  Reflection in its Gram formula negates the angles in the reflected word. Common translation invariance therefore gives

#[#set math.equation(numbering: n => "(4.12)")
 $ chevron.l V_t h \, V_s g chevron.r = chevron.l h \, V_(s + t) g chevron.r $ <bulk:hankel>]

whenever both sides are defined. These curves are continuous.
  If $h$ is null, then $parallel V_t h parallel^2 = chevron.l h \, V_(2 t) h chevron.r = 0$ for small $t$,
  so the translation is locally well defined on actual vectors.

#thm([Lemma 4.3.])[
  (Angle generator).  #emph[There is a self-adjoint operator $B$ on $cal(H)$ such that $V_t h =
    e^(t B) h$ locally for each word $h$. Ordinary strict-angle words form a graph core for $B$.
    Each family $A^D$ extends to a bounded holomorphic operator function on $\| "Re" z \| < v$, with
#[#set math.equation(numbering: n => "(4.13)")
 $ A^D \( x + i b \) = U_b A^D \( x \) U_(- b) \, wide U_b = e^(i b B) . $ <bulk:imaginary-covariance>]

]
] <bulk:boost>

#proof[
  For each word $h$, the function $f_h \( t \) = chevron.l h \,
    V_t h chevron.r$ is continuous and exponentially convex on a sufficiently small interval:
    every permitted Hankel matrix is a Gram matrix by (4.12).
    The interval Bernstein–Widder theorem, in the form of #cite(label("BuescuPaixao2018")) Theorem 3.5 and
    Corollary 3.6, represents $f_h$ as a Laplace transform of a positive measure with finite integrals throughout
    that interval. In particular it is analytic near zero. Inner products of finite differences of $V_t
    h$ are the corresponding differences of $f_h \( s + t \)$.
    Their limits show that all Hilbert-space derivatives $h^(\( k \))$ exist and satisfy
  #[#set math.equation(numbering: n => "(4.14)")
   $ parallel h^(\( k \)) parallel^2 = f_h^(\( 2 k \)) \( 0 \) lt.eq
     C_h \( 2 k \) ! r_h^(- 2 k) . $ <bulk:analytic-vector-bound>]
  The Taylor series recovers the vector curve: this follows by comparing its inner products and its squared norm
    using (4.12).
  On the span of all these derivative vectors, define $B_0 h^(\( k \)) = h^(\( k + 1 \))$.
    The cross versions of (4.12) make this well defined and symmetric.
    More explicitly, if a linear combination of derivatives vanishes,
    its proposed derivative has zero inner product with every word by differentiating the cross identity;
    density makes that derivative zero. The same identity gives symmetry between derivative vectors.
    The domain is dense and invariant. Bound (4.14), also with $k$ replaced by $k + j$,
    implies that every vector in this domain is analytic for this same operator:
    for some $t > 0$ its series $sum_(j gt.eq 0) t^j parallel B_0^j h^(\( k \)) parallel \/ j !$ converges.
    Nelson’s theorem #cite(label("Neeb2011")) Definition 4.7 and Theorem 4.8 therefore makes $B_0$ essentially
    self-adjoint. Denote its closure by $B$.
  Finite differences of ordinary words approximate $h^(\( k \))$ both in norm and after applying $B$,
    by the Taylor series just obtained. Ordinary words are thus a graph core.
    The vector series gives $V_t h = e^(t B) h$ for small real $t$ on each word.
  For fixed $D$, the row family is strongly continuous, by the Gram continuity and uniform bound.
    The word identity $A^D \( x + t \) V_t h = V_t \( A^D \( x \) h \)$ yields, weakly on the graph core,
  $ frac(d, d x) chevron.l g \, A^D \( x \) h chevron.r = chevron.l B g \, A^D \( x \) h chevron.r -
    chevron.l g \, A^D \( x \) B h chevron.r . $
  Integrate this equality and approximate $g \, h$ in graph norm to extend it to $"Dom" B$.
    The extension in Equation (4.13) then satisfies the Cauchy–Riemann equations between domain vectors,
    with continuous partial derivatives. Its uniform bound $2 parallel D
    parallel$ extends weak holomorphicity from that dense set to all vectors,
    hence gives bounded operator holomorphicity throughout the strip. ◻
]

Words whose angles all lie in the middle third $\( - v \/ 3 \, v \/ 3 \)$ already span densely:
  test orthogonality to them and apply analyticity successively in every argument of a word.
  For a fixed twist, analytic continuation of the commuting-row identity and (4.7) gives

#[#set math.equation(numbering: n => "(4.15)")
 $ \[ P_zeta \( z \) \, P_zeta \( w \) \] = 0 \, wide P_zeta \( z \)^(*) = P_zeta \( - overline(z) \) . $ <bulk:P-star>]

Thus this family lies in an abelian von Neumann algebra. Its simultaneous spectral variables can be chosen as
  scalar functions $f \( z \)$, analytic almost everywhere on the strip, bounded by $2$,
  and satisfying $f \( - overline(z) \) = overline(f \( z \))$.
  To obtain one common exceptional set, start with a multiplication representation of the algebra generated by
  countably many arguments in a dense set, and use the norm-bounded Taylor series on countably many discs.
  Covariance (4.13) says that $f \( z \) mapsto f \( z + i b \)$ preserves the spectral measure class.

=== 4.4 Continuation through the two edges <continuation-through-the-two-edges>

#thm([Lemma 4.4.])[
  (Scalar continuation in a fixed band).  #emph[Almost every spectral function $f$ extends analytically and
    without zeros to bands of one fixed positive width about the lines $"Re" z = plus.minus v$.
    It has modulus one on those lines and satisfies $\| f \( z \) \| lt.eq 1$ in the intervening strip.
    At any specified point of the strip, the set of spectral functions vanishing there has measure zero.]
] <bulk:edge-band>

#proof[
  We first obtain a uniform finite-volume vacuum estimate. Temporarily write $T_D \( u \) =
    T_N^D \( v - u \/ rho \)$. For $u$ in a fixed sufficiently small complex disc about zero, both
  #[#set math.equation(numbering: n => "(4.16)")
   $ T_D \( u \) T_I \( u \)^(- 1) \, wide T_I \( u \)^(- 1) T_D \( u \) $ <bulk:division>]
  are holomorphic with norms at most $C parallel D parallel$, uniformly for all sufficiently large $N$.
  To prove the first assertion, multiply by the transfer $tilde(T)_I \( - u \)$ having reversed auxiliary order.
    Fold its auxiliary index $c'$ by transposition. The product is the two-auxiliary partial trace of $\( D ⊗ I \)
    product_j G_j$, in increasing site order, where
  $ G_j = R_(c j) \( u \) R_(c' j) \( - u \)^(t_(c')) . $
  The line spanned by $\| + + chevron.r + \| - - chevron.r$ is invariant in the auxiliary space,
    and on this line $G_j$ is $r \( u \) I$, where $r \( u \) = 1 - b \( u \)^2$, by inversion.
    At $u = 0$ the range of $G_j$ is entirely in that line tensored with the site, by the swap identity.
    In the common triangular decomposition, $G_j \/ r \( u \)$ has identity on this line,
    a complementary diagonal block of norm at most $C \| u \|$, and a bounded off-diagonal block.
    A product of these matrices has uniformly bounded norm, since the off-diagonal block is bounded by a geometric
    series. Its partial trace without $D$ differs from the identity by at most $C \( C \| u \| \)^N$:
    the off-diagonal block has zero partial trace, the line block gives the identity,
    and the remaining diagonal product has the stated norm. This partial trace is invertible on one fixed disc,
    proving the first bound in (4.16). Reversing the product in $G_j$ gives the same argument with the invariant
    covector, proving the second. Crossing gives the corresponding bounds near $u = lambda$.
  The common vacuum is an eigenvector of $T_I \( u \)$ by analyticity,
    and its eigenvalue is nonzero in these discs. Hence $A_N^D \( z \)
    Omega_N$ has a uniform vector bound in discs of a fixed radius about $z = plus.minus v$.
    Pairing with each fixed limiting word, normal-family compactness gives analytic subsequential limits;
    their values on the interior fix them uniquely. The vector norm bound identifies these limits with a bounded
    holomorphic $cal(H)$-valued function. Uniform derivative bounds also give strong convergence at the real
    endpoint to the swap expression (4.11), initially in the enlarged space.
  Now commute this endpoint row through a word with all angles in $\( - v \/ 3 \, v \/ 3 \)$.
    Each exchange uses an intertwiner whose inverse is analytic on one fixed disc about the endpoint,
    independent of the word: the middle-third angle restriction keeps its parameter uniformly away from inversion
    zeros. The exchange expresses the result as a finite sum of bounded interior rows applied to the continued
    vacuum vectors. It follows that the endpoint preserves $cal(H)$ and that $A^D \( z \)
    h$ continues holomorphically on this same disc for every middle-third word $h$.
    Its bound may depend on the word, because the number of exchanges does. This does not alter the radius.
    Strong convergence of interior rows to the endpoint holds first on this dense set and then on all of $cal(H)$,
    by the uniform interior operator bound.
  Choose a countable dense set of middle-third words $h_j$,
    and a finite equivalent measure in the spectral representation of $P_zeta$.
    If $r$ is the common continuation radius, write the continued vector as $F_j \( z \) =
    sum_(k gt.eq 0) a_(j k) \( z - v \)^k$ at the right endpoint. For $r' < R < r$, Cauchy’s estimate gives
  $ parallel a_(j k) parallel_(L^2) lt.eq M_(j \, R) R^(- k) \, wide
    sum_(k gt.eq 0) \( r' \)^k parallel a_(j k) parallel_(L^2) < oo . $
  Since the measure is finite, the corresponding pointwise series of fiber norms is summable almost everywhere.
    Intersect these full-measure sets over the countable core and a countable family of smaller radii.
    We obtain pointwise holomorphic vector series on the same disc for every $j$. The left endpoint is identical.
    On its interior portion the vector equals $f \( z \) h_j$.
    Analyticity consequently makes the continued fiber proportional to $h_j$ everywhere.
    At almost every spectral point at least one vector in the countable dense set is nonzero;
    ratios using any such vector agree on the interior and hence throughout the disc.
    This constructs the scalar continuation with one common radius.
  The swap formulas show that $P_zeta \( v \)$ and $P_zeta \( - v \)$ are unitary inverses.
    Strong boundary convergence and (4.13) give unitary horizontal limits at $plus.minus v + i b$.
    For countably many $b$ within the continuation discs, the scalar value there has modulus one almost
    everywhere. Continuity gives modulus one on each full vertical diameter.
    Schwarz reflection across that diameter now implies $f \( z \) overline(f \( 2 v - overline(z) \)) = 1$,
    and the analogous identity at $- v$, throughout the symmetric disc. Thus there are no zeros there.
    Rational imaginary translations preserve null sets and cover both boundary lines by discs of the same radius.
    This gives the asserted fixed bands.
  The bounded-function maximum principle on the strip gives $\| f \| lt.eq 1$.
    Finally each nonzero analytic $f$ has isolated zeros, so Fubini’s theorem shows that on a fixed vertical orbit
    almost every argument has no zero for almost every spectral function.
    The covariance of the spectral measure class transfers this null-set assertion to any prescribed point of that
    orbit. ◻
]

=== 4.5 Inner factorization and low spectral bands <inner-factorization-and-low-spectral-bands>

Use $w = e^(i z)$ to map $\| "Re" z \| < v$ to the right half-plane.
  We keep the notation $f$ for the resulting function. Lemma 18 says that $f$ is inner,
  continues through every finite nonzero point of the imaginary axis, and that all its zeros satisfy

#[#set math.equation(numbering: n => "(4.17)")
 $ "Re" w_j gt.eq c \| w_j \| $ <bulk:zero-cone>]

for one $c > 0$ independent of the spectral point. The disk factorization and its boundary-spectrum description
  #cite(label("AiDongJiang2019")) pp. 1367–1368, Equations (1)–(2), transported by $\( w - 1 \) \/ \( w + 1 \)$,
  therefore give

#[#set math.equation(numbering: n => "(4.18)")
 $ f \( w \) = eta e^(- a w - b \/ w) product_j beta_j \( w \) \, wide a \, b gt.eq 0 \, quad \| eta \| =
   1 . $ <bulk:inner-factorization>]

Here $beta_j$ is $\( w - w_j \) \/ \( w + overline(w_j) \)$ with the canonical constant phase,
  chosen positive at $w = 1$ when $w_j eq.not 1$. The zeros satisfy the half-plane Blaschke condition $sum_j "Re"
  w_j \/ \( 1 + \| w_j \|^2 \) < oo$. There is no other singular factor:
  analytic continuation across the rest of the boundary excludes singular measure there,
  leaving only atoms at $0$ and $oo$. Under the Cayley map these two atoms give exactly $b \/ w$ and $a w$.

Suppose $- log \| f \( 1 \) \| lt.eq s$, where $s > 0$ is sufficiently small.
  There is then no zero at $1$, and evaluation of (4.18) gives

#[#set math.equation(numbering: n => "(4.19)")
 $ a + b + 1 / 2 sum_j log (1 + frac(4 "Re" w_j, \| 1 - w_j \|^2)) lt.eq s . $ <bulk:zero-budget>]

The cone condition implies, with a fixed constant,

#[#set math.equation(numbering: n => "(4.20)")
 $ a + b + sum_j min { \| w_j \| \, \| w_j \|^(- 1) } lt.eq C s . $ <bulk:small-large>]

Indeed, for $r = \| w_j \|$, the fraction inside the logarithm is at least $4 c r \/ \( 1 + r \)^2$,
  and the resulting logarithm is bounded below by a positive constant times $min \( r \, r^(- 1) \)$.

Choose $c_1 > 0$ sufficiently small. On the half-annulus

#[#set math.equation(numbering: n => "(4.21)")
 $ c_1^(- 1) s < \| w \| < c_1 \/ s \, wide \| arg w \| lt.eq pi \/ 2 \, $ <bulk:annulus>]

$f$ and $f^(- 1)$ are bounded by fixed constants. On the unit semicircle,

#[#set math.equation(numbering: n => "(4.22)")
 $ f \( w \) = f \( 1 \) + O \( s \) . $ <bulk:near-sign>]

To see both assertions directly, (4.20) separates every zero into $\| w_j \| lt.eq C s$ or $\| w_j \|^(- 1) lt.eq
  C s$. For a small zero the ratio $beta_j \( w \) \/ beta_j \( 1 \)$ differs from one by at most
  $C \( 1 + \| w \|^(- 1) \) \| w_j \|$; for a large zero its error is at most $C \( 1 + \| w \| \) \/ \| w_j \|$.
  Their logarithms are summable and uniformly bounded on (4.21), after decreasing $c_1$.
  The exponential factor is controlled by $a \| w - 1 \| + b \| w^(- 1) - 1 \|$.
  On $\| w \| = 1$ the same estimates are $O \( s \)$. This proves the claims, including bounded invertibility.

For a twist $zeta$, define the nonnegative spectral operator

$ H_zeta = - log \| P_zeta \( 0 \) \| \, wide E_zeta \( s \) = upright(bold(1))_(\[ 0 \, s \]) \( H_zeta \) . $

The no-zero assertion of Lemma 18 makes this definition unambiguous almost everywhere.
  Since $P_zeta \( 0 \)$ is self-adjoint, split $E_zeta \( s \)$ further according to its sign,
  denoting these projections by $E_zeta^sigma \( s \)$, $sigma = plus.minus 1$.
  Equations (4.21)–(4.22) say that the compressed $P_zeta$ is boundedly invertible on the half-annulus and

#[#set math.equation(numbering: n => "(4.23)")
 $ P_zeta \( w \) E_zeta^sigma \( s \) = sigma E_zeta^sigma \( s \) +
   O \( s \) quad \( \| w \| = 1 \, med "Re" w gt.eq 0 \) . $ <bulk:sign-approx>]

=== 4.6 Reversal, Laurent modes, and the sandwich <reversal-laurent-modes-and-the-sandwich>

The endpoint formulas give the exact reversal identity

#[#set math.equation(numbering: n => "(4.24)")
 $ M \( v \) + P_xi \( v \) M \( - v \) P_zeta \( v \) = 0 . $ <bulk:reversal>]

For example, if $D = L_(-)$, then $K \( xi \) D K \( zeta \) = \( zeta \/ xi \) D$ and

$ e^(- i tau rho v) \( zeta \/ xi \) = - e^(i tau rho v) . $

The raising case is the analogous computation, with $tau = - epsilon.alt$.
  The identity at $- v$ follows using the inverse endpoint twists.
  Imaginary covariance extends these relations after every common imaginary shift:
  both $M$ terms acquire the same scalar multiplier. Boundary convergence is strong.

Compress $M$ between the low bands of the two twists:

$ M_c \( w \) = E_xi \( s \) M \( w \) E_zeta \( s \) . $

For $"Re" w < 0$ define it from the right half-plane by

#[#set math.equation(numbering: n => "(4.25)")
 $ M_c \( - w \) = - P_xi \( w \)^(- 1) M_c \( w \) P_zeta \( w \)^(- 1) \, wide "Re" w > 0 \, $ <bulk:gluing>]

where the inverses are only on the stated low bands. The two versions of (4.24) give equality on both imaginary
  rays. Uniform bounds and strong boundary continuity allow weak holomorphic gluing,
  for instance by Morera’s theorem on small rectangles crossing the rays.
  Thus $M_c$ is holomorphic on the full annulus (4.21). Throughout it,

#[#set math.equation(numbering: n => "(4.26)")
 $ parallel M_c \( w \) parallel lt.eq C \| w \|^(tau rho) . $ <bulk:Mc-bound>]

Write its Laurent expansion as $sum_(j in bb(Z)) w^j M_(c \, j)$.
  Cauchy estimates on circles near the inner or outer edge give

#[#set math.equation(numbering: n => "(4.27)")
 $ parallel M_(c \, j) parallel lt.eq C \( C' s \)^(\| j - tau rho \|) . $ <bulk:Laurent>]

On $\| w \| = 1$, summing these estimates yields

#[#set math.equation(numbering: n => "(4.28)")
 $ parallel M_c \( w \) parallel & = O \( s^rho \) \,\
frac(M_c \( w \) - M_c \( - w \), 2) & = w^tau M_(c \, tau) + O \( s^(1 + rho) \) \, wide
  parallel M_(c \, tau) parallel = O \( s^(1 - rho) \) . $ <bulk:Mc-small>]

Here the nearest odd integer to $tau rho$ is $tau$; the next possible distance is $1 + rho$.
  This is where $0 < rho lt.eq 1 \/ 3$ is used in the ordering of the relevant exponents.

Refine the left and right low bands by signs $sigma_xi \, sigma_zeta$.
  If the signs agree, (4.25) and (4.23) imply $M_c \( - w \) = - M_c \( w \) +
  O \( s \) parallel M_c \( w \) parallel$ on the unit semicircle.
  By (4.28), its even part is $O \( s^(1 + rho) \)$. On this block,

$ E_xi^(sigma_xi) \( s \) N \( w \) E_zeta^(sigma_zeta) \( s \) = 2 sigma_xi w^tau M_(c \, tau) +
  O \( s^(1 + rho) \) . $

If the signs disagree, the two leading signs in $M_c P_zeta + P_xi M_c$ cancel,
  giving $O \( s^(1 + rho) \)$ directly. Consequently, on the full low bands,

#[#set math.equation(numbering: n => "(4.29)")
 $ parallel E_xi \( s \) N \( x \) E_zeta \( s \) parallel & lt.eq C s^(1 - rho) \,\
parallel E_xi \( s \) { N \( x \) - e^(i tau \( x - y \)) N \( y \) } E_zeta \( s \) parallel & lt.eq
  C s^(1 + rho) . $ <bulk:low-band>]

All real $x \, y in \[ - v \, v \]$ correspond to the closed unit semicircle.
  A product of an even bounded number of extra rows is $I + O \( s \)$ on each sign block, by (4.23).
  Its error multiplied by (4.28) is $O \( s^(1 + rho) \)$. This proves exactly the same conclusions with the extra
  pairs stated in Theorem 15, even if the two terms use different pairs.

To finish the sandwich estimate, decompose each $H_zeta \, H_xi$ into $\[ 0 \, n^(- 1) \]$,
  dyadic intervals above $n^(- 1)$ up to a small fixed threshold, and the remaining interval.
  Schwarz–Pick gives, uniformly for $x$ in the fixed compact interval $I$,

$ 1 - \| f \( x \) \| gt.eq c_I \( 1 - \| f \( 0 \) \| \) . $

One can obtain this directly from the pseudohyperbolic contraction between $0$ and $x$;
  their hyperbolic distance stays bounded on $I$. A band with lower endpoint $u$ below the fixed threshold is
  therefore damped by the $n$ strict steps by $e^(- c n u)$; the remainder is damped exponentially in $n$.
  All other rows are contractions, including the endpoint rows.
  Apply (4.29) or (4.29) with $s$ the larger of the two band upper endpoints. The double dyadic sum of

$ C max \( u \, u' \, n^(- 1) \)^beta e^(- c n \( u + u' \)) \, wide beta = 1 - rho med upright("or") med 1 + rho \, $

is at most $C_beta n^(- beta)$. Terms involving a remainder band use the uniform unrestricted row bound and are
  exponentially small. This proves (4.5) and (4.5) in the homogeneous representation.

=== 4.7 Diagonal cuts and the physical reflection norm <diagonal-cuts-and-the-physical-reflection-norm>

It remains to prove the final assertion of Theorem 15. Work in the diagonal time frame and write

$ gamma_0 = pi \/ 4 \, quad X = e^(- i gamma_0) \, quad Y = e^(i gamma_0) \, quad H = - X \, quad L = Y . $

Space steps alternate $H \, L$, starting with $H$; time steps are $X$ or $Y$. Put $R_(*) = R \( lambda \/ 2 \)$ and let

#[#set math.equation(numbering: n => "(4.30)")
 $ G = product_j #scale(x: 120%, y: 120%)[\(] "swap" R_(*) #scale(x: 120%, y: 120%)[\)]_(2 j \, 2 j + 1) . $ <bulk:G>]

The factors act on disjoint pairs. Each is positive definite:
  its middle block has eigenvalues $1 plus.minus b \( lambda \/ 2 \) > 0$,
  and the two outer entries are $a \( lambda \/ 2 \) > 0$. Use $G$ as the finite-circle metric.
  Directly from the collapsed tiles,

#[#set math.equation(numbering: n => "(4.31)")
 $ T_N^D \( gamma_0 \) = D_(N - 1) S G \, wide T_N^D \( - gamma_0 \) = \( J D^t J \)_0 S^(- 1) G .
   $ <bulk:diagonal-rows>]

Here is the geometry behind both the metric and these formulas.
  The lower slice has vertices $p \, p - X \, p + Y - X \, dots.h$.
  Reflection in the cut through $p$, perpendicular to time, gives upper order $L \, H$.
  For lower spins $\( c_0 \, c_1 \)$ and upper spins $\( d_0 \, d_1 \)$, the intervening square kernel is

$ \( R_(*) \)_(- c_0 \, d_0 \; - d_1 \, c_1) = \( "swap" R_(*) \)_(d_0 \, d_1 \; c_0 \, c_1) . $

Shifting the slice origin by $Y$ or $X$ puts the seam at site $- 1$ or $0$ respectively,
  with reversed conventions in the latter case. Equivalently, every second indexed tile has collapsed.
  A coincident-step tile gives $R \( 0 \)$, the swap; an opposite-step tile gives $R \( lambda \)$,
  which imposes $h_0 = - s_1 \, med h_1 = - s_0$, with weight one.
  Its duplicate sides are therefore spin identifications. The adjoint for the $G$ metric exchanges the two time
  steps and sends $D$ to $J overline(D) J$.

Both untwisted operators $S^(plus.minus 1) G$ are primitive on the zero-spin sector.
  Over a complete shift cycle, paired bonds of both parities are available.
  One can hold every pair or swap a chosen adjacent opposite pair, and such swaps connect the sector.
  The transfers commute, have a common positive right Perron vector, and have the same eigenvalue:
  their relation by $S^2$ and uniqueness make the vector $S^2$-invariant. Their left Perron data are its $G$-dual.
  Normalize the vacuum to unit $G$ norm.

These degenerate indexed arrays are exactly physical square tori;
  they need no limiting estimates for degenerate rhombi. To check this in both quantizations,
  let $p_t$ follow a periodic sequence of $X \, Y$ steps with even period size, and set

$ q_(2 j) = j \( Y - X \) \, wide q_(2 j + 1) = q_(2 j) - X . $

The uncollapsed tiles of the array $p_t + q_j$ biject with the physical squares centered at each time level.
  The collapsed identifications join duplicate physical edges as just described.
  There are no free cycles consisting solely of duplicates:
  each collapsed pair uses a time edge, which by the alternating space pattern is also incident to an uncollapsed
  tile. Hence zero-spin projection on either an unmarked zigzag slice or a periodic time path is precisely the
  corresponding physical flux projection. Marks at the time seam mark that physical path.
  The periods preserve parity and are uniformly transverse,
  so the torus-to-plane argument of Lemma 16 applies directly to these square kernels.

For clarity, the transverse period product is primitive too.
  Prescribe arbitrary zero-sum spin sequences on the time paths $p_t$ and $p_t + m \( Y - X \)$.
  Interpret them as increments of integer heights with consistent sublattice parity,
  periodically bounded on the two lifted paths. Each path is geodesic in the square graph with steps $X \, Y$,
  so its own heights are $1$-Lipschitz. Between the two paths the graph distance is at least $\| m \|$:
  if the time-level difference is $ell$, the two lower bounds are $\| ell \|$ and $2 \| m \| - \| ell \|$.
  Thus for all sufficiently large $\| m \|$ the prescribed heights together are $1$-Lipschitz.
  Extend them by the minimum of the integer distance cones $h \( a \) +
  "dist" \( a \, dot.op \)$ from prescribed vertices $a$. This extension is time-periodic; its parity is fixed,
  so every edge increment is exactly $plus.minus 1$. It gives an allowed spin configuration of positive weight
  across the transfer strip. Therefore a sufficiently large power of either oriented two-space-step transfer has
  all entries positive. The difference relation makes this period product commute with the untwisted transfer at
  strict transverse angle $v$ on the same time chain; the intertwiners involved are invertible.
  They consequently share Perron data. Seam-marked transverse vacuum coefficients agree with those at that strict angle.

Construct the limiting Gram space with the $G$ metric, allowing the two endpoint rows, local site matrices,
  and $S^2$. The adjoint of a site matrix, conjugated by $G$, is still local and bounded.
  The preceding physical cylinder limits and the marked moment argument give the Gram limits and bounded row
  actions. Let $cal(H)_(*)$ be the closed subspace generated by seam words in $A^D \( plus.minus gamma_0 \)$
  alone. Their Gram kernels are the homogeneous transverse kernels, by the adjoint formula,
  the transverse Perron comparison, and then the plane limit.
  Thus $cal(H)_(*)$ identifies isometrically with the subspace of $cal(H)$ generated by those words.

This subspace also contains the physical states required in the theorem.
  It is reducing for $P_1 \( plus.minus gamma_0 \)$. Those operators have dense range there,
  because their adjoints have no kernel by the no-zero assertion at the specified interior angles.
  The finite-row identities give

$ S^2 P_1 \( - gamma_0 \) = P_1 \( gamma_0 \) . $

Both shifts by two therefore preserve $cal(H)_(*)$, first on a dense range and then by continuity.
  Equation (4.31) with arbitrary $D$ similarly shows that site matrices at $- 1$ and $0$ preserve it;
  shifting by two gives every finite site. Every physical edge between tiles lies on a time-level zigzag slice,
  so arbitrary finite physical modifications are such site insertions interleaved with layer transfers.
  They belong to $cal(H)_(*)$. For ordinary homogeneous slicing the same assertion follows from the endpoint
  shifts; several time-edge insertions on a strict row can also be moved to one seam by commuting through finite
  strings of invertible $R$ matrices and expanding their matrix elements.

Finally, reflection in a time-level cut, followed by complex conjugation and arrow reversal,
  matches lower spins to upper spins through the intervening kernel $G$.
  Normalize by the unmarked vacuum, or equivalently by the unit $G$ vacuum and one common Perron factor per layer.
  The squared norm of a lower state is then exactly the vacuum expectation ratio of its reflected configuration.
  Between two cuts, transfer from the lower slice of the first to the lower slice of the second,
  and glue to the reflected future there using $G$. Strings immediately below and above the last cut act on the
  respective states and leave this kernel unchanged. The homogeneous estimate restricted to $cal(H)_(*)$ is
  therefore the asserted diagonal estimate. This completes the proof of Theorem 15.

== 5 Local path calculus for the current <sec:current>

The transfer estimate applies to a lattice current because its path dependence can be removed locally.
  This section proves the needed tensor identities and records the phase bookkeeping when a current is placed
  between two diagonal cuts.

=== 5.1 A path primitive and its deformation rule <a-path-primitive-and-its-deformation-rule>

Direct a simple path $cal(C)$ of tile edges from its initial point.
  Measure each crossing spin using the left normal of the path step.
  At a crossing, a matrix has row index on the right tile and column index on the left tile.
  Lift the tangent angle continuously along a rounded version of the path, starting with a specified lift.
  Define its primitive $cal(J) \( cal(C) \)$ by summing over the choice of one marked step:

- at that step insert $e^(i rho alpha) L_(-)$, where $alpha$ is the lifted tangent angle;
- on all preceding steps insert $K \( Q \)$;
- on all later steps insert the identity.

Thus both strand arrows at the marked crossing point away from it.
  All insertions are additional to the tile tensors. Other primitives and other marked insertions are kept outside
  the deformation corridor, unless their order is explicitly included.

#thm([Lemma 5.1.])[
  (Local deformation).  #emph[In the positive winding expansion, the primitive is invariant, pairing by pairing,
    under simple-path isotopies that continue its initial lift, keep its endpoints in their regions,
    and avoid the other insertions. The statement is a tensor identity for arbitrary outside spins.
    A pure diagonal string obeys the corresponding deformation rule without a source.]
] <cur:deformation>

#proof[
  Draw the strands smoothly and disjointly, with transverse path crossings.
    At a marked crossing use the tangent-angle lift rotated by less than $pi \/
    2$ to the orthogonal crossing direction; this agrees with the lattice convention at a tile edge.
    Sliding the source on its strand while its tangent changes by $b$ changes the sum of the turns of the two
    departing pieces by $- 2 b$. The winding factor is consequently multiplied by $e^(- i rho b)$,
    which cancels the change of the marker gauge. All other spin constraints and prefix factors correspond directly.
  A generic isotopy also creates or removes a pair of crossings at a tangency.
    Terms marked elsewhere are unchanged because the two new diagonal factors cancel.
    The two terms marked at the new crossings cancel one another.
    To check the sign, orient a test tangent $beta$ of the strand approximately in the path direction near
    tangency, so crossings $1 \, 2$ occur in that order both along the path and along this test direction.
    With the source at crossing $2$, let $c_1$ be the signed spin at crossing $1$;
    the strand there travels opposite to $beta$, away from the source. The orthogonalized lifts satisfy
  #[#set math.equation(numbering: n => "(5.1)")
   $ \( alpha_2 - beta_2 \) - \( alpha_1 - beta_1 \) = - c_1 pi . $ <cur:tangency-lift>]
  For example, when the first path tangent is clockwise from $beta$, the offsets are $- pi \/ 2 \, +
    pi \/ 2$ and $c_1 = - 1$; the other case reverses the signs.
    The ratio of the marker gauge times the source-piece winding factors is therefore $e^(- i c_1 lambda)$.
    The extra prefix factor is $Q^(c_1)$, and
  $ e^(- i c_1 lambda) Q^(c_1) = - 1 . $
  The outside constraints and factors of the two terms are identical. This proves the cancellation.
  A generic isotopy has only isolated tangencies of this kind, besides transverse slides,
    and can be chosen to keep all fixed insertions disjoint. This proves the primitive identity.
    For a pure diagonal string, only the first cancellation is needed;
    equivalently it is the tile ice-conservation identity. ◻
]

=== 5.2 Boundary-tree coefficients <boundary-tree-coefficients>

We use the boundary factors from Section 3. For reference, if $theta_j$ is the lifted inward normal at port $j$,
  $h_j$ its real height parameter, and $c = plus.minus 1$ is its inward/outward arrow sign, they are

$ b_j \( c \) = \( 2 sin lambda \)^(- 1 \/ 2) exp { i c \( rho theta_j \/ 2 + lambda h_j \) } . $

Consider a disk, order its boundary from a flat gap $p$, and assume there are no obstructing extra strings.
  Start a path from $p$ toward an interior vertex $z$ with initial tangent lift strictly between the positive
  boundary tangent and that tangent plus $pi$. Every boundary arc bounds a child interval not containing $p$;
  these arcs form the separator tree of the complementary regions.

#thm([Lemma 5.2.])[
  (Tree evaluation).  #emph[For an arc $e : i arrow.r j$ bounding its child interval, put $m = h_i - h_j$ and
#[#set math.equation(numbering: n => "(5.2)")
 $ w_e & = frac(cos \( \( m - 1 / 2 \) lambda \), sin lambda) \, & k_e & = -
   frac(cos \( \( m + 1 / 2 \) lambda \), sin lambda) \,\
a_e & = e^(- i lambda \( h_i + h_j \)) \, & c_(*) & = frac(e^(- i lambda), 2 sin lambda) . $ <cur:weights>]

 For each fixed pairing, the primitive to $z$ is the sum over a marked edge of the separator-tree path from $p$ to
   the region of $z$: use $k_e$ on earlier edges, $c_(*) a_e$ on the marked edge,
   and $w_e$ on every other boundary arc. Unmarked internal loops have weight $d$,
   and a marked closed loop contributes zero.]
  #emph[For a pure $K \( Q \)$ string to $z$, use $k_e$ on the full separator-tree path and $w_e$ off it.
    An internal loop enclosing $z$ then has weight $- 2$ instead of $d$.
    The parity of the number of such loops records the color change from the boundary-tree region to the lattice
    color of $z$.]
] <cur:tree-weights>

#proof[
  By Lemma 19, for each pairing we may choose a simple path crossing minimally the boundary arcs separating $p$
    from $z$, followed, if necessary, by the nested closed loops.
    Such paths exist in the disk regions cut out by the disjoint arcs and loops.
    A sole outward source on a closed loop is inconsistent with the remaining arrow constraints, so it gives zero.
  For a parent-to-child crossing, the boundary-ordered arc travels along the positive normal of the path.
    Let $beta$ be its tangent lift, continued from $theta_i$. The correct lift relation is the exact identity
  #[#set math.equation(numbering: n => "(5.3)")
   $ beta - alpha = pi \/ 2 \, $ <cur:exact-angle>]
  without a multiple of $2 pi$. To verify this, close a simple curve by taking the boundary from $p$ to $i$,
    the arc to the crossing, and the reversed path back to $p$.
    Its positive full turn, with the left right-angle turns at the port and crossing and the short turn at $p$,
    is $beta - alpha + 3 pi \/ 2$. It equals $2 pi$, proving (5.3).
  For an outward source the sum of strand turns is $theta_i + theta_j - pi - 2 beta$.
    Multiplying its winding weight by the two outward boundary factors and by $e^(i rho alpha)$ gives
  $ frac(1, 2 sin lambda) e^(- i lambda \( h_i + h_j \)) e^(i rho \( alpha - beta - pi \/ 2 \)) = c_(*) a_e . $
  Summing the two orientations of an unmarked arc gives $w_e$.
    If a prefix string crosses it, multiplication by $K \( Q \)$ changes that sum to $k_e$.
    These are precisely the tree weights in (5.2).
  For a pure string, the same calculation holds on every separating boundary arc.
    A counterclockwise enclosing loop has intersection factor $Q^(- 1)$,
    so the sum of its two orientations is $e^(i lambda) Q^(- 1) + e^(- i lambda) Q = - 2$.
    Crossing each such medial loop switches the adjacent color, which proves the final parity assertion. ◻
]

=== 5.3 Reflection and two-step increments <reflection-and-two-step-increments>

Reflect in a line of angle $phi.alt$, and combine this operation with complex conjugation and arrow reversal.
  Relative to the mirrored step direction, spins are unchanged, while the left and right tiles are exchanged.
  Consequently the reflected primitive has the form

$ L_(+) \, med K \( Q^(- 1) \) \, wide e^(i rho alpha') \, wide alpha' = 2 phi.alt - alpha \, $

up to a common scalar. It obeys the reflected local deformation identities, using the opposite winding expansion.
  In the notation of (4.4), it has $epsilon.alt = - 1$ and still $tau = 1$.
  Further reflections alternate between these two types. Moreover,
  a high difference with coefficient $e^(i \( arg d_1 - arg d_2 \))$ becomes the same expression with the
  reflected directions $d'_1 \, d'_2$.

A #emph[low stencil] is a primitive increment on a straight two-step extension from a vertex $z$.
  A #emph[high stencil] is the difference of two such increments in distinct tile-axis directions $d_1 \, d_2$,
  with coefficient $e^(i \( arg d_1 - arg d_2 \))$ on the subtracted term.
  Both extensions have one common arriving prefix with fixed lift. The local path choices are simple and extensible.

#thm([Proposition 5.3.])[
  (Extraction in a clear slab).  #emph[Suppose a diagonal-time slab of macroscopic thickness about a low or high
    stencil contains no other non-diagonal tensors or endpoints. Diagonal chains may cross the slab.
    The stencil has an intact neighborhood disjoint from all other chains except its own prefix,
    and the slab has spare margins for routing and cuts. Bounded lattice errors are permitted inside these
    margins. Then the stencil contraction can be written as the corresponding low or high expression in Theorem
    15, between exterior states independent of the choice of stencil term.
    Only boundedly many compensating pairs of rows and a common bounded scalar are introduced.]
  #emph[In particular, if the two clear parts of the slab contain at least $n$ physical steps,
    its scalar contraction is bounded by $C n^(- 1 + rho)$ for a low stencil,
    and by $C n^(- 1 - rho)$ for a high stencil, times the two exterior reflection norms.
    Reflected stencils satisfy the same statement.]
] <cur:slab-estimate>

#proof[
  There are two matters to check: the compared paths must have common endpoints,
    and rerouting the other charges must contribute the same phase to every possible source position.
  Let $a \, b$ be the two positive-time unit steps, namely $X \, Y$ in the diagonal slicing.
    An increment in a negative direction is exactly the negative of the corresponding forward increment ending at
    $z$. This rewriting is local, even if previous cuts have been made.
    Choose a point on the common prefix in the intact neighborhood,
    express each increment as a difference of two complete primitives from that point,
    cancel their common initial marked terms, and apply Lemma 19 inside the neighborhood.
    Thus no earlier path or cut is altered.
  Use the following common endpoints for the high stencil:
  - For directions $a \, b$, start at $z$ and append two after-twist steps in the other direction to end at $z +
    2 a + 2 b$.
  - For directions $- a \, - b$, start at $z - 2 a - 2 b$, prepend two before-twist steps in the other direction,
    and end at $z$.
  - For directions $a \, - b$, use the trajectory starting at $z - 2 b$ with steps $b \, b \, a \, a$.
  The case $- a \, b$ is the same with $a \, b$ interchanged.
    Backward differencing changes the relative sign exactly as required to obtain the coefficient for the two
    positive directions.
  Approach the common start by the same prefix, with a final positive-direction segment.
    A simple replacement can first bend around the stencil and approach from the required side,
    even when the original prefix arrived from later times. In a box with spare room,
    choose lattice corridors preserving the entrance and reserve a clear rectangle for the last positive steps.
    All marker lifts now differ by the short angle between $a$ and $b$ in their common time frame;
    no extra $2 pi$ turn is introduced. The low case is the same construction with one increment.
    The explicit prefix charge is $Q^epsilon.alt$, with $epsilon.alt = 1$ or $- 1$ according to the reflected type.
  We next consolidate diagonal chains in the clear band. Keep as common background every chain except the explicit
    prefix steps between the common start and the marker. In particular,
    the charge arriving at the common start is included in this background.
    Using real charges modulo $2 pi$, route it to carry a total phase $zeta$ on a common positive-time seam before
    the start, and a phase $xi$ from the start through the comparison block and to the future seam.
    These are the net oriented charges through ordinary sections, and
  $ zeta \/ xi = Q^epsilon.alt . $
  All endpoints are preserved. Joining and funneling the chains can be done outside the sandwich cuts but inside
    the larger vacant margins, including transverse lattice displacements.
    Choose the cuts through level vertices of the positive-time seam with many positive steps on each side.
    This construction does not require a monotone path between the original remote cut positions.
  Inside the comparison rectangle, first route the $xi$ background along one common skirt on the
    higher-space-coordinate side of both positive-step paths, avoiding every possible marker.
    In $X \, Y$ coordinates it runs around the northwest side of the small positive rectangle between the common
    endpoints. Tile ice conservation then moves this skirt onto either compared path, always on the same,
    left spin side of a broken source edge. At a marker it therefore multiplies $L_(-)$ or $L_(+)$ on a fixed side
    by the diagonal twist. This multiplication is one common scalar.
  It remains to justify that the change from the original background routing to this common skirt has a common
    phase. Their difference is a closed tile-edge chain in the larger slab,
    hence a weighted sum of face boundaries. Tile ice conservation cancels every face contribution except at a
    source edge, whose signed spin jump is fixed and equal to two relative to its positive step.
    All prospective source edges lie in the same winding region of this common closed-chain difference.
    Indeed other original chains avoid the intact neighborhood;
    the chosen prefix approaches the common start from the past without entering the positive rectangle;
    the replacement before the start follows that same final incoming line with net charge $zeta$;
    and the common skirt and outgoing seam stay outside the rectangle.
    No edge of the routing difference separates the interiors of two possible marker edges.
    Extend the coincident clear incoming and outgoing parts by many lattice edges if needed.
    The face coefficient seen by the source is consequently identical in every stencil term.
    Summing conservation gives one common phase. There are no contributions from other defects,
    since all changes remain inside the clear band and its margins.
    The same reasoning can be phrased as a sequence of path slides consistently kept on one side of the entire
    marker rectangle. Every phase remains unitary.
  We have now obtained exactly the before- and after-twist operators in (4.3), with their required relative phase,
    the compensating even pairs described above, and one common bounded scalar.
    The two exterior states are independent of which term is used. Theorem 15 gives the claimed bound.
  For later repeated cuts, note also how these states glue.
    A consolidated chain at a diagonal cut ends at a shared level vertex.
    Reflection conjugates its charge to the inverse in the mirrored direction, preserving the spin convention.
    Joining after reversing path direction therefore continues with the same charge and creates no endpoint at the
    cut. At preliminary tile-axis cuts, route the chains transversely over the line through its level vertices,
    with no segment lying on the line inside the spare margin; the same argument applies.
    Reflections preserve the high or low type at every other intact stencil point.
    This proves the reflected assertion and the compatibility needed for successive extractions. ◻
]

The proposition is a local norm estimate. In later applications the number of available clear slabs and the sizes
  of their exterior norms are estimated separately by the positive partition comparisons;
  the local extraction itself makes no uniform bound on those norms.

== 6 The four-change observable and its boundary values <sec:fourchange>

Throughout Sections 6–9, let $1 lt.eq q < 4$, $d = sqrt(q) = 2 cos lambda$, and $rho = lambda \/ pi$.
  The construction has two distinct parts. We first determine the boundary values of a disk observable by an exact
  calculation on its boundary-arc tree. We then prove its holomorphicity by placing two copies on opposite banks
  of a wall. The boundary identification in Proposition 26 is explicitly conditional until Theorem 32 supplies
  this last premise.

=== 6.1 Boundary data and the open-cap law <boundary-data-and-the-open-cap-law>

Let $Omega$ be a fixed simple orthogonal polygon in tile coordinates, with four distinct boundary points $p \,
  b \, c \, d_0$ in counterclockwise order, each in the relative interior of a side.
  Write $A \, B \, C \, D$ for the successive intervals beginning at $p$.
  Approximate $Omega$ by whole-tile disks of mesh $n^(- 1)$,
  with side positions and marks changed by $O \( n^(- 1) \)$, using the balanced corner parities of Corollary 14.
  Give $A \, C$ one designated wire color $frak(A)$, and $B \, D$ the other, $frak(B)$.
  At each mesh choose the global color assignment for which the deterministic-cap partition,
  completed around $A \, C$, is at least that for the reversed assignment.
  Changing just the pairing of the four unmatched ports changes a positive partition by a bounded factor.

Under the #emph[open-cap law], the four unmatched ports remain open; every closed loop,
  including those closed by local caps, receives weight $d$, in addition to the common tile coefficients.
  This law and either deterministic completion have uniformly bounded density ratios.
  Let $E_(frak(A))$ be the event of an actual $frak(A)$-path in the disk joining $A$ to $C$,
  and define $E_(frak(B))$ similarly for $B \, D$. Eligible endpoints of intervals count as boundary vertices.
  Set $P_(frak(A)) = bb(P)_(upright("open")) \( E_(frak(A)) \)$ and $P_(frak(B)) =
  bb(P)_(upright("open")) \( E_(frak(B)) \)$.

Use the boundary factors and inward-normal lift of Section 3, with bases

#[#set math.equation(numbering: n => "(6.1)")
 $ \( H_A \, H_B \, H_C \, H_D \) = \( s + 1 \, 1 \, s \, 0 \) \, wide h_i = H_R +
   Delta upright(bold(1))_({ i upright(" is high") }) \, quad i in R . $ <four:bases>]

The boundary order starts at $p$. On continuing to a second lap the base decreases by $1$,
  to account for the curvature lift, so the locally forward raw drop at $p$ is $- s$. Introduce

#[#set math.equation(numbering: n => "(6.2)")
 $ x = e^(- i lambda) \, quad y = e^(i lambda) \, quad P_0 = x^(s + 1) \, quad G = 1 - y^2 \, quad A_R =
   x^(2 H_R + Delta) . $ <four:normalization>]

In particular, $d = y + y^(- 1)$ and $x^(2 Delta) = - y^3$.

Take the primitive of Section 5 from $p$, initially directed inward, to a lattice vertex $z$.
  Removing the common source factor $c_(*) = e^(- i lambda) \/ \( 2 sin lambda \)$,
  and dividing each diagram by its open-cap weight, gives the random variable $H_(V \( z \))$ below.
  The normalized observable is

#[#set math.equation(numbering: n => "(6.3)")
 $ h_n \( z \) = frac(bb(E)_(upright("open")) H_(V \( z \)), P_0 G) . $ <four:observable>]

=== 6.2 The boundary-arc tree <the-boundary-arc-tree>

Cut the disk along its raw boundary arcs, leaving its closed internal loops in place only for their ordinary
  weights. The adjacency graph of the resulting regions is a tree, rooted at the region incident to $p$.
  Its vertices have the common color of their boundary-gap visits; colors alternate across every edge.
  Let $V \( z \)$ be the region containing $z$ when the internal loops are ignored.
  Call a tree vertex #emph[wired] if it visits a gap of its own color on an interval wiring that color.

#thm([Lemma 6.1.])[
  (Tree normalization and connection alternatives).  #emph[The number of loops closed by the local boundary caps is
#[#set math.equation(numbering: n => "(6.4)")
 $ cal(I) = \# { upright("unwired tree vertices") } . $ <four:loop-count>]

 Exactly one of $E_(frak(A)) \, E_(frak(B))$ occurs. Completing the four open ports around $A \,
   C$ adds respectively one and two loops on these events.]
  #emph[For an edge $e$ represented by an arc $i arrow.r j$, $i < j$, put
#[#set math.equation(numbering: n => "(6.5)")
 $ m_e = h_i - h_j \, wide w_e = frac(cos \( \( m_e - 1 / 2 \) lambda \), sin lambda) \, wide k_e = -
   frac(cos \( \( m_e + 1 / 2 \) lambda \), sin lambda) \, wide a_e = x^(h_i + h_j) . $ <four:edge-weights>]

 Let $cal(P) \( V \)$ be the root-to-$V$ edge path. Define
#[#set math.equation(numbering: n => "(6.6)")
 $ D_V & = d^(- cal(I)) product_(e in cal(P) \( V \)) k_e product_(e in.not cal(P) \( V \)) w_e \,\
H_V & =
  d^(- cal(I)) sum_(e in cal(P) \( V \)) a_e product_(f upright(" before ") e upright(" in ") cal(P) \( V \)) k_f
  product_(f upright(" not before ") e \, med f eq.not e) w_f . $ <four:D>]

 Thus $H_(upright("root")) = 0$. If $e$ joins its parent $u$ to its child $v$, the common product $D_e^compose$,
   with the factor on $e$ omitted, satisfies
#[#set math.equation(numbering: n => "(6.7)")
 $ H_v - H_u = a_e D_e^compose \, wide D_u = w_e D_e^compose \, wide D_v = k_e D_e^compose . $ <four:recursion>]

]
] <four:tree>

#proof[
  Attach a thin exterior annulus containing the local caps,
    with the four unmatched ports continued to its outer boundary.
    Each cap cuts off a sliver at the intervening gap. The remaining annular regions connect the wire-color visits
    of each interval and lead to the four outer intervals. Consequently precisely the wired classes remain
    accessible from that boundary. Two noncrossing open strands cut a disk into three boundary regions,
    with one further region for each boundary loop. The other tree regions give exactly the loops in (6.4).
    This also gives the opposite-pair alternative.
  These alternatives concern actual connections. Indeed the switch arcs are perimeters separating the two
    thickened diagonal graphs. Visits of one color in a single boundary region belong to the same actual
    component; reinstating internal loops cannot divide that boundary class.
    There are only two designated intervals of each color. The two possible pairings of four ports agree or
    disagree with the deterministic exterior pairing, adding two or one loops, respectively, as asserted.
    Finally, the path rule of Lemma 20 gives (6.6)–(6.6); all ordinary internal-loop weights cancel.
    Separating the term marked on $e$ gives (6.7). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  arc((0, 1.208), start: 90deg, stop: 450deg, radius: 1.208, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 1.208), radius: 0.04939, fill: black, stroke: none)
  circle((-1.208, 0), radius: 0.04939, fill: black, stroke: none)
  circle((0, -1.208), radius: 0.04939, fill: black, stroke: none)
  circle((1.208, 0), radius: 0.04939, fill: black, stroke: none)
  content((0, 1.208), [#text(size: 9pt)[$p$]], anchor: "south", padding: 0.1176cm)
  content((-1.208, 0), [#text(size: 9pt)[$b$]], anchor: "east", padding: 0.1176cm)
  content((0, -1.208), [#text(size: 9pt)[$c$]], anchor: "north", padding: 0.1176cm)
  content((1.208, 0), [#text(size: 9pt)[$d_0$]], anchor: "west", padding: 0.1176cm)
  content((-1.071, 1.071), [#text(size: 9pt)[$A$]])
  content((-1.071, -1.071), [#text(size: 9pt)[$B$]])
  content((1.071, -1.071), [#text(size: 9pt)[$C$]])
  content((1.071, 1.071), [#text(size: 9pt)[$D$]])
  content((0, -1.838), [#text(size: 9pt)[${E_( frak(A) )}$]])
  arc((4.41, 1.208), start: 90deg, stop: 450deg, radius: 1.208, stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((4.41, 1.208), radius: 0.04939, fill: black, stroke: none)
  circle((3.203, 0), radius: 0.04939, fill: black, stroke: none)
  circle((4.41, -1.208), radius: 0.04939, fill: black, stroke: none)
  circle((5.617, 0), radius: 0.04939, fill: black, stroke: none)
  content((4.41, 1.208), [#text(size: 9pt)[$p$]], anchor: "south", padding: 0.1176cm)
  content((3.203, 0), [#text(size: 9pt)[$b$]], anchor: "east", padding: 0.1176cm)
  content((4.41, -1.208), [#text(size: 9pt)[$c$]], anchor: "north", padding: 0.1176cm)
  content((5.617, 0), [#text(size: 9pt)[$d_0$]], anchor: "west", padding: 0.1176cm)
  content((3.339, 1.071), [#text(size: 9pt)[$A$]])
  content((3.339, -1.071), [#text(size: 9pt)[$B$]])
  content((5.481, -1.071), [#text(size: 9pt)[$C$]])
  content((5.481, 1.071), [#text(size: 9pt)[$D$]])
  content((4.41, -1.838), [#text(size: 9pt)[${E_( frak(B) )}$]])
  bezier((0, 1.208), (1.208, 0), (0, 0.3675), (0.3675, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  bezier((-1.208, 0), (0, -1.208), (-0.3675, 0), (0, -0.3675), stroke: (thickness: 1.2pt, miter-limit: 10))
  bezier((4.41, 1.208), (3.203, 0), (4.41, 0.3675), (4.043, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  bezier((4.41, -1.208), (5.617, 0), (4.41, -0.3675), (4.777, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
})],
  caption: [Figure 2: The two four-port pairings after local caps are attached. The boundary is drawn as a circle only to show cyclic order; $A \, C$ wire $frak(A)$ and $B \, D$ wire $frak(B)$. Completing around $A \, C$ adds one loop on the left and two on the right. The thick curves are open medial strands, not cluster paths. ],
) <four:pairing-figure>

For later use we make the finite tree computation explicit.
  Let $L \( e \)$ be the number of marks among $b \, c \, d_0$ in the child boundary interval of $e$.
  Those marks form a consecutive subset. Their drops are $s \, t \, s$;
  the endpoint high statuses agree when $L$ is odd and differ when it is even. Substitution in (6.5) gives

#[#set math.equation(numbering: n => "(6.8)")
 $ L & w_e & k_e\
0 & d \, med 1 & - 1 \, med - d\
1 med \( b upright(" or ") d_0 \) & 1 & 0\
1 med \( c \) & 1 & - d\
2 & 1 \, med d & 0 \, med - \( d^2 - 1 \)\
3 & 0 & 1 $ <four:table>]

Two entries refer, in order, to a high and a low first port.

The $L > 0$ subtree has four terminal legs, possibly of zero length.
  The $p$-leg has $L = 3$, and the other legs have $L = 1$.
  Between the branches is either one shared node or a chain of $m gt.eq 1$ edges with $L = 2$.
  A chain of type $X$ encloses $c \, d_0$ and has ports on $B \, D$; write $frak(C) = frak(B)$ in this case.
  A chain of type $Y$ encloses $b \, c$, has ports on $A \, C$, and has $frak(C) = frak(A)$.
  These are the only possibilities because descendant marked sets are nested.
  Number the chain nodes $0 \, dots.h \, m$ away from the $p$-leg, and write $c_j$ for their colors.
  For a shared branch use $m = 0$.

Leg and branch nodes are wired: each meets intervals of both designated colors,
  also when a leg collapses at a mark. An internal chain node meets only intervals wiring $frak(C)$,
  and cannot meet a mark because its descendant marked set is unchanged along the chain.
  The child of an $L = 0$ edge is unwired exactly when its first port is high. Hence

#[#set math.equation(numbering: n => "(6.9)")
 $ cal(I) = cal(I)_0 + cal(I)_(upright("mid")) \, wide cal(I)_(upright("mid")) = \# { 0 < j < m :
   c_j eq.not frak(C) } \, $ <four:count-split>]

where $cal(I)_0$ counts high-starting $L = 0$ edges. If $m > 0$,
  the endpoint regions of each chain edge both visit the two $frak(C)$-intervals, so $E_(frak(C))$ holds.
  If $m = 0$, the shared node visits all four intervals, giving the connection of color $c_0$.
  Since a chain edge has $w_e = d$ precisely when its child has color $frak(C)$,

#[#set math.equation(numbering: n => "(6.10)")
 $ F := d^(- cal(I)_(upright("mid"))) product_(L \( e \) = 2) w_e =
   cases(delim: "{", d^(upright(bold(1))_({ c_0 eq.not frak(C) })) \, & m > 0 \,, 1 \, & m = 0 .) $ <four:F>]

Every off-path $L = 0$ weight cancels its contribution to $d^(cal(I))$.
  Inside an $L = 0$ branch contained in $R$, define

#[#set math.equation(numbering: n => "(6.11)")
 $ g_R \( upright("wire color") \) = 1 / 2 \, wide g_R \( upright("other color") \) = - 1 / 2 . $ <four:g>]

Then

#[#set math.equation(numbering: n => "(6.12)")
 $ k_e / w_e = - d^(g_R \( "col" \( v \) \) - g_R \( "col" \( u \) \)) \, wide a_e = A_R . $ <four:tail>]

In particular, two successive increments of $H$ in such a branch cancel.

#thm([Lemma 6.2.])[
  (Marked values and corrected observable).  #emph[Call the tree #emph[typical] when all four terminal legs have
    positive length. On a typical tree,
#[#set math.equation(numbering: n => "(6.13)")
 $ D_p = D_b = D_(d_0) = 0 \, wide frac(H_b, P_0 G) = cases(delim: "{", 1 & E_(frak(A)) \,, d & E_(frak(B)) \,)
   quad frac(H_(d_0), P_0 G) = y cases(delim: "{", d & E_(frak(A)) \,, 1 & E_(frak(B)) .) $ <four:marked-values>]

 On the gap visits of any interval $R$,
#[#set math.equation(numbering: n => "(6.14)")
 $ Re \( H_V \/ A_R \) - c_R \( "col" \( V \) \) D_V quad upright("is constant") \,\
c_R \( upright("wire color") \) = - cos lambda \, wide c_R \( upright("other color") \) =
  cos \( 2 lambda \) . $ <four:line-invariant>]

 Set
#[#set math.equation(numbering: n => "(6.15)")
 $ Gamma \( frak(A) \) = P_0 y^2 \, wide Gamma \( frak(B) \) = - P_0 y \, wide H_V^compose = H_V -
   Gamma \( "col" \( V \) \) D_V . $ <four:corrected>]

 The variables $H_V^compose$ are bounded uniformly over all trees and vertices.
   On a typical tree they have value $P_0 G T$ along the $c$-leg and all its descendant branches, where
#[#set math.equation(numbering: n => "(6.16)")
 $ T = upright(bold(1))_(E_(frak(A))) + y upright(bold(1))_(E_(frak(B))) . $ <four:T>]

 On gap visits along $B$, their only possible values are $H_b \, P_0 G T$; along $C$, they are $H_(d_0) \, P_0 G T$.]
] <four:marked>

#proof[
  An unpassed $L = 3$ edge kills every term of $H$, so only its last edge can mark.
    Once the first $b$- or $d_0$-leg edge has been passed, $k_e = 0$ kills all later marked terms. At node $0$,
  #[#set math.equation(numbering: n => "(6.17)")
   $ D = F \, wide H \/ P_0 = cases(delim: "{", F \, & c_0 = frak(A) \,, - y^3 F \, & c_0 = frak(B) .)
     $ <four:branch-values>]
  The first $b$-leg coefficient $a_e \/ P_0$ is $- y^2$ or $y^(- 1)$,
    according as the parent color is $frak(A)$ or $frak(B)$; the corresponding $d_0$-leg coefficients are $-
    y^4$ or $y$. This gives (6.13) at the near branch or shared node.
  On the middle chain, $a_e \/ P_0 = y$ in type $X$ and $- y^2$ in type $Y$.
    If the first chain edge has $k_e = 0$, its weight is $w_e = 1$ and only that chain mark contributes.
    Otherwise $F = d$; the chain terms and the target mark contribute $\( 2 - d^2 \)$ times the chain amplitude.
    Indeed the second chain edge already has $k = 0 \, w = 1$, or, when $m = 1$,
    the target edge has the same amplitude. The identities
  #[#set math.equation(numbering: n => "(6.18)")
   $ d + \( 2 - d^2 \) y = y G \, wide - d y^3 - \( 2 - d^2 \) y^2 = G $ <four:far-algebra>]
  give the far-branch values; the first-$k = 0$ cases give the same values.
  For (6.14), consider first the earlier port of an arc, and let $r = 1$ for a high port and $r = - 1$ otherwise.
    With “before” and “after” referring to boundary-gap visits,
  #[#set math.equation(numbering: n => "(6.19)")
   $ Re \( a_e \/ A_R \) = cos \( \( m_e - r Delta \) lambda \) = c_(upright("after")) k_e -
     c_(upright("before")) w_e . $ <four:early-port>]
  At the later port, using its own high status,
  #[#set math.equation(numbering: n => "(6.20)")
   $ - Re \( a_e \/ A_R \) = - cos \( \( m_e + r Delta \) lambda \) = c_(upright("after")) w_e -
     c_(upright("before")) k_e . $ <four:late-port>]
  These product-to-sum identities and (6.7) prove the invariant, including across a corner in the same interval.
  For $R = B \, C$, direct substitution gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ Re \( Gamma \/ A_R \) = c_R \, wide d Gamma \( upright("wire color") \) +
     Gamma \( upright("other color") \) = - A_R . $ <four:Gamma-identities>]
  Thus $H^compose$ is unchanged on $L = 0$ edges in $B \, C$. It is unchanged on $c$-leg edges as well:
    those have $w = 1 \, k = - d$, and $a = A_C$ for a high first port, whose parent color is $frak(B)$, and $a =
    A_B$ otherwise. The table bounds all other parts of the tree:
    an unpassed $p$-leg kills terms; the middle chain kills a complete prefix in at most two steps; and an $L =
    0$ tail has the two-step rule (6.12). The $c$-leg is the only place where the uncorrected variables can grow,
    and the correction is constant there. This proves the uniform bound for $H^compose$, including atypical trees.
  At a node incident to a $c$-leg edge, the $B \, C$ line invariants, anchored by (6.13),
    intersect at $P_0 G T$ when $d > 1$. The four line directions after division by $P_0 G$ are
  #[#set math.equation(numbering: n => "(6.22)")
   $ 1 \, quad - y^(- 1) \, quad y^2 \, quad - y wide upright("on ") A \, B \, C \, D \, $ <four:directions>]
  as follows from $i A_R \/ \( P_0 G \)$ up to nonzero real factors.
    At $d = 1$ the same identity follows by continuity for each fixed finite tree.
    The descendants beyond a $c$-leg edge lie in its $B \, C$ boundary disk; its $L =
    0$ side branches therefore preserve this value.
  The gap walk along $B$ goes from the end of the $b$-leg to the end of the $c$-leg.
    Its $L = 0$ excursions preserve $H^compose$, so only type-$X$ middle nodes need checking.
    Similarly only type-$Y$ nodes need checking for $C$. At node $0$,
  #[#set math.equation(numbering: n => "(6.23)")
   $ H^compose \/ \( P_0 G \) = F quad \( c_0 = frak(A) \) \, wide H^compose \/ \( P_0 G \) =
     y F quad \( c_0 = frak(B) \) . $ <four:corrected-branch>]
  After the first zero $k$, the value stays at the far-branch value.
    If the first $k$ is nonzero, the first jump is $- y^(- 1)$ in type $X$ with $c_0 = frak(A)$, and $-
    y^2$ in type $Y$ with $c_0 = frak(B)$. Thus node $1$ already has value $T$ in normalized units.
    These are precisely the alternatives in the statement. ◻
]

=== 6.3 Moments, shielding, and disappearance of the diagonal term <moments-shielding-and-disappearance-of-the-diagonal-term>

#thm([Lemma 6.3.])[
  (Compactness and boundary shielding).  #emph[For every fixed positive power,
    the moments of $\| H_(V \( z \)) \| + \| D_(V \( z \)) \|$ are bounded by a power of
    $min \( 1 \, \| z - c \| \)^(- 1)$, uniformly when $z$ is farther than a mesh-scale distance from $c$.
    The expectations in (6.3) are asymptotically equicontinuous on interior compact sets.
    Every lattice parity therefore has the same locally continuous subsequential limits.]
  #emph[Typicality has probability tending to one. As a macroscopic interior point approaches an ordinary boundary
    point, including a polygon corner, its tree vertex visits that point’s interval with probability tending to
    one after the mesh limit. Near $b \, c \, d_0$ it lies beyond an edge of the corresponding terminal leg with
    high probability; near $p$ an unpassed $L = 3$ edge remains with high probability.]
] <four:compactness>

#proof[
  The table and the two-step cancellation bound $\| H_V \| + \| D_V \|$ by $C exp \( C ell \)$,
    where $ell$ is the number of $c$-leg edges passed on the root-to-$V$ path.
    A passed $c$-leg arc has a child disk containing $z$. It cannot be wholly inside a box at $c$ of radius a
    small fixed multiple of $min \( 1 \, \| z - c \| \)$, because the flat wall makes such a child disk local.
    Fixed buffers and the dyadic bands between that radius and macroscopic scale count these passages.
    The conditional passage estimates of Lemmas 7 and 8, grouped into disjoint buffer colors,
    give the asserted moments. Bounded open-cap reweighting allows their use under a deterministic-cap FK law.
    If two nearby interior vertices have different boundary-tree regions,
    a raw boundary arc travels from their vicinity to the wall.
    Bulk RSW circuits make this probability uniformly small; Hölder’s inequality and the moment bound give
    equicontinuity, including between lattice parities.
  For the boundary claims, work on separated scales in the relevant wall sector.
    In disjoint buffers impose two actual wall-to-wall crosscuts, of opposite colors, the first inside the second.
    Up-to-wall RSW gives a uniform conditional lower bound. A raw medial separator lies between the two thickened
    paths and joins the two banks. One direct verification is to trace the perimeters:
    on either bank the gaps at the two crosscut ends have opposite colors,
    so an odd number of ports lies between them; the paths prohibit radial escape,
    and at least one of these ports must be paired to the other bank.
    Such an arc separates the deeper box from the exterior. The same argument works in a corner sector.
    Iteration gives probability tending to one at diverging scale ratio.
    It produces the claimed local raw arch at an ordinary point and the appropriate terminal-leg separator at each
    mark. ◻
]

#thm([Lemma 6.4.])[
  (Diagonal residual cancellation).  #emph[For every bounded function $gamma$ of the two colors and every boundary
    point $u$ distinct from the four marks,
#[#set math.equation(numbering: n => "(6.24)")
 $ lim_(z arrow.r u) limsup_(n arrow.r oo)
   lr(|bb(E)_(upright("open")) \[ gamma \( "col" \( V \( z \) \) \) D_(V \( z \)) \]|) = 0 . $ <four:boundary-residual>]

 Here $z$ in the outer limit is a macroscopic interior location,
   and any lattice vertices tending to it may be used in the inner limit.]
] <four:residual>

#proof[
  We first cancel a positively weighted residual at a fixed interior $z$.
    Replace the marked primitive by the full $K \( Q \)$ string from $p$ to $z$.
    If $N$ is the number of internal closed loops surrounding $z$, their weight ratio is $- 2 \/ d$.
    Let $sigma$ take opposite signs on the two colors. Nesting parity gives $\( - 1 \)^N =
    sigma \( "col" \( z \) \) sigma \( "col" \( V \) \)$. Equality of the two winding expansions implies
  #[#set math.equation(numbering: n => "(6.25)")
   $ bb(E)_(upright("open")) \[ sigma \( "col" \( V \) \) D_V \( 2 \/ d \)^N \] =
     o \( 1 \) . $ <four:weighted-residual>]
  Here is the required absolute estimate in the wrong expansion.
    Relative to the complementary cap partition it is at most
  #[#set math.equation(numbering: n => "(6.26)")
   $ K_(*)^(1 + X_(*)) product_(nu = p \, b \, d_0) upright(bold(1))_({ N_nu = 0 }) thin d^(N_c)
     product_(v upright(" a corner")) f \( g_v \)^(N_v \/ 2) \, wide g_v in { - 1 / 2 \, 1 / 2 } . $ <four:wrong-bound>]
  The counts use disjoint small macroscopic cutoffs. The variable $X_(*)$ counts macroscopic passages and has
    every fixed exponential moment; its constants may depend on $z$.
    Away from singularities, ordinary small arcs have the complementary zero-drop cap weights.
    At $b \, d_0 \, c$ the effective wrong drops are $- s \, - s \, - t$, with weights $0 \, 0 \, d$.
    At $p$, use a locally forward boundary interval. Its arc meets the exiting string with net intersection $- 1$;
    after changing the winding convention the effective drop is $s + 1$, again giving weight zero.
    This depends on the net intersection, not the placement of the string.
    Corner alternation and cap elimination give the remaining factors in (6.26).
    Internal loops around $z$ have absolute weight $2 \| cos \( 2 lambda \) \| lt.eq d$,
    and each nonlocal arc costs at most a bounded factor per passage.
  Without the $K_(*)^(1 + X_(*))$ factor, the logarithm of the expectation is bounded above by
  #[#set math.equation(numbering: n => "(6.27)")
   $ 3 P + D_(*) + sum_(v upright(" convex")) C_(i \( v \)) + sum_(v upright(" concave")) L_(i \( v \)) +
     O \( 1 \) . $ <four:residual-budget>]
  Its second moment is polynomial in $n$. Hölder with exponent slightly above one absorbs $X_(*)$ at an
    arbitrarily small loss in the coefficient of $log n$, by Lemma 9.
    The balanced-corner budget (3.15) is strictly negative by (3.4).
    Our global color choice makes the complementary cap partition at most a constant times the correct open-cap
    partition. This proves (6.25).
  We next remove the positive weight, retaining relative error estimates.
    Let $mu$ be the correct deterministic-cap FK law and $R_(*) =
    d^(ell_(upright("open")) - ell_(upright("det")))$; open expectation is $bb(E)_mu \[ R_(*) dot.op \] \/
    bb(E)_mu R_(*)$. For the interval $R$ containing $u$, put
  #[#set math.equation(numbering: n => "(6.28)")
   $ B_(*) = R_(*) sigma \( "col" \( V \) \) d^(- g_R \( "col" \( V \) \)) D_V \, wide T_(*) =
     d^(g_R \( "col" \( V \) \)) \( 2 \/ d \)^N . $ <four:BT>]
  Thus $bb(E)_mu \[ B_(*) T_(*) \] = o \( 1 \)$ at every fixed $z$. Choose scales in the regular sector at $u$ with
  #[#set math.equation(numbering: n => "(6.29)")
   $ \| z - u \| lt.double r_1 lt.double r_2 lt.double r_3 lt.double 1 \, $ <four:residual-scales>]
  all ratios diverging as $z arrow.r u$, and take the mesh limit first.
  Except on an event of vanishing probability, $B_(*)$ is determined outside $r_2$.
    To see this, use actual screens to ensure that no raw strand from the $r_2$ rim reaches $r_3$.
    Every changing boundary arc then lies in one small part of $R$, so has $L = 0$.
    All $L > 0$ data, the marked subtree and $R_(*)$ are fixed.
    Regard arcs touching the connected patch as affected and arcs wholly outside it as stable.
    Stable separators either separate the entire patch from $p$ or do not;
    noncrossing puts the affected on-path arcs after them. Off-path factors cancel,
    while the on-path $k \/ w$ suffix telescopes by (6.12). The color factor in $B_(*)$ cancels that suffix
    exactly. Set $B_(upright("out")) = B_(*)$ on this exterior good event and zero otherwise.
  Truncate $T_(*)$ to $T_(upright("in"))$ by counting only enclosing loops wholly inside $r_1$ and reconstructing
    the tree color from their parity and the fixed lattice color of $z$.
    This is exact unless a raw path runs from $O \( \| z - u \| \)$ to the $r_1$ scale:
    every enclosing loop meets the segment from $z$ to its nearest wall point.
    To measure both truncation errors, let $N_0$ count the enclosing loops wholly inside the box of radius
    $"dist" \( z \, partial Omega \) \/ 8$ at $z$, and put $U_z = \( 2 \/ d \)^(N_0)$.
    Work under the positive tilt $nu_(U_z) prop U_z mu$. The rare events remain rare under this tilt by
    conditional RSW outside its support. The variables $B_(*)$, $T_(*) \/ U_z$,
    and $T_(upright("in")) \/ U_z$ have uniformly bounded fixed moments as $z arrow.r u$.
    For $B_(*)$, every relevant $c$-leg arc gives a macroscopic passage away from $u$;
    an arc wholly local at $u$ would have $L = 0$. Every extra loop in $T_(*)$ gives a passage in a band at
    distance comparable to $"dist" \( z \, partial Omega \)$,
    by the segment observation and its escape from the cutoff.
    Finitely many bulk and sector buffers cover this band uniformly.
    Near a corner, use a corner buffer and small straight-bank buffers,
    or only the latter if the corner is farther away than this scale.
    The tilt-edge passage estimates apply in each buffer. Hölder therefore makes the product truncation errors
    $o \( bb(E)_mu U_z \)$, and
  #[#set math.equation(numbering: n => "(6.30)")
   $ bb(E)_mu T_(upright("in")) asymp bb(E)_mu U_z gt.eq 1 . $ <four:T-comparison>]
  The inward relative comparison of Lemma 6 between $r_1$ and $r_2$,
    applied to this positive inner factor and the absolute parts of $B_(upright("out"))$, gives
  #[#set math.equation(numbering: n => "(6.31)")
   $
     frac(bb(E)_mu \[ B_(upright("out")) T_(upright("in")) \] - bb(E)_mu B_(upright("out")) thin bb(E)_mu
     T_(upright("in")), bb(E)_mu U_z) = o \( 1 \) . $ <four:relative-decoupling>]
  First use (6.25) at fixed $z$, then let $z arrow.r u$. Equations (6.30)–(6.31) show that $bb(E)_mu
    B_(*)$ vanishes in this order of limits. Finally apply the same separation without a tilt to $B_(*)$ times any
    bounded function of the tree color, reconstructing that color from the inner-loop parity.
    Its expectation factors up to $o \( 1 \)$ into $bb(E)_mu B_(upright("out"))$ and a bounded inner expectation.
    Taking the bounded color factor that reverses the extra factors in (6.28), and dividing by $bb(E)_mu R_(*)$,
    proves (6.24). ◻
]

=== 6.4 The boundary problem, conditional on holomorphicity <the-boundary-problem-conditional-on-holomorphicity>

#thm([Proposition 6.5.])[
  (Identification of a holomorphic subsequential limit).  #emph[Suppose an interior subsequential limit $h$ of
    $h_n$ is holomorphic in the ordinary complex coordinate, and pass simultaneously to a limit $r$ of
    $P_(frak(A))$. Then $0 < r < 1$. Put
#[#set math.equation(numbering: n => "(6.32)")
 $ U_0 = r + d \( 1 - r \) \, wide V_0 = d r + 1 - r \, wide T_0 = r + y \( 1 - r \) . $ <four:target-vertices>]

 The function $h$ maps $Omega$ conformally onto the interior of the simple polygon with successive vertices $0 \,
   U_0 \, T_0 \, y V_0$, taking $p \, b \, c \, d_0$ to those vertices.
   If a conformal half-plane coordinate takes the marks to $0 \, chi \, 1 \, oo$, respectively, then
#[#set math.equation(numbering: n => "(6.33)")
 $ r =
   frac(integral_1^oo u^(rho - 1) \| u - chi \|^(rho - 1) \| u - 1 \|^(1 - 3 rho) thin d u, integral_chi^oo
   u^(rho - 1) \| u - chi \|^(rho - 1) \| u - 1 \|^(1 - 3 rho) thin d u) . $ <four:crossing-formula>]

 Under deterministic separate $frak(A)$ caps the corresponding crossing probability is $r \/ \( r + d \( 1 - r \) \)$.]
] <four:conditional-map>

#proof[
  Fixed up-to-wall RSW corridors give both actual crossings positive probability under deterministic caps,
    and hence under open caps; thus $0 < r < 1$. Shielding and the moment bounds give the interior limits $0 \,
    U_0 \, y V_0$ at $p \, b \, d_0$: near $p$ an unpassed $L = 3$ edge kills $H$, and near $b \,
    d_0$ the first $k = 0$ edge fixes it at its marked value.
    At every other boundary point the line invariant, shielding,
    and Lemma 25 put $h$ on the corresponding line of direction (6.22), with offsets fixed by these values.
    In a conformal half-plane coordinate, whose boundary extension is homeomorphic,
    the line-normal harmonic component vanishes continuously on each unmarked interval.
    Harmonic Schwarz reflection, followed by extension of its harmonic conjugate,
    extends $h$ holomorphically across that interval.
  On $B \, C$ the traces lie on the actual segments $\[ U_0 \, T_0 \]$ and $\[ T_0 \, y V_0 \]$, respectively.
    Indeed $H^compose$ has, for each connection event, only the two values in Lemma 23;
    the segment direction is fixed, so averaging keeps it between the averaged endpoints.
    Its correction has zero limiting expectation at every fixed boundary point.
    As that point approaches $c$, shielding gives a $c$-leg separator enclosing it and nearby interior points.
    The uniform bound for $H^compose$ therefore makes the boundary trace tend to $T_0$.
  There is also continuity at $c$ from the interior. In a half-plane coordinate $zeta$ with $c = 0$,
    the flat wall and the moment bounds give polynomial growth of $h - T_0$.
    Its two boundary directions are $- y^(- 1)$ on the negative and $y^2$ on the positive real axis. Consequently
  #[#set math.equation(numbering: n => "(6.34)")
   $ e^(- 2 i lambda) zeta^(3 rho - 1) \( h \( zeta \) - T_0 \) $ <four:corner-reflection>]
  has real boundary values on both sides, with the branch in the upper half-plane.
    Schwarz reflection makes it holomorphic on a punctured disk;
    polynomial growth makes its singularity at worst a pole. Its leading Laurent power,
    after undoing the multiplier, must have positive exponent because the two boundary traces tend to zero.
    Thus $h arrow.r T_0$ throughout the interior approach as well.
  The target polygon is counterclockwise and simple. For $d > 1$ its vertex $T_0$ is reflex:
    in the basis $1 \, y$ it lies strictly inside the triangle with vertices $0 \, U_0 \, y V_0$.
    When $d = 1$, it lies on the third side of that triangle.
    For any point off the four boundary lines, straighten each continuous boundary trace in its own line.
    Its winding number is that of the target polygon. The argument principle therefore gives one preimage of every
    generic interior point and none of every generic exterior point.
    The open mapping theorem puts the open image inside the polygon, and then the traces on $A \,
    D$ also lie on their actual segments. The segment control on $B \,
    C$ already established is needed at the reflex corner. No interior point lies on the trace,
    and the preimage count proves conformal bijectivity.
  The four target angles are $rho pi \, rho pi \, \( 2 - 3 rho \) pi \, rho pi$.
    The Schwarz–Christoffel formula therefore has derivative proportional to
    $zeta^(rho - 1) \( zeta - chi \)^(rho - 1) \( zeta - 1 \)^(1 - 3 rho)$; see, for example,
    #cite(label("Pommerenke1992")). The $B$ and $C$ side vectors are $- \( 1 - r \) y^(- 1)$ and $r y^2$,
    so their lengths are $1 - r$ and $r$. Their ratio gives (6.33).
    At $d = 1$ the straight marked point has exponent zero, as required.
    Lemma 22 reweights the two open-cap alternatives by $d$ and $d^2$, giving the last assertion. ◻
]

For $q = 1$, one has $d = 1$, $rho = 1 \/ 3$, and the substitution $v =
  chi \/ u$ turns (6.33) into Cardy’s integral #cite(label("Cardy1992")).
  No boundary-law reweighting of actual paths is then needed.
  Holomorphicity and the boundary approximation transfers are still required before this conditional computation
  becomes a scaling limit statement.

== 7 Paired walls and distant charges <sec:pairedwall>

We now put a source primitive on each bank of the polygon wall.
  The purpose of the exterior source is to leave a nonconstant second factor after applying a mixed bulk estimate;
  no conformal invariance of the exterior probability law is used.

=== 7.1 The paired-wall tensor and its normalization <the-paired-wall-tensor-and-its-normalization>

Let $O = bb(C) \\ overline(Omega)$. At every used wall port,
  replace the ordinary spin contraction by the product of two boundary factors.
  Use the same factor $b_i$ on the interior and exterior banks,
  each evaluated on the arrow sign relative to that bank’s inward normal.
  The exterior designated color is opposite to the interior one.
  Starting at $p$, the exterior order is $D \, C \, B \, A$, and the high statuses on the two banks agree.
  Its physical normal lift is $theta_O = theta_Omega + pi$, has total turn $- 2 pi$, and has raw bases $H_R - 1 / 2$.

Take the two source primitives from $p$ to $z in Omega$ and from $p$ to $u$ in an exterior collar strip along $D$.
  The strip is connected and simply connected and approaches both $p$ and $d_0$;
  initially we restrict $u$ to its interior compact sets. Use the respective inward initial lifts.
  A #emph[pure string of charge $a$] along a directed tile path contributes $e^(i lambda a c)$ at a crossed spin,
  where $c = 1$ denotes an arrow in the path’s left-normal direction. Add the following strings:

+ In exterior boundary order put
  #[#set math.equation(numbering: n => "(7.1)")
   $ P_D = 0 \, quad P_C = - 2 s \, quad P_B = - 2 \( s + t \) \, quad P_A = - 2 \( 2 s + t \) . $ <wall:short-charges>]
  For each nonzero $P_R$, run a charge-$P_R$ string forward, parallel to its interval in boundary homotopy,
    with its endpoints at the interval ends and its interior off the wall.
    Sliding this path out through a complete wall adds $P_R$ to that interval’s raw base.
+ Choose two finite sets of positive numbers $a_j$, each with sum $1$,
  satisfying $a_j < 1$ and $\( 1 + a_j \) lambda < pi \/ 2$.
  Run charge-$\( - a_j \)$ strings from $p$ to exterior bulk vertices $w_j$, at successively separated distances
  #[#set math.equation(numbering: n => "(7.2)")
   $ r_j asymp R_0 L^(j - 1) $ <wall:distant-scales>]
  from a fixed pole $z_(*) in Omega$. Their initial portions follow a common simple cut from $p$ out to distant
    scales before splitting; they never return near the polygon.
    Continue this cut notionally to infinity, and back through $Omega$ to $z_(*)$.

First fix a sufficiently large $L$, then let $R_0$ become large after the mesh limit.
  Exterior probe paths stay on the starting $D$ side of the cut and avoid the short strings and their sliding
  homotopies. To arrange this, choose thin topological boundary strips separated at the marks by sector curves,
  reserve the $D$ strip for probes, and send the cut out at $p$.
  Each fixed geometry admits piecewise smooth paths with clear corridors and then tile-edge approximations.

At shared initial tile edges use ordered parallel lanes, with pure strings on the non-probe side when they
  separate. This specifies the matrix order: the lanes cross the same smooth raw strand near a port midpoint,
  and diagonal phases act on the specified side of $L_(-)$.
  Near tile vertices they can be joined without extra strand crossings. Pure lanes need no mutual ordering.
  Source paths may be chosen in fixed homotopy with continued lift throughout their domains,
  also when small wall gaps are present away from the marks and these corridors.

For a positive reference law, cap each designated primal interval separately on each wall component.
  At a fragment tip the designated color changes between banks.
  Write $mu$ for this deterministic-cap FK law, and $Z^(upright("cap"))$ for its all-loop partition relative to
  the uncut plane vacuum, including common tile coefficients.
  If $Xi \( z \, u \)$ denotes the vacuum spin expectation of the boundary factors, sources, and pure strings,
  the winding expansion gives

#[#set math.equation(numbering: n => "(7.3)")
 $ frac(Xi \( z \, u \), Z^(upright("cap"))) = bb(E)_mu cal(O) \( z \, u \) \, $ <wall:diagram-normalization>]

where $cal(O)$ is the oriented diagram sum divided, configuration by configuration,
  by the deterministic-cap loop weight. All changes are finite at each mesh.
  The almost-sure finiteness of vacuum loops, or the finite-cylinder construction of Section 4,
  justifies this identity even in the plane; unchanged remote loops have ratio one after orientation summation.

For each $j$, let $N_j$ count closed raw loops surrounding $w_j$ wholly inside a box of a fixed small relative
  radius at scale $r_j$. Set

#[#set math.equation(numbering: n => "(7.4)")
 $ U = product_j u_(+) \( a_j \)^(N_j) \, wide u_(+) \( a \) =
   frac(cos \( \( 1 + a \) lambda \), cos lambda) > 0 . $ <wall:U>]

The patches are disjoint and buffered. For gapped walls a further positive tip factor $T_g$ will be introduced in
  Section 8; it equals $1$ for a complete wall. The normalized paired-wall function is

#[#set math.equation(numbering: n => "(7.5)")
 $ cal(H)_g \( z \, u \) = frac(Xi_g \( z \, u \), Z_g^(upright("cap")) bb(E)_(mu_g) \[ U T_g \]) .
   $ <wall:H-normalized>]

=== 7.2 The ideal exterior observable and its phases <the-ideal-exterior-observable-and-its-phases>

With a complete wall, the capped interior and exterior are independent by the loop weights and domain Markov
  property. The interior factor is $h_n \( z \)$ times $c_(*) P_0
  G$ and the bounded ratio of its open and deterministic-cap partitions.
  The ideal exterior object is the same four-change disk-tree observable on $O union { oo }$,
  viewed after inversion about $z_(*)$: its boundary order is $D \, C \, B \, A$,
  its bases in that order are $\( s + 1 \, 1 \, s \, 0 \)$, its launch is $p$,
  and it uses the exterior high designation. Raw boundary arcs form a finite disk tree,
  since none escapes to infinity almost surely. This definition needs no tiles at infinity and does not change the
  exterior positive law. Let $J_n \( u \)$ be its open-law expectation normalized by $c_(*) P_0 G$ as in (6.3).

The tree table gives local boundedness and asymptotic equicontinuity of $J_n$ in the probe strip.
  A relevant nonlocal arc has a macroscopic passage near the bounded wall,
  and separating nearby probe points requires a boundary-reaching arm.
  Shielding at the flat marks gives limit zero at $p$ and a value bounded away from zero at $d_0$.
  Consequently every locally uniform subsequential limit $J$ is continuous and nonconstant on this connected strip.

The physical phases agree with the ideal ones for bounded open arcs.
  First slide the short strings onto the complete wall, avoiding the source path.
  The new raw profile $H_R - 1 / 2 + P_R$ differs from the desired exterior profile by the global constant $- s -
  3 / 2$. Since there is one outward source, this contributes only a fixed phase. Let

#[#set math.equation(numbering: n => "(7.6)")
 $ psi = arg ((frac(1, z - z_(*)))') $ <wall:inversion-angle>]

with the cut and continuous lift just chosen. The inverted normal is $theta_O + psi$ and has total turn $2 pi$:
  on the clockwise exterior lap, $psi$ gains $4 pi$ before the cut is reset.
  An oriented arc’s image turn is its physical turn plus the endpoint $psi$ difference,
  minus $4 pi$ times its signed intersections with the outward cut.
  Boundary normal factors cancel the endpoint terms. For a marked arc,
  the two departing pieces have additional start terms, canceled exactly by the change of the gauge
  $e^(i rho alpha)$ at the source. Prefix intersections are unchanged topologically.
  Before the distant strings split, their total charge is $- 2$,
  which supplies precisely the remaining image multiplier. Thus the physical and ideal open-arc factors agree up
  to one common phase whenever those arcs stay before the splitting scales.
  This is a calculation with turn lifts of smooth disjoint drawn arcs, independent of any invariance of their law.

=== 7.3 A nonzero distant factor <a-nonzero-distant-factor>

For a closed exterior loop $gamma$, let $A_gamma = sum_(w_j upright(" inside ") gamma) a_j$,
  using its physically bounded inside. Such a loop surrounds $p$ exactly when it surrounds the whole wall.
  Its ratio to the ordinary weight is

#[#set math.equation(numbering: n => "(7.7)")
 $
   cases(delim: "{", v \( A_gamma \) = cos \( \( A_gamma - 1 \) lambda \) \/ cos lambda \, & gamma
   upright(" surrounds the wall") \,, u \( A_gamma \) = cos \( \( 1 + A_gamma \) lambda \) \/ cos lambda \, &
   upright("otherwise") .) $ <wall:closed-ratios>]

These formulas follow by counterclockwise intersection with the strings.
  A closed loop cannot separate the source of a nonzero open-arc term from the connected wall.
  Thus (7.7) lists all changes to its weight, including when some open arcs go far.
  Let $Y$ be the product of these ratios; only finitely many are nontrivial.

#thm([Lemma 7.1.])[
  (Distant normalization).  #emph[For sufficiently large fixed $L$, under the exterior positive tilt $nu_U prop U mu$,
#[#set math.equation(numbering: n => "(7.8)")
 $ bb(E)_(nu_U) \( Y \/ U \) gt.eq c_L > 0 \, wide bb(E)_(nu_U) \| Y \/ U \|^p lt.eq
   C_(p \, L) $ <wall:distant-moments>]

 for every fixed $p > 0$, uniformly for large $R_0$ and fine mesh.]
] <wall:distant>

#proof[
  Between consecutive endpoint scales use corridor annuli with radii $K r_j$ and $r_(j + 1) \/ K$,
    for a large fixed geometric constant $K$. Each winding loop wholly in corridor $j$ has ratio
    $v \( sum_(i lt.eq j) a_i \) gt.eq 1$, because the total charge magnitude is $2$.
    Let $M_j$ be the product of these ratios and $M = product_j M_j$.
    Besides the $U$ nests and these corridor loops, all nontrivial loops are counted by a variable $X$ having
    every fixed exponential moment uniformly under $nu_U$, with constants independent also of sufficiently large
    $L$. Indeed a loop excluding $z_(*)$ but surrounding an endpoint outside its local cutoff has a passage at
    that endpoint scale, since it separates the endpoint from $z_(*)$.
    A loop winding about $z_(*)$ and enclosing some but not all endpoints either lies in its corridor or passes a
    bordering scale. Fixed box and shell covers, disjoint from other endpoint buffers,
    and the tilt-edge passage estimates give the claim. Therefore, for a fixed $C$,
  #[#set math.equation(numbering: n => "(7.9)")
   $ \| Y \/ U \| lt.eq M C^X \, wide Y \/ U gt.eq M C^(- X) quad upright("off ") cal(B) \, $ <wall:MY>]
  where $cal(B)$ is the event that some loop excluding $z_(*)$ encloses at least two endpoints.
    Off $cal(B)$, all remaining ratios belong to a fixed finite positive set. Moreover
  #[#set math.equation(numbering: n => "(7.10)")
   $ bb(E)_(nu_U) M^b lt.eq C_b L^(C_b) wide \( b > 0 upright(" fixed") \) . $ <wall:M-moments>]
  To prove this, use $O \( log L \)$ dyadic passage bands per corridor, group disjoint buffers by colors,
    and apply Hölder; those buffers avoid the supports of the endpoint tilts.
  If a bad loop has smallest enclosed endpoint index $j$, it crosses corridor $j$ radially,
    and hence excludes every winding loop counted by $M_j$. Write $cal(B)_j$ for this event.
    Successive actual circuit blockers give
    $bb(P) \( cal(B)_j divides U upright(" patches") \, \( M_i \)_(i eq.not j) \) lt.eq C L^(- alpha)$, uniformly.
    On $cal(B)_j$ one has $M_j = 1$. First apply this conditional estimate to $product_(i eq.not j) M_i$,
    then Hölder with exponent $1 + delta$ close to one to absorb $C^X$,
    interpolating against the polynomial moment bound (7.10). For some $alpha' > 0$ independent of $L$,
  #[#set math.equation(numbering: n => "(7.11)")
   $ bb(E)_(nu_U) \[ M C^X upright(bold(1))_(cal(B)) \] lt.eq C' L^(- alpha') bb(E)_(nu_U) M . $ <wall:bad-relative>]
  The same interpolation, using arbitrary fixed exponential rates for $X$, gives for every $epsilon > 0$
  #[#set math.equation(numbering: n => "(7.12)")
   $ bb(E)_(nu_U) \[ M C^(- X) \] gt.eq c_epsilon L^(- epsilon) bb(E)_(nu_U) M . $ <wall:positive-relative>]
  Equivalently, Jensen under the $M$ tilt and the exponential bounds give an arbitrarily small coefficient of $log
    L$ in its mean of $X$. Take $epsilon < alpha'$ and then $L$ large.
    Equations (7.9)–(7.12), and $M gt.eq 1$, prove the positive lower bound in (7.8).
    Its moment bound follows from (7.9), (7.10), and Hölder. ◻
]

=== 7.4 Absolute source bounds and factorization <absolute-source-bounds-and-factorization>

We record the source-path placement used here and in gap closure.
  Both paths can be taken in regular simple tubes, on their nominal sides of the wall except at the flat launch.
  For an absolute estimate, temporarily slide the exterior pure-string endpoints at $p$ a small macroscopic
  distance toward the non-probe, $A$ side of the same solid wall.
  Keep all gaps and other marks farther away, and include the charge along the traversed bank interval as diagonal
  port phases. This is an equality of the summed pairing expression:
  ordered lanes allow a homotopy onto the bank without crossing a source path,
  and ice conservation gives the port phases. Pure lanes may cross one another.
  Charges still count from their original endpoints, so no extra charge is created at a temporary slide-end.
  The paired factors and the conventions used for gluing do not change.

After this temporary slide each tube has $p$ in the relative interior of a flat entrance face,
  with a clear portion on both sides; its target is deep inside, and its other sides avoid the wall, strings,
  and the other tube. Finitely many such choices cover compact probe sets.
  For each pairing, choose a path that crosses minimally the disjoint raw crosscuts of its tube.
  A sufficiently small separating crosscut cuts off $p$ locally on the entrance face:
  the small disk on one side cannot contain the deep target, so must contain the launch.
  Because the entrance is solid wall, it is an entire launch-straddling raw arc,
  not a short return of a larger strand. Every other traversed crosscut gives a macroscopic subpassage,
  even if one full strand visits the tube repeatedly. This construction also avoids entering tiny ordinary
  boundary-arc disks elsewhere.

The local launch weights are decisive. After the short strings and distant total charge are counted,
  the effective unpassed raw drop at $p$ is $- s$. Passing the exiting source prefix makes it $- s - 1$,
  with the $Q^(- 1)$ minus sign. Thus small nested launch arches have weight zero while unpassed and unit absolute
  weight while passed; only the last can mark a nonzero term.
  The other marked drops are $s \, t \, s$, with local unit weights.
  Ordinary same-bank arcs cancel local caps, and a physical corner without a wire change has zero-drop staggering.
  All remaining factors cost at most a constant per macroscopic passage.
  Consequently the source sum, divided by $U$ and the deterministic loop weights, is bounded by

#[#set math.equation(numbering: n => "(7.13)")
 $ \| Y \/ U \| thin C^(1 + X_0) \, $ <wall:absolute-source>]

where $X_0$ counts passages near the bounded wall and probe corridors and has uniform fixed exponential moments.

#thm([Proposition 7.2.])[
  (Complete-wall factorization).  #emph[For the complete wall,
    there are probe-independent complex numbers $a_n \( R_0 \, L \)$,
    bounded above and away from zero in modulus for the fixed large $L$, such that
#[#set math.equation(numbering: n => "(7.14)")
 $ cal(H)_(upright("full")) \( z \, u \) = a_n \( R_0 \, L \) h_n \( z \) J_n \( u \) +
   o \( 1 \) $ <wall:factorization-eq>]

 uniformly on interior compact probe sets. The error tends to zero with mesh first and then $R_0 arrow.r oo$.
   No limit of $a_n$ is asserted or needed.]
] <wall:factorization>

#proof[
  Under $nu_U$, bulk RSW circuits in the empty scales between the wall and the first endpoints make the
    probability that a raw open arc reaches the splitting scales tend to zero.
    On its complement the phase comparison above is exact. Lemma 27 and (7.13) make the error negligible even on
    the exceptional event, by Hölder.
  Choose intermediate radii $1 lt.double R_1 lt.double R_2 lt.double R_0$.
    The ideal tree integrand, including its open-to-deterministic reweighting,
    is readable inside $R_1$ when its boundary arcs stay there; set it to zero otherwise.
    Similarly $Y \/ U$ is readable outside $R_2$ unless a raw path joins that scale to the first endpoint bands:
    new loops at smaller scales have trivial ratios. All product truncation errors vanish under $nu_U$ by the
    moment estimates and RSW. The inward relative comparison across the intervening bulk annuli then factors their
    expectation up to $o \( 1 \)$. Applied to absolute parts,
    that comparison also replaces the inner tilted expectation by the unweighted one.
    The exterior coefficient is the fixed phase times $bb(E)_(nu_U) \( Y \/ U \)$ and the bounded tree/cap
    normalizations. Interior-exterior independence completes (7.14); Lemma 27 bounds the coefficient away from zero. ◻
]

== 8 Closing finitely many wall gaps <sec:closinggaps>

Reflection cuts will require vacancies in the wall. The following comparison removes them without estimating a
  signed observable by an additive error in its partition function.

Choose finitely many separated gap locations away from the marks and source or string corridors.
  Remove intervals of lengths comparable to $h$; at a genuine corner remove such intervals on both adjacent sides.
  Their endpoints are lattice vertices. At each tip, let $N_(upright("tip"))$ count raw arcs joining the two banks
  of that ray around its tip, wholly inside a sufficiently small cutoff box of scale $h$.
  Use disjoint buffered boxes, and set

#[#set math.equation(numbering: n => "(8.1)")
 $ T_g = product_(upright("tips")) \( cot lambda \)^(N_(upright("tip"))) . $ <gap:tip-tilt>]

All these factors are positive. Other gaps may already be present at fixed sizes and separated locations;
  include their analogous factors.

#thm([Proposition 8.1.])[
  (Gap closure).  #emph[Keep the distant charges and their locations fixed.
    Let $g$ denote the gapped wall and $f$ the wall obtained by closing the specified $h$-gaps,
    retaining any other gaps and tip factors. There are positive probe-independent numbers $b_n$,
    bounded above and below, such that
#[#set math.equation(numbering: n => "(8.2)")
 $ cal(H)_g \( z \, u \) = b_n cal(H)_f \( z \, u \) + o \( 1 \) $ <gap:comparison>]

 uniformly on interior compact probe sets. The error vanishes in the mesh limit followed by $h arrow.r 0$.
   Constants may depend on the fixed remaining features. In particular, a second,
   smaller collection of gaps may be closed before the first collection.]
] <gap:closure>

#proof[
  Use the same tile pairings in the cut conventions $g \, f$.
    A port interaction or raw arc is #emph[affected] if it uses a newly missing port;
    the gapped diagram joins the filled paths terminating on the two sides there. Write
  #[#set math.equation(numbering: n => "(8.3)")
   $ S = U T_f \, wide T = T_g \/ T_f \, wide nu_g prop S T mu_g \, wide nu_f prop S mu_f . $ <gap:tilted-laws>]
  The supports of $S$ are away from the closing gaps.
  ===== 8.1 Confinement and the local multiplier. <confinement-and-the-local-multiplier.>
  In the common collars at radii $h lt.double r_1 lt.double 1$,
    require a primal screen joining the wall rays in the sector carrying primal wire portions,
    and a dual screen in the other sector, which has no primal through wire.
    With diverging scale ratio, conditional RSW makes this inner good event tend to probability one under $nu_g$,
    even given the remote tilts and deeper tip data. It confines all affected paths to these neighborhoods.
    Moreover the outer primal connectivity induced by the inner fillings is the same for $g \, f$:
    every connection using the deeper patch must enter the already connected primal screen,
    including bypasses through its joined wire portions. Represent the wires by deterministic connections along
    their designated intervals. The FK Euler formula now makes $ell_f - ell_g$ local,
    equal to a difference of internal component counts plus deterministic constants.
    This can first be checked with all distant edges fixed.
  On this good event there is an exact local multiplier $B$ such that
  #[#set math.equation(numbering: n => "(8.4)")
   $ cal(O)_g = B cal(O)_f . $ <gap:pointwise>]
  It is the ratio of the affected spin weights, multiplied by $d^(ell_f - ell_g)$. It is positive.
    To check the latter assertion, view the local patch as a disk with two radial notches ending at the separated
    tips. A same-bank arc, even one threading the gap, has its usual staggered $d \, 1$ weights:
    simple-arc isotopy fixes its turn with the prescribed normal ends,
    and its endpoint high statuses are opposite by color parity.
    Orient an opposite-bank arc from its interior to its exterior port.
    Its endpoint directions are now the two interior normals; the high statuses agree,
    since the color to the left is the preceding interior gap at both ends. The matched boundary factors give amplitude
  #[#set math.equation(numbering: n => "(8.5)")
   $ frac(cos \( rho \( W + theta_i - theta_j \) \/ 2 \), sin lambda) . $ <gap:cross-bank-amplitude>]
  For ports on the same ray, turn minus normal difference is $plus.minus 2 pi$, giving $cot lambda$.
    For different rays it is zero, giving $1 \/ sin lambda$. Start with collinear rays,
    drawing a path around the finite tip or across the slot, respectively.
    Bending one ray through the intended right angle rotates its endpoint normal by the same amount,
    so the conclusion persists at a corner gap. All simple crosscuts with the same ends have the same lifted turn
    by isotopy. New closed internal loops have ordinary weight $d$,
    while the filled arcs have homogeneous-interval weights. Every local factor is positive.
  We need a comparison uniform as $h arrow.r 0$:
  #[#set math.equation(numbering: n => "(8.6)")
   $ K^(- \( 1 + X_h \)) T lt.eq B lt.eq K^(1 + X_h) T \, $ <gap:B-bound>]
  where $X_h$ is a finite sum of passage counts at scale $h$ and has uniform fixed exponential moments under
    $nu_g$. The following cap elimination avoids counting every straddle at intermediate scales.
    In both conventions remove affected boundary arcs of diameter below a small fixed fraction of $h$,
    together with their disk descendants. In $f$ these lie on homogeneous continuous intervals,
    including across the missing positions. In $g$, a short affected arc with solid ends is near a single tip,
    cutting off a disk against one continuous bank or across that tip change.
    Its disk is also short by the straight or single-corner geometry.
    No such disk spans both separated tips; at a corner both removed side portions have lengths comparable to $h$.
    Also remove, in both conventions, any common unaffected descendants needed for either elimination.
    Such descendants have both ends on a common bank piece and the same neutral disk and intervening arcs;
    their union is therefore an allowed common removal.
  Eliminate innermost arcs first. Zero-change cap increments cancel the $d \, 1$ factors.
    Across a single tip change the two statuses are both high or both low;
    one unmatched port is transported and no loop is created, leaving exactly the $cot lambda$ factor.
    No whole interval is erased by these local removals. Remaining caps still pair adjacent high-low ports with
    inherited status, apart from boundedly many end ties. The number of removed tip arcs differs from the tilt
    count by $O \( X_h \)$. Every surviving affected boundary arc has a non-short passage at the slot scale,
    so their number is also $O \( X_h \)$, using bulk, straight-wall, and tip buffers.
    For this count, filled paths are disjoint segments of gapped paths.
    The tilt-edge moment bounds apply also near the cutoff boxes.
  Remaining common raw arcs have the same ends. Their residual cap pairings differ at only $O \( 1 + X_h \)$
    ports: on every common solid interval, both pair consecutive high-low ports,
    interrupted only by interval ends and noncommon survivors.
    Thus their boundary-loop counts differ by at most this number, irrespective of long-range ties.
    New local closed loops cancel their ordinary spin weights. This proves (8.6) and retains the exact positivity.
  ===== 8.2 Absolute moments, including exceptional configurations. <absolute-moments-including-exceptional-configurations.>
  For every fixed power, both $cal(O)_g \/ \( S T \)$ and $cal(O)_f \/ S$ have bounded moments under $nu_g$,
    uniformly as the indicated gaps shrink; $cal(O)_f \/ S$ has the same bound under $nu_f$.
    Choose the two simple source corridors as in Section 7, with the ordered lanes and temporary start-clearance
    slide common to both cut conventions. On each pairing deform the paths to minimal tube separators.
    Both markers are outward sources and lie on distinct open arcs. Closed loops cannot mark.
    Apart from entire local launch arches, possible marked crosscut components are counted by macroscopic
    passages, also for repeated visits of a full strand. Local launch arches are zero while unpassed and have unit
    magnitude while passed, so only the last nested candidate can mark.
    This remains true when gaps open elsewhere. Other local flips have unit weights and can be avoided by the
    paths. Pure strings may meet remote arcs; at a wall mark their effects are exactly their specified bank
    charges and they do not alter ordinary small disks away from their endpoints.
  The short eliminations and the residual cap comparison just used remain valid as count estimates without
    confinement of long affected paths. Short affected arcs and loops are away from all insertions and are neutral
    except for their tip factors. Every non-short affected boundary arc costs a bounded factor per $X_h$.
    For the other boundary weights, use the residual count of $f$ and eliminate its local disks up to a fixed
    small macroscopic threshold, chosen relative to retained gaps and feature separations.
    This includes straddles at the newly filled homogeneous locations.
    Ordinary common disks cancel caps; flip and launch disks obey the preceding rules;
    a retained tip gives its designated positive factor, up to cutoff-scale passage errors.
    Any affected long survivor already costs $O \( X_h \)$. Thus the residual comparison has no loss per scale
    between $h$ and macroscopic distance.
  Internal closed ratios outside the local bulk tilt patches are trivial unless the loop has a macroscopic
    passage. For example, a loop enclosing a marker without its start also encloses an end of the marker’s
    boundary arc on a solid of length bounded below, and hence cannot be tiny.
    The same observation applies to loops cutting off starts on solids.
    The other strings have only their designated local endpoint nests.
    Very large loops enclosing all finite data have ratio one.
    All remote scales, including the distant charges, stay fixed while these gaps close.
    Consequently the absolute source sums, after their respective positive tilt factors are removed, are bounded by
  #[#set math.equation(numbering: n => "(8.7)")
   $ K^(1 + X_0 + X_h) . $ <gap:absolute>]
  Here $X_0$ is a fixed-scale passage count with every fixed exponential moment.
    Any trajectory of genuinely fixed diameter near a shrinking slot has a fixed-size subpassage outside a small
    neighborhood of its core, where the ordinary bulk or sector buffers apply.
    This also covers passages involving the newly opened wall; in $f$ use the disjoint raw segments already noted.
    Equation (8.7) proves all the stated moment bounds.
  ===== 8.3 Relative decoupling. <relative-decoupling.>
  Choose further scales $r_1 lt.double r_2 lt.double r_3 lt.double 1$, all ratios diverging.
    There is an exterior-readable approximation $F_(upright("out"))$ to $cal(O)_f \/
    S$ from outside the $r_2$ patches, exact unless raw passages traverse the common collar to $r_3$;
    set it to zero otherwise. Indeed, on this exterior good event,
    changing the fills inside $r_2$ affects only local arcs against homogeneous continuous bank intervals.
    Eliminate them and their intervening arcs with no net weight and the same remaining caps.
    To make this elimination common to all fills, remove the union of ports affected,
    or lying in an intervening interval, for some fill. Stable arcs from such an interval pair inside it and have
    that same neutral disk with its descendants. The untouched endpoints therefore see precisely the common
    adjacent-pair reconnection of the deleted blocks. Modified internal loops are ordinary and all remaining
    source data are unchanged. The moment bounds control its error under both relevant tilted laws.
  Let
  #[#set math.equation(numbering: n => "(8.8)")
   $ D_(upright("in")) = \( B \/ T \) upright(bold(1))_({ upright("inner good") }) . $ <gap:D-inner>]
  It is nonnegative, measurable inside $r_1$, and has bounded fixed moments and expectation in $\[ c \, C \]$,
    by (8.6) and the high probability of the good event. The outward two-sector case of Lemma 6 says that the
    conditional law of edges outside $r_2$, given an inner fill under $nu_g$,
    differs by relative $o \( 1 \)$ from its law under $nu_f$.
    The graph and local wire representatives in the intervening collars and farther out are common;
    only the inner partition can differ. For several patches, iterate this uniform comparison patch by patch.
    Conditioning the other interiors adds only local ties, with their common external wires represented along the
    sides. The factor $T$ is held inside and $S$ is remote, so the relative comparison persists after both tilts.
    It follows that
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(E)_(nu_g) \[ cal(O)_g \/ \( S T \) \] & = bb(E)_(nu_g) \[ D_(upright("in")) F_(upright("out")) \] + o \( 1 \)\
 & = bb(E)_(nu_g) D_(upright("in")) thin bb(E)_(nu_f) \[ cal(O)_f \/ S \] + o \( 1 \) . $ <gap:decoupling>]
  The errors follow from the preceding rare-event and moment bounds.
    The first factor is positive, bounded above and below, and independent of the probes.
    By (7.5) and (8.3), the two outer expectations in (8.9) are exactly $cal(H)_g$ and $cal(H)_f$.
    This proves the proposition. ◻
]

== 9 Holomorphicity from reflection and extraction <sec:holomorphic>

Assume now that the coordinates of $Omega$ are rational in the tile frame.
  Thus its true vertical wall levels are congruent to some $X_(*)$ modulo a fixed $G_(*) > 0$.
  All geometric constructions in this section are fixed before the mesh tends to zero.
  We first use small compact probe neighborhoods with the following strict margins:
  the two probe heights are distinct and avoid horizontal walls and feature heights;
  their abscissas avoid vertical wall levels; and the two probes are not on a common axis diagonal.
  Distant endpoints are placed at heights outside the probe bands. We remove these temporary exclusions at the end.

=== 9.1 The mixed stencil and the gaps <the-mixed-stencil-and-the-gaps>

For $v = z \, u$ and a tile-axis unit vector $e_k$, set

#[#set math.equation(numbering: n => "(9.1)")
 $ delta_(k \, v)^(\( 2 \)) F = F \( v + 2 n^(- 1) e_k \) - F \( v \) . $ <hol:two-step>]

The relevant stencil is

#[#set math.equation(numbering: n => "(9.2)")
 $ \( delta_(1 \, z)^(\( 2 \)) + i delta_(2 \, z)^(\( 2 \)) \) delta_(j \, u)^(\( 2 \)) \, wide j in { 1 \,
   2 } . $ <hol:mixed-stencil>]

Simple two-step extensions with a common arriving prefix express it as a vacuum tensor expectation containing one
  high and one low local insertion from Section 5. The first is the high combination because the two positive axis
  directions have relative coefficient $i$ in (9.2). All dependence on the stencil terms is localized in the two
  small probe boxes; all other paths are common diagonal strings.
  Fix the starts, homotopies, and lifts as in Section 7, with separate corridors and a final incoming path
  compatible with both positive extensions. These are valid tensor identities with gaps present.

The #emph[primary gaps] have widths comparable to $h$. They include all true corners,
  and openings on every vertical wall in each probe height band.
  One anchor height $y_(* \, i)$ per probe box suffices. Choose $H_i > 0$, with $2 H_i$ dividing $G_(*)$,
  sufficiently small that for every probe height $y_i$ in that box,

#[#set math.equation(numbering: n => "(9.3)")
 $ l_i = frac(y_i + y_(* \, i) - H_i, 2) \, wide y_i in \( l_i \, l_i + H_i \) $ <hol:marker-cell>]

with uniform margins. The two cell intervals are disjoint and lie in clear horizontal feature bands.
  Put a primary gap at height $y_(* \, i)$ on every vertical wall crossing the band.
  Round its ends to lattice vertices. We will also use #emph[secondary gaps], of much smaller width $sigma$,
  at finitely many points of the remaining straight solids.
  Thus every solid component used in the estimate is a separated straight fragment.

=== 9.2 Reflection inequalities and angular extraction <reflection-inequalities-and-angular-extraction>

An axis-parallel cut through tile vertices, vacant of solids, endpoints, and stencil boxes,
  gives a Hilbert-space Cauchy–Schwarz inequality for the plane vacuum.
  Each child keeps one half and adds its conjugate, arrow-reversed mirror,
  with exponent $1 \/ 2$ in the multiplicative inequality. This is the square-row Gram construction of Section 4,
  or its finite-cylinder limit. Diagonal strings can cross the cut transversely at its vertices:
  ice conservation reroutes any runs along the cut within a few vacant rows.
  Conjugation inverts the reflected charge, while reversing the joined path direction inverts it again.
  The flux therefore continues across the join, with no new endpoint or phase charge.

Call a stencil copy #emph[favorable] if the slope-$+ 1$ line through it lies in a clear slab of fixed positive
  macroscopic thickness, containing no solids, endpoints, other features, or other stencils.
  Its diagonal-time projection must differ from the others’.
  Parallel diagonal cuts inside this slab, with many positive-time rows on both sides, allow Proposition 21,
  based on Theorem 15, to extract the insertion with cost

#[#set math.equation(numbering: n => "(9.4)")
 $ O \( n^(- 1 - rho) \) quad upright("for a high insertion") \, wide O \( n^(- 1 + rho) \) quad
   upright("for a low insertion") . $ <hol:angular-costs>]

This extraction retains the two external state norms. We spell out which path identities make those norms
  independent of the choice within the stencil. After an odd number of reflections the local insertion is the
  $L_(+) \, Q^(- 1)$ alternative; its angular parameter is still $tau = +$, with the reflected high coefficient.
  Rewrite any backward increment locally as the negative of its forward counterpart.
  The common start and end and the compensation pairs from Section 5 put both high terms on positive-step paths.
  The arriving charge belongs to the background even if the original prefix came from the future side.
  In the vacant slab, funnel that background to common seams and one skirt avoiding the entire marker rectangle.
  The difference of the original and new routings is a closed chain whose face coefficient is the same at every
  prospective source edge. Ice conservation therefore gives one common scalar phase,
  rather than term-dependent phases. These changes stay inside the intact stencil box and vacant band,
  so all other stencil sums remain in the external states unchanged.

The two state norms are themselves reflected diagrams, now omitting the extracted middle band and using the
  positive intervening square-layer metric at the two cuts.
  Their diagonal chains join at shared level vertices with continuous flux.
  Thus their exponents are again $1 \/ 2$. No bound on arbitrary boundary-state norms is being assumed.
  Other favorable copies to either side, and their mirrors, remain favorable if the bands are sufficiently narrow.

Suppose a node has $k$ favorable copies. Extract one at a median projection.
  If $k_(-) \, k_(+)$ copies are strictly before and after it, its two norm children have $2 k_(-) \,
  2 k_(+)$ favorable copies. Each is at most $k$, and their half-average is $k - 1$.
  Under the successive half-weights the count reaches zero with expected time at most the initial count.
  Truncating at a sufficiently large finite depth therefore leaves an arbitrarily small expected residual count.
  Every extracted insertion is counted once at its node; otherwise total counts are preserved in half-average.
  All cuts and extraction bands avoid the other intact local data.

=== 9.3 The complete cost of the norm diagrams <the-complete-cost-of-the-norm-diagrams>

At a final leaf, bound the remaining tensor sum by an absolute winding expansion.
  Every retained straight segment, its features, and every remote endpoint is an intact reflected copy.
  In one common $+$ expansion, even-reflection copies use the original local weights,
  whereas odd-reflection copies use the absolute wrong-expansion weights.
  Indeed spatial reflection and travel reversal preserve the signed strand turn together,
  while conjugation reverses its phase. For positive comparison use direct cap wires on even copies and reflected
  complementary wires on odd copies, completing the disjoint straight slits by any deterministic planar positive
  caps. The local tables can then be read in their original bank coordinates.

Ordinary local arcs have exactly their high-low cap weights. Each flat mark contributes both banks.
  In the correct expansion the local magnitudes at all four flips are $1$;
  in the wrong expansion they are zero per local straddle at $p \, b \, d_0$ and $d$ at $c$, on each bank.
  At $p$ use the effective raw drop $- s$ and the exiting diagonal prefix; at the other marks use $s \, t \, s$.
  Negation of the effective shifts on a flat wall gives the wrong weights.
  Reflection cuts preserve these outgoing local charge data even if the strings subsequently continue to mirrors.
  Tip-cross factors on a straight fragment are $cot lambda$ in either absolute convention.
  Endpoints of charge magnitude $a$ have local closed-loop factors $u_(+) \( a \)$ on even copies and
  $u_(-) \( a \)$ on odd copies. There are no true corners on the solids.

Choose all local cutoffs smaller than the fixed cut margins.
  At any unextracted marker, a nonzero term requires its strand to reach a solid or another marker:
  a closed component cannot change orientation only once. It is therefore macroscopic,
  and no tiny surrounding loop can isolate the marker. Using vertex instead of source-edge endpoints changes
  positions by boundedly many mesh steps and costs only bounded passage factors.
  Every other nonordinary arc or loop has a macroscopic passage. There is no flux to infinity:
  each diagonal chain has total divergence zero after its source terminations are included,
  and the mirror joins create no new endpoints. Thus a closed loop enclosing all finite data has ordinary weight;
  one returning to the data while going far is counted among the macroscopic passages.

Cap elimination therefore bounds the absolute leaf expression, relative to its deterministic caps,
  by $C^(1 + X)$ times the product of the local factors just listed, where $X$ has every fixed exponential moment.
  A zero local factor means the corresponding absence indicator.
  Hölder and the positive local-tilt comparisons absorb $C^X$ at arbitrarily small loss in the coefficient of $log
  n$. The two banks at a mark count separately: conditional on their exterior data they are two half-sector
  patches separated by the solid wall, with only outer cap ties.
  Tip expectations agree up to constants with the original positive tip normalizations.
  For a complementary copy, reflect across the ray to exchange banks and wire assignments,
  then use radius and collar comparisons. Surface partition costs of the disjoint straight fragments compare to
  the products of their original single-fragment costs; the one-step polarity shift supplies the same comparison
  for complementary copies. These are the separated-patch and surface comparisons of Lemmas 5 and 10.

Accordingly each retained feature carries its original baseline:
  the vacuum-relative segment partition, the tip expectation, or $log F_(+) \( a \)$ for a bulk endpoint.
  The extra logarithmic costs on wrong copies are

#[#set math.equation(numbering: n => "(9.5)")
 $ 2 P upright(" per colocated ") s upright("-flip pair") \, wide
   2 D_(*) upright(" per ") t upright("-flip pair") \, wide log frac(F_(-) \( a \), F_(+) \( a \))
   upright(" per bulk endpoint") . $ <hol:wrong-costs>]

The errors are one-sided $o \( log n \)$ in the sense of Section 3.
  No decay from an unextracted insertion is used; its finitely many local terms cost only a constant.

Interpret the exponents $1 \/ 2$ on the reflection tree as probability weights.
  An original segment or other feature has expected copy count one:
  it is never cut or removed in an extracted middle band. Ensure at least one preliminary split.
  In each individual child of every split, every retained feature is paired with its opposite-parity mirror.
  Hence the final expected even and odd counts are both $1 \/ 2$ per original feature.
  The baseline costs average back to

#[#set math.equation(numbering: n => "(9.6)")
 $ log #scale(x: 120%, y: 120%)[\(] Z_g^(upright("cap")) bb(E)_(mu_g) \[ U T_g \] #scale(x: 120%, y: 120%)[\)] +
   O \( 1 \) . $ <hol:baseline>]

There are three $s$ marks and one $t$ mark, with both banks at each,
  and two endpoint-charge sets of total magnitude one. Thus the extra averaged cost is at most

#[#set math.equation(numbering: n => "(9.7)")
 $ 3 P + D_(*) + 1 / 2 sum_j log frac(F_(-) \( a_j \), F_(+) \( a_j \)) lt.eq 2 P + D_(*) + o \( log n \) lt.eq
   P + o \( log n \) . $ <hol:strict-budget>]

The first inequality uses (3.6) twice, and the second follows from (3.6) and $C_i gt.eq 0$.
  Since $P lt.eq - c_0 log n + O \( 1 \)$ for some $c_0 > 0$,
  this is a strict power saving available to pay for incomplete extraction and all small Hölder losses.
  Keeping the norm diagrams, the baseline, and the parity costs is essential to this saving.

=== 9.4 Making almost all stencil copies favorable <making-almost-all-stencil-copies-favorable>

#thm([Lemma 9.1.])[
  (Finite reflection templates).  #emph[For fixed primary gap widths and every $epsilon > 0$,
    one can choose finitely many reflection and extraction steps and finitely many secondary gaps so that the
    expected extracted count of each original marker is at least $1 - epsilon$.
    The cuts have strict macroscopic clearances. On any compact set of eligible probe pairs,
    finitely many such templates suffice, and one may use the union of their secondary gaps.
    All choices precede the mesh limit.]
] <hol:templates>

#proof[
  We first work at one probe pair with ideal real cuts, before a small generic perturbation.
    Divide a bounded vertical interval containing all data, with empty end margins,
    into finitely many distinctly labeled cells, including the two marker cells (9.3).
    Horizontal folds act on a word of cell labels. Splitting a word of length $m$ after position $j$ makes the two words
  #[#set math.equation(numbering: n => "(9.8)")
   $ W W^(upright("rev")) quad upright("and") quad V^(upright("rev")) V \, $ <hol:word-split>]
  where $W$ is the prefix of length $j$ and $V$ the suffix of length $m - j$.
    Their lengths are $2 j$ and $2 \( m - j \)$.
  Under the size-biased weights $j \/ m$ and $1 - j \/ m$, the vector of label frequencies is a bounded
    martingale. The expected terminal label frequency multiplied by the initial word length equals the expected
    terminal label count under the ordinary half-weights. Choose $j$ within a bounded distance of $m \/
    2$ to maximize the conditional frequency variance. These frequencies converge almost surely to a pure label.
    Here are the details. If the frequency vector $pi$ stays away from the vertices of its simplex,
    then some admissible near-middle prefix has
  #[#set math.equation(numbering: n => "(9.9)")
   $ parallel "counts"_(lt.eq j) - j pi parallel gt.eq c > 0 . $ <hol:frequency-deviation>]
  Indeed two consecutive choices differ by a single-label vector minus $pi$; they cannot both have small norm.
    The mixed length-two case is immediate. The conditional frequency variance is then at least $c' \/ m^2$.
  Along the size-biased chain, $sum m^(- 2) = oo$ almost surely.
    Lengths change by bounded amounts; the probabilities of its symmetric increments are $1 \/ 2 +
    O \( 1 \/ m \)$. Both the absolute conditional drift and conditional variance of $log
    m$ are $O \( m^(- 2) \)$. If the sum were finite, localization and martingale convergence would make $log
    m$ converge to a finite limit. Then $m$ would be bounded, contradicting the same assumed summability.
    A bounded frequency martingale cannot accumulate the divergent conditional variance in (9.9) while tending to
    a mixed limit. Length one, if reached, is already pure. This proves purity and hence arbitrarily small
    expected impurity at a sufficiently large finite depth.
  Outer-end folds retaining the whole word and its reflection can also make its length arbitrarily large;
    the empty child has zero size weight. In a branch, concentrate on its majority label if that label is a
    marker. For any prescribed finite run depth, only a proportion bounded by that depth times the minority
    frequency, plus the end contribution, fails to lie deep in a pure run of the majority.
    Their expected count can therefore be made arbitrarily small.
    Adjacent equal-label cells in the folded word alternate orientation.
    In a pure run of marker cell $i$, the vertical projection to the original cell is a triangular wave of period
    $2 H_i$. It sends every marker ordinate $b'$ to $y_i$ and $b' + H_i$ to $y_(* \, i)$, by (9.3).
  We next choose vertical cuts to align the marker abscissas with the primary gaps.
    All copies of a majority marker start from the same original abscissa $x_0$.
    Its farther clear side up to a neighboring vertical wall has width at least a fixed fraction of $G_(*)$;
    suppose this is the left side, reflecting the following construction otherwise.
    Take $H_i$ much smaller than this width. Cut just to the right of the current rightmost copy $a_max$ and
    retain the left child, including all marker columns there.
    The discarded child’s marker count is zero, so this loses no expected majority count.
    The left tail below $x_0$ still projects identically. If the cut is $c'$,
    the new rightmost copy and right-tail projection are
  #[#set math.equation(numbering: n => "(9.10)")
   $ a'_max = 2 c' - x_0 \, wide s' mapsto a'_max + x_0 - s' . $ <hol:tail-fold>]
  Keep the central projection in the wall-free abscissa interval.
    The first cut is close to $x_0$ on the right; subsequent distances $c' -
    a_max > 0$ can lie in the ample leftward clearance sampled by the old right tail.
  Drift the copy abscissas modulo $2 H_i$ toward $A_(*) = X_(*) - H_i$.
    Lift their distribution initially to mean $x_0$ and variance zero.
    At each step, with lifted mean $mu$, choose $c' equiv mu + v med \( mod med H_i \)$;
    reflected lifts are $2 \( mu + v \) - a$. The new mean is $mu +
    v$ and the variance increases by exactly $v^2$. Choose $N
    v$ to realize the required residue displacement to $A_(*)$ in the rightward direction,
    with bounded positive total displacement, and then choose $N$ large.
    The first cut fits its small right clearance and the later cuts their larger available clearance.
    Chebyshev’s inequality makes all but an arbitrarily small fraction of copies have residue within a small
    fraction of the primary gap width of $A_(*)$. At the last step,
  #[#set math.equation(numbering: n => "(9.11)")
   $ a_max + x_0 equiv 2 A_(*) med \( mod med 2 H_i \) . $ <hol:right-tail-residue>]
  For such a successful copy $\( a \, b' \)$, consider its slope-$+ 1$ line.
    Choose the pure-run depth larger than the entire folded horizontal support span divided by the cell width;
    this finite bound is known from the abscissa schedule before the word depth is chosen.
    Throughout the horizontal support of all data, the line then projects vertically into the clear marker band,
    so meets no horizontal wall or other feature height. In the central portion its abscissas avoid vertical
    walls. In the left tail, every projected vertical wall lies at $X_(*)$ modulo $2 H_i$,
    and hence at horizontal offset $H_i$ from $a$ up to the small residue error.
    The same is true in the right tail by (9.10)–(9.11). The triangular-wave identity therefore sends the ordinate
    at each such encounter into the primary gap at $y_(* \, i)$.
    The line has a wall-free slab of positive thickness. By designing first the finite abscissa schedule and its
    required run depths for the fixed $h$, then the word depth,
    the expected non-targeted or unsuccessful marker counts are arbitrarily small for each of the two original markers.
  Finally perturb every cut generically by a sufficiently small fixed amount.
    The finite successful inventory and strict clearances persist.
    Distinct stencil copies acquire distinct time projections:
    for copies with different reflection histories, their difference depends nontrivially on the last cut where
    the histories differ; distinct original markers with identical histories were separated by the
    generic-coordinate assumption. Keep cuts away from endpoints, marked features, tips,
    and coincident runs along solids. At every transverse solid intersection insert a secondary gap at its
    preimage on the original wall. There are finitely many such preimages,
    away from marks and corners after the perturbation. Thus all intended axis cuts become vacant.
  Each template works on a neighborhood of its initial probe pair.
    A finite cover of a compact support gives finitely many templates; take the union of all their secondary gaps,
    then choose $sigma$ sufficiently small. Additional removed portions only improve the clearances.
    Round cuts to vertex lines. These roundings and the $O \( 1 \)$-mesh shifts of the polygon preserve all fixed
    margins for fine mesh. Apply the finite median-extraction procedure above,
    with a further arbitrarily small residual count. This proves the lemma. ◻
]

#thm([Proposition 9.2.])[
  (Mixed derivative saving).  #emph[For fixed primary gaps and sufficiently small fixed secondary gaps chosen as
    in Lemma 30, there is $c > 0$ such that
#[#set math.equation(numbering: n => "(9.12)")
 $
   lr(|\( delta_(1 \, z)^(\( 2 \)) + i delta_(2 \, z)^(\( 2 \)) \) delta_(j \, u)^(\( 2 \)) cal(H)_g \( z \,
   u \)|) = O \( n^(- 2 - c) \) $ <hol:mixed-decay>]

 uniformly on the eligible compact probe sets. The constants and reflection-tree size may depend on these fixed gaps.]
] <hol:mixed-bound>

#proof[
  Choose the expected extraction deficit $epsilon$ in Lemma 30 small relative to $c_0$ in (9.7).
    The angular costs contribute at most
  #[#set math.equation(numbering: n => "(9.13)")
   $ - \( 1 + rho \) \( 1 - epsilon \) log n - \( 1 - rho \) \( 1 - epsilon \) log n = \( - 2 + 2 epsilon \) log
     n . $ <hol:extracted-cost>]
  The baseline (9.6) cancels the precise normalization in (7.5).
    The remaining feature cost is at most $- c_0 log n + o \( log n \)$ by (9.7).
    There are finitely many nodes, so all Hölder allowances may be chosen with total smaller than, say,
    $c_0 \/ 4$. Taking $2 epsilon < c_0 \/ 4$ leaves a strictly negative extra exponent. This proves (9.12).
    It uses finite templates fixed before the mesh, not any uniformity as their gaps shrink. ◻
]

=== 9.5 Removing the gaps and the exterior factor <removing-the-gaps-and-the-exterior-factor>

#thm([Theorem 9.3.])[
  (Holomorphic disk limit).  #emph[For every rational orthogonal polygon with the four flat marks and balanced
    approximations specified above, every locally continuous subsequential limit of $h_n$ is holomorphic.
    Consequently the boundary identification and crossing formula of Proposition 26 hold without its
    holomorphicity premise for these polygons.]
] <hol:disk>

#proof[
  Take a simultaneous locally convergent subsequence $h_n arrow.r h$, $J_n arrow.r J$.
    The ideal compactness statements do not use holomorphicity.
    On a product lattice coset for the step-two stencil, multiply (9.12) by a compactly supported smooth test
    function $phi \( z \, u \)$ in an eligible product neighborhood and sum with normalized mesh weights.
    Twice summing by parts and dividing by $\( 2 \/ n \)^2$ gives
  #[#set math.equation(numbering: n => "(9.14)")
   $ integral cal(H)_g \( z \, u \) \( partial_1 + i partial_2 \)_z partial_(j \, u) phi \( z \, u \) thin d^2 z
     thin d^2 u = o \( 1 \) \, $ <hol:gapped-distribution>]
  where the integral denotes the corresponding lattice Riemann sum before passage to a limit.
    The difference-to-derivative error vanishes because $cal(H)_g$ is locally bounded at fixed gaps by the
    absolute moment bounds. Every coset gives the same conclusion.
  First let the mesh tend to zero. Proposition 29, with its positive multiplier bounded above and below,
    transfers the zero limit from the secondary gaps to the primary-gapped wall as $sigma arrow.r 0$.
    Apply it again as the primary widths $h arrow.r 0$ to reach the complete wall.
    Finally use Proposition 28, whose scalar is bounded away from zero, and then let $R_0 arrow.r oo$.
    The ideal functions have compact convergence, so their lattice sums are ordinary Riemann sums. We obtain
  #[#set math.equation(numbering: n => "(9.15)")
   $ integral h \( z \) J \( u \) \( partial_1 + i partial_2 \)_z partial_(j \, u) phi \( z \, u \) thin d^2 z
     thin d^2 u = 0 . $ <hol:product-distribution>]
  No convergence of either comparison scalar is required: for each fixed geometric stage its inverse is bounded,
    and that stage’s error tends to zero in the stated order.
  Fix an interior $z$ off the finitely many feature projection lines.
    There is a generic exterior probe box eligible for this $z$ on which some distributional derivative $partial_j
    J$ is nonzero. Otherwise both derivatives would vanish off the finitely many excluded lines in the connected
    strip; continuity would make $J$ constant on the whole strip,
    contradicting its different limiting values at $p \, d_0$.
    Shrink the $z$ neighborhood and this probe box to retain all strict margins.
    Product tests in (9.15), with a probe test pairing nontrivially with $partial_j J$,
    give $\( partial_1 + i partial_2 \) h = 0$ distributionally near $z$. Thus $h$ is holomorphic there.
    Its continuity extends holomorphicity across the finitely many exceptional straight lines by Morera’s theorem,
    splitting triangles along those lines and passing to the limit. Proposition 26 now applies. ◻
]

== 10 Transfer to marked Jordan quadrilaterals <sec:jordan>

Throughout Sections 10–12, fix $1 lt.eq q < 4$ and write

$ d = sqrt(q) = 2 cos lambda \, wide rho = lambda \/ pi \, wide h = 1 - 2 rho in \[ 1 \/ 3 \, 1 \) . $

The four-change calculation of Section 6, whose holomorphicity hypothesis is supplied in Section 9, gives the functions

#[#set math.equation(numbering: n => "(10.1)")
 $ f \( chi \) = frac(I_C \( chi \), I_B \( chi \) + I_C \( chi \)) \, wide g \( chi \) =
   frac(f \( chi \), f \( chi \) + d \( 1 - f \( chi \) \)) \, quad 0 < chi < 1 \, $ <jordan:functions>]

where

$ I_B \( chi \) & = integral_chi^1 u^(rho - 1) \( u - chi \)^(rho - 1) \( 1 - u \)^(1 - 3 rho) thin d u \,\
I_C \( chi \) & = integral_1^oo u^(rho - 1) \( u - chi \)^(rho - 1) \( u - 1 \)^(1 - 3 rho) thin d u . $

The first function is the probability in the open-cap normalization;
  the second is the probability of an #emph[actual open path] between the two separately wired intervals.
  Wiring changes component weights; it does not supply an open path between different intervals.

#thm([Proposition 10.1.])[
  (Jordan-quad transfer).  #emph[Consider the marked, uniformly convergent square lattice polygon approximations
    $\( D_n \; a_n \, b_n \, c_n \, d_n \)$ to a bounded Jordan quadrilateral $\( D \; a \, b \, c \, d \)$ in the
    four-mark sense of Subsection 1.3. Keep every edge of the polygon graph random,
    and separately wire the two closed arcs $a_n b_n$ and $c_n d_n$, with no other primal identifications.
    If $psi : D arrow.r bb(H)$ sends $\( a \, c \, d \)$ to $\( 0 \, 1 \, oo \)$ and $chi = psi \( b \)$,
    the probability of an actual open path between these arcs tends to $g \( chi \)$.]
] <jordan:transfer>

#proof[
  First consider a fixed rational orthogonal polygon in tile coordinates.
    The deterministic caps of Section 2 contribute one or two additional loops according to the pairing.
    Their weight ratio is exactly the factor $d$ in (10.1), so the four-change formula gives $g$.
    If its designated color lies on the dual grid, translate the complete tile domain, switches,
    and caps by one tile step. This preserves its loop law and makes that color the prescribed primal grid,
    at a geometric cost $O \( delta_n \)$. Consequently there are suitable approximations of every fixed test
    polygon on the #emph[same] lattice as the target graph.
  Choose a plane Schoenflies homeomorphism taking $overline(D)$ to the unit square,
    with the two electrodes on the left and right sides. Uniform marked boundary convergence and winding number
    imply the following strict inclusions for all sufficiently large $n$:
    $D_n$ contains every closed inset square and is contained in every prescribed neighborhood of the square in
    these coordinates; its four marked arcs are close to their corresponding sides. Fix $epsilon > 0$.
    In physical coordinates polygonize the pullbacks of
  $ \[ epsilon \, 1 - epsilon \] times \[ - epsilon \, 1 + epsilon \] quad
    upright("and") quad \[ - epsilon \, 1 + epsilon \] times \[ epsilon \, 1 - epsilon \] . $
  Call these the easier and harder test quads, respectively,
    and put their electrodes on the nearly vertical sides. Take the polygonization error in Schoenflies
    coordinates smaller than $epsilon \/ 10$, with marks in flat side interiors,
    and retain this margin after all tile translations. Such simple rational orthogonal polygonizations exist:
    first use radial shrinking in a Carathéodory disk parametrization to obtain an analytic Jordan approximation,
    then a fine simple polygon; replace each segment by a rectangular staircase inside its own thin corridor and
    join adjacent staircases in disjoint small vertex neighborhoods.
    The marks can be placed in order in side interiors. These constructions give marked uniform convergence as
    $epsilon arrow.b 0$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (2.46, 2.46), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.328, -0.246), (2.132, -0.246), (0.328, 2.706), (2.132, 2.706), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.328, -0.246), (0.328, 2.706), (2.132, -0.246), (2.132, 2.706), stroke: (thickness: 1.2pt, miter-limit: 10))
  content((1.23, 1.23), [easier])
  content((1.23, -0.451), [upper comparison], anchor: "north", padding: 0.1176cm)
  rect((4.264, 0), (6.724, 2.46), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((4.018, 0.328), (6.97, 0.328), (4.018, 2.132), (6.97, 2.132), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.018, 0.328), (4.018, 2.132), (6.97, 0.328), (6.97, 2.132), stroke: (thickness: 1.2pt, miter-limit: 10))
  content((5.494, 1.23), [harder])
  content((5.494, -0.451), [lower comparison], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 3: The Jordan-quad comparison in Schoenflies coordinates. The dashed square is the limiting target; thick sides are separately wired electrodes. The easier quad extends beyond the free sides and ends inside the target’s electrode sides. The harder quad has the opposite inclusions. Physical test polygons retain strict margins after pullback and lattice approximation. ],
  ) <jordan:sandwich-figure>
  For the upper bound, restrict both laws to their common primal edges in the easier quad.
    Any target edge outside this common graph can attach to it only on its two electrode sides:
    the easier horizontal sides lie strictly outside the target.
    Outside pieces cannot join the two electrode sides, even through a target wire block,
    because the substantial intervening strip lies wholly inside the easier quad and the two target wire blocks
    lie in separate exterior zones. Thus the target’s induced boundary partition on the common graph is weaker
    than separate wiring of the easier electrodes. Domain Markov and FK monotonicity give a coupling in which the
    easier common-edge configuration dominates the target’s. Every actual target crossing contains a common-edge
    crossing of the easier electrodes. Indeed, follow it from the initial exterior zone to the opposite zone,
    taking its last exit from the first and first entry into the second;
    its intermediate edges must belong to the common graph. There is no escape through the distant horizontal sides.
  For the lower bound interchange the roles using the harder quad.
    Its exterior pieces can attach to the target only on the designated target arcs,
    and cannot link opposite sides outside the common graph. Here it matters that the target contains #emph[all]
    lattice edges in its closure, and that both graphs use exactly the same primal grid.
    The target wires therefore dominate the induced harder-quad partition.
    Every harder crossing contains an actual shared-edge piece joining the two target arcs.
    This proves the lower comparison. All transitions occur at ordinary graph vertices;
    shrinking lattice edges have uniformly shrinking diameter in Schoenflies coordinates,
    so the strict margins justify the discrete versions of the statements.
  The conformal cross-ratios of the two test quads tend to $chi$.
    Indeed uniformly convergent parametrizations of Jordan curves imply uniform local connectedness of their
    boundaries: points close in the image have parameters close in the circular order,
    except for the identified endpoints, because the limiting parametrization is an embedding.
    Kernel convergence and boundary extension of normalized Riemann maps then give marked conformal convergence
    #cite(label("Pommerenke1992")). Since $g$ is continuous on $\( 0 \, 1 \)$, let first $n arrow.r
    oo$ and then $epsilon arrow.b 0$ in the two comparisons. ◻
]

#thm([Corollary 10.2.])[
  (The prescribed bond-percolation crossing).  #emph[At $q = 1$, with every edge, including every boundary edge,
    sampled independently with probability $1 \/ 2$ and with no wiring,
    the probability of the event $C_n$ defined in Subsection 1.3 tends to
$ frac(integral_0^chi \[ t \( 1 - t \) \]^(- 2 \/ 3) thin d t, integral_0^1 \[ t \( 1 - t \) \]^(- 2 \/ 3) thin d t) . $

]
] <jordan:cardy>

#proof[
  For $q = 1$ the boundary partition does not change the edge law, and $d = 1$ gives $g = f$.
    The $rho = 1 \/ 3$ specialization of the four-change integral calculation is precisely the displayed
    expression. The comparison in Proposition 33 concerned actual edge paths throughout,
    so no external wire is counted as a crossing and no interface-event continuity assertion is needed. ◻
]

== 11 Alternating tests after exploration <sec:movingtests>

The Jordan result alone does not apply to a domain cut out by a random exploration.
  We prove the needed extension directly under the original lattice law.
  Conditional errors at exceptional histories will be controlled by an #emph[averaged] six-arm estimate.

=== 11.1 Geometry and conditional laws <geometry-and-conditional-laws>

#thm([Lemma 11.1.])[
  (A compatible simple drawing).  #emph[The prescribed polygon graph and its Dobrushin strand admit a tile and
    collar representation in a Jordan polygon $V_n$ such that:]
  + #emph[$V_n$ has the same marked uniform Jordan limit as $D_n$;]
  + #emph[the rounded strand is simple, visits the same ordered local pieces as the prescribed medial strand,
    and is at curve distance $O \( delta_n \)$ from it;]
  + #emph[at every switch-revealing stop, the remaining domain is a simple slit disk.
    Under deterministic cap closure its unrevealed edges have the original conditional FK law,
    with known open edges contracted and known closed edges deleted;]
  + #emph[primal and dual banks of the prefix have physical access to their corresponding known edges and wire
    vertices within $O \( delta_n \)$. Every completion of the unknown edges embeds its actual paths in the slit
    disk without crossing the past.]
  #emph[The construction can use identical domains and caps away from an interval where two additional boundary
    changes are inserted.]
] <moving:drawing>

#proof[
  Make one tile for each edge of the polygon graph, including boundary edges.
    Glue the four triangles directed toward each interior square center.
    The exterior triangle of a boundary edge is a separate tab, with its own outer dual vertex;
    do not glue different exterior tabs along their radial sides.
    Each primal boundary vertex retains all its interior incidences.
    Flatten the exterior tabs toward their bases, to less than half their original height,
    and add a still thinner Jordan collar. The tabs are then disjoint except at their prescribed vertices.
    All changes lie within $O \( delta_n \)$ of the original boundary,
    and tracing the tabs and collar along the original parametrization proves (i).
  Draw the switches and boundary caps as disjoint arcs. A local wire can be drawn behind its cap in the collar.
    The unmatched ports continue to the marked outer-boundary points.
    The finite choices inside each tile and the collar can be made deterministically.
    At a wired boundary edge, capping its outer dual vertex joins the inside ports in the same way for either
    switch state. Declaring that edge open for the drawing merely substitutes a cap-sized detour and possibly
    deletes a microscopic loop. On the free side, the cap around a primal vertex is exactly the turn beside the
    dual wired arc. Inside the polygon, glued half-segments give the specified medial edges and their quarter-turn
    pairings. Match corresponding ordered pieces in the two drawings.
    Each substituted piece lies in boundedly many neighboring tiles,
    so simultaneous parametrizations have distance $O \( delta_n \)$.
    Zero-length pieces are handled by limits of increasing reparametrizations.
    This also covers a midpoint visited with both prescribed pairings and proves (ii).
  The tile/cap Euler identity gives exactly the conditional FK law asserted in (iii).
    On a queried primal-open tile the adjacent primal corners are joined by its actual edge;
    on a queried closed turn the bank stays at one primal corner.
    Along a cap it stays at one vertex or uses neighbors already belonging to that wire interval.
    Thus the bank is a known chain attached to the appropriate original interval,
    and every queried primal-open edge accesses this bank within one tile.
    The same statement holds for dual edges. Designated outer vertices access their arcs through the collar.
    These are physical accesses, not additional identifications.
    They prove (iv), also when the last begun tile is revealed in full.
    Projecting back to the usual primal or dual lattice moves points by $O \( delta_n \)$ and duplicates no edge;
    separate virtual copies of a vertex may become one physical vertex. ◻
]

In a four-open-change experiment, deterministic closure with separate wires of one color differs by a density
  depending only on the two pairing outcomes. This density and its reciprocal are bounded by constants depending
  on $q$. At a switch-revealing stopping time the odds change is still exactly

#[#set math.equation(numbering: n => "(11.1)")
 $ p mapsto frac(p, p + d \( 1 - p \)) . $ <moving:odds>]

One obtains this by conditioning the #emph[full] finite-sample density,
  not by postulating a Markov property for a limiting curve.
  Consequently conditional rare-event probabilities in a deterministic-cap law can be averaged under open-cap
  histories at a bounded multiplicative cost.

#thm([Lemma 11.2.])[
  (Small-interval behavior).  #emph[For $f$ in (10.1),
$ f \( 1 - chi \) = 1 - f \( chi \) \, wide f \( chi \) =
  c_q chi^h \( 1 + o \( 1 \) \) quad \( chi arrow.b 0 \) \, wide c_q > 0 . $

]
] <moving:asymptotic>

#proof[
  The substitutions $u^(- 1)$ in $I_C$ and $u = 1 - \( 1 - chi \) t$ in $I_B$,
    followed by the Euler transformation of the beta integral, give
  $ I_B \( chi \) = (frac(1 - chi, chi))^h I_C \( 1 - chi \) . $
  Both $I_C \( 0 \)$ and $I_C \( 1 - \)$ are finite and strictly positive:
    at the possible singularity $u = 1$, the latter integrand has exponent $- 2 rho > - 1$,
    while the integrand at infinity has exponent $- 1 - rho < - 1$.
    Substitution into (10.1) proves both claims, with $c_q = I_C \( 0 \) \/ I_C \( 1 - \)$. ◻
]

#thm([Theorem 11.3.])[
  (Moving four-change test).  #emph[Let a four-change strand in $V_n$ be stopped before completing its strand,
    revealing only the switches it has encountered. Let $U_n$ be its remaining simple slit disk,
    with the tip as the new starting mark. Consider histories for which a fixed basepoint has a fixed positive
    disk in $U_n$, and the four prime-end marks in a disk chart normalized at that basepoint remain mutually
    separated by a fixed positive amount. Then, on these histories,
#[#set math.equation(numbering: n => "(11.2)")
 $ bb(P)_(upright("open")) \( E_(upright(P)) divides cal(F)_n \) - f \( chi_(U_n) \) med arrow.r med 0 quad
   upright("in probability") . $ <moving:limit>]

 Here $E_(upright(P))$ is the primal pairing event, equivalently the actual bridge event after separate primal
   closure, and $chi_(U_n)$ is its current ordered cross-ratio.
   The assertion holds for arbitrary mesh-dependent stopping rules satisfying this localization.]
] <moving:slit>

We supply the proof in several steps. Every annulus used below lies a fixed positive distance inside the original
  domain before its mesh limit is taken. The inputs are the bulk passage estimate of Section 2,
  the vanishing full-lattice one-arm bound with wired rims, and the six-arm estimate

#[#set math.equation(numbering: n => "(11.3)")
 $ bb(P) \( A_6 \( r \, R \) \) lt.eq C \( r \/ R \)^(2 + c_0) \, wide c_0 > 0 \, $ <moving:sixarm>]

for the critical square-lattice FK law with this fixed $q < 4$ #cite(label("DMT2021Fractal")) Corollary 6.7.
  An outer buffer and the bulk boundary-condition comparison transfer this estimate from the infinite-plane law to
  the original finite law. Bounded open-cap reweightings are harmless.
  No six-arm estimate conditioned on an arbitrary explored maze is asserted.

#thm([Lemma 11.4.])[
  (Physical paths and chart oscillation).  #emph[Let $u_n$ be the horizontal coordinate of the conformal rectangle
    map of $U_n$, with the designated primal arcs at $0$ and $1$.
    Under the localization in Theorem 37, there is a common modulus tending to zero for the oscillation of $u_n$
    on a connected path of vanishing physical diameter, including paths with accesses to the prime boundary.
    Consequently, for $beta > 0$, a possible primal path starting in $beta lt.eq u_n lt.eq 1 -
    beta$ cannot reach a known primal-open edge or a primal electrode inside a sufficiently small physical ball.
    “Possible” means that all still unknown primal edges are filled open, before any external wire jump is permitted.]
] <moving:chart-modulus>

#proof[
  Away from the normalizing point, a connected set in a ball of radius $r$ is hit before domain exit by Brownian
    motion from that point with probability tending uniformly to zero as $r arrow.b 0$.
    Comparison with a fixed enclosing Euclidean annulus gives this bound.
    In the normalized disk, a connected set of a fixed positive diameter has hitting probability bounded below;
    this follows, for example, by a crosscut between separated angular sectors and the Beurling estimate.
    The rectangle maps of the disk form a compact family because the four marks remain separated.
    Thus a small physical continuum cannot have a macroscopic rectangle-coordinate oscillation.
    Near the basepoint use interior distortion instead. Endpoint accesses follow by interior approximation.
  By Lemma 35, every known primal-open edge and fixed primal wire attachment accesses $u_n =
    0$ or $1$ within $O \( delta_n \)$. A short possible connection from the central band to one of them would
    contradict the just-proved modulus. Small buffers in the band absorb individual tile errors.
    In particular the two opposite designated intervals have not already met through the revealed bank under the
    stated nondegeneracy. ◻
]

#thm([Lemma 11.5.])[
  (Deletion and protected-ball costs).  #emph[Fix a history and use separate deterministic primal closure.
    Deleting a set of still random edges changes the actual crossing probability by at most the conditional
    probability that an endpoint of a deleted edge reaches a wire interval by an actual open path,
    allowing one initial test step over the deleted edge. For a central-band set contained in a ball of radius
    $r$, this cost is bounded by a quantity tending to zero as $r arrow.b 0$, uniformly in the history and center,
    provided its required outer radius is fixed and the mesh is sufficiently small.
    The same holds for any fixed finite number of such balls.]
] <moving:deletion>

#proof[
  Couple the deleted and original laws monotonically. Explore the actual open clusters from all deletion endpoints
    in the stronger configuration, revealing the corresponding edges in both laws.
    FK partition monotonicity persists at every step. After the clusters are enclosed by their closed cuts,
    the conditional laws outside agree and can be coupled identically.
    If no explored cluster reaches a wire interval, the crossing decision is unchanged.
    This proves the first assertion, including contact with a wire along a known bank.
  Choose the fixed outer radius small enough for Lemma 38. Every component of possible edges inside this ball that
    meets the central-band set has no accessible wire or known primal-open attachment.
    Its uncertain boundary connections can occur only at the ball rim.
    Project to the physical lattice, fill missing edges, and wire that rim.
    Splitting physical vertex copies only weakens the original induced partition.
    The full-lattice wired-rim law therefore dominates every relevant actual arm simultaneously.
    Cropping the ball slightly absorbs tile errors. Its one-arm probability from radius $r$ to the fixed outer
    radius tends to zero: buffered dual circuits from RSW block such an arm.
    A finite union bound gives the last assertion. ◻
]

=== 11.2 A directed obstacle away from possible connections <a-directed-obstacle-away-from-possible-connections>

Fix a small trimming parameter $a_(*) > 0$ and then $0 < beta < a_(*) \/ 20$.
  A primal vertex is a #emph[candidate] if its chart coordinate lies in $\[ beta \, 1 - beta \]$ and it has a
  possible connection to an electrode. Each candidate supplies a possible arm to a fixed positive physical
  distance, by Lemma 38.

#thm([Lemma 11.6.])[
  (Flagged cells and their cost).  #emph[In a fixed bulk block let $pi$ be a simple known primal bank path.
    Choose fixed scales $ell lt.double R_1$, away from its endpoints and the original boundary.
    Flag a deterministic grid cell of side $ell$ if, in its annulus from $100 ell$ to $R_1$,
    the prefix already supplies four cyclically alternating actual arms,
    its two primal arms being known wired bank paths. If a candidate within $O \( ell \)$ of this cell actually
    connects to an electrode, then six actual alternating arms occur in a cropped annulus from $200
    ell$ to $R_1 \/ 2$. For a bounded region covered by the deterministic cells,
    the averaged conditional attachment cost of all flagged cells is at most
#[#set math.equation(numbering: n => "(11.4)")
 $ C ell^(- 2) \( ell \/ R_1 \)^(2 + c_0) = O_(R_1) \( ell^(c_0) \) . $ <moving:flag-sum>]

 The statement remains valid with one initial test step and with the bounded cap changes in (11.1).]
] <moving:flags>

#proof[
  The extra actual primal arm cannot make a lateral connection to either known primal leg inside the wider
    annulus, even in the all-unknown-primal-open completion, by Lemma 38.
    On the side containing the extra arm it is bracketed by the two known primal legs.
    A planar crossing alternative in each intervening strip supplies a dual radial separator.
    The original dual separator on the other side remains. After cropping at both rims,
    these three primal and three dual arms are disjoint and alternate.
  For precision, thicken actual paths to their tile color territories.
    An open transversal between two primal territories would give an actual lateral bridge,
    with an error of at most one tile. Its absence forces a dual territorial radial crossing in the intervening
    topological rectangle, which shadows a dual edge path in the cropped annulus.
    If the no-bridge test is made after every unknown primal edge is opened,
    every dual separator so obtained consists of known closed tiles.
    Thus the four old legs and the separators used in this argument are actual original edges;
    no auxiliary boundary condition manufactures them.
  Apply (11.3) in the original full-sample law to each cell of the deterministic grid,
    then sum over $O \( ell^(- 2) \)$ cells. The center may have been selected by the past because the sum was
    taken over the entire deterministic grid. Bounded cap densities control the averaged conditional probabilities
    under either history law. Markov’s inequality now makes the conditional flagged-cell cost small outside a set
    of histories of small probability. This is an annealed-to-conditional argument,
    with $R_1$ and all comparison constants fixed before $ell arrow.b 0$. ◻
]

#thm([Lemma 11.7.])[
  (Directed obstacle).  #emph[After removing histories of arbitrarily small probability and allowing an
    arbitrarily small conditional deletion cost, there is a Jordan polygon $H$ containing the basepoint,
    selected from a finite list at each fixed accuracy, with the following properties.
    Its boundary follows the original boundary and explored prefix to that accuracy;
    away from finitely many protected balls and flagged cells it has fixed positive clearance from all central
    candidates. As the accuracies decrease, $H$ and $U_n$ have the same pointed kernel limits.
    Artificial marks in $H$ may be chosen with disk angles arbitrarily close to the corresponding angles in $U_n$.]
] <moving:obstacle>

#proof[
  We give the construction and its scale order. Retain only prefix excursions reaching depth $r$ from the limiting
    Jordan boundary, including each complete segment between successive visits to depth $h_b lt.double
    r$ and the last incomplete segment if present. Their number is tight, uniformly in small $h_b$,
    because each visits one of a fixed finite family of bulk annuli at depth $r \/ 2$.
    First bound this number, then choose $h_b$ small. Join their boundary-near endpoints to the exterior of a
    slightly larger polygon through protected balls of radius $O \( h_b \)$.
    Lemma 39 controls central attachments in these finitely many balls.
    No boundary arm exponent for the rough Jordan curve is needed.
  Break the retained excursions into blocks of diameter at most $epsilon.alt lt.double h_b$,
    each contained with margin in a bulk square $S$ of side $10 epsilon.alt$.
    Successive displacement thresholds and the bulk passage estimate make the number of blocks tight.
    After fixing a block-count cutoff, snap its endpoints to a much finer deterministic grid and protect them by
    balls of radius $e lt.double epsilon.alt$. The actual known primal bank gives a path between the true
    endpoints in $S$; loop erasure gives a simple path $pi$, possibly trivial. Take
  $ ell lt.double R_1 lt.double e \, $
  so all flag annuli are bulk annuli. Declare forbidden every closed $ell$-cell within $3 ell$ of a candidate,
    except flagged cells and cells in enlarged endpoint protections.
  There is a connector between the protected endpoints avoiding all forbidden cells.
    Otherwise planar cell separation gives a polygonal circuit through a chain of touching forbidden cells and
    possibly the exterior of $S$, separating the two endpoints.
    It can be chosen away from their protection balls and within a cell-sized error of the cell chain.
    Choose a candidate witness in each cell. Two successive witnesses can be joined avoiding $pi$ inside a disk of
    radius $O \( R_1 \)$. If they could not, a proper crosscut of the simple path $pi$ would separate them in a
    circle of radius between $4 R_1$ and $6 R_1$. Its full-path endpoints lie outside because the cell is away
    from endpoint protections. The crosscut passes within $O \( ell \)$ of the witness segment.
    The two witnesses have possible arms to that circle, on opposite sides of $pi$,
    and cannot connect locally to $pi$ by Lemma 38. The two known radial legs of $pi$ and the two possible arms
    consequently interlace. In each intervening strip the optimistic no-bridge test supplies a #emph[known] dual
    radial separator, as in the proof of Lemma 40. The cell is therefore flagged, a contradiction.
  Push the separating circuit through the witness points and these avoiding joins.
    Its displacement is $O \( R_1 \)$, smaller than its distance from the endpoints,
    so its winding distinction is preserved. Along the exterior of $S$ avoidance is automatic because $pi$ has an
    interior margin. We have obtained a separating circuit disjoint from $pi$, which is impossible.
    Overlapping endpoint protections or a trivial $pi$ are handled by a connector within their union.
  Select one polygonal connector for each allowed finite grid pattern.
    Their union and the protected exterior attachments form an obstacle $K$ attached to the complement of the
    larger polygon. The connectors need not form one simple curve.
    They stay close to the retained prefix, and every omitted prefix piece is boundary-near;
    conversely the entire prefix is approached by this obstacle or the outer wall.
    Within distance $ell \/ 2$ of $K$, candidates occur only in flagged or protected error regions.
    The basepoint component of the complement is simply connected,
    because each obstacle component is attached to the exterior.
    It is a fixed polygonal domain, possibly with slits and pinches.
    An interior radial approximation in its Riemann map, followed by a polygonal perturbation,
    gives a Jordan domain $H$ whose boundary is within $ell \/ 10$ of the obstacle or outer wall.
    The outer wall was chosen much farther than $ell$ from the original graph. Hence the asserted clearance holds.
    Every choice is from a finite list at fixed scales and count cutoffs.
  Normalize maps of $H$ and $U_n$ at the same basepoint, and transfer marks by finite-grid approximations to their
    disk angles. On a Hausdorff subsequence of the original boundary and prefix,
    every compact path in the limiting basepoint component eventually belongs to both constructions,
    while every limiting boundary point is approached by complements of both.
    Thus their pointed kernels agree, and their normalized interior charts have the same limit.
    This is an interior statement; no locally connected boundary for the limiting slit domain is asserted.
    The fixed basepoint margin and separation of the marks persist throughout. ◻
]

=== 11.3 Alignment of the comparison charts <alignment-of-the-comparison-charts>

#proof[
  It suffices to prove an upper bound for the primal connection under separate deterministic primal closure.
    Interchanging the colors and using the other deterministic closure gives the complementary upper bound;
    (11.1) then yields the open-cap limit.
  Use Lemma 41, and write $u$ and $v$ for the rectangle abscissas in $U_n$ and $H$.
    Test on the Jordan subquad of $H$ between $v = a_(*)$ and $v = 1 - a_(*)$, with these sides separately wired.
    At fixed accuracy there are finitely many such quads; approximate each on the original color grid by the
    polygon construction of Proposition 33. Their limiting crossing probabilities differ from $g \( chi_(U_n) \)$
    by arbitrarily small trimming, chart-angle, and kernel errors, uniformly under the nondegeneracy assumptions.
  We justify comparison on shared edges. Take a fine finite grid of abscissa bins in the central part of
    $\( 0 \, 1 \)$, with width much smaller than both $beta$ and $a_(*)$.
    In each bin choose a nearby vertical fiber for each chart.
    Its central part is a compact internal curve and is matched in the other chart by kernel convergence.
    Its two remaining tails can be confined to balls of vanishing radius, with matched centers.
    Here is the required length–area argument. Remove small fractions of rectangle height at top and bottom.
    For each fixed fraction, inverse maps and derivatives converge on the compact retained rectangles.
    Let that fraction decrease slowly. For a bin $I$ and a deleted height interval $J$, Cauchy–Schwarz gives
  $ integral_I #h(-0.16667em) "length" #scale(x: 120%, y: 120%)[\(] Phi \( { x } times J \)
    #scale(x: 120%, y: 120%)[\)] thin d x lt.eq \( \| I \| \| J \| \)^(1 \/ 2)
    (integral_(I times J) \| Phi' \( z \) \|^2 thin d A \( z \))^(1 \/ 2) \, $
  where $Phi$ is the inverse rectangle map. The last integral is bounded by the common physical area bound.
    Choose levels in each bin controlling the tails of both charts.
    Their initial endpoints match on the retained compact pieces,
    so matched small endpoint balls contain all four tails. This argument does not require uniform local
    connectedness of the explored boundaries. Tile errors are absorbed by decreasing the fractions slowly enough.
    Lemma 39 controls the conditional attachment cost of these finitely many endpoint balls.
  Delete still unknown edges touching a slightly narrower band, initially $3 beta lt.eq u lt.eq 1 - 3 beta$,
    if their endpoints fail containment in $H$ with a sufficiently small fixed fraction of the clearance $ell$,
    or if their two abscissas differ by more than $a_(*) \/ 10$.
    These deletions have negligible conditional crossing cost.
    To see this, suppose an endpoint of such an edge reaches an electrode by an actual path,
    allowing the initial test step. Paths meeting a flagged cell, protection ball,
    or fiber-endpoint ball while centrally located already have negligible total cost.
    For every other path, trace it inward from the electrode after its last entry into the broader band $2 beta
    lt.eq u lt.eq 1 - 2 beta$. It crosses a comparison $u$-fiber on its main internal piece,
    giving an anchor in $H$ with nearly equal abscissas. It cannot subsequently leave $H$,
    since its central vertices are candidates and the wall has clearance from them.
    Each later crossing of either chart’s comparison fiber is again on its main piece.
    If $v$ drifted by more than a few bin widths from $u$, it would cross a $v$-fiber in a nonmatching $u$-bin,
    a contradiction. The endpoint therefore has neither proposed defect.
    Vertices without a possible electrode connection can be discarded at no crossing cost.
    Smaller nested bands and clearance constants accommodate complete edge segments and physical-grid projection.
  Now keep the surviving uncertain edges in $4 beta lt.eq u lt.eq 1 -
    4 beta$ that also belong to the trimmed test graph. A nonshared original piece can attach to these only on a
    designated side of the test quad: clearance excludes its free horizontal sides,
    and the abscissa buffers exclude an attachment from a noncentral piece.
    No nonshared piece, even with history wires, connects the two designated sides.
    Such a traversal must pass through the middle shared strip by chart matching,
    while all identifications lie in the two separate groups near $u = 0 \, 1$.
    After matching physical vertices, the induced original partition is thus dominated by the test law’s separate
    wiring. Every modified original actual crossing contains a shared crossing between the test sides,
    by taking its traversal from the first exterior group to the second.
    Domain Markov and partition monotonicity give the desired test upper bound.
  For completeness, the construction has the following quantifiers.
    If convergence in probability failed with fixed error and probability, choose first $a_(*)$ small,
    then $beta$ and fiber precision smaller. Choose obstacle accuracies tending to zero, with, at each stage,
    a deep-excursion cutoff, boundary protection radius $h_b$, block sizes and count cutoffs,
    endpoint protections $e$, the intermediate radius $R_1$, and finally the flag scale $ell$.
    The conditional protection costs and the averaged flag cost (11.4) are made small in that order.
    For each fixed stage choose the lattice mesh small enough for every geometric margin and each of the finitely
    many Jordan test limits. Select failing histories outside all exceptional sets,
    and pass to a common kernel subsequence. The fiber argument and additional deletions along this subsequence
    have uniform conditional error by Lemma 39, and contradict the failure.
    All six-arm summations took place under the original law before this deterministic selection of histories.
    This proves (11.2). ◻
]

== 12 Identification of the Dobrushin strand <sec:chordal>

=== 12.1 Two small tests determine the driver <two-small-tests-determine-the-driver>

Map $V_n$ to $bb(H)$, sending its two Dobrushin ends to $0$ and $oo$, with a convergent interior normalization.
  The inverse maps converge uniformly in disk coordinates, including the boundary, by marked Jordan convergence.
  Choose the orientation so that the positive real side is primal-free.
  The rounded simple strand has a continuous Loewner driver $W_t^(\( n \))$, with

#[#set math.equation(numbering: n => "(12.1)")
 $ partial_t g_t^(\( n \)) \( z \) = frac(2, g_t^(\( n \)) \( z \) - W_t^(\( n \))) \, wide
   g_0^(\( n \)) \( z \) = z \, wide W_0^(\( n \)) = 0 . $ <chordal:loewner>]

We suppress the superscript when discussing a single mesh.
  Fix $T \, R < oo$ and stop at $T$ or the first exit of $\| W_t \| < R$.
  All constants in this subsection may depend on these fixed bounds.

#thm([Lemma 12.1.])[
  (Bounded martingale tests).  #emph[For every $x > 2 R + 1$, put
#[#set math.equation(numbering: n => "(12.2)")
 $ M_t \( x \) = (frac(x g'_t \( x \), g_t \( x \) - W_t))^h . $ <chordal:martingale>]

 These processes and their reciprocals are bounded on the stopped range, uniformly in the mesh.
   For arbitrary stopping rules $0 lt.eq sigma_n lt.eq tau_n$ in that range and uniformly bounded
   $cal(F)_(sigma_n)$-measurable tests $F_n$,
#[#set math.equation(numbering: n => "(12.3)")
 $ bb(E) #h(-0.16667em)
   [F_n #scale(x: 120%, y: 120%)[\(] M_(tau_n) \( x \) - M_(sigma_n) \( x \) #scale(x: 120%, y: 120%)[\)]] arrow.r
   0 $ <chordal:approx-martingale>]

 under the original single-strand Dobrushin law.]
] <chordal:tests>

#proof[
  Insert on the original free side a small separate primal interval whose endpoints in the initial coordinate
    approximate $x \, x + s$. Use the four-open-change experiment. Until the specified stop its cross-ratio is
  $ chi_t = frac(g_t \( x + s \) - g_t \( x \), g_t \( x + s \) - W_t) . $
  The real Loewner solutions remain separated from the driver and from one another.
    At each fixed $s > 0$ the four marks, including $oo$, therefore stay nondegenerate.
    A physical point corresponding to $i M$ for sufficiently large fixed $M$ has a fixed unaffected disk;
    it supplies the basepoint in Theorem 37. The trajectory cannot end at either inserted mark within this localization.
  Let $Z_t$ be the conditional pairing probability. It is an exact bounded martingale.
    At any of the allowed stopping rules, Theorem 37 gives $Z_t - f \( chi_t \) arrow.r 0$ in probability,
    and hence in mean, for fixed $s$. Divide the martingale identity by $f \( s \/ \( x + s \) \)$ only at this
    fixed $s$. Lemma 36 and analytic ODE estimates near $x$ give, uniformly in the stopped range,
  #[#set math.equation(numbering: n => "(12.4)")
   $ frac(f \( chi_t \), f \( s \/ \( x + s \) \)) = (frac(x g'_t \( x \), g_t \( x \) - W_t))^h + o_s \( 1 \) \,
     $ <chordal:small-test>]
  after the mesh limit. The expression on the right is bounded above and away from zero independently of small
    $s$: $g_t \( x \) - W_t$ is bounded below, $g_t \( x \)$ is bounded above, and
  $ g'_t \( x \) = exp (- integral_0^t frac(2 thin d u, \( g_u \( x \) - W_u \)^2)) $
  has the same bounds.
  We next compare the laws, after replacing the normalized conditional probabilities by the bounded expressions in
    (12.4). Separate deterministic four-change closure adds just the small wire interval to the Dobrushin law.
    Couple monotonically and explore clusters from that interval in the stronger law.
    The probability that its actual cluster reaches a fixed small outer neighborhood tends to zero as the interval
    shrinks. Inside the intervening annulus there are no wire attachments away from the rims,
    since the old primal wire is a positive distance away. Filling to the full-lattice wired-rim law dominates the
    arm, which is blocked by the buffered RSW circuits. Outside this neighborhood the configurations can
    consequently be coupled identically. The open-four and deterministic-four laws also have vanishing total
    variation difference: their density depends only on the pairing,
    and the exceptional pairing has probability $g \( s \/ \( x + s \) \) arrow.r 0$.
    The stopped strands stay outside a fixed neighborhood of the insertion point,
    by the separated real and nearby complex solutions of (12.1).
    The drawing and caps were chosen identical off that neighborhood.
  Thus bounded stopped-history functions of $M$ transfer with vanishing error,
    first as the mesh tends to zero and then as $s arrow.b 0$.
    We never divide a coupling error by $f \( s \/ \( x + s \) \)$.
    The same stopping rules are applied in the coupled experiments,
    so the conclusion includes mesh-dependent rules and yields (12.3). ◻
]

#thm([Proposition 12.2.])[
  (Driving convergence).  #emph[On every compact capacity interval,
    the Dobrushin driving functions converge in law, uniformly, to $sqrt(kappa) B_t$,
    where $B$ is standard Brownian motion and
#[#set math.equation(numbering: n => "(12.5)")
 $ kappa = frac(8, 1 + h) = frac(4 pi, arccos \( - sqrt(q) \/ 2 \)) . $ <chordal:kappa>]

]
] <chordal:driver>

#proof[
  We first work inside the preceding localization. Set
  $ X_t \( x \) = g_t \( x \) \, wide A_t \( x \) = x^h g'_t \( x \)^h \, wide M_t \( x \) =
    A_t \( x \) \( X_t \( x \) - W_t \)^(- h) . $
  The processes $X \, A$ are uniformly bounded and uniformly Lipschitz in time there,
    with $A$ bounded away from zero. Take $2 R + 1 < x_1 < x_2$. Their real solutions stay separated: their gap solves
  $ partial_t \( X_t \( x_2 \) - X_t \( x_1 \) \) = -
    frac(2 \( X_t \( x_2 \) - X_t \( x_1 \) \), \( X_t \( x_1 \) - W_t \) \( X_t \( x_2 \) - W_t \)) . $
  It consequently has a positive lower bound on the stopped range.
  Here is the two-test convexity argument in detail. At a stopping time $sigma$, freeze $X \,
    A$ and write $F_j \( w \) = A_sigma \( x_j \) \( X_sigma \( x_j \) - w \)^(- h)$. Both derivatives are positive, and
  $ frac(F'_1 \( w \), F'_2 \( w \)) = frac(A_sigma \( x_1 \), A_sigma \( x_2 \))
    (frac(X_sigma \( x_2 \) - w, X_sigma \( x_1 \) - w))^(h + 1) $
  has derivative uniformly bounded below by a positive constant on $\[ - R \, R \]$.
    Thus for $a_sigma = F'_1 \( W_sigma \) \/ F'_2 \( W_sigma \)$, a bounded predictable quantity,
    integration of the derivative difference on either side of $W_sigma$ gives
  #[#set math.equation(numbering: n => "(12.6)")
   $ F_1 \( w \) - F_1 \( W_sigma \) - a_sigma #scale(x: 120%, y: 120%)[\(] F_2 \( w \) -
     F_2 \( W_sigma \) #scale(x: 120%, y: 120%)[\)] gt.eq c \( w - W_sigma \)^2 . $ <chordal:two-test>]
  The change of the frozen $X \, A$ between $sigma$ and $tau$ costs at most $C \( tau - sigma \)$.
    Applying (12.3) to these two increments, with the predictable coefficient incorporated into the test, yields
  #[#set math.equation(numbering: n => "(12.7)")
   $ bb(E) \[ \( W_tau - W_sigma \)^2 \] lt.eq C bb(E) \[ tau - sigma \] + o \( 1 \) $ <chordal:increment>]
  for every sequence of allowed stopping rules. Boundedness and (12.7) give the stopping-time tightness criterion
    in the Skorokhod $J_1$ topology. Since every path is continuous, all subsequential limits are continuous,
    and the convergence may be realized uniformly on compact stopped time intervals.
  At inner localization levels chosen to be continuity levels of the hitting operation,
    ODE continuity and (12.3) make each $M \( x \)$ a martingale in the limit.
    Such levels can increase to any outer localization. The identity
  $ W_t = X_t \( x \) - (A_t \( x \) \/ M_t \( x \))^(1 \/ h) $
  and the positive bounds on $A \, M$ show that $W$ is a continuous semimartingale.
    Write its decomposition as a local martingale plus a continuous finite-variation process $B^(upright("fv"))$,
    and let $\[ W \]$ be its quadratic variation. With $Z = X - W$,
  $ d X = 2 Z^(- 1) thin d t \, wide d log A = - 2 h Z^(- 2) thin d t . $
  Itô’s formula gives the finite-variation part of $d M \/ M$ as
  $ h Z^(- 1) thin d B^(upright("fv")) - 4 h Z^(- 2) thin d t + frac(h \( h + 1 \), 2) Z^(- 2) thin d \[ W \] . $
  Since $M$ is a martingale, multiplication by $Z^2 \/ h$ yields the identity of signed measures
  #[#set math.equation(numbering: n => "(12.8)")
   $ \( X - W \) thin d B^(upright("fv")) - 4 thin d t + frac(1 + h, 2) thin d \[ W \] =
     0 . $ <chordal:characteristics>]
  Subtract the identities for $x_1 \, x_2$. Their positive separation forces $d B^(upright("fv")) = 0$,
    and then $d \[ W \] = 8 \( 1 + h \)^(- 1) d t$. Lévy’s characterization identifies the localized law as
    Brownian with the rate in (12.5). The trigonometric identity follows from $arccos \( - d \/ 2 \) = pi - lambda$.
  Finally, the probability of exiting a large outer driver bound before $T$ is bounded in the limit by the
    Brownian probability of hitting inner bounds approaching it.
    These probabilities tend to zero as the bounds increase. Remove localization to obtain full compact-time
    driving convergence. Every subsequential law has been identified,
    so the convergence holds along the full mesh sequence. ◻
]

=== 12.2 Physical compactness and avoidable crossings <physical-compactness-and-avoidable-crossings>

#thm([Lemma 12.3.])[
  (Territorial arm counting).  #emph[In a buffered bulk annulus,
    $m$ disjoint radial medial sublegs force at least $m$ alternating actual primal/dual arms in a further cropped
    annulus. If only one color is retained, one obtains at least one crossing in a distinct intervening strip per
    two assignments of that color to successive medial separators.]
] <chordal:territories>

#proof[
  The rounded medial arcs divide tiles into primal and dual territories.
    A path within a territory shadows a path of its color on the physical lattice:
    within a tile it passes to the corresponding corner, and passage between opposite corners uses precisely the
    edge supplied by that switch. The shadowing has an error bounded by one tile.
    Actual paths stay inside their territories.
  Take disjoint simple radial sublegs, perturbing both annular radii within buffers to regular values.
    Thin parallel crosscuts on their two sides give ordered territorial crossings of opposite colors at each
    separator. Compress successive runs of equal color in the cyclic list.
    Each medial separator contributes a color transition, so at least $m$ alternating crossings remain.
    Shadow them by lattice walks in the central crop. Near the wider rims keep territorial tails until they can be
    spliced to the walks; thus no positive mesh-width clearance of the thin territorial paths at the rims is
    needed. Opposite-color paths are disjoint. Same-color members of the alternating list lie in different strips
    separated by an opposite-color territorial path and cannot meet.
    Disjoint tails from the inner wider rim preserve order at first hits of the outer cropped rim;
    taking last passages to those hits gives the claimed actual arms.
    The same strip ordering, after ignoring the other color’s assignments, proves the last assertion. ◻
]

#thm([Lemma 12.4.])[
  (Curve compactness and no triple visits).  #emph[The physical Dobrushin strands are tight in the uniform
    Euclidean curve topology modulo increasing reparametrization.
    Every subsequential limit has no nonconstant interval on the original boundary,
    and no interior point is visited three times with nonconstant excursions between consecutive visits.]
] <chordal:compactness>

#proof[
  Bulk passage counts in a fixed finite family of buffered annuli are tight by Section 2.
    We first show that a macroscopic displacement confined to a shrinking neighborhood of the original boundary
    has vanishing probability. In fixed plane Schoenflies coordinates for $D$,
    such a displacement crosses longitudinally one of finitely many boundary subarcs of positive length,
    after shortening the subpassage to avoid the two change points.
    On each subarc the boundary type is homogeneous. Its nonwired-color bank is an actual path using that color’s edges.
  Surround the subarc by a thin Jordan ribbon and place the permitted path in a still thinner band with strict
    margins. Fill to the full lattice of the bank color and wire the ribbon’s outer boundary.
    This dominates the actual crossing: there is no nearby designated wire of this color,
    and all exterior attachments to the shared graph occur on its ordinary sides.
    Longitudinal ribbon crossings become unlikely as the ribbon narrows.
    One concrete proof chooses any number $N$ of ordered intermediate positions on the subarc,
    each with its own disjoint fixed neighborhood. At each position two across-ribbon sections can be confined to
    arbitrarily small physical balls. A longitudinal crossing must then traverse a Euclidean annulus of
    arbitrarily large logarithmic aspect ratio inside that subribbon; its extremal length tends to infinity.
    Choose transverse blocker quads with bounded transverse extremal distance and with outer margins beyond the
    permitted band. The strong quad RSW theorem #cite(label("DMT2021Fractal")) Theorem 1.2 gives an actual
    opposite-color transverse blocker with conditional probability at least $c > 0$,
    under arbitrary exterior partitions. Approximate the fixed Jordan corridors by polygons with strict margins
    before taking the mesh limit. Successive conditioning over the disjoint quads bounds the crossing probability
    by $\( 1 - c \)^N$. Let $N$ grow and then narrow the ribbon.
    Every geometric scale here was fixed before the mesh limit.
  At a fixed displacement accuracy, outside these unlikely boundary travels,
    every excess collection of successive displacements forces many passages through a finite annulus cover of the
    compact part away from the ribbon. The passage estimates therefore bound the number of successive
    displacements at each accuracy. Subdivide curves at these displacement times and apply the usual Arzelà–Ascoli
    argument modulo reparametrization. This proves tightness and also rules out a nonconstant interval of a limit
    confined to the original boundary.
  Three genuine visits to an interior point, with positive intervening excursions,
    produce six disjoint medial legs to some fixed positive outer radius.
    Lemma 44 turns them into six alternating actual arms across a cropped annulus.
    Cover the possible contact points by a deterministic grid of mesh $ell$.
    The bulk six-arm estimate and the $O \( ell^(- 2) \)$ grid count give a bound $O \( ell^(c_0) \)$.
    First take the lattice mesh limit, then $ell arrow.b 0$, and finally a countable union over interior compact
    sets and rational excursion radii. This excludes precisely three visits separated by nonconstant excursions;
    constant waiting intervals are irrelevant to the curve topology. ◻
]

#thm([Lemma 12.5.])[
  (Macroscopic avoidability).  #emph[At a switch-revealing stop of the Dobrushin exploration,
    call a component of $U_n ∩ A \( z \; r \, R \)$ #emph[avoidable] if it does not separate the tip access from
    the target access inside $U_n$. The conditional probability of a future radial traversal in any avoidable
    component is bounded by a quantity tending to zero as $r \/ R arrow.b 0$,
    uniformly over histories and centers, with $r \, R$ fixed before the mesh limit and $delta_n lt.double r$.]
] <chordal:avoidability>

#proof[
  An avoidable component cannot access both designated primal and dual prime boundary arcs strictly between the
    rims. A path joining such accesses contains a crosscut separating the tip from the target.
    The future simple strand traverses one component between rims;
    choose a color whose designated boundary is absent there.
    Its bank supplies an actual arm of unqueried edges in a cropped annulus.
    A known-open edge or wire jump of that color would give a short physical access to its designated boundary
    there, contrary to the choice of component.
  To bound all such components at once, keep their random edges of this color within a cropped grid annulus.
    Unqueried tiles are uncut; an adjacency of incident edges, or attachment to a known edge or wire vertex,
    has a corresponding $O \( delta_n \)$ path in $U_n$ until it reaches a designated wire.
    Thus away from the cropped rims the induced partition contains only ordinary physical-vertex attachments.
    Delete known edges of the opposite state, fill the rest to the full lattice, and wire both rims.
    FK monotonicity dominates all the relevant actual arms simultaneously by one full-lattice arm event.
    Buffered dual circuits give its vanishing bound. Sum over the two possible missing colors.
    The argument uses the conditional FK law at actual revealing stops;
    an optional last piece of length $O \( delta_n \)$ is absorbed by the buffers. ◻
]

#thm([Corollary 12.6.])[
  (No return from a small target cap).  #emph[After the strand first enters a shrinking initial conformal cap
    around its target, the probability of a subsequent displacement of fixed positive physical size tends to zero.]
] <chordal:target>

#proof[
  At the first entrance the previously untouched cap gives a route from the tip to the target inside a small
    physical ball. Stop just before entrance, or at the entering piece and use its bank with a one-step buffer.
    Outside this inner ball every relevant annular component is avoidable. Apply Lemma 46.
    The diameters of the initial conformal caps shrink uniformly because the initial inverse disk maps converge
    uniformly up to the boundary. ◻
]

=== 12.3 The ordered trace, including zero-capacity intervals <the-ordered-trace-including-zero-capacity-intervals>

#thm([Lemma 12.7.])[
  (Interior double visits in every time interval).  #emph[For ordinary chordal $upright("SLE")_kappa$,
    $4 < kappa < 8$, almost surely every nonempty open capacity interval contains both visits to some interior
    self-double point.]
] <chordal:dense-doubles>

#proof[
  The double-point and boundary-hit dimension theorems of Miller–Wu #cite(label("MillerWu2017")) Theorem 1.1 and
    Corollary 1.7 give, respectively,
  $ 1 + kappa / 8 - 6 / kappa quad upright("and") quad 2 - 8 / kappa . $
  Their difference is $\( kappa - 4 \)^2 \/ \( 8 kappa \) > 0$,
    so the trace has an interior double point almost surely. Let $E_T$ mean that both visits occur strictly before
    $T$. Scaling makes $bb(P) \( E_T \)$ independent of $T > 0$,
    while $union.big_(m gt.eq 1) E_m$ has probability one. Thus $bb(P) \( E_T \) = 1$ for every $T > 0$.
    At a deterministic time $a$, the domain Markov property restarts ordinary SLE with additive capacity clock.
    An interior double point of the restarted trace maps under $g_a^(- 1)$ to an interior point of the original
    remaining domain. Apply this observation to all rational open intervals. ◻
]

#thm([Lemma 12.8.])[
  (Small gates exclude swallowed excursions).  #emph[In a joint subsequential limit of the physical strand and its
    Loewner driving function, the physical curve cannot enter an open component of a Loewner hull that is disjoint
    from the Loewner trace and the original boundary.]
] <chordal:gates>

#proof[
  Use the continuous Brownian SLE trace #cite(label("RohdeSchramm2005")); here $4 < kappa lt.eq 6$.
    Suppose that the claimed excursion occurs. By a countable choice,
    there is a small closed ball $J$ with a larger buffered neighborhood disjoint from the SLE trace and original
    boundary, approached deeply inside a swallowed component at finite limiting capacity.
    Fix bounds for this capacity and the driver, and a high basepoint corresponding to $i
    M$ in the initial half-plane coordinate. Take the first discrete approach to an intermediate buffer around
    $J$, before the alleged hit. Along a subsequence of these approach times the prefix keeps a fixed spare
    distance from $J$, whereas its kernel viewed from the basepoint excludes $J$.
    This follows from driving convergence and equality of the accessible Loewner domains; the whole buffered ball,
    being disjoint from the trace, lies in one excluded component.
  Nevertheless $J$ is still internal in every discrete simple slit disk.
    Normalize its inverse disk map $Phi_n$ at the basepoint and write $z_n = Phi_n^(- 1) \( "center" J \)$.
    Kernel convergence forces $\| z_n \| arrow.r 1$. Put $epsilon.alt_n = 1 - \| z_n \|$,
    and take circular disk crosscuts centered at $z_n \/ \| z_n \|$,
    with radii between $2 epsilon.alt_n$ and $sqrt(epsilon.alt_n)$.
    If $L_n \( t \)$ is their image length, Cauchy–Schwarz and the area formula give
  #[#set math.equation(numbering: n => "(12.9)")
   $ integral_(2 epsilon.alt_n)^(sqrt(epsilon.alt_n)) L_n \( t \)^2 thin frac(d t, t) lt.eq
     2 pi "area" \( U_n \) . $ <chordal:gate-area>]
  The right side is uniformly bounded and the logarithmic integration range diverges,
    so one image crosscut has diameter tending to zero. Its disk cap contains $z_n$,
    and its endpoints access the slit boundary. Since that boundary stays a fixed distance from $J$,
    the crosscut separates all of $J$ from the basepoint for sufficiently large $n$.
  The target is on the basepoint side. Indeed the driver and capacity bounds give a fixed route high above the
    half-plane hulls from the basepoint to the target, with positive physical separation from the prefix.
    A small gate touching the prefix misses this route. A gate with both endpoints on the original outer wall
    cannot separate two fixed interior balls when its diameter tends to zero, by uniform Jordan convergence.
    Adding a boundary-to-interior simple slit disjoint from that gate does not change its separation.
    Gates with an endpoint at the initial slit attachment are included among gates touching the prefix.
  We must use a stopping rule, not a gate selected from the future excursion.
    Fix a small $ell > 0$ and stop at the first discrete step at which there exists a crosscut of diameter at most
    $ell$ separating $J$ from both basepoint and target, while the prefix still keeps the chosen spare distance
    from $J$ and the basepoint is safe. The preceding construction shows that this stop occurs before the
    offending buffered hit for fine meshes. Choices can be fixed measurably from each finite history.
    At first occurrence a witnessing gate has an endpoint on the latest microscopic step,
    including its attachment point. Otherwise it was a crosscut of the previous slit domain with the same
    separation: adding a disjoint simple slit cannot change that separation. This contradicts first occurrence.
    The tip therefore reaches the gate and its target-side bank within a ball of radius $ell + O \( delta_n \)$.
  Choose a fixed outer radius smaller than the spare distance to $J$.
    In the annulus from $4 ell$ to this radius about the new gate endpoint,
    components on the trapped side are avoidable: a tip-to-target route crosses the gate inside the inner ball and
    stays on its other side. Any later hit of $J$ requires a radial traversal on the trapped side,
    since every return through the gate is inside the inner rim.
    Lemma 46, applied at this first-gate stop, makes its conditional probability vanish as $ell arrow.b
    0$ after the mesh limit. There is no sum over possible gate locations. This contradicts the alleged excursion. ◻
]

#thm([Theorem 12.9.])[
  (Dobrushin convergence for $1 lt.eq q < 4$).  #emph[For every bounded marked Jordan domain and every marked
    uniform polygon approximation satisfying Equation (1.3) with the boundary conventions of Subsection 1.1,
    the Dobrushin strand converges in law, in the uniform Euclidean oriented-curve topology modulo increasing
    reparametrization, to chordal $upright("SLE")_(kappa \( q \))$.]
] <chordal:trace>

#proof[
  By Proposition 43 and Lemma 45, take a joint subsequence realized with compact driving convergence and uniform
    physical curve convergence up to reparametrization. Write $Y \( t \)$ for the physical Brownian SLE trace,
    and $gamma \( s \)$ for the full limiting physical curve in an arbitrary forward parametrization.
    Before its first target visit, let $c \( s \)$ be the half-plane capacity of the hull of its initial segment.
    Kernel convergence makes $c$ continuous and nondecreasing and identifies it as the limit of the corresponding
    discrete capacities. These mapped segments are bounded locally away from the target.
    As the target is approached, $c \( s \) arrow.r oo$: a driver bounded on every finite capacity interval has
    its finite-time hulls in bounded portions of the initial half-plane.
  The domain accessible toward the target after time $s$ is the Loewner remaining domain of $Y$ at time
    $c \( s \)$, by kernel convergence and the Loewner ODE. On every interval where $c$ changes,
    the newly added trace segments of $gamma$ and $Y$ have a point in common:
    a boundary point of the smaller shared remaining domain inside the older domain belongs to both increments.
    Continuity, with shrinking such intervals, implies
  $ gamma \( s \) = Y \( c \( s \) \) $
  at every time outside the interiors of plateaus of $c$, including their active endpoints.
    A nonconstant plateau is therefore an extra excursion based at $Y \( t \)$, with $t$ its constant capacity,
    contained in the old closed hull or original boundary.
  Lemma 49 excludes motion inside an open swallowed component.
    Hence an extra plateau can move only on $Y \( \[ 0 \, t \] \)$ or the original boundary.
    By Lemma 45, it has no varying subinterval entirely on that boundary.
    If the plateau were nonconstant, choose a compact varying subinterval in its interior whose image avoids both
    the boundary and its basepoint. Every image point has a unique old SLE time:
    two old visits together with this genuine extra visit would give three interior visits separated by
    nonconstant excursions, forbidden by Lemma 45. This old-time inverse is continuous.
    Indeed any sequence of old times has a convergent subsequence in $\[ 0 \, t \]$,
    and trace continuity and uniqueness identify its limit. Composing with the extra subcurve yields a continuous
    nonconstant real function, whose image contains a nonempty capacity interval.
    Lemma 48 provides a point in that interval with two old visits, a contradiction.
    Thus every plateau is constant. The same reasoning at capacity zero excludes an initial extra motion.
  Corollary 47 excludes further motion after the first limit target visit.
    The capacity change of time therefore identifies the entire ordered curve with $Y$,
    up to the permitted increasing reparametrizations and constant waiting intervals.
    Finally Lemma 35 transfers this conclusion from the rounded simple drawing to the specified medial strand at
    distance $O \( delta_n \)$, including repeated midpoint visits with fixed pairings.
    All subsequential limits agree, proving the claimed full-sequence convergence. ◻
]

== 13 Peeling along monochromatic walls <sec:peeling>

Throughout Sections 13–15, fix $1 lt.eq q < 4$ and write $4 < kappa = kappa \( q \) lt.eq 6$.
  We now construct a joint exploration toward interior targets.
  The boundary conditions in this construction are part of the proof:
  its initial law is the wired FK law in a square, and its final application will be to the free infinite-volume
  law of Subsection 1.2.

=== 13.1 Actual walls, caps, and the exact exploration law <peel:construction>

Begin with a nearest-neighbor square whose boundary primal edges are deterministically open.
  Attach to the inward side of each boundary edge the corresponding half-tile.
  Its two ports are paired around its dual corner; this triangle contains no random switch.
  More generally, a #emph[homogeneous wall] of color $C in { sans(P) \,
  sans(D) }$ consists of actual open $C$-edges and these deterministic triangles on its inward side.
  Actual paths along the wall are allowed. This distinction from an abstract boundary identification will be used
  in every crossing argument below.

All strands are oriented with primal on the left. To start an exploration in a primal-walled component,
  remove one wall triangle. Enter at its earlier port in counterclockwise boundary order;
  the other port is the force port. On a dual wall reverse the boundary order.
  The boundary of an active component, in counterclockwise order, is

#[#set math.equation(numbering: n => "(13.1)")
 $ P_W D_W \, wide \[ D_W \, D_O \]_(sans(D)) \, wide D_O P_O \, wide \[ P_O \, P_W \]_(sans(P)) . $ <peel:boundary>]

The first and third pieces are tile sides, while the second and fourth are actual open dual and primal paths with
  their deterministic inward triangles. Either path may have length zero.
  Boundary occurrences, rather than just geometric vertices, specify the accesses in this description.

Here is the update at the tip side $P_W D_W$.

+ If the next tile is fresh, reveal its switch. In the primal-open case, cut along its open diagonal $P_W P'$,
  remove the triangle traversed by the strand, and continue from $P' D_W$ on the two-change side.
  The other half-tile becomes a deterministic wall triangle.
+ If $P'$ is an interior vertex, there is only one active component.
  If it is a boundary occurrence, the new diagonal is a proper crosscut joining the primal arc to itself.
  It cuts off a homogeneous primal pocket. Retain the component containing the target.
  In the pocket, remove the triangle on the #emph[next counterclockwise old-wall edge] starting from the hitting
  occurrence $P'$ and restart there. For targets on the two-change side, continue the old strand.
+ For a dual-open switch use the same rule with the colors exchanged and clockwise order.
  If the tip meets a known triangle, remove it and follow its cap to the other leg.
  This shortens the wall instead of adding an edge.

The rule is understood in the sector seen from the tile. The opposite corner of a newly retained wall triangle
  lies on its indicated side of the crosscut. A known triangle has two consecutive boundary sides in that sector,
  so clipping it leaves just the other leg. In particular one never glues the two banks of a zero-width slit.
  Starting from the square, nonempty completed components are physically Jordan domains:
  an update either indents the boundary through a new interior corner, cuts it by a proper crosscut,
  or clips consecutive boundary edges. The same observations apply when a homogeneous wall is opened.
  The only degenerate terminal configurations lie within a bounded number of tiles of the target.
  They cannot occur on a bounded radial horizon from a macroscopic starting domain.

#thm([Lemma 13.1.])[
  (Exact pocket law).  #emph[Conditionally on any finite exploration history,
    the unqueried switches in its remaining components have the positive cap laws described by their boundaries.
    Distinct components are conditionally independent. Before two targets split into distinct components their
    explorations are identical. A strand between successive pocket switches is a portion of one original closed loop.]
] <peel:factorization>

#proof[
  At a cut, every matching connection is either the consumed switch pair or a local cap on one of its sides.
    Consequently the factors $q^(ell \/ 2)$ for unstarted loops,
    and the factor for eventually closing the current strand,
    have no remaining dependence involving both sides of the cut.
    Their product therefore factors over the components. A two-change component has one strand between its ports;
    closing these ports outside gives its marginal cap law. The deterministic triangles implement exactly those
    identifications. No random switch is hidden in such a triangle.
  Until a switch into a homogeneous pocket, every traversed pair belongs to the loop through the originally opened
    cap. At a pocket switch that loop remains on the other side of the actual open diagonal.
    The new cap is on a loop not yet traced in the retained pocket. This also proves the last assertion.
    For finitely many targets keep the cut-off components, including their boundary states,
    and process active branches in a fixed priority order. The factorization gives the claimed conditional
    independence before taking any limit. ◻
]

=== 13.2 Radial clocks and forcepoint resets <peel:radial>

For an interior target $z$ let

$ t = log frac("crad" \( U_0 \, z \), "crad" \( U_t \, z \)) \, wide Phi_t : U_t arrow.r bb(D) \, quad
  Phi_t \( z \) = 0 \, $

where the argument of $Phi'_t \( z \)$ is fixed. On $t lt.eq T$,
  Koebe’s theorem supplies a ball about $z$ of radius bounded below in terms of $T$ and the initial conformal
  radius. The chart modulus of Section 11 therefore applies uniformly to connected short paths and to their
  boundary accesses.

Let $e^(i W_t)$ be the tip and $e^(i O_t)$ the force access. Choose lifts so that

#[#set math.equation(numbering: n => "(13.2)")
 $ theta_t = O_t - W_t in \[ 0 \, 2 pi \] $ <peel:angle>]

is the angle of the counterclockwise dual boundary arc. The force access is at the wall-color endpoint of the
  force side chosen at the last opening: after a primal opening this is $P_O$,
  approached beside the interior of the side.

We use the following interpolation, which fixes the behavior at collisions.
  Move along the small tip side to the near endpoint of the new diagonal, grow the diagonal as a slit, and,
  on the retained two-change side, grow the other leg of the traversed triangle to clip it.
  Move along the resulting boundary leg to the new port. For a known triangle grow its other leg across to clip
  it. Boundary motion itself has zero growing time. When the slit makes a pocket crosscut,
  the force access collapses to the tip: $theta = 0$ in a primal pocket and $theta = 2 pi$ in a dual pocket.
  At a primal restart, move $O$ counterclockwise #emph[ahead], to the far endpoint of the next edge,
  and remove that edge’s triangle by growing its two legs in wall order. Then continue with $W$ at the new start.
  Reverse both directions at a dual restart. Triangle removals on separated sides of a common crosscut may
  subsequently be processed separately.

These updates have disjoint growing-time interiors and produce exactly the designated target components.
  They differ from the medial strand, including its reset connectors,
  only inside a bounded number of adjacent tiles in the accessed sectors.
  The chart modulus implies that all boundary-angle jumps vanish uniformly on bounded horizons.
  The capacities of individual updates also vanish: their cuts are chart-small,
  and kernel convergence preserves the basepoint component.
  The total angular oscillation within one update vanishes as well.
  Indeed its cut is in a vanishing sector of its starting chart;
  the normalized new maps converge to the old map on compact interior sets and, by reflection,
  on closed boundary arcs away from that sector. The new tip is in that sector,
  while a force access is either regular or belongs to the same collapsing sector.

Between the designated resets, the radial boundary equation is

#[#set math.equation(numbering: n => "(13.3)")
 $ d O_t = cot \( theta_t \/ 2 \) thin d t . $ <peel:force-ode>]

If its endpoint is hit but the force side is retained, continue using the access beside that side.
  Convergence in the retained sector, which can be checked by truncating the access with short circular gates,
  gives the same one-sided equation on the next slit. Its improper integral at a collision is finite:
  near the collision the motion has one sign and the force access has a finite angular limit.
  No additional jump of $O$ is introduced. These conventions also apply when the end of the newly opened triangle
  is reached. Stops at completed updates suffice in what follows;
  allowing the switch of a just-started update changes nothing in the limit.

=== 13.3 Crossings in the moving charts <peel:crossings>

We need actual paths reaching the explored wall, including where that wall is irregular.
  The following form specifies both the geometry and the information retained after a crossing is found.

#thm([Lemma 13.2.])[
  (Wall crossings and screening).  #emph[Fix a buffered corridor of bounded aspect in a normalized disk chart.
    Its terminal wall intervals lie strictly inside designated homogeneous arcs;
    one terminal interval may instead be an interior bar. After the mesh limit at this fixed scale,
    an actual crossing of either prescribed color $X$ has conditional probability bounded below,
    uniformly in the exploration history and its boundary partitions.
    At an $X$-wall it reaches an actual wall vertex. At an opposite-color wall it reaches the $X$-corner of an
    inward wall triangle. In the latter case a segment inside that triangle, ending at the midpoint of its base,
    completes the crossing to a screen and meets an actual $X$-path only at its starting corner.]
  #emph[The two-sided bounded-density collar comparison of Section 2 holds for such buffered chart collars on a
    homogeneous wall, with a bounded number of through-wire blocks.]
] <peel:wall-rsw>

#proof[
  We explain the reduction to a simple square-lattice quad,
    so that the up-to-boundary crossing theorem applies with its exact hypotheses.
    For the color $X$, retain the edge-connected component around the basepoint of square faces whose centers have
    $ell^oo$ distance more than $k delta$ from the planar complement; a fixed $k = 20$ suffices.
    The failing faces are edge-connected, as one sees by rasterizing a thickened path in the connected complement,
    including slit banks. Other components of passing faces are assigned to the exterior.
    Both face families are then edge-connected. Alternating interior and exterior faces at a self-touch vertex
    would separate one of these families, so the retained polygon has a simple boundary.
    It lies in unqueried territory and eventually contains every compact chart core.
  An incident failing face on its perimeter can be followed, through $O \( k \)$ adjacent failing faces,
    to the first wall contact. Thus every perimeter point has a short exterior access to the actual wall.
    The chart modulus implies that the perimeter approaches the unit circle uniformly and that its separated
    accesses have the correct cyclic order. The winding about the basepoint fixes that order globally.
  Approximate the two longitudinal sides of the desired corridor by simple $X$-lattice crosscuts inside this
    polygon. First approximate their compact interior portions with positive clearance;
    then append terminal paths in disjoint chart neighborhoods, stopping at the first perimeter contact.
    Grid shadowing and loop erasure preserve the chart margins, since each short connected error is chart-small.
    Together with the appropriate perimeter intervals these crosscuts bound a simple lattice quad.
    The transverse margins and angular order bound its extremal distance by a constant depending only on the
    buffered corridor.
  This last bound can be made directly in discrete extremal length.
    Thicken vertex weights over balls of a few mesh steps, with density scaled by $delta^(- 1)$.
    Each member of a fixed transverse family of longitudinal chart paths shadows an edge path in the quad,
    cropped to the two terminal sides. Grouping successive connected pieces of displacement $delta$ charges only
    boundedly many nearby vertices. The shadowed length is therefore bounded by a constant times its density
    integral; the squared area integral is bounded by a constant times the sum of squared vertex weights.
    The fixed chart family gives the asserted extremal-distance bound.
  Theorem 1.2 of #cite(label("DMT2021Fractal"), form: "prose") now gives a positive crossing probability for the
    simple quad at $p_q$, for $1 lt.eq q < 4$, with arbitrary boundary partition.
    Equivalently, use the free law as the lower comparison. Do not query edges running along its terminal
    perimeter sides. From a reached vertex, an outward failing-face chain gives $O \( k \)$ available $X$-edges
    toward the intended wall. The extension uses only those unqueried terminal-side edges and edges outside the
    quad. Finite energy gives a uniform positive conditional cost.
    Stop at the first wall contact; if an opposite-color wall blocks the next step,
    the current vertex is already the $X$-corner of its triangle.
    This proves the crossing assertion, including its endpoint convention.
    Circuits and interior connections with strict margins follow by ordinary box-crossing and gluing.
  For the collar statement, find the same-color screen nearest the unknown-facing side of a deterministic buffered
    subcollar. Paths may be restricted to the strip between the prescribed wall intervals,
    pruned at terminal returns, and augmented by ordered spokes to common endpoints.
    Minimizing the region on the unknown side selects a simple outermost crossing.
    Any competing path entering strictly nearer that side has an open excursion that can replace part of the
    selected path and decrease this region. Hence the selection tests only on and on that side of the screen.
    Its other side retains an FK law with a boundary partition.
  Actual paths of the screen’s color must attach to it in order to cross.
    An opposite-color path cannot pass it except through the bounded through-wire blocks;
    the added segment in a wall triangle creates no other bypass.
    Splitting or merging those blocks changes a weight by a bounded factor.
    The primal and dual screening searches used in the collar proof of Section 2 thus apply without change to
    arbitrary-event densities. All chart margins are fixed before the mesh limit, as required. ◻
]

=== 13.4 A bound on generations <peel:generations>

#thm([Lemma 13.3.])[
  (Disjoint passages and reference walls).  #emph[The number of edge-disjoint actual monochromatic cycles
    surrounding a fixed macroscopic ball in the initial square, and using no deterministic initial wall edge,
    is tight as the mesh tends to zero. Along finitely many target branches with bounded radial horizons,
    the number of reference-wall generations defined below is jointly tight.]
] <peel:passages>

#proof[
  Such cycles provide edge-disjoint vertical passages in a fixed-height middle horizontal band.
    By bounded degree and Menger’s theorem, their number is bounded by a fixed multiple of the maximal number of
    vertex-disjoint passages. For primal paths one may add random switches on the initial wired boundary edges,
    which does not change the interior marginal under consideration.
    For dual paths use the rectangle of interior faces. Thus it suffices to work in an ordinary fixed-aspect
    color-lattice rectangle, with its induced positive FK law.
  Prune bottom-to-top paths so they do not return to their terminal rows.
    Select the leftmost open path, then the leftmost path to its right that is vertex-disjoint from it,
    and repeat. To justify the information claim, attach noncrossing spokes just below and above the terminal rows
    to common endpoints, pad the rectangle sides, and minimize left area.
    Another eligible path entering strictly left gives an excursion with distinct endpoints on the augmented path
    and permits replacement in either traversal direction, decreasing left area.
    End excursions through a spoke use only terminal contacts.
    The selected path is therefore determined by its own edges and the edges on its left.
    If $m$ vertex-disjoint passages exist, at least $m - 1$ remain to its right, and the argument iterates.
  After a selection $p$, there is a uniformly positive conditional probability of blocking another disjoint
    passage. If $p$ comes within ten mesh steps of the right wall on some horizontal half-row,
    force an opposite-color connection along that row from outside the right wall to first adjacency to $p$;
    its finite-energy cost is bounded. If $p$ already blocks, no forcing is necessary.
    Otherwise follow $p$ on its right through opposite-lattice face centers,
    joining consecutive ones inside the right wedges at its vertices.
    Erase loops and trim terminal returns to obtain a simple path $p_(*)$ between the extreme interior half-rows.
    Those rows are single intervals on the right side because $p$ was pruned.
    With them and the rightmost interior column, $p_(*)$ bounds a simple opposite-lattice quad of fresh edges.
  Horizontal rows give a bounded-extremal-distance family across this quad:
    there are order-height disjoint rows, each of length at most order-width.
    Lemma 52, or directly #cite(label("DMT2021Fractal"), form: "prose") Theorem 1.2,
    supplies an opposite-open crossing with uniformly positive probability.
    Extend it one step beyond the right boundary at finite-energy cost.
    At its other endpoint, append a segment in the incident square to a vertex of $p$.
    This screen blocks all actual vertical paths on the right avoiding vertices of $p$.
    Its edges are fresh under the leftmost-path conditioning.
    Consequently the successive selections have a geometric tail;
    blocker tests need not themselves be exposed when continuing the search.
    In particular, if $N$ is their number, then for constants depending only on $q$ and the fixed rectangle shape,
  #[#set math.equation(numbering: n => "(13.4)")
   $ bb(P) \( N gt.eq m \) lt.eq \( 1 - c \)^(m - 1) \, wide sup_delta bb(E) \[ e^(a N) \] < oo quad
     upright("for ") 0 < a < - log \( 1 - c \) . $ <peel:passage-tail>]
  This proves the first assertion, and also gives the corresponding bound for a strictly bulk rectangle.
  A generation begins in a homogeneous $C$-pocket, whose present wall is its #emph[reference wall].
    Read the $C$-arc from $O$ to $W$ in counterclockwise order for primal and clockwise order for dual.
    It consists of a prefix of the remaining reference interval followed by a suffix of actual open edges revealed
    during this generation. A triangle step shortens this path;
    a fresh diagonal extends it or returns to an earlier vertex.
    At a same-color switch retaining part of the prefix, the next gap is precisely its first retained reference
    edge. The description is thus preserved, even when the prefix becomes empty.
    These switches take place on the reference wall.
  Start a new generation at the first homogeneous pocket whose retained arc has no reference edge;
    every opposite-color switch has this property. Its wall consists entirely of actual diagonals discovered since
    the previous start. Consumed edges are not reintroduced by known triangles.
    The successive new reference cycles are consequently edge-disjoint, separately for each color.
    They surround the basepoint ball present up to the fixed horizon.
    If a wall walk has repeated vertices, its winding extracts a surrounding cycle.
    The first assertion bounds the number of generations. For finitely many branches sum the bounds,
    allowing an ancestral generation to be counted along each of its descendants. ◻
]

=== 13.5 Local chordal tests in a peeled domain <peel:localtests>

Put $h = 1 - 2 rho$, with $rho$ as in Section 3. At a causal completed state with $theta$ in a compact subinterval
  of $\( 0 \, 2 pi \)$, map the active domain to $bb(H)$ so that the tip is $0$, the force access is $oo$,
  and the target has imaginary part one. The positive real arc is dual-designated.
  Stop a short subsequent segment at fixed driver and chordal-capacity bounds,
  chosen so the target remains safely inside and connected to the force access.
  There are no resets on this segment. Let $g_t$ and $W_t^(bb(H))$ be its chordal map and driver.

#thm([Proposition 13.4.])[
  (Tests away from coincidence).  #emph[For $x > 0$ beyond these localization bounds, the quantities
#[#set math.equation(numbering: n => "(13.5)")
 $ M_t \( x \) = (frac(x g'_t \( x \), g_t \( x \) - W_t^(bb(H))))^h $ <peel:test>]

 satisfy the approximate martingale identities between arbitrary causal stops on the segment.
   Tests may include the entire earlier exploration history of finitely many targets.
   The errors tend to zero after the mesh limit. The assertion concerns the averaged identities for this history
   law, not a uniform assertion over all deterministic mazes.]
] <peel:martingales>

#proof[
  We supply the modifications needed to apply the moving-domain comparison of Section 11.
  ===== 13.5.1 The test notch. <the-test-notch.>
  Fix first a small chart scale $s > 0$. Cut a notch around $x$, of size between $s$ and $2 s$,
    with two transverse ends on the old dual wall. Put a new separate primal wire only on the middle portion of
    its new wall, a positive chart distance from those ends, and keep dual designations on both flanks.
    Approximate a regular semicircular or polygonal notch by openable dual diagonals near its ends and openable
    primal diagonals in its strictly interior middle, with transition tile sides.
    The artificial diagonals are deterministic in the modified experiment.
    The result has four changes with the same triangular-cap convention as before.
  This construction is possible in unqueried territory. Compact interior parts have ordinary positive-clearance
    approximations; end parts shadow dual-grid paths in the prescribed accessed corridors up to first actual
    dual-wall contact. Loop erasure preserves their order by the chart margins.
    We also choose the notch to have controlled physical terminal tails.
    Length-area, applied to a positive-width family of chart curves,
    bounds the integral of the inverse-curve tail lengths below height fraction $epsilon.alt$ by
    $O \( sqrt(epsilon.alt) \)$, since the physical area is bounded.
    Thus a curve can be chosen with tails vanishing at shrinking height cutoffs.
    One may make the height cutoff decrease slowly with the mesh.
    Its retained interior is approximated with positive one-sided clearance,
    and the new primal interval stays at positive physical distance from all previous and locally stopped
    trajectory pieces for fixed $s$.
  ===== 13.5.2 Exact identities and comparison of the histories. <exact-identities-and-comparison-of-the-histories.>
  Sample the notched law conditionally at the start of the segment.
    Follow its strand until the localized stop, measuring the stop in the unnotched geometry.
    The strand cannot reach or swallow the notch data: real and complex Loewner ODE bounds keep its growth away
    from that chart neighborhood. Every locally discarded pocket is homogeneous and contains neither notch nor
    force data.
  The pairing probability with the two primal wires separate is an exact martingale.
    Identifying the two primal intervals gives the complementary dual comparison;
    its law is a bounded tilt depending only on the pairing. These identities are taken at completed states.
    For additional targets keep reporting geometry and scheduling from the unnotched cuts until the local stop or
    an active horizon, without changing a target assignment near the notch.
    Still-shared targets see this same growth, and separated components have their ordinary independent laws by
    Lemma 51. If a target clock freezes, truncate the identity there.
  Lemma 52 compares the exterior history laws, for fixed $s$, by bounded density constants.
    To obtain a coupling error tending to zero as $s arrow.b 0$,
    bracket the exterior primal partitions at the notch by the extremal partitions,
    expose actual attachment clusters in the stronger law, and block them by dual wall-to-wall paths in successive
    dyadic chart half-collars. These lie away from the old primal wire, so there is no primal wire bypass.
    Conditional success probabilities at each fixed-shape scale are uniform after the mesh limit.
    Only the separate-primal-wire law is needed in this last coupling, not its pairing tilt.
  ===== 13.5.3 Rough-domain obstacles. <rough-domain-obstacles.>
  For a later stopped notched domain, its four-change rectangle is nondegenerate for fixed $s$.
    The central possible-attachment vertices and their optimistic color paths are defined exactly as in the
    moving-domain argument. Accessible identifications and deterministic open adjacencies have short accesses to
    their assigned wires. Away from those wires a central attachment begins with an actual uncertain-edge path to
    macroscopic distance. Protected-ball deletion still has only rim attachments in the relevant components;
    splitting a physical vertex weakens these connections. No notch cap supplies a shortcut of a color away from
    that color’s electrodes.
  Use the initial square, the relevant ancestral and current exploration pieces, and the notch as obstacles.
    First truncate the numbers of branches and generations, using Lemma 53.
    Within generation $j$, retain excursions reaching depth $r_j$ from the initial boundary and the
    earlier-generation obstacles, starting and ending at much smaller depth $h_j$, or at an active endpoint.
    The earlier obstacles contain its reference wall up to a step-sized error.
    Away from them, each retained leg is jump-free and has actual open paths of both colors beside one loop
    portion. Bulk passage bounds, on a finite grid of annuli,
    make the number of these legs and of their short internal blocks tight.
    A trajectory does not retrace a loop portion: at a switch the old loop remains in the other component.
  Choose accuracies backwards through the generations, approximating each earlier obstacle much better than the
    descendant depth $h_j$. Excursion endpoints then attach to earlier routes in protected small balls,
    and omitted shallow pieces contribute only $r_j$ to the Hausdorff error.
    Each retained block has a known actual path $pi$ of the requested color in a short bulk patch.
    The routing and flag construction of Section 11 therefore applies on a finer deterministic grid.
    Route the notch on its removed side, with clearance on compact interior portions,
    and attach its short terminal tails in protected balls. Specifically, fix the two protection radii,
    choose still smaller physical tails as above, then approximate the retained interior by a polygon with
    one-sided clearance. At fixed height cutoffs, normal-family bounds allow all perturbations and snappings to be
    chosen from finite lists. Make earlier obstacle accuracies smaller afterward, and take mesh errors last.
    The resulting rounded Jordan comparison domain contains every required internal compact path and has all the
    limiting complement contacts needed for kernel convergence; its marked prime data agree in interior charts.
  ===== 13.5.4 Why the flag cost is the original six-arm cost. <why-the-flag-cost-is-the-original-six-arm-cost.>
  Use original past switches and actual wire edges for the known legs.
    In testing the absence of a short optimistic bridge to $pi$,
    allow even the original unnotched ambient completion. An actual path leaving the old domain first hits its
    designated wall; opposite-color wall diagonals block it. The same is true on first contact with a previously
    queried edge of its color. Near the current old wire portions,
    the chart modulus excludes a shortcut from a central vertex in a sufficiently small physical disk.
  There are two different locality checks near the notch. A primal central path that locally crosses it stays near
    the old positive dual-wall patch in the starting chart, far from any old primal contact or locally grown
    trajectory; it cannot reach a known primal history edge there.
    For a dual central vertex near a flagged historical detail, the entire notch is far away in the old chart.
    Indeed a central dual abscissa near the notch must avoid both dual flanks and their ends,
    and hence lie in a compact interior chart patch beside the new primal interval.
    That patch has positive physical distance from the old history and the locally stopped pieces,
    first by the regular notch margins and then by the ODE bounds.
    Kernel convergence and analytic continuation away from the local hull give the same assertion on every shape
    subsequence.
  All these arguments follow connected paths in the old domain until their first old-wall contact.
    Boundary-sector identifications cannot undo the actual diagonal barriers.
    The sector-duality argument thus produces the original known flags from the two witness arms,
    and an actual extra arm produces six alternating arms in the original ambient switch lattice.
  For dual extra arms near flags, the required narrow arm pieces lie outside the notch and its narrower protecting
    collar. The arbitrary-event collar density comparison transfers their probability,
    including the local history, to the original law; the pairing tilt costs another bounded factor.
    For primal extra arms, first compare the stopped history through the outer collar.
    Conditionally on that history the extra-arm event is increasing in primal edges.
    Restore the deleted notch and wire only the new middle primal vertices locally.
    This dominates the modified law: the dual flanks had imposed no primal wiring,
    and their known dual edges had only removed primal choices.
    The flagged local arm pieces are physically separated from that new interior wiring by a vacant bulk collar,
    containing no earlier history. The bulk density comparison then transfers their probability to the original
    conditional law.
  For either color, summing over fine-grid flagged cells consequently costs a bounded multiple of the original
    annealed six-arm sum. Its decay follows from #cite(label("DMT2021Fractal"), form: "prose") Corollary 6.7,
    after the collar transfer of Section 2. Take the grid scale small after all collar margins, trims,
    and block cutoffs. Protected-ball errors, in contrast, are estimated directly conditionally in the modified
    law. The chart and notch may depend on the segment-start history:
    at fixed scales their margins and comparison constants are uniform under the stated normalizations.
  ===== 13.5.5 The alternating formula and the shrinking notch. <the-alternating-formula-and-the-shrinking-notch.>
  These checks are the additional inputs required by the upper barrier comparison of Section 11.
    Its directed routes have clearance from central candidates except for the controlled deletions.
    The level fibers of the remaining kernel and comparison template agree outside protected end balls,
    giving the same shared-graph partition domination for the abscissa-trimmed quad.
    Fix generation cutoffs, block cutoffs, grids, and all intermediate scales before the mesh limit.
    The preceding averaged bounds make adverse conditional costs negligible in history probability.
    The two color upper bounds and the pairing tilt therefore identify the stopped conditional pairing probability
    with the separate-wire value $g \( chi \)$.
  Divide its exact martingale identity by the initial formula value, which is bounded below for fixed $s$.
    As $s arrow.b 0$, the ratio tends locally uniformly to (13.5).
    To see the conformal normalization, remove the same small boundary hull near $x$ in the starting and later
    chordal charts. The map between them is analytic near that hull,
    with derivative $g'_t \( x \)$ bounded above and below and bounded second derivative.
    Rescaling the notch gives uniform Jordan shape convergence,
    so the flattened prepoint interval widths have ratio $g'_t \( x \) \( 1 + o \( 1 \) \)$,
    while their base positions have ratio $\( g_t \( x \) - W_t^(bb(H)) \) \/ x$.
    The asymptotic $g \( chi \) tilde.op c chi^h$ gives (13.5).
    Finally use the vanishing separate-law coupling error to return bounded tests to the original law.
    This order of limits proves the proposition. ◻
]

== 14 Identification of the joint angular tree <sec:tree>

=== 14.1 Interior evolution and an oriented boundary estimate <tree:tightness>

All assertions in this section are first made for finitely many fixed deterministic interior targets and bounded
  radial horizons. The horizons may subsequently increase. The small-update estimates of Subsection 13.2 absorb
  port ambiguities and the difference between an interpolated stop and a completed-state stop.

#thm([Lemma 14.1.])[
  (Interior characteristics).  #emph[Away from $theta in { 0 \, 2 pi }$,
    every limiting branch has the local characteristics
#[#set math.equation(numbering: n => "(14.1)")
 $ d W_t & = sqrt(kappa) thin d B_t + frac(6 - kappa, 2) cot \( theta_t \/ 2 \) thin d t \,\
d O_t & = cot \( theta_t \/ 2 \) thin d t \, wide theta_t = O_t - W_t . $ <tree:sde>]

 Here $t$ is that branch’s radial clock; the martingale identities hold relative to the full causal exploration
   history.]
] <tree:interior>

#proof[
  Use two ordered test points $x$ in Proposition 54. The relative-convexity inequality (12.6) and the inversion
    argument of Proposition 43 identify the stopped chordal driver and its bracket.
    They also give stopped second-moment estimates. On a sufficiently short segment started with $theta
    in \[ e \, 2 pi - e \]$, the chordal and radial clock rates and coordinate changes are bounded above and
    below. Thus crossing a fixed interior angular interval in vanishing radial time has probability tending to
    zero, uniformly at causal starting stops. A macroscopic angular increment started near an endpoint must cross
    such an interior interval. Aldous’ criterion and the vanishing within-update oscillations give continuous
    tightness of $theta$; in particular its numbers of fixed-size alternating swings are tight.
  After the tightness of $W \, O$ proved below, localize on rational start ranges and inner continuity levels to
    pass the re-centered identities to a joint subsequential limit, retaining tests of the past.
    The ordinary chordal-to-radial target change, before any loss of the force access, gives (14.1).
    This is precisely the stopped coordinate change in #cite(label("Sheffield2009Exploration"), form: "prose")
    Proposition 3.12; no continuation through collisions is inferred from that proposition. ◻
]

The missing tightness, and later the absence of an endpoint push,
  come from an estimate whose direction depends on the restart rule.

#thm([Lemma 14.2.])[
  (Fast motion near coincidence).  #emph[There are positive constants $c \, C$ with the following property.
    Start at a causal stop with $theta < r \/ 16$, where $r > 0$ is small.
    For $0 < u lt.double r^2$, the probability that $W$ advances counterclockwise by $r$ within additional radial
    time $u$, while $theta < r \/ 16$ until that advance, is at most
#[#set math.equation(numbering: n => "(14.2)")
 $ C exp \( - c r \/ sqrt(u) \) + o \( 1 \) . $ <tree:bar-bound>]

 The error vanishes in the mesh limit for fixed $r \, u$. The constants in the limiting estimate are uniform in
   these parameters. Near $2 pi$ reverse the direction of motion and exchange the colors.]
] <tree:bar>

#proof[
  Work in the disk chart at the starting stop. The radial Loewner ODE confines the updates during time $u$ to a
    strip of depth $C sqrt(u)$ from its boundary. A driver advance of $r$ forces a positive angular traversal
    through a buffered part of the corridor from angle $W_0 + r \/ 5$ to $W_0 + r \/ 2$.
  Here is the boundary-coordinate justification of this implication.
    Stop at the first $\| W - W_0 \| = r$, so the lift cannot wrap around.
    If the advancing growth never passes, for example, $W_0 + 2 r \/ 3$ in the starting chart,
    a neighborhood of radius comparable to $r$ at $W_0 + 5 r \/ 6$ remains untouched.
    Its prepoint image stays $O \( sqrt(u) \)$ from its original angle.
    First check the ODE at depth a large constant times $sqrt(u)$.
    Near the untouched arc the map reflects analytically; radial monotonicity bounds the log-radius harmonic part
    by the absolute original log radius. In the stated neighborhood this is $O \( r \)$,
    so the interior gradient estimate bounds the angular derivative. The boundary estimate follows by reflection.
    The untouched prime access is distinct from the tip, and the small boundary relocations also miss it.
    The driver therefore cannot pass its lifted image, contrary to the stipulated advance.
    This proves the required physical traversal in the starting chart.
    All within-step and strand-surrogate errors vanish for fixed $r \, u$.
  Place order $r \/ sqrt(u)$ disjoint buffered bars across that angular corridor.
    Each has width comparable to $sqrt(u)$ and extends to a larger fixed multiple of the allowed depth.
    By Lemma 52, each has a uniformly positive conditional chance of an actual dual-open path from the dual corner
    of a triangle on the primal wall to its inner end. Complete this path across that triangle to the midpoint of
    its primal base.
  One successful bar prevents the required advance before a dual reset.
    For completeness, follow the actual traversed switch pairs and add a microscopic connector at each primal
    restart. At that restart the connector passes from the encountered pair through the neighborhood of the open
    primal diagonal and hitting vertex to the new cap’s #emph[earlier] port,
    approaching along its near base endpoint. It stays in the retained sectors and avoids all actual dual paths.
    A positive angular passage within the shallow strip would have to cross the completed bar positively.
    It cannot cross its actual dual part. Traversal of the cap pair in the fixed triangle crosses the added
    segment only negatively, because primal is on the left. If this triangle itself is selected for the restart,
    the connector reaches the earlier port without crossing the segment.
    Every other reset connector stays beside its own primal vertices and avoids that fixed segment.
    An excluded triangle is never used again. Thus the positive crossing is impossible.
    This argument is in the prime closure of the stop domain, where all short accessed moves are uniformly chart-small.
  While $theta < r \/ 16$ there is no dual reset. Multiplying the conditional failure bounds for the disjoint bars
    proves (14.2). Also, a negative motion of order $r$ is impossible in this zone:
    $O$ is nondecreasing, including its primal resets, and $W = O - theta$.
    The reflected argument proves the other endpoint statement. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.628, stroke: (thickness: 0.8pt, miter-limit: 10))
  arc((1.572, 0.4212), start: 15deg, stop: 132deg, radius: 1.628, stroke: (thickness: 1.2pt, miter-limit: 10, dash: "dashed"), mark: (end: ">"))
  arc((-1.247, 1.046), start: 140deg, stop: 365deg, radius: 1.628, stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: ">"))
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  content((0, 0), [$z$], anchor: "north", padding: 0.1176cm)
  circle((1.572, 0.4212), radius: 0.07056, fill: black, stroke: none)
  content((1.572, 0.4212), [$W$], anchor: "west", padding: 0.1176cm)
  circle((-1.247, 1.046), radius: 0.07056, fill: black, stroke: none)
  content((-1.247, 1.046), [$O$], anchor: "south-east", padding: 0.1176cm)
  arc((0.6288, 0.1685), start: 15deg, stop: 140deg, radius: 0.651, stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0.2173, 0.9412), [$theta$])
  content((0.7003, 1.924), [dual arc])
  content((-0.5272, -1.968), [primal arc])
  content((5.303, 1.071), [#box(width: 5.035cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$theta =0$: primal pocket#linebreak()advance $O$ to the next counterclockwise wall edge]])])
  content((5.303, -1.071), [#box(width: 5.035cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$theta =2 pi$: dual pocket#linebreak()reverse the wall order]])])
})],
  caption: [Figure 4: Normalized chart of a two-change component. The angle $theta = O - W$ is measured counterclockwise along the dual arc. The arrows on the circle indicate boundary order, not strand orientation. The forcepoint reset uses the next old-wall edge on the retained pocket. A full turn changes the endpoint of the reflected angular interval. The drawing is schematic; microscopic tip and force sides are suppressed. ],
) <tree:figure>

Away from coincidences use Lemma 55. In an endpoint zone,
  a fast exit toward the interior is controlled by the tightness of $theta$,
  and fast motion remaining in that zone is controlled by Lemma 56 and the sign of $O$.
  Thus $W$ and $O$ are continuously tight, also at variable stops.
  Moreover, on a sufficiently small fixed endpoint zone, both the continuous part of $O$ and every reset have the
  same sign. Its variation on each visit is bounded by its angular oscillation there.
  Count visits by alternations between nested endpoint zones, whose number is tight;
  outside these zones the cotangent rate is bounded. We obtain tightness of

#[#set math.equation(numbering: n => "(14.3)")
 $ "Var"_(\[ 0 \, T \]) \( O \) quad upright("and") quad integral_0^T \| cot \( theta_t \/ 2 \) \| thin d t .
   $ <tree:variation>]

In any limit the endpoint sets have zero radial Lebesgue measure, $O$ has locally finite variation,
  and (13.3) holds off those sets. A remaining singular part could only be nonnegative at $0$ and nonpositive at
  $2 pi$. We next rule it out.

=== 14.2 Instantaneous reflection and removal of a singular push <tree:endpoints>

#thm([Proposition 14.3.])[
  (The endpoint convention is determined).  #emph[In its own radial clock,
    the limiting gap is the unique instantaneous reflected diffusion on $\[ 0 \, 2 pi \]$ with interior generator
#[#set math.equation(numbering: n => "(14.4)")
 $ cal(A) f \( theta \) = kappa / 2 f'' \( theta \) + frac(kappa - 4, 2) cot \( theta \/ 2 \) f' \( theta \) .
   $ <tree:generator>]

 The forcepoint has no singular push:
#[#set math.equation(numbering: n => "(14.5)")
 $ O_t = O_0 + integral_0^t cot \( theta_s \/ 2 \) thin d s . $ <tree:no-push>]

 Equation (14.1) consequently holds globally, including collisions, with locally integrable drift.]
] <tree:reflection>

#proof[
  For a smooth function constant near both endpoints, the localized interior identities glue to the martingale
    problem for $cal(A)$. To admit a smooth function with $f' \( 0 \) = f' \( 2 pi \) = 0$,
    approximate it by such cutoffs with uniformly bounded second derivatives.
    Its cotangent term is bounded near the ends, since $\| f' \( theta \) \| =
    O \( min \( theta \, 2 pi - theta \) \)$. The endpoint time is zero,
    so dominated convergence gives the limiting martingale identities and, by applying the same argument to $f^2$,
    their brackets.
  In particular $X = cos \( theta \/ 2 \)$ solves
  #[#set math.equation(numbering: n => "(14.6)")
   $ d X_t = sqrt(kappa) / 2 sqrt(1 - X_t^2) thin d B_t - frac(3 kappa - 8, 8) X_t thin d t \, wide - 1 lt.eq
     X_t lt.eq 1 . $ <tree:jacobi>]
  The diffusion coefficient is one-half Hölder and the drift is Lipschitz;
    the one-dimensional square-root uniqueness criterion gives pathwise uniqueness.
    Hence this equation fixes the instantaneous reflected law of $theta$;
    a sticky alternative is also excluded by zero endpoint time.
  Near either endpoint the scaled distance $R$ has Bessel dimension
  #[#set math.equation(numbering: n => "(14.7)")
   $ frak(d) = 3 - 8 / kappa in \( 1 \, 2 \) . $ <tree:bessel-dimension>]
  Its drift differs from $\( frak(d) - 1 \) \/ \( 2 R \)$ by a bounded smooth term of order $R$.
    Stopped Girsanov, equivalently in the squared coordinate where the excess drift divided by the diffusion
    coefficient extends boundedly, transfers the usual Bessel path properties.
    Thus $theta$ is locally Hölder of every exponent below $1 \/ 2$,
    and each endpoint set has Hausdorff dimension at most
  #[#set math.equation(numbering: n => "(14.8)")
   $ d_0 = 1 - frak(d) \/ 2 < 1 \/ 2 . $ <tree:zero-dimension>]
  The needed Bessel Hölder statement is, for example, #cite(label("HutzenthalerJentzenNoll2014"), form: "prose")
    Theorem 1.2 and Corollary 2.14. The zero-set statement follows from the inverse-local-time description in
    #cite(label("RevuzYor1999"), form: "prose") Exercise XI.1.25 and the stable-range dimension in
    #cite(label("Bertoin1996"), form: "prose") Theorem III.15.
    Only a bounded stopped perturbation at one endpoint is being used here.
  Write the possible remaining term as the signed measure
  $ d nu = d O - cot \( theta \/ 2 \) thin d t . $
  It is supported on the two endpoint sets and has the sign specified after (14.3).
    We give the time-block argument explicitly, so that a Hausdorff-dimension bound,
    rather than an unstated Minkowski bound, suffices. Choose $eta > 0$ so small that
  $ p = 1 / 2 - eta > d_0 \, wide u_m = 2^(- m) \, wide r_m = u_m^p . $
  By the Hölder property, every sufficiently fine dyadic block of length $u_m$ meeting an endpoint set has its
    end-gap at most $r_m \/ 32$ throughout. Indeed choose a Hölder exponent strictly between $p$ and $1 \/ 2$.
    Apply Lemma 56 with harmless fixed buffer changes to the finitely many blocks at level $m$,
    taking the mesh limit first. The probability that some level-$m$ block stays in the stated endpoint zone and
    has one-signed $O$-variation exceeding $C r_m$ is at most
  #[#set math.equation(numbering: n => "(14.9)")
   $ C \( 1 + T \/ u_m \) exp \( - c u_m^(- eta) \) . $ <tree:block-sum>]
  This is summable in $m$. The estimate for $O$ follows from that for $W$ because their difference is the end-gap,
    of size at most $r_m \/ 32$ on such a block. Borel–Cantelli gives, almost surely,
    the variation bound $C u_m^p$ on every sufficiently fine endpoint-meeting block,
    separately for the two endpoints and on each fixed horizon.
  On an endpoint neighborhood, $d O$ is one-signed, and so is the cotangent time measure.
    Its restriction to the endpoint set is zero, whereas the restriction of $d O$ there is precisely $d nu$.
    Consequently $\| nu \| \( I \) lt.eq "Var"_I \( O \)$ for every small interval in that neighborhood.
    Cover the endpoint set by intervals of variable lengths whose sum of $p$th powers is arbitrarily small,
    using (14.8). Replace each by a bounded number of comparable dyadic intervals that meet the set.
    The preceding variation bound yields arbitrarily small $\| nu \|$-mass. Thus $nu = 0$, proving (14.5).
  Finally, a Bessel process of dimension greater than one is a semimartingale with integrable inverse-distance
    drift and no local-time term in its ordinary coordinate. Undoing (14.6) in the endpoint neighborhoods,
    and using the interior identities elsewhere, gives $d theta = -
    sqrt(kappa) thin d B + \( \( kappa - 4 \) \/ 2 \) cot \( theta \/ 2 \) d t$.
    Together with (14.5) this is (14.1) globally. There is therefore no unspecified boundary pushing rate. ◻
]

=== 14.3 Common clocks and independence after separation <tree:joint>

The single-branch conclusion does not by itself identify the joint tree.
  In particular a narrow discrete corridor may survive after its two limiting target kernels have separated.
  We address this before using any continuum tree theorem.

#thm([Proposition 14.4.])[
  (Joint target tree).  #emph[For every finite family of deterministic interior targets,
    the peeling converges in its joint radial driving data to the target-invariant branching radial
    $upright("SLE")_kappa \( kappa - 6 \)$ tree. Branches agree until their target kernels separate and then have
    independent continuation noises. At successive full turns the force side is reversed,
    equivalently the angular gap remains instantaneously reflected on $\[ 0 \, 2 pi \]$.]
] <tree:joint-law>

#proof[
  Use the sum of currently accrued target clocks as a common parameter $v$,
    freezing each target at its prescribed horizon. Every clock $t_i \( v \)$ is nondecreasing and $1$-Lipschitz.
    Several run together while their targets share an active component;
    separate components are processed in serial priority order. A flat clock has a constant state.
    All tightness bounds and the interior identities hold between adapted common-clock stops,
    including tests of the whole past. Work in other components during an interrupted segment is conditionally
    independent of its unqueried switches by Lemma 51; neither the schedule nor the stop gives advance information.
  Extract limits jointly with the clocks. The preceding endpoint arguments can be applied in each marginal’s own
    radial clock, using tightness and inverse-clock extraction across flat stretches.
    Thus the martingale part $M_i$ of $W_i$ is a continuous local martingale relative to the common past, with
  #[#set math.equation(numbering: n => "(14.10)")
   $ d chevron.l M_i chevron.r = kappa thin d t_i . $ <tree:brackets>]
  The Loewner equations determine its target kernels and normalized maps.
  While targets $z_i \, z_j$ remain in one component, put $xi = Phi_i \( z_j \)$.
    Radial Loewner evolution and the conformal-radius change give
  #[#set math.equation(numbering: n => "(14.11)")
   $ d t_j = P^2 thin d t_i \, wide d log \| xi \| = P thin d t_i \, wide P =
     frac(1 - \| xi \|^2, \| e^(i W_i) - xi \|^2) . $ <tree:clock-change>]
  Their marked boundary angles correspond by the normalized disk Möbius map.
    On a compact interval with $\| xi \| < 1$ these formulas are regular and pass to the limit.
    The targets are still in the same kernel exactly while they retain an interior connecting path:
    kernel convergence preserves paths with positive clearance. Thus they have the same growth up to kernel separation.
  Suppose now their limiting kernels have separated but their discrete components have not yet split.
    Along such a portion $\| xi \| arrow.r 1$ by monotonicity.
    On a subinterval where both limiting angle gaps stay in the interior,
    the two marked prepoints remain separated in both charts.
    The disk Möbius formula forces one of $e^(i W_i) \, e^(i O_i)$ to be within $C \( 1 - \| xi \| \)$ of $xi$ in
    the prelimit. Since they are separated in the $i$-chart, the choice cannot change on a connected subinterval.
    If it is the tip, $P arrow.r oo$; if it is the forcepoint, $P arrow.r 0$.
    Equation (14.11) then forces one limiting clock to be flat.
    This remains true along subsequences of exact discrete split times.
    After an exact split, serial growth gives disjoint time interiors for the two clocks.
    There are only boundedly many changes of component choice for a finite target list and finite horizons.
    Endpoint angle sets have zero mass for the corresponding own clock by Proposition 57.
    The covariance inequality for continuous local martingales and (14.10) therefore show that
  #[#set math.equation(numbering: n => "(14.12)")
   $ d chevron.l M_i \, M_j chevron.r = 0 quad upright("after their kernel separation") . $ <tree:orthogonal>]
  Frozen targets are omitted from this comparison.
  We spell out why these characteristics determine independent continuations,
    without asserting that the clocks are independent. In each still-accessible active group choose its first
    indexed target as representative. Until a separation or freeze,
    the representative’s motion determines all other states and clocks by (14.11).
    Separation and freeze times are intrinsic stopping stages:
    mutual accessibility is read from the radial ODE up to first approach to unit modulus.
    While two other members remain regular with the representative,
    they cannot lose their shared access before either is lost from that representative.
    A nonrepresentative’s horizon is likewise read by its clock correspondence.
    At a multiple separation, take the continuous state limits in all own clocks;
    the subgroups are exactly those retaining internal mutual paths in their kernels.
    Serial speeds of unrelated groups have no effect on these stages.
  For each target accumulate its martingale coordinate only over the suffix during which it is an active
    representative, keeping it flat otherwise. More precisely, with the predictable choice at the stage endpoints, set
  $ N_i \( v \) = integral_0^v upright(bold(1))_({ i upright(" is an active representative at ") s }) thin d
    M_i \( s \) . $
  Once it becomes representative it remains representative of its descendant group until it freezes.
    These representative martingales $N_i$ are pairwise orthogonal by (14.12).
    Their terminal brackets can be finite, so make the completion explicit.
    Let $T_i$ be the prescribed horizons and take the deterministic common terminal parameter $V = sum_i T_i$,
    extending all stopped states constantly if necessary. Divide each $N_i$ by $sqrt(kappa)$,
    and enlarge the common filtration after $V$ with independent Brownian motions $hat(B)_i$,
    independent also of the entire original terminal sigma-field. Set
  $ hat(N)_i \( V + s \) = N_i \( V \) \/ sqrt(kappa) + hat(B)_i \( s \) \, wide s gt.eq 0 \, $
  and use $hat(N)_i \( v \) = N_i \( v \) \/ sqrt(kappa)$ for $v lt.eq V$.
    The extended processes are continuous local martingales in this enlarged common filtration,
    remain pairwise orthogonal, and have infinite terminal brackets.
    Knight’s orthogonal-martingale time-change theorem now gives independent standard Brownian motions in their
    respective bracket clocks #cite(label("RevuzYor1999")) Theorem V.1.9;
    see also #cite(label("Meyer1971Knight"), form: "prose") Theorem 2.
    Restricting to each original terminal bracket supplies precisely its original representative martingale.
    The auxiliary continuation changes neither the past filtration nor any stage of the exploration.
  For the conditional assertion, let $cal(G)_v$ be the common causal filtration and let $S$ be a separation or
    freeze stage. Restart the active representative martingales at $S$, stop at the next common stage,
    and pad constantly to a deterministic horizon. After localizing to bounded brackets,
    these restarted processes remain orthogonal martingales under $bb(P) \( thin dot.op divides E \)$ for every $E
    in cal(G)_S$ of positive probability, with the same bracket identities.
    Completing them as above and applying Knight’s theorem under this measure gives the same product Wiener law
    for every $E$. Thus the continuation noises are independent of $cal(G)_S$.
    A continuing representative uses its original martingale increments,
    and a newly selected one starts its representative suffix.
    No conditioning on terminal bracket values or future separation data is involved.
  The pathwise uniqueness of (14.6), followed by (14.5), determines the angles and maps through the next intrinsic
    stage. A newly assigned representative uses its assigned independent noise;
    a continuing one uses the continuation of the same Brownian solution.
    A change caused solely by a representative’s horizon gives a fresh continuation at that stopping stage.
    Induction over the finite target groups identifies the usual common-branch,
    independent-after-separation construction.
  The resulting equations and angular convention are the target-invariant radial tree of
    #cite(label("Sheffield2009Exploration"), form: "prose") Propositions 3.13–3.14 and Section 4.2:
    a one-sided force weight $kappa - 6$, with the side reversed in an enclosed component after a full turn.
    Our sign convention is $theta = O - W$; exchanging the sign of its Brownian motion translates to the opposite
    angular convention. Increasing the finite horizons proves the assertion at all finite clocks. ◻
]

== 15 Recovery of the nested loop collection <sec:loops>

Continue first in a fixed axis-parallel square with the primal-open wall and wired law of Subsection 13.1.
  Draw the two pairs at each tile contact disjointly in a midpoint disk of radius less than $delta \/ 100$,
  taking each turn on its prescribed side. The resulting actual loops are simple, pairwise disjoint,
  and avoid actual open diagonals of both colors. Use the analogous drawing for wall triangles and orient every
  loop primal-left. Matching successive traversal pieces inside those disks changes each loop by at most $2
  delta \/ 100$ in Euclidean uniform curve distance, and by a constant multiple of this in spherical distance,
  simultaneously for all loops. Thus the drawing convention has no effect on the desired topology.

=== 15.1 Compactness and two sides of every limiting loop <loop:compactness>

#thm([Lemma 15.1.])[
  (Positive-law loop geometry).  #emph[The closed loop collections in the fixed square are tight for matching
    uniform curves modulo reparametrization and orientation. Constant limit curves may be removed.
    Their positive-diameter subsequential limits have the following properties almost surely.]
  + #emph[Each deterministic interior point lies on no loop.
    Its absolute winding number about any loop is $0$ or $1$, and is stable along a converging loop sequence.]
  + #emph[No interior point has three distinct visits in total among the loop elements.
    Visits include multiple traversals after constant pauses are removed and also multiplicity of different elements.]
  + #emph[At every interior point of a positive loop, every neighborhood contains open disks of both absolute
    winding statuses for that loop.]
] <loop:geometry>

#proof[
  #emph[Passage counts and compactness.] Consider a vertical band of fixed positive width,
    with its vertical sides interior to the square and its height equal to that of the square.
    Each disjoint medial passage between its sides has an actual dual path beside it:
    consecutive adjacent dual vertices are identical or joined by an open dual diagonal, including at wall caps.
    Crop to a slightly narrower band. The medial separators continue beyond both cropped sides and are disjoint
    from dual-open edges, so they divide the band into strips.
    Each accompanying dual path lies in the strip on its separator’s dual side,
    with at most two assignments to a strip. Paths in different such strips cannot communicate in the actual dual
    graph there. Hence many passages force many distinct actual dual components crossing the cropped band.
  The graph of internal dual faces is a full lattice rectangle with arbitrary induced boundary data;
    it has no dual crossing of the initial deterministic primal wall.
    The disjoint-passage proof of Lemma 53 bounds its crossing-component count.
    Even with all boundary vertices wired, an #emph[actual] left-right crossing is bounded away from probability
    one by an up-to-boundary primal blocker. End that blocker just beyond the extreme dual rows by bounded
    finite-energy extensions to neighboring internal primal vertices.
    The rectangle’s dual boundary edges themselves are random, so the crossing theorem applies.
    The same argument holds for horizontal bands.
  A finite family of trimmed bands at each fixed scale bounds both the number of loops with diameter above that
    scale and the number of their disjoint subarcs with a given positive displacement.
    These bounds yield compactness modulo reparametrization. To make the extraction explicit,
    subdivide each positive loop by successive first-displacement times into arcs of diameter at most
    $2^(- j + O \( 1 \))$, retaining marks from previous subdivisions.
    The number of marks at each fixed $j$ is tight. Pass to subsequences on which their positions and cyclic
    orders converge. Assign nested parameter intervals with maximal length tending to zero and positive lengths at
    every fixed subdivision, splitting an interval further in two when necessary.
    The corresponding polygonal curves approximate uniformly.
    Diagonalize over diameter cutoffs tending to zero, retaining multiplicities of matched elements.
    This proves collection tightness.
  ===== 15.1.1 Avoidance and the visit bound. <avoidance-and-the-visit-bound.>
  For a deterministic interior point, RSW circuits in successive concentric annuli obstruct an actual arm to a
    fixed positive distance. The probability that a macroscopic loop approaches that point tends to zero with the
    inner radius. A countable union over diameter cutoffs gives (i).
    Winding is stable under uniform convergence away from the point,
    and each simple discrete loop has absolute winding $0$ or $1$.
  Three distinct positive visits near an interior point would yield six medial passages through arbitrarily small
    annuli out to a fixed positive scale. This includes visits belonging to different collection elements.
    In a trimmed intermediate annulus, order those radial separators and assign their actual color arms to the
    intervening strips. Arms in distinct strips stay separated.
    Where a strip receives two assignments retain both if their colors differ, and one if their colors agree.
    Each separator marks a color transition, so the resulting cyclic sequence has an alternating subfamily of at
    least six arms. Radial buffers justify all croppings. The six-arm bound of
    #cite(label("DMT2021Fractal"), form: "prose") Corollary 6.7,
    transferred to this positive square law through a bulk collar, has exponent $2 + c$ for some $c > 0$.
    A grid union over possible centers therefore vanishes like a positive power of the inner scale.
    Taking mesh limits first proves (ii).
  ===== 15.1.2 A circuit attached to each macroscopic bank. <a-circuit-attached-to-each-macroscopic-bank.>
  Fix a bulk core rectangle, with buffer space around it, and a color $X$.
    We claim that, with probability tending to one as $m arrow.r oo$ after the mesh limit,
    the actual cluster of every bottom-to-top core crossing contains an $X$-open circuit in the buffered patch
    enclosing a disk of radius $c \/ m$.
  In a first subrectangle ending at a middle row, label the actual connected components joining its two terminal
    rows. Their number is tight by the passage bound. Reveal the past up to that middle row.
    Above it use $m$ fresh transverse slabs of height $h asymp 1 \/ m$, with all levels rounded on the $X$-grid.
    For a given label, its sources are its actually connected bottom vertices.
    At each new row ask whether these sources connect to that row in the cumulative core rectangle.
    A full crossing survives all these tests under one of the initial labels.
  When a label survives to a row, choose the leftmost simple open path from its sources to that row.
    The edges strictly to its right are fresh with domain Markov data.
    Indeed attach auxiliary spokes from one point below to the sources and from the new top row to a point above,
    in a disk with these auxiliary endpoints on its boundary. Simple paths use spokes only at their ends.
    Minimizing left area selects a path determined by its own edges and those on its left:
    any path entering strictly left supplies an open excursion between two distinct selected-path vertices that
    decreases the left region. The ordinary lattice part $p$ is actually connected to the label.
  At the slab’s middle height, approach horizontally from the right exterior of the core and choose $x$ on the
    right at distance $h \/ 16$ from $p$. The ball $B \( x \, h \/ 3 \)$ lies in the wider fresh patch,
    far from the past, spokes, and slab ends. The fresh graph on the right of $p$ inside a slightly buffered ball
    dominates the restriction of a free comparison on the full ball graph.
    All attachments from omitted left-side or path edges go through vertices of $p$,
    which are wired by actual connectivity in the conditioned law.
    This argument applies to either color, using the dual FK law for dual $X$.
  By interior RSW and FKG in the free ball comparison, with probability at least a fixed $c' >
    0$ there is an open circuit between radii $h \/ 64 \, h \/ 24$,
    connected there to one between radii $h \/ 8 \, h \/ 4$. The outer circuit meets the deterministic geometric
    path $p$, since $p$ comes within $h \/ 16$ of $x$ and exits the ball. Both use the same color graph.
    The inner circuit is wholly on the right of $p$, as is its connection up to first contact with $p$.
    Therefore this event supplies an actual attached disk-circuit using only fresh right-side edges in the slab.
    Conditionally on survival, failure to acquire such an attachment costs a factor at most $1 -
    c'$ at each stage. Truncate the initial number of labels and iterate. This proves the claim.
  ===== 15.1.3 Visibility of both winding statuses. <visibility-of-both-winding-statuses.>
  Use countably many core tests with rational positions and buffered sizes.
    A varying portion of a limiting loop in an interior ball crosses two horizontal or vertical levels of one such
    test with clearance. In its discrete approximants the two actual color banks supply crossings.
    Their clusters lie on opposite sides of the simple loop and do not cross it.
    Choose the buffered test much smaller than the loop’s diameter,
    so neither of the attached disk-circuits can contain the entire loop.
    The disks strictly inside the two circuits then have the two corresponding winding statuses.
    Shrink them to retain positive clearance; subsequential limits preserve disks of positive radius in the
    prescribed ball. The preceding estimate makes failure arbitrarily unlikely.
    Every neighborhood of a point on a nonconstant loop contains a varying portion,
    so the countable tests prove (iii) simultaneously. ◻
]

=== 15.2 Canonical loops and their continuation in the tree <loop:canonical>

Take joint subsequential couplings of the loop collections and of the angular trees for a countable dense set
  $cal(Z)$ of deterministic interior targets, with arbitrarily large finite clock horizons.
  Lemma 59(i) ensures that all these targets avoid all positive limiting loops almost surely.
  Incidental lattice-edge positions do not require an extra convention:
  each active finite horizon retains a ball around its target.

We specify the established continuum input before making the lattice identification.
  For $4 < kappa < 8$, the target-invariant tree of #cite(label("Sheffield2009Exploration"), form: "prose")
  Sections 4.2–4.3 constructs the surrounding loops by full-turn angular excursions and completes each partially
  traced loop through the other branches. At the time of that paper,
  its stated continuity and invariance conclusion in Proposition 5.1 was conditional.
  Here the needed hypotheses follow from #cite(label("MillerSheffield2016IG1"), form: "prose") Theorem 1.3 and
  #cite(label("MillerSheffield2016IG3"), form: "prose") Theorem 1.2 and the ensuing CLE discussion.
  For our single one-sided force weight, $kappa - 6 > - 2$,
  so force collisions do not reach the continuation threshold.
  For reversal, the two one-sided weights $kappa - 6$ and $0$ are both at least $kappa \/ 2 - 4$.
  The starting square is a Jordan domain, and all specified targets are distinct interior points off the loops.
  These results supply continuous non-simple CLE loops and their conformal and anticonformal invariance under
  exactly the parameters used here. They assert no lattice convergence or traversal identification.

The tree in Proposition 58 therefore has a coupled canonical nested $upright("CLE")_kappa$ collection in the
  square. Starting from a primal wall, let $b_0 = 0$, and let $b_1 \, b_2 \,
  dots.h$ be the successive hits of the alternating opposite endpoints: first $2 pi$, then $0$, and so on.
  Let $a_k$ be the last visit to the starting endpoint before $b_k$.
  The canonical surrounding loop is denoted $tilde(L)_z^k$.
  It follows the branch toward $z$ on $\( a_k \, b_k \)$ and is then completed to its starting point by the tree’s
  continuation of the current strand. These are the successive loops with nonzero winding about $z$,
  and every canonical loop is obtained from a target in $cal(Z)$.

The endpoint reversal amounts to using reflected exploration chirality in the new enclosed component.
  Nesting supplies independent CLEs in those components, and anticonformal invariance preserves their unoriented
  laws. Thus the alternating endpoint convention gives the same nested ensemble.
  The scalar full-turn description is also the one in #cite(label("SchrammSheffieldWilson2009"), form: "prose")
  Proposition 2; that result identifies the conformal-radius decrement,
  while the joint branch coupling and loop completion used here come from the exploration-tree construction.
  Endpoint accessibility of the diffusion with $1 < frak(d) < 2$ makes every $b_k$ finite, and $b_k arrow.r oo$:
  otherwise its continuous angle would make infinitely many full $2 pi$ swings on a compact clock interval.

We will need the following concrete interpretation of the completion.

#thm([Lemma 15.2.])[
  (Default continuation and local double visits).  #emph[At an interior-angle time $s in \( a_k \, b_k \)$,
    the remaining traversal of $tilde(L)_z^k$ is the default strand from $W_s$ to $O_s$ in the current domain.
    In a chart sending those accesses to $0 \, oo$, every finite portion of this continuation is ordinary chordal
    $upright("SLE")_kappa$ and is recorded by branches to targets from $cal(Z)$ that remain accessible high above
    that portion. Every open nonconstant traversal interval of $tilde(L)_z^k$ contains two visits to one
    square-interior point.]
] <loop:continuation>

#proof[
  The stopped chordal equivalence is only valid while its force access is available.
    To continue after the original target is cut off, use the branch that retains this access,
    as prescribed by the tree construction. A bounded finite chordal-capacity portion has bounded hull and driver.
    An open set of targets mapped to sufficiently large heights remains accessible above it,
    with tip and force angles strictly separated on that portion. The countable dense set supplies such a target.
    Its branch records the default continuation even if it has already separated from $z$.
    Target invariance gives consistency when the target or the finite portion is enlarged.
    This realizes all finite portions and hence the complete strand;
    it does not extend Proposition 3.12 of #cite(label("Sheffield2009Exploration"), form: "prose") beyond its
    stopping condition.
  All these curves are continuous. Over a finite trace time the remaining domains have locally connected
    boundaries, by the locally-connected-continuum boundary theorem applied to the continuous trace and the
    starting boundary. Their prime-access conformal images can thus be regarded as continuous physical curves.
  For ordinary chordal SLE, #cite(label("MillerWu2017"), form: "prose") Theorem 1.1 and Corollary 1.7 give double
    points in the interior when $4 < kappa < 8$. Indeed their double-point dimension exceeds the boundary-hit
    dimension by $\( kappa - 4 \)^2 \/ \( 8 kappa \) > 0$. Both visits occur at finite times.
    Scaling makes the probability of such a double visit before time $t$ independent of $t > 0$;
    since its union over finite times has probability one, this probability is one for every $t > 0$.
    The domain Markov property then gives an interior double visit in every rational open capacity interval.
    Conformal maps preserve an interior double visit. Every open traversal interval of the canonical loop contains
    an interior-time portion either of its full-turn excursion or of its finite default continuation.
    On a sufficiently short localized portion its law is ordinary chordal SLE.
    The preceding arbitrary-short-time statement applies before any positive localization time, proving the assertion. ◻
]

=== 15.3 Episodes and full-turn labels <loop:episodes>

A discrete #emph[episode] starts when a cap is opened and ends at the next switch retaining a homogeneous pocket.
  Its color is the homogeneous wall color just before the opening.
  Call it successful when its loop winds around the target.

#thm([Lemma 15.3.])[
  (Discrete winding order).  #emph[As long as the target is macroscopically separated from a consumed tile or
    star, an episode is successful exactly when its terminal switch changes wall polarity.
    These polarity changes enumerate all loops surrounding the target, in their order from outside inward.
    A positive loop with positive clearance from the target is reached before a finite radial horizon depending on
    that clearance. Conversely a successful switch by a bounded horizon has macroscopic clearance from the target.]
] <loop:episode-order>

#proof[
  The loop through the newly opened cap lies inside its homogeneous starting pocket.
    At the cap, the side toward the base, of the starting color, is exterior to this loop;
    the other side is interior. During the episode the actual color banks preserve connections to these sides.
    If a bank hits its same-color wall, the retained homogeneous target pocket is connected to the cap along that
    bank. The traversed loop is outside the pocket: its past pairs have been removed,
    the new open diagonal is a barrier, and the continuation to the old force side stays in the main component.
    The target can reach that pocket’s wall color without crossing the loop.
    Comparing this color with the starting color proves that the target is inside the loop precisely at a polarity
    change. The same argument works with separate boundary occurrences.
  Every other unstarted candidate surrounding the target stays intact in the retained component.
    Actual diagonals and walls cannot cross it, and a loop wholly inside a simply connected pocket has its
    interior there too. Its deterministic pairs in any wall triangles are also intact,
    because cuts by other loops never traverse them. If the loop entered at a new cap surrounds the target,
    it is outermost among the remaining candidates: its access to the homogeneous wall at that cap crosses none of
    them. Thus successful episodes enumerate the surrounding loops,
    with possible unsuccessful same-color episodes between them.
  Before such a loop’s episode, growth remains outside its enclosed region;
    during the episode it follows that loop up to step-sized errors.
    A ball centered at the target inside its region therefore survives until the switch.
    If its radius is $r > 0$, then $"crad" \( U_t \, z \) gt.eq r$ up to that time,
    bounding the radial clock by $log \( "crad" \( U_0 \, z \) \/ r \)$.
    Conversely, Koebe’s bound on a fixed horizon gives a positive-radius ball in the newly retained pocket,
    and its surrounding successful loop lies outside that ball, up to vanishing step errors. ◻
]

An endpoint approach could otherwise be mistaken for a reset in the limit. The next estimate excludes this possibility.

#thm([Lemma 15.4.])[
  (Endpoint resets cannot be skipped).  #emph[At a bounded-clock completed state with $theta$ approaching $0$,
    the probability of returning to a fixed positive angle before a primal-pocket reset tends to zero,
    with the mesh limit first and the endpoint tolerance second.
    The analogous assertion near $2 pi$ uses a dual-pocket reset.
    Consequently the true successive discrete polarity-change times $b_k^n$ converge in probability to $b_k$ on
    sufficiently large finite horizons.]
  #emph[Moreover, in an episode that succeeds by a bounded horizon,
    after a fixed interior-angle advance the probability of retreating arbitrarily near its starting endpoint
    before its successful switch tends to zero in the same order of limits.]
] <loop:no-skip>

#proof[
  Near $0$ the entire dual wall arc and both end sides are in a tiny boundary neighborhood of the stopping chart.
    Until a primal reset, the growing dual bank remains actually connected to that arc;
    stop also before a fixed interior-angle threshold, so no opposite-end switch has yet occurred.
    In successive buffered dyadic chart half-annuli around this neighborhood,
    place actual primal transversal paths from primal wall to primal wall.
    Lemma 52 gives a uniformly positive conditional success chance at each separated scale,
    after the mesh limit at the chosen cutoffs. A successful path confines the connected dual bank,
    and hence the slit pieces, inside its small wall sector.
  A hull confined to such a sector has a small new angular footprint:
    its basepoint-side maps converge to the identity at the origin and, by reflection,
    on each closed boundary arc away from that sector. The trapped dual arc remains in its short footprint.
    Therefore it cannot produce a fixed positive angular advance.
    Letting the number of half-annuli grow proves the first assertion. Exchange colors and reverse directions at $2 pi$.
  A true polarity change approaches the specified opposite endpoint, up to vanishing update errors.
    Uniform angle convergence and induction therefore preclude a premature macroscopic limit for $b_k^n$.
    Conversely, after the limiting first endpoint hit, instantaneous reflection produces a positive excursion
    within any prescribed additional time almost surely. Truncate the clocks and choose an exit size so that
    failure has arbitrarily small probability. Start at the first completed-state approach within a small
    tolerance after the previous true polarity change. The just-proved estimate excludes an excursion of this size
    before the corresponding reset. Let the tolerance tend to zero. An earlier matching reset already suffices.
    Thus no endpoint hit is skipped, and $b_k^n arrow.r b_k$.
  For the final assertion, stop at successive approaches to the starting endpoint after a fixed-size advance.
    A successful episode that makes such an approach must then advance macroscopically without the corresponding
    same-color reset, since that reset would end the episode. The first assertion bounds each such event.
    The number of fixed-size swing tests is tight by angular tightness,
    so truncation and iteration give the stated retreat estimate. ◻
]

It follows in particular that on every compact subinterval of $\( a_k \, b_k \)$, the prelimit target branch is,
  with probability tending to one, in the same episode as at its $k$th successful switch.
  The angle stays away from the starting endpoint on that compact interval,
  and the preceding polarity change occurs before it.

Include the true winding-loop labels $L_z^(n \, k)$ in the coupling and extract their limits $L_z^k$,
  increasing clock and diameter cutoffs as needed. They have positive size at bounded $b_k^n$ by Lemma 61.
  They exhaust the positive limiting loops winding about $z$:
  any such loop has positive clearance from $z$ and is reached before a bounded horizon,
  while the number of full swings there is tight. Winding tests are stable.
  For finite lists of labels stabilize also the indicators of equality as collection elements and then
  diagonalize. Distinct elements in this bookkeeping have distinct discrete representatives,
  even if their geometric limits might initially appear identical.

=== 15.4 Ordered containment and equality of the labels <loop:matching>

#thm([Lemma 15.5.])[
  (The canonical traversal is contained in order).  #emph[For each $z in cal(Z)$ and $k gt.eq 1$,
    the entire traversal of $tilde(L)_z^k$ occurs in cyclic order in $L_z^k$,
    possibly with extra traversal portions inserted. Its order occupies at most one turn of $L_z^k$.
    If two canonical labels give the same element, their lattice-limit labels give the same collection element.]
] <loop:ordered>

#proof[
  Fix a rational $s in \( a_k \, b_k \)$. In any open subinterval of $\( a_k \, s \)$ choose $t <
    t'$ strictly inside it. The target kernel strictly shrinks between these times.
    There is a new boundary point inside the earlier open kernel;
    it belongs to the continuous canonical trace over $\[ t \, t' \]$.
    Every small ball about this point with closure in the earlier kernel must encounter new prelimit growth
    between the corresponding times. Otherwise the ball stays clear of new boundary.
    It also meets a compact internal patch of the later kernel.
    Connectedness then puts that whole ball in the retained prelimit component,
    extending the limiting kernel through its alleged boundary point, a contradiction.
    These prelimit boundary pieces are slit updates tracing the successful episode,
    up to vanishing physical step errors.
  Apply this test simultaneously to any finite ordered list of such intervals.
    Completed-update stops can be moved slightly inside them because capacities and angular within-step errors
    vanish. We obtain points of the discrete winding-loop traversal, in chronological order,
    converging to canonical trace points in those intervals.
  Now take any finite list of finite chordal intervals on the default continuation after $s$.
    Choose, realization by realization, a target $w in cal(Z)$ in the current kernel whose chart image is safely
    above the entire bounded portion in question. It was still accessible with $z$ up to $s$.
    Their time correspondence there is regular and passes to the mesh;
    they cannot have split earlier because the limiting kernel contains internal connecting paths with clearance.
    The branch toward $w$ follows the default continuation with tip and force angles separated by a positive
    margin on the selected portion, by Lemma 60. Therefore its discrete branch has no reset there and continues
    the same original winding loop, in order, after the common prefix.
    The new-boundary test applies to these intervals in the $w$-clock.
    The target $w$ need not have a successful episode for this loop.
    Its post hoc choice costs no uniformity assumption: all targets, clocks,
    and regular sharing correspondences from the countable set have already been included in the coupling.
  By continuity, shrinking the testing intervals and increasing the finite continuation range shows that every
    finite increasing list of canonical traversal points has representatives in order on $L_z^k$.
    On a countable dense set of canonical parameter values, take a single nondecreasing cyclic choice of
    representative parameters by compactness and a diagonal subsequence.
    Omitted endpoint values are included by continuity. The order uses at most one turn:
    the discrete episode and its no-reset continuation traverse a simple closed loop from its released cap without
    passing that cap a second time. Two separated canonical visits cannot collapse to one representative
    parameter, because every intervening open traversal interval has actual variation.
  If $tilde(L)_z^k = tilde(L)_w^j$ but the two lattice-limit elements were distinct,
    each would contain the same canonical interior double visit from Lemma 60.
    This would give more than two total limiting visits at that point, contrary to Lemma 59(ii).
    Thus equal canonical labels have equal lattice-limit labels, with multiplicity understood as stipulated above. ◻
]

The converse is essential: ordered containment alone would permit several canonical labels inside one discrete
  limiting element.

#thm([Lemma 15.6.])[
  (The converse label identification).  #emph[Almost surely, simultaneously for all $z \, w in cal(Z)$ and $k \,
    j gt.eq 1$,
#[#set math.equation(numbering: n => "(15.1)")
 $ L_z^k = L_w^j quad arrow.l.r.double quad tilde(L)_z^k = tilde(L)_w^j $ <loop:label-iff>]

 as collection elements.]
] <loop:label-equivalence>

#proof[
  Only the forward implication remains. On the event that the discrete labels are shared,
    the two branches cannot split before entering this common loop:
    before its episode the loop and its interior remain intact across every cut by other loops.
    Choose clock horizons large enough to include both successful switches except on an arbitrarily small event.
  While they share a domain, write $xi = Phi_z \( w \)$. For a fixed small $e > 0$,
    stop at first approach to $\| xi \| gt.eq 1 - e$, if it occurs before the relevant winding switches.
    For fine mesh this can be a completed state also satisfying $\| xi \| lt.eq 1 - e \/ 2$.
    An exact split cannot precede this threshold inside the comparison range:
    the ODE and clock change are regular for $\| xi \| lt.eq 1 - e \/ 2$, and elementary capacities vanish there.
  We first show that an #emph[unstarted] loop surrounding both targets at this stop has probability tending to
    zero as $e arrow.b 0$. Place separated dyadic chart half-annuli around the boundary direction of $xi$,
    between radius a multiple of $e$ and a fixed small radius.
    Choose their buffered wall intervals to avoid the two marked accesses and sides;
    deleting the bounded number of affected scales leaves a number tending to infinity.
    Each bar separates a sector containing the radial access from $w$ to the wall from the sector containing $z$
    and a remote wall portion.
  Use an actual-color transversal path in each bar, choosing the color to match one wall end.
    At that end it reaches an actual wall vertex. At the other it does so as well if the wall has the same color.
    If that wall has the other color, complete the path from its specified-color triangle corner to the base by
    the segment of Lemma 52. After trimming at first wall contacts this is a simple crosscut in the prime closure.
    Its added segment meets only the one local cap pair, once.
  An unstarted simple loop inside the domain surrounding both targets must cross this screen at least twice:
    it must meet both of the separated sectors, and its interior contains both targets.
    It cannot cross the actual open path, and cannot traverse that one cap pair twice.
    Thus one successful screen precludes the event, even with mixed wall colors.
    The conditional success probability of each fixed-aspect buffered bar is bounded below by Lemma 52.
    Iteration, with the mesh limit first, proves the asserted small probability.
  We next obtain a shared interior precursor for a shared successful loop.
    If the common loop is processed before the near-separation threshold is needed,
    its episode visibly passes through interior angles, comparable in the two charts while $\| xi \| lt.eq 1 -
    e \/ 2$. If the loop is still current at the threshold, its $z$-angle cannot be arbitrarily close to that
    episode’s starting endpoint and later succeed without a same-color reset, by Lemma 62.
    Otherwise, its progression from the start to the current state has already passed a fixed interior margin.
    The $w$-angle at that shared state has a comparable interior margin, with constants allowed to depend on $e$.
    The unstarted case has just been made unlikely. Thus, except on an arbitrarily small event,
    the two successful episodes have a common state before kernel separation,
    with both angles interior by fixed positive margins.
  From this precursor to the respective winding switches, neither angle returns arbitrarily near its episode’s
    starting endpoint, by the successful-episode retreat estimate in Lemma 62.
    Choose in order the clock cutoff, the near-separation threshold, the interior margins,
    and the retreat tolerance, making their error probabilities successively small.
    With strict buffers a subsequential precursor remains in a common kernel with $\| xi \| lt.eq 1 - e \/ 2$,
    lies after both previous polarity changes, and lies in the interiors of both limiting successful excursions.
    Their endpoint histories and starting excursion time agree along the common branch by the regular chart
    correspondence. They share the successful front to this interior state and use the same default continuation
    to the same force access for its rest. Therefore their canonical loop elements coincide.
    Let all the preceding errors tend to zero. Countability of the labels proves the simultaneous assertion. ◻
]

=== 15.5 Trace and traversal identification <loop:traversals>

#thm([Proposition 15.7.])[
  (Identification away from the square wall).  #emph[Every positive lattice-limit loop with an interior point has
    a canonical label. Matched elements have the same winding indicators on $cal(Z)$.
    If either matched element stays away from the square wall,
    the two elements are equal as curves modulo reparametrization and orientation.
    Without that restriction, every canonical element is still contained in order in its lattice-limit partner.]
] <loop:identification>

#proof[
  The two-winding-disk property of Lemma 59(iii) provides a disk of winding one for every positive limiting loop
    with an interior point. It contains a target from $cal(Z)$,
    so the loop is one of its exhausted winding labels. For a labeled loop,
    Lemma 64 makes its dense-target winding indicators identical to those of its canonical partner:
    winding one at a target is equivalent to equality with one of that target’s successive surrounding-loop
    labels, in both collections.
  Suppose an interior trace point of the lattice-limit loop were outside its canonical partner trace.
    A small ball about it avoids that canonical trace and has constant canonical winding.
    The two-winding-disk property supplies disks of both lattice winding statuses in the same ball,
    each containing a dense target. This contradicts the indicator equality.
    Hence the entire interior lattice trace lies on its partner.
    The reverse trace inclusion follows from ordered containment.
    If the canonical partner is internal, the connected lattice trace containing it cannot reach the wall without
    adding an interior point outside that partner. If the lattice trace is internal, so is the contained partner.
    Thus in either wall-away case the full traces are equal.
  It remains to exclude extra traversal of this trace. Invert the nondecreasing cyclic representative selection in
    Lemma 63 by a generalized inverse. Because every canonical open traversal interval has actual variation,
    this inverse is continuous, nondecreasing, and of degree one.
    The traces agree at all its non-plateau-interior times. A plateau would insert an extra portion of the lattice
    traversal anchored at one canonical point.
  Assume such a portion varies. By trace equality it lies on the canonical trace.
    At a visited value different from its anchor there can be only one canonical parameter:
    two canonical visits plus this inserted visit would violate the total-visit bound of Lemma 59(ii).
    On a varying subarc away from the anchor, the assignment to that unique canonical parameter is continuous,
    by compactness. It therefore sweeps a nontrivial canonical traversal interval all of whose values have unique
    canonical visits. This is impossible by the interior-double-visit property of Lemma 60.
    Hence every inserted portion is constant. Equality modulo reparametrization follows,
    including the preserved multiplicity of collection elements. ◻
]

=== 15.6 From squares to the free plane law and the sphere <loop:wholeplane>

#thm([Theorem 15.8.])[
  (Nested full-plane convergence for $q < 4$).  #emph[For every fixed $1 lt.eq q < 4$,
    the loop collection of the free infinite-volume critical square-lattice FK law converges,
    through the full mesh sequence, to the nested whole-plane $upright("CLE")_(kappa \( q \))$ in the spherical
    loop-matching topology of Subsection 1.2. The limit is Möbius invariant and includes every nested generation.]
] <loop:plane>

#proof[
  We first give the uniform comparison estimates that allow an upgrade from a local limit.
    For a fixed compact disk $K$, the probability that any discrete loop visits $K$ and reaches a distant
    surrounding circle tends to zero as that circle tends to infinity,
    uniformly for sufficiently small meshes and for larger initial wired squares.
    Actual monochromatic circuits in buffered annuli block such a loop;
    conditional RSW gives a fixed success chance at each separated scale.
    Use a slightly enlarged $K$ and strict radial margins when passing to limits.
  The free infinite-volume law and the homogeneous-square law can be coupled identically on a growing intermediate
    disk with probability tending to one as the square grows.
    Bracket the exterior partition by the minimal and maximal partitions, use monotone FK coupling,
    and expose actual boundary-attachment clusters in the maximal sample.
    Dual RSW screens make their probability of reaching the deep interior tend to zero.
    Once exterior influence is separated, the remaining conditional laws agree and one uses identical switches.
    Combining this with the preceding escape estimate makes the #emph[entire] loops visiting $K$ coincide,
    since those loops stay in the intermediate disk. This argument uses the specified free plane law and FK domain
    Markov coupling; it assumes no interface limit.
  In a fixed-square subsequential coupling, Proposition 65 identifies all wall-away macroscopic loop elements,
    with their traversals. Its remaining possible discrepancies involve the wall.
    The escape estimate makes it unlikely that a lattice-limit loop both hits $K$ and reaches that wall.
    The same holds for a canonical CLE loop, because that loop is contained in its lattice-limit partner.
    Thus, when the square is large, the square CLE and the free plane lattice law have arbitrarily close matching
    configurations on loops visiting $K$, in the successive mesh and square limits.
  The large-domain local limit of nested CLE is established in
    #cite(label("MillerWatsonWilson2015"), form: "prose") Appendix A, Theorem A.1.
    Its comparison uses conformal identifications of the relevant random-region loop configurations,
    with maps approaching the identity on compact sets; it does not assert equality at unchanged Euclidean
    coordinates. The work cited here is #emph[The conformal loop ensemble nesting field], arXiv:1401.0218,
    whose Appendix A contains that theorem. For $4 < kappa < 8$ this construction agrees with the whole-plane
    branching construction by #cite(label("GwynneMillerQian2021"), form: "prose") Remark 2.6,
    and its law is invariant under inversion, hence under Möbius maps, by their Theorem 1.1.
    Centered squares and disks give the same local limit: normalize their conformal radii,
    and the comparison maps tend to the identity on compact subsets.
    All these parameter restrictions hold for our $4 < kappa lt.eq 6$.
  To pass from this local law to the required spherical topology,
    fix $epsilon.alt > 0$ and choose $K$ so large that its exterior has spherical diameter less than
    $epsilon.alt$. Loops entirely outside $K$ are then irrelevant at that matching accuracy.
    The uniform escape bounds control the loops that visit $K$ but leave a much larger disk.
    They hold for square CLEs uniformly as the squares grow, by their subsequential square-law couplings and the
    containment argument above. Consequently the laws of the square CLEs are Cauchy for spherical matchings:
    compare two large squares on a large fixed intermediate disk to the same free-plane lattice law,
    let the mesh tend to zero, and use the escape tails and the exterior diameter bound.
  Any resulting spherical limit has the established local whole-plane CLE law.
    That local law, together with these tails, determines the full spherical collection:
    at each accuracy all relevant loops are seen in a bounded window except on an arbitrarily small event.
    Conversely, the same comparisons force every subsequence of the free-plane lattice laws to this limit.
    Hence convergence holds for the full mesh sequence. The target labels ranged over all $k gt.eq
    1$ and the clock cutoffs increased without bound, so no nested generations have been discarded.
    This proves Theorem 1(ii) for $1 lt.eq q < 4$. ◻
]

== 16 Rotation of the fair-signed height at $q = 4$ <sec:q4-rotation-repair>

The endpoint argument needs rotational invariance of height correlations,
  with the loops counted with their multiplicities. The loop-set distance in the statement of the FK rotation
  theorem does not by itself retain those multiplicities. We obtain the required assertion directly from the
  homotopy coupling used in its proof #cite(label("DCKKMO2026Rotation")) Sections 3.5–3.6 and 4.2.
  Only qualitative bulk RSW estimates are used in this transfer.

For $k gt.eq 2$, let

$ cal(D)_k = {bold(u) = \( u_1 \, u'_1 \, dots.h \, u_k \, u'_k \) : { u_i \, u'_i } ∩ { u_j \, u'_j } =
  diameter quad \( i eq.not j \)} . $

Coincidence within one pair is allowed. Give the critical $q =
  4$ FK loops independent fair signs and let $h_delta$ be the resulting height,
  with jumps of size one and an immaterial additive constant.
  At a continuum point use any fixed face representative within $O \( delta \)$. Put

#[#set math.equation(numbering: n => "(16.1)")
 $ Phi_(k \, delta) \( bold(u) \) = bb(E) product_(i = 1)^k #scale(x: 120%, y: 120%)[\(] h_delta \( u'_i \) -
   h_delta \( u_i \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rr-Phi>]

#thm([Theorem 16.1.])[
  (Isometry invariance of the endpoint correlations).  #emph[For every even $k gt.eq
    2$ and every compact $K subset cal(D)_k$,
#[#set math.equation(numbering: n => "(16.2)")
 $ lim_(delta arrow.b 0) sup_(bold(u) in K) sup_(I in "Isom" \( bb(R)^2 \))
   lr(|Phi_(k \, delta) \( bold(u) \) - Phi_(k \, delta) \( I bold(u) \)|) = 0 . $ <eq:rr-target>]

]
] <thm:rr-rotation>

The exact plane correspondence is recorded first, including the passage from torus loops to the plane.
  This avoids any need for an unpublished general-parameter correspondence.

#thm([Lemma 16.2.])[
  (The endpoint plane correspondence).  #emph[After the fixed similarity identifying the medial square grid with
    $bb(Z)^2$, the fair unit-jump height of critical plane $"FK"_4$ has the same gradient law as the zero-slope
    six-vertex height with $upright(bold(a)) = upright(bold(b)) = 1$ and $upright(bold(c)) = 2$.]
] <lem:rr-bkw>

#proof[
  On an even square torus, give equal weight to each pair consisting of noncrossing local switch pairings and an
    orientation of each resulting closed loop. Erasing orientations gives weight $2^ell$ to a configuration with
    $ell$ loops. Erasing pairings gives an ice-rule arrow configuration:
    each of the four $a$- and $b$-type vertices admits one compatible pairing,
    and each of the two $c$-type vertices admits two. Thus the arrow marginal has weights $\( 1 \, 1 \, 2 \)$,
    and the loop orientations, conditionally on the unoriented loops, are independent and fair.
    This is the endpoint specialization of the local calculation in #cite(label("Lis2021")) Section 2,
    Equations (2.1)–(2.3).
  The torus weight $2^ell$ need not equal the torus FK weight.
    Precisely the needed plane passage is supplied by #cite(label("Lis2021")) Lemma 3.1:
    its unoriented loop law converges locally to critical plane $"FK"_4$.
    Fix a finite set of observed medial edges. Bulk annular RSW implies that every plane FK loop meeting this set
    is finite almost surely. For any $epsilon > 0$, choose a box containing all these loops with probability at
    least $1 - epsilon$. The event that the observed loops close inside this box is determined by its finitely
    many pairings. On that event, local convergence transfers their full loop identities,
    and hence their independent fair orientations. Letting the box grow proves convergence of the local arrow law
    to independently oriented plane FK loops.
  On the other hand, the unrestricted six-vertex torus laws have the zero-slope plane limit used in
    #cite(label("SixVertexGFF2026")) Theorem 2.2 and the paragraph following it.
    That paragraph identifies the unrestricted torus limit with the slope-zero law defined through balanced
    cylinders. This is a lattice Gibbs-law fact preceding the GFF argument.
    The two descriptions of the arrow limit agree, and arrows determine unit height differences.
    Additive constants do not affect the gradient law. This proves the lemma. ◻
]

Consequently Theorem 67 supplies exactly the $upright(bold(c)) =
  2$ case of the symmetry input #cite(label("SixVertexGFF2026")) Theorem 4.1.
  Its proof below does not use any GFF limit or any sharp four-arm estimate.

=== 16.1 Even moments retain only macroscopic loops <even-moments-retain-only-macroscopic-loops>

Smooth the discrete contours locally into disjoint Jordan loops. This changes their location by $O \( delta \)$.
  For such a loop $L$ set

$ D_i \( L \) = upright(bold(1))_("int" L) \( u'_i \) - upright(bold(1))_("int" L) \( u_i \) . $

A reference orientation may multiply all the $D_i \( L \)$ by one sign depending on $L$;
  the fair sign absorbs that choice. Let $Pi_(upright("even")) \( k \)$ denote the partitions of ${ 1 \, dots.h \,
  k }$ whose blocks all have even size. Conditional expectation over the signs gives the exact identity

#[#set math.equation(numbering: n => "(16.3)")
 $ P_k \( cal(L) \; bold(u) \) :=
   bb(E)
   [product_i #scale(x: 120%, y: 120%)[\(] h_delta \( u'_i \) - h_delta \( u_i \) #scale(x: 120%, y: 120%)[\)]
   thin mid(bar.v) thin cal(L)] = sum_(pi in Pi_(upright("even")) \( k \)) med sum_(f : pi arrow.r cal(L)\
f med upright("injective")) product_(B in pi) product_(i in B) D_i \( f \( B \) \) . $ <eq:rr-even-polynomial>]

At positive mesh only finitely many loops separate any prescribed pair:
  each such loop crosses a fixed finite lattice path between its endpoints.
  Hence the expansion is a finite identity. In particular, there is no limiting interchange in its derivation.

Call a loop relevant if at least two coordinates of $\( D_1 \( L \) \, dots.h \, D_k \( L \) \)$ are nonzero.
  Every loop in a nonzero summand of (16.3) is relevant. If endpoints belonging to distinct slots are separated by
  $d > 0$, a relevant loop surrounds one endpoint from each of two distinct slots. Therefore

#[#set math.equation(numbering: n => "(16.4)")
 $ "diam" L gt.eq d . $ <eq:rr-macro>]

Here we used that the closure of a Jordan domain is contained in the convex hull of its boundary.
  Also, a separating loop intersects the segment joining the separated endpoints.
  Thus, if the endpoints lie in $B \( 0 \, M \)$, every relevant loop meets that disk.
  For rounded continuum endpoints, replace $d$ by $d - O \( delta \)$.

We record the quantitative estimates needed below. They hold also for the two-angle mixed isoradial lattices in
  the rotation construction. For any fixed choice of the two angles,
  their mesh geometry has bounded distortion and their bulk conditional RSW bounds are available from
  #cite(label("DCKKMO2026Rotation")) Theorem 2.2, Remark 2.3 and Proposition 2.12.

#thm([Lemma 16.3.])[
  (Counts, escape, and deterministic-point avoidance).  #emph[Let $N \( a \, M \)$ be the number of loops of
    diameter at least $a$ meeting $B \( 0 \, M \)$. For $delta$ sufficiently smaller than $a$, and every fixed $p < oo$,
#[#set math.equation(numbering: n => "(16.5)")
 $ parallel N \( a \, M \) parallel_(L^p) lt.eq C_p \( 1 + M \/ a \)^2 . $ <eq:rr-count>]

 There are $C \, gamma > 0$ such that, with harmless fixed changes of the radii,
#[#set math.equation(numbering: n => "(16.6)")
 $ bb(P) { exists L : L ∩ B \( 0 \, M \) eq.not diameter \, L subset.not B \( 0 \, R \) } & lt.eq
   C \( M \/ R \)^gamma \, &  & R gt.eq 10 M \,\
bb(P) { exists L : "diam" L gt.eq a \, "dist" \( z \, L \) lt.eq r } & lt.eq
  C #scale(x: 120%, y: 120%)[\(] \( r + C delta \) \/ a #scale(x: 120%, y: 120%)[\)]^gamma \, &  & 0 < r < a \/
  100 . $ <eq:rr-escape>]

 The constants are independent of the deterministic center $z$.]
] <lem:rr-estimates>

#proof[
  Bulk RSW in a sequence of buffered annuli gives a polynomial bound for an actual primal or dual arm between
    their extreme rims: each annulus has a uniformly positive conditional probability of a blocking circuit of the
    opposite color.
  We also need the standard elementary count consequence of this argument.
    The number of distinct actual clusters of one color crossing a fixed-aspect annulus has a geometric tail.
    Explore complete actual components from the inner rim, revealing their closed exiting edges.
    Remove every explored component, including noncrossing ones, until the next crossing component is found.
    At this stopping time, extend the surviving configuration by closed edges on the deleted graph.
    Its FK law is dominated by the law in the original annulus with all vertices on both original rims wired
    together. Removed bulk components do not wire surviving bulk vertices.
    A dual circuit in a buffered middle annulus of this auxiliary residual configuration blocks another actual
    primal crossing, and has probability bounded below even under the maximal primal boundary condition.
    Repeating the exploration bounds the chance of each additional crossing by a fixed number below one.
    Apply the same argument with the colors exchanged.
  Each loop is the unique exterior contour of its interior-side actual cluster, primal or dual.
    Thus distinct loops give distinct colored clusters. Cover $B \( 0 \, M \)$ by $O \( \( 1 + M \/ a \)^2 \)$
    balls of radius $a \/ 100$. A loop of diameter at least $a$ meeting one of these balls has an interior-side
    bank crossing an annulus about its center whose two radii are fixed multiples of $a$.
    Different global clusters give different actual components in that annulus.
    The preceding geometric tail and Minkowski’s inequality prove (16.5).
  For (16.6), a bank of an escaping loop gives an actual arm from scale $M$ to scale $R$.
    For (16.6), a bank of the indicated loop gives an arm from scale $r +
    C delta$ about $z$ to a fixed fraction of $a$. The polynomial arm bound proves both assertions. ◻
]

Fix a compact $K subset cal(D)_k$, write $d_K > 0$ for its minimum cross-slot endpoint distance,
  and choose $M$ containing every endpoint in $K$. If $k = 2 m$, an even partition has at most $m$ blocks,
  so (16.3) implies

#[#set math.equation(numbering: n => "(16.7)")
 $ \| P_(2 m) \( cal(L) \; bold(u) \) \| lt.eq C_m N \( d_K \/ 2 \, M + 1 \)^m \, wide bold(u) in K \, $ <eq:rr-UI>]

for sufficiently small mesh. All fixed moments of the right-hand side are uniformly bounded by Lemma 69.
  These are bounds for the #emph[sign-averaged polynomial];
  no uniform absolute-moment assertion about a product of pointwise height differences is being made.

Two consequences will be useful. First, removing loops not contained in $B \( 0 \, R \)$ changes the expectation
  of the polynomial by at most $C_K \( M \/ R \)^(gamma \/ 2)$, by (16.6), (16.7), and Cauchy–Schwarz.
  Second, if corresponding endpoints of two tuples in a compact subset of $cal(D)_k$ move by at most $r$,
  evaluate both polynomials in the same loop sample. Off the events in (16.6) at those endpoints,
  every relevant loop has unchanged endpoint indicators. Hence

#[#set math.equation(numbering: n => "(16.8)")
 $ \| Phi_(k \, delta) \( bold(u) \) - Phi_(k \, delta) \( bold(v) \) \| lt.eq
   C_K #scale(x: 120%, y: 120%)[\(] \( r + C delta \) \/ d_K #scale(x: 120%, y: 120%)[\)]^(gamma \/ 2) .
   $ <eq:rr-continuity>]

This estimate is uniform in the absolute location of the tuple.
  It covers within-slot coincidences and changes of the rounding convention.
  The supremum over $K$ is a supremum of deterministic tuple estimates;
  we do not require one avoidance event to hold simultaneously at all points occurring in $K$.

=== 16.2 What the published coupling preserves <what-the-published-coupling-preserves>

Let $bb(L) \( alpha \)$ be the rectangular isoradial lattice in #cite(label("DCKKMO2026Rotation")) Section 1.4;
  $bb(L) \( pi \/ 2 \)$ is a fixed rotation and dilation of the square lattice.
  The next lemma extracts the precise part of its coupling that we use.
  Its assertion is about loop multiplicities, not merely about proximity of loop sets.

#thm([Lemma 16.4.])[
  (Homotopy coupling with dense marked clusters).  #emph[Fix $alpha in \( 0 \, pi \)$.
    As the mesh tends to zero, the construction of #cite(label("DCKKMO2026Rotation")) Section 3.6 gives a coupling
    of two auxiliary loop samples. Their restrictions to a deterministic window exhausting the plane have,
    unconditionally, the respective homogeneous laws on $delta bb(L) \( pi \/ 2 \)$ and $delta bb(L) \( alpha \)$.]
  #emph[Outside an event of probability tending to zero, there are correspondingly indexed,
    pairwise disjoint marked clusters, called nails, whose mesh tends to zero and whose window exhausts the plane.
    Corresponding nails have diameter tending to zero and lie at distance tending to zero from the same grid
    point. There is a bijection $psi$ between all loops surrounding at least two but not all nails in the two
    samples. It preserves their oriented reduced crossing words relative to the nail grid.]
] <lem:rr-nails>

#proof[
  This is the construction preceding the metric conclusion, with its parameters retained.
    In the notation of #cite(label("DCKKMO2026Rotation")) Definition 3.8 and Section 3.6, pp. 49–50, choose $eta =
    N^(- b)$ and $t = N^(- b^2)$, for $b > 0$ sufficiently small.
    On an event of probability $1 - O \( N^(- c) \)$, the selected nail clusters survive the whole
    extrema-resampling and track-exchange chain. The same construction preserves the bijection of non-trivial
    loops and their reduced words at each step. This covers both colors of contour.
  Initially, the nail grid spacing is $t^(1 \/ 2) N$, nail diameters are $O \( t N \)$,
    and the nail window has size comparable to $t^(1 \/ 4) N$.
    The terminal nail positions differ by these errors from their images under $M_(pi \/ 2 \, alpha)$.
    The independent FK argument in #cite(label("DCKKMO2026Rotation")) Section 4.2,
    proof of Theorem 1.7 proves $M_(pi \/ 2 \, alpha) = upright("id")$.
    We may therefore use the already constructed coupling with corresponding nails at the same limiting positions.
  For clarity, these scales can be arranged for every small physical mesh $delta$.
    Set $a = b^2$ and choose $N = 2 floor.l 1 / 2 delta^(- 1 \/ \( 1 - 3 a \/ 8 \)) floor.r$,
    so $N$ is even as required by the track construction. Then the physical grid spacing, nail diameter,
    and nail-window size are respectively of orders
  $ N^(- a \/ 8) \, wide N^(- 5 a \/ 8) \, wide N^(a \/ 8) . $
  The homogeneous observation window has scale $delta N$, which also diverges.
    Center the nail window by translating each endpoint sample by a period vector of its own homogeneous lattice
    nearest the same centering vector. The two chosen translations differ by $O \( delta \)$;
    this only adds a vanishing error to corresponding nail positions.
    The endpoint restrictions have exactly the homogeneous laws,
    by #cite(label("DCKKMO2026Rotation")) Proposition 2.11. After centering,
    both the nail window and the homogeneous observation windows exhaust the plane.
    The probability $O \( N^(- c) \)$ tends to zero. This proves the stated extraction;
    no conclusion about curve-set convergence is used to recover the bijection. ◻
]

Here is the topological information in a crossing word that will matter.
  Orient each loop by the reference convention and let $s_L in { - 1 \,
  1 }$ be its winding number at an interior point. For any two nails,
  join chosen points in them by a path of nail-grid edges, with transverse perturbations if necessary.
  The algebraic intersection number of $L$ with this path equals the difference of its winding numbers at the two
  nail points. It is read from the oriented crossing word. Cyclic permutation and deletion of an adjacent inverse
  pair do not change it. Consequently, if $n \, n'$ and $tilde(n) \, tilde(n)'$ are corresponding nail points,

#[#set math.equation(numbering: n => "(16.9)")
 $ s_L #scale(x: 120%, y: 120%)[\(] upright(bold(1))_("int" L) \( n' \) -
   upright(bold(1))_("int" L) \( n \) #scale(x: 120%, y: 120%)[\)] =
   s_(psi \( L \)) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_("int" psi \( L \)) \( tilde(n)' \) -
   upright(bold(1))_("int" psi \( L \)) \( tilde(n) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:rr-winding-difference>]

We need only these differences. In particular, no inference of an absolute inside set from a finite grid word is
  required.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0.664, 0), radius: (1.013, 1.228), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  content((1.494, 1.245), [#text(fill: rgb("#00008c"))[$L$]])
  circle((-1.037, 0.581), radius: 0.05644, fill: black, stroke: none)
  circle((0.664, 0.581), radius: 0.05644, fill: black, stroke: none)
  content((-1.112, 0.581), [$u_1$], anchor: "east", padding: 0.1176cm)
  content((0.7304, 0.581), [$u'_1$], anchor: "west", padding: 0.1176cm)
  line((-1.037, 0.581), (-0.913, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.664, 0.581), (0.5395, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((-0.913, 0.7055), (-0.8134, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((0.5395, 0.7055), (0.6391, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  circle((-1.037, -0.581), radius: 0.05644, fill: black, stroke: none)
  circle((0.664, -0.581), radius: 0.05644, fill: black, stroke: none)
  content((-1.112, -0.581), [$u_2$], anchor: "east", padding: 0.1176cm)
  content((0.7304, -0.581), [$u'_2$], anchor: "west", padding: 0.1176cm)
  line((-1.037, -0.581), (-0.913, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.664, -0.581), (0.5395, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((-0.913, -0.4565), (-0.8134, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((0.5395, -0.4565), (0.6391, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  content((0.2905, -1.618), [two separated slots])
  line((1.992, 0), (3.403, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.697, 0), [$psi$], anchor: "south", padding: 0.1176cm)
  bezier((4.689, -0.913), (5.727, 1.162), (4.233, -0.083), (4.772, 1.245), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  bezier((5.727, 1.162), (5.602, -1.245), (6.64, 0.996), (6.64, -1.162), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  bezier((5.602, -1.245), (4.689, -0.913), (5.063, -1.411), (4.855, -1.162), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  content((6.474, 1.369), [#text(fill: rgb("#00008c"))[$psi (L)$]])
  circle((3.942, 0.581), radius: 0.05644, fill: black, stroke: none)
  circle((5.644, 0.581), radius: 0.05644, fill: black, stroke: none)
  line((3.942, 0.581), (4.067, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.644, 0.581), (5.519, 0.7055), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((4.067, 0.7055), (4.167, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((5.519, 0.7055), (5.619, 0.8051), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  circle((3.942, -0.581), radius: 0.05644, fill: black, stroke: none)
  circle((5.644, -0.581), radius: 0.05644, fill: black, stroke: none)
  line((3.942, -0.581), (4.067, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.644, -0.581), (5.519, -0.4565), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  rect((4.067, -0.4565), (4.167, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  rect((5.519, -0.4565), (5.619, -0.3569), fill: rgb("#ffffff"), stroke: (paint: rgb("#b20000"), thickness: 0.6pt, miter-limit: 10))
  content((5.27, -1.618), [$D( psi (L))= plus.minus D(L)$])
})],
  caption: [Figure 5: Nearby nails (squares) detect the separations of endpoint pairs (dots). The homotopy bijection preserves oriented winding differences. A single sign change of a loop’s whole separation vector cancels when that loop occurs an even number of times. ],
) <fig:rr-nails>

=== 16.3 Transfer of the correlation polynomial <transfer-of-the-correlation-polynomial>

Fix $alpha in \( 0 \, pi \)$ and compact $K subset cal(D)_k$. Choose $0 < r < d_K \/ 1000$.
  Apply Lemma 70 and, for each endpoint, select an indexed nail close to it.
  For all small enough meshes both corresponding nails lie within $r \/ 2$ of that endpoint.
  Nails selected for endpoints in distinct slots are distinct.
  In both samples discard the event that a loop of diameter at least $d_K \/ 4$ comes within $r$ of an endpoint.
  Lemma 69 bounds the probability of these exceptions by $C_K \( r \/ d_K \)^gamma + o \( 1 \)$,
  uniformly for the individual tuples in $K$.

On the remaining event, a relevant loop $L$ surrounds the nails near one endpoint of each of two distinct slots,
  and excludes a nail near the other endpoint of a separated slot.
  It is therefore non-trivial in the exact sense of Lemma 70, so $psi \( L \)$ is defined.
  For those two slots the winding differences at the corresponding nails are nonzero by (16.9).
  Thus $psi \( L \)$ separates each of the two nail pairs. In particular,
  it encloses one nail from each of two distinct slots, whose distance is at least $d_K - O \( r + delta \)$.
  This proves that $psi \( L \)$ itself has diameter at least $d_K \/ 4$.
  Its endpoint-avoidance event is consequently applicable; smallness of the partner has not been assumed away.

Endpoint indicators and nearby-nail indicators agree for both loops. Equation (16.9) now gives, for #emph[every] slot,

#[#set math.equation(numbering: n => "(16.10)")
 $ D_i \( psi \( L \) \) = s_L / s_(psi \( L \)) D_i \( L \) . $ <eq:rr-signature>]

The inverse bijection gives the same statement starting with a relevant loop in the second sample.
  Hence it is a bijection between all relevant loops, preserving their entire separation vectors up to one sign
  per loop. For a block $B$ in an even partition,

$ product_(i in B) D_i \( psi \( L \) \) = (s_L / s_(psi \( L \)))^(\| B \|) product_(i in B) D_i \( L \) =
  product_(i in B) D_i \( L \) . $

Transporting the injective labels in (16.3) therefore makes the two polynomials #emph[exactly equal] on the good
  event. This uses the actual bijection, so distinct loops are never identified with one another.
  Cauchy–Schwarz and (16.7) bound the expectation error by $C_K \( r \/ d_K \)^(gamma \/ 2) + o \( 1 \)$.

It remains to pass from the auxiliary mixed samples to the intended homogeneous ones.
  Fix $R > 10 M$ and couple their restrictions identically in $B \( 0 \, R \)$ using the local-law assertion of
  Lemma 70; for small enough mesh this disk lies in both homogeneous windows.
  Off the escaping-loop event in either sample, all relevant complete loops are identical.
  Equations (16.6) and (16.7) bound the expectation error by $C_K \( M \/ R \)^(gamma \/ 2)$.
  Let the mesh tend to zero, then $r arrow.b 0$ and $R arrow.t oo$.
  Writing $Phi_(k \, delta)^alpha$ for the fair-signed correlation on $delta bb(L) \( alpha \)$, we obtain

#[#set math.equation(numbering: n => "(16.11)")
 $ lim_(delta arrow.b 0) sup_(bold(u) in K)
   lr(|Phi_(k \, delta)^(pi \/ 2) \( bold(u) \) - Phi_(k \, delta)^alpha \( bold(u) \)|) =
   0 . $ <eq:rr-isoradial-transfer>]

No diameter threshold needs to be a continuity point: all small loops were removed by the even-moment identity itself.

#proof[
  The rectangular model on $bb(L) \( alpha \)$ is invariant under reflection $S_(alpha \/ 2)$ about
    $e^(i alpha \/ 2) bb(R)$ #cite(label("DCKKMO2026Rotation")) Remark 1.8.
    Its fair-sign height correlations inherit that symmetry. If the chosen endpoint rounding is not reflection
    equivariant, the reflected representatives differ by $O \( delta \)$, which is harmless by (16.8).
    Apply (16.11) at the original and reflected tuples. The square model is consequently asymptotically invariant
    under $S_(alpha \/ 2)$, uniformly on every compact subset of $cal(D)_k$.
    Composing with its exact horizontal-reflection symmetry yields invariance under rotation through $alpha$.
    Square symmetries cover the endpoints and the other half of the circle.
    This proves the assertion for each fixed rotation.
  The estimate (16.8) upgrades this to uniformity in the rotation angle.
    Indeed, the orthogonal images of $K$ form a compact subset of $cal(D)_k$,
    and a finite angular net approximates every rotation with endpoint displacement at most $C_K$ times its
    angular mesh. First use convergence at the finitely many net angles, and then let the angular mesh decrease.
    Reflections follow by composition with an exact square symmetry.
    This argument requires no estimate uniform in a degenerating isoradial angle.
  Finally, any translation differs from a period translation of the mesh-$delta$ square lattice by a vector of
    length $O \( delta \)$. Exact period invariance and the location-uniform estimate (16.8) handle this residual
    displacement, uniformly over #emph[all] translation vectors.
    Every plane isometry is a translation followed by an orthogonal map.
    The fixed rotation and dilation identifying $bb(L) \( pi \/ 2 \)$ with $bb(Z)^2$ merely change the mesh
    convention and compact set. These observations prove (16.2) for the original square lattice. ◻
]

=== 16.4 The whole-plane field input <the-whole-plane-field-input>

#thm([Corollary 16.5.])[
  (The endpoint whole-plane field limit).  #emph[The fair unit-jump plane height of critical square-lattice
    $"FK"_4$ converges on neutral smooth compactly supported tests to $sqrt(2 \/ pi)$ times the whole-plane GFF
    with Green kernel $G \( x \, y \) = - \( 2 pi \)^(- 1) log \| x - y \|$. In particular, Proposition 73 holds.]
] <cor:rr-gff-input>

#proof[
  Lemma 68 identifies the discrete gradient law with the isotropic six-vertex law at
    $\( upright(bold(a)) \, upright(bold(b)) \, upright(bold(c)) \) = \( 1 \, 1 \, 2 \)$.
    Theorem 67 gives precisely the compact-$cal(D)_k$, all-isometries symmetry statement used as Theorem 4.1 in
    #cite(label("SixVertexGFF2026")), at this parameter. We may therefore apply its isotropic Theorem 2.8,
    using the remaining spectral, regularity, and free-energy results cited and proved there.
    The passage from correlations to smooth field tests is part of its Section 8.
    No anisotropic extension or general-parameter loop-functional assertion is needed here.
  At $upright(bold(c)) = 2$ one has $Delta = - 1$, so the variance multiplier in that theorem is $2 \/
    arccos \( - 1 \) = 2 \/ pi$. A fixed rotation and dilation of the lattice does not change the neutral
    whole-plane Green quadratic form: the dilation adds a constant to the logarithmic kernel and each test has
    integral zero. For every real $rho in C_c^oo \( bb(R)^2 \)$ with $integral rho = 0$, the convergence therefore gives
  $ bb(E) e^(i chevron.l h_delta \, rho chevron.r) arrow.r exp {- 1 /
    pi integral.double rho \( x \) G \( x \, y \) rho \( y \) thin d x thin d y} . $
  Apply the same assertion to every real linear combination of a finite family of neutral tests to obtain joint
    convergence. This is exactly Proposition 73. ◻
]

== 17 The endpoint field and a four-arm estimate <sec:q4tools>

Throughout this section and the next, $q = 4$ and $p = p_c = 2 \/ 3$.
  We use the critical isotropic square-lattice law, with mesh $delta$. The medial loop weight is $2$.
  Resolve each contact inside a disk of radius less than $delta \/ 100$, preserving the prescribed pairing,
  so that the lattice loops are disjoint simple curves. These resolutions change uniform curve distance by
  $O \( delta \)$ and do not cross an actual open primal or dual edge.
  Orient each strand by the convention that primal vertices lie on its left.
  Independently for each loop, choose with equal probabilities this orientation or its reverse.
  The resulting height has jumps of size one. In the plane it is defined modulo a constant;
  its pairing with a smooth compactly supported density of integral zero is well defined.

We fix the normalization

#[#set math.equation(numbering: n => "(17.1)")
 $ G_(bb(C)) \( x \, y \) = - frac(1, 2 pi) log \| x - y \| \, wide sigma^2 = 2 / pi \, wide lambda_0 =
   sqrt(pi / 8) \, wide 2 sigma lambda_0 = 1 . $ <q4field:normalization>]

Thus $Phi_V$ will denote the Dirichlet free field whose covariance is the Green operator for $- Delta$ on $V$.

#thm([Lemma 17.1.])[
  (Comparison of height conventions).  #emph[Couple the cellwise lattice height $h_delta^(upright("cell"))$ and
    the height $h_delta^(upright("geom"))$ defined by the smoothed loop interiors using the same independent loop
    signs. For every smooth compactly supported neutral density $rho$,
#[#set math.equation(numbering: n => "(17.2)")
 $ bb(E) lr(|chevron.l h_delta^(upright("geom")) - h_delta^(upright("cell")) \, rho chevron.r|)^2 arrow.r
   0 . $ <q4field:height-comparison-L2>]

 This conclusion uses only bulk crossing and passage-count estimates.]
] <q4field:height-comparison>

#proof[
  Decompose $rho$ into a finite linear combination of differences of smooth unit masses.
    For a single such difference, sample its two endpoints independently at each of the two occurrences in the
    second moment. For a loop $L$, let $d_i^(upright("geom")) \( L \)$ and $d_i^(upright("cell")) \( L \)$ be its
    winding-indicator differences for the two height conventions at the $i$-th endpoint pair.
    Averaging the common fair signs gives the mixed second-moment integrand
  $ bb(E) sum_L #scale(x: 120%, y: 120%)[\(] d_1^(upright("geom")) \( L \) -
    d_1^(upright("cell")) \( L \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(]
    d_2^(upright("geom")) \( L \) - d_2^(upright("cell")) \( L \) #scale(x: 120%, y: 120%)[\)] . $
  At a fixed tuple of four distinct endpoints, put $d_(*) > 0$ for their minimum separation, truncated at one.
    A nonzero term requires the same loop to enter an $O \( delta \)$ neighborhood of an endpoint of each pair.
    For small enough $delta$ that loop has diameter at least $d_(*) \/ 2$.
    The bulk one-arm estimate makes such a macroscopic loop’s approach to a mesh-sized endpoint neighborhood
    negligible. Higher passage-count moments give uniform integrability on each fixed size range;
    the arm bound for a loop visiting the bounded support and reaching a large radius removes the remaining tail.
    Thus this integrand tends to zero at every distinct endpoint tuple.
  The octave passage-count bounds also give the integrable majorant
    $C \( 1 + \| log \( d_(*) or delta \) \| \)^2$. Indeed every contributing loop has size at least the endpoint
    separation up to a mesh error, the count has bounded moments per octave,
    and the outer octaves have a power-decaying tail. The same estimate holds for each of the four mixed terms in
    the displayed product. Dominated convergence in the independently sampled endpoints proves (17.2);
    tuples with coincidences have zero integration measure. A finite linear decomposition and Cauchy–Schwarz give
    the assertion for $rho$. ◻
]

#thm([Proposition 17.2.])[
  (Whole-plane height convergence).  #emph[For every real $rho in C_c^oo \( bb(C) \)$ with $integral rho = 0$,
    the independent fair unit-jump height of critical square-lattice $"FK"_4$ satisfies
#[#set math.equation(numbering: n => "(17.3)")
 $ lim_(delta arrow.b 0) bb(E) exp #scale(x: 120%, y: 120%)[\(] i chevron.l h_delta \,
   rho chevron.r #scale(x: 120%, y: 120%)[\)] = exp {- sigma^2 /
   2 integral.double rho \( x \) G_(bb(C)) \( x \, y \) rho \( y \) thin d x thin d y} .
   $ <q4field:plane-characteristic>]

 The same assertion holds jointly for finitely many such tests.]
] <q4field:wholeplane-input>

#proof[
  Corollary 71 gives this statement for the cellwise height.
    Lemma 72 transfers it to the smoothed geometric height, since the difference of the characteristic functions
    is bounded by $bb(E) \| chevron.l h_delta^(upright("geom")) - h_delta^(upright("cell")) \, rho chevron.r \|$.
    Apply the same argument to every real linear combination of finitely many tests to obtain joint convergence. ◻
]

The parameters in #cite(label("SixVertexGFF2026"), form: "prose") Theorem 2.8 and Corollary 3.2 are $c = 2$,
  $Delta = - 1$, and $mu = 0$. The loop factor is then an ordinary cosine,
  exactly the characteristic function of a fair sign multiplying a unit jump.
  The proposition concerns only the whole-plane field; finite-domain and conditional-field statements are proved below.

=== 17.1 Moments and binary transport <moments-and-binary-transport>

We first record why characteristic-function convergence supplies the moments used below.
  This argument uses only the bulk crossing theorem, which includes $q = 4$ #cite(label("DCLM2019Isoradial")),
  and the actual-component counting argument of Section 2.

#thm([Lemma 17.3.])[
  (Neutral moment bounds).  #emph[For finitely many smooth compactly supported neutral densities,
    their height pairings have uniformly bounded moments of every fixed order.
    All their joint moments converge to the corresponding Gaussian moments.
    The bounds and limits are unchanged by the $O \( delta \)$ drawing modifications just described.]
] <q4field:neutral-moments>

#proof[
  It suffices, by linear decomposition, to use differences of two smooth unit masses.
    Expand a product of $m$ such pairings, integrating the two endpoints of each occurrence separately.
    For fixed sampled endpoints $a_i \, b_i$, put
  $ d_i \( L \) = upright(bold(1))_({ a_i in "int" L }) - upright(bold(1))_({ b_i in "int" L }) . $
  Conditional on the loops, averaging the fair signs gives exactly
  #[#set math.equation(numbering: n => "(17.4)")
   $ bb(E)_epsilon.alt product_(i = 1)^m sum_L epsilon.alt_L d_i \( L \) =
     sum_(f : { 1 \, dots.h \, m } arrow.r { upright("loops") }) product_i d_i \( f \( i \) \) product_L
     upright(bold(1))_({ \| f^(- 1) \( L \) \| upright(" is even") }) . $ <q4field:even-assignment>]
  In a nonzero term every used loop separates the endpoints in each slot assigned to it and is used in at least
    two slots. If $d_(*)$ is the smallest distance between the $2 m$ sampled endpoints, truncated at $1$,
    such a loop has diameter at least $d_(*)$. Notice that even repeated copies of the same smeared charge have
    separately sampled endpoints; coincidences have zero integration measure.
  For each endpoint and each size octave, the number of loops of that size which wind around it has moments of
    every order bounded uniformly in the mesh. Indeed such a loop supplies a passage in one of a bounded number of
    buffered annuli of comparable size. Ordering their medial passages produces distinct actual bank components,
    with bounded multiplicity. Successive actual-component exploration and bulk RSW give a geometric tail for this
    count. Between $d_(*)$ and the diameter of the fixed support there are $O \( 1 + \| log d_(*) \| \)$ octaves.
    For larger loops, separation of two support points forces a visit to a fixed bounded slit joining them.
    Reaching the octave of radius $R$ then requires an actual arm from that bounded region to scale $R$,
    whose probability decays as a power of $R$. Cauchy–Schwarz and higher passage-count moments make the sum of
    these outer octaves finite. Consequently the absolute value of the integrand in (17.4), after expectation,
    is bounded by
  $ C_m #scale(x: 120%, y: 120%)[\(] 1 + \| log \( d_(*) or delta \) \| #scale(x: 120%, y: 120%)[\)]^m . $
  The same reasoning bounds any fixed higher absolute moment of the geometric majorant.
    Logarithmic singularities are locally integrable in the independently sampled endpoints.
    This proves uniform integrability of every fixed moment. Proposition 73 and uniform integrability now give
    joint moment convergence.
  If a drawing modification changes a contributing indicator at one of a fixed collection of distinct sampled
    endpoints, a loop of positive diameter enters an $O \( delta \)$ neighborhood of that endpoint.
    The bulk one-arm estimate makes this event negligible; the preceding higher moment bounds allow its removal
    under the integrals. ◻
]

The binary index propagates by equality along every directed strand.
  At a tile, sum the two possible pairings with equal coefficient.
  An inserted matrix acts on this binary index, and a closed loop with ordered insertions $M_1 \, dots.h \,
  M_k$ has conditional response $1 / 2 "tr" \( M_1 dots.h.c M_k \)$. Thus the unperturbed loop weight is $"tr" I = 2$.

#thm([Lemma 17.4.])[
  (The reflected vacuum).  #emph[The plane binary-index network is reflection positive across the translated
    lattice symmetry lines parallel to either axis or to a diagonal.
    Reflection reverses directed transport and takes inserted matrices to their adjoints.
    Simultaneous conjugation by $S U \( 2 \)$ is unitary on the reflected Hilbert space.]
] <q4field:reflection>

#proof[
  For a vertical cut through a primal column, a bisected tile contributes the seam operator
  $ I + \| upright("Bell") chevron.r chevron.l upright("Bell") \| \, wide upright("Bell") = e_1 ⊗ e_1 + e_2 ⊗ e_2 \, $
  which is positive. The horizontal case is identical. A diagonal cut along tile edges contracts equal indices,
    and is positive as well. These statements give a positive Gram form for arbitrary finite network replacements
    strictly on one side of the cut. Each switch intertwines the transports on its reference-directed pairs,
    so simultaneous conjugation preserves all contractions; reflection therefore implements it unitarily.
  One may first use large reflection-periodic tori, with two reflection seams.
    For a diagonal seam take periods along and perpendicular to the diagonal.
    The all-loop torus measure differs from periodic FK by a bounded genus factor.
    A fixed patch is, with probability tending to one, screened by contractible actual circuits of both colors.
    On that event the genus data are exterior to the patch. Bulk uniqueness and the circuit tails identify every
    local subsequential limit with the plane FK state. Equivalently,
    finite closure of all strands meeting the patch gives its plane domain Markov law directly.
    Independent binary indices pass to this limit. The finite-volume positive forms therefore give the asserted
    plane form. ◻
]

=== 17.2 From the spin-two sector to four arms <from-the-spin-two-sector-to-four-arms>

Write $pi_4^delta \( r \, R \)$ for the plane probability of four alternating actual primal and dual arms across a
  square annulus. Fixed changes of its rims change this probability by at most constant factors.
  We use also separated prescribed landing sectors and their buffered extensions,
  at a bounded multiplicative cost. These are bulk statements at $p_c$;
  the published alternating-arm result includes $q = 4$ #cite(label("DM2022Scaling")) Proposition 2.3 and the
  arm-separation discussion. No boundary RSW theorem at $q = 4$ is used.

#thm([Proposition 17.5.])[
  (A bulk four-arm bound).  #emph[There is a constant $C$ such that, for $0 < r < R$,
#[#set math.equation(numbering: n => "(17.5)")
 $ limsup_(delta arrow.b 0) pi_4^delta \( r \, R \) lt.eq C \( r \/ R \)^2 . $ <q4field:four-arm-bound>]

 The same bound, with a constant depending on the fixed bulk collar,
   holds inside a domain with arbitrary exterior boundary data.]
] <q4field:four-arm>

#proof[
  Scale the outer radius to a fixed small constant. Choose mirror boxes of radius $s$ at horizontal distance one,
    centered at $x$ and $y$. In the box at $x$, take a positive unit mass in a disk of radius $epsilon
    s$ at $x + \( s \/ 2 \, 0 \)$ and a negative unit mass near $x - \( s \/ 2 \, 0 \)$;
    use their reflected placement at $y$. Fix smooth mass profiles and connecting slits inside the boxes.
    Their height differences are denoted $h_x \, h_y$.
  For a traceless complex $2 times 2$ matrix $V$, insert $exp \( t a V \)$ along each successive directed flux
    piece, where $a$ is its contribution to this smeared dipole.
    Equivalently, if $rho_x$ is the dipole density, choose a compactly supported one-form $alpha_x$ in its box
    with $d alpha_x = rho_x thin d x and d y$, and integrate $alpha_x$ along the directed pieces.
    Such a form exists because $integral rho_x = 0$. Let $A \( V \)$ be the second-order coefficient as a vector
    in the reflected space. It is an equivariant quadratic map on the complexified conjugation representation of
    $S U \( 2 \)$. Its symmetric square decomposes into a scalar representation and one irreducible spin-two
    representation. Set
  $ E = e_1 e_2^(*) \, wide F = E^(*) \, wide H = "diag" \( 1 \, - 1 \) . $
  The tensor $E ⊗ E$ lies entirely in spin two, whereas the spin-two projection of $H ⊗ H$ is nonzero.
    Unitary equivariance and irreducibility therefore give, with an absolute constant,
  #[#set math.equation(numbering: n => "(17.6)")
   $ parallel A \( E \) parallel^2 lt.eq C ∥A \( H \) - 1 / 2 bb(E) \( h_x^2 \) upright(bold(1))∥^2 = C /
     4 "Cov" \( h_x^2 \, h_y^2 \) . $ <q4field:spin-two>]
  Here $upright(bold(1))$ is the vacuum vector. This does not assert that the entire scalar sector consists of
    multiples of $upright(bold(1))$: projection onto spin two annihilates $upright(bold(1))$,
    which is all the inequality requires. For diagonal $H$, the second coefficient is $h_x^2 \/ 2$,
    giving the last equality with the reflected orientation convention.
  By Lemma 74, the covariance in (17.6) converges to its Gaussian value.
    The covariance of the two neutral charges is $O \( s^2 \)$,
    since the logarithmic kernel is smooth between the boxes and each charge has total mass zero and first
    absolute moment $O \( s \)$. The Gaussian identity $"Cov" \( X^2 \, Y^2 \) = 2 "Cov" \( X \, Y \)^2$ gives
  #[#set math.equation(numbering: n => "(17.7)")
   $ limsup_(delta arrow.b 0) parallel A \( E \) parallel^2 lt.eq C_epsilon s^4 . $ <q4field:spin-upper>]
  We obtain a matching lower bound from two passages at each box.
    For a loop visiting both boxes, compress each maximal run at one box before its next visit to the other into
    one factor. Nilpotence gives alternating factors
  $ I + t a_1 E \, med I + u b_1 F \, med I + t a_2 E \, med I + u b_2 F \, dots.h . $
  Close an excursion by an arc through the omitted other box, where the relevant one-form vanishes.
    The closing arc can be chosen disjoint from the excursion, giving a simple curve.
    Its flux is an averaged winding difference, so $\| a_i \| \, \| b_i \| lt.eq 1$.
    The fluxes are integers if the excursions avoid the endpoint supports.
    Let $M$ be the total number of alternating periods, over all loops visiting both boxes.
    There are $2 M$ disjoint connecting passages. The coefficient $K$ of $t^2
    u^2$ in the product of normalized traces satisfies
  #[#set math.equation(numbering: n => "(17.8)")
   $ \| K \| lt.eq C M^4 \, wide K = 0 quad upright("if ") M < 2 . $ <q4field:coefficient-bound>]
  Loops visiting only one box contribute $1$ and can be omitted.
  If $M = 2$ and the endpoint supports are missed, then $K gt.eq 0$.
    For a single two-period loop its only possible nonzero contribution is $a_1 a_2 b_1 b_2 \/ 2$.
    The full winding difference belongs to ${ - 1 \, 0 \, 1 }$, so nonzero integer fluxes satisfy $a_1 = -
    a_2$ and $b_1 = - b_2$; the coefficient is $1 \/ 2$. For two one-period loops the coefficient is $a_1 b_1 a_2
    b_2 \/ 4$. If nonzero, both simple loops separate the two endpoint pairs.
    Their interiors are disjoint or nested, so their choices of the contained endpoints either agree in both boxes
    or are complementary in both. Hence the products $a_1 b_1$ and $a_2 b_2$ have the same sign,
    and this coefficient is $1 \/ 4$.
  For completeness, the errors in this sign calculation must be #emph[relative] to two four-arm probabilities.
    Let $pi_4 = pi_4^delta \( c_1 s \, c_2 \)$, for fixed suitable constants. Bulk component searches give
  #[#set math.equation(numbering: n => "(17.9)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] M^4 upright(bold(1))_({ M gt.eq 3 }) #scale(x: 120%, y: 120%)[\]] & lt.eq
     o_s \( 1 \) pi_4^2 \,\
bb(P) \( M = 2 \, upright(" an endpoint support is hit") \) & lt.eq C epsilon^alpha pi_4^2 \, $ <q4field:relative-tail>]
  for some $alpha > 0$, with the mesh taken sufficiently small at each fixed $s \, epsilon$.
    Here is the exploration underlying these estimates. Around either box the $2 M$ radial separators,
    cropped with end margins, give $2 M$ alternating bank arms and at least $M$ distinct actual primal crossing
    components of a cropped annulus. Conversely, two distinct actual primal crossing components force two
    intervening dual separators, hence four alternating arms in a slightly narrower annulus.
    Thus the first two successful discoveries already cost $C pi_4$.
    Expose each complete actual component, including all its exiting edges revealed closed,
    and do not count wire identifications as open paths. The remaining graph is dominated by the original annular
    lattice with maximal identifications at its original rims.
    In separated dyadic rings, a buffered dual circuit blocks every actual radial crossing with uniformly positive
    conditional probability. Each further discovered crossing therefore costs at most $C s^alpha$.
    Iterating this bound gives a summable tail even after multiplication by $M^4$.
    The two box annuli have disjoint bulk collars, so their first-four-arm costs multiply up to a constant;
    this proves (17.9). An endpoint hit additionally requires a bank arm from radius $epsilon
    s$ to a fixed small multiple of $s$, in a buffered region inside the hole of its corresponding four-arm
    annulus. Both four-arm costs are retained. The same conditional blocking estimate proves (17.9).
    In particular an absolute $o \( 1 \)$ bound would not suffice in either estimate.
  Finally there is a compatible positive event of probability at least $c pi_4^2$,
    with $c$ independent of sufficiently small $epsilon$. Prescribe primal east/west and dual north/south landings
    at each box annulus, with buffered extensions. Attach the two primal inner landings to small actual circuits
    around the positive and negative endpoint disks, respectively, at radii $eta s$,
    where the small constant $eta > 0$ is fixed before choosing $epsilon lt.double eta$.
    At the large scale join the inward primal arms directly between the boxes,
    and the outward pair around their exterior. Join the upper dual arms to each other and the lower dual arms to
    each other between these routes. At each inner rim join its two dual arms in a central corridor between the
    terminals. Together these dual connections form a closed oval separating the two primal groups.
    Retain one inner-to-outer landing pairing of comparable probability at the first annulus and its mirror at the
    second; the gluing works for either pairing. One of the two pairing classes has at least half the
    separated-arm probability, so no additional theorem concerning a prescribed pairing is needed.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((-1.64, 0), radius: 0.5248, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((-1.64, 0), radius: 0.7462, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((1.64, 0), radius: 0.5248, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((1.64, 0), radius: 0.7462, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-1.353, 0), (1.353, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  merge-path({line((-1.927, 0), (-2.301, 0)); arc((-2.301, 0), start: -0deg, stop: -90deg, radius: 0.2822cm); line((-2.583, -0.2822), (-2.583, -1.358)); arc((-2.583, -1.358), start: 90deg, stop: 0deg, radius: 0.2822cm); line((-2.301, -1.64), (2.301, -1.64)); arc((2.301, -1.64), start: -180deg, stop: -270deg, radius: 0.2822cm); line((2.583, -1.358), (2.583, -0.2822)); arc((2.583, -0.2822), start: -90deg, stop: -180deg, radius: 0.2822cm); line((2.301, 0), (1.927, 0))}, stroke: (thickness: 1.2pt, miter-limit: 10))
  bezier((-1.64, 0), (1.64, 0), (-1.64, 1.271), (1.64, 1.271), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  circle((-1.927, 0), radius: 0.0902, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((-1.353, 0), radius: 0.0902, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((1.353, 0), radius: 0.0902, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((1.927, 0), radius: 0.0902, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((-1.353, 0.2296), [$+$])
  content((1.353, 0.2296), [$+$])
  content((-1.927, 0.2296), [$-$])
  content((1.927, 0.2296), [$-$])
  content((-1.64, -0.246), [$x$])
  content((1.64, -0.246), [$y$])
  content((0, 1.164), [#text(fill: rgb("#0000b2"))[dual oval]])
})],
    caption: [Figure 6: The bulk gluing used in the lower bound. Black connections join the positive terminals and the negative terminals separately; the dual oval keeps these two actual primal clusters distinct. Each terminal is protected by a small primal circuit. Only connectivity is depicted; the four-arm annuli are schematic. ],
  ) <q4field:gluing-figure>
  All these joins can be made in finitely many disjoint tubes of the requested colors,
    outside the core annuli except for their landing extensions.
    Use transverse crossings in overlap rectangles to join the extensions to the tubes.
    Condition on the complement of one color’s tubes and apply FKG and buffered RSW there,
    then do the other color. Since only that color’s extensions enter its tubes,
    the requirements are increasing in the appropriate conditional model.
    The two core annulus probabilities multiply by the bulk collar comparison.
    The resulting positive and negative terminal circuits belong to two distinct actual primal clusters,
    the first connecting the two positive terminals and the second the two negative ones.
  There are at least two distinct closed interfaces separating these two connected primal groups:
    color parity makes their number even, and at least one is necessary.
    Each such interface separates both endpoint pairs and misses their support disks.
    On the part of this event with $M = 2$, the two-loop coefficient is $1 \/ 4$.
    Subtracting (17.9) and (17.9), first choose $epsilon > 0$ small and fixed, and then $s$ small.
    Positivity on all the remaining $M = 2$ configurations and (17.8) show
  $ parallel A \( E \) parallel^2 = bb(E) K gt.eq c' pi_4^2 . $
  Combining this with (17.7) proves $limsup_(delta arrow.b 0) pi_4 lt.eq C s^2$.
    Quasi-multiplicativity and fixed-factor rim changes give (17.5). Bulk collars give its domain version. ◻
]

#thm([Corollary 17.6.])[
  (Macroscopic contacts).  #emph[In any tight subsequential limit of actual loops or Dobrushin strands,
    the interior set of genuinely distinct visits by macroscopic curves has Hausdorff dimension at most zero,
    almost surely. Constant parametrization pauses are discarded. No assertion about boundary contacts is made here.]
] <q4field:contact-dimension>

#proof[
  Fix an interior compact set and an outer displacement cutoff $R > 0$.
    A point with two genuinely distinct visits, each having displacement at least $R$,
    gives four medial passages across every sufficiently small surrounding annulus.
    With rim margins, their actual banks give four alternating arms.
    A grid cover at scale $r$ has $O \( r^(- 2) \)$ cells, each with limiting probability at most
    $C \( r \/ R \)^2$. Its expected number of required cells is therefore bounded uniformly in $r$,
    after the mesh limit. For every $eta > 0$ the expected $eta$-dimensional covering content is $O \( r^eta \)$;
    along dyadic scales it tends to zero almost surely. Countable compact sets, displacement cutoffs,
    and positive $eta$ prove the claim. ◻
]

== 18 The field in regular domains <sec:q4regular>

We now derive the finite-domain statement required for the loop identification. It is not part of Proposition 73.

=== 18.1 Actual walls and elementary bounds <actual-walls-and-elementary-bounds>

Write $C in { sans(P) \, sans(D) }$ for a color and $C'$ for the other.
  An actual homogeneous wall is a simple polygon of $C$-diagonals, whose switches are forced open in color $C$.
  A mixed wall consists of an actual primal-diagonal arc, an actual dual-diagonal arc,
  and two tile sides joining their ends. Each tile side is a one-port transition gate.
  All interior switches not on a wall are sampled, including a switch whose diagonal endpoints happen both to lie
  on the wall.

#thm([Lemma 18.1.])[
  (Vacuum realization of a wall).  #emph[Conditioning the plane vacuum on exactly the stated wall switches gives
    the FK law inside with the indicated actual connections. For a closed $C$-wall,
    the $C'$ model on the strictly internal sites and its internal edges has free boundary condition.
    In a mixed wall, fixing the binary index at one transition port fixes the index of the distinguished strand;
    this condition has probability $1 \/ 2$ conditional on every switch configuration.]
] <q4field:wall-law>

#proof[
  An exterior connection of either color can enter only through the same-color wall arc,
    already connected by actual open edges. Hence it creates no additional interior partition.
    For a closed wall no $C'$ vertex is wired through that wall, giving the stated free model (equivalently,
    apply planar duality). There are exactly two transition ports in the mixed experiment.
    The loop through one must leave the interior through the other;
    its one independent fair index is fixed by the condition at the first port. ◻
]

Set the height to zero on a homogeneous wall. In a mixed wall,
  take height zero on its primal arc and choose the distinguished index so that its dual arc has height one.
  Conditional on the geometry,

#[#set math.equation(numbering: n => "(18.1)")
 $ h_delta \( z \) = u_(* \, delta) \( z \) + sum_(L upright(" internal")) epsilon.alt_L
   upright(bold(1))_({ z in "int" L }) \, $ <q4field:domain-height>]

where the signs are independent and fair. In the homogeneous case $u_(* \, delta) = 0$;
  in the mixed case it is the $0 \/ 1$ side function of the distinguished strand.
  Values on the drawn curves are immaterial in integrals. For $f in C_c^oo$ in the interior,
  the pairing $chevron.l h_delta \, - Delta f chevron.r$ depends only on switches and binary indices near the
  support of $f$: integration by parts writes it as oriented flux against a compactly supported smooth one-form.
  It consequently does not depend on the relative height constant.

#thm([Lemma 18.2.])[
  (Free-bank estimates).  #emph[Consider a patch in which the bank color $C'$ has no forced open edge and no
    boundary identification on any domain wall meeting the patch. The graph may omit sites or edges.
    Counts of disjoint medial passages between buffered annular rims have moments of every order,
    uniformly in the mesh and in the remaining exterior data.
    The probability of an actual $C'$ arm across a ratio $R \/
    r$ is at most $C_0 \( r \/ R \)^beta$ for some $beta > 0$.
    These statements hold as well for a product of free $C'$ models on disjoint subgraphs.
    In a bulk patch either color may be used.]
] <q4field:free-bank>

#proof[
  Order the medial radial separators and crop their actual $C'$ bank paths with margins at both ends.
    Different strips cannot communicate across a separator, and each strip is charged at most twice.
    Thus many passages force a proportional number of distinct actual crossing components of the cropped graph.
    Reveal these components successively from one rim, ignoring partition jumps.
    A deleted component does not wire surviving interior sites through its former neighbors.
    Since the wall is free for this color, the remaining graph is dominated by the full annular lattice with
    maximal ties only at its original rims. A buffered circuit of the other color blocks actual crossing,
    with conditional probability bounded below by bulk RSW. Iteration gives a geometric tail for the component
    count and hence all its polynomial moments. Applying these blockers in separated dyadic rings proves the power
    bound for one arm. Missing edges or sites only lower actual connectivity;
    the same comparison applies to a product on disjoint subgraphs.
    Enlarge inner radii by a fixed mesh multiple whenever needed. ◻
]

Take now a fixed simple rectilinear polygon $V$, with two distinct marked transition points on interiors of
  straight sides in the mixed case. Approximate it by the corresponding actual diagonal walls within
  $O \( delta \)$, in marked boundary order. Such approximations exist:
  round each color arc on its own lattice and adjust its ends by $O \( delta \)$ to join the two colors by a
  single tile side at each transition. This class of regular domains will suffice for the later comparison argument.

#thm([Lemma 18.3.])[
  (Moment kernels and compactness).  #emph[For the regular polygons just specified,
    the height moment kernels at distinct interior points $z_1 \, dots.h \, z_m$ satisfy
#[#set math.equation(numbering: n => "(18.2)")
 $ lr(|bb(E) product_(i = 1)^m h_delta \( z_i \)|) lt.eq C_m #scale(x: 120%, y: 120%)[\(] 1 + \|
   log \( d_(*) or delta \) \| #scale(x: 120%, y: 120%)[\)]^m \, wide d_(*) = 1 and min_(i < j) \| z_i - z_j \| \,
   $ <q4field:log-kernel>]

 with $d_(*) = 1$ when $m = 1$. Here $C_m$ depends on $V$ and $m$, uniformly over the interior tuples,
   including those approaching the boundary. Geometric majorants for the conditional signed expansions have higher
   polynomial moments with corresponding logarithmic bounds.
   Integrated moments are uniformly integrable; the height laws are tight as local distributions,
   and their moment kernels are asymptotically equicontinuous on compact sets of distinct interior tuples.
   The count bounds hold also for arbitrarily shaped homogeneous walls in a fixed bounded box and for products of
   disks of one wall color.]
] <q4field:moment-kernels>

#proof[
  A loop winding around $z$ and of diameter in $\[ r \, 2 r \]$ lies within $O \( r \)$ of $z$ and supplies a
    macroscopic passage in one of a bounded number of annuli of radius comparable with $r$.
    For a homogeneous wall use its free bank color. In a fixed mixed polygon,
    choose a subpassage away from the transition points by a fixed fraction of $r$.
    The two wall arcs separate linearly away from a transition,
    so the chosen patch avoids one of them and has a free bank color. Lemma 79 gives bounded moments per octave.
    At mesh scale a deterministic local bound suffices. The same free bank argument works for arbitrary
    homogeneous wall shapes and for the stated products.
  Expand (18.1) and average the signs. A loop which survives must be assigned to at least two of the distinct
    points and therefore has diameter at least $d_(*)$. The remaining offset factors have absolute value at most
    one. Minkowski’s inequality over $O \( 1 + \| log \( d_(*) or delta \) \| \)$ octaves gives (18.2) and the
    asserted higher moment majorants. Integrating the logarithmic singularities gives uniform integrability.
    Uniform second moments for compactly supported Fourier tests give tightness in a sufficiently weak local
    negative Sobolev space, hence tightness as distributions.
  To move one point a small distance while the tuple stays distinct,
    any changed contributing loop indicator must belong to a loop of diameter bounded below which approaches that
    point. In the mixed case a changed offset requires the distinguished strand to approach it.
    The bulk one-arm estimate makes these events uniformly rare;
    the higher count moments control their contribution. This proves equicontinuity,
    allowing the $O \( delta \)$ ambiguity of the drawing. The same annular passage counts give tight macroscopic
    curve counts and tightness modulo reparametrization by the displacement-arc subdivision argument of Section 15. ◻
]

=== 18.2 Neutral tests through a conditioned wall <neutral-tests-through-a-conditioned-wall>

#thm([Theorem 18.4.])[
  (The regular-domain field).  #emph[Let $V$ be a fixed polygon and let its actual wall approximations be as above. Then
#[#set math.equation(numbering: n => "(18.3)")
 $ h_delta med arrow.r.double med u + sigma Phi_V wide upright("as distributions in ") V \, $ <q4field:Q>]

 where $u = 0$ for a homogeneous wall and $u$ is the harmonic extension of the boundary values $0 \,
   1$ for a mixed wall. All joint integrated moments converge.
   At every tuple of distinct fixed interior positions, the moment kernels converge to those of the same field.]
] <q4field:regular-domain>

The proof has three parts. First we transfer local Laplacian tests through separated pieces of wall.
  Next we close the gaps between those pieces. Finally we determine the harmonic ambiguity left by the Laplacian tests.

#thm([Lemma 18.5.])[
  (Analytic displacement across a vacant slab).  #emph[Consider two groups of vacuum insertions supported in
    finitely many pairwise separated rectangles, with a vacant projection slab between the two groups.
    Its normal is parallel to a lattice axis or a diagonal. Normalize each wall constraint by the probability of
    its isolated switch constraints; allow bounded charge and index factors.
    Translate one whole group farther across the slab. Every subsequential continuum correlation is real analytic
    in the translation distance on a neighborhood of $\[ 0 \, oo \)$.
    This assertion also holds with other, previously fixed translations.]
] <q4field:analytic-displacement>

#proof[
  First note the needed uniform norm bound. For a wall factor let $W_j$ denote its switch constraints only,
    and let $p_j$ be their isolated vacuum probability. Allowed lattice translations and reflections preserve
    $p_j$ exactly. The arbitrary-event comparison across vacant bulk collars gives
  #[#set math.equation(numbering: n => "(18.4)")
   $ c lt.eq bb(E) product_j upright(bold(1))_(W_j) / p_j lt.eq C . $ <q4field:normalized-wall>]
  The constants may depend on the fixed gaps and rectangles.
    A single marked-port projection contributes exactly $1 \/
    2$ to the expectation of the positive wall constraints. Bounded charge or index factors can be omitted in
    absolute value. The same upper bound applies to separated subfamilies, their lattice translates,
    and their reflected copies. In particular the reflected norms needed below are bounded uniformly in the mesh.
    No lower bound on an individual, possibly very rare, wall probability $p_j$ is asserted.
  On the algebraic reflected space let $S_delta$ translate an insertion deeper into the half-plane by an
    admissible lattice period in the normal direction. Reflection and translation invariance make this operator
    symmetric. Cauchy–Schwarz gives
  $ parallel S_delta^n v parallel^2 lt.eq parallel v parallel thin parallel S_delta^(2 n) v parallel . $
  At fixed mesh every finite insertion is bounded, including its normalizing constants,
    so the norms on the right are bounded as the displacement varies.
    Iterating this inequality proves $parallel S_delta^n v parallel lt.eq parallel v parallel$.
    It also shows that null vectors remain null. Thus $S_delta$ extends to a self-adjoint contraction on the
    reflected Hilbert space. Use $T_delta = S_delta^2$ to obtain a positive self-adjoint contraction.
    Write $p_delta = O \( delta \)$ for its physical translation step.
  Reserve a small fixed part of the vacant slab. After absorbing the rest into the positions of the two base
    vectors, the correlations have the spectral interpolation
  #[#set math.equation(numbering: n => "(18.5)")
   $ F_delta \( z \) = ⟨a_delta \, T_delta^(N_delta + z \/ p_delta) b_delta⟩ \, wide N_delta p_delta arrow.r
     a > 0 . $ <q4field:spectral-interpolation>]
  The vector norms are bounded by (18.4). Spectral calculus therefore makes these a bounded holomorphic family on
    every closed half-plane strictly inside $"Re" z > - a$. A bounded integer rounding of the exponent changes a
    correlation by $o \( 1 \)$ locally there: for $n$ of order $delta^(- 1)$ and bounded real $theta$,
  $ sup_(0 lt.eq t lt.eq 1) \| t^(n + theta) - t^n \| = O \( n^(- 1) \) . $
  Thus rounding a physical shift by a bounded number of admissible normal translation periods gives the same
    limit. Take a diagonal subsequence on a countable array of rational shifts and apply normal-family compactness
    to (18.5). Every resulting limit is holomorphic on a neighborhood of the entire nonnegative real ray,
    including zero. The assertion for one cut only uses the other translations as fixed parameters. ◻
]

#thm([Lemma 18.6.])[
  (Removal of a local neutral factor).  #emph[Let finitely many cells of one finite rectangular grid,
    separated by positive-width grid gaps, contain normalized wall factors, bounded index factors,
    and charge factors. Let one cell contain only
$ X_delta \( f \) = exp #scale(x: 120%, y: 120%)[\(] i chevron.l h_delta \, -
  Delta f chevron.r #scale(x: 120%, y: 120%)[\)] \, wide f in C_c^oo \( upright("cell") \; bb(R) \) . $

 In the expectation of the product, this factor may be replaced with error $o \( 1 \)$ by
#[#set math.equation(numbering: n => "(18.6)")
 $ mu \( f \) = exp (- sigma^2 / 2 integral \| nabla f \|^2) . $ <q4field:neutral-mean>]

 The geometry and all gaps are fixed before $delta arrow.b 0$.]
] <q4field:neutral-removal>

#proof[
  Put $Y_delta = X_delta \( f \) - mu \( f \)$. If an allowed reflection line separates this cell from all the
    others with a strict projection margin, reflection Cauchy–Schwarz proves the claim immediately.
    Indeed the squared norm of $Y_delta$ tends to zero: the two reflected Laplacian tests have disjoint supports
    and their whole-plane Gaussian covariance is
  $ sigma^2 integral nabla f dot.op nabla \( f compose theta \) = 0 . $
  Proposition 73 consequently factors their characteristic functions.
    Reflection conjugations and orientation signs do not change this conclusion.
    The other reflected vector has bounded norm by (18.4).
  For general cell placements choose the original cells from a finite rectangular grid with positive gaps,
    and call the row and column of $Y_delta$ its central row and column.
    The following finite displacement procedure creates the required separating line.
  + Translate all rows above the central row upward, and all rows below it downward, each as a single group.
  + Translate the columns to the right of the central column rightward, and those to the left leftward,
    by amounts larger than the preceding vertical spread.
  + The central cell is now isolated in its $x + y$ projection.
    Partition all other cells into the groups with larger and smaller $x + y$ projections.
    Move these groups far in the directions $\( 1 \, 1 \)$ and $\( - 1 \, - 1 \)$, respectively,
    until the former are above and to the right of all remaining cells and the latter below and to their left.
  + Move the upper group farther right and the lower group farther downward.
    All other cells then have larger $x - y$ projection than the central cell.
  Each movement begins with a vacant projection slab and increases its width.
    Individual rectangular collars stay vacant: each translated group moves rigidly,
    and the two groups at a cut only become farther apart. Each named directional movement is a separate
    one-parameter translation. Empty groups need no movement.
    The amounts are chosen successively sufficiently large, with each threshold allowed to depend on all earlier
    choices.
  In the final configuration a diagonal reflection line separates $Y_delta$,
    so every limiting correlation is zero. Apply Lemma 82 to the last displacement.
    Analytic uniqueness extends the zero correlation from all sufficiently large values to zero.
    Continue in reverse order. At each stage the earlier parameters are still sufficiently large for the relevant
    vacant slab, and the later ones have been returned to zero.
    A countable set of rational choices suffices for a common subsequence.
    The triangular dependence of the thresholds therefore causes no loss of parameters.
    Eventually the correlation at the original placements is zero.
    Every subsequence has the same conclusion, proving the $o \( 1 \)$ assertion. ◻
]

We apply this lemma by cutting small positive-width gaps in the wall.
  Fix a tuple of interior positions and group its coincident positions.
  Choose a finite horizontal and vertical grid so that every group lies alone in an interior cell with strict
  margins. The grid lines miss all corners and transitions, and meet the relevant wall sides transversely.
  Remove the wall constraints in a thin strip at each such line.
  The remaining wall pieces have separated rectangular supports.
  The one marked-port projection, if present, belongs to one of those wall cells.
  In each interior cell combine all tests assigned to its group into one exponential.
  Formula (18.4) bounds the normalizing expectation away from zero and infinity for this fixed gapped geometry.
  Successively applying Lemma 83 identifies the joint Laplacian-test law under this gapped conditioning.

#thm([Lemma 18.7.])[
  (Closing homogeneous wall gaps).  #emph[For fixed interior charge supports and, when present, a marked port,
    the local normalized charge laws with gapped and complete walls become arbitrarily close as follows:
    first take the mesh limit at fixed positive gap widths, and then let those widths tend to zero.]
] <q4field:close-gaps>

#proof[
  Consider one gap of width $eta$ at a homogeneous wall point.
    The switches still to be fixed lie in a ball of radius $O \( eta \)$,
    and are to be open in the wall color $C$. First omit the marked-index condition.
    In the opposite color $C'$, the gapped model is the larger of the two models.
    Couple by exploring all actual $C'$ components incident to the fixing edges in this larger sample,
    starting from both endpoints and revealing also all exiting edges.
    Use the ordered FK conditional probabilities for common queried edges.
    Explore actual open edges only, without following boundary partition identifications.
  The only differing fixed data lie on the fixing edges. On the event that the discovered components stay inside a
    fixed small homogeneous neighborhood, their outside edges are closed in both samples.
    This screens the changes, so the unqueried graphs have identical induced laws and may be sampled identically.
    This is also a direct whole-plane exploration with only specified edge states;
    it requires no boundary wire jump. The probability that the exploration leaves the neighborhood is at most
    $C \( eta \/ R \)^beta$ by Lemma 79, where $R > 0$ is its fixed radius.
  Every discrepant switch is open for $C'$ in the larger sample,
    so both its $C'$ vertices belong to the discovered components.
    A loop or strand touching a discrepancy in either model has its actual $C'$ bank in those components.
    On the screening event it therefore cannot reach any charge support or the marked port,
    all outside the neighborhood. All remote loops and their binary indices can be matched exactly.
    Restoring the marked-index condition changes the exceptional probability by at most a factor two,
    since its conditional probability is exactly $1 \/ 2$. Repeat at the finitely many gaps and let their widths
    tend to zero after the mesh limit. ◻
]

=== 18.3 Identification of the harmonic part <identification-of-the-harmonic-part>

#proof[
  Take a subsequential distributional limit $h$, using Lemma 80.
    The preceding gap construction, Lemmas 83 and 84 show that,
    in a neighborhood of every tuple of interior positions, the joint Laplacian tests have the Gaussian law with
    covariance
  #[#set math.equation(numbering: n => "(18.7)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] L \( f \) L \( g \) #scale(x: 120%, y: 120%)[\]] =
     sigma^2 integral_V nabla f dot.op nabla g \, wide L \( f \) = chevron.l h \, -
     Delta f chevron.r . $ <q4field:laplacian-covariance>]
  For coincident positions all the tests are combined in their single vacant cell before applying the
    characteristic-function argument. This detail includes the diagonals of $V^m$ for every $m$.
  More explicitly, the integrated moment bounds give moment distributions of every order for $h$,
    and hence for its Laplacian. On product neighborhoods of every position tuple they coincide with the Gaussian
    moment distributions just computed. Tensor test functions, partitions of unity,
    and their density in smooth compactly supported tests show equality on all of $V^m$.
    This excludes any unseen distribution supported on a coincidence diagonal.
    Every linear combination of finitely many $L \( f \)$ has the Gaussian moments;
    Gaussian moment determinacy identifies its law. Thus $L$ is a centered Gaussian isonormal field on
    $C_c^oo \( V \)$ with (18.7).
  Extend $L$ by mean-square density to $H_0^1 \( V \)$. For a smooth compactly supported density $g$,
    let $v_g in H_0^1 \( V \)$ solve $- Delta v_g = g$ weakly, and set
  $ h^0 \( g \) = L \( v_g \) . $
  Then $h^0$ has the law of $sigma Phi_V$. For $f in C_c^oo \( V \)$, $v_(- Delta f) = f$, so $chevron.l h -
    h^0 \, - Delta f chevron.r = 0$. Consequently
  #[#set math.equation(numbering: n => "(18.8)")
   $ H = h - h^0 - u $ <q4field:harmonic-ambiguity>]
  is distributionally harmonic, and therefore represented almost surely by a smooth harmonic function.
    No independence between $H$ and $h^0$ has been assumed or is needed.
  It remains to show that $H = 0$. We use moment kernels, not pointwise values of the limiting random
    distribution. Let $x \, y$ approach distinct boundary points which are neither corners nor transitions.
    The uncentered second kernel of $h - u$ tends to zero. To see this before passing to the limit, use (18.1).
    In the mixed case the wrong $0 \/ 1$ side at a point near its prescribed wall requires the marked strand to
    cross a short segment from that point to the wall. It must then leave a fixed local patch,
    since both marked ports are elsewhere. Likewise, a loop containing both $x$ and $y$ has diameter bounded
    below; a segment from $x$ to the nearby wall must cross it,
    so the loop approaches that wall point while leaving the patch.
    The free bank one-arm estimate makes both events rare. The uniform higher count moments in Lemma 80 absorb
    their contributions. Finally the deterministic harmonic function $u$ tends to the prescribed boundary value.
    The homogeneous case has no marked term and is the same argument. Thus
  #[#set math.equation(numbering: n => "(18.9)")
   $ K_(h - u) \( x \, y \) arrow.r 0 quad upright("at distinct ordinary boundary points") .
     $ <q4field:boundary-kernel>]
  Kernel convergence and equicontinuity on interior compact sets justify taking the mesh limit before this
    boundary limit.
  Let $psi : bb(D) arrow.r V$ be conformal. Polygon corner behavior implies that $psi$ and its inverse extend
    Hölder continuously to the boundary. In particular, for some $a \, C > 0$,
  $ \| psi \( z \) - psi \( w \) \| gt.eq C^(- 1) \| z - w \|^a . $
  If $r \, s gt.eq 1 \/ 2$, then $\| r e^(i theta) - s e^(i phi) \| gt.eq c \| e^(i theta) - e^(i phi) \|$.
    The logarithmic second-kernel bound consequently gives an integrable majorant
  #[#set math.equation(numbering: n => "(18.10)")
   $ C (1 + \| log \| e^(i theta) - e^(i phi) \| #scale(x: 120%, y: 120%)[\|])^2 $ <q4field:angular-majorant>]
  uniformly over radii approaching one. The same type of bound holds for the Dirichlet Green kernel,
    whose value tends to zero at two distinct boundary points.
  Choose nonnegative smooth functions $rho_t$ of integral one,
    each supported on a compact radial interval in $\( 0 \, 1 \)$ whose two endpoints tend to one.
    For every integer $n$, consider the smooth distribution test which, for an ordinary function $v$, is
  $ B_(n \, t) \( v \) = integral_0^1 rho_t \( r \) frac(1, 2 pi) integral_0^(2 pi)
    v \( psi \( r e^(i theta) \) \) e^(- i n theta) thin d theta thin d r . $
  For distributions this is the pullback test; its density in $V$ includes the conformal change-of-variables
    Jacobian. It is smooth and compactly supported for each fixed $t$.
    Equations (18.9) and (18.10), followed by dominated convergence in the two independent angles and radii, give
  $ B_(n \, t) \( h - u \) arrow.r 0 quad upright("in ") L^2 . $
  The Dirichlet kernel gives the same conclusion for $B_(n \, t) \( h^0 \)$.
    Hence $B_(n \, t) \( H \) arrow.r 0$ in $L^2$.
  The harmonic function $H compose psi$ has Fourier expansion with $n$-th circle coefficient $c_n r^(\| n \|)$.
    Therefore
  $ B_(n \, t) \( H \) = c_n integral_0^1 rho_t \( r \) r^(\| n \|) thin d r arrow.r c_n . $
  All coefficients, including $c_0$, vanish almost surely. Thus $H = 0$,
    and (18.3) follows for every subsequential limit. Uniform integrability gives convergence of all integrated
    moments. The equicontinuity of the kernels at distinct interior tuples then upgrades their distributional
    convergence to pointwise convergence there, proving the last assertion of the theorem. ◻
]

== 19 The endpoint in rough domains <sec:q4rough>

We work at $q = 4$ throughout this section. We use the whole-plane height convergence of Proposition 73 and its
  regular-domain form, Theorem 81. Write

$ sigma^2 = 2 / pi \, wide lambda_0 = sqrt(pi / 8) \, wide sigma lambda_0 = 1 / 2 . $

The normalization of the Dirichlet Gaussian free field is $G_D = \( - Delta_D \)^(- 1)$,
  so its Green function has singularity $\( 2 pi \)^(- 1) log \( 1 \/ \| z - w \| \)$.
  A signed height has an independent fair unit jump across each closed contour.
  Its offset is specified separately. Our purpose is to identify the conditional field in domains cut out by the
  contours themselves. Their boundaries need not be Jordan curves at this stage.

=== 19.1 Pockets and their conditional laws <pockets-and-their-conditional-laws>

A #emph[wall of color $C$] means an actual connected open wall of that color,
  rather than an identification of separated vertices. Denote the other color by $C'$.
  All the following discrete drawings may be separated within a distance $O \( delta \)$,
  where $delta$ is the mesh, so that their contours are simple and have the prescribed traversal order.

#thm([Lemma 19.1.])[
  (Exterior-readable pockets).  #emph[In a homogeneous $C$-wall disk,
    each outer contour is the external perimeter of an outermost actual $C'$-cluster.
    Behind it lie pockets bounded by the maximal simple $C'$-open cycles, ordered by inclusion of their interiors.
    Their interiors are disjoint; several pockets can belong to one outer contour.
    The contours, these cycles, their assignment to contours,
    and all switches outside the pocket interiors can be determined without querying strictly interior switches.
    Conditional on these data, the pocket interiors have independent homogeneous $C'$-wall laws.]
  #emph[In a two-arc disk, first reveal the distinguished path.
    On either side, its bank together with that side’s wall arc determines analogous maximal-cycle pockets of the
    wall color. Conditional on the path and the exterior pocket data,
    all these pockets have independent homogeneous laws. A point wound by a containing contour or side closure,
    and farther than $O \( delta \)$ from its bank walk, lies in one of the corresponding pockets.
    Every further contour winding that point is contained in that pocket.]
] <q4pocket:discrete-pockets>

#proof[
  Draw each cluster as a small regular neighborhood of its actual graph.
    Its boundary follows the paired medial pieces within $O \( delta \)$.
    Every perimeter behind its external perimeter lies in a bounded face of that graph.
    Such a face is enclosed by a simple cycle. Equivalently, the bank of the external perimeter is a closed graph
    walk; decomposing this walk into simple cycles shows that every wound point with the specified clearance
    belongs to a maximal cycle interior.
  Two maximal cycle interiors cannot overlap without one containing the other.
    Otherwise their boundaries meet at two or more vertices, their union is contained in one biconnected block,
    and the simple outer boundary of that block encloses both. This contradicts maximality.
    Shared vertices or edges cause no difficulty, since the open interiors remain disjoint.
  We justify the assertion about revealing information. Fix a possible list of cycles and expose its wall edges
    and everything outside its open disks. Any connection between vertices of one cycle that uses its interior
    already has a connection along that cycle. More strongly,
    adding arbitrary interior edges cannot join two distinct exterior biconnected blocks.
    After removal of an exterior cut vertex, the attachments belonging to any one wall cycle remain connected
    along the rest of that cycle. Thus an interior addition cannot repair an exterior cut vertex.
    The exterior block containing a maximal cycle already has all its vertices in that cycle’s closed disk:
    otherwise the simple external boundary of the block would be a larger cycle.
    A new cycle that both enters and leaves a listed disk would have two distinct wall attachments and would
    consequently belong to its wall block. It cannot enlarge that block outside the disk.
    The same argument applies if several listed disks are traversed,
    since they would then have to belong to the same exterior block.
    Nor can internal changes alter an external cluster perimeter.
    Consequently the event specifying the proposed list and its exterior is measurable from the revealed edges.
    Each wall is actually connected, so the domain Markov property gives the asserted product of homogeneous laws.
  For the marked path, close each side using its wall arc and the appropriate half-sides of the terminal gates.
    The same-color bank and wall form a closed walk of actual open edges.
    The path lies outside every cycle made from this walk, so its exploration queries no switch strictly inside
    such a cycle. The preceding argument therefore applies on both sides.
    Finally, a further contour leaving a pocket and winding a point inside it would have to surround its wall
    cycle. This is impossible because that cycle belongs to an actual cluster connected to the original wall. ◻
]

For a family $cal(D)$ of disjoint homogeneous disks, let $H_(cal(D))$ be the signed height with zero offset and
  independent laws in the disks. Its value at a point refers to the disk containing that point.

#thm([Lemma 19.2.])[
  (Comparison of zero-offset moments).  #emph[Let $cal(D)_(-)$ and $cal(D)_(+)$ be two families of homogeneous
    discrete disks of the same wall color. Suppose that each disk of $cal(D)_(-)$ is contained in a disk of
    $cal(D)_(+)$. Assume all disks lie in a fixed bounded region.
    For distinct points $z_1 \, dots.h \, z_m$ in the smaller interiors,
#[#set math.equation(numbering: n => "(19.1)")
 $ bb(E) product_(j = 1)^m H_(cal(D)_(-)) \( z_j \) med lt.eq med
   bb(E) product_(j = 1)^m H_(cal(D)_(+)) \( z_j \) + o \( 1 \) . $ <q4pocket:moment-order>]

 The error tends to zero with the mesh, uniformly when the points have fixed positive pairwise separation.
   The statement compares moments, not signed heights in an ordered coupling.]
] <q4pocket:moment-comparison>

#proof[
  On graphs of the opposite color, the smaller laws are independent free random-cluster laws.
    Their product is stochastically dominated by the restriction of the larger laws:
    reveal the remaining edges and use the induced boundary partitions, which dominate free boundary conditions.
    Couple these opposite-color configurations by inclusion.
  Consider a smaller outer contour that is relevant to the test points.
    Its cluster is included in a larger-model cluster, but the latter may itself be surrounded by a different
    cluster. Select the #emph[outermost larger contour containing the filled hull] of the smaller cluster.
    One must make this selection even when the two clusters do not merge.
    Using nested regular neighborhoods of included graphs, or the cycle decomposition in Lemma 85,
    shows that this selected contour contains all the wound test points with clearance.
    Every relevant smaller maximal cycle lies in a maximal cycle behind the selected larger contour.
    In the surrounding case, the smaller cycle lies in a bounded face of the outer cluster and is therefore
    enclosed by one of its maximal cycles.
  Retain only the two sets of exterior and pocket data from this coupling.
    Now resample their interiors using the conditional laws of Lemma 85.
    Their wall color has reversed, so the same free opposite-color comparison applies at the next stage. Iterate.
    This is a sequence of couplings of conditional marginals;
    it does not claim monotonicity of nesting depth in the original edgewise coupling.
    At every fixed number of stages it gives inclusion at the same numerical nesting levels.
    A smaller contour’s group of test points can merge with another such group, but cannot split.
    There is no extra contour of that level between a selected outer contour and a pocket behind it:
    the pocket wall is part of that very contour’s cluster.
  To translate this construction into moments, expand each height as the sum of signs of its surrounding contours
    and average the signs. A term survives exactly when every assigned contour receives an even number of the
    indices $1 \, dots.h \, m$. Encode that term by the vector of nesting levels $\( ell_1 \, dots.h \, ell_m \)$
    assigned at the respective points. The same vector is admissible in the larger model:
    mergers add even multiplicities and hence preserve their parity. Distinct vectors remain distinct assignments.
    This is an injection between the terms counted by the two sign-averaged moments.
  For a surviving term, each assigned contour winds at least two distinct test points and has diameter bounded
    below by their separation. All its ancestors have that lower bound as well.
    Truncate the number of such contours and ancestors. The free-bank arm bound makes the event that any of these
    contours passes within $O \( delta \)$ of a test point negligible.
    On its complement all the required pocket containments hold.
    Lemma 79 and the higher count moments in Lemma 80 remove the exceptional event and then the truncation by
    uniform integrability. This proves (19.1). ◻
]

=== 19.2 Geometry before identification <geometry-before-identification>

The arm and passage estimates give three properties of every subsequential contour limit that we shall use.
  We spell out their endpoint content to avoid importing a crossing estimate at a true $q = 4$ boundary.

#thm([Lemma 19.3.])[
  (Status disks and boundary traversal).  #emph[For every positive-diameter limiting contour,
    and for the limiting distinguished path, the set of distinct multiple visits in the original-domain interior
    has Hausdorff dimension at most zero. Deterministic interior points are almost surely avoided.
    At every interior trace point there are disks of each winding status arbitrarily nearby.
    In the marked case the statuses are read after closing the path on either wall arc.
    No nonconstant subtraversal of a limit lies entirely on the original Jordan boundary.]
  #emph[These statements and curve tightness hold both for the regular wall experiments and for the marked Jordan
    approximations in the theorem.]
] <q4pocket:geometry>

#proof[
  The first two assertions follow from Proposition 76 and Corollary 77, together with the one-arm estimate.
    For the two-status assertion use the attached-circuit argument of Section 15, with both banks retained.
    Here is the only modification required at $q = 4$. Enlarge the first crossing band a little laterally,
    and give a label only to an actual component containing a crossing of the original core.
    After a component has been searched and removed, comparison with full wiring on the enlarged band’s boundary
    is still valid. A buffered opposite-color transversal extending past both lateral ends of the core blocks any
    further core crossing. Bulk RSW gives this blocker a uniformly positive probability.
    The number of labels is therefore tight, and each label represents an actual connection in the revealed past.
    The leftmost crossings from a label’s bottom sources in successive core slabs can now be used exactly as in
    the attached-circuit argument; the fresh-side circuits lie in interior balls.
    For a distinguished path, close it along the remote wall when reading the two statuses.
    The argument also works with exposed bulk data outside the test patch.
    Only buffered bulk RSW is used #cite(label("DCLM2019Isoradial")).
  For the boundary assertion, fix a deterministic boundary point away from the marks.
    A macroscopic passage approaching it supplies an actual arm of the bank color that is not wired there.
    In local annuli this arm is bounded by the free-bank comparison.
    Along a primal wired arc the dual bank uses internal square faces and has no dual exit through that arc.
    Along the complementary arc the primal bank uses actual sampled edges and has no primal ties.
    Exterior dual identifications occur only beside the complementary arc.
    Turns can be followed by adjacent actual bank edges within $O \( delta \)$.
    Any other induced ties in a buffered annulus away from the other arc attach the surviving graph only at its
    rims. Thus the same arm bound applies in the specified Jordan approximations.
  A nonconstant boundary subtraversal would cover an arc and hit a point of a fixed countable dense subset away
    from the marks, by a macroscopic passage. The preceding bound excludes this.
    For tightness, at each displacement scale use a finite cover of subpassage tests away from the two marks.
    Every displacement contains a smaller displacement a fixed fraction of that scale away from both marks.
    Marked uniform Jordan convergence and separation of the two boundary arcs allow its annulus to be cropped in a
    neighborhood missing at least one arc. The same passage estimates apply there.
    Interior no-spur and multiple-visit tests always retain positive clearance from the original boundary. ◻
]

=== 19.3 Protected cuts and pointed kernels <protected-cuts-and-pointed-kernels>

We next give the deterministic approximation needed for the conditional field.
  A single limit contour may have several open winding components;
  filling in its hull would incorrectly join some of them.

#thm([Lemma 19.4.])[
  (Outer comparisons with protected cuts).  #emph[Let $L_n$ be simple discrete contour closures in a bounded
    Jordan domain $V$, converging uniformly modulo reparametrization to $L$.
    The closures may include one original wall arc. Assume the geometric properties of Lemma 87.
    Let $T$ be the trace of $L$, and let $U$ and $E$ be, respectively,
    the open sets of winding status one and zero off $T$, with infinity in $E$.
    Then the components of $U$ are simply connected pointed kernels of the interiors of $L_n$.]
  #emph[For every $beta > 0$ there exist simple regular comparison polygons $B_j$,
    and protecting balls centered on $T ∩ V$ or $partial V$, such that:]
  + #emph[the pointed kernels of $B_j$ at points of $U$ are precisely the separate components of $U$;]
  + #emph[every compact subset of $U$ is eventually contained in $B_j$;]
  + #emph[at each fixed $j$, deleting the part of a sufficiently fine discrete pocket outside $B_j$ changes edges
    only in finitely many protecting balls, of radii $r_i$, with $sum_i r_i^beta arrow.r 0$ as $j arrow.r oo$;]
  + #emph[$B_j$ is connected to a region outside $overline(V)$.]
  #emph[The finite protecting selection is made after constructing the cuts.]
] <q4pocket:protected-cuts>

#proof[
  Every point of $T ∩ V$ is approached by $E$, by the two-status property.
    Points of $T ∩ partial V$ are approached by the exterior of $overline(V)$. Hence
  #[#set math.equation(numbering: n => "(19.2)")
   $ overline(E) = bb(C) \\ U . $ <q4pocket:exterior-closure>]
  Compact subsets of $U$ persist in the approximating interiors by winding stability.
    Conversely, every excluded point is arbitrarily close to persistent exterior points, by (19.2).
    Thus the component containing a fixed point of $U$ is exactly its pointed kernel.
    Kernels of simply connected domains are simply connected.
  Let $M subset T ∩ V$ be the distinct multiple-visit set, after constant pauses have been erased.
    Given $eta > 0$, cover #emph[all] of $M$ by a countable collection of open balls $D_i$, centered on $M$, with
  $ sum_i "rad" \( D_i \)^beta < eta \, wide sup_i "rad" \( D_i \) < eta . $
  This is possible because $dim_(upright(H)) M lt.eq 0$. Set $G = E union union.big_i D_i$.
  We first show that any $x in E ∩ V$ can be joined to the exterior through $G$,
    after adding at most one arbitrarily small ball centered on $partial V$.
    If the closure of the path component of $x$ in $G$ reaches $partial V$,
    such a ball connects it to the Jordan exterior. Otherwise that component has a compact frontier $S subset
    V \\ G$ separating $x$ from infinity. The set $S$ meets $T$ only at unique-preimage points;
    its other points lie in $U$.
  There are polygonal closed walks, arbitrarily close to $S$, of nonzero winding about $x$.
    To see this, grid the bounded component of $bb(C) \\ S$ containing $x$,
    retain its edge-adjacent squares reachable from $x$ without meeting $S$, and trace their external perimeter.
    We can lift these walks, with an error tending uniformly to zero, into the closed disks bounded by $L_n$.
    Near a point of $S ∩ U$, a fixed interior ball persists. Near a point $z in S ∩ T$,
    all boundary parameters approaching $z$ tend to its unique preimage under $L$.
    Nearby points of the approximating closed disk can therefore be connected near $z$:
    first go by a closest segment to the boundary, and then use the short boundary arc between the resulting
    nearby parameters. The closest segments stay in the closed disk.
    The errors are uniform along the walk; otherwise compactness would give one of the two local situations just
    considered and contradict failure of uniformity. The lifted closed walk still winds about $x$,
    whereas $x$ lies outside the approximating disk. This contradicts contractibility of that disk and proves the
    escape assertion.
  Choose a large square $Q$ containing $overline(V)$ in its interior.
    Take finite increasingly fine nets of $overline(E) ∩ Q$ whose vertices belong to $E$.
    Join each net vertex to an exterior collar of $Q$ using the escape assertion.
    The finitely many additional boundary-centered balls can have arbitrarily small total $beta$-content.
    Select a finite polygonal tree joining these paths to one root on $partial Q$,
    otherwise lying in the open allowed region; gridding the paths and deleting cycles gives such a tree with
    axis-parallel edges. Remove a sufficiently thin polygonal neighborhood of this tree, attached to $partial Q$.
    Using narrow rectangular links and square junctions leaves one simple rectilinear polygon $B$.
    Keep an open part of the collar outside $overline(V)$ in $B$.
  As the nets become finer, the removed tree approaches every point of $overline(E) ∩ Q$.
    Any part of it entering $U$ lies in the protecting balls,
    whose radii tend to zero and whose centers lie on $T$ or $partial V$.
    Hence compact subsets of $U$ persist, while the pointed kernels cannot extend through an excluded point.
    This proves the first two assertions.
  For the finite selection, fix the tree and its closed thin neighborhood.
    It is compact and lies in the union of $E$ and the countable protecting balls.
    A finite subcover uses compact subsets of $E$ and finitely many of those balls, with a positive margin.
    The compact subsets of $E$ are disjoint from the closed disks bounded by $L_n$ for all large $n$.
    Thus only the finitely many selected balls can contain cuts affecting the discrete pockets.
    Their total content is no larger than that of the full cover.
    This is why the countable cover is used before selecting the tree.
    A further $O \( delta \)$ adjustment makes the comparison polygon a regular wall polygon on the appropriate
    color lattice, without losing the protecting margins. ◻
]

=== 19.4 Transfer of the conditional field <transfer-of-the-conditional-field>

#thm([Proposition 19.5.])[
  (Rough-interior moment transfer).  #emph[Condition on exterior pocket data converging to a containing contour as
    in Lemma 88. At every fixed distinct tuple of points in $U$,
    the joint moments of the residual zero-offset height converge to the Wick moments of independent fields $sigma
    Phi_Omega^0$ in the components $Omega$ of $U$. This holds along every such convergent sequence of exterior
    data. Several containing contours at one generation may be treated simultaneously, taking the product over them.]
] <q4pocket:rough-transfer>

#proof[
  Write $beta > 0$ for the power in the free-bank arm bound.
    Fix a comparison polygon $B$ and the finite protecting balls supplied by Lemma 88.
    In every pocket delete opposite-color edges outside the lattice approximation of $B$.
    Equivalently, intersect its set of elementary wall-color cells with the corresponding cell set of $B$,
    retaining only opposite-color edges between surviving adjacent cell centers.
    All changes are in the protecting balls.
  The original opposite-color laws are product free laws. Couple them with the modified laws by exploring,
    in the larger law, the actual clusters incident to the deleted edges.
    Once those clusters are exposed, all discrepancies are shielded and the unqueried graphs have the same
    conditional law. The argument is the same as the gap-closing coupling in Section 18.
    If the ball radii are $r_i$ and $e > 0$ is fixed, the probability that a discrepancy reaches farther than $e$
    from their centers is at most
  #[#set math.equation(numbering: n => "(19.3)")
   $ C sum_i \( r_i \/ e \)^beta . $ <q4pocket:cut-error>]
  Indeed every such discrepancy supplies an actual opposite-color arm in the original product free law,
    dominated by the full-lattice comparison. Contours through changed switches have banks in these discovered
    clusters and obey the same locality bound. Choose $e$ smaller than the tuple’s separation and its clearance
    from $T union partial V$. Every sign-averaged residual moment term uses a contour of at least the
    pair-separation diameter. The macroscopic count moments and Hölder’s inequality therefore make the moment
    error tend to zero with the total protecting content in (19.3).
  We verify the laws and offsets of the retained regions. Each side-connected component of the retained wall-color
    cells is again a simple polygon disk. Every globally missing cell has a path of missing cells to the exterior:
    it is outside at least one of the two simple grid polygons being intersected.
    Thus a retained component has no hole. Its boundary cannot pinch at a vertex with two opposite retained cells
    in that component and two opposite missing cells. The retained pair would be connected by a side-adjacent
    path, while the missing pair is connected through the exterior;
    these two disjoint connections between alternating sectors contradict planar separation.
    Apply this argument separately to each old pocket. The retained free opposite-color graph hence factors into
    independent homogeneous disk laws.
  Each retained component also reaches an #emph[old] pocket wall.
    Start from one of its cells and take a side-adjacent path in $B$ to the part of $B$ outside $overline(V)$.
    The first exit from the old pocket crosses an old wall edge;
    the path before that exit remains in the same retained component.
    The component therefore has an actual wall-color connection to the old wall.
    No exterior contour can surround it and add an unrecorded height jump. Its residual offset is zero.
    Finally, a connected compact neighborhood of any test point began in one old pocket for large $n$:
    the bank walk tracking $L_n$ winds around that compact, so Lemma 85 places it in a pocket.
  For the upper bound, apply Lemma 86 from the retained disks into $B$, and then apply Theorem 81.
    For the lower bound, make no deletions. Choose one regular polygon disk compactly inside each involved
    component $Omega$, containing its test points, and compare their product laws into the original pockets.
    Such inner disks can exhaust each simply connected $Omega$ in the pointed-kernel sense.
  Dirichlet Green functions converge along simply connected pointed kernels.
    Between points whose limiting kernels are different, they tend to zero;
    this follows by conformal mapping convergence, or by the vanishing probability of crossing the separating
    bottleneck before exit. Therefore the Wick kernels of both the inner polygons and the protected outer polygons
    converge to those of independent Dirichlet fields in the components $Omega$.
    Take the mesh limit first at fixed polygons and protectors;
    next improve the inner and outer approximations and let their total protecting content vanish.
    The two bounds coincide. Already assigned ancestor signs, or the marked path’s side constants,
    multiply lower-order residual moments and are restored afterwards. They do not enter the moment comparison. ◻
]

== 20 Identification at the endpoint and the boundary convention <sec:q4identification>

=== 20.1 A global conditional decomposition <a-global-conditional-decomposition>

Take a joint subsequential limit of the height and the distinguished path in a regular two-arc polygon.
  For a homogeneous initial square, take a joint limit of the height and the full contour collection,
  including nesting levels, parent relations, and independent fair signs.
  These marked geometric limits can be obtained at countably many positive-diameter cutoffs decreasing to zero,
  moving a cutoff when necessary to avoid atoms. At each cutoff there are only a tight number of relevant contours
  and ancestors. Thus finite marked relations stabilize, and a diagonal extraction retains every positive limiting
  contour. The signs remain conditionally independent and fair given the geometry, which was sampled without using them.

Fix a nesting level $k$ in the square. Every deterministic interior point lies almost surely in a positive winding
  region at that level. Indeed alternating actual circuits on successively separated bulk scales force arbitrarily
  many surrounding contours. The domain Markov bounds and bulk RSW make the failure probability tend to zero as
  the number of scales grows, with the mesh limit taken first at each finite selection of scales.
  The same statement holds for Lebesgue-almost every point by Fubini.
  Winding regions of different contours at a fixed level are disjoint, as their discrete predecessors are.
  Positive coincident traversal arcs would also contradict the multiple-visit dimension bound.
  In the marked case the two side closures likewise cover almost every point away from their traces.

Let $cal(F)_k$ denote the limiting exterior geometry and signs through level $k$,
  or let $cal(F)$ denote the limiting marked path in the two-arc experiment.
  Let $cal(O)$ be the collection of components of the corresponding open winding regions.
  Define $v$ on each component to be the sum of its containing signs through level $k$,
  or its marked side value $0$ or $1$. Its value on the remaining area-zero set is immaterial.

#thm([Proposition 20.1.])[
  (Conditional field in all complementary components).  #emph[Conditional on the stated limiting exterior data,
    the height has the distributional decomposition
#[#set math.equation(numbering: n => "(20.1)")
 $ h med =^(upright("law")) med v + sigma sum_(Omega in cal(O)) Phi_Omega^0 \, $ <q4pocket:conditional-decomposition>]

 where the Dirichlet fields are independent and extended by zero.
   The identity holds as an identity of distributions on the whole initial-domain interior,
   not merely after restriction to individual components.]
] <q4pocket:conditional-field>

#proof[
  For a test function $f$, the independent sum on the right exists in $L^2$, since Green-function monotonicity gives
  #[#set math.equation(numbering: n => "(20.2)")
   $ sum_(Omega in cal(O)) integral.double_(Omega^2) \| f \( z \) \| G_Omega \( z \, w \) \| f \( w \) \| thin d z
     thin d w lt.eq integral.double_(V^2) \| f \( z \) \| G_V \( z \, w \) \| f \( w \) \| thin d z thin d w .
     $ <q4pocket:covariance-domination>]
  The same estimate, with a fixed negative Sobolev norm, defines the sum as a random distribution.
  Use a representation on which the extracted geometric data converge.
    A fixed distinct tuple of deterministic interior points is almost surely eventually covered,
    with positive limiting clearance, by the relevant winding components. Its offsets converge.
    Conditional on the discrete exterior pocket data, including the actual cycle walls,
    its residual moments converge by Proposition 89. That proposition applies along every realized convergent data
    sequence; it requires no regularity of the unexplored cycle walls beyond the proved pocket properties.
  To pass to conditioning only on the stated limiting data,
    multiply the discrete moment identities by a bounded continuous function of those data.
    The necessary uniform integrability follows from Lemma 80.
    At level $k$, terms already assigned to ancestors have offsets bounded by $k$.
    The remaining sign-averaged terms require shared contours of at least the relevant pair-separation diameter,
    and their counts have all polynomial moments under the initial law. The marked offset is bounded by one.
    Thus, for each $m$, a bound of the form
  $ C_(m \, k) #scale(x: 120%, y: 120%)[\(] 1 + \| log d_(*) \| #scale(x: 120%, y: 120%)[\)]^m \, wide d_(*) =
    min { 1 \, \| z_i - z_j \| : i eq.not j #scale(x: 120%, y: 120%)[}] \, $
  and its higher-moment versions apply also before coverage by the limiting components has stabilized.
    Such bounds are integrable on tuples in compact subsets of $V$, including near diagonals.
  Smear the identities against tensor products of smooth test densities.
    Fubini and uniform integrability pass every joint moment to the limit,
    with every bounded continuous geometric multiplier retained.
    The almost-everywhere coverage removes the remaining set from these integrals.
    Higher even moments give uniform integrability of the smeared variables themselves.
    A countable determining family of test densities then yields the conditional moment identities for
    distributions. For each fixed conditional geometry, the Gaussian law with the bounded offset on the right of
    (20.1) is moment determining; equivalently, apply the one-dimensional Gaussian moment criterion to every
    rational linear combination of finitely many tests. Hence the moment identities identify the conditional law.
    Because the tests range over the entire initial domain, this argument also excludes a residual distribution
    supported on the area-zero complement of the components. ◻
]

=== 20.2 Local-set uniqueness with the exact height normalization <local-set-uniqueness-with-the-exact-height-normalization>

We use two continuum identifications. For the zero-boundary GFF,
  the two-valued bounded-type thin local set with values $- a \, b$ is unique and field measurable when $a \,
  b > 0$ and $a + b gt.eq 2 lambda_0$. At $a = b = 2 lambda_0$ it is the non-nested $upright("CLE")_4$ gasket,
  with independent fair labels on its holes #cite(label("AruSepulvedaWerner2019")) Propositions 1 and 2 and
  Sections 4 and 6.3.

For boundary data we use Theorem 3.21 of #cite(label("AruLupuSepulveda2020"), form: "prose"),
  with its immediately preceding boundary criterion. In the specialization needed here,
  the initial domain is a disk, $u$ is bounded harmonic with finitely piecewise constant boundary data in
  $\[ - a \, b \]$, and $a + b gt.eq 2 lambda_0$. Uniqueness holds for bounded-type thin local sets whose total
  conditional harmonic function is constantly $- a$ or $b$ on each connected boundary component of each
  complementary domain. The interval here is closed: boundary values equal to $- a$ or $b$ are permitted.
  The standard completed chordal $upright("SLE")_4$ level line, for boundary data $- lambda_0 \,
  lambda_0$ on the two arcs, has exactly this conditional field decomposition #cite(label("SchrammSheffield2013")).

#thm([Lemma 20.2.])[
  (The limiting sets are bounded-type thin local sets).  #emph[For the first contour level in the square, let
$ A = overline(V) \\ union.big_(Omega in cal(O)) Omega . $

 In the marked experiment let $A$ be the path trace together with $partial V$.
   After the normalizations below, these are bounded-type thin local sets.
   In the homogeneous case their harmonic values are $plus.minus 2 lambda_0$.
   In the marked case their #emph[total] harmonic values are $plus.minus lambda_0$.]
] <q4pocket:local-set>

#proof[
  In the homogeneous case, write $Phi = h \/ sigma$ and $m = v \/ sigma$.
    Theorem 81 says that $Phi$ is a zero-boundary GFF. At the first level $v in { - 1 \, 1 }$, so $m in { -
    2 lambda_0 \, 2 lambda_0 }$. In the marked case put
  $ X = frac(h - 1 \/ 2, sigma) = Phi + u \, wide m = frac(v - 1 \/ 2, sigma) - u \, $
  where $Phi$ is a zero-boundary GFF and $u$ is the bounded harmonic function with boundary data $- lambda_0 \,
    lambda_0$ on the respective arcs. Here $\| m \| lt.eq 2 lambda_0$ and $m + u in { - lambda_0 \,
    lambda_0 }$ on each component.
  In either case Proposition 90 gives the full conditional Dirichlet law of $Phi - m$ in $V \\ A$.
    This law depends on the exterior data only through $A$. Conditioning down to $\( A \, m \)$ proves locality.
    Moreover $m$ is an ordinary bounded function, integrated over $V \\ A$,
    and the distributional identity has no additional part supported on $A$. This is thinness.
    The uniqueness of a local set’s harmonic distribution from the field and set is also part of the local-set
    formalism #cite(label("AruLupuSepulveda2020")) Lemma 2.3(1);
    no extra choice of component labels is being added at this step.
  For completeness, $A$ is connected and contains the entire Jordan boundary.
    Its complementary components are simply connected by Lemma 88.
    If $A$ were disconnected, split it into two nonempty disjoint compact sets,
    putting the connected $partial V$ in the first. A fine polygonal boundary around part of the second,
    at positive distance from the first and from $partial V$,
    would be a closed walk in a component of $V \\ A$ with nonzero winding about a point of $A$.
    This contradicts that component’s simple connectivity. Thus $A$ is a nontrivial connected compact set.
    It has no isolated points, and no component disjoint from $partial V$.
    These facts verify the topological condition in the definition of a bounded-type thin local set.
    Conformal transport to a disk preserves all these assertions. ◻
]

#thm([Proposition 20.3.])[
  (Regular marked endpoint).  #emph[The distinguished curves in the regular two-arc experiments converge as
    ordered curves, up to increasing changes of parametrization,
    to chordal $upright("SLE")_4$ between the prescribed marks.]
] <q4pocket:regular-chordal>

#proof[
  Apply the boundary-data uniqueness theorem with $a = b = lambda_0$.
    The initial domain, after conformal transport, has one complementary component, which is not a singleton.
    The boundary function has two changes and takes values in the closed allowed interval.
    Its interior range meets $\( - lambda_0 \, lambda_0 \)$ by the strong maximum principle.
    The height-gap condition holds with equality. In every component of $V \\ A$,
    the total conditional mean is constant $- lambda_0$ or $lambda_0$,
    so the stated boundary criterion holds on every boundary component.
    Finally Lemma 91 supplies thinness, boundedness, and the required topology.
    All hypotheses of #cite(label("AruLupuSepulveda2020"), form: "prose") Theorem 3.21 are therefore met.
  The completed Schramm–Sheffield level line coupled to the same field satisfies these same conditions.
    Uniqueness identifies the limiting closed set, together with its harmonic labels,
    with that level line plus the original boundary. In particular its interior trace is the simple chordal
    $upright("SLE")_4$ arc, which has no hits on the interiors of the two boundary arcs.
  This closed-set statement identifies the original ordered curve as well.
    Any extra boundary point off the identified compact arc has a neighborhood disjoint from that arc;
    reaching it would force a nonconstant boundary subtraversal, excluded by Lemma 87.
    On a simple arc, any genuine backtracking repeats a nondegenerate subarc.
    Such a subarc has positive Hausdorff dimension, contradicting the dimension-zero multiple-visit bound.
    After suppressing constant pauses, the curve therefore traverses the arc once, in the prescribed endpoint order. ◻
]

=== 20.3 Contours, labels, and all nesting levels <contours-labels-and-all-nesting-levels>

#thm([Proposition 20.4.])[
  (Endpoint contours in a square).  #emph[In a homogeneous square,
    the entire signed contour hierarchy converges to nested $upright("CLE")_4$,
    with independent fair signs at each generation. The identification includes each individual contour as a
    simple-loop element, its parent, and its traversal order up to the loop convention.]
] <q4pocket:square-cle>

#proof[
  The first-level set $A$ in Lemma 91 has harmonic values $plus.minus 2 lambda_0$.
    Ordinary two-valued-set uniqueness identifies its coupling with the field as the labelled non-nested
    $upright("CLE")_4$ gasket.
  We must still identify the discrete contour elements, since one such element could a priori have several winding
    components. Every positive contour has an interior-status disk,
    by the two-status property and the exclusion of boundary-only traversal.
    Thus it winds at least one hole of the identified gasket.
    Select two distinct holes by the first points they contain in a fixed countable dense set.
    Conditional on the gasket $A$, the two unit offsets in our construction satisfy
  #[#set math.equation(numbering: n => "(20.3)")
   $ bb(E) \[ v \( Omega_1 \) v \( Omega_2 \) divides A \] =
     bb(P) { Omega_1 upright(" and ") Omega_2 upright(" belong to one contour") divides A } .
     $ <q4pocket:label-grouping>]
  Indeed the signs were independent and fair given the entire unlabelled contour geometry;
    different contours contribute zero covariance, whereas the same contour contributes one.
    In the unique two-valued-set coupling, different $upright("CLE")_4$ holes have independent fair labels,
    so the left side of (20.3) is zero. Countability excludes all grouping of distinct holes.
  Consequently each positive contour winds exactly one simple CLE hole.
    Its full interior trace equals that hole’s Jordan boundary:
    the two-status property puts every trace point on the boundary of its winding region,
    and winding stability puts that boundary in the trace. Additional boundary pieces are excluded as in
    Proposition 92. The limiting winding is one. Any extra covering or backtracking repeats a nondegenerate subarc
    and violates the dimension-zero bound. Thus the original contour is exactly the corresponding simple-loop
    element, not just a set with the same filled interior.
  Proceed conditionally through the hierarchy. Given the geometry and labels through an identified level,
    the residual fields in its holes are independent zero-boundary GFFs by Proposition 90.
    The next-level decomposition, with the parent constant subtracted,
    makes its missing set in each hole a thin local set with harmonic values $plus.minus 2 lambda_0$.
    Child winding components lie in the parent by discrete winding stability at points with clearance.
    They are simply connected and cover almost every point, by the arguments already given.
    Every positive child has an interior-status disk and is supported on the closure of its winding regions by the
    two-status property. Thus the same topology and thinness verification applies inside each parent hole.
  Conditional uniqueness, including measurability from the respective residual field,
    gives independent fresh CLEs in the parent holes. Equation (20.3) and the trace argument again identify every
    individual child and its sign. Its parent can be read at any interior disk point off the traces.
    Induction identifies all finite generations. Finally every positive-diameter contour and all its ancestors
    occur in the retained finite-cutoff hierarchies, whose counts are tight.
    Sending the cutoff to zero identifies the full collection in the stated matching topology. ◻
]

#thm([Corollary 20.5.])[
  (Endpoint whole-plane ensemble).  #emph[The infinite-volume free critical FK loop ensemble at $q =
    4$ converges to the nested whole-plane $upright("CLE")_4$ ensemble, in the spherical matching metric for all loops.]
] <q4pocket:whole-plane>

#proof[
  Use the expanding-square coupling of Section 15. Its endpoint ingredients are bulk estimates:
    monotone boundary coupling and exploration of actual boundary connections couple the infinite-volume free
    switches with the square switches deep inside a large square,
    except when a boundary connection reaches the inner region.
    Actual dual circuits on successive annuli block that event, uniformly even under the maximal boundary law.
    Actual-color annular blockers likewise make a loop from a fixed disk reaching the coupling boundary unlikely.
    The finite-square limit is given by Proposition 93.
  Nested simple CLEs in domains of conformal radius tending to infinity converge locally to nested whole-plane
    CLE; their spherical whole-plane law is Möbius invariant #cite(label("KemppainenWerner2016")) Theorem 1,
    Proposition 4, and Section 3.2. Its range $8 \/ 3 < kappa lt.eq 4$ includes the present endpoint,
    and centered expanding squares meet its conformal-radius condition.
  To pass from the local comparison to the spherical metric, first fix a spherical diameter cutoff.
    Loops lying entirely outside a sufficiently large fixed disk are below that cutoff.
    With high probability, every other loop above the cutoff remains inside the switch-coupling region,
    by the preceding escape bound. The number of such loops is tight,
    and the finite-square matching identifies them bijectively with their traversal order.
    Take the mesh limit, then enlarge the square and the fixed disk, and finally send the diameter cutoff to zero.
    This is the required global matching statement, including all nesting levels. ◻
]

=== 20.4 The prescribed marked Jordan approximations <the-prescribed-marked-jordan-approximations>

It remains to transfer Proposition 92 to the precise wired/free edge convention of the theorem.
  This transfer uses actual color walls, so that a boundary identification is never mistaken for a path in the lattice.

#thm([Proposition 20.6.])[
  (Endpoint marked Jordan convergence).  #emph[For every marked uniform Jordan approximation specified in the
    theorem, its critical $q = 4$ distinguished curve converges to chordal $upright("SLE")_4$ in the limiting
    marked domain.]
] <q4pocket:jordan-chordal>

#proof[
  Use the two-change disk drawing from Lemma 35: place tiles on every polygon-graph edge,
    give boundary edges distinct exterior tabs, and put local caps along the wired primal and complementary dual
    arcs. Flattening the tabs and separating the drawing in a thin collar changes the ordered curve by only
    $O \( delta_n \)$ in uniform distance. Boundary edges on the wired primal arc may be fixed open,
    while edges on the free arc retain their sampled law.
  The primal bank of the distinguished path, closed along the primal wall,
    is a walk of actual open edges in the wired cluster. On the other side, the actual internal dual bank,
    its exits to exterior copies across the free arc, and the local complementary-wire links give the dual closing
    walk. All artificial dual links and copies stay within $O \( delta_n \)$ of that free arc.
    No dual exit through the primal wired arc is used. At fixed bulk points away from limiting traces these walks
    therefore have stable complementary winding statuses $1$ and $0$.
    Lemma 87 gives tightness, the two-status property, and the restrictions on multiple visits and boundary
    traversal for these drawings.
  Construct a regular comparison polygon $V^(+)$ close to the limiting marked domain $V$ with the following two
    strict separations: the original primal wired arc, including its endpoints, lies outside $overline(V^(+))$;
    and the comparison dual wall lies outside $overline(V)$. All margins are fixed before taking the mesh limit.
    One construction uses plane Schoenflies coordinates for $partial V$.
    Move the primal portion slightly inward, extending it a little beyond both marks,
    then rise outside the unit circle near the two ends and put both comparison transitions there.
    Keep the whole comparison dual portion outside the unit circle.
    Approximate the resulting simple curve by a simple rectilinear polygon, preserving all strict margins,
    and place the transitions inside straight sides. Its actual primal-open and dual-open wall approximations are
    regular experiments. Reverse the colors to construct $V^(-)$:
    the original complementary arc is outside $overline(V^(-))$,
    and the comparison primal wall is outside $overline(V)$. Both comparisons approach the same marked Jordan
    domain as the offsets vanish.
  Couple the original law with that in $V^(+)$ so that every original primal open edge in the common region is
    open in the comparison. To check the boundary partition needed for this ordering,
    restrict the original configuration to the common edges. Any connection departing from the comparison disk can
    induce ties only at its actual primal wall vertices: its dual wall and transitions lie outside the entire
    original closure, while the original wired vertices lie outside the comparison.
    The comparison connects all those primal wall vertices by fixed open wall edges.
    Its induced partition therefore dominates the original one,
    and random-cluster monotonicity gives the coupling. The cut is along a primal lattice wall,
    so no unaligned edge crossing is being treated as a wall vertex.
  Every piece inside $V^(+)$ of the original primal closing bank walk belongs to the comparison primal wall
    cluster: follow its original connection to the outer wire and take its first exit from $V^(+)$.
    Suppose a test point has original primal winding status but comparison dual status, with positive clearance.
    On the comparison dual side it can be joined to the comparison dual wall without crossing the comparison
    primal wall cluster, and hence without crossing the original closing walk inside $V^(+)$.
    From that wall, which is outside the entire original polygon,
    it can escape to infinity through the original exterior. This contradicts the original winding.
    Thus original primal status implies comparison primal status.
  For $V^(-)$ apply exactly the dual ordering. Original dual identifications and artificial bank links lie beside
    the complementary arc, outside $V^(-)$. In the common region the dual walk uses only internal dual steps,
    and departing connections induce ties only at the aligned comparison dual wall vertices.
    An originally wired primal edge admits no dual crossing step.
    Original dual status therefore implies comparison dual status.
    The free-bank arm bound removes near-hits and tile ambiguities at any prescribed finite tuple of bulk points.
  Let $I_n \( z \)$ be the original primal-side indicator, and let $I_n^(-) \( z \) \,
    I_n^(+) \( z \)$ denote those in the two comparisons. The separate monotone couplings give,
    for every fixed finite tuple $bold(z)$, the stochastic bounds
  #[#set math.equation(numbering: n => "(20.4)")
   $ \( I_n^(-) \( z \) \)_(z in bold(z)) med prec.curly.eq med \( I_n \( z \) \)_(z in bold(z)) med
     prec.curly.eq med \( I_n^(+) \( z \) \)_(z in bold(z)) \, $ <q4pocket:side-sandwich>]
  up to errors vanishing with the mesh. At fixed comparison polygons the limiting laws are the regular chordal
    $upright("SLE")_4$ laws by Proposition 92. Now let the offsets vanish.
    Conformal maps and their boundary extensions converge under marked uniform Jordan convergence,
    using uniform local connectivity of these boundary parametrizations.
    The two comparison SLE laws therefore have the same limit.
    Deterministic interior points avoid SLE, so their side-status arrays converge as well.
    Equation (20.4) identifies every finite-dimensional status law of an original subsequential limit.
  On a fixed countable dense set, the statuses determine the interior trace:
    an interior trace point has both statuses in every neighborhood,
    whereas a point off the trace has a small disk of constant status. This follows from Lemma 87.
    Thus the limiting interior trace is the SLE trace. No boundary traversal and the dimension-zero multiple-visit
    bound identify the complete ordered curve exactly as in Proposition 92.
    Every tight subsequence has the same law, proving the full-sequence assertion. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
