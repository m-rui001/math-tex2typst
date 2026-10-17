#set page(paper: "us-letter", margin: (x: 73.7pt, y: 73.7pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[The-Falconer-distance-conjecture-in-all-dimensions-September-23-2026]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For $E subset bb(R)^d$, its Euclidean distance set is

$ Delta \( E \) = { \| x - y \| : x \, y in E } . $

The Falconer distance conjecture asks whether a compact set of Hausdorff dimension greater than half the ambient dimension must determine a set of distances of positive length. We prove this assertion.

#thm([Theorem 1.1.])[
  #emph[Let $d gt.eq 2$ be an integer and let $E subset bb(R)^d$ be compact. If $dim_H E > d \/ 2$, then 
$ cal(L)^1 \( Delta \( E \) \) > 0 . $

]
] <thm:main>

Theorem 1 imposes no regularity beyond the strict Hausdorff dimension assumption. In particular, it does not require equality of Hausdorff and packing dimensions, an Ahlfors regular measure, product structure, or Fourier decay. The assertion concerns positive Lebesgue measure; a distance set of Hausdorff dimension one alone would not suffice. The strict threshold is retained, and no endpoint assertion is made.

=== 1.1 History and scope <history-and-scope>

The problem originates in Falconer’s work #cite(label("Falconer1985")), which established the sufficient threshold $\( d + 1 \) \/ 2$. His lattice-type examples at dimension $d \/ 2$ explain the strict inequality in the positive-measure formulation. Mattila’s spherical-average criterion #cite(label("Mattila1987")) made Fourier $L^2$ estimates a central approach to the problem. Bourgain connected improvements in dimensions two and three to Fourier restriction phenomena on spheres #cite(label("Bourgain1994")). Among the subsequent milestones were Wolff’s planar threshold $4 \/ 3$ #cite(label("Wolff1999")) and Erdoğan’s threshold $d \/ 2 + 1 \/ 3$ for $d gt.eq 3$ #cite(label("Erdogan2005")) Theorem 2; these positive-measure conclusions require strict dimension inequalities. For the parallel finite point-set problem in $bb(R)^d$, $d gt.eq 3$, see the distinct-distances theorem in #cite(label("OpenAIDistinctDistances2026")) Theorem 1.1.

Weighted restriction and decoupling led to further improvements. Du, Guth, Ou, Wang, Wilson and Zhang obtained the threshold $9 \/ 5$ in dimension three and improvements in higher dimensions #cite(label("DGOWWZ2021")) Theorem 1.2. Du and Zhang obtained the threshold $d \/ 2 + 1 \/ 4 + 1 \/ \( 8 d - 4 \)$, improving the preceding bounds for $d gt.eq 4$ #cite(label("DZ2019")) Theorem 2.6. The arguments draw on refined restriction estimates and on the decoupling theory of Bourgain and Demeter #cite(label("BD2015")). For a pin $y$, write $Delta_y \( E \) = { \| x - y \| : x in E }$. Liu’s $L^2$ identity connects pinned distance measures with spherical extension estimates and transfers spherical-average bounds to pinned conclusions #cite(label("Liu2019")) Theorems 1.4 and 1.9. The two preceding restriction advances also give $cal(L)^1 \( Delta_y \( E \) \) > 0$ for some $y in E$ under the corresponding strict dimension inequalities; see #cite(label("DGOWWZ2021")) Corollary 1.11 and #cite(label("DZ2019")) Theorem 2.7. For compact $E subset bb(R)^2$ with $dim_H E > 5 \/ 4$, Guth, Iosevich, Ou and Wang proved the same pinned conclusion #cite(label("GIOW2020")) Theorem 1.2. Their argument combines radial-projection control of discarded wave packets with refined decoupling for the retained part. Du, Iosevich, Ou, Wang and Zhang obtained the analogous pinned conclusion in even dimensions $d gt.eq 4$ when $dim_H E > d \/ 2 + 1 \/ 4$ #cite(label("DIOWZ2021")) Theorem 1.2. For compact $E subset bb(R)^d$, $d gt.eq 3$, Du, Ou, Ren and Zhang obtained the same existential pinned conclusion when

$ dim_H E > d / 2 + 1 / 4 - frac(1, 8 d + 4) $

#cite(label("DORZ2024")) Theorem 1.2.

At the critical dimension, Shmerkin and Wang proved that $dim_H Delta \( E \) = 1$ for Borel $E subset bb(R)^d$, $d gt.eq 2$, whose Hausdorff and packing dimensions both equal $d \/ 2$ #cite(label("SW2025")) Theorem 1.4.

For Borel $E \, F subset bb(R)^2$, Liu proved that $dim_H E > 1$, $dim_H E + dim_H F > 2$, and $dim_H F = dim_P F$ imply $cal(L)^1 \( Delta_y \( E \) \) > 0$ for some $y in F$ #cite(label("Liu2026")) Theorem 1.1. Here $dim_P$ denotes packing dimension. Taking $F = E$ gives the conjectured planar conclusion for sets with equal Hausdorff and packing dimensions greater than one. The regularity of the pin set is a hypothesis of this result, not a consequence of its Hausdorff dimension. Borges, Ou and Pasquariello study positive measure for pinned $k$-star distance sets and admissible distance-graph configurations #cite(label("BOP2026")) Theorem A and Corollary 1.11. Their $k = 1$ threshold lies above $d \/ 2$; they record the sharper earlier one-edge bounds in #cite(label("BOP2026")) Remark 1.2. These results do not give Theorem 1. The result here is unpinned; no corresponding claim about a single pin is asserted at the threshold $d \/ 2$.

=== 1.2 Methodological antecedents <methodological-antecedents>

The multiscale analysis of irregular measures has important precedents. Keleti and Shmerkin decompose measures into dyadically regular pieces, control bad projections across scale intervals, and optimize variations of Lipschitz profiles in their work on the dimensions of planar distance sets #cite(label("KS2019")) Corollary 3.5, Section 3.2 and Section 5. These are antecedents for the regular classes, scale-dependent tests and profile accounting used below. Their estimates concern Hausdorff dimension. Their optimization controls a sum of interval drops; Section 10 uses a potential built from two separated depths to pay the present recursion’s costs. Shmerkin and Wang later combined scale profiles with radial projection estimates and slicing #cite(label("SW2025")) Sections 5.5 and 6.1–6.3.

Our angular preparation is related to the multiscale incidence approach of Orponen and Shmerkin #cite(label("OS2023")) Section 1.5, the radial thin-tube bootstrap of Orponen, Shmerkin and Wang #cite(label("OSW2024")) Section 1.3, and the higher-dimensional radial and plate-concentration methods of Ren #cite(label("Ren2023")) and Du, Ou, Ren and Zhang #cite(label("DORZ2024")). The retained incidence input is the theorem of Orponen and Shmerkin #cite(label("OS2023")) Theorem 1.3 and Remark 1.4, in the tube formulation of #cite(label("OSW2024")) Definitions 2.5–2.6 and Theorem 2.7. The auxiliary radial estimate is proved here by Orponen’s finite-energy method #cite(label("Orponen2019")) Section 3 and the proof of Theorem 1.13. It is applied only in a dimension where its energy hypotheses hold.

Auxiliary projections used to prepare radial information, while keeping the final distance map in the original space, also occur in #cite(label("DIOWZ2021")) Sections 2–3. The separation between approximation of a distance measure and Fourier control of its retained part has a precedent in #cite(label("GIOW2020")) Propositions 2.1–2.2. Liu’s regular-pin theorem uses a multiscale good–bad decomposition and weighted extension estimates #cite(label("Liu2026")) Section 1.1. These comparisons describe relationships between methods, not additional theorem inputs. The present proof supplies its angular tests, oscillatory graph reductions, two-depth potential and monotone shell reconstruction; it does not invoke a decoupling theorem or any earlier distance theorem at an improved threshold.

=== 1.3 The two main issues <the-two-main-issues>

Put $S = d \/ 2$. An immediate obstacle in higher dimensions is that radial projections of a separated $s$-dimensional source cannot acquire dimension greater than $s$. Thus, when $S < s < d - 1$, one cannot assume that these projections have densities relative to surface measure on $S^(d - 1)$. The first part of the proof constructs instead the cap bounds that the Fourier argument actually needs.

After restriction to two separated Frostman measures, we form decreasing sets of admissible pairs, denoted by $Gamma_N$. Their intersection has positive product mass. At each scale $2^(- N)$, a further exceptional set of pairs of power-small mass can be deleted so that every remaining directional fiber has a cap bound of exponent $S$, with an arbitrarily small power loss. Here a directional fiber is the opposite measure, restricted by the pair condition at a fixed endpoint and then pushed to the sphere by the radial map; it is not normalized separately. Integer exponents come from supercritical radial integrability after projection to a smaller space. In odd dimensions, a thin-tube improvement supplies the additional half dimension. Its linear gain is proved by slicing to the plane; the integer endpoint requires a separate transverse-triple argument.

The auxiliary projections concern directions and incidences only. Every distance and every oscillatory distance phase in the rest of the proof is taken in the original space $bb(R)^d$.

The second issue is to exploit these fractal angular laws in a distance estimate. A cap test controls parallel tubes, whereas a scalar projection test involves belts on the sphere. The required belt estimate follows from a Fourier calculation: the annular power is $B^(d - 2 S)$, which is exactly one at $S = d \/ 2$. This gives the angular tests used by the recursive reductions.

=== 1.4 From profiles to a distance measure <from-profiles-to-a-distance-measure>

At a fixed dyadic frequency $R = 2^N$, decompose each Frostman measure into almost uniform dyadic classes. If a class has mass profile $m$, write

$ A_n = m \( n \/ N \) - S n \/ N . $

Thus its occupied depth-$n$ cells have mass approximately $R^(- m \( n \/ N \))$, up to the controlled regularization loss. The excess profile $A$ records decay beyond the critical exponent $S$. The two recursive quantities are a count of pairs with nearly equal distances, denoted by $sans(D)$, and a product of spherical Fourier energies with independent angular variables, denoted by $sans(H)$. The high-frequency part of $sans(D)$ is split into distance-frequency shells. Stationary phase first produces the square of an angular inner product $sans(H)_F$, which Cauchy–Schwarz bounds by $sans(H)$. The graph estimate then uses the parallel tests to advance to finer cells. Other reductions return to positive distance counts or shorten the interval of scales. The definitions and the conversions appear in Sections 7–9.

An angular state carries tests selected on an interval containing the one currently being estimated. Each test is retained until the recursion reaches its associated depth. A potential formed from two values of $A_n$ at sufficiently separated depths is evaluated on the current interval. It pays the positive step costs and closes the recursion.

For two profiles, let $c$ be the last depth at which either excess profile is at most a fixed small level $beta > 0$. The graph estimate passes the independent angular energy to cells at depth $c$. Cauchy–Schwarz in the radial variable bounds this by the geometric mean of two single-profile states, so the recursive bound applies. Each potential is at least $2 beta - O_d \( 1 \/ N \)$, while the entry cost is at most $beta$ up to the regularization loss. The profile increments cancel, leaving a strictly decaying Fourier shell bound once the losses are chosen sufficiently small; see Lemma 50 and Proposition 52.

The coarse pair restrictions $Gamma_N$ need not converge at a quantitative rate. We therefore use the following form of the scalar shell principle. If positive measures $alpha_N$ decrease to $alpha_oo$, if

$ parallel alpha_N - tau_N parallel_(upright("TV")) lt.tilde 2^(- eta N) \, #h(2em) integral_(2^(N - 1) lt.eq \| r \| lt.eq 2^(N + 1)) \| hat(tau_N) \( r \) \|^2 thin #h(-0.16667em) upright(d) r lt.tilde 2^(- gamma N) \, $

and if $eta \, gamma > 0$, then $alpha_oo$ is absolutely continuous. The proof uses summable positive increments $alpha_n - alpha_(n + 1)$ and telescoping smooth Fourier cutoffs; it is given in Lemma 53. Our limiting measure is nonzero and carried by $Delta \( E \)$, which proves Theorem 1 in Section 11.

The components that may be useful separately are the thin-tube upgrade (Proposition 17), the critical fractal angular Fourier estimate (Lemma 27), the graph estimate with independent angular variables (Proposition 38), and the monotone-measure shell principle (Lemma 53).

Figure 1 summarizes the roles of the auxiliary and original spaces.

#figure(
  [#image("fig/proof-map.pdf.png", width: 100%)],
  caption: [Figure 1: The main construction. Auxiliary projections prepare directional bounds and pair filters; the cap bounds hold after an additional power-small pair deletion. These data return to the original space, where the argument uses the Euclidean distance of the original pairs. The decreasing filters and shell-dependent approximants meet in the final scalar monotone-shell argument. ],
) <fig:proof-map>

== 2 Conventions and preliminary facts <sec:conventions>

=== 2.1 Measures, scales and directions <measures-scales-and-directions>

All measures are finite Borel measures. A subprobability has mass at most one. Restrictions are left unnormalized unless normalization is explicitly specified. We write

$ I_s \( mu \) = integral.double \| x - y \|^(- s) thin #h(-0.16667em) upright(d) mu \( x \) #h(-0.16667em) upright(d) mu \( y \) \, #h(2em) hat(mu) \( xi \) = integral e^(- i x dot.op xi) thin #h(-0.16667em) upright(d) mu \( x \) . $

For measures on the line we use the same Fourier convention. The norm $parallel dot.op parallel_(upright("TV"))$ is total variation. The notation $f lt.tilde g$ means $f lt.eq C g$, with the dependence of $C$ specified by the ambient discussion.

A measure has an $s$-ball bound with loss $K$, down to scale $delta$, if

$ mu \( B \( z \, r \) \) lt.eq K r^s quad upright("for every ") z upright(" and ") delta lt.eq r lt.eq 1 . $

A cap bound on a sphere has the analogous meaning for its Euclidean chordal metric. Passing between this metric, angular distance and fixed smooth charts changes constants only. We may use dyadic radii, and enlarge the constant to recover all radii in the specified interval.

For $x eq.not y$, put

$ pi_x \( y \) = frac(y - x, \| y - x \|) \, #h(2em) D \( x \, y \) = \| x - y \| . $

A tube is a neighborhood of an affine line; a plate is a neighborhood of an affine plane of the dimension indicated. Directions are oriented unless an antipodal pair of caps is explicitly used. All configurations lie in bounded sets. Fixed rescalings and a finite number of coordinate charts have constant cost.

The original ambient dimension is always denoted by $d$, and $S = d \/ 2$. We use $R = 2^N$ for the reciprocal final scale. In odd dimension we write $d = 2 k - 1$; the linear angular gain is then used in $bb(R)^(k + 1)$, while $S = k - 1 \/ 2$ still refers to the original dimension. Letters denoting dimensions inside a preliminary lemma are local to that lemma.

=== 2.2 Finite energy and projection <finite-energy-and-projection>

We record elementary consequences of the usual Frostman and projection principles, including the restriction operation needed later.

#thm([Lemma 2.1.])[
  #emph[Let $mu$ be supported in a bounded subset of $bb(R)^d$.]
  + #emph[If $mu \( B \( z \, r \) \) lt.eq C r^s$ for $0 < r lt.eq 1$, then $I_t \( mu \) < oo$ for every $0 < t < s$.]
  + #emph[If $I_t \( mu \) < oo$, then for every $epsilon > 0$ there is a compact restriction of mass at least $mu \( bb(R)^d \) - epsilon$ that satisfies a $t$-ball bound with a finite constant.]
  + #emph[If $0 < t < m lt.eq d$, $I_t \( mu \) < oo$, and $P_V$ is orthogonal projection to a Haar-random $m$-plane, then $I_t \( \( P_V \)_(\#) mu \) < oo$ for almost every $V$.]
] <conv:energy>

#proof[
  For (i), split the integral at distance one and sum dyadic annuli. The contribution at distance at most $2^(- j)$ is bounded by $C 2^(- j \( s - t \))$, up to a constant depending on the total mass.
  For (ii), let $U_t^mu \( x \) = integral \| x - y \|^(- t) thin #h(-0.16667em) upright(d) mu \( y \)$. This is finite for $mu$-almost every $x$, so a sufficiently large level $M$ discards arbitrarily little mass. Choose a compact subset $K subset { U_t^mu lt.eq M }$ losing at most the remaining prescribed mass. If $K ∩ B \( z \, r \) eq.not diameter$, choose $x$ in this intersection. Then
  $ mu \|_K \( B \( z \, r \) \) lt.eq mu \( B \( x \, 2 r \) \) lt.eq \( 2 r \)^t U_t^mu \( x \) lt.eq M \( 2 r \)^t . $
  The same bound is immediate if the intersection is empty.
  For (iii), rotational invariance and the integrability of the negative $t$-moment of the length of an $m$-dimensional projection give
  $ integral_(G \( d \, m \)) \| P_V z \|^(- t) thin #h(-0.16667em) upright(d) V lt.eq C_(d \, m \, t) \| z \|^(- t) quad \( z eq.not 0 \) . $
  For $m < d$, this follows by integrating the density of the first $m$ coordinates of a uniform unit vector near zero: the radial integral there is bounded by a constant times $integral_0^1 r^(m - 1 - t) thin #h(-0.16667em) upright(d) r < oo$. For $m = d$, the identity projection makes the assertion immediate. Integrating in $\( x \, y \)$ and applying Tonelli proves the claim. ◻
]

We use Frostman’s Lemma in its standard form #cite(label("Mattila1995")) Theorem 8.8: if a compact set $E$ has $dim_H E > s$, it supports a nonzero finite measure satisfying an $s$-ball bound at all scales. Dividing by its mass gives a probability. The positive dimension margin permits a slight decrease of $s$ whenever a finite energy rather than a ball bound is needed.

Dyadic cubes are half-open, so they form genuine partitions. One may choose a translate of the dyadic grid whose boundaries have zero mass for the finitely many starting measures: for each coordinate hyperplane this follows by integrating its mass over the translation, and the set of grid hyperplanes is countable.

=== 2.3 Subpower losses and fixed gains <subpower-losses-and-fixed-gains>

For a sequence $R arrow.r oo$, a positive factor is at most subpower if it is bounded by $R^(o \( 1 \))$. A retained mass is at least subpower if it is bounded below by $R^(- o \( 1 \))$. These are statements about the sequence; their use does not assert that an arbitrary fixed positive exponent is zero. Constants and powers of $log R$ are subpower. The corresponding notation for $delta arrow.r 0$ uses $R = delta^(- 1)$.

We will use the following quantifier principle. It makes precise the compactness passages in which the input losses tend to zero and an argument produces a fixed positive improvement.

#thm([Lemma 2.2.])[
  (Sequential uniformity principle).  #emph[For fixed background parameters, let $cal(C) \( epsilon \, R \)$ be classes of data, increasing in the allowed loss $epsilon > 0$. Let $cal(G) \( c \, R \)$ be conclusions, weakening as the gain $c > 0$ decreases. Suppose that for every sequence 
$ epsilon_j arrow.b 0 \, #h(2em) R_j arrow.r oo \, #h(2em) X_j in cal(C) \( epsilon_j \, R_j \) \, $

 there are a subsequence and a fixed $c > 0$ on which $X_j$ satisfies $cal(G) \( c \, R_j \)$ for all sufficiently large $j$. Then there exist $epsilon_0 \, c_0 > 0$ and $R_0 < oo$ such that every $X in cal(C) \( epsilon_0 \, R \)$, $R gt.eq R_0$, satisfies $cal(G) \( c_0 \, R \)$.]
] <conv:uniformity>

#proof[
  If the conclusion fails, for each $j$ choose $R_j gt.eq j$ and $X_j in cal(C) \( 1 \/ j \, R_j \)$ failing $cal(G) \( 1 \/ j \, R_j \)$. The assumed subsequence satisfies $cal(G) \( c \, R_j \)$ for some fixed $c > 0$. For large $j$, $1 \/ j < c$, so monotonicity implies $cal(G) \( 1 \/ j \, R_j \)$, a contradiction. ◻
]

Fixed constants in a power-small output may be absorbed by decreasing the output exponent and increasing the scale threshold. When several losses occur in an input, their maximum serves as $epsilon$ in Lemma 3. Compactness of uniformly Lipschitz normalized profiles is the usual Arzelà–Ascoli compactness #cite(label("Folland1999")) Theorem 4.43. All background parameters, including any strict dimension or transversality exponent, are fixed before this principle is applied. The detailed arguments below specify the required ordering of losses.

For measurable selection at a fixed scale it suffices to work with dyadic grids, finite tube nets and a finite number of charts. Strict inequalities can first be imposed with a fixed enlargement of widths. Thus unions of exceptional configurations can be chosen Borel; no selection from an uncountable unparameterized family is needed.

== 3 Regularization and multiplication of fibre bounds <reg:section>

We first record two finite-tree facts. Neither requires lower density estimates for the original measure. Dyadic cubes are taken half open, so that they form genuine measurable partitions; a fixed translation and rescaling places each measure under consideration in one unit cube. Related decompositions into dyadically regular measures occur in #cite(label("KS2019")) Corollary 3.5; we prove the version needed here.

#thm([Lemma 3.1.])[
  (Regular classes).  #emph[Let $n gt.eq 1$, let $rho$ be a probability on a unit dyadic cube in $bb(R)^n$, and put $R = 2^N$. For every fixed $0 < lambda < 1$ and all sufficiently large $N$, there are pairwise disjoint sets $E_alpha$, each a union of depth-$N$ cubes, with the following properties:]
  + #emph[Their number is at most $N^(C_n \/ lambda)$, each has $rho \( E_alpha \) gt.eq R^(- lambda)$, and 
$ rho #scale(x: 180%, y: 180%)[\(] bb(R)^n \\ union.big_alpha E_alpha #scale(x: 180%, y: 180%)[\)] lt.eq R^(- 2) + N^(C_n \/ lambda) R^(- lambda) = R^(- lambda + o \( 1 \)) . $

]
  + #emph[For $rho_alpha = rho \|_(E_alpha) \/ rho \( E_alpha \)$ there is a nondecreasing $n$-Lipschitz function $m_alpha : \[ 0 \, 1 \] arrow.r \[ 0 \, n \]$, with $m_alpha \( 0 \) = 0$, such that every occupied depth-$j$ cube satisfies 
#[#set math.equation(numbering: n => "(3.1)")
 $ R^(- m_alpha \( j \/ N \) - C_n lambda) lt.eq rho_alpha \( Q \) lt.eq R^(- m_alpha \( j \/ N \) + C_n lambda) \, #h(2em) 0 lt.eq j lt.eq N . $ <reg:cell-mass>]

]
  + #emph[If $rho \( B \( x \, r \) \) lt.eq K r^s$ for $R^(- 1) lt.eq r lt.eq 1$, with $0 lt.eq s lt.eq n$ and $K gt.eq 1$, then 
#[#set math.equation(numbering: n => "(3.2)")
 $ m_alpha \( u \) gt.eq s u - C_n lambda - log_R K \, #h(2em) 0 lt.eq u lt.eq 1 . $ <reg:profile-lower-bound>]

]
  #emph[Here and below an occupied cube means a cube of positive mass for the specified class. In particular, for occupied $P subset Q$ at depths $b gt.eq a$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ frac(rho_alpha \( P \), rho_alpha \( Q \)) = R^(- \[ m_alpha \( b \/ N \) - m_alpha \( a \/ N \) \] plus.minus C_n lambda) . $ <reg:conditional-mass>]

 Constants depend only on $n$; the threshold for $N$ can depend on $lambda$.]
] <reg:regularization>

#proof[
  Discard depth-$N$ cubes of mass less than $R^(- n - 2)$. There are at most $R^n$ such cubes, so this costs at most $R^(- 2)$. Choose depths
  $ 0 = j_0 < j_1 < dots.h.c < j_J = N \, #h(2em) j_i - j_(i - 1) lt.eq lambda N + 1 \, #h(2em) J lt.eq C \/ lambda . $
  Give each remaining leaf its dyadic mass bin as an initial label. There are $O_n \( N \)$ possible initial labels. Work upwards through the selected depths. If $ell$ is a label at depth $j_i$, count, within each depth-$j_(i - 1)$ parent, the depth-$j_i$ children carrying $ell$; extend $ell$ by the dyadic bin of this positive count. The extension is given to all leaves of label $ell$ in that parent. A parent can carry several labels, but the sets of leaves having different labels are disjoint. At every extension there are at most $O_n \( N \)$ possible count bins. Consequently the number of final labels is at most $N^(C_n \/ lambda)$, after adjusting constants for sufficiently large $N$.
  Fix a final label. For each $i$ there is a positive integer $b_i$, which is a power of two, such that every occupied depth-$j_(i - 1)$ parent has between $b_i$ and $2 b_i$ occupied depth-$j_i$ children in this label. To check that these comparisons survive the later extensions, fix a partial label and a node at the current selected depth. All leaves with that label in this node receive the same extension, determined by its parent and the old label. At each subsequent, higher step the extension is again constant on this entire group. Backward induction through the selected depths therefore shows that a final label retains or removes each earlier child group as a whole; it never splits that group. Consequently the branching comparisons hold simultaneously. Also
  $ 1 lt.eq b_i lt.eq 2^(n \( j_i - j_(i - 1) \)) . $
  All leaf masses are in one dyadic bin. Counting leaves below a selected node, and then normalizing the final class, therefore gives
  $ rho_alpha \( Q \) = 2^(plus.minus C J) #scale(x: 180%, y: 180%)[\(] product_(h lt.eq i) b_h #scale(x: 180%, y: 180%)[\)]^(- 1) quad upright("at depth ") j_i . $
  Define
  $ m_alpha \( j_i \/ N \) = 1 / N sum_(h lt.eq i) log_2 b_h $
  and interpolate linearly. Its slopes lie in $\[ 0 \, n \]$ exactly. At an intermediate depth, an occupied cube is contained in its preceding selected-depth parent and contains an occupied descendant at the next selected depth. Both the possible mass variation and the profile variation across this gap are at most $R^(n lambda + O_n \( 1 \/ N \))$. The remaining comparison error is $2^(O \( J \))$, whose base-$R$ logarithm is $O \( 1 \/ \( lambda N \) \)$. For fixed $lambda$ and sufficiently large $N$ these errors imply Equation (3.1).
  Discard final classes of original mass less than $R^(- lambda)$. Their total mass is bounded by the number of labels times $R^(- lambda)$, as asserted. For any retained class, normalization multiplies an original upper ball bound by at most $R^lambda$. Covering a depth-$j$ cube by a bounded number of balls of radius $2^(- j)$ gives
  $ rho_alpha \( Q \) lt.eq C_n K R^lambda 2^(- s j) . $
  Comparison with the lower bound in Equation (3.1) proves Equation (3.2) at integer depths, with a larger dimensional constant. Linear interpolation gives it at every $u$. Dividing two instances of Equation (3.1) proves Equation (3.3). ◻
]

For use in scale-compactness arguments, the proof also gives the following precise interpretation of subpower regularity. If $lambda = lambda_N arrow.r 0$ sufficiently slowly that $lambda_N^2 N \/ log N arrow.r oo$, then the number of classes, all mass comparison losses, and the normalization losses of retained classes are $R^(o \( 1 \))$, while the discarded mass tends to zero. Their profiles remain exactly $n$-Lipschitz. This observation alone does not assert a fixed power of discarded mass: fixed positive deletion exponents are obtained by choosing a fixed small regularization parameter after the relevant compactness argument.

#thm([Lemma 3.2.])[
  (Density pruning and multiplication).  #emph[Let $rho$ be a source probability and $nu$ a finite pin measure, both on $bb(R)^n$, and let $0 lt.eq a_0 < dots.h.c < a_J lt.eq N$ be a fixed finite collection of dyadic depths. Suppose pin–source distances on the sets in question are between fixed positive constants. Let $G'$ be a measurable set of pairs. For each $j < J$, suppose there is a measurable set $E_j supset G'$ and a number $f_j gt.eq 0$ such that every $\( x \, z \) in G'$, with $z in Q$ at depth $a_j$, satisfies 
#[#set math.equation(numbering: n => "(3.4)")
 $ rho { z' in Q ∩ \( E_j \)_x : \| pi_x \( z' \) - pi_x \( z \) \| lt.eq C 2^(- a_(j + 1)) } lt.eq f_j rho \( Q \) . $ <reg:local-fibre>]

 The constant $C$ may be any sufficiently large fixed constant, depending on the geometry and on the fixed angular width to be used below. For every $e > 0$ one can delete pair mass at most $\( J + 1 \) R^(- e) nu \( bb(R)^n \)$ from $G'$ and obtain $G''$ such that, for each pin $x$, each initial cube $Q_0$ at depth $a_0$, and every spherical ball $B$ of radius $C_12^(- a_J)$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ rho { z in Q_0 ∩ G''_x : pi_x \( z \) in B } lt.eq R^(e J) #scale(x: 180%, y: 180%)[\(] product_(j = 0)^(J - 1) f_j #scale(x: 180%, y: 180%)[\)] rho \( Q_0 \) . $ <reg:multiplied-fibre>]

 An identical conclusion holds without a lower pin–source separation if Equation (3.4) instead tests the perpendicular distance to the full line $x + bb(R) \( z - x \)$ at width $C 2^(- a_(j + 1))$, provided pin and source sets remain bounded and pairs on the diagonal have been removed.]
] <reg:pruning-multiplication>

#proof[
  For each endpoint depth delete the pairs $\( x \, z \) in G'$ whose source cube $Q$ satisfies
  $ rho \( Q ∩ G'_x \) < R^(- e) rho \( Q \) . $
  For a fixed pin, the total source mass deleted at one depth is at most $R^(- e)$, by summing over the disjoint cubes. Integration in the pin and a union bound prove the deletion estimate. Notice that the density condition concerns $G'$, before this last deletion. No density assertion for $G''$ is needed.
  Fix $x \, Q_0 \, B$. Call a cube at any endpoint depth hit if it contains a point of $Q_0 ∩ G''_x$ whose direction lies in $B$. In a hit parent $Q$ at depth $a_j$, choose one such point $z_Q$. If a child $P$ at depth $a_(j + 1)$ is hit, choose a corresponding point $z_P$. The map $pi_x$ is uniformly Lipschitz on the separated source set, so every $z' in P ∩ G'_x$ has
  $ \| pi_x \( z' \) - pi_x \( z_Q \) \| lt.eq C_22^(- a_(j + 1)) + 2 C_12^(- a_J) lt.eq C 2^(- a_(j + 1)) . $
  As $G' subset E_j$, Equation (3.4) and the pre-deletion density of every hit child imply
  $ sum_(P subset Q\
P upright(" hit at ") a_(j + 1)) rho \( P \) lt.eq R^e sum_(P upright(" hit")) rho \( P ∩ G'_x \) lt.eq R^e f_j rho \( Q \) . $
  Iterate this inequality from $Q_0$ to depth $a_J$. The mass on the left of Equation (3.5) is at most the sum of the full masses of the final hit cubes, proving that Equation.
  For the line-width variant, the two hit witnesses have directions within $2 C_12^(- a_J)$. Bounded pin–source distances from above imply that $z_P$ lies within $O \( 2^(- a_J) \)$ of the line through $x \, z_Q$; every point of $P$ is then within $O \( 2^(- a_(j + 1)) \)$ of that line. The preceding argument applies unchanged. This step uses no Lipschitz bound for the radial map near its pin. ◻
]

All selections above can be made measurably: the cube partitions and label sets are finite, and the fibre integrals are measurable. Enlarging fixed test widths permits the use of closed caps or closed tubes without altering any exponent.

== 4 An angular projection gain <ang:section>

This section proves the finite-scale incidence estimate used to improve the angular exponent in odd dimensions. Its geometric content is a bound on incidences whose fiber at each line direction is covered by a small number of parallel tubes. The planar discretized Furstenberg theorem is the only deep input.

All sets in this section lie in fixed bounded regions. Directions are unit vectors, with antipodal vectors identified when discussing lines. A finite number of projective charts removes this distinction. For a bounded set $A$, write $\| A \|_r$ for its covering number by balls of radius $r$. A tube has bounded length and the stated perpendicular width; enlarging its length by a fixed constant is always permitted. We use the ball-bound and subpower conventions of Section 2. Bounds for radii in a fixed larger bounded interval follow by changing constants. In particular, incidence mass at least subpower means a lower bound $delta^(o \( 1 \))$.

=== 4.1 The gain and its two slicing regimes <the-gain-and-its-two-slicing-regimes>

#thm([Theorem 4.1.])[
  (Linear projection gain).  #emph[Fix $k gt.eq 2$ and 
$ k - 1 lt.eq q lt.eq k - 1 / 2 < t < k . $

 Fix a tube-width constant $C$. In the case $q = k - 1$, also fix $zeta > 0$. There exist $epsilon.alt \, c > 0$ such that, for all sufficiently small $delta$, the following holds. Let $mu$ be a bounded point subprobability in $bb(R)^(k + 1)$ and $nu$ a direction subprobability on $S^k$ with respective $t$- and $q$-ball bounds of loss $delta^(- epsilon.alt)$ down to $delta$. At $q = k - 1$ assume in addition 
#[#set math.equation(numbering: n => "(4.1)")
 $ nu { w : "dist" \( w \, H \) lt.eq r } lt.eq delta^(- epsilon.alt) r^zeta #h(2em) \( delta lt.eq r lt.eq 1 \) $ <ang:endpoint-plate>]

 for every linear hyperplane $H$. Let $E subset bb(R)^(k + 1) times S^k$ be a measurable incidence relation, and write $E_w = { x : \( x \, w \) in E }$. If each direction fiber $E_w$ is covered by at most $delta^(- q - epsilon.alt)$ tubes parallel to $w$ of width $C delta$, then 
$ \( mu ⊗ nu \) \( E \) lt.eq delta^c . $

 All constants are uniform over the measures and the incidence relations with these fixed parameters.]
] <ang:linear-gain>

A cover by $delta^(- q - epsilon.alt)$ tubes means that the perpendicular projection of a direction fiber is covered by that many balls of radius comparable to $delta$. The theorem says that such covers cannot capture more than power-small incidence between the two nonconcentrated laws.

The two cases in its proof are distinguished by what remains after slicing. If $q > k - 1$, slicing by codimension $h = k - 1$ leaves a plane and exponents

$ b = q - h in \( 0 \, 1 / 2 \] \, #h(2em) f = t - h in \( 1 / 2 \, 1 \) \, #h(2em) b < f . $

The planar incidence estimate applies in this range. At $q = k - 1$, the same slicing would leave direction exponent zero. Instead we use $h = k - 2$, leaving three-dimensional slices with direction exponent one and point exponent greater than $3 \/ 2$. The endpoint argument finds three transverse directions in one such slice. A weak radial estimate with exponent $ell > k - 2$ controls the triples that are almost dependent.

=== 4.2 The planar incidence input and its measure formulation <the-planar-incidence-input-and-its-measure-formulation>

The metric on bounded affine line parameters may be taken to be the sum of the distance between the associated orthogonal projection operators and the distance between the closest-to-origin points on the lines. Other smooth bounded-chart metrics are equivalent. A nonempty bounded set $P$ of points or line parameters is a $\( delta \, s \, K \)$-set if

$ \| P ∩ B \( a \, r \) \|_delta lt.eq K r^s \| P \|_delta #h(2em) \( delta lt.eq r lt.eq 1 \) . $

The normalization by $\| P \|_delta$ is part of the defining bound.

#thm([Theorem 4.2.])[
  (Planar discretized Furstenberg estimate).  #emph[Let $0 < b < 1$ and $b < f < 2$. There is $epsilon.alt_0 > 0$ such that the following holds for sufficiently small $delta$. Suppose that $P$ is a nonempty bounded $\( delta \, f \, delta^(- epsilon.alt_0) \)$-set and that each $x in P$ has a nonempty family $cal(T)_x$ of incident $delta$-tubes whose line parameters form a $\( delta \, b \, delta^(- epsilon.alt_0) \)$-set. Then 
$ lr(|union.big_(x in P) cal(T)_x|)_delta gt.eq delta^(- 2 b - epsilon.alt_0) . $

 The exponent may be decreased to absorb fixed bounded charts and fixed width multiples.]
] <ang:furstenberg>

This is the tube formulation in #cite(label("OSW2024")) Definitions 2.5–2.6 and Theorem 2.7, following the discretized theorem of #cite(label("OS2023")) Theorem 1.3. In the application below, $f < 1$; that range is included in the theorem.

The measure formulation below keeps the labels being sampled separate from their geometric coordinates. Several labels may have the same coordinate and still carry different incidence fibers.

#thm([Lemma 4.3.])[
  (Planar measure incidence obstruction).  #emph[Fix $0 < b < 1$ and $b < f < 2$. There is no sequence $delta arrow.r 0$ with the following data. Let $mu \, nu$ be subprobabilities on Borel label sets $X \, W$ in Euclidean spaces, and let 
$ p : X arrow.r bb(R)^2 \, #h(2em) v : W arrow.r S^1 $

 be measurable coordinate maps with fixed bounded images. Suppose that $p_(\#) mu$ and $v_(\#) nu$ have respective $f$- and $b$-ball bounds of loss $delta^(- o \( 1 \))$ down to $delta$. Let $E subset X times W$ be a measurable incidence relation with 
$ \( mu ⊗ nu \) \( E \) gt.eq delta^(o \( 1 \)) . $

 For each original direction label $omega in W$, put $E_omega = { xi in X : \( xi \, omega \) in E }$. Assume that the set of point coordinates $p \( E_omega \)$ is covered by at most $delta^(- b - o \( 1 \))$ strips of width $C delta$ parallel to $v \( omega \)$.]
] <ang:planar-measures>

#proof[
  Restrict the coordinate images to fixed bounded charts and normalize the two laws. Their masses are at least the incidence mass, so this costs only subpower factors. Let $I$ be the resulting incidence mass, sample $n = ceil.l delta^(- b) ceil.r$ independent direction labels $omega_1 \, dots.h \, omega_n$ from $nu$, and write $v_i = v \( omega_i \)$. There is a subpower quantity $T arrow.r oo$ such that, with failure probability smaller than any prescribed power of $delta$, the sample satisfies
  #[#set math.equation(numbering: n => "(4.2)")
   $ \# { i : v_i in B \( v_0 \, r \) } lt.eq T n r^b #h(2em) \( delta lt.eq r lt.eq 1 \) . $ <ang:sample-caps>]
  To verify this, use a fixed collection of dyadic grids in the direction chart. There are only polynomially many relevant cells. Their expected counts are at most $K n r^b$, where $K = delta^(- o \( 1 \))$, and $n r^b gt.eq 1$. Choose $T$ larger than a fixed large multiple of $K + log \( 1 \/ delta \)$. For a binomial count $Y$, the bound
  $ Pr \( Y gt.eq j \) lt.eq \( e bb(E) Y \/ j \)^j $
  and a union bound prove Equation (4.2), including arbitrary balls by fixed grid comparison. Increasing $T$ by another subpower factor makes the failure probability smaller than $I \/ 4$.
  The expected empirical incidence mass equals $I$. Since it is bounded by one, there exists a sample satisfying Equation (4.2) and having empirical incidence mass at least $I \/ 2$. The set $X_0$ of point labels incident to at least $I n \/ 4$ sampled direction labels has $mu$-mass at least $I \/ 4$: its complement contributes at most $I \/ 4$ to the empirical incidence integral. Normalize $mu \|_(X_0)$ and sample $m = ceil.l delta^(- f) ceil.r$ independent point labels. If their coordinates are $x_1 \, dots.h \, x_m$, the same argument gives a sample with
  $ \# { j : x_j in B \( x \, r \) } lt.eq T' m r^f \, #h(2em) T' = delta^(- o \( 1 \)) \, #h(2em) delta lt.eq r lt.eq 1 . $
  In particular, the multiplicities in $delta$-balls are subpower. Color a spatial $delta$-grid with finitely many colors so that cells with the same color are $delta$-separated. Choose a color with the most occupied cells and one sampled label from each of them. Their point coordinates form a separated set $P$ with $\| P \|_delta gt.eq m delta^(o \( 1 \))$. The displayed local count makes $P$ a $\( delta \, f \, delta^(- o \( 1 \)) \)$-set. Each $x in P$ retains the list of at least $I n \/ 4$ good sampled direction labels belonging to its chosen point label.
  For $x in P$, take the lines exactly through $x$ in the coordinates $v_i$ of those listed labels, and let $cal(T)_x$ be their $delta$-tubes. Equation (4.2) bounds the multiplicity in a $delta$-ball of directions by $C T$, and the count in an $r$-ball by $T n r^b$. Consequently
  $ \| cal(T)_x \|_delta gt.eq c I n \/ T \, #h(2em) \| cal(T)_x ∩ B \( ell \, r \) \|_delta lt.eq C T n r^b . $
  Here the direction component of the line metric supplies the lower distance comparison; the reverse comparison holds because $x$ is bounded. The normalized loss is therefore at most $C T^2 \/ I = delta^(- o \( 1 \))$. In particular, $cal(T)_x$ is a nonempty $\( delta \, b \, delta^(- o \( 1 \)) \)$-set of line parameters even when different sampled labels have the same direction coordinate.
  For each sampled label $omega_i$, its prescribed strips contain the coordinates of all its incident sampled point labels. Moving the central line of such a strip to pass through one of these points changes its intercept by $O \( delta \)$. Thus each original strip accounts for only a bounded number of $delta$-cells in line-parameter space. Altogether the union of our line families has covering count at most
  $ n delta^(- b - o \( 1 \)) = delta^(- 2 b - o \( 1 \)) . $
  This contradicts Theorem 7 for small $delta$. The count treats each original sampled direction label separately; it never asks for one common fiber cover after coincident coordinates are identified. ◻
]

=== 4.3 Slicing with controlled losses <slicing-with-controlled-losses>

We state the needed estimates for Haar-random subspaces before applying them. Haar measure is normalized to have total mass one.

#thm([Lemma 4.4.])[
  (Haar band estimates).  #emph[Let $0 lt.eq h lt.eq n - 1$, and let $V$ be a Haar-random codimension-$h$ linear subspace of $bb(R)^n$. For a unit vector $w$, 
$ Pr { "dist" \( w \, V \) lt.eq delta } asymp delta^h . $

 If $j lt.eq n - h$ unit vectors $w_1 \, dots.h \, w_j$ have singular values $d_1 gt.eq dots.h.c gt.eq d_j gt.eq 0$, then 
#[#set math.equation(numbering: n => "(4.3)")
 $ delta^(- j h) Pr { "dist" \( w_i \, V \) lt.eq delta upright(" for all ") i } lt.eq C_(n \, j) product_(i = 1)^j \( d_i + delta \)^(- h) . $ <ang:haar-multiple>]

 When $h = 0$, the probability and the factors with exponent $h$ are one.]
] <ang:haar>

#proof[
  The one-vector estimate follows from spherical coordinates. For the second estimate, singular-value decomposition implies that the band conditions constrain the projections of orthonormal singular directions $u_i$ by $C_j delta \/ d_i$. Keep only the constraints whose right-hand sides are less than a sufficiently small dimensional constant, and order these right-hand sides increasingly. By rotational invariance, one can fix $V^perp$ and reveal successive vectors of a random orthonormal frame. Conditional on the earlier constrained vectors, projection onto $V^perp$, restricted to their orthogonal complement, has rank $h$ and nonzero singular values bounded below. Indeed the sum of squared lengths of the earlier projections is less than $1 \/ 2$ if the dimensional constant was chosen small enough. The next vector is uniform on the unit sphere of that complement. Its probability of having projection of length at most $r$ is at most $C_n r^h$. The ambient dimension at this last conditional step is at least $n - j + 1 gt.eq h + 1$, including the limiting case of a one-dimensional kernel. Multiplying the conditional estimates proves
  $ Pr { w_i upright(" all in the band") } lt.eq C_(n \, j) product_i min \( 1 \, delta \/ d_i \)^h \, $
  which is equivalent to Equation (4.3). ◻
]

Shmerkin and Wang #cite(label("SW2025")) Sections 6.1–6.3 use normalized bands to define slices and combine sliced with projected thin-tube bounds. Here we keep bands at width $delta$ and control the retained incidence mass, ball bounds, and active tubes for each original direction label.

#thm([Lemma 4.5.])[
  (Selection of slices).  #emph[Let $0 lt.eq h lt.eq n - 2$. Let point and direction subprobabilities $mu \, nu$ in $bb(R)^n$ have $t$- and $q$-ball bounds with subpower losses, where $t \, q > h$. Assume the directions lie in a fixed small projective chart. Let an incidence relation $E$ have mass at least subpower, and suppose each direction fiber is covered by at most $delta^(- q - o \( 1 \))$ tubes of width $C delta$.]
  #emph[For Haar-random codimension-$h$ subspaces $V$ and $z in V^perp$, set 
$ d nu_V \( w \) & = delta^(- h) upright(bold(1))_({ \| P_(V^perp) w \| lt.eq delta }) thin d nu \( w \) \,\
d mu_(V \, z) \( x \) & = delta^(- h) upright(bold(1))_({ \| P_(V^perp) x - z \| lt.eq delta }) thin d mu \( x \) . $

 Integrate $z$ over a fixed sufficiently large ball. There are families of restrictions $tilde(nu)_V lt.eq nu_V$, $tilde(mu)_(V \, z) lt.eq mu_(V \, z)$, and relations $tilde(E)_(V \, z) subset E$, measurable in the displayed parameters and restricted to the two bands defining $mu_(V \, z)$ and $nu_V$, such that 
$ bb(E)_V integral \( tilde(mu)_(V \, z) ⊗ tilde(nu)_V \) \( tilde(E)_(V \, z) \) thin d z gt.eq delta^(o \( 1 \)) \, $

 and the following hold:]
  + #emph[The restricted measures have masses and ball losses at most $delta^(- o \( 1 \))$, with exponents $q - h$ and $t - h$, respectively.]
  + #emph[Each remaining direction fiber is covered by at most $delta^(- \( q - h \) - o \( 1 \))$ width-$C' delta$ tubes.]
  + #emph[Put 
$ p_(V \, z) \( x \) = P_V x \, #h(2em) v_V \( w \) = P_V w \/ \| P_V w \| quad upright("for ") \| P_(V^perp) w \| lt.eq delta . $

 The first map is projection to $V + z$ followed by translation to $V$; the second is well-defined on the direction band for small $delta$. The coordinate pushforwards of the restricted measures under these maps satisfy the ball bounds in item 1, with fixed constant changes. For every original direction label $w$ in that band, the coordinates $p_(V \, z) \( { x : \( x \, w \) in tilde(E)_(V \, z) } \)$ have the tube cover in item 2 with direction $v_V \( w \)$. This cover remains attached to $w$ even when two projected direction coordinates coincide.]
  #emph[The direction restriction $tilde(nu)_V$ depends on $V$ only, and its mass has an a priori subpower upper bound valid for every $V$.]
] <ang:slice-selection>

#proof[
  We first choose the fiber covers measurably, enlarging their width by a fixed dimensional factor while preserving each actual direction $w$. Let $M_delta = delta^(- q - o \( 1 \))$ be their common size bound. Use a finite spatial $delta$-grid in a fixed bounded region containing one point on every axis whose tube meets the source region. Rounding such a point to the grid and keeping the direction $w$ enlarges the width by only $C_n delta$. Candidate covers are the finitely many lists of at most $floor.l M_delta floor.r$ grid anchors. For each candidate $J$, the function
  $ w mapsto mu (E_w \\ union.big_(a in J) T \( w \, a \)) $
  is measurable by Fubini, where $T \( w \, a \)$ is the enlarged tube parallel to $w$ through $a$. Choose the first candidate for which this function is zero. Coverage up to a $mu$-null set suffices, since every point slice $mu_(V \, z)$ is absolutely continuous with respect to $mu$. For a relation measurable only in the completed product sigma-algebra, first choose a Borel subset agreeing with the relation modulo a product-null set, and discard the $nu$-null set of directions on which its fiber differs by positive $mu$-mass. Every direction slice is absolutely continuous with respect to $nu$, so this replacement also changes no sliced incidence. Writing $J \( w \)$ for the selected candidate, now replace $E$ by
  $ E ∩ {\( x \, w \) : x in union.big_(a in J \( w \)) T \( w \, a \)} \, $
  with the exceptional null directions removed. This loses zero original or sliced incidence and makes the selected covers contain every fiber of the restricted relation.
  Intersecting the relation with the two bands does not change its sliced incidence. The expected sliced incidence is comparable from below to the original one. In fact, integrating the point-band indicator in $z$ gives a constant times $delta^h$, and the one-vector Haar estimate supplies another factor comparable to $delta^h$. These cancel the two slice normalizations.
  Write $M \( V \) = parallel nu_V parallel$ and $L \( V \, z \) = parallel mu_(V \, z) parallel$. Uniformly in $V$,
  #[#set math.equation(numbering: n => "(4.4)")
   $ integral L \( V \, z \) thin d z lt.eq C . $ <ang:point-slice-total>]
  The two-vector estimate in a projective chart gives the direction-pair kernel
  #[#set math.equation(numbering: n => "(4.5)")
   $ delta^(- 2 h) Pr { w \, w' upright(" both within ") delta upright(" of ") V } lt.eq C \( \| w - w' \| + delta \)^(- h) . $ <ang:direction-pair-kernel>]
  For points, integrate both band indicators in $z$ first. This yields at most $C delta^h$ times the indicator $\| P_(V^perp) \( x - x' \) \| lt.eq 2 delta$. Haar averaging therefore gives the analogous normalized kernel $C \( \| x - x' \| + delta \)^(- h)$. Dyadic annulus summation, using $q \, t > h$, proves
  #[#set math.equation(numbering: n => "(4.6)")
   $ bb(E)_V M \( V \)^2 + bb(E)_V integral L \( V \, z \)^2 thin d z & lt.eq delta^(- o \( 1 \)) \,\
bb(E)_V integral.double_(\| w - w' \| lt.eq r) d nu_V \( w \) d nu_V \( w' \) & lt.eq delta^(- o \( 1 \)) r^(q - h) \,\
bb(E)_V integral integral.double_(\| x - x' \| lt.eq r) d mu_(V \, z) \( x \) d mu_(V \, z) \( x' \) thin d z & lt.eq delta^(- o \( 1 \)) r^(t - h) $ <ang:slice-second>]
  for $delta lt.eq r lt.eq 1$. For example, the shells below $r$ form a geometric sum with successive exponents $q - h > 0$ in Equation (4.6); the finest shell uses the original ball estimate at radius $delta$.
  The truncations below first bound direction-slice mass, then enforce both ball bounds, and finally bound the active tube count. Take a subpower number $K arrow.r oo$ absorbing all constants, all input losses, the dyadic radius sums in Equations (4.6) and (4.6), and the inverse original incidence mass. Enlarge it so the sliced incidence is at least $K^(- 1)$ and the right-hand side of Equation (4.6) is at most $K$. First remove planes with $M \( V \) > K^3$. By Equations (4.4) and (4.6), their incidence contribution is at most $C K^(- 2)$.
  In the remaining point slices, remove points at which
  $ mu_(V \, z) \( B \( x \, C r \) \) > K^6 r^(t - h) $
  at some dyadic radius $r in \[ delta \, 1 \]$. Markov’s inequality and Equation (4.6) bound the expected deleted point mass by $C K^(- 5)$. Since $M \( V \) lt.eq K^3$, its incidence cost is at most $C K^(- 2)$. The restricted point measure has the asserted ball bound at every center: any ball meeting the retained set can be enlarged by a fixed factor around a retained point. It also has mass $O \( K^6 \)$, by covering the bounded support with a fixed number of unit balls.
  Similarly remove direction-slice points for which $nu_V \( B \( w \, C r \) \) > K^3 r^(q - h)$ at some dyadic radius. Their expected mass is at most $C K^(- 2)$ by Equation (4.6); Equation (4.4) bounds the corresponding integrated incidence loss by the same quantity. No independence between direction mass and point mass is used here.
  Finally, for a direction $w$ in the band about $V$, let $J \( w \)$ be its selected list of grid anchors. A bounded tube through $a$, parallel to $w$, can meet the source region in the band about $V + z$ only if $\| P_(V^perp) a - z \| lt.eq C' delta$: its transverse projection within the bounded source region has diameter $O \( delta \)$. Thus the measurable upper count
  $ N \( V \, z \, w \) = sum_(a in J \( w \)) upright(bold(1))_({ \| P_(V^perp) a - z \| lt.eq C' delta }) $
  dominates the number of active covering tubes and satisfies
  $ integral N \( V \, z \, w \) thin d z lt.eq C M_delta delta^h lt.eq K delta^(h - q) . $
  Delete direction/$z$ pairs for which $N \( V \, z \, w \) > K^12 delta^(h - q)$. Their $z$-volume for each $V \, w$ is at most $K^(- 11)$. The truncated point mass is $O \( K^6 \)$ and the truncated direction mass is at most $K^3$, so this costs at most $C K^(- 2)$ in integrated incidence. Delete the corresponding incidences but keep the marginal restrictions already constructed. At large $K$ the surviving integrated incidence is at least $\( 2 K \)^(- 1)$.
  Projection changes each direction by $O \( delta \)$. The points of one band whose coordinates $p_(V \, z) \( x \)$ lie in a ball of radius $r gt.eq delta$ lie in a ball of radius $C r$ in the original space; the same assertion holds for directions after unit normalization. These preimage bounds give the asserted ball bounds on the coordinate pushforwards. For each original label $w$, every active tube in its own selected list becomes a tube of width $C' delta$ parallel to $v_V \( w \)$. This proves item 3 for each original direction label. ◻
]

=== 4.4 Endpoint preparation: transverse tubes and weak radial estimates <endpoint-preparation-transverse-tubes-and-weak-radial-estimates>

We first record the elementary counting fact used twice below.

#thm([Lemma 4.6.])[
  (Transverse tube counting).  #emph[Let $v_1 \, dots.h \, v_m$ be unit vectors in $bb(R)^m$, $m gt.eq 2$, and suppose $\| det \( v_1 \, dots.h \, v_m \) \| gt.eq Delta > 0$. If a bounded set $A$ is covered, for each $i$, by $M_i$ tubes of width $C delta$ parallel to $v_i$, then 
$ \| A \|_(C_m delta) lt.eq C_(m \, C) Delta^(- m) product_(i = 1)^m M_i^(1 \/ \( m - 1 \)) . $

 Changing the fixed constant in the covering radius changes only the constant in this inequality.]
] <ang:loomis-whitney>

#proof[
  Let $L$ be the matrix with columns $v_i$. Then $parallel L parallel lt.eq C_m$ and $parallel L^(- 1) parallel lt.eq C_m Delta^(- 1)$. Let $S subset bb(Z)^m$ index the $delta$-grid cubes meeting $L^(- 1) A$. The image of such a cube has diameter at most $C_m delta$. Each original tube parallel to $v_i$ becomes a tube parallel to the $i$th coordinate axis, of width at most $C_(m \, C) delta Delta^(- 1)$. Therefore
  $ \| "pr"_(hat(i)) S \| lt.eq C_(m \, C) Delta^(- \( m - 1 \)) M_i . $
  The discrete Loomis–Whitney inequality #cite(label("LoomisWhitney1949")) $\| S \|^(m - 1) lt.eq product_i \| "pr"_(hat(i)) S \|$ proves the claim. For completeness, if $X$ is uniform on $S$, the entropy chain rule gives
  $ H \( X_(hat(i)) \) gt.eq sum_(j eq.not i) H \( X_j divides X_1 \, dots.h \, X_(j - 1) \) . $
  Summing in $i$ yields $\( m - 1 \) log \| S \| lt.eq sum_i log \| "pr"_(hat(i)) S \|$, as required. ◻
]

For $x eq.not z$, put $pi_x \( z \) = \( z - x \) \/ \| z - x \|$. A restriction of the product measure to a pair set is not normalized in the next statement.

#thm([Lemma 4.7.])[
  (Weak radial estimate).  #emph[Fix $k gt.eq 2$, $zeta > 0$, and 
$ k - 2 < ell < frac(\( k - 1 \)^2, k) . $

 For every $e > 0$ there exist $epsilon.alt \, c > 0$ with the following property for sufficiently small $delta$. Suppose that a probability $lambda$ in a bounded subset of $bb(R)^k$ satisfies 
$ lambda \( B \( x \, r \) \) & lt.eq delta^(- epsilon.alt) r^(k - 1) \,\
lambda \( H^(\( r \)) \) & lt.eq delta^(- epsilon.alt) r^zeta #h(2em) \( delta lt.eq r lt.eq 1 \) $

 for every affine hyperplane $H$, where $H^(\( r \))$ is its $r$-neighborhood. There is a measurable pair set $G$ such that 
$ \( lambda ⊗ lambda \) \( G^c \) lt.tilde delta^c \, #h(2em) lambda { z : \( x \, z \) in G \, med pi_x \( z \) in B \( theta \, r \) } lt.eq delta^(- e) r^ell $

 for every $x$, every spherical cap center $theta$, and $delta lt.eq r lt.eq 1$. The diagonal is omitted from $G$. The conclusion also holds for balls in projective direction space, with a fixed change of constant, by taking the two antipodal caps.]
] <ang:weak-radial>

#proof[
  We first prove a single-scale assertion at $u = 2^(- N)$, with reciprocal scale $R = 2^N$: for any fixed $ell_1 < \( k - 1 \)^2 \/ k$, sufficiently small fixed losses in the hypotheses permit deletion of $O \( R^(- c_1) \)$ pair mass so that every remaining fiber has cap mass at most $R^(- ell_1)$ at radius $u$. All choices made below are fixed independently of $R$.
  Apply Lemma 4 to the source measure with a small parameter $tau > 0$. It suffices to treat one normalized source class $rho$, retaining the original pin law $lambda$. The discarded source mass is a fixed negative power of $R$, and the classes will be recombined with their original weights. Write $m$ for the class profile. Its comparison errors are $R^(C_k tau)$, it is $k$-Lipschitz, and
  $ m \( 1 \) gt.eq k - 1 - C_k tau - epsilon.alt . $
  The constant absorbs the normalization of a class of mass at least $R^(- tau)$. At depths $a < b$, an occupied depth-$b$ child of an occupied depth-$a$ cell $Q$ has conditional $rho$-mass at most
  #[#set math.equation(numbering: n => "(4.7)")
   $ R^(C_k tau) D^(- 1) \, #h(2em) D = R^(m \( b \/ N \) - m \( a \/ N \)) . $ <ang:conditional-child>]
  Divide the depth interval into $J$ nearly equal blocks, with $J$ a large fixed integer, and ignore the first two blocks. In every later block $\[ a \, b \]$, remove the pairs whose pin is within $R^(- 1 \/ \( 4 J \))$ of the center $z_Q$ of the source cell $Q$ at depth $a$. Summing with the source-cell weights shows that this costs at most $C_J R^(- \( k - 1 \) \/ \( 4 J \) + epsilon.alt)$ pair mass. For the other pairs the center direction
  $ v \( x \, Q \) = frac(z_Q - x, \| z_Q - x \|) $
  differs from the direction to any point of $Q$ by $O \( 2^(- a) R^(1 \/ \( 4 J \)) \)$. In particular the transverse displacement inside $Q$ caused by freezing this direction is
  #[#set math.equation(numbering: n => "(4.8)")
   $ O \( 2^(- 2 a) R^(1 \/ \( 4 J \)) \) = o \( 2^(- b) \) \; $ <ang:freezing-error>]
  here $a gt.eq 2 N \/ J + O \( 1 \)$ and $b - a = N \/ J + O \( 1 \)$.
  Fix a small $e' > 0$. A pair $\( x \, z \)$, $z in Q$, is troublesome if the full conditional source mass in the width-$C 2^(- b)$ tube about the line through $x \, z$ exceeds
  #[#set math.equation(numbering: n => "(4.9)")
   $ F = R^(e') D^(- \( k - 1 \) \/ k) . $ <ang:local-fraction>]
  The fixed width $C$ may be chosen as large as any subsequent application requires. If $F gt.eq 1$, there are no troublesome pairs. Otherwise, Equation (4.8) and a grid in $v \( x \, Q \)^perp$ show that all troublesome sources for this pin lie in at most $C \/ F$ parallel tubes of width $C' 2^(- b)$. Indeed, each relevant projected grid cell has a fixed enlargement of conditional mass greater than $F$; these enlargements have bounded overlap.
  For this fixed $Q$, let $B_x$ be its troublesome source set when the pin survives the near-pin deletion, and let $B_x = diameter$ otherwise. Put $rho_Q = rho \|_Q \/ rho \( Q \)$ and
  $ I_Q = integral rho_Q \( B_x \) thin d lambda \( x \) . $
  We claim that $I_Q lt.eq R^(- c_2)$, uniformly in $Q$. Suppose instead that $I_Q gt.eq R^(- c_2)$. Jensen’s inequality, applied to the pin-incidence mass at each source, gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ integral rho_Q #scale(x: 180%, y: 180%)[\(] ⋂_(i = 1)^k B_(x_i) #scale(x: 180%, y: 180%)[\)] thin d lambda \( x_1 \) dots.h.c d lambda \( x_k \) gt.eq I_Q^k . $ <ang:common-k-incidence>]
  Tuples containing a removed pin contribute zero to this integral. For a tuple of surviving pins, if $\| det \( v \( x_1 \, Q \) \, dots.h \, v \( x_k \, Q \) \) \| < R^(- eta)$, one of the successive Gram–Schmidt distances is less than $R^(- eta \/ \( k - 1 \))$. Conditional on the preceding pins, the corresponding pin lies in a $C R^(- eta \/ \( k - 1 \))$-neighborhood of an affine hyperplane through $z_Q$. Thus the product measure of these tuples is at most
  $ C_k R^(epsilon.alt - eta zeta \/ \( k - 1 \)) . $
  Choose $eta$ small compared with $e'$, and then choose $c_2 \, epsilon.alt$ so small that this is $o \( R^(- k c_2) \)$. There is a tuple of determinant at least $R^(- eta)$ whose common source set has conditional mass at least $1 / 2 R^(- k c_2)$. By Equation (4.7), it needs at least
  $ c D R^(- k c_2 - C_k tau) $
  balls of radius comparable to $2^(- b)$. On the other hand, Lemma 11, applied to its $k$ tube covers, bounds this number by
  $ C D R^(k eta - e' k \/ \( k - 1 \)) . $
  The two estimates are contradictory if
  $ k eta + k c_2 + C_k tau < frac(k e', k - 1) . $
  These parameter requirements are compatible: first choose $eta$, then $c_2$, and finally $tau \, epsilon.alt$. This proves the claim. Deleting troublesome pairs and summing over $Q$ costs at most $R^(- c_2)$ per block, because the weights $rho \( Q \)$ sum to one.
  Apply the endpoint density pruning of Lemma 5, with an additional loss $R^(e'')$ per block, to the surviving pair set. Its physical-tube version applies even though pins need not be separated from sources by a fixed constant. To check this point directly, fix a parent $Q$ and consider its depth-$b$ children meeting one final cap of radius $2^(- N)$. Every point of such a child is within $C 2^(- b)$ of the target line. Choose one retained witness in one hit child of $Q$. Its line differs from the target line by transverse distance $O \( 2^(- N) \)$ in the bounded source region. Thus the pre-density-deletion survivors in all hit children of this parent satisfy the same local test at width $C' 2^(- b)$. In each child their mass is at least $R^(- e'')$ times the full child mass. The one local fraction bound therefore charges the sum of the full masses of hit children by $R^(e'') F$ times the full parent mass. It uses the survivor set before the final density deletion; no renewed density claim after that deletion is needed.
  Multiplying these inequalities telescopes the profile increments. Sum the resulting bounds over the occupied initial cells at the end of the two ignored blocks. Their masses sum to one, so this introduces no factor equal to the number of cells. The ignored growth is at most $2 k \/ J + o \( 1 \)$. Consequently every final cap has normalized class mass at most
  $ R^(J \( e' + e'' \) + o \( 1 \)) R^(- frac(k - 1, k) \( k - 1 - 2 k \/ J - C_k tau - epsilon.alt \)) . $
  Choose $J$ large depending on $\( k - 1 \)^2 \/ k - ell_1$, then $e' \, e''$ small, and then the remaining losses as above. This proves the single-scale assertion. All deletion exponents are positive fixed numbers. Recombining classes with their original weights preserves the cap estimate and the power deletion; the negligible discarded class mass is included in the deletion.
  Now choose $ell < ell_1 < \( k - 1 \)^2 \/ k$. It is enough to consider $0 < e < 1$. Apply the single-scale assertion at dyadic $u$ between $delta$ and $delta^(e \/ \( 2 k \))$. At these scales the input loss $delta^(- epsilon.alt)$ is at most $u^(- 2 k epsilon.alt \/ e)$, so choosing $epsilon.alt$ sufficiently small makes all the single-scale hypotheses uniformly valid. The sum of the deletions is at most
  $ C log \( 1 \/ delta \) thin delta^(e c_1 \/ \( 2 k \)) \, $
  which is a positive power of $delta$ after decreasing its exponent. Intersect the surviving pair sets. Dyadic comparison gives the desired cap estimate for $r lt.eq delta^(e \/ \( 2 k \))$; the slack between $ell$ and $ell_1$ absorbs fixed constants. For larger $r$, $delta^(- e) r^ell gt.eq 1$ at small scales, so the estimate is trivial. This completes the proof. ◻
]

=== 4.5 Proof of the linear gain <proof-of-the-linear-gain>

#proof[
  We rule out any sequence with subpower input losses, subpower incidence mass from below, and cover size $delta^(- q - o \( 1 \))$. This implies the stated fixed-power result: if no positive $epsilon.alt \, c$ worked, choose counterexamples with $epsilon.alt = c = 1 \/ j$ at scales $delta_j < 1 \/ j$ tending to zero. They would form precisely such a sequence. This observation will also justify all uses of the gain with sufficiently small fixed losses.
  By choosing one of finitely many small projective charts, we can assume all relevant directions lie in a single chart and that incidence still has subpower mass. If $q > k - 1$, apply Lemma 10 with $h = k - 1$. Select a slice with subpower incidence and normalize its marginal restrictions; their masses are bounded above by subpower and below by the incidence divided by the other marginal mass. The coordinate maps take values in a plane, with
  $ b = q - h in \( 0 \, 1 / 2 \] \, #h(2em) f = t - h in \( 1 / 2 \, 1 \) \, #h(2em) b < f \, $
  and tube count at most $delta^(- b - o \( 1 \))$. Apply Lemma 8 with the original sliced points and directions as labels, and with coordinate maps $p_(V \, z)$ and $v_V$. Item 3 of Lemma 10 gives the ball bounds on their coordinate pushforwards and the separate cover for each original direction label. The labeled incidence relation still has subpower mass, so these data contradict the planar obstruction.
  At $q = k - 1$, slicing to the plane would leave direction exponent zero, outside the range of Lemma 8. We therefore put $h = k - 2$, so the selected slices have dimension three, and let
  $ g = t - h - 3 / 2 > 0 . $
  Choose once and for all $0 < a < g \/ 4$. We will find in one slice three directions of determinant at least $c delta^a$ with a common incident point set of mass at least subpower. The resulting loss in Lemma 11 is $O \( delta^(- 3 a) \)$, which the strict gap $g$ will absorb.
  Parameterize our chart by $p in bb(R)^k$, with unit direction $w \( p \) = \( 1 \, p \) \/ sqrt(1 + \| p \|^2)$. Restricting and normalizing the chart costs only a subpower factor; denote the resulting law in $p$ by $lambda$. In the rest of the endpoint proof the direction law supplied to slicing is $w_(\#) lambda$, and the incidence relation is restricted to this chart. The slice law of the chart labels is
  $ d lambda_V \( p \) = delta^(- h) upright(bold(1))_({ \| P_(V^perp) w \( p \) \| lt.eq delta }) thin d lambda \( p \) \, #h(2em) nu_V = w_(\#) lambda_V . $
  Equation (4.1) becomes the affine-hyperplane bound in the $p$ coordinates, because an affine hyperplane there is the intersection of a linear hyperplane with the chart. The ball exponent remains $k - 1$. Choose
  $ h < ell < frac(\( k - 1 \)^2, k) = h + 1 / k . $
  Apply Lemma 12 to this chart law, with a small fixed output loss $delta^(- e)$. Its hypotheses hold at sufficiently small scales for every fixed input-loss threshold. This deletes a pair set of original product mass $O \( delta^(c_e) \)$ and gives, for every anchor $p$, an $ell$-cap bound $delta^(- e) r^ell$ on the undeleted displacement directions. Also delete pairs at distance less than $delta^(b_0)$, where $b_0 > 0$ will be small. Denote the union of these two exceptional pair relations by $cal(E)_(upright("pair"))$, and call an anchored pair retained when it lies outside this union.
  We first record how these deletions transfer to normalized slice-pair mass. Equation (4.5) shows that for every measurable chart-pair relation $cal(E)$ with $\( lambda ⊗ lambda \) \( cal(E) \) lt.eq delta^c$, and every fixed $theta > 0$,
  #[#set math.equation(numbering: n => "(4.11)")
   $ bb(E)_V \( lambda_V ⊗ lambda_V \) \( cal(E) \) lt.eq C delta^(c - theta h) + delta^(theta \( q - h \) - o \( 1 \)) . $ <ang:exceptional-pair-transfer>]
  For $0 < theta lt.eq 1$, the first term treats distances greater than $delta^theta$, and the second treats smaller distances by the ball bound and annular summation. For $theta gt.eq 1$, the kernel is at most $C delta^(- h)$, so the whole expectation is at most $C delta^(c - h) lt.eq C delta^(c - theta h)$. The same annulus calculation bounds the expected mass of the close pairs by $delta^(b_0 \( q - h \) - o \( 1 \))$. We leave $theta$ free until $e$, and hence the weak-radial deletion exponent $c_e$, has been fixed.
  We next bound triples that are close to linearly dependent. For two retained anchored pairs $\( p \, p' \) \, \( p \, p'' \)$, set
  $ alpha = lr(|frac(p' - p, \| p' - p \|) and frac(p'' - p, \| p'' - p \|)|) . $
  In a bounded chart,
  #[#set math.equation(numbering: n => "(4.12)")
   $ \| w \( p \) and w \( p' \) and w \( p'' \) \| asymp \| p' - p \| thin \| p'' - p \| thin alpha . $ <ang:chart-wedge>]
  To see this, put $u = p' - p$ and $v = p'' - p$ and subtract the first unnormalized column from the other two. The orthogonal decomposition of exterior powers gives the identity
  $ \| \( 1 \, p \) and \( 0 \, u \) and \( 0 \, v \) \|^2 = \| u and v \|^2 + \| p and u and v \|^2 . $
  It supplies the lower bound, while boundedness of $p$ supplies the upper bound. Normalizing the three columns changes only fixed constants. Consequently a wedge smaller than $2 delta^a$ implies $alpha lt.eq C delta^(a - 2 b_0)$.
  For $\( w_1 \, w_2 \, w_3 \) = \( w \( p \) \, w \( p' \) \, w \( p'' \) \)$, the largest singular value is comparable to one. Their first two columns span area at least $c delta^(b_0)$, so the second singular value is at least $c delta^(b_0)$; by Equation (4.12), the third is at least $c delta^(2 b_0) alpha$. Lemma 9 therefore bounds their normalized expected slicing weight by
  #[#set math.equation(numbering: n => "(4.13)")
   $ delta^(- 3 h) Pr_V { max_(1 lt.eq i lt.eq 3) \| P_(V^perp) w_i \| lt.eq delta } lt.eq C delta^(- 3 h b_0) \( alpha + delta \)^(- h) . $ <ang:triple-weight>]
  This includes singular values below $delta$, since the kernel is truncated there. At fixed $p \, p'$, the weak radial estimate and the two antipodal caps give
  $ lambda { p'' : \( p \, p'' \) upright(" is retained") \, med alpha lt.eq r } lt.eq C delta^(- e) r^ell #h(2em) \( delta lt.eq r lt.eq 1 \) . $
  Let $cal(T)_delta$ be the chart triples whose two anchored pairs are retained and whose original wedge has size less than $2 delta^a$. Summing dyadic annuli in Equation (4.13), up to $C delta^(a - 2 b_0)$, gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E)_V lambda_V^(⊗ 3) \( cal(T)_delta \) lt.eq C delta^(\( a - 2 b_0 \) \( ell - h \) - e - 3 h b_0) . $ <ang:bad-triples>]
  Since $ell > h$, first choose $b_0 > 0$ sufficiently small depending on $a \, ell \, h$, and then $e > 0$ sufficiently small, so that this exponent is positive. These choices also ensure $a - 2 b_0 > 0$. With $e$ fixed, the weak radial estimate fixes $c_e > 0$. Now choose $theta > 0$ small enough that $c_e - theta h > 0$. Since $q - h = 1$, the second exponent in Equation (4.11) is also positive. Together with the close-pair bound, this proves that $cal(E)_(upright("pair"))$ has power-small expected slice-pair mass.
  Perform the restrictions in Lemma 10, and write $tilde(lambda)_V = \( w^(- 1) \)_(\#) tilde(nu)_V$ for the restricted law of chart labels. It is dominated by $lambda_V$ and has the same uniform subpower mass bound as $tilde(nu)_V$. Define
  $ F \( V \, z \, x \) = tilde(lambda)_V { p : \( x \, w \( p \) \) in tilde(E)_(V \, z) } . $
  Its integrated first moment is the retained sliced incidence and is at least subpower, while the total integrated point mass is bounded by a fixed constant. Hölder’s inequality consequently yields
  #[#set math.equation(numbering: n => "(4.15)")
   $ bb(E)_V integral integral F \( V \, z \, x \)^3 thin d tilde(mu)_(V \, z) \( x \) thin d z gt.eq delta^(o \( 1 \)) . $ <ang:triple-incidence>]
  Dropping the point-incidence indicators bounds the contributions of bad triples and exceptional anchored pairs by the left-hand sides below. Equation (4.4) and $tilde(lambda)_V lt.eq lambda_V$ give
  $ bb(E)_V integral parallel tilde(mu)_(V \, z) parallel tilde(lambda)_V^(⊗ 3) \( cal(T)_delta \) thin d z & lt.eq C bb(E)_V lambda_V^(⊗ 3) \( cal(T)_delta \) \,\
bb(E)_V integral parallel tilde(mu)_(V \, z) parallel thin parallel tilde(lambda)_V parallel \( tilde(lambda)_V ⊗ tilde(lambda)_V \) \( cal(E)_(upright("pair")) \) thin d z & lt.eq C sup_V parallel tilde(lambda)_V parallel thin bb(E)_V \( lambda_V ⊗ lambda_V \) \( cal(E)_(upright("pair")) \) . $
  Both quantities are power-small by Equation (4.14) and the preceding bound for $cal(E)_(upright("pair"))$; the latter also covers the two possible anchored pairs after changing the constant. No independence between the point and direction slices is used. Hence a subpower amount of the triple incidence in Equation (4.15) has original wedge at least $2 delta^a$. Projection to $V$ and unit normalization change each vector by $O \( delta \)$, so their determinant in $V$ is at least $delta^a$ for small $delta$.
  The total parameter mass for integrating $\( V \, z \)$ and three restricted chart labels is at most subpower, since $parallel tilde(lambda)_V parallel$ has a uniform subpower bound and the $z$-domain is bounded. It follows that some slice and some such triple have a common incident point set of sliced mass at least subpower. Let $A$ be its projected point coordinates. The pushforward of its restricted point measure has the same mass and inherits the point-coordinate ball bound, which implies
  $ \| A \|_delta gt.eq delta^(- \( t - h \) + o \( 1 \)) . $
  For each of the three original direction labels, the projected common point set has its own cover by $delta^(- \( q - h \) - o \( 1 \)) = delta^(- 1 - o \( 1 \))$ tubes in that label’s projected direction. By Lemma 11,
  $ \| A \|_delta lt.eq delta^(- 3 \/ 2 - 3 a - o \( 1 \)) . $
  This contradicts $3 a < g = t - h - 3 \/ 2$. When $k = 2$ we have $h = 0$; all slicing weights equal one and the same proof applies, with the $z$-integral interpreted as integration over the singleton zero-dimensional space. The endpoint and the theorem are proved. ◻
]

#thm([Corollary 4.8.])[
  (Small mass of bad directions).  #emph[Fix the parameters of Theorem 6. There are $c_1 \, epsilon.alt_1 > 0$ such that the following holds at sufficiently small $delta$. Let $mu$ be a bounded point probability satisfying the $t$-ball bound with loss $delta^(- epsilon.alt_1)$. Let $B_delta$ be the set of directions for which at most $delta^(- q - c_1)$ width-$C delta$ tubes capture $mu$-mass at least $delta^(c_1)$. There is a Borel set $B_delta^(+) supset B_delta$, depending only on the point law and this geometric test, such that every direction subprobability $nu$ satisfying the $q$-ball bound with loss $delta^(- epsilon.alt_1)$, and, when $q = k - 1$, Equation (4.1) with $epsilon.alt_1$ in place of $epsilon.alt$, satisfies 
$ nu \( B_delta^(+) \) lt.eq delta^(c_1) . $

 In particular this bounds the outer $nu$-measure of the original geometric bad set. The direction law need not be normalized on either set or on any individual incidence fiber. All predetermined fixed widths are allowed.]
] <ang:bad-directions>

#proof[
  Choose a fixed enlarged width $C' > C$ large enough for the spatial anchor rounding used in Lemma 10. Let $epsilon.alt \, c$ be supplied by Theorem 6 for width $C' delta$, and choose $epsilon.alt_1 lt.eq epsilon.alt \/ 2$ and $0 < c_1 < min \( epsilon.alt \/ 2 \, c \/ 3 \)$. In a fixed bounded spatial $delta$-grid consider all candidate lists $J$ of at most $floor.l delta^(- q - c_1) floor.r$ anchors. Keep the actual direction $w$ in every tube, and define
  $ B_delta^(+) = {w : max_J mu (union.big_(a in J) T_(C') \( w \, a \)) gt.eq delta^(c_1)} . $
  The candidate masses are measurable, so this is a Borel set. Rounding a point on each axis in an original bad cover gives a candidate at the enlarged width with at least the same captured mass. Consequently $B_delta subset B_delta^(+)$; equality is not needed. For each $w in B_delta^(+)$ choose the first candidate attaining the threshold. Its measurable incidence relation has mass at least $delta^(c_1) nu \( B_delta^(+) \)$ and uses at most $delta^(- q - c_1) lt.eq delta^(- q - epsilon.alt)$ tubes per fiber. Theorem 6 bounds its incidence by $delta^c$, hence $nu \( B_delta^(+) \) lt.eq delta^(c - c_1) lt.eq delta^(c_1)$. ◻
]

== 5 Preparation of the pair measures <prep:section>

Proposition 23 summarizes the output of this Section: decreasing pair filters of positive limiting mass with a controlled product partition. At each scale, a further power-small deletion gives cap bounds of exponent $S$ with an arbitrarily small power loss. Auxiliary projections estimate directions only; all distances remain those of the original pairs. We first prove the improvement needed in odd dimensions and then construct the measures to which it applies.

=== 5.1 From integer to half-integer directional bounds <from-integer-to-half-integer-directional-bounds>

For separated supports, write $pi_x \( z \) = \( z - x \) \/ \| z - x \|$. If $G$ is a set of pairs with pin law $nu$ and source law $rho$, its directional measures are

$ \( pi_x \)_(\#) \( rho \|_(G_x) \) \, #h(2em) \( pi_z \)_(\#) \( nu \|_(G^z) \) . $

These are subprobabilities; they are never normalized separately. A directional plate means ${ w in S^k : "dist" \( w \, V \) lt.eq u }$, where $V$ is a linear hyperplane in $bb(R)^(k + 1)$.

#prodef([Definition 5.1.])[
  Let $rho \, nu$ be fixed separated probabilities in $bb(R)^(k + 1)$, and let $G_N$ be Borel pair sets. An exponent $q$ is #emph[available] for this family if, for every $e > 0$, there are $c_e > 0$, $C_e < oo$, and Borel $B_N subset G_N$, for all sufficiently large $N$, such that
  $ \( nu ⊗ rho \) \( B_N \) lt.eq C_e 2^(- c_e N) \, $
  and both directional measures of $G_N \\ B_N$ give every spherical cap of radius $u in \[ 2^(- N) \, 1 \]$ mass at most $2^(e N) u^q$. The estimates hold at every pin in the retained supports, after removal of null fibers if necessary.
] <prep:availability>

#thm([Lemma 5.2.])[
  (A contact interval).  #emph[Suppose $m : \[ 0 \, 1 \] arrow.r bb(R)$ is nondecreasing and Lipschitz, $m \( 0 \) = 0$, and $m \( u \) gt.eq s u$. If $q < t < s$, there exist $0 < A < B < 1$, with $B < 2 A$, such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ m \( w \) & gt.eq q w &  & \( 0 lt.eq w lt.eq A \) \,\
m \( w \) - m \( A \) & gt.eq t \( w - A \) &  & \( A lt.eq w lt.eq B \) \,\
m \( w \) - m \( B \) & gt.eq q \( w - B \) &  & \( B lt.eq w lt.eq 1 \) . $ <prep:contact-first>]

]
] <prep:contact>

#proof[
  Put $g \( u \) = m \( u \) - q u$ and $F \( u \) = min_(u lt.eq v lt.eq 1) g \( v \)$. The function $F$ is nondecreasing and Lipschitz: if $u < v$, a minimizer for $F \( u \)$ either lies in $\[ v \, 1 \]$, or comparison with $g \( v \)$ bounds $F \( v \) - F \( u \)$ by $"Lip" \( g \) \( v - u \)$. Moreover, $F \( 0 \) = 0$ and $F \( 1 \) gt.eq s - q > t - q$. Absolute continuity gives an interior differentiability point $A$ at which $F' \( A \) > t - q$. At this point $F \( A \) = g \( A \)$, since a strict gap would force the minimum to be attained a fixed distance to the right and would make $F$ locally constant. There are contact points $B > A$ arbitrarily close to $A$: otherwise $F$ would be constant immediately to the right of $A$. Choose such a $B < min \( 2 A \, 1 \)$ so close that $F \( w \) - F \( A \) gt.eq \( t - q \) \( w - A \)$ on $\[ A \, B \]$. Using $g \( w \) gt.eq F \( w \)$ proves Equation (5.1). The first inequality follows from $m \( w \) gt.eq s w$, and the last follows from $g \( w \) gt.eq F \( B \) = g \( B \)$ for $w gt.eq B$. ◻
]

The argument below has precedents in the thin-tube bootstrap of Orponen, Shmerkin and Wang #cite(label("OSW2024")) Section 1.3 and Lemma 2.8 and in Shmerkin and Wang’s use of scale profiles to improve radial bounds #cite(label("SW2025")) Section 5.5. We use the contact interval to combine three local estimates while keeping a power bound for the deleted pair mass.

#thm([Lemma 5.3.])[
  (One-scale improvement).  #emph[Fix $k gt.eq 2$, $k - 1 / 2 < s < k$, $k - 1 lt.eq q < k - 1 / 2$, and $zeta > 0$. Fix bounded support, separation, and $s$-Frostman constants, as well as a plate-bound constant $C$. There are $epsilon_0 \, c > 0$ such that the following holds for all sufficiently small dyadic $delta$. Let $rho \, nu$ be probabilities with the fixed bounds, and let $G$ be a Borel pair set whose two directional measures satisfy, for $delta lt.eq u lt.eq 1$, 
$ lambda \( B \( w \, u \) \) lt.eq delta^(- epsilon_0) u^q \, #h(2em) lambda { w : "dist" \( w \, V \) lt.eq u } lt.eq C u^zeta . $

 Then one can delete pair mass at most $C delta^c$ so that both remaining directional measures give every cap of radius $delta$ mass at most $delta^(q + c)$. The constants are uniform over the measures and pair sets with these bounds.]
] <prep:one-scale>

#proof[
  It is enough to prove the conclusion in one orientation and intersect the two resulting pair sets. In this orientation regularize only the source law, using Lemma 4. We first establish the following uniform assertion for an individual normalized class: sufficiently small losses in its profile comparisons and in the input cap bound imply a fixed positive gain and a power bound for the deleted pair mass. During this class assertion, $rho$ denotes the normalized class. Restrict $G$ to pairs whose source belongs to that class, and discard the null pairs outside $"supp" nu times "supp" rho$. Deleted pair mass is measured by $nu ⊗ rho$. Only the reverse laws $\( pi_z \)_(\#) \( nu \|_(G^z) \)$ are used below. They remain unnormalized restrictions of the original pin law, so normalizing a source class does not alter their cap or plate constants.
  We prove this assertion by contradiction, which also fixes its quantifiers. If it failed, there would be scales $R = delta^(- 1) = 2^M arrow.r oo$, class-comparison losses tending to zero, input cap losses tending to zero, and counterexamples to every gain and deletion exponent tending to zero. The class profiles are equi-Lipschitz. Pass to a uniformly convergent subsequence with limit $m$, where $m \( 0 \) = 0$ and $m \( u \) gt.eq s u$, by the lower profile bound in Lemma 4 and the vanishing regularization losses. All normalized cell masses and conditional cell comparisons are then $R^(o \( 1 \))$ times those given by $m$.
  Fix $t in \( k - 1 / 2 \, s \)$ and choose $A \, B$ by Lemma 15. Use the four depths $0 \, a = floor.l A M floor.r \, b = floor.l B M floor.r \, M$. Rounding changes only $R^(o \( 1 \))$ factors. We establish local radial fiber estimates on the three intervals. For an occupied source cell $Q$ at the initial depth of an interval $\[ u \, v \]$, write $rho_Q = rho \|_Q \/ rho \( Q \)$ and define
  $ cal(R)_(Q \, v) \( x \, z \) = rho_Q { z' in Q : \| pi_x \( z' \) - pi_x \( z \) \| lt.eq C_(upright("rad")) R^(- v) } \, #h(2em) x in "supp" nu \, quad z in Q ∩ "supp" rho . $
  Here $C_(upright("rad"))$ is a sufficiently large fixed width constant. The comparison source $z'$ always ranges over the full conditional class law in $Q$. We will bound this quantity only at retained witness pairs $\( x \, z \)$; no individual pair fiber is normalized. The function $cal(R)_(Q \, v)$ is Borel by parameterized integration.
  First consider $\[ u \, v \] = \[ 0 \, A \]$ or $\[ B \, 1 \]$, and a source cell $Q$ at depth $u M$. For every $u lt.eq w lt.eq v$, the profile comparisons and Equations (5.1) and (5.1) give
  #[#set math.equation(numbering: n => "(5.2)")
   $ rho_Q \( B \( z \, C R^(- w) \) \) lt.eq R^(- q \( w - u \) + o \( 1 \)) . $ <prep:local-ball>]
  At a fixed witness $z in Q$, integrate pins only on $G^z$. Bounded separation implies
  $ \| pi_x \( z \) - pi_x \( z' \) \| lt.eq C_(upright("rad")) R^(- v) quad arrow.r.double quad pi_z \( x \) upright(" lies in two caps of radius ") C' R^(- v) \/ \| z - z' \| . $
  For $1 / 2 R^(- w) < \| z - z' \| lt.eq R^(- w)$, the product of the cap bound and Equation (5.2) is at most $R^(- q \( v - u \) + o \( 1 \))$; equivalently one may sum over all intermediate dyadic distance annuli. The innermost ball $\| z - z' \| lt.tilde R^(- v)$ has the same bound by Equation (5.2). Hence
  #[#set math.equation(numbering: n => "(5.3)")
   $ integral_(G^z) cal(R)_(Q \, v) \( x \, z \) thin d nu \( x \) lt.eq R^(- q \( v - u \) + o \( 1 \)) . $ <prep:local-mean>]
  Fubini and Markov therefore delete only $R^(- e' + o \( 1 \))$ pair mass, for any fixed $e' > 0$, and leave
  $ cal(R)_(Q \, v) \( x \, z \) lt.eq R^(- q \( v - u \) + e') $
  at every retained witness $\( x \, z \)$ in this cell. Summing over cells uses the cell weights $rho \( Q \)$.
  For the middle interval put $D = R^(- \( B - A \))$. After rescaling an $a$-cell $Q$ to bounded size, its conditional probability has a $t$-ball bound down to scale $D$, with loss $D^(- o \( 1 \))$, by Equation (5.1). For the unchanged reverse laws, $B - A > 0$ is fixed along this subsequence, so their $R^(o \( 1 \))$ cap loss is $D^(- o \( 1 \))$ on the required radii. At $q = k - 1$, their fixed plate constant also fits the permitted small $D$-power loss for small $D$. Apply Corollary 13 with a sufficiently large fixed tube-width constant. It supplies a fixed $c_1 > 0$ and a common Borel set $cal(B)_Q$ containing all directions for which a union of at most $D^(- q - c_1)$ parallel tubes of width $C' D$ carries at least $D^(c_1)$ conditional source mass. For every $z in Q$,
  #[#set math.equation(numbering: n => "(5.4)")
   $ \( \( pi_z \)_(\#) \( nu \|_(G^z) \) \) \( cal(B)_Q \) lt.eq D^(c_1) . $ <prep:witness-bad>]
  The directional law in this statement is a subprobability and has not been renormalized. The set $cal(B)_Q$ depends on $Q$ and its conditional source law, not on $z$. If necessary decrease $c_1$ so that the same exponent bounds the exceptional mass. Constant-width enlargements and gridding are part of this Corollary.
  Delete the pairs in Equation (5.4), at cost $O \( D^(c_1) \)$ by Fubini. For a pin still represented in $Q$, at least one retained witness has a good direction. Let $c_Q$ be the cell center and $w_(x \, Q) = pi_x \( c_Q \)$. All witness directions differ, up to sign, from $w_(x \, Q)$ by $O \( R^(- A) \)$. Since
  #[#set math.equation(numbering: n => "(5.5)")
   $ R^(- A) = o \( D \) \, #h(2em) R^(- 2 A) = o \( R^(- B) \) \, $ <prep:linearization-margin>]
  a tube cover at $w_(x \, Q)$ with a slightly smaller fixed width would also be a forbidden cover at that witness direction. Thus the conditional source law is robust at the center direction, uniformly over every represented pin. The directions may be regarded as unoriented for this assertion.
  For $z \, z' in Q$, Taylor expansion of $y mapsto pi_x \( y \)$ on the separated supports gives
  $ \| pi_x \( z \) - pi_x \( z' \) \| lt.eq C_(upright("rad")) R^(- B) quad arrow.r.double quad \| P_(w_(x \, Q)^perp) \( z - z' \) \| lt.eq C'' \( R^(- B) + R^(- 2 A) \) lt.eq C''' R^(- B) . $
  Grid the perpendicular projection at this scale. For each pin $x$, let
  $ cal(H)_(x \, Q) = { z in Q ∩ "supp" rho : cal(R)_(Q \, B) \( x \, z \) > D^(q + c_1 \/ 2) } . $
  If $z in cal(H)_(x \, Q)$, some one of a bounded number of neighboring projected grid cells has full $rho_Q$-mass at least a fixed multiple of $D^(q + c_1 \/ 2)$. There are at most $C D^(- q - c_1 \/ 2)$ such heavy cells. Enlarge each by its bounded number of neighboring grid cells. Thus $cal(H)_(x \, Q)$ lies in at most that many tubes, of a fixed width permitted by the preceding robustness assertion. For small $D$ this is less than $D^(- q - c_1)$. For every represented pin, robustness therefore gives $rho_Q \( cal(H)_(x \, Q) \) lt.eq D^(c_1)$.
  From the pair relation surviving the bad-direction deletion, delete the pairs $\( x \, z \)$ with $z in cal(H)_(x \, Q)$. If a pin has no surviving witness in $Q$, this deletion has zero fiber mass. Otherwise the preceding bound applies. Integrating over the full pin law, and then summing with the cell weights $rho \( Q \)$, costs $O \( D^(c_1) \)$. This deletion intersects the first surviving Borel relation with the threshold event for $cal(R)_(Q \, B)$; it is Borel and needs no measurable choice of the witness used in the robustness argument. Every remaining witness satisfies $cal(R)_(Q \, B) \( x \, z \) lt.eq D^(q + c_1 \/ 2)$.
  Denote the three local factors, in interval order, by
  $ f_0 = R^(- q A + e') \, #h(2em) f_1 = R^(- \( q + c_1 \/ 2 \) \( B - A \)) \, #h(2em) f_2 = R^(- q \( 1 - B \) + e') . $
  Let $G'$ be the common Borel pair relation left in the class-restricted $G$ after the two outer Markov deletions and the two middle deletions, before endpoint density pruning. At each $\( x \, z \) in G'$ in the initial cell $Q$ of the corresponding interval $\[ u \, v \]$, the local estimate is
  $ rho { z' in Q : \| pi_x \( z' \) - pi_x \( z \) \| lt.eq C_(upright("rad")) R^(- v) } = rho \( Q \) cal(R)_(Q \, v) \( x \, z \) lt.eq f_j rho \( Q \) . $
  Thus Lemma 5 applies at the four endpoint depths with this $G'$ and with $E_0 = E_1 = E_2 = "supp" nu times "supp" rho$: the comparison sources are the full class law, while the estimates are required only at witnesses in $G'$. The fixed choice of $C_(upright("rad"))$ includes the enlargement from rounding the endpoint depths. Use density threshold $R^(- e'')$. The Lemma deletes $O \( R^(- e'') \)$ pair mass and multiplies the factors with at most $R^(3 e'')$ loss; its density test concerns $G'$ before this last deletion. Choose $e' \, e'' > 0$ so that
  $ 2 e' + 3 e'' < 1 / 4 c_1 \( B - A \) . $
  The resulting cap mass is at most $R^(- q - c_1 \( B - A \) \/ 4)$, and every deletion has a fixed positive power bound. This contradicts the selected counterexamples. In particular, although $A \, B$ arose from a limiting profile, the contradiction proves uniform positive constants for sufficiently small fixed comparison losses.
  Choose the regularization parameter small enough for this uniform class assertion, and then choose $epsilon_0$ small enough for its input cap loss. Discarded classes have power-small total mass. Apply the assertion to every remaining class and recombine with its original source weight. The weights sum to at most one, so both cap estimates and deletion estimates sum without a factor equal to the number of classes. Finally repeat with the two original measures interchanged and intersect the outputs. Decreasing $c$ absorbs fixed constants and proves the Lemma. ◻
]

#thm([Proposition 5.4.])[
  (Thin-tube upgrade).  #emph[Let $k gt.eq 2$ and $k - 1 / 2 < s < k$. Let $rho \, nu$ be bounded, separated $s$-Frostman probabilities in $bb(R)^(k + 1)$. Suppose that the two directional measures of $G_N$ have plate bounds $C u^zeta$, uniformly for $2^(- N) lt.eq u lt.eq 1$, with fixed $zeta > 0$. If $k - 1$ is available, then $k - 1 / 2$ is available.]
] <prep:thin-upgrade>

#proof[
  Availability is downward closed. It is also closed under increasing limits inside $\[ k - 1 \, k - 1 / 2 \]$: for a desired loss $e$, choose an available $q$ within $e \/ 2$ of the supremum, apply its estimate with loss $e \/ 2$, and use $u gt.eq 2^(- N)$.
  Suppose that an available exponent $q < k - 1 / 2$ is given. Let $c \, epsilon_0$ be the constants in Lemma 16, and choose $q' > q$ with $q' lt.eq q + c \/ 2$ and $q' lt.eq k - 1 / 2$. For any desired loss $e > 0$, choose $e_1 > 0$ so small that $2 e_1 q' < e$. First use availability of $q$ with input loss $epsilon < e_1 epsilon_0 \/ 2$. For every integer $M in \[ e_1 N \, N \]$, that input loss is at most $2^(epsilon_0 M)$, so Lemma 16 applies at $delta = 2^(- M)$ to the same remaining pair set. Intersect the outputs over these $M$. Their combined deletion is at most
  $ C sum_(M gt.eq e_1 N) 2^(- c M) = O \( 2^(- c e_1 N) \) \, $
  in addition to the original power-small deletion. At these radii the output is stronger than the requested $2^(e N) u^(q')$ bound. At larger radii that bound is trivial from mass at most one, for all large $N$, by the choice of $e_1$. Dyadic enlargement is absorbed by the remaining loss. Hence $q'$ is available. Applying this to the supremum of the available exponents rules out a supremum below $k - 1 / 2$; closure gives the endpoint itself. ◻
]

=== 5.2 Starting measures and radial densities <starting-measures-and-radial-densities>

We record explicitly the classical exceptional case, which allows the remaining construction to assume that no relevant affine plane is charged.

#thm([Lemma 5.5.])[
  (The classical distance threshold).  #emph[Let $rho$ be a compactly supported probability in $bb(R)^n$, $n gt.eq 2$, with an $s$-ball bound for some $s > \( n + 1 \) \/ 2$. Then the distances between points of $"supp" rho$ form a set of positive Lebesgue measure.]
] <prep:classical-plane>

#proof[
  Choose positive normalized restrictions $rho_1 \, rho_2$ to sufficiently small separated compact patches. Put $a = \( n - 1 \) \/ 2$ and
  $ tau = D_(\#) #scale(x: 120%, y: 120%)[\[] D^(- a) \( rho_1 ⊗ rho_2 \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) D \( x \, y \) = \| x - y \| . $
  This is a nonzero finite positive measure on the distance line. The elementary sphere-kernel estimate
  $ \| hat(sigma_(S^(n - 1))) \( xi \) \| lt.tilde \( 1 + \| xi \| \)^(- a) $
  follows by a partition into the two stationary patches and their complement, using stationary phase on the former and integration by parts on the latter. Consequently
  #[#set math.equation(numbering: n => "(5.6)")
   $ integral_(S^(n - 1)) \| hat(rho_1) \( r w \) \|^2 thin d sigma \( w \) lt.tilde r^(- a) I_a \( rho_1 \) \, #h(2em) r gt.eq 1 . $ <prep:classical-spherical>]
  The energy is finite since $a < s$. The ball bound and a smooth Fourier ball majorant give
  #[#set math.equation(numbering: n => "(5.7)")
   $ integral_(r asymp R) integral_(S^(n - 1)) \| hat(rho_2) \( r w \) \|^2 thin d sigma \( w \) thin frac(d r, R) lt.tilde R^(- n) integral_(\| xi \| lt.tilde R) \| hat(rho_2) \( xi \) \|^2 d xi lt.tilde R^(- s) . $ <prep:classical-annulus>]
  For the last inequality, the inverse transform of the majorant is $O_L \( R^n \( 1 + R \| x - y \| \)^(- L) \)$; integrating by dyadic annuli against the $s$-ball bound proves the claim.
  Choose a smooth angular cutoff equal to one on all the cross directions and zero near their antipodes. The leading spherical stationary-phase term, uniformly on the separated patches, gives, up to the harmless Fourier-sign choice,
  $ hat(tau) \( r \) = c_n^(- 1) r^a integral_(S^(n - 1)) psi \( w \) hat(rho_1) \( r w \) overline(hat(rho_2) \( r w \)) thin d sigma \( w \) + O \( r^(- 1) \) \, #h(2em) c_n eq.not 0 . $
  Indeed the error before multiplication by $r^a$ is $O \( r^(- a - 1) \)$, because distances stay in a compact subset of $\( 0 \, oo \)$. Cauchy–Schwarz, Equations (5.6) and (5.7), and $2 a + 1 = n$ imply
  $ integral_(r asymp R) \| hat(tau) \( r \) \|^2 thin d r lt.tilde R^(n - a - s) + R^(- 1) = R^(\( n + 1 \) \/ 2 - s) + R^(- 1) . $
  The dyadic sum converges. The negative frequencies are conjugates, and low frequencies are bounded. Plancherel therefore gives an $L^2$ density for $tau$, proving the conclusion. This is the classical threshold argument of Falconer #cite(label("Falconer1985")). ◻
]

#thm([Lemma 5.6.])[
  (Simultaneous projected Frostman bounds).  #emph[Let $E subset bb(R)^d$ be compact and $dim_H E > S = d \/ 2$. There is a probability on $E$ with a ball exponent strictly greater than $S$. Finitely many successive generic orthogonal projections to dimensions strictly greater than $S$ preserve finite energies with exponents strictly greater than $S$. After a positive compact restriction of the original probability, all these projected laws, as well as the original law, have a common ball exponent $S + chi$, with $chi > 0$.]
  #emph[If $d = 2 k - 1$ and the original measure gives zero mass to every affine $k$-plane, the projection to $bb(R)^(k + 1)$ may additionally be chosen to give zero mass to every affine hyperplane.]
] <prep:projections>

#proof[
  Choose $S < s_0 < dim_H E$ and use Frostman’s Lemma to obtain an $s_0$-ball probability. Fix $u > S$ below $s_0$ and all the target dimensions. Lemma 2 gives finite $u$-energy for almost every successive projection. To make all the projected ball bounds hold on the same restriction, use the potential proof of that Lemma: for each projected law $eta$, retain a set on which $U_u eta$ is bounded, and pull this set back to the original space. Each discarded preimage can have arbitrarily small mass, so the intersection of these finitely many restrictions has positive mass. An inner compact restriction has the desired ball bound in every space. Decrease the exponent slightly if necessary to obtain one common $S + chi$.
  For the last assertion, almost every $\( k + 2 \)$-tuple of original points is affinely independent: sample successively and use zero mass on every span of dimension at most $k$. For each fixed such tuple, almost every projection to $bb(R)^(k + 1)$ preserves its independence. Fubini makes this true for almost every tuple for almost every projection, simultaneously with energy preservation. If a projected hyperplane had mass $a > 0$, the dependent tuples would have mass at least $a^(k + 2)$, a contradiction. Subsequent restrictions preserve this property. ◻
]

The following lemma adapts the finite-energy proof of Orponen #cite(label("Orponen2019")) Section 3 and the proof of Theorem 1.13.

#thm([Lemma 5.7.])[
  (Radial $L^p$ estimate).  #emph[Let $h gt.eq 1$ and $0 < epsilon.alt < min \( h \, 1 \)$. Let $alpha \, beta$ be bounded, separated probabilities in $bb(R)^(h + 1)$ with finite $I_(h + epsilon.alt)$ energies. For some $p > 1$, the radial measures $\( pi_x \)_(\#) alpha$ have jointly measurable densities $F \( x \, w \)$ and 
$ integral #h(-0.16667em) integral_(S^h) F \( x \, w \)^p thin d sigma \( w \) thin d beta \( x \) < oo . $

 The same assertion holds in the reverse orientation. Positive compact restrictions can be chosen on both sides so that the two radial $L^p$ norms are uniformly bounded at every remaining pin.]
] <prep:radial-lp>

#proof[
  Put
  $ u = h - epsilon.alt \, #h(2em) p = 1 + frac(epsilon.alt, 4 h) \, #h(2em) t = h - epsilon.alt / 2 . $
  Then $1 < p < 2$ and $u p < t < h \( 2 - p \)$. Initially suppose that the source is smooth. For $w in S^h$, let $P_w$ be projection to $w^perp$, let $f_w$ be the density of $\( P_w \)_(\#) alpha$, and put $eta_w = \( P_w \)_(\#) beta$. The radial density is
  $ F \( x \, w \) = integral_0^oo alpha \( x + r w \) r^h thin d r lt.tilde f_w \( P_w x \) \, $
  because the supports lie in a fixed bounded region.
  If $g gt.eq 0$ and $parallel g parallel_(L^(p \/ \( p - 1 \)) \( eta_w \)) = 1$, Hölder on the product space gives
  $ I_u \( g eta_w \) lt.eq I_(u p) \( eta_w \)^(1 \/ p) lt.tilde I_t \( eta_w \)^(1 \/ p) . $
  The second inequality uses bounded support and $u p < t$. The energy identity $I_u \( eta \) = c_(h \, u) integral \| hat(eta) \( xi \) \|^2 \| xi \|^(u - h) thin d xi$ follows by writing the Riesz kernel as an integral of Gaussian kernels; see #cite(label("Mattila1995")) Lemma 12.12 for this identity with our Fourier convention. Fourier duality and Cauchy–Schwarz with reciprocal weights therefore imply
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel f_w parallel_(L^p \( eta_w \)) lt.tilde I_t \( eta_w \)^(1 \/ \( 2 p \)) (integral_(w^perp) \| hat(alpha) \( xi \) \|^2 \| xi \|^(h - u) thin d xi)^(1 \/ 2) . $ <prep:radial-duality>]
  The pairing can first be justified with bounded smooth truncations, then passed to the limit by the same energy bound.
  Write $A \( w \)$ for the Fourier integral in Equation (5.8) and $B \( w \) = I_t \( eta_w \)$. Polar coordinates and rotational invariance give
  $ integral_(S^h) A \( w \) thin d sigma \( w \) = C integral_(bb(R)^(h + 1)) \| hat(alpha) \( xi \) \|^2 \| xi \|^(h - u - 1) thin d xi = C' I_(h + epsilon.alt) \( alpha \) . $
  Set $r_0 = 1 \/ \( 2 - p \)$. The one-vector estimate $sigma { w : \| P_w z \| lt.eq a \| z \| } lt.tilde a^h$, together with $t r_0 < h$, shows that
  $ parallel \| P_w z \|^(- t) parallel_(L^(r_0) \( d sigma \)) lt.tilde \| z \|^(- t) . $
  Minkowski gives $parallel B parallel_(L^(r_0)) lt.tilde I_t \( beta \)$. Raise Equation (5.8) to the $p$th power and apply Hölder with exponents $2 \/ p$ and $2 \/ \( 2 - p \)$ to obtain
  #[#set math.equation(numbering: n => "(5.9)")
   $ integral #h(-0.16667em) integral F \( x \, w \)^p thin d sigma \( w \) thin d beta \( x \) lt.tilde I_(h + epsilon.alt) \( alpha \)^(p \/ 2) I_t \( beta \)^(1 \/ 2) . $ <prep:radial-integrated>]
  For a general source, let $alpha_epsilon$ be its convolution with a nonnegative smooth approximate identity of scale $epsilon$ and sufficiently small support. Separation persists, and the Fourier energy formula gives a uniform energy bound. The joint measures
  $ Lambda_epsilon = #scale(x: 120%, y: 120%)[\[] \( x \, y \) mapsto \( x \, pi_x \( y \) \) #scale(x: 120%, y: 120%)[\]]_(\#) \( beta ⊗ alpha_epsilon \) $
  have uniformly bounded densities in $L^p \( beta ⊗ sigma \)$ by Equation (5.9). Separation gives weak convergence to the analogous joint measure $Lambda$. Duality against continuous functions, followed by $L^(p')$ density #cite(label("Folland1999")) Theorem 6.15 and Proposition 7.9, shows that $Lambda$ has an $L^p$ density $F$. Disintegration, checked on a countable determining family of continuous functions on $S^h$, identifies $F \( x \, dot.op \)$ as the radial density for $beta$-almost every $x$. A Borel version supplies joint measurability.
  Repeat with $alpha$ and $beta$ interchanged. Choose positive compact subsets on which the relevant radial norms are bounded and on which the density identities hold. Restricting the sources only decreases positive radial measures; normalization costs a fixed constant. The two uniform bounds therefore hold simultaneously. For each resulting radial kernel $K_x$, choose the density version
  $ tilde(F) \( x \, w \) = limsup_(n arrow.r oo) frac(K_x \( B \( w \, 2^(- n) \) \), sigma \( B \( w \, 2^(- n) \) \)) . $
  This is jointly Borel by parameterized integration. At every retained pin the preceding domination gives $K_x lt.double sigma$, so spherical differentiation identifies this version as its density almost everywhere in $w$, with the stated $L^p$ bound. Here one may view both measures as ambient Radon measures and apply #cite(label("Simon2014")) Chapter 1, Theorems 3.23–3.24. The compact good-pin sets contain the supports of the restricted laws; hence this construction introduces no new exceptional pins. Apply the same choice in the reverse orientation. ◻
]

#thm([Lemma 5.8.])[
  (Integer caps and lifting).  #emph[Under the uniform conclusion of Lemma 20, for every $e > 0$ and $R = 2^N$ one can remove pair mass $O \( R^(- e \( p - 1 \) \/ 2) \)$ so that the two remaining directional measures give every cap of radius $u$ mass at most $R^e u^h$, for all $R^(- 1) lt.eq u lt.eq 1$ and all sufficiently large $R$.]
  #emph[The same cap bound lifts through a fixed orthogonal projection from a higher-dimensional space, provided the original and projected cross supports are bounded and separated. Constants may change, and may be absorbed by a smaller preliminary choice of $e$.]
] <prep:integer-caps>

#proof[
  Use the jointly Borel densities $F \( x \, w \)$ and $H \( y \, w \)$ of the two radial laws. With $T = R^(e \/ 2)$, delete pairs for which
  $ F \( x \, pi_x \( y \) \) > T quad upright("or") quad H \( y \, pi_y \( x \) \) > T . $
  Their product mass is $O \( T^(1 - p) \)$, since $integral_(F > T) F lt.eq T^(1 - p) integral F^p$, and similarly for $H$. Each remaining directional density is bounded by $T$, so the spherical cap-volume bound gives $C T u^h lt.eq R^e u^h$ for large $R$.
  Let $P$ be the fixed projection. On all actual cross directions, $\| P w \| gt.eq c > 0$, because projected separation is bounded below and original distances are bounded above. The map
  $ Phi \( w \) = P w \/ \| P w \| $
  is Lipschitz on this region and satisfies $Phi \( pi_x \( y \) \) = pi_(P x) \( P y \)$. The image of any original cap, intersected with the actual directions, is contained in a projected cap of comparable radius. Pushforward of the source measure gives the asserted bound at each original pin. This uses no injectivity of $P$, and works in both orientations. ◻
]

=== 5.3 A decreasing coarse filter in odd dimensions <a-decreasing-coarse-filter-in-odd-dimensions>

For an affine hyperplane $H$, write $H_r = { z : "dist" \( z \, H \) lt.eq r }$. The following construction gives the spatial regularity that will survive all the way to the limiting distance measure.

The proof adapts the heavy-plate localization and exclusion argument of Shmerkin #cite(label("Shmerkin2023")) Appendix B, in the quantitative form developed by Ren #cite(label("Ren2023")) Section 7. Here the exclusions are unions of coarse cell pairs at successive dyadic scales, producing decreasing pair filters with positive limiting product mass.

#thm([Lemma 5.9.])[
  (Coarse exclusion of heavy plates).  #emph[Let $k gt.eq 2$, and let $rho_1 \, rho_2$ be bounded separated $s$-Frostman probabilities in $bb(R)^(k + 1)$, with $k - 1 / 2 < s < k$. Suppose $rho = rho_1 + rho_2$ gives zero mass to every affine hyperplane. For every fixed $0 < omega lt.eq 1$, there are decreasing Borel sets $Gamma_N subset "supp" rho_1 times "supp" rho_2$ such that]
  + #emph[$\( rho_1 ⊗ rho_2 \) \( ⋂_N Gamma_N \) > 0$;]
  + #emph[$Gamma_N$ is a union of pairs of cells in a fixed dyadic grid of depth at most $omega N + O \( 1 \)$;]
  + #emph[both directional measures of $Gamma_N$ satisfy $lambda { w : "dist" \( w \, V \) lt.eq u } lt.eq C_omega u^zeta$ for $2^(- N) lt.eq u lt.eq 1$, with some $zeta > 0$.]
] <prep:coarse-filter>

#proof[
  Put $a = s - \( k - 1 \) > 1 \/ 2$. Covering a bounded portion of an affine $\( k - 1 \)$-plane by $O \( r^(- \( k - 1 \)) \)$ balls gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ rho \( L_r \) lt.eq C r^a $ <prep:lower-plane>]
  uniformly over such planes and $0 < r lt.eq 1$. This also bounds neighborhoods of all lower-dimensional affine subspaces. We shall fix a sufficiently small $b > 0$ and then a sufficiently large integer $j_0$.
  Call $H$ heavy at width $r$ if $rho \( H_r \) gt.eq r^b$. We first prove that its parameter set has an $r$-net of size
  #[#set math.equation(numbering: n => "(5.11)")
   $ O \( r^(- C_0 b) \) \, $ <prep:heavy-net>]
  where $C_0$ is independent of sufficiently small $b$. Restrict to the compact family of hyperplanes meeting a fixed bounded neighborhood of the supports, and use the usual metric given by normal direction, modulo sign, and offset. Fix $L > 2 \/ a$. Within $H_r$, choose $k + 1$ points successively, each at distance at least $r^(L b)$ from the affine span of its predecessors. Equation (5.10) bounds each forbidden set by $C r^(L a b) lt.eq r^b \/ 2$ when $r$ is sufficiently small. Thus the product measure of admissible tuples is at least $c r^(\( k + 1 \) b)$, and every such tuple has $k$-simplex volume at least $c_k r^(k L b)$.
  If a fixed admissible tuple belongs to the width-$r$ plates of two hyperplanes, elementary linear algebra bounds the parameter distance between these hyperplanes by $C r^(1 - k L b)$. Indeed the matrix of the $k$ difference vectors has bounded operator norm and smallest nonzero singular value at least a constant times its $k$-volume; both normals have scalar products $O \( r \)$ with every difference. The offset is then controlled by either first vertex. The hyperplane parameter space has dimension $k + 1$, so an $r$-separated list contains at most $C r^(- k \( k + 1 \) L b)$ hyperplanes compatible with this tuple. Integrating tuple incidences over any $r$-separated list of heavy hyperplanes proves Equation (5.11), with, for example, $C_0 = \( k + 1 \) \( 1 + k L \)$ after increasing fixed constants. A maximal separated list is the desired net. Its plates enlarged to width $C_k r$ contain every original width-$r$ heavy plate in the bounded region, as well as every grid cell of side $r$ meeting one.
  For each $j gt.eq j_0$, put $r_j = 2^(- j)$ and delete every pair of depth-$j$ cells which both meet some heavy width-$r_j$ plate. These are finite unions of products of Borel cells. Let $E_j$ be the deleted pair set. With $J_N = floor.l omega N floor.r$, define
  #[#set math.equation(numbering: n => "(5.12)")
   $ Gamma_N = \( "supp" rho_1 times "supp" rho_2 \) \\ union.big_(j_0 lt.eq j lt.eq J_N) E_j . $ <prep:gamma-definition>]
  The sets decrease, and nested grids give the stated cell partition. We prove positive limiting mass by bounding new losses over all $j$.
  At a fixed width $r$, use the enlarged plates of its net. Two such plates with normal angle greater than $sqrt(r)$, if they intersect the bounded region, have their intersection within an $O \( sqrt(r) \)$-neighborhood of an affine $\( k - 1 \)$-plane. This follows by solving the two normal equations: the smallest singular value of the pair of unit normals is comparable to their angle. Equations (5.10) and (5.11) therefore show that the union of all these intersections has $rho_1$-mass at most
  #[#set math.equation(numbering: n => "(5.13)")
   $ C r^(a \/ 2 - 2 C_0 b) . $ <prep:plate-exception>]
  Outside this exceptional set, all listed plates containing a fixed first endpoint have pairwise normal angle at most $sqrt(r)$. Their bounded portions lie in one plate of width $C sqrt(r)$: the common endpoint controls the offsets as well as the normals. Consequently all second endpoints lost at this scale lie in that single plate.
  For $j > 4 j_0$, set $j' = floor.l j \/ 3 floor.r$. Taking $j_0$ large ensures $j' gt.eq j_0$ and $C 2^(- j \/ 2) < 2^(- j')$. The single plate just obtained is contained in a width-$2^(- j')$ plate containing the first endpoint. If this enclosing plate is heavy at that earlier width, every pair under consideration was already deleted by $E_(j')$: it contains the actual endpoints, so both of their depth-$j'$ cells meet it. If it is light, all newly affected second endpoints have total $rho_2$-mass at most $2^(- b j')$. It follows from Equation (5.13) that the new product mass lost at scale $j$ is at most
  #[#set math.equation(numbering: n => "(5.14)")
   $ C 2^(- j \( a \/ 2 - 2 C_0 b \)) + 2^(- b floor.l j \/ 3 floor.r) . $ <prep:late-loss>]
  Treat the initial scales $j_0 lt.eq j lt.eq 4 j_0$ together. Their combined net has at most $C_b 2^(4 C_0 b j_0)$ members. Enlarge them all to width $C 2^(- j_0)$ and repeat the intersection argument at angle $2^(- j_0 \/ 2)$. The exceptional first-endpoint mass is at most
  $ C_b 2^(- \( a \/ 2 - 8 C_0 b \) j_0) . $
  For every other first endpoint, all lost second endpoints lie in one width-$C 2^(- j_0 \/ 2)$ hyperplane plate. The hypothesis of zero hyperplane masses implies
  #[#set math.equation(numbering: n => "(5.15)")
   $ sup_H rho \( H_epsilon \) arrow.r 0 #h(2em) \( epsilon arrow.b 0 \) . $ <prep:uniform-vanishing>]
  Indeed a contrary sequence of hyperplanes has a convergent subsequence in the compact parameter space; its shrinking plates would force positive mass on the limiting hyperplane. Thus the total initial loss tends to zero as $j_0 arrow.r oo$.
  Choose $b > 0$ so small that $8 C_0 b < a \/ 4$ and $k L b < 1 \/ 2$. The sum of Equation (5.14) over $j > 4 j_0$ also tends to zero as $j_0 arrow.r oo$. Choose $j_0$ so large that the combined loss is less than $1 \/ 2$. This proves positive limiting mass.
  Finally fix a pin $x$. Directions in a linear-hyperplane $u$-neighborhood correspond to sources in a width-$C u$ affine plate through $x$. At an available comparable exclusion scale, a heavy plate leaves no retained pairs, while a light plate has source mass at most its width to the power $b$. At radii below the last exclusion scale use the last scale instead. The finitely many radii above the first scale cost a fixed constant. Thus both fibers obey
  $ lambda { w : "dist" \( w \, V \) lt.eq u } lt.eq C max \( u \, 2^(- J_N) \)^b lt.eq C_omega u^(omega b) \, #h(2em) 2^(- N) lt.eq u lt.eq 1 . $
  Dyadic rounding and fixed width constants change only $C_omega$. We may take $zeta = omega b$, or any smaller positive exponent. ◻
]

=== 5.4 Starting pair measures <starting-pair-measures>

#thm([Proposition 5.10.])[
  (Starting pair measures).  #emph[Let $E subset bb(R)^d$ be compact, $d gt.eq 2$, and $dim_H E > S = d \/ 2$. Either Lemma 18 already proves that its distance set has positive Lebesgue measure, or the following construction is possible.]
  #emph[After a similarity there are compact separated sets $E_1 \, E_2 subset E$ and probabilities $mu_i$ supported on them, each satisfying 
$ mu_i \( B \( x \, u \) \) lt.eq C u^(S + chi) $

 for a fixed $chi > 0$. Their cross directions lie in a fixed arbitrarily small spherical patch. For every sufficiently small fixed $omega > 0$, there are decreasing Borel pair sets $Gamma_N subset E_1 times E_2$ such that]
  + #emph[$\( mu_1 ⊗ mu_2 \) \( ⋂_N Gamma_N \) > 0$;]
  + #emph[$Gamma_N$ is a disjoint union of at most $C 2^(2 d omega N)$ products of spatial Borel sets;]
  + #emph[for every $e > 0$, there are $c \( e \) > 0$, $C_e < oo$ and Borel $B_N subset Gamma_N$ with $\( mu_1 ⊗ mu_2 \) \( B_N \) lt.eq C_e 2^(- c \( e \) N)$, such that for $G_N = Gamma_N \\ B_N$, all $2^(- N) lt.eq u lt.eq 1$, and all spherical caps $B \( w \, u \)$, 
$ mu_2 { y : \( x \, y \) in G_N \, med pi_x \( y \) in B \( w \, u \) } & lt.eq 2^(e N) u^S \,\
mu_1 { x : \( x \, y \) in G_N \, med pi_y \( x \) in B \( w \, u \) } & lt.eq 2^(e N) u^S . $

]
  #emph[The last bounds integrate the original opposite marginal, without normalizing its individual fibers. The $B_N$ need not have a product partition or be nested. All constants are independent of $N$, but may depend on the fixed measures, $omega$, and $e$.]
] <prep:starting-pairs>

#proof[
  Use Lemma 19 to choose an initial Frostman probability of exponent greater than $S$. In odd dimension $d = 2 k - 1$, if it charges an affine $k$-plane, its normalized positive restriction to that plane still has this exponent, and
  $ S = k - 1 / 2 gt.eq \( k + 1 \) \/ 2 #h(2em) \( k gt.eq 2 \) . $
  Lemma 18, applied isometrically within the plane, proves the first alternative. These are original distances. Otherwise project generically to $bb(R)^(k + 1)$, preserving energies above $S$ and giving zero mass to all hyperplanes.
  In both parities project further, if needed, to $bb(R)^(h + 1)$, where $h = floor.l S floor.r$. All target dimensions are greater than $S$. In even dimension this is the only auxiliary projection. Use simultaneous potential restrictions in Lemma 19 to obtain ball exponents above $S$ in all spaces. Choose two distinct support locations whose smallest projected images are distinct; this is possible since that projected law is nonatomic. Restrict to small compact positive-measure neighborhoods of these locations. Their supports are separated in every required space, and their original cross directions lie in a fixed small patch. Normalize and decrease the common exponent to $S + chi$ if necessary.
  Choose $0 < epsilon.alt < min \( chi \, h \, 1 \)$ small enough that both laws in $bb(R)^(h + 1)$ have finite $I_(h + epsilon.alt)$ energy. Apply Lemma 20 and pull its positive compact restrictions back to the original measures. Inner regularity permits positive compact preimages; further restriction preserves all established bounds. These are the final $mu_1 \, mu_2$.
  If $d$ is even, $h = S$. Take $Gamma_N = E_1 times E_2$ and apply Lemma 21, lifting to the original space. This includes $d = 2$, where the smallest projection is the identity.
  If $d = 2 k - 1$, write $mu'_i$ for the laws in $bb(R)^(k + 1)$. Their exponent may be decreased to an $s in \( k - 1 / 2 \, k \)$. They give zero mass to every affine hyperplane. Apply Lemma 22 with the prescribed $omega$. The integer cap bounds obtained in $bb(R)^k$ from Lemma 21 lift to $bb(R)^(k + 1)$, and persist on restriction to the coarse filters. Thus $k - 1$ is available there. Proposition 17 gives availability of $k - 1 / 2 = S$. Lift the resulting cap bounds and the exceptional pair sets to the original space.
  Pullback preserves product masses and decreasing intersections. The auxiliary finest-depth cell partition has at most $C 2^(\( k + 1 \) omega N)$ cells on each side. Its retained cell-pair atoms are disjoint products. As $k + 1 lt.eq d$, their number is at most $C 2^(2 d omega N)$. Pullbacks of the individual cells are spatial Borel sets, and pullback preserves disjointness, so these products form a partition of $Gamma_N$. In even dimensions the entire product is already a one-piece partition. This proves every part of the Proposition. ◻
]

#prodef([Remark 5.11.])[
  (Order of parameters).  The Frostman gap $chi$ and the measures are fixed first. Later arguments choose $beta \, kappa \, sigma$ using that gap, and then choose the coarse cutoff $omega$ sufficiently small to pay for the product partition. Only after this choice is the plate exponent $zeta = omega b$ fixed and the thin-tube upgrade invoked with its desired loss, such as $e = sigma$. The resulting deletion exponent $c \( e \)$ may be very small. No later step requires it to dominate $omega$ or the Fourier saving; only its positivity is used.
] <prep:parameters>

== 6 Profiles and angular tests <test:section>

We construct directional tests from normalized regular classes and use the cap estimates of Proposition 23 to bound their failure mass. A parallel test counts all occupied class cube centres satisfying its stated ball and tube conditions; a projection test uses the full conditional probability in a specified class cube. The exceptional-direction estimate applies to a spherical subprobability. At its outer use, this is an unnormalized directional fiber of the original opposite starting law, restricted to the cap-controlled pair set.

For each frequency shell, a specified product of the masks constructed below will weight the original product measure restricted to $Gamma_N$. The smaller cap-controlled subset is used only to estimate the original pair mass removed by these masks. The product partition of $Gamma_N$ permits the shell estimate to use separate spatial restrictions at the two endpoints. Internal positive counts restrict products of normalized class laws by the good tests, while internal Fourier energies use endpoint masks and bounded spatial multipliers.

Let $S = d \/ 2$ and $R = 2^N$. We use the separated probabilities from Proposition 23, of Frostman exponent $S + chi$. The parameters are chosen in the following order:

$ 0 < beta < min \( chi \/ 10 \, 1 \/ 10 \) \, #h(2em) 0 < kappa lt.double_d beta \/ d \, #h(2em) 0 < sigma lt.double_(d \, beta \, kappa) kappa . $

The spatial cutoff parameter $omega$ in Proposition 23 is chosen afterwards, as small as required by these fixed parameters. All estimates concern sufficiently large $N$ after these choices. The constants multiplying $kappa$, $sigma$, or $sigma \/ kappa$ in exponents are dimensional; ordinary multiplicative constants and the rates in $o \( 1 \)$ may depend on the fixed parameters and the starting geometry. Use the preparation Proposition with angular loss $R^sigma$. Let $rho$ range over the normalized classes supplied by applying Lemma 4 with parameter $sigma$ to each starting probability, and write $m$ for its profile. All definitions in this Section are made separately for each class.

=== 6.1 Profile increments and conditional laws <profile-increments-and-conditional-laws>

For integer depths set

#[#set math.equation(numbering: n => "(6.1)")
 $ M \( n \) & = R^(- m \( n \/ N \)) \, & A_n & = m \( n \/ N \) - S n \/ N \,\
I \( g \, p \) & = m \( p \/ N \) - m \( g \/ N \) \, & k \( g \, p \) & = A_p - min_(g lt.eq n lt.eq p) A_n . $ <test:profile-definitions>]

Every minimum over depths is over integers unless stated otherwise. The quantity $M \( n \)$ is the model mass of a depth-$n$ cell, and $I \( g \, p \)$ records the profile increment between two depths. The residual $A_n$ subtracts the critical slope $S$, while $k \( g \, p \)$ is the rise of $A_p$ above its minimum since $g$. These quantities will give the cancellations in the two directional estimates below.

#thm([Lemma 6.1.])[
  (Profile bounds).  #emph[There is a dimensional constant $C_d$ such that 
$ A_0 = 0 \, #h(2em) \| A_i - A_j \| lt.eq d \| i - j \| \/ N \, #h(2em) A_n gt.eq chi n \/ N - C_d sigma . $

 Every occupied depth-$n$ cube has mass $M \( n \) R^(plus.minus C_d sigma)$. In particular, a ball of radius $C 2^(- g)$ contains at most 
#[#set math.equation(numbering: n => "(6.2)")
 $ C' R^(I \( g \, p \) + C_d sigma) $ <test:centre-count>]

 occupied depth-$p$ cube centres, for $0 lt.eq g lt.eq p lt.eq N$. Here $C$ is any fixed constant and $C'$ may depend on $C$. For integers $0 lt.eq p lt.eq t lt.eq N$ and an occupied depth-$p$ cube $P$, the full conditional probability $rho_P = rho \|_P \/ rho \( P \)$, rescaled by $z mapsto 2^p \( z - c_P \)$, satisfies the $S$-ball bound down to $H^(- 1)$, where $H = 2^(t - p)$, with loss 
#[#set math.equation(numbering: n => "(6.3)")
 $ K = R^(A_p - min_(p lt.eq n lt.eq t) A_n + C_d sigma) . $ <test:conditional-ball-loss>]

]
] <test:profile-bounds>

#proof[
  The first two assertions follow from $m \( 0 \) = 0$ and the fact that the slopes of $m$ lie in $\[ 0 \, d \]$. The lower bound follows from Equation (3.2); the fixed Frostman constant is absorbed into $R^(C_d sigma)$ for sufficiently large $N$. The occupied-cell mass assertion is Equation (3.1). A ball of radius $C 2^(- g)$ meets $O_(d \, C) \( 1 \)$ depth-$g$ cubes. Their full masses are at most $M \( g \) R^(C_d sigma)$ each, whereas each occupied depth-$p$ cube has mass at least $M \( p \) R^(- C_d sigma)$. Summation gives Equation (6.2), with a larger $C_d$.
  For the last assertion, if $p lt.eq n lt.eq t$, a physical ball of radius $2^(- n)$ meets a bounded number of depth-$n$ cubes, and division by $rho \( P \)$ gives an upper bound
  $ R^(- \[ m \( n \/ N \) - m \( p \/ N \) \] + C_d sigma) = 2^(- S \( n - p \)) R^(A_p - A_n + C_d sigma) . $
  Dyadic comparison of radii yields Equation (6.3). Only depths through $t$ are used, so no mass estimate below $H^(- 1)$ is involved. ◻
]

The two mass normalizations will remain distinct: $M \( n \)$ is within the stated comparison factor of the actual mass of an occupied depth-$n$ cell, whereas the probability $rho_P$ is divided by the actual mass $rho \( P \)$.

=== 6.2 Directional tests <directional-tests>

A descriptor $frak(t)$ consists of a test type and a pair of integer depths. A parallel descriptor $\[ g \, p \]$, with $0 lt.eq g < p lt.eq N$, has #emph[anchor] $p$ and #emph[nominal length] $p - g$. A projection descriptor $\[ p \, t \]$, with $0 lt.eq p < t lt.eq N$, has anchor $p$ and nominal length $t - p$. The type is part of the identity even when the displayed depth pairs coincide. These descriptors specify individual tests; a later construction will select fixed lists of them for depth intervals.

Set

$ J_0 = ⌈100 \( 1 \/ kappa + 1 \/ sigma \) + 100⌉ \, #h(2em) W_i \( n \) = \( 2 - i \/ J_0 \) 2^(- n) R^(500 sigma) \, quad 0 lt.eq i lt.eq J_0 . $

$J_0$ is the maximum test index, fixed independently of $N$ once $kappa \, sigma$ are fixed. Thus there are $J_0 + 1$ good-test levels; the masks below are defined for $i < J_0$.

#prodef([Definition 6.2.])[
  (Good directions).  Fix a class, a descriptor $frak(t)$ with anchor $p$, and an occupied depth-$p$ cube $P$, of centre $c_P$. Its level-$i$ good set $G_(i \, frak(t)) \( P \) subset S^(d - 1)$ is defined as follows, with one sufficiently large dimensional constant $C_d$ for all tests.
  + For a parallel descriptor $\[ g \, p \]$, a direction $w$ is good if the number of occupied depth-$p$ cube centres in $B \( c_P \, 10 \( d + 1 \) 2^(- g) \)$ whose distance to $c_P + bb(R) w$ is at most $W_i \( p \)$ is at most
    #[#set math.equation(numbering: n => "(6.4)")
     $ R^(k \( g \, p \) + C_d sigma) . $ <test:parallel-threshold>]
  + For a projection descriptor $\[ p \, t \]$, let $rho_P = rho \|_P \/ rho \( P \)$. A direction $w$ is good if
    #[#set math.equation(numbering: n => "(6.5)")
     $ \( rho_P ⊗ rho_P \) { \| \( z - z' \) dot.op w \| lt.eq W_i \( t \) } lt.eq 2^(- \( t - p \)) R^(A_p - min_(p lt.eq n lt.eq t) A_n + C_d sigma) . $ <test:projection-threshold>]
  For an unoccupied anchor cube set $G_(i \, frak(t)) \( P \) = diameter$. For $x$ in the root cube, write $G_(i \, frak(t)) \( x \) = G_(i \, frak(t)) \( P \)$ for its unique depth-$p$ descendant $P$, and set $G_(i \, frak(t)) \( x \) = diameter$ outside the root. The parallel test uses all occupied class centres in its stated ball and tube. The projection test uses the full conditional class probability in $P$. Subsequent pair restrictions do not change either test.
] <test:good-directions>

=== 6.3 A Fourier estimate for half-dimensional directions <a-fourier-estimate-for-half-dimensional-directions>

The two ball bounds below use the critical exponent $S = d \/ 2$. Their exponents sum to $d$, so the annular estimate contributes a constant at each dyadic frequency scale.

#thm([Lemma 6.3.])[
  (Half-dimensional Fourier estimate).  #emph[Let $1 lt.eq H lt.eq R$, $K \, L gt.eq 1$, and $S = d \/ 2$. Suppose $alpha$ is a probability in a fixed bounded subset of $bb(R)^d$ with 
$ alpha \( B \( x \, r \) \) lt.eq K r^S #h(2em) \( H^(- 1) lt.eq r lt.eq 1 \) \, $

 and $xi$ is a subprobability on $S^(d - 1)$ with 
$ xi \( B \( w \, r \) \) lt.eq L r^S #h(2em) \( R^(- 1) lt.eq r lt.eq 1 \) . $

 Then, with Fourier convention $hat(alpha) \( v \) = integral e^(- i z dot.op v) thin d alpha \( z \)$, 
#[#set math.equation(numbering: n => "(6.6)")
 $ integral_(- H)^H integral_(S^(d - 1)) \| hat(alpha) \( s w \) \|^2 thin d xi \( w \) thin d s lt.eq C L K \( 1 + log H \) . $ <test:fourier-estimate>]

 The constant depends only on $d$ and the fixed bound on the support’s diameter. In particular it does not require ball bounds below $H^(- 1)$ or any Fourier decay.]
] <test:half-dimensional-fourier>

#proof[
  The interval $\| s \| lt.eq 1$ costs at most $2$. For a dyadic $B gt.eq 1$, let $lambda_B$ be the pushforward of
  $ upright(bold(1))_({ B lt.eq \| s \| lt.eq min \( 2 B \, H \) }) thin d s thin d xi \( w \) $
  under $\( s \, w \) mapsto s w$. It is supported in the annulus $B lt.eq \| v \| lt.eq 2 B$ and has total mass at most $2 B$. The preimage of a unit frequency ball has radial length $O \( 1 \)$ and lies in at most two spherical caps of radius $O \( B^(- 1) \)$. Since $B lt.eq H lt.eq R$, the cap bound applies. A fixed covering handles radii differing from $B^(- 1)$ by fixed constants, and the case $B = O \( 1 \)$ uses the total mass bound. Thus
  #[#set math.equation(numbering: n => "(6.7)")
   $ sup_v lambda_B \( B \( v \, 1 \) \) lt.eq C L B^(- S) . $ <test:frequency-unit-ball>]
  Translation of $alpha$ changes only the phase of its transform, so assume its support is in a fixed ball. Choose a smooth compactly supported spatial function equal to one on that ball. Fourier convolution and the weighted Cauchy–Schwarz inequality give a nonnegative, integrable, rapidly decreasing kernel $Phi$, independent of $B$, for which
  $ \| hat(alpha) \( v \) \|^2 lt.eq C integral_(bb(R)^d) \| hat(alpha) \( u \) \|^2 Phi \( v - u \) thin d u . $
  Indeed one may take a rapidly decreasing majorant for the absolute value of the cutoff’s Fourier transform. Integrating against $lambda_B$ and writing $W_B = Phi * lambda_B$, we obtain
  $ integral \| hat(alpha) \( v \) \|^2 thin d lambda_B \( v \) lt.eq C integral \| hat(alpha) \( u \) \|^2 W_B \( u \) thin d u . $
  Summing Equation (6.7) over unit cubes against the decay of $Phi$ gives $W_B lt.eq C L B^(- S)$. On $\| u \| > 4 B$, the support and total mass of $lambda_B$ give, for every fixed $M$,
  #[#set math.equation(numbering: n => "(6.8)")
   $ W_B \( u \) lt.eq C_M B \( 1 + \| u \| \)^(- M) . $ <test:frequency-tail>]
  A Gaussian majorant and its positive Fourier transform show that
  $ integral_(\| u \| lt.eq 4 B) \| hat(alpha) \( u \) \|^2 thin d u & lt.eq C B^d integral.double e^(- c B^2 \| z - z' \|^2) thin d alpha \( z \) thin d alpha \( z' \)\
 & lt.eq C K B^(d - S) . $
  For completeness, the last bound follows by splitting the $z'$ integral into the ball of radius $B^(- 1)$ and annuli with radii $2^j B^(- 1)$. Every radius is at least $H^(- 1)$. Up to radius one use the assumed ball bound; above radius one use total mass at most one, which is bounded by $K r^S$. The resulting sum is bounded by $C K B^(- S) sum_(j gt.eq 0) 2^(j S) e^(- c' 4^j)$. The part with $\| u \| lt.eq 4 B$ therefore costs at most
  $ C L K B^(d - 2 S) = C L K . $
  For the complement, use $\| hat(alpha) \| lt.eq 1$ and Equation (6.8), choosing $M > d + 1$. Its contribution is at most $C B^(d + 1 - M) lt.eq C$, which is absorbed by $C L K$. Summing over the $O \( 1 + log H \)$ dyadic shells proves Equation (6.6). ◻
]

=== 6.4 Exceptional mass of the tests <exceptional-mass-of-the-tests>

#thm([Lemma 6.4.])[
  (Exceptional directions).  #emph[The constant $C_d$ in Definition 26 can be chosen depending only on $d$ so that the following holds for all fixed parameters and sufficiently large $N$. If $xi$ is any spherical subprobability satisfying 
$ xi \( B \( w \, r \) \) lt.eq R^sigma r^S #h(2em) \( R^(- 1) lt.eq r lt.eq 1 \) \, $

 then every level-zero test, uniformly in the class and the occupied anchor cube, has 
#[#set math.equation(numbering: n => "(6.9)")
 $ xi \( S^(d - 1) \\ G_(0 \, frak(t)) \( P \) \) lt.eq R^(- sigma) . $ <test:exceptional-bound>]

]
] <test:exceptional-directions>

#proof[
  First take a parallel descriptor. The anchor centre itself costs at most one in the count. Divide the other centres into annuli of distance comparable to $2^(- h)$ from $c_P$, where $g - O_d \( 1 \) lt.eq h lt.eq p + O_d \( 1 \)$. A given centre in this annulus is counted only for directions in two caps of radius
  $ O \( 2^(- \( p - h \)) R^(500 sigma) \) . $
  For radii at most one, the angular mass is at most $C R^(\( 1 + 500 S \) sigma) 2^(- S \( p - h \))$. For larger radii the same bound, after adjusting the constant, follows from the subprobability property. All small radii used are at least a fixed multiple of $R^(- 1)$; changing this multiple costs only a fixed cap covering. The number of centres is bounded by $C R^(I \( h \, p \) + C'_d sigma)$ by Equation (6.2). If an endpoint annulus has $h$ outside $\[ g \, p \]$, replace it by the nearer endpoint, which changes scales only by a dimensional constant. The identity
  $ I \( h \, p \) - S \( p - h \) \/ N = A_p - A_h lt.eq k \( g \, p \) $
  then gives expected count at most
  $ C \( N + 1 \) R^(k \( g \, p \) + C''_d sigma) . $
  Here $C''_d$ is dimensional, including the factor $1 + 500 S$. Choose $C_d > C''_d + 3$. For fixed $sigma$ and sufficiently large $N$, Markov’s inequality at threshold Equation (6.4) gives Equation (6.9).
  For a projection descriptor, rescale $P$ to unit size and let $alpha$ denote its conditional law. Set $H = 2^(t - p)$ and $delta_A = A_p - min_(p lt.eq n lt.eq t) A_n gt.eq 0$. By Lemma 25, its $S$-ball loss is $K = R^(delta_A + C'_d sigma)$. The rescaled tolerance of the level-zero test is $epsilon = 2 H^(- 1) R^(500 sigma)$. A constant multiple of
  $ F_epsilon \( u \) = (frac(sin \( u \/ \( 2 epsilon \) \), u \/ \( 2 epsilon \)))^2 $
  majorizes $upright(bold(1))_(\[ - epsilon \, epsilon \])$. Its Fourier transform is nonnegative, supported in $\[ - epsilon^(- 1) \, epsilon^(- 1) \] subset.eq \[ - H \, H \]$, and bounded by $C epsilon$. Fourier inversion and Tonelli’s Theorem thus bound the mean collision mass by
  $ integral \( alpha ⊗ alpha \) { \| \( z - z' \) dot.op w \| lt.eq epsilon } thin d xi \( w \) & lt.eq C epsilon integral_(- H)^H integral \| hat(alpha) \( s w \) \|^2 thin d xi \( w \) thin d s\
 & lt.eq C H^(- 1) \( 1 + log H \) R^(delta_A + \( 501 + C'_d \) sigma) . $
  The last inequality is Lemma 27 with $L = R^sigma$. Increasing the same dimensional $C_d$ so that $C_d > 504 + C'_d$ absorbs constants and $1 + log H$ and gives Equation (6.9) by Markov’s inequality. This argument also covers large tolerances; alternatively, if the threshold is at least one, the test holds for every direction. The choices of $C_d$ depend only on previously fixed dimensional constants, not on any small parameter. ◻
]

=== 6.5 Smooth masks and products <smooth-masks-and-products>

The width decreases as the index increases, while the count or mass threshold stays fixed. Consequently the sets $G_(i \, frak(t))$ increase with $i$. The considerable gap between the width exponent $500 sigma$ and the smoothing exponent $50 sigma$ gives a uniform buffer.

#thm([Lemma 6.5.])[
  (Masks with a directional buffer).  #emph[For a descriptor $frak(t)$ of nominal length $l'$, put 
$ D_(l') = max \( 1 \, 2^(l') R^(- 50 sigma) \) . $

 For all sufficiently large $N$, every $0 lt.eq i < J_0$ admits a mask $w_(i \, frak(t)) \( x \, w \) in \[ 0 \, 1 \]$, measurable in $x$ and smooth in $w$, such that, on every occupied anchor cube, 
#[#set math.equation(numbering: n => "(6.10)")
 $ w_(i \, frak(t)) = 1 upright(" on ") G_(i \, frak(t)) \, #h(2em) "supp"_w w_(i \, frak(t)) subset G_(i + 1 \, frak(t)) \, #h(2em) parallel T_1 dots.h.c T_j w_(i \, frak(t)) parallel_oo lt.eq C_j D_(l')^j . $ <test:mask-properties>]

 Here the $T_j$ are any members of a fixed finite collection of smooth tangent fields spanning the tangent spaces of the sphere. The masks are antipodally symmetric and constant as functions of $x$ on each anchor cube; they are zero on unoccupied cubes and outside the root. Moreover, the $c D_(l')^(- 1)$-neighbourhood of $G_(i \, frak(t))$ lies in $G_(i + 1 \, frak(t))$, with the same assertion for its closure after decreasing the fixed $c$.]
] <test:smooth-masks>

#proof[
  Consider directions $w \, w'$ at distance at most $c D_(l')^(- 1)$. In a parallel test $\[ g \, p \]$, changing direction changes the distance of a tested centre to the line by at most
  $ C_d 2^(- g) \| w - w' \| lt.eq C_d c 2^(- p) R^(50 sigma) . $
  Here $l' = p - g$; if $D_(l') = 1$, use $2^(l') lt.eq R^(50 sigma)$. In a projection test $\[ p \, t \]$ the change in the tested scalar displacement is at most
  $ C_d 2^(- p) \| w - w' \| lt.eq C_d c 2^(- t) R^(50 sigma) \, $
  by the same argument with $l' = t - p$. By contrast, the consecutive width gap at the relevant fine depth $n$ is
  $ W_i \( n \) - W_(i + 1) \( n \) = J_0^(- 1) 2^(- n) R^(500 sigma) . $
  For fixed parameters and sufficiently large $N$, each perturbation above is strictly less than half this gap. Every configuration counted at width $W_(i + 1)$ in direction $w'$ was therefore counted at width $W_i$ in direction $w$. If $w$ is good at level $i$, then $w'$ is good at level $i + 1$. The strict remaining margin also gives the asserted inclusion for the closure of a smaller neighbourhood.
  To construct the mask, take $r = c_0 D_(l')^(- 1)$ with $c_0$ sufficiently small, and the indicator of the spherical $2 r$-neighbourhood of $G_(i \, frak(t))$. Convolve it on the sphere with a nonnegative rotationally invariant smooth kernel of integral one, supported where the chordal distance is less than $r$. Such a kernel has angular derivative $L^1$ bounds $C_j r^(- j)$, by rescaling in a fixed finite collection of spherical charts. The convolution equals one on $G_(i \, frak(t))$ and is supported in the closure of its $3 r$-neighbourhood, contained in $G_(i + 1 \, frak(t))$. The derivative bounds in Equation (6.10) follow. Both tests and the kernel are invariant under $w mapsto - w$, so the mask is even. The construction is made separately for each of the finitely many anchor cubes; no spatial differentiability is required. ◻
]

#thm([Lemma 6.6.])[
  (Products and retained supports).  #emph[Consider a product with one factor for each occurrence in one or more descriptor lists whose total size is at most $N^(C_(*))$, with $C_(*)$ fixed independently of $N$. A factor may be a mask $w_(i \, frak(t))$ for any $0 lt.eq i < J_0$, or a derivative of order $q$ divided by $D_(l')^q$, where $l'$ is its nominal length. The indices may differ among factors. Assume the total order of these prescribed derivatives is bounded independently of $N$. A bounded number, independent of $N$, of measurable spatial multipliers and smooth angular factors are also allowed, with fixed numerical bounds for their sup norms and for all angular derivatives under consideration. These bounds are common to the family of products in any later supremum. Let $L$ be the largest nominal length, with $L = 0$ for an empty list, and set 
#[#set math.equation(numbering: n => "(6.11)")
 $ D_(*) = R^sigma max \( 1 \, 2^L R^(- 50 sigma) \) . $ <test:total-symbol-scale>]

 At each fixed angular derivative order $j$, the resulting product $b$ satisfies 
$ parallel T_1 dots.h.c T_j b parallel_oo lt.eq C_j D_(*)^j . $

 For each factor with descriptor $frak(t)$ and index $i$, the support of the product still imposes its $G_(i + 1 \, frak(t))$ condition, including when that factor was already differentiated. All these assertions are pointwise in the spatial variables. Constants may depend on the fixed list-size exponent, prescribed derivative budget, and numerical bounds for the extra factors, as well as on the previously fixed parameters.]
] <test:product-symbols>

#proof[
  An undifferentiated mask has norm at most one. Only a bounded number of factors are prescribed derivatives, and their normalized derivatives have bounds $C_j D_(l')^j$ by Lemma 29, uniformly over the allowed indices. At order $j$, the product rule gives at most a polynomial in $N$ terms, by the assumed list-size bound and because $j$ is fixed. Each term is bounded by a constant times $max \( 1 \, 2^L R^(- 50 sigma) \)^j$. For fixed $sigma > 0$, its polynomial multiplicity is at most $R^(sigma j)$ for sufficiently large $N$, giving Equation (6.11). The order-zero bound has no such multiplicity. Finally, the support of a derivative of a smooth function is contained in the support of the function. Thus none of the differentiations removes an imposed good-direction condition. ◻
]

=== 6.6 Fixed lists under interval containment <fixed-lists-under-interval-containment>

The individual tests and masks above are available for every descriptor. We now choose a fixed list for each depth interval. The list for a larger interval must contain the list for each subinterval, and each chosen descriptor must have a selecting interval extending by its nominal length on both sides of its anchor. We make each interval’s own scale choice once and reuse it whenever that interval contributes to a containing list.

Put $q_0 = ceil.l kappa N ceil.r$. Partition ${ 0 \, dots.h \, N }$ into consecutive blocks of $q_0$ indices, with the last block possibly shorter. In each block choose, once and for all, a depth minimizing $A$; break ties by a fixed rule. An interval $\[ a \, t \]$ is #emph[terminal] if $t - a lt.eq 100 q_0$. In a nonterminal interval select $p$ by minimizing $A$ among the representatives of blocks wholly contained in $\[ a + q_0 \, t - q_0 \]$, again using fixed tie breaking. Set

$ l = min \( p - a \, t - p \) . $

The choice is a #emph[prefix choice] if $2 p lt.eq a + t$, and a #emph[suffix choice] otherwise.

For each interval $\[ a \, t \]$, form the list $cal(M) \( a \, t \)$ as follows. For every nonterminal subinterval $\[ a' \, t' \] subset.eq \[ a \, t \]$, use its fixed choice $p \, l$ and include all parallel descriptors

$ \[ g \, p \] \, #h(2em) p - l lt.eq g < p . $

If the choice is a suffix choice, include also the projection descriptor $\[ p \, t' \]$. Repetitions within either type are removed.

For a membership $frak(t) in cal(M) \( a \, t \)$, an #emph[origin] means a nonterminal subinterval $\[ a' \, t' \] subset.eq \[ a \, t \]$ whose fixed choice generated $frak(t)$. The origin witnesses this particular membership; it is not part of the descriptor’s identity, and different memberships may use different origins. The initial entry will use one additional parallel descriptor outside these lists. The individual test and mask estimates apply to it without an origin.

#thm([Lemma 6.7.])[
  (Descriptor geometry).  #emph[For a nonterminal $\[ a \, t \]$, the union of the blocks eligible for its choice is an integer interval $\[ a_(*) \, t_(*) \]$ with 
$ a + q_0 lt.eq a_(*) lt.eq a + 2 q_0 \, #h(2em) t - 2 q_0 lt.eq t_(*) lt.eq t - q_0 \, #h(2em) A_n gt.eq A_p quad \( a_(*) lt.eq n lt.eq t_(*) \) . $

 The lists $cal(M) \( a \, t \)$ are nested under interval containment. Across the scheduled lists, there are $O \( 1 \/ kappa \)$ possible anchors and polynomially many descriptors. For every $frak(t) in cal(M) \( a \, t \)$ with anchor $p$ and nominal length $l'$, there is an origin $\[ a' \, t' \] subset.eq \[ a \, t \]$ such that 
#[#set math.equation(numbering: n => "(6.12)")
 $ \[ p - l' \, p + l' \] subset.eq \[ a' \, t' \] . $ <test:descriptor-origin>]

 That origin also supplies every parallel descriptor $\[ g \, p \]$ with $p - l' lt.eq g < p$. In particular $l' lt.eq \( t - a \) \/ 2$.]
] <test:descriptor-properties>

#proof[
  The eligible blocks are consecutive. The first starts less than one block length after $a + q_0$, and the last ends less than one block length before $t - q_0$. Nonterminality ensures that there are eligible blocks. For an index in their union, its own block representative has no larger profile value, and the selected $p$ has no larger value than that representative. This proves the first assertions.
  Each origin’s choice is made independently of the interval in whose list it is being included. Hence an origin contributing to a smaller interval contributes the same descriptors to every larger one, proving nesting. Anchors are block representatives, of which there are at most $1 + \( N + 1 \) \/ q_0$. A descriptor is specified by its type, anchor, and one other integer depth. Their number is therefore at most $2 \( N + 1 \) \( 1 + \( N + 1 \) \/ q_0 \)$.
  A parallel descriptor coming from $\[ a' \, t' \]$ has $l' = p - g lt.eq l$. A projection descriptor occurs only for a suffix choice and then has $l' = t' - p = l lt.eq p - a'$. These observations prove Equation (6.12); the list of parallel descriptors supplied by the same origin contains all the asserted ones. Deduplication preserves the conclusion for each membership: by definition, at least one of the origins that generated a descriptor in $cal(M) \( a \, t \)$ lies inside $\[ a \, t \]$. That origin may be chosen for this membership independently of any choice made for another list. ◻
]

The scheduled lists satisfy the polynomial bound in Lemma 30, as do those lists with any fixed number of extra descriptors. Their origin properties are needed only when using the schedule; the individual test, exceptional-direction, and mask estimates apply to every descriptor defined above.

== 7 Spherical oscillatory integrals and distance shells <osc:section>

This Section proves a Fourier estimate for weighted distance measures built from separated class laws and endpoint masks. Its output is a spherical angular energy with the same endpoint data. The proof uses global stationary-phase operators on the sphere, so their derivatives can be distributed between the two endpoint symbols without creating a coefficient that depends jointly on the endpoints. Section 9 will apply this estimate to high frequencies in a positive count of pairs with nearly equal distances.

Throughout this Section, spatial and frequency depths are integers in $\[ 0 \, N \]$. In an angular energy they satisfy $0 lt.eq a lt.eq v lt.eq N$. The largest nominal length of an empty descriptor list is zero. Write $n_(*) = d - 1$.

=== 7.1 Separated cells and endpoint symbols <separated-cells-and-endpoint-symbols>

Fix a power of two $K_d$ with $1000 \( d + 1 \) < K_d < 4000 \( d + 1 \)$. Two depth-$a$ cells $X \, Y$ are called #emph[separated] if

#[#set math.equation(numbering: n => "(7.1)")
 $ K_d 2^(- a) \/ 8 lt.eq \| c_X - c_Y \| lt.eq 4 K_d 2^(- a) . $ <osc:separation>]

For $x in X$, $y in Y$ we then have $D \( x \, y \) asymp_d 2^(- a)$, and their directions $e \( x \, y \) = \( x - y \) \/ D \( x \, y \)$ lie in a cone of small fixed aperture. Choose $0 lt.eq psi lt.eq 1$ smooth on $S^(d - 1)$, identically one on a fixed neighborhood of these directions and zero on a fixed neighborhood of their negatives. Its derivatives of every fixed order are uniformly bounded. We use the same convention for the fixed separated outer supports, with $a = 0$; constants there may depend on the initial geometry.

All angular derivatives below can be taken in the fixed smooth tangent fields

$ Omega_(u v) = w_u partial_(w_v) - w_v partial_(w_u) \, #h(2em) 1 lt.eq u < v lt.eq d . $

These fields span every tangent space of the sphere. A word of length $q$ in these fields is denoted by $Omega^alpha$, $\| alpha \| = q$; the empty word is the identity. Recall that a descriptor $frak(t)$ of nominal length $l_(frak(t))$ has angular scale

$ D_(l_(frak(t))) = max \( 1 \, 2^(l_(frak(t))) R^(- 50 sigma) \) . $

#prodef([Definition 7.1.])[
  (Admissible symbols).  Fix an indexed descriptor list $cal(A) = \( frak(t)_nu \)_(nu in cal(I))$ with $\# cal(I) lt.eq N^(C_(cal(A)))$, a smoothing index $i in { 0 \, dots.h \, J_0 - 1 }$, and a nonnegative integer derivative budget $B$. The exponent $C_(cal(A))$ and budget $B$ are fixed independently of $N$ and are common to the symbol family under consideration. At each angular order under consideration, also fix a common numerical bound $Q_j$ independent of $N$. An admissible endpoint symbol has the form
  #[#set math.equation(numbering: n => "(7.2)")
   $ b_x \( w \) = f \( x \) q \( w \) product_(nu in cal(I)) D_(l_(frak(t)_nu))^(- \| alpha_nu \|) Omega^(alpha_nu) w_(i \, frak(t)_nu) \( x \, w \) \, #h(2em) sum_(nu in cal(I)) \| alpha_nu \| lt.eq B . $ <osc:symbol-form>]
  The index $nu$ distinguishes occurrences, so repeated descriptors may receive different derivative words. Here $f$ is an arbitrary measurable spatial function with $\| f \| lt.eq 1$, and $q$ is a smooth angular function satisfying $parallel q parallel_(C^j \( S^(d - 1) \)) lt.eq Q_j$ at every order under consideration. The constants in estimates may depend on $C_(cal(A))$, $B$ and the fixed $Q_j$. Fixed scalar factors can be absorbed in those estimates. Empty lists and empty products are allowed, as are complex conjugates of such symbols. Symbols do not depend on the radial variable $r$.
] <osc:symbols>

No spatial regularity is required in Definition 32. In particular, $f$ can impose an arbitrary Borel restriction inside a cell. Every differentiated mask has the same angular support as, or a smaller support than, the original mask. Thus every descriptor present in a symbol still imposes its level-$\( i + 1 \)$ good condition.

#thm([Lemma 7.2.])[
  (Derivative bounds and reached anchors).  #emph[Let $L$ be the largest nominal length in the symbol’s list, or in all lists for a product of symbols, with $L = 0$ when those lists are empty, and put 
#[#set math.equation(numbering: n => "(7.3)")
 $ D_(*) = R^sigma max \( 1 \, 2^L R^(- 50 sigma) \) . $ <osc:derivative-scale>]

 For every fixed $j$, an admissible symbol, or a product of a fixed number of endpoint symbols, obeys 
#[#set math.equation(numbering: n => "(7.4)")
 $ sup_x parallel b_x parallel_(C^j \( S^(d - 1) \)) lt.eq C_(j \, B) D_(*)^j $ <osc:angular-derivatives>]

 for sufficiently large $N$. The constant may depend on the fixed list-size exponents, parameters, derivative budgets and common angular bounds, but not on the spatial multipliers. On a depth-$a$ cell, the product of all mask factors whose anchors have depth at most $a$ is independent of the spatial integration variable and has uniformly bounded modulus. We call these anchors #emph[reached] at depth $a$.]
] <osc:symbol-bounds>

#proof[
  Apply Lemma 30 to each endpoint symbol, using the polynomial list bound, the prescribed derivative budget and the common bounds for $q$. A fixed product of endpoint symbols then satisfies the same estimate by the finite product rule, even if their smoothing indices differ. For the last assertion, an anchor cell at depth at most $a$ contains the depth-$a$ cell, and its mask is constant in the spatial variable on that cell. Angular differentiation preserves this constancy. The product has bounded modulus because only boundedly many factors were prescribed derivatives and all other masks have modulus at most one. ◻
]

=== 7.2 General angular energies <general-angular-energies>

For occupied depth-$a$ cells of one or two classes, with specified admissible endpoint symbols, define

#[#set math.equation(numbering: n => "(7.5)")
 $ U_X \( r \, w \) = frac(1, M_1 \( a \)) integral_X e^(i r w dot.op x) b_x \( w \) thin d rho_1 \( x \) \, #h(2em) V_Y \( r \, w \) = frac(1, M_2 \( a \)) integral_Y e^(i r w dot.op y) c_y \( w \) thin d rho_2 \( y \) . $ <osc:transforms>]

These transforms are normalized by the profile model masses, not by the actual cell masses. Before the endpoint factors are inserted, the first underlying measure has mass $rho_1 \( X \) \/ M_1 \( a \) = R^(O_d \( sigma \))$, and similarly on the second side. It need not be a conditional probability. Fix $Psi gt.eq 0$ in $C_c^oo \( \( 1 \/ 4 \, 4 \) \)$ with $Psi gt.eq 1$ on $\[ 1 \/ 2 \, 2 \]$. Surface measure on the sphere is denoted by $d w$.

#prodef([Definition 7.3.])[
  (General angular energies).  For $0 lt.eq a lt.eq v lt.eq N$, the independent angular energy is
  #[#set math.equation(numbering: n => "(7.6)")
   $ sans(H)^(X \, Y) \( a \, v \) = 2^(d \( v - a \)) integral Psi \( r \/ 2^v \) (integral_(S^(d - 1)) \| U_X \( r \, w \) \|^2 thin d w) (integral_(S^(d - 1)) \| V_Y \( r \, w \) \|^2 thin d w) frac(d r, 2^v) . $ <osc:H>]
  It is defined without any separation condition. In separated geometry we also use the form with one shared angle
  #[#set math.equation(numbering: n => "(7.7)")
   $ sans(H)_F^(X \, Y) \( a \, v \) = 2^(d \( v - a \)) integral Psi \( r \/ 2^v \) lr(|integral_(S^(d - 1)) psi \( w \) U_X \( r \, w \) overline(V_Y \( r \, w \)) thin d w|)^2 frac(d r, 2^v) . $ <osc:HF>]
  These are values for the specified class laws, cells and endpoint symbols, including the lists present in those symbols. We use maxima over finite collections of cell pairs and suprema when symbols vary; the family in a supremum will be stated.
] <osc:states>

Cauchy–Schwarz in $w$, with $0 lt.eq psi lt.eq 1$, gives at each radius

$ lr(|integral psi \( w \) U_X \( r \, w \) overline(V_Y \( r \, w \)) thin d w|)^2 lt.eq (integral \| U_X \( r \, w \) \|^2 thin d w) (integral \| V_Y \( r \, w \) \|^2 thin d w) . $

The radial measure and prefactor in the two forms are the same, so

#[#set math.equation(numbering: n => "(7.8)")
 $ sans(H)_F^(X \, Y) \( a \, v \) lt.eq sans(H)^(X \, Y) \( a \, v \) $ <osc:angular-cs>]

with exactly the same endpoint symbols and their support conditions.

There is a second operation available only in the positive independent energy. On a depth-$a$ cell, factor the reached mask factors out of its transform as an angular function. Lemma 33 bounds its modulus, so bounding that modulus inside the corresponding positive angular integral gives, at bounded cost, the independent energy with those factors deleted. This operation keeps the remaining endpoint symbols unchanged. It does not permit deletion inside the shared angular integral in $sans(H)_F$ before its absolute square is taken.

=== 7.3 The weighted shell estimate <the-weighted-shell-estimate>

The scalar input below includes a distance weight that cancels the leading stationary distance power. The conclusion retains the specified endpoint lists and the same cell depth.

#thm([Proposition 7.4.])[
  (Weighted shell conversion).  #emph[Let $0 lt.eq a lt.eq v lt.eq N$ be integer depths, and let $X \, Y$ be separated cells at depth $a$ of one or two classes. Let $m_x \( w \)$ and $n_y \( w \)$ be products of the undifferentiated masks at one index $i < J_0$ for two specified indexed descriptor lists. Assume both lists have at most $N^(C_(cal(A)))$ occurrences, where one exponent $C_(cal(A))$ is fixed independently of $N$ for the whole family under consideration, as in Definition 32. Let $L$ be the largest nominal length in either list, with $L = 0$ when both lists are empty. For measurable $\| f \| \, \| g \| lt.eq 1$ define a possibly complex measure $nu$ on the distance line by 
#[#set math.equation(numbering: n => "(7.9)")
 $ integral F \( s \) thin d nu \( s \) & = frac(1, M_1 \( a \) M_2 \( a \)) integral_(X times Y) F \( D \( x \, y \) \) thin \( D \( x \, y \) 2^a \)^(- n_(*) \/ 2)\
 & #h(2em) #h(2em) dot.op f \( x \) overline(g \( y \)) thin m_x \( e \( x \, y \) \) n_y \( e \( x \, y \) \) thin d rho_1 \( x \) d rho_2 \( y \) . $ <osc:weighted-measure>]

 If 
#[#set math.equation(numbering: n => "(7.10)")
 $ v - a gt.eq 20 sigma N \, #h(2em) L lt.eq \( v - a \) \/ 2 + sigma N \, $ <osc:shell-regime>]

 then for every fixed $T > 0$, 
#[#set math.equation(numbering: n => "(7.11)")
 $ 2^(- a) integral_(2^(v - 1))^(2^(v + 1)) \| hat(nu) \( r \) \|^2 thin d r lt.eq R^(o \( 1 \)) sup sans(H)_F \( a \, v \) + O \( R^(- T) \) . $ <osc:shell-estimate>]

 The supremum has the same cells, class normalizations, lists and smoothing index as in Equation (7.9). Its symbols are admissible with a derivative budget and common bounds for smooth angular factors depending only on $T \, d \, C_(cal(A))$ and the fixed parameters. All these bounds are independent of $N$. When $f = g = 1$, the measure $nu$ is positive. The assertion also holds on the fixed outer supports with $a = 0$.]
] <osc:shell-conversion>

The rest of this Section proves Proposition 35. We first obtain the global sphere expansions, then separate the remaining smooth spatial coefficient into bounded functions of the two endpoints.

=== 7.4 Stationary phase with global angular coefficients <stationary-phase-with-global-angular-coefficients>

Give the sphere Laplacian the convention $Delta_(S^(n_(*))) = "div" nabla$, so its eigenvalues are nonpositive. Define

#[#set math.equation(numbering: n => "(7.12)")
 $ c_(n_(*)) & = \( 2 pi \)^(n_(*) \/ 2) e^(- i pi n_(*) \/ 4) \,\
L_0 & = c_(n_(*)) "Id" \,\
L_j & = frac(c_(n_(*)), \( 2 i \)^j j !) product_(q = 0)^(j - 1) (Delta_(S^(n_(*))) + q \( q + 1 \) - frac(n_(*) \( n_(*) - 2 \), 4)) \, #h(2em) j gt.eq 1 . $ <osc:L-operators>]

For the opposite stationary point put $L_(j \, - 1) b = overline(L_j overline(b))$, and write $L_(j \, + 1) = L_j$. These operators are defined globally, including when $d = 2$.

#thm([Lemma 7.5.])[
  (Direct and inverse sphere expansions).  #emph[Suppose $b in C^oo \( S^(n_(*)) \)$ obeys $parallel b parallel_(C^m) lt.eq C_m A^m$ at the finitely many orders needed below, where $A gt.eq 1$. Let $Delta eq.not 0$, $e = Delta \/ \| Delta \|$, $Lambda = r \| Delta \|$, and $r > 0$. A cutoff $psi$ is assumed to equal one on a fixed neighborhood of $e$ and zero on a fixed neighborhood of $- e$, with uniformly bounded derivatives. For every integer $J gt.eq 1$, 
#[#set math.equation(numbering: n => "(7.13)")
 $ integral_(S^(n_(*))) e^(i r w dot.op Delta) psi \( w \) b \( w \) thin d w & = Lambda^(- n_(*) \/ 2) [e^(i Lambda) sum_(j = 0)^(J - 1) Lambda^(- j) \( L_j b \) \( e \) + E_J] \,\
\| E_J \| & lt.eq C_J Lambda^(- J) A^(2 J + d + 2) \, $ <osc:direct>]

 provided $Lambda gt.eq 1$. Without a cutoff the corresponding formula is 
#[#set math.equation(numbering: n => "(7.14)")
 $ integral_(S^(n_(*))) e^(i r w dot.op Delta) b \( w \) thin d w = Lambda^(- n_(*) \/ 2) [sum_(epsilon.alt in { + 1 \, - 1 }) e^(i epsilon.alt Lambda) sum_(j = 0)^(J - 1) Lambda^(- j) \( L_(j \, epsilon.alt) b \) \( epsilon.alt e \) + E'_J] \, $ <osc:full-sphere>]

 with the same remainder bound. Define global differential operators 
#[#set math.equation(numbering: n => "(7.15)")
 $ B_0 = L_0^(- 1) \, #h(2em) B_j = - L_0^(- 1) sum_(h = 1)^j L_h B_(j - h) . $ <osc:B-operators>]

 Each $B_j$ is a polynomial in $Delta_(S^(n_(*)))$ of differential order at most $2 j$. If, for a fixed $c > 0$, 
#[#set math.equation(numbering: n => "(7.16)")
 $ Lambda gt.eq R^(c sigma) \, #h(2em) A^2 \/ Lambda lt.eq R^(- c sigma) \, #h(2em) 1 lt.eq A lt.eq R^2 \, $ <osc:stationary-regime>]

 then for every prescribed $T > 0$ a fixed sufficiently large $J$ gives 
#[#set math.equation(numbering: n => "(7.17)")
 $ e^(i Lambda) b \( e \) = Lambda^(n_(*) \/ 2) sum_(j = 0)^(J - 1) Lambda^(- j) integral_(S^(n_(*))) e^(i r w dot.op Delta) psi \( w \) \( B_j b \) \( w \) thin d w + O \( R^(- T) \) . $ <osc:inverse>]

 The extracted remainders in Equations (7.13) and (7.14) are also $O \( R^(- T) \)$ after increasing $J$. All constants are uniform in $e$ in the stipulated geometry.]
  #emph[For $r = 2^v s$ with $s$ in a fixed compact subinterval of $\( 0 \, oo \)$, each coefficient $Lambda^(- j) \( L_(j \, epsilon.alt) b \) \( epsilon.alt e \)$ has uniformly bounded derivatives of every fixed order in $s$ under Equation (7.16). Every differential coefficient retains the supports of all the mask factors in $b$.]
] <osc:stationary>

#proof[
  We first obtain a local expansion with a controlled remainder. Away from $e$ and $- e$, the angular gradient of $w dot.op e$ is bounded below. Repeated integration by parts with this gradient bounds the integral there by any chosen power of $Lambda^(- 1)$, paying at most the corresponding angular derivatives of $b$. Near the maximum, rotate $e$ to the last coordinate vector and use
  $ w \( u \) = #scale(x: 120%, y: 120%)[\(] u sqrt(1 - \| u \|^2 \/ 4) \, 1 - \| u \|^2 \/ 2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) d w = \( 1 - \| u \|^2 \/ 4 \)^(\( n_(*) - 2 \) \/ 2) thin d u . $
  The phase is exactly $w dot.op e = 1 - \| u \|^2 \/ 2$ and the Jacobian equals one at $u = 0$. These charts and their derivatives can be chosen uniformly on finitely many patches of possible $e$. Thus the local integral is $e^(i Lambda) integral e^(- i Lambda \| u \|^2 \/ 2) a_e \( u \) thin d u$, with $a_e$ compactly supported in a fixed coordinate ball and $parallel a_e parallel_(C^m) lt.tilde_m A^m$.
  The Fourier formula for a Gaussian, obtained first with positive damping and then by taking its limit, expresses the quadratic integral $integral e^(- i Lambda \| u \|^2 \/ 2) a_e \( u \) thin d u$ as $c_(n_(*)) Lambda^(- n_(*) \/ 2)$ times the integral of $hat(a)_e \( xi \) e^(i \| xi \|^2 \/ \( 2 Lambda \))$ with the Fourier inversion normalization. Taylor expansion through order $J - 1$ has remainder at most
  $ C_J Lambda^(- J) integral \| xi \|^(2 J) \| hat(a)_e \( xi \) \| thin d xi lt.eq C_J Lambda^(- J) A^(2 J + d + 2) . $
  The last inequality follows by integrating by parts in the transform to an order greater than $2 J + n_(*)$; all supports have fixed diameter. For the nonstationary portion take $M = J + ceil.l n_(*) \/ 2 ceil.r$ integrations by parts. After extracting $Lambda^(- n_(*) \/ 2)$, its bound is $C_M Lambda^(n_(*) \/ 2 - M) A^M lt.eq C_J Lambda^(- J) A^(2 J + d + 2)$. We have proved Equation (7.13) with differential coefficients of order at most $2 j$ and leading coefficient $c_(n_(*)) b \( e \)$.
  We identify these coefficients without making a choice of moving endpoint coordinates. For this identification fix a smooth $b$ and use a polar cutoff $chi \( w dot.op e \)$ equal to one near $w = e$ and zero outside a slightly larger fixed cap. The Fourier extension $F \( xi \) = integral e^(i w dot.op xi) b \( w \) thin d w$ satisfies $\( Delta_xi + 1 \) F = 0$. The same identity for its polar-cutoff outgoing part has an error decreasing faster than every power of $\| xi \|$: derivatives of the cutoff are supported away from both stationary points, so the preceding integration by parts applies, also after any fixed number of derivatives. In polar coordinates the differential operator is
  $ partial_Lambda^2 + n_(*) / Lambda partial_Lambda + 1 + Lambda^(- 2) Delta_(S^(n_(*))) . $
  The Gaussian expansion can be differentiated any fixed number of times in its angular and radial parameters: differentiate the compactly supported coordinate amplitudes and Gaussian formula, and take more terms to bound the differentiated remainder. We may therefore substitute the local outgoing expansion $e^(i Lambda) Lambda^(- n_(*) \/ 2) sum_(j gt.eq 0) Lambda^(- j) a_j \( e \)$. Uniqueness of its power coefficients gives
  $ 2 i \( j + 1 \) a_(j + 1) = (Delta_(S^(n_(*))) + j \( j + 1 \) - frac(n_(*) \( n_(*) - 2 \), 4)) a_j . $
  Starting from $a_0 = c_(n_(*)) b$, this is exactly Equation (7.12). A cutoff equal to one near $e$ has the same coefficients, since the difference is nonstationary. The minimum has the conjugate Gaussian phase, proving Equation (7.14).
  For inversion, apply Equation (7.13) to $B_j b$, expanding its series through index $J - j - 1$. Equation (7.15) cancels every coefficient of total index $1 \, dots.h \, J - 1$, and its index-zero coefficient is $b$. The derivative bound for $B_j b$ at order $m$ is $C_(j \, m) A^(m + 2 j)$. After multiplication by $Lambda^(- j)$ its extracted remainder is therefore at most $C_J Lambda^(- J) A^(2 J + d + 2)$, uniformly in $0 lt.eq j < J$. Under Equation (7.16) this is at most
  $ C_J \( A^2 \/ Lambda \)^J A^(d + 2) lt.eq C_J R^(- c sigma J + 2 \( d + 2 \)) . $
  Taking $J$ large proves all the asserted arbitrary-power estimates.
  Finally, $e$ and $b$ are independent of $s$, and each $s$ derivative of $Lambda^(- j) \( L_(j \, epsilon.alt) b \) \( epsilon.alt e \)$ costs only a fixed constant times $Lambda^(- j) A^(2 j)$, which is bounded. The same elementary Taylor remainder argument can accommodate any prescribed finite number of radial derivatives by increasing the truncation order. In the present applications $Lambda lt.tilde R^2$, so even unstripped radial derivatives of the error can be made an arbitrary negative power by increasing that order once more. For the support assertion, use
  $ Delta_(S^(d - 1)) = sum_(u < v) Omega_(u v)^2 . $
  Leibniz expansion of any $L_j$ or $B_j$ differentiates, but never removes, each original mask factor. Derivatives of a smooth function cannot enlarge its support. This proves the assertion, including for arbitrary measurable spatial multipliers. ◻
]

=== 7.5 Separation of the remaining spatial coefficient <separation-of-the-remaining-spatial-coefficient>

#thm([Lemma 7.6.])[
  (Separated spatial expansion).  #emph[On separated depth-$a$ cells, for every fixed $j gt.eq 0$ there are bounded measurable functions $f_ell$ on $X$ and $g_ell$ on $Y$ and constants $c_ell$ such that 
#[#set math.equation(numbering: n => "(7.18)")
 $ \( D \( x \, y \) 2^a \)^(- j) = sum_ell c_ell f_ell \( x \) g_ell \( y \) \, #h(2em) \| f_ell \| \, \| g_ell \| lt.eq 1 \, #h(2em) sum_ell \| c_ell \| lt.eq C_(d \, j) . $ <osc:spatial-series>]

 The convergence is uniform. The same assertion holds in the fixed outer geometry, with a constant depending on that geometry.]
] <osc:spatial-separation>

#proof[
  Write $x = c_X + 2^(- a) u$, $y = c_Y + 2^(- a) z$. Both rescaled endpoint cells lie in fixed boxes. By Equation (7.1), $\| 2^a \( c_X - c_Y \) + u - z \|$ is bounded above and below by positive constants on a fixed neighborhood of their product. Consequently its negative $j$th power has a smooth extension, with uniform bounds of every fixed order, supported in a slightly larger product box. Regard this extension as a smooth function on a fixed torus of dimension $2 d$. Its Fourier series has coefficients bounded by $C_m \( 1 + \| k \| + \| l \| \)^(- m)$. Choosing $m > 2 d$ makes their absolute sum bounded. Each Fourier exponential splits into one function of $u$ and one of $z$, each of modulus one. Pulling them back proves the claim. The proof on the fixed separated outer supports is identical. ◻
]

=== 7.6 Proof of the weighted shell estimate <proof-of-the-weighted-shell-estimate>

#proof[
  Put $q = v - a$, $s = r \/ 2^v$, and $D_max = max \( 1 \, 2^L R^(- 50 sigma) \)$. On the shell in question, $Lambda = r D \( x \, y \) asymp 2^q$ and
  $ D_(*) = R^sigma D_max lt.eq max \( R^sigma \, 2^(q \/ 2) R^(- 48 sigma) \) \, #h(2em) D_(*)^2 / Lambda lt.tilde max \( R^(2 sigma) 2^(- q) \, R^(- 96 sigma) \) lt.tilde R^(- 18 sigma) . $
  Moreover $Lambda gt.tilde R^(20 sigma)$ and $D_(*) lt.eq R^2$. Fixed geometric constants can be absorbed by slightly decreasing these positive exponents. Lemma 36 therefore applies uniformly to the endpoint product $m_x \( w \) n_y \( w \)$.
  We first estimate $hat(nu) \( - r \)$, which has the outgoing phase $e^(i r D)$. This suffices also for $hat(nu) \( r \)$: conjugating the spatial multipliers conjugates $nu$, and $hat(overline(nu)) \( - r \) = overline(hat(nu) \( r \))$. Use Equation (7.17) pointwise for each $\( x \, y \)$ and multiply by the weight in Equation (7.9). The leading distance power cancels exactly:
  #[#set math.equation(numbering: n => "(7.19)")
   $ \( D 2^a \)^(- n_(*) \/ 2) \( r D \)^(n_(*) \/ 2) \( r D \)^(- j) = \( r 2^(- a) \)^(n_(*) \/ 2) \( r 2^(- a) \)^(- j) \( D 2^a \)^(- j) . $ <osc:weight-cancellation>]
  The operator $B_j$ is global. Its Leibniz expansion on $m_x n_y$ is a sum of products of angular derivatives of the individual masks, of total order at most $2 j$. Divide every differentiated mask by its own scale $D_(l_(frak(t)))$ to the corresponding order. The resulting factors are admissible, retain every descriptor, and their extracted scales have product at most $D_max^(2 j)$. Their number is polynomial in $N$, since $j$ is fixed. Smooth angular factors, if produced, can be included in either endpoint symbol.
  The inverse factor pays for all these scales, since
  #[#set math.equation(numbering: n => "(7.20)")
   $ 2^(- j q) D_max^(2 j) lt.eq #scale(x: 120%, y: 120%)[\[] max \( 2^(- q) \, R^(- 98 sigma) \) #scale(x: 120%, y: 120%)[\]]^j lt.eq 1 . $ <osc:scale-payment>]
  Apply Lemma 37 to the remaining factor $\( D 2^a \)^(- j)$. Its absolutely summable expansion only multiplies the original arbitrary spatial factors by bounded endpoint functions. After summing the finitely many inverse orders, we obtain
  #[#set math.equation(numbering: n => "(7.21)")
   $ hat(nu) \( - 2^v s \) = 2^(n_(*) q \/ 2) sum_alpha c_alpha \( s \) integral psi \( w \) U_(X \, alpha) \( 2^v s \, w \) overline(V_(Y \, alpha) \( 2^v s \, w \)) thin d w + cal(E) \( 2^v s \) \, $ <osc:shell-factorization>]
  where
  $ sum_alpha parallel c_alpha parallel_(L^oo \( \[ 1 \/ 2 \, 2 \] \)) lt.eq R^(o \( 1 \)) . $
  The factors $s^(n_(*) \/ 2 - j)$ are included in $c_alpha \( s \)$ and are uniformly bounded on this interval. The index set can be countable because of the spatial Fourier series; its absolute summability justifies all interchanges. All endpoint transforms in Equation (7.21) have the form Equation (7.5) with the stated enlarged fixed budget.
  The pointwise error $cal(E)$ is smaller than any prescribed negative power of $R$. Indeed Lemma 36 supplies such an error before the endpoint integrations. The rescaled distance weight is bounded, and the normalized cell masses are $rho_j \( X \) \/ M_j \( a \) lt.eq R^(O_d \( sigma \))$. Increasing the initial accuracy absorbs these factors and any subsequent square. The shell length is at most $2^(N + 1) = 2 R$, since $v lt.eq N$, and is absorbed by the same choice.
  Apply the triangle inequality in $L^2 \( \[ 1 \/ 2 \, 2 \] \, d s \)$ to Equation (7.21). Since $Psi gt.eq 1$ there, the square of each angular integral is bounded by its contribution to the corresponding $sans(H)_F$ energy. The complete prefactor is
  #[#set math.equation(numbering: n => "(7.22)")
   $ 2^(- a) thin 2^v thin 2^(n_(*) \( v - a \)) = 2^(d \( v - a \)) . $ <osc:normalization-identity>]
  This is precisely the normalization in Equation (7.7), proving Equation (7.11). Complex conjugation gives the positive-frequency formulation stated in the Proposition. ◻
]

== 8 The graph estimate <graph:section>

The independent angular energy uses a common radial frequency and two independent directions. We now pass from a pair of depth-$a$ cells to depth-$p$ cells. After splitting the endpoint transforms into cell pieces, angular and radial oscillation restrict the four cell labels to a graph of small row and column degrees. The parallel tests give the degree bound.

The cell terms remain oscillatory until the nonstationary terms have been removed. We then take absolute values of the retained terms and bound them by positive independent angular energies on the smaller cells. At the end of the Section, Cauchy–Schwarz transfers this estimate to the separated form $sans(H)_F$ with the same endpoint symbols.

#thm([Proposition 8.1.])[
  (Graph estimate for the independent angular energy).  #emph[Let $rho_1 \, rho_2$ be two regularized class laws, possibly equal, and write $M_j$, $A_(j \, n)$, $I_j$ and $k_j$ for their profiles and associated quantities from Section 6. Let $X \, Y$ be occupied cells of depth $a$. Put $X_1 = X$, $X_2 = Y$, and let $b_z^(\( j \)) \( w \)$ be an admissible endpoint symbol on $X_j$ in the sense of Definition 32. Let $L$ be the largest nominal length of a descriptor in either symbol, with $L = 0$ if both lists are empty. Suppose that the integer depths satisfy $0 lt.eq a < p lt.eq v lt.eq N$ and 
#[#set math.equation(numbering: n => "(8.1)")
 $ p - a lt.eq v - p + 2 sigma N \, #h(2em) L lt.eq v - p + 2 sigma N \, #h(2em) v - p gt.eq 10 sigma N . $ <graph:range>]

 At endpoint $j$, suppose that the symbol imposes the parallel test $\[ g_j \, p \]$ at a level $ell_j in { 0 \, dots.h \, J_0 }$: for $rho_j$-almost every $z in X_j$ and every $w in S^(d - 1)$, 
#[#set math.equation(numbering: n => "(8.2)")
 $ b_z^(\( j \)) \( w \) eq.not 0 quad arrow.r.double quad w in G_(ell_j \, \[ g_j \, p \])^(\( j \)) \( z \) . $ <graph:support-test>]

 The superscript $j$ indicates the class used in the test. Assume 
#[#set math.equation(numbering: n => "(8.3)")
 $ a lt.eq g_j < p \, #h(2em) g_j lt.eq a + 2 sigma N . $ <graph:anchor-range>]

]
  #emph[Form the general independent energy $sans(H)^(X \, Y) \( a \, v \)$ of Definition 34 using these specified symbols. For every fixed $T > 0$, 
#[#set math.equation(numbering: n => "(8.4)")
 $ sans(H)^(X \, Y) \( a \, v \) & lt.eq R^(- sum_(j = 1)^2 \( A_(j \, p) - A_(j \, a) \) + min_(j = 1 \, 2) k_j \( a \, p \) + O_d \( sigma \) + o \( 1 \))\
 & #h(2em) dot.op max_(P subset X \, med Q subset Y\
P \, Q upright(" occupied depth-") p upright(" cells")) sans(H)^(P \, Q) \( p \, v \) + O \( R^(- T) \) . $ <graph:bound>]

 No separation of $X$ and $Y$ is required. Every child in (8.4) is formed by restricting the same endpoint symbols to $P$ and $Q$. It retains every original mask factor, including any whose anchor is $p$. Constants are uniform over cells and allowed symbols with fixed list-size exponents and derivative budgets, and with fixed common numerical bounds for their smooth angular factors at the derivative orders used. The $o \( 1 \)$ tends to zero as $N arrow.r oo$ with these bounds, the parameters, and $T$ fixed.]
] <graph:estimate>

We give the localization and degree arguments separately. Set

#[#set math.equation(numbering: n => "(8.5)")
 $ h = p - a \, #h(2em) q = v - p \, #h(2em) delta = min \( c_0 \, 2^(- h) R^(10 sigma) \) \, #h(2em) tau = 2^(- p) R^(30 sigma) \, $ <graph:scales>]

where $c_0 > 0$ is a sufficiently small dimensional constant. Take a nonnegative smooth partition of unity ${ eta_nu }$ on the sphere, with bounded overlap, such that $eta_nu$ is supported in a cap of radius $C delta$ centered at $w_nu$, and

#[#set math.equation(numbering: n => "(8.6)")
 $ parallel nabla^m eta_nu parallel_oo lt.eq C_m delta^(- m) . $ <graph:bin-derivatives>]

This can be obtained by normalizing scaled bumps on a finite atlas; the number of caps is $O_d \( delta^(- \( d - 1 \)) \)$. No relation between the two cap centers used below is imposed.

For occupied depth-$p$ cells, use the transforms $U_P \, V_Q$ of Equation (7.5), divided by the model masses $M_1 \( p \)$ and $M_2 \( p \)$, respectively. The exact splitting identities are

#[#set math.equation(numbering: n => "(8.7)")
 $ U_X = lambda_1 sum_(P subset X) U_P \, #h(2em) V_Y = lambda_2 sum_(Q subset Y) V_Q \, #h(2em) lambda_j = frac(M_j \( p \), M_j \( a \)) = R^(- I_j \( a \, p \)) . $ <graph:splitting>]

Expand the two squares in $sans(H)^(X \, Y) \( a \, v \)$ and insert the angular partition in both variables. Index each term by a row $\( P \, Q \)$ and a column $\( P' \, Q' \)$, with $x in P$, $x' in P'$, $y in Q$, and $y' in Q'$. The $P$-labels belong to $rho_1$ and the $Q$-labels to $rho_2$. Put

$ Delta_1 = x - x' \, #h(2em) Delta_2 = y - y' \, #h(2em) d_1 = c_P - c_(P') \, #h(2em) d_2 = c_Q - c_(Q') . $

With the spatial points fixed, the term has phase

#[#set math.equation(numbering: n => "(8.8)")
 $ r #scale(x: 120%, y: 120%)[\(] w_1 dot.op Delta_1 + w_2 dot.op Delta_2 #scale(x: 120%, y: 120%)[\)] . $ <graph:phase>]

Each displacement joins two points in the same depth-$a$ parent cell. Consequently

#[#set math.equation(numbering: n => "(8.9)")
 $ \| Delta_j \| + \| d_j \| lt.tilde_d 2^(- a) . $ <graph:displacement-size>]

The locations of $X$ and $Y$ relative to one another do not enter this bound.

For an endpoint cell $P$ with measure $rho$ and symbol $b_x$, define

$ E \( P \, nu \) = integral_P integral_(S^(d - 1)) eta_nu \( w \) \| b_x \( w \) \|^2 thin d w thin d rho \( x \) . $

Here symbols are set to zero on any fixed spatial null set where their stated support conditions have not been specified. The cell–cap incidence $\( P \, nu \)$ is #emph[eligible] precisely when $E \( P \, nu \) > 0$. If $E \( P \, nu \) = 0$, Fubini’s Theorem shows that, for almost every $w$ with $eta_nu \( w \) > 0$, the symbol vanishes for $rho$-almost every $x in P$. The corresponding transform then vanishes for every $r$, so all expanded terms involving this incidence have zero integral and may be omitted. Positive $E \( P \, nu \)$ supplies a point–angle witness where the symbol is nonzero and the stated support conditions hold. At each fixed $N$ only finitely many witnesses are chosen; no measurable selection or lower bound for their masses is needed.

Fix two caps, with centers $w_1^0 \, w_2^0$. Retain an edge precisely when all its cell–cap incidences are eligible and

#[#set math.equation(numbering: n => "(8.10)")
 $ \| "proj"_(\( w_j^0 \)^perp) d_j \| lt.eq tau quad \( j = 1 \, 2 \) \, #h(2em) \| w_1^0 dot.op d_1 + w_2^0 dot.op d_2 \| lt.eq tau . $ <graph:retained-tests>]

Eligibility and the edge decision concern an entire cell–cap term. They never cut its angular support by a nonsmooth pointwise condition.

#thm([Lemma 8.2.])[
  (Nonstationary localization).  #emph[Under (8.1), replacing the expanded independent energy by its sum over the retained edges changes it by $O \( R^(- T) \)$, for every fixed $T > 0$. This replacement is made in the integrated oscillatory form, before taking absolute values of the expanded cell terms.]
] <graph:localization>

#proof[
  Fix the four spatial points in one cell term. Fubini’s Theorem is applicable, since the spatial measures are finite and all amplitudes are bounded with compact radial support. Replacing centers by points, or replacing cap centers by angles in their cap supports, changes each test in (8.10) by at most
  #[#set math.equation(numbering: n => "(8.11)")
   $ E lt.tilde_d 2^(- p) + 2^(- a) delta lt.tilde_d 2^(- p) R^(10 sigma) = o \( tau \) . $ <graph:test-error>]
  The second inequality also holds when $delta = c_0$, since that case implies $c_0 lt.eq 2^(- h) R^(10 sigma)$. Fixed geometric constants are absorbed by the power gap between $R^(10 sigma)$ and $R^(30 sigma)$.
  Suppose first that the last inequality in (8.10) fails. Throughout this entire term,
  $ \| w_1 dot.op Delta_1 + w_2 dot.op Delta_2 \| gt.eq tau \/ 2 $
  for sufficiently large $N$. In the variable $u = r \/ 2^v$, each radial integration by parts gains a factor at most $C \( 2^v tau \)^(- 1)$. The symbols and angular partition do not depend on $u$, so only the fixed smooth radial cutoff is differentiated. Since
  #[#set math.equation(numbering: n => "(8.12)")
   $ 2^v tau = 2^q R^(30 sigma) gt.eq R^(40 sigma) \, $ <graph:oscillation-size>]
  repeating this operation gives arbitrary power decay.
  Otherwise, one of the two perpendicular inequalities fails. Suppose it is the first. Let $t$ be the unit tangent vector at $w_1^0$ in the direction of $"proj"_(\( w_1^0 \)^perp) d_1$, and extend it by the smooth sphere vector field
  $ V \( w \) = t - \( t dot.op w \) w . $
  All derivatives of this vector field are bounded independently of the cap. By (8.11),
  $ \| V \( w_1 \) dot.op Delta_1 \| gt.eq tau \/ 2 $
  throughout its support. Applied to the phase $Phi = r \( w_1 dot.op Delta_1 + w_2 dot.op Delta_2 \)$, the field therefore satisfies
  $ \| V Phi \| gt.tilde 2^v tau \, #h(2em) \| V^m Phi \| lt.tilde_m 2^v 2^(- a) quad \( m gt.eq 1 \) . $
  The same reasoning applies in the second variable if its perpendicular test fails.
  Here are the derivative bounds needed to iterate this integration by parts. By Definition 32, Lemma 30 and (8.6), the product amplitude has angular derivatives of order $m$ bounded by $C_m \( 1 + D_(*) + delta^(- 1) \)^m$, where
  $ D_(*) = R^sigma max \( 1 \, 2^L R^(- 50 sigma) \) . $
  Differentiating $\( V Phi \)^(- 1)$ contributes, in addition to its initial factor $\( 2^v tau \)^(- 1)$, at most powers of $1 + 2^(- a) \/ tau$. Indeed, every positive-order derivative of $V Phi$ is bounded by $C_m 2^v 2^(- a)$, whereas $\| V Phi \| gt.tilde 2^v tau$. The bounded divergence and derivatives of $V$ cause only constant factors. Thus $m$ integrations by parts give a bound by a constant $C_m$ times
  #[#set math.equation(numbering: n => "(8.13)")
   $ (frac(1 + D_(*) + delta^(- 1) + 2^(- a) \/ tau, 2^v tau))^m $ <graph:ibp-ratio>]
  for the angular–radial integral of the fixed spatial term. This follows directly by induction with the formal adjoint of $\( i V Phi \)^(- 1) V$; a smooth extension of the reciprocal on a slightly larger cap may be used, since its denominator has the same lower bound there.
  The three hypotheses in (8.1) imply
  $ D_(*) & lt.eq R^sigma + 2^q R^(- 47 sigma) \,\
delta^(- 1) & lt.eq c_0^(- 1) + 2^q R^(- 8 sigma) \,\
2^(- a) \/ tau & = 2^h R^(- 30 sigma) lt.eq 2^q R^(- 28 sigma) . $
  Consequently the numerator in (8.13) is at most $C 2^q R^(4 sigma)$, and the ratio is at most $C R^(- 26 sigma)$. There is therefore a fixed positive power gain per integration by parts. Taking sufficiently many derivatives gives $O \( R^(- T') \)$ for any prescribed $T'$.
  Finally, all sums and normalizations outside the fixed spatial term cost at most a fixed power of $R$. There are at most $R^(4 d)$ cell quadruples, at most $O \( R^(2 \( d - 1 \)) \)$ cap pairs, the profiles lie between $0$ and $d$, and the energy prefactors are at most $R^d$. Spatial integrations contribute at most the same kind of fixed power through their normalizations. Choose $T'$ larger than $T$ by these fixed powers before summing. The required derivative order depends on the fixed parameters and $T$, but is independent of $N$. No spatial derivative has been taken, so bounded measurable spatial multipliers are allowed. This proves the assertion. ◻
]

#thm([Lemma 8.3.])[
  (Both degrees of the retained graph).  #emph[For each fixed cap pair, both the row degrees and the column degrees of the retained graph are at most 
#[#set math.equation(numbering: n => "(8.14)")
 $ D_(upright("gr")) = R^(min_(j = 1 \, 2) k_j \( a \, p \) + O_d \( sigma \) + o \( 1 \)) . $ <graph:degree-bound>]

 This estimate does not require the two cap directions to be separated.]
] <graph:degrees>

#proof[
  Fix a row $\( P \, Q \)$. Its unknown column members $P'$ and $Q'$ have profiles $1$ and $2$, respectively. Consider the unknown of profile $j$. Its perpendicular constraint places its center within $tau$ of a line through its fixed mate in direction $w_j^0$. Group its eligible candidate cells by their depth-$g_j$ ancestor. Since the candidate cells lie in one depth-$a$ parent, the number of these groups is at most
  $ 2^(d \( g_j - a \)) lt.eq R^(2 d sigma) . $
  In one nonempty group choose an eligible cell $P_(*)$ and a point–angle witness $\( z_(*) \, w_(*) \)$ from its incidence. The support condition (8.2) gives its profile’s parallel test $\[ g_j \, p \]$ at $z_(*) in P_(*)$. This test is based at the center $c_(*)$ of the anchor cell $P_(*)$. In applications where a normalized derivative of a mask occurs, the same implication holds by Lemma 29.
  For every other candidate center $c$ in this group, the two perpendicular constraints and $\| w_(*) - w_j^0 \| lt.tilde delta$ give
  #[#set math.equation(numbering: n => "(8.15)")
   $ \| c - c_(*) \| lt.eq sqrt(d) thin 2^(- g_j) \, #h(2em) "dist" \( c \, c_(*) + bb(R) w_(*) \) lt.tilde_d 2 tau + 2^(- g_j) delta lt.tilde_d 2^(- p) R^(30 sigma) . $ <graph:witness-tube>]
  For large $N$, the latter is smaller than every test width $W_i \( p \) gt.eq 2^(- p) R^(500 sigma)$. The first inequality lies inside the testing ball $B \( c_(*) \, 10 \( d + 1 \) 2^(- g_j) \)$. The parallel test therefore bounds the number of candidates in this group by
  $ R^(k_j \( g_j \, p \) + C_d sigma) lt.eq R^(k_j \( a \, p \) + C_d sigma) . $
  The last inequality holds because $\[ g_j \, p \] subset.eq \[ a \, p \]$. Summing the groups bounds the number of possibilities for this first unknown by $R^(k_j \( a \, p \) + O_d \( sigma \))$.
  Fix such a first unknown. Its displacement, and hence its contribution to the scalar constraint in (8.10), is now fixed. That scalar constraint confines the longitudinal coordinate of the remaining unknown to an interval of length $O \( tau \)$ in its own cap direction. Its perpendicular constraint confines its other $d - 1$ coordinates to a ball of radius $O \( tau \)$. Together they confine its center to a ball of radius $O_d \( tau \)$, containing at most
  $ C_d \( 1 + 2^p tau \)^d lt.tilde_d R^(30 d sigma) $
  depth-$p$ grid centers. We may begin with either profile $j$. Taking the better of the resulting two counts proves the asserted row-degree bound.
  For a fixed column, the unknown row members again have one fixed mate each, and the signs of their displacements are reversed. Group either unknown by its own depth-$g_j$ ancestors and repeat (8.15). Once that member is fixed, the scalar and perpendicular constraints confine the other to the same $O \( tau \)$ ball. This gives the identical column-degree bound. The scalar constraint always fixes the remaining coordinate in that unknown’s own cap direction, so no division by an angle between $w_1^0$ and $w_2^0$ occurs. ◻
]

#proof[
  Apply Lemma 39. For fixed $r \, w_1 \, w_2$ in a cap pair, take absolute values only of the retained terms. In the row–column indexing above, the amplitudes are
  $ F_(P \, Q) = U_P \( r \, w_1 \) V_Q \( r \, w_2 \) \, #h(2em) G_(P' \, Q') = U_(P') \( r \, w_1 \) V_(Q') \( r \, w_2 \) . $
  The elementary inequality $2 \| F G \| lt.eq \| F \|^2 + \| G \|^2$, together with both degree bounds in Lemma 40, gives
  #[#set math.equation(numbering: n => "(8.16)")
   $ sum_(\( alpha \, beta \) upright(" edge")) \| F_alpha G_beta \| lt.eq D_(upright("gr")) / 2 (sum_alpha \| F_alpha \|^2 + sum_beta \| G_beta \|^2) . $ <graph:schur>]
  The sums on the right may be enlarged to all row and column labels. Sum the nonnegative partition weights over cap pairs. Their sums are one, so there is no factor equal to the number of caps. Integrate against the same nonnegative radial cutoff $Psi \( r \/ 2^v \) thin d r \/ 2^v$. Each row square gives the independent-angle energy of its child cell pair, and each column square does so as well. Thus (8.16) involves only child quantities $sans(H)^(P \, Q) \( p \, v \)$ formed from the restricted symbols.
  Let $I_j = I_j \( a \, p \)$. The occupied-cell estimate in Lemma 25 bounds the number of row labels, and also of column labels, by
  $ R^(I_1 + I_2 + O_d \( sigma \) + o \( 1 \)) . $
  The splitting factors in (8.7) appear squared, giving $R^(- 2 \( I_1 + I_2 \))$. Finally, the parent prefactor divided by the child prefactor is
  $ 2^(d \( v - a \)) / 2^(d \( v - p \)) = 2^(d \( p - a \)) . $
  Since $S = d \/ 2$ and $I_j = A_(j \, p) - A_(j \, a) + S \( p - a \) \/ N$, their product is
  $ R^(- 2 \( I_1 + I_2 \)) R^(I_1 + I_2) 2^(d \( p - a \)) & = R^(- \( I_1 + I_2 \) + d \( p - a \) \/ N)\
 & = R^(- sum_(j = 1)^2 \( A_(j \, p) - A_(j \, a) \)) . $
  Multiplying by (8.14) proves (8.4), including the arbitrary-power error from Lemma 39. The argument has only restricted symbols to smaller cells, so every child retains all its original mask factors and support conditions. ◻
]

#thm([Corollary 8.4.])[
  (The separated angular form).  #emph[Under the hypotheses of Proposition 38, suppose also that $X \, Y$ and their supported laws have the separated geometry used to define $sans(H)_F^(X \, Y) \( a \, v \)$ in Section 7. Then (8.4) holds with its left-hand side replaced by $sans(H)_F^(X \, Y) \( a \, v \)$ and with the same child energies. This includes the outer root $a = 0$ with separated actual supports inside possibly equal depth-zero cells $X \, Y$.]
] <graph:separated-form>

#proof[
  Equation (7.8) gives $sans(H)_F^(X \, Y) \( a \, v \) lt.eq sans(H)^(X \, Y) \( a \, v \)$ with the same endpoint symbols. Their tests and model-mass normalizations are therefore unchanged. Proposition 38 supplies exactly the child energies in (8.4). ◻
]

== 9 Single-profile state reductions <rec:section>

We now use the general angular estimates to bound positive counts of pairs with nearly equal distances. Fix one regularized probability $rho$, with profile $m$, and write $A_n \, M \( n \) \, I \( a \, b \) \, k \( a \, b \)$ for its profile data. Both endpoint laws in an angular state have this profile; their cells and bounded spatial multipliers may differ.

There are two kinds of recursive state. A positive state records a count of pairs with nearly equal distances and uses the tests scheduled by its current interval. An angular state uses the independent energy of Definition 34, together with a retained base interval that specifies which tests must still be present. We define these data before stating the reductions that preserve them.

=== 9.1 The two recursive states <the-two-recursive-states>

#prodef([Definition 9.1.])[
  (Positive distance state).  Let $0 lt.eq a lt.eq t lt.eq N$ be integer depths, let $i in { 0 \, dots.h \, J_0 }$, and let $X \, Y$ be a separated pair of occupied depth-$a$ cells of $rho$, in the geometry of Equation (7.1). Define the set of pairs satisfying the tests
  $ cal(P)_i^(X \, Y) \( a \, t \) = { \( x \, y \) in X times Y : e \( x \, y \) in G_(i \, frak(t)) \( x \) ∩ G_(i \, frak(t)) \( y \) upright(" for every ") frak(t) in cal(M) \( a \, t \) #scale(x: 120%, y: 120%)[}] \, $
  and let
  $ theta_i^(X \, Y) \( a \, t \) = upright(bold(1))_(cal(P)_i^(X \, Y) \( a \, t \)) \( rho \|_X ⊗ rho \|_Y \) . $
  This is an unnormalized pair restriction. Put $C_0 = 100 \( d + 1 \)$ and
  #[#set math.equation(numbering: n => "(9.1)")
   $ sans(D)_i^(X \, Y) \( a \, t \) = 2^(t - a) M \( a \)^(- 4) integral upright(bold(1))_({ \| D \( x \, y \) - D \( x' \, y' \) \| lt.eq C_0 2^(- t) }) thin d theta_i^(X \, Y) \( a \, t \) \( x \, y \) thin d theta_i^(X \, Y) \( a \, t \) \( x' \, y' \) . $ <osc:count>]
  A positive state consists of these depths, index and cells, with value $sans(D)_i^(X \, Y) \( a \, t \)$. Its current interval is $\[ a \, t \]$; it has no separate retained base. We suppress the cells in $sans(D)_i \( a \, t \)$ when they are fixed or are varied in a stated maximum.
] <osc:positive-count>

#prodef([Definition 9.2.])[
  (Recursive angular state).  Let $cal(B) = \[ a_0 \, t_0 \] subset.eq \[ 0 \, N \]$ be an integer interval, called the retained base, and let $\[ a \, v \]$ be the current interval, with
  #[#set math.equation(numbering: n => "(9.2)")
   $ 0 lt.eq a_0 lt.eq a lt.eq v lt.eq t_0 lt.eq N \, #h(2em) t_0 lt.eq v + sigma N . $ <osc:base-contract>]
  Write
  $ cal(M)_(> a) \( cal(B) \) = { frak(t) in cal(M) \( a_0 \, t_0 \) : upright("the anchor of ") frak(t) upright(" is deeper than ") a } . $
  A recursive angular state consists of these intervals, an index $i in { 0 \, dots.h \, J_0 - 1 }$, two occupied depth-$a$ cells $X \, Y$ of $rho$, and two admissible endpoint symbols. No separation of the cells is required. Each symbol’s descriptor list consists of exactly one occurrence of each descriptor in $cal(M)_(> a) \( cal(B) \)$, at the common index $i$. Lemma 31 gives a common fixed polynomial size bound for these lists throughout the recursive family. The state also specifies a fixed derivative budget and common numerical bounds for its smooth angular factors, as in Definition 32; these bounds are independent of $N$.
  The value of this state is the already defined general energy for those data:
  $ sans(H)_i^(cal(B)) \( a \, v \) := sans(H)^(X \, Y) \( a \, v \) . $
  The compact notation displays the current interval, base and index. The cells, symbols and fixed bounds remain part of the state data even when they are not displayed. We use a maximum only for finite choices of cells, and a supremum whenever admissible symbols vary. Neither operation varies the displayed base or index, or the fixed bounds, unless this is stated.
] <rec:angular-state>

A descriptor’s origin is not a further factor in a state. For each membership $frak(t) in cal(M)_(> a) \( cal(B) \)$, Lemma 31 supplies an originating interval inside this particular base. If the descriptor has anchor $p$ and length $L$, that origin contains $\[ p - L \, p + L \]$ and supplies the parallel descriptors $\[ g \, p \]$ for $p - L lt.eq g < p$. An origin can be chosen when it is used; it need not be the current interval, and a deduplicated descriptor need not have one origin valid for every list containing it.

The general graph estimate returns energies with the restricted old symbols, including reached factors. Suppose a one-profile graph child at depth $a'$ carries the list $cal(M)_(> a) \( cal(B) \)$ from a prior start $a lt.eq a'$. The removal operation after Equation (7.8) deletes its factors anchored at depths at most $a'$ at bounded cost, leaving exactly $cal(M)_(> a') \( cal(B) \)$. Once the interval inequalities in Equation (9.2) also hold, the resulting general energy is the value of a recursive angular state.

The identity responsible for the same normalization in every dimension is

#[#set math.equation(numbering: n => "(9.3)")
 $ 2^(d \( b - a \)) (frac(M \( b \), M \( a \)))^2 = 2^(d \( b - a \)) R^(- 2 I \( a \, b \)) = R^(- 2 \( A_b - A_a \)) . $ <rec:normalization>]

Here the last equality uses precisely $S = d \/ 2$.

=== 9.2 Positive collision estimates <positive-collision-estimates>

#thm([Lemma 9.3.])[
  (Binning positive measures).  #emph[Let $eta \, zeta$ be finite positive measures on the line and let $epsilon > 0$. Write 
$ B_epsilon \( eta \) = sum_(j in bb(Z)) eta \( \[ j epsilon \, \( j + 1 \) epsilon \) \)^2 . $

 For any fixed $C gt.eq 1$, 
#[#set math.equation(numbering: n => "(9.4)")
 $ B_epsilon \( eta \) & lt.eq \( eta ⊗ eta \) { \| s - s' \| lt.eq epsilon } \,\
sup_(u in bb(R)) \( eta ⊗ eta \) { \| s - s' - u \| lt.eq C epsilon } & lt.eq C' B_epsilon \( eta \) \,\
integral.double \( 1 + \| s - s' \| \/ epsilon \)^(- 2) thin d eta \( s \) d zeta \( s' \) & lt.eq C' B_epsilon \( eta \)^(1 \/ 2) B_epsilon \( zeta \)^(1 \/ 2) . $ <rec:bins-lower>]

 Moreover, 
#[#set math.equation(numbering: n => "(9.5)")
 $ \( eta ⊗ eta \) { \| s - s' \| lt.eq C epsilon } lt.eq C' epsilon integral_(\| r \| lt.eq epsilon^(- 1)) \| hat(eta) \( r \) \|^2 thin d r . $ <rec:collision-fourier>]

]
] <rec:binning>

#proof[
  Put $b_j = eta \( \[ j epsilon \, \( j + 1 \) epsilon \) \)$ and define $c_j$ using $zeta$. Cauchy–Schwarz gives, for every integer $h$,
  $ sum_j b_j b_(j + h) lt.eq sum_j b_j^2 \, #h(2em) sum_j b_j c_(j + h) lt.eq (sum_j b_j^2 sum_j c_j^2)^(1 \/ 2) . $
  An interval of fixed length $2 C epsilon$, with any center, permits only a bounded number of bin offsets. This proves (9.4)–(9.4). The kernel in (9.4) is bounded on the bin pair with offset $h$ by $C \( 1 + \| h \| \)^(- 2)$, whose sum is finite.
  For the last assertion, choose a fixed sufficiently small $b > 0$ and put $K \( t \) = \( sin \( b t \) \/ \( b t \) \)^2$, with its continuous value at zero. Then $K gt.eq c > 0$ on $\[ - C \, C \]$, and its nonnegative Fourier transform is bounded and supported in $\[ - 1 \, 1 \]$. Fourier inversion and Fubini, applied to $K \( \( s - s' \) \/ epsilon \)$, prove (9.5). These arguments require no density for either measure. ◻
]

=== 9.3 The reduction mechanism <the-reduction-mechanism>

A positive state uses the fixed policy choice $p$ of its current interval $\[ a \, t \]$. At a suffix choice, the projection test for the full conditional law permits a direct passage to the coarser distance count at depth $p$. At a prefix choice, a positive Fourier estimate splits the count into frequency shells. Low shells give shorter positive states; high shells use the weighted shell conversion and the graph estimate to enter an angular state.

For an angular state, let $L$ be the largest length in its remaining list, with $L = 0$ for an empty list, and put

#[#set math.equation(numbering: n => "(9.6)")
 $ L_0 = max { L \, ceil.l 10 sigma N ceil.r } \, #h(2em) h = v - 2 L_0 . $ <rec:angular-split-depth>]

This compares the longest remaining test with half the current frequency range. If $h lt.eq a$, an origin of a longest descriptor supplies a parallel test for a graph step. If $h > a$, splitting at depth $h$ leaves enough frequency range for stationary phase on the far terms; the near terms have only boundedly many neighboring cells. Thus an angular episode continues through direct or near steps and returns to a positive state through a far step.

The current interval is $\[ a \, t \]$ for $sans(D)_i \( a \, t \)$ and $\[ a \, v \]$ for $sans(H)_i^(cal(B)) \( a \, v \)$. Terminality refers to this interval: its width is at most $100 q_0$. It does not refer to the retained base.

#thm([Proposition 9.4.])[
  (State reductions).  #emph[Suppose the current state is nonterminal, its smoothing index satisfies $i < J_0$, and $N$ is sufficiently large with all parameters fixed. For every prescribed $T > 0$, it is bounded, apart from an error $O \( R^(- T) \)$ from oscillatory operations, by a sum of child bounds whose number is polynomial in $N$, and possibly a low-frequency stopping term. For every non-low child, if the old start is $a$ and the new start is $a'$, its multiplier is 
#[#set math.equation(numbering: n => "(9.7)")
 $ R^(- 2 \( A_(a') - A_a \) + upright("cost") + C_d sigma + o \( 1 \)) . $ <rec:transition-factor>]

 A low child has cost zero and the entire multiplier $R^(o \( 1 \))$, with no fixed $C_d sigma$ loss. A low-frequency stopping term is $R^(C_d sigma + o \( 1 \))$. The legal children are]
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[#emph[Reduction]
], table.cell(rowspan: 1, colspan: 1)[#emph[Parent and child]
], table.cell(rowspan: 1, colspan: 1)[#emph[Cost]
]),
  table.cell(rowspan: 1, colspan: 1)[#emph[Suffix]
], table.cell(rowspan: 1, colspan: 1)[#emph[$sans(D)_i \( a \, t \) arrow.r sans(D)_(i + 1) \( a \, p \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$A_p - min_(\[ p \, t \]) A$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[Low]
], table.cell(rowspan: 1, colspan: 1)[#emph[$sans(D)_i \( a \, t \) arrow.r sans(D)_(i + 1) \( a \, v \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$; full factor $R^(o \( 1 \))$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[High]
], table.cell(rowspan: 1, colspan: 1)[#emph[$sans(D)_i \( a \, t \) arrow.r sans(H)_i^(\[ a \, t \]) \( p \, v \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$k \( a \, p \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[Direct]
], table.cell(rowspan: 1, colspan: 1)[#emph[$sans(H)_i^(cal(B)) \( a \, v \) arrow.r sans(H)_i^(cal(B)) \( p \, v \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$k \( a \, p \)$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[Near]
], table.cell(rowspan: 1, colspan: 1)[#emph[$sans(H)_i^(cal(B)) \( a \, v \) arrow.r sans(H)_i^(cal(B)) \( h \, v \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$]
],
  table.cell(rowspan: 1, colspan: 1)[#emph[Far]
], table.cell(rowspan: 1, colspan: 1)[#emph[$sans(H)_i^(cal(B)) \( a \, v \) arrow.r sans(D)_(i + 1) \( b \, v \)$]
], table.cell(rowspan: 1, colspan: 1)[#emph[$0$]
],
)
]
  #emph[For a positive parent, $p$ is its current interval’s fixed policy choice. The suffix row is used when $2 p > a + t$. When $2 p lt.eq a + t$, the shell index is an integer $a < v lt.eq t$: the low row has $t - v gt.eq sigma N$, and the high row has $0 lt.eq t - v < sigma N$. A high child has base $\[ a \, t \]$ and carries the fixed enlarged derivative budget and common angular bounds produced by the inverse conversion; these depend on $T$ and the fixed parameters, not on $N$.]
  #emph[For an angular parent, use $L_0 \, h$ from Equation (9.6). If $h lt.eq a$, the direct row chooses a remaining descriptor of maximal length $L$, its anchor $p$, and an origin $\[ b_0 \, u_0 \] subset.eq cal(B)$ for that membership. This choice has $L = L_0$, $a < p < v$, 
$ b_0 lt.eq p - L \, #h(2em) p + L lt.eq u_0 \, #h(2em) v - a lt.eq 2 L \, $

 and it supplies the parallel descriptor $\[ max \( a \, p - L \) \, p \]$ used by the graph estimate. If $h > a$, the near row uses the displayed depth $h$. The far rows range over integer depths $b$ arising from the comparable far displacements, with $a < b lt.eq h + O_d \( 1 \) < v$, and use separated depth-$b$ cell pairs. Direct and near children keep the same base, index, derivative budget and common angular bounds. A far child has the fresh positive list $cal(M) \( b \, v \)$.]
  #emph[Finite maxima over child cells use the stated geometry. Whenever admissible symbols vary, take a supremum over the symbol family just specified. An empty collection of child terms contributes zero. Constants outside powers of $R$ may depend on the fixed parameters, derivative budgets and angular bounds. The constants $C_d$ in exponent losses depend only on $d$. A terminal state is bounded by 
#[#set math.equation(numbering: n => "(9.8)")
 $ R^(C_d \( kappa + sigma \) + o \( 1 \)) . $ <rec:terminal>]

]
] <rec:reductions>

#proof[
  We prove every reduction, including the support conditions needed for its iteration.
  ===== 9.3.1 Suffix. <suffix.>
  Let $theta = theta_i^(X \, Y) \( a \, t \)$. Retain a pair $\( P \, Q \)$ of depth-$p$ subcells of the separated parent cells whenever $cal(P)_i^(X \, Y) \( a \, t \) ∩ \( P times Q \) eq.not diameter$, and choose one pair in that intersection as a witness. Put $e_0 = e \( c_P \, c_Q \)$. Separation of the parent cells gives the uniform Hessian bound $parallel nabla^2 D parallel lt.tilde 2^a$, and hence
  #[#set math.equation(numbering: n => "(9.9)")
   $ D \( x \, y \) = e_0 dot.op \( x - y \) + O_d \( 2^(a - 2 p) \) = e_0 dot.op \( x - y \) + O_d \( 2^(- t) \) quad \( x in P \, med y in Q \) . $ <rec:suffix-taylor>]
  The last equality follows from the suffix inequality $2 p > a + t$. The witness angle differs from $e_0$ by $O_d \( 2^(a - p) \)$. For $y \, y' in Q$, changing between these two angles changes the projection of $y - y'$ by $O_d \( 2^(a - 2 p) \)$.
  The witness satisfies the projection test $\[ p \, t \]$. This test is formulated for the full conditional probability $rho \|_Q \/ rho \( Q \)$, not for a witness-dependent restriction. Its width absorbs every fixed multiple of $2^(- t)$. Thus the conditional projected measure in direction $e_0$ has self-collision mass at tolerance $C 2^(- t)$ bounded by
  #[#set math.equation(numbering: n => "(9.10)")
   $ B = 2^(- \( t - p \)) R^(A_p - min_(p lt.eq n lt.eq t) A_n + C_d sigma) . $ <rec:suffix-B>]
  By (9.4), the same bound, up to a fixed constant, holds uniformly for any translated collision window. Fixing $x \, x' in P$ and using (9.9) therefore gives
  $ B_(2^(- t)) #scale(x: 120%, y: 120%)[\(] D_(\#) \( rho \|_P ⊗ rho \|_Q \) #scale(x: 120%, y: 120%)[\)] lt.tilde B rho \( P \)^2 rho \( Q \)^2 . $
  Group the retained cell pairs by the bin of width $2^(- p)$ containing their center distance, and write $W_G = sum_(\( P \, Q \) in G) rho \( P \) rho \( Q \)$. The fine distance-bin vector of a group is a sum of positive vectors. The triangle inequality in $ell^2$ bounds its squared norm by $C B W_G^2$. Each group’s distances occupy a fixed enlargement of its coarse bin, and these enlargements have bounded overlap. Consequently the parent’s fine collision mass is at most $C B sum_G W_G^2$, by Lemma 44.
  Every full pair in a retained $P times Q$ satisfies the child list $cal(M) \( a \, p \)$ at level $i + 1$. Indeed its descriptors belong to the parent list, have anchors no deeper than $p$, and have nominal lengths at most $\( p - a \) \/ 2$. The spatial anchor cells of the full pair and witness agree. The change of direction is $O_d \( 2^(a - p) \)$, which lies inside the transfer neighborhood of Lemma 29 for every such descriptor. Two full pairs in one coarse group have distance difference at most $\( 1 + 4 sqrt(d) \) 2^(- p) < C_0 2^(- p)$. The Definition of the positive child count now gives
  $ sum_G W_G^2 lt.eq 2^(- \( p - a \)) M \( a \)^4 sans(D)_(i + 1) \( a \, p \) . $
  Multiplying by the parent normalization, and substituting (9.10), yields
  $ 2^(t - a) M \( a \)^(- 4) thin B thin 2^(- \( p - a \)) M \( a \)^4 = R^(A_p - min_(\[ p \, t \]) A + C_d sigma) . $
  This proves the suffix reduction with no change of start.
  ===== 9.3.2 Prefix: Fourier conversion and low shells. <prefix-fourier-conversion-and-low-shells.>
  Let $theta = theta_i^(X \, Y) \( a \, t \)$, and let $zeta$ be the positive distance pushforward of
  $ M \( a \)^(- 2) \( D \( x \, y \) 2^a \)^(- \( d - 1 \) \/ 2) product_(frak(t) in cal(M) \( a \, t \)) w_(i \, frak(t)) \( x \, e \( x \, y \) \) w_(i \, frak(t)) \( y \, e \( x \, y \) \) thin d rho \|_X \( x \) d rho \|_Y \( y \) . $
  On the good pairs defining $theta$, every mask is one. The remaining distance weight is bounded above and below by positive dimensional constants on the separated geometry. Thus positivity and (9.5) imply
  #[#set math.equation(numbering: n => "(9.11)")
   $ sans(D)_i \( a \, t \) lt.tilde 2^(- a) integral_(\| r \| lt.eq 2^t) \| hat(zeta) \( r \) \|^2 thin d r . $ <rec:prefix-lowpass>]
  Since $zeta \( bb(R) \) lt.eq R^(C_d sigma)$, frequencies below $2^a$ contribute $R^(C_d sigma)$, a stopping term. Reality allows us to treat only positive frequencies above $2^a$, split into shells $\[ 2^(v - 1) \, 2^v \]$, $a < v lt.eq t$.
  Suppose $t - v gt.eq sigma N$. A smooth majorant of the shell has inverse Fourier transform bounded in modulus by $C 2^v \( 1 + 2^v \| s - s' \| \)^(- 2)$. Its contribution to (9.11) is therefore at most
  $ C 2^(v - a) M \( a \)^(- 4) integral.double \( 1 + 2^v \| D \( x \, y \) - D \( x' \, y' \) \| \)^(- 2) thin d theta' \( x \, y \) d theta' \( x' \, y' \) \, $
  where $theta'$ is the unweighted pair restriction to the supports of the old masks. Every such pair satisfies $cal(M) \( a \, v \)$ at level $i + 1$, by list containment and mask support. Lemma 44 bounds the displayed expression by $C sans(D)_(i + 1) \( a \, v \)$. The normalization uses the same exact $M \( a \)$ on both sides; in particular, this step incurs no $R^(C_d sigma)$ mass-comparison loss. Summing shell indices costs only $R^(o \( 1 \))$.
  ===== 9.3.3 Prefix: high shells. <prefix-high-shells.>
  Now suppose $t - v < sigma N$. The largest nominal length in the list is at most $\( t - a \) \/ 2$. Nonterminality gives
  $ v - a > 100 q_0 - sigma N > 20 sigma N \, #h(2em) L lt.eq \( v - a \) \/ 2 + sigma N . $
  Thus Proposition 35 applies to $zeta$. For the prefix choice $p$, the descriptor $\[ a \, p \]$ is present, and
  $ p - a & lt.eq t - p lt.eq v - p + sigma N \,\
L & lt.eq \( t - a \) \/ 2 lt.eq t - p lt.eq v - p + sigma N \,\
v - p & gt.eq \( t - a \) \/ 2 - sigma N > 10 sigma N . $
  These verify the hypotheses of Corollary 41, with $g = a$. Its one-profile specialization first gives general independent energies on depth-$p$ cells, formed with the restricted converted symbols and still carrying every old mask. In those positive energies, remove the factors whose anchors are at most $p$. The remaining list at each endpoint is exactly $cal(M)_(> p) \( \[ a \, t \] \)$, and $a lt.eq p lt.eq v lt.eq t lt.eq v + sigma N$. The resulting values are therefore recursive states $sans(H)_i^(\[ a \, t \]) \( p \, v \)$, and the high contribution is bounded by
  $ R^(- 2 \( A_p - A_a \) + k \( a \, p \) + C_d sigma + o \( 1 \)) sup sans(H)_i^(\[ a \, t \]) \( p \, v \) + O \( R^(- T) \) . $
  Conversion produced normalized angular derivatives of masks at index $i$, with a fixed enlarged budget and common angular bounds. Their supports still impose the existing level-$i + 1$ tests, which are accepted by the graph estimate. Thus the new angular state keeps index $i$.
  ===== 9.3.4 Direct angular reduction. <direct-angular-reduction.>
  Consider $sans(H)_i^(cal(B)) \( a \, v \)$ with base $cal(B) = \[ a_0 \, t_0 \]$. Its remaining anchors are strictly deeper than $a$, and $t_0 lt.eq v + sigma N$. If $h lt.eq a$, nonterminality forces $L = L_0$, since otherwise $v - a lt.eq 2 ceil.l 10 sigma N ceil.r < 100 q_0$. Choose a maximal-length descriptor, with anchor $p > a$ and an origin $\[ b_0 \, u_0 \]$ in the base. Its origin satisfies
  $ b_0 lt.eq p - L \, #h(2em) p + L lt.eq u_0 lt.eq v + sigma N \, #h(2em) v - a lt.eq 2 L . $
  It follows that
  $ L lt.eq v - p + sigma N \, #h(2em) p - a lt.eq v - p + 2 sigma N \, #h(2em) v - p gt.eq \( v - a \) \/ 2 - sigma N > 10 sigma N . $
  Set $g = max \( a \, p - L \)$. Then
  $ a lt.eq g < p \, #h(2em) p - L lt.eq v + sigma N - 2 L lt.eq a + sigma N \, #h(2em) g lt.eq a + sigma N . $
  The same origin supplies the parallel descriptor $\[ g \, p \]$, whose anchor has not yet been reached. Proposition 38 therefore applies to the general energy underlying $sans(H)_i^(cal(B)) \( a \, v \)$, without any separation of its two cells, and gives the direct reduction and the cost $k \( a \, p \)$. The general graph child still carries the old symbols. Remove its reached factors only after forming its positive independent energy. The remaining list is exactly $cal(M)_(> p) \( cal(B) \)$, so this gives $sans(H)_i^(cal(B)) \( p \, v \)$ with the same fixed symbol bounds.
  ===== 9.3.5 Near angular reduction. <near-angular-reduction.>
  If $h > a$, split each transform into its depth-$h$ cell pieces, temporarily keeping #emph[all] remaining factors. Expand the two squares in Equation (7.6). A near term is one for which both center displacements, within the first and the second parent cell respectively, are at most $10 \( d + 1 \) 2^(- h)$. In the graph with row $\( P \, Q \)$ and column $\( P' \, Q' \)$, these conditions give bounded row and column degrees: a fixed grid cell has only a dimensional number of neighbors at this distance. Apply $2 \| u v \| lt.eq \| u \|^2 + \| v \|^2$ to each row–column product and integrate the resulting independent-angle squares. There are at most $R^(2 I \( a \, h \) + C_d sigma)$ rows or columns. The four transform splitting factors, the label count, and the ratio of energy prefactors give
  $ 2^(d \( h - a \)) R^(- 4 I \( a \, h \)) R^(2 I \( a \, h \) + C_d sigma) = R^(- 2 \( A_h - A_a \) + C_d sigma) \, $
  by (9.3). This is the zero-cost near estimate. Only after obtaining each positive independent energy do we remove factors anchored at depths at most $h$; on its spatial cells they are angular factors of bounded modulus. The remaining list is exactly $cal(M)_(> h) \( cal(B) \)$, giving the child $sans(H)_i^(cal(B)) \( h \, v \)$ with the same fixed symbol bounds. This removal does not apply to the far terms that follow.
  ===== 9.3.6 Far angular reduction: analytic estimate. <far-angular-reduction-analytic-estimate.>
  In a remaining term at least one point displacement has length $gt.tilde_d 2^(- h)$. Fix the four spatial points and denote the two displacements by $Delta_1 \, Delta_2$, with lengths $d_1 \, d_2$. Put $d_(+) = max \( d_1 \, d_2 \)$, $d_(-) = min \( d_1 \, d_2 \)$. For the larger displacement, on the radial support,
  $ Lambda = r d_(+) gt.tilde 2^(v - h) = 2^(2 L_0) \, #h(2em) D_(*)^2 / Lambda lt.tilde cases(delim: "{", R^(- 18 sigma) \, & 2^L R^(- 50 sigma) lt.eq 1 \,, R^(- 98 sigma) \, & 2^L R^(- 50 sigma) > 1 .) $
  Also $Lambda gt.eq R^(c sigma)$ and $D_(*) lt.eq R^2$ for sufficiently large $N$. Lemma 36 therefore expands the corresponding full-sphere integral to any prescribed negative power accuracy. After extracting the leading stationary gain, the coefficients and any fixed number of derivatives in $r \/ 2^v$ are bounded: the factor $\( r d_(+) \)^(- j)$ pays for the order-$2 j$ symbol derivatives.
  If $d_(+) > 2 d_(-)$, leave the other angular integral exact. The derivative in $r$ of each resulting phase has modulus at least $d_(+) - d_(-) > d_(+) \/ 2$, uniformly in the unexpanded angle. Repeated integration by parts in $r \/ 2^v$ gives $O \( R^(- T) \)$, including when $d_(-) = 0$. It is legitimate to leave that integral exact because its symbols are independent of $r$.
  Otherwise the lengths are comparable, and the second angular integral admits the same expansion. Choose an integer $n$ with $d_(+) in \( 2^(- n - 1) \, 2^(- n) \]$, and set $b = n + log_2 K_d$. Then both lengths lie between $K_d 2^(- b) \/ 4$ and $K_d 2^(- b)$. Moving to their depth-$b$ cell centers changes these bounds by at most $2 sqrt(d) thin 2^(- b)$; the choice of $K_d$ puts both pairs in the exact separated geometry of Definition 42. Since each displacement joins points in one depth-$a$ cell, $d_(+) lt.eq sqrt(d) thin 2^(- a)$, and hence $b > a$. The far lower bound gives $b lt.eq h + O_d \( 1 \) < v$.
  The two leading stationary gains multiply to $O_d \( 2^(- \( d - 1 \) \( v - b \)) \)$. Radial integration, using the coefficient derivative bounds just established, bounds each remaining kernel by
  #[#set math.equation(numbering: n => "(9.12)")
   $ C 2^(- \( d - 1 \) \( v - b \)) \( 1 + 2^v \| d_1 - d_2 \| \)^(- 2) . $ <rec:far-kernel>]
  For opposite stationary signs the phase involves $d_1 - d_2$; for equal signs it involves $d_1 + d_2$, whose modulus is no smaller. This proves (9.12) for every sign choice.
  ===== 9.3.7 Far angular reduction: support and normalization. <far-angular-reduction-support-and-normalization.>
  The interval $\[ b \, v \]$ is contained in the base, so $cal(M) \( b \, v \)$ is a sublist of its list. Every anchor of this child list is strictly deeper than $b > a$, and no such factor has been removed. In particular none was removed at depth $h$: the far expansion used the symbols before the removal made for the near child. Each coefficient differentiates the original masks only angularly, so it retains all of their supports. For example, the amplitude for the internal pair $\( x \, x' \)$ is $b_x \( w \) overline(b_(x') \( w \))$. Its stationary coefficient is evaluated at $w = plus.minus \( x - x' \) \/ \| x - x' \|$; a nonzero coefficient therefore imposes the level-$i + 1$ tests of $cal(M) \( b \, v \)$ at both spatial endpoints $x$ and $x'$. The same assertion holds for the other internal pair $\( y \, y' \)$. Antipodal symmetry of the tests handles the negative stationary direction. The expansion remainders are already arbitrary-power errors and require no support assertion.
  The far terms were obtained by splitting the transforms at depth $h$. Once their four cell transforms are opened, the four splitting factors cancel their model denominators exactly:
  $ (frac(M \( h \), M \( a \)))^4 M \( h \)^(- 4) = M \( a \)^(- 4) . $
  For each comparable length band defining $b$, the stationary estimate is now a nonnegative kernel bound with the child-support indicators. On this upper bound we may discard the indicator selecting the far $h$-cell labels, while keeping the comparable length band. Summing the disjoint $h$-cell partition reassembles the raw four-point measure on $X^2 times Y^2$, which we then partition into depth-$b$ cells. This explains why no count of $h$-cell labels remains, whether $b$ is smaller or larger than $h$.
  For a fixed quadruple of separated depth-$b$ cells $\( P \, P' \, Q \, Q' \)$, put
  $ eta_1 = D_(\#) theta_(i + 1)^(P \, P') \( b \, v \) \, #h(2em) eta_2 = D_(\#) theta_(i + 1)^(Q \, Q') \( b \, v \) . $
  These are the unnormalized positive distance measures for the two internal pairs, each restricted by the child tests at both endpoints. By Lemma 44 and the exact normalization of $sans(D)_(i + 1)$,
  $ integral.double \( 1 + 2^v \| s - s' \| \)^(- 2) thin d eta_1 \( s \) d eta_2 \( s' \) lt.tilde M \( b \)^4 2^(- \( v - b \)) max sans(D)_(i + 1) \( b \, v \) . $
  Indeed each bin-square sum is bounded by its unshifted positive collision count, and the geometric mean of the two counts is at most their maximum. Once the first cell of either internal pair is fixed, its partner has only a dimensional number of possible labels, since their center distance is $O_d \( K_d 2^(- b) \)$. There are thus at most $R^(2 I \( a \, b \) + C_d sigma)$ quadruple labels. The two stationary gains and the scalar collision normalization combine to $2^(- d \( v - b \))$, converting the parent frequency prefactor into $2^(d \( b - a \))$. The four depth-$b$ masses and the two free first-cell labels leave $R^(- 2 I \( a \, b \) + C_d sigma)$. Explicitly,
  $ & 2^(d \( v - a \)) M \( a \)^(- 4) 2^(- \( d - 1 \) \( v - b \)) M \( b \)^4 2^(- \( v - b \)) R^(2 I \( a \, b \) + C_d sigma)\
 & #h(20mm)  = 2^(d \( b - a \)) R^(- 2 I \( a \, b \) + C_d sigma) = R^(- 2 \( A_b - A_a \) + C_d sigma) . $
  Summing the possible scales $b$, coefficient terms, and shell indices introduces only $R^(o \( 1 \))$. This proves the zero-cost far reduction, with one increase of the smoothing index.
  ===== 9.3.8 Stopping. <stopping.>
  For a terminal interval, its width is at most $100 q_0$. The Definitions of the two state values, bounded symbol moduli, and the occupied-cell bounds give respectively
  $ sans(H)_i^(cal(B)) \( a \, v \) lt.tilde 2^(d \( v - a \)) R^(C_d sigma) \, #h(2em) sans(D)_i \( a \, t \) lt.tilde 2^(t - a) R^(C_d sigma) . $
  Since $q_0 \/ N = kappa + O \( 1 \/ N \)$, both satisfy (9.8). The low-frequency stopping term was already estimated after (9.11). This completes the proof. ◻
]

== 10 The two-depth potential <ledger:section>

The reductions of Proposition 45 have three transitions with potentially positive cost. For a suffix step $\[ a \, t \] arrow.r \[ a \, p \]$, if a depth to the left of the policy’s inner interval minimizes $A$ on both intervals, the minimum does not increase and cannot pay a positive cost $A_p - min_(\[ p \, t \]) A$. We instead use a pair of well-separated depths. In a suffix child, separation places the later depth in the inner interval, so it can be replaced by a minimizer on $\[ p \, t \]$ while the earlier depth remains. A high prefix or direct reduction can replace the earlier depth.

#prodef([Definition 10.1.])[
  (Two-depth potential).  For an integer interval $J = \[ a \, t \]$ of width at least $10 q_0$, put
  #[#set math.equation(numbering: n => "(10.1)")
   $ cal(V) \( J \) = min_(a lt.eq i < j lt.eq t\
j - i gt.eq 10 q_0) \( A_i + A_j \) . $ <ledger:potential-formula>]
  We leave $cal(V) \( J \)$ undefined for shorter intervals.
] <ledger:potential>

The potential is attached to the current interval: $\[ a \, t \]$ for $sans(D)_i \( a \, t \)$ and $\[ a \, v \]$ for $sans(H)_i^(cal(B)) \( a \, v \)$. The retained base $cal(B)$ supplies the angular state’s descriptor list, from which the reached anchors have been removed; the origin of a chosen descriptor supplies the inner interval on which its anchor minimizes $A$. Neither replaces the current interval in the payment inequality.

#thm([Lemma 10.2.])[
  (Payment of the costs).  #emph[If a reduction of Proposition 45 has a potentially positive cost and parent interval $J$ and child interval $J'$, then $cal(V) \( J' \)$ is defined and 
#[#set math.equation(numbering: n => "(10.2)")
 $ upright("cost") lt.eq cal(V) \( J' \) - cal(V) \( J \) . $ <ledger:payment-inequality>]

 For every zero-cost reduction whose child potential is defined, the same inequality holds.]
] <ledger:payment>

#proof[
  Containment of the admissible pairs immediately gives $cal(V) \( J \) lt.eq cal(V) \( J' \)$ when $J' subset J$ and both potentials are defined. This proves all zero-cost cases. We check the other cases by replacing one depth in an arbitrary admissible child pair, then apply the result to a minimizing child pair. Only the inner-interval minimizing property of the policy is needed; no monotonicity of $A$ is assumed.
  ===== 10.1 Suffix. <suffix.-1>
  Here $J = \[ a \, t \]$, $J' = \[ a \, p \]$, and $upright("cost") = A_p - min_(\[ p \, t \]) A$. Since $2 p > a + t$, the child width is more than half the nonterminal parent width, and hence greater than $10 q_0$. Let $\( i \, j \)$ be admissible in $\[ a \, p \]$. Then $j gt.eq a + 10 q_0$, while the left endpoint of the origin’s inner interval is at most $a + 2 q_0$. Since $j lt.eq p$, the index $j$ belongs to that inner interval, so $A_j gt.eq A_p$. Choose $r in \[ p \, t \]$ attaining $min_(\[ p \, t \]) A$. The pair $\( i \, r \)$ is admissible in the parent because $r gt.eq j$, and
  $ A_i + A_r lt.eq A_i + A_j - (A_p - min_(\[ p \, t \]) A) . $
  This gives (10.2).
  ===== 10.2 High prefix. <high-prefix.>
  Here $J = \[ a \, t \]$, $J' = \[ p \, v \]$, $t - v < sigma N$, and the cost is $k \( a \, p \)$. The prefix inequality gives
  $ v - p gt.eq \( t - a \) \/ 2 - sigma N > 10 q_0 . $
  For an admissible child pair $\( i \, j \)$, $p lt.eq i lt.eq v - 10 q_0 lt.eq t - 10 q_0$. Thus $i$ is in the origin’s inner interval and $A_i gt.eq A_p$. Choose $r in \[ a \, p \]$ attaining $min_(\[ a \, p \]) A$. The pair $\( r \, j \)$ stays in $\[ a \, t \]$ and remains admissible, because $r lt.eq i$. Its sum is at most $A_i + A_j - k \( a \, p \)$, as required.
  ===== 10.3 Direct graph reduction. <direct-graph-reduction.>
  Now $J = \[ a \, v \]$, $J' = \[ p \, v \]$. Let $L$ be the maximal remaining descriptor length chosen by the reduction, and let $\[ b_0 \, u_0 \]$ be its origin. We have
  #[#set math.equation(numbering: n => "(10.3)")
   $ b_0 lt.eq p - L \, #h(2em) p + L lt.eq u_0 \, #h(2em) v lt.eq a + 2 L . $ <ledger:origin-geometry>]
  The reduction gives $v - p gt.eq \( v - a \) \/ 2 - sigma N$. Nonterminality and $sigma lt.double kappa$ make this greater than $10 q_0$. If $k \( a \, p \) = 0$, containment suffices. Otherwise choose $i_0 in \[ a \, p \]$ with
  $ A_(i_0) = min_(\[ a \, p \]) A = A_p - k \( a \, p \) < A_p . $
  The origin’s policy makes $A_p$ no larger than every value in its inner interval. Since $i_0 lt.eq p$, the index $i_0$ must lie strictly to the left of that inner interval, whether or not it lies in the origin itself. Consequently
  $ a lt.eq i_0 < b_0 + 2 q_0 \, #h(2em) v lt.eq a + 2 L < b_0 + 2 q_0 + 2 L lt.eq u_0 + 2 q_0 . $
  For any admissible child pair $\( i \, j \)$,
  $ p lt.eq i lt.eq v - 10 q_0 < u_0 - 8 q_0 . $
  The origin’s inner interval begins no later than $p$ and ends no earlier than $u_0 - 2 q_0$. Therefore $i$ lies in it, and $A_i gt.eq A_p$. Replacing $i$ by $i_0$ gives a pair $\( i_0 \, j \)$ in the #emph[actual parent] $\[ a \, v \]$, not merely in the origin. It remains admissible because $i_0 lt.eq p lt.eq i$, and its sum decreases by at least $k \( a \, p \)$. This proves the direct case. ◻
]

#figure(
  [#image("fig/potential-replacement.pdf.png", width: 100%)],
  caption: [Figure 2: Payment for a suffix transition in Lemma 47. Replacing the later depth of a minimizing child pair by the inner-interval minimizer $p$ preserves separation and cannot increase the sum. Thus a minimizing child pair can be chosen as $\( i \, p \)$. If $r$ minimizes $A$ on $\[ p \, t \]$, the pair $\( i \, r \)$ is admissible in the parent. Its sum is lower by $A_p - A_r$, which pays the transition cost. A positive drop places $r$ beyond the inner interval. The depth axis is schematic, with the boundary strips enlarged. ],
) <fig:potential-replacement>

#thm([Lemma 10.3.])[
  (Finite policy and smoothing budget).  #emph[Every branch of the state reductions has at most $20 \/ kappa$ non-low transitions and at most $1 \/ sigma$ low transitions, for sufficiently small fixed parameters and sufficiently large $N$. Along such a branch the smoothing index increases by at most $20 \/ kappa + 1 \/ sigma$. If the initial index is zero, every index required by the iteration, including the next support level used by a mask, is less than 
$ J_0 = ⌈100 \( 1 \/ kappa + 1 \/ sigma \) + 100⌉ . $

]
] <ledger:termination>

#proof[
  Along a branch the start depth never decreases and the end depth never increases. Let $K$ be the number of fixed block representatives; for large $N$, $K lt.eq 1 \/ kappa + 2$. Every high or direct step strictly advances the start to a representative. Such a representative can never be passed twice, so together these steps number at most $K$. Each suffix step lowers the end by at least $q_0$, and therefore there are at most $N \/ q_0 lt.eq 1 \/ kappa$ suffix steps. Low steps lower the end by at least $sigma N$, so there are at most $1 \/ sigma$.
  An angular episode starts at the root or immediately after a high step and ends at a far step or a stopping term. Direct and near steps remain in that episode. There are at most $K + 1$ episodes, and hence at most $K + 1$ far steps.
  Consider a near step whose child is nonterminal. That child has width $2 L_0 > 100 q_0$, so the floor in the formula for $L_0$ is inactive and $L = L_0$. Remove the factors whose anchors have now been reached. If the maximum remaining nominal length decreases, at least one formerly maximal anchor has just been passed; charge the near step to one such anchor. These charges are distinct along the branch. If the maximum stays equal to $L$, recomputing $v - 2 L$ at the child gives exactly its start depth, so the very next step is direct. Charge this near step to that next direct step. Finally there is at most one near step with terminal child. Thus near steps number at most $2 K + 1$. The combined non-low count is at most $5 K + 2$, which is less than $20 \/ kappa$ for sufficiently small $kappa$.
  Only suffix, low, and far steps increase the smoothing index; each increases it by one. If $i_(upright("in"))$ is the initial index, the preceding counts therefore give
  $ i lt.eq i_(upright("in")) + 20 \/ kappa + 1 \/ sigma $
  at every state on the branch. High, direct, and near steps use the level-$i + 1$ supports of their index-$i$ symbols without increasing the index. For $i_(upright("in")) = 0$, even this additional support level remains below $J_0$, since $20 \/ kappa + 1 \/ sigma + 1 < J_0$. Thus every mask and support level required for the iteration from index zero is available. ◻
]

#thm([Theorem 10.4.])[
  (Single-profile angular bound).  #emph[Let $sans(H)_0^(\[ c \, N \]) \( c \, N \)$ be a recursive angular state of nonterminal width, as in Definition 43. Fix its initial derivative budget $B$ and its common numerical angular bounds $Q_j$, independently of $N$, as in Definition 32. Then 
#[#set math.equation(numbering: n => "(10.4)")
 $ sans(H)_0^(\[ c \, N \]) \( c \, N \) lt.eq R^(2 A_c - cal(V) \( \[ c \, N \] \) + C_d \( kappa + sigma \/ kappa \) + o \( 1 \)) . $ <ledger:bound-equation>]

 This bound holds uniformly over its two occupied cells, including two copies of the same cell, and over its admissible bounded spatial multipliers and symbols with these fixed bounds. The $o \( 1 \)$ term may depend on $B$ and the $Q_j$.]
] <ledger:bound>

#proof[
  Iterate Proposition 45, stopping at every terminal state or low-frequency stopping term. Lemma 48 gives a depth bound depending only on the fixed parameters. Since the root index is zero, it also ensures that every index required to continue a nonterminal child is available. Each transition has at most polynomially many discrete choices in $N$, and all coefficient sums in the oscillatory estimates are bounded or subpower. Thus the total main term is bounded by $R^(o \( 1 \))$ times the largest terminal branch bound. Suprema over symbol classes are already part of the transition bounds and require no count of the members of those classes.
  Fix a branch, and let $a_f$ be its final start. The changes of start in (9.7) telescope exactly to $2 A_c - 2 A_(a_f)$. By Lemma 47, all costs are bounded by increases in the potential while it is defined. If a child has width less than $10 q_0$, it is already terminal; moreover, the step reaching it has zero cost, since every potentially positive-cost child has width greater than $10 q_0$. Let $J_(*) = \[ u \, w \]$ be the last interval on the branch with defined potential. Then
  #[#set math.equation(numbering: n => "(10.5)")
   $ sum upright("cost") lt.eq cal(V) \( J_(*) \) - cal(V) \( \[ c \, N \] \) . $ <ledger:cost-sum>]
  This also applies when a low-frequency term stops at a nonterminal interval.
  We estimate $cal(V) \( J_(*) \)$ directly; no potential is assigned to a shorter final interval. Nesting gives $a_f in \[ u \, w \]$, and $w - u gt.eq 10 q_0$. Set
  $ i = max { u \, min { a_f \, w - 10 q_0 } } \, #h(2em) j = i + 10 q_0 . $
  Both indices lie in $J_(*)$, they are separated by $10 q_0$, and each is within $10 q_0$ of $a_f$. The profile Lipschitz bound therefore gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ cal(V) \( J_(*) \) lt.eq A_i + A_j lt.eq 2 A_(a_f) + 20 d thin q_0 \/ N = 2 A_(a_f) + O_d \( kappa \) + o \( 1 \) . $ <ledger:last-potential>]
  Combining (10.5)–(10.6) with the telescoping start factors leaves $2 A_c - cal(V) \( \[ c \, N \] \) + O_d \( kappa \) + o \( 1 \)$. The stopping bound contributes $O_d \( kappa + sigma \)$. Only non-low transitions incur $C_d sigma$ slack, so their combined loss is $O_d \( sigma \/ kappa \)$, by Lemma 48. Low transitions contribute only subpower factors. This proves the main-term estimate in (10.4).
  For completeness, we fix the error and derivative budgets before taking $N$ large. Since $m$ is nondecreasing and $d$-Lipschitz with $m \( 0 \) = 0$, all differences of $A$ and all costs in the reductions are bounded in absolute value by a dimensional constant. Each ancestor main factor is consequently at most $R^(C_d + o \( 1 \))$. Choose a target accuracy
  $ T > C_d \( 1 \/ kappa + 1 \/ sigma \) + 10 d + 10 \, $
  with the dimensional constant large enough for the branch bound. Demand this accuracy after all single-step normalizations and sums. Lemma 48 then ensures that every propagated additive error is negligible relative to the right side of (10.4).
  There is no recursive increase of the persistent angular derivative budget. Each passage from a positive distance count to an angular state begins with fresh undifferentiated masks; choose its inverse stationary expansion order first, large enough for the prescribed $T$. The resulting finite order, together with the initial order in the Theorem, bounds all derivatives carried by angular states. The common bounds for the smooth angular factors can likewise be fixed from the initial $Q_j$ and the bounds in Proposition 35 at the fixed accuracy used for these conversions. The graph estimate returns the original symbols restricted to child cells, with no additional derivatives. Removing reached factors from its positive child energy, as in a near transition, adds no derivatives to the remaining symbols. A far step may use an arbitrarily long direct stationary expansion, but its child is a positive distance count and carries none of those derivatives. Choose the nonstationary integration orders and the direct stationary orders after this persistent budget has been fixed. They may depend on $d \, kappa \, sigma \, T$ and the initial budget, but not on $N$. Their large constants and polynomial descriptor counts are absorbed in the permitted constant and $o \( 1 \)$ terms; the dimensional exponent losses in the preceding algebra are unchanged. The asserted bound follows. ◻
]

== 11 Entry, shell summation, and the limiting distance measure <asm:section>

The graph estimate and the two-depth potential now give decay on each frequency shell. The measures used on different shells have different classes and masks. We first explain how to restore their mass, and then give a scalar reconstruction argument that accommodates the decreasing pair filters. Throughout this Section all distances are measured in the original space $bb(R)^d$.

=== 11.1 The entry depth <the-entry-depth>

Let $S = d \/ 2$. Fix the starting probabilities $mu_1 \, mu_2$ and the number $chi > 0$ supplied by Proposition 23. Make one common similarity placing $E$ in $\( 1 \/ 4 \, 3 \/ 4 \)^d$, and retain the notation for the transformed sets and measures. This multiplies every distance by one fixed positive constant and preserves the desired positive-measure conclusion. Choose one small common translation of the dyadic grid whose boundaries have zero mass for both starting laws. Its depth-zero cube $Q_0$ still contains $E$ in its interior. Use this same grid for both class decompositions. The two actual supports remain separated by a fixed positive distance, and their cross directions remain in the prepared patch. At scale $R = 2^N$, apply Lemma 4 with parameter $sigma$ to both probabilities. Write $cal(C)_(j \, N)$ for the retained classes on side $j$. For $C in cal(C)_(j \, N)$, let

$ a_(j \, C) = mu_j \( C \) \, #h(2em) rho_(j \, C) = a_(j \, C)^(- 1) mu_j \|_C . $

The classes on each side are disjoint, their number is $R^(o \( 1 \))$, and their discarded original mass is at most $R^(- sigma + o \( 1 \))$. All the $o \( 1 \)$ terms below are uniform over these classes, with the fixed parameters held constant. Every normalized class is supported in the same root cube $Q_0$ and assigns it mass one. Since every profile has $m_j \( 0 \) = 0$, its root normalization is exactly $M_j \( 0 \) = R^(- m_j \( 0 \)) = 1$.

For a pair of classes, suppress their labels and write

$ A_(j \, n) = m_j \( n \/ N \) - S n \/ N \, #h(2em) k_j \( g \, p \) = A_(j \, p) - min_(g lt.eq n lt.eq p) A_(j \, n) . $

Recall from Lemma 25 that

#[#set math.equation(numbering: n => "(11.1)")
 $ A_(j \, 0) = 0 \, #h(2em) \| A_(j \, n) - A_(j \, n') \| lt.eq d \| n - n' \| \/ N \, #h(2em) A_(j \, n) gt.eq chi n \/ N - C_d sigma . $ <asm:profile-input>]

Here and in what follows, constants denoted by $C_d$ may be enlarged a finite number of times and depend only on $d$.

We seek a common depth $c$ for which one entry cost $k_j \( 0 \, c \)$ is small and both excess profiles remain above a positive level on $\[ c \, N \]$. The graph estimate contributes the smaller cost. After Cauchy–Schwarz separates the profiles, the two single-profile estimates must supply a larger potential saving.

#thm([Lemma 11.1.])[
  (Entry depth).  #emph[Fix $0 < beta < min \( chi \/ 10 \, 1 \/ 10 \)$. If $sigma$ is sufficiently small in terms of $d \, chi \, beta$, then, for all sufficiently large $N$, the integer 
#[#set math.equation(numbering: n => "(11.2)")
 $ c = max { n in { 0 \, dots.h \, N } : min \( A_(1 \, n) \, A_(2 \, n) \) lt.eq beta } $ <asm:entry-definition>]

 is defined and satisfies 
#[#set math.equation(numbering: n => "(11.3)")
 $ & ⌊frac(beta N, 2 d)⌋ lt.eq c < N \/ 4 \,\
 & A_(j \, n) gt.eq beta - d \/ N quad \( j = 1 \, 2 \, med c lt.eq n lt.eq N \) \,\
 & min_(j = 1 \, 2) k_j \( 0 \, c \) lt.eq beta + C_d sigma . $ <asm:entry-range>]

 If $kappa$ is sufficiently small and $q_0 = ceil.l kappa N ceil.r$, the interval $\[ c \, N \]$ is nonterminal. Its potentials from Definition 46 obey 
#[#set math.equation(numbering: n => "(11.4)")
 $ cal(V)_j \( \[ c \, N \] \) := min_(c lt.eq u < v lt.eq N\
v - u gt.eq 10 q_0) \( A_(j \, u) + A_(j \, v) \) gt.eq 2 beta - 2 d \/ N . $ <asm:entry-potential>]

]
] <asm:entry>

#proof[
  The index $0$ qualifies in Equation (11.2). For $n lt.eq beta N \/ \( 2 d \)$, the Lipschitz bound in Equation (11.1) gives $A_(j \, n) lt.eq beta \/ 2$, proving the lower bound in Equation (11.3). For $n gt.eq N \/ 4$, the lower profile bound gives $A_(j \, n) gt.eq chi \/ 4 - C_d sigma > beta$ when $sigma$ is sufficiently small. This proves its upper bound.
  By maximality of $c$, both $A_(j \, c + 1)$ exceed $beta$, so $A_(j \, c) > beta - d \/ N$. Both profiles exceed $beta$ at every later index. For at least one side $j_(*)$, we also have $A_(j_(*) \, c) lt.eq beta$. Since $min_(0 lt.eq n lt.eq c) A_(j_(*) \, n) gt.eq - C_d sigma$, this gives Equation (11.3). The width of $\[ c \, N \]$ exceeds $3 N \/ 4$; thus it exceeds $100 q_0$ for sufficiently small fixed $kappa$ and large $N$. Every pair entering its potential consists of two indices covered by Equation (11.3), which proves Equation (11.4). ◻
]

=== 11.2 Positive approximants and restoration of mass <positive-approximants-and-restoration-of-mass>

Write

$ D \( x \, y \) = \| x - y \| \, #h(2em) e \( x \, y \) = frac(x - y, \| x - y \|) \, #h(2em) W \( x \, y \) = D \( x \, y \)^(- \( d - 1 \) \/ 2) . $

The fixed separated supports give constants $0 < d_0 < d_1 < oo$ with

#[#set math.equation(numbering: n => "(11.5)")
 $ d_0 lt.eq D \( x \, y \) lt.eq d_1 quad upright("on ") "supp" mu_1 times "supp" mu_2 . $ <asm:distance-range>]

In particular $W$ is bounded above and below there by positive constants.

For each pair of classes $\( C_1 \, C_2 \)$, use its own entry index $c$ from Equation (11.2). At endpoint $j$ take the extra parallel descriptor $\[ 0 \, c \]$, together with every descriptor in $cal(M)_j \( c \, N \)$. Let

#[#set math.equation(numbering: n => "(11.6)")
 $ b_(j \; C_1 \, C_2) \( z \, w \) = w_(0 \, \[ 0 \, c \])^(\( j \)) \( z \, w \) product_(frak(t) in cal(M)_j \( c \, N \)) w_(0 \, frak(t))^(\( j \)) \( z \, w \) . $ <asm:endpoint-mask>]

The masks are those of Lemma 29; thus every factor lies in $\[ 0 \, 1 \]$ and equals one when its level-zero condition holds. Antipodal symmetry allows both endpoints to be evaluated at $e \( x \, y \)$. Define the Borel function $Theta_N$ on the fixed separated product $E_1 times E_2$ by

$ Theta_N \( x \, y \) = b_(1 \; C_1 \, C_2) \( x \, e \( x \, y \) \) b_(2 \; C_1 \, C_2) \( y \, e \( x \, y \) \) quad upright("if ") \( x \, y \) in C_1 times C_2 \, $

and set it equal to zero whenever either endpoint belongs to no retained class. In particular $0 lt.eq Theta_N lt.eq 1$.

Let $Gamma_N$ be the decreasing pair filters of Proposition 23. With $D_(\#)$ denoting pushforward under the scalar map $D$, define

#[#set math.equation(numbering: n => "(11.7)")
 $ alpha_N = D_(\#) #scale(x: 120%, y: 120%)[\(] W upright(bold(1))_(Gamma_N) \( mu_1 ⊗ mu_2 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) tau_N = D_(\#) #scale(x: 120%, y: 120%)[\(] W upright(bold(1))_(Gamma_N) Theta_N \( mu_1 ⊗ mu_2 \) #scale(x: 120%, y: 120%)[\)] . $ <asm:measures>]

These measures use the original class masses. Only $tau_N$ depends on the shell’s class decomposition and angular masks.

#thm([Lemma 11.2.])[
  (Restoration of mass).  #emph[There is $eta > 0$, depending on the fixed parameters and starting measures, such that 
#[#set math.equation(numbering: n => "(11.8)")
 $ 0 lt.eq tau_N lt.eq alpha_N \, #h(2em) parallel alpha_N - tau_N parallel_(upright("TV")) lt.tilde 2^(- eta N) . $ <asm:tv-approximation>]

 Moreover $alpha_N$ decreases to the nonzero finite positive measure 
#[#set math.equation(numbering: n => "(11.9)")
 $ alpha_oo = D_(\#) #scale(x: 120%, y: 120%)[\(] W upright(bold(1))_(Gamma_oo) \( mu_1 ⊗ mu_2 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) Gamma_oo = ⋂_N Gamma_N . $ <asm:limit-measure>]

 All these measures are carried by the compact set of original distances $Delta \( E \)$.]
] <asm:retained-measures>

#proof[
  Apply the cap preparation in Proposition 23 with loss $R^sigma$. It gives $cal(G)_N subset Gamma_N$ such that
  $ \( mu_1 ⊗ mu_2 \) \( Gamma_N \\ cal(G)_N \) lt.tilde R^(- c_(*)) quad upright("for some ") c_(*) > 0 . $
  For $mu_1$-almost every first endpoint $x$, the angular subprobability
  $ xi_(N \, x) = e \( x \, dot.op \)_(*) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(cal(G)_N) \( x \, dot.op \) mu_2 #scale(x: 120%, y: 120%)[\)] $
  has the required $S$-cap bound with loss $R^sigma$ down to scale $R^(- 1)$. The change from $pi_x \( y \)$ to $e \( x \, y \) = - pi_x \( y \)$ preserves cap bounds, since the antipodal map sends caps to caps. The analogous assertion holds for $mu_2$-almost every second endpoint with the endpoints reversed. These are bounds for restrictions of the original opposite probability.
  Fix $C_1 \, C_2$ and one descriptor $frak(t)$ used at the first endpoint. For $mu_1$-almost every $x in C_1$, the anchor cell determined by $frak(t)$ and $x$ is occupied and $xi_(N \, x)$ has the cap bound above. Let $F_(C_1 \, C_2 \, frak(t) \, x)$ be the directions failing this level-zero test. For such $x$, Lemma 28 applies directly to $xi_(N \, x)$ and gives
  #[#set math.equation(numbering: n => "(11.10)")
   $ mu_2 { y in C_2 : \( x \, y \) in cal(G)_N \, med e \( x \, y \) in F_(C_1 \, C_2 \, frak(t) \, x) } lt.eq R^(- sigma) . $ <asm:original-fiber-estimate>]
  Restricting the set of $y$ to $C_2$ only decreases the left side; no normalization by $mu_2 \( C_2 \)$ occurs. Integrating in $x$ over $C_1$ costs at most $a_(1 \, C_1) R^(- sigma)$. Sum first over $C_1$, whose original masses have sum at most one, and then over $C_2$ and the descriptors. The latter two counts are $R^(o \( 1 \))$, by Lemma 4 and Lemma 31. Thus the first-endpoint failure mass is $R^(- sigma + o \( 1 \))$. The same argument in the other orientation gives this bound for second-endpoint failures. There is no sum over anchor cells: a point and descriptor already specify one.
  The product in Equation (11.6) equals one if all its level-zero tests hold. Hence $1 - Theta_N$ on retained class pairs is bounded by the indicator of the union of these failures. Including the original mass outside retained class pairs and $Gamma_N \\ cal(G)_N$ gives
  $ integral_(Gamma_N) \( 1 - Theta_N \) thin d \( mu_1 ⊗ mu_2 \) lt.tilde R^(- c_(*)) + R^(- sigma + o \( 1 \)) . $
  The bounded weight $W$ proves Equation (11.8), for example with any fixed $0 < eta < min \( c_(*) \, sigma \) \/ 2$ and sufficiently large $N$. The set $cal(G)_N$ was used only in this estimate: it is not a multiplier in Equation (11.7).
  The filters $Gamma_N$ decrease and have positive limiting product mass. Continuity of a finite measure along decreasing sets proves Equation (11.9) and monotonicity of $alpha_N$. The positive lower bound for $W$ shows $alpha_oo \( bb(R) \) > 0$. Finally, the two original supports are compact subsets of $E$, and $D$ is continuous. Every pushforward above is therefore carried by their compact distance image, which is contained in $Delta \( E \)$. ◻
]

=== 11.3 The shell estimate <the-shell-estimate>

#thm([Proposition 11.3.])[
  (Decay of the approximating distance measures).  #emph[The fixed parameters can be chosen, in the order $beta \, kappa \, sigma \, omega$, so that some $gamma > 0$ satisfies 
#[#set math.equation(numbering: n => "(11.11)")
 $ integral_(2^(N - 1) lt.eq \| r \| lt.eq 2^(N + 1)) \| hat(tau_N) \( r \) \|^2 thin d r lt.tilde 2^(- gamma N) $ <asm:shell-bound>]

 for all sufficiently large $N$.]
] <asm:shell-decay>

#proof[
  For the moment fix one normalized class pair and one product $X_ell times Y_ell$ in the spatial partition of $Gamma_N$. The corresponding component measure $nu$ is the pushforward of
  $ W \( x \, y \) upright(bold(1))_(X_ell) \( x \) upright(bold(1))_(Y_ell) \( y \) b_(1 \; C_1 \, C_2) \( x \, e \( x \, y \) \) b_(2 \; C_1 \, C_2) \( y \, e \( x \, y \) \) thin d rho_(1 \, C_1) \( x \) thin d rho_(2 \, C_2) \( y \) . $
  The product indicators are permitted bounded measurable spatial multipliers in the oscillatory estimates. At depth zero take $X = Y = Q_0$, each with its own normalized class law. These are occupied root cells, with $M_1 \( 0 \) = M_2 \( 0 \) = 1$. Their supported laws lie in the fixed separated sets $E_1 \, E_2$, so the outer-support geometry of Section 7 applies. The cell-center separation in Equation (7.1) is the internal-cell convention; the outer root uses the separation of the supported laws. In particular, all root spatial diameters in the graph argument are $O_d \( 1 \)$, while the actual cross distances have a fixed positive lower bound. By Lemma 31, the largest nominal length of an endpoint descriptor is at most
  $ L lt.eq max #scale(x: 120%, y: 120%)[\(] c \, \( N - c \) \/ 2 #scale(x: 120%, y: 120%)[\)] lt.eq N \/ 2 . $
  Thus the root shell conversion, Proposition 35, applies with $a = 0$, $v = N$. Its weight is precisely $W$; there is no internal normalization of the distance weight at this root. For any prescribed fixed $T > 0$, it bounds the squared Fourier norm on the positive shell by $R^(o \( 1 \)) sup sans(H)_F \( 0 \, N \) + O \( R^(- T) \)$. The supremum retains the root cells, class normalizations, lists, and smoothing index zero; its admissible symbols have the fixed derivative budget and common numerical angular bounds supplied by that Proposition for $T$.
  Apply Corollary 41 at $p = c$ to each energy in this supremum. The required parallel descriptor is the extra $\[ 0 \, c \]$ on each side, with $g = 0$. All scale conditions hold: $c > 0$ for large $N$, $c < N \/ 4$, $L lt.eq N \/ 2 < N - c$, and $N - c gt.eq 10 sigma N$. Since $A_(j \, 0) = 0$, the graph factor is
  #[#set math.equation(numbering: n => "(11.12)")
   $ R^(- A_(1 \, c) - A_(2 \, c) + min_j k_j \( 0 \, c \) + O_d \( sigma \) + o \( 1 \)) . $ <asm:graph-factor>]
  The graph estimate produces a general two-profile energy $sans(H) \( c \, N \)$ on a pair of occupied $c$-cells, still carrying the same endpoint symbols.
  On these cells the extra $\[ 0 \, c \]$ factor is spatially constant within each endpoint cell. It, and any of its normalized differentiated versions produced by shell conversion, can be removed at bounded cost from the positive independent angular energies. The remaining descriptor lists are exactly those with base $\[ c \, N \]$ and with reached anchors omitted. This removal is made in the general positive energy $sans(H)$, where the two angular factors are nonnegative.
  To separate the two profiles, write their nonnegative angular energies as $E_1 \( r \) \, E_2 \( r \)$ and use the common measure $d lambda_N \( r \) = Psi \( r \/ 2^N \) thin d r \/ 2^N$. Cauchy–Schwarz gives the exact normalization
  #[#set math.equation(numbering: n => "(11.13)")
   $ 2^(d \( N - c \)) integral E_1 \( r \) E_2 \( r \) thin d lambda_N \( r \) & lt.eq (2^(d \( N - c \)) integral E_1 \( r \)^2 thin d lambda_N \( r \))^(1 \/ 2)\
 & quad dot.op (2^(d \( N - c \)) integral E_2 \( r \)^2 thin d lambda_N \( r \))^(1 \/ 2) . $ <asm:two-profile-cs>]
  Each parenthesis is the independent angular energy formed by duplicating one endpoint law, cell, and symbol. With the unreached descriptors of $cal(M)_j \( c \, N \)$, it is the single-profile recursive state $sans(H)_0^(\[ c \, N \]) \( c \, N \)$ for profile $j$; denote this value by $sans(H)_j \( c \, N \)$. Its symbols have the fixed derivative budget and common numerical angular bounds supplied by shell conversion; restriction to the $c$-cells and duplication preserve these bounds. These states impose no separation condition, so Theorem 49 applies to each, including the case of two identical cells. It yields
  $ sans(H)_j \( c \, N \) lt.eq R^(2 A_(j \, c) - cal(V)_j \( \[ c \, N \] \) + O_d \( kappa + sigma \/ kappa \) + o \( 1 \)) . $
  The profile terms in Equation (11.12) and the geometric mean of these bounds combine to
  #[#set math.equation(numbering: n => "(11.14)")
   $ & - A_(1 \, c) - A_(2 \, c) + min_j k_j \( 0 \, c \) + 1 / 2 sum_(j = 1)^2 #scale(x: 120%, y: 120%)[\(] 2 A_(j \, c) - cal(V)_j \( \[ c \, N \] \) #scale(x: 120%, y: 120%)[\)]\
 & #h(20mm)  = min_j k_j \( 0 \, c \) - 1 / 2 #scale(x: 120%, y: 120%)[\(] cal(V)_1 \( \[ c \, N \] \) + cal(V)_2 \( \[ c \, N \] \) #scale(x: 120%, y: 120%)[\)] lt.eq - beta + C_d sigma + 2 d \/ N \, $ <asm:entry-cancellation>]
  where the last inequality uses the cost and potential bounds in Lemma 50. Including the stated losses proves uniformly for each component that
  #[#set math.equation(numbering: n => "(11.15)")
   $ integral_(2^(N - 1) lt.eq r lt.eq 2^(N + 1)) \| hat(nu) \( r \) \|^2 thin d r lt.tilde R^(- beta + C_d \( kappa + sigma \/ kappa \) + o \( 1 \)) + R^(- T) . $ <asm:component-shell>]
  Here $T$ can be any fixed sufficiently large number, after choosing the expansion and integration-by-parts orders. The term $O_d \( sigma \)$ has been included in $O_d \( sigma \/ kappa \)$, with $kappa < 1$.
  We make the parameter and error choices explicit. First choose $beta$ as in Lemma 50. Next choose $kappa$ so small that the entry interval is nonterminal and $C_d kappa < beta \/ 16$. Then choose $sigma$ so small that all the profile and transition hypotheses hold and $C_d sigma \/ kappa < beta \/ 16$. Finally choose $omega > 0$ so small that
  #[#set math.equation(numbering: n => "(11.16)")
   $ 4 d omega < beta \/ 8 . $ <asm:omega-choice>]
  The preparation of $Gamma_N$ is used with this fixed $omega$ and cap loss $R^sigma$. Its deletion exponent $c_(*)$ may depend on both parameters; only $c_(*) > 0$ was needed in Lemma 51.
  For completeness, the error accuracy is fixed after these parameters and before $N$ tends to infinity. Theorem 49 bounds the number of steps on a branch by a constant depending on $kappa \, sigma$. Choose a fixed local negative-power accuracy large enough to dominate all ancestor factors and all errors on such a branch, leaving the root remainder $R^(- T)$ in Equation (11.15), with, say, $T > 10 + 4 d omega$. The inverse expansion orders are then fixed and determine a finite symbol derivative budget. The direct expansion and integration-by-parts orders are chosen for that budget and accuracy, as in Theorem 49. The graph step and Equation (11.13) introduce no persistent new derivative orders; the spatial indicators have zero angular derivatives. These choices affect constants and the threshold for $N$, and do not change the dimensional coefficients in the exponent losses above. We now take $N$ sufficiently large for all these fixed choices and for the uniform $o \( 1 \)$ losses.
  There are at most $L_N lt.tilde R^(2 d omega)$ spatial products in $Gamma_N$. Let $nu_(C_1 \, C_2 \, ell)$ denote the preceding component. The exact recombination is
  $ tau_N = sum_(C_1 \, C_2) a_(1 \, C_1) a_(2 \, C_2) sum_(ell = 1)^(L_N) nu_(C_1 \, C_2 \, ell) . $
  Triangle inequality in the Fourier $L^2$ norm costs no class-count factor, because
  $ sum_(C_1 \, C_2) a_(1 \, C_1) a_(2 \, C_2) = (sum_(C_1) a_(1 \, C_1)) (sum_(C_2) a_(2 \, C_2)) lt.eq 1 . $
  It costs at most $L_N$ for the spatial products. Squaring therefore costs $R^(4 d omega)$, giving
  #[#set math.equation(numbering: n => "(11.17)")
   $ integral_(2^(N - 1) lt.eq r lt.eq 2^(N + 1)) \| hat(tau_N) \( r \) \|^2 thin d r lt.tilde R^(- beta + C_d \( kappa + sigma \/ kappa \) + 4 d omega + o \( 1 \)) + R^(- T + 4 d omega) . $ <asm:assembled-shell>]
  Our successive choices leave a strictly negative exponent; for example, increasing the starting $N$ if necessary, the right side is $O \( R^(- beta \/ 2) \)$. Each $tau_N$ is a real positive measure, so $hat(tau_N) \( - r \) = overline(hat(tau_N) \( r \))$. The same bound holds on the negative shell, proving Equation (11.11) with some $gamma > 0$. ◻
]

=== 11.4 A monotone shell reconstruction lemma <a-monotone-shell-reconstruction-lemma>

The following scalar fact isolates the final limiting argument. Its hypotheses require no rate at which the decreasing measures approach their limit. The proof combines a smooth dyadic Fourier decomposition with the summable positive increments of a decreasing family of finite measures. We give this reconstruction explicitly.

#thm([Lemma 11.4.])[
  (Monotone measure shell criterion).  #emph[Let $\( alpha_N \)_(N gt.eq K)$ be finite positive Borel measures on $bb(R)$ with $alpha_(N + 1) lt.eq alpha_N$, and let $alpha_oo = lim_N alpha_N$. Let $tau_N$ be finite complex Borel measures such that 
#[#set math.equation(numbering: n => "(11.18)")
 $ sum_(N gt.eq K) parallel alpha_N - tau_N parallel_(upright("TV")) < oo \, #h(2em) sum_(N gt.eq K) (integral_(2^(N - 1) lt.eq \| r \| lt.eq 2^(N + 1)) \| hat(tau_N) \( r \) \|^2 thin d r)^(1 \/ 2) < oo . $ <asm:criterion-hypotheses>]

 Then $alpha_oo$ is absolutely continuous with respect to Lebesgue measure. In particular, the conclusion holds if the two quantities inside these sums are respectively $O \( 2^(- eta N) \)$ and $O \( 2^(- gamma N \/ 2) \)$ for arbitrary $eta \, gamma > 0$.]
] <asm:monotone-shell>

#proof[
  Choose $theta.alt in C_c^oo \( bb(R) \)$ equal to one on $\[ - 1 \, 1 \]$ and supported in $\[ - 2 \, 2 \]$. Let $Q_N$ be convolution with the inverse Fourier transform of $theta.alt \( 2^(- N) r \)$, and put $P_N = Q_N - Q_(N - 1)$. The multiplier of $P_N$ is supported in ${ 2^(N - 1) lt.eq \| r \| lt.eq 2^(N + 1) }$. Dilation of the fixed Schwartz kernel gives a constant $C_theta.alt$ such that, for every finite measure $nu$,
  #[#set math.equation(numbering: n => "(11.19)")
   $ parallel Q_N nu parallel_(L^1) lt.eq C_theta.alt parallel nu parallel_(upright("TV")) \, #h(2em) ∥sum_(N = a)^b P_N nu∥_(L^1) lt.eq 2 C_theta.alt parallel nu parallel_(upright("TV")) quad \( a lt.eq b \) . $ <asm:low-cutoff-bound>]
  The second bound follows from telescoping to $Q_b - Q_(a - 1)$; in particular its constant is independent of the number of bands.
  With the convention $hat(nu) \( r \) = integral e^(- i r t) thin d nu \( t \)$, Plancherel #cite(label("Mattila1995")) equation (12.4) and the uniformly bounded band multipliers give
  $ parallel P_N tau_N parallel_(L^2) lt.tilde (integral_(2^(N - 1) lt.eq \| r \| lt.eq 2^(N + 1)) \| hat(tau_N) \( r \) \|^2 thin d r)^(1 \/ 2) . $
  Thus
  #[#set math.equation(numbering: n => "(11.20)")
   $ G := sum_(N gt.eq K) P_N tau_N quad upright("converges in ") L^2 \, #h(2em) H := sum_(N gt.eq K) P_N \( alpha_N - tau_N \) quad upright("converges in ") L^1 . $ <asm:two-convergent-series>]
  Both series converge absolutely in the indicated Banach space.
  It remains to account for the variation of $alpha_N$. Set $zeta_n = alpha_n - alpha_(n + 1) gt.eq 0$. Monotonicity and finiteness give
  #[#set math.equation(numbering: n => "(11.21)")
   $ sum_(n gt.eq K) parallel zeta_n parallel_(upright("TV")) = alpha_K \( bb(R) \) - alpha_oo \( bb(R) \) < oo \, #h(2em) alpha_N - alpha_oo = sum_(n gt.eq N) zeta_n quad upright("in total variation") . $ <asm:measure-telescoping>]
  For a finite $M gt.eq K$, define $Z_M = sum_(N = K)^M P_N \( alpha_N - alpha_oo \)$. Substituting Equation (11.21) into this finite sum and using the bounded operators from measures to $L^1$ gives the exact identity
  #[#set math.equation(numbering: n => "(11.22)")
   $ Z_M = sum_(n gt.eq K) \( Q_(min \( n \, M \)) - Q_(K - 1) \) zeta_n . $ <asm:finite-band-identity>]
  For each fixed $M$ the series on the right converges in $L^1$. Moreover, Equation (11.19) shows that
  $ Z := sum_(n gt.eq K) \( Q_n - Q_(K - 1) \) zeta_n $
  converges absolutely in $L^1$. Subtracting the two series cancels all $n lt.eq M$, and gives
  #[#set math.equation(numbering: n => "(11.23)")
   $ parallel Z_M - Z parallel_(L^1) & lt.eq 2 C_theta.alt sum_(n > M) parallel zeta_n parallel_(upright("TV"))\
 & = 2 C_theta.alt parallel alpha_(M + 1) - alpha_oo parallel_(upright("TV")) arrow.r 0 . $ <asm:variation-tail>]
  This is where monotonicity is used. The original double series has not been rearranged without a convergence justification.
  Finally, finite telescoping gives
  #[#set math.equation(numbering: n => "(11.24)")
   $ Q_M alpha_oo = Q_(K - 1) alpha_oo + sum_(N = K)^M P_N tau_N + sum_(N = K)^M P_N \( alpha_N - tau_N \) - Z_M . $ <asm:reconstruction>]
  The fixed low-frequency term $Q_(K - 1) alpha_oo$ is a smooth $L^1$ function by convolution with a Schwartz kernel. By Equations (11.20) and (11.23), the right side converges in $L^1 + L^2$, hence in distributions, to
  $ f = Q_(K - 1) alpha_oo + G + H - Z in L_(upright("loc"))^1 \( bb(R) \) . $
  The kernels defining $Q_M$ form an approximate identity, so the left side of Equation (11.24) converges in distributions to $alpha_oo$. Therefore $alpha_oo = f thin cal(L)^1$. Since $alpha_oo$ is a finite positive measure, this locally integrable density is nonnegative almost everywhere and belongs to $L^1 \( bb(R) \)$. This proves absolute continuity. ◻
]

=== 11.5 Completion of the proof <completion-of-the-proof>

#thm([Proposition 11.5.])[
  #emph[For the starting pair in Proposition 23, there is a nonzero finite positive measure, absolutely continuous with respect to $cal(L)^1$, carried by the original distance set $Delta \( E \)$. Consequently $cal(L)^1 \( Delta \( E \) \) > 0$.]
] <asm:completion>

#proof[
  Choose the parameters as in Proposition 52. Lemma 51 gives decreasing $alpha_N$ with nonzero limit $alpha_oo$, and approximants $tau_N$ with summable total-variation error. Proposition 52 gives the second summability hypothesis of Lemma 53. That Lemma makes $alpha_oo$ absolutely continuous. By Lemma 51 it is carried by $Delta \( E \)$ and has positive mass, so $Delta \( E \)$ cannot be a Lebesgue null set. ◻
]

#proof[
  Start with a Frostman probability on the given compact set $E subset bb(R)^d$, $d gt.eq 2$, with exponent strictly larger than $d \/ 2$. In the odd-dimensional exceptional affine-plane case, Lemma 18 already proves the conclusion using original distances inside that plane. In every other case, Proposition 23 supplies the separated original probabilities and filters used above, and Proposition 54 proves the conclusion. This includes $d = 2$: its cap preparation is the integer case of Lemma 21. The auxiliary projections used in preparation control directions only; the measures in Equation (11.7) and their nonzero limit are pushforwards by $\| x - y \|$ in $bb(R)^d$. Thus the argument establishes the asserted positive measure for the original distance set in every dimension $d gt.eq 2$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
