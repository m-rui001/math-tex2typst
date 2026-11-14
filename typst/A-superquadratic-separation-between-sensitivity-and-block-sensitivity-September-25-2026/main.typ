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

#align(center)[#text(size: 16pt, weight: "bold")[A superquadratic separation between sensitivity \
and block sensitivity]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Sensitivity measures how many individual input bits can change a Boolean function’s value;
  block sensitivity allows disjoint sets of bits to be flipped instead.
  We construct total Boolean functions for which the second quantity grows faster than any constant multiple of
  the square of the first.

For a positive integer $n$, write $\[ n \] = { 1 \, dots.h \, n }$.
  If $x in { 0 \, 1 }^n$ and $B subset.eq \[ n \]$, let $x^B$ be obtained by flipping precisely the coordinates in
  $B$; abbreviate $x^({ a })$ to $x^a$. For a total Boolean function $f : { 0 \, 1 }^n arrow.r { 0 \, 1 }$, define

$ s \( f \, x \) = \| { a in \[ n \] : f \( x^a \) eq.not f \( x \) } #scale(x: 120%, y: 120%)[\|] \, wide
  s \( f \) = max_x s \( f \, x \) . $

Its block sensitivity $"bs" \( f \, x \)$ is the largest number of pairwise disjoint nonempty sets $B_1 \,
  dots.h \, B_m subset.eq \[ n \]$ such that $f \( x^(B_j) \) eq.not f \( x \)$ for every $j$, and $"bs" \( f \) =
  max_x "bs" \( f \, x \)$.

The Sensitivity Conjecture asked whether block sensitivity is bounded by a polynomial in sensitivity,
  uniformly over the number of inputs and the function. The question goes back to Nisan’s work on parallel
  computation, which introduced block sensitivity and already recorded Rubinstein’s quadratic separation
  #cite(label("Nisan1989")) Section 2. Nisan and Szegedy studied the problem through the degree of the unique
  multilinear real polynomial representing a Boolean function,
  and explicitly suggested the quadratic inequality $"bs" \( f \) lt.eq
  s \( f \)^2$ #cite(label("NisanSzegedy1994")) Section 4. Rubinstein’s construction
  #cite(label("Rubinstein1995")) showed that a polynomial upper bound would need degree at least two.
  Virza improved the separation to $"bs" \( f \) = 1 / 2 s \( f \)^2 + 1 / 2 s \( f \)$ #cite(label("Virza2011")),
  and Ambainis and Sun subsequently obtained examples satisfying

$ "bs" \( f \) = 2 / 3 s \( f \)^2 - 1 / 3 s \( f \) $

#cite(label("AmbainisSun2011")) Theorem 1. These improvements left open whether any universal quadratic upper
  bound could hold.

Huang resolved the polynomial conjecture in 2019. His degree bound,
  together with Tal’s refinement of the degree–block-sensitivity comparison #cite(label("Tal2013")),
  gives $"bs" \( f \) lt.eq s \( f \)^4$ for every total Boolean function #cite(label("Huang2019")) Theorem 1.5.
  Wellens later improved its leading constant, proving $"bs" \( f \) lt.eq sqrt(2 \/ 3) thin s \( f \)^4 +
  1$ #cite(label("Wellens2022")) Corollary 4.2. These results settle the polynomial question.
  The theorem below rules out its quadratic strengthening.

#thm([Theorem 1.1.])[
  #emph[For every real $C > 0$, there are a positive integer $n$ and a nonconstant total Boolean function $f :
    { 0 \, 1 }^n arrow.r { 0 \, 1 }$ such that
$ "bs" \( f \) > C thin s \( f \)^2 . $

 More precisely, for every integer $d gt.eq 1$ the construction below gives a nonconstant total Boolean function
   $f$ with
$ frac("bs" \( f \), s \( f \)^2) gt.eq frac(2^d, 4 \( d + 2 \)^2) . $

]
] <thm:main>

===== 1.1 Method and relation to spectral sensitivity. <method-and-relation-to-spectral-sensitivity.>

Meiburg’s spectral-sensitivity construction uses tournament-indexed rows of positive conditions and one selected
  blocking coordinate in each outgoing row #cite(label("Meiburg2026")) Sections 3.1 and 5.2–5.5.#footnote[In the
  attribution accompanying this construction, Meiburg credits GPT-5.6-Sol with the gated-tournament ideas and
  describes his own contributions as exposition, size and parameter optimization,
  and checking the faithfulness of the Lean formalization.] Random labels exclude small local configurations in
  which many accepting subcubes lie close to the same accepting input.
  We adapt this architecture to nested predicates, using a different forbidden-label condition and a direct union
  bound. Simultaneous changes of two predicates then control ordinary sensitivity under recursion.

The distinction between the two sensitivity measures matters here.
  The sensitivity graph joins adjacent cube inputs exactly when the function changes value.
  Its maximum degree is $s \( f \)$; spectral sensitivity $lambda \( f \)$ is the operator norm of its adjacency
  matrix #cite(label("AaronsonEtAl2021")). Since $lambda \( f \) lt.eq s \( f \)$,
  a lower bound on $"bs" \( f \) \/ lambda \( f \)^2$ alone does not supply the ordinary-sensitivity separation in
  Theorem 1. The needed estimates are proved directly below, without a spectral input.

===== 1.2 Construction and proof strategy. <construction-and-proof-strategy.>

We recursively construct nested families of Boolean predicates:
  their accepting sets decrease as the predicate index increases.
  At a recursive step, the input is partitioned into disjoint child inputs arranged in rows,
  and every pair of rows is given one directed edge. Each edge is labelled by a position in its destination row.
  A clause associated with row $i$ has target conditions requiring the strongest child predicate to accept every
  child in that row. For each edge from $i$ to another row,
  it also requires a weaker child predicate to reject the child selected by the edge label.
  The parent predicate accepts when one of these clauses holds.
  Varying the weaker predicate used in these gate conditions produces a new nested family.

Fix one parent predicate at a rejecting input, and consider clauses that can become satisfied after one bit
  changes. A bit belongs to only one child and hence affects only one condition of a fixed clause.
  The candidate clauses therefore fail exactly one target condition or one gate condition, and no other condition.
  The edge labels bound the number of candidates of the first kind.
  The tournament allows at most three candidates of the second kind,
  and all but at most one have their failed gate in a row whose strongest child predicates all accept.
  Repairing such a gate must reverse both its weaker predicate and the strongest predicate on the same child.
  We consequently track the number of bits that reverse a fixed pair of distinct predicates simultaneously,
  in addition to ordinary sensitivity. For a gate repair that makes a clause hold for two rejecting parent
  predicates, the two corresponding child gate predicates must both change, even in the possible exceptional clause.

The initial family consists of indicators of unions of Hamming balls with successive integer radii around
  separated centres. One bit cannot cross two of these radii, so all its joint sensitivities vanish.
  Section 2 gives this family, the required edge labelling, and common disjoint sensitive blocks at zero.
  Section 3 then proves the four coupled sensitivity bounds for arbitrary inputs.
  With a size parameter $M$ chosen sufficiently large for each fixed depth,
  their normalization in Section 4 bounds sensitivity growth by essentially a factor $M$ per level,
  while the number of disjoint sensitive blocks grows by $2 M^2 + 1$.
  An OR of disjoint copies balances the sensitivities at zero and one,
  following the principle used by Ambainis and Sun #cite(label("AmbainisSun2011")) Section 4, Lemma 1.

Finally, Lemma 7 amplifies a fixed seed with $f \( 0 \) =
  0$ and $"bs" \( f \, 0 \) > s \( f \)^2$ into the fixed power separation of Corollary 8.
  Ambainis and Prūsis explicitly noted that a seed with block sensitivity greater than sensitivity squared would
  yield a superquadratic power separation by iteration #cite(label("AmbainisPrusis2014")) Section 1.
  Composition as an amplification method is treated systematically by Tal #cite(label("Tal2013"));
  we prove the sensitivity upper bound and zero-input block lower bound used here.

== 2 The labelled tournament and nested predicates <sec:construction>

We construct the recursive predicates and the blocks that will witness their block sensitivity at zero.
  The sensitivity estimates require control at every input,
  so we also define the ordinary and joint profiles passed from one level to the next.

Fix integers $d gt.eq 1$ and $M gt.eq 3$, and put

$ L = d + 2 \, wide k = 2 M^2 + 1 \, wide r = ceil.l sqrt(M) ceil.r \, wide t = 16 . $

We will choose $M$ as a function of $d$ in Section 4. A tournament is an orientation of every pair of distinct
  vertices: exactly one of $i arrow.r j$ and $j arrow.r i$ holds.
  Use a tournament on $\[ k \]$ in which every vertex has outdegree $M^2$.
  For example, place the vertices cyclically and direct an edge from each vertex to the next $M^2$ vertices.

The tournament rows and selected blocking coordinates adapt the architecture of
  Meiburg #cite(label("Meiburg2026")) Sections 3.1 and 5.2–5.5.
  The specific label property needed for the ordinary-sensitivity argument is the following elementary consequence
  of independent random labels.

#thm([Lemma 2.1.])[
  #emph[The edges can be labelled by numbers $a \( i \, j \) in \[ r \]$ so that there is no set $I
    subset.eq \[ k \]$ of size $t$ admitting choices $m_j in \[ r \]$, $j in I$, with
$ a \( i \, j \) = m_j wide upright("for every edge ") i arrow.r j upright(" within ") I . $

]
] <lem:labelling>

#proof[
  Choose all edge labels independently and uniformly from $\[ r \]$.
    For fixed $I$ and fixed choices $\( m_j \)_(j in I)$, the probability of all the stated equalities is
    $r^(- binom(t, 2))$. There are at most $k^t r^t$ choices to consider, so the probability of any violation is at most
  $ k^16 r^(- 104) lt.eq \( 3 M^2 \)^16 \( sqrt(M) \)^(- 104) = 3^16 M^(- 20) < 1 . $
  Here $k lt.eq 3 M^2$, $r gt.eq sqrt(M)$, and $M gt.eq 3$. Thus a labelling with the required property exists. ◻
]

Fix such a labelling for the remainder of the construction. For $0 lt.eq ell lt.eq d$, set

$ H_ell = d + 1 - ell \, wide N_ell = L M \( k r \)^ell . $

We construct predicates $P_(ell \, q) : { 0 \, 1 }^(N_ell) arrow.r { 0 \, 1 }$, $1 lt.eq q lt.eq H_ell$,
  that are nested in the sense that

$ P_(ell \, 1) \( x \) gt.eq P_(ell \, 2) \( x \) gt.eq dots.h.c gt.eq P_(ell \, H_ell) \( x \) quad
  upright("for every ") x . $

Throughout, nesting concerns the predicate index, not the input bits.

=== 2.1 Initial predicates <initial-predicates>

Partition $\[ L M \]$ into $M$ blocks $E_1 \, dots.h \, E_M$, each of size $L$.
  Let $z_j$ be the string that is one precisely on $E_j$. Write $"dist" \( x \, z \)$ for Hamming distance and set

$ D \( x \) = min_(j in \[ M \]) "dist" \( x \, z_j \) \, wide P_(0 \, q) \( x \) =
  upright(bold(1)) { D \( x \) lt.eq H_0 - q } . $

These predicates are nested. Their radii are the integers from $d$ down to zero,
  while distinct centres have distance $2 L = 2 d + 4$.

=== 2.2 Recursive clauses <recursive-clauses>

Suppose $1 lt.eq ell lt.eq d$. Partition the input into $k r$ disjoint children $x_(j \, c) in { 0 \,
  1 }^(N_(ell - 1))$, arranged in $k$ rows $j in \[ k \]$, each with $r$ positions $c in \[ r \]$.
  For this level put $H = H_ell$ and $Q = H + 1 = H_(ell - 1)$. For $q in \[ H \]$, let clause $i$ at index $q$ assert

#[#set math.equation(numbering: n => "(1)")
 $ P_(ell - 1 \, Q) \( x_(i \, c) \) & = 1 &  & upright("for all ") c in \[ r \] \,\
P_(ell - 1 \, Q - q) \( x_(j \, a \( i \, j \)) \) & = 0 &  & upright("for all ") i arrow.r
  j . $ <eq:predicate-definition>]

Call the first line its #emph[target conditions] and the second line its #emph[gate conditions].
  Figure 1 depicts the target row and one outgoing gate. Define $P_(ell \, q) \( x \) =
  1$ if at least one clause is satisfied, and zero otherwise. All indices are valid: $1 lt.eq Q - q lt.eq H < Q$.
  Within a single clause, all $r + M^2$ conditions use distinct children.
  Indeed, targets use row $i$, each gate uses another row, and there is only one edge from $i$ to any given row.
  Consequently a change of one raw input bit can affect at most one condition of that clause.
  The same bit can affect several clauses, which will cause no problem when taking upper bounds by unions of sets
  of bits.

By induction, increasing $q$ makes each gate condition stronger:
  the index $Q - q$ decreases, and requiring a larger nested predicate to be zero is more restrictive.
  Targets do not change. Thus each clause, and hence each $P_(ell \, q)$, is nested as asserted.
  This recursion defines total Boolean functions on exactly $N_ell = k r N_(ell - 1)$ bits.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.2822cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Row $i$: all $r$ children#linebreak() $P_( ell -1,Q)(x_(i,c))=1$]]])])
  content((6, 0), [#box(inset: 0.2822cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Row $j$: child $a(i,j)$#linebreak() $P_( ell -1,Q-q)(x_(j,a(i,j)))=0$]]])])
  line((1.774, 0), (4.303, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3, 0), [#text(size: 9pt)[$i arrow.r j$]], anchor: "south", padding: 0.1176cm)
  content((0, -1.315), [#text(size: 9pt)[One target condition#linebreak()per child in row $i$]])
  content((6, -1.327), [#text(size: 9pt)[One gate condition#linebreak()per outgoing neighbour $j$]])
})],
  caption: [Figure 1: One recursive clause. The edge label selects a single child in each outgoing neighbour’s row. Raising $q$ strengthens the gates; all targets use the strongest child predicate $Q$. ],
) <fig:clause>

=== 2.3 Sensitivity profiles and the initial bounds <sensitivity-profiles-and-the-initial-bounds>

For $b in { 0 \, 1 }$, define

$ S_(ell \, b) = max_(1 lt.eq q lt.eq H_ell \, med x in { 0 \, 1 }^(N_ell)\
P_(ell \, q) \( x \) = b) \| { a in \[ N_ell \] : P_(ell \, q) \( x^a \) = 1 - b } #scale(x: 120%, y: 120%)[\|] . $

We also keep track of simultaneous changes of two distinct predicates:

$ J_(ell \, b) = max_(1 lt.eq q < q' lt.eq H_ell \, med x in { 0 \, 1 }^(N_ell)\
P_(ell \, q) \( x \) = P_(ell \, q') \( x \) = b) \| { a in \[ N_ell \] : P_(ell \, q) \( x^a \) =
  P_(ell \, q') \( x^a \) = 1 - b } #scale(x: 120%, y: 120%)[\|] . $

A maximum over no cases is defined to be zero; in particular $J_(d \, 0) = J_(d \, 1) = 0$, since $H_d = 1$.
  The two predicates in the definition of $J_(ell \, b)$ are evaluated on the same input and changed by the same
  raw input bit.

#thm([Lemma 2.2.])[
  #emph[The initial sensitivity profiles satisfy
#[#set math.equation(numbering: n => "(2)")
 $ S_(0 \, 0) lt.eq L \, wide S_(0 \, 1) lt.eq L M \, wide J_(0 \, 0) = J_(0 \, 1) = 0 . $ <eq:base-profile>]

]
] <lem:base>

#proof[
  Fix a predicate of radius $R = H_0 - q in { 0 \, dots.h \, d }$ and an input $x$ at which it is zero.
    If flipping one bit makes it one, some centre must be at distance exactly $R + 1$ from $x$.
    There is at most one centre within distance $d + 1$ of $x$:
    two such centres would have distance at most $2 d + 2 < 2 L$.
    Thus every successful bit flip must move towards the same centre, giving at most $R + 1 lt.eq d + 1 lt.eq
    L$ possibilities. The bound on $S_(0 \, 1)$ is simply the number $L M$ of input bits.
  For adjacent inputs $x \, y$, the triangle inequality gives $D \( x \) lt.eq D \( y \) + 1$,
    and the reverse inequality follows by symmetry. Hence $\| D \( x \) - D \( y \) \| lt.eq 1$.
    To change both predicates with distinct integer radii from zero to one, or both from one to zero,
    would require $D$ to change by at least two. Both joint sensitivities are therefore zero. ◻
]

=== 2.4 Disjoint blocks at zero <disjoint-blocks-at-zero>

#thm([Lemma 2.3.])[
  #emph[At every level $0 lt.eq ell lt.eq d$, all predicates are zero at the all-zero input.
    There are $M k^ell$ pairwise disjoint nonempty blocks of coordinates, each of size $L r^ell$,
    such that flipping any one block at zero makes every predicate at that level equal to one.]
] <lem:blocks>

#proof[
  At level zero, $D \( 0 \) = L > d$, and the blocks $E_j$ have the stated property because $0^(E_j) = z_j$.
    Suppose the claim holds at level $ell - 1$. At the all-zero input, every target predicate is zero,
    so every clause fails at level $ell$.
  Enumerate the preceding-level block family as $B_1 \, dots.h \, B_(M k^(ell - 1))$.
    For each row $i$ and each family index $h$, take the union of the copies of $B_h$ in all $r$ children of row
    $i$. Flipping this union makes the strongest predicate in each of those children equal to one,
    so all targets for clause $i$ hold. All gate children of clause $i$ lie in other rows and remain zero,
    so its gates hold for every $q$. Thus every $P_(ell \, q)$ is one after the flip.
    Within a row these unions are disjoint because the preceding-level blocks are disjoint in every child;
    unions from different rows are also disjoint. There are $k dot.op M k^(ell - 1) = M k^ell$ of them,
    each of size $r dot.op L r^(ell - 1) = L r^ell$, as required. ◻
]

== 3 Sensitivity recurrences <sec:recurrences>

The joint profiles bound simultaneous changes of a fixed pair of predicates on the same child.
  The following estimates hold for every input, including inputs far from the blocks used in Lemma 4.

#thm([Proposition 3.1.])[
  #emph[For $1 lt.eq ell lt.eq d$, write $S'_b = S_(ell - 1 \, b)$ and $J'_b = J_(ell - 1 \, b)$. Then
#[#set math.equation(numbering: n => "(3)")
 $ S_(ell \, 1) & lt.eq M^2 S'_0 + r S'_1 \, & wide J_(ell \, 1) & lt.eq M^2 J'_0 + r S'_1 \,\
S_(ell \, 0) & lt.eq t S'_0 + S'_1 + 3 J'_1 \, & wide J_(ell \, 0) & lt.eq t S'_0 + 3 J'_1 . $ <eq:recurrences>]

]
] <prop:recurrences>

#proof[
  Fix $ell$, put $H = H_ell$ and $Q = H + 1$, and recall Equation (1).
    For predicate index $q$, every target tests $P_(ell - 1 \, Q) =
    1$ and every gate tests $P_(ell - 1 \, Q - q) = 0$ on its specified child.
    The targets of clause $i$ lie in row $i$, and its gates lie in distinct other rows.
    Thus each condition of a fixed clause uses a different child.
  All flips below are flips of individual coordinates of the original Boolean input.
    Such a flip affects exactly one child. It may change several nested predicates of that child;
    we make no restriction on the number of thresholds it crosses.
    Nevertheless, at a fixed parent index it can change at most one condition of any fixed clause.
    A child may occur in several different clauses, so when counting possible flips over clauses we use a union bound.
  #emph[Transitions from one.] Fix an input where $P_(ell \, q) = 1$, and choose a clause satisfied there.
    Every flip taking this predicate to zero must break that fixed clause.
    It either changes a gate predicate from zero to one or changes a target predicate from one to zero.
    There are $M^2$ gate children and $r$ target children, giving at most $M^2 S'_0 + r S'_1$ such flips.
  Next fix $q < q'$ and an input where both parent predicates are one.
    Choose a clause initially satisfied for $q'$; nesting makes it satisfied for $q$ as well.
    This same clause is fixed for all flips being counted. A flip taking both parent predicates to zero must
    either break one of its targets, accounting for at most $r S'_1$ flips,
    or leave all its targets true and fail a gate even for $q$. Put
  $ g = Q - q \, wide g' = Q - q' \, wide 1 lt.eq g' < g < Q . $
  At such a gate, initially $P_(ell - 1 \, g') = 0$ because the clause holds for $q'$,
    and nesting gives $P_(ell - 1 \, g) = 0$. Failure of the gate for $q$ after the flip means $P_(ell - 1 \, g) =
    1$, and nesting then gives $P_(ell - 1 \, g') = 1$. The two distinct child predicates therefore both change
    from zero to one. Each of the $M^2$ gates contributes at most $J'_0$ such flips.
    This proves both inequalities on the one side.
  #emph[The initial candidate clauses at a zero.] Fix $q$ and an input $x$ with $P_(ell \, q) \( x \) = 0$.
    Let $cal(T)$ be the set of clauses that at $x$ fail exactly one target and no gate,
    and let $cal(G)$ be the set that fail exactly one gate and no target.
    These sets are determined by $x$ and $q$, before a flipped coordinate is chosen.
    Every flip making $P_(ell \, q)$ one satisfies some previously false clause.
    Since only one condition of that clause can change, the clause belongs to $cal(T) union cal(G)$,
    and its unique failed condition must be repaired.
  For each $j in cal(T)$, let $m_j in \[ r \]$ be the position of its unique failed target.
    If $i \, j in cal(T)$ and $i arrow.r j$, clause $i$ has a passing gate in child $\( j \, a \( i \, j \) \)$.
    Its gate predicate $P_(ell - 1 \, Q - q)$ is zero, so by nesting its target predicate $P_(ell - 1 \, Q)$ is
    also zero. The unique failed target in row $j$ is at position $m_j$, forcing $a \( i \, j \) = m_j$.
    Consequently a set of $t$ vertices in $cal(T)$ would violate Lemma 2. Thus $\| cal(T) \| < t$.
    Repairing a clause in this list requires changing its unique failed target from zero to one,
    and accounts for at most $S'_0$ flips per clause. Their total contribution is at most $t S'_0$.
  All targets in the row of a vertex of $cal(G)$ are initially true.
    Hence an edge $i arrow.r j$ within $cal(G)$ gives a failed gate of clause $i$:
    the gate child in row $j$ has $P_(ell - 1 \, Q) = 1$, which forces $P_(ell - 1 \, Q - q) = 1$.
    A clause in $cal(G)$ has just one failed gate, so every outdegree in the induced tournament on $cal(G)$ is at
    most one. With $m = \| cal(G) \|$, counting its edges gives
  $ frac(m \( m - 1 \), 2) lt.eq m \, wide upright("and hence") wide m lt.eq 3 . $
  There is at most one vertex of outdegree zero in this induced tournament,
    since the edge between any two vertices leaves one of them.
  If $i in cal(G)$ has an outgoing edge $i arrow.r j$ inside $cal(G)$, that edge is its unique failed gate.
    On the corresponding child, initially
  $ P_(ell - 1 \, Q - q) = P_(ell - 1 \, Q) = 1 . $
  Repairing the gate sets $P_(ell - 1 \, Q - q) = 0$ and therefore also sets $P_(ell - 1 \, Q) = 0$.
    The indices $Q - q$ and $Q$ are distinct because $q gt.eq 1$, so at most $J'_1$ flips repair this clause.
    The fact that such a flip destroys a target in row $j$ causes no problem:
    the accepting witness is clause $i$, whose own targets and other gates are unchanged.
    The possible vertex with no outgoing edge inside $cal(G)$ contributes at most $S'_1$,
    by counting flips of its unique failed gate. Since $\| cal(G) \| lt.eq 3$,
    its entire contribution is at most $S'_1 + 3 J'_1$. Together with the target contribution this proves
    $S_(ell \, 0) lt.eq t S'_0 + S'_1 + 3 J'_1$.
  #emph[Joint transitions from zero.] Fix $q < q'$ and an input $x$ where both parent predicates are zero,
    and form the same initial lists $cal(T) \, cal(G)$ for the weaker index $q$.
    Consider a flip making both predicates one, and choose any clause satisfied afterward for $q'$.
    It is also satisfied afterward for $q$, so it belongs to those fixed initial lists.
    The choice of this final witness may depend on the flipped coordinate; the lists themselves do not.
    A genuine final witness also had exactly one failed condition at $q'$ initially,
    by the same distinct-child argument. Members of the weaker lists that have additional unrepaired failures at
    $q'$ simply contribute no flips.
  A witness in $cal(T)$ is counted by the preceding target bound $t S'_0$.
    For a witness in $cal(G)$, let $g = Q - q$ and $g' = Q - q'$, so $1 lt.eq g' < g < Q$.
    Its unique failed gate at index $q$ has $P_(ell - 1 \, g) = 1$ initially,
    and nesting gives $P_(ell - 1 \, g') = 1$ initially as well.
    To satisfy the clause for $q'$ afterward, the same child must have $P_(ell - 1 \, g') = 0$,
    which forces $P_(ell - 1 \, g) = 0$. Thus both distinct child predicates change from one to zero,
    and each such clause contributes at most $J'_1$. This reasoning applies also to the possible vertex with no
    outgoing edge inside $cal(G)$: the second parent index supplies the second child threshold,
    without requiring any initial target value at the failed gate. The gate contribution is therefore at most $3 J'_1$.
  Every joint-success coordinate is thus counted by a clause in the fixed lists $cal(T)$ or $cal(G)$,
    so a union bound gives $J_(ell \, 0) lt.eq t S'_0 + 3 J'_1$.
  All bounds hold for every relevant input and for each fixed index or pair of indices,
    so taking the maxima gives the proposition. If $H = 1$, there is no pair of distinct parent indices and both
    joint inequalities hold by the empty-maximum convention. ◻
]

== 4 Quantitative bounds and separation <sec:separation>

The dominant terms $M^2 S'_0$ and $S'_1$ in Proposition 5 suggest normalizing $S_(ell \, b)$ by $M^(ell + b)$.
  The joint profiles vanish initially; choosing $M$ large relative to $d$ keeps their contribution small through
  the prescribed depth. The following bound makes this choice explicit.

#thm([Lemma 4.1.])[
  #emph[Suppose that $d gt.eq 1$ and $M gt.eq 9^(d + 1)$. For every $0 lt.eq ell lt.eq d$ and $b in { 0 \, 1 }$,
    the predicates of the construction satisfy
$ S_(ell \, b) lt.eq 2 L M^(ell + b) . $

]
] <lem:quantitative-profiles>

#proof[
  Define
  $ u_ell = max_(b in { 0 \, 1 }) S_(ell \, b) / M^(ell + b) \, wide v_ell = max_(b in { 0 \, 1 }) J_(ell \, b) /
    M^(ell + b) \, wide epsilon.alt = frac(max \( r \, t \), M) . $
  The base bounds in (2) give $u_0 lt.eq L$ and $v_0 = 0$. For $1 lt.eq ell lt.eq d$,
    dividing the four inequalities in Proposition 5 by the corresponding powers of $M$ gives
  $ S_(ell \, 1) / M^(ell + 1) & lt.eq (1 + r / M) u_(ell - 1) \, & wide S_(ell \, 0) / M^ell & lt.eq
    (1 + t / M) u_(ell - 1) + 3 v_(ell - 1) \,\
J_(ell \, 1) / M^(ell + 1) & lt.eq r / M u_(ell - 1) + v_(ell - 1) \, & J_(ell \, 0) / M^ell & lt.eq t /
  M u_(ell - 1) + 3 v_(ell - 1) . $
  Consequently,
  #[#set math.equation(numbering: n => "(4)")
   $ u_ell & lt.eq \( 1 + epsilon.alt \) u_(ell - 1) + 3 v_(ell - 1) \,\
v_ell & lt.eq epsilon.alt u_(ell - 1) + 3 v_(ell - 1) . $ <eq:normalized-recurrences>]
  The forcing term for $v_ell$ is at most $epsilon.alt u_(ell - 1)$,
    while its inherited contribution is multiplied by at most three.
    We therefore make $epsilon.alt$ small compared with $3^(- d)$.
    Since $M gt.eq 81$, both $r = ceil.l sqrt(M) ceil.r lt.eq 2 sqrt(M)$ and $t = 16 lt.eq 2 sqrt(M)$. It follows that
  #[#set math.equation(numbering: n => "(5)")
   $ epsilon.alt lt.eq 2 / sqrt(M) lt.eq 2 / 3^(d + 1) . $ <eq:epsilon-choice>]
  Let $U_0 = L$, $V_0 = 0$, and define the comparison sequences by
  $ U_ell = \( 1 + epsilon.alt \) U_(ell - 1) + 3 V_(ell - 1) \, wide V_ell = epsilon.alt U_(ell - 1) +
    3 V_(ell - 1) . $
  All coefficients are nonnegative, so (4) implies $u_ell lt.eq U_ell$ and $v_ell lt.eq V_ell$ by induction.
    We prove simultaneously that, for $0 lt.eq ell lt.eq d$,
  #[#set math.equation(numbering: n => "(6)")
   $ U_ell lt.eq 2 L \, wide V_ell lt.eq epsilon.alt L \( 3^ell - 1 \) . $ <eq:comparison-bounds>]
  These bounds hold at $ell = 0$. Suppose they hold at every index less than some $1 lt.eq ell lt.eq d$. First,
  $ V_ell lt.eq 2 epsilon.alt L + 3 epsilon.alt L \( 3^(ell - 1) - 1 \) = epsilon.alt L \( 3^ell - 1 \) . $
  Next, summing the increments of $U_j$ and using only the bounds at indices $j < ell$, we obtain
  $ U_ell & = L + sum_(j = 0)^(ell - 1) \( epsilon.alt U_j + 3 V_j \)\
 & lt.eq L + 2 epsilon.alt L ell + 3 epsilon.alt L sum_(j = 0)^(ell - 1) \( 3^j - 1 \)\
 & = L + epsilon.alt L [3 / 2 \( 3^ell - 1 \) - ell] < 2 L . $
  The last inequality follows from (5), since
  $ epsilon.alt [3 / 2 \( 3^ell - 1 \) - ell] lt.eq frac(3^(ell + 1) - 3 - 2 ell, 3^(d + 1)) < 1 . $
  This completes the simultaneous induction. In particular, $u_ell lt.eq 2 L$, which is the desired bound. ◻
]

#proof[
  Fix any integer $d gt.eq 1$ and choose an integer $M gt.eq 9^(d + 1)$.
    Lemma 2 provides the required tournament labels. Following the OR-balancing principle of Ambainis and Sun
    #cite(label("AmbainisSun2011")) Section 4, Lemma 1, take $f$ to be the OR of $M$ disjoint copies of
    $P_(d \, 1)$. Each copy has dimension $L M \( k r \)^d$, so $f$ is a total Boolean function on
  #[#set math.equation(numbering: n => "(7)")
   $ n = L M^2 \( k r \)^d $ <eq:final-dimension>]
  bits. By Lemma 4, every copy is zero at its zero input, and a block from its stated family makes that copy one.
    Thus $f \( 0 \) = 0$ and $f$ is nonconstant.
  At a zero input of $f$, every copy is zero, and its sensitivity is at most $M S_(d \, 0)$.
    At a one input, either at least two copies accept, in which case no single bit can change the OR to zero,
    or exactly one copy accepts. In the latter case every sensitive bit belongs to that accepting copy,
    so there are at most $S_(d \, 1)$ such bits. Lemma 6 therefore gives
  #[#set math.equation(numbering: n => "(8)")
   $ s \( f \) lt.eq max { M S_(d \, 0) \, S_(d \, 1) } lt.eq 2 L M^(d + 1) . $ <eq:final-sensitivity>]
  Each copy supplies $M k^d$ pairwise disjoint blocks sensitive at zero, by Lemma 4.
    Taking their union over the disjoint copies gives a family of $M^2
    k^d$ pairwise disjoint sensitive blocks for $f$ at zero. In particular,
  #[#set math.equation(numbering: n => "(9)")
   $ "bs" \( f \, 0 \) gt.eq M^2 k^d . $ <eq:final-block-sensitivity>]
  Since $f$ is nonconstant, $s \( f \) > 0$. Combining (8) and (9) yields
  #[#set math.equation(numbering: n => "(10)")
   $ frac("bs" \( f \), s \( f \)^2) gt.eq frac("bs" \( f \, 0 \), s \( f \)^2) gt.eq
     frac(\( k \/ M^2 \)^d, 4 L^2) gt.eq frac(2^d, 4 \( d + 2 \)^2) . $ <eq:ratio-separation>]
  The last expression tends to infinity as $d$ tends to infinity.
    For any proposed constant $C$, first choose $d$ so that this expression exceeds $C$, then choose $M gt.eq
    9^(d + 1)$, then choose labels supplied by Lemma 2 and form $f$ as above.
    The resulting finite-dimensional total nonconstant function satisfies $"bs" \( f \) > C s \( f \)^2$.
    Hence no universal quadratic constant exists. ◻
]

=== 4.1 A fixed exponent by composition <a-fixed-exponent-by-composition>

The construction also supplies a fixed seed whose block sensitivity at zero exceeds the square of its sensitivity.
  Repeated composition of that seed gives a power separation.
  This is the composition-and-powering principle studied by Tal #cite(label("Tal2013")).
  We include the elementary composition facts to make this additional consequence self-contained.

#thm([Lemma 4.2.])[
  #emph[Let $f : { 0 \, 1 }^a arrow.r { 0 \, 1 }$ and $g : { 0 \, 1 }^b arrow.r { 0 \,
    1 }$ be total Boolean functions. Their disjoint composition is the function on $a b$ bits defined by
$ \( f compose g \) \( x_1 \, dots.h \, x_a \) = f #scale(x: 120%, y: 120%)[\(] g \( x_1 \) \, dots.h \,
  g \( x_a \) #scale(x: 120%, y: 120%)[\)] \, wide x_i in { 0 \, 1 }^b . $

 Then
$ s \( f compose g \) lt.eq s \( f \) s \( g \) . $

 If $g \( 0 \) = 0$, then $\( f compose g \) \( 0 \) = f \( 0 \)$ and
$ "bs" \( f compose g \, 0 \) gt.eq "bs" \( f \, 0 \) "bs" \( g \, 0 \) . $

 More explicitly, any disjoint families of $p$ and $q$ blocks sensitive at zero for $f$ and $g$, respectively,
   yield a disjoint family of $p q$ blocks sensitive at zero for $f compose g$.]
] <lem:composition>

#proof[
  For an input $x = \( x_1 \, dots.h \, x_a \)$, put $y = \( g \( x_1 \) \, dots.h \, g \( x_a \) \)$.
    A bit in child $x_i$ is sensitive for $f compose g$ precisely when it is sensitive for $g$ at $x_i$ and
    coordinate $i$ is sensitive for $f$ at $y$. Thus
  $ s \( f compose g \, x \) = sum_(i : thin f \( y^({ i }) \) eq.not f \( y \)) s \( g \, x_i \) lt.eq
    s \( f \, y \) s \( g \) lt.eq s \( f \) s \( g \) . $
  Now suppose $g \( 0 \) = 0$. Let $C_1 \, dots.h \, C_p subset.eq \[ a \]$ and $D_1 \, dots.h \,
    D_q subset.eq \[ b \]$ be disjoint nonempty sensitive blocks for $f$ and $g$ at zero.
    Identify the coordinates of the composition with $\[ a \] times \[ b \]$.
    For each $1 lt.eq i lt.eq p$ and $1 lt.eq j lt.eq q$, set
  $ E_(i \, j) = C_i times D_j . $
  These blocks are nonempty and pairwise disjoint: different $i$ use disjoint sets of children,
    while for fixed $i$ different $j$ use disjoint coordinate sets in each child.
    Flipping $E_(i \, j)$ at zero makes precisely the children indexed by $C_i$ output one, because $g \( 0 \) =
    0$ and $D_j$ is sensitive there. The outer input therefore becomes $0^(C_i)$, which changes the value of $f$.
    Hence every $E_(i \, j)$ is sensitive for $f compose g$ at zero.
    Choosing maximum families proves the stated block-sensitivity inequality; if either maximum is zero,
    the inequality is immediate. ◻
]

#thm([Corollary 4.3.])[
  #emph[There exist a real number $alpha > 2$ and nonconstant total Boolean functions $F_m$, for integers $m gt.eq
    1$, such that
$ "bs" \( F_m \, 0 \) gt.eq s \( F_m \)^alpha wide upright("for every ") m \, wide "bs" \( F_m \, 0 \) arrow.r oo . $

]
] <cor:power-separation>

#proof[
  Fix $d = 9$, choose an integer $M gt.eq 9^10$, and choose any admissible labelling.
    Let $f$ be the function constructed in the proof of Theorem 1 for these fixed parameters. Put
  $ A = 22 M^10 \, wide B = M^2 k^9 . $
  Here $L = 11$, so (8) and (9) give $s \( f \) lt.eq A$ and $"bs" \( f \, 0 \) gt.eq B$, while $f \( 0 \) = 0$.
    Moreover,
  $ B / A^2 = frac(\( k \/ M^2 \)^9, 484) gt.eq 2^9 / 484 = 128 / 121 > 1 . $
  In particular, $A > 1$, $B > A^2$, and the fixed number
  $ alpha = frac(log B, log A) $
  is greater than two.
  Set $F_1 = f$ and, for $m gt.eq 1$, set $F_(m + 1) = f compose F_m$ using disjoint copies of $F_m$.
    Inductively, $F_m$ is a total function on $n^m$ bits, where $n$ is the fixed seed dimension in (7),
    and $F_m \( 0 \) = 0$. Lemma 7 gives
  $ s \( F_m \) lt.eq A^m \, wide "bs" \( F_m \, 0 \) gt.eq B^m . $
  The latter bound proves nonconstancy and tends to infinity. Since $A^alpha = B$, we also obtain
  $ s \( F_m \)^alpha lt.eq A^(m alpha) = B^m lt.eq "bs" \( F_m \, 0 \) . $
  The same estimates give the explicit ratio bound
  $ frac("bs" \( F_m \), s \( F_m \)^2) gt.eq (B / A^2)^m gt.eq (128 / 121)^m . $
  ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
