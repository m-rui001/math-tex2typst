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

#align(center)[#text(size: 16pt, weight: "bold")[An FPRAS for Cell-Bounded Contingency Tables]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A cell-bounded contingency table is a nonnegative integer matrix whose row sums, column sums,
  and individual entry bounds are prescribed. For positive integers $m \, n$,
  margins $r in bb(Z)_(gt.eq 0)^m$ and $c in bb(Z)_(gt.eq 0)^n$ with equal total,
  and bounds $b in bb(Z)_(gt.eq 0)^(m times n)$, write

#[#set math.equation(numbering: n => "(1)")
 $ Omega \( r \, c \, b \) & = {X in bb(Z)_(gt.eq 0)^(m times n) : sum_(j = 1)^n X_(i j) = r_i \, quad
   sum_(i = 1)^m X_(i j) = c_j \, quad X_(i j) lt.eq b_(i j)} \,\
Z \( r \, c \, b \) & = \| Omega \( r \, c \, b \) \| . $ <eq:feasible-set>]

Each table is counted once. In particular, $b_(i j) = 0$ forbids an entry;
  no positivity condition is imposed on the support or margins.
  Our concern is the binary encoding model, in which a capacity can be exponentially larger than its description.
  Both $m$ and $n$ are part of the input.

#thm([Theorem 1.1.])[
  #emph[There is one randomized algorithm with the following guarantee.
    Given $\( r \, c \, b \)$ as above and rational $epsilon \, delta in \( 0 \, 1 \)$,
    it outputs a nonnegative rational $hat(Z)$ such that
$ bb(P) #scale(x: 120%, y: 120%)[\(] \( 1 - epsilon \) Z \( r \, c \, b \) lt.eq
  hat(Z) lt.eq \( 1 + epsilon \) Z \( r \, c \, b \) #scale(x: 120%, y: 120%)[\)] gt.eq 1 - delta . $

 If $Omega \( r \, c \, b \)$ is empty, the output is zero on every execution.
   The algorithm uses independent unbiased bits, and one fixed polynomial in $L$, $epsilon^(- 1)$,
   and $log \( delta^(- 1) \)$ bounds its total bit operations on every execution,
   where $L$ is the total binary input length, including the accuracy parameters.
   No counting or sampling oracle is required.]
] <thm:main>

The theorem allows arbitrary cell bounds and margins without a fixed number of rows or columns,
  a lower bound on positive capacities, or a density or balance assumption.
  Its running-time guarantee includes preprocessing, random-bit generation, rational arithmetic, and output,
  even on executions in the failure event. The polynomial bounds in the proof are deliberately generous;
  the result is a uniform complexity guarantee rather than a practical running-time estimate.

=== 1.1 History and significance <history-and-significance>

The enumeration of fixed-margin arrays has long been studied in statistics and combinatorics;
  Diaconis and Gangolli #cite(label("DG1995")) survey its applications and exact and approximate methods.
  Ordinary contingency tables are a special case of (1), since the margins imply $X_(i j) lt.eq min { r_i \,
  c_j }$. Even their exact enumeration is difficult: Dyer, Kannan,
  and Mount #cite(label("DKM1997")) Theorem 1 proved $\# upright(P)$-completeness for tables with only two rows.
  Approximate counting can nevertheless be efficient under much broader conditions than exact counting.

For ordinary tables, Dyer, Kannan, and Mount #cite(label("DKM1997")) developed geometric sampling and counting
  methods for sufficiently large margins. Morris #cite(label("Morris2002")) weakened the required margin bounds by
  refining the expanded-polytope and rounding argument. Dyer and Greenhill #cite(label("DG2000")) gave
  polynomial-time approximate counting and sampling for arbitrary two-row margins.
  Cryan and Dyer #cite(label("CD2003")) obtained an FPRAS for any fixed number of rows by combining dynamic
  programming and volume estimation; Dyer #cite(label("Dyer2003")) subsequently improved the fixed-row algorithm
  using dynamic programming. Gopalan, Klivans, Meka, Štefankovič, Vempala,
  and Vigoda #cite(label("GKM2011")) Theorem 1.3 later gave a deterministic FPTAS for a fixed number of rows.
  These results already permit binary-encoded margins. Their restrictions concern the number of rows or the sizes
  of the margins, rather than a unary encoding convention.

Individual caps connect the problem to several other counting models.
  When all caps are zero or one, a table is a subgraph of the allowed bipartite graph with prescribed vertex
  degrees. Jerrum, Sinclair, and Vigoda #cite(label("JSV2004")) Corollary 8.1 give an FPRAS for this entire
  special case as a consequence of their permanent algorithm; all-one margins give perfect matchings.
  Bezáková, Bhatnagar, and Vigoda #cite(label("BBV2007")) developed a direct annealing algorithm for binary
  tables, also allowing arbitrary forbidden cells. More generally,
  capped tables are integer flows in a bipartite network. Cryan, Dyer,
  and Randall #cite(label("CDR2010")) gave an FPRAS for integral flows with sufficiently large tight capacities,
  and for cell-bounded tables with a fixed number of rows and arbitrary positive margins and caps.
  They identified unrestricted approximation as an open problem in their 2010 paper.
  Their tight-capacity reduction and maximum-capacity spanning-tree representation are direct antecedents of our
  large-cell construction. Here a forest and soft constraints accommodate arbitrary mixtures of small and large
  bounds, with both dimensions variable and zero bounds permitted.

Convex optimization gives a complementary family of estimates.
  Barvinok #cite(label("Barvinok2009")) Theorem 1.3 bounds ordinary weighted table counts,
  including forbidden cells, within a factor $N^(O \( m + n \))$, where $N$ is the total margin.
  Barvinok, Luria, Samorodnitsky, and Yong #cite(label("BLSY2010")) obtain randomized relative approximations with
  complexity $N^(O \( log N \))$ for specified smooth-margin classes.
  This scale is quasipolynomial in the numerical total, rather than in its binary length.
  Brändén, Leake, and Pak #cite(label("BLP2021")) Theorem 2.1 give capacity bounds for arbitrary individual caps,
  with explicit multiplicative factors depending on the margins and dimensions.
  Their bounds extend earlier estimates using Lorentzian polynomials.
  A subsequent preprint of September 30, 2026, by Leake and Mohammadi Yekta #cite(label("LMY2026")) Theorems 1.1
  and 1.3 extends capacity-based estimates to finite nonnegative integer fibers of totally unimodular systems,
  retaining an explicit multiplicative factor depending on the system’s dimensions and right-hand side.
  Theorem 1 supplies any requested relative tolerance in polynomial binary time, without a smoothness assumption.

The geometric problem here is to count all integer points of a transportation polytope.
  These need not all be vertices: the $2 times 2$ tables with every margin equal to two form a segment with three
  integer points and two vertices. Guo and Jerrum #cite(label("GJ2023")) Proposition 4.2 give an FPRAS for the
  vertices of promised $0 \/ 1$ polytopes ${ x : 0 lt.eq A x lt.eq 1 }$ defined by network matrices;
  this unit-bound vertex result has a different scope.

Counting also provides approximate sampling through the self-reduction principle of Jerrum, Valiant,
  and Vazirani #cite(label("JVV1986")) Theorem 6.3. Section 8 implements this principle by bisecting cell
  intervals, with exact feasibility tests at every branch. For an explicitly given directed multigraph with finite
  integer arc bounds and prescribed vertex balances, it yields both an FPRAS for integer arc-value vectors and a
  sampler that always returns a feasible vector when one exists.
  The latter has total-variation error at most $tau$ and an all-execution cost polynomial in the input length and
  $tau^(- 1)$. A separate companion #cite(label("OpenAIExactTables2026")) Theorem 1.1 proves exact uniform
  sampling in polynomial expected bit time for ordinary tables with arbitrary margins and no input cell bounds or
  forbidden positions. Its bounded approximate sampler has cost polynomial in the input length and the number of
  accuracy bits. Those stronger sampling guarantees concern the uncapped setting;
  the flow consequence here has the total-variation and cost bounds just stated.

=== 1.2 From tables to weighted transversals <from-tables-to-weighted-transversals>

The proof separates numerical size from combinatorial complexity.
  Large binary bounds cannot be expanded into that many binary choices.
  We instead sum over large coordinates through a weighted completion problem,
  and expand only coordinates with polynomially bounded ranges.
  The resulting finite-state argument must preserve one unit of mass per table despite the multiplicities
  introduced by this expansion.

===== 1.2.1 Large entries and two views of a small entry. <large-entries-and-two-views-of-a-small-entry.>

Flow feasibility first tightens each cell to its attainable interval.
  Subtract its minimum, so that the new endpoints are $0$ and $b_s$;
  each endpoint is attained by some feasible table. Remove zero-width cells and separate the remaining cells at a
  polynomial threshold $W$. In the bipartite graph of large cells,
  choose a maximum-capacity spanning forest and one root in each component.
  The large cells outside the forest are free coordinates. Once their values and the contributions of small cells
  to each incident margin have been specified, leaf elimination uniquely determines the tree entries from the
  nonroot margin equations.

For a small cell $s$, temporarily allow two counts $x_s \, y_s$ between $0$ and $b_s$:
  its row contribution is $x_s$, and its column contribution is $b_s - y_s$.
  The views agree when $x_s + y_s = b_s$. Writing $p = sum_(s upright(" small")) b_s$,
  we also consider unbalanced profiles satisfying only $sum_s \( x_s + y_s \) = p$.
  Extending the weights to these profiles supplies the auxiliary states and algebraic tests used below.
  For every such profile, sum over the free large entries in their integer intervals.
  Penalize the resulting deviations from root margins and violations of tree-cell bounds by a nonnegative quantity
  $D$. This penalty vanishes exactly when those remaining constraints hold.
  A maximum-capacity forest bounds its slopes in normalized free coordinates independently of the numerical large
  capacities.

For a polynomially bounded integer $H$, let $h_j \( x \, y \)$ be the sum of $2^(- j D \/ H)$ over these free
  assignments, for $0 lt.eq j lt.eq H$, and let $C \( j \)$ be the sum of $h_j$ over balanced small profiles.
  Thus $C \( 0 \)$ is an explicit product of interval sizes.
  Every feasible table contributes one to $C \( H \)$, while invalid completions contribute additional positive
  mass. Log-concavity of each tree-coordinate marginal, together with its attainable endpoints,
  controls violations close to a tree boundary; exponential decay controls more distant violations.
  This proves $Z lt.eq C \( H \) lt.eq \( 1 + epsilon \/ 32 \) Z$.
  The use of scaled free coordinates and soft constraints builds on the geometric table methods of Dyer, Kannan,
  and Mount and Morris #cite(label("DKM1997")) #cite(label("Morris2002")).

===== 1.2.2 Binary encodings and two extensions of their weights. <binary-encodings-and-two-extensions-of-their-weights.>

Replace a small cell of bound $b_s$ by $b_s$ labeled pairs, each containing a row element and a column element.
  There are $p$ pairs altogether. A #emph[transversal] selects one element from each pair.
  Its selected row and column counts give a balanced profile $\( x \, y \)$.
  The number of transversals with that profile is $product_s binom(b_s, x_s)$,
  so assigning each the weight $h_j \( x \, y \) \/ product_s
  binom(b_s, x_s)$ gives mass $h_j \( x \, y \)$ to that profile and total mass $C \( j \)$ to all transversals.

The transport argument uses an enlarged chain that also permits $p$-element sets with one empty pair and one full
  pair. Such a state has #emph[defect type] $\( i \, l \)$ when pair $i$ is empty and pair $l$ is full.
  Two factorial formulas extend the transversal weights to positive weights $f_j$ and $tilde(f)_j$ on all
  $p$-element sets. They agree on transversals and are within a polynomial factor of each other on the permitted
  defect types. Their algebraic roles differ. For $f_j$, matrices of weights obtained by omitting two elements
  from a fixed $\( p + 2 \)$-element set have at most one positive eigenvalue.
  For $tilde(f)_j$, the corresponding statement holds when adding two elements to a fixed $\( p - 2 \)$-element
  set. These quadratic tests belong to the Lorentzian framework of Brändén and Huh #cite(label("BH2020"));
  we prove the specific integer summation and binary contraction statements needed here.
  The omission property controls transport between conditional transversal laws.
  The addition property compares defect masses. Passing the latter inequalities between the two weights incurs
  only polynomial losses.

===== 1.2.3 The chain, its observables, and bounded computation. <the-chain-its-observables-and-bounded-computation.>

We simulate exchanges of one selected and one unselected element,
  using $f_j$ and a multiplier for each defect type. As in the permanent algorithm of Jerrum, Sinclair,
  and Vigoda #cite(label("JSV2004")) Section 3, the multipliers balance the type masses and are learned from
  observed type frequencies during annealing. The paired transport, variance,
  and trace analysis adapts the common-bases construction of #cite(label("OpenAICommonBases2026")) Sections 4–6,
  with the two distinct weights supplying its two signature inputs.

The quantities to estimate are the adjacent ratios $C \( j + 1 \) \/ C \( j \)$ and the defect-type probabilities.
  A variance bound controls these observables even though it does not bound arbitrary fluctuations within each
  defect type. Restricted variance estimates also underlie the permanent algorithm of Chen, Vigoda,
  and Yang #cite(label("CVY2026")). Here we additionally control the chain’s #emph[transversal trace],
  which records successive returns to the transversal class.
  Its mixing and return-cost bounds provide fresh starts for estimating the ratios;
  their product recovers $C \( H \)$ from $C \( 0 \)$.

Finally, the completion weights $h_j$ are evaluated approximately by a walk on polynomially many bins per free
  coordinate, with a correction for the different numbers of integers in the bins.
  The product grid itself can be exponentially large; only polynomially many transitions are simulated.
  Fresh weight estimates and finite-bit choices are coupled to the exact-weight analysis at each adaptive request.
  Caps on trace restarts and all numerical subroutines give a polynomial work bound on every execution,
  while the accuracy analysis bounds the probability of an inaccurate estimate or a capped restart.

=== 1.3 Organization and conventions <organization-and-conventions>

Section 2 constructs the forest coordinates and softened counts.
  Section 3 proves the integer summation properties and controls contamination by invalid completions.
  Section 4 introduces the binary weights and proves their signatures and defect inequalities.
  Section 5 derives transport, observable variance, and trace estimates.
  Section 6 implements approximate evaluation of the completion weights.
  Section 7 specifies annealing, implements it using fair bits, and proves Theorem 1.
  Section 8 gives the counting and total-variation sampling consequences for bounded integral network flows.

All logarithms with a subscript $2$ are binary; $log$ in exponential estimates is natural.
  Sums over edges in Dirichlet forms are over unordered edges unless stated otherwise.
  A symmetric matrix has #emph[at most one positive eigenvalue] when its positive inertia index is at most one,
  with multiplicity. This property concerns quadratic forms and is preserved by restriction and limits;
  preservation under pair summation will be proved, not assumed.
  The large matrices, conditioning trees, and transport flows used in these proofs are not constructed by the algorithm.

== 2 Tight capacities and two scales <sec:scales>

We first reduce the input to one in which every coordinate bound is attained.
  The use of tight capacities and a maximum-capacity spanning forest follows the representation of integral flows
  in #cite(label("CDR2010")). The estimates below allow both dimensions and all capacities to vary.

For feasibility, form a directed network with a source, the row and column vertices, and a sink.
  Give the source-to-row arcs capacities $r_i$, the row-to-column arcs capacities $b_(i j)$,
  and the column-to-sink arcs capacities $c_j$. An integral flow of value $N = sum_i r_i =
  sum_j c_j$ is exactly a feasible table: at that value every arc incident to the source or sink is saturated.
  The shortest-augmenting-path algorithm of Edmonds and Karp #cite(label("EK1972")) Theorem 1 uses $O \( V E \)$
  augmentations, where $V$ and $E$ are the numbers of vertices and arcs.
  The present network is simple, so $E = O \( V^2 \)$ and the bound is $O \( V^3 \)$,
  independently of the numerical capacities. Each augmenting path is found by breadth-first search in
  $O \( V + E \)$ operations. Starting at zero, augmentation by the minimum residual capacity preserves
  integrality. All flow and residual-capacity values have polynomial binary length,
  so this gives a deterministic polynomial-bit feasibility test for the present network.

Return zero if the input is infeasible. For a feasible input,
  let $ell_s$ and $u_s$ be the minimum and maximum feasible integer values of cell $s$.
  Each extremum is computable by binary search using flow feasibility with one additional upper or lower bound.
  A lower bound is subtracted from its cell and the two incident margins before applying the flow test;
  if a residual margin or capacity is negative, reject that tested bound immediately.
  The searches use polynomially many operations on integers of polynomial binary length.

Replace each cell value $X_s$ by $X_s - ell_s$, replace its upper bound by $b_s = u_s - ell_s$,
  and subtract all incident minima from each margin. This is a bijection between the original and the new feasible
  sets: every original feasible table satisfies all its individual extremum bounds,
  and adding back the minima is the inverse map. In the new instance,
  each endpoint $0$ and $b_s$ is attained by a feasible table,
  possibly a different table for each endpoint and cell. Delete cells with $b_s = 0$.
  A deleted cell contributes no choice. Retain all row and column vertices, including isolated vertices,
  and write $r \, c$ for the new margins and $Z$ for the unchanged count.

Let $L$ be the binary input length from Theorem 1, and retain the original dimensions $m \, n$. Fix

#[#set math.equation(numbering: n => "(2)")
 $ d = m n + m + n + 2 \, wide K = 20 #scale(x: 120%, y: 120%)[\(] L + d +
   ceil.l log_2 \( 1 \/ epsilon \) ceil.r + 1 #scale(x: 120%, y: 120%)[\)] \, wide gamma = frac(epsilon, 512 d K) \,\
A = ⌈frac(4 K, gamma)⌉ \, wide B = 16 A d^2 \, wide W = 100 d B \, wide H = 10 A d^2 \( W + 1 \) . $ <eq:parameters>]

All these parameters except $gamma$ are positive integers.
  Here $K$ bounds the logarithmic counting scales, $gamma$ is a relative width near a tree boundary,
  and $A$ sets the penalty strength. The parameter $B$ is the number of bins per free coordinate,
  $W$ separates small and large capacities, and $H$ bounds the penalty and is the final annealing index.
  Binary encoding and the fact that tightened capacities never increase give

#[#set math.equation(numbering: n => "(3)")
 $ product_(s upright(" remaining")) \( b_s + 1 \) lt.eq 2^L lt.eq 2^K \, wide 2^(- 3 K) lt.eq epsilon /
   128 . $ <eq:capacity-product>]

Indeed, a nonnegative integer written with $ell$ binary digits has at most $2^ell$ possible values between zero
  and itself. For the second inequality, the definition of $K$ gives $3 K gt.eq log_2 \( 128 \/ epsilon \)$.
  Call a remaining cell #emph[small] if $b_s < W$, and #emph[large] otherwise.
  Write $cal(S)$ for the small cells and set

$ p = sum_(s in cal(S)) b_s . $

There are at most $m n < d$ remaining cells and $m + n < d$ vertices, so $p lt.eq d W$.
  In particular the number of binary slots introduced later is polynomial. More explicitly, $d \, K = O \( L \)$ and

$ A = O \( L^3 epsilon^(- 1) \) \, quad B = O \( L^5 epsilon^(- 1) \) \, quad W = O \( L^6 epsilon^(- 1) \) \,
  quad H = O \( L^11 epsilon^(- 2) \) . $

Here $L$ includes the encoding of $epsilon$, so $ceil.l log_2 \( 1 \/ epsilon \) ceil.r = O \( L \)$.
  These bounds concern the numerical values of the auxiliary parameters;
  the retained capacities themselves continue to have polynomial binary length.

Form the bipartite graph whose vertices are the rows and columns and whose edges are the large cells.
  In each connected component choose a spanning tree of maximum total capacity, and choose a root.
  An isolated vertex constitutes a component with an empty tree.
  The union of these trees is denoted by $cal(T)$; the large cells outside $cal(T)$ form the set $cal(F)$ of
  #emph[free cells]. Sorting large cells by decreasing capacity and adding an edge whenever it joins two current
  components constructs such a forest in polynomial time.

The small cells will have separate row and column coordinates.
  The small-cell contributions to row and column equations will therefore use disjoint coordinate sets.
  We recover an actual table by requiring the two physical values of each small cell to agree.

For each small cell $s$, take integer counts $x_s \, y_s in { 0 \, dots.h \, b_s }$.
  Its contribution to its row margin is $x_s$, and its contribution to its column margin is $b_s - y_s$.
  Thus the two contributions agree precisely when $x_s + y_s = b_s$.
  For example, when $b_s = 3$, the profile $\( x_s \, y_s \) = \( 2 \, 1 \)$ gives physical value two at both
  endpoints, whereas $\( 2 \, 2 \)$ gives row value two and column value one.
  For a large cell there is a single value at both endpoints.
  Given free values $\( z_e \)_(e in cal(F))$, impose the prescribed margin at every nonroot vertex and solve for
  the values $\( z_t \)_(t in cal(T))$. As proved below, this has a unique real solution,
  which is integral when the free values are integral. For a root $v$,
  let $delta_v$ be its resulting actual incident sum minus its prescribed margin. Define

#[#set math.equation(numbering: n => "(4)")
 $ D \( x \, y \, z \) =
   A
   (sum_(v upright(" a root")) \| delta_v \| + sum_(t in cal(T)) frac("dist" \( z_t \, \[ 0 \, b_t \] \), b_t)) .
   $ <eq:penalty>]

In this expression $z$ denotes the free vector; the tree values and root deviations are its determined functions.
  The denominators $b_t$ are positive because every tree cell is large.

#thm([Lemma 2.1.])[
  (Forest estimates).  #emph[For a free cell $e$, every tree cell $t$ on the path joining its endpoints satisfies
    $b_e lt.eq b_t$. For every box-valid integer small profile $\( x \, y \)$ and every real free vector $z in
    product_(e in cal(F)) \[ 0 \, b_e + 1 \]$, the nonroot equations have a unique solution.
    This solution is integral for integral $z$, and the root deviations are independent of $z$.]
  #emph[For any fixed feasible table $X^(*)$ of the tightened instance,
#[#set math.equation(numbering: n => "(5)")
 $ \| z_t - X_t^(*) \| lt.eq 4 d b_t quad \( t in cal(T) \) \, wide sum_(v upright(" a root")) \| delta_v \| lt.eq
   2 d W . $ <eq:forest-displacement>]

 Consequently, throughout the extended free box,
$ 0 lt.eq D lt.eq H \, wide z_t in \[ - 10 d b_t \, 10 d b_t \] quad \( t in cal(T) \) . $

 For fixed $\( x \, y \)$, set $u_e = z_e \/ \( b_e + 1 \)$.
   As a function of $u$, the penalty $D$ is convex on $\[ 0 \, 1 \]^(cal(F))$ and satisfies
#[#set math.equation(numbering: n => "(6)")
 $ \| D \( x \, y \, u \) - D \( x \, y \, u' \) \| lt.eq 2 A d^2 parallel u - u' parallel_oo . $ <eq:forest-lipschitz>]

 For an empty free set the domain is a singleton and the last bound has its usual vacuous interpretation.]
] <lem:forest>

#proof[
  If a free edge had larger capacity than a tree edge on its path,
    exchanging those two edges would increase the total tree capacity. This proves the path inequality.
    Leaf elimination proves existence and uniqueness of the nonroot solution:
    at a nonroot leaf its margin equation determines the edge to its parent,
    after which that vertex can be removed. The same procedure proves integrality and that all tree values are
    affine functions of the free values. No equation is imposed at the last, root vertex.
    For a singleton component there are no unknown tree values and no nonroot equations.
  Changing a free value affects tree values along its tree path. Small-cell profiles need more care:
    their two physical views need not agree, so their contributions must be counted by incidences rather than
    cancelled as an ordinary flow. The following cut identities keep both effects explicit.
    Give a row vertex sign $sigma_v = 1$ and a column vertex sign $sigma_v = - 1$.
    For a small-cell incidence $\( v \, s \)$, let
  $ a_(v \, s) =
    cases(delim: "{", x_s \, & v upright(" is the row of ") s \,, b_s - y_s \, & v upright(" is the column of ")
    s \,) wide Delta a_(v \, s) = a_(v \, s) - X_s^(*) . $
  For a large cell write $Delta z_e = z_e - X_e^(*)$, including solved tree cells in this notation.
    Remove a tree edge $t$, and let $U_t$ be the vertex set on the side away from the root;
    let $v_t$ be the endpoint of $t$ in $U_t$. Sum the differences of the nonroot margin equations over $U_t$,
    with signs $sigma_v$. Internal large edges cancel. If $v \( e \, U_t \)$ is the unique endpoint in $U_t$ of a
    free edge crossing the cut, the result is
  #[#set math.equation(numbering: n => "(7)")
   $ sigma_(v_t) Delta z_t = - sum_(e in cal(F)\
e upright(" crosses ") U_t) sigma_(v \( e \, U_t \)) Delta z_e - sum_(s in cal(S) \, med v in U_t\
v upright(" incident to ") s) sigma_v Delta a_(v \, s) . $ <eq:forest-cut>]
  The last sum is over incidences, including both incidences when a small edge has both endpoints in $U_t$;
    its two values can differ for an unbalanced profile.
  Each crossing free edge has $t$ on its tree path. Hence $\| Delta z_e \| lt.eq b_e + 1 lt.eq
    2 b_t$ even on the extended real free box. Every small incidence satisfies $\| Delta a_(v \, s) \| lt.eq
    b_s < W lt.eq b_t$. There are at most $d$ free edges and $2 d$ small incidences.
    Equation (7) therefore gives $\| Delta z_t \| lt.eq 4 d b_t$.
  For a whole large-cell component $U$ with root $v_0$, the analogous signed sum cancels every large-cell
    contribution and gives
  $ sigma_(v_0) delta_(v_0) = sum_(s in cal(S) \, med v in U\
v upright(" incident to ") s) sigma_v Delta a_(v \, s) . $
  This proves independence from all free values, also for a singleton component.
    Summing absolute values over components yields $sum_(v_0) \| delta_(v_0) \| lt.eq
    2 sum_(s in cal(S)) b_s lt.eq 2 d W$. Since $X_t^(*) in \[ 0 \, b_t \]$, the displacement bound now implies
  $ 0 lt.eq D lt.eq A \( 2 d W + 4 d^2 \) lt.eq 10 A d^2 \( W + 1 \) = H . $
  It also places $z_t$ in $\[ - 4 d b_t \, \( 4 d + 1 \) b_t \] subset.eq \[ - 10 d b_t \, 10 d b_t \]$.
  Finally, subtract (7) for two free vectors with the same small profile.
    Each coefficient in normalized coordinates is $plus.minus \( b_e + 1 \)$ for an edge crossing the cut,
    and its absolute value divided by $b_t$ is at most two. Thus
  $ frac(\| z_t \( u \) - z_t \( u' \) \|, b_t) lt.eq 2 d parallel u - u' parallel_oo . $
  Distance from an interval is convex and is 1-Lipschitz. Composing with the affine tree values and summing at
    most $d$ tree terms proves convexity and (6); the root terms are constant in the free coordinates. ◻
]

Define the small-profile domain

$ cal(P) = {\( x \, y \) in product_(s in cal(S)) { 0 \, dots.h \, b_s }^2 : sum_(s in cal(S)) \( x_s + y_s \) = p} . $

For each integer $j in { 0 \, dots.h \, H }$, set

#[#set math.equation(numbering: n => "(8)")
 $ h_j \( x \, y \) = sum_(z in product_(e in cal(F)) { 0 \, dots.h \, b_e }) 2^(- j D \( x \, y \, z \) \/ H) \,
   wide \( x \, y \) in cal(P) . $ <eq:hj>]

When needed, extend $h_j$ by zero outside $cal(P)$. On $cal(P)$ it is strictly positive,
  including at unbalanced profiles. With the empty-product convention, put $M_f =
  product_(e in cal(F)) \( b_e + 1 \)$. Lemma 2 gives

$ M_f 2^(- j) lt.eq h_j \( x \, y \) lt.eq M_f . $

An empty free block contributes one term, of value $2^(- j D \( x \, y \) \/ H)$.
  If there are no small cells, then $p = 0$ and $cal(P)$ contains only the empty profile.

The partition functions of interest are

#[#set math.equation(numbering: n => "(9)")
 $ C \( j \) = sum_(\( x \, y \) in cal(P)\
x_s + y_s = b_s med \( s in cal(S) \)) h_j \( x \, y \) . $ <eq:Cj>]

In particular, $C \( 0 \) = M_f product_(s in cal(S)) \( b_s + 1 \)$ is explicitly computable.
  Equations (8) and (9) define finite mathematical sums. Section 6 and the subsequent annealing algorithm estimate
  them using polynomially many operations on binary representations,
  without enumerating the free ranges or the small-profile domain.
  The outer counting algorithm in Section 7 estimates the adjacent ratios in the identity

$ C \( H \) = C \( 0 \) product_(j = 0)^(H - 1) frac(C \( j + 1 \), C \( j \)) . $

#thm([Proposition 2.2.])[
  (Contamination bound).  #emph[For the feasible tightened instance,
$ Z lt.eq C \( H \) lt.eq \( 1 + epsilon \/ 32 \) Z . $

]
] <prop:contamination>

The lower bound counts each feasible table with weight one.
  For the upper bound, strong penalties immediately control root violations and large tree violations;
  tree values just outside their intervals require a marginal estimate.
  We prove that estimate and complete the proof of Proposition 3 in Section 3.

== 3 Integer signatures and the softened count <sec:integer-signatures>

We will use the two-view encoding for all retained cells to obtain two properties of the softened count.
  First, after summing the large cells, the count weight $h_j$ must satisfy quadratic inequalities that will pass
  to the binary encoding. Second, a tree-value marginal in $C \( H \)$ must be log-concave,
  so that attainable endpoints control the near-boundary violations left in Proposition 3.
  Both follow from the same integer balanced-summation argument.

The one-positive-eigenvalue tests are closely related to the Lorentzian-polynomial framework of Brändén and
  Huh #cite(label("BH2020")). The laminar decomposition and balanced-summation argument for widths at least two
  appear in #cite(label("OpenAIExactTables2026")) Lemmas 3.2–3.3 and Proposition 3.4.
  We prove the closure statement in the form needed here, including pairs of width one.

=== 3.1 A projection fact for quadratic forms <a-projection-fact-for-quadratic-forms>

We first record an elementary fact that will be used repeatedly.
  If a real symmetric matrix $Q$ has at most one positive eigenvalue and $u^(sans(T)) Q u > 0$,
  then $Q$ is nonpositive on

$ { v : v^(sans(T)) Q u = 0 } . $

Indeed, a positive-square vector in this subspace, together with $u$,
  would span a two-dimensional positive-definite subspace. Subtracting the projection of an arbitrary vector $v$
  onto $u$ therefore gives

#[#set math.equation(numbering: n => "(10)")
 $ v^(sans(T)) Q v lt.eq frac(\( v^(sans(T)) Q u \)^2, u^(sans(T)) Q u) . $ <eq:signature-projection>]

Conversely, a symmetric form that is nonpositive on a subspace of codimension at most one has at most one positive
  eigenvalue. The latter property is preserved by restriction, by congruence,
  and by entrywise limits of matrices of a fixed size. For limits,
  this follows from continuity of the ordered eigenvalues.

We also need the boundary case of the projection inequality.
  If $e^(sans(T)) Q e = 0$ but $Q e eq.not 0$, then $Q$ is nonpositive on ${ v : v^(sans(T)) Q e = 0 }$.
  Indeed, choose $w = Q e$, so $e^(sans(T)) Q w = parallel Q e parallel^2 > 0$.
  For sufficiently small $t > 0$, $u = e + t w$ has positive square. For $v^(sans(T)) Q e = 0$, (10) gives

$ v^(sans(T)) Q v lt.eq frac(t^2 \( v^(sans(T)) Q w \)^2, 2 t e^(sans(T)) Q w + t^2 w^(sans(T)) Q w) arrow.r 0 . $

=== 3.2 Integer coordinates and balanced summation <integer-coordinates-and-balanced-summation>

Let $I$ be a finite coordinate set, let $m_i$ be nonnegative integers,
  and let $cal(L)$ be a laminar family of subsets of $I$: any two members are nested or disjoint.
  For $G in cal(L)$, let $psi_G : bb(Z) arrow.r \( 0 \, oo \)$ be log-concave, meaning

$ psi_G \( a \)^2 gt.eq psi_G \( a - 1 \) psi_G \( a + 1 \) wide \( a in bb(Z) \) . $

Fix an integer $R$. On the total slice of size $R$, define

#[#set math.equation(numbering: n => "(11)")
 $ F \( z \) = product_(G in cal(L)) psi_G (sum_(i in G) z_i) quad upright("if ") 0 lt.eq z_i lt.eq
   m_i upright(" and ") sum_i z_i = R \, $ <eq:laminar-weight>]

and set $F \( z \) = 0$ otherwise. All coordinates and displays in this subsection are integral.
  Coincident members of a laminar family may be combined by multiplying their factors.

Choose disjoint coordinate pairs ${ a_t \, b_t }$, $t in J$, with $m_(a_t) = m_(b_t) = M_t$.
  Summing such a pair #emph[at balance] means summing its profiles $\( k \, M_t - k \)$, $0 lt.eq k lt.eq M_t$.
  Let $Phi$ be the weight on the remaining coordinates after summing all pairs in $J$ at balance. Its required total is

$ r = R - sum_(t in J) M_t . $

#thm([Lemma 3.1.])[
  (Integer signature under balanced summation).  #emph[Suppose $M_t gt.eq 1$ for every pair that is summed.
    For every box-valid display $z$ on the remaining coordinates with $sum_i z_i = r + 2$, the symmetric matrix
#[#set math.equation(numbering: n => "(12)")
 $ #scale(x: 120%, y: 120%)[\(] Phi \( z - e_i - e_h \) #scale(x: 120%, y: 120%)[\)]_(i \, h) quad
   upright("has at most one positive eigenvalue") . $ <eq:integer-removal-signature>]

 The diagonal entries in this matrix are the weights after two removals from the same coordinate;
   invalid removals have weight zero. The corresponding assertion for two additions holds for every box-valid
   display of total $r - 2$.]
] <lem:integer-signature>

#proof[
  We first prove the removal assertion without summation. Coordinates with $z_i =
    0$ give zero rows and columns and may be discarded. Temporarily evaluate all remaining entries using the
    product of factors, even when a repeated removal would give a negative coordinate.
    This evaluation is well-defined because the factors are defined on all integers. Write
  $ l_G = sum_(i in G) z_i \, wide gamma_G = frac(psi_G \( l_G \) psi_G \( l_G - 2 \), psi_G \( l_G - 1 \)^2) . $
  Log-concavity gives $0 < gamma_G lt.eq 1$. Factor out the value of the product at the display and,
    from each matrix index $i$, the positive single-removal ratio
  $ product_(G in.rev i) frac(psi_G \( l_G - 1 \), psi_G \( l_G \)) . $
  Thus, up to a positive scalar and a positive diagonal congruence, the entry at $i \,
    h$ is $product_(G supset.eq { i \, h }) gamma_G$. Restrict the factor sets to the retained coordinates and
    combine duplicates if necessary. Laminarity then gives the matrix identity
  #[#set math.equation(numbering: n => "(13)")
   $ (product_(G supset.eq { i \, h }) gamma_G)_(i \, h) = upright(bold(1)) upright(bold(1))^(sans(T)) -
     sum_(G in cal(L)) \( 1 - gamma_G \) (product_(G' in cal(L)\
G' supset.neq G) gamma_(G')) upright(bold(1))_G upright(bold(1))_G^(sans(T)) . $ <eq:laminar-rank-one>]
  For each entry the identity telescopes along the chain of sets containing both indices.
    The right-hand side is a rank-one positive semidefinite matrix minus a positive semidefinite matrix,
    so it has at most one positive eigenvalue. The only invalid removals still present are repeated removals from
    a coordinate with displayed value one. Their positive diagonal entries must be replaced by zero,
    which subtracts a nonnegative diagonal matrix. This cannot increase the number of positive eigenvalues.
  We now induct on the number of summed pairs. Suppose some pairs have already been summed,
    and let $Psi$ denote the resulting weight before the next pair of capacity $M gt.eq 1$ is summed.
    Fix a box-valid display $z$ on the other coordinates, two above their new required total.
    For $0 lt.eq k lt.eq M$, apply the induction hypothesis to the display $\( z \, k \, M - k \)$.
    The resulting matrix, with the two pair coordinates listed last, is
  #[#set math.equation(numbering: n => "(14)")
   $ N_k =
     mat(delim: "(", V_k, S \( k - 1 \), S \( k \); S \( k - 1 \)^(sans(T)), u_(k - 1), u_k; S \( k \)^(sans(T)),
     u_k, u_(k + 1)) \, $ <eq:integer-summation-matrix>]
  where
  #[#set math.equation(numbering: n => "(15)")
   $ \( V_k \)_(i h) & = Psi \( z - e_i - e_h \, k \, M - k \) \,\
S \( l \)_i & = Psi \( z - e_i \, l \, M - 1 - l \) \,\
u_k & = Psi \( z \, k - 1 \, M - 1 - k \) . $ <eq:integer-summation-entries>]
  Every $N_k$ has at most one positive eigenvalue. As usual, all out-of-box terms are zero.
    In particular, $S \( - 1 \) = S \( M \) = 0$, and $u_k = 0$ outside $1 lt.eq k lt.eq M - 1$.
    The matrix after summation is $sum_(k = 0)^M V_k$. We must find one common subspace of codimension at most one
    on which this sum is nonpositive; simply adding the matrices $N_k$ would not establish that property.
  If $M = 1$, put $S = S \( 0 \)$. After deleting their zero pair axis, $N_0$ and $N_1$ have the respective forms
  $ mat(delim: "(", V_0, S; S^(sans(T)), 0) \, wide mat(delim: "(", V_1, S; S^(sans(T)), 0) . $
  When $S eq.not 0$, the null-axis projection just proved shows that both $V_0$ and $V_1$ are nonpositive on ${
    a : a^(sans(T)) S = 0 }$. Their sum therefore has at most one positive eigenvalue.
    If any displayed coordinate $z_i$ is positive, then $S_i = Psi \( z - e_i \, 0 \, 0 \) > 0$:
    the profile has the required total and every previously summed pair supplies a positive balanced term.
    Thus $S = 0$ can occur only when $z = 0$, in which case all removals are invalid and $V_0 = V_1 = 0$.
    This proves the width-one case.
  Assume henceforth that $M gt.eq 2$. For each interior index $k$, $u_k > 0$:
    the displayed coordinates are box-valid and have the correct total,
    and any balanced profile on each previously summed pair supplies a positive term in the original
    positive-factor model.
  For larger widths the common subspace is determined by the sum of the one-removal vectors $S \( l \)$.
    Cumulative sums provide auxiliary coordinates whose contributions will telescope.
    Consider an old-index vector $a$ satisfying the single linear condition
  $ a^(sans(T)) sum_(l = 0)^(M - 1) S \( l \) = 0 . $
  Define
  $ g_k = frac(a^(sans(T)) sum_(l = 0)^(k - 1) S \( l \), u_k) quad \( 1 lt.eq k lt.eq M - 1 \) \, wide g_k =
    0 quad upright("otherwise") . $
  The endpoint condition on $a$, as well as the cumulative-sum definition at interior indices, gives
  #[#set math.equation(numbering: n => "(16)")
   $ a^(sans(T)) S \( l \) = u_(l + 1) g_(l + 1) - u_l g_l wide \( 0 lt.eq l lt.eq M - 1 \) . $ <eq:integer-cumulative>]
  For $v_k = \( a \, g_k \, - g_k \)$, its products under the form $N_k$ with the first and second new coordinate
    axes are, respectively,
  $ u_(k - 1) \( g_k - g_(k - 1) \) \, wide u_(k + 1) \( g_(k + 1) - g_k \) . $
  If either of those axes has positive square, applying (10) to that axis and adding the other nonnegative term gives
  #[#set math.equation(numbering: n => "(17)")
   $ v_k^(sans(T)) N_k v_k lt.eq u_(k - 1) \( g_k - g_(k - 1) \)^2 +
     u_(k + 1) \( g_k - g_(k + 1) \)^2 . $ <eq:integer-projection-bound>]
  If both axis squares vanish, their diagonal entries $u_(k - 1) \, u_(k + 1)$ are zero.
    The endpoint cases $k = 0 \, M$ have a positive other diagonal because $M gt.eq 2$;
    hence in the remaining case $u_k > 0$. The sum of the two axes then has square $2 u_k >
    0$ and product zero with $v_k$. Applying (10) to this sum again gives (17), whose right-hand side is now zero.
    This includes the case $M = 2 \, k = 1$.
  Substitute (16) into (17) and expand. The terms involving $g_k g_(k - 1)$ and $g_k g_(k + 1)$ cancel, leaving
  #[#set math.equation(numbering: n => "(18)")
   $ a^(sans(T)) V_k a + 2 u_k g_k^2 - u_(k - 1) g_(k - 1)^2 - u_(k + 1) g_(k + 1)^2 lt.eq
     0 . $ <eq:integer-telescoping>]
  Sum this inequality over $0 lt.eq k lt.eq M$. Every interior $u_k g_k^2$ cancels,
    and all exterior terms are zero. Consequently $sum_k V_k$,
    which is the desired matrix after summing the next pair, is nonpositive on the kernel of one linear
    functional. Its number of positive eigenvalues is therefore at most one. This completes the induction.
  Finally reflect every coordinate in its box: $z_i mapsto m_i - z_i$.
    A factor on a set $G$ remains a positive log-concave sequence in the sum on $G$,
    with its argument reversed and translated. A balanced pair of capacity $M$ remains balanced under this
    reflection, so reflection commutes with balanced summation.
    The reflected remaining weight is $Phi^or \( z \) = Phi \( m - z \)$.
    A display two below the original total becomes a display two above the reflected total, and
  $ Phi^or \( m - z - e_i - e_h \) = Phi \( z + e_i + e_h \) . $
  The removal assertion for the reflected model is precisely the addition assertion for the original model. ◻
]

The conclusion of Lemma 4 also holds for entrywise limits of these weights.
  All sums used in this section are finite, so such limits commute with the summations.
  For a member $G$ of the laminar family, an exact equality $sum_(i in G) z_i =
  l$ can be imposed by multiplying its factor by the positive log-concave sequence

$ u^(\| sum_(i in G) z_i - l \|) \, wide 0 < u < 1 \, $

followed by $u arrow.b 0$. We will take limits only after applying the positive-factor argument,
  including all divisions in its proof.

=== 3.3 Application to the softened table weights <application-to-the-softened-table-weights>

Recall the weights $h_j \( x \, y \)$ from (8), on small-cell counts of total

$ p = sum_(s med upright("small")) b_s . $

Here and below each small cell contributes two count coordinates, one for its row view and one for its column view.

#thm([Corollary 3.2.])[
  #emph[For $0 lt.eq j lt.eq H$, the matrix of two-removal weights of $h_j$ at every box-valid display of total
    $p + 2$ has at most one positive eigenvalue. The corresponding two-addition matrix at every box-valid display
    of total $p - 2$ has the same property.]
] <cor:hj-signatures>

#proof[
  Introduce a finite physical interval $\[ ell_s \, ell_s + M_s \]$ for every retained cell.
    For small and free cells take $\[ 0 \, b_s \]$, and for a tree cell take
  $ \[ ell_s \, ell_s + M_s \] = \[ - 10 d b_s \, 10 d b_s \] . $
  Lemma 2 shows that these tree intervals contain every completion required by the definition of $h_j$.
    Represent a physical row-view value as $ell_s + x_s$ and a physical column-view value as $ell_s + M_s - y_s$,
    where $0 lt.eq x_s \, y_s lt.eq M_s$. The two views agree when $x_s + y_s = M_s$. Use the full total slice
  $ sum_s \( x_s + y_s \) = sum_s M_s . $
  For a row or column vertex $v$, let $kappa_v$ be its prescribed margin and write its physical line sum as
  $ L_v \( x \, y \) =
    cases(delim: "{", sum_(s in.rev v) \( ell_s + x_s \) \, & v upright(" is a row") \,, sum_(s in.rev v) \(
    ell_s + M_s - y_s \) \, & v upright(" is a column") .) $
  For $0 < alpha < 1$, give each box-valid profile on the full total slice the positive weight
  #[#set math.equation(numbering: n => "(19)")
   $ alpha^(sum_(v upright(" nonroot")) \| L_v - kappa_v \|)
     2^(- frac(j A, H) (sum_(v upright(" root")) \| L_v - kappa_v \| + sum_(t in cal(T)) frac("dist" \( ell_t +
     x_t \, \[ 0 \, b_t \] \), b_t))) . $ <eq:laminar-table-model>]
  Each factor is log-concave in its indicated coordinate sum.
    Row factors use disjoint groups of $x$ coordinates, and column factors use disjoint groups of $y$ coordinates.
    These two collections are also disjoint from one another.
    The only additional factors are unary tree factors, each nested in its row group.
    Thus the entire family is laminar. Letting $alpha arrow.b
    0$ imposes every nonroot equation exactly while retaining the root and tree penalties.
  Sum every large-cell pair at balance. The widths of all summed pairs are positive. The remaining total is $p$.
    For every small count profile on that slice and every free-cell assignment,
    the exact nonroot equations have a unique tree completion, and it lies in the chosen intervals by Lemma 2.
    Therefore, in the equality limit, each free assignment contributes exactly one term,
    with precisely the root and tree penalty defining $h_j$; there is no multiplicity from tree coordinates.
    The removal assertion follows from Lemma 4 and passage to a finite limit.
    Reflecting all coordinates, including those that are summed, gives the addition assertion by the same lemma. ◻
]

=== 3.4 Tree marginals and contamination <tree-marginals-and-contamination>

For a tree cell $t$, let $a_t \( k \)$ be the unnormalized marginal mass of its physical value $k$ under the final
  weighted sum $C \( H \)$. Explicitly,

#[#set math.equation(numbering: n => "(20)")
 $ a_t \( k \) = sum_(x_s + y_s = b_s med upright("for every small ") s\
0 lt.eq z_e lt.eq b_e med upright("for every free ") e\
z_t \( x \, y \, z \) = k) 2^(- D \( x \, y \, z \)) . $ <eq:tree-marginal-definition>]

The sums are over integer profiles, and the tree value in the constraint is the unique nonroot completion.
  In particular $sum_k a_t \( k \) = C \( H \)$.

#thm([Lemma 3.3.])[
  (Log-concave tree marginals).  #emph[For integers $v < k < w$ such that $a_t \( v \) \, a_t \( w \) > 0$,
#[#set math.equation(numbering: n => "(21)")
 $ a_t \( k \) gt.eq a_t \( v \)^(\( w - k \) \/ \( w - v \)) a_t \( w \)^(\( k - v \) \/ \( w - v \)) .
   $ <eq:tree-marginal-interpolation>]

 Consequently the positive support of $a_t$ is an integer interval.]
] <lem:tree-marginal>

#proof[
  Use the finite interval representation and positive weight (19) at $j = H$, with $0 < alpha < 1$.
    Sum every cell pair except $t$ at balance. All retained cells have positive width,
    including small cells of bound one, so Lemma 4 applies. The remaining required total is $M_t$.
    Let $a_(t \; alpha) \( k \)$ be the resulting weight of the retained balanced pair with physical value $k$,
    for $ell_t lt.eq k lt.eq ell_t + M_t$. It is positive throughout this integer interval:
    after fixing the retained pair, any balanced choices for all other pairs satisfy the boxes and total slice,
    and every factor is positive. Exact nonroot equations are not required before taking the limit.
  At an interior value $k$, the retained profile is
  $ \( k - ell_t \, med ell_t + M_t - k \) . $
  Adding one to both coordinates gives a box-valid display two above its required total.
    Lemma 4 applied to the two remaining coordinates gives the matrix
  $
    mat(delim: "(", a_(t \; alpha) \( k - 1 \), a_(t \; alpha) \( k \); a_(t \; alpha) \( k \), a_(t \; alpha) \(
    k + 1 \)) $
  with at most one positive eigenvalue. Its positive trace implies a nonpositive determinant, so
  $ a_(t \; alpha) \( k \)^2 gt.eq a_(t \; alpha) \( k - 1 \) a_(t \; alpha) \( k + 1 \) . $
  All these marginal masses are positive. Their logarithms therefore have nonincreasing successive differences,
    which proves global interpolation between any two values in the interval.
  Now let $alpha arrow.b 0$. The sums are finite, and the surviving profiles satisfy every nonroot equation.
    For each balanced small profile and free assignment those equations have exactly one tree completion,
    contained in the chosen intervals by Lemma 2. The surviving weight is exactly $2^(- D)$. Consequently, term by term,
  $ a_(t \; alpha) \( k \) arrow.r a_t \( k \) . $
  Pass the global interpolation inequality to this limit. For positive limiting endpoint masses its right-hand
    side is positive, giving (21) and ruling out any internal support gap.
    No inference from adjacent inequalities alone after the limit is needed. ◻
]

We can now finish the comparison between the softened count and the number of feasible tables.
  The endpoint attainability obtained by tightening supplies the two positive marginal masses needed below.

#proof[
  Expand $C \( H \)$ over balanced small profiles and free integer vectors, giving each assignment mass $2^(- D)$.
    The forest equations determine one tree vector for each such assignment.
    It represents a feasible table exactly when every root deviation is zero and every tree value belongs to its
    allowed interval. These assignments each have mass one, so $C \( H \) gt.eq Z gt.eq 1$.
    The total number of assignments is $product_(s in cal(S)) \( b_s + 1 \) product_(e in cal(F)) \( b_e + 1 \)
    lt.eq 2^K$, and every mass is at most one.
  Call an assignment #emph[far] if a root deviation is nonzero or a tree value has distance at least $gamma
    b_t$ from $\[ 0 \, b_t \]$. A nonzero root deviation is an integer of absolute value at least one.
    Since $gamma < 1$ and $A gamma gt.eq 4 K$, every far assignment has $D gt.eq 4 K$.
    The total mass of all far assignments is therefore at most $2^K 2^(- 4 K) = 2^(- 3 K) lt.eq epsilon \/ 128$.
    Because $C \( H \) gt.eq 1$, this also bounds its fraction of the total mass.
  For each tree cell $t$, its marginal satisfies
  $ sum_(k in bb(Z)) a_t \( k \) = C \( H \) \, wide 0 lt.eq a_t \( k \) lt.eq 2^K \, wide a_t \( 0 \) \,
    a_t \( b_t \) gt.eq 1 . $
  The endpoint inequalities follow from endpoint attainability after tightening and the unit mass of each feasible
    table. If $k < 0$ and $a_t \( k \) > 0$, use (21) from $k$ toward $b_t$.
    For every integer $0 lt.eq r lt.eq floor.l \( b_t - k \) \/ K floor.r$, writing $alpha =
    r \/ \( b_t - k \) lt.eq 1 \/ K$, the endpoint cases and interpolation give
  $ a_t \( k + r \) gt.eq a_t \( k \)^(1 - alpha) a_t \( b_t \)^alpha gt.eq a_t \( k \) thin 2^(- K alpha) gt.eq
    frac(a_t \( k \), 2) . $
  All these integers lie between $k$ and $b_t$. Their number is $floor.l \( b_t - k \) \/ K floor.r + 1 gt.eq
    b_t \/ K$, and hence $a_t \( k \) \/ C \( H \) lt.eq 2 K \/ b_t$.
  For the other exterior side, let $k > b_t$ with $a_t \( k \) > 0$ and interpolate toward zero.
    Every integer $0 lt.eq r lt.eq floor.l k \/ K floor.r$ satisfies
  $ a_t \( k - r \) gt.eq a_t \( k \)^(1 - r \/ k) a_t \( 0 \)^(r \/ k) gt.eq
    a_t \( k \) thin 2^(- K r \/ k) gt.eq frac(a_t \( k \), 2) . $
  There are $floor.l k \/ K floor.r + 1 gt.eq b_t \/ K$ such integers,
    giving the same bound $a_t \( k \) \/ C \( H \) lt.eq 2 K \/ b_t$. The bound also holds when $a_t \( k \) = 0$.
  On either exterior side of $\[ 0 \, b_t \]$, the number of integers at positive distance strictly less than
    $gamma b_t$ is $max { ceil.l gamma b_t ceil.r - 1 \, 0 } < gamma b_t$.
    Consequently the fraction of mass with $0 < "dist" \( z_t \, \[ 0 \, b_t \] \) < gamma b_t$ is at most $4
    gamma K$. A union bound over at most $d$ tree cells bounds all these near violations by $4 d gamma K =
    epsilon \/ 128$. Every infeasible assignment is far or has such a near tree violation. We conclude that
  $ frac(C \( H \) - Z, C \( H \)) lt.eq epsilon / 64 . $
  Finally, $C \( H \) lt.eq Z \/ \( 1 - epsilon \/ 64 \) lt.eq \( 1 + epsilon \/ 32 \) Z$ for $0 < epsilon < 1$,
    as claimed. ◻
]

== 4 Paired binary states and two factorial lifts <sec:signatures>

We now encode the small-cell counts by subsets of a polynomial-size binary ground set.
  The intended subsets select one element from each labeled pair.
  Several such transversals represent the same balanced count profile,
  so a factorial normalization is needed to recover $C \( j \)$ as their total mass.
  Two normalizations agree on transversals but have different quadratic signatures.
  The first will support transport; the second will compare the masses of the defect classes through which the
  transport passes.

=== 4.1 The paired encoding and its weights <the-paired-encoding-and-its-weights>

Assume in the rest of this section that $p gt.eq 1$; the case $p =
  0$ will be handled directly by the weight evaluator. For each small cell $s$, introduce $b_s$ labeled pairs,
  each with a row element and a column element. Number the pairs $1 \, dots.h \, p$,
  and let $E$ be their $2 p$ elements. For a $p$-subset $S subset.eq E$, write $x_s \( S \) \,
  y_s \( S \)$ for its row and column counts in cell $s$. For $0 lt.eq j lt.eq H$,
  define positive weights on #emph[all] $p$-subsets by

#[#set math.equation(numbering: n => "(22)")
 $ f_j \( S \) & = h_j \( x \, y \) product_(s med upright("small")) frac(x_s ! thin y_s !, b_s !) \,\
tilde(f)_j \( S \) & = h_j \( x \, y \) product_(s med upright("small"))
  frac(\( b_s - x_s \) ! thin \( b_s - y_s \) !, b_s !) . $ <eq:lifts>]

All factorial arguments lie between zero and $b_s$. We suppress $j$ when it is fixed.

Let $cal(A)$ be the transversals, consisting of exactly one element from each labeled pair.
  For distinct pair labels $i \, l$, let $cal(A)_(i l)$ consist of sets with pair $i$ empty, pair $l$ full,
  and every other pair singly occupied. On a transversal $x_s + y_s = b_s$,
  so both lifts have the same factorial multiplier $1 \/ binom(b_s, x_s)$ in cell $s$.
  There are exactly $product_s binom(b_s, x_s)$ transversals with a given balanced count profile. Consequently

#[#set math.equation(numbering: n => "(23)")
 $ sum_(S in cal(A)) f \( S \) = sum_(S in cal(A)) tilde(f) \( S \) = C \( j \) . $ <eq:transversal-mass>]

For example, in a cell of bound three, the balanced counts $\( 2 \, 1 \)$ are represented by the three choices of
  which labeled pair uses its column element. Each transversal has factorial factor $2 ! 1 ! \/ 3 ! = 1 \/ 3$,
  so their total contribution is exactly the original count weight.
  This cancels the multiplicity among transversals; it does not count all subsets with the same coordinate counts.
  For instance, these counts also occur in subsets with one empty pair and one full pair.

Put $q = W^2$. On the enlarged state space used later,

#[#set math.equation(numbering: n => "(24)")
 $ q^(- 1) f \( S \) lt.eq tilde(f) \( S \) lt.eq q f \( S \) \, wide
   S in cal(A) union union.big_(i eq.not l) cal(A)_(i l) . $ <eq:lift-comparison>]

To see this, first suppose the empty and full pairs lie in the same cell.
  Every cell remains balanced, and the ratio is one. Otherwise one cell has count sum $b_s - 1$,
  contributing $\( x_s + 1 \) \( y_s + 1 \)$ to $tilde(f) \/ f$, and another has count sum $b_s + 1$,
  contributing $1 \/ \( x_s y_s \)$. Both positive integer products in this quotient lie between one and $W^2$,
  since the small bounds are less than $W$. Their quotient is therefore in $\[ W^(- 2) \, W^2 \]$.
  We do not assert (24) outside this enlarged state space; the signature properties below, in contrast,
  hold on the full $p$-subset domain.

=== 4.2 Binary signatures and their closure properties <binary-signatures-and-their-closure-properties>

For a positive weight $F$ on all $k$-subsets of a finite set, the #emph[addition property] means the following.
  After fixing any $k - 2$ included elements, the symmetric matrix whose off-diagonal $i \,
  h$ entry is the weight obtained by including the two further distinct elements $i \, h$,
  and whose diagonal is zero, has at most one positive eigenvalue. For $k < 2$ the property is vacuous.
  The #emph[omission property] is the addition property of the complement-set weight.

For a positive weight on every $k$-subset, the addition property is the Lorentzian criterion for the multiaffine
  generating polynomial $sum_S F \( S \) product_(i in S) z_i$;
  the omission property applies to the complement-set polynomial #cite(label("BH2020")) Theorem 2.25.
  Summing a pair ${ a \, b }$ at occupancy one corresponds to applying $partial_a +
  partial_b$ and then setting $z_a = z_b = 0$. Both operations preserve the Lorentzian property by
  #cite(label("BH2020")) Theorem 2.10 and Corollary 2.11. The matrix proof below also keeps track of the full
  index set before that specialization, as required for the three-pair defect inequality.

#thm([Lemma 4.1.])[
  (Binary contractions).  #emph[The addition property, with positivity on the entire valid-degree domain,
    is preserved by fixing elements included or excluded and by summing a two-element group at occupancy one.
    The same assertions hold for the omission property. In addition,
    the cubic contraction used to sum a pair has at most one positive eigenvalue on its full remaining index set,
    before the contracted pair’s indices are removed.]
] <lem:binary-contraction>

#proof[
  Fixing inclusions enlarges the set of fixed elements in the quadratic test,
    and fixing exclusions restricts that test to a principal submatrix.
    Positivity is retained whenever the residual degree is valid.
  We prove the contraction assertion through a symmetric cubic tensor.
    Suppose $T_(i u h)$ is positive on triples of distinct indices and zero on repetitions,
    and every slice $T_i = \( T_(i u h) \)_(u \, h)$ has at most one positive eigenvalue.
    There are at least three indices. For a vector $a$ with all entries positive, set
  $ M = sum_i a_i T_i . $
  Tensor symmetry gives
  $ a^(sans(T)) T_i a = \( M a \)_i > 0 \, wide h^(sans(T)) T_i a = \( M h \)_i . $
  The strict inequality holds even with exactly three indices:
    the two indices other than $i$ give a strictly positive term.
    Applying (10) to every slice and then summing with coefficients $a_i$ yields
  #[#set math.equation(numbering: n => "(25)")
   $ h^(sans(T)) M h lt.eq sum_i frac(a_i \( M h \)_i^2, \( M a \)_i) = h^(sans(T)) M D_(*)^(- 1) M h \, wide
     D_(*) = "diag" (frac(\( M a \)_i, a_i)) . $ <eq:cubic-projection>]
  Thus the symmetric matrix $M' = D_(*)^(- 1 \/ 2) M D_(*)^(- 1 \/ 2)$ satisfies $M' prec.curly.eq \( M' \)^2$.
    It has the positive eigenvector $u = D_(*)^(1 \/ 2) a$ with eigenvalue one.
    Every off-diagonal entry of $M$, and hence of $M'$, is strictly positive,
    because a third distinct index contributes a positive term.
    The matrix with entries $M'_(i h) u_h \/ u_i$ is therefore irreducible and row-stochastic.
    The maximum principle bounds the absolute values of its real eigenvalues by one and shows that its
    eigenvalue-one eigenspace consists of the constant vectors. Since $M'$ is symmetric, eigenvalue one is simple.
    On the other hand, (25) requires every eigenvalue $lambda$ of $M'$ to satisfy $lambda lt.eq lambda^2$,
    so a positive eigenvalue must be at least one. There can consequently be only one positive eigenvalue.
    Positive diagonal congruence gives the same conclusion for $M$.
    For nonnegative $a$, replace it by $a + epsilon upright(bold(1))$ and pass to the matrix limit as $epsilon
    arrow.b 0$. This establishes the full-matrix contraction assertion.
  Now sum a pair ${ alpha \, beta }$ at occupancy one in a positive weight $F$ on $k$-subsets:
  $ F^arrow.b \( U \) = F \( U union { alpha } \) + F \( U union { beta } \) \, wide \| U \| = k - 1 \, quad
    U ∩ { alpha \, beta } = diameter . $
  If $k - 1 < 2$, the desired addition property is vacuous.
    Otherwise fix $k - 3$ included elements outside the pair.
    The remaining three-element weights form a tensor $T$ of the kind just considered.
    Each slice is an addition matrix of $F$, with a zero row and column at its fixed index.
    Contract with the indicator of ${ alpha \, beta }$. Restricting the resulting full matrix to the other indices
    gives exactly the addition matrix of $F^arrow.b$. The result is therefore valid.
    Every valid residual weight is a sum of positive terms, so positivity also persists.
  Finally, complementation interchanges fixed inclusions with fixed exclusions and preserves occupancy one in a
    two-element pair. Applying the addition argument to complement weights proves all the omission assertions. ◻
]

#thm([Lemma 4.2.])[
  (Signatures of the two lifts).  #emph[The weight $f_j$ has the omission property,
    and $tilde(f)_j$ has the addition property. These properties and positivity remain valid after fixing any
    included or excluded elements and summing any disjoint labeled pairs at occupancy one,
    whenever the residual degree is valid. All assertions concern the full valid-degree subset domain.]
] <lem:binary-signatures>

#proof[
  The case $p = 1$ is immediate for the original two properties,
    so consider a quadratic test when it is nonvacuous. For the omission property of $f$, fix $p -
    2$ omitted elements. This leaves a display of $p + 2$ elements from which two must be removed.
    Group its elements by small-cell row or column coordinate, and write $n_u$ for the number in group $u$.
  Within a group, all distinct-copy matrix entries are equal, and the diagonal entries are zero.
    Vectors whose entries sum to zero in each group have nonpositive square:
    in each group the form is a nonnegative multiple of $upright(bold(1)) upright(bold(1))^(sans(T)) - I$.
    These vectors have no coupling to vectors that are constant within each group.
    It remains to examine the latter subspace.
  Let its value on group $u$ be $t_u$. For distinct groups $u \, v$,
    the $n_u n_v$ ordered-copy multiplicity cancels the two factorial reductions when passing from displayed
    counts $n$ to $n - e_u - e_v$. For a single group $u$, the multiplicity $n_u \( n_u - 1 \)$ similarly cancels
    the factorial reduction for two removals. If $n_u < 2$ this term is zero. The resulting quadratic form is exactly
  $ frac(product_u n_u !, product_s b_s !) sum_(u \, v) h_j \( n - e_u - e_v \) t_u t_v \, $
  with zero entries for invalid removals. By Corollary 5, it has at most one positive eigenvalue.
    Together with the nonpositive group-sum-zero subspace, this proves the omission property of $f$.
  For the addition property of $tilde(f)$, fix $p - 2$ included elements, with coordinate counts $r_u$.
    There are $n_u = b_u - r_u$ available elements in coordinate group $u$, where $b_u =
    b_s$ for either coordinate of cell $s$. After adding two elements,
    the factorial numerator of $tilde(f)$ is the product of the remaining-capacity factorials.
    The same group decomposition and the same multiplicity cancellation therefore give,
    up to a common positive scalar, the form
  $ sum_(u \, v) h_j \( r + e_u + e_v \) t_u t_v . $
  Invalid additions give zero entries. The addition assertion of Corollary 5 proves that this form has at most one
    positive eigenvalue. The group-sum-zero subspace again contributes only nonpositive squares.
    This proves the addition property of $tilde(f)$.
  All $p$-subset weights in (22) are strictly positive. The closure assertions now follow from Lemma 7,
    applied respectively in omission and addition variables. ◻
]

#prodef([Remark 4.3.])[
  (The two signature roles are distinct).  Even with a constant count weight,
    the factorial construction need not give $f$ the addition property.
    For example, take two small cells with bounds $3$ and $2$, with base weight $h equiv 1$,
    so the binary ground set has ten elements and $p = 5$. Fix as included the three row elements of the first
    cell. The seven remaining elements are its three column elements and the four elements of the second cell.
    In the addition matrix of $f$, restrict to vectors with common value $a$ on the first group of three and
    common value $b$ on the second group of four. Direct substitution in (22) gives the quadratic form
  $ 6 a^2 + 12 a b + 8 b^2 . $
  Its coefficient matrix $mat(delim: "(", 6, 6; 6, 8)$ is positive definite, with determinant $12$.
    Thus this addition matrix has at least two positive eigenvalues.
    The omission property of $f$ and the addition property of $tilde(f)$ are the respective assertions needed below.
] <rem:distinct-lifts>

Figure 1 illustrates the paired state space, the agreement of the lifts on transversals,
  and their distinct signature roles.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.2, 2.52), [#text(size: 9pt)[Transversal $S in cal(A)$]])
  content((8.1, 2.52), [#text(size: 9pt)[One-defect state $S' in cal(A)_(i l)$]])
  rect((0.88, 0.43), (1.42, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((1.15, 1.99), [#text(size: 9pt)[$i$]])
  circle((1.15, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((1.15, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  rect((1.63, 0.43), (2.17, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((1.9, 1.99), [#text(size: 9pt)[$k$]])
  circle((1.9, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((1.9, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  rect((2.38, 0.43), (2.92, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((2.65, 1.99), [#text(size: 9pt)[$l$]])
  circle((2.65, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((2.65, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  rect((3.13, 0.43), (3.67, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((3.4, 1.99), [#text(size: 9pt)[$m$]])
  circle((3.4, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((3.4, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  content((0.73, 1.41), [#text(size: 9pt)[row]], anchor: "east", padding: 0.1176cm)
  content((0.73, 0.74), [#text(size: 9pt)[column]], anchor: "east", padding: 0.1176cm)
  circle((1.15, 1.41), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((1.9, 1.41), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((2.65, 0.74), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((3.4, 0.74), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  content((2.2, 0.11), [#text(size: 9pt)[one selected per pair]])
  content((2.2, -0.4), [#text(size: 9pt)[$f(S)= tilde(f) (S)$]])
  rect((6.78, 0.43), (7.32, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((7.05, 1.99), [#text(size: 9pt)[$i$]])
  circle((7.05, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((7.05, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  rect((7.53, 0.43), (8.07, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((7.8, 1.99), [#text(size: 9pt)[$k$]])
  circle((7.8, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((7.8, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  rect((8.28, 0.43), (8.82, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((8.55, 1.99), [#text(size: 9pt)[$l$]])
  circle((8.55, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((8.55, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  rect((9.03, 0.43), (9.57, 1.72), stroke: (paint: rgb("#c7c7c7"), thickness: 0.5pt, miter-limit: 10), radius: 2pt)
  content((9.3, 1.99), [#text(size: 9pt)[$m$]])
  circle((9.3, 1.41), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((9.3, 0.74), radius: 0.235, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((7.8, 1.41), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((8.55, 1.41), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((8.55, 0.74), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  circle((9.3, 0.74), radius: 0.235, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  rect((6.74, 0.39), (7.36, 1.76), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), radius: 2pt)
  rect((8.24, 0.39), (8.86, 1.76), stroke: (paint: rgb("#8c0000"), thickness: 0.45pt, miter-limit: 10), radius: 2pt)
  content((7.05, 0.12), [#text(fill: rgb("#00008c"))[#text(size: 8pt)[empty]]])
  content((8.55, 0.12), [#text(fill: rgb("#8c0000"))[#text(size: 8pt)[full]]])
  content((8.1, -0.4), [#text(size: 9pt)[$q^(-1)f(S') lt.eq tilde(f) (S') lt.eq "qf"(S')$]])
  content((8.1, -0.8), [#text(size: 8pt)[$q=W^2$]])
  line((4, 1.1), (5.65, 1.1), stroke: (thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((4.825, 1.65), [#text(size: 8pt)[one exchange]])
  content((4.825, 0.53), [#text(size: 8pt)[remove row $i$#linebreak()add row $l$]])
  content((2.35, -2), [#box(width: 5.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$f$: omission signature#linebreak() transport and simulation]]])])
  content((8, -2), [#box(width: 5.144cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fafafa"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$tilde(f)$: addition signature#linebreak() inequalities for defect masses]]])])
  content((5.175, -3.02), [#text(size: 8pt)[Both signature properties are proved on all $p$-subsets.]])
  circle((3.81, -3.49), radius: 0.16, fill: rgb("#333333"), stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  content((4.02, -3.49), [#text(size: 8pt)[selected]], anchor: "west", padding: 0.1176cm)
  circle((5.73, -3.49), radius: 0.16, stroke: (paint: rgb("#333333"), thickness: 0.6pt, miter-limit: 10))
  content((5.94, -3.49), [#text(size: 8pt)[unselected]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The paired state space and the two factorial lifts, illustrated with four pairs. The lifts agree on transversals. Their comparison within a factor $q$ is used only on transversals and one-defect types. The distinct signature properties support the two different parts of the argument shown below the states. ],
) <fig:paired-states>

=== 4.3 Defect masses and pair inequalities <defect-masses-and-pair-inequalities>

Fix $j$, put $C = C \( j \)$, and suppress the parameter on both lifts.
  A partial transversal assignment $sigma$ specifies one chosen element in each of a collection of labeled pairs.
  A set respects $sigma$ when its intersection with every assigned pair is precisely that chosen element.
  For unassigned distinct pair labels $i \, l$, define

$ z_sigma & = sum_(S in cal(A)\
S upright(" respects ") sigma) f \( S \) = sum_(S in cal(A)\
S upright(" respects ") sigma) tilde(f) \( S \) \,\
c_(i l)^sigma & = sum_(S in cal(A)_(i l)\
S upright(" respects ") sigma) f \( S \) \, wide tilde(c)_(i l)^sigma = sum_(S in cal(A)_(i l)\
S upright(" respects ") sigma) tilde(f) \( S \) . $

These masses are positive. For the empty assignment we write $c_(i l) \,
  tilde(c)_(i l)$ without a superscript and have $z_diameter = C$.

#thm([Lemma 4.4.])[
  (Pair inequalities for defect masses).  #emph[For every partial assignment $sigma$ and distinct unassigned
    labels $i \, l$,
#[#set math.equation(numbering: n => "(26)")
 $ 4 tilde(c)_(i l)^sigma tilde(c)_(l i)^sigma lt.eq z_sigma^2 . $ <eq:defect-two-pair>]

 For three distinct unassigned labels $i \, l \, k$,
#[#set math.equation(numbering: n => "(27)")
 $ tilde(c)_(i l)^sigma tilde(c)_(l k)^sigma lt.eq z_sigma tilde(c)_(i k)^sigma . $ <eq:defect-three-pair>]

]
] <lem:defect-inequalities>

#proof[
  Fix the inclusions and exclusions specified by $sigma$. For (26),
    sum every other unassigned pair at occupancy one, leaving only $i \, l$.
    By Lemma 8, the remaining positive two-element weight has an addition matrix with at most one positive
    eigenvalue. Restrict its quadratic form to vectors constant on each of the two pairs. The resulting matrix is
  $ mat(delim: "(", 2 tilde(c)_(l i)^sigma, z_sigma; z_sigma, 2 tilde(c)_(i l)^sigma) . $
  The diagonal factor two counts the two orders of the elements in a full pair;
    the off-diagonal sums exactly the transversals. The matrix has positive trace and at most one positive
    eigenvalue, so its determinant is nonpositive. This proves (26).
  For (27), sum every other unassigned pair at occupancy one, leaving the six elements in $i \, l \,
    k$ and a positive weight on their three-element subsets. Form its symmetric cubic tensor,
    zero on repeated indices. Contract it along the indicator of the two elements of pair $k$.
    By the full-matrix assertion of Lemma 7, the resulting matrix has at most one positive eigenvalue even while
    the two contracted indices are retained. Restrict its form to vectors constant on each pair,
    and call the resulting three-by-three matrix $N$, indexed by $i \, l \, k$. Its relevant entries are
  #[#set math.equation(numbering: n => "(28)")
   $ N_(l l) = 2 tilde(c)_(i l)^sigma \, wide N_(i k) = 2 tilde(c)_(l k)^sigma \, wide N_(i l) = z_sigma \, wide
     N_(l k) = 2 tilde(c)_(i k)^sigma . $ <eq:contracted-defect-entries>]
  For example, in $N_(i k)$ the full pair $k$ can contribute either of its elements to the contraction and the
    other to the matrix index, explaining the factor two. All entries of $N$ are nonnegative, and $N_(l l) > 0$.
  By (10), the Schur complement against the $l \, l$ entry is negative semidefinite.
    Its two remaining coordinates $i \, k$ therefore satisfy
  $ N_(i k) & lt.eq frac(N_(i l) N_(l k), N_(l l)) +
    sqrt((N_(i l)^2 / N_(l l) - N_(i i)) (N_(l k)^2 / N_(l l) - N_(k k)))\
 & lt.eq frac(2 N_(i l) N_(l k), N_(l l)) . $
  The square-root factors are nonnegative by the same Schur complement condition.
    The second inequality uses $N_(i i) \, N_(k k) gt.eq 0$ and the nonnegativity of the off-diagonal entries.
    Substituting (28) gives (27). ◻
]

The omission property of $f$ is the input to the one-hole transport argument in Section 5;
  it applies even to auxiliary completions outside the enlarged state space.
  The two addition-based inequalities just proved control the conditional and unconditional one-defect masses used
  to bound transversal variance and defect means. The comparison of the lifts is used only on the actual
  transversal and one-defect classes where (24) holds.

The matrices and balanced sums used to prove the signature properties are analytic devices.
  The algorithm will neither form these matrices nor enumerate their underlying coordinate boxes.

== 5 Transport, observable variance, and trace mixing <sec:transport>

Fix an annealing parameter $j$ and suppose that $p gt.eq 1$.
  Write $f = f_j$, $tilde(f) = tilde(f)_j$, and $C = C \( j \)$.
  We use the paired ground set, transversal class $cal(A)$, defect classes $cal(A)_(i l)$,
  and their conditional masses from Section 4. In particular,
  $f$ is positive on #emph[all] $p$-subsets of the $2 p$ elements, and has the omission property.
  The second lift $tilde(f)$ has the addition property. They agree on transversals and satisfy the comparison
  (24), with $q = W^2$, on the state space

$ cal(X) = cal(A) thin union #h(-0.16667em) union.big_(1 lt.eq i \, l lt.eq p\
i eq.not l) cal(A)_(i l) . $

We give signed-flow, observable-variance, and trace arguments for these two lifts,
  keeping track of the comparison factors and of the domains on which they are needed.
  The flow-energy and trace viewpoints are classical; see Aldous and Fill #cite(label("AF2002")) Sections 2.7.1
  and 3.7.1. The transport inequality first bounds transversal variance and defect means;
  together these control the particular trajectory averages used by the algorithm.
  The transversal variance bound also gives mixing of the transversal trace, whose return-time analysis bounds its cost.

We adapt the paired-transversal transport and observable/trace analysis for counting common bases of two matroids
  in #cite(label("OpenAICommonBases2026")) Sections 4–6. Here the two required signature properties belong to
  separate lifts. Their comparison contributes the factors $q^2$ and $q^3$ in the transversal-variance and
  defect-mean bounds below. We give the complete argument for these weights.

=== 5.1 The enlarged Metropolis chain <the-enlarged-metropolis-chain>

For each ordered pair $i eq.not l$, choose a positive multiplier $w_(i l)$, and put

$ lambda \( S \) = cases(delim: "{", f \( S \) \, & S in cal(A) \,, w_(i l) f \( S \) \, & S in cal(A)_(i l) .)
  wide Lambda = sum_(S in cal(X)) lambda \( S \) \, wide pi \( S \) = frac(lambda \( S \), Lambda) . $

Call the multipliers #emph[good] if

#[#set math.equation(numbering: n => "(29)")
 $ frac(C, 4 c_(i l)) lt.eq w_(i l) lt.eq frac(4 C, c_(i l)) wide \( i eq.not l \) . $ <eq:good-multipliers>]

For good multipliers,

#[#set math.equation(numbering: n => "(30)")
 $ Lambda lt.eq #scale(x: 120%, y: 120%)[\(] 1 + 4 p \( p - 1 \) #scale(x: 120%, y: 120%)[\)] C lt.eq 5 p^2 C \,
   wide pi \( cal(A) \) gt.eq frac(1, 5 p^2) \, wide pi \( cal(A)_(i l) \) gt.eq
   frac(1, 20 p^2) . $ <eq:type-mass-bounds>]

Indeed, a defect type has total multiplied mass between $C \/ 4$ and $4 C$, and the transversal mass is $C$.
  When $p = 1$ there are no defect types; all assertions concerning them are omitted.

The chain holds with probability $1 \/ 2$. Otherwise it independently chooses one uniform element of $S$ and one
  uniform element of its complement and proposes to exchange them. A proposal outside $cal(X)$ is rejected.
  A proposal $S'$ in $cal(X)$ is accepted with probability $min { 1 \, lambda \( S' \) \/ lambda \( S \) }$.
  Denote its transition operator by $P$. Every defect state can reach a transversal by moving one element of its
  full pair to its empty pair. Transversals are connected by flips within individual pairs.
  Positivity of $lambda$ therefore makes the chain irreducible. Its holding probability is at least $1 \/ 2$.
  For distinct exchange neighbors,

$ pi \( S \) P \( S \, S' \) = frac(min { lambda \( S \) \, lambda \( S' \) }, 2 p^2 Lambda) \, $

so $P$ is reversible with stationary law $pi$. For a real function $g$ on $cal(X)$, define

#[#set math.equation(numbering: n => "(31)")
 $ frak(D) \( g \) & = sum_({ S \, S' }) min { lambda \( S \) \,
   lambda \( S' \) } #scale(x: 120%, y: 120%)[\(] g \( S \) - g \( S' \) #scale(x: 120%, y: 120%)[\)]^2 \,\
cal(E) \( g \) & = chevron.l g \, \( I - P \) g chevron.r_pi = frac(frak(D) \( g \), 2 p^2 Lambda) . $ <eq:energy>]

The sum is over unordered exchange edges in $cal(X)$. This convention will be used throughout the section.

=== 5.2 A transport inequality on one-hole states <a-transport-inequality-on-one-hole-states>

The next lemma uses the omission property of $f$ on its full domain.
  Some configurations contributing to its auxiliary masses need not belong to $cal(X)$.
  Its applications will identify the one-hole states and their conductances with actual states and conductances of
  the Metropolis chain.

#thm([Lemma 5.1.])[
  (One-hole transport).  #emph[Fix disjoint sets of included and excluded elements.
    Let $F$ be the set of fixed inclusions, and partition the remaining elements into two singleton slots $P_0 \,
    P_1$ and $s$ ordinary slots of two elements each. Assume $\| F \| + s + 1 = p$.
    Let $cal(X)_(upright("sl"))$ consist of the sets that respect the fixed assignments and select one element
    from every slot except one hole slot, from which they select nothing.
    Give a state with hole slot $i$ weight $W_i f \( S \)$, where every $W_i$ is positive.
    For a real function $g$ on $cal(X)_(upright("sl"))$, let $D_(upright("sl")) \( g \)$ be the unordered-edge
    energy on its single-exchange graph, with conductance equal to the minimum of the two endpoint weights.]
  #emph[Let $s_0 \, s_1$ be the unmultiplied $f$-masses of the states with hole $P_0 \, P_1$,
    and let $macron(g)_0 \, macron(g)_1$ be their respective $f$-weighted means.
    For each ordinary slot $t$, let $v_t$ be the unmultiplied mass of sets that omit both singleton slots,
    select both elements of $t$, and select one element from every other ordinary slot,
    while respecting the fixed assignments. Then
#[#set math.equation(numbering: n => "(32)")
 $ \( macron(g)_0 - macron(g)_1 \)^2 lt.eq
   (frac(1, s_0 W_(P_0)) + frac(1, s_1 W_(P_1)) + frac(2, s_0 s_1) sum_t v_t / W_t) D_(upright("sl")) \( g \) .
   $ <eq:slot-transport>]

 The notation $W_i$ here denotes slot multipliers, independently of the capacity threshold $W$.]
] <lem:transport>

#proof[
  We seek a signed edge current whose divergence is $f \( S \) \/ s_0$ at states with hole $P_0$, $-
    f \( S \) \/ s_1$ at states with hole $P_1$, and zero at all ordinary-hole states.
    Orient each edge once, write $I_(S S')$ for its signed current, and write $c_(S S')$ for its conductance.
    Such a current satisfies, by summation by parts and Cauchy–Schwarz,
  #[#set math.equation(numbering: n => "(33)")
   $ \( macron(g)_0 - macron(g)_1 \)^2 & =
     (sum_({ S \, S' }) I_(S S') #scale(x: 120%, y: 120%)[\(] g \( S \) - g \( S' \) #scale(x: 120%, y: 120%)[\)])^2\
 & lt.eq (sum_({ S \, S' }) I_(S S')^2 / c_(S S')) D_(upright("sl")) \( g \) . $ <eq:transport-flow-criterion>]
  It therefore suffices to bound its flow energy by the coefficient in (32).
  The local routing step explains the energy quantity we will use.
    A complete display $R$ contains the two singleton elements and one chosen element from every ordinary slot.
    Its one-hole sets $S_i = F union \( R \\ { i } \)$, $i in R$, form a clique of exchange edges.
    For an element $i$, write $W_i$ for its slot’s multiplier. Put $m_i = f \( S_i \)$.
    For any coefficients $h_i$ with $sum_i m_i h_i = 0$, regard $m_i
    h_i$ as the prescribed signed divergence at $S_i$. Choose a hub $h_(*)$ maximizing $W_i m_i$,
    and send current $m_i h_i$ from each nonhub $S_i$ to the hub.
    Balance gives the prescribed divergence at the hub as well.
    Each used edge has conductance $W_i m_i$ at its nonhub endpoint, so this routing has energy at most
  $ sum_(i eq.not h_(*)) frac(\( m_i h_i \)^2, W_i m_i) lt.eq sum_(i in R) frac(m_i h_i^2, W_i) . $
  We now assign these balanced demands recursively. Their sum over complete displays will have the required source
    and sink divergences; the recursion will also bound the sum of their routing energies.
  Fix an order of the ordinary slots. Initially display the two singleton elements.
    Expose ordinary slots in that order, branching into two children according to which element of the next slot
    is added to the display. At a node write $R$ for its displayed elements, excluding $F$.
    For $i in R$, let $m_i$ be the sum of $f$ over sets that contain $F union \( R \\ { i } \)$,
    omit the nondisplayed mates in already processed slots, and have single occupancy in every unprocessed
    ordinary slot. These sets all have size $p$, and $m_i > 0$.
    At a complete display this definition reduces to $m_i = f \( S_i \)$.
    Maintain coefficients $h_i$, interpreted as demand per unit unmultiplied weight, satisfying
  #[#set math.equation(numbering: n => "(34)")
   $ sum_(i in R) m_i h_i = 0 . $ <eq:transport-balance>]
  At the root their values are $1 \/ s_0$ and $- 1 \/ s_1$ at the elements of $P_0$ and $P_1$, respectively.
    Assign the node the potential
  $ Psi \( R \, h \) = sum_(i in R) frac(m_i h_i^2, W_i) . $
  At a leaf this potential bounds the routing energy just computed.
    Each $W_i$ is fixed by its slot throughout the recursion.
    These multipliers enter the energy bound and the eventual hub choice,
    but not the recursive coefficients or prescribed divergences.
  Suppose the next slot $t$ has elements $a \, b$. For an old hole $i in R$, let $m_i^a \,
    m_i^b$ be its masses in the two children. Then $m_i^a + m_i^b = m_i$.
    The mass of the newly introduced hole, at $a$ in the first child and at $b$ in the second,
    is the same positive number $u$: in either case the entire slot $t$ is empty.
    Put $X = sum_(i in R) h_i m_i^a$. Retain every old coefficient unchanged, and give the new hole coefficient $-
    X \/ u$ in the $a$ child and $X \/ u$ in the $b$ child. Equation (34) holds in both children because $sum_i
    h_i m_i^b = - X$. The sum of their potentials exceeds the parent potential by exactly
  #[#set math.equation(numbering: n => "(35)")
   $ frac(2 X^2, u W_t) . $ <eq:transport-increment>]
  We bound these increments using the omission signature. At any node, and for any unprocessed ordinary slot $t$,
    define a symmetric matrix $V_t \( R \)$ on the displayed elements, with zero diagonal.
    For distinct $i \, k in R$, its entry is the sum of $f$ over configurations with holes at $i \,
    k$ in the display, double occupancy in slot $t$, and single occupancy in every other unprocessed slot.
    Fixed inclusions, exclusions, and previously excluded mates remain in force. All these configurations have size $p$.
  When $t = { a \, b }$ is the next slot, $V_t \( R \)$ is the old block of
  $ N =
    mat(delim: "(", V_t \( R \), \( m_i^b \)_(i in R), \( m_i^a \)_(i in R); \( m_i^b \)_(i in R)^(sans(T)), 0,
    u; \( m_i^a \)_(i in R)^(sans(T)), u, 0) . $
  This form has at most one positive eigenvalue. To see the precise application,
    fix the context and exclude the nondisplayed mates of processed slots.
    Sum all unprocessed ordinary slots other than $t$ at occupancy one.
    On the remaining ground set $R union { a \, b }$ the resulting degree is $\| R \|$,
    so $N$ is its two-omission matrix. Lemmas 8 and 7 give the asserted signature.
    In particular, this argument uses the full-domain weight $f$ even when an entry of $V_t \( R \)$ describes
    multiple empty and full original pairs. No comparison with $tilde(f)$ is made here.
  Extend $h$ by zero at $a \, b$ and put $d_(a b) = e_a - e_b$.
    The vector $e_a + e_b$ has square $2 u > 0$ under $N$. Both $h$ and $d_(a b)$ are orthogonal to it in this
    form, since (34) holds and the two new diagonal entries are zero.
    A symmetric form with at most one positive eigenvalue is nonpositive on the form-orthogonal complement of a
    positive-square vector: another positive-square vector in that complement would span a positive definite plane
    with the first vector. On the complement, Cauchy–Schwarz for the negative of the form applies. Here
  $ h^(sans(T)) N d_(a b) = - 2 X \, wide d_(a b)^(sans(T)) N d_(a b) = - 2 u \, wide h^(sans(T)) N h =
    h^(sans(T)) V_t \( R \) h . $
  Consequently
  #[#set math.equation(numbering: n => "(36)")
   $ frac(2 X^2, u) lt.eq - h^(sans(T)) V_t \( R \) h . $ <eq:transport-schur>]
  Fix now a slot $t$ to be processed at a later level. When a preceding slot is split,
    the sum of the two child quantities $h^(sans(T)) V_t \( R \) h$ equals the parent quantity.
    The old entries split additively. A cross entry involving the new hole represents a configuration in which the
    split slot is empty, so it is identical in the two children.
    Its contributions cancel because the new coefficients are opposite and all old coefficients are retained.
    There is no new diagonal contribution. Iterating this identity shows that, immediately before processing $t$,
    the sum of these quadratic quantities over the whole level is their value at the root.
    The root matrix has off-diagonal entry $v_t$ and zero diagonal, so that value is $- 2 v_t \/ \( s_0 s_1 \)$.
    By (35) and (36), the total potential increase at the level of slot $t$ is at most $2
    v_t \/ \( s_0 s_1 W_t \)$. The root potential is $1 \/ \( s_0 W_(P_0) \) + 1 \/ \( s_1 W_(P_1) \)$.
    Thus the sum of all leaf potentials is bounded by the parenthetical coefficient in (32).
  Route the prescribed demands at every leaf by the clique construction above.
    Its energy is at most $Psi \( R \, h \)$. Different leaves cannot use the same edge:
    the union of two distinct endpoints of a leaf edge is exactly $F union R$,
    and so determines the entire display and its unique sequence of choices.
    Hence the assembled flow has energy at most the sum of the leaf potentials.
  It remains to identify the divergence after summing the leaf flows.
    A state with a singleton hole has one leaf representation; its divergence is $f \( S \) \/ s_0$ or $-
    f \( S \) \/ s_1$. A state $S$ with an ordinary hole at slot $t$ has exactly two representations,
    obtained by adjoining either element of $t$ to $S \\ F$. Every other displayed ordinary choice is fixed by
    $S$. The two histories agree before processing $t$, so the same $X \, u$ create opposite coefficients there.
    Those coefficients remain unchanged at every later branch,
    regardless of the later masses and new coefficients. At the leaves both masses are exactly $f \( S \)$,
    and their divergences cancel. This reasoning also applies if the state is a hub in either leaf,
    since its net divergence is still $m_i h_i$. The assembled flow therefore has the required divergence,
    and (33) together with the leaf-potential bound proves (32).
    If $s = 0$, the root is already a complete display and the same clique argument applies directly. ◻
]

=== 5.3 Variance on transversals <variance-on-transversals>

Assume henceforth that the multipliers are good, and write

$ mu \( S \) = frac(f \( S \), C) quad \( S in cal(A) \) \, wide C_(upright(p)) = p \( 1 + 8 p q^2 \) . $

The variance under $mu$ of a function on $cal(X)$ refers to its restriction to $cal(A)$.

#thm([Proposition 5.2.])[
  #emph[Suppose the multipliers satisfy (29). For every real function $g$ on $cal(X)$,
#[#set math.equation(numbering: n => "(37)")
 $ C "Var"_mu \( g \) lt.eq C_(upright(p)) frak(D) \( g \) . $ <eq:transversal-variance>]

]
] <prop:transversal-variance>

#proof[
  We decompose the transversal variance along a tree of partial assignments,
    choosing the next pair as a function of the current assignment.
    Let $sigma$ fix some pairs to specified single choices. For distinct unassigned labels define
  $ a_(i l) = tilde(c)_(i l)^sigma / z_sigma tilde(c)_(l i) / C . $
  Lemma 10 gives
  #[#set math.equation(numbering: n => "(38)")
   $ a_(i l) a_(l i) lt.eq 1 / 16 \, wide a_(i l) a_(l k) lt.eq a_(i k) quad upright("for distinct ") i \, l \,
     k . $ <eq:sink-products>]
  For the second inequality, use the conditional defect inequality on the first factors and the unconditioned
    inequality with indices $k \, l \, i$ on the second factors.
    Form a directed graph with arc $i arrow.r l$ when $a_(i l) > 1$. It has no directed two-cycle.
    A shortest longer directed cycle could be shortened using the second inequality in (38), also a contradiction.
    Thus this graph has a sink $k$, for which $a_(k t) lt.eq 1$ at every other unassigned label $t$.
    If only one label remains, choose it as $k$.
  Branch on the two choices in pair $k$. Apply Lemma 11 with the two elements of $k$ as singleton slots,
    both of multiplier one, and with the other unassigned pairs as ordinary slots. Keep $sigma$ fixed.
    A singleton-hole state is a transversal respecting $sigma$;
    an ordinary-hole state at $t$ has type $t k$ and multiplier $W_t = w_(t k)$.
    The auxiliary doubled-slot mass is exactly $v_t = c_(k t)^sigma$.
    Thus every one-hole state in this application belongs to $cal(X)$ with precisely its weight $lambda$.
    The good-multiplier bound, followed by two uses of (24), gives
  #[#set math.equation(numbering: n => "(39)")
   $ v_t / W_t = c_(k t)^sigma / w_(t k) & lt.eq frac(4 c_(k t)^sigma c_(t k), C) lt.eq
     frac(4 q^2 tilde(c)_(k t)^sigma tilde(c)_(t k), C)\
 & = 4 q^2 z_sigma a_(k t) lt.eq 4 q^2 z_sigma . $ <eq:sink-comparison>]
  These comparisons involve only actual defect types.
  Let $s_0 \, s_1$ and $macron(g)_0 \, macron(g)_1$ be the masses and means of the two transversal children,
    so $s_0 + s_1 = z_sigma$. Their unnormalized between-means variance contribution is
  $ frac(s_0 s_1, z_sigma) \( macron(g)_0 - macron(g)_1 \)^2 . $
  Let $frak(D)_sigma \( g \)$ be the sum in (31) restricted to edges whose two endpoints respect $sigma$.
    The slot energy in this application is a subgraph energy, so it is at most $frak(D)_sigma \( g \)$.
    Multiplying (32) by $s_0 s_1 \/ z_sigma$ and using (39) yields
  #[#set math.equation(numbering: n => "(40)")
   $ frac(s_0 s_1, z_sigma) \( macron(g)_0 - macron(g)_1 \)^2 lt.eq \( 1 + 8 p q^2 \) frak(D)_sigma \( g \) .
     $ <eq:conditional-variance-charge>]
  The first two terms in the transport coefficient contribute exactly $\( s_0 + s_1 \) \/ z_sigma = 1$;
    the ordinary slots contribute at most $8 p q^2$.
  Iterate this branching until every pair is fixed. The conditional variance identity decomposes $C
    "Var"_mu \( g \)$ as the sum of the between-means contributions over the internal nodes.
    At any depth, two distinct nodes disagree on the choice of the pair fixed at their first divergence.
    Their restricted state sets are disjoint, even if subsequent pairs were chosen in different orders.
    Consequently their internal edge sets are disjoint and
  $ sum_(sigma upright(" at a fixed depth")) frak(D)_sigma \( g \) lt.eq frak(D) \( g \) . $
  An edge crossing a fixed-pair choice is internal to neither of the two resulting restrictions;
    it does not create a duplicate charge. There are $p$ possible branching depths. Summing (40) proves (37).
    The conditioning tree and sink choices are used only in this proof. ◻
]

=== 5.4 Defect means and observable variance <defect-means-and-observable-variance>

Set

$ C_(upright(d)) = 8 + 32 p q^3 . $

For $i eq.not l$, let $macron(g)_(i l) = c_(i l)^(- 1) sum_(S in cal(A)_(i l)) f \( S \) g \( S \)$.

#thm([Lemma 5.3.])[
  #emph[Suppose the multipliers satisfy (29), and let $g$ be a real function on $cal(X)$.
    For each defect type $i l$ there is a conditional transversal mean $macron(g)'$ such that
#[#set math.equation(numbering: n => "(41)")
 $ \( macron(g)_(i l) - macron(g)' \)^2 lt.eq C_(upright(d)) / C frak(D) \( g \) \,
   wide \( macron(g)' - bb(E)_mu g \)^2 lt.eq 4 "Var"_mu \( g \) . $ <eq:defect-mean-bounds>]

]
] <lem:defect-mean>

#proof[
  Of the four possible joint choices in pairs $i \, l$, choose one whose transversal mass is at least $C \/ 4$.
    Denote the selected elements by $a_i \, a_l$ and their mates by $b'_i \, b'_l$.
    In Lemma 11, fix $a_l$ included and $b'_i$ excluded, and take $P_0 = { a_i }$, $P_1 = { b'_l }$.
    All other pairs are ordinary slots. A hole at $P_0$ gives the entire defect type $i l$,
    whereas a hole at $P_1$ gives the selected conditional transversal class. Thus
  $ s_0 = c_(i l) \, quad W_(P_0) = w_(i l) \, wide s_1 gt.eq C \/ 4 \, quad W_(P_1) = 1 . $
  An ordinary hole at $t$ has type $t l$, restricted to the choice $a_i$ in pair $i$, and has multiplier $W_t =
    w_(t l)$. A doubled ordinary slot with both singleton slots empty is a subset of type $i t$, so $v_t lt.eq
    c_(i t)$. All one-hole states and their exchange edges are therefore genuine states and edges of the chain,
    with the same endpoint weights. Their energy is at most $frak(D) \( g \)$.
  The lift comparison and Lemma 10 give, for each ordinary slot $t$,
  #[#set math.equation(numbering: n => "(42)")
   $ c_(i t) c_(t l) lt.eq q^2 tilde(c)_(i t) tilde(c)_(t l) lt.eq q^2 C tilde(c)_(i l) lt.eq
     q^3 C c_(i l) . $ <eq:defect-comparison>]
  The first two terms in the coefficient of (32) are at most $4 \/ C + 4 \/ C$. For its last term, (29) and (42) give
  $ frac(2, s_0 s_1) sum_t v_t / W_t lt.eq frac(8, c_(i l) s_1 C) sum_t c_(i t) c_(t l) lt.eq
    frac(8 p q^3, s_1) lt.eq frac(32 p q^3, C) . $
  This proves the first inequality of (41) with $macron(g)'$ the selected conditional mean.
    The conditioning event has $mu$-probability at least $1 \/ 4$; conditional Cauchy–Schwarz gives
  $ \( macron(g)' - bb(E)_mu g \)^2 lt.eq bb(E)_mu #scale(x: 120%, y: 120%)[\[] \( g - bb(E)_mu g \)^2 divides
    upright("selected choices") #scale(x: 120%, y: 120%)[\]] lt.eq 4 "Var"_mu \( g \) \, $
  which proves the second inequality. ◻
]

Define $cal(Q)$ on real functions on $cal(X)$ by retaining all values on $cal(A)$ and replacing the values on each
  defect type by their mean within that type. Since its multiplier is constant,
  the conditional $pi$-mean on $cal(A)_(i l)$ is $macron(g)_(i l)$.
  Hence $cal(Q)$ is the orthogonal projection in $L^2 \( pi \)$ associated with the partition into individual
  transversal states and entire defect types. Its range consists of functions that are arbitrary on $cal(A)$ and
  constant within each defect type. This includes type indicators and every function supported on $cal(A)$,
  the two kinds of observables used in Section 7. It preserves constants and means.

Chen, Vigoda, and Yang use a restricted variance bound for hole-pattern frequencies in permanent
  approximation #cite(label("CVY2026")) Theorem 5 and Lemma 12.
  Their partition pools the perfect matchings; here each transversal is retained separately,
  while each defect type is averaged. The inequality below controls this projection without requiring a bound on
  all fluctuations within a defect type. Put

#[#set math.equation(numbering: n => "(43)")
 $ K_(upright("obs")) = 10 p^4 \( 9 C_(upright(p)) + 2 C_(upright(d)) \) . $ <eq:observable-constant>]

#thm([Proposition 5.4.])[
  (Observable variance).  #emph[Suppose the multipliers satisfy (29). For every real $g$ on $cal(X)$,
#[#set math.equation(numbering: n => "(44)")
 $ "Var"_pi \( cal(Q) g \) lt.eq \( 9 C_(upright(p)) + 2 C_(upright(d)) \) frac(frak(D) \( g \), C) lt.eq
   K_(upright("obs")) cal(E) \( g \) . $ <eq:observable-variance>]

]
] <prop:observable-variance>

#proof[
  Let $m = bb(E)_mu g$. Lemma 13 and $\( a + b \)^2 lt.eq 2 a^2 + 2 b^2$ give
  $ \( macron(g)_(i l) - m \)^2 lt.eq frac(2 C_(upright(d)), C) frak(D) \( g \) + 8 "Var"_mu \( g \) . $
  Variance is no larger than squared deviation about any fixed constant. Therefore
  $ "Var"_pi \( cal(Q) g \) & lt.eq bb(E)_pi \[ \( cal(Q) g - m \)^2 \]\
 & = pi \( cal(A) \) "Var"_mu \( g \) + sum_(i eq.not l) pi \( cal(A)_(i l) \) \( macron(g)_(i l) - m \)^2\
 & lt.eq 9 "Var"_mu \( g \) + frac(2 C_(upright(d)), C) frak(D) \( g \)\
 & lt.eq \( 9 C_(upright(p)) + 2 C_(upright(d)) \) frac(frak(D) \( g \), C) \, $
  using Proposition 12 in the last step. Finally, (31) and (30) give $frak(D) \( g \) \/ C lt.eq
    10 p^4 cal(E) \( g \)$. When $p = 1$ the defect sum is empty and $cal(Q) = I$; the same inequalities apply. ◻
]

=== 5.5 Trajectory averages of the controlled observables <trajectory-averages-of-the-controlled-observables>

The covariance-sum viewpoint is classical; see Aldous and Fill #cite(label("AF2002")) Section 2.3.
  Here we derive the needed finite-time bound from the restricted observable inequality.

#thm([Lemma 5.5.])[
  (Time averages from a dominated initial law).  #emph[Suppose the multipliers satisfy (29).
    Let $G$ be a real function on $cal(X)$ with $cal(Q) G = G$.
    Suppose $S_0$ has law $nu$ satisfying $nu \( S \) lt.eq U pi \( S \)$ for every state.
    For $N gt.eq 1$ consecutive observations of the chain,
#[#set math.equation(numbering: n => "(45)")
 $ bb(E)_nu [(1 / N sum_(t = 0)^(N - 1) G \( S_t \) - bb(E)_pi G)^2] lt.eq
   frac(2 U K_(upright("obs")), N) "Var"_pi \( G \) . $ <eq:time-average-bound>]

]
] <lem:time-average>

#proof[
  Write $G_c = G - bb(E)_pi G$ and $v = "Var"_pi \( G \)$. Because $cal(Q)$ is an orthogonal projection fixing
    constants, for every $g$,
  $ \| chevron.l G_c \, g chevron.r_pi \|^2 & = \| chevron.l G_c \, cal(Q) g - bb(E)_pi g chevron.r_pi \|^2\
 & lt.eq v "Var"_pi \( cal(Q) g \) lt.eq K_(upright("obs")) v cal(E) \( g \) . $
  On the mean-zero subspace, $I - P$ is positive definite and invertible:
    reversibility makes $P$ self-adjoint, and finite irreducibility makes its eigenvalue one simple.
    Take $g = \( I - P \)^(- 1) G_c$ on this subspace and put
  $ a = chevron.l G_c \, \( I - P \)^(- 1) G_c chevron.r_pi = cal(E) \( g \) gt.eq 0 . $
  The previous inequality gives $a^2 lt.eq K_(upright("obs")) v a$, and hence $a lt.eq K_(upright("obs")) v$,
    also when $a = 0$.
  Laziness puts the spectrum of $P$ in $\[ 0 \, 1 \]$: the operator $2 P -
    I$ is itself a reversible stochastic contraction. Thus the stationary covariances $c_t = chevron.l G_c \,
    P^t G_c chevron.r_pi$ are nonnegative, and finite spectral decomposition on the mean-zero subspace gives
  $ sum_(t = 0)^oo c_t = chevron.l G_c \, \( I - P \)^(- 1) G_c chevron.r_pi = a . $
  For a stationary trajectory the mean squared error of the average is
  $ frac(N v + 2 sum_(t = 1)^(N - 1) \( N - t \) c_t, N^2) lt.eq frac(2 a, N) lt.eq frac(2 K_(upright("obs")) v, N) . $
  Finally, the law of an entire trajectory started from $nu$ is bounded by $U$ times the corresponding stationary
    trajectory law: only the initial factor changes in the product of transition probabilities.
    Applying this domination to the nonnegative squared error proves (45). ◻
]

=== 5.6 The transversal trace and its return cost <the-transversal-trace-and-its-return-cost>

Starting from $x in cal(A)$, let

$ T_(cal(A))^(+) = inf { t gt.eq 1 : S_t in cal(A) } \, wide P_(upright("tr")) \( x \, y \) =
  bb(P)_x \( S_(T_(cal(A))^(+)) = y \) . $

The trace makes one transition for each strictly positive return to $cal(A)$;
  consecutive visits and original holding steps count as returns.
  The mean return identity used below is the finite-state form of Kac’s formula #cite(label("AF2002")) Corollary 2.24.

#thm([Lemma 5.6.])[
  (Trace mixing and return cost).  #emph[Suppose the multipliers satisfy (29).
    The trace kernel $P_(upright("tr"))$ is irreducible, reversible with stationary law $mu$,
    and has holding probability at least $1 \/ 2$. Its inverse spectral gap is at most $2 p^2 C_(upright(p)) lt.eq
    K_(upright("obs"))$. In particular, with $mu_min = min_(x in cal(A)) mu \( x \) > 0$, for every integer $s gt.eq 0$,
#[#set math.equation(numbering: n => "(46)")
 $ lr(|frac(P_(upright("tr"))^s \( x \, y \), mu \( y \)) - 1|) lt.eq
   mu_min^(- 1) exp \( - s \/ K_(upright("obs")) \) wide \( x \, y in cal(A) \) . $ <eq:trace-relative-mixing>]

 If the initial trace law satisfies $nu lt.eq U mu$ pointwise, then
#[#set math.equation(numbering: n => "(47)")
 $ bb(E)_nu T_(cal(A))^(+) lt.eq frac(U, pi \( cal(A) \)) . $ <eq:trace-return-cost>]

 Furthermore, at every deterministic trace-step index the law remains bounded by $U mu$.
   The expected total number of underlying transitions for $s$ trace steps is at most $s U \/ pi \( cal(A) \)$.]
] <lem:trace>

#proof[
  Finite irreducibility ensures finite expected hitting and return times to $cal(A)$.
    Explicitly, from each state choose a finite positive-probability path to $cal(A)$.
    Finiteness of the state space gives a common bound on path length and a positive lower bound on these path
    probabilities. The Markov property then gives a geometric bound in blocks on the hitting-time tail.
    Applying this after the first transition also bounds the strictly positive return time.
    These qualitative bounds justify the harmonic extensions and occupation sums below;
    no polynomial estimate is assumed at this point.
  For a function $h$ on $cal(A)$, let $hat(h)$ be its harmonic extension
  $ hat(h) \( x \) = bb(E)_x h \( S_(T_(cal(A))) \) \, wide T_(cal(A)) = inf { t gt.eq 0 : S_t in cal(A) } . $
  Then $hat(h) = h$ on $cal(A)$, $\( I - P \) hat(h) = 0$ off $cal(A)$,
    and $\( I - P \) hat(h) = \( I - P_(upright("tr")) \) h$ on $cal(A)$ by conditioning on the first transition.
    For harmonic extensions $hat(h) \, hat(k)$ of $h \, k$, it follows that
  #[#set math.equation(numbering: n => "(48)")
   $ chevron.l hat(h) \, \( I - P \) hat(k) chevron.r_pi = C /
     Lambda chevron.l h \, \( I - P_(upright("tr")) \) k chevron.r_mu . $ <eq:trace-bilinear-identity>]
  Symmetry of the left side proves reversibility of the stochastic kernel $P_(upright("tr"))$ with respect to
    $mu$, and thus stationarity. Tracing positive-probability paths of $P$ proves irreducibility.
    Also $P_(upright("tr")) \( x \, x \) gt.eq P \( x \, x \) gt.eq 1 \/ 2$.
  Let $cal(E)_(upright("tr")) \( h \) = chevron.l h \, \( I - P_(upright("tr")) \) h chevron.r_mu$.
    Taking $k = h$ in (48) gives the exact normalization
  $ frak(D) \( hat(h) \) = 2 p^2 Lambda cal(E) \( hat(h) \) = 2 p^2 C cal(E)_(upright("tr")) \( h \) . $
  Proposition 12 therefore implies
  $ "Var"_mu \( h \) lt.eq 2 p^2 C_(upright(p)) cal(E)_(upright("tr")) \( h \) . $
  This is the stated inverse-gap bound. The inequality $2 p^2 C_(upright(p)) lt.eq
    K_(upright("obs"))$ follows immediately from (43) and $p gt.eq 1$.
  For the pointwise estimate put $e_x \( z \) = upright(bold(1))_({ x }) \( z \) \/ mu \( x \) - 1$.
    Reversibility and spectral contraction on mean-zero functions give
  $ lr(|frac(P_(upright("tr"))^s \( x \, y \), mu \( y \)) - 1|) & = \| chevron.l e_x \,
    P_(upright("tr"))^s e_y chevron.r_mu \|\
 & lt.eq
   exp \( - s \/ K_(upright("obs")) \)
   sqrt(#scale(x: 120%, y: 120%)[\(] mu \( x \)^(- 1) - 1 #scale(x: 120%, y: 120%)[\)]
   #scale(x: 120%, y: 120%)[\(] mu \( y \)^(- 1) - 1 #scale(x: 120%, y: 120%)[\)])\
 & lt.eq mu_min^(- 1) exp \( - s \/ K_(upright("obs")) \) \, $
  which proves (46).
  To compute the mean return cost, start the underlying chain with law $mu$ on $cal(A)$ and define the finite
    occupation measure
  $ m \( z \) = bb(E)_mu sum_(t = 0)^(T_(cal(A))^(+) - 1) upright(bold(1))_({ S_t = z }) . $
  Shifting the sum by one transition removes the initial law and adds the return law.
    Both are $mu$, since the trace is stationary. Thus $m P = m$.
    Uniqueness of the stationary probability measure for the finite irreducible chain implies $m =
    c pi$ for some positive constant $c$. Before the return, the only visit to $cal(A)$ is at time zero,
    so $m$ restricted to $cal(A)$ is exactly $mu$. Consequently $c pi \( cal(A) \) = 1$ and
  $ bb(E)_mu T_(cal(A))^(+) = sum_z m \( z \) = frac(1, pi \( cal(A) \)) . $
  Pointwise domination of the starting law proves (47). Since $mu$ is stationary for the trace,
    $nu P_(upright("tr"))^r lt.eq U mu$ for every deterministic integer $r gt.eq 0$.
    Applying (47) to each of these laws and using the Markov property at return times bounds the expected sum of
    $s$ excursion lengths by $s U \/ pi \( cal(A) \)$. This last bound is unconditional at the deterministic trace
    indices; it does not assert domination after conditioning on an arbitrary past event or on meeting a
    running-time cap.
  When $p = 1$, every state is a transversal, $P_(upright("tr")) = P$,
    and every return costs exactly one underlying transition. The stated bounds include this case. ◻
]

The flows, auxiliary matrices, and adaptive conditioning trees in this section certify the estimates but are not
  constructed by the algorithm. Section 7 uses the directly simulated Metropolis chain,
  the controlled observables, and capped trace restarts, together with the bounded weight evaluator from Proposition 17.

== 6 A bounded approximation procedure for the weights <sec:evaluation>

The free large coordinates in (8) cannot be enumerated in polynomial time.
  We instead partition their ranges into polynomially many intervals per coordinate and sample the resulting
  product grid. Scaled free coordinates, softened constraints,
  and grid walks appear in the dense-table methods of Dyer, Kannan, and Mount #cite(label("DKM1997"));
  Morris #cite(label("Morris2002")) further developed the associated geometric rounding approach.
  The weighted bin construction below includes its geometric estimate, population correction,
  and finite-bit implementation in full.

#thm([Proposition 6.1.])[
  (Weight evaluation).  #emph[Fix a box-valid small-count profile $\( x \, y \)$ with total $p$,
    an integer $0 lt.eq j lt.eq H$, and rational parameters $0 < xi_(upright("in")) \, theta < 1 \/ 4$.
    There is a randomized procedure returning a positive rational $hat(h)$ such that
$ bb(P)
  [\( 1 - xi_(upright("in")) \) h_j \( x \, y \) lt.eq hat(h) lt.eq \( 1 + xi_(upright("in")) \) h_j \( x \, y \)]
  gt.eq 1 - theta . $

 On every execution its bit cost is bounded by a fixed polynomial in $L \, epsilon^(- 1) \,
   xi_(upright("in"))^(- 1) \, theta^(- 1)$ and the encoding lengths of the parameters.
   If $M_f = product_(s med upright("free")) \( b_s + 1 \)$, every returned value satisfies
#[#set math.equation(numbering: n => "(49)")
 $ frac(M_f 2^(- j), 16) lt.eq hat(h) lt.eq 8 M_f . $ <eq:oracle-unconditional-range>]

 In particular, positivity and the representation-length bound do not depend on the statistical success event.]
] <prop:weight-oracle>

=== 6.1 Bins and a comparable continuous density <bins-and-a-comparable-continuous-density>

Throughout the construction, fix $\( x \, y \)$. Let $e$ be the number of free cells.
  We first describe the positive-dimensional case; the case $e = 0$ is addressed below.
  On $\[ 0 \, B \]^e$, write $D \( v \)$ for the penalty of the free values $z_s = \( b_s + 1 \) v_s \/ B$.
  Lemma 2 gives

#[#set math.equation(numbering: n => "(50)")
 $ 0 lt.eq D \( v \) lt.eq H \, wide \| D \( v \) - D \( w \) \| lt.eq frac(2 A d^2, B) parallel v -
   w parallel_oo = 1 / 8 parallel v - w parallel_oo . $ <eq:scaled-penalty-bounds>]

The function $D$ is convex.

Let $cal(V) = { 0 \, dots.h \, B - 1 }^e$ be the bin indices.
  Assign an integer free vector $z$ to the bin whose coordinates are $floor.l B z_s \/ \( b_s + 1 \) floor.r$.
  Denote the resulting Cartesian product of integer intervals by $I_v$.
  In a coordinate with $N = b_s + 1$, the interval for bin index $v_s$ is

$ {⌈frac(N v_s, B)⌉ \, dots.h \, ⌈frac(N \( v_s + 1 \), B)⌉ - 1} . $

Its cardinality differs from $N \/ B$ by at most one. Since a free cell is large, $N gt.eq W = 100 d B$,
  so every interval is nonempty. Define

$ alpha_v = frac(B^e \| I_v \|, M_f) . $

Each coordinate contributes a factor in $\[ 1 - 1 \/ \( 100 d \) \, 1 + 1 \/ \( 100 d \) \]$.
  There are at most $d$ coordinates, and hence

#[#set math.equation(numbering: n => "(51)")
 $ 1 / 2 lt.eq alpha_v lt.eq 2 . $ <eq:bin-populations>]

The intervals and $alpha_v$ are computed by integer arithmetic.

For an integer $0 lt.eq a lt.eq j$, put

$ V_a \( v \) = 2^(- floor.l a D \( v \) \/ H floor.r) \, wide 𝜚_a \( w \) =
  2^(- a D \( w \) \/ H) quad \( w in \[ 0 \, B \]^e \) . $

The density $𝜚_a$ is positive and log-concave. Its base-two logarithm has sup-norm Lipschitz constant at most
  $1 \/ 8$, and therefore also at most one. Combining this weaker bound with the floor gives,
  on the unit bin with lower corner $v$,

#[#set math.equation(numbering: n => "(52)")
 $ frac(V_a \( v \), 4) lt.eq 𝜚_a \( w \) lt.eq 2 V_a \( v \) . $ <eq:bin-density-comparison>]

The same inequalities hold at boundary points by continuity.

=== 6.2 The estimator and its population correction <the-estimator-and-its-population-correction>

For $0 lt.eq a lt.eq j$, define the bin partition function and law

$ S_a = sum_(v in cal(V)) V_a \( v \) \, wide pi_a \( v \) = frac(V_a \( v \), S_a) . $

The dyadic weights $V_a$ will permit exact finite-bit Metropolis acceptance.
  Their normalizing constants can be estimated through adjacent ratios. For $0 lt.eq a < j$, the observable

$ R_a \( v \) = frac(V_(a + 1) \( v \), V_a \( v \)) $

has expectation $S_(a + 1) \/ S_a$ under $pi_a$. Its values are $1 \/ 2$ or one:
  $0 lt.eq D \/ H lt.eq 1$ makes the increment of the floor exponent zero or one.

For the final correction, draw $v$ from $pi_j$, then a uniform integer point $z in I_v$,
  and let $s$ be its cube coordinates $s_u = B z_u \/ \( b_u + 1 \)$. Use

#[#set math.equation(numbering: n => "(53)")
 $ T \( v \, z \) = alpha_v frac(2^(- j D \( s \) \/ H), V_j \( v \)) . $ <eq:oracle-correction>]

Equations (51) and (52) show $1 \/ 8 lt.eq T lt.eq 4$. The factor $alpha_v$ corrects for the number of integer
  points in the selected bin. The correction therefore has exact expectation

$ bb(E) T = 1 / S_j sum_v frac(alpha_v, \| I_v \|) sum_(z in I_v) 2^(- j D \( s \) \/ H) =
  frac(B^e h_j \( x \, y \), M_f S_j) . $

As $S_0 = B^e$, the identity

#[#set math.equation(numbering: n => "(54)")
 $ M_f (product_(a = 0)^(j - 1) bb(E)_(pi_a) R_a) bb(E) T = h_j \( x \, y \) $ <eq:oracle-telescope>]

specifies the estimator. We approximate each expectation by an average of independent fresh samples and multiply
  the $j + 1$ averages by $M_f$.

=== 6.3 Interpolation and conductance <interpolation-and-conductance>

It remains to sample the bin laws $pi_a$ with controlled error and bounded work. We use a local Metropolis walk.
  The continuous density $𝜚_a$ supplies the cut expansion estimate that bounds its mixing time;
  it is not itself sampled. We first establish the finite-box form of the Prékopa–Leindler interpolation
  inequality #cite(label("Leindler1972")) #cite(label("Prekopa1973")) used in the geometric argument.
  All integrals in the following lemma are with respect to Lebesgue measure.

#thm([Lemma 6.2.])[
  (Integral interpolation).  #emph[Let $S_0 \, S_1 \, S_2$ be finite unions of bounded open axis-aligned boxes
    contained in a common compact box. Let $0 < t < 1$ and suppose $\( 1 - t \) S_1 + t S_2 subset.eq S_0$.
    Let $f_0 \, f_1 \, f_2$ be positive continuous functions on the ambient compact box such that
$ f_0 \( \( 1 - t \) x + t y \) gt.eq f_1 \( x \)^(1 - t) f_2 \( y \)^t wide \( x in S_1 \, med y in S_2 \) . $

 Then
$ integral_(S_0) f_0 gt.eq (integral_(S_1) f_1)^(1 - t) (integral_(S_2) f_2)^t . $

]
] <lem:integral-interpolation>

#proof[
  In dimension one, write $A_i = integral_(S_i) f_i$ for $i = 1 \, 2$;
    zero source mass makes the conclusion immediate. Let $x \( u \) \,
    y \( u \)$ be the increasing quantiles of the two normalized source densities, $0 < u < 1$.
    Away from finitely many subdivision parameters they are continuously differentiable, with
  $ x' \( u \) = frac(A_1, f_1 \( x \( u \) \)) \, wide y' \( u \) = frac(A_2, f_2 \( y \( u \) \)) . $
  The map $z \( u \) = \( 1 - t \) x \( u \) + t y \( u \)$ is increasing.
    Its smooth pieces have disjoint images contained in $S_0$;
    jumps merely omit nonnegative contributions to the target integral.
    Change of variables on these pieces, followed by the weighted arithmetic–geometric mean inequality, gives
  $ integral_(S_0) f_0 & gt.eq integral_0^1 f_0 \( z \( u \) \)
    (\( 1 - t \) frac(A_1, f_1 \( x \( u \) \)) + t frac(A_2, f_2 \( y \( u \) \))) thin d u\
 & gt.eq integral_0^1 A_1^(1 - t) A_2^t thin d u = A_1^(1 - t) A_2^t . $
  This argument also permits nonnegative piecewise-continuous densities with finitely many zero intervals,
    provided each nonzero piece is bounded above and bounded away from zero.
  For the induction on dimension, fix first coordinates $x_1 \,
    y_1$ of the two sources and put $z_1 = \( 1 - t \) x_1 + t y_1$.
    The corresponding slices satisfy the same set inclusion and interpolation hypothesis in one lower dimension.
    The induction hypothesis therefore gives the one-dimensional interpolation inequality for the three marginal
    integrals over slices. Subdivide the first-coordinate axis at the finitely many box endpoints.
    On each resulting interval every slice domain is constant;
    positivity and continuity on the ambient compact box make each nonzero marginal continuous, bounded,
    and bounded away from zero there. Thus the one-dimensional argument just proved applies to the marginals.
    Iterated integration proves the claim. ◻
]

On $cal(V)$, use the Metropolis chain with weights $V_a$.
  Each signed coordinate direction is proposed with probability $2^(- ceil.l log_2 \( 4 d \) ceil.r)$.
  Hold for unused proposal outcomes or for proposals outside $cal(V)$,
  and accept a valid proposal with probability $min { 1 \, V_a \( w \) \/ V_a \( v \) }$.
  The chain is reversible for $pi_a$ and is lazy, since the total probability of directional proposals is at most
  $1 \/ 2$.

#thm([Lemma 6.3.])[
  (Bin conductance).  #emph[For $e gt.eq 1$, every nontrivial cut of this chain has stationary flow divided by its
    smaller stationary side mass at least
$ kappa = frac(1, 10^4 d^2 B) . $

]
] <lem:bin-conductance>

#proof[
  Write $mu$ for unnormalized integration against $𝜚_a$ on $D_0 = \( 0 \, B \)^e$.
    For a fixed cut, let $S$ be the union of the open unit bins on the side of smaller continuous mass.
    Grid hyperplanes have zero mass, so $mu \( S \) lt.eq mu \( D_0 \) \/ 2$. Set
  $ t = frac(1, 4 d B) \, wide r = t B = frac(1, 4 d) \, wide M = \( 1 - t \) S + t D_0 . $
  The set $M$ is a finite union of open boxes and contains $S$.
    Lemma 18, applied with all three functions equal to $𝜚_a$, gives
  #[#set math.equation(numbering: n => "(55)")
   $ mu \( M \\ S \) gt.eq \( 2^t - 1 \) mu \( S \) gt.eq t / 2 mu \( S \) . $ <eq:bin-expansion>]
  We cover the added mass by neighborhoods of cut faces. Consider a point $z in M \\ S$ off the grid hyperplanes,
    and choose $x in S$, $y in D_0$ with $z = \( 1 - t \) x + t y$.
    The segment from $x$ to $z$ has sup-norm length less than $r$.
    At some grid-crossing event its entering and exiting bins have different cut membership.
    If several coordinates cross simultaneously, flip those coordinates one at a time between the entering and
    exiting bins. All intermediate bins are incident to the crossing point and lie in the cube.
    At least one consecutive pair belongs to opposite sides of the cut.
    Its closed common face contains the crossing point, so $z$ is within sup distance $r$ of an actual
    axis-adjacent cut face.
  This proves containment, up to the null set of grid hyperplanes,
    in the union of the radius-$r$ neighborhoods of the cut faces.
    It does not charge a multiplicity for the number of incident bins.
    Disconnectedness of $S$ causes no change in the argument.
    The segment stays in the open ambient cube, and intersecting a face neighborhood with that cube only reduces
    its volume.
  Each face neighborhood has volume at most
  $ 2 r \( 1 + 2 r \)^(e - 1) = frac(1, 2 d) (1 + frac(1, 2 d))^(e - 1) lt.eq 1 . $
  Every point in it is within sup distance $1 + r$ of either adjacent lower corner.
    The logarithmic Lipschitz bound and $𝜚_a \( v \) lt.eq V_a \( v \)$ therefore bound its density by $2^(1 + r)
    V_a \( v \) lt.eq 4 V_a \( v \)$ for each of the two adjacent corners separately.
    Thus, if $F$ is the sum of $min { V_a \( v \) \, V_a \( w \) }$ over cut edges,
    the covering gives $mu \( M \\ S \) lt.eq 4 F$.
  Let $m$ be the smaller of the two unnormalized discrete side masses. By (52),
  $ mu \( S \) gt.eq 1 / 4 sum_(v : thin v + \( 0 \, 1 \)^e subset S) V_a \( v \) gt.eq m / 4 . $
  This remains true if the smaller continuous side is the larger discrete side.
    Combining with (55) yields $F gt.eq t m \/ 32$. The directional proposal probability is at least
    $1 \/ \( 8 d \)$, so the normalized conductance is at least
  $ frac(t, 256 d) = frac(1, 1024 d^2 B) gt.eq kappa . $
  ◻
]

For completeness, this cut bound supplies a quantitative mixing time without an additional sampling theorem.
  For a finite reversible kernel $P$ with stationary law $pi$, write

$ cal(E)_P \( g \) = 1 / 2 sum_(v \, w) pi \( v \) P \( v \, w \) \( g \( v \) - g \( w \) \)^2 . $

For nonnegative $g$ supported on stationary mass at most $1 \/ 2$, integration over superlevel sets of $g^2$ gives

$ kappa bb(E)_pi g^2 lt.eq sum_({ v \, w }) pi \( v \) P \( v \, w \) \| g \( v \)^2 - g \( w \)^2 \| lt.eq
  #scale(x: 120%, y: 120%)[\(] 2 cal(E)_P \( g \) bb(E)_pi g^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $

Here the sum is over unordered distinct pairs, and the last inequality uses Cauchy–Schwarz and
  $\( g \( v \) + g \( w \) \)^2 lt.eq 2 g \( v \)^2 + 2 g \( w \)^2$.
  Apply the resulting inequality to the positive and negative parts about a median of an arbitrary function.
  Their energies sum to at most its energy, and their squared norms sum to at least its variance.
  Hence the inverse spectral gap is at most

$ K_(upright("bin")) = 2 / kappa^2 = 2 \( 10^4 d^2 B \)^2 . $

Laziness puts the spectrum in $\[ 0 \, 1 \]$: $2 P - I$ is a reversible stochastic contraction.
  Since $2^(- H) lt.eq V_a lt.eq 1$, $pi_(a \, min)^(- 1) lt.eq 2^H B^e$.
  Spectral contraction of the centered density of an initial point, followed by Cauchy–Schwarz,
  therefore gives the following convenient loose bound after $ell$ steps:

#[#set math.equation(numbering: n => "(56)")
 $ parallel P_a^ell \( v \, dot.op \) - pi_a parallel_(upright("TV")) lt.eq
   2^(H + d B) exp \( - ell \/ K_(upright("bin")) \) . $ <eq:bin-mixing>]

=== 6.4 Sample counts and error allocations <sample-counts-and-error-allocations>

We now implement the estimator in (54). Each occurrence of a bin sample uses a fresh walk;
  each offset sample uses fresh bits conditional on its bin.

Set

#[#set math.equation(numbering: n => "(57)")
 $ sigma = frac(xi_(upright("in")), 50 \( H + 1 \)) \, wide
   N_(upright("in")) = ⌈frac(10^6 \( H + 1 \), theta sigma^2)⌉ \, wide
   Q_(upright("in")) = \( d + 1 \) \( H + 1 \) N_(upright("in")) . $ <eq:inner-parameters>]

Use $N_(upright("in"))$ samples for every average. Each exact observable has variance divided by squared mean at
  most $1024$. Chebyshev’s inequality and a union bound over at most $H +
  1$ averages imply that all ideal averages have relative error at most $sigma$, except with probability at most

$ frac(1024 \( H + 1 \), N_(upright("in")) sigma^2) < theta / 4 . $

Each bin sample is obtained by an independent walk, started at a fixed bin, of length

#[#set math.equation(numbering: n => "(58)")
 $ ell_(upright("in")) = ⌈K_(upright("bin")) (H + d B + frac(16 Q_(upright("in")), theta) + 2)⌉ .
   $ <eq:inner-walk-length>]

Equation (56) bounds its total-variation error by $theta \/ \( 8 Q_(upright("in")) \)$.
  This deliberately conservative length is polynomial in the allowed inverse failure parameter.

#thm([Lemma 6.4.])[
  (Finite-bit uniform integer draw).  #emph[For a positive integer $M$ and $0 < zeta < 1$,
    choose the smallest nonnegative integer $k$ with $M 2^(- k) lt.eq zeta$.
    If $Y$ is uniform on ${ 0 \, dots.h \, 2^k - 1 }$, then $floor.l M Y \/ 2^k
    floor.r$ has total-variation distance at most $zeta$ from the uniform law on ${ 0 \, dots.h \, M - 1 }$.
    The draw uses exactly $k$ fair bits and bounded integer arithmetic.]
] <lem:dyadic-integer-draw>

#proof[
  Each output has either $floor.l 2^k \/ M floor.r$ or $ceil.l 2^k \/ M ceil.r$ preimages.
    Summing its deviation from probability $1 \/ M$ gives a total-variation bound at most $M 2^(- k)$.
    Computing the displayed integer quotient needs no rejection step. ◻
]

Apply Lemma 20 separately to every scalar offset interval, with $zeta = theta \/ \( 8 Q_(upright("in")) \)$,
  and translate by its lower endpoint. There are at most $Q_(upright("in"))$ bin draws and scalar offset draws
  together. Couple each bin draw to a stationary one, and, conditional on a matching bin,
  couple the offsets to exact uniform offsets in that bin. On a bin mismatch retain the correct conditional offset
  marginals on both sides; its failure is already charged. Use independent fresh randomness for different samples.
  The resulting ideal pairs $\( v \, z \)$ are independent across samples with joint law $pi_j \( v \)
  "Unif" \( I_v \)$, although bin and offset within a pair need not be independent.
  The probability of any draw discrepancy is at most $theta \/ 8$, in particular less than $theta \/ 4$.

=== 6.5 Correction arithmetic and a bound on every execution <correction-arithmetic-and-a-bound-on-every-execution>

The floors defining $V_a$ are evaluated by exact rational arithmetic. All these weights are dyadic.
  Bin proposals can be made with $ceil.l log_2 \( 4 d \) ceil.r$ bits, with unused outcomes interpreted as holds.
  Each Metropolis acceptance is an exact dyadic trial with at most $H$ additional bits.
  Thus the walk length (58) is also a deterministic bound on the number of transitions;
  no random-time rejection procedure is used.

Only the power of two in (53) needs numerical approximation. Its exponent is the rational number

$ beta = ⌊frac(j D \( v \), H)⌋ - frac(j D \( s \), H) in \[ - 2 \, 2 \] . $

Indeed the floor loses less than one and the exponent changes by at most one inside a bin.
  Choose a power-of-two integer $s'$ with $32 \/ sigma lt.eq s' lt.eq 64 \/ sigma$,
  and round $beta$ to its nearest grid point $h \/ s'$. Since $- 2$ and $2$ are grid points, $\| h \| lt.eq 2 s'$,
  and $\| beta - h \/ s' \| lt.eq sigma \/ 64$. If $T_0 = 2^beta$, then

$ lr(|2^(h \/ s') / T_0 - 1|) lt.eq e^(sigma \/ 64) - 1 lt.eq sigma / 32 \, wide T_0 gt.eq 1 / 4 . $

Here $sigma < 1 \/ 200$. Bisect the interval $\[ 0 \, 8 \]$,
  comparing the $s'$-th power of a rational midpoint with $2^h$,
  for a fixed number of iterations sufficient to make the absolute error at most $sigma \/ 64$.
  The returned rational $R$ then satisfies

$ lr(|R / T_0 - 1|) lt.eq sigma / 32 + sigma / 16 < sigma \, wide R gt.eq 1 / 4 - sigma / 64 > 0 . $

Here the rounded exponent $h \/ s'$ still belongs to $\[ - 2 \, 2 \]$,
  so its exact power is at least $1 \/ 4$ before the bisection error is applied.
  Negative $h$ causes no difficulty: $2^h$ is an exact dyadic rational with $O \( \| h \| \)$ bits.
  For example, a depth of $ceil.l log_2 \( 512 \/ sigma \) ceil.r$ and the final interval midpoint suffice.
  The bisection depth is $O \( log \( 1 \/ sigma \) \)$, and the exact powers being compared have
  $O \( s' log \( 1 \/ sigma \) \)$ bits. Since $s' = O \( sigma^(- 1) \)$,
  all these operations have polynomial bit cost. Multiply $R$ by the exact $alpha_v$ to approximate the correction
  with deterministic pointwise relative error at most $sigma$.

On the coupled event in which every ideal empirical mean is accurate, there are $j +
  1$ empirical multiplicative errors of at most $sigma$ and one further such error from rounding the correction.
  The bound $\| log \( 1 plus.minus sigma \) \| lt.eq 2 sigma$ gives total absolute logarithmic error at most

$ 2 sigma \( j + 2 \) lt.eq 4 sigma \( H + 1 \) = frac(2 xi_(upright("in")), 25) . $

For $0 < xi_(upright("in")) < 1 \/ 4$, this implies the relative interval
  $\[ 1 - xi_(upright("in")) \, 1 + xi_(upright("in")) \]$ in Proposition 17.
  The exceptional probability is less than $theta \/ 2$, and hence at most $theta$.

These statistical estimates are not needed for termination or output size.
  On every execution, the ratio averages lie in $\[ 1 \/ 2 \, 1 \]$.
  The exact correction lies in $\[ 1 \/ 8 \, 4 \]$, and its computed value lies in
  $\[ \( 1 - sigma \) \/ 8 \, 4 \( 1 + sigma \) \] subset \[ 1 \/ 16 \, 8 \]$. Its average has the same bounds.
  This proves (49) on every path, including paths where all empirical means are inaccurate.

To check bit complexity, every loop is bounded by (57) and (58).
  The parameters $A \, B \, W \, H$ are polynomial in $L$ and $epsilon^(- 1)$,
  and these loop bounds are fixed polynomials in those parameters, $xi_(upright("in"))^(- 1)$, and $theta^(- 1)$.
  Bin indices have $O \( log B \)$ bits, and rational cube coordinates used in the correction have
  $O \( L + log B \)$ bits. Integer offsets have the binary lengths of the input capacities;
  a scalar offset of interval length $M$ needs only $O \( log M + log \( Q_(upright("in")) \/ theta \) \)$ bits in
  Lemma 20. The tree values are affine sums of input margins and the current coordinates.
  Divisions by tree capacities in $D$ produce rational denominators whose total binary length is polynomial,
  since only polynomially many input integers occur. The quantities $M_f$, $B^e$, $\| I_v \|$,
  and $alpha_v$ likewise have polynomial-length representations.
  Finally, sums and products of polynomially many rationals of polynomial length have polynomial length even
  without cancellation. This includes all empirical means and the product forming $hat(h)$.
  Thus no numerical large capacity enters a loop bound.

If $e = 0$, take $cal(V)$ to consist of the empty vector and use the empty-product conventions $M_f = B^e =
  alpha_v = 1$. There is no offset draw and no bin walk. The same ratios and correction telescope to the single
  summand $2^(- j D \/ H)$; the deterministic rounding and all stated bounds remain valid.
  If $j = 0$, there are no ratio averages and $V_0 = 1$. The unrounded correction is $alpha_v$,
  whose expectation under uniform bins is exactly one. Its numerical approximation has the already allocated
  pointwise tolerance, so the procedure estimates $h_0 = M_f$ within the claimed error.
  These observations complete the proof of Proposition 17.

== 7 The annealing algorithm and its implementation <sec:algorithm>

We now combine the preceding estimates into a single algorithm.
  The transversal distribution at parameter $j$ is denoted by $mu_j = f_j \/ C \( j \)$.
  It does not depend on the defect multipliers. The underlying Metropolis kernel with parameter $j$ and multiplier
  collection $w$ is denoted by $P_(j \, w)$. We use the warm trace restarts of Section 5 to estimate successive
  partition function ratios while learning the defect multipliers.
  Balancing defect classes by estimated weights during annealing is an important feature of the permanent
  approximation algorithm of Jerrum, Sinclair, and Vigoda #cite(label("JSV2004")) Section 3.
  Here the observable-variance and trace bounds needed for the two-lift weights were proved in Section 5.

The feasibility test and tightening from Section 2 are performed first. An infeasible instance returns zero.
  Throughout this section the instance is feasible, so $Z gt.eq 1$. Recall that

$ p = sum_(s med upright("small")) b_s \, wide M_f = product_(s med upright("free")) \( b_s + 1 \) . $

An empty product equals one. If $p = 0$, we call Proposition 17 once to estimate $h_H \( diameter \) = C \( H \)$,
  with relative tolerance $epsilon \/ 32$ and failure probability $1 \/ 16$.
  This branch, including the case of an empty retained cell graph, is completed in the proof of Theorem 1 below.
  Until then suppose that $p gt.eq 1$. All logarithms without a subscript are natural logarithms.

=== 7.1 Initialization and comparison of adjacent parameters <initialization-and-comparison-of-adjacent-parameters>

#thm([Lemma 7.1.])[
  (Exact initialization).  #emph[For every state of the enlarged binary state space and $0 lt.eq j < H$,
#[#set math.equation(numbering: n => "(59)")
 $ 1 / 2 lt.eq f_(j + 1) / f_j lt.eq 1 . $ <eq:alg-adjacent>]

 Consequently the ideal multiplier $C \( j \) \/ c_(i l) \( j \)$ changes by a factor in $\[ 1 \/ 2 \, 2 \]$
   between consecutive parameters, and $mu_j lt.eq 2 mu_(j + 1)$ pointwise. Moreover,
#[#set math.equation(numbering: n => "(60)")
 $ min_(S in cal(A)) mu_j \( S \) gt.eq 2^(- \( H + p + K \)) wide \( 0 lt.eq j lt.eq H \) . $ <eq:alg-minimum-mass>]

 The values $C \( 0 \)$ and $c_(i l) \( 0 \)$, and hence all initial ideal multipliers,
   are computable exactly in polynomial bit time. The law $mu_0$ has the following finite-choice description:
   independently for each small cell $s$, choose a uniform integer $k_s in { 0 \, dots.h \, b_s }$,
   and then a uniform $k_s$-element subset of its $b_s$ labeled pairs to use their row elements.]
] <lem:initialization>

#proof[
  Lemma 2 gives $0 lt.eq D lt.eq H$. Each summand in $h_(j + 1)$ is therefore between one half and one times the
    corresponding summand in $h_j$, proving (59). The factorial factor in $f_j$ is independent of $j$.
    Summing the same inequalities over any type gives
  $ 1 / 2 lt.eq frac(C \( j + 1 \), C \( j \)) lt.eq 1 \, wide 1 / 2 lt.eq
    frac(c_(i l) \( j + 1 \), c_(i l) \( j \)) lt.eq 1 . $
  These bounds imply the multiplier comparison and $mu_j lt.eq 2 mu_(j + 1)$.
  On a transversal the factorial factor is $product_s binom(b_s, x_s)^(- 1) gt.eq 2^(- p)$.
    Also $h_j \( x \, y \) gt.eq M_f 2^(- H)$, while
  $ C \( j \) lt.eq M_f product_(s med upright("small")) \( b_s + 1 \) lt.eq M_f 2^K . $
  Their quotient proves (60).
  At parameter zero, $h_0 = M_f$, so
  #[#set math.equation(numbering: n => "(61)")
   $ C \( 0 \) = M_f product_(s med upright("small")) \( b_s + 1 \) . $ <eq:alg-initial-total>]
  We give an explicit formula for every defect total. Fix distinct pair labels $i \, l$,
    with $i$ empty and $l$ full. For each small cell $s$, let
  $ u_s = upright(bold(1))_({ i upright(" belongs to ") s }) \, wide v_s =
    upright(bold(1))_({ l upright(" belongs to ") s }) \, wide n_s = b_s - u_s - v_s . $
  There are $n_s$ singly occupied pairs left in that cell. If exactly $k$ of these use their row elements,
    then $x_s = k + v_s$, $y_s = n_s - k + v_s$, with multiplicity $binom(n_s, k)$. Hence
  #[#set math.equation(numbering: n => "(62)")
   $ c_(i l) \( 0 \) =
     M_f product_(s med upright("small"))
     [frac(1, b_s !) sum_(k = 0)^(n_s) binom(n_s, k) \( k + v_s \) ! \( n_s - k + v_s \) !] . $ <eq:alg-initial-defect>]
  This includes the case in which $i \, l$ lie in the same cell: then $u_s = v_s = 1$ and $n_s = b_s - 2 gt.eq 0$.
    All factorial arguments are at most $p$, and all sums have at most $p + 1$ terms.
    Using the common denominator $b_s !$ within each bracket,
    the numerators and denominators in (62) have $O \( L + p log \( p + 1 \) \)$ bits.
    There are at most $p \( p - 1 \)$ such totals. The multipliers
  $ w_(i l)^(\( 0 \)) = frac(C \( 0 \), c_(i l) \( 0 \)) $
  are therefore positive rationals of polynomial bit length and are computable by bounded integer arithmetic.
    In fact the local bracket in (62) equals $b_s + 1$, $1$, $\( b_s + 1 \) \( b_s + 2 \) \/ 6$,
    or $\( b_s + 1 \) \/ 6$, according as the cell contains neither designated pair, only the hole,
    only the full pair, or both. If $s \( i \)$ denotes the cell containing pair $i$, the equivalent initializer is
  $ w_(i l)^(\( 0 \)) =
    cases(delim: "{", 6 \, & s \( i \) = s \( l \) \,, frac(6 \( b_(s \( i \)) + 1 \), b_(s \( l \)) + 2) \, &
    s \( i \) eq.not s \( l \) .) $
  Finally, the asserted sampler assigns any particular transversal probability
  $ product_(s med upright("small")) frac(1, \( b_s + 1 \) binom(b_s, x_s)) = frac(f_0 \( S \), C \( 0 \)) . $
  This proves its distribution. The finite-choice description will be implemented with bounded fair-bit draws below. ◻
]

=== 7.2 A reference experiment with exact transition probabilities <a-reference-experiment-with-exact-transition-probabilities>

We first analyze a reference experiment using exact weights and probabilities.
  It is an auxiliary probability model; the implemented algorithm in the next subsection uses only the explicit
  weight evaluation procedure and independent fair bits.

To see which statistics a phase must collect, fix a parameter $0 lt.eq j < H$ and positive multipliers $w$,
  and let $pi$ be the stationary law of $P_(j \, w)$. Write $p_T$ for the stationary probability of type $T$,
  where $T = 0$ denotes $cal(A)$ and $T = \( i \, l \)$ denotes $cal(A)_(i l)$. Define

$ G_j \( S \) = upright(bold(1))_(cal(A)) \( S \) frac(f_(j + 1) \( S \), f_j \( S \)) \, wide u = bb(E)_pi G_j . $

The transversal mass is $C \( j \)$, and the multiplied mass of defect type $i l$ is $w_(i l) c_(i l) \( j \)$.
  Therefore

#[#set math.equation(numbering: n => "(63)")
 $ u / p_0 = frac(C \( j + 1 \), C \( j \)) \, wide w_(i l) p_0 / p_(i l) =
   frac(C \( j \), c_(i l) \( j \)) . $ <eq:alg-observable-identities>]

Thus one trajectory can estimate both the next counting ratio and the multipliers needed to balance the next
  phase. The type indicators are constant on each defect class, and $G_j$ vanishes there;
  all these observables are fixed by $cal(Q)$, so the time-average bound of Lemma 15 applies when the multipliers
  are good and the initial law is dominated by $pi$.

The stored multipliers depend on earlier trajectories. We therefore start each phase with fresh randomness,
  using a new $mu_0$ draw and trace stages at parameters $1 \, dots.h \, j$ with the multipliers already learned.
  The actual restart has a deterministic transition budget.
  For analysis we also consider the same restart without that budget.
  Conditional on a past history in which the learned multipliers are good,
  adjacent-parameter comparison and trace mixing give the required domination for this virtual restart.
  Its cap failure is bounded separately, without conditioning the endpoint law on meeting the cap.

Let $C_(upright(p)) \, C_(upright(d)) \, K_(upright("obs"))$ have the values in Section 5, so in particular

$ K_(upright("obs")) = 10 p^4 \( 9 C_(upright(p)) + 2 C_(upright(d)) \) . $

Choose the following integer time bounds and relative tolerance:

#[#set math.equation(numbering: n => "(64)")
 $ eta & = frac(epsilon, 200 \( H + 1 \)) \,\
tau & = 2 K_(upright("obs")) \( H + p + K + 5 \) \,\
B_(upright("ret")) & = 2000 p^2 \( H + 1 \)^2 tau \,\
N_(upright("av")) & = ⌈frac(10^8 p^8 K_(upright("obs")) \( H + 1 \), eta^2)⌉ . $ <eq:alg-phase-parameters>]

The quantities defining $tau$ and $B_(upright("ret"))$ are integers. Initialize $w^(\( 0 \))$ by Lemma 21.
  For $j = 0 \, dots.h \, H - 1$, carry out the following phase.

+ #emph[Restart on transversals.] Draw a fresh state from $mu_0$.
  For $a = 1 \, dots.h \, j$, run $tau$ successive trace steps of $P_(a \, w^(\( a \)))$,
  continuing from the transversal reached at the preceding stage.
  A trace step ends at the next transversal after a strictly positive number of underlying transitions.
  Across this entire restart, allow at most $B_(upright("ret"))$ underlying transitions.
  If another transition is needed after that budget is exhausted, abort the run and output zero.
  For $j = 0$, the fresh $mu_0$ draw is the restart endpoint.
+ #emph[Observe the current chain.] From this endpoint, run $P_(j \, w^(\( j \)))$ for $N_(upright("av"))$
  consecutive observed states, including the starting state.
  For each type $T$, let $n_T$ be its number of occurrences and $hat(p)_T = n_T \/ N_(upright("av"))$.
  Also form the empirical mean $hat(u)$ of $G_j$. If any type count is zero, abort the run and output zero.
+ #emph[Estimate the ratio and update the multipliers.] Set
  #[#set math.equation(numbering: n => "(65)")
   $ hat(R)_j = hat(u) / hat(p)_0 . $ <eq:alg-ratio-estimate>]
  If $j + 1 < H$, store
  #[#set math.equation(numbering: n => "(66)")
   $ w_(i l)^(\( j + 1 \)) = w_(i l)^(\( j \)) hat(p)_0 / hat(p)_(i l) = w_(i l)^(\( j \)) n_0 /
     n_(i l) . $ <eq:alg-multiplier-update>]

If no abort occurs, the reference output is

$ Z_(upright("ref")) = C \( 0 \) product_(j = 0)^(H - 1) hat(R)_j . $

Every phase uses fresh randomness. In particular, its initial $mu_0$ sample and its chains do not reuse the final
  state of an earlier observation trajectory.

#thm([Proposition 7.2.])[
  (Accuracy of the reference experiment).  #emph[With probability at least $1 - 1 \/ 50$,
    the reference experiment does not abort, every stored multiplier collection is good at its own parameter in
    the sense of (29), and
#[#set math.equation(numbering: n => "(67)")
 $ lr(|log frac(Z_(upright("ref")), C \( H \))|) lt.eq 4 H eta . $ <eq:alg-reference-error>]

]
] <prop:annealing>

#proof[
  We make the conditioning in the argument explicit. Let $cal(F)_j$ be the sigma-field generated by the completed
    trajectories, transition decisions, and counts of phases before $j$ in the capped reference experiment.
    The stored multipliers and the event that all these earlier phases were successful are $cal(F)_j$-measurable.
    Fix a past history on that event. The multipliers $w^(\( 0 \)) \, dots.h \,
    w^(\( j \))$ are now fixed and good; this will follow inductively from the update calculation below.
    The current phase uses independent fresh randomness.
  For analysis of this one phase, define a virtual experiment that continues its restart without a transition cap,
    and then takes its $N_(upright("av"))$ observations using fresh randomness. Write $M = H + p + K$.
    Lemma 16 and (60) imply that, from any starting transversal,
    a stage of $tau$ trace steps has pointwise relative error at most
  $ 2^M exp \( - tau \/ K_(upright("obs")) \) = 2^M exp \( - 2 \( M + 5 \) \) < 1 . $
  Its endpoint law is consequently at most $2 mu_a$. At the entrance to stage $a = 1$, the law is $mu_0 lt.eq
    2 mu_1$. At every later stage it is at most $2 mu_(a - 1) lt.eq 4 mu_a$.
    Invariance of the trace law preserves the bound $4 mu_a$ throughout that stage.
  For good multipliers, $pi \( cal(A) \) gt.eq 1 \/ \( 5 p^2 \)$.
    The warm return-cost bound of Lemma 16 therefore bounds the expected number of underlying transitions in each
    trace step by $20 p^2$. The virtual restart uses at most $H tau$ trace steps,
    so its expected total cost is at most $20 p^2 H tau$. Markov’s inequality gives
  #[#set math.equation(numbering: n => "(68)")
   $ bb(P) { upright("virtual restart cost") > B_(upright("ret")) divides cal(F)_j } lt.eq
     frac(H, 100 \( H + 1 \)^2) lt.eq frac(1, 100 \( H + 1 \)) . $ <eq:alg-cap-probability>]
  For $j = 0$, the cost is zero and the same upper bound holds.
  The virtual restart endpoint is at most $2 mu_j$, including $j = 0$.
    Since $mu_j$ is the conditional law of the current stationary distribution $pi$ on $cal(A)$,
    this endpoint law is at most $10 p^2 pi$ on the full state space.
    Each type indicator and $G_j$ is fixed by the projection $cal(Q)$ of Section 5.
    They take values in $\[ 0 \, 1 \]$. Their stationary means $p_T \, u$, given by (63),
    are at least $1 \/ \( 20 p^2 \)$: this is the type probability bound for defect types, while $p_0 gt.eq
    1 \/ \( 5 p^2 \)$ and $C \( j + 1 \) \/ C \( j \) gt.eq 1 \/ 2$.
  By Lemma 15, each empirical mean in the virtual observation trajectory has mean squared error about its
    stationary mean at most
  $ frac(20 p^2 K_(upright("obs")), N_(upright("av"))) . $
  There are $p \( p - 1 \) + 2 lt.eq 2 p^2$ observables. Markov’s inequality and a union bound therefore give
  #[#set math.equation(numbering: n => "(69)")
   $ & bb(P) { upright("some virtual empirical mean has
 relative error greater than ") eta divides cal(F)_j }\
 & #h(12mm)  lt.eq frac(16000 p^8 K_(upright("obs")), N_(upright("av")) eta^2) lt.eq
   frac(1, 100 \( H + 1 \)) . $ <eq:alg-empirical-probability>]
  These bounds concern the virtual, uncapped current phase.
    Whenever its restart cost is at most $B_(upright("ret"))$, it agrees with the actual capped phase.
    Thus failure of the capped phase is contained in the union of the two virtual failure events in (68) and (69).
    In particular, we never condition the endpoint law on surviving the cap.
  It remains to check that empirical success maintains the induction and controls the output.
    Because $eta < 1 \/ 4$, empirical success makes every type count positive.
    By (63), the exact ratio $w_(i l)^(\( j \)) p_0 \/ p_(i l)$ is the current ideal multiplier $C \( j \) \/
    c_(i l) \( j \)$. The relative errors in $hat(p)_0 \, hat(p)_(i l)$ change this value by a factor between
    $\( 1 - eta \) \/ \( 1 + eta \)$ and its reciprocal, both lying in $\[ 1 \/ 2 \, 2 \]$.
    Lemma 21 changes the ideal multiplier by at most another factor two at the next parameter.
    Equation (66) therefore satisfies (29) for $j + 1$. The update estimates the current ideal multiplier
    directly; its error does not multiply the earlier error in $w^(\( j \))$.
  The same empirical bounds, and $u \/ p_0 = C \( j + 1 \) \/ C \( j \)$, give
  $ lr(|log frac(hat(R)_j, C \( j + 1 \) \/ C \( j \))|) lt.eq 4 eta . $
  Initialization is good by Lemma 21. For every successful fixed past,
    the conditional probability of a current failure is at most $2 \/ \[ 100 \( H + 1 \) \]$.
    Summing the probabilities of the first failing phase gives total failure probability at most
  $ frac(2 H, 100 \( H + 1 \)) < 1 / 50 . $
  On the complementary event, the ratio product telescopes and its logarithmic errors sum to (67). ◻
]

=== 7.3 A bounded implementation using fair bits <a-bounded-implementation-using-fair-bits>

All parameters and counters below are represented exactly. Set

#[#set math.equation(numbering: n => "(70)")
 $ J_(*) = 100 \( H + 1 \) \( B_(upright("ret")) + N_(upright("av")) + p + d + 1 \) \, wide xi =
   frac(eta, 1000 J_(*)) . $ <eq:alg-bit-parameters>]

To evaluate any individual $f_j \( S \)$, call Proposition 17 with $xi_(upright("in")) = theta =
  xi$ and the small-count profile of $S$, using fresh bits on every call,
  and multiply by the exact factorial factor in (22). The evaluation is positive on every execution.
  For a valid proposed move, compute the ratio of the two resulting rational $lambda$-weights, clip it at one,
  and use a dyadic acceptance threshold. Use the analogous ratio of fresh evaluations in each nonzero observation
  of $G_j$. Type counts and the updates (66) remain exact integer and rational computations.
  The restart transition caps are unchanged.

For every finite-choice draw from ${ 0 \, dots.h \, v - 1 }$, apply Lemma 20 with $M = v$ and $zeta = xi$.
  This uses a fixed number of fair bits and has total variation error at most $xi$.
  For the subset draw in Lemma 21, take $v = binom(b_s, k_s)$ and decode an index in a fixed order of the subsets.
  Successive binomial inclusion/exclusion counts do this with at most $b_s$ decisions.
  Thus the initial sampler uses at most two finite-choice draws per small cell.
  The choices of a current element and a complementary element in a Metropolis proposal likewise require only two
  scalar draws.

If $alpha in \[ 0 \, 1 \]$ is a computed rational acceptance probability,
  use $ceil.l log_2 \( 1 \/ xi \) ceil.r$ fair bits and the downward-rounded dyadic threshold for $alpha$.
  Its probability differs from $alpha$ by at most $xi$. A single fair bit implements the half hold exactly.
  These procedures use fixed bit counts at their requested resolutions and no rejection loop.

#thm([Lemma 7.3.])[
  (Coupling and bounded computation).  #emph[The implemented run uses a number of bit operations bounded,
    on every execution, by a fixed polynomial in $L$ and $epsilon^(- 1)$.
    It returns a nonnegative rational of polynomial bit length.
    It can be coupled to the capped reference experiment so that,
    except on an event of probability at most $10 J_(*) xi$, all state trajectories, type counts, cap decisions,
    and stored multipliers agree, every requested weight evaluation meets its relative tolerance,
    and each positive observed term of $G_j$ differs from its reference value by a factor whose logarithm has
    absolute value at most $4 xi$.]
] <lem:bounded-implementation>

#proof[
  We first bound the number of outer random actions. Let $s_(upright("sm"))$ be the number of positive small
    cells, so $s_(upright("sm")) lt.eq min \( p \, d \)$, and put
  $ T_max = H \( B_(upright("ret")) + N_(upright("av")) \) . $
  This bounds all underlying transitions in the capped run.
    Each transition needs at most two weight evaluations, four outer draws (a hold coin, two element choices,
    and an acceptance threshold), and one transition count. Each of at most $H
    N_(upright("av"))$ observations needs at most two additional weight evaluations.
    Initial sampling needs at most $2 s_(upright("sm"))$ outer draws per phase. Consequently
  #[#set math.equation(numbering: n => "(71)")
   $ & \# { upright("evaluation calls, outer draws, and transitions") }\
 & quad lt.eq 7 T_max + 2 H N_(upright("av")) + 2 H s_(upright("sm"))\
 & quad lt.eq 9 H \( B_(upright("ret")) + N_(upright("av")) \) + 2 H \( p + d \) < J_(*) . $ <eq:alg-action-budget>]
  A visited state has a single type, whose counter is incremented.
    There is no separate sampling for each defect type. Initializing the $p \( p - 1 \)$ counters and computing
    their updates are additional deterministic polynomial computations.
  For the coupling, expose the completed joint history of both processes immediately before each requested
    evaluation or draw. The event that the processes have matched so far, and the current evaluation input,
    are measurable in this history. A new evaluation uses a fresh bit stream independent of that history.
    Its conditional failure probability is therefore at most $xi$, uniformly over the requested profile.
    This conclusion remains valid after earlier matching and accuracy events,
    because they concern only already exposed randomness.
  Before a discrepancy, both runs have the same state and stored multipliers.
    Couple their initial and proposal draws at total variation cost at most $xi$ per finite choice.
    Conditional on matching proposals and accurate evaluations,
    let $r$ be the reference acceptance ratio before clipping and $r'$ the computed ratio.
    The exact factorial and multiplier factors are the same in both runs, and hence
  $ frac(1 - xi, 1 + xi) lt.eq r' / r lt.eq frac(1 + xi, 1 - xi) . $
  It follows, regardless of the magnitude or quality of the multipliers, that
  $ \| min \( 1 \, r' \) - min \( 1 \, r \) \| lt.eq frac(2 xi, 1 - xi) < 4 xi . $
  The dyadic threshold adds at most $xi$ to this absolute probability difference.
    To realize a common-uniform coupling, let $Y$ be the actual fresh uniform $k$-bit integer used for the
    acceptance decision, and write its dyadic threshold as $m \/ 2^k$.
    In the proof alone, introduce $V$ uniform on $\[ 0 \, 1 \)$, independent of $Y$, the completed joint past,
    and the current weight evaluations. Then $U = \( Y + V \) \/ 2^k$ is uniform on $\[ 0 \, 1 \)$,
    and the implemented test $Y < m$ is exactly $U < m \/ 2^k$.
    Use $U < min \( 1 \, r \)$ for the reference decision. Their mismatch probability is the absolute difference
    of these thresholds, with the bound just obtained. The auxiliary variable $V$ is never sampled by the algorithm.
  The coupling preserves the reference transition marginal conditional on the completed joint past.
    We do not condition the reference process on the event that the entire coupling eventually succeeds.
    Matching paths have exactly the same integer type counts, and the update (66) depends only on those counts.
    Thus their stored multipliers remain exactly equal, even though their observations of $G_j$ need not be equal.
    Trace return times and cap decisions are functions of the matched state paths, so they also agree.
    A union bound over (71), charging evaluation failures and draw or acceptance discrepancies,
    is at most $10 J_(*) xi$. On the remaining event, each positive observed weight ratio has logarithmic relative
    error at most $4 xi$. Zero observations are zero in both runs.
  We next prove the unconditional resource bound. Since all input cells are listed explicitly and the parameters
    are included in the input length, $d \, K = O \( L \)$. The definitions in (2) give, for example,
  $ A = O \( L^3 epsilon^(- 1) \) \, quad B = O \( L^5 epsilon^(- 1) \) \, quad W = O \( L^6 epsilon^(- 1) \) \,
    quad H = O \( L^11 epsilon^(- 2) \) \, quad p lt.eq d W . $
  All quantities in (64) and (70), including $xi^(- 1)$, are therefore bounded by fixed polynomials in $L \,
    epsilon^(- 1)$. Their rational encodings have polynomial length.
    The state can be stored using $2 p$ membership bits or $p$ element labels;
    the small counts and state type can be recovered by bounded scans.
  There is also a uniform size bound for stored multipliers on unsuccessful histories.
    Let $B_0 = O \( L + p log \( p + 1 \) \)$ bound the initial numerator and denominator lengths obtained from
    (62). On every nonaborting history,
  $ w_(i l)^(\( a \)) = w_(i l)^(\( 0 \)) product_(r = 0)^(a - 1) n_0^(\( r \)) / n_(i l)^(\( r \)) \, wide
    1 lt.eq n_0^(\( r \)) \, n_(i l)^(\( r \)) lt.eq N_(upright("av")) . $
  Thus, even without fraction reduction, its numerator and denominator each have at most
  #[#set math.equation(numbering: n => "(72)")
   $ B_0 + H ⌈log_2 \( N_(upright("av")) + 1 \)⌉ $ <eq:alg-multiplier-length>]
  bits, up to a fixed additive constant. A zero count causes an abort before any such division.
    This bound does not assume good multipliers or accurate weight calls.
  Proposition 17 supplies a deterministic polynomial bound on the work and output length of each evaluation,
    including its statistically unsuccessful executions. More explicitly,
    its ratio averages always lie in $\[ 1 \/ 2 \, 1 \]$ and its rounded correction average always lies in
    $\[ 1 \/ 16 \, 8 \]$, so every call at parameter $j$ returns a number in
  $ \[ thin M_f 2^(- j) \/ 16 \, med 8 M_f thin \] . $
  Its bounded dyadic precision and bounded numbers of rational operations give a polynomial representation length
    as well. The inputs of this subroutine are $j$, a valid small-count profile, and the fixed tolerances;
    multiplier values are not subroutine inputs. Multiplication by the exact factorial factor adds only
    $O \( p log \( p + 1 \) \)$ bits. Combining this bound with (72) proves that every Metropolis ratio and
    threshold comparison has polynomial-sized operands.
  For the output arithmetic, let $B_f$ be an unconditional polynomial bound on the lengths of evaluated
    $f$-weights. Each observation ratio has $O \( B_f \)$-bit numerator and denominator.
    Adding $N_(upright("av"))$ such rationals using their product as a common denominator requires
    $O \( N_(upright("av")) B_f + log \( N_(upright("av")) + 1 \) \)$ bits.
    Dividing by a nonzero empirical type probability adds only $O \( log \( N_(upright("av")) + 1 \) \)$ bits.
    The product of the $H$ phase estimates and $C \( 0 \)$ therefore has polynomial bit length.
    Ordinary integer arithmetic on these bounded operands, including the output operation, has polynomial cost.
  Finally, every outer loop has its displayed deterministic cap,
    and the evaluation subroutine itself has bounded loops and finite bit draws.
    Initialization and counter updates add at most polynomially many operations on the bounded integers just
    described. No part of this resource argument conditions on empirical accuracy, on successful coupling,
    or on survival of a restart. An abort outputs the rational zero;
    otherwise all estimates are positive rationals. This proves the claim on every execution. ◻
]

=== 7.4 Relative error and amplification <relative-error-and-amplification>

#proof[
  For an infeasible input the preliminary deterministic test returns zero on every execution, as required.
    Suppose that the input is feasible.
  First let $p gt.eq 1$. Combine Proposition 22 with Lemma 23.
    Except on an event of probability at most $1 \/ 50 + 10 J_(*) xi$, there is no abort,
    reference and implemented paths agree, and every positive observation differs from its reference counterpart
    by a factor between $exp \( - 4 xi \)$ and $exp \( 4 xi \)$.
    The same bounds hold for sums of these positive observations.
    Since type counts agree exactly, each implemented ratio estimate differs from its reference ratio by at most
    that same logarithmic amount. The implemented output $hat(Z)$ consequently satisfies
  #[#set math.equation(numbering: n => "(73)")
   $ lr(|log frac(hat(Z), C \( H \))|) lt.eq H \( 4 eta + 4 xi \) lt.eq epsilon / 16 . $ <eq:alg-final-log-error>]
  The failure bound is less than $1 \/ 4$, since $10 J_(*) xi = eta \/ 100$.
  Proposition 3 gives
  $ Z lt.eq C \( H \) lt.eq \( 1 + epsilon \/ 32 \) Z . $
  Together with (73), this implies the desired relative inequalities.
    Indeed, $e^(- epsilon \/ 16) gt.eq 1 - epsilon \/ 16$, and for $0 < epsilon < 1$,
  $ e^(epsilon \/ 16) \( 1 + epsilon \/ 32 \) lt.eq \( 1 + epsilon \/ 8 \) \( 1 + epsilon \/ 32 \) lt.eq 1 + epsilon . $
  Thus a single implemented run succeeds with probability greater than $3 \/ 4$.
  The case $p = 1$ is already included in this argument. The enlarged state space then consists of the two
    transversals, the defect-type family and multiplier updates are empty, and $pi \( cal(A) \) = 1$.
    Only the type-zero indicator and $G_j$ are observed. All denominators and time bounds used above remain defined.
  If $p = 0$, there is a single small-count profile and $C \( H \) = h_H \( diameter \)$.
    The call specified at the start of this section returns a positive rational satisfying
  $ \( 1 - epsilon \/ 32 \) C \( H \) lt.eq hat(Z) lt.eq \( 1 + epsilon \/ 32 \) C \( H \) $
  with probability at least $15 \/ 16$. The contamination bound again places this interval inside
    $\[ \( 1 - epsilon \) Z \, \( 1 + epsilon \) Z \]$. The evaluation procedure covers zero free coordinates as
    well, in which case its sum and bin space each have one element.
    This branch invokes none of the $p$-dependent chain parameters and has the same required polynomial bit bound.
  It remains to obtain the requested failure probability. Put
  $ s = ⌈log_2 \( delta^(- 1) \)⌉ \, wide R = 10 s + 1 \, $
  run the appropriate constant-success algorithm independently $R$ times,
    and return the median of its nonnegative rational outputs.
    Let $F$ be the number of runs outside the desired relative interval.
    Independence and the single-run failure bound $1 \/ 4$ give
  $ bb(E) thin 2^F lt.eq \( 5 \/ 4 \)^R . $
  A bad median requires at least half the runs to fail, so
  $ bb(P) { upright("bad median") } lt.eq (frac(5, 4 sqrt(2)))^(10 s + 1) lt.eq 2^(- s) lt.eq delta . $
  The middle inequality follows, for example, from $\( 5 \/ \( 4 sqrt(2) \) \)^10 < 1 \/ 2$.
  Lemma 23, or Proposition 17 for $p = 0$, bounds the work and output length of every run by one fixed polynomial
    in $L \, epsilon^(- 1)$. The number of repetitions is $O \( log \( delta^(- 1) \) \)$;
    exact comparisons and median selection on their polynomial-length rational outputs also have polynomial bit
    cost. Ceilings of binary logarithms used for the parameters and bit counts are computable by integer shifts
    and comparisons. All randomness in the implemented procedure consists of independent unbiased bits.
    Partition functions, defect totals away from parameter zero, proof-only conditioning trees,
    and transport flows are never queried or enumerated. The only weight evaluation used is the bounded procedure
    proved in Proposition 17. This establishes a uniform FPRAS with the stated bound on every execution. ◻
]

== 8 Counting and sampling bounded integral flows <sec:flows>

The table theorem also applies to integral single-commodity flows in arbitrary explicitly listed finite directed
  networks. Let $G = \( V \, E \)$ be a directed multigraph, allowing loops,
  and give each arc finite bounds $ell_e \, u_e in bb(Z)$ and each vertex a balance $beta_v in bb(Z)$,
  all encoded in binary. With the convention “outflow minus inflow equals balance,” define

#[#set math.equation(numbering: n => "(74)")
 $ cal(F) = { f in bb(Z)^E : thick & ell_e lt.eq f_e lt.eq u_e quad \( e in E \) \,\
 & sum_(e : thin upright("tail") \( e \) = v) f_e - sum_(e : thin upright("head") \( e \) = v) f_e =
   beta_v quad \( v in V \) #scale(x: 120%, y: 120%)[}] . $ <eq:flow-set>]

A loop occurs once in each sum and cancels from the balance.
  Each arc-value vector is counted once, not each path or cycle decomposition.
  Circulations have $beta = 0$; for distinct $s \, t$, prescribed value $k$ from $s$ to $t$ is expressed by
  balances $k \, - k \, 0$ at $s \, t$, and the other vertices, respectively.

#thm([Corollary 8.1.])[
  (Bounded integral flows).  #emph[For the network data above, there are algorithms with these guarantees.]
  + #emph[Given rational $epsilon \, delta in \( 0 \, 1 \)$,
    the counting algorithm outputs a nonnegative rational $hat(Z)_(upright("flow"))$ satisfying
$ bb(P) #scale(x: 120%, y: 120%)[\(] \( 1 - epsilon \) \| cal(F) \| lt.eq
  hat(Z)_(upright("flow")) lt.eq \( 1 + epsilon \) \| cal(F) \| #scale(x: 120%, y: 120%)[\)] gt.eq 1 - delta . $

 If $cal(F)$ is empty, it outputs zero on every execution.]
  + #emph[Given rational $tau in \( 0 \, 1 \)$, the sampling algorithm reports infeasibility exactly when $cal(F)$
    is empty. Otherwise it outputs $hat(f) in cal(F)$ on every execution, with
$ "TV" #scale(x: 120%, y: 120%)[\(] cal(L) \( hat(f) \) \, "Unif" \( cal(F) \) #scale(x: 120%, y: 120%)[\)] = 1 /
  2 sum_(f in cal(F)) lr(|bb(P) \( hat(f) = f \) - frac(1, \| cal(F) \|)|) lt.eq tau . $

]
  #emph[Both algorithms use independent unbiased bits. Let $L$ denote the total binary input length,
    including the corresponding accuracy parameters. Fixed polynomials in $L \, epsilon^(- 1) \,
    log \( delta^(- 1) \)$ for counting and in $L \, tau^(- 1)$ for sampling bound the total bit operations on
    every execution.]
] <cor:integral-flows>

#proof[
  #emph[The flow-to-table bijection.] If some $ell_e > u_e$, or if $sum_v beta_v eq.not 0$, the flow set is empty;
    return zero for counting and report infeasibility for sampling.
    The second test is necessary because every arc cancels in the sum of the balance equations.
    If $V = E = diameter$, there is one empty flow, which can be counted and returned directly.
    In all other cases, shift the lower bounds by putting
  $ x_e & = f_e - ell_e \, wide c_e = u_e - ell_e \,\
beta'_v & = beta_v - sum_(e : thin upright("tail") \( e \) = v) ell_e +
  sum_(e : thin upright("head") \( e \) = v) ell_e . $
  Then $0 lt.eq x_e lt.eq c_e$ and the new balance is $beta'_v$.
  For each original arc $e = \( u \, v \)$ introduce a private new vertex $w_e$ and replace the arc by $u arrow.r
    w_e arrow.r v$, giving both arcs cap $c_e$ and giving $w_e$ balance zero.
    The two arc values must agree at $w_e$, so this is a bijection on flows, including when $u = v$.
    The private vertices make all subdivided arc cells distinct and off-diagonal, also for parallel arcs.
    Write $W = V union { w_e : e in E }$ and $E'$ for the subdivided vertices and arcs,
    and let $c_a$ be the inherited cap of $a in E'$. Extend $beta'$ by zero at the new vertices.
    For $q = \| W \| = \| V \| + \| E \| > 0$, put
  $ K = 1 + sum_(a in E') c_a + sum_(w in W) \| beta'_w \| \,\
R_w = K + \( beta'_w \)^(+) \, wide C_w = K + \( beta'_w \)^(-) \, $
  where $h^(+) = max { h \, 0 }$ and $h^(-) = max { - h \, 0 }$.
    Index a $q times q$ table by $W$ in both coordinates, use row margins $R$ and column margins $C$, and set
  $ b_(s t) = cases(delim: "{", c_a \, & a = \( s \, t \) in E' \,, K \, & s = t \,, 0 \, & upright("otherwise") .) $
  The cases are disjoint, and the margin totals agree because $sum_w beta'_w = 0$.
  Given a subdivided flow $z$, put its arc values in the arc cells. At vertex $w$ the unique possible diagonal entry is
  $ y_w = R_w - "out"_w \( z \) = C_w - "in"_w \( z \) . $
  It is nonnegative since $K$ dominates every incident capacity sum.
    If $beta'_w gt.eq 0$, then $y_w = K - "in"_w \( z \)$; if $beta'_w lt.eq 0$, then $y_w = K - "out"_w \( z \)$.
    Thus $y_w lt.eq K$, so the table is feasible. Conversely,
    subtracting a table’s column equation from its row equation gives the subdivided balance at every vertex.
    The private-vertex balances equate the two copies of each original arc,
    and the diagonal entries are forced by the displayed formula.
    Adding back $ell$ gives the unique original flow. This proves a bijection with $Omega \( R \, C \, b \)$.
  The table has $q^2$ explicitly written caps. Its parameters are sums and differences of polynomially many binary
    integers, so their bit lengths and the total table-data length $L_(upright("tab"))$ are polynomial in the
    network-data length. Both directions of the bijection use only polynomially many operations on such integers;
    no capacity is expanded in unary. The deterministic feasibility test in Section 2 handles all remaining
    infeasibility, including edgeless and zero-capacity cases.
    If the table is infeasible, return zero for counting and report infeasibility for sampling.
    Otherwise Theorem 1 on the table gives the counting assertion with the stated bit bound.
  #emph[Sampling by conditional counts.] We use the self-reduction principle connecting approximate counting and
    almost-uniform generation #cite(label("JVV1986")) Theorem 6.3,
    implemented here by bisecting binary cell intervals. The argument below gives the required feasibility,
    total-variation, and bounded-bit guarantees.
  After this root feasibility test, write $Omega \( r \, c \, b \) =
    Omega \( R \, C \, b \)$ for the constructed feasible table set and initialize each cell interval to
    $\[ 0 \, b_(i j) \]$. At a reached node, let $\[ a_(i j) \, d_(i j) \]
    subset.eq \[ 0 \, b_(i j) \]$ be the current integer interval for cell $\( i \, j \)$.
    Shifting $X_(i j)$ by $a_(i j)$ is a bijection to a bounded-table instance with
  $ b'_(i j) = d_(i j) - a_(i j) \, wide r'_i = r_i - sum_j a_(i j) \, wide c'_j = c_j - sum_i a_(i j) . $
  Reject negative residual data before applying the feasibility test. Process the cells in a fixed order.
    For a nonsingleton interval $\[ a \, d \]$, put $m = floor.l \( a + d \) \/ 2
    floor.r$ and use the disjoint children $\[ a \, m \]$ and $\[ m + 1 \, d \]$,
    continuing until every interval is a singleton. A path has at most
  $ D = sum_(i \, j) ⌈log_2 \( b_(i j) + 1 \)⌉ lt.eq L_(upright("tab")) $
  decisions, and every conditioned input has polynomial binary length.
    If $D = 0$, the already-tested feasible table is unique and is returned directly.
    No assumption that attainable cell values form an interval is used.
  At a reached node, test both children for feasibility. Their feasible sets partition the parent’s feasible set,
    so at least one is feasible. If exactly one is feasible, take it.
    If both are feasible, let their positive counts be $N_0 \,
    N_1$ and call Theorem 1 separately on the two child instances with relative error $eta$ and failure
    probability $gamma$, using fresh independent bits. Write the nonnegative outputs as $hat(N)_0 \, hat(N)_1$.
    If their sum is zero, take child zero, which is known to be feasible.
    Otherwise put $hat(p) = hat(N)_0 \/ \( hat(N)_0 + hat(N)_1 \)$.
    Using $t$ further fresh bits, draw $U$ uniformly from ${ 0 \, dots.h \, 2^t -
    1 }$ and take child zero exactly when $U < floor.l 2^t hat(p) floor.r$.
    This implements probability $p_t = 2^(- t) floor.l 2^t hat(p) floor.r$, with $\| p_t - hat(p) \| lt.eq
    2^(- t)$, in bounded bit time. In particular, a zero estimate is never used as an infeasibility certificate,
    and every reached child is feasible.
  For exact counts the branch probability is $p = N_0 \/ \( N_0 + N_1 \)$,
    and these exact conditional probabilities telescope to the uniform law on feasible singleton leaves.
    On successful estimates, write $hat(N)_i = N_i \( 1 + e_i \)$ with $\| e_i \| lt.eq eta$. Then
  $ \| hat(p) - p \| = frac(p \( 1 - p \) \| e_0 - e_1 \|, 1 + p e_0 + \( 1 - p \) e_1) lt.eq
    frac(eta, 2 \( 1 - eta \)) . $
  At each reached history, the fresh count calls fail with probability at most $2 gamma$ in total.
    Averaging over them and the fresh branch bits, the conditional total-variation error of the implemented branch
    choice relative to the exact one is therefore at most
  $ a = frac(eta, 2 \( 1 - eta \)) + 2 gamma + 2^(- t) . $
  This bound also covers the zero-sum fallback; a one-feasible-child node has zero error.
    Couple the two branch choices whenever their prefixes agree.
    The probability of any mismatch is at most $D a$, so the output total-variation distance from the uniform
    table law is at most $D a$. This averages failures at each adaptive history,
    without conditioning on a path-dependent event that all count calls succeed.
  Set $D_(+) = max { 1 \, D }$ and choose
  $ eta = gamma = frac(tau, 8 D_(+)) \, wide t = ⌈log_2 frac(8 D_(+), tau)⌉ . $
  Since $eta < 1 \/ 2$, the preceding bound gives $D a lt.eq tau \/ 2 lt.eq tau$.
    There are at most $2 D$ count calls and $2 D + 1$ feasibility tests.
    Their input lengths are polynomial in $L$, including the binary encoding of $tau$, while $eta^(- 1) =
    8 D_(+) \/ tau$ and $log \( gamma^(- 1) \) = log \( 8 D_(+) \/ tau \)$.
    Theorem 1 bounds both the work and the output lengths of every count call, including failed ones.
    Thus exact ratio arithmetic and the $t$-bit threshold draw also have polynomial cost on every execution;
    the ceiling defining $t$ is computable by integer shifts and comparisons.
    The inverse bijection returns a feasible flow and preserves the total-variation distance.
    This proves the sampling and runtime assertions. ◻
]

The sampling conclusion is the stated total-variation approximation with polynomial dependence on $tau^(- 1)$.
  It asserts neither exact sampling nor a polynomial-in-$log \( tau^(- 1) \)$ error dependence.

#bibliography("refs.bib", style: "ieee", title: [References])
