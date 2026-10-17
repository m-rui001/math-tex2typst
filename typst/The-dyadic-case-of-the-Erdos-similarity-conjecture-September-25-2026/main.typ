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

#align(center)[#text(size: 16pt, weight: "bold")[The dyadic case of the Erdős similarity conjecture]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $m$ denote Lebesgue measure on $bb(R)$. For a set $A subset.eq bb(R)$, a #emph[nontrivial affine copy] of $A$ is a set

$ x + s A = { x + s a : a in A } \, #h(2em) x in bb(R) \, quad s in bb(R) \\ { 0 } . $

The set $A$ is #emph[measure universal] if every Lebesgue-measurable subset of $bb(R)$ of positive measure contains such a copy. The Erdős similarity conjecture asserts that no infinite subset of $bb(R)$ is measure universal; the problem was posed by Erdős in #cite(label("Erdos1974Problems")) Problem 4.33.7\*. Every nonempty finite pattern $F$ is measure universal. Indeed, if a measurable set contains a subset $E_0$ of finite positive measure, translation continuity in $L^1$ gives $m \( ⋂_(a in F) \( E_0 - s a \) \) arrow.r m \( E_0 \) > 0$ as $s arrow.r 0$. A point in this intersection supplies an affine copy of $F$. The difficulty therefore lies in keeping infinitely many points in the same positive-measure set. We consider the single sequence

$ D = { 2^(- n) : n in bb(N) \, med n gt.eq 1 } . $

#thm([Theorem 1.1.])[
  #emph[For every $eta in \( 0 \, 1 \)$, there is a compact set $E_eta subset.eq \[ 0 \, 1 \]$ with $m \( E_eta \) > 1 - eta$ such that 
$ upright("for every ") x in bb(R) upright(" and every ") s in bb(R) \\ { 0 } \, quad x + s D subset.eq.not E_eta . $

 Equivalently, for every such $x \, s$ there is an integer $n gt.eq 1$ with $x + s 2^(- n) in.not E_eta$.]
] <thm:main>

Thus the dyadic sequence is not measure universal. The theorem concerns one infinite pattern and all of its signed affine copies; the conjecture for arbitrary infinite sets is not addressed. Compactness and the near-full-measure conclusion follow directly from the open sets used in the construction.

=== 1.1 Related results <related-results>

Classical results concern slowly decreasing sequences. Falconer #cite(label("Falconer1984")) and Eigen #cite(label("Eigen1985")) proved nonuniversality for positive sequences $a_n arrow.b 0$ with $a_(n + 1) \/ a_n arrow.r 1$; see also the proof in #cite(label("HumkeLaczkovich1998")) Corollary 1. Humke and Laczkovich give a finite hitting-set characterization and further relative-gap criteria #cite(label("HumkeLaczkovich1998")) Theorems 1–2. Kolountzakis’s finite-gap criterion uses arbitrarily large finite subsets of a positive sequence: the minimum gaps, divided by their largest points, must have negative logarithms growing sublinearly in the cardinalities #cite(label("Kolountzakis1997")) Theorem 3. Chlebík gives a translation-invariant formulation normalized by the diameter #cite(label("Chlebik2015")) Theorem 15. Dyadic subsets do not satisfy either condition: for $n gt.eq 2$ dyadic points $a_1 > dots.h.c > a_n$, the minimum gap is at most $a_(n - 1) lt.eq 2^(- \( n - 2 \)) a_1$, whereas the diameter $a_1 - a_n$ is at least $a_1 \/ 2$. Either normalized minimum gap is therefore at most $2^(- \( n - 3 \))$.

Additive structure gives another family of results. Bourgain proved that a sum of three infinite sets is nonuniversal #cite(label("Bourgain1987")), and Kolountzakis treated sums of two copies of certain sequences, including $D + D$ #cite(label("Kolountzakis1997")) Section 3.4. The distinction between the dyadic sequence and larger patterns is important. Mora Cuéllar, Iosevich, Kulkarni, Rojas Aravena and Yavicoli prove nonuniversality for the sum or difference of a nonconstant geometric sequence tending to zero and an arbitrary infinite set #cite(label("MoraCuellarEtAl2026Twofold")) Theorem 2. Their Introduction explicitly separates the single dyadic sequence from this two-fold sumset result. Avoiding a larger pattern does not imply avoidance of a subset of that pattern.

Iosevich, Kulkarni, Mora Cuéllar, Rojas Aravena and Yavicoli prove a nonuniversality criterion for sets supporting a Rajchman probability measure, that is, a probability measure whose Fourier transform tends to zero at infinity #cite(label("IKMRY2026Rajchman")) Theorem 1.5. A countable set cannot support such a measure #cite(label("IKMRY2026Rajchman")) Proposition 4.1, so that criterion does not apply to $D$. Their more general uniform-density criterion on the circle #cite(label("IKMRY2026Rajchman")) Proposition 3.2 also fails for $D union { 0 }$: for every integer $k gt.eq 1$, dilation by $2^k$ leaves its image modulo one unchanged, and that image stays a distance $1 \/ 4$ from $3 \/ 4$.

Other notions of size and other transformation classes also lead to different questions. For certain sequences tending to zero, Cruz, Lai and Pramanik obtain sets of Hausdorff dimension one avoiding affine copies of the sequence together with its limit point; the avoiding sets in their construction have Lebesgue measure zero #cite(label("CruzLaiPramanik2023")) preprint, Corollary 1.2 and Proposition 4.4. In the other direction, Feng, Lai and Xiong’s bi-Lipschitz embedding theorem applies to the dyadic sequence #cite(label("FengLaiXiong2024")) preprint, Theorem 1.1. Such nonlinear embeddings are compatible with the affine nonuniversality in Theorem 1. A separate earlier preprint of Cruz, Lai and Pramanik claiming the full similarity conjecture was withdrawn because of a gap in its Proposition 3.3 #cite(label("CruzLaiPramanik2020Withdrawn")).

=== 1.2 The construction <the-construction>

Our main step is to construct an open, $1$-periodic set of small density that meets every $x + t D$ with $x in bb(R)$ and $t in \[ 1 \, 2 \]$. The next section states this intermediate result precisely. Dyadic rescaling and reflection then produce a small open set meeting every signed affine copy of $D$; its complement in $\[ 0 \, 1 \]$ is the desired compact set. Periodic blocking sets and summable measure budgets also appear in #cite(label("IKMRY2026Rajchman")) Lemma 3.1 and Proposition 3.2; the finite construction below supplies the required hitting property for $D$.

Random cell constructions, discretization of the dilation parameter at a fixed center, and integration over centers occur in Kolountzakis #cite(label("Kolountzakis1997")) Section 3.2, Chlebík #cite(label("Chlebik2015")) Section 5, and Kolountzakis–Papageorgiou #cite(label("KolountzakisPapageorgiou2025")) Section 3.1. Exceptional centers are repaired by an open cover in Kolountzakis #cite(label("Kolountzakis1997")) Sections 2.2 and 3.2; Chlebík also describes adding the centers themselves when the pattern contains zero #cite(label("Chlebik2015")) Section 3, final remark. We use the open-neighborhood form, since $0$ is a limit point of $D$ but is not in $D$. An earlier attempt to extend the random-cell approach to the dyadic sequence is described by Solymosi #cite(label("Solymosi2011Sparse")) Section 3; that report does not claim a completed construction. The argument below implements these principles with separated index windows and a finite routing construction. All estimates needed for the proof are supplied here.

To construct the periodic set, we first assign each point of the line to one leaf of a finite ordered tree with $M$ children at each internal node and $d$ levels. Independent fair binary tables, evaluated on dyadic cells, determine the route. At each node, the first successful test chooses a child; if all tests fail, the last child is chosen by default. Each leaf carries a second table whose entries select points with a small prescribed probability $p$. This keeps the expected density small.

At a node, the default child is chosen only when all $M - 1$ tested bits vanish. Although this is rare for large $M$, taking the depth $d$ sufficiently large makes a default somewhere along the center’s route likely. At the first such node, all nondefault choices have been rejected by the center. Carefully chosen dyadic translates preserve the route to that node and its earlier rejections, but consult fresh entries at their current-window resolution. Many nondefault children and many translates then supply many potential hits.

Two features make those tests useful simultaneously for every normalized scale. First, an interval of dyadic indices is assigned to each edge, in the order in which the tree is traversed. Gaps between these intervals preserve the earlier routing decisions for all but a small set of centers. Second, each interval is long enough to control every cell resolution in its child subtree. This bounds the number of different local tests as the scale varies. We expose the tables in stages, proving that the terminal entries used by these adaptively chosen routes are distinct before multiplying their failure probabilities. A finite union bound then controls all scales in $\[ 1 \, 2 \]$.

The resulting set may still miss copies centered in a small closed set. An open neighborhood of those centers repairs every such copy, since $x + t 2^(- n)$ converges to $x$. This last step is what changes an estimate on exceptional centers into a statement valid at every center.

The windows and their spatial stability are constructed in Section 3. Section 4 defines the random set and proves the independent-trial estimate. Section 5 handles the continuum of normalized scales and removes the exceptional centers. Section 6 completes the signed-scale deduction of Theorem 1.

== 2 The periodic hitting problem <sec:periodic>

For a measurable $1$-periodic set $A subset.eq bb(R)$, write

$ rho \( A \) = m \( A ∩ \[ 0 \, 1 \] \) $

for its density in one period. We will sometimes identify such a set with its image in the circle $bb(T) = bb(R) \/ bb(Z)$, equipped with normalized Lebesgue measure. This identification preserves the density. Open or closed subsets of the circle lift to open or closed periodic subsets of $bb(R)$.

#thm([Lemma 2.1.])[
  (Periodic hitting sets).  #emph[For every $p in \( 0 \, 1 \)$, there exists an open $1$-periodic set $H subset.eq bb(R)$ such that $rho \( H \) lt.eq 6 p$ and 
$ forall x in bb(R) med forall t in \[ 1 \, 2 \] med exists n in bb(Z)_(gt.eq 1) : #h(2em) x + t 2^(- n) in H . $

]
] <lem:periodic>

The same set $H$ works for every center and every scale in the displayed interval. The witness $n$ may depend on both. In Section 6, we apply the lemma with a summable sequence of parameters, rescale the resulting periodic sets by powers of two, and include their reflections. This handles every nonzero real scale while keeping the total measure removed from $\[ 0 \, 1 \]$ small.

For the proof of Lemma 2, fix $p in \( 0 \, 1 \)$. We construct a random periodic set $B$ with expected density $p$, together with a finite set $cal(N)$ of positive integer indices. Outside a deterministic set of centers of density less than $p$, the probability that some $t in \[ 1 \, 2 \]$ avoids $B$ at all indices in $cal(N)$ will be at most $2 p$. We then enlarge $B$ to an open set, bound the expected measure of its exceptional centers, and cover those centers by a small open set. The last step uses further indices in the dyadic tail; $cal(N)$ need not provide the hits at the repaired centers.

== 3 Separated index windows <sec:windows>

We first assign a finite block of dyadic indices to every edge of an ordered tree. Gaps between the blocks will let small translations preserve earlier grid cells. Each block will also be long enough to control all resolutions needed below its child. These two properties will serve different purposes in the random construction.

=== 3.1 The tree and the window lengths <the-tree-and-the-window-lengths>

Fix $p in \( 0 \, 1 \)$. Choose integers $M gt.eq 2$ and $d gt.eq 1$ such that

#[#set math.equation(numbering: n => "(1)")
 $ frac(p \( M - 1 \), 2) gt.eq 10 \, #h(2em) \( 1 - 2^(1 - M) \)^d < p . $ <eq:tree-parameters>]

Such choices can be made in this order: the first inequality holds for large enough $M$, after which $0 < 1 - 2^(1 - M) < 1$ permits the second choice. Let $cal(T)$ be the complete ordered tree of height $d$ in which each internal vertex has $M$ children. Its root has height $d$, its leaves have height $0$, and the children of an internal vertex $P$ are $P_1 \, dots.h \, P_M$. Write $e = \( P \, i \)$ for the edge from $P$ to $P_i$. The finite total number of edges is

$ K = sum_(ell = 1)^d M^ell . $

List the edges in the following preorder: for each vertex $P$, list $\( P \, 1 \)$ and all edges below $P_1$, then $\( P \, 2 \)$ and all edges below $P_2$, and so on. Thus an edge together with all edges below its child forms one consecutive block in the list.

Choose an integer $g gt.eq 1$ such that

#[#set math.equation(numbering: n => "(2)")
 $ K 2^(2 - g) < p . $ <eq:gap-budget>]

This choice depends only on the already fixed tree. We will leave $g$ unused indices between consecutive windows.

The $M - 1$ nondefault child windows of a node, each of length $r$, will together supply $\( M - 1 \) r$ random tests at a fixed scale $t in \[ 1 \, 2 \]$. The exponential factor in the next inequality will bound the probability that all these tests fail. The preceding factor will bound the size of a finite list of scale values that represents every possible collection of local grid keys as $t$ varies. Making their product small will control all normalized scales by a finite union bound; Sections 4 and 5 prove these two bounds.

Choose an integer $r_(*) gt.eq 1$ such that, for every integer $r gt.eq r_(*)$,

#[#set math.equation(numbering: n => "(3)")
 $ 20 M r \( 1 + 2^(2 r + 2) \) exp #h(-0.16667em) (- frac(p \( M - 1 \), 2) r) < p . $ <eq:entropy-budget>]

For completeness, the left side is at most $100 M e^(- 7 r)$ when $r gt.eq 1$: use (1), $1 + 2^(2 r + 2) lt.eq 5 e^(2 r)$, and $r lt.eq e^r$. Hence any integer $r_(*) > log \( 100 M \/ p \) \/ 7$ works simultaneously for all larger $r$. The uniformity will allow us to enlarge windows as needed.

We assign a window length $r_h$ to edges whose parent has height $h$. At the same time we compute the span $sigma_h$ of all windows in a subtree of height $h$, including the gaps between them. Starting with $sigma_0 = 0$, define successively for $h = 1 \, dots.h \, d$

#[#set math.equation(numbering: n => "(4)")
 $ r_h & = max { r_(*) \, g + sigma_(h - 1) } \,\
sigma_h & = cases(delim: "{", M r_1 + \( M - 1 \) g \, & h = 1 \,, M \( r_h + g + sigma_(h - 1) \) + \( M - 1 \) g \, & h gt.eq 2 .) $ <eq:window-recursion>]

This is a finite bottom-up recursion: $r_h$ depends only on lengths already chosen below height $h$. In particular, the choice of $g$ did not depend on the sizes of these lengths.

Now place the actual integer windows in the edge preorder, starting at $3$. An edge $e$ from height $h$ receives $W_e = { a_e \, dots.h \, b_e }$ with $b_e = a_e + r_h - 1$; if $f$ immediately precedes $e$, set $a_e = b_f + g + 1$. Put

$ cal(N) = union.big_(e in cal(T)) W_e \, $

where the union is over the edges of the tree. The span interpretation of (4) follows by induction. At height $1$ there are $M$ windows and $M - 1$ gaps. At height $h gt.eq 2$, each child block consists of an incoming window of length $r_h$, one gap, and a subtree block of span $sigma_(h - 1)$; there are another $M - 1$ gaps between these child blocks.

For an edge $e = \( P \, i \)$, let $b_e^(*)$ be the largest window endpoint among $e$ and all edges below $P_i$. If $P$ has height $h = 1$, this block consists only of $e$, and its span is $r_1$. If $h gt.eq 2$, its span is $r_h + g + sigma_(h - 1)$. Therefore in both cases

#[#set math.equation(numbering: n => "(5)")
 $ b_e^(*) - a_e + 1 lt.eq r_h + g + sigma_(h - 1) lt.eq 2 r_h . $ <eq:padding>]

In particular, (3) applies to every length $r_h$, while (5) bounds a whole child block in terms of its incoming window. All edges, including those with child index $M$, receive windows under this construction.

The padding bound has a specific purpose: the range of window indices from $a_e$ through $b_e^(*)$ in a child block is controlled by the length of its incoming window. The gaps have a different role, established next: for most centers, translations indexed by a later window preserve the earlier cells used in the routing decisions. These are the two deterministic inputs to the routing and scale-counting arguments.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.5), [#text(size: 9pt)[Child blocks in edge preorder]], anchor: "west", padding: 0.1176cm)
  rect((0, 1.6), (1.35, 2.2), fill: rgb("#e6e6ff"), stroke: none)
  rect((1.35, 1.6), (3.95, 2.2), fill: rgb("#f0f0f0"), stroke: none)
  rect((0, 1.6), (3.95, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.35, 1.6), (1.35, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.675, 1.9), [#text(size: 9pt)[$W_((P,1))$]])
  content((2.65, 1.9), [#text(size: 9pt)[edges below $P_1$]])
  rect((4.5, 1.6), (5.85, 2.2), fill: rgb("#e6e6ff"), stroke: none)
  rect((5.85, 1.6), (8.45, 2.2), fill: rgb("#f0f0f0"), stroke: none)
  rect((4.5, 1.6), (8.45, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.85, 1.6), (5.85, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.175, 1.9), [#text(size: 9pt)[$W_((P,2))$]])
  content((7.15, 1.9), [#text(size: 9pt)[edges below $P_2$]])
  rect((9.4, 1.6), (10.75, 2.2), fill: rgb("#e6e6ff"), stroke: none)
  rect((10.75, 1.6), (13.35, 2.2), fill: rgb("#f0f0f0"), stroke: none)
  rect((9.4, 1.6), (13.35, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((10.75, 1.6), (10.75, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.08, 1.9), [#text(size: 9pt)[$W_((P,M))$]])
  content((12.05, 1.9), [#text(size: 9pt)[edges below $P_M$]])
  line((3.98, 1.9), (4.43, 1.9), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((8.89, 1.9), [#text(size: 9pt)[$dots.h$]])
  content((0, 0.95), [#text(size: 9pt)[One block, expanded for $h gt.eq 2$]], anchor: "west", padding: 0.1176cm)
  rect((1, 0.05), (7.1, 0.65), fill: rgb("#e6e6ff"), stroke: none)
  rect((7.7, 0.05), (12.35, 0.65), fill: rgb("#f0f0f0"), stroke: none)
  rect((1, 0.05), (7.1, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((7.7, 0.05), (12.35, 0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.05, 0.35), [#text(size: 9pt)[$W_e$: length $r_h$]])
  content((7.4, 0.35), [#text(size: 9pt)[$g$]])
  content((10.03, 0.35), [#text(size: 9pt)[below $P_i$: span $sigma_(h-1)$]])
  content((1, 0), [#text(size: 9pt)[$a_e$]], anchor: "north", padding: 0.1176cm)
  content((7.1, 0), [#text(size: 9pt)[$b_e$]], anchor: "north", padding: 0.1176cm)
  content((12.35, 0), [#text(size: 9pt)[$b_e^*$]], anchor: "north", padding: 0.1176cm)
  line((1, -0.65), (12.35, -0.65), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1, -0.55), (1, -0.75), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((12.35, -0.55), (12.35, -0.75), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.675, -0.7), [#text(size: 9pt)[$b_e^*-a_e+1=r_h+g+ sigma_(h-1) lt.eq 2r_h$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Each edge window precedes the windows below its child, and the child blocks are listed in order. The lower diagram includes the gap before a nonempty child subtree. An edge into a leaf has no following subtree or internal gap. Lengths are schematic. ],
) <fig:windows>

=== 3.2 Earlier grid cells remain unchanged <earlier-grid-cells-remain-unchanged>

For every nonnegative integer $b$, define the periodic cell key

#[#set math.equation(numbering: n => "(6)")
 $ J_b \( z \) = ⌊2^(b + 2) { z }⌋ \, #h(2em) { z } = z - floor.l z floor.r . $ <eq:grid-key>]

Its boundaries on the real line form the lattice $Gamma_b = 2^(- \( b + 2 \)) bb(Z)$. In particular, every integer is a boundary. Cells are half-open on the right, so a boundary belongs to the cell starting there. The grids are nested: for $B gt.eq b$,

#[#set math.equation(numbering: n => "(7)")
 $ J_b \( z \) = ⌊frac(J_B \( z \), 2^(B - b))⌋ . $ <eq:grid-nesting>]

This follows by writing $2^(B + 2) { z } = J_B \( z \) + epsilon$ with $0 lt.eq epsilon < 1$ and dividing by the integer $2^(B - b)$.

We seek centers for which translations indexed by one window preserve every earlier grid key. For a noninitial window $W_e$, let $b'$ be the endpoint of the immediately preceding window, and put $delta_e = 2^(1 - a_e)$. Call $x$ #emph[stable] if, for every such window,

#[#set math.equation(numbering: n => "(8)")
 $ \( x \, x + delta_e \] ∩ Gamma_(b') = diameter . $ <eq:stable-definition>]

Let $G$ denote the set of stable centers. The intervals in (8) are taken on the real line, so crossings of an integer are included without a separate convention on the circle.

#thm([Lemma 3.1.])[
  #emph[The set $G$ is measurable and $1$-periodic, and $rho \( G^c \) < p$. For every $x in G$, every window $W_e$, every $n in W_e$, every $t in \[ 1 \, 2 \]$, and every window $W_f$ earlier than $W_e$, 
#[#set math.equation(numbering: n => "(9)")
 $ J_(b_f) \( x + t 2^(- n) \) = J_(b_f) \( x \) . $ <eq:stable-keys>]

 These assertions include centers lying on grid boundaries.]
] <lem:stable>

#proof[
  For a fixed noninitial window, the centers violating (8) are exactly
  $ E_e = union.big_(beta in Gamma_(b')) \[ beta - delta_e \, beta \) \, $
  because $beta in \( x \, x + delta_e \]$ if and only if $beta - delta_e lt.eq x < beta$. This is a measurable periodic set. Since $a_e = b' + g + 1$,
  $ 2^(b' + 2) delta_e = 2^(2 - g) < p \/ K < 1 . $
  Thus these intervals have disjoint interiors modulo one. There are $2^(b' + 2)$ of them per period, each of length $delta_e$, and hence $rho \( E_e \) = 2^(2 - g)$. The complement of $G$ is the union of these sets over the $K - 1$ noninitial windows. Consequently
  $ rho \( G^c \) lt.eq \( K - 1 \) 2^(2 - g) < p . $
  This also proves measurability and periodicity of $G$.
  Now fix the data in (9). If $W_e$ is the first window, there is no earlier $W_f$. Otherwise $0 < t 2^(- n) lt.eq 2^(1 - a_e) = delta_e$, so stability implies that the interval $\( x \, x + t 2^(- n) \]$ contains no boundary of $Gamma_(b')$. Both endpoints therefore have the same $J_(b')$ key. This remains true when $x$ itself is a boundary, since it belongs to the cell on its right; landing on a boundary at a positive displacement has been excluded. An integer cannot lie in this interval either, so passing to periodic keys introduces no additional case. Finally, every earlier window satisfies $b_f lt.eq b'$, and (7) gives (9). ◻
]

The tree, all windows, and $G$ are now fixed before any random choices. The key agreement concerns earlier windows only. This is the property that will preserve the required earlier decisions while allowing tests at the current window’s finer resolution.

== 4 Random routing and independent tests <sec:routing>

We now use the windows from the preceding section to construct a random periodic set $B$ of expected density $p$. Selectors send each spatial point to one leaf of the tree, where an independent terminal entry decides membership in $B$. For a stable center, the first default choice on its path will provide several child windows in which to test nearby points.

=== 4.1 The tables and the selected set <the-tables-and-the-selected-set>

For each edge $e = \( P \, i \)$ with $i < M$, let

$ S_e : { 0 \, dots.h \, 2^(b_e + 2) - 1 } arrow.r { 0 \, 1 } $

be a random table whose entries are independent Bernoulli variables with parameter $1 \/ 2$. There is no selector table for the default edge $\( P \, M \)$. For a leaf $L$, let $b \( L \)$ be the endpoint of the window assigned to its unique incoming edge, and let

$ T_L : { 0 \, dots.h \, 2^(b \( L \) + 2) - 1 } arrow.r { 0 \, 1 } $

be a random table whose entries are independent Bernoulli variables with parameter $p$. All entries of all selector and terminal tables are mutually independent. The tree and every table are finite, so these variables define a finite product probability space $Omega$. We write $bb(P)$ and $bb(E)$ for its probability and expectation.

Given the tables and a point $z in bb(R)$, start at the root. At an internal node $P$, choose the first child $P_i$, $i < M$, for which

$ S_(\( P \, i \)) #scale(x: 120%, y: 120%)[\(] J_(b_(\( P \, i \))) \( z \) #scale(x: 120%, y: 120%)[\)] = 1 . $

If all $M - 1$ values are zero, choose the default child $P_M$. Continue until reaching a leaf, denoted by $L \( z \)$, and define

#[#set math.equation(numbering: n => "(10)")
 $ B = {z in bb(R) : T_(L \( z \)) #scale(x: 120%, y: 120%)[\(] J_(b \( L \( z \) \)) \( z \) #scale(x: 120%, y: 120%)[\)] = 1} . $ <eq:random-set>]

The table rules use only periodic keys. Since all grids in the construction are nested, membership in $B$ is constant on each cell of the finest grid used. Thus every realization of $B$ is a $1$-periodic measurable set, consisting of finitely many half-open cells per period.

Let $cal(S)$ be the sigma-field generated by every entry of every selector table. For fixed $z$, conditioning on $cal(S)$ fixes $L \( z \)$ and the key of its terminal entry. That entry still has probability $p$ of being one, since terminal tables are independent of all selectors. Hence

$ bb(P) \( z in B divides cal(S) \) = p . $

Integrating over one period and interchanging the integral with the finite weighted sum over $Omega$ gives

#[#set math.equation(numbering: n => "(11)")
 $ bb(E) rho \( B \) = integral_0^1 bb(P) \( z in B \) thin d z = p . $ <eq:mean-density>]

=== 4.2 Conditioning at a center <conditioning-at-a-center>

For a fixed center $x in bb(R)$, expose one entry from every selector table, including those in subtrees not visited by its path. The resulting sigma-field is

#[#set math.equation(numbering: n => "(12)")
 $ cal(F)_x = sigma (S_e #scale(x: 120%, y: 120%)[\(] J_(b_e) \( x \) #scale(x: 120%, y: 120%)[\)] : e = \( P \, i \) \, med i < M) subset.eq cal(S) . $ <eq:center-exposure>]

An atom $xi$ of $cal(F)_x$ means the event specifying all these exposed values; we write $bb(P) \( thin dot.op divides xi \)$ for conditioning on that event. Every such atom has positive probability. The exposed addresses $\( e \, J_(b_e) \( x \) \)$ are deterministic once $x$ is fixed, with the table name $e$ included in the address. Consequently, on each atom, all remaining selector entries retain their independent fair law, and all terminal entries retain their independent Bernoulli-$p$ law.

The exposed values determine the full path of $x$. When that path chooses a default child, let $U$ denote its first internal node at which this happens. Thus the existence and identity of $U$ are determined by $cal(F)_x$. The next estimate concerns the original product law, before an atom of $cal(F)_x$ is fixed.

#thm([Lemma 4.1.])[
  (A default choice on the center path).  #emph[For every fixed $x in bb(R)$, 
$ bb(P) #scale(x: 120%, y: 120%)[\(] upright("the path of ") x upright(" never chooses child ") M #scale(x: 120%, y: 120%)[\)] = \( 1 - 2^(1 - M) \)^d < p . $

]
] <lem:first-default>

#proof[
  At any internal node, the default child is chosen exactly when its $M - 1$ selector entries at $x$ are all zero. This has probability $2^(- \( M - 1 \)) = 2^(1 - M)$.
  To compute the probability along the path, reveal the entries at an internal node only when the path first reaches it. The decisions leading to that node use tables at its strict ancestors. Its own tables are distinct from all of those tables and have not yet been revealed, so their entries at $x$ remain independent fair bits, conditional on the preceding path history. At each of the $d$ internal-node decisions, the conditional probability of a non-default choice is therefore $1 - 2^(1 - M)$. Iterating this conditional probability gives $\( 1 - 2^(1 - M) \)^d$. The strict inequality is the choice of $d$ in (1). ◻
]

=== 4.3 Routing trials through the first default <routing-trials-through-the-first-default>

Fix henceforth a stable center $x in G$, and condition on an atom $xi$ of $cal(F)_x$ for which $U$ exists. The node $U$ is fixed under this conditioning. Let $h$ be its height, and write

$ r = r_h \, #h(2em) e_i = \( U \, i \) \, #h(2em) b_i^(*) = b_(e_i)^(*) quad \( 1 lt.eq i < M \) \, #h(2em) y_n \( t \) = x + t 2^(- n) . $

At $U$, all the exposed non-default selector values are zero.

For $i < M$ and $z in bb(R)$, let $L_i \( z \)$ be the leaf obtained by applying the same path rule starting at the child $U_i$. If $U_i$ is already a leaf, set $L_i \( z \) = U_i$. Define the local predicate

#[#set math.equation(numbering: n => "(13)")
 $ Q_i \( z \) = S_(e_i) #scale(x: 120%, y: 120%)[\(] J_(b_(e_i)) \( z \) #scale(x: 120%, y: 120%)[\)] thin T_(L_i \( z \)) #scale(x: 120%, y: 120%)[\(] J_(b \( L_i \( z \) \)) \( z \) #scale(x: 120%, y: 120%)[\)] . $ <eq:local-predicate>]

The function $Q_i$ takes values in ${ 0 \, 1 }$ and consults only the selector on $e_i$ and tables in the subtree rooted at $U_i$. It provides a sufficient condition for membership in $B$ at the points indexed by $W_(e_i)$.

#thm([Lemma 4.2.])[
  (Preservation of the route).  #emph[For every outcome in $xi$, every $i < M$, every $n in W_(e_i)$, and every $t in \[ 1 \, 2 \]$, the actual root path of $y_n \( t \)$ reaches $U$ and rejects children $1 \, dots.h \, i - 1$ there. In particular, 
#[#set math.equation(numbering: n => "(14)")
 $ Q_i \( y_n \( t \) \) = 1 quad arrow.r.double quad y_n \( t \) in B . $ <eq:local-hit>]

]
] <lem:routing>

#proof[
  Consider a strict ancestor $P$ of $U$, and let $P_a$ be its child on the path of $x$ to $U$. Since $U$ is the first default node, $a < M$. The decision at $P$ uses precisely the zero values of the selectors $1 \, dots.h \, a - 1$ and the value one of selector $a$. Each of the edges $\( P \, j \)$, $j lt.eq a$, precedes every edge in the subtree of $P_a$ in the prescribed preorder. Their windows therefore precede $W_(e_i)$. By the stable-key identity (9), each of these selector evaluations at $y_n \( t \)$ agrees with its evaluation at $x$. Induction from the root along the ancestor chain shows that $y_n \( t \)$ makes the same choices and reaches $U$. Later sibling selectors at an ancestor are not needed to make its choice.
  For every $j < i$, the edge $\( U \, j \)$ also precedes $e_i$. Its selector value at $x$ is zero, because $x$ takes the default child at $U$. Another application of (9) makes the corresponding value at $y_n \( t \)$ zero. Thus the actual path rejects children $1 \, dots.h \, i - 1$ at $U$.
  If $Q_i \( y_n \( t \) \) = 1$, the selector on $e_i$ is one, so the actual path chooses child $i$ at $U$. Its continuation is exactly the rule defining $L_i \( y_n \( t \) \)$, and the terminal entry in (13) is one. The membership rule (10) now gives $y_n \( t \) in B$. Figure 2 records this common-prefix and branching argument. All equalities used here hold for every completion of the unexposed tables and every $t in \[ 1 \, 2 \]$, as required. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 3.15), [#box(width: 4.3cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[common choices at strict ancestors]]])])
  content((0, 1.85), [#text(size: 9pt)[$U$]], frame: "circle", padding: 0.1058cm, stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 2.915), (0, 1.85), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 2.5), [#text(size: 9pt)[stable earlier keys]], anchor: "west", padding: 0.1176cm)
  content((-3, 0.15), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$U_i$, $i<M$]]])])
  content((3, 0.15), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff0e0"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$U_M$]]])])
  line((0, 1.85), (-2.547, 0.4069), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
  content((-1.5, 1), [#text(size: 9pt)[$y_n(t)$: selector $i$ succeeds#linebreak()earlier children rejected]], anchor: "south-east", padding: 0.1176cm)
  line((0, 1.85), (2.659, 0.343), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#cc6600"))))
  content((1.5, 1), [#text(size: 9pt)[$x$: all $M-1$ selectors vanish#linebreak()default choice]], anchor: "south-west", padding: 0.1176cm)
  content((-3, -1.075), [#text(size: 9pt)[local route to $L_i(y_n(t))$#linebreak()terminal entry equals $1$]])
  line((-3, -0.1069), (-3, -0.6069), stroke: (paint: rgb("#0000b2"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
})],
  caption: [Figure 2: Route preservation for $x in G$, $n in W_(\( U \, i \))$ and $t in \[ 1 \, 2 \]$, conditional on $Q_i \( y_n \( t \) \) = 1$. The center $x$ and its translate $y_n \( t \)$ make the same required choices above the first default node $U$. At $U$, the center takes child $M$, while the translate rejects the earlier children and takes child $i$. The local terminal success then places $y_n \( t \)$ in $B$. The diagram is conditional on the successful local predicate; it does not assume independence of the chosen leaves. ],
) <fig:routing>

=== 4.4 Independent terminal tests <independent-terminal-tests>

We now estimate the probability that all the local tests fail at one fixed scale. The selected leaves may depend on the selectors. To keep that dependence explicit, we first expose all selectors, identify the terminal entries being read, and then average over the selectors.

#thm([Lemma 4.3.])[
  (The fixed-scale estimate).  #emph[Fix a stable center $x$ and an atom $xi$ of the center-exposure sigma-field $cal(F)_x$ in (12), on which the first default node $U$ exists. Let $h$ be its height, put $r = r_h$, and use the local predicates $Q_i$ for $e_i = \( U \, i \)$, $1 lt.eq i < M$, defined in (13), with $y_n \( t \) = x + t 2^(- n)$. For every fixed $t in \[ 1 \, 2 \]$, 
#[#set math.equation(numbering: n => "(15)")
 $ bb(P) (Q_i \( y_n \( t \) \) = 0 upright(" for all ") 1 lt.eq i < M \, med n in W_(e_i) thin mid(bar.v) thin xi) = \( 1 - p \/ 2 \)^(\( M - 1 \) r) . $ <eq:fixed-scale-miss>]

]
] <lem:fixed-scale>

#proof[
  On the fixed atom $xi$, the node $U$, the windows $W_(e_i)$, and the set of pairs
  $ cal(I) = { \( i \, n \) : 1 lt.eq i < M \, med n in W_(e_i) } $
  are fixed. Its cardinality is $\( M - 1 \) r$. For these pairs define
  $ A_(i \, n) = S_(e_i) #scale(x: 120%, y: 120%)[\(] J_(b_(e_i)) \( y_n \( t \) \) #scale(x: 120%, y: 120%)[\)] . $
  We first check that these are distinct selector entries, none of which was exposed at $x$.
  Fix $i$, and abbreviate $a = a_(e_i)$ and $b = b_(e_i)$. For $n < n'$ in this window,
  $ y_n \( t \) - y_(n') \( t \) = t thin 2^(- n') \( 2^(n' - n) - 1 \) gt.eq 2^(- b) . $
  Also $y_n \( t \) - x = t 2^(- n) gt.eq 2^(- b)$. All these points lie in $\[ x \, x + 2^(1 - a) \]$, an interval of length at most $1 \/ 4$, since $a gt.eq 3$. Thus the circular distance between any two of them equals their ordinary distance and is at least $2^(- b)$. Two points in the same half-open $J_b$-cell have circular distance less than $2^(- \( b + 2 \))$. Consequently the keys of $x$ and all $y_n \( t \)$, $n in W_(e_i)$, are pairwise distinct. This argument also covers a crossing of an integer and points on cell boundaries.
  For different $i$, the selector tables themselves differ. The variables $A_(i \, n)$ therefore read distinct coordinates outside the entire exposed coordinate set defining $cal(F)_x$. Conditional on $xi$, they remain independent fair bits.
  Next condition on the sigma-algebra $cal(S)$ of all selectors. For each pair, its selected local leaf
  $ L_(i \, n) = L_i \( y_n \( t \) \) $
  and its terminal address
  $ kappa_(i \, n) = #scale(x: 120%, y: 120%)[\(] L_(i \, n) \, J_(b \( L_(i \, n) \)) \( y_n \( t \) \) #scale(x: 120%, y: 120%)[\)] $
  are now fixed. We claim that these addresses are distinct for all pairs in $cal(I)$. If the child indices differ, the leaves lie in disjoint child subtrees of $U$, so their terminal tables differ. If the child indices agree but the leaves differ, their tables again differ. It remains to consider two different indices $n \, n'$ that select the same leaf $L$ below one child $U_i$.
  For every leaf below $U_i$, its terminal resolution satisfies $b \( L \) gt.eq b_(e_i)$. If $U_i$ is a leaf, then $b \( L \) = b_(e_i)$. Otherwise the last edge into $L$ occurs after $e_i$ in the preorder, so its window endpoint is larger. By the nested-key identity (7), different keys at resolution $b_(e_i)$ remain different at resolution $b \( L \)$, including at grid boundaries. The preceding separation of $y_n \( t \)$ and $y_(n') \( t \)$ proves $kappa_(i \, n) eq.not kappa_(i \, n')$. This proves the claim, even for pairs with $A_(i \, n) = 0$.
  The terminal tables are independent of $cal(S)$. For each realization of all selectors, the addresses just identified are fixed distinct coordinates of those tables. The corresponding terminal bits
  $ V_(i \, n) = T_(L_(i \, n)) #scale(x: 120%, y: 120%)[\(] J_(b \( L_(i \, n) \)) \( y_n \( t \) \) #scale(x: 120%, y: 120%)[\)] $
  therefore have the product Bernoulli $p$ law conditional on $cal(S)$. Since $Q_i \( y_n \( t \) \) = A_(i \, n) V_(i \, n)$, only the pairs with $A_(i \, n) = 1$ require a terminal bit to vanish. On $xi$ we obtain
  $ bb(P) (Q_i \( y_n \( t \) \) = 0 upright(" for all ") \( i \, n \) in cal(I) thin mid(bar.v) thin cal(S)) = \( 1 - p \)^(sum_(\( i \, n \) in cal(I)) A_(i \, n)) . $
  The empty-success case has exponent zero and probability one.
  Finally, $cal(F)_x subset cal(S)$, so conditional expectation and the independent fair law of the $A_(i \, n)$ on $xi$ give
  $ & bb(P) (Q_i \( y_n \( t \) \) = 0 upright(" for all ") \( i \, n \) in cal(I) thin mid(bar.v) thin xi)\
 & #h(2em) = bb(E) [\( 1 - p \)^(sum_(\( i \, n \) in cal(I)) A_(i \, n)) thin mid(bar.v) thin xi]\
 & #h(2em) = product_(\( i \, n \) in cal(I)) (1 / 2 + 1 / 2 \( 1 - p \)) = \( 1 - p \/ 2 \)^(\( M - 1 \) r) . $
  ◻
]

The estimate applies separately to each scale fixed on the exposure atom. In the next step, the grid geometry will supply finitely many such scales, allowing a union bound over all $t in \[ 1 \, 2 \]$.

== 5 All normalized scales and all centers <sec:scales>

The preceding estimate concerns a fixed scale. To control every $t in \[ 1 \, 2 \]$, we track the local predicates $Q_i$ on the grids of their own child subtrees. The padding of each window bounds the number of changes in these predicates as the scale varies. The use of deterministic grid crossings to discretize scales at a fixed center follows the same principle as #cite(label("Kolountzakis1997")) Section 3.2, #cite(label("Chlebik2015")) Section 5, and #cite(label("KolountzakisPapageorgiou2025")) Section 3.1. Here the crossings must be counted within each child subtree, so that the bound remains compatible with the conditional trial estimate.

#thm([Lemma 5.1.])[
  #emph[Fix a stable center $x$ and an atom $xi$ of the full center exposure $cal(F)_x$ in (12) on which the first-default node $U$ exists. Let $h$ be its height, put $r = r_h$, and write 
$ e_i = \( U \, i \) \, #h(2em) b_i^(*) = b_(e_i)^(*) \, #h(2em) 1 lt.eq i < M . $

 There is a finite set $cal(R) \( x \, U \) subset \[ 1 \, 2 \]$, depending only on $x \, U$ and the deterministic windows, with 
#[#set math.equation(numbering: n => "(16)")
 $ \| cal(R) \( x \, U \) \| lt.eq 20 M r #scale(x: 120%, y: 120%)[\(] 1 + 2^(2 r + 2) #scale(x: 120%, y: 120%)[\)] \, $ <eq:representative-count>]

 such that the following holds for the local predicates $Q_i$ in (13), for every realization of the tables consistent with $xi$. For each $t in \[ 1 \, 2 \]$, some $t' in cal(R) \( x \, U \)$ satisfies 
#[#set math.equation(numbering: n => "(17)")
 $ Q_i \( x + t 2^(- n) \) = Q_i \( x + t' 2^(- n) \) quad upright("for all ") 1 lt.eq i < M upright(" and ") n in W_(e_i) . $ <eq:representative-agreement>]

]
] <lem:representatives>

#proof[
  For fixed tables, $Q_i \( z \)$ is determined by $J_(b_i^(*)) \( z \)$. Indeed, its initial selector has resolution $b_(e_i) lt.eq b_i^(*)$, and all selectors used to route from $U_i$ lie in that child subtree. The incoming edge of every possible terminal leaf also has endpoint at most $b_i^(*)$. This includes the case that $U_i$ itself is a leaf, whose terminal resolution is $b_(e_i)$, as well as leaves reached through default children. Since the grids are nested, the key $J_(b_i^(*)) \( z \)$ determines every address needed for this local predicate.
  For each tested pair $\( i \, n \)$, let
  $ cal(D)_(i \, n) \( x \) = {2^n #scale(x: 120%, y: 120%)[\(] j 2^(- \( b_i^(*) + 2 \)) - x #scale(x: 120%, y: 120%)[\)] : j in bb(Z)} ∩ \[ 1 \, 2 \] . $
  These are precisely the scales at which $x + t 2^(- n)$ meets a boundary of the periodic grid $J_(b_i^(*))$. The full real-line lattice in this definition also includes every passage through an integer, where the periodic key returns to its first cell.
  As $t$ ranges over $\[ 1 \, 2 \]$, the point traverses a closed interval of length $2^(- n)$. Counting lattice points in that interval gives
  $ \| cal(D)_(i \, n) \( x \) \| lt.eq 1 + 2^(b_i^(*) + 2 - n) . $
  The extra one allows both endpoints to be lattice points. The subtree span bound (5) gives $b_i^(*) - a_(e_i) + 1 lt.eq 2 r$; since $n gt.eq a_(e_i)$,
  $ \| cal(D)_(i \, n) \( x \) \| lt.eq 1 + 2^(2 r + 2) . $
  Take the union of these sets and the two endpoints:
  $ cal(D) \( x \, U \) = { 1 \, 2 } union union.big_(1 lt.eq i < M) med union.big_(n in W_(e_i)) cal(D)_(i \, n) \( x \) . $
  List its distinct elements as $d_1 = 1 < dots.h.c < d_L = 2$, and set
  $ cal(R) \( x \, U \) = cal(D) \( x \, U \) union {frac(d_j + d_(j + 1), 2) : 1 lt.eq j < L} . $
  There are $\( M - 1 \) r$ tested pairs, so
  $ L & lt.eq 2 + \( M - 1 \) r #scale(x: 120%, y: 120%)[\(] 1 + 2^(2 r + 2) #scale(x: 120%, y: 120%)[\)] \,\
\| cal(R) \( x \, U \) \| = 2 L - 1 & lt.eq 2 \( M - 1 \) r #scale(x: 120%, y: 120%)[\(] 1 + 2^(2 r + 2) #scale(x: 120%, y: 120%)[\)] + 3\
 & lt.eq 20 M r #scale(x: 120%, y: 120%)[\(] 1 + 2^(2 r + 2) #scale(x: 120%, y: 120%)[\)] . $
  On each open interval $\( d_j \, d_(j + 1) \)$, every relevant grid key is constant, hence so is every tested local predicate. Its midpoint therefore represents the entire interval. Each breakpoint and each endpoint is included separately and represents its own value. This proves (17), including the values at the boundaries of the half-open cells. ◻
]

The representatives use only the local predicates. A point for which $Q_i$ vanishes may take its actual route through another subtree with a finer grid. That route does not enter the count: we need only the implication from a successful local predicate to a hit of $B$.

#thm([Proposition 5.2.])[
  #emph[For every fixed stable center $x$, 
#[#set math.equation(numbering: n => "(18)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] exists t in \[ 1 \, 2 \] med forall n in cal(N) : x + t 2^(- n) in.not B #scale(x: 120%, y: 120%)[\)] lt.eq 2 p . $ <eq:raw-failure>]

]
] <prop:raw-failure>

#proof[
  Condition first on an atom $xi$ of $cal(F)_x$ in (12) on which the first-default node $U$ exists, and retain the notation of Lemma 7. The node $U$ and the entire set $cal(R) \( x \, U \)$ are fixed on this atom, before any remaining selector or terminal label is revealed. Thus Lemma 6 applies separately to every $t' in cal(R) \( x \, U \)$ and gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] Q_i \( x + t' 2^(- n) \) = 0 upright(" for all tested ") \( i \, n \) divides xi #scale(x: 120%, y: 120%)[\)] = \( 1 - p \/ 2 \)^(\( M - 1 \) r) lt.eq exp #h(-0.16667em) (- frac(p \( M - 1 \), 2) r) . $
  If some scale $t$ misses $B$ at every index in $cal(N)$, then Lemma 5 implies that all its tested local predicates vanish. By Lemma 7, they all vanish at one of the representative scales as well. The conditional union bound and (3) therefore give
  $ & bb(P) #scale(x: 120%, y: 120%)[\(] exists t in \[ 1 \, 2 \] med forall n in cal(N) : x + t 2^(- n) in.not B divides xi #scale(x: 120%, y: 120%)[\)]\
 & #h(2em) lt.eq 20 M r #scale(x: 120%, y: 120%)[\(] 1 + 2^(2 r + 2) #scale(x: 120%, y: 120%)[\)] exp #h(-0.16667em) (- frac(p \( M - 1 \), 2) r) < p . $
  No independence between different representative scales is required.
  This bound holds on every center-exposure atom that has a first default, since every corresponding window length is at least $r_(*)$. Averaging over those atoms introduces no factor for the number of possible nodes. By Lemma 4, the remaining event, on which the center’s path never chooses the default child, has probability less than $p$. Bounding failure by one on that event yields (18). ◻
]

=== 5.1 Removing exceptional centers <subsec:repair>

The pointwise probability bound will control the measure of the centers at which some normalized scale is missed. We first enlarge the random set to an open set, so that those exceptional centers form a closed set. A small open neighborhood of that closed set will then provide hits from the dyadic tail. This follows the open-cover completion of Kolountzakis #cite(label("Kolountzakis1997")) Sections 2.2 and 3.2; we give the closedness, measure and tail arguments explicitly.

#proof[
  #emph[Completion of the proof of Lemma 2.] The probability space $Omega$ of all table entries is finite. For each outcome $omega$, the set $B_omega$ is a union of cells from one finite dyadic grid per period: its finest key determines every table lookup. Regard a periodic set as a subset of the circle $bb(T) = bb(R) \/ bb(Z)$, with normalized Lebesgue measure equal to the density of its periodic lift. Taking the closures of the selected cells adds only finitely many endpoints. Enlarging these closed arcs by sufficiently small open circular neighborhoods therefore gives an open periodic set $B_omega^(+) supset.eq B_omega$ with
  #[#set math.equation(numbering: n => "(19)")
   $ rho \( B_omega^(+) \) lt.eq rho \( B_omega \) + p . $ <eq:open-enlargement>]
  For example, if the grid has $Q$ cells, enlargement by circular distance $p \/ \( 4 Q \)$ adds at most $p \/ 2$ to the measure of their union. For the empty set use the empty enlargement. Since there are only finitely many outcomes, these choices introduce no measurable-selection issue. Equation (11) gives
  #[#set math.equation(numbering: n => "(20)")
   $ bb(E) rho \( B_omega^(+) \) lt.eq 2 p . $ <eq:open-mean>]
  Define the exceptional-center set
  #[#set math.equation(numbering: n => "(21)")
   $ R_omega = {x in bb(R) : exists t in \[ 1 \, 2 \] med forall n in cal(N) \, med x + t 2^(- n) in.not B_omega^(+)} . $ <eq:exceptional-centers>]
  This set is periodic and closed. To prove closedness without any endpoint convention on a fundamental interval, let $pi : bb(R) arrow.r bb(T)$ be the quotient map and let $B_(omega \, bb(T))^(+) subset bb(T)$ denote the open image of $B_omega^(+)$. Each map
  $ \( pi x \, t \) mapsto pi \( x + t 2^(- n) \) quad upright("from ") bb(T) times \[ 1 \, 2 \] upright(" to ") bb(T) $
  is continuous. The conditions that all these images avoid $B_(omega \, bb(T))^(+)$, for $n in cal(N)$, consequently define a closed subset of the compact space $bb(T) times \[ 1 \, 2 \]$. Its projection to $bb(T)$ is compact and hence closed. Its inverse image under $pi$ is exactly $R_omega$.
  In particular, each indicator $upright(bold(1))_(R_omega) \( x \)$ is Borel measurable in $x$. Since $Omega$ is finite, it is also jointly measurable in $\( omega \, x \)$. For every stable center $x in G$, the inclusion $B_omega subset.eq B_omega^(+)$ and Proposition 8 give
  $ bb(P) \( x in R_omega \) lt.eq 2 p . $
  At the other centers the probability is at most $1$. Interchanging a finite sum and an integral, and using Lemma 3, we obtain
  #[#set math.equation(numbering: n => "(22)")
   $ bb(E) rho \( R_omega \) & = integral_0^1 bb(P) \( x in R_omega \) thin d x\
 & lt.eq 2 p thin m \( G ∩ \[ 0 \, 1 \] \) + m \( G^c ∩ \[ 0 \, 1 \] \) lt.eq 2 p + rho \( G^c \) lt.eq 3 p . $ <eq:exceptional-mean>]
  Thus (20) and (22) imply
  $ bb(E) #scale(x: 120%, y: 120%)[\(] rho \( B_omega^(+) \) + rho \( R_omega \) #scale(x: 120%, y: 120%)[\)] lt.eq 5 p . $
  Choose one outcome whose summed density is at most this bound, and write its sets as $B^(+)$ and $R$. We have
  #[#set math.equation(numbering: n => "(23)")
   $ rho \( B^(+) \) + rho \( R \) lt.eq 5 p . $ <eq:chosen-outcome>]
  It remains to cover every center in $R$. Its image $R_(bb(T)) = pi \( R \)$ is closed in the circle. If it is empty, put $V = diameter$. Otherwise, for $epsilon > 0$, its open metric neighborhoods
  $ V_epsilon^(bb(T)) = { z in bb(T) : "dist"_(bb(T)) \( z \, R_(bb(T)) \) < epsilon } $
  decrease to $R_(bb(T))$ as $epsilon arrow.b 0$. Continuity of finite measure from above lets us choose $epsilon > 0$ so that the open periodic lift $V = pi^(- 1) \( V_epsilon^(bb(T)) \)$ satisfies
  $ R subset.eq V \, #h(2em) rho \( V \) lt.eq rho \( R \) + p . $
  Set $H = B^(+) union V$. It is open and periodic, and (23) gives
  $ rho \( H \) lt.eq rho \( B^(+) \) + rho \( V \) lt.eq rho \( B^(+) \) + rho \( R \) + p lt.eq 6 p . $
  If $x in.not R$, negating (21) shows that for every $t in \[ 1 \, 2 \]$ some $n in cal(N)$ satisfies $x + t 2^(- n) in B^(+) subset.eq H$. If $x in R$, choose an integer $n_0 gt.eq 1$ with $2^(1 - n_0) < epsilon$. For every $t in \[ 1 \, 2 \]$ and every $n gt.eq n_0$, the circle distance satisfies
  $ "dist"_(bb(T)) #scale(x: 120%, y: 120%)[\(] pi \( x + t 2^(- n) \) \, R_(bb(T)) #scale(x: 120%, y: 120%)[\)] lt.eq "dist"_(bb(T)) #scale(x: 120%, y: 120%)[\(] pi \( x + t 2^(- n) \) \, pi x #scale(x: 120%, y: 120%)[\)] lt.eq t 2^(- n) < epsilon . $
  Hence $x + t 2^(- n) in V subset.eq H$. These indices are taken from the full dyadic tail. The two cases establish the required hit for every real $x$ and every $t in \[ 1 \, 2 \]$, completing the lemma. ◻
]

== 6 The compact avoiding set <sec:global>

The periodic hitting sets cover scales in $\[ 1 \, 2 \]$. We now combine their dyadic dilations, with summable densities, to cover every nonzero scale while removing arbitrarily little measure from $\[ 0 \, 1 \]$.

#proof[
  Fix $eta in \( 0 \, 1 \)$ and put
  $ p_j = eta / 24 thin 2^(- j) #h(2em) \( j = 1 \, 2 \, dots.h \) . $
  Each $p_j$ belongs to $\( 0 \, 1 \)$. By Lemma 2, choose an open $1$-periodic set $H_j subset bb(R)$ with $rho \( H_j \) lt.eq 6 p_j$ such that
  #[#set math.equation(numbering: n => "(24)")
   $ forall y in bb(R) med forall t in \[ 1 \, 2 \] med exists n in bb(Z)_(gt.eq 1) : #h(2em) y + t 2^(- n) in H_j . $ <global:normalized-hits>]
  All these sets are fixed before any center or scale is chosen. Define
  $ C = union.big_(j gt.eq 1) #scale(x: 120%, y: 120%)[\(] 2^(- j) H_j union \( - 2^(- j) H_j \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) E = \[ 0 \, 1 \] \\ C . $
  Dilations and reflections preserve openness, so $C$ is open. Its paired definition gives $- C = C$. Thus $E$ is a closed subset of $\[ 0 \, 1 \]$, and is compact.
  For each $j$, periodicity and a change of variables give the exact identities
  $ m #scale(x: 120%, y: 120%)[\(] \( 2^(- j) H_j \) ∩ \[ 0 \, 1 \] #scale(x: 120%, y: 120%)[\)] & = 2^(- j) m #scale(x: 120%, y: 120%)[\(] H_j ∩ \[ 0 \, 2^j \] #scale(x: 120%, y: 120%)[\)] = rho \( H_j \) \,\
m #scale(x: 120%, y: 120%)[\(] \( - 2^(- j) H_j \) ∩ \[ 0 \, 1 \] #scale(x: 120%, y: 120%)[\)] & = 2^(- j) m #scale(x: 120%, y: 120%)[\(] H_j ∩ \[ - 2^j \, 0 \] #scale(x: 120%, y: 120%)[\)] = rho \( H_j \) . $
  Indeed, each interval on the right contains exactly $2^j$ unit periods; their endpoints do not affect Lebesgue measure. Countable subadditivity therefore yields
  $ m \( C ∩ \[ 0 \, 1 \] \) lt.eq 2 sum_(j gt.eq 1) rho \( H_j \) lt.eq 12 sum_(j gt.eq 1) p_j = eta / 2 . $
  Consequently
  $ m \( E \) = 1 - m \( C ∩ \[ 0 \, 1 \] \) gt.eq 1 - eta / 2 > 1 - eta . $
  It remains to show that every signed affine copy of $D$ meets $C$. Let $x in bb(R)$ and first suppose that $s > 0$. Choose an integer $k$ with
  $ t = 2^k s in \[ 1 \, 2 \) \, $
  and set $j = max { 1 \, k }$. Apply (24) to the center $2^j x$ and the normalized scale $t$. There is an integer $n gt.eq 1$ such that
  $ 2^j x + t 2^(- n) in H_j . $
  Multiplying by $2^(- j)$ gives
  $ x + s 2^(- \( n + j - k \)) in 2^(- j) H_j subset C . $
  The index $N = n + j - k$ is an integer and satisfies $N gt.eq n gt.eq 1$, because $j gt.eq k$. Hence this point belongs to the original copy $x + s D$. The argument applies to every real center and every positive scale, including arbitrarily small scales, for which larger values of $j$ are available.
  If $s < 0$, apply the positive-scale conclusion to the center $- x$ and scale $- s$. For some integer $N gt.eq 1$,
  $ - \( x + s 2^(- N) \) = \( - x \) + \( - s \) 2^(- N) in C . $
  Since $- C = C$, it follows that $x + s 2^(- N) in C$ as well. In either case, the copy $x + s D$ has a point in $C$, which is disjoint from $E$. Thus the fixed compact set $E$ excludes every such copy, as required. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
