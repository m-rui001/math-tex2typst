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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to Sidorenko's conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For finite simple undirected graphs $H$ and $G$ with $\| V \( G \) \| gt.eq 1$, write

$ t \( H \, G \) = frac(hom \( H \, G \), \| V \( G \) \|^(\| V \( H \) \|)) \, wide p \( G \) =
  frac(2 \| E \( G \) \|, \| V \( G \) \|^2) \, $

where $hom \( H \, G \)$ counts every edge-preserving map, including noninjective maps.
  Sidorenko’s conjecture asserts that

#[#set math.equation(numbering: n => "(1.1)")
 $ t \( H \, G \) gt.eq p \( G \)^(\| E \( H \) \|) $ <eq:sidorenko>]

whenever $H$ is bipartite and has at least one edge. We disprove this conjecture.

#thm([Theorem 1.1.])[
  #emph[Let $H$ be the incidence graph of the $22$ triples on $13$ points in Table 1.
    This bipartite graph has $35$ vertices and $66$ edges. There is a finite simple undirected graph $G$ with at
    least one edge such that
$ t \( H \, G \) < p \( G \)^66 . $

]
] <thm:main>

We first construct a strict density gap for a finite nonnegative kernel and then retain it when sampling a finite
  simple host. This route specifies $H$ explicitly and proves existence of $G$,
  while the final density continues to count all homomorphisms.

A finite kernel is a nonnegative function $W \( x \, y \)$ on two finite probability spaces.
  Its mean is the analogue of edge density, and its $H$-density is the expectation of the product of $W$ over the
  incidences of $H$, with independent samples from the first space at the point vertices and from the second space
  at the face vertices. For a symmetric kernel taking values in $\[ 0 \, 1 \]$,
  a simple graph can be sampled by choosing a label for each host vertex and using the kernel value as the
  probability of each edge.

The same pattern has further consequences with distinct density scopes.
  Tensor powers make $t \( H \, F \) \/ p \( F \)^66$ arbitrarily small, with the host density allowed to vary.
  Balanced blow-ups retain a fixed deficit in injective labeled copies at one positive limiting edge density.
  At one fixed $p in \( 0 \, 1 \)$, a nonconstant symmetric $\[ 0 \, 1 \]$-valued kernel has mean $p$ and
  $H$-density $p^66$; sampling gives finite graphs whose edge and $H$-densities converge to these values while
  their four-cycle density has a limit strictly greater than $p^4$.
  Corollaries 2 and 3 state these consequences precisely below.

=== The negative correlation <the-negative-correlation>

The triple system has $13$ points and $22$ faces. Each of its $33$ point pairs belongs to exactly two faces.
  This double occurrence converts a local sign constraint into a correlation involving four incidences.

To see the algebra, attach a sign $xi_(i j)$ to each chosen active incidence and an independent uniform sign
  $eta_e$ to each point pair. The finite-field lemma compares the averaged matrix product with a sign model having
  a factor $1 + c_0 eta_e xi_(i j) xi_(k j)$ whenever both incidences of $e = { i \,
  k }$ on a face $j$ are active; here $c_0 in { - 1 \, 1 }$. If the two faces on $e$ are $j \, l$, then

$ bb(E)_(eta_e) \( 1 + c_0 eta_e xi_(i j) xi_(k j) \) \( 1 + c_0 eta_e xi_(i l) xi_(k l) \) = 1 +
  xi_(i j) xi_(k j) xi_(i l) xi_(k l) . $

A factor used on only one face averages to $1$. Thus the model retains the parity of the four incidence signs
  exactly when both face occurrences are selected. This is the finite correlation that the kernel construction
  turns negative.

The matrix model uses a large fixed even dimension $D = 2 r$.
  For a symmetric matrix difference over $bb(F)_q$, with $q$ an odd prime,
  prescribe rank $r$ and the determinant sign of the induced nondegenerate quotient form.
  Half rank is the key geometric constraint: when the difference between two point matrices is nonsingular,
  the two rank-$r$ images through a common center are complementary, which relates their determinant signs.
  On configurations with nonsingular point differences, the normalized center integrals approximate the sign model
  in averaged $L^1$, with a uniform bound on the local factors.
  A joint estimate shows that the determinant signs on the $33$ point pairs are asymptotically independent,
  supplying the independent $eta_e$ in the limiting sign model.

The kernel uses one independent matrix coordinate for each incidence.
  A type names the point or face that a sampled vertex is intended to represent.
  At an incident type pair, two choices of active coordinate set have opposite sign biases.
  They cancel every nonconstant first sign moment while retaining a signed overlap moment.
  Expanding the parity model assigns a set of selected coordinates to each point pair.
  The chosen supports permit exactly one collection of nonempty pair labels at the intended type assignment,
  and its product of overlap moments is negative. Scores obtained from color refinement make this assignment
  dominate all other part-preserving type maps, including maps with repetitions.

The limiting density in one orientation now has a negative correction.
  Adding an inactive point type makes that correction occur with a factor $epsilon^13$,
  while the uncontrolled correction in the opposite orientation has a factor $epsilon^22$.
  Choosing $epsilon > 0$ sufficiently small and then taking $q$ sufficiently large makes the product of the two
  finite oriented densities less than one. A crossed product of the rectangular kernel with its transpose then
  gives a symmetric kernel with the same strict deficit.

The remaining issue is the contribution of singular point differences.
  Their probability is $O \( q^(- 1) \)$, but the normalized rank indicators can grow as a power of $q$,
  so the weighted contribution requires a separate bound. The graph ${ \( v \, X v \) :
  v in bb(F)_q^D }$ of a symmetric matrix is a Lagrangian subspace of $bb(F)_q^D xor bb(F)_q^D$ for

$ omega \( \( v \, w \) \, \( v' \, w' \) \) = v^(sans(T)) w' - w^(sans(T)) v' . $

The intersection of two such graphs projects isomorphically onto the kernel of their difference.
  Rank defects thereby become intersection dimensions.

We compare the probability of each point-intersection profile with the gain from conditioning on its intersections
  with a face center. Three partitions of the face set give a global profile bound.
  If this first bound does not give decay, a quadratic estimate forces any large pair intersection to propagate
  through the connected complex until the extra separation of one pair makes the profile too costly.
  The remaining bounded dimensions reduce, after choosing $D$, to a short list of integer equality cases.
  A final span count gives strict decay for those cases. The dimension and all finite construction parameters are
  fixed before $q$ tends to infinity; constants in the $q$-estimates may depend on that fixed dimension.

Figure 1 summarizes these dependencies.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.353cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Fixed triple system#linebreak()Section~2]]])])
  content((-3.7, -1.5), [#box(width: 4.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Activation supports#linebreak()and type scores#linebreak()Section~3]]])])
  content((0.9, -1.5), [#box(width: 3.753cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Transverse contribution#linebreak()Section~4]]])])
  content((4.9, -1.5), [#box(width: 3.753cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Weighted singular#linebreak()bound#linebreak()Sections~5--7]]])])
  content((2.9, -2.9), [#box(width: 6.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Rank-layer limit#linebreak()Lemma~3.1]]])])
  content((0, -4.3), [#box(width: 6.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Negative averaged coefficient#linebreak()in one limiting oriented density]]])])
  content((0, -5.6), [#box(width: 6.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Dilution and crossed product#linebreak()symmetric kernel with a strict deficit]]])])
  content((0, -6.9), [#box(width: 6.853cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#627b94"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f6f7f9"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Sampling a finite simple host $G$#linebreak()Lemma~3.6]]])])
  line((-3.176, -0.4806), (-3.7, -0.8271), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((3.176, -0.4806), (2.9, -0.7), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10))
  line((2.9, -0.7), (0.9, -1.019), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((2.9, -0.7), (4.9, -0.8122), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((0.9, -1.981), (-0.1764, -2.406), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((4.9, -2.188), (5.976, -2.406), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((-3.7, -2.173), (-3.426, -3.789), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((2.9, -3.394), (3.426, -3.789), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((0, -4.811), (0, -5.089), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
  line((0, -6.111), (0, -6.406), stroke: (paint: rgb("#4c6985"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#4c6985"))))
})],
  caption: [Figure 1: Logical dependencies of the counterexample. The fixed triple system supplies the combinatorial properties used in both branches. The rank-layer limit realizes the averaged coefficient made negative by the finite activation construction. Section 3 constructs the kernel and transfers its strict deficit to a finite simple host assuming Lemma 5; Sections 4–7 then prove that input. ],
) <fig:proof-overview>

=== History and relation to positive results <history-and-relation-to-positive-results>

The conjecture grew out of questions about supersaturation:
  how many copies of a fixed bipartite graph must occur once the host has many edges?
  In a related study of graphcopy functions, Erdős, Lovász,
  and Spencer distinguished normalized homomorphism and injective-copy counts and proved their limiting agreement
  under increasing host orders #cite(label("erdoslovaszspencer1979")).
  Simonovits’s discussion of degenerate extremal problems placed supersaturation lower bounds in a general
  program #cite(label("simonovits1984")). Sidorenko formulated the associated inequalities for functionals of
  nonnegative kernels #cite(label("sidorenko1991")) #cite(label("sidorenko1993")).
  In the homomorphism formulation, the proposed lower bound is the density in a constant kernel of the same mean.
  The insistence on all homomorphisms is part of this formulation; repeated images of vertices are allowed.
  Theorem 1 concerns this ordinary graph inequality.

Trees, even cycles, and complete bipartite graphs are basic positive examples #cite(label("sidorenko1993")).
  Several methods established broader classes. Conlon, Fox,
  and Sudakov proved the conjecture when one vertex is adjacent to the entire opposite part,
  and obtained more general comparisons with complete bipartite graphs #cite(label("conlonfoxsudakov2010")).
  A different approach studies norms derived from homomorphism densities.
  Hatami developed the graph-norm approach, recording Szegedy’s observation that weakly norming graphs satisfy
  Sidorenko’s inequality, and proved stronger subgraph inequalities and the hypercube
  case #cite(label("hatami2010")). Conlon and Lee constructed weakly norming graphs from finite reflection
  groups #cite(label("conlonlee2017")). These results provide stronger inequalities than the comparison with a
  single edge and explain why many highly structured bipartite graphs satisfy the conjecture.

Other proofs assemble a graph from pieces while keeping control of the associated homomorphism distribution.
  Li and Szegedy’s logarithmic calculus, first circulated in 2011,
  gives gluing results and a class of reflection trees #cite(label("liszegedy2025")).
  Szegedy developed an information theoretic formulation using entropy and conditional
  gluing #cite(label("szegedy2015entropy")). Kim, Lee, and Lee proved the conjecture for tree-arrangeable graphs
  and for Cartesian products of a Sidorenko graph with a tree #cite(label("kimleelee2016")).
  Conlon, Kim, Lee, and Lee introduced strong tree decompositions and established further subdivision
  results #cite(label("conlonkimleelee2018")). More recently, Im, Li,
  and Liu treated subdivisions and substitutions by even theta graphs under a local-density counting hypothesis
  for the base or suitable global path-multiplicity conditions #cite(label("imliliu2026")).
  The gluing and substitution statements impose different structural conditions on their constituent graphs.

Positive results also depend on how often neighborhoods of a given size occur.
  Conlon and Lee proved a divisibility criterion and a degree-count criterion when one part is regular,
  and showed that every bipartite graph has a sufficiently large one-sided blow-up satisfying the
  conjecture #cite(label("conlonlee2021")). Coregliano subsequently replaced the divisibility hypothesis with
  weaker degree-count bounds and extended the reflection approach through left-cut-percolation and
  induced-Sidorenko bigraphs #cite(label("coregliano2024")).
  A positive result for a blow-up does not imply the corresponding result for the original graph.

There are useful reductions of the host space as well. Coregliano and Razborov proved that, for a fixed pattern,
  a lower bound by one fixed positive multiple of the Sidorenko expression on every biregular bigraphon implies
  the exact Sidorenko inequality on every bigraphon. Here biregular means that the kernel integrals in either
  variable are constant. They also proved a reflective tree-decomposition
  theorem #cite(label("coreglianorazborov2021")). In another direction,
  Zhao gave a conditional reduction through conjugacy-class averaging on finite groups and proved an inequality
  for one-subdivisions on the resulting conjugacy-averaged bipartite Cayley
  kernels #cite(label("zhao2026conjugacy")) Theorems 1.3–1.4.
  The averaging monotonicity in the general reduction is a hypothesis.

The incidence graph used here has parts of sizes $13$ and $22$, with degrees $4 \, 5 \,
  6$ on the first part and degree $3$ on the second. It therefore has no vertex adjacent to the whole opposite
  part. Since it is connected and its first part is not regular, it is not weakly norming:
  Hatami’s necessary condition requires regularity on each part #cite(label("hatami2010")).
  Coregliano’s sufficient degree-count hypothesis is not met in either orientation.
  On the degree-$3$ side the relevant comparison is $22 < binom(13, 3) = 286$;
  in the reverse orientation there are only $3 \, 6 \, 4$ vertices of degrees $4 \, 5 \, 6$, respectively,
  below the corresponding thresholds $binom(22, 4) \, binom(22, 5) \,
  binom(22, 6)$ #cite(label("coregliano2024")) Theorem 3.6.
  Its minimum degree is $3$, so it is not directly a graph obtained by the even-path substitutions above,
  which introduce vertices of degree $2$. These observations locate the example relative to specific positive
  theorems; the negative inequality is established by the construction and estimates below.

Finally, the conclusion is compatible with local versions of the conjecture.
  For a bipartite graph with $m$ edges, Lovász proved the inequality for a mean-one symmetric kernel $W$
  satisfying $lr(bar.v.double W - 1 bar.v.double)_oo lt.eq 1 \/ \( 4 m \)$ #cite(label("lovasz2011local"))
  Theorem 5.1. He also proved a cut-norm version under the additional bound $0 lt.eq W lt.eq 2$,
  with $lr(bar.v.double W - 1 bar.v.double)_square.stroked.tiny lt.eq
  2^(- 8 m - 2)$ #cite(label("lovasz2011local")) Theorem 4.1.
  Here the kernels are on $\[ 0 \, 1 \]^2$, with Lebesgue measure, and

$ lr(bar.v.double F bar.v.double)_square.stroked.tiny = sup_(S \, T subset.eq \[ 0 \, 1 \])
  lr(|integral_(S times T) F \( x \, y \) thin d x thin d y|) \, $

where $S \, T$ are measurable. Thus the constant kernel has a neighborhood on which the inequality holds.
  A finite probability kernel can be represented on $\[ 0 \, 1 \]^2$ by a step function whose interval lengths are
  its atom probabilities. The mean-one normalization of our final symmetric kernel, having a strict deficit,
  cannot satisfy either set of local hypotheses above. Scaling the kernel into $\[ 0 \, 1 \]$ preserves the
  normalized density comparison.

The construction also uses established geometric and algebraic frameworks in specific roles.
  Conditions on the rank and discriminant sign of a symmetric matrix difference are the relations in the
  association scheme of symmetric matrices studied by Huo and Wan #cite(label("huowan1993"));
  Schmidt records this framework and the exact counts by rank and sign #cite(label("schmidt2015")) Section 2.
  Symplectic geometry provides the elementary Lagrangian and pair-intersection counting
  formulas #cite(label("taylor1992")). The joint-sign argument uses the standard quadratic Gauss-sum rank
  bound #cite(label("gowerswolf2011")) Lemma 3.3, and the type scores adapt color
  refinement #cite(label("weisfeilerleman1968")) #cite(label("mckay1981")).
  We rederive the estimates used here and combine the signed rank-layer correlations with bounds for their
  weighted contribution on singular configurations.

=== Amplification and injective copies <amplification-and-injective-copies>

For a finite simple graph $F$ of order $n gt.eq 35$, let $"Inj" \( H \, F \)$ count injective edge-preserving
  maps, with no condition on nonedges, and write $\( n \)_35 = n \( n - 1 \) dots.h.c \( n - 34 \)$.
  At ordinary edge density $d = \| E \( F \) \| \/ binom(n, 2)$,
  the labeled random-graph benchmark is $\( n \)_35 d^66$, the expected count in $G \( n \, d \)$.

#thm([Corollary 1.2.])[
  (Amplification and injective supersaturation).  #emph[For the same graph $H$ as in Theorem 1, the following hold.]
  + #emph[For every $c > 0$, there is a finite simple undirected graph $F$ with $p \( F \) > 0$ such that
$ t \( H \, F \) < c thin p \( F \)^66 . $

]
  + #emph[There are $p_(*) in \( 0 \, 1 \)$, $delta_(*) > 0$,
    and finite simple undirected graphs $F_s$ of orders $n_s arrow.r
    oo$ for which $d_s = \| E \( F_s \) \| \/ binom(n_s, 2) arrow.r p_(*)$ and, for all sufficiently large $s$,
$ "Inj" \( H \, F_s \) lt.eq \( 1 - delta_(*) \) \( n_s \)_35 d_s^66 . $

]
] <cor:amplification>

The proof in Section 8 uses tensor powers and balanced blow-ups of a single host from Theorem 1.

Part (ii) contradicts the injective Erdős–Simonovits random-graph benchmark described in
  #cite(label("conlonfoxsudakov2010")) Section 1: the sequence has one positive limiting density,
  so it eventually satisfies $d_s > n_s^(- gamma)$ for every fixed $gamma > 0$, while retaining a fixed deficit.

=== A consequence for the forcing conjecture <a-consequence-for-the-forcing-conjecture>

Fix $0 < p < 1$. A graph $F$ with $m$ edges is #emph[$p$-forcing] if every sequence of finite simple graphs $G_n$
  with $\| V \( G_n \) \| arrow.r oo$, $p \( G_n \) arrow.r p$, and $t \( F \, G_n \) arrow.r
  p^m$ is quasirandom of density $p$: for every fixed finite simple graph $J$, one has $t \( J \, G_n \) arrow.r
  p^(\| E \( J \) \|)$. It is #emph[forcing] if it is $p$-forcing for every $p in \( 0 \, 1 \)$.
  The classical edge-and-four-cycle characterization of quasirandomness is due to Chung, Graham,
  and Wilson #cite(label("chunggrahamwilson1989")). Skokan and Thoma studied which bipartite patterns can replace
  the four-cycle #cite(label("skokanthoma2004")). Using this asymptotic formulation and following their question,
  Conlon, Fox, and Sudakov formulate the forcing conjecture:
  a graph is forcing if and only if it is bipartite and contains a cycle #cite(label("conlonfoxsudakov2010"))
  Section 1, equation (2) and Conjecture 2.

For a symmetric $\[ 0 \, 1 \]$-valued kernel $W$ on a probability space, write

$ t \( F \, W \) = bb(E) product_(u v in E \( F \)) W \( X_u \, X_v \) \, $

where the $X_v$ are independent samples. In particular, $t \( K_2 \, W \) = bb(E) W$.
  We identify each finite probability kernel below with its step graphon on $\[ 0 \, 1 \]$.

#thm([Corollary 1.3.])[
  (Failure of the forcing conjecture).  #emph[For the same connected bipartite graph $H$ of Theorem 1,
    there are $p in \( 0 \, 1 \)$ and a nonconstant graphon $W$ such that
$ t \( K_2 \, W \) = p \, wide t \( H \, W \) = p^66 . $

 Consequently, $H$ is not $p$-forcing at this density and hence is not forcing,
   despite being bipartite and containing a cycle.]
] <cor:forcing>

Section 8 interpolates between finite kernels of the same mean to obtain the exact graphon equality,
  then uses independent sampling to obtain a sequence of finite graphs with the stated limiting densities.
  Conlon, Fox, and Sudakov note that the forcing conjecture is stronger than Sidorenko’s
  conjecture #cite(label("conlonfoxsudakov2010")) Section 1;
  the interpolation gives a concrete witness for this graph at one density.

=== Organization and conventions <organization-and-conventions>

Section 2 gives the triple system and verifies its finite properties.
  Section 3 states Lemma 5 and uses it to prove Theorem 1. The next four sections prove that lemma:
  Section 4 treats transverse matrices; Section 5 gives the Lagrangian orbit counts;
  Section 6 bounds the local gains; and Section 7 proves strict decay of the singular contribution.
  Section 8 then proves the amplification, injective-copy and forcing consequences stated above.

All probability spaces used in our construction are finite.
  Expectations refer to the indicated independent samples, except where a conditional law is specified.
  Empty products equal $1$. The field size $q$ tends to infinity through odd primes.
  Every such limit is taken after fixing the dimension and all finite construction parameters.
  Dependence on $D$ in the constants of these $q$-asymptotic estimates is allowed;
  bounds used to choose $D$ will explicitly be uniform in $D$.

== 2 The finite complex <sec:complex>

We specify the fixed triple system and certify the properties used in both the kernel construction and the
  singular-tail bound.

Let $I = { 0 \, dots.h \, 12 }$ and $J = { 0 \, dots.h \, 21 }$.
  Associate to each $j in J$ the three-element subset of $I$ in Table 1;
  we call these subsets #emph[faces] and also denote them by $j$.
  Let $E$ be the set of unordered point pairs contained in a face.
  The graph used throughout the paper is the incidence graph

$ H = \( I union.sq J \, cal(C) \) \, wide cal(C) = { \( i \, j \) : i in j } . $

The copies of $I$ and $J$ in this disjoint union are distinct even when their numerical labels agree.
  We call an incidence $\( i \, j \)$ a #emph[corner]. Thus $H$ has $35$ vertices and $66$ edges.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 8,
  align: (center, center, center, center, center, center, center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[Face
], table.cell(rowspan: 1, colspan: 3, align: center)[Points
], table.cell(rowspan: 1, colspan: 3, align: center)[Opposite face
], table.cell(rowspan: 1, colspan: 1)[Bits
],
  table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$i_1$
], table.cell(rowspan: 1, colspan: 1)[$i_2$
], table.cell(rowspan: 1, colspan: 1)[$i_3$
], table.cell(rowspan: 1, colspan: 1)[$j_12$
], table.cell(rowspan: 1, colspan: 1)[$j_13$
], table.cell(rowspan: 1, colspan: 1)[$j_23$
], table.cell(rowspan: 1, colspan: 1)[],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[000
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[010
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[001
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[110
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[001
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[000
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[100
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[110
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[101
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[100
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[111
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[101
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[101
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[011
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[000
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[110
],
  table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[010
],
  table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[111
],
  table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[001
],
  table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[010
],
  table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[011
],
  table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[111
],
)
]],
  caption: [Table 1: The faces of the complex. The entry $j_(a b)$ is the other face containing ${ i_a \, i_b }$. Bit positions are read from left to right. ],
)

Join two faces when they share a pair. This defines the #emph[face-neighbor graph]. For a pair $e in E$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ a_e = 1 / 3 \# { upright("bit positions at which the two faces on ") e upright("
 differ") } . $ <eq:complex-separation>]

Color refinement starts with a separate color for each part of $H$.
  A refinement step replaces a vertex’s color by the ordered pair consisting of its old color and the histogram of
  its neighbors’ old colors. This is the classical color-refinement procedure;
  see Weisfeiler and Leman #cite(label("weisfeilerleman1968")) and McKay #cite(label("mckay1981"))
  Sections 2.3–2.6 for its equitable-partition interpretation.

#thm([Proposition 2.1.])[
  #emph[The complex has the following properties.]
  + #emph[Every pair in $E$ lies in exactly two faces, $\| E \| = 33$, and the face-neighbor graph is connected.]
  + #emph[For each bit position, each of its two classes consists of $11$ faces covering all $13$ points.
    Each class has an ordering in which every face after the first shares a pair with an earlier face and
    introduces exactly one new point.]
  + #emph[Every $a_e$ is at least $1 \/ 3$, and some $a_e$ is greater than $1 \/ 3$.]
  + #emph[Color refinement of $H$, starting with a separate color for each part,
    eventually gives distinct colors to all vertices within either part.]
] <prop:complex>

#proof[
  The neighbor entries in Table 1 pair the $66$ face–pair incidences into $33$ reciprocal pairs.
    Comparing the triples in each indicated pair shows that their common point pair is exactly the one specified.
    No other face contains that pair, as is also checked by the same table.
  Table 2 gives all six orders and their new-point certificates for the second assertion.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, left, left,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 2, align: center)[Bit class
], table.cell(rowspan: 1, colspan: 1)[Face order
], table.cell(rowspan: 1, colspan: 1)[New points after the first face
],
  table.cell(rowspan: 1, colspan: 1)[Position
], table.cell(rowspan: 1, colspan: 1)[Value
], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1 \, 2 \, 4 \, 5 \, 16 \, 14 \, 18 \, 20 \, 19 \, 13$
], table.cell(rowspan: 1, colspan: 1)[$9 \, 2 \, 10 \, 7 \, 5 \, 6 \, 12 \, 8 \, 11 \, 4$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$3 \, 9 \, 8 \, 10 \, 11 \, 17 \, 15 \, 12 \, 21 \, 7 \, 6$
], table.cell(rowspan: 1, colspan: 1)[$4 \, 3 \, 11 \, 10 \, 5 \, 6 \, 8 \, 12 \, 1 \, 7$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 2 \, 8 \, 9 \, 12 \, 4 \, 11 \, 5 \, 6 \, 18 \, 14$
], table.cell(rowspan: 1, colspan: 1)[$2 \, 4 \, 9 \, 8 \, 10 \, 11 \, 7 \, 12 \, 6 \, 5$
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$1 \, 3 \, 7 \, 21 \, 20 \, 19 \, 13 \, 10 \, 15 \, 17 \, 16$
], table.cell(rowspan: 1, colspan: 1)[$2 \, 12 \, 8 \, 6 \, 11 \, 4 \, 3 \, 5 \, 10 \, 7$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1 \, 3 \, 9 \, 7 \, 6 \, 5 \, 16 \, 14 \, 15 \, 19$
], table.cell(rowspan: 1, colspan: 1)[$9 \, 2 \, 4 \, 12 \, 7 \, 10 \, 5 \, 6 \, 11 \, 8$
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$2 \, 8 \, 10 \, 11 \, 4 \, 17 \, 13 \, 12 \, 21 \, 20 \, 18$
], table.cell(rowspan: 1, colspan: 1)[$4 \, 11 \, 10 \, 1 \, 5 \, 8 \, 9 \, 12 \, 6 \, 7$
],
)
]],
    caption: [Table 2: An exposure order for each bit class. Every face after the first shares a pair with an earlier face and introduces the corresponding point in the last column. Bit positions are read from left to right in Table 1. ],
  )
  The root face contributes its three points, and these ten new points give all of $I$ in each case.
    The shared-pair condition follows from the neighbor columns of Table 1. Thus every bit class is connected.
    The first two classes are joined, for example, by faces $2$ and $3$,
    so the whole face-neighbor graph is connected. Inspection of the bit labels gives separation in at least one
    position on every pair. The pair ${ 0 \, 2 }$ has adjacent labels $001$ and $110$, so in fact $a_({ 0 \, 2 }) = 1$.
  It remains to verify the color-refinement assertion. First consider the point graph $\( I \, E \)$.
    Its point degrees $d_i$ and the numbers $n_4 \( i \) \, n_5 \( i \) \,
    n_6 \( i \)$ of neighbors of degrees $4 \, 5 \, 6$ are as follows:
  #[#set math.equation(numbering: n => "(2.2)")
   $ i & d_i & n_4 & n_5 & n_6 & i & d_i & n_4 & n_5 & n_6\
0 & 4 & 1 & 0 & 3 & 7 & 5 & 1 & 3 & 1\
1 & 6 & 1 & 3 & 2 & 8 & 5 & 0 & 3 & 2\
2 & 4 & 1 & 1 & 2 & 9 & 6 & 2 & 3 & 1\
3 & 6 & 2 & 2 & 2 & 10 & 5 & 1 & 1 & 3\
4 & 5 & 1 & 1 & 3 & 11 & 6 & 1 & 4 & 1\
5 & 4 & 0 & 3 & 1 & 12 & 5 & 0 & 3 & 2\
6 & 5 & 1 & 3 & 1 &  &  &  &  & $ <eq:complex-colors>]
  Only the pairs ${ 4 \, 10 }$, ${ 6 \, 7 }$, and ${ 8 \, 12 }$ have equal signatures in Equation (2.2).
    The first is separated by adjacency to the already distinguished point $2$:
    $4$ is adjacent to $2$, whereas $10$ is not. The other two are separated by adjacency to the already
    distinguished point $11$: $6$ and $8$ are adjacent to $11$, whereas $7$ and $12$ are not.
    Hence refinement on the point graph is discrete.
  This point refinement can be recovered from incidence refinement. The degree of $i$ in $H$ equals $d_i$:
    counting other points in its incident faces gives twice each neighbor in $\( I \, E \)$.
    More generally, suppose the current incidence color of every point determines a point coloring $ell$ through a
    fixed projection. One further incidence step determines, at each face $j$, the color-indexed histogram
  $ m_j \( gamma \) = \# { k in j : ell \( k \) = gamma } . $
  The next step determines the multiset of these histograms over the faces incident to each point.
    For every color $gamma$, this gives
  $ sum_(j in.rev i) (m_j \( gamma \) - upright(bold(1))_({ gamma = ell \( i \) })) = 2 thin \# { k : { i \,
    k } in E \, med ell \( k \) = gamma } . $
  The subtraction removes only the occurrence of $i$ in each face, even when other points have the same color.
    Each neighbor is counted twice because its pair with $i$ lies in two faces.
    Dividing by two therefore recovers the point neighbor-color histogram.
    Thus two incidence steps recover each further point refinement step.
    After the point colors are discrete, one more step distinguishes all faces,
    since their three-element point sets are distinct. This proves the last assertion without any assumption about
    a chosen refinement implementation. ◻
]

== 3 Constructing a negative kernel correlation <sec:kernel>

This section reduces Theorem 1 to a finite-field counting lemma.
  We first state that lemma, then construct a nonnegative kernel whose homomorphism density is too small.
  All probability spaces in the construction are finite; their atom probabilities need not be rational.

=== 3.1 The rank-layer model <the-rank-layer-model>

Let $q$ be an odd prime, let $chi : bb(F)_q arrow.r { 0 \, 1 \, -
  1 }$ be the quadratic character with $chi \( 0 \) = 0$, and let $cal(S)_D$ be the space of symmetric $D$-by-$D$
  matrices over $bb(F)_q$, equipped with uniform probability.
  For a symmetric matrix of positive rank, its #emph[sign] is the quadratic character of the determinant of its
  induced nondegenerate symmetric form on the quotient by the radical.
  A change of basis multiplies this determinant by a square, so the sign is well defined.
  Fix a positive even dimension $D = 2 r$ and set

#[#set math.equation(numbering: n => "(3.1)")
 $ K_xi \( Z \) =
   frac(upright(bold(1))_({ "rank" Z = r \, med "sign" \( Z \) = xi }), bb(P)_(Z' in cal(S)_D) \( "rank" Z' = r \,
   med "sign" \( Z' \) = xi \)) \, wide xi in { 1 \, - 1 } \, wide c_0 =
   chi \( \( - 1 \)^r \) . $ <eq:kernel-rank-definition>]

Both denominators are positive: diagonal matrices realize either nonzero determinant square class in rank $r$.
  In particular, $K_xi gt.eq 0$ and $bb(E) K_xi = 1$.

#thm([Lemma 3.1.])[
  (Rank-layer limit).  #emph[There is an integer $D_0$ such that, for every fixed even $D gt.eq D_0$,
    the following assertion holds as $q$ tends to infinity through odd primes.
    Let $X_i$, $i in I$, and $Y_j$, $j in J$, be independent uniform elements of $cal(S)_D$.
    For every set $B subset.eq cal(C)$ and every choice of signs $xi_(i j) in { 1 \, - 1 }$ on $B$,
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(E) product_(\( i \, j \) in B) K_(xi_(i j)) \( X_i - Y_j \) =
   bb(E)_eta product_(j in J) product_(e = { i \, k } subset j\
\( i \, j \) \, \( k \, j \) in B) #scale(x: 120%, y: 120%)[\(] 1 +
  c_0 eta_e xi_(i j) xi_(k j) #scale(x: 120%, y: 120%)[\)] + o \( 1 \) \, $ <eq:rank-layer>]

 where the $eta_e$, $e in E$, are independent uniform signs.
   The error is uniform over all such $B$ and sign choices. The same assertion holds with $Y_j -
   X_i$ in place of $X_i - Y_j$.]
] <lem:rank-layer>

The averaging on the right has a useful exact form. For $e = { v \, w } in E$, let $j \, l$ be its two faces and put

#[#set math.equation(numbering: n => "(3.3)")
 $ U_e = { \( v \, j \) \, \( w \, j \) \, \( v \, l \) \, \( w \, l \) } subset.eq cal(C) . $ <eq:kernel-four-corners>]

Write $xi_kappa = xi_(i j)$ for $kappa = \( i \, j \) in B$.
  If only one of the two face factors on $e$ is present, its average over $eta_e$ is $1$.
  If both are present, their average is $1 + product_(kappa in U_e) xi_kappa$, since $c_0^2 = 1$.
  Independence of the $eta_e$ therefore gives

#[#set math.equation(numbering: n => "(3.4)")
 $ bb(E)_eta product_(j in J) product_(e = { i \, k } subset j\
\( i \, j \) \, \( k \, j \) in B) \( 1 + c_0 eta_e xi_(i j) xi_(k j) \) = product_(e in E\
U_e subset.eq B) (1 + product_(kappa in U_e) xi_kappa) . $ <eq:kernel-parity-model>]

Thus every fully active pair tests the parity of its four incidence signs, contributing $0$ or $2$.
  This is an identity for the integrated sign model in Equation (3.2).
  The quantification over $B$ is needed because each coordinate in the activation construction below selects its
  own active incidences.

The proof of Lemma 5 occupies Sections 4–7. The dimension is fixed before the prime tends to infinity;
  uniformity in $B$ and the signs then concerns a fixed finite family.
  For the assertion with reversed matrix differences, negation multiplies the sign of a rank-$r$ matrix by $c_0$
  and bijects the corresponding layers, whence $K_xi \( - Z \) = K_(c_0 xi) \( Z \)$.
  Replacing every incidence sign by $c_0 xi_(i j)$ leaves each sign product on the right of Equation (3.2) unchanged.

For a kernel $W : cal(X) times cal(Y) arrow.r \[ 0 \, oo \)$ on two finite probability spaces, write

#[#set math.equation(numbering: n => "(3.5)")
 $ t_(I \, J) \( W \) = bb(E) product_(\( i \, j \) in cal(C)) W \( x_i \, y_j \) \, wide W^top \( y \, x \) =
   W \( x \, y \) \, $ <eq:kernel-bipartite-density>]

where all $x_i in cal(X)$ and $y_j in cal(Y)$ are sampled independently.
  Thus $t_(I \, J) \( W^top \)$ samples the $I$-vertices from $cal(Y)$ and the $J$-vertices from $cal(X)$.

For a symmetric kernel $U : Omega times Omega arrow.r \[ 0 \, oo \)$ on one finite probability space,
  write $t \( H \, U \) = t_(I \, J) \( U \)$, with every vertex sampled independently from $Omega$;
  sampled labels may coincide.

=== 3.2 Activation laws and the coordinate expansion <activation-laws-and-the-coordinate-expansion>

A type records which point or face of the fixed complex a sampled vertex is intended to represent.
  Independent matrix coordinates carry separate copies of the rank-layer model,
  and an activation law chooses which copies occur at a pair of types.
  We first leave these finite choices arbitrary and derive their contribution to the density.

Let $cal(A) \, cal(B)$ be finite type sets, with probability distributions $pi \, nu$,
  and let $cal(K)$ be a fixed finite coordinate set. Use the spaces

$ cal(X) = cal(A) times cal(S)_D^(cal(K)) \, wide cal(Y) = cal(B) times cal(S)_D^(cal(K)) \, $

with the type distributions just specified and all matrix coordinates independent and uniform.
  For each $\( a \, b \) in cal(A) times cal(B)$, choose a probability law on a subset $S subset.eq
  cal(K)$ and signs $\( xi_kappa \)_(kappa in S)$. Define

#[#set math.equation(numbering: n => "(3.6)")
 $ W_q #scale(x: 120%, y: 120%)[\(] \( a \, x \) \, \( b \, y \) #scale(x: 120%, y: 120%)[\)] =
   bb(E)_(S \, xi divides a \, b) product_(kappa in S) K_(xi_kappa) \( x^kappa - y^kappa \) . $ <eq:kernel-activation>]

An empty product is one. For fixed types, averaging over the matrices gives one,
  since each difference is uniform and distinct coordinates are independent. Therefore $bb(E) W_q = 1$, for every $q$.

For $alpha subset.eq cal(K)$ put

$ phi.alt_alpha \( S \, xi \) = upright(bold(1))_({ alpha subset.eq S }) product_(kappa in alpha) xi_kappa \, wide
  A_(a b) \( alpha \, beta \) = bb(E)_(S \, xi divides a \, b) phi.alt_alpha phi.alt_beta . $

Here $phi.alt_alpha$ is defined to be zero when $alpha subset.eq.not S$; in particular $phi.alt_diameter = 1$.
  We will impose the moment condition

#[#set math.equation(numbering: n => "(3.7)")
 $ bb(E)_(S \, xi divides a \, b) phi.alt_alpha = 0 quad upright("for every ") a \,
   b upright(" and every nonempty ") alpha upright(".") $ <eq:kernel-zero-moments>]

If $alpha ∩ beta = diameter$, then $phi.alt_alpha phi.alt_beta = phi.alt_(alpha union beta)$, so

#[#set math.equation(numbering: n => "(3.8)")
 $ A_(a b) \( alpha \, beta \) = 0 quad upright("if ") alpha ∩ beta = diameter upright(" and
 ") alpha union beta eq.not diameter upright(".") $ <eq:kernel-disjoint-zero>]

At a corner $\( i \, j \)$, let $e \( i \, j \) \, f \( i \, j \)$ denote the two point pairs of $j$ containing
  $i$; their order is immaterial. Expanding Equation (3.4) at every coordinate selects, for each pair $e$,
  a subset $alpha_e subset.eq cal(K)$ of coordinates at which its four-sign term is used.
  At a corner, the two labels meeting there contribute their overlap moment
  $A_(a b) \( alpha_(e \( i \, j \)) \, alpha_(f \( i \, j \)) \)$.
  For type assignments $a : I arrow.r cal(A)$, $b : J arrow.r cal(B)$, define

#[#set math.equation(numbering: n => "(3.9)")
 $ C_A \( a \, b \) = sum_(alpha_e subset.eq cal(K) med \( e in E \)\
alpha_e eq.not diameter med \( e in E \)) product_(\( i \, j \) in cal(C)) A_(a \( i \) b \( j \))
  #scale(x: 120%, y: 120%)[\(] alpha_(e \( i \, j \)) \, alpha_(f \( i \, j \)) #scale(x: 120%, y: 120%)[\)] .
  $ <eq:kernel-coefficient>]

These are finite real numbers, with no restriction on either type map.
  In particular, repetitions of types are included. The next lemma identifies this all-nonempty label sum as the
  limiting nonconstant contribution at the fixed type assignment.

#thm([Lemma 3.2.])[
  (Coordinate expansion).  #emph[Assume Equation (3.7) and fix an even dimension as in Lemma 5.
    For fixed type laws and activation laws,
#[#set math.equation(numbering: n => "(3.10)")
 $ t_(I \, J) \( W_q \) & = 1 + sum_(a : I arrow.r cal(A) thin \, med b : J arrow.r cal(B))
   (product_(i in I) pi_(a \( i \))) (product_(j in J) nu_(b \( j \))) C_A \( a \, b \) +
   o \( 1 \) . $ <eq:kernel-expansion>]

 The corresponding formula for $W_q^top$ has type maps $b : I arrow.r cal(B)$, $a : J arrow.r
   cal(A)$ and the corner factors $A_(a \( j \) b \( i \))$.]
] <lem:kernel-expansion>

#proof[
  Conditional on all types, sample an activation law independently at each incidence when expanding the product in
    Equation (3.5). Conditional on these samples, the matrix integral factors across coordinates.
    At coordinate $kappa$ apply Lemma 5 with the active set of incidences for which $kappa in S$,
    and with their sampled signs. Use Equation (3.4) at each coordinate.
    There are only finitely many activation and sign configurations.
    The model expectations are bounded, and their approximating matrix expectations are consequently bounded for
    large $q$. A finite product and then the finite average therefore preserve the $o \( 1 \)$ error.
  Expand these finite parity products, and let $alpha_e$ be the set of coordinates in which the four-sign term for
    $e$ is selected. A coordinate selected for $e$ requires activation at all four corners in $U_e$ and
    contributes the product of their signs. At $\( i \, j \)$ the two subsets on its incident pairs give exactly
    $phi.alt_(alpha_(e \( i \, j \))) phi.alt_(alpha_(f \( i \, j \)))$;
    averaging that incidence’s activation and signs gives its factor $A$.
    Thus the limiting contribution at the fixed type assignment is
  #[#set math.equation(numbering: n => "(3.11)")
   $ sum_(alpha_e subset.eq cal(K) med \( e in E \)) product_(\( i \, j \) in cal(C)) A_(a \( i \) b \( j \))
     #scale(x: 120%, y: 120%)[\(] alpha_(e \( i \, j \)) \, alpha_(f \( i \, j \)) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:kernel-unrestricted-labels>]
  Repeated vertex types leave the matrix draws at distinct source vertices independent.
    Repeated type pairs use independent samples from the same activation law at their distinct source incidences.
  The all-empty labeling contributes one. In any other nonzero term,
    no face can have both an empty and a nonempty pair label:
    the two meet at a corner, where Equation (3.8) makes the factor zero.
    Hence any face with one nonempty label has all three labels nonempty.
    The shared-pair labels and connectedness of the face-neighbor graph propagate this conclusion to every face.
    Thus the remaining labels are exactly those summed in Equation (3.9). This proves Equation (3.10).
    For the transpose, the same argument uses the last assertion of Lemma 5. ◻
]

=== 3.3 A single negative term <a-single-negative-term>

The problem is now finite: choose activation laws so that the weighted coefficient sum in Equation (3.10) is
  negative. We first make the coefficient at the identity type assignment negative,
  and then choose the priors and thinning factors to make it dominate the other assignments.

Take $cal(A) = I$, $cal(B) = J$, and one coordinate for each corner: $cal(K) = cal(C)$.
  The four-incidence set $U_e$ from Equation (3.3) is now also a subset of the coordinate set.
  At a corner $kappa = \( v \, j \)$, write $e \, f$ for the two pairs of $j$ through $v$ and put

#[#set math.equation(numbering: n => "(3.12)")
 $ M_kappa = U_e union U_f \, wide Gamma_kappa = U_e triangle.stroked.t U_f . $ <eq:kernel-seven-six>]

Distinct faces cannot share two distinct pairs. Hence the opposite faces on $e \, f$ are distinct and $U_e ∩ U_f =
  { kappa }$. In particular $M_kappa$ has seven coordinates and $Gamma_kappa = M_kappa \\ { kappa }$ has six.
  Figure 2 displays these sets.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((-1.25, 0), radius: (2.05, 1.45), fill: rgb("#ededff"), stroke: none)
  circle((1.25, 0), radius: (2.05, 1.45), fill: rgb("#fff4e8"), stroke: none)
  circle((-1.25, 0), radius: (2.05, 1.45), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  circle((1.25, 0), radius: (2.05, 1.45), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10))
  content((-2.4, 1.35), [#text(fill: rgb("#000099"))[#text(size: 9pt)[$U_e$]]])
  content((2.4, 1.35), [#text(fill: rgb("#b25a00"))[#text(size: 9pt)[$U_f$]]])
  content((-1.7, 0.75), [#text(size: 9pt)[$(w,j)$]])
  content((-2, -0.1), [#text(size: 9pt)[$(v,l)$]])
  content((-1.45, -0.85), [#text(size: 9pt)[$(w,l)$]])
  content((1.7, 0.75), [#text(size: 9pt)[$(z,j)$]])
  content((2, -0.1), [#text(size: 9pt)[$(v,m)$]])
  content((1.45, -0.85), [#text(size: 9pt)[$(z,m)$]])
  circle((0, 0.55), radius: 0.05997, fill: rgb("#1f4366"), stroke: none)
  content((0, -0.05), [#text(size: 9pt)[$kappa$#linebreak()$=(v,j)$]])
  content((0, -1.9), [#text(size: 9pt)[$M_ kappa =U_e union U_f, Gamma_ kappa =M_ kappa without \{ kappa \}$]])
})],
  caption: [Figure 2: The seven coordinates available at the corner $kappa = \( v \, j \)$, where $j = { v \, w \, z }$, $e = { v \, w }$ and $f = { v \, z }$. The opposite faces on $e$ and $f$ are $l$ and $m$. The two activation branches keep the same six outer coordinates; one also keeps the common corner marked by the dot. ],
) <fig:kernel-corner-activation>

Fix $0 < theta < 1$. Give each corner a sign $sigma_kappa$, choosing exactly one negative sign,
  for example $sigma_(\( 0 \, 0 \)) = - 1$ and all others $+ 1$.
  At the type pair $kappa = \( v \, j \)$ with $v in j$ use this #emph[base law]:

- with probability $1 \/ 2$, set $S = M_kappa$ and give each sign vector on $S$ probability
  $2^(- 7) \( 1 + sigma_kappa theta product_(gamma in Gamma_kappa) xi_gamma \)$;
- with probability $1 \/ 2$, set $S = Gamma_kappa$ and give each sign vector on $S$ probability
  $2^(- 6) \( 1 - sigma_kappa theta product_(gamma in Gamma_kappa) xi_gamma \)$.

These conditional masses are positive and sum to one because a nonempty sign monomial has zero average under
  uniform signs. At a nonincident type pair $\( v \, j \)$ use $S = diameter$ deterministically.
  Write $A^(upright("base"))$ for the resulting moments.

Under either branch at a corner, the only nonempty sign monomial with possibly nonzero expectation has index
  $Gamma_kappa$. Its conditional expectations are respectively $sigma_kappa theta$ and $- sigma_kappa theta$.
  The two effects of the branch choice are

#[#set math.equation(numbering: n => "(3.13)")
 $ bb(E) phi.alt_(Gamma_kappa) = 1 / 2 sigma_kappa theta - 1 / 2 sigma_kappa theta = 0 \, wide
   A_kappa^(upright("base")) \( U_e \, U_f \) = 1 / 2 sigma_kappa theta . $ <eq:kernel-branch-biases>]

The second identity holds because only the $M_kappa$ branch contains $U_e union U_f$,
  while their sign product is the $Gamma_kappa$ monomial. All base laws satisfy Equation (3.7),
  but this overlap moment can have either sign. More explicitly, for $Q = alpha union beta$ and $R =
  alpha triangle.stroked.t beta$,

#[#set math.equation(numbering: n => "(3.14)")
 $ A_kappa^(upright("base")) \( alpha \, beta \) & = 1 / 2 upright(bold(1))_({ Q subset.eq M_kappa })
   #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ R = diameter }) +
   sigma_kappa theta upright(bold(1))_({ R = Gamma_kappa }) #scale(x: 120%, y: 120%)[\)]\
 & quad + 1 / 2 upright(bold(1))_({ Q subset.eq Gamma_kappa }) #scale(x: 120%, y: 120%)[\(]
   upright(bold(1))_({ R = diameter }) - sigma_kappa theta upright(bold(1))_({ R = Gamma_kappa })
   #scale(x: 120%, y: 120%)[\)] . $ <eq:kernel-base-moment>]

#thm([Lemma 3.3.])[
  (Support forcing).  #emph[At the identity type assignments $a \( i \) = i$, $b \( j \) = j$,
    the sum in Equation (3.9) for the base laws has exactly one nonzero term. Its labels and value are
#[#set math.equation(numbering: n => "(3.15)")
 $ alpha_e = U_e quad \( e in E \) \, wide
   C_(A^(upright("base"))) \( upright("id") \, upright("id") \) = - \( theta \/ 2 \)^66 . $ <eq:kernel-negative-term>]

]
] <lem:kernel-support>

#proof[
  We first prove the support identity
  #[#set math.equation(numbering: n => "(3.16)")
   $ ⋂_(kappa in U_g) M_kappa = U_g wide \( g in E \) . $ <eq:kernel-support-intersection>]
  The same set $cal(C)$ indexes coordinates $gamma$ and activation corners $kappa$. Availability is symmetric:
    $gamma in M_kappa$ if and only if $kappa in M_gamma$. Both conditions mean that the two corners lie in a
    common set $U_e$. Fix a coordinate $gamma = \( v \, j \)$, write $j = { v \, w \, z }$, and let $e = { v \,
    w }$, $f = { v \, z }$ have opposite faces $l \, m$, respectively.
    This coordinate belongs to precisely $U_e$ and $U_f$. Consequently it is available at exactly the following
    activation corners: all three corners of $j$, the two $e$-endpoint corners of $l$,
    and the two $f$-endpoint corners of $m$. To be available at all four corners of $g$,
    its two faces must therefore be among $j \, l \, m$. The choice $j \, l$ forces $g = e$, and $j \,
    m$ forces $g = f$, since distinct triples share at most one pair. The choice $l \, m$ cannot work:
    its two endpoints would both have to lie in ${ v \, w } ∩ { v \, z } = { v }$.
    Thus the coordinate $gamma$ is available at every corner of $g$ if and only if $g in { e \, f }$,
    equivalently if and only if $gamma in U_g$. This proves Equation (3.16).
  In a nonzero identity-type term, $alpha_g$ must lie in the maximal activation support at each of the four
    corners of $g$. Hence $alpha_g subset.eq U_g$. At a corner $kappa$ with pairs $e \, f$,
    the two nonempty labels cannot be disjoint by Equation (3.8).
    Since $U_e ∩ U_f = { kappa }$, both labels contain $kappa$.
    Applying this at all four corners of $g$ gives $alpha_g = U_g$.
  For these labels, Equation (3.13) gives the local factor $sigma_kappa theta \/ 2$.
    Multiplying the $66$ factors, with exactly one negative $sigma_kappa$, proves the assertion. ◻
]

Each local matrix $A_kappa^(upright("base"))$ is positive semidefinite,
  being a matrix of second moments of the random variables $phi.alt_alpha$.
  For example its principal block on $U_e \, U_f$ is

$ mat(delim: "(", 1 \/ 2, sigma_kappa theta \/ 2; sigma_kappa theta \/ 2, 1 \/ 2) \, $

with eigenvalues $\( 1 + theta \) \/ 2$ and $\( 1 - theta \) \/ 2$.
  Thus the negative global term uses an admissible negative off-diagonal moment.
  The support argument proves that local diagonal alternatives cannot form any additional nonempty global labeling
  at the identity types.

=== 3.4 Pinning the types by color refinement <pinning-the-types-by-color-refinement>

The identity calculation alone does not control the kernel density:
  the expansion averages over every type assignment, including maps with repetitions.
  We now give the identity strictly larger score than every competitor.
  The following lemma applies to any bipartite graph whose part colors refine to distinct vertex colors.

#thm([Lemma 3.4.])[
  (Pinning by vertex and pair scores).  #emph[Let $F = \( P union.sq Q \, L \)$ be a finite bipartite graph for
    which color refinement, starting with the two part colors, becomes discrete within each part.
    There are real vertex scores $s_t$, $t in P union.sq Q$, and pair scores $s_(a b)$, $\( a \, b \) in P times
    Q$, such that the identity is the unique maximizer of
#[#set math.equation(numbering: n => "(3.17)")
 $ cal(Q) \( f \) = sum_(u in P union.sq Q) s_(f \( u \)) +
   sum_({ u \, v } in L \, med u in P) s_(f \( u \) f \( v \)) $ <eq:kernel-pinning-score>]

 over #emph[all] maps $f$ preserving the two parts. In particular the maximum has a positive gap from every other
   such map; no injectivity or adjacency-preservation condition is imposed.]
] <lem:pinning>

#proof[
  Let $ell_0$ be the two part colors and, at round $t$, let $h_t \( u \)$ be the histogram of $ell_(t - 1)$-colors
    among the neighbors of $u$. The new color is $ell_t \( u \) = \( ell_(t - 1) \( u \) \, h_t \( u \) \)$.
    Choose $R gt.eq 1$ rounds giving a discrete coloring. At round $t$ assign the vertex score $-
    parallel h_t \( a \) parallel^2$ to type $a$ and the pair score
  $ 2 h_t \( a \) \( ell_(t - 1) \( b \) \) + 2 h_t \( b \) \( ell_(t - 1) \( a \) \) $
  to every $\( a \, b \) in P times Q$, including nonedges. The total round score of $f$ is
  $ F_t \( f \) = - sum_u parallel h_t \( f \( u \) \) parallel^2 +
    2 sum_u sum_(v in N_F \( u \)) h_t \( f \( u \) \) #scale(x: 120%, y: 120%)[\(] ell_(t - 1) \( f \( v \) \)
    #scale(x: 120%, y: 120%)[\)] . $
  Here $N_F \( u \)$ is the neighbor set of $u$. Both sums are indexed by the vertices and directed incidences of
    the source graph $F$, even when $f$ repeats a type.
  If $ell_(t - 1) \( f \( u \) \) = ell_(t - 1) \( u \)$ for every $u$,
    the inner neighbor sum equals $chevron.l h_t \( f \( u \) \) \, h_t \( u \) chevron.r$. Thus
  #[#set math.equation(numbering: n => "(3.18)")
   $ F_t \( f \) & = sum_u #scale(x: 120%, y: 120%)[\(] 2 chevron.l h_t \( f \( u \) \) \, h_t \( u \) chevron.r -
     parallel h_t \( f \( u \) \) parallel^2 #scale(x: 120%, y: 120%)[\)]\
 & = sum_u parallel h_t \( u \) parallel^2 - sum_u parallel h_t \( f \( u \) \) -
   h_t \( u \) parallel^2 . $ <eq:kernel-pinning-square>]
  The first equality uses only preservation of previous colors.
    It therefore applies to noninjective maps and to maps taking edges to nonedges.
    In this situation $F_t \( upright("id") \) - F_t \( f \)$ is a nonnegative integer,
    zero precisely when $f$ also preserves all new colors.
  To combine the rounds into a single score, set
  $ M = max_(f \, thin 1 lt.eq t lt.eq R) \| F_t \( f \) - F_t \( upright("id") \) \| \, wide L_0 = M + 2 \, wide
    cal(Q) \( f \) = sum_(t = 1)^R L_0^(R - t) F_t \( f \) . $
  The maximum defining $M$ is finite. For a nonidentity map,
    let $t$ be the first round at which a color fails to be preserved.
    All earlier scores tie the identity; the loss at round $t$ is at least $L_0^(R - t)$.
    Its possible later advantage is at most
  $ M sum_(j = 0)^(R - t - 1) L_0^j < L_0^(R - t) . $
  Hence its total score is strictly smaller. A nonidentity map must have such a first round because the final
    colors are discrete. The weighted sums of the round vertex scores and pair scores are the required $s_t \,
    s_(a b)$. Finiteness of the set of maps gives the positive gap. ◻
]

Apply Lemma 8 to $H$, using Proposition 4. Let its scores be $s_a$ on $I$, $s_b$ on $J$, and $s_(a b)$ on $I times
  J$. For a positive parameter $rho$, choose priors and thinning probabilities

#[#set math.equation(numbering: n => "(3.19)")
 $ pi_a = e^(rho s_a) / Z_I \, wide nu_b = e^(rho s_b) / Z_J \, wide lambda_(a b) =
   e^(rho \( s_(a b) - s_max \)) \, wide s_max = max_(a \, b) s_(a b) \, $ <eq:kernel-priors>]

where $Z_I = sum_(a in I) e^(rho s_a)$ and $Z_J = sum_(b in J) e^(rho s_b)$.
  Since $0 < lambda_(a b) lt.eq 1$, the following is a probability law:
  use the entire base law with probability $lambda_(a b)$, and use $S = diameter$ otherwise.
  Its moments satisfy the exact identity

#[#set math.equation(numbering: n => "(3.20)")
 $ A_(a b)^lambda \( alpha \, beta \) =
   lambda_(a b) A_(a b)^(upright("base")) \( alpha \, beta \) + \( 1 - lambda_(a b) \)
   upright(bold(1))_({ alpha = beta = diameter }) . $ <eq:kernel-thinning>]

This preserves Equation (3.7). In every all-nonempty term it introduces one factor $lambda_(a b)$ per incidence,
  independently of the sizes of the coordinate subsets.

Let $C \( a \, b \) = C_(A^(upright("base"))) \( a \, b \)$ and let $t_0$ be the coefficient of the nonempty terms
  in Equation (3.10) for the thinned laws and these priors. By Equation (3.20),

#[#set math.equation(numbering: n => "(3.21)")
 $ t_0 & = Z_I^(- 13) Z_J^(- 22) e^(- 66 rho s_max) sum_(a : I arrow.r I thin \, med b : J arrow.r J)
   C \( a \, b \) e^(rho cal(Q) \( a \, b \)) . $ <eq:kernel-pinned-coefficient>]

All normalizing factors outside the sum are common to every map.
  Here $cal(Q) \( a \, b \)$ means the score of the part-preserving map specified by $a \, b$.

Write $Q_(*) = cal(Q) \( upright("id") \, upright("id") \)$, and let

$ delta_(*) = min_(\( a \, b \) eq.not \( upright("id") \, upright("id") \)) \( Q_(*) - cal(Q) \( a \, b \) \) >
  0 \, wide B_(*) = sum_(\( a \, b \) eq.not \( upright("id") \, upright("id") \)) \| C \( a \, b \) \| < oo . $

After division by $e^(rho Q_(*))$, the absolute value of the competitor sum is at most $B_(*)
  e^(- rho delta_(*))$. Choose a fixed finite $rho > 0$ large enough that

#[#set math.equation(numbering: n => "(3.22)")
 $ B_(*) e^(- rho delta_(*)) < \( theta \/ 2 \)^66 \; $ <eq:kernel-finite-gap>]

if $B_(*) = 0$, any positive $rho$ suffices. By Equation (3.15) this makes $t_0 < 0$.

=== 3.5 Dilution, symmetrization, and finite hosts <dilution-symmetrization-and-finite-hosts>

We have made the limiting nonempty coefficient negative in one orientation.
  The symmetric kernel below multiplies the densities in both orientations.
  Dilution makes the negative term dominate the unknown term from the other orientation.

Keep $theta \, rho$, the priors, and all the thinned laws fixed.
  Add an inactive type $*$ to $cal(A) = I$, giving it probability $1 -
  epsilon$ and giving each old type $a$ probability $epsilon pi_a$, where $0 < epsilon < 1$.
  Every pair involving $*$ uses $S = diameter$. Keep the $J$-type prior $nu$ unchanged.
  Let $W_(q \, epsilon)$ be the resulting kernel.

For precision, define also the finite coefficient for the opposite orientation before dilution:

#[#set math.equation(numbering: n => "(3.23)")
 $ t_1 =  & sum_(b : I arrow.r J thin \, med a : J arrow.r I) (product_(i in I) nu_(b \( i \)))
   (product_(j in J) pi_(a \( j \))) sum_(alpha_e subset.eq cal(C) med \( e in E \)\
alpha_e eq.not diameter med \( e in E \)) product_(\( i \, j \) in cal(C)) A_(a \( j \) b \( i \))^lambda
  #scale(x: 120%, y: 120%)[\(] alpha_(e \( i \, j \)) \, alpha_(f \( i \, j \)) #scale(x: 120%, y: 120%)[\)] .
  $ <eq:kernel-transpose-coefficient>]

Both $t_0 < 0$ and $t_1 in bb(R)$ are independent of $q$ and $epsilon$.

In a nonempty-label term, a vertex with inactive type gives a zero factor on each of its incidences.
  Every vertex of $H$ has positive degree, so every original $I$-type draw must be active.
  There are $13$ such draws for $W_(q \, epsilon)$ and $22$ for its transpose.
  Lemma 6 therefore gives the exact limiting coefficients

#[#set math.equation(numbering: n => "(3.24)")
 $ t_(I \, J) \( W_(q \, epsilon) \) & = 1 + epsilon^13 t_0 + o \( 1 \) \,\
t_(I \, J) \( W_(q \, epsilon)^top \) & = 1 + epsilon^22 t_1 + o \( 1 \) . $ <eq:kernel-dilution>]

These errors tend to zero with $q$ after $epsilon$ is fixed. In particular, the limiting product is

#[#set math.equation(numbering: n => "(3.25)")
 $ \( 1 + epsilon^13 t_0 \) \( 1 + epsilon^22 t_1 \) = 1 + epsilon^13 #scale(x: 120%, y: 120%)[\(] t_0 +
   epsilon^9 t_1 + epsilon^22 t_0 t_1 #scale(x: 120%, y: 120%)[\)] < 1 $ <eq:kernel-product-gap>]

for all sufficiently small positive $epsilon$, because the bracket tends to $t_0 < 0$.
  Choose one such $epsilon$ and then a sufficiently large odd prime $q$.
  The cancellation of $c_0$ in the coordinate expansion makes the limiting coefficients independent of the
  congruence class of $q$. The resulting fixed kernel $W$ is nonnegative, finite, has mean one, and satisfies

#[#set math.equation(numbering: n => "(3.26)")
 $ t_(I \, J) \( W \) t_(I \, J) \( W^top \) < 1 . $ <eq:kernel-oriented-gap>]

#thm([Proposition 3.5.])[
  #emph[Assuming Lemma 5, there is a symmetric kernel $U : Omega times
    Omega arrow.r \[ 0 \, 1 \]$ on a finite probability space with mean $mu > 0$ such that
#[#set math.equation(numbering: n => "(3.27)")
 $ t \( H \, U \) < mu^66 . $ <eq:kernel-symmetric-gap>]

]
] <prop:negative-kernel>

#proof[
  Use the kernel $W : cal(X) times cal(Y) arrow.r \[ 0 \, oo \)$ just constructed and set $Omega = cal(X) times
    cal(Y)$ with product probability. Define
  #[#set math.equation(numbering: n => "(3.28)")
   $ V #scale(x: 120%, y: 120%)[\(] \( x \, y \) \, \( x' \, y' \) #scale(x: 120%, y: 120%)[\)] =
     W \( x \, y' \) W \( x' \, y \) . $ <eq:kernel-crossed-product>]
  This kernel is symmetric, nonnegative, and has mean one: the two factors on the right use independent variables
    and each has mean one. In its product over $H$, the factors using $x_i$ for $i in I$ and $y_j$ for $j in
    J$ are independent of those using $y_i$ for $i in I$ and $x_j$ for $j in J$. Therefore
  $ t \( H \, V \) = t_(I \, J) \( W \) t_(I \, J) \( W^top \) < 1 . $
  Let $L = max V$, which is finite and at least one, and set $U = V \/ L$.
    Then $0 lt.eq U lt.eq 1$, $mu = bb(E) U = 1 \/ L > 0$, and homogeneity gives $t \( H \, U \) =
    L^(- 66) t \( H \, V \) < L^(- 66) = mu^66$. ◻
]

We use the standard independent sampling construction for graphons #cite(label("lovaszszegedy2006")) Section 2.6,
  Lemma 2.4. The following argument keeps the collision error explicit and counts all homomorphisms.

#thm([Lemma 3.6.])[
  (Transfer to a finite simple host).  #emph[Suppose $U$ is a symmetric $\[ 0 \, 1 \]$-valued kernel on a finite
    probability space, $mu = bb(E) U > 0$, and
$ tau = t \( H \, U \) \, wide Delta = mu^66 - tau > 0 . $

 For any integer
#[#set math.equation(numbering: n => "(3.29)")
 $ n > frac(595 + 66 mu^66, Delta) \, $ <eq:kernel-host-size>]

 there is a finite simple graph $G$ on $n$ vertices with $t \( H \, G \) < p \( G \)^66$.]
] <lem:finite-host>

#proof[
  Sample labels $z_1 \, dots.h \, z_n$ independently from the probability space of $U$.
    Conditional on these labels, put an edge on each unordered pair of distinct vertices ${ a \,
    b }$ independently with probability $U \( z_a \, z_b \)$. No loops are drawn.
    This defines a random finite simple undirected graph $G_n$, and
  #[#set math.equation(numbering: n => "(3.30)")
   $ bb(E) p \( G_n \) = \( 1 - 1 \/ n \) mu . $ <eq:kernel-host-mean>]
  For every injective map $f : V \( H \) arrow.r { 1 \, dots.h \, n }$,
    its image vertices have independent labels, and its $66$ source edges use distinct unordered host pairs.
    Its probability of being a homomorphism is exactly $tau$.
    Among all $n^35$ maps, the proportion that identify any two source vertices is at most $binom(35, 2) \/ n =
    595 \/ n$, by the union bound. Each such map has a homomorphism indicator between zero and one;
    a collision on a source edge gives zero, while any repeated host edges are counted by their actual single
    Bernoulli trials. No independence claim for these maps is needed.
    Comparing their contribution with $tau$ times their proportion gives
  #[#set math.equation(numbering: n => "(3.31)")
   $ \| bb(E) t \( H \, G_n \) - tau \| lt.eq 595 / n . $ <eq:kernel-collision-bound>]
  Thus the density still counts all homomorphisms, including every noninjective one.
  Using $\( 1 - 1 \/ n \)^66 gt.eq 1 - 66 \/ n$, Equations (3.29) and (3.31) give
  $ bb(E) t \( H \, G_n \) & lt.eq mu^66 - Delta + 595 \/ n\
 & < mu^66 - 66 mu^66 \/ n\
 & lt.eq #scale(x: 120%, y: 120%)[\(] \( 1 - 1 \/ n \) mu #scale(x: 120%, y: 120%)[\)]^66 =
   #scale(x: 120%, y: 120%)[\(] bb(E) p \( G_n \) #scale(x: 120%, y: 120%)[\)]^66 lt.eq
   bb(E) #scale(x: 120%, y: 120%)[\[] p \( G_n \)^66 #scale(x: 120%, y: 120%)[\]] . $
  The last inequality is convexity. Hence some realization has $t \( H \, G_n \) < p \( G_n \)^66$.
    Such a realization cannot be edgeless. ◻
]

Proposition 9 and Lemma 10 prove Theorem 1 conditional only on Lemma 5.
  To summarize the order of choices, fix a sufficiently large even $D$, the $66$ coordinates and $theta$,
  then the scores and a finite $rho$ satisfying Equation (3.22),
  then a positive $epsilon$ satisfying Equation (3.25), and then a sufficiently large odd prime $q$.
  Only after fixing and scaling this finite kernel are $mu \, Delta$ and the host size $n$ chosen.
  Sections 4–7 establish the required rank-layer limit.

== 4 Transverse configurations and determinant signs <sec:transverse>

We begin the proof of Lemma 5 with the configurations whose point differences are nonsingular.
  Throughout this section $D = 2 r$ is fixed, $q$ tends to infinity through odd primes,
  and constants in $O \( dot.op \)$ may depend on $D$. We use $b \( n \) = n \( n + 1 \) \/ 2$,
  including $b \( 0 \) = 0$. The estimates concerning growing $D$ will be made separately in Section 7.

On triples with nonsingular point differences, for two or three active incidences on a face,
  the sign model has value $2$ or $8$ when every active pair satisfies $chi \( det \( X_i - X_k \) \) =
  c_0 xi_(i j) xi_(k j)$, and value $0$ when a match fails.
  For $r > 1$, we will approximate the normalized center factor by this model in $L^1$ on these triples,
  and bound that factor uniformly there. These estimates permit multiplication over faces sharing point matrices.
  The preliminary counts fix the layer normalizations and enumerate the candidate subspaces;
  restriction-sign balance supplies the final factor $1 \/ 2$.
  We then prove that the determinant signs on all $33$ point pairs have an asymptotically independent joint law.

=== 4.1 Symmetric forms over a finite field <symmetric-forms-over-a-finite-field>

The discriminant sign of a symmetric form is the quadratic character of the determinant of its induced
  nondegenerate form on the quotient by its radical. A change of basis multiplies this determinant by a square,
  so its character is well defined. In dimension zero the determinant is understood to be $1$.

Rank and discriminant sign are the standard invariants of symmetric bilinear forms over a finite field of odd
  order. Exact counts by these invariants appear, for example, in Schmidt #cite(label("schmidt2015")) Section 2,
  Proposition 2.1. We give the elementary estimates needed here, with their proofs.

#thm([Lemma 4.1.])[
  (Subspaces and symmetric matrices).  #emph[For $0 lt.eq k lt.eq n$,
    the number of $k$-dimensional subspaces of $bb(F)_q^n$ is
#[#set math.equation(numbering: n => "(4.1)")
 $ [n / k]_q = product_(a = 0)^(k - 1) frac(q^n - q^a, q^k - q^a) =
   q^(k \( n - k \)) \( 1 + O \( q^(- 1) \) \) . $ <eq:transverse-grassmann>]

 For a uniform matrix $M in cal(S)_n$, with $n gt.eq 1$,
$ bb(P) \( M upright(" is nonsingular") \) = 1 - O \( q^(- 1) \) \, wide bb(P) \( chi \( det M \) = xi \) = 1 /
  2 + O \( q^(- 1) \) quad \( xi in { + 1 \, - 1 } \) . $

 For $1 lt.eq k lt.eq n$, the probability of rank $k$ and prescribed discriminant sign is
#[#set math.equation(numbering: n => "(4.2)")
 $ (1 / 2 + O \( q^(- 1) \)) q^(- b \( n - k \)) . $ <eq:transverse-signed-rank>]

 Finally, for $0 lt.eq u lt.eq n$,
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(P) \( dim ker M gt.eq u \) = O \( q^(- b \( u \)) \) . $ <eq:transverse-nullity>]

]
] <lem:symmetric-counts>

#proof[
  Count ordered linearly independent $k$-tuples in $bb(F)_q^n$ and divide by the number of ordered bases of
    $bb(F)_q^k$ to obtain Equation (4.1). Its asymptotic follows by factoring out the displayed powers of $q$;
    all products have fixed length.
  For the nonsingularity and sign assertions, use induction on $n$.
    On the event that the leading $\( n - 1 \)$-dimensional principal minor $C$ is nonsingular, write
  $ M = mat(delim: "(", C, z; z^(sans(T)), a) \, wide det M = det C thin \( a - z^(sans(T)) C^(- 1) z \) . $
  Given $C \, z$, the final scalar factor is uniform on $bb(F)_q$.
    It is zero with probability $q^(- 1)$ and has either nonzero character with probability
    $\( q - 1 \) \/ \( 2 q \)$. The exceptional principal minor has probability $O \( q^(- 1) \)$ by induction.
    The same argument starts at $n = 1$ with the empty principal minor.
  For the rank assertion, fix a $k$-subspace $U$ with basis-column matrix $P$.
    Every symmetric matrix with image $U$ is uniquely $P R P^(sans(T))$ for a nonsingular symmetric $k$-by-$k$
    matrix $R$. Indeed, if $Q P$ is the identity, symmetry and the image condition give $M =
    P \( Q M Q^(sans(T)) \) P^(sans(T))$, and multiplication by $Q \, Q^(sans(T))$ also proves uniqueness.
    The surjection $P^(sans(T)) : bb(F)_q^n arrow.r bb(F)_q^k$ identifies the nondegenerate quotient form with
    $R$, so the discriminant sign is $chi \( det R \)$. Consequently the desired count is
  $ [n / k]_q thin q^(b \( k \)) (1 / 2 + O \( q^(- 1) \)) . $
  Divide by $q^(b \( n \))$ and use $k \( n - k \) + b \( k \) - b \( n \) = - b \( n - k \)$.
  For Equation (4.3), sum over $u$-subspaces $U$ contained in the radical.
    In a basis beginning with $U$, this containment sets to zero the first $u$ rows and columns, imposing $n u -
    binom(u, 2)$ independent linear conditions. A uniform symmetric form therefore has $U$ in its radical with
    probability $q^(- n u + binom(u, 2))$. Multiplication by $[n / u]_q =
    O \( q^(u \( n - u \)) \)$ gives the assertion. ◻
]

In particular, writing $pi_xi$ for the mass of the signed rank-$r$ layer in $cal(S)_D$, we have

#[#set math.equation(numbering: n => "(4.4)")
 $ pi_xi = (1 / 2 + O \( q^(- 1) \)) q^(- b \( r \)) \, wide pi_xi^(- 1) =
   2 q^(b \( r \)) \( 1 + O \( q^(- 1) \) \) . $ <eq:transverse-signed-mass>]

These are the normalizations in $K_xi$.

A subspace is #emph[totally isotropic] for a symmetric bilinear form if the form vanishes on every pair of vectors
  in that subspace. The next count is the split orthogonal counterpart of the symplectic counts in Section 5;
  see also Taylor #cite(label("taylor1992")) Exercise 11.3.

#thm([Lemma 4.2.])[
  (Split forms and their maximal isotropic subspaces).  #emph[Let $r gt.eq 1$.
    A nondegenerate symmetric form on a $2 r$-dimensional space over $bb(F)_q$ has an $r$-dimensional totally
    isotropic subspace if and only if its determinant character is $c_0 = chi \( \( - 1 \)^r \)$.
    Such a form is a direct orthogonal sum of $r$ hyperbolic planes.
    The total number of its $r$-dimensional totally isotropic subspaces is
#[#set math.equation(numbering: n => "(4.5)")
 $ N_r = product_(a = 0)^(r - 1) \( 1 + q^a \) = 2 q^(r \( r - 1 \) \/ 2) \( 1 + O \( q^(- 1) \) \) .
   $ <eq:transverse-isotropic-count>]

 The count includes both families of maximal isotropic subspaces.]
] <lem:transverse-split>

#proof[
  First, a nondegenerate symmetric form has an orthogonal basis.
    A nonzero form has a vector of nonzero norm, since otherwise polarization would make the form zero.
    Split off this nondegenerate line and continue on its orthogonal complement.
  For any $a \, b in bb(F)_q^times$ and $t in bb(F)_q$, the two sets ${ a x^2 : x in bb(F)_q }$ and ${ t - b y^2 :
    y in bb(F)_q }$ each have size $\( q + 1 \) \/ 2$ and therefore meet. Thus $a x^2 + b y^2 = t$ is solvable.
    A diagonal nondegenerate form in at least three variables consequently has a nonzero isotropic vector:
    solve $a x^2 + b y^2 = - c$ and set the third coordinate to $1$.
    Given an isotropic vector $e eq.not 0$, choose $f$ with $chevron.l e \, f chevron.r =
    1$ and replace $f$ by $f - chevron.l f \, f chevron.r e \/ 2$.
    The resulting plane has Gram matrix $mat(delim: "(", 0, 1; 1, 0)$ and splits off orthogonally.
    Repetition leaves an anisotropic space of dimension at most two.
    In dimension two, $a x^2 + b y^2$ is isotropic exactly when $chi \( - a b \) = 1$,
    or equivalently when its determinant character is $chi \( - 1 \)$.
    Each hyperbolic plane also has determinant character $chi \( - 1 \)$.
    This proves that the determinant condition is precisely the condition that the entire $2
    r$-space split into hyperbolic planes.
  A split form has the required isotropic subspace, spanned by one vector from each hyperbolic pair.
    Conversely, if such a subspace $U$ is given, split off a hyperbolic plane using $e in U$.
    Its orthogonal complement has an isotropic $\( r - 1 \)$-subspace:
    for $u in U$, replace $u$ by $u - chevron.l u \, f chevron.r e$.
    This linear map on $U$ has kernel $chevron.l e chevron.r$, so its image has dimension $r - 1$.
    Induction shows that the entire form is split.
  In split coordinates $\( x \, y \) in bb(F)_q^r xor bb(F)_q^r$, isotropy is the equation $x^(sans(T)) y = 0$.
    There are
  $ \( q^r - 1 \) q^(r - 1) + \( q^r - 1 \) = \( q^r - 1 \) \( q^(r - 1) + 1 \) $
  nonzero isotropic vectors. The quotient $ell^perp \/ ell$ by an isotropic line has dimension $2 r - 2$.
    Splitting off a hyperbolic plane through $ell$ identifies this quotient with its nondegenerate orthogonal
    complement, whose determinant character is $chi \( \( - 1 \)^(r - 1) \)$.
    The criterion just proved makes the quotient split. Count pairs $\( ell \, U \)$ with $ell subset U$ and $dim
    U = r$ to get
  $ N_r frac(q^r - 1, q - 1) = frac(\( q^r - 1 \) \( q^(r - 1) + 1 \), q - 1) N_(r - 1) . $
  With $N_0 = 1$, this gives the product in Equation (4.5).
    In particular $N_1 = 2$; no choice of one isotropic family has been imposed in this count. ◻
]

The isotropic-subspace count does not yet determine the sign of a second form on those subspaces.
  The following averaged estimate supplies that sign information for any sufficiently large family.

#thm([Lemma 4.3.])[
  (Concentration of restriction signs).  #emph[Let $cal(U)$ be any nonempty family of distinct $r$-subspaces of
    $bb(F)_q^D$, with $r gt.eq 1$, and let $Q$ be a uniform symmetric form. For $xi in { + 1 \, - 1 }$ put
$ f_xi \( Q \) =
  frac(1, \| cal(U) \|) sum_(U in cal(U)) upright(bold(1))_({ Q \|_U upright(" nonsingular of sign ") xi }) . $

 Uniformly over the family $cal(U)$,
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) lr(|f_xi \( Q \) - 1 / 2|) = O (q^(- 1 \/ 2) + \| cal(U) \|^(- 1 \/ 2)) . $ <eq:transverse-restriction-error>]

 The same bound holds after conditioning $Q$ to be nonsingular, or conditioning both $Q$ and $Q -
   L$ to be nonsingular, uniformly over every fixed symmetric form $L$.]
] <lem:transverse-restrictions>

#proof[
  Restriction onto a fixed subspace is a surjective linear map on spaces of symmetric forms,
    so each summand has expectation $1 \/ 2 + O \( q^(- 1) \)$ by Lemma 11.
    For distinct $U \, V in cal(U)$ write $T = U ∩ V$. Extend a basis of $T$ separately to bases of $U$ and $V$,
    and then to an ambient basis. In this basis, the coefficients defining the two restricted forms overlap
    exactly in the symmetric block on $T$. Thus any two forms on $U \,
    V$ agreeing on $T$ extend simultaneously to the ambient space; given $Q \|_T$,
    their remaining coefficients are independent and uniform.
  If $T$ has positive dimension, its restriction is nonsingular outside an event of probability $O \( q^(- 1) \)$;
    for $T = 0$ this holds with probability one. Given a nonsingular restriction on $T$,
    the determinant on $U$ is the determinant on $T$ times that of a uniform symmetric Schur complement of size
    $r - dim T > 0$. The corresponding Schur complement on $V$ is independent.
    Both signs are balanced up to $O \( q^(- 1) \)$, uniformly over the fixed common block and mixed coefficients.
    The covariance of the two indicator summands is therefore $O \( q^(- 1) \)$.
    The diagonal covariance is at most $1$, giving
  $ "Var" \( f_xi \) = O \( q^(- 1) + \| cal(U) \|^(- 1) \) . $
  Cauchy–Schwarz and the expectation estimate prove Equation (4.6).
  For the last assertion, each of $Q$ and $Q - L$ is marginally uniform.
    The event $cal(A)$ that the specified forms are nonsingular has probability $1 - O \( q^(- 1) \)$,
    uniformly in $L$. Since the error being averaged is nonnegative,
  $ bb(E) [lr(|f_xi - 1 / 2|) thin mid(bar.v) thin cal(A)] lt.eq frac(bb(E) \| f_xi - 1 \/ 2 \|, bb(P) \( cal(A) \)) . $
  This proves the same bound under either conditioning. ◻
]

=== 4.2 Counting centers on one face <counting-centers-on-one-face>

The following projection identity explains the special role of half rank.

#thm([Lemma 4.4.])[
  (Complementary images).  #emph[Suppose $B in cal(S)_(2 r)$ is nonsingular and $A in cal(S)_(2 r)$ has rank $r$. Then
#[#set math.equation(numbering: n => "(4.7)")
 $ "rank" \( B - A \) = r quad arrow.l.r.double quad A B^(- 1) A = A . $ <eq:transverse-projection>]

 If $A$ and $A - B$ have discriminant signs $xi_1 \, xi_2$, respectively, under these conditions, then
#[#set math.equation(numbering: n => "(4.8)")
 $ chi \( det B \) = c_0 xi_1 xi_2 . $ <eq:transverse-pair-sign>]

]
] <lem:transverse-projection>

#proof[
  If $A$ and $B - A$ both have rank $r$, their images span the image of $B$, so these images are complementary.
    Since $A B^(- 1) + \( B - A \) B^(- 1)$ is the identity, uniqueness of the corresponding direct-sum
    decomposition makes $A B^(- 1)$ the projection onto the first image. In particular $A B^(- 1) A = A$.
    Conversely, this identity makes $A B^(- 1)$ an idempotent of rank $r$.
    Its complementary idempotent has rank $r$ and, after multiplication by $B$, equals $B - A$.
  Choose basis-column matrices $P_1 \, P_2$ of the two complementary images and write $A =
    P_1 R_1 P_1^(sans(T))$ and $A - B = P_2 R_2 P_2^(sans(T))$. Then
  $ B = \( P_1 med P_2 \) "diag" \( R_1 \, - R_2 \) \( P_1 med P_2 \)^(sans(T)) . $
  Taking determinant characters gives Equation (4.8). ◻
]

For independent point matrices $\( X_i \)_(i in I)$ define

#[#set math.equation(numbering: n => "(4.9)")
 $ eta_e^X = chi \( det \( X_i - X_k \) \) quad \( e = { i \, k } \) \, wide cal(T) = { X_i -
   X_k upright(" nonsingular for every ") e in E } . $ <eq:transverse-event>]

The choice of orientation of $e$ is immaterial because $D$ is even.
  Each difference is uniform in $cal(S)_D$, so $bb(P) \( cal(T)^c \) = O \( q^(- 1) \)$ by Lemma 11.
  For an activity pattern $B subset.eq cal(C)$, let $A_j = { i in j : \( i \, j \) in
  B }$ and define the local center factor and its sign model by

#[#set math.equation(numbering: n => "(4.10)")
 $ F_j \( X \) & = bb(E)_(Y_j) product_(i in A_j) K_(xi_(i j)) \( X_i - Y_j \) \,\
G_j \( X \) & = product_({ i \, k } subset.eq A_j) \( 1 + c_0 eta_({ i \, k })^X xi_(i j) xi_(k j) \) .
  $ <eq:transverse-face-factor>]

On transverse local configurations, $G_j$ equals $2$ for two active incidences whose pair signs match,
  and $8$ for three active incidences whose three pair signs match; it is zero when any required match fails.
  With at most one active incidence, both $F_j$ and $G_j$ equal $1$.

#thm([Lemma 4.5.])[
  (Local transverse approximation).  #emph[Suppose $r > 1$.
    For each face $j$, let $cal(T)_j$ be the event that all three differences between its point matrices are
    nonsingular. Then, uniformly over the activity and sign choices,
#[#set math.equation(numbering: n => "(4.11)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(T)_j) \| F_j - G_j \| #scale(x: 120%, y: 120%)[\]] =
   O \( q^(- 1 \/ 2) \) . $ <eq:transverse-local-l1>]

 Moreover $0 lt.eq F_j lt.eq C_D$ on $cal(T)_j$, for a constant $C_D$ independent of $q$, and $0 lt.eq G_j lt.eq
   8$ everywhere.]
] <lem:local-transverse>

#proof[
  First suppose all three incidences are active, and locally write their point matrices as $X_1 \, X_2 \,
    X_3$ and their signs as $xi_1 \, xi_2 \, xi_3$. Set
  $ B_0 = X_1 - X_2 \, quad B_1 = X_1 - X_3 \, quad A = X_1 - Y \, wide Q = B_0^(- 1) \, quad L = B_0^(- 1) -
    B_1^(- 1) . $
  On $cal(T)_j$, the form $L = B_0^(- 1) \( B_1 - B_0 \) B_1^(- 1)$ is symmetric and nonsingular.
    Write a rank-$r$ matrix $A$ as $P R P^(sans(T))$. By Lemma 14, its other two rank conditions are equivalent to
  $ R \( P^(sans(T)) B_nu^(- 1) P \) R = R quad \( nu = 0 \, 1 \) \, $
  or to
  #[#set math.equation(numbering: n => "(4.12)")
   $ P^(sans(T)) L P = 0 \, wide P^(sans(T)) Q P upright(" nonsingular") \, wide
     R = \( P^(sans(T)) Q P \)^(- 1) . $ <eq:transverse-center-parametrization>]
  Thus the centers satisfying the three rank conditions are in bijection with the maximal $L$-isotropic subspaces
    $U$ on which $Q$ restricts nonsingularly. Changing the basis of $U$ leaves the resulting $A$ unchanged,
    and every $A$ recovers $U$ as its image, proving the stated bijection.
  Let $cal(M)$ be the event that all three required pair matches $eta_({ a \, b })^X = c_0 xi_a xi_b$ hold.
    If any match fails, the signed count is zero by Equation (4.8). If they all hold, then
  $ chi \( det L \) = eta_({ 1 \, 2 })^X eta_({ 1 \, 3 })^X eta_({ 2 \, 3 })^X = c_0 \, $
  so $L$ is split by Lemma 12. In Equation (4.12), the sign of $A$ is the sign of $Q \|_U$,
    since inversion preserves a nonzero determinant character.
    Once it equals $xi_1$, the pair matches with point $1$ force the other two signs to equal $xi_2 \, xi_3$.
  For split $L$, let $f_(xi_1) \( Q \; L \)$ denote the fraction of its $N_r$ maximal isotropic subspaces having a
    nonsingular restriction of sign $xi_1$. On a matching transverse triple the exact normalized count is
  #[#set math.equation(numbering: n => "(4.13)")
   $ F_j = frac(q^(- b \( D \)) N_r, pi_(xi_1) pi_(xi_2) pi_(xi_3))
     f_(xi_1) \( Q \; L \) = \( 16 + O \( q^(- 1) \) \) f_(xi_1) \( Q \; L \) . $ <eq:transverse-three-normalization>]
  Here the exponent cancels because $r \( r - 1 \) \/ 2 - b \( 2 r \) + 3 b \( r \) = 0$.
    The factor $16$ combines the leading factor $2$ in $N_r$ with the three signed-layer normalization factors
    $2$; the restriction-sign fraction will supply a further factor $1 \/ 2$.
  We specify the probability law used for that fraction. Before any invertibility conditioning, $B_0 \,
    B_1$ are independent uniform symmetric matrices: this follows by conditioning on $X_1$ and translating the
    independent matrices $X_2 \, X_3$. After requiring $B_0 \, B_1$ to be nonsingular,
    inversion preserves their independent uniform laws on nonsingular symmetric matrices.
    Conditional also on a fixed value of $L = B_0^(- 1) - B_1^(- 1)$, the matrix $Q$ is therefore uniform on
  $ { Q in cal(S)_D : Q upright(" and ") Q - L upright(" are nonsingular") } . $
  Each admissible $Q$ corresponds to exactly one ordered inverse pair $\( Q \, Q - L \)$,
    which verifies the conditional uniformity directly. Requiring $L$ to be nonsingular is exactly the remaining
    transverse condition. Lemma 13, uniformly for every fixed nonsingular split $L$, now gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E) [upright(bold(1))_(cal(M)) lr(|f_(xi_1) \( Q \; L \) - 1 / 2|) thin mid(bar.v) thin cal(T)_j \, L]
     lt.eq bb(E) [lr(|f_(xi_1) \( Q \; L \) - 1 / 2|) thin mid(bar.v) thin cal(T)_j \, L] =
     O \( q^(- 1 \/ 2) \) . $ <eq:transverse-matching-error>]
  We used $r > 1$, for which $N_r^(- 1 \/ 2) = O \( q^(- 1 \/ 2) \)$.
    The matching indicator is kept inside the expectation; no additional conditioning on the matches is used.
    For nonsplit $L$, the matching event is empty and both the signed count and its model vanish.
    Equations (4.13) and (4.14) prove the local error estimate with limiting value $8$ on matches.
    The same exact formula, with $0 lt.eq f_(xi_1) lt.eq 1$, gives a uniform bound on every transverse triple,
    including the exceptional restrictions.
  For two active incidences, relabel them $1 \, 2$ and put $B = X_1 - X_2$ and $Q = B^(- 1)$.
    The same projection argument now parametrizes centers by all $r$-subspaces $U$ for which $Q \|_U$ is
    nonsingular. On the pair match $chi \( det B \) = c_0 xi_1 xi_2$,
    only the sign $xi_1$ of this restriction needs to be imposed; off the match the count is zero.
    If $f_(xi_1) \( Q \)$ is the fraction among all $[frac(2 r, r)]_q$ subspaces, the exact count on the match is
  #[#set math.equation(numbering: n => "(4.15)")
   $ F_j = frac(q^(- b \( D \)) [frac(2 r, r)]_q, pi_(xi_1) pi_(xi_2))
     f_(xi_1) \( Q \) = \( 4 + O \( q^(- 1) \) \) f_(xi_1) \( Q \) . $ <eq:transverse-two-normalization>]
  The exponent identity here is $r^2 - b \( 2 r \) + 2 b \( r \) = 0$.
    Conditional on $B$ being nonsingular, $Q$ is uniform nonsingular symmetric.
    Apply Lemma 13 with this single conditioning and keep the matching indicator inside the expectation as before.
    This gives limiting value $2$, error $O \( q^(- 1 \/ 2) \)$,
    and a uniform bound on the nonsingular-pair event. Restricting further to $cal(T)_j$ can only decrease the
    nonnegative error expectation. The remaining cases follow from the mean-one normalization of each $K_xi$ and
    translation invariance. ◻
]

=== 4.3 Joint distribution of the pair signs <joint-distribution-of-the-pair-signs>

The pairs share point matrices, so marginal balance of their signs does not give their joint distribution.
  For each nonempty subset moment, we first establish a high-probability event for the difference minors at a
  selected incident vertex, then condition on all entries except its off-diagonal row vector and transpose and
  average over that vector. Table 1 shows that the degree of each vertex in $\( I \, E \)$ is at most $6$:
  its degree there equals its number of incident faces, since each face contains two pairs through that point and
  each pair occurs twice.

#thm([Lemma 4.6.])[
  (Joint determinant signs).  #emph[For fixed even $D gt.eq 12$,
    the law of $\( eta_e^X \)_(e in E)$ converges in total variation to that of independent uniform signs on ${ +
    1 \, - 1 }^E$.]
] <lem:joint-signs>

#proof[
  Fix a nonempty subset $F subset.eq E$, and choose a vertex $i$ incident with $s gt.eq 1$ of its pairs.
    Write $N = D - 1$ and, for every point $v$, write its matrix in block form
  $ X_v = mat(delim: "(", a_v, z_v^(sans(T)); z_v, W_v) \, wide W_v in cal(S)_N \, quad z_v in bb(F)_q^N . $
  Let $k_1 \, dots.h \, k_s$ be the selected neighbors of $i$, and put $M_ell = W_i - W_(k_ell)$.
    We first establish a high-probability event using these lower-right blocks,
    before conditioning on the other entries. Given $W_i$, the $M_ell$ are independent uniform symmetric matrices.
    All are nonsingular except with probability $O \( q^(- 1) \)$.
    Conditional on their nonsingularity, their inverses are independent uniform nonsingular symmetric matrices.
  Let $Q_1 \, dots.h \, Q_s$ instead be independent uniform matrices in $cal(S)_N$.
    For any $t in bb(F)_q^s \\ { 0 }$, the matrix $sum_ell t_ell Q_ell$ is uniform in $cal(S)_N$:
    condition on all but a coordinate with nonzero coefficient.
    By Equation (4.3), its probability of rank at most $s$ is $O \( q^(- b \( N - s \)) \)$.
    The union bound over all nonzero $t$ gives
  $ bb(P) (exists t eq.not 0 : "rank" (sum_ell t_ell Q_ell) lt.eq s) = O \( q^(s - b \( N - s \)) \) . $
  Conditioning all the $Q_ell$ to be nonsingular divides this upper bound by a probability $1 - O \( q^(- 1) \)$.
    It follows that the event
  #[#set math.equation(numbering: n => "(4.16)")
   $ cal(G) =
     mat(delim: "{", M_ell upright(" is nonsingular for every ") ell \,; "rank" \( sum_ell t_ell M_ell^(- 1) \)
     gt.eq s + 1 upright(" for every ") t in bb(F)_q^s \\ { 0 }) $ <eq:transverse-good-minors>]
  satisfies
  #[#set math.equation(numbering: n => "(4.17)")
   $ bb(P) \( cal(G)^c \) = O \( q^(- 1) + q^(s - b \( N - s \)) \) =
     O \( q^(- 1) \) . $ <eq:transverse-good-probability>]
  Indeed $s lt.eq 6$ and $D gt.eq 12$ imply $N - s gt.eq 5$ and $b \( N - s \) gt.eq 15 > s$.
    These probability bounds hold given every $W_i$ and hence hold without conditioning as well.
  Only now condition on all entries of all point matrices except $z_i$.
    The event $cal(G)$ is determined by this conditioning, whereas $z_i$ remains uniform on $bb(F)_q^N$.
    On every such fixed configuration in $cal(G)$, the determinant formula gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ det \( X_i - X_(k_ell) \) = det \( M_ell \) h_ell \( z_i \) \, wide h_ell \( z \) = a_i -
     a_(k_ell) - \( z - z_(k_ell) \)^(sans(T)) M_ell^(- 1) \( z - z_(k_ell) \) . $ <eq:transverse-schur-evaluations>]
  Let $mu$ be the law of $\( h_1 \( z \) \, dots.h \, h_s \( z \) \)$ for uniform $z$.
    Fix a nontrivial additive character $psi$ of $bb(F)_q$ and define $hat(mu) \( t \) =
    bb(E)_z psi \( sum_ell t_ell h_ell \( z \) \)$. The quadratic part at every frequency $t eq.not
    0$ has rank at least $s + 1$ by Equation (4.16).
  We use the standard rank bound for a quadratic Gauss sum;
    see Gowers and Wolf #cite(label("gowerswolf2011")) Lemma 3.3.
    The short differencing argument also fixes our normalization.
    A quadratic polynomial $p \( z \) = z^(sans(T)) H z + lambda^(sans(T)) z +
    c$ with symmetric quadratic matrix $H$ obeys
  $ lr(|bb(E)_z psi \( p \( z \) \)|)^2 & = bb(E)_(z \, u) psi \( p \( z + u \) - p \( z \) \)\
 & = bb(E)_u psi \( u^(sans(T)) H u + lambda^(sans(T)) u \) bb(E)_z psi \( 2 z^(sans(T)) H u \) \, $
  whose absolute value is at most $bb(P)_u \( H u = 0 \) = q^(- "rank" H)$.
    Here the inner average vanishes unless $H u = 0$, by additive-character orthogonality and the fact that $q$ is
    odd. Therefore $\| hat(mu) \( t \) \| lt.eq q^(- \( s + 1 \) \/ 2)$ for $t eq.not 0$,
    uniformly over all the fixed linear and constant terms in Equation (4.18).
  Writing $nu$ for uniform measure on $bb(F)_q^s$, finite Fourier orthogonality and Cauchy–Schwarz yield the
    explicit bound
  #[#set math.equation(numbering: n => "(4.19)")
   $ "TV" \( mu \, nu \) & = 1 / 2 sum_x \| mu \( x \) - q^(- s) \|\
 & lt.eq 1 / 2 (q^s sum_x \| mu \( x \) - q^(- s) \|^2)^(1 \/ 2) = 1 /
   2 (sum_(t eq.not 0) \| hat(mu) \( t \) \|^2)^(1 \/ 2) lt.eq 1 / 2 q^(- 1 \/ 2) . $ <eq:transverse-fourier-tv>]
  The identity in the middle follows by expanding the square and using $sum_t psi \( t dot.op \( x - y \) \) =
    q^s upright(bold(1))_({ x = y })$.
  Under the same fixed conditioning, all factors $eta_e^X$ for $e in F$ not incident to $i$ are constant.
    They and the characters of the minor determinants have absolute value at most one.
    By Equation (4.18), the remaining part of the product is $product_(ell = 1)^s chi \( h_ell \( z_i \) \)$.
    Its expectation under $nu$ is zero, because $bb(E)_(x in bb(F)_q) chi \( x \) = 0$ and $s gt.eq 1$.
    The difference of expectations of a function bounded by one is at most twice total variation,
    so on $cal(G)$ the absolute conditional expectation of the entire selected product is at most $q^(- 1 \/ 2)$.
    On $cal(G)^c$ it is at most one. Averaging and using Equation (4.17) proves
  #[#set math.equation(numbering: n => "(4.20)")
   $ bb(E) product_(e in F) eta_e^X = O \( q^(- 1 \/ 2) \) wide \( F eq.not diameter \) .
     $ <eq:transverse-subset-moments>]
  Finally, replace any zero coordinate of $eta^X$ by $+ 1$, obtaining a sign vector $tilde(eta)^X$.
    A union bound and Lemma 11 show that this replacement changes the vector with probability $O \( q^(- 1) \)$
    and changes each subset moment by $O \( q^(- 1) \)$. For every $epsilon in { + 1 \, - 1 }^E$, the identity
  $ upright(bold(1))_({ tilde(eta)^X = epsilon }) = 2^(- \| E \|) product_(e in E) \( 1 + epsilon_e tilde(eta)_e^X \) $
  expresses its probability through the subset moments. The empty subset contributes $2^(- \| E \|)$ and every
    other subset is $O \( q^(- 1 \/ 2) \)$ by Equation (4.20).
    Since $E$ is fixed, summing over all sign vectors proves convergence in total variation. ◻
]

=== 4.4 Assembling the transverse contribution <assembling-the-transverse-contribution>

#thm([Proposition 4.7.])[
  #emph[For every fixed even $D gt.eq 12$, every activity pattern $B subset.eq cal(C)$,
    and every prescribed set of incidence signs,
#[#set math.equation(numbering: n => "(4.21)")
 $ bb(E) [upright(bold(1))_(cal(T)) product_(\( i \, j \) in B) K_(xi_(i j)) \( X_i - Y_j \)] =
   bb(E)_eta product_(j in J)
   product_({ i \, k } subset.eq A_j) \( 1 + c_0 eta_({ i \, k }) xi_(i j) xi_(k j) \) + o \( 1 \) \,
   $ <eq:transverse-limit>]

 where the $eta_e$ are independent uniform signs. At each fixed $D$,
   the error is uniform over all activity patterns and incidence signs.]
] <prop:transverse-limit>

#proof[
  Given the point matrices, the center variables are independent,
    so the left side is $bb(E) \[ upright(bold(1))_(cal(T)) product_j F_j \]$.
    Increase $C_D$ from Lemma 15 to at least $8$. The deterministic telescoping identity for two products gives,
    on $cal(T)$,
  $ lr(|product_j F_j - product_j G_j|) lt.eq C_D^(\| J \| - 1) sum_j \| F_j - G_j \| . $
  Since $cal(T) subset.eq cal(T)_j$, taking expectations and applying Equation (4.11) bounds this difference by
    $O \( q^(- 1 \/ 2) \)$. This argument applies to faces sharing point matrices;
    it uses no independence of their local errors.
  The bound $product_j G_j lt.eq 8^(\| J \|)$ and $bb(P) \( cal(T)^c \) =
    O \( q^(- 1) \)$ allow removal of $upright(bold(1))_(cal(T))$ from the model expectation.
    Lemma 16 then replaces $eta^X$ by independent uniform signs.
    Total variation controls every bounded function, including the displayed model even when $c_0$ varies with the
    prime $q$. Finally, there are only finitely many activity and sign choices,
    so the largest of their errors also tends to zero. ◻
]

Proposition 17 reduces Lemma 5 to the weighted singular contribution

#[#set math.equation(numbering: n => "(4.22)")
 $ bb(E) [upright(bold(1))_(cal(T)^c) product_(\( i \, j \) in B) K_(xi_(i j)) \( X_i - Y_j \)] =
   o \( 1 \) . $ <eq:transverse-tail-target>]

The unweighted estimate $bb(P) \( cal(T)^c \) = O \( q^(- 1) \)$ does not establish Equation (4.22),
  because the normalized rank-layer indicators grow with $q$.
  Proposition 31 will prove this estimate for all sufficiently large even $D$,
  after the geometric and exponent estimates in the next sections.
  The threshold $D gt.eq 12$ above applies only to the transverse calculation and the joint-sign argument.

== 5 Lagrangian counts and ordered triple orbits <sec:orbits>

The contribution of singular differences is nonnegative, so for its upper bound we may discard the
  discriminant-sign restrictions after comparing the signed and unsigned normalizing masses.
  Their ratio stays bounded at fixed $D$. Symmetric matrices then admit a useful interpretation as Lagrangian
  subspaces: nullity of a difference becomes intersection dimension.
  We first give the exact counting formulas needed for this change of model.
  We then prove a lower bound for every individual ordered triple orbit.
  This stronger statement is needed for the change of measure in Section 6.

Throughout this section, dimensions are fixed and $q$ is an odd prime.
  The notation $A asymp_D B$ means that the ratio is bounded above and below by positive constants depending only
  on $D$. In particular, these constants will be uniform over all the subspaces and form classes that occur.
  As before, $b \( n \) = n \( n + 1 \) \/ 2$.

=== 5.1 Symplectic reduction and elementary counts <symplectic-reduction-and-elementary-counts>

Symplectic bases, quotients, and Lagrangian counts are standard finite classical geometry;
  see Taylor #cite(label("taylor1992")) Theorem 7.4, Lemma 7.5, and Exercises 8.1–8.2.
  We give the arguments explicitly and then establish the individual ordered-orbit estimate needed here.

Let $\( cal(V) \, omega \)$ be a nondegenerate symplectic space of dimension $2 N$ over $bb(F)_q$.
  A subspace is #emph[isotropic] if $omega$ vanishes on it;
  a #emph[Lagrangian] is an isotropic subspace of dimension $N$.
  Write $"Lag" \( cal(V) \)$ for the set of Lagrangians, always equipped with uniform probability.
  Orthogonal complements in this section refer to $omega$. Thus every Lagrangian $L$ satisfies $L^perp = L$.

We record explicitly the reduction facts used below. An isotropic basis $e_1 \, dots.h \,
  e_t$ extends to a symplectic basis. To see this, choose vectors $f_1 \, dots.h \,
  f_t$ with $omega \( e_i \, f_j \) = delta_(i j)$, using nondegeneracy.
  If $a_(i j) = omega \( f_i \, f_j \)$, replace $f_i$ by $f_i + sum_k \( a_(k i) \/ 2 \) e_k$.
  The new $f_i$ pair to zero with one another, while their pairings with the $e_i$ are unchanged.
  Their joint span is nondegenerate; repeat in its orthogonal complement.
  In particular, symplectic automorphisms act transitively on isotropic subspaces of any specified dimension.

For an isotropic $t$-space $S$, the quotient $S^perp \/ S$ is symplectic of dimension $2 \( N - t \)$. The map

#[#set math.equation(numbering: n => "(5.1)")
 $ L mapsto L \/ S quad upright("is a bijection from ") { L in "Lag" \( cal(V) \) :
   S subset.eq L } upright(" to ") "Lag" \( S^perp \/ S \) . $ <eq:orbits-containing-reduction>]

More generally, every Lagrangian $L$ has a Lagrangian reduction

#[#set math.equation(numbering: n => "(5.2)")
 $ overline(L)^(thin S) = #scale(x: 120%, y: 120%)[\(] \( L ∩ S^perp \) +
   S #scale(x: 120%, y: 120%)[\)] \/ S . $ <eq:orbits-general-reduction>]

Indeed, if $u = dim \( L ∩ S \)$, the pairing map $S arrow.r L^(*)$ has kernel $S ∩ L^perp = S ∩ L$ and rank $t -
  u$. Its transpose therefore gives $dim \( L ∩ S^perp \) = N - t + u$.
  The space in Equation (5.2) is isotropic and has dimension $N - t$.
  Choosing symplectic coordinates for $S$ and its dual also gives

#[#set math.equation(numbering: n => "(5.3)")
 $ cal(V) = \( S xor S^(*) \) perp cal(U) \, wide cal(U) tilde.equiv S^perp \/ S . $ <eq:orbits-quotient-extension>]

Here $S^(*)$ denotes a chosen isotropic dual subspace. Every symplectic automorphism of the quotient extends by
  the identity on $S xor S^(*)$. In particular, it extends fixing $S$ pointwise.

For $0 lt.eq t lt.eq n$, put

#[#set math.equation(numbering: n => "(5.4)")
 $ [n / t]_q = product_(i = 0)^(t - 1) frac(q^(n - i) - 1, q^(t - i) - 1) \, wide L_N =
   product_(j = 1)^N \( q^j + 1 \) \, wide L_0 = 1 . $ <eq:orbits-basic-notation>]

An empty product is one. Counting ordered independent $t$-tuples in $bb(F)_q^n$ and dividing by the number of
  ordered bases of a $t$-space shows that $[n / t]_q$ counts the $t$-dimensional subspaces of $bb(F)_q^n$.
  We shall also use

#[#set math.equation(numbering: n => "(5.5)")
 $ \| "GL"_n \( bb(F)_q \) \| = q^(n^2) product_(j = 1)^n \( 1 - q^(- j) \) \, wide \| "GL"_0 \( bb(F)_q \) \| =
   1 . $ <eq:orbits-gl-order>]

#thm([Lemma 5.1.])[
  (Lagrangian counting formulas).  #emph[In a symplectic $2 N$-space, the following formulas hold.]
  + #emph[The number of Lagrangians is $L_N$.]
  + #emph[A fixed isotropic $t$-space is contained in exactly $L_(N - t)$ Lagrangians.
    Consequently its containment probability and the number of isotropic $t$-spaces are, respectively,
#[#set math.equation(numbering: n => "(5.6)")
 $ theta.alt_N \( t \) = L_(N - t) / L_N \, wide I_N \( t \) = L_N / L_(N - t) [N / t]_q . $ <eq:orbits-containment>]

]
  + #emph[For a fixed Lagrangian $A$, the number of Lagrangians $B$ with $dim \( A ∩ B \) =
    h$ is $[N / h]_q q^(b \( N - h \))$. Thus
#[#set math.equation(numbering: n => "(5.7)")
 $ pi_(N \, h) := bb(P) { dim \( A ∩ B \) = h } = frac([N / h]_q q^(b \( N - h \)), L_N) .
   $ <eq:orbits-pair-probability>]

 All ordered pairs with the same intersection dimension belong to one symplectic orbit.]
  #emph[For fixed $N$, these formulas give
#[#set math.equation(numbering: n => "(5.8)")
 $ L_N & = \( 1 + O_N \( q^(- 1) \) \) q^(b \( N \)) \, & [n / t]_q & = \( 1 + O_n \( q^(- 1) \) \)
   q^(t \( n - t \)) \,\
theta.alt_N \( t \) & asymp_N q^(- N t + binom(t, 2)) \, & I_N \( t \) & asymp_N q^(2 N t - \( 3 t^2 - t \) \/ 2) \,\
pi_(N \, h) & asymp_N q^(- b \( h \)) . $ <eq:orbits-count-exponents>]

]
] <lem:lagrangian-counts>

#proof[
  Every line is isotropic. Count pairs consisting of a line and a Lagrangian containing it.
    Each Lagrangian has $\( q^N - 1 \) \/ \( q - 1 \)$ lines,
    and there are $\( q^(2 N) - 1 \) \/ \( q - 1 \)$ lines in $cal(V)$.
    Reduction by a line gives $L_N \( q^N - 1 \) = \( q^(2 N) - 1 \) L_(N - 1)$.
    Starting at $L_0 = 1$ yields the product in Equation (5.4). Equation (5.1) gives the containment count.
    Counting pairs $\( S \, L \)$ with $dim S = t$ and $S subset.eq L$ gives $I_N \( t \) L_(N - t) = L_N [N / t]_q$.
  For the pair count, first choose $H = A ∩ B$ inside $A$. In $H^perp \/ H$,
    the image of $B$ must be transverse to the image of $A$, where #emph[transverse] means having zero
    intersection. There are exactly $q^(b \( N - h \))$ such Lagrangians:
    after choosing complementary coordinate Lagrangians, they are graphs of symmetric linear maps from one
    coordinate space to the other. Symmetry follows by evaluating the alternating form on two graph vectors.
    This proves Equation (5.7). To prove pair transitivity, first identify the common subspaces by symplectic
    bases. In their common-space quotient, identify the transverse pairs by choosing a basis of one member and its
    dual basis in the other. The resulting quotient map extends by Equation (5.3);
    containment reduction is a bijection, so the extension identifies the original pairs.
    Finally, factoring the leading powers of $q$ out of the finite products proves all the displayed estimates,
    including their endpoint cases. ◻
]

=== 5.2 Comparison with the matrix chart <comparison-with-the-matrix-chart>

Take $N = D = 2 r$, identify $cal(V) = bb(F)_q^D xor \( bb(F)_q^D \)^(*)$, and use

#[#set math.equation(numbering: n => "(5.9)")
 $ omega \( \( x \, f \) \, \( y \, g \) \) = g \( x \) - f \( y \) . $ <eq:orbits-coordinate-form>]

For $X in cal(S)_D$, write $Gamma_X = { \( x \, X x \) : x in bb(F)_q^D }$,
  where coordinates identify a symmetric matrix with a map to the dual.
  These are exactly the Lagrangians transverse to the fixed second coordinate space. Denote this chart by $cal(A)$. Then

#[#set math.equation(numbering: n => "(5.10)")
 $ \| cal(A) \| = q^(b \( D \)) \, wide beta_D := frac(\| cal(A) \|, L_D) =
   product_(j = 1)^D \( 1 + q^(- j) \)^(- 1) \, wide dim \( Gamma_X ∩ Gamma_Y \) = D -
   "rank" \( X - Y \) . $ <eq:orbits-chart>]

Define the unsigned normalized incidence kernel by

#[#set math.equation(numbering: n => "(5.11)")
 $ J \( L \, M \) = upright(bold(1))_({ dim \( L ∩ M \) = r }) / pi_(D \, r) . $ <eq:orbits-unsigned-kernel>]

It has mean one in either variable for every fixed value of the other.
  Let $p_xi = bb(P) { "rank" X = r \, med "sign" \( X \) = xi }$, so that $K_xi$ has normalization $p_xi^(- 1)$.
  This is the quantity denoted $pi_xi$ in Equation (4.4); the letter $p$ here distinguishes it from the Lagrangian
  pair probability $pi_(D \, r)$. Lemma 11 and Equation (5.7) imply

#[#set math.equation(numbering: n => "(5.12)")
 $ p_xi = \( 1 \/ 2 + O_D \( q^(- 1) \) \) q^(- b \( r \)) \, wide
   pi_(D \, r) = \( 1 + O_D \( q^(- 1) \) \) q^(- b \( r \)) . $ <eq:orbits-normalizers>]

#thm([Lemma 5.2.])[
  (Chart comparison).  #emph[Let $B subset.eq cal(C)$ be a set of active incidences,
    with prescribed signs $xi_(i j)$. Let $F$ be any nonnegative function of the $35$ Lagrangians indexed by $I
    union.sq J$. For independent uniform matrices $X_i \, Y_j in
    cal(S)_D$ and independent uniform Lagrangians $L_i \, M_j$,
#[#set math.equation(numbering: n => "(5.13)")
 $ & bb(E)
   [F \( \( Gamma_(X_i) \)_i \, \( Gamma_(Y_j) \)_j \) product_(\( i \, j \) in B) K_(xi_(i j)) \( X_i - Y_j \)]\
 & wide lt.eq beta_D^(- 35) product_(\( i \, j \) in B) pi_(D \, r) / p_(xi_(i j)) med
   bb(E) [F \( \( L_i \)_i \, \( M_j \)_j \) product_(\( i \, j \) in B) J \( L_i \, M_j \)] .
   $ <eq:orbits-chart-comparison>]

 The multiplier is bounded in terms of $D$ alone for all sufficiently large $q$,
   uniformly in the active set and its signs. In particular,
   this comparison applies with $F$ the indicator that some pair in $E$ has positive intersection dimension,
   or the indicator of any specified intersection profile.]
] <lem:chart-comparison>

#proof[
  On the chart, dropping the sign condition gives the pointwise inequality
  #[#set math.equation(numbering: n => "(5.14)")
   $ K_xi \( X - Y \) lt.eq pi_(D \, r) / p_xi J \( Gamma_X \, Gamma_Y \) . $ <eq:orbits-pointwise-comparison>]
  The graph variables have exactly the law of the uniform Lagrangian variables conditioned on all $35$ variables
    belonging to $cal(A)$. That event has probability $beta_D^35$.
    Apply Equation (5.14), express the conditional expectation by inserting the event’s indicator and dividing by
    its probability, and then remove the indicator by nonnegativity.
    This gives Equation (5.13) without any boundedness assumption on $F$ or on the normalized kernels.
    Finally $beta_D arrow.r 1$ and $pi_(D \, r) \/ p_xi arrow.r 2$. ◻
]

=== 5.3 The cost of an ordered triple orbit <the-cost-of-an-ordered-triple-orbit>

Let $L_1 \, L_2 \, L_3$ be Lagrangians in a symplectic $2 D$-space.
  Use opposite indices for their pair intersections and put

#[#set math.equation(numbering: n => "(5.15)")
 $ c = dim \( L_1 ∩ L_2 ∩ L_3 \) \, wide h_i = dim \( L_j ∩ L_k \) \,\
s_i = h_i - c \, wide d = D - c \, wide { i \, j \, k } = { 1 \, 2 \, 3 } . $ <eq:orbits-profile>]

These integers form the #emph[dimensional profile]. Set

#[#set math.equation(numbering: n => "(5.16)")
 $ C = \( D + 1 \) c + sum_(i = 1)^3 b \( s_i \) . $ <eq:orbits-profile-cost>]

We call a dimensional profile #emph[feasible] if it is realized by an ordered triple of Lagrangians over the field
  under consideration.

Here is why the lower bound below concerns individual orbits.
  Let $mu$ be the independent triple law, and let $nu$ be the law obtained by choosing a uniform center $Y$ and
  then, independently given $Y$, three uniform Lagrangians meeting $Y$ in dimension $r$.
  Section 6 will verify that the density of $nu$ relative to $mu$ is $bb(E)_Y product_i J \( L_i \, Y \)$.
  This density is constant on an ordered symplectic orbit $cal(O)$,
  with value $nu \( cal(O) \) \/ mu \( cal(O) \)$. The analogous ratio for a whole dimensional profile is only the
  $mu$-weighted average of its orbit values. A pointwise bound for the center integral therefore needs a lower
  bound for $mu \( cal(O) \)$ for every individual orbit.

#thm([Proposition 5.3.])[
  (Mass of ordered triple orbits).  #emph[For three independent uniform Lagrangians,
    every feasible dimensional profile has probability $O_D \( q^(- C) \)$.
    More strongly, there is a constant $kappa_D > 0$, independent of $q$ and of the particular orbit,
    such that for every occurring ordered symplectic orbit $cal(O)$ of that profile,
#[#set math.equation(numbering: n => "(5.17)")
 $ kappa_D q^(- C) lt.eq bb(P) { \( L_1 \, L_2 \, L_3 \) in cal(O) } lt.eq
   kappa_D^(- 1) q^(- C) . $ <eq:orbits-orbit-mass>]

 The constant can be chosen for all odd primes. Moreover, conditional on any fixed ordered pair having
   intersection dimension $h$, the probability that an independent third Lagrangian completes a specified
   dimensional profile is
#[#set math.equation(numbering: n => "(5.18)")
 $ O_D \( q^(- C + b \( h \)) \) . $ <eq:orbits-conditional-profile>]

]
] <prop:triple-orbits>

#proof[
  We divide the argument into the common-space count, the classification above the pair intersections,
    and the orbit lower bound.
  ===== 5.3.1 Counting the forced subspaces. <counting-the-forced-subspaces.>
  Choose an isotropic common $c$-space $C_0$ and impose its containment in all three Lagrangians.
    The number of choices times the containment probability is exactly
  #[#set math.equation(numbering: n => "(5.19)")
   $ I_D \( c \) theta.alt_D \( c \)^3 asymp_D q^(- \( D + 1 \) c) . $ <eq:orbits-common-cost>]
  Conditional on these three separate containments, their images in $C_0^perp \/
    C_0$ are independent uniform Lagrangians of a symplectic $2 d$-space.
    In that quotient we require common intersection zero. For the next part of the argument denote the reduced
    Lagrangians again by $L_i$, and write $H_i = L_j ∩ L_k$, of dimension $s_i$.
  The $H_i$ are pairwise orthogonal, since any two lie in a common Lagrangian. They are also in direct sum.
    Indeed, a relation $x_1 + x_2 + x_3 = 0$ with $x_i in H_i$ puts $x_i$ in $L_i$,
    since the other two summands lie there. Hence each $x_i$ is in the zero common intersection. Thus
  #[#set math.equation(numbering: n => "(5.20)")
   $ H_(*) := H_1 xor H_2 xor H_3 upright(" is isotropic") \, wide a := s_1 + s_2 + s_3 lt.eq d \, wide z := d -
     a gt.eq 0 . $ <eq:orbits-pair-sum>]
  Choose $H_(*)$ and then its ordered decomposition into the $H_i$. The number of such choices is
  #[#set math.equation(numbering: n => "(5.21)")
   $ I_d \( a \) frac(\| "GL"_a \( bb(F)_q \) \|, product_i \| "GL"_(s_i) \( bb(F)_q \) \|) asymp_D
     q^(2 d a - \( 3 a^2 - a \) \/ 2 + a^2 - sum_i s_i^2) . $ <eq:orbits-pair-space-count>]
  The stabilizer of an ordered direct-sum decomposition in $"GL"_a$ consists exactly of the block diagonal maps,
    which proves the quotient in this formula. For these choices each $L_i$ must contain $A_i :=
    xor.big_(j eq.not i) H_j$, of dimension $a - s_i$. Their independent containment probabilities give the
    additional factor $product_i theta.alt_d \( a - s_i \)$. The total exponent is
  #[#set math.equation(numbering: n => "(5.22)")
   $ & 2 d a - frac(3 a^2 - a, 2) + a^2 - sum_i s_i^2 + sum_i [- d \( a - s_i \) + binom(a - s_i, 2)] = -
     sum_i b \( s_i \) . $ <eq:orbits-pair-cost-cancellation>]
  Multiplying with Equation (5.19), and ignoring all conditions beyond these containments,
    proves the asserted profile upper bound.
  The profile upper bound is now established. The center-factor comparison also needs a lower bound for each
    individual ordered orbit; the remaining argument supplies that bound while keeping the intersections exact.
  ===== 5.3.2 Splitting off the pair intersections. <splitting-off-the-pair-intersections.>
  We next identify all invariants of an actual common-zero triple. Fix $i$.
    The pairing $H_i arrow.r L_i^(*)$ is injective, since its kernel is $H_i ∩ L_i^perp = H_i ∩ L_i = 0$.
    Its transpose is therefore surjective. Choose an $s_i$-space $Q_i subset.eq L_i$ paired perfectly with $H_i$.
    Both spaces are isotropic, so $B_i = H_i xor Q_i$ is a nondegenerate symplectic $2 s_i$-space.
    Each $L_ell$ contains a Lagrangian of $B_i$: it contains $Q_i$ when $ell = i$ and $H_i$ otherwise.
    Call that subspace $K_ell$. Under the orthogonal decomposition $cal(V) = B_i perp B_i^perp$,
    the projection of a vector $x in L_ell$ to $B_i$ is orthogonal to $K_ell$, hence belongs to $K_ell$.
    As $K_ell subset.eq L_ell$, subtracting the projection gives the actual splitting
  #[#set math.equation(numbering: n => "(5.23)")
   $ L_ell = K_ell xor \( L_ell ∩ B_i^perp \) \, wide ell = 1 \, 2 \, 3 . $ <eq:orbits-forced-splitting>]
  For $j eq.not i$, the space $H_j$ lies in $B_i^perp$: it is orthogonal to $H_i$,
    and is orthogonal to $Q_i$ because $H_j \, Q_i subset.eq L_i$.
    Thus the other pair intersections survive in the orthogonal complement,
    and the construction can be repeated there. The zero-dimensional blocks require no choice.
  After splitting all three blocks, the remaining ordered triple is transverse in a symplectic space of dimension
    $2 z$. The space $H_(*)$ is Lagrangian in the sum of the three blocks,
    so this remaining triple is precisely the reduction of the original triple to $H_(*)^perp \/
    H_(*)$ as in Equation (5.2). Symplectic bases identify any two corresponding pair blocks,
    respecting all three members of the ordered triple. A symplectic map identifying the residual ordered triples
    extends over these block maps. Consequently, the dimensions $s_i$ and the residual ordered orbit determine the
    entire common-zero ordered orbit. For $c > 0$, first identify the common spaces;
    Equation (5.1) and the extension in Equation (5.3) show that the same assertion lifts to the original space.
    In particular there is no further invariant arising from extensions between the blocks.
  ===== 5.3.3 The mass of a residual orbit. <the-mass-of-a-residual-orbit.>
  An ordered transverse pair of Lagrangians in dimension $2 z$ can be identified with the two coordinate spaces.
    A third Lagrangian transverse to both is then the graph of a nonsingular symmetric form.
    The stabilizer of the ordered pair consists of the maps induced by $g in
    "GL"_z \( bb(F)_q \)$ on one coordinate space and its inverse dual on the other;
    its action on forms is congruence. Thus residual ordered orbits correspond exactly to congruence orbits
    $cal(O)_(upright("form"))$ of nonsingular symmetric forms.
    For this classification of ordered transverse triples, see also Kramer and Tent #cite(label("kramertent2010"))
    Theorem 6 and Section 2.3. For three independent uniform residual Lagrangians,
    a prescribed residual orbit has probability exactly
  #[#set math.equation(numbering: n => "(5.24)")
   $ frac(q^(b \( z \)) \| cal(O)_(upright("form")) \|, L_z^2) . $ <eq:orbits-residual-mass>]
  Indeed, after the first Lagrangian is chosen, the second is transverse with probability $q^(b \( z \)) \/ L_z$;
    for each such ordered pair there are $\| cal(O)_(upright("form")) \|$ choices of the third among $L_z$ Lagrangians.
  This probability has a positive lower bound depending only on $z$, uniformly in the form class.
    Diagonalize a nonsingular symmetric form $F$ and choose an orthogonal basis with specified nonzero norms.
    An isometry is determined by the images of this basis. At the stage when the remaining nondegenerate
    orthogonal complement has dimension $k$, there are at most $2 q^(k - 1)$ vectors of a specified nonzero norm:
    after diagonalizing, fix $k - 1$ coordinates and solve a quadratic equation in the last one.
    Each chosen vector has nonzero norm, so the next orthogonal complement is again nondegenerate. Hence
  #[#set math.equation(numbering: n => "(5.25)")
   $ \| "Isom" \( F \) \| lt.eq 2^z q^(z \( z - 1 \) \/ 2) \, wide \| cal(O)_(upright("form")) \| gt.eq
     2^(- z) q^(b \( z \)) product_(j = 1)^z \( 1 - q^(- j) \) . $ <eq:orbits-isometry-bound>]
  Orbit–stabilizer and Equation (5.5) give the second inequality.
    For example, for every odd prime the lower bound in Equation (5.24) is at least
  #[#set math.equation(numbering: n => "(5.26)")
   $ gamma_z := 2^(- z) frac(product_(j = 1)^z \( 1 - 3^(- j) \), product_(j = 1)^z \( 1 + 3^(- j) \)^2) > 0 .
     $ <eq:orbits-residual-constant>]
  For $z = 0$, there is one residual Lagrangian and one empty form; $L_0 = 1$, $\| cal(O)_(upright("form")) \| =
    1$, and Equation (5.24) is exactly one. We take $gamma_0 = 1$.
  We have identified the residual form class and bounded its probability in its own symplectic space.
    We must now lift that estimate through the chosen pair-intersection spaces while keeping their intersections
    exact. We condition each Lagrangian separately before imposing the residual orbit.
  ===== 5.3.4 Independent residual laws and exact intersections. <independent-residual-laws-and-exact-intersections.>
  Fix candidate spaces $H_i$ as in Equation (5.21), and sample the three Lagrangians independently subject to $A_i
    subset.eq L_i$. Require, separately for each sample, the avoidance event
  #[#set math.equation(numbering: n => "(5.27)")
   $ cal(E)_i = { L_i ∩ H_(*) = A_i } . $ <eq:orbits-avoidance>]
  In the containment quotient $A_i^perp \/ A_i$, of half-dimension $d - \( a - s_i \) = z + s_i$,
    failure means meeting the fixed isotropic $s_i$-space $H_(*) \/ A_i$ in a line.
    If $s_i > 0$, a union bound and Equation (5.6) give
  #[#set math.equation(numbering: n => "(5.28)")
   $ bb(P) \( cal(E)_i^c divides A_i subset.eq L_i \) lt.eq frac(q^(s_i) - 1, q - 1) frac(1, q^(z + s_i) + 1) <
     frac(q^(- z), q - 1) lt.eq 1 / 2 . $ <eq:orbits-avoidance-probability>]
  If $s_i = 0$, the failure probability is zero. In particular,
    each avoidance probability is at least $1 \/ 2$ and is $1 - O_D \( q^(- 1) \)$.
    The containments and avoidance events concern each sample separately,
    so after conditioning on all of them the three samples remain independent.
  Let $hat(L)_i$ be the reduction of $L_i$ to $H_(*)^perp \/ H_(*)$.
    Each conditional $hat(L)_i$ is uniform on the Lagrangians of this quotient.
    To verify this, extend any symplectic automorphism of the quotient by the identity on $H_(*)$ and a chosen
    dual, as in Equation (5.3). The resulting map fixes every $H_i$ and $A_i$,
    preserves containment and avoidance, and takes reductions to their images under the prescribed quotient map.
    The conditional law is therefore invariant under the full symplectic group of the quotient.
    That group is transitive on its Lagrangians, so the law is uniform.
    Since the reduction is a function of each sample individually, the three reductions are also independent.
  Require their ordered residual orbit to be the one of the fixed target orbit $cal(O)$.
    By Equation (5.24), this has conditional probability at least $gamma_z$.
    These conditions force the selected pair intersections to be exact.
    For example, if $x in L_i ∩ L_j$, then $x$ is orthogonal to every $H_ell$:
    for each $ell$, at least one of $L_i \, L_j$ contains $H_ell$.
    Thus $x in H_(*)^perp$, and its image lies in $hat(L)_i ∩ hat(L)_j = 0$. It follows that $x in H_(*)$.
    Avoidance now gives
  #[#set math.equation(numbering: n => "(5.29)")
   $ L_i ∩ L_j subset.eq A_i ∩ A_j = H_k \, wide { i \, j \, k } = { 1 \, 2 \, 3 } . $ <eq:orbits-exact-pairs>]
  The reverse inclusion was imposed from the start. Hence the pair intersections are exactly the $H_k$,
    and the common intersection is zero. The splitting argument proves that every resulting triple belongs to the
    prescribed ordered orbit in the common-space quotient, and then to $cal(O)$ in the original space.
  For each choice of $C_0 \, H_1 \, H_2 \, H_3$, the required additional probability is at least $2^(- 3)
    gamma_z$. Successful choices cannot count a triple twice:
    its exact common space is $C_0$ and its exact pair spaces in the quotient are the $H_i$.
    We have proved the explicit lower bound
  #[#set math.equation(numbering: n => "(5.30)")
   $ bb(P) \( cal(O) \) gt.eq  & 2^(- 3) gamma_z thin I_D \( c \) theta.alt_D \( c \)^3 I_d \( a \)
     frac(\| "GL"_a \( bb(F)_q \) \|, product_i \| "GL"_(s_i) \( bb(F)_q \) \|) product_i
     theta.alt_d \( a - s_i \) . $ <eq:orbits-explicit-lower-bound>]
  Equations (5.19) and (5.22) now give the lower bound in Equation (5.17).
    The upper bound follows from the profile upper bound already proved.
    All product bounds are uniform for $q gt.eq 3$ and involve dimensions at most $D$;
    the explicit $gamma_z$ is uniform over actual form classes.
    Taking minima and maxima over these finitely many dimension tuples gives a single constant $kappa_D$.
  Finally, pair transitivity in Lemma 18 makes the probability of completing a given profile the same for every
    fixed ordered pair of dimension $h$. It equals the unconditional profile probability divided by $pi_(D \, h)$
    when the prescribed pair dimension is $h$, and is zero otherwise.
    The profile upper bound and Equation (5.7) give Equation (5.18). ◻
]

== 6 Local bounds from the planted law <sec:planted>

We now bound the center integral for fixed point Lagrangians,
  including triples whose pair intersections are nonzero. Throughout this section the ambient symplectic space
  $cal(V)$ has dimension $2 D$, where $D = 2 r$. We use the pair probability $pi_(N \, h)$ and the unsigned
  normalized incidence kernel $J$ from Section 5. Thus

$ J \( L \, Y \) = upright(bold(1))_({ dim \( L ∩ Y \) = r }) / pi_(D \, r) \, wide
  pi_(N \, h) asymp q^(- b \( h \)) . $

For a set $A subset.eq { 1 \, 2 \, 3 }$ of active incidences, put

#[#set math.equation(numbering: n => "(6.1)")
 $ cal(F)_A \( L_1 \, L_2 \, L_3 \) = bb(E)_Y product_(i in A) J \( L_i \, Y \) \, $ <eq:planted-face-factor>]

where $Y$ is a uniform Lagrangian. Constants in this section may depend on the fixed dimension $D$,
  but are uniform over the subspaces, their orbits, and the odd primes $q$.
  Every exponent displayed below is an explicit expression in the dimensions;
  there is no unspecified error term in an exponent.

=== 6.1 The density ratio and the common intersection <the-density-ratio-and-the-common-intersection>

Let $mu$ be the law of three independent uniform Lagrangians.
  Define the #emph[planted law] $nu$ by first choosing $Y$ uniformly and then, conditional on $Y$,
  choosing the three $L_i$ independently and uniformly subject to $dim \( L_i ∩ Y \) = r$.
  Pair transitivity makes the conditioning probability equal to $pi_(D \, r)$ for every $Y$. Hence, exactly,

#[#set math.equation(numbering: n => "(6.2)")
 $ frac(d nu, d mu) \( L_1 \, L_2 \, L_3 \) = pi_(D \, r)^(- 3) bb(E)_Y product_(i = 1)^3
   upright(bold(1))_({ dim \( L_i ∩ Y \) = r }) = cal(F)_({ 1 \, 2 \, 3 }) \( L_1 \, L_2 \, L_3 \) .
   $ <eq:planted-density>]

The right side is invariant under simultaneous symplectic maps.
  Therefore, on any actual ordered symplectic orbit $cal(O)$,

#[#set math.equation(numbering: n => "(6.3)")
 $ cal(F)_({ 1 \, 2 \, 3 }) \|_(cal(O)) = frac(nu \( cal(O) \), mu \( cal(O) \)) . $ <eq:planted-orbit-ratio>]

It is essential here to use the mass of this orbit in the denominator.
  If its common intersection has dimension $c$, its opposite pair intersection dimensions are $h_i$, and

#[#set math.equation(numbering: n => "(6.4)")
 $ s_i = h_i - c \, wide d = D - c \, wide C = \( D + 1 \) c + sum_(i = 1)^3 b \( s_i \) \,
   $ <eq:planted-local-dimensions>]

then Proposition 20 gives $mu \( cal(O) \) asymp q^(- C)$,
  uniformly also when the residual transverse space has dimension zero.

We estimate the numerator through four geometric choices.
  First record the actual common space $C_0 = L_1 ∩ L_2 ∩ L_3$, then count how the center $Y$ meets it.
  In the quotient by $C_0$, count the intersections of the three point Lagrangians with the reduced center.
  Finally count the remaining lift forms, which supply any additional pair intersections.
  These counts use the independent laws before the mutual point profile is imposed.

The common space $C_0$ is unique. Thus summing over isotropic $c$-spaces $C_0$, while retaining that equality,
  counts each triple of common dimension $c$ exactly once. For a deterministic summand $C_0$,
  we evaluate probabilities under the original law of four independent uniform Lagrangians.
  Under this law the three containments $C_0 subset.eq L_i$ have total probability $asymp
  q^(- 3 D c + 3 binom(c, 2))$. There are $asymp q^(2 D c - \( 3 c^2 - c \) \/ 2)$ choices of $C_0$,
  so their combined contribution is

#[#set math.equation(numbering: n => "(6.5)")
 $ q^(2 D c - \( 3 c^2 - c \) \/ 2 - 3 D c + 3 binom(c, 2)) = q^(- \( D + 1 \) c) $ <eq:planted-common-count>]

up to a constant factor. These are the counts of Lemma 18.

For the center let $u = dim \( C_0 ∩ Y \)$. Choosing a prospective $u$-space in $C_0$ and requiring its
  containment in $Y$ gives

#[#set math.equation(numbering: n => "(6.6)")
 $ bb(P) { dim \( C_0 ∩ Y \) = u } & lt.eq O #scale(x: 120%, y: 120%)[\(] q^(u \( c - u \) - D u + binom(u, 2))
   #scale(x: 120%, y: 120%)[\)]\
 & = O #scale(x: 120%, y: 120%)[\(] q^(- u \( D - c \) - b \( u \)) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:planted-center-common-cost>]

This bound includes $u = 0$. We now work in the symplectic quotient $C_0^perp \/ C_0$ and write

$ L'_i = L_i \/ C_0 \, wide Y' = #scale(x: 120%, y: 120%)[\(] \( Y ∩ C_0^perp \) +
  C_0 #scale(x: 120%, y: 120%)[\)] \/ C_0 . $

Both are Lagrangians of dimension $d$. There is an exact quotient identity

#[#set math.equation(numbering: n => "(6.7)")
 $ L'_i ∩ Y' = #scale(x: 120%, y: 120%)[\(] \( L_i ∩ Y \) + C_0 #scale(x: 120%, y: 120%)[\)] \/ C_0 \, wide
   dim \( L'_i ∩ Y' \) = dim \( L_i ∩ Y \) - u . $ <eq:planted-quotient-intersection>]

Indeed, a class in the left side has a representative $y in Y ∩ C_0^perp$.
  Membership in $L_i \/ C_0$ means that $y + z in L_i$ for some $z in C_0$.
  Since $C_0 subset.eq L_i$, this implies $y in L_i ∩ Y$. The converse is immediate,
  and the map from $L_i ∩ Y$ to the quotient has kernel $C_0 ∩ Y$.
  On the required incidence event the last dimension is $r - u$.
  This also proves that no choice of lifts is missing from the quotient count.

Put

#[#set math.equation(numbering: n => "(6.8)")
 $ r' = r - u \, wide delta = d - 2 r' = 2 u - c . $ <eq:planted-reduced-parameters>]

For this counting step fix deterministic $C_0 \, Y$ with $dim \( C_0 ∩ Y \) = u$.
  Under the original independent product law, condition only on the three containments $C_0 subset.eq L_i$.
  The quotient Lagrangians $L'_i$ are then independent and uniform, because containment reduction is a bijection.
  The equality $C_0 = ⋂_i L_i$ is still an event to count. Their three individual conditions
  $dim \( L'_i ∩ Y' \) = r'$ consequently have probability $pi_(d \, r')^3 asymp q^(- 3 b \( r' \))$.
  Including the planted normalizer $pi_(D \, r)^(- 3)$, the gain relative to Equation (6.5) is

#[#set math.equation(numbering: n => "(6.9)")
 $ g_C & = 3 #scale(x: 120%, y: 120%)[\[] b \( r \) - b \( r - u \) #scale(x: 120%, y: 120%)[\]] - u \( D - c \) -
   b \( u \)\
 & = 3 / 2 \( 2 r u - u^2 + u \) - u \( 2 r - c \) - 1 / 2 \( u^2 + u \)\
 & = \( r + c + 1 \) u - 2 u^2 . $ <eq:planted-common-gain>]

The preceding independent law is the law #emph[before] imposing the mutual intersection profile of the $L'_i$.
  In particular, their common-zero condition is still an event to be counted.
  Under their three individual center conditions the spaces

$ R_i = L'_i ∩ Y' $

are independent uniform $r'$-subspaces of $Y'$. Conditional on these individual $R_i$,
  the remaining choices of $L'_i$ are independent as well. We use these product laws below,
  and never assert independence after conditioning on the mutual profile.

=== 6.2 The subspace cost and the lift forms <the-subspace-cost-and-the-lift-forms>

The common-space calculation accounts for how the center meets $C_0$.
  It remains to count the prescribed pair intersections in the quotient:
  first inside $Y'$, and then through the remaining choices of the $L'_i$.

Because the required quotient triple has common intersection zero, the $R_i$ must have common intersection zero. Let

#[#set math.equation(numbering: n => "(6.10)")
 $ p_i & = dim \( R_j ∩ R_k \) \, wide t_i = s_i - p_i \, wide P = sum_i p_i \, wide T = sum_i t_i \,\
v & = d - dim \( R_1 + R_2 + R_3 \) \, wide w = 3 r' - d - P + v = frac(d - 3 delta, 2) - P + v \,
  $ <eq:planted-subspace-parameters>]

where ${ i \, j \, k } = { 1 \, 2 \, 3 }$. The pair spaces $R_j ∩ R_k$ form a direct sum.
  To see this, in a relation $a_1 + a_2 + a_3 = 0$ among the three pair spaces,
  membership of two terms in $R_i$ forces the remaining term into $R_i$ as well;
  each term therefore lies in the common intersection and vanishes.
  The related inequality $w gt.eq 0$ follows in the abstract direct sum $R_1 xor R_2 xor R_3$.
  The summation map has kernel of dimension $3 r' - d + v$.
  The three pair-relation spaces consist of vectors of the forms

$ \( 0 \, a \, - a \) \, wide \( - b \, 0 \, b \) \, wide \( z \, - z \, 0 \) . $

Their sum can vanish only if $a = b = z$, hence only if all three vanish.
  They therefore contribute $P$ independent dimensions to that kernel.

Here $p_i$ records the pair-intersection dimension already inside $Y'$, and $t_i = s_i -
  p_i$ is the target additional dimension from the remaining Lagrangian choices.
  The parameter $v$ is the span codimension in $Y'$; $w$ is the dimension of the summation-map kernel after
  quotienting by the subspace generated by the pair relations.

#thm([Lemma 6.1.])[
  #emph[For three independent uniform $r'$-subspaces of a $d$-space, the event of common intersection zero,
    opposite pair dimensions $p_i$, and span codimension $v$ has probability
#[#set math.equation(numbering: n => "(6.11)")
 $ O (q^(- delta P - sum_i p_i^2 - v w)) . $ <eq:planted-subspace-cost>]

]
] <lem:planted-subspace-cost>

#proof[
  Write $n = d - v$. First choose a prospective span $Z$ of dimension $n$.
    There are $asymp q^(n v)$ choices, and the probability that all three independent $r'$-subspaces lie in it is
    $asymp q^(- 3 r' v)$. Conditional on these separate containments,
    the three subspaces are independent uniform $r'$-subspaces of $Z$.
  The number of choices of three pair spaces in direct sum inside $Z$ is $O \( q^(n P - sum_i p_i^2) \)$.
    Indeed, choose their $P$-dimensional sum and then an ordered direct-sum decomposition;
    the two exponents are $P \( n - P \)$ and $P^2 - sum_i p_i^2$.
    Each $R_i$ must contain the sum of the other two pair spaces, of dimension $P - p_i$.
    In $Z$ this costs exponent $\( n - r' \) \( P - p_i \)$, for a total of $2 \( n - r' \) P$.
    We may drop the requirements that $Z$ be exactly the span and that these containments give exactly the pair
    intersections. Thus the total cost exponent is
  $ \( 3 r' - d + v \) v - n P + sum_i p_i^2 + 2 \( n - r' \) P & = \( 3 r' - d + v \) v + \( d - v - 2 r' \) P +
    sum_i p_i^2\
 & = delta P + sum_i p_i^2 + v \( 3 r' - d - P + v \) \, $
  which proves the claim. Infeasible containments have probability zero. ◻
]

We next describe the remaining Lagrangian choices without any generic-position assumption.
  Choose symplectic coordinates $Y' xor \( Y' \)^(*)$ with pairing

$ omega \( \( y \, alpha \) \, \( z \, beta \) \) = beta \( y \) - alpha \( z \) . $

For an $r'$-subspace $R subset.eq Y'$, let $A = R^compose subset.eq \( Y' \)^(*)$ be its annihilator.
  A Lagrangian $L'$ meeting $Y'$ exactly in $R$ projects into $A$ by orthogonality to $R$; its kernel is $R$,
  so the dimensions show that its image is all of $A$. Its induced map $A arrow.r
  Y' \/ R tilde.equiv A^(*)$ is a symmetric bilinear form $F$ on $A$.
  Conversely, every such form gives exactly one lift, namely

#[#set math.equation(numbering: n => "(6.12)")
 $ L' \( R \, F \) = { \( y \, alpha \) : alpha in A \, quad beta \( y \) =
   F \( alpha \, beta \) upright(" for every ") beta in A } . $ <eq:planted-lift-parametrization>]

The set in Equation (6.12) has dimension $d$, intersects $Y'$ in $R$,
  and is isotropic precisely because $F$ is symmetric. This proves the bijection, including when $A = 0$.
  There are exactly $q^(b \( d - r' \))$ lifts for each $R$.
  Under the product law already specified, conditional on the $R_i$, the lift forms $F_i$ on $A_i =
  R_i^compose$ are therefore independent uniform symmetric forms.

For the opposite pair put

#[#set math.equation(numbering: n => "(6.13)")
 $ Q_i = A_j ∩ A_k = \( R_j + R_k \)^compose \, wide dim Q_i = d - 2 r' + p_i = delta +
   p_i . $ <eq:planted-pair-annihilators>]

Use cyclic differences

$ D_1 = \( F_2 - F_3 \) \|_(Q_1) \, wide D_2 = \( F_3 - F_1 \) \|_(Q_2) \, wide D_3 = \( F_1 - F_2 \) \|_(Q_3) . $

Projection of $L'_j ∩ L'_k$ to $\( Y' \)^(*)$ has kernel $R_j ∩ R_k$ and image $"rad" D_i$.
  In fact, a vector $alpha in Q_i$ has simultaneous lifts exactly when the two prescribed classes in $Y' \/
  R_j$ and $Y' \/ R_k$ agree in $Y' \/ \( R_j + R_k \)$. Pairing this agreement against every $beta in
  Q_i$ is exactly the condition $\( F_j - F_k \) \( alpha \, beta \) = 0$. Thus there is an exact sequence

#[#set math.equation(numbering: n => "(6.14)")
 $ 0 arrow.r R_j ∩ R_k arrow.r L'_j ∩ L'_k arrow.r "rad" D_i arrow.r 0 \,\
dim \( L'_j ∩ L'_k \) = p_i + "nullity" D_i . $ <eq:planted-pair-exact-sequence>]

Thus the required reduced pair profile is exactly the event $"nullity" D_i = t_i$ for all $i$.

The remaining task is therefore to bound the simultaneous nullities of the three difference forms.
  We first determine their exact joint law, rather than assuming independence.

#thm([Lemma 6.2.])[
  #emph[Let $A_1 \, A_2 \, A_3$ be arbitrary subspaces of a vector space, put $Q_i = A_j ∩ A_k$, and put $V =
    A_1 ∩ A_2 ∩ A_3$. The image of the cyclic difference map on symmetric forms is exactly
#[#set math.equation(numbering: n => "(6.15)")
 $ {\( D_1 \, D_2 \, D_3 \) : D_1 \|_V + D_2 \|_V + D_3 \|_V = 0} . $ <eq:planted-difference-image>]

 Its codimension in the product of the three form spaces on the $Q_i$ is $b \( dim V \)$.
   Independent uniform $F_i$ give the uniform law on this image.]
] <lem:planted-difference-image>

#proof[
  The displayed constraint is necessary by cancellation. Conversely, take any three target forms satisfying it,
    and prescribe the values of the three original forms on $V$ to be
  $ H_1 = 0 \, wide H_2 = - D_3 \|_V \, wide H_3 = D_2 \|_V . $
  They have the required three cyclic differences on $V$. On each $Q_i$ choose any symmetric extension of the
    prescribed $H_j$ for the positive term of its cyclic difference,
    and prescribe the negative term there by subtracting $D_i$.
  Each $F_i$ has now received prescriptions on exactly two subspaces of $A_i$.
    Their intersection is $V$, and the prescriptions agree there.
    Two symmetric forms on subspaces $B \, C$ agreeing on $B ∩ C$ always extend simultaneously:
    write $B + C = \( B ∩ C \) xor B_0 xor C_0$, retain the prescribed blocks,
    choose the mixed $B_0$–$C_0$ block arbitrarily, and then extend to the ambient space.
    Apply this construction separately for each $F_i$. It proves sufficiency even if the three $A_i$ or $Q_i$ have
    further linear relations.
  Finally, the map taking a target triple to the sum of its restrictions on $V$ is onto the form space on $V$:
    extend any prescribed form from $V$ to one $Q_i$ and take the other two forms to be zero.
    Its kernel therefore has codimension $b \( dim V \)$. A linear map between finite vector spaces sends uniform
    measure to uniform measure on its image, proving the last assertion. ◻
]

In our application $V = \( R_1 + R_2 + R_3 \)^compose$ has dimension $v$.
  Consequently the difference law is exactly the law of three independent uniform target forms conditioned on the
  constraint in Equation (6.15), an event of probability $q^(- b \( v \))$.
  A uniform symmetric form on an $m$-space has nullity at least $t$ with probability $O \( q^(- b \( t \)) \)$.
  For completeness, there are $O \( q^(t \( m - t \)) \)$ prospective radical $t$-spaces,
  and vanishing on one imposes $m t - binom(t, 2)$ independent coefficients; subtracting gives $- b \( t \)$.
  This also covers $t = m = 0$. Under the independent target law we may multiply the three bounds;
  conditioning costs at most $q^(b \( v \))$. We obtain, uniformly for each actual tuple $\( R_1 \, R_2 \, R_3 \)$,

#[#set math.equation(numbering: n => "(6.16)")
 $ bb(P) { "nullity" D_i = t_i med \( 1 lt.eq i lt.eq 3 \) divides R_1 \, R_2 \, R_3 } lt.eq
   O (q^(- sum_i b \( t_i \) + b \( v \))) . $ <eq:planted-nullity-cost>]

An upper bound larger than one is harmless. The common-zero condition on the full lifts,
  or their membership in a particular ordered orbit, can only decrease this probability.
  In particular, we do not replace those extra conditions by an independence claim.

=== 6.3 The resulting gain <the-resulting-gain>

For each fixed parameter tuple, the preceding counts bound its contribution to the numerator in Equation (6.3) by
  the product of the following factors, up to a constant depending on the fixed dimension:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Choice
], table.cell(rowspan: 1, colspan: 1)[Upper-bound factor
]),
  table.cell(rowspan: 1, colspan: 1)[Common space and its three containments
], table.cell(rowspan: 1, colspan: 1)[$q^(- \( D + 1 \) c)$
],
  table.cell(rowspan: 1, colspan: 1)[Center intersection and normalized incidence conditions
], table.cell(rowspan: 1, colspan: 1)[$q^(g_C)$
],
  table.cell(rowspan: 1, colspan: 1)[Subspaces $R_i$ inside the reduced center
], table.cell(rowspan: 1, colspan: 1)[$q^(- delta P - sum_i p_i^2 - v w)$
],
  table.cell(rowspan: 1, colspan: 1)[Nullities of the restricted difference forms
], table.cell(rowspan: 1, colspan: 1)[$q^(- sum_i b \( t_i \) + b \( v \))$
],
)
]

The last factor includes the possible loss $q^(b \( v \))$ from conditioning on the shared restriction constraint.
  We sum over the finitely many tuples and divide by an individual orbit mass bounded below by a constant times
  $q^(- \( D + 1 \) c - sum_i b \( s_i \))$. This cancels the common-space cost and gives the following pointwise gain.

#thm([Proposition 6.3.])[
  (Three active incidences).  #emph[For a local profile $\( h_1 \, h_2 \, h_3 \, c \)$,
    we choose one pointwise gain exponent independent of $q$ as follows.
    Let $cal(U)$ be the union, over all odd prime fields and all ordered orbits of this profile,
    of the parameter tuples arising from actual quadruples $\( L_1 \, L_2 \, L_3 \, Y \)$ with the stated point
    profile and $dim \( L_i ∩ Y \) = r$, using Equations (6.8) and (6.10).
    Their integer entries are bounded at fixed $D$, so $cal(U)$ is finite.
    If $cal(U)$ is empty, the face factor is zero over every odd prime field.
    Otherwise the face factor with three active incidences is $O \( q^g \)$ uniformly over all triples in the
    profile, where
#[#set math.equation(numbering: n => "(6.17)")
 $ g = max_(upright("tuple") in cal(U)) {g_C + sum_i b \( s_i \) - delta P - sum_i p_i^2 - v w -
   sum_i b \( t_i \) + b \( v \)} \, $ <eq:planted-gain>]

 so the selected exponent is independent of $q$.]
  #emph[Every tuple in $cal(U)$ satisfies the following necessary constraints:
#[#set math.equation(numbering: n => "(6.18)")
 $ 0 lt.eq u lt.eq min \( c \, r \) \, quad 0 lt.eq r' = r - u lt.eq d \, quad \| delta \| lt.eq c \, quad d -
   delta = 2 r' \,\
P + T = sum_i s_i lt.eq d \, wide 0 lt.eq t_i lt.eq p_i + delta \, wide 0 lt.eq v lt.eq p_i +
  delta quad \( 1 lt.eq i lt.eq 3 \) \, wide w gt.eq 0 . $ <eq:planted-feasibility>]

 In particular $T lt.eq P + 3 delta$ and $d + 3 delta gt.eq 0$.
   These conditions are not claimed sufficient for realizability.]
] <prop:planted-gain>

#proof[
  Fix an actual ordered orbit $cal(O)$. Start with four independent ambient Lagrangians and the normalizer
    $pi_(D \, r)^(- 3)$ in Equation (6.2). Partition its contribution according to the unique common space $C_0$,
    and then according to $u \, p_i \, t_i \, v$. Equations (6.5)–(6.9), Lemma 21,
    and Equation (6.16) give the numerator bound
  $ nu \( cal(O) \) lt.eq
    O
    (sum_(upright("actual parameter tuples")) q^(- \( D + 1 \) c + g_C - delta P - sum_i p_i^2 - v w - sum_i b \(
    t_i \) + b \( v \))) . $
  At intermediate counting steps we have discarded exactness or orbit conditions only to enlarge the count.
    The parameter tuples indexing the original partition remain actual ones.
    Dividing by the lower bound $mu \( cal(O) \) gt.double q^(- \( D + 1 \) c - sum_i b \( s_i \))$ from
    Proposition 20 proves Equation (6.17). There are only boundedly many dimension tuples for fixed $D$.
    The tuples from the current field belong to $cal(U)$, so its maximum gives a bound uniform in $q$.
  The bounds on $u \, r' \, delta$ follow from their definitions and Equation (6.7).
    The reduced pair intersections are in isotropic direct sum, giving $sum_i s_i lt.eq d$ as in Proposition 20.
    Equation (6.14) gives the bounds on $t_i$, and $V subset.eq Q_i$ gives those on $v$.
    We already proved $w gt.eq 0$. Summing $t_i lt.eq p_i + delta$ gives $T lt.eq P + 3 delta$,
    and summing $v lt.eq p_i + delta$ gives $v lt.eq P \/ 3 + delta$. Thus $P + 3 delta gt.eq 0$ and
  $ d + 3 delta gt.eq 6 delta + 2 P - 2 v gt.eq 4 / 3 \( P + 3 delta \) gt.eq 0 \, $
  where the first inequality uses $w gt.eq 0$. There are further necessary conditions, such as $p_i lt.eq
    r'$ and $P - p_i lt.eq r'$. The later estimates need only Equation (6.18);
    maximizing over actual tuples preserves all the others automatically. ◻
]

The gain bound separates three sources of intersection: $u$ records how the center meets the common space,
  $p_i$ the pair intersections inside the reduced center, and $t_i$ the additional intersections supplied by lift
  forms. Their costs give one pointwise exponent for the center factor.
  The global comparison also needs the cases with fewer active incidences.

#thm([Lemma 6.4.])[
  (At most two active incidences).  #emph[For two active incidences whose point Lagrangians meet in dimension $h$,
    a valid gain exponent is
#[#set math.equation(numbering: n => "(6.19)")
 $ g_2 \( h \) = max_(p + t = h thin \; med 0 lt.eq t lt.eq p lt.eq r) { b \( h \) - p^2 - b \( t \) } =
   b \( floor.l h \/ 2 floor.r \) . $ <eq:planted-two-active-gain>]

 For zero or one active incidence, the face factor is exactly one.]
] <lem:two-active-gain>

#proof[
  Use the two-point version of the planted density identity.
    Under this law the two $R_i = L_i ∩ Y$ are independent uniform $r$-subspaces of the $2 r$-space $Y$.
    Their intersection dimension $p$ has probability $O \( q^(- p^2) \)$:
    for fixed $R_1$, choose a $p$-subspace of it, in $O \( q^(p \( r - p \)) \)$ ways,
    and require its containment in $R_2$, at cost $q^(- p r)$.
    Conditional on the two individual $R_i$, the two lift forms are independent uniform.
    Their difference on $\( R_1 + R_2 \)^compose$, of dimension $p$, is a uniform symmetric form,
    since restriction from either original form space is surjective.
    Equation (6.14) now gives $h = p + t$ with $0 lt.eq t lt.eq p$,
    and the nullity event costs at most $O \( q^(- b \( t \)) \)$.
    The ambient pair orbit has mass $asymp q^(- b \( h \))$ by Lemma 18. Dividing gives the maximand in Equation (6.19).
  For fixed $h$, let $f \( p \) = b \( h \) - p^2 - b \( h - p \)$.
    On its integer domain $ceil.l h \/ 2 ceil.r lt.eq p lt.eq min \( h \, r \)$,
  $ f \( p + 1 \) - f \( p \) = h - 3 p - 1 < 0 . $
  Its maximum is therefore at $p = ceil.l h \/ 2 ceil.r$, which is allowed since $h lt.eq 2 r$.
    If $h = 2 a$ the value is $b \( 2 a \) - a^2 - b \( a \) = b \( a \)$; if $h = 2 a +
    1$ it is $b \( 2 a + 1 \) - \( a + 1 \)^2 - b \( a \) = b \( a \)$. The maximizing parameters are realizable:
    take two $r$-subspaces with intersection $p$, then a symmetric difference form of nullity $t = h - p$.
    Pair transitivity makes this applicable to every pair of intersection dimension $h$.
    Finally, an empty product is one, and for one incidence the mean-one normalization of $J \( L \, Y \)$ gives
    exactly one for every $L$. ◻
]

== 7 The singular contribution <sec:tail>

We now prove that configurations with a positive point-pair intersection make a vanishing contribution.
  Throughout this section the ambient symplectic space has dimension $2 D$, where $D = 2 r$,
  and the point Lagrangians $\( L_i \)_(i in I)$ are independent and uniform.
  We use the unsigned normalized kernel $J$ from Section 5. For an activity set $B subset.eq cal(C)$, put

$ F_j \( \( L_i \)_(i in j) \) = bb(E)_Y product_(i in j : thin \( i \, j \) in B) J \( L_i \, Y \) . $

Center integration gives the product $product_j F_j$. The bounds of Section 6 are pointwise bounds on these
  factors, including on exceptional configurations of the point variables.

For $e = { i \, k } in E$, set $h_e = dim \( L_i ∩ L_k \)$, and for $j in J$ set $c_j = dim ⋂_(i in j) L_i$.
  These dimensions form a #emph[profile]. On a face we use opposite-pair indices $ell = 1 \, 2 \, 3$,
  so that $h_ell = c + s_ell$, $d = D - c$, and

$ C_j = \( D + 1 \) c_j + sum_(ell = 1)^3 b \( s_ell \) \, wide b \( n \) = frac(n \( n + 1 \), 2) . $

All constants in bounds of the form $O_D \( q^x \)$ may depend on $D$ and on the fixed complex.
  Bounds on an exponent that are stated to be uniform in $D$ have a different role:
  they will allow us to choose $D$ before taking any limit in $q$.

We first compare the probability cost of a point profile with the sum of its local gains.
  For sufficiently large $D$, Lemma 28 reduces the remaining cases to zero common dimensions and pair dimensions
  $0$ or $2$. Lemma 30 then gives stronger counts for these cases,
  separating pair spaces that form a direct sum from those that do not.

=== 7.1 Exposing a profile <exposing-a-profile>

Recall that $a_e$ is the fraction of the three bit positions at which the two faces on $e$ differ.
  Proposition 4 gives $a_e gt.eq 1 \/ 3$ for every $e$, and $a_e > 1 \/ 3$ for at least one $e$.

#thm([Proposition 7.1.])[
  (Global profile cost).  #emph[For every prescribed profile, its probability is $O_D \( q^(- cal(C)) \)$, where
#[#set math.equation(numbering: n => "(7.1)")
 $ cal(C) = 1 / 2 (sum_(j in J) C_j - sum_(e in E) \( 1 - a_e \) b \( h_e \)) . $ <eq:global-cost>]

]
] <prop:global-cost>

#proof[
  Fix one of the six classes obtained by prescribing one bit position and its value.
    It consists of eleven faces, is connected in the face adjacency graph, and uses all thirteen points.
    Choose a spanning tree and a parent-first order. The first face uses three points.
    Every subsequent face shares a pair with its parent and can add at most one point.
    Since all thirteen points occur, the ten subsequent faces must each add exactly one fresh point.
  Expose all the point Lagrangians occurring in the first face.
    Its prescribed profile has probability $O_D \( q^(- C_j) \)$ by Proposition 20.
    At a subsequent face $j$, let $e$ be its pair shared with its parent,
    and condition on the sigma-field generated by #emph[all] previously exposed point Lagrangians.
    Earlier face-profile events are measurable in this sigma-field.
    The fresh point remains independent and uniform. If the already exposed pair has the prescribed intersection
    dimension $h_e$, pair transitivity and Proposition 20 give the conditional probability
  $ frac(bb(P) \( upright("the prescribed profile on ") j \), bb(P) \( dim \( L_i ∩ L_k \) = h_e \)) =
    O_D \( q^(- C_j + b \( h_e \)) \) . $
  Here pair transitivity makes the ratio the same for every #emph[specific] pair of that dimension.
    Thus the bound holds after conditioning on the full earlier configuration,
    however its older points are related. If the pair has the wrong dimension,
    the conditional probability is zero. Iterated conditional expectation proves a class probability bound with
    cost $sum_(j upright(" in class")) C_j$ minus $b \( h_e \)$ for its tree pairs.
    Subtracting $b \( h_e \)$ for every internal pair of the class only weakens this bound.
  Let $A$ be the complete profile event and let $A_1 \, dots.h \, A_6$ be the six class profile events.
    Because $A subset.eq A_t$ for each $t$,
  $ bb(P) \( A \)^6 lt.eq product_(t = 1)^6 bb(P) \( A_t \) . $
  This inequality does not require independence among the classes, all of which use all thirteen points.
    Each face appears in three class bounds. A pair $e$ is internal in exactly $3 \( 1 - a_e \)$ classes,
    one for each position where its two faces have the same bit. Taking sixth roots gives Equation (7.1). ◻
]

If the union in Proposition 23 is empty for any three-active face,
  its factor is zero and the entire profile contribution vanishes; omit that profile.
  For each remaining profile and each face, choose an exponent $g_j$ with $F_j =
  O_D \( q^(g_j) \)$ as in Proposition 23 and Lemma 24. For three active incidences choose a maximizing parameter
  tuple in Equation (6.17). The choices range over finite sets at fixed $D$.
  The pointwise gain bounds and Proposition 25 imply

#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E) [upright(bold(1))_(upright("profile")) product_j F_j] =
   O_D (q^(sum_j g_j - cal(C))) . $ <eq:tail-profile-bound>]

In particular, center weighting introduces no new conditional independence assertion in the preceding exposure argument.

=== 7.2 Local slack and its quadratic part <local-slack-and-its-quadratic-part>

The profile bound gives decay when its probability cost exceeds the sum of its local gains.
  We separate this difference into face contributions and a nonnegative term from bit separation.
  A quadratic bound will control large intersection dimensions; separate span counts will handle the equality profiles.

Define the baseline and slack on a face by

$ beta_j = C_j / 2 - 1 / 6 sum_(e subset j) b \( h_e \) \, wide S_j = beta_j - g_j \, $

and define the nonnegative excess separation term

#[#set math.equation(numbering: n => "(7.3)")
 $ cal(E) = 1 / 2 sum_(e in E) \( a_e - 1 \/ 3 \) b \( h_e \) . $ <eq:tail-excess>]

Since each pair occurs twice,

#[#set math.equation(numbering: n => "(7.4)")
 $ cal(C) - sum_j g_j = sum_j S_j + cal(E) . $ <eq:tail-total-slack>]

Local slack can be negative. On a fully active face with $L_1 = L_2 = L_3$,
  all common and pair dimensions equal $D$, and $F_j = pi_(D \, r)^(- 2)$.
  Its gain exponent is $2 b \( r \)$, whereas $beta_j = b \( D \) \/ 2$, so $S_j = - D \/ 4$.
  The global sum and separation below control this common-intersection mode.

#thm([Lemma 7.2.])[
  (Faces with at most two active incidences).  #emph[Let $h = max_(e subset j) h_e$.
    If $j$ has at most two active incidences, then
#[#set math.equation(numbering: n => "(7.5)")
 $ S_j gt.eq 0 \, wide S_j gt.eq h^2 / 24 - h / 12 . $ <eq:tail-lower-active>]

 Equality $S_j = 0$ requires $c_j = 0$ and either all three pair dimensions zero or exactly one pair dimension
   equal to $2$. The latter case requires exactly two active incidences, at that pair’s endpoints.]
] <lem:tail-lower-active>

#proof[
  Put $m = max_ell s_ell$ and choose $ell_0$ with $s_(ell_0) = m$. Using $h = c + m$ and $sum s_ell lt.eq D - c$, expand
  $ 3 C - sum_ell b \( c + s_ell \) - 2 b \( c + m \) & = 3 \( D + 1 \) c - 5 b \( c \) -
    c (sum_ell s_ell + 2 m) + 2 sum_(ell eq.not ell_0) b \( s_ell \)\
 & gt.eq b \( c \) + 2 sum_(ell eq.not ell_0) b \( s_ell \) . $
  The last step uses $sum s_ell + 2 m lt.eq 3 \( D - c \)$;
    substituting this upper bound leaves exactly $b \( c \)$ in the terms involving $c$. Consequently
  #[#set math.equation(numbering: n => "(7.6)")
   $ beta_j gt.eq frac(b \( h \), 3) + frac(b \( c \), 6) + 1 /
     3 sum_(ell eq.not ell_0) b \( s_ell \) . $ <eq:tail-baseline-lower>]
  The gain is zero with zero or one active incidence. With two,
    it is $b \( floor.l h' \/ 2 floor.r \)$ for their pair dimension $h' lt.eq h$. For an integer $h gt.eq 0$,
  $ b \( floor.l h \/ 2 floor.r \) lt.eq frac(b \( h \), 3) \, wide b \( floor.l h \/ 2 floor.r \) lt.eq
    frac(h \( h + 2 \), 8) . $
  The first follows separately for $h = 2 k$ and $h = 2 k + 1$;
    its differences are $k \( k - 1 \) \/ 6$ and $\( k + 1 \) \( k + 2 \) \/ 6$, respectively,
    so equality holds exactly for $h = 0 \, 2$. Combining these inequalities with Equation (7.6) proves
    nonnegativity and $S_j gt.eq b \( h \) \/ 3 - h \( h + 2 \) \/ 8 = h^2 \/ 24 - h \/ 12$.
    Equality forces $c = 0$, $s_ell = 0$ for $ell eq.not ell_0$, and $h = 0$ or $2$.
    When $h = 2$, the gain must equal $1$, which requires the stated two active endpoints.
    With at most one active incidence the positive baseline for $h > 0$ excludes equality. ◻
]

For a face with three active incidences, retain the notation of Section 6:

$ u \, quad r' = r - u \, quad delta = 2 u - c = d - 2 r' \, quad s_ell = p_ell + t_ell \,\
P = sum_ell p_ell \, quad T = sum_ell t_ell \, quad w = frac(d - 3 delta, 2) - P + v . $

The necessary constraints, which will suffice below, are

#[#set math.equation(numbering: n => "(7.7)")
 $ c gt.eq \| delta \| \, wide P + T lt.eq d \, wide p_ell \, t_ell \, v gt.eq 0 \, wide t_ell \, v lt.eq p_ell +
   delta \, wide w gt.eq 0 . $ <eq:tail-feasible>]

In particular $T lt.eq P + 3 delta$, and hence $d + 3 delta gt.eq P + T + 3 delta gt.eq 2 T gt.eq 0$.
  All the dimensions are integers, and $delta = 2 u - c$ with $0 lt.eq u lt.eq c$.

Substituting the gain in Equation (6.17) into $S = beta - g$ gives the exact identity

#[#set math.equation(numbering: n => "(7.8)")
 $ S =  & frac(c \( d + delta - 1 \) - delta \( d + 2 \) + 2 delta^2, 4)\
 & +
   sum_(ell = 1)^3
   [frac(\( 2 p_ell - t_ell \) \( 2 p_ell - t_ell - 1 \), 6) + delta p_ell - c / 6 \( p_ell + t_ell \)] + v w -
   b \( v \) . $ <eq:slack>]

For clarity, the algebra separates into two identities. The common-space part uses $D = d +
  c$ and $u = \( c + delta \) \/ 2$:

$ frac(\( D + 1 \) c, 2) - frac(b \( c \), 2) - #scale(x: 120%, y: 120%)[\(] \( r + c + 1 \) u -
  2 u^2 #scale(x: 120%, y: 120%)[\)] = frac(c \( d + delta - 1 \) - delta \( d + 2 \) + 2 delta^2, 4) . $

For each reduced pair, use $b \( c + s \) = b \( c \) + b \( s \) + c s$ and

$ p^2 + b \( t \) - 2 / 3 b \( p + t \) = frac(\( 2 p - t \) \( 2 p - t - 1 \), 6) . $

These expansions yield every term of Equation (7.8).

Let $Q$ be the homogeneous quadratic part of its right-hand side:

#[#set math.equation(numbering: n => "(7.9)")
 $ Q =  & frac(c \( d + delta \) - delta d + 2 delta^2, 4)\
 & + sum_(ell = 1)^3 [frac(\( 2 p_ell - t_ell \)^2, 6) + delta p_ell - c / 6 \( p_ell + t_ell \)] +
   v (frac(d - 3 delta, 2) - P) + v^2 / 2 . $ <eq:tail-quadratic>]

The remaining terms are linear:

#[#set math.equation(numbering: n => "(7.10)")
 $ S = Q - c / 4 - delta / 2 - frac(2 P - T, 6) - v / 2 . $ <eq:tail-linear-loss>]

The next estimate will turn the total slack into bounds on $P \, T \, delta$.
  When a pair dimension grows, these bounds force its common part to spread through neighboring faces until the
  excess separation is too large. Once all pair dimensions are bounded,
  we return to the exact slack and use its coefficient of $d$.

#thm([Lemma 7.3.])[
  (Coercivity).  #emph[Every tuple satisfying Equation (7.7) satisfies
#[#set math.equation(numbering: n => "(7.11)")
 $ Q gt.eq 1 / 342 \( P^2 + T^2 + delta^2 \) . $ <eq:coercivity>]

]
] <lem:coercivity>

#proof[
  Set
  $ a = (P - frac(d - 3 delta, 2))_(+) \, wide v_0 = min (P / 3 + delta \, frac(P - T + 3 delta, 2)) . $
  Both arguments of the minimum are nonnegative, by Equation (7.7). Completing the square gives
  $ v w - v^2 / 2 = (frac(d - 3 delta, 2) - P) v + v^2 / 2 gt.eq - a^2 / 2 . $
  The condition $w gt.eq 0$ gives $a lt.eq v$; furthermore $v lt.eq min_ell \( p_ell + delta \) lt.eq P \/ 3 +
    delta$. From $d gt.eq P + T$ we also obtain $a lt.eq \( P - T + 3 delta \) \/ 2$. Therefore $a lt.eq v_0$, and
  #[#set math.equation(numbering: n => "(7.12)")
   $ Q gt.eq  & frac(c \( d + delta \) - delta d + 2 delta^2, 4) + frac(\( 2 P - T \)^2, 18) + delta P -
     frac(c \( P + T \), 6) - v_0^2 / 2 . $ <eq:tail-scalar-quadratic>]
  Here we also used $sum_ell \( 2 p_ell - t_ell \)^2 gt.eq \( 2 P - T \)^2 \/ 3$. The coefficient of $c$ on the right is
  $ frac(d + delta, 4) - frac(P + T, 6) gt.eq frac(d + 3 delta, 12) gt.eq 0 . $
  Because $c gt.eq \| delta \|$, replacing $c$ by $\| delta \|$ can only decrease the right side.
    We do so and treat the two signs of $delta$.
  First suppose $delta gt.eq 0$. The remainder in Equation (7.12) becomes
  $ F \( T \) = frac(3 delta^2, 4) + frac(\( 2 P - T \)^2, 18) + frac(\( 5 P - T \) delta, 6) - 1 /
    2 min (P / 3 + delta \, frac(P - T + 3 delta, 2))^2 \, wide 0 lt.eq T lt.eq P + 3 delta . $
  On $0 lt.eq T lt.eq P \/ 3 + delta$, the first argument attains the minimum,
    and $F' \( T \) = \( T - 2 P \) \/ 9 - delta \/ 6 lt.eq 0$; at the right endpoint this derivative is $-
    5 P \/ 27 - delta \/ 18$. On the remaining interval the coefficient of $T^2$ is $1 \/ 18 - 1 \/ 8 = -
    5 \/ 72$, so $F$ is concave. Its minimum is therefore at one of the following two endpoints:
  $ F \( P \/ 3 + delta \) & = frac(32 P^2 + 84 P delta + 45 delta^2, 324) \,\
F \( P + 3 delta \) & = frac(2 P^2 + 12 P delta + 27 delta^2, 36) . $
  Both are at least $\( P^2 + delta^2 \) \/ 18$. Moreover
  $ P^2 + T^2 + delta^2 lt.eq P^2 + \( P + 3 delta \)^2 + delta^2 lt.eq 3 P^2 + 19 delta^2 lt.eq
    19 \( P^2 + delta^2 \) . $
  This proves the desired coefficient $1 \/ \( 18 dot.op 19 \)$ in this case, including $P = delta = 0$.
  Next suppose $delta = - y < 0$. Put $x = P - 3 y gt.eq 0$; then $0 lt.eq T lt.eq x$.
    After setting $c = y$, the coefficient of $d$ is $y \/ 2$.
    Using $d gt.eq P + T = x + 3 y + T$ in Equation (7.12) leaves
  $ G \( T \) = y^2 / 4 + frac(\( 2 x - T \) y, 3) + frac(\( 2 x - T \)^2, 18) - 1 /
    2 min (x / 3 \, frac(x - T, 2))^2 . $
  Its derivative up to $T = x \/ 3$ is $\( T - 2 x \) \/ 9 - y \/ 3 lt.eq 0$;
    after that breakpoint its quadratic coefficient is again $- 5 \/ 72$.
    Thus its minimum is at least the smaller of its breakpoint and last-endpoint values,
  $ G \( x \/ 3 \) & = frac(32 x^2 + 180 x y + 81 y^2, 324) \,\
G \( x \) & = frac(2 x^2 + 12 x y + 9 y^2, 36) . $
  Each is at least $\( x^2 + y^2 \) \/ 18$, including the degenerate interval $x = 0$. Finally,
  $ P^2 + T^2 + y^2 lt.eq \( x + 3 y \)^2 + x^2 + y^2 lt.eq 3 x^2 + 19 y^2 lt.eq 19 \( x^2 + y^2 \) . $
  The same constant $1 \/ 342$ follows, completing the proof. ◻
]

=== 7.3 Uniform control and equality profiles <uniform-control-and-equality-profiles>

Put $M = max_(e in E) h_e$. On every face with three active incidences, $c lt.eq M$, $P lt.eq 3 \( M - c \)$,
  $delta lt.eq c$, and $v lt.eq p_ell + delta lt.eq s_ell + c = h_ell lt.eq M$.
  Equation (7.10) consequently gives the uniform bound

#[#set math.equation(numbering: n => "(7.13)")
 $ S gt.eq Q - frac(3 M, 2) . $ <eq:tail-uniform-linear>]

Indeed the subtracted expression is at most $c \/ 4 + c \/ 2 + \( M - c \) + M \/ 2 = 3 M \/ 2 - c \/ 4$.
  Suppose that the cost in Equation (7.1) does not yet give a strict saving, so $sum_j S_j + cal(E) lt.eq 0$.
  Let $J_3$ denote the faces with three active incidences and let $h_j = max_(e subset j) h_e$.
  Summing Lemma 27, Equation (7.13), and Lemma 26 gives

#[#set math.equation(numbering: n => "(7.14)")
 $ & sum_(j in J_3) frac(P_j^2 + T_j^2 + delta_j^2, 342) + sum_(j in.not J_3) h_j^2 / 24 + cal(E) lt.eq
   33 M . $ <eq:tail-budget>]

To see the constant explicitly, each three-active face can lose at most $3 M \/ 2$,
  and each lower-activity face loses at most $h_j \/ 12 lt.eq M \/ 12 lt.eq 3 M \/ 2$;
  there are twenty-two faces in total. Every term on the left of Equation (7.14) is nonnegative.
  Thus it bounds each term separately, despite the possible negative individual slacks.

#thm([Lemma 7.4.])[
  (Profiles not separated by the first cost).  #emph[There is an even-dimensional threshold such that,
    for every even $D$ above it, every feasible profile and every activity set for which $sum_j g_j gt.eq
    cal(C)$ has the following properties:
#[#set math.equation(numbering: n => "(7.15)")
 $ c_j = 0 quad \( j in J \) \, wide h_e in { 0 \, 2 } quad \( e in E \) \, wide sum_j g_j lt.eq 2 /
   3 sum_(e in E) b \( h_e \) . $ <eq:tail-residual-profile>]

]
] <lem:tail-residue>

#proof[
  Assume $sum_j S_j + cal(E) lt.eq 0$. We first bound all pair dimensions independently of $D$, the activity set,
    and the choices of maximizing tuples.
  ===== 7.3.1 A uniform bound for pair dimensions. <a-uniform-bound-for-pair-dimensions.>
  Equation (7.14) gives a constant $K gt.eq 1$, depending only on the fixed numerical coefficients, such that
  $ P_j + T_j lt.eq K sqrt(M) quad \( j in J_3 \) \, wide h_j lt.eq K sqrt(M) quad \( j in.not J_3 \) \, wide
    cal(E) lt.eq 33 M . $
  The case $M = 0$ already has the required bound. Suppose $M > 0$,
    and choose a face $j_0$ containing a pair of dimension $M$.
    For sufficiently large $M$, this face cannot have lower activity, because $M > K sqrt(M)$.
    On a three-active face every reduced pair dimension satisfies $s_ell lt.eq P + T lt.eq K sqrt(M)$.
    Thus a pair of dimension $h$ on that face forces its common dimension,
    and hence every pair dimension on the face, to be at least $h - K sqrt(M)$.
  Let $ell_(*)$ be the diameter of the fixed connected face-neighbor graph.
    We claim by induction on $t$ that every face at distance $t$ from $j_0$ is three-active and every pair on it
    has dimension at least $M - \( t + 1 \) K sqrt(M)$. The preceding paragraph gives the case $t = 0$.
    When $M$ is large enough that
  $ M - \( ell_(*) + 1 \) K sqrt(M) gt.eq M \/ 2 > K sqrt(M) \, $
  choose for a face at distance $t + 1$ its predecessor on a shortest path from $j_0$.
    Their shared pair has dimension greater than $K sqrt(M)$, so the new face cannot have lower activity.
    Applying the three-active bound proves the claimed lower bound at distance $t + 1$.
    Induction therefore gives $h_e gt.eq M \/ 2$ for every pair $e$.
  Fix a pair $e_(*)$ with $a_(e_(*)) > 1 \/ 3$. Its contribution to $cal(E)$ is at least
  $ 1 / 2 \( a_(e_(*)) - 1 \/ 3 \) b \( h_(e_(*)) \) gt.eq frac(a_(e_(*)) - 1 \/ 3, 16) M^2 . $
  For large $M$ this contradicts $cal(E) lt.eq 33 M$. Hence there is an integer $M_(*)$, independent of $D$,
    the activity set, and the maximizing tuples, such that every profile under consideration satisfies $M lt.eq M_(*)$.
  ===== 7.3.2 Choose the dimension after this bound. <choose-the-dimension-after-this-bound.>
  On a three-active face with $M lt.eq M_(*)$, the integers $c \, p_ell \, t_ell \,
    v$ lie between $0$ and $M_(*)$, and $\| delta \| lt.eq M_(*)$. Put $n_ell = 2 p_ell - t_ell$.
    Substituting the definition of $w$ into Equation (7.8) gives
  #[#set math.equation(numbering: n => "(7.16)")
   $ S = A d + R \, wide A = frac(c - delta + 2 v, 4) = frac(c - u + v, 2) \, $ <eq:tail-leading-coefficient>]
  where
  $ R =  & frac(c \( delta - 1 \) - 2 delta + 2 delta^2, 4) + 1 /
    6 sum_(ell = 1)^3 [n_ell \( n_ell - 1 \) + 6 delta p_ell - c \( p_ell + t_ell \)]\
 & - (frac(3 delta, 2) + P) v + frac(v \( v - 1 \), 2) . $
  Let $C_(*)$ be the maximum of $\| R \|$ over the finite integer box $0 lt.eq c \, p_ell \, t_ell \, v lt.eq
    M_(*)$, $\| delta \| lt.eq M_(*)$, with $P = sum_ell p_ell$.
    This bounds every actual remainder and is independent of $D$.
  For an actual tuple, $0 lt.eq u lt.eq c$ and $v gt.eq 0$, so $A gt.eq 0$. Moreover $c \, u \, v$ are integers:
    either $A = 0$ or $A gt.eq 1 \/ 2$. Choose an even $D$ with
  $ D > M_(*) + 44 C_(*) . $
  If a three-active face had $A > 0$, it would have $S gt.eq \( D - M_(*) \) \/ 2 - C_(*)$.
    Every other three-active face has $S gt.eq - C_(*)$, every lower-activity face has nonnegative slack,
    and $cal(E) gt.eq 0$. Since there are $22$ faces, the total slack would be at least
  $ frac(D - M_(*), 2) - 22 C_(*) > 0 \, $
  contrary to the hypothesis. Thus every three-active face has $u = c$, $delta = c$, and $v = 0$.
  ===== 7.3.3 Integer equality profiles. <integer-equality-profiles.>
  For these parameters, Equation (7.8) becomes
  #[#set math.equation(numbering: n => "(7.17)")
   $ S = frac(3 c^2 - 3 c, 4) + 1 / 6 sum_(ell = 1)^3 [n_ell^2 + \( c - 1 \) n_ell + 3 c p_ell] .
     $ <eq:tail-integer-slack>]
  If $c gt.eq 2$, completing the square in $n_ell$ gives
  $ S gt.eq frac(3 c \( c - 1 \), 4) - frac(\( c - 1 \)^2, 8) = frac(\( c - 1 \) \( 5 c + 1 \), 8) > 0 . $
  If $c = 1$, then $S = sum_ell \( n_ell^2 + 3 p_ell \) \/ 6 gt.eq 0$, and equality forces $p_ell = t_ell =
    0$ for every $ell$. If $c = 0$, the constraint $t_ell lt.eq p_ell$ gives the integer $n_ell gt.eq p_ell gt.eq
    0$. Each $n_ell \( n_ell - 1 \)$ is nonnegative, and its zeros give precisely
  $ \( p_ell \, t_ell \) = \( 0 \, 0 \) quad upright("or") quad \( 1 \, 1 \) . $
  Thus every slack is nonnegative at the chosen dimension. The assumed inequality forces every slack,
    and $cal(E)$, to be zero.
  A zero-slack face with $c = 1$ has all pair dimensions equal to $1$.
    Any face across one of these pairs cannot be a lower-activity equality case from Lemma 26,
    and cannot be a three-active equality case with $c = 0$. It must have $c = 1$ as well.
    Connectivity would give $h_e = 1$ for every $e$, contradicting $cal(E) = 0$ at a pair with $a_e > 1 \/ 3$.
    The remaining equality cases have $c_j = 0$ and $h_e in { 0 \, 2 }$.
    As $S_j = 0$, their gains equal their baselines, and
  $ sum_j g_j = sum_j 1 / 3 sum_(e subset j) b \( h_e \) = 2 / 3 sum_e b \( h_e \) . $
  The choices of $M_(*)$ and $C_(*)$ were uniform in the activity set and maximizing tuples,
    so the dimension threshold works for all of them simultaneously. ◻
]

=== 7.4 Two counts for the remaining pair spaces <two-counts-for-the-remaining-pair-spaces>

It remains to improve the cost for the profiles in Equation (7.15).
  Their nonzero pair intersections are two-dimensional, and each pair space must lie in the Lagrangians at both
  endpoints. A dependence among the pair spaces forces at least one extra dimension in the sum of the local
  endpoint spans, producing a factor $q^(- D)$. For a direct family,
  the independent orthogonality constraints instead give the required cost after the endpoint containment factors
  cancel. The total ambient span need not be isotropic.

#thm([Lemma 7.5.])[
  (A strict span inequality).  #emph[Let $H_e$ be subspaces assigned to distinct pairs $e$ of a simple graph. Set
$ k = dim sum_e H_e \, wide k_i = dim sum_(e in.rev i) H_e . $

 Then $sum_i k_i gt.eq 2 k$. If the nonzero spaces do not form a direct sum, then $sum_i k_i gt.eq 2 k + 1$.]
] <lem:tail-span>

#proof[
  For any ordering of the spaces, let $Delta_e$ be the increment in the dimension of the global span when $H_e$ is
    added. At each endpoint $i$ of $e$, let $Delta_(e \, i)$ be its increment in the local span.
    The earlier local span is contained in the earlier global span, so $Delta_(e \, i) gt.eq Delta_e$.
    Summing gives $sum_i k_i gt.eq 2 sum_e Delta_e = 2 k$.
  If the family is not direct, choose an inclusion-minimal subfamily $cal(T)$ which is not direct.
    Order its members first and let $e$ be its last member. Put
  $ delta_(*) = dim (H_e ∩ sum_(f in cal(T) \\ { e }) H_f) > 0 . $
  At least one endpoint $i$ of $e$ fails to belong to some other member of $cal(T)$:
    otherwise every other pair in $cal(T)$ would contain both endpoints of $e$ and would equal $e$.
    The members of $cal(T)$ visible at this $i$, including $e$,
    are therefore a proper subfamily and form a direct sum by minimality. Consequently
  $ Delta_(e \, i) = dim H_e = Delta_e + delta_(*) . $
  All other increment comparisons remain nonnegative, and hence $sum_i k_i gt.eq 2 k + delta_(*) gt.eq 2 k + 1$.
    The argument uses the actual dimension $delta_(*)$ and in particular includes a partial intersection of $H_e$
    with the earlier span. ◻
]

#thm([Lemma 7.6.])[
  (Costs for the remaining profiles).  #emph[For a profile satisfying Equation (7.15),
    let $m$ be the number of pairs with $h_e = 2$. The contribution of configurations whose pair spaces are not
    direct is $O_D \( q^(- D + 1641) \)$. The contribution of configurations whose pair spaces are direct is
$ O_D (q^(- 1 / 3 sum_e b \( h_e \))) . $

 Here “contribution” includes the product of the center factors. The numerical remainder $1641$ is independent of $D$.]
] <lem:tail-residual-counts>

#proof[
  Write $H_e = L_i ∩ L_k$ for $e = { i \, k }$, and use $k \, k_i$ as in Lemma 29.
    We count possible $H_e$ and impose their containment in the independent $L_i$.
    Discarding exactness of the intersections can only enlarge the count.
    A nonisotropic local span cannot be contained in a Lagrangian and contributes zero.
    For every isotropic local span of dimension $k_i$, its containment probability is
    $O_D \( q^(- D k_i + binom(k_i, 2)) \)$ by Lemma 18.
  For the nondirect case, first choose an arbitrary $k$-space in the $2 D$-space,
    in $O_D \( q^(k \( 2 D - k \)) \)$ ways, and then choose the $m$ two-spaces inside it,
    in $O_D \( q^(2 m \( k - 2 \)) \)$ ways. Requiring their span to be the chosen space would only reduce this
    upper bound. On the stratum with fixed $k$ and $k_i$, multiplying the containment probabilities gives exponent
  $ - D (sum_i k_i - 2 k) - k^2 + 2 m k - 4 m + sum_i binom(k_i, 2) . $
  The point degrees in the pair graph, given by Proposition 4,
    are $\( 4 \, 6 \, 4 \, 6 \, 5 \, 4 \, 5 \, 5 \, 5 \, 6 \, 5 \, 6 \, 5 \)$. Therefore
  $ sum_i binom(k_i, 2) lt.eq sum_i binom(2 deg \( i \), 2) = 618 . $
  Since $m lt.eq 33$ and $- k^2 + 2 m k lt.eq m^2$, the part of the exponent independent of $D$ is at most
  $ m^2 - 4 m + 618 lt.eq 1575 . $
  Lemma 29 makes the coefficient of $- D$ at least one. There are only boundedly many $k \, k_i$,
    independently of $D$, because $k lt.eq 2 m lt.eq 66$ and $k_i lt.eq 2 deg \( i \)$.
    Thus the probability of this part of the profile is $O_D \( q^(- D + 1575) \)$.
    Its total gain is at most $2 / 3 sum_e b \( h_e \) = 2 m lt.eq 66$, proving the first bound.
    The ambient span in this argument was arbitrary; only the local spans were required to be isotropic.
  For the direct case, the following count applies to arbitrary fixed dimensions $h_e$.
    Order the pairs and choose an ordered basis of each $H_e$.
    Each new basis vector must be orthogonal to the previous vectors of its own space and to all vectors of
    earlier spaces sharing an endpoint. In a direct family these previous vectors are linearly independent.
    Nondegeneracy of the symplectic form identifies ambient vectors with linear functionals,
    so their orthogonality equations are independent, even if the previous vectors are mutually orthogonal.
    If there are $a$ such equations, there are exactly $q^(2 D - a)$ vectors satisfying them.
    Excluding choices which would destroy directness only decreases this count.
  Let $e tilde.op f$ mean distinct pairs sharing an endpoint, and count each unordered pair ${ e \, f }$ once.
    Dividing the sequential basis count by the number of ordered bases in each space gives at most
  $ O_D (q^(thin 2 D sum_e h_e - sum_e h_e^2 - sum_e binom(h_e, 2) - sum_(e tilde.op f) h_e h_f)) $
  possible direct families satisfying all local orthogonality conditions. Here $k_i = sum_(e in.rev i) h_e$, so
  $ sum_i k_i = 2 sum_e h_e \, wide sum_i binom(k_i, 2) = 2 sum_e binom(h_e, 2) + sum_(e tilde.op f) h_e h_f . $
  Distinct pairs in a simple graph share at most one endpoint, which explains the coefficient of the last sum.
    Multiplying by the containment probabilities cancels both the $D$ terms and the cross terms.
    The remaining exponent is exactly
  $ - sum_e h_e^2 + sum_e binom(h_e, 2) = - sum_e b \( h_e \) . $
  The gain bound in Equation (7.15) now leaves $- 1 / 3 sum_e b \( h_e \)$, as asserted. ◻
]

=== 7.5 Completion of the rank-layer estimate <completion-of-the-rank-layer-estimate>

#thm([Proposition 7.7.])[
  (Vanishing singular contribution).  #emph[For every sufficiently large even $D =
    2 r$ and every activity set $B subset.eq cal(C)$,
#[#set math.equation(numbering: n => "(7.18)")
 $ bb(E)_(L \, Y)
   [upright(bold(1))_({ exists e = { i \, k } in E : thin dim \( L_i ∩ L_k \) > 0 }) product_(\( i \, j \) in B)
   J \( L_i \, Y_j \)] = o \( 1 \) $ <eq:tail-vanishing>]

 as $q arrow.r oo$ through odd primes, with $D$ fixed. The dimension threshold can be chosen for all activity sets
   simultaneously.]
] <prop:singular-tail>

#proof[
  Choose an even $D$ above the threshold in Lemma 28 and also with $D > 1641$.
    These thresholds refer only to dimensions and the fixed complex.
    For any profile with some $h_e > 0$, either $cal(C) > sum_j g_j$, or it satisfies Equation (7.15).
    In the first case, Equation (7.2) gives a strictly negative $q$-exponent.
    In the second, the two bounds in Lemma 30 are strictly negative because $D > 1641$ and $sum_e b \( h_e \) > 0$.
  At this fixed $D$, every selected gain is an integer and $6 cal(C)$ is an integer,
    because $3 a_e$ is an integer. A strict first-cost saving is therefore at least $1 \/ 6$.
    A singular direct residual profile saves at least $1$, and the nondirect case also saves at least $1$ because
    even $D > 1641$ implies $D gt.eq 1642$. There are finitely many profiles and activity sets,
    and the gain exponents were selected from the fixed finite unions in Proposition 23.
    Summing their vanishing contributions proves Equation (7.18).
    The local maximizing tuples need not be realizable simultaneously:
    the residue argument uses only their necessary dimension inequalities and the shared profile dimensions.
    In particular, no simultaneous limit in $D$ and $q$ has been used.
    The bound $D > 1641$ is needed here only for the nondirect residual case and is not asserted to be a threshold
    for the whole proof. ◻
]

#proof[
  Choose an even $D$ large enough for both Proposition 17 and Proposition 31. For the matrix variables let
  $ cal(T) = { det \( X_i - X_k \) eq.not 0 upright(" for every ") { i \, k } in E } . $
  On $cal(T)$, Proposition 17 gives the right-hand side of Equation (3.2), up to $o \( 1 \)$,
    for every fixed activity set and every choice of incidence signs. The integrand is nonnegative.
    Lemma 19 bounds its contribution on $cal(T)^c$ by a constant depending on $D$ times the unsigned Lagrangian
    contribution in Equation (7.18): graph intersections project isomorphically onto the kernels of matrix
    differences, and dropping the prescribed signs only enlarges the integrand after the comparable
    normalizations. This contribution is $o \( 1 \)$ by Proposition 31.
    Adding the transverse and singular parts proves Equation (3.2).
    There are only finitely many activity sets and sign assignments,
    so the convergence is uniform over the choices required in Section 3. This proves Lemma 5.
    The construction in Section 3 therefore yields the strict symmetric-kernel inequality,
    and Lemma 10 gives a finite simple host $G$ with $t \( H \, G \) < p \( G \)^66$, proving Theorem 1. ◻
]

== 8 Amplification and the forcing consequence <sec:consequences>

Theorem 1 is now proved. We derive the two consequences stated in the introduction directly from its finite host.
  The first uses tensor powers to amplify the homomorphism deficit and blow-ups to compare injective copies at a
  positive limiting density. The second keeps the edge density fixed while interpolating to an exact graphon
  equality, and then samples a nonquasirandom sequence of finite graphs.

=== 8.1 Amplification and injective copies <amplification-and-injective-copies-1>

#proof[
  Take $G$ from Theorem 1 and put $N = \| V \( G \) \|$, $p_0 = p \( G \)$, $t_0 = t \( H \, G \)$, and $rho =
    t_0 \/ p_0^66$. Simplicity and an edge give $0 < p_0 < 1$,
    and mapping the two parts of $H$ to the endpoints of an edge gives $t_0 > 0$. Thus $0 < rho < 1$.
  Let $G^(times r)$ be the categorical power, whose adjacency is coordinatewise.
    It is finite, simple and undirected, and homomorphisms into it factor coordinatewise. Hence
  $ p \( G^(times r) \) = p_0^r \, wide t \( H \, G^(times r) \) = t_0^r \, wide
    frac(t \( H \, G^(times r) \), p \( G^(times r) \)^66) = rho^r arrow.r 0 \, $
  which proves (i). This is the standard tensor-power principle #cite(label("conlonfoxsudakov2010")) Section 2.
  For (ii), use instead the balanced independent blow-ups $F_s = G \[ s \]$:
    replace each vertex by an independent set of size $s$, and each edge by the complete bipartite graph between
    its two sets. Then $n_s = N s$, $p \( F_s \) = p_0$, and $t \( H \, F_s \) = t_0$,
    since each homomorphism into $G$ has exactly $s^35$ lifts.
    For $n_s gt.eq 35$, set $q_s = "Inj" \( H \, F_s \) \/ \( n_s \)_35$.
    This is the homomorphism probability for a uniform vertex map conditioned on injectivity,
    so the collision union bound gives
  $ \| q_s - t_0 \| lt.eq 1 - frac(\( n_s \)_35, n_s^35) lt.eq binom(35, 2) / n_s . $
  Meanwhile $d_s = p_0 n_s \/ \( n_s - 1 \) arrow.r p_0$. Therefore $q_s \/ d_s^66 arrow.r rho < 1$,
    proving (ii) with $p_(*) = p_0$ and $delta_(*) = \( 1 - rho \) \/ 2$. ◻
]

=== 8.2 Failure of the forcing conjecture <failure-of-the-forcing-conjecture>

#proof[
  Let $G$ be the host from Theorem 1, put $N = \| V \( G \) \|$, and set $p = p \( G \)$.
    Since $G$ has an edge and is simple,
  $ 0 < p lt.eq frac(N - 1, N) < 1 . $
  Let $W_0$ be its adjacency kernel on the uniform probability space $V \( G \)$.
    Independent vertex samples count all homomorphisms, so
  $ t \( K_2 \, W_0 \) = p \, wide t \( H \, W_0 \) = t \( H \, G \) < p^66 . $
  Moreover, $W_0$ is ${ 0 \, 1 }$-valued, and hence $parallel W_0 - p parallel_2^2 = p \( 1 - p \) > 0$.
  On the balanced sign space ${ - 1 \, 1 }$, choose $0 < delta lt.eq
    min \( p \, 1 - p \)$ and define the rank-one perturbation
  $ W_1 \( a \, b \) = p + delta a b . $
  It takes values in $\[ 0 \, 1 \]$ and has mean $p$. For $A subset.eq E \( H \)$,
    let $d_A \( v \)$ be the degree of $v$ in the edge set $A$.
    Expanding the product defining $t \( H \, W_1 \)$ and averaging the independent signs gives
  $ t \( H \, W_1 \) = sum_(A subset.eq E \( H \)\
d_A \( v \) upright(" even for every ") v) p^(66 - \| A \|) delta^(\| A \|) > p^66 . $
  Indeed, the empty edge set contributes $p^66$, every surviving term is nonnegative,
    and the edge set of a cycle contributes a strictly positive term.
    Such a cycle exists because a forest on $35$ vertices has at most $34$ edges, whereas $H$ has $66$.
  Lift the two kernels to the independent coordinates of $Omega = V \( G \) times { - 1 \, 1 }$,
    with product probability, and set
  $ W_s #scale(x: 120%, y: 120%)[\(] \( x \, a \) \, \( y \, b \) #scale(x: 120%, y: 120%)[\)] = \( 1 - s \)
    W_0 \( x \, y \) + s W_1 \( a \, b \) \, wide 0 lt.eq s lt.eq 1 . $
  Each $W_s$ is symmetric, takes values in $\[ 0 \, 1 \]$, and has mean $p$.
    The endpoint lifts preserve their $H$-densities. The two centered summands depend on independent coordinate
    pairs and have mean zero, so they are orthogonal in $L^2 \( Omega^2 \)$. Thus
  $ parallel W_s - p parallel_2^2 = \( 1 - s \)^2 p \( 1 - p \) + s^2 delta^2 > 0 wide \( 0 lt.eq s lt.eq 1 \) . $
  The function $s mapsto t \( H \, W_s \)$ is a polynomial.
    Its endpoint values lie strictly below and above $p^66$, respectively,
    so some $s_(*) in \( 0 \, 1 \)$ satisfies $t \( H \, W_(s_(*)) \) = p^66$.
    The norm identity shows that $W = W_(s_(*))$ is nonconstant.
  For completeness, this gives failure of asymptotic quasirandomness, not just a graphon equality.
    On the finite atom space of $W$, put
  $ r \( x \) = bb(E)_z W \( x \, z \) \, wide c \( x \, y \) = bb(E)_z W \( x \, z \) W \( y \, z \) . $
  Two applications of Cauchy–Schwarz give
  $ t \( C_4 \, W \) & = bb(E)_(x \, y) c \( x \, y \)^2\
 & gt.eq #scale(x: 120%, y: 120%)[\(] bb(E)_(x \, y) c \( x \, y \) #scale(x: 120%, y: 120%)[\)]^2 =
   #scale(x: 120%, y: 120%)[\(] bb(E)_z r \( z \)^2 #scale(x: 120%, y: 120%)[\)]^2 gt.eq p^4 . $
  Equality would force $r \( x \) = p$ for every $x$ and $c \( x \, y \) = p^2$ for every pair $\( x \, y \)$:
    every atom pair has positive mass, including the diagonal pairs. Then, for every $x$,
  $ bb(E)_z #scale(x: 120%, y: 120%)[\(] W \( x \, z \) - p #scale(x: 120%, y: 120%)[\)]^2 = c \( x \, x \) -
    2 p r \( x \) + p^2 = 0 \, $
  contrary to nonconstancy. Hence $t \( C_4 \, W \) > p^4$.
  Use the independent sampling construction for this finite kernel,
    as in Lemma 10 and #cite(label("lovaszszegedy2006")) Section 2.6, Lemma 2.4.
    For each fixed finite graph $F$, the collision count gives $bb(E) t \( F \, G_n \) = t \( F \, W \) +
    O_F \( n^(- 1) \)$. The covariance of the indicators for two vertex maps vanishes when their images are
    disjoint, and the proportion of pairs with overlapping images is $O_F \( n^(- 1) \)$.
    Therefore $"Var" \( t \( F \, G_n \) \) = O_F \( n^(- 1) \)$.
    With tolerance $n^(- 1 \/ 4)$, Chebyshev’s inequality and a union bound for $F = K_2 \, H \,
    C_4$ give total failure probability $O \( n^(- 1 \/ 2) \) < 1$ for all sufficiently large $n$.
    Choose one successful realization for each such $n$. The expectation estimate then gives a deterministic
    sequence of finite simple graphs with
  $ p \( G_n \) arrow.r p \, wide t \( H \, G_n \) arrow.r p^66 \, wide t \( C_4 \, G_n \) arrow.r
    t \( C_4 \, W \) > p^4 . $
  This sequence is not quasirandom of density $p$, proving the claim. ◻
]

The graphon equality is exact, whereas the finite sequence matches the edge and $H$-densities only in the limit.
  The argument supplies one density $p in \( 0 \, 1 \)$ and does not assert failure of $p$-forcing at every density.

#bibliography("refs.bib", style: "ieee", title: [References])
