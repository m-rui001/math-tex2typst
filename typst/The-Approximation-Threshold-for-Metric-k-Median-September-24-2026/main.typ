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

#align(center)[#text(size: 16pt, weight: "bold")[The approximation threshold for metric $k$-median]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

In metric $k$-median, a finite set $J$ of clients and a finite set $F$ of candidate facilities lie in a common
  metric space. Given an integer $k$, one chooses at most $k$ facilities to minimize the sum of the distances from
  clients to their nearest chosen facility. For a nonempty set $S subset.eq F$, write

$ d \( j \, S \) = min_(i in S) d \( j \, i \) \, wide "cost" \( S \) = sum_(j in J) d \( j \, S \) \, wide
  "OPT"_k = min_(S subset.eq F\
1 lt.eq \| S \| lt.eq k) "cost" \( S \) . $

The input distances are rational and encoded in binary, and $1 lt.eq k lt.eq \| F \|$.
  Both $k$ and the metric are unrestricted. Candidate facilities are specified as part of the input;
  we do not require $F = J$. The empty-client instance has cost zero and can be handled immediately.

The facility budget is a central difficulty: a solution with small connection cost can be much easier to obtain
  when extra facilities are allowed. Our approach first permits a constant additive surplus,
  makes that approximation deterministic, and then removes the surplus using an established reduction.

#thm([Theorem 1.1.])[
  #emph[For every fixed $epsilon > 0$, there is a deterministic algorithm which,
    given a finite rational metric $k$-median instance with $1 lt.eq k lt.eq \| F \|$, returns $S subset.eq F$,
    $\| S \| lt.eq k$, such that
$ sum_(j in J) d \( j \, S \) lt.eq (1 + 2 / e + epsilon) "OPT"_k . $

 Its running time is polynomial in the binary encoding length of the instance. The polynomial may depend on $epsilon$.]
] <thm:main>

Hardness below $1 + 2 \/ e$ in this facility model follows from the Max-$k$-Coverage gap:
  covered clients have distance one and uncovered clients have distance at least three.
  We use the formulation under $P eq.not N P$ recorded by Anand and Lee #cite(label("AnandLee2024")) Sections 1
  and 1.1, based on Feige’s perfect-completeness coverage gap #cite(label("Feige1998")) Theorem 5.3.
  For an explicit metric completion, represent sets by facilities and universe elements by a disjoint client set.
  Give distinct points within either part distance two, and give a facility–client pair distance one for incidence
  and three otherwise. This is a metric: a same-part edge of length two is bounded by $1 + 1$,
  and a cross-part edge of length at most three is bounded by $2 + 1$.
  For a universe of size $m$, the connection cost is exactly $3 m - 2 c$ when the chosen sets cover $c$ elements;
  a perfect cover has cost $m$. Thus a gap between covering every element and covering at most a $1 - 1 \/ e +
  delta$ fraction gives the lower bound $1 + 2 \/ e - 2 delta$, for every fixed positive $delta$.
  Together with Theorem 1, this proves the following consequence.

#thm([Corollary 1.2.])[
  #emph[If $P eq.not N P$, the infimum of deterministic polynomial-time approximation factors for metric
    $k$-median with specified candidate facilities is $1 + 2 \/ e$.]
] <cor:threshold>

The infimum in Corollary 2 does not assert attainment of the endpoint factor.
  The hardness assumption and candidate-facility model are part of the statement.
  In particular, the corresponding lower-bound question with the restriction $F =
  J$ is different #cite(label("AnandLee2024")).

=== 1.1 Historical context and method <historical-context-and-method>

Metric $k$-median has been a testing ground for LP rounding, primal-dual algorithms, and local search.
  Charikar, Guha, Tardos and Shmoys gave the first constant-factor approximation through LP
  rounding #cite(label("CharikarGuhaTardosShmoys2002")). Jain and Vazirani connected the cardinality constraint
  with metric facility location through Lagrangian relaxation and the primal-dual
  method #cite(label("JainVazirani2001")). The combinatorial improvements of Charikar and
  Guha #cite(label("CharikarGuha1999")) and the greedy dual-fitting approach of Jain et
  al. #cite(label("JainEtAl2003")) developed this connection further.
  A different route, the bounded-swap local search of Arya et al. #cite(label("Arya2004")), achieves factor $3 +
  epsilon$.

Li and Svensson #cite(label("LiSvensson2016")) made constant-additive pseudo-approximations a route past the
  factor-three barrier: a constant number of extra facilities can be removed at an arbitrarily small additional
  approximation loss. Subsequent bi-point rounding, including the corrected $2.675 +
  epsilon$ guarantee of Byrka et al. #cite(label("ByrkaEtAl2017")), refined this approach.
  Gowda et al. #cite(label("GowdaEtAl2023")) obtained $2.613$ in their SODA 2023 version.
  Cohen-Addad et al. #cite(label("CGLSS2026")) reached $2 + epsilon$, first announced in 2025.
  Byrka et al. #cite(label("ByrkaEtAl2026")) subsequently developed a graph-based iterative rounding framework
  that also gives $2 + epsilon$ for metric $k$-median and extends to other clustering objectives.
  Theorem 1 reaches every fixed factor above the $1 + 2 \/ e$ hardness boundary in the general candidate-facility model.

Our construction follows the iterative graph framework, with the cost analysis replaced by a directed comparison
  inequality and a potential that retains some surviving assignments after an opening.
  The earlier framework’s general transfer theorem uses a parameter at least $2$ in the metric $k$-median case
  #cite(label("ByrkaEtAl2026")) Theorem 6.1; it does not supply the smaller factor proved here.
  We establish the grid preparation, physical updates, comparison, and deterministic implementation together.

A separate companion combines anchor recovery with bounded-price payment accounting to give an independent
  randomized approximation below factor $2$ while respecting the facility
  budget #cite(label("OpenAIRecovery2026")) Theorem 1.2.

Two other methodological antecedents are useful to distinguish.
  Splitting fractional facilities and organizing assignments around separated representatives and bundles are
  standard LP-rounding techniques; Charikar and Li #cite(label("CharikarLi2012")) provide a close predecessor.
  The pair updates used in our preparation belong to the dependent-rounding approach of
  Srinivasan #cite(label("Srinivasan2001")) and Gandhi et al. #cite(label("GandhiEtAl2006")),
  with weighted variants studied by Byrka et al. #cite(label("ByrkaEtAl2017")).
  We prove the particular moment bounds and coupled supplier construction needed here.
  Likewise, reducing the support of a distribution while matching moments is a standard Carathéodory argument;
  see Bayer and Teichmann #cite(label("BayerTeichmann2005")) for the finite-cubature perspective.
  Our implementation specifies which moments suffice throughout the physical process and proves the required
  rational encoding bounds.

=== 1.2 Proof overview <proof-overview>

The proof separates the preparation of fractional openings, their iterative rounding,
  and the removal of randomness and surplus. The intermediate guarantee is measured against the standard
  assignment LP: its variable $y_i$ is the amount of opening at facility $i$,
  and each client receives a unit of this opening mass. The LP has total opening mass at most $k$ and cost at most
  $"OPT"_k$.

===== 1.2.1 Preparing a constant grid. <preparing-a-constant-grid.>

Section 3 replaces the LP openings by multiples of $g = 1 \/ Delta$,
  where the even integer $Delta$ depends only on the accuracy.
  The total mass increases by at most $3 g$, and each client’s expected assignment cost increases by an
  arbitrarily small factor. Separated representative clients define disjoint bundles of nearby opening mass.
  A bundle’s deficit is the part missing from a unit; its suppliers are the facilities or other bundles holding
  that part of the representative’s assignment. Rounding deficits together with their suppliers controls both the
  opening budget and the cost of restoring a full unit. This coupling must allow one supplier to serve many
  clients, because assignment mass is not a shared capacity.

===== 1.2.2 Rounding the grid. <rounding-the-grid.>

View every positive grid opening as copies of mass $g$. In each round,
  a directed graph specifies which copies a source erases when that source’s facility opens.
  Each target has exactly $Delta$ incoming sources, chosen with distance-dependent probabilities.
  Opening and erasing are balanced so that only a constant additional number of facilities is needed.
  This source-opening and neighbor-erasure framework, including balanced batches and forced large updates,
  builds on Byrka et al. #cite(label("ByrkaEtAl2026")) Sections 3–6.

The connection-cost analysis needs a different comparison below factor two.
  For each client, we track surviving copies from its initial assigned unit and a persistent bound on its eventual
  connection distance. A potential combines their remaining assignment cost with that bound.
  Its coefficient depends on elapsed time as well as surviving mass.
  When one of the client’s own copies opens, we continue tracking the cheaper survivors;
  this produces a subtraction that pays for other possible erasures.
  The finite inequality in Section 4 captures that payment for arbitrary directed comparison coefficients.
  Its proof transfers contributions from positive rows to lower-distance rows,
  whose negative contributions cover them. Appendix 7 proves every scalar estimate by explicit rational polynomial
  certificates. The geometric substitution and the potential analysis are given in Section 5.

A source erasing many copies is handled by forcing its facility open.
  Because this choice depends on the graph, its potential change is bounded for each realized graph first.
  Only then do we average over graphs. This order lets the finite directed inequality control the averaged drift
  without conditioning on a graph-dependent forcing event.

===== 1.2.3 A deterministic solution and the exact budget. <a-deterministic-solution-and-the-exact-budget.>

The preceding analysis uses randomness, but only specified low-order moments of each local choice enter its
  bounds. Section 6 constructs polynomial-size rational distributions preserving these moments.
  All physical histories are expanded for a constant number of rounds,
  and the cheapest output satisfying the additive budget is chosen.
  The separate rational-arithmetic analysis proves polynomial time in the binary input length.
  The result is a deterministic approximation opening at most $k +
  c$ facilities for an accuracy-dependent constant $c$. Li and Svensson’s reduction then removes this surplus with
  an arbitrarily small additional loss.

===== 1.2.4 Organization. <organization.>

Section 2 fixes the model and states the external additive-to-ordinary reduction. Section 3 prepares the openings.
  Section 4 proves the finite drift inequality, with its scalar certificates in Appendix 7.
  Section 5 gives and analyzes the iterative procedure. Section 6 supplies the deterministic implementation and
  completes the proof of Theorem 1.

== 2 Preliminaries and the reduction <sec:preliminaries>

We use the client set $J$, candidate set $F$, connection cost $"cost"$,
  and optimum $"OPT"_k$ defined in the introduction. Polynomial time includes the binary encodings of all
  distances. We henceforth assume $J eq.not diameter$ and $1 lt.eq k lt.eq \| F \|$.
  This section fixes the fractional representation and states the external reduction that will remove the final
  constant additive surplus.

=== 2.1 The fractional solution <the-fractional-solution>

We use the standard relaxation

#[#set math.equation(numbering: n => "(2.1)")
 $ upright("minimize") quad & sum_(j in J) sum_(i in F) d \( j \, i \) x_(i j)\
upright("subject to") quad & sum_(i in F) x_(i j) = 1 &  & \( j in J \) \,\
 & 0 lt.eq x_(i j) lt.eq y_i lt.eq 1 &  & \( i in F \, med j in J \) \,\
 & sum_(i in F) y_i lt.eq k . $ <eq:lp>]

Its rational optimum can be found in polynomial time. For fixed openings $y_i$,
  assign each client to its nearest unit of opening mass, using a fixed order to break ties.
  If $h_j \( t \)$ is the distance needed to accumulate mass $t$, put

$ V_j = integral_0^1 h_j \( t \) thin d t . $

Then $L = sum_j V_j lt.eq "OPT"_k$ for an optimal solution of (2.1).

As in LP-rounding constructions such as Charikar–Li #cite(label("CharikarLi2012")) Section 2,
  it is convenient to split an opening into co-located pieces so that each client’s nearest-unit assignment uses
  whole pieces. There are only polynomially many needed split points:
  each client uses at most one partial piece in a fixed distance order.
  Refine each facility simultaneously at all the resulting cut points.
  Denote the whole-piece assignment of client $j$ by $F_j$.
  For a set $U$ of pieces, write $y \( U \) = sum_(i in U) y_i$; thus $y \( F_j \) = 1$ and $V_j =
  sum_(i in F_j) y_i d \( j \, i \)$.

Internal pieces at one location are allowed to be distinct, so their distance can be zero.
  All geometric arguments use only nonnegativity, symmetry, and the triangle inequality.
  Whenever a procedure returns open pieces, merge them by their original facility identity.
  Merging preserves every client’s connection cost and cannot increase the number of facilities.

=== 2.2 Constant-additive pseudo-approximation <constant-additive-pseudo-approximation>

#prodef([Definition 2.1.])[
  A $c$-additive $alpha$-approximation for metric $k$-median returns at most $k +
    c$ facilities of cost at most $alpha "OPT"_k$. The additive allowance $c$ is independent of the input instance.
]

We use the following established result.

#thm([Theorem 2.2.])[
  (Li–Svensson #cite(label("LiSvensson2016")), Theorem 4 of the 2014 manuscript).  #emph[Let $alpha > 1$,
    and suppose $cal(A)$ is a $c$-additive $alpha$-approximation algorithm for metric $k$-median.
    For every $eta > 0$, there is an ordinary $\( alpha + eta \)$-approximation algorithm with running time
    $n^(O \( c \/ eta \))$ times the running time of $cal(A)$.
    For fixed $alpha \, c \, eta$, this is polynomial overhead.]
] <thm:li-svensson>

The theorem permits separate client and candidate sets and applies the pseudo-algorithm to restricted candidate
  instances. Our construction works on every such instance.
  We will obtain a deterministic pseudo-algorithm before applying Theorem 4;
  the external reduction is not being used to convert an expected-cost statement into determinism.

For each fixed accuracy we permit all grid denominators, numbers of rounds,
  and additive allowances to be constants of any size. They may depend on that accuracy, but not on $k$,
  the number of input points, their distances, or their bit lengths.
  Thus it suffices to prove, for each fixed $tau > 0$, a deterministic $c_tau$-additive
  $\( 1 + 2 \/ e + tau \)$-approximation. Our analysis in fact bounds the pseudo-solution against $L$,
  the initial fractional cost. This does not assert the same factor for rounding the original relaxation to
  exactly $k$ facilities: the additive allowance and the subsequent reduction are essential.

=== 2.3 Probability and bookkeeping <probability-and-bookkeeping>

We use $bb(E)$, $bb(P)$, and $"Var"$ for expectation, probability, and variance.
  Every distribution used below has finite support. Randomized procedures first provide the estimates;
  Section 6 replaces their choices by explicit polynomial-size lists.

Two elementary facts will be used repeatedly. First, for a nonnegative random cost $C$ and an event $E$ of
  probability at least $1 - rho > 0$,

#[#set math.equation(numbering: n => "(2.2)")
 $ bb(E) \[ C divides E \] lt.eq frac(bb(E) C, 1 - rho) . $ <eq:conditioning>]

No cost–event independence is required. Second, a finite distribution contains an outcome whose cost is at most
  its expected cost. These facts allow us to discard budget failures and select a single output by total cost;
  we never require all individual client expectation bounds to hold simultaneously at that output.

The notation $O_Delta \( dot.op \)$ means that its implicit constant may depend on the fixed grid denominator
  $Delta$, and on no input parameter. All unqualified constants in the geometric and analytic estimates are
  absolute, unless an explicit previously fixed parameter is indicated.

== 3 Preparing the openings <sec:preparation>

We first put the fractional openings on a sufficiently fine constant grid.
  The use of separated representatives and bundles is motivated by the discretization approach
  in #cite(label("ByrkaEtAl2026")). The construction below rounds a bundle’s missing assignment mass together with
  the facilities that can supply it. This coupling provides both an additive opening bound and a multiplicative
  connection-cost bound.

Throughout this Section, the client set is nonempty; an instance without clients requires no cost analysis.
  We start with feasible fractional openings $0 lt.eq y_i lt.eq 1$.
  For each client $j$, choose a nearest-unit assignment $x_(i j)$, resolving ties in a fixed order, and write

$ V_j = sum_i d \( i \, j \) x_(i j) . $

The feasibility constraints are $sum_i x_(i j) = 1$ and $x_(i j) lt.eq y_i$;
  there is no supply constraint shared by different clients.

#thm([Theorem 3.1.])[
  #emph[For every $eta > 0$, there is a constant $Delta_0$ with the following property.
    Given a finite rational metric instance and feasible rational openings $0 lt.eq y_i lt.eq
    1$ with a nearest-unit assignment of cost $V_j$ for each client $j$,
    fix any constant even integer $Delta gt.eq Delta_0$ and let $g = 1 \/ Delta$.
    There is a randomized procedure, running in expected polynomial time on rational inputs,
    that produces openings $tilde(y)_i in \[ 0 \, 1 \] ∩ g bb(Z)$,
    allowing polynomially many co-located labeled facility pieces, such that
$ 1 lt.eq sum_i tilde(y)_i lt.eq sum_i y_i + 3 g $

 for every output, and the expected nearest-unit assignment cost of every client $j$ is at most $\( 1 + eta \)
   V_j$. In particular the grid can be required to satisfy any additional positive instance-independent upper
   bound on $g$.]
] <thm:preparation>

The expectation in Theorem 5 is taken after rejecting outcomes that exceed the opening budget.
  Section 6 gives a deterministic implementation that preserves the corresponding bound on the sum of the client costs.

We use the following elementary dependent-rounding observation, in both weighted and unweighted form.
  The mean-preserving pair update and its product-supermartingale argument follow the standard
  approach #cite(label("Srinivasan2001")) #cite(label("GandhiEtAl2006"));
  weighted rounding with one residual fraction is also studied in #cite(label("ByrkaEtAl2017")) Section 2.
  We give the proof to specify exactly the moment guarantees used here.

#thm([Lemma 3.2.])[
  #emph[Let $q_e gt.eq 0$ be rational counts and let $beta_e > 0$ be rational weights.
    One can randomly update the counts within the bounds $\[ floor.l q_e floor.r \, ceil.l q_e ceil.r \]$,
    preserving $sum_e beta_e q_e$ on every update, until at most one count is fractional.
    Every first moment is preserved, and the expectation of every product of two distinct counts is at most the
    product of their initial values. Rounding the possible remaining fractional count with its correct mean
    preserves these moment assertions. For the resulting integer counts $Q_e$,
$ "Var" \( Q_e \) lt.eq q_e \, wide bb(E) \[ Q_e Q_f \] lt.eq q_e q_f quad \( e eq.not f \) . $

 The procedure uses linearly many two-coordinate updates.]
] <lem:prep-weighted-rounding>

#proof[
  When two coordinates are fractional, move them along the line
  $ \( q_e \, q_f \) mapsto \( q_e + t \, q_f - \( beta_e \/ beta_f \) t \) $
  to one of the two endpoints allowed by their fixed floor and ceiling bounds.
    Choose the endpoint probabilities so that the conditional mean of $t$ is zero.
    At least one coordinate becomes integral, and integral coordinates are not updated subsequently.
    Each coordinate is a martingale. The product of the two updated coordinates is a concave quadratic in $t$;
    a product involving exactly one updated coordinate has unchanged conditional mean.
    Thus every distinct-pair product is a supermartingale. Rounding the last fractional coordinate with the
    correct conditional mean leaves all these products unchanged in expectation.
    Finally, an integer random variable supported on ${ m \, m + 1 }$, with mean $m + theta$,
    has variance $theta \( 1 - theta \) lt.eq m + theta$. This proves the variance assertion. ◻
]

#proof[
  We first form disjoint bundles containing most of each representative’s assigned mass.
    We then round their deficits jointly with the openings that supply them,
    reserving a small amount of budget for clipping large deficits.
    After rounding inside bundles, every representative can again receive one unit.
    The final part of the proof compares connection costs at two representative-distance scales and conditions on
    the budget event.
  We will choose positive rational constants in the order
  $ delta \, quad M \, quad T_1 \, quad gamma \, quad g \, $
  with $delta$ small, $M$ and then $T_1$ large, and $gamma$ and then $g$ small.
    All choices depend only on $eta$; the last choice means that every sufficiently fine even grid is permitted.
    During the proof we require
  #[#set math.equation(numbering: n => "(3.1)")
   $ 0 < delta lt.eq 1 / 4 \, wide 0 < gamma lt.eq 1 \, wide theta := frac(1, M delta) lt.eq 1 / 8 \, wide
     alpha := frac(M, delta T_1) lt.eq 1 / 4 . $ <eq:prep-parameter-basics>]
  Set $p_0 = 1 - theta$ and $beta = M \/ T_1 = delta alpha$.
  ===== 3.1 Splitting and representatives. <splitting-and-representatives.>
  For each original facility, view its opening $y_i$ as an interval of length $y_i$ and its assignment to client
    $j$ as the initial subinterval of length $x_(i j)$. Split at the endpoints of these subintervals for all
    clients. There are at most $\| J \| + 1$ positive-mass pieces per original facility,
    and every assignment now uses whole pieces. Retain the notation $y_i$ for the mass of a piece,
    and let $F_j$ be the set of pieces used by client $j$. Thus
  $ y \( F_j \) = 1 \, wide V_j = sum_(i in F_j) y_i d \( i \, j \) \, wide y \( W \) := sum_(i in W) y_i . $
  Pieces retain the distances of their original facility. They may be treated as distinct candidates throughout
    the rounding; merging co-located integral openings at the end preserves all connection distances and can only
    decrease the number of opened facilities.
  Process the clients in nondecreasing order of $V_j$. Select each remaining client $s$ as a representative and
    absorb every remaining client $j$ for which $d \( j \, s \) lt.eq M V_j$.
    Write $cal(S)$ for the set of representatives. A client $j$ assigned to $s$ satisfies
  #[#set math.equation(numbering: n => "(3.2)")
   $ V_s lt.eq V_j \, wide d \( j \, s \) lt.eq M V_j . $ <eq:prep-representative-properties>]
  Distinct representatives satisfy
  $ d \( s \, t \) > M max \( V_s \, V_t \) : $
  indeed, the later one was not absorbed by the earlier one.
    Let $L_s$ be the distance to a nearest other representative, taking $L_s =
    oo$ when $s$ is the only representative. Define
  $ P_s = { i in F_s : d \( s \, i \) lt.eq delta L_s } \, quad p_s = y \( P_s \) \, quad c_s = 1 - p_s \, quad
    A_s = F_s \\ P_s \, $
  and let $U$ consist of all pieces outside $union.big_s P_s$. For $L_s = oo$, interpret $P_s = F_s$ and $c_s = 0$.
  The bundles $P_s$ are disjoint. Otherwise a piece in $P_s ∩ P_t$ would imply
  $ d \( s \, t \) lt.eq delta \( L_s + L_t \) lt.eq 2 delta d \( s \, t \) \, $
  which is impossible. For finite $L_s$, the mass in $A_s$ has distance at least $delta L_s$ from $s$, so
  #[#set math.equation(numbering: n => "(3.3)")
   $ delta L_s c_s lt.eq V_s \, wide 0 lt.eq c_s lt.eq theta \, wide p_s gt.eq p_0 . $ <eq:prep-deficit-small>]
  These bounds also cover $V_s = 0$: in that case $c_s = 0$.
  ===== 3.2 Supplier stars and signed counts. <supplier-stars-and-signed-counts.>
  For the raw opening count, give every bundle a base level of one.
    A supplier star couples planned deficits in its target bundles to the mass that will supply them.
    One planned count unit subtracts mass $g$ from each target bundle and adds mass $g$ at the supplier if it lies
    in $U$. A bundle supplier incurs no additional opening in this accounting.
    Thus a star with $d$ targets changes the opening mass by $\( 1 - d \) g$ for an outside supplier and by $-
    d g$ for a bundle supplier.
  Make a list $cal(E)$ of stars; a star $e$ has weight $w_e$, a flag $a_e in { 0 \,
    1 }$ indicating an outside supplier, a target set $D_e subset.eq cal(S)$, and a specified supplier:
  + For each $i in U$, take $w_e = y_i$, $a_e = 1$, $D_e = { s : i in A_s }$, and supplier $i$.
  + For each pair $s \, t$ with $y \( A_s ∩ P_t \) > 0$, take $w_e = y \( A_s ∩ P_t \)$, $a_e = 0$, $D_e = { s }$,
    and supplier $P_t$. Necessarily $t eq.not s$.
  + For each $s$ with $c_s > 0$, take $w_e = gamma c_s$, $a_e = 0$, $D_e = { s }$,
    and use as supplier the bundle of a nearest other representative. Such a representative exists because $c_s > 0$.
  The last stars are called extra stars. The planned count of star $e$ is $q_e = w_e \/ g$.
    With $u_e = a_e - \| D_e \|$, the planned raw opening mass is
  #[#set math.equation(numbering: n => "(3.4)")
   $ \| cal(S) \| + sum_e u_e w_e = sum_i y_i - gamma sum_s c_s . $ <eq:prep-raw-identity>]
  To see this, the flag-one weights sum to $y \( U \)$, while the total weight targeting $s$ is $\( 1 + gamma \) c_s$.
  Apply Lemma 6 independently to the positive and negative signs of $u_e$, using weights $\| u_e \|$.
    Complete the rounding of the positive class by rounding its possible last fraction with the correct mean.
    Round the zero-coefficient counts independently between their floor and ceiling.
    Leave the last fractional count of the negative class, if any, temporarily unrounded.
    All counts are then integral except possibly this one.
  If there is no remaining fraction, the resulting counts are both the nominal counts and the actual activation
    counts. Otherwise, write the remaining count as $m + xi$, where $0 < xi < 1$,
    and let its star have $d = \| D_e \|$ targets. Its nominal count is $m + "Bernoulli" \( xi \)$.
    If its flag is one, open $\( m + 1 \) g$ at its supplier, irrespective of the nominal coin.
    Activate $m$ units at each target, and activate one additional unit at every target in a random subset of size
  $ H in { floor.l d xi floor.r \, ceil.l d xi ceil.r } \, wide bb(E) H = d xi \, $
  whose membership marginal is $xi$ at every target. Such a subset is obtained by choosing the indicated size with
    the correct mean and then taking a uniformly shifted interval of that size in a fixed cyclic ordering of the
    targets. The nominal coin can be independent of this choice.
    All other stars use their integral counts for both openings and activations.
  This modification bounds the raw opening error independently of the number of targets.
    For the exceptional star its actual signed contribution, in count units, minus its planned contribution is
  $ a_e \( m + 1 \) - d m - H - \( a_e - d \) \( m + xi \) = a_e \( 1 - xi \) + d xi - H < 2 . $
  A positive coefficient $u_e$ necessarily equals one, so the last rounding in the positive class adds less than
    one further count unit. The zero class has no signed contribution.
    If $tilde(y)_i$ denotes the actual opening on $U$, and $Z_s$ denotes the total activated deficit mass at $s$,
    we therefore have on every outcome
  #[#set math.equation(numbering: n => "(3.5)")
   $ sum_(i in U) tilde(y)_i + sum_s \( 1 - Z_s \) lt.eq sum_i y_i - gamma sum_s c_s + 3 g . $ <eq:prep-raw-bound>]
  Moreover, each actual outside opening dominates both its nominal opening and every activation demand placed on
    it by a single target.
  ===== 3.3 Deficit moments and clipping. <deficit-moments-and-clipping.>
  The signed count already controls raw opening mass. The remaining obstacle is that an activated deficit might
    leave too little mass in its own bundle. We cap that deficit and pay for the added bundle mass with the
    reserve in Equation (3.5). For every $s$, let $A_(e s)$ be the integer activation count from a star targeting
    $s$. Then
  #[#set math.equation(numbering: n => "(3.6)")
   $ bb(E) Z_s = \( 1 + gamma \) c_s \, wide "Var" \( Z_s \) lt.eq g \( 1 + gamma \) c_s . $ <eq:prep-deficit-moments>]
  Here it matters that the last negative star may depend on the preceding random choices.
    Condition on the complete count vector immediately before its exceptional rounding.
    At most one coordinate is fractional, so for distinct $e \, f$ targeting $s$, at least one of $A_(e s) \,
    A_(f s)$ is deterministic under this conditioning. Each has conditional mean equal to its current count.
    Their conditional product expectation is therefore the product of those two current counts.
    The distinct-pair product bound in Lemma 6 consequently still holds for these activations.
    Their individual means are $q_e$, and each is supported on ${ floor.l q_e floor.r \, ceil.l q_e ceil.r }$. Thus
  $ "Var" \( Z_s \) lt.eq g^2 sum_(e : s in D_e) "Var" \( A_(e s) \) lt.eq g^2 sum_(e : s in D_e) q_e =
    g \( 1 + gamma \) c_s \, $
  as asserted. The nominal counts also retain the same first and distinct-pair moment bounds.
  Clip the deficit at one half:
  $ Z_s^(*) = min \( Z_s \, 1 / 2 \) \, wide p'_s = 1 - Z_s^(*) . $
  Discard any excess activation units. This can be done in whole units because $Delta$ is even.
    By Equation (3.1), $mu_s := bb(E) Z_s lt.eq 1 \/ 4$. For any random variable $X$ with mean $mu < b$,
  $ \( X - b \)_(+) lt.eq frac(\( X - mu \)^2, b - mu) . $
  Indeed the assertion is immediate when $X lt.eq b$, and otherwise follows by expanding
    $\( X - mu \)^2 = \( X - b + b - mu \)^2$. Equation (3.6) therefore gives
  $ bb(E) \( Z_s - 1 / 2 \)_(+) lt.eq 4 g \( 1 + gamma \) c_s . $
  Let $cal(G)$ be the event that
  $ sum_s \( Z_s - Z_s^(*) \) lt.eq gamma sum_s c_s . $
  If some $c_s$ is positive, Markov’s inequality gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ bb(P) \( cal(G) \) gt.eq 1 - rho \, wide rho := frac(4 g \( 1 + gamma \), gamma) . $ <eq:prep-budget-probability>]
  If all $c_s$ vanish, all activations and discarded amounts are zero, and $cal(G)$ holds surely.
    Equations (3.5) and (3.7) show that a vector with bundle sums $p'_s$ has total opening mass at most $sum_i
    y_i + 3 g$ on $cal(G)$.
  ===== 3.4 Rounding within bundles and supplying one unit. <rounding-within-bundles-and-supplying-one-unit.>
  Condition on the complete star-rounding outcome, including the retained activations.
    In each bundle independently, rescale piece $i in P_s$ to mass
  $ overline(y)_i = y_i p'_s / p_s . $
  Since $y_i lt.eq p_s$ and $1 \/ 2 lt.eq p'_s lt.eq 1$, these masses belong to $\[ 0 \, 1 \]$.
    Their sum $p'_s$ is a grid multiple. Apply the unweighted version of Lemma 6 to counts $overline(y)_i \/ g$.
    The preserved sum is integral in count units, so there is no final fraction.
    This produces grid masses $tilde(y)_i$ with conditional means $overline(y)_i$ and nonpositive conditional pair
    covariances. All masses remain at most one, because one is a grid point.
    Likewise the outside opening at a piece of original mass $y_i$ is at most $g ceil.l y_i \/ g ceil.r lt.eq 1$,
    even under the exceptional correction.
  Every representative $s$ can now receive one unit: take its entire bundle mass $p'_s$ and supply its retained
    deficit $Z_s^(*)$ using the retained activations. Each outside supplier has enough mass for its activation
    demand at $s$. Any bundle supplier is different from $P_s$.
    The total demand of $s$ on any one such bundle is at most its entire retained deficit, hence at most $1 \/ 2$,
    while every supplying bundle has mass at least $1 \/ 2$. Allocate this demand greedily over its pieces.
    The bundles and $U$ are disjoint, and different clients have separate assignment constraints.
    This proves feasibility for each client individually, even before conditioning on $cal(G)$.
    It also shows that the total opening mass is at least one.
  ===== 3.5 Cost comparison at a distant representative scale. <cost-comparison-at-a-distant-representative-scale.>
  Fix a client $j$ and its representative $s$, and put $D = d \( j \, s \)$.
    Let $R_s = max_(i in F_s) d \( s \, i \)$, and define the radius
  $ K_s = cases(delim: "{", L_s \, & c_s > 0 \,, R_s \, & c_s = 0 .) $
  If $V_j = 0$, Equation (3.2) gives $D = V_s = 0$. All pieces of $F_s$ then have distance zero from $j$, $c_s =
    0$, and $Z_s = 0$ surely. The rounded bundle $P_s = F_s$ still has one unit at distance zero.
    Hence the new cost is identically zero. We may therefore assume $V_j > 0$ in the remaining cost analysis.
  Suppose first that $K_s > T_1 V_j$. We have $R_s gt.eq delta K_s$:
    this is immediate if $c_s = 0$, and otherwise some assigned mass lies beyond $delta L_s$.
    Consequently $D \/ R_s lt.eq alpha < 1$. This controls the cost of exchanging the portions of $F_j$ and $F_s$
    that are not shared. Leave the shared pieces matched identically.
    The masses of $F_s \\ F_j$ and $F_j \\ F_s$ are equal. Each piece in the former set is at distance at most
    $R_s + D$ from $j$. Each piece in the latter set is at distance at least $R_s - D$ from $j$,
    because the nearest-unit assignment at $s$ uses all closer mass before stopping at radius $R_s$.
    This argument remains valid at ties. Comparing the two residual costs shows that using the old assignment
    $F_s$ for client $j$ has cost at most
  #[#set math.equation(numbering: n => "(3.8)")
   $ C_j \( F_s \) := sum_(i in F_s) y_i d \( j \, i \) lt.eq frac(1 + alpha, 1 - alpha) V_j . $ <eq:prep-far-exchange>]
  Serve $j$ with the feasible assignment just constructed for $s$. For each $i in P_s$,
  $ bb(E) tilde(y)_i = y_i bb(E) \[ p'_s \] \/ p_s lt.eq y_i \/ p_s . $
  For an ordinary star, the expected retained activation mass is at most its original weight.
    Thus outside suppliers do not increase their expected cost charge.
    It remains to compare arbitrary new supply inside a bundle $P_t$ with the old pieces in $A_s ∩ P_t$.
    This case only arises when $c_s > 0$. Then $D lt.eq beta L_s$, and for any old supplier piece $i in P_t$,
  $ d \( j \, i \) gt.eq d \( s \, t \) - D - delta L_t gt.eq \( 1 - beta - delta \) d \( s \, t \) . $
  Any two pieces of $P_t$ are at distance at most $2 delta L_t$.
    Because $L_t lt.eq d \( s \, t \)$ and $1 - beta - delta > 0$,
    every possible new supplier piece has distance to $j$ at most
  $ kappa thin d \( j \, i \) \, wide kappa := 1 + frac(2 delta, 1 - beta - delta) . $
  The comparison holds for every old piece, so it also holds relative to the weighted mean distance of the old
    pieces aggregated by that star. Multiplying by its expected retained activation mass bounds its expected cost
    by $kappa$ times its old cost contribution.
  Finally, for the extra star at $s$, its supplier $P_t$ satisfies $d \( s \, t \) = L_s$ and $L_t lt.eq L_s$.
    Every supply position is therefore at distance at most $\( beta + 1 + delta \) L_s$ from $j$.
    By Equation (3.3), its expected cost is at most
  $ \( beta + 1 + delta \) gamma c_s L_s lt.eq frac(\( beta + 1 + delta \) gamma, delta) V_j . $
  There is no extra star when $c_s = 0$. Combining these bounds with Equation (3.8),
    the unconditional expected nearest-unit cost in this case is at most $B_(upright("far")) V_j$, where
  #[#set math.equation(numbering: n => "(3.9)")
   $ B_(upright("far")) := max { p_0^(- 1) \, kappa } frac(1 + alpha, 1 - alpha) +
     frac(\( beta + 1 + delta \) gamma, delta) . $ <eq:prep-far-factor>]
  ===== 3.6 Cost comparison at a nearby representative scale. <cost-comparison-at-a-nearby-representative-scale.>
  Now suppose $K_s lt.eq T_1 V_j$. Consider the mass on the old set $F_j$,
    using nominal rounded masses on $U$ and actual rounded masses in the bundles.
    This mass is available in the actual opening vector. Its unconditional expected cost is at most $V_j \/ p_0$:
    nominal outside openings have mean $y_i$, and a bundle piece has expected mass at most $y_i \/ p_s lt.eq
    y_i \/ p_0$.
  We bound the expected shortfall of this available mass from one. Write $M_U$ for its nominal mass on $U ∩ F_j$.
    The first and pair moments of the nominal counts imply
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(E) M_U = y \( U ∩ F_j \) \, wide "Var" \( M_U \) lt.eq g thin y \( U ∩ F_j \) lt.eq
     g . $ <eq:prep-outside-noise>]
  For a fixed complete star outcome, put
  $ a_t = y \( F_j ∩ P_t \) \, wide overline(M)_P = sum_t a_t p'_t \/ p_t \, $
  and write $M_P$ for the actual rounded mass on these bundle pieces.
    Conditional on the star outcome, bundle rounding has nonpositive pair covariances within each bundle and is
    independent between bundles. The variance of a single grid-rounded mass of conditional mean $overline(y)_i$ is
    at most $g overline(y)_i$. Therefore
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(E) \[ M_P divides upright("star outcome") \] = overline(M)_P \, wide
     "Var" \( M_P divides upright("star outcome") \) lt.eq g overline(M)_P lt.eq
     g \/ p_0 . $ <eq:prep-conditional-noise>]
  Clipping at $1 \/ 2$ cannot increase distance from $c_t lt.eq 1 \/ 2$, so Equation (3.6) gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ bb(E) \| p'_t - p_t \| & = bb(E) \| c_t - Z_t^(*) \|\
 & lt.eq bb(E) \| c_t - Z_t \| lt.eq gamma c_t + sqrt(g \( 1 + gamma \) c_t) . $ <eq:prep-rescaling-noise>]
  Since $sum_t a_t lt.eq 1$, it follows that
  $ bb(E) lr(|overline(M)_P - sum_t a_t|) lt.eq sum_t a_t / p_t bb(E) \| p'_t - p_t \| lt.eq
    frac(gamma + sqrt(g \( 1 + gamma \)), p_0) . $
  Use the identity $y \( U ∩ F_j \) + sum_t a_t = 1$, the triangle inequality,
    and the second-moment bounds in Equations (3.10)–(3.11). The expected shortfall is at most
  #[#set math.equation(numbering: n => "(3.13)")
   $ bb(E) \( 1 - M_U - M_P \)_(+) lt.eq H \, wide H := sqrt(g) + sqrt(g \/ p_0) +
     frac(gamma + sqrt(g \( 1 + gamma \)), p_0) . $ <eq:prep-shortfall>]
  In particular no independence between outside counts and rescaled bundle masses is being assumed.
  Trim any surplus mass on $F_j$, which cannot increase its cost.
    To fill a remaining shortfall, there is always one unit of available opening within distance
  $ Q V_j \, wide Q := M + \( 1 + delta \) T_1 \, $
  from $j$. Indeed, if $c_s = 0$, there are no activations at $s$ and $P_s$ has exactly one unit,
    all at distance at most $D + R_s lt.eq \( M + T_1 \) V_j$.
    If $c_s > 0$, use $P_s$ and the bundle $P_t$ of a nearest other representative.
    They are disjoint and each has at least half a unit. Their supply lies within distance $D + \( 1 + delta \)
    L_s lt.eq Q V_j$. This supply can fill the shortfall even if some of it is already used:
    if the current assignment has mass $1 - q$, a ball containing at least one opening unit contains at least $q$
    unused units. Allocate those units to finish the assignment.
    By Equation (3.13), the unconditional expected nearest-unit cost is at most $B_(upright("near")) V_j$, where
  #[#set math.equation(numbering: n => "(3.14)")
   $ B_(upright("near")) := p_0^(- 1) + Q H . $ <eq:prep-near-factor>]
  ===== 3.7 Choosing parameters and enforcing the budget. <choosing-parameters-and-enforcing-the-budget.>
  Equations (3.9) and (3.14) give explicit bounds that approach one in the stated order of parameter choices.
    More precisely, first choose $delta$ small to make the limiting value of $kappa$ close to one.
    Next choose $M$ large so that $p_0^(- 1)$ is close to one,
    and then choose $T_1$ large so that $alpha$ and $beta$ are small.
    With these constants fixed, choose $gamma$ small enough to control both the last term of $B_(upright("far"))$
    and the term $Q gamma \/ p_0$ in $B_(upright("near"))$. Finally choose $g$ small enough to control all
    square-root terms and $rho$ in Equation (3.7). All constants may be rational, and all sufficiently small $g =
    1 \/ Delta$ with even $Delta$ satisfy the resulting strict bounds. In particular, arrange
  $ rho < 1 / 2 \, wide frac(max { B_(upright("far")) \, B_(upright("near")) }, 1 - rho) lt.eq 1 + eta . $
  Reject a star-rounding outcome outside $cal(G)$ and repeat.
    For the purpose of the preceding unconditional analysis, the subsequent bundle rounding can be imagined on
    every outcome. Let $tilde(V)_j$ denote the resulting nearest-unit cost.
    Its nonnegativity, rather than any independence from $cal(G)$, gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ bb(E) \[ tilde(V)_j divides cal(G) \] lt.eq frac(bb(E) tilde(V)_j, bb(P) \( cal(G) \)) lt.eq \( 1 + eta \)
     V_j . $ <eq:prep-cost-final>]
  The already established supply and opening bounds hold on every accepted outcome.
  The split representation, star list, and number of pair updates are polynomial in the input size.
    Pair updates and subset choices use rational probabilities and rational linear operations.
    Their encodings have polynomial bit length: each weighted update introduces only ratios of integer weights
    bounded by $\| cal(S) \|$, and there are polynomially many updates;
    the subsequent rescalings divide by the rational masses $p_s$.
    Exact rational sampling has expected polynomial running time.
    The acceptance probability is at least one half, so rejection multiplies the expected running time by at most
    two. This proves the theorem. ◻
]

== 4 A finite inequality for the drift <sec:inequality>

The cost analysis uses an inequality on a finite probability space. Its comparison matrix need not be symmetric.
  The proof allows a positive contribution at one index only by charging indices with smaller values;
  the negative contributions at those indices pay the entire charge.

The statement below is independent of the rounding construction.
  Section 5 will apply it to normalized client distances and directed edge probabilities;
  Equation (5.27) records that substitution. We prove the finite statement first so that the geometric analysis
  can use it as a single input.

For $0 lt.eq x lt.eq 1$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ A \( x \) & = 1 + 2 integral_0^1 \( 1 - e^(- t x) \) thin d t \, & P \( x \) & =
   integral_0^1 t e^(- t x) thin d t \,\
B \( x \) & = 2 P \( x \) \, & m \( x \) & = A \( x \) - 1 - 2 x P \( x \) . $ <eq:analytic-coefficients>]

We suppress the argument $x$ when it is fixed. Differentiation under the integral gives $A' =
  B$ and $A'' \( x \) = - 2 integral_0^1 t^2 e^(- t x) thin d t < 0$.
  In particular, $0 < P lt.eq 1 \/ 2$ and $m gt.eq 0$, the latter by concavity and $A \( 0 \) = 1$.
  Integration by parts also gives

#[#set math.equation(numbering: n => "(4.2)")
 $ \( 1 + x \) \( A - 1 \) = 2 x \( 1 - P \) \, wide \( 1 + x \) A + x B - 1 = 3 x \, wide A \( 1 \) = 1 + 2 /
   e . $ <eq:analytic-identities>]

These identities hold at $x = 0$ as well, using the integral definitions.

#thm([Theorem 4.1.])[
  (Finite comparison inequality).  #emph[Let $I$ be a finite index set with probability weights
    $\( pi_i \)_(i in I)$, and let $D_i gt.eq 0$ satisfy $bb(E)_i D_i = 1$.
    Both $bb(E)_i$ and $bb(E)_t$ denote expectation with these weights;
    in a double expectation the two indices are sampled independently.
    Fix $0 lt.eq x lt.eq 1$ and $0 < y lt.eq 1$, and set
$ Theta = frac(P \( y - x \)^2, y) . $

 Suppose $q_(t i) in \[ 0 \, 1 \]$ and $R_i gt.eq 0$ satisfy
#[#set math.equation(numbering: n => "(4.3)")
 $ R_i \( 1 - P q_(t i) \) lt.eq D_i + D_t wide upright("whenever ") q_(t i) < 1 . $ <eq:finite-comparison>]

 No symmetry is assumed for $q$. For any $s_i in \[ 0 \, 1 \]$, put $r_i = bb(E)_t q_(t i)$ and $C_i = 1 - P s_i$. Then
#[#set math.equation(numbering: n => "(4.4)")
 $ bb(E)_i #scale(x: 180%, y: 180%)[\[] & C_i \( 1 - r_i \) R_i +
   r_i { m D_i + \( 2 - s_i \) P y \( D_i + 1 \) } - C_i \( D_i + 1 \)\
 & #h(12mm)  - bb(E)_t \( 1 - q_(t i) \) #scale(x: 120%, y: 120%)[\(] D_t - \( 1 + m + 2 P y \) D_i
   #scale(x: 120%, y: 120%)[\)]_(+) #scale(x: 180%, y: 180%)[\]] lt.eq 2 Theta . $ <eq:finite-inequality>]

 Here $u_(+) = max \( u \, 0 \)$.]
] <thm:finite-inequality>

The proof will bound each positive row by charges sent to indices with smaller $D$ values,
  then show that those receiving rows pay all incoming charges.
  The scalar estimates below locate the positive rows, bound the largest value they can charge,
  and certify the required negative contributions. Every terminating decimal denotes an exact rational number.

#thm([Lemma 4.2.])[
  (Scalar bounds).  #emph[Fix $x in \[ 0 \, 1 \]$, put $X = 1 - x$, and take $0 lt.eq w lt.eq X$ and $s in { 0 \,
    1 }$. Use the functions in Equation (4.1), and define
#[#set math.equation(numbering: n => "(4.5)")
 $ z & = P w^2 \, & b & = \( 2 - s \) P \( x + w \) \, & a & = A + 2 P w \, & C & = 1 - P s \,\
d_0 & = .52 \, & d_1 & = .4 \, & H_0 & = .394 - .42 X^2 + .04 X^3 \, & H_1 & = .25 \,\
J_s & = C H_s \, & k_s & = \( 1 - s \) frac(1 - sqrt(1 - P), 1 + sqrt(1 - P)) . $ <eq:scalar-parameters>]

 For $q \, r in \[ 0 \, 1 \]$, set
#[#set math.equation(numbering: n => "(4.6)")
 $ psi \( q \) & = frac(1 - q, 1 - P q) \, & kappa_s \( q \) & = C psi \( q \) - \( 1 - q \) \,\
K \( r \) & = C - k_s - b r + 1.6 z \, & L \( r \) & = \( C - m - b \) r + .4 z \,\
M \( r \) & = \( 1 - r \) a + C P r \, & G \( r \) & = M \( r \) - L \( r \) . $ <eq:scalar-functions>]

 Then the following five bounds hold on the indicated domains:
#[#set math.equation(numbering: n => "(4.7)")
 $ m + b - frac(.4 z, r) & lt.eq frac(C \( 1 - P \), 1 - P r) &  & \( 0 < r lt.eq 1 \) \,\
L \( r \) gt.eq 0 \, wide K \( r \) > 0 \, wide K \( r \) & gt.eq d_s G \( r \) &  & \( 0 lt.eq r lt.eq 1 \) \,\
#scale(x: 120%, y: 120%)[\(] \( J_s - b \) r + 1.6 z #scale(x: 120%, y: 120%)[\)]
  M \( r \) + \( C - k_s - J_s r \) L \( r \) & gt.eq 0 &  & \( 0 lt.eq r lt.eq 1 \) \,\
C - k_s + 1.6 z - b q + .52 #scale(x: 120%, y: 120%)[\(] k_s -
  kappa_s \( q \) #scale(x: 120%, y: 120%)[\)] & gt.eq H_0 &  & \( 0 lt.eq q lt.eq 1 \) \,\
C - k_s + 1.6 z - b & gt.eq .25 . $ <eq:scalar-first>]

]
] <lem:scalar-bounds>

#proof[
  The scalar bounds are proved in Appendix 7 by analytic reductions and exact polynomial certificates. ◻
]

#proof[
  We may discard indices of probability zero. The proof treats the quantities with a fixed second index $i$ as a
    row, with $t$ indexing its columns.
  ===== 4.1 Reduction of the parameters. <reduction-of-the-parameters.>
  For fixed $x \, D \, q \, R \, s$, the left side of Equation (4.4) is nondecreasing in $y$.
    The coefficient of its linear $y$ term is nonnegative, and increasing $y$ decreases the positive part that is
    subtracted. Replace $y$ there by $max \( x \, y \) = x + w$, where $0 lt.eq w lt.eq X = 1 - x$, and put $z =
    P w^2$. If $y < x$, then $z = 0 lt.eq Theta$; otherwise $z = P \( y - x \)^2 lt.eq Theta$, since $y lt.eq 1$.
    It is therefore sufficient to bound the modified left side by $2 z$.
  This modified left side is affine separately in every $s_i$, and its hypotheses do not constrain $s_i$.
    Its maximum over $\[ 0 \, 1 \]^I$ is attained with every $s_i in { 0 \, 1 }$. Fix such a choice.
    For each row use the notation of Lemma 8, with $s = s_i$, and temporarily suppress the row subscript.
    Write $D = D_i$, $R = R_i$, $q = q_(t i)$, $Z = D_t$, and $r = bb(E)_t q_(t i)$, and put
  $ U = m D + b \( D + 1 \) . $
  Notice that $a = 1 + m + 2 P \( x + w \)$. Define the row contribution
  #[#set math.equation(numbering: n => "(4.8)")
   $ F = C \( 1 - r \) R + U r - C \( D + 1 \) - bb(E)_t \( 1 - q \) \( Z - a D \)_(+) - \( .4 D + 1.6 \) z .
     $ <eq:row-contribution>]
  Because $bb(E)_i D_i = 1$, proving $bb(E)_i F_i lt.eq 0$ proves the desired bound $2 z$.
  ===== 4.2 A centered majorant for each row. <a-centered-majorant-for-each-row.>
  For $s = 0$, direct maximization gives
  $ kappa_0 \( q \) = frac(P q \( 1 - q \), 1 - P q) lt.eq frac(1 - sqrt(1 - P), 1 + sqrt(1 - P)) = k_0 . $
  For $s = 1$, one has $kappa_1 \( q \) = - P \( 1 - q \)^2 \/ \( 1 - P q \) lt.eq 0 = k_1$. Also
  #[#set math.equation(numbering: n => "(4.9)")
   $ psi \( q \) = 1 - q + P q psi \( q \) lt.eq 1 - q + P q \, $ <eq:psi-bound>]
  since $psi \( q \) lt.eq 1$.
  Equation (4.3) implies $\( 1 - q \) R lt.eq psi \( q \) \( D + Z \)$ when $q < 1$.
    This last inequality also holds when $q = 1$, as both sides are zero.
    Using $\( Z - a D \)_(+) gt.eq Z - a D$ in Equation (4.8) gives
  $ F lt.eq bb(E)_t #scale(x: 120%, y: 120%)[\[] & U q + D { C psi \( q \) + a \( 1 - q \) -
    C } - \( .4 D + 1.6 \) z - C + kappa_s \( q \) Z #scale(x: 120%, y: 120%)[\]] . $
  The centering identity
  $ bb(E)_t \[ kappa_s \( q \) Z \] = k_s - bb(E)_t \[ \( k_s - kappa_s \( q \) \) Z \] $
  uses $bb(E)_t Z = 1$. Thus, defining the explicit function
  #[#set math.equation(numbering: n => "(4.10)")
   $ I_s \( D \; q \, Z \) =  & \[ m D + b \( D + 1 \) \] q + D { C psi \( q \) + a \( 1 - q \) - C }\
 & - \( .4 D + 1.6 \) z - C + k_s - \( k_s - kappa_s \( q \) \) Z \, $ <eq:centered-integrand>]
  we have
  #[#set math.equation(numbering: n => "(4.11)")
   $ F_i lt.eq bb(E)_t I_(s_i) \( D_i \; q_(t i) \, D_t \) . $ <eq:centered-row-bound>]
  The replacement of $k_s Z$ by $k_s$ is made only under expectation.
    Subsequent pointwise bounds will concern the function in Equation (4.10).
  Since $k_s - kappa_s \( q \) gt.eq 0$ and $Z gt.eq 0$, dropping the last term and using Equation (4.9) yields
  #[#set math.equation(numbering: n => "(4.12)")
   $ I_s \( D \; q \, Z \) lt.eq D G \( q \) - K \( q \) . $ <eq:pointwise-linear-majorant>]
  Both $G$ and $K$ are affine in their argument, so averaging gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ F lt.eq D G \( r \) - K \( r \) . $ <eq:row-linear-majorant>]
  ===== 4.3 Charges issued by positive rows. <charges-issued-by-positive-rows.>
  If $r = 0$, then $q = 0$ at every column and averaging Equation (4.3) gives $R lt.eq D + 1$.
    Equation (4.8) then gives $F lt.eq 0$. Consequently a row with $F > 0$ has $r > 0$.
    By Equations (4.7) and (4.13), it also has
  #[#set math.equation(numbering: n => "(4.14)")
   $ G \( r \) > 0 \, wide D > frac(K \( r \), G \( r \)) gt.eq d_s . $ <eq:positive-row-location>]
  In this row put
  $ U' = frac(U r - \( .4 D + 1.6 \) z, C r) . $
  The identity
  $ U' = frac(D + 1, C) (m + b - frac(.4 z, r)) - m / C - frac(1.2 z, C r) $
  and Equation (4.7) imply
  #[#set math.equation(numbering: n => "(4.15)")
   $ U' lt.eq frac(\( D + 1 \) \( 1 - P \), 1 - P r) . $ <eq:positive-row-uprime>]
  On the other hand, discarding the nonpositive hinge term in Equation (4.8) gives $F \/ C lt.eq \( 1 - r \) R +
    r U' - \( D + 1 \)$. If $R lt.eq \( D + 1 \) \/ \( 1 - P r \)$,
    Equation (4.15) makes this upper bound nonpositive. Therefore
  #[#set math.equation(numbering: n => "(4.16)")
   $ R > frac(D + 1, 1 - P r) \, wide U' lt.eq R \( 1 - P \) . $ <eq:positive-row-radius>]
  In particular $r = 1$ is impossible for a positive row, since Equation (4.15) would then give $U' lt.eq D + 1$.
  For every column with $q < 1$, Equations (4.3) and (4.16) now give
  $ \( 1 - q \) R + q U' lt.eq R \( 1 - P q \) lt.eq D + Z . $
  For $q = 1$, the excess of the left side over $D + Z$ is exactly $U' - D - Z$.
    Using $bb(E)_t Z = 1$ and again discarding the nonpositive hinge term, we obtain
  #[#set math.equation(numbering: n => "(4.17)")
   $ F lt.eq C bb(E)_t #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ q = 1 }) \( U' - D - Z \)_(+)
     #scale(x: 120%, y: 120%)[\]] lt.eq C bb(E)_t \( U' - D - Z \)_(+) . $ <eq:positive-row-excess>]
  This treats the unconstrained columns with $q = 1$ explicitly.
  It remains to bound the largest value to which this row can charge. An exact rearrangement gives
  $ U' - D = frac(b r - 1.6 z - L \( r \) D, C r) . $
  Set $T = \( J_s - b \) r + 1.6 z$. The expression in Equation (4.7) is
  #[#set math.equation(numbering: n => "(4.18)")
   $ T M \( r \) + \( C - k_s - J_s r \) L \( r \) = T G \( r \) + K \( r \) L \( r \) gt.eq
     0 . $ <eq:charge-scalar-rearrangement>]
  Using $L \( r \) gt.eq 0$ and Equation (4.14), we conclude that
  $ b r - 1.6 z - L \( r \) D lt.eq b r - 1.6 z - frac(L \( r \) K \( r \), G \( r \)) lt.eq J_s r . $
  Thus $U' - D lt.eq H_s$. Since $C lt.eq 1$, Equation (4.17) proves
  #[#set math.equation(numbering: n => "(4.19)")
   $ F_i lt.eq bb(E)_t \( H_(s_i) - D_t \)_(+) wide \( F_i > 0 \) . $ <eq:outgoing-charge>]
  The function $H_0$ decreases from $.394$ to $.014$ on $\[ 0 \, 1 \]$, and $H_1 = .25$.
    Consequently every nonzero charge in Equation (4.19) goes to an index with $D_t < .394$.
    This separates every possible receiving index from all positive rows, which have $D_i > d_(s_i) gt.eq .4$.
    It remains to prove that the negative contribution of each receiving row covers the total charge it receives.
  ===== 4.4 Negative rows cover the incoming charges. <negative-rows-cover-the-incoming-charges.>
  Put $c_(*) = .394$ and define
  $ cal(P) = { i : F_i > 0 } \, wide cal(S) = { i : D_i lt.eq c_(*) } \, wide Gamma_(i t) =
    upright(bold(1))_({ i in cal(P) }) \( H_(s_i) - D_t \)_(+) . $
  Equation (4.14) shows that $cal(P) ∩ cal(S) = diameter$, because $d_s gt.eq .4 > c_(*)$.
    We claim that every $i in cal(S)$ satisfies
  #[#set math.equation(numbering: n => "(4.20)")
   $ F_i + bb(E)_t Gamma_(t i) lt.eq 0 . $ <eq:incoming-charge>]
  Fix such an $i$ and a column $t$. Hold $q = q_(t i)$, $Z = D_t$, the two types $s_i \, s_t$, and $chi =
    upright(bold(1))_({ F_t > 0 })$ fixed. As a function of a variable $D in \[ 0 \, c_(*) \]$,
  $ I_(s_i) \( D \; q \, Z \) + chi \( H_(s_t) - D \)_(+) $
  is convex: the first term is affine and the second is a positive part multiplied by a nonnegative constant.
    It suffices to bound this expression at $D = 0 \, c_(*)$.
    This check concerns the explicit majorant; it does not require the comparison hypothesis to remain valid when
    the variable $D$ changes.
  At $D = c_(*)$, the incoming charge is zero. By Equation (4.12),
    the remaining term is at most $c_(*) G \( q \) - K \( q \) lt.eq 0$.
    Indeed, if $G \( q \) < 0$, use $K \( q \) > 0$; otherwise use $K \( q \) gt.eq
    d_(s_i) G \( q \)$ and $c_(*) < d_(s_i)$.
  At $D = 0$, Equation (4.10) reads
  $ I_(s_i) \( 0 \; q \, Z \) = b q - 1.6 z - C + k_s - \( k_s - kappa_s \( q \) \) Z \, $
  where the unindexed scalar parameters belong to row $i$. If $chi = 1$ and $s_t = 0$,
    the positive donor row $t$ satisfies $Z = D_t > d_0 = .52$.
    Since $k_s - kappa_s \( q \) gt.eq 0$, Equation (4.7) gives $I_(s_i) \( 0 \; q \, Z \) lt.eq - H_0$,
    which covers its incoming charge. In the other cases the charge is either zero or $H_1 = .25$.
    Equation (4.7), together with $q lt.eq 1$, gives
  $ I_(s_i) \( 0 \; q \, Z \) lt.eq b - 1.6 z - C + k_s lt.eq - .25 \, $
  which covers these cases as well. Convexity proves the pointwise bound throughout $\[ 0 \, c_(*) \]$.
    Apply it at $D = D_i$ and average over $t$ in Equation (4.11) to obtain Equation (4.20).
  Finally, the incoming charge is $Gamma_(t i)$ by definition,
    and exchanging the two finite sums requires no symmetry of $q$.
    Equation (4.19) bounds all positive rows by their outgoing charges;
    Equation (4.20) makes all receiving rows pay their incoming charges;
    all other rows have nonpositive contribution. Every nonzero $Gamma_(i t)$ has $i in cal(P)$ and $t in cal(S)$.
    Exchanging the two indices in the finite sum with weights $pi_i pi_t$ therefore gives
  $ bb(E)_i F_i lt.eq bb(E)_(i \, t) Gamma_(i t) - bb(E)_(i \, t) Gamma_(t i) = 0 . $
  This proves the stronger bound $2 z$ after the parameter reduction and, since $z lt.eq Theta$,
    proves Equation (4.4). ◻
]

== 5 Tapered iterative rounding <sec:rounding>

This section rounds a sufficiently fine grid solution. The graph used for rounding gives every active copy one
  unit of possible incoming erasers. Its distance-dependent taper makes the opening that accompanies an erasure
  comparable to the client’s surviving candidates. A potential that retains some cheap candidates after an opening
  converts this comparison into an application of Theorem 7.

#thm([Theorem 5.1.])[
  (Rounding a grid solution).  #emph[For every fixed $tau >
    0$ and all sufficiently large constant integers $Delta$, put $g = 1 \/ Delta$.
    Suppose a finite rational metric instance has openings $tilde(y)_i in \[ 0 \, 1 \] ∩ g bb(Z)$ of total mass $M
    gt.eq 1$. For a client $j$, let $V_(j \, 0)$ be the cost of its nearest unit of this mass.
    There is a constant $C = C \( tau \, Delta \)$ and a randomized algorithm of expected polynomial running time
    that outputs a set $O$ of facilities with
$ \| O \| lt.eq M + C \, wide bb(E) d \( j \, O \) lt.eq \( 1 + 2 \/ e + tau \) V_(j \, 0) quad
  upright("for every client ") j . $

 All parameters and the additive constant are independent of the instance.
   In particular, an initial mass at most $k + c_0$, for a fixed constant $c_0$, gives at most $k + c_0 +
   C$ facilities. The deterministic implementation of the resulting total-cost guarantee is given in Section 6.]
] <thm:grid-rounding>

We prove the theorem using the functions $A \, P \, B \, m$ defined in the preceding section.
  Thus $B \( x \) = 2 P \( x \) = A' \( x \)$ and $m \( x \) = A \( x \) - 1 - x B \( x \)$. We use, in particular,

#[#set math.equation(numbering: n => "(5.1)")
 $ 0 < B \( x \) lt.eq 1 \, wide B \( x \) gt.eq 2 P \( 1 \) > 0 \, wide m \( x \) gt.eq 0 \,\
\( 1 + x \) A \( x \) + x B \( x \) - 1 = 3 x wide \( 0 lt.eq x lt.eq 1 \) . $ <eq:rnd-function-identities>]

The identities and derivative bounds used below follow directly from the defining integrals.
  Constants implicit in $O_Delta \( dot.op \)$ may depend on $Delta$, but not on the instance, the round,
  or the subsequent heavy-source threshold.

=== 5.1 The graph and the physical process <the-graph-and-the-physical-process>

The source-opening and neighbor-erasure operation follows the framework of Byrka et
  al. #cite(label("ByrkaEtAl2026")) Definitions 3.2 and 5.1.
  We specify the graph, taper, and batches here because their precise properties will be used in the sub-two drift
  analysis.

Represent each opening by active copies of mass $g$, grouped by facility.
  Each group has at most $Delta$ active copies. Co-located facilities introduced by earlier splitting may remain
  distinct groups throughout the process; they can be merged in the output.
  A group always means one such labeled facility group, rather than an entire zero-distance class.
  An integral group has exactly $Delta$ copies.

Fix a small time step $ell > 0$ and a large time horizon $Lambda$.
  There are $T = ceil.l Lambda \/ ell ceil.r$ rounds. At the start of round $r in { 0 \, dots.h \, T -
  1 }$ let $xi = r ell$ and $x = e^(- xi)$. For that round choose a fixed rational number $hat(P)$ satisfying

#[#set math.equation(numbering: n => "(5.2)")
 $ 0 < hat(P) lt.eq 1 / 2 \, wide \| hat(P) - P \( x \) \| lt.eq zeta \, wide 0 < zeta < 1 /
   4 . $ <eq:rnd-taper-approximation>]

The finitely many rational approximations may be fixed in advance. The analytic value $x$ is used only in the analysis.

For each active target copy $i$, independently of the other targets conditional on the current state,
  choose a set $cal(H)_i$ of exactly $Delta$ active source copies.
  If the colocated active mass is below one, choose $N_i > 0$ minimally so that

#[#set math.equation(numbering: n => "(5.3)")
 $ q_(h i) = min {1 \, frac(\( 1 - d \( i \, h \) \/ N_i \)_(+), hat(P))} \, wide sum_h g q_(h i) = 1 \,
   $ <eq:rnd-edge-marginals>]

and give $cal(H)_i$ these marginals. Such a radius exists:
  the sum is continuous and nondecreasing in the positive radius, starts below one,
  and reaches the total active mass at a finite radius. This last observation also handles total active mass
  exactly one. The equation is piecewise linear in $1 \/ N_i$.
  Fixed-sum rounding realizes the marginals since their unscaled sum is the integer $Delta$.

If the colocated active mass is already at least one, set $N_i = 0$ and choose $Delta$ colocated copies,
  including every active copy in the target’s own group. Any fixed such choice suffices in this case;
  denote its marginals by $q_(h i)$ as well. In either case every own-group copy belongs to $cal(H)_i$ with
  certainty, and

#[#set math.equation(numbering: n => "(5.4)")
 $ N_i \( 1 - hat(P) q_(h i) \) & lt.eq d \( i \, h \) &  & upright("if ") q_(h i) < 1 \,\
d \( i \, h \) & lt.eq N_i \( 1 - hat(P) q_(h i) \) &  & upright("if ") q_(h i) > 0 . $ <eq:rnd-taper-comparison>]

For $N_i > 0$ these statements follow from the three cases of the clipped linear formula; for $N_i =
  0$ all sources of positive marginal are colocated. Define the out-set of source $h$ by

$ E_h = { i : h in cal(H)_i } . $

A full update at $h$ erases $E_h$ and opens the facility of $h$.

We use balanced and biased unbalanced batches, with forced openings for large updates,
  as in the approach of Byrka et al. #cite(label("ByrkaEtAl2026")) Algorithms 4–5 and Section 5.4.
  The exact batch and chunk rules below are part of our construction.
  To implement many updates while controlling the total opening mass, put

$ u_h = 1 - g \| E_h \| \, wide cal(Z) = { h : u_h = 0 } \, quad cal(P) = { h : u_h > 0 } \, quad cal(N) = { h :
  u_h < 0 } . $

Every target has $Delta$ incoming sources, so $sum_h u_h = 0$. Write

#[#set math.equation(numbering: n => "(5.5)")
 $ A_(*) = sum_(h in cal(P)) u_h = sum_(h in cal(N)) \| u_h \| \, wide \| cal(P) union cal(N) \| lt.eq
   2 A_(*) \/ g . $ <eq:rnd-balance-size>]

The last inequality uses that each nonzero $u_h$ is a nonzero multiple of $g$.
  Choose a further small constant $b_(*) > 0$, to be fixed last, and put

$ B_(*) = max { 1 \, b_(*) A_(*) } . $

A source is #emph[heavy] if $g \| E_h \| > B_(*)$. Force open the facilities of all heavy sources,
  whether or not any random update is triggered.

All random choices and erasure sets in a round refer to its pre-round graph and active copies.
  Set $p_(*) = 2 ell g$, and fix a small bias $0 < phi.alt lt.eq 1$.
  Flip an independent fair coin to choose one of the following two types of round.

+ In a balanced round, propose each $h in cal(Z)$ independently with probability $p_(*)$.
  Select a proposed source only if no other proposed source has an out-set intersecting its out-set.
+ In an unbalanced round, select sources of $cal(P)$ independently with probability $p_(*)$,
  and nonheavy sources of $cal(N)$ independently with probability $p_(*) \( 1 + phi.alt \)$.
  For each heavy source, partition its out-set into chunks of mass at most $B_(*) +
  1$ and trigger each chunk independently with probability $p_(*) \( 1 + phi.alt \)$.
  A triggered chunk erases just that chunk; its source facility is already included among the forced openings.

All probabilities are at most one for the parameter choices below.
  Take the union of the selected full out-sets and triggered chunks and erase it.
  Then reset each forced or selected facility to $Delta$ active copies.
  Copies removed by either erasure or reset are distinct from the regenerated copies.

Two invariants are useful. First, an integral target group’s own $Delta$ copies exhaust each of its incoming sets.
  Therefore an erasure of an integral group is caused by one of its own sources;
  that source either is selected or is heavy. The group is reset in either case.
  Thus integral facilities persist, including when other facilities are colocated with them.
  Second, every erasure has an associated selected or forced opening.
  Hence total active mass always stays at least one. The construction of the next round’s graph is consequently
  well defined.

=== 5.2 The opening-count bound <the-opening-count-bound>

We first bound the number of facilities independently of connection cost.
  The next lemma controls the total active mass with high probability;
  completion will later turn that mass bound into a facility-count bound.

#thm([Lemma 5.2.])[
  (Constant additive count).  #emph[Fix $g \, phi.alt \, ell \, T$ as above,
    with $ell$ sufficiently small as a function of $Delta$ and $phi.alt$.
    For every fixed $eta > 0$, one can choose $b_(*) > 0$ and a constant $C$ such that the final active mass is at
    most $M + C$ with probability at least $1 - eta$. The bound holds uniformly over all starting states of total
    mass $M$.]
] <lem:rnd-count>

#proof[
  Condition on the entire pre-round state and its realized graph.
    Write $A = A_(*)$, $B = B_(*)$, $p = p_(*)$, and $m_h = g \| E_h \|$ for this proof.
    If $n$ is the number of active copies, then $sum_h m_h = n$.
    Each source in the zero class has $m_h = 1$, so removing that class gives
  $ sum_(h in cal(P) union cal(N)) m_h = \| cal(P) union cal(N) \| . $
  Every heavy source lies in $cal(N)$ because $B gt.eq 1$. If $H$ is their number, then
  #[#set math.equation(numbering: n => "(5.6)")
   $ H lt.eq frac(\| cal(P) union cal(N) \|, B) lt.eq frac(2 A, g max { 1 \, b_(*) A }) lt.eq
     frac(2, g b_(*)) . $ <eq:rnd-heavy-count>]
  Thus forced resets add at most a constant mass. If $A = 0$,
    there are no heavy sources and the same conclusions hold directly.
  In a balanced round, the selected erasure sets are disjoint and each has mass one.
    Opening one facility for each selected source adds at most one unit per set,
    so there is no mass increase except the forced allowance.
  For an unbalanced round index the ordinary selections and heavy chunks by actions $e$.
    Let $I_e$ be the trigger indicator, $S_e$ its erased set, $m_e = g \| S_e \|$, and $a_e =
    1$ for an ordinary selection or $0$ for a chunk. Resetting facilities adds at most one unit per ordinary
    selection in addition to the forced allowance. More explicitly, the change in active mass is at most
  $ H + sum_e a_e I_e - g lr(|union.big_(e : I_e = 1) S_e|) . $
  The union is a set of pre-round copy identities. A reset may remove additional old copies outside this union,
    which only decreases the change. Counting a selected or forced group more than once likewise only enlarges the
    upper bound. Truncated inclusion–exclusion bounds the erased union from below.
    Consequently the mass increase, apart from forcing, is at most
  #[#set math.equation(numbering: n => "(5.7)")
   $ Z_(*) = sum_e I_e \( a_e - m_e \) + sum_(e < f) g \| S_e ∩ S_f \| I_e I_f . $ <eq:rnd-count-statistic>]
  This remains an upper bound when several selected copies have the same facility or when a selected facility was
    also forced.
  Chunking preserves total erasure mass. There are $\| cal(P) union cal(N) \| - H$ ordinary actions, and hence
  #[#set math.equation(numbering: n => "(5.8)")
   $ sum_e \( m_e + a_e \) = 2 \| cal(P) union cal(N) \| - H lt.eq 4 A \/ g . $ <eq:rnd-action-total>]
  The expectation of the linear part of (5.7) is exactly
  $ p A - p \( 1 + phi.alt \) A - p \( 1 + phi.alt \) H lt.eq - p phi.alt A . $
  The last term pays for the absence of a new opening in a chunk action.
    Each target belongs to at most $Delta$ action sets, even after chunking. Therefore
  $ sum_(e < f) g \| S_e ∩ S_f \| lt.eq frac(Delta - 1, 2) sum_e m_e . $
  Independence of the indicators bounds the overlap expectation by $O \( p^2 Delta A \/ g \)$.
    Since $p = 2 ell g$, taking $ell$ small enough relative to $phi.alt$ and $Delta$ gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ bb(E) Z_(*) lt.eq - p phi.alt A \/ 2 . $ <eq:rnd-count-mean>]
  Flipping coordinate $I_e$ changes $Z_(*)$ in absolute value by at most $a_e + Delta m_e$.
    The Efron–Stein independent-coordinate variance inequality #cite(label("BBLM2005")) Section 2.2,
    Proposition 1, the bound $a_e + m_e lt.eq B + 2$, and (5.8) give
  #[#set math.equation(numbering: n => "(5.10)")
   $ "Var" Z_(*) lt.eq O \( p Delta^2 \) sum_e \( a_e + m_e \)^2 lt.eq
     O \( p Delta^2 \) \( B + 2 \) A \/ g . $ <eq:rnd-count-variance>]
  If $A > 1 \/ b_(*)$, then $B = b_(*) A > 1$. Combining (5.9) and (5.10) yields
  #[#set math.equation(numbering: n => "(5.11)")
   $ bb(P) \( Z_(*) > 0 \) lt.eq O #h(-0.16667em) (frac(Delta^2 b_(*), p phi.alt^2 g)) . $ <eq:rnd-count-failure>]
  If instead $A lt.eq 1 \/ b_(*)$, there are at most $2 \/ \( g b_(*) \)$ ordinary sources in the nonzero classes.
    The actual positive mass change is then bounded deterministically by this constant plus the forced allowance;
    a deterministic bound on the quadratic statistic is unnecessary.
  Choose $b_(*)$ sufficiently small that the union bound for (5.11) over the $T$ rounds is at most $eta$.
    On the complementary event the total increase is at most, for example, $4 T \/ \( g b_(*) \)$.
    This proves the lemma with a constant $C$. The proof was conditional on every state and graph,
    so the same union bound applies to the adaptive sequence of rounds. ◻
]

For later use, the mean and variance of $Z_(*)$ depend only on indicator moments through degree four,
  since $Z_(*)$ is a quadratic polynomial. The probability bounds for balanced selections below need only first
  and second moments of their proposal indicators. These are the moment requirements used in Section 6.

=== 5.3 A persistent backup and final completion <a-persistent-backup-and-final-completion>

We next establish a persistent bound on each client’s eventual connection distance,
  including trajectories on which none of its assigned copies opens.
  This is the backup-and-completion role in iterative rounding #cite(label("ByrkaEtAl2026")) Section 3.3 and
  Lemmas 6.3 and 6.5; the following argument proves the bound for our tapered graph and reset rule.

Fix a client for the remainder of the analysis. Let $S_0$ be the $Delta$ copies in its initial nearest unit,
  chosen using any fixed tie-breaking rule. Write $d_i$ for its distance to copy $i$,

$ V_0 = sum_(i in S_0) g d_i \, wide R = max_(i in S_0) d_i . $

In particular $R lt.eq Delta V_0$.

#thm([Lemma 5.3.])[
  (Backup and completion).  #emph[Once a copy of $S_0$ is physically removed,
    an integral facility within distance $5 R$ of the client exists and persists to the end.
    At the end of the process one can retain all integral facilities and open further facilities,
    using no more than the total final active mass, so that every client is connected within its own distance $5 R$.]
] <lem:rnd-completion>

#proof[
  Consider the round of the first physical removal from $S_0$.
    Just before that round all of $S_0$ is still active. For $i \, t in S_0$, $d \( i \, t \) lt.eq d_i +
    d_t lt.eq 2 R$. At radius $2 R \/ \( 1 - hat(P) \)$, the $Delta$ copies of $S_0$ all have incoming marginal
    one for target $i$. Minimality of the taper radius gives
  $ N_i lt.eq 2 R \/ \( 1 - hat(P) \) lt.eq 4 R . $
  If $R = 0$, the zero-radius rule gives the same conclusion directly.
    An erasing source $h$ has $d \( i \, h \) lt.eq N_i$ by (5.4), and hence $d_h lt.eq 5 R$.
    Its facility is either selected or forced open. A removal by reset of $i$’s own group instead opens a facility
    within $R$. The persistence invariant proves the first assertion.
  At the end, consider the clients not already served within $5 R$ by an integral facility.
    The first assertion implies that every such client still has all its original $S_0$ copies.
    Its radius-$R$ neighborhood of active copies therefore has mass at least one.
    That neighborhood contains no integral group, since such a group would itself provide the required connection.
  Process these neighborhoods in nondecreasing order of their radii.
    Accept a neighborhood if it is disjoint from all previously accepted ones and open any facility in each
    accepted neighborhood. These disjoint neighborhoods each contain at least one unit of mass and contain no
    integral group. Their openings, together with the retained integral groups,
    therefore fit within the final active mass. If a radius-$R$ neighborhood was skipped,
    it meets an accepted radius-$R'$ neighborhood with $R' lt.eq R$.
    Through an intersection point, the distance to the accepted neighborhood’s chosen facility is at most $R +
    2 R' lt.eq 3 R$. This proves the asserted $5 R$ bound for every client, also when some radii are zero. ◻
]

At any intermediate time define $b$ to be the distance from the fixed client to its nearest integral facility,
  capped at $5 R$; when no integral facility exists use $b = 5 R$.
  By persistence and Lemma 11, the eventual completed solution has connection distance at most $b$ at every time
  on the trajectory. The cap need not already be attained by an open facility.
  It is a valid bound on the eventual connection because completion supplies $5 R$ on every trajectory.
  The quantity $b$ never increases.

=== 5.4 The potential and its single-action bounds <the-potential-and-its-single-action-bounds>

For analysis only, track an alive set $S subset.eq S_0$ of original copies.
  A physically removed copy leaves $S$ permanently, even when its facility is reset with regenerated copies.
  We also permit the additional discards specified below. Put

$ y = g \| S \| \, wide V = sum_(i in S) g d_i . $

At elapsed time $xi$, with $x = e^(- xi)$, define

#[#set math.equation(numbering: n => "(5.12)")
 $ f = a V + \( 1 - y \) b \, wide a = A \( x \) + B \( x \) \( y - x \) = 1 + m \( x \) +
   B \( x \) y . $ <eq:rnd-potential>]

The coefficient $a$ is the value at $y$ of the tangent line to the concave function $A$ at $x$;
  $x$ is a deterministic clock, while $y$ is the realized alive mass.
  Its affine dependence on $y$ makes the erasure correction quadratic in removed mass and cost,
  so the graph average of the ideal bound below requires only first and second edge moments.
  In particular $a gt.eq 1$. The initial potential is

#[#set math.equation(numbering: n => "(5.13)")
 $ f_0 = A \( 1 \) V_0 = \( 1 + 2 \/ e \) V_0 . $ <eq:rnd-initial-potential>]

If $C_j$ denotes the actual connection distance in the completed output, the preceding cap property gives

#[#set math.equation(numbering: n => "(5.14)")
 $ C_j - f_T lt.eq y_T b_T - a_T V_T lt.eq 5 R y_T . $ <eq:rnd-terminal-correction>]

The potential and every single-action bound below are $O \( R \)$ uniformly over time:
  $V lt.eq R$, $0 lt.eq y lt.eq 1$, $b lt.eq 5 R$, and $a$ is bounded.

We first freeze time and the graph. Write $B = B \( x \)$ and $b_h = min { b \, d_h }$. For a source $h in.not S$, let

$ delta_h = g \| E_h ∩ S \| \, wide Y_h = sum_(i in E_h ∩ S) g d_i . $

If only this full source update affects $S$, its removal changes the coefficient to $a -
  B delta_h$ and makes the new cap at most $b_h$. Its potential change is consequently at most

$ & \( a - B delta_h \) \( V - Y_h \) + \( 1 - y + delta_h \) b_h - f\
 & quad = delta_h b_h - a Y_h - B delta_h \( V - Y_h \) + \( 1 - y \) \( b_h - b \)\
 & quad lt.eq delta_h b_h - a Y_h - B delta_h \( V - Y_h \) . $

The same statement holds when $h$ is not alive but its group contains alive copies:
  all those copies belong to $E_h$ by the own-group edges, so its reset creates no unaccounted removal.

If an alive source $h in S$ opens, retain among the physical survivors only copies satisfying $a d_i < d_h$.
  If their mass and cost are $y' \, V'$, their new coefficient is at most $a$ and their new cap is at most $d_h$.
  Therefore

$ f' lt.eq a V' + \( 1 - y' \) d_h = d_h - sum_(i in S\
h in.not cal(H)_i) g \( d_h - a d_i \)_(+) . $

Copies satisfying equality can be discarded without changing this bound.
  Figure 1 separates physical erasure from these additional analysis discards.
  This continuation after an opening supplies the subtraction that will enter Theorem 7.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[A full update at an alive source $h in S$ opens its facility]])
  content((-4.8, -2.062), [#box(width: 4.444cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S inter E_h$#linebreak()Physically erased#linebreak()and removed from $S$]]])])
  content((0.04389, -2.062), [#box(width: 4.444cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i in S without E_h$#linebreak()with $"ad"_i<d_h$#linebreak()Physically survives#linebreak()and remains alive]]])])
  content((4.888, -2.062), [#box(width: 4.444cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i in S without E_h$#linebreak()with $"ad"_i gt.eq d_h$#linebreak()Physically survives;#linebreak()discarded from the analysis]]])])
  line((0, -0.2656), (0, -0.6656), (-4.8, -0.6656), (-4.8, -1.266), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -0.2656), (0.04389, -1.061), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -0.2656), (0, -0.6656), (4.888, -0.6656), (4.888, -1.03), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((0.04389, -4.445), [#box(width: 13.44cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[The opened facility is reset to $Delta$ active copies.#linebreak()These regenerated copies are not original identities in $S_0$ and do not enter $S$.]]])])
})],
  caption: [Figure 1: One full source update, with no simultaneous relevant action. Only the middle group contributes to the continued alive assignment. The dashed branch is an analysis discard, not a physical erasure. Positions are schematic and represent no metric geometry. ],
) <fig:survivors>

The ideal first-order bound, assigning rate $g$ to each full source update, is thus

#[#set math.equation(numbering: n => "(5.15)")
 $ cal(B) =  & sum_(h in S) g [d_h - sum_(i in S\
h in.not cal(H)_i) g \( d_h - a d_i \)_(+) - f]\
 & + sum_(h in.not S) g [delta_h b_h - a Y_h - B delta_h \( V - Y_h \)] . $ <eq:rnd-ideal-generator>]

At a fixed alive set and cap, the time derivative is

#[#set math.equation(numbering: n => "(5.16)")
 $ dot(f) = - x \( y - x \) B' \( x \) V . $ <eq:rnd-time-derivative>]

Indeed the derivative of $A \( x \) + B \( x \) \( y - x \)$ with respect to $x$ is $B' \( x \) \( y - x \)$.

=== 5.5 From the physical batch to the ideal bound <from-the-physical-batch-to-the-ideal-bound>

For the actual analysis update, first account for forced openings by removing from $S$ all copies whose groups are
  forced and updating the cap. Then apply the round’s erasures and resets.
  If a source that was alive after force removals but before these erasures was selected,
  choose one such source $h$ and discard every remaining copy with $a d_i gt.eq d_h$,
  using the pre-round value of $a$. This is purely an analysis rule and need not be computed by the algorithm.

#thm([Lemma 5.4.])[
  (Conditional batch drift).  #emph[For every pre-round history and every realized graph, the physical round,
    the above alive-set update, and the time advance satisfy
#[#set math.equation(numbering: n => "(5.17)")
 $ bb(E) \[ f_(r + 1) - f_r divides upright("history, graph") \] lt.eq ell \( dot(f) + cal(B) \) +
   O_Delta #scale(x: 120%, y: 120%)[\(] \( phi.alt + ell \) ell R #scale(x: 120%, y: 120%)[\)] . $ <eq:rnd-batch-drift>]

 Here $cal(B)$ is computed from that graph and the original pre-round alive set.
   The constants and the required upper bound on $ell$ are uniform in $b_(*)$.]
] <lem:rnd-batch>

#proof[
  First suppose no group containing an alive copy is forced.
    Call an action relevant if its ordinary source is in $S$, or its ordinary out-set or heavy chunk meets $S$.
    There are at most $Delta^2 + Delta$ relevant actions: each of at most $Delta$ alive targets has $Delta$
    incoming sources. Own-group edges ensure that this list also includes every ordinary reset that can affect $S$.
  A balanced source has an out-set of exactly $Delta$ copies.
    Every one of those copies belongs to at most $Delta$ source out-sets,
    so the number $c_h$ of potentially conflicting balanced proposals is at most $Delta^2$.
    Including the type coin, its selection marginal is
  $ 1 / 2 p_(*) \( 1 - p_(*) \)^(c_h) = ell g #scale(x: 120%, y: 120%)[\(] 1 +
    O_Delta \( ell \) #scale(x: 120%, y: 120%)[\)] . $
  An unbalanced ordinary or chunk action has marginal $ell g$ or $\( 1 + phi.alt \) ell g$.
    Any two distinct actions have joint probability $O \( ell^2 g^2 \)$;
    actions of opposite types have joint probability zero. These estimates do not assert independence of balanced
    selections after conflict filtering.
  If no relevant action occurs, only the cap can improve, so the frozen-time potential cannot increase.
    If exactly one relevant ordinary action occurs, its change is bounded by the appropriate single-source
    expression in (5.15). Unrelated selections or forced openings can only lower its cap and do not invalidate
    that upper bound. The probability of two or more relevant actions is $O_Delta \( ell^2 \)$,
    and all possible potentials and individual bounds have magnitude $O \( R \)$.
    Replacing isolated-action probabilities by marginals and their marginals by $ell
    g$ therefore costs $O_Delta \( \( phi.alt + ell \) ell R \)$.
  For a heavy source outside $S$, its forced facility makes the cap at most $b_h$ even when only one of its chunks
    triggers. Force accounting can be done before erasure accounting because no forced group in the present case
    meets $S$; it only improves the cap. Write $delta_c \, Y_c$ for the alive mass and cost removed by chunk $c$
    of this source, and $delta = sum_c delta_c$, $Y = sum_c Y_c$. Its summed single-chunk bounds satisfy
  $ sum_c \[ delta_c b_h - a Y_c - B delta_c \( V - Y_c \) \] & = delta b_h - a Y - B delta V + B sum_c delta_c Y_c\
 & lt.eq delta b_h - a Y - B delta \( V - Y \) . $
  All cross terms omitted in the last step are nonnegative.
    Consequently the chunk bounds are dominated by the full-source term used in $cal(B)$.
  The functions in the potential have uniformly bounded derivatives.
    The chance that a relevant action changes $S$ is $O_Delta \( ell \)$;
    changes of the cap alone do not affect (5.16). Advancing time thus adds at most $ell dot(f) +
    O_Delta \( ell^2 R \)$. This proves the lemma when no alive group is forced.
  Now suppose that forcing does remove alive copies. Let their total mass and cost be $delta gt.eq g$ and $Y$,
    and let $b' lt.eq b$ be the cap after force accounting. Every removed copy is in an opened facility,
    so $Y gt.eq delta b'$. At frozen time, the resulting decrease is at least
  #[#set math.equation(numbering: n => "(5.18)")
   $ f - f' & gt.eq \( a - 1 \) Y + B delta \( V - Y \) + \( 1 - y \) \( b - b' \)\
 & gt.eq B g V + \( 1 - y \) \( b - b' \) . $ <eq:rnd-force-savings>]
  For the second line, use $a - 1 = m + B y$, $m gt.eq 0$, and $y gt.eq delta gt.eq g$.
    At least one removed alive copy has distance at most $V \/ g$, so $b' lt.eq V \/ g$. With
  $ Q = V + \( 1 - y \) b \, wide D = \( 1 - y \) \( b - b' \) \, $
  we obtain
  $ Q lt.eq \( 1 + 1 \/ g \) V + D \, wide B g V + D gt.eq c_Delta Q \,\
c_Delta = min {1 \, frac(2 P \( 1 \) g, 1 + 1 \/ g)} > 0 . $
  Thus forcing supplies a fixed fraction of $Q$ as free savings.
  After force accounting, the remaining alive cost is at most $V$ and the cap is at most $V \/ g$.
    Any further frozen-time increase has magnitude $O_Delta \( V \)$,
    and a change to the alive set still has probability $O_Delta \( ell \)$.
    If the alive set does not change, the cap only improves. Subsequent actions and time advance therefore have
    expected increase at most $O_Delta \( ell Q \)$.
  For comparison with the pre-force ideal expression, we also have
  #[#set math.equation(numbering: n => "(5.19)")
   $ \| dot(f) \| + \| cal(B) \| lt.eq O_Delta \( Q \) . $ <eq:rnd-force-generator-size>]
  For inside sources, $d_h lt.eq V \/ g$. If $y < 1$, the grid gives $1 - y gt.eq g$,
    so an external cap charge is bounded using $b lt.eq Q \/ g$.
    If $y = 1$, the alive set itself is a full unit; its maximum distance is at most $V \/ g$.
    The radius argument from Lemma 11 then bounds any source erasing an alive copy within $5 V \/
    g$ of the client. Only $O_Delta \( 1 \)$ sources have nonzero contributions. These observations prove (5.19).
  Choose $ell$ sufficiently small in terms of these constants and $c_Delta$.
    The savings in (5.18) absorb both the subsequent expected increase and the possible negative quantity
    $ell \( dot(f) + cal(B) \)$. This proves (5.17) also in the forced case, without an additional error term.
    If $Q = 0$, all the quantities in this comparison vanish, so no division by $Q$ is needed.
    More explicitly, if $V = 0$ then $b' = 0$, and the force savings remove $\( 1 - y \) b$; when also $y = 1$,
    relevant source distances and all generator terms are zero.
    The argument is uniform in the later choice of $b_(*)$. ◻
]

The order of conditioning in Lemma 12 is essential. Whether a group is forced depends on the graph.
  We have proved the drift comparison for #emph[every] realized graph, in both force cases;
  we will now average that comparison over the original graph law, without conditioning the law on a forcing event.

=== 5.6 Averaging the graph and applying the finite inequality <averaging-the-graph-and-applying-the-finite-inequality>

The physical batch has now been compared with the ideal generator for every realized graph.
  We average that generator using edge marginals and cross-target second moments,
  then verify the hypotheses of the abstract finite comparison inequality.
  The resulting bound is the cost estimate that will be summed over rounds.

#thm([Lemma 5.5.])[
  (Averaged ideal drift).  #emph[Conditional on the pre-round history, the ideal expression satisfies
#[#set math.equation(numbering: n => "(5.20)")
 $ dot(f) + bb(E)_(upright("graph")) cal(B) lt.eq B g V + 12 zeta V . $ <eq:rnd-average-drift>]

]
] <lem:rnd-average>

#proof[
  The pre-round quantities $S \, y \, V \, b \, x$ are fixed throughout this proof. Define
  #[#set math.equation(numbering: n => "(5.21)")
   $ w_i & = sum_(t in S) g q_(t i) \,\
K_(i t) & = sum_(h in.not S) g q_(h i) q_(h t) \,\
s_i & = frac(sum_(h in.not S) g q_(h i)^2, 1 - w_i) quad upright("if ") w_i < 1 \, wide s_i = 0 quad
  upright("if ") w_i = 1 . $ <eq:rnd-graph-statistics>]
  We have $0 lt.eq w_i lt.eq y lt.eq 1$ and $0 lt.eq s_i lt.eq 1$. The inequality $2 u v lt.eq u^2 + v^2$ gives
  #[#set math.equation(numbering: n => "(5.22)")
   $ K_(i t) lt.eq 1 / 2 #scale(x: 120%, y: 120%)[\[] s_i \( 1 - w_i \) +
     s_t \( 1 - w_t \) #scale(x: 120%, y: 120%)[\]] . $ <eq:rnd-kernel-bound>]
  No symmetry of the directed marginals $q_(h i)$ is assumed.
  To average the positive quadratic erasure term, put $X_(h i) = upright(bold(1))_({ h in cal(H)_i })$.
    Choices for distinct targets are independent. Expanding the two removed quantities consequently gives the
    exact formula
  #[#set math.equation(numbering: n => "(5.23)")
   $ bb(E)_(upright("graph")) sum_(h in.not S) g delta_h Y_h & = sum_(i \, t in S) g^2 K_(i t) d_t +
     sum_(i in S) g^2 d_i sum_(h in.not S) g q_(h i) \( 1 - q_(h i) \)\
 & lt.eq sum_(i \, t in S) g^2 K_(i t) d_t + g V . $ <eq:rnd-diagonal-correction>]
  Here $sum_h g q_(h i) = 1$ bounds the diagonal correction.
  For the cap contribution, the external incoming mass at $i$ is $1 - w_i = \( 1 - y \) + \( y - w_i \)$.
    Split it in these proportions. On its first part use $b_h lt.eq b$, and on its second part use,
    whenever $q_(h i) > 0$,
  $ b_h lt.eq d_h lt.eq d_i + d \( i \, h \) lt.eq d_i + \( 1 - hat(P) q_(h i) \) N_i . $
  This yields
  #[#set math.equation(numbering: n => "(5.24)")
   $ sum_(h in.not S) g q_(h i) b_h lt.eq \( 1 - y \) b + \( y - w_i \) #scale(x: 120%, y: 120%)[\[]
     d_i + \( 1 - hat(P) s_i \) N_i #scale(x: 120%, y: 120%)[\]] . $ <eq:rnd-backup-average>]
  If $w_i = 1$, then $y = 1$ and both sides are zero, so the convention for $s_i$ requires no division in that case.
  For completeness, averaging (5.15) before using the cap bound gives, apart from the additive term $B g V$,
  $ & \[ 1 - \( 1 + y \) a - B y \] V - y \( 1 - y \) b\
 & quad + sum_(i in S) g sum_(h in.not S) g q_(h i) b_h + a sum_(i in S) g w_i d_i + B V sum_(i in S) g w_i +
   B sum_(i \, t in S) g^2 K_(i t) d_t\
 & quad - sum_(i \, t in S) g^2 \( 1 - q_(t i) \) \( d_t - a d_i \)_(+) . $
  The first term of (5.24), summed over $i$, cancels $- y \( 1 - y \) b$.
    The coefficient of $V$ after adding (5.16) simplifies using
  #[#set math.equation(numbering: n => "(5.25)")
   $ \( 1 + y \) a + y B + x \( y - x \) B' - 1 = 3 y + B \( y - x \)^2 . $ <eq:rnd-coefficient-identity>]
  Indeed (5.1) and its derivative give
  $ \( 1 + x \) A + x B - 1 = 3 x \, wide A + \( 2 + x \) B + x B' = 3 . $
  Expanding the left side of (5.25) in $y - x$ has these as its constant and linear coefficients,
    and has quadratic coefficient $B$.
  It follows that $dot(f) + bb(E)_(upright("graph")) cal(B) - B g V$ is at most
  #[#set math.equation(numbering: n => "(5.26)")
   $ & - \[ 3 y + B \( y - x \)^2 \] V\
 & quad + sum_(i in S) g { \( y - w_i \) #scale(x: 120%, y: 120%)[\[] d_i + \( 1 - hat(P) s_i \) N_i
   #scale(x: 120%, y: 120%)[\]] + a w_i d_i + B V w_i + B sum_(t in S) g K_(i t) d_t\
 & #h(43mm)  - sum_(t in S) g \( 1 - q_(t i) \) \( d_t - a d_i \)_(+) } . $ <eq:rnd-expanded-drift>]
  If $y = 0$, the ideal generator and time derivative are zero.
    If $y > 0$ but $V = 0$, then every $d_i$ with $i in S$ is zero.
    For any $i in S$ with $N_i > 0$, all alive sources are colocated with $i$, so $q_(t i) =
    1$ for every $t in S$ and $w_i = y$. If $N_i = 0$, its radius term already vanishes.
    Every term of (5.26) is then zero. Thus the lemma holds in these degenerate cases without normalization.
  Assume now $V > 0$, and set
  #[#set math.equation(numbering: n => "(5.27)")
   $ mu = V \/ y \, wide D_i = d_i \/ mu \, wide r_i = w_i \/ y \, wide R_i = \( 1 - 2 zeta \) N_i \/ mu \, wide
     C_i = 1 - P s_i . $ <eq:rnd-normalization>]
  Give each index $i in S$ probability $g \/ y$. Expectations over these indices, written $bb(E)_i$ and $bb(E)_t$,
    satisfy $bb(E)_i D_i = 1$ and $r_i = bb(E)_t q_(t i)$. For $q = q_(t i) < 1$, the taper approximation implies
  $ \( 1 - 2 zeta \) \( 1 - P q \) lt.eq 1 - hat(P) q \, $
  because the difference is at least $2 zeta \( 1 - P q \) - zeta q gt.eq 2 zeta \( 1 - q \) gt.eq 0$.
    The triangle inequality and (5.4) give
  #[#set math.equation(numbering: n => "(5.28)")
   $ R_i \( 1 - P q_(t i) \) lt.eq D_i + D_t wide \( q_(t i) < 1 \) . $ <eq:rnd-normalized-comparison>]
  These are precisely the radius hypotheses of Theorem 7.
  The error in changing the taper coefficient is controlled without any bound on individual normalized radii.
    Multiply the first inequality in (5.4) by $\( g \/ y \) \( 1 - q_(t i) \)$, sum over $t in S$, and use $1 -
    hat(P) q_(t i) gt.eq 1 \/ 2$ and $d \( i \, t \) lt.eq d_i + d_t$. This proves
  #[#set math.equation(numbering: n => "(5.29)")
   $ \( 1 - r_i \) N_i \/ mu lt.eq 2 \( D_i + 1 \) . $ <eq:rnd-radius-error-control>]
  Since
  $ 0 lt.eq \( 1 - hat(P) s_i \) - \( 1 - 2 zeta \) \( 1 - P s_i \) lt.eq 3 zeta \, $
  the replacement of $\( 1 - r_i \) \( 1 - hat(P) s_i \) N_i \/ mu$ by $C_i \( 1 - r_i \) R_i$ costs at most $6
    zeta \( D_i + 1 \)$, whose expectation is at most $12 zeta$.
  Divide (5.26) by $y V = y^2 mu$ and put $Theta = P \( y - x \)^2 \/ y$.
    By (5.22), the normalized kernel term is at most
  $ B bb(E)_(i \, t) K_(i t) D_t lt.eq P bb(E)_i #scale(x: 120%, y: 120%)[\[] s_i \( 1 - y r_i \) \( 1 + D_i \)
    #scale(x: 120%, y: 120%)[\]] . $
  After the radius replacement, the entire normalized expression is therefore at most
  $ - 3 - 2 Theta + bb(E)_i #scale(x: 180%, y: 180%)[\[] & \( 1 - r_i \) \( D_i + C_i R_i \) + a r_i D_i + 2 P y r_i\
 & + P s_i \( 1 - y r_i \) \( 1 + D_i \) - bb(E)_t \( 1 - q_(t i) \) \( D_t - a D_i \)_(+)
   #scale(x: 180%, y: 180%)[\]] + 12 zeta . $
  Using $a = 1 + m + 2 P y$ and $bb(E)_i D_i = 1$, this is exactly
  $ bb(E)_i #scale(x: 180%, y: 180%)[\[] & C_i \( 1 - r_i \) R_i +
    r_i { m D_i + \( 2 - s_i \) P y \( D_i + 1 \) } - C_i \( D_i + 1 \)\
 & - bb(E)_t \( 1 - q_(t i) \) \( D_t - \( 1 + m + 2 P y \) D_i \)_(+) #scale(x: 180%, y: 180%)[\]] - 2 Theta +
   12 zeta . $
  Theorem 7 bounds the expectation by $2 Theta$. Multiplication by $y V$, with $y lt.eq 1$, proves
  $ dot(f) + bb(E)_(upright("graph")) cal(B) lt.eq B g V + 12 zeta y V lt.eq B g V + 12 zeta V \, $
  as claimed. ◻
]

=== 5.7 Survival, accumulated error, and parameter choices <survival-accumulated-error-and-parameter-choices>

#thm([Lemma 5.6.])[
  (Decay of the alive mass).  #emph[For sufficiently small $ell$ depending only on $Delta$,
    every client’s analysis process satisfies
#[#set math.equation(numbering: n => "(5.30)")
 $ bb(E) y_T lt.eq \( 1 - ell \/ 2 \)^T lt.eq e^(- Lambda \/ 2) . $ <eq:rnd-survival>]

]
] <lem:rnd-survival>

#proof[
  Condition on a history, a graph, and a currently alive target.
    If its group is forced, the original target identity is removed certainly.
    Otherwise its $Delta$ incoming source copies correspond to $Delta$ distinct possible actions:
    each ordinary source gives its selection action, and each heavy source gives the unique chunk containing this
    target. The marginal and pair estimates in the proof of Lemma 12 give an erasure probability at least
  $ Delta ell g #scale(x: 120%, y: 120%)[\(] 1 - O_Delta \( ell \) #scale(x: 120%, y: 120%)[\)] -
    O \( Delta^2 ell^2 g^2 \) gt.eq ell \/ 2 . $
  Here the lower bound is the union bound with pair intersections subtracted.
    A simultaneous reset does not restore the original copy identity,
    and additional analysis discards only reduce survival. The conditional expected surviving mass is thus at most
    $\( 1 - ell \/ 2 \) y$. Iteration, starting from $y_0 = 1$, and $T ell gt.eq Lambda$ prove the lemma. ◻
]

We finish the proof of Theorem 9. First run the process without rejecting count failures,
  and complete every output by Lemma 11. Average Lemma 12 over the graph and use Lemma 13.
  Since $V lt.eq V_0$, $B lt.eq 1$, and $R lt.eq Delta V_0$, summing over $T$ rounds gives

$ bb(E) f_T lt.eq [1 + 2 \/ e + \( Lambda + 1 \) { g + 12 zeta + C_Delta Delta \( phi.alt + ell \) }] V_0 $

for a constant $C_Delta$, provided $ell lt.eq 1$. Equations (5.14) and (5.30) consequently imply the unconditional
  estimate

#[#set math.equation(numbering: n => "(5.31)")
 $ bb(E) C_j lt.eq
   [1 + 2 \/ e + 5 Delta e^(- Lambda \/ 2) + \( Lambda + 1 \) { g + 12 zeta + C_Delta Delta \( phi.alt + ell \) }]
   V_0 . $ <eq:rnd-total-error>]

All these estimates also apply when $V_0 = 0$: then $R = 0$, the completed connection cost is zero,
  and no normalization by $V_0$ is used.

Here is an explicit order of choices that avoids circular dependence. It suffices to consider $0 < tau lt.eq 1$.

+ Choose a sufficiently large constant integer $Delta$ and put $g = 1 \/ Delta$. For each such choice take, for example,
  $ Lambda = ⌈2 log \( 40 Delta \/ tau \)⌉ + 1 . $
  Then $5 Delta e^(- Lambda \/ 2) lt.eq tau \/ 8$. Taking $Delta$ sufficiently large also makes $\( Lambda + 1 \)
    g lt.eq tau \/ 8$, since $g log \( 1 \/ g \) arrow.r 0$. Any additional upper bound on $g$ required by the
    preparation stage may be imposed at the same time.
+ With $Delta \, Lambda$ fixed, choose a small positive rational $zeta$ so that $12 \( Lambda + 1 \) zeta lt.eq
  tau \/ 8$. Next choose a small positive rational $phi.alt$, and then a small positive rational $ell$, so that
  $ C_Delta Delta \( Lambda + 1 \) \( phi.alt + ell \) lt.eq tau \/ 8 . $
  Require in addition every upper bound on $ell$ used in the count, batch, and survival lemmas,
    and $p_(*) \( 1 + phi.alt \) lt.eq 1$. The batch constants are uniform in the remaining threshold $b_(*)$,
    so these requirements can be imposed before choosing that threshold.
    This fixes the constant number of rounds $T = ceil.l Lambda \/ ell ceil.r$.
+ Put $alpha = 1 + 2 \/ e$ and choose a fixed $0 < eta lt.eq tau \/ \( 4 \( alpha + tau \) \)$.
  Finally choose rational $b_(*) > 0$ as in Lemma 10 so that the final mass is at most $M +
  C$ with probability at least $1 - eta$.

The unconditional cost in (5.31) is then at most $\( alpha + tau \/ 2 \) V_0$ for every client.
  Repeat the entire process on failure of the final mass test.
  The accepted output is the unconditional output conditioned on that test,
  whose success probability is at least $1 - eta$. Since connection costs are nonnegative,

$ bb(E) \[ C_j divides upright("mass test succeeds") \] lt.eq
  frac(alpha + tau \/ 2, 1 - eta) V_0 lt.eq \( alpha + tau \) V_0 . $

Completion uses at most the final active mass, so an accepted output has at most $M + C$ facilities.
  This proves the count and cost assertions of Theorem 9.

For fixed accuracy all parameters are instance-independent constants.
  The number of current facilities never exceeds the number in the split input,
  and every group has at most $Delta$ active copies. The graph, its marginals, a fixed-sum rounding,
  the action sets, their intersections, and the greedy completion can therefore be computed in polynomial time.
  The radius equations and all physical probabilities are rational;
  the approximations in (5.2) are fixed constants. Only the analysis uses the transcendental functions or
  alive-set discards. The expected number of repetitions is at most $1 \/ \( 1 - eta \)$,
  giving expected polynomial running time. Section 6 replaces the local random choices by polynomial-size lists
  and obtains a deterministic output with the corresponding total-cost bound.

== 6 Deterministic implementation and completion <sec:derandomization>

The preceding constructions yield an additive approximation in expectation.
  We now replace their random choices by finite distributions of polynomial support,
  and then choose the least expensive feasible outcome. Throughout this section the desired approximation loss is
  fixed. In particular, the grid denominator, the number of physical rounds,
  and all parameters chosen in Theorems 5 and 9 are constants independent of the input size.
  All input distances are rational, and running time includes their encoding lengths.

=== 6.1 Compression of finite distributions <compression-of-finite-distributions>

A distribution list is a finite list of states, each equipped with a nonnegative rational weight,
  whose weights sum to one. The state records the data needed to continue a construction;
  a feature vector records the statistics whose expectations must be retained.

The next lemma is the constructive finite-dimensional Carathéodory argument for preserving an expectation.
  Its connection with moment matching is classical #cite(label("BayerTeichmann2005"));
  we include the exact elimination and its bit bound because both are needed by the algorithm.

#thm([Lemma 6.1.])[
  (Affine support reduction).  #emph[Let a distribution list have states $s_1 \, dots.h \, s_M$,
    weights $lambda_1 \, dots.h \, lambda_M$, and feature vectors $v \( s_i \) in bb(Q)^d$.
    There is an exact algorithm that replaces the weights by nonnegative rational weights supported on at most
    $d + 1$ of the same states, preserving
$ sum_(i = 1)^M lambda_i v \( s_i \) . $

 Its running time and output encoding length are polynomial in the encoding length of the given list and feature
   vectors.]
] <lem:affine-support>

#proof[
  Discard zero-weight entries. If more than $d + 1$ remain, choose a nonzero integral affine dependence $z$ satisfying
  $ sum_i z_i = 0 \, wide sum_i z_i v \( s_i \) = 0 . $
  Since its coefficients sum to zero, there are both positive and negative coefficients. Set
  $ t = min_(i : z_i > 0) lambda_i / z_i \, wide lambda'_i = lambda_i - t z_i . $
  The new weights are nonnegative, have the same sum and feature expectations,
    and include at least one additional zero. Repeating gives the support bound.
  For completeness, the rational arithmetic has polynomial complexity.
    An affine dependence can be found using at most $d + 2$ columns of the matrix with columns
    $\( 1 \, v \( s_i \) \)$. Clearing denominators and using minors gives an integral dependence of polynomial
    bit length. If $lambda_i = b_i \/ D$ for a common denominator $D$, and $j$ attains the minimum defining $t$, then
  #[#set math.equation(numbering: n => "(6.1)")
   $ lambda'_i = frac(b_i z_j - b_j z_i, D z_j) . $ <eq:compression-denominator>]
  Thus one elimination adds at most the bit length of $\| z_j \|$ to a common denominator.
    There are at most $M$ eliminations, and the feature vectors do not change.
    The resulting bit lengths and the exact linear-algebra computations are polynomially bounded. ◻
]

Support reduction preserves every property satisfied by each state in the list,
  whether or not that property appears among the features. It does not preserve the entire joint distribution or
  arbitrary future adaptive behavior. We therefore specify the retained features at each use and verify the
  required estimates for the resulting process.

=== 6.2 A distribution list for the preparation stage <a-distribution-list-for-the-preparation-stage>

Let $M_star.op$ denote the number of stars in the preparation construction,
  and write $X_e$ for the current count of star $e$. Each count remains within its original floor and ceiling.
  A weighted pair update within a strict sign preserves the weighted sum and has conditional mean equal to the
  current count vector. For every pair of distinct coordinates $e \, f$, it also satisfies

#[#set math.equation(numbering: n => "(6.2)")
 $ bb(E) \[ X'_e divides X \] = X_e \, wide bb(E) \[ X'_e X'_f divides X \] lt.eq X_e X_f . $ <eq:star-local-moments>]

Indeed, unless both coordinates are the selected pair, the product is affine in the update parameter.
  If they are the selected pair, their increments have opposite signs and the product is concave.
  A one-coordinate rounding with the correct mean preserves every distinct pair-product expectation.

These assertions hold for every admissible state and every permissible choice of the next pair.
  Thus the next pair may be selected adaptively, for example as the first two fractional coordinates in a fixed
  order. After branching one update at every state, apply Lemma 15 with the features

$ X_e quad upright("and") quad X_e X_f wide \( e < f \) . $

Induction using (6.2) preserves the initial first moments and the upper bounds on distinct pair moments.
  Full independence between the positive, negative, and zero-coefficient classes is unnecessary for these conclusions.

The weighted sums and floor/ceiling restrictions are properties of each retained state.
  Each productive pair update makes at least one fractional count integral,
  and integral counts are never updated again. There are therefore only $O \( M_star.op \)$ updates,
  with identity updates padding states that finish earlier.
  Ordinary one-coordinate rounding also handles the zero coefficients and the final positive-side fraction.
  We leave the final negative-side fraction unrounded until these operations are complete.
  Each compressed list has $O \( M_star.op^2 \)$ entries.

===== 6.2.1 The final negative-side fraction. <the-final-negative-side-fraction.>

Condition on a state of this last list. There is at most one fractional count, say $X_e = m + xi$,
  where $0 < xi < 1$. The identity of $e$ may depend on the state.
  Perform the special rounding of the preparation construction:
  use a nominal coin of mean $xi$, open the outside supplier according to $m + 1$ if its flag is one,
  and activate the extra deficit on a subset of $D_e$ with marginal $xi$ at every target.

There is a polynomial-support law for this subset. If $d_e = \| D_e \|$, choose a size

$ L in { floor.l xi d_e floor.r \, ceil.l xi d_e ceil.r } \, wide bb(E) L = xi d_e \, $

then choose a uniformly random cyclic interval of length $L$ in a fixed cyclic order of the targets.
  Each target has inclusion probability $bb(E) L \/ d_e = xi$, and the support has size at most $2 d_e$.
  Including the nominal coin changes this bound by only a constant factor.

For a fixed target, the special star’s activation count has conditional mean $X_e$;
  its nominal count has the same conditional mean. Every other star count is integral in the conditioned state.
  Consequently, for any two distinct stars activating this target,
  the conditional expectation of their activation product is the product of their current counts.
  This argument applies separately in every state, so it remains valid when the identity of the final fractional
  star varies. After averaging, the activation counts retain the nonpositive pair-covariance bounds.
  Each individual activation count remains between the original adjacent integers,
  giving its variance bound as well. No pairwise independence between different targets of this last star is
  required: the deficit estimates are made for one target at a time,
  and the clipping bound sums expectations over targets.

===== 6.2.2 Conditional rounding inside bundles. <conditional-rounding-inside-bundles.>

For each resulting outer state, clip the deficits and rescale the bundle masses exactly as in Theorem 5.
  Keep this outer state fixed while constructing a new list for all the within-bundle rounds.
  Successive pair updates and compression of all first and distinct-pair moments of the opening vector preserve
  its marginals and nonpositive covariances conditional on this outer state.
  Updates in different bundles preserve cross-bundle product expectations;
  thus their entire Cartesian product need not be enumerated.

In particular, if $eta_i$ is the rounded opening minus its conditional mean in the fixed outer state,
  then the noise on a client’s old assignment obeys

$ "Var" (sum_(i in F_j ∩ union.big_s P_s) eta_i thin mid(bar.v) thin upright("outer state")) lt.eq
  g sum_s sum_(i in F_j ∩ P_s) p'_s / p_s y_i lt.eq g \/ p_0 lt.eq 2 g . $

Here $p'_s lt.eq 1$ and $p_s gt.eq p_0 gt.eq 1 \/ 2$. This is the conditional noise estimate used in the
  preparation proof. Maintaining a separate inner list for every outer state retains this estimate despite the
  varying rescalings.

All remaining preparation estimates use the retained first and second moments,
  or properties holding in every state. In particular, supplier availability and the raw opening-count bound hold
  in each state; the clipping estimate and the probability of exceeding its count allowance follow from the same
  deficit moments. The preparation list therefore satisfies the same unconditioned cost and budget-success bounds
  as the randomized construction. Discarding budget failures and selecting a remaining grid solution of minimum
  total nearest-unit assignment cost gives the corresponding deterministic bound on the sum over clients.
  This single choice need not simultaneously attain each client’s individual expectation bound.

=== 6.3 A distribution list for each physical round <a-distribution-list-for-each-physical-round>

Fix a physical state and a round. For each target copy, first construct a small list of source sets of cardinality
  $Delta$ with the prescribed edge marginals. Use ordinary fixed-sum pair rounding:
  after each pair update, branch each current state to its at most two endpoints and immediately compress the
  resulting list while preserving first moments. Thus no full tree of a target’s pair updates is ever enumerated,
  and every intermediate list has polynomial support. All sets in this list contain the target’s own group and
  respect the edges whose prescribed marginal is zero or one.

Combine the target lists by successive independent products.
  After each product, compress while retaining every edge first moment and every product of two edge indicators
  belonging to distinct targets. On adjoining a new target independently,
  its edge products with earlier targets have the required expectations; compression then preserves them.
  Induction gives a graph list with all the first and cross-target second moments of the independent-target graph
  construction. Its feature dimension and support size are polynomial in the number of active copies.

The ideal generator in (5.15) is linear in edge indicators except for the terms $delta_h Y_h$.
  Expanding these terms gives products of edges from a common source to distinct targets,
  and diagonal terms reducible to first moments. The retained statistics therefore suffice for its graph average.
  The heavy-source rule and forced openings depend on more than these moments,
  but this introduces no extra averaging requirement: the batch drift bound (5.17) holds conditional on every
  realized graph, with that graph’s own forced openings and chunks.
  Only after that bound is applied do we average the ideal generator,
  obtaining (5.20) for the compressed graph distribution.

===== 6.3.1 Proposal and trigger lists. <proposal-and-trigger-lists.>

For every graph, include both round types, each with probability $1 \/ 2$.
  Within either type, construct the proposal or trigger indicators by successive independent Bernoulli products,
  compressing after each product while retaining all squarefree monomials of degree at most four.
  These moments coincide exactly with those of the independent reference law.
  There are polynomially many such monomials. In the balanced type the variables being compressed are the
  proposals, before conflict filtering.

To see why filtering requires no higher moments, write $Q_h$ for a balanced proposal and $I_h$ for its acceptance.
  If $C_h$ is the set of sources conflicting with $h$, then, in every outcome,

$ Q_h - sum_(t in C_h) Q_h Q_t lt.eq I_h lt.eq Q_h \, wide I_h I_t lt.eq Q_h Q_t quad \( h eq.not t \) . $

A balanced source has $\| E_h \| = Delta$, and each target has $Delta$ possible sources, so $\| C_h \| lt.eq
  Delta \( Delta - 1 \)$. Preservation of first and second proposal moments gives

#[#set math.equation(numbering: n => "(6.3)")
 $ p_(*) - Delta \( Delta - 1 \) p_(*)^2 lt.eq bb(E) I_h lt.eq p_(*) \, wide bb(E) \[ I_h I_t \] lt.eq
   p_(*)^2 quad \( h eq.not t \) . $ <eq:list-conflict-moments>]

These are the marginal and pair bounds needed for the isolated-action and simultaneous-action estimates.
  Accepted out-sets remain disjoint in every outcome.

For an unbalanced round, the count statistic from Equation (5.7), conditional on the graph, has the form

$ Z_(*) = sum_e c_e I_e + sum_(e < f) c_(e f) I_e I_f $

with fixed rational coefficients. It has degree at most two in the trigger indicators,
  and its square has degree at most four after using $I_e^2 = I_e$.
  The compressed law therefore has exactly the same $bb(E) Z_(*)$, $bb(E) Z_(*)^2$,
  and $"Var" Z_(*)$ as the independent reference law. The variance estimate proved for independent indicators
  transfers to this law, and hence so does the Chebyshev count-failure bound.
  An independent-coordinate variance inequality is applied to the reference law before this transfer.

The terminal alive-mass estimate likewise uses only the marginal and pair bounds for the $Delta$ possible incoming
  triggers at each surviving target. It follows by the same union lower bound as in the randomized analysis.
  Thus all probabilistic estimates in Theorem 9 remain valid for these lists.

===== 6.3.2 Retaining adaptive histories. <retaining-adaptive-histories.>

Expand these graph and proposal lists at every reached physical history,
  and retain all resulting physical outcomes over the $T$ rounds. The history tree is not compressed.
  The alive sets used in the analysis can be defined along this tree, but need not be computed by the algorithm.
  Even when two histories reach the same physical state with different analysis-only alive sets,
  the next-round estimates apply to either history, since they hold for every admissible alive set conditional on
  the current physical state and graph.

The number of active copies is polynomial: there are at most $Delta$ at each facility,
  and resetting regenerates copies at an existing facility.
  The number of chunk actions is also polynomial, since the total number of source–target incidences is $Delta$
  times the number of target copies. Each history has only polynomially many children.
  Since $T$ is an input-independent constant, the complete history tree has polynomial size.
  At each leaf perform the final deterministic completion, discard outcomes exceeding the additive budget,
  and select one of minimum total connection cost.

=== 6.4 Rational implementation and bit complexity <rational-implementation-and-bit-complexity>

We give the encoding details because support size alone does not imply a polynomial-time algorithm.
  Fix rational values of all algorithmic parameters. In each of the finitely many rounds,
  fix in advance a rational taper value $hat(P)$ satisfying its stipulated accuracy.
  The analytic functions of elapsed time, the potential, and the analysis-only alive-set decisions need not be
  evaluated by the algorithm.

An optimal basic LP solution has polynomial encoding length.
  Splitting facilities to make assignments use whole pieces introduces only polynomially many pieces.
  Piece masses, bundle masses, and intersection masses are sums and differences of the LP coordinates.
  The extra star weights multiply a deficit by the fixed rational $gamma$,
  and conversion to grid counts multiplies by the integer $Delta$.
  Hence the initial star counts have a common denominator $D_0$ of polynomial bit length.

For weighted pair rounding, write $a_e = \| u_e \|$. If a pair update makes $X_e$ integral and leaves $X_f$
  fractional, preservation of its weighted sum gives

$ a_f X'_f = a_f X_f + a_e X_e - a_e X'_e . $

Throughout these updates, therefore, every weighted count lies in $D_0^(- 1) bb(Z)$.
  Recovering $X_f$ only divides by the polynomially bounded integer $a_f$.
  Counts remain in their original integer bounds, so their numerators and their endpoint probabilities have
  polynomial bit length as well. Final single-coordinate rounding makes the coordinate integral;
  zero-coefficient counts retain their initial values until rounded directly.
  Clipping and rescaling give fresh rational inputs of polynomial bit length for the within-bundle rounds,
  where the same argument applies with unit coefficients.

The taper radii can also be computed exactly. On an interval where $m$ source copies have saturated marginal one
  and $r$ source copies have marginal strictly between zero and one, the radius equation is

$ m + r / hat(P) - frac(sum_(h upright(" partial")) d \( i \, h \), hat(P) N_i) = Delta . $

When $r > 0$, an interior solution is

#[#set math.equation(numbering: n => "(6.4)")
 $ N_i = frac(sum_(h upright(" partial")) d \( i \, h \), r + hat(P) \( m - Delta \)) . $ <eq:rational-taper-radius>]

The breakpoints are the rational numbers $d \( i \, h \)$ and $d \( i \, h \) \/ \( 1 - hat(P) \)$.
  Sorting these values and checking the successive intervals finds the smallest solution,
  including a breakpoint solution. If $r = 0$, the equation is constant on the interval,
  and the first point of a solution interval is a breakpoint.
  The separately prescribed case of sufficient co-located mass uses $N_i = 0$.
  All radii, marginals, and resulting branch probabilities have polynomial bit length.
  The physical states and their feature values are determined without reference to the list weights.

It remains to control the list weights across repeated branching and compression.
  Suppose a feature vector has $d$ coordinates of bit length at most $L$.
  In the affine-dependence computation, clearing denominators in each row of the matrix on at most $d +
  2$ columns produces integer entries of bit length $O \( d L \)$.
  A nonzero kernel vector can be chosen using minors, with bit length $O \( d^2 L + d log \( d + 1 \) \)$ by the
  determinant bound. These bounds are independent of the current list weights.

By (6.1), an elimination multiplies a common weight denominator by just one coefficient of such a dependence.
  An exact branch with probability denominator $q$ multiplies a common denominator by at most $q$.
  Branching a whole list adds the bit lengths of only polynomially many such denominators,
  and taking a product of lists adds their denominator bit lengths.
  There are polynomially many list operations, including the entire constant-depth physical history tree.
  Their common denominators and numerators consequently retain polynomial bit lengths.
  Exact linear algebra, comparisons, and cost evaluations therefore give a deterministic algorithm whose bit
  complexity is polynomial in the input encoding length for every fixed choice of accuracy parameters.

=== 6.5 Loss allocation and the approximation theorem <loss-allocation-and-the-approximation-theorem>

We first record explicitly how conditioning and deterministic selection are combined.
  For a nonnegative cost $C$ and an event $G$ with $bb(P) \( G \) gt.eq 1 - r$,

#[#set math.equation(numbering: n => "(6.5)")
 $ bb(E) \[ C divides G \] lt.eq frac(bb(E) C, 1 - r) . $ <eq:conditioning-cost>]

Thus a finite distribution list contains a successful outcome whose cost is no more than the right-hand side.
  No independence between cost and budget success is required.

#thm([Theorem 6.2.])[
  (Deterministic additive approximation).  #emph[For every fixed $epsilon > 0$,
    there is an instance-independent integer $c gt.eq 0$ and a deterministic polynomial-time algorithm for metric
    $k$-median that opens at most $k + c$ facilities and has total connection cost at most
$ (1 + 2 / e + epsilon) "LP" \, $

 where $"LP"$ is the optimum value of the assignment relaxation.
   In particular, its cost is at most the same factor times $"OPT"_k$.]
] <thm:pseudo>

#proof[
  Put $alpha_star.op = 1 + 2 \/ e$, and choose a fixed positive rational number
  $ t lt.eq min { 1 \/ 8 \, epsilon \/ 10 } . $
  Choose the parameters in the constructions underlying Theorems 5 and 9 with unconditioned cost factors at most
    $1 + t$ and $alpha_star.op + t$, respectively, and with their respective budget-failure probabilities at most
    $t$. The proofs of those theorems allow the cost and failure tolerances to be made arbitrarily small;
    their stated expectation guarantees absorb this same conditioning loss. Here we keep the loss visible.
  All parameter choices can be made in a consistent order. After the preparation parameters other than the grid
    are fixed, take an even integer $Delta$ sufficiently large, set $g = 1 \/ Delta$,
    and take a rational horizon of order $1 + log \( Delta \/ t \)$.
    The requirements that the terminal error be small and that $Lambda g$ be small are compatible because $log
    Delta \/ Delta arrow.r 0$. Then choose the taper tolerance, the selection bias,
    and the time step successively small. The number of rounds is now fixed.
    Finally choose the heavy-source parameter sufficiently small that the sum of the conditional count-failure
    probabilities over all rounds is at most $t$. The resulting additive opening allowances are constants
    depending only on these parameter choices.
  Let $L = "LP"$. Apply the preparation list to an optimal LP solution.
    Its total nearest-unit cost has expectation at most $\( 1 + t \) L$,
    and its budget event has probability at least $1 - t$. Select the least expensive successful grid solution.
    By (6.5), its total nearest-unit cost $L_(upright("grid"))$ satisfies
  $ L_(upright("grid")) lt.eq frac(1 + t, 1 - t) L . $
  Apply the physical-rounding list to this fixed grid solution.
    The summed cost bound is at most $\( alpha_star.op + t \)
    L_(upright("grid"))$ before discarding count failures, and the budget succeeds with probability at least $1 -
    t$. Selecting the least expensive successful integral output therefore gives cost at most
  $ frac(\( 1 + t \) \( alpha_star.op + t \), \( 1 - t \)^2) L . $
  Since $alpha_star.op < 2$ and $t lt.eq 1 \/ 8$,
  $ frac(\( 1 + t \) \( alpha_star.op + t \), \( 1 - t \)^2) - alpha_star.op & =
    frac(\( 3 alpha_star.op + 1 \) t + \( 1 - alpha_star.op \) t^2, \( 1 - t \)^2)\
 & lt.eq frac(7 t, \( 1 - t \)^2) < 10 t lt.eq epsilon . $
  The two additive allowances sum to an instance-independent constant, which may be rounded up to an integer $c$.
  Both minimum-cost selections are computable on polynomial-size lists,
    with polynomial bit complexity as proved above. They use total costs;
    the deterministic grid solution is not required to attain every client’s individual expectation bound.
    If $L = 0$, the nonnegative cost has expectation zero in the preparation list and then in the
    physical-rounding list, so the same argument gives zero cost without division by $L$.
  Every opened copy lies at an original candidate facility.
    Merge copies introduced by the construction back to their original facility.
    This preserves connection distances and cannot increase the number of opened facilities.
    Finally, $"LP" lt.eq "OPT"_k$, proving the last assertion. ◻
]

=== 6.6 Applying the reduction on rational inputs <sec:reduction-implementation>

Before applying Theorem 4, we record its interface with the deterministic algorithm just proved.
  Every call of that reduction uses the same clients and distances with a restricted candidate set $F' subset.eq
  F$; our pseudo-algorithm uses no additional input promise or prescribed-open facilities.
  Its internal forced openings are decisions of that call, not constraints passed from another call.
  Copies are merged back to original candidates before returning its output.
  If $0 < \| F' \| < k$, opening every candidate gives the optimum for that restricted instance.
  If $F' = diameter$ and clients remain, discard the branch.
  The distinguished branch retaining a padded optimal $k$-set has neither exception.
  When the additive allowance is zero, the pseudo-algorithm already satisfies the required budget.

The zero-optimum case can be recognized before the reduction.
  Every client location must be an available candidate location,
  and there can be at most $k$ distinct client locations. Equivalently,
  every zero-distance class containing a client must contain a candidate,
  and there are at most $k$ such client classes. These conditions are necessary and sufficient in the original
  metric; when they hold, open those locations. Thus the positive-optimum analysis of the reduction does not
  require division by zero. Co-located pieces occur only inside our pseudo-algorithm and do not change this
  original-metric test.

We also make explicit a rational implementation of the deletion threshold in the proof of Li–Svensson’s
  reduction #cite(label("LiSvensson2016")) Section 2, Algorithm 2.
  That proof analyzes a threshold determined by the unknown optimum. Its numerical value need not be computed.
  Suppose a call returns a set $T$ with $k < \| T \| lt.eq k + c$.
  For every set $T' subset.eq T$ obtainable by at most $c$ deletions with $\| T' \| > k$, and every $i in T'$, compute

$ Delta \( T' \, i \) = "cost" \( T' \\ { i } \) - "cost" \( T' \) . $

These numbers are nonnegative rationals of polynomial bit length. There are $n^(O \( c \))$ such numbers.
  Run the reduction’s deletion phase for each distinct number as threshold, and for zero,
  with a fixed order for choosing deletions; follow each run by its prescribed enumerative completion and retain
  the cheapest feasible result.

To justify this replacement, let $B^(*) gt.eq 0$ be the threshold used in the reduction’s analysis.
  Choose the largest enumerated value at most $B^(*)$, including equality, or zero if there is none.
  Every test of the form $Delta \( T' \, i \) lt.eq B^(*)$ has the same answer at this representative threshold.
  Induction through the at most $c$ deletions therefore reproduces the ideal deletion history,
  including its fixed tie choices. Its output is present among the enumerated outputs.
  The approximation analysis still uses $B^(*)$; the algorithm uses only exact rational comparisons.
  This adds $n^(O \( c \))$ overhead to the stated reduction.
  All candidate enumeration, distance comparisons and cost evaluations likewise use polynomial-bit rational arithmetic.

Finally, the approximation parameter supplied to the reduction can be a fixed rational upper bound on our ratio,
  with its excess charged to the allowed accuracy. The auxiliary positive constants in its proof may then be
  chosen rational as well. These observations preserve both determinism and polynomial binary-input time;
  they require no oracle for the optimum.

#proof[
  Fix $epsilon > 0$. Apply Theorem 16 with loss $epsilon \/ 4$,
    obtaining a deterministic $c$-additive approximation, where $c$ depends only on this fixed loss.
    Choose a fixed rational number $alpha$ with
  $ 1 + 2 \/ e + epsilon \/ 4 < alpha < 1 + 2 \/ e + epsilon \/ 2 . $
  The pseudo-algorithm is a $c$-additive $alpha$-approximation.
    The additive-to-ordinary reduction of Theorem 4, with a fixed positive rational loss at most $epsilon \/
    2$ and the implementation in Section 6.6, gives a deterministic polynomial-time algorithm opening at most $k$
    original facilities and having cost at most
  $ (1 + 2 / e + epsilon) "OPT"_k . $
  Copies can be merged back to their original facilities as above.
    If exactly $k$ facilities are required, add unused facilities from $F$,
    which is possible because $k lt.eq \| F \|$ and can only decrease the cost. ◻
]

Combining Theorem 1 with the hardness bound recalled in Section 1 proves Corollary 2:
  under $P eq.not N P$, the infimum of deterministic polynomial-time approximation factors in the specified
  candidate-facility model is $1 + 2 \/ e$. The upper bound holds for every fixed positive loss and does not
  require attainment of the endpoint.

== 7 Exact certificates for the scalar bounds <app:certificates>

This appendix proves Lemma 8. All terminating decimals in this appendix denote exact rational numbers.
  The argument uses two finite tables of rational polynomial minorants.
  We give the coefficient rule and the Bernstein conversion formula explicitly,
  so the tables can be verified using only rational arithmetic;
  the accompanying programs are supplementary implementations of these formulas.

Throughout, $X = 1 - x$, $0 lt.eq x lt.eq 1$, $0 lt.eq w lt.eq X$, $0 lt.eq r lt.eq 1$, and $s in { 0 \, 1 }$.
  We recall the notation

$ P & = integral_0^1 t e^(- t x) thin d t \, & A & = 3 - 2 integral_0^1 e^(- t x) thin d t \, & m & = A - 1 - 2 P x \,\
C & = 1 - s P \, & a & = A + 2 P w \, & b & = \( 2 - s \) P \( x + w \) \, wide z = P w^2 \,\
k_s & = \( 1 - s \) frac(1 - sqrt(1 - P), 1 + sqrt(1 - P)) \, & K & = C - k_s - b r + 1.6 z \,\
L & = \( C - m - b \) r + .4 z \, & M & = \( 1 - r \) a + C P r \, & G & = M - L . $

Also set

$ d_0 = .52 \, wide d_1 = .4 \, wide H_0 = .394 - .42 X^2 + .04 X^3 \, wide H_1 = .25 \, wide J_s = C H_s . $

The elementary integral bounds give $0 < P lt.eq .5$ and $1 lt.eq A lt.eq 2$; the latter follows from $1 -
  e^(- t x) lt.eq t x$. Direct integration gives

#[#set math.equation(numbering: n => "(7.1)")
 $ \( 1 + x \) \( A - 1 \) = 2 x \( 1 - P \) . $ <eq:cert-integral-identity>]

=== 7.1 Rational approximations and their errors <sec:cert-interpolation>

Use the following polynomials in $X$, with coefficients displayed in ascending order:

#[#set math.equation(numbering: n => "(7.2)")
 $ p \( X \) =  & .26424112 + .16053514 X + .05751895 X^2\
 & #h(12mm)  + .01313705 X^3 + .00456774 X^4 \,\
v \( X \) =  & 1.73575888 - .52832269 X - .16191093 X^2\
 & #h(12mm)  - .03442938 X^3 - .01109588 X^4 \,\
k \( X \) =  & .0767 + .0564 X + .0142 X^2 + .0246 X^3 . $ <eq:cert-interpolants>]

We will prove

#[#set math.equation(numbering: n => "(7.3)")
 $ \| p - P \| lt.eq epsilon.alt_P := .0000075 \, wide \| v - A \| lt.eq 2 epsilon.alt_P = .000015 \, wide
   k_0 lt.eq k . $ <eq:cert-approximation-errors>]

For the first two claims, the integral Taylor series are

$ P \( x \) = sum_(n gt.eq 0) frac(\( - x \)^n, n ! \( n + 2 \)) \, wide A \( x \) = 3 -
  2 sum_(n gt.eq 0) frac(\( - x \)^n, n ! \( n + 1 \)) . $

On $0 lt.eq x lt.eq 1$ the magnitudes of the summands decrease.
  Thus the partial sums through orders $12$ and $13$ enclose each defining integral.
  Evaluating these rational enclosures at $X = 0 \, 1 \/ 4 \, 1 \/ 2 \, 3 \/ 4 \,
  1$ proves that the nodal errors of the displayed $p \, v$ are, respectively,
  less than $2.343560 dot.op 10^(- 9)$ and $2.344324 dot.op 10^(- 9)$.
  In particular, each is less than $4 dot.op 10^(- 9)$. This nodal calculation can be performed without evaluating
  any transcendental number: at each node substitute $x = 1 -
  X$ into the two finite sums just given and compare both rational endpoints with the displayed polynomial value.

Let $I_P \, I_A$ be the exact degree-four interpolants at these five nodes.
  The sum of the absolute values of the Lagrange basis polynomials is at most

$ sum_(i = 0)^4 frac(4^4, i ! \( 4 - i \) !) = 512 / 3 \, $

because every numerator factor has absolute value at most one.
  Differentiating with respect to $X$ gives the fifth-derivative bounds $1 \/ 7$ for $P$ and $1 \/ 3$ for $A$.
  The absolute node product, with $u = \| X - 1 \/ 2 \|$, is

$ u \( 1 \/ 4 - u^2 \) \| 1 \/ 16 - u^2 \| . $

For $u lt.eq 1 \/ 4$ it is at most $1 \/ 256$. For $1 \/ 4 lt.eq u lt.eq 1 \/ 2$,
  the product of the two quadratic factors is at most $\( \( 1 \/ 4 - 1 \/ 16 \) \/ 2 \)^2 = 9 \/ 1024$,
  so the entire expression is at most $9 \/ 2048$. Both bounds are less than $.0045$.
  The interpolation remainder formula therefore gives

$ \| p - P \| & lt.eq 512 / 3 \( 4 dot.op 10^(- 9) \) + .0045 / 840 = 31709 / 5250000000 < epsilon.alt_P \,\
\| v - A \| & lt.eq 512 / 3 \( 4 dot.op 10^(- 9) \) + .0045 / 360 = 9887 / 750000000 < 2 epsilon.alt_P . $

The coefficient signs and endpoint values give

#[#set math.equation(numbering: n => "(7.4)")
 $ .26424112 lt.eq p lt.eq .5 \, wide 1 lt.eq v lt.eq 1.73575888 \,\
.0767 lt.eq k lt.eq .1719 \, wide .014 lt.eq H_0 lt.eq .394 . $ <eq:cert-polynomial-ranges>]

For $H_0$, use $H'_0 \( X \) = X \( - .84 + .12 X \) lt.eq 0$. The first row of Table 1 below proves

#[#set math.equation(numbering: n => "(7.5)")
 $ T_k := 4 k - \( p + epsilon.alt_P \) \( 1 + k \)^2 > 0 . $ <eq:cert-k-envelope>]

Since $0 < k < 1$ and $t mapsto 4 t \/ \( 1 + t \)^2$ is increasing on $\( 0 \, 1 \)$,
  while $4 k_0 \/ \( 1 + k_0 \)^2 = P$, inequality (7.5) and $P lt.eq p + epsilon.alt_P$ imply $k_0 lt.eq k$.
  This proves all of (7.3).

Define polynomial versions of the quantities used in the following reductions by

#[#set math.equation(numbering: n => "(7.6)")
 $ c = 1 - s p \, wide N = c - \( 1 - s \) k \, wide l = c + 1 - v + s p x \,\
d = d_s \, wide h = 1.6 + .4 d \, wide u_0 = d \/ h \, wide
  u_1 = \( 2 - s \) \( 1 + d \) \/ \( 2 h \) . $ <eq:cert-polynomial-notation>]

The polynomial families in the reductions are

$ T_1 & = 1 - p - 1.12 p \( 1 + x \) + .4 p^2 X \( 1 + x \) \,\
T_2 & = \( \( 1 - p \)^2 - .38 p X + p x \) \( 1 + x \) - 2 x \( 1 - p \) \,\
Q_0 \( W \) & = N - d v + p W \( h W - 2 d \) \,\
Q_1 & = N - \( 2 - s \) p x - d \( c p - l \) - h p u_1^2 \,\
Y & = N - p #scale(x: 120%, y: 120%)[\(] \( 2 - s \) x + \( 2 - s \)^2 \/ 6.4 #scale(x: 120%, y: 120%)[\)] \,\
Y' & = N + p \( 1.6 X^2 - 2 \) wide \( s = 0 \) . $

The notation $T \( P \, A \)$ means replacement of $p \, v$ by $P \, A$, keeping $X \,
  k$ and the rational constants fixed.

=== 7.2 Reduction of the first, second, and final scalar bounds <reduction-of-the-first-second-and-final-scalar-bounds>

We first establish the first scalar inequality

#[#set math.equation(numbering: n => "(7.7)")
 $ m + b - .4 z \/ r lt.eq frac(C \( 1 - P \), 1 - P r) wide \( 0 < r lt.eq 1 \) . $ <eq:cert-first-scalar>]

Put $t = 1 \/ r - P > 0$. By (7.1), the right side of (7.7) minus its left side equals

$ & C \( 1 - P \) - frac(2 x \( 1 - P \), 1 + x) + s P x - \( 2 - s \) P w + .4 P^2 w^2\
 & #h(35mm)  + P (frac(C \( 1 - P \), t) + .4 w^2 t) . $

Applying AM–GM to the last parentheses gives the lower bound

#[#set math.equation(numbering: n => "(7.8)")
 $ C \( 1 - P \) - frac(2 x \( 1 - P \), 1 + x) + s P x - \( 2 - s - 2 sqrt(.4 C \( 1 - P \)) \) P w + .4 P^2
   w^2 . $ <eq:cert-amgm>]

For $s = 0$ the coefficient $2 - 2 sqrt(.4 \( 1 - P \))$ is at most $1.12$.
  The resulting quadratic decreases for $0 lt.eq w lt.eq X$: its derivative is at most $- 1.12 P + .8 P^2 < 0$.
  Substituting $w = X$ into this lower bound gives $X T_1 \( P \) \/ \( 1 + x \)$, where $T_1$ is defined above.
  For $s = 1$, the coefficient $1 - 2 sqrt(.4) \( 1 - P \)$ is at most $.38$.
  Dropping the nonnegative quadratic term and using $w lt.eq X$ gives $T_2 \( P \) \/ \( 1 + x \)$.
  The numerical coefficient comparisons also follow by squaring positive quantities:
  $.2 > .44^2$ and $.4 > .62^2$. Table 1, with the substitution budget proved below, gives $T_1 \( P \) \,
  T_2 \( P \) > 0$. At $X = 0$, the extra factor $X$ in the $s = 0$ reduction is zero,
  which still proves the required non-strict inequality.

For $r > 0$, (7.7) implies

$ L gt.eq C r (1 - frac(1 - P, 1 - P r)) gt.eq 0 . $

For $r = 0$, one has $L = .4 z gt.eq 0$ directly.

To check $K gt.eq d_s G$, write $d = d_s$ and $h = 1.6 + .4 d$. The difference $K - d G$ is affine in $r$.
  With $N_P = C - \( 1 - s \) k$, replacing $k_s$ by $\( 1 - s \) k$ only decreases this difference.
  Put $underline(K) = N_P - b r + 1.6 z lt.eq K$. The endpoint expressions after this replacement are

#[#set math.equation(numbering: n => "(7.9)")
 $ \( underline(K) - d G \) \|_(r = 0) & = N_P - d A + P w \( h w - 2 d \) \,\
\( underline(K) - d G \) \|_(r = 1) & = Q_1 \( P \, A \) + h P \( w - u_1 \)^2 \, $ <eq:cert-r0>]

where

$ u_0 = d \/ h \, wide u_1 = frac(\( 2 - s \) \( 1 + d \), 2 h) $

and $Q_1$ is defined above. For $s = 1$ we may use the unrestricted minimum $w = u_0$ in (7.9).
  For $s = 0$, the constrained minimum is at $w = X$ if $X lt.eq u_0$, and at $w = u_0$ otherwise.
  Equation (7.9) is bounded below by $Q_1 \( P \, A \)$ for both values of $s$.
  These are precisely the $Q_0 \, Q_1$ checks in Table 1.

We next reduce the final two scalar bounds. Recall

$ kappa_s \( q \) = C frac(1 - q, 1 - P q) - \( 1 - q \) \, wide 0 lt.eq q lt.eq 1 . $

For $s = 1$, $k_s = 0$ and $kappa_s \( q \) lt.eq 0$. Thus both relevant left sides are bounded below by $C +
  1.6 z - b$. Its unrestricted minimum in $w$ is the true-parameter version of $Y$ above, so the rows $Y -
  H_0$ and $Y - .25$ suffice.

For $s = 0$ and $X gt.eq .5$, use $q lt.eq 1$ and $kappa_0 \( q \) lt.eq k_0$.
  Again a common lower bound is $1 - k_0 + 1.6 z - b$, whose unrestricted minimum is the corresponding $Y$.
  For $s = 0$ and $X lt.eq .5$, we have $x gt.eq .5$ and

$ P \( x \) lt.eq P \( .5 \) < .47 . $

For example the inequality $e^(- u) lt.eq 1 - u + u^2 \/ 2$ yields $P \( .5 \) lt.eq 1 \/ 2 - 1 \/ 6 + 1 \/ 32 =
  35 \/ 96 < .47$. It follows that $b gt.eq .52 P \/ \( 1 - P \)$, because $x + w gt.eq .5$ and $1 - P > .53$. Since

$ kappa_0 \( q \) = frac(P q \( 1 - q \), 1 - P q) lt.eq frac(P, 1 - P) \( 1 - q \) \, $

we obtain $b q + .52 kappa_0 \( q \) lt.eq b$. The fourth scalar left side is consequently at least

$ 1 - .48 k_0 + 1.6 z - b . $

The quadratic $1.6 P w^2 - 2 P \( x + w \)$ decreases on $0 lt.eq w lt.eq X lt.eq .5$,
  so its minimum is $P \( 1.6 X^2 - 2 \)$. Thus the fourth and fifth inequalities follow, respectively,
  from $Y' + .52 k - H_0 gt.eq 0$ and $Y' - .25 gt.eq 0$ after substitution.
  In the former expression the net coefficient of $k$ is $- .48$,
  so replacing $k_0$ by the upper bound $k$ is conservative.

The last scalar bound also gives positivity of $K$: since $b gt.eq 0$,

$ K = C - k_s - b r + 1.6 z gt.eq C - k_s - b + 1.6 z gt.eq .25 > 0 . $

=== 7.3 The first coefficient table and its exact verification <the-first-coefficient-table-and-its-exact-verification>

Replacing $p \, v$ by $P \, A$ in these expressions changes their values by less than

#[#set math.equation(numbering: n => "(7.10)")
 $ sigma = .0002 . $ <eq:cert-sigma>]

For completeness, the following derivative bounds hold on the line segment between $\( p \, v \)$ and
  $\( P \, A \)$, using $0 lt.eq p \, P lt.eq .5$, $1 lt.eq v \, A lt.eq 2$, and $0 lt.eq W lt.eq 1$:

$ T & \| partial_p T \| & \| partial_v T \| & 10^6 thin \| T \( p \, v \) - T \( P \, A \) \| upright(" upper bound")\
T_1 & 3.64 & 0 & 27.3\
T_2 & 8.76 & 0 & 65.7\
Q_0 \( W \) & 3.848 & .52 & 36.66\
Q_1 & 4.848 & .52 & 44.16\
Y & 2.625 & 0 & 19.6875\
Y' & 2 & 0 & 15 $

Here $T_(1 \, p) = - 1 - 1.12 \( 1 + x \) + .8 p X \( 1 + x \)$, with $X \( 1 + x \) lt.eq 1$,
  and $T_(2 \, p) = \[ - 2 \( 1 - p \) - .38 X + x \] \( 1 + x \) + 2 x$.
  For $Q_0$, use $h lt.eq 1.808$ and $2 d lt.eq 1.04$. For $Q_1$, $\( c p - l \)_p = 1 - 2 s p +
  s X$ has absolute value at most $2$, $\( c p - l \)_v = 1$, and $u_1 lt.eq 1$.
  The last two derivative bounds follow directly from their displayed linear dependence on $p$.
  These estimates prove the claimed budget even on the full interval, rather than only the listed subintervals.
  Adding $.52 k$ or subtracting $H_0 \, .25$ does not change this budget.
  The row for $T_k$ already includes $epsilon.alt_P$ explicitly and does not need this additional substitution estimate.

Here is the finite verification mechanism used in both coefficient tables.
  A row with scale $10^a$ and integers $lambda_0 \, dots.h \, lambda_n$ asserts

#[#set math.equation(numbering: n => "(7.11)")
 $ T \( X \) gt.eq t \( X \) := 10^(- a) sum_(j = 0)^n lambda_j X^j wide \( 0 lt.eq X lt.eq 1 \) . $ <eq:cert-minorant>]

To verify it, expand $T = sum_j c_j X^j$ and check

#[#set math.equation(numbering: n => "(7.12)")
 $ 10^a c_j gt.eq lambda_j quad \( 0 lt.eq j < n \) \, wide 10^a sum_(j gt.eq n) min \( 0 \, c_j \) gt.eq
   lambda_n . $ <eq:cert-coefficient-rule>]

Positive tail terms may be discarded; for every negative tail term, $c_j X^j gt.eq c_j X^n$. This proves (7.11).

All short minorants have degree at most six. On any listed interval $\[ alpha \, beta \]$,
  their degree-six Bernstein coefficients are

#[#set math.equation(numbering: n => "(7.13)")
 $ frak(b)_m \( t \; alpha \, beta \) = 10^(- a) sum_(h = 0)^m binom(m, h) /
   binom(6, h) \( beta - alpha \)^h sum_(j = h)^n lambda_j binom(j, h) alpha^(j - h) \, quad 0 lt.eq m lt.eq
   6 . $ <eq:cert-bernstein-rule>]

Indeed, expand at $X = alpha + \( beta - alpha \) u$ and convert ordinary powers of $u$ to degree-six Bernstein
  form. Thus if every coefficient in (7.13) is at least $b_(*)$, then $t \( X \) gt.eq
  b_(*)$ throughout the interval, since the Bernstein basis is nonnegative and sums to one.
  An endpoints entry with more than two numbers prescribes each interval between consecutive numbers.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (left, center, left, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$T$
], table.cell(rowspan: 1, colspan: 1)[$s$
], table.cell(rowspan: 1, colspan: 1)[Endpoints and splits
], table.cell(rowspan: 1, colspan: 1)[$a$
], table.cell(rowspan: 1, colspan: 1)[$lambda$
]),
  table.cell(rowspan: 1, colspan: 1)[$T_k$
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[$0 \, .5 \, 1$
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 73 \, - 384 \, 563 \, - 184 \, - 67 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$T_1$
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 14 \, - 17 \, 3 \, 3 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$T_2$
], table.cell(rowspan: 1, colspan: 1)[–
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 13 \, 10 \, - 22 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Q_0 \( u_0 \)$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 3 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Q_1$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 42 \, - 3 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Q_1$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Q_0 \( u_0 \)$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$u_0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, 19 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Q_0 \( X \)$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, u_0$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, - 6 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Y - H_0$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, - 9 \, 45 \, - 2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Y - .25$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 17 \, - 9 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Y - H_0$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$.5 \, 1$
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\( - 165 \, 50 \, 575 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Y - .25$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$.5 \, 1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( - 3 \, 5 \, 15 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Y' + .52 k - H_0$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, .125 \, .25 \, .5$
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$\( 406 \, - 3483 \, 7208 \, 1786 \, - 3 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$Y' - .25$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, .5$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 14 \, - 38 \, 29 \, - 1 \)$
],
)
]],
  caption: [Table 1: First coefficient table. The scale is $10^a$, and the listed vector is $\( lambda_0 \, dots.h \, lambda_n \)$. ],
)

Substitution of (7.2) into the definitions verifies (7.12) for all fourteen rows of Table 1.
  As additional explicit sign certificates, the minima of the finite sets in (7.13),
  over all prescribed subintervals for each row, are at least $10^(- 6)$ times the following integers, in row order:

#[#set math.equation(numbering: n => "(7.14)")
 $ 114 \, 20000 \, 10000 \, 10000 \, 390000 \, 40000 \, 33818 \,\
2743 \, 15000 \, 80000 \, 3625 \, 31250 \, 356 \, 21250 . $ <eq:cert-first-bernstein-lower>]

Both (7.12) and these lower bounds are finite rational comparisons specified completely by the table and (7.13).
  For example, the first row has smallest Bernstein coefficient $73 \/ 640000$,
  and the thirteenth row has smallest coefficient $27341 \/ 76800000$.
  Consequently $T_k > 0$, and every other short minorant exceeds $sigma = .0002$ on its indicated intervals.
  After the substitution budget, this completes the first and second groups of scalar bounds and the final two
  scalar bounds.

=== 7.4 The third scalar bound: perturbation estimate <the-third-scalar-bound-perturbation-estimate>

It remains to prove

#[#set math.equation(numbering: n => "(7.15)")
 $ \( \( J_s - b \) r + 1.6 z \) M + \( C - k_s - J_s r \) L gt.eq 0 . $ <eq:cert-third-goal>]

Since $L gt.eq 0$ is already established, replacing $k_s$ with $\( 1 - s \) k$ only decreases the left side.
  We next replace $P \, A$ by $p \, v$. This replacement changes the expression by at most

#[#set math.equation(numbering: n => "(7.16)")
 $ sigma \( r + w^2 \) \, wide sigma = .0002 . $ <eq:cert-third-error>]

Here are full bounds for this assertion. For either endpoint choice $\( pi \, nu \) = \( P \, A \)$ or
  $\( p \, v \)$, put $c_pi = 1 - s pi$, $H = H_s$, and write the two products as $F_1 F_2 + F_3 F_4$, where

$ F_1 & = \[ c_pi H - \( 2 - s \) pi \( x + w \) \] r + 1.6 pi w^2 \,\
F_2 & = \( 1 - r \) \( nu + 2 pi w \) + c_pi pi r \,\
F_3 & = c_pi \( 1 - H r \) - \( 1 - s \) k \,\
F_4 & = \[ 2 - nu - s pi X - \( 2 - s \) pi w \] r + .4 pi w^2 . $

Writing $rho = r + w^2$, the ranges already established imply

#[#set math.equation(numbering: n => "(7.17)")
 $ \| F_1 \| lt.eq 1.1 rho \, wide \| F_2 \| lt.eq 3 \, wide \| F_3 \| lt.eq 1 \, wide \| F_4 \| lt.eq
   2 rho . $ <eq:cert-factor-bounds>]

For $F_1$, both nonnegative terms in its coefficient of $r$ are at most one, while $1.6 pi lt.eq .8$.
  The expression $F_2$ is a convex combination of two quantities between zero and three.
  For $F_3$, the lower bounds are $1 - .394 - .1719 = .4341$ when $s = 0$ and $.5 \( 1 - .25 \) = .375$ when $s =
  1$, and the upper bound is one. Finally the coefficient of $r$ in $F_4$ belongs to $\[ - 1 \, 1 \]$:
  $0 lt.eq 2 - nu lt.eq 1$ and $0 lt.eq s pi X + \( 2 - s \) pi w lt.eq 1$.

Let $delta F_j$ denote the change between the two choices. With $epsilon.alt_P = .0000075$, direct subtraction gives

$ \| delta F_1 \| & lt.eq 2 epsilon.alt_P rho \, & \| delta F_2 \| & lt.eq 4 epsilon.alt_P \,\
\| delta F_3 \| & lt.eq epsilon.alt_P \, & \| delta F_4 \| & lt.eq 4 epsilon.alt_P rho . $

For the first estimate, the coefficient multiplying $epsilon.alt_P r$ is $s H + \( 2 - s \) \( x + w \)$,
  at most $2$ for $s = 0$ and at most $1.25$ for $s = 1$; the remaining coefficient is $1.6$.
  For the second, use the convex combination in $r$, together with $\| delta \( nu + 2 pi w \) \| lt.eq
  4 epsilon.alt_P$ and

$ \| delta \( c_pi pi \) \| = \| P - p \| thin \| 1 - s \( P + p \) \| lt.eq epsilon.alt_P . $

The third estimate is immediate from $0 lt.eq 1 - H r lt.eq 1$.
  For the fourth, use $2 + s X + \( 2 - s \) w lt.eq 4$ and $.4 lt.eq 4$.
  Combining these differences with (7.17) and the identity $a b - a' b' = \( a - a' \) b + a' \( b - b' \)$ yields

$ \| delta \( F_1 F_2 + F_3 F_4 \) \| & lt.eq \( 3 dot.op 15 + 1.1 dot.op 30 + 2 dot.op 7.5 + 30 \) 10^(- 6) rho\
 & = .000123 rho < sigma rho wide \( rho > 0 \) . $

If $rho = 0$, both expressions vanish. Thus (7.16) holds throughout the domain.
  The factor bounds hold for both choices, so this telescoping estimate already accounts for products of perturbations.

=== 7.5 Bernstein expansion and the second coefficient table <bernstein-expansion-and-the-second-coefficient-table>

Use the polynomial quantities in (7.6), and set

$ j = c H_s \, wide b'_0 = \( 2 - s \) p x \, wide b'_1 = \( 2 - s \) p X \, wide f = 2 p X \, wide Z' = p X^2 . $

In the polynomial version of the left side of (7.15), subtract $sigma \( r + w^2 \)$ and put $w = X eta$, $0 lt.eq
  eta lt.eq 1$. Its degree-three Bernstein coefficients in $eta$, for $i = 0 \, 1 \, 2 \, 3$, are

#[#set math.equation(numbering: n => "(7.18)")
 $ B_0 + B_1 r + B_2 r^2 \, $ <eq:cert-eta-coefficient>]

where, writing $e = i \/ 3$, $e_2 = i \( i - 1 \) \/ 6$, and $t = upright(bold(1))_({ i = 3 })$, the exact formulas are

#[#set math.equation(numbering: n => "(7.19)")
 $ B_0 =  & Z' #scale(x: 120%, y: 120%)[\(] \( 1.6 v + .4 N \) e_2 + 1.6 f t #scale(x: 120%, y: 120%)[\)] -
   sigma X^2 e_2 \,\
B_1 =  & \( j - b'_0 \) v + N l\
 & + #scale(x: 120%, y: 120%)[\(] \( j - b'_0 \) f - b'_1 v - N b'_1 #scale(x: 120%, y: 120%)[\)] e - b'_1 f e_2\
 & - Z' #scale(x: 120%, y: 120%)[\(] \( 1.6 \( v - c p \) + .4 j \) e_2 + 1.6 f t #scale(x: 120%, y: 120%)[\)] -
   sigma \,\
B_2 =  & \( b'_0 - j \) \( v - c p \) - j l\
 & + #scale(x: 120%, y: 120%)[\(] \( b'_0 - j \) f + b'_1 \( v - c p \) + j b'_1 #scale(x: 120%, y: 120%)[\)] e +
   b'_1 f e_2 . $ <eq:cert-bcoeff>]

These formulas give all eight expansions, one for each pair $\( s \, i \)$.
  They can also be derived directly by expanding

$ & #scale(x: 120%, y: 120%)[\(] \[ j - \( 2 - s \) p \( x + w \) \] r +
  1.6 p w^2 #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] \( 1 - r \) \( v + 2 p w \) +
  c p r #scale(x: 120%, y: 120%)[\)]\
 & quad + \( N - j r \) #scale(x: 120%, y: 120%)[\(] \[ l - \( 2 - s \) p w \] r + .4 p w^2
   #scale(x: 120%, y: 120%)[\)] - sigma \( r + w^2 \) $

in powers of $eta$ after $w = X eta$, and using the degree-three conversion rule:
  if $a_h$ is the coefficient of $eta^h$, the $i$th Bernstein coefficient is $sum_(h = 0)^i a_h binom(i, h) \/
  binom(3, h)$.

In all eight cases $B_0 gt.eq 0$. For $i = 0 \, 1$, it is zero. Otherwise

$ B_0 = X^2 #scale(x: 120%, y: 120%)[\(] p \( 1.6 v + .4 N \) - sigma #scale(x: 120%, y: 120%)[\)] e_2 +
  1.6 p X^2 f t . $

Here $N gt.eq .5$, $v gt.eq 1$, and $p gt.eq .26424112$, so the bracket is at least $.475434016 >
  0$ and the other term is nonnegative.

Define

$ D' = 4 B_0 B_2 - B_1^2 \, wide S' = B_0 + B_1 + B_2 . $

For $i lt.eq 1$, positivity of $B_1$ and $B_1 + B_2$ proves nonnegativity of (7.18) on $0 lt.eq r lt.eq 1$.
  For $i gt.eq 2$, any of the following is sufficient:

+ $B_1 \, B_2 gt.eq 0$;
+ $D' > 0$;
+ $S' > 0$ and $B_0 - B_2 > 0$.

For the second criterion, $B_0 gt.eq 0$ and $D' > 0$ force $B_0 \, B_2 > 0$;
  completing the square proves positivity for every real $r$. For the third, use

$ B_0 + B_1 r + B_2 r^2 = r S' + \( 1 - r \) \( B_0 - r B_2 \) \, $

where $B_0 - r B_2 = \( 1 - r \) B_0 + r \( B_0 - B_2 \) gt.eq 0$.

Table 2 supplies these signs. It uses exactly the coefficient rule (7.12) and the degree-six Bernstein formula (7.13).

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, center, left, left, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$s$
], table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[Endpoints and splits
], table.cell(rowspan: 1, colspan: 1)[$T$
], table.cell(rowspan: 1, colspan: 1)[$a$
], table.cell(rowspan: 1, colspan: 1)[$lambda$
]),
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 90 \, - 39 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 41 \, - 51 \, 28 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_1 + B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 10 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$0 \, .05$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, - 9 \, - 98 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$0 \, .05$
], table.cell(rowspan: 1, colspan: 1)[$B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 9 \, - 23 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$.05 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$D'$
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$\( - 2 \, 16 \, 1176 \, - 153 \,\
- 1500 \, 2590 \, - 1000 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$0 \, .015$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 1 \, - 58 \, - 262 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$0 \, .015$
], table.cell(rowspan: 1, colspan: 1)[$B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 9 \, - 5 \)$
],
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$.015 \, .25 \, .5 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$D'$
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$\( - 12 \, 1180 \, 2070 \, - 32420 \,\
44210 \, 33740 \, - 14000 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, 30 \, - 7 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_1 + B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 12 \, - 4 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$0 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_1 + B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 12 \, - 8 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$0 \, .2$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, - 16 \, - 41 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$0 \, .2$
], table.cell(rowspan: 1, colspan: 1)[$B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 7 \, - 2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$.2 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$D'$
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\( - 4 \, 17 \, 92 \, 87 \, - 135 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$0 \, .1$
], table.cell(rowspan: 1, colspan: 1)[$B_1$
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\( 54 \, - 391 \, - 941 \, - 900 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$0 \, .1$
], table.cell(rowspan: 1, colspan: 1)[$B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 7 \, - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$.1 \, .75$
], table.cell(rowspan: 1, colspan: 1)[$D'$
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\( - 4 \, 42 \, 194 \, 478 \, - 995 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$.75 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$S'$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( 12 \, - 9 \)$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$.75 \, 1$
], table.cell(rowspan: 1, colspan: 1)[$B_0 - B_2$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( - 8 \, - 32 \, 67 \, - 1 \)$
],
)
]],
  caption: [Table 2: Second coefficient table. A row with $i = 0 \, 1$ supplies the indicated certificate separately for both values of $i$. ],
)

In the printed row order, the Bernstein coefficients of these short minorants,
  over all of each row’s subintervals, are at least $10^(- 6)$ times the following integers:

#[#set math.equation(numbering: n => "(7.20)")
 $ 10000 \, 10000 \, 90000 \, 3050 \, 78500 \, 171 \, 710 \,\
89250 \, 60 \, 50000 \, 80000 \, 40000 \, 40000 \, 1600 \,\
66000 \, 3560 \, 4590 \, 69000 \, 2518 \, 30000 \, 52656 . $ <eq:cert-third-bernstein-lower>]

The bound $90000$ in the third position applies to both indices in that row. These are all positive.
  The smallest exact Bernstein coefficient among the table’s checks is $193875074979 \/ 3200000000000000$,
  in the ninth printed row. Thus all the required strict signs follow from the finite rational formula (7.13).

For clarity, the negative-tail calculations needed for the four discriminant rows are detailed next.
  Let $b_(h \, j) = \[ X^j \] B_h$ and write

$ c_j = \[ X^j \] D' = sum_u #scale(x: 120%, y: 120%)[\(] 4 b_(0 \, u) b_(2 \, j - u) -
  b_(1 \, u) b_(1 \, j - u) #scale(x: 120%, y: 120%)[\)] \, $

where coefficients outside the degree range are zero. For a short minorant of degree $n$,
  group $min \( 0 \, c_j \)$ in consecutive blocks of five starting at $j = n$, truncating at degree $28$.
  The five block sums are bounded below by $.0001$ times the following integers:

#[#set math.equation(numbering: n => "(7.21)")
 $ s & i & n & deg D' & 1 & 2 & 3 & 4 & 5\
0 & 2 & 6 & 20 & - 930 & - 11 & - 1 & 0 & 0\
0 & 3 & 6 & 22 & - 1070 & - 180 & - 2 & - 1 & 0\
1 & 2 & 4 & 28 & - 1312 & - 18 & - 1 & - 1 & - 1\
1 & 3 & 4 & 28 & - 8240 & - 1560 & - 29 & - 1 & - 1 $ <eq:cert-tail-blocks>]

These twenty rational comparisons follow by substituting (7.19) and (7.2) into the displayed coefficient formula.
  Their row sums are, respectively, $- .0942 \, - .1253 \, - .1333 \, - .9831$,
  which are at least the final scaled minorant coefficients $- .1 \, - .14 \, - .135 \, - .995$.
  For all entries before the last, one checks simply $10^a \[ X^j \] T gt.eq lambda_j$ as in (7.12).
  The same coefficient rule verifies the non-discriminant rows directly.

The tail cutoff is exact: the four discriminant degrees are $20 \, 22 \, 28 \, 28$, as recorded in (7.21),
  so no term above degree $28$ has been omitted. More generally, from (7.19),
  the respective triples of degrees $\( deg B_0 \, deg B_1 \, deg B_2 \)$ are

$ & i = 0 & i = 1 & i = 2 & i = 3\
s = 0 & \( - oo \, 9 \, 9 \) & \( - oo \, 10 \, 10 \) & \( 10 \, 10 \, 10 \) & \( 11 \, 11 \, 9 \)\
s = 1 & \( - oo \, 9 \, 13 \) & \( - oo \, 10 \, 13 \) & \( 10 \, 14 \, 13 \) & \( 11 \, 14 \, 12 \) . $

Here $deg 0 = - oo$. These bounds also justify a uniform cutoff of $28$ for every polynomial in the two
  coefficient tables.

For $\( s \, i \) = \( 0 \, 2 \)$, the first criterion covers $X
  in \[ 0 \, .05 \]$ and the discriminant criterion covers $X in \[ .05 \, 1 \]$.
  For $\( s \, i \) = \( 0 \, 3 \)$, the corresponding split is $.015$,
  with the listed additional subdivisions used only for Bernstein positivity.
  For $\( s \, i \) = \( 1 \, 2 \)$, the split is $.2$. For $\( s \, i \) = \( 1 \, 3 \)$,
  the first criterion covers $\[ 0 \, .1 \]$, the discriminant criterion covers $\[ .1 \, .75 \]$,
  and the final criterion covers $\[ .75 \, 1 \]$. For $i = 0 \, 1$,
  the full interval is covered by $B_1$ and $B_1 + B_2$. All endpoints belong to the stated intervals.
  Thus every coefficient (7.18) is nonnegative for $0 lt.eq X \, r lt.eq 1$.
  Nonnegativity and unit sum of the degree-three Bernstein basis in $eta$ prove the desired polynomial inequality
  for $0 lt.eq w lt.eq X$; when $X = 0$ one has $w = 0$ directly. Restoring the error budget (7.16) proves (7.15).
  Together with the preceding reductions, this completes the proof of Lemma 8.

#bibliography("refs.bib", style: "ieee", title: [References])
