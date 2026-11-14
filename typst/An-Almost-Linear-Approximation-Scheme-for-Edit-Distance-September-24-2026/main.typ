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

#align(center)[#text(size: 16pt, weight: "bold")[An Almost-Linear Approximation Scheme for Edit Distance]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:intro>

The unit-cost edit distance $"ED" \( x \, y \)$ is the minimum number of single-symbol insertions,
  deletions and substitutions that transform a string $x$ into a string $y$. All three operations have cost one.
  The strings are stored explicitly; write $N = \| x \| + \| y \|$.
  Their symbols are integer labels of polynomial magnitude in $N + 2$,
  stored in words of $O \( log \( N + 2 \) \)$ bits. There is no bound on the alphabet size independent of $N$.

An approximation scheme receives a rational $epsilon in \( 0 \, 1 \)$ and estimates the distance multiplicatively.
  Its guarantee must therefore include returning zero when the two strings are equal. We prove the following result.

#thm([Theorem 1.1.])[
  #emph[There is one uniform randomized algorithm that, given $x \, y$ and a rational $epsilon in \( 0 \, 1 \)$,
    returns a nonnegative integer $hat(D)$ such that
$ Pr #scale(x: 120%, y: 120%)[\[] "ED" \( x \, y \) lt.eq
  hat(D) lt.eq \( 1 + epsilon \) "ED" \( x \, y \) #scale(x: 120%, y: 120%)[\]] gt.eq 2 / 3 . $

 For every fixed rational $epsilon$, its worst-case expected running time on strings of total length $N$ is
   $N^(1 + o \( 1 \))$ as $N arrow.r oo$ on the logarithmic-word RAM.
   The expectation is over internal randomness only, and the bound includes input processing, preprocessing,
   numerical work, random sampling and all data-structure operations. Equal strings return zero deterministically.]
] <thm:main>

The program is uniform in the accuracy input. The asymptotic assertion is pointwise in each fixed rational
  accuracy: its constants and the threshold at which the bound applies may depend on $epsilon$.
  We do not assert polynomial dependence on $1 \/ epsilon$ or a joint bound when the accuracy varies with $N$.
  The output is a distance estimate; no edit-script reconstruction is needed.

The algorithm uses exact computation below an accuracy-dependent input-length threshold.
  Section 2 gives the finite input convention and fallback rules; their thresholds are very large,
  so the result is an asymptotic approximation scheme.

=== 1.1 Context and approach <context-and-approach>

Edit distance originates in the study of errors in transmitted strings,
  including Levenshtein’s binary codes for insertions, deletions and bit flips #cite(label("Levenshtein1966")).
  The dynamic program of Wagner and Fischer #cite(label("WagnerFischer1974")) computes the minimum cost of
  insertions, deletions and substitutions in quadratic time.
  Masek and Paterson #cite(label("MasekPaterson1980")) applied block tabulation to obtain a logarithmic speedup
  for fixed alphabets and suitable fixed costs. Distance-sensitive exact algorithms offer another route when few
  edits are needed: Ukkonen #cite(label("Ukkonen1985")) developed bounded-distance methods,
  and Landau and Vishkin #cite(label("LandauVishkin1988")) #cite(label("LandauVishkin1989")) combined
  furthest-reaching states with fast matching queries. Myers’s related difference
  algorithm #cite(label("Myers1986")) treats insertion–deletion scripts.
  For unrestricted exact computation, Backurs and Indyk #cite(label("BackursIndyk2018")) showed that a strongly
  subquadratic deterministic algorithm would refute the Strong Exponential Time Hypothesis.
  That lower bound does not rule out fixed-factor approximation.

Approximation algorithms progressively improved the accuracy available with substantially less work.
  In the following historical comparisons, write $n$ for a common upper bound on the string lengths.
  Batu and coauthors #cite(label("BatuEtAl2003")) gave sublinear tests for fixed alphabets that distinguish
  sufficiently small distance from linear distance. For general pairs, Bar-Yossef, Jayram,
  Krauthgamer and Kumar #cite(label("BarYossefEtAl2004")) obtained an $n^(3 \/ 7)$ approximation in quasi-linear
  time; Batu, Ergün and Sahinalp #cite(label("BatuErgunSahinalp2006")) improved the factor to
  $n^(1 \/ 3 + o \( 1 \))$. For binary strings, Ostrovsky and Rabani #cite(label("OstrovskyRabani2007"))
  constructed a low-distortion embedding into $ell_1$, and Andoni and Onak #cite(label("AndoniOnak2012")) obtained
  an efficiently computable $2^(tilde(O) \( sqrt(log n) \))$ approximation in $n^(1 + o \( 1 \))$ time.
  Andoni, Krauthgamer and Onak #cite(label("AndoniKrauthgamerOnak2010")) then achieved a
  $\( log n \)^(O \( 1 \/ xi \))$ factor in $n^(1 + xi)$ time for each fixed $xi > 0$,
  using a hierarchical alignment representation and nonuniformly allocated precisions.

The next advances reached constant factors. Chakraborty, Das, Goldenberg,
  Koucký and Saks #cite(label("ChakrabortyEtAl2020")) gave a constant-factor approximation in
  $tilde(O) \( n^(12 \/ 7) \)$ time. Brakensiek and Rubinstein #cite(label("BrakensiekRubinstein2020")) and Koucký
  and Saks #cite(label("KouckySaks2020")) independently obtained near-linear exponents for sufficiently far input
  pairs, with a material additive error on general pairs. Andoni and Nosatzki #cite(label("AndoniNosatzki2020"))
  removed that restriction: for every fixed $xi > 0$, their algorithm gives an approximation factor depending only
  on $xi$ in $O \( n^(1 + xi) \)$ time. The factor depends on the exponent parameter;
  this is not an approximation scheme with error tending to zero.
  For accuracy arbitrarily close to one, Mao and Rubinstein #cite(label("MaoRubinstein2026")) Theorem 6.1 recently
  obtained a randomized $\( 1 + epsilon \)$ approximation in $n^2 \/
  2^(log^(Omega \( 1 \)) n)$ time for every fixed positive $epsilon$.

The issue addressed here is how to retain fixed $\( 1 + epsilon \)$ accuracy while reducing the expected total
  work to $N^(1 + o \( 1 \))$. Recursive interval decompositions, economical evaluation of local distances,
  and accounting along an optimal alignment have substantial precedent in the algorithms above.
  In our refinement, unrestricted recursive evaluation of child distances would consume the available time even if
  the resulting numerical error were small. We therefore need both a narrow family that contains a suitable
  comparison alignment and a bound on the number of child distances actually evaluated.

For the initial estimates we adapt the shift tree and precision sampling of Andoni,
  Krauthgamer and Onak #cite(label("AndoniKrauthgamerOnak2010")) #cite(label("AndoniKrauthgamerOnak2011")).
  The refinement is related to Mao and Rubinstein’s use of multiscale deviation to constrain alignment paths
  before sampling #cite(label("MaoRubinstein2026")). Here we measure the alignment’s changes in relative position
  using preliminary cost estimates as weights. A telescoping bound on their variation controls the total cost of
  places where the prediction fails. An entropy-regularized prediction rule,
  within the framework of Rakhlin and Sridharan #cite(label("RakhlinSridharan2013")),
  then controls the accumulated error where the predictions can be used.
  We implement its optimization by a finite Frank–Wolfe procedure #cite(label("FrankWolfe1956"))
  #cite(label("Jaggi2013")). The specialized geometric, probabilistic and numerical guarantees are proved in this paper.

Two related comparisons concern different requirements on the output or the edit costs.
  A single $ell_1$ embedding of all binary strings up to a length bound must incur growing distortion
  #cite(label("OpenAIEditDistortion2026")) Theorem 1.1. Our algorithm estimates the distance of the supplied pair
  and does not construct such a common embedding. Recent algorithms for metric-weighted edit costs obtain
  $\( 3 + epsilon \)$ approximation in strongly subquadratic time #cite(label("MaderTavasoliWang2026"))
  #cite(label("DasKipouridisKociumaka2026")); their cost model is broader than the unit-cost model treated here.

=== 1.2 Proof overview <proof-overview>

Recursively partition the first string into a tree of intervals, ending at intervals of length at most one.
  An interval state consists of a source interval $I$ and a target interval in the second string;
  its true cost is the edit distance between the two substrings.
  An action at a nonleaf assigns one target interval to each source child.
  We charge the sum of the child estimates together with penalties for gaps or overlaps between successive target
  endpoints and at the two outer endpoints. These penalties let us compare nearby actions without requiring their
  target intervals to join exactly.

===== 1.2.1 Estimates that can be requested adaptively. <estimates-that-can-be-requested-adaptively.>

The initial seed is an integer table whose entries give coarse upper approximations to all interval-state costs.
  Although the algorithm evaluates only requested entries, the accuracy event covers the entire domain:
  later queries may depend on earlier random answers. Each initial entry uses a private random stream,
  so its expected evaluation cost can also be bounded conditional on the request that first exposes it.
  Accuracy and expected work thus use different probability statements.
  Successive refinement passes improve the seed approximation factor.

===== 1.2.2 Predicting where an alignment goes. <predicting-where-an-alignment-goes.>

One refinement starts from such a seed. It first propagates estimates through a wide family of actions and
  averages the resulting preliminary tables to obtain cost proxies.
  At a source cut, the alignment’s shift is the target position minus the source position.
  The total shift change divided by the predicted total cost suggests how this shift should evolve as prefix cost
  accumulates. Requiring agreement with that prediction restricts the possible target positions at each cut to a
  narrow band. The algorithm computes these bands from the cost proxies alone.

To analyze them, fix optimal alignments and recursively round their child endpoints.
  This gives a comparison tree that the algorithm never computes.
  A cost-weighted variance measures how far the comparison shifts depart from the predicted evolution.
  Its sum telescopes, with additional charges for disagreements among the cost proxies.
  Consequently the total cost of nodes with large discrepancies is controlled.
  At the other nodes, either the substring-length difference already accounts for almost all predicted cost,
  giving a direct error bound, or the computed band contains the comparison action.

===== 1.2.3 From a band to a better seed. <from-a-band-to-a-better-seed.>

Within a band, an entropy-regularized rule predicts an action using earlier child values.
  Shared samples also compare rounded actions across nearby representatives.
  The resulting estimates decrease with the refinement index.
  After conditioning on complete child tables, the parent samples retain their prescribed laws,
  and an online inequality bounds cumulative excess over the comparison action.
  Some intermediate estimates can be smaller than true cost.
  The analysis therefore clips them from below at true cost,
  so an underestimate at one node cannot cancel an error elsewhere.
  Summing over the comparison tree gives a small expected positive error at any fixed queried state,
  together with a deterministic multiplicative lower bound.
  Independent repetitions, rescaling and medians turn these two bounds into a simultaneous one-sided seed with a
  smaller approximation factor. Repeating this improvement and making one final refinement gives the desired answer.

===== 1.2.4 Paying for recursive queries. <paying-for-recursive-queries.>

A wide search or an optimization step may inspect many actions, but it reuses previously gathered child values.
  Only shared group samples, selected rounded actions and actual online draws require child values at the current
  refinement index. Common rounded grids limit the number of these calls to slightly more than the tree’s
  branching factor. Along a dependency path, a call either descends the tree at the same index or decreases an
  index or pass. Counting these two kinds of steps bounds the total expected work,
  including rational arithmetic and exact sampling, by $N^(1 + o \( 1 \))$.

Section 2 fixes the computational model, geometry and parameters. Sections 3–5 construct the tables.
  Sections 6 and 7 prove the geometric and probabilistic estimates,
  and Section 8 assembles the accuracy guarantee. Sections 9 and 10 implement every operation and complete the
  running-time proof.

== 2 Alignment geometry and computational parameters <sec:geometry>

This section fixes the input conventions and the interval states used throughout the algorithm.
  It also records the geometric inequalities that allow child intervals to be combined even when their target
  endpoints do not agree.

=== 2.1 Paths, states and connection costs <paths-states-and-connection-costs>

Index string boundaries starting at zero. An alignment path has steps
  $\( 1 \, 0 \) \, \( 0 \, 1 \) \, \( 1 \, 1 \)$, of cost one, one,
  and the indicator that the two characters on a diagonal step differ. Such a path gives an edit sequence.
  Conversely, the original characters that survive an edit sequence occur in the final string in their original
  order. Deleting other original characters, inserting the remaining output characters and changing each surviving
  character whose label differs gives an alignment of no greater cost. Thus minimum alignment cost equals edit distance.

For an interval $I = \( l \, u \]$ of the first string, an interval state is $\( I \, q \)$,
  where $q = \( q^(-) \, q^(+) \)$ is an integer pair with $0 lt.eq q^(-) lt.eq q^(+) lt.eq \| y \|$.
  When $I$ is fixed, we also call $q$ a state. Set

$ c \( I \, q \) = "ED" #scale(x: 120%, y: 120%)[\(] x_(\( l \, u \]) \,
  y_(\( q^(-) \, q^(+) \]) #scale(x: 120%, y: 120%)[\)] \, wide z \( I \, q \) = \( q^(+) - q^(-) \) - \( u - l \) . $

An endpoint’s #emph[shift] is its target index minus its first-string index.
  In particular, $z$ is the change in shift between the two endpoints.
  For pairs use $\| q - r \|_1 = \| q^(-) - r^(-) \| + \| q^(+) - r^(+) \|$.

#thm([Lemma 2.1.])[
  #emph[For every interval state, $c \( I \, q \) gt.eq \| z \( I \, q \) \|$.
    Both $c \( I \, dot.op \)$ and $\| z \( I \, dot.op \) \|$ are $1$-Lipschitz in the endpoint metric.
    If $I$ is partitioned, in order, into $I_1 \, dots.h \, I_m$,
    and $alpha = \( s_1 \, dots.h \, s_m \)$ is any list of valid child states, define
$ "conn"_r \( alpha \) = \| s_1^(-) - r^(-) \| + sum_(i = 1)^(m - 1) \| s_(i + 1)^(-) - s_i^(+) \| + \| s_m^(+) -
  r^(+) \| . $

 Then
#[#set math.equation(numbering: n => "(2.1)")
 $ c \( I \, r \) & lt.eq sum_i c \( I_i \, s_i \) + "conn"_r \( alpha \) \,\
\| z \( I \, r \) \| & lt.eq sum_i \| z \( I_i \, s_i \) \| + "conn"_r \( alpha \) . $ <eq:connection>]

 The connection inequalities also hold for finite target intervals in any extension of $y$ beyond its stored endpoints.]
] <lem:geometry>

#proof[
  Only insertions and deletions change length, proving $c gt.eq \| z \|$.
    Changing a target substring’s endpoints costs at most $\| q - r \|_1$:
    remove or insert endpoint portions if the substrings overlap,
    and delete and insert the whole substrings if they are disjoint.
    The triangle inequality gives the claim for $c$; the claim for $\| z \|$ follows from its formula.
  Edit each child to its specified target substring and concatenate the results.
    Consider the walk on the target’s boundary line that starts at $r^(-)$, jumps to $s_1^(-)$,
    traverses each child target forward, makes the successive connecting jumps, and ends at $r^(+)$.
    Expand each jump into unit steps. From this walk choose, in order,
    one forward crossing of every unit interval between $r^(-)$ and $r^(+)$.
    Successive first arrivals at the next boundary give such a choice.
    The letters on these selected crossings, in their walk order, form exactly the parent’s target substring.
    Delete the letters on unselected child crossings, and insert the letters on selected connecting crossings.
    By net displacement, the number of unselected forward crossings equals the number of backward crossings.
    All backward crossings belong to connecting jumps, since child targets are traversed forward.
    Thus deletions cost at most the total backward jump length,
    while insertions cost at most the total forward jump length.
    Their sum is $"conn"_r \( alpha \)$, proving (2.1). This argument uses only the letters at finitely many
    target positions, so it also proves the assertion for extensions of $y$.
    Finally, sum the signed shift changes of child intervals and connecting jumps and take absolute values to
    obtain (2.1). ◻
]

Figure 1 illustrates why the connection term permits both gaps and overlaps between consecutive child targets.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.252, 0.924), (7.632, 0.924), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.6, 1.638), [#text(size: 9pt)[target boundary]])
  line((0, 0.8736), (0, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0.9744), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  line((0.72, 0.8736), (0.72, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.72, 0.9744), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  line((2.16, 0.8736), (2.16, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.16, 0.9744), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  line((2.88, 0.8736), (2.88, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.88, 0.9744), [#text(size: 9pt)[$4$]], anchor: "south", padding: 0.1176cm)
  line((4.32, 0.8736), (4.32, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.32, 0.9744), [#text(size: 9pt)[$6$]], anchor: "south", padding: 0.1176cm)
  line((5.04, 0.8736), (5.04, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.04, 0.9744), [#text(size: 9pt)[$7$]], anchor: "south", padding: 0.1176cm)
  line((6.48, 0.8736), (6.48, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.48, 0.9744), [#text(size: 9pt)[$9$]], anchor: "south", padding: 0.1176cm)
  line((7.2, 0.8736), (7.2, 0.9744), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.2, 0.9744), [#text(size: 9pt)[$10$]], anchor: "south", padding: 0.1176cm)
  content((-0.288, 0), [#text(size: 9pt)[$I_1$]], anchor: "east", padding: 0.1176cm)
  content((-0.288, -1.176), [#text(size: 9pt)[$I_2$]], anchor: "east", padding: 0.1176cm)
  content((-0.288, -2.352), [#text(size: 9pt)[$I_3$]], anchor: "east", padding: 0.1176cm)
  line((0.72, 0), (2.88, 0), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.8, 0), [#text(size: 9pt)[$s_1=(1,4)$]], anchor: "south", padding: 0.1176cm)
  line((2.16, -1.176), (4.32, -1.176), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.24, -1.176), [#text(size: 9pt)[$s_2=(3,6)$]], anchor: "north", padding: 0.1176cm)
  line((5.04, -2.352), (6.48, -2.352), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.76, -2.352), [#text(size: 9pt)[$s_3=(7,9)$]], anchor: "north", padding: 0.1176cm)
  circle((0.72, 0), radius: 0.07982, fill: black, stroke: none)
  circle((2.88, 0), radius: 0.07982, fill: black, stroke: none)
  circle((2.16, -1.176), radius: 0.07982, fill: black, stroke: none)
  circle((4.32, -1.176), radius: 0.07982, fill: black, stroke: none)
  circle((5.04, -2.352), radius: 0.07982, fill: black, stroke: none)
  circle((6.48, -2.352), radius: 0.07982, fill: black, stroke: none)
  circle((0, 0.378), radius: 0.07982, fill: black, stroke: none)
  content((-0.02495, 0.4029), [$r^-=0$], anchor: "south-east")
  circle((7.2, -2.73), radius: 0.07982, fill: black, stroke: none)
  content((7.225, -2.755), [$r^+=10$], anchor: "north-west")
  line((0, 0.378), (0.72, 0), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((0.36, 0.189), [#text(size: 9pt)[$1$]], anchor: "north-east", padding: 0.1176cm)
  line((2.88, 0), (2.16, -1.176), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((2.52, -0.588), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  line((4.32, -1.176), (5.04, -2.352), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((4.68, -1.764), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
  line((6.48, -2.352), (7.2, -2.73), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"), mark: (end: (symbol: ")>", fill: black)))
  content((6.84, -2.541), [#text(size: 9pt)[$1$]], anchor: "south-west", padding: 0.1176cm)
  content((3.6, -3.402), [#text(size: 9pt)[$"conn"_r( alpha )=|1-0|+|3-4|+|7-6|+|10-9|=4$]])
})],
  caption: [Figure 1: Connection charges for three consecutive source children. Solid arrows show their prescribed target intervals; dashed arrows join these intervals in child order, with the outside endpoints $r = \( 0 \, 10 \)$. The jump from $4$ to $3$ points backward, so this walk is not itself an alignment path. Lemma 2 gives $c \( I \, r \) lt.eq sum_(i = 1)^3 c \( I_i \, s_i \) + 4$. Only the horizontal target-coordinate displacement of a dashed arrow is charged; the vertical separation of rows is for display. ],
) <fig:connection-cost>

=== 2.2 Uniform access to the accuracy input <uniform-access-to-the-accuracy-input>

The rational accuracy is supplied in a fixed canonical binary encoding of its positive numerator and denominator
  in lowest terms, on a separate read-only input. For example,
  encode a positive integer by its binary length in unary, a delimiter, and its binary digits,
  and concatenate the two encodings. The input is promised to specify $0 < epsilon < 1$.
  Prefix inspection is ordinary input access; no numerical operation on the rational is free.

The algorithm first handles equality, empty strings and $\| x \| lt.eq 1$ exactly.
  These cases require $O \( N + 1 \)$ string work. On other inputs define $H$ as the least power of two at least
  $ceil.l log_2 \( N + 2 \) ceil.r$, and $ell$ as the least power of two at least $max \( 1 \, log_2 H \)$.
  Inspect at most $H^2 + O \( 1 \)$ bits of the accuracy input.
  If its complete encoding has not been obtained, use exact alignment dynamic programming.
  The unread suffix is neither copied nor addressed. All addresses actually used for this prefix have
  $O \( log \( N + 2 \) \)$ bits. If the encoding is obtained, its integers have $O \( H^2 \)$ bits,
  and exact arithmetic decides the test $ell epsilon gt.eq 10$ with polynomial work in $H$.

Use exact dynamic programming also if $ell < 2^1000$ or $ell epsilon < 10$.
  It uses $O \( \( N + 1 \)^2 \)$ word operations and can store only two rows.
  Together with the bounded parameter inspection, this charges every operation in these branches.
  For each fixed rational encoding, the inspection bound eventually exceeds its length,
  and both numeric tests eventually pass as $N$ grows. Thus the exact branches affect only a bounded range of $N$
  for each fixed $epsilon$. They preserve the uniform algorithm and its approximation guarantee on that range.
  No assertion about efficient joint dependence on encoding length or $1 \/ epsilon$ is needed.

=== 2.3 Parameters and the fixed interval tree <parameters-and-the-fixed-interval-tree>

All remaining arguments concern the large-input branch. Logarithms with subscript two are binary,
  and $ln$ denotes the natural logarithm. The coarse estimator and interval tree use the branching factors $B$ and
  $M$ below. The factor $A_(upright("init"))$ is the initial seed accuracy,
  $F$ controls its reduction across passes, and $P$ controls endpoint-grid resolution:

$ p_(*) & = ⌊\( log_2 ell \)^(1 \/ 4)⌋ \, & B & = H^(p_(*)) \, & A_(upright("init")) & = H^(p_(*) + 4) \,\
M & = 2^(floor.l \( log_2 H \) \/ 20 floor.r) \, & P & = H^(p_(*) + 20) \, & F & = ell . $

The counts $T$ and $S$ govern preliminary propagation and refinement iterations, respectively.
  The slopes $L_0$ and $L$ penalize changes in target endpoints:

$ T = 2^(ceil.l \( 3 \/ 4 \) log_2 H ceil.r) \, wide S = H \/ ell^2 \, wide L_0 = 32 F \, wide L = 128 F . $

Finally, fix the error tolerances and the sampling and optimization parameters.
  Their roles are specified at the corresponding constructions:

$ delta & = ell^(- 10) \, & kappa & = tau = ell^(- 4) \, & theta & = ell^(- 40) \,\
gamma & = ell^(- 20) \, & eta & = ell^5 \, & Q_1 & = ell^80 . $

The essential separation is between $H = Theta \( log \( N + 2 \) \)$ and $ell = Theta \( log H \)$:
  the branching factors and grid resolutions are powers of $H$, while the tolerances are powers of $ell$.
  The inequalities below quantify the slack available between these scales.

Every integer parameter here is computable using bit lengths and integer tests.
  For example, $p_(*)$ is the largest integer whose fourth power is at most the integer $log_2 ell$.
  The displayed fractional powers and logarithms require no real-arithmetic oracle.
  All parameters used as dyadic grid spacings are powers of two, and $S$ is a positive integer in this branch.

We will repeatedly use the generous bounds

#[#set math.equation(numbering: n => "(2.2)")
 $ H gt.eq 2^(ell \/ 2) \, wide ell^200 lt.eq H^(1 \/ 100) \, wide p_(*) + 21 lt.eq sqrt(ell) . $ <eq:parameter-slack>]

The first follows from the definition of $ell$; the other two follow at $ell gt.eq
  2^1000$ and become stronger as $ell$ increases. More explicitly, $200 log_2 ell lt.eq
  ell \/ 200$ and $\( log_2 ell \)^(1 \/ 4) + 21 lt.eq sqrt(ell)$ hold at this cutoff,
  and their right sides thereafter grow faster. Factors polynomial in $ell$ and $p_(*)$ will consequently be much
  smaller than any fixed positive power of $H$ needed below.

Partition $x$ into a complete $M$-ary tree of height

$ J = ⌈log_M max \( 1 \, \| x \| \)⌉ . $

At a node $\( l \, u \]$ use cuts $l_i = l + floor.l i \( u - l \) \/ M floor.r$, $0 lt.eq i lt.eq M$.
  Empty intervals are allowed, and node labels distinguish repeated intervals.
  Nodes need only be generated when requested. At depth $j$ the width is at most $ceil.l \| x \| \/ M^j ceil.r$,
  and leaves have width at most one. The parameters give

#[#set math.equation(numbering: n => "(2.3)")
 $ J lt.eq 100 H \/ ell \, wide M^J lt.eq M max \( 1 \, \| x \| \) . $ <eq:tree-bounds>]

Indeed $log_2 M gt.eq \( log_2 H \) \/ 20 - 1$ and $log_2 H gt.eq ell \/ 2$, whereas $log_2 \| x \| lt.eq H$.
  The second bound follows directly from the ceiling defining $J$.

At a leaf of width zero the exact cost is the target length.
  At a leaf containing one character, the cost is one for an empty target,
  and otherwise is the target length minus the indicator that this character occurs there.
  Sort the pairs (symbol, position) of $y$ lexicographically by comparison sorting.
  A binary search then tests occurrence in any target interval in $O \( log \( N + 2 \) \)$ time,
  with $O \( N log \( N + 2 \) \)$ preprocessing work and linear storage.
  The word-label assumption makes each comparison a bounded number of word operations.
  Fresh padding symbols used later can be represented by a tag together with a label;
  no search for an unused alphabet value is needed.

All subsequent tables are indexed by this fixed tree and valid endpoint pairs.
  The total domain is polynomial in $N + 2$: there are at most $2
  M^J$ nodes and at most $\( \| y \| + 1 \)^2$ pairs per node.
  A simultaneous probability guarantee over this domain is meaningful even though the algorithm will evaluate only
  a small part of it.

== 3 Simultaneous coarse estimates <sec:seed>

The refinement will need an integer estimate at every interval state,
  including states chosen adaptively by later computations.
  We construct these estimates as a random table, while evaluating only the entries that are requested.
  The construction builds on tree and precision-sampling ideas of Andoni, Krauthgamer,
  and Onak #cite(label("AndoniKrauthgamerOnak2010")); the complete bounds needed here are proved below.

#thm([Theorem 3.1.])[
  (Initial estimates).  #emph[With the parameters and labeled interval tree of Section 2,
    there is a lazily evaluated random table $U^(\( 0 \)) \( I \, q \)$ of integers in $\[ 0 \, N \]$ such that,
    with probability at least $0.99$, simultaneously at every state,
#[#set math.equation(numbering: n => "(3.1)")
 $ c \( I \, q \) lt.eq U^(\( 0 \)) \( I \, q \) lt.eq A_(upright("init")) c \( I \, q \) . $ <eq:seed-guarantee>]

 Every zero-cost state has value zero on every execution. Conditional on any first request for an entry and the
   previously exposed randomness, its expected evaluation cost is at most $\( 1 + \| I \| \) 2^(o \( H \))$,
   uniformly in the state. This cost bound includes arithmetic and random sampling and does not require (3.1) to hold.]
] <thm:seed>

=== 3.1 A deterministic shift tree <a-deterministic-shift-tree>

The hierarchical representation below is an adaptation of the E-distance of Andoni,
  Krauthgamer and Onak #cite(label("AndoniKrauthgamerOnak2010")) Definition 3.2 and Theorem 3.3.
  We prove its precise bounds here, including the treatment of unequal lengths,
  empty intervals and bounded integer shifts.

Fix one state and write $n_x = \| I \|$, $n_y = q^(+) - q^(-)$, and $c = c \( I \, q \)$.
  If $n_y > 2 n_x$, return $n_y$: the bounds $n_y - n_x lt.eq c lt.eq n_y$ give the required factor two.
  Otherwise test equality directly and return zero when the strings agree.
  These steps cost $O \( 1 + n_x \)$, since in the branch requiring character comparisons $n_y lt.eq 2 n_x$.
  They include the case $n_x = 0$.

For the remaining case, pad the shorter string at its right end with a fresh tagged symbol to obtain two strings
  of the same length $n lt.eq 2 n_x$. Denote their distance by $d$.
  The length gap is at most $c$, so $d lt.eq 2 c$. Conversely, remove padding from any padded alignment.
  A diagonal joining padding to a real character has cost one and can be replaced by an insertion or deletion of
  the same cost; other operations consuming padding can be removed. Hence

#[#set math.equation(numbering: n => "(3.2)")
 $ 1 lt.eq c lt.eq d lt.eq 2 c \, wide 1 lt.eq n lt.eq N \, wide d lt.eq n . $ <eq:padding-comparison>]

The last bound follows by substituting characters position by position.

For each dyadic guess

$ k in { 1 \, 2 \, 4 \, dots.h \, 2^(ceil.l log_2 n ceil.r) } \, $

split the first padded string in a complete balanced $B$-ary tree of depth $D_0 = ceil.l log_B n ceil.r$.
  Its leaves have width zero or one. Allowed shifts are the integers in $\[ - k \, k \]$.
  At a width-one leaf $w$ starting at position $j$, let $T_w \( v \)$ be the mismatch indicator between its
  character and position $j + 1 + v$ of the second padded string.
  A position outside the latter string has a virtual symbol that always mismatches.
  At a width-zero leaf put $T_w \( v \) = 0$. At an internal node define

#[#set math.equation(numbering: n => "(3.3)")
 $ T_w \( v \) = sum_(i = 1)^B min_(v' in \[ - k \, k \] ∩ bb(Z)) { T_(w_i) \( v' \) + 2 \| v -
   v' \| } . $ <eq:coarse-tree>]

Constant shifts show that $0 lt.eq T_w \( v \) lt.eq \| w \|$, where $\| w \|$ denotes the node’s width.

The virtual symbols are chosen outside the alphabets of both padded strings.
  Thus every leaf value is an edit cost against a finite interval of an extended target string,
  to which Lemma 2 applies.

#thm([Lemma 3.2.])[
  #emph[At the root $o$,
$ d lt.eq T_o \( 0 \) \, wide T_o \( 0 \) lt.eq \( 1 + 2 B D_0 \) d quad upright("if ") k gt.eq d . $

]
] <lem:shift-tree>

#proof[
  The recurrence minimizes the sum of leaf mismatches and twice the total absolute shift difference along tree
    edges, with root shift zero. For any assignment, concatenate the shifted leaf target intervals.
    By traversing the tree in depth-first order, the sum of jumps between consecutive leaf intervals,
    including the connections to the outer endpoints, is at most twice the sum of edge shift differences.
    The connection inequality from Section 2, including its virtual-position version,
    therefore bounds $d$ by the assignment’s cost. This proves the first assertion.
  For the second, fix an optimal padded alignment and choose ordered points $\( j \, b_j \)$ at every source cut,
    with $b_0 = 0$ and $b_n = n$. Assign shift $b_j - j$ to every node starting at $j$.
    Its absolute value is at most $d$, because only insertion and deletion steps change the shift.
    These assignments are allowed when $k gt.eq d$.
  For each child, the shift difference from its parent is at most the cost of the alignment subpath between their
    chosen starting points, and thus at most the cost of the parent’s subpath.
    There are $B$ children per parent; the parent subpaths at each depth partition the alignment.
    Edge differences therefore sum to at most $B d$ at each of the $D_0$ depths.
    A mismatching width-one leaf has positive cost in its corresponding subpath:
    a zero-cost subpath would be a matching diagonal. Leaf mismatches sum to at most $d$,
    and width-zero leaves contribute nothing. The assignment has total cost at most $\( 1 + 2 B D_0 \) d$. ◻
]

=== 3.2 Pruning and precision sampling <pruning-and-precision-sampling>

Nonuniform additive precision is the sampling principle developed by Andoni,
  Krauthgamer and Onak #cite(label("AndoniKrauthgamerOnak2010")) Lemma 3.12 and refined
  in #cite(label("AndoniKrauthgamerOnak2011")) Lemma 1.2, with earlier multiscale sampling antecedents in Indyk
  and Woodruff #cite(label("IndykWoodruff2005")). The reconstruction arguments of Andoni,
  Krauthgamer and Onak already allow estimates to depend on the sampled precisions.
  Here we use a finite threshold distribution and prove an event covering all potential interval states,
  together with the conditional cost of a first request.

Computing all of (3.3) would be too expensive. The guess $k$ will also serve as an additive allowance at the root:
  on one event of high probability, we will obtain an estimate $tilde(T)_o$ between $T_o \/ 2 - k$ and $2 T_o +
  k$ simultaneously for every entry and guess. Then $2 \( tilde(T)_o \( 0 \) + k \)$ is an upper bound on $d$ for
  every guess, and the guess $d lt.eq k < 2 d$ gives an $O \( 1 + B D_0 \)$ approximation.
  We can therefore replace a node by zero whenever its entire cost fits within its additive allowance.
  Larger guesses permit more pruning; their larger allowances are paid back in the returned estimate. Set

$ Q_0 = H^4 \, wide lambda = frac(1, 64 H) \, wide a_o = k . $

At a node with allowance $a_w$, independently for its children draw $R_i$ uniformly from ${ 1 \, dots.h \, B }$ and set

#[#set math.equation(numbering: n => "(3.4)")
 $ t_i = frac(a_w R_i, B Q_0) \, wide a_(w_i) = lambda t_i . $ <eq:coarse-threshold>]

All these random choices can be defined in advance, even below nodes that will be pruned.
  The implementation exposes only those it needs.

If $\| w \| lt.eq a_w$, use the identically zero estimate $tilde(T)_w$. At any other leaf use its exact array.
  At an unpruned internal node first compute

$ hat(s)_i \( v \) = min_(v' in \[ - k \, k \] ∩ bb(Z)) { tilde(T)_(w_i) \( v' \) + 2 \| v - v' \| } \, $

and then put

#[#set math.equation(numbering: n => "(3.5)")
 $ tilde(T)_w \( v \) = sum_(i = 1)^B bold(1)_(hat(s)_i \( v \) gt.eq t_i) max { hat(s)_i \( v \) \,
   a_w \/ Q_0 } . $ <eq:coarse-estimate>]

The descendants used to compute $hat(s)_i \( v \)$ depend on $t_i$,
  so these child estimates cannot be treated as fixed in a concentration bound.
  The proof below first compares their sampled contributions with two lists formed from true child costs.
  It then concentrates those lists without assuming that any child estimate is accurate.

#thm([Lemma 3.3.])[
  #emph[Except on an event of probability less than $0.01$, simultaneously for all initial entries, all guesses,
    all their nodes, and all shifts,
#[#set math.equation(numbering: n => "(3.6)")
 $ T_w \( v \) \/ f_w - a_w lt.eq tilde(T)_w \( v \) lt.eq f_w T_w \( v \) + a_w \, wide f_w =
   (frac(1 + lambda, 1 - lambda))^("height" \( w \)) lt.eq 2 . $ <eq:coarse-accuracy>]

]
] <lem:coarse-precision>

#proof[
  Fix an internal node and a shift, and write $s_i$ for the true child penalty minimum in (3.3).
    Let $f'$ be the factor in (3.6) at its children’s structural height.
    Both $s_i$ and $f'$ are independent of all thresholds. Suppose for the moment that the child accuracy
    inequalities hold with this factor. Adding a nonnegative penalty preserves the lower bound after division by
    $f'$ and the upper bound after multiplication by $f'$. Taking minima gives
  $ s_i \/ f' - lambda t_i lt.eq hat(s)_i \( v \) lt.eq f' s_i + lambda t_i . $
  Let $u = a_w \/ Q_0$ and define
  $ phi.alt_i \( h \) = bold(1)_(h gt.eq t_i) max { h \, u } \, wide h_i^(-) = frac(s_i, f' \( 1 + lambda \)) \,
    wide h_i^(+) = frac(f' s_i, 1 - lambda) . $
  If $h_i^(-) gt.eq t_i$, then $hat(s)_i \( v \) gt.eq \( 1 + lambda \) h_i^(-) - lambda t_i gt.eq h_i^(-)$.
    If $hat(s)_i \( v \) gt.eq t_i$, then $hat(s)_i \( v \) lt.eq f' s_i + lambda hat(s)_i \( v \)$,
    and consequently $hat(s)_i \( v \) lt.eq h_i^(+)$. These implications prove the pathwise sandwich
  #[#set math.equation(numbering: n => "(3.7)")
   $ phi.alt_i \( h_i^(-) \) lt.eq phi.alt_i \( hat(s)_i \( v \) \) lt.eq
     phi.alt_i \( h_i^(+) \) . $ <eq:threshold-sandwich>]
  We now establish concentration independently of the supposition about child accuracy.
    Conditional only on ancestor thresholds, $u$ is fixed and $t_i = u R_i \/ B$ are independent.
    For either of the two fixed argument lists $h_i = h_i^plus.minus$, if $0 lt.eq h_i < u$ then
  $ phi.alt_i \( h_i \) = u thin "Bernoulli" (frac(floor.l B h_i \/ u floor.r, B)) \; $
  if $h_i gt.eq u$, it equals $h_i$ deterministically. Thus
  $ 0 lt.eq h_i - bb(E) phi.alt_i \( h_i \) lt.eq u \/ B \, wide "Var" \( phi.alt_i \( h_i \) \) lt.eq u h_i \,
    wide \| phi.alt_i \( h_i \) - bb(E) phi.alt_i \( h_i \) \| lt.eq u . $
  Write $V = sum_i h_i$ and $Z = sum_i phi.alt_i \( h_i \)$. The total bias is at most $u$.
    Bernstein’s inequality #cite(label("Tropp2021Probability")) Theorem 4.16 at deviation $z = lambda V +
    a_w \/ 2$ gives
  $ Pr \( \| Z - bb(E) Z \| > z \) lt.eq 2 exp (- frac(z^2, 2 u V + \( 2 \/ 3 \) u z)) lt.eq
    2 exp \( - lambda Q_0 \/ 12 \) . $
  For the last inequality, if $V gt.eq a_w$, the denominator is at most $3 u V$ and $z^2 gt.eq lambda a_w V$;
    if $V lt.eq a_w$, the denominator is at most $3 u a_w$ and $z^2 gt.eq a_w^2 \/ 4$.
    Since $u lt.eq a_w \/ 2$, adding the bias yields
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| Z - V \| lt.eq lambda V + a_w $ <eq:threshold-concentration>]
  outside the indicated event.
  These conditional bounds are uniform in the ancestor thresholds, so they also hold unconditionally.
    Take their intersection over both argument lists and all fixed node and shift labels.
    On that intersection, induction from the leaves combines (3.7) and (3.8). The lower and upper bounds become
  $ frac(1 - lambda, f' \( 1 + lambda \)) T_w \( v \) - a_w lt.eq tilde(T)_w \( v \) lt.eq
    frac(f' \( 1 + lambda \), 1 - lambda) T_w \( v \) + a_w \, $
  which is exactly the desired factor update. A pruned node also satisfies the inequalities because $T_w \( v \)
    lt.eq \| w \| lt.eq a_w$; exact leaves do so directly. The factor satisfies $f_w lt.eq exp \( 2 \/ 63 \) < 2$,
    since $D_0 lt.eq H$.
  For completeness, the event count includes the entire domain, not merely requested entries.
    There are $O \( M \( N + 1 \)^3 \)$ labeled main-tree states, $O \( H \)$ guesses per entry,
    $O \( B N \)$ nodes per coarse tree, and $O \( N \)$ shifts per guess.
    The count of the two lists is therefore at most
  $ C M B H \( N + 1 \)^5 lt.eq exp \( 20 H \) $
  for an absolute constant $C$ under the stated cutoff. Here one may use $B \, M \, H lt.eq
    N$ in this regime and $log_2 \( N + 2 \) lt.eq H$. The union failure is at most $2
    exp \( 20 H - H^3 \/ 768 \) < 0.01$. In particular, no conditioning on successful descendants was used in the
    concentration calculation. ◻
]

=== 3.3 Converting the estimate to an integer seed <converting-the-estimate-to-an-integer-seed>

For the padded entry, take the ceiling of

#[#set math.equation(numbering: n => "(3.9)")
 $ min_k 2 #scale(x: 120%, y: 120%)[\(] tilde(T)_o \( 0 \) + k #scale(x: 120%, y: 120%)[\)] $ <eq:initial-output>]

and clamp it to $\[ 0 \, N \]$. On the event of Lemma 5, every candidate is at least $T_o \( 0 \) gt.eq d gt.eq
  c$. A listed guess satisfies $d lt.eq k < 2 d$, and its rounded candidate is at most

$ 4 \( 1 + 2 B D_0 \) d + 4 k + 1 lt.eq \( 25 + 16 B H \) c lt.eq B H^4 c = A_(upright("init")) c . $

Clamping preserves both bounds because $c lt.eq N$. Together with the direct branches this proves the
  approximation assertion in Theorem 3.

=== 3.4 The conditional cost of an adaptive request <the-conditional-cost-of-an-adaptive-request>

We next prove the cost assertion, including executions outside the accuracy event.
  For an array $E$ on $\[ - k \, k \] ∩ bb(Z)$, its penalty transform is computed by a left sweep

$ L \( v \) = min { E \( v \) \, L \( v - 1 \) + 2 } $

with the natural initial value, and the symmetric right sweep. Their pointwise minimum is

$ min_(v') { E \( v' \) + 2 \| v - v' \| } . $

Both sweeps take $O \( k \)$ operations. An identically zero child array, whose transform is also zero,
  is represented by a marker without allocation. At an unpruned internal node the array work is $O \( B k \)$,
  including visits and thresholds for all children. An unpruned leaf costs $O \( k \)$.
  A pruned node needs only its width test and marker.

Let $r$ be a node’s depth in the coarse tree. From (3.4), along any fixed path,

$ a_w = frac(k product R_e, \( 64 B H^5 \)^r) \, wide bb(E)
  [a_(upright("parent")) / a_w thin mid(bar.v) thin a_(upright("parent"))] = 64 H^5 sum_(j = 1)^B 1 / j lt.eq H^8 . $

It follows that $bb(E) \[ k \/ a_w \] lt.eq H^(8 r)$. A node can incur array work only if $\| w \| > a_w$, and pointwise

$ k bold(1)_(\| w \| > a_w) lt.eq \| w \| k / a_w . $

Widths sum to $n$ at each depth. Thus the expected array work for one guess,
  including child overhead charged to expanded parents, is at most

#[#set math.equation(numbering: n => "(3.10)")
 $ O #scale(x: 120%, y: 120%)[\(] 1 + B n \( D_0 + 1 \) H^(8 D_0) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:initial-array-work>]

This estimate uses the random allowances alone and remains valid when the estimated arrays are inaccurate.

All arithmetic and sampling can be performed with finite binary integers.
  The quantities in (3.4) are dyadic; a common denominator for their descendants and the arrays needs
  $O \( D_0 \( p_(*) + 5 \) log H + log H \)$ bits. Minima and maxima select existing dyadic values,
  and sums preserve this common precision. The same-shift candidate in the penalty minimum gives

$ tilde(T)_w \( v \) lt.eq sum_i tilde(T)_(w_i) \( v \) + B a_w \/ Q_0 . $

Since $a_w lt.eq k$ and there are $O \( B n \)$ nodes, all estimate magnitudes are bounded by $n +
  O \( B^2 n k \)$. Their bit lengths, and the cost of ordinary binary arithmetic on them,
  fit the factor $H^(O \( D_0 + p_(*) + 1 \))$. Each $R_i$ requires exactly $log_2 B$ fair random bits.
  Zero arrays are never materialized.

There are $O \( H \)$ guesses, and

$ D_0 lt.eq 1 + frac(H, p_(*) log_2 H) \, wide log_2 #scale(x: 120%, y: 120%)[\(] H^(O \( D_0 + p_(*) + 1 \))
  #scale(x: 120%, y: 120%)[\)] = O (H / p_(*) + \( p_(*) + 1 \) log H) = o \( H \) . $

Consequently (3.10), including the arithmetic factors, all guesses, equality tests, and padding,
  is $\( 1 + \| I \| \) 2^(o \( H \))$ in expectation. Even a full coarse tree with all its shift arrays uses only
  polynomial space: it has $O \( B n \)$ nodes, $O \( n \)$ entries per array, and the bit lengths just bounded.

Finally, assign a separate random stream to every initial entry,
  keyed by its labeled main-tree node and endpoint pair, and cache the completed answer.
  Its calculation does not query other initial entries. Before its first request,
  none of the exposed computation can depend on its unused stream:
  such a dependence would already have required evaluating this entry.
  Conditional on the entire preceding execution and the adaptive request,
  the stream therefore has its original distribution. The expected cost bound applies conditionally exactly as
  stated; repeated requests use the cached answer and pay only lookup work.
  This deferred exposure realizes the same full random table used in the simultaneous probability argument and
  completes the proof of Theorem 3.

== 4 A seed-to-refinement construction <sec:cones>

The initial table has a large approximation factor. We now describe one refinement that reduces this factor while
  controlling expected excess over the true cost. Throughout the construction, fix the entire seed table;
  randomness introduced by the refinement is independent of it.

#thm([Theorem 4.1.])[
  (Refinement).  #emph[Use the parameters and interval tree of Section 2 in the large-input branch.
    Let $A$ be a power of two with $1 lt.eq A lt.eq A_(upright("init"))$,
    and let $U$ be an integer table on every labeled tree node and every valid target state, with
$ 0 lt.eq U \( I \, q \) lt.eq N \, wide c \( I \, q \) lt.eq U \( I \, q \) lt.eq A c \( I \, q \) . $

 Set $a = max { 1 \, A \/ F }$. There is a randomized, finitely executable refinement table $d_S$ such that,
   for every state $\( I \, q \)$,
#[#set math.equation(numbering: n => "(4.1)")
 $ d_S \( I \, q \) gt.eq c \( I \, q \) \/ a \, wide bb(E)
   #scale(x: 120%, y: 120%)[\[] \( d_S \( I \, q \) - c \( I \, q \) \)_(+) #scale(x: 120%, y: 120%)[\]] lt.eq
   c \( I \, q \) \/ ell . $ <eq:refinement-guarantee>]

 The first inequality holds for every outcome of the refinement randomness;
   the expectation in the second is conditional on the fixed table $U$.
   At zero-cost states the returned value is zero for every outcome.]
] <thm:refinement>

We call a seed #emph[good] if its input bounds $c \( I \, q \) lt.eq U \( I \, q \) lt.eq
  A c \( I \, q \)$ hold simultaneously at every state. This section and the next define the refinement table and
  establish its elementary invariants. Sections 6–8 prove the expected-error bound.
  Sections 9 and 10 give the numerical and evaluation algorithms, including their work on inaccurate seed tables.
  The distinction matters: the refinement can underestimate true cost when $a > 1$.

=== 4.1 Cost cones and their local evaluation <cost-cones-and-their-local-evaluation>

The number $a$ is an integer power of two. Define

$ tilde(U) \( I \, q \) = max { ceil.l U \( I \, q \) \/ a ceil.r \, \| z \( I \, q \) \| } . $

Since $F c \( I \, q \)$ is an integer, rounding does not spoil the bounds

#[#set math.equation(numbering: n => "(4.2)")
 $ max { c \( I \, q \) \/ a \, \| z \( I \, q \) \| } lt.eq tilde(U) \( I \, q \) lt.eq
   F c \( I \, q \) . $ <eq:scaled-seed>]

These bounds do not give endpoint regularity: neighboring seed entries can have quite different overestimates.
  We replace the scaled table by a lower envelope of cones.
  The charge $L_0 \| q - r \|_1$ for moving away from a center $r$ preserves the lower bounds $c \/ a$ and $\|
  z \|$, while making the envelope Lipschitz. To evaluate it with few seed queries,
  we retain centers on grids at several cost scales. A grid at the scale of the true cost will provide a nearby
  inexpensive center; its value will then force every minimizing center to be nearby as well.

The scales $b$ are the powers of two from $1$ to the largest power of two at most $N$.
  At scale $b$, put $g_b = max { 1 \, b \/ P }$. A grid state has both coordinates in $g_b
  bb(Z) ∩ \[ 0 \, \| y \| \]$, in nondecreasing order. The state $r_b \( q \)$ rounds both coordinates of $q$ down
  to this grid. All these spacings are integers. If $g_b = 1$, rounding is exact; otherwise

#[#set math.equation(numbering: n => "(4.3)")
 $ \| q - r_b \( q \) \|_1 < 2 b \/ P . $ <eq:grid-error>]

At a nonleaf $I$, consider all cones

$ q mapsto tilde(U) \( I \, r \) + L_0 \| q - r \|_1 $

whose centers are grid states at some scale $b$ with $b \/ 2 lt.eq U \( I \, r \) lt.eq 4 A b$.
  Include also the cone at every state $r$ with $U \( I \, r \) = 0$,
  whether or not it occurs on one of these grids. Define $w_0 \( I \, q \)$ to be their minimum.
  At a leaf set $w_0 \( I \, q \) = c \( I \, q \)$. The exact leaf rule will be used for every later table as well.

#thm([Lemma 4.2.])[
  (Initial cones).  #emph[For the fixed seed in Theorem 6,
#[#set math.equation(numbering: n => "(4.4)")
 $ max { c \/ a \, \| z \| } lt.eq w_0 lt.eq 2 F c \, wide "Lip" \( w_0 \( I \, dot.op \) \) lt.eq
   L_0 . $ <eq:initial-cones>]

 At a nonleaf, the following local rule computes this global minimum exactly.
   If $U \( I \, q \) = 0$, return zero. Otherwise omit the zero cones, enumerate scales
#[#set math.equation(numbering: n => "(4.5)")
 $ U \( I \, q \) \/ \( 16 A^2 \) lt.eq b lt.eq 4 A U \( I \, q \) \, $ <eq:initial-local-scales>]

 and enumerate grid centers at sup distance at most $U \( I \, q \)$ from $q$,
   retaining the eligibility test $b \/ 2 lt.eq U \( I \, r \) lt.eq 4 A b$.]
] <lem:initial-cones>

#proof[
  Each cone dominates $c \( q \) \/ a$ and $\| z \( q \) \|$ by (4.2) and the endpoint Lipschitz bounds.
    Each has Lipschitz constant $L_0$, so their minimum does too. Leaves satisfy these claims directly.
  If $c \( I \, q \) = 0$, the seed has $U \( I \, q \) = 0$, and its own cone gives zero.
    For $c = c \( I \, q \) > 0$, choose $b lt.eq c < 2 b$ and set $r = r_b \( q \)$, $e = \| q - r \|_1$. By (4.3),
  $ c \( I \, r \) gt.eq b - 2 b \/ P gt.eq b \/ 2 \, wide c \( I \, r \) < 2 b + 2 b \/ P lt.eq 4 b . $
  Thus $r$ is an eligible center. Its cone has value at most
  $ F c \( I \, r \) + L_0 e lt.eq F c + \( F + L_0 \) e lt.eq F c + 66 F b \/ P lt.eq 2 F c . $
  Any minimizing cone at a positive-cost state consequently has center distance at most $2 F c \/ L_0 = c \/ 16$.
    Its center’s true cost lies in $\[ 15 c \/ 16 \, 17 c \/ 16 \]$.
    A zero center cannot minimize, since its distance would be at least $c$.
    For a minimizing nonzero center, eligibility therefore gives
  $ b gt.eq frac(U \( I \, r \), 4 A) gt.eq frac(15 c, 64 A) gt.eq frac(U \( I \, q \), 16 A^2) \, wide b lt.eq
    2 U \( I \, r \) lt.eq frac(17 A c, 8) lt.eq 4 A U \( I \, q \) . $
  Its sup distance is at most $c \/ 16 lt.eq U \( I \, q \)$.
    Thus the local list contains a global minimizer, and every member of the local list belongs to the global
    family. The two minima agree. ◻
]

We use this local rule as the executable definition even when the seed is inaccurate,
  returning $N$ if its nonzero branch has no candidate. Its work remains finite without any seed guarantee.
  Indeed, the scale interval has ratio at most $64 A^3$, and $U \( I \, q \) \/ b lt.eq 16 A^2$ there.
  The local list therefore contains $O \( \( 1 + P A^2 \)^2 \( 1 + log A \) \) =
  H^(O \( p_(*) + 1 \))$ raw seed queries. The returned values are nonnegative integers of magnitude
  $O \( \( L_0 + 1 \) N \)$. Global cone identities and Lipschitz continuity are asserted only for a seed
  satisfying Theorem 6.

=== 4.2 Wide actions and Bellman propagation <wide-actions-and-bellman-propagation>

The next operator combines child estimates into a parent estimate.
  We first allow each child to choose its target independently,
  paying the connection charge for gaps and overlaps. Its minimum over earlier child tables will remain an
  available parent option throughout the refinement; the more restricted choices will use current child tables.
  Extending each action cost by an endpoint cone retains spatial regularity.
  Repeated propagation will also supply the average cost table used to predict child alignments.

Let a nonleaf $I = \( l \, u \]$ have child cuts $l = l_0 lt.eq l_1 lt.eq dots.h.c lt.eq l_M = u$,
  so $I_i = \( l_(i - 1) \, l_i \]$. A #emph[representative] is a pair $\( b \, r \)$ with $r$ a grid state at
  scale $b$ and

#[#set math.equation(numbering: n => "(4.6)")
 $ b \/ \( 4 a \) lt.eq w_0 \( I \, r \) lt.eq 8 F b . $ <eq:representative>]

Write $p_0 = r^(-) - l$. The wide action set $cal(A)_(b \, r)$ consists of lists
  $alpha = \( s_1 \, dots.h \, s_M \)$ of valid child grid states satisfying

$ \| s_i^(-) - l_(i - 1) - p_0 \| lt.eq 10 b \, wide \| s_i^(+) - l_i - p_0 \| lt.eq 10 b . $

Consecutive target intervals need not meet. Their discrepancy is paid for by the connection charge
  $"conn"_r \( alpha \)$ defined in Section 2. For child tables $f$, put

#[#set math.equation(numbering: n => "(4.7)")
 $ V_r \( alpha \; f \) & = "conn"_r \( alpha \) + sum_(i = 1)^M f \( I_i \, s_i \) \,\
cal(B)_I \( f \) \( q \) & = min {w_0 \( I \, q \) \, thick min_(\( b \, r \))
  [L \| q - r \|_1 + min_(alpha in cal(A)_(b \, r)) V_r \( alpha \; f \)]} . $ <eq:action-cost>]

Every minimum over an empty set is $+ oo$.

The operator $cal(B)_I$ is monotone in its child tables and is $L$-Lipschitz in $q$.
  It also preserves the lower bound $max { c \/ a \, \| z \| }$.
  For the latter assertion, if each child satisfies the lower bound, then

$ V_r \( alpha \; f \) gt.eq frac("conn"_r \( alpha \) + sum_i c \( I_i \, s_i \), a) gt.eq c \( I \, r \) \/ a \, $

while the net-change-of-shift inequality gives $V_r \( alpha \; f \) gt.eq \| z \( I \, r \) \|$.
  Endpoint Lipschitz continuity extends both bounds along the cone, and $w_0$ satisfies them too.

Define the warmup tables at nonleaves by

#[#set math.equation(numbering: n => "(4.8)")
 $ w_j \( I \, q \) = cal(B)_I \( w_(j - 1) \) \( q \) quad \( 1 lt.eq j lt.eq T \) \, wide m = 1 /
   T sum_(j = 0)^(T - 1) w_j \, wide d_0 = w_T . $ <eq:warmup>]

Here the operator receives the indicated tables on children.
  Because $w_1 lt.eq w_0$ and the operator is monotone, the warmup is nonincreasing. In particular,

#[#set math.equation(numbering: n => "(4.9)")
 $ max { c \/ a \, \| z \| } lt.eq d_0 lt.eq m lt.eq w_0 lt.eq 2 F c \, wide cal(B)_I \( d_0 \) lt.eq
   d_0 . $ <eq:warmup-invariants>]

The last inequality follows by one further application of the same monotonicity.
  The tables $w_j$ and $m$ are $L$-Lipschitz.

The average $m$ is useful because shifting its iteration range by one changes it by only the initial-to-final drop
  divided by $T$:

$ 1 / T sum_(j = 1)^T w_j = m - frac(w_0 - w_T, T) . $

For any fixed representative and wide action, average the inequalities $w_j \( I \, q \) lt.eq L \| q - r \|_1 +
  V_r \( alpha \; w_(j - 1) \)$ and then minimize over that action. The result is

$ m \( I \, q \) - frac(w_0 \( I \, q \) - w_T \( I \, q \), T) lt.eq L \| q - r \|_1 +
  min_(alpha in cal(A)_(b \, r)) V_r \( alpha \; m \) . $

Thus parent and child cost proxies satisfy the Bellman comparison up to a controlled averaging error.
  Section 6 will sum this error over a tree of comparison states.

=== 4.3 Local evaluation of later cones <local-evaluation-of-later-cones>

The Bellman minimum, and later minima containing selected action cones, admit the same local evaluation rule.
  This rule is also what bounds the computation when a seed is wrong.
  We enumerate complete cells because Section 5 will make one shared choice for every cell;
  that choice must be independent of which query first requests the cell.

#thm([Lemma 4.3.])[
  (Cone locality).  #emph[Fix a good seed as in Theorem 6. Take a minimum of $w_0 \( I \, q \)$ and any family of
    cones of slope $L$ with nonnegative base costs at representatives $\( b \, r \)$.
    If $w_0 \( I \, q \) = 0$, its value is zero. Otherwise it suffices to enumerate scales
#[#set math.equation(numbering: n => "(4.10)")
 $ w_0 \( I \, q \) \/ \( 16 F \) lt.eq b lt.eq 8 a w_0 \( I \, q \) $ <eq:local-scales>]

 and the following whole cells at each scale. Partition endpoint-pair space into half-open cells of side $theta
   b$ on each axis, with lower boundaries at multiples of $theta b$.
   Enumerate the cells intersecting the closed sup square of radius $w_0 \( I \, q \)$ about $q$,
   and all valid grid representatives in these cells.]
] <lem:cone-locality>

#proof[
  Write $w = w_0 \( I \, q \) > 0$. A competitive cone has value at most $w$ and therefore $\| q - r \|_1 lt.eq
    w \/ L$. Since $L_0 \/ L = 1 \/ 4$, $3 w \/ 4 lt.eq w_0 \( I \, r \) lt.eq 5 w \/ 4$.
    Representative eligibility yields
  $ b gt.eq 3 w \/ \( 32 F \) > w \/ \( 16 F \) \, wide b lt.eq 5 a w < 8 a w . $
  The representative belongs to the enumerated square and hence to an enumerated cell.
    Conversely, enumerating a whole cell only adds cones already in the global family. This proves exactness. ◻
]

For arbitrary local $w_0$, the scale count in (4.10) is $O \( 1 + log \( a F \) \)$, polynomial in $ell$.
  There are $O \( \( 1 + F \/ theta \)^2 \)$ cells per scale and $O \( \( 1 + P \)^2 \)$ grid states per cell.
  Indeed $w_0 \( I \, q \) \/ b lt.eq 16 F$, and $theta b \/ g_b lt.eq P$.
  Cells and grid points are generated by ranges of integer indices, without scanning unrelated positions.
  These count bounds do not assume a correct seed. Empty lists give the $w_0$ option.

We have now obtained nonincreasing propagated estimates and the cost proxy $m$.
  The next step uses $m$ to identify narrow sets of shared child alignments.
  Expensive searches over the wide actions will use earlier tables; the narrow sets limit calls to current tables.

== 5 Predicted bands and the refined tables <sec:bands>

Starting from the fixed seed and the table $d_0 = w_T$, we now define $d_1 \, dots.h \, d_S$.
  The construction proceeds by node height: when defining the value at a parent and index $t$,
  all child tables through index $t$ are already defined. This is a mathematical ordering,
  not a requirement to evaluate those tables in full. The algorithm will request only the entries needed by the
  choices below.

There are two ways to choose a current-index action. A shared sample compares rounded actions at nearby
  representatives; extending the chosen cost by a cone gives a spatially regular estimate.
  An online rule uses earlier child values to choose an action with small expected accumulated cost relative to
  every fixed action in a predicted band. The parent update combines these two estimates.
  We first construct the band and its child cost bounds, then specify the online rule and the shared samples.

=== 5.1 A band predicted from prefix costs <a-band-predicted-from-prefix-costs>

At a representative $\( b \, r \)$ of a nonleaf, define

$ Z = min_(alpha in cal(A)_(b \, r)) V_r \( alpha \; m \) . $

Skip the band computations at this representative unless $Z$ is finite and strictly positive.
  Otherwise set $hat(v) = z \( I \, r \) \/ Z$, the net shift per unit of predicted cost.
  If shift accumulated proportionally to this cost along an alignment,
  a prefix of cost $C$ would end at shift $p_0 + hat(v) C$.
  We use this relation to predict the shift at each child cut.
  We call $\| hat(v) \| lt.eq 1 - tau$ the #emph[velocity test], and skip unless it holds.

For an internal cut $1 lt.eq j < M$ and a real shift $p$,
  let $Phi_j \( p \)$ be the minimum prefix cost using the first $j$ child restrictions of the wide action set.
  More explicitly, minimize

$ \| s_1^(-) - r^(-) \| + sum_(i = 1)^j m \( I_i \, s_i \) + sum_(i < j) \| s_(i + 1)^(-) -
  s_i^(+) \| + \| s_j^(+) - \( l_j + p \) \| $

over such prefix states. The wide action family is nonempty whenever the band reaches this step,
  so these prefix minima are finite. Each function in the minimum is 1-Lipschitz in $p$, hence so is $Phi_j$.

The prefix cost depends on its proposed ending shift. The predicted shift therefore solves the approximate
  fixed-point relation $p = p_0 + hat(v) Phi_j \( p \)$. The velocity test keeps the Lipschitz constant of $hat(v)
  Phi_j$ below one, so all sufficiently accurate solutions lie in a short interval.
  The band below imposes this relation at every cut.

Let $cal(C)_(b \, r)$ be the following set of shared-endpoint actions on the scale-$b$ grid.
  The outside endpoints are exactly $r$, consecutive child endpoints agree,
  all endpoint shifts are within $6 b$ of $p_0 = r^(-) - l$, and the shift $p$ at every internal cut satisfies

#[#set math.equation(numbering: n => "(5.1)")
 $ \| p - p_0 - hat(v) Phi_j \( p \) \| lt.eq tau theta b \/ M . $ <eq:band>]

All child target states must be valid, so these shared endpoints are in nondecreasing order.
  Skip if $cal(C)_(b \, r)$ is empty.

The possible shifts at any fixed cut have diameter at most $2 theta b \/ M$. In fact two allowed shifts obey

$ \| p - p' \| lt.eq 2 tau theta b \/ M + \| hat(v) \| thin \| Phi_j \( p \) - Phi_j \( p' \) \| lt.eq
  2 tau theta b \/ M + \( 1 - tau \) \| p - p' \| . $

No convexity of the allowed shift set is needed.

We need a uniform cost bound at each child for both action selection and rounding.
  For a nonempty band, let $h_i$ be the smallest power of two at least

$ max {b \/ M \, max_(alpha in cal(C)_(b \, r)) w_0 \( I_i \, s_i \( alpha \) \)} \, wide h_Sigma =
  sum_(i = 1)^M h_i . $

Powers of two below one are allowed here. Every band state at child $i$ has $w_0$ value at most $h_i$.
  These bounds will normalize the online costs and determine a common rounding spacing for each child scale.
  Skip if $h_Sigma > 64 F b$. Choose a canonical band action in a fixed ordering and round its two coordinates
  separately at child $i$ down to multiples of $max { 1 \, theta h_i }$.
  Denote the resulting action by $beta \( b \, r \)$. Different children may round a shared endpoint to different
  positions, so $beta$ can have gaps or overlaps. It is used as a wide action with its connection charge,
  rather than as a band action. Finally, skip unless it belongs to $cal(A)_(b \, r)$ and

#[#set math.equation(numbering: n => "(5.2)")
 $ \| z \( I_i \, s_i \( beta \) \) \| lt.eq 2 h_i wide \( 1 lt.eq i lt.eq M \) . $ <eq:rounded-guard>]

Representatives passing all these tests will be called unskipped.
  These tests affect only the band and rounded-action computations;
  they never remove an action or representative from $cal(B)_I$.

Under the fixed good seed, the last two guards on $beta$ pass whenever the $h_Sigma$ test passes.
  Indeed, $theta h_i gt.eq theta b \/ M gt.eq b \/ P$. All relevant quantities are powers of two,
  so the rounded spacing is a multiple of $g_b$. Rounding preserves the order of each child’s two endpoints and
  the range $\[ 0 \, \| y \| \]$. If its spacing is one, its error is zero;
  otherwise each coordinate error is less than $theta h_i$. Since $\| z \| lt.eq w_0 lt.eq h_i$ before rounding,

$ \| z \( I_i \, s_i \( beta \) \) \| lt.eq h_i + 2 theta h_i lt.eq 2 h_i . $

The endpoint shift radius after rounding is at most $6 b + 64 F theta b < 10 b$.
  Section 6 will prove the earlier $h_Sigma$ test on the needed comparison nodes.

=== 5.2 The finite-mixture interface for online choices <the-finite-mixture-interface-for-online-choices>

The online rule uses child values at indices less than $t$ to select one band action at time $t$.
  Its accumulated current-index cost will be compared with that of each fixed band action in Section 7.
  We encode a mixture of actions by its child-state marginals,
  with weights chosen to recover the unnormalized sum of child costs.

Fix one unskipped band $cal(C) = cal(C)_(b \, r)$. Its coordinates are pairs $\( i \, s \)$,
  one for each child and each state appearing at that child in a band action. Let $d_(cal(C))$ be their number.
  Map each action $alpha$ to the probability vector $rho \( alpha \)$ that places mass $h_i \/
  h_Sigma$ at $\( i \, s_i \( alpha \) \)$ for every child, and zero at its other coordinates.
  Let $cal(Q) = "conv" { rho \( alpha \) : alpha in cal(C) }$.
  Every vector in this convex hull has the same total mass $h_i \/ h_Sigma$ on the coordinates of child $i$.

Define coordinate vectors

$ hat(g)_j \( i \, s \) & = - d_(j - 1) \( I_i \, s \) \/ h_i \,\
Delta_j \( i \, s \) & = \( d_(j - 1) \( I_i \, s \) - d_j \( I_i \, s \) \) \/ h_i \,\
u_j & = hat(g)_j + \( 1 - 2 kappa \) Delta_j . $

Here $hat(g)_j$ predicts the negative normalized current cost from the preceding index,
  and $Delta_j$ is the observed correction:

$ hat(g)_j \( i \, s \) + Delta_j \( i \, s \) = - d_j \( I_i \, s \) \/ h_i \, wide -
  h_Sigma chevron.l hat(g)_j \, rho \( alpha \) chevron.r = sum_i d_(j - 1) \( I_i \, s_i \( alpha \) \) . $

The fixed mass $h_i \/ h_Sigma$ in each child block cancels the normalization by $h_i$.
  The objective below uses $Delta_j$ only for $j < t$ and uses $hat(g)_t$,
  so its required child indices are all strictly earlier than $t$.

With entropy $cal(H) \( rho \) = - sum_k rho_k ln rho_k$, using $0 ln 0 = 0$, let $rho_t$ maximize

#[#set math.equation(numbering: n => "(5.3)")
 $ cal(H) \( rho \) + eta ⟨sum_(j < t) u_j + hat(g)_t \, rho⟩ quad
   upright("over ") rho in cal(Q) . $ <eq:online-objective>]

The algorithm computes a finite mixture of band actions whose vector of expected weights is within $H^(- 3)$ in
  $ell_1$ distance of $rho_t$, then samples that mixture exactly.
  Section 9 constructs this mixture using rational arithmetic and proves its stated accuracy and sampling cost.
  Thus (5.3) specifies an input-output contract for a finite algorithm, not an optimization oracle.

Only the child histories are needed for this rule, not a transcript of earlier queries at the parent.
  Parent draws may be keyed by $\( I \, q \, b \, t \)$ in addition to pass and copy identifiers.
  Group choices and table values are cached on their complete keys,
  and every first parent draw uses a fresh source independent of the complete child tables.
  Section 10 makes the resulting deferred evaluation and its costs explicit.

=== 5.3 Shared group samples and the update <shared-group-samples-and-the-update>

For each node $I$, scale $b$, cell from Lemma 8, and time $1 lt.eq t lt.eq S$,
  group all unskipped representatives in that whole cell. The following procedure chooses one member of each
  nonempty group. It is defined from complete child tables; later we evaluate its required entries on demand.

Sampling and rounding work together here. Sharing the child draws across a cell lets all its representatives reuse
  the same queried child labels. Rounding then limits how many different states at one such child can occur across
  the group. This combination, rather than band width alone, bounds the number of current-index recursive calls.

For each power of two $h$ in $\[ b \/ M \, 64 F b \]$, set

$ k_h = min { M \, ceil.l Q_1 M h \/ b ceil.r } . $

For each member $\( b \, r \)$, we estimate the child sum in $V_r \( beta \( b \, r \) \; d_t \)$ by separating
  the children according to their $h_i$. If $k_h = M$, include the contribution with $h_i = h$ exactly.
  Otherwise draw $k_h$ independent uniform child indices with replacement,
  using the same draws for every member of this group at this scale.
  For each sampled child include its $d_t$ value if its $h_i = h$, and zero otherwise;
  multiply the sampled sum by $M \/ k_h$. Add the connection charge exactly.
  Select a member minimizing this estimate, breaking ties by a fixed ordering.
  Then evaluate its actual action cost using all children. Samples used for different parent groups and times are
  independent and are independent of descendant randomness.

For example, when $k_h < M$, there are $O \( Q_1 M h \/ b \)$ sampled child labels,
  and at most $O \( theta^(- 2) \( 1 + b \/ h \) \)$ rounded states at each label across the cell.
  Their product is $M ell^(O \( 1 \))$. Lemma 22 proves this count and the analogous bound for exact scales,
  including executions with inaccurate seeds.

Let $Pi_t \( I \, q \)$ be the minimum of $cal(B)_I \( d_(t - 1) \) \( q \)$ and the actual selected group costs,
  each extended from its selected representative by $L \| q - r \|_1$.
  Compute this minimum by (4.10) and whole-cell enumeration.
  A group’s choice is cached for the whole cell, independent of which query first requests it.
  Lemma 8 shows that this local computation equals the global cone minimum for a good seed.

There is also an online action query at each scale passing (4.10).
  Put $r = r_b \( q \)$ and proceed only if this is an unskipped representative.
  Draw one action $alpha_t in cal(C)_(b \, r)$ by the rule just defined,
  which uses child histories with index less than $t$. Evaluate

$ L \| q - r \|_1 + sum_i d_t \( I_i \, s_i \( alpha_t \) \) . $

Let $Y_t \( I \, q \)$ be the minimum of these online query values, or $+ oo$ if there are none. At a nonleaf define

#[#set math.equation(numbering: n => "(5.4)")
 $ d_t \( I \, q \) =
   cases(delim: "{", 0 \, & w_0 \( I \, q \) = 0 \,, min {Pi_t \( I \, q \) \, max {frac(Pi_t \( I \, q \), 1 +
   delta) \, Y_t \( I \, q \)}} \, & w_0 \( I \, q \) > 0 .) $ <eq:refined-update>]

Leaves continue to use their exact values. At a positive $w_0$ state,
  this update truncates $Y_t$ to the interval $\[ Pi_t \/ \( 1 + delta \) \, Pi_t \]$:
  an inexpensive online action can improve the value only within this interval.
  The upper endpoint retains the Bellman comparison, while the lower endpoint transfers the spatial regularity of
  $Pi_t$ to $d_t$ up to a factor $1 + delta$. For a fixed pass,
  these definitions are well founded by induction on node height:
  current-index values are requested only at children, and at a fixed node the remaining refinement values have
  earlier indices. Section 10 gives the complete lazy evaluation order across passes.

=== 5.4 Deterministic invariants <deterministic-invariants>

#thm([Lemma 5.1.])[
  #emph[For a seed satisfying Theorem 6, every outcome of the refinement obeys
#[#set math.equation(numbering: n => "(5.5)")
 $ max { c \/ a \, \| z \| } & lt.eq d_t lt.eq d_(t - 1) lt.eq w_0 \,\
d_t \( I \, q \) & lt.eq \( 1 + delta \) d_t \( I \, q' \) + L \| q - q' \|_1 . $ <eq:refinement-invariants>]

 At nonleaves one also has
#[#set math.equation(numbering: n => "(5.6)")
 $ cal(B)_I \( d_t \) \( q \) lt.eq d_t \( I \, q \) lt.eq cal(B)_I \( d_(t - 1) \) \( q \) . $ <eq:bellman-sandwich>]

 For $d_0$, the spatial bound holds with Lipschitz constant $L$ and without the factor $1 + delta$.]
] <lem:refinement-invariants>

#proof[
  Induct on node height, and at a fixed node on $t$. Every extra candidate in $Pi_t$ is a current-value
    wide-action cone. The Bellman candidate uses earlier child values,
    which are at least the current ones by induction. Hence $Pi_t gt.eq cal(B)_I \( d_t \)$, whereas $Pi_t lt.eq
    cal(B)_I \( d_(t - 1) \)$. Each online candidate is a current-value wide-action cone too, so $Y_t gt.eq
    cal(B)_I \( d_t \)$, including the empty case. Taking the specified minimum and maximum in (5.4) proves (5.6).
    In particular, no lower bound is inferred from $Pi_t \/ \( 1 + delta \)$ alone.
  At $t = 1$, (4.9) now gives $d_1 lt.eq d_0$. At later times the left inequality in (5.6) at time $t -
    1$ gives $d_t lt.eq d_(t - 1)$. The lower bound follows from Bellman preservation and the child induction.
  The global cone interpretation makes $Pi_t$ $L$-Lipschitz, whether or not any group estimate is accurate.
    Moreover $Pi_t \/ \( 1 + delta \) lt.eq d_t lt.eq Pi_t$. Thus
  $ d_t \( I \, q \) lt.eq Pi_t \( I \, q \) lt.eq Pi_t \( I \, q' \) + L \| q -
    q' \|_1 lt.eq \( 1 + delta \) d_t \( I \, q' \) + L \| q - q' \|_1 . $
  If $w_0 \( I \, q \) = 0$, the Bellman and $Pi_t$ values are zero,
    and the explicit zero branch agrees with these inequalities. The assertions for $d_0$ follow from the warmup. ◻
]

For execution on an arbitrary seed, the local construction still gives nonnegative values at most its local $w_0$.
  All representative lists and skipped-band tests remain finite.
  We use these unconditional facts for work bounds, and do not extend the correctness invariants of Lemma 9 to
  inaccurate seeds.

=== 5.5 Accuracy of one group selection <accuracy-of-one-group-selection>

For a band action define $x_t \( alpha \) = sum_i d_t \( I_i \, s_i \( alpha \) \)$.
  Two band actions differ by at most $4 theta b \/ M$ in each child’s endpoint-pair metric.
  Rounding the canonical action adds at most $2 theta h_i$, so $\| s_i \( alpha \) - s_i \( beta \) \|_1 lt.eq
  6 theta h_i$. Also $"conn"_r \( beta \) lt.eq 2 theta h_Sigma$,
  because the unrounded action has shared endpoints. It follows that

#[#set math.equation(numbering: n => "(5.7)")
 $ V_r \( beta \; d_t \) & lt.eq \( 1 + delta \) x_t \( alpha \) + \( 6 L + 2 \) theta h_Sigma \,\
d_t \( I_i \, s_i \( beta \) \) & lt.eq 2 h_i . $ <eq:rounded-action>]

The first inequality uses (5.5). For the second, use $d_t lt.eq
  w_0$ and the $L_0$-Lipschitz bound to obtain $w_0 \( I_i \, s_i \( beta \) \) lt.eq h_i + 2 L_0 theta h_i lt.eq
  2 h_i$.

#thm([Lemma 5.2.])[
  (One-group accuracy).  #emph[Under the seed hypothesis of Theorem 6,
    fix complete child tables and one group at time $t$. With conditional probability at least $1 - H^(- 4)$,
    all action-cost estimates used to choose its representative are within $gamma b$ of their actual costs.
    Consequently, for any specified unskipped member $\( b \, r \)$ of this group, on the same event,
    simultaneously for every valid parent state $q$ and every $alpha in cal(C)_(b \, r)$,
#[#set math.equation(numbering: n => "(5.8)")
 $ Pi_t \( I \, q \) lt.eq L \| q - r \|_1 + \( 1 + delta \) x_t \( alpha \) + e_(*) b \, wide e_(*) = 2 gamma +
   512 L F theta lt.eq kappa delta . $ <eq:group-accuracy>]

 Here the inequality uses the global cone minimum, equivalently its local evaluation from Lemma 8.]
] <lem:group-accuracy>

#proof[
  Conditioning fixes the bands, the $h_i$, the rounded actions, and all their child costs.
    The parent’s group samples remain independent of these data.
    For a fixed member and sampled scale $h$, normalize one sample to
  $ X = M / b bold(1)_(h_i = h) thin d_t \( I_i \, s_i \( beta \) \) \, $
  where $i$ is uniform in ${ 1 \, dots.h \, M }$. By (5.7),
  $ 0 lt.eq X lt.eq 2 M h \/ b \, wide bb(E) X lt.eq 2 h_Sigma \/ b lt.eq 128 F \, wide "Var" \( X \) lt.eq
    256 F M h \/ b . $
  When $k_h < M$, the number of independent samples is at least $Q_1 M h \/ b$.
    Bernstein’s inequality #cite(label("Tropp2021Probability")) Theorem 4.16, with normalized error $alpha_0 =
    gamma \/ \( 2 ell \)$, gives a failure probability at most
  $ 2 exp (- frac(Q_1 alpha_0^2, 512 F + 4 alpha_0 \/ 3)) lt.eq 2 exp \( - ell^37 \/ 3000 \) . $
  When $k_h = M$, the contribution is exact and has no failure event.
    There are at most $2 ell$ scales and at most $\( P + 1 \)^2$ group members.
    A union bound is at most $H^(- 4)$ at the absolute cutoff.
    Summing the errors over scales gives error at most $gamma b$ for every member.
    Shared samples between members cause no difficulty for this union bound.
  On this event, estimated-cost minimization followed by actual evaluation selects a cost at most that of the
    specified member plus $2 gamma b$. The selected representative is in the same cell,
    so its endpoint-pair distance from $r$ is at most $2 theta b$.
    Using (5.7) and $h_Sigma lt.eq 64 F b$ therefore gives (5.8), since its additive coefficient is at most
  $ 2 gamma + \( 384 L F + 128 F + 2 L \) theta lt.eq 2 gamma + 512 L F theta lt.eq kappa delta . $
  The comparison with every band action is simultaneous because (5.7) is deterministic and uniform in that action. ◻
]

This is a conditional statement for one whole cell and time.
  The accuracy proof will not require all group samples throughout the recursion to succeed together.
  Instead it will charge each group’s failure probability inside an expected regret bound at its comparison node.

== 6 A comparison tree and cost-weighted curvature <sec:comparison>

Multiscale restrictions of alignment paths, controlled by bounds on their total deviation,
  are central to Mao and Rubinstein’s approximation scheme #cite(label("MaoRubinstein2026")) Sections 2.3 and 6.1.
  Here the weights are warmup cost estimates. They need not add exactly from children to parent,
  so our energy calculation also charges their mass discrepancy and the difference between a comparison action and
  a minimum wide action.

Fix a seed table satisfying the hypotheses of Theorem 6. We construct a comparison tree from exact alignments.
  Its states are fixed before the randomness of this refinement is drawn.
  The warmup values supply weights on this tree. A telescoping energy calculation controls the total cost of nodes
  with large curvature or a large gap between the comparison action and the minimum wide action.
  At the other nodes, the velocity test has two useful outcomes.
  Passing it places the comparison action in the computed band;
  failing it means that length imbalance nearly accounts for the warmup cost.
  Section 7 will use these alternatives to bound the refinement error.

=== 6.1 Exact paths and rounded child states <exact-paths-and-rounded-child-states>

Start at a state $\( I \, q \)$ of true cost $D = c \( I \, q \)$.
  If $D = 0$, the good-seed bounds force all its estimates to be zero, so assume $D > 0$.
  Stop a branch at a leaf of the interval tree or at a state of cost zero.
  At each remaining node, write $c = c \( I \, q \) > 0$, choose the dyadic scale $b$ with $b lt.eq c < 2 b$, and put

$ r = r_b \( q \) \, wide e = \| q - r \|_1 lt.eq 2 b \/ P . $

Choose an optimal alignment for $\( I \, r \)$ and points on this path at the child cuts, in their path order.
  Use its exact endpoints at the outside cuts. For repeated cuts, repeated path points are permitted;
  alternatively a vertical segment can be assigned to one of the intervening empty children.
  Round the internal target anchors down to the grid at scale $b$.
  The resulting child states $q_1 \, dots.h \, q_M$ remain ordered and share endpoints,
  with outside endpoints exactly $r$. Denote this action by $alpha^(*)$,
  and continue the construction at its child states.

Fix a deterministic order for all choices of optimal paths and cut points.
  The entire comparison tree, including its stopping states,
  then depends only on the input strings and its starting state.
  In particular it is independent of every group sample and online draw in the refinement.
  This tree is used only in the proof.

#thm([Lemma 6.1.])[
  (Comparison costs).  #emph[At each nonterminal of the comparison tree, $\( b \, r \)$ is a representative,
    $b$ satisfies the local scale restriction (4.10), and $alpha^(*)$ is a wide action whose endpoint shifts are
    within $6 b$ of $p_0 = r^(-) - l$. Writing $c_i = c \( I_i \, q_i \)$, we have
#[#set math.equation(numbering: n => "(6.1)")
 $ c \( I \, r \) lt.eq sum_i c_i lt.eq \( 1 + 4 M \/ P \) c \, wide c lt.eq L e + sum_i c_i . $ <eq:comparison-split>]

 Let $C_(upright("term"))$ be the sum of terminal true costs. Then
#[#set math.equation(numbering: n => "(6.2)")
 $ C_(upright("term")) & lt.eq \( 1 + 8 M J \/ P \) D lt.eq 2 D \,\
sum_(upright("nonterminal")) c & lt.eq 2 J D \, & sum_(upright("nonterminal")) e & lt.eq
  4 J D \/ P . $ <eq:comparison-totals>]

 The sum of true costs at any depth is at most $2 D$, also if stopped costs are carried unchanged to subsequent
   depths. At every terminal, $m = c$ and every refinement estimate equals $c$.]
] <lem:comparison-tree>

#proof[
  If the grid spacing is one, no rounding changes any endpoint. Otherwise an endpoint moves by less than $b \/ P$. Thus
  $ c - e lt.eq c \( I \, r \) lt.eq c + e . $
  The initial-cone bounds give
  $ w_0 \( I \, r \) gt.eq c \( I \, r \) \/ a gt.eq b \/ \( 4 a \) \, wide w_0 \( I \, r \) lt.eq
    2 F c \( I \, r \) lt.eq 8 F b \, $
  so $\( b \, r \)$ is a representative. At $q$, the same bounds imply $w_0 \( I \, q \) \/ \( 16 F \) lt.eq
    b lt.eq 8 a w_0 \( I \, q \)$, as required for (4.10).
  Along an alignment, each change of shift is caused by an insertion or deletion and is at most the cost of that
    part of the path. Hence every unrounded anchor shift differs from $p_0$ by at most $c \( I \, r \)$.
    Rounding adds less than $b \/ P$, so the distance is at most
  $ c + e + b \/ P < \( 2 + 3 \/ P \) b < 6 b . $
  This proves the wide-action and radius assertions.
  The exact subpath costs before rounding sum to $c \( I \, r \)$.
    Each internal anchor affects the endpoints of two child problems. Endpoint Lipschitz continuity therefore gives
  $ sum_i c_i lt.eq c \( I \, r \) + 2 \( M - 1 \) b \/ P lt.eq c + 2 M b \/ P lt.eq \( 1 + 4 M \/ P \) c . $
  Concatenation gives the other inequality in the first part of (6.1); it also gives $c lt.eq c \( I \, r \) +
    e lt.eq sum_i c_i + L e$. These arguments apply without change to repeated cuts and empty child intervals.
  At each successive frontier of the tree, carry terminal costs unchanged.
    The frontier sum grows by a factor at most $1 + 4 M \/ P$ in one step.
    The parameter bounds give $4 M J \/ P lt.eq 1 \/ 2$, and consequently
  $ \( 1 + 4 M \/ P \)^J lt.eq 1 + 8 M J \/ P lt.eq 2 . $
  This proves the terminal and level bounds. There are at most $J$ nonterminal levels.
    Summing $e lt.eq 2 b \/ P lt.eq 2 c \/ P$ proves the remaining bounds in (6.2).
  At a leaf, every table uses the exact answer. At a zero-cost state,
    the good seed is zero and the upper bound $w_0 lt.eq 2 F c$ forces all warmup and refinement values to be
    zero. These are precisely the terminal cases. ◻
]

=== 6.2 Mass and energy telescopes <mass-and-energy-telescopes>

If the warmup masses added exactly from children to parent,
  the energies $z^2 \/ m$ would telescope up to endpoint-rounding errors. The masses do not add exactly:
  a parent’s mass can be either larger or smaller than its children’s total.
  The warmup inequalities bound the total upward discrepancy,
  and conservation of mass over the comparison tree then bounds the total downward discrepancy as well.
  This is why the energy argument can use cost estimates instead of exact additive weights.

At a nonterminal use the representative and child states just constructed, and define

$ m_q = m \( I \, q \) \, wide m_i = m \( I_i \, q_i \) \, wide W = sum_i m_i \, wide G = W - Z \, wide R = m_q - W . $

Here $Z$ is the minimum wide-action cost with child table $m$, as in Section 5.
  The comparison action has zero connection cost, so $W gt.eq Z$. The lower invariants and the comparison costs imply

#[#set math.equation(numbering: n => "(6.3)")
 $ 0 < max { c \( I \, r \) \/ a \, \| z \( I \, r \) \| } lt.eq Z lt.eq W lt.eq
   4 F c < 8 F b . $ <eq:comparison-masses>]

In particular, the denominator $Z$ defining $hat(v)$ is positive at every nonterminal comparison representative.

Write $z_i = z \( I_i \, q_i \)$ and $z_r = z \( I \, r \)$.
  Since the child targets share endpoints, $sum_i z_i = z_r$. Define the curvature quantity

#[#set math.equation(numbering: n => "(6.4)")
 $ K = sum_i z_i^2 / m_i - z_r^2 / W \, $ <eq:curvature-definition>]

with $0 \/ 0 = 0$. A zero $m_i$ necessarily has $z_i = 0$ by the lower invariant.
  For $v = z_r \/ W$, the weighted variance identity is

#[#set math.equation(numbering: n => "(6.5)")
 $ K = sum_(i : m_i > 0) frac(\( z_i - v m_i \)^2, m_i) gt.eq 0 . $ <eq:weighted-variance>]

These weights are costs supplied by the warmup; they are not interval lengths.

#thm([Lemma 6.2.])[
  (Total curvature).  #emph[On the fixed comparison tree, put $h = L e +
    w_0 \( I \, q \) \/ T$ at each nonterminal. Then
#[#set math.equation(numbering: n => "(6.6)")
 $ sum_(upright("nonterminal")) \( K + G \) lt.eq 4 C_(upright("term")) + 3 sum_(upright("nonterminal")) e +
   4 sum_(upright("nonterminal")) h . $ <eq:curvature-structural>]

 Consequently,
#[#set math.equation(numbering: n => "(6.7)")
 $ sum_(upright("nonterminal")) \( K + G \) lt.eq 5000 F \( 1 + J \/ P + J \/ T \) D . $ <eq:curvature-total>]

]
] <lem:curvature-telescope>

#proof[
  First compare the parent and child warmup averages. For each wide action,
    average the parent warmup inequalities over indices $1 \, dots.h \, T$, using child indices $0 \, dots.h \,
    T - 1$. Minimize the resulting action cost. This gives
  $ m_q - frac(w_0 \( I \, q \) - w_T \( I \, q \), T) lt.eq L e + Z . $
  Thus
  #[#set math.equation(numbering: n => "(6.8)")
   $ R + G lt.eq h \, wide R_(+) lt.eq h \, wide G lt.eq R_(-) + h \, wide R_plus.minus = max { plus.minus R \,
     0 } . $ <eq:warmup-mass-slack>]
  The masses cancel exactly across the tree:
  $ sum R = m_(upright("root")) - C_(upright("term")) \, wide sum R_(-) lt.eq sum R_(+) +
    C_(upright("term")) lt.eq sum h + C_(upright("term")) . $
  In particular, summing $G lt.eq R_(-) + h$ gives $sum G lt.eq C_(upright("term")) + 2 sum h$.
  Next define the energy of any comparison state by
  $ E \( I \, q \) = z \( I \, q \)^2 \/ m \( I \, q \) \, $
  again using $0 \/ 0 = 0$. At a nonterminal put $z_q = z \( I \, q \)$.
    We have $\| z_q \| lt.eq m_q$, $\| z_r - z_q \| lt.eq e$, and $\| z_r \| lt.eq W$. Moreover,
  $ e lt.eq 2 c \/ P lt.eq 2 a m_q \/ P lt.eq m_q \, $
  because $a lt.eq A_(upright("init"))$ and $2 A_(upright("init")) < P$. Therefore $\| z_r \| lt.eq 2 m_q$. The identity
  $ z_q^2 / m_q - z_r^2 / W = frac(z_q^2 - z_r^2, m_q) + frac(z_r^2 \( W - m_q \), m_q W) $
  has first term at most $3 e$. If $W lt.eq m_q$, its second term is nonpositive;
    otherwise the bounds $\| z_r \| lt.eq W$ and $\| z_r \| lt.eq 2 m_q$ bound it by $2 \( W - m_q \) = 2 R_(-)$.
    It follows that
  #[#set math.equation(numbering: n => "(6.9)")
   $ K lt.eq sum_i E \( I_i \, q_i \) - E \( I \, q \) + 3 e + 2 R_(-) . $ <eq:local-energy-telescope>]
  No zero denominator occurs at a nonterminal, by (6.3); zero child masses have already been treated.
  Terminal energies are at most their true costs, and the root energy is nonnegative. Summing (6.9) therefore gives
  $ sum K lt.eq C_(upright("term")) + 3 sum e + 2 sum R_(-) lt.eq 3 C_(upright("term")) + 3 sum e + 2 sum h . $
  Adding the preceding bound on $sum G$ proves (6.6). It remains only to substitute the comparison-tree bounds.
    By Lemma 11 and $w_0 lt.eq 2 F c$,
  #[#set math.equation(numbering: n => "(6.10)")
   $ sum h lt.eq 512 F J D \/ P + 4 F J D \/ T . $ <eq:total-warmup-slack>]
  Together with (6.2), this yields
  $ sum \( K + G \) lt.eq 8 D + \( 2048 F + 12 \) J D \/ P + 16 F J D \/ T \, $
  which implies (6.7). ◻
]

Call a nonterminal #emph[bad] if $K > b H^(- 1 \/ 4)$ or $G > b H^(- 1 \/ 4)$; otherwise call it #emph[non-bad].
  These are conditions on the deterministic comparison tree and its warmup values.

#thm([Corollary 6.3.])[
  #emph[The total true cost of bad nodes satisfies
#[#set math.equation(numbering: n => "(6.11)")
 $ sum_(upright("bad")) c lt.eq 10000 F H^(1 \/ 4) \( 1 + J \/ P + J \/ T \) D . $ <eq:bad-node-cost>]

]
] <cor:bad-node-cost>

#proof[
  At a bad node, $c < 2 b < 2 H^(1 \/ 4) \( K + G \)$. Sum and apply Lemma 12. ◻
]

=== 6.3 Coverage by the computed bands <coverage-by-the-computed-bands>

The preceding estimate controls the cost of exceptional nodes.
  We now show that at every remaining node which passes the velocity test,
  the band and rounding guards retain the comparison action.
  This is the point where cost-weighted curvature produces a usable prediction for the algorithm.

#thm([Lemma 6.4.])[
  (Comparison-band coverage).  #emph[At a non-bad comparison node with $\| hat(v) \| lt.eq 1 - tau$,
    the action $alpha^(*)$ belongs to $cal(C)_(b \, r)$. Its representative is not skipped:
    the band is nonempty, $h_Sigma lt.eq 64 F b$, and the rounded action $beta \( b \, r \)$ passes both the
    wide-action and imbalance guards.]
] <lem:comparison-band>

#proof[
  Let $p_j^(*)$ be the comparison shift at internal cut $j$, and write $M_j = sum_(i lt.eq j) m_i$.
    The comparison prefix is feasible for $Phi_j \( p_j^(*) \)$, so this prefix cost is at most $M_j$.
    Conversely, concatenate any feasible prefix in that minimum with the comparison suffix.
    The prefix’s final jump is exactly its connection to the suffix.
    The resulting wide action has cost at least $Z$, and hence
  $ M_j - G lt.eq Phi_j \( p_j^(*) \) lt.eq M_j . $
  With $v = z_r \/ W$, we also have
  $ \| v - hat(v) \| W = \| z_r \| G \/ Z lt.eq G . $
  Weighted Cauchy–Schwarz in (6.5) gives
  $ sum_i \| z_i - v m_i \| lt.eq sqrt(K W) . $
  The shared endpoints imply $p_j^(*) - p_0 = sum_(i lt.eq j) z_i$. Combining the last three observations yields
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| p_j^(*) - p_0 - hat(v) Phi_j \( p_j^(*) \) \| lt.eq sqrt(K W) + 2 G lt.eq
     tau theta b \/ M . $ <eq:band-coverage>]
  For completeness, the last numerical inequality follows from $K \, G lt.eq b H^(- 1 \/ 4)$, $W < 8 F b$,
    and the parameter bounds:
  $ M / b \( sqrt(K W) + 2 G \) lt.eq sqrt(8 ell) thin H^(- 3 \/ 40) + 2 H^(- 1 \/ 5) lt.eq ell^(- 44) = tau theta . $
  Indeed $ell^200 lt.eq H^(1 \/ 100)$ bounds the middle expression by $sqrt(8 ell) thin ell^(- 1500) +
    2 ell^(- 4000)$. The radius and shared-endpoint conditions were proved in Lemma 11.
    Thus (6.12) proves $alpha^(*) in cal(C)_(b \, r)$.
  The diameter bound for the band implies that any of its child states is within $4 theta b \/
    M$ of $q_i$ in endpoint metric. Using the $L_0$-Lipschitz property of $w_0$ and the factor of at most two from
    dyadic ceiling, we get
  $ h_Sigma & lt.eq 2 b + 2 sum_i w_0 \( I_i \, q_i \) + 8 L_0 theta b\
 & lt.eq 2 b + 4 F sum_i c_i + 8 L_0 theta b lt.eq 64 F b . $
  The last step uses (6.1), $c < 2 b$, and the parameter range. This verifies the sum guard.
  Under the fixed good seed, the rounding verification following (5.2) applies as soon as this sum guard holds.
    It shows that $beta \( b \, r \)$ is a wide action and satisfies the imbalance guard.
    Rounding preserves the order of each child’s two endpoints;
    different child spacings may separate shared endpoints, with total connection charge at most $2 theta
    h_Sigma$. Thus every guard passes. ◻
]

== 7 Conditional regret and the first crossing <sec:regret>

Fix a seed table satisfying the hypothesis of Theorem 6, and fix the comparison tree from Section 6.
  We will bound the error accumulated at its nodes over the refinement indices.
  The estimates may lie below true cost when $a > 1$. To keep such underestimation from cancelling an error
  elsewhere, define, for the analysis only,

$ overline(d)_t \( I \, q \) = max { c \( I \, q \) \, d_t \( I \, q \) } . $

At a nonterminal comparison node use the notation $c \, b \, r \, e \, q_i \, m_i \, W \, G \, K$ of Section 6, and set

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(R)_t \( I \, q \) = overline(d)_t \( I \, q \) - L e -
   sum_i overline(d)_t \( I_i \, q_i \) . $ <eq:node-regret-definition>]

These quantities telescope over the fixed comparison tree.
  We first bound their sum in time at an arbitrary node, then improve that bound on a node whose comparison action
  belongs to a computed band.

=== 7.1 A telescoping bound at every comparison node <a-telescoping-bound-at-every-comparison-node>

#thm([Lemma 7.1.])[
  #emph[At every nonterminal comparison node,
#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(t = 1)^S cal(R)_t lt.eq sum_i #scale(x: 120%, y: 120%)[\(] overline(d)_0 -
   overline(d)_S #scale(x: 120%, y: 120%)[\)] \( I_i \, q_i \) lt.eq sum_i \( m_i - \| z_i \| \) lt.eq
   W - \| z \( I \, r \) \| \, $ <eq:generic-regret>]

 where $z_i = z \( I_i \, q_i \)$. In particular, the bound is at most $4 F c$.
   If the node is not bad and $\| hat(v) \| > 1 - tau$, it is at most $\( H^(- 1 \/ 4) + 4 tau F \) c$.]
] <lem:generic-regret>

#proof[
  The Bellman option and the comparison action give
  $ d_t \( I \, q \) lt.eq L e + sum_i d_(t - 1) \( I_i \, q_i \) . $
  The right side with all child values replaced by their clipped values is at least $c$, by Equation (6.1).
    It therefore also bounds $overline(d)_t \( I \, q \)$. Subtracting the same expression at index $t$ and
    summing proves the first inequality in Equation (7.2).
  For the second inequality, consider a child separately. If $d_0 lt.eq c_i$,
    monotonicity makes both clipped endpoint values equal to $c_i$, so their difference is zero,
    while $m_i gt.eq \| z_i \|$. If $d_0 > c_i$, then $overline(d)_0 = d_0 lt.eq
    m_i$ and $overline(d)_S gt.eq \| z_i \|$. This proves the required difference bound in both cases;
    it does not require $overline(d)_0 lt.eq m_i$ in the first case.
    Finally, $sum_i \| z_i \| gt.eq \| z \( I \, r \) \|$ and $W lt.eq 4 F c$.
  For the last assertion, $\| hat(v) \| = \| z \( I \, r \) \| \/ Z > 1 - tau$ implies
  $ W - \| z \( I \, r \) \| lt.eq G + tau W lt.eq \( H^(- 1 \/ 4) + 4 tau F \) c \, $
  using $G lt.eq b H^(- 1 \/ 4)$ and $b lt.eq c$ at a node that is not bad. ◻
]

=== 7.2 An entropy inequality with fixed block masses <an-entropy-inequality-with-fixed-block-masses>

Exponential weighting and its potential analysis have a classical role in online learning;
  see Freund and Schapire #cite(label("FreundSchapire1997")).
  Our predicted objective has the form of optimistic regularized leader,
  as studied by Rakhlin and Sridharan #cite(label("RakhlinSridharan2013")) Section 2.
  For our action vectors, each child receives a fixed total probability mass.
  Cost decrements may differ greatly between children, but their variation within a child is small.
  The following deterministic lemma isolates the reason that this weaker variation bound suffices.

#thm([Lemma 7.2.])[
  (Monotone costs with fixed block masses).  #emph[Let $cal(Q)$ be a nonempty compact convex set of probability
    vectors in $bb(R)^d$, containing a vector with every coordinate positive.
    Partition the coordinates into blocks, and suppose that the total mass in each block is the same for every
    vector in $cal(Q)$. For an integer $S gt.eq 1$, let $f_0 \, dots.h \,
    f_S in \[ 0 \, 1 \]^d$ be coordinatewise nonincreasing. For $eta > 0$ and $0 < kappa < 1 \/ 2$, set
$ hat(g)_t = - f_(t - 1) \, wide Delta_t = f_(t - 1) - f_t \, wide u_t = hat(g)_t + \( 1 - 2 kappa \) Delta_t . $

 Suppose that the range of $Delta_t$ within each block is at most $kappa \/ eta$ for every $1 lt.eq t lt.eq S$.
   Let $rho_t$ maximize
$ cal(H) \( rho \) + eta ⟨sum_(j < t) u_j + hat(g)_t \, rho⟩ quad upright("over ") rho in cal(Q) \, wide
  cal(H) \( rho \) = - sum_k rho_k ln rho_k \, $

 with $0 ln 0 = 0$. For every $rho^(*) in cal(Q)$ and every integer $0 lt.eq s lt.eq S$,
#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(t = 1)^s ⟨f_t + kappa Delta_t \, rho_t⟩ lt.eq  & sum_(t = 1)^s ⟨f_t \, rho^(*)⟩ + frac(ln d, eta) +
   2 kappa . $ <eq:entropy-regret>]

 For any $zeta gt.eq 0$, replacing each $rho_t$ on the left by a vector within $zeta$ in $ell_1$ distance adds at
   most $s zeta$ to the bound.]
] <lem:entropy>

#proof[
  The monotone cost vectors satisfy, coordinatewise,
  #[#set math.equation(numbering: n => "(7.4)")
   $ Delta_t gt.eq 0 \, wide sum_(t = 1)^S Delta_t = f_0 - f_S lt.eq 1 . $ <eq:increment-properties>]
  Define the potential
  $ Psi \( v \) = max_(rho in cal(Q)) { cal(H) \( rho \) + eta chevron.l v \, rho chevron.r } . $
  Compactness gives a maximizer, and strict concavity of entropy makes it unique. It is positive:
    moving a small distance $u$ from a vector with a zero coordinate toward the positive feasible vector increases
    entropy by a positive multiple of $u ln \( 1 \/ u \) + O \( u \)$,
    whereas the linear term changes by only $O \( u \)$. At a positive maximizer $p$,
    first-order optimality along feasible segments gives
  $ chevron.l nabla cal(H) \( p \) + eta v \, rho - p chevron.r lt.eq 0 wide \( rho in cal(Q) \) . $
  Since $cal(H) \( rho \) - cal(H) \( p \) = chevron.l nabla cal(H) \( p \) \, rho - p chevron.r -
    D_(upright("KL")) \( rho bar.v.double p \)$, we obtain the precise penalty
  #[#set math.equation(numbering: n => "(7.5)")
   $ cal(H) \( rho \) + eta chevron.l v \, rho chevron.r lt.eq Psi \( v \) -
     D_(upright("KL")) \( rho bar.v.double p \) . $ <eq:entropy-penalty>]
  Here $D_(upright("KL")) \( rho bar.v.double p \) = sum_k rho_k ln \( rho_k \/ p_k \)$,
    with zero terms interpreted as zero. The penalty therefore holds on $cal(Q)$ itself,
    even when its feasible directions are restricted.
  Put $v_(t - 1) = sum_(j < t) u_j$. Evaluating the old objective at the maximizer $rho_t$ of the new one gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ Psi \( v_(t - 1) + hat(g)_t \) - Psi \( v_(t - 1) \) lt.eq eta chevron.l hat(g)_t \,
     rho_t chevron.r . $ <eq:predicted-potential-increment>]
  This inequality remains valid when the increment is negative.
    To add the remaining vector $\( 1 - 2 kappa \) Delta_t$, let $mu$ be the vector whose coordinates are the
    minimum of $Delta_t$ in their block, and write $v' = Delta_t - mu$.
    Then $0 lt.eq eta v'_k lt.eq kappa$ and $mu gt.eq 0$. Moreover $chevron.l mu \,
    rho chevron.r$ is the same for every $rho in cal(Q)$, because the block masses are fixed.
    Thus the possibly large block minima contribute exactly the same linear increment at every feasible vector;
    only the small within-block remainder needs an exponential estimate.
    Equation (7.5) thus bounds the remaining potential increment by
  #[#set math.equation(numbering: n => "(7.7)")
   $ eta \( 1 - 2 kappa \) chevron.l mu \, rho_t chevron.r +
     ln sum_k rho_(t \, k) exp #scale(x: 120%, y: 120%)[\(] eta \( 1 - 2 kappa \) v'_k
     #scale(x: 120%, y: 120%)[\)] . $ <eq:innovation-potential-increment>]
  To justify the logarithmic term, extend the supremum with its relative entropy penalty to the full probability
    simplex and normalize the weights $rho_(t \, k) exp \( eta \( 1 - 2 kappa \) v'_k \)$.
    The resulting objective equals the displayed logarithm minus relative entropy to these normalized weights,
    whose nonnegativity proves the bound.
  For $0 lt.eq x lt.eq kappa lt.eq 1 \/ 2$,
  #[#set math.equation(numbering: n => "(7.8)")
   $ e^(\( 1 - 2 kappa \) x) lt.eq 1 + \( 1 - kappa \) x . $ <eq:entropy-exponential>]
  Indeed the derivative of $ln \( 1 + \( 1 - kappa \) x \) - \( 1 - 2 kappa \) x$ is
  $ frac(kappa - \( 1 - 2 kappa \) \( 1 - kappa \) x, 1 + \( 1 - kappa \) x) gt.eq 0 \, $
  and the expression vanishes at zero. Apply Equation (7.8) with $x = eta v'_k lt.eq kappa$,
    and then use $ln \( 1 + y \) lt.eq y$. Because $mu gt.eq 0$,
    Equation (7.7) is at most $eta \( 1 - kappa \) chevron.l Delta_t \, rho_t chevron.r$.
    Combining the two increments yields
  $ Psi \( v_t \) - Psi \( v_(t - 1) \) lt.eq eta ⟨hat(g)_t + \( 1 - kappa \) Delta_t \, rho_t⟩ . $
  Sum through $s$, use $Psi \( 0 \) lt.eq ln d$, and evaluate the last potential at $rho^(*)$.
    Its entropy is nonnegative. Replacing the coefficient $1 -
    2 kappa$ in the accumulated comparator objective by $1$ loses at most
  $ 2 kappa ⟨sum_(t = 1)^s Delta_t \, rho^(*)⟩ lt.eq 2 kappa $
  by Equation (7.4). Finally,
  $ hat(g)_t + Delta_t = - f_t \, wide hat(g)_t + \( 1 - kappa \) Delta_t = - \( f_t + kappa Delta_t \) . $
  Reversing the signs gives (7.3). The cost vector $f_t + kappa Delta_t =
    kappa f_(t - 1) + \( 1 - kappa \) f_t$ lies in $\[ 0 \, 1 \]^d$,
    so an $ell_1$ error of at most $zeta$ costs at most $zeta$ per term. ◻
]

Apply the lemma to an unskipped band $cal(C) = cal(C)_(b \, r)$, conditioning on the complete child tables,
  including the warmup and all indices through $S$. The band, the scales $h_i$,
  and its action hull $cal(Q)$ are then fixed. Take the child coordinates as blocks and set

$ f_t \( i \, s \) = d_t \( I_i \, s \) \/ h_i . $

The action hull is compact and convex, and averaging its action vectors gives a positive feasible vector.
  Every vector has mass $h_i \/ h_Sigma$ in child block $i$.
  The refinement invariants give $0 lt.eq d_S lt.eq dots.h.c lt.eq d_0 lt.eq w_0 lt.eq h_i$ on band coordinates,
  so the normalized costs meet the monotonicity and unit bounds of the lemma.

Two states in a child block have endpoint-pair distance at most $4 theta b \/ M$.
  The spatial bound (5.5), used in both directions and with $d_t lt.eq h_i$,
  bounds their cost difference at one index by $delta h_i + 4 L theta b \/ M$;
  the stronger bound at index zero also suffices. Since $h_i gt.eq b \/ M$,
  the within-block range of $Delta_t$ is at most

#[#set math.equation(numbering: n => "(7.9)")
 $ 2 delta + 8 L theta lt.eq 3 delta lt.eq kappa \/ eta . $ <eq:increment-range>]

Here $8 L theta = 1024 ell^(- 39) lt.eq ell^(- 10)$ and $3 eta delta = 3 ell^(- 5) lt.eq kappa$.
  The lemma therefore applies to exactly the objective (5.3), with $d = d_(cal(C))$.
  Conditioning on child tables leaves the parent group samples and online draws with their prescribed laws,
  since their streams are separate from descendant streams. No independence among child tables is needed.

To express the conclusion in action costs, put

$ x_t \( alpha \) = sum_i d_t \( I_i \, s_i \( alpha \) \) . $

The fixed coordinate weights give

$ h_Sigma chevron.l f_t \, rho \( alpha \) chevron.r & = x_t \( alpha \) \,\
h_Sigma chevron.l f_t + kappa Delta_t \, rho \( alpha \) chevron.r & = x_t \( alpha \) +
  kappa #scale(x: 120%, y: 120%)[\(] x_(t - 1) \( alpha \) - x_t \( alpha \) #scale(x: 120%, y: 120%)[\)] . $

If $alpha_t$ is drawn from the computed mixture, its expected action vector is that mixture’s mean.
  Lemma 16, with $zeta = H^(- 3)$, thus gives every fixed band action $alpha^(*)$ and prefix $0 lt.eq s lt.eq
  S$ the conditional bound

#[#set math.equation(numbering: n => "(7.10)")
 $ bb(E)
   [sum_(t = 1)^s {x_t \( alpha_t \) + kappa #scale(x: 120%, y: 120%)[\(] x_(t - 1) \( alpha_t \) - x_t \(
   alpha_t \) #scale(x: 120%, y: 120%)[\)]} thin mid(bar.v) thin upright("child tables")] lt.eq  & sum_(t = 1)^s
   x_t \( alpha^(*) \)\
 & + h_Sigma (frac(ln d_(cal(C)), eta) + 2 kappa + s H^(- 3)) . $ <eq:band-action-regret>]

The next argument shows why the decrement term on the left is enough to cover the clipping in the parent update.

=== 7.3 Clipping before and after the first crossing <clipping-before-and-after-the-first-crossing>

We now apply the entropy inequality at a comparison node that is not bad and satisfies $\| hat(v) \| lt.eq 1 -
  tau$. Lemma 14 ensures that its comparison action $alpha^(*)$ belongs to the unskipped band $cal(C)_(b \, r)$
  and that all its guards pass. Write

$ A_t \( alpha \) = L e + x_t \( alpha \) . $

The entropy bound controls these action costs. The following proposition transfers that control to the clipped
  parent regret.

#thm([Proposition 7.3.])[
  #emph[Condition on the complete child tables at such a comparison node. Then
#[#set math.equation(numbering: n => "(7.11)")
 $ bb(E) [sum_(t = 1)^S cal(R)_t thin mid(bar.v) thin upright("child tables")] lt.eq  & h_Sigma
   (frac(ln d_(cal(C)), eta) + 2 kappa + S H^(- 3))\
 & + 2 delta c + 2 S H^(- 4) F c . $ <eq:node-regret>]

 Here $h_Sigma lt.eq 64 F b$ and $ln d_(cal(C)) lt.eq 4 \( p_(*) + 21 \) ell$.]
] <prop:node-regret>

#proof[
  Let $t_times$ be the first $t in { 1 \, dots.h \, S }$ for which $min_(alpha in cal(C)) A_t \( alpha \) < c$,
    or put $t_times = S + 1$ if there is none. This index depends only on the conditioned child tables.
    It is an analysis device, not a test performed by the algorithm.
    We will use (7.10) on the fixed prefix $1 lt.eq t < t_times$.
  Let $E_t$ be the failure event for the group approximation associated with this representative.
    By Lemma 10, $Pr \( E_t divides upright("child tables") \) lt.eq H^(- 4)$,
    and on its complement Equation (5.8) holds for every action in the band.
    For the online action $alpha_t$ sampled for this band, we claim that on the prefix
  #[#set math.equation(numbering: n => "(7.12)")
   $ overline(d)_t \( I \, q \) lt.eq  & L e + x_t \( alpha_t \) +
     kappa #scale(x: 120%, y: 120%)[\(] x_(t - 1) \( alpha_t \) - x_t \( alpha_t \) #scale(x: 120%, y: 120%)[\)]\
 & + 2 F c thin bold(1)_(E_t) . $ <eq:prefix-clipping>]
  Every action cost $A_t \( alpha \)$ is at least $c$ on this prefix,
    and the online candidate satisfies $Y_t \( q \) lt.eq A_t \( alpha_t \)$.
    If $overline(d)_t \( I \, q \) lt.eq A_t \( alpha_t \)$, the claim follows at once from child monotonicity.
    Otherwise, the update Equation (5.4) forces
  $ Pi_t \( q \) > \( 1 + delta \) A_t \( alpha_t \) \, wide d_t \( I \, q \) = frac(Pi_t \( q \), 1 + delta) . $
  The earlier-index Bellman option also gives $Pi_t \( q \) lt.eq L e + x_(t - 1) \( alpha_t \)$, so,
    writing $Delta x = x_(t - 1) \( alpha_t \) - x_t \( alpha_t \)$,
  $ Delta x > delta A_t \( alpha_t \) gt.eq delta c gt.eq delta b . $
  On $E_t^c$, Equation (5.8) and $e_(*) lt.eq kappa delta$ now give the full excess calculation
  $ d_t \( I \, q \) - A_t \( alpha_t \) & lt.eq frac(e_(*) b - delta L e, 1 + delta) lt.eq frac(e_(*) b, 1 + delta)\
 & lt.eq frac(kappa delta b, 1 + delta) lt.eq kappa Delta x . $
  On $E_t$, the added term $2 F c$ suffices because $overline(d)_t \( I \, q \) lt.eq 2 F c$.
    This proves Equation (7.12) without requiring independence between the sampled action and the group event.
  If $t_times lt.eq S$, choose an action attaining the crossing. On $E_(t_times)^c$, its group bound gives
  $ Pi_(t_times) \( q \) lt.eq L e + \( 1 + delta \) x_(t_times) \( alpha \) + e_(*) b < c + delta c +
    e_(*) b lt.eq c + 2 delta c . $
  Thus the clipped regret at that index is at most $2 delta c$, with an additional $2 F c$ allowed on failure.
    At every later index, the same crossing action and child monotonicity imply
    $cal(B)_I \( d_(t - 1) \) \( q \) < c$. Hence $d_t \( I \, q \) < c$, $overline(d)_t \( I \, q \) = c$,
    and the regret is nonpositive by Equation (6.1).
  It remains to sum (7.12) on this prefix. Use (7.10) with $s = t_times -
    1$ and the comparison action $alpha^(*)$. Since $x_t \( alpha^(*) \) lt.eq
    sum_i overline(d)_t \( I_i \, q_i \)$, its comparator costs are bounded by the child terms subtracted in each
    regret. The expected prefix regret is therefore at most
  $ h_Sigma (frac(ln d_(cal(C)), eta) + 2 kappa + S H^(- 3)) \, $
  apart from the explicit failure charges in (7.12). The prefix and possible crossing contain at most $S$ failure
    events, each of conditional probability at most $H^(- 4)$.
    Adding their expected costs and the crossing charge proves Equation (7.11).
  Finally each child has at most $\( 21 P \)^2$ possible states within the wide shift radius.
    Thus $d_(cal(C)) lt.eq M \( 21 P \)^2$, from which $ln d_(cal(C)) lt.eq
    4 \( p_(*) + 21 \) ell$ follows using $log_2 H lt.eq ell$. The bound on $h_Sigma$ is one of the band guards. ◻
]

The expectation in Proposition 17 concerns one node after fixing its child tables.
  Integrating it and summing over the fixed comparison tree uses only linearity of expectation.
  No event asserting that every group in the recursive computation succeeds is required.

== 8 Accuracy and the sequence of seed passes <sec:accuracy>

We first sum the node estimates to prove the refinement guarantee.
  We then use that guarantee to improve the simultaneous seed factor and obtain the answer to the original input.
  Throughout the first step the entire seed table is fixed and satisfies the hypotheses of Theorem 6.

=== 8.1 Summing the comparison regrets <summing-the-comparison-regrets>

#proof[
  Fix a starting state with true cost $D > 0$ and its comparison tree from Section 6.
    For brevity write $overline(d)_t = max \( c \, d_t \)$ at every state, as in Section 7.
    Terminal values are exact, so summing (7.1) over the tree at a fixed index gives the identity
  $ overline(d)_t \( upright("root") \) = C_(upright("term")) + L sum_(upright("nonterminal")) e +
    sum_(upright("nonterminal")) cal(R)_t . $
  Average this identity over $t = 1 \, dots.h \, S$. Since the root estimates decrease with $t$,
    the final positive error satisfies the deterministic bound
  #[#set math.equation(numbering: n => "(8.1)")
   $ \( d_S \( upright("root") \) - D \)_(+) lt.eq C_(upright("term")) - D + L sum_(upright("nonterminal")) e +
     1 / S sum_(upright("nonterminal")) sum_(t = 1)^S cal(R)_t . $ <eq:root-regret-telescope>]
  Lemma 11 bounds the first two terms by $\( 8 M J \/ P + 4 L J \/ P \) D$.
    We bound the last sum using the three classes of comparison nodes.
  On bad nodes use Lemma 15 and $W lt.eq 4 F c$. Corollary 13 bounds their total contribution by
  $ 40000 F^2 H^(1 \/ 4) \( 1 + J \/ P + J \/ T \) D . $
  On nodes that are not bad but satisfy $\| hat(v) \| > 1 - tau$,
    the same lemma gives $\( H^(- 1 \/ 4) + 4 tau F \) c$. Every other nonterminal satisfies Lemma 14,
    so Proposition 17 applies. Its dimension and mass bounds are
  $ ln d_(cal(C)) lt.eq 4 \( p_(*) + 21 \) ell \, wide h_Sigma lt.eq 64 F b lt.eq 64 F c . $
  The cost sum over all nonterminal levels is at most $2 J D$.
  The conditional estimate at a node is valid after fixing its complete child tables.
    Taking expectations and then summing uses only the tower property and linearity of expectation.
    Independence between comparison nodes, or simultaneous success of their group samples, is unnecessary.
    Combining these bounds, the expected excess at the starting state divided by $D$ is at most
  #[#set math.equation(numbering: n => "(8.2)")
   $ cal(E) =  & \( 8 M + 512 F \) J \/ P + 40000 F^2 H^(1 \/ 4) \( 1 + J \/ P + J \/ T \) \/ S\
 & + frac(2 J, S) [H^(- 1 \/ 4) + 4 tau F + 64 F (frac(4 \( p_(*) + 21 \) ell, eta) + 2 kappa) + 2 delta] +
   132 F J H^(- 3) . $ <eq:total-error>]
  Here the last term includes both numerical-mixture loss and group-failure loss:
    they are at most $128 F J H^(- 3)$ and $4 F J H^(- 4)$, respectively.
  We verify the numerical bound explicitly. Substituting $J lt.eq 100 H \/ ell$, $T gt.eq H^(3 \/ 4)$, $S =
    H \/ ell^2$, $F = ell$, $M lt.eq H^(1 \/ 20)$ and $P gt.eq H^20$ yields
  $ cal(E) lt.eq  & 52000 H^(- 18) + 8.04 dot.op 10^6 ell^4 H^(- 1 \/ 2) + 200 ell H^(- 1 \/ 4)\
 & + frac(10^6 \( p_(*) + 21 \), ell^2) + 13200 H^(- 2) . $
  For the fourth term we have included $\[ 26400 + 51200 \( p_(*) + 21 \) \] \/ ell^2 +
    400 \/ ell^9$ from the bracket in (8.2). Each of the five displayed terms is at most $1 \/ \( 8 ell \)$ at
    $ell gt.eq 2^1000$ and $H gt.eq 2^(ell \/ 2)$. For example, the second requires only
  $ log_2 \( 8 dot.op 8.04 dot.op 10^6 \) + 5 log_2 ell lt.eq ell \/ 4 \; $
  it holds at the cutoff and remains true thereafter. The other negative-power terms require weaker inequalities
    of the same form. For the fourth, use $p_(*) + 21 lt.eq sqrt(ell)$ and $sqrt(ell) gt.eq
    2^500 > 8 dot.op 10^6$. Consequently $cal(E) < 1 \/ ell$.
  Since $overline(d)_S - D = \( d_S - D \)_(+)$, this is the required expected positive-excess bound.
    The deterministic lower bound is the invariant from Section 5.
    When $D = 0$, that invariant and $w_0 lt.eq 2 F c$ give $d_S = 0$ directly, without dividing by $D$.
    The numerical construction in Section 9 supplies the mixtures used in this proof,
    and Section 10 verifies finite execution of every defined operation. ◻
]

=== 8.2 Improving simultaneous seeds <improving-simultaneous-seeds>

The initial table of Theorem 3 has factor $A_(upright("init"))$.
  The algorithm maintains a power-of-two factor $A$ and an integer seed $U
  in \[ 0 \, N \]$ on the full state domain. A seed is called #emph[good] when $c lt.eq U lt.eq
  A c$ at every state. This is a mathematical event, not a test performed by the algorithm.

While $A > F$, set $a = A \/ F$ and use $H^2$ independent copies of the refinement,
  conditional on the previous complete table. For each state, form the $H^2$ integers $ceil.l a d_S ceil.r$,
  take their upper middle order statistic, and clamp the result to $\[ 0 \, N \]$. This defines the next seed. Update

#[#set math.equation(numbering: n => "(8.3)")
 $ A arrow.l 4 a . $ <eq:seed-factor-update>]

All copies share the preceding table, but use independent new streams.
  Entries of each copy and of the new seed are stored on demand;
  their coherent full-table interpretation is justified in Section 10.

#thm([Lemma 8.1.])[
  #emph[Conditional on any fixed good preceding seed, the next seed is good for factor $4
    a$ except with probability at most $exp \( 10 H - H^2 \)$.]
] <lem:seed-amplification>

#proof[
  At a fixed state of positive integer cost $c$, the refinement theorem and Markov’s inequality give
  $ Pr \[ d_S > 2 c \] lt.eq 1 \/ ell . $
  Every copy has $ceil.l a d_S ceil.r gt.eq c$. A copy with $d_S lt.eq 2 c$ has $ceil.l a d_S ceil.r lt.eq 2 a c$,
    because $a$ and $c$ are integers. If strictly more than half the copies have this upper bound,
    their upper middle order statistic does too, hence in particular is at most $4 a c$.
    The probability that at least half fail is at most
  $ 2^(H^2) ell^(- H^2 \/ 2) lt.eq e^(- H^2) . $
  Clamping cannot spoil the lower bound $c lt.eq N$ or the upper bound.
    At zero-cost states every copy is zero under the good seed.
  There are at most $2 M max \( 1 \, \| x \| \)$ labeled nodes and at most $\( \| y \| + 1 \)^2$ valid states per
    node. Their product is less than $e^(10 H)$ in the large branch.
    Union over this full domain proves the assertion. No independence between different states is used. ◻
]

The update preserves powers of two and strictly decreases $A$, since $F > 4$.
  Writing $s_(upright("pass"))$ for the number of median passes plus the single final pass below, we have

#[#set math.equation(numbering: n => "(8.4)")
 $ s_(upright("pass")) = O (frac(\( p_(*) + 1 \) ell, log_2 ell)) < H . $ <eq:pass-count>]

Indeed each median pass reduces $log_2 A$ by $log_2 F - 2$,
  starting from $\( p_(*) + 4 \) log_2 H$ and stopping by $A lt.eq F$.
  Apply Lemma 18 to the first failed transition after a good history.
  The total probability that any seed needed by the algorithm is not good is less than

#[#set math.equation(numbering: n => "(8.5)")
 $ 0.01 + H exp \( 10 H - H^2 \) < 1 \/ 10 . $ <eq:seed-total-failure>]

The initial $0.01$ is the simultaneous initial-table failure probability.
  This estimate covers adaptive requests because every seed guarantee is over its entire potential domain.

=== 8.3 The final answer <the-final-answer>

When $A lt.eq F$, use one new refinement with $a = 1$ at the full root state
  $\( I \, q \) = \( \( 0 \, \| x \| \] \, \( 0 \, \| y \| \) \)$.
  Clamp its value to $\[ 0 \, N \]$ and round down to obtain $hat(D)$.
  Fix any complete good seed before exposing this final refinement’s independent randomness.
  For the positive cost $D = "ED" \( x \, y \)$ the refinement theorem gives the deterministic lower bound $d_S
  gt.eq D$ under this conditioning and

$ Pr \[ d_S > \( 1 + epsilon \) D divides U upright(" fixed and good") \] lt.eq frac(1, ell epsilon) lt.eq 1 / 10 . $

Together with (8.5), the unconditional failure probability is less than $1 \/ 5$, and thus less than $1 \/ 3$.
  The lower bound is not asserted on executions with a bad seed.

Clamping preserves the lower bound because $D lt.eq N$. Rounding down also preserves it because $D$ is an integer.
  Neither operation worsens the upper bound. The initial equality test returns zero deterministically when $D =
  0$, and the exact branches of Section 2 are also correct.
  This establishes the accuracy assertion of Theorem 1 on every input.
  It remains to prove that the finite computations just specified, with all randomness and arithmetic charged,
  have the claimed expected running time.

== 9 Finite optimization and exact sampling <sec:numerics>

The optimization step is a finite implementation of the conditional-gradient method of Frank and
  Wolfe #cite(label("FrankWolfe1956")). We use the fixed-step form analyzed by Jaggi #cite(label("Jaggi2013"))
  Algorithm 2 and Theorem 1, applied to a smoothed entropy objective.
  Our linearization has a fixed error floor, whose effect is included in the recurrence below.
  The rational arithmetic and exact sampling are also part of the running-time analysis.

The online rule in Section 5 asks for a mixture of band actions whose mean vector is close to an entropy
  maximizer. Its finite implementation separates recursive evaluation from numerical work.
  First gather the earlier-index child values, once for each distinct coordinate and history index occurring in
  the band. The procedure below then reuses this table while scoring the listed actions and constructing a
  rational mixture. It returns one exactly sampled action; only the evaluation of that action requests
  current-index child values. Thus the mean vector is used to analyze the draw,
  whereas the returned refinement value uses the cost of the single sampled action.

Fix an unskipped band $cal(C) = cal(C)_(b \, r)$, and write $d = d_(cal(C))$ for its number of coordinates.
  Its vertices $rho \( alpha \)$ are probability vectors, with child-block masses $h_i \/ h_Sigma$.
  Let $v in bb(Q)^d$ be the coefficient vector

$ v = eta (sum_(j < t) u_j + hat(g)_t) . $

Thus the desired vector $rho_t$ maximizes

$ cal(F) \( rho \) = cal(H) \( rho \) + chevron.l v \, rho chevron.r quad upright("over") quad cal(Q) =
  "conv" { rho \( alpha \) : alpha in cal(C) } . $

Every coordinate occurs in a listed vertex. Also $h_i gt.eq b \/ M > 0$,
  so all the prescribed block masses are positive, even on an execution with an inaccurate seed.

#thm([Lemma 9.1.])[
  (A finite entropy optimizer).  #emph[Let $cal(Q)$ be the convex hull of a nonempty finite list of rational
    probability vectors in $bb(R)^d$, and suppose that every coordinate is positive in at least one listed vector.
    Given a rational vector $v$ and an integer $H gt.eq 4$, put $G_0 = H + d + 2$.
    A rational algorithm constructs a mixture of the listed vectors whose mean $rho$ satisfies
$ lr(bar.v.double rho - rho_t bar.v.double)_1 lt.eq H^(- 3) \, $

 where $rho_t$ is the unique maximizer of $cal(H) \( rho \) + chevron.l v \, rho chevron.r$ on $cal(Q)$.
   The number of bit operations and the stored mixture size are polynomial in $G_0$, the list size,
   and the maximum numerator or denominator bit length of an input rational.
   The mixture can be sampled exactly using fair random bits,
   with expected cost polynomial in the same quantities and with a fixed space bound.]
] <lem:finite-optimizer>

#proof[
  There is a feasible vector positive in every coordinate, obtained by averaging the list.
    The maximizer is positive as well: at a zero coordinate, moving a small distance towards that average produces
    a positive entropy contribution of order $s ln \( 1 \/ s \)$,
    which dominates the terms of order $s$ from the other coordinates and the linear objective.
    Strict concavity gives uniqueness.
  Set $sigma = G_0^(- 50)$ and smooth the objective by replacing $-
    x ln x$ with $- \( x + sigma \) ln \( x + sigma \)$ in each coordinate. Denote the result by $cal(F)_sigma$.
    Integrating the derivative of $x ln x$, including at zero, gives
  #[#set math.equation(numbering: n => "(9.1)")
   $ sup_(rho in cal(Q)) \| cal(F)_sigma \( rho \) - cal(F) \( rho \) \| lt.eq
     4 d sqrt(sigma) . $ <eq:entropy-smoothing>]
  The gradient of $cal(F)_sigma$ has Euclidean Lipschitz constant at most $1 \/ sigma$.
    The diameter of $cal(Q)$ is at most $2$.
  Start at a listed vertex. At step $j gt.eq 0$, approximate every coordinate of the gradient to absolute error at
    most $e_0 = G_0^(- 20)$. Enumerate the list and choose a vertex $v_j$ maximizing its scalar product with this
    approximate gradient, resolving ties by a fixed order. Update
  $ rho^(\( j + 1 \)) = \( 1 - xi_j \) rho^(\( j \)) + xi_j v_j \, wide xi_j = frac(2, j + 2) . $
  Here $v_j$ denotes a selected vertex, whereas $v$ without a subscript is the fixed linear coefficient vector.
    The difference between two probability vectors has $ell_1$ norm at most $2$.
    Consequently the chosen vertex loses at most $2 e_0$ in the true linearization,
    even relative to a feasible mixture. If $D_j$ is the gap from the maximum of $cal(F)_sigma$,
    concavity and the gradient bound give
  #[#set math.equation(numbering: n => "(9.2)")
   $ D_(j + 1) lt.eq \( 1 - xi_j \) D_j + 2 e_0 xi_j + frac(2 xi_j^2, sigma) . $ <eq:finite-optimizer-recursion>]
  Since $xi_0 = 1$, this estimate first gives $D_1 lt.eq 2 e_0 + 2 \/ sigma$,
    independently of the size of the linear coefficient vector. Induction then gives
  $ D_j lt.eq 2 e_0 + frac(8, sigma \( j + 1 \)) wide \( j gt.eq 1 \) . $
  Run $K_(upright("opt")) = G_0^80$ steps. By (9.1), the resulting true objective gap is at most
  $ 2 G_0^(- 20) + 8 G_0^(- 30) + 8 d G_0^(- 25) lt.eq 12 G_0^(- 20) . $
  The Hessian of negative entropy is $"diag" \( 1 \/ rho_k \)$,
    which dominates the identity on the probability simplex. The first-order inequality at the positive maximizer,
    followed by this Hessian bound, therefore shows that its objective gap at any feasible $rho$ is at least $1 /
    2 lr(bar.v.double rho - rho_t bar.v.double)_2^2$. The statement at coordinates equal to zero follows by
    continuity. Hence
  $ lr(bar.v.double rho - rho_t bar.v.double)_1 lt.eq sqrt(d) thin lr(bar.v.double rho - rho_t bar.v.double)_2
    lt.eq sqrt(24 d) thin G_0^(- 10) lt.eq H^(- 3) . $
  We next give an exact representation of every iterate. After $K gt.eq 1$ steps,
    the weight of the vertex selected at step $j$, where $0 lt.eq j < K$, is
  #[#set math.equation(numbering: n => "(9.3)")
   $ frac(2, j + 2) product_(k = j + 1)^(K - 1) frac(k, k + 2) =
     frac(2 \( j + 1 \), K \( K + 1 \)) . $ <eq:optimizer-mixture-weights>]
  The initial vertex has zero remaining weight because $xi_0 = 1$.
    Store the sequence of selected vertices, allowing repetitions.
    The displayed weights sum to one and give the iterate exactly.
    A common denominator for the input vertices, multiplied by $K \( K + 1 \)$,
    is also a common denominator for its coordinates. One may obtain the input denominator by multiplying all
    input denominators, whose total bit length is at most the input size.
    Therefore the iterates can be maintained by rational arithmetic of polynomial bit cost,
    without accumulating the denominators of successive numerical approximations.
  It remains to calculate the approximate gradients using finite rational operations.
    For $r = x + sigma in \[ sigma \, 1 + sigma \]$, put $b_0 = \( r - 1 \) \/ \( r + 1 \)$.
    Then $\| b_0 \| lt.eq 1 - sigma$, and
  $ ln r = 2 sum_(k gt.eq 0) frac(b_0^(2 k + 1), 2 k + 1) . $
  Truncation after $K_log = G_0^60$ terms has absolute error at most
  $ frac(2 \| b_0 \|^(2 K_log + 1), \( 2 K_log + 1 \) \( 1 - b_0^2 \)) lt.eq
    frac(2 e^(- 2 K_log sigma), \( 2 K_log + 1 \) sigma) < G_0^(- 20) . $
  All terms are rational. The linear part of the gradient and its constant entropy derivative term are computed
    exactly. Thus these finite sums provide the required gradient precision;
    choosing a vertex requires only rational comparisons.
  Computing each rational logarithm sum by direct integer arithmetic also has polynomial bit cost:
    the lengths of the powers of a rational and of the products of the odd integer denominators are polynomial in
    $K_log$ and the input bit length. These logarithmic approximations only select vertices;
    they are not returned as recursive table values.
  The same representation gives an exact sampler. Put $K = K_(upright("opt"))$ and sample a uniform integer $R in
    { 1 \, dots.h \, K \( K + 1 \) \/ 2 }$ by drawing uniformly from a range whose size is the least power of two
    at least $K \( K + 1 \) \/ 2$, and rejecting out-of-range values.
    Each trial succeeds with probability greater than $1 \/ 2$.
    Choose the smallest $j$ with $\( j + 1 \) \( j + 2 \) \/ 2 gt.eq R$, by integer binary search,
    and return $v_j$. Equation (9.3) proves exactness, including when the same vertex was selected more than once.
    The integer has $O \( log K \)$ bits. Rejection reuses a fixed buffer,
    and its expected bit cost is polynomial. This completes the construction. ◻
]

#thm([Corollary 9.2.])[
  (Local cost of the online rule).  #emph[For a band in the edit-distance algorithm,
    the numerical mixture in Section 5 can be constructed and sampled with local expected bit cost
    $2^(o \( H \))$, using only already gathered child values of earlier indices.
    The storage used by this calculation is $2^(o \( H \))$ words.]
] <cor:online-local-cost>

#proof[
  At a wide-action endpoint there are $O \( P + 1 \)$ possible grid positions.
    Thus the full wide list has at most $\( C \( P + 1 \) \)^(2 M)$ members, for an absolute constant $C$,
    and the band is a sublist. Also $d lt.eq M \( 21 P \)^2$, so $G_0 = H^(O \( p_(*) + 1 \))$.
    For these vertices, use the common denominator $M h_Sigma$:
    every $M h_i$ is an integer because the dyadic scales satisfy $h_i gt.eq b \/ M$ and $b gt.eq 1$.
    The guard $h_Sigma lt.eq 64 F b$ bounds this denominator’s bit length by $O \( H \)$,
    without multiplying denominators across the action list. Lemma 19 gives a polynomial number of bit operations
    in these quantities and in the bit length of each input rational.
    The size bounds proved in Section 10 make the last quantity $H^(O \( p_(*) + 1 \))$ too.
    The total is therefore at most
  $ 2^(O \( M \( p_(*) + 1 \) ell \)) H^(O \( p_(*) + 1 \)) = 2^(o \( H \)) \, $
  because $M lt.eq H^(1 \/ 20)$, $ell = Theta \( log H \)$, and $p_(*) + 1 = O \( \( log ell \)^(1 \/ 4) + 1 \)$.
    The same bounds apply to storage, with a reused rejection buffer.
    Every list score and every numerical iteration uses the stored child inputs,
    rather than a new recursive calculation for each action. ◻
]

== 10 Lazy evaluation and the expected work bound <sec:work>

The tables defined above need not be filled. We evaluate only entries requested by the final root query and store
  each completed result. Two different costs must be controlled.
  A wide search may inspect many actions using previously gathered child values.
  At the current index, however, recursive calls are restricted to the shared group samples,
  the chosen rounded actions, and the actual online draws. The bounds on recursive requests hold on every
  execution of the local rules, including executions with inaccurate seeds or unsuccessful group samples.
  We charge the expected numerical and sampling costs conditional on those requests.

=== 10.1 Evaluation order and stored randomness <evaluation-order-and-stored-randomness>

Consider an uncached request for $d_t \( I \, q \)$. The local cone tests and warmup data determine the
  representatives, bands and rounded actions that it can use.
  Evaluating these tests may itself discover further warmup or seed requests.
  Once the bands are known, the wide Bellman search and the online optimizer gather the needed earlier-index child
  values and reuse them throughout their action enumerations.
  The group samples, selected rounded actions and sampled online actions also request current-index child values.
  The entry is then obtained by the exact minimum and maximum in (5.4) and cached.
  The distinction between gathering inputs and repeatedly using them is what permits large local action lists with
  few recursive calls.

These instructions are well founded before any accuracy event is considered.
  Number refinement passes in their order of construction, give $w_j$ index $j$ and $d_t$ index $T + t$,
  and identify $d_0 = w_T$. Treat a seed median as its $H^2$ preceding-pass refinement requests,
  and regard band and group calculations as auxiliary work within the table entry that requests them.
  Every table dependency strictly decreases the lexicographic triple

$ \( upright("pass") \, med upright("index") \, med upright("remaining tree height") \) . $

A current-index request descends to a child. Warmup and history requests decrease the index;
  seed requests enter an earlier pass, where the index may reset.
  Initial entries terminate this order because their estimators do not query any other initial entry.
  Different copy labels never reset the pass or index. Repeated and empty intervals still have distinct node
  labels and smaller remaining height at their children.

Fix a lexicographic order on every finite state or action list to resolve ties.
  Use the following keys for stored objects:

- An initial entry is keyed by its tree-node label and its two state endpoints.
  Its private random source supplies all guesses and thresholds in that initial-entry calculation.
- A later seed entry is keyed by its pass, node, and endpoints.
  Its stored value is the clamped integer median of the separately identified copies of the preceding refinement.
- A warmup or refinement entry is keyed by its table kind, pass, copy, node, index, and endpoints.
  The table kind distinguishes $w_j$ from $d_t$, with $d_0 = w_T$ identified.
- The warmup-derived data for a representative are keyed by the pass, copy, node, scale $b$, and endpoints $r$.
  These data determine its band, scale labels, and rounded action and do not depend on $t$.
- A group result is keyed by the pass, copy, node, scale $b$, the two integer cell indices, and $t$.
  It contains the chosen member and its actual evaluated cost.
  Its random sources also distinguish the scale $h$ and the sample number.
- An online draw is keyed by the pass, copy, node, queried state $q$, scale $b$, and $t$.
  Its representative is $r_b \( q \)$. Repeated requests use the stored action,
  whereas different queries may have independent draws even if their representatives agree.

In particular, a requested group is computed over its entire specified cell.
  Its result does not depend on which query first requested it.
  Repeated list processing and numerical iterations use dictionary lookups for previously gathered recursive
  inputs; their lookup costs will be included below.

Generate fresh fair random bits on the first calculation of each random object, and retain its outcome.
  Different copies, passes, nodes, and specified random objects have independent sources.
  This can be viewed equivalently as assigning independent bit streams to all keys in advance.
  By the dependency order above, deciding to request an object uses only already exposed streams.
  This equivalence is a distributional description, not an instruction to allocate all streams or tables.

For a given refinement copy, the complete child tables depend on descendant streams and earlier passes,
  but not on fresh streams of the current parent. Conditioning on those tables consequently leaves its group
  samples and online draws with their specified independent laws.
  This justifies the conditioning used in the accuracy analysis.
  The whole-domain seed guarantees are retained; adaptively requesting a seed entry does not replace such a
  guarantee by one for a fixed query.

For the expected running time, we use a different conditioning.
  Before the first request of an initial entry, none of its private random bits has been exposed.
  Conditional on the previous execution and its first request,
  the expected cost bound of Theorem 3 therefore still applies. Later requests only look up its stored answer.
  This argument does not condition on the initial entry being correct.

=== 10.2 Finite local calculations on inaccurate seeds <finite-local-calculations-on-inaccurate-seeds>

We first bound the numbers manipulated by the implementation.
  These bounds concern its finite local rules, rather than the global cone identities that were proved under a
  good seed.

#thm([Lemma 10.1.])[
  (Unconditional size bounds).  #emph[On every execution, all local searches are finite.
    The warmup values are nonnegative integers bounded by $\( 2 L_0 + 1 \) N$,
    and every refinement value satisfies $0 lt.eq d_t \( I \, q \) lt.eq w_0 \( I \, q \)$.
    Put $Q = ell^10 + 1$, and let $h \( I \)$ be the remaining height of the fixed tree below $I$.
    Every returned $d_t \( I \, q \)$ has denominator dividing $Q^(h \( I \))$.
    The rational data used in band tests, group comparisons, and the numerical optimizer have bit length
    $H^(O \( p_(*) + 1 \))$.]
] <lem:unconditional-sizes>

#proof[
  Every seed entry is an integer in $\[ 0 \, N \]$ by clamping.
    In the local calculation of $w_0 \( I \, q \)$, a zero tested seed returns zero.
    Otherwise the scale range is finite, and the search uses grid endpoints at sup distance at most
    $U \( I \, q \) lt.eq N$ from $q$. A cone height $tilde(U) \( I \, r \)$ is at most $N$,
    and its added charge is at most $2 L_0 N$. The default value when the candidate list is empty is $N$.
    Leaf values satisfy the same bound. Hence
  $ 0 lt.eq w_0 \( I \, q \) lt.eq \( 2 L_0 + 1 \) N . $
  All grid endpoints are integers: their spacing is a power of two truncated below at one.
    Thus cone and connection charges are integers. Every Bellman minimum contains its local $w_0$ value and has
    nonnegative candidates. It follows that every $w_j$ is a nonnegative integer at most $w_0$ at the same state.
    The average $m$ has denominator $T$.
  The value $Pi_t$ contains the Bellman option, so it too is at most $w_0$.
    The clipped definition of $d_t$ is nonnegative and at most $Pi_t$, irrespective of seed accuracy.
    An empty online minimum is represented by the symbol $+ oo$; the formula then returns $Pi_t$.
    No unbounded search or approximate numerical sentinel is needed for an empty list.
  For the denominator claim, induct on physical tree height, for all indices simultaneously.
    Leaves return integers. Each actual candidate at a nonleaf is an integer charge plus a sum of child values,
    or an integer warmup value. All child denominators divide $Q^(h \( I \) - 1)$.
    Minima and maxima select one of their arguments. The only further denominator operation in a returned value is
    division by $1 + delta = Q \/ ell^10$, which adds at most one power of $Q$.
    Sampling weights and numerical mixtures select actions; they are not themselves averaged into the returned
    table value. This proves the claim. In particular the table-value bit length is
  $ O #scale(x: 120%, y: 120%)[\(] H + J log ell #scale(x: 120%, y: 120%)[\)] . $
  The preliminary scale labels $h_i$ are dyadic ceilings of positive rational quantities of bounded bit length.
    In every retained band, the explicit guard gives
  $ b \/ M lt.eq h_i lt.eq h_Sigma lt.eq 64 F b . $
  Failed guards simply discard bands. All prefix and wide minima use already bounded warmup values and integer
    charges. Tests for positivity of $Z$, the ratio $z \( I \, r \) \/ Z$, band membership,
    and rounded endpoint validity are exact rational tests of polynomial bit length.
    A nonpositive or infinite $Z$ is discarded before division.
  A group comparison may use, in addition to a common power of $Q$,
    the product of the $O \( ell \)$ integers $k_h lt.eq M$ as a denominator.
    This still has polynomially many bits. These sampling denominators are discarded when the chosen action is
    actually evaluated. Online coefficients are finite sums of earlier table values divided by dyadic $h_i$ and
    multiplied by the displayed parameters. Their bit length is bounded by $H^(O \( p_(*) + 1 \))$.
    On inaccurate seeds their magnitudes need not have the good-seed normalization,
    but this does not increase their bit length beyond that bound.
    The first step $xi_0 = 1$ in Lemma 19 makes its gap estimate independent of the initial linear objective
    magnitude. ◻
]

The locality bounds themselves are also unconditional. The scale range for $w_0$ has ratio polynomial in $A$,
  and radius divided by grid spacing $O \( A^2 P \)$. For the other local searches,
  the ratio of the endpoints of the scale interval is $128 a F$. It admits $O \( \( p_(*) + 1 \) ell \)$ scales.
  At any such scale, $w_0 \( I \, q \) \/ b lt.eq 16 F$, so the square specified in the local rule meets

$ O #scale(x: 120%, y: 120%)[\(] \( 1 + F \/ theta \)^2 #scale(x: 120%, y: 120%)[\)] $

cells. A cell has $O \( \( 1 + P \)^2 \)$ representative candidates.
  All these lists can be generated by ranges of integer multiple indices, without scanning unrelated string positions.

=== 10.3 The current-index child budget <the-current-index-child-budget>

The following count is the reason for using rounded actions and samples shared across a cell.
  At a small scale $h$, many rounded states can occur at one child, but few children are sampled.
  Their respective factors $b \/ h$ and $h \/ b$ cancel. At a large scale,
  the rounded list is already small enough to inspect every child.
  The count concerns distinct recursive inputs; repeated uses of an input are charged later as lookups.

#thm([Lemma 10.2.])[
  (Current-index calls).  #emph[Evaluating one refinement entry $d_t \( I \, q \)$ requires at most $M
    ell^(O \( 1 \))$ distinct child entries at the same pass, copy, and index $t$.
    This bound holds for all seeds and all sample outcomes.]
] <lem:current-index-budget>

#proof[
  Fix a group at scale $b$, a scale label $h$, and a child $i$. Put $D_h = max \( 1 \, theta h \)$.
    Across the whole cell, all queried rounded states with $h_i = h$ use this common endpoint spacing.
    The wide action guard puts their first endpoints in an interval of length $O \( b \)$:
    $r^(-)$ varies by at most $theta b$ within the cell, and the shift radius is at most $10 b$.
    Once the first endpoint is fixed, the guard $\| z \( I_i \, s_i \) \| lt.eq
    2 h$ restricts the second endpoint to an interval of length $4 h$.
    The number of distinct states is therefore at most
  #[#set math.equation(numbering: n => "(10.1)")
   $ C \( 1 + b \/ D_h \) \( 1 + h \/ D_h \) lt.eq C' theta^(- 2) \( 1 + b \/ h \) \, $ <eq:rounded-cell-count>]
  for absolute constants $C \, C'$. This estimate also holds when $theta h < 1$, using $D_h gt.eq theta h$.
    Requiring legitimate ordered endpoints in $\[ 0 \, \| y \| \]$ can only reduce the count.
  There are two cases in the group calculation. If $k_h < M$, then $h gt.eq b \/ M$ and $Q_1 gt.eq 1$ imply
  $ k_h lt.eq 2 Q_1 M h \/ b \, wide h \/ b < 1 \/ Q_1 . $
  At most $k_h$ distinct child labels occur in the sample. Multiplying (10.1) by this number gives at most
  $ C' theta^(- 2) k_h \( 1 + b \/ h \) lt.eq C'' M theta^(- 2) Q_1 $
  distinct inputs. If $k_h = M$, the equality $min \( M \, ceil.l Q_1 M h \/ b ceil.r \) =
    M$ implies $Q_1 M h \/ b > M - 1$. Since $M gt.eq 2$ in this branch, $b \/ h < 2 Q_1$.
    Evaluating the exact part for all children consequently uses at most
  $ C' M theta^(- 2) \( 1 + 2 Q_1 \) $
  distinct inputs as well. This proves $M ell^(O \( 1 \))$ for one group and one scale label, without an accuracy event.
  There are $O \( log \( F M \) \) = O \( ell \)$ scale labels.
    The number of $b$ scales and cells requested by one query is polynomial in $ell$, as established above.
    Once a winning rounded action is chosen, evaluating its actual cost adds at most $M$ child calls per group.
    Finally the online rule draws just one action for each applicable $b$ scale;
    evaluating that actual action adds at most $M$ child calls per scale. These factors preserve the asserted bound. ◻
]

All other recursive inputs are earlier in the evaluation order. Constructing $w_0$ uses a previous seed.
  Computing bands, prefix minima, and scale labels uses warmup data.
  In $Pi_t$ the wide Bellman option uses $d_(t - 1)$ on children.
  The online coefficient vector uses $d_j$ only for $j < t$;
  it does not require the past transcript of actions at the parent.
  The numerical procedure of Section 9 therefore introduces no hidden current-index child queries.

=== 10.4 Earlier inputs and local arithmetic <earlier-inputs-and-local-arithmetic>

#thm([Lemma 10.3.])[
  (Local evaluation cost).  #emph[After collapsing the finite auxiliary calculations into table-entry evaluations,
    one warmup or refinement entry has at most $H^(O \( p_(*) + 1 \))$ distinct inputs at earlier indices or
    passes. Apart from its recursive inputs, its expected bit cost is $2^(o \( H \))$,
    uniformly conditional on the data exposed before its fresh random draws.
    Its local storage is at most $2^(o \( H \))$ on every execution.]
] <lem:local-work>

#proof[
  For one representative, each endpoint in a wide action has $O \( P + 1 \)$ positions, since $b \/ g_b lt.eq P$.
    A child therefore has $O \( \( P + 1 \)^2 \)$ states in the wide list.
    Multiplying by the number of children, representative candidates, cells, scales,
    and history indices still gives $H^(O \( p_(*) + 1 \))$ distinct recursive inputs.
    There are at most $T + S + 1 = O \( H \)$ history indices. The searches for $w_0$ have the same form of bound.
    An earlier seed query expands to $H^2$ copies of the previous refinement when required;
    this factor fits the same estimate.
  Gather and store these distinct child inputs before repeatedly scoring action lists.
    The wide list has at most $\( C \( P + 1 \) \)^(2 M)$ actions.
    For each internal cut, a prefix minimum enumerates the independently allowed states of its first children.
    The algorithm evaluates it only at the grid shifts being tested for band membership;
    the real argument in the definition of $Phi_j$ does not require a search over a continuum.
    These prefix lists and the band candidates have the same exponential bound.
    Scanning them at all candidate cuts and shifts multiplies the list size by at most a fixed power and by
    polynomial factors. Direct enumeration, including all guard tests, therefore has local arithmetic count
  $ 2^(O \( M \( p_(*) + 1 \) ell \)) H^(O \( p_(*) + 1 \)) . $
  Lemmas 21 and 19 give polynomial bit costs in the stated parameters for each arithmetic operation and for the
    numerical routine. Hence all local work and storage, apart from exact rejection-sampling time,
    are $2^(o \( H \))$. Rejection sampling has that bound in expectation, with a fixed buffer.
    Uniform child indices can likewise be sampled by charged fair bits; here $M$ is a power of two.
  Use a balanced search dictionary for gathered and globally stored inputs.
    The keys consist of the bounded integer labels specified above,
    and their comparisons use polynomially many bits in $H$. The number of possible keys is polynomial in $N$:
    there are $O \( M N \)$ node labels, at most $\( N + 1 \)^2$ states per node,
    polynomially many pass/copy/index choices, and polynomially bounded cell-index ranges since $theta b gt.eq
    theta$. Thus each dictionary operation has $H^(O \( 1 \))$ bit cost.
    Repeated lookups while scoring lists or optimizing are included in the displayed local work,
    not counted as new recursive inputs. ◻
]

=== 10.5 Counting the dependency paths <counting-the-dependency-paths>

We now quantify the dependency order from the first subsection.
  After inlining seed medians and auxiliary calculations, each dependency has one of two forms.
  A same-pass, same-index dependency descends to a child; Lemma 22 bounds its number by

$ D_(upright("same")) = M ell^(C_1) . $

Every other dependency either decreases the index in the same pass or switches to an earlier pass,
  and its number is bounded by

$ D_(upright("earlier")) = H^(C_2 \( p_(*) + 1 \)) $

for absolute constants $C_1 \, C_2$. Such dependencies stay at the same physical node or descend;
  they never ascend the tree. Auxiliary band and group calculations have been collapsed into these evaluations,
  so they create no same-index cycle at a node.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Entry at node $I$#linebreak()pass $s$, index $k$]]])])
  content((5.1, 0), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Child entry#linebreak()pass $s$, index $k$]]])])
  content((0, -2), [#box(inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Same node or descendant#linebreak()earlier index or pass]]])])
  line((1.331, 0), (3.864, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.55, 0), [#text(size: 9pt)[$M ell^(O(1))$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.5467), (0, -1.453), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, -1), [#text(size: 9pt)[$H^(O(p_*+1))$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: The two recursive input budgets. Wide action enumeration and numerical iterations reuse the gathered inputs and contribute local work. Only the horizontal edge keeps both pass and index unchanged. ],
) <fig:dependency-budgets>

Let $s_(upright("pass"))$ be the number of refinement passes, including the final pass, and put

$ K_(upright("dep")) = s_(upright("pass")) \( T + S + 1 \) . $

A dependency path ending at depth $j$ has at most $j$ same-index edges, because each descends one level.
  It has at most $K_(upright("dep"))$ other edges: indices strictly decrease between pass switches,
  and passes strictly decrease at switches. Copy identities do not reset this order.
  These bounds hold independently of every seed or sampling accuracy event.

Unfolding the stored dependency graph only overcounts calculations. The number of paths ending at depth $j$ is at most

#[#set math.equation(numbering: n => "(10.2)")
 $ & sum_(r = 0)^j sum_(s = 0)^(K_(upright("dep"))) binom(r + s, r) D_(upright("same"))^r D_(upright("earlier"))^s\
 & wide lt.eq \( j + 1 \) \( K_(upright("dep")) + 1 \) 2^(j + K_(upright("dep"))) M^j ell^(C_1 j)
   H^(C_2 \( p_(*) + 1 \) K_(upright("dep"))) . $ <eq:dependency-count>]

Some index-decreasing edges descend too; ignoring that additional descent only enlarges this bound.

Write $q_(*) = p_(*) + 1$. The parameters and pass count give

$ J = O \( H \/ ell \) \, wide T = O \( H^(3 \/ 4) \) = o \( S \) \, wide K_(upright("dep")) =
  O (frac(H q_(*), ell log ell)) . $

Consequently

$ J log ell & = O \( H log ell \/ ell \) = o \( H \) \,\
q_(*) K_(upright("dep")) log H & = O (frac(H q_(*)^2, log ell)) = o \( H \) \,\
J + K_(upright("dep")) & = o \( H \) . $

For the second limit, use $q_(*)^2 = O \( sqrt(log ell) + 1 \)$.
  All factors beyond $M^j$ in (10.2) are therefore $2^(o \( H \))$, uniformly for $0 lt.eq j lt.eq J$.
  The number of expanded evaluations at depth $j$ is bounded by

#[#set math.equation(numbering: n => "(10.3)")
 $ M^j 2^(o \( H \)) . $ <eq:depth-evaluations>]

This is a deterministic count for the local implementation, not a count conditioned on the success of its estimates.

=== 10.6 Expected time and logarithmic-word storage <expected-time-and-logarithmic-word-storage>

#thm([Theorem 10.4.])[
  (Charged expected running time).  #emph[The large-input algorithm has worst-case expected running time
    $N^(1 + o \( 1 \))$ on the logarithmic-word RAM, over its internal randomness.
    This includes input processing, preprocessing, initial and refined table calculations,
    all rational arithmetic, sampling, and data-structure operations.
    Its workspace on every execution is bounded by a fixed polynomial in $N$.
    Together with the exact fallbacks, the same program has the claimed expected asymptotic bound for each fixed
    rational $epsilon in \( 0 \, 1 \)$.]
] <thm:work>

#proof[
  Let $n_x = \| x \|$. At depth $j$, an interval has width at most $ceil.l n_x \/ M^j ceil.r$.
    Theorem 3 bounds the expected cost of a first initial-entry request there by
  $ (1 + ceil.l n_x \/ M^j ceil.r) 2^(o \( H \)) . $
  The conditional first-request argument above makes this valid after any preceding adaptive execution.
    Equivalently, enumerate the possible request slots in an unfolded computation:
    at each slot that requests a new initial entry, condition on the past and use its independent fresh stream.
    The deterministic slot count (10.3) allows the resulting expectations to be summed.
    Repeat requests have only the charged dictionary cost. The same conditional expectation argument applies to
    each exact mixture sampler, whose expected local cost is uniformly bounded.
  Combining Lemma 23 with (10.3), all these costs are at most
  $ 2^(o \( H \)) sum_(j = 0)^J M^j (1 + ceil.l n_x \/ M^j ceil.r) & lt.eq
    2^(o \( H \)) sum_(j = 0)^J \( 2 M^j + n_x \)\
 & lt.eq 2^(o \( H \)) #scale(x: 120%, y: 120%)[\(] O \( M^J \) + \( J + 1 \) n_x #scale(x: 120%, y: 120%)[\)]\
 & lt.eq \( n_x + 1 \) 2^(o \( H \)) . $
  Here $M^J lt.eq M max \( 1 \, n_x \)$ and $M \, J = 2^(o \( H \))$. No seed or group correctness event was used.
    Sorting the occurrence data and the other input work cost $O \( N log \( N + 2 \) \)$,
    and leaf queries cost $O \( log \( N + 2 \) \)$ each. Since $H = Theta \( log \( N + 2 \) \)$,
    the complete expected bound is $N^(1 + o \( 1 \))$.
  For storage, the deterministic dependency count bounds the number of stored table entries by
    $N^(1 + o \( 1 \))$. Each such evaluation creates at most $H^(O \( p_(*) + 1 \))$ auxiliary representative,
    group and draw records, so their total satisfies the same bound.
    Their keys and scalar fields have the bit bounds of Lemma 21.
    Each local action list and numerical computation has at most $2^(o \( H \)) =
    N^(o \( 1 \))$ scratch size by Lemma 23; even retaining such lists or mixtures with their auxiliary records
    keeps the total refinement storage at $N^(1 + o \( 1 \))$.
    A fully expanded initial estimator also has polynomial worst-case space:
    its tree has $O \( B n \)$ nodes on padded length $n$, its shift arrays have length $O \( n \)$,
    and its numbers have polynomial bit length in $H$ and $B$. Pruned arrays are represented by markers.
    Its scratch can be released after storing the completed integer entry.
    Retaining the scratch of nested calls still gives a polynomial bound, since dependency depth is at most $J +
    K_(upright("dep"))$ plus the initial-tree depth. Rejection loops reuse their buffers and do not enlarge
    storage when they run for additional trials.
  Thus there is an absolute polynomial space bound in $N$ in the large branch.
    Every workspace address fits a constant number of $O \( log \( N + 2 \) \)$-bit words.
    Larger rational numbers are represented in multiple such words and processed by charged ordinary integer
    algorithms, as used above. Input symbols and the padding tag also fit a constant number of these words,
    with no constant-alphabet assumption. The finite parameter-inspection rule and exact dynamic-programming
    fallback of Section 2 use polynomially addressed memory as well.
  Finally, for each fixed rational accuracy encoding, its length is eventually below the inspection limit,
    and the two remaining fallback conditions also cease for sufficiently large $N$.
    Their sizes are bounded as a function of that fixed parameter.
    They do not change the asserted asymptotic bound, although they impose no efficiency claim uniform in a
    varying $epsilon$. Together with the success probability established in Section 8, this proves Theorem 1. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
