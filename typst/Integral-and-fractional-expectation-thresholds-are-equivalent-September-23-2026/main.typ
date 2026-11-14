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

#align(center)[#text(size: 16pt, weight: "bold")[Integral and fractional expectation thresholds are equivalent]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

Expectation thresholds measure how cheaply an increasing family can be covered by elementary containment events.
  Their fractional relaxation allows a member to be covered by a total weight of one,
  distributed among its subsets. Talagrand conjectured that this relaxation changes the expectation threshold by
  at most a universal factor [17] Conjecture 6.3. We prove this conjecture.

Let $X$ be a finite nonempty set and let $cal(F)$ be a nonempty proper increasing subfamily of $2^X$.
  For a family $cal(G) subset.eq 2^X$ and a function $g : 2^X arrow.r \[ 0 \, 1 \]$, define

$ chevron.l cal(G) chevron.r = { H subset.eq X : exists S in cal(G) \, med S subset.eq H } \, wide
  c_p \( cal(G) \) = sum_(S in cal(G)) p^(\| S \|) \, $

and

$ chevron.l g chevron.r = {H subset.eq X : sum_(S subset.eq H) g \( S \) gt.eq 1} \, wide w \( g \, p \) =
  sum_(S subset.eq X) g \( S \) p^(\| S \|) . $

Throughout, $p in \[ 0 \, 1 \]$ and $p^0 = 1$, including when $p = 0$.
  Thus a cover supplies, inside each member of $cal(F)$, at least one generator $S in cal(G)$.
  If $X_p$ includes the elements of $X$ independently with probability $p$,
  the cost of that generator is $bb(P) \( S subset.eq X_p \) = p^(\| S \|)$.
  We say that $cal(F)$ is #emph[$p$-small] if there is a family $cal(G)$ with $cal(F) subset.eq chevron.l cal(G)
  chevron.r$ and $c_p \( cal(G) \) lt.eq 1 \/ 2$. Its integral and fractional expectation thresholds are

$ q \( cal(F) \) & = max { p in \[ 0 \, 1 \] : cal(F) upright(" is ") p upright("-small") } \,\
q_f \( cal(F) \) & = max { p in \[ 0 \, 1 \] : exists g : 2^X arrow.r \[ 0 \, 1 \] \,
  cal(F) subset.eq chevron.l g chevron.r \, med w \( g \, p \) lt.eq 1 \/ 2 } . $

In particular, $q \( cal(F) \) lt.eq q_f \( cal(F) \)$, by taking $g$ to be the indicator of an integral cover.

These maxima are well-defined. Since $diameter in.not cal(F)$, both feasible parameter sets contain zero.
  Integral feasibility is a finite union of closed subsets of $\[ 0 \, 1 \]$.
  Fractional feasibility is the projection of the compact set of pairs $\( p \, g \)$ satisfying the displayed
  constraints in $\[ 0 \, 1 \] times \[ 0 \, 1 \]^(2^X)$.

#thm([Theorem 1.1.])[
  #emph[For every finite nonempty $X$ and every nonempty proper increasing family $cal(F) subset.eq 2^X$,
$ q_f \( cal(F) \) lt.eq 25 dot.op 512^4 thin q \( cal(F) \) . $

 Both thresholds use the budget $1 \/ 2$. The constant is independent of $\| X \|$,
   the sizes of the minimal members of $cal(F)$, and the support of the fractional cover.]
] <thm:main>

The conclusion preserves the covering budget: every fractional cover of cost at most $1 \/
  2$ at a parameter $r$ admits an integral cover of cost at most $1 \/ 2$ at $r \/ \( 25 dot.op 512^4 \)$.

=== 1.1 Thresholds, selectors, and earlier comparisons <thresholds-selectors-and-earlier-comparisons>

Expectation thresholds arose in the study of when a random set first has a prescribed increasing property.
  Let $p_c \( cal(F) \)$ denote the unique parameter for which $bb(P) \( X_p in cal(F) \) = 1 \/ 2$.
  A union bound applied to an integral cover gives $q \( cal(F) \) lt.eq p_c \( cal(F) \)$;
  taking expectations in a fractional cover gives $q_f \( cal(F) \) lt.eq p_c \( cal(F) \)$ as well.
  Kahn and Kalai [10] conjectured the upper bound $p_c \( cal(F) \) = O \( q \( cal(F) \) log \( 2 \| X \| \) \)$.
  Frankston, Kahn, Narayanan, and Park [8], building on the sunflower methods of Alweiss, Lovett, Wu,
  and Zhang [1], proved the fractional bound

$ p_c \( cal(F) \) = O \( q_f \( cal(F) \) log ell \) \, wide ell = max { 2 \, max { \| H \| :
  H upright(" is a minimal member of ") cal(F) } } . $

Park and Pham [14] proved the corresponding bound with $q$ in place of $q_f$, resolving the Kahn–Kalai conjecture.
  These theorems estimate the random-set threshold. Talagrand’s comparison asks whether fractional certificates
  themselves admit integral replacements at a constant loss.

Early results obtained such replacements by exploiting the structure of the sets with positive fractional weight.
  Talagrand settled the case of singleton sets [17] Section 6;
  DeMarco and Kahn [3] treated clique-counting certificates, and Frankston, Kahn,
  and Park [9] treated arbitrary weights on pairs. Fischer and Person extended these methods to nearly linear
  uniform hypergraphs [5] and further clique cases [6]. They also proved the comparison with high probability for
  constant weights on random uniform supports [7].

Selector processes supply a different route: they seek a member whose assigned vertex mass is substantially
  captured by a random subset. Park and Pham proved Talagrand’s selector-process conjecture [13], and Bednorz,
  Martynek, and Meller [2] gave a proof using truncated weights.
  Dubroff, Kahn, and Park [4] Theorem 1.2 used selector estimates to round any fractional cover whose positive
  coefficients occur only on sets of cardinality at most $t$, with a loss depending on $t$.
  Pham sharpened this loss to $O \( log \( 2 t \) \)$ [15] arXiv version 1, Theorem 1.2.
  Here $t$ bounds the cardinalities of the weighted sets, not their number or the sizes of the minimal members of
  $cal(F)$. For example, for $1 lt.eq k lt.eq \| X \|$, the family ${ H subset.eq X : \| H \| gt.eq
  k }$ has the fractional cover $g \( { x } \) = 1 \/ k$, zero elsewhere:
  its weighted sets are singletons, while its minimal members have cardinality $k$.

Fischer and Person’s sampling argument for sufficiently large sets [5] Theorem 10,
  combined with Pham’s logarithmic rounding bound, gives a loss of order $log log \( 4 \| X \| \)$.
  This consequence is recorded in the expanded version of Pham’s paper [16] Corollary 1.8.
  More recently, Park [12] Theorem 1.2 obtained the dimension-independent bound

$ q_f \( cal(F) \) lt.eq K q \( cal(F) \) max { 1 \, log log \( 1 \/ q \( cal(F) \) \) } $

for a universal $K$. The factor here still grows as $q \( cal(F) \)$ tends to zero.
  Theorem 1 removes both kinds of dependence. Section 4 applies it to Li’s fractional discrete-convexity
  theorem [11]: for any class $cal(A) subset.eq 2^X$ with $bb(P) \( X_p in cal(A) \) > 1 \/ 2$,
  the sets not contained in a union of two members of $cal(A)$ have a small integral cover at a universal constant
  multiple of $p$.

#prodef([Remark 1.2.])[
  (Talagrand’s original formulation).  For $p > 0$, the weak-smallness probability weights $beta_S$ in [17]
    Definition 6.1 give fractional coefficients $beta_S \/ \( 2 p^(\| S \|) \)$;
    capping these at one preserves coverage and does not increase cost.
    Conversely, the masses $2 g \( S \) p^(\| S \|)$ can be completed to a probability distribution by adding the
    deficit at the empty set. Passing from an arbitrary class to its upward closure preserves both cover
    constraints. Thus the increasing-family formulation of Theorem 1 also resolves Conjecture 6.3 in its original form.
]

=== 1.2 The selector estimate and the rounding mechanism <the-selector-estimate-and-the-rounding-mechanism>

Our selector estimate controls one member simultaneously at several scales.
  Assign to each $H in cal(F)$ a probability mass $lambda_H$ supported on $H$.
  Independently color the vertices by integers $a \( x \) in { 1 \, dots.h \, s + 1 }$, and let $A_i = { x :
  a \( x \) lt.eq i }$. Theorem 3 specifies geometrically increasing color probabilities for which failure of
  $p$-smallness forces, with probability at least $9 \/ 10$, a single $H$ satisfying

$ lambda_H \( A_i \) gt.eq 1 - 2^(- i) quad \( 1 lt.eq i lt.eq s \) . $

The uncaptured masses are summable, so this member has bounded mean color:

$ sum_x a \( x \) lambda_H \( x \) = 1 + sum_(i = 1)^s #scale(x: 120%, y: 120%)[\(] 1 -
  lambda_H \( A_i \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 . $

Separate estimates at individual scales could choose different members and would not give this bound for any one member.

To apply the estimate to a fractional cover of cost at most $1 \/ 2$ at parameter $r$,
  distribute each nonempty weight $g \( S \)$ equally among the vertices of $S$ and normalize on each member,
  following Pham [15] arXiv version 1, Section 3. The mean vertex color then equals the weighted mean of the
  average colors of those sets. Thus a fixed positive amount of fractional weight lies on sets with average color
  at most four. For a suitable fixed base $B > 1$, the independent variables $Y_x =
  B^(4 - a \( x \))$ satisfy $product_(x in S) Y_x gt.eq 1$ on all these sets.
  Their common mean can at the same time be made a constant multiple of $p$ by a suitable choice of the number of
  colors. Taking $p$ to be a sufficiently small constant multiple of $r$, independence bounds the expectation of

$ Z = sum_(diameter eq.not S subset.eq X) g \( S \) product_(x in S) Y_x $

from above using the fractional covering cost, while the selector event bounds it from below.
  Section 3 makes these bounds incompatible. Only nonemptiness of the weighted sets enters this final comparison,
  so their cardinalities need no upper bound.

The proof of the selector estimate in Section 2 develops the minimum-fragment method of Park and Pham [13] and
  Pham’s towers of fragments [15] arXiv version 1, Section 2, together with the maximal truncations of Bednorz,
  Martynek, and Meller [2] Section 3.1. For each coloring and each member,
  we move vertices to earlier colors until a set of truncated inequalities holds,
  minimizing the total number of color levels moved. The resulting changed sets form a cover.
  To estimate its cost, we record the final coloring and the numbers of vertices making each possible color
  change. These data determine one common member satisfying the truncated inequalities for the entire group of
  original colorings. Maximal truncation bounds the number of candidate vertices at each color,
  and a weighted AM–GM estimate pays for their allocation among the scales.
  Keeping all color changes in the same record is what permits the simultaneous estimate.

The random vertex colors used below are independent. We write $lambda_H \( A \) = sum_(x in A) lambda_H \( x \)$.
  Empty sums are zero and empty products are one.

== 2 A multiscale selector estimate <sec:selector>

The key estimate finds a single member of the family whose mass is captured at every scale.
  The family in this section need not be increasing. Recall that a family $cal(F) subset.eq
  2^X$ is #emph[$p$-small] if there is a family $cal(G) subset.eq 2^X$ such that every $H in
  cal(F)$ contains some $G in cal(G)$ and $sum_(G in cal(G)) p^(\| G \|) lt.eq 1 \/ 2$.

The argument combines the minimum-fragment method of Park and Pham [13] Definitions 2.3 and 2.5,
  Proposition 2.6 and its multiscale development by Pham [15] arXiv version 1,
  Section 2 with the maximal-cutoff argument of Bednorz, Martynek, and Meller [2] Lemma 3.6.
  All the estimates needed here are proved below.

#thm([Theorem 2.1.])[
  (Multiscale selector estimate).  #emph[Let $X$ be a finite set,
    let $cal(F)$ be a nonempty family of nonempty subsets of $X$, and suppose that $cal(F)$ is not $p$-small,
    where $0 < p lt.eq 1$. For each $H in cal(F)$, let $lambda_H$ be a probability mass function on $X$ supported
    on $H$. Set $D = 256$, and let $s gt.eq 0$ be an integer such that
$ p sum_(i = 1)^s D^i lt.eq 1 / 2 . $

 Independently color the elements of $X$ by a map $a : X arrow.r { 1 \, dots.h \, s + 1 }$, with color probabilities
#[#set math.equation(numbering: n => "(2.1)")
 $ pi_i = D^i p quad \( 1 lt.eq i lt.eq s \) \, wide pi_(s + 1) = 1 - p sum_(i = 1)^s D^i . $ <sel:color-probabilities>]

 For a coloring $v$, write $A_i \( v \) = { x in X : v \( x \) lt.eq i }$.
   With probability at least $9 \/ 10$, there is an $H in cal(F)$ such that
#[#set math.equation(numbering: n => "(2.2)")
 $ lambda_H \( A_i \( a \) \) gt.eq 1 - 2^(- i) wide \( 1 lt.eq i lt.eq s \) . $ <sel:simultaneous-capture>]

 In particular, with probability at least $9 \/ 10$, there is an $H in cal(F)$ for which
#[#set math.equation(numbering: n => "(2.3)")
 $ sum_(x in X) a \( x \) lambda_H \( x \) lt.eq 2 . $ <sel:average-color>]

]
] <thm:multiscale-selector>

For colorings where simultaneous capture fails, the proof will construct covers from sets of vertices moved to
  earlier colors. We will sum these costs against the probabilities of the failing colorings.
  The estimate comes from locating the changed vertices within small sets determined by the final coloring and the
  numbers moved between colors. The following truncation observation supplies the size bound for these sets.

#thm([Lemma 2.2.])[
  (Maximal truncation).  #emph[Let $lambda$ be a probability mass function on a finite set $X$,
    let $A subset.eq X$, and let $m gt.eq 0$ and $0 < d < 1$. Call $u in \[ 0 \, 1 \]$ admissible if
#[#set math.equation(numbering: n => "(2.4)")
 $ { x : lambda \( x \) > u } subset.eq A \, wide sum_(x in X) min { lambda \( x \) \,
   u } #scale(x: 120%, y: 120%)[\(] upright(bold(1))_A \( x \) - \( 1 - d \) #scale(x: 120%, y: 120%)[\)] gt.eq
   m u . $ <sel:admissible-cutoff>]

 If there is an admissible cutoff, there is a largest one, $epsilon$, and it satisfies
$ \| { x : lambda \( x \) > epsilon } \| lt.eq m / d . $

]
] <sel:truncation>

#proof[
  The inclusion in (2.4) is equivalent to
  $ u gt.eq max #scale(x: 120%, y: 120%)[\(] { lambda \( x \) :
    x in.not A } union { 0 } #scale(x: 120%, y: 120%)[\)] . $
  The remaining inequality is closed in $u$, since its two sides are continuous.
    Thus the nonempty set of admissible cutoffs is compact and has a largest element $epsilon$.
  Put $R = { x : lambda \( x \) > epsilon }$. If $epsilon = 1$, then $R = diameter$ and the assertion holds.
    Otherwise, consider
  $ f \( u \) = sum_(x in X) min { lambda \( x \) \, u } #scale(x: 120%, y: 120%)[\(]
    upright(bold(1))_A \( x \) - \( 1 - d \) #scale(x: 120%, y: 120%)[\)] - m u . $
  On a sufficiently short interval to the right of $epsilon$, the only unsaturated terms are those indexed by $R$.
    Each of these points belongs to $A$, so the slope on that interval is $d \| R \| - m$.
    This statement also holds when $epsilon = 0$ or when $epsilon$ equals one of the weights:
    weights equal to the cutoff remain constant when the cutoff increases.
    An increase of the cutoff preserves the inclusion in (2.4).
    If $d \| R \| - m$ were positive, it would also preserve $f \( u \) gt.eq 0$ for a small increase,
    contradicting maximality. Hence $d \| R \| lt.eq m$. ◻
]

#proof[
  If $s = 0$, the only color is $1$, and both conclusions are immediate.
    Assume henceforth that $s gt.eq 1$, and put $d_i = 2^(- i)$ for $1 lt.eq i lt.eq s$.
    Call a coloring $a$ #emph[bad] if no $H in cal(F)$ satisfies (2.2).
    We will prove $bb(P) \( a upright(" is bad") \) lt.eq 1 \/ 10$.
  #emph[Feasible moves and a cover.] We may move vertices to earlier colors, obtaining a coloring $z lt.eq
    a$ pointwise. Write
  $ U \( a \, z \) = { x : z \( x \) < a \( x \) } \, wide m_i \( a \, z \) = \| A_i \( z \) \\ A_i \( a \) \| . $
  Call such a move #emph[feasible] if there are $H in cal(F)$ and $epsilon_1 \, dots.h \,
    epsilon_s in \[ 0 \, 1 \]$ such that, for every $i$,
  #[#set math.equation(numbering: n => "(2.5)")
   $ R_i := { x : lambda_H \( x \) > epsilon_i } & subset.eq A_i \( z \) \,\
sum_(x in X) min { lambda_H \( x \) \, epsilon_i } #scale(x: 120%, y: 120%)[\(]
  upright(bold(1))_(A_i \( z \)) \( x \) - \( 1 - d_i \) #scale(x: 120%, y: 120%)[\)] & gt.eq
  m_i \( a \, z \) epsilon_i . $ <sel:feasibility>]
  The right side charges $epsilon_i$ for each vertex in $A_i \( z \) \\ A_i \( a \)$.
    Removing one of these vertices lowers the truncated sum by at most $epsilon_i$ while reducing that charge by
    exactly $epsilon_i$; hence the inequality survives. If the vertex has mass at most $epsilon_i$,
    it lies outside $R_i$, so the inclusion survives as well.
    We will apply this balance when delaying a vertex from color $i$ to color $i + 1$.
  If the unchanged move $z = a$ is feasible, then $a$ is not bad. Indeed, in this case $m_i \( a \, a \) = 0$.
    Replacing each truncated weight by its original value adds only nonnegative terms to the left side of (2.5):
    any excess weight lies in $R_i subset.eq A_i \( a \)$ and has coefficient $d_i$.
    The resulting inequality is $lambda_H \( A_i \( a \) \) - \( 1 - d_i \) gt.eq 0$, for the same $H$ at every $i$.
  Fix orders on the finite sets of colorings and members of $cal(F)$.
    For every $a$ and $H_0 in cal(F)$, choose a feasible coloring $z$ with $U \( a \, z \) subset.eq H_0$ minimizing
  $ L \( a \, z \) = sum_(x in X) \( a \( x \) - z \( x \) \) \, $
  breaking ties by the fixed order. This minimum exists: the move that sets $z \( x \) =
    1$ on $H_0$ and leaves other colors unchanged is feasible with $H = H_0$ and all cutoffs zero.
    Notice that the witness $H$ in the minimization is otherwise unrestricted; it need not equal $H_0$.
  Let $cal(Z) \( a \)$ be the set of chosen colorings, with repetitions removed.
    The changed sets $U \( a \, z \)$, $z in cal(Z) \( a \)$, cover $cal(F)$,
    because each $H_0$ contains its chosen changed set. Failure of $p$-smallness therefore implies
  $ sum_(z in cal(Z) \( a \)) p^(\| U \( a \, z \) \|) > 1 / 2 . $
  This remains true if distinct colorings have the same changed set:
    the displayed sum is then at least the cost of the cover with its repeated sets removed.
    Define $P \( v \) = product_(x in X) pi_(v \( x \))$ for every coloring $v$. It follows that
  #[#set math.equation(numbering: n => "(2.6)")
   $ 1 / 2 bb(P) \( a upright(" is bad") \) lt.eq sum_(a upright(" bad")) P \( a \) sum_(z in cal(Z) \( a \))
     p^(\| U \( a \, z \) \|) . $ <sel:cover-cost>]
  Every changed set appearing on the right is nonempty, since a bad coloring has no feasible unchanged move.
  #emph[A witness determined by the final coloring and the counts.] Group the pairs $\( a \, z \)$ on the right of
    (2.6) by $z$ and the array of counts
  $ n_(i h) = \| { x : z \( x \) = i \, med a \( x \) = h } \| wide \( 1 lt.eq i < h lt.eq s + 1 \) . $
  We call this array the #emph[profile]. Put
  $ t_i = sum_(h > i) n_(i h) \, wide t = sum_(i = 1)^s t_i = \| U \( a \, z \) \| . $
  The profile also determines every quantity in the feasibility tests that depends on $a$, because
  #[#set math.equation(numbering: n => "(2.7)")
   $ m_i \( a \, z \) = sum_(j lt.eq i < h) n_(j h) . $ <sel:profile-crossings>]
  Fix $z$ and a profile occurring in the sum. Choose the first $H in
    cal(F)$ that can witness (2.5) with these data. Such a witness exists,
    and this choice uses only $z$ and the profile. For this fixed $H$,
    choose at every $i$ the largest admissible cutoff in (2.5).
    The choices for the different indices impose no restrictions on one another. Lemma 4 gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ \| R_i \| lt.eq frac(m_i \( a \, z \), d_i) lt.eq 2^i t . $ <sel:large-weight-bound>]
  The resulting $H$, cutoffs, and sets $R_i$ are fixed for the entire group.
    In particular, they witness feasibility for every original coloring $a$ in that group,
    irrespective of the member $H_0$ that led to the choice of $z$.
  For each such original coloring we claim that
  #[#set math.equation(numbering: n => "(2.9)")
   $ { x : z \( x \) = i < a \( x \) } subset.eq R_i wide \( 1 lt.eq i lt.eq s \) . $ <sel:changed-vertices>]
  Suppose instead that a vertex $x$ on the left lies outside $R_i$.
    Delay its color in $z$ from $i$ to $i + 1$, obtaining $z'$. Since $a \( x \) > i$, we still have $z' lt.eq a$.
    Choose an $H_0$ for which $z$ was a minimum. The changed set of $z'$ is contained in that of $z$,
    so it is still contained in $H_0$.
  Only $A_i \( z \)$ changes under this delay: it loses $x$, while all other $A_j \( z \)$ remain unchanged.
    Correspondingly, $m_i \( a \, z \)$ decreases by one and all other $m_j \( a \, z \)$ remain unchanged.
    The inclusion in test $i$ stays true because $x in.not R_i$.
    The left side of that test decreases by $min { lambda_H \( x \) \, epsilon_i } lt.eq epsilon_i$,
    whereas its right side decreases by exactly $epsilon_i$. Thus the same $H$ and cutoffs witness feasibility of
    $z'$. But $L \( a \, z' \) = L \( a \, z \) - 1$, contradicting the defining minimum.
    This proves (2.9) for every $a$ in the group. Figure 1 illustrates why moving one vertex back by one level
    changes only one of the feasibility tests.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (8.4, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#808080"))))
  content((8.4, 0), [#text(size: 9pt)[color]], anchor: "west", padding: 0.1176cm)
  line((1.2, -0.08), (1.2, 0.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.2, -0.1), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  line((3.6, -0.08), (3.6, 0.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.6, -0.1), [#text(size: 9pt)[$i$]], anchor: "north", padding: 0.1176cm)
  line((4.8, -0.08), (4.8, 0.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.8, -0.1), [#text(size: 9pt)[$i+1$]], anchor: "north", padding: 0.1176cm)
  line((7.2, -0.08), (7.2, 0.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.2, -0.1), [#text(size: 9pt)[$h$]], anchor: "north", padding: 0.1176cm)
  circle((3.6, 0), radius: 0.07056, fill: rgb("#00008c"), stroke: none)
  circle((7.2, 0), radius: 0.07056, fill: rgb("#00008c"), stroke: none)
  bezier((7.14, 0.15), (3.66, 0.15), (5.965, 0.8286), (4.835, 0.8286), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#00008c"))))
  content((5.4, 0.659), [#text(size: 9pt)[chosen move]], anchor: "south", padding: 0.1176cm)
  line((3.6, -0.7), (4.8, -0.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((4.2, -0.7), [#text(size: 9pt)[delay one level]], anchor: "north", padding: 0.1176cm)
  line((4.2, -1.2), (4.2, 0.55), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((3.96, -1.5), [#text(size: 9pt)[inside $A_i$]], anchor: "east", padding: 0.1176cm)
  content((4.44, -1.5), [#text(size: 9pt)[outside $A_i$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: The one-level delay in the reconstruction argument. A vertex originally colored $h > i$ has been moved to $i$; delaying it to $i + 1$ removes it from $A_i$ alone. At the same time $m_i$ decreases by one, lowering the right side of (2.5) by $epsilon_i$. Its membership in every other cumulative set $A_j$ stays fixed. The drawing is schematic; $h$ may equal $i + 1$. ],
  ) <fig:one-level-delay>
  #emph[Counting the original colorings.] Given $z$ and the profile,
    an original coloring $a$ is determined by its changed vertices of each color $i$ in $z$,
    together with their original colors $h > i$. By (2.9), the number of possibilities is at most
  #[#set math.equation(numbering: n => "(2.10)")
   $ product_(i = 1)^s binom(\| R_i \|, t_i) binom(t_i, \( n_(i h) \)_(h > i)) \, $ <sel:encoding-bound>]
  where the second factor is a multinomial coefficient. The sets $R_i$ may overlap and may contain vertices of
    other colors in $z$. Counting arbitrary subsets of them only adds possibilities to (2.10);
    every actual coloring has a unique encoding of the indicated form.
  For $t > 0$, (2.8) and $binom(n, k) lt.eq \( e n \/ k \)^k$ give
  #[#set math.equation(numbering: n => "(2.11)")
   $ product_(i = 1)^s binom(\| R_i \|, t_i) lt.eq product_(i : t_i > 0) (frac(e thin 2^i t, t_i))^(t_i) lt.eq
     product_(i = 1)^s \( e thin 4^i \)^(t_i) . $ <sel:entropy-bound>]
  To see the last inequality, apply weighted AM–GM with weights $alpha_i = t_i \/ t$ on the positive rows:
  $ product_(i : t_i > 0) (2^(- i) / alpha_i)^(alpha_i) lt.eq sum_(i : t_i > 0) 2^(- i) lt.eq 1 . $
  Raising this inequality to the power $t$ yields exactly the second inequality in (2.11).
    Rows with $t_i = 0$ contribute a factor of one.
  For each pair in the group, its probability and cost satisfy the exact identity
  #[#set math.equation(numbering: n => "(2.12)")
   $ p^t P \( a \) = P \( z \) product_(i = 1)^s (p / pi_i)^(t_i) product_(i < h) pi_h^(n_(i h)) . $ <sel:likelihood>]
  All color probabilities are positive. Combining (2.10)–(2.12),
    the contribution of a fixed $z$ and profile to the right side of (2.6) is at most
  #[#set math.equation(numbering: n => "(2.13)")
   $ P \( z \) product_(i = 1)^s
     [(frac(e thin 4^i p, pi_i))^(t_i) binom(t_i, \( n_(i h) \)_(h > i)) product_(h > i) pi_h^(n_(i h))] .
     $ <sel:profile-contribution>]
  The witness and the sets $R_i$ can depend on the full profile, but none of that dependence remains in this bound.
  For fixed row sums $t_1 \, dots.h \, t_s$, we can consequently sum (2.13) over all nonnegative integer profiles
    with those row sums, including profiles that do not occur. The multinomial theorem gives, for each row,
  $ sum_(\( n_(i h) \)_(h > i) gt.eq 0\
sum_(h > i) n_(i h) = t_i) binom(t_i, \( n_(i h) \)_(h > i)) product_(h > i) pi_h^(n_(i h)) =
  (sum_(h > i) pi_h)^(t_i) lt.eq 1 . $
  Finally, summing over all colorings $z$ uses $sum_z P \( z \) = 1$. Thus the right side of (2.6) is at most
  #[#set math.equation(numbering: n => "(2.14)")
   $ sum_(t_1 \, dots.h \, t_s gt.eq 0\
t_1 + dots.h.c + t_s > 0) product_(i = 1)^s (frac(e thin 4^i p, pi_i))^(t_i) = sum_(t_1 \, dots.h \, t_s gt.eq 0\
t_1 + dots.h.c + t_s > 0) product_(i = 1)^s (e / 64^i)^(t_i) \, $ <sel:tuple-sum>]
  where both sums run over integer tuples. Put $rho = sum_(i = 1)^s e \/ 64^i$.
    For a fixed total $ell = t_1 + dots.h.c + t_s$, each monomial in (2.14) occurs in the expansion of $rho^ell$
    with a multinomial coefficient at least one. Since
  $ rho < e / 63 < 1 / 21 \, $
  we obtain
  $ upright("right side of ") upright("(2.6)") lt.eq sum_(ell gt.eq 1) rho^ell = frac(rho, 1 - rho) < 1 / 20 . $
  Together with (2.6), this proves that the bad probability is at most $1 \/ 10$.
  For every nonbad coloring the same $H$ satisfies all inequalities in (2.2). Since the colors are integers,
  $ sum_(x in X) a \( x \) lambda_H \( x \) = 1 + sum_(i = 1)^s #scale(x: 120%, y: 120%)[\(] 1 -
    lambda_H \( A_i \( a \) \) #scale(x: 120%, y: 120%)[\)] lt.eq 1 + sum_(i = 1)^s 2^(- i) lt.eq 2 . $
  This proves (2.3) and completes the proof. ◻
]

== 3 Rounding a fractional cover <sec:rounding>

We convert the color bound into independent numerical variables on the vertices.
  Their means will be small, while the common member supplied by Theorem 3 will force a positive amount of
  fractional-cover mass onto sets whose products are at least one.
  Comparing the resulting lower and upper bounds on the same expectation completes the proof.
  This conversion follows the selector-to-rounding approach of Dubroff, Kahn,
  and Park [4] Section 2 and Pham [15] arXiv version 1, Section 3.
  In particular, the equal distribution of a set’s weight among its vertices in (3.2) is Pham’s construction.
  The simultaneous color bound supplies the additional control used here for arbitrary set sizes.

#proof[
  Put
  $ D = 256 \, wide B = 512 \, wide C = 25 B^4 . $
  Let $r in \( 0 \, 1 \]$ and suppose that $g : 2^X arrow.r \[ 0 \, 1 \]$ satisfies
  #[#set math.equation(numbering: n => "(3.1)")
   $ sum_(S subset.eq H) g \( S \) gt.eq 1 quad \( H in cal(F) \) \, wide
     sum_(S subset.eq X) g \( S \) r^(\| S \|) lt.eq 1 / 2 . $ <round:cover>]
  Set $p = r \/ C$. We prove that $cal(F)$ is $p$-small.
  First observe that $g \( diameter \) lt.eq 1 \/ 2$, since its contribution to the second sum in (3.1) is
    $g \( diameter \)$. For each $H in cal(F)$, define
  #[#set math.equation(numbering: n => "(3.2)")
   $ M_H = sum_(diameter eq.not S subset.eq H) g \( S \) gt.eq 1 - g \( diameter \) gt.eq 1 / 2 \, wide
     lambda_H \( x \) = 1 / M_H sum_(diameter eq.not S subset.eq H\
x in S) frac(g \( S \), \| S \|) quad \( x in X \) . $ <round:mass>]
  The function $lambda_H$ vanishes off $H$ and is a probability mass function:
    summing over $x$ counts each nonempty $S$ exactly $\| S \|$ times.
  Suppose, for a contradiction, that $cal(F)$ is not $p$-small. Let $s$ be the largest nonnegative integer for which
  #[#set math.equation(numbering: n => "(3.3)")
   $ p sum_(i = 1)^s D^i lt.eq 1 / 2 . $ <round:scale>]
  Such an integer exists: zero satisfies the restriction, and $p > 0$ makes the geometric sums unbounded.
    Apply Theorem 3 to these probability masses and this choice of $s$.
    Thus the colors $a \( x \)$ are independent, with
  $ bb(P) \( a \( x \) = i \) = pi_i = D^i p quad \( 1 lt.eq i lt.eq s \) \, wide bb(P) \( a \( x \) = s + 1 \) =
    pi_(s + 1) = 1 - p sum_(i = 1)^s D^i . $
  With probability at least $9 \/ 10$, there is an $H in cal(F)$ such that $sum_x a \( x \) lambda_H \( x \) lt.eq
    2$. Denote this event by $cal(E)$, and set
  #[#set math.equation(numbering: n => "(3.4)")
   $ Y_x = B^(4 - a \( x \)) \, wide Z = sum_(diameter eq.not S subset.eq X) g \( S \) product_(x in S) Y_x .
     $ <round:variables>]
  Fix an outcome in $cal(E)$ and a corresponding member $H$.
    Writing $overline(a) \( S \) = \| S \|^(- 1) sum_(x in S) a \( x \)$ for nonempty $S$, we have
  $ 1 / M_H sum_(diameter eq.not S subset.eq H) g \( S \) overline(a) \( S \) =
    sum_x a \( x \) lambda_H \( x \) lt.eq 2 . $
  Apply Markov’s inequality to the probability distribution $g \( S \) \/ M_H$ on the nonempty subsets of $H$. It gives
  $ sum_(diameter eq.not S subset.eq H\
overline(a) \( S \) lt.eq 4) g \( S \) gt.eq M_H / 2 . $
  For every set in this sum,
  $ product_(x in S) Y_x = B^(thin \| S \| \( 4 - overline(a) \( S \) \)) gt.eq 1 . $
  Consequently $Z gt.eq M_H \/ 2 gt.eq 1 \/ 4$ on $cal(E)$.
    This holds for each outcome, although the corresponding $H$ may depend on the coloring.
    Since $Z$ is nonnegative everywhere,
  #[#set math.equation(numbering: n => "(3.5)")
   $ bb(E) Z gt.eq 1 / 4 bb(P) \( cal(E) \) gt.eq 9 / 40 . $ <round:lower>]
  For the upper bound, maximality of $s$ gives
  $ 1 / 2 < p sum_(i = 1)^(s + 1) D^i lt.eq 2 p D^(s + 1) . $
  As $B gt.eq D$, it follows that
  #[#set math.equation(numbering: n => "(3.6)")
   $ B^(- \( s + 1 \)) lt.eq D^(- \( s + 1 \)) < 4 p . $ <round:tail>]
  The variables $Y_x$ are independent and identically distributed, and their common mean $mu$ satisfies
  #[#set math.equation(numbering: n => "(3.7)")
   $ mu & = B^4 (p sum_(i = 1)^s \( D \/ B \)^i + pi_(s + 1) B^(- \( s + 1 \)))\
 & lt.eq B^4 (p sum_(i = 1)^s 2^(- i) + 4 p) lt.eq 5 B^4 p = r / 5 . $ <round:mean>]
  The same estimates hold when $s = 0$, with the first sums empty. Independence now yields
  #[#set math.equation(numbering: n => "(3.8)")
   $ bb(E) Z & = sum_(diameter eq.not S subset.eq X) g \( S \) mu^(\| S \|)\
 & lt.eq sum_(diameter eq.not S subset.eq X) g \( S \) \( r \/ 5 \)^(\| S \|) lt.eq 1 /
   5 sum_(diameter eq.not S subset.eq X) g \( S \) r^(\| S \|) lt.eq 1 / 10 . $ <round:upper>]
  Here the factor $1 \/ 5$ is valid because every set in the sum is nonempty.
    The bounds (3.5) and (3.8) contradict one another.
  Thus $cal(F)$ is $r \/ C$-small for every admissible $r > 0$.
    At $r = 0$, the family $cal(F)$ itself is a cover of cost zero, since $diameter in.not cal(F)$.
    Taking $r = q_f \( cal(F) \)$, with this last observation covering the case $q_f \( cal(F) \) = 0$, proves
  $ q_f \( cal(F) \) lt.eq 25 dot.op 512^4 thin q \( cal(F) \) . $
  ◻
]

== 4 A consequence for unions of two sets <sec:consequence>

The comparison also strengthens a recent bound for sets that cannot be covered by two members of a large class.
  For $cal(A) subset.eq 2^X$, write $mu_p \( cal(A) \) = bb(P) \( X_p in cal(A) \)$ and define

$ "Bad"_2 \( cal(A) \) = { S subset.eq X : S subset.eq.not A_1 union A_2 upright(" for all ") A_1 \, A_2 in cal(A) } . $

When $mu_p \( cal(A) \) > 1 \/ 2$, Li’s fractional discrete-convexity theorem [11] Corollary 3.1 provides a
  fractional cover for this family. Combining that input with Theorem 1 gives the following integral conclusion.

#thm([Corollary 4.1.])[
  #emph[Let $X$ be a finite nonempty set, let $0 < p < 1$, and let $cal(A) subset.eq
    2^X$ satisfy $mu_p \( cal(A) \) > 1 \/ 2$. Set $C = 25 dot.op 512^4$.
    There is a family $cal(G) subset.eq 2^X$ such that
$ "Bad"_2 \( cal(A) \) subset.eq chevron.l cal(G) chevron.r \, wide
  sum_(S in cal(G)) (frac(p, 2 C))^(\| S \|) lt.eq 1 / 2 . $

 In particular, $"Bad"_2 \( cal(A) \)$ is $\( p \/ \( 2 C \) \)$-small.
   No monotonicity assumption on $cal(A)$ is needed.]
] <cor:two-unions>

#proof[
  If $"Bad"_2 \( cal(A) \)$ is empty, take $cal(G) = diameter$. Otherwise this is a nonempty increasing family.
    It is proper because $cal(A)$ is nonempty and hence $diameter in.not "Bad"_2 \( cal(A) \)$.
    Li’s theorem, in the covering formulation given by Park [12] Theorem 3.4,
    supplies a fractional cover of $"Bad"_2 \( cal(A) \)$ of cost at most $1 \/ 2$ at parameter $p \/ 2$.
    Its coefficients may be capped at one without affecting coverage or increasing cost.
    Theorem 1 therefore yields an integral cover of cost at most $1 \/ 2$ at parameter $p \/ \( 2 C \)$. ◻
]

Park [12] Corollary 3.5 obtained the same conclusion with smallness parameter

$ frac(p, K max { 1 \, log log \( 1 \/ p \) }) $

for a universal $K$. Corollary 5 removes the double logarithmic loss while retaining unions of two members and the
  covering budget $1 \/ 2$.

#heading(level: 1)[References]
#bibitem([1])[Ryan Alweiss, Shachar Lovett, Kewen Wu, and Jiapeng Zhang,
  #emph[Improved bounds for the sunflower lemma], Annals of Mathematics #strong[194] (2021), no.~3, 795--815.
  #link("https://doi.org/10.4007/annals.2021.194.3.5")[doi:10.4007/annals.2021.194.3.5].]
#bibitem([2])[Witold Bednorz, Rafał Martynek, and Rafał Meller,
  #emph[The suprema of selector processes with the application to positive infinitely divisible processes],
  preprint, 2022; version~3, 2026. #link("https://arxiv.org/abs/2212.14636v3")[arXiv:2212.14636v3].
  #link("https://doi.org/10.48550/arXiv.2212.14636")[doi:10.48550/arXiv.2212.14636].]
#bibitem([3])[Bobby DeMarco and Jeff Kahn, #emph[Note on a problem of M.~Talagrand],
  Random Structures & Algorithms #strong[47] (2015), no.~4, 663--668.
  #link("https://doi.org/10.1002/rsa.20559")[doi:10.1002/rsa.20559].]
#bibitem([4])[Quentin Dubroff, Jeff Kahn, and Jinyoung Park, #emph[Note on a conjecture of Talagrand:
  expectation thresholds vs.~fractional expectation thresholds], preprint, 2024.
  #link("https://arxiv.org/abs/2412.00917v1")[arXiv:2412.00917v1].
  #link("https://doi.org/10.48550/arXiv.2412.00917")[doi:10.48550/arXiv.2412.00917].]
#bibitem([5])[Thomas Fischer and Yury Person, #emph[Some results on fractional vs.~expectation thresholds],
  Electronic Journal of Combinatorics #strong[32] (2025), no.~3, Paper~P3.39.
  #link("https://doi.org/10.37236/12611")[doi:10.37236/12611].]
#bibitem([6])[Thomas Fischer and Yury Person, #emph[Further remarks on fractional vs.~expectation thresholds],
  preprint, 2025. #link("https://arxiv.org/abs/2505.21782v1")[arXiv:2505.21782v1].]
#bibitem([7])[Thomas Fischer and Yury Person, #emph[Fractional vs.~expectation thresholds:
  random support case], in 37th International Conference on Probabilistic,
  Combinatorial and Asymptotic Methods for the Analysis of Algorithms (AofA~2026),
  Leibniz International Proceedings in Informatics #strong[381] (2026), 24:1--24:10.
  #link("https://doi.org/10.4230/LIPIcs.AofA.2026.24")[doi:10.4230/LIPIcs.AofA.2026.24].]
#bibitem([8])[Keith Frankston, Jeff Kahn, Bhargav Narayanan, and Jinyoung Park,
  #emph[Thresholds versus fractional expectation-thresholds], Annals of Mathematics #strong[194] (2021), no.~2,
  475--495. #link("https://doi.org/10.4007/annals.2021.194.2.2")[doi:10.4007/annals.2021.194.2.2].]
#bibitem([9])[Keith Frankston, Jeff Kahn, and Jinyoung Park, #emph[On a problem of M.~Talagrand],
  Random Structures & Algorithms #strong[61] (2022), no.~4, 710--723.
  #link("https://doi.org/10.1002/rsa.21077")[doi:10.1002/rsa.21077].]
#bibitem([10])[Jeff Kahn and Gil Kalai, #emph[Thresholds and expectation thresholds], Combinatorics,
  Probability and Computing #strong[16] (2007), no.~3, 495--502.
  #link("https://doi.org/10.1017/S0963548307008474")[doi:10.1017/S0963548307008474].
  #link("https://arxiv.org/abs/math/0603218v2")[arXiv:math/0603218v2].]
#bibitem([11])[Chen Li, #emph[On $p$-Spread Measures], preprint, September~8, 2026.
  #link("https://arxiv.org/abs/2609.08967v1")[arXiv:2609.08967v1].]
#bibitem([12])[Jinyoung Park, #emph[A dimension-free comparison between expectation thresholds and fractional
  expectation thresholds], preprint, September~13, 2026.
  #link("https://arxiv.org/abs/2609.14681v1")[arXiv:2609.14681v1].]
#bibitem([13])[Jinyoung Park and Huy Tuan Pham, #emph[On a conjecture of Talagrand on selector processes and a
  consequence on positive empirical processes], Annals of Mathematics #strong[199] (2024), no.~3, 1293--1321.
  #link("https://doi.org/10.4007/annals.2024.199.3.6")[doi:10.4007/annals.2024.199.3.6].
  #link("https://arxiv.org/abs/2204.10309v2")[arXiv:2204.10309v2].]
#bibitem([14])[Jinyoung Park and Huy Tuan Pham, #emph[A proof of the Kahn--Kalai conjecture],
  Journal of the American Mathematical Society #strong[37] (2024), no.~1, 235--243.
  #link("https://doi.org/10.1090/jams/1028")[doi:10.1090/jams/1028].]
#bibitem([15])[Huy Tuan Pham, #emph[A sharp version of Talagrand's selector process conjecture and an application
  to rounding fractional covers], in Proceedings of the 57th Annual ACM Symposium on Theory of Computing
  (STOC~'25), ACM, New York, 2025, pp.~322--328.
  #link("https://doi.org/10.1145/3717823.3718256")[doi:10.1145/3717823.3718256]. Preprint version:
  #link("https://arxiv.org/abs/2412.03540v1")[arXiv:2412.03540v1], 2024.]
#bibitem([16])[Huy Tuan Pham, #emph[A sharp version of Talagrand's selector process conjecture,
  with applications to rounding fractional covers and Bernoulli Sudakov minoration], expanded preprint, 2026.
  #link("https://arxiv.org/abs/2412.03540v2")[arXiv:2412.03540v2].
  #link("https://doi.org/10.48550/arXiv.2412.03540")[doi:10.48550/arXiv.2412.03540].]
#bibitem([17])[Michel Talagrand, #emph[Are many small sets explicitly small?],
  in Proceedings of the Forty-Second ACM Symposium on Theory of Computing (STOC~'10), ACM, New York, 2010,
  pp.~13--36. #link("https://doi.org/10.1145/1806689.1806693")[doi:10.1145/1806689.1806693].
  #link("https://michel.talagrand.net/preprints/small.pdf")[Author's version].]
