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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to Ryser's covering conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A vertex cover of a finite hypergraph $H$ is a set of vertices meeting every edge.
  Its covering number $tau \( H \)$ is the minimum size of such a set,
  and its matching number $nu \( H \)$ is the maximum number of pairwise disjoint edges.
  For an integer $r gt.eq 2$, an $r$-partite $r$-uniform hypergraph has disjoint vertex parts $V_1 \, dots.h \,
  V_r$, with every edge containing exactly one vertex from each part.
  Ryser’s covering conjecture asserts that every such hypergraph satisfies

#[#set math.equation(numbering: n => "(1)")
 $ tau \( H \) lt.eq \( r - 1 \) nu \( H \) . $ <eq:ryser>]

A nonempty hypergraph is intersecting when every two distinct edges meet; equivalently,
  its matching number is one. In this case the conjecture asks for a cover of size at most $r - 1$.
  The vertices of a cover may lie in several different parts,
  which is the central obstacle in constructing a counterexample.

For $r = 2$, inequality (1) is Kőnig’s matching theorem. An equivalent formulation appears in Henderson’s 1971
  thesis #cite(label("Henderson1971")); Best and Wanless discuss the history of its attribution to
  Ryser #cite(label("BestWanless2018")). Aharoni proved the full tripartite case #cite(label("Aharoni2001")).
  In the intersecting case, the results through rank four are due to Gyárfás, and the rank-five result to Tuza,
  as recorded by Király and Tóthmérész #cite(label("KiralyTothmeresz2017"));
  see also Tuza’s early study of the covering conjecture #cite(label("Tuza1983")).
  Haxell and Scott proved $tau \( H \) lt.eq \( r - epsilon.alt \) nu \( H \)$ for some $epsilon.alt >
  0$ when $r = 4$ or $5$, without assuming intersection #cite(label("HaxellScott2012")).
  White proved the particular rank-four case $nu \( H \) = 2$, obtaining $tau \( H \) lt.eq
  6$ #cite(label("White2026")).#footnote[White reports assistance from GPT-5.6 Sol and Claude in the Methods
  section of his preprint.] Under the additional assumption that any two distinct edges meet in exactly one
  vertex, Francetić, Herke, McKay, and Wanless established the intersecting case through rank
  nine #cite(label("FranceticHerkeMcKayWanless2017")). Bishnoi, Das, Morris,
  and Szabó obtained bounds when every pair of edges has a larger prescribed intersection #cite(label("BDMS2021")).

Finite planes supply the classical equality examples. Delete a point and all lines through it from a projective
  plane of order $q$. Partition the remaining points according to the deleted line through them,
  and take the remaining lines as hyperedges. The result is intersecting, has $q +
  1$ parts and covering number $q$. Thus equality in the proposed bound occurs whenever $r - 1$ is a prime power.
  Work of Mansour, Song, and Yuster #cite(label("MansourSongYuster2009")) and Aharoni, Barát,
  and Wanless #cite(label("AharoniBaratWanless2016")) studies the structure and sparsity of equality examples.
  Abu-Khazneh, Barát, Pokrovskiy, and Szabó exploit the rigidity of minimum covers in a truncated plane and add
  exceptional edges to obtain further equality examples #cite(label("AbuKhaznehBaratPokrovskiySzabo2019")).
  In that construction, the number of parts and the covering number both increase by one.
  Haxell and Scott combine affine planes with intersecting configurations to obtain covering number at least $r -
  4$ for every sufficiently large $r$, improved to $r - 3$ when $r$ is even #cite(label("HaxellScott2017")).

Our construction also starts from a finite plane and inserts exceptional edges,
  but keeps one part for each ambient direction. It changes the line labels within these parts to raise the
  covering number beyond $q$. The following theorem gives the precise field orders for which this can be done.

#thm([Theorem 1.1.])[
  #emph[There exists $s_0$ such that, for every prime $s gt.eq s_0$ with $s equiv 2 med \( mod med 3 \)$,
    there is an integer $n_0 \( s \) gt.eq 3$ with the following property.
    For every odd integer $n gt.eq n_0 \( s \)$, put $q = s^n$.
    There is a finite intersecting $\( q + 1 \)$-partite $\( q + 1 \)$-uniform hypergraph $H$ satisfying
$ tau \( H \) = q + 1 . $

 In particular, the intersecting case of (1) is false.]
] <thm:main>

Every edge of a nonempty intersecting hypergraph is itself a cover, so the assertion $tau \( H \) lt.eq q +
  1$ is automatic. The proof must construct an intersecting hypergraph and exclude every cover of size at most
  $q$. We first fix any sufficiently large eligible prime $s$, construct a configuration in $bb(F)_s^2$,
  and then take $n$ sufficiently large among the odd integers.
  All subsequent thresholds may depend on that fixed configuration.
  The result is asymptotic; the proof does not give a numerical threshold.

A companion paper #cite(label("OpenAI2026Balanced")) proves a different theorem:
  for every sufficiently large prime $q$, it constructs such a hypergraph with exactly $q +
  1$ vertices in every part and with every vertex nonisolated.
  Its construction modifies line partitions directly in the prime plane.
  Here the field order is a proper odd power, and the proof uses a small-field configuration with a nonlinear
  change of coordinates. The two constructions give distinct ranges of ranks.
  The only results imported from the companion are its three elementary estimates in Appendix A:
  the affine second-moment identity (Lemma A.1), bounded-drift concentration (Lemma A.2),
  and the exposure bound for independent trials (Lemma A.3).

Lovász proposed the stronger assertion that deleting $r - 1$ vertices can always reduce the matching number.
  Clow, Haxell, and Mohar disproved that assertion at $r = 3$ #cite(label("CHM2025")); Abiad, Garbe, Povill,
  and Spiegel subsequently gave an infinite family at $r = 3$ and examples at $r =
  4$ #cite(label("AbiadGarbePovillSpiegel2025")). These examples are consistent with (1).
  They exclude a prescribed matching-reduction procedure, whereas Theorem 1 violates the covering inequality itself.

=== Monochromatic tree covers <monochromatic-tree-covers>

An $r$-edge-coloring here assigns exactly one of $r$ colors to each edge.
  A monochromatic tree cover is a family of monochromatic trees whose vertex sets cover the graph;
  the trees may overlap, and singleton trees are allowed. Gyárfás’s conjecture asks whether $r -
  1$ such trees suffice for every $r$-edge-colored complete graph; see #cite(label("Milicevic2017")) Conjecture 1.
  This is the covering formulation recorded after Theorem 2 in #cite(label("ErdosGyarfasPyber1991")) Section 3,
  not the distinct vertex-disjoint tree-partition conjecture numbered Conjecture 2 there.

#thm([Corollary 1.2.])[
  #emph[Let $s_0$ and $n_0 \( s \)$ be as in Theorem 1. For every prime $s gt.eq s_0$ with $s equiv
    2 med \( mod med 3 \)$ and every odd integer $n gt.eq n_0 \( s \)$, put $r = s^n + 1$.
    There is a finite simple complete graph with an $r$-edge-coloring for which the minimum number of
    monochromatic trees needed to cover its vertices is exactly $r$.
    The same minimum holds with connected monochromatic subgraphs or maximal monochromatic components in place of
    trees.]
] <cor:tree-cover>

#proof[
  Take the hypergraph $H$ from Theorem 1, with parts $V_1 \, dots.h \, V_r$.
    For $e in E \( H \)$, let $x_i \( e \)$ be the unique vertex in $e ∩ V_i$.
    Form the complete graph $K$ with vertex set $E \( H \)$. For each pair of distinct hyperedges $e \, f$,
    choose one index $i$ with $x_i \( e \) = x_i \( f \)$ and color the edge $e f$ by $i$.
    Such an index exists because $H$ is intersecting. Only one color is chosen even when the two hyperedges meet
    in several parts.
  Along a color-$i$ path, the value of $x_i$ is constant. Thus every connected color-$i$ subgraph determines a
    vertex of $V_i$ belonging to every hyperedge indexed by that subgraph.
    For a singleton, choose any color and the corresponding vertex of its hyperedge.
    If $t$ connected monochromatic subgraphs cover the vertices of $K$,
    the at most $t$ hypergraph vertices so chosen meet every edge of $H$. Hence $t gt.eq tau \( H \) = r$.
  Conversely, fix a vertex of $K$. The $r$ monochromatic stars centered there,
    one for each color and allowing singleton stars, cover all vertices of $K$.
    They give a tree cover of size at most $r$. The lower bound applies to trees and to maximal monochromatic
    components as well, and the stars can be enlarged to maximal components. This proves all three stated minima. ◻
]

Thus Gyárfás’s cover conjecture fails at these extension-field ranks.
  The examples admit no cover by $r - 1$ connected monochromatic subgraphs even without a diameter restriction.
  They therefore also refute Milićević’s bounded-diameter strengthening #cite(label("Milicevic2017"))
  Conjecture 6, whose diameter bound may depend on $r$, and the $alpha = 1$ case of the conjecture of DeBiasio,
  Kamel, McCourt, and Sheats #cite(label("DeBiasioKamelMcCourtSheats2021")) Conjecture 2.8,
  whose diameter bound depends only on the independence number $alpha$.
  Indeed, $alpha \( K \) = 1$, so the latter conjecture also demands a cover by at most $r - 1$ such subgraphs.

=== Proof strategy <proof-strategy>

In the affine-plane model, the parts are indexed by the $q + 1$ directions in $bb(F)_q^2$,
  and the vertices of a part are the $q$ lines of that direction.
  A point $x$ defines an edge consisting of its incident line in each direction.
  The edges of two points intersect at their join, but a full parallel class always gives a cover of size $q$.
  We retain many of these point edges and add exceptional edges whose labels are changed in some directions.
  The construction has three tasks: preserve intersection, restrict small covers of the retained point edges,
  and make the exceptional edges too costly for those covers.

===== 1.1 Restricting the ordinary cover. <restricting-the-ordinary-cover.>

Delete a bounded number of translated shapes in each of $O \( q \)$ independent trials.
  The shapes are lines or curves that meet every line in boundedly many points.
  Thus a shape has bounded intersection with a line unless it is that line itself.
  Section 3 proves that, under explicit uniform survival assumptions,
  every cover of almost all surviving points by at most $q$ lines contains almost a pencil.
  Here a pencil is a family of lines through one projective point,
  including a parallel class when that point is at infinity.
  Surviving points on each nondeleted line then force every nondeleted member of this pencil into the cover.
  To obtain the pencil statement over the required extension fields,
  Section 2 first proves an incidence saving by the sum–product method of Bourgain, Katz,
  and Tao #cite(label("BKT2004")). Its constants are uniform over fields whose proper subfields all have order at
  most $q^(1 \/ 3)$.

===== 1.2 One configuration in two coordinates. <one-configuration-in-two-coordinates.>

In a fixed prime plane $bb(F)_s^2$, remove one line in each finite nonzero direction and call the remaining set
  $Y$. The change of coordinates $f \( x \, y \) = \( x^3 \, y \)$ is bijective when $s equiv
  2 med \( mod med 3 \)$. Original line labels determine which ambient point edges must be deleted to intersect
  the exceptional edges. The labels for altered directions are instead read from the lines through $f \( w \)$,
  for $w in Y$. The map $f$ preserves the horizontal and vertical parallel classes;
  this ensures intersection within the exceptional configuration.
  Its nonlinear action on the other lines makes their images curves with at most three intersections with any
  line. Applying the deletion lemma in these new coordinates yields the crucial obstruction:
  covering $f \( Y \)$ by $a$ lines and $b$ individual points with $a + b \/ 2 lt.eq
  s$ requires exactly one full parallel class and no point resources.
  Section 5 proves this statement together with the ordinary-coordinate occupancy needed later.

===== 1.3 Placing the configurations and spending the cover budget. <placing-the-configurations-and-spending-the-cover-budget.>

Embed linearly transformed copies of $Y$ in $bb(F)_q^2$ so that every ambient direction is altered in one or two
  copies. Arbitrary translates could create disjoint exceptional edges.
  We therefore sample a fixed number of independent candidate translates for each copy.
  Section 4 proves that one can choose compatible representatives from these pools,
  using an independent-transversal argument in the tradition of Haxell #cite(label("Haxell1995"))
  #cite(label("Haxell2001")). Section 6 proves the deletion estimates for the entire independent pool before
  making this selection. Keeping only the selected deletions restores ordinary points,
  so the needed estimates transfer by deterministic inclusion.

Section 7 gives the labels of every edge, proves intersection, and excludes a cover of size at most $q$.
  After the ordinary edges force a pencil, its center determines the remaining argument.
  At infinity, the uncovered exceptional configurations require more vertices than the missing parallel lines
  release. Inside an embedded configuration, the remaining budget would cover $f \( Y \)$ by at most $s$ lines
  including two nonparallel axis lines. Outside every configuration,
  each deleted pencil line supplies five uncovered exceptional edges,
  while every additional vertex covers at most five. In all three cases the available budget is too small.

===== 1.4 Conventions. <conventions.>

A direction is a one-dimensional linear subspace of $bb(F)_q^2$; as a subspace it includes zero.
  The projective completion adds one point at infinity per direction.
  A pencil consists of the affine lines through a projective point:
  it has $q + 1$ members for a finite center and $q$ members for a center at infinity.
  Thus concurrence always includes parallel lines. For a positive integer $j$, write $\( a \)_j =
  a \( a - 1 \) dots.h.c \( a - j + 1 \)$. All asymptotic constants may depend on the parameters explicitly held
  fixed. An event holds with high probability if its probability tends to one along the specified sequence of
  fields. The small field is fixed before the ambient field tends to infinity.

== 2 A uniform incidence bound <sec:incidence>

For a set $P$ of points and a set $cal(L)$ of lines in $bb(P)^2 \( bb(F)_q \)$, write

#[#set math.equation(numbering: n => "(2)")
 $ I \( P \, cal(L) \) = \| { \( p \, ell \) in P times cal(L) :
   p in ell } #scale(x: 120%, y: 120%)[\|] . $ <eq:inc-definition>]

Our aim is a power saving with constants independent of the field and its characteristic.
  In Section 3, this estimate will control intersections of a proposed line cover when no projective point lies on
  many of its lines. This is the incidence input to the conclusion that a small cover must contain almost a full pencil.

#thm([Theorem 2.1.])[
  (Uniform incidence saving).  #emph[There exist absolute constants $kappa
    in \( 0 \, 1 \/ 10 \)$ and $Q$ with the following property.
    Suppose that $q gt.eq Q$ is a prime power and every proper subfield of $bb(F)_q$ has order at most
    $q^(1 \/ 3)$. If $P$ and $cal(L)$ are sets of projective points and projective lines over $bb(F)_q$ satisfying
#[#set math.equation(numbering: n => "(3)")
 $ \| P \| \, \| cal(L) \| lt.eq q^(1 + kappa) \, $ <eq:inc-theorem-sizes>]

 then
#[#set math.equation(numbering: n => "(4)")
 $ I \( P \, cal(L) \) lt.eq q^(3 \/ 2 - kappa) . $ <eq:inc-theorem-bound>]

]
] <thm:incidence>

The proof follows the incidence and sum–product strategy of Bourgain, Katz,
  and Tao #cite(label("BKT2004")) Sections 3–4 and 6. Its geometric step turns an incidence configuration with too
  many incidences into a dense set of pairs whose differences and quotients range over small sets.
  A graph argument then extracts one subset with both a small difference set and a small quotient set.
  Finally, scalar coverings show that such a subset cannot have size near the square root of the field order under
  the proper-subfield hypothesis.

We develop the two algebraic ingredients first, then return to the incidence configuration.
  The proofs include the simultaneous extraction of additive and multiplicative control and the bounds on scalar
  expressions that make the argument uniform over fields of nonprime order.

=== 2.1 Finite-set estimates <finite-set-estimates>

The first task is to pass from control of differences and quotients along the edges of a dense bipartite graph to
  control on all pairs in one subset. We begin with the sumset estimates needed to use the resulting additive control.

For subsets of an abelian group, $X + Y$ and $X - Y$ denote the usual sumset and difference set.
  For a nonnegative integer $j$, the notation $j Y$ in this subsection means a sum of $j$ copies of $Y$,
  with $0 Y = { 0 }$. Later, a field element multiplying a set will always mean field scaling;
  we will specify explicitly when an integer denotes an iterated sumset.

The first two estimates below are Ruzsa’s triangle inequality and covering lemma;
  the maximal-translates proof of the latter appears in #cite(label("Ruzsa1999")) p. 324.
  The multiple-sum bound is a Plünnecke–Ruzsa estimate, for which we use Petridis’s minimizing-subset
  proof #cite(label("Petridis2012")) Proposition 2.1 and Section 3.

#thm([Lemma 2.2.])[
  (Triangle, covering, and multiple-sum estimates).  #emph[Let the sets below be finite subsets of an abelian group.]
  + #emph[If $Z$ is nonempty, then
#[#set math.equation(numbering: n => "(5)")
 $ \| X - Y \| thin \| Z \| lt.eq \| X - Z \| thin \| Z - Y \| . $ <eq:inc-triangle>]

]
  + #emph[If $Y$ is nonempty and $\| X - Y \| lt.eq M \| Y \|$,
    then $X$ is contained in the union of at most $M$ translates of $Y - Y$.]
  + #emph[If $Y$ is nonempty and $\| Y - Y \| lt.eq M \| Y \|$, then, for all nonnegative integers $u \, v$,
#[#set math.equation(numbering: n => "(6)")
 $ \| u Y - v Y \| lt.eq M^(u + v) \| Y \| . $ <eq:inc-multiple-sums>]

]
] <inc-sumset-estimates>

#proof[
  For the triangle inequality, choose one representation $d = x_d - y_d$ for each $d in X - Y$. The map
  $ \( d \, z \) mapsto \( x_d - z \, z - y_d \) $
  from $\( X - Y \) times Z$ into $\( X - Z \) times \( Z - Y \)$ is injective:
    summing the two coordinates recovers $d$, after which the chosen representation recovers $z$. This proves (5).
  For the covering statement, take a maximal set $T subset.eq X$ for which the translates $t - Y$, $t in T$,
    are pairwise disjoint. Their union is contained in $X - Y$, so $\| T \| lt.eq M$.
    Maximality implies that for every $x in X$ some $x - Y$ intersects $t - Y$ with $t in T$,
    whence $x in t + \( Y - Y \)$.
  For the multiple-sum bound, the minimizing-subset argument of Petridis #cite(label("Petridis2012")) lets us
    iterate a one-step growth estimate. Put $Q_0 = - Y$ and choose a nonempty $W subset.eq Y$ minimizing
  $ mu = frac(\| W + Q_0 \|, \| W \|) . $
  Then $mu lt.eq M$, and every $W' subset.eq W$, including the empty set, satisfies $\| W' + Q_0 \| gt.eq
    mu \| W' \|$. We claim that for every finite set $E_0$,
  #[#set math.equation(numbering: n => "(7)")
   $ \| W + Q_0 + E_0 \| lt.eq mu \| W + E_0 \| . $ <eq:inc-petridis-growth>]
  The assertion is immediate if $E_0$ is empty. Otherwise order its elements as $e_1 \, dots.h \, e_k$.
    When the translate $W + e_i$ is added to the preceding translates, let
  $ W'_i = { w in W : w + e_i in union.big_(j < i) \( W + e_j \) } . $
  It contributes exactly $\| W \| - \| W'_i \|$ new elements.
    Moreover, $W'_i + Q_0 + e_i$ is contained in the union of the preceding enlarged translates $W + Q_0 + e_j$.
    Thus the contribution of $W + Q_0 + e_i$ is at most
  $ \| W + Q_0 \| - \| W'_i + Q_0 \| lt.eq mu #scale(x: 120%, y: 120%)[\(] \| W \| - \| W'_i \|
    #scale(x: 120%, y: 120%)[\)] . $
  Summing proves (7). Iterating this estimate gives $\| W + j Q_0 \| lt.eq
    mu^j \| W \|$ for every nonnegative integer $j$. We now remove the auxiliary set $W$ by applying (5) to $u
    Q_0 \, v Q_0$ with intermediate set $- W$:
  $ \| u Q_0 - v Q_0 \| thin \| W \| lt.eq \| W + u Q_0 \| thin \| W + v Q_0 \| lt.eq mu^(u + v) \| W \|^2 . $
  Negation preserves cardinality, so $\| u Q_0 - v Q_0 \| = \| u Y - v Y \|$.
    Since $\| W \| lt.eq \| Y \|$ and $mu lt.eq M$, this is (6). ◻
]

We next carry out the extraction from a dense graph. The argument uses the common-neighborhood method in Gowers’s
  quantitative refinement #cite(label("Gowers1998")) Section 4,
  Lemma 11 and Proposition 12 of the Balog–Szemerédi theorem #cite(label("BalogSzemeredi1994"));
  see also #cite(label("FoxSudakov2011")) Section 5, Lemmas 5.1–5.2.
  The point is to use the same walks for both additive and multiplicative edge labels.
  We can therefore obtain both bounds on one subset, which is what the subsequent subfield argument requires.
  In the geometric application, the edge labels will come from the four pencils through four chosen points.

#thm([Lemma 2.3.])[
  (Simultaneous difference and quotient extraction).  #emph[Let $F$ be a field, let $A \,
    B subset.eq F^(*)$ be finite, and let $G subset.eq A times B$. Define
$ D = { a - b : \( a \, b \) in G } \, wide J = { a \/ b : \( a \, b \) in G } . $

 Suppose that, for real numbers $n > 0$ and $V gt.eq 2$,
#[#set math.equation(numbering: n => "(8)")
 $ \| A \| \, \| B \| \, \| D \| \, \| J \| lt.eq V n \, wide \| G \| gt.eq n^2 \/ V . $ <eq:inc-graph-hypotheses>]

 Then there is $S subset.eq A$ such that
#[#set math.equation(numbering: n => "(9)")
 $ frac(3 n, 8 V^2) lt.eq \| S \| lt.eq V n $ <eq:inc-extracted-size>]

 and
#[#set math.equation(numbering: n => "(10)")
 $ \| S - S \| \, \| S \/ S \| lt.eq 2^20 V^22 n . $ <eq:inc-extracted-expansion>]

 Here $S \/ S = { a \/ a' : a \, a' in S }$.]
] <inc-simultaneous-extraction>

#proof[
  We first find a large set of vertices such that every ordered pair is joined by many walks of length four.
    Counting the possible edge labels of these walks will then bound both differences and quotients of the endpoints.
  Regard $G$ as a bipartite graph, and put $tau = \( 512 V^8 \)^(- 1)$.
    Call an ordered pair $\( a \, a_2 \) in A^2$ bad if it has fewer than $tau n$ common neighbors in $B$.
    To find a neighborhood with few bad pairs, first note that vertices of $B$ with fewer than $n \/ \( 2 V^2 \)$
    neighbors account for at most $\| B \| n \/ \( 2 V^2 \) lt.eq n^2 \/ \( 2 V \)$ edges.
    Since every vertex of $B$ has at most $V n$ neighbors, the set of vertices with at least $n \/ \( 2 V^2 \)$
    neighbors has size at least $n \/ \( 2 V^2 \)$.
  Summed over all $b in B$, the number of bad ordered pairs in the neighborhood of $b$ is at most
  $ \| A \|^2 tau n lt.eq V^2 tau n^3 . $
  Averaging over the large neighborhoods just identified, one obtains a neighborhood $A_0$ of size at least
    $n \/ \( 2 V^2 \)$ in which the number of bad ordered pairs is at most
  $ 2 V^4 tau n^2 = frac(n^2, 256 V^4) lt.eq frac(\| A_0 \|^2, 64) lt.eq frac(\| A_0 \|^2, 16) . $
  Let $S$ consist of those $a in A_0$ having at most $\| A_0 \| \/ 4$ bad partners in $A_0$.
    At most $\| A_0 \| \/ 4$ elements are discarded, so $\| S \| gt.eq 3 \| A_0 \| \/ 4$, proving (9).
  The choice of $S$ ensures that, for every $a \, a' in S$,
    at least $\| A_0 \| \/ 2$ elements $a_2 in A_0$ form nonbad pairs with both endpoints.
    Each such $a_2$ gives at least $\( tau n \)^2$ ordered walks
  $ a \, b_1 \, a_2 \, b_2 \, a' $
  whose four edges belong to $G$. Repeated vertices are allowed.
    Consequently each ordered endpoint pair in $S^2$ has at least
  #[#set math.equation(numbering: n => "(11)")
   $ frac(\| A_0 \|, 2) \( tau n \)^2 gt.eq frac(n^3, 2^20 V^18) $ <eq:inc-walk-count>]
  such walks. This lower bound now converts the limited number of edge labels into a bound on endpoint differences.
  For one of these walks, write its edge differences, always taking the $A$ coordinate minus the $B$ coordinate, as
  $ d_1 = a - b_1 \, quad d_2 = a_2 - b_1 \, quad d_3 = a_2 - b_2 \, quad d_4 = a' - b_2 . $
  They satisfy $a - a' = d_1 - d_2 + d_3 - d_4$. For a fixed endpoint pair,
    the four differences determine the walk uniquely: starting from $a$, one recovers successively $b_1 \, a_2 \,
    b_2 \, a'$. Choose one ordered endpoint pair for each element of $S - S$.
    The resulting collections of difference quadruples are disjoint for different differences,
    because their alternating sums differ. Counting in $D^4$ and using (11) gives
  $ \| S - S \| lt.eq frac(\| D \|^4, n^3 \/ \( 2^20 V^18 \)) lt.eq 2^20 V^22 n . $
  The same walks give the quotient bound on the same set $S$. Put
  $ j_1 = a \/ b_1 \, quad j_2 = a_2 \/ b_1 \, quad j_3 = a_2 \/ b_2 \, quad j_4 = a' \/ b_2 . $
  All are nonzero, and $a \/ a' = j_1 j_3 \/ \( j_2 j_4 \)$.
    From a fixed initial $a$ and these four quotients one recovers $b_1 = a \/ j_1$, $a_2 = j_2 b_1$, $b_2 =
    a_2 \/ j_3$, and $a' = j_4 b_2$. Choosing one endpoint pair for each element of $S \/
    S$ and counting in $J^4$ therefore proves the other bound in (10). ◻
]

=== 2.2 Bounded scalar expressions and subfields <bounded-scalar-expressions-and-subfields>

We now turn to the algebraic obstruction: a set near the square-root field scale cannot have both the small
  difference set and the small quotient set supplied by the extraction lemma.
  The first step is to bound sums involving scalars formed using a bounded number of field operations.
  We use the scalar-covering method of Bourgain, Katz, and Tao #cite(label("BKT2004")) Lemma 3.2 and Proposition
  3.3, keeping the dependence on the number of operations explicit.

An expression in a set $E subset.eq F$ is built from members of $E union { 0 \, 1 }$ using binary addition,
  subtraction, and multiplication, and unary negation and inversion.
  Each of these operations counts as one operation. Inversion is allowed only when its argument is nonzero.

#thm([Lemma 2.4.])[
  (Uniform scalar coverings).  #emph[Let $B$ be a nonempty finite subset of a field $F$, let $E subset.eq B$,
    and let $K gt.eq 2$. Suppose that
#[#set math.equation(numbering: n => "(12)")
 $ \| B - B \| lt.eq K \| B \| \, wide \| B - e B \| lt.eq
   2 K^3 \| B \| quad \( e in E \) . $ <eq:inc-scalar-hypotheses>]

 Define
#[#set math.equation(numbering: n => "(13)")
 $ C_0 = 4 \, wide C_(m + 1) = 3 C_m + 5 \, wide upright("so that ") C_m =
   frac(13 dot.op 3^m - 5, 2) . $ <eq:inc-scalar-exponents>]

 If $lambda in F$ has an expression in $E$ using at most $m$ operations,
   then $lambda B$ is contained in at most $K^(C_m)$ translates of $B - B$. In particular,
#[#set math.equation(numbering: n => "(14)")
 $ \| E + lambda E \| lt.eq \| B + lambda B \| lt.eq K^(C_m + 3) \| B \| . $ <eq:inc-scalar-sum-bound>]

 These bounds are uniform over all such expressions and all choices of their entries from $E$.]
] <inc-scalar-coverings>

#proof[
  Put $H = B - B$, so $H = - H$ and $0 in H$. In the remainder of this proof,
    integer multiples of $B$ or $H$ inside sumsets denote iterated sums.
    We prove the covering assertion by induction on expression length.
    To combine coverings at an induction step, we will need a fixed covering of $2 H$ by translates of $H$. By Lemma 4,
  $ \| 2 H - B \| = \| 2 B - 3 B \| lt.eq K^5 \| B \| . $
  The covering statement of that lemma consequently supplies a set $T_(*) subset.eq F$ with $\| T_(*) \| lt.eq
    K^5$ such that
  #[#set math.equation(numbering: n => "(15)")
   $ 2 H subset.eq T_(*) + H . $ <eq:inc-two-differences-cover>]
  Every $e in E$ has a covering $e B subset.eq T_e + H$ with $\| T_e \| lt.eq 2 K^3 lt.eq K^4$,
    by (12) and the covering lemma. The scalars $0$ and $1$ also have coverings by one translate of $H$:
    use ${ 0 } subset.eq H$ and $B subset.eq b_0 + H$ for any $b_0 in B$. This proves the case $m = 0$.
  We now check how the number of translates changes under each allowed operation. Suppose that
  $ lambda B subset.eq T + H \, wide mu B subset.eq U + H \, wide \| T \| lt.eq K^a \, quad \| U \| lt.eq K^b . $
  Negation replaces $T$ by $- T$. For addition and subtraction,
  $ \( lambda plus.minus mu \) B subset.eq lambda B plus.minus mu B subset.eq T plus.minus U +
    2 H subset.eq T plus.minus U + T_(*) + H \, $
  so the number of translates is at most $K^(a + b + 5)$. For a product,
  $ lambda mu B subset.eq lambda U + lambda H = lambda U + \( lambda B - lambda B \) subset.eq lambda U + T - T +
    T_(*) + H . $
  This uses at most $K^(b + 2 a + 5)$ translates and is valid even if $lambda = 0$. Finally, if $lambda eq.not 0$, then
  $ \| lambda B - B \| lt.eq \| T \| thin \| H - B \| = \| T \| thin \| B - 2 B \| lt.eq K^(a + 3) \| B \| . $
  Scaling by $lambda^(- 1)$ and then negating gives $\| lambda^(- 1) B - B \| lt.eq K^(a + 3) \| B \|$.
    The covering lemma now covers $lambda^(- 1) B$ by at most $K^(a + 3)$ translates of $H$.
  These bounds give the claimed uniform induction: in an expression with at most $m + 1$ operations,
    each immediate subexpression has at most $m$ operations, so every resulting covering uses at most
    $K^(3 C_m + 5)$ translates. This proves the covering assertion with (13).
  To deduce the sumset bound from the covering, let $lambda B subset.eq T + H$ be the covering just obtained. Then
  $ \| B + lambda B \| lt.eq \| T \| thin \| B + H \| = \| T \| thin \| 2 B - B \| lt.eq K^(C_m + 3) \| B \| \, $
  again by Lemma 4. Since $E subset.eq B$, this also bounds $\| E + lambda E \|$. ◻
]

When working along a sequence $q arrow.r oo$, a positive quantity $K =
  q^(o \( 1 \))$ means that $log K \/ log q arrow.r 0$. Likewise, $\| S \| =
  q^(1 \/ 2 + o \( 1 \))$ means that $log \| S \| \/ log q arrow.r 1 \/ 2$.
  In particular, every fixed power of a subpower factor is still a subpower factor.
  This is why a uniform bound for expressions of fixed length suffices for the next lemma.

#thm([Lemma 2.5.])[
  (Exclusion of an intermediate approximate subfield).  #emph[There is no sequence of prime powers $q arrow.r oo$,
    each satisfying the proper-subfield hypothesis of Theorem 3,
    together with sets $S subset.eq bb(F)_q^(*)$ and numbers $K gt.eq 2$ such that
#[#set math.equation(numbering: n => "(16)")
 $ \| S \| = q^(1 \/ 2 + o \( 1 \)) \, wide K = q^(o \( 1 \)) \, wide \| S - S \| \, \| S \/ S \| lt.eq
   K \| S \| . $ <eq:inc-approximate-subfield-hypotheses>]

]
] <inc-no-approximate-subfield>

#proof[
  Suppose that such a sequence exists. We first use multiplicative overlaps to obtain sets satisfying the
    scalar-covering hypotheses. Ratios of differences in a large subset will then form a subfield.
    The proper-subfield hypothesis will force that subfield to be the whole field,
    where averaging will contradict the scalar-covering bound.
  ===== 2.2.1 Extracting scalar-covering hypotheses. <extracting-scalar-covering-hypotheses.>
  Put $s = \| S \|$. The $s$ sets $S \/ a$, $a in S$, each have size $s$,
    and their union is contained in $S \/ S$. Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(17)")
   $ sum_(a \, b in S) \| S \/ a ∩ S \/ b \| gt.eq frac(s^4, \| S \/ S \|) gt.eq s^3 /
     K . $ <eq:inc-multiplicative-overlaps>]
  Thus some $b in S$ satisfies $sum_(a in S) \| S \/ a ∩ S \/ b \| gt.eq s^2 \/ K$.
    Since every summand is at most $s$, at least $s \/ \( 2 K \)$ values $a in S$ have $\| S \/ a ∩ S \/ b \|
    gt.eq s \/ \( 2 K \)$: otherwise the sum of the large summands would be less than $s^2 \/ \( 2 K \)$ and that
    of all the other summands at most $s^2 \/ \( 2 K \)$.
  Let $E$ be the set of $e = a \/ b$ for these values of $a$, and put $B = S \/ b$. Then
  #[#set math.equation(numbering: n => "(18)")
   $ E subset.eq B \, wide \| B \| = s \, wide \| E \| gt.eq frac(s, 2 K) \, wide \| S ∩ e S \| gt.eq
     frac(s, 2 K) quad \( e in E \) . $ <eq:inc-overlap-subset>]
  The last inequality follows by multiplying $S \/ a ∩ S \/ b$ by $a$.
    For $Z = S ∩ e S$, the triangle inequality and the containments $Z subset.eq S \, e S$ imply
  $ \| S - e S \| lt.eq frac(\| S - Z \| thin \| Z - e S \|, \| Z \|) lt.eq frac(\( K s \)^2, s \/ \( 2 K \)) =
    2 K^3 s . $
  After scaling by $1 \/ b$, we have
  $ \| B - B \| lt.eq K s \, wide \| B - e B \| lt.eq 2 K^3 s quad \( e in E \) . $
  Thus Lemma 6 applies to $B$ and $E$. We have obtained uniform control for every scalar expressible using a
    bounded number of operations on elements of $E$.
  ===== 2.2.2 Ratios of differences form a subfield. <ratios-of-differences-form-a-subfield.>
  Write $t = \| E \|$. By (18) and (16), $t = q^(1 \/ 2 + o \( 1 \))$.
    In particular, $t gt.eq 2$ for all sufficiently large fields in the sequence. Define
  #[#set math.equation(numbering: n => "(19)")
   $ R_0 = {frac(x - x', y - y') : x \, x' \, y \, y' in E \, med y eq.not y'} . $ <eq:inc-ratio-set>]
  To prove closure under addition and multiplication, we apply the scalar-covering bound to the result of either
    operation. Every member of $R_0$ has an expression in $E$ with at most four operations.
    Consequently, for $r \, r' in R_0$, each of $r + r'$ and $r
    r'$ has an expression with at most nine operations. For either candidate $lambda$, Lemma 6 gives
  $ \| E + lambda E \| lt.eq K^(C_9 + 3) s < t^2 $
  for all sufficiently large $q$, uniformly over $r \, r'$.
    Indeed, the ratio of this upper bound to $t^2$ is at most $4 K^(C_9 + 5) \/ s$, which tends to zero.
    Therefore the map $\( x \, y \) mapsto x + lambda y$ from $E^2$ is not injective.
    A collision between distinct pairs satisfies $y eq.not y'$, since otherwise also $x = x'$, and gives
  $ lambda = frac(x' - x, y - y') in R_0 . $
  It follows that $R_0$ is closed under addition and multiplication.
    It contains $0$ and $1$ and, directly from its definition,
    is closed under negation and reciprocals of nonzero elements. Thus $R_0$ is a subfield of $bb(F)_q$.
  The size of $E$ now prevents this subfield from being proper. Choose distinct $e_0 \, e_1 in E$. The map
  $ e mapsto frac(e - e_0, e_1 - e_0) $
  injects $E$ into $R_0$, so $\| R_0 \| gt.eq t > q^(1 \/ 3)$ for large $q$.
    The proper-subfield hypothesis forces $R_0 = bb(F)_q$.
  ===== 2.2.3 A scalar with a large sumset. <a-scalar-with-a-large-sumset.>
  Every field element consequently has a four-operation representation using elements of $E$.
    The scalar-covering estimate therefore bounds $\| E + lambda E \|$ for every scalar.
    To reach a contradiction, we average over the field and find a scalar for which this sumset is too large.
  For $lambda in bb(F)_q$, let $N_lambda$ be the number of ordered quadruples $\( x \, y \, x' \, y' \) in
    E^4$ satisfying $x + lambda y = x' + lambda y'$. There are $t^2$ identical pairs,
    which give a collision for every $lambda$. If $y eq.not y'$, exactly one value of $lambda$ gives a collision;
    if $y = y'$ but $x eq.not x'$, none does. Hence
  #[#set math.equation(numbering: n => "(20)")
   $ 1 / q sum_(lambda in bb(F)_q) N_lambda = t^2 + frac(t^4 - t^3, q) lt.eq t^2 + t^4 /
     q . $ <eq:inc-average-collisions>]
  For some $lambda$, Cauchy–Schwarz applied to the fibers of $\( x \, y \) mapsto x + lambda y$ therefore yields
  #[#set math.equation(numbering: n => "(21)")
   $ \| E + lambda E \| gt.eq frac(t^4, t^2 + t^4 \/ q) gt.eq 1 / 2 min \( t^2 \, q \) =
     q^(1 - o \( 1 \)) . $ <eq:inc-large-dilate-sum>]
  But $R_0 = bb(F)_q$, so this particular $lambda$ itself has a four-operation representation in (19).
    Lemma 6 bounds its sumset by $K^(C_4 + 3) s = q^(1 \/ 2 + o \( 1 \))$, contradicting (21).
    The expression length here remains bounded; no iteration of field generation is being used. ◻
]

=== 2.3 Proof of the incidence theorem <proof-of-the-incidence-theorem>

The algebraic ingredients are now in place. It remains to obtain the hypotheses of Lemma 5 from a configuration
  with too many incidences. We use the projective-coordinate reduction in the incidence strategy of Bourgain,
  Katz, and Tao #cite(label("BKT2004")) Section 6: after controlling degrees,
  we choose four points whose pencils encode the two coordinates, their difference, and their quotient.

#proof[
  We argue by contradiction, allowing all quantitative losses to be subpower factors along a sequence of fields.
    Suppose the theorem is false. For a sequence of positive exponents $kappa_j arrow.r
    0$ in $\( 0 \, 1 \/ 10 \)$, choose admissible counterexamples with $q_j arrow.r oo$.
    Such choices are possible because the failure of the theorem says that for each fixed exponent there are
    arbitrarily large counterexamples. Along this sequence, put $U =
    max \( 2 \, q_j^(kappa_j) \)$ and suppress the index $j$. We have
  #[#set math.equation(numbering: n => "(22)")
   $ \| P \| \, \| cal(L) \| lt.eq U q \, wide I \( P \, cal(L) \) gt.eq q^(3 \/ 2) / U \, wide U gt.eq 2 \, wide
     U = q^(o \( 1 \)) . $ <eq:inc-counterexample-sequence>]
  All bounds below use absolute constants. Every assertion made for sufficiently large $q$ is along this sequence.
    Our goal is to construct from these counterexamples sets of the size and small-expansion form excluded by Lemma 7.
  ===== 2.3.1 Pruning the incidence graph. <pruning-the-incidence-graph.>
  We first retain many incidences while putting both an upper and a lower bound on every remaining degree.
    Consider the bipartite graph on $P$ and $cal(L)$ whose edges are incidences.
    If $d \( v \)$ denotes a degree on either side, then counting ordered pairs on the opposite side and using the
    unique join of two distinct projective points, or the unique intersection of two distinct projective lines, gives
  #[#set math.equation(numbering: n => "(23)")
   $ sum_v d \( v \)^2 lt.eq 2 U^2 q^2 quad upright("on each side") . $ <eq:inc-degree-squares>]
  Here $sum_v d \( v \) \( d \( v \) - 1 \) lt.eq U^2 q^2$, and $sum_v d \( v \) = I \( P \, cal(L) \) lt.eq U^2 q^2$.
  Set
  #[#set math.equation(numbering: n => "(24)")
   $ H = 16 U^3 q^(1 \/ 2) \, wide d = frac(q^(1 \/ 2), 8 U^2) . $ <eq:inc-degree-cutoffs>]
  Delete every vertex whose initial degree exceeds $H$. By (23), the total number of incidences lost,
    counting both sides, is at most
  $ frac(4 U^2 q^2, H) = frac(q^(3 \/ 2), 4 U) . $
  Next, iteratively delete vertices whose current degree is less than $d$.
    Each of the at most $2 U q$ original vertices is deleted at most once,
    so this stage loses at most $2 U q thin d = q^(3 \/ 2) \/ \( 4 U \)$ incidences.
    Denote the surviving sets again by $P \, cal(L)$. They satisfy
  #[#set math.equation(numbering: n => "(25)")
   $ I \( P \, cal(L) \) gt.eq frac(q^(3 \/ 2), 2 U) \, wide frac(q, 32 U^4) lt.eq \| P \| \, \| cal(L) \| lt.eq
     U q \, wide d lt.eq d \( v \) lt.eq H . $ <eq:inc-pruned-bounds>]
  The size lower bounds follow by dividing the surviving incidence count by the maximum degree $H$.
  The pruning also controls the intersection of $P$ with #emph[every] projective line,
    including lines not in $cal(L)$. We will need this stronger form of control when discarding points on a few
    lines chosen later. Fix a projective line $ell$. Each point of $P ∩ ell$ is incident with at least $d -
    1$ lines of $cal(L)$ different from $ell$. These lines are distinct for different points of $P ∩ ell$.
    Since $d arrow.r oo$, for large $q$ we obtain
  #[#set math.equation(numbering: n => "(26)")
   $ \| P ∩ ell \| lt.eq frac(\| cal(L) \|, d - 1) lt.eq 16 U^3 q^(1 \/ 2) = H wide
     upright("for every projective line ") ell . $ <eq:inc-all-line-cap>]
  ===== 2.3.2 Four anchors with many common witnesses. <four-anchors-with-many-common-witnesses.>
  We seek four points, three collinear and the fourth off their line,
    together with many points joined to each of them by lines of $cal(L)$.
    We obtain the four points by first counting such configurations around each possible common point and then
    averaging.
  For $x in P$, let $N \( x \)$ consist of the points in $P \\ { x }$ joined to $x$ by a line of $cal(L)$.
    Distinct lines through $x$ have disjoint point sets away from $x$, so
  #[#set math.equation(numbering: n => "(27)")
   $ \| N \( x \) \| gt.eq d \( d - 1 \) gt.eq frac(q, 128 U^4) $ <eq:inc-neighborhood-size>]
  for large $q$. Put $t_ell = \| N \( x \) ∩ ell \|$. Summing degrees of the points of $N \( x \)$ gives
  $ sum_(ell in cal(L)) t_ell gt.eq d \| N \( x \) \| gt.eq frac(q^(3 \/ 2), 1024 U^6) . $
  Lines with $t_ell lt.eq 2$ contribute at most $2 U q$. Because $U = q^(o \( 1 \))$,
    for sufficiently large $q$ this is at most half of the displayed lower bound. Consequently
  $ sum_(ell : t_ell gt.eq 3) t_ell gt.eq frac(q^(3 \/ 2), 2048 U^6) . $
  For every integer $t gt.eq 3$, one has $t \( t - 1 \) \( t - 2 \) gt.eq \( 2 \/ 9 \) t^3$.
    Hölder’s inequality therefore shows that the number of ordered triples of distinct points of $N \( x \)$ lying
    on a line of $cal(L)$ is at least
  #[#set math.equation(numbering: n => "(28)")
   $ sum_(ell in cal(L)) t_ell \( t_ell - 1 \) \( t_ell - 2 \) & gt.eq
     frac(2, 9 \| cal(L) \|^2) (sum_(ell : t_ell gt.eq 3) t_ell)^3\
 & gt.eq frac(q^(5 \/ 2), 9 dot.op 2^32 U^20) . $ <eq:inc-collinear-triples>]
  By (26) and (27), each such triple admits at least
  $ frac(q, 128 U^4) - H gt.eq frac(q, 256 U^4) $
  choices of a fourth point in $N \( x \)$ outside its line, once $q$ is large enough.
    Summing over $x$ and using (25), we obtain at least
  #[#set math.equation(numbering: n => "(29)")
   $ frac(q^(9 \/ 2), 9 dot.op 2^45 U^28) $ <eq:inc-witness-quadruple-count>]
  ordered choices $\( x \, p_1 \, p_2 \, p_3 \, p_4 \)$ with $p_1 \, p_2 \,
    p_3$ distinct and collinear on a line of $cal(L)$, with $p_4$ outside that line,
    and with all four $p_i$ in $N \( x \)$.
  We now reverse the count to fix the four anchor points while retaining many choices of the common point $x$.
    The number of possible ordered quadruples $\( p_1 \, p_2 \, p_3 \, p_4 \)$ in this count is at most
  #[#set math.equation(numbering: n => "(30)")
   $ \| cal(L) \| H^3 \| P \| lt.eq 2^12 U^11 q^(7 \/ 2) . $ <eq:inc-quadruple-upper-bound>]
  Some quadruple thus has at least
  #[#set math.equation(numbering: n => "(31)")
   $ c_0 q / U^39 quad upright("witnesses ") x \, wide c_0 = frac(1, 9 dot.op 2^57) . $ <eq:inc-common-witnesses>]
  Discard the witnesses on the common line of $p_1 \, p_2 \, p_3$ and on the joins of $p_1 \, p_4$ and of $p_2 \,
    p_4$. The cap (26) discards at most $3 H$ witnesses. Since $U = q^(o \( 1 \))$,
    this is eventually less than $c_0 q \/ \( 2 U^39 \)$. At least that many witnesses remain.
    Their joins to the four anchors will supply the graph and the four small sets required by Lemma 5.
  ===== 2.3.3 The four pencils as coordinates. <the-four-pencils-as-coordinates.>
  Choose projective coordinates in which
  $ p_1 = \( 1 : 0 : 0 \) \, wide p_2 = \( 0 : 1 : 0 \) \, wide p_3 = \( 1 : 1 : 0 \) \, wide p_4 = \( 0 : 0 : 1 \) . $
  This is possible over $bb(F)_q$: representatives of $p_1 \, p_2$ span their line,
    the representative of the distinct third point has both coefficients nonzero and permits rescaling of the
    first two, and a representative of $p_4$ completes a basis.
    The discarded lines are precisely the coordinate line at infinity and the two coordinate axes through $p_4$.
    Hence every remaining witness has coordinates $\( a : b : 1 \)$ with $a \, b eq.not 0$.
  Let $G$ be the set of these pairs $\( a \, b \)$, and let $A \, B$ be its coordinate projections.
    Define $D$ and $J$ from $G$ as in Lemma 5. The chosen coordinates make the roles of the four pencils explicit:
    for a witness $\( a : b : 1 \)$, the joins to $p_2 \, p_1 \, p_3 \, p_4$, respectively, have equations
  $ X = a Z \, wide Y = b Z \, wide X - Y = \( a - b \) Z \, wide X = \( a \/ b \) Y . $
  Each join is a member of $cal(L)$, by the witness property.
    Each anchor belongs to $P$ and has degree at most $H$. Distinct values of the corresponding parameter give
    distinct lines in its pencil. Thus
  $ \| A \| \, \| B \| \, \| D \| \, \| J \| lt.eq H \, wide \| G \| gt.eq frac(c_0 q, 2 U^39) . $
  With
  #[#set math.equation(numbering: n => "(32)")
   $ n = q^(1 \/ 2) \, wide V = 2 / c_0 U^39 \, $ <eq:inc-graph-parameters>]
  we have $V gt.eq 2$, $V = q^(o \( 1 \))$, and all the hypotheses (8) hold.
  The incidence configuration now meets the extraction hypotheses. Lemma 5 gives $S subset.eq bb(F)_q^(*)$ satisfying
  $ frac(3 q^(1 \/ 2), 8 V^2) lt.eq \| S \| lt.eq V q^(1 \/ 2) \, wide \| S - S \| \, \| S \/ S \| lt.eq
    2^20 V^22 q^(1 \/ 2) . $
  In particular $\| S \| = q^(1 \/ 2 + o \( 1 \))$, and, on setting $K = 2^23 V^24$, we have $K gt.eq 2$, $K =
    q^(o \( 1 \))$, and $\| S - S \| \, \| S \/ S \| lt.eq K \| S \|$. This contradicts Lemma 7.
  We have excluded every sequence of counterexamples of the form (22).
    The negation of the theorem would have produced such a sequence,
    so some absolute $kappa in \( 0 \, 1 \/ 10 \)$ and $Q$ satisfy the stated conclusion. ◻
]

== 3 Line covers after random deletions <sec:linecover>

We regard the affine plane $bb(F)_q^2$ as a subset of its projective completion $bb(P)^2 \( bb(F)_q \)$.
  Thus a pencil with centre at infinity is a parallel class of affine lines.
  The purpose of this section is to show that a set of at most $q$ lines covering almost all survivors of a
  suitable random deletion process must contain almost a full pencil.
  The deletions within a single trial may be dependent; independence is required only between trials.

Classical covering results for finite planes are closely related by duality to blocking sets.
  Jamison and Brouwer–Schrijver established the affine blocking-set lower bound $2 q -
  1$ #cite(label("Jamison1977")) #cite(label("BrouwerSchrijver1978")), and Blokhuis, Brouwer,
  and Szőnyi studied partial projective covers and bounds depending on their uncovered points
  #cite(label("BBS2010")) Section 1.1, Proposition 1.5. Here the covered set instead consists of the
  positive-density survivors of structured random deletions.
  We prove the pencil statement needed in this setting directly.

There are two different concentration tasks. The total number of surviving points and the number on a fixed line
  have bounded changes under one trial; for these we use the elementary estimates
  in #cite(label("OpenAI2026Balanced")) Lemmas A.2–A.3. The more delicate task is to retain many intersections of
  a short list of lines, simultaneously for every such list.
  A deletion trial rarely hits this small set, and we must use that rarity in the variance estimate.
  We prove the needed Bernstein-type martingale bound here,
  following the method of Freedman #cite(label("Freedman1975")) Theorem (1.6) and Proposition (2.1).

#thm([Lemma 3.1.])[
  (Martingale concentration).  #emph[Let $Z_i$, $1 lt.eq i lt.eq n$,
    be martingale differences for a filtration $\( cal(A)_i \)_(i = 0)^n$.
    Suppose that $M \, V > 0$ and deterministic numbers $v_i gt.eq 0$ satisfy, almost surely,
$ \| Z_i \| lt.eq M \, wide bb(E) \( Z_i^2 divides cal(A)_(i - 1) \) lt.eq v_i \, wide sum_(i = 1)^n v_i lt.eq V . $

 Then, for every $u > 0$,
#[#set math.equation(numbering: n => "(33)")
 $ Pr (lr(|sum_(i = 1)^n Z_i|) gt.eq u) lt.eq 2 exp [- 1 / 4 min {u^2 / V \, u / M}] . $ <eq:lc-martingale>]

]
] <lem:martingale>

#proof[
  For $\| z \| lt.eq 1$ we have $e^z lt.eq 1 + z + z^2$. Consequently, if $\| theta \| lt.eq M^(- 1)$,
    the conditional mean-zero property gives
  $ bb(E) \( e^(theta Z_i) divides cal(A)_(i - 1) \) lt.eq 1 + theta^2 v_i lt.eq e^(theta^2 v_i) . $
  Iteration and Markov’s inequality bound the upper tail by $exp \( theta^2 V - theta u \)$ for $0 < theta lt.eq
    M^(- 1)$. Take $theta = min { u \/ \( 2 V \) \, 1 \/ M }$.
    If $u lt.eq 2 V \/ M$, the exponent is $- u^2 \/ \( 4 V \)$; otherwise it is at most $- u \/ \( 2 M \)$.
    Applying the same argument to $- Z_i$ proves (33). ◻
]

#thm([Lemma 3.2.])[
  (Line covers after random deletions).  #emph[Let $q arrow.r
    oo$ through prime powers for which every proper subfield of $bb(F)_q$ has order at most $q^(1 \/ 3)$.
    Fix a positive integer $D$ and constants $delta > 0$ and $0 < rho < 1$.
    For each $q$, let $cal(F)$ be a family of at most $D q^D$ subsets of $bb(F)_q^2$, called shapes, such that]
  + #emph[every $F in cal(F)$ has at most $D q$ points;]
  + #emph[for every $F in cal(F)$ and affine line $ell$, either $F = ell$ or $\| F ∩ ell \| lt.eq D$.]
  #emph[There are at most $D q$ independent trials, each producing a random list of at most $D$ shapes from
    $cal(F)$. Delete every point on any listed shape, and denote the surviving set by $X$. Assume that]
  + #emph[for each point $x$ and each trial, the probability that this trial deletes $x$ is at most $D \/ q$;]
  + #emph[$Pr \( x in X \) = delta_q gt.eq delta$ for every $x in bb(F)_q^2$;]
  + #emph[for each affine line $ell$, the sum over trials of the probabilities that the trial lists the exact
    shape $ell$ is at most $D \/ q$.]
  #emph[Write $X^ell$ for the surviving set when all exact occurrences of the shape $ell$ are ignored,
    with every other listed shape still deleted. With probability tending to one,
    both of the following statements hold:]
  + #emph[$\| X^ell ∩ ell \| gt.eq delta q \/ 2$ for every affine line $ell$;]
  + #emph[every set of at most $q$ affine lines covering all but at most $2
    q$ points of $X$ contains at least $\( 1 - rho \) q$ lines through a common projective point.]
] <lem:linecover>

#proof[
  We first establish a simultaneous lower bound on surviving cross-intersections for every admissible pair of
    short line lists, ignoring any deletion shape equal to one of those lines.
    After fixing such a realization, we show that any cover lacking an almost full pencil contains an admissible
    pair with too few surviving cross-intersections. This second step samples only within the fixed cover,
    with separate arguments according to its maximum concurrency.
  Fix the absolute constant $kappa in \( 0 \, 1 \/ 10 \)$ of Theorem 3, and put $epsilon.alt = kappa \/ 10$.
    All constants below may depend on the fixed parameters, but not on $q$, the particular deletion distributions,
    or a subsequently chosen cover.
  ===== 3.1 Uniform point and line counts. <uniform-point-and-line-counts.>
  Expose the independent trials one at a time. Changing one trial changes $\| X \|$ by at most $2 D^2 q$,
    because the old and new lists contain at most $2 D$ shapes in total and each has at most $D q$ points.
    The exposure observation in #cite(label("OpenAI2026Balanced")) Lemma A.3 therefore bounds the absolute
    martingale increment by $L = 2 D^2 q$. There are $T lt.eq D q$ trials, and $bb(E) \| X \| = delta_q q^2$.
    The fixed-time concentration estimate in #cite(label("OpenAI2026Balanced")) Lemma A.2, with $u =
    q^(3 \/ 2 + epsilon.alt)$, gives
  $ Pr #scale(x: 120%, y: 120%)[\(] \| \| X \| - delta_q q^2 #scale(x: 120%, y: 120%)[\|] gt.eq
    q^(3 \/ 2 + epsilon.alt) #scale(x: 120%, y: 120%)[\)] lt.eq 2 exp (- frac(q^(2 epsilon.alt), 32 D^5)) . $
  If there are no trials, the count is deterministic and this bound holds as well.
    Equivalently, we may add a dummy trial of zero change.
  For the line count $\| X^ell ∩ ell \|$, the rule ignoring exact copies of $ell$ is applied separately to each
    trial. Changing one trial then changes the count by at most $2 D^2$:
    each of its at most $2 D$ old or new shapes meets $ell$ in at most $D$ points.
    With $L = 2 D^2$ and $u = q^(1 \/ 2 + epsilon.alt)$, the same two elementary estimates and $T lt.eq D q$ give
  $ Pr #scale(x: 120%, y: 120%)[\(] \| \| X^ell ∩ ell \| - bb(E) \| X^ell ∩ ell \| #scale(x: 120%, y: 120%)[\|]
    gt.eq q^(1 \/ 2 + epsilon.alt) #scale(x: 120%, y: 120%)[\)] lt.eq 2 exp (- frac(q^(2 epsilon.alt), 32 D^5)) . $
  Moreover, a point restored by ignoring $ell$ can be restored only if some trial lists $ell$ exactly.
    The probability of this event is at most $D \/ q$, by the third deletion hypothesis. Therefore
  $ delta_q q lt.eq bb(E) \| X^ell ∩ ell \| lt.eq delta_q q + D . $
  There are $q \( q + 1 \)$ affine lines. The superpolynomial tails and a union bound consequently show that,
    with probability tending to one,
  #[#set math.equation(numbering: n => "(34)")
   $ \| X \| & = delta_q q^2 + O_D \( q^(3 \/ 2 + epsilon.alt) \) \,\
\| X^ell ∩ ell \| & = delta_q q + O_D \( q^(1 \/ 2 + epsilon.alt) \) wide
  upright("for every affine line ") ell . $ <eq:lc-counts>]
  The lower line estimate proves the first conclusion of the lemma.
    For the pencil conclusion we will also need to bound overlaps in an alleged cover.
    The same estimates give the uniform upper bound
  #[#set math.equation(numbering: n => "(35)")
   $ \| X ∩ ell \| lt.eq delta_q q + O_D \( q^(1 \/ 2 + epsilon.alt) \) \, $ <eq:lc-line-upper>]
  because $X subset.eq X^ell$.
  ===== 3.2 A simultaneous event for small line samples. <a-simultaneous-event-for-small-line-samples.>
  The counts just proved control a single line but do not yet restrict how a cover’s lines meet.
    We now obtain a stronger test on short lists of lines: provided their intersections are distinct and not
    concentrated on a deletion shape, many of those intersections survive.
    The list length will be logarithmic in $q$, so that the variance-sensitive tail can pay for a union bound over
    all lists.
  Set
  $ h = 10 \( D + 1 \) \, wide H_0 = 2 D h \, wide t = ceil.l A log q ceil.r \, $
  where the fixed constant $A$ will be chosen below. Consider any ordered tuple of $2 t$ distinct affine lines,
    separated into two lists of length $t$. Call the tuple admissible if its cross-list intersections form a set
    $P_0$ of $t^2$ distinct finite points, and
  #[#set math.equation(numbering: n => "(36)")
   $ \| F ∩ P_0 \| lt.eq H_0 quad upright("for every ") F in cal(F)
     upright(" which is not one of the tuple lines") . $ <eq:lc-occupancy>]
  For this tuple, ignore deletions by every shape equal to a tuple line,
    and let $Y_0$ count the survivors in $P_0$ after the remaining deletions.
    We claim that, with probability tending to one,
  #[#set math.equation(numbering: n => "(37)")
   $ Y_0 gt.eq frac(delta t^2, 2) wide upright("for every admissible tuple") . $ <eq:lc-tuple-event>]
  To prove the claim, fix a tuple in advance. Omitting shapes is a deterministic operation on each trial,
    so the trials remain independent. Omission can only restore points, and hence $bb(E) Y_0 gt.eq delta t^2$.
    By (36), each trial’s contribution to the deletion set within $P_0$ has size at most $C_0 = D H_0$.
    The probability that this contribution is nonempty is at most $D t^2 \/ q$,
    by a union bound over $P_0$ and the per-point deletion hypothesis.
  For completeness, the rarity of a nonempty contribution also controls the conditional variance of the exposure
    martingale. Fix the past, and let $g_i \( w \)$ be the conditional expected final value of $Y_0$ when the
    current trial has outcome $w$. Let $g_i \( diameter \)$ denote the hypothetical value obtained by making this
    trial delete nothing on $P_0$. Independence leaves the law of the future trials unchanged, so
  $ \| g_i \( w \) - g_i \( diameter \) \| lt.eq C_0 \, $
  with equality to zero whenever the trial’s contribution is empty.
    The current trial also retains its original law conditional on the past.
    Thus the martingale increment has absolute value at most $2 C_0$, and its conditional variance is at most
  $ bb(E) #scale(x: 120%, y: 120%)[\(] \( g_i \( w \) - g_i \( diameter \) \)^2 divides upright("past")
    #scale(x: 120%, y: 120%)[\)] lt.eq C_0^2 frac(D t^2, q) . $
  The sum of conditional variances is at most $D^2 C_0^2 t^2$, since there are at most $D q$ trials.
    Applying Lemma 8 at deviation $delta t^2 \/ 2$ yields
  #[#set math.equation(numbering: n => "(38)")
   $ Pr (Y_0 < frac(delta t^2, 2)) lt.eq 2 e^(- c_0 t^2) \, wide c_0 = min {frac(delta^2, 16 D^2 C_0^2) \,
     frac(delta, 16 C_0)} > 0 . $ <eq:lc-tuple-tail>]
  In particular, $c_0$ is independent of $A$.
  There are at most $\( q \( q + 1 \) \)^(2 t)$ ordered tuples. The logarithm of the union bound in (38) is
  $ - c_0 t^2 + 4 t log q + O \( t \/ q \) + O \( 1 \) = #scale(x: 120%, y: 120%)[\(] - c_0 A^2 + 4 A +
    o \( 1 \) #scale(x: 120%, y: 120%)[\)] \( log q \)^2 . $
  Choose, for example, any fixed $A > 5 \/ c_0$. This proves (37) simultaneously for all admissible tuples.
  ===== 3.3 Consequences of an alleged cover. <consequences-of-an-alleged-cover.>
  The random part of the argument is complete. We now keep the deletion outcome fixed and show deterministically
    that the simultaneous events exclude any cover without an almost full pencil.
    Random sampling below is only a way to find a short witness inside a fixed cover.
  Fix a realization satisfying both (34) and (37). Suppose that the second conclusion of the lemma fails.
    From an offending cover remove every line which actually occurred as a listed deletion shape.
    Such a line contains no point of $X$, so the remaining line set $L$ still covers all but at most $2
    q$ points of $X$. Put $m = \| L \|$, and for any projective point $p$ write $n_p = \| { ell in L :
    p in ell } \|$. Define
  $ E_L = sum_(x in X) \( n_x - 1 \)_(+) \, wide \( a \)_(+) = max { a \, 0 } . $
  The count of covered survivors and (35) give
  $ m #scale(x: 120%, y: 120%)[\(] delta_q q + O_D \( q^(1 \/ 2 + epsilon.alt) \) #scale(x: 120%, y: 120%)[\)]
    gt.eq delta_q q^2 - O_D \( q^(3 \/ 2 + epsilon.alt) \) - 2 q . $
  Since $delta_q gt.eq delta$ and $m lt.eq q$, this implies
  #[#set math.equation(numbering: n => "(39)")
   $ m = q - O_(D \, delta) \( q^(1 \/ 2 + epsilon.alt) \) \, wide E_L =
     O_D \( q^(3 \/ 2 + epsilon.alt) \) . $ <eq:lc-cover-counts>]
  For the second estimate, subtract the number of covered survivors from $sum_(ell in L) \| X ∩ ell \|$ and use $m
    lt.eq q$. Finally, put
  $ R = max_(p in bb(P)^2 \( bb(F)_q \)) n_p . $
  The failure of the pencil conclusion implies $R lt.eq \( 1 - rho \) q$.
    We will find an admissible tuple of lines from $L$ with fewer than $delta t^2 \/
    2$ survivors in its cross-intersection set.
  ===== 3.4 Low concurrency: $R lt.eq q^(1 \/ 2 + kappa \/ 4)$. <low-concurrency-rleq-q12kappa4.>
  Let $T = q^(1 \/ 2 - kappa \/ 3)$. The number of ordered pairs of distinct lines of $L$ meeting at a point $x in
    X$ is $sum_(x in X) n_x \( n_x - 1 \)$. Points with $n_x < T$ contribute at most
  #[#set math.equation(numbering: n => "(40)")
   $ T E_L = O \( q^(2 - 7 kappa \/ 30) \) . $ <eq:lc-low-light>]
  The set $P = { x in X : n_x gt.eq T }$ has size
  $ \| P \| lt.eq frac(E_L, T - 1) = O \( q^(1 + 13 kappa \/ 30) \) lt.eq q^(1 + kappa) $
  for sufficiently large $q$. Theorem 3, applied to $P$ and $L$, therefore gives $sum_(x in P) n_x lt.eq
    q^(3 \/ 2 - kappa)$. The contribution of these points to the ordered-pair count is at most
  #[#set math.equation(numbering: n => "(41)")
   $ R sum_(x in P) n_x lt.eq q^(2 - 3 kappa \/ 4) . $ <eq:lc-low-heavy>]
  Together, (40) and (41) show that the fraction of ordered distinct line pairs meeting in $X$ is
  #[#set math.equation(numbering: n => "(42)")
   $ O #scale(x: 120%, y: 120%)[\(] q^(- 7 kappa \/ 30) + q^(- 3 kappa \/ 4) #scale(x: 120%, y: 120%)[\)] =
     o \( 1 \) . $ <eq:lc-low-pair-fraction>]
  Sample an ordered tuple of $2 t$ distinct lines uniformly from $L$.
    The expected number of its cross pairs meeting in $X$ is $t^2$ times the fraction in (42).
    Markov’s inequality shows that this number is less than $delta t^2 \/ 2$ with probability tending to one.
  We next check the two admissibility conditions. A given sampled pair is parallel with probability at most
    $R \/ \( m - 1 \)$. Once two distinct lines have been sampled,
    at most $R$ population lines pass through their projective intersection,
    so the probability of concurrency for any specified three sampled positions is at most $R \/ \( m - 2 \)$.
    The probability of any parallel pair or concurrent triple in the tuple is consequently
  #[#set math.equation(numbering: n => "(43)")
   $ O (frac(\( t^2 + t^3 \) R, m)) = O #scale(x: 120%, y: 120%)[\(] \( log q \)^3 q^(- 1 \/ 2 + kappa \/ 4)
     #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <eq:lc-low-degeneracy>]
  If neither event occurs, every cross intersection is finite and the cross intersections are distinct:
    equality of two different cross intersections would make at least three of the tuple lines concurrent.
  To verify (36), fix $F in cal(F)$. Consider the event that $F$ is not a tuple line but contains more than $H_0$
    distinct finite cross intersections. Each tuple line then contains at most $D$ points of $F$.
    Greedily choose a cross intersection on $F$ and its two representing positions,
    and discard all cross intersections on either of those lines. Each step discards at most $2 D$ points.
    Since $H_0 = 2 D h$, this produces $h$ cross pairs whose $2 h$ positions are distinct.
  Among the population $L$, there are at most $m D R$ ordered distinct line pairs, neither line equal to $F$,
    whose intersection lies in $F$. Indeed, the first line meets $F$ in at most $D$ points,
    and at each such point there are at most $R$ choices of the second line.
    There are at most $t^(2 h)$ ordered choices of the $h$ cross pairs of positions.
    For each choice, the sampled lines at those $2 h$ distinct positions are uniform among $\( m \)_(2 h)$
    assignments, where $\( z \)_a = z \( z - 1 \) dots.h.c \( z - a + 1 \)$.
    The probability of the event for this fixed shape is therefore at most
  #[#set math.equation(numbering: n => "(44)")
   $ frac(t^(2 h) \( m D R \)^h, \( m \)_(2 h)) = O_(D \, h) ((frac(t^2 R, m))^h) . $ <eq:lc-low-shape>]
  The numerator may count assignments with repeated population lines; this only enlarges the upper bound.
    Summing (44) over all shapes gives
  $ O #scale(x: 120%, y: 120%)[\(] \( log q \)^(2 h) q^(D - h \( 1 \/ 2 - kappa \/ 4 \))
    #scale(x: 120%, y: 120%)[\)] = o \( 1 \) \, $
  because $kappa < 1 \/ 10$ and $h = 10 \( D + 1 \)$ imply
  $ D - h \( 1 \/ 2 - kappa \/ 4 \) < D - 19 / 4 \( D + 1 \) < 0 . $
  Thus, with probability tending to one, the sampled tuple is admissible and has fewer than $delta t^2 \/
    2$ cross pairs meeting in $X$.
  ===== 3.5 High concurrency: $R > q^(1 \/ 2 + kappa \/ 4)$. <high-concurrency-rq12kappa4.>
  Choose a projective point $p$ with $n_p = R$, and take all $R$ lines of $L$ through $p$ as the pencil.
    Its complement has size
  $ N = m - R gt.eq rho q \/ 2 $
  for sufficiently large $q$, by (39); no complement line passes through $p$.
    Sample the first list of $t$ lines uniformly without replacement from the pencil,
    and independently sample the second list in the same way from the complement.
  Any cross intersection lies off $p$. At a cross intersection $x in X$,
    exactly one pencil line passes through $x$, and the number of cross pairs meeting there is the number of
    complement lines through $x$, namely $n_x - 1$. Thus at most $E_L$ of all $R
    N$ population cross pairs meet in $X$. Their fraction is at most
  #[#set math.equation(numbering: n => "(45)")
   $ frac(E_L, R N) = O #scale(x: 120%, y: 120%)[\(] q^(epsilon.alt - kappa \/ 4) #scale(x: 120%, y: 120%)[\)] =
     O \( q^(- 3 kappa \/ 20) \) = o \( 1 \) . $ <eq:lc-high-pair-fraction>]
  As before, expectation and Markov’s inequality show that fewer than $delta t^2 \/
    2$ sampled cross pairs meet in $X$, with probability tending to one.
  For a fixed complement line, at most one pencil line meets it at infinity when $p$ is finite.
    When $p$ is at infinity, the pencil lines have direction $p$ and every complement line has a different
    direction, so all cross intersections are finite. The probability of any infinite cross intersection is
    therefore at most $t^2 \/ R$. Two equal cross intersections must use the same pencil line,
    since distinct pencil lines meet only at $p$, which lies on no complement line.
    Given two complement lines, their projective intersection determines at most one affine pencil line,
    namely its join with $p$. If this join is the line at infinity, there is no affine candidate.
    Conditioning on the second list and taking a union bound over its pairs shows that the probability of a
    collision is $O \( t^3 \/ R \)$. The total probability of a failure of finiteness or distinctness is therefore
  #[#set math.equation(numbering: n => "(46)")
   $ O (frac(t^2 + t^3, R)) = O #scale(x: 120%, y: 120%)[\(] \( log q \)^3 q^(- 1 \/ 2 - kappa \/ 4)
     #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <eq:lc-high-degeneracy>]
  Fix $F in cal(F)$, and consider the event that $F$ is not a tuple line but contains more than $H_0$ distinct
    finite cross intersections. The same greedy argument gives $h$ cross pairs with disjoint positions.
    There are at most $D N$ population cross pairs, with neither line equal to $F$,
    whose intersection lies in $F$: a complement line distinct from $F$ meets $F$ in at most $D$ points,
    all off $p$, and each such point determines at most one pencil line.
    The two lists are sampled independently, so the probability of this occupancy violation for a fixed shape is at most
  #[#set math.equation(numbering: n => "(47)")
   $ frac(t^(2 h) \( D N \)^h, \( R \)_h \( N \)_h) = O_(D \, h) ((t^2 / R)^h) . $ <eq:lc-high-shape>]
  After summing over $cal(F)$, the bound becomes
  $ O #scale(x: 120%, y: 120%)[\(] \( log q \)^(2 h) q^(D - h \( 1 \/ 2 + kappa \/ 4 \))
    #scale(x: 120%, y: 120%)[\)] = o \( 1 \) \, $
  since
  $ D - h \( 1 \/ 2 + kappa \/ 4 \) < D - 5 \( D + 1 \) < 0 . $
  The sampled tuple is consequently admissible and has fewer than $delta t^2 \/ 2$ cross pairs meeting in $X$,
    with probability tending to one in this regime as well.
  ===== 3.6 The contradiction and the order of choices. <the-contradiction-and-the-order-of-choices.>
  All sampling estimates above are uniform over line sets satisfying (39) and the appropriate bound on $R$.
    In either regime, for every sufficiently large $q$ there is therefore an admissible tuple from the fixed line
    set $L$ with
  $ \| X ∩ P_0 \| < delta t^2 \/ 2 . $
  No line of $L$ actually occurred as a listed deletion shape.
    Hence ignoring exact occurrences of its tuple lines changes none of the deletions in the fixed realization,
    and the tuple’s count $Y_0$ is exactly $\| X ∩ P_0 \|$. This contradicts (37).
  In particular, the cover and the tuple are allowed to depend on the realized deletions:
    the event (37) was established simultaneously for every admissible tuple before fixing the realization.
    Sampling from $L$ is used only to prove the existence of a tuple inside that fixed realization.
    No concentration estimate is conditioned on the choice of the cover.
    The contradiction proves the second conclusion, and finishes the proof. ◻
]

== 4 Selecting compatible translates <sec:selection>

The deletion estimates require independent random choices,
  while intersection of the exceptional edges requires geometric compatibility.
  We separate these tasks by sampling several independent translates of each bounded configuration and then
  selecting one from each pool. The theorem below supplies the selection step.
  Its input consists of finite point sets $W_i$ and sets $D_i$ of forbidden join directions;
  its output avoids every forbidden join between different selected sets.
  Because a direction is a linear subspace containing zero,
  the condition also rules out a common point between two selected configurations whenever at least one of their
  direction sets is nonempty.

#thm([Theorem 4.1.])[
  (Compatible translates from independent pools).  #emph[For every positive integer $D$ there is a positive
    integer $K = K \( D \)$ with the following property. Let $q$ tend to infinity through prime powers.
    For each $q$, let $n lt.eq D q$, and for $1 lt.eq i lt.eq
    n$ let $W_i subset.eq bb(F)_q^2$ and let $D_i$ be a set of directions, with
$ \| W_i \| lt.eq D \, wide \| D_i \| lt.eq D . $

 Assume that each direction belongs to $D_i$ for at most $D$ indices $i$.
   For distinct indices $i \, j$, declare the translates $b + W_i$ and $b' +
   W_j$ to conflict if there are $u in W_i$, $v in W_j$, and $d in D_i union D_j$ such that
$ \( b + u \) - \( b' + v \) in d . $

 For each $i$, draw $K$ independent uniform shifts $b_(i \, 1) \, dots.h \, b_(i \, K) in bb(F)_q^2$,
   independently for all indices. With probability tending to one, one can choose $k_i in { 1 \, dots.h \,
   K }$ for every $i$ so that the translates $b_(i \, k_i) + W_i$ have no conflicts.
   The convergence is uniform over all data satisfying the stated bounds.]
] <thm:selection>

To prove the theorem, make each candidate a vertex of a graph and join candidates from different pools when they
  conflict. We seek an independent set containing one vertex from each pool, called an independent transversal.
  Its nonexistence has a small domination certificate. We first prove the form of that assertion we need,
  then show that the independent shifts make every such certificate unlikely.
  The certificate argument is a weaker form of Haxell’s independent-transversal domination
  theorem #cite(label("Haxell2001")), whose method originates in #cite(label("Haxell1995")). We include its proof.
  Haxell’s theorem uses total domination, which also requires neighbors for the vertices of the dominating set.
  Here we use the following weaker convention. For a graph $G$ and a set $S$ of its vertices,
  we say that $T subset.eq S$ #emph[dominates $S$] if every vertex of $S \\ T$ has a neighbor in $T$.
  No condition is imposed on the vertices of $T$ themselves.

#thm([Lemma 4.2.])[
  (A domination certificate).  #emph[Let a finite simple graph have a vertex partition into nonempty parts $A_1 \,
    dots.h \, A_n$. If there is no independent set containing one vertex from each part,
    then there are a nonempty index set $I$ and a set
$ T subset.eq union.big_(i in I) A_i \, wide \| T \| lt.eq 2 \( \| I \| - 1 \) \, $

 such that $T$ dominates $union.big_(i in I) A_i$.]
] <sel-domination>

#proof[
  We grow a set of vertices with small size compared with the number of parts it reaches.
    Whenever it does not yet dominate those parts, we use an undominated vertex to reach another part.
    A minimality condition on the transversals prevents this growth from stopping without the required domination
    certificate.
  Choose an inclusion-minimal nonempty subfamily of parts with no independent transversal,
    and distinguish one part $A_(*)$ of this subfamily. Let $cal(U)$ be the family of independent transversals of
    all its other parts. Minimality makes $cal(U)$ nonempty. The deficient subfamily has at least two parts,
    since every part is nonempty.
  Choose any $x_1 in A_(*)$. Among $U in cal(U)$, minimize $\| N \( x_1 \) ∩ U \|$,
    where $N \( x \)$ denotes the neighborhood of $x$ in $G$. Fix a minimizer and write $Y_1 = N \( x_1 \) ∩ U$.
    This set is nonempty: otherwise adjoining $x_1$ would give an independent transversal of the deficient subfamily.
  Inductively, suppose that vertices $x_1 \, dots.h \, x_j$ and sets $Y_1 \, dots.h \,
    Y_j$ have been fixed with the following properties:
  + The sets $Y_a$ are nonempty and pairwise disjoint, and some $U in cal(U)$ jointly realizes all the equalities
    $ N \( x_a \) ∩ U = Y_a wide \( 1 lt.eq a lt.eq j \) . $
  + At stage $a$, the size $\| Y_a \|$ was minimized over all $U in
    cal(U)$ satisfying the already fixed equalities for indices smaller than $a$.
  + Each $x_a$ lies either in $A_(*)$ or in a part represented by a vertex of some earlier $Y_b$, with $b < a$.
  Let $Y = union.big_(a = 1)^j Y_a$, let $I$ consist of the distinguished part and all parts represented in $Y$, and put
  $ T = { x_1 \, dots.h \, x_j } union Y . $
  By joint realization, the vertices of $Y$ occupy distinct parts, none of them $A_(*)$.
    Thus $\| I \| = \| Y \| + 1$, while nonemptiness of the $Y_a$ gives $j lt.eq \| Y \|$.
    The third invariant shows that $T$ lies in the union of the parts indexed by $I$, and
  $ \| T \| lt.eq j + \| Y \| lt.eq 2 \| Y \| = 2 \( \| I \| - 1 \) . $
  If $T$ dominates this union, we have the required certificate.
  Otherwise, choose a vertex $x_(j + 1)$ in that union, outside $T$, with no neighbor in $T$.
    Among the transversals realizing all the current equalities,
    choose $U$ minimizing $\| N \( x_(j + 1) \) ∩ U \|$, and set
  $ Y_(j + 1) = N \( x_(j + 1) \) ∩ U . $
  This set avoids all the previous $Y_a$, because $x_(j + 1)$ has no neighbor in $T$. We claim it is nonempty.
  If it were empty and $x_(j + 1) in A_(*)$, then $U union {
    x_(j + 1) }$ would be an independent transversal of the deficient subfamily.
    Otherwise, the part of $x_(j + 1)$ contains a unique vertex $y$ of $Y$, say $y in Y_b$.
    The transversal $U$ uses $y$ in that part, so $x_(j + 1) in.not U$. Replace $y$ by $x_(j + 1)$ to form
  $ U' = \( U \\ { y } \) union { x_(j + 1) } . $
  Since $N \( x_(j + 1) \) ∩ U = diameter$, this is again an independent transversal of the nondistinguished
    parts. For every $a < b$, the vertex $y$ does not belong to $Y_a$,
    and the new vertex is not adjacent to $x_a$. Consequently the exact earlier equalities are preserved:
  $ N \( x_a \) ∩ U' = Y_a wide \( a < b \) . $
  For $a = b$, the replacement removes the neighbor $y$ and adds no neighbor, so
  $ \| N \( x_b \) ∩ U' \| = \| Y_b \| - 1 . $
  This contradicts the minimum imposed at stage $b$. Notice that the contradiction uses only the equalities
    preceding stage $b$; preservation of later equalities is not required.
  Thus $Y_(j + 1)$ is nonempty and all the induction invariants continue to hold.
    Each continuation adds vertices in previously unrepresented parts to $Y$,
    whereas all of $Y$ lies in one transversal of the fixed nondistinguished subfamily.
    There can be only finitely many continuations. The process must therefore stop with a dominating set $T$,
    proving the lemma. ◻
]

#proof[
  The case $n = 0$ is immediate, so suppose $n gt.eq 1$. Fix $D$ and, for the moment, a constant integer $K gt.eq
    6$. We will choose $K$ sufficiently large in terms of $D$ at the end.
  Form a graph whose vertices are the candidate positions $\( i \, k \)$, partitioned into the $n$ pools.
    Put an edge between candidates in different pools precisely when their translates conflict.
    Candidate positions are distinct vertices even when their sampled shifts happen to coincide.
    An independent transversal in this graph is exactly a selection as in the theorem.
  By Lemma 11, it suffices to show that, with probability tending to one, there are no nonempty index sets $I$,
    with $\| I \| = m$, and sets $T$ of at most $2 m$ candidate positions in those pools that dominate their
    union. We use the slightly weaker bound $2 m$ to simplify the counting.
    Throughout the probability estimates, $I$ and $T$ are fixed sets of indices before any shifts are exposed.
  The proof splits according to $m$, the number of pools in the certificate.
    When $m$ is small, the forbidden lines associated with $T$ occupy only a small part of each candidate’s
    possible shifts. When $m$ is proportional to $q$, that direct bound is insufficient.
    Instead, we expose $T$ in a bounded number of chunks and prove that a positive average proportion of shifts
    remains feasible. Crucially, this proportion will depend only on $D$,
    so we may subsequently choose $K$ large enough that the unused candidates defeat all certificates.
  ===== 4.1 Forbidden equations and counting possible certificates. <forbidden-equations-and-counting-possible-certificates.>
  For every direction $d$ in use, fix a nonzero linear functional $pi_d : bb(F)_q^2 arrow.r
    bb(F)_q$ whose kernel is $d$. After exposing the shifts of the candidates $e in T$,
    call a shift $b in bb(F)_q^2$ #emph[feasible for target $i$] if, for every such $e$,
    with source-pool index $j$, it avoids every equation
  #[#set math.equation(numbering: n => "(48)")
   $ pi_d \( b \) = pi_d \( b_e \) + pi_d \( v - u \) \, wide u in W_i \, quad v in W_j \, quad
     d in D_i union D_j . $ <sel-forbidden>]
  We impose these prohibitions even when $i = j$. This only makes feasibility more restrictive.
    A feasible candidate outside $T$ has no neighbor in $T$, so its existence prevents domination.
  Set
  #[#set math.equation(numbering: n => "(49)")
   $ C = 2 D^3 \, wide c_1 = frac(1, 4 C) \, wide alpha = frac(1, 2 C) . $ <sel-constants>]
  For one target $i$ and one exposed candidate $e$, there are at most $C$ equations in (48).
    This remains true if the two lists $D_i$ and $D_j$ are counted separately, retaining duplicate directions.
    Each equation excludes one affine line, containing exactly $q$ shifts.
  The number of choices of $I$ is at most
  $ binom(n, m) lt.eq (frac(e D q, m))^m . $
  There is an absolute constant $C_(*) > 0$ such that, for $K gt.eq 6$,
    the number of candidate-index sets $T$ in these pools with $\| T \| lt.eq 2 m$ is at most
  #[#set math.equation(numbering: n => "(50)")
   $ sum_(t = 0)^(2 m) binom(K m, t) lt.eq \( C_(*) K^2 \)^m . $ <sel-certificate-count>]
  For example, the usual bound $sum_(t = 0)^r binom(N, t) lt.eq \( e N \/ r \)^r$ for $1 lt.eq r lt.eq
    N \/ 2$ applies with $N = K m$ and $r = 2 m$.
  ===== 4.2 The range $1 lt.eq m lt.eq c_1 q$. <the-range-1le-mle-c_1q.>
  Condition on all the exposed shifts in $T$. A fresh uniform shift for any target $i in
    I$ is infeasible with probability at most
  $ frac(C \| T \|, q) lt.eq frac(2 C m, q) lt.eq 1 / 2 . $
  At least $\( K - 2 \) m$ candidate positions in the target pools remain unexposed.
    Their shifts are conditionally independent and uniform. Thus the probability that $T$ dominates,
    for this fixed $I \, T$, is at most
  #[#set math.equation(numbering: n => "(51)")
   $ (frac(2 C m, q))^(\( K - 2 \) m) . $ <sel-small-probability>]
  Combining this with the counts of $I$ and $T$, the probability of a dominating certificate of size parameter $m$
    is at most
  #[#set math.equation(numbering: n => "(52)")
   $ [2 C e D C_(*) K^2 (frac(2 C m, q))^(K - 3)]^m . $ <sel-small-sum>]
  Choose $K$ large enough that
  #[#set math.equation(numbering: n => "(53)")
   $ 2 C e D C_(*) K^2 thin 2^(- \( K - 3 \)) lt.eq 1 / 2 . $ <sel-small-K>]
  Then the bracket in (52) is at most $1 \/ 2$ throughout this range,
    and tends to zero for every fixed positive $m$. Summing over $m$ gives $o \( 1 \)$:
    for a fixed cutoff, the finite initial sum tends to zero, while the remaining terms are bounded by a geometric tail.
  ===== 4.3 A feasible-density estimate for $m > c_1 q$. <a-feasible-density-estimate-for-mc_1q.>
  We prove that there is a constant $delta_1 > 0$, depending only on $D$ and not on $K$,
    such that for every fixed $I \, T$ in this range,
  #[#set math.equation(numbering: n => "(54)")
   $ Pr #h(-0.16667em) [sum_(i in I) \| U_i^(upright("fin")) \| < delta_1 m q^2] lt.eq
     exp #scale(x: 120%, y: 120%)[\(] - Omega_D \( q log q \) #scale(x: 120%, y: 120%)[\)] . $ <sel-density-target>]
  Here $U_i^(upright("fin"))$ is the set of shifts feasible for target $i$ after all candidates in $T$ have been
    exposed. The estimate is uniform in $I \, T$ and the configuration data.
    The lower cutoff on $q$ may depend on the fixed value of $K$.
  Expose the candidate positions of $T$ in a fixed order, divided into consecutive chunks of size at most $floor.l
    alpha q floor.r$, with all but the last having that size.
    For sufficiently large $q$, $floor.l alpha q floor.r gt.eq alpha q \/ 2$.
    Since $\| T \| lt.eq 2 m lt.eq 2 D q$, the number of chunks is at most
  #[#set math.equation(numbering: n => "(55)")
   $ J_0 = ⌈frac(4 D, alpha) + 1⌉ . $ <sel-chunk-count>]
  In particular, this bound does not involve $K$. If $T$ is empty,
    the desired feasible-density estimate holds deterministically; otherwise there is at least one chunk.
  At the start of a chunk, condition on all shifts previously exposed.
    Let $U_i$ be the set of shifts still feasible for target $i$, and write
  $ M = sum_(i in I) \| U_i \| . $
  For the analysis of this chunk we keep all these sets frozen at their start values.
    They are now deterministic, while the shifts belonging to the new chunk are independent uniform vectors.
  For an entry $e$ of the chunk, with source-pool index $j$, define $Z_e$ by summing,
    over all equations (48) associated with $i in I$ and $e$,
    the number of shifts $b in U_i$ satisfying that equation.
    Count the $D_i$ and $D_j$ lists separately, including duplicates.
    A shift deleted more than once is therefore counted more than once,
    which is harmless for an upper bound on loss. Each line contains at most $q$ shifts,
    and each of its right-hand sides is uniform in $bb(F)_q$. Consequently,
  #[#set math.equation(numbering: n => "(56)")
   $ 0 lt.eq Z_e lt.eq C m q \, wide bb(E) Z_e lt.eq frac(C M, q) . $ <sel-Z-basic>]
  All expectations and variances in the following chunk calculation are conditional on the fixed past.
  ===== 4.4 The terms whose directions belong to the target. <the-terms-whose-directions-belong-to-the-target.>
  The expectation bound alone does not control the loss in a chunk.
    We estimate its fluctuations by separating the two direction lists in each forbidden equation.
    Bounded reuse of target directions handles one list; the affine second moment will handle the source list. Write
  $ Z_e = Z_e^(\( 1 \)) + Z_e^(\( 2 \)) \, $
  where $Z_e^(\( 1 \))$ uses the list $D_i$ in each target, and $Z_e^(\( 2 \))$ uses the list $D_j$ of the source.
    Group the terms of $Z_e^(\( 1 \))$ by direction. The group for $d$ is a function only of $pi_d \( b_e \)$.
    For distinct directions $d \, d'$, the functionals $pi_d \, pi_(d')$ are linearly independent, so
  $ b_e mapsto #scale(x: 120%, y: 120%)[\(] pi_d \( b_e \) \, pi_(d') \( b_e \) #scale(x: 120%, y: 120%)[\)] $
  is a bijection from $bb(F)_q^2$ to itself. The two coordinates are therefore independent and uniform.
    The direction groups are pairwise independent, which suffices for adding their variances.
  There are at most $D m$ such groups. Each direction belongs to at most $D$ target direction sets;
    for each associated target-source pair there are at most $D^2$ choices of $\( u \, v \)$.
    Thus every group is bounded by $D^3 q$, and
  #[#set math.equation(numbering: n => "(57)")
   $ "Var" \( Z_e^(\( 1 \)) \) lt.eq D^7 m q^2 . $ <sel-first-variance>]
  ===== 4.5 The terms whose directions belong to the source. <the-terms-whose-directions-belong-to-the-source.>
  For each target $i$ and each direction $d$, define the variance of its parallel line slices by
  #[#set math.equation(numbering: n => "(58)")
   $ V_(i \, d) = 1 / q sum_(ell parallel d) (\| U_i ∩ ell \| - frac(\| U_i \|, q))^2 \, $ <sel-slice-variance>]
  where the sum is over the $q$ affine lines of direction $d$. These variances obey the exact identity
  #[#set math.equation(numbering: n => "(59)")
   $ sum_d V_(i \, d) = \| U_i \| - frac(\| U_i \|^2, q^2) lt.eq \| U_i \| lt.eq q^2 \, $ <sel-energy>]
  where the sum runs over all $q + 1$ directions. This is precisely the normalized affine second-moment identity
    in #cite(label("OpenAI2026Balanced")) Lemma A.1, applied to $U_i subset.eq bb(F)_q^2$.
    That identity holds for every subset of every finite affine plane; it has no randomness, characteristic,
    or subfield hypothesis. Thus it applies after conditioning on any history of earlier chunks.
    This is the reason we can control all source directions even when the feasible sets $U_i$ have complicated shapes.
  Every individual summand of $Z_e^(\( 2 \))$ associated with $i \, d \, u \,
    v$ is a uniformly sampled line-slice count, with its slice index translated by a fixed offset.
    Its variance is therefore $V_(i \, d)$. There are at most $D^3 m$ summands,
    and each pair $\( i \, d \)$ is repeated at most $D^2$ times.
    Cauchy–Schwarz applied to their centered sum, without any independence assumption, gives
  #[#set math.equation(numbering: n => "(60)")
   $ "Var" \( Z_e^(\( 2 \)) \) lt.eq D^5 m A_e \, wide A_e :=
     sum_(i in I) sum_(d in D_j) V_(i \, d) . $ <sel-second-variance>]
  Each source pool contributes at most $K$ entries to the chunk,
    and each direction belongs to at most $D$ source direction sets. Consequently, by (59),
  #[#set math.equation(numbering: n => "(61)")
   $ sum_(e upright(" in the chunk")) A_e lt.eq K D sum_(i in I) sum_d V_(i \, d) lt.eq
     K D m q^2 . $ <sel-exception-energy>]
  Call an entry #emph[regular] if $A_e lt.eq m q^(3 \/ 2)$. There are at most $K D sqrt(q)$ irregular entries.
    For a regular entry, (57), (60), and $"Var" \( X + Y \) lt.eq 2 "Var" \( X \) + 2 "Var" \( Y \)$ give
  #[#set math.equation(numbering: n => "(62)")
   $ "Var" \( Z_e \) lt.eq 2 D^7 m q^2 + 2 D^5 m^2 q^(3 \/ 2) . $ <sel-regular-variance>]
  For a fixed constant $gamma > 0$, Chebyshev’s inequality and (56) therefore imply
  #[#set math.equation(numbering: n => "(63)")
   $ Pr #h(-0.16667em) [Z_e > frac(C M, q) + gamma m q] & lt.eq frac(2 D^7, gamma^2 m) + frac(2 D^5, gamma^2 sqrt(q))\
 & lt.eq B_(D \, gamma) q^(- 1 \/ 2) wide upright("for regular ") e \, $ <sel-regular-tail>]
  where $B_(D \, gamma)$ is independent of $K$. In the last step we used $m > c_1 q$.
  ===== 4.6 Conditional independence and loss over one chunk. <conditional-independence-and-loss-over-one-chunk.>
  The preceding variance bounds show that each regular entry has a small chance of removing far more than its
    expected share. We now use independence within the chunk to show that few entries do so,
    and convert that statement into a deterministic bound on the total remaining feasible set.
  The regularity of an entry is determined by the frozen sets $U_i$ and its fixed source-pool index.
    In particular, it does not depend on its fresh shift $b_e$.
    After conditioning on the past, the collection of regular entries is fixed,
    and their variables $Z_e$ are independent functions of independent shifts.
    Their common threshold in (63) is also fixed under this conditioning.
  A union bound over subsets of regular entries, using the chunk size bound and (63),
    shows that the probability of at least $gamma q$ threshold exceedances is at most
  #[#set math.equation(numbering: n => "(64)")
   $ 2^(ceil.l alpha q ceil.r) (B_(D \, gamma) q^(- 1 \/ 2))^(ceil.l gamma q ceil.r) lt.eq
     exp \( - c_(D \, gamma) q log q \) $ <sel-chunk-tail>]
  for all sufficiently large $q$, with $c_(D \, gamma) > 0$ independent of $K$.
    If there are fewer than $ceil.l gamma q ceil.r$ regular entries,
    the event in question is empty and the bound remains valid.
  For each fixed $K$, we may also take $q$ sufficiently large that
  #[#set math.equation(numbering: n => "(65)")
   $ K D sqrt(q) lt.eq gamma q . $ <sel-K-cutoff>]
  Except on the event in (64), all but at most $2 gamma q$ entries are regular and below the threshold:
    the exceptions include all irregular entries. The actual loss of feasible shifts within the chunk is at most
    $sum_e Z_e$, because these counts used the larger feasible sets at the start of the chunk.
    Bounding each exceptional entry by $C m q$ and all other entries by the threshold gives,
    for the end-of-chunk value $M'$, the deterministic inequality
  #[#set math.equation(numbering: n => "(66)")
   $ M' & gt.eq M - C alpha M - alpha gamma m q^2 - 2 C gamma m q^2\
 & = \( 1 - C alpha \) M - \( alpha + 2 C \) gamma m q^2\
 & = 1 / 2 M - \( alpha + 2 C \) gamma m q^2 . $ <sel-chunk-recurrence>]
  Choose $gamma > 0$, depending only on $D$, so small that
  #[#set math.equation(numbering: n => "(67)")
   $ 2 \( alpha + 2 C \) gamma lt.eq 2^(- J_0 - 1) \, wide delta_1 := 2^(- J_0 - 1) . $ <sel-gamma-choice>]
  At the beginning, before exposing $T$, every shift is feasible, so $M = m q^2$.
    If all $J lt.eq J_0$ chunks satisfy (66), iteration gives
  $ frac(M_(upright("fin")), m q^2) & gt.eq 2^(- J) - \( alpha + 2 C \) gamma sum_(a = 0)^(J - 1) 2^(- a)\
 & gt.eq 2^(- J_0) - 2 \( alpha + 2 C \) gamma gt.eq delta_1 . $
  The conditional probability bound (64) holds for every possible past.
    Averaging over the past and taking a union bound over the at most $J_0$ chunks proves (54).
    The constants $J_0$, $gamma$, and $delta_1$ depend only on $D$.
    The dependence on $K$ in (65) affects only how large $q$ must be, not these constants.
  ===== 4.7 Unused candidates and the large-range union bound. <unused-candidates-and-the-large-range-union-bound.>
  We have established the required positive average feasible density with a failure probability of order
    $exp \( - Omega_D \( q log q \) \)$. There are only exponentially many candidate certificates,
    so this error can be summed over all of them. On the successful event,
    the unused candidates now supply the further exponential saving needed to rule out domination.
  Condition now on all the shifts belonging to $T$, and suppose the feasible-density event in (54) succeeds.
    Let $t_i$ be the number of exposed candidate positions from pool $i$.
    Every unused candidate from that pool remains independent and uniform,
    and is feasible with probability $\| U_i^(upright("fin")) \| \/ q^2$.
    The probability that none of the unused candidates in the target pools is feasible is therefore at most
  #[#set math.equation(numbering: n => "(68)")
   $ product_(i in I) (1 - frac(\| U_i^(upright("fin")) \|, q^2))^(K - t_i) & lt.eq
     exp #h(-0.16667em) (- sum_(i in I) \( K - t_i \) frac(\| U_i^(upright("fin")) \|, q^2))\
 & lt.eq exp #scale(x: 120%, y: 120%)[\(] - \( K delta_1 - 2 \) m #scale(x: 120%, y: 120%)[\)] .
   $ <sel-unused-candidates>]
  To obtain the last inequality, use
  $ sum_(i in I) frac(\| U_i^(upright("fin")) \|, q^2) gt.eq delta_1 m \, wide 0 lt.eq
    frac(\| U_i^(upright("fin")) \|, q^2) lt.eq 1 \, wide sum_(i in I) t_i = \| T \| lt.eq 2 m . $
  This argument also covers pools for which every candidate belongs to $T$; it does not assume $K -
    t_i$ is positive in every target pool.
  For $m > c_1 q$, the number of pairs $I \, T$ is at most $A_K^m$, where
  #[#set math.equation(numbering: n => "(69)")
   $ A_K = frac(e D, c_1) C_(*) K^2 . $ <sel-large-count>]
  For each fixed pair, domination can occur only if the feasible-density estimate fails or all unused candidates
    are infeasible despite its success. The sum of the first failure probabilities over all $m \, I \,
    T$ in the large range is bounded by
  $ exp #scale(x: 120%, y: 120%)[\(] O_(D \, K) \( q \) #scale(x: 120%, y: 120%)[\)] exp
    #scale(x: 120%, y: 120%)[\(] - Omega_D \( q log q \) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $
  Here the number of choices is at most $sum_(m lt.eq D q) A_K^m = exp \( O_(D \, K) \( q \) \)$, with $K$ fixed.
  Finally choose $K$ sufficiently large, still depending only on $D$, so that both (53) and
  #[#set math.equation(numbering: n => "(70)")
   $ A_K exp \( 2 - K delta_1 \) < 1 / 2 $ <sel-large-K>]
  hold. Such a choice exists because $delta_1 > 0$ does not depend on $K$,
    whereas $A_K$ grows only quadratically in $K$. By (68), the sum of the remaining failure probabilities is then
    at most
  $ sum_(m > c_1 q) (A_K exp \( 2 - K delta_1 \))^m lt.eq sum_(m > c_1 q) 2^(- m) = o \( 1 \) . $
  Together with the small-range estimate, this excludes all dominating certificates with probability tending to
    one. Lemma 11 therefore supplies an independent transversal, proving the theorem.
  The choices have been made in the order
  $ D med \; quad C \, c_1 \, alpha \, J_0 \, gamma \, delta_1 med \; quad K med \; quad q . $
  In particular, $K$ is fixed before taking $q$ to infinity,
    and all sufficiently-large-$q$ conditions may depend on that fixed $K$.
    Every estimate above is uniform over the configurations and direction sets subject to the bounds in the theorem. ◻
]

== 5 A configuration with two coordinatizations <sec:gadget>

We now use the deletion lemma to construct the exceptional configuration. We need two properties of the same set:
  many points on each undeleted line, and rigidity of its small line covers.
  A change of coordinates lets us obtain both. In the original coordinates we delete one line in every finite
  nonzero direction. After the change of coordinates, the deleted sets become curves,
  so the line-survival conclusion of Lemma 9 applies to every line.
  It will force every small mixed cover by lines and individual points to be a parallel class.

#thm([Lemma 5.1.])[
  #emph[For every sufficiently large prime $s equiv 2 med \( mod med 3 \)$,
    there is a set $Y subset.eq bb(F)_s^2$ with the following properties.
    For each $d in bb(F)_s^(*)$, there is an affine line $ell_d$ of slope $d$, and
$ Y = bb(F)_s^2 \\ union.big_(d in bb(F)_s^(*)) ell_d . $

 For each $d in bb(F)_s^(*)$, every line of slope $d$ other than $ell_d$ contains at least five points of $Y$. The map
$ f : bb(F)_s^2 arrow.r bb(F)_s^2 \, wide f \( x \, y \) = \( x^3 \, y \) \, $

 is a bijection, and every affine line contains at least $s \/ 8$ points of $f \( Y \)$.
   Moreover, if $a$ affine lines and $b$ individual points cover $f \( Y \)$, and
#[#set math.equation(numbering: n => "(71)")
 $ a + b / 2 lt.eq s \, $ <con-weighted-budget>]

 then $a = s$, $b = 0$, and the lines form a full parallel class.
   Consequently every such mixed cover has weighted cost at least $s$,
   and no cover of $f \( Y \)$ by at most $s$ lines contains two nonparallel lines.]
] <lem:gadget>

#proof[
  Let $s$ tend to infinity through primes congruent to $2 med \( mod med 3 \)$.
    Since $gcd \( 3 \, s - 1 \) = 1$, cubing permutes $bb(F)_s^(*)$ and fixes zero. Thus $f$ is bijective.
    It maps horizontal lines to horizontal lines and vertical lines to vertical lines.
    We first prove the two survival properties simultaneously with high probability,
    then use them to classify mixed covers satisfying (71).
  ===== 5.1 Survivors in the original coordinates. <survivors-in-the-original-coordinates.>
  Choose the lines $ell_d$, independently for the $s - 1$ values of $d$, uniformly within their parallel classes.
    Fix a line $ell$ of finite nonzero slope $d$, and temporarily ignore the choice $ell_d$.
    Each of the other $s - 2$ choices deletes a uniformly distributed point of $ell$.
    Let $Z_ell$ count the surviving points on $ell$. Its expectation is
  $ mu := bb(E) Z_ell = s \( 1 - 1 \/ s \)^(s - 2) . $
  Changing one of these choices changes the survivor count by at most two.
    Apply the independent-trial jump bound and bounded-drift concentration estimate of
    #cite(label("OpenAI2026Balanced")) Lemmas A.2–A.3 to the exposure martingale, with $T = s - 2$, $L = 2$,
    and $u = mu \/ 2$. The martingale has zero drift, and hence
  $ Pr \( Z_ell < mu \/ 2 \) lt.eq 2 exp (- frac(mu^2, 128 \( s - 2 \))) = exp \( - Omega \( s \) \) . $
  There are fewer than $s^2$ lines under consideration. A union bound, together with $mu \/ 2 gt.eq
    5$ for sufficiently large $s$, shows that all these counts are at least five with probability tending to one.
    If $ell eq.not ell_d$, reinstating the deletion by $ell_d$ changes no point on $ell$,
    since the two lines are parallel. Thus every required line in the original coordinates has at least five
    points of $Y$.
  ===== 5.2 Survivors and almost-pencil covers in the new coordinates. <survivors-and-almost-pencil-covers-in-the-new-coordinates.>
  In the new coordinates, the possible deletion shapes are
  $ F_(d \, z) = { \( x^3 \, d x + z \) : x in bb(F)_s } \, wide d in bb(F)_s^(*) \, quad z in bb(F)_s . $
  There are $s \( s - 1 \)$ such shapes, each of size $s$, and each of the $s -
    1$ independent trials chooses one of them. Every point is deleted by a specified trial with probability $1 \/
    s$, so its overall survival probability is the uniform value
  $ delta_s = \( 1 - 1 \/ s \)^(s - 1) gt.eq 1 / 4 $
  for all sufficiently large $s$.
  Each shape meets every affine line in at most three points.
    For a vertical line this follows from bijectivity of cubing;
    for a horizontal line it follows from $d eq.not 0$. For a line of finite nonzero slope $m$,
    the intersection is determined by
  $ d x + z = m x^3 + u \, $
  a nonzero polynomial equation of degree three. In particular, no shape is itself a line when $s > 5$.
    All the hypotheses of Lemma 9 hold with field size $s$, a fixed integer constant, for example $D = 3$,
    survival lower bound $delta = 1 \/ 4$, and $rho_0 = 1 \/ 100$.
    The exact-line occurrence probabilities are zero, and the subfield restriction is automatic for a prime field.
    With probability tending to one, every line consequently contains at least $s \/ 8$ points of $f \( Y \)$,
    and its almost-cover conclusion holds for $f \( Y \)$ as well.
    We now combine that conclusion with the lower bound on every line to replace an almost pencil by a complete one.
  ===== 5.3 From an almost pencil to a full parallel class. <from-an-almost-pencil-to-a-full-parallel-class.>
  Assume these events hold, and consider a cover satisfying (71).
    Repeated resources can be removed; alternatively, one may keep their original counts,
    since removal only reduces the budget. The line portion has at most $s$ distinct lines and leaves at most $b
    lt.eq 2 s$ points of $f \( Y \)$ uncovered. Lemma 9 supplies at least $\( 1 - rho_0 \)
    s$ distinct lines in this portion through a common projective point $p$.
    There are at most $rho_0 s$ other lines, and
  $ b lt.eq 2 \( s - a \) lt.eq 2 rho_0 s . $
  If an affine line through $p$ were absent from the cover,
    all the chosen lines through $p$ would cover at most one of its affine points.
    The other lines would cover at most $rho_0 s$ further points,
    and the individual point resources at most $2 rho_0 s$. Thus at most $1 +
    3 rho_0 s$ points of this missing line would be covered. For sufficiently large $s$, this contradicts
  $ s / 8 > 1 + 3 rho_0 s . $
  Every affine line through $p$ must therefore be present. A finite $p$ requires $s + 1$ lines,
    which is impossible. An infinite $p$ requires all $s$ lines in its parallel class, and then (71) forces $a =
    s$ and $b = 0$. This also rules out repetitions in a cover attaining the budget.
  The events used in the two coordinate systems hold simultaneously with probability tending to one.
    Consequently every sufficiently large prime $s equiv 2 med \( mod med 3 \)$ admits a successful configuration
    $Y$. A mixed cover of cost less than $s$ would satisfy (71) but not its necessary equality conclusion.
    The two stated consequences follow. ◻
]

There are arbitrarily large primes congruent to $2 med \( mod med 3 \)$.
  Indeed, if the list were finite and its product were $P$, the integer $3 P - 1 equiv
  2 med \( mod med 3 \)$ would have a prime factor congruent to $2 med \( mod med 3 \)$,
  and none of the primes dividing $P$ could divide it. Fix any sufficiently large prime $s equiv
  2 med \( mod med 3 \)$, and choose $Y$ and the omitted lines from Lemma 12.
  These data remain fixed for the rest of the proof.

== 6 Ambient placement <sec:placement>

We will place copies of $Y$ in a larger affine plane, assign each copy the directions in which its labels will
  change, and delete the ambient lines of those directions that meet it. The placement must meet two requirements.
  Joins between different copies must avoid their changed directions,
  while the undeleted points must retain the pencil and line-survival properties of Lemma 9.
  We first specify the copies and direction sets, then prove the deletion estimates for independent pools of
  translates, and finally select one compatible translate from each pool.

=== 6.1 Fields, copies, and direction sets <fields-copies-and-direction-sets>

Let $n gt.eq 3$ be odd, and put $q = s^n$. We identify $bb(F)_s$ with the prime subfield of $bb(F)_q$.
  If $E$ is a subfield, then $\| E \| = s^a$, where $a = \[ E : bb(F)_s \]$,
  and multiplication of vector-space bases gives

$ n = a \[ bb(F)_q : E \] . $

For a proper subfield, the index $\[ bb(F)_q : E \]$ is an odd integer larger than one, so it is at least three.
  Consequently

$ \| E \| = s^a lt.eq s^(n \/ 3) = q^(1 \/ 3) wide upright("for every proper subfield ") E . $

Thus Theorem 3 and Lemma 9 apply along this sequence of ambient fields.
  In this section all constants may depend on the already fixed $s$ and $Y$, but not on $n$.

The odd-degree condition has now supplied the required subfield bound.
  It remains to assign every ambient direction to at least one copy, with bounded overlap between assignments.
  Identify the ambient directions with $bb(P)^1 \( bb(F)_q \) = bb(F)_q union { oo }$, using slope.
  Choose a set $Lambda$ of representatives of $bb(F)_q^(*) \/ bb(F)_s^(*)$, with $1 in Lambda$.
  There will be one configuration group for each $lambda in Lambda$,
  together with one further group denoted by $*$. Write

$ cal(I) = Lambda union.sq { * } \, wide N_q = \| cal(I) \| = frac(q - 1, s - 1) + 1 . $

Each index $i in cal(I)$ will specify a pool of translates of one configuration.
  We call this pool a group and will choose one translate from each group.

For $lambda in Lambda$, define

$ M_lambda \( x \, y \) = \( x \, lambda y \) \, wide S_lambda = lambda bb(F)_s^(*) \, wide A_lambda = { 0 \, oo } . $

Choose distinct $u \, v in bb(F)_s^(*)$ and define

$ M_(*) = mat(delim: "(", 1, 1; u, v) \, wide S_(*) = \( bb(F)_s union { oo } \) \\ { u \, v } \, wide A_(*) =
  { u \, v } . $

All these linear maps are invertible. For $M_(*)$, the image of a finite slope $t$ is

$ frac(u + v t, 1 + t) \, $

where a zero denominator gives the infinite direction. Its images of the horizontal and vertical directions are
  $u$ and $v$. The induced projective bijection therefore maps the $s -
  1$ finite nonzero subfield slopes precisely to $S_(*)$. The same statement for $M_lambda$ follows from the slope
  map $t mapsto lambda t$.

For each $i in cal(I)$, put

$ W_i = M_i \( bb(F)_s^2 \) . $

The directions of joins of distinct points of $W_i$ form exactly $S_i union A_i$.
  Each set $S_i$ has size $s - 1$, and $A_i$ consists of the two images of the coordinate axes.
  The cosets $S_lambda$ partition all nonzero finite ambient slopes. The extra set $S_(*)$ contains $0$ and $oo$.
  Hence every ambient direction belongs to at least one and at most two sets $S_i$.
  More precisely, the directions belonging to two sets are

#[#set math.equation(numbering: n => "(72)")
 $ S_1 ∩ S_(*) = bb(F)_s^(*) \\ { u \, v } \, $ <con-double-directions>]

and the two groups involved are always $1$ and $*$.

The sets $S_i$ are the directions whose labels will change,
  and $A_i$ are the images of the two axis directions preserved by $f$.
  For compatibility between copies we use the slightly larger direction sets

$ D_i = cases(delim: "{", S_i union A_i \, & i in { 1 \, * } \,, S_i \, & i in.not { 1 \, * } .) $

In particular,

#[#set math.equation(numbering: n => "(73)")
 $ D_1 = D_(*) = bb(P)^1 \( bb(F)_s \) \, $ <con-conflict-directions>]

whereas the remaining $D_i$ are the nonidentity multiplicative cosets of $bb(F)_s^(*)$.
  Every direction occurs in at most two sets $D_i$. Since $\| W_i \| = s^2$, $\| D_i \| lt.eq s + 1$, and $N_q =
  O_s \( q \)$, a fixed constant depending only on $s$ satisfies all size and multiplicity assumptions of
  Theorem 10. In a conflict-free selection, including the axes in both $D_1$ and $D_(*)$ ensures that an axis line
  meeting one of these two selected copies cannot also meet the other.
  This will enter the weighted cover argument for the two groups sharing a direction in (72).

=== 6.2 Independent candidate pools <independent-candidate-pools>

Let $K$ be a fixed pool size supplied by Theorem 10. For each $i in cal(I)$,
  choose independent uniform shifts $b_(i \, 1) \, dots.h \, b_(i \, K) in bb(F)_q^2$,
  independently between groups, and write

$ P_(i \, k) = b_(i \, k) + W_i \, wide Y_(i \, k) = b_(i \, k) + M_i Y . $

Associate to this candidate the following set of ambient deletion lines:

$ cal(B)_(i \, k) = { ell : "dir" \( ell \) in S_i \, med ell ∩ Y_(i \, k) eq.not diameter } . $

#thm([Lemma 6.1.])[
  #emph[For every candidate and every $d in S_i$, exactly $s - 1$ lines of $cal(B)_(i \, k)$ have direction $d$.
    Each of these lines contains at least five points of $Y_(i \, k)$.
    Consequently $\| cal(B)_(i \, k) \| = \( s - 1 \)^2$.]
] <con-deletion-count>

#proof[
  Undo the translation and apply $M_i^(- 1)$. An ambient line in the given direction meeting $P_(i \, k)$ becomes
    a line through a point of $bb(F)_s^2$ in a finite nonzero subfield direction.
    Its intersection with $bb(F)_s^2$ is the corresponding subfield line.
    The $s$ lines in that subfield parallel class extend to distinct parallel ambient lines.
    Exactly one is the omitted line in the definition of $Y$; the other $s -
    1$ each contain at least five points of $Y$, by Lemma 12.
    These are precisely the lines meeting the candidate’s retained configuration. ◻
]

Each candidate therefore prescribes a bounded list of deletion lines.
  We next apply the deletion lemma to all these independent lists at once.
  Besides the almost-pencil and line-survival conclusions, we need one bound on how many groups a line can meet
  along joins from an external point. All three properties will survive the subsequent selection of one candidate
  per group.

#thm([Lemma 6.2.])[
  #emph[There are constants $delta in \( 0 \, 1 \)$ and $rho = delta \/ 10$, independent of $n$,
    with the following properties with probability tending to one as $n$ tends to infinity through odd integers. Let
$ X_(upright("pool")) = bb(F)_q^2 \\ union.big_(i in cal(I)) union.big_(k = 1)^K
  union.big_(ell in cal(B)_(i \, k)) ell . $

]
  + #emph[Every cover of $X_(upright("pool"))$ by at most $q$ affine lines contains at least $\( 1 - rho \)
    q$ lines through a common projective point.]
  + #emph[For every affine line $ell$, if only exact occurrences of $ell$ are ignored in the pool deletions,
    at least $delta q \/ 2$ points of $ell$ remain.]
  + #emph[For every finite point $p$ and affine line $ell$ not through $p$,
    at most five groups $i$ have a candidate $P_(i \, k)$ containing a point $y in
    ell$ whose join to $p$ has direction in $S_i$.]
] <con-pool-properties>

#proof[
  We verify the hypotheses of Lemma 9 for the full pool, which gives the first two assertions.
    The third follows from a separate union bound over finite points and lines.
  Treat each candidate shift as one independent deletion trial, listing the lines of $cal(B)_(i \, k)$.
    There are $K N_q = O_(s \, K) \( q \)$ trials, each listing $m = \( s - 1 \)^2$ lines.
    We may take the shape family to be all $q \( q + 1 \)$ ambient affine lines.
    Each shape has size $q$, and two distinct line shapes intersect in at most one point.
    Thus the shape and trial bounds in Lemma 9 hold with a sufficiently large fixed integer $D$ depending only on
    $s \, K$.
  A candidate’s deleting set is a uniform translate of a fixed union of $m$ lines.
    Its deletion probability at a fixed point is independent of the point and is at most $m \/ q$.
    Independence of the shifts makes the overall survival probability $delta_q$ uniform on $bb(F)_q^2$.
    For sufficiently large $q$, $m \/ q lt.eq 1 \/ 2$ and $N_q lt.eq 2 q \/ \( s - 1 \)$.
    Using $log \( 1 - t \) gt.eq - 2 t$ for $0 lt.eq t lt.eq 1 \/ 2$, we obtain
  $ delta_q gt.eq \( 1 - m \/ q \)^(K N_q) gt.eq exp #scale(x: 120%, y: 120%)[\(] -
    2 K N_q m \/ q #scale(x: 120%, y: 120%)[\)] gt.eq exp #scale(x: 120%, y: 120%)[\(] -
    4 K \( s - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Fix $delta = exp \( - 4 K \( s - 1 \) \)$ and $rho = delta \/ 10$.
  For completeness, the exact-line hypothesis also has a uniform bound.
    A fixed line $ell$ of direction $d$ can occur only in candidates of groups with $d in S_i$,
    of which there are at most two. In each such candidate, there are $s - 1$ translated lines in this direction.
    Each fixed line has probability $1 \/ q$ of becoming $ell$ under the uniform shift.
    Therefore the sum, over all trials, of the probabilities of listing $ell$ is at most
  #[#set math.equation(numbering: n => "(74)")
   $ frac(2 K \( s - 1 \), q) . $ <con-exact-line-probability>]
  Increasing the fixed $D$ if necessary verifies every hypothesis of Lemma 9.
    Its conclusions give the first two properties.
  To prove the third, fix $p in.not ell$. For one candidate in group $i$, there are at most $s -
    1$ possible points $y in ell$ whose join to $p$ has a direction in $S_i$:
    each such direction contributes at most one intersection with $ell$.
    A fixed point belongs to a uniform translate of $W_i$ with probability $s^2 \/ q^2$.
    The probability for this candidate is thus at most
  $ frac(\( s - 1 \) s^2, q^2) . $
  If six distinct groups meet the condition, choose one witnessing candidate from each.
    There are at most $\( K N_q \)^6 = O_(s \, K) \( q^6 \)$ choices, and their shifts are independent.
    For the fixed pair $\( p \, ell \)$, the probability of six such groups is therefore
    $O_(s \, K) \( q^(- 6) \)$. There are at most $q^2 q \( q + 1 \) = O \( q^4 \)$ pairs $\( p \, ell \)$.
    The union bound gives a total failure probability $O_(s \, K) \( q^(- 2) \)$, proving the claim. ◻
]

=== 6.3 Selection and transfer of the deletion estimates <selection-and-transfer-of-the-deletion-estimates>

The estimates just proved concern independent candidates.
  We can now select compatible copies, using only inclusions to transfer the estimates to the selected deletion
  set. By Theorem 10, with probability tending to one the same pool admits one candidate per group with no
  conflicts. Intersect this event with those of Lemma 14. No independence between these events is needed.
  For every sufficiently large odd integer $n$, their intersection has positive probability,
  so fix a pool in the intersection and a conflict-free selection. Denote the selected sets and shifts by

$ P_i = b_i + M_i \( bb(F)_s^2 \) \, wide Y_i = b_i + M_i Y . $

Conflict avoidance gives the useful implication

#[#set math.equation(numbering: n => "(75)")
 $ i eq.not j \, quad "dir" \( ell \) in D_i \, quad ell ∩ P_i eq.not diameter quad arrow.r.double quad
   ell ∩ P_j = diameter . $ <con-separation>]

In particular the $P_i$ are pairwise disjoint: a common point would give a zero difference,
  which belongs to every conflict direction, and each $D_i$ is nonempty.

Let $B$ be the union, as a set of lines, of the deletion lines of the selected candidates, and put

#[#set math.equation(numbering: n => "(76)")
 $ X = bb(F)_q^2 \\ union.big_(ell in B) ell . $ <con-selected-survivors>]

Then $X supset.eq X_(upright("pool"))$. Moreover, if $ell in.not B$,
  every selected deletion line belongs to the pool list after all exact occurrences of $ell$ have been omitted.
  Hence $X$ contains the survivor set of that modified pool process. This inclusion is deterministic:
  it holds even if $ell$ occurs in an unselected candidate and even though the selected shifts depend on the whole
  pool. In particular,

#[#set math.equation(numbering: n => "(77)")
 $ ell in.not B quad arrow.r.double quad \| X ∩ ell \| gt.eq frac(delta q, 2) . $ <con-selected-line-bound>]

The third property of Lemma 14 also remains available for the selection,
  since it was established for all candidates in the pool.

This completes the placement: the copies are separated, covers of the ordinary survivors by at most $q$ lines
  contain an almost pencil, every undeleted line contains at least $delta q \/ 2$ survivors,
  and the bound of five groups remains valid. The order of choices is $s \, Y$,
  then the selection constant and $K$, then the deletion constants $D \, delta \, rho$, and finally $q = s^n$.
  Only after fixing these constants do we require $q = s^n$ to be sufficiently large.
  All further numerical inequalities below involve these fixed constants and can be imposed by enlarging this
  final threshold. Thus the construction is available for every sufficiently large odd integer $n$,
  with the same $s \, Y$; its pools and selected shifts may depend on $n$.
  The constant used for the ambient deletion lemma may depend on $K$,
  but it changes no hypothesis of the already applied selection theorem.
  A small value of $delta$ only increases the final lower threshold on $q$.

== 7 The hypergraph and its covering number <sec:hypergraph>

The placement supplies the ordinary points $X$ and the exceptional copies $Y_i$. We now turn them into edges.
  Ordinary edges retain all their affine-line labels. In an exceptional copy,
  the directions $S_i$ instead use line labels read from $f \( Y \)$;
  all remaining directions retain their ordinary labels. We will first check that every pair of edges still meets,
  then use the rigidity of $f \( Y \)$ to rule out covers of size $q$.

=== 7.1 Vertices, edges, and intersection <vertices-edges-and-intersection>

Set $r = q + 1$. There is one vertex part $V_d$ for each $d in bb(P)^1 \( bb(F)_q \)$.
  For every ambient affine line $ell$ of direction $d$, place an ordinary vertex $o_ell$ in $V_d$.
  If $d in S_i$, let $t_i \( d \) in bb(F)_s^(*)$ be the unique subfield direction whose image under $M_i$ is $d$.
  For each of the $s$ subfield affine lines $L$ of direction $t_i \( d \)$,
  place a special vertex $v_(i \, d \, L)$ in $V_d$. These subfield lines are read in the new coordinates used for
  $f \( Y \)$. All vertices are formal labels, tagged to be distinct between parts,
  between ordinary and special types, and between different groups.
  In particular each $V_d$ is finite, and the parts are pairwise disjoint.

Write $ell_d \( z \)$ for the ambient line of direction $d$ through $z$,
  and $L_t \( w \)$ for the subfield line of direction $t$ through $w in bb(F)_s^2$.
  Each $x in X$ defines the ordinary edge

$ e_x = { o_(ell_d \( x \)) : d in bb(P)^1 \( bb(F)_q \) } . $

For each $i in cal(I)$ and $w in Y$, put $y_(i \, w) = b_i + M_i w$ and define an exceptional edge by selecting,
  in part $V_d$, the vertex

#[#set math.equation(numbering: n => "(78)")
 $
   cases(delim: "{", v_(i \, d \, L_(t_i \( d \)) \( f \( w \) \)) \, & d in S_i \,, o_(ell_d \( y_(i \,
   w) \)) \, & d in.not S_i .) $ <con-exceptional-vertex>]

Denote this edge by $e_(i \, w)$, and let

$ H = { e_x : x in X } union { e_(i \, w) : i in cal(I) \, med w in Y } . $

Thus an exceptional edge changes labels in the assigned directions, without introducing any new part.
  Every edge contains exactly one vertex from every part, so $H$ is $\( q + 1 \)$-partite and
  $\( q + 1 \)$-uniform. It is nonempty, because $Y eq.not diameter$.

Figure 1 shows how to read an exceptional edge from its parameter $w$.
  The deletion lines were defined from its ordinary base point $y_(i \, w)$,
  while its special labels use $f \( w \)$. The two axis parallel classes are preserved by $f$,
  which joins these descriptions in the intersection proof.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$w=(w_1,w_2) in Y$]]])])
  content((-3.5, -1.55), [#box(inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Ambient coordinates#linebreak()$y_(i,w)=b_i+M_"iw" in Y_i$]]])])
  content((3.5, -1.55), [#box(inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Small-plane coordinates#linebreak()$f(w)=(w_1^3,w_2) in f(Y)$]]])])
  content((-3.5, -3.65), [#box(width: 5.594cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Ordinary vertex in $V_d$#linebreak()$o_( ell_d(y_(i,w)))$]]])])
  content((3.5, -3.65), [#box(width: 5.594cm, inset: 0.2469cm, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Special vertex in $V_d$#linebreak()$v_(i,d,L_(t_i(d))(f(w)))$]]])])
  line((-0.9161, -0.4057), (-2.061, -0.9129), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-1.891, -0.8456), [#text(size: 9pt)[embed]], anchor: "south-east", padding: 0.07056cm)
  line((0.9161, -0.4057), (2.046, -0.9063), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.891, -0.8456), [#text(size: 9pt)[apply $f$]], anchor: "south-west", padding: 0.07056cm)
  line((-3.5, -2.187), (-3.5, -2.994), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-3.5, -2.6), [#text(size: 9pt)[$d in.not S_i$]], anchor: "east", padding: 0.1176cm)
  line((3.5, -2.194), (3.5, -2.986), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.5, -2.6), [#text(size: 9pt)[$d in S_i$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The two label rules for the vertex of $e_(i \, w)$ in part $V_d$. The left branch uses the embedded point $b_i + M_i w$; the right branch uses $f \( w \) = \( w_1^3 \, w_2 \)$ in the small plane. For each $d in A_i$, two parameters give the same ordinary label exactly when their images under $f$ lie on the same corresponding horizontal or vertical line. The diagram records maps and label choices, rather than geometric positions in the finite plane. ],
) <fig:two-coordinates>

#thm([Proposition 7.1.])[
  #emph[The hypergraph $H$ is intersecting. Furthermore, all the edges in its displayed parametrization are distinct.]
] <con-intersection>

#proof[
  There are four types of pairs, according to whether their edges are ordinary or exceptional and,
    in the latter case, whether their group indices agree.
  Two ordinary edges with distinct base points share the ordinary label of their join.
    Next, an exceptional base point $y in Y_i$ lies on a deletion line in every direction of the nonempty set
    $S_i$, so $y in.not X$. Its join with $x in X$ cannot have direction in $S_i$:
    otherwise that join would be a selected deletion line containing $x$.
    Its ordinary label therefore belongs to both the exceptional edge and $e_x$.
  For exceptional edges from distinct groups $i \, j$, the base points are distinct by (75).
    That same separation condition ensures that their join has direction outside both $D_i$ and $D_j$,
    and hence outside $S_i union S_j$. The two edges share its ordinary label.
  Finally, consider $e_(i \, w)$ and $e_(i \, w')$ with $w eq.not w'$.
    The transformed points $f \( w \) \, f \( w' \)$ are distinct.
    If their join has finite nonzero slope $t$, the exceptional edges share the special label of this subfield
    line in the part of direction $M_i \( t \)$. If their join is horizontal or vertical,
    the relevant original coordinates are equal as well, because $f$ preserves these two parallel classes
    bijectively. The original base points then share an ordinary axis-direction label, in a direction of $A_i$.
    This completes the intersection proof.
  We also check that the parameters count distinct edges, as required when we count exceptional edges below.
    Two ordinary labels in nonparallel directions determine the ordinary base point,
    so ordinary edges are distinct. An exceptional edge has special labels and cannot equal an ordinary edge.
    Within one group, the special labels in any two distinct directions of $S_i$ determine $f \( w \)$,
    since the corresponding subfield lines are nonparallel. As $\| S_i \| = s - 1 gt.eq 2$,
    equal exceptional edges within a group would imply $w = w'$.
    Finally, any special label tagged by group $i$ is absent from every edge of a different group.
    Exceptional edges in distinct groups are therefore distinct too. ◻
]

=== 7.2 Covering vertices in the small-plane coordinates <covering-vertices-in-the-small-plane-coordinates>

We identify the positions of the exceptional edges of group $i$ with $f \( Y \)$,
  via $e_(i \, w) arrow.l.r f \( w \)$. The action of a covering vertex means the subset of these positions whose
  edges contain that vertex. The next lemma translates every such action into one of the two resources in
  Lemma 12: a subfield line or an individual point.

#thm([Lemma 7.2.])[
  #emph[Fix a group $i$.]
  + #emph[A special vertex of group $i$ covers the positions on one subfield line.
    A special vertex of another group covers none.]
  + #emph[An ordinary vertex of direction in $S_i$ covers none.
    An ordinary vertex of direction in $A_i$, if it covers any positions,
    covers them on a single horizontal or vertical line in the $f$ coordinates.]
  + #emph[An ordinary vertex of direction outside $S_i union A_i$ covers at most one position.]
  #emph[In particular, the positions covered by any one vertex are contained in a subfield affine line.]
] <con-label-action>

#proof[
  The assertions for special vertices and altered ordinary directions follow directly from (78).
    For an axis direction, undoing $b_i \, M_i$ fixes one original coordinate,
    so applying $f$ gives the corresponding horizontal or vertical line.
    A line in a direction outside $S_i union A_i$ cannot contain two points of $P_i$,
    since the join directions of that embedded subplane are exactly $S_i union A_i$.
    It therefore covers at most one exceptional position. A singleton can be included in an arbitrary subfield
    line through it, and an empty set requires no covering resource. ◻
]

=== 7.3 The final cover argument <the-final-cover-argument>

#proof[
  #emph[Completion of the proof of Theorem 1.] We prove that $H$ has no vertex cover of size at most $q$.
    Suppose to the contrary that $C$ is such a cover. Its ordinary vertices, regarded as affine lines,
    must cover $X$: special vertices belong to no ordinary edge. These lines also cover $X_(upright("pool"))$.
    Lemma 14 therefore gives a projective point $p$ such that at least $\( 1 - rho \)
    q$ ordinary vertices of $C$ are lines through $p$. The line-survival bound will force every undeleted member
    of this pencil into $C$. We then count the vertices left for exceptional edges,
    separating centers at infinity, centers inside one of the sets $P_i$, and finite centers outside them all.
  ===== 7.3.1 Every undeleted line in this pencil is forced. <every-undeleted-line-in-this-pencil-is-forced.>
  We claim that
  #[#set math.equation(numbering: n => "(79)")
   $ p in ell \, quad ell in.not B quad arrow.r.double quad o_ell in C \, $ <con-forced-pencil>]
  where incidence with an infinite $p$ means that $ell$ has the corresponding direction.
    If $o_ell$ were missing, all other lines of $C$ through $p$ would cover at most one affine point of $ell$.
    There are at most $rho q$ vertices outside the large pencil subcollection.
    Each of their ordinary lines covers at most one point of $ell$,
    and their special vertices cover no ordinary edge. Consequently
  $ \| X ∩ ell \| lt.eq 1 + rho q . $
  This contradicts (77), since $delta q \/ 2 > 1 + rho q$ for sufficiently large $q$ and $rho = delta \/ 10$.
    At infinity the pencil lines are parallel, so the possible contribution of one central point is absent;
    the same upper bound still applies.
  Let $F_p$ be the set of ordinary vertices forced by (79),
    and call the vertices of $C \\ F_p$ the additional vertices.
    The deleted pencil lines determine how many additional vertices the assumed budget $\| C \| lt.eq q$ permits.
  ===== 7.3.2 An infinite center. <an-infinite-center.>
  Suppose $p$ is the point at infinity in direction $d$. Put
  $ I_d = { i in cal(I) : d in S_i } \, wide z = \| I_d \| in { 1 \, 2 } . $
  Only these groups contribute deletion lines in direction $d$, and each contributes $s - 1$, by Lemma 13.
    At most $z \( s - 1 \)$ of the $q$ lines in this parallel class belong to $B$. Thus
  $ \| C \\ F_p \| lt.eq z \( s - 1 \) . $
  None of the forced vertices covers any exceptional edge of a group in $I_d$,
    because those groups use special vertices in direction $d$.
  If $z = 1$, all positions of this group’s $f \( Y \)$ must therefore be covered by at most $s -
    1$ additional vertices. By Lemma 16, their effects can be included in at most $s - 1$ subfield lines.
    This contradicts Lemma 12.
  If $z = 2$, the two groups are $1 \, *$, by (72). An additional vertex can now meet both groups,
    so we use the weighted line-and-point budget instead of counting one line per vertex.
    For each of these groups let $a_i$ count the additional vertices that cover at least one of its positions and
    are either special vertices of this group or ordinary vertices in its axis directions $A_i$.
    Let $b'_i$ count the other additional vertices covering a position of the group.
    By Lemma 16, the latter vertices each cover only a singleton. The former supply subfield lines.
    The weighted conclusion of Lemma 12 gives
  #[#set math.equation(numbering: n => "(80)")
   $ a_i + b'_i / 2 gt.eq s wide \( i = 1 \, * \) . $ <con-two-group-lower>]
  Each additional vertex contributes at most one to the sum of the two left sides.
    A special vertex is confined to its tagged group. An ordinary axis-direction vertex counted in $a_i$ is a line
    meeting $P_i$ with direction in $A_i subset.eq D_i$; by (75) it cannot meet the other group’s $P_j$.
    It therefore contributes nothing to that other group, even as a singleton.
    Any vertex of neither exclusive type contributes at most $1 \/ 2$ to each group.
    This accounts for every type of additional vertex, including those covering neither group. Summing (80), we obtain
  $ 2 s lt.eq a_1 + b'_1 / 2 + a_(*) + b'_(*) / 2 lt.eq \| C \\ F_p \| lt.eq 2 \( s - 1 \) \, $
  a contradiction.
  ===== 7.3.3 A finite center inside an embedded configuration. <a-finite-center-inside-an-embedded-configuration.>
  Now let $p$ be finite, and write
  $ h_p = \| { ell in B : p in ell } \| . $
  There are $q + 1$ affine lines through $p$, so
  #[#set math.equation(numbering: n => "(81)")
   $ \| F_p \| = q + 1 - h_p \, wide \| C \\ F_p \| lt.eq h_p - 1 . $ <con-finite-budget>]
  The loss of one in the second inequality comes from the $q +
    1$ members of a finite pencil and the assumed cover size $q$.
    If $h_p = 0$, the forced vertices already exceed the permitted size of $C$.
    We may therefore assume $h_p gt.eq 1$ in both finite-center cases.
  Suppose $p in P_i$, for the necessarily unique such group.
    Every deletion line through $p$ comes from this group: a line from another group would contradict (75),
    since its direction belongs to that other group’s conflict set.
    There is at most one such line in each direction of $S_i$, and hence
  #[#set math.equation(numbering: n => "(82)")
   $ h_p lt.eq s - 1 . $ <con-internal-pencil-size>]
  Let $w_p = M_i^(- 1) \( p - b_i \) in bb(F)_s^2$, whether or not $w_p in Y$.
    We account for the exceptional positions of this group covered by $F_p$:
    they will all lie on two nonparallel lines in the new coordinates.
    For a position with base point $y eq.not p$, its join with $p$ has a direction in $S_i union A_i$.
    A direction in $S_i$ cannot cover this edge by an ordinary vertex.
    Any actual forced coverage must therefore lie along one of the two axis-direction lines through $p$.
    A position based at $p$ itself, if present, lies on both these axes as well.
  Since $f$ preserves the two coordinate parallel classes, all these covered positions are contained,
    in the new coordinates, in the horizontal and vertical lines through $f \( w_p \)$.
    The remaining positions are covered by the additional vertices;
    each can be included in one subfield line by Lemma 16. Equations (81) and (82) would thus give a cover of
    $f \( Y \)$ by at most
  $ 2 + \( h_p - 1 \) lt.eq s $
  lines containing the two nonparallel coordinate lines. These are legitimate covering resources whether or not
    their ordinary labels belong to $F_p$: their union contains every position covered by $F_p$.
    Removing any duplicate replacement lines preserves these two distinct lines and can only decrease the count.
    This contradicts Lemma 12.
  ===== 7.3.4 A finite center outside all embedded configurations. <a-finite-center-outside-all-embedded-configurations.>
  It remains to consider $p in.not union.big_(i in cal(I)) P_i$.
    Here we use the five points on each deletion line, rather than the small-plane cover obstruction.
    We will find $5 h_p$ exceptional edges missed by $F_p$, while each additional vertex covers at most five of them.
  Each group contributes at most one deletion line through $p$.
    Indeed, two distinct such lines cannot be parallel. After undoing $b_i \, M_i$,
    their subfield affine equations have distinct subfield directions.
    Solving these two equations uses a nonsingular linear system over $bb(F)_s$,
    so their intersection lies in $bb(F)_s^2$. This would place $p$ in $P_i$, a contradiction.
    Also, deletion lines from different groups cannot coincide, by (75).
  The $h_p$ deletion lines through $p$ therefore come from $h_p$ distinct groups.
    From each such group $i$, choose five distinct points of $Y_i$ on its contributing line, possible by Lemma 13.
    These give $5 h_p$ distinct exceptional edges, by Proposition 15. None is covered by a forced ordinary vertex:
    its unique join line to $p$ is precisely its contributing deletion line, whose direction is altered for that group.
  Any one additional vertex covers at most five of these selected edges.
    For a special vertex this follows because it belongs to only one group.
    An ordinary line through $p$ covers none, by the same unique-join and altered-direction argument.
    Finally, let an ordinary vertex $o_ell$, with $ell$ not through $p$, cover some selected edges.
    The line $ell$ meets each contributing line in at most one point,
    so $o_ell$ covers at most one selected edge from each contributing group.
    Every such group has a selected point $y in Y_i ∩ ell$ whose join to $p$ has direction in $S_i$.
    The third part of Lemma 14, which applies to all candidates and hence to the selection,
    bounds the number of these groups by five. This proves the asserted bound for every additional vertex.
  By (81), at most $h_p - 1$ additional vertices are available.
    They can cover at most $5 \( h_p - 1 \)$ of the $5 h_p$ selected edges, a final contradiction.
  We have ruled out every possible projective center $p$, and hence every vertex cover of size at most $q$.
    Therefore $tau \( H \) gt.eq q + 1$. Conversely, any edge of the nonempty intersecting hypergraph $H$ is
    itself a vertex cover and has size $q + 1$. It follows that
  $ tau \( H \) = q + 1 . $
  The parameter choices in Section 6 give this hypergraph for every sufficiently large odd integer $n$, with $q =
    s^n$, after fixing any sufficiently large prime $s equiv 2 med \( mod med 3 \)$ and a successful $Y$.
    Choose one such $Y$ for each eligible $s$, and let $n_0 \( s \) gt.eq
    3$ exceed all the resulting degree thresholds. This proves Theorem 1.
    Since there are arbitrarily large odd integers, it also gives infinitely many ranks $r = q + 1$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
