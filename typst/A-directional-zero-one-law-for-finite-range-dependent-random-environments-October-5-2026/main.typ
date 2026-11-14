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

#align(center)[#text(size: 16pt, weight: "bold")[A directional zero--one law for \
finite-range-dependent random environments]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A random walk in a random environment encounters the same transition probabilities whenever it returns to a site.
  This persistence distinguishes the model from a walk whose transition probabilities are resampled at each step.
  Directional transience asks whether the walk eventually moves beyond every hyperplane perpendicular to a fixed
  direction. The directional zero–one question is whether this escape event can have probability strictly between
  zero and one after averaging over the environment.

=== 1.1 Model and main theorem <model-and-main-theorem>

Fix $d gt.eq 3$ and let $U = { plus.minus e_1 \, dots.h \, plus.minus e_d }$ be the coordinate unit steps. Set

$ Delta_U = {p in \[ 0 \, 1 \]^U : sum_(e in U) p \( e \) = 1} \, wide Omega = Delta_U^(bb(Z)^d) \, $

with its product Borel sigma-field. An environment $omega in
  Omega$ assigns the row $omega \( x \, dot.op \)$ to each site $x$.
  Let $Q$ be a Borel probability law on $Omega$ satisfying the following assumptions.

+ #emph[Stationarity and ergodicity.] For $z in bb(Z)^d$, define $\( theta_z omega \) \( x \, e \) =
  omega \( x + z \, e \)$. The law $Q$ is invariant under every $theta_z$,
  and every event invariant modulo null sets under all these translations has probability zero or one.
+ #emph[Uniform ellipticity.] For some deterministic $kappa > 0$,
  $ Q #scale(x: 120%, y: 120%)[\(] omega \( x \, e \) gt.eq kappa upright(" for every ") x in bb(Z)^d \, med
    e in U #scale(x: 120%, y: 120%)[\)] = 1 . $
+ #emph[Finite-range dependence.] For some deterministic integer $R gt.eq 0$, the sigma-fields
  $ cal(F)_A = sigma #scale(x: 120%, y: 120%)[\(] omega \( x \, e \) : x in A \, med
    e in U #scale(x: 120%, y: 120%)[\)] \, wide cal(F)_B = sigma #scale(x: 120%, y: 120%)[\(] omega \( x \, e \) :
    x in B \, med e in U #scale(x: 120%, y: 120%)[\)] $
  are independent whenever the nonempty deterministic sets $A \, B subset.eq bb(Z)^d$ satisfy
  #[#set math.equation(numbering: n => "(1.1)")
   $ "dist"_oo \( A \, B \) := inf_(a in A \, thin b in B) lr(bar.v.double a - b bar.v.double)_oo > R .
     $ <eq:finite-range>]
  This condition includes infinite sets.

For fixed $omega$, let $P_(x \, omega)$ be the law of the Markov chain started at $x$ with transitions

$ P_(x \, omega) \( X_(n + 1) = y + e divides X_n = y \) = omega \( y \, e \) . $

Its annealed law is $P_x = integral P_(x \, omega) thin Q \( d omega \)$.
  For each fixed $ell in bb(R)^d \\ { 0 }$, write

$ A_ell = { X_n dot.op ell arrow.r + oo } . $

#thm([Theorem 1.1.])[
  (Directional zero–one law).  #emph[Under assumptions (i)–(iii), for every fixed $ell in bb(R)^d \\ { 0 }$,
$ P_0 \( A_ell \) in { 0 \, 1 } . $

]
] <thm:main>

The dependence range and ellipticity constant may vary with the law $Q$.
  The direction may be irrational; it is fixed before taking probability.
  The proof uses stationarity and finite-range independence directly, without an additional appeal to ergodicity.
  Its independence arguments concern separated sigma-fields of rows,
  rather than any representation of the environment in terms of independent labels.

=== 1.2 Background and relation to earlier work <background-and-relation-to-earlier-work>

Directional zero–one laws are a basic part of the transience theory of random walks in random environments.
  Kalikow’s work [8], together with the regeneration formulation of Sznitman and Zerner [16] Lemma 1.1,
  established the sign-union law for uniformly elliptic iid environments,

$ P_0 \( A_ell union A_(- ell) \) in { 0 \, 1 } . $

This leaves open which sign is chosen when the union has probability one.
  In two dimensions, Zerner and Merkl [19] proved the full directional zero–one law for iid elliptic environments;
  Zerner [18] subsequently gave a revised proof. The planar arguments exploit intersections of paths.
  The question in higher dimensions requires a different way to exclude two possible escape signs.

Regeneration is a central tool for this problem and for laws of large numbers.
  Sznitman and Zerner [16] Theorem 1.4 and Corollary 1.5 constructed independent increments after suitable record
  times in an iid environment. Results on asymptotic directions further distinguish a deterministic axis from the
  choice of a sign on that axis: see Simenhaus [15] and Drewitz and Ramírez [5].
  A limiting direction or a conditional law of large numbers does not by itself establish a directional zero–one law.

For dependent environments, Comets and Zeitouni [4] used environment-independent forced steps to construct
  approximate regeneration under mixing assumptions, with additional hypotheses yielding a law of large numbers.
  That forcing device is an antecedent of the marked scripts used here.
  Rassoul-Agha [13] derived a law of large numbers under Gibbs mixing assumptions and a directional zero–one
  hypothesis. Guo [7] proved conditional velocity results under a mixing condition that includes
  finite-range-dependent environments. These conclusions concern velocity and do not determine the probabilities
  of the two directional escape events. Exact finite-range independence is also stronger than decay of local
  correlations: Bramson, Zeitouni, and Zerner [3] Theorem 3 constructed stationary, uniformly elliptic,
  polynomially mixing environments in dimension at least three with positive probability of escape in each of two
  opposite directions.

The companion article [12] Theorem 1.1 proves the iid directional zero–one law under strict ellipticity:
  every transition probability is positive, but no uniform lower bound is required.
  Here we extend the uniformly elliptic case to finite-range dependence.
  The proof adapts the radius-and-contact strategy developed in [12] Sections 2–7.
  In that strategy, coexistence first forces integrability of spatial regeneration radii.
  Two independent sequences of regeneration pieces are then placed in an opposed arrangement,
  and entropy and endpoint-posterior estimates give incompatible bounds on their contacts.
  We retain this architecture and prove all required estimates for the present environment law.
  The finite-range extension depends on keeping track of the rows actually used by a marked path,
  replacing intersections by proximity within the dependence range,
  and transferring only the stopped path laws justified by separated rows.
  No conditional density assumption, independent-label representation, positive speed,
  or moment bound on regeneration times is imposed.

=== 1.3 Proof strategy and additional ingredients <proof-strategy-and-additional-ingredients>

The argument rules out coexistence of escape in opposite directions.
  For a fixed direction, we construct independent regeneration pieces:
  finite path segments ending at new record heights that the subsequent path never undercuts.
  This construction proves that positive probability of escape in that direction makes the two escape signs exhaustive.

Finite-range dependence creates two obstacles to the usual iid reasoning.
  Disjoint paths can use correlated rows, and an observed path can change the law of nearby unobserved rows.
  We split each transition into two marked choices of constant weight and a remaining choice.
  A prescribed sequence of the constant-weight choices moves beyond the dependence range without using any further
  row information. This leaves a region of genuinely independent rows for a continuation that stays beyond its
  endpoint. The prescribed sequences cannot overlap, so the regeneration pieces have an unambiguous concatenation
  law. Conditioning at their endpoints is proved by enumeration of finite prefixes,
  since those endpoints are selected using the future.

Under coexistence, the regeneration pieces have finite mean spatial radius.
  The proof uses a large transverse excursion to splice in an oppositely directed continuation,
  separated from the observed path by a tilted hyperplane and a short marked connector.
  Repeating the construction would place uniformly positive probability in disjoint windows for the walk’s final
  directional supremum. This contradiction gives the radius bound.
  It yields opposite deterministic limiting rays and reduces an arbitrary real direction to a coordinate direction.

For that coordinate, place independent positive and negative sequences of regeneration pieces in an opposed
  arrangement. A contact means that their departure sites come within distance $R$.
  Common regeneration heights divide the arrangement into iid pairs of lists.
  Finite spatial moments bound the entropy of their cumulative lateral displacement.
  Comparing long chunks with independent bridges—concatenated regeneration pieces conditioned on prescribed total
  widths—then shows that among the first $J$ dyadic intervals of block indices,
  the expected number containing a contact is $O \( J \/ log J \)$.

The opposite estimate uses endpoint alignment. Start a negative path,
  conditioned to stay below its starting height, just below a positive bridge’s endpoint,
  and search for their first contact along the positive path.
  Posterior probabilities for a finite set of possible lateral endpoints form a vector of martingales.
  The sum of their running maxima has an exponential tail on the scale of the logarithm of the number of
  endpoints. The marked segment ending an observed prefix at a lower height permits comparison with a fresh path
  law up to its first exit from a specified slab. The posterior functions retain their original meaning;
  only the stopped path marginal is transferred. Combining this estimate with nearby-point comparisons of quenched
  exit probabilities forces $Omega \( J \/ log log J \)$ contact scales, contradicting the entropy bound.

The finite-range adaptations are the marked separation, killing on entry to neighborhoods of radius $R$,
  and comparison of stopped posterior processes across the resulting gaps between active rows.
  We prove in full the vector-martingale estimate of [12] Lemma 6.1;
  it controls the cost of selecting a path through an endpoint constraint.

Section 2 establishes regeneration and mean widths. Section 3 proves spatial integrability and reduces to
  coordinate coexistence. Sections 4 and 5 construct the opposed arrangement and its contact upper bound.
  Section 6 proves the endpoint estimate, and Section 7 obtains the contradictory lower bound.

== 2 Separated rows and regeneration words <sec:cuts>

We first construct independent successive pieces of a walk that stays above its initial level in a prescribed
  direction. Finite-range dependence requires a gap between the rows used by consecutive pieces.
  We create that gap by marking some transitions whose probabilities are constant,
  so that the walk can cross the gap without using its environmental rows.
  The construction will also prove the directional sign-union statement and a finite mean for the spatial width of
  each piece. Throughout this section the direction may be any fixed nonzero real vector.
  We adapt the regeneration and record-count arguments of [12] Section 2,
  proving here the separated-row identities needed for finite-range dependence.

=== 2.1 Marks and the rows a path uses <marks-and-the-rows-a-path-uses>

We use the same splitting device as the independent-coin construction of Comets and Zeitouni [4] Equation (2.1):
  an environment-independent choice forces a step, and a residual choice restores the prescribed transition row.
  Two distinguished marks will also prevent overlapping occurrences of the prescribed step sequence introduced below.

Fix $lambda > 0$ with $2 lambda < kappa$. Enlarge the walk by giving each step a mark in ${ 0 \, 1 \, * }$.
  Conditional on the environment and the marked past, a step from $x$ has joint probabilities

#[#set math.equation(numbering: n => "(2.1)")
 $ P_(x \, omega) \( X_1 = x + e \, upright(" mark ") 0 \) & = lambda \,\
P_(x \, omega) \( X_1 = x + e \, upright(" mark ") 1 \) & = lambda \,\
P_(x \, omega) \( X_1 = x + e \, upright(" mark ") * \) & = omega \( x \, e \) - 2 lambda \, wide
  e in U . $ <eq:marked-kernel>]

These probabilities are nonnegative and sum to one. Summing over the marks recovers the original transition row,
  so every assertion about the unmarked path is unchanged. We keep the notation $P_(x \, omega)$ and $P_x$ for the
  marked quenched and annealed laws. We call these laws #emph[raw] when no condition of staying on one side of a
  barrier is imposed. The path filtration includes both positions and the marks of steps already taken.
  All constructions take place on the full-measure set where the ellipticity inequalities hold at every site;
  the marked kernel may be defined arbitrarily elsewhere.

A finite marked word $gamma$ consists of positions $x_0 \, dots.h \, x_t$, with $x_(j + 1) - x_j in U$,
  and one mark for each of its $t$ steps. Its departure set and active departure set are

$ "Dep" \( gamma \) = { x_0 \, dots.h \, x_(t - 1) } \, wide "Act" \( gamma \) = { x_j : 0 lt.eq j < t \, med
  upright("step ") j upright(" has mark ") * } . $

Let $p_omega \( gamma \)$ be the product of the marked transition probabilities in (2.1), and put

$ W \( gamma \) = E_Q \[ p_omega \( gamma \) \] . $

Thus $W \( gamma \)$ is the annealed probability of the specified prefix.
  Stationarity makes it invariant under translation of all positions in the word.
  The terminal arrival uses no row. More generally, a visited row affects $p_omega \( gamma \)$ only if it is an
  active departure.

#thm([Lemma 2.1.])[
  (Separated path weights).  #emph[Let $gamma$ be a fixed finite marked word,
    and let $B subset.eq bb(Z)^d$ be a deterministic set. With the convention that distance from an empty set is
    infinite, suppose that
$ "dist"_oo \( "Act" \( gamma \) \, B \) > R . $

 If $f gt.eq 0$ is measurable with respect to the rows in $B$, then
#[#set math.equation(numbering: n => "(2.2)")
 $ E_Q \[ p_omega \( gamma \) f \( omega \) \] = W \( gamma \) E_Q \[ f \( omega \) \] . $ <eq:separated-weights>]

 The conclusion also holds when the active set is empty, without a separation requirement.]
  #emph[For a deterministic set $F subset.eq bb(Z)^d$, the quenched law of the marked walk stopped on its first
    arrival in $F$, including the arrival site, depends only on rows outside $F$.
    In particular, the quenched probability of any measurable infinite-path event that implies the walk never
    enters $F$ depends only on those rows. Such probabilities may therefore be used as $f$ in (2.2) whenever the
    exterior rows are separated from $"Act" \( gamma \)$.]
] <lem:separated-weights>

#proof[
  Factors with marks $0$ or $1$ are constant. All other factors in $p_omega \( gamma \)$ are functions of rows in
    $"Act" \( gamma \)$, with repeated departures from one row retaining that same row.
    The finite-range assumption (1.1) gives independence from the rows in $B$, also when $B$ is infinite.
    This proves (2.2); if the active set is empty, $p_omega \( gamma \)$ itself is constant.
  Before the first arrival in $F$, every transition departs from its complement.
    Prefix probabilities for the stopped walk therefore use only exterior rows,
    including when the prefix ends with that arrival. These prefixes determine the stopped path law,
    so all its measurable event probabilities have the same row dependence.
    Equivalently, one may kill the walk on arrival in $F$. An infinite-path event implying avoidance of $F$ is
    determined by this killed trajectory: it is false on killed paths and retains its original meaning on
    surviving paths. This proves the last assertion. ◻
]

We will always fix the relevant finite words before applying this lemma.
  The separated sets are then deterministic. For example, two prescribed words with departure sets at distance
  greater than $R$ have the same joint weight in independent environments as in a common environment with
  conditionally independent walks. The lemma also applies to an avoidance event involving an entire infinite
  continuation.

=== 2.2 Cuts with independent continuations <cuts-with-independent-continuations>

Fix a direction $v eq.not 0$, rescale it so that $lr(bar.v.double v bar.v.double)_oo = 1$, and write $h \( x \) =
  v dot.op x$. Choose a coordinate step $a_v in U$ with $h \( a_v \) = 1$.
  Fix an integer $M > d R + 1$, the same integer for every direction considered, and set $xi = lambda^M$.
  The prescribed #emph[script] in direction $v$ consists of $M$ steps $a_v$,
  the first with mark $0$ and all the others with mark $1$.
  Two occurrences of the script cannot overlap in a step: the initial $0$ of a second occurrence would have to
  coincide with a $1$ of the first.

We call time zero a record. A positive time is an #emph[ordinary record] if its height strictly exceeds all
  preceding heights. A script starting at a record has a #emph[candidate] at its end.
  A candidate time $t$ is a #emph[cut] if

$ h \( X_n \) gt.eq h \( X_t \) wide \( n gt.eq t \) . $

Each candidate is itself a strict record. These definitions initially refer to the whole path starting at time
  zero. For a walk started elsewhere we use heights relative to its starting site. Write

$ D_v = { h \( X_n \) gt.eq 0 upright(" for every ") n gt.eq 0 } \, wide p_v = P_0 \( D_v \) \, wide hat(P)_v =
  P_0 \( thin dot.op divides D_v \) quad \( p_v > 0 \) . $

The script separates the rows of a record prefix from those of a continuation above its endpoint;
  Figure 1 displays this distinction between visited and active sites. Indeed, for all $x \, y in bb(Z)^d$,

#[#set math.equation(numbering: n => "(2.3)")
 $ \| h \( x \) - h \( y \) \| lt.eq d lr(bar.v.double x - y bar.v.double)_oo . $ <eq:height-distance>]

If a record prefix ends at height $r$, every departure in that prefix has height strictly below $r$.
  The script has no active departures, whereas a continuation staying above its endpoint uses only rows of height
  at least $r + M$. The required separation follows from $M > d R$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3.6, -1.65), (3.7, 0), fill: rgb("#ededff"), stroke: none)
  rect((-3.6, 2.15), (3.7, 3.05), fill: rgb("#ebf5eb"), stroke: none)
  line((-3.6, 0), (3.7, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-3.6, 2.15), (3.7, 2.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-4.05, -1.65), (-4.05, 3.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((-4.05, 3.15), [#text(size: 9pt)[$h$]], anchor: "south", padding: 0.1176cm)
  content((-4.05, 0), [#text(size: 9pt)[$r$]], anchor: "east", padding: 0.1176cm)
  content((-4.05, 2.15), [#text(size: 9pt)[$r+M$]], anchor: "east", padding: 0.1176cm)
  line((-2.6, -1.25), (-2.1, -0.8), (-1.5, -1.1), (-1.1, -0.5), (-0.6, -0.75), (0, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  circle((-2.6, -1.25), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((-1.5, -1.1), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((-1.1, -0.5), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  circle((-2.1, -0.8), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.6, -0.75), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (0, 0.43), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#d96d00"))))
  content((0.1058, 0.215), [#text(size: 9pt)[$0$]], anchor: "west", padding: 0.1176cm)
  line((0, 0.43), (0, 0.86), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#d96d00"))))
  content((0.1058, 0.645), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
  line((0, 0.86), (0, 1.29), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#d96d00"))))
  content((0.1058, 1.075), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
  line((0, 1.29), (0, 1.72), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#d96d00"))))
  content((0.1058, 1.505), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
  line((0, 1.72), (0, 2.15), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#d96d00"))))
  content((0.1058, 1.935), [#text(size: 9pt)[$1$]], anchor: "west", padding: 0.1176cm)
  circle((0, 0), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#d96d00"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0.43), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#d96d00"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0.86), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#d96d00"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 1.29), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#d96d00"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 1.72), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#d96d00"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 2.15), radius: 0.07056, fill: rgb("#ffffff"), stroke: (paint: rgb("#d96d00"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.15), (0.65, 2.5), (1.2, 2.3), (1.85, 2.8), (2.5, 2.55), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#003a00"))))
  content((0.9, -0.75), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[prefix active rows#linebreak()have $h<r$]]], anchor: "west", padding: 0.1176cm)
  content((-3.4, 2.6), [#text(fill: rgb("#002d00"))[#text(size: 9pt)[continuation rows#linebreak()have $h gt.eq r+M$]]], anchor: "west", padding: 0.1176cm)
  content((0.9, 1.05), [#text(size: 9pt)[script departures#linebreak()use constant weights]], anchor: "west", padding: 0.1176cm)
  line((-0.48, 0), (-0.48, 2.15), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.7269, 1.075), [#text(size: 9pt)[$M$]], anchor: "east", padding: 0.1176cm)
})],
  caption: [Figure 1: The gap at a candidate, shown schematically in height coordinates. Filled points indicate active prefix departures; orange arrows are the constant-weight script steps. The height gap separates every active prefix row from every permitted continuation row by more than $R$ in $ell^oo$-distance, although the script itself visits the intervening sites. ],
) <fig:cut-gap>

Consequently, conditional on any finite marked prefix ending at a record,
  the probability that the script occurs next and ends at a cut is exactly

#[#set math.equation(numbering: n => "(2.4)")
 $ xi p_v . $ <eq:script-probability>]

More precisely, if $gamma_0$ is that prefix and $B$ is any event for a translated continuation from zero, then

#[#set math.equation(numbering: n => "(2.5)")
 $ & P_0 { upright("prefix ") gamma_0 \, med upright("then the script,")\
 & #h(12mm)  upright("then a translated continuation in ") B ∩ D_v }\
 & #h(12mm)  = W \( gamma_0 \) xi P_0 \( B ∩ D_v \) . $ <eq:record-suffix-factorization>]

Here and below a translated continuation records its positions relative to its own starting site.
  Lemma 2 proves this identity, using the forbidden halfspace below the script’s endpoint and stationarity.

We also record an elementary consequence of ellipticity that will be used repeatedly.
  A walk started in a slab ${ x : a lt.eq h \( x \) lt.eq b }$, with $a \, b$ finite,
  exits that slab almost surely under every uniformly elliptic quenched law. Choose an integer $m > b - a$.
  From any site of the slab, $m$ consecutive steps $a_v$ leave it, and their probability is at least $kappa^m$.
  Conditional trials in successive blocks of $m$ steps bound the probability of remaining for $j
  m$ steps by $\( 1 - kappa^m \)^j$. In particular, on $D_v$ the height supremum is almost surely infinite:
  remaining forever in $\[ 0 \, b \]$ is null for each positive integer $b$.

To describe the pieces between cuts, call a finite marked word $gamma$ from zero a #emph[regeneration word] if it
  has the following properties:

+ all its heights are nonnegative;
+ it ends at a candidate;
+ every earlier candidate in the word is undercut later within the word,
  meaning that a subsequent height is strictly smaller than that candidate’s height.

Records and candidates in this definition are computed within the word.
  Its #emph[width] $L \( gamma \)$ is its terminal height. The last script starts at a record of height
  $L \( gamma \) - M$, so

#[#set math.equation(numbering: n => "(2.6)")
 $ L \( gamma \) gt.eq M \, wide 0 lt.eq h \( x \) < L \( gamma \) quad \( x in "Dep" \( gamma \) \) \,\
h \( x \) < L \( gamma \) - M quad \( x in "Act" \( gamma \) \) . $ <eq:word-height-support>]

We sometimes call a regeneration word a #emph[slab], referring to this height support.

#thm([Proposition 2.2.])[
  (Regeneration law).  #emph[Fix a normalized real direction $v$ and suppose $p_v > 0$.]
  + #emph[Under the raw law $P_0$, on ${ sup_n h \( X_n \) = oo }$ there is a cut almost surely.]
  + #emph[Under $hat(P)_v$, there are infinitely many cuts.
    With time zero counted as an initial boundary, the relative marked words between successive boundaries are
    independent and identically distributed. Their common law $nu_v$ assigns mass
#[#set math.equation(numbering: n => "(2.7)")
 $ nu_v \( { gamma } \) = W \( gamma \) $ <eq:regeneration-word-law>]

 to each regeneration word $gamma$. These finite words concatenate to the entire conditioned walk.]
  + #emph[Under the raw law, conditional on any realized prefix through the first cut,
    the translated suffix has law $hat(P)_v$. This assertion is restricted to the event that a cut exists.]
] <prop:cut-law>

#proof[
  First test for a scripted cut from time zero. Failure is detected in finite time:
    either the next $M$ steps are not the script, or they are the script and the subsequent path first falls below
    its endpoint. After a detected failure, wait for a strict record above the whole maximum attained by the
    detection time, and test again. The successive test starts, when finite,
    are stopping times in the marked path filtration. Equation (2.4), applied to every finite record prefix,
    gives conditional success probability $xi p_v$ at each test. Hence
  $ P_0 { upright("the first ") j upright(" tests occur and all fail") } lt.eq \( 1 - xi p_v \)^j . $
  On infinite height supremum, every detected failure is followed by another finite test start.
    Letting $j$ tend to infinity proves (i). The slab-exit observation implies that the first cut is finite almost
    surely under $hat(P)_v$. The tests need not locate the earliest cut;
    their only role is to establish that some cut exists.
  We now identify the law at the actual first cut by finite prefixes.
    Suppose $gamma$ is a regeneration word ending at $z$. A path beginning with $gamma$ whose suffix stays at or
    above $h \( z \)$ has its first cut at that endpoint: all earlier candidates have already been undercut.
    It also satisfies the original $D_v$. Conversely, a path in $D_v$ through its first cut gives such a word.
    Indeed, every earlier candidate has smaller height than the terminal strict record.
    If it were not undercut before the terminal record, it could not be undercut afterwards either,
    since the suffix stays above that record; it would already be a cut.
  For any measurable suffix event $B$, the row separation in (2.6) and Lemma 2 therefore give
  $ & P_0 { upright("first-cut prefix ") gamma \, med upright(" translated suffix in ") B }\
 & #h(25mm)  = W \( gamma \) P_0 \( B ∩ D_v \) . $
  Dividing by $p_v$ proves that, under $hat(P)_v$, the first word has mass $W \( gamma \)$ and its translated
    suffix has law $hat(P)_v$, independently of that word. There are only countably many finite marked words,
    and the first cut is finite almost surely, so these masses sum to one.
  The cut is a strict record, hence records of its translated suffix are also records of the full path.
    A script cannot straddle this boundary: such a script would overlap the script that has just ended.
    Thus the cuts of the suffix are precisely the subsequent cuts of the full path.
    Iterating the preceding factorization proves the iid assertion in (ii).
    Every word is finite and contains at least $M$ steps, so the successive cut times tend to infinity and the
    words cover the whole path.
  For (iii), the prefix through the raw first cut may have negative heights,
    but it still ends with the script from a record, and every preceding candidate is undercut within the prefix.
    Its active departures lie strictly below the start of the terminal script.
    The same separated-weight calculation gives raw prefix probability $W \( gamma \) p_v$ and,
    with suffix restriction $B$, probability $W \( gamma \) P_0 \( B ∩ D_v \)$. Their ratio is $hat(P)_v \( B \)$.
    All of these arguments enumerate finite prefixes; none uses a Markov property at a cut selected using the future. ◻
]

=== 2.3 Escape signs and finite mean width <escape-signs-and-finite-mean-width>

The regeneration law gives two consequences needed in the remainder of the proof.
  First, a positive escape probability in one direction rules out oscillation between arbitrarily high and low
  levels. Second, the widths of the regeneration words have finite mean.
  Counting records, rather than integer height levels, will give the latter conclusion for real directions as well.

#thm([Proposition 2.3.])[
  (Directional sign union).  #emph[For every fixed $v eq.not 0$,
#[#set math.equation(numbering: n => "(2.8)")
 $ P_0 \( A_v \) > 0 quad arrow.r.double quad p_v > 0 med upright(" and ") med P_0 \( A_v union A_(- v) \) =
   1 . $ <eq:sign-union>]

 More precisely, when $p_v > 0$, infinite height supremum implies $A_v$ almost surely,
   and finite height supremum implies $A_(- v)$ almost surely.]
] <prop:sign-union>

#proof[
  Assume first that $p_v > 0$. On infinite supremum there is a first cut,
    and its suffix has the iid word law of Proposition 3. The successive slab bases increase in height by at least
    $M$; within each slab the path stays above its base. Since each slab is finite, $h \( X_n \) arrow.r + oo$.
  For finite supremum, fix integers $m \, b gt.eq 0$. Consider the event that all heights are at most $m$,
    but heights at least $- b$ are visited infinitely often. From each such visit, a script of $m + b +
    1$ consecutive steps $a_v$, with no mark restriction, crosses $m$ with conditional probability at least
    $kappa^(m + b + 1)$. Take successive visit trials at least $m + b + 1$ times apart.
    The probability that the first $j$ trials occur and all fail to cross $m$ is at most
    $\( 1 - kappa^(m + b + 1) \)^j$. The event in question is therefore null.
    Taking the countable union over $m \, b$ shows that finite supremum forces $h \( X_n \) arrow.r - oo$.
  It remains to obtain $p_v > 0$ from a positive probability of $A_v$.
    On $A_v$, the height sequence tends to infinity, so its global minimum is attained at some finite time,
    even if its possible values are not discrete. Thus for some deterministic $n gt.eq 0$ and $x in bb(Z)^d$, the event
  $ { X_n = x \, med h \( X_(n + j) \) gt.eq h \( x \) upright(" for all ") j gt.eq 0 } $
  has positive annealed probability. If $q_x \( omega \)$ denotes the quenched probability from $x$ of staying
    above $h \( x \)$, the quenched Markov property at time $n$ expresses this probability as
    $E_Q \[ P_(0 \, omega) \( X_n = x \) q_x \( omega \) \]$.
    It is bounded above by $E_Q q_x = p_v$, by stationarity. Therefore $p_v > 0$,
    and the two alternatives just proved give (2.8). ◻
]

#thm([Proposition 2.4.])[
  (Finite mean spatial width).  #emph[For every normalized real direction $v$ with $p_v > 0$,
    the regeneration law of Proposition 3 satisfies
#[#set math.equation(numbering: n => "(2.9)")
 $ E_(nu_v) L < oo . $ <eq:finite-mean-width>]

]
] <prop:mean-width>

#proof[
  Let $S \( gamma \)$ be the number of ordinary records in a regeneration word $gamma$,
    excluding its initial boundary and including its terminal record.
    Each increase of the running maximum is at most one, because every step has height increment at most one.
    Therefore $L \( gamma \) lt.eq S \( gamma \)$. The record indices of successive cuts,
    with index zero at the initial boundary, are sums of iid positive integer increments with law $S$:
    the terminal height of each word is the maximum so far, so record counts concatenate across boundaries.
  For $i gt.eq 0$, let $rho_i$ be the time of ordinary record index $i$ in a raw walk, with $rho_0 =
    0$ and $rho_i = oo$ if that record is never reached. Put
  $ D'_(v \, i) = { rho_i < oo \, med h \( X_j \) gt.eq 0 upright(" for ") 0 lt.eq j lt.eq rho_i } . $
  A script from record $i$ creates exactly $M$ consecutive strict records.
    Hence a cut of record index $i + M$, on a path in $D_v$, occurs exactly when the prefix realizes
    $D'_(v \, i)$, the script follows, and its suffix stays above its endpoint.
    Summing (2.5) over the possible record prefixes and dividing by $p_v$ gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ hat(P)_v { i + M upright(" is a cut index") } = xi P_0 \( D'_(v \, i) \) gt.eq
     xi p_v . $ <eq:record-renewal-lower>]
  The inequality holds because on $D_v$ the supremum is infinite almost surely, so every ordinary record is reached.
  Let $N_(upright("rec")) \( n \)$ count the cut indices in ${ 1 \, dots.h \, n }$. Equation (2.10) implies
  $ liminf_(n arrow.r oo) frac(E_(hat(P)_v) N_(upright("rec")) \( n \), n) gt.eq xi p_v > 0 . $
  If $E_(nu_v) S = oo$, however, the partial sums of iid copies of $S$, divided by their number,
    tend to infinity almost surely. To see this, apply the strong law to $min \( S \, K \)$ for each positive
    integer $K$, then let $K arrow.r oo$. Inverting these partial sums shows $N_(upright("rec")) \( n \) \/ n
    arrow.r 0$ almost surely. Since this ratio lies in $\[ 0 \, 1 \]$,
    bounded convergence gives the same limit in expectation, a contradiction.
    Thus $E_(nu_v) S < oo$, and $L lt.eq S$ proves (2.9). ◻
]

The estimate concerns spatial width; it uses no moment assumption on the time spent in a word.
  We next show that coexistence of the two escape signs also forces a finite mean for the full spatial radius.

== 3 Spatial moments and reduction to a coordinate direction <sec:radius>

The finite mean width from Proposition 5 controls a regeneration word only in its direction of progress.
  We now show that coexistence of the two escape signs also controls its spatial extent.
  This will give two limiting rays and reduce the problem to a coordinate direction.
  The radius argument adapts [12] Proposition 3.1, with a marked connector and a separated infinite continuation
  supplying the finite-range version.

For a regeneration word $gamma$ with position sequence $\( x_0 \, dots.h \, x_m \)$, written relative to $x_0 =
  0$, define its radius by

$ cal(R) \( gamma \) = max_(0 lt.eq j lt.eq m) \| x_j \| \, $

where $\| dot.op \|$ denotes Euclidean norm. In particular, the terminal arrival contributes to the radius.
  Distances used for finite-range independence remain $ell^oo$ distances.

=== 3.1 An integrable spatial radius <an-integrable-spatial-radius>

We first record an elementary estimate that controls all initial sums at once.
  Stationarity, rather than independence, is enough for this estimate.
  It is the stationary-sequence form of Hopf’s maximal ergodic inequality; see Garsia [6].
  We include a disjoint-interval proof.

#thm([Lemma 3.1.])[
  (A maximal estimate for initial averages).  #emph[Let $\( Z_i \)_(i gt.eq 1)$ be a stationary sequence of
    nonnegative integrable random variables. For every integer $n gt.eq 1$ and every $a > 0$,
$ bb(P) {max_(1 lt.eq k lt.eq n) 1 / k sum_(i = 1)^k Z_i > a} lt.eq frac(bb(E) Z_1, a) . $

]
] <lem:stationary-maximal>

#proof[
  Call an integer $j gt.eq 1$ bad if some interval starting at $j$, of length at most $n$,
    has average greater than $a$. Among the bad starts in ${ 1 \, dots.h \, m }$,
    select the leftmost one and a witnessing interval. Continue by selecting the leftmost bad start strictly to
    the right of the selected interval, and repeat. These disjoint intervals cover all bad starts in ${ 1 \,
    dots.h \, m }$ and lie in ${ 1 \, dots.h \, m + n }$. Their total length is at least the number of those bad
    starts, while the sum of the $Z_i$ over them is at least $a$ times their total length. Consequently
  $ a thin \# { j lt.eq m : j upright(" is bad") } lt.eq sum_(i = 1)^(m + n) Z_i . $
  Taking expectations, using stationarity, dividing by $m$, and letting $m arrow.r oo$ proves the assertion. ◻
]

#thm([Proposition 3.2.])[
  (Radius moment under coexistence).  #emph[Let $v eq.not 0$ satisfy $parallel v parallel_oo = 1$.
    If $P_0 \( A_v \) > 0$ and $P_0 \( A_(- v) \) > 0$, then the regeneration-word laws of Proposition 3 satisfy
#[#set math.equation(numbering: n => "(3.1)")
 $ E_(nu_v) cal(R) + E_(nu_(- v)) cal(R) < oo . $ <eq:radius-moment>]

]
] <prop:radius-moment>

#proof[
  Both nonbacktracking probabilities $p_v \, p_(- v)$ are positive by Proposition 4. For $sigma in { + \, - }$ write
  $ P_sigma^(*) = hat(P)_(sigma v) \, wide E_sigma^(*) = E_(P_sigma^(*)) . $
  Here $sigma v$ means $v$ or $- v$, respectively. Under either law, let $L_i \,
    cal(R)_i$ be the width and radius of its $i$th regeneration word, and put
  $ H_0 = 0 \, wide H_k = sum_(i = 1)^k L_i . $
  An unsubscripted $L$ or $cal(R)$ denotes the corresponding variable for one word.
    All constants chosen below are independent of the scale parameters $i_0$ and $a$.
  Suppose that (3.1) fails. The truncated mean
  $ I \( t \) = sum_(sigma in { + \, - }) E_sigma^(*) min \( cal(R) \, t \) \, wide t gt.eq 0 \, $
  is then nondecreasing and unbounded. It is concave, $I \( 0 \) = 0$, and $I \( t \) = o \( t \)$:
    the last assertion follows by dominated convergence from the almost-sure finiteness of each regeneration word.
  We will obtain a fixed positive probability that the final supremum of one of the two signed heights lies in a
    bounded window, and then place these windows arbitrarily far apart.
    The unbounded truncated mean will produce a large spatial excursion after a controlled initial segment,
    and hence a record for a tilted linear functional. A marked connector will let us append a separated
    continuation in the opposite direction while preserving the height maximum already attained.
  ===== 3.1.1 The scale and a controlled initial segment. <the-scale-and-a-controlled-initial-segment.>
  Proposition 5 and the strong law allow us to choose $c \, C > 0$ and $C_0 gt.eq 0$ so that, under each sign law,
    with probability greater than $0.95$,
  #[#set math.equation(numbering: n => "(3.2)")
   $ c k - C_0 lt.eq H_k lt.eq C k + C_0 wide \( k gt.eq 0 \) . $ <eq:radius-height-bounds>]
  Indeed, choose $c$ below both mean widths and $C$ above both,
    and then choose a deterministic $C_0$ controlling the finitely many initial deviations with the stated
    probability. Next choose an integer $C_1 gt.eq 1$, a number $b > 1 \/ c$, a number $B > 1$, and $eta > 0$,
    in that order, with
  #[#set math.equation(numbering: n => "(3.3)")
   $ C_1 c > C + 4 \, wide frac(B - 1, sqrt(d)) - b \( C + 2 \) > 2 \, wide 4 C_1 eta < 0.15 . $ <eq:radius-constants>]
  For $a > 0$ sufficiently large, let $N = N \( a \)$ be the first positive integer such that
  $ I \( a N \) gt.eq eta a . $
  It exists because $I$ is unbounded, and $N \( a \) arrow.r oo$ because $I \( t \) = o \( t \)$.
    For large $a$, minimality and concavity give
  #[#set math.equation(numbering: n => "(3.4)")
   $ eta a lt.eq I \( a N \) lt.eq frac(N, N - 1) I \( a \( N - 1 \) \) < 2 eta a . $ <eq:radius-scale>]
  Let $cal(J)_m$ be the event that (3.2) holds through $m$ and
  $ sum_(i = 1)^k cal(R)_i lt.eq a k wide \( 1 lt.eq k lt.eq m \) . $
  For both signs and all sufficiently large $a$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ P_sigma^(*) \( cal(J)_(C_1 N) \) > 0.8 . $ <eq:radius-controlled>]
  To see this, set $n = C_1 N$ and truncate each radius at $a n$. Its mean is at most
  $ I \( a n \) lt.eq C_1 I \( a N \) < 2 C_1 eta a . $
  Lemma 6 bounds by $2 C_1 eta$ the probability that any initial average of the truncated radii, through $n$,
    exceeds $a$. Also
  $ P_sigma^(*) { cal(R)_i > a n upright(" for some ") i lt.eq n } lt.eq n P_sigma^(*) \( cal(R) > a n \) lt.eq
    frac(E_sigma^(*) min \( cal(R) \, a n \), a) < 2 C_1 eta . $
  Combining these estimates with the probability of (3.2) proves (3.5).
  ===== 3.1.2 A large excursion following that segment. <a-large-excursion-following-that-segment.>
  Choose an integer $i_0$ large enough that
  #[#set math.equation(numbering: n => "(3.6)")
   $ sum_sigma sum_(i gt.eq i_0) P_sigma^(*) \( L > i \) < frac(eta, 4 B) \,\
c \( i - 1 \) - C_0 gt.eq frac(c i, 2) \, wide C \( i - 1 \) + C_0 +
  i lt.eq \( C + 2 \) i wide \( i gt.eq i_0 \) . $ <eq:radius-initial-index>]
  The first condition follows from integrability of the widths.
    With $i_0$ fixed, take $a$ sufficiently large that $N gt.eq i_0$ and $I \( B a i_0 \) < eta a \/ 4$,
    as well as all preceding large-$a$ requirements. For $i_0 lt.eq i lt.eq N$ define
  $ cal(L)_i = { cal(R)_i > B a i \, med L_i lt.eq i } \, wide Lambda_sigma =
    sum_(i = i_0)^N P_sigma^(*) \( cal(L)_i \) . $
  Integration of the decreasing radius tails gives
  $ sum_sigma sum_(i = i_0)^N P_sigma^(*) \( cal(R) > B a i \) & gt.eq
    frac(I \( B a \( N + 1 \) \) - I \( B a i_0 \), B a) \,\
sum_sigma sum_(i = 1)^N P_sigma^(*) \( cal(R) > B a i \) & lt.eq frac(I \( B a N \), B a) . $
  The first right-hand side is at least $3 eta \/ \( 4 B \)$, by (3.4) and monotonicity of $I$.
    The second is at most $2 eta$, by concavity. Subtracting the width-tail bound in (3.6) therefore yields
  #[#set math.equation(numbering: n => "(3.7)")
   $ frac(eta, 2 B) lt.eq Lambda_(+) + Lambda_(-) lt.eq 2 eta . $ <eq:radius-large-excursion-mass>]
  Choose a sign $sigma$ for which $Lambda_sigma gt.eq eta \/ \( 4 B \)$,
    and count the indices for which both $cal(J)_(i - 1)$ and $cal(L)_i$ occur.
    Independence of the $i$th word from its predecessors and (3.5) give a mean of at least $0.8 Lambda_sigma$.
    The second moment is at most $Lambda_sigma + Lambda_sigma^2$,
    by domination by the sum of the independent indicators $upright(bold(1))_(cal(L)_i)$.
    Cauchy–Schwarz and (3.7) imply that, with probability at least a constant $delta > 0$ independent of $i_0 \,
    a$, there is an index $i in \[ i_0 \, N \]$ with
  #[#set math.equation(numbering: n => "(3.8)")
   $ cal(J)_(i - 1) ∩ cal(L)_i . $ <eq:radius-selected-excursion>]
  ===== 3.1.3 A record in a tilted direction. <a-record-in-a-tilted-direction.>
  For this sign write $h \( x \) = sigma v dot.op x$. On (3.8),
    all preceding positions have norm at most $a \( i - 1 \)$,
    whereas some position $X$ in word $i$ satisfies $\| X \| > \( B - 1 \) a i$.
    Hence, for some coordinate step $u in U$,
  $ u dot.op X > frac(\( B - 1 \) a i, sqrt(d)) . $
  Throughout this word, the running maximum of $h$ lies between $H_(i - 1)$ and $H_i$,
    and therefore in $\[ c i \/ 2 \, \( C + 2 \) i \]$. Define the linear functional
  $ Y \( x \) = u dot.op x - b a h \( x \) . $
  Before word $i$, nonnegativity of $h$ gives $Y lt.eq a \( i - 1 \)$.
    At the indicated position, (3.3) gives $Y > 2 a i$. There is consequently a strict $Y$-record whose running
    $h$-maximum belongs to the deterministic window
  #[#set math.equation(numbering: n => "(3.9)")
   $ cal(W) = \[ c i_0 \/ 2 \, \( C + 2 \) N \] . $ <eq:radius-window>]
  For each fixed $u$, let $T$ be the first positive time at which the position is a strict $Y$-record,
    the running $h$-maximum belongs to $cal(W)$, and the entire prefix has nonnegative $h$-heights.
    These conditions make $T$ a stopping time. Since there are $2 d$ choices of $u$,
    one of them satisfies $P_sigma^(*) \( T < oo \) gt.eq delta \/ \( 2 d \)$.
    Fix that choice and set $p_(*) = min \( p_v \, p_(- v) \)$. Under the raw law,
  #[#set math.equation(numbering: n => "(3.10)")
   $ P_0 \( T < oo \) gt.eq frac(p_(*) delta, 2 d) . $ <eq:radius-record-probability>]
  We have found a record with a uniformly positive probability,
    while its running height maximum lies in a window that can be moved arbitrarily far out.
    We next continue from this record so that the final height maximum stays in the same window.
    The continuation must remain separated from the observed prefix for its annealed probability to factor.
  ===== 3.1.4 A separated continuation in the opposite direction. <a-separated-continuation-in-the-opposite-direction.>
  Choose a coordinate step $e$ with $h \( e \) = - 1$. From $X_T$ force $m_0$ successive steps $e$,
    all with mark $0$, where $m_0$ is a fixed positive integer satisfying
  #[#set math.equation(numbering: n => "(3.11)")
   $ m_0 b > 1 + b C_0 + R d b + 1 . $ <eq:radius-connector-length>]
  The choice of $m_0$ depends only on the fixed constants $b \, C_0 \, R \, d$, and is independent of $i_0 \, a$.
    These steps have weight $lambda^(m_0)$. At their endpoint $z = X_T + m_0 e$,
    consider the translated raw event consisting of $D_(- sigma v)$ and $cal(J)_(C_1 N)$ for the opposite
    regeneration sequence, with the required cuts finite. Its raw probability is at least $0.8
    p_(*)$ by (3.5) and Proposition 3.
  Every position of the continuation from $z$ is separated by more than $R$ from the prefix through $T$.
    There are two parts to this geometric assertion. During opposite word $k + 1$, for $0 lt.eq k < C_1 N$,
    displacement from $z$ in the $u$ coordinate is at least $- a \( k + 1 \)$,
    by the initial-sum radius bound in $cal(J)_(C_1 N)$; displacement in $h$ is at most $- c k + C_0$.
    Its total $Y$-increment from $X_T$, including the forced steps, is therefore at least
  #[#set math.equation(numbering: n => "(3.12)")
   $ & m_0 \( b a - 1 \) - a \( k + 1 \) + b a \( c k - C_0 \)\
 & #h(12mm)  = a #scale(x: 120%, y: 120%)[\(] m_0 b - 1 - b C_0 + \( b c - 1 \) k #scale(x: 120%, y: 120%)[\)] -
   m_0 . $ <eq:radius-tilted-gap>]
  Since $b c > 1$, (3.11) makes this quantity greater than $R \( 1 + d b a \)$ for all sufficiently large $a$,
    uniformly in $k$. Every prefix position has $Y$-value at most $Y \( X_T \)$, while
  $ \| Y \( x \) - Y \( y \) \| lt.eq \( 1 + d b a \) parallel x - y parallel_oo . $
  Thus the first $C_1 N$ opposite words are at distance greater than $R$ from every prefix position.
  At the end of these words the absolute $h$-coordinate is at most
  #[#set math.equation(numbering: n => "(3.13)")
   $ \( C + 2 \) N - m_0 - c C_1 N + C_0 < - d R $ <eq:radius-tail-gap>]
  for large $a$, by (3.3). All subsequent positions stay at or below this height,
    since this endpoint is a cut in direction $- sigma v$. The prefix has nonnegative $h$-heights and $\|
    h \( x \) - h \( y \) \| lt.eq d parallel x - y parallel_oo$,
    so the entire remaining tail is also separated from the prefix.
    The tilted inequality protects the initial opposite words;
    the height inequality protects everything after their last cut. No bound on $Y$ is required for this remaining tail.
  We now justify the probability calculation for this infinite continuation.
    Fix a finite marked prefix $gamma$ realizing $T$, and let $A_gamma$ be its set of positions,
    including its terminal arrival. The preceding deterministic bounds show that every path in the specified
    continuation event avoids the closed $R$-neighborhood of $A_gamma$.
    Consequently its quenched probability can be computed using the walk killed on first arrival in that
    neighborhood. By Lemma 2, this probability depends only on rows outside the neighborhood,
    even though the event specifies future cuts and an infinite nonbacktracking tail.
    Those rows are separated from the active departures of $gamma$.
  The forced connector has constant quenched weight and reveals no rows.
    The weight of $gamma$, the connector, and the continuation therefore factors as
  $ W \( gamma \) lambda^(m_0) P_0 { D_(- sigma v) \, med cal(J)_(C_1 N)
    upright(" for its regeneration sequence") } gt.eq 0.8 p_(*) lambda^(m_0) W \( gamma \) . $
  Here stationarity identifies the last factor with the raw probability from $z$,
    and the almost-sure existence of the indicated cuts under $D_(- sigma v)$ is understood.
    This use of separated rows is made after fixing $gamma$; no independence for a randomly chosen region is assumed.
  The connector decreases $h$, and the opposite continuation stays at or below its own initial height.
    Thus the final supremum of $h$ is exactly the running supremum at $T$ and belongs to $cal(W)$.
    Summing over the disjoint prefixes realizing $T$ and using (3.10) yields
  #[#set math.equation(numbering: n => "(3.14)")
   $ P_0 {sup_(n gt.eq 0) sigma v dot.op X_n in cal(W)} gt.eq rho \, wide rho :=
     frac(0.8 lambda^(m_0) p_(*)^2 delta, 2 d) > 0 . $ <eq:radius-final-supremum>]
  Finally, choose $i_0$ and then $a$ successively so that the resulting windows (3.9) are pairwise disjoint.
    This is possible by taking each new lower endpoint beyond the preceding upper endpoint before choosing its
    $a$. The sign $sigma$ may change from one window to the next,
    but for either fixed sign the corresponding final-supremum events are disjoint.
    Their probabilities, summed over all windows and both signs, are at most $2$,
    contradicting the uniform lower bound (3.14). This proves (3.1). ◻
]

=== 3.2 Opposite limiting rays <opposite-limiting-rays>

The radius moment controls the path between cuts, so the ordinary strong law for regeneration displacements also
  describes the full trajectory. The limiting-ray argument and the coordinate reduction follow [12] Section 4.1.

#thm([Lemma 3.3.])[
  (Limiting rays under coexistence).  #emph[Under the coexistence hypotheses of Proposition 7,
    there are deterministic unit vectors $r_(+) \, r_(-)$ such that, for $sigma in { + \, - }$,
$ \| X_n \| arrow.r oo \, wide frac(X_n, \| X_n \|) arrow.r r_sigma quad
  P_0 upright("-almost surely on ") A_(sigma v) . $

 They satisfy $r_sigma dot.op \( sigma v \) > 0$ and $r_(-) = - r_(+)$.]
] <lem:opposite-rays>

#proof[
  The terminal displacement of a word of law $nu_(sigma v)$ is integrable by Proposition 7.
    Write its mean as $b'_sigma in bb(R)^d$. Since
  $ b'_sigma dot.op \( sigma v \) = E_(nu_(sigma v)) L > 0 \, $
  this vector is nonzero. Under $hat(P)_(sigma v)$, the $k$th cut location divided by $k$ tends almost surely to
    $b'_sigma$. Integrability also gives $cal(R)_k \/ k arrow.r 0$ almost surely:
    for each $epsilon > 0$, the sum of $hat(P)_(sigma v) \( cal(R)_k > epsilon k \)$ is finite,
    and Borel–Cantelli applies. Between consecutive cuts the displacement from the earlier cut is bounded by the
    next radius. Since the number of completed words tends to infinity along the trajectory,
    it follows that $\| X_n \| arrow.r oo$ and
  $ frac(X_n, \| X_n \|) arrow.r r_sigma := frac(b'_sigma, \| b'_sigma \|) . $
  Under the raw law on $A_(sigma v)$, the first cut is finite and its translated suffix has law $hat(P)_(sigma v)$
    by Proposition 3; hence the same conclusion holds there.
  The signs of the projections on $v$ make $r_(+)$ and $r_(-)$ distinct. Suppose they are not opposite.
    Then $w = r_(+) + r_(-)$ is nonzero and
  $ w dot.op r_(+) = w dot.op r_(-) = 1 + r_(+) dot.op r_(-) > 0 . $
  Proposition 4 gives $P_0 \( A_v union A_(- v) \) = 1$, so the limiting rays imply $P_0 \( A_w \) = 1$.
    Rescale $w$ to have $ell^oo$ norm one and apply the cut construction in that direction.
  Under $hat(P)_w$, the limiting ray exists almost surely because this law is a conditioning of the raw law just
    considered. Its value is unchanged on deleting any finite number of regeneration words and translating the
    remaining path: such operations do not affect a limiting direction when positions tend to infinity in norm.
    Consequently it is a tail random variable of the iid words under $hat(P)_w$:
    for every $k$, its value can be computed from the words after $k$.
    The independent tail zero–one law makes it deterministic.
    Since $P_0 \( A_w \) = 1$, the raw walk has a first cut in direction $w$ almost surely,
    with translated suffix law $hat(P)_w$. Its limiting ray must therefore have that same deterministic value
    almost surely. This contradicts the two distinct rays $r_(+) \, r_(-)$,
    each occurring with positive raw probability. Hence $r_(-) = - r_(+)$. ◻
]

#thm([Proposition 3.4.])[
  (Reduction to a coordinate direction).  #emph[If $0 < P_0 \( A_v \) <
    1$ for some fixed nonzero real direction $v$, then there is a coordinate $i in { 1 \, dots.h \, d }$ such that
$ P_0 \( A_(e_i) \) > 0 wide upright("and") wide P_0 \( A_(- e_i) \) > 0 . $

]
] <prop:coordinate-reduction>

#proof[
  After normalizing $v$, Proposition 4 shows that both signs of escape in direction $v$ have positive probability.
    Choose a coordinate with nonzero projection on the opposite rays from Lemma 8.
    Along one ray this coordinate tends to $+ oo$, and along the other it tends to $- oo$.
    Each ray occurs with positive probability, giving the assertion. ◻
]

To prove Theorem 1, it therefore remains to exclude coexistence in a coordinate direction.
  After permuting coordinates, we may take that direction to be $e_1$.

== 4 Coordinate bridges and opposed paths <sec:bridges>

By Proposition 9, it remains to exclude coexistence in a coordinate direction.
  We therefore assume for the rest of the proof that both $A_(e_1)$ and $A_(- e_1)$ have positive probability.
  The two corresponding slab laws have finite mean width and finite mean radius, by Propositions 5 and 7.
  We will arrange independent sequences of these slabs in opposite chronological directions.
  The contradiction will come from two estimates on how often the resulting paths approach each other.
  The bridge and opposed-path constructions follow the corresponding iid strategy in [12] Sections 4.2–4.3.
  We give their marked versions here, including the separation arguments for the present environment law.

For $sigma in { + \, - }$, with $sigma e_1$ denoting $e_1$ or $- e_1$, write

$ hat(P)_sigma = hat(P)_(sigma e_1) \, wide D_sigma = D_(sigma e_1) \, wide p_sigma = p_(sigma e_1) > 0 \, wide
  nu_sigma = nu_(sigma e_1) . $

For a walk starting at the origin, let $T_j^sigma$ be the first hit of signed coordinate height $sigma x_1 = j$.
  For integers $n gt.eq 0$, set

#[#set math.equation(numbering: n => "(4.1)")
 $ u_n^sigma = P_0 \( T_n^sigma < T_(- 1)^sigma \) \, wide F_sigma \( n \) =
   nu_sigma \( L > n \) . $ <eq:hitting-width-tail>]

Thus $u_0^sigma = 1$, and $u_n^sigma$ decreases to a limit at least $p_sigma$:
  on $D_sigma$, the signed height reaches every positive integer almost surely.
  Constants below may depend on the fixed environment law, $d \, kappa \, R$, and the chosen script,
  but not on any of the scale parameters.

=== 4.1 Bridges ending at prescribed cuts <bridges-ending-at-prescribed-cuts>

Under $hat(P)_sigma$, the widths of successive slabs form a renewal process on the nonnegative integers.
  Let $macron(u)_n^sigma$ be its renewal mass, including the initial renewal at zero.
  Equivalently, it is the probability of a cut at signed height $n$, with the initial boundary counted as a cut.
  To identify the corresponding finite path law, for $H gt.eq
  M$ let $cal(D)_H^sigma$ be the following event for the raw marked walk:
  it first hits $H - M$ before $- 1$ in signed height, and from that hit it takes the prescribed $M$-step script.
  The script ends at its first hit of $H$.

If $macron(u)_H^sigma > 0$, let $cal(B)_H^sigma$ denote the law of the slab list through height $H$,
  conditional on a cut there. At $H = 0$ this law is concentrated on the empty list.
  We call $cal(B)_H^sigma$ the #emph[exact-cut bridge law].

#thm([Proposition 4.1.])[
  (Exact-cut bridges).  #emph[The renewal masses satisfy
#[#set math.equation(numbering: n => "(4.2)")
 $ macron(u)_0^sigma = 1 \, wide macron(u)_j^sigma = 0 quad \( 1 lt.eq j < M \) \, wide macron(u)_H^sigma =
   xi u_(H - M)^sigma quad \( H gt.eq M \) . $ <eq:bridge-renewal>]

 For a list of slabs $\( gamma_1 \, dots.h \, gamma_m \)$ with total width $H$, its mass under $cal(B)_H^sigma$ is
#[#set math.equation(numbering: n => "(4.3)")
 $ cal(B)_H^sigma \( gamma_1 \, dots.h \, gamma_m \) =
   frac(product_(i = 1)^m W \( gamma_i \), macron(u)_H^sigma) . $ <eq:bridge-law>]

 In particular, reversing the list order preserves this law; the steps within each word retain their original order.]
  #emph[For $H gt.eq M$, concatenating the list gives the raw marked path through its first hit of $H$,
    conditioned on $cal(D)_H^sigma$. Each such path has a unique parsing into slabs.
    Concatenating any prescribed slab words, or successive bridges of prescribed widths,
    gives a raw path weight equal to the product of the constituent raw weights.]
] <prop:exact-cut-bridges>

#proof[
  The raw probability of $cal(D)_H^sigma$ is $xi u_(H - M)^sigma$.
    Its terminal script begins at a record and ends at a candidate of height $H$.
    By the script gap and Lemma 2, imposing a suffix that stays at signed height at least $H$ multiplies this
    probability by $p_sigma$. Conversely, a cut at $H$ must be the end of the script beginning at the first hit of
    $H - M$: coordinate records are first hits, and each scripted step increases the signed height by one.
    Dividing by $p_sigma$ to condition on $D_sigma$ proves (4.2). No cut can have width less than $M$.
  The iid slab law from Proposition 3 now gives (4.3). Its numerator and the constraint on total width are
    unchanged when the list is reversed. Alternatively, for each fixed prefix through $H$ realizing
    $cal(D)_H^sigma$, the cut suffix supplies the same factor $p_sigma$.
    Conditional on the cut at $H$ under $hat(P)_sigma$, the prefix therefore has mass
    $W \( upright("prefix") \) \/ macron(u)_H^sigma$. This is exactly its raw conditional mass given $cal(D)_H^sigma$.
  The parsing can be recovered from the finite prefix alone.
    Select the candidate ends whose heights are not undercut later in the prefix, and split at those ends.
    A suffix staying at or above $H$ cannot change this selection, because $H$ is a strict record height.
    Between successive selected candidates, every earlier candidate is undercut,
    which is precisely the defining condition for a slab. A script cannot straddle a selected boundary:
    it would overlap the script ending there. Thus these are exactly the slab boundaries, and the parsing is unique.
  Finally, active departures of a slab ending at signed height $b$ lie strictly below $b - M$.
    All departures of the following slabs lie at or above $b$.
    These row sets are more than $R$ apart in infinity distance.
    Applying Lemma 2 successively, and using translation invariance,
    factors the weight of any prescribed concatenation. The same argument applies after grouping the slabs into
    bridges of prescribed widths. Each group boundary is reached on a first hit,
    so the grouping introduces no extra path multiplicity. ◻
]

The distinction between $u_n^sigma$ and $macron(u)_n^sigma$ will matter.
  The former are ordinary hitting probabilities and decrease with $n$;
  the latter have a gap before the first possible script end. The next estimate retains the contribution of that gap.

#thm([Lemma 4.2.])[
  (Width tails control hitting differences).  #emph[For either sign and all integers $n' gt.eq n gt.eq 0$,
#[#set math.equation(numbering: n => "(4.4)")
 $ u_n^sigma - u_(n')^sigma lt.eq C \( n' - n \) F_sigma \( n \) \, wide
   sum_(l gt.eq 0) 2^l F_sigma \( 2^l \) < oo . $ <eq:width-tail-comparison>]

]
] <lem:width-tail>

#proof[
  Fix a sign and suppress it. Partition according to the last renewal at or before $m$.
    The next width exceeds the distance from that renewal to $m$, so
  $ sum_(k = 0)^m F \( k \) macron(u)_(m - k) = 1 . $
  Subtracting the identity at $m + 1$, and using $macron(u)_0 = 1$, gives
  $ sum_(k = 0)^m F \( k \) \( macron(u)_(m - k) - macron(u)_(m + 1 - k) \) = F \( m + 1 \) . $
  By (4.2), every adjacent difference in this sum is nonnegative except the one with $m - k = M - 1$,
    which equals $- xi$. Take $m = n + M$. The exceptional index is $k = n + 1$, while the term $k =
    0$ equals $xi \( u_n - u_(n + 1) \)$. Dropping the other nonnegative terms yields
  $ xi \( u_n - u_(n + 1) \) lt.eq F \( n + M + 1 \) + xi F \( n + 1 \) lt.eq \( 1 + xi \) F \( n \) . $
  Summation from $n$ to $n' - 1$, using that $F$ decreases, proves the first bound.
    The second follows by grouping the ordinary tail sum $sum_(k gt.eq 0) F \( k \) =
    E_(nu_sigma) L < oo$ into dyadic intervals. ◻
]

=== 4.2 Opposed tapes and common blocks <opposed-tapes-and-common-blocks>

Take two independent sequences of iid relative slab words, with laws $nu_(+)$ and $nu_(-)$.
  We call these sequences the positive and negative #emph[tapes],
  and denote their joint law and expectation by $upright(bold(P))$ and $upright(bold(E))$.
  Write $pi x = \( x_2 \, dots.h \, x_d \)$ for the lateral coordinate of $x$. Place the words in space as follows.

- The first positive word has its terminal site at $0$. Each subsequent positive word has its terminal site at the
  starting site of the preceding word. Thus tape order moves downward,
  whereas a finite initial portion is traversed chronologically by taking its words in reverse list order,
  always following the steps of each word forward.
- The negative words are concatenated in their original order, starting at $- e_1$.
  This produces a downward path with law $hat(P)_(-)$ translated to $- e_1$.

Backward placement of regeneration pieces also appears in Berger’s backward-path construction [2] Sections 2–3.
  We measure #emph[depth] by $z = - x_1$. A word of width $L$, preceded by total width $s$ on its tape,
  has all its departure depths in

#[#set math.equation(numbering: n => "(4.5)")
 $ \( s \, s + L \] ∩ bb(Z) . $ <eq:departure-depths>]

For the positive tape this excludes the terminal arrival at depth $s$.
  For the negative tape the same interval results from the initial one-level offset:
  its start has depth $s + 1$, and its terminal arrival has depth $s + L + 1$.

A #emph[contact] is a positive departure site at infinity distance at most $R$ from some negative departure site.
  All departures count, regardless of their marks. The depth and, subsequently,
  the block index of a contact always refer to the positive departure. There is at least one contact:
  the last positive departure before its terminal site $0$ is $- e_1$, the initial site of the negative path.

To compare contacts at different depths, we group the two tapes using their common width renewals.
  Starting from width zero, end the first common block at the first positive integer that is a width sum on both
  tapes; continue with successive common width sums. The next proposition shows that this grouping gives iid
  finite pieces with the spatial integrability needed below.
  This is the intersection construction for independent renewal processes; see [1].

#thm([Proposition 4.3.])[
  (Common blocks).  #emph[The common blocks exist indefinitely, and their pairs of slab lists are iid.
    Their widths $K_i$ have a common law satisfying
$ M lt.eq K_i < oo quad upright("a.s.") \, wide mu := upright(bold(E)) K_i < oo . $

 The expected sum of the radii of all slabs on both sides of one common block is finite. In particular, if
#[#set math.equation(numbering: n => "(4.6)")
 $ W'_0 = 0 \, wide W'_i = sum_(j = 1)^i K_j \, $ <eq:common-width-sums>]

 then $W'_i \/ i arrow.r mu$ almost surely.]
] <prop:common-blocks>

#proof[
  Let $K$ be the first positive common width, allowing $K = oo$ for now.
    For each fixed pair of finite prefixes that realize $K = k$,
    the fact that $k$ is their first common width is decided by those prefixes.
    Their unused tails are independent tapes with the initial laws.
    Enumerating these prefix pairs therefore gives the renewal recursion
  $ c_0 = 1 \, wide c_n = sum_(k = 1)^n upright(bold(P)) \( K = k \) c_(n - k) quad \( n gt.eq 1 \) \, wide c_n =
    macron(u)_n^(+) macron(u)_n^(-) . $
  Set $f \( t \) = sum_(k gt.eq 1) upright(bold(P)) \( K = k \) t^k$ for $0 < t < 1$.
    Nonnegative power-series summation gives
  $ sum_(n gt.eq 0) c_n t^n = frac(1, 1 - f \( t \)) . $
  Equation (4.2) implies $c_n gt.eq xi^2 p_(+) p_(-) > 0$ for every $n gt.eq M$.
    Hence $sum c_n t^n gt.eq xi^2 p_(+) p_(-) t^M \/ \( 1 - t \)$,
    and consequently $\( 1 - f \( t \) \) \/ \( 1 - t \)$ stays bounded as $t arrow.t 1$.
    First this forces $f \( t \) arrow.r 1$, proving $K < oo$ almost surely. We can then write
  $ frac(1 - f \( t \), 1 - t) = upright(bold(E)) frac(1 - t^K, 1 - t) med arrow.t med upright(bold(E)) K \, $
  which proves finite mean. The same prefix factorization at each common renewal proves that the successive pairs
    of lists are iid. The lower bound $K gt.eq M$ follows from the minimum slab width.
    The strong law gives the assertion about $W'_i$.
  Let $N_(+)$ be the number of positive words in the first common block.
    Since every width is at least one, $N_(+) lt.eq K$. The event ${ N_(+) gt.eq
    i }$ is determined by the first $i - 1$ positive widths and the entire negative tape:
    none of those positive width sums may be a negative width sum.
    It is therefore independent of the $i$th positive word and its radius $cal(R)_i^(+)$. Tonelli’s theorem gives
  $ upright(bold(E)) sum_(i = 1)^(N_(+)) cal(R)_i^(+) = sum_(i gt.eq 1) upright(bold(P)) \( N_(+) gt.eq i \)
    E_(nu_(+)) cal(R) = upright(bold(E)) N_(+) thin E_(nu_(+)) cal(R) < oo . $
  The identical argument for the negative tape proves the claimed integrability, using Proposition 7. ◻
]

The notation $W'_i$ records cumulative width and is distinct from the word weight $W \( gamma \)$.
  By (4.5), departures in common block $i$ on either tape have depths in $\( W'_(i - 1) \, W'_i \]$.
  A contact in positive block $i$ can involve a negative departure only in block $i - 1$, $i$, or $i + 1$:
  skipping an entire common block would give a depth difference greater than $M > R$.

For each common block let $S'_i in bb(Z)^(d - 1)$ be the sum of the lateral displacements of all its positive and
  negative words, with both displacements measured in the words’ original chronological directions.
  The $S'_i$ are iid and

#[#set math.equation(numbering: n => "(4.7)")
 $ upright(bold(E)) \| S'_i \| < oo . $ <eq:lateral-moment>]

Indeed, their norms are bounded by the sums of radii controlled in Proposition 12.
  As we pass downward through a block, the negative anchor moves by its chronological displacement,
  whereas the positive anchor moves by the negative of its chronological displacement.
  The lateral gap, negative anchor minus positive anchor, therefore increases by $S'_i$.

We now have both a common block index for the two tapes and integrable iid increments for their lateral gap.
  The quantity on which the two remaining estimates will disagree is

#[#set math.equation(numbering: n => "(4.8)")
 $ m \( J \) =
   sum_(j = 1)^J upright(bold(P)) {
   upright("a contact occurs in a positive block of index in ") \( 2^j \, 2^(j + 1) \]
   #scale(x: 120%, y: 120%)[}] \, wide J gt.eq 1 . $ <eq:contact-count>]

Thus $m \( J \)$ is the expected number of these dyadic block-index intervals that contain a contact.
  Section 5 first gives an upper bound by comparing the dependent placement of the two tapes with independent bridges.

== 5 An entropy bound on contacts <sec:entropy>

Continue to assume coexistence in the coordinate direction,
  and use the two tapes and their common blocks from Section 4.
  We prove that the contact count in (4.8) satisfies $m \( J \) = O \( J \/ log J \)$.
  The argument compares a portion of the actual tapes with independent exact-cut bridges.
  Contacts are unlikely for the independent bridges, whereas the information needed to pass from those bridges to
  the actual tapes can be bounded by the growth of a lateral-displacement entropy.
  We adapt the comparison and contact argument of [12] Proposition 5.1 and Lemmas 5.2–5.3,
  using first proximity arrivals to separate departure rows; all estimates needed here are proved below.
  All constants in this section may depend on the fixed environment law and the fixed marking parameters,
  but not on the scales $n$ or $J$.

=== 5.1 Entropy of the lateral displacement <entropy-of-the-lateral-displacement>

For a countable random variable $V$ with masses $p \( v \)$, its Shannon entropy [14] is

$ cal(H) \( V \) = sum_v p \( v \) log frac(1, p \( v \)) . $

All logarithms in this section are natural. For probability laws $P \, Q'$ on the same countable set,
  their relative entropy [11] is

$ D \( P bar.v.double Q' \) = sum_v P \( v \) log frac(P \( v \), Q' \( v \)) . $

A zero mass contributes zero, and a positive $P$-mass at a zero $Q'$-mass gives infinite relative entropy.
  Conditional entropy averages the entropy of the conditional law. Conditional mutual information is defined by

$ I \( U \; V divides C \) = sum_c P \( C = c \) D #scale(x: 120%, y: 120%)[\(] P_(U \, V divides C = c) thin
  bar.v.double thin P_(U divides C = c) ⊗ P_(V divides C = c) #scale(x: 120%, y: 120%)[\)] . $

We use these definitions even when $U$ and $V$ are entire finite path lists, whose entropies need not be finite.

The log-sum inequality gives nonnegativity of relative entropy and its decrease under taking a function of the
  variables. Factoring joint masses gives the chain rules. In particular,
  comparison with a conditional product law, while keeping the marginal of $C$ fixed, gives

#[#set math.equation(numbering: n => "(5.1)")
 $ & D #scale(x: 120%, y: 120%)[\(] P_(C \, U \, V) thin bar.v.double thin P_C Q'_(U divides C) Q'_(V divides C)
   #scale(x: 120%, y: 120%)[\)]\
 & wide = I \( U \; V divides C \) + bb(E) thin D \( P_(U divides C) bar.v.double Q'_(U divides C) \) +
   bb(E) thin D \( P_(V divides C) bar.v.double Q'_(V divides C) \) . $ <eq:conditional-product-entropy>]

These relative-entropy identities hold on countable spaces:
  one may first use finite partitions and then take increasing limits, or factor the conditional masses directly,
  since the negative parts of relative-entropy sums are integrable.
  When the variable whose entropy is being subtracted has finite entropy,
  the same rules give the usual identity between an entropy difference and mutual information.
  Thus conditioning reduces entropy in all the finite-entropy expressions below.

Put $q = d - 1$, and recall the iid lateral increments $S'_i in bb(Z)^q$ of the common blocks. Define

$ h'_j = cal(H) \( S'_1 + dots.h.c + S'_j \) \, wide j gt.eq 1 . $

Equation (4.7) gives $upright(bold(E)) \| S'_1 \| < oo$. Consequently

#[#set math.equation(numbering: n => "(5.2)")
 $ h'_j lt.eq C + q log \( j + 1 \) . $ <eq:lateral-entropy-bound>]

Indeed, on $bb(Z)^q$ compare the displacement law with the probability weights

$ r_j \( x \) = c_j^(- 1) exp #scale(x: 120%, y: 120%)[\(] - \| x \| \/ \( j + 1 \)
  #scale(x: 120%, y: 120%)[\)] \, wide c_j = sum_(x in bb(Z)^q) exp #scale(x: 120%, y: 120%)[\(] - \|
  x \| \/ \( j + 1 \) #scale(x: 120%, y: 120%)[\)] lt.eq C \( j + 1 \)^q . $

The expected negative logarithm of $r_j$ is bounded by $log c_j + j upright(bold(E)) \| S'_1 \| \/ \( j + 1 \)$.
  Nonnegativity of relative entropy, or its finite-partition version followed by a limit,
  bounds the Shannon entropy by this finite quantity. This proves both finiteness and (5.2).
  The sequence $h'_j$ is nondecreasing: conditioning $S'_1 + dots.h.c +
  S'_(j + 1)$ on the independent last summand gives entropy $h'_j$,
  while removing that conditioning can only increase entropy.

=== 5.2 Random chunks and their reference law <random-chunks-and-their-reference-law>

Fix an integer $n gt.eq 1$. Independently of the tapes, choose independent integer counts with laws

#[#set math.equation(numbering: n => "(5.3)")
 $ I_0 \, I_1 \, I_3 & upright(" uniform on ") { n \, dots.h \, 2 n - 1 } \,\
I_2 & upright(" uniform on ") { 7 n \, dots.h \, 8 n - 1 } . $ <eq:chunk-counts>]

Discard a buffer of $I_0$ common blocks, and record its lateral gap

$ d_0 = sum_(j = 1)^(I_0) S'_j . $

Divide the next blocks into three consecutive chunks containing $I_1 \, I_2 \, I_3$ blocks.
  For chunk $i$, let $A_i \, B_i$ be its positive and negative slab lists, both in downward tape order,
  and let $H_i$ be their common width. Set

$ cal(A) = \( A_1 \, A_2 \, A_3 \) \, wide cal(B) = \( B_1 \, B_2 \, B_3 \) \, wide H = \( H_1 \, H_2 \, H_3 \) . $

The lists contain relative marked words; they do not include their spatial placements.
  The three chunks are independent of one another and of $\( I_0 \, d_0 \)$.
  To see this, condition on the four counts: the chunks and the buffer then use disjoint portions of an iid
  common-block sequence; averaging over the independent counts preserves this product structure.

Let $X_A \, X_B in bb(Z)^q$ be the sums of the lateral displacements of all words in $cal(A) \, cal(B)$,
  respectively, measured in the words’ original chronological directions. Define

$ Z = d_0 + X_A \, wide T = I_0 + I_1 + I_2 + I_3 . $

Write $P^(\( n \))$ for the resulting law of $\( H \, Z \, cal(A) \, cal(B) \)$.
  The widths, the buffer displacement, and the chunk displacements have finite first moments by Proposition 12.
  The lattice comparison just used therefore gives finite entropy for $H \, d_0 \, X_A \, X_B \, Z$, with $n$ fixed.

Each tuple $\( H \, Z \, cal(A) \, cal(B) \)$ determines a pair of placed paths as follows.
  Put $N = H_1 + H_2 + H_3$. Start the positive path at height zero and lateral position zero,
  and concatenate chunks $3 \, 2 \, 1$, reversing the order of each positive list.
  Every word is still traversed in its original chronological direction.
  Start the negative path at height $N - 1$ and lateral position $Z$, and concatenate chunks $1 \, 2 \,
  3$ in downward order. Let $E_(upright("mid"))$ be the event that a positive departure in chunk $2$ is within
  $ell^oo$-distance $R$ of a negative departure in chunk $2$.

Under $P^(\( n \))$, these are exactly the original three chunks after a common translation.
  At the top of the chunks their lateral gap was $d_0$, and the positive path gains displacement $X_A$ from bottom
  to top. The negative starting coordinate relative to the positive bottom is therefore $d_0 + X_A = Z$.
  The one-level offset in their heights is the offset in the tape construction.
  Figure 2 shows this placement and the distinction between tape order and chronological order.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((3.1, 6.923), [#text(size: 9pt)[Positive tape#linebreak()list order: $A_1,A_2,A_3$]])
  content((7, 6.923), [#text(size: 9pt)[Negative tape#linebreak()list order: $B_1,B_2,B_3$]])
  rect((2.2, 0.602), (4, 2.322), fill: rgb("#f0f0ff"), stroke: (paint: rgb("#000099"), thickness: 0.6pt, miter-limit: 10))
  rect((2.2, 2.322), (4, 4.214), fill: rgb("#d9d9ff"), stroke: (paint: rgb("#000099"), thickness: 0.6pt, miter-limit: 10))
  rect((2.2, 4.214), (4, 5.762), fill: rgb("#f0f0ff"), stroke: (paint: rgb("#000099"), thickness: 0.6pt, miter-limit: 10))
  rect((6.1, 0.3612), (7.9, 2.081), fill: rgb("#fff6ed"), stroke: (paint: rgb("#a65300"), thickness: 0.6pt, miter-limit: 10))
  rect((6.1, 2.081), (7.9, 3.973), fill: rgb("#ffe9d4"), stroke: (paint: rgb("#a65300"), thickness: 0.6pt, miter-limit: 10))
  rect((6.1, 3.973), (7.9, 5.521), fill: rgb("#fff6ed"), stroke: (paint: rgb("#a65300"), thickness: 0.6pt, miter-limit: 10))
  content((3.1, 1.462), [#text(size: 9pt)[$A_3$]])
  content((3.1, 3.268), [#text(size: 9pt)[$A_2$]])
  content((3.1, 4.988), [#text(size: 9pt)[$A_1$]])
  content((7, 1.221), [#text(size: 9pt)[$B_3$]])
  content((7, 3.027), [#text(size: 9pt)[$B_2$]])
  content((7, 4.747), [#text(size: 9pt)[$B_1$]])
  line((4.35, 0.903), (4.35, 5.435), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  line((5.75, 5.22), (5.75, 0.6622), stroke: (paint: rgb("#a65300"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a65300"))))
  content((4.35, 3.096), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[chronological order]]])], angle: 90deg)
  content((5.75, 2.924), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[chronological order]]])], angle: 90deg)
  line((1.72, 0.602), (2.2, 0.602), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((1.64, 0.602), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  line((1.72, 2.322), (2.2, 2.322), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((1.64, 2.322), [#text(size: 9pt)[$H_3$]], anchor: "east", padding: 0.1176cm)
  line((1.72, 4.214), (2.2, 4.214), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((1.64, 4.214), [#text(size: 9pt)[$N-H_1$]], anchor: "east", padding: 0.1176cm)
  line((1.72, 5.762), (2.2, 5.762), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((1.64, 5.762), [#text(size: 9pt)[$N$]], anchor: "east", padding: 0.1176cm)
  line((7.9, 0.3612), (8.38, 0.3612), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((8.46, 0.3612), [#text(size: 9pt)[$-1$]], anchor: "west", padding: 0.1176cm)
  line((7.9, 2.081), (8.38, 2.081), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((8.46, 2.081), [#text(size: 9pt)[$H_3-1$]], anchor: "west", padding: 0.1176cm)
  line((7.9, 3.973), (8.38, 3.973), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((8.46, 3.973), [#text(size: 9pt)[$N-H_1-1$]], anchor: "west", padding: 0.1176cm)
  line((7.9, 5.521), (8.38, 5.521), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((8.46, 5.521), [#text(size: 9pt)[$N-1$]], anchor: "west", padding: 0.1176cm)
  circle((3.1, 0.602), radius: 0.05997, fill: rgb("#000099"), stroke: none)
  circle((3.1, 5.762), radius: 0.05997, fill: rgb("#000099"), stroke: none)
  circle((7, 5.521), radius: 0.05997, fill: rgb("#a65300"), stroke: none)
  content((3.1, 0.1892), [#text(size: 8pt)[positive start#linebreak()$(0,0)$]], anchor: "north", padding: 0.1176cm)
  content((7, 0.0172), [#text(size: 8pt)[negative terminal]], anchor: "north", padding: 0.1176cm)
  content((7, 5.564), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[start $(N-1,Z)$]]])], anchor: "south")
  content((3.1, 5.805), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[end $(N,X_A)$]]])], anchor: "south")
})],
  caption: [Figure 2: The three chunks in the opposed arrangement, after translation to put the positive starting site at $\( 0 \, 0 \)$, with $N = H_1 + H_2 + H_3$. Both tape lists are indexed from top to bottom. The positive path follows chunks $3 \, 2 \, 1$, reversing each slab list while retaining the forward steps of every word; the negative path follows chunks $1 \, 2 \, 3$ in their original order. The one-level offset makes the departure heights in corresponding chunks agree. Under the actual law $P^(\( n \))$, the lateral gap at the top is $Z - X_A = d_0$. The shaded middle chunks define $E_(upright("mid"))$. Rectangles show height ranges, not path traces; widths, heights, and lateral placements are schematic. ],
) <fig:opposed-chunks>

Define a second law $Q^(\( n \))$ on these same variables.
  Keep the $P^(\( n \))$-marginal of $\( H \, Z \)$; conditional on $\( H \, Z \)$,
  sample the six lists independently, with

$ A_i tilde.op cal(B)_(H_i)^(+) \, wide B_i tilde.op cal(B)_(H_i)^(-) \, wide i = 1 \, 2 \, 3 . $

These exact-cut bridge laws are defined by (4.3). Since $H_i gt.eq M n$,
  their normalizing constants have the positive lower bounds supplied by (4.2).
  Thus the reference law keeps the three widths and the negative starting position,
  and independently resamples the six relative lists. The same placement rule defines $E_(upright("mid"))$ under
  both laws.

#thm([Proposition 5.1.])[
  (Entropy comparison).  #emph[For every integer $n gt.eq 1$, the actual chunk law and the reference law above satisfy
#[#set math.equation(numbering: n => "(5.4)")
 $ D \( P^(\( n \)) bar.v.double Q^(\( n \)) \) lt.eq C + h'_(14 n) - h'_n . $ <eq:entropy-comparison>]

]
] <prop:entropy-comparison>

#proof[
  All entropies and expectations in this proof refer to the original tape-and-count experiment.
    First omit $Z$, and let $D_0$ denote the relative entropy between the resulting marginals of $P^(\( n \))$ and
    $Q^(\( n \))$. A pair of lists of common width $h$ determines the number of its common renewals,
    counting the terminal width $h$ and excluding zero, and hence determines its parsing into common blocks.
    If that number is in the count window for chunk $i$, the actual unconditioned probability of the list pair is
  $ 1 / n product_(gamma in A_i) W \( gamma \) product_(gamma in B_i) W \( gamma \) . $
  If the number is outside the window, the probability is zero.
    This follows from the common-block construction and the slab weights:
    the specified pair of lists determines exactly one allowed count.
    In contrast, the product of the two bridge laws at width $h$ has the same product of weights divided by
    $macron(u)_h^(+) macron(u)_h^(-)$. Thus, conditional on $H_i = h$,
    the density relative to the independent bridges is, on the actual support, exactly
  #[#set math.equation(numbering: n => "(5.5)")
   $ frac(macron(u)_h^(+) macron(u)_h^(-), n P^(\( n \)) \( H_i = h \)) . $ <eq:chunk-pair-density>]
  Independence of the three actual chunks now gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ I \( cal(A) \; cal(B) divides H \) & lt.eq D_0\
 & = sum_(i = 1)^3 (cal(H) \( H_i \) - log n + bb(E) log \( macron(u)_(H_i)^(+) macron(u)_(H_i)^(-) \)) lt.eq
   sum_(i = 1)^3 \( cal(H) \( H_i \) - log n \) lt.eq C . $ <eq:chunk-entropy-cost>]
  The information inequality follows from (5.1). For the last bound, use $bb(E) H_i =
    upright(bold(E)) K_1 thin bb(E) I_i = O \( n \)$ and compare the law of $H_i$ with weights proportional to
    $e^(- h \/ n)$ on the nonnegative integers. The normalizer is $O \( n \)$, so $cal(H) \( H_i \) lt.eq log n + C$.
  Reintroducing $Z$ costs its conditional information with the lists:
  #[#set math.equation(numbering: n => "(5.7)")
   $ D \( P^(\( n \)) bar.v.double Q^(\( n \)) \) & = D_0 + I \( Z \; cal(A) \, cal(B) divides H \)\
 & = D_0 + cal(H) \( Z divides H \) - cal(H) \( d_0 \) . $ <eq:buffer-information>]
  Here the lists determine $X_A$, and the buffer is independent of the lists and widths;
    conditional on those data, $Z$ is a translate of $d_0$. Likewise, given $\( cal(A) \, H \)$,
    the variable $Z$ is conditionally independent of $cal(B)$. Conditional data processing and (5.6) imply
  $ I \( Z \; cal(B) divides H \) lt.eq I \( cal(A) \; cal(B) divides H \) lt.eq D_0 . $
  Every variable whose entropy is evaluated in the next calculation has finite entropy; the conditioning lists need not:
  #[#set math.equation(numbering: n => "(5.8)")
   $ cal(H) \( T \, Z + X_B \) & gt.eq cal(H) \( T \, Z + X_B divides cal(B) \, H \) =
     cal(H) \( T \, Z divides cal(B) \, H \)\
 & gt.eq cal(H) \( Z divides H \) - D_0 + cal(H) \( T divides Z \, cal(A) \, cal(B) \, H \)\
 & = cal(H) \( Z divides H \) - D_0 + cal(H) \( I_0 divides d_0 \) . $ <eq:buffer-entropy-lower>]
  For the final identity, each pair of chunk lists determines its common block count, hence $I_1 \, I_2 \, I_3$.
    The lists and $Z$ also determine $d_0 = Z - X_A$. Independence from the buffer then identifies the remaining
    conditional entropy of $T$ with $cal(H) \( I_0 divides d_0 \)$.
  Subtract $cal(H) \( I_0 \, d_0 \) = cal(H) \( d_0 \) + cal(H) \( I_0 divides d_0 \)$ from (5.8) and use (5.7).
    The result is
  #[#set math.equation(numbering: n => "(5.9)")
   $ D \( P^(\( n \)) bar.v.double Q^(\( n \)) \) lt.eq 2 D_0 + cal(H) \( T \, Z + X_B \) -
     cal(H) \( I_0 \, d_0 \) . $ <eq:two-entropy-costs>]
  Now $Z + X_B$ is the sum of the lateral increments through the first $T$ common blocks.
    Both $T$ and $I_0$ are independent of the underlying block sequence. It follows that
  $ cal(H) \( T \, Z + X_B \) - cal(H) \( I_0 \, d_0 \) & = cal(H) \( T \) + bb(E) h'_T - log n - bb(E) h'_(I_0)\
 & lt.eq C + h'_(14 n) - h'_n . $
  Indeed, $T < 14 n$, $I_0 gt.eq n$, and $T$ has at most $4 n$ possible values.
    Monotonicity of $h'_j$ proves the displayed bound. Finally,
    the term $2 D_0$ is bounded uniformly in $n$ by (5.6), proving (5.4). ◻
]

=== 5.3 Contacts under the reference law <contacts-under-the-reference-law>

The entropy comparison will bound the contact count once we show that $E_(upright("mid"))$ contains the relevant
  actual contacts and is unlikely under the reference law. For every realization of the counts,
  a contact in a positive common block with index in $\( 4 n \, 8 n \]$ implies $E_(upright("mid"))$.
  In fact, chunk $2$ starts after at most $4 n - 2$ common blocks and ends at or beyond block $9 n$.
  The negative departure realizing a contact is in the same or a neighboring block,
  by the common-block geometry in Section 4; all those blocks remain inside chunk $2$. Consequently

#[#set math.equation(numbering: n => "(5.10)")
 $ upright(bold(P)) { upright("a contact in a positive block indexed in ") \( 4 n \, 8 n \] } lt.eq
   P^(\( n \)) \( E_(upright("mid")) \) . $ <eq:middle-contact-inclusion>]

#thm([Proposition 5.2.])[
  (Reference contact bound).  #emph[For every integer $n gt.eq 1$,
#[#set math.equation(numbering: n => "(5.11)")
 $ Q^(\( n \)) \( E_(upright("mid")) \) lt.eq delta_n \, wide delta_n = min { 1 \,
   C n \( F_(+) \( n \) + F_(-) \( n \) \) } . $ <eq:reference-contact>]

]
] <prop:reference-contact>

#proof[
  Fix $\( H \, Z \)$ in the support of its retained marginal.
    Conditional on these data, all six reference lists are independent.
    Reversing the positive list order preserves its bridge law by (4.3).
    Retain the positive path formed by chunks $3$ and $2$, and call it $alpha$.
    It runs from the origin through its first hit of height $N - H_1$.
    For the negative path formed by chunks $1$ and $2$, retain only the prefix through its first arrival within
    distance $R$ of $"Dep" \( alpha \)$; call the retained prefix $beta$ and its terminal site $y'$.
    On $E_(upright("mid"))$ such an arrival exists no later than a negative departure in chunk $2$,
    and hence before the two negative chunks terminate. This first proximity need not itself join the two middle
    chunks; the outer chunk widths will nevertheless put both visits at progress at least $n$.
  The geometry puts this encounter away from both starting sides.
    The two negative chunks stay at or below $N - 1$ and end at their first hit of $H_3 - 1$. Therefore
  $ H_3 lt.eq y'_1 lt.eq N - 1 . $
  Choose a departure $y$ of $alpha$ within distance $R$ of $y'$. Since $alpha$ ends on its first hit of $N - H_1$,
  #[#set math.equation(numbering: n => "(5.12)")
   $ H_3 - R lt.eq y_1 lt.eq N - H_1 - 1 \, wide N - 1 - y'_1 gt.eq H_1 - R . $ <eq:reference-contact-heights>]
  The inequalities $H_1 \, H_3 gt.eq M n$ and $M > R + 1$ show that both visits occur at or after the respective
    path has reached signed progress $n$ from its start. Up to these visits neither path has hit either absolute
    height $- 1$ or $N$.
  We next express the probability of these prefixes using two raw walks in one environment.
    The unused positive chunk $1$ and negative chunk $3$ integrate to one. The four remaining bridge normalizations,
  $ macron(u)_(H_3)^(+) macron(u)_(H_2)^(+) macron(u)_(H_1)^(-) macron(u)_(H_2)^(-) \, $
  have a fixed positive lower bound by (4.2). Within each sign,
    concatenating the two bridges gives the product of their raw weights,
    by the separation of active departures established in Section 4.
  For fixed $alpha$ and a retained negative prefix $beta$, sum over all allowed negative completions to the
    terminal height $H_3 - 1$. Their total raw weight is at most $W \( beta \)$:
    full words to that height end on its first hit, so the corresponding continuation events are disjoint.
    Nor is there multiplicity from the lists. The intermediate chunk boundary is a first hit of its prescribed
    height, and the bridge parsing into slabs is unique. The same uniqueness holds for the positive concatenation.
    Thus, after dropping any further completion restrictions,
    the conditional contact probability is at most a fixed constant times a sum of products
  #[#set math.equation(numbering: n => "(5.13)")
   $ W \( alpha \) W \( beta \) = bb(E)_Q #scale(x: 120%, y: 120%)[\[] p_omega \( alpha \) p_omega \( beta \)
     #scale(x: 120%, y: 120%)[\]] . $ <eq:reference-prefix-transfer>]
  The equality holds for each retained pair: every departure of $beta$ precedes its first proximity arrival and is
    therefore at distance strictly greater than $R$ from every departure of $alpha$.
    The terminal arrival $y'$ uses no departure row. Lemma 2 then applies,
    with repeated departures within either path retained in their respective weights.
  The right side of (5.13) is the probability of the specified prefixes for two raw marked walks,
    started at $0$ and $\( N - 1 \, Z \)$, independently conditional on a shared environment of law $Q$.
    Summing these probabilities introduces no overcounting. A full positive trajectory has at most one prefix
    through its first hit of the fixed height $N - H_1$; that prefix determines $"Dep" \( alpha \)$,
    and a full negative trajectory has at most one prefix through its first arrival within distance $R$ of that set.
  Only in this shared-environment experiment do we classify an encounter by quenched exit probabilities.
    For $0 lt.eq x_1 lt.eq N - 1$, define
  $ q_x^omega = P_(x \, omega) \( T_(- 1) < T_N \) \, $
  where $T_a$ here is the first hit of absolute first-coordinate height $a$.
    Slab exit is almost surely finite, so $1 - q_x^omega = P_(x \, omega) \( T_N < T_(- 1) \)$.
    At the sites in (5.12), if $q_y^omega gt.eq 1 \/ 2$, the positive walk has visited,
    after reaching progress $n$, a site with probability at least $1 \/
    2$ of exiting through its starting side’s barrier $- 1$. If $q_y^omega < 1 \/ 2$,
    join $y'$ to $y$ by a coordinate path of at most $d R$ steps inside the slab. Uniform ellipticity gives
  $ 1 - q_(y')^omega gt.eq kappa^(d R) \( 1 - q_y^omega \) gt.eq kappa^(d R) \/ 2 . $
  In that case the negative walk has visited, after reaching its signed progress $n$,
    a site with probability at least $kappa^(d R) \/ 2$ of exiting through its own starting side’s barrier $N$.
  For either sign $sigma$, consider the raw marginal event that,
    after its first hit of signed progress $n$ and before slab exit,
    the walk visits a site whose quenched probability of exit through the starting side’s barrier is at least $c =
    kappa^(d R) \/ 2$. With the environment fixed, stop at the first such visit.
    The probability of the indicated exit after this visit is at least $c$.
    Integrating the resulting inequality over environments bounds the visit probability by
  #[#set math.equation(numbering: n => "(5.14)")
   $ c^(- 1) \( u_n^sigma - u_N^sigma \) . $ <eq:reference-visit-bound>]
  Indeed, from each of the two starting sites, the barriers have signed relative heights $- 1 \, N$.
    The difference $u_n^sigma - u_N^sigma$ is exactly the raw probability of hitting signed height $n$ and then
    exiting at $- 1$ before $N$: a path reaching $N$ must first reach $n$,
    and exit from the finite slab is almost surely finite. Stationarity identifies the negative walk’s translated
    raw probabilities with $u_n^(-) \, u_N^(-)$.
  Every retained pair belongs to at least one of these two raw visit events. Combining (5.13)–(5.14) therefore gives
  $ Q^(\( n \)) \( E_(upright("mid")) divides H \, Z \) lt.eq
    C sum_(sigma in { + \, - }) \( u_n^sigma - u_N^sigma \) lt.eq C N \( F_(+) \( n \) + F_(-) \( n \) \) \, $
  where the last inequality is Lemma 11. This estimate uses the raw marginal visit probabilities after the prefix
    transfer; it does not condition an exit probability on the contact event. Finally, the retained marginal has
  $ bb(E) N = upright(bold(E)) K_1 thin bb(E) \( I_1 + I_2 + I_3 \) = O \( n \) . $
  Averaging over $\( H \, Z \)$ and also using the trivial probability bound one proves (5.11). ◻
]

=== 5.4 Summing over scales <summing-over-scales>

#thm([Proposition 5.3.])[
  (Contact upper bound).  #emph[For the two independent opposed tapes under coordinate coexistence,
    the contact count defined in (4.8) satisfies
#[#set math.equation(numbering: n => "(5.15)")
 $ m \( J \) = O #h(-0.16667em) (frac(J, log J)) wide \( J arrow.r oo \) . $ <eq:contact-upper>]

]
] <prop:contact-upper>

#proof[
  Apply data processing in Proposition 13 to the indicator of $E_(upright("mid"))$.
    If $p = P^(\( n \)) \( E_(upright("mid")) \)$ and $q_n = Q^(\( n \)) \( E_(upright("mid")) \)$,
    binary relative entropy satisfies
  $ D \( "Bern" \( p \) bar.v.double "Bern" \( q_n \) \) gt.eq p log \( 1 \/ q_n \) - log 2 . $
  Together with Proposition 14, this yields, when $delta_n > 0$,
  #[#set math.equation(numbering: n => "(5.16)")
   $ P^(\( n \)) \( E_(upright("mid")) \) log \( 1 \/ delta_n \) lt.eq C + h'_(14 n) -
     h'_n . $ <eq:contact-entropy-price>]
  If $delta_n = 0$, then $q_n = 0$, and the finite relative entropy in (5.4) forces
    $P^(\( n \)) \( E_(upright("mid")) \) = 0$. The same observation handles $q_n = 0$ when $delta_n > 0$.
  For $l gt.eq 2$, take $n = 2^(l - 2)$. The width-tail summability in Lemma 11 implies
  $ sum_(l gt.eq 2) delta_(2^(l - 2)) < oo . $
  Among $2 lt.eq l lt.eq J$, at most $O \( sqrt(J) \)$ indices can have $delta_(2^(l - 2)) > J^(- 1 \/ 2)$.
    At every other index with positive $delta_(2^(l - 2))$, the logarithm in (5.16) is at least $1 / 2 log J$.
    The corresponding entropy differences have a telescoping bound:
  $ sum_(l = 2)^J #scale(x: 120%, y: 120%)[\(] h'_(14 dot.op 2^(l - 2)) -
    h'_(2^(l - 2)) #scale(x: 120%, y: 120%)[\)] & lt.eq sum_(l = 2)^J #scale(x: 120%, y: 120%)[\(]
    h'_(2^(l + 2)) - h'_(2^(l - 2)) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq 4 h'_(2^(J + 2)) = O \( J \) \, $
  by monotonicity and (5.2). Since $\( 4 n \, 8 n \] = \( 2^l \, 2^(l + 1) \]$, use (5.10),
    sum (5.16) over the remaining indices, and bound each exceptional probability by one. Adding the initial scale gives
  $ m \( J \) lt.eq 1 + O \( sqrt(J) \) + O \( J \/ log J \) = O \( J \/ log J \) \, $
  as claimed. ◻
]

== 6 First contacts near an aligned endpoint <sec:posteriors>

Proposition 15 bounds the number of scales at which the opposed tapes meet.
  To obtain a competing lower bound, we consider a positive bridge and a relative negative path sampled
  independently of it. We place the negative path one level below the bridge’s endpoint.
  The bridge’s final scripted departure is exactly the negative starting site,
  so there is always a contact one level below the endpoint.
  We shall show that, after a prescribed script at a lower height,
  their first contact is unlikely to be delayed until much higher up the bridge.

The lateral starting point of the negative path is determined by the positive endpoint.
  We keep this dependence in the conditional probabilities of the possible endpoints,
  and estimate their running maxima together. The martingale and endpoint-posterior arguments below adapt [12]
  Lemma 6.1 and Proposition 6.2. The following lemma gives the needed bound.

#thm([Lemma 6.1.])[
  (Maxima of a finite martingale family).  #emph[Let $m gt.eq 1$, and let $\( w_i \( e \) \)_(i gt.eq 0)$,
    $1 lt.eq e lt.eq m$, be nonnegative martingales for the same filtration $\( cal(F)_i \)_(i gt.eq 0)$,
    with $sum_(e = 1)^m w_i \( e \) lt.eq 1$ almost surely for every $i$. Set
$ A_i \( e \) = max_(0 lt.eq j lt.eq i) w_j \( e \) \, wide A_i = sum_(e = 1)^m A_i \( e \) \, wide A_oo =
  lim_(i arrow.r oo) A_i \, wide B = log \( m + 1 \) . $

 Write also $A_oo \( e \) = lim_i A_i \( e \)$. There are absolute constants $c \, C > 0$ such that
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E) exp \( c A_oo \/ B \) lt.eq C . $ <eq:posterior-exponential>]

 Moreover, on any joint probability space with this martingale marginal, every event $V$ of probability $p$ satisfies
#[#set math.equation(numbering: n => "(6.2)")
 $ bb(E) \[ A_oo upright(bold(1))_V \] lt.eq C B p log \( upright(e) \/ p \) \, $ <eq:event-weighted-max>]

 where the right-hand side is defined to be zero at $p = 0$.
   The event $V$ need not belong to the martingale filtration.]
] <lem:posterior-max>

The logarithmic first-moment bound underlying this lemma follows by coordinatewise integration of the scalar
  maximal inequality; the same posterior calculation appears in [9] Section 1.1.
  The passage from bounded conditional future increases to exponential integrability is related to the energy
  inequalities for increasing processes in [10] Theorem 4 and its corollary. We give a direct threshold proof.

#proof[
  Fix a time $i$. Conditional on the filtration at that time,
    the nonnegative-martingale maximal inequality [17] Chapter V, first section, §2,
    Theorem 1 bounds the probability that coordinate $e$ subsequently exceeds $u > 0$ by $w_i \( e \) \/ u$.
    For completeness, on a finite horizon this follows by stopping at the first crossing,
    using the martingale identity and nonnegativity on the complement of the crossing event;
    increasing the horizon gives the infinite-horizon bound. Since each coordinate is at most one,
    integration over $u in \[ A_i \( e \) \, 1 \]$ gives
  $ bb(E) \[ A_oo \( e \) - A_i \( e \) divides cal(F)_i \] lt.eq w_i \( e \) log frac(1, A_i \( e \)) lt.eq
    w_i \( e \) log frac(1, w_i \( e \)) . $
  If $w_i \( e \) = 0$, its future values vanish almost surely conditionally, and the expected increase is zero.
    Add the missing mass $1 - sum_e w_i \( e \)$ to form a probability vector.
    Its entropy is at most $log \( m + 1 \)$, so
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(E) \[ A_oo - A_i divides cal(F)_i \] lt.eq B . $ <eq:maximum-remaining-increase>]
  We also have $A_0 lt.eq 1$ and $A_i - A_(i - 1) lt.eq sum_e w_i \( e \) lt.eq 1$.
    Consider the thresholds $b_j = 1 + j \( 2 B + 1 \)$, $j gt.eq 1$.
    The probability of strictly crossing the first threshold is at most $1 \/ 2$,
    by (6.3) and Markov’s inequality. At the first crossing of any threshold, the overshoot is at most one.
    Crossing the next threshold therefore requires a further increase greater than $2 B$,
    whose conditional probability is at most $1 \/ 2$. This argument at a crossing time follows by splitting over
    its possible finite values. It gives a geometric tail for $A_oo$ at the thresholds $b_j$, and hence (6.1).
  For $p > 0$, conditional Jensen gives
  $ exp #h(-0.16667em) (c / B bb(E) \[ A_oo divides V \]) lt.eq bb(E) \[ exp \( c A_oo \/ B \) divides V \] lt.eq
    C \/ p . $
  Taking logarithms and multiplying by $p$ proves (6.2), after changing the absolute constant. ◻
]

We now formulate the first-contact estimate. For a path in absolute coordinates,
  write $T_j$ for its first hit of the hyperplane ${ x : x_1 = j }$, specifying the path when needed.
  Recall that $cal(B)_N^(+)$ is the positive exact-cut bridge law:
  its concatenated path has the raw marked law through $T_N$, conditioned on $cal(D)_N^(+)$.
  The event $cal(D)_k^(+)$ prescribes the $M$-step script immediately after the first hit of $k - M$,
  reached before height $- 1$.

#thm([Proposition 6.2.])[
  (First contact above a scripted prefix).  #emph[Assume $p_(+) p_(-) > 0$, and let $M lt.eq
    k < r < N$ be integers with $r - k gt.eq R$. Start a positive bridge $Y$ with law $cal(B)_N^(+)$ at the
    origin, and put $E_(upright("lat")) = pi Y_(T_N)$. Independently of $Y$,
    sample a relative marked path with law $hat(P)_(-)$, and translate it to start at
    $\( N - 1 \, E_(upright("lat")) \)$; denote the resulting path by $beta$. Define
$ tau = inf { i : T_k \( Y \) lt.eq i < T_N \( Y \) \, quad parallel Y_i - beta_j parallel_oo lt.eq
  R upright(" for some ") j gt.eq 0 } \, $

 with $inf diameter = oo$. Let
#[#set math.equation(numbering: n => "(6.4)")
 $ cal(C)_(k \, r \, N) =
   mat(delim: "{", cal(D)_k^(+) \( Y \) \, quad tau < T_N \( Y \) \, quad \( Y_tau \)_1 gt.eq r \,; min_(T_k \(
   Y \) lt.eq i lt.eq tau) \( Y_i \)_1 gt.eq k \, quad \| E_(upright("lat")) \| lt.eq N^2) . $ <eq:first-contact-event>]

 Here $cal(D)_k^(+) \( Y \)$ is a condition on the prefix through the first hit of $k$.
   There is a constant $C$, independent of $k \, r \, N$, such that, with $Delta = u_(r - k)^(+) - u_(N - k)^(+)$,
#[#set math.equation(numbering: n => "(6.5)")
 $ P \( cal(C)_(k \, r \, N) \) lt.eq C log \( 2 N \) thin Delta log^2 \( upright(e) \/ Delta \) .
   $ <eq:first-contact-bound>]

 The right-hand side is defined to be zero when $Delta = 0$.]
] <prop:first-contact>

The small parameter in this estimate is controlled by the width tail: Lemma 11 gives

$ Delta lt.eq C \( N - r \) F_(+) \( r - k \) . $

Thus the remaining height $N - r$ is compared with the width tail at the progress $r -
  k$ already made above the scripted prefix.

#proof[
  We first express the event using finite positive prefixes and the full negative path.
    This permits a comparison in a shared environment without treating $tau$ as a stopping time.
    The endpoint conditional probabilities remain attached to the positive prefixes;
    Lemma 16 will control their contribution.
  #emph[Prefix probabilities.] Let
  $ cal(E)_N = { e in bb(Z)^(d - 1) : \| e \| lt.eq N^2 } . $
  Enumerate the marked prefixes $a_0$ that realize $cal(D)_k^(+)$, ending at their first hit $z$ of height $k$.
    For each such $a_0$, enumerate all finite marked words $a$ from $z$ whose vertices have heights in
    $\[ k \, N - 1 \]$ and whose terminal site $y = y \( a \)$ has height at least $r$.
    For a marked prefix $c$ and $e in cal(E)_N$, define
  #[#set math.equation(numbering: n => "(6.6)")
   $ w \( c \; e \) = P_0 #scale(x: 120%, y: 120%)[\(] cal(D)_N^(+) \, med pi X_(T_N) =
     e divides X upright(" with marks begins with ") c #scale(x: 120%, y: 120%)[\)] . $ <eq:endpoint-prefix-posterior>]
  This is a deterministic function of $c$ and $e$. All active departures in $a_0$ lie strictly below height $k -
    M$, whereas all departures in $a$ have height at least $k$. Lemma 2 therefore gives
  $ W \( a_0 a \) = W \( a_0 \) W \( a \) . $
  Consequently the raw probability of the prefix $a_0 a$ and the endpoint event in (6.6) is $W \( a_0 \) W \( a \)
    w \( a_0 a \; e \)$.
  For a raw negative path starting at $\( N - 1 \, e \)$, let $D^(-)$ denote the event that all its heights are at
    most $N - 1$. Let $cal(V) \( a \)$ be the event that this path satisfies $D^(-)$,
    avoids the closed $R$-neighborhood of $"Dep" \( a \)$ for all time,
    and visits the closed $R$-neighborhood of $y \( a \)$. Thus $cal(V) \( a \)$ asserts that the first contact
    along the word $a$ occurs at its terminal site. If that site was an earlier departure of $a$,
    the event is empty. The raw bridge interpretation and the conditioning by $D^(-)$ give the exact identity
  #[#set math.equation(numbering: n => "(6.7)")
   $ P \( cal(C)_(k \, r \, N) \) = frac(1, macron(u)_N^(+) p_(-)) sum_(a_0) W \( a_0 \) sum_(e in cal(E)_N) sum_a
     W \( a \) w \( a_0 a \; e \) P_(\( N - 1 \, e \)) \( cal(V) \( a \) \) . $ <eq:first-contact-prefix-sum>]
  Indeed, a pair of paths in $cal(C)_(k \, r \, N)$ determines a unique $a_0$ and a unique prefix $a$ ending at
    its first contact after $T_k$. Conversely every term represents exactly these conditions.
    All word families are countable, and every summand is nonnegative.
  #emph[A shared environment for the unconditioned prefixes.] Fix $a_0$ for the moment. For a word $a$, put
  $ B \( a \) = { x in bb(Z)^d : "dist"_oo \( x \, "Dep" \( a \) \) lt.eq R } . $
  The quenched probability of $cal(V) \( a \)$ can be computed from the negative walk killed on arrival in
    $B \( a \)$. It requires eternal survival, the upper-height restriction, and a visit near $y \( a \)$.
    It therefore uses only rows in $B \( a \)^c$, including when these requirements concern the entire infinite
    path. Those rows are more than distance $R$ from every active departure of $a$. Finite-range independence gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ W \( a \) P_(\( N - 1 \, e \)) \( cal(V) \( a \) \) = E_Q
     [p_omega \( a \) P_(\( N - 1 \, e \) \, omega) \( cal(V) \( a \) \)] . $ <eq:first-contact-transfer>]
  The right-hand side has the following interpretation. Sample a fresh environment with law $Q$.
    In it, run a raw comparison path $tilde(X)$ from $z$ and a raw negative path $tilde(beta)^(thin e)$ from
    $\( N - 1 \, e \)$, independently conditional on the environment.
    Denote its law and expectation by $P_e^(upright(c)) \, E_e^(upright(c))$, and write $P^(upright(c)) \,
    E^(upright(c))$ for the common $\( omega \, tilde(X) \)$ marginal, which does not depend on $e$.
    For fixed $a_0 \, e$, the inner sum in (6.7) becomes
  #[#set math.equation(numbering: n => "(6.9)")
   $ E_e^(upright(c))
     [sum_a w \( a_0 a \; e \) upright(bold(1))_({ tilde(X) upright(" begins with ") a }) upright(bold(1))_({
     tilde(beta)^(thin e) in cal(V) \( a \) })] . $ <eq:transferred-prefix-sum>]
  For every realized pair, at most one summand is nonzero: its terminal site must be the first site of $tilde(X)$
    within distance $R$ of the full range of $tilde(beta)^(thin e)$.
    This uniqueness is a pathwise fact and uses no stopping-time property of the first contact.
  #emph[The stopped posterior law.] The factors $w \( a_0 a \; e \)$ in (6.9) still come from the original raw
    positive law conditioned on $a_0$. In that law, let $cal(G)_i$ record the marked continuation for $i$ steps,
    and form the martingales
  $ w_i \( e \) = P_0 \( cal(D)_N^(+) \, med pi X_(T_N) = e divides a_0 \, cal(G)_i \) \, wide e in cal(E)_N . $
  They are nonnegative and have sum at most one. Stop the continuation on its first hit of height $k - 1$ or $N$.
    Every departure before that stop has height at least $k$,
    so it is separated from the active departures of $a_0$. The stopping arrival uses no row.
    By factoring each finite stopped-prefix probability, the conditional stopped continuation therefore has
    exactly the same path law as $tilde(X)$ stopped at
  $ zeta = T_(k - 1) \( tilde(X) \) and T_N \( tilde(X) \) . $
  Both stops are almost surely finite by uniform ellipticity and exit from a slab of bounded height.
  Evaluate the same deterministic functions (6.6) along the comparison path until $zeta$,
    and freeze them afterwards. More explicitly, if $tilde(X)_(\[ 0 \, j \])$ denotes its marked prefix of length
    $j$, set
  $ tilde(w)_i \( e \) = w #scale(x: 120%, y: 120%)[\(] a_0 tilde(X)_(\[ 0 \, i and zeta \]) \;
    e #scale(x: 120%, y: 120%)[\)] . $
  Equality of the stopped path laws shows that this vector has the stopped martingale law just described.
    Its values remain the original conditional probabilities given $a_0$;
    they are not conditional probabilities given the fresh environment.
    In particular, the value at a hit of $k - 1$ retains its original meaning,
    and no identification of continuation laws beyond that hit is needed.
  Define
  $ M_(*) \( e \) = max_(0 lt.eq i lt.eq zeta) tilde(w)_i \( e \) \, wide S_(*) = sum_(e in cal(E)_N) M_(*) \( e \) . $
  All endpoint coordinates are functions of the same stopped comparison path.
    We can therefore estimate their sum $S_(*)$ on an event while retaining only a logarithmic dependence on the
    number of endpoints. Applying Lemma 16 and using $log \( \| cal(E)_N \| + 1 \) lt.eq C log \( 2 N \)$ gives,
    for any event $V$ depending on the comparison path and its environment,
  #[#set math.equation(numbering: n => "(6.10)")
   $ E^(upright(c)) \[ S_(*) upright(bold(1))_V \] lt.eq C log \( 2 N \) thin P^(upright(c)) \( V \) log
     frac(upright(e), P^(upright(c)) \( V \)) . $ <eq:stopped-posterior-event>]
  The constant is uniform over $a_0$. We have thus controlled the endpoint factors while preserving a fresh shared
    environment in which to estimate contacts.
  #emph[Quenched exit probabilities.] For an interior site $y$, meaning $k lt.eq y_1 < N$, write
  $ q_y^omega = P_(y \, omega) \( T_(k - 1) < T_N \) . $
  Ellipticity gives $0 < q_y^omega < 1$. For $t = 2^(- j)$, $j gt.eq 1$, let $V_t$ be the event that $tilde(X)$,
    at or after its first hit of height $r$ and before $zeta$, visits a site with $q_y^omega gt.eq t$.
    With the environment fixed, stop at the first such visit.
    The conditional chance of exiting at $k - 1$ is then at least $t$.
    After averaging, stationarity and almost sure slab exit give
  #[#set math.equation(numbering: n => "(6.11)")
   $ t P^(upright(c)) \( V_t \) & lt.eq P_z \( T_r < T_(k - 1) < T_N \)\
 & = u_(r - k)^(+) - u_(N - k)^(+) = Delta . $ <eq:first-contact-large-q>]
  Suppose a retained prefix ends at $y$ with $q_y^omega in \[ t \, 2 t \)$.
    Its endpoint lies at height at least $r$, so $V_t$ occurs.
    The negative path visits a site $y'$ within distance $R$ of $y$.
    Because $r - k gt.eq R$ and the negative path satisfies $D^(-)$, this site is also interior:
    $k lt.eq y'_1 lt.eq N - 1$. A coordinate path from $y$ to $y'$ of length at most $d R$ stays inside the slab.
    Following this path and then exiting through the lower boundary shows that
  $ q_y^omega gt.eq kappa^(d R) q_(y')^omega \, wide q_(y')^omega lt.eq c_R t \, wide c_R = 2 kappa^(- d R) . $
  For each fixed environment, the probability that a raw path from $\( N - 1 \, e \)$ satisfies $D^(-)$ and visits
    any interior site with $q_(y')^omega lt.eq c_R t$ is at most $c_R t$, uniformly in $e$.
    Indeed, stop on the first visit to that set. To satisfy $D^(-)$ after this visit,
    the path must next leave the slab through $k - 1$, except on the null event of never exiting it.
    The strong Markov property bounds the conditional probability of this next exit by $q_(y')^omega lt.eq
    c_R t$ at the first-visit site, regardless of earlier visits below $k - 1$.
  #emph[Summing the exit-probability bins.] We classify the transferred sum (6.9) according to
    $q_(y \( a \))^omega in \[ t \, 2 t \)$. This classification is made in the shared environment,
    after (6.8) has been applied. A retained prefix ends before $zeta$,
    so its posterior factor is at most $M_(*) \( e \)$. By uniqueness of the retained prefix,
    its contribution in this bin is pointwise bounded by $M_(*) \( e \)$ times the indicators of $V_t$ and of the
    negative-path event in the preceding paragraph. Conditional on the environment,
    that negative path is independent of $tilde(X)$, and its event has probability at most $c_R t$.
    Summing over $e$, whose comparison path and environment have the same marginal,
    bounds this bin’s total contribution for fixed $a_0$ by
  #[#set math.equation(numbering: n => "(6.12)")
   $ C t thin E^(upright(c)) \[ S_(*) upright(bold(1))_(V_t) \] . $ <eq:first-contact-bin>]
  If $Delta = 0$, (6.11) makes every term zero. Suppose $Delta > 0$.
    For $t < Delta$, use $E^(upright(c)) S_(*) lt.eq C log \( 2 N \)$ and sum the geometric series in $t$.
    The contribution is at most $C log \( 2 N \) Delta$. For $t gt.eq Delta$, combine (6.10) and (6.11).
    Since $p mapsto p log \( upright(e) \/ p \)$ is increasing on $\[ 0 \, 1 \]$, each such bin contributes at most
  $ C log \( 2 N \) thin Delta log \( upright(e) t \/ Delta \) . $
  There are $O \( log \( upright(e) \/ Delta \) \)$ bins in this second range,
    so all bins together contribute at most $C log \( 2 N \) Delta log^2 \( upright(e) \/ Delta \)$.
    Finally, the first-hit prefixes $a_0$ are disjoint, hence $sum_(a_0) W \( a_0 \) lt.eq 1$,
    and (4.2) gives $macron(u)_N^(+) p_(-) gt.eq xi p_(+) p_(-) > 0$. Substitution in (6.7) proves (6.5). ◻
]

== 7 Contacts at many depths and completion of the proof <sec:contact-lower>

We continue to assume coexistence in the coordinate direction and adapt the cut-averaging argument of [12]
  Proposition 7.1 to scripted cuts and positive-side proximity labels.
  The first-contact estimate from Proposition 17 forces contacts in most groups of consecutive dyadic depth
  intervals. We will first count these intervals and then use the finite mean width of the common blocks to
  convert depths into block indices. The resulting lower bound contradicts Proposition 15.

#thm([Proposition 7.1.])[
  (Contact lower bound).  #emph[Suppose that $P_0 \( A_(e_1) \) > 0$ and $P_0 \( A_(- e_1) \) > 0$,
    and let $m \( J \)$ be the contact statistic of the opposed tapes defined in (4.8).
    There are constants $c > 0$ and an integer $c_1 gt.eq 0$ such that, for all sufficiently large integers $J$,
#[#set math.equation(numbering: n => "(7.1)")
 $ m \( J + c_1 \) gt.eq frac(c J, 1 + log log J) . $ <eq:contact-lower>]

]
] <prop:contact-lower>

#proof[
  All constants in this proof may depend on the fixed environment law and the marked construction,
    but not on $J$ or the depth parameters. Recall that the depth of a contact is the depth of its positive
    departure. For an integer $l gt.eq 0$, call $l$ a #emph[contact depth label] if there is a contact at an
    integer depth in $\[ 2^l \, 2^(l + 1) \)$.
  ===== 7.1 Conditioning on a distant cut. <conditioning-on-a-distant-cut.>
  Fix a large integer $J$, and set
  #[#set math.equation(numbering: n => "(7.2)")
   $ N = 2^(2 J) \, wide G = ⌈4 log_2 log \( 2 + J \)⌉ + 3 . $ <eq:lower-scales>]
  Let $cal(C)_N$ be the event that $N$ is a width renewal of the positive tape, and write
  $ upright(bold(Q))_N = upright(bold(P)) \( thin dot.op divides cal(C)_N \) . $
  By (4.2),
  #[#set math.equation(numbering: n => "(7.3)")
   $ upright(bold(P)) \( cal(C)_N \) = macron(u)_N^(+) gt.eq xi p_(+) > 0 . $ <eq:lower-conditioning>]
  Under $upright(bold(Q))_N$, follow the placed positive words from bottom to top by reversing the order of the
    slab list through this renewal, without reversing any word, and translate its bottom endpoint to the origin.
    The product formula (4.3) is invariant under this list reversal.
    Thus the resulting chronological path $Y$ has bridge law $cal(B)_N^(+)$.
    If $E_(upright("lat")) = pi Y_(T_N)$, the same translation puts the negative tape at
    $\( N - 1 \, E_(upright("lat")) \)$. Write $beta$ for this translated path.
    Its displacement path from its starting site has law $hat(P)_(-)$ and is independent of the positive list.
    This is exactly the pair of paths in Proposition 17. In these coordinates the depth of a positive departure at
    $y$ is $N - y_1$.
  On $cal(C)_N$, at most $N$ positive slabs are used before width $N$, since each width is at least $M gt.eq 1$.
    The norm of $E_(upright("lat"))$ is bounded by the sum of their radii,
    and hence by the sum of the first $N$ radii of the unconditioned positive tape.
    Proposition 7, (7.3), and Markov’s inequality give
  #[#set math.equation(numbering: n => "(7.4)")
   $ upright(bold(Q))_N { \| E_(upright("lat")) \| > N^2 } lt.eq C / N . $ <eq:lower-endpoint-tail>]
  ===== 7.2 An interval without contacts forces a late first contact. <an-interval-without-contacts-forces-a-late-first-contact.>
  For $G < l lt.eq J$, let $U'_l$ be the event that none of $l - G \, l - G + 1 \, dots.h \,
    l$ is a contact depth label. We will show that
  #[#set math.equation(numbering: n => "(7.5)")
   $ sum_(l = G + 1)^J upright(bold(Q))_N \( U'_l \) = o \( J \) . $ <eq:uncovered-labels>]
  Consider the possible positive cut depths
  $ cal(I)_l = \[ 2^l \, 3 / 2 thin 2^l \] ∩ bb(Z) . $
  For $s in cal(I)_l$, put
  #[#set math.equation(numbering: n => "(7.6)")
   $ k = N - s \, wide r = N - 2^(l - G) . $ <eq:lower-contact-parameters>]
  For all sufficiently large $J$, these integers satisfy $M lt.eq k < r < N$ and $r - k gt.eq R$,
    uniformly over the indicated $l \, s$.
  Suppose first that $s$ is an actual cut depth of the positive tape.
    In the reversed list, its boundary is at height $k$. Every preceding word remains strictly below its terminal
    height until its final arrival, and that arrival ends a record script.
    Consequently the bridge first reaches $k$ along a prefix realizing $cal(D)_k^(+)$:
    it first hits $k - M$ and then follows the prescribed $M$-step script.
    All the subsequent words remain at or above $k$. These assertions hold for the concatenated bridge,
    because a word’s initial boundary is a strict record of the preceding words and no script can straddle a
    boundary at which another script ends.
  The final positive departure before $T_N$ is $\( N - 1 \, E_(upright("lat")) \)$, the initial site of $beta$.
    There is therefore a first contact along $Y$ between $T_k$ and $T_N$. Its depth is at most $s$.
    On $U'_l$, there are no contacts at any depth in $\[ 2^(l - G) \, 2^(l + 1) \)$; since $s < 2^(l + 1)$,
    this first contact must have depth less than $2^(l - G)$. Its height is in particular at least $r$.
    If also $\| E_(upright("lat")) \| lt.eq N^2$, all the requirements of (6.4) are now satisfied.
  For each #emph[deterministic] $s in cal(I)_l$, let $cal(A)_(l \, s)$ denote the event (6.4) with the parameters
    (7.6). This event includes the prefix condition $cal(D)_k^(+)$,
    but we do not additionally require $s$ to be a cut of the tape.
    Thus Proposition 17 applies directly under $upright(bold(Q))_N$, and gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ upright(bold(Q))_N \( cal(A)_(l \, s) \) lt.eq C log \( 2 N \) thin phi.alt \( Delta_(l \, s) \) \, wide
     Delta_(l \, s) = u_(s - 2^(l - G))^(+) - u_s^(+) \, $ <eq:lower-deterministic-cut>]
  where
  $ phi.alt \( x \) = x log^2 \( upright(e) \/ x \) quad \( 0 < x lt.eq 1 \) \, wide phi.alt \( 0 \) = 0 . $
  Here and below $upright(e) = exp \( 1 \)$. Lemma 11 implies
  #[#set math.equation(numbering: n => "(7.8)")
   $ Delta_(l \, s) lt.eq C 2^(- G) a_l \, wide a_l = 2^l F_(+) \( 2^(l - 1) \) \, wide A :=
     sum_(l gt.eq 1) a_l < oo \, $ <eq:lower-delta-tail>]
  because $s - 2^(l - G) gt.eq 2^(l - 1)$. The factor $2^(- G)$ is the ratio between the remaining contact depth
    $2^(l - G)$ and the cut depth scale $2^l$.
  ===== 7.3 Averaging over the cut locations. <averaging-over-the-cut-locations.>
  Let $C_(+) \( t \)$ count the positive width renewals in $\( 0 \, t \]$.
    The positive widths are iid with finite mean by Propositions 3 and 5; their strong law gives $C_(+) \( t \) =
    t \/ E_(nu_(+)) L + o \( t \)$ almost surely. It follows that the number of positive cuts in $cal(I)_l$ is
  $ frac(2^(l - 1), E_(nu_(+)) L) + o \( 2^l \) quad upright("almost surely as ") l arrow.r oo . $
  Fix $0 < c_0 < 1 \/ \( 2 E_(nu_(+)) L \)$, and let $cal(T)_J$ be the event that every $cal(I)_l$ with $G < l
    lt.eq J$ contains at least $c_0 2^l$ positive cuts. On almost every tape the displayed asymptotic supplies
    this bound for all sufficiently large $l$. Since $G arrow.r oo$,
  $ upright(bold(P)) \( cal(T)_J^c \) arrow.r 0 \, wide upright(bold(Q))_N \( cal(T)_J^c \) lt.eq
    frac(upright(bold(P)) \( cal(T)_J^c \), xi p_(+)) arrow.r 0 . $
  In particular, no convergence rate in the strong law is needed for the changing conditional law $upright(bold(Q))_N$.
  Every cut counted in $cal(I)_l$ lies before depth $N$. On $U'_l$, $cal(T)_J$,
    and ${ \| E_(upright("lat")) \| lt.eq N^2 }$, each of these cuts supplies one of the events $cal(A)_(l \, s)$
    by the preceding argument. We obtain the pointwise inequality
  #[#set math.equation(numbering: n => "(7.9)")
   $ upright(bold(1))_(U'_l) upright(bold(1))_(cal(T)_J) upright(bold(1))_({ \| E_(upright("lat")) \| lt.eq N^2 })
     lt.eq frac(1, c_0 2^l) sum_(s in cal(I)_l) upright(bold(1))_(cal(A)_(l \, s)) . $ <eq:cut-averaging>]
  The right side involves only the deterministic-parameter probabilities already bounded in (7.7).
  We next sum those bounds using only $sum_l a_l < oo$. For large $J$, $C 2^(- G) a_l lt.eq
    upright(e)^(- 1)$ uniformly in $l$, and $phi.alt$ is increasing on $\[ 0 \, upright(e)^(- 1) \]$. Hence (7.8) yields
  #[#set math.equation(numbering: n => "(7.10)")
   $ phi.alt \( Delta_(l \, s) \) lt.eq C 2^(- G) a_l #scale(x: 120%, y: 120%)[\(] \( G + 1 \)^2 +
     log_(+)^2 \( 1 \/ a_l \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:lower-phi>]
  where $log_(+) x = max { 0 \, log x }$ and the right side is interpreted as zero when $a_l = 0$. Moreover,
  #[#set math.equation(numbering: n => "(7.11)")
   $ sum_(l = 1)^J a_l log_(+)^2 \( 1 \/ a_l \) lt.eq C \( A + J^(- 1) \) log^2 J . $ <eq:lower-slow-tail>]
  Indeed, terms with $a_l gt.eq J^(- 2)$ contribute at most $4 A log^2 J$.
    For the remaining terms, the function $x log^2 \( 1 \/ x \)$ is increasing on $\[ 0 \, J^(- 2) \]$ for large
    $J$, so each is at most $4 J^(- 2) log^2 J$.
  Taking expectations in (7.9), using $\| cal(I)_l \| lt.eq 2^l$, and applying (7.4), (7.7), (7.10), and (7.11),
    we obtain
  #[#set math.equation(numbering: n => "(7.12)")
   $ sum_(l = G + 1)^J upright(bold(Q))_N \( U'_l \) & lt.eq J upright(bold(Q))_N \( cal(T)_J^c \) + frac(C J, N)\
 & quad + C log \( 2 N \) thin 2^(- G) #scale(x: 120%, y: 120%)[\(] A \( G + 1 \)^2 + \( A + J^(- 1) \) log^2 J
   #scale(x: 120%, y: 120%)[\)] = o \( J \) . $ <eq:lower-uncovered-bound>]
  For the final equality, the first term is $o \( J \)$, while (7.2) gives $log \( 2 N \) = O \( J \)$, $2^(- G) =
    O \( \( log J \)^(- 4) \)$, and $G = O \( log log J \)$. The last term is therefore
    $O \( J \/ \( log J \)^2 \)$, and $C J \/ N = o \( J \)$.
    This proves (7.5), even when the summable sequence $\( a_l \)$ decays arbitrarily slowly.
  There are $J - G$ tested labels $l$. By (7.5) and Markov’s inequality,
    with $upright(bold(Q))_N$-probability tending to one, at least $J \/ 2$ of these tests have $U'_l$ false.
    Each such test has a contact depth label in ${ l - G \, dots.h \, l }$,
    and any one contact label can account for at most $G + 1$ tests.
    Thus, if $cal(E)_J$ is the event that at least $J \/ \( 2 \( G + 1 \) \)$ of $1 \, dots.h \,
    J$ are contact depth labels, then
  #[#set math.equation(numbering: n => "(7.13)")
   $ upright(bold(Q))_N \( cal(E)_J \) arrow.r 1 \, wide liminf_(J arrow.r oo) upright(bold(P)) \( cal(E)_J \)
     gt.eq xi p_(+) > 0 . $ <eq:lower-unconditioning>]
  The second assertion follows by intersecting $cal(E)_J$ with $cal(C)_N$ and using (7.3).
    We have therefore obtained the needed number of depth labels under the original tape law.
  ===== 7.4 From depths to common-block indices. <from-depths-to-common-block-indices.>
  By Proposition 12, $mu = upright(bold(E)) K_1$ is finite and positive, and $W'_i \/ i arrow.r mu$ almost surely.
    For an integer depth $z gt.eq 1$, let $i \( z \)$ be its common-block index, so that
  $ W'_(i \( z \) - 1) < z lt.eq W'_(i \( z \)) . $
  The strong law implies, almost surely for all sufficiently large integer $z$,
  #[#set math.equation(numbering: n => "(7.14)")
   $ frac(z, 2 mu) lt.eq i \( z \) < frac(2 z, mu) + 1 . $ <eq:depth-index-comparison>]
  Consequently there is a deterministic integer $c_1 gt.eq 0$ such that,
    almost surely for all sufficiently large $l$, every depth $2^l lt.eq
    z < 2^(l + 1)$ has an index label $j$ satisfying
  $ 2^j < i \( z \) lt.eq 2^(j + 1) \, wide \| j - l \| lt.eq c_1 . $
  The opposite choices of open endpoints for the depth and index intervals affect this comparison by at most one
    label and are included in $c_1$. Let $cal(V)_J$ be the event that the comparison holds for every $l gt.eq
    ceil.l sqrt(J) ceil.r$. Its probability tends to one. By (7.13),
    the intersection $cal(E)_J ∩ cal(V)_J$ therefore has probability bounded below by a positive constant for all
    large $J$.
  On this intersection discard the depth labels below $ceil.l sqrt(J) ceil.r$.
    This loses only $O \( sqrt(J) \) = o \( J \/ \( G + 1 \) \)$ labels.
    Each remaining contact depth label gives a contact in a block-index interval labeled in ${ 1 \, dots.h \, J +
    c_1 }$, and each index label can receive at most $2 c_1 + 1$ distinct depth labels.
    There are consequently at least $c J \/ \( G + 1 \)$ such index labels on an event of probability bounded
    below. Taking expectations in the definition (4.8) proves
  $ m \( J + c_1 \) gt.eq frac(c J, G + 1) . $
  Since $G + 1 = O \( 1 + log log J \)$, this is (7.1). ◻
]

#proof[
  If both coordinate escape events $A_(e_1)$ and $A_(- e_1)$ had positive probability,
    Propositions 15 and 18 would give, for all large $J$,
  $ frac(c J, 1 + log log J) lt.eq m \( J + c_1 \) lt.eq frac(C \( J + c_1 \), log \( J + c_1 \)) \, $
  which is impossible as $J arrow.r oo$. The same argument applies after any permutation of the coordinate axes,
    so coexistence is impossible in every coordinate direction.
  Now fix any nonzero real direction $ell$. If $0 < P_0 \( A_ell \) < 1$,
    Proposition 4 gives positive probability to both $A_ell$ and $A_(- ell)$.
    Proposition 9 then gives a coordinate direction with positive probability for both escape signs,
    contradicting what we have just proved. Thus $P_0 \( A_ell \) in { 0 \, 1 }$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Kenneth S. Alexander and Quentin Berger, #emph[Local asymptotics for the first intersection of two
  independent renewals], Electronic Journal of Probability #strong[21] (2016), paper no.~68, 1--20.
  #link("https://doi.org/10.1214/16-EJP17")[doi:10.1214/16-EJP17].]
#bibitem([2])[Noam Berger, #emph[Limiting velocity of high-dimensional random walk in random environment],
  Annals of Probability #strong[36] (2008), no.~2, 728--738.
  #link("https://doi.org/10.1214/07-AOP338")[doi:10.1214/07-AOP338].]
#bibitem([3])[Maury Bramson, Ofer Zeitouni, and Martin P. W.
  Zerner, #emph[Shortest spanning trees and a counterexample for random walks in random environments],
  Annals of Probability #strong[34] (2006), no.~3, 821--856.
  #link("https://doi.org/10.1214/009117905000000783")[doi:10.1214/009117905000000783].]
#bibitem([4])[Francis Comets and Ofer Zeitouni, #emph[A law of large numbers for random walks in random mixing
  environments], Annals of Probability #strong[32] (2004), no.~1B, 880--914.
  #link("https://doi.org/10.1214/aop/1079021467")[doi:10.1214/aop/1079021467].]
#bibitem([5])[Alexander Drewitz and Alejandro F. Ramírez,
  #emph[Asymptotic direction in random walks in random environment revisited],
  Brazilian Journal of Probability and Statistics #strong[24] (2010), no.~2, 212--225.
  #link("https://doi.org/10.1214/09-BJPS028")[doi:10.1214/09-BJPS028].]
#bibitem([6])[Adriano M. Garsia, #emph[A simple proof of E.
  Hopf's maximal ergodic theorem], Journal of Mathematics and Mechanics #strong[14] (1965), no.~3, 381--382.]
#bibitem([7])[Xiaoqin Guo, #emph[On the limiting velocity of random walks in mixing random environment],
  Annales de l'Institut Henri Poincaré, Probabilités et Statistiques #strong[50] (2014), no.~2, 375--402.
  #link("https://doi.org/10.1214/12-AIHP534")[doi:10.1214/12-AIHP534].]
#bibitem([8])[Steven A. Kalikow, #emph[Generalized random walk in a random environment],
  Annals of Probability #strong[9] (1981), no.~5, 753--768.
  #link("https://doi.org/10.1214/aop/1176994306")[doi:10.1214/aop/1176994306].]
#bibitem([9])[Thomas Kesselheim, Marco Molinaro, Kalen Patton, and Sahil Singla,
  #emph[Online algorithms via minimax and posterior matching], preprint, August 2026.
  #link("https://arxiv.org/abs/2608.01616v1")[arXiv:2608.01616v1].]
#bibitem([10])[Masato Kikuchi, #emph[A note on the energy inequalities for increasing processes],
  in #emph[Séminaire de Probabilités XXVI], Lecture Notes in Mathematics #strong[1526], Springer, Berlin, 1992,
  533--539.]
#bibitem([11])[Solomon Kullback and Richard A. Leibler, #emph[On information and sufficiency],
  Annals of Mathematical Statistics #strong[22] (1951), no.~1, 79--86.
  #link("https://doi.org/10.1214/aoms/1177729694")[doi:10.1214/aoms/1177729694].]
#bibitem([12])[OpenAI, #emph[A directional zero--one law under strict ellipticity],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-directional-zero-one-law-under-strict-ellipticity-September-23-2026/paper.pdf")[OAI:A-directional-zero-one-law-under-strict-ellipticity-September-23-2026],
  2026.]
#bibitem([13])[Firas Rassoul-Agha, #emph[On the zero-one law and the law of large numbers for random walk in
  mixing random environment], Electronic Communications in Probability #strong[10] (2005), 36--44.
  #link("https://doi.org/10.1214/ECP.v10-1130")[doi:10.1214/ECP.v10-1130].]
#bibitem([14])[Claude E. Shannon, #emph[A mathematical theory of communication],
  Bell System Technical Journal #strong[27] (1948), 379--423, 623--656.]
#bibitem([15])[François Simenhaus, #emph[Asymptotic direction for random walks in random environments],
  Annales de l'Institut Henri Poincaré, Probabilités et Statistiques #strong[43] (2007), no.~6, 751--761.
  #link("https://doi.org/10.1016/j.anihpb.2006.10.003")[doi:10.1016/j.anihpb.2006.10.003].]
#bibitem([16])[Alain-Sol Sznitman and Martin Zerner, #emph[A law of large numbers for random walks in random
  environment], Annals of Probability #strong[27] (1999), no.~4, 1851--1869.
  #link("https://doi.org/10.1214/aop/1022874818")[doi:10.1214/aop/1022874818].]
#bibitem([17])[Jean Ville, #emph[Étude critique de la notion de collectif], Gauthier-Villars, Paris, 1939.]
#bibitem([18])[Martin P. W. Zerner, #emph[The zero-one law for planar random walks in i.i.d.
  random environments revisited], Electronic Communications in Probability #strong[12] (2007), 326--335.
  #link("https://doi.org/10.1214/ECP.v12-1314")[doi:10.1214/ECP.v12-1314].]
#bibitem([19])[Martin P. W. Zerner and Franz Merkl, #emph[A zero-one law for planar random walks in random
  environment], Annals of Probability #strong[29] (2001), no.~4, 1716--1732.
  #link("https://doi.org/10.1214/aop/1015345769")[doi:10.1214/aop/1015345769].]
