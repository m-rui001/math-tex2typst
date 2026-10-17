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

#align(center)[#text(size: 16pt, weight: "bold")[Near-square-root logarithmic integrality gaps \
for uniform sparsest cut]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Sparsest cut asks for a partition with small crossing capacity relative to the demand it separates. It is a basic graph-partitioning problem, and its relaxations connect approximation algorithms with the geometry of finite metric spaces. When every pair of vertices has the same demand, the denominator depends only on the two part sizes. An integrality-gap lower bound in this uniform case requires an obstruction to preserving the average distance over all pairs.

Let $C = \( c_(i j) \)$ be symmetric nonnegative capacities on the unordered pairs of distinct vertices in $\[ n \] = { 1 \, dots.h \, n }$. The uniform sparsest-cut optimum is

#[#set math.equation(numbering: n => "(1.1)")
 $ "OPT" \( C \) = min_(diameter eq.not B subset.neq \[ n \]) frac(sum_(i in B \, thin j in.not B) c_(i j), \| B \| \( n - \| B \| \)) . $ <eq:opt>]

Thus every pair has demand exactly one. We allow arbitrary capacities; no regularity or degree-weighted vertex measure is assumed.

A #emph[negative-type semimetric] on a finite set is a function $d \( i \, j \) = \| x_i - x_j \|^2$, for vectors in a real Hilbert space, that satisfies all triangle inequalities. Distinct points may have distance zero. The Goemans–Linial relaxation #cite(label("Goe97")) #cite(label("Lin02")) is

#[#set math.equation(numbering: n => "(1.2)")
 $ "GL" \( C \) = min {sum_(i < j) c_(i j) d \( i \, j \) : med sum_(i < j) d \( i \, j \) = 1 \, quad d upright(" is a negative-type semimetric")} . $ <eq:gl>]

Every finite Hilbert configuration can be realized in $bb(R)^n$, so this is the usual squared-Euclidean SDP with triangle inequalities. There is no unit-norm constraint on the vectors. Cut distances are feasible after normalization, and hence $"GL" \( C \) lt.eq "OPT" \( C \)$.

#thm([Theorem 1.1.])[
  #emph[There are an absolute constant $c > 0$ and capacity instances $C^(\( j \))$ on $n_j arrow.r oo$ vertices, with $"GL" \( C^(\( j \)) \) > 0$, such that 
$ frac("OPT" \( C^(\( j \)) \), "GL" \( C^(\( j \)) \)) gt.eq c thin frac(sqrt(log n_j), \( log log n_j \)^3) $

 for all sufficiently large $j$. The demand is one between every pair of distinct vertices.]
] <thm:main>

=== 1.1 History and the uniform-demand obstacle <history-and-the-uniform-demand-obstacle>

The metric viewpoint on cuts was developed by Linial, London, and Rabinovich #cite(label("LLR95")): finite $ell_1$ distances are nonnegative combinations of cut distances, and an embedding into $ell_1$ can be rounded to a cut. For uniform demands, the relevant quantity is the average distance preserved by a nonexpanding map. Rabinovich developed this average-distortion framework and its connection to uniform sparsest cut #cite(label("Rab03")) #cite(label("Rab08")). Here a map is #emph[nonexpanding], or a #emph[contraction], if its distance on each pair is at most the original distance. The proof below constructs a negative-type semimetric for which every contraction into $ell_1$ preserves only a small fraction of the average distance.

Arora, Rao, and Vazirani gave an $O \( sqrt(log n) \)$ approximation for uniform sparsest cut through their semidefinite relaxation and geometric separation theorem #cite(label("ARV09")). Their work, first presented in 2004, provides the upper-bound benchmark for 1. Devanur, Khot, Saket, and Vishnoi obtained an $Omega \( log log n \)$ integrality gap, refuting the uniform constant-gap conjecture #cite(label("DKSV06")). Kane and Meka subsequently proved the stronger bound $exp \( Omega \( sqrt(log log n) \) \)$ through pseudorandom generators for Lipschitz functions of polynomials #cite(label("KM13")). Their work also gives lower bounds for strengthened relaxations; the present paper concerns the basic Goemans–Linial SDP. Our bound reaches the exponent $1 \/ 2$ in $log n$, with the displayed iterated-logarithmic loss, and quantitatively strengthens the earlier negative resolution of the uniform constant-gap conjecture.

For arbitrary demands, the Goemans–Linial Conjecture predicted a constant integrality gap, equivalently a uniform bound on the $ell_1$ distortion of finite negative-type metrics. Khot and Vishnoi disproved this conjecture #cite(label("KV15")). A geometric line of work based on the Heisenberg group was developed by Lee and Naor #cite(label("LN06")), Cheeger and Kleiner #cite(label("CK10")), and Cheeger, Kleiner, and Naor #cite(label("CKN09")) #cite(label("CKN11")). Naor and Young obtained the sharp general-demand lower bound $Omega \( sqrt(log n) \)$ #cite(label("NY18")); Chang, Naor, and Ren proved the matching upper bound #cite(label("CNR25STOC")) #cite(label("CNR25")). These lower bounds do not imply the uniform-demand conclusion. Indeed, Cheeger, Kleiner, and Naor explain explicitly that their bounded-doubling examples have constant average distortion into a line, so their construction cannot yield a diverging uniform gap #cite(label("CKN09")) Remark 1.1. This distinction between worst-pair distortion and average-distance preservation is the obstacle addressed here.

=== 1.2 Proof strategy <proof-strategy>

The construction has two tasks: build a negative-type semimetric with large average distance, and force every $ell_1$ contraction to have small average distance for the same probability measure. The final passage to capacities uses cut-cone duality in the average-distortion framework of Linial–London–Rabinovich and Rabinovich #cite(label("LLR95")) #cite(label("Rab03")) #cite(label("Rab08")). We give the full finite-dimensional argument in 6, including the passage to exactly uniform demands and positivity of the SDP optimum.

===== 1.2.1 A common parameter space, many rounded charts. <a-common-parameter-space-many-rounded-charts.>

Fix a large integer $m$ and the parameter cube $U = \( - 2 \, 2 \)^m$. For each $s in { 1 \, dots.h \, S }$, choose a linear map $J_s : bb(R)^m arrow.r bb(R)^N$ with rows $u_(s \, i)^T$, and round its coordinates to a lattice of mesh $tau > 0$. The resulting vertex label is

$ v_s \( theta \) = \( s \, X_s \( theta \) \) \, #h(2em) X_s \( theta \)_i = tau ⌊frac(chevron.l u_(s \, i) \, theta chevron.r, tau)⌋ . $

Each chart partitions the same cube into cells cut out by hyperplanes; $V$ consists of all labels attained off those hyperplanes. The directions are fixed before choosing any contraction. Their simultaneous guarantee, proved in 2 and Appendix 7, ensures that every unit direction has small projections onto all normals in at least half the charts. The powers of $m$ determining $S \, N \, tau$ are chosen so that $\| V \| lt.eq exp \( C m log m \)$.

===== 1.2.2 Large global distances and small interface costs. <large-global-distances-and-small-interface-costs.>

3 builds Hilbert vectors for the labels using one common smooth feature map of $theta$. Squared distances between these features approximate $c_(*) sqrt(m) thin \| theta - eta \|$ with a uniform additive error, where $c_(*) > 0$ is absolute. Small additional Fourier components allow extensions away from each chart subspace whose coordinate derivatives have small inner products against all feature vectors. These derivative profiles control the cost of changing one rounded coordinate. The extension operators may have large norms; sufficiently fine rounding controls their effect on the feature values.

The resulting squared distances need not yet satisfy every triangle inequality. Section 4 repairs them using a scale integral of Gaussian positive-definite kernels, building on the classical Gaussian-kernel principle of Schoenberg #cite(label("Sch38")). The local angle estimate is indispensable: a bounded global error alone would overwhelm the tiny costs at cell interfaces. Together, the local and global angle bounds permit a repair of bounded total size with only a logarithmic loss at those interfaces. In the resulting semimetric $d$, with tolerance $r = m^(- 8)$, labels from different charts at the same parameter have distance at most $C r$, while adjacent labels within a chart have the much smaller bound in (4.6). Independent uniform parameters in $T = \( - 1 \, 1 \)^m$ have expected first-chart distance at least $c m$.

===== 1.2.3 Simultaneous constraints on a contraction. <simultaneous-constraints-on-a-contraction.>

Given any contraction $F : V arrow.r ell_1^D$, define $f_s \( theta \) = F \( v_s \( theta \) \)$ almost everywhere on $U$. The same-parameter estimate makes these functions uniformly close. After smoothing, their gradients are close as well. In each chart, small jumps across cell interfaces express each scalar gradient as a combination of that chart’s normals. The absolute coefficients, summed over all normals and target components, have total budget $C m \( log m \)^2$. Small projections in the appropriate charts contribute a factor $C sqrt(\( log m \) \/ m)$, bounding the sum of the Euclidean norms of the scalar gradients. A dimension-free first-moment inequality on the cube, proved by the Maurey–Pisier Gaussian rotation method #cite(label("Pis86")), converts this bound into

$ bb(E)_(theta \, eta in T) parallel F \( v_1 \( theta \) \) - F \( v_1 \( eta \) \) parallel_1 lt.eq C sqrt(m) \( log m \)^(5 \/ 2) . $

5 proves this estimate uniformly in the target dimension $D$. In particular, the favorable charts may depend on the scalar component and parameter; the proof averages over charts before summing the components.

===== 1.2.4 Uniform copies and capacities. <uniform-copies-and-capacities.>

The probability measure used for these averages is supported on the first chart, but all charts impose constraints on $F$. We approximate that measure by multiplicities while retaining at least one copy of #emph[every] vertex of $V$. Copies of the same vertex have distance zero, so each contraction on the copies induces a contraction on all of $V$. The measure on the copies is exactly uniform; its pushforward only approximates the original first-chart measure. The average bounds survive, and cut-cone duality supplies capacities with unit demand on each distinct pair of copies.

1 summarizes the two estimates used by this final step. The size and gap conversion in 6 is

$ upright("gap") gt.tilde frac(m, sqrt(m) \( log m \)^(5 \/ 2)) \, #h(2em) log n asymp m log m \, $

which yields the power $3$ of $log log n$ in 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 14.6cm, inset: (x: 0.1764cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One parameter cube $U=(-2,2)^m$#linebreak()Directions for every chart are fixed before the contraction $F$.]]])])
  rect((-7.201, -3.175), (-2.799, -0.825), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), radius: 2pt)
  rect((-2.201, -3.175), (2.201, -0.825), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), radius: 2pt)
  rect((2.799, -3.175), (7.201, -0.825), fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), radius: 2pt)
  content((-5, -1.15), [#text(size: 9pt)[Chart $1$]])
  content((-5, -1.55), [#text(size: 9pt)[$theta arrow.r.long.bar v_1( theta )$]])
  rect((-5.228, -2.778), (-4.772, -2.322), fill: rgb("#ffe3c7"), stroke: none)
  line((-5.684, -3.69), (-5.684, -1.41), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-6.14, -3.234), (-3.86, -3.234), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-5.228, -3.69), (-5.228, -1.41), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-6.14, -2.778), (-3.86, -2.778), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-4.772, -3.69), (-4.772, -1.41), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-6.14, -2.322), (-3.86, -2.322), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-4.316, -3.69), (-4.316, -1.41), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-6.14, -1.866), (-3.86, -1.866), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  circle((-4.943, -2.531), radius: 0.04939, fill: rgb("#000000"), stroke: none)
  content((-4.905, -2.512), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffe3c7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$theta$]]])], anchor: "west")
  rect((-5.76, -3.072), (-4.24, -2.027), stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10))
  content((0, -1.15), [#text(size: 9pt)[Chart $s$]])
  content((0, -1.55), [#text(size: 9pt)[$theta arrow.r.long.bar v_s( theta )$]])
  line((-0.1103, -2.853), (0.303, -2.66), (0.1103, -2.247), (-0.303, -2.44), close: true, fill: rgb("#ffe3c7"), stroke: none)
  line((-0.1381, -3.872), (-1.102, -1.806), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-0.7441, -3.652), (1.322, -2.688), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((0.2751, -3.68), (-0.6884, -1.613), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-0.9368, -3.238), (1.13, -2.275), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((0.6884, -3.487), (-0.2751, -1.42), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-1.13, -2.825), (0.9368, -1.862), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((1.102, -3.294), (0.1381, -1.228), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((-1.322, -2.412), (0.7441, -1.448), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  circle((0.057, -2.531), radius: 0.04939, fill: rgb("#000000"), stroke: none)
  content((0.095, -2.512), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffe3c7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$theta$]]])], anchor: "west")
  rect((-0.76, -3.072), (0.76, -2.027), stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10))
  content((5, -1.15), [#text(size: 9pt)[Chart $S$]])
  content((5, -1.55), [#text(size: 9pt)[$theta arrow.r.long.bar v_S( theta )$]])
  line((4.708, -2.686), (5.136, -2.842), (5.292, -2.414), (4.864, -2.258), close: true, fill: rgb("#ffe3c7"), stroke: none)
  line((3.967, -3.387), (4.747, -1.245), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((3.695, -2.803), (5.837, -3.583), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((4.396, -3.543), (5.176, -1.401), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((3.851, -2.374), (5.993, -3.154), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((4.824, -3.699), (5.604, -1.557), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((4.007, -1.946), (6.149, -2.726), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((5.253, -3.855), (6.033, -1.713), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  line((4.163, -1.517), (6.305, -2.297), stroke: (paint: rgb("#000066"), thickness: 0.4pt, miter-limit: 10))
  circle((5.057, -2.531), radius: 0.04939, fill: rgb("#000000"), stroke: none)
  content((5.095, -2.512), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffe3c7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$theta$]]])], anchor: "west")
  rect((4.24, -3.072), (5.76, -2.027), stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10))
  line((-5, -0.5556), (-5, -0.825), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  line((0, -0.5556), (0, -0.825), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  line((5, -0.5556), (5, -0.825), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  content((0, -4.25), [#box(width: 14.6cm, inset: (x: 0.1764cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Hilbert features + triangle repair: negative-type $d$ on all of $V$#linebreak()Same-parameter labels: $d(v_s( theta ),v_t( theta )) lt.eq "Cr"$#linebreak()$\|x-x'\|_1= tau$ in one chart: $d((s,x),(s,x')) lt.eq C tau (m"/"N)( log m)^2$]]])])
  line((-5, -3.175), (-5, -3.5), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  line((0, -3.175), (0, -3.5), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  line((5, -3.175), (5, -3.5), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  content((-3.9, -6.35), [#box(width: 6.803cm, inset: (x: 0.1764cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Large metric average#linebreak()First-chart law: $v_1( theta )$, $theta tilde.op upright("Unif") (T)$#linebreak()$bb(E) d(v_1( theta ),v_1( eta )) gt.eq "cm"$]]])])
  content((3.9, -6.35), [#box(width: 6.803cm, inset: (x: 0.1764cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Small average for every contraction#linebreak()All charts constrain the smoothed gradients#linebreak()$bb(E) \|F(v_1( theta ))-F(v_1( eta ))\|_1$#linebreak()$lt.eq C sqrt(m) ( log m)^(5"/"2)$]]])])
  line((-3.9, -5), (-3.9, -5.575), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  line((3.9, -5), (3.9, -5.575), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  content((0, -8.4), [#box(width: 14.6cm, inset: (x: 0.1764cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Uniform measure on copies; at least one copy of every vertex#linebreak()Copies of a vertex have distance zero. All original chart constraints survive.]]])])
  line((-3.9, -7.125), (-3.9, -7.853), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  line((3.9, -7.125), (3.9, -7.853), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
  content((0, -9.95), [#box(width: 14.6cm, inset: (x: 0.1764cm, y: 0.2117cm), radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Cut-cone duality: capacities with unit demand on every distinct pair#linebreak()$"OPT" (C) gt.eq 1$, $0< "GL" (C) lt.eq C_1( log m)^(5"/"2)"/"sqrt(m)$]]])])
  line((0, -8.947), (0, -9.394), stroke: (paint: rgb("#000073"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000073"))))
})],
  caption: [Figure 1: The construction and its two average-distance bounds. Each shaded region represents the cell of the same parameter $theta$ in one rounding partition. Actual cells are determined by all $N$ threshold families; only two directions are drawn schematically. Drawn lengths do not represent $d$, and same-parameter labels are $O \( r \)$ apart. First-chart averages use independent uniform $theta \, eta in T = \( - 1 \, 1 \)^m$; all charts constrain contractions. Arrows indicate construction or estimate dependencies. The final copies carry unit demands. ],
) <fig:construction>

===== 1.2.5 Conventions. <conventions.>

All logarithms are natural. Constants denoted by $c \, C > 0$ are absolute and may change from one occurrence to the next. We work with sufficiently large integers $m$. Euclidean and Hilbert norms are denoted by $\| dot.op \|$, and operator norms by $parallel dot.op parallel_(upright("op"))$. The notation $A lt.tilde B$ means $A lt.eq C B$ for an absolute constant. All maps into $ell_1$ used below have a finite, arbitrary target dimension, and all estimates are independent of that dimension.

== 2 Families of directions <dir:section>

The construction uses many linear images of the same parameter space. The directions defining each image must approximate a Gaussian transform, while most images must have small projections in any prescribed direction. Sampling Fourier features and controlling them on finite nets is a standard route to uniform kernel approximation #cite(label("RR07")). Here the same samples must also control derivative profiles and satisfy a majority-chart guarantee in every direction.

#thm([Lemma 1.])[
  #emph[There is an absolute constant $C$ such that, for every sufficiently large integer $m$, the following holds. Set $N = m^6$ and $S = m^3$. There are vectors $g_(s \, i) in bb(R)^m$, indexed by $1 lt.eq s lt.eq S$ and $1 lt.eq i lt.eq N$, with these properties:]
  + #emph[For every $s \, i$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ sqrt(m) / 2 lt.eq \| g_(s \, i) \| lt.eq 2 sqrt(m) . $ <dir:norms>]

 Within each family $s$, the vectors have pairwise nonparallel directions. Every eigenvalue of $N^(- 1) sum_(i = 1)^N g_(s \, i) g_(s \, i)^T$ belongs to $\[ 1 \/ 2 \, 2 \]$.]
  + #emph[For every $s$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ sup_(\| w \| lt.eq m^42) lr(|1 / N sum_(i = 1)^N g_(s \, i) sin chevron.l g_(s \, i) \, w chevron.r - w e^(- \| w \|^2 \/ 2)|) lt.eq 2 / sqrt(m) . $ <dir:gaussian-approximation>]

]
  + #emph[For every unit vector $v in bb(R)^m$, at least $S \/ 2$ of the indices $s$ satisfy 
#[#set math.equation(numbering: n => "(2.3)")
 $ max_(1 lt.eq i lt.eq N) \| chevron.l v \, g_(s \, i) chevron.r \| lt.eq C sqrt(log m) . $ <dir:good-charts>]

]
] <lem:directions>

Independent standard Gaussian vectors give such a family. The frequency net needed in the proof has $exp \( O \( m log m \) \)$ points, whereas the failure probability for each scalar empirical estimate is at most $exp \( - c m^4 \)$. A separate sphere net and independence across charts give the last assertion simultaneously for every unit direction. The full probabilistic argument appears in Appendix 7.

Fix one such family for the remainder of the proof. In particular, its every-direction guarantee is available before any contraction is chosen. Define

#[#set math.equation(numbering: n => "(2.4)")
 $ u_(s \, i) = g_(s \, i) / sqrt(m) \, #h(2em) J_s : bb(R)^m arrow.r bb(R)^N \, #h(2em) \( J_s theta \)_i = chevron.l u_(s \, i) \, theta chevron.r . $ <dir:chart-maps>]

The eigenvalues of $J_s^T J_s$ lie in $\[ N \/ \( 2 m \) \, 2 N \/ m \]$, so $J_s$ has full column rank. Its left pseudoinverse $J_s^(+) = \( J_s^T J_s \)^(- 1) J_s^T$ satisfies $J_s^(+) J_s = I_m$, and $J_s J_s^(+)$ is the orthogonal projection onto the range of $J_s$. We will use

#[#set math.equation(numbering: n => "(2.5)")
 $ parallel J_s parallel_(upright("op")) lt.eq sqrt(frac(2 N, m)) \, #h(2em) parallel J_s^(+) parallel_(upright("op")) lt.eq 2 sqrt(m / N) \, #h(2em) \| J_s^(+) e_i \| lt.eq frac(4 m, N) quad \( 1 lt.eq i lt.eq N \) \, $ <eq:pseudoinverse>]

where $e_i$ is the $i$th standard coordinate vector of $bb(R)^N$. The final bound follows from $J_s^(+) e_i = \( J_s^T J_s \)^(- 1) u_(s \, i)$, $parallel \( J_s^T J_s \)^(- 1) parallel_(upright("op")) lt.eq 2 m \/ N$, and $\| u_(s \, i) \| lt.eq 2$.

== 3 A Hilbert kernel with chart extensions <ker:sec>

Retain the directions, maps, and pseudoinverses from 1. We construct common Hilbert features on the parameter space and extend them to the rounded chart labels. Their squared distances will approximate Euclidean distance. We will control violations of the triangle inequalities both globally and in proportion to within-chart coordinate distance. These are the inputs for the metric construction in Section 4.

The parameters in this section are

#[#set math.equation(numbering: n => "(3.1)")
 $ a = m^(- 40) \, #h(2em) b = m^40 \, #h(2em) epsilon = m^(- 200) \, #h(2em) r = m^(- 8) \, #h(2em) tau = m^(- 2000) . $ <ker:parameters>]

The numerical exponents only enforce separation of scales. The cutoffs $a \, b$ approximate Euclidean distance; $epsilon$ controls the added Fourier components; $r$ is the tolerance for the angle repair; and $tau$ is small enough to absorb every polynomial norm bound below. All choices are fixed powers of $m$, which is essential for the vertex count.

=== 3.1 The common kernel <the-common-kernel>

The Gaussian block below produces the macroscopic Euclidean distance by integrating positive-definite Gaussian kernels over scales, as in the classical negative-type framework of Schoenberg #cite(label("Sch38")). The additional Fourier blocks have negligible distance contribution but will supply the coordinate profiles for the chart extensions.

Write $E \( t \) = \( cos t \, sin t \)$, and let $gamma_m$ be standard Gaussian measure on $bb(R)^m$. Define a map $p : bb(R)^m arrow.r cal(H)$ into the real Hilbert space

$ cal(H) = L_2 \( \[ a \, b \] times bb(R)^m \, d sigma thin d gamma_m \; bb(R)^2 \) xor xor.big_(s = 1)^S xor.big_(i = 1)^N L_2 \( \[ a \, b \] \, d sigma \/ sigma \; bb(R)^2 \) $

by assigning to $p \( theta \)$ the first component $m^(1 \/ 4) E \( chevron.l g \, theta chevron.r \/ sigma \)$ and the component $sqrt(epsilon) E \( chevron.l g_(s \, i) \, theta chevron.r \/ sigma \)$ in summand $\( s \, i \)$. The Gaussian characteristic function gives

#[#set math.equation(numbering: n => "(3.2)")
 $ chevron.l p \( theta \) \, p \( eta \) chevron.r & = sqrt(m) integral_a^b e^(- \| eta - theta \|^2 \/ \( 2 sigma^2 \)) thin d sigma\
 & quad + epsilon sum_(s = 1)^S sum_(i = 1)^N integral_a^b cos #h(-0.16667em) (frac(chevron.l g_(s \, i) \, eta - theta chevron.r, sigma)) frac(d sigma, sigma) . $ <eq:kernel>]

#thm([Lemma 2.])[
  (Approximation of Euclidean distance).  #emph[There is an absolute constant 
$ c_(*) = 2 integral_0^oo #scale(x: 120%, y: 120%)[\(] 1 - e^(- 1 \/ \( 2 t^2 \)) #scale(x: 120%, y: 120%)[\)] thin d t > 0 $

 such that, whenever $\| theta \| \, \| eta \| lt.eq 3 sqrt(m)$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ lr(|thin \| p \( theta \) - p \( eta \) \|^2 - c_(*) sqrt(m) thin \| theta - eta \| thin|) lt.eq m^(- 37) . $ <ker:distance>]

]
] <lem:kernel>

#proof[
  The integral defining $c_(*)$ converges: its integrand is bounded near zero and is at most $1 \/ \( 2 t^2 \)$ for $t gt.eq 1$. Scaling the integration variable shows that the first component of the squared distance, if integrated over all positive scales, would equal $c_(*) sqrt(m) thin \| theta - eta \|$. The omitted scales contribute at most
  $ 2 sqrt(m) thin a + frac(sqrt(m) thin \| theta - eta \|^2, b) lt.eq 2 sqrt(m) thin a + frac(36 m^(3 \/ 2), b) . $
  The squared distance in all the additional components is at most $4 epsilon S N log \( b \/ a \)$. Consequently the error is at most
  $ 2 m^(- 79 \/ 2) + 36 m^(- 77 \/ 2) + 320 m^(- 191) log m \, $
  which is at most $m^(- 37)$ for sufficiently large $m$. ◻
]

=== 3.2 Extensions with small coordinate profiles <extensions-with-small-coordinate-profiles>

The auxiliary components have amplitude $sqrt(epsilon)$, while the preliminary extension below has amplitude $epsilon^(- 1 \/ 2)$. Their inner products therefore retain full strength despite the negligible contribution to squared distances. We use this to extend the derivative of $p$ from each chart subspace with small coordinate profiles against all the common features. The extension must agree exactly with $D p$ along the chart subspace; its small pairings against $p \( eta \)$ will control the triangle inequalities after rounding. We keep separate polynomial bounds on ordinary Hilbert norms to control the rounding errors.

#thm([Lemma 3.])[
  (Chart derivatives).  #emph[For every $s$ there is a smooth map $A_s : bb(R)^m arrow.r cal(L) \( bb(R)^N \, cal(H) \)$ such that 
#[#set math.equation(numbering: n => "(3.4)")
 $ A_s \( theta \) J_s = D p \( theta \) . $ <ker:extension-identity>]

 For $\| theta \| \, \| eta \| lt.eq 3 sqrt(m)$ and $1 lt.eq i lt.eq N$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ \| chevron.l A_s \( theta \) e_i \, p \( eta \) chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq C m / N log m . $ <ker:profile>]

 Moreover, uniformly in $theta in bb(R)^m$ and $s$, 
#[#set math.equation(numbering: n => "(3.6)")
 $ \| p \( theta \) \| \, quad parallel D p \( theta \) parallel_(upright("op")) \, quad parallel D^2 p \( theta \) parallel_(upright("op")) \, quad parallel A_s \( theta \) parallel_(upright("op")) \, quad parallel D A_s \( theta \) parallel_(upright("op")) lt.eq m^300 . $ <ker:strong-bounds>]

 Here the norm of a second derivative or an operator-valued derivative is the corresponding multilinear operator norm.]
] <ker:extension>

#proof[
  We first identify the profile that the preliminary extension should reproduce. For $\| theta \| \, \| eta \| lt.eq 3 sqrt(m)$, put $w = \( eta - theta \) \/ sigma$. Differentiation in $theta$ of the Gaussian term in (3.2) gives the vector
  $ sqrt(m) integral_a^b w e^(- \| w \|^2 \/ 2) thin frac(d sigma, sigma) . $
  The empirical approximation in 1 suggests replacing $w e^(- \| w \|^2 \/ 2)$ by $N^(- 1) sum_i g_(s \, i) sin chevron.l g_(s \, i) \, w chevron.r$. We realize this profile using the auxiliary Fourier components. Define $A_s^0 \( theta \) e_i$ to be supported in summand $\( s \, i \)$ of $cal(H)$, where it is the function
  $ m / N epsilon^(- 1 \/ 2) E' #h(-0.16667em) (frac(chevron.l g_(s \, i) \, theta chevron.r, sigma)) . $
  Its profile is
  #[#set math.equation(numbering: n => "(3.7)")
   $ chevron.l A_s^0 \( theta \) e_i \, p \( eta \) chevron.r = m / N integral_a^b sin chevron.l g_(s \, i) \, w chevron.r thin frac(d sigma, sigma) . $ <ker:initial-profile>]
  Since $u_(s \, i) = g_(s \, i) \/ sqrt(m)$, the profile of $A_s^0 J_s$ is represented by the vector
  $ sqrt(m) integral_a^b (1 / N sum_(i = 1)^N g_(s \, i) sin chevron.l g_(s \, i) \, w chevron.r) frac(d sigma, sigma) . $
  Thus $A_s^0 J_s$ has the intended empirical profile. Set $R_s = D p - A_s^0 J_s$; we now bound its pairings against the common features before correcting the extension on the chart subspace. For the parameters under consideration, $\| w \| lt.eq 6 sqrt(m) \/ a < m^42$. Thus 1 bounds the difference between these vectors by $2 log \( b \/ a \)$. The gradient of the second term of (3.2) has norm at most
  $ epsilon sum_(t = 1)^S sum_(i = 1)^N \| g_(t \, i) \| integral_a^b frac(d sigma, sigma^2) lt.eq frac(2 epsilon S N sqrt(m), a) lt.eq 1 . $
  It follows that
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| chevron.l R_s \( theta \) v \, p \( eta \) chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq C \( log m \) \| v \| . $ <ker:residual-profile>]
  Now define
  #[#set math.equation(numbering: n => "(3.9)")
   $ A_s = A_s^0 + R_s J_s^(+) = A_s^0 \( I - J_s J_s^(+) \) + D p thin J_s^(+) . $ <ker:A-definition>]
  The identity $J_s^(+) J_s = I$ proves (3.4). Combining (3.7), (3.8), and the column bound $\| J_s^(+) e_i \| lt.eq 4 m \/ N$ from (2.5) proves (3.5).
  For completeness, the required Hilbert norm bounds have ample polynomial slack. Differentiation under the Hilbert space formulas is valid to every order, because $a > 0$ and Gaussian moments of every order are finite. For $j = 0 \, 1 \, 2$, the squared multilinear derivative norm of the first component of $p$ is at most
  $ sqrt(m) thin b thin a^(- 2 j) bb(E) \| G \|^(2 j) \, $
  and that of all the additional components together is at most
  $ epsilon S N log \( b \/ a \) (frac(2 sqrt(m), a))^(2 j) . $
  Using $bb(E) \| G \|^2 = m$ and $bb(E) \| G \|^4 = m \( m + 2 \)$, these estimates give $parallel D^j p parallel_(upright("op")) lt.eq m^110$ for $0 lt.eq j lt.eq 2$. Bounding an operator by $sqrt(N)$ times its largest column norm gives
  $ parallel A_s^0 parallel_(upright("op")) lt.eq sqrt(N) thin m / N epsilon^(- 1 \/ 2) sqrt(log \( b \/ a \)) \, #h(2em) parallel D A_s^0 parallel_(upright("op")) lt.eq sqrt(N) thin m / N epsilon^(- 1 \/ 2) sqrt(log \( b \/ a \)) frac(2 sqrt(m), a) . $
  In particular, these two quantities are at most $m^110$ and $m^150$, respectively. Substitute these bounds in (3.9), together with $R_s = D p - A_s^0 J_s$, its derivative, and $parallel J_s parallel_(upright("op")) lt.eq 2 sqrt(N)$ and $parallel J_s^(+) parallel_(upright("op")) lt.eq 2 sqrt(m \/ N)$. The projection $I - J_s J_s^(+)$ has norm at most one; the last expression in (3.9) and its derivative therefore bound all five quantities in (3.6) by $m^300$ for sufficiently large $m$. ◻
]

=== 3.3 Rounded charts and their angles <rounded-charts-and-their-angles>

Let $Q_s = I - J_s J_s^(+)$, the orthogonal projection perpendicular to the image of $J_s$. Define

#[#set math.equation(numbering: n => "(3.10)")
 $ P_s \( x \) = p \( J_s^(+) x \) + A_s \( J_s^(+) x \) Q_s x \, #h(2em) x in bb(R)^N . $ <ker:P-definition>]

On the chart subspace this gives $P_s \( J_s theta \) = p \( theta \)$ and $D P_s \( J_s theta \) = A_s \( theta \)$: use $Q_s J_s = 0$ and (3.4). We use only values very close to that subspace; the derivative away from it is computed explicitly below. Let $U = \( - 2 \, 2 \)^m$, and for $theta in U$ put

#[#set math.equation(numbering: n => "(3.11)")
 $ X_s \( theta \)_i = tau ⌊frac(chevron.l u_(s \, i) \, theta chevron.r, tau)⌋ . $ <ker:rounding>]

In each chart, discard the threshold hyperplanes $chevron.l u_(s \, i) \, theta chevron.r = k tau$, $k in bb(Z)$; their union has Lebesgue measure zero. Define the finite set

#[#set math.equation(numbering: n => "(3.12)")
 $ V = { \( s \, X_s \( theta \) \) : 1 lt.eq s lt.eq S \, med theta in U upright(" off the threshold hyperplanes of chart ") s } . $ <ker:vertices>]

Write $v_s \( theta \) = \( s \, X_s \( theta \) \)$ whenever this is defined, and $P_v = P_s \( x \)$ for $v = \( s \, x \) in V$.

For any Hilbert vectors $Z_v$, their squared distances satisfy all triangle inequalities exactly when

#[#set math.equation(numbering: n => "(3.13)")
 $ chevron.l Z_v - Z_z \, Z_y - Z_z chevron.r gt.eq 0 #h(2em) \( v \, y \, z in V \) . $ <rep:eq:angle>]

We next bound how far the vectors $P_v$ can violate this condition.

#thm([Lemma 4.])[
  (Two angle estimates).  #emph[For sufficiently large $m$, all $v \, z \, y in V$ satisfy 
#[#set math.equation(numbering: n => "(3.14)")
 $ chevron.l P_v - P_z \, P_y - P_z chevron.r gt.eq - r . $ <ker:global-angle>]

 There is an absolute constant $C_0$ such that, with $L = C_0 log m$, for $v = \( s \, x \)$ and $z = \( s \, x' \)$ in the same chart and every $y in V$, 
#[#set math.equation(numbering: n => "(3.15)")
 $ \| chevron.l P_v - P_z \, P_y - P_z chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq L m / N parallel x - x' parallel_1 . $ <ker:local-angle>]

 Moreover, for all defined $v_s \( theta \) \, v_t \( eta \)$, 
#[#set math.equation(numbering: n => "(3.16)")
 $ lr(|thin \| P_(v_s \( theta \)) - P_(v_t \( eta \)) \|^2 - c_(*) sqrt(m) thin \| theta - eta \| thin|) lt.eq m^(- 37) + m^610 tau lt.eq r \/ 10 . $ <ker:rounded-distance>]

]
] <ker:angles>

#proof[
  For $x = X_s \( theta \)$, rounding and (2.5) give
  #[#set math.equation(numbering: n => "(3.17)")
   $ \| x - J_s theta \| lt.eq sqrt(N) tau \, #h(2em) \| J_s^(+) x - theta \| lt.eq 2 sqrt(m) tau \, #h(2em) \| Q_s x \| lt.eq sqrt(N) tau . $ <ker:rounding-errors>]
  In particular, $\| J_s^(+) x \| lt.eq 3 sqrt(m)$. By (3.6) and (3.10),
  #[#set math.equation(numbering: n => "(3.18)")
   $ \| P_(v_s \( theta \)) - p \( theta \) \| lt.eq m^300 \( 2 sqrt(m) + sqrt(N) \) tau lt.eq m^305 tau . $ <ker:feature-error>]
  The change in a squared distance caused by the two errors in (3.18) is at most $m^610 tau$, since $\| p \( theta \) \| lt.eq m^300$. Therefore 2 gives (3.16); its last inequality follows directly from (3.1).
  Choose parameter representatives in $U$ for $v \, z \, y$. Apply (3.16) to their three pairs and use
  $ 2 chevron.l P_v - P_z \, P_y - P_z chevron.r = \| P_v - P_z \|^2 + \| P_y - P_z \|^2 - \| P_v - P_y \|^2 . $
  The corresponding expression for the ordinary Euclidean distances of the three representatives is nonnegative by the triangle inequality. The total error is at most $3 r \/ 10$, proving (3.14).
  For the local estimate, we integrate coordinate profiles so that the bound scales with $parallel x - x' parallel_1$. Consider the segment joining $x$ to $x'$. Every point $xi$ on this segment satisfies $\| Q_s xi \| lt.eq sqrt(N) tau$ and $\| J_s^(+) xi \| lt.eq 3 sqrt(m)$, by convexity and (3.17). Differentiating (3.10) and using (3.4) gives the exact identity
  #[#set math.equation(numbering: n => "(3.19)")
   $ D P_s \( xi \) h = A_s \( J_s^(+) xi \) h + D A_s \( J_s^(+) xi \) \[ J_s^(+) h \] Q_s xi . $ <ker:DP-identity>]
  The operator norm of the second term is at most $2 m^300 sqrt(m) tau lt.eq m^305 tau$. For a vertex $y = v_t \( eta \)$, replace $P_y$ by $p \( eta \)$ using (3.18). Equations (3.5) and (3.6) then imply, throughout this segment,
  $ \| chevron.l D P_s \( xi \) e_i \, P_y chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq C m / N log m + 3 m^605 tau lt.eq C' m / N log m . $
  The same bound holds with $P_z$ in place of $P_y$. Integrating (3.19) along the segment and summing the absolute coordinate increments proves (3.15) after choosing a sufficiently large absolute $C_0$. ◻
]

== 4 The finite negative-type semimetric <sec:repair>

The vectors $P_v$ from 4 have the desired macroscopic distances. Their inner products in (3.13) can still be negative, but the lemma bounds their negative parts both by $r$ and by a quantity proportional to within-chart coordinate distance. We complete the construction by appending a Hilbert correction that compensates the smaller of these bounds. A correction controlled only by $r$ could dominate the cost of crossing an individual cell interface.

The following lemma corrects violations of (3.13) while preserving small distances up to a logarithmic loss. We state it for arbitrary chartwise $ell_1$ distances so that the required local and global bounds are explicit.

#thm([Lemma 5.])[
  (Triangle repair).  #emph[Let a finite set $V$ be partitioned into charts. In each chart let $delta$ be a nonnegative multiple of an $ell_1$ distance, and set $delta \( v \, w \) = oo$ for points in different charts. Suppose that $r > 0$ and Hilbert vectors $P_v$ satisfy 
#[#set math.equation(numbering: n => "(4.1)")
 $ chevron.l P_v - P_z \, P_y - P_z chevron.r gt.eq - min { r \, delta \( v \, z \) \, delta \( y \, z \) } #h(2em) \( v \, y \, z in V \) . $ <rep:eq:hypothesis>]

 Then there are Hilbert vectors $q_v$ such that 
$ d \( v \, w \) = \| P_v - P_w \|^2 + \| q_v - q_w \|^2 $

 is a negative-type semimetric. They satisfy 
#[#set math.equation(numbering: n => "(4.2)")
 $ \| q_v - q_w \|^2 = 8 integral_0^r #scale(x: 120%, y: 120%)[\(] 1 - e^(- delta \( v \, w \) \/ l) #scale(x: 120%, y: 120%)[\)] thin d l lt.eq 8 r . $ <rep:eq:distance>]

 If $0 < delta \( v \, w \) lt.eq r$, then 
#[#set math.equation(numbering: n => "(4.3)")
 $ \| q_v - q_w \|^2 lt.eq 8 delta \( v \, w \) (1 + log frac(r, delta \( v \, w \))) . $ <rep:eq:local>]

 If $delta \( v \, w \) = 0$, then $q_v = q_w$.]
] <lem:repair>

#proof[
  We use the convention $e^(- oo) = 0$. Define a Gram matrix by
  #[#set math.equation(numbering: n => "(4.4)")
   $ chevron.l q_v \, q_w chevron.r = 4 integral_0^r e^(- delta \( v \, w \) \/ l) thin d l . $ <rep:eq:gram>]
  This matrix is positive semidefinite. Indeed, in one coordinate the map $t mapsto upright(bold(1))_(\[ b \, t \])$ into $L_2$ has squared distance $\| t - t' \|$, where $b$ is a fixed lower bound on the finitely many coordinate values. Direct sums and scaling show that an $ell_1$ distance is squared Hilbertian. For finitely many Hilbert vectors $h_v$, the kernel
  $ e^(- \| h_v - h_w \|^2 \/ l) = bb(E) cos #h(-0.16667em) (sqrt(2 \/ l) thin chevron.l G \, h_v - h_w chevron.r) $
  is positive semidefinite: $G$ is a standard Gaussian in their finite linear span, and the cosine is the inner product of the corresponding $\( cos \, sin \)$ pairs. This is the Gaussian-kernel criterion of Schoenberg #cite(label("Sch38")), here in its elementary finite form. The kernels in (4.4) are block diagonal across charts; integration preserves positive semidefiniteness. Thus the specified Gram matrix has a Hilbert realization.
  The extended distance $delta$ satisfies the triangle inequality, including triples meeting different charts. Consequently, for $a = delta \( v \, z \)$ and $b = delta \( y \, z \)$,
  $ 1 - e^(- a \/ l) - e^(- b \/ l) + e^(- delta \( v \, y \) \/ l) & gt.eq 1 - e^(- a \/ l) - e^(- b \/ l) + e^(- \( a + b \) \/ l)\
 & = \( 1 - e^(- a \/ l) \) \( 1 - e^(- b \/ l) \) . $
  For $t = min { r \, a \, b }$, this product is at least $\( 1 - e^(- 1) \)^2$ when $0 < l < t$. Equation (4.4) therefore gives
  $ chevron.l q_v - q_z \, q_y - q_z chevron.r gt.eq 4 \( 1 - e^(- 1) \)^2 t gt.eq t . $
  Together with (4.1), this proves (3.13) for $Z_v = \( P_v \, q_v \)$.
  The diagonal entries of (4.4) are $4 r$, which proves (4.2). Finally, $1 - e^(- s) lt.eq min { 1 \, s }$ and
  $ integral_0^r min { 1 \, t \/ l } thin d l = t #scale(x: 120%, y: 120%)[\(] 1 + log \( r \/ t \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( 0 < t lt.eq r \) $
  give (4.3). The assertion at distance zero follows directly from (4.2). ◻
]

We now apply 5 to the rounded labels of 4. The following proposition collects the metric properties needed for the contraction and duality arguments.

#thm([Proposition 1.])[
  #emph[For every sufficiently large integer $m$, the vertex set $V$ in (3.12) admits a negative-type semimetric $d$ with the following properties. Its chart maps $v_s \( theta \)$, defined almost everywhere on $U = \( - 2 \, 2 \)^m$, satisfy 
#[#set math.equation(numbering: n => "(4.5)")
 $ lr(|d \( v_s \( theta \) \, v_t \( eta \) \) - c_(*) sqrt(m) thin \| theta - eta \||) lt.eq C r #h(2em) \( theta \, eta in U \) $ <met:eq:macro>]

 whenever the labels are defined, where $r = m^(- 8)$. For labels in the same chart, 
#[#set math.equation(numbering: n => "(4.6)")
 $ parallel x - x' parallel_1 = tau quad arrow.r.double quad d \( \( s \, x \) \, \( s \, x' \) \) lt.eq C tau m / N \( log m \)^2 . $ <met:eq:adjacent>]

 Moreover, 
#[#set math.equation(numbering: n => "(4.7)")
 $ \| V \| lt.eq exp \( C m log m \) \, #h(2em) "diam" \( V \, d \) lt.eq C m \, $ <met:eq:size-diameter>]

 and, for independent uniform $theta \, eta in T = \( - 1 \, 1 \)^m$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E) d \( v_1 \( theta \) \, v_1 \( eta \) \) gt.eq c m . $ <met:eq:average>]

 Here $N = m^6$, $tau = m^(- 2000)$, and all constants are absolute.]
] <prop:metric>

#proof[
  Let $P_v$ and $L = C_0 log m$ be as in 4. Within a chart set
  $ delta \( \( s \, x \) \, \( s \, x' \) \) = L m / N parallel x - x' parallel_1 \, $
  and put $delta = oo$ between different charts. Equation (3.14) bounds every $P$-angle below by $- r$. Equation (3.15) also bounds it below by $- delta \( v \, z \)$ whenever $v \, z$ are in the same chart, and by $- delta \( y \, z \)$ whenever $y \, z$ are in the same chart, after swapping the two arguments of the inner product. Thus the hypothesis of 5 holds. Use its vectors $q_v$ and set
  #[#set math.equation(numbering: n => "(4.9)")
   $ d \( v \, w \) = \| \( P_v \, q_v \) - \( P_w \, q_w \) \|^2 . $ <met:eq:definition>]
  This is a negative-type semimetric. The bound $\| q_v - q_w \|^2 lt.eq 8 r$ and (3.16) prove (4.5).
  Taking $y = v$ in (3.15) gives $\| P_v - P_z \|^2 lt.eq delta \( v \, z \)$. If $parallel x - x' parallel_1 = tau$, then
  $ delta = C_0 tau \( m \/ N \) log m < r \, #h(2em) log \( r \/ delta \) = 1997 log m - log \( C_0 log m \) = O \( log m \) . $
  Equation (4.3) now proves (4.6).
  We next count the rounded labels. Since $\| u_(s \, i) \| lt.eq 2$, a hyperplane $chevron.l u_(s \, i) \, theta chevron.r = k tau$ meeting $U$ has $\| k tau \| < 4 sqrt(m)$. Hence at most
  $ H lt.eq N \( 1 + 8 sqrt(m) \/ tau \) $
  threshold hyperplanes meet $U$ in a chart. An arrangement of $H$ hyperplanes in $bb(R)^m$ has at most $sum_(j = 0)^m binom(H, j)$ full-dimensional regions (see #cite(label("Zas75"))). This follows by induction: an added hyperplane creates at most as many new regions as the preceding hyperplanes cut out on it. The labels are constant on the regions, and their intersections with the convex cube $U$ are connected. Therefore
  $ \| V \| lt.eq S sum_(j = 0)^m binom(H, j) lt.eq exp \( C m log m \) \, $
  because $H$ is bounded by a fixed power of $m$. The diameter bound in (4.7) follows from (4.5) and $"diam" \( U \) = 4 sqrt(m)$.
  Finally, for independent uniform parameters on $T$,
  $ bb(E) \| theta - eta \|^2 = frac(2 m, 3) \, #h(2em) \| theta - eta \| lt.eq 2 sqrt(m) . $
  It follows that $bb(E) \| theta - eta \| gt.eq sqrt(m) \/ 3$. Equation (4.5) gives $bb(E) d \( v_1 \( theta \) \, v_1 \( eta \) \) gt.eq c_(*) m \/ 3 - C r$, proving (4.8) for sufficiently large $m$. ◻
]

The macroscopic comparison (4.5) does not make the interface constraints redundant: its additive error $O \( r \) = O \( m^(- 8) \)$ is far larger than the interface bound $O \( m^(- 2005) \( log m \)^2 \)$ in (4.6). The next section uses these much smaller interface distances to constrain every contraction.

== 5 Contractions into $ell_1$ <sec:contraction>

The small jumps in every chart force small average variation in $ell_1$. Throughout this section, scalar gradients carry the Euclidean norm.

#thm([Proposition 2.])[
  (Contraction bound).  #emph[Let $\( V \, d \)$ and the chart maps $v_s : U arrow.r V$ be those of 1, where $U = \( - 2 \, 2 \)^m$, $1 lt.eq s lt.eq S = m^3$, and $N = m^6$. There is an absolute constant $C$ such that every map $F : V arrow.r ell_1^D$, for every finite $D$, satisfying 
$ parallel F \( v \) - F \( w \) parallel_1 lt.eq d \( v \, w \) #h(2em) \( v \, w in V \) $

 obeys 
#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E)_(theta \, eta in T) parallel F \( v_1 \( theta \) \) - F \( v_1 \( eta \) \) parallel_1 lt.eq C sqrt(m) thin \( log m \)^(5 \/ 2) \, $ <con:eq:contraction>]

 where $T = \( - 1 \, 1 \)^m$ and the two parameters are independent and uniform.]
] <prop:contraction>

After smoothing, each gradient is a combination of chart normals. The jump bounds give a total coefficient budget $C m \( log m \)^2$, while the good-chart property contributes the factor $C sqrt(\( log m \) \/ m)$. We then use the following scalar inequality to pass from gradients to average distances without a further dimension factor.

#thm([Lemma 6.])[
  (First-moment inequality on a cube).  #emph[Let $T = \( - 1 \, 1 \)^m$, and let $h$ be a real-valued $C^1$ function on a neighborhood of $overline(T)$. If $theta \, eta$ are independent and uniform on $T$, then 
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E) \| h \( theta \) - h \( eta \) \| lt.eq bb(E) \| nabla h \( theta \) \| . $ <con:eq:cube>]

]
] <con:lem:cube>

We use the Gaussian rotation argument of Maurey and Pisier #cite(label("Pis86")), followed by the coordinatewise Gaussian distribution function.

#proof[
  Write $Phi$ for the standard Gaussian distribution function, set $psi \( t \) = 2 Phi \( t \) - 1$, and let $Psi : bb(R)^m arrow.r T$ apply $psi$ coordinatewise. If $G \, G'$ are independent standard Gaussian vectors in $bb(R)^m$, then $Psi \( G \) \, Psi \( G' \)$ are independent and uniform on $T$. For $0 lt.eq t lt.eq pi \/ 2$, put
  $ Y \( t \) = cos \( t \) G + sin \( t \) G' \, #h(2em) Y' \( t \) = - sin \( t \) G + cos \( t \) G' . $
  At each fixed time, $Y \( t \)$ and $Y' \( t \)$ are independent standard Gaussian vectors. Consequently, conditioning on $Y \( t \)$ gives
  $ bb(E) [lr(|frac(d, d t) h \( Psi \( Y \( t \) \) \)|) thin mid(bar.v) thin Y \( t \)] & = sqrt(2 / pi) thin lr(|D Psi \( Y \( t \) \)^T nabla h \( Psi \( Y \( t \) \) \)|)\
 & lt.eq 2 / pi thin \| nabla h \( Psi \( Y \( t \) \) \) \| \, $
  because $sup \| psi' \| = sqrt(2 \/ pi)$. The fundamental theorem of calculus, followed by Tonelli’s theorem, bounds the expected difference between the endpoints by the integral of the expected absolute derivative. The distribution of $Psi \( Y \( t \) \)$ is uniform on $T$ for every $t$, so integration over $\[ 0 \, pi \/ 2 \]$ proves (5.2). All the integrands are integrable: $nabla h$ is bounded on $overline(T)$, and Gaussian vectors have finite first moments. ◻
]

#proof[
  We use $r = m^(- 8)$ and $tau = m^(- 2000)$ as in 1. For each chart, define
  $ f_s \( theta \) = F \( v_s \( theta \) \) quad upright("for almost every ") theta in U \, $
  and extend $f_s$ by zero outside $U$. Set $f_s = 0$ also on the threshold hyperplanes and on $partial U$. These are bounded, compactly supported functions because $V$ is finite. The macroscopic estimate in 1 implies
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel f_s \( theta \) - f_1 \( theta \) parallel_1 & lt.eq C r \, &  & upright("for almost every ") theta in U \,\
parallel f_s \( theta \) - f_s \( eta \) parallel_1 & lt.eq c_(*) sqrt(m) thin \| theta - eta \| + C r \, &  & upright("off the threshold hyperplanes in ") U . $ <con:eq:chart-close>]
  ===== 5.1 Smoothing. <smoothing.>
  Fix an even, nonnegative function $rho in C_c^oo \( \( - 1 \, 1 \) \)$ with $integral_(bb(R)) rho = 1$. Set $lambda = m^(- 2)$ and
  $ kappa_lambda \( z \) = product_(j = 1)^m lambda^(- 1) rho \( z_j \/ lambda \) \, #h(2em) H_s = f_s * kappa_lambda . $
  The functions $H_s : bb(R)^m arrow.r bb(R)^D$ are smooth. For sufficiently large $m$, the support of $x mapsto kappa_lambda \( theta - x \)$ lies in $U$ whenever $theta in overline(T)$. Also
  $ integral_(bb(R)^m) \| partial_j kappa_lambda \| = lambda^(- 1) parallel rho' parallel_(L_1 \( bb(R) \)) . $
  Every displacement in the support of $kappa_lambda$ has Euclidean norm at most $sqrt(m) lambda$. Thus (5.3) gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ parallel H_s \( theta \) - f_s \( theta \) parallel_1 lt.eq C \( m lambda + r \) quad upright("for almost every ") theta in T . $ <con:eq:smoothing-error>]
  Since $f_s - f_1$ vanishes outside $U$, (5.3) bounds its $ell_1$ norm by $C r$ almost everywhere on $bb(R)^m$. Differentiating the convolution therefore yields, for every $theta in T$ and every $j$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ parallel partial_j H_s \( theta \) - partial_j H_1 \( theta \) parallel_1 lt.eq C r \/ lambda . $ <con:eq:derivative-mismatch>]
  ===== 5.2 The derivative carried by each family of interfaces. <the-derivative-carried-by-each-family-of-interfaces.>
  Fix a chart $s$ and abbreviate $u_i = u_(s \, i)$. Its interfaces are contained in the hyperplanes
  $ Q_(i \, k) = { x in bb(R)^m : chevron.l u_i \, x chevron.r = k tau } \, #h(2em) 1 lt.eq i lt.eq N \, quad k in bb(Z) . $
  Only finitely many of these hyperplanes meet $U$. At almost every point of $Q_(i \, k) ∩ U$, let $Delta_(i \, k) \( x \) in bb(R)^D$ denote the value of $f_s$ on the side of increasing $chevron.l u_i \, x chevron.r$ minus its value on the opposite side. This is well-defined away from intersections with the other interface hyperplanes. By the nonparallelism in 1, those intersections have zero $\( m - 1 \)$-dimensional measure. The two labels at such an interface differ by $tau e_i$, so the adjacent-label estimate in 1 gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel Delta_(i \, k) \( x \) parallel_1 lt.eq C tau m / N \( log m \)^2 quad upright("for almost every ") x in Q_(i \, k) ∩ U . $ <con:eq:jump-bound>]
  For completeness, the distributional gradient of each scalar component of $f_s$ on $U$ is the vector-valued measure
  #[#set math.equation(numbering: n => "(5.7)")
   $ D f_(s \, alpha) = sum_(i \, k) frac(u_i, \| u_i \|) thin Delta_(i \, k \, alpha) thin cal(H)^(m - 1) #h(-0.16667em) harpoon.tr \( Q_(i \, k) ∩ U \) . $ <con:eq:distributional-gradient>]
  Indeed, test against a smooth function compactly supported in $U$ and integrate by parts on each polyhedral cell. The cell interiors contribute nothing because $f_s$ is constant there. The two contributions on each shared facet combine into the jump times the unit normal $u_i \/ \| u_i \|$; lower-dimensional intersections have zero facet measure. The test function vanishes near $partial U$, so there is no contribution from the outer boundary.
  For $theta in T$, the kernel $kappa_lambda \( theta - dot.op \)$ is a smooth test function compactly supported in $U$. Convolving (5.7) with this kernel gives, for every component $alpha$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ nabla H_(s \, alpha) \( theta \) = sum_(i = 1)^N u_(s \, i) thin b_(s \, i \, alpha) \( theta \) \, $ <con:eq:gradient-representation>]
  where the vector coefficient $b_(s \, i) \( theta \) in bb(R)^D$ is
  #[#set math.equation(numbering: n => "(5.9)")
   $ b_(s \, i) \( theta \) = frac(1, \| u_(s \, i) \|) sum_(k in bb(Z)) integral_(Q_(i \, k) ∩ U) kappa_lambda \( theta - x \) Delta_(i \, k) \( x \) thin d cal(H)^(m - 1) \( x \) . $ <con:eq:coefficient-formula>]
  This identity holds at every $theta in T$: distributional convolution agrees with the classical derivative of the smooth function $H_s$.
  We claim that the coefficients satisfy the pointwise budget
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_(alpha = 1)^D \| b_(s \, i \, alpha) \( theta \) \| lt.eq C m / N \( log m \)^2 #h(2em) \( theta in T \) . $ <con:eq:coefficient-budget>]
  To establish it, fix $u = u_(s \, i)$ and $theta$, and let $Z$ have density $x mapsto kappa_lambda \( theta - x \)$. Write $h$ for the density of the real random variable $chevron.l u \, Z chevron.r$. The coarea formula for this linear functional states that
  $ h \( t \) = frac(1, \| u \|) integral_(chevron.l u \, x chevron.r = t) kappa_lambda \( theta - x \) thin d cal(H)^(m - 1) \( x \) . $
  The lower bound $\| u \| gt.eq 1 \/ 2$ in 1 supplies a coordinate $j$ with $\| u_j \| gt.eq 1 \/ \( 2 sqrt(m) \)$. Conditional on the other coordinates of $Z$, the variable $chevron.l u \, Z chevron.r$ has a translated, possibly reflected copy of the one-dimensional density $rho$, scaled by $lambda \| u_j \|$. Its derivative has $L_1$ norm $parallel rho' parallel_(L_1) \/ \( lambda \| u_j \| \)$. Taking the mixture over the other coordinates shows that $h$ is continuously differentiable, compactly supported, and satisfies
  #[#set math.equation(numbering: n => "(5.11)")
   $ integral_(bb(R)) \| h' \( t \) \| thin d t lt.eq C sqrt(m) \/ lambda . $ <con:eq:density-variation>]
  For any nonnegative, continuously differentiable, compactly supported density $h$, comparison on each interval $\[ k tau \, \( k + 1 \) tau \]$ gives
  $ tau h \( k tau \) lt.eq integral_(k tau)^(\( k + 1 \) tau) h \( t \) thin d t + tau integral_(k tau)^(\( k + 1 \) tau) \| h' \( t \) \| thin d t . $
  Summing and using (5.11), we obtain
  #[#set math.equation(numbering: n => "(5.12)")
   $ tau sum_(k in bb(Z)) h \( k tau \) lt.eq 1 + C tau sqrt(m) \/ lambda lt.eq 2 $ <con:eq:lattice-bound>]
  for all sufficiently large $m$. Because the convolution kernel is nonnegative and is supported inside $U$, the triangle inequality in (5.9), followed by (5.6) and (5.12), proves (5.10).
  ===== 5.3 Combining the charts. <combining-the-charts.>
  Fix $theta in T$ and a component $alpha$, and put $a_alpha = nabla H_(1 \, alpha) \( theta \)$. If $a_alpha eq.not 0$, the direction property in 1 gives at least $S \/ 2$ charts $s$ such that
  $ max_i lr(|⟨frac(a_alpha, \| a_alpha \|) \, u_(s \, i)⟩|) lt.eq C sqrt(frac(log m, m)) . $
  For each such chart, (5.8) implies
  $ \| a_alpha \| lt.eq C sqrt(frac(log m, m)) sum_i \| b_(s \, i \, alpha) \( theta \) \| + \| nabla H_(s \, alpha) \( theta \) - a_alpha \| . $
  All terms on the right are nonnegative. Summing over the good charts and then enlarging that sum to all charts therefore gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ \| a_alpha \| lt.eq 2 / S sum_(s = 1)^S (C sqrt(frac(log m, m)) sum_i \| b_(s \, i \, alpha) \( theta \) \| + \| nabla H_(s \, alpha) \( theta \) - a_alpha \|) . $ <con:eq:good-chart-average>]
  For $a_alpha = 0$ the same inequality holds trivially. The good charts may depend on $alpha$ and $theta$; (5.13) removes that dependence before we sum over components.
  For each $s$, the Euclidean norm is at most the sum of absolute coordinates, so (5.5) gives
  $ sum_(alpha = 1)^D \| nabla H_(s \, alpha) \( theta \) - nabla H_(1 \, alpha) \( theta \) \| lt.eq sum_(j = 1)^m parallel partial_j H_s \( theta \) - partial_j H_1 \( theta \) parallel_1 lt.eq C m r \/ lambda . $
  Sum (5.13) over $alpha$ and apply this bound and (5.10). We obtain at every $theta in T$
  #[#set math.equation(numbering: n => "(5.14)")
   $ sum_(alpha = 1)^D \| nabla H_(1 \, alpha) \( theta \) \| & lt.eq C sqrt(frac(log m, m)) thin N m / N \( log m \)^2 + C m r \/ lambda\
 & lt.eq C sqrt(m) thin \( log m \)^(5 \/ 2) \, $ <con:eq:total-gradient>]
  where $m r \/ lambda = m^(- 5)$.
  Finally, apply 6 to every component of $H_1$ and sum. Equation (5.14) yields
  $ bb(E)_(theta \, eta in T) parallel H_1 \( theta \) - H_1 \( eta \) parallel_1 lt.eq C sqrt(m) thin \( log m \)^(5 \/ 2) . $
  The expected distance for $f_1$ exceeds this by at most $2 C \( m lambda + r \)$, by (5.4). Since $m lambda = m^(- 1)$, this additional term is absorbed into the same bound. The definition of $f_1$ now proves (5.1). ◻
]

== 6 Exactly uniform demands <sec:reduction>

We finish by converting the metric obstruction into capacities with unit demand on every unordered pair. We first record the precise duality statement, allowing distinct points to have distance zero. This is the average-distortion form of the cut/embedding correspondence #cite(label("LLR95")) Section 4#cite(label("Rab08")) Section 1.3; the explicit programs below keep the unit-demand normalization visible.

#thm([Lemma 7.])[
  (Cut-cone duality).  #emph[Let $d$ be a semimetric on $\[ n \]$, where $n gt.eq 2$, that satisfies the triangle inequalities and is a squared Hilbert distance. Suppose that $a \, b > 0$ satisfy 
#[#set math.equation(numbering: n => "(6.1)")
 $ 1 / n^2 sum_(i \, j = 1)^n d \( i \, j \) gt.eq a \, #h(2em) 1 / n^2 sum_(i \, j = 1)^n parallel F \( i \) - F \( j \) parallel_1 lt.eq b $ <red:averages>]

 for every map $F$ into a finite-dimensional $ell_1$ space such that $parallel F \( i \) - F \( j \) parallel_1 lt.eq d \( i \, j \)$ for all $i \, j$. Then there are nonnegative capacities $c_(i j)$ on unordered pairs of distinct vertices such that, with demand exactly one on every pair, 
#[#set math.equation(numbering: n => "(6.2)")
 $ "OPT" \( C \) gt.eq 1 \, #h(2em) 0 < "GL" \( C \) lt.eq b / a . $ <red:gap-lemma>]

]
] <lem:duality>

#proof[
  Let $cal(S)$ be the finite collection of nonempty proper subsets of $\[ n \]$. For $S in cal(S)$, write $delta_S \( i \, j \) = \| upright(bold(1))_S \( i \) - upright(bold(1))_S \( j \) \|$. Consider the finite linear program.#footnote[Matoušek and Rabinovich #cite(label("MR01")) study the related convex hull of individually dominated line metrics. Here the cut coefficients are arbitrary nonnegative numbers; only their sum as a distance function is required to be dominated by $d$.]
  #[#set math.equation(numbering: n => "(6.3)")
   $ upright("maximize") quad & sum_(S in cal(S)) \| S \| \( n - \| S \| \) t_S \,\
upright("subject to") quad & sum_(S in cal(S)) t_S delta_S \( i \, j \) lt.eq d \( i \, j \) quad \( i < j \) \,\
 & t_S gt.eq 0 quad \( S in cal(S) \) . $ <red:primal>]
  It is feasible by taking every $t_S = 0$. For any feasible $t$, the map $F_t \( i \) = \( t_S upright(bold(1))_S \( i \) \)_(S in cal(S))$ takes values in $ell_1^(\| cal(S) \|)$ and is a contraction for $d$. Its sum of distances over unordered pairs is exactly the objective in (6.3). Consequently (6.1) bounds the primal optimum by $n^2 b \/ 2$. The primal optimum is attained: for each $S in cal(S)$ and any pair separated by $S$, feasibility implies $0 lt.eq t_S lt.eq d \( i \, j \)$, so its feasible region is closed and bounded.
  The dual of (6.3), with one nonnegative variable $c_(i j)$ for each unordered pair, is
  #[#set math.equation(numbering: n => "(6.4)")
   $ upright("minimize") quad & sum_(i < j) c_(i j) d \( i \, j \) \,\
upright("subject to") quad & sum_(i in S \, med j in.not S) c_(i j) gt.eq \| S \| \( n - \| S \| \) quad \( S in cal(S) \) \,\
 & c_(i j) gt.eq 0 quad \( i < j \) . $ <red:dual>]
  Here the cut sum counts each separated unordered pair once. The dual is feasible, for example with $c_(i j) = 1$ for every pair. Finite-dimensional linear programming duality therefore gives an optimal dual solution $C$ satisfying
  #[#set math.equation(numbering: n => "(6.5)")
   $ sum_(i < j) c_(i j) d \( i \, j \) lt.eq frac(n^2 b, 2) . $ <red:dual-objective>]
  Its cut constraints give $"OPT" \( C \) gt.eq 1$ with exactly unit pair demands.
  Set $D = sum_(i < j) d \( i \, j \) gt.eq n^2 a \/ 2 > 0$. If $d \( i \, j \) = \| z_i - z_j \|^2$ in a Hilbert space, the vectors $z_i \/ sqrt(D)$ give the feasible normalized SDP distances $d \( i \, j \) \/ D$. The span of the finitely many $z_i$ has dimension at most $n$, so these vectors can be realized in $bb(R)^n$. The triangles are preserved by normalization, and (6.5) gives $"GL" \( C \) lt.eq b \/ a$.
  Finally, the graph of pairs with $c_(i j) > 0$ is connected: otherwise the vertex set of one component would violate a cut constraint in (6.4). Choose a spanning tree $cal(T)$ in this graph and put $gamma = min_({ i \, j } in cal(T)) c_(i j) > 0$. For any feasible SDP distance array $d'$, the triangle inequalities along tree paths imply
  $ 1 = sum_(i < j) d' \( i \, j \) lt.eq binom(n, 2) sum_({ i \, j } in cal(T)) d' \( i \, j \) . $
  Hence its objective is at least $gamma \/ binom(n, 2) > 0$. This proves $"GL" \( C \) > 0$, including when the original semimetric $d$ has zero distances between distinct vertices. ◻
]

=== 6.1 Replacing the parameter distribution by multiplicities <replacing-the-parameter-distribution-by-multiplicities>

Fix a sufficiently large integer $m$, and use the vertex set $V$, semimetric $d$, and chart map $v_1$ from 1. Define the probability weights

$ w_v = Pr_(theta med upright(u n i f o r m med o n) med T) #scale(x: 120%, y: 120%)[\[] v_1 \( theta \) = v #scale(x: 120%, y: 120%)[\]] \, #h(2em) T = \( - 1 \, 1 \)^m . $

Weights on vertices outside the first chart are thus zero. By Proposition 1, Proposition 2, for absolute positive constants that may change from line to line,

#[#set math.equation(numbering: n => "(6.6)")
 $ \| V \| lt.eq exp \( C m log m \) \, #h(2em) "diam" \( V \, d \) lt.eq C m \, #h(2em) sum_(v \, z in V) w_v w_z d \( v \, z \) gt.eq c m \,\
sum_(v \, z in V) w_v w_z parallel F \( v \) - F \( z \) parallel_1 lt.eq C sqrt(m) thin \( log m \)^(5 \/ 2) $ <red:weighted-bounds>]

for every finite-dimensional $ell_1$-valued contraction $F$ for $d$.

Every chart vertex must remain present, even if its weight is zero: its distance constraints still restrict contractions on the first chart. We therefore give each vertex at least one copy. In the choice below, the term $m^2 \| V \|$ controls the measure error, while $m^m$ ensures the lower bound on $log n$ needed in the final parameter conversion. Set

$ M = m^m + m^2 \| V \| \, #h(2em) k_v = 1 + floor.l M w_v floor.r \,\
tilde(V) = { \( v \, h \) : v in V \, med 1 lt.eq h lt.eq k_v } \, #h(2em) n = \| tilde(V) \| . $

Give these copies the semimetric $tilde(d) \( \( v \, h \) \, \( z \, k \) \) = d \( v \, z \)$. It is again a squared Hilbert distance satisfying all triangles, by assigning the same Hilbert vector to every copy of a vertex. In particular, distances between copies of one vertex are zero.

Let $mu_v = k_v \/ n$ be the pushforward to $V$ of the uniform probability measure on $tilde(V)$. To bound the rounding error, write $e_v = k_v - M w_v in \( 0 \, 1 \]$ and $E_0 = sum_v e_v$. Then $n = M + E_0$, where $0 < E_0 lt.eq \| V \|$, and

$ mu_v - w_v = frac(e_v - E_0 w_v, n) . $

Using the convention $parallel mu - w parallel_(upright("TV")) = 1 / 2 sum_v \| mu_v - w_v \|$, we obtain

#[#set math.equation(numbering: n => "(6.7)")
 $ parallel mu - w parallel_(upright("TV")) lt.eq E_0 / n lt.eq frac(\| V \|, M) lt.eq 1 / m^2 \, #h(2em) parallel mu ⊗ mu - w ⊗ w parallel_(upright("TV")) lt.eq 2 / m^2 . $ <red:tv>]

The second inequality follows by writing the difference of the product measures as $\( mu - w \) ⊗ mu + w ⊗ \( mu - w \)$ and applying the triangle inequality for total variation.

For any function with values in $\[ 0 \, C m \]$, the change in its expectation under these two product measures is at most $2 C \/ m$. Applying this to $d$ gives

#[#set math.equation(numbering: n => "(6.8)")
 $ 1 / n^2 sum_(x \, y in tilde(V)) tilde(d) \( x \, y \) = sum_(v \, z in V) mu_v mu_z d \( v \, z \) gt.eq c' m $ <red:uniform-metric>]

for all sufficiently large $m$. Every contraction $tilde(F)$ from $\( tilde(V) \, tilde(d) \)$ into a finite-dimensional $ell_1$ space agrees on copies of a vertex, because the distance between those copies is zero. Since $k_v gt.eq 1$ for every $v$, it therefore induces a contraction $F$ on all of $V$. The function $parallel F \( v \) - F \( z \) parallel_1$ is bounded by $d \( v \, z \) lt.eq C m$. Thus (6.6) and (6.7) give

#[#set math.equation(numbering: n => "(6.9)")
 $ 1 / n^2 sum_(x \, y in tilde(V)) parallel tilde(F) \( x \) - tilde(F) \( y \) parallel_1 lt.eq C' sqrt(m) thin \( log m \)^(5 \/ 2) . $ <red:uniform-contraction>]

Apply 7 to (6.8)–(6.9). After labeling $tilde(V)$ by $\[ n \]$, this gives nonnegative capacities $C^(\( m \))$ with unit demands on all distinct pairs and

#[#set math.equation(numbering: n => "(6.10)")
 $ frac("OPT" \( C^(\( m \)) \), "GL" \( C^(\( m \)) \)) gt.eq c'' frac(sqrt(m), \( log m \)^(5 \/ 2)) \, #h(2em) "GL" \( C^(\( m \)) \) > 0 . $ <red:m-gap>]

=== 6.2 The number of vertices <the-number-of-vertices>

Since $M lt.eq n lt.eq M + \| V \|$, (6.6) implies, for an absolute constant $K$ and all sufficiently large $m$,

#[#set math.equation(numbering: n => "(6.11)")
 $ m log m lt.eq log n lt.eq K m log m . $ <red:size>]

In particular $n arrow.r oo$ and $log log n gt.eq log m$ for large $m$. Consequently

$ frac(sqrt(log n), \( log log n \)^3) lt.eq sqrt(K) thin frac(sqrt(m), \( log m \)^(5 \/ 2)) . $

Combining this with (6.10) proves 1.

== 7 Gaussian directions: the probabilistic proof <app:directions>

#proof[
  Choose all the $g_(s \, i)$ independently with the standard Gaussian distribution on $bb(R)^m$. We show that the required events hold simultaneously with probability tending to one as $m arrow.r oo$.
  We first record the elementary estimates used below. For a standard Gaussian $G$ in $bb(R)^m$,
  #[#set math.equation(numbering: n => "(7.1)")
   $ bb(E) cos chevron.l G \, w chevron.r = e^(- \| w \|^2 \/ 2) \, #h(2em) bb(E) #scale(x: 120%, y: 120%)[\[] G sin chevron.l G \, w chevron.r #scale(x: 120%, y: 120%)[\]] = w e^(- \| w \|^2 \/ 2) . $ <dir:gaussian-identities>]
  Indeed, rotation reduces the first identity to the one-dimensional cosine transform. Gaussian integration by parts gives the differential equation $phi.alt' \( t \) = - t phi.alt \( t \)$ for that transform, with $phi.alt \( 0 \) = 1$. Differentiating the first identity with respect to $w$ gives the second; the finite first Gaussian moment justifies this differentiation. Also, exponential Markov inequalities applied to $bb(E) e^(t \| G \|^2) = \( 1 - 2 t \)^(- m \/ 2)$, for $t < 1 \/ 2$, give for an absolute $c > 0$
  #[#set math.equation(numbering: n => "(7.2)")
   $ Pr {\| G \| in.not \[ sqrt(m) \/ 2 \, 2 sqrt(m) \]} lt.eq 2 e^(- c m) . $ <dir:gaussian-norm-tail>]
  We will use the following bounded-variable estimate, a form of Hoeffding’s inequality #cite(label("Hoe63")). If $X_1 \, dots.h \, X_n$ are independent real random variables with $\| X_j \| lt.eq B$, then, for $0 < u lt.eq B$,
  #[#set math.equation(numbering: n => "(7.3)")
   $ Pr {lr(|1 / n sum_(j = 1)^n \( X_j - bb(E) X_j \)|) > u} lt.eq 2 exp (- frac(c n u^2, B^2)) . $ <dir:bounded-concentration>]
  For completeness, Taylor expansion, the vanishing first centered moment, and $\| X_j - bb(E) X_j \| lt.eq 2 B$ give $bb(E) e^(t \( X_j - bb(E) X_j \)) lt.eq e^(C t^2 B^2)$ when $\| t \| lt.eq 1 \/ \( 2 B \)$. Independence and exponential Markov, with $t$ a sufficiently small constant multiple of $u \/ B^2$, give both tails in (7.3).
  To obtain (2.2), truncate each Gaussian summand on the event $\| G \| > 2 sqrt(m)$. By Cauchy–Schwarz and (7.2), uniformly in $w$,
  #[#set math.equation(numbering: n => "(7.4)")
   $ lr(|bb(E) #scale(x: 120%, y: 120%)[\[] G sin chevron.l G \, w chevron.r upright(bold(1))_({ \| G \| lt.eq 2 sqrt(m) }) #scale(x: 120%, y: 120%)[\]] - w e^(- \| w \|^2 \/ 2)|) lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] \| G \| upright(bold(1))_({ \| G \| > 2 sqrt(m) }) #scale(x: 120%, y: 120%)[\]] lt.eq e^(- c' m) \, $ <dir:truncation-bias>]
  after decreasing the positive constant $c'$ and taking $m$ large. For a fixed unit vector $v$ and fixed $w$, the scalar truncated summand
  $ chevron.l v \, G chevron.r sin chevron.l G \, w chevron.r upright(bold(1))_({ \| G \| lt.eq 2 sqrt(m) }) $
  has absolute value at most $2 sqrt(m)$. Thus (7.3), with $n = N$ and $u = 1 \/ \( 2 sqrt(m) \)$, bounds its empirical-mean deviation probability by $2 e^(- c N \/ m^2)$.
  Choose a $1 \/ 8$-net $cal(V)$ of the unit sphere and an $m^(- 3)$-net $cal(W)$ of the ball of radius $m^42$. The usual disjoint-ball packing argument gives
  $ \| cal(V) \| lt.eq 17^m \, #h(2em) \| cal(W) \| lt.eq \( 1 + 2 m^45 \)^m = exp \( O \( m log m \) \) . $
  Union bound the preceding scalar deviations over $s$, $v in cal(V)$, and $w in cal(W)$. The failure probability tends to zero, since $N \/ m^2 = m^4$. On the resulting event, for every $s$ and $w in cal(W)$, the vector deviation from its truncated expectation is at most $4 \/ \( 7 sqrt(m) \)$: bounds on inner products with a $1 \/ 8$-net control the Euclidean norm with factor $8 \/ 7$.
  Each truncated empirical vector function is $4 m$-Lipschitz in $w$, because the operator norm of its derivative is at most the average of the truncated $\| g_(s \, i) \|^2$. The function $w mapsto w e^(- \| w \|^2 \/ 2)$ is $2$-Lipschitz. Consequently the bias bound (7.4) and interpolation from $cal(W)$ give, uniformly on the whole ball, an error at most
  $ frac(4, 7 sqrt(m)) + e^(- c' m) + \( 4 m + 2 \) m^(- 3) lt.eq 2 / sqrt(m) $
  for all sufficiently large $m$. This proves the desired approximation for the truncated samples.
  The covariance estimate follows from the same argument with quadratic forms. For a fixed unit vector $v$, the variable $chevron.l v \, G chevron.r^2 upright(bold(1))_({ \| G \| lt.eq 2 sqrt(m) })$ is bounded by $4 m$, and its expectation differs from $1$ by at most
  $ #scale(x: 120%, y: 120%)[\(] bb(E) chevron.l v \, G chevron.r^4 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) Pr { \| G \| > 2 sqrt(m) }^(1 \/ 2) lt.eq e^(- c' m) \, $
  where constants can again be adjusted, since $bb(E) chevron.l v \, G chevron.r^4 = 3$. Apply (7.3) with $u = 1 \/ 8$, and union bound over $s$ and $v in cal(V)$. With probability tending to one, every truncated empirical covariance matrix $M_s$ satisfies
  $ parallel M_s - I_m parallel_(upright("op")) lt.eq frac(1, 1 - 2 \/ 8) (1 / 8 + e^(- c' m)) < 1 / 2 . $
  Here we used the elementary symmetric-matrix net estimate $parallel A parallel_(upright("op")) lt.eq \( 1 - 2 rho \)^(- 1) max_(v in cal(V)) \| chevron.l A v \, v chevron.r \|$ for a sphere net of radius $rho < 1 \/ 2$.
  By (7.2), all $S N = m^9$ original Gaussian samples satisfy (2.1) with probability tending to one. On this event the truncations change no sample, so the preceding conclusions establish the first two assertions. Pairwise nonparallelism within each family holds almost surely.
  It remains to establish (2.3). For a fixed unit vector $v$, the one-dimensional Gaussian tail bound gives
  $ Pr {max_i \| chevron.l v \, g_(s \, i) chevron.r \| > 10 sqrt(log m)} lt.eq 2 N e^(- 50 log m) = 2 m^(- 44) . $
  Call such an index $s$ bad for $v$. Before any conditioning, these bad-index events are independent across $s$. Therefore the probability that at least $S \/ 2$ indices are bad for this fixed $v$ is at most
  $ 2^S \( 2 m^(- 44) \)^(S \/ 2) . $
  Take a sphere net of radius $1 \/ m$, with cardinality at most $\( 1 + 2 m \)^m$, and union bound this last estimate over its points. The resulting failure probability tends to zero. Finally intersect with the already established norm event. If $v_0$ is a net point with $\| v - v_0 \| lt.eq 1 \/ m$, then
  $ \| chevron.l v - v_0 \, g_(s \, i) chevron.r \| lt.eq 2 / sqrt(m) $
  for every $s \, i$. Every chart good for $v_0$ consequently satisfies (2.3) for $v$, with $C = 11$ for all sufficiently large $m$. This argument uses independence only for the unconditioned Gaussian samples. A final union bound intersects this event with the preceding high-probability events and proves the lemma. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
