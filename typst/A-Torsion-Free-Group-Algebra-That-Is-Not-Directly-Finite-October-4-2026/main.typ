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

#align(center)[#text(size: 16pt, weight: "bold")[A Torsion-Free Group Algebra That Is Not Directly Finite]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

A unital ring $R$ is #emph[directly finite] if $a b = 1$ implies $b a = 1$ for all $a \, b in R$.
  For a field $K$ and a group $G$, the group algebra $K \[ G \]$ consists of finite formal sums of elements of $G$
  with coefficients in $K$, with multiplication extending the group operation bilinearly.
  Kaplansky’s direct finiteness conjecture asserts that every such group algebra is directly finite.
  We prove that the implication can fail even when the field is finite and the group is finitely presented and
  torsion-free. A classifying complex for $G$ is a connected CW complex with fundamental group $G$ and
  contractible universal cover.

#thm([Theorem 1.1.])[
  #emph[There exist a finitely presented torsion-free group $G$ and elements $a \, b \, c in bb(F)_2 \[ G \]$ such that
$ a b = 1 \, wide a c = 0 \, wide c eq.not 0 . $

 Consequently $b a eq.not 1$. The group $G$ admits a finite two-dimensional classifying complex.]
] <thm:main>

The auxiliary element $c$ certifies failure of the reverse identity:
  if $b a = 1$, then $c = \( b a \) c = b \( a c \) = 0$.

=== History and related work <history-and-related-work>

Kaplansky’s formulation separates the characteristic-zero theorem from the positive-characteristic
  question #cite(label("Kaplansky1972")) Part II, Section 3, Problem 2, pp. 122–123.
  In characteristic zero, group algebras are directly finite for every group.
  The operator-algebra argument also applies to matrix rings;
  Montgomery gave a concise $C^(*)$-algebra proof #cite(label("Montgomery1969")).
  A ring whose matrix rings of every finite size are directly finite is called #emph[stably finite].

In arbitrary characteristic, Ara, O’Meara, and Perera proved stable finiteness for group algebras of
  free-by-amenable groups over division rings #cite(label("AraOMearaPerera2002")).
  Elek and Szabó extended the conclusion to sofic groups #cite(label("ElekSzabo2004")) Corollary 4.7,
  a class defined by finite approximate permutation actions.
  Their theorem implies that the group in Theorem 1 is not sofic.
  A complementary approach studies the finite cancellation patterns forced by a one-sided inverse.
  Dykema, Heister, and Juschenko organized these patterns into universal groups and established direct finiteness
  for several small support pairs over $bb(F)_2$ #cite(label("DykemaHeisterJuschenko2015")).

Two companion manuscripts are especially relevant. A separate construction gives a scalar counterexample over a
  finite field of characteristic two for a finitely presented group with odd-order
  torsion #cite(label("OpenAI2026DF")) Theorem 1.1. Theorem 1 uses the prime field $bb(F)_2$ and a torsion-free
  group. Its method develops the graph and cone construction of #emph[A Torsion-Free Group Algebra with Zero
  Divisors] #cite(label("OpenAI2026ZD")). That manuscript supplies the parity mechanism for a zero product and the
  arrangement-exclusion strategy. We adapt those arguments to produce a one-sided inverse and reproduce the
  estimates and topology needed here.

Graphical presentations relate coincidences of labeled paths to geometric properties of quotient groups,
  as in Gromov’s random graphical constructions #cite(label("Gromov2003")) and Ollivier’s small-cancellation
  theorem #cite(label("Ollivier2006")). Bereznyuk’s spherical-diagram criterion for graphical asphericity
  distinguishes coincident graph lifts from genuinely different ones #cite(label("Bereznyuk2019")).
  The same distinction is essential here: pairings of two occurrences of the same graph edge are removed by cone
  surgeries. We prove the required asphericity and root protection directly in Section 6.

=== The construction and its main estimates <the-construction-and-its-main-estimates>

The group is obtained from a bouquet of circles by attaching cones on finite labeled graphs.
  A cone kills every closed path in its graph, so a vertex in a chosen component determines a group element by
  reading a path from a fixed root to that vertex. The desired algebra elements are finite sums of these path
  labels and their inverses.

Two graphs are used. A common outgoing label allows a simultaneous step in both coordinates of their vertex
  products. The group element contributed to the corresponding algebra product is constant along such a step.
  If every vertex of a simultaneous-step component has odd degree,
  the component has even cardinality and its contributions cancel over $bb(F)_2$.
  A single even-degree exception instead leaves one surviving contribution.
  We prescribe the outgoing label sets so that the first graph paired with itself has exactly this exception,
  while the first graph paired with the second has none.

The change to the parity construction in #cite(label("OpenAI2026ZD")) is to produce product $1$ as well as product
  $0$. Seven additional labels, organized by complements of lines in the Fano plane,
  create the required exception while keeping every inverse-label incidence count balanced.
  This changes the random model, and we establish its counting estimates directly.

The main difficulty is to make the cone attachments aspherical while ensuring that a path from a root to a
  different graph vertex has nontrivial image in the group.
  Both conclusions follow by excluding certain planar pairings of graph paths. The argument has two parts.
  First, a weighted estimate rules out bounded collections of paths with a small proportion of unpaired positions.
  Repeated traversal of a graph edge is the main counting obstacle:
  two compared path words need not impose two sets of random edge conditions.
  We organize the count by the number of times each edge is used,
  and choose subdivisions that nearly agree under all the comparisons.
  This makes the decay of word weights available despite repeated traversals.
  The permitted unpaired proportion is fixed before the bounds on the number and length of paths.
  Second, a planar separator extracts one of these bounded collections from any spherical arrangement,
  however large. The order of these parameter choices is what allows a local counting estimate to exclude all
  arrangements.

We give the graph criterion and the parity calculation in Section 2.
  Section 3 constructs the vertex types and proves the word, girth, and diameter estimates.
  Section 4 proves the bounded-path estimate, and Section 5 carries out the planar extraction.
  Section 6 proves the topological criterion by cone surgeries. Section 7 then assembles these conclusions.

== 2 Labeled graphs and the parity criterion <sec:algebra>

The algebraic part of the construction is a parity calculation on finite graphs.
  We first isolate this calculation from the geometric work needed to ensure that the resulting group is
  torsion-free and that a specified coefficient does not vanish.
  The use of immersed graphs and their cones follows the construction in #cite(label("OpenAI2026ZD"))
  Proposition 5.1 and Section 6.

A #emph[signed alphabet] is a finite set $T$ with a fixed-point-free involution $t mapsto macron(t)$.
  Let $F$ be the rose with one vertex $*$ and one geometric edge for each pair ${ t \, macron(t) }$;
  its two orientations carry the labels $t$ and $macron(t)$.
  A $T$-labeled graph $Gamma$ has a label on every oriented edge,
  with opposite orientations carrying inverse labels. It therefore has a label map $Gamma arrow.r
  F$ taking each edge homeomorphically onto the appropriate edge of the rose.
  The map is an #emph[immersion] if the labels on the edges leaving any one vertex are distinct.
  Write $S_x subset.eq T$ for these outgoing labels. For $t in S_x$,
  denote by $x dot.op t$ the endpoint of the unique edge leaving $x$ with label $t$.

The length of an edge path is its number of edge traversals, counted with multiplicity.
  A path is #emph[immersed] if it has no consecutive edge and reverse edge.
  A closed path is #emph[cyclically immersed] if this also holds at the closing turn.
  For a graph immersed in $F$, these conditions say precisely that the label word is freely reduced,
  or cyclically reduced, respectively. We multiply labels in the order in which a path traverses its edges.

Let $Gamma_A$ and $Gamma_B$ be finite graphs immersed in $F$, with vertex sets $A$ and $B$,
  and choose roots $x_A in A$ and $x_B in B$. Put $Gamma = Gamma_A union.sq Gamma_B$.
  For each connected component $Lambda$ of $Gamma$, let $K_Lambda$ be its abstract cone, and form

#[#set math.equation(numbering: n => "(2.1)")
 $ X = F union_(Lambda arrow.r F) union.big_(Lambda in pi_0 \( Gamma \)) K_Lambda \, wide G =
   pi_1 \( X \, * \) . $ <eq:cone-complex>]

Here the base of each cone is attached by its label map. In particular, the cone need not embed in $X$.
  This is a finite CW complex of dimension at most two. Every closed path in $Gamma$ has trivial label in $G$,
  because it bounds in its cone.

Let $A' subset.eq A$ and $B' subset.eq B$ be the vertex sets of the components containing the respective roots.
  For $x in A'$, let $g_x$ be the label in $G$ of any path from $x_A$ to $x$;
  define $h_y$ for $y in B'$ in the same way. These elements are independent of the chosen paths:
  the concatenation of one such path with the reverse of another is a closed path in the same component. Thus

#[#set math.equation(numbering: n => "(2.2)")
 $ g_(x_A) = h_(x_B) = 1 \, wide g_(x dot.op t) = g_x t \, wide h_(y dot.op t) = h_y t \, $ <eq:path-step>]

whenever the indicated step exists, where a letter also denotes its image in $G$.

#thm([Proposition 2.1.])[
  (Parity criterion).  #emph[Let $Gamma_A \, Gamma_B$ be finite loopless graphs immersed in the same rose,
    with roots and cone group as above. Suppose that
#[#set math.equation(numbering: n => "(2.3)")
 $ \| S_x ∩ S_(x') \| & equiv 1 med \( mod med 2 \) &  & #scale(x: 120%, y: 120%)[\(] x \, x' in A' \,
   med \( x \, x' \) eq.not \( x_A \, x_A \) #scale(x: 120%, y: 120%)[\)] \,\
\| S_(x_A) \| & equiv 0 med \( mod med 2 \) \,\
\| S_x ∩ S_y \| & equiv 1 med \( mod med 2 \) &  & #scale(x: 120%, y: 120%)[\(] x in A' \, med
  y in B' #scale(x: 120%, y: 120%)[\)] . $ <eq:parity-assumptions>]

 Suppose also that the roots are protected in the following sense:
#[#set math.equation(numbering: n => "(2.4)")
 $ upright("if a path in ") Gamma upright(" starts at ") x_A upright(" or ") x_B upright(" and ends")\
upright("at a different vertex, its label is nontrivial in ") G upright(".") $ <eq:root-protection>]

 Then the finite scalar sums
#[#set math.equation(numbering: n => "(2.5)")
 $ a = sum_(x in A') g_x \, wide b = sum_(x in A') g_x^(- 1) \, wide c = sum_(y in B') h_y^(- 1) quad
   upright("in ") bb(F)_2 \[ G \] $ <eq:scalar-elements>]

 satisfy $a b = 1$, $a c = 0$, and $c eq.not 0$. Consequently $b a eq.not 1$.]
] <prop:parity>

#proof[
  On $A' times A'$ form the simultaneous-step graph: for every common outgoing label $t$ at $x$ and $x'$,
    join $\( x \, x' \)$ to $\( x dot.op t \, x' dot.op t \)$.
    The step with label $macron(t)$ at the latter vertex is the reverse of this edge, rather than a second edge.
    Different steps with the same pair of endpoints remain distinct edges.
    The graph is loopless because the factor graphs are loopless,
    and its degree at $\( x \, x' \)$ is exactly $\| S_x ∩ S_(x') \|$.
  The group element contributed to $a b$ by a vertex is constant on each component of this graph. Indeed, by (2.2),
  $ g_(x dot.op t) g_(x' dot.op t)^(- 1) = \( g_x t \) \( g_(x') t \)^(- 1) = g_x g_(x')^(- 1) . $
  In every finite graph the number of vertices of odd degree is even,
    because the sum of the degrees is twice the number of edges.
    By (2.3), every component that does not contain $\( x_A \, x_A \)$ therefore has an even number of vertices.
    Its contributions to $a b$ cancel in characteristic two. In the component containing $\( x_A \, x_A \)$,
    that vertex is the unique vertex of even degree, so the component has odd cardinality.
    Its constant contribution is $g_(x_A) g_(x_A)^(- 1) = 1$. This proves $a b = 1$.
  Apply the same construction to $A' times B'$. Its degree at $\( x \, y \)$ is $\| S_x ∩ S_y \|$,
    which is always odd. Hence every component has even cardinality.
    The contribution $g_x h_y^(- 1)$ to $a c$ is constant along each simultaneous step by the same calculation,
    so $a c = 0$.
  Finally, $h_(x_B) = 1$, and (2.4) gives $h_y eq.not 1$ for every $y in B' \\ { x_B }$.
    Thus the coefficient of the identity in $c$ is exactly one, and $c eq.not 0$.
    If $b a = 1$, associativity would give $c = \( b a \) c = b \( a c \) = 0$, a contradiction. ◻
]

Only protection of $x_B$ is needed for the last coefficient calculation.
  We retain the symmetric condition (2.4) because the geometric argument will establish it for both roots.
  The remaining task is to construct finite immersed graphs satisfying (2.3) whose cone complex is aspherical and
  whose roots satisfy (2.4).

== 3 Types and random matchings <sec:random>

We construct the outgoing label sets first, so that every choice of edges has the parity properties needed for the
  algebraic argument. We then choose the edges by random matchings.
  The estimates in this section show that we may condition on logarithmic girth while retaining useful bounds for
  prescribed edges, and that the resulting components have logarithmic diameter.
  The construction and the use of conditioned matchings adapt the method of #cite(label("OpenAI2026ZD")) Section
  “Prescribed types and random matchings”; the label counts and estimates below are for the types used here.

=== 3.1 Prescribing the outgoing labels <prescribing-the-outgoing-labels>

Fix

$ q = 128 \, wide v = q^2 + q + 1 = 16513 \, wide p = frac(q + 1, v) . $

Let $cal(P)$ and $cal(L)$ be the points and lines of the projective plane over $bb(F)_q$.
  Concretely, these are the one-dimensional and two-dimensional subspaces of $bb(F)_q^3$,
  with incidence given by containment. Counting nonzero vectors gives $v$ points, and duality gives $v$ lines.
  Every line contains $q + 1$ points, and every point lies on $q + 1$ lines.
  Two distinct points span a unique line, and two distinct lines intersect in exactly one point.

Adjoin a set $cal(E)$ of seven extra letters to $cal(P)$, and put $T = cal(P) union.sq cal(E)$.
  Pair each extra letter with a distinct ordinary letter. Since $v - 7$ is even,
  the remaining ordinary letters can be paired among themselves.
  These pairs define the fixed-point-free involution $t mapsto macron(t)$ on $T$.
  As before, $F$ is the rose with one edge for each inverse pair.

Identify $cal(E)$ with the seven points of the projective plane over $bb(F)_2$,
  and let $cal(D)$ consist of the complements of its seven lines.
  Each $D in cal(D)$ has four elements, and distinct members of $cal(D)$ intersect in two elements.
  Each extra letter belongs to four members of $cal(D)$: three Fano lines contain the letter and four do not.
  Each pair of distinct extra letters belongs to two members of $cal(D)$,
  since the number of Fano lines containing at least one of them is $3 + 3 - 1 = 5$.

Let $m$ tend to infinity through positive integers congruent to $1$ modulo $4$, and set $n = v m$.
  All asymptotic statements below use this sequence. Partition sets $A$ and $B$ into classes indexed by $cal(L)$,
  with $m$ vertices in each class of $A$ and $m - 1$ vertices in each class of $B$. Thus

$ \| A \| = n \, wide \| B \| = n - v . $

The ordinary part of the outgoing label set $S_x$ at a vertex $x$ is its indexing line.
  Choose a distinguished vertex $x_A in A$ and give it all seven extra letters.
  For every $D in cal(D)$, prescribe extra part exactly $D$ at

#[#set math.equation(numbering: n => "(3.1)")
 $ a_m = frac(\( q + 1 \) m - 1, 4) quad upright("vertices of ") A \, wide b_m =
   frac(\( q + 1 \) \( m - 1 \), 4) quad upright("vertices of ") B . $ <eq:extra-counts>]

These are integers because $q + 1 equiv m equiv 1 med \( mod med 4 \)$. Every remaining vertex has empty extra part.

For each $D$, distribute its prescribed vertices among the $v$ line classes with counts differing by at most one.
  These distributions can be realized simultaneously on disjoint vertices.
  Indeed, in each line class the total demand in $A$, including $x_A$ if applicable,
  is at most $7 ceil.l a_m \/ v ceil.r + 1$, and in $B$ it is at most $7 ceil.l b_m \/ v ceil.r$. Both bounds are

$ frac(7 \( q + 1 \), 4 v) m + O \( 1 \) \, $

whose coefficient of $m$ is strictly less than one. For all sufficiently large $m$,
  each bound is smaller than $m - 1$. Fix one such assignment of the sets $S_x$, and also fix any root $x_B in B$,
  before choosing edges.

#thm([Proposition 3.1.])[
  (Balanced types and parity).  #emph[For all sufficiently large $m equiv 1 med \( mod med 4 \)$,
    the prescribed sets $S_x subset.eq T$, $x in A union.sq B$, satisfy the following identities.
    For every $Y in { A \, B }$ and $t in T$,
#[#set math.equation(numbering: n => "(3.2)")
 $ \| { x in Y : t in S_x } #scale(x: 120%, y: 120%)[\|] = \| Y \| p . $ <eq:label-balance>]

 Their intersection cardinalities satisfy
#[#set math.equation(numbering: n => "(3.3)")
 $ \| S_x ∩ S_(x') \| & equiv 1 med \( mod med 2 \) &  & #scale(x: 120%, y: 120%)[\(] x \, x' in A \,
   med \( x \, x' \) eq.not \( x_A \, x_A \) #scale(x: 120%, y: 120%)[\)] \,\
\| S_(x_A) \| & equiv 0 med \( mod med 2 \) \,\
\| S_x ∩ S_y \| & equiv 1 med \( mod med 2 \) &  & #scale(x: 120%, y: 120%)[\(] x in A \, med
  y in B #scale(x: 120%, y: 120%)[\)] . $ <eq:type-parity>]

 Moreover, $129 lt.eq \| S_x \| lt.eq 136$ at every vertex.]
] <prop:types>

#proof[
  An ordinary letter lies on $q + 1$ lines, so occurs at exactly $\( q + 1 \) m =
    n p$ vertices of $A$ and $\( q + 1 \) \( m - 1 \) = \( n - v \) p$ vertices of $B$.
    An extra letter belongs to four members of $cal(D)$, and therefore occurs $4 a_m +
    1 = \( q + 1 \) m$ times in $A$ and $4 b_m = \( q + 1 \) \( m - 1 \)$ times in $B$. This proves (3.2).
  The intersection of two ordinary parts has size $q + 1 = 129$ when the lines agree and size one otherwise.
    For the extra parts, all intersections have even size except the intersection of the full seven-element set
    with itself. In fact, the possible even sizes are zero, two, and four.
    Only $x_A$ has the full extra part, giving exactly the exception in (3.3).
    Finally, the possible sizes of $S_x$ are $129$, $133$, and $136$. ◻
]

For $Y in { A \, B }$, write $Y_t = { x in Y : t in S_x }$.
  For each inverse pair, choose a bijection $Y_t arrow.r Y_(macron(t))$.
  A matched pair $\( x \, y \)$ gives one undirected edge, oriented from $x$ to $y$ with label $t$ and in the
  reverse direction with label $macron(t)$. Overlap between $Y_t$ and $Y_(macron(t))$ is allowed,
  so loops may occur at this stage. More precisely, a match joins the label slots $\( x \, t \)$ and
  $\( y \, macron(t) \)$; these remain distinct when $x = y$.
  Denote the resulting graphs by $Gamma_A$ and $Gamma_B$, and put $Gamma = Gamma_A union.sq Gamma_B$.
  Every outgoing label at a vertex occurs exactly once, so the maps to $F$ are immersions.
  Degrees count half-edges, including both half-edges of a loop, and are bounded by

#[#set math.equation(numbering: n => "(3.4)")
 $ 129 lt.eq deg \( x \) lt.eq d_(*) := 136 . $ <eq:degree-bound>]

=== 3.2 Turn frequencies and decay of word weights <turn-frequencies-and-decay-of-word-weights>

At an interior vertex of a path with consecutive labels $t \, u$,
  the outgoing labels used by the path are $macron(t) \, u$. For a reduced turn, meaning $u eq.not macron(t)$, define

#[#set math.equation(numbering: n => "(3.5)")
 $ w \( t \, u \) =
   cases(delim: "{", \( q + 1 \)^(- 1) \, & macron(t) \, u in cal(P) \,, p \, & upright("one of ") macron(t) \, u
   upright(" is in ") cal(P) upright(" and the other is in ") cal(E) \,, 1 \/ 2 \, & macron(t) \, u in cal(E) .)
   wide w \( t \, macron(t) \) = 0 . $ <eq:turn-weights>]

For either $Y = A$ or $Y = B$, uniformly over reduced turns,

#[#set math.equation(numbering: n => "(3.6)")
 $ \| { x in Y : macron(t) \, u in S_x } #scale(x: 120%, y: 120%)[\|] = n p thin w \( t \, u \) +
   O \( 1 \) . $ <eq:turn-count>]

Here and below constants in $O \( 1 \)$ do not depend on $m$.
  To verify the formula, two distinct ordinary letters occur together on just one line, giving $m$ or $m -
  1$ choices. An extra letter occurs in each line class $4 a_m \/ v + O \( 1 \) = p m + O \( 1 \)$ times in $A$,
  including the possible distinguished vertex in the error, and $4 b_m \/ v + O \( 1 \) = p \( m - 1 \) +
  O \( 1 \)$ times in $B$. Summing over the $q + 1$ lines containing a specified ordinary letter gives $n p^2 +
  O \( 1 \)$. Finally, two distinct extra letters occur together $2 a_m + 1 = n p \/ 2 +
  1 \/ 2$ times in $A$ and $2 b_m = \( n - v \) p \/ 2$ times in $B$. These are precisely the three cases of (3.6).

For a word $W = t_1 dots.h.c t_h$ of positive length, put

#[#set math.equation(numbering: n => "(3.7)")
 $ P \( W \) = product_(i = 1)^(h - 1) w \( t_i \, t_(i + 1) \) \, $ <eq:word-weight>]

with the empty product equal to one. This weight is positive exactly when the word is reduced.
  Since the rule in (3.5) is symmetric in $macron(t) \, u$, it also gives

$ w \( t \, u \) = w \( macron(u) \, macron(t) \) \, wide P \( W^(- 1) \) = P \( W \) \, wide W^(- 1) =
  macron(t)_h dots.h.c macron(t)_1 . $

Thus reversing the orientation of a path does not change its weight.
  The square of this weight has summable total mass in long word lengths, as the next estimate shows.

#thm([Lemma 3.2.])[
  (Decay of word weights).  #emph[There is a constant $delta > 0$,
    depending only on the prescribed alphabet and weights, such that for all sufficiently large integers $h$,
#[#set math.equation(numbering: n => "(3.8)")
 $ sum_(W in T^h) P \( W \)^2 lt.eq exp \( - 2 delta h \) . $ <eq:word-decay>]

]
] <lem:word-decay>

#proof[
  Let $M$ be the nonnegative matrix with entries $M_(t \, u) = w \( t \, u \)^2$. Define a positive vector $f$ on $T$ by
  $ f \( t \) = cases(delim: "{", 4 \, & macron(t) in cal(E) \,, 1 \, & macron(t) in cal(P) .) $
  Exactly seven ordinary letters have value four under $f$; all extra letters have value one.
    If $macron(t)$ is ordinary, there are $v - 1 = q \( q + 1 \)$ allowed ordinary successors and seven extra
    successors. Allowing all seven of the exceptional ordinary letters among those successors gives
  $ \( M f \) \( t \) lt.eq frac(q, q + 1) + 7 p^2 + frac(21, \( q + 1 \)^2) < 1 = f \( t \) . $
  If $macron(t)$ is extra, the six allowed extra successors contribute $6 \/ 4$,
    and the ordinary successors contribute $\( v + 21 \) p^2$. Thus
  $ \( M f \) \( t \) lt.eq 6 / 4 + \( v + 21 \) p^2 < 4 = f \( t \) . $
  Both strict inequalities hold for $q = 128$. Consequently a fixed $lambda < 1$ satisfies $M f lt.eq
    lambda f$ coordinatewise. Writing $upright(bold(1))$ for the all-ones vector and using $upright(bold(1)) lt.eq
    f lt.eq 4 upright(bold(1))$, we obtain
  $ sum_(W in T^h) P \( W \)^2 = upright(bold(1))^(sans(T)) M^(h - 1) upright(bold(1)) lt.eq
    4 \| T \| lambda^(h - 1) . $
  For example, $delta = - 1 / 4 log lambda > 0$ makes the last quantity at most $exp \( - 2 delta h \)$ for all
    sufficiently large $h$. ◻
]

=== 3.3 Conditioning on large girth <conditioning-on-large-girth>

Initially choose all the bijections independently and uniformly, and write $bb(P)$ for this probability law.
  Fix $c_0 > 0$ so small that

#[#set math.equation(numbering: n => "(3.9)")
 $ c_0 log \( 2 \| T \| \/ p \) < 1 \, wide 2 c_0 log d_(*) < 1 \, wide L =
   floor.l c_0 log n floor.r . $ <eq:girth-scale>]

Girth is the length of a shortest simple cycle; loops and pairs of parallel edges count as cycles of lengths one
  and two. Let $cal(G)_L$ be the event that $Gamma$ has girth at least $L$.
  We first prove that this event is nonempty for all sufficiently large $n$, so that the conditioned law

$ bb(P)_L \( thin dot.op thin \) = bb(P) \( thin dot.op divides cal(G)_L \) $

is defined.

A #emph[match prescription] specifies one matched pair in one of the bijections, on a specified side $A$ or $B$.
  The reverse orientation describes the same prescription. A collection is feasible if some tuple of bijections
  satisfies it. Every bijection on side $Y$ has $N_Y = \| Y \| p$ pairs.
  Before conditioning, a feasible collection of distinct prescriptions has probability
  $product \( N_Y \)_e^(- 1)$, where the product runs over the bijections,
  $e$ is their respective number of prescriptions, and $\( N \)_e = N \( N - 1 \) dots.h.c \( N - e + 1 \)$.

There are at most $2 n^k \| T \|^k$ choices of vertices and labels that can describe a cycle of length $k$.
  A feasible simple cycle uses $k$ distinct prescriptions, even for $k = 1$ or $k = 2$,
  and therefore has probability at most $\( n p - v p - k \)^(- k)$.
  If an edge is called bad when it lies on a cycle of length less than $L$,
  the expected number of bad edges is consequently at most

#[#set math.equation(numbering: n => "(3.10)")
 $ 2 sum_(1 lt.eq k < L) k (frac(2 \| T \|, p))^k = o \( n \) . $ <eq:bad-edges>]

Here $n p - v p - k gt.eq n p \/ 2$ for large $n$, uniformly for $k < L$, and the last assertion follows from (3.9).

We use the following elementary switch. Suppose that $x y$ and $u z$ are edges on the same side,
  both oriented with the same label $t$. Assume that $u z$ is not bad and that the distance between ${ x \,
  y }$ and ${ u \, z }$ exceeds $2 L$. Distances between different components are understood to be infinite.
  Transpose the two targets in the bijection, replacing $x y \, u z$ by $x z \, u y$.
  This preserves every outgoing label set and creates no cycle of length less than $L$.

For the last assertion, any new short cycle must contain a new edge.
  If it contains just one, deleting that edge gives an old path of length less than $L$ between the two distant
  endpoint sets, a contradiction. If it contains both, deleting the new edges gives two old paths.
  Either one of these crosses between the endpoint sets, again contradicting their distance,
  or the paths join $x$ to $y$ and $u$ to $z$. In the latter case the old $u$-to-$z$ path together with $u
  z$ is a cycle of length less than $L$, contrary to the choice of $u z$.
  This argument also applies when $x = y$; the corresponding residual path can have length zero.

Choose an initial tuple with $o \( n \)$ bad edges, as supplied by (3.10).
  Given a bad edge $x y$, the number of edges having an endpoint within distance $2
  L$ of $x$ or $y$ is $O \( d_(*)^(2 L + 2) \) = o \( n \)$, by (3.9).
  The appropriate bijection contains at least $n p - v p$ edges,
  so it has an edge $u z$ which is neither bad nor excluded by this distance condition.
  The switch removes the bad edge $x y$ and creates no new bad edges.
  Repeating decreases the number of bad edges strictly at each step and eventually gives a tuple in $cal(G)_L$.
  Since every tuple has positive probability, $bb(P) \( cal(G)_L \) > 0$.

The purpose of switching is also quantitative. It permits an upper bound for an additional prescribed edge without
  any lower bound for $bb(P) \( cal(G)_L \)$.

#thm([Lemma 3.3.])[
  (Prescriptions under girth conditioning).  #emph[There is a nonnegative sequence $r_n = v p +
    O \( d_(*)^(2 L + 2) \) = o \( n \)$ with the following property.
    If $cal(S)$ is a collection of $s$ distinct prescriptions having positive probability under $bb(P)_L$,
    and $e$ is a further prescription not in $cal(S)$, then
#[#set math.equation(numbering: n => "(3.11)")
 $ bb(P)_L \( e divides cal(S) \) lt.eq frac(1, n p - s - r_n) wide upright("whenever ") n p - s -
   r_n > 0 . $ <eq:one-prescription>]

 In particular, for every fixed $C_1 > 0$, a specified collection of $E lt.eq
   C_1 L$ distinct prescriptions satisfies the uniform bound
#[#set math.equation(numbering: n => "(3.12)")
 $ bb(P)_L \( upright("all ") E upright(" prescriptions hold") \) lt.eq \( n p \)^(- E) exp \( o \( L \) \) .
   $ <eq:short-prescriptions>]

]
] <lem:prescriptions>

#proof[
  The conditional law is uniform on the finite set of tuples satisfying $cal(G)_L$ and $cal(S)$.
    Partition this set into $Omega_(+)$, the tuples containing $e = x y$, and $Omega_(-)$,
    those not containing it. If $Omega_(+)$ is empty there is nothing to prove.
    Otherwise orient $e$ with its prescribed label. For any tuple in $Omega_(+)$, at least
  $ n p - v p - s - O \( d_(*)^(2 L + 2) \) gt.eq n p - s - r_n $
  edges of its bijection are sufficiently distant from ${ x \, y }$ and are not in $cal(S)$.
    Choose the constant defining $r_n$ uniformly large enough for this inequality.
    Switching $x y$ with any such edge gives a tuple in $Omega_(-)$:
    all old edges avoid short cycles, so the preceding switching argument preserves girth,
    and neither deleted edge is prescribed by $cal(S)$.
  The output uniquely determines the input and the chosen switch.
    Indeed, if $phi.alt' : Y_t arrow.r Y_(macron(t))$ is the output bijection, then $z =
    phi.alt' \( x \)$ and $u = \( phi.alt' \)^(- 1) \( y \)$.
    Replacing these two matches by $phi.alt \( x \) = y$ and $phi.alt \( u \) = z$ recovers the input,
    even when the domain and codomain overlap as vertex sets. Thus
  $ \| Omega_(+) \| \( n p - s - r_n \) lt.eq \| Omega_(-) \| . $
  Dividing by the total number of tuples proves (3.11). Incompatible additional prescriptions have probability
    zero and satisfy the same bound.
  Expose a specified collection of $E lt.eq C_1 L$ edges in any order.
    If a prefix is impossible its joint probability is zero; otherwise (3.11) applies at every step. Hence
  $ bb(P)_L \( upright("all ") E upright(" prescriptions hold") \) lt.eq
    product_(s = 0)^(E - 1) \( n p - s - r_n \)^(- 1) lt.eq \( n p \)^(- E) exp #h(-0.16667em) (O #h(-0.16667em)
    (frac(E \( E + r_n \), n))) . $
  Since $E = O \( L \)$, $L = O \( log n \)$, and $r_n = o \( n \)$, the error in the exponent is $o \( L \)$,
    uniformly for the stated range of $E$. ◻
]

=== 3.4 Expansion and component diameter <expansion-and-component-diameter>

We now use (3.11) for collections with a small linear number of edges.
  The high minimum degree forces small vertex sets to expand, even under girth conditioning.

#thm([Proposition 3.4.])[
  (Component diameter).  #emph[There is a fixed constant $d > 0$ such that,
    with $bb(P)_L$-probability tending to one as $m arrow.r oo$,
    every connected component of $Gamma_A$ and $Gamma_B$ has diameter at most $d L$.]
] <prop:diameter>

#proof[
  For a vertex set $S$ in either graph, let $N \[ S \]$ be $S$ together with all its neighbors.
    We first show that there is a constant $rho > 0$ such that, with probability tending to one,
  #[#set math.equation(numbering: n => "(3.13)")
   $ \| N \[ S \] \| gt.eq 2 \| S \| quad upright("for every ") S upright(" with ") 1 lt.eq \| S \| lt.eq
     rho n quad upright("on either side") . $ <eq:small-set-expansion>]
  All constants used to choose $rho$ below are independent of $n$.
  Suppose $\| S \| = k lt.eq rho n$ and $\| N \[ S \] \| < 2 k$.
    Take $rho < 1 \/ 4$, so that $2 k lt.eq n - v$ for sufficiently large $n$.
    We can then enlarge $N \[ S \]$ to a set $Z$ of exactly $2 k$ vertices on the same side.
    Every edge incident to $S$ has both endpoints in $Z$. The sum of the degrees in $S$ is at least $129 k$,
    and an edge contributes at most two to that sum. Therefore $Z$ contains at least
  $ r = ceil.l 129 k \/ 2 ceil.r $
  distinct edges. Notice that $64.5 k lt.eq r lt.eq 65 k$.
  There are at most $\( e n \/ \( 2 k \) \)^(2 k)$ choices for $Z$.
    For a fixed $Z$, the number of possible labeled edge prescriptions with endpoints in $Z$ is at most $4 \| T \|
    k^2$. Thus the number of sets of $r$ such prescriptions is at most
  $ binom(4 \| T \| k^2, r) lt.eq \( C_2 k \)^r $
  for a fixed constant $C_2$; if fewer than $r$ prescriptions are available, the event is empty.
    Reduce $rho$ so that $65 rho < p \/ 4$. Because $r_n = o \( n \)$, all denominators in (3.11),
    when exposing these $r$ edges, are at least $n p \/ 2$ for sufficiently large $n$.
    Each collection therefore has probability at most $\( 2 \/ \( n p \) \)^r$.
  A union bound, first over $Z$ and then its prescribed edges,
    now bounds the probability of failure for this $k$ on either fixed side by
  #[#set math.equation(numbering: n => "(3.14)")
   $ (frac(e n, 2 k))^(2 k) \( C_2 k \)^r (frac(2, n p))^r lt.eq (C_3 \( k \/ n \)^62.5)^k $ <eq:expansion-probability>]
  for a fixed $C_3$. The exponent $62.5$ is $129 \/ 2 - 2$;
    rounding $r$ changes only the constant because $64.5 lt.eq r \/ k lt.eq 65$.
    Choose $rho$ smaller once more so that $C_3 rho^62.5 < 1 \/ 2$.
    For $k lt.eq sqrt(n)$, the right side of (3.14) is at most $\( C_3 n^(- 31.25) \)^k$, whose sum tends to zero.
    For $sqrt(n) < k lt.eq rho n$, it is at most $2^(- k)$, again with sum tending to zero.
    Including both sides proves (3.13) with probability $1 - o \( 1 \)$.
  Assume (3.13). Starting with any vertex, successive closed balls double in cardinality as long as they have at
    most $rho n$ vertices. In particular every ball of radius
  $ R = ceil.l log_2 n ceil.r + 1 $
  has more than $rho n$ vertices. On a geodesic of length $D$ in a component, select vertices at spacings $2 R +
    1$. Their radius-$R$ balls are pairwise disjoint, because distances between vertices on a geodesic equal their
    separations along it. All these balls lie on one side, which has at most $n$ vertices. Hence
  $ (⌊frac(D, 2 R + 1)⌋ + 1) rho n < n \, wide D < frac(2 R + 1, rho) . $
  Since $R = O \( log n \)$ and $L tilde.op c_0 log n$, a fixed $d$ bounds the last expression by $d
    L$ for all sufficiently large $n$. This proves the proposition simultaneously for all components. ◻
]

== 4 A bounded path estimate <sec:patterns>

We now use the word estimate of Lemma 4 to rule out short systems of paths with extensive label comparisons.
  An edge of the image graph may occur many times in these paths.
  The proof keeps track of this repetition by counting subgraphs at successive multiplicity levels.
  Comparisons then recover the square of the word weight needed for Lemma 4.
  We develop the multiplicity and block argument of #cite(label("OpenAI2026ZD")) Section “A bounded-pattern
  estimate” for the types constructed here.

A #emph[position] of a path means an edge traversal, so different positions may traverse the same edge of $Gamma$.
  A comparison consists of two disjoint intervals of positions of equal length,
  together with one of the following requirements: their words agree in the given orders,
  or their words are $t_1 dots.h.c t_h$ and $macron(t)_h dots.h.c macron(t)_1$.
  The comparisons in a system use disjoint positions. We allow cyclic intervals on a closed path.
  Throughout this section comparisons must also satisfy

#[#set math.equation(numbering: n => "(4.1)")
 $ upright("paired positions traverse distinct underlying undirected
 edges of ") Gamma upright(".") $ <eq:distinct-comparison-edges>]

Write $H$ for the sum of the path lengths and $b_0$ for the number of positions not used in a comparison.

#thm([Theorem 4.1.])[
  (Bounded path estimate).  #emph[There is a constant $epsilon > 0$,
    depending only on the fixed alphabet and turn weights, with the following property.
    For every integer $K_0 gt.eq 1$, real number $C gt.eq 1$, and integer $I gt.eq 0$,
    the probability under $bb(P)_L$ that $Gamma$ contains a system satisfying all the following conditions tends
    to zero as $n arrow.r oo$:]
  + #emph[There are at most $K_0$ positive-length paths. Each is closed and cyclically immersed,
    except possibly one immersed interval path whose initial vertex is $x_A$ or $x_B$.]
  + #emph[The total length satisfies $L lt.eq H lt.eq C L$.]
  + #emph[There are at most $I$ comparisons, satisfying (4.1), and $b_0 lt.eq epsilon H$.]
  #emph[In particular, $epsilon$ is chosen before $K_0 \, C \, I$.
    The threshold in $n$ and the rate of convergence may depend on these three bounds.]
] <thm:bounded-patterns>

Fix $K_0 \, C \, I$ for the proof. All constants described below as bounded may depend on these parameters and on
  the fixed alphabet. All $o \( L \)$ estimates are uniform over the systems and patterns satisfying these bounds.
  We always work under the conditional law $bb(P)_L$. Index each closed path by choosing a starting vertex.
  If a comparison crosses one of these indexing points, split both intervals of that comparison at the
  corresponding position. The number of resulting comparisons is still bounded in terms of $I$ and $K_0$,
  and their union of paired positions has not changed.

=== 4.1 The image graph and its multiplicity levels <the-image-graph-and-its-multiplicity-levels>

Let $Delta subset.eq Gamma$ be the image of a putative system. It has at most $C L$ edges and girth at least $L$.
  We first show that it has bounded topological complexity.
  Here the cycle rank of a finite graph is $\| E \| - \| V \| +$ the number of connected components.

#thm([Lemma 4.2.])[
  #emph[For fixed $C$, every finite graph of girth at least $L$ with at most $C L$ edges has bounded cycle rank,
    uniformly in $L$.]
] <lem:bounded-image-rank>

#proof[
  Delete vertices of degree at most one repeatedly; this does not change the cycle rank.
    Components of the remaining graph that are circles number at most $C$, since each has at least $L$ edges.
    Remove these components, and suppress every degree-two vertex in what remains.
    The resulting multigraph $D$, if nonempty, has minimum degree at least three.
    Give each edge of $D$ the positive integer length of the path it represents.
    The sum of these lengths is at most $C L$.
  Suppose $D$ has $r > 0$ edges. Choose a directed edge uniformly from the $2 r$ choices,
    then take a non-backtracking walk with $k$ directed edges, choosing each continuation uniformly.
    The uniform law on directed edges is stationary: a directed edge starting at $z$ has $deg \( z \) -
    1$ allowed predecessors, each of which chooses it with probability $1 \/ \( deg \( z \) - 1 \)$.
    Thus the expected sum of the inherited lengths along the walk is at most $k C L \/ r$.
    Markov’s inequality puts at least half of the probability on walks of length at most $2 k C L \/ r$.
    Since every individual walk has probability at most $\( 2 r \)^(- 1) 2^(- \( k - 1 \))$,
    there are at least $r 2^(k - 1)$ such short walks.
  Take $k = ceil.l log_2 \( 8 r \) ceil.r + 1$. Then $r 2^(k - 1) > \( 2 r \)^2$,
    whereas there are at most $\( 2 r \)^2$ ordered pairs of endpoint vertices.
    Two distinct short walks therefore have the same endpoints.
    Expanding their edges gives distinct reduced paths in the original graph. Their union contains a cycle:
    in a forest there is only one reduced path between any two vertices.
    This cycle has length at most $4 k C L \/ r$, so the girth bound implies
  $ r lt.eq 4 C #scale(x: 120%, y: 120%)[\(] ceil.l log_2 \( 8 r \) ceil.r + 1 #scale(x: 120%, y: 120%)[\)] . $
  The right side grows logarithmically with $r$, and hence this inequality bounds $r$ in terms of $C$.
    Suppression preserves cycle rank, whose contribution from $D$ is at most $r$;
    the removed circle components contribute at most $C$. ◻
]

Mark every vertex of $Delta$ whose degree differs from two,
  and also every initial and terminal vertex of our indexed paths. There are no isolated vertices.
  A leaf can occur only as an endpoint of the possible interval path, because every other path turn is immersed.
  There are therefore at most two leaves. To see explicitly that the remaining marks are bounded,
  write $beta$ for the cycle rank and $c$ for the number of components. The degree sum gives

$ sum_(deg \( z \) gt.eq 3) \( deg \( z \) - 2 \) = 2 beta - 2 c + \# { z : deg \( z \) = 1 } . $

Lemma 8 bounds both the number and the total degree of vertices of degree at least three.
  There are at most $2 K_0$ additional path-endpoint marks. Each component contains a path start.
  Consequently $Delta$ is the union of a bounded number of #emph[chains], that is,
  paths between marked vertices with disjoint, unmarked degree-two interiors.
  A chain may have the same marked vertex at both ends. Choose an orientation on every chain.

Every path traverses whole chains. Let $m_e$ be the total number of traversals of the undirected edge $e$ by the
  entire path system. This multiplicity is constant on the edges of each chain.
  Two successive uses of the same oriented edge by a single indexed path have starting positions separated by at
  least $L$: the intervening path from the initial vertex of that edge back to itself is a nonempty reduced closed
  walk and contains a cycle. For a path of length $h$, each orientation can therefore occur at most $h \/ L +
  1$ times. Summing over paths and the two orientations yields

#[#set math.equation(numbering: n => "(4.2)")
 $ m_e lt.eq 2 \( H \/ L + K_0 \) lt.eq 2 \( C + K_0 \) \, wide M :=
   ceil.l 2 \( C + K_0 \) ceil.r . $ <eq:bounded-multiplicity>]

An #emph[unlabelled pattern] records the finite marked chain graph, its positive chain lengths,
  the side $A$ or $B$ of each component, the indexed paths as sequences of oriented chain traversals,
  and the endpoints and directions of the comparisons. It records whether there is an interval path and, if so,
  which root is its initial vertex. Only patterns having the structure just proved and satisfying (4.1) are
  retained. The underlying graph in a pattern is an image graph:
  a realization must map its vertices and edges injectively into the appropriate sides of $Gamma$.

There are boundedly many chain traversals by (4.2). All lengths and comparison endpoints are integers between $0$
  and $C L$. Hence the number of unlabelled patterns is polynomial in $L$.
  This includes the finitely many choices of chain graph, traversal sequences, sides, and interval designation.

For a pattern, let $m_(*) := max_e m_e lt.eq M$. Its #emph[stage $j$ graph] $Delta_j$ consists of all edges with
  $m_e gt.eq j$ and their endpoints, for $1 lt.eq j lt.eq m_(*)$.
  Write $V_j$ and $E_j$ for its numbers of vertices and edges.
  Let $iota$ be $1$ if there is an interval path and $0$ otherwise, and put

$ k_1 = iota \, wide k_j = 0 quad \( j > 1 \) . $

We will fix the prescribed root only when counting stage one.
  This loss of a factor $n$ pays precisely for the two possible unpaired path endpoints in the following incidence
  estimate.

#thm([Lemma 4.3.])[
  #emph[The stage graphs satisfy
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(j = 1)^(m_(*)) E_j = H \, wide sum_(j = 1)^(m_(*)) V_j lt.eq H + iota \, wide
   sum_(j = 1)^(m_(*)) \( V_j - E_j - k_j \) lt.eq 0 . $ <eq:stage-incidence>]

]
] <lem:multiplicity-incidence>

#proof[
  The first identity counts an edge once at each of its $m_e$ stages.
    At a vertex $z$, put $a \( z \)$ equal to the number of interval endpoints located there,
    counting both if they coincide; then $sum_z a \( z \) = 2 iota$.
    Every other traversal incidence is paired, by a path turn, with an incidence on a different half-edge.
    For any particular half-edge at $z$, all but at most $a \( z \)$ of its $m_e$ incidences must therefore be
    paired with the other half-edges. For sufficiently large $n$, $L > 2$, so $Delta$ has no loops; it follows that
  $ 2 max_(e in.rev z) m_e lt.eq sum_(e in.rev z) m_e + a \( z \) . $
  A vertex occurs at exactly $max_(e in.rev z) m_e$ stages.
    Summing this inequality over vertices gives $sum_j V_j lt.eq sum_e m_e + iota = H + iota$.
    Since $sum_j k_j = iota$, the last assertion follows. ◻
]

=== 4.2 One grid for all comparisons <one-grid-for-all-comparisons>

The role of (4.3) is visible in the embedding count. For fixed labels, choosing $V_j$ vertices,
  prescribing $E_j$ distinct edges, and fixing $k_j$ roots leave a factor $n^(V_j - E_j - k_j)$.
  Apart from factors subexponential in $L$, the turn frequencies also supply one word weight for each chain.
  Thus (4.3) permits us to combine the stage estimates without a positive net power of $n$.
  It remains to sum over labels compatible with the comparisons; the precise embedding count appears in (4.11) below.

For orientation, suppose two edge-disjoint chain segments are required to carry the same word $W$.
  Their turn-weight contribution is $P \( W \)^2$, although only one word is free to vary.
  The same holds for inverse words because $P \( W^(- 1) \) = P \( W \)$. Lemma 4 then supplies exponential decay.
  In the actual system, the comparison endpoints need not line up, and chains can be traversed repeatedly.
  We now subdivide the chains into long words whose boundaries nearly agree across comparisons;
  the multiplicity stages will account for the repeated traversals.

Fix an unlabelled pattern. Give each oriented chain coordinates from $0$ to its length,
  putting edge positions at half-integers. Split a comparison whenever either of its path intervals crosses a
  chain end. The bounded number of chain traversals gives a bounded number of resulting subcomparisons.
  In chain coordinates each is a restriction of

#[#set math.equation(numbering: n => "(4.4)")
 $ x mapsto sigma x + a \, wide sigma in { 1 \, - 1 } \, quad a in bb(Z) . $ <eq:comparison-affine-map>]

If $sigma = 1$, the labels in chain orientation agree; if $sigma = - 1$, they are inverse.
  This follows by incorporating into the comparison the orientation of each of its two chain traversals.

We need blocks whose grids agree approximately under every map in (4.4).
  Choose a fixed integer $d_1 gt.eq 1$ bounding the number of offsets, padding their list with zeros when necessary. Put

$ N = ⌊L^(1 \/ \( 2 \( d_1 + 1 \) \))⌋ \, wide R = floor.l sqrt(N) floor.r . $

Partition $\[ 0 \, 1 \)^(d_1)$ into $N^(d_1)$ boxes of side $1 \/ N$.
  Among the $N^(d_1) + 1$ vectors with coordinates ${ ell a \/ L }$, $0 lt.eq ell lt.eq N^(d_1)$,
  two lie in the same box. Subtracting their indices gives $1 lt.eq u lt.eq N^(d_1)$ such that

$ "dist" \( u a \/ L \, bb(Z) \) lt.eq 1 \/ N quad upright("for every offset ") a . $

Choose one such $u$ deterministically from the pattern and set

#[#set math.equation(numbering: n => "(4.5)")
 $ s := frac(L, u R) . $ <eq:block-scale>]

Uniformly over patterns,

$ frac(L, N^(d_1) sqrt(N)) lt.eq s lt.eq L / R \, wide "dist" \( a \/ s \, bb(Z) \) lt.eq R \/ N . $

In particular, $s arrow.r oo$, $s = o \( L \)$, and all the distances in the last display tend to zero.
  The lower bound even gives $s gt.eq L^(\( d_1 + 3 \/ 2 \) \/ \( 2 \( d_1 + 1 \) \))$ for large $L$,
  so all estimates involving $L \/ s$ are uniform.

On each chain take the edge positions lying in grid intervals $\[ k s \, \( k + 1 \) s \)$ contained in its
  coordinate interval. These sets are the #emph[full blocks]. The final fragment has fewer than $s + 1$ positions.
  Index underlying full blocks by $i$, and write $h_i$ for their lengths and $m_i$ for their chain multiplicities.
  Thus $h_i = s + O \( 1 \)$ and $1 lt.eq m_i lt.eq M$. Every traversal of a chain uses the same subdivision;
  a block $i$ therefore has $m_i$ separate occurrences in the path system.

Choose $kappa = kappa_L > 0$ tending to zero, large enough to dominate the grid displacement $R \/
  N$ and the rounding error $10 \/ s$. For each subcomparison,
  match two full-block occurrences if it compares contiguous portions of these occurrences of length at least
  $\( 1 - kappa \) s$. Record the entire substring constraint on that overlap.
  For large $L$ this gives a partial matching of occurrences.
  Indeed, the matched portion occupies more than half of each block.
  Two different proposed matches incident to the same occurrence would therefore overlap,
  contrary to the disjointness of all compared positions. The match is recorded only once,
  irrespective of which of its two occurrences is considered first.

We next bound the full-block occurrences left unmatched. Exclude the boundedly many block occurrences within
  distance $3 s + O \( 1 \)$ of a subcomparison endpoint or a chain end,
  measuring distance along the corresponding traversal. A remaining block occurrence either has every position
  unpaired, or lies wholly inside one subcomparison. In the latter case its grid interval maps under (4.4) to an
  interval displaced by at most $\( R \/ N \) s$ from a grid interval on the partner chain.
  Reflection may exchange open and closed endpoints, changing the number of half-integer positions by at most two.
  The partner interval is full, because the source block is also far from the corresponding subcomparison ends.
  The two blocks consequently overlap in at least $\( 1 - kappa \) s$ compared positions, and are matched.

Let $b_(*)$ be the number of unmatched full-block occurrences. There are $O \( L \/ s \)$ occurrences altogether.
  Each unmatched occurrence outside the bounded exceptional collection contributes at least $s -
  1$ unpaired positions. It follows that

#[#set math.equation(numbering: n => "(4.6)")
 $ s b_(*) lt.eq b_0 + O \( s + L \/ s \) = b_0 + o \( L \) . $ <eq:block-unmatched-budget>]

The constants here count subcomparison ends and chain traversals, not individual edges.

Now forget the occurrence indices while retaining all matches and their substring constraints.
  This gives a multigraph on the underlying blocks; call its edges #emph[links].
  A link whose two occurrences belong to the same underlying block is a #emph[self-link].
  Isolated blocks are included as components. For a component $cal(U)$, put

#[#set math.equation(numbering: n => "(4.7)")
 $ S_(cal(U)) = sum_(i in cal(U)) m_i \, wide z_(cal(U)) = max_(i in cal(U)) m_i \, wide
   b_(cal(U)) = \# { upright("unmatched occurrences of blocks in ") cal(U) } . $ <eq:link-component-parameters>]

In particular, $sum_(cal(U)) b_(cal(U)) = b_(*)$. Figure 1 illustrates the nearly aligned grids and the
  distinction between occurrences and underlying blocks.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 4.05), [#text(size: 9pt)[\(a\) Nearly aligned blocks]], anchor: "west", padding: 0.1176cm)
  content((3.5, 3.48), [#text(size: 9pt)[$f(x)= plus.minus x+a$]])
  rect((1.4, 2.75), (5.35, 3.05), fill: rgb("#d1d1d1"), stroke: none)
  rect((1.4, 1.95), (5.35, 2.25), fill: rgb("#d1d1d1"), stroke: none)
  rect((1.4, 2.75), (5.6, 3.05), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  rect((1.15, 1.95), (5.35, 2.25), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((1, 2.9), [#text(size: 9pt)[$f(B_i)$]], anchor: "east", padding: 0.1176cm)
  content((1, 2.1), [#text(size: 9pt)[$B_j$]], anchor: "east", padding: 0.1176cm)
  line((1.4, 1.7), (1.4, 3.18), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((5.35, 1.7), (5.35, 3.18), stroke: (paint: rgb("#737373"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((1.4, 1.45), (5.35, 1.45), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((3.38, 0.9), [#text(size: 9pt)[$J$: compared portion#linebreak()$|J| gt.eq (1- kappa )s, kappa =o(1)$]])
  content((3.38, 0.2), [#text(size: 8pt)[Each full block has $s+O(1)$ positions.]])
  content((7, 4.05), [#text(size: 9pt)[\(b\) Occurrences and underlying blocks]], anchor: "west", padding: 0.1176cm)
  content((7.05, 3.52), [#text(size: 8pt)[Two disjoint occurrence matches]], anchor: "west", padding: 0.1176cm)
  content((8.15, 2.93), [#box(width: 1.02cm, height: 0.48cm, inset: 0.3333em, radius: 1pt, stroke: (thickness: 0.4pt, cap: "round", join: "round"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i^((1))$]]])])
  content((11.65, 2.93), [#box(width: 1.02cm, height: 0.48cm, inset: 0.3333em, radius: 1pt, stroke: (thickness: 0.4pt, cap: "round", join: "round"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$j^((1))$]]])])
  content((8.15, 2.18), [#box(width: 1.02cm, height: 0.48cm, inset: 0.3333em, radius: 1pt, stroke: (thickness: 0.4pt, cap: "round", join: "round"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i^((2))$]]])])
  content((11.65, 2.18), [#box(width: 1.02cm, height: 0.48cm, inset: 0.3333em, radius: 1pt, stroke: (thickness: 0.4pt, cap: "round", join: "round"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$k^((1))$]]])])
  line((8.66, 2.93), (11.14, 2.93), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((8.66, 2.18), (11.14, 2.18), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((9.9, 1.75), (9.9, 1.15), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", fill: black)))
  content((9.9, 1.45), [#text(size: 8pt)[forget occurrence indices]], anchor: "west", padding: 0.1176cm)
  content((8.15, 0.64), [#text(size: 9pt)[$j$]], frame: "circle", padding: 0.08819cm, stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((9.9, 0.64), [#text(size: 9pt)[$i$]], frame: "circle", padding: 0.08819cm, fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((11.65, 0.64), [#text(size: 9pt)[$k$]], frame: "circle", padding: 0.08819cm, stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((8.15, 0.64), (9.9, 0.64), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((9.9, 0.64), (11.65, 0.64), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((9.9, 0.02), [#text(size: 8pt)[One underlying block $i$, two links]])
})],
  caption: [Figure 1: Aligned blocks and the two levels of comparison. In (a), away from subcomparison ends, the image of a full grid interval is displaced by $o \( s \)$ from a partner grid interval; the shaded portion $J$ records a comparison of $s - o \( s \)$ positions. Reflection reverses order and inverts letters. The intervals and their small end discrepancies are schematic. In (b), $i^(\( r \))$ denotes the $r$th occurrence of block $i$. Occurrence joins form a partial matching, but forgetting the occurrence indices can give several links at one underlying block. ],
) <fig:aligned-blocks>

#thm([Lemma 4.4.])[
  #emph[There is a number $rho_L arrow.r 0$, uniform over patterns, with the following properties.
    Every word assignment counted in this lemma is required to be reduced on each block.]
  + #emph[Given the reduced word on one block of a link component $cal(U)$,
    at most $exp \( rho_L s \| cal(U) \| \)$ assignments of words to all its blocks satisfy the link constraints.]
  + #emph[If $cal(U)$ contains a self-link, the total number of such assignments is at most
    $exp \( rho_L s \| cal(U) \| \)$.]
  + #emph[If $cal(U)$ has no self-link, then
#[#set math.equation(numbering: n => "(4.8)")
 $ 2 z_(cal(U)) lt.eq S_(cal(U)) + b_(cal(U)) . $ <eq:component-multiplicity>]

]
] <lem:link-word-counts>

#proof[
  Root a spanning tree of the link component at the block whose word is given.
    A link from a known block determines at least $\( 1 - kappa \) s$ letters of the next block,
    whose total length is at most $s + 1$. There are at most $\|
    T \|^(kappa s + 1)$ choices for its remaining letters. Multiplying along the tree proves the first assertion,
    even if we ignore reducedness and all links outside the tree when making this upper bound.
  For the second assertion, start with a block carrying a self-link.
    If its coordinate map is a translation, the constraint takes the form $t_x =
    t_(x + a)$ on at least $\( 1 - kappa \) s$ consecutive positions. The integer $a$ is nonzero:
    $a = 0$ would pair occurrences of the same underlying edge, violating (4.1).
    The equality graph on the $h_i$ positions is a forest. In fact all its edges have the same nonzero step,
    and within each residue class modulo $\| a \|$ they connect successive positions in their natural order.
    There are at least $\( 1 - kappa \) s$ distinct equality edges, leaving at most $h_i - \( 1 - kappa \) s lt.eq
    kappa s + 1$ components. Choosing one letter per component gives at most $\| T \|^(kappa s + 1)$ choices.
  A reflection self-link cannot occur with reduced block words.
    Let $J$ be the interval of positions on which the constraint reads $t_x = overline(t_(a - x))$.
    Its reflected image also lies in the same block, and both have more than half the block’s positions.
    Their intersection is therefore a nonempty interval invariant under reflection.
    If it has a central fixed position, the letter there would equal its inverse,
    contrary to the fixed-point-free involution on $T$. If it has no fixed position,
    its two central adjacent positions are reflections of each other and have inverse letters,
    contrary to reducedness. After counting the words on the initial self-linked block,
    propagate along a spanning tree as above. Enlarging $rho_L$ by a fixed factor proves the second assertion.
  Finally, choose a block with $m_i = z_(cal(U))$. If there is no self-link,
    every matched occurrence of this block has its partner among the $S_(cal(U)) -
    z_(cal(U))$ occurrences of other blocks. There are at least $z_(cal(U)) -
    b_(cal(U))$ such matched occurrences, and distinct occurrences have distinct partners.
    Hence $z_(cal(U)) - b_(cal(U)) lt.eq S_(cal(U)) - z_(cal(U))$, which is (4.8). ◻
]

=== 4.3 Word bins and stage expectations <word-bins-and-stage-expectations>

The link constraints make the number of free words small.
  To combine this fact with the probability of embedding a labelled graph,
  we must also retain each block’s word weight. For its word $W_i$, in the chosen chain orientation, record the integer

$ d_i := floor.l - log P \( W_i \) floor.r . $

All these words are reduced. Since the fixed collection of positive turn weights has a positive minimum,
  there is a constant $a_0 > 0$ depending only on those weights such that, for large $L$,

#[#set math.equation(numbering: n => "(4.9)")
 $ frac(delta s, 2) lt.eq d_i lt.eq a_0 s \, wide \# { W in T^(h_i) : floor.l - log P \( W \) floor.r =
   d_i } lt.eq exp \( 2 d_i - delta s \) . $ <eq:word-bin-bounds>]

Here and below only positive-weight words are counted. For completeness, Lemma 4 implies $P \( W \)^2 lt.eq
  e^(- 2 delta h_i)$ for each word, so $d_i gt.eq delta h_i - 1 gt.eq delta s \/ 2$ for large $s$.
  The minimum turn weight gives the upper bound. Every word in the bin has $P \( W \) > e^(- d_i - 1)$,
  and therefore the number in the bin is at most

$ e^(2 d_i + 2) sum_(W in T^(h_i)) P \( W \)^2 lt.eq e^(2 d_i + 2 - 2 delta h_i) lt.eq e^(2 d_i - delta s) . $

These estimates are uniform because $h_i = s + O \( 1 \)$ and $s arrow.r oo$.

Enlarge the pattern by recording all $d_i$. There are $O \( L \/ s \)$ full blocks,
  each with $O \( s \)$ possible bins. Thus the logarithm of the number of bin choices is
  $O \( \( L \/ s \) log \( s + 2 \) \) = o \( L \)$. Together with the earlier polynomial count,
  the total number of enlarged patterns is

#[#set math.equation(numbering: n => "(4.10)")
 $ exp \( o \( L \) \) . $ <eq:pattern-entropy>]

The grid, occurrence matching, and link multigraph are determined by the unlabelled pattern,
  and introduce no further choices.

Fix one enlarged pattern. A full label assignment means labels on all edges of its abstract image graph,
  read inversely on reverse edges, giving an immersion into $F$ and satisfying the comparisons and bins.
  This is a condition on strings on the abstract graph; it does not require an embedding in the random graph.
  At stage $j$, consider the restrictions of all such full label assignments to $Delta_j$.
  Let $Z_j$ count their injective realizations in $Gamma$, with the component sides prescribed by the pattern,
  and with the root fixed if $k_j = 1$. Every realization of the original enlarged pattern gives $Z_j gt.eq
  1$ at every stage.

For a fixed one of these stage label assignments, the expected number of its realizations is at most

#[#set math.equation(numbering: n => "(4.11)")
 $ n^(V_j - E_j - k_j) exp (- sum_(i : m_i gt.eq j) d_i + o \( L \)) . $ <eq:fixed-stage-expectation>]

To prove this, let $Q_j$ be the number of active chains, that is, chains whose edges belong to $Delta_j$.
  They have exactly $E_j - Q_j$ unmarked internal vertices.
  At such a vertex the incoming and outgoing chain labels form a reduced turn $t \, u$,
  and (3.6) bounds its possible images on its prescribed side by

$ n p thin w \( t \, u \) + O \( 1 \) = n p thin w \( t \, u \) \( 1 + O \( 1 \/ n \) \) . $

At each remaining unfixed vertex use the upper bound $n$; a fixed root is marked and has only one choice.
  This bounds the number of possible vertex assignments by

$ n^(V_j - k_j) p^(E_j - Q_j) product_(upright("internal turns of active chains")) w \( t \, u \)
  exp \( O \( L \/ n \) \) . $

Restrict to the assignments that are injective and compatible with all vertex types.
  Each requires $E_j$ distinct edge prescriptions. Lemma 5 bounds their joint probability by $\( n p \)^(- E_j)
  exp \( o \( L \) \)$. Multiplication leaves $n^(V_j - E_j - k_j) p^(- Q_j)$ times the displayed turn product.
  The bounded factor $p^(- Q_j)$ is $exp \( o \( L \) \)$. Every turn weight is at most one,
  so discarding all factors except internal turns of full blocks increases the product. The remaining product is

$ product_(i : m_i gt.eq j) P \( W_i \) lt.eq exp (- sum_(i : m_i gt.eq j) d_i) \, $

which proves (4.11). This count uses injective realizations of the image graph;
  it does not replace distinct edge prescriptions by repeated traversals.

The number of stage label assignments has the bound

#[#set math.equation(numbering: n => "(4.12)")
 $ exp (o \( L \) + sum_(cal(U) upright(" without self-link")\
z_(cal(U)) gt.eq j) (2 min_(i in cal(U)) d_i - delta s)) . $ <eq:stage-label-count>]

Indeed, a link component is represented at stage $j$ exactly when $z_(cal(U)) gt.eq j$.
  The possible words on its represented blocks are projections of assignments on the entire link component.
  A projection has cardinality no larger than the set being projected.
  If the component has no self-link, choose a block attaining the minimum bin,
  even when that block is absent from stage $j$. Equation (4.9) gives at most $exp \( 2 min_i d_i - delta s \)$
  choices on this block, and Lemma 10 bounds the extensions by $exp \( rho_L s \| cal(U) \| \)$.
  If the component has a self-link, the second assertion of that lemma gives this last factor without any initial
  word choice. Constraints between different words, or at chain junctions, can only reduce these counts.

Summed over components, the propagation error is $rho_L s thin O \( L \/ s \) = o \( L \)$.
  There are only boundedly many chain end fragments, containing $O \( s \)$ positions in total;
  assigning their letters freely costs at most $\| T \|^(O \( s \)) = exp \( o \( L \) \)$.
  These observations prove (4.12). Requiring stage labels to extend as strings was essential:
  it permits the minimum-bin block to be used even at stages where it is absent.

Let $B_j$ be the product of the right sides of (4.11) and (4.12), choosing their uniform error bounds. Then

#[#set math.equation(numbering: n => "(4.13)")
 $ bb(E)_L Z_j lt.eq B_j \, wide bb(P)_L \( upright("the enlarged pattern is realized") \) lt.eq
   min_(1 lt.eq j lt.eq m_(*)) B_j . $ <eq:stage-markov>]

The second inequality is Markov’s inequality at each individual stage.
  We will now bound the minimum by multiplying the deterministic numbers $B_j$.

=== 4.4 Combining the stages <combining-the-stages>

#proof[
  Lemma 9 shows that the total exponent of $n$ in $product_(j = 1)^(m_(*)) B_j$ is nonpositive.
    For a component $cal(U)$ without a self-link, write $d_min = min_(i in cal(U)) d_i$.
    Its positive label-count term occurs at $z_(cal(U))$ stages; the negative term $- d_i$ occurs at $m_i$ stages.
    Its total contribution to the logarithm, apart from the uniform errors, is at most
  $ z_(cal(U)) \( 2 d_min - delta s \) - sum_(i in cal(U)) m_i d_i & lt.eq \( 2 z_(cal(U)) - S_(cal(U)) \) d_min -
    delta s z_(cal(U))\
 & lt.eq a_0 s b_(cal(U)) - frac(delta s, 2) S_(cal(U)) . $
  For the last inequality, if $2 z_(cal(U)) - S_(cal(U)) lt.eq 0$, use $d_min gt.eq
    delta s \/ 2$ to bound the preceding line by $- delta s S_(cal(U)) \/ 2$.
    If $2 z_(cal(U)) - S_(cal(U)) > 0$, use $d_min lt.eq a_0 s$ and $2 z_(cal(U)) - S_(cal(U)) lt.eq
    b_(cal(U))$ from (4.8); the remaining term satisfies $- delta s z_(cal(U)) lt.eq - delta s S_(cal(U)) \/ 2$.
  For a component with a self-link there is no positive label-count term, and (4.9) gives
  $ - sum_(i in cal(U)) m_i d_i lt.eq - frac(delta s, 2) S_(cal(U)) . $
  The full-block occurrences account for all positions except $O \( s \)$ positions in end fragments.
    Replacing their actual lengths $h_i = s + O \( 1 \)$ by $s$ changes the count by $O \( L \/ s \)$,
    because the multiplicities are bounded. Thus
  $ s sum_(cal(U)) S_(cal(U)) = H + O \( s + L \/ s \) = H + o \( L \) . $
  Equation (4.6) also gives $s sum_(cal(U)) b_(cal(U)) lt.eq b_0 + o \( L \)$.
    There are at most $M$ stages, so summing their uniform errors still gives $o \( L \)$. We conclude that
  #[#set math.equation(numbering: n => "(4.14)")
   $ log product_(j = 1)^(m_(*)) B_j lt.eq - delta / 2 H + a_0 b_0 + o \( L \) . $ <eq:stage-product>]
  Choose, once and for all,
  #[#set math.equation(numbering: n => "(4.15)")
   $ epsilon := min {1 / 4 \, frac(delta, 16 \( 1 + a_0 \))} . $ <eq:epsilon-choice>]
  Both $delta$ and $a_0$ depend only on the fixed alphabet and weights, so this choice is independent of $K_0 \,
    C \, I$. If $b_0 lt.eq epsilon H$ and $H gt.eq L$, the uniform error in (4.14) is small enough,
    for all sufficiently large $n$, that
  $ log product_(j = 1)^(m_(*)) B_j lt.eq - delta / 4 H . $
  Some stage therefore has
  $ B_j lt.eq exp (- frac(delta H, 4 m_(*))) lt.eq exp (- frac(delta H, 4 M)) . $
  Equation (4.13) bounds the realization probability of this enlarged pattern by the last expression.
    No independence of the stages has been used; a full realization must survive every one of their separate
    first-moment bounds. Finally, sum over the $exp \( o \( L \) \)$ enlarged patterns from (4.10) and use $H
    gt.eq L$. The resulting bound
  $ exp (- frac(delta L, 4 M) + o \( L \)) arrow.r 0 $
  proves the theorem, with the stated order of quantifiers. ◻
]

== 5 From spherical arrangements to bounded path systems <sec:planar>

Theorem 7 excludes path systems whose number of paths, total length in units of $L$,
  and number of comparison intervals are bounded. The topological argument will produce a planar pairing of paths
  with none of those bounds. We show that every such pairing yields a system covered by the theorem.
  Planarity has two roles: an Euler characteristic count organizes the pairing into few intervals,
  and a separator reduces the number of paths while losing few paired positions.
  This is the spherical-arrangement method of #cite(label("OpenAI2026ZD")) Section “From bounded patterns to
  spherical arrangements”; we include the geometric and quantitative details needed here.

#prodef([Definition 5.1.])[
  (Reduced spherical arrangement).  A #emph[reduced spherical arrangement over $Gamma$] consists of finitely many
    pairwise disjoint piecewise linear closed disks in an oriented sphere, together with the following data.
    Each boundary reads a positive-length cyclically immersed closed path in $Gamma$,
    except possibly one boundary. That boundary reads a positive-length immersed interval path starting at $x_A$
    or $x_B$, with its two endpoints represented at a single marked boundary point, called the #emph[break].
    No immersion condition is imposed across the break. At least one ordinary, cyclically immersed boundary is required.
  The paths are read in the boundary orientations induced by the disks.
    Their edge occurrences are paired in distinct twos by mutually disjoint piecewise linear arcs.
    The interiors of the arcs lie outside the disks, and each occurrence contains exactly one arc endpoint in its
    interior. Paired occurrences have inverse signed letters and use distinct underlying undirected edges of $Gamma$.
] <def:reduced-arrangement>

The distinction between occurrences and graph edges is essential:
  different occurrences may traverse the same edge, but the two ends of any one pairing arc may not.
  The graph obtained by collapsing each disk to a vertex may be disconnected and may have loops or parallel edges.

Proposition 16 will show that the absence of these arrangements makes the cone complex aspherical and protects the
  two roots. The present section proves that the random graphs can be chosen to have this absence property.

#thm([Theorem 5.2.])[
  (Absence of reduced spherical arrangements).  #emph[In the random matching model of Section 3,
    conditioned on girth at least $L$, the probability that $Gamma$ admits a reduced spherical arrangement tends
    to zero as $m equiv 1 med \( mod med 4 \)$ tends to infinity.
    Consequently, for every sufficiently large admissible $m$ there is a matching outcome with girth at least $L$,
    the component diameter bound of Proposition 6, and no reduced spherical arrangement.]
] <thm:no-arrangements>

We first establish the three deterministic tools used in the proof.
  The first closes path segments without changing any original occurrences. The other two depend only on planarity.

=== 5.1 Closing immersed segments <closing-immersed-segments>

Fix the constant $d$ of Proposition 6, and work for now with an outcome in which every component of $Gamma$ has
  diameter at most $d L$. Each side of $Gamma$ has at most $n$ vertices and minimum degree at least $129$.

#thm([Lemma 5.3.])[
  (Short closures).  #emph[There is a fixed integer $D_0$, depending only on $d$ and $c_0$,
    with the following property for all sufficiently large admissible $n$.
    If every component of $Gamma$ has diameter at most $d L$,
    then every positive-length immersed path segment in $Gamma$ extends to a cyclically immersed closed path by
    appending at most $D_0 L$ edges. The original segment is retained without cancellation. One may take any integer
$ D_0 gt.eq d + frac(8, c_0 log 2) + 8 . $

]
] <lem:closure>

#proof[
  We first construct a short based loop that avoids specified edges at its basepoint.
    For large $n$ we have $L gt.eq 3$, so the girth condition excludes loops and parallel edges.
    Delete at most two prescribed undirected edges incident to a vertex $z$.
    In the remaining graph every vertex still has degree at least $127$, and in particular at least three. With
  $ k = ceil.l log_2 n ceil.r + 1 \, $
  there are at least $3 dot.op 2^(k - 1) > n$ non-backtracking walks of length $k$ starting at $z$.
    Two distinct such walks, say $P$ and $Q$, end at the same vertex. Reduce $P Q^(- 1)$ as a linear path.
    Cancellation removes their common terminal segment. Since $P$ and $Q$ are distinct and have equal length,
    it does not remove either entire walk. We obtain a nonempty linearly immersed based loop of length at most $2
    k$; its first and last edges avoid the deleted edges. The loop need not be cyclically immersed at $z$.
  Let the given segment $S$ run from $a$ to $b$, and choose a geodesic $R$ from $b$ to $a$,
    of length at most $d L$. If $R$ is nonempty, construct a loop $J_b$ at $b$ avoiding the last edge of $S$ and
    the first edge of $R$, and a loop $J_a$ at $a$ avoiding the last edge of $R$ and the first edge of $S$. Then
  $ S J_b R J_a $
  is cyclically immersed: each constituent is immersed as a linear path,
    and each of the four joins avoids immediate reversal. If $R$ is empty, then $a = b$,
    and one loop at $a$ avoiding the first and last edges of $S$ makes $S J_a$ cyclically immersed.
    Thus the total added length is at most $d L + 4 k$ in either case.
    Finally, $L gt.eq \( c_0 \/ 2 \) log n$ and $L gt.eq 1$ for large $n$, so
  $ k lt.eq (frac(2, c_0 log 2) + 2) L . $
  This gives the stated choice of $D_0$. ◻
]

=== 5.2 Organizing the pairing into intervals <organizing-the-pairing-into-intervals>

We next count how often a planar pairing can change its consecutive partner interval.
  A pair of neighboring arc ends usually has another neighboring pair opposite it across a digon.
  Only the other gaps, and the places where we choose to split a path, require interval cuts.
  This is the linear comparison-interval argument of #cite(label("OpenAI2026ZD")) Lemma 4.3.

#thm([Lemma 5.4.])[
  (Paired intervals).  #emph[Suppose a reduced spherical arrangement with $N_0$ disk boundaries is divided into
    $N' gt.eq N_0$ pieces by cutting its paths into consecutive segments.
    An intact path counts as one piece, and no piece crosses the exceptional break.
    Then all original occurrence pairings can be represented by at most $6 N'$ disjoint pairs of intervals.
    Each interval is contained in one designated piece, and each pair compares inverse strings in reverse boundary
    order. The intervals can also be required not to cross one prescribed indexing gap between occurrences on each
    original path, using the break as the exceptional indexing gap.]
] <lem:paired-intervals>

#proof[
  Thicken the disks and the pairing arcs to a closed regular neighborhood $R$ made of disks and rectangular bands.
    Write $E$ for the number of bands, or equivalently the number of pairing arcs.
    A #emph[gap] is the portion of an original disk boundary between successive arc ends in cyclic order.
    After thickening, each gap gives a corner of a complementary region.
    For each connected component $Q$ of $S^2 \\ "int" R$, let $ell_Q$ be the number of band sides along its
    boundary, counting incidences. This is also its number of gap incidences.
    Every disk has positive boundary length and every occurrence is paired,
    so every boundary component of $R$ encounters a band and $ell_Q gt.eq 1$.
  The neighborhood $R$ retracts to the graph with $N_0$ vertices and $E$ edges.
    Additivity of Euler characteristic when surfaces are glued along boundary circles therefore gives
  $ chi \( R \) = N_0 - E \, wide sum_Q chi \( Q \) = 2 - N_0 + E \, wide sum_Q ell_Q = 2 E . $
  In particular,
  #[#set math.equation(numbering: n => "(5.1)")
   $ sum_Q #scale(x: 120%, y: 120%)[\(] ell_Q - 2 chi \( Q \) #scale(x: 120%, y: 120%)[\)] = 2 N_0 -
     4 . $ <eq:arrangement-euler>]
  This identity does not require $R$ to be connected; the regions $Q$ may have several boundary components.
  Call a gap #emph[good] if its region $Q$ is a disk digon whose two sides belong to distinct bands.
    The two corners of such a digon are opposite good gaps. Figure 2 shows how coherent boundary orientations
    reverse the order of occurrences across such a digon.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0.6, 2.2), (6.35, 2.83), fill: rgb("#e6e6e6"), stroke: none)
  rect((0.6, -0.23), (6.35, 0.4), fill: rgb("#e6e6e6"), stroke: none)
  rect((2.03, 0.4), (2.37, 2.2), fill: rgb("#cccccc"), stroke: none)
  rect((4.63, 0.4), (4.97, 2.2), fill: rgb("#cccccc"), stroke: none)
  line((0.6, 2.2), (6.35, 2.2), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((0.6, 0.4), (6.35, 0.4), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((2.03, 0.4), (2.03, 2.2), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((2.37, 0.4), (2.37, 2.2), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((4.63, 0.4), (4.63, 2.2), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((4.97, 0.4), (4.97, 2.2), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((5.47, 2.2), (6.07, 2.2), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", fill: black)))
  line((6.07, 0.4), (5.47, 0.4), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", fill: black)))
  content((2.2, 2.55), [#text(size: 9pt)[$e$]])
  content((4.8, 2.55), [#text(size: 9pt)[$f$]])
  content((2.2, 0.04), [#text(size: 9pt)[$e'$]])
  content((4.8, 0.04), [#text(size: 9pt)[$f'$]])
  content((3.5, 1.3), [#text(size: 9pt)[$Q$]])
  content((3.5, 0.91), [#text(size: 8pt)[disk digon]])
  line((3.5, 2.06), (3.5, 2.34), stroke: (thickness: 1.0pt, cap: "round", join: "round"))
  line((3.5, 0.26), (3.5, 0.54), stroke: (thickness: 1.0pt, cap: "round", join: "round"))
  content((3.5, 2.57), [#text(size: 8pt)[good gap]])
  content((3.5, 0.02), [#text(size: 8pt)[opposite gap]])
  content((2.2, 1.3), [#text(size: 8pt)[band]], angle: 90deg)
  content((4.8, 1.3), [#text(size: 8pt)[band]], angle: 90deg)
  content((7.02, 1.9), [#text(size: 9pt)[Coherent boundary orders:#linebreak()$e,f$ and $f',e'$]], anchor: "west", padding: 0.1176cm)
  content((7.02, 0.74), [#text(size: 8pt)[The ticks mark opposite gaps.#linebreak()A cut at one is copied to the other.]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 2: A good gap and its opposite gap, shown locally between two distinct bands. The complementary region $Q$ is a disk digon. The coherent boundary orientations reverse the order of the paired occurrences: $e \, f$ on one boundary correspond to $f' \, e'$ on the other. Thus an indexing or splitting cut at a good gap must also cut its opposite gap, so that the remaining runs pair as whole intervals. The symbols denote occurrences, not underlying edges of $Gamma$; shading only distinguishes disk portions and bands in the surface. ],
  ) <fig:good-digon>
  Let $B$ be the number of gaps that are not good. We bound $B$ by treating the possible complementary regions as
    follows.
  A disk monogon has one gap between two occurrences joined by the same pairing arc.
    Those neighboring letters are inverse. Immersion rules this out except at the exceptional break,
    so the number $M$ of disk monogons is at most one. Their total contribution to Equation (5.1) is $- M$.
  A disk digon using the same band twice turns immediately back along that band at an endpoint.
    The associated gap is the sole gap at a disk with only one incident arc end:
    otherwise another band end would intervene in its cyclic order.
    Different such digons use different degree-one gaps. Hence there are at most $N_0$ such digons and at most $2
    N_0$ gaps on them.
  Every remaining region is either a disk with $ell_Q gt.eq 3$,
    or a connected planar surface with at least two boundary components.
    In the first case $ell_Q lt.eq 3 \( ell_Q - 2 \)$; in the second case $chi \( Q \) lt.eq 0$,
    and the stronger inequality $ell_Q lt.eq ell_Q - 2 chi \( Q \)$ holds.
    These regions have positive contributions to Equation (5.1), with total $2 N_0 - 4 + M$.
    Digons contribute zero. It follows that
  #[#set math.equation(numbering: n => "(5.2)")
   $ B lt.eq M + 2 N_0 + 3 \( 2 N_0 - 4 + M \) lt.eq 8 N_0 . $ <eq:non-good-gaps>]
  Across a good digon, the partners of consecutive occurrences $e \,
    f$ occur consecutively in the opposite order $f' \, e'$. Taking opposite corners is thus an involution on good
    gaps. Cut every original boundary at every non-good gap. Also mark its prescribed indexing gap,
    using the break on the exceptional boundary, and mark all gaps used in dividing the paths into the designated
    pieces. These extra marks number at most $N_0 + N'$. For each marked good gap,
    cut both it and its opposite gap. The resulting cut set is stable under the good-gap involution,
    and its cardinality $J$ satisfies
  $ J lt.eq B + 2 \( N_0 + N' \) lt.eq 12 N' . $
  Every boundary has a cut, so the remaining consecutive runs of occurrences are linear intervals.
    All of them lie within designated pieces. Pairing reverses each uncut adjacency,
    and stability of the cuts ensures that it takes a whole maximal run onto another whole maximal run.
    A run cannot be paired with itself. For an odd-length run this would fix its middle occurrence,
    whereas occurrences are paired in distinct twos. For an even-length run it would pair the two middle
    occurrences and make their adjacent letters inverse. That contradicts immersion inside the run;
    the exceptional break has been cut. The $J$ runs therefore pair in distinct twos, giving at most $J \/ 2 lt.eq
    6 N'$ interval pairs as claimed. ◻
]

=== 5.3 A recursive separator bound <a-recursive-separator-bound>

Once a long boundary has been divided into pieces of controlled length,
  deleting a small fraction of the pieces loses only a small fraction of all occurrences.
  The following consequence of the planar separator theorem, also used in #cite(label("OpenAI2026ZD")) Lemma 4.4,
  makes the remaining groups of pieces bounded in size.

#thm([Lemma 5.5.])[
  (Recursive planar separation).  #emph[Let
$ C_(upright("sep")) = frac(2 sqrt(2), 1 - sqrt(2 \/ 3)) . $

 For every integer $K_0 gt.eq 1$, a finite planar multigraph with $N'$ vertices has a set of at most
   $C_(upright("sep")) N' \/ sqrt(K_0)$ vertices whose deletion leaves every connected component with at most
   $K_0$ vertices.]
] <lem:separator>

#proof[
  Deleting loops and replacing parallel edges by single edges preserves the components after every possible vertex
    deletion, so it suffices to consider a simple planar graph.
    The Lipton–Tarjan separator theorem #cite(label("LiptonTarjan1979")) gives,
    for a simple planar graph on $s$ vertices, a set of at most $2
    sqrt(2 s)$ vertices whose removal leaves components with at most $2 s \/ 3$ vertices.
    Apply this theorem recursively to each component with more than $K_0$ vertices,
    starting separately on the original connected components.
  At a recursive call on $s > K_0$ vertices, charge each of those vertices $2 sqrt(2) \/ sqrt(s)$.
    The total charge at that call is $2 sqrt(2 s)$ and bounds the number of vertices removed there.
    Follow any fixed original vertex through the calls containing it,
    until it is deleted or belongs to a component of size at most $K_0$.
    The successive charged component sizes decrease by a factor at most $2 \/ 3$.
    Reading backwards from the last charged size, which is greater than $K_0$, bounds its total charge by
  $ frac(2 sqrt(2), sqrt(K_0)) sum_(j gt.eq 0) \( 2 \/ 3 \)^(j \/ 2) = C_(upright("sep")) / sqrt(K_0) . $
  This applies also to a vertex deleted by a separator. Summing the charges over all $N'$ original vertices bounds
    the total number deleted and proves the lemma. ◻
]

=== 5.4 Extracting one bounded path system <extracting-one-bounded-path-system>

We now combine these tools. The original paths will first be divided and closed, then separated into clusters.
  We retain a cluster whose proportion of unpaired occurrences and number of interval pairs are both small.
  Controlling the total losses, rather than those of every cluster, is enough to find one such cluster.

#proof[
  Let $epsilon > 0$ be the constant in Theorem 7, independent of its fixed bounds $K_0 \, C \, I$.
    Fix $d$ from Proposition 6 and $D_0$ from Lemma 13. We will cut long boundaries into pieces with at most $U
    L$ original occurrences, pay at most $D_0 L$ to close each cut piece,
    and delete at most an $eta$ fraction of the pieces. We choose $U$ large enough to make the closure overhead
    small and $eta$ small enough to control the occurrences lost in separation.
    Specifically, choose the following constants in order:
  #[#set math.equation(numbering: n => "(5.3)")
   $ U & gt.eq max { 3 \, ceil.l 96 D_0 \/ epsilon ceil.r } \, &  & U upright(" an integer") \,\
eta & = min { 1 \/ \( 32 U \) \, epsilon \/ \( 64 U \) } \, wide K_0 = max { 1 \,
  ceil.l \( C_(upright("sep")) \/ eta \)^2 ceil.r } \,\
C & = K_0 \( U + D_0 \) \, wide I = ceil.l 192 C ceil.r . $ <eq:extraction-constants>]
  In particular,
  #[#set math.equation(numbering: n => "(5.4)")
   $ frac(3 D_0, U) lt.eq epsilon / 32 \, wide 2 eta U lt.eq 1 / 16 \, wide 2 eta U lt.eq epsilon /
     32 . $ <eq:extraction-losses>]
  All these constants are fixed before $n = v m$ tends to infinity through $m equiv 1 med \( mod med 4 \)$.
    Their order of dependence is
  $ \( upright("types") \, c_0 \, delta \) med \; quad \( epsilon \, d \) med \; quad D_0 med \; quad U med \;
    quad eta med \; quad K_0 med \; quad \( C \, I \) med \; quad n . $
  Suppose there is a reduced spherical arrangement on an outcome satisfying the diameter bound.
    Let $N_0$ be its number of boundaries and $H_0$ their total length.
    An ordinary boundary is present, and girth gives $H_0 gt.eq L$.
  Keep every path of length at most $U L$ intact. For a longer path of length $h$, put $r =
    ceil.l h \/ \( U L \) ceil.r$ and divide it into $r$ consecutive segments whose integer lengths differ by at
    most one. For large $L$ each segment has length between $U L \/ 3$ and $U L$:
    $h \/ r > U L \/ 2$, so $floor.l h \/ r floor.r gt.eq U L \/ 3$ when $U L gt.eq 6$,
    while $ceil.l h \/ r ceil.r lt.eq U L$. Use the linear order from the root on an exceptional path,
    so no segment crosses its break. Close each segment of every path that was split using Lemma 13.
    Every newly appended occurrence is left unpaired; intact paths receive no added edges.
  Let $N'$ be the number of resulting paths, and let $H_(upright("add"))$ be their total added length.
    Each resulting path contains at most $U L$ original occurrences and has total length at most $\( U + D_0 \)
    L$. Since a split path contributes at most $3 h \/ \( U L \)$ pieces,
  #[#set math.equation(numbering: n => "(5.5)")
   $ H_(upright("add")) lt.eq frac(3 D_0, U) H_0 . $ <eq:added-length>]
  Every piece has at least $L$ original occurrences, by girth for intact ordinary paths and by $U L \/ 3 gt.eq
    L$ for split paths, except possibly the one intact exceptional path. Thus
  #[#set math.equation(numbering: n => "(5.6)")
   $ N_0 lt.eq N' \, wide N' L lt.eq H_0 + L lt.eq 2 H_0 . $ <eq:extraction-piece-count>]
  If the exceptional path was split, all its pieces have become closed cyclically immersed paths.
    Otherwise it remains a single immersed interval starting at its original root.
  Apply Lemma 14 before the closures are appended. The original pairing is specified by at most $6
    N'$ interval pairs, each lying in its designated pieces. Choose the indexing points of intact ordinary paths
    as in that lemma; index every newly closed path with its original segment followed by its closure.
    The interval comparisons therefore remain valid in the indexed resulting paths.
  Form a multigraph whose vertices are the $N'$ pieces and whose edges are the original pairing arcs.
    It is planar: within each old disk, replace its vertex by one vertex for each consecutive block of arc ends
    belonging to a piece. Each block can be connected to its new vertex inside a separate sector of the disk.
    This produces disjoint connections, also for original arcs with both ends at the same disk.
    The appended closures have no pairing arcs and play no role in this embedding.
  By Lemma 15 and the choice of $K_0$, delete at most $eta N'$ vertices,
    leaving components with at most $K_0$ pieces. Call these components #emph[clusters].
    If $M_(upright("del"))$ is the number of original occurrences in deleted pieces, then
  #[#set math.equation(numbering: n => "(5.7)")
   $ M_(upright("del")) lt.eq eta N' U L lt.eq 2 eta U H_0 . $ <eq:deleted-occurrences>]
  Keep an original pairing precisely when both of its pieces survive.
    At most $M_(upright("del"))$ surviving original occurrences lose their partners,
    because each deleted occurrence had just one partner. An interval pair is either wholly retained or wholly
    discarded: each of its two intervals lies in one piece. Every retained pair belongs to a single cluster.
  For each cluster $Z$, denote its total path length by $H_Z$, including added closures,
    its number of unpaired occurrences by $b_Z$, and its number of retained interval pairs by $I_Z$.
    Equations (5.5)–(5.7) and the parameter choices give
  #[#set math.equation(numbering: n => "(5.8)")
   $ sum_Z H_Z & gt.eq H_0 - M_(upright("del")) gt.eq 15 H_0 \/ 16 \, & H_Z & lt.eq K_0 \( U + D_0 \) L = C L \,\
sum_Z b_Z & lt.eq M_(upright("del")) + H_(upright("add")) lt.eq epsilon H_0 \/ 16 \, & sum_Z I_Z & lt.eq
  6 N' lt.eq 12 H_0 \/ L . $ <eq:cluster-budgets>]
  These are totals over all remaining clusters; an individual cluster need not yet satisfy the bounded-pattern
    conditions.
  Discard all clusters with $b_Z > epsilon H_Z$. Their total length is at most $epsilon^(- 1) sum_Z b_Z lt.eq
    H_0 \/ 16$. Also discard all clusters with $I_Z > 192 H_Z \/ L$.
    Their total length is at most $\( L \/ 192 \) sum_Z I_Z lt.eq H_0 \/ 16$.
    After these two exclusions, at least $13 H_0 \/ 16$ of cluster length remains.
  A cluster with $H_Z < L$ contains no positive-length cyclically immersed path, by girth.
    It can therefore consist only of the one intact exceptional path. There is at most one such cluster.
    If its length is $h < L$, the original arrangement also has an ordinary boundary of length at least $L$,
    so $H_0 gt.eq h + L > 2 h$. Discarding this final cluster, if present, costs less than $H_0 \/ 2$.
    A positive total length remains, since $13 H_0 \/ 16 - H_0 \/ 2 = 5 H_0 \/ 16 > 0$.
  Choose one remaining cluster. It has at most $K_0$ positive-length paths and satisfies
  $ L lt.eq H_Z lt.eq C L \, wide b_Z lt.eq epsilon H_Z \, wide I_Z lt.eq 192 H_Z \/ L lt.eq 192 C lt.eq I . $
  All paths are cyclically immersed except possibly the entire intact exceptional interval,
    still starting at $x_A$ or $x_B$. The retained comparisons still pair distinct underlying edges.
    Closures may revisit edges or meet other paths, but their occurrences are all unpaired,
    which Theorem 7 permits. This cluster is therefore a path system excluded by that theorem for the single fixed
    triple $\( K_0 \, C \, I \)$ in Equation (5.3).
  The construction applies to every finite arrangement, with no bound on $N_0$ or $H_0$,
    and always yields a system for that same triple. The probability of such a system is $o \( 1 \)$ by Theorem 7;
    the probability that the diameter bound fails is $o \( 1 \)$ by Proposition 6.
    This proves the asserted exclusion probability. The simultaneous girth, diameter,
    and exclusion requirements consequently have positive probability for all sufficiently large admissible $m$. ◻
]

== 6 Cone pictures, asphericity, and protected roots <sec:topology>

The probabilistic argument has produced finite immersed graphs for which no reduced spherical arrangement exists.
  We now turn that exclusion into the two geometric properties needed in Section 2:
  asphericity of the cone complex and protection of the roots.
  We give the cone-picture argument of #cite(label("OpenAI2026ZD")) Proposition 5.1 and Corollary 5.3 in full,
  including the surgeries that preserve a rooted boundary.

#thm([Proposition 6.1.])[
  (Cone criterion).  #emph[Let $Gamma = Gamma_A union.sq Gamma_B$ be a finite graph immersed in the rose $F$,
    with chosen roots $x_A \, x_B$, and let $X$ and $G$ be defined by (2.1).
    If $Gamma$ admits no reduced spherical arrangement as in Definition 11, then
$ pi_2 \( X \) = 0 quad upright("and") quad upright("the root-protection condition ") upright("(2.4)")
  upright(" holds") . $

 Moreover, $X$ is a finite aspherical complex of dimension at most two, and $G$ is finitely presented and torsion-free.]
] <prop:cone-criterion>

The main issue is to pass from a sphere or a null-homotopy to a reduced arrangement.
  Its disks will record fillings through cones, and its arcs will record inverse letters in the intervening map to
  the rose. When a pair of inverse letters traverses the same edge of $Gamma$, a band surgery removes that pair.
  Minimizing the total boundary length makes all such pairs impossible.

=== 6.1 Maps represented by cone pictures <maps-represented-by-cone-pictures>

For $Sigma = S^2$ or $D^2$, a #emph[cone picture] is a map $f : Sigma arrow.r
  X$ together with finitely many pairwise disjoint piecewise linear closed disks $D_i$ in the interior of $Sigma$
  with the following properties. On the complement of their interiors, $f$ takes values in $F$.
  For each $i$ there is a component $Lambda_i$ of $Gamma$ and a factorization

$ f \|_(D_i) : D_i arrow.r K_(Lambda_i) arrow.r X $

whose restriction to $partial D_i$ is a specified closed edge path in $Lambda_i$.
  In the disk case we also specify an edge path in $Gamma$ whose label is read on $partial Sigma$.
  That path may have distinct endpoints, since all graph vertices map to $*$.

#thm([Lemma 6.2.])[
  (Picture representation).  #emph[Every map $S^2 arrow.r X$ is homotopic to a cone picture.
    Every disk map whose boundary is the label of a specified edge path in $Gamma$ is homotopic relative to that
    boundary to a cone picture.]
] <lem:cone-pictures>

#proof[
  We first give a relative replacement of each cone by ordinary relator disks.
    Choose a maximal tree in a component $Lambda$ and a vertex of that tree.
    The edges outside the tree give a free basis of $pi_1 \( Lambda \)$, represented by based edge loops.
    Let $Y_Lambda$ be $Lambda$ with one disk attached along each of these basis loops.
    Van Kampen’s theorem gives $pi_1 \( Y_Lambda \) = 0$. The cellular boundary map from its two-cells has image
    the integral cycle group of $Lambda$ and is injective: the basis loops give a basis of
    $H_1 \( Lambda \; bb(Z) \)$. Therefore $Y_Lambda$ has zero reduced integral homology.
    A simply connected acyclic CW complex is contractible, by the Hurewicz and Whitehead theorems
    #cite(label("Hatcher2002")) Sections 4.1 and 4.2.
  Both $Y_Lambda$ and $K_Lambda$ contain $Lambda$ as a CW subcomplex and are contractible.
    The identity on $Lambda$ extends to maps in both directions:
    extend successively over the relative cells, using the vanishing homotopy groups of the target.
    The two composites are homotopic to the corresponding identities relative to $Lambda$.
    For this last assertion use the same cell-extension argument on the products with $\[ 0 \, 1 \]$,
    prescribing the homotopy on the two ends and on $Lambda times \[ 0 \, 1 \]$.
    Thus the replacements are homotopy equivalences relative to $Lambda$,
    not merely equivalences of their absolute homotopy types.
    After attachment along $Lambda arrow.r F$, they give a homotopy equivalence relative to $F$ between $X$ and
    the finite presentation complex obtained from $F$ by attaching these relator disks.
  Here is the picture construction for this presentation complex.
    Replace the attaching maps by mapping-cylinder collars and subdivide,
    so that simplicial approximation applies to the surface map.
    This changes neither the homotopy type relative to $F$ nor a prescribed boundary word.
    In the interior of each relator disk choose a point outside the images of the one-dimensional simplices and of
    the degenerate two-dimensional simplices of the surface. Its preimage is a finite set of points,
    each with a neighborhood mapped homeomorphically to a neighborhood of the chosen point.
    By compactness and finiteness of the triangulations, a sufficiently small closed disk about the chosen point
    has as its entire preimage a disjoint union of such disk neighborhoods.
  In each target relator disk, expand that small disk to the full disk and collapse the surrounding annulus
    radially to its boundary. This map is homotopic to the identity relative to the boundary.
    Collapse the mapping-cylinder collars to their attaching paths in $F$ as well.
    After postcomposition, the surface outside the selected source disks maps into $F$,
    while each source disk maps into one relator disk. Returning through the relative equivalence to $X$ makes
    each of these disk maps factor through the corresponding abstract cone.
    All homotopies fix a prescribed outer boundary. This gives the asserted cone pictures. ◻
]

We shall also use two elementary changes to a picture. A homotopy of one inner boundary path in its graph can be
  made on a collar of that boundary. Fill the resulting boundary in the same cone.
  The new and old fillings, with the collar included, are homotopic relative to the original boundary because the
  abstract cone is contractible. Thus inner paths can be tightened cyclically.
  If the result is constant, the inner disk can be removed, filling it by that constant map into $F$.
  An outer path can likewise be tightened with its graph endpoints fixed;
  the corresponding homotopy of its label is accommodated by a boundary collar.

=== 6.2 Length reduction by band surgery <length-reduction-by-band-surgery>

Suppose first that $pi_2 \( X \) eq.not 0$. Among cone pictures representing non-null-homotopic spheres,
  choose one minimizing the sum of the lengths of its inner boundary paths.
  Alternatively, suppose root protection fails. Fix a root $r in { x_A \,
  x_B }$ and a distinct vertex $z$ joined to it by a path with trivial label in $G$.
  Among all cone pictures of null-homotopies of labels of paths from $r$ to this fixed $z$,
  choose one minimizing the sum of all inner boundary lengths and the outer path length.
  These minima exist because lengths are nonnegative integers and Lemma 17 provides the required pictures.
  Among pictures attaining the minimum, remove all constant inner boundaries.

The preceding collar changes show that every remaining inner boundary is nonempty and cyclically immersed.
  In the disk case the outer path is immersed and nonempty, since its endpoints are distinct.
  There is at least one inner disk. For the sphere case, a map with no such disk would factor through $F$,
  whose universal cover is a tree and whose second homotopy group is zero.
  For the disk case, a nonempty immersed path in $Gamma$ has a nonempty freely reduced label word,
  which cannot bound a disk in $F$.

Complete a disk picture to a sphere by adjoining a formal exterior disk $D_oo$.
  Its interior carries no map into $X$. Mark its boundary at the initial point of the specified outer path;
  this is the exceptional break, representing the two endpoints of that path.
  Choose the orientation of the sphere so that the boundary of $D_oo$, starting at the break,
  reads the path from $r$ to $z$. This choice may reverse all ordinary boundary words,
  which preserves cyclic immersion. In the sphere case simply orient the sphere and give all disks their induced
  orientations.

On the complement of these disks, the map takes values in the rose.
  Put it in piecewise linear general position with respect to one point in the interior of each rose edge,
  keeping the boundary words fixed. The preimages of these points are disjoint embedded arcs and circles.
  Every letter occurrence has exactly one arc endpoint. Discard the circles.
  The arcs pair all occurrences, and paired letters are inverse when read in the oriented disk boundaries:
  the two ends of a transverse arc have opposite crossing signs,
  and disk-boundary orientations are opposite to those of the complementary surface.

It remains to show that paired occurrences use distinct underlying edges of $Gamma$.
  Suppose an arc pairs two traversals of the same edge $e$. Choose a thin rectangular band around the arc.
  It maps into a small open interval in the corresponding rose edge and lifts to the interior of the abstract
  graph edge $e$. The lift agrees with both specified boundary lifts at the band ends.
  Whenever an inner disk meets the band, its cone must therefore be the cone on the component containing $e$.

The local shortening is particularly simple in graph paths.
  Splice the disk boundaries along the two sides of the band and then contract the residual portions of the two
  paired traversals within $e$. This removes two full edge occurrences in total.
  For ordinary boundaries the changes, with suitable cyclic starting points, are

#[#set math.equation(numbering: n => "(6.1)")
 $ \( e P \, med e^(- 1) Q \) mapsto P Q \, wide e P e^(- 1) Q mapsto \( P \, Q \) . $ <eq:inner-surgery-words>]

Here $e^(- 1)$ denotes the reverse oriented graph edge, rather than merely a letter with the same label.
  Consequently all concatenations in (6.1) are paths in the same graph, and the new boundaries are closed.
  For a rooted exterior boundary the corresponding changes are

#[#set math.equation(numbering: n => "(6.2)")
 $ \( P e R \, med e^(- 1) Q \) mapsto P Q R \, wide P e Q e^(- 1) R mapsto P R . $ <eq:exterior-surgery-words>]

In the second formula $Q$ is closed at the terminal vertex of $e$;
  in both formulas the resulting exterior path has exactly the original graph endpoints $r \, z$.
  The contractions along $e$ are realized by boundary-collar homotopies.

We now specify the resulting surface maps in all four cases.
  This also explains why the operation retains the failure that was minimized.

If the band joins two distinct inner disks, their union with the band is a disk.
  The maps on all three pieces factor together through the same abstract cone,
  since their lifts agree on the attaching intervals. Replace them by this single cone disk and shorten its
  boundary as in the first formula of (6.1). The replacement is homotopic to the old map relative to the rest of
  the surface, and the total boundary length decreases by two. Further tightening can only decrease it.
  An essential sphere remains essential, and a disk still fills the same exterior word.

If the band joins an inner disk to $D_oo$, their union is again a disk, now an enlarged exterior disk.
  Retain its complementary disk and restrict the old map to that complement.
  Its new boundary is $P Q R$ as in the first formula of (6.2).
  The resulting picture is a null-homotopy of a path from $r$ to $z$;
  the old inner boundary and exterior boundary have been replaced by a boundary shorter than their combined length
  by two.

If both ends of the band lie on $D_oo$, their union is an annulus in the completed sphere.
  Its complement consists of two disks. Retain the one whose boundary contains the marked break,
  as shown in Figure 3. The restricted map on that disk, after the edge-collar contraction,
  fills the word $P R$ in the second formula of (6.2). Thus this operation uses only a restriction of the existing
  map; it does not require a separate filling of $Q$. It preserves the fixed endpoints and decreases the total
  length by at least two. The path $P R$ cannot tighten to the empty path, because $r eq.not z$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 3), [#text(size: 9pt)[Band returning to the exterior disk]], anchor: "west", padding: 0.1176cm)
  rect((0.15, -1.7), (5, 2.45), fill: rgb("#e6e6e6"), stroke: none)
  circle((2.575, 0.35), radius: (2.1, 1.55), fill: rgb("#ffffff"), stroke: none)
  rect((0.475, 0.19), (4.675, 0.51), fill: rgb("#cccccc"), stroke: none)
  circle((2.575, 0.35), radius: (2.1, 1.55), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((0.49, 0.19), (4.66, 0.19), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((0.49, 0.51), (4.66, 0.51), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((2.575, 2.17), [#text(size: 8pt)[formal exterior disk $D_ infinity$]])
  content((2.575, 0.35), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#cccccc"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[band]]])])
  content((2.575, 1.4), [#text(size: 9pt)[$Q$]])
  content((2.575, 0.94), [#text(size: 8pt)[$Q$ side]])
  content((1.24, -0.75), [#text(size: 9pt)[$P$]])
  content((3.91, -0.75), [#text(size: 9pt)[$R$]])
  content((2.575, -0.45), [#text(size: 8pt)[retain this side]])
  line((0.52, -0.01), (0.52, 0.73), stroke: (thickness: 0.9pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", fill: black)))
  line((4.63, 0.73), (4.63, -0.01), stroke: (thickness: 0.9pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", fill: black)))
  content((0.37, 0.35), [#text(size: 9pt)[$e$]], anchor: "east", padding: 0.1176cm)
  content((4.8, 0.35), [#text(size: 9pt)[$e^(-1)$]], anchor: "west", padding: 0.1176cm)
  circle((2.575, -1.2), radius: 0.05997, fill: black, stroke: none)
  content((2.575, -1.51), [#text(size: 8pt)[break: fixed graph endpoints]])
  line((5.55, 0.35), (6.72, 0.35), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", fill: black)))
  content((6.14, 1.03), [#text(size: 8pt)[retain the#linebreak()break side]])
  circle((9.15, 0.35), radius: (1.72, 1.23), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((9.15, 0.54), [#text(size: 8pt)[retained disk#linebreak()outer path $"PR"$]])
  content((8.1, -0.45), [#text(size: 9pt)[$P$]])
  content((10.2, -0.45), [#text(size: 9pt)[$R$]])
  circle((9.15, -0.88), radius: 0.05997, fill: black, stroke: none)
  content((9.15, -1.2), [#text(size: 8pt)[same endpoints]])
  content((11.95, 1.61), [#text(size: 8pt)[$Q$ boundary#linebreak()discarded]])
  circle((11.95, 0.47), radius: 0.61, stroke: (paint: rgb("#595959"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  content((11.95, 0.47), [#text(size: 9pt)[$Q$]])
  content((6.55, -2.04), [#text(size: 8pt)[$P thin e thin Q thin e^(-1) thin R arrow.r.long.bar "PR"$]])
})],
  caption: [Figure 3: A band returning to the formal exterior disk, shown schematically in the domain sphere. The two paired occurrences traverse the same graph edge in opposite directions. The exterior disk and the band form an annulus. Retaining its complementary disk on the break side replaces $P e Q e^(- 1) R$ by $P R$ with the same graph endpoints: $Q$ is closed at the terminal vertex of $e$, and the restricted picture fills $P R$. Shading denotes the formal exterior disk and band; the exterior disk itself carries no map to $X$. ],
) <fig:exterior-surgery>

Finally suppose both band ends lie on one inner disk. The union $N$ of the disk and band is an annulus,
  and its map factors through the same abstract cone $K_Lambda$.
  The complement of $N$ in the sphere consists of two disks $Q_1 \, Q_2$.
  Cap each new boundary by a disk mapping through $K_Lambda$, using the boundary lifts inherited from $N$,
  and shorten these boundary paths to $P$ and $Q$ in the second formula of (6.1).
  In the rooted case one of $Q_1 \, Q_2$ contains $D_oo$. Retain that component with its new cap and remove the
  formal exterior disk. This is another disk picture with the same exterior path.
  Its total inner boundary length is at most the old total minus two,
  because the two possible new cap boundaries together have length two less than the old boundary and all other
  retained disks already belonged to the old picture.

In the sphere case, the same operation gives two capped spheres; at least one must still be essential.
  To verify this without an ambiguity from choices of caps,
  lift the original sphere map to the universal cover $tilde(X)$.
  The factorization $N arrow.r K_Lambda arrow.r X$ lifts through a single lift $K_Lambda arrow.r tilde(X)$,
  chosen to agree with the lifted sphere on $N$. Use that very same lift for both new caps.
  Write $tilde(f)_1 \, tilde(f)_2$ for the resulting lifted capped spheres,
  with the orientations induced from $Q_1 \, Q_2$. Their fundamental homology classes satisfy

#[#set math.equation(numbering: n => "(6.3)")
 $ tilde(f)_(*) \[ S^2 \] = tilde(f)_(1 *) \[ S^2 \] + tilde(f)_(2 *) \[ S^2 \] quad
   upright("in ") H_2 \( tilde(X) \; bb(Z) \) . $ <eq:sphere-surgery-homology>]

Compute this identity before the boundary-collar shortenings,
  which are homotopies and do not change these homology classes.
  The difference of the cycles on the two sides consists of the old annulus and the two caps,
  with their boundary orientations canceling. This cycle factors through the contractible abstract cone
  $K_Lambda$, so its homology class is zero. No assertion that the image of this cone is an embedded contractible
  subspace is needed. Since $tilde(X)$ is simply connected, the Hurewicz map $pi_2 \( tilde(X) \) arrow.r
  H_2 \( tilde(X) \; bb(Z) \)$ is an isomorphism. The left side of (6.3) is nonzero,
  and hence one capped sphere is essential. Its total boundary length is smaller than the original one by at least two.

Figure 4 shows this splitting into two capped spheres and the homology identity that preserves essentiality.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, -2.82), [#text(size: 9pt)[Band returning to an inner cone disk]], anchor: "west", padding: 0.1176cm)
  compound-path({circle((2.2, -4.62), radius: 1.19, fill: rgb("#d1d1d1"), stroke: none); circle((2.2, -4.62), radius: 0.68, fill: rgb("#d1d1d1"), stroke: none); line((2.2, -4.62), (2.2, -4.62))}, fill: rgb("#d1d1d1"), fill-rule: "even-odd", stroke: none)
  circle((2.2, -4.62), radius: 1.19, stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  circle((2.2, -4.62), radius: 0.68, stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((2.2, -4.62), [#text(size: 9pt)[$D_Q$]])
  content((2.2, -3.15), [#text(size: 9pt)[$D_P$]])
  content((2.2, -3.68), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[annulus]]])])
  content((3.39, -4.62), [#text(size: 9pt)[$P$]], anchor: "west", padding: 0.1176cm)
  content((2.85, -4.62), [#text(size: 9pt)[$Q$]], anchor: "west", padding: 0.1176cm)
  content((2.2, -6.18), [#text(size: 8pt)[$"ePe"^(-1)Q$ splits into $P,Q$]])
  line((4.18, -4.62), (5.29, -4.62), stroke: (thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", fill: black)))
  content((4.75, -3.88), [#text(size: 8pt)[cap#linebreak()both sides]])
  circle((6.7, -4.62), radius: 1.05, stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  circle((10.18, -4.62), radius: 1.05, stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  circle((6.7, -5.05), radius: (0.7, 0.4), fill: rgb("#d1d1d1"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  circle((10.18, -5.05), radius: (0.7, 0.4), fill: rgb("#d1d1d1"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((6.7, -4.25), [#text(size: 9pt)[$D_P$]])
  content((10.18, -4.25), [#text(size: 9pt)[$D_Q$]])
  content((6.7, -5.05), [#text(size: 8pt)[cap]])
  content((10.18, -5.05), [#text(size: 8pt)[cap]])
  content((6.25, -4.73), [#box(inset: 0.01764cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$P$]]])])
  content((9.73, -4.73), [#box(inset: 0.01764cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$Q$]]])])
  content((8.43, -4.62), [#text(size: 9pt)[$+$]])
  content((8.44, -3.23), [#text(size: 8pt)[two capped spheres]])
  content((8.44, -6.05), [#text(size: 8pt)[Both caps use the same lift of $K_ Lambda arrow.r X$.]])
  content((8.44, -6.6), [#text(size: 9pt)[$[ tilde(f) ]=[ tilde(f)_1]+[ tilde(f)_2]$]])
})],
  caption: [Figure 4: An inner cone disk and its returning band form an annulus, shown schematically in the domain sphere. Here $D_P \, D_Q$ are its complementary disks, with boundary paths $P \, Q$. Capping both through the same abstract cone produces two spheres. For the original sphere map $f$, the symbols $\[ tilde(f) \]$ and $\[ tilde(f)_i \]$ denote the second homology classes of its lift and of the two capped spheres in the universal cover. Using for both caps the same lift of $K_Lambda arrow.r X$ as for the original annulus gives the displayed identity. If $f$ is essential, at least one capped sphere remains essential. Shading denotes the annulus and caps in the domain, without asserting that their images embed in $X$. ],
) <fig:inner-surgery>

Each case contradicts minimality. The chosen pairing therefore uses distinct underlying graph edges.
  All the other requirements of Definition 11 have already been verified:
  the ordinary boundaries are positive and cyclically immersed, there is at least one such boundary,
  and the only possible exceptional boundary is a positive immersed path starting at a designated root.
  Thus either failure would give a reduced spherical arrangement.
  Its assumed absence proves both $pi_2 \( X \) = 0$ and root protection.

=== 6.3 The finite aspherical complex and torsion <the-finite-aspherical-complex-and-torsion>

For completeness, we finish the two standard consequences needed in Proposition 16.
  The universal cover $tilde(X)$ is simply connected, and the vanishing of $pi_2 \( X \)$ gives
  $H_2 \( tilde(X) \; bb(Z) \) = 0$ by Hurewicz. Its higher cellular homology groups vanish because its dimension
  is at most two. Thus it is simply connected and acyclic. If it had a nonzero homotopy group,
  the first such group would, by Hurewicz, give a nonzero homology group.
  All homotopy groups therefore vanish, and Whitehead’s theorem makes $tilde(X)$ contractible.
  Hence $X$ is aspherical. Its finite two-dimensional CW structure gives a finite presentation for $G$.

The cellular chains of this contractible universal cover give a free resolution over $bb(Z) G$,

$ 0 arrow.r C_2 \( tilde(X) \) arrow.r C_1 \( tilde(X) \) arrow.r C_0 \( tilde(X) \) arrow.r bb(Z) arrow.r 0 . $

If $G$ had a nonidentity element of finite order, a power of that element would generate a cyclic subgroup $C_ell$
  of prime order $ell$. Restricting this resolution to $bb(Z)
  C_ell$ still gives a free resolution of length at most two:
  $bb(Z) G$ is a free left $bb(Z) C_ell$-module, with basis given by representatives for the cosets $C_ell
  g$ in $G$. It would follow that $H^k \( C_ell \; bb(F)_ell \) = 0$ for every $k > 2$.

To see the contradiction directly, write $u$ for a generator of $C_ell$ and $N = 1 + u + dots.h.c + u^(ell - 1)$.
  The periodic free resolution

$ dots.h.c arrow.r^(thin N thin) bb(Z) C_ell arrow.r^(thin u - 1 thin) bb(Z) C_ell arrow.r^(thin N thin) bb(Z)
  C_ell arrow.r^(thin u - 1 thin) bb(Z) C_ell arrow.r bb(Z) arrow.r 0 $

is exact: the augmentation ideal is the image of multiplication by $u - 1$,
  the kernel of that multiplication is $bb(Z) N$, and the kernel of multiplication by $N$ is the augmentation
  ideal. Applying $"Hom"_(bb(Z) C_ell) \( - \, bb(F)_ell \)$ with trivial coefficients makes every differential
  zero, since $u - 1$ acts as zero and $N$ acts as $ell = 0$.
  Therefore $H^k \( C_ell \; bb(F)_ell \) tilde.equiv bb(F)_ell$ for all $k gt.eq 0$,
  the standard cohomological obstruction to torsion in a group of finite cohomological dimension
  #cite(label("Brown1982")) Chapter VIII. This contradiction proves that $G$ is torsion-free and completes the
  proof of Proposition 16.

== 7 Completion of the construction <sec:assembly>

We now choose one finite pair of graphs and apply the deterministic results.

#proof[
  Use the prescribed types of Section 3 and let $m equiv 1 med \( mod med 4 \)$ tend to infinity.
    The probability space conditioned on girth at least $L = floor.l c_0 log \( v m \)
    floor.r$ is nonempty for sufficiently large $m$. By Theorem 12,
    with probability tending to one it contains no reduced spherical arrangement.
    Choose such an outcome with $L gt.eq 3$, so that both labeled graphs have no loops or parallel edges.
  Attach the cones to the rose as in Section 2, obtaining the finite two-dimensional complex $X$, and put $G =
    pi_1 \( X \)$. By Proposition 16, the universal cover of $X$ is contractible, $G$ is torsion-free,
    and the labels of paths from either root to a different vertex of its component are nontrivial in $G$.
    Finiteness of $X$ gives a finite presentation of $G$.
  The intersection parities proved in Proposition 3 now satisfy the hypotheses of Proposition 2.
    That proposition supplies $a \, b \, c in bb(F)_2 \[ G \]$ with $a b = 1$, $a c = 0$, and $c eq.not 0$.
    Associativity excludes $b a = 1$, as asserted. ◻
]

The argument selects a finite matching outcome rather than listing its edges.
  Once selected, its cones give a finite presentation, and the sums in Proposition 2 give finite scalar witnesses.

#bibliography("refs.bib", style: "ieee", title: [References])
