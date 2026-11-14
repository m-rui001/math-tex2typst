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

#align(center)[#text(size: 16pt, weight: "bold")[Hardness of finding large independent sets \
in three-colorable graphs]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

A proper coloring of a graph assigns different colors to adjacent vertices.
  An independent set is a set of pairwise nonadjacent vertices.
  For a nonempty finite graph $G$, write $n = \| V \( G \) \|$ and let $alpha \( G \)$ be its maximum
  independent-set size. Every three-colorable graph contains an independent set of size at least $n \/ 3$:
  one of its three color classes has that size. We prove that distinguishing this structured case from graphs with
  an arbitrarily small fixed independence ratio is NP-hard.

#thm([Theorem 1.1.])[
  #emph[For every fixed real $0 < delta < 1 \/ 3$, there is a deterministic polynomial-time algorithm $R_delta$
    that maps each explicitly encoded Boolean $3$-CNF formula $phi.alt$ to a nonempty finite simple undirected
    unweighted graph $G_phi.alt$ such that
$ phi.alt upright(" is satisfiable") & arrow.r.double G_phi.alt upright(" is three-colorable") \,\
phi.alt upright(" is unsatisfiable") & arrow.r.double alpha \( G_phi.alt \) < delta thin \| V \( G_phi.alt \) \| . $

 The running time and explicit output size are polynomial in the ordinary binary encoding length of $phi.alt$.
   Their constants and polynomial degree may depend on the fixed $delta$, but not on $phi.alt$.
   The coloring in the first implication covers every vertex and is not supplied with the graph.]
] <thm:main>

It suffices to prove Theorem 1 for rational $delta$. For a fixed real threshold,
  choose a fixed rational $0 < delta_0 < delta$ and use $R_(delta_0)$.
  We assume $delta$ rational in the construction and its analysis.
  The density conclusion is stronger than an arbitrarily large fixed lower bound on chromatic number.
  Indeed, small independence ratio forces large chromatic number,
  whereas adjoining isolated vertices preserves chromatic number and can make the independence ratio arbitrarily
  close to one.

Approximate graph coloring asks, for fixed integers $3 lt.eq k lt.eq c$,
  to find a proper $c$-coloring of a graph promised to be $k$-colorable.
  Its decision version distinguishes $k$-colorable graphs from graphs that are not $c$-colorable.
  The following consequence recovers the constant-palette hardness theorem.

#thm([Corollary 1.2.])[
  #emph[For every fixed pair of integers $3 lt.eq k lt.eq c$,
    it is NP-hard to distinguish $k$-colorable graphs from graphs that are not $c$-colorable.]
] <cor:coloring>

#proof[
  Choose a rational $0 < delta < min { 1 \/ 3 \, 1 \/ c }$ and apply Theorem 1.
    A three-colorable graph is $k$-colorable. A $c$-colorable graph has an independent set of size at least $n \/
    c$, which the soundness bound excludes. ◻
]

=== 1.1 History and comparison with prior work <history-and-comparison-with-prior-work>

The difficulty of approximate coloring persists even with a very small promised palette.
  Khanna, Linial, and Safra established hardness of four-coloring three-colorable graphs
  #cite(label("KhannaLinialSafra2000")); Guruswami and Khanna later gave a different proof and obtained
  bounded-degree and edge-error variants #cite(label("GuruswamiKhanna2004")).
  The algebraic theory of promise constraint satisfaction developed by Barto, Bulı́n, Krokhin,
  and Opršal gave hardness of $\( 2 k - 1 \)$-coloring $k$-colorable graphs, and hence five colors when $k =
  3$ #cite(label("BartoBulinKrokhinOprsal2021")) Theorem 6.5.
  Their Example 2.9 records the conjectured hardness for every fixed $3 lt.eq k lt.eq c$.

Guruswami and Sandeep showed that the ordinary $d$-to-$1$ Games Conjecture with perfect completeness,
  for any fixed $d gt.eq 2$, implies constant-palette hardness for three-colorable graphs
  #cite(label("GuruswamiSandeep2020")) Theorem 1. Their reduction first gives arbitrarily small independent-set
  density with a $2 d$-colorable completeness promise #cite(label("GuruswamiSandeep2020")) Theorem 9.
  The arc-graph reduction of Krokhin, Opršal, Wrochna, and Živný #cite(label("KrokhinOprsalWrochnaZivny2023"))
  Theorem 1.8 then reduces the promised palette to three for the coloring conclusion.
  The resulting three-colorable hardness statement does not include the independent-set guarantee.
  The companion article #cite(label("OpenAIPerfectCompleteness2026")) Theorem 1.1 establishes the ordinary
  perfect-completeness premise for $d = 2$.

Fei, Minzer, and Wang have proved the $4$-to-$1$ Games Conjecture with perfect completeness
  #cite(label("FeiMinzerWang2026")) Theorem 1.6. Combining it with the preceding reductions resolves the
  constant-palette conjecture: their Corollary 1.7 gives the three-colorable versus not $c$-colorable gap for
  every fixed $c$. Their Corollary 1.9 gives arbitrarily small independent-set density with an eight-colorable
  completeness promise, corresponding to $2 d = 8$. Theorem 1 combines this stronger form of soundness with
  three-colorability of the entire graph. Our proof starts with ordinary projection Label Cover and does not
  require a bound on projection-fiber sizes.

The distinction between colorability and independence density also appears in earlier conditional results.
  Dinur, Mossel, and Regev obtained three-colorable completeness and arbitrarily small independent-set soundness
  from their fish-shaped Label Cover conjecture #cite(label("DinurMosselRegev2009")) Conjecture 4.8 and
  Sections 4.3–4.5. Braverman, Khot, Lifshitz, and Minzer obtained the same graph promise from the Rich $2$-to-$1$
  Games Conjecture using their invariance principle for the multi-slice
  #cite(label("BravermanKhotLifshitzMinzer2022")) Corollary 1.19.
  The Rich condition requires that, at each left question, a uniformly random incident constraint induce a
  uniformly random partition of the left alphabet among all partitions into pairs.
  This is not part of the ordinary $2$-to-$1$ premise above.

A different line of work relaxes completeness by permitting deletion of a small fraction of vertices.
  Dinur, Khot, Perkins, and Safra proved that, for arbitrarily small fixed $epsilon > 0$,
  it is NP-hard to find an independent set of density $1 \/
  9$ when an induced three-colorable subgraph occupies at least $\( 1 - epsilon \)
  n$ vertices #cite(label("DinurKhotPerkinsSafra2010")). Hecht, Minzer, and Safra subsequently proved,
  under randomized reductions, hardness of almost coloring such almost-three-colorable graphs with any fixed
  palette #cite(label("HechtMinzerSafra2023")). The all-vertex completeness in Theorem 1 retains the original
  coloring promise, while allowing every fixed positive soundness density.

Algorithmic work gives a complementary perspective on the remaining quantitative gap.
  Bansal, Huang, and Lee give a polynomial-time algorithm using $O \( n^0.19539 \)$ colors
  #cite(label("BansalHuangLee2026")), improving the $tilde(O) \( n^0.19747 \)$ bound of Kawarabayashi, Thorup,
  and Yoneda #cite(label("KawarabayashiThorupYoneda2024")).
  In preprints posted after the September 24 version of this manuscript,
  Narang and Tang report a randomized polynomial-time bound of $O \( n^(\( 13 - sqrt(97) \) \/ 18 + epsilon) \)$
  for each fixed $epsilon > 0$ #cite(label("NarangTang2026")),
  and Anand reports a randomized polynomial-time bound of $O \( n^(4 \/ 23) \)$ #cite(label("Anand2026")).
  Our reduction has fixed $delta$ and fixed palettes; its polynomial exponent can depend on these constants.

=== 1.2 Proof overview and method ancestry <proof-overview-and-method-ancestry>

The starting problem is Label Cover: a bipartite collection of questions and tests,
  each prescribing a projection from a left answer to a right answer.
  The PCP theorem and parallel repetition supply instances in which either every test can be satisfied or every
  labeling succeeds on at most an arbitrarily small fixed fraction of tests #cite(label("AroraEtAl1998"))
  #cite(label("Raz1998")) #cite(label("DinurSteurer2014")).

We replace one left question at a time by a right question, obtaining chains of question tuples.
  This use of layered tuples and projection constraints is related to the multilayered PCP construction of Dinur,
  Guruswami, Khot, and Regev #cite(label("DinurGuruswamiKhotRegev2005")).
  At each tuple, a point assigns a phase in $bb(T) = bb(R) \/ bb(Z)$ to every possible product answer.
  An answer projection $pi : M arrow.r M'$ pulls a phase vector $x in bb(T)^(M')$ back to $x compose
  pi in bb(T)^M$. Link these two points with length zero, and link points within each phase space with their sup
  circle distance. Shortest paths through these links define a pseudometric.
  Edges compare one point with the coordinatewise half-shift of another.
  A satisfying Label Cover labeling evaluates each phase assignment at one product answer.
  This evaluation is nonexpanding, and the edge threshold forces adjacent vertices to have circle phases more than
  $1 \/ 3$ apart. Three equal half-open intervals of the circle therefore color all vertices properly.

For soundness, an independent set gives bounded functions on the tuple phase spaces that change sign under a
  half-shift and satisfy a common Lipschitz bound. Austin’s dimension-independent approximation theorem
  #cite(label("Austin2016")), a continuous counterpart of Friedgut’s junta theorem #cite(label("Friedgut1998")),
  approximates these functions using boundedly many answer coordinates.
  The difficulty is that approximation under product measure need not survive identifications of coordinates by
  projections. We therefore choose coordinate lists for whole small subchains and introduce independent rotation
  variables at every layer of each subchain. All required compatibility properties are proved within this paper.
  Projecting the selected coordinates to the last layer places all lists in a common answer set.
  A shared answer for two separated subchains supplies compatible answers to an intervening Label Cover test,
  so low source value makes these intersections rare.

Two further steps turn this structural information into a density bound.
  First, a distributional alignment lemma chooses a law on sets of layers before seeing the lists.
  On most selected sets, each listed label can be assigned to an index shared by all its occurrences.
  The bound is independent of the label universe. The proof combines finite minimax,
  Ramsey homogenization of finite probability patterns, and an order-invariant random-array argument.
  The homogenization step has antecedents in the Ramsey theory of random variables
  #cite(label("TrotterWinkler1998")); we give the particular alignment argument in full.

Second, we sample coefficients at finitely many levels between $0$ and $1$,
  with geometrically decreasing probabilities. Enough layers make a coefficient equal to $1$ likely.
  That layer absorbs auxiliary uniform phase shifts without changing their distribution.
  Alignment makes dependence on a zero-coefficient layer small;
  decreasing a positive coefficient by one level bounds its probability of substantial dependence.
  A dimension-independent bound on influential coordinates then gives a small mean square,
  and hence a small independent-set density.

Only fixed finite rational data enter the graph construction.
  The probability experiment is expanded exactly into unweighted vertices, so the reduction is deterministic.
  Section 2 states the standard inputs and derives the analytic coordinate bounds.
  Section 3 constructs the graph with finite parameters and proves completeness.
  Section 4 extracts the coordinate lists from an independent set and decodes intersections of separated lists.
  Section 5 states distributional alignment and applies it to these lists.
  Section 6 proves the coefficient estimate under explicit inequalities,
  and Section 7 chooses all constants in dependency order and completes Theorem 1.
  The self-contained proof of distributional alignment is given in Section 8.

== 2 Two standard inputs and an analytic consequence <sec:preliminaries>

We first state the two established results used in the reduction.
  The new combinatorial and analytic arguments will be proved in full.
  For a positive integer $r$, write $\[ r \] = { 1 \, dots.h \, r }$.
  All products of metric spaces carry the sup metric unless stated otherwise.
  The circle $bb(T) = bb(R) \/ bb(Z)$ carries the distance $d_(bb(T)) \( x \, y \) = min_(k in bb(Z)) \| x - y -
  k \|$. Uniform inputs on a cube have product Lebesgue law,
  and uniform inputs on a product of circles have product Haar law.
  Norms $parallel dot.op parallel_p$ always use the indicated probability measure. An empty sum is zero.

=== 2.1 A projection constraint problem <a-projection-constraint-problem>

A #emph[Label Cover instance] consists of finite question sets $U \, V$,
  nonempty finite answer alphabets $Sigma_L \, Sigma_R$, and a nonempty explicit list $cal(C)$ of test
  occurrences. An occurrence $c$ has questions $u_c in U$, $v_c in V$, and a total map $pi_c : Sigma_L arrow.r
  Sigma_R$. The value is

$ "val" \( cal(C) \) = max_(ell : U arrow.r Sigma_L \, med rho : V arrow.r Sigma_R) Pr_(c in cal(C))
  #scale(x: 120%, y: 120%)[\[] pi_c \( ell \( u_c \) \) = rho \( v_c \) #scale(x: 120%, y: 120%)[\]] \, $

where occurrences, including repeated occurrences, are sampled uniformly.

#thm([Theorem 2.1.])[
  (Perfect-completeness Label Cover).  #emph[For every fixed rational $sigma
    in \( 0 \, 1 \)$ there are nonempty constant alphabets and a deterministic polynomial-time reduction from
    $3$SAT to explicit Label Cover instances with nonempty occurrence lists such that satisfiable formulas have
    value $1$ and unsatisfiable formulas have value at most $sigma$.]
] <thm:label-cover>

This is the standard consequence of the PCP Theorem and parallel repetition #cite(label("AroraEtAl1998"))
  #cite(label("Raz1998")). A quantitative statement is #cite(label("DinurSteurer2014")) Theorem 6.2, full version:
  for a fixed number $k$ of repetitions, the output size is $n^(O \( k \))$, the alphabet size is at most $a^k$,
  and the soundness is at most $beta_0^k$, for absolute constants $a > 1$ and $0 < beta_0 < 1$.
  Choose a fixed $k$ for which $beta_0^k lt.eq sigma$. The unweighted total-projection formulation is explicitly
  recorded in #cite(label("DKKMS2025")) Definitions 1.1–1.2 and Theorem 1.3.
  The latter source even supplies $d$-to-one maps, a property we do not use.
  Here the verifier’s random choices specify an explicit list of constraints;
  they are not random choices of the reduction. Unused questions can be removed.

=== 2.2 Juntas for the sup metric <juntas-for-the-sup-metric>

A function is a #emph[junta on $S$] if it depends only on the input coordinates in $S$.
  The approximating functions below need not be continuous.
  We use Austin’s continuous junta theorem #cite(label("Austin2016")),
  which extends the dimension-independent coordinate approximation phenomenon of Friedgut’s Boolean junta theorem
  #cite(label("Friedgut1998")).

#thm([Theorem 2.2.])[
  (Dimension-independent junta approximation).  #emph[For every $0 lt.eq
    L < oo$ and $tau > 0$ there is an integer $J \( L \, tau \) gt.eq
    1$ such that every $L$-Lipschitz function $f : \[ 0 \, 1 \]^N arrow.r \[ - 1 \, 1 \]$,
    for every positive integer $N$, admits a junta on at most $J \( L \, tau \)$ coordinates with $L^2$ error less
    than $tau$. The junta may be taken to be a coordinate conditional expectation of $f$.]
] <thm:junta>

To obtain this formulation from #cite(label("Austin2016")) Theorem 1.1, arXiv version 4,
  use the usual interval with uniform measure and modulus of continuity $omega \( t \) = L t$.
  The interval is compact, connected, and locally connected, as required there.
  Austin’s theorem gives $parallel f - bb(E) \[ f divides X_S \] parallel_1 < tau^2 \/ 2$ with $\|
  S \|$ bounded independently of $N$. Both functions take values in $\[ - 1 \, 1 \]$, so

$ parallel f - bb(E) \[ f divides X_S \] parallel_2^2 lt.eq 2 parallel f -
  bb(E) \[ f divides X_S \] parallel_1 < tau^2 . $

The bound applies to pullbacks of torus functions, since the quotient $\[ 0 \, 1 \]^N arrow.r
  bb(T)^N$ is nonexpanding and preserves the product uniform law.

For a square-integrable function $H$ of independent circle coordinates $z_1 \, dots.h \, z_s$,
  let $E_i$ average coordinate $z_i$ alone, and set

$ Q_i = "id" - E_i \, wide D_i \( H \) = parallel Q_i H parallel_2 . $

Both $E_i$ and $Q_i$ are orthogonal projections. In particular, $parallel Q_i f parallel_2 lt.eq
  parallel f parallel_2$; the constant here is one.

#thm([Lemma 2.3.])[
  (Two dimension-independent bounds).  #emph[Fix $0 lt.eq L < oo$ and $epsilon > 0$.
    There are $beta > 0$ and an integer $K gt.eq 1$, independent of $s$, such that every $L$-Lipschitz $H :
    bb(T)^s arrow.r \[ - 1 \, 1 \]$ satisfies:]
  + #emph[if $bb(E) H = 0$ and $bb(E) H^2 > epsilon$, then $D_i \( H \) gt.eq beta$ for some $i$;]
  + #emph[at most $K$ indices satisfy $D_i \( H \) gt.eq beta \/ 2$.]
] <lem:influences>

#proof[
  Let $J = J \( L \, sqrt(epsilon) \/ 2 \)$ from Theorem 4.
    Choose a set $S$ of at most $J$ coordinates such that $G = bb(E) \[ H divides z_S \]$ satisfies $parallel H -
    G parallel_2 < sqrt(epsilon) \/ 2$. If $H$ has mean zero and squared norm exceeding $epsilon$,
    then $G$ has mean zero and, by orthogonality, $parallel G parallel_2^2 > 3 epsilon \/ 4$,
    in particular $parallel G parallel_2^2 > epsilon \/ 4$.
  For completeness, decompose
  $ H = sum_(A subset.eq \[ s \]) H_A \, wide H_A = #scale(x: 180%, y: 180%)[\(] product_(i in A) Q_i
    #scale(x: 180%, y: 180%)[\)] #scale(x: 180%, y: 180%)[\(] product_(i in.not A) E_i
    #scale(x: 180%, y: 180%)[\)] H . $
  The factors commute and the summands are orthogonal. Thus $G = sum_(A subset.eq S) H_A$ and, in the mean-zero case,
  $ parallel G parallel_2^2 = sum_(diameter eq.not A subset.eq S) parallel H_A parallel_2^2 lt.eq
    sum_(i in S) sum_(A in.rev i) parallel H_A parallel_2^2 = sum_(i in S) D_i \( H \)^2 . $
  Consequently $beta = sqrt(epsilon \/ \( 4 J \))$ works in (i).
  For (ii), use Theorem 4 again with error less than $beta \/ 2$, and write $G'$ for the resulting junta,
    on at most $K = J \( L \, beta \/ 2 \)$ coordinates. If $i$ is not one of these coordinates, then $Q_i G' = 0$, so
  $ D_i \( H \) = parallel Q_i \( H - G' \) parallel_2 lt.eq parallel H - G' parallel_2 < beta \/ 2 . $
  This proves the cardinality bound. ◻
]

The first part locates a coordinate when the function has substantial variance;
  the second limits how many coordinates can have a smaller but still fixed amount of dependence.
  Their simultaneous dimension independence is what will permit the number of test blocks to be chosen after both
  bounds are fixed.

== 3 The finite graph reduction <sec:construction>

We first construct a graph from an arbitrary Label Cover instance and fixed finite parameters.
  A satisfying labeling will give its three-coloring. The following sections analyze independent sets and
  determine which parameter choices make their density small.

Fix integers $r gt.eq s gt.eq 2$ and $m gt.eq 1$, an even positive integer $P$,
  a rational $lambda in \( 0 \, 1 \)$, and a rational probability distribution $mu$ on $binom(\[ r \], s)$.
  Set $D = m P$. The coefficient values and their probabilities are

#[#set math.equation(numbering: n => "(1)")
 $ cal(T)_m = { 0 \, 1 \/ m \, dots.h \, 1 } \, wide p_k = Pr \( t = k \/ m \) =
   frac(lambda^k, sum_(ell = 0)^m lambda^ell) quad \( 0 lt.eq k lt.eq m \) . $ <eq:coefficient-law>]

These finite data are inputs to the construction. Section 7 will choose them as constants depending only on the
  target density $delta$, before choosing the Label Cover soundness and alphabets.
  The finite probability experiment below specifies a deterministic list of vertices by expanding each rational
  probability into a multiplicity.

Choose a fixed integer $q > 1 \/ delta$. Before invoking Label Cover, reindex the occurring variables densely,
  preserving repeated occurrences of each variable. Remove tautological clauses and duplicate literals.
  A formula with no clauses maps directly to a one-vertex graph;
  a formula containing an empty clause maps directly to $K_q$.
  Pad a remaining short clause to width three by including all sign choices for fresh filler variables.
  This preserves satisfiability at constant overhead. In the remainder,
  the formula has only nonempty clauses and has passed through this preprocessing.

=== 3.1 Tuples, grids, and zero-length links <tuples-grids-and-zero-length-links>

Let $cal(C)$ be any Label Cover instance, with unused questions removed.
  In layer $i in \[ r \]$, take all question tuples

$ upright(bold(q)) = \( v_1 \, dots.h \, v_(i - 1) \, u_i \, dots.h \, u_(r - 1) \) in V^(i - 1) times U^(r - i) . $

The answer set of such a tuple is

$ M_i = Sigma_R^(thin i - 1) times Sigma_L^(thin r - i) . $

Layered products of questions with projection constraints also occur in the multilayered PCP construction of
  #cite(label("DinurGuruswamiKhotRegev2005")). Here each position is a separate coordinate even if question names
  repeat. Different tuples in a layer use separate copies of this same answer set.

Between adjacent layers $i$ and $i + 1$, impose a map whenever the tuples agree outside position $i$ and their
  questions at position $i$ are the endpoints of a test occurrence $c$.
  The map on answer sets applies $pi_c$ in position $i$ and the identity in every other position.
  Impose it separately for every occurrence.

Write $Gamma = \( D^(- 1) bb(Z) \) \/ bb(Z)$. At each question tuple place a separate copy of $Gamma^(M_i)$,
  and let $cal(X)$ be their disjoint union. Make a finite undirected weighted link graph on $cal(X)$:

- Within each copy, link any two points with length their sup circle distance.
- For every imposed map $pi : M_i arrow.r M_(i + 1)$, link each target point $x in
  Gamma^(M_(i + 1))$ to its source pullback $x compose pi$ with length zero.

Let $"dist"$ be the resulting shortest-path extended pseudometric, with distance infinity between components.
  Thus distinct points may have distance zero.

Let $T$ add $1 \/ 2$ to every phase coordinate, within each copy.
  Since $D$ is even, $T$ permutes $cal(X)$ and satisfies $T^2 = "id"$.
  It preserves all link lengths and therefore is an isometry of $"dist"$.

If some $x in cal(X)$ satisfies

#[#set math.equation(numbering: n => "(2)")
 $ "dist" \( x \, T x \) lt.eq 1 \/ 8 \, $ <eq:clique-test>]

output $K_q$ and stop. This branch already has independent-set density $1 \/ q < delta$.
  We will show that it never occurs in completeness.

=== 3.2 Vertices and edges <vertices-and-edges>

If (2) fails for every point, consider the following finite experiment.

+ Sample $r - 1$ independent uniform occurrences $c_1 \, dots.h \, c_(r - 1)$,
  with questions $\( u_h \, v_h \)$ at position $h$. They determine a chain of tuples
  $ upright(bold(q))_i = \( v_1 \, dots.h \, v_(i - 1) \, u_i \, dots.h \, u_(r - 1) \) \, wide i in \[ r \] . $
  Write $pi_(i j) : M_i arrow.r M_j$ for the corresponding composite answer maps.
    They apply the test projections in positions $i \, dots.h \, j - 1$ and leave the other positions unchanged;
    in particular they are composition-consistent.
+ Independently choose $B tilde.op mu$. For every $j in B$, independently choose $t_j$ from (1),
  and choose independent rotation entries
  $ hat(theta)_(j \, ell) med upright("uniform in ") med { 0 \, 1 \/ P \, dots.h \, \( P - 1 \) \/ P } \, wide
    ell in M_j . $
+ With $b = min B$, give the outcome the location
  #[#set math.equation(numbering: n => "(3)")
   $ x = (sum_(j in B) t_j hat(theta)_(j \, pi_(b j) \( kappa \)) med \( mod med 1 \))_(kappa in M_b) in
     Gamma^(M_b) $ <eq:location>]
  in the copy at tuple $upright(bold(q))_b$.

Take distinct output vertices for these elementary outcomes with integer multiplicities that make the experiment
  their exact uniform law. The existence and size of these multiplicities are verified below.
  Different vertices may have the same location. For distinct vertices with locations $x \, y$,
  put an edge precisely when

#[#set math.equation(numbering: n => "(4)")
 $ "dist" \( x \, T y \) lt.eq 1 \/ 8 . $ <eq:edge>]

This is symmetric because $T$ is an involutive isometry: $"dist" \( x \, T y \) = "dist" \( T x \, y \) =
  "dist" \( y \, T x \)$.

#thm([Proposition 3.1.])[
  (Explicit deterministic encoding).  #emph[For fixed choices of the parameters and Label Cover alphabets,
    this rule constructs a nonempty finite simple unweighted graph in deterministic polynomial time and output
    size, measured in the size of the explicit Label Cover instance.
    Composing with Theorem 3 for any fixed $sigma$ gives polynomial time and output size in the binary encoding
    length of the original $3$-CNF formula.]
] <prop:encoding>

#proof[
  Let $N = \| cal(C) \| gt.eq 1$. All alphabets, layer counts, and grids are fixed constants.
    There are polynomially many question tuples, each with a constant-size grid.
    The imposed maps and links are therefore polynomially enumerable.
    Every finite link length is an integer multiple of $1 \/ D$.
    After multiplying lengths by $D$, exact integer shortest-path algorithms compute all distances,
    with infinity stored separately. Shortest paths have polynomial bit length,
    and comparison with $1 \/ 8$ is exact by multiplication by $8$. This also implements the clique test.
  There are exactly $N^(r - 1)$ equally likely occurrence chains.
    For each chain, the remaining outcome probabilities are fixed rational numbers.
    The number of rotation entries can vary with $B$ and its layers, but it ranges over fixed constants.
    Choose a common positive denominator $C_0$ for all these conditional probabilities.
    For a conditional outcome of probability $p$, emit $C_0 p$ distinct vertices,
    omitting zero-probability outcomes. Every chain then contributes exactly $C_0$ vertices.
    The total is $C_0 N^(r - 1)$, and uniform sampling of these vertices is exactly the stated experiment,
    followed by a uniform choice among the copies of the chosen outcome.
    Exhaustive enumeration uses no random bits. Evaluating (4) for every distinct pair remains polynomial and
    gives an explicit edge list with no loops or multiple edges.
  The Label Cover reduction is polynomial for the fixed $sigma$.
    The initial variable reindexing and clause preprocessing take polynomial time in the ordinary binary input
    length; the two trivial branches have constant-size outputs.
    Thus the construction covers every explicitly encoded $3$-CNF formula. ◻
]

#thm([Lemma 3.2.])[
  (All-vertex completeness).  #emph[If the Label Cover instance has value $1$,
    the clique branch does not occur and the constructed graph has a proper three-coloring.]
] <lem:completeness>

#proof[
  Fix a labeling satisfying every occurrence. At each question tuple, form the product of its assigned answers,
    an element of that tuple’s answer set. Evaluate a grid point at this product answer.
    This defines a map $phi : cal(X) arrow.r bb(T)$.
  Within a copy, evaluation is nonexpanding for the sup circle distance.
    Across each zero link the two evaluations agree because the labeling satisfies that test occurrence.
    Hence $phi$ is nonexpanding for every path, and thus for $"dist"$.
    Also $phi \( T x \) = phi \( x \) + 1 \/ 2$. Consequently $"dist" \( x \, T x \) gt.eq 1 \/ 2$ for every $x$,
    so the clique test fails.
  If output vertices at $x \, y$ are adjacent, then
  $ d_(bb(T)) #scale(x: 120%, y: 120%)[\(] phi \( x \) \, phi \( y \) + 1 \/ 2 #scale(x: 120%, y: 120%)[\)] lt.eq
    1 \/ 8 \, wide d_(bb(T)) #scale(x: 120%, y: 120%)[\(] phi \( x \) \,
    phi \( y \) #scale(x: 120%, y: 120%)[\)] gt.eq 3 \/ 8 > 1 \/ 3 . $
  Color each vertex according to which of the half-open intervals $\[ 0 \, 1 \/ 3 \)$, $\[ 1 \/ 3 \, 2 \/ 3 \)$,
    $\[ 2 \/ 3 \, 1 \)$ contains its phase. Two phases in the same interval have circle distance less than $1 \/
    3$, so this colors every vertex properly. All multiplicity copies receive the color of their location. ◻
]

Figure 1 shows how the two parts of the construction serve this coloring:
  projection links preserve the evaluated phase, whereas an output edge separates its endpoint phases by more than
  the length of a color interval.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.1), [#text(size: 9pt)[$x compose pi in Gamma^(M_i)$]])
  content((4, 1.1), [#text(size: 9pt)[$x in Gamma^(M_(i+1))$]])
  line((0.7215, 1.1), (3.217, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black)))
  content((2, 1.1), [#text(size: 9pt)[zero-length link]], anchor: "north", padding: 0.1176cm)
  content((0, -0.4), [#text(size: 9pt)[$x( pi ( kappa_i))$]])
  content((4, -0.4), [#text(size: 9pt)[$x( kappa_(i+1))$]])
  line((0, 0.8361), (0, -0.1166), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.35), [#text(size: 9pt)[evaluate]], anchor: "east", padding: 0.1176cm)
  line((4, 0.8361), (4, -0.1166), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4, 0.35), [#text(size: 9pt)[evaluate]], anchor: "west", padding: 0.1176cm)
  line((0.7358, -0.4), (3.391, -0.4), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, -0.4), [#text(size: 9pt)[$=$]], anchor: "south", padding: 0.1176cm)
  content((2, -1.1), [#text(size: 9pt)[$pi ( kappa_i)= kappa_(i+1)$]])
  arc((9.15, 0), start: 0deg, stop: 120deg, radius: 1.15, stroke: (paint: rgb("#0000a6"), thickness: 3.0pt, miter-limit: 10))
  arc((7.425, 0.9959), start: 120deg, stop: 240deg, radius: 1.15, stroke: (paint: rgb("#003a00"), thickness: 3.0pt, miter-limit: 10))
  arc((7.425, -0.9959), start: 240deg, stop: 360deg, radius: 1.15, stroke: (paint: rgb("#a60000"), thickness: 3.0pt, miter-limit: 10))
  line((8.996, 0.575), (7.004, -0.575), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  circle((8.996, 0.575), radius: 0.05292, fill: black, stroke: none)
  circle((7.004, -0.575), radius: 0.05292, fill: black, stroke: none)
  content((9.046, 0.6037), [#text(size: 9pt)[$phi (x)$]], anchor: "west", padding: 0.1176cm)
  content((6.954, -0.6038), [#text(size: 9pt)[$phi (x)+ frac(1, 2)$]], anchor: "north-east", padding: 0.1176cm)
  arc((6.689, 0.3512), start: 165deg, stop: 255deg, radius: 1.357, stroke: (thickness: 1.3pt, miter-limit: 10))
  content((9.424, 0.2001), [#text(size: 9pt)[$0$]])
  content((7.385, 1.066), [#text(size: 9pt)[$frac(1, 3)$]], anchor: "south-east", padding: 0.1176cm)
  content((7.385, -1.066), [#text(size: 9pt)[$frac(2, 3)$]], anchor: "north-east", padding: 0.1176cm)
  content((8, -2.127), [#text(size: 9pt)[$d_( bb(T) )( phi (x), phi (y)) gt.eq frac(3, 8)$#linebreak()for every output edge $"xy"$]])
})],
  caption: [Figure 1: The auxiliary geometry and the output coloring. Left: a satisfying product answer makes evaluation agree across a projection link. Here $kappa_i$ and $kappa_(i + 1)$ are the satisfying product answers at the two tuples. The answer map $pi : M_i arrow.r M_(i + 1)$ and its phase pullback go in opposite directions. Right: the three arcs represent the half-open color intervals. For the illustrated phase $phi \( x \)$, the black outer arc contains the possible phases $phi \( y \)$ of its neighbors, within $1 \/ 8$ of the antipodal phase. The weighted links on the left define the pseudometric; the output graph uses the separate half-shift edge rule. ],
) <fig:geometry>

== 4 From an independent set to bounded subchain lists <sec:lists>

Fix $sigma in \( 0 \, 1 \)$ and assume that the Label Cover value is at most $sigma$.
  The clique branch already has the required soundness, so suppose it does not occur.
  Fix a nonempty independent vertex set $cal(A)$ in the output graph.
  We first turn it into functions on the tuple tori, then approximate their restrictions to small subchains using
  bounded coordinate lists. Source soundness will show that lists belonging to separated subchains are usually
  disjoint. Throughout the analysis, set $L = 64$.

=== 4.1 Odd functions and compatibility <odd-functions-and-compatibility>

Let $A subset.eq cal(X)$ be the set of locations of vertices in $cal(A)$, with multiplicities removed. Then

#[#set math.equation(numbering: n => "(5)")
 $ "dist" \( A \, T A \) > 1 \/ 8 . $ <eq:independent-separation>]

For locations of distinct selected vertices this follows from the missing edge in (4).
  For a point compared with itself, it follows from exclusion of (2).
  Since the sets are finite, these pointwise strict inequalities give (5), including when distances are infinite.

On $cal(X)$ define

#[#set math.equation(numbering: n => "(6)")
 $ f \( x \) = #scale(x: 120%, y: 120%)[\(] 1 - 32 "dist" \( x \, A \) #scale(x: 120%, y: 120%)[\)]_(+) -
   #scale(x: 120%, y: 120%)[\(] 1 - 32 "dist" \( T x \, A \) #scale(x: 120%, y: 120%)[\)]_(+) \,
   wide \( u \)_(+) = max { u \, 0 } \, $ <eq:bumps>]

with each bump defined to be zero at infinite distance. This function takes values in $\[ - 1 \, 1 \]$,
  satisfies $f \( T x \) = - f \( x \)$, and equals $1$ on $A$. It is constant across every zero link.
  Within each grid copy it is $64$-Lipschitz for the sup circle metric:
  distance to $A$ is $1$-Lipschitz on a component meeting $A$,
  and its bump is identically zero on a component not meeting $A$.
  Also the shortest-path pseudometric never exceeds a within-copy link distance.

At each tuple $upright(bold(q))$, extend its grid function to the whole torus $bb(T)^(M_i)$.
  Using the real-valued Lipschitz extension formula of McShane #cite(label("McShane1934")), set

$ g_(upright(bold(q))) \( x \) = min_(y in Gamma^(M_i)) #scale(x: 120%, y: 120%)[\(] f \( y \) +
  L thin d_oo \( x \, y \) #scale(x: 120%, y: 120%)[\)] \, $

where $y$ ranges over that tuple’s copy and $d_oo$ is the sup circle metric.
  This is $L$-Lipschitz and equals $f$ on the grid. Clip its values to $\[ - 1 \, 1 \]$,
  obtaining $tilde(g)_(upright(bold(q)))$, and put

$ F_(upright(bold(q))) \( x \) =
  frac(tilde(g)_(upright(bold(q))) \( x \) - tilde(g)_(upright(bold(q))) \( T x \), 2) . $

The resulting function is still an extension of the odd grid data, is $L$-Lipschitz,
  is valued in $\[ - 1 \, 1 \]$, and is odd under $T$. Fix this entire family of functions before sampling any
  test chain. Along a chain write $F_i = F_(upright(bold(q))_i)$.

For every chain and every $i lt.eq j$, these extensions satisfy

#[#set math.equation(numbering: n => "(7)")
 $ \| F_j \( x \) - F_i \( x compose pi_(i j) \) \| lt.eq 2 L \/ D \, wide x in bb(T)^(M_j) . $ <eq:compatibility>]

Indeed, round each coordinate of $x$ once to a grid point $y$ within $1 \/ D$.
  Pullback does not enlarge this error. The grid points $y$ and $y compose
  pi_(i j)$ have equal $f$ values by the chain of zero links,
  so the two extension errors total at most $2 L \/ D$. Intermediate layers contribute no additional approximation
  error.

=== 4.2 Bounded lists for a subchain <bounded-lists-for-a-subchain>

The functions $F_i$ now supply the analytic data we need along any chain.
  For each small set of layers, we will choose a bounded list of answer coordinates that approximates every
  allowed coefficient choice. The bound must be independent of the Label Cover alphabets,
  and the choice must depend only on the data of that subchain.

Fix an approximation tolerance $gamma > 0$. For $diameter eq.not I subset.eq \[ r \]$ with $\| I \| lt.eq s$,
  put $b_I = min I$. Given $t in cal(T)_m^I$, define

#[#set math.equation(numbering: n => "(8)")
 $ h_(I \, t) \( theta \) =
   F_(b_I) ((sum_(j in I) t_j theta_(j \, pi_(b_I j) \( kappa \)) med \( mod med 1 \))_(kappa in M_(b_I))) \, wide
   theta in product_(j in I) \[ 0 \, 1 \]^(M_j) . $ <eq:subchain-functions>]

The entries of $theta$ are independent uniform real variables.
  This evaluates $F_(b_I)$ at the continuous version of the sampled location in (3), using only the layers of $I$.
  The phase map has Lipschitz constant at most $\| I \| lt.eq s$:
  coordinate duplication by a projection cannot enlarge a sup distance.
  Thus $h_(I \, t)$ is $s L$-Lipschitz, independently of the label-set sizes and projection fibers.

#thm([Lemma 4.1.])[
  (Bounded subchain lists).  #emph[For every fixed occurrence chain and every nonempty $I
    subset.eq \[ r \]$ with $\| I \| lt.eq s$, there are sets $S_I^j subset.eq M_j$, $j in I$, with
#[#set math.equation(numbering: n => "(9)")
 $ sum_(j in I) \| S_I^j \| lt.eq d \, wide d := max { 1 \, J \( s L \, gamma \) \( m + 1 \)^s } \, $ <eq:list-size>]

 such that, for every $t in cal(T)_m^I$, a junta $g_(I \, t)$ using only scalar coordinates $\( j \, ell \)$ with
   $ell in S_I^j$ satisfies
#[#set math.equation(numbering: n => "(10)")
 $ parallel h_(I \, t) - g_(I \, t) parallel_2 < gamma . $ <eq:subchain-junta>]

 The lists can be chosen as functions only of the subchain’s label sets, internal projection maps,
   and functions $F_j$, $j in I$. Identical subchain data receive identical choices.]
] <lem:subchain-lists>

#proof[
  For each of the at most $\( m + 1 \)^s$ coefficient choices, apply Theorem 4 to $h_(I \, t)$ with error $gamma$.
    This uses at most $J \( s L \, gamma \)$ scalar coordinates.
    For each block $j$, take the union of its selected coordinates over all coefficient choices to obtain $S_I^j$
    and (9).
  To make the choice depend only on the stated subchain data,
    order the scalar coordinates and choose the first subset of size at most $J \( s L \, gamma \)$ whose
    coordinate conditional expectation has error less than $gamma$. The theorem guarantees such a subset.
    These choices enter only the soundness proof and are never computed by the reduction.
    In particular, a list includes approximating coordinates for every coefficient vector before any coefficients
    are sampled. ◻
]

=== 4.3 Why the lists can be decoded locally <why-the-lists-can-be-decoded-locally>

Use the fixed rule of Lemma 8 along a uniform occurrence chain.
  Using $M_r = Sigma_R^(r - 1)$ as a common label universe, set

#[#set math.equation(numbering: n => "(11)")
 $ A_I = union.big_(j in I) pi_(j r) \( S_I^j \) \, wide diameter eq.not I subset.eq \[ r \] \, quad \| I \| lt.eq
   s . $ <eq:terminal-lists>]

By (9), each $A_I$ has size at most $d$. We first control intersections between lists on separated sets of layers.

#thm([Lemma 4.2.])[
  (Separated lists).  #emph[For every fixed $I \, J$ with $1 lt.eq \| I \| \, \| J \| lt.eq s$ and $max I < min J$,
$ Pr_(upright("chain")) \( A_I ∩ A_J eq.not diameter \) lt.eq d^2 sigma . $

]
] <lem:separated-lists>

#proof[
  Put $h = max I < min J$ and condition on every occurrence except $c_h$.
    The remaining occurrence is still uniform in the original instance.
    At each layer in $I$, position $h$ of the tuple is the left question $u_h$.
    Every internal projection between layers of $I$ uses only tests with index less than $h$.
    Thus all subchain data for $I$, including its already fixed tuple functions,
    depend only on $u_h$ and the conditioned background, not on the opposite question or on the projection of
    $c_h$. Likewise, all data for $J$ depend only on $v_h$ and the background. Figure 2 illustrates this separation.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$(u_1,u_2,u_3)$]])
  content((3.8, 0), [#text(size: 9pt)[$(v_1,u_2,u_3)$]])
  content((7.6, 0), [#text(size: 9pt)[$(v_1,v_2,u_3)$]])
  content((11.4, 0), [#text(size: 9pt)[$(v_1,v_2,v_3)$]])
  line((0.8469, 0), (2.953, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.9, 0), [#text(size: 9pt)[$c_1$]], anchor: "south", padding: 0.1176cm)
  line((4.647, 0), (6.753, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.7, 0), [#text(size: 9pt)[$c_2$]], anchor: "south", padding: 0.1176cm)
  line((8.447, 0), (10.55, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((9.5, 0), [#text(size: 9pt)[$c_3$]], anchor: "south", padding: 0.1176cm)
  line((5.7, -0.9), (5.7, 1.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((1.9, -0.65), [#text(size: 9pt)[Position $2$: own question $u_2$]])
  content((9.5, -0.65), [#text(size: 9pt)[Position $2$: own question $v_2$]])
  content((1.9, 0.9), [#text(size: 8pt)[left subchain]])
  content((9.5, 0.9), [#text(size: 8pt)[right subchain]])
})],
    caption: [Figure 2: Four layers with the separating test $c_2$ left unconditioned. Once $c_1 \, c_3$ are fixed, the left and right subchain data depend only on the respective own question of $c_2$. Answer maps act in the position indicated by each test. ],
  ) <fig:locality>
  Form a list of candidate left answers by taking position $h$ of every label in every $S_I^j$ for $j in I$.
    This gives at most $d$ elements of $Sigma_L$, as a function of $u_h$ and fixed background.
    The analogous list for $J$ gives at most $d$ elements of $Sigma_R$ as a function of $v_h$.
    Choose deterministic orderings and pad each list to length $d$ with an arbitrary answer,
    also when the list is empty.
  If $A_I$ and $A_J$ intersect, some left and right selected labels have the same image at layer $r$.
    Equality in position $h$ says that $pi_(c_h)$ sends the associated left candidate to the right candidate:
    on the left, exactly the test $c_h$ acts in that position,
    and on the right the position is already a right-answer coordinate.
    For each pair of list positions, selecting those answers for each own question is a deterministic strategy for
    the original Label Cover instance. Its success probability over the uniform $c_h$ is at most $sigma$.
    A union bound over the $d^2$ position pairs proves the conditional bound,
    and averaging over the background proves the lemma. ◻
]

The fixed functions may depend on the entire instance and on $cal(A)$. This causes no loss of locality:
  they are fixed before the sampling experiment, so evaluating the family at a tuple reveals only that tuple.
  In particular, if two occurrences have the same own question but different opposite questions or projections,
  the list rule at that side uses identical data.

We have obtained bounded lists in a common answer set, and source soundness controls intersections of lists on
  separated layer sets. The next section turns this separation into a stronger property:
  each listed answer can be assigned to one layer common to all of its occurrences inside the sampled set $B$.

== 5 Aligning the lists on a sampled set of layers <sec:alignment>

The terminal lists $A_I subset.eq M_r$ all have size at most $d$.
  For the analytic argument, we need more than disjointness on separated sets:
  each label should have a layer common to every set on whose list it appears.
  These properties differ even for one label. A label that occurs on the three sets ${ 1 \, 2 }$, ${ 1 \, 3 }$,
  and ${ 2 \, 3 }$ has no common index, although none of these sets is separated from another.

The following abstract lemma supplies the common-index property on a sampled $s$-element set.
  Its essential quantifier is that the sampling law is chosen before the lists,
  with no dependence on the label universe. This is what allows the same graph construction to handle every
  independent set.

#thm([Lemma 5.1.])[
  (Distributional alignment).  #emph[For every pair of integers $s \, d gt.eq 1$ and every real $eta > 0$,
    there exist an integer $r gt.eq s$ and a rational probability distribution $mu$ on $binom(\[ r \], s)$ with
    the following property.Let $M_(*)$ be any set, and let $A_I subset.eq M_(*)$, $\| A_I \| lt.eq d$,
    be specified for every nonempty $I subset.eq \[ r \]$ with $\| I \| lt.eq s$. Assume that
#[#set math.equation(numbering: n => "(12)")
 $ A_I ∩ A_J = diameter wide upright("whenever ") max I < min J . $ <align:separation>]

 Then, with probability at least $1 - eta$ over $B tilde.op mu$, there exists a map $a : M_(*) arrow.r B$ such that
#[#set math.equation(numbering: n => "(13)")
 $ a \( A_I \) subset.eq I wide upright("for every nonempty ") I subset.eq B . $ <align:conclusion>]

 The map $a$ may depend on the list family and on $B$.]
] <lem:alignment>

The complete proof is in Section 8. It replaces labels by their finite equality patterns,
  applies minimax and Ramsey homogenization, and obtains an order-invariant random pattern.
  In that limit, separated disjointness forces every label to have an index common to all of its occurrences.
  We now apply the lemma to the lists already extracted from an independent set.

Fix $epsilon > 0$, and suppose that the layer count $r$ and law $mu$ in the graph construction are supplied by
  Lemma 10 for $s \, d \, eta = epsilon$. Section 7 will choose these data after the alphabet-independent bound
  $d$ is fixed and before choosing the Label Cover instance.

#prodef([Definition 5.2.])[
  A pair consisting of a chain and a set $B in binom(\[ r \], s)$ is #emph[aligned] if there is a map $a :
    M_r arrow.r B$ such that $a \( A_I \) subset.eq I$ for every nonempty $I subset.eq B$.
]

#thm([Lemma 5.3.])[
  (Aligned pairs occur with high probability).  #emph[Under these choices,
    for independent uniform chain sampling and $B tilde.op mu$,
    the probability that the pair is not aligned is at most $4^r d^2 sigma + epsilon$.]
] <lem:good-pairs>

#proof[
  There are at most $4^r$ ordered pairs of subsets of $\[ r \]$.
    By Lemma 9 and a union bound, the probability that some separated pair of terminal lists intersects is at most
    $4^r d^2 sigma$. For each chain with no such intersection,
    Lemma 10 gives an alignment except for a set of $B$ of $mu$-probability at most $epsilon$.
    Adding the two failure probabilities proves the bound. ◻
]

The lists were selected before $B$, and include the juntas for every coefficient choice.
  An alignment for a fixed aligned pair can therefore be chosen before the actual coefficient and rotation draws.
  The next section uses this fixed alignment to control dependence on one auxiliary phase for each layer in $B$.

== 6 The coefficient test and soundness <sec:coefficient>

The remaining task is to bound the density of an independent set after fixing an aligned pair of a chain and a
  selected set of layers. We add one auxiliary phase for each selected layer.
  Alignment makes the influence of a zero-coefficient layer small,
  whereas the geometric coefficient distribution makes large influences at positive coefficients unlikely.

Keep the tolerance $epsilon > 0$ of Section 5, and take $beta > 0$ and $K gt.eq 1$ from Lemma 5 with $L =
  64$ and this $epsilon$. For the graph parameters of Section 3 and the list-approximation tolerance $gamma$ of
  Section 4, assume

#[#set math.equation(numbering: n => "(14)")
 $ L \/ m < beta \/ 2 \, wide lambda K < epsilon \, wide \( 1 - p_m \)^s < epsilon \,\
frac(s \( 2 gamma \)^2, beta^2) < epsilon \, wide frac(2 L, D) < gamma \, wide
  frac(2 L s, P) < epsilon . $ <eq:parameter-bounds>]

Section 7 will choose constants satisfying these inequalities.
  A coefficient equal to $1$ is called a #emph[full coefficient].
  Although its individual probability $p_m$ may be small, the third inequality makes at least one of the $s$
  coefficients full with probability greater than $1 - epsilon$.

#thm([Proposition 6.1.])[
  #emph[Assume (14). Suppose that the construction does not take the clique branch,
    and let $cal(A)$ be a nonempty independent set of its output graph.
    Form the functions and lists associated with $cal(A)$ as above.
    For every chain and $s$-element set $B$ admitting a map
$ a : M_r arrow.r B \, wide a \( A_I \) subset.eq I quad upright("for every nonempty ") I subset.eq B \, $

 the conditional probability that the sampled output vertex belongs to $cal(A)$ is at most $6 epsilon$.]
] <prop:aligned-bound>

#proof[
  Fix such a chain, $B$, and a map $a$, before drawing any coefficients or rotations. Write $b = min B$.
    Since $f = 1$ at every location of $cal(A)$, it suffices to bound the expected square of $F_b$ at the sampled
    grid location by $6 epsilon$. We establish this through a continuous rotation experiment with auxiliary
    phases. Initially replace the discrete rotations by independent uniform real variables
  $ theta_(j \, ell) in \[ 0 \, 1 \) \, wide j in B \, quad ell in M_j . $
  All these variables are independent of the coefficient vector $t in cal(T)_m^B$.
    Introduce additional independent Haar-uniform variables $z = \( z_i \)_(i in B) in bb(T)^B$, and define
  #[#set math.equation(numbering: n => "(15)")
   $ H \( t \, theta \; z \) =
     F_b
     ((z_(a \( pi_(b r) \( kappa \) \)) + sum_(j in B) t_j theta_(j \, pi_(b j) \( kappa \)) med \( mod med
     1 \))_(kappa in M_b)) . $ <coeff:H>]
  For fixed $t \, theta$, the map from $z$ to the phase vector in (15) is nonexpanding for the sup circle metrics:
    each output coordinate uses just one coordinate of $z$. Consequently $H$ is $L$-Lipschitz as a function of
    $z$, independently of $s$ and of all label cardinalities. It is bounded by one in absolute value.
    A simultaneous half-shift of the $z$ coordinates half-shifts every input coordinate of $F_b$, so oddness gives
  #[#set math.equation(numbering: n => "(16)")
   $ bb(E)_z H \( t \, theta \; z \) = 0 . $ <coeff:mean-zero>]
  Let $E_i$ average only $z_i$ and let $Q_i = "id" - E_i$, an orthogonal projection of norm one. We use the notation
  $ D_i \( t \, theta \) = parallel Q_i H \( t \, theta \; dot.op \) parallel_(L^2 \( bb(T)^B \)) \, wide
    X \( t \, theta \) = bb(E)_z H \( t \, theta \; z \)^2 . $
  By Lemma 5 and (16),
  #[#set math.equation(numbering: n => "(17)")
   $ X \( t \, theta \) > epsilon & quad arrow.r.double quad max_(i in B) D_i \( t \, theta \) gt.eq beta \,\
\# { i in B : D_i \( t \, theta \) gt.eq beta \/ 2 } & lt.eq K quad upright("for every ") t \,
  theta . $ <coeff:variance-detection>]
  ===== 6.1 Zero coefficients. <zero-coefficients.>
  Let
  $ cal(F) = { t : upright("some ") t_j = 1 } $
  be the event that a full coefficient is present. Fix $t in cal(F)$ and an index $i in B$ with $t_i = 0$.
    Choose $j in B$ with $t_j = 1$; necessarily $j eq.not i$. Put $I = B \\ { i }$ and $c = min I$.
    The set $I$ is nonempty. In the subchain function $h_(I \, t \|_I)$ from (8),
    leave all rotation blocks unchanged except block $j$, where we substitute
  #[#set math.equation(numbering: n => "(18)")
   $ theta'_(j \, ell) = theta_(j \, ell) + z_(a \( pi_(j r) \( ell \) \)) med \( mod med 1 \) \, wide
     ell in M_j . $ <coeff:shift>]
  Here and below a phase used as a real rotation is represented in $\[ 0 \, 1 \)$.
    For each fixed $z$, this substitution preserves the product uniform distribution of the rotation inputs.
    Even when several coordinates receive the same shift, each coordinate undergoes a fixed translation,
    so their conditional joint law remains the same product law.
  To compare the two function evaluations, let $y in bb(T)^(M_c)$ be the phase vector in
    $h_(I \, t \|_I) \( theta' \)$. For every $kappa in M_b$, composition of the projections gives
  #[#set math.equation(numbering: n => "(19)")
   $ y_(pi_(b c) \( kappa \)) = z_(a \( pi_(b r) \( kappa \) \)) +
     sum_(k in B) t_k theta_(k \, pi_(b k) \( kappa \)) med \( mod med 1 \) . $ <coeff:pullback-identity>]
  Indeed, the omitted $i$ term is zero, and the changed $j$ term has coefficient exactly one.
    This last fact is essential: reducing the shifted rotation modulo one before multiplying would not in general
    be valid at a fractional coefficient. Thus $H \( t \, theta \; z \) = F_b \( y compose pi_(b c) \)$.
    If $c = b$ the two evaluations are identical; if deleting $i$ changes the minimum layer,
    the compatibility bound (7) still gives
  #[#set math.equation(numbering: n => "(20)")
   $ \| H \( t \, theta \; z \) - h_(I \, t \|_I) \( theta' \) \| lt.eq 2 L \/ D < gamma . $ <coeff:deletion-error>]
  Let $g_(I \, t \|_I)$ be the fixed junta approximating $h_(I \, t \|_I)$ in $L^2$ norm to error less than
    $gamma$. Its selected coordinates in block $k$ belong to $S_I^k$.
    Product-law preservation for every fixed $z$ implies
  $ parallel h_(I \, t \|_I) \( theta' \) - g_(I \, t \|_I) \( theta' \) parallel_(L^2 \( theta \, z \)) < gamma . $
  Moreover, the composed function $g_(I \, t \|_I) \( theta' \)$ is pointwise independent of $z_i$.
    Only the modified block $j$ introduces any $z$ dependence.
    Every selected coordinate $ell in S_I^j$ satisfies $pi_(j r) \( ell \) in A_I$ by (11),
    and alignment therefore gives $a \( pi_(j r) \( ell \) \) in I$.
    Combining this observation with (20) and applying the contraction $Q_i$ on the full product space yields
  #[#set math.equation(numbering: n => "(21)")
   $ bb(E)_theta D_i \( t \, theta \)^2 = parallel Q_i H parallel_(L^2 \( theta \, z \))^2 lt.eq parallel H -
     g_(I \, t \|_I) \( theta' \) parallel_(L^2 \( theta \, z \))^2 < \( 2 gamma \)^2 . $ <coeff:zero-bound>]
  This estimate holds for every fixed $t in cal(F)$ with $t_i = 0$.
    Markov’s inequality, followed by a union bound over the $s$ indices, therefore gives
  #[#set math.equation(numbering: n => "(22)")
   $ Pr_(t \, theta) #scale(x: 120%, y: 120%)[\(] t in cal(F) \, med exists i in B : med t_i = 0 \, med
     D_i \( t \, theta \) gt.eq beta #scale(x: 120%, y: 120%)[\)] lt.eq
     frac(s \( 2 gamma \)^2, beta^2) < epsilon . $ <coeff:zero-probability>]
  ===== 6.2 Positive coefficients. <positive-coefficients.>
  We next bound large influences at positive coefficient levels.
    This step does not assume that a full coefficient is present.
    Fix $i$, all rotations $theta$, and all coefficients other than $t_i$.
    For $0 lt.eq k lt.eq m$, let $H_k$ denote (15) with $t_i = k \/ m$, and put $d_k =
    parallel Q_i H_k parallel_2$. Changing one coefficient by $1 \/
    m$ changes each phase coordinate by circle distance at most $1 \/ m$,
    since the rotations lie in $\[ 0 \, 1 \)$. The norm-one property of $Q_i$ gives
  #[#set math.equation(numbering: n => "(23)")
   $ \| d_k - d_(k - 1) \| lt.eq parallel Q_i \( H_k - H_(k - 1) \) parallel_2 lt.eq
     L \/ m < beta \/ 2 wide \( 1 lt.eq k lt.eq m \) . $ <coeff:one-step>]
  Write $p_k = lambda^k \/ sum_(h = 0)^m lambda^h$ for the probability of coefficient level $k \/ m$.
    Since $p_k = lambda p_(k - 1)$, (23) implies, for the fixed background data,
  $ sum_(k = 1)^m p_k upright(bold(1))_({ d_k gt.eq beta }) & lt.eq
    lambda sum_(h = 0)^(m - 1) p_h upright(bold(1))_({ d_h gt.eq beta \/ 2 })\
 & lt.eq lambda sum_(h = 0)^m p_h upright(bold(1))_({ d_h gt.eq beta \/ 2 }) . $
  Integrating over the fixed data and summing over $i in B$, we obtain from (17)
  #[#set math.equation(numbering: n => "(24)")
   $ Pr_(t \, theta) #scale(x: 120%, y: 120%)[\(] exists i in B : med t_i > 0 \, med D_i \( t \, theta \) gt.eq
     beta #scale(x: 120%, y: 120%)[\)] & lt.eq lambda sum_(i in B)
     Pr_(t \, theta) \( D_i \( t \, theta \) gt.eq beta \/ 2 \)\
 & lt.eq lambda K < epsilon . $ <coeff:positive-probability>]
  Decreasing a level can destroy the only full coefficient. This causes no restriction here:
    (17) holds for every coefficient vector, including all images of the one-level decrease.
  ===== 6.3 From influences to mean square. <from-influences-to-mean-square.>
  The parameter choices in (14) give $Pr \( t in.not cal(F) \) < epsilon$.
    By (17), the event $X \( t \, theta \) > epsilon$ is contained in the union of this event and the two events
    bounded in (22) and (24). Consequently
  $ Pr_(t \, theta) \( X \( t \, theta \) > epsilon \) < 3 epsilon . $
  Since $0 lt.eq X lt.eq 1$, it follows that
  #[#set math.equation(numbering: n => "(25)")
   $ bb(E)_(t \, theta \, z) H \( t \, theta \; z \)^2 = bb(E)_(t \, theta) X \( t \, theta \) lt.eq epsilon +
     Pr \( X > epsilon \) < 4 epsilon . $ <coeff:mean-square>]
  We now remove the auxiliary phases and return to the actual grid sampling.
    This is the only remaining passage from the analytic test to the conditional vertex density.
  ===== 6.4 Removing the phases and discretizing. <removing-the-phases-and-discretizing.>
  Define the continuous location
  $ x \( t \, theta \) = (sum_(j in B) t_j theta_(j \, pi_(b j) \( kappa \)) med \( mod med 1 \))_(kappa in M_b) . $
  For every fixed $t in cal(F)$, choose an index $j$ with $t_j = 1$.
    Applying the translation (18) to this block absorbs every $z$ term in (15).
    For each fixed $z$ the translated rotation array again has exactly its original product law. Hence
  #[#set math.equation(numbering: n => "(26)")
   $ bb(E)_(theta \, z) H \( t \, theta \; z \)^2 = bb(E)_theta F_b \( x \( t \, theta \) \)^2
     wide \( t in cal(F) \) . $ <coeff:absorption>]
  The choice of the full block may depend on $t$, because this equality is asserted separately for every fixed
    coefficient vector. In particular, (25) implies
  #[#set math.equation(numbering: n => "(27)")
   $ bb(E)_(t \, theta) #h(-0.16667em) [upright(bold(1))_(cal(F)) \( t \) F_b \( x \( t \, theta \) \)^2] < 4
     epsilon . $ <coeff:continuous-bound>]
  Couple the discrete rotations to the continuous ones by
  $ hat(theta)_(j \, ell) = frac(floor.l P theta_(j \, ell) floor.r, P) . $
  They have the required independent uniform grid law. Each input coordinate changes by less than $1 \/ P$,
    so the sup circle distance between $x \( t \, theta \)$ and $x \( t \, hat(theta) \)$ is at most $s \/ P$.
    The Lipschitz bound and the range $\[ - 1 \, 1 \]$ therefore imply
  #[#set math.equation(numbering: n => "(28)")
   $ lr(|F_b \( x \( t \, theta \) \)^2 - F_b \( x \( t \, hat(theta) \) \)^2|) lt.eq
     2 L s \/ P < epsilon . $ <coeff:grid-error>]
  Combining (27), (28), and $Pr \( t in.not cal(F) \) < epsilon$ gives
  #[#set math.equation(numbering: n => "(29)")
   $ bb(E)_(t \, hat(theta)) F_b \( x \( t \, hat(theta) \) \)^2 < 4 epsilon + epsilon + epsilon =
     6 epsilon . $ <coeff:discrete-bound>]
  The discrete location belongs to the grid of denominator $D = m P$,
    so $F_b$ equals the original grid function $f$ there. That function equals one at every location of a vertex
    of $cal(A)$. Thus the indicator that the sampled vertex belongs to $cal(A)$ is pointwise bounded by
    $F_b \( x \( t \, hat(theta) \) \)^2$. This remains true when several distinct vertices have the same
    location. Inequality (29) proves the proposition. ◻
]

== 7 Choosing the constants and completing the reduction <sec:parameters>

The construction and its analysis have identified all the required properties of the fixed parameters.
  We now choose them in an order that makes the graph reduction possible.
  The key point is that the list bound $d$ is fixed before the layer count and the source soundness,
  so it cannot depend on the Label Cover alphabets.

Fix a rational $0 < delta < 1 \/ 3$ and a rational $0 < epsilon < delta \/ 8$.
  Set $L = 64$ and take $beta \, K$ from Lemma 5 for $L \, epsilon$.
  Choose a positive integer $m$ with $L \/ m < beta \/ 2$, then a rational $0 < lambda < 1$ with $lambda K <
  epsilon$. The coefficient law (1) is now fixed. Since its probability $p_m$ of a full coefficient is positive,
  choose an integer $s gt.eq 2$ with $\( 1 - p_m \)^s < epsilon$.

Next choose $gamma > 0$ sufficiently small that $s \( 2 gamma \)^2 \/ beta^2 < epsilon$,
  and then choose an even positive integer $P$ sufficiently large that, with $D = m P$,

$ frac(2 L, D) < gamma \, wide frac(2 L s, P) < epsilon . $

This establishes every inequality in (14). Lemma 8 gives the alphabet-independent bound

$ d = max { 1 \, J \( s L \, gamma \) \( m + 1 \)^s } . $

Apply Lemma 10 to $s \, d \, eta = epsilon$, obtaining $r gt.eq s$ and a rational law $mu$ on $binom(\[ r \], s)$.
  Finally choose a rational $sigma in \( 0 \, 1 \)$ with

#[#set math.equation(numbering: n => "(30)")
 $ 4^r d^2 sigma < epsilon . $ <eq:source-soundness>]

Only now invoke Theorem 3 for this fixed $sigma$. Its constant alphabets may be large,
  but no preceding choice depends on their sizes or on the input formula.

All objects used to run the reduction are finite integers or finite rational probability tables.
  For each fixed $delta$, choose them once and incorporate their finite descriptions into one algorithm.
  Neither a uniform runtime as $delta arrow.r 0$ nor an algorithm computing all constants from $delta$ is asserted
  or needed. There is no input-dependent advice. The real tolerances, continuous functions, junta approximants,
  and alignments enter only the analysis.

#proof[
  It suffices to treat rational $0 < delta < 1 \/ 3$: for a fixed real threshold,
    choose a fixed rational $0 < delta_0 < delta$ and use the reduction for $delta_0$.
    Fix rational $delta$ and choose the constants as above, with $8 epsilon < delta$.
    Use the preprocessing and graph construction of Section 3.
  The two preprocessing branches already have the required promises.
    A formula with no remaining clauses is satisfiable and produces a one-vertex graph.
    An empty clause certifies unsatisfiability and produces $K_q$,
    where $q > 1 \/ delta$ and hence $1 \/ q < delta$. For every other input,
    Proposition 6 gives a deterministic polynomial-time construction of a nonempty finite simple unweighted graph.
    If the formula is satisfiable, its Label Cover instance has value one,
    and Lemma 7 supplies a proper three-coloring of every output vertex.
  Suppose instead that the formula is unsatisfiable, so its Label Cover value is at most $sigma$.
    If the metric clique branch occurs, the output again has independent-set density $1 \/ q < delta$.
    Otherwise, let $cal(A)$ be any nonempty independent set of the output graph.
    Lemma 12 and (30) bound the probability of an unaligned chain–$B$ pair by $2 epsilon$.
    At every aligned pair, Proposition 13 bounds the conditional probability of sampling $cal(A)$ by $6 epsilon$;
    at other pairs it is at most one. The multiplicity expansion in Proposition 6 makes this sampling law exactly
    the uniform law on output vertices. Hence
  $ frac(\| cal(A) \|, \| V \( G \) \|) lt.eq 6 epsilon + 2 epsilon = 8 epsilon < delta . $
  The empty independent set satisfies the same strict bound because the graph is nonempty.
    Maximizing over all independent sets proves the required soundness promise. ◻
]

== 8 Proof of distributional alignment <sec:alignment-proof>

We prove Lemma 10, the combinatorial input used to choose the sampling law on layer sets.
  The argument depends only on the list bound and the order of the indices;
  it has no graph-theoretic or analytic hypotheses.

#proof[
  Call $B$ #emph[bad] if no map in (13) exists. For each label $x$ that appears on a list indexed inside $B$, consider
  $ ⋂ { I : diameter eq.not I subset.eq B \, med x in A_I } . $
  The set $B$ is bad exactly when one of these intersections is empty.
    Indeed, a nonempty intersection permits a choice of $a \( x \)$ independently for each appearing label;
    labels absent from all these lists may be sent to any element of the nonempty set $B$.
  We first prove that for every $xi > 0$, some $r gt.eq s$ admits a real probability distribution on
    $binom(\[ r \], s)$ under which every list family satisfying (12) has bad-set probability at most $xi$.
    The proof has three steps. Finite minimax turns a failure of this assertion into random list patterns making
    every $s$-set bad with positive probability. Ramsey homogenization produces an order-invariant limiting
    pattern on the rationals. Finally, an invariant-cut argument shows that such a limiting pattern has no bad sets.
  ===== 8.1 Finite patterns and minimax. <finite-patterns-and-minimax.>
  Order each list arbitrarily. On a finite ordered index set,
    retain only the length of each list and the equality relation among its occupied slots.
    Each list has at most $d$ slots, and no two occupied slots of one list are equal.
    There are finitely many resulting patterns. Every actual list family gives such a pattern,
    and conversely a pattern is realized by using its equivalence classes as labels.
    Thus the original label universe has no further role in either separation or badness.
  Write $cal(C)_r$ for the finite set of patterns on $\[ r \]$ satisfying (12), and put
  $ b \( B \, C \) = bold(1) { B upright(" is bad in ") C } \, wide B in binom(\[ r \], s) \, med C in cal(C)_r . $
  If the assertion with tolerance $xi$ were false for every $r$, then for each $r gt.eq
    s$ the finite minimax theorem #cite(label("vonNeumann1928")) would give
  $ min_nu max_(C in cal(C)_r) bb(E)_(B tilde.op nu) b \( B \, C \) =
    max_rho min_(B in binom(\[ r \], s)) bb(E)_(C tilde.op rho) b \( B \, C \) > xi . $
  Here $nu$ and $rho$ range over the two finite probability simplices;
    their compactness ensures that the extrema are attained. Consequently, for every $r gt.eq
    s$ there would be a random allowed pattern $C_r$ such that
  #[#set math.equation(numbering: n => "(31)")
   $ Pr \( B upright(" is bad in ") C_r \) gt.eq xi wide upright("for every ") B in binom(\[ r \], s) .
     $ <align:uniform-bad>]
  Assume this counterstatement for the remainder of the argument.
  ===== 8.2 An order-invariant limit. <an-order-invariant-limit.>
  The homogenization step applies finite Ramsey theory #cite(label("Ramsey1930")) to discretized probability
    patterns, following the kind of extraction used by Trotter and Winkler #cite(label("TrotterWinkler1998")).
    We give the particular argument needed here in full. For $t gt.eq 1$,
    let $cal(P)_t$ denote the finite set of all allowed patterns on $\[ t \]$,
    using lists on subsets of size at most $s$. Restriction to an ordered subset,
    followed by its increasing identification with an initial interval of integers,
    defines a map between the appropriate pattern spaces.
  Fix $k gt.eq s$. For each $1 lt.eq t lt.eq k$ and each $t$-subset $J$ of $\[ r \]$,
    the restriction of $C_r$ to $J$ has a probability vector in the finite simplex on $cal(P)_t$.
    Color $J$ by this vector with every entry placed in a bin of width at most $1 \/ k$.
    The number of colors depends only on $s \, d \, t \, k$, not on $r$.
    Successive applications of the finite Ramsey theorem, with the required intermediate set sizes chosen
    backwards, give the following when $r$ is sufficiently large:
    there is a $k$-element set $H_k$ on which all the colorings, for $1 lt.eq t lt.eq k$, are homogeneous.
    Passing to a subset preserves each homogeneity already obtained.
    In particular, the induced pattern laws on any two $t$-subsets of $H_k$ differ by at most $1 \/
    k$ in every coordinate.
  Let $P_t^(\( k \))$ be the law on the first $t$ points of $H_k$.
    If $t lt.eq u lt.eq k$ and $J in binom(\[ u \], t)$, restricting $P_u^(\( k \))$ to $J$ gives the law on the
    corresponding $t$-subset of $H_k$. Therefore
  #[#set math.equation(numbering: n => "(32)")
   $
     lr(|#scale(x: 120%, y: 120%)[\(] P_u^(\( k \)) \|_J #scale(x: 120%, y: 120%)[\)] \( C \) - P_t^(\( k \)) \(
     C \)|) lt.eq 1 / k wide \( C in cal(P)_t \) . $ <align:approx-consistency>]
  Compactness of each finite simplex and a diagonal subsequence as $k arrow.r
    oo$ produce limiting laws $P_t$ for every $t$. Taking limits in (32) gives exact consistency under every
    ordered restriction:
  #[#set math.equation(numbering: n => "(33)")
   $ P_u \|_J = P_t wide \( t lt.eq u \, med J in binom(\[ u \], t) \) . $ <align:consistency>]
  Moreover, (31) gives
  #[#set math.equation(numbering: n => "(34)")
   $ P_s \( upright("the full index set is bad") \) gt.eq xi . $ <align:limit-bad>]
  Assign the law $P_t$ to every increasing $t$-tuple of rational indices.
    The consistency in (33) constructs a countable random array of list lengths and equality relations indexed by
    the nonempty $I subset.eq bb(Q)$ of size at most $s$. For completeness,
    enumerate $bb(Q)$ and successively extend the pattern on the first $n$ enumerated indices to the first $n +
    1$, using the conditional probabilities supplied by their consistent finite laws.
    The choices on zero-probability conditioning events are immaterial.
    Every finite set of rational indices then has its specified law.
  All equivalence-relation axioms, distinctness within a list,
    and separated disjointness hold simultaneously almost surely:
    each violation involves finitely many indices, and there are only countably many possible violations.
    The array’s law is invariant under every increasing automorphism of $bb(Q)$,
    because its finite laws depend only on order. Equation (34) says that every fixed rational $s$-set still has
    bad probability at least $xi$.
  We have thus retained the positive bad-set probability while removing all distinctions between index sets having
    the same order type. We next show that this order invariance, together with separated disjointness,
    forces every label to have an index common to all its occurrences.
  ===== 8.3 An invariant cut for each label. <an-invariant-cut-for-each-label.>
  Fix a nonempty $I subset.eq bb(Q)$, $\| I \| lt.eq s$, and one of its $d$ possible slots.
    Let $E$ be the event that this slot is occupied. On $E$, write $cal(L)$ for its equivalence class of occupied
    slots, and define
  #[#set math.equation(numbering: n => "(35)")
   $ p = sup { min J : upright("a slot at ") J upright(" belongs to ") cal(L) } . $ <align:cut>]
  The set whose supremum is taken contains $min I$. It is bounded above by $max I$,
    since an occurrence at $J$ with $min J > max I$ would violate separated disjointness. Thus
  #[#set math.equation(numbering: n => "(36)")
   $ min I lt.eq p lt.eq max I wide upright("on ") E . $ <align:cut-hull>]
  The random variable $p$ is measurable on $E$: the occurrence family is countable,
    and testing whether its supremum is at most a given real number is a countable intersection of measurable
    conditions on slots.
  Every increasing automorphism $g$ of $bb(Q)$ extends uniquely to an increasing homeomorphism $macron(g)$ of
    $bb(R)$. Transporting the array by $g$ transports the occurrence family in (35) and sends its supremum to
    $macron(g) \( p \)$. If $g$ fixes $I$ pointwise, it also fixes the selected slot and its occupancy event.
    Hence the finite measure
  $ nu \( U \) = Pr \( E upright(" and ") p in U \) \, wide U subset.eq bb(R) upright(" Borel") \, $
  is invariant under all such $macron(g)$. This formulation also covers $Pr \( E \) =
    0$ without conditioning on a null event.
  Let $a < b$ be consecutive points of $I$. For any rational $a < q < q' < b$,
    there is an increasing automorphism of $bb(Q)$ fixing $I$ pointwise and carrying $q$ to $q'$.
    For example, use a piecewise linear increasing bijection of $bb(R)$ that is the identity off $\[ a \, b \]$,
    maps $q$ to $q'$, and is linear on $\[ a \, q \]$ and $\[ q \, b \]$.
    Its rational breakpoints and rational slopes make it a bijection of $bb(Q)$. Invariance gives
  $ nu \( \( - oo \, q \] \) = nu \( \( - oo \, q' \] \) \, wide upright("so") wide nu \( \( q \, q' \] \) = 0 . $
  Countably many such rational intervals cover $\( a \, b \)$, whence $nu \( \( a \, b \) \) = 0$.
    Together with (36), this proves
  #[#set math.equation(numbering: n => "(37)")
   $ Pr \( E upright(" and ") p in.not I \) = 0 . $ <align:cut-index>]
  If $I$ is a singleton, (37) follows directly from (36).
  There are only countably many possible slots, so (37) holds simultaneously at every occupied slot with
    probability one. Equivalent slots have exactly the same occurrence family and hence the same supremum $p$.
    It follows that every equivalence class has a common index in all the sets on whose lists it occurs.
    In particular, on every finite rational $s$-set $B$, every label appearing inside $B$ has a nonempty
    intersection of its occurrence sets there. Thus no such $B$ is bad, contradicting (34) and $xi > 0$.
    This proves the assertion with real probabilities.
  ===== 8.4 Rational probabilities. <rational-probabilities.>
  Choose $0 < xi < eta$ and obtain $r$ and a real distribution $mu_0$ with bad-set probability at most $xi$ for
    every allowed pattern. Approximate $mu_0$ by a rational point $mu$ of the same finite simplex with
  $ sum_(B in binom(\[ r \], s)) \| mu \( B \) - mu_0 \( B \) \| < eta - xi . $
  Every bad-set indicator takes values in $\[ 0 \, 1 \]$, so this changes its expectation by less than $eta - xi$,
    uniformly over all patterns. The distribution $mu$ therefore has the required guarantee. ◻
]

#prodef([Remark 8.1.])[
  For rational $eta > 0$, the finite data in Lemma 10 can also be found by a terminating search.
    Enumerate $r gt.eq s$, enumerate its finitely many allowed slot patterns,
    and minimize their maximum bad-set probability by a rational linear program.
    Search until its optimum is less than $eta$. The proof with a smaller tolerance guarantees termination.
    No bound on the label universe, or oracle describing it, is needed.
] <align:effective>

#bibliography("refs.bib", style: "ieee", title: [References])
