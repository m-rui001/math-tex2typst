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

#align(center)[#text(size: 16pt, weight: "bold")[Deterministic nonbipartite Ramanujan graphs \
in every fixed degree]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Nonconstant adjacency eigenvalues that are small in absolute value make the edge distribution of a regular graph close to the uniform-density prediction, and thus connect spectral estimates to expansion [1]. The Ramanujan threshold is the sharp asymptotic spectral target in fixed degree. For a simple $d$-regular graph $G$, its adjacency matrix $A_G$ has the constant eigenvector $upright(bold(1))$ with eigenvalue $d$. The restriction $A_G \|_(upright(bold(1))^perp)$ measures the remaining spectrum. Throughout this paper the desired bound is

$ parallel A_G \|_(upright(bold(1))^perp) #scale(x: 120%, y: 120%)[parallel] lt.eq 2 sqrt(d - 1) . $

Here $2 sqrt(d - 1)$ is the spectral radius of the infinite $d$-regular tree; the Alon–Boppana bound makes it asymptotically optimal [1,26]. Since $d > 2 sqrt(d - 1)$ for $d gt.eq 3$, this bound also forces $G$ to be connected and nonbipartite.

The problem addressed here is to construct such graphs deterministically at prescribed sizes, without a positive error in the spectral bound. Our meaning of explicitness is the production of the entire adjacency list. The degree is fixed throughout the complexity analysis.

#thm([Theorem 1.1.])[
  #emph[For every integer $d gt.eq 3$ there are constants $n_0 \( d \)$ and $k_d$ and a deterministic algorithm with the following property. On input an even integer $n gt.eq n_0 \( d \)$, the algorithm outputs the adjacency list of a simple $d$-regular graph $G$ on $n$ vertices in $O_d \( n^(k_d) \)$ bit operations, and 
$ - 2 sqrt(d - 1) < lambda < 2 sqrt(d - 1) quad upright("for every eigenvalue ") lambda upright(" of ") A_G \|_(upright(bold(1))^perp) . $

 In particular, $G$ is connected and nonbipartite.]
] <thm:main>

The exponent and the size threshold may depend on $d$. The statement concerns all sufficiently large even sizes; it does not assert a running-time bound polynomial jointly in $n$ and $d$, or a local adjacency-query algorithm.

#thm([Corollary 1.2.])[
  #emph[For every fixed $d gt.eq 3$, a deterministic polynomial-time algorithm, on every sufficiently large integer input $N$, produces a simple connected nonbipartite $d$-regular Ramanujan graph $G$ with $N lt.eq \| V \( G \) \| lt.eq N + 1 lt.eq 2 N$.]
] <cor:target-size>

#proof[
  Apply Theorem 1 to the least even integer $n gt.eq N$. ◻
]

=== 1.1 Earlier constructions and the exact threshold <earlier-constructions-and-the-exact-threshold>

Lubotzky, Phillips and Sarnak and Margulis established arithmetic constructions attaining the tree threshold in restricted degrees [18,21]. These constructions obtain their spectral bounds from arithmetic structure and produce infinite families on arithmetic sequences of orders. Morgenstern extended the available degrees to $q + 1$ for every prime power $q$, including nonbipartite families [24]. These exact constructions do not cover every fixed degree and every prescribed large order simultaneously.

Bilu and Linial introduced a different approach based on graph two-lifts and signings. A two-lift replaces each vertex by two vertices and each edge by one of the two matchings between the corresponding pairs. Its new eigenvalues are those of a signed adjacency matrix, obtained by assigning a sign $+ 1$ or $- 1$ to each edge. Their deterministic construction gives an $O \( sqrt(d log^3 d) \)$ bound along iterated lifts [7]. Marcus, Spielman and Srivastava then used interlacing polynomials to attain the exact bound for the largest signed eigenvalue. The bipartite Ramanujan convention excludes both $d$ and $- d$ from the spectral bound. For bipartite graphs, spectral symmetry also controls the negative edge, yielding simple bipartite Ramanujan families in every degree [19] Theorems 5.3 and 5.5. Hall, Puder and Sawin extended the covering theorem to arbitrary lift degrees; in particular, simple bipartite $d$-regular Ramanujan graphs exist on $2 d r$ vertices for every positive integer $r$ [13] Theorem 1.2 and Corollary 2.2.

The matching construction of Marcus, Spielman and Srivastava gives bipartite Ramanujan multigraphs at every even order, with strict bounds on the eigenvalues other than $plus.minus d$ [20] Theorem 1.1. Cohen made this construction deterministic in polynomial time [10]. More recently, Cohen and Maor obtained a quantitative improvement below the tree threshold in this bipartite multigraph model [9] Theorem 1.2. The restriction to $upright(bold(1))^perp$ in Theorem 1 includes the negative eigenvalue that bipartiteness would produce.

Recent polynomial expected-time signing algorithms of Jadbabaie, Saberi and Sra attain the sharp one-sided threshold, and hence the absolute threshold for bipartite inputs, using a Las Vegas algorithm; their general two-sided bound has an additional factor $sqrt(2)$ [17] Theorem 6.1. The Bilu–Linial conjecture asks whether every $d$-regular graph has a two-lift whose new eigenvalues all lie in $\[ - 2 sqrt(d - 1) \, 2 sqrt(d - 1) \]$ [7] Conjecture 3.1. Our prescribed-order construction uses partial pairings and edge switches, and does not resolve that signing problem.

For every fixed degree and every fixed $epsilon > 0$, Mohanty, O’Donnell and Paredes gave deterministic simple constructions with bound $2 sqrt(d - 1) + epsilon$, and order within a factor $1 + o \( 1 \)$ of a requested size [23]. Alon obtained this bound at every sufficiently large size $n$ satisfying $d n$ even [2] Theorem 1.3. His adjustment of the order deletes suitably separated vertices from a slightly larger graph and matches their neighbors; local eigenvector mass estimates control the resulting spectral error [2] Section 3. These constructions leave a positive spectral error. Removing that error requires controlling the eigenvalues on the much finer scale of their distances from both tree edges.

For every fixed degree and positive error, a uniformly random simple regular graph is near-Ramanujan with probability tending to one. This is Friedman’s theorem [12]; Bordenave gave a new proof using nonbacktracking operators and extended the method to random lifts [8]. Exact existence follows from the joint edge universality for uniformly random simple regular graphs in every fixed degree established by Huang, McKenzie and Yau [15] Remarks 3.10 and 3.12. The probability of the exact two-sided Ramanujan event tends to approximately $0.69$ [15] Corollary 1.3. Continuity of the limiting joint edge law gives the same limit for the strict interior event, so strict existence holds at every sufficiently large size with $d n$ even. Theorem 1 supplies a deterministic polynomial-time construction at the exact threshold and prescribed even order.

=== 1.2 How the construction reaches both spectral edges <how-the-construction-reaches-both-spectral-edges>

Write $q = d - 1$, $s = 2 sqrt(q)$ and $e = n^(- 2 \/ 3 + a)$, where $a = 10^(- 4)$. The first objective is a simple $d$-regular graph with nonconstant spectrum in $\( - s - e \/ 20 \, s + e \/ 20 \)$ and enough local information to repair the remaining error. An edge switch deletes ${ u \, v }$ and ${ x \, y }$ and inserts ${ u \, y }$ and ${ x \, v }$. It is valid when the four endpoints are distinct and the inserted edges were absent. A collection of vertex-disjoint valid switches preserves simplicity, regularity and the vertex set. A norm bound alone does not determine how a switch affects an eigenvector concentrated near one of its endpoints. The construction therefore retains two kinds of local information.

To describe them, let $v_2 \, dots.h \, v_n$ be an orthonormal eigenbasis on $upright(bold(1))^perp$ for this intermediate graph, with eigenvalues $lambda_i$, and put $x_i^sigma = s - sigma lambda_i$ for $sigma in { + 1 \, - 1 }$. These signed distances may be slightly negative. First, the spectral mass near either edge satisfies

$ sum_(i : x_i^sigma lt.eq w) \| v_i \( p \) \|^2 lt.eq C w^(3 \/ 2) #h(2em) upright("for every vertex ") p upright(", both signs, and ") 2 e lt.eq w lt.eq 2 d . $

Thus the modes requiring repair have little mass at any one vertex. Summing over vertices also shows that only $O \( n e^(3 \/ 2) \) = O \( n^(3 a \/ 2) \)$ modes lie within $O \( e \)$ of either edge. Thus only a small spectral subspace needs the additional positive bias. Second, choose one spectrum-avoiding bulk cutoff $w_B^sigma$ for each sign, at a prescribed scale larger than $e$, and retain the reciprocal only beyond that cutoff:

$ R_B^sigma = sum_(i : x_i^sigma gt.eq w_B^sigma) frac(v_i v_i^T, x_i^sigma) . $

For all but a small fraction of edges $\( p \, p' \)$, the $2$-by-$2$ submatrix on their endpoints is close, entry by entry, to the tree block

$ frac(1, d - 2) mat(delim: "(", sqrt(d - 1), sigma; sigma, sqrt(d - 1)) . $

The exceptional edge set may depend on the chosen pair of cutoffs. This is a local block comparison; the full inverse at the tree edge need not exist. Theorem 34 states the precise scales and all three repair hypotheses.

The bulk block comparison lets us eliminate the spectral modes beyond the cutoff and express positivity as a quadratic-form condition on the remaining near-edge modes. This elimination is a Schur complement. The original near-edge form can be indefinite. At both edges, a small bias in the edge-pair distribution gives a positive mean shift to the modes closest to the threshold; the other near-edge modes retain a fixed fraction of their positive slack after the mean correction. The local mass bound controls fluctuations around this mean. The proof shows that a collection of valid simultaneous switches satisfying both strict inequalities exists, before giving a finite deterministic search for it.

=== 1.3 The four construction stages <the-four-construction-stages>

Give each vertex $d$ distinguishable half-edges, called stubs. Pairing two stubs creates an edge. During the construction we maintain a positive precision matrix on $upright(bold(1))^perp$ for each sign and several spectral parameters; at completion these matrices become $z I - sigma A_G$, with $z > s$ and $sigma = plus.minus 1$. Their normalized inverses are compared entry by entry with truncated weighted sums of nonbacktracking paths, which do not immediately reverse an edge. Lemma 3 selects each pair by minimizing a weighted sum of nonnegative statistics. Each statistic is discounted by its own computed one-step growth factor, so the same choice preserves all the required estimates.

+ #strong[Pair most stubs.] Starting from the empty pairing, Proposition 11 in Section 5 leaves a sparse set of unresolved stubs while preserving positivity, trace estimates and entrywise comparison. Its main difficulty is simultaneous control of polynomially many entries over a long sequence of choices. Lemma 21 bounds the growth of a high moment with a coefficient independent of the moment order. Taking a sufficiently large fixed moment therefore gives the required maximum bound.
+ #strong[Separate the remaining stubs.] Given these estimates, Section 6 pairs the stubs that are close to one another or to a short return. The surviving stubs occupy distinct vertices, and no short nonempty nonbacktracking path joins any two of these vertices or returns to one. The analytic estimates persist during this prescribed cleanup, by Proposition 22 and the structural separation statement in Lemma 7.
+ #strong[Complete the graph.] The separated boundary makes the compression of a smoothly truncated path reference to unresolved-stub contrasts close to the identity. These contrasts are vectors of unresolved-stub coordinates whose entries sum to zero. Each vertex row of the path reference has at most one substantial boundary coordinate. Exact low-rank inverse updates, given by Woodbury identities, continue this reference throughout completion. Section 7 first reduces the squared row energies and then uses those smaller energies to improve the entry bounds. This order permits an arbitrary matching of the last few stubs. Proposition 29 supplies a simple regular graph with the required spectral confinement and entry comparison against one smoothly parameterized reference. The construction retains the path information at the separation stop needed to analyze that same reference.
+ #strong[Remove the spectral excess.] In Section 8, the parameter dependence of the frozen reference gives the local mass bound in Lemma 32; the retained path information gives the typical endpoint blocks in Lemma 33. Together with confinement, these are the three inputs to Theorem 34. Its biased switches make both signed precisions strictly positive at $s$ on $upright(bold(1))^perp$, while preserving simplicity, regularity and the vertex set.

Figure 1 summarizes these successive outputs.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.896cm, inset: 0.2822cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[1. Early pairing#linebreak()Positive signed precisions;#linebreak()trace and entry bounds.]])])
  content((7.696, 0), [#box(width: 6.896cm, inset: 0.2822cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #text(size: 9pt)[2. Separation#linebreak()Distinct unresolved vertices;#linebreak()no short joins or returns.]])])
  content((7.696, -3.3), [#box(width: 6.896cm, inset: 0.2822cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[3. Boundary completion#linebreak()Small row energies, then entry errors;#linebreak()nonconstant spectrum in#linebreak()$(-s-e"/"20,s+e"/"20)$.]])])
  content((0, -3.3), [#box(width: 6.896cm, inset: 0.2822cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[4. Local estimates and switches#linebreak()Near-edge mass and typical bulk blocks;#linebreak()nonconstant spectrum in $(-s,s)$.]])])
  line((3.448, 0), (4.248, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((7.696, -1.15), (7.696, -2.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((4.248, -3.3), (3.448, -3.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The four stages on the same $n$ vertices. The first three produce the graph and a reference matrix from which the local spectral estimates for repair are extracted. Paths in the separation stage are nonempty nonbacktracking paths. All precisions act on $upright(bold(1))^perp$; positivity is tracked for both spectral signs throughout. ],
) <fig:construction>

The deterministic selection rule belongs to the method of conditional expectations and pessimistic estimators [28,29]. Here each statistic has its own discount, and the transition estimates control those discounts along the selected history. Weighting a path of length $j$ by $\( sigma h \)^j$ introduces a scalar variable $h$. For a completed graph, the nonbacktracking path recurrence leads to the quadratic matrix $I - sigma h A_G + \( d - 1 \) h^2 I$, the regular-graph Ihara–Bass pencil [11] Sections 6 and 8; the partial configuration instead averages over unresolved stubs, so its identities and quantitative estimates are proved directly. Likewise, degree-preserving switchings are classical in regular-graph generation [22]; the local spectral inputs and the bias that improves both edges are established in the repair proof.

Local comparison with tree Green functions and stability under edge resampling were developed by Bauerschmidt, Huang and Yau for random regular graphs of sufficiently large fixed degree in the bulk [5] Sections 2, 7 and 11. Huang and Yau extended this local-resampling approach to every fixed degree $d gt.eq 3$ and obtained control up to the spectral edges [16] Sections 1.4, 3 and 5. These are methodological precedents for the local comparisons used here; the estimates along the deterministic pairing history and the biased simultaneous repair are proved below.

Section 2 fixes notation and parameter order; Section 3 gives the selection principle; and Section 4 develops the configuration identities and structural estimates. Section 9 assembles the four stages and proves polynomial bit complexity. Its final check is exact rational positivity of $B^T \( 4 \( d - 1 \) I - A_G^2 \) B$, where the columns of $B$ form a rational basis of $upright(bold(1))^perp$; the repair theorem ensures that the polynomial search contains a passing candidate. The structural enumeration uses color-coding [3] and the perfect-hash families of Naor, Schulman and Srinivasan [25] Theorem 3(iii); the weighted configuration estimates and spectral repair are proved here.

== 2 Conventions and parameters <sec:setup>

Throughout the proof $d gt.eq 3$ is fixed, $q = d - 1$, $s = 2 sqrt(q)$, and $n$ is even. Constants may depend on $d$ and on the fixed parameters and moment orders chosen below, but never on $n$. The assertion that a bound has an arbitrarily small power loss means that, for each prescribed fixed $eta > 0$, the bound holds with factor $n^eta$ once its preceding loss parameters have been chosen sufficiently small and $n$ is sufficiently large. A bound denoted $n^(o \( 1 \))$ has this usual meaning for every fixed positive exponent. The two uses will be kept distinct when selecting parameters.

All vertex-space precision matrices and their inverses act on $upright(bold(1))^perp$. For coordinate entries and traces we extend such an operator by zero on the constant vector. Stub-space operators on a contrast subspace are extended by zero in the same way. The distinction between the identity on a contrast subspace and its zero extension is understood in all compressed identities.

=== 2.1 Matrices used during the construction <matrices-used-during-the-construction>

The matrix estimates use the inverse of a precision matrix assigned to the current partial pairing; its normalized form will be denoted by $W$. The first reference, denoted by $P$, is a finite weighted sum of nonbacktracking paths, with degrees below the cutoff $L$ fixed below. Through cleanup the entry error is $E = W - P$. At the separated boundary we replace this path sum by a smooth truncation $hat(P)_0$ and continue it by exact inverse updates, obtaining $hat(P)$; the error is then $E = W - hat(P)$. The precise matrix definitions and update identities begin in Section 4. No positivity of $hat(P)$ is needed.

The symbols below are defined in full where their objects first enter the proof; the table serves as a reference when moving between stages.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Notation
], table.cell(rowspan: 1, colspan: 1)[Meaning and definition
]),
  table.cell(rowspan: 1, colspan: 1)[$S \, l$
], table.cell(rowspan: 1, colspan: 1)[Current unresolved stubs and their number; Section 4.
],
  table.cell(rowspan: 1, colspan: 1)[$Xi \, cal(D)$
], table.cell(rowspan: 1, colspan: 1)[Centered incidence and $cal(D) = Xi Xi^T$; Section 4.
],
  table.cell(rowspan: 1, colspan: 1)[$M \, W$
], table.cell(rowspan: 1, colspan: 1)[Signed precision and its normalized inverse; Section 4.
],
  table.cell(rowspan: 1, colspan: 1)[$P \, E$
], table.cell(rowspan: 1, colspan: 1)[Truncated path sum and $E = W - P$; Lemma 6.
],
  table.cell(rowspan: 1, colspan: 1)[$hat(P) \, E$
], table.cell(rowspan: 1, colspan: 1)[Continued smooth reference and $E = W - hat(P)$; Section 7.
],
  table.cell(rowspan: 1, colspan: 1)[$Gamma \, D$
], table.cell(rowspan: 1, colspan: 1)[Stub compression $Gamma = Xi^T W Xi$ and $D = Gamma - Pi_l$; $D$ is distinct from $cal(D)$.
],
  table.cell(rowspan: 1, colspan: 1)[$L_0 \, L_1 \, cal(T)$
], table.cell(rowspan: 1, colspan: 1)[Centered traces and $cal(T) = "Tr" \( Xi^T W^2 Xi \)$; Section 4.5.
],
)
]

=== 2.2 Stopping sizes and spectral parameters <stopping-sizes-and-spectral-parameters>

The unresolved-stub counts decrease as $d n arrow.r l_1 arrow.r l_0 arrow.r l_2 arrow.r l_3 arrow.r 0$. The first two stops delimit early pairing and cleanup; $l_2$ separates the two boundary phases, and $l_3$ is the final arbitrary matching. Fix $a = 10^(- 4)$ and put $e = n^(- 2 \/ 3 + a)$. The following table records the principal scales. The relation $asymp$ permits fixed positive factors and integer rounding.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Scale
], table.cell(rowspan: 1, colspan: 1)[Use
]),
  table.cell(rowspan: 1, colspan: 1)[$l_0$
], table.cell(rowspan: 1, colspan: 1)[$n^(2 \/ 3 + .15 a)$
], table.cell(rowspan: 1, colspan: 1)[Separated boundary size
],
  table.cell(rowspan: 1, colspan: 1)[$b$
], table.cell(rowspan: 1, colspan: 1)[$ceil.l n^(1 \/ 3 + .345 a) ceil.r$
], table.cell(rowspan: 1, colspan: 1)[Cleanup steps
],
  table.cell(rowspan: 1, colspan: 1)[$l_1$
], table.cell(rowspan: 1, colspan: 1)[$l_0 + 2 b$
], table.cell(rowspan: 1, colspan: 1)[End of early pairing
],
  table.cell(rowspan: 1, colspan: 1)[$q^(L \/ 2)$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(l_0) thin n^(- .29 a)$
], table.cell(rowspan: 1, colspan: 1)[Path cutoff
],
  table.cell(rowspan: 1, colspan: 1)[$q^(R_0)$
], table.cell(rowspan: 1, colspan: 1)[$n^(.04 a)$
], table.cell(rowspan: 1, colspan: 1)[Boundary separation
],
  table.cell(rowspan: 1, colspan: 1)[$q^(g_0)$
], table.cell(rowspan: 1, colspan: 1)[$n^(.002 a)$
], table.cell(rowspan: 1, colspan: 1)[Girth exclusion
],
  table.cell(rowspan: 1, colspan: 1)[$alpha_(*)$
], table.cell(rowspan: 1, colspan: 1)[$n^(- 1 \/ 3 + a \/ 2)$
], table.cell(rowspan: 1, colspan: 1)[Closest precision parameter
],
  table.cell(rowspan: 1, colspan: 1)[$l_2$
], table.cell(rowspan: 1, colspan: 1)[$l_0 n^(- g - r)$
], table.cell(rowspan: 1, colspan: 1)[End of boundary phase A
],
  table.cell(rowspan: 1, colspan: 1)[$l_3$
], table.cell(rowspan: 1, colspan: 1)[$n^chi$
], table.cell(rowspan: 1, colspan: 1)[End of concentrated updates
],
)
]

The quantities $l_0 \, l_1 \, l_2 \, l_3$ are even. A logarithmic radius or cutoff is rounded to an integer, changing its associated power of $q$ by a fixed factor. We keep path degrees $< L$.

For $0 < h < 1 \/ sqrt(q)$ define

$ z \( h \) = h^(- 1) + q h \, #h(2em) alpha \( h \) = 1 - q h^2 \, #h(2em) m_h = frac(h, 1 - h^2) . $

Choose the largest primary parameter $h_(*)$ with $alpha \( h_(*) \) asymp n^(- 1 \/ 3 + a \/ 2)$ and $0 < z \( h_(*) \) - s < e \/ 20$. Write $alpha_(*) = alpha \( h_(*) \)$. Successive smaller primary parameters have $1 - sqrt(q) h$ increasing by a fixed factor, for instance a factor of two, up to a sufficiently small fixed constant. Consequently there are $O \( log n \)$ primaries, their $z - s$ scales cover $\[ e \/ 20 \, c \]$ up to fixed factors, and successive positive scales have ratios bounded above and bounded away from one. Every parameter remains in a fixed compact subinterval of $\( 0 \, 1 \)$.

During the early and cleanup phases, add an auxiliary point immediately below each primary, at distance

$ b' = n^(- .16 a) alpha \( h \) . $

At the largest primary also use $h_(*) - j b_h$, $1 lt.eq j lt.eq k_h$, where

$ b_h = n^(- .03 a) alpha_(*) \, #h(2em) k_h = ⌈frac(10, .03 a)⌉ . $

The $j$-spacing is exact. These auxiliary groups are disjoint for large $n$. Both signs $sigma in { 1 \, - 1 }$ are used at every tracked parameter. Only the primary points are retained after $l_0$ unresolved stubs remain.

=== 2.3 Order of the constant choices <subsec:hierarchy>

The stopping sizes and spectral parameters above specify the stages of the construction. The remaining constants are introduced with the estimates they control in Sections 5–7. The following list records the dependencies among those choices, for reference when checking that every constant is fixed independently of $n$. In particular, a coefficient governing growth over a whole phase must be fixed before the higher moment order used to extract an individual bound. The list is a dependency guide; the indicated later arguments define the comparators, row bounds, and exceptional events.

+ Boundary phase A (Section 7.4) uses the fixed $d \, a$ and spectral moment order $k = 8$. Its initial row bounds have constants depending only on $d$; the row comparison constants, including the finite enlargements at exceptional events, are fixed at this stage.
+ The smooth reference of Section 7.1 has a row-tail exponent $r_P > 0$; it is permissible to take $r_P = .001 a$. The exponents $g = r > 0$ are chosen sufficiently small relative to $a \, r_P$ and the finitely many fixed drift constants in phase A. These constants depend on $k \, d$ and the fixed row bounds, not on the higher scalar moment orders.
+ In phase A the comparator exponent $zeta_X$ is chosen as in (7.11), followed by $theta > 0$ sufficiently small compared with $g$. The row-barrier exponents satisfy $0 < r_v < r_s < r_g < r \/ 2$ with strict gaps. The final matching exponent $chi$ satisfies $g + r lt.double chi < r_P$ and is larger than these row-barrier exponents.
+ In Section 6, the exponent $rho > 0$ is small enough that $20 rho$ is below the separation and scale margins. For each scalar concentration account, its normalization exponent is smaller than its drift and variance margins; its fixed even moment order is then chosen large enough for extraction over its polynomial-size family.
+ For the early high-moment account of Lemma 21, a sufficiently large fixed even $p$ is chosen using the uniform growth coefficient in (5.22). Its diagonal weight and outer-entry threshold are fixed next, determining the finite near radius $R_c$. The constants used to choose this threshold depend only on $p \, d$, the finite splitting inequalities, and the uniform row bounds. Constants depending on the resulting $R_c$ occur only in terms already accompanied by a negative power of $n$.
+ Finally, the structural and low-square loss exponents are chosen small enough for these fixed moment orders and for the finite induction over near radii. The fixed diagram excess cutoff is large enough for all the moments that have been used.

There is no dependence of a polynomial horizon-growth coefficient on a later scalar extraction order. The estimates below record this fact at the points where it is essential. All strict comparisons are unchanged if scales with rational exponents are replaced by dyadic rational approximations within fixed factors. Rational choices of the parameters $h$ with $O_d \( log n \)$ bits, including exact equally spaced auxiliaries, will be used for the algorithm.

== 3 Simultaneous deterministic choice <sec:accounts>

A single pairing must preserve several estimates at once. We select it by minimizing a weighted sum of nonnegative statistics, called accounts. Each account receives its own discount, computed from its exact conditional expectation. This separates the common choice from the different growth estimates used to analyze its consequences. The underlying method of conditional expectations and pessimistic estimators is classical [28]; see also [29] Section 3. The lemma below includes the account-specific discount update in the finite averaging argument.

#thm([Lemma 3.1.])[
  (Discounted accounts).  #emph[At a state $x$, let $Omega \( x \)$ be a nonempty finite set of candidate transitions with a specified probability distribution. For each index $i$ in a finite set let $Z_i \( x \) gt.eq 1$ be a nonnegative account and let $D_i > 0$ be its current discount. Fix nonnegative weights $a_i$. Set 
$ r_i = max {1 \, frac(bb(E) \[ Z_i \( x' \) divides x \], Z_i \( x \))} \, #h(2em) D'_i = D_i \/ r_i . $

 There is a candidate $x'$ such that 
$ sum_i a_i D'_i Z_i \( x' \) lt.eq sum_i a_i D_i Z_i \( x \) . $

 In particular, selecting a minimizer of the left side has this property. If along the selected history $bb(E) \[ Z_i \( x' \) divides x \] lt.eq \( 1 + c_(i \, t) \) Z_i \( x \)$ with $c_(i \, t) gt.eq 0$, then 
$ D_(i \, t)^(- 1) lt.eq product_(j < t) \( 1 + c_(i \, j) \) lt.eq exp (sum_(j < t) c_(i \, j)) $

 when the initial discount is one.]
] <lem:discounted-accounts>

#proof[
  For each index, $D'_i bb(E) Z_i \( x' \) lt.eq D_i Z_i \( x \)$ by definition of $r_i$. Sum with weights $a_i$ and use that a minimum is no larger than its average. The discount product follows from $r_i lt.eq 1 + c_(i \, t)$. ◻
]

For a normalized nonnegative estimator $Y$ that can vanish, apply the lemma to $1 + Y$. This convention keeps the expectation ratio defined and preserves every upper bound obtained by extracting $Y$.

An account attached to a surviving label has value $1 + phi.alt_i gt.eq 1$ while the label is alive and zero after its death. The same proof applies up to death; after death its contribution remains zero and its discount need not be changed. When a family contains $F$ labels, each is assigned the fixed weight $1 \/ F$ from the beginning of the phase. Hence, if the discounted total is at most $K$ and a surviving label has $D_i^(- 1) lt.eq B$, then $1 + phi.alt_i lt.eq F K B$. For a normalized $p$th-power account this costs the factor $\( F K B \)^(1 \/ p)$, which is explicitly allowed when the fixed even order $p$ is chosen. Scalar trace accounts and aggregate low-square accounts have unit weight; averaging over the $O \( log n \)$ spectral parameters would make no difference. Polynomial-size fixed denominators are used for the individual entry and row families, whose extraction uses high moments.

#thm([Lemma 3.2.])[
  (Scalar upper-excess account).  #emph[Let an alive scalar quantity have current value $X$ and upper threshold $T$. On its ordinary next transitions suppose the threshold is unchanged and, for a fixed scale $b > 0$, its increment $Delta$ satisfies 
$ \| Delta \| lt.eq b \, #h(2em) bb(E) Delta lt.eq mu \, #h(2em) bb(E) Delta^2 lt.eq nu \, #h(2em) mu \, nu gt.eq 0 . $

 For each fixed even integer $p gt.eq 2$ there is $C_p$ such that the account $Z = 1 + \( \( X - T \)_(+) \/ b \)^p$ obeys 
$ bb(E) Z' lt.eq [1 + C_p (mu / b + nu / b^2)] Z . $

 The same upper bound holds if the ordinary estimates are conditional on an event, provided that on each other surviving transition the threshold is changed so that the account does not increase. A death transition may set the account to zero. For two-sided control apply the assertion to $X$ and $- X$ separately.]
] <lem:scalar-excess>

#proof[
  For real $x$ and $\| y \| lt.eq 1$, Taylor’s formula on the positive half-line, including the possible crossing of zero, gives
  $ \( x + y \)_(+)^p lt.eq x_(+)^p + p x_(+)^(p - 1) y + C_p \( 1 + x_(+)^(p - 2) \) y^2 . $
  Substitute $x = \( X - T \) \/ b$ and $y = Delta \/ b$, take expectations, and use $x_(+)^j lt.eq 1 + x_(+)^p$ for $0 lt.eq j lt.eq p$. On other surviving transitions the account is bounded by its old value, and on death it is zero. Averaging these alternatives gives the same bound without conditioning. ◻
]

The later pairing phases use this estimate at a prescribed scale.

#thm([Corollary 3.3.])[
  (Positive-excess account at a prescribed scale).  #emph[Let $B_s > 0$ and $lambda > 0$. Suppose an alive scalar quantity has an ordinary increment $Delta$ with $\| bb(E) Delta \| lt.eq mu$, $bb(E) Delta^2 lt.eq nu$, and $\| Delta \| lt.eq lambda B_s$. For each fixed even $p gt.eq 2$, the upper-excess account for either sign, measured in units $lambda B_s$, has expectation factor at most 
#[#set math.equation(numbering: n => "(3.1)")
 $ 1 + C_p (frac(mu, lambda B_s) + frac(nu, lambda^2 B_s^2)) . $ <eq:original-34>]

 The threshold, exceptional-transition, and death conventions are those of Lemma 4.]
] <lem:positive-excess-account>

#proof[
  Apply Lemma 4 with $b = lambda B_s$ separately to the quantity and its negative. ◻
]

We shall take $lambda = n^(- zeta)$. If the sum of the drift and variance terms in (3.1) is bounded and the total family size is polynomial, choosing $p$ sufficiently large makes the excess $o \( B_s \)$. More generally a permitted loss $n^C$ in the discount is absorbed by the same extraction, with $p$ chosen after the fixed exponent $C$ has been determined.

=== 3.1 The induction and its accumulated error bounds <the-induction-and-its-accumulated-error-bounds>

Each transition estimate is proved assuming the current displayed caps. These caps first imply that every allowed candidate precision remains positive and that all candidate statistics are defined. The minimizing choice then gives the next caps by the preceding lemmas and their stated extraction margins. This is an induction on the number of transitions: first define all candidates from the current estimates, then select a candidate, and finally extract its estimates from the common sum. The largest discount loss of one account is never charged to another account.

A pathwise drift budget is used only when it can be bounded for every prefix of the selected history having the asserted caps. In cleanup, earlier actual paths are bounded by actual paths in the graph at the end of that prefix. The structural accounts control that graph by a separate discount estimate that does not use the pathwise drift budget. Thus the induction first obtains the new structural bounds and then uses them to bound the accumulated discounts of the remaining accounts.

At a phase boundary the accounts may be reinitialized. Normalization by a slightly larger small power than the preceding extraction loss makes their initial total bounded or $n^(o \( 1 \))$. The number of spectral parameters is logarithmic, and all label families are polynomial. An additive budget $O \( log n \)$ is harmless after a normalization by any fixed positive power; it is not charged as an unscaled multiplicative error.

== 4 Partial configurations and their deterministic estimates <sec:foundations>

Two kinds of estimates are needed before pairing can proceed. The structural accounts control actual paths and separate the unresolved stubs. The analytic estimates turn trace and entry bounds for the current inverse into the quadratic and moment bounds needed for one transition. We first derive the common matrix and path identities, then develop these two sets of estimates. The analytic implications are conditional: Sections 5 and 6 establish their hypotheses inductively along the selected pairing history.

Throughout this section, an operator on $upright(bold(1))^perp$ is extended by zero when vertex entries are taken. All constants are uniform in $n$; they may depend on the fixed parameters chosen in the parameter section. The notation $n^(o \( 1 \))$ below represents explicitly computable products of fixed powers of $log n$ and $exp \( O \( \( log log n \)^2 \) \)$.

=== 4.1 The configuration pencil and a single exposure <the-configuration-pencil-and-a-single-exposure>

We begin by assigning a matrix to each partial pairing. Its dependence on the unresolved stubs will make the change caused by one exposure explicit.

Give every vertex $d$ distinguished stubs. For a partial pairing, let $S$ be its $l$ unresolved stubs. For $l > 0$, let $C_S$ be the vertex–stub incidence matrix, and put

$ t = C_S upright(bold(1)) \, #h(2em) Pi_l = I - frac(upright(bold(1)) upright(bold(1))^T, l) \, #h(2em) Xi = C_S Pi_l \, #h(2em) cal(D) = Xi Xi^T . $

Write $xi_x$ for the column of $Xi$ indexed by $x$. If $A$ is the adjacency matrix of the resolved pairs, define

$ A_e = A + frac(t t^T, l) \, #h(2em) M \( h \) = z \( h \) I - sigma A_e - h cal(D) \, #h(2em) m_h = frac(h, 1 - h^2) \, #h(2em) W = M \( h \)^(- 1) \/ m_h . $

The operators $M \( h \)$ and $W$ act on $upright(bold(1))^perp$, and $W$ is used only when $M \( h \)$ is positive definite. At the empty pairing, $W$ is the identity on $upright(bold(1))^perp$. At a complete pairing, define $M \( h \) = z \( h \) I - sigma A_G$ and $W = M \( h \)^(- 1) \/ m_h$ on this subspace; positivity for both signs therefore bounds the nonconstant spectrum in absolute value by $z \( h \)$. The partial-configuration pencil lets us maintain this positivity during the exposure. We have $A_e upright(bold(1)) = d upright(bold(1))$ and, writing $alpha = 1 - q h^2$,

$ - partial_h M \( h \) = cal(D) + h^(- 2) alpha I . $

The next lemma identifies the inverse with a formal path generating function and computes its update when one pair is resolved. Both descriptions will be used: the path expansion controls entries, and the matrix update controls the change in the inverse. For the relation between nonbacktracking walks and the quadratic Ihara–Bass matrix polynomial, see [11] Section 6, Eq. (6.2). The recurrence below also includes unresolved averaging blocks, and we prove it directly.

#thm([Lemma 4.1.])[
  (Path generating function and exposure identities).  #emph[Let $C$ be the incidence matrix of all $d n$ stubs. On resolved stubs let $P_(*)$ exchange partners, and on $S$ let it be the averaging projection. Set $D_e = C P_(*)^2 C^T = d I - cal(D)$ and 
$ Q_0 = I \, #h(2em) Q_j = C P_(*) \[ \( C^T C - I \) P_(*) \]^(j - 1) C^T quad \( j gt.eq 1 \) . $

 Then, as a formal power series on $upright(bold(1))^perp$, 
$ W = sum_(j gt.eq 0) \( sigma h \)^j Q_j . $

 For distinct $u \, v in S$, $l > 2$, define 
$ U = \[ xi_u \, xi_v \] \, quad G_0 = I - J_2 \/ l \, quad B = G_0^(- 1) = I + J_2 \/ \( l - 2 \) \, quad H_0 = - sigma h F B \, $

 where $J_2$ is the all-ones matrix and $F$ exchanges the two coordinates. If this pair is resolved, then 
$ cal(D)' = cal(D) - U B U^T \, #h(2em) A'_e = A_e + U F B U^T \, #h(2em) M' = M + U \( h I - sigma F \) B U^T . $

 With $G = U^T W U$, $D_p = G - G_0$, and $H = \( H_0^(- 1) + D_p \)^(- 1)$, the inverse update, whenever its inverses exist, is 
$ W' = W - W U H U^T W . $

 Uniformly for the prescribed compact range of $h$, if $parallel D_p parallel = o \( 1 \)$, then $M' > 0$ whenever $M > 0$.]
] <lemma:configuration-algebra>

#proof[
  We first prove the generating-function identity, then the exposure formulas and the assertion about positivity.
  The matrix $Q_j$ counts weighted nonbacktracking stub walks. A resolved traversal is deterministic; an unresolved traversal lands uniformly in $S$, independently on each use. After landing, the arrival stub is excluded from the next departure. Thus every row sum is $d q^(j - 1)$ for $j gt.eq 1$. Since $P_(*)^3 = P_(*)$,
  $ C P_(*)^2 \( C^T C - I \) P_(*) = \( D_e - I \) C P_(*) . $
  Expansion gives $Q_1 = A_e$, $Q_2 = A_e^2 - D_e$, and $Q_j = A_e Q_(j - 1) - \( D_e - I \) Q_(j - 2)$ for $j gt.eq 3$. Consequently
  $ sum_(j gt.eq 0) \( sigma h \)^j Q_j = \( 1 - h^2 \) \[ I - sigma h A_e + h^2 \( D_e - I \) \]^(- 1) = W . $
  For the exposure identities, write $a = e_(v \( u \))$, $b = e_(v \( v \))$ and replace $t$ by $t - a - b$ and $l$ by $l - 2$ in $cal(D) = "diag" \( t \) - t t^T \/ l$ and $A_e = A + t t^T \/ l$. Direct expansion gives the displayed formulas. The Woodbury inverse formula [14] applies because
  $ \[ m_h \( h I - sigma F \) B \]^(- 1) + G_0 = H_0^(- 1) . $
  It remains to verify preservation of positivity. Both $m_h \( h I - sigma F \) B$ and $H_0^(- 1)$ have one positive and one negative eigenvalue, bounded away from zero uniformly in the prescribed range. The perturbation $D_p = o \( 1 \)$ preserves the latter inertia.
  We recall the block congruence behind the Schur-complement argument. For real symmetric blocks $sans(A) \, sans(D)$ with $sans(A)$ invertible, and a compatible real rectangular block $sans(B)$, define
  $ sans(L) = mat(delim: "[", I, - sans(A)^(- 1) sans(B); 0, I) . $
  Direct multiplication gives
  $ sans(L)^T mat(delim: "[", sans(A), sans(B); sans(B)^T, sans(D)) sans(L) = mat(delim: "[", sans(A), 0; 0, sans(D) - sans(B)^T sans(A)^(- 1) sans(B)) . $
  Since $sans(L)$ is invertible, the inertia of the original block matrix is the sum of the inertias of $sans(A)$ and $sans(D) - sans(B)^T sans(A)^(- 1) sans(B)$; here inertia records the numbers of positive, negative, and zero eigenvalues. When $sans(D)$ is invertible, the same identity with the block order exchanged gives the other Schur complement.
  With $K = \( h I - sigma F \) B$, apply the two Schur complements to $mat(delim: "[", M, U; U^T, - K^(- 1))$. One complement is $M'$ and the other is $- m_h \( H_0^(- 1) + D_p \)$, proving that the inertia of $M'$ equals that of $M$. ◻
]

Let $P = P_(< L)$ be the degree-$< L$ truncation of this generating function, and write $E = W - P$. The formal exposure subtracts the degree-$< L$ truncation of

#[#set math.equation(numbering: n => "(4.1)")
 $ P U [H_0 sum_(j gt.eq 0) \( - \( U^T P U - G_0 \) H_0 \)^j] U^T P . $ <eq:original-1>]

This statement is coefficientwise: every factor $H_0$ has positive degree, so every coefficient uses only finitely many terms, and every coefficient of degree less than $L$ is unchanged on replacing $W$ by $P$.

We will repeatedly use a cancellation that is exact, including the finite-population correction. For two scalar arrays $a \, c$ on $S$, take an ordered distinct pair uniformly in $I subset.eq S$, where $\| I \| = l - k$. Write $a_p = \( a \( u \) \, a \( v \) \)^T$ and $c_p = \( c \( u \) \, c \( v \) \)^T$ for its two-entry arrays. Their contraction satisfies

#[#set math.equation(numbering: n => "(4.2)")
 $ frac(bb(E) \[ a_p^T H_0 c_p \], - 2 sigma h) & = frac(\( 1 + 1 \/ \( l - 2 \) \) \( sum_I a \) \( sum_I c \), \| I \| \( \| I \| - 1 \))\
 & quad - frac(k sum_I a c, \( l - 2 \) \| I \| \( \| I \| - 1 \)) . $ <eq:original-2>]

Indeed, the swap part has average $2 \[ \( sum_I a \) \( sum_I c \) - sum_I a c \] \/ \[ \| I \| \( \| I \| - 1 \) \]$, while the diagonal part contributes $2 sum_I a c \/ \| I \|$. Substituting the coefficients of $F B$ gives (4.2). In particular the expectation vanishes for centered arrays when $I = S$.

=== 4.2 Structural accounts and separated unresolved stubs <structural-accounts-and-separated-unresolved-stubs>

The path bounds will require control of small graph cores. We construct accounts for these cores and for proximity among unresolved stubs. The proximity and return counts identify the stubs that cleanup must resolve to obtain separation. We verify that cleanup preserves the core bounds.

In the early phase, expose a uniform ordered distinct pair whose vertices have actual graph distance greater than $g_0$. The graph on stubs of rejected pairs has maximum degree $D_g = O_d \( q^(g_0) \)$. Every resulting actual graph is simple and has girth at least $g_0$.

#thm([Lemma 4.2.])[
  (Structural accounts).  #emph[Fix $J = floor.l .9 log_q n floor.r$ and a sufficiently large fixed integer $r_(*)$. The joint discounted-account rule can maintain, through the early and cleanup phases, the following bound for every connected multigraph core $H$ of minimum degree at least two, excess $r = e_H - v_H + 1 in { 1 \, dots.h \, r_(*) }$, and $s_H = e_H lt.eq r_(*) J$: 
#[#set math.equation(numbering: n => "(4.3)")
 $ \# { upright("stub embeddings of ") H } lt.eq n^(1 - r + o \( 1 \)) q^(s_H) . $ <eq:original-3>]

 An embedding is injective on vertices and uses distinct proper stubs for all incidences at a vertex. The accounts and their next-step averages are computable in polynomial time.]
  #emph[At $l = l_1$, fewer than $b$ unresolved stubs are bad, where a stub is bad if its vertex has a nonempty actual nonbacktracking return of length at most $R_0$, or lies within distance $R_0$ of another unresolved stub (including distance zero). Cleanup can resolve all these bad stubs and stop at $l_0$ with one unresolved stub per unresolved vertex, and no nonempty actual nonbacktracking path of length at most $R_0$ joining two unresolved vertices, including a return to one vertex.]
] <lemma:structure>

#proof[
  We first construct the core accounts and bound their change under rejection in the early phase. These bounds give a global path count and, in particular, the short-return count needed to identify bad stubs. We then bound proximity, perform cleanup, and verify that cleanup preserves the same core and path estimates.
  #emph[Initial core accounts.] Suppressing degree-two vertices in a core leaves a bounded-size multigraph, apart from the separate case of a cycle. Its subdivisions with at most $r_(*) J$ edges give $\( 1 + log n \)^(O \( r_(*) \))$ shapes. Cores with a vertex of degree exceeding $d$ need not be included.
  We use the following form of the perfect-hash-family theorem [25] Section 4.4, Theorem 3(iii): an $n$-element set has an explicitly constructible $k$-perfect family of maps to $k$ colors, of size $exp \( k \) k^(O \( log k \)) log n$, constructible in $exp \( k \) k^(O \( log k \)) n^(O \( 1 \))$ time. This is the specialization $ell = k$ of their splitter theorem: splitting a $k$-element set equally among $k$ colors makes the map injective on that set. The bounded case $k = 1$ uses a single constant map. For $k = v_H$, sum the unrestricted completion probabilities over embeddings colorful for each map. Every embedding is included at least once. If an embedding is already incompatible with the partial pairing it contributes zero; if it has $p$ demanded pairs still pending, it contributes
  $ f_p \( l \) = product_(i = 1)^p \( l - 2 i + 1 \)^(- 1) . $
  For one coloring the number of colorful ordered vertex assignments is at most $k ! \( n \/ k \)^k$. At the empty pairing the proper stub assignments contribute $product_x \( d \)_(deg_H \( x \))$, where $\( d \)_j$ is a falling factorial. Since $e_H gt.eq v_H$ and $\( d \)_j lt.eq d q^(j - 1)$,
  $ frac(product_x \( d \)_(deg_H \( x \)), d^(e_H)) lt.eq d^(v_H - e_H) q^(2 e_H - v_H) lt.eq q^(e_H) . $
  Stirling’s estimate cancels the factor $exp \( k \)$ against $k ! \/ k^k$, leaving only a polynomial factor in $k$. Since $k = O_d \( log n \)$, the remaining factor $k^(O \( log k \)) log n$ is $n^(o \( 1 \))$. The initial account is therefore at most $n^(1 - r + o \( 1 \)) q^(s_H)$.
  We use color-coding on a bounded-width tree decomposition, following Alon, Yuster and Zwick [3] Section 6, Theorem 6.3; the states below also retain prescribed stub assignments and pending demanded-pair counts. These colorful sums do not require enumeration of $n^k$ assignments. Choose a spanning tree of $H$ and a width-one tree decomposition of that tree. Add the endpoints of the $r$ non-tree edges to every bag. Every edge of $H$ is then covered, the bags containing each vertex remain connected, and the width is at most $2 r + 1 = O \( r_(*) + 1 \)$. In a bag record its vertex and stub assignments, the subset of colors used in the processed part, and the number of pending demanded pairs. At a join the color subsets must be disjoint off the bag. At an edge check its two stub statuses and increment the pending count when appropriate. After totaling by that count, multiply by $f_p \( l \)$. There are $2^(O \( k \)) n^(O \( r_(*) + 1 \))$ states and transitions, including joins; all counts and probabilities have polynomial bit length.
  #emph[Change under rejection.] Under unrestricted exposure this account is a martingale. It remains to bound the cost of restricting to accepted pairs. Conditional on an eventual matching containing $p$ demanded pairs, the next exposed pair is one of these pairs with total probability $2 p \/ l$; otherwise it is a uniform pair on the other $l - 2 p$ stubs. Deleting $2 p$ vertices from a rejected-pair graph of maximum degree $D_g$ changes its rejected-pair proportion by $O \( p D_g \/ l^2 \)$. The contribution of demanded hits to a possible increase in acceptance probability is also $O \( p D_g \/ l^2 \)$. Bayes’ formula thus bounds the account’s conditional expectation by $1 + O \( p D_g \/ l^2 \)$ times its present value. Summing to $l_1$ costs $exp \( O \( r_(*) J D_g \/ l_1 \) \) = 1 + o \( 1 \)$. Normalize by $n^(1 - r) q^(s_H)$ and apply the joint account rule.
  #emph[Global path diagrams and short returns.] At every early-phase state, (4.3) with $r_(*) > 10$, increased if necessary, bounds a core of excess $r_(*)$ and at most $r_(*) J$ edges by $n^(1 - .1 r_(*) + o \( 1 \)) < 1$. Thus no such actual core occurs.
  A connected union of a fixed number of actual nonbacktracking walks, with total length at most $r_(*) J$ and a fixed number of marked endpoints, has excess less than $r_(*)$. Otherwise retain a connected subgraph of excess $r_(*)$ and prune its leaves, contradicting the absence of such cores just proved. Suppressing unmarked degree-two vertices leaves boundedly many vertices, so the number of diagram shapes is $n^(o \( 1 \))$. A diagram with $e'$ edges and excess $r$ has at most
  $ n^(1 - r + o \( 1 \)) q^(e') $
  embeddings: apply (4.3) to the core and extend its bounded-leaf trees at cost $C q^(e' - s_H)$; for a tree use $C n q^(e')$. The number of walk descriptions in an embedded diagram is bounded by a constant depending on the fixed parameters. Indeed, branching is possible only at boundedly many marked or branch vertices, and two visits to the same such vertex are separated by at least $g_0$ steps. The ratio $r_(*) J \/ g_0$ is bounded independently of $n$.
  In particular, the union traced by a nonempty nonbacktracking return of length $k$ contains a cycle, so its excess is at least one and it has at most $k$ edges. The global diagram count therefore gives at most $n^(o \( 1 \)) q^k$ such return walks. Summing over $k lt.eq R_0$ and allowing at most $d$ unresolved stubs at each vertex gives at most $n^(o \( 1 \)) q^(R_0)$ return-bad stubs. This deduction uses only the early-phase core bound and girth exclusion already established.
  #emph[Proximity at the end of the early phase.] For proximity at $l_1$, count simple paths of lengths $0$ through $R_0$ with two distinguished, distinct endpoint stubs required to survive until $l_1$. For an assignment with $p$ pending required pairs and $r$ marked surviving stubs, its completion probability is
  $ frac(\( l_1 \)_r thin 2^p \( \( l - l_1 \) \/ 2 \)_p, \( l \)_(r + 2 p)) \, $
  with value zero for incompatibility. This follows by assigning stubs to the future pair slots and the final surviving slots of a uniform permutation. Multiply the contribution by $w^p$, with $w = 1 + C D_g \/ l_1$. A demanded next hit removes one factor $w$ and hence pays its entire rejection inflation. Conditional on a successful non-hit, the pair is uniform on the ordinary stubs; deleting the $2 p + r$ distinguished stubs costs only $1 + O \( \( p + r \) D_g \/ l^2 \)$. The initial normalized colorful sum is $n^(o \( 1 \))$: without normalization its expectation is
  $ n^(o \( 1 \)) O (q^(R_0) "polylog" \( n \) l_1^2 \/ n) . $
  For positive-length paths this follows by choosing proper incidences, paying $\( d n \)^(- j) \( 1 + o \( 1 \) \)$ for the $j$ edges and $O \( \( l_1 \/ n \)^2 \)$ for the two surviving flags; length zero obeys the same bound. Together with the return-bad count above, this bounds all bad stubs. Both contributions are $o \( b \)$, since
  $ q^(R_0) l_1^2 \/ n = n^(1 \/ 3 + .34 a + o \( 1 \)) \, #h(2em) b = n^(1 \/ 3 + .345 a + o \( 1 \)) . $
  #emph[Cleanup.] The preceding bounds leave enough steps to resolve every bad stub. Fix the bad set at $l_1$. Resolve each bad stub as first endpoint, choosing its partner uniformly among surviving initially clean stubs. Then use any surviving first stub and choose its partner uniformly among the eligible surviving initially clean stubs until $l_0$; there are exactly $b$ steps available. An untouched clean stub is initially farther than $R_0$ from every other unresolved stub. A path of length at most $R_0$ starting there cannot reach a new cleanup edge: before its first such edge it would already reach an initial unresolved vertex in the initial graph. Its short-path and short-return properties therefore persist. Every cleanup pair is admissible, and the asserted final separation follows.
  It remains to preserve the core accounts during these cleanup steps. Multiply $f_p \( l \)$ by $\( 1 + C b \/ l_0 \)^p$. If the fixed first stub is demanded, success requires its unique demanded partner; deletion of at most $O \( b \)$ possible partners is paid by the lost weight. Otherwise a successful exposure has probability ratio at most $f_p \( l - 2 \) \/ f_p \( l \) = 1 + O \( p \/ l \)$, irrespective of the omissions. The total discount cost is $exp \( O \( r_(*) J b \/ l_0 \) \) = 1 + o \( 1 \)$, as is the change on reinitializing the weights. This completes the simultaneous account construction. The core bound and girth exclusion therefore hold through cleanup, so the global diagram and short-return estimates proved above remain valid there as well. ◻
]

=== 4.3 Path diagrams, absolute majorants, and polynomial tails <path-diagrams-absolute-majorants-and-polynomial-tails>

The coefficient majorants and their first-power row bound below hold in the general partial-configuration setting. The stronger path estimates are conditional on the current early or cleanup state having $l gt.eq l_0$, the core bound (4.3), and actual girth at least $g_0$. Lemma 7 maintains these properties through both phases; its final separation conclusion is used in Section 7. An admissible pair has endpoint vertices at actual distance greater than $g_0$.

The global diagram bound proved with the structural accounts counts actual paths over all choices of endpoints. For entrywise inverse updates we also need bounds with endpoints fixed, and absolute majorants that include virtual traversals and centering. These majorants will then control the tail discarded from the formal exposure.

We begin with fixed endpoints. The union of all walks of length at most $L$ has bounded excess. After the first walk, every walk adding an edge also increases excess: an added forest would have a new leaf, whereas the only possible leaves are the already present endpoints. At most $r_(*) + 1$ walks would witness excess $r_(*)$. Since $L \/ J$ is bounded below one, taking $r_(*)$ sufficiently large ensures $\( r_(*) + 1 \) L lt.eq r_(*) J$, a contradiction. The preceding branch-count argument consequently bounds the number of walks at each length between fixed endpoints by a constant. Likewise, a family of cycle-containing diagrams rooted at $i$, with no possible leaf other than $i$ and with each total length at most $J$, has bounded excess: each edge-adding member increases it, including the first member.

#thm([Lemma 4.3.])[
  (Absolute path bounds).  #emph[In the partial-configuration setting above, let an output label denote either a vertex coordinate projected onto $upright(bold(1))^perp$, or a current centered stub $xi_x$. For a label $i$ write 
$ p_i \( x \) = P_(i \, xi_x) \, quad e_i \( x \) = E_(i \, xi_x) \, quad w_i \( x \) = W_(i \, xi_x) . $

 We distinguish polynomial coefficient majorants from their numerical evaluations. Let $N_k \( u \, v \)$ count actual nonbacktracking stub walks of length $k$ from $u$ to $v$, with $N_0 \( u \, v \) = upright(bold(1))_(u = v)$, and define the following polynomials with nonnegative coefficients: 
$ sans(U)_l \( z \) & = C / l (1 + sum_(k = 1)^(L - 1) k q^k z^k) \,\
sans(A)_(i \, x) \( z \) & = sum_(k = 0)^(L - 1) N_k \( v \( i \) \, v \( x \) \) z^k + sans(U)_l \( z \) \,\
sans(J)_x \( z \) & = sum_(k = 1)^(L - 1) N_k \( v \( x \) \, v \( x \) \) z^k + sans(U)_l \( z \) \, #h(2em) sans(B)_(x \, y) \( z \) = sans(A)_(x \, y) \( z \) + C \/ l . $

 Here $v \( i \)$ is the underlying vertex of the output label. The constant $C$ is large enough to include the virtual, centering, and degree-zero Gram corrections. Coefficientwise absolute values of $p_i \( x \)$ are bounded by $sans(A)_(i \, x)$; diagonal and cross errors of $U^T P U - G_0$ are bounded by $sans(J)_x$ and $sans(B)_(x \, y)$, respectively. The actual-walk counts are symmetric, as are these majorants whenever the input and output are stub labels. Write 
$ A_i \( x \) = sans(A)_(i \, x) \( h \) \, #h(2em) j_x = sans(J)_x \( h \) \, #h(2em) b_(x y) = sans(B)_(x \, y) \( h \) . $

 In particular $sans(U)_l \( h \) lt.eq C \( 1 + L \)^2 q^(L \/ 2) \/ l$, and 
#[#set math.equation(numbering: n => "(4.4)")
 $ sum_(x in S) A_i \( x \) lt.eq C \( 1 + L \)^2 q^(L \/ 2) . $ <eq:path-row-sum>]

]
  #emph[For the following bounds, assume that the current early or cleanup state has $l gt.eq l_0$, satisfies (4.3), and has actual girth at least $g_0$. Uniformly through $l_0$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ & sum_(x in S) A_i \( x \)^2 lt.eq C \,\
 & sum_(x in S) j_x^2 lt.eq n^eta \, #h(2em) sum_(x in S) j_x lt.eq n^eta q^(L \/ 2) . $ <eq:original-4>]

 For an admissible pair in either phase there is a fixed $c'_0 > 0$ with 
#[#set math.equation(numbering: n => "(4.6)")
 $ j_u + j_v + b_(u v) lt.eq n^(- c'_0) . $ <eq:original-5>]

 The same decay holds after multiplying nonconstant diagonal coefficients by any fixed power of their length, including for global diagonal entries with their degree-zero norm as baseline.]
] <lemma:path-majorants>

#proof[
  #emph[Coefficient majorants and the first row sum.] An entry involving at least one virtual traversal at length $k$ is at most $C k q^k \/ l$: mark one such traversal, sum prefixes by the row sums, pay its uniform landing factor $1 \/ l$, and sum suffixes backwards using reversibility and the same row sums. This overcounts and hence is an upper bound. Vertex centering contributes $d q^(k - 1) \/ n$; averaging an endpoint against the unresolved stubs contributes at most $C k q^k \/ l$. The length-zero corrections are $O \( 1 \/ l + 1 \/ n \)$. These estimates prove the coefficient majorants and the stated bound on $sans(U)_l \( h \)$. Reversing a walk proves symmetry. For (4.4), each vertex has at most $d$ unresolved stubs, so the actual length-$k$ row sum is at most $C_d q^k$. Summing with weights $h^k$ and adding $l sans(U)_l \( h \)$ proves the claim. These arguments use no core or girth hypothesis.
  For the remaining estimates we use the stated structural hypotheses.
  #emph[Actual-walk row squares.] First consider actual walks from a fixed vertex to unresolved stubs. In the squared weighted sum, identical walks contribute at most $d$: choose the initial departure uniformly among $d$ stubs and successive departures uniformly among $q$ alternatives, stopping at the first unresolved departure. A stopped walk of $k$ actual steps has probability $d^(- 1) q^(- k)$, which dominates $d^(- 1) h^(2 k)$.
  For two distinct walks ending at the same unresolved stub vertex, remove their common terminal segment. Summing the possible common continuations with squared weights again costs at most $d$ by the stopping argument. The remaining pair forms a cycle-containing diagram rooted at the initial vertex, with no other possible leaf. If its total length $u$ is at most $J$, the rooted-family argument above bounds its number by $n^(o \( 1 \))$, and $u gt.eq g_0$ makes its total weighted contribution $o \( 1 \)$. If $J < u lt.eq 2 L$, take a sufficiently large fixed $p$-th moment over roots. In a union of $p$ such diagrams every edge-adding diagram increases excess, so a union of excess $r$ has at most $min \( p \, r \) u$ edges. The global embedding bound gives a moment at most
  $ n^(1 + o \( 1 \)) \( 1 + q^u \/ n \)^p . $
  Here $r_(*)$ is chosen large enough to cover all $p$ diagrams. Thus each root’s count is at most $n^(1 \/ p + o \( 1 \)) \( 1 + q^u \/ n \)$. After multiplication by $q^(- u \/ 2)$ this is bounded by
  $ n^(1 \/ p + o \( 1 \)) \( q^(- J \/ 2) + q^L \/ n \) = o \( 1 \) $
  for, for example, a sufficiently large fixed $p > 4$. Summation over the polylogarithmically many length choices preserves the decay. This proves the actual row-square bound, with constant depending only on $d$ once $n$ is large enough.
  Adding the virtual and centering terms costs $O \( \( 1 + L \)^4 q^L \/ l \) = o \( 1 \)$ in row-square sum, by $l gt.eq l_0$ and the prescribed relation between $L$ and $l_0$. Thus the actual-walk bound also proves the first estimate in (4.5).
  #emph[Return bounds.] The global number of return walks of length $k$ is at most $n^(o \( 1 \)) q^k$, proving the first-power bound on $j$. For its square, pair two return walks of lengths $k \, k'$. Excess at least two costs at most $n^(- 1 + o \( 1 \)) q^(\( k + k' \) \/ 2)$ after weighting, whose sum is $o \( 1 \)$. At excess one the union consists of a root-to-cycle tail and the cycle. Each return covers all these edges, so their number is at most $min \( k \, k' \)$; its weighted embedding bound is $n^(o \( 1 \))$. This proves the return-square bound, after absorbing subpolynomial factors in the prescribed $n^eta$.
  #emph[Decay at admissible pairs.] For an admissible pair, girth and endpoint distance exclude all short nonconstant terms. Bounded fixed-endpoint multiplicity bounds the remaining sum by $C sum_(k gt.eq g_0) q^(- k \/ 2)$, in addition to the power-small uniform errors. The degree-zero centered Gram error is $O \( 1 \/ l \)$, even with other stubs at either vertex. Fixed powers of $k$ do not change the resulting positive decay exponent. ◻
]

===== 4.3.1 The formal exposure tail. <the-formal-exposure-tail.>

The coefficientwise majorants also control the part discarded when the formal exposure is truncated. At a current early or cleanup state with $l gt.eq l_0$, the core bound (4.3), and actual girth at least $g_0$, let $u \, v$ be any distinct unresolved stubs. The absolute coefficient tail of (4.1), of total degree at least $L$, has every entry on global coordinates or current centered-stub labels bounded by

#[#set math.equation(numbering: n => "(4.7)")
 $ B_(upright("tail")) := C q^(- \( 1 \/ 2 - epsilon.alt \) L) lt.eq n^(.30 a) \/ sqrt(l_0) \, $ <eq:original-6>]

where $epsilon.alt > 0$ is fixed and sufficiently small, and $C$ may depend on $epsilon.alt$.

To prove this, evaluate the nonnegative coefficient majorants at $z_h = h q^(1 \/ 2 - epsilon.alt) lt.eq q^(- epsilon.alt) < 1$. Put $r = floor.l g_0 \/ 3 floor.r$. Between two fixed vertices there is at most one actual nonbacktracking walk of length less than $r$, counting all lengths together: each such walk is simple, and two distinct ones would form a cycle shorter than $g_0$. This includes the degree-zero walk when the vertices coincide. Its contribution is at most one. Bounded fixed-endpoint multiplicity bounds the longer contribution by $C z_h^r \/ \( 1 - z_h \) = o \( 1 \)$. The rescaled uniform error also tends to zero:

$ sans(U)_l \( z_h \) lt.eq C \( 1 + L \)^2 q^(\( 1 - epsilon.alt \) L) \/ l = o \( 1 \) \, #h(2em) q^L \/ l_0 = n^(- .58 a + o \( 1 \)) . $

Consequently all outer majorants are at most $1 + o \( 1 \)$. A nonnegative coefficient majorant $sans(D) \( z_h \)$ for the two-by-two middle deviation $U^T P U - G_0$ has diagonal entries $o \( 1 \)$ and off-diagonal entries at most $1 + o \( 1 \)$. The degree-zero Gram corrections are $O \( 1 \/ l \)$; the possible degree-zero off-diagonal contribution for two stubs at the same vertex is included in the bound by one. Since

$ parallel sans(D) \( z_h \) parallel_oo lt.eq 1 + o \( 1 \) \, #h(2em) parallel z_h \( F + J_2 \/ \( l - 2 \) \) #scale(x: 120%, y: 120%)[parallel]_oo = z_h (1 + frac(2, l - 2)) \, $

the product of the middle and $H_0$ majorants has norm at most $q^(- epsilon.alt) \( 1 + o \( 1 \) \)$. For sufficiently large $n$ this is bounded by a fixed $rho_epsilon.alt < 1$. Coefficientwise nonnegative matrix multiplication therefore bounds the whole formal series at $z_h$ by $C_epsilon.alt$. Returning to $h$ pays $q^(- \( 1 \/ 2 - epsilon.alt \) L)$ for every term of degree at least $L$. Finally $q^(- L \/ 2) asymp n^(.29 a) \/ sqrt(l_0)$, so choosing $epsilon.alt$ sufficiently small proves (4.7). Every fixed power of the number of factor positions is also summable, since $sum_(m gt.eq 0) \( m + 1 \)^k rho_epsilon.alt^m < oo$ for fixed $k$. This is a bound on the formal $P$ exposure; it does not assert positivity after an arbitrary pair is resolved. The actual transitions use admissible pairs, for which (4.6) and the entry caps give the stronger power-small ratio in their numerical mixed expansions.

=== 4.4 A coefficient bound from positivity of the pencil <a-coefficient-bound-from-positivity-of-the-pencil>

The path estimates control entries of the truncation. Positivity at both signs supplies an operator bound for each coefficient and hence for the whole truncation. We derive that bound from the scalar polynomials obtained by evaluating the pencil on unit vectors.

#thm([Lemma 4.4.])[
  (Polynomial operator bounds).  #emph[If the precision is positive for both signs at $h$, then 
#[#set math.equation(numbering: n => "(4.8)")
 $ parallel h^j Q_j \|_(upright(bold(1))^perp) parallel lt.eq C \( 1 + j \)^2 \, #h(2em) parallel P parallel lt.eq C \( 1 + L \)^3 . $ <eq:original-7>]

 For a fixed stub endpoint, the signed column of $P$ over global vertices has polylogarithmic squared norm. For the following absolute column and entry bounds, also assume that the current early or cleanup state has $l gt.eq l_0$, satisfies the core bound (4.3), and has actual girth at least $g_0$. For every fixed integer $p gt.eq 3$, the absolute $p$-power sum of that column is bounded by a constant; for sufficiently large $n$ that constant can depend only on $d$ and $p$. Stub columns have bounded absolute squared sums, and every outer entry of $P$ in the formal exposure expansion (4.1) has absolute value at most $1 + o \( 1 \)$.]
] <lemma:pencil-coefficients>

#proof[
  #emph[Operator bounds.] On $upright(bold(1))^perp$ put $F \( z \) = I - z A_e + z^2 \( q I - cal(D) \)$. For a complex unit vector $v$, $v^(*) F \( z \) v = 1 - x z + y z^2$ has real $x \, y$ and $y lt.eq q$. A nonreal pair of roots has modulus $y^(- 1 \/ 2) gt.eq q^(- 1 \/ 2)$. A real root in $\( - h \, h \)$ is also impossible. Endpoint positivity would require another root on the same side of zero in that interval, but their product would be less than $h^2 lt.eq 1 \/ q$, contradicting $1 \/ y gt.eq 1 \/ q$. Linear polynomials and polynomials with roots of opposite signs are excluded directly by the endpoint signs. Thus every root has modulus at least $h$. Factoring the scalar polynomial shows
  $ \| v^(*) F \( z \) v \| gt.eq \( j + 1 \)^(- 2) quad upright("when ") \| z \| = h (1 - frac(1, j + 1)) \, quad j gt.eq 1 . $
  Since $parallel F \( z \) v parallel gt.eq \| v^(*) F \( z \) v \|$, its inverse has norm at most $\( j + 1 \)^2$. Apply the Cauchy coefficient formula to $\( 1 - z^2 \) F \( z \)^(- 1)$; the extra radius ratio is at most a fixed constant. This proves (4.8). Moreover, $parallel xi_x parallel lt.eq C$, so
  $ sum_i \| P_(i \, xi_x) \|^2 = parallel P xi_x parallel^2 lt.eq C parallel P parallel^2 lt.eq C \( 1 + L \)^6 \, $
  where $i$ ranges over global vertices. This proves the signed column-square bound from positivity alone.
  #emph[Column and entry bounds.] We now combine the operator estimate with the path bounds. For actual paths of length $j$ to a fixed endpoint, bounded multiplicity and the total path count give an $ell^3$ norm $O \( q^(- j \/ 6) \)$ after weighting, which is summable. Uniform errors have total cube sum $O \( n \[ \( 1 + L \)^2 q^(L \/ 2) \/ l \]^3 \) = o \( 1 \)$. This proves the cubic bound. For the refined constant, paths shorter than $g_0 \/ 3$ are unique in total at fixed endpoints; their cube sums are at most $1 + sum_(j gt.eq 1) d q^(j - 1) q^(- 3 j \/ 2)$. Longer actual paths have power-small supremum and absolute aggregate squared sum $O \( \( 1 + L \)^2 \)$, so their $p$-power sums tend to zero. The uniform correction has vanishing $p$-power sum by its cube bound and vanishing supremum. Apply the triangle inequality in $ell^p$. The same short/long separation proves the $1 + o \( 1 \)$ entry bound. The cubic column bound has a constant depending only on $d$. Combining it with the entry bound gives, for every fixed integer $p gt.eq 3$ and all sufficiently large $n$ (depending on $p$),
  $ sum_i \| P_(i \, xi_x) \|^p lt.eq \( 1 + o \( 1 \) \)^(p - 3) sum_i \| P_(i \, xi_x) \|^3 lt.eq 2 C_d . $
  Here $i$ ranges over global vertex coordinates. Thus the large-power column constants needed in the early transition argument can be fixed before its scalar moment order. The same short/long separation also shows that choosing a fixed distance radius from a fixed positive entry threshold does not require fixing the later structural losses first. ◻
]

=== 4.5 Deterministic consequences of the resolvent bounds <subsec:resolvent-consequences>

This subsection derives deterministic consequences of the trace and entry bounds in (4.9). The transition arguments in the following sections establish those bounds by induction. At each transition these implications are applied only to the current state. We first bound the norm and spectral tail of a positive weighted inverse. We then use nearby parameter values to obtain local quadratic and averaged trace estimates, from which the required moments follow. Set $F_1 = "Tr" \( cal(D) W \)$ and $F_0 = "Tr" W$. We use the trace notation

$ Gamma = Xi^T W Xi \, #h(2em) L_1 = F_1 - \( l - 1 \) \, #h(2em) L_0 = F_0 - \( n - 1 \) \,\
K_(upright("all")) = Gamma^2 \, #h(2em) Q_(upright("all")) = Xi^T W^2 Xi \, #h(2em) cal(T) = "Tr" Q_(upright("all")) . $

At the primaries, the squared-resolvent trace $cal(T)$ will be kept away from zero by applying the account rule to its reciprocal. At all tracked primary and auxiliary points suppose positivity and

#[#set math.equation(numbering: n => "(4.9)")
 $ \| F_1 - \( l - 1 \) \| lt.eq n^(.09 a) \/ alpha_(*) \, #h(2em) \| F_0 - \( n - 1 \) \| lt.eq n^(.12 a) \/ alpha_(*)^2 \, #h(2em) max_(i \, j) \| E_(i j) \| lt.eq n^(.37 a) \/ sqrt(l_0) \, $ <eq:original-8>]

where the entries range over the specified global and centered-stub labels. At a current early or cleanup state with $l gt.eq l_0$, the core bound (4.3), and actual girth at least $g_0$, Lemma 9 bounds the formal $P$ outer entries by $1 + o \( 1 \)$. The corresponding numerical $W$ outer entries have the same bound: $W = P + E$, and the entry cap in (4.9) is $n^(.37 a) \/ sqrt(l_0) = o \( 1 \)$. Write $v_(*) = .125 a$ and $c = .03 a$.

#thm([Lemma 4.5.])[
  (Consequences of the resolvent bounds).  #emph[At a current early or cleanup state, assume $l gt.eq l_0$, the core bound (4.3), and actual girth at least $g_0$. Assume positivity and (4.9) at every tracked primary and auxiliary parameter, for both signs. For $B_h^(+) = cal(D) + h^(- 2) alpha I$, the positive operator $S_h = \( B_h^(+) \)^(1 \/ 2) W \( B_h^(+) \)^(1 \/ 2)$ has norm at most $n^(v_(*)) \/ alpha$. For a sufficiently large fixed $C$, the sum of its eigenvalues above $C n^c \/ alpha$ is at most $n^(v_(*)) \/ alpha$. These bounds hold at the primaries and their auxiliaries. At all these points, every global coordinate or centered stub $f$ satisfies 
#[#set math.equation(numbering: n => "(4.10)")
 $ f^T W \( cal(D) + h^(- 2) alpha I \) W f lt.eq \( 1 + h^(- 2) \) parallel f_perp parallel^2 + n^(- c_1) . $ <eq:original-10>]

 At the primaries, the averaged trace identity is 
#[#set math.equation(numbering: n => "(4.11)")
 $ frac("Tr" K_(upright("all")), l) + h^(- 2) alpha cal(T) / l = 1 + h^(- 2) + O \( n^(- c_2) \) . $ <eq:original-11>]

 The following moment bounds hold at both primaries and auxiliaries: 
#[#set math.equation(numbering: n => "(4.12)")
 $ "Tr" K_(upright("all"))^2 + alpha^2 "Tr" Q_(upright("all"))^2 & lt.eq C (n^(2 c) l \/ alpha^2 + n^(4 v_(*)) \/ alpha^4) \,\
"Tr" \( Gamma K_(upright("all")) \) + alpha "Tr" \( Gamma Q_(upright("all")) \) & lt.eq C (n^c l \/ alpha + n^(3 v_(*)) \/ alpha^3) \,\
parallel Q_(upright("all")) parallel & lt.eq C n^(2 v_(*)) \/ alpha^3 . $ <eq:original-12>]

 The decay exponents $c_1 \, c_2 > 0$ are fixed independently of $n$.]
] <lemma:local-laws-implications>

#proof[
  #emph[Reduction to the closest primary.] We begin with the norm and spectral tail. Positivity at the closest primary controls the other primary groups directly; the closest group will require the auxiliary trace bounds.
  For every primary group except the closest one, positivity at the closest point and integration of $- partial_h M \( h \)$ give
  $ M \( h \) succ.curly.eq c_d alpha \( cal(D) + alpha I \) . $
  Indeed the interval between these points has length comparable with $alpha$, and on a fixed subinterval its value of $1 - q t^2$ is comparable with $alpha$. The claim follows there with norm $C \/ alpha$ and an empty tail. It remains to control the closest point.
  #emph[A positive finite-difference filter at the closest primary.] At that point put $R_h = M \( h \)^(- 1) = m_h W$, $X = \( B_h^(+) \)^(- 1 \/ 2) M \( h \) \( B_h^(+) \)^(- 1 \/ 2)$ and $S = X^(- 1)$. Positivity, (4.9), and $"Tr" W = O \( n \)$ give a polynomial upper bound on $S$. The bounds $B_h^(+) succ.curly.eq c_d alpha_(*) I$ and $parallel M \( h \) parallel = O \( 1 \)$ give an inverse-polynomial lower bound. Set $k = k_h$ and $b = b_h = n^(- c) alpha_(*)$.
  For the linear pencil $X + x I$, the alternating trace difference at $0 \, b \, dots.h \, k b$ is the nonnegative quantity
  #[#set math.equation(numbering: n => "(4.13)")
   $ cal(B) := sum_(lambda in "spec" S) lambda product_(j = 1)^k frac(j b lambda, 1 + j b lambda) . $ <eq:original-9>]
  For $b lambda$ small, the product suppresses the contribution of $lambda$; for $lambda gt.eq C \/ b$, it is bounded below by a positive constant depending only on $k \, C$. A bound on $cal(B)$ therefore bounds the spectral tail that we need. We will obtain that bound from the trace laws for the actual pencil, by comparing its alternating trace difference with this linear one.
  Write the actual pencil in the form $X + x I + gamma \( x \) H_(*)$, where
  $ H_(*) = \( B_h^(+) \)^(- 1) \, quad gamma \( x \) = z \( h - x \) - z \( h \) - h^(- 2) alpha_(*) x \, quad T \( x \) = "Tr" \[ X + x I + gamma \( x \) H_(*) \]^(- 1) . $
  Taylor’s formula gives $gamma \( x \) = O \( x^2 \)$, $gamma' \( x \) = O \( x \)$, and bounded higher fixed derivatives on the interval used. At $x = j b_h$, $0 lt.eq j lt.eq k_h$, the trace laws imply
  $ T \( x \) = m_(h - x) \[ \( l - 1 \) + h^(- 2) alpha_(*) \( n - 1 \) \] + O \( n^(.12 a) \/ alpha_(*) \) . $
  Consequently,
  $ lr(|sum_(j = 0)^k \( - 1 \)^j binom(k, j) T \( j b \)|) lt.eq C_k \( n^(.12 a) \/ alpha_(*) + n b^k \) . $
  #emph[Comparison with the linear pencil.] We show that the preceding trace difference is $cal(B) + o \( 1 \) + o \( cal(B) \)$. The matrices $X$ and $H_(*)$ need not commute, so the comparison retains the order of all matrix factors. For $X_g \( x \) = X + x I + gamma \( x \) H_(*)$ and $R \( x \) = X_g \( x \)^(- 1)$, the divided-difference product rule applied to $R X_g = I$ gives
  $ R \[ x_0 \, dots.h \, x_k \] = sum_(0 = i_0 < dots.h.c < i_p = k) \( - 1 \)^p R \( x_0 \) product_(t = 1)^p (X_g \[ x_(i_(t - 1)) \, dots.h \, x_(i_t) \] R \( x_(i_t) \)) \, $
  where products retain their displayed order and $x_j = j b$. At nonzero nodes expand about $A_j = \( X + j b I \)^(- 1)$. Because $parallel gamma \( j b \) H_(*) A_j parallel lt.eq C b \/ alpha_(*) = C n^(- c)$, every such Neumann series can be truncated at a fixed order $K$ with residual norm at most $C_K b^(- 1) \( C b \/ alpha_(*) \)^K$. After multiplication by $b^k$, every remaining factor, rank, and initial inverse norm is bounded by a fixed power of $n$. Choosing $K$ sufficiently large makes the sum of all residual traces $o \( 1 \)$.
  After multiplication by $\( - 1 \)^k k ! b^k$ and taking the trace, the term with all first divided differences equal to $I$ and all nodes unperturbed is exactly $cal(B)$. It remains to show that all other terms have total absolute value $o \( 1 \) + o \( cal(B) \)$. Use a common decomposition into the $O \( log n \)$ dyadic spectral blocks of $S$ for $S$ and every $A_j$, all of which are functions of $S$. In a nonzero block tuple let $lambda_0$ be its largest scale, and let $r_0$ be the rank of a block at that scale. A cyclic trace is bounded by $r_0$ times the product of operator norms, by starting the trace at that block. This choice is available even when the largest block occurs in an intermediate inverse: cyclicity moves that block to the beginning of the trace while retaining the cyclic order of all factors. Write $s_0 = min \( lambda_0 \, b^(- 1) \)$. The corresponding main scale is, within constants depending on $k$, $r_0 lambda_0 \( b s_0 \)^k$. This is an upper comparison scale for a mixed block tuple, rather than the value of that tuple. The initial inverse block has norm at most $C lambda_0$, and every nonzero-node inverse block has norm at most $C_k s_0$, irrespective of where the largest block occurs. The contribution to $cal(B)$ from that largest spectral block is comparable to this scale, since on its dyadic interval $lambda product_(j = 1)^k j b lambda \/ \( 1 + j b lambda \) asymp_k lambda_0 \( b s_0 \)^k$.
  A perturbed first divided difference costs an extra $O \( b \/ alpha_(*) \)$. Each Neumann correction costs at most the same. Replacing $r gt.eq 2$ first divided differences and their intermediate inverses by a single span-$r$ divided difference costs, relative to that main scale,
  $ O (alpha_(*)^(- 1) s_0^(- \( r - 1 \))) . $
  If $lambda_0 gt.eq n^(c \/ 2) \/ alpha_(*)$, every non-main product therefore has at least one power-small factor, while the other replacement factors are bounded. Summing the fixed powers of $log n$ and charging to the largest block bounds these terms by $o \( cal(B) \)$.
  Below this threshold, bound absolutely instead. A span-one block, its following inverse, and one assigned factor $b$ cost $O \( n^(- c \/ 2) \)$. A higher span $r$ with its following inverse and $b^r$ costs
  $ O \( b^r alpha_(*)^(- 1) n^(c \/ 2) \/ alpha_(*) \) = O \( n^(- r c \/ 2) \) \; $
  the omitted extra factor $alpha_(*)^(r - 2) n^(- \( r - 1 \) c \/ 2)$ is bounded. Node corrections are bounded as well. The sum of all such tuples is at most $n^(1 + o \( 1 \)) \( n^(c \/ 2) \/ alpha_(*) \) n^(- k c \/ 2) = o \( 1 \)$, by the choice of $k$. This proves the comparison with the linear pencil.
  #emph[Spectral tail and transfer to auxiliaries.] It follows that $cal(B) lt.eq C_k n^(.12 a) \/ alpha_(*)$. For $lambda gt.eq C \/ b$, the product in (4.13) is bounded below by a positive constant depending only on $k$ and $C$. Hence the sum above that threshold, and then the norm, are at most $n^(v_(*)) \/ alpha_(*)$ for all sufficiently large $n$. Passing between $S$ and $S_h$ only changes a fixed factor $m_h$. At lower auxiliary nodes, $M \( h - x \)^(- 1) prec.curly.eq M \( h \)^(- 1)$ and $B_(h - x)^(+) = \( 1 + o \( 1 \) \) B_h^(+)$ in relative positive order. The min–max principle transfers the ordered eigenvalue bounds, increasing the constant in the tail cutoff.
  #emph[Local quadratic estimate.] The spectral norm bound is now available at all tracked points. We use it to compare the inverse at a primary with its nearby auxiliary. If $f$ is a global coordinate or a centered stub, the path estimates give $P_(f f) = parallel f_perp parallel^2 + O \( n^(- c'_0) \)$ and a power-small derivative of the nonconstant part. Compare $R_h$ and $R_(h - b')$, where $b' = n^(- .16 a) alpha$. Their precision difference is
  $ b' \( B_h^(+) \)^(1 \/ 2) \( I + O \( b' \/ alpha \) \) \( B_h^(+) \)^(1 \/ 2) . $
  The proven norm bound gives $b' parallel S_h parallel lt.eq n^(\( .125 - .16 \) a)$, a negative power. The resolvent identity therefore gives the positive quadratic-form comparison
  $ R_h - R_(h - b') = b' R_h \( B_h^(+) \)^(1 \/ 2) \( I + O \( n^(- c') \) \) \( B_h^(+) \)^(1 \/ 2) R_h $
  for some fixed $c' > 0$. On a diagonal, the entry error divided by $b'$ is at most $C n^(.53 a) \/ \( alpha_(*) sqrt(l_0) \) = O \( n^(- .045 a) \)$. Using $m'_h \/ m_h^2 = 1 + h^(- 2)$ yields (4.10) at the primary. For a lower auxiliary point at distance $x$, the normalized precision increment is $x \( I + O \( x \/ alpha \) \)$. Put $tilde(S) = \( B_h^(+) \)^(1 \/ 2) R_h \( B_h^(+) \)^(1 \/ 2) succ.curly.eq 0$. The map on the vectors $\( B_h^(+) \)^(1 \/ 2) R_h f$ has the form $\[ I + x tilde(S) T_x \]^(- 1)$, where $T_x = I + O \( x \/ alpha \)$ is positive definite. Indeed,
  $ \[ I + x tilde(S) T_x \]^(- 1) = T_x^(- 1 \/ 2) \[ I + x T_x^(1 \/ 2) tilde(S) T_x^(1 \/ 2) \]^(- 1) T_x^(1 \/ 2) . $
  The middle factor has norm at most one, so the full norm is at most $sqrt(parallel T_x parallel parallel T_x^(- 1) parallel) = 1 + O \( x \/ alpha \)$. Moreover, $B_(h - x)^(+)$ and $m_(h - x)$ differ from $B_h^(+)$ and $m_h$ by relative $O \( x \/ alpha \)$, respectively. Since $x \/ alpha$ is power-small at every auxiliary, these comparisons transfer (4.10) to its own normalization at $h - x$, after reducing $c_1$. In particular $sum_x w_i \( x \)^2 lt.eq C$, global unweighted row squares are at most $C \/ alpha$, and $\[ \( Xi^T W Xi \)^2 \]_(x x) lt.eq C$.
  #emph[Averaged trace identity.] Take the $cal(D)$-weighted trace of the same $b'$ resolvent difference. Its trace-law error after division by $b' l$ is at most $C n^(\( .09 + .16 \) a) \/ \( l alpha_(*) alpha \)$, a negative power. Positivity and the relative error in the quadratic-form comparison, together with (4.10), give (4.11). Summing the global and stub versions of (4.10) also gives $cal(T) lt.eq C min \( n \, l \/ alpha \)$.
  #emph[Moment bounds.] We now combine the local quadratic estimate with the spectral bulk and tail bounds. To express the remaining moments in a common matrix, introduce $Y = \[ Xi \, h^(- 1) sqrt(alpha) I \]$, with the identity projected onto $upright(bold(1))^perp$, and $cal(A) = Y^T W Y$. Its nonzero eigenvalues are those of $S_h$. Its stub block is $Gamma$, and the stub block of $cal(A)^2$ is $K_(upright("all")) + h^(- 2) alpha Q_(upright("all"))$, of trace $O \( l \)$ by (4.10). Split $cal(A)$ into its bulk and tail spectral parts. The bulk norm is $O \( n^c \/ alpha \)$; the tail trace is $O \( n^(v_(*)) \/ alpha \)$. Their squared parts have norm $O \( n^(2 c) \/ alpha^2 \)$ and trace $O \( n^(2 v_(*)) \/ alpha^2 \)$, respectively. Positive compression preserves these bounds. For a positive bulk compression $C_b$, use $"Tr" C_b^2 lt.eq parallel C_b parallel "Tr" C_b$; for a tail compression $C_t$, use $"Tr" C_t^2 lt.eq \( "Tr" C_t \)^2$. This proves the first estimate in (4.12). For the mixed estimate, split also the stub block of $cal(A)$; its bulk contributes $O \( n^c l \/ alpha \)$, and all terms involving its tail are bounded by $O \( n^(3 v_(*)) \/ alpha^3 \)$, since $c < v_(*)$. Positive order gives the last operator bound. Together these estimates prove (4.12). ◻
]

=== 4.6 The estimates passed between pairing stages <the-estimates-passed-between-pairing-stages>

The next two sections establish the hypotheses used above by induction. The following table records their bounds at the two stopping points; these are conclusions of Propositions 11 and 22, not additional assumptions. Positivity and the first three bounds hold for both signs at every tracked primary and auxiliary parameter. The last bound is needed only at the primaries, and $c_T > 0$ denotes a fixed constant.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[After early pairing, $l = l_1$
], table.cell(rowspan: 1, colspan: 1)[After cleanup, $l = l_0$
]),
  table.cell(rowspan: 1, colspan: 1)[$\| L_1 \|$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq n^(.075 a) \/ alpha_(*)$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq n^(.09 a) \/ alpha_(*)$
],
  table.cell(rowspan: 1, colspan: 1)[$\| L_0 \|$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq n^(.105 a) \/ alpha_(*)^2$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq n^(.12 a) \/ alpha_(*)^2$
],
  table.cell(rowspan: 1, colspan: 1)[$max_(i \, j) \| E_(i j) \|$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq n^(.33 a) \/ sqrt(l_0)$
], table.cell(rowspan: 1, colspan: 1)[$lt.eq n^(.37 a) \/ sqrt(l_0)$
],
  table.cell(rowspan: 1, colspan: 1)[$cal(T)$
], table.cell(rowspan: 1, colspan: 1)[$gt.eq c_T n^(- theta \/ 2) \( n^(- 1) + alpha \/ l_1 \)^(- 1)$
], table.cell(rowspan: 1, colspan: 1)[$gt.eq c_T n^(- theta) \( n^(- 1) + alpha \/ l_0 \)^(- 1)$
],
)
]

The entry labels are global coordinates and surviving centered stubs. The early bounds leave a positive power of slack inside the caps (4.9); cleanup retains those caps. The structural accounts also leave fewer than $b$ bad stubs at $l_1$, in the sense of Lemma 7. At $l_0$ the unresolved vertices are distinct and have no nonempty actual nonbacktracking join or return of length at most $R_0$. Both stages also retain the stub diagonal-square bound $sum_(x in S) E_(x x)^2 lt.eq n^eta$, with a prescribed sufficiently small fixed loss exponent, and the coefficient and path-multiplicity bounds. The complete inputs to boundary completion are listed at the start of Section 7; only primary parameters are retained there.

== 5 Pairing down to a sparse boundary <sec:early-phase>

We now construct a partial pairing with $l_1$ unresolved stubs. Throughout this phase, both signed precisions remain positive and their normalized inverses remain close, entry by entry, to the truncated path matrix $P$. The structural estimates of the preceding section then leave fewer than $b$ bad stubs for the separation step to remove.

All conditional expectations in this section are over a uniform ordered pair of distinct unresolved stubs whose vertices have distance greater than $g_0$. A conditional expectation for a surviving output additionally excludes its one or two stub labels from the selected pair. Global vertex outputs do not impose this exclusion. The notation $E_(i j)$ always uses the vectors attached to the current labels; thus a stub output is centered using the current unresolved set.

#thm([Proposition 5.1.])[
  (Early pairing).  #emph[For the fixed parameters of the construction and all sufficiently large $n$, the simultaneous discounted-account rule can be run from the empty pairing down to $l_1$ unresolved stubs. It retains the structural estimates (4.3)–(4.8), positivity of every tracked precision, and, at every tracked point, 
$ \| L_1 \| lt.eq n^(.075 a) \/ alpha_(*) \, #h(2em) \| L_0 \| lt.eq n^(.105 a) \/ alpha_(*)^2 \, #h(2em) max_(i \, j) \| E_(i j) \| lt.eq n^(.33 a) \/ sqrt(l_0) . $

 The low-square estimates (5.12) hold with any prescribed sufficiently small fixed loss exponent, for any fixed near radius needed in the proof. At every primary point, 
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(T) med gt.eq med n^(- theta \/ 2) \( n^(- 1) + alpha \/ l \)^(- 1) $ <eq:original-13>]

 after a fixed constant is allowed in the right-hand side.]
] <prop:early-phase>

At every exposure, the structural accounts, the trace accounts, the squared entry sums, and the high entry moments enter the same discounted total. The proofs below establish their one-step bounds under the common current-state caps. The squared sums make mixed terms in the high-moment expansion summably small. A separate weighting of pair and diagonal moments controls the remaining terms with a drift coefficient independent of the moment order. This independence permits extraction of a simultaneous entry bound after a polynomial loss in the discount.

At the empty state, $W = P = I \|_(upright(bold(1))^perp)$, $L_1 = 1 - d$, $L_0 = 0$, and $cal(T) = d \( n - 1 \)$. Write

$ B_e = n^(.31 a) \/ sqrt(l_0) \, #h(2em) d_m = n^(.33 a) \/ sqrt(l_0) . $

We maintain $max \| E_(i j) \| lt.eq d_m$ together with the squared-sum bounds stated below; in particular, $T_S := sum_(x in S) E_(x x)^2 lt.eq n^eta$, with centered stub indices. The deterministic implications (4.9)–(4.12) are used only at the current state. There, every valid pair has small $D_p$, so its next precisions are positive and the update (4.1) is defined. The weighted choice and extraction then give the displayed caps at the selected next state. This closes the induction without assuming any candidate’s next-state estimates.

=== 5.1 Trace estimates <trace-estimates>

We first control the two trace errors $L_0 \, L_1$. We also bound $cal(T)$ away from zero; this lower bound will provide a strict margin in the boundary-completion argument. The signed cancellations needed for these three estimates are collected in the next lemma.

Put $D = Gamma - Pi_l$, a centered full stub matrix with pair block $D_p$, and put $J_(upright("all")) = Gamma Q_(upright("all"))$. In this subsection, $K \, Q \, J$ denote the selected pair blocks of $K_(upright("all")) \, Q_(upright("all")) \, J_(upright("all"))$, respectively. At the current state,

#[#set math.equation(numbering: n => "(5.2)")
 $ K_(x x) lt.eq C \, quad Q_(x x) lt.eq C \/ alpha \, quad sum_x D_(x x)^2 lt.eq n^eta \, quad sum_y D_(x y)^2 lt.eq C \, $ <eq:original-14>]

by (4.5), the squared-sum bound, and (4.10). On valid pairs, $D_p$ has power-small entries; on invalid pairs its entries are still bounded. Fixed constants are included in the expectation-error bounds below. We retain the exact ordered-distinct denominators in the identities that supply the drift.

#thm([Lemma 5.2.])[
  (Uniform pair contractions).  #emph[Let $A \, C$ be centered $l$-by-$l$ matrices, with $A$ symmetric, and let a subscript $p$ denote their ${ u \, v }$ blocks. For a full uniform ordered distinct pair, 
$ bb(E) "Tr" \( H_0 A_p \) & = 0 \,\
bb(E) "Tr" \( B A_p \) & = frac(2 "Tr" A, l - 1) \,\
bb(E) "Tr" \( F A_p F C_p \) & = frac(2, l \( l - 1 \)) ("Tr" A "Tr" C + "Tr" \( A C \) - 2 sum_x A_(x x) C_(x x)) . $

 The last identity remains valid when $C$ is not symmetric. For a nonnegative summand, restriction to valid pairs or to survival costs a factor $1 + O \( \( D_g + 1 \) \/ l \)$. For a signed summand one must also subtract the omitted pairs before applying this factor.]
] <lem:early-pair-contractions>

#proof[
  Centering gives $sum_(u eq.not v) A_(u v) = - "Tr" A$. Insert $B = I + J_2 \/ \( l - 2 \)$ and $H_0 = - sigma h \( F + J_2 \/ \( l - 2 \) \)$ to obtain the first two identities. Expansion of the last trace gives $A_(v v) C_(u u) + A_(u u) C_(v v) + A_(u v) \( C_(u v) + C_(v u) \)$. Summing its three terms proves the formula. Each stub has at most $D_g$ forbidden partners, and survival excludes at most two stubs; the assertion about restriction follows by counting the available ordered pairs. ◻
]

#thm([Lemma 5.3.])[
  (Trace transition bounds).  #emph[Under the current bootstrap bounds, the conditional means and second moments of the trace errors satisfy (5.4)–(5.6) at all tracked points. At primary points, $cal(T)$ has the lower relative drift (5.8), the second-moment bound (5.10), and relative step size $\| Delta cal(T) \| \/ cal(T) = o \( 1 \)$. All error constants are uniform in the current state.]
] <lem:early-trace-transitions>

#proof[
  We first compute the two centered trace increments. We then obtain the three estimates on $cal(T)$ needed to bound its reciprocal: the lower drift, second moment, and maximum relative increment. The terms containing the possibly large matrix $J$ require separate estimates.
  #emph[The centered trace errors.]
  From $cal(D)' = cal(D) - U B U^T$,
  $ Delta F_1 = - "Tr" B G - "Tr" H K + "Tr" B G H G . $
  Expand $H = H_0 - H_0 D_p H_0 + dots.h.c$. In the increment of $L_1$, the constant $- 2$ cancels the change in its baseline $l - 1$. This gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ Delta L_1 = 2 "Tr" H_0 D_p - \( 1 + h^2 \) "Tr" B D_p - "Tr" H_0 K + "Tr" H_0 D_p H_0 K + O \( parallel D_p parallel^2 \) . $ <eq:original-15>]
  Here $H_0 G_0 H_0 = h^2 B$. Under full uniform distinct sampling, the linear $H_0$ contractions vanish and $bb(E) "Tr" B D_p = 2 L_1 \/ \( l - 1 \)$. The swap-swap term has diagonal contribution $2 h^2 L_1 "Tr" K_(upright("all")) \/ \[ l \( l - 1 \) \]$, with same-index corrections $O \( 1 \/ l \)$. Its remaining cross contribution is bounded by $C \( "Tr" Gamma^3 + l \) \/ l^2$; the $O \( 1 \/ l \)$ changes in swap entries also cost $O \( 1 \/ l \)$.
  To restrict these polynomial terms to valid pairs, subtract an absolute error $O \( D_g \/ l \)$ and divide by $1 - O \( D_g \/ l \)$. The remaining inverse series has expectation $O \( n^eta \/ l \)$ by (5.2). Consequently,
  #[#set math.equation(numbering: n => "(5.4)")
   $ bb(E) Delta L_1 = a_l L_1 + O #h(-0.16667em) (\( n^eta + D_g \) \/ l + n^c \/ \( l alpha \) + n^(3 v_(*)) \/ \( l^2 alpha^3 \)) \, quad - C \/ l lt.eq a_l lt.eq n^(- c_3) \/ l $ <eq:original-16>]
  for some $c_3 > 0$. Before conditioning, the coefficient is $frac(2, l - 1) \[ h^2 \( "Tr" K_(upright("all")) \/ l - 1 \) - 1 \]$. Its stated bounds follow from the averaged upper bound in (4.10) and $parallel xi_x parallel^2 = 1 + O \( 1 \/ l \)$. The positive normalization for valid pairs preserves these upper and lower bounds. Also,
  #[#set math.equation(numbering: n => "(5.5)")
   $ bb(E) \( Delta L_1 \)^2 lt.eq C #scale(x: 120%, y: 120%)[\(] n^(2 c) \/ \( l alpha^2 \) + n^(4 v_(*)) \/ \( l^2 alpha^4 \) + n^eta \/ l #scale(x: 120%, y: 120%)[\)] . $ <eq:original-17>]
  Indeed, the ideal $K_(u v)$ term uses (4.12), while diagonal same-end ideal terms have coefficient $O \( 1 \/ l \)$. All other terms use (5.2).
  For the global trace, $Delta L_0 = - "Tr" H Q$. The ideal centered term has zero full mean. The term with a single $D_p$ between pure swaps has diagonal main contribution at most $C \| L_1 \| \/ \( l alpha \)$. Its cross contribution is bounded using $"Tr" \( Gamma + Pi_l \) Q_(upright("all"))$, together with the same-index corrections. The remainder is $O \( n^eta \/ \( l alpha \) \)$. Thus, on valid choices,
  #[#set math.equation(numbering: n => "(5.6)")
   $ \| bb(E) Delta L_0 \| & lt.eq C #scale(x: 120%, y: 120%)[\(] \( \| L_1 \| + n^eta + D_g \) \/ \( l alpha \) + n^c \/ \( l alpha^2 \) + n^(3 v_(*)) \/ \( l^2 alpha^4 \) #scale(x: 120%, y: 120%)[\)] \,\
bb(E) \( Delta L_0 \)^2 & lt.eq C #scale(x: 120%, y: 120%)[\(] n^(2 c) \/ \( l alpha^4 \) + n^(4 v_(*)) \/ \( l^2 alpha^6 \) + n^eta \/ \( l alpha^2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:original-18>]
  The contractions used here can be read directly from Lemma 12: for $K_(upright("all")) = Gamma^2$, $"Tr" \( D K_(upright("all")) \) = "Tr" \( Gamma^3 \) - "Tr" \( Gamma^2 \)$, and for $Q_(upright("all")) succ.curly.eq 0$, $\| "Tr" \( D Q_(upright("all")) \) \| lt.eq "Tr" \( Gamma Q_(upright("all")) \) + cal(T)$. The diagonal exclusions are bounded using $K_(x x) lt.eq C$, $Q_(x x) lt.eq C \/ alpha$, and $sum_x \| D_(x x) \| lt.eq n^(eta \/ 2) sqrt(l)$. Terms with two or more $D_p$ factors have absolute value at most $C parallel D_p parallel^2$, respectively $C parallel D_p parallel^2 \/ alpha$, because the remaining inverse series is geometric. Their expectations are bounded by (5.2). The ideal variances are $C "Tr" \( K_(upright("all"))^2 \) \/ l^2$ and $C "Tr" \( Q_(upright("all"))^2 \) \/ l^2$, respectively; applying (4.12) gives exactly the first two summands of (5.5) and (5.6).
  #emph[Lower drift of $cal(T)$.] To prove (5.1), we will control the reciprocal statistic. We first bound $bb(E) Delta cal(T)$ from below. The exact update of $cal(T)$ is
  #[#set math.equation(numbering: n => "(5.7)")
   $ Delta cal(T) = - "Tr" #scale(x: 120%, y: 120%)[\[] B \( I - G H \) Q \( I - H G \) #scale(x: 120%, y: 120%)[\]] - 2 "Tr" H J + "Tr" H Q H K . $ <eq:original-19>]
  Using $G_0 \, H_0$ in the outer terms, their full-pair mean divided by $cal(T)$ is
  $ frac(2, l - 1) thin \[ h^2 \( "Tr" K_(upright("all")) \/ l - 1 \) - 1 \] + O \( \( 1 + parallel Gamma parallel^2 \) \/ l^2 \) . $
  For the first outer term, expand $I - G_0 H_0 = I + sigma h F$. The centered $F B$ term averages to zero, and the other contribution is $- 2 \( 1 + h^2 \) \/ \( l - 1 \)$. For the last term, use the same opposite-diagonal swap average. Its cross trace satisfies $"Tr" K_(upright("all")) Q_(upright("all")) lt.eq parallel Gamma parallel^2 cal(T)$; the diagonal exclusions and $O \( 1 \/ l \)$ swap errors use $K_(x x) lt.eq C$.
  At primaries, (4.11) therefore bounds this relative drift below by $- C alpha cal(T) \/ l^2 - n^(- c_4) \/ l$. Pair smallness and (5.2) bound the change from the ideal outer terms, on valid pairs, by $n^(- c_4) "Tr" Q$, decreasing $c_4 > 0$ if necessary. The invalid ideal contributions have average $O \( D_g cal(T) \/ l^2 \)$.
  For the $J$ term, the ideal contraction $H_0 J$ has zero full mean. In the term with one deviation, $H_0 D_p H_0 J$, diagonal factorization uses $"Tr" J_(upright("all")) = "Tr" Gamma Q_(upright("all"))$, and the cross trace uses $D = Gamma - Pi_l$. The swap average is therefore bounded by
  $ C #scale(x: 120%, y: 120%)[\(] \| L_1 \| parallel Gamma parallel + parallel Gamma parallel^2 + parallel Gamma parallel #scale(x: 120%, y: 120%)[\)] cal(T) \/ l^2 \, $
  apart from same-index exclusions, invalid pairs, and the $O \( 1 \/ l \)$ changes in the swap coefficients. This main bound is power-small relative to $cal(T) \/ l$, since $\| L_1 \| lt.eq n^(.075 a) \/ alpha_(*)$ and $n^(2 v_(*)) \/ \( l alpha_(*)^2 \) lt.double 1$.
  To handle the exclusions and coefficient changes, including the invalid-pair part of the ideal $J$ contraction, use
  $ \| J_(x y) \| lt.eq C sqrt(\( Q_(upright("all"))^2 \)_(y y)) \, quad sum_y sqrt(\( Q_(upright("all"))^2 \)_(y y)) lt.eq C n^(v_(*)) alpha^(- 3 \/ 2) sqrt(l cal(T)) . $
  Their mean, divided by $cal(T) \/ l$, is at most
  $ frac(C \( D_g + 1 \) n^(v_(*)), alpha^(3 \/ 2) sqrt(l cal(T))) \, $
  which is power-small under the current lower bound (5.1). Finally, terms with at least two deviations use $bb(E)_(upright("valid")) parallel D_p parallel^2 lt.eq C n^eta \/ l$ and $max \| J_(x y) \| lt.eq C n^(v_(*)) \/ alpha^2$; their contribution is also power-small relative to $cal(T) \/ l$. Conditioning on valid pairs preserves the resulting lower drift bound. We have proved
  #[#set math.equation(numbering: n => "(5.8)")
   $ bb(E) Delta cal(T) \/ cal(T) med gt.eq med - C alpha cal(T) \/ l^2 - n^(- c_4) \/ l $ <eq:original-20>]
  with some $c_4 > 0$, for sufficiently small $theta \, eta$.
  #emph[Second moment and maximum increment of $cal(T)$.] In (5.7), the outer terms are bounded by $C "Tr" Q$, giving second moment $C cal(T) \/ \( alpha l \)$. The off-diagonal $J$ terms use $parallel Gamma Q_(upright("all")) parallel_F^2 lt.eq C n^(4 v_(*)) cal(T) \/ alpha^5$. For a diagonal $J_(u u)$, the coefficient $H_(u u)$ has conditional squared average at most $C n^eta \/ l$ over a uniform valid partner. Indeed, expansion around $H_0$ gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ \| H_(u u) \| lt.eq C \( 1 \/ l + \| D_(v v) \| + \| D_(u v) \| \) $ <eq:original-21>]
  on valid pairs: the first pure swap from $u$ touches $v$, all other factors are uniformly small, and a non-pure initial swap costs $O \( 1 \/ l \)$. The conditional claim follows from (5.2) and $D_g lt.double l$. Also, the norm bound times the trace gives
  $ sum_u J_(u u)^2 lt.eq C "Tr" Q_(upright("all"))^2 lt.eq C n^(2 v_(*)) cal(T) \/ alpha^3 . $
  Consequently,
  #[#set math.equation(numbering: n => "(5.10)")
   $ bb(E) \( Delta cal(T) \)^2 lt.eq C (frac(cal(T), alpha l) + frac(n^(4 v_(*)) cal(T), alpha^5 l^2) + frac(n^(2 v_(*) + eta) cal(T), alpha^3 l^2)) . $ <eq:early-T-variance>]
  Individually, $\| Delta cal(T) \| lt.eq C n^(v_(*)) \/ alpha^2 lt.double cal(T)$ under (5.1). ◻
]

#thm([Lemma 5.4.])[
  (Trace control by weighted choice).  #emph[The trace-square accounts and the inverse-$cal(T)$ account have bounded discount loss under the bootstrap bounds and imply the trace conclusions of Proposition 11 with a positive power of slack.]
] <lem:early-trace-accounts>

#proof[
  #emph[Trace-square accounts.] Track $1 + L_i^2 \/ S_i^2$, where $S_1 = n^(.065 a) \/ alpha_(*)$ and $S_0 = n^(.095 a) \/ alpha_(*)^2$. In (5.4), the coefficient contribution to square drift is at most $2 n^(- c_3) L_1^2 \/ l$. Use $2 \| L \| \/ S lt.eq 1 + L^2 \/ S^2$ for each additive mean error. Since $sum l^(- 1) = O \( log n \)$, $sum l^(- 2) = O \( l_0^(- 1) \)$, and $alpha_(*)^2 l_0 asymp n^(1.15 a)$, the normalized mean and variance budgets for $L_1$ are bounded by fixed multiples of
  $ \( n^(eta - .065 a) alpha_(*) + n^(- .063 a) alpha_(*) + n^(- .035 a) \) log n + n^(- .840 a) quad upright("and") quad n^(- .070 a) log n + n^(- .780 a) + n^(eta - .130 a) alpha_(*)^2 log n . $
  Both tend to zero. The $L_0$ bounds follow from (5.6): the term involving $L_1$ loses at most $n^(- .020 a) log n$, and every other normalized term has a larger strict margin. This proves the two trace-square assertions.
  #emph[The reciprocal account.] Divide (5.10) by $cal(T)^2$ and sum using the current lower bound (5.1). The result is power-small; the particularly relevant bounds are $n^(4 v_(*) + theta) \( 1 \/ \( n alpha^5 l_0 \) + 1 \/ \( alpha^4 l_0^2 \) \) lt.double 1$. The maximum relative increment from Lemma 13 permits Taylor expansion of the reciprocal. Together with (5.8), this yields
  $ bb(E) \( 1 \/ cal(T)' \) lt.eq \( 1 + u_l \) \/ cal(T) + C alpha \/ l^2 \, #h(2em) sum u_l = o \( 1 \) $
  with deterministic nonnegative upper budgets under the caps. For $f_l = 1 \/ n + alpha \/ l$, use the account $1 + n^(- theta \/ 4) \/ \( cal(T) f_l \)$. The scaled additive errors $C n^(- theta \/ 4) alpha \/ \( l^2 f_(l - 2) \)$ sum to $o \( 1 \)$. This proves (5.1) with a positive power of slack. ◻
]

=== 5.2 Entry increments and their conditional means <entry-increments-and-their-conditional-means>

The trace bounds do not alone control each matrix entry. We therefore compare the exact inverse update with the truncated path update. The resulting expansion has two kinds of terms whose signs must be retained; all other terms can be estimated by absolute path bounds. The following classification records every possible position of an error factor.

In the update expansion below, entries are first evaluated on the old output vectors. Recentring the surviving stub vectors is dealt with explicitly at the end of Lemma 16. For a matrix $X$ on vertex space put

$ cal(Q) \( X \) = X U H_X U^T X \, #h(2em) H_X = H_0 sum_(m gt.eq 0) \[ - \( U^T X U - G_0 \) H_0 \]^m . $

For $X = W$ or $P$ these series converge numerically on every valid pair. The formula for $cal(Q) \( P \)$ also has its coefficientwise meaning from (4.1). Set

$ T = U^T P U - G_0 \, #h(2em) D_E = U^T E U \, #h(2em) cal(R)_P = \[ cal(Q) \( P \) \]_(gt.eq L) . $

We call an entry of $T$ a topology factor: it measures the path reference’s deviation from the pair comparison block $G_0$. A diagonal topology factor at $x$ is bounded by $j_x$, and an off-diagonal one by $b_(u v)$. We also call diagonal topology factors local factors. Entries of $D_E$ are intermediate error factors; errors in the two outer entries will be kept separate. The exact increment on the old output vectors is

$ Delta E = - { cal(Q) \( W \) - cal(Q) \( P \) } - cal(R)_P . $

This identity fixes the sign of the formal tail. We retain signs for the terms with no intermediate factor and for the terms with one intermediate error and no topology factor. The proof below identifies their cancellations explicitly.

For an output label $i$, let $r_i \( x \) = A_i \( x \) + \| e_i \( x \) \|$. The hypotheses give

$ sum_(x in S) r_i \( x \)^2 lt.eq C \, quad max_x r_i \( x \) lt.eq C \, quad sum_x j_x^2 lt.eq n^eta \, quad max_u sum_v b_(u v)^2 lt.eq C \, quad Q_a := n^eta q^(L \/ 2) . $

Increasing $n^eta$ by an arbitrarily small exponent if necessary, $sum_x j_x lt.eq Q_a$ and $max_u sum_v b_(u v) lt.eq Q_a$, by (4.5) and (4.4), respectively. All matrices of majorants on stub labels can be taken symmetric.

#thm([Lemma 5.5.])[
  (Index-word classification).  #emph[Expand every occurrence of $H_0$ as $- sigma h F - sigma h J_2 \/ \( l - 2 \)$, every intermediate factor as $T + D_E$, and each outer factor as $P + E$. A resulting scalar word has two outer endpoint indices $s \, t in { u \, v }$, alternating swap and intermediate factors, and one of the following descriptions.]
  + #emph[It contains a non-pure swap $- sigma h J_2 \/ \( l - 2 \)$.]
  + #emph[All swaps are pure and it contains an off-diagonal $T$ factor, bounded by $b_(u v)$.]
  + #emph[All swaps are pure, all $T$ factors are diagonal, and at least two intermediate factors are $D_E$.]
  + #emph[All swaps are pure, all $T$ factors are diagonal, there is at least one intermediate factor, and there is at most one $D_E$ factor. If $s = t$, either there is a diagonal $T$ factor at $macron(s)$, or the word has exactly one intermediate factor, namely $\( D_E \)_(macron(s) macron(s))$. If $s eq.not t$ and there is a $T$ factor, there is at least one local factor $j_u$ or $j_v$. If there is no $D_E$ factor, both local factors occur.]
  + #emph[There are no intermediate factors. Its pure-swap portion has $s eq.not t$.]
  #emph[Here $macron(u) = v$ and $macron(v) = u$. The list is exhaustive; the cases are made disjoint by testing them in the displayed order. With only one intermediate $D_E$ and no $T$, the exceptional same-end word in item 4 is precisely $h^2 x_i \( s \) x_j \( s \) e_(macron(s)) \( macron(s) \)$, where $x_i \, x_j$ are the chosen outer arrays, each a $p$ or $e$ row. All estimates obtained by retaining at most a fixed number of marked factors in these cases can be summed over the remaining words with a constant independent of $n$.]
] <lem:early-index-words>

#proof[
  After item 1 is excluded, a swap changes an endpoint to its opposite. An intermediate diagonal $T$ leaves that endpoint unchanged. An intermediate off-diagonal $T$ puts the word in item 2. Exclude items 2 and 3. In a same-end word, the index immediately after the first swap and immediately before the last swap is $macron(s)$. If a local factor at $macron(s)$ never occurs, both these visits must be incident to the sole $D_E$ factor. A swap between distinct intermediate positions changes the index, so a second intermediate position would force either another $D_E$ or a local factor at $macron(s)$. Hence the sole intermediate is $\( D_E \)_(macron(s) macron(s))$. In a distinct-end word consisting only of local factors, the number of intermediates is positive and even; the indices alternate, so both endpoints occur. These observations prove items 4 and 5 and their exhaustiveness.
  For convergence, let $epsilon_n$ bound the absolute entry sum of an intermediate $T + D_E$ block on a valid pair. Equations (4.6) and the entry bootstrap imply $epsilon_n arrow.r 0$. There are at most $4^(m + 1)$ endpoint index strings with $m$ intermediates. If at most $b$ positions are marked, summation of the unmarked positions is dominated by
  $ C_b sum_(m gt.eq b) \( m + 1 \)^b \( C epsilon_n \)^(m - b) \, $
  which is bounded for large $n$. A non-pure swap at a marked position contributes $C \/ l$. The coefficientwise absolute majorants of the tail have the same convergence after its degree restriction is discarded. This proves the final assertion and also justifies termwise expectation and the use of Minkowski’s inequality for second moments. ◻
]

The elementary averaging bounds behind the classification will be used repeatedly. For nonnegative arrays $a \, c$ with bounded squared sums, full independent uniform endpoints satisfy

$ upright("retained factors") & upright("absolute first moment") & upright("second moment")\
a \( u \) c \( v \) & C \/ l & C \/ l^2\
a \( u \) c \( u \) \/ l & C \/ l^2 & C \/ l^3\
a \( u \) c \( u \) j_v & C Q_a \/ l^2 & C n^eta \/ l^2\
a \( u \) c \( u \) b_(u v) & C Q_a \/ l^2 & C \/ l^2\
a \( u \) c \( v \) j_u & C n^(eta \/ 2) \/ l^(3 \/ 2) & C n^eta \/ l^2\
a \( u \) c \( v \) b_(u v) & C Q_a \/ l^2 & C \/ l^2\
d_m^2 a \( u \) c \( u \) & C d_m^2 \/ l & C d_m^4 \/ l . $

For example, the first-moment cross-topology bound follows from $parallel b parallel lt.eq max_u sum_v b_(u v) lt.eq Q_a$; the same-end version uses its row-sum bound before summing $a \( u \) c \( u \)$. For second moments of a cross-topology term, sum $b_(u v)^2$ over its free endpoint and use the bounded suprema of the outer arrays. For a local factor, use $sum_v j_v^2 lt.eq n^eta$, or Cauchy–Schwarz for its first moment. These arguments prove every table entry. Restricting to distinct, valid, surviving endpoints costs a bounded density factor. Consequently the table also applies under the conditional laws of this section.

#thm([Lemma 5.6.])[
  (Signed entry mean).  #emph[For every existing output pair, conditionally on its survival, 
#[#set math.equation(numbering: n => "(5.11)")
 $ \| bb(E) Delta E_(i j) \| lt.eq mu_l \, #h(2em) mu_l = C [frac(n^(v_(*)) \/ alpha_(*) + n^eta q^(L \/ 2) + D_g, l^2) + n^eta / l^(3 \/ 2) + d_m^2 / l] . $ <eq:original-22>]

 This includes recentered stub outputs.]
] <lem:early-entry-mean>

#proof[
  First consider words without intermediate factors. Their exact $H_0$ contraction is zero for a full ordered distinct pair by (4.2); the same statement holds coefficientwise for the pure-$P$ tail. Omitting at most two labels costs $C \/ l^2$, using their bounded entries and the squared row bounds in (4.2). If $cal(B)$ is the symmetric forbidden-pair indicator, then $parallel cal(B) parallel lt.eq D_g$. Thus an opposite-outer product on forbidden pairs has sum at most $D_g parallel r_i parallel_2 parallel r_j parallel_2 lt.eq C D_g$. A same-end product has at most $D_g$ partners and an extra $1 \/ l$ from its non-pure swap. After division by $l \( l - 1 \)$, the forbidden-pair cost is $C D_g \/ l^2$.
  Next retain exactly one intermediate $D_E$, no topology factor, pure swaps, and arbitrary $W$ outers. This groups all outer choices without losing their signs. Write
  $ Y_E = "Tr" \( Xi^T E Xi \) \, #h(2em) \| Y_E \| lt.eq \| L_1 \| + Q_a \, #h(2em) parallel Xi^T E Xi parallel lt.eq C n^(v_(*)) \/ alpha + C \( 1 + L \)^3 . $
  For same outer endpoint $u$, the numerator sum is
  $ sum_(u eq.not v) w_i \( u \) w_j \( u \) e_v \( v \) = Y_E sum_u w_i \( u \) w_j \( u \) - sum_u w_i \( u \) w_j \( u \) e_u \( u \) \, $
  whose magnitude is $C \( 1 + \| Y_E \| \)$. For distinct outer endpoints it is a bilinear contraction of $Xi^T E Xi$ with two bounded $ell^2$ rows, after a diagonal exclusion, and is bounded by $C \( 1 + parallel Xi^T E Xi parallel \)$. On a surviving set $I$ obtained by deleting at most two output labels, the same-end numerator is
  $ (sum_(v in I) e_v \( v \)) (sum_(u in I) w_i \( u \) w_j \( u \)) - sum_(u in I) w_i \( u \) w_j \( u \) e_u \( u \) \, $
  and is still bounded by $C \( 1 + \| Y_E \| \)$: the first diagonal sum changes by $O \( d_m \)$, and the second factor is bounded by the two row norms. For distinct outer endpoints, deleting a bounded number of rows or columns changes the bilinear numerator by $C$. The required bounded $ell^2$ rows of $Xi^T E Xi$ follow from $E = W - P$ and the stub-row square bounds for $W$ and $P$ in (4.10) and (4.5). Forbidden-pair subtraction costs $C D_g$ by the preceding operator-norm argument; the extra intermediate entries are bounded. These estimates give the $n^(v_(*)) \/ alpha_(*)$ contribution in (5.11).
  Every remaining word is covered by Lemma 15. A non-pure swap gives $C \/ l^2$ in first moment. A cross-topology word gives $C Q_a \/ l^2$. If there is no cross topology and at most one intermediate $D_E$ factor, a same-end topology word contains $j_(macron(s))$, giving $C Q_a \/ l^2$, and a distinct-end topology word contains a local factor, giving $C n^eta \/ l^(3 \/ 2)$. A word with at least two intermediate $D_E$ factors gives $C d_m^2 \/ l$. These statements apply also when an outer is $E$, since it is bounded by $r_i$. They also apply to the coefficient tail by absolute majorization. The geometric summation in the classification lemma gives the same bounds for the entire series.
  Finally, for a surviving stub, $xi'_x = xi_x + \( xi_u + xi_v \) \/ \( l - 2 \)$. The old-axis entries of the new $E$ have sup $C d_m$: this follows from the difference series, in which every numerical word contains an $E$, and from (4.7). For a fixed other output $i$, $bb(E) \| E'_(u i) \| + bb(E) \| E'_(v i) \| lt.eq C \/ sqrt(l)$. Indeed the old entry has this bound by its squared row sum. In every update word the selected-axis outer is bounded and the other outer is at $u$ or $v$; averaging that outer uses $sum_x r_i \( x \) lt.eq sqrt(l) parallel r_i parallel_2$. The formal tail is bounded coefficientwise by the same argument. Thus the two first-order recentering terms have mean $C l^(- 3 \/ 2)$, and the term changing both axes has mean $C d_m \/ l^2$. Their pointwise total is $C d_m \/ l$. This proves the stated bound. ◻
]

=== 5.3 Low square sums <low-square-sums>

The row-square estimates for $W$ and $P$ already control averages of the squared entries of $E$ in a row. We now bound the same errors on diagonals and among pairs at a fixed distance. The exceptional same-end word in Lemma 15 copies a selected endpoint’s diagonal error to surviving outputs. For stub diagonals, deletion of the two selected labels will outweigh this contribution. For nearby pairs, we must also count those brought close by the new edge. We first bound the reference entries that arise in this second calculation.

#thm([Lemma 5.7.])[
  (Aligned short-path residual).  #emph[Fix an integer $k$. For $i in X$, $u in S$ at actual vertex distance at most $k$, remove from the actual part of $p_i \( u \)$ the monomial of the unique short path. The squared sum of the remaining coefficientwise absolute majorants over all these pairs is at most 
$ n^eta + C \( 1 + L \)^4 q^L \/ l . $

 Here $X = V$ or $S$, and $eta$ can be any prescribed positive constant after the structural losses are reduced.]
] <lem:early-near-reference>

#proof[
  For large $n$, $g_0 > 2 k$, so the short path is unique. Expand the square of the remaining actual paths. A summand consists of that short path and two nonbacktracking alternatives of lengths $a_1 \, a_2 < L$. Its union has a cycle; the alternative equal to the short path was removed. If the excess is at least two, the structural diagram estimate gives, after multiplication by $h^(a_1 + a_2)$, at most $n^(- 1 + o \( 1 \)) q^(\( a_1 + a_2 \) \/ 2 + k)$. Summing the logarithmically many lengths is still at most $n^(- 1 + o \( 1 \)) q^(L + k) = o \( 1 \)$.
  For excess one the union is unicyclic. Suppress its forced tree tails at the two endpoints. A nonbacktracking walk can only follow one of the two cycle arcs, possibly with complete laps. If the short path uses one arc, every alternative distinct from it covers the other arc or completes a lap. If the short path stays in an attached tree, every alternative reaches the cycle and completes a lap. Consequently all edges outside the short path belong to each alternative, and $e_H lt.eq min \( a_1 \, a_2 \) + k$. The weighted embedding bound is therefore
  $ n^(o \( 1 \)) q^(e_H - \( a_1 + a_2 \) \/ 2) lt.eq n^(o \( 1 \)) q^k . $
  The number of shapes, length choices, and walk choices is absorbed by an arbitrarily small fixed power. Bounded stub multiplicities change only constants. Finally there are $O_k \( l \)$ near pairs, and the per-entry uniform and centering error is $C \( 1 + L \)^2 q^(L \/ 2) \/ l$. Its square sum has the displayed size. ◻
]

#thm([Lemma 5.8.])[
  (Control of squared entry sums).  #emph[For any fixed radius $R_c$, the simultaneous accounts retain 
#[#set math.equation(numbering: n => "(5.12)")
 $ & T_S = sum_(x in S) e_x \( x \)^2 lt.eq n^eta \, #h(2em) T_V = sum_(i in V) E_(i i)^2 lt.eq n^eta n \/ l_0 \,\
 & T_(X S \, k) = sum_(i in X \, med x in S\
"dist" \( "vtx" i \, "vtx" x \) lt.eq k) e_i \( x \)^2 lt.eq n^eta \, #h(2em) X in { V \, S } \, quad 0 lt.eq k lt.eq R_c . $ <eq:original-23>]

 The final exponent $eta > 0$ may be prescribed in advance and made arbitrarily small.]
] <lem:early-low-squares>

#proof[
  #emph[The surviving stub diagonal.] The single-intermediate exception of Lemma 15, with both outers equal to $P$, is the copy increment
  $ Z_x = h^2 \[ p_x \( u \)^2 e_v \( v \) + p_x \( v \)^2 e_u \( u \) \] . $
  There is a fixed $C_4 < q^2$ such that
  #[#set math.equation(numbering: n => "(5.13)")
   $ sum_(x in S \, med x eq.not u) \| p_x \( u \) \|^4 lt.eq C_4 . $ <eq:original-24>]
  Indeed, let $s_u$ be the number of unresolved stubs at the vertex of $u$. Short paths of length less than $g_0 \/ 3$ are unique in total at each endpoint. The degree-zero contribution, excluding $u$, is at most $s_u - 1$. The positive-length contribution is bounded by
  $ sum_(j gt.eq 1) d \( d - s_u \) q^(j - 1) q^(- 2 j) = frac(d \( d - s_u \), q \( q - 1 \)) . $
  For $q = 2$, the sum is at most 3; for $q gt.eq 3$, its maximum over $1 lt.eq s_u lt.eq d$ is strictly below $q^2$. The long-path and uniform terms have vanishing fourth norm by (4.5)–(4.8). This proves (5.13) with a strict constant margin.
  Summing over surviving $x$ before averaging gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ bb(E) sum_(x eq.not u \, v) Z_x^2 lt.eq \( 1 + o \( 1 \) \) frac(2 h^4 C_4, l) T_S + C d_m^2 \/ l . $ <eq:original-25>]
  For its two squared summands use (5.13) and then sum the opposite diagonal square. For the cross product use
  $ sum_x (sum_u p_x \( u \)^2)^2 lt.eq C l \, #h(2em) \| e_u \( u \) e_v \( v \) \| lt.eq d_m^2 . $
  The conditional restriction has density $1 + o \( 1 \)$, so it preserves the strict margin.
  After subtracting $Z_x$, the remainder obeys
  #[#set math.equation(numbering: n => "(5.15)")
   $ bb(E) sum_(x eq.not u \, v) \| Delta e_x \( x \) - Z_x \|^2 lt.eq C \( n^eta \/ l + d_m^4 \) . $ <eq:original-26>]
  Here is the complete reduction to the index-word cases. A distinct-end word has second moment $C \/ l^2$ for each $x$, by the first row of the averaging table. A non-pure same-end word has second moment $C \/ l^3$. A pure same-end word with topology and at most one intermediate $E$ has an opposite local factor or a cross-topology factor; its second moment is $C n^eta \/ l^2$ by the third or fourth row of the table. A word with at least two intermediate $E$’s has second moment $C d_m^4 \/ l$. If exactly one intermediate is $E$, no topology occurs, and an outer is also $E$, use
  $ sum_s \| e_x \( s \) \|^2 r_x \( s \)^2 lt.eq C d_m^2 $
  in addition to the intermediate bound $d_m$; this again gives $C d_m^4 \/ l$. The only same-end word left after these tests is $Z_x$, already removed. The formal tail follows the same tests, with no $E$’s; its zero-intermediate pure-swap word is necessarily distinct-end. The recentering terms contribute at most $C d_m^2 \/ l$ after summing over $x$. Summing the per-output bounds over at most $l$ outputs and using the geometric Minkowski bound in Lemma 15 proves (5.15).
  Deletion removes $\( 1 - o \( 1 \) \) 2 T_S \/ l$ in expectation. The existing first-order square term is at most $2 mu_l sqrt(l T_S)$. Since $h^4 C_4 < 1$, choose a fixed $epsilon > 0$ such that $\( 1 + epsilon \) h^4 C_4 < 1$. Apply $\( x + y \)^2 lt.eq \( 1 + epsilon \) x^2 + \( 1 + epsilon^(- 1) \) y^2$ to $Z_x$ and its remainder and then Young’s inequality to the first-order term. Some fixed part of the deletion remains available to absorb it. The resulting upper drift is
  $ bb(E) T'_S lt.eq T_S + C \( l^2 mu_l^2 + n^eta \/ l + d_m^4 \) . $
  The non-logarithmic quantities controlling the sum are
  $ frac(n^(2 v_(*)), alpha_(*)^2 l_0) = n^(- .900 a) \, quad q^L / l_0 = n^(- .580 a + o \( 1 \)) \, quad D_g^2 / l_0 = o \( 1 \) \, quad n d_m^4 = n^(- 1 \/ 3 + 1.020 a + o \( 1 \)) = o \( 1 \) . $
  The other term in $mu_l$ costs only $n^(2 eta) log n$. A slightly larger small-power normalization makes the complete additive budget summably small.
  #emph[Global diagonals.] No deletion is used. The copy squares have expected sum at most $C T_S \/ l + C n d_m^2 \/ l^2$, by the bounded fourth columns in Lemma 9. The classification just proved gives $C n \( n^eta \/ l^2 + d_m^4 \/ l \)$ for the other squares. The first-order term is at most $2 mu_l sqrt(n T_V)$. At scale $S_V = n^(eta') n \/ l_0$, the corresponding multiplier is bounded by $C mu_l sqrt(l_0) \/ n^(eta' \/ 2)$, using $2 sqrt(T_V \/ S_V) lt.eq 1 + T_V \/ S_V$. The sum $sqrt(l_0) sum mu_l$ is at most an arbitrarily small power, and the summed variance divided by $n \/ l_0$ has the same property. Choosing $eta'$ larger than the input losses proves the global diagonal bound with an arbitrarily small final loss.
  #emph[Existing near pairs.] For a fixed $k$, there are $O_k \( l \)$ near outputs. All non-copy variance terms cost $C_k \( n^eta \/ l + d_m^4 \)$. For a copy term, at a fixed endpoint $u$,
  $ sum_(i \, x : thin "dist" \( i \, x \) lt.eq k) A_i \( u \)^2 A_x \( u \)^2 lt.eq C_k . $
  This follows by summing first over the bounded ball around $x$, using the bounded sup of $A_i \( u \)$, and then its squared column sum over stub $x$. Consequently the copy variance costs $C_k T_S \/ l$, rather than a self term involving $T_(X S \, k)$. The existing first-order term is $C_k mu_l sqrt(l T_(X S \, k))$, and $sum sqrt(l) mu_l$ is bounded by an arbitrarily small power.
  #emph[New near pairs.] A newly near pair has a short simple path using the new edge once. For one of its two orientations, $i$ is at old distance $k_1$ from $u$, $x$ at old distance $k_2$ from $v$, and $k_1 + 1 + k_2 lt.eq k$. Each choice has bounded multiplicity. The expected sum of the squared new entries is at most
  #[#set math.equation(numbering: n => "(5.16)")
   $ C_k (n^eta + T_S + sum_(X' in { V \, S } \, med j < k) T_(X' S \, j)) \/ l . $ <eq:original-27>]
  To verify this without discarding an aligned large reference entry, expand the old entry plus every index word. An old entry, or an outer $E$ whose endpoint is opposite the associated short neighborhood, is summed by its squared row bound over the free opposite stub; bounded reverse neighborhood multiplicity gives $C_k \/ l$. An aligned outer $e_i \( u \)$ or $e_x \( v \)$ charges $T_(X S \, k_1) \/ l$ or $T_(S S \, k_2) \/ l$, respectively. An intermediate $E$ charges $T_S \/ l$ when diagonal and $C \/ l$ when off-diagonal, again by its squared rows. Other factors have bounded sup and can be summed geometrically.
  It remains to check a pure reference-tail word. Any intermediate topology factor has second moment at most $n^eta \/ l$, even with the bounded short-neighborhood multiplicities; a misaligned outer has the same bound by its squared rows. For aligned outers, split off their unique short monomials. Lemma 17 charges the residual squares by $n^eta + C \( 1 + L \)^4 q^L \/ l$, and the free opposite endpoint supplies $1 \/ l$. If both outers are their short monomials and there are no intermediate factors, a pure swap has total degree $k_1 + 1 + k_2 < L$, so contributes nothing to the tail. A non-pure swap has coefficient $O \( 1 \/ l \)$, which is already within the claimed bound. This exhausts the reference-tail cases. Recentring costs a smaller term, since its sup is $C d_m \/ l$. Minkowski’s inequality and the geometric word summation prove (5.16).
  Finally choose the losses in a fixed finite order. Start with a structural loss $eta_0 > 0$ so small that $\( 20 + 4 R_c \) eta_0 < eta$. Choose the normalization and extraction exponents for $T_S$, $T_V$, and then successively for $T_(X S \, 0) \, dots.h \, T_(X S \, R_c)$, increasing the available exponent by at least $2 eta_0$ at each use of a preceding estimate. Enlarge the first normalization enough to exceed twice the exponent in its cumulative first-order budget. Every cumulative additive cost is then $o \( 1 \)$ after normalization, and every multiplier has bounded sum. There are only $2 R_c + O \( 1 \)$ accounts per tracked point. All extraction losses fit below the prescribed $eta$ by taking $eta_0$ smaller if required. This proves (5.12). ◻
]

=== 5.4 From averaged errors to uniform entry bounds <from-averaged-errors-to-uniform-entry-bounds>

The squared-sum estimates now supply a small factor in every mixed moment. Pure powers require more care: their drift must have a coefficient independent of the fixed moment order. We keep pair moments and diagonal moments separate, then choose a fixed weight for the latter. This absorbs the large transfer from pair moments to diagonal moments without enlarging the common drift coefficient.

Set $z_(i j) = E_(i j) \/ B_e$. For $X \, Y in { V \, S }$, let

$ Phi_(X Y) = frac(1, \| X \| \| Y \|) sum_(i in X \, j in Y) \| z_(i j) \|^p \, #h(2em) Psi_X = frac(1, \| X \|) sum_(i in X) \| z_(i i) \|^p \, #h(2em) F_p = sum_(X \, Y) Phi_(X Y) \, quad D_p^(upright("mom")) = sum_X Psi_X . $

Here $p gt.eq 4$ is an even integer, fixed independently of $n$, and $M_p = 1 + F_p + D_p^(upright("mom"))$. The notation $D_p^(upright("mom"))$ is used only in this subsection and is distinct from the two-by-two precision deviation $D_p$. All output averages are deterministic uniform sums in the current state.

By (4.5), (4.8), (4.10), and (5.12), some fixed $beta > 0$ has the following properties. Every row average of $\| z \|^2$, over either output type, is at most $n^(- beta)$. Every diagonal second average has the same bound. For any fixed radius $R_c$, the measure

$ integral f thin d mu_X = frac(1, \| X \|) sum_(i in X \, u in S\
"dist" \( i \, u \) lt.eq R_c) f \( i \, u \) $

has bounded mass and satisfies $integral \| z_(i u) \|^2 d mu_X lt.eq n^(- beta)$ and $integral \| z_(i u) \|^p d mu_X lt.eq l Phi_(X S)$. For example, before tiny losses the stub-row and near-pair second averages have margin $.62 a$, whereas a global row has margin at least $.97 a$. Thus $beta$ can be fixed, say below $.30 a$, independently of the later choice of $p$.

#thm([Lemma 5.9.])[
  (Interpolation and a kernel inequality).  #emph[Let a measure of bounded mass satisfy $integral \| z \|^2 lt.eq n^(- beta)$ and $integral \| z \|^p lt.eq M$. For every fixed $0 < t < p$, 
#[#set math.equation(numbering: n => "(5.17)")
 $ integral \| z \|^t lt.eq n^(- beta_t) \( 1 + M \)^(t \/ p) \, #h(2em) beta_t > 0 \, $ <eq:original-28>]

 for sufficiently large $n$. If a nonnegative kernel $K$ on two probability spaces has both marginal densities at most $b$, then for nonnegative $f \, g$ and $r \, s gt.eq 0$, $r + s lt.eq 1$, 
$ integral.double K \( x \, y \) f \( x \)^r g \( y \)^s thin d x thin d y lt.eq b (integral f)^r (integral g)^s . $

 For $K \( i \, u \) = \| p_i \( u \) \|^k$, $2 lt.eq k lt.eq p$, with uniform $i in X \, u in S$, one may use $b = n^(eta_0) \/ l$ for any fixed $eta_0 > 0$, once $n$ is sufficiently large. The row marginal alone is at most $C_p \/ l$. For $k = p$ or $2 p$, the constants in the row and column sums can be bounded by a constant depending only on $d$, for each fixed $p$ and large $n$.]
] <lem:early-interpolation>

#proof[
  For $t lt.eq 2$, the second moment and Hölder’s inequality give $C n^(- beta t \/ 2)$. For $2 < t < p$, interpolation gives
  $ \( n^(- beta) \)^(\( p - t \) \/ \( p - 2 \)) M^(\( t - 2 \) \/ \( p - 2 \)) . $
  The exponent of $M$ is at most $t \/ p$. Absorb fixed constants by halving the positive exponent of $n$, proving (5.17). For the kernel inequality, apply Hölder to the measure with density $K$: its mass, $f$ integral, and $g$ integral are at most $b$, $b integral f$, and $b integral g$. For the stated kernel, its row sum is bounded by the squared row bound and the bounded entry sup. The column sum for $k = 2$ is polylogarithmic by (4.8); for $k gt.eq 3$ it is bounded. Since $\| X \| gt.eq c_d l$, this proves the marginal claim. Finally Lemma 9 bounds the relevant large-power column sums uniformly in the fixed order, and the squared row bound gives $C_d \( 1 + o \( 1 \) \)^(k - 2)$ for row sums. With $k$ fixed, this is at most $2 C_d$ for large $n$. ◻
]

#thm([Lemma 5.10.])[
  (Linearization and its residual).  #emph[For every surviving output pair, decompose its actual increment as $Delta E_(i j) = B_e cal(L)_(i j) + cal(N)_(i j)$, where $cal(L)$ is linear in $z$ and evaluated on the old output vectors. The residual contains the nonlinear terms, the formal tail, and the recentering of surviving stub outputs. It has sup 
$ \| cal(N)_(i j) \| lt.eq C \( d_m^2 + B_(upright("tail")) + d_m \/ l \) $

 and conditional second moment 
#[#set math.equation(numbering: n => "(5.18)")
 $ bb(E) \| cal(N)_(i j) \|^2 lt.eq C \( n^eta \/ l^2 + d_m^4 \/ l \) . $ <eq:original-29>]

 The leading terms of $cal(L)_(i j)$, up to their signs, are 
#[#set math.equation(numbering: n => "(5.19)")
 $ h p_i \( u \) z_(v j) \, quad h p_i \( v \) z_(u j) \, quad h p_j \( u \) z_(i v) \, quad h p_j \( v \) z_(i u) \, $ <eq:original-30>]

 and 
#[#set math.equation(numbering: n => "(5.20)")
 $ h^2 p_i \( s \) p_j \( t \) z_(macron(s) macron(t)) \, #h(2em) s \, t in { u \, v } . $ <eq:original-31>]

 All other coefficients have sup bounded by a fixed negative power of $n$. A diagonal coefficient of $H_P$ satisfies, with its first endpoint $s$ fixed, 
#[#set math.equation(numbering: n => "(5.21)")
 $ bb(E)_(macron(s)) #scale(x: 120%, y: 120%)[\[] \| \( H_P \)_(s s) \|^k upright(bold(1))_(upright("valid")) #scale(x: 120%, y: 120%)[\]] lt.eq C_p n^eta n^(- c'_0 \( k - 2 \)) \/ l \, #h(2em) 2 lt.eq k lt.eq p \, $ <eq:original-32>]

 where the expectation may also omit boundedly many output labels.]
] <lem:early-linearization>

#proof[
  Put $T_P = I - P U H_P U^T$. The exact inverse-update difference identity is
  $ \( W - cal(Q) \( W \) \) - \( P - cal(Q) \( P \) \) = T_P \( E - E U H_W U^T E \) T_P^T . $
  It follows either by multiplying the two inverse-update formulas or by using $H_W - H_P = - H_P \( U^T E U \) H_W$. Thus the linear old-axis increment is $T_P E T_P^T - E$. Replacing $H_P$ by $- sigma h F$ gives (5.19) and (5.20). The difference $H_P + sigma h F$ is power-small by (4.6) and its geometric series. The leftover one-axis forms are $p_i \( s \) z_(t j)$ and their transposes; the two-axis forms are $p_i \( s \) p_j \( t \) z_(c d)$, with coefficient $\( H_P \)_(s c) \( H_P \)_(d t)$ minus its pure-swap value.
  The nonlinear term is $- T_P E U H_W U^T E T_P^T$, whose entries have sup $C d_m^2$. Its complete second-moment classification is as follows. Distinct outer endpoints use two squared rows and cost $C \/ l^2$. Same-end words with two intermediate $E$ factors cost $C d_m^4 \/ l$. If one intermediate and one outer are $E$, use $sum_s \| e_i \( s \) \|^2 r_j \( s \)^2 lt.eq C d_m^2$ and the second $E$ bound to get the same estimate. If both $E$’s are outer factors and no intermediate $E$ occurs, a same-end word has either a non-pure swap or an opposite local/cross-topology factor; its second moment is at most $C n^eta \/ l^2$ by the averaging table. These are all possible placements of at least two $E$’s in Lemma 15. For a tail word there are no $E$’s: distinct-end words cost $C \/ l^2$, and same-end words have the non-pure or opposite-topology factor and cost $C n^eta \/ l^2$. Recentring has squared sup $C d_m^2 \/ l^2$. The geometric Minkowski bound now proves (5.18); the sup claim follows also from (4.7).
  For (5.21), follow the first pure swap in the $\( s \, s \)$ entry of $H_P$. By Lemma 15, either a non-pure swap occurs, or a local factor at $macron(s)$, or a cross factor occurs. Hence
  $ \| \( H_P \)_(s s) \| lt.eq C \( 1 \/ l + j_(macron(s)) + b_(s macron(s)) \) . $
  Its conditional second moment is $C n^eta \/ l$; its sup is $n^(- c'_0)$. Multiply the second-moment bound by the $\( k - 2 \)$-th power of this sup. Omitting a bounded number of partners only changes the bounded density constant. ◻
]

#thm([Lemma 5.11.])[
  (High moments).  #emph[There is a constant $C_(*)$, independent of every sufficiently large even order $p$, with the following property. After $p$ is fixed, one may choose a fixed $kappa_p > 0$, a fixed near radius $R_c$, and sufficiently small structural and low-square losses such that 
#[#set math.equation(numbering: n => "(5.22)")
 $ Z_p = 1 + F_p + kappa_p D_p^(upright("mom")) \, #h(2em) bb(E) Z'_p lt.eq \( 1 + C_(*) \/ l + u_l \) Z_p \, #h(2em) sum_l u_l = o \( 1 \) \, $ <eq:original-33>]

 with nonnegative deterministic upper budgets $u_l$ under the bootstrap assumptions.]
] <lem:early-high-moments>

#proof[
  We separate mixed powers from pure powers. The low-square estimates and interpolation make every mixed contribution a power-small multiple of $M_p \/ l$, whose sum is small. Pure powers can transfer pair moments to diagonal moments at rate $C_p F_p \/ l$; their reverse transfer has the smaller rate $C_p D_p^(upright("mom")) \/ l^2$. Weighting the diagonal family by $kappa_p$ makes the first coefficient bounded when $kappa_p C_p lt.eq 1$, while the reverse coefficient $C_p \/ \( kappa_p l^2 \)$ remains summable for fixed $p$. Thus we must bound each family’s own $1 \/ l$ drift independently of $p$, and verify these two transfer rates. A fixed threshold on the outer path entries will distinguish the pure powers that need this uniform bound from terms that gain a small factor. All expectations of nonnegative quantities below may be taken over independent uniform endpoints, losing a bounded density factor. For signed first-order terms we retain the survival-conditional mean (5.11). Throughout this proof constants marked $C_p$ may depend on $p$, whereas $C_0 \, C_1$ do not.
  #emph[First-order and residual terms.] In the even-power Taylor formula, the first-order term has absolute mean at most $p \( mu_l \/ B_e \) \| z_(i j) \|^(p - 1)$. The sum $sum_l mu_l \/ B_e$ tends to zero by a power. Write $r_(i j) = cal(N)_(i j) \/ B_e$. Its sup is a fixed negative power of $n$. For $2 lt.eq k lt.eq p$,
  $ \| z_(i j) \|^(p - k) bb(E) \| r_(i j) \|^k lt.eq C \( 1 + \| z_(i j) \|^p \) frac(n^eta \/ l^2 + d_m^4 \/ l, B_e^2) . $
  The sum of the displayed coefficient tends to zero. For $k < p$, finite-term splitting costs only $C_p$. For $k = p$, use $\| a + b \|^p lt.eq 2 \| a \|^p + C_p \| b \|^p$ when separating the retained linear part from the residual. This incurs a factor 2, independent of $p$, on the retained part.
  #emph[Intermediate powers of linear terms.] Fix $2 lt.eq k < p$. The minimum of the positive interpolation exponents in (5.17), for the finitely many powers used below, is positive. Choose the kernel loss $eta_0$ less than half this minimum. For the first term in (5.19), integrating $u$ uses $sum_u \| p_i \( u \) \|^k lt.eq C_p$, producing $C_p \/ l$. For fixed $j$, interpolation in the free $v$ row gives
  $ bb(E)_v \| z_(v j) \|^k lt.eq n^(- delta) \( 1 + R_j \)^(k \/ p) \, #h(2em) R_j = bb(E)_v \| z_(v j) \|^p . $
  Hölder in the remaining output indices bounds the result by $C_p n^(- delta) M_p \/ l$. This derivation covers each of the four orientations and also diagonal outputs $j = i$.
  For (5.20) with $s = t$, discard one bounded outer factor. Integration of the other outer over $s$ gives $C_p \/ l$, and interpolation in the independent diagonal input $z_(macron(s) macron(s))$ gives the power saving. If $s eq.not t$, retain $\| p_i \( s \) \|^k$ and discard the other bounded outer. Interpolation over $t$, conditional on $s$, yields $n^(- delta) \( 1 + R_s \)^(k \/ p)$. Average the output factor first over $j$, and apply the kernel inequality in Lemma 19 to $\( i \, s \)$, with exponents $\( p - k \) \/ p$ and $k \/ p$. The cost is $C_p n^(eta_0 - delta) M_p \/ l$. For a diagonal output, use $\| z_(i i) \|^p$ instead of its output-row average in that kernel inequality. This proves the same bound.
  A leftover one-axis term whose input endpoint differs from its outer endpoint uses the preceding one-axis calculation. If these endpoints coincide, its coefficient is $\( H_P \)_(s s)$; integrate the other selected endpoint first by (5.21), then use the row interpolation in $z_(s j)$. Here the structural loss $eta$ is chosen below the interpolation saving, including when $k = 2$ in (5.21). For a leftover two-axis term retain the outer at $s$. If its input is $z_(s s)$, the coefficient includes $\( H_P \)_(s s)$, so (5.21) and diagonal interpolation apply after discarding the bounded outers. An input $z_(macron(s) macron(s))$ uses independent diagonal interpolation; an off-diagonal input uses the kernel argument just given. These three input types exhaust ${ u \, v }^2$. Thus every intermediate Taylor power costs $C_p n^(- delta_p) M_p \/ l$ for some $delta_p > 0$.
  #emph[Pure powers for independent output pairs.] The two-axis pure powers can be charged at once:
  $ bb(E)_(i \, j \, u \, v) \| p_i \( s \) p_j \( t \) z_(c d) \|^p lt.eq frac(C_p, \| X \| \| Y \|) bb(E)_(u \, v) \| z_(c d) \|^p lt.eq C_p M_p \/ l^2 . $
  This holds also for diagonal inputs $c = d$, because the outputs $i \, j$ remain independent. The leftover one-axis pure powers have either the pointwise power-small coefficient and a row integration, or (5.21) when input and outer endpoints coincide. Hence they cost a power-small multiple of $M_p \/ l$.
  It remains to sum the leading one-axis terms without multiplying all their pure powers by $C_p$. Choose a fixed threshold $epsilon_p > 0$. The sum of terms with $\| p_i \( u \) \| lt.eq epsilon_p$ has pure moment at most
  $ C_p epsilon_p^(p - 2) F_p \/ l . $
  This follows from $\| p_i \( u \) \|^p upright(bold(1))_(\| p_i \( u \) \| lt.eq epsilon_p) lt.eq epsilon_p^(p - 2) \| p_i \( u \) \|^2$ and the row-sum bound. The threshold will be chosen last to make this coefficient as small as required. Every outer above the threshold is at actual distance at most a fixed $R_c = R_c \( p \, d \)$ from its selected endpoint, by the short-path and long-entry estimates in Lemma 9. For sufficiently large $n$, $g_0 > 2 R_c$, so an output axis has at most one such endpoint.
  If both output axes have large outers at the same endpoint, say $u$, the corresponding pure powers have an extra $1 \/ l$ gain even after a $C_p$ splitting. To see it for $p_i \( u \) z_(v j)$, sum $\| p_i \( u \) \|^p$ over $i$, using its bounded column sum. Each $j$ has only $C_(R_c \, d)$ stubs $u$ in its near ball. Therefore
  $ bb(E)_(i \, j \, u \, v) #scale(x: 120%, y: 120%)[\[] \| p_i \( u \) z_(v j) \|^p upright(bold(1))_(j upright(" near ") u) #scale(x: 120%, y: 120%)[\]] lt.eq C_p Phi_(S Y) \/ \( \| X \| l \) lt.eq C_p F_p \/ l^2 . $
  This calculation remains valid when several unresolved stubs have the same vertex; there are at most $d$ such labels.
  If the two large outers occur at opposite endpoints, there are at most two retained terms. Expand their $p$-th power, keeping both pure summands with coefficient 1. Each mixed term has positive powers $t \, p - t$, with $0 < t < p$, and is at most
  $ C_p / l^2 (integral \| z_(i u) \|^(p - t) thin d mu_X) (integral \| z_(j v) \|^t thin d mu_Y) . $
  By (5.17) and the near-pair bounds, this is at most $C_p n^(- delta_p) \( 1 + F_p \) \/ l$. A single large term has no mixed powers. Finally the pure powers of all retained one-axis terms satisfy
  $ bb(E) sum_(upright("orientations")) \| h p_i \( u \) z_(v j) \|^p lt.eq C_0 h^p F_p \/ l . $
  Here $C_0$ is independent of $p$: there are only four orientations and four output types, their squared row constants depend only on $d$, and their row $p$-sums are bounded by $C_d \( 1 + o \( 1 \) \)^(p - 2) lt.eq 2 C_d$ for each fixed $p$ and large $n$. The Young splittings separate a number of groups independent of $p$ and retain the principal part with only fixed relative factors (at most 2 per splitting), and conditioning costs a bounded density factor, not a $p$-th power. Thus these operations only enlarge $C_0$ by a constant independent of $p$.
  #emph[Pure powers for diagonal outputs.] For a diagonal $i = j$, an above-threshold orientation, say at $u$, has retained terms
  $ A = 2 sigma h p_i \( u \) z_(v i) \, #h(2em) B = h^2 p_i \( u \)^2 z_(v v) . $
  Their pure powers obey
  $ bb(E) \| A \|^p lt.eq C_p F_p \/ l \, #h(2em) bb(E) \| B \|^p lt.eq C_0 h^(2 p) D_p^(upright("mom")) \/ l . $
  The first is explicitly a pair-to-diagonal transfer. The second uses a row $2 p$-sum with a constant independent of the fixed order, as above. For a mixed power $\| A \|^t \| B \|^(p - t)$, first sum over $u$; the outer power is $2 p - t gt.eq p + 1$, so that sum contributes $C_p \/ l$. Interpolate over $i$ at fixed $v$ in the positive power $\| z_(v i) \|^t$, and then apply Hölder in $v$ against $\| z_(v v) \|^(p - t)$. This gives $C_p n^(- delta_p) M_p \/ l$.
  The other diagonal two-axis term has off-diagonal input $z_(u v)$. At least one of its two outer factors is below the threshold. Keep the other column $p$-power and sum it over $i$; this costs $C_p epsilon_p^p Phi_(S S) \/ l$. A below-threshold same-end diagonal input costs $C_p epsilon_p^(2 p - 2) D_p^(upright("mom")) \/ l$. Below-threshold one-axis terms cost $C_p epsilon_p^(p - 2) F_p \/ l$. For a leftover diagonal one-axis term $a_(s t) p_i \( s \) z_(t i)$, distinguish its input endpoint. If $t = s$, its coefficient is $a_(s s) = \( H_P \)_(s s)$. Average the opposite selected endpoint first using (5.21), discard the bounded outer factor, and then average $\( i \, s \)$. This gives
  $ bb(E) \| a_(s s) p_i \( s \) z_(s i) \|^p lt.eq frac(C_p n^(eta - c'_0 \( p - 2 \)), l) Phi_(S X) . $
  If $t = macron(s)$, the leftover coefficient has sup $n^(- c)$ for some fixed $c > 0$. At fixed $i$, sum the row $p$-power $\| p_i \( s \) \|^p$ over $s$, obtaining
  $ bb(E) \| a_(s macron(s)) p_i \( s \) z_(macron(s) i) \|^p lt.eq frac(C_p n^(- c p), l) Phi_(S X) . $
  For a leftover two-axis term, the input $z_(c d)$ is independent of the output $i$. Discard one bounded outer factor and sum the other column $p$-power over $i$, which gives $C_p n^(- c p) \( F_p + D_p^(upright("mom")) \) \/ l$. For sufficiently large fixed $p$ and sufficiently small losses, all these bounds are $C_p n^(- delta_p) M_p \/ l$. Thus every diagonal pure-power term has now been accounted for.
  #emph[Combining pair and diagonal moments.] Collecting the self-drift, the two transfers between moment families, and the summable errors gives, for a fixed $C_1$,
  $ bb(E) F'_p & lt.eq (1 + frac(C_1 + C_0 h^p + epsilon.alt, l)) F_p + C_p / l^2 D_p^(upright("mom")) + v_l M_p \,\
bb(E) \( D_p^(upright("mom")) \)' & lt.eq (1 + frac(C_1 + C_0 h^(2 p) + epsilon.alt, l)) D_p^(upright("mom")) + C_p / l F_p + v_l M_p \, $
  where $epsilon.alt > 0$ is any prescribed constant after the threshold is chosen, and $sum_l v_l = o \( 1 \)$. To obtain $v_l$, sum the first-order and residual budgets and the terms $C_p n^(- delta_p) \/ l$; all have summably small totals. The coefficient of the nonsummable transfer $C_p F_p \/ l$ depends only on $p \, d$ and the uniform row bounds. Constants depending on the resulting near radius $R_c$ occur only with $l^(- 2)$ or with the power saving $n^(- delta_p) \/ l$, and are included in $v_l$. The change of a denominator $\| S \|$ to $\| S \| - 2$ contributes at most $1 + C_1 \/ l$, with $C_1$ independent of $p$. Deletion of labels only lowers their unnormalized moment sums.
  Choose $p_0$ so large that $C_0 q^(- p_0 \/ 2) lt.eq 1$. For each even $p gt.eq p_0$, choose $0 < kappa_p lt.eq min \( 1 \, \( 1 + C_p \)^(- 1) \)$, then choose the threshold so that $epsilon.alt lt.eq 1$. Since $h lt.eq q^(- 1 \/ 2)$, multiplication of the second inequality by $kappa_p$ and addition give (5.22) with, for example, $C_(*) = C_1 + 4$. The reverse leakage $C_p D_p^(upright("mom")) \/ l^2$ costs $C_p \/ \( kappa_p l^2 \)$ in the multiplier and has sum $o \( 1 \)$. The multiplier from $v_l M_p$ is at most a fixed $C_p kappa_p^(- 1) v_l$, whose sum also tends to zero. This proves the required independence of $C_(*)$ from $p$. ◻
]

#proof[
  At the empty state the accounts have the asserted initial values. Assume their conclusions at the current state. Each stub has at most $D_g = O_d \( q^(g_0) \) = o \( l_0 \)$ forbidden partners, so $l - 1 - D_g > 0$ throughout this phase and the candidate set is nonempty. The deterministic implications (4.9)–(4.12) give the row, trace, and operator estimates used in the transition lemmas. Every available pair is small in its two-by-two deviation, so its next precision is positive by the inverse-update inertia argument. The structural accounts, Lemma 14, Lemma 18, and Lemma 21 can therefore be included in the same discounted total.
  The high-moment discount loss is at most $n^(C_(*) + 1)$ for large $n$ since $sum_l l^(- 1) = O \( log n \)$. Extraction of one entry from a uniform pair average costs at most $d^2 n^2$, and from a diagonal average costs less. Fixed $kappa_p^(- 1)$ is harmless. Choose the even order $p$ large enough that $\( C_(*) + 4 \) \/ p < .02 a$. Then the discounted total and (5.22) imply $max \| E_(i j) \| < B_e n^(.02 a) = d_m$, with a positive power of slack. The trace and low-square accounts have their own exponent cushions. Thus account extraction implies the required bounds at the chosen next state, closing the induction.
  There is no reverse dependence in these choices. First fix a sufficiently large even $p$ using the order-independent $C_(*)$; then choose $kappa_p$, the threshold and its finite $R_c$; then decrease the structural and low-square losses for the finitely many interpolations and near-radius inductions. Their constants can grow but remain independent of $n$. This proves the proposition. ◻
]

== 6 Cleanup of the unresolved boundary <sec:cleanup>

The early phase leaves fewer than $b$ bad stubs. The separation construction in Lemma 7 resolves them in $b$ steps, from $l_1 = l_0 + 2 b$ unresolved stubs to $l_0$. We now prove that this cleanup also preserves the analytic estimates needed for boundary completion.

Fix an order for the initially bad stubs and use them as first endpoints. After they are resolved, take the first still-surviving stub in a fixed order. At each step the first endpoint $u$ is prescribed and the second endpoint $v$ is uniform among the eligible surviving initially clean stubs. Different steps use distinct first stubs. The eligible set omits only $O \( b \)$ currently unresolved stubs, and every resulting pair satisfies the distance and simplicity requirements of Lemma 7.

The prescribed endpoint changes the analytic argument: a two-endpoint average is no longer available. Instead, sums along the distinct first endpoints will be bounded by path sums in the graph at the end of the already chosen history. This gives the cumulative estimates needed by the account rule.

Write $f_b = b \/ l_0$. The parameter choices give

#[#set math.equation(numbering: n => "(6.1)")
 $ f_b = o \( 1 \) \, #h(2em) b^(3 \/ 2) \/ l_0 = o \( 1 \) \, #h(2em) f_b sqrt(l_0) asymp n^(.27 a) \,\
f_b n^eta q^(L \/ 2) = o \( 1 \) \, #h(2em) f_b n^(v_(*)) \/ alpha_(*) = o \( 1 \) \, #h(2em) alpha_(*) sqrt(l_0) asymp n^(.575 a) . $ <eq:original-35>]

Whenever a small loss $n^eta$ occurs in this section, its exponent may be prescribed in advance: the structural and preceding-phase losses are first chosen sufficiently smaller. There are only finitely many uses of this convention.

For an output label $i$, assign a level $nu \( i \)$: level $2$ for a global vertex coordinate, level $1$ for an initially bad stub, and level $0$ for an initially clean stub. A stub label is used only while it survives. The total level of an entry $E_(i j)$ is $nu \( i \) + nu \( j \)$. Set

$ B_c = n^(.35 a) / sqrt(l_0) \, #h(2em) B_k = B_c n^(4 k rho) quad \( 0 lt.eq k lt.eq 4 \) \, #h(2em) B_m = 2 B_4 . $

Choose $rho > 0$ sufficiently small that $B_m lt.eq n^(.37 a) \/ sqrt(l_0)$ for all sufficiently large $n$. The bootstrap bound for an entry of total level $k$ is $2 B_k$. The small increase in scale between successive levels will pay for transfers from a global coordinate to a stub, or from a bad stub to a clean stub, in the inverse update. All primary and auxiliary values of $h$, and both signs, remain in use.

#thm([Proposition 6.1.])[
  (Cleanup estimates).  #emph[Assume the early-phase estimates at $l_1$, and maintain the structural estimators during cleanup. With the simultaneous discounted-account choice rule, the cleanup interval can be completed so that, at every chosen state, the precision matrices remain positive definite, (4.9) holds, and 
$ T_S = sum_(x in S) e_x \( x \)^2 lt.eq n^eta \, #h(2em) \| E_(i j) \| lt.eq 2 B_k . $

 The second inequality holds for every surviving pair $\( i \, j \)$ of total level $k = nu \( i \) + nu \( j \)$. At primary points the lower estimate for $cal(T)$ persists in the form 
$ cal(T) gt.eq n^(- theta) \( n^(- 1) + alpha \/ l \)^(- 1) . $

 In particular the consequences (4.10) and (4.11), and a polynomial-loss form of (5.1), hold at $l_0$.]
] <prop:cleanup>

The proof has three parts. First we establish pathwise summation bounds and preserve the scalar traces. Next we classify the inverse-update terms and control the surviving diagonal-square sum $T_S$. Finally we bound individual entry increments and extract all estimates simultaneously. Each one-step estimate assumes only the current bootstrap bounds. Throughout the proof, $l asymp l_0$; in cumulative upper bounds it is therefore harmless to replace $l$ by $l_0$.

=== 6.1 Majorants along a chosen history <majorants-along-a-chosen-history>

We retain the absolute path and endpoint majorants $A_i \( x \) \, j_x \, b_(x y)$ of Lemma 8. Define

$ r_i \( x \) = A_i \( x \) + \| e_i \( x \) \| \, #h(2em) Q_a = n^eta q^(L \/ 2) . $

On current stub coordinates the arrays $r_x \( y \)$ may be taken symmetric. Their row and column squared sums are bounded, since this is true for $A$, $P$, and $W$. Consequently the symmetric nonnegative matrix $\( r_x \( y \)^2 \)_(x \, y in S)$ has bounded operator norm: its row sums are bounded, and the same is true of its column sums.

#thm([Lemma 6.2.])[
  (Pathwise summation).  #emph[Fix any chosen cleanup history up to its current state, and fix a label $i$ while it is alive. With $u_t$ the prescribed first endpoint of step $t$, one has 
#[#set math.equation(numbering: n => "(6.2)")
 $ sum_t A_i^t \( u_t \)^2 lt.eq n^eta \, #h(2em) sum_t \( j_(u_t)^t \)^2 lt.eq n^eta . $ <eq:original-36>]

 The first estimate also holds with $A_i^t \( u_t \)$ replaced by $r_i^t \( u_t \)$. For every fixed initial stub $v$, whether or not it has already been resolved, the actual-path part of $b_(u_t v)^t$ satisfies the same squared-sum estimate over $t$.]
] <lem:cleanup-pathwise>

#proof[
  Let $G_(*)$ be the actual graph at the last state of the history segment. Every actual path present earlier is present in $G_(*)$. The first endpoints are distinct initial stubs, and at most $d$ such stubs lie at one vertex. Thus it suffices to bound an absolute weighted path row to all vertices of $G_(*)$. In particular, the target stub need not remain unresolved in $G_(*)$. At a fixed length $k < L$, the total number of paths is at most $C q^k$ and their fixed-endpoint multiplicity is bounded. Since $h^(2 k) lt.eq q^(- k)$, the squared sum of the weighted row at that length is bounded. Cauchy–Schwarz over the $O \( log n \)$ lengths gives a polylogarithmic bound for the total row. This argument also applies with a fixed stub vertex as the starting point and the distinct $u_t$ as targets.
  The nonempty-return squared-sum estimate follows in the same way from the global return-square diagram bound in $G_(*)$. Each uniform or centering contribution is at most $n^(eta_0) q^(L \/ 2) \/ l_0$, with a preliminary loss $eta_0$. Even summing its square over all $l_1$ initial stubs gives
  $ O #h(-0.16667em) (n^(2 eta_0) q^L \/ l_0) = o \( 1 \) . $
  Finally, $sum_t \| e_i^t \( u_t \) \|^2 lt.eq b B_m^2 = o \( 1 \)$ under the entry bootstrap. Choosing $eta_0$ small enough proves all the assertions. ◻
]

In particular, Cauchy–Schwarz gives

$ sum_t r_i^t \( u_t \) lt.eq n^eta sqrt(b) \, #h(2em) sum_t j_(u_t)^t lt.eq n^eta sqrt(b) \, #h(2em) sum_t r_i^t \( u_t \) j_(u_t)^t lt.eq n^eta . $

The same bounds apply to every prefix ending at the current chosen state. They will control the accumulated discounts of the entry accounts, although the distribution at each step averages only the second endpoint. No future completion is used.

=== 6.2 Trace errors and the lower trace bound <trace-errors-and-the-lower-trace-bound>

#thm([Lemma 6.3.])[
  (Persistence of scalar estimates).  #emph[At a current cleanup state, assume positive definiteness and (4.9) at every tracked point for both signs, together with the level-dependent entry and $T_S$ bootstrap bounds. The trace-square accounts at all tracked points and the $cal(T)$-deviation accounts at the primaries have bounded discount loss at scales strictly inside the corresponding bounds of Proposition 22.]
] <lem:cleanup-traces>

#proof[
  We keep the trace errors $L_1 = F_1 - \( l - 1 \)$ and $L_0 = F_0 - \( n - 1 \)$ at the intermediate scales
  $ S_1 = n^(.085 a) \/ alpha_(*) \, #h(2em) S_0 = n^(.115 a) \/ alpha_(*)^2 . $
  At each primary, we reinitialize $cal(T)$ with its deviation from its value at $l_1$, rather than continue the reciprocal account used in the early phase. As in the trace calculation there, $K \, Q \, J$ denote the current pair blocks of $K_(upright("all")) \, Q_(upright("all")) \, Gamma Q_(upright("all"))$.
  #emph[The stub trace $L_1$.] In the expansion (5.3), the signed conditional mean of all terms other than the ideal term $- "Tr" H_0 K$ is bounded in absolute value by
  $ C (j_u + B_m + n^eta / sqrt(l) + 1 / l) . $
  Here the bounds (5.2) control the endpoint factors, and averaging the random endpoint uses the row cross norms and $T_S$. Its cumulative bound is
  $ C (n^eta sqrt(b) + b B_m + frac(n^eta b, sqrt(l_0)) + f_b) . $
  For the pure-swap cross term, the full partner sum cancels by centering when the artificial partner $v = u$ is included. The full coefficient $H_0$ has a finite-size remainder. More precisely, since $H_0 = - sigma h \( F + J_2 \/ \( l - 2 \) \)$, uniform averaging over the distinct partners gives
  $ bb(E)_(v eq.not u) \[ - "Tr" \( H_0 K \) \] = sigma h frac("Tr" K_(upright("all")) - l K_(u u), \( l - 1 \) \( l - 2 \)) . $
  Here $sum_v \( K_(upright("all")) \)_(u v) = 0$ was used. The remainder is $O \( 1 \/ l \)$ because all diagonal entries of $K_(upright("all"))$ are bounded. For the actual eligible set $I$, its complement has $O \( b \)$ stubs, and
  $ parallel \( K_(upright("all")) \)_(u \, *) parallel_2 lt.eq C n^(v_(*)) \/ alpha . $
  Indeed $K_(u u) lt.eq C$, and the operator bound for the relevant positive Gram matrix controls its row norm. The centered cross sum over $I$ is the negative omitted-row sum. Cauchy–Schwarz bounds this sum, while the non-pure diagonal contribution is $O \( 1 \/ l \)$ directly. Thus the absolute signed mean is at most
  $ C (frac(sqrt(b) thin n^(v_(*)), alpha l) + 1 / l) . $
  The sum of conditional second moments is at most
  $ C (b + f_b n^(2 v_(*)) / alpha^2) . $
  All these mean bounds divided by $S_1$, and all second-moment bounds divided by $S_1^2$, tend to zero by a fixed power of $n$.
  #emph[The global trace $L_0$.] For $L_0$, the nonideal mean bound above acquires a factor $C \/ alpha$. The ideal $Q$ row has norm at most $C n^(v_(*)) \/ alpha^2$, by (4.12) and $Q_(u u) lt.eq C \/ alpha$. The same fixed-endpoint calculation has finite-size remainder $C \/ \( alpha l \)$, and omitted-row contribution $C sqrt(b) thin n^(v_(*)) \/ \( alpha^2 l \)$. The corresponding cumulative second-moment bound is
  $ C (b / alpha^2 + f_b n^(2 v_(*)) / alpha^4) . $
  Division by $S_0$ and $S_0^2$ gives the same power savings for the mean and second-moment budgets. For extraction, if a scalar increment has signed mean bounded by $mu_t$ and second moment bounded by $nu_t$, the account $1 + L^2 \/ S^2$ has expectation factor at most $1 + 2 mu_t \/ S + nu_t \/ S^2$, using $\| L \| \/ S lt.eq 1 + L^2 \/ S^2$. The pathwise sums just established therefore give bounded discount loss. The gaps from $.085 a$ to $.09 a$ and from $.115 a$ to $.12 a$ accommodate the total-account extraction factor. Initial trace values satisfy the smaller early-phase bounds.
  #emph[The lower bound for $cal(T)$.] We now control $cal(T) - cal(T) \( l_1 \)$. By (5.1), a uniform lower comparison scale at a primary is
  $ T_min asymp n^(- theta \/ 2) l_0 \/ alpha . $
  This comparison uses $alpha n \/ l_0 arrow.r oo$, uniformly over the primary points. In (5.7), the non-$J$ terms cost at most $C \/ alpha$ per step. For the ideal $J$ term, the relevant row and column norms are at most $C n^(2 v_(*)) \/ alpha^3$, its entries are at most $C n^(v_(*)) \/ alpha^2$, and its full sums are centered. Thus its cumulative absolute signed-mean bound and second-moment bound are, respectively,
  $ C (frac(n^(2 v_(*)) b^(3 \/ 2), alpha^3 l_0) + frac(n^(v_(*)) b, alpha^2 l_0)) \, #h(2em) C (f_b n^(4 v_(*)) / alpha^6 + frac(b n^(2 v_(*)), alpha^4 l_0^2)) . $
  The nonideal $J$ coefficient is bounded using $j_u + B_m + \| D_(v v) \| + \| D_(u v) \|$. Its cumulative mean is at most
  $ frac(C n^(v_(*)), alpha^2) (n^eta sqrt(b) + b B_m + frac(n^eta b, sqrt(l_0))) \, $
  and the crude cumulative second bound $C b n^(2 v_(*)) \/ alpha^4$ suffices. Dividing the means by $T_min$ and the seconds by $T_min^2$ gives fixed power savings. One of the potentially tight ratios is bounded by
  $ C frac(b^(3 \/ 2) n^(2 v_(*) + theta), l_0^2 alpha_(*)^2) = o \( 1 \) . $
  Choose a small fixed $kappa > 0$ and apply the deviation-square account at scale $n^(- kappa) T_min$, taking $kappa$ smaller than the established margins. Its initial deviation is zero, its discount loss is bounded, and its extracted deviation is $o \( T_min \)$. This proves the stated lower bound, with the additional $n^(- theta \/ 2)$ cushion. All conclusions are uniform on their stated parameter sets: the trace-error estimates hold at every tracked point, and the lower bound for $cal(T)$ holds at the primaries. ◻
]

=== 6.3 Classification of update terms <classification-of-update-terms>

The entry expansion used in the early phase must now be grouped for one prescribed endpoint. We will use this grouping both for $T_S$ and for individual entries. For the current pair, write

$ T = U^T P U - G_0 \, #h(2em) E_(upright("pair")) = U^T E U \,\
H_P = \( H_0^(- 1) + T \)^(- 1) \, #h(2em) H_0 = - sigma h F + R \, quad parallel R parallel lt.eq C \/ l . $

Thus $H_P$ is the coefficient for the numerical update of the reference $P$, whereas $H$ uses the actual matrix $W$. Before recentering the output axes, the error increment is

$ Delta E = - \( W U H U^T W - P U H_P U^T P \) - cal(R)_P \, #h(2em) cal(R)_P = \[ P U H_P U^T P \]_(gt.eq L) . $

The brackets select the formal terms of degree at least $L$, as in (4.1). We call a diagonal entry of the reference deviation $T$ a local topology factor, and an off-diagonal entry a cross topology factor. Their absolute majorants are $j_u \, j_v$ and $b_(u v)$, respectively. The entries of $E_(upright("pair"))$ are bounded by $B_m$. On every valid pair $T$ and $E_(upright("pair"))$ are small, so the endpoint Neumann expansions converge absolutely and geometrically.

In each scalar term, the two outer entries are evaluated at selected endpoints. We call them #emph[two fixed outers] when both are at the prescribed endpoint $u$, #emph[two random outers] when both are at the averaged endpoint $v$, and #emph[distinct outers] when one is at each. This convention concerns the endpoint indices, whether an outer entry comes from $P$, $E$, or $W$.

#thm([Lemma 6.4.])[
  (Endpoint word classification).  #emph[After expansion of a numerical update difference and of its formal truncation tail, every term is covered by the following classes:]
  + #emph[a term containing a non-pure swap $R$, and hence a factor $C \/ l$;]
  + #emph[a pure-swap term with no intermediate endpoint factor;]
  + #emph[a pure-swap term with exactly one endpoint $E$ factor and no topology factor;]
  + #emph[a term with a cross topology factor $b_(u v)$;]
  + #emph[a pure-swap term with local topology factors only, and at most one endpoint $E$ factor;]
  + #emph[a term with at least two endpoint $E$ factors.]
  #emph[In class 3 the single endpoint $E$ factor may be grouped with $W$ outers. For class 5, if both outers are at $u$, an opposite local factor $j_v$ is necessary; the symmetric statement holds for two outers at $v$. If class 5 has no endpoint $E$ factor and has distinct outers, local factors at both endpoints are necessary. All remaining factors and choices of their positions can be summed with a bounded geometric multiplier.]
] <lem:cleanup-words>

#proof[
  Expand
  $ H = H_0 sum_(k gt.eq 0) #scale(x: 120%, y: 120%)[\(] - \( T + E_(upright("pair")) \) H_0 #scale(x: 120%, y: 120%)[\)]^k $
  and the analogous reference coefficient. Every factor is either a pure swap, a non-pure swap, a diagonal topology entry, a cross topology entry, or an endpoint $E$ entry. If a non-pure swap occurs, assign the word to class 1. Otherwise first separate the number of endpoint $E$ entries, and then whether any off-diagonal topology entry occurs. The listed classes cover all resulting cases. The terms with no endpoint or outer $E$ that cancel numerically leave precisely the formal tail; their endpoint classification is unchanged by restricting total degree.
  To see the useful grouping in class 3, first write the difference of the two numerical updates as outer differences with the reference coefficient, together with
  $ W U H_P E_(upright("pair")) H U^T W . $
  Replacing both coefficients in this expression by their pure-swap parts gives the asserted single-$E$ term with $W$ outers. The remainders contain topology, a non-pure swap, or a second endpoint $E$, and belong to the other classes.
  A pure swap changes $u$ to $v$ and $v$ to $u$. A local topology entry preserves its endpoint. If both outers are at $u$, the first and last intermediate positions of a pure-swap word are at $v$. With no endpoint $E$, the first such position supplies $j_v$. With one endpoint $E$ and at least one local topology entry, there are at least two intermediate positions, so at least one of the first and last positions is a local topology entry at $v$. With distinct outers and no endpoint $E$, a nonempty local-only word has at least two intermediate positions and visits both endpoints. This proves the locality assertions, including the cases in which the endpoint $E$ itself is off diagonal.
  Finally the uniform small bound for each endpoint error makes the absolute sum over additional factors geometric. Marking one or two factors of a specified type introduces at most a fixed power of the word length, still summable. The coefficientwise majorants used for the formal tail have the same property. Therefore all the estimates below can be proved for the displayed factors and then multiplied by a fixed constant. ◻
]

=== 6.4 The surviving diagonal-square statistic <the-surviving-diagonal-square-statistic>

Before treating the polynomially many individual entries, we retain an aggregate bound on their stub diagonals. It controls averages of an opposite-endpoint diagonal error; using only the entry supremum in those averages would lose the required margin.

For a step with prescribed endpoint $u$, let

$ m_x = bb(E) #scale(x: 120%, y: 120%)[\[] Delta e_x \( x \) upright(bold(1))_({ x upright(" survives") }) #scale(x: 120%, y: 120%)[\]] quad \( x eq.not u \) \, #h(2em) m_u = 0 \, $

and let $V_t = bb(E) sum_(x upright(" survives")) \( Delta e_x \( x \) \)^2$. Expanding the surviving squares, dropping the nonnegative deleted old squares, and applying Cauchy–Schwarz gives

#[#set math.equation(numbering: n => "(6.3)")
 $ bb(E) T'_S lt.eq T_S + 2 sqrt(T_S) thin parallel m parallel_2 + V_t . $ <eq:original-37>]

#thm([Lemma 6.5.])[
  (Cumulative diagonal-square budgets).  #emph[Under the cleanup bootstrap, through every chosen history segment, 
$ sum_t parallel m parallel_2 lt.eq n^eta \, #h(2em) sum_t V_t lt.eq n^eta + C f_b T_(upright("cap")) \, $

 where $T_(upright("cap"))$ is the chosen bootstrap cap for $T_S$.]
] <lem:cleanup-diagonal>

#proof[
  We first estimate the vector of signed means $m$, retaining the cancellations of the zero-intermediate and single-$E$ terms. We then bound $V_t$ by absolute squares.
  #emph[Survival and recentering.] We initially work on the old centered axes. If $x$ is an eligible partner, survival excludes the choice $v = x$. Inserting this value into the partner average and subsequently removing it changes its $x$th component by at most $C B_m \/ l$; an ineligible $x$ needs no such correction. There are $O \( l \)$ components, so the vector cost is $C B_m \/ sqrt(l)$ per step. The recentering formula $xi'_x = xi_x + \( xi_u + xi_v \) \/ \( l - 2 \)$ gives the same bound. The old-axis error after a candidate update is $O \( B_m \)$ by the convergent update expansion and the tail bound. Thus these corrections sum to $O \( b B_m \/ sqrt(l_0) \) = o \( 1 \)$.
  #emph[Signed means.] Let $I$ be the eligible partner set, and write a bar for its uniform average. Full sums of every centered $p$ or $e$ row vanish. The omitted set has size $O \( b \)$, so the pure-swap terms with no intermediate factor have the following vector bounds:
  $ parallel \( p_x \( u \) overline(e_x \( v \)) \)_x parallel_2 & lt.eq C b B_m \/ l \,\
parallel \( e_x \( u \) overline(e_x \( v \)) \)_x parallel_2 & lt.eq C b B_m \/ l \,\
parallel \( e_x \( u \) overline(p_x \( v \)) \)_x parallel_2 & lt.eq C B_m \( 1 + L \)^3 sqrt(b) \/ l . $
  The first two use the omitted-entry bound $B_m$ and bounded column norms. For the third, multiply the sum of omitted $P$ columns by the diagonal matrix with entries $e_x \( u \)$; its norm is at most $B_m$, while (4.8) bounds the norm of the column sum by $C \( 1 + L \)^3 sqrt(b)$.
  The pure $P$–$P$ zero-intermediate tail cancels over the full partner set coefficient by coefficient. For its omitted part, apply the same coefficient operator estimate to the omitted indicator vector, multiply by the bounded opposite outer entry, and sum the polynomially many degree choices. Its vector bound is $n^eta sqrt(b) \/ l$. Non-pure swaps contribute $C \/ l$ per step: the pointwise product of two fixed columns has bounded $ell^2$ norm, as does the averaged product. The cumulative costs just listed are small, using (6.1) and $b^2 B_m \/ l_0 = o \( 1 \)$.
  For the pure single endpoint $E$ term of Lemma 25, the two fixed outers give the vector $\( w_x \( u \)^2 \)_x$ times $overline(e_v \( v \))$. Its norm is bounded, and
  $ \| overline(e_v \( v \)) \| lt.eq C frac(\| Y_E \| + sqrt(b T_S), l) \, #h(2em) Y_E = "Tr" \( Xi^T E Xi \) . $
  The omitted diagonal sum was bounded by Cauchy–Schwarz. For two random outers the averaged-square vector has norm $C \/ sqrt(l)$, and its scalar factor is $e_u \( u \)$. With distinct outers, the average row dot against the $u$th row of $E$ is $O \( 1 \/ l \)$; multiplication by the bounded-norm fixed column gives a vector bound $C \/ l$. These contributions sum to small quantities, since
  $ \| Y_E \| lt.eq n^(.09 a) \/ alpha_(*) + Q_a \, #h(2em) f_b Q_a = o \( 1 \) \, #h(2em) b^(3 \/ 2) sqrt(T_(upright("cap"))) \/ l_0 = o \( 1 \) . $
  It remains to bound the absolute-mean classes. With a cross topology factor, two fixed outers cost $C Q_a \/ l$: use the $ell^1$ bound on the $u$th cross row and the bounded norm of the squared outer column. Two random outers cost $C \/ l$: apply the bounded operator $\( r_x \( v \)^2 \)_(x v)$ to the bounded-norm cross row $\( b_(u v) \)_v$, and divide by $\| I \| asymp l$. Distinct outers also cost $C \/ l$, by taking the row dot at the random endpoint before the fixed-column norm.
  For local-only topology, two fixed outers require $j_v$ and therefore cost $C Q_a \/ l$. Two random outers require $j_u$ and cost $C j_u \/ sqrt(l)$. With distinct outers and no endpoint $E$, both endpoint local factors occur; bound the random factor and use the $ell^1$ bound $C sqrt(l)$ for its outer row, obtaining $C j_u \/ sqrt(l)$. With exactly one endpoint $E$ and local topology, the same-outer cases still contain the opposite local factor, while the distinct case is bounded by $C B_m \/ sqrt(l)$. Two endpoint $E$ factors cost $C B_m^2$ per step. These cases are exhaustive by Lemma 25; outer $E$ choices are already included in $r$. Their sums are bounded by $n^eta$, using Lemma 23, $b B_m^2 = o \( 1 \)$, and (6.1).
  #emph[Squared increments.] For the budget $V_t$, a distinct-outer product gives
  $ C / l sum_x r_x \( u \)^2 sum_(v in I) r_x \( v \)^2 lt.eq C \/ l . $
  With two fixed outers, an opposite local or cross factor has conditional squared mean at most $n^eta \/ l$, and the fourth sum of the fixed column is bounded. The single opposite diagonal $E$ factor contributes $C T_S \/ l$ instead. Two endpoint $E$ factors give $C B_m^4$.
  With two random outers, a fixed local factor gives $C j_u^2$, using the bounded fourth-column sum for each partner; a cross factor gives $C \/ l$ by its squared row bound. Any remaining endpoint $E$ factor can be bounded by $B_m$, giving $C B_m^2$ per step. The no-intermediate same-end case already contains a non-pure swap. Thus there is no untreated same-end term without either the stated opposite factor, the single opposite diagonal $E$, or at least two endpoint $E$ factors.
  Squares of the finite sums are bounded by the corresponding sums of squares up to constants. The infinite remainder is handled by weighted Cauchy–Schwarz using its geometric decay, as in Lemma 25. Centering and tail terms obey the same majorizations. Summing gives $n^eta + C f_b T_(upright("cap"))$, by (6.2); all $b B_m^2$ and $b B_m^4$ terms are small. This proves the lemma. ◻
]

To extract the diagonal-square bound, choose a normalization $S_T$ larger by a small power than the preceding $T_S$ cap, $\( sum parallel m parallel_2 \)^2$, and the small-loss part of $sum V_t$. From (6.3), the account $1 + T_S \/ S_T$ has expectation factor at most

$ 1 + C parallel m parallel_2 \/ sqrt(S_T) + V_t \/ S_T . $

Choose the new extraction cap $T_(upright("cap"))$ a slightly larger power than $S_T$. Its exponent can still be prescribed arbitrarily small; moreover $f_b T_(upright("cap")) \/ S_T = o \( 1 \)$. Lemma 26 now bounds the accumulated discount loss. This establishes the required $T_S$ bound with the usual extraction cushion.

=== 6.5 Individual increments and special updates <individual-increments-and-special-updates>

Let $cal(F) \( P \) = P - P U H_P U^T P$ denote the numerical update of a reference matrix. Before output recentering, the exact difference identity is

#[#set math.equation(numbering: n => "(6.4)")
 $ cal(F) \( W \) - cal(F) \( P \) = T_P \( E - E U H U^T E \) T_P^T \, #h(2em) T_P = I - P U H_P U^T . $ <eq:original-38>]

The inverse-update difference identity first gives

$ cal(F) \( W \) - cal(F) \( P \) = T_P E T_W^T \, #h(2em) T_W^T = \( I - U H U^T E \) T_P^T \, $

where the second identity follows by coefficient subtraction. These are algebraic identities for the convergent numerical updates and do not require $P$ to be positive. The actual error update differs by the formal tail, whose entries are bounded by (4.7).

Call a surviving update #emph[special] for an entry if one of its two axes has actual vertex distance at most $R_s = ceil.l rho log_q n ceil.r$ from a selected endpoint before the update. Through the life of a fixed entry, at most $C q^(R_s)$ updates are special. To prove this, take the actual graph at the end of the history segment. Every selected endpoint responsible for a special event belongs to one of the two radius-$R_s$ balls there. These balls have at most $C q^(R_s)$ vertices, and at most $d$ selected stubs can occur at any one vertex. If nonspecial survival has positive conditional probability, conditioning on it removes at most another $C q^(R_s) = O \( b \)$ possible partners.

#thm([Lemma 6.6.])[
  (Level-sensitive jump bound).  #emph[For a surviving entry $E_(i j)$ of total level $k$, every allowed cleanup step satisfies 
$ \| Delta E_(i j) \| \/ B_k lt.eq n^(- 2 rho) $

 for all sufficiently large $n$.]
] <lem:cleanup-jumps>

#proof[
  In the linear part of (6.4), replacing output axis $i$ by selected stub $x$ has coefficient
  $ - sum_(s in { u \, v }) p_i \( s \) \( H_P \)_(s x) . $
  Every transfer whose input level is at least the replaced output level has coefficient at most $n^(- beta_R)$ for some fixed $beta_R > 19 rho$. A surviving initially clean axis is farther than $R_0$ from every selected endpoint, so both outer entries are small by the path decay and centering estimates. For a surviving bad axis, the only possible input of equal or higher level is a bad first endpoint $u$. Its outer entry at the clean partner $v$ is small. The remaining contribution uses $\( H_P \)_(u u)$, which is small by the opposite clean return/cross bound and the pure-swap expansion (5.9). Global axes have only lower-level selected inputs. The fixed separation margin permits the choice $beta_R > 19 rho$ by taking $rho$ small enough.
  Consequently, apart from the persisting identity term, transfers that all decrease level cost $C B_(k - 1)$ when $k gt.eq 1$. Any term with a nondecreasing transfer costs $C n^(- beta_R) B_m$. The nonlinear part of (6.4) costs $C B_m^2$, and output recentering costs $C B_m \/ l$. The remaining formal tail costs $B_(upright("tail"))$. After division by $B_k$, the first bound is $C n^(- 4 rho)$, the second is at most $C n^(- beta_R + 16 rho)$, and the last three are smaller than $n^(- 2 rho)$ by the parameter margins. There is no decreasing transfer when $k = 0$. This proves the claim after absorbing fixed constants. ◻
]

For each sign of an entry, start its dimensionless comparator at $1$ and increase it by $n^(- 2 rho)$ at each special surviving update. Lemma 27 implies that its signed positive excess cannot increase at such a step. The total comparator increase is $O \( q^(R_s) n^(- 2 rho) \) = o \( 1 \)$.

=== 6.6 Conditional entry budgets on ordinary updates <conditional-entry-budgets-on-ordinary-updates>

The preceding jump bound pays for the few special updates. For the remaining updates we need a smaller cumulative signed mean and variance. The following estimates use the actual conditional law of the partner, including the exclusions required for survival.

#thm([Lemma 6.7.])[
  (Individual predictable entry budgets).  #emph[For every fixed entry while its labels are alive, and through every chosen history segment, there is a fixed $c_5 > 0$ such that 
#[#set math.equation(numbering: n => "(6.5)")
 $ & sum_(t : upright("nonspecial survival")\
upright("has positive probability")) frac(\| bb(E) \( Delta E_(i j) divides upright("nonspecial survival") \) #scale(x: 120%, y: 120%)[\|], B_k) lt.eq n^(- c_5) \,\
 & sum_(t : upright("nonspecial survival")\
upright("has positive probability")) frac(bb(E) \( \( Delta E_(i j) \)^2 divides upright("nonspecial survival") \), B_k^2) lt.eq n^(- c_5) . $ <eq:original-39>]

 Here $k = nu \( i \) + nu \( j \)$ is the pair’s total level. Each sum stops when one of its labels dies.]
] <lem:cleanup-entry-budgets>

#proof[
  Conditional on nonspecial survival, the partner is uniform in a set omitting $O \( b \)$ stubs. All estimates below hold for such sets, even when the omitted set changes with the history. We give bounds at the smallest scale $B_c$; since $B_k gt.eq B_c$, they imply the displayed assertions.
  #emph[Signed means.] For zero-intermediate pure swaps with an outer $E$, use the centered full partner sum. An omitted average of an $E$ row has magnitude at most $C b B_m \/ l$, and an omitted average of a $P$ row has magnitude at most $C sqrt(b) \/ l$ by its row norm. Lemma 23 therefore gives cumulative absolute signed-mean bounds
  $ C n^eta b^(3 \/ 2) B_m \/ l_0 \, #h(2em) C b^(3 \/ 2) B_m \/ l_0 \, #h(2em) C b^2 B_m^2 \/ l_0 $
  for $p_i \( u \) overline(e_j \( v \))$, $e_i \( u \) overline(p_j \( v \))$, and the two-outer-$E$ term, respectively. For the first term use $sum_t A_i^t \( u_t \) lt.eq n^eta sqrt(b)$; for the second and third it suffices to use the entry cap on the prescribed endpoint. The pure $P$–$P$ zero-intermediate tail cancels coefficientwise over all partners. In the omitted part, Cauchy–Schwarz gives $C sqrt(b)$ for the omitted absolute row sum, and the prescribed-endpoint path sum is $n^eta sqrt(b)$. Summing degree choices yields the bound $C n^eta b \/ l_0$.
  For the single endpoint $E$ term with $W$ outers, two fixed outers contribute at most
  $ C n^eta frac(\| Y_E \| + sqrt(b T_(upright("cap"))), l_0) . $
  Indeed their product sums over the prescribed endpoints to at most $n^eta$, and the signed opposite diagonal mean is bounded as in Lemma 26. Two random outers cost $C f_b B_m$, by the bounded outer row dot divided by $l$. Distinct outers cost $C n^eta sqrt(b) \/ l_0$, taking the random row dot first and then summing the fixed outer.
  For a cross topology factor, the cumulative bounds for fixed, random, and distinct outer endpoints are, respectively,
  $ C n^eta Q_a \/ l_0 \, #h(2em) C f_b \, #h(2em) C n^eta sqrt(b) \/ l_0 . $
  The first uses its row $ell^1$ bound and the summed product of the fixed outers; the second uses the bounded random outer row dot and the bounded cross-entry supremum; the third uses the bounded cross row norm against the random outer before summing the fixed one.
  For local-only topology, two fixed outers require the opposite local factor and have the same $C n^eta Q_a \/ l_0$ bound. Two random outers cost at most $C f_b$. With distinct outers and no endpoint $E$, both local factors are present; bound the random local factor by its supremum and average its outer with cost $C \/ sqrt(l)$. The remaining prescribed sum $sum_t r_i^t \( u_t \) j_(u_t)^t$ is at most $n^eta$, so the total is $C n^eta \/ sqrt(l_0)$. With one endpoint $E$ and local topology, the same-outer requirements persist; the distinct case instead costs $C n^eta B_m sqrt(b \/ l_0)$.
  Terms with at least two endpoint $E$ factors have the combined bound
  $ C n^eta B_m^2 (1 + b \/ l_0 + sqrt(b \/ l_0)) . $
  For two fixed outers this follows from their pathwise product sum; for two random outers their conditional product mean is $O \( 1 \/ l \)$; for distinct outers average the random row and sum the fixed one. Non-pure swaps have instead the combined bound
  $ C n^eta (l_0^(- 1) + b l_0^(- 2) + sqrt(b) thin l_0^(- 3 \/ 2)) \, $
  by the same three outer configurations and the additional $1 \/ l$ factor. Centering contributes $C f_b B_m$. Lemma 25 proves that these bounds cover every mean term, including the tail.
  #emph[Second moments.] We next bound the cumulative second moments, keeping the same three outer configurations. With distinct outers, averaging the random outer square gives $C \/ l$, and (6.2) bounds the sum of prescribed outer squares. The resulting budget is $C n^eta \/ l_0$. With two fixed outers, an opposite local or cross factor has conditional squared mean at most $n^eta \/ l$; the pathwise sum of outer product squares is at most $n^eta$. The resulting bound is again $C n^eta \/ l_0$, after adjusting the preliminary loss. The single opposite diagonal $E$ factor costs $C n^eta T_(upright("cap")) \/ l_0$, while two endpoint $E$ factors cost $C n^eta B_m^4$.
  With two random outers, a fixed diagonal $E$ or another otherwise unestimated endpoint $E$ contributes at most $C f_b B_m^2$. A fixed local factor contributes $C n^eta \/ l_0$, because its pathwise squared sum is bounded and the random outer fourth-product average is $O \( 1 \/ l \)$. The remaining cross topology term with two random outers requires a joint sum over steps and partners: its outer squares must be retained. Separate its actual-path and uniform parts by writing
  $ b_(u v)^t lt.eq b_(u v)^(t \, upright("act")) + U \, #h(2em) U = C n^(eta_0) q^(L \/ 2) \/ l_0 \, $
  where $eta_0$ is a sufficiently small preliminary loss and the centering term $C \/ l$ is included in $U$. The squares of these two parts can be estimated separately, up to a fixed factor. For the actual-path part, bound one outer by its constant supremum and write the other squared outer as $C \( A_i^t \( v \)^2 + B_m^2 \)$. The numerator of the cumulative partner average is thus bounded by
  $ C sum_v sum_t #scale(x: 120%, y: 120%)[\(] A_i^t \( v \)^2 + B_m^2 #scale(x: 120%, y: 120%)[\)] \( b_(u_t v)^(t \, upright("act")) \)^2 . $
  Dominate every $A_i^t \( v \)$ by its terminal actual-path row plus $U$. This majorant has squared sum at most $n^eta$ over the initial stubs; its added uniform squared mass is at most $C l_1 U^2 = o \( 1 \)$. For each fixed $v$, the sum $sum_t \( b_(u_t v)^(t \, upright("act")) \)^2$ is at most $n^eta$ by Lemma 23. Choosing the preliminary loss smaller gives a total $n^eta$. The $B_m^2$ part is at most $C b B_m^2$, using the bounded current cross-row squared sum at every step. Division by $l asymp l_0$ gives $C n^eta \/ l_0 + C f_b B_m^2$.
  For the uniform part, retain both outer squares. At each step their sum is bounded:
  $ sum_(v in I) r_i^t \( v \)^2 r_j^t \( v \)^2 lt.eq #scale(x: 120%, y: 120%)[\(] sup_v r_j^t \( v \)^2 #scale(x: 120%, y: 120%)[\)] sum_(v in I) r_i^t \( v \)^2 lt.eq C . $
  Its cumulative partner-average contribution is consequently at most
  $ C b U^2 \/ l_0 = C n^(2 eta_0) b q^L \/ l_0^3 . $
  This can be absorbed into the preceding $n^eta \/ l_0$ budget. Directly, its ratio to $B_c^2$ is
  $ C n^(2 eta_0) frac(b q^L, l_0^3 B_c^2) = n^(- 1 \/ 3 - 1.085 a + 2 eta_0 + o \( 1 \)) \, $
  which tends to zero by a fixed power.
  Non-pure swaps and recentering yield smaller bounds. As before, geometric summability handles the longer endpoint words, and the same-endpoint configurations without an opposite topology factor are exactly the zero-intermediate non-pure term, the single opposite diagonal $E$ term, or a term with at least two endpoint $E$ factors. This verifies exhaustiveness of the square estimates as well.
  #emph[Comparison with the target scales.] All displayed mean budgets are smaller than $B_c$ by a fixed power, and all square budgets are smaller than $B_c^2$ by a fixed power. Some of the direct comparisons that control the smaller margins are
  $ f_b / B_c & = n^(- .08 a + o \( 1 \)) \, & l_0^(- 1 \/ 2) / B_c & = n^(- .35 a) \,\
l_0^(- 1) / B_c^2 & = n^(- .70 a) \, & frac(Q_a \/ l_0, B_c) & = n^(- .64 a + eta + o \( 1 \)) . $
  The bound on $Y_E$ gives another power saving, and the terms with $B_m$, $b^(3 \/ 2) \/ l_0$, or $B_m^2$ have additional margins from (6.1). Choose all preliminary losses, the exponent of $T_(upright("cap"))$, and $rho$ within these strict margins. A common positive $c_5$ then gives (6.5). ◻
]

=== 6.7 Simultaneous extraction and completion of cleanup <simultaneous-extraction-and-completion-of-cleanup>

We finish the proof of Proposition 22. Give every entry and each of its two signs its own alive-label account, with the fixed initial family denominator. For an entry of total level $k$, let $c_t$ be its dimensionless comparator defined above. Its excess account is

$ 1 + (frac(\( plus.minus E_(i j) \/ B_k - c_t \)_(+), lambda))^p quad upright("while alive") \, #h(2em) 0 quad upright("after death") \, #h(2em) lambda = n^(- zeta) . $

Choose $zeta > 0$ smaller than $2 rho$, $c_5 \/ 2$, and the individual-increment margins. On an ordinary surviving branch, the comparator is unchanged. The bounded-increment inequality (3.1), together with (6.5), gives a pathwise summably small discount budget. On a special surviving branch the account does not increase, by Lemma 27 and the comparator increment. On a death branch it drops to zero. These statements give the unconditional account estimate; no conditioning of the actual deterministic choice is required.

For clarity, a step contributes to the predictable budget whenever ordinary survival has positive conditional probability, even if the chosen branch is special. The proof of (6.5) bounds precisely this sum along the chosen history by the distinct prescribed endpoints and the current structural estimates. Thus the per-label discount product is bounded along that history. Structural estimates at a chosen state come from their separate structural accounts and do not depend on the entry-discount estimate. This is the order in which the pathwise estimates enter the induction.

Initially every entry is $o \( B_c \)$ by the early-phase bound. The comparator is $1 + o \( 1 \)$ throughout cleanup. There are only polynomially many fixed entry labels and logarithmically many spectral points. A sufficiently large fixed even $p$ therefore makes the family-size factor after the $p$th root smaller than the power saving supplied by $lambda$. The extracted excess is $o \( 1 \)$ in units of $B_k$, proving $\| E_(i j) \| lt.eq 2 B_k$.

Join these accounts with the diagonal-square accounts of Lemma 26, the scalar accounts of Lemma 24, and the retained structural accounts. Give each normalized $T_S$, $L_0$, and $L_1$ account weight one separately at each tracked spectral point, and each $cal(T)$-deviation account weight one at each primary. There are only $O \( log n \)$ such scalar accounts. The fixed family denominators are used for the polynomially many individual entry labels, not for these scalar accounts. Thus a scalar account’s extraction factor is only the total normalized account budget $n^(o \( 1 \))$ times its bounded discount loss. The phase initializations and normalizations have the prescribed total-size cushions. At a current state satisfying the bootstrap bounds, every available pair has small endpoint block error, so its next precision matrices are positive by the two-dimensional inertia argument. All candidate statistics are consequently defined. The minimizing choice preserves the total discounted account; the preceding extraction then supplies the bounds at the next chosen state. This closes the simultaneous induction and proves Proposition 22.

All choices use current data. For each candidate pair, survival and special status are determined by its endpoints and the current graph; the comparator is then either unchanged or increased by $n^(- 2 rho)$. The candidate matrix entries and accounts determine their finite conditional averages and hence their discounts before the minimizing pair is selected. The terminal-prefix graph is used only to prove bounds on those accumulated discounts. It is not data required by the algorithm.

== 7 Completion from a separated boundary <sec:boundary-completion>

We now complete the pairing from the separation stop. The main constraint is to control individual resolvent entries as the unresolved set shrinks. We compare the resolvent with a smooth path sum fixed at the stop and continued by exact matrix updates. Separation makes its rows nearly single coordinates. An initial averaged energy gap then gives small individual row energies, which in turn permit entry concentration down to a small final matching. The stop configuration and the completed matching will define one reference throughout the primary parameter interval. Keeping this same reference as $h$ varies is essential for the local spectral estimates in the next section.

The inputs from the preceding sections are the following:

+ The $l_0$ unresolved stubs lie at distinct vertices. No nonempty actual nonbacktracking path of length at most $R_0$ joins two of these vertices, including a return to the same vertex.
+ At every retained primary and both signs, the conclusions of Proposition 22 and Lemma 10 hold. In particular, the precision is positive; the trace, diagonal-square, entry and local-energy bounds hold; and $cal(T)$ has the stated lower bound.
+ The coefficient and actual-path multiplicity bounds through length $L$ hold, including their versions with any fixed power of the path length.

Only the primary parameters are retained, with both signs. A uniform pair means a uniformly chosen ordered pair of distinct unresolved stubs; reversing its order gives the same next state. These finite averages are used only to implement the deterministic account rule. Vertex operators act on $upright(bold(1))^perp$ and are extended by zero when entries are taken. Constants are uniform in $n$ and the retained points, but may depend on the fixed ratio bounds for $L \/ R_0$. Uniformity in $h$ always refers to the convex hull of the retained primaries, contained in $\( 0 \, h_(*) \]$. The stop precision is positive throughout this interval for both signs: the identity $- partial_h M = cal(D) + h^(- 2) alpha I succ 0$ makes $M \( h \) succ.curly.eq M \( h_(*) \) succ 0$ when $h lt.eq h_(*)$.

Separation makes every subsequent pair of distinct unresolved vertices an allowable simple edge. Indeed, if a path of length at most $R_0$ from one unresolved vertex used a newly added edge, the segment preceding the first new edge would be an actual stop-graph path to an old boundary vertex. That segment has positive length unless it starts at the unresolved vertex itself; the latter vertex is not incident to any previously added edge. Separation excludes both a short path to a different unresolved vertex and a short return. This argument applies at every subsequent state and for every matching of the boundary. Thus the uniform pair averages below require no further graph-theoretic rejection.

#thm([Proposition 7.1.])[
  (Completion of the separated boundary).  #emph[Under these inputs, the account rule can deterministically complete the pairing. Every added edge is simple and preserves the girth exclusion. At the end the precision is positive at every primary point for both signs. There is a reference matrix $hat(P)_(upright("fin"))$, defined below by exact numerical updates from a smooth coefficient truncation at the stop, such that at every retained primary parameter and both signs, 
$ max_(i \, j) \| \( W_(upright("fin")) - hat(P)_(upright("fin")) \)_(i j) \| lt.eq C B_B \, #h(2em) B_B = n^(.40 a) / sqrt(l_2) . $

 The construction retains the stop configuration and the matching added after it. These define the same family $hat(P)_(upright("fin")) \( h \)$ throughout the primary interval. All the accounts, candidate values and transitions in this section can be evaluated in a number of bit operations polynomial in $n$, with an exponent depending only on the fixed parameters.]
] <prop:boundary-completion>

=== 7.1 The reference at the separation stop <subsec:boundary-reference>

The reference must satisfy two different estimates: most of each row on the boundary must be small, and its compression to boundary contrasts must be close to the identity in operator norm. The first follows from separation and path counting. The second needs the smooth cutoff below.

Let $S_0$ be the unresolved set at the stop and let $cal(H)_0 = upright(bold(1))_(S_0)^perp$. Sending a stub coordinate to its vertex coordinate gives an isometry $V_0 : cal(H)_0 arrow.r upright(bold(1))^perp$. Thus $cal(D) = V_0 V_0^T$. We use matrices on $cal(H)_0$ also as zero-extended matrices in $S_0$ coordinates. In particular its identity has coordinate matrix $Pi_(l_0)$.

Fix an even, compactly supported function $phi$ such that $phi \( x \) = 1$ for $\| x \| lt.eq 1 - delta_L$ and $phi \( x \) = 0$ for $\| x \| gt.eq 1$, where $0 < delta_L lt.eq .03 a$. Its finite smoothness order will be chosen in the proof below. A piecewise polynomial with rational coefficients, and with the specified derivatives vanishing at its joins, suffices. Define

$ hat(P)_0 = sum_(k gt.eq 0) phi \( k \/ L \) \( sigma h \)^k Q_k quad upright("on ") upright(bold(1))^perp . $

The sum is finite. By the coefficient estimates,

$ max_(i \, j) \| \( hat(P)_0 - P_(< L) \)_(i j) \| lt.eq n^(.32 a) / sqrt(l_0) . $

Indeed the altered actual terms have lengths at least $\( 1 - delta_L \) L$, and hence their absolute sum at fixed endpoints is $O \( L q^(- \( 1 - delta_L \) L \/ 2) \)$; the virtual and centering contributions are $O \( n^eta q^(L \/ 2) \/ l_0 \)$. Substitution of the prescribed value of $L$ gives the displayed bound. The same argument applies to centered-stub outputs and to a fixed number of $h$ derivatives, allowing an arbitrarily small additional power loss.

#thm([Lemma 7.2.])[
  (Sparse rows and a small compressed operator).  #emph[There are constants $r'_P > 0$ and $C$ such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ hat(Gamma)_0 := V_0^T hat(P)_0 V_0 = I + hat(D)_0 quad upright("on ") cal(H)_0 \, #h(2em) parallel hat(D)_0 parallel lt.eq C / R_0 . $ <eq:original-40>]

 For every global vertex coordinate $i$, the vector $p_(i \, 0) = V_0^T hat(P)_0 e_i$ satisfies 
#[#set math.equation(numbering: n => "(7.2)")
 $ p_(i \, 0) = c_i Pi_(l_0) e_(s \( i \)) + tau_i \, #h(2em) \| c_i \| lt.eq 1 \, #h(2em) parallel tau_i parallel_2 lt.eq n^(- r'_P) . $ <eq:original-41>]

 The first summand is omitted if there is no actual path from $i$ to a boundary vertex of length less than $floor.l R_0 \/ 4 floor.r$. Otherwise that vertex and that path are unique, and $c_i = \( sigma h \)^("dist" \( i \, s \( i \) \))$. For a boundary vertex, $s \( i \)$ is its own stub and $c_i = 1$. The estimate for $tau_i$ holds also for $partial_h tau_i$, after decreasing $r'_P$ if necessary. All these statements hold uniformly throughout the closed convex hull of the retained primary parameters.]
] <lem:boundary-smooth-reference>

#proof[
  #emph[Short paths and row tails.] Put $t_0 = floor.l R_0 \/ 4 floor.r$. Two boundary endpoints within distance $t_0$ of a given vertex would give a boundary-to-boundary path of length at most $2 t_0$. Two distinct nonbacktracking paths of length less than $t_0$ from a boundary endpoint to a fixed vertex give, after cancellation of a common terminal segment, a nonempty nonbacktracking boundary return of length less than $2 t_0$. Both possibilities are excluded. This proves uniqueness of the short summand in (7.2).
  For $t_0 lt.eq k < L$, fix a path prefix of length $k - t_0$ starting at $i$. There is at most one boundary endpoint within distance $t_0$ of its last vertex. The bounded fixed-endpoint multiplicity estimate gives at most a constant number of nonbacktracking suffixes of length $t_0$ to that endpoint. Consequently there are at most $C q^(k - t_0)$ actual paths of length $k$ from $i$ to the boundary. Applying the same fixed-endpoint multiplicity estimate to the complete paths yields
  $ sum_(s in S_0) lr(|sum_(t_0 lt.eq k < L) phi \( k \/ L \) \( sigma h \)^k Q_(k \, upright("actual")) \( i \, s \)|)^2 lt.eq C L sum_(t_0 lt.eq k < L) q^(- k) q^(k - t_0) lt.eq n^eta q^(- t_0) . $
  The virtual and centering contribution to this row has norm at most $C \( 1 + L \)^2 q^(L \/ 2) \/ sqrt(l_0) = C \( 1 + L \)^2 n^(- .29 a)$. Projection onto $cal(H)_0$ is a contraction. These bounds prove (7.2); insertion of factors $k \/ h$ proves the derivative statement. The same argument for a boundary input, and symmetry, gives
  $ max_(s in S_0) parallel hat(D)_0 Pi_(l_0) e_s parallel_2 + max_(s in S_0) parallel partial_h hat(D)_0 Pi_(l_0) e_s parallel_2 lt.eq n^(- r'_P) $
  with a possibly smaller exponent. This completes the row estimates.
  #emph[Moments on boundary contrasts.] For the operator estimate, we use the stronger consequence of separation $V_0^T Q_j V_0 = 0$ for $1 lt.eq j lt.eq R_0$. To verify this also for paths with virtual traversals, observe that the first virtual traversal must be the first step: a positive actual prefix would already join a boundary vertex to a missing departure. After a virtual traversal the sole missing stub at its landing vertex is excluded as the next departure. Any later virtual traversal, or an actual endpoint on the boundary, would therefore require a positive actual boundary-to-boundary segment of prohibited length. The only remaining possibility is the single virtual traversal; its averaging operator vanishes on $cal(H)_0$.
  To express this vanishing in terms of spectral moments, introduce, for a formal variable $t$, the matrix series
  $ G_(upright("gen")) \( t \) & = V_0^T \( 1 - t^2 \) \[ I - t A_e + t^2 \( q I - V_0 V_0^T \) \]^(- 1) V_0 \,\
G_(upright("reg")) \( t \) & = V_0^T \( 1 - t^2 \) \[ I - t A_e + q t^2 I \]^(- 1) V_0 . $
  The formal Woodbury identity and the preceding vanishing give
  $ G_(upright("gen")) \( t \) = I + O \( t^(R_0 + 1) \) \, #h(2em) G_(upright("reg")) \( t \) = G_(upright("gen")) \( t \) (I + frac(t^2, 1 - t^2) G_(upright("gen")) \( t \))^(- 1) = \( 1 - t^2 \) I + O \( t^(R_0 + 1) \) . $
  Let $cal(U)_k$ denote the Chebyshev polynomial of the second kind, normalized by $cal(U)_k \( cos theta.alt \) = sin \( \( k + 1 \) theta.alt \) \/ sin theta.alt$. For every complex unit vector $f in cal(H)_0$, the spectral measure $mu_f$ of $A_e \/ \( 2 sqrt(q) \)$ at $V_0 f$ therefore satisfies
  $ integral cal(U)_0 thin d mu_f = 1 \, #h(2em) integral cal(U)_k thin d mu_f = 0 quad \( 1 lt.eq k lt.eq R_0 \) . $
  This follows on dividing by $1 - t^2$ and using $\( 1 - 2 x y + x^2 \)^(- 1) = sum_(k gt.eq 0) cal(U)_k \( y \) x^k$ with $x = t sqrt(q)$. Hence $mu_f$ agrees, through polynomial degree $R_0$, with the semicircle measure of angular density $\( 2 \/ pi \) sin^2 theta.alt thin d theta.alt$.
  Positivity at the two closest signed precisions implies $parallel A_e \|_(upright(bold(1))^perp) parallel lt.eq 2 sqrt(q) + C alpha_(*)^2$. For example, multiplying the positive precision by $h$ and adding the positive term $h^2 V_0 V_0^T$ gives $I - sigma h A_e + q h^2 I succ 0$. The claimed support bound follows from $z \( h \) = 2 sqrt(q) + O \( alpha_(*)^2 \)$.
  #emph[Edge mass and the smooth cutoff.] The moment identities give the following bound: for every $u gt.eq C' \/ R_0$, the mass within angular distance $u$ of either edge, including mass outside $\[ - 1 \, 1 \]$ at that edge, is at most $C u^3$. For its proof, choose $m = floor.l c \/ u floor.r$ with a sufficiently small positive constant $c$, so that $2 m lt.eq R_0$, and put $K_m \( y \) = sum_(k = 0)^m \( k + 1 \) cal(U)_k \( y \)$. Moment matching and orthonormality give
  $ integral K_m \( y \)^2 thin d mu_f \( y \) = sum_(k = 0)^m \( k + 1 \)^2 lt.eq C \( m + 1 \)^3 . $
  For $0 lt.eq theta.alt lt.eq c_0 \/ \( m + 1 \)$ every summand satisfies $cal(U)_k \( cos theta.alt \) gt.eq c_1 \( k + 1 \)$; hence $K_m gt.eq c_2 \( m + 1 \)^3$ there. For $y gt.eq 1$ the same inequality follows from $cal(U)_k \( cosh v \) = sinh \( \( k + 1 \) v \) \/ sinh v gt.eq k + 1$. Markov’s inequality gives mass $O \( \( m + 1 \)^(- 3) \) = O \( u^3 \)$. Reflection proves the estimate at $- 1$. Values of $u$ bounded away from zero are covered by increasing the constant.
  Put $x = t sqrt(q)$ and write $H_b \( x \) = G_(upright("reg")) \( t \) - \( 1 - t^2 \) I = sum B_k x^k$. Its coefficients vanish for $k lt.eq R_0$. Choose a smooth function $psi \( k \/ L \)$ supported in $R_0 \/ 2 < k < C L$ and equal to one for $R_0 < k lt.eq L$. The ratio $L \/ R_0$ is bounded above and below by fixed positive constants, so all derivatives of this cutoff, in the variable $k \/ L$, have fixed bounds. For $x_0 = sigma h sqrt(q)$ and $xi in bb(R)$, we claim
  #[#set math.equation(numbering: n => "(7.3)")
   $ ∥sum_(k > R_0) B_k x_0^k psi \( k \/ L \) e^(i xi k \/ L)∥ lt.eq frac(C \( 1 + \| xi \| \)^(J_0), R_0) $ <eq:original-42>]
  for a fixed integer $J_0$.
  For $k > R_0$, $B_k$ is the compression to $cal(H)_0$ of $cal(U)_k \( A_e \/ \( 2 sqrt(q) \) \) - q^(- 1) cal(U)_(k - 2) \( A_e \/ \( 2 sqrt(q) \) \)$. Thus each quadratic form in (7.3) is the integral of a tapered Chebyshev kernel against $mu_f$. The cubic edge-mass bound will control the kernel’s $O \( L^2 \)$ edge peaks, up to a fixed power of $1 + \| xi \|$; smoothness of the cutoff will give summable decay away from the edges. We now establish these kernel bounds.
  Extend the coefficient sequence by zero to all integers. For $b_k = psi \( k \/ L \) \| x_0 \|^k e^(i xi k \/ L)$ and every fixed integer $J gt.eq 0$, the $J$th finite difference has $ell^1$ norm at most $C_J L^(1 - J) \( 1 + \| xi \| \)^J$. This follows by the fundamental theorem of calculus applied $J$ times to the smooth interpolation of $b_k$; derivatives of $\| x_0 \|^k$ are harmless because, on the support $k gt.eq c L$, $\( L \| log \| x_0 \| \| \)^j e^(- c L \| log \| x_0 \| \|)$ is bounded. Summation by parts, or the trivial $ell^1$ bound when the denominator is small, yields
  $ lr(|sum_k b_k e^(i k omega)|) lt.eq C_J L \( 1 + \| xi \| \)^J \( 1 + L "dist" \( omega \, 2 pi bb(Z) \) \)^(- J) . $
  The sine formula for the two Chebyshev terms, the preceding bound, and $\| cal(U)_k \( cos theta.alt \) \| lt.eq k + 1$ imply, after increasing $J$ if necessary,
  $ \| cal(K) \( cos theta.alt \) \| lt.eq C_J L^2 \( 1 + \| xi \| \)^J \( 1 + L min \( theta.alt \, pi - theta.alt \) \)^(- J) . $
  If $y$ lies just outside $\[ - 1 \, 1 \]$, its hyperbolic angle is $O \( alpha_(*) \)$; since $L alpha_(*) = o \( 1 \)$, the corresponding bound is $C_J L^2 \( 1 + \| xi \| \)^J$.
  Integrate first over the edge bins of angular width $C' \/ R_0$. Their mass is $O \( R_0^(- 3) \)$, so their contribution is $O \( L^2 R_0^(- 3) \) \( 1 + \| xi \| \)^J = O \( R_0^(- 1) \) \( 1 + \| xi \| \)^J$. The subsequent bins, with angular distance between $2^j C' \/ R_0$ and $2^(j + 1) C' \/ R_0$, contribute at most
  $ C L^2 \( 1 + \| xi \| \)^J \( 2^(j + 1) \/ R_0 \)^3 \( 1 + c 2^j L \/ R_0 \)^(- J) . $
  For $J > 3$ their sum is again $O \( R_0^(- 1) \) \( 1 + \| xi \| \)^J$. This holds for every complex unit $f$. The numerical-radius inequality $parallel T parallel lt.eq 2 sup_(parallel f parallel = 1) \| f^(*) T f \|$ proves (7.3). If $x_0 < 0$, replace $y$ by $- y$ in this argument; the two edge bounds are symmetric.
  #emph[Return to the configuration pencil.] The preceding bound concerns the regular pencil. To recover the desired smooth truncation of the configuration pencil, eliminate in the opposite direction:
  $ G_(upright("gen")) \( t \) = I + sum_(j gt.eq 1) frac(t^(2 \( j - 1 \)), \( 1 - t^2 \)^(2 j)) H_b \( x \)^j . $
  Only $j lt.eq L \/ \( R_0 + 1 \)$ can contribute below total degree $L$. Choose once and for all an integer $J_(*)$ larger than all these upper bounds. Insert $psi \( k \/ L \)$ into each factor $H_b$: this does not change any coefficient contributing after the final taper $phi \( k \/ L \)$. Fourier inversion expresses that taper as
  $ phi \( \( k_1 + dots.h.c + k_j + m \) \/ L \) = frac(1, 2 pi) integral_(bb(R)) hat(phi) \( xi \) e^(i xi \( k_1 + dots.h.c + k_j + m \) \/ L) thin d xi . $
  At $\| t \| lt.eq 1 \/ sqrt(q)$ the scalar series $t^(2 \( j - 1 \)) \( 1 - t^2 \)^(- 2 j)$ has a bounded absolute sum for each $j lt.eq J_(*)$. The $j$ matrix factors inside the integral are bounded by (7.3). Choose the finite smoothness of $phi$ so that $integral \| hat(phi) \( xi \) \| \( 1 + \| xi \| \)^(J_0 J_(*)) thin d xi < oo$. The tapered $j$th term then has norm $O \( R_0^(- j) \)$. Summing the finitely many terms proves (7.1). ◻
]

=== 7.2 Continuing the reference through every matching <continuing-the-reference-through-every-matching>

We continue the reference by the same numerical update as the resolvent. An aggregate formula for all pairs added since the stop will show that its estimates persist for every possible matching.

Let $P_t$ be the stub operator on $S_0$ consisting of the resolved swaps and uniform averaging on the currently unresolved stubs, and restrict it to $cal(H)_0$. Let $Q_R$ be the orthogonal projection onto the current unresolved contrasts in this fixed space. Then $P_t^2 = I - Q_R$, $P_t Q_R = Q_R P_t = 0$, and the precision increment since the stop is

$ V_0 thin \[ h \( I - Q_R \) - sigma P_t \] V_0^T . $

The Woodbury coefficient at ideal compressed Gram $I$ is $H_(t 0) = - sigma h P_t$. This identity is checked on the three eigenspaces of $P_t$, with eigenvalues $0 \, 1 \, - 1$, using $m = h \/ \( 1 - h^2 \)$. Define

$ H_t = H_(t 0) \( I + hat(D)_0 H_(t 0) \)^(- 1) \, #h(2em) hat(P)_t = hat(P)_0 - hat(P)_0 V_0 H_t V_0^T hat(P)_0 . $

By (7.1), the inverse exists and $parallel H_t parallel lt.eq C$. The identity $H_t = \( I + H_(t 0) hat(D)_0 \)^(- 1) H_(t 0)$ also shows that $H_t Q_R = Q_R H_t = 0$. Thus these are precisely the iterated exact numerical updates of the reference; no positivity of the reference is asserted or needed. The formula depends only on the stop data and the current matching, so it defines the reference simultaneously for all $h$ in the primary interval, irrespective of the order in which the matching was exposed.

On current contrasts its compressed error is

$ hat(D) = Q_R \( hat(D)_0 - hat(D)_0 H_t hat(D)_0 \) Q_R \, #h(2em) parallel hat(D) parallel lt.eq C \/ R_0 . $

The row norms of this matrix are power-small, uniformly over every matching of $S_0$. To see this without accumulating a stepwise error, note that $P_t Pi_(l_0) e_s$ is a partner coordinate or an average of coordinates, followed by the fixed centering. Therefore (7.2) gives $parallel hat(D)_0 H_(t 0) Pi_(l_0) e_s parallel lt.eq C n^(- r'_P)$. The identity

$ hat(D)_0 H_t = \( I + hat(D)_0 H_(t 0) \)^(- 1) hat(D)_0 H_(t 0) $

preserves this bound. Projection to current contrasts replaces a coordinate by that coordinate minus an average, so the same estimate holds for rows of $hat(D)$.

For every global $i$, its row on current unresolved stubs is

#[#set math.equation(numbering: n => "(7.4)")
 $ p_i = c_i Pi_l e_(s \( i \)) + tau_(i \, t) \, #h(2em) parallel tau_(i \, t) parallel_2 lt.eq n^(- r_P) \, $ <eq:original-43>]

if $s \( i \)$ is still unresolved, and consists only of the stated tail otherwise. Indeed the row is $Q_R \[ p_(i \, 0) - hat(D)_0 H_t p_(i \, 0) \]$, and the preceding bounds apply separately to its short coordinate and its tail. We may fix $r_P = .001 a$, decreasing the intermediate exponent if needed. Initially the diagonal estimates from the path bounds also give

$ \| "Tr" hat(D)_0 \| lt.eq n^eta q^(L \/ 2) \, #h(2em) sum_s \( hat(D)_0 \)_(s s)^2 lt.eq n^eta . $

=== 7.3 Pair updates and the initial energy gap <pair-updates-and-the-initial-energy-gap>

We now turn to the actual resolvent. Its compressed deviation from the identity enters each pair update. The squared row norms of this deviation will control the averaged increments.

Identify the current unresolved coordinates with an $l$-element set. Put

$ D = Xi^T W Xi - Pi_l \, quad Y = "Tr" D \, quad X = "Tr" D^2 \, quad T = sum_x D_(x x)^2 \, quad Z_D = parallel D parallel . $

The analogous reference quantities are denoted with hats. They are real symmetric and annihilate $upright(bold(1))$. From now on put $E = W - hat(P)$, so that $D - hat(D) = Xi^T E Xi$. Thus $D$ measures the compressed resolvent’s deviation from the identity, whereas $E$ measures its error against the continued reference. Small entries of $E$, together with the reference bounds, keep the pair updates well defined; the row energies of $D$ will provide the stronger averaged bounds needed as $l$ decreases.

We track global–global, global–contrast, and contrast–contrast entries of $E$, using every fixed contrast $e_("vtx" x) - e_("vtx" y)$ whose two stubs are still unresolved. A contrast label is deleted when either of its endpoints is selected. These fixed output vectors require no recentering. Averaging contrasts recovers centered-stub entries, with at most a fixed factor in the bounds.

For a selected pair set $I = \[ e_u \, e_v \]$, let $F$ be the two-coordinate swap and let $J_2$ be the all-ones matrix. We reuse

$ B = I_2 + frac(J_2, l - 2) \, quad H_0 = - sigma h F B \, quad A = I^T D I \, quad K = I^T D^2 I \, quad J = I^T D^3 I \, quad H = \( H_0^(- 1) + A \)^(- 1) . $

Here $I_2$ is the $2$-by-$2$ identity; the use of $A$ in this subsection refers only to this block. The projection onto surviving contrasts, in the old coordinate space, is $Q = Pi_l - Pi_l I B I^T Pi_l$. Since $Q Pi_l I = 0$, the exact Woodbury formula gives

#[#set math.equation(numbering: n => "(7.5)")
 $ D' = Q \( D - D I H I^T D \) Q . $ <eq:original-44>]

It gives the same recurrence with hats. A global row $w_i = Xi^T W e_i$ updates to $Q \( w_i - D I H I^T w_i \)$. Let $r_i = w_i - c_i Pi_l e_(s \( i \))$ while the short endpoint $s \( i \)$ from (7.2) is active, and let $r_i = w_i$ after its removal or if it did not exist.

The bootstrap on entry errors and the deterministic reference bounds will give throughout the two phases

#[#set math.equation(numbering: n => "(7.6)")
 $ max_(x \, y) \| D_(x y) \| + max_(i \, x) \| \( r_i \)_x \| lt.eq epsilon.alt \, #h(2em) max_(x \, y) \| hat(D)_(x y) \| lt.eq epsilon.alt \, #h(2em) epsilon.alt = n^(- r_P \/ 2) . $ <eq:original-45>]

Changing the displayed right side by a fixed factor makes no difference, and we do so where contrasts are used. In particular all two-coordinate Neumann series converge absolutely with a uniform geometric bound. The usual inertia argument shows that every candidate pair preserves positive precision: the ideal middle matrix $H_0^(- 1)$ has one positive and one negative eigenvalue bounded away from zero, and the perturbation $A$ is $o \( 1 \)$.

We give the averaging estimates used below in some detail, to specify both the cancellations and the absolute bounds.

#thm([Lemma 7.3.])[
  (Coefficient and averaging bounds).  #emph[Suppose that $D upright(bold(1)) = 0$, $max_x \( D^2 \)_(x x) lt.eq C_0$ and $max_(x \, y) \| D_(x y) \| lt.eq epsilon.alt = o \( 1 \)$. Then $parallel H parallel lt.eq C$, and 
$ \| H_(u u) \| lt.eq C \( l^(- 1) + \| D_(v v) \| + \| D_(u v) \| \) . $

 The conditional absolute mean of $\( H - H_0 \)_(u u)$ with $u$ fixed is at most $C \( 1 + sqrt(T) \) \/ sqrt(l)$, and the conditional second moment of $H_(u u)$ is at most $C \( 1 + T \) \/ l$. The kernel $\| \( H - H_0 \)_(u v) \|$ has every row and column sum at most $C \( 1 + sqrt(T) \) sqrt(l)$. After subtracting the single-$A$ term $- H_0 A H_0$, these absolute bounds gain a factor $C epsilon.alt$. All these statements remain valid if the possible partner set omits a fixed number of coordinates.]
  #emph[If $x \, y$ are arbitrary scalar arrays and $cal(I)$ is the allowed endpoint set, $m = \| cal(I) \|$, then the pure-swap single-$A$ contraction has the exact formula 
$ bb(E)_(cal(I)) \[ \( I^T x \)^T F A F \( I^T y \) \] = frac(2, m \( m - 1 \)) [Y_(cal(I)) chevron.l x_(cal(I)) \, y_(cal(I)) chevron.r + x_(cal(I))^T D_(cal(I) cal(I)) y_(cal(I)) - 2 sum_(u in cal(I)) D_(u u) x_u y_u] \, $

 where $Y_(cal(I)) = sum_(u in cal(I)) D_(u u)$. For full pairs the following additional identities hold: 
$ bb(E) "Tr" \( F A F K \) & = frac(2, l \( l - 1 \)) [Y X + "Tr" D^3 - 2 sum_u D_(u u) \( D^2 \)_(u u)] \,\
bb(E) "Tr" \( F K F K \) & = frac(2, l \( l - 1 \)) [X^2 + "Tr" D^4 - 2 sum_u \( D^2 \)_(u u)^2] \,\
bb(E) \[ \( I^T r \)^T F K F \( I^T r \) \] & = frac(2, l \( l - 1 \)) [g X + r^T D^2 r - 2 sum_u r_u^2 \( D^2 \)_(u u)] \, #h(2em) g = parallel r parallel^2 . $

]
] <lem:boundary-pair-averages>

#proof[
  Expand $H = H_0 - H_0 A H_0 + H_0 A H_0 A H_0 - dots.h.c$. Separate $H_0 = - sigma h F + O \( l^(- 1) \)$ in each word. For a diagonal coefficient starting at $u$, a word of pure swaps with at least one $A$ must touch either $D_(v v)$ or $D_(v u)$ at its first $A$ position. Every remaining $A$ factor has norm $O \( epsilon.alt \)$. Words whose first swap is not pure contribute $O \( l^(- 1) \)$, with the remaining series uniformly bounded. This proves the pointwise diagonal estimate and, without the zero-$A$ term, the corresponding estimate for $H - H_0$. The same first-position argument gives a row bound for the off-diagonal coefficient; symmetry gives the column bound. Use
  $ sum_v \| D_(u v) \| lt.eq sqrt(l C_0) \, quad sum_v \| D_(v v) \| lt.eq sqrt(l T) \, quad sum_v D_(u v)^2 lt.eq C_0 $
  to obtain the asserted averages and sums. A word with at least two $A$ factors has a further factor $C epsilon.alt$. Omitting a bounded number of coordinates changes these absolute averages by at most a fixed density factor for large $l$.
  For the signed formula expand the two-coordinate expression as
  $ x_u y_u D_(v v) + x_v y_v D_(u u) + \( x_u y_v + x_v y_u \) D_(u v) $
  and sum over $u eq.not v$ in $cal(I)$. The three remaining identities follow by exactly the same expansion, respectively with the second matrix $D^2$, with both matrices $D^2$, and with the rank-one matrix $r r^T$. No independence of entries is used. ◻
]

For later use, the preceding kernel bounds imply the following bilinear rule. Under a uniform pair, the absolute contribution of $H - H_0$ against two outer arrays $x \, y$ is at most

$ frac(C \( 1 + sqrt(T) \), l^(3 \/ 2)) parallel x parallel thin parallel y parallel . $

For a same-end term this is the conditional diagonal estimate and Cauchy–Schwarz; for an opposite-end term it is the row-and-column sum bound and the elementary Schur estimate. The remainder after the single-$A$ term gains $C epsilon.alt$. These statements also apply to restricted arrays after finitely many endpoint omissions.

#emph[The initial energy gap.] The stop estimates give bounded contrast-row and global-tail energies. The trace variables transfer directly: $Y = L_1$ at the stop. For the diagonal-square statistic $T$, write each $D_(x x)$ as the cleanup error $\( W - P_(< L) \)_(xi_x \, xi_x)$ plus the path-reference deviation from $\( Pi_(l_0) \)_(x x)$. The cleanup bound on $T_S$ and the return-square bound in Lemma 8 therefore give $T lt.eq n^eta$, after choosing smaller incoming losses. The same absolute path majorants give $hat(T) lt.eq n^eta$. More importantly, the averaged local identity gives a gap below one in the normalized boundary energy:

#[#set math.equation(numbering: n => "(7.7)")
 $ frac(h^2 X, l_0 - 1) lt.eq 1 - c_d n^(- theta) + O \( n^(- c_6) \) \, #h(2em) c_6 > theta . $ <eq:original-46>]

Indeed, expand $X = "Tr" \( Xi^T W Xi \)^2 - 2 F_1 + \( l_0 - 1 \)$ and use (4.11) to obtain

$ frac(h^2 X, l_0 - 1) = 1 - frac(alpha cal(T), l_0 - 1) - frac(2 h^2 L_1, l_0 - 1) + O \( n^(- c_2) + l_0^(- 1) \) . $

The cleanup lower bound gives $alpha cal(T) \/ l_0 gt.eq c_d n^(- theta)$, since $l_0 \/ \( n alpha_(*) \) asymp n^(- .35 a)$. The trace error and the displayed remainder have fixed power margins; choosing $theta$ below those margins proves (7.7). The remaining initial bounds needed below are

$ T + hat(T) lt.eq n^eta \, quad \| Y \| lt.eq n^(.09 a) \/ alpha_(*) \, quad \| hat(Y) \| lt.eq n^eta q^(L \/ 2) \, quad Z_D lt.eq C n^(v_(*)) \/ alpha_(*) . $

=== 7.4 Phase A: from averaged energy to small rows <subsec:boundary-phase-a>

The gap (7.7) is initially an averaged statement. We first make it grow as the boundary shrinks, then use it to contract every contrast row and every global tail. Entry estimates are maintained throughout so that all candidate precisions remain positive.

Choose the fixed exponents $g = r > 0$ sufficiently small in the order specified below, put $delta asymp n^(- g)$ and $l_2 asymp l_0 n^(- g - r)$, and set

$ macron(u)_l = frac(l, l + delta l_0) \, quad d_l = 1 - macron(u)_l \, #h(2em) omega_(l_0) = 1 \, quad omega_(l - 2) = omega_l \( 1 - d_l \/ l \) . $

Taking logarithms, and summing the $O \( l^(- 2) \)$ one-step error, gives $omega_l asymp \( macron(u)_l \/ macron(u)_(l_0) \)^(1 \/ 2)$. In particular $omega_(l_2) asymp n^(- r \/ 2)$. We maintain the following bounds simultaneously:

#[#set math.equation(numbering: n => "(7.8)")
 $ Z_D lt.eq sqrt(l) thin n^(- .1 a) \, #h(2em) \| Y \| + \| hat(Y) \| lt.eq 2 sqrt(l_0) thin n^(- .04 a) \, #h(2em) T + hat(T) lt.eq n^eta \,\
u_l := frac(h^2 X, l - 1) lt.eq macron(u)_l + o \( n^(- g) \) \,\
parallel D \( e_x - e_y \) parallel^2 lt.eq C_S omega_l \, #h(2em) parallel r_i parallel^2 lt.eq C_V omega_l \,\
max \| E_(i j) \| lt.eq C_E B_A \, #h(2em) E = W - hat(P) \, #h(2em) B_A = n^(.38 a) / sqrt(l_2) . $ <eq:original-47>]

The last maximum is over the three types of tracked output pairs. The constants in the row and entry bounds can take finitely many values, as specified at the exceptional events below. Initially they are chosen above the bounded initial energies. The row and entry account thresholds leave fixed slack inside these caps, to accommodate the power-small excesses obtained by extraction. The contrast bound gives an individual row bound because $D e_x = l^(- 1) sum_y D \( e_x - e_y \)$ and Jensen’s inequality applies.

==== Operator norm control <operator-norm-control>

The first estimate in (7.8) keeps the operator norm small relative to $sqrt(l)$. A fixed spectral moment suffices; the much higher moments used later for individual entries are not needed here. Fix the even integer $k = 8$. Orthogonal projection contracts every Schatten norm. In the expansion of $"Tr" \( D - D I H I^T D \)^k$, the words with exactly one update factor sum to $- k "Tr" \[ H \( I^T D^(k + 1) I \) \]$. The $H_0$ contribution has zero mean by centering. For the other part,

$ \| \( D^(k + 1) \)_(x y) \| lt.eq Z_D sqrt(\( \| D \|^k \)_(x x) \( \| D \|^k \)_(y y)) \, $

so Lemma 31 gives mean absolute value at most $C_k \( 1 + sqrt(T) \) \( Z_D \/ sqrt(l) \) "Tr" \| D \|^k \/ l$.

A word with $p gt.eq 2$ update factors has, after a cyclic permutation under the trace, gaps $a_1 \, dots.h \, a_p gt.eq 0$ with $sum_j a_j = k - p$. Its absolute trace is at most $C_k product_j m_(2 + a_j)$, where $m_s = "Tr" \( I^T \| D \|^s I \)$. Indeed $- \| D \|^s prec.curly.eq D^s prec.curly.eq \| D \|^s$, so the norm of $I^T D^s I$ is at most $m_s$. The product acts in dimension two. Interpolation of the positive spectral measure induced by the two selected coordinates gives $m_(2 + a) lt.eq m_2^(1 - a \/ \( k - 2 \)) m_k^(a \/ \( k - 2 \))$. Here $m_2 lt.eq 2 C_0$ and $sum_j a_j \/ \( k - 2 \) = \( k - p \) \/ \( k - 2 \) lt.eq 1$. Consequently the product is at most $C_k \( 1 + m_k \)$. Averaging $m_k$ gives $2 "Tr" \| D \|^k \/ l$. Under the bootstrap, $\( 1 + sqrt(T) \) Z_D \/ sqrt(l) = o \( 1 \)$, and hence

$ bb(E) "Tr" \| D' \|^k lt.eq \( 1 + C_k \/ l \) "Tr" \| D \|^k + C_k . $

Use the account with normalization $l_0 \( n^(v_(*)) \/ alpha_(*) \)^(k - 2)$. Its initial value is bounded by the initial row and norm estimates; the additive terms over all steps are bounded after this normalization. The discount loss is at most $n^(C'_k \( g + r \))$. Before this loss and the change from $l_0$ to $l$, its $k$th-root bound relative to $sqrt(l_0)$ is

$ (frac(n^(v_(*)), alpha_(*) sqrt(l_0)))^(1 - 2 \/ k) = n^(- .45 a \( 1 - 2 \/ k \) + o \( 1 \)) . $

Taking $g + r$ sufficiently small proves the norm bound in (7.8) with a strict power margin.

==== Trace and diagonal estimates <trace-and-diagonal-estimates>

We next control the traces appearing in signed averages. The diagonal statistic requires a separate argument: its growth must have an arbitrarily small power loss.

Expanding (7.5), using $Q^2 = Q$ and cyclicity of the trace, gives the following exact trace identities:

#[#set math.equation(numbering: n => "(7.9)")
 $ Delta Y =  & - "Tr" B A - "Tr" H \( K - A B A \) \,\
Delta X =  & - 2 "Tr" B K + "Tr" B A B A\
 & - 2 "Tr" H \( J - A B K - K B A + A B A B A \)\
 & + "Tr" H \( K - A B A \) H \( K - A B A \) . $ <eq:original-48>]

The factors follow from $Q = Pi_l - Pi_l I B I^T Pi_l$ and $D Pi_l = D$; in particular $I^T D Q D I = K - A B A$ and $I^T D Q D Q D I = J - A B K - K B A + A B A B A$.

For $Y$, centering gives $bb(E) "Tr" B A = 2 Y \/ \( l - 1 \)$ and $bb(E) "Tr" H_0 K = 0$. The single-$A$ term contributes $2 h^2 Y X \/ \[ l \( l - 1 \) \] + O \( \( 1 + Z_D \) \/ l \)$ by the first full-pair identity of Lemma 31. The remaining terms have mean absolute value at most $C \( T + 1 \) \/ l$: the pair $K$ is bounded, and $bb(E) parallel A parallel^2 lt.eq C \( T + 1 \) \/ l$. Also

$ bb(E) \( Delta Y \)^2 lt.eq C \( Z_D^2 + T + 1 \) \/ l . $

For the off-diagonal $H K$ term use $"Tr" D^4 lt.eq Z_D^2 X lt.eq C Z_D^2 l$; for its diagonal term use the conditional second-moment coefficient bound; the remaining terms use $bb(E) parallel A parallel^2$ and bounded $K \, H$. Thus the drift is a coefficient bounded in magnitude by $C \/ l$ times $Y$, plus absolute error $C \( Z_D + T + 1 \) \/ l$. The hatted argument is identical and uses $parallel hat(D) parallel lt.eq C \/ R_0$. Square accounts at scale $sqrt(l_0) n^(- .06 a)$ have initial bounded values. Indeed $alpha_(*) sqrt(l_0) asymp n^(.575 a)$ and $q^(L \/ 2) \/ sqrt(l_0) asymp n^(- .29 a)$. Their mean-error and variance budgets have a strict power margin at this scale. A discount loss $n^(C \( g + r \))$ is absorbed before extracting the stated trace caps.

We control $T$ by retaining the loss from deleted diagonals. For a surviving coordinate $x$, put $f_x = Pi_l e_x$ and $a_x = I^T D e_x$. Its new centered vector is $f_x + \( f_u + f_v \) \/ \( l - 2 \)$. The old-vector diagonal increment is $- a_x^T H a_x$; the centering correction has pointwise magnitude $C epsilon.alt \/ l$ and conditional absolute mean $C \/ l^(3 \/ 2)$. For the latter assertion, linear correction terms use $sum_u \| D_(x u) \| lt.eq C sqrt(l)$; update terms use bounded pair $H$ and the same row bound, and terms with two centering shifts carry $l^(- 2)$. Conditional on survival of $x$, the $H_0$ core mean is $O \( l^(- 2) \)$ by the centered-pair formula. The single-$A$ core mean is bounded by $C \( \| Y \| + Z_D + 1 \) \/ l^2$ by the restricted single-$A$ identity, whereas the higher remainder is bounded by $C epsilon.alt \( 1 + sqrt(T) \) \/ l^(3 \/ 2)$ by the bilinear rule. Under (7.8), $\( \| Y \| + Z_D \) \/ sqrt(l)$ is power-small.

For a fixed $x$, the second moment of the core increment is at most $C \( 1 + epsilon.alt^2 T \) \/ l^2$. Opposite-end terms use the product of the two row squared sums, divided by $l^2$. Same-end terms use the conditional bound on $H_(u u)^2$ and $sum_u D_(x u)^4 lt.eq epsilon.alt^2 sum_u D_(x u)^2 lt.eq C epsilon.alt^2$. The centering squares contribute at most $C epsilon.alt^2 \/ l$ when summed over $x$. Selection deletes diagonals with expected square mass exactly $2 T \/ l$. Finally, multiplying each conditional mean bound by $2 \| D_(x x) \|$ and using $sum_x \| D_(x x) \| lt.eq sqrt(l T)$ shows that the signed first-order cost is at most $C \( sqrt(T) + epsilon.alt T \) \/ l$. Young’s inequality absorbs this and the variance terms into a fixed portion of the deletion term, leaving

#[#set math.equation(numbering: n => "(7.10)")
 $ bb(E) T' lt.eq T + C \/ l . $ <eq:original-49>]

The proof with hats is the same. Normalize these accounts by a slightly larger arbitrarily small power of $n$ than their initial losses; since $sum l^(- 1) = O \( log n \)$, the total additive budget is bounded after this normalization. Extraction with another small power cushion gives $T + hat(T) lt.eq n^eta$.

==== Growth of the averaged gap <growth-of-the-averaged-gap>

We now compare the normalized energy $u_l$ with $macron(u)_l$. For $X$, the ideal averages in (7.9) are $- 4 X \/ \( l - 1 \)$, zero from $- 2 H_0 J$, and $2 h^2 X^2 \/ \[ l \( l - 1 \) \]$ from the quadratic term, with error $C \( 1 + Z_D^2 \) X \/ l^2$. The full-pair identities above give these coefficients directly. Furthermore $\| J_(x y) \| lt.eq Z_D sqrt(\( D^2 \)_(x x) \( D^2 \)_(y y))$; the bilinear coefficient rule bounds the $Delta H J$ mean by $C \( 1 + sqrt(T) \) \( Z_D \/ sqrt(l) \) X \/ l$. All remaining errors are bounded by $C \( epsilon.alt X \/ l + \( T + 1 \) \/ l \)$: terms with one small $A$ and pair $K$ use $parallel A parallel lt.eq C epsilon.alt$; terms with two $A$ factors use $bb(E) parallel A parallel^2 lt.eq C \( T + 1 \) \/ l$. The second-moment bound is

$ bb(E) \( Delta X \)^2 lt.eq C { 1 + Z_D^4 \/ l + \( 1 + T \) Z_D^2 \/ l } . $

Only the $H J$ term needs the last two quantities. For its off-diagonal part use $"Tr" D^6 lt.eq Z_D^4 X lt.eq C Z_D^4 l$; for the diagonal part use $\| J_(u u) \| lt.eq C Z_D$ and the conditional bound for $H_(u u)^2$. The other terms have bounded second moment because their pair factors are bounded. Including the changed denominator in $u_l = h^2 X \/ \( l - 1 \)$ gives

#[#set math.equation(numbering: n => "(7.11)")
 $ bb(E) Delta u_l lt.eq - 2 / l u_l \( 1 - u_l \) + n^(- c_7) / l \, #h(2em) sum_(l_2 lt.eq l lt.eq l_0) bb(E) \( Delta u_l \)^2 lt.eq n^(- c_8) $ <eq:original-50>]

for fixed positive $c_7 \, c_8$ after sufficiently small loss choices. For example the $Z_D^4 \/ l$ part of the last bound contributes at most $C n^(- .4 a) sum l^(- 1)$. The error terms in the first bound are powers because $Z_D \/ sqrt(l) lt.eq n^(- .1 a)$ and $epsilon.alt = n^(- r_P \/ 2)$.

The comparator satisfies $macron(u)_(l - 2) = macron(u)_l - 2 macron(u)_l \( 1 - macron(u)_l \) \/ l + O \( l^(- 2) \)$. The drift of a positive excess $u_l - macron(u)_l$ is at most $C \/ l$ times that excess plus $C n^(- c_7) \/ l$. Apply the square positive-excess account at scale $n^(- zeta_X)$, with

$ g + C \( g + r \) < zeta_X < 1 / 4 min \( c_7 \, c_8 \) . $

Such a choice exists by first making $g \, r$ smaller. Its discount loss is at most $n^(C' \( g + r \) + o \( 1 \))$, and its initial positive excess vanishes by (7.7), since $theta lt.double g$. The inequality $\( x + y \)_(+)^2 lt.eq x_(+)^2 + 2 x_(+) y + y^2$ and (7.11) therefore give $u_l lt.eq macron(u)_l + o \( n^(- g) \)$, with a power margin in the little-oh term.

==== Contraction of individual rows <contraction-of-individual-rows>

The averaged gap supplies a negative homogeneous term in each surviving row’s energy drift. Contrast rows have a homogeneous update. A global tail has one extra centering term while its short endpoint survives, and one exceptional transition when that endpoint is removed.

Let $f = e_x - e_y$ be a surviving contrast, and put $r_f = D f$, $g_f = parallel r_f parallel^2$, $a_f = I^T r_f$ and $b_f = I^T D r_f$. Since $Q f = f$ on its survival event, expansion of (7.5) gives

#[#set math.equation(numbering: n => "(7.12)")
 $ Delta g_f = - a_f^T B a_f - 2 a_f^T H b_f + 2 a_f^T H A B a_f + a_f^T H \( K - A B A \) H a_f . $ <eq:original-51>]

More generally the same identity describes the energy of a centered row updated homogeneously by $r' = Q \( r - D I H I^T r \)$. Write $g = parallel r parallel^2$, $a = I^T r$ and $b = I^T D r$. Suppose its entries are bounded by $C epsilon.alt$ and $g lt.eq C$. Conditioning the pair to omit a fixed number of coordinates where this same entry bound holds gives the following estimates.

First, deletion has upper mean $- 2 g \/ l + C epsilon.alt^2 \/ l$. The full $a^T H_0 b$ mean vanishes; on the restricted set the centered-pair formula bounds it by $C \/ l^2 + C Z_D g \/ l^3$. Here each omitted $r_s$ is $O \( epsilon.alt \)$, each omitted $\( D r \)_s$ is bounded by $sqrt(\( D^2 \)_(s s) g)$, and the restricted dot product is at most $Z_D g$ plus a bounded omission correction. The $Delta H$ contribution is at most $C \( 1 + sqrt(T) \) Z_D g \/ l^(3 \/ 2)$ by the bilinear rule applied to $r$ and $D r$. The term $a^T H A B a$ has upper absolute mean $C epsilon.alt g \/ l$. Finally the ideal quadratic term is nonnegative, so restricting the pair inflates its full mean by at most $1 + O \( l^(- 1) \)$. The last identity of Lemma 31 bounds that full mean by

$ frac(2 h^2 g X, l \( l - 1 \)) + frac(C \( 1 + Z_D^2 \) g, l^2) . $

Replacing $H$ by $H_0$, or $K - A B A$ by $K$, costs $C epsilon.alt g \/ l$ using bounded pair $K$ and $parallel H - H_0 parallel lt.eq C epsilon.alt$.

The leading deletion and quadratic terms therefore combine as

$ - frac(2 g, l) + frac(2 h^2 g X, l \( l - 1 \)) = - frac(2 g, l) \( 1 - u_l \) . $

This is where the averaged gap becomes a contraction for each row. Under the Phase A caps, $1 - u_l gt.eq \( 1 - o \( 1 \) \) d_l$. The error coefficients just listed are $o \( d_l \)$, since $d_l gt.eq c n^(- g)$ and $g$ is chosen below all their fixed exponent margins. We obtain

#[#set math.equation(numbering: n => "(7.13)")
 $ bb(E)_(upright("surv")) Delta g lt.eq - frac(1.5 d_l g, l) + n^(- c_9) / l $ <eq:original-52>]

for a fixed $c_9 > 0$. For the second moment of the homogeneous increment,

#[#set math.equation(numbering: n => "(7.14)")
 $ bb(E)_(upright("surv")) \( Delta g \)^2 lt.eq C (frac(epsilon.alt^2 g, l) + frac(Z_D^2 g^2, l^2) + frac(n^eta epsilon.alt^2 Z_D^2 g, l^2)) . $ <eq:original-53>]

To verify this bound, first consider the terms in (7.12) that do not involve $b$. Each is bounded by $C parallel a parallel^2$, so its square averages to $C epsilon.alt^2 g \/ l$. The opposite-end part of $a^T H b$ uses $parallel r parallel^2 parallel D r parallel^2 \/ l^2 lt.eq Z_D^2 g^2 \/ l^2$. For its same-end part, use the conditional bound $bb(E) H_(u u)^2 lt.eq C \( 1 + T \) \/ l$, the pointwise bound $\| r_u \|^2 lt.eq C epsilon.alt^2$, and $sum_u \( D r \)_u^2 lt.eq Z_D^2 g$. The finite sum of these terms changes constants only. The same identity also gives the pointwise bound $\| Delta g \| lt.eq C epsilon.alt$, since $\| b_s \| lt.eq sqrt(\( D^2 \)_(s s) g) lt.eq C$.

For a global tail with an active short endpoint, an ordinary event omits that endpoint. Its exact update is

$ r'_i = Q { r_i - D I H \( I^T r_i - k_i upright(bold(1))_2 \) } \, #h(2em) k_i = c_i \/ l . $

If its short endpoint is absent, put $k_i = 0$. To estimate the additional energy terms, write the additional vector as $k_i Q D I H upright(bold(1))_2$. Its cross term with $Q r_i$ involves $I^T D Q r_i = b_i - A B a_i$. Averaging its absolute value gives at most $C Z_D sqrt(g) \/ sqrt(l) + C sqrt(g) \/ sqrt(l)$ before multiplication by $\| k_i \| lt.eq l^(- 1)$. Its cross term with $Q D I H a_i$ is bounded in mean by $C sqrt(g) \/ l^(3 \/ 2)$, using bounded pair $K$ and $bb(E) parallel a_i parallel lt.eq C sqrt(g \/ l)$. The square of the additional vector is $O \( l^(- 2) \)$. Thus the additional mean budget is

$ C Z_D sqrt(g) \/ l^(3 \/ 2) + C \/ l^(3 \/ 2) + C \/ l^2 . $

It is power-small beyond $l^(- 1)$ under the Phase A norm bound. Its pointwise effect on the energy is $O \( l^(- 1) \)$, so it adds $C \/ l^2$ to the second-moment budget. Consequently (7.13)–(7.14) remain sufficient for ordinary global-tail steps, after decreasing $c_9$ and adding this summable term.

If $s \( i \)$ is selected, it disappears permanently and $Q Pi_l e_(s \( i \)) = 0$. The exact update instead gives the pathwise bound

#[#set math.equation(numbering: n => "(7.15)")
 $ parallel r'_i parallel lt.eq parallel r_i parallel + C sqrt(max_s \( D^2 \)_(s s)) . $ <eq:original-54>]

This is a single exceptional event for that row.

Apply upper positive-excess accounts to $g \/ omega_l$ above a fixed constant. Combining (7.13) with $omega_(l - 2) \/ omega_l = 1 - d_l \/ l$ leaves negative homogeneous drift; the remaining upper mean is at most $n^(- c_10) \/ l$. The sums of the second moments after division by $omega_l^2$ are power-small. Explicitly, $omega_l gt.eq c n^(- r \/ 2)$ gives

$ sum frac(epsilon.alt^2 g, l omega_l^2) lt.eq C epsilon.alt^2 n^(r \/ 2) log n \, #h(2em) sum frac(Z_D^2 g^2, l^2 omega_l^2) lt.eq C n^(- .2 a) log n \; $

the third term of (7.14) is bounded by the product of these small factors up to $n^eta$, and the additional $l^(- 2)$ terms sum to $O \( n^r \/ l_2 \)$. The change of normalization contributes only $O \( l^(- 2) \)$ to this normalized second budget. Normalized pointwise increments are power-small because $epsilon.alt n^(r \/ 2) = o \( 1 \)$. The positive-excess account lemma, with a sufficiently small scale exponent and then a sufficiently large even order, controls all the polynomially many contrast and global labels simultaneously. Contrast labels die at endpoint selection. At the exceptional global event (7.15), the contrast bound gives $max_s \( D^2 \)_(s s) lt.eq C_S omega_l$; thus a larger fixed post-event threshold makes its positive excess zero. There is at most one such threshold increase per global row. This proves the row-energy line of (7.8).

==== Entry comparison in Phase A <entry-comparison-in-phase-a>

It remains to control $E = W - hat(P)$. For an entry whose short coordinates are not selected, both actual and reference outer rows are small at the chosen endpoints. This gives concentration. The finitely many selections of short coordinates are handled separately below.

For any two fixed surviving output vectors, the numerical update is

#[#set math.equation(numbering: n => "(7.16)")
 $ Delta E_(i j) = - \( I^T w_i \)^T H \( I^T w_j \) + \( I^T p_i \)^T hat(H) \( I^T p_j \) . $ <eq:original-55>]

For a contrast $f$, the rows here are $w_i = f + D f$ and $p_i = f + hat(D) f$. Call an event ordinary for this entry when its contrast labels survive and none of its active global short endpoints is selected. This omits at most a fixed number of coordinates from the uniform pair. On the allowed endpoint set, all actual and reference outer entries are $O \( epsilon.alt + l^(- 1) \)$, their full row norms are bounded, and their full sums are zero. The difference outers and the block $D - hat(D)$ have entry bounds $C B_A$ by the induction hypothesis.

The conditional absolute mean budget is

#[#set math.equation(numbering: n => "(7.17)")
 $ \| bb(E)_(upright("ord")) Delta E_(i j) \| lt.eq C {frac(1 + \| Y \| + \| hat(Y) \| + Z_D, l^2) + frac(B_A epsilon.alt, l) + n^eta / l^(3 \/ 2)} . $ <eq:original-56>]

To prove this, expand both coefficients in (7.16) around $H_0$. The zero-$A$ terms cancel in full-pair expectation. For the finitely many omitted coordinates, the centered-pair formula and bounded row entries give $C \/ l^2$. For the single-$A$ terms use the signed restricted identity in Lemma 31. Its diagonal factor is $\| Y \| + O \( 1 \)$, its cross factor is at most $Z_D$, and the outer dot products are bounded. This gives the first fraction, and the hatted version uses $parallel hat(D) parallel lt.eq C$. Replacing a pure swap by its $O \( l^(- 1) \)$ part gives smaller terms, since an outer same-end product has average $O \( l^(- 1) \)$ and an opposite-end product is bounded by the row norms.

For words with at least two $A$ factors, telescope the difference of the two products. A changed endpoint factor has size $C B_A$, and another endpoint factor contributes $C epsilon.alt$; averaging the outer product costs $C \/ l$. This gives $C B_A epsilon.alt \/ l$. If all endpoint factors are hatted, the difference is in an outer row. Its norm is bounded, and the hatted remainder kernel after the single-$A$ term is at most $C epsilon.alt \( 1 + sqrt(hat(T)) \) \/ l^(3 \/ 2)$ against bounded row norms. This is at most the last fraction of (7.17). Summation over longer words is justified by their common geometric factor $C epsilon.alt$; the number of possible locations of a specified changed factor is absorbed into that summation.

The conditional second moment is at most $C { 1 + n^eta \( epsilon.alt + l^(- 1) \)^2 } \/ l^2$. For opposite-end terms this is the product of two bounded row squared sums divided by $l^2$. For same-end terms use the allowed outer supremum and the conditional bound on $H_(u u)^2$ from the coefficient lemma; this gives the additional displayed factor. Bounding the two terms of (7.16) separately is sufficient for this estimate. For the pointwise difference, use

$ H - hat(H) = - H \( A - hat(A) \) hat(H) $

and telescope its outer factors. It gives $\| Delta E_(i j) \| lt.eq C B_A \( epsilon.alt + l^(- 1) \)$ on ordinary events.

The mean budget in (7.17), divided by $B_A$, and the second budget divided by $B_A^2$, have power-small sums. For example, the trace contribution to the first sum is bounded by

$ frac(C sqrt(l_0) n^(- .04 a), l_2 B_A) = C n^(- .42 a + \( g + r \) \/ 2) \, $

the last term contributes at most $C n^(eta - .38 a)$, and the second-moment sum is $O \( n^(- .76 a + o \( 1 \)) \)$. The norm term and the finite-size terms have still smaller bounds. The middle mean term gives $C epsilon.alt log n$. These explicit comparisons justify the required choice of the positive-excess scale exponent independently of its later moment order.

A surviving exceptional event selects a global short endpoint. Put $e_i = w_i - p_i$. An exact telescoping form of (7.16) is

$ Delta E_(i j) = - \( I^T e_i \)^T H \( I^T w_j \) - \( I^T p_i \)^T H \( I^T e_j \) + \( I^T p_i \)^T H \( A - hat(A) \) hat(H) \( I^T p_j \) . $

For a global–contrast entry, the contrast endpoint coordinates are omitted on every survival event, so its actual and reference outer entries are small. The only unsuppressed input error in this display is a contrast–contrast error; the coefficient on an input global–contrast error is $O \( epsilon.alt + l^(- 1) \)$. For a global–global entry, all input errors on the right are of global–contrast or contrast–contrast type. Thus choose the constant thresholds in the following finite order: first the contrast–contrast threshold, then pre-event and post-event global–contrast thresholds, and then global–global thresholds indexed by the number, zero, one or two, of short-endpoint removals. Increase each next threshold by a fixed amount exceeding the jump bound supplied by already chosen lower-type thresholds. For large $n$ the small feedback factor in the global–contrast case is absorbed by this cushion. Each exceptional event then resets the relevant positive and negative excesses to zero.

Initial entries are $o \( B_A \)$ by the cleanup bound, the taper-change bound and the fixed contrast combinations. Apply the positive-excess account lemma on ordinary events to both signs of every entry. Keep the family denominators fixed and drop dead contrast labels. The moment order is fixed large enough to overcome the polynomial number of labels; the ordinary discount budgets are summably power-small. The exceptional threshold rule is pathwise and costs no discount. This proves the entry line of (7.8), and hence also (7.6).

==== Simultaneous choice <simultaneous-choice>

The norm, trace, averaged-energy, row and entry estimates have all been derived under the current bounds (7.8). We now use them together to obtain those bounds at the next chosen state.

All the preceding accounts are placed in the same deterministic sum. Its initial value is $n^(o \( 1 \))$: the scalar accounts are bounded after normalization, each polynomial family of individual excess accounts has its fixed reciprocal-family weight and initially vanishing excess, and there are only $O \( log n \)$ retained spectral parameters. The only permitted polynomial discount losses in Phase A are the fixed spectral-moment, trace-square and scalar-comparator losses $n^(C \( g + r \))$. Their constants do not depend on the large moment orders later used for maximum extraction. First fix the initial row comparator constants and the spectral order $8$; then choose $g = r$ sufficiently small for those polynomial losses, the initial gap (7.7), and the fixed margins $a \, r_P$. Choose the positive-excess scale exponents next and their large even orders last. Arbitrarily small structural and diagonal losses are made smaller as necessary. This gives a joint induction for (7.8). In particular, for a fixed $0 < r_g < r \/ 2$ and all sufficiently large $n$, every surviving contrast squared energy and every global-tail squared energy at $l_2$ is at most $n^(- r_g)$.

=== 7.5 Phase B: entry concentration on the shrinking boundary <subsec:boundary-phase-b>

At $l_2$ every contrast row and global tail has power-small energy. We allow slightly larger energy bounds and use this margin to control entry errors down to $l_3$. Bounds on $Y$ and $hat(Y)$ are no longer needed; we retain the diagonal-square and entry estimates. Summing the Phase A entry second-moment bound to $l_3$ would give only $O \( l_3^(- 1) \)$, which is too large for the desired scale $B_B^2$. We will instead use the small row energies when estimating the difference of the actual and reference updates.

Fix $0 < r_v < r_s < r_g$, with strict power gaps, and put $G_S = n^(- r_s)$ and $G_V = n^(- r_v)$. The new barriers allow fixed multiples of these squared-energy scales. Choose $chi > r_s \, r_v$ as in the parameter hierarchy and let $l_3 asymp n^chi$. From $l_2$ down to $l_3$ maintain

$ parallel D \( e_x - e_y \) parallel^2 lt.eq C G_S \, #h(2em) parallel r_i parallel^2 lt.eq C G_V \, #h(2em) T + hat(T) lt.eq n^eta \, #h(2em) max \| E_(i j) \| lt.eq C B_B \, quad B_B = n^(.40 a) / sqrt(l_2) . $

The constants for global and entry labels again admit the finite exceptional-event enlargements described above. All initial values have power cushions. In particular (7.6) remains available. The individual row bound implied by contrasts gives

#[#set math.equation(numbering: n => "(7.18)")
 $ Z_D lt.eq parallel D parallel_(upright(F)) lt.eq C sqrt(l G_S) . $ <eq:original-57>]

The deterministic hatted row bounds are smaller than this scale.

==== Diagonal squares without a trace cap <diagonal-squares-without-a-trace-cap>

We retain (7.10) in this phase without controlling $Y$. For a fixed surviving coordinate the pure $H_0$ core mean is $O \( l^(- 2) \)$ by centering. Every other coefficient is bounded absolutely by the bilinear coefficient rule against a row with squared norm $C G_S$, giving $C \( 1 + sqrt(T) \) G_S \/ l^(3 \/ 2)$. The conditional absolute mean of the centering correction is now $C sqrt(G_S) \/ l^(3 \/ 2) + C epsilon.alt \/ l^2$. This follows from $sum_u \| D_(x u) \| lt.eq C sqrt(l G_S)$ in the linear correction and from the entry bound in the remaining two-shift terms.

The second moments, summed over surviving diagonals, are bounded by

$ C / l { G_S^2 + epsilon.alt^2 G_S \( 1 + T \) + epsilon.alt^2 } . $

For opposite-end core terms use $sum_x \( sum_u D_(x u)^2 \)^2 lt.eq C l G_S^2$ followed by the $l^(- 2)$ pair average. Same-end terms use the conditional bound for $H_(u u)^2$ and $sum_(x \, u) D_(x u)^4 lt.eq C epsilon.alt^2 l G_S$. The last term covers the centering squares. The signed first-order cost, after multiplying the preceding conditional means by $2 \| D_(x x) \|$ and summing, is at most

$ C / l { G_S \( 1 + sqrt(T) \) + sqrt(G_S) } sqrt(T) + C sqrt(l T) \/ l^2 . $

Deletion subtracts $2 T \/ l$. Since $G_S$ and $epsilon.alt$ tend to zero, the terms proportional to $T \/ l$ are absorbed directly; Young’s inequality absorbs the terms proportional to $sqrt(T) \/ l$, leaving $C \/ l$. The hatted proof is identical. This proves (7.10) again and hence the new arbitrarily small-loss barriers for $T \, hat(T)$.

==== Preserving the small row energies <preserving-the-small-row-energies>

For a surviving contrast apply (7.12). Now $X \/ l lt.eq C G_S$, and the relative error in the $Delta H$ cross term is $C n^eta Z_D \/ sqrt(l) lt.eq C n^eta sqrt(G_S) = o \( 1 \)$. The quadratic finite-size error $Z_D^2 \/ l$ and the small coefficient errors are also $o \( 1 \)$. The omitted-coordinate error is at most $C epsilon.alt^2 \/ l$, as before. Consequently

#[#set math.equation(numbering: n => "(7.19)")
 $ bb(E)_(upright("surv")) Delta g_f lt.eq - c g_f \/ l + C \( epsilon.alt^2 \/ l + l^(- 2) \) $ <eq:original-58>]

with a fixed $c > 0$. Using $g_f lt.eq C G_S$ and (7.18), the sum of (7.14) divided by $G_S^2$ is at most

$ C \( epsilon.alt^2 \/ G_S + G_S + n^eta epsilon.alt^2 \) log n = o \( 1 \) $

by a power. The normalized additive drift has sum $O \( \( epsilon.alt^2 \/ G_S \) log n + 1 \/ \( l_3 G_S \) \)$, also power-small. For a pointwise bound, $\| a_f \| lt.eq C epsilon.alt$ and $\| \( D r_f \)_u \| lt.eq C G_S$; hence the increments in (7.12), divided by $G_S$, are power-small. The upper positive-excess account at the loosened scale $G_S$ therefore keeps all contrast barriers.

For an ordinary global-tail step the homogeneous calculation is the same, with $g lt.eq C G_V$. The extra shift from $k_i = c_i \/ l$ has mean absolute cross budget

$ C sqrt(G_S) sqrt(g) \/ l + C G_S \/ l^2 + C sqrt(g) \/ l^(3 \/ 2) . $

Here use $parallel D r parallel \/ sqrt(l) lt.eq C sqrt(G_S) sqrt(g)$ and $\( D^2 \)_(s s) lt.eq C G_S$ in the exact shift calculation from Phase A. Young’s inequality against a portion of the negative homogeneous drift leaves upper drift $C \( G_S + epsilon.alt^2 \) \/ l + C \/ l^2$. Its sum divided by $G_V$ is power-small because $r_v < r_s$ and $l_3 G_V arrow.r oo$. The homogeneous variance divided by $G_V^2$ has the bound

$ C \( epsilon.alt^2 \/ G_V + G_S + n^eta epsilon.alt^2 G_S \/ G_V \) log n \, $

which is power-small. The shift has pointwise energy effect at most $C \( sqrt(G_S g) + G_S \) \/ l$ and contributes a smaller summable second budget. Homogeneous normalized increments are small by $\| a \| lt.eq C epsilon.alt$ and $\| b_u \| lt.eq C sqrt(G_S G_V)$. Thus the same account lemma keeps the global barrier. The single exceptional event (7.15) is absorbed by a fixed threshold increase; its additional squared scale is $G_S lt.double G_V$.

==== Entry concentration down to $l_3$ <entry-concentration-down-to-l_3>

For an ordinary event of a tracked entry let $cal(I)_o$ be its allowed endpoint set. The outer arrays in (7.16) satisfy

#[#set math.equation(numbering: n => "(7.20)")
 $ parallel w_(cal(I)_o) parallel^2 + parallel p_(cal(I)_o) parallel^2 & lt.eq C W_g \, #h(2em) W_g = G_V + l^(- 1) \,\
parallel \( w - p \)_(cal(I)_o) parallel^2 & lt.eq C E_g \, #h(2em) E_g = min \( G_V \, l B_B^2 \) . $ <eq:original-59>]

For contrasts the identity coordinates have been omitted; for globals the short coordinate has been omitted and its remaining centering constant has squared norm $O \( l^(- 1) \)$. The actual tails have squared norm $C G_V$ and the reference tails are smaller by (7.4). Their difference has no short-coordinate term and has entry supremum $C B_B$, giving both bounds in the minimum. Every allowed outer entry is $O \( epsilon.alt + l^(- 1) \)$. Because the full arrays are centered and only boundedly many coordinates are omitted, their sums on $cal(I)_o$ are $O \( 1 \)$; the difference-array sums are $O \( B_B \)$.

We verify the ordinary conditional mean with these finer norms. For the ideal $H_0$ terms, the centered-pair formula gives $C B_B \/ l^2$. Its sum-product difference uses the preceding $O \( 1 \)$ and $O \( B_B \)$ bounds. Its dot-product correction has a coefficient $O \( l^(- 3) \)$ and a difference bounded by $C sqrt(l) B_B sqrt(W_g)$, which is smaller.

For single-$A$ pure-swap terms telescope the endpoint block and the two outer rows. The endpoint error block has diagonal sum and operator norm at most $C l B_B$. The signed restricted single-$A$ identity and (7.20) therefore give $C B_B W_g \/ l$ for an endpoint-block difference. For an outer-row difference with a hatted endpoint block, the diagonal sum of that block is at most $sqrt(l hat(T))$ and the dot difference is at most $C sqrt(l) B_B sqrt(W_g)$. After division by the pair count this is $C n^eta B_B sqrt(W_g) \/ l$. The cross contraction uses $parallel hat(D) parallel lt.eq C$ and gives the smaller bound $C B_B sqrt(W_g) \/ l^(3 \/ 2)$. The diagonal exclusions in the exact identity are smaller by the same restricted dot bounds. An $O \( l^(- 1) \)$ swap correction is also smaller: use either the endpoint-error supremum or a hatted endpoint supremum together with the outer difference, and then the extra $l^(- 1)$ coefficient.

For a word with at least two endpoint factors, a telescoping endpoint difference contributes $C B_B epsilon.alt W_g \/ l$. If all endpoint factors are hatted, the remainder coefficient kernel has bound $C n^eta epsilon.alt \/ l^(3 \/ 2)$; against outer norms $C sqrt(l) B_B$ and $C sqrt(W_g)$ this gives $C n^eta epsilon.alt B_B sqrt(W_g) \/ l$. The geometric series over additional endpoint factors converges uniformly. Combining these estimates, the sum of absolute conditional means divided by $B_B$ is bounded by

#[#set math.equation(numbering: n => "(7.21)")
 $ C sum_(l gt.eq l_3) {1 / l^2 + frac(G_V + l^(- 1) + n^eta \( sqrt(G_V) + l^(- 1 \/ 2) \), l)} . $ <eq:original-60>]

This is at most a constant times $l_3^(- 1) + G_V log n + n^eta sqrt(G_V) log n + n^eta l_3^(- 1 \/ 2)$, and is power-small when $eta$ is chosen below the fixed gaps.

The conditional second moment in (7.16) is bounded by the sum of three terms:

$ frac(C \( E_g W_g + B_B^2 W_g^2 \), l^2) \, #h(2em) frac(C n^eta B_B^2 W_g, l^2) \, #h(2em) frac(C B_B^2 \( epsilon.alt + l^(- 1) \)^2 W_g, l) . $

These are respectively: opposite-end terms after telescoping an outer or the coefficient; same-end terms with an outer error, using its entry supremum and the conditional square of $H_(u u)$; and same-end terms with a coefficient error, using $parallel H - hat(H) parallel lt.eq C B_B$ and the allowed outer supremum. There are only finitely many two-coordinate terms, so squaring their sum changes a fixed constant. After division by $B_B^2$, the first numerator uses $E_g lt.eq C l B_B^2$ and its sum is bounded by $C sum W_g \/ l + C sum W_g^2 \/ l^2$. The other two sums are smaller by the displayed factors. All are power-small by the same calculation as (7.21). The pointwise ordinary bound is again $\| Delta E_(i j) \| lt.eq C B_B \( epsilon.alt + l^(- 1) \)$.

Use positive-excess accounts for both signs at the loosened scale $B_B$. Their normalized ordinary mean, variance and jump budgets are power-small. The same finite exceptional-event threshold hierarchy as in Phase A applies verbatim to the exact telescoping identity; surviving contrasts still exclude their identity coordinates.

To extract all the Phase B barriers jointly, reinitialize the row and entry accounts at $l_2$ with the loosened scales $G_S \, G_V \, B_B$, and use fixed reciprocal-family weights for their individual labels. The incoming power cushions make their initial excesses vanish; normalize the diagonal-square accounts with a slightly larger power than their incoming losses. The initial normalized total is $n^(o \( 1 \))$. The estimates above give bounded discount products for these accounts, so the common discounted sum has the same extraction margins throughout Phase B. At a state satisfying the caps, (7.6) first makes all candidate precisions positive and all candidate accounts defined. The minimizing pair then preserves the common sum, and extraction gives the caps at the next chosen state. This closes the induction from $l_2$ to $l_3$.

=== 7.6 The final matching <the-final-matching>

There are now few enough unresolved stubs that the entry bound implies an operator bound on the remaining boundary error block. This allows any final matching. A separate entry calculation will retain the scale $B_B$ without a factor $l_3$.

Pair the last $l_3$ stubs by any fixed perfect matching. In this subsection $P_f$ denotes the involution of this remaining matching, restricted to the current contrast space; let $V$ be the isometric inclusion of that space into vertex $upright(bold(1))^perp$. The remaining precision increment is $V \( h I - sigma P_f \) V^T$. Its ideal coefficient is $H_(f 0) = - sigma h P_f$, and the actual and reference coefficients are

$ H_f = H_(f 0) \( I + D H_(f 0) \)^(- 1) \, #h(2em) hat(H)_f = H_(f 0) \( I + hat(D) H_(f 0) \)^(- 1) . $

The entry barrier gives

$ parallel D parallel lt.eq parallel hat(D) parallel + parallel D - hat(D) parallel lt.eq C \/ R_0 + C l_3 B_B = o \( 1 \) . $

Thus both coefficients are bounded. The ideal inverse middle matrix is $- sigma P_f \/ h$. Its eigenvalues have fixed distance from zero, and its inertia agrees with that of $m \( h I - sigma P_f \)$. Perturbation by $D = o \( 1 \)$ preserves that inertia. The Schur-complement inertia identity therefore proves positivity of the final precision, at every primary point and both signs.

To retain the entry scale, we use the sparse rows of the reference inside the exact update. Let $C_(upright("err")) = V^T E V = D - hat(D)$, let $epsilon_i = V^T E e_i$, $p_i = V^T hat(P) e_i$, and put $z_i = hat(H)_f p_i$. The deterministic reference bounds imply

$ z_i = tilde(c)_i Pi_(l_3) e_(t \( i \)) + tilde(tau)_i \, #h(2em) \| tilde(c)_i \| lt.eq C \, #h(2em) parallel tilde(tau)_i parallel lt.eq C n^(- r_P) \, $

with the coordinate summand possibly absent. Indeed $H_(f 0)$ sends a short coordinate to its partner, and $hat(H)_f - H_(f 0)$ acting on that coordinate has power-small norm by the small reference rows and the bounded inverse. The old entry error yields

$ parallel epsilon_i parallel_oo lt.eq C B_B \, #h(2em) parallel epsilon_i parallel lt.eq C sqrt(l_3) B_B \, #h(2em) parallel C_(upright("err")) parallel_max lt.eq C B_B \,\
max_s parallel C_(upright("err")) e_s parallel lt.eq C sqrt(l_3) B_B \, #h(2em) parallel C_(upright("err")) parallel lt.eq C l_3 B_B . $

The exact two-reference Woodbury identity is

$ E'_(i j) = E_(i j) - epsilon_i^T z_j - z_i^T epsilon_j + z_i^T C_(upright("err")) z_j - \( epsilon_i - C_(upright("err")) z_i \)^T H_f \( epsilon_j - C_(upright("err")) z_j \) . $

It follows by substituting $H_f - hat(H)_f = - H_f C_(upright("err")) hat(H)_f$ in the two update formulas; thus it does not require either reference matrix to be invertible. Every linear displayed term is $O \( B_B \)$: use its bounded single coordinate part and the estimate $sqrt(l_3) n^(- r_P) = o \( 1 \)$ for its tail part. The two-coordinate term is bounded in the same way, using column norms for a coordinate–tail term and the operator norm for a tail–tail term. In addition $parallel epsilon_i - C_(upright("err")) z_i parallel lt.eq C sqrt(l_3) B_B$. The final quadratic term is consequently $O \( l_3 B_B^2 \) = o \( B_B \)$. This proves the final entry bound in Proposition 29.

The completed graph is simple and $d$-regular. Since no stubs remain, its precision is $M \( h \) = z \( h \) I - sigma A \( G \)$ on $upright(bold(1))^perp$. At the closest point $z \( h \) < 2 sqrt(q) + e \/ 20$, so positivity gives

$ max_(i gt.eq 2) \| lambda_i \( G \) \| < 2 sqrt(q) + e \/ 20 . $

The fixed stop configuration and completed matching define the same reference $hat(P)_(upright("fin")) \( h \)$ throughout the primary interval. Section 8 uses its diagonal derivative bound and $B_B = o \( sqrt(e) \)$ to obtain local spectral mass bounds. The retained stop-path estimates and the aggregate reference formula give the typical-edge bulk blocks, with a separate exceptional edge set allowed for each prescribed pair of bulk cutoffs. Finally, this stage has at most $d n \/ 2$ pair steps, polynomially many candidate pairs and output labels, a logarithmic number of retained points, and only fixed-degree moments and finite matrix operations. The smooth reference has a fixed finite coefficient cutoff of length $O \( log n \)$, and its coefficients and accounts use the rational choices specified for the algorithm. The common arithmetic-precision argument therefore gives polynomial bit complexity for all operations in this section. This completes the proof of Proposition 29.

== 8 Local projectors and exact spectral repair <sec:exact-repair>

Boundary completion leaves a simple regular graph whose nonconstant spectrum lies within $e \/ 20$ of the desired interval. We remove this error by switching edges. Two estimates make the switches effective: the spectral mass near each edge is small at every vertex, and the bulk resolvent has a prescribed $2$-by-$2$ block on most edges. We first derive these estimates, then prove a repair theorem that uses only these two properties and spectral confinement.

Throughout this section, put

$ q = d - 1 \, #h(2em) s = 2 sqrt(q) \, #h(2em) a = 10^(- 4) \, #h(2em) e = n^(- 2 \/ 3 + a) . $

All operators initially defined on $upright(bold(1))^perp$ are extended by zero on $"span" { upright(bold(1)) }$. Choose an orthonormal eigenbasis $v_2 \, dots.h \, v_n$ of $upright(bold(1))^perp$ for the adjacency matrix $A_G$, and write

$ A_G v_i = lambda_i v_i \, #h(2em) x_i^sigma = s - sigma lambda_i quad \( sigma in { + 1 \, - 1 } \) . $

The graph supplied by the pairing construction has $x_i^sigma > - e \/ 20$.

=== 8.1 Extraction of the local spectral estimates <extraction-of-the-local-spectral-estimates>

We extract the two local estimates from different features of the reference. For the spectral mass bound, a bounded diagonal derivative in $h$ gives a resolvent difference of order $sqrt(w)$, since $z \( h \) - s$ is quadratic in $h_c - h$, where $h_c = q^(- 1 \/ 2)$. A difference quotient then bounds the squared resolvent by $O \( w^(- 1 \/ 2) \)$, and hence the mass at slack at most $w$ by $O \( w^(3 \/ 2) \)$. The typical edge blocks will instead use the path information retained at the separation stop.

#thm([Lemma 8.1.])[
  (Projector estimate from diagonal comparison).  #emph[Assume $x_i^sigma > - e \/ 20$ for all nonconstant indices $i$ and both signs. Suppose the final resolvents $R_sigma \( z \) = \( z - sigma A_G \)^(- 1) \|_(upright(bold(1))^perp)$ at the primary points $z = z \( h \)$ satisfy the entry comparison 
$ max_p lr(|R_sigma \( z \( h \) \)_(p p) - m_h hat(P)_(upright("fin") \, p p)^sigma \( h \)|) lt.eq C B_B \, #h(2em) B_B = o \( sqrt(e) \) . $

 Suppose also that the same frozen reference is defined throughout the primary range and obeys 
$ sup_(h \, p) lr(|frac(d, d h) #scale(x: 120%, y: 120%)[\(] m_h hat(P)_(upright("fin") \, p p)^sigma \( h \) #scale(x: 120%, y: 120%)[\)]|) lt.eq C . $

 Assume the primary grid has bounded geometric spacing, as in the construction. Then, uniformly in $p$ and $sigma$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ sum_(i : thin x_i^sigma lt.eq w) \| v_i \( p \) \|^2 lt.eq C w^(3 \/ 2) #h(2em) \( 2 e lt.eq w lt.eq c_d \) . $ <eq:original-61>]

 The constant can be enlarged to make the same assertion valid for all larger $w$ in the bounded spectral range.]
] <lem:repair-projector>

#proof[
  List the primary gaps increasingly as $t_0 < t_1 < dots.h.c < t_N$, with $1 < r_min lt.eq t_(j + 1) \/ t_j lt.eq r_max$ for fixed constants $r_min \, r_max$. The closest gap is less than $e \/ 20$, and the largest gap is bounded below by a positive constant. For $2 e lt.eq w lt.eq c_d$, choose the least $j$ with $t_j gt.eq w$, and set $w_(-) = t_j$, $w_p = t_(j + 1)$. Choose $c_d$ small enough that this successor always exists. Then $w lt.eq w_(-) < w_p lt.eq r_max^2 w$ and $w_p - w_(-) gt.eq \( r_min - 1 \) w$. In particular both resolvents are positive. On each eigenspace,
  $ frac(1, \( x_i^sigma + w_p \)^2) lt.eq frac(\( x_i^sigma + w_(-) \)^(- 1) - \( x_i^sigma + w_p \)^(- 1), w_p - w_(-)) . $
  The identity $z \( h \) - s = \( 1 - sqrt(q) thin h \)^2 \/ h$ gives $\| h - h_(-) \| = O \( sqrt(w) \)$ for the corresponding primary parameters. The diagonal comparison and its derivative bound therefore give
  #[#set math.equation(numbering: n => "(8.2)")
   $ #scale(x: 120%, y: 120%)[\[] R_sigma \( s + w_p \)^2 #scale(x: 120%, y: 120%)[\]]_(p p) lt.eq frac(\[ R_sigma \( s + w_(-) \) - R_sigma \( s + w_p \) \]_(p p), w_p - w_(-)) lt.eq C / sqrt(w) . $ <eq:original-62>]
  Here the entry error contributes $O \( B_B \/ w \) = o \( w^(- 1 \/ 2) \)$ uniformly because $w gt.eq 2 e$. If $x_i^sigma lt.eq w$, the positive denominator $x_i^sigma + w_p$ is at most $C w$. Multiplying the preceding estimate by $C w^2$ proves (8.1). For $w$ bounded below by $c_d$, use $sum_i \| v_i \( p \) \|^2 lt.eq 1$ and enlarge the constant. ◻
]

==== Verifying the reference derivative <verifying-the-reference-derivative>

To apply Lemma 32, we need a derivative bound for the same reference at every primary parameter. Let $S_0$ be the boundary at the separation stop and $l_0 = \| S_0 \|$. Fix the entire matching added after this stop, independently of $h$. On the contrast space of $S_0$, let $P_f$ be its involution, and put

$ H_(f 0) = - sigma h P_f \, #h(2em) H_f = H_(f 0) \( I + hat(D)_0 H_(f 0) \)^(- 1) . $

Lemma 30 and the exact-reference construction following it, in particular (7.1)–(7.4), imply uniformly over the primary range

$ parallel hat(D)_0 parallel lt.eq C \/ R_0 \, #h(2em) parallel hat(D)_0 Pi e_t parallel + parallel partial_h hat(D)_0 Pi e_t parallel lt.eq n^(- c) \, #h(2em) parallel partial_h hat(D)_0 parallel lt.eq C \( 1 + L \)^4 $

for some fixed $c > 0$, after decreasing $c$ to absorb logarithms. For the last bound, differentiate the finite stop sum defining $hat(P)_0$ term by term, keeping its coefficients $Q_j$ and its taper fixed. By (4.8), the derivative of its $j$th term has norm at most $C j \( 1 + j \)^2 \/ h$. The primary interval is bounded away from zero, so summing over $j < L$ gives $C \( 1 + L \)^4$; compression by $V_0$ cannot increase this norm. Consequently $H_f$ is bounded and $H'_f$ has at most polylogarithmic norm. Moreover,

$ \( H_f - H_(f 0) \) Pi e_t = - H_(f 0) \( I + hat(D)_0 H_(f 0) \)^(- 1) hat(D)_0 H_(f 0) Pi e_t $

has power-small norm, as does its derivative: $H_(f 0) Pi e_t$ is a bounded multiple of the centered coordinate of the partner of $t$.

For a global vertex $p$, write the stop row as $p_(p \, 0) = c_p Pi e_(t \( p \)) + tau_p$, allowing the first term to be absent. Equation (7.2) gives power-small norms for $tau_p$ and $tau'_p$. Also $\| c_p \| + \| c'_p \| lt.eq C$: indeed $c_p = \( sigma h \)^r$ for a path length $r$, and $sup_(r gt.eq 0) r h^(r - 1)$ is bounded on the fixed primary range. The diagonal correction in the frozen reference is $- p_(p \, 0)^T H_f p_(p \, 0)$. Its terms containing a tail have bounded, in fact power-small, derivatives. For its remaining term, the ideal involution has no fixed point and hence

$ \( Pi e_t \)^T H_(f 0) Pi e_t = frac(sigma h, l_0) . $

The preceding coordinate estimate controls the replacement of $H_(f 0)$ by $H_f$, including its derivative. Finally the stop diagonal and its derivative are bounded by the return-path estimates and the virtual-path estimates. Since $m_h$ and $m'_h$ are bounded, the derivative hypothesis of Lemma 32 follows. The final entry comparison has error $O \( B_B \)$, and the chosen exponents give

$ B_B = n^(.40 a) / sqrt(l_2) asymp n^(- 1 \/ 3 + .325 a + \( g + r \) \/ 2) = o \( sqrt(e) \) . $

==== The bulk resolvent and its typical edge blocks <the-bulk-resolvent-and-its-typical-edge-blocks>

Set

$ t_(*) = 100 a \, #h(2em) b_(*) = 10 a \, #h(2em) W_b = n^(- 2 \/ 3 + t_(*)) \, #h(2em) M = ceil.l n^(1 \/ 3 + b_(*)) ceil.r . $

For a cutoff $w_B^sigma in \[ W_b \, 2 W_b \]$ avoiding the signed slacks ${ x_i^sigma : 2 lt.eq i lt.eq n }$, define

$ E_0^sigma = "span" { v_i : x_i^sigma < w_B^sigma } \, #h(2em) R_B^sigma = sum_(x_i^sigma gt.eq w_B^sigma) frac(v_i v_i^T, x_i^sigma) . $

The reciprocal is positive on its bulk subspace and zero on the complementary near subspace. The comparison block is

$ h_c = q^(- 1 \/ 2) \, #h(2em) m_c = frac(h_c, 1 - h_c^2) \, #h(2em) P_(upright("tree"))^sigma = m_c mat(delim: "(", 1, sigma h_c; sigma h_c, 1) . $

#thm([Lemma 8.2.])[
  (Bulk estimates and typical edges).  #emph[The projector estimate (8.1) implies 
#[#set math.equation(numbering: n => "(8.3)")
 $ sup_p #scale(x: 120%, y: 120%)[\[] \( R_B^sigma \)^2 #scale(x: 120%, y: 120%)[\]]_(p p) lt.eq C / sqrt(W_b) . $ <eq:original-63>]

 If $w_p asymp W_b$ is a primary gap, every entry of $R_B^sigma - R_sigma \( s + w_p \)$ is $O \( sqrt(W_b) \)$.]
  #emph[For the typical-edge assertion below, the additional inputs are the following specific conclusions at the separation stop:]
  + #emph[Only $O \( l_0 \)$ edges of $G$ were added after the stop, with $l_0 asymp n^(2 \/ 3 + .15 a)$. At most $n^(.08 + o \( 1 \))$ stop vertices have a nonempty actual nonbacktracking return of length at most $r_n = floor.l .08 log_q n floor.r + 2$.]
  + #emph[The number of actual nonbacktracking paths of any length $k < L$ between fixed endpoints is bounded by a constant. The stop reference is the weighted sum of these paths with coefficient $phi \( k \/ L \) \( sigma h \)^k$, up to a matrix whose entries are $o \( n^(- .04) \)$. The taper is bounded and equals one for $k lt.eq r_n$, and $h lt.eq h_c$.]
  + #emph[The final reference has the form $hat(P)_(upright("fin")) = hat(P)_0 - hat(P)_0 V_0 H_f V_0^T hat(P)_0$, where $V_0$ is an isometry from an $\( l_0 - 1 \)$-dimensional space, $parallel H_f parallel lt.eq C$, and $parallel hat(P)_0 parallel lt.eq C \( 1 + L \)^3$. At the comparison primary points the final resolvent has entry error $O \( B_B \) = o \( n^(- .04) \)$ relative to $m_h hat(P)_(upright("fin"))$.]
  #emph[The return count, multiplicity and virtual-path assertions are consequences of Lemmas 7 and 8; the norm bound is Lemma 9; the reference representation and final error are furnished by Section 7 and Proposition 29. All inputs are uniform in the primary points used below. For each pair of cutoffs as above, all but a fraction $O \( n^(- .1) \)$ of the oriented edges $\( p \, p' \)$ have, for both signs, their endpoint block of $R_B^sigma$ within $n^(- .024)$ of $P_(upright("tree"))^sigma$. The estimates are uniform in the cutoffs; their exceptional sets may depend on the cutoffs.]
] <lem:repair-bulk>

#proof[
  Partition the bulk slacks into dyadic intervals $\[ 2^j W_b \, 2^(j + 1) W_b \)$. Their contributions to $\[ \( R_B^sigma \)^2 \]_(p p)$ are at most $C \( 2^j W_b \)^(- 1 \/ 2)$ by (8.1). Their sum, followed by the bounded contribution from slacks bounded below by a constant, proves (8.3).
  On the excluded subspace the diagonal mass of $R_sigma \( s + w_p \)$ is at most $C W_b^(3 \/ 2) \/ W_b = C sqrt(W_b)$, since $x_i^sigma > - e \/ 20$ and $W_b gt.double e$. On the included subspace the positive difference of the reciprocal weights is
  $ 1 / x_i^sigma - frac(1, x_i^sigma + w_p) lt.eq frac(C W_b, \( x_i^sigma \)^2) . $
  Its diagonal mass is $O \( sqrt(W_b) \)$ by (8.3). Cauchy–Schwarz, applied separately to these two positive operators, gives the entry comparison.
  For the typical-edge assertion, the edges added after the separation stop contribute only $O \( l_0 \)$ exceptions. Set $r_n = floor.l .08 log_q n floor.r + 2 = .08 log_q n + O \( 1 \)$. At that stop, the global diagram estimate for one return shows that only $n^(.08 + o \( 1 \))$ vertices have a nonempty nonbacktracking return of length at most $r_n$. For an old edge with neither endpoint in this set, the direct edge is the only nonbacktracking path between its endpoints in the short range $1 lt.eq k lt.eq r_n - 1$: an alternative, closed with the direct edge, would give a nonempty endpoint return of length at most $k + 1 lt.eq r_n$, after stripping any terminal reversal. The diagonal short-path term is the identity. Bounded fixed-endpoint multiplicity bounds the remaining weighted actual paths, whose lengths begin at $r_n$, by
  $ C sum_(k = r_n)^(L - 1) q^(- k \/ 2) lt.eq C_d q^(- r_n \/ 2) = n^(- .04 + o \( 1 \)) . $
  The virtual and projection terms are smaller. Thus the stop reference has the normalized endpoint block
  $ mat(delim: "(", 1, sigma h; sigma h, 1) + O \( n^(- .04 + o \( 1 \)) \) . $
  The frozen correction is $- p_(p \, 0)^T H_f p_(p' \, 0)$, with $parallel H_f parallel lt.eq C$. The coefficient bound (4.8) gives
  $ sum_p parallel p_(p \, 0) parallel^2 lt.eq l_0 parallel hat(P)_0 parallel^2 lt.eq C l_0 \( 1 + L \)^6 . $
  Consequently, outside a fraction at most $n^(- .2)$ of the vertices, the squared row norms are at most $n^(- .03)$. Take the union of the exceptional sets for the two signs at their comparison points. Fixed degree transfers these vertex exceptions to the same order of edge exceptions, and the frozen correction is then $O \( n^(- .03) \)$. Finally, $h - h_c = O \( sqrt(W_b) \)$, the final entry error is $O \( B_B \)$, and the bulk entry comparison costs $O \( sqrt(W_b) \)$. These errors are smaller than $n^(- .024)$. All the exceptional fractions just counted are $O \( n^(- .1) \)$, as asserted. ◻
]

=== 8.2 A deterministic exact-repair theorem <a-deterministic-exact-repair-theorem>

#thm([Theorem 8.3.])[
  (Exact repair by simultaneous switches).  #emph[Fix an integer $d gt.eq 3$ and a constant $C_0 gt.eq 1$. Put 
$ q = d - 1 \, #h(2em) s = 2 sqrt(q) \, #h(2em) a = 10^(- 4) \,\
e = n^(- 2 \/ 3 + a) \, #h(2em) W_b = n^(- 2 \/ 3 + 100 a) \, #h(2em) M = ceil.l n^(1 \/ 3 + 10 a) ceil.r . $

 There are constants $n_0 \, k$, depending only on $d \, C_0$, and a deterministic algorithm with the following property for $n gt.eq n_0$.]
  #emph[Let $G$ be a simple $d$-regular graph on $n$ vertices. Let $v_2 \, dots.h \, v_n$ be an orthonormal eigenbasis of $A_G$ on $upright(bold(1))^perp$, with eigenvalues $lambda_i$, and put $x_i^sigma = s - sigma lambda_i$ for $sigma in { + 1 \, - 1 }$. Assume the following three properties.]
  + #emph[#emph[Spectral confinement.] For every $i = 2 \, dots.h \, n$ and both signs, $x_i^sigma > - e \/ 20$.]
  + #emph[#emph[Local spectral mass.] For every vertex $p$, both signs, and every $w in \[ 2 e \, 2 d \]$, 
$ sum_(2 lt.eq i lt.eq n\
x_i^sigma lt.eq w) \| v_i \( p \) \|^2 lt.eq C_0 w^(3 \/ 2) . $

]
  + #emph[#emph[Typical edge blocks.] For every pair $w_B^sigma in \[ W_b \, 2 W_b \] \\ { x_i^sigma : 2 lt.eq i lt.eq n }$, define 
$ R_B^sigma = sum_(2 lt.eq i lt.eq n\
x_i^sigma gt.eq w_B^sigma) frac(v_i v_i^T, x_i^sigma) . $

 All but a fraction $C_0 n^(- .1)$ of the $d n$ oriented edges $\( p \, p' \)$ satisfy the following bound for both signs: 
$ ∥mat(delim: "(", \( R_B^sigma \)_(p p), \( R_B^sigma \)_(p p'); \( R_B^sigma \)_(p' p), \( R_B^sigma \)_(p' p')) - frac(1, d - 2) mat(delim: "(", sqrt(q), sigma; sigma, sqrt(q))∥_max lt.eq n^(- .024) . $

 Here $parallel dot.op parallel_max$ is the largest absolute entry. The exceptional edge set may depend on the chosen pair of cutoffs.]
  #emph[Given the adjacency list of $G$, the algorithm finds $M$ vertex-disjoint switches, each deleting two edges and inserting two edges. In $O_(d \, C_0) \( n^k \)$ bit operations it outputs the adjacency list of a simple $d$-regular graph $G'$ on the same vertices such that 
$ - 2 sqrt(d - 1) < lambda_i \( G' \) < 2 sqrt(d - 1) #h(2em) \( 2 lt.eq i lt.eq n \) . $

 In particular, $G'$ is connected and nonbipartite.]
] <thm:exact-repair>

#proof[
  Fix one admissible bulk cutoff for each sign. We will bias the distribution of an edge pair so that its expected switch improves the near spectrum at both edges. Second moments control the error from using only $M$ switches and from eliminating the bulk. Finally, we realize the draws in a polynomial finite sample space and test every candidate exactly.
  #emph[Step 1: reduce positivity to the near subspace.] A draw consists of two oriented edges $g = \( u \, v \)$ and $j = \( x \, y \)$ of $G$. With $U_(g \, j) = \[ e_u - e_x \, e_v - e_y \]$, replace ${ u \, v } \, { x \, y }$ by ${ u \, y } \, { x \, v }$. This is a valid switch when its four endpoints are distinct and both inserted edges are absent from $G$. Figure 2 illustrates the operation. Degree-preserving switches are classical in regular-graph sampling [22]. Switching arguments for local Green-function comparison appear in [5] Sections 7 and 11 and [16] Sections 3 and 5; the distribution here is chosen to improve both signed near-edge forms. For a vertex-disjoint collection of $M$ valid switches, concatenate their columns to obtain $U$. The change of the signed precision is
  $ s I - sigma A_(G') = s I - sigma A_G + U C_sigma U^T \, $
  where
  $ C_sigma = "blockdiag" \( sigma F \, dots.h \, sigma F \) \, #h(2em) F = mat(delim: "(", 0, 1; 1, 0) . $
  All columns of $U$ lie in $upright(bold(1))^perp$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1.35), radius: 0.09978, stroke: none)
  content((0, 1.385), [$u$], anchor: "south")
  circle((1.8, 1.35), radius: 0.09978, stroke: none)
  content((1.8, 1.385), [$v$], anchor: "south")
  circle((0, 0), radius: 0.09978, stroke: none)
  content((0, -0.03528), [$x$], anchor: "north")
  circle((1.8, 0), radius: 0.09978, stroke: none)
  content((1.8, -0.03528), [$y$], anchor: "north")
  line((0, 1.35), (1.8, 1.35), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 0), (1.8, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0.9, -0.72), [Original edges])
  line((2.43, 0.675), (3.6, 0.675), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.25cm, fill: black)))
  circle((4.23, 1.35), radius: 0.09978, stroke: none)
  content((4.23, 1.385), [$u$], anchor: "south")
  circle((6.03, 1.35), radius: 0.09978, stroke: none)
  content((6.03, 1.385), [$v$], anchor: "south")
  circle((4.23, 0), radius: 0.09978, stroke: none)
  content((4.23, -0.03528), [$x$], anchor: "north")
  circle((6.03, 0), radius: 0.09978, stroke: none)
  content((6.03, -0.03528), [$y$], anchor: "north")
  line((4.23, 1.35), (6.03, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((4.23, 0), (6.03, 1.35), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((5.13, -0.72), [Switched edges])
})],
    caption: [Figure 2: A degree-preserving switch deletes $u v$ and $x y$ and inserts $u y$ and $x v$. The four endpoints are distinct, and the inserted edges must be absent. The crossing in the right panel is not a vertex. With $U = \[ e_u - e_x \, e_v - e_y \]$ and $F$ the two-coordinate swap matrix, the adjacency change is $- U F U^T$. ],
  ) <fig:switch>
  For the fixed cutoffs, put $E_0^sigma = "span" { v_i : x_i^sigma < w_B^sigma }$, and let $U_E$ denote the coordinates of $U$ in this subspace. Define
  #[#set math.equation(numbering: n => "(8.4)")
   $ S_B = C_sigma^(- 1) + U^T R_B^sigma U . $ <eq:original-64>]
  The two original edges in a draw each contribute one endpoint block to $U^T R_B^sigma U$. Replacing these by their tree blocks and setting the cross-edge entries to zero gives the ideal $2$-by-$2$ block
  $ sigma F + 2 P_(upright("tree"))^sigma = frac(1, d - 2) mat(delim: "(", s, sigma d; sigma d, s) . $
  It has determinant $- 1$, one eigenvalue of each sign, and inverse
  #[#set math.equation(numbering: n => "(8.5)")
   $ K_sigma = frac(d, d - 2) mat(delim: "(", - s \/ d, sigma; sigma, - s \/ d) . $ <eq:original-65>]
  If $S_B$ is sufficiently close in norm to the block diagonal matrix of these ideal blocks, it has the same inertia as $C_sigma^(- 1)$. To see why this suffices even when some old near slacks are negative, let $D_B = "diag"_(\( E_0^sigma \)^perp) \( x_i^sigma \) > 0$ be the old bulk precision within $upright(bold(1))^perp$, and let $U_B$ be the bulk coordinates of $U$. The two Schur complements of
  $ mat(delim: "(", D_B, U_B; U_B^T, - C_sigma^(- 1)) $
  give
  $ "In" \( D_B \) + "In" \( - S_B \) = "In" \( - C_sigma^(- 1) \) + "In" \( D_B + U_B C_sigma U_B^T \) \, $
  where $"In"$ records positive, negative and zero eigenvalue counts. The equal middle inertias cancel, proving that the updated bulk precision $D_B + U_B C_sigma U_B^T$ is positive definite. Eliminating this bulk leaves the exact near Schur complement
  #[#set math.equation(numbering: n => "(8.6)")
   $ "diag"_(E_0^sigma) \( x_i^sigma \) + U_E S_B^(- 1) U_E^T . $ <eq:original-66>]
  This is the Woodbury identity on the positive old bulk [14]; no positivity of the old near block is required.
  #emph[Step 2: give the near spectrum a positive mean shift.] The inverse $K_sigma$ in (8.5) determines the ideal contribution of one switch after the bulk has been eliminated. Let $U_(E \, g \, j)$ denote the near coordinates of the two columns of $U_(g \, j)$, and put
  $ H^sigma = U_(E \, g \, j) K_sigma U_(E \, g \, j)^T . $
  Thus replacing $S_B^(- 1)$ in (8.6) by the block diagonal matrix with blocks $K_sigma$ replaces the near correction by $sum_(r = 1)^M H_r^sigma$. Since $K_sigma$ is indefinite, we must control this sum through the choice of the edge-pair distribution.
  First let $nu_0$ be the law of two independent uniformly chosen oriented edges. For $g = \( u \, v \)$ and nonconstant indices $i$, write
  $ z_i \( g \) = \( v_i \( u \) \, v_i \( v \) \)^T \, #h(2em) M_i = mat(delim: "(", 1, lambda_i \/ d; lambda_i \/ d, 1) . $
  Regularity and orthogonality give
  $ bb(E)_(nu_0) z_i \( g \) = 0 \, #h(2em) bb(E)_(nu_0) \[ z_i \( g \) z_k \( g \)^T \] = delta_(i k) / n M_i . $
  For indices in $E_0^sigma$, the entry of the single-switch correction is
  $ H_(i k)^sigma = \( z_i \( g \) - z_i \( j \) \)^T K_sigma \( z_k \( g \) - z_k \( j \) \) . $
  Its uniform mean is
  $ bb(E)_(nu_0) H_(i k)^sigma = frac(2 delta_(i k), n) "Tr" \( K_sigma M_i \) = - frac(4 delta_(i k) x_i^sigma, \( d - 2 \) n) . $
  Consequently the uniform mean correction only multiplies each old slack by $1 - 4 M \/ \( \( d - 2 \) n \) > 0$. It cannot turn a negative slack into a positive one. We therefore bias the correlations between the two edges on the modes closest to either threshold.
  Choose cutoffs $t_T^tau in \[ 2 e \, 3 e \]$ avoiding the signed slacks ${ x_i^tau : 2 lt.eq i lt.eq n }$, and set
  $ T_tau = { i : x_i^tau < t_T^tau } \, #h(2em) J_T asymp n^(3 a \/ 2 + a \/ 10) . $
  Define the tilted law $nu$ by multiplying the $nu_0$ probabilities by
  #[#set math.equation(numbering: n => "(8.7)")
   $ 1 + 1 / B_(*) [- frac(2 n, J_T) sum_(tau = plus.minus 1) sum_(i in T_tau) z_i \( g \)^T K_tau z_i \( j \)] \, $ <eq:original-67>]
  where $B_(*) > 0$ is a sufficiently large fixed constant. This is a positive probability density. Indeed, (8.1) and Cauchy–Schwarz bound the absolute value of the bracket by
  $ C frac(n e^(3 \/ 2), J_T) = O \( n^(- a \/ 10) \) = o \( 1 \) . $
  Every nonconstant eigenvector has mean zero on either endpoint of a uniform oriented edge. The bracket therefore has mean zero under $nu_0$ even when either edge is fixed. The density is normalized and both edge marginals under $nu$ remain uniform.
  Expansion under this tilted law gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ bb(E)_nu H_(i k)^sigma = delta_(i k) [- frac(4 x_i^sigma, \( d - 2 \) n) + frac(4, B_(*) J_T n) sum_(tau : thin i in T_tau) "Tr" \( K_sigma M_i K_tau M_i \)] . $ <eq:original-68>]
  The first term is the uniform mean computed above. In the tilt correction only the two cross-edge terms in the expansion of $H_(i k)^sigma$ survive. Each forces the two near indices to agree with the tilting index, and each contributes the same trace divided by $n^2$. Their negative signs cancel the negative sign in (8.7), giving the displayed factor $4 \/ \( B_(*) J_T n \)$.
  For a $sigma$-near mode, only $T_sigma$ can occur in the sum, since the two signed slacks add to $2 s$ and $2 W_b + 3 e = o \( 1 \)$. On these modes $M_i$ is uniformly positive definite, because $s < d$, and
  $ "Tr" \( K_sigma M_i K_sigma M_i \) = parallel M_i^(1 \/ 2) K_sigma M_i^(1 \/ 2) parallel_(upright(F))^2 gt.eq c_d . $
  The positive bias satisfies $M \/ \( J_T n \) asymp n^(- 2 \/ 3 + 8.4 a) gt.double e$. It overwhelms the possible slack $- e \/ 20$ on $T_sigma$. Outside $T_sigma$, the slack is at least $2 e$, and multiplication by $1 - 4 M \/ \( \( d - 2 \) n \) = 1 - o \( 1 \)$ preserves a fixed fraction of it. Thus the same law improves both signed forms:
  #[#set math.equation(numbering: n => "(8.9)")
   $ "diag" \( x_i^sigma \) + M bb(E)_nu H^sigma succ.curly.eq c e I quad upright("on ") E_0^sigma . $ <eq:original-69>]
  #emph[Step 3: restrict the draws to typical edges.] For the bulk cutoffs fixed in Step 1, keep only oriented edges whose endpoint blocks have the required accuracy for both signs. The numerical implementation below includes every edge with the proven $n^(- .024)$ accuracy and includes only edges with $C n^(- .02)$ accuracy. Condition $nu$ on both sampled edges lying in this set. The removed probability is $O \( n^(- .1) \)$. Approximate the resulting law in total variation by $n^(- C)$, for a sufficiently large fixed $C$, retaining a bound $C_d \/ \( d n \)^2$ for every point probability.
  For any draw, the projector estimate at scale $2 W_b$ gives
  $ parallel U_(E \, g \, j) parallel_(upright(F))^2 lt.eq C W_b^(3 \/ 2) \, #h(2em) parallel H^sigma parallel_(upright(F)) lt.eq C W_b^(3 \/ 2) . $
  Consequently, the restriction and the probability approximation change the left side of (8.9) by at most
  $ C M \( n^(- .1) + n^(- C) \) W_b^(3 \/ 2) = o \( e \) . $
  Denote the approximating law, including the probability rounding in Step 7, by $mu$. Unlike $nu$, it need not have exactly uniform marginals; the pointwise density bound is what the remaining estimates use.
  #emph[Step 4: control fluctuations and collisions.] Take $M$ draws with law $mu$, requiring only pairwise independence between draws. The bulk inverse error will be sandwiched by $U_E$, so a bound $parallel U_E U_E^T parallel = O \( M \/ n \)$ makes $o \( e n \/ M \)$ the bulk error scale needed to obtain an $o \( e \)$ error in the near form. We prove that, with probability $1 - o \( 1 \)$, simultaneously for both signs,
  #[#set math.equation(numbering: n => "(8.10)")
   $ & ∥sum_(r = 1)^M H_r^sigma - M bb(E)_mu H^sigma∥ = o \( e \) \,\
 & parallel U_E U_E^T parallel lt.eq C M \/ n \,\
 & ∥S_B - "blockdiag" \( sigma F + 2 P_(upright("tree"))^sigma \)∥ = o \( e n \/ M \) . $ <eq:original-70>]
  Here and below a block diagonal notation in this display has $M$ blocks. We supply all three second-moment estimates.
  Pairwise independence makes the cross terms in the squared Frobenius norm of a centered sum vanish. Hence
  $ bb(E) ∥sum_(r = 1)^M \( H_r^sigma - bb(E)_mu H_r^sigma \)∥_(upright(F))^2 lt.eq C M W_b^3 . $
  For the sum $U_E U_E^T$ the same estimate applies to its centered version. Uniform-density domination gives its mean the positive-order bound $C M I \/ n$: for any unit vector in the near subspace, average the squares of its four endpoint values and use that an endpoint of a uniform oriented edge is uniform on vertices. Since
  $ sqrt(M) thin W_b^(3 \/ 2) = n^(- 5 \/ 6 + 155 a + o \( 1 \)) lt.double e \, med M \/ n \, $
  Markov’s inequality proves the first two assertions.
  To prove the third, first retain the two endpoint blocks belonging to each separate sampled edge. They have error $O \( n^(- .02) \)$ by construction; after forming the difference columns this is still a block-diagonal operator error $O \( n^(- .02) \)$. All the other entries concern endpoints in different edge slots. This includes the two edge slots within a draw. Such a pair of edge slots has joint density bounded by a constant relative to two uniform oriented edges: within one draw this is the pointwise bound for $mu$, and between draws it follows from pairwise independence and the bounded marginal densities. For any prescribed endpoint in each slot, (8.3) therefore gives
  $ bb(E) lr(|\( R_B^sigma \)_(p q)|)^2 lt.eq C / n^2 sum_(p \, q) \| \( R_B^sigma \)_(p q) \|^2 lt.eq frac(C, n sqrt(W_b)) . $
  There are $O \( M^2 \)$ such entries. Passing from the endpoint columns to their differences has operator norm $sqrt(2)$, so the total squared Frobenius budget is at most $C M^2 \/ \( n sqrt(W_b) \)$ up to a fixed factor. Its square root obeys
  $ frac(M, sqrt(n) thin W_b^(1 \/ 4)) = n^(b_(*) - t_(*) \/ 4 + o \( 1 \)) = n^(- 15 a + o \( 1 \)) lt.double e n \/ M = n^(- 9 a + o \( 1 \)) . $
  This is exactly the strict inequality $t_(*) > 8 b_(*) - 4 a$. Also $n^(- .02) = o \( e n \/ M \)$. Markov’s inequality now proves the third assertion of (8.10). All the displayed separations have a fixed power margin, so the $o \( 1 \)$ probability bounds can be imposed simultaneously.
  The same density estimates show that endpoint coincidences within or between draws, or a proposed new edge already present in $G$, have total probability $O_d \( M^2 \/ n \) = n^(- 1 \/ 3 + 20 a + o \( 1 \)) = o \( 1 \)$. Indeed each particular coincidence or adjacency has probability $O_d \( 1 \/ n \)$; there are $O \( M^2 \)$ pairs of slots. Original edges have distinct endpoints by simplicity. On the complementary event all four endpoints of every switch are distinct and different switches are vertex-disjoint. Thus the switches are simultaneously valid, introduce neither loops nor repeated edges, and preserve every degree.
  The following ratios collect the margins used above. Fixed factors and integer rounding do not change their powers of $n$. The first ratio grows; every error ratio tends to zero for $a = 10^(- 4)$.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Contribution
], table.cell(rowspan: 1, colspan: 1)[Comparison scale
], table.cell(rowspan: 1, colspan: 1)[Ratio, up to fixed factors
]),
  table.cell(rowspan: 1, colspan: 1)[Mean bias $M \/ \( J_T n \)$
], table.cell(rowspan: 1, colspan: 1)[$e$
], table.cell(rowspan: 1, colspan: 1)[$n^(7.4 a)$
],
  table.cell(rowspan: 1, colspan: 1)[Conditioning error $M n^(- .1) W_b^(3 \/ 2)$
], table.cell(rowspan: 1, colspan: 1)[$e$
], table.cell(rowspan: 1, colspan: 1)[$n^(- .1 + 159 a)$
],
  table.cell(rowspan: 1, colspan: 1)[Near fluctuation $sqrt(M) thin W_b^(3 \/ 2)$
], table.cell(rowspan: 1, colspan: 1)[$e$
], table.cell(rowspan: 1, colspan: 1)[$n^(- 1 \/ 6 + 154 a)$
],
  table.cell(rowspan: 1, colspan: 1)[Bulk fluctuation $M \/ \( sqrt(n) thin W_b^(1 \/ 4) \)$
], table.cell(rowspan: 1, colspan: 1)[$e n \/ M$
], table.cell(rowspan: 1, colspan: 1)[$n^(- 6 a)$
],
  table.cell(rowspan: 1, colspan: 1)[Typical-block error $n^(- .02)$
], table.cell(rowspan: 1, colspan: 1)[$e n \/ M$
], table.cell(rowspan: 1, colspan: 1)[$n^(- .02 + 9 a)$
],
  table.cell(rowspan: 1, colspan: 1)[Collision probability $M^2 \/ n$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$n^(- 1 \/ 3 + 20 a)$
],
)
]
  Since $e = o \( M \/ n \)$, the near-fluctuation estimate also supplies the second line of (8.10). No common exceptional edge set over different cutoff pairs is used: the cutoffs were fixed before the law was conditioned.
  #emph[Step 5: conclude strict positivity at both edges.] For a collection satisfying all these conclusions, the inverse perturbation identity and the bounded inverse in (8.5) give
  $ ∥S_B^(- 1) - "blockdiag" \( K_sigma \)∥ = o \( e n \/ M \) . $
  Write $cal(K)_sigma = "blockdiag" \( K_sigma \, dots.h \, K_sigma \)$. The near Schur complement is exactly
  $ "diag" \( x_i^sigma \) + sum_(r = 1)^M H_r^sigma + U_E \( S_B^(- 1) - cal(K)_sigma \) U_E^T . $
  The last term has norm $o \( e \)$ by the second line of (8.10). The centered fluctuation and the change from $nu$ to $mu$ each cost another $o \( e \)$. The positive mean bound (8.9) therefore makes this Schur complement positive definite. The updated bulk was already positive definite. Thus the full signed precision is positive definite on $upright(bold(1))^perp$, for both signs. This proves the asserted strict spectral bounds for at least one collection.
  #emph[Step 6: compute rational approximations to the law.] It remains to find such a collection deterministically. All accuracies in this paragraph can be $n^(- C)$ for any sufficiently large fixed $C$. Use the rational matrix
  $ A_perp = A_G - d upright(bold(1)) upright(bold(1))^T \/ n \, $
  which agrees with $A_G$ on $upright(bold(1))^perp$ and has eigenvalue zero on the constant direction. For each sign, choose rational cutoffs for the eigenvalues of $sigma A_perp$, with the corresponding slack thresholds in the interiors of $\[ W_b \, 2 W_b \]$ and $\[ 2 e \, 3 e \]$, respectively. These cutoffs can have a gap at least an inverse polynomial from the spectrum. To see this, approximate $s$ to much greater precision, place more than $2 n$ rational candidates at spacing comparable to the interval width divided by $n$, and put disjoint small neighborhoods around them. At most $n$ neighborhoods can contain eigenvalues. Exact rational inertia tests at the endpoints, together with a zero-eigenvalue test at an endpoint, identify an empty neighborhood. Choosing the candidates in a fixed interior subinterval ensures that the error in approximating $s$ does not change the required slack interval.
  The projectors onto $T_tau$ and the operators $R_B^sigma$ can now be approximated in operator norm without resolving any internal eigenvalue spacings. On a fixed rational interval containing $\[ - d \, d \]$, define a continuous cutoff function equal to its required zero or one value outside the separating gap, with linear interpolation inside the gap. For the bulk reciprocal use a very accurate rational $tilde(s)$: set the function equal to $1 \/ \( tilde(s) - t \)$ on the bulk side and zero on the excluded side, and interpolate through the empty gap. These functions have polynomially bounded Lipschitz constants and rational values of polynomial bit length at rational arguments. The reciprocal approximation has an additional error at most $C \| tilde(s) - s \| \/ W_b^2$, which is made negligible by the chosen precision.
  After affine scaling to $\[ 0 \, 1 \]$, a function with Lipschitz constant $L_f$ has Bernstein polynomial [6] of degree $D$ with uniform error at most $L_f \/ \( 2 sqrt(D) \)$. This follows by writing the Bernstein polynomial as $bb(E) f \( X \/ D \)$ for $X tilde.op "Bin" \( D \, t \)$ and applying Cauchy–Schwarz to $bb(E) \| X \/ D - t \|$. Take a polynomially large degree $D$ to obtain the desired inverse-polynomial accuracy, and evaluate these rational polynomials at $sigma A_perp$. The spectral theorem transfers the scalar error to operator norm. Sandwich the resulting operators by $I - upright(bold(1)) upright(bold(1))^T \/ n$ to remove the artificial constant eigenvalue. Rational matrix-polynomial evaluation has polynomial bit complexity: the degree is polynomial, its coefficients have polynomial bit length, and direct products and sums increase bit lengths by at most polynomial factors.
  Use the approximate bulk blocks and approximate $P_(upright("tree"))^sigma$ to accept all edges with the proved $n^(- .024)$ accuracy and only edges with $C n^(- .02)$ accuracy. For example, use a rational entrywise threshold between these two scales; the approximation error is much smaller than either threshold. The sum in the tilt is basis-invariant: for endpoint indices $g_r \, j_t$ it equals
  $ sum_(r \, t = 1)^2 \( K_tau \)_(r t) \( "Proj"_(T_tau) \)_(g_r \, j_t) . $
  Thus the approximate projectors and rational approximations to $K_tau$ give rational positive weights for every accepted edge pair. Normalize these weights. Errors can be made small enough, including the factor $n \/ J_T$, that the law is within $n^(- C)$ in total variation of the conditional tilted law. Its point probabilities remain bounded by $C_d \/ \( d n \)^2$.
  #emph[Step 7: enumerate a polynomial sample space.] Choose a prime $P$ between $n^(C')$ and $2 n^(C')$, up to immaterial rounding, where $C'$ is a sufficiently large fixed constant and $P > M$. Bertrand’s theorem and deterministic trial search provide such a prime in time polynomial in $n$. There are $O_d \( n^2 \)$ accepted ordered edge-pair outcomes. Floor their probabilities times $P$, then distribute the remaining counts among the largest fractional remainders. The counts are nonnegative, sum to $P$, and differ by at most one from their unrounded values; outcomes outside the accepted support retain count zero. Assign that many residues of $bb(F)_P$ to each outcome. The total variation error is $O_d \( n^2 \/ P \)$ and the maximum probability increases by at most $1 \/ P$; both are within the stipulated bounds for large enough $C'$. Choose the preceding approximation precision and $C'$ so that their combined total-variation error is at most $n^(- C)$. The resulting rounded law is a choice of $mu$ with all the properties used in Steps 3–5.
  Use the standard affine construction of pairwise-independent variables (see [27] Section 2.2). Enumerate all $P^2$ seeds $\( gamma \, beta \) in bb(F)_P^2$ and use the residues
  $ gamma r + beta #h(2em) \( 1 lt.eq r lt.eq M \) $
  to select the draws. Under a uniform seed, any two residues are independent and uniform: for $r eq.not t$, the map $\( gamma \, beta \) mapsto \( gamma r + beta \, gamma t + beta \)$ is bijective since $r - t eq.not 0$ in $bb(F)_P$. Mapping residues to outcomes preserves pairwise independence. The estimates above therefore prove that a positive fraction, indeed a fraction $1 - o \( 1 \)$, of these seeds satisfy all the required events.
  For each seed, discard collections with intersecting endpoint sets or an invalid switch, build the candidate graph, and test its spectrum exactly. A rational contrast basis tests the positivity of
  $ 4 q I - A_(G')^2 quad upright("on ") upright(bold(1))^perp $
  by exact rational congruence and inertia. Positive definiteness gives the strict conclusion of the theorem. Symmetric elimination uses a nonzero diagonal pivot if available, otherwise an invertible off-diagonal $2$-by-$2$ pivot, with a remaining zero block contributing zero eigenvalues. Fraction-free arithmetic or determinant bounds keep all intermediate bit lengths polynomial: Schur-complement entries are ratios of minors of the original pivoted rational matrix. The same procedure implements the cutoff tests above. A passing seed exists by the preceding argument, and the number of seeds and all work per seed are polynomial in $n$.
  Finally, $d > 2 sqrt(d - 1)$. A disconnected regular graph has an additional $d$-eigenvector orthogonal to $upright(bold(1))$, and a bipartite regular graph has a $- d$-eigenvector. The verified strict bound excludes both possibilities. ◻
]

#prodef([Remark 8.4.])[
  (Inputs supplied by the pairing construction).  The theorem uses only the three stated properties of $G$. The completed pairing supplies $x_i^sigma > - e \/ 20$ and the final entry comparison. Its frozen-reference conclusions verify Lemma 32; its separation-stop path estimates verify the typical-edge assertion in Lemma 33. The repair therefore applies to precisely the graph constructed in the preceding sections, with no change of vertex set.
]

== 9 The algorithm and its bit complexity <sec:algorithm>

The preceding sections prove existence of a successful choice at every stage. During pairing, the algorithm chooses a minimizer of the discounted accounts; during repair, it enumerates a polynomial family of simultaneous switches and accepts the first graph passing an exact spectral test. We now verify that these operations fit the stated bit model, and then assemble the theorem. All computations use rational numbers, except for real quantities used solely to analyze their bounds.

#thm([Proposition 9.1.])[
  #emph[For each fixed $d$ and the fixed choices in Section 2.3, every stage of the preceding construction is implementable with polynomially many bit operations in $n$.]
] <prop:bit-complexity>

#proof[
  #emph[Rational parameters.] Choose dyadic rational representatives for all power scales, within the fixed factors allowed above. Comparisons for a fixed rational exponent can be made by integer powers, so these representatives require $O_d \( log n \)$ bits and are computable in polynomial time. Integer power comparisons similarly determine the logarithmic radii. Approximate the primary $h$ values to sufficiently high inverse-polynomial precision, strictly below $1 \/ sqrt(q)$; choose the small auxiliary spacings rationally and exactly equally spaced where required. The strict exponent margins preserve every estimate. The piecewise-polynomial cutoff for the smooth reference can have rational breakpoints and coefficients and fixed finite smoothness, for example by rescaling the integral of $t^j \( 1 - t \)^j$ at its transition intervals. Its Fourier transform is used only in the proof of an estimate, never by the algorithm.
  #emph[Candidate computations.] There are at most $O_d \( n^2 \)$ choices at a pairing step and $O_d \( n \)$ steps. Distances, stub eligibility, and exceptional-event flags are finite graph computations. The precision matrices have rational entries of polynomial bit length. Their inverses on $upright(bold(1))^perp$ can be computed in a rational contrast basis or after adding the constant projection. The coefficients of the path series are computed from the displayed matrix recurrence, of length $O_d \( log n \)$. The frozen reference is evaluated from its explicit Woodbury formula at the current matching, rather than through an uncontrolled sequence of rational expansions.
  The structural completion estimators are computed with the colorful dynamic program described in the structural section. Its shapes have $O_d \( log n \)$ vertices and bounded treewidth once the fixed excess cutoff has been chosen. The factor $2^(O \( k \))$ for the color subset and the $exp \( k \) k^(O \( log k \)) log n$ hash-family size are polynomial in $n$ when $k = O_d \( log n \)$. Pending-edge probabilities are rational products with $O_d \( log n \)$ factors. These observations give polynomial time and bit length for every such estimator.
  All moments have fixed integer order. Traces, squares, even powers, positive parts of rational numbers, comparator values, and uniform conditional expectations are therefore rational and computable in polynomial time. There are polynomially many accounts, including the fixed contrast labels and their pairs.
  #emph[Discounts.] At a step the expectation ratio for an account is computed from its undiscounted local statistic, its fixed phase baseline, and its comparator and event flags. It is not computed recursively from the discounted total. A sum over the polynomially many candidates has polynomial bit length. A discount is a product of polynomially many such ratios; consequently it too has polynomial bit length. Dynamic comparators are explicit rational functions or products of polynomially many polynomial-bit factors. Sums and comparisons of the discounted accounts can thus be carried out exactly.
  For completeness, the polynomial bit bounds for static matrix inverses follow from the determinant formula: after a common denominator is cleared, minors of a polynomial-bit matrix of dimension $O_d \( n \)$ have polynomial bit length by the determinant bound. Exact rational symmetric inertia can be computed by a nonzero diagonal pivot, or, if all diagonals vanish and a nonzero off-diagonal remains, by an invertible $2$-by-$2$ pivot. The remaining zero block contributes zero eigenvalues. Fraction-free elimination [4] Section I or the minor formulas give the same bit bound for intermediate quantities.
  #emph[Repair and verification.] The repair section constructs inverse-polynomially separated cutoffs, rational polynomial approximations to the required spectral functions, and a polynomial-size prime-field sample space. Enumerating that sample space and performing the graph updates therefore takes polynomial time. The precision exponent is fixed after the analytic margins have been chosen. In particular, after affine rescaling to $\[ 0 \, 1 \]$, if a spectral cutoff function has a known Lipschitz bound $L_f lt.eq n^c$ and the target error is $n^(- C)$, its Bernstein approximation may be taken of degree $D = ceil.l n^(2 \( c + C \)) ceil.r$, polynomial in $n$ for fixed $c \, C$. Its rational sample values and polynomial coefficients have polynomial bit length. Increasing the fixed precision and prime-denominator exponents pays for both the tilt factor $n \/ J_T$ and the total probability-rounding error.
  For each simple regular candidate, take the explicit rational contrast basis
  $ B = \[ e_1 - e_n \, dots.h \, e_(n - 1) - e_n \] . $
  Its columns are linearly independent and span $upright(bold(1))^perp$. The condition
  $ B^T \( 4 q I - A_G^2 \) B = 4 q B^T B - \( A_G B \)^T \( A_G B \) succ 0 $
  is equivalent to the strict nontrivial spectral bound and is decidable by exact rational inertia. Indeed, this congruence tests the quadratic form on all of $upright(bold(1))^perp$; an orthonormal basis is unnecessary. Regularity makes that subspace invariant under $A_G$, so the form is positive exactly when every eigenvalue there has square less than $4 q$. The repair theorem guarantees that the search finds a passing candidate with a strict spectral inequality.
  All constants, polynomial degrees, moment orders, and approximation exponents depend only on $d$. A sufficiently large finite exponent $k_d$ bounds their combined bit cost. This bound holds once the finitely many large-$n$ requirements are met. ◻
]

#proof[
  Start with $d$ distinguishable stubs at each of $n$ vertices. Apply Proposition 11, rejecting stub pairs whose vertices have distance at most the girth exclusion radius. The rejected-pair graph has maximum degree $O_d \( q^(g_0) \) = o \( l_0 \)$, so the candidate set is nonempty throughout this phase. Apply Proposition 22 to reach $l_0$ unresolved stubs. The structural estimates guarantee that these stubs lie at distinct vertices and are mutually separated, with no nonempty short nonbacktracking return at any remaining vertex.
  The reference construction and Proposition 29 then complete the configuration to a simple $d$-regular graph. For every primary parameter and both signs, its precision is positive; at the closest parameter this gives
  $ parallel A_G \|_(upright(bold(1))^perp) parallel < s + e \/ 20 . $
  The final entry comparison and the diagonal derivative bound for the same frozen reference give the local spectral mass estimate by Lemma 32. The retained path estimates at the separation stop, together with that entry comparison, give the typical bulk edge blocks by Lemma 33. These are precisely the remaining hypotheses of Theorem 34. Apply that theorem. This produces a simple $d$-regular graph on the same $n$ vertices with every nonconstant eigenvalue strictly in $\( - s \, s \)$.
  The exact-repair theorem also proves connectedness and nonbipartiteness. Proposition 36 supplies a finite exponent $k_d$ for the bit cost. Choose $n_0 \( d \)$ to satisfy the finitely many large-$n$ requirements in the construction. This proves all parts of Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Noga Alon. Eigenvalues and expanders. #emph[Combinatorica], 6(2):83--96, 1986. #link("https://doi.org/10.1007/BF02579166")[doi:10.1007/BF02579166].]
#bibitem([2])[Noga Alon. Explicit expanders of every degree and size. #emph[Combinatorica], 41(4):447--463, 2021. #link("https://doi.org/10.1007/s00493-020-4429-x")[doi:10.1007/s00493-020-4429-x].]
#bibitem([3])[Noga Alon, Raphael Yuster, and Uri Zwick. Color-coding. #emph[Journal of the ACM], 42(4):844--856, 1995. #link("https://doi.org/10.1145/210332.210337")[doi:10.1145/210332.210337].]
#bibitem([4])[Erwin~H. Bareiss. Sylvester's identity and multistep integer-preserving Gaussian elimination. #emph[Mathematics of Computation], 22(103):565--578, 1968. #link("https://doi.org/10.1090/S0025-5718-1968-0226829-0")[doi:10.1090/S0025-5718-1968-0226829-0].]
#bibitem([5])[Roland Bauerschmidt, Jiaoyang Huang, and Horng-Tzer Yau. Local Kesten--McKay law for random regular graphs. #emph[Communications in Mathematical Physics], 369(2):523--636, 2019. #link("https://doi.org/10.1007/s00220-019-03345-3")[doi:10.1007/s00220-019-03345-3].]
#bibitem([6])[S. Bernstein. Démonstration du théorème de Weierstrass fondée sur le calcul des probabilités. #emph[Communications de la Société mathématique de Kharkow], second series, 13(1):1--2, 1912. #link("https://www.mathnet.ru/eng/khmo107")[Math-Net.Ru: khmo107].]
#bibitem([7])[Yonatan Bilu and Nathan Linial. Lifts, discrepancy and nearly optimal spectral gap. #emph[Combinatorica], 26(5):495--519, 2006. #link("https://doi.org/10.1007/s00493-006-0029-7")[doi:10.1007/s00493-006-0029-7].]
#bibitem([8])[Charles Bordenave. A new proof of Friedman's second eigenvalue theorem and its extension to random lifts. #emph[Annales scientifiques de l'École normale supérieure], (4) 53(6):1393--1439, 2020. #link("https://doi.org/10.24033/asens.2450")[doi:10.24033/asens.2450].]
#bibitem([9])[Gil Cohen and Gal Maor. Quantitative results on super-Ramanujan graphs. Electronic Colloquium on Computational Complexity, Report TR26-163, September 2026. #link("https://eccc.weizmann.ac.il/report/2026/163/").]
#bibitem([10])[Michael~B. Cohen. Ramanujan graphs in polynomial time. In #emph[Proceedings of the 57th Annual IEEE Symposium on Foundations of Computer Science], pages 276--281, 2016. #link("https://doi.org/10.1109/FOCS.2016.37")[doi:10.1109/FOCS.2016.37].]
#bibitem([11])[Dominique Foata and Doron Zeilberger. A combinatorial proof of Bass's evaluations of the Ihara--Selberg zeta function for graphs. #emph[Transactions of the American Mathematical Society], 351(6):2257--2274, 1999. #link("https://doi.org/10.1090/S0002-9947-99-02234-5")[doi:10.1090/S0002-9947-99-02234-5]. Section locators refer to #link("https://arxiv.org/abs/math/9806037v1")[arXiv:math/9806037v1].]
#bibitem([12])[Joel Friedman. #emph[A Proof of Alon's Second Eigenvalue Conjecture and Related Problems]. Memoirs of the American Mathematical Society, 195(910), 2008. #link("https://doi.org/10.1090/memo/0910")[doi:10.1090/memo/0910].]
#bibitem([13])[Chris Hall, Doron Puder, and William~F. Sawin. Ramanujan coverings of graphs. #emph[Advances in Mathematics], 323:367--410, 2018. #link("https://doi.org/10.1016/j.aim.2017.10.042")[doi:10.1016/j.aim.2017.10.042]. Theorem locators refer to #link("https://arxiv.org/abs/1506.02335v4")[arXiv:1506.02335v4].]
#bibitem([14])[H.~V. Henderson and S.~R. Searle. On deriving the inverse of a sum of matrices. #emph[SIAM Review], 23(1):53--60, 1981. #link("https://doi.org/10.1137/1023004")[doi:10.1137/1023004].]
#bibitem([15])[Jiaoyang Huang, Theo McKenzie, and Horng-Tzer Yau. Ramanujan property and edge universality of random regular graphs. Preprint, 2024; revised February 2025. #link("https://arxiv.org/abs/2412.20263v2")[arXiv:2412.20263v2].]
#bibitem([16])[Jiaoyang Huang and Horng-Tzer Yau. Spectrum of random $d$-regular graphs up to the edge. #emph[Communications on Pure and Applied Mathematics], 77(3):1635--1723, 2024. #link("https://doi.org/10.1002/cpa.22176")[doi:10.1002/cpa.22176]. Section locators refer to #link("https://arxiv.org/abs/2102.00963v3")[arXiv:2102.00963v3].]
#bibitem([17])[Ali Jadbabaie, Amin Saberi, and Suvrit Sra. Kadison--Singer partitions and Bilu--Linial graph signings in polynomial time. Preprint, September 2026. #link("https://arxiv.org/abs/2609.23855v1")[arXiv:2609.23855v1].]
#bibitem([18])[Alexander Lubotzky, Ralph Phillips, and Peter Sarnak. Ramanujan graphs. #emph[Combinatorica], 8(3):261--277, 1988. #link("https://doi.org/10.1007/BF02126799")[doi:10.1007/BF02126799].]
#bibitem([19])[Adam~W. Marcus, Daniel~A. Spielman, and Nikhil Srivastava. Interlacing families I: Bipartite Ramanujan graphs of all degrees. #emph[Annals of Mathematics], 182(1):307--325, 2015. #link("https://doi.org/10.4007/annals.2015.182.1.7")[doi:10.4007/annals.2015.182.1.7].]
#bibitem([20])[Adam~W. Marcus, Daniel~A. Spielman, and Nikhil Srivastava. Interlacing families IV: Bipartite Ramanujan graphs of all sizes. #emph[SIAM Journal on Computing], 47(6):2488--2509, 2018. #link("https://doi.org/10.1137/16M106176X")[doi:10.1137/16M106176X].]
#bibitem([21])[G.~A. Margulis. Explicit group-theoretical constructions of combinatorial schemes and their application to the design of expanders and concentrators. #emph[Problems of Information Transmission], 24(1):39--46, 1988. Russian original: #emph[Problemy Peredachi Informatsii], 24(1):51--60, 1988. #link("https://www.mathnet.ru/eng/ppi686")[Math-Net.Ru: ppi686].]
#bibitem([22])[Brendan~D. McKay and Nicholas~C. Wormald. Uniform generation of random regular graphs of moderate degree. #emph[Journal of Algorithms], 11(1):52--67, 1990. #link("https://doi.org/10.1016/0196-6774(90)90029-E")[doi:10.1016/0196-6774(90)90029-E].]
#bibitem([23])[Sidhanth Mohanty, Ryan O'Donnell, and Pedro Paredes. Explicit near-Ramanujan graphs of every degree. #emph[SIAM Journal on Computing], 51(3):STOC20-1--STOC20-23, 2022. #link("https://doi.org/10.1137/20M1342112")[doi:10.1137/20M1342112].]
#bibitem([24])[Moshe Morgenstern. Existence and explicit constructions of $q + 1$ regular Ramanujan graphs for every prime power $q$. #emph[Journal of Combinatorial Theory, Series B], 62(1):44--62, 1994. #link("https://doi.org/10.1006/jctb.1994.1054")[doi:10.1006/jctb.1994.1054].]
#bibitem([25])[Moni Naor, Leonard~J. Schulman, and Aravind Srinivasan. Splitters and near-optimal derandomization. In #emph[Proceedings of the 36th Annual Symposium on Foundations of Computer Science], pages 182--191. IEEE Computer Society Press, 1995. #link("https://doi.org/10.1109/SFCS.1995.492475")[doi:10.1109/SFCS.1995.492475]. Theorem and section locators refer to the #link("https://www.wisdom.weizmann.ac.il/~naor/PAPERS/splitters.pdf")[authors' preliminary version].]
#bibitem([26])[A.~Nilli. On the second eigenvalue of a graph. #emph[Discrete Mathematics], 91(2):207--210, 1991. #link("https://doi.org/10.1016/0012-365X(91)90112-F")[doi:10.1016/0012-365X(91)90112-F].]
#bibitem([27])[Seth Pettie and Vijaya Ramachandran. Randomized minimum spanning tree algorithms using exponentially fewer random bits. #emph[ACM Transactions on Algorithms], 4(1):Article~5, 27 pages, 2008. #link("https://doi.org/10.1145/1328911.1328916")[doi:10.1145/1328911.1328916].]
#bibitem([28])[Prabhakar Raghavan. Probabilistic construction of deterministic algorithms: Approximating packing integer programs. #emph[Journal of Computer and System Sciences], 37(2):130--143, 1988. #link("https://doi.org/10.1016/0022-0000(88)90003-7")[doi:10.1016/0022-0000(88)90003-7].]
#bibitem([29])[Avi Wigderson and David Xiao. Derandomizing the Ahlswede--Winter matrix-valued Chernoff bound using pessimistic estimators, and applications. #emph[Theory of Computing], 4:53--76, 2008. #link("https://doi.org/10.4086/toc.2008.v004a003")[doi:10.4086/toc.2008.v004a003].]


