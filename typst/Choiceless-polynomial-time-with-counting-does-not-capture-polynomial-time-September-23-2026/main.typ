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

#align(center)[#text(size: 16pt, weight: "bold")[Choiceless polynomial time with counting \
does not capture polynomial time]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A query on finite relational structures is a property unchanged by isomorphism.
  It belongs to polynomial time if a deterministic algorithm decides it in time polynomial in the size of an
  ordinary encoding of the structure. The algorithm may use the order of that encoding;
  its answer must be independent of the order. An unordered structure, in contrast,
  does not supply such an order as one of its relations. Descriptive complexity asks which formalisms can express
  every polynomial-time query without first choosing an order.

Choiceless polynomial time with counting, denoted $upright("CPT")$ throughout this paper,
  operates on the hereditarily finite sets built from the input elements as atoms.
  These are finite sets whose members are atoms or further such sets,
  with no infinite descending membership chain. The formalism permits set operations,
  comprehension and the cardinality operation $sans(C a r d)$, which returns a finite von Neumann ordinal.
  Each fixed program has polynomial bounds on its computation and on the number of recursively occurring objects.
  Its operations commute with input automorphisms and do not provide an arbitrary choice of an ordering.
  We use the established equivalent formulation by interpretation programs; its exact syntax,
  counting operation and quotient semantics are stated in Section 6.
  In particular, $upright("CPT")$ here always includes counting and has no imposed bound on the rank of its sets.

To say that this formalism #emph[captures polynomial time] on unordered finite structures means that every
  isomorphism-invariant polynomial-time query, in every fixed finite relational vocabulary,
  is definable by a program of the formalism. We first specify a query on all inputs in a fixed vocabulary.

=== 1.1 The separating query <sec:query>

Throughout, let $bb(F) = bb(F)_3$. Fix the binary relational vocabulary

$ tau = { sans(E d) \, sans(C f) \, sans(E B) \, sans(V B) \, sans(I) \, sans(Z)_0 \, sans(Z)_1 \, sans(Z)_2 } . $

The subscripts on the last three relation symbols denote elements of $bb(F)$. For a finite $tau$-structure $A$, set

$ Y = { y in A : sans(E d) \( y \, y \) } \, wide X = { a in A : sans(C f) \( a \, a \) } \, wide X_t = { a in X :
  sans(V B) \( t \, a \) } quad \( t in X \) . $

No disjointness or equivalence-relation assumption is imposed here. In particular, $X$ and $Y$ may overlap.
  Define, in $bb(F)$,

#[#set math.equation(numbering: n => "(1)")
 $ C \( y \, a \) = sum_(x in Y\
sans(I) \( a \, x \)) med sum_(delta in bb(F)\
sans(Z)_delta \( y \, x \)) delta wide \( y in Y \, med a in X \) . $ <eq:query-coefficient>]

If several of the relations $sans(Z)_delta \( y \, x \)$ hold, all their contributions are included.

Introduce two separate families of unknowns, $\( lambda_a \)_(a in X)$ and $\( mu_y \)_(y in Y)$.
  Thus even when $a = y$, $lambda_a$ and $mu_y$ are different unknowns. The system defining our query has the equations

#[#set math.equation(numbering: n => "(2)")
 $ sum_(a in X_t) lambda_a = 1 wide \( t in X \) $ <eq:query-normalization>]

and, for every $\( t \, y \) in X times Y$ for which

#[#set math.equation(numbering: n => "(3)")
 $ upright("there exist ") a in X_t upright(" and ") x in Y upright(" with
 ") sans(I) \( a \, x \) upright(" and ") sans(E B) \( y \, x \) upright(",") $ <eq:query-incidence-test>]

the equation

#[#set math.equation(numbering: n => "(4)")
 $ mu_y = sum_(a in X_t) lambda_a C \( y \, a \) . $ <eq:query-consistency>]

Let $Q \( A \)$ mean that this system is consistent over $bb(F)$.
  Repeated identical equations are harmless; they remain equations and are not added together.
  An empty sum is zero, and a system with no equations is consistent.
  These conventions make $Q$ a query on all finite $tau$-structures.

=== 1.2 Main result <main-result>

#thm([Theorem 1.])[
  #emph[The query $Q$ on all finite structures in the fixed vocabulary $tau$ of eight binary relations is
    isomorphism-invariant and decidable in deterministic polynomial time,
    but is not definable in full choiceless polynomial time with counting.]
] <thm:main>

Theorem 1 confirms the noncapture conjecture of Blass, Gurevich and Shelah for the full counting formalism;
  its historical formulation is discussed below. We first record the ordinary algorithmic upper bound.
  The rest of the paper proves the choiceless lower bound.

#thm([Proposition 2.])[
  #emph[The query $Q$ is isomorphism-invariant and decidable in deterministic polynomial time from an ordered
    encoding of its input structure.]
] <prop:query-ptime>

#proof[
  An isomorphism carries $X \, Y \, X_t$ to their counterparts, preserves the coefficient in (1),
    and carries the test (3) to the corresponding test. Consequently it permutes the two families of unknowns and
    the equations compatibly. Consistency is therefore invariant.
  If the input has $n$ elements, there are at most $2 n$ unknowns and $n + n^2$ equations.
    All coefficients and tests can be computed by polynomially many loops over the input universe; for example,
    a direct implementation uses $O \( n^4 \)$ operations over the fixed field.
    Gaussian elimination then decides consistency in polynomial time #cite(label("shoup2009")) Sections 14.4–14.5.
    Any input order may be used to list the rows and columns: changing it does not change consistency. ◻
]

The same query is expressible in two standard linear-algebraic logics.
  Following Grädel and Pakusa #cite(label("graedelPakusa2019")) Section 2,
  write $upright("FPS")_3$ for fixed-point logic with counting (FPC) extended by the solvability operator over
  $bb(F)_3$, and $upright("FPR")_3$ for FPC extended by the rank operator over $bb(F)_3$.
  Their two-sorted syntax allows bounded number variables alongside the unordered input elements.
  We state the consequence for nonempty structures, so that the matrix index sets in its proof are nonempty.

#thm([Corollary 3.])[
  #emph[On nonempty finite $tau$-structures, $Q$ is definable in both $upright("FPS")_3$ and $upright("FPR")_3$.
    Consequently neither of these logics is contained in $upright("CPT")$.]
] <cor:linear-algebraic-logics>

FPC defines the coefficient predicates and the row test for $Q$.
  Section 8 gives the resulting solvability formula and compares the ranks of the coefficient and augmented
  matrices. The nonempty witnesses constructed below give both noncontainments.

=== 1.3 Background and the obstruction to rank-dependent arguments <background-and-the-obstruction-to-rank-dependent-arguments>

The ordered case provides the starting point. Immerman and Vardi showed that first-order logic with a least
  fixed-point operator expresses exactly the polynomial-time queries on finite structures supplied with a linear
  order #cite(label("immerman1982")) #cite(label("vardi1982")).
  For unordered structures, Chandra and Harel asked whether polynomial-time queries admit an effective
  enumeration #cite(label("chandraHarel1982")) Section 5, p. 118.
  Gurevich formulated the question in terms of a logic capturing polynomial time and conjectured that no such
  logic exists #cite(label("gurevich1988")) Section 7. Excluding CPT with counting as a candidate leaves this
  broader question open.

Blass, Gurevich and Shelah introduced choiceless polynomial time to study computation on unordered structures
  using hereditarily finite sets rather than arbitrary choices of an ordering #cite(label("bgs1999")).
  Their original 1997 preprint explicitly conjectured that the extension by counting is still a proper fragment of
  polynomial time #cite(label("bgs1999")) 1997 version, Introduction, p. 3.
  Their later study of unordered computation examined CFI instances and finite-field linear algebra as possible
  sources of separation, carefully distinguishing representations with common and independent row and column index
  sets #cite(label("bgs2002")) Sections 4 and 6. The query here is a particular linear-consistency problem over
  $bb(F)_3$, defined without a promise on the input structure.

Shelah’s early work claimed noncapture for counting extensions of choiceless
  computation #cite(label("shelah2000")) Introduction and Section 4.
  Later accounts continued to state the capture problem as open, from Blass,
  Gurevich and Shelah #cite(label("bgs2002")) Section 7 through the 2025 work of Dawar, Grädel,
  Kullmann and Pago #cite(label("dawarGraedelKullmannPago2025")) Section 2.2.
  We give a separate proof for the explicit query above; Shelah’s claim is not a theorem input to this argument.

The construction of Cai, Fürer and Immerman established the central example of a polynomial-time graph query
  beyond fixed-point logic with counting #cite(label("cfi1992")).
  Its local gadgets conceal a global parity obstruction from bounded-variable counting formulas.
  This is an antecedent of our charge-based witnesses, not an identification of those witnesses with the original
  CFI graphs. The passage from counting logic to choiceless computation is substantial:
  Dawar, Richerby and Rossman showed that the preordered CFI query obtained from ordered base graphs is definable
  without counting, while even counting does not suffice if set rank is restricted to
  $o \( log n \/ log log n \)$, where $n$ is the input size #cite(label("drr2008")) Theorems 17 and 40,
  2007 author version. In particular, their lower bound for every fixed rank cannot by itself yield a separation
  for the full formalism. Pakusa, Schalthöfer and Selman extended the positive result to connected preordered base
  graphs whose colour classes have logarithmic size in the number of base
  vertices #cite(label("pakusaSchalthoeferSelman2016")) Theorem 1.
  The preorder orders classes of base vertices, rather than all vertices of the resulting CFI structure.

Positive algebraic results also go beyond the original CFI family.
  Abu Zaid, Grädel, Grohe and Pakusa obtained choiceless canonization, that is,
  construction of canonical ordered copies, when a supplied preorder has bounded classes whose induced
  substructures have Abelian automorphism groups #cite(label("abuZaidGraedelGrohePakusa2014")) Corollary 19.
  Their procedure uses specially structured cyclic systems of equations,
  not arbitrary unordered linear systems #cite(label("abuZaidGraedelGrohePakusa2014")) Definition 6 and
  Theorem 14. Lichter and Schweitzer obtained analogous canonization for graphs when these induced groups are
  dihedral or cyclic #cite(label("lichterSchweitzer2021")) Theorem 1.
  These results show why the lower-bound argument must exploit the particular action of its nonabelian group,
  rather than noncommutativity alone.

Functional lower bounds expose different limits. Rossman proved that CPT with counting cannot construct the set of
  hyperplanes of an input finite vector space over a fixed finite field #cite(label("rossman2010")) Theorem 6.1,
  author version. Pago proved that no such program constructs, on every hypercube with $N$ vertices,
  a total preorder with classes of size $O \( log N \)$ #cite(label("pago2021")) Theorem 2 and Corollary 3,
  full version. The latter statement also excludes encodings from which the preorder can be recovered in CPT.
  It obstructs the route of first constructing a fine preorder and then applying the preordered CFI algorithm.
  These are functional obstructions, not nondefinability of a Boolean query.

Pago’s symmetric-XOR-circuit approach relates restricted classes of choiceless CFI algorithms to circuit
  families #cite(label("pago2023")) Theorems 2, 31 and 33, full version.
  The translation permits polynomially many circuit images under automorphisms of the base graph;
  the circuit lower bound assumes an invariant circuit and different bounds on connections between gates.
  These hypotheses differ, so that argument does not establish nondefinability for the entire restricted algorithm
  class.

The support-and-transfer architecture has older roots. Blass,
  Gurevich and Shelah developed supports and representations by forms evaluated at supporting tuples,
  called molecules #cite(label("bgs1999")) Sections 8–9, published version.
  Dawar, Richerby and Rossman developed rank-sensitive support bounds and a counting transfer for hereditarily
  supported objects #cite(label("drr2008")) Sections 7–8, 2007 author version.
  Using the group-relative homogeneity from Section 4, we adapt that representation method in Section 5 and prove
  the required exact counting statements. The support estimate in Section 3 instead uses a larger nonabelian group
  to obtain small supports for its central subgroup, independently of HF rank.
  Its standard class-two group and alternating-form ingredients,
  as well as the projection and counting-game methods used for the atom comparison,
  are credited at their respective proofs. The grid-specific estimate and the quantitative transfer are proved here.

Finally, the connection to arbitrary programs uses the interpretation characterization of Grädel, Pakusa,
  Schalthöfer and Kaiser #cite(label("gkps2015")) Theorem 1.
  We use the binary, two-dimensional formulation of Grohe, Schweitzer and Wiebking #cite(label("gsw2020"))
  Section 6, Theorem 18, arXiv version 1, including its generated-equivalence and existential-representative
  quotient convention. This characterization is an external input. Section 6 proves the further facts needed here:
  a polynomial bound on the complete hereditary encoding of a run,
  and exact formulas for its states whose variable bound is independent of the number of stages.
  Thus neither a bound on HF rank nor a restriction to a particular algorithmic construction is imposed on the
  programs excluded by the theorem.

=== 1.4 Proof overview <proof-overview>

For each side length $L$, we build two structures from the three-dimensional box grid.
  Each edge carries states consisting of a bounded collection of $bb(F)_3^2$ face coordinates and one scalar.
  A vertex configuration chooses incident edge states that agree on their shared face coordinates and whose
  scalars have a prescribed signed sum, called its charge. Both kinds of states become input atoms,
  linked only by the fixed binary relations. The two structures have all charges zero, or one charge equal to one.
  Their size is $N = Theta \( L^3 \)$. The query’s normalization equations assign field-valued weights summing to
  one to the configurations at each vertex. Its consistency equations make the weighted scalar value of an edge
  agree at its two endpoints. Summing the vertex divergence equations then forces the total charge to be zero,
  since each edge enters one vertex and leaves another. This argument allows arbitrary field-valued weights;
  it does not assume that a solution selects one configuration per vertex.
  The all-zero configurations give a solution in the zero-charge structure,
  so the query has opposite answers on the pair.

The challenge is to show that every fixed full $upright("CPT")$ program eventually gives the same answer on this
  pair. Three steps connect the symmetries of these atoms to the complete computation.

===== 1.4.1 Rank-independent supports. <rank-independent-supports.>

The structures have an automorphism group $H$ containing a central subgroup $K$ of divergence-free scalar flows on
  the edges. A tuple of atoms is a $K$-support of an object if every element of $K$ fixing that tuple also fixes
  the object. For any fixed $q$, every hereditarily finite object with $H$-orbit of size at most $N^q$ has a
  support of size $O_q \( L \( 1 + log L \)^2 \)$. The bound does not depend on the object’s rank.
  Commutators in $H$ force the linear functionals detecting a stabilizer to have nonzero curl on few faces.
  Subtracting explicitly constructed gradients then concentrates those functionals on few edges.
  This is the role of the nonabelian group; central flows alone do not supply this argument.

===== 1.4.2 Counting equivalence for all supported objects. <counting-equivalence-for-all-supported-objects.>

For analysis only, we add a preorder identifying certain classes of atoms and relations comparing scalar
  differences. These relations are not given to the program.
  With $M = floor.l L^(7 \/ 4) floor.r$, the two expanded structures agree on all first-order counting sentences
  using at most $M$ variable names. A charge discrepancy can be moved along paths in the large component that
  remains after the edges touched by the assigned atoms are removed.
  Within either expansion, equality of sufficiently wide counting types also determines the $K$-orbit of a short tuple.

Fix a support length $s = O_q \( L \( 1 + log L \)^2 \)$.
  Consider all hereditarily finite objects for which the object and every recursive member have a $K$-support of
  length at most $s$. This is a countably infinite domain of finite objects,
  containing objects of every finite rank. We represent its objects by finite forms evaluated at supporting atom
  tuples, then prove equality, membership and exact counting transfer.
  For each fixed $m$, the two domains agree on all counting sentences with at most $m$ variable names when $L$ is
  sufficiently large. The key width cost is $O_(q \, m) \( L^(3 \/ 2) \( 1 + log L \)^3 \) = o \( M \)$.

===== 1.4.3 The entire computation fits the comparison. <the-entire-computation-fits-the-comparison.>

The interpretation characterization supplies a fixed program whose successive states are quotients of definable
  pairs from the preceding state. We encode every quotient vertex by a tagged set of ordered pairs of preceding
  vertex codes. A polynomial run has only polynomially many such codes and recursive constituents;
  this transitive family is $H$-invariant. The support theorem therefore places the entire encoded trace in the
  domains just compared.

Finally, each state, halting test and output test has an exact counting-formula definition over its supported
  domain. Its length may grow with the input, but the number of variable names needed is bounded by a constant
  depending only on the program. We prove this by a capture-avoiding substitution lemma,
  including the generated quotient relation and the cardinality comparisons.
  Choose the program and its constants $q \, m$ first, and then take $L$ large.
  Counting equivalence forces the same halt stage and output on the two structures,
  contradicting their opposite query answers.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.253cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Two grid structures#linebreak()with zero or unit total charge]]])])
  content((-4.45, -1.65), [#box(width: 4.003cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Linear-system query#linebreak()has opposite answers]]])])
  content((0, -1.65), [#box(width: 4.003cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Small $H$-orbits give#linebreak()short $K$-supports]]])])
  content((4.45, -1.65), [#box(width: 4.003cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Counting equivalence#linebreak()and homogeneity#linebreak()of expanded atoms]]])])
  content((0, -3.4), [#box(width: 4.003cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Trace codes in supported HF;#linebreak()bounded-variable#linebreak()state formulas]]])])
  content((4.45, -3.4), [#box(width: 4.003cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Counting equivalence#linebreak()on supported#linebreak()HF objects]]])])
  content((2.225, -5.3), [#box(width: 6.653cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Each fixed CPT program#linebreak()has equal outputs for large $L$]]])])
  line((-2.626, -0.525), (-4.45, -1.125), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -0.525), (0, -1.125), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.626, -0.525), (4.45, -1.125), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -2.175), (0, -2.875), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.001, -2.175), (2.449, -2.875), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.45, -2.175), (4.45, -2.875), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -3.925), (-1.101, -4.775), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.45, -3.925), (5.551, -4.775), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-4.45, -2.175), (-4.45, -5.3), (-1.101, -5.3), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-2.006, -4.456), [#text(size: 9pt)[contradiction]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The two routes from the input pair. The charge equations give opposite query answers. The symmetry, logic and computation arguments force every fixed choiceless program to give equal answers for sufficiently large grids. The atom expansions are used only for analysis. If the program decided $Q$, its equal outputs would contradict the left-hand route. ],
) <fig:proof-map>

Section 1.1 defines the query on all inputs, and Section 2 constructs its two test structures.
  Section 3 proves the support theorem. Sections 4 and 5 establish the counting comparison on atoms and then on
  supported sets. Section 6 encodes full interpretation computations,
  and Section 7 fixes the parameters and proves Theorem 1. Section 8 proves the definability of $Q$ in solvability
  and rank logic.

== 2 The grid structures <sec:structures>

The instances used in the lower bound attach finite groups to the edges of a three-dimensional box.
  At each vertex we retain the tuples of edge states satisfying a prescribed divergence equation.
  The group law will supply the nonabelian automorphisms used in the support argument;
  the query just defined will detect an obstruction to the divergence equations.

=== 2.1 Grid orientations and edge groups <grid-orientations-and-edge-groups>

For an integer $L gt.eq 2$, let $G = \( V \, E \)$ be the box grid with

$ V = { 0 \, dots.h \, L - 1 }^3 . $

Each edge is oriented in its positive coordinate direction.
  Put $epsilon.alt_(v e) = 1$ if $v$ is the head of $e$, $epsilon.alt_(v e) = - 1$ if it is the tail,
  and $epsilon.alt_(v e) = 0$ otherwise. The incidence map is

$ partial : bb(F)^E arrow.r bb(F)^V \, wide \( partial z \)_v = sum_(e in E) epsilon.alt_(v e) z_e . $

Let $F$ be the set of unit square faces. A face parallel to coordinate directions $i <
  j$ is traversed first in direction $+ i$, then $+ j$, then $- i$, then $- j$.
  Its edge vector $c^f in bb(F)^E$ has coefficient $1$ when this traversal follows an edge orientation, $-
  1$ when it opposes that orientation, and zero off the face.
  At each vertex of the face one traversed edge enters and one leaves, so

#[#set math.equation(numbering: n => "(5)")
 $ partial c^f = 0 . $ <eq:face-cycle>]

Write $F \( e \) = { f in F : c_e^f eq.not 0 }$, and let $F \( v \)$ be the set of faces containing $v$. We shall use

$ \| F \( e \) \| lt.eq 4 \, wide f \( v \) := \| F \( v \) \| lt.eq 12 \, wide d \( v \) := \| { e :
  e in.rev v } \| lt.eq 6 . $

In particular, $d \( v \) gt.eq 1$.

For vectors in $bb(F)^2$, define the alternating form

$ omega \( \( a \, b \) \, \( a' \, b' \) \) = a b' - b a' . $

The edge groups use the standard finite Heisenberg multiplication #cite(label("gurevichHadani2009")) Section 2.1,
  with the face-boundary signs specifying its alternating form.
  The group $P_e$ attached to an edge $e$ has underlying set $\( bb(F)^2 \)^(F \( e \)) times bb(F)$.
  Its elements are written $\( u \, z \)$, where $u = \( u_f \)_(f in F \( e \))$, and its product is

#[#set math.equation(numbering: n => "(6)")
 $ \( u \, z \) \( u' \, z' \) =
   (u + u' \, med z + z' + 1 / 2 sum_(f in F \( e \)) c_e^f omega \( u_f \, u'_f \)) . $ <eq:edge-product>]

Here $1 \/ 2 = 2$ in $bb(F)_3$. To verify the group law, denote the bilinear correction term by
  $B_e \( u \, u' \)$. Bilinearity gives

$ B_e \( u \, u' \) + B_e \( u + u' \, u'' \) = B_e \( u' \, u'' \) + B_e \( u \, u' + u'' \) \, $

which is exactly associativity. Alternation gives $B_e \( u \, u \) = 0$;
  hence $\( 0 \, 0 \)$ is the identity and $\( u \, z \)^(- 1) = \( - u \, - z \)$.
  In particular, the last coordinate of $\( u \, z \)^(- 1) \( u' \, z' \)$ is

#[#set math.equation(numbering: n => "(7)")
 $ z' - z - 1 / 2 sum_(f in F \( e \)) c_e^f omega \( u_f \, u'_f \) . $ <eq:edge-difference>]

=== 2.2 Atoms and binary relations <atoms-and-binary-relations>

Fix $b = \( b_v \)_(v in V) in bb(F)^V$. The universe of $A_b$ is the disjoint union of two kinds of atoms.
  There is an #emph[edge atom] $\( e \, u \, z \)$ for each edge $e$ and each $\( u \, z \) in P_e$.
  At each vertex $v$ there is a #emph[configuration atom] for every tuple

$ a = #scale(x: 120%, y: 120%)[\(] v \, \( \( u_e \, z_e \) \)_(e in.rev v) #scale(x: 120%, y: 120%)[\)] $

satisfying

#[#set math.equation(numbering: n => "(8)")
 $ u_(e \, f) & = u_(e' \, f) &  & upright("for the two edges ") e \,
   e' upright(" of each face ") f in F \( v \) upright(" at ") v \,\
sum_(e in.rev v) epsilon.alt_(v e) z_e & = b_v . $ <eq:configuration>]

The coordinates in these descriptions label atoms; they are not members of the atoms as sets.
  The two kinds of atoms are tagged so they are disjoint.

Figure 2 illustrates the signed face boundary in (5) and the shared-coordinate condition in (8).

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (2.2, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.2, 0), (2.2, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 2.2), (2.2, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 0), (0, 2.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((0, 0), radius: 0.04233, fill: black, stroke: none)
  circle((2.2, 0), radius: 0.04233, fill: black, stroke: none)
  circle((2.2, 2.2), radius: 0.04233, fill: black, stroke: none)
  circle((0, 2.2), radius: 0.04233, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$v$]], anchor: "north-east", padding: 0.1176cm)
  content((1.1, 1.1), [#text(size: 9pt)[$f$]])
  content((1.1, 0), [#text(size: 9pt)[$+1$]], anchor: "south", padding: 0.1176cm)
  content((2.2, 1.1), [#text(size: 9pt)[$+1$]], anchor: "east", padding: 0.1176cm)
  content((1.1, 2.2), [#text(size: 9pt)[$-1$]], anchor: "north", padding: 0.1176cm)
  content((0, 1.1), [#text(size: 9pt)[$-1$]], anchor: "west", padding: 0.1176cm)
  content((1.1, 2.2), [#text(size: 9pt)[$+i$]], anchor: "south", padding: 0.1176cm)
  content((2.2, 1.1), [#text(size: 9pt)[$+j$]], anchor: "west", padding: 0.1176cm)
  content((1.1, -0.08), [#text(size: 9pt)[$e,#h(0.3333em) u_(e,f)$]], anchor: "north", padding: 0.1176cm)
  content((-0.08, 1.1), [#text(size: 9pt)[$e',#h(0.3333em) u_(e',f)$]], anchor: "east", padding: 0.1176cm)
  content((1.1, -0.72), [#text(size: 9pt)[$u_(e,f)=u_(e',f)$]])
})],
  caption: [Figure 2: A geometric grid face $f$ in directions $i < j$. Arrows follow the global positive-coordinate orientations; the labels $+ 1 \, + 1 \, - 1 \, - 1$ are the coefficients of $c^f$, so their signed divergence is zero at each corner. At the marked vertex $v$, the two incident states of one configuration satisfy $u_(e \, f) = u_(e' \, f)$. The drawing shows the geometric cell underlying these coordinates; the atoms are the states and configurations defined in the text. ],
) <fig:unit-face>

#thm([Lemma 4.])[
  #emph[For each $L gt.eq 2$, the size of $A_b$ is independent of $b$ and equals
#[#set math.equation(numbering: n => "(9)")
 $ N_L = sum_(e in E) 3^(2 \| F \( e \) \| + 1) + sum_(v in V) 3^(2 f \( v \) + d \( v \) - 1) . $ <eq:universe-size>]

 In particular,
$ L^3 lt.eq N_L lt.eq \( 3^10 + 3^29 \) L^3 . $

 Every vertex has at least one configuration atom.]
] <lem:universe-size>

#proof[
  There are $3^(2 \| F \( e \) \| + 1)$ states on $e$. At a vertex $v$,
    each face $f in F \( v \)$ meets precisely two incident edges.
    Their face coordinates are identified by (8), independently of all other faces.
    The choices of $u$ therefore contribute $3^(2 f \( v \))$ possibilities.
    The divergence condition is a single linear equation in $d \( v \)$ variables with a nonzero coefficient,
    so it has $3^(d \( v \) - 1)$ solutions for every $b_v$. This proves (9) and positivity.
    There are $L^3$ vertices and $3 L^2 \( L - 1 \) lt.eq 3 L^3$ edges.
    The displayed bounds follow from $\| F \( e \) \| lt.eq 4$, $f \( v \) lt.eq 12$, and $d \( v \) lt.eq 6$. ◻
]

The vocabulary $tau$ is interpreted as follows; each relation is false on all pairs not specified below.

- $sans(E d)$ and $sans(C f)$ are the diagonals of the edge atoms and configuration atoms, respectively.
- $sans(E B)$ relates edge atoms on the same edge. The relation $sans(V B)$ relates configuration atoms at the
  same vertex.
- $sans(I) \( a \, x \)$ holds when $a$ is a configuration at a vertex $v$ and $x = \( e \, u_e \, z_e \)$ is the
  state selected by $a$ on an incident edge $e$.
- For $delta in bb(F)$, the relation $sans(Z)_delta \( \( e \, u \, z \) \, \( e \, u' \, z' \) \)$ holds
  precisely when (7) equals $delta$.

Thus $sans(I)$ goes from configurations to edge atoms; it is not made symmetric.
  The coordinate labels used to construct $A_b$ are not extra symbols in its input vocabulary.
  In particular, no ordering of the grid or of its blocks is supplied to a program.

=== 2.3 Opposite answers <opposite-answers>

Fix any vertex $v_(*) in V$, and put

$ b^0 = 0 \, wide b^1 = upright(bold(1))_(v_(*)) . $

These two charge vectors give structures of the same size by Lemma 4.

#thm([Proposition 5.])[
  #emph[For every $L gt.eq 2$, the structure $A_(b^0)$ satisfies $Q$ and $A_(b^1)$ does not.
    More generally, $Q \( A_b \)$ implies $sum_(v in V) b_v = 0$ in $bb(F)$.]
] <prop:opposite-answers>

#proof[
  For clarity, let $X \( v \)$ denote the configuration block at a grid vertex $v$.
    For any $t in X \( v \)$, the set $X_t$ in the definition of the query is exactly $X \( v \)$.
    For an edge atom $y$ on $e$, the test (3) holds precisely when $e in.rev v$:
    every configuration at $v$ selects one atom on each incident edge,
    and $sans(E B)$ identifies exactly the edge blocks. If $e in.rev v$,
    the coefficient $C \( y \, a \)$ has exactly one contributing selected edge atom,
    and exactly one of its three $sans(Z)_delta$ relations holds.
  On $A_(b^0)$, each vertex has a configuration with all coordinates zero.
    Give it weight $lambda_a = 1$ and give all other configurations weight zero.
    For $y = \( e \, u \, z \)$ set $mu_y = - z$. The normalization equations hold.
    The selected neighbor of every nonzero-weight configuration on $e$ is $\( e \, 0 \, 0 \)$,
    whose group difference from $y$ has last coordinate $- z$ by (7). Thus all equations (4) also hold.
  Now suppose the query system on $A_b$ has any solution. The weights $lambda_a$ are arbitrary field elements;
    we do not assume that they select a configuration. For each edge choose, only for this proof,
    its zero atom $y_e = \( e \, 0 \, 0 \)$. By (7), for $e in.rev v$ and $a in
    X \( v \)$ we have $C \( y_e \, a \) = z_e \( a \)$. The equations of the query give
  $ mu_(y_e) = sum_(a in X \( v \)) lambda_a z_e \( a \) \, wide sum_(a in X \( v \)) lambda_a = 1 . $
  Multiply the first identity by $epsilon.alt_(v e)$, sum over the edges at $v$, and use (8):
  $ sum_(e in.rev v) epsilon.alt_(v e) mu_(y_e) = sum_(a in X \( v \)) lambda_a sum_(e in.rev v) epsilon.alt_(v e)
    z_e \( a \) = b_v sum_(a in X \( v \)) lambda_a = b_v . $
  Summing this identity over all vertices cancels each edge contribution,
    because an oriented edge has one head and one tail. Hence $sum_v b_v = 0$.
    For $b = b^1$ that sum is $1$, which is impossible. ◻
]

The remainder of the argument shows that a fixed choiceless computation cannot distinguish these two structures
  when $L$ is sufficiently large. The equality of their universe sizes and the fixed binary vocabulary will be
  used throughout that argument.

== 3 Small orbits have sparse supports <sec:support>

The automorphisms used in this section have two parts. Face translations form an abelian quotient,
  but their commutators produce central flows on edges. This interaction constrains the stabilizer of an object
  with a small orbit. We will turn that constraint into a short tuple of atoms whose pointwise stabilizer in the
  central flow subgroup fixes the object.

Throughout this section, $bb(F) = bb(F)_3$, $L gt.eq 2$, and $G = \( V \, E \)$ is the positively oriented grid on
  ${ 0 \, dots.h \, L - 1 }^3$. Its incidence map is $partial : bb(F)^E arrow.r bb(F)^V$.
  For a unit square face $f$, write $c^f in bb(F)^E$ for its oriented boundary, so that $partial c^f = 0$.
  Let $F$ denote the set of faces and put

$ C_F = \( bb(F)^2 \)^F \, wide K = ker partial . $

We use the alternating form $omega \( \( a \, b \) \, \( a' \, b' \) \) = a b' - b a'$ on $bb(F)^2$.

=== 3.1 A central extension acting on the structures <a-central-extension-acting-on-the-structures>

For $a \, a' in C_F$, define an edge vector

$ B \( a \, a' \) = 1 / 2 sum_(f in F) omega \( a_f \, a'_f \) c^f in K . $

On the set $H = C_F times K$, define

#[#set math.equation(numbering: n => "(10)")
 $ \( a \, k \) \( a' \, k' \) = \( a + a' \, k + k' + B \( a \, a' \) \) . $ <eq:H-product>]

Bilinearity gives $B \( a \, a' \) + B \( a + a' \, a'' \) = B \( a' \, a'' \) + B \( a \, a' + a'' \)$,
  proving associativity. The identity is $\( 0 \, 0 \)$; since $B \( a \, a \) = 0$,
  the inverse of $\( a \, k \)$ is $\( - a \, - k \)$. Thus $H$ is a finite group.
  The subgroup ${ 0 } times K$, identified with $K$, is central, and the projection $H arrow.r
  C_F$ is a surjective homomorphism with kernel $K$. With the convention $\[ h \, h' \] =
  h h' h^(- 1) \( h' \)^(- 1)$, its commutator is

#[#set math.equation(numbering: n => "(11)")
 $ \[ \( a \, k \) \, \( a' \, k' \) \] = (0 \, sum_(f in F) omega \( a_f \, a'_f \) c^f) . $ <eq:H-commutator>]

Recall that an edge atom on $e$ has a state $\( u \, z \)$ in $P_e$, with $u = \( u_f \)_(f in F \( e \))$.
  The element $\( a \, k \) in H$ sends that state to

#[#set math.equation(numbering: n => "(12)")
 $ (u + \( a_f \)_(f in F \( e \)) \, thick z + k_e + 1 / 2 sum_(f in F \( e \)) c_e^f omega \( a_f \, u_f \)) .
   $ <eq:H-edge-action>]

It acts on a configuration by applying this map to every incident edge state.
  This is an action because restricting $\( a \, k \)$ to an edge is a homomorphism from $H$ to $P_e$,
  and the edge action is left multiplication.

#thm([Lemma 6.])[
  #emph[For every $b in bb(F)^V$, the action just defined is by automorphisms of $A_b$.
    On its central subgroup $K$, the action adds $k_e$ to each edge coordinate $z_e$ and leaves all face
    coordinates unchanged.]
] <lem:H-automorphisms>

#proof[
  At a vertex $v$, the two incident coordinates belonging to a face $f$ are equal before the action and both
    receive the same addition $a_f$. Hence the face compatibility equations remain true.
    The change in the divergence of a configuration is
  $ \( partial k \)_v + 1 / 2 sum_(f in.rev v) (sum_(e in.rev v) epsilon.alt_(v e) c_e^f) omega \( a_f \, u_f \) . $
  Here $u_f$ is the common face coordinate in that configuration. Both terms vanish:
    $k in K$ and $partial c^f = 0$. Configurations therefore remain in the same vertex block and still have
    divergence $b_v$. Applying the inverse group element proves bijectivity.
  The relations $sans(E d) \, sans(C f) \, sans(E B) \, sans(V B)$ are preserved because types and blocks are
    preserved. The incidence relation $sans(I)$ is preserved because configurations and their specified edge
    neighbors are transformed by the same map. Finally, for edge states $g \, g' in P_e$ and $h in P_e$,
    one has $\( h g \)^(- 1) \( h g' \) = g^(- 1) g'$. Consequently every $sans(Z)_delta$ is preserved.
    The formula for the central action follows from (12) with $a = 0$. ◻
]

Every permutation of the atoms extends to hereditarily finite objects by $h dot.op x = { h dot.op y :
  y in x }$ for sets $x$, recursively in their rank. Atoms remain distinct from sets.
  We always use this extension of the $H$-action. A tuple $alpha$ of atoms is a #emph[$K$-support] of an object
  $x$ if every element of the pointwise stabilizer

$ K_alpha = { k in K : k dot.op alpha_i = alpha_i upright(" for every ") i } $

fixes $x$. The empty tuple is permitted and has stabilizer $K$.

=== 3.2 A sparse representative for an edge functional <a-sparse-representative-for-an-edge-functional>

A central element $k in K$ fixes an edge atom on $e$ exactly when $k_e = 0$.
  To obtain a short support for an object $x$, it suffices to find a small edge set $T$ such that every $k in
  K$ vanishing on $T$ fixes $x$. The stabilizer of $x$ in $K$ is a vector subspace,
  so it can be described by linear equations on $K$. We will represent these equations using few edge coordinates.

An edge cochain is a vector $ell in bb(F)^E$. Its face curl is

$ \( D ell \) \( f \) = sum_e c_e^f ell_e . $

A vertex function $phi in bb(F)^V$ has gradient $partial^(sans(T)) phi$,
  whose value on an edge from $v$ to $w$ is $phi \( w \) - phi \( v \)$.
  Adding a gradient does not change the curl, because $partial c^f = 0$.
  It also does not change the linear functional $k mapsto sum_e ell_e k_e$ on $K$.
  The next lemma shows that a cochain with few nonzero face curls can be replaced by one using few edges,
  without changing its functional on $K$. In the support proof,
  commutators will supply the bound on the number of these faces.

#thm([Lemma 7.])[
  (Sparse cochains).  #emph[Let $ell in bb(F)^E$ have nonzero curl on exactly $t$ faces of the $L times L times
    L$ box. There is a vertex function $phi$ such that $r = ell -
    partial^(sans(T)) phi$ is supported on at most $2 L t$ edges. In particular, if $t = 0$, then $ell$ is a gradient.]
] <lem:sparse-cochain>

#proof[
  We construct the subtracted gradient by successive prefix sums. Write a vertex as $\( i \, j \, k \)$.
    The cochain coordinate $ell_1 \( i \, j \, k \)$ is on the edge from $\( i \, j \, k \)$ to
    $\( i + 1 \, j \, k \)$, and similarly for directions $2$ and $3$. Define
  $ phi_1 \( i \, j \, k \) = sum_(a = 0)^(i - 1) ell_1 \( a \, j \, k \) $
  with an empty sum interpreted as zero. Subtracting its gradient produces a cochain $r^(\( 1 \))$ whose
    direction-$1$ coordinates vanish. Thus
  $ \( D ell \)_12 \( i \, j \, k \) & = r_2^(\( 1 \)) \( i + 1 \, j \, k \) - r_2^(\( 1 \)) \( i \, j \, k \) \,\
\( D ell \)_13 \( i \, j \, k \) & = r_3^(\( 1 \)) \( i + 1 \, j \, k \) - r_3^(\( 1 \)) \( i \, j \, k \) . $
  Here a subscript $a b$ denotes a face in coordinate directions $a < b$,
    and the lower corner ranges over the indices for which the face exists.
  Let $t_(a b)$ be the number of nonzero $a b$ curls. The $L$ slices of fixed first coordinate partition the $23$
    faces, so choose $i_0$ for which the number $t_0$ of nonzero $23$ curls satisfies $t_0 lt.eq t_23 \/ L$. Put
  $ phi_2 \( i \, j \, k \) = sum_(b = 0)^(j - 1) r_2^(\( 1 \)) \( i_0 \, b \, k \) \, wide r^(\( 2 \)) =
    r^(\( 1 \)) - partial^(sans(T)) phi_2 . $
  The function $phi_2$ is independent of $i$. Consequently $r_1^(\( 2 \)) = 0$,
    and $r_2^(\( 2 \)) \( i_0 \, j \, k \) = 0$. Next put
  $ phi_3 \( i \, j \, k \) = sum_(c = 0)^(k - 1) r_3^(\( 2 \)) \( i_0 \, 0 \, c \) \, wide r = r^(\( 2 \)) -
    partial^(sans(T)) phi_3 . $
  This last function is independent of $i \, j$. We have
  $ r_1 = 0 \, wide r_2 \( i_0 \, j \, k \) = 0 \, wide r_3 \( i_0 \, 0 \, k \) = 0 . $
  On the slice $i = i_0$, the $23$ curl identity now reads
  $ r_3 \( i_0 \, j + 1 \, k \) - r_3 \( i_0 \, j \, k \) = \( D ell \)_23 \( i_0 \, j \, k \) . $
  It follows that a nonzero value of $r_3$ on this slice must lie after a nonzero curl on its $j$-line.
    Each nonzero curl accounts for at most $L$ positions. The slice therefore contains at most $L
    t_0$ nonzero edge coordinates; its direction-$2$ coordinates are all zero.
    Extending these slice values constantly across all $L$ slices uses at most $L^2 t_0 lt.eq
    L t_23$ supported coordinates.
  The difference between $r_2 \( i \, j \, k \)$ and $r_2 \( i_0 \, j \, k \)$ is a signed sum of the $12$ curls
    between $i_0$ and $i$. Each nonzero $12$ curl can occur in at most $L$ of these sums.
    Thus at most $L t_12$ direction-$2$ coordinates differ from their copied slice values.
    The identical argument in direction $3$ gives at most $L t_13$ differing coordinates.
    Since direction $1$ is zero, the support of $r$ has size at most
  $ L^2 t_0 + L \( t_12 + t_13 \) lt.eq L t lt.eq 2 L t . $
  The total subtracted function is $phi = phi_1 + phi_2 + phi_3$.
    This construction also covers $t = 0$, when the resulting support is empty. ◻
]

=== 3.3 The support bound <the-support-bound>

#thm([Proposition 8.])[
  (Small-orbit support bound).  #emph[Let $N = \| A_b \|$, let $q gt.eq 0$,
    and let $x$ be a hereditarily finite object over the atoms of $A_b$.
    If its $H$-orbit has size at most $N^q$, then $x$ has a $K$-support consisting of at most
$ 2 L \( q log_3 N \)^2 $

 edge atoms. The support may be empty.]
] <prop:small-orbit-support>

#proof[
  Let $S = { h in H : h dot.op x = x }$, let $U lt.eq C_F$ be the image of $S$ under the projection,
    and put $K_0 = S ∩ K$. Since $C_F$ and $K$ are additive groups over the prime field $bb(F)_3$,
    both $U$ and $K_0$ are vector subspaces. We use the group exact sequence with kernel $K_0$ to obtain $\|
    S \| = \| U \| thin \| K_0 \|$. Therefore, with $a = "codim"_(C_F) U$ and $d = "codim"_K K_0$,
  #[#set math.equation(numbering: n => "(13)")
   $ a + d = log_3 \[ H : S \] lt.eq q log_3 N = : h . $ <eq:stabilizer-codimension>]
  Let $W lt.eq K^(*)$ be the annihilator of $K_0$, so $dim W = d$.
    Every $lambda in K^(*)$ extends to a functional on $bb(F)^E$, represented by an edge cochain $ell$.
    Two such cochains differ by an element of $K^perp = "im" partial^(sans(T))$.
    Indeed that image is contained in $K^perp$, and both have dimension $"rank" partial$.
  Fix $lambda in W$ and a representative $ell$. For $u \, u' in U$, choose lifts in $S$.
    Their commutator lies in $S ∩ K = K_0$; evaluating $lambda$ on (11) gives
  $ sum_(f in F) \( D ell \) \( f \) thin omega \( u_f \, u'_f \) = 0 . $
  Thus $U$ is totally isotropic for the alternating form on $C_F$ with one block $\( D ell \) \( f \)
    omega$ for each face. If $t$ of these coefficients are nonzero, the form has rank $2 t$:
    a nonzero scalar multiple of $omega$ has rank two, and the blocks have disjoint face coordinates in $C_F$.
    This rank calculation does not require the boundary vectors $c^f$ in $K$ to be linearly independent.
  We recall the standard dimension argument for alternating forms #cite(label("cameron2000classical"))
    Sections 3.1 and 3.3. An alternating form of rank $2 t$ on an $n$-dimensional vector space has no totally
    isotropic subspace of codimension less than $t$. Quotient by the radical, of dimension $n - 2 t$.
    The image of an isotropic subspace in this nondegenerate $2 t$-dimensional space has dimension at most $t$,
    since it is contained in its orthogonal complement. The original isotropic subspace therefore has dimension at
    most $\( n - 2 t \) + t = n - t$. Applied above, this shows $t lt.eq a$.
    By Lemma 7, $lambda$ consequently has a cochain representative supported on at most $2 L a$ edges.
  Choose such representatives for a basis of $W$, and let $T subset.eq E$ be the union of their supports. Then
  $ \| T \| lt.eq 2 L a d lt.eq 2 L h^2 . $
  This includes $d = 0$, when the basis and $T$ are empty. Any $k in
    K$ that vanishes on $T$ annihilates every basis member of $W$, hence all of $W$.
    Finite-dimensional duality gives $k in K_0$, so $k$ fixes $x$. For each edge $e in T$, choose one edge atom.
    By the central action, fixing that atom is equivalent to $k_e = 0$.
    The tuple of chosen atoms is therefore a $K$-support of $x$ and has the stated length. ◻
]

The argument used $x$ only through its stabilizer subgroup $S lt.eq H$. Its rank plays no role in the support bound.

A family $cal(X)$ is #emph[membership-transitive] if $y in x in cal(X)$ implies $y in cal(X)$.
  Thus it contains every recursive constituent of each of its members.

#thm([Corollary 9.])[
  #emph[Let $cal(X)$ be an $H$-invariant, membership-transitive finite family of hereditarily finite objects over
    $A_b$, and suppose $\| cal(X) \| lt.eq N^q$ for some fixed $q gt.eq 0$.
    Every object in $cal(X)$, including every recursive constituent of each of its members,
    has a $K$-support of length at most $2 L \( q log_3 N \)^2$.
    All these supports can be padded to the common positive length
#[#set math.equation(numbering: n => "(14)")
 $ s = ⌈2 L \( q log_3 N + 1 \)^2⌉ + 1 = O_q #scale(x: 120%, y: 120%)[\(] L \( 1 + log L \)^2
   #scale(x: 120%, y: 120%)[\)] . $ <eq:support-length>]

]
] <cor:transitive-support>

#proof[
  The orbit of each member is contained in $cal(X)$, so the proposition applies to it.
    Membership transitivity places all its recursive constituents in the same family.
    Adding atom coordinates to a support can only shrink its pointwise stabilizer, so it remains a support.
    There are atoms because $L gt.eq 2$; arbitrary atoms can therefore pad even an empty support.
    Finally $N = Theta \( L^3 \)$ gives the asymptotic estimate. ◻
]

== 4 Counting equivalence and homogeneity <sec:base-counting>

The central subgroup $K = ker partial$ acts by adding a divergence-free edge vector to the last coordinates of the
  atoms. We now prove two facts about this action. First, a bounded number of variables cannot distinguish the two
  charge assignments. Second, within either structure, equality of sufficiently wide counting types determines a
  $K$-orbit. The second fact will let us transport the supports of hereditarily finite sets.

=== 4.1 An expansion for the analysis <an-expansion-for-the-analysis>

Recall that an edge atom has coordinates $\( e \, u \, z \)$,
  whereas a configuration atom at $v$ specifies the states on all incident edges,
  subject to the face compatibility equations and the divergence equation with right side $b_v$.
  Expand $A_b$ to a structure $macron(A)_b$ as follows. Partition its universe into classes indexed by

$ \( e \, u \) quad upright("and") quad \( v \, \( u_f \)_(f in F \( v \)) \) . $

Here $u_f$ is the common face coordinate on the two edges of $f$ at $v$.
  Thus an edge class leaves only $z$ unspecified, and a configuration class leaves all incident $z$-coordinates
  unspecified. Choose a linear order of these class labels, the same for all charge assignments,
  and let $prec.curly.eq$ be the resulting total preorder on atoms.
  Each edge class has size $3$, and a configuration class at $v$ has size $3^(d \( v \) - 1)$; in particular,
  corresponding classes are nonempty and have the same size. Finally add, for $delta in bb(F)_3$, the relation

$ sans(D)_delta \( \( e \, u \, z \) \, \( e' \, u' \, z' \) \) quad arrow.l.r.double quad e = e' med
  upright("and") med z' - z = delta \, $

which is false on every other pair. The vectors $u \, u'$ need not agree in this definition.
  The preorder will let counting formulas identify a block and its face coordinates.
  The relations $sans(D)_delta$ will compare scalar differences on the same edge,
  including between different face patterns.

Every element of $K$ preserves the expansion. The larger group $H$ need not preserve it.
  Crucially, the preorder and the relations $sans(D)_delta$ are tools for this proof and are not part of the input
  to a choiceless program.

Write $C^h$ for first-order logic with equality, ordinary quantifiers and exact counting quantifiers $exists^(= a)
  x$, using at most $h$ variable names. Here $a$ may be any nonnegative integer.
  Formula length and these integer constants need not be uniform in $L$.
  The $C^h$-type of an $r$-tuple, for $r lt.eq h$, records all such formulas with free variables among its $r$
  designated positions. Coordinates of a tuple may repeat.

=== 4.2 A component that survives edge deletions <a-component-that-survives-edge-deletions>

Let $G$ be the undirected graph underlying the oriented box grid on $V = { 0 \, dots.h \, L - 1 }^3$.
  For $R subset.eq V$, write $delta_G R$ for its edge boundary;
  this notation distinguishes the boundary of a vertex set from the incidence operator $partial$.
  The projection estimate below is the three-dimensional discrete Loomis–Whitney inequality
  #cite(label("loomisWhitney1949")). We include its short proof and derive the needed finite-box boundary bound.

#thm([Lemma 10.])[
  (Boundary of a box subset).  #emph[Set $c = 1 - 2^(- 1 \/ 3) > 0$.
    If $diameter eq.not R subset.eq V$ and $\| R \| lt.eq L^3 \/ 2$, then
$ \| delta_G R \| gt.eq c \| R \|^(2 \/ 3) . $

]
] <lem:box-boundary>

#proof[
  Let $a_(i j) \, b_(i k) \, d_(j k)$ be the indicators of the three coordinate-pair projections of $R$.
    If their sizes are $A \, B \, D$, respectively, then
  $ \| R \| lt.eq sum_(i \, j \, k) a_(i j) b_(i k) d_(j k) lt.eq
    A^(1 \/ 2) (sum_(i \, j) (sum_k b_(i k) d_(j k))^2)^(1 \/ 2) lt.eq \( A B D \)^(1 \/ 2) . $
  For the last inequality apply Cauchy–Schwarz to each inner sum and then sum the product
    $\( sum_k b_(i k)^2 \) \( sum_k d_(j k)^2 \)$ over $i \, j$.
    Consequently at least one projection has size at least $\| R \|^(2 \/ 3)$.
    It indexes that many nonempty coordinate lines meeting $R$.
    At most $\| R \| \/ L$ of these lines lie wholly in $R$. Every remaining line is a path meeting both $R$ and
    its complement, so contains a boundary edge; different lines give different edges. Since
  $ frac(\| R \|, L) lt.eq 2^(- 1 \/ 3) \| R \|^(2 \/ 3) \, $
  the stated estimate follows. ◻
]

Set

$ M = floor.l L^(7 \/ 4) floor.r . $

For all sufficiently large $L$, deleting any set $T$ of at most $6
  M$ edges leaves a unique component containing more than $L^3 \/ 2$ vertices. Call it the #emph[giant component].
  Indeed, summing the preceding lemma over all components $R$ of size at most $L^3 \/ 2$ gives

#[#set math.equation(numbering: n => "(15)")
 $ sum_R \| R \| lt.eq c^(- 3 \/ 2) sum_R \| delta_G R \|^(3 \/ 2) lt.eq
   c^(- 3 \/ 2) \( 2 \| T \| \)^(3 \/ 2) lt.eq c^(- 3 \/ 2) \( 12 M \)^(3 \/ 2) = o \( L^3 \) . $ <eq:small-components>]

The middle inequality uses $sum_R \| delta_G R \| lt.eq 2 \| T \|$ and $sum_i a_i^(3 \/ 2)
  lt.eq \( sum_i a_i \)^(3 \/ 2)$ for nonnegative $a_i$. If every component had size at most half,
  the left side would equal $L^3$, a contradiction. Two components cannot both have more than half the vertices.
  Moreover, whenever more edges are deleted within this range, the new giant is contained in the old one:
  each new component is contained in an old component, and its size identifies that old component as the giant.

=== 4.3 Moving the unmatched charge <moving-the-unmatched-charge>

The counting argument follows the finite-variable counting-game method of Immerman and Lander
  #cite(label("immermanLander1990")) Counting Quantifiers and the charge-moving strategy of the CFI construction
  #cite(label("cfi1992")) Lemma 6.2 and proof of Theorem 6.4.
  Here we construct the required bijections and prove formula preservation directly;
  no game characterization is needed as a premise.

#thm([Proposition 11.])[
  (Base counting equivalence).  #emph[For all sufficiently large $L$,
    the expansions $macron(A)_(b^0)$ and $macron(A)_(b^1)$, where $b^0 = 0$ and $b^1 = upright(bold(1))_(v_(*))$,
    satisfy the same $C^M$ sentences.]
] <prop:base-equivalence>

#proof[
  An assigned edge atom touches its edge, and an assigned configuration atom at $v$ touches all edges incident
    with $v$. At most $M$ assigned positions therefore touch a set $T$ of at most $6 M$ edges.
    Call a paired assignment #emph[compatible] if some vector $t in
    bb(F)_3^E$ and some vertex $w$ in the giant of $G \\ T$ satisfy
  #[#set math.equation(numbering: n => "(16)")
   $ partial t = b^1 - b^0 - upright(bold(1))_w \, $ <eq:defect-flow>]
  and each assigned atom is paired with the atom obtained by adding $t_e$ to its last coordinate on every relevant
    edge. This operation leaves its block and all face-vector coordinates unchanged.
    The empty assignment is compatible with $t = 0$ and $w = v_(*)$.
  A compatible assignment preserves every atomic formula. On a fixed edge,
    common addition of $t_e$ preserves both raw differences and the corrected differences defining
    $sans(Z)_delta$. It also preserves whether an edge state is the specified neighbor of a configuration.
    The block relations, preorder, diagonal predicates and equality are preserved as well.
    This applies even when assigned coordinates repeat.
  Deleting an assigned position preserves compatibility: the set of touched edges shrinks,
    and the old giant is contained in the new one. Suppose now that at most $M - 1$ positions remain.
    We construct one bijection of the entire universes that extends them,
    regardless of which atom is next assigned. Its definition may use a different shift on each block;
    every such shift will agree with $t$ on the retained touched edges.
    Partition the universe into whole edge blocks and whole vertex configuration blocks.
    For such a block $J$, let $T_J$ be $T$ together with its edge, or with its vertex star, as appropriate.
    There are at most $6 M$ edges in $T_J$. Choose $w_J$ in the giant of $G \\ T_J$.
    Both $w$ and $w_J$ lie in the giant of $G \\ T$, so they are joined by a path there.
    A signed path vector $p_J$, supported outside $T$, can be chosen with
  $ partial p_J = upright(bold(1))_w - upright(bold(1))_(w_J) . $
  Put $t_J = t + p_J$. It agrees with $t$ on every previously touched edge and satisfies (16) with $w_J$ in place
    of $w$.
  Map every atom in $J$ by its $t_J$-shift. This gives a bijection on an edge block.
    For a configuration block at $v$, deleting the star isolates $v$, so $v eq.not w_J$.
    Hence $\( partial t_J \)_v = b_v^1 - b_v^0$, exactly the condition for translation to map its configurations
    bijectively to those in the other structure; the face-vector constraints are unchanged.
    The union of these block bijections is a bijection of universes.
    For a new atom in block $J$, both it and all retained positions are paired by the single shift $t_J$.
    Thus adjoining that atom extends the compatible assignment, with witness $t_J \, w_J$.
  Induct on formulas. Atomic formulas were handled above, and Boolean operations preserve agreement.
    At a quantifier, first discard any old assignment of its variable, leaving at most $M - 1$ positions.
    The bijection just constructed pairs all extensions on which the body has the same truth value by induction.
    It therefore preserves ordinary quantification and every exact counting quantifier, including count zero.
    Starting from the empty assignment proves the proposition. ◻
]

=== 4.4 Recognizing the central-group orbits <recognizing-the-central-group-orbits>

For the next step, the two tuples lie in the #emph[same] expansion.
  A shift prescribed on their touched edges must extend to a divergence-free vector.
  The only obstruction is a nonzero net prescribed flow across one of the remaining components.

#thm([Lemma 12.])[
  (Extending a partial flow).  #emph[Let $T subset.eq E$ and $sigma in bb(F)_3^T$.
    There is $k in ker partial$ with $k \|_T = sigma$ if and only if, for every component $U$ of $G \\ T$,
#[#set math.equation(numbering: n => "(17)")
 $ R_U := sum_(v in U) sum_(e in T\
e in.rev v) epsilon.alt_(v e) sigma_e = 0 . $ <eq:component-balance>]

 If an extension does not exist, there is a nonempty failing component with
$ \| U \| lt.eq L^3 \/ 2 \, wide \| U \| lt.eq \( \| T \| \/ c \)^(3 \/ 2) . $

]
] <lem:partial-flow>

#proof[
  Extend $sigma$ by zero outside $T$. The required values on $E \\ T$ must have divergence $- partial sigma$.
    On any connected graph, the image of its incidence operator is exactly the vertex vectors with zero sum.
    To see sufficiency without a rank calculation, take a spanning tree, set nontree edge values to zero,
    and eliminate leaves: the divergence at a leaf uniquely determines the value on its tree edge.
    The prescribed total sum makes the final root equation hold.
    Apply this separately to each component, allowing an isolated vertex as a one-vertex tree.
    The necessary zero-sum conditions are precisely (17).
  The sum of all $R_U$ is zero, because the two incidence signs of each edge cancel.
    Thus failure at one component implies failure at at least two,
    so one failing component has size at most $L^3 \/ 2$. Its boundary is contained in $T$,
    and Lemma 10 gives the second estimate. ◻
]

#thm([Proposition 13.])[
  (Quantitative homogeneity).  #emph[Let $r gt.eq 1$, and suppose
#[#set math.equation(numbering: n => "(18)")
 $ 7 r + 7 \( 6 r \/ c \)^(3 \/ 2) + 1 lt.eq M . $ <eq:homogeneity-width>]

 If two $r$-tuples in the same $macron(A)_b$ have equal $C^M$-types,
   then some $k in K$ maps the first tuple to the second. The corresponding statement for empty tuples holds
   without any width hypothesis.]
] <prop:base-homogeneity>

#proof[
  Write the tuples as $macron(a) \, macron(a)'$. Each preorder class is definable using two variable names.
    If $h$ is the number of atoms in strictly earlier classes, its predicate is
  $ theta_h \( x \) := exists^(= h) y thin \( y prec.curly.eq x and not \( x prec.curly.eq y \) \) . $
  Different classes give different $h$, since every class is nonempty.
    Type equality therefore puts corresponding tuple coordinates in the same class.
    They have the same blocks and face-vector patterns.
  Let $T$ be the touched edges, so $\| T \| lt.eq 6 r$. An #emph[occurrence] of a state on $e in
    T$ is either an edge atom appearing in a tuple coordinate or the state on $e$ in a configuration appearing
    there. In the latter case that state is the unique $y$ satisfying $sans(I) \( a_i \, y \)$ and its specified
    edge-class predicate. The corresponding occurrence for $macron(a)'$ has the same edge and face-vector
    coordinates. For any two occurrences on one edge, their raw difference can be tested by $sans(D)_delta$,
    quantifying their uniquely specified neighbors if necessary.
    These tests use at most the $r$ tuple names, two neighbor names,
    and one name reused in class-counting predicates. Condition (18) in particular permits these $r + 3$ names.
    Type equality shows that every pair of corresponding occurrences has the same raw difference.
    Hence there is a single well-defined $sigma_e$ equal to the change in $z$ from $macron(a)$ to $macron(a)'$ for
    all occurrences on $e$.
  Suppose $sigma$ cannot be extended to $K$. Choose a failing component $U$ from Lemma 12; then
  $ \| U \| lt.eq \( 6 r \/ c \)^(3 \/ 2) . $
  We construct a formula true at $macron(a)$ and false at $macron(a)'$.
    For every $v in U$, choose any configuration $g_v^0$ in the first assignment’s structure and let
    $h_(v \, e)^0$ be its neighbor on every incident edge. The chosen configurations need not agree across an
    internal edge. The formula will preserve their original raw difference,
    so any new witnesses will have equal scalar changes at its two ends.
    These changes will cancel when the divergence equations are summed over $U$.
    On each boundary edge $e in delta_G U subset.eq T$, choose one occurrence from $macron(a)$,
    and denote its state by $o_e^0$. Write $o_e$ for the corresponding tuple variable,
    or the auxiliary neighbor variable when one is needed. The formula existentially quantifies variables $g_v \,
    h_(v \, e)$, and, if the chosen occurrence comes from a tuple configuration, one neighbor variable $y_e$.
    Its conjunction asserts:
  + each $g_v \, h_(v \, e)$ is in the class of the chosen atom, and $sans(I) \( g_v \, h_(v \, e) \)$ holds;
  + for every edge internal to $U$, the raw difference between its two variables $h_(v \, e)$ equals the
    difference between the two chosen atoms $h_(v \, e)^0$;
  + for every boundary edge, the raw difference between $h_(v \, e)$ and its chosen tuple occurrence equals their
    original raw difference; if that occurrence requires $y_e$,
    also impose its edge-class predicate and its incidence with the relevant tuple configuration.
  For definiteness, on an internal edge joining $v \, w$, choose an ordering of its endpoints and use
  $ sans(D)_(z \( h_(w \, e)^0 \) - z \( h_(v \, e)^0 \)) \( h_(v \, e) \, h_(w \, e) \) \; $
  on a boundary edge incident with $v in U$, use
  $ sans(D)_(z \( h_(v \, e)^0 \) - z \( o_e^0 \)) \( o_e \, h_(v \, e) \) \, $
  where both atoms in the subscript are the fixed original choices.
    Thus $o_e = y_e$ in the arguments when the occurrence is supplied by a tuple configuration.
    An edge in $T$ with both endpoints in $U$ is treated as internal;
    its contribution to $R_U$ cancels and requires no boundary link.
    All class predicates are of the form $theta_h$ above, and all difference conditions use one of the three
    $sans(D)_delta$. This describes a finite formula in the expansion’s vocabulary;
    the numerical constants and its length may depend on the chosen assignments.
    The indicated choices witness its truth at $macron(a)$.
  If it were true at $macron(a)'$, compare the realized $z$-coordinates of its witnesses with those of
    $h_(v \, e)^0$, writing the changes as $d_(v \, e)$. Both configurations at $v$ have divergence $b_v$,
    so $sum_(e in.rev v) epsilon.alt_(v e) d_(v \, e) = 0$. On an internal edge the difference constraint gives
    equal changes at its two ends. On a boundary edge it forces $d_(v \, e) = sigma_e$.
    Summing the vertex equations over $U$ therefore gives $R_U = 0$, contrary to the choice of $U$.
  There are $r$ tuple variables, $\| U \|$ configuration variables, at most $6 \| U \|$ incident-state variables,
    and at most $\| delta_G U \| lt.eq 6 r$ extra occurrence variables.
    One further name can be reused in every class predicate. Thus the formula uses at most
  $ r + 7 \| U \| + 6 r + 1 lt.eq 7 r + 7 \( 6 r \/ c \)^(3 \/ 2) + 1 lt.eq M $
  names, contradicting type equality. The partial shift therefore extends to some $k in K$,
    whose action maps every coordinate of $macron(a)$ to the corresponding coordinate of $macron(a)'$.
    For empty tuples take $k = 0$. ◻
]

For the support scale used below, fix $q \, m$ first and put

$ s = ⌈2 L \( q log_3 N + 1 \)^2⌉ + 1 \, wide N = Theta \( L^3 \) . $

Uniformly for $1 lt.eq r lt.eq max { 2 \, m } s$, the left side of (18) is

$ O_(q \, m) #scale(x: 120%, y: 120%)[\(] L^(3 \/ 2) \( 1 + log L \)^3 #scale(x: 120%, y: 120%)[\)] =
  o \( L^(7 \/ 4) \) . $

Consequently Proposition 13 applies throughout that range when $L$ is sufficiently large.
  The same choice of $L$ ensures $max { 4 \, m + 1 } s lt.eq M$,
  the separate width requirement for extending atom types in the hereditary-set comparison below.
  The exponent $7 \/ 4$ simultaneously ensures $M^(3 \/ 2) =
  o \( L^3 \)$ for the giant-component estimate and $L^(3 \/ 2) \( 1 + log L \)^3 =
  o \( M \)$ for homogeneity at the support scale. Any fixed exponent strictly between $3 \/
  2$ and $2$ would meet these asymptotic requirements. All these conclusions hold for fixed $q \, m$, chosen before $L$.

== 5 From atom types to hereditarily finite sets <sec:hf-transfer>

The preceding counting equivalence concerns tuples of input atoms.
  A choiceless computation also constructs sets of atoms, sets of such sets, and objects of unbounded finite rank.
  We now show how small supports let us transfer bounded-variable counting formulas on a domain containing all
  these objects. The domain itself will be countably infinite;
  every object in it is nevertheless hereditarily finite. The counting argument below respects this distinction.
  The support, molecule and form method originates in Blass,
  Gurevich and Shelah #cite(label("bgs1999")) Sections 8–9 of the published version and was developed for counting
  by Dawar, Richerby and Rossman #cite(label("drr2008")) Section 8 of the author version.
  We give the full quantitative argument for the chosen automorphism subgroups and support bound used here,
  including exact counts of represented values.

We first isolate the precise hypotheses needed from the preceding sections.
  Write $upright("HF") \( A \)$ for the atoms of $A$ together with all hereditarily finite sets built from them.
  For a finite relational structure $A$, let $"tp"_M^A \( macron(a) \)$ be the set of all $C^M$ formulas true at
  $macron(a)$, with free variables among the indicated tuple positions. Tuples may have repeated entries.
  Two such types are compared using the same ordered list of variable positions.

#thm([Theorem 14.])[
  (Transfer through small supports).  #emph[Let $A_0 \, A_1$ be nonempty finite structures in the same binary
    relational vocabulary, and let $K_i lt.eq "Aut" \( A_i \)$ for $i in { 0 \, 1 }$.
    Let $s \, m \, M$ be positive integers satisfying
$ max { 4 \, m + 1 } s lt.eq M . $

 Assume the following two properties.]
  + #emph[$A_0$ and $A_1$ satisfy the same $C^M$ sentences.]
  + #emph[In each $A_i$, any two tuples of length at most $max { 2 \,
    m } s$ with the same $C^M$ type lie in the same $K_i$ orbit.]
  #emph[For $i in { 0 \, 1 }$, let $D_i$ consist of the objects $x$ in $upright("HF") \( A_i \)$ such that $x$ and
    every object in its transitive closure have a $K_i$-support of length at most $s$.
    Equip $D_i$ with membership, an atom predicate, and the relations of $A_i$,
    interpreted as false on arguments containing a non-atom. Then $D_0$ and $D_1$ satisfy the same $C^m$ sentences.]
] <thm:hf-transfer>

Here atoms are urelements, distinct from all sets. A tuple supports an object if its pointwise stabilizer fixes
  that object. The action of $K_i$ on atoms extends recursively to sets.
  We can pad every support to exactly $s$ coordinates, using repetitions or arbitrary atoms,
  because $A_i$ is nonempty. The resulting domains $D_i$ contain all atoms and all pure hereditarily finite sets.
  They are transitive under membership, countable, and invariant under $K_i$:
  if $alpha$ supports $x$, then $g alpha$ supports $g x$.

For our application, $A_i$ in Theorem 14 is the analytic expansion $macron(A)_(b^i)$,
  and $K_i$ is its central flow group $K$. The base counting-equivalence and homogeneity results provide its two
  assumptions with the parameter bounds established at the end of Section 4.
  For the remainder of the paper, write $cal(D)_(b^i)$ for this supported domain over $macron(A)_(b^i)$,
  using the support length in (14). The atom predicate is definable in our domain by $sans(E d) \( x \, x \) or
  sans(C f) \( x \, x \)$. No analytic expansion is supplied to the program;
  it is used only to prove the indistinguishability theorem.

The proof has three stages: count extensions of atom types;
  represent supported objects and transfer equality and membership;
  then match the whole domains while retaining the assigned parameters.

=== 5.1 Exact extension counts for atom types <exact-extension-counts-for-atom-types>

All types in the next lemma are realized in $A_0$ or $A_1$.
  Thus there are only finitely many types of any fixed tuple length,
  even though a type records infinitely many formulas.

#thm([Lemma 15.])[
  (Extension counts).  #emph[Suppose $P$ and $P'$ have the same $C^M$ type in two structures chosen,
    with repetition allowed, from $A_0 \, A_1$. If $\| P \| + d lt.eq M$,
    then for every realized type $rho$ of length $\| P \| + d$, the numbers of tuples $gamma$ and $gamma'$ satisfying
$ "tp"_M \( P \, gamma \) = rho \, wide "tp"_M \( P' \, gamma' \) = rho $

 are equal. In particular a type realized over one prefix is realized over the other.
   Equal types also have equal types on every projected or reordered subtuple.]
] <lem:hf-type-counts>

#proof[
  Projection and reordering follow by renaming the free tuple variables:
    an injection between the selected position sets extends to a permutation of the $M$ available variable names.
    Repeated atom values cause no problem; positions remain distinct,
    and equality formulas record all coincidences of values.
  First let $d = 1$ and write $a = \| P \|$. A realized type $rho$ of $\( a + 1 \)$-tuples can be isolated among
    the tuples of both finite structures by a single $C^M$ formula $theta_rho$.
    Indeed, choose a representative of $rho$. For every tuple in the two structures whose type differs from $rho$,
    choose a formula distinguishing it from the representative, negating the formula if necessary.
    The conjunction of this finite collection is true exactly on the tuples of type $rho$.
    Its free variables lie among the first $a + 1$ positions, and it still uses only the same $M$ variable names.
    If all tuples have type $rho$, use a tautology.
  If exactly $h$ extensions of $P$ realize $rho$, the formula
  $ exists^(= h) x_(a + 1) thin theta_rho \( x_1 \, dots.h \, x_a \, x_(a + 1) \) $
  is true at $P$. Equality of prefix types makes it true at $P'$ as well.
    This proves the one-coordinate assertion, including $h = 0$ and $a = 0$.
    For empty prefixes in different structures, the required equality of types is precisely their agreement on
    $C^M$ sentences.
  For $d > 1$, project $rho$ onto the first $a + d - 1$ positions, obtaining $sigma$.
    By induction the number of extensions of $P$ to type $sigma$ equals the corresponding number over $P'$.
    The one-coordinate argument, used both within a structure and between the two structures,
    shows that every tuple of type $sigma$ has the same number of last-coordinate extensions to type $rho$.
    Multiplying these two finite counts proves the assertion. ◻
]

=== 5.2 A common syntax for supported objects <a-common-syntax-for-supported-objects>

A #emph[molecule] is a tuple $alpha in A_i^s$. It records a support, but need not be a minimal support.
  We describe sets by a common collection of formal expressions, independent of the side $i$.

There are $s$ atomic forms $c_1 \, dots.h \, c_s$. A set form is a finite set of pairs $\( psi \, rho \)$,
  where $psi$ is a previously constructed form and $rho$ is a realized $C^M$ type of length $2
  s$ in $A_0$ or $A_1$. These are syntactic constructors: atomic forms are distinct from every set form,
  including the empty set form. A form has finite depth; set forms have greater depth than their constituent forms.

For a molecule $alpha in A_i^s$, define the value of a form recursively:

#[#set math.equation(numbering: n => "(19)")
 $ c_j * alpha & = alpha_j \,\
phi.alt * alpha & = { psi * beta : \( psi \, rho \) in phi.alt \, med beta in A_i^s \, med
  "tp"_M^(A_i) \( beta \, alpha \) = rho } quad upright("if ") phi.alt upright(" is a set form") .
  $ <eq:hf-atomic-form>]

This produces a finite set because both the form and the base universe are finite.
  The empty set form evaluates to the empty set.

#thm([Lemma 16.])[
  (Representation).  #emph[Every value $phi.alt * alpha$ belongs to $D_i$ and is supported by $alpha$.
    Conversely, every object of $D_i$ has such a representation. Moreover, for every $g in K_i$,
$ g \( phi.alt * alpha \) = phi.alt * \( g alpha \) . $

]
] <lem:hf-representation>

#proof[
  Automorphisms preserve $C^M$ types. Induction on the form therefore gives the displayed equivariance identity:
    in the set case, change the witness molecule $beta$ to $g beta$ in (19).
    If $g$ fixes $alpha$, this identity says that it fixes $phi.alt * alpha$.
    Induction also puts every member of a set-form value, and all of that member’s recursive constituents,
    in $D_i$. Atomic values have the required support directly.
  For the converse, induct on the hereditary rank of the object.
    An atom has the form $c_j * alpha$ for a molecule containing it.
    Let $x$ be a set in $D_i$, and choose a supporting molecule $alpha$.
    For each $y in x$, the induction hypothesis gives $y = psi_y * beta_y$. Form the finite set
  $ phi.alt = { \( psi_y \, "tp"_M \( beta_y \, alpha \) \) : y in x } . $
  Every member of $x$ lies in $phi.alt * alpha$. Conversely,
    a member of $phi.alt * alpha$ has the form $psi_y * beta$,
    where $\( beta \, alpha \)$ and $\( beta_y \, alpha \)$ have the same type.
    Homogeneity for tuples of length $2 s$ supplies an element $g in K_i$ mapping the second tuple to the first.
    In particular $g$ fixes $alpha$, so it fixes $x$. Equivariance gives $psi_y * beta = g y in x$.
    Thus $x = phi.alt * alpha$. For $x = diameter$, the construction gives the empty set form and the same conclusion. ◻
]

Representation reduces arbitrary finite rank to finite syntax.
  We next show that the syntax can be evaluated on either base structure without changing equality or membership,
  provided the supporting molecules have the same joint type.

#thm([Lemma 17.])[
  (Transfer of atomic facts).  #emph[Let $phi.alt \, psi$ be forms.
    Suppose $\( alpha \, beta \)$ and $\( alpha' \, beta' \)$ have the same $C^M$ type,
    where the two tuples may be in the same base structure or in different base structures. Then
$ phi.alt * alpha = psi * beta & quad arrow.l.r.double quad phi.alt * alpha' = psi * beta' \,\
phi.alt * alpha in psi * beta & quad arrow.l.r.double quad phi.alt * alpha' in psi * beta' . $

 The atom predicate and all base relations also agree on corresponding form values.]
] <lem:hf-atomic-transfer>

#proof[
  For equality, induct on the sum of the depths of the two forms.
    For two atomic forms, equality is an equality of molecule coordinates and is recorded by their joint type.
    An atomic value never equals a set-form value. It remains to compare two set forms.
  Suppose $phi.alt * alpha = psi * beta$. Take a member of $phi.alt * alpha'$ and a witness for it,
    say $\( theta \, rho \) in phi.alt$ and $gamma'$ with $"tp"_M \( gamma' \, alpha' \) = rho$.
    Lemma 15 extends the matching prefix $\( alpha \, beta \)$ to a tuple $\( alpha \, beta \, gamma \)$ with the
    type of $\( alpha' \, beta' \, gamma' \)$. Hence $theta * gamma$ is a member of $phi.alt * alpha$,
    and therefore of $psi * beta$. Choose a witness $\( xi \, sigma \) in psi$ and a molecule $zeta$ such that
  $ "tp"_M \( zeta \, beta \) = sigma \, wide theta * gamma = xi * zeta . $
  Apply the extension lemma once more, this time to the primed prefix of length $3 s$, to obtain $zeta'$ such that
  $ "tp"_M \( alpha \, beta \, gamma \, zeta \) = "tp"_M \( alpha' \, beta' \, gamma' \, zeta' \) . $
  This is the step requiring $4 s lt.eq M$. Projection preserves the two member-witness types.
    The induction hypothesis applies to $theta \, xi$, whose depths are strictly smaller than those of $phi.alt \,
    psi$, and gives $theta * gamma' = xi * zeta'$. Thus the chosen member belongs to $psi * beta'$.
    Interchanging $phi.alt$ and $psi$ proves the reverse inclusion.
    Finally interchange primed and unprimed data to prove both directions of equality transfer.
    The argument includes empty set forms: when there is no member to choose, the relevant inclusion is vacuous.
  For membership, the right-hand value is either an atom, in which case membership is false on both sides,
    or the value of a set form. In the latter case, a member witness $theta * gamma$ equal to $phi.alt *
    alpha$ can be transferred over the prefix $\( alpha \, beta \)$ using $3 s$ positions.
    Equality transfer, already established for all forms, then transfers the witness.
    Interchanging sides proves the converse.
  A form is atomic on both sides or a set form on both sides. Consequently the atom predicate transfers.
    A base relation is false if any argument is a set; otherwise it is a relation on selected molecule
    coordinates, and its truth is part of their joint base type. Repeated arguments are allowed throughout. ◻
]

=== 5.3 Matching entire domains while retaining parameters <matching-entire-domains-while-retaining-parameters>

An object may have several representations $phi.alt * alpha$.
  Thus equal counts of molecules do not by themselves give equal counts of objects.
  We will group represented values into stabilizer orbits and account for the number of molecules representing
  each value. This will give a bijection between the two domains after fixing the values of at most $m -
  1$ variables. The construction is a mathematical comparison;
  it is not required to be definable or executable by a choiceless program.

Call paired assignments #emph[represented alike] if their values have representations

$ x_j = phi.alt_j * alpha_j \, wide x'_j = phi.alt_j * alpha'_j quad \( 1 lt.eq j lt.eq r \) \, $

using common forms, and the concatenated tuples $P = \( alpha_1 \, dots.h \, alpha_r \)$ and
  $P' = \( alpha'_1 \, dots.h \, alpha'_r \)$ have the same $C^M$ type.
  Dropping a position preserves this condition by projection.
  Empty assignments are represented alike by the sentence-equivalence assumption.

#thm([Lemma 18.])[
  (A bijection extending retained assignments).  #emph[For any represented-alike assignments with $r lt.eq m - 1$,
    there is a bijection $f : D_0 arrow.r D_1$ such that adjoining any pair $x \,
    f \( x \)$ gives represented-alike assignments. In particular $f \( x_j \) = x'_j$ for every retained position.]
] <lem:hf-bijection>

#proof[
  Fix representing tuples $P \, P'$. A label is a pair $\( phi.alt \, tau \)$,
    where $phi.alt$ is a form and $tau$ is a realized base type of length $\( r + 1 \) s$.
    Associate to it the finite value sets
  $ X_(phi.alt \, tau) \( P \) = { phi.alt * gamma : gamma in A_0^s \, med "tp"_M \( P \, gamma \) = tau } $
  and $X_(phi.alt \, tau) \( P' \)$ on the other side. The extension-count lemma shows that the two sets are
    either both empty or both nonempty.
  Every nonempty value set is a single orbit of the stabilizer $K_(0 \, P)$.
    Indeed, any two molecules with the specified type over $P$ are carried to one another by an element fixing
    $P$, using homogeneity for $\( r + 1 \) s lt.eq m s$ positions.
    Equivariance carries their values along with them. Conversely,
    an element fixing $P$ preserves the specified joint type, and thus preserves the value set.
    The same assertion holds on the other side. It follows that two nonempty label sets on one side either
    coincide or are disjoint.
  Whether two labels overlap is the same on both sides. If an overlap has witnesses $gamma \,
    zeta$ on the first side, extend $P'$ to match the type of $\( P \, gamma \, zeta \)$. This uses
  $ \( r + 2 \) s lt.eq \( m + 1 \) s lt.eq M . $
  Projection preserves the two label conditions, and Lemma 17 preserves equality of the two values.
    Hence the label sets overlap on the second side. The converse is symmetric.
  We also need equality of the sizes of corresponding label sets. Fix a nonempty label.
    The number $n$ of molecules of its type over $P$ equals the number over $P'$, by Lemma 15.
    The map $gamma mapsto phi.alt * gamma$ from these molecules onto the label set has fibres of a common positive
    size: the stabilizer acts transitively on the molecules, and equivariance maps one fibre bijectively to
    another. Choose molecules $gamma \, gamma'$ whose joint types with the two prefixes match.
    The fibre at $phi.alt * gamma$ has size
  $ h = \| { zeta : "tp"_M \( P \, zeta \) = tau \, med phi.alt * gamma =
    phi.alt * zeta } #scale(x: 120%, y: 120%)[\|] . $
  Partition the possible $zeta$ by the finitely many realized types of $\( P \, gamma \, zeta \)$.
    On each such type the two displayed conditions are constant,
    both within either structure and between structures: use projection for the first condition and equality
    transfer for the second. Each type has the same number of extensions over $\( P \, gamma \)$ and
    $\( P' \, gamma' \)$, again using $\( r + 2 \) s lt.eq M$.
    Summing these finite counts shows that the fibre size $h$ agrees on the two sides.
    Both value sets therefore have size $n \/ h$.
  Representation shows that the label sets cover the domains.
    Their nonempty labels have the same equivalence relation on both sides,
    where two labels are equivalent when their value sets overlap.
    For each class, the common value set on the first side and the common value set on the second side are finite
    and have equal size. Choose a bijection between them. These bijections combine to a bijection $f : D_0 arrow.r
    D_1$, because different classes give disjoint value sets.
  There are only countably many labels: the base type sets are finite and the forms are finite expressions over
    them. No effective choice is being assumed here. For example,
    fix external enumerations of the two countable HF universes and of the labels;
    take the first label of each class and match its finite value sets in their external enumeration orders.
    These orders belong only to the proof.
  If $f$ pairs $x$ with $x'$, a representative label $\( phi.alt \, tau \)$ of their class gives molecules
    $gamma \, gamma'$ with $x = phi.alt * gamma$, $x' = phi.alt * gamma'$ and common joint type $tau$ over $P \,
    P'$. Thus the extended assignments are represented alike.
    If $x = x_j$ for a retained position, equality transfer forces $x' = x'_j$.
    This proves the last assertion as well. ◻
]

#proof[
  We prove by induction on $C^m$ formulas that represented-alike assignments agree on their truth values.
    Equality, membership, the atom predicate, and the input relations agree by Lemma 17;
    for atomic formulas using two distinct variables, project onto their two representing molecule blocks.
    With one repeated variable, equality is true and self-membership is false in $upright("HF")$;
    a diagonal base relation is false on a set and otherwise is determined by the corresponding atom coordinate in
    its molecule type. Boolean connectives preserve agreement.
  Consider a quantifier binding a variable $x$. Retain the assigned values of the other variable names,
    dropping the old value of $x$ if there is one. At most $m - 1$ positions remain.
    Lemma 18 gives a bijection of the domains under which every extension by $x$ is again represented alike.
    The induction hypothesis therefore makes this a bijection between the sets of values satisfying the quantified
    body. Existential truth agrees, and for every natural number $h$ the statement that this set has exactly $h$
    elements agrees. This proves the counting step even if that set is infinite:
    a bijection preserves finiteness and every finite cardinality.
    Universal quantifiers follow in the same way or by negation.
    Empty assignments are represented alike, so all $C^m$ sentences have the same truth value. ◻
]

Theorem 14 imposes no bound on the rank of an object or the depth of its representing form.
  The type-extension arguments require $4 s lt.eq M$ for equality transfer and $\( m + 1 \) s lt.eq
  M$ for the domain bijections. Orbit homogeneity is used at length $2
  s$ for representation and at length at most $m s$ when extending a retained assignment.
  These requirements are independent of rank. In the next section,
  the support theorem places every code and recursive constituent of a polynomial computation inside $D_i$.
  We then construct bounded-variable halt and output sentences evaluated on $D_i$,
  to which the transfer theorem applies.

== 6 Encoding complete choiceless computations <sec:coding>

The preceding transfer theorem concerns hereditarily finite sets with small supports.
  We now bring an arbitrary fixed choiceless computation into that setting.
  There are two separate points to prove: all constituents of its encoding lie in a polynomial-size invariant
  family, and its states can be defined by counting formulas whose number of variable names stays bounded
  throughout the computation. For our two inputs, which have the same size,
  this will give one common $C^m$ sentence for each stage’s halt test and output test,
  exact on their supported domains through the respective halt stages, with $m$ depending only on the program.

=== 6.1 The interpretation characterization <the-interpretation-characterization>

We use the binary-vocabulary formulation of the interpretation characterization of choiceless polynomial time with
  counting, due to Grohe, Schweitzer and Wiebking #cite(label("gsw2020")) Section 6 and Theorem 18,
  arXiv version 1, building on Grädel, Pakusa, Schalthöfer and Kaiser #cite(label("gkps2015")) Theorem 1.
  Here counting includes the cardinality operation on hereditarily finite sets.
  We spell out the exact direction and interpretation convention used below.

An interpretation from one fixed binary relational vocabulary to another consists of fixed, parameter-free formulas

$ delta \( x_1 \, x_2 \) \, wide eta \( x_1 \, x_2 \, y_1 \, y_2 \) \, wide rho_R \( x_1 \, x_2 \, y_1 \, y_2 \) $

in first-order logic with the Härtig quantifier. This quantifier compares the cardinalities of two sets of
  elements defined by formulas; the two formulas may have free variables in addition to their respective counted
  variables. On a finite structure with universe $V$, the interpretation first forms

$ D = { \( a_1 \, a_2 \) in V^2 : delta \( a_1 \, a_2 \) } . $

Let $tilde.op$ be the least equivalence relation on $D$ containing every pair $\( macron(a) \, macron(b) \)$
  satisfying $eta \( macron(a) \, macron(b) \)$. The new universe is $D \/ tilde.op$, and

$ R \( \[ macron(a) \] \, \[ macron(b) \] \) quad arrow.l.r.double quad
  upright("some ") macron(a)' tilde.op macron(a) \, med macron(b)' tilde.op macron(b) upright(" satisfy ")
  rho_R \( macron(a)' \, macron(b)' \) . $

Thus the interpretation is defined even when $eta$ itself is not an equivalence relation or $rho_R$ is not
  constant on classes. This is the convention in #cite(label("gsw2020")).

An interpretation program has one such initialization interpretation, one step interpretation,
  and fixed halt and output sentences in first-order logic with the Härtig quantifier.
  Write $A_0 = A$ for the input, $A_1 = I_(upright("init")) \( A_0 \)$, and $A_(j + 1) =
  I_(upright("step")) \( A_j \)$ for $j gt.eq 1$. The halt sentence is first tested at $A_1$.
  A deciding program halts at a stage $h gt.eq 1$, outputs the truth value of its output sentence there, and has

$ h + sum_(j = 1)^h \| V \( A_j \) \| $

bounded by a fixed polynomial in $\| V \( A \) \|$. The characterization says, in the direction needed here,
  that every property of finite binary relational structures definable in full choiceless polynomial time with
  counting is decided by such a program. The absence of parameters means that the fixed interpretations have no
  additional input-dependent distinguished tuple; it does not prohibit free tuple variables in their defining formulas.

Fix a deciding interpretation program $P$. On our two inputs of the same size $N$,
  choose a common integer $B gt.eq 2$ bounding $N$, both halt stages, and every state size up to halt.
  We may take $B$ to be a fixed polynomial bound depending only on $P$.

=== 6.2 A polynomial hereditary encoding <a-polynomial-hereditary-encoding>

For objects $a \, b$ in the universe of hereditarily finite sets over the input atoms, use the Kuratowski pair

$ chevron.l a \, b chevron.r = { { a } \, { a \, b } } . $

This coding is injective in the ordered pair, including when $a$ or $b$ is an atom.
  Indeed the intersection of its members is ${ a }$, while their union is ${ a \, b }$; after recovering $a$,
  the latter set determines $b$, also when $a = b$.

Encode the vertices of $A_0$ by the input atoms themselves.
  Suppose the vertices of $A_(j - 1)$ have already been encoded injectively.
  A vertex $C$ of $A_j$ is an equivalence class of domain pairs from $A_(j - 1)$. Define its payload and code by

$ S_C = { chevron.l a_1 \, a_2 chevron.r : \( a_1 \, a_2 \) upright(" is a pair of previous codes representing ")
  C } \, wide e_j \( C \) = chevron.l \[ j \] \, S_C chevron.r \, $

where $\[ j \] = { \[ 0 \] \, dots.h \, \[ j - 1 \] }$ is the von Neumann ordinal.
  Distinct classes have disjoint, nonempty sets of representing pairs, so their payloads, and hence their codes,
  are distinct. The payload records the whole class, so its construction does not choose a representative.
  The ordinal tag distinguishes vertices created at different stages, and stage-zero codes are atoms rather than sets.

#thm([Lemma 19.])[
  #emph[For either input, the input atoms, all vertex codes up to halt,
    and all objects recursively occurring as members of those codes belong to an $H$-invariant transitive family
    of at most $9 B^3$ objects.]
] <lem:trace-size>

#proof[
  At a single stage there are at most $B^2$ domain pairs. For each pair,
    its Kuratowski code and its two inner sets add at most three objects.
    There are at most $B$ classes; their payloads add at most $B$ objects,
    and the tagged vertex pairs add at most $3 B$ further objects.
    Previous vertex codes and their constituents have already been counted.
    Across all stages, the ordinal tags and their constituents add at most $B + 1$ objects.
    Including the at most $B$ input atoms, the total is at most
  $ B \( 3 B^2 + 4 B \) + 2 B + 1 lt.eq 9 B^3 $
  for $B gt.eq 2$. Taking the recursive membership closure therefore gives the stated transitive family.
  Every input automorphism preserves truth of the fixed interpretation formulas, including the Härtig quantifier.
    It therefore permutes the domain pairs, their generated equivalence classes, and all output relations.
    Inductively it permutes the vertex codes: it acts on a pair or set by acting on its constituents,
    and fixes every pure ordinal. It consequently preserves the family and its membership closure.
    In particular the input action of $H$ preserves this family. ◻
]

Since $B$ is polynomial in $N$, fix an integer $q gt.eq 1$, depending only on $P$, such that $9 B^3 lt.eq
  N^q$ for all sufficiently large $N$. Every $H$-orbit in the transitive trace family has at most $N^q$ objects.
  Corollary 9 therefore gives $K$-supports of the common length $s$ for every code and every recursive
  constituent. Thus the entire family lies in the corresponding supported domain $cal(D)_b$,
  including the payloads, all pair wrappers, and the ordinal tags.
  No bound on the rank of a code has been imposed: its nesting depth may grow throughout the computation.

=== 6.3 Exact formulas for the encoded states <exact-formulas-for-the-encoded-states>

All formulas in this subsection are evaluated in $cal(D)_b$ with its membership relation and its atomic input
  relations. Its domain is transitive, contains all input atoms and all pure hereditarily finite sets,
  and consists of atoms and sets. Consequently

$ sans(A t o m) \( x \) := sans(E d) \( x \, x \) or sans(C f) \( x \, x \) \, wide sans(S e t) \( x \) :=
  not sans(A t o m) \( x \) $

distinguish these two kinds of objects.

Let $U_0 \( x \) = sans(A t o m) \( x \)$ and let the stage-zero relation formulas be the input relations.
  Suppose that the formulas for the preceding stage are exact:
  $U \( x \)$ selects precisely its vertex codes, and its relation formulas describe exactly the state on those
  codes. Translate a fixed first-order formula with Härtig quantifiers by replacing state relation atoms by their
  defining formulas, retaining equality, and restricting ordinary quantifiers to $U$.
  In particular, equality is equality of the injective vertex codes, including for repeated variable arguments.
  Replace a Härtig comparison of $chi_1 \( x \)$ and $chi_2 \( y \)$ by

#[#set math.equation(numbering: n => "(20)")
 $ or.big_(n = 0)^B
   [#scale(x: 120%, y: 120%)[\(] exists^(= n) x thin \( U \( x \) and chi_1^(*) \) #scale(x: 120%, y: 120%)[\)]
   and #scale(x: 120%, y: 120%)[\(] exists^(= n) y thin \( U \( y \) and chi_2^(*) \)
   #scale(x: 120%, y: 120%)[\)]] . $ <eq:hartig-translation>]

Both counted sets have size at most $B$, so induction on formulas proves this translation exact,
  also when the state is empty. The superscript $*$ will denote this translation.

For the initialization or step interpretation appropriate to the new stage, put

$ sans(D o m) \( macron(a) \) := U \( a_1 \) and U \( a_2 \) and delta^(*) \( macron(a) \) \, wide
  macron(a) = \( a_1 \, a_2 \) . $

On two domain pairs define

$ sans(L i n k) \( macron(a) \, macron(b) \) := sans(D o m) \( macron(a) \) and sans(D o m) \( macron(b) \) and
  #scale(x: 120%, y: 120%)[\(] macron(a) = macron(b) or eta^(*) \( macron(a) \, macron(b) \) or
  eta^(*) \( macron(b) \, macron(a) \) #scale(x: 120%, y: 120%)[\)] \, $

where tuple equality abbreviates the two coordinate equalities. Define finite formulas recursively by

$ sans(R e a c h)_0 \( macron(a) \, macron(b) \) & := sans(L i n k) \( macron(a) \, macron(b) \) \,\
sans(R e a c h)_(t + 1) \( macron(a) \, macron(b) \) & :=
  sans(R e a c h)_t \( macron(a) \, macron(b) \) or exists macron(d)
  thin \( sans(R e a c h)_t \( macron(a) \, macron(d) \) and sans(L i n k) \( macron(d) \, macron(b) \) \) . $

This expresses paths of length at most $t + 1$ in the reflexive symmetric link graph.
  There are at most $B^2$ domain pairs, so $sans(R e a c h)_(B^2)$ is exactly the generated equivalence relation,
  and is false if either endpoint is outside the domain.

The generated quotient is now defined. We next recognize its hereditary codes;
  transitivity will ensure that membership tests identify the actual sets, not merely their visible members. Write

$ sans(S i n g) \( u \, a \) := sans(S e t) \( u \) and forall w thin \( w in u arrow.l.r w = a \) \, $

and

$ sans(D o u b l e) \( v \, a \, b \) := sans(S e t) \( v \) and
  forall w thin \( w in v arrow.l.r \( w = a or w = b \) \) . $

Then

$ sans(O P) \( z \, a \, b \) :=
  exists u thin exists v
  thin \( sans(S i n g) \( u \, a \) and sans(D o u b l e) \( v \, a \, b \) and sans(D o u b l e) \( z \, u \,
  v \) \) $

expresses $z = chevron.l a \, b chevron.r$ whenever that pair and its wrappers are present.
  Conversely every satisfying assignment gives the actual Kuratowski pair:
  transitivity ensures that the universally quantified membership tests cannot overlook a member outside the
  domain. Define the ordinal formulas by

$ sans(O r d)_i \( o \) := sans(S e t) \( o \) and forall w
  (w in o arrow.l.r or.big_(0 lt.eq h < i) sans(O r d)_h \( w \)) . $

The empty disjunction for $i = 0$ is false. All pure ordinals belong to $cal(D)_b$,
  and induction using transitivity shows that this formula selects precisely $\[ i \]$.

For stage $j gt.eq 1$, define

$ sans(P a y l o a d)_j \( S \, macron(a) \) :=  & sans(S e t) \( S \) and sans(D o m) \( macron(a) \)\
 &  and
   forall z
   (z in S arrow.l.r exists macron(b) thin \( sans(D o m) \( macron(b) \) and sans(R e a c h)_(B^2) \(
   macron(a) \, macron(b) \) and sans(O P) \( z \, b_1 \, b_2 \) \)) \,\
sans(R e p)_j \( x \, macron(a) \) :=  & exists o thin exists S
  thin \( sans(O r d)_j \( o \) and sans(P a y l o a d)_j \( S \, macron(a) \) and sans(O P) \( x \, o \, S \) \) \,\
U_j \( x \) :=  & exists macron(a) thin sans(R e p)_j \( x \, macron(a) \) \,\
R_j \( x \, y \) :=  & exists macron(a) thin exists macron(b)
  thin \( sans(R e p)_j \( x \, macron(a) \) and sans(R e p)_j \( y \, macron(b) \) and rho_R^(*) \( macron(a) \,
  macron(b) \) \) . $

The stage subscripts on the formulas and on their auxiliary definitions are syntactic indices,
  not additional free variables.

#thm([Lemma 20.])[
  #emph[At every stage through halt, $U_j$ selects exactly the vertex codes of $A_j$,
    and each $R_j$ defines exactly its corresponding binary state relation.
    The translated halt and output sentences are exact at every stage $j gt.eq 1$ through halt.]
] <lem:state-exactness>

#proof[
  The assertion at stage zero follows from the definition of the atomic input relations.
    Assume it for the preceding stage. Formula induction, including (20),
    makes $sans(D o m)$ and the interpretation formulas exact.
    The link graph and its bounded path formula therefore give exactly the required classes of domain pairs.
  For a domain pair $macron(a)$ representing a class $C$, every pair code belonging to $S_C$ and all its wrappers
    are in $cal(D)_b$, by Lemma 19 and the support theorem. Hence the right side of the payload biconditional
    selects exactly the elements of $S_C$. The true payload exists in the domain,
    while any satisfying payload has exactly those members, since the domain is transitive.
    Extensionality for sets gives $S = S_C$. The ordinal and ordered-pair formulas then force $x = e_j \( C \)$,
    with all required witnesses present. This proves the exactness of $sans(R e p)_j$ and $U_j$.
    If there are no domain pairs, both formulas are false for every candidate vertex, as required.
  Finally, $R_j$ holds precisely when some representatives of the two coded classes satisfy the defining relation
    formula. This is the chosen quotient semantics, so all relations are exact.
    Applying the same formula translation to the fixed halt and output sentences proves the last assertion. ◻
]

=== 6.4 A variable bound independent of the number of stages <a-variable-bound-independent-of-the-number-of-stages>

The formulas just constructed may be extremely long. What matters for the transfer theorem is a different
  syntactic bound. For a formula $theta$, define

$ "fw" \( theta \) := max_(xi upright(" a subformula of ") theta) \| "FV" \( xi \) \| . $

Here free variables are counted relative to the subformula $xi$ itself.
  Thus a variable bound outside $xi$ is counted if it occurs freely inside $xi$.

#thm([Lemma 21.])[
  #emph[Suppose predicates in a relational formula $T$ are replaced by formulas whose free variables are among
    their displayed argument variables and whose free-variable measure is at most $w$.
    Capture-avoiding substitution produces a formula of free-variable measure at most $max { "fw" \( T \) \, w }$.
    This allows repeated arguments and unused displayed argument variables.
    Moreover a formula of measure at most $w$ can be renamed to use at most $w + 1$ variable names.]
] <lem:substitution-width>

#proof[
  Before each insertion, rename its bound variables to avoid the argument variables and all possible capture.
    A subformula inside the inserted copy has the same free variables as its original counterpart,
    except that displayed argument variables are replaced by their actual variable arguments.
    This replacement can identify variables but cannot increase their number.
    A subformula inherited from the template gains no new free variables:
    the inserted formula has free variables only among the arguments of the atom it replaces.
    The claimed maximum bound follows. The argument also covers equality atoms, which are retained as equality,
    and atomic occurrences with repeated arguments.
  For the renaming claim, fix a palette of $w + 1$ names. Recursively process a formula node with an injective
    assignment of palette names to that node’s free variables.
    At a Boolean connective, restrict this assignment to each child’s free variables.
    At a binder $Q x thin xi$, keep the assigned names of the free variables of the parent and choose a name for
    $x$ outside those names. There is a spare name because there are at most $w$ parent free variables.
    If $x$ is free in $xi$, extend the assignment by this name;
    otherwise the binder is vacuous and the child keeps the parent assignment. Recursively rename the child.
    Its free-variable assignment is injective, and its size is at most $w$.
    Names may be reused in subtrees where the corresponding variable is not free.
    This preserves all bindings and truth, and applies equally to ordinary and exact-count quantifiers. ◻
]

Apply the lemma first to the fixed formulas of $P$. Replacing a Härtig quantifier by (20) may repeat a subformula
  $B + 1$ times but does not increase its free-variable sets with $B$;
  the finitely many program formulas therefore give a uniform bound for the translation templates.
  Pair coding, payloads, representatives, and domain and relation definitions also have fixed templates,
  with all free variables among their displayed arguments.

For example, the template for $sans(R e a c h)_(t + 1) \( macron(a) \, macron(b) \)$ uses only the endpoint pairs
  $macron(a) \, macron(b)$ and the quantified pair $macron(d)$.
  The inserted copy $sans(R e a c h)_t \( macron(a) \, macron(d) \)$ exposes only its four endpoint arguments;
  $macron(b)$ occurs in the other conjunct, $sans(L i n k) \( macron(d) \, macron(b) \)$,
  and is not a free parameter of that copy. Thus expansion takes the maximum of the previous width and the fixed
  template width, rather than adding the widths at successive levels.
  The same argument applies when a stage formula is inserted into the next stage’s template.
  The ordinal recursion has the simpler unary interface. Taking the maximum over these finitely many template
  widths and the bounds for the fixed formulas of $P$ gives a constant $w =
  w \( P \)$ for every fully expanded formula above. Unused or identified arguments can only reduce the number of
  free variables.

Set $m = max { 2 \, w + 1 }$. Lemma 21 puts all the expanded state, halt, and output formulas in $C^m$,
  independently of $N$, $B$, and the stage number. The numerical constants in the counting quantifiers and the
  lengths of these formulas may depend on $B$ and the stage.
  These are formulas used to compare two runs; they are not an additional nonuniform program.

== 7 Proof of the separation <sec:separation>

We now combine the invariant query, support bound, counting transfer and exact computation formulas.
  The constants controlling supports and formula width are fixed by the program before the grid is chosen.

#proof[
  The fixed eight-symbol vocabulary and the query $Q$ are given in Section 1.1.
    Proposition 2 proves that $Q$ is isomorphism-invariant and belongs to deterministic polynomial time.
    Suppose it were definable in full $upright("CPT")$ with counting.
    The interpretation characterization in Section 6 would give a fixed deciding interpretation program $P$.
  Choose its polynomial bound $B = B \( N \)$ and the constant $q$ from the trace bound,
    and choose the constant $m$ from the syntax. Take $L$ sufficiently large that the trace bound $9 B^3 lt.eq
    N^q$ and the width estimates below hold, and put $M = floor.l L^(7 \/ 4) floor.r$.
    Corollary 9 places both encoded traces in their supported domains with
  $ s = O_q #scale(x: 120%, y: 120%)[\(] L \( 1 + log L \)^2 #scale(x: 120%, y: 120%)[\)] . $
  Proposition 11 gives base $C^M$ equivalence, and Proposition 13 gives homogeneity for tuples of length at most
    $max { 2 \, m } s$: its width bound is $O_(q \, m) \( L^(3 \/ 2) \( 1 + log L \)^3 \) = o \( L^(7 \/ 4) \)$.
    We also have $max { 4 \, m + 1 } s lt.eq M$. These are exactly the hypotheses of Theorem 14,
    so the two supported domains agree on all $C^m$ sentences.
  Use the same $B$, ordinal indices, and syntactic definitions on both sides.
    Up to the earlier halt stage both sets of state definitions are exact.
    At that stage the common translated halt sentence is true on one side, hence also on the other;
    thus both computations halt there. Their common translated output sentence has the same truth value on both
    sides. No deciding interpretation program can therefore give opposite answers on the two structures.
  This contradicts Proposition 5, which gives $Q \( A_(b^0) \)$ and $not Q \( A_(b^1) \)$ for every $L gt.eq 2$.
    Therefore no such program exists, proving the theorem. ◻
]

== 8 Solvability and rank logic <sec:linear-algebraic-logics>

We now prove the linear-algebraic consequence stated in the introduction.
  The query $Q$ is defined on all finite structures. For Corollary 3 we take a nonempty input,
  so the matrix index sets below are nonempty. We use the two-sorted syntax of $upright("FPS")_3$ and
  $upright("FPR")_3$ in #cite(label("graedelPakusa2019")) Section 2.
  We first define its matrix without ordering the input, then encode consistency using the respective operators.

#proof[
  Write $X \( a \)$ and $Y \( a \)$ for the predicates defining $X$ and $Y$, and put $n = \# x \( x = x \)$,
    a closed numeric term. For $delta = 1 \, 2$, the counting terms
  $ d_delta \( y \, a \) = \# x #scale(x: 120%, y: 120%)[\(] Y \( x \) and sans(I) \( a \, x \) and
    sans(Z)_delta \( y \, x \) #scale(x: 120%, y: 120%)[\)] $
  give, for each fixed $r in { 0 \, 1 \, 2 }$, the FPC predicate
  $ C_r \( y \, a \) med equiv med exists eta lt.eq 3 n thick #scale(x: 120%, y: 120%)[\(] d_1 \( y \, a \) +
    2 d_2 \( y \, a \) = 3 eta + r #scale(x: 120%, y: 120%)[\)] . $
  Here $eta$ is a number variable. Since $d_1 + 2 d_2 lt.eq 3 n$, this says exactly that $C \( y \, a \) =
    r$ in $bb(F)_3$. It includes both contributions when $sans(Z)_1$ and $sans(Z)_2$ both hold,
    while $sans(Z)_0$ contributes zero. The row test is the first-order predicate
  $ T \( t \, y \) med equiv med X \( t \) and Y \( y \) and
    exists a thin exists x thin #scale(x: 120%, y: 120%)[\(] & X \( a \) and sans(V B) \( t \, a \) and Y \( x \)\
 &  and sans(I) \( a \, x \) and sans(E B) \( y \, x \) #scale(x: 120%, y: 120%)[\)] . $
  For nonempty $A$, use the full tuple domain $D = A^2 times { 0 \, 1 }$ for both rows and columns,
    with the last coordinate in the number sort. For $i = \( t \, y \, rho \)$ and $j = \( a \, z \, kappa \)$, define
  $ N \( i \) & equiv rho = 0 and t = y and X \( t \) \, & E \( i \) & equiv rho = 1 and T \( t \, y \) \,\
L \( j \) & equiv kappa = 0 and a = z and X \( a \) \, & U \( j \) & equiv kappa = 1 and a = z and Y \( a \) . $
  Set $b_i = upright(bold(1))_(N \( i \))$ and, over $bb(F)_3$, set
  $ M_(i j) =
    cases(delim: "{", 1 & N \( i \) and L \( j \) and sans(V B) \( t \, a \) \,, - C \( y \, a \) & E \( i \) and
    L \( j \) and sans(V B) \( t \, a \) \,, 1 & E \( i \) and U \( j \) and a = y \,, 0 & upright("otherwise") .) $
  The tags make these cases disjoint. The diagonal payloads give one column for each $lambda_a$ and one separately
    tagged column for each $mu_y$, even when $X$ and $Y$ overlap.
    They also give one normalization row for each $t in X$, while the $E$ rows retain every selected pair
    $\( t \, y \)$. All remaining rows and columns are zero, with right-hand side zero on those rows.
    Thus $M x = b$ is exactly the system defining $Q$, with harmless zero padding.
    In particular an empty $X_t$ still gives $0 = 1$. The predicates $B_r \( i \, j \)
    equiv \( M_(i j) = r \)$ for $r = 1 \, 2$ are FPC-definable from these cases and $C_1 \, C_2$.
  The solvability operator uses a Boolean matrix and an all-ones right-hand side;
    compare the general fixed-ring normal form in #cite(label("dghkp2013")) Lemma 4.1.
    For an explicit encoding here, use full row and column domains $D times { 0 \, 1 \, 2 \, 3 }$,
    with column tags denoting $x_j^1 \, x_j^2 \, z_j \, v_j$. For every $i in D$, the four row tags encode
  $ sum_(j : B_1 \( i \, j \)) x_j^1 + sum_(j : B_2 \( i \, j \)) \( x_j^1 + x_j^2 \) +
    upright(bold(1))_(not N \( i \)) v_i = 1 \,\
v_i = 1 \, wide x_i^1 + z_i = 1 \, wide x_i^2 + z_i = 1 . $
  All coefficients are zero or one: the two summands for $B_2$ use distinct columns.
    Their incidence is one FPC formula using $B_1 \, B_2 \, N$, equality of tuples in $D$,
    and the fixed numeric tags. Every row in the full product has one of the four stated types.
    The last two equations force $x^1 = x^2$; together with $v = 1$, the first equations then say $M x^1 = b$.
    Conversely, a solution $x$ of $M x = b$ extends by $x^1 = x^2 = x$, $z = 1 - x$, and $v = 1$.
    Hence one characteristic-three solvability operator defines $Q$.
  For rank, let $upright(bold(1))_psi$ denote the numeric counting term $\# zeta lt.eq 0 . psi$,
    where $zeta$ is a number variable, and put $m \( i \, j \) = upright(bold(1))_(B_1 \( i \, j \)) +
    2 upright(bold(1))_(B_2 \( i \, j \))$. On rows $D$ and columns $D times { 0 \, 1 }$, with numeric tag $h$,
    use the entry terms
  $ Theta_0 \( i \; j \, h \) & = upright(bold(1))_(h = 0) m \( i \, j \) \,\
Theta_(+) \( i \; j \, h \) & = Theta_0 \( i \; j \, h \) + upright(bold(1))_(h = 1 and N \( i \)) . $
  The first matrix is $M$ with zero columns; the second adjoins one copy of $b$ for each $j in D$.
    Since $D$ is nonempty, those identical copies span the same space as one augmented column.
    The rank operator reduces numeric entries modulo three, so
  $ Q \( A \) quad arrow.l.r.double quad "rk"_3 \( Theta_0 \) = "rk"_3 \( Theta_(+) \) . $
  All domains used above are permitted Cartesian products with fixed numeric bounds;
    none chooses or orders an input element.
  Finally, the proof of Theorem 1 uses only the nonempty witnesses with $L gt.eq 2$,
    so these definitions prove both noncontainments. The empty input remains a true instance of $Q$ under its
    definition in Section 1.1. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
