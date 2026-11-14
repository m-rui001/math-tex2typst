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

#align(center)[#text(size: 16pt, weight: "bold")[Parity lifts and bounded-treewidth witnesses for Weisfeiler--Leman equivalence]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The Weisfeiler–Leman method compares graphs by repeatedly refining colors of vertex tuples.
  Its dimension controls how much of a graph each tuple can describe.
  A useful way to study this refinement is to count graph homomorphisms from graphs of bounded treewidth:
  those counts connect local information in a tree decomposition to the global color distribution of the target graph.

We give an explicit reduction from compatible choices in finite domains to Weisfeiler–Leman equivalence.
  Its main ingredients are two parity lifts of one base graph and a procedure that extracts compatible choices
  from any distinguishing homomorphism test with sufficiently small bags.
  All output graphs are finite, simple, undirected and uncolored.
  The construction is independent of the computational applications in the last section.

=== 1.1 Refinement and simultaneous choices <refinement-and-simultaneous-choices>

Fix an integer $k gt.eq 4$. Initially, an ordered tuple $upright(bold(x)) in
  V \( X \)^k$ has its #emph[atomic type] as color: the equalities and adjacencies between all positions.
  Write $upright(bold(x)) \[ i arrow.l y \]$ for replacement of coordinate $i$ by $y$.
  In #emph[joint] refinement, also called the correlated replacement-vector convention,
  a round records the old color $C_r \( upright(bold(x)) \)$ and

$ { #h(-0.16667em) { thin #scale(x: 120%, y: 120%)[\(] C_r \( upright(bold(x)) \[ 1 arrow.l y \] \) \, dots.h \,
  C_r \( upright(bold(x)) \[ k arrow.l y \] \) #scale(x: 120%, y: 120%)[\)] : y in V \( X \) thin } #h(-0.16667em) } . $

In #emph[separate] refinement it records the old color and the $k$ multisets ${ #h(-0.16667em) {
  C_r \( upright(bold(x)) \[ i arrow.l y \] \) : y in V \( X \) } #h(-0.16667em) }$, one for each coordinate $i$.
  Colors are these data, with common names across graphs. Two graphs are $k$-WL equivalent when their tuple-color
  histograms agree at every round. Because each round retains the old color,
  it suffices to compare until the common color partition on the two tuple sets stabilizes.
  We also consider refinement of all tuples in a disjoint union $X_0 union.sq X_1$,
  comparing the histograms on its two pure tuple sets $V \( X_0 \)^k$ and $V \( X_1 \)^k$.

The parameter used throughout the construction is

#[#set math.equation(numbering: n => "(1.1)")
 $ t = cases(delim: "{", k + 1 \, & upright("joint refinement") \,, k \, & upright("separate refinement") .)
   $ <eq:bag-parameter>]

#prodef([Definition 1.1.])[
  (Simultaneous choices).  A #emph[choice system] consists of finite domains $D_1 \, dots.h \, D_t$ and,
    for every $i < j$, a finite label set $L_(i j)$ and maps
  $ lambda_(i j)^i : D_i arrow.r L_(i j) \, wide lambda_(i j)^j : D_j arrow.r L_(i j) . $
  A #emph[successful choice] is a tuple $\( d_1 \, dots.h \, d_t \) in product_i
    D_i$ satisfying $lambda_(i j)^i \( d_i \) = lambda_(i j)^j \( d_j \)$ for every $i < j$. Empty domains are allowed.
] <def:choice>

For example, let $D_i$ be a set of Boolean assignments on a finite variable scope $V_i$,
  and let both pair maps record restriction to $V_i ∩ V_j$, with label set ${ 0 \, 1 }^(V_i ∩ V_j)$.
  A successful choice is then a family of allowed partial assignments that joins to one assignment on $union.big_i V_i$.

Thus each pair of chosen elements must give the same answer to its shared label test.
  The labels are input data for the construction; they will not become vertex colors in the output.
  Write $X_0 equiv_k X_star.op$ for equivalence under the chosen convention.

#thm([Theorem 1.2.])[
  (Parity reduction).  #emph[Fix $k gt.eq 4$, either refinement convention, and the corresponding $t$ in (1.1).
    From every choice system on $t$ domains one can explicitly construct two uncolored simple graphs $X_0 \,
    X_star.op$ of equal order such that
$ X_0 equiv_k X_star.op quad arrow.l.r.double quad upright("the choice system has no successful choice") . $

 The assertion holds both with common color names on separate graphs and with pure-tuple comparison in their
   disjoint union.]
  #emph[If every domain and label set has size at most $A$, where $A gt.eq 1$,
    their common order is at most $A M_t$, where
$ M_t = t thin 2^(thin t - 2 + 3 binom(t - 1, 2)) + 12 binom(t, 3) . $

 When a successful choice exists, the two graphs already have different histograms after at most two joint rounds,
   or one separate round.]
] <thm:choice-reduction>

The order bound is a bound on the actual uncolored graphs;
  no promise about distinguished fibers or preserved types is supplied to a decider.

=== 1.2 Context and the main ideas <context-and-the-main-ideas>

Weisfeiler and Leman introduced the refinement method in their study of graph canonization #cite(label("WL1968")).
  The parity examples of Cai, Fürer and Immerman #cite(label("CFI1992")) are pairs of nonisomorphic vertex-colored
  graphs of maximum degree three that require WL dimension linear in their order to distinguish.
  The present construction also compares parity constraints,
  but its purpose is to make a successful selection from prescribed finite domains exactly equivalent to a
  detectable homomorphism-count difference.

Encoding local solutions of binary linear systems as graph vertices also underlies the construction of Atserias,
  Mančinska, Roberson, Šámal, Severini and Varvitsiotis #cite(label("AMRSSV2019")) author version, Section 6.2.
  Their graphs join assignments that disagree on shared variables and compare a system with the system obtained by
  setting all right-hand sides to zero. Roberson’s parity graphs instead use agreement along adjacent constraint types.

The lift-counting argument has a close predecessor in Roberson’s parity graphs and
  oddomorphisms #cite(label("Roberson2026")) preprint version, Definition 3.1, Theorem 3.6 and Lemma 3.8.
  We use a typed-template adaptation of that construction: a lift retains both a base-graph vertex and the parity
  tag of its template type. The comparison of homogeneous and affine solution sets,
  and its dual parity certificate, follow the same framework.
  We prove these facts locally in the form needed for arbitrary projections into our base graph.
  The additional work is to encode pair labels by helpers and extract a successful choice from every bounded-bag
  obstruction.

Dvořák #cite(label("Dvorak2010")) and Dell, Grohe and Rattan #cite(label("DGR2018")) connect Weisfeiler–Leman
  refinement with homomorphism counts from graphs of bounded treewidth.
  We use their rooted-count viewpoint and give the exact two interfaces needed here:
  equality of all counts with bags of size at most $t$ implies $k$-WL equivalence,
  and one explicit template is detected in the number of rounds stated in Theorem 2.
  The proof keeps the difference between $t = k + 1$ and $t = k$ visible,
  including when refinement is run on the whole disjoint union.

A graph homomorphism is a vertex map preserving adjacency;
  write $hom \( F \, X \)$ for the number of maps from $F$ to $X$.
  Our template has $t$ main vertices forming a clique. For each pair $i < j$ and each third main vertex $ell$,
  it has a helper adjacent to $i \, j \, ell$. The base graph replaces main type $i$ by its domain $D_i$ and this
  helper type by a copy of $L_(i j)$. Main edges and the two helper edges toward $i \, j$ enforce label agreement;
  the helper edge toward $ell$ is unrestricted.

The parity lifts replace each base vertex by bit vectors indexed by its neighboring template types.
  Each vector has a prescribed parity, and two vectors over a base edge must agree in the coordinates facing each
  other. The two lifts differ only in the parity at main type $1$.
  For a fixed projected homomorphism into the base, the lifts to $X_0$ form the kernel of a binary linear system.
  Those to $X_star.op$ form either a translate of the kernel or the empty set.
  Every projection therefore contributes a nonnegative difference to $hom \( F \, X_0 \) -
  hom \( F \, X_star.op \)$. A single positive contribution cannot be cancelled by other,
  possibly non-type-preserving homomorphisms.

A successful choice supplies such a contribution from the template itself.
  Conversely, a distinguishing test gives a dual parity certificate consisting of weights on its vertices and
  edges. For a test with bags of size at most $t$, these weights orient each edge of a tree decomposition toward
  an odd side. A sink bag contains one representative of every main type.
  This odd-side orientation is closely related to Neuen and Seppelt’s separator argument for oddomorphisms
  #cite(label("NS2026")) Lemma 4.4 and proof of Theorem 4.1.
  The remaining issue is the representatives’ compatibility:
  a bag need not induce a clique, and its representatives need not have nonzero weight.
  The helper associated with a mismatched pair transfers its weighted discrepancy to whichever main type is absent
  from a separator. The resulting boundary identity rules out the mismatch,
  even with repeated projected images and zero weights.

Section 2 proves the two homomorphism interfaces. Section 3 constructs the graphs and establishes noncancellation
  and the explicit positive witness. Section 4 proves extraction and completes Theorem 2.
  Section 5 applies the construction to satisfiability.

=== 1.3 Conditional time bounds and their scope <conditional-time-bounds-and-their-scope>

For fixed $k$, direct refinement decides equivalence in $n^(O \( k \))$ time.
  The complexity question is whether this growing exponent can be avoided by a different algorithm.

The #emph[positive exponential-rate ETH] of Impagliazzo and Paturi #cite(label("IP2001")) asserts that some
  $delta > 0$ rules out a deterministic $3$-SAT algorithm with running time $2^(delta N) "poly" \( L \)$,
  where $N$ is the number of variables and $L$ the formula encoding length.
  This is the hypothesis for the following fixed-dimension application.

#thm([Theorem 1.3.])[
  (Fixed-dimension ETH consequence).  #emph[Assume positive exponential-rate ETH.
    There are constants $c > 0$ and $K gt.eq 4$ such that, for every fixed integer $k gt.eq K$,
    no deterministic algorithm decides $k$-WL equivalence of two $n$-vertex graphs in time $O \( n^(c k) \)$.
    This holds for both joint and separate refinement. The inputs are explicit adjacency matrices of uncolored
    simple undirected graphs, and time is measured on a multitape Turing machine.]
] <thm:eth>

The hypothetical algorithm and its multiplicative constant may depend arbitrarily on the fixed $k$;
  the constants $c \, K$ do not. Theorem 3 therefore excludes even an ineffectively selected family of solvers
  whose running-time exponents are $o \( k \)$. Under the weaker premise excluding one uniform $2^(o \( N \))
  "poly" \( L \)$-time $3$-SAT algorithm, we instead prove the uniform $f \( k \)
  n^(o \( k \))$ exclusion in Proposition 14. Its algorithm receives $k$ as input.
  These hypotheses are kept separate throughout the parameter analysis.

Bounds on the number of refinement rounds concern a different question.
  For each fixed $k gt.eq 2$, Grohe, Lichter, Neuen and Schweitzer #cite(label("GLNS2025")) preprint version,
  Theorem 1 and Corollary 34 construct colored graph pairs requiring $Omega \( n^(k \/ 2) \)$ rounds of joint
  refinement. Such a bound constrains the refinement process itself;
  it does not rule out a faster algorithm deciding its stable equivalence relation.
  The time exclusions proved here already apply to comparing tuple-color histograms after two joint rounds or one
  separate round, under the same respective hypotheses; Section 5 gives the deduction.

Lichter, Raßmann and Schweitzer #cite(label("LRS2025")) Section 6 expressed the expectation that neither
  equivalence nor identification admits $n^(o \( k \))$ time and suggested lower bounds based on ETH or its strong
  form. The application above concerns the equivalence question.
  The companion article #emph[Unconditional time lower bounds for Weisfeiler–Leman
  equivalence] #cite(label("CompanionUnconditional")) Theorem 1.1 proves a stronger time bound:
  for every sufficiently large fixed $k$ and every correct deterministic decider,
  an absolute exponent linear in $k$ is required at every sufficiently large graph order.
  It also obtains connected graphs of diameter at most two.
  Its unconditional theorem supersedes the conditional lower bound for stable equivalence in Theorem 3.
  The contribution of this article is the explicit choice reduction and its helper-based bounded-bag extraction,
  using the parity-lift and noncancellation framework described above. No part of its proof uses that companion theorem.

For the ETH application, the sparsification lemma of Impagliazzo,
  Paturi and Zane #cite(label("IPZ2001")) reduces a formula to sparse disjuncts.
  Partitioning their clauses into $t$ groups gives domains of size $2^(O \( N \/ t \))$:
  each domain consists of the assignments satisfying one group,
  and pair labels are restrictions to common variables. We retain the sparsification rate,
  its dependent density constant, the explicit matrix-writing cost and the simulator’s input cost in the full
  calculation. Extensions to other machine models require an absolute-power Turing simulation,
  as specified in Section 5.

== 2 WL refinement and homomorphism tests <sec:wl-tests>

We use the refinement conventions and parameter $t$ from Section 1; throughout $k gt.eq 4$.
  We will use homomorphism counts in two ways to connect the construction to WL.
  Equality of all counts from sources with small bags will prove equivalence.
  A difference for one explicit template will prove inequivalence, already after two joint rounds or one separate round.

A graph has #emph[bag size at most $t$] if it has a tree decomposition on a finite tree with bags of size at most
  $t$: the bags containing any vertex form a nonempty connected subtree,
  and some bag contains both ends of each edge. Equivalently, its treewidth is at most $t - 1$.
  Write $hom \( F \, X \)$ for the number of homomorphisms from $F$ to $X$, that is, vertex maps preserving adjacency.

#prodef([Definition 2.1.])[
  The template $T = T_t$ has main vertices $\[ t \]$ forming a clique.
    For each $i < j$ and $ell in \[ t \] \\ { i \, j }$, it has a helper $h_(i j \; ell)$ adjacent precisely to
    $i \, j \, ell$.
] <def:template>

Its main clique bag, with one attached bag ${ i \, j \, ell \, h_(i j \; ell) }$ per helper,
  gives bag size at most $t$, since $t gt.eq 4$. Every main triple supports three helpers. Consequently

#[#set math.equation(numbering: n => "(2.1)")
 $ \| V \( T \) \| = t + 3 binom(t, 3) \, wide deg_T \( i \) = t - 1 + 3 binom(t - 1, 2) \, wide
   deg_T \( h_(i j \; ell) \) = 3 . $ <eq:template-size>]

In particular $T$ is connected and every vertex has positive degree.

We first establish the preservation statement for arbitrary sources with bags of size at most $t$,
  then prove the detection statement for $T_t$. The homomorphism characterization of WL is established in
  #cite(label("Dvorak2010"), form: "prose") #cite(label("DGR2018"), form: "prose").
  We give a self-contained adaptation of the rooted-count argument for the preservation direction.

#thm([Lemma 2.2.])[
  #emph[If $hom \( F \, X_0 \) = hom \( F \, X_1 \)$ for every graph $F$ of bag size at most $t$, then $X_0 \,
    X_1$ are $k$-WL equivalent in the corresponding convention. This also holds for the disjoint-union implementation.]
] <lem:hom-implies-wl>

#proof[
  We realize WL updates by operations on rooted counts, then recover color indicators on the fixed finite targets
    by interpolation. Equip $F$ with a list $bold(ell) = \( ell_1 \, dots.h \, ell_k \)$ of roots,
    allowing repetitions, all contained in a designated bag. Let $h_F \( X \, upright(bold(x)) \)$ count
    homomorphisms sending $ell_i$ to $x_i$, and let $cal(A)_t$ be the rational span of these functions for sources
    with bag size at most $t$. Distinct isolated roots give the constant $1$; repeating a root tests equality,
    and joining two roots tests adjacency. Complements and products therefore give atomic-type indicators.
  Here is the decomposition invariant behind the algebra. To glue rooted graphs along an interface,
    attach their designated bags to a central bag of formal interface vertices and identify each root with its
    assigned interface vertex. In each operand, every merged vertex is a root,
    so its occurrence subtrees meet the designated bag. Their quotient occurrences connect through the central
    bag. Other vertices retain their connected occurrence subtrees,
    and taking images of bags never increases their sizes. Parallel edges may be collapsed;
    a loop gives the zero function on simple targets. The central bag contains the output roots,
    so this invariant persists under successive operations. In particular,
    gluing corresponding roots realizes products in $cal(A)_t$, with an interface of size at most $k$.
  For joint refinement, the same construction gives closure under
  $ \( f_1 \, dots.h \, f_k \) mapsto
    [\( X \, upright(bold(x)) \) mapsto sum_(y in V \( X \)) product_(i = 1)^k f_i \( X \, upright(bold(x)) \[ i
    arrow.l y \] \)] . $
  For rooted counts, use a central bag of formal vertices $u_1 \, dots.h \, u_k \, y$,
    attach operand $i$ at its replacement list, and retain $u_1 \, dots.h \, u_k$ as output roots.
    This uses $k + 1 = t$ vertices; multilinearity handles their linear combinations.
    Repeated roots can force $y = u_j$ or merge old positions,
    precisely enforcing the corresponding equalities in the summation.
  For separate refinement only $f mapsto sum_y f \( X \, upright(bold(x)) \[ i arrow.l y \] \)$ is needed.
    Use adjacent bags $O = { u_1 \, dots.h \, u_k }$ and $R = { u_j : j eq.not i } union { y }$,
    and attach the operand’s root bag to $R$. Each has size at most $k = t$.
    After the root identifications, a merged class meeting both $O$ and the operand contains a surviving $u_j$,
    so it also meets $R$. Thus no occurrence gap is created, even when $y = u_j$.
    The old $u_i$ remains a pinned output root in $O$. A homomorphism of the quotient specifies exactly one
    allowed image of $y$ and one operand homomorphism: an identification restricts that image,
    rather than contributing an additional free choice.
  Fix the two finite targets. At each round, every color indicator restricted to tuples of these targets agrees
    with a function in $cal(A)_t$. Indeed the update operations give the multiplicity of each color vector (or
    each coordinate color). If such a multiplicity $M$ has attained values $S$,
    its value-$q$ indicator is the polynomial $product_(s in S \\ { q }) \( M - s \) \/ \( q - s \)$,
    for $q in S$. Products with the old-color indicator give every new-color indicator.
    The coefficients are common to the two targets. Finally, $sum_(upright(bold(x)) in V \( X \)^k)
    h_F \( X \, upright(bold(x)) \) = hom \( F \, X \)$: each homomorphism specifies one root-image tuple,
    even with repeated roots. The hypothesis therefore equates all color histograms.
  For the union implementation, perform the indicator induction on #emph[all] tuples of $U = X_0 union.sq X_1$,
    including mixed tuples. The interpolation coefficients are then fixed before either pure restriction is
    summed. For the final quotient source $F$, let $cal(L)$ be its components containing roots and $cal(R)$ its
    rootless components. The exact identity is
  #[#set math.equation(numbering: n => "(2.2)")
   $ sum_(upright(bold(x)) in V \( X_j \)^k) h_F \( U \, upright(bold(x)) \) =
     product_(Q in cal(L)) hom \( Q \, X_j \) product_(Q in cal(R)) hom \( Q \, U \) . $ <eq:pure-tuple-factorization>]
  Connectedness forces each rooted component into $X_j$; rootless components are unrestricted.
    Every map still determines one tuple. Different source components may share target images,
    so their choices remain independent. Components inherit the bag bound, the first product agrees for $j = 0 \,
    1$, and the second is common. Applying this identity to each term of a color indicator proves the claim. ◻
]

It remains to show that a count difference for the template $T_t$ is visible in the claimed number of rounds.
  Its helpers have only three neighbors, so their possible images can be counted from triple common-neighbor counts.

#thm([Lemma 2.3.])[
  #emph[The round-two color histogram in joint $k$-WL determines $hom \( T_(k + 1) \, X \)$.
    The round-one histogram in separate $k$-WL determines $hom \( T_k \, X \)$.
    The same statements hold for pure-tuple histograms obtained by refining a disjoint union.]
] <lem:test-detected>

#proof[
  Let $A_X \( v \, w \) = upright(bold(1))_({ v w in E \( X \) })$.
    For main images $upright(bold(z)) = \( z_1 \, dots.h \, z_t \)$,
    put $q_B \( upright(bold(z)) \) = \| ⋂_(b in B) N_X \( z_b \) \|$, for triples $B subset.eq \[ t \]$.
    Their number of extensions to $T$ is
  $ E_X \( upright(bold(z)) \) = product_(a < b) A_X \( z_a \, z_b \) product_(B in binom(\[ t \], 3))
    q_B \( upright(bold(z)) \)^3 . $
  The clique factor rejects repeated main images. Helper images may coincide,
    so their choices are independent and the displayed product is exact.
  First consider joint refinement. A round-one color of a $k$-tuple determines each triple common-neighbor count
    on its positions. For one candidate $w$, its atomic replacement vector reveals adjacency to position $p$ in
    any component replacing a coordinate other than $p$. Thus that one vector tests simultaneous adjacency to the
    whole triple; summing its multiplicities gives the count.
  Now fix $upright(bold(x)) = \( z_1 \, dots.h \, z_k \)$ and set $z_(k + 1) = y$.
    Its old round-one color and the single vector
  $ #scale(x: 120%, y: 120%)[\(] C_1 \( upright(bold(x)) \[ 1 arrow.l y \] \) \, dots.h \,
    C_1 \( upright(bold(x)) \[ k arrow.l y \] \) #scale(x: 120%, y: 120%)[\)] $
  give the round-one colors of all $k$-position faces of these $k + 1$ main positions.
    The old tuple omits $k + 1$; replacement face $i$ omits $i$,
    with its coordinate $i$ representing position $k + 1$. Every pair and triple lies in a face, since $k gt.eq
    4$. Reading it from, for example, the face omitting the least position outside it determines every factor of
    $E_X \( upright(bold(x)) \, y \)$. All faces in this vector refer to the same $y$.
    The round-two multiset therefore determines $sum_y E_X \( upright(bold(x)) \, y \)$;
    summing over tuple colors gives $hom \( T_(k + 1) \, X \)$.
  For separate refinement, all $t = k$ main images are already fixed. For a triple $B$, choose $i in.not B$.
    If $M_i \( sigma \)$ is the multiplicity of atomic type $sigma$ in the $i$-th replacement multiset, then
  $ q_B \( upright(bold(x)) \) = sum_sigma M_i \( sigma \) product_(p in B) A_sigma \( i \, p \) \, $
  where $A_sigma \( i \, p \)$ is its adjacency bit. Thus the round-one color determines
    $E_X \( upright(bold(x)) \)$, and its histogram determines $hom \( T_k \, X \)$.
  Finally take a pure tuple in $X_j$ while refining $U = X_0 union.sq X_1$.
    In the joint case, a last main image outside $X_j$ makes the clique factor zero.
    Once all main images lie in $X_j$, every common neighbor of a triple lies there too.
    Hence the same formulas, evaluated in $U$, count precisely the desired extensions into $X_j$. ◻
]

== 3 Choices and parity lifts <sec:parity-lifts>

Fix $k gt.eq 4$, and let $t$ and $T = T_t$ be as in Section 2.
  We encode compatible choices by two uncolored graphs. The comparison will account for every homomorphism into
  these graphs, including those whose projections do not describe a choice.

Take a choice system as in Definition 1. Form a base graph $G$ with disjoint vertex sets

$ { \( i \, d \) : d in D_i } quad \( i in \[ t \] \) \, wide { \( h_(i j \; ell) \, q \) :
  q in L_(i j) } quad \( i < j \, med ell in.not { i \, j } \) . $

The first coordinate defines a type map $tau : V \( G \) arrow.r V \( T \)$.
  Its edges are exactly the following, for each permitted $i \, j \, ell$:

- $\( i \, d \)$ and $\( j \, e \)$ are adjacent if $lambda_(i j)^i \( d \) = lambda_(i j)^j \( e \)$.
- $\( h_(i j \; ell) \, q \)$ is adjacent to $\( i \, d \)$ if $q = lambda_(i j)^i \( d \)$,
  and to $\( j \, e \)$ if $q = lambda_(i j)^j \( e \)$.
- Every $\( h_(i j \; ell) \, q \)$ is adjacent to every $\( ell \, f \)$, $f in D_ell$.

Thus $G$ is simple and $tau$ is a homomorphism to $T$. When evaluating a label map,
  we identify a vertex in a domain copy with its underlying domain element.
  Types and labels are construction data, not vertex colors supplied to WL.
  Figure 1 isolates the two label tests and the unrestricted third incidence.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-4.2, 0), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(i,d)$]]])])
  content((0, 0), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(j,e)$]]])])
  content((4.2, 0), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$( ell ,f)$]]])])
  content((0, 2.8), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(h_("ij"; ell ),q)$]]])])
  line((-0.5112, 2.459), (-3.697, 0.3351), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2.1, 1.4), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$q= lambda_(i j)^i(d)$]]])], anchor: "south")
  line((0, 2.459), (0, 0.3351), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.1058, 0.924), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$q= lambda_(i j)^j(e)$]]])], anchor: "west")
  line((0.5112, 2.459), (3.697, 0.3351), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.1, 1.4), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[unrestricted]]])], anchor: "south")
  line((-3.627, 0), (-0.5733, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2.1, -0.1411), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$lambda_(i j)^i(d)= lambda_(i j)^j(e)$]]])], anchor: "north")
})],
  caption: [Figure 1: Allowed incidences for one helper in the base graph. The edges from the helper to types $i \, j$ require its label $q$ to equal the corresponding pair label. Its incidence with type $ell$ is unrestricted. The displayed main edge also requires pair-label agreement; other main edges are omitted. Each labeled point denotes an arbitrary vertex of its fiber, so an edge is present only when its indicated condition holds. ],
) <fig:helper-incidence>

Write $bb(F)_2$ for the field with two elements.

#prodef([Definition 3.1.])[
  (Parity lifts).  For $b in bb(F)_2^(V \( T \))$, the graph $X_b$ has vertices
  $ \( u \, z \) \, wide u in V \( G \) \, quad z in bb(F)_2^(N_T \( tau \( u \) \)) \, quad
    sum_(a' in N_T \( tau \( u \) \)) z \( a' \) = b \( tau \( u \) \) . $
  Vertices $\( u \, z \)$ and $\( v \, w \)$ are adjacent precisely when $u v in
    E \( G \)$ and $z \( tau \( v \) \) = w \( tau \( u \) \)$.
    We compare $X_0$ and $X_star.op := X_(e_1)$, where $e_1 \( a \) = upright(bold(1))_({ a = 1 })$.
] <def:lifts>

The coordinates of a tag are indexed by neighbor types in $T$,
  including types for which $u$ has no neighbor in $G$. Every type has positive degree.
  Hence every $u$ has $2^(deg_T \( tau \( u \) \) - 1)$ tags for either parity,
  so both output graphs have order $sum_(u in V \( G \)) 2^(deg_T \( tau \( u \) \) - 1)$.
  Both graphs are uncolored and simple: adjacency is symmetric, and a loop would require a loop in $G$.
  The map $pi_b : \( u \, z \) mapsto u$ is a homomorphism $X_b arrow.r G$.
  If each base fiber has at most $A$ vertices, Equation (2.1) gives the bound $A M_t$ of Theorem 2:
  the $t$ main fibers have $2^(t - 2 + 3 binom(t - 1, 2))$ tags per base vertex,
  and the $3 binom(t, 3)$ helper fibers each have four.

The tags on the template itself form Roberson’s parity graph #cite(label("Roberson2026")) preprint version,
  Definition 3.1. Here we additionally remember a vertex $u in G$ whose type matches the tag.
  Equivalently, if $R_b \( T \) arrow.r T$ is that parity graph’s type projection,
  then $X_b$ is the graph on pairs in $G times R_b \( T \)$ with matching projections,
  with adjacency in both coordinates. Thus fixing $phi.alt : F arrow.r
  G$ fixes the template projection $tau phi.alt$. The following proof gives the resulting local form of Roberson’s
  lift-count comparison and binary duality #cite(label("Roberson2026")) preprint version,
  Theorem 3.6 and Lemma 3.8; the compatibility extraction in Section 4 will use the particular helper structure of
  our base graph.

#thm([Lemma 3.2.])[
  (Lift counts and their dual obstruction).  #emph[For every finite simple graph $F$, $hom \( F \, X_0 \) gt.eq
    hom \( F \, X_star.op \)$. The inequality is strict if and only if there are a homomorphism $phi.alt :
    F arrow.r G$, vertex weights $s : V \( F \) arrow.r bb(F)_2$, and edge weights $r : E \( F \) arrow.r
    bb(F)_2$ such that, writing $a = tau compose phi.alt$,
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(y : thin x y in E \( F \)\
a \( y \) = a') r \( x y \) & = s \( x \) &  & #scale(x: 120%, y: 120%)[\(] x in V \( F \) \, med
  a' in N_T \( a \( x \) \) #scale(x: 120%, y: 120%)[\)] \,\
sum_(x in V \( F \)\
a \( x \) = 1) s \( x \) & = 1 . $ <eq:dual>]

 Whenever (3.1) holds, the type masses satisfy
#[#set math.equation(numbering: n => "(3.2)")
 $ m_u \( A \) := sum_(x in A\
a \( x \) = u) s \( x \) \, wide m_u \( V \( F \) \) = 1 quad #scale(x: 120%, y: 120%)[\(] u in V \( T \) \, med
  A subset.eq V \( F \) #scale(x: 120%, y: 120%)[\)] . $ <eq:type-mass>]

 All sums of weights are in $bb(F)_2$.]
] <lem:lift-duality>

#proof[
  Fix $phi.alt : F arrow.r G$. Its lifts to $X_b$ correspond to solutions in variables $z_(x \, a')$,
    one for each source vertex $x$ and each $a' in N_T \( a \( x \) \)$, of
  $ sum_(a' in N_T \( a \( x \) \)) z_(x \, a') = b \( a \( x \) \) quad \( x in V \( F \) \) \, wide
    z_(x \, a \( y \)) + z_(y \, a \( x \)) = 0 quad \( x y in E \( F \) \) . $
  Indeed a solution gives the map $x mapsto \( phi.alt \( x \) \, z_x \)$,
    and a lift uniquely determines these source-indexed vectors.
    Equality of projected images does not itself identify these source-indexed tag variables;
    all constraints on them are given by the displayed system.
  The coefficient matrix is independent of $b$. The system for $b = 0$ has its kernel as solution set; for $b =
    e_1$ the solution set is either empty or a translate of that kernel.
    Every homomorphism into $X_b$ has a unique projection to $G$,
    so summing over all $phi.alt$ proves the inequality. Since each homogeneous system is nonempty,
    strictness is equivalent to inconsistency of at least one projected system for $X_star.op$.
    In particular, contributions from other projections cannot cancel a strict inequality.
  A binary system $M z = c$ is inconsistent exactly when some linear combination of its rows has left side zero
    and right side one. For the nontrivial direction, if $c in.not "im" M$,
    extend a basis of $"im" M$ by $c$ to obtain a linear functional vanishing on $"im"
    M$ and taking value one at $c$. Let $s \( x \)$ and $r \( x y \)$ be the coefficients of the vertex and edge
    equations above. The coefficient of $z_(x \, a')$ in their combination is $s \( x \) +
    sum_(y : thin x y in E \( F \) \, thin a \( y \) = a') r \( x y \)$,
    and the right side for $X_star.op$ is $sum_(a \( x \) = 1) s \( x \)$.
    This gives exactly (3.1), without any independence assumption on the equation rows.
  For adjacent types $u \, v$, sum the first equation of (3.1) over all vertices of type $u$,
    using neighbor type $v$. The result is the total $r$-weight of the edges between these two types.
    Summing from type $v$ gives the same total, so $m_u \( V \( F \) \) = m_v \( V \( F \) \)$.
    Since $T$ is connected and $m_1 \( V \( F \) \) = 1$, every type mass is one. ◻
]

#thm([Lemma 3.3.])[
  (A choice supplies a witness).  #emph[A successful choice gives $hom \( T \, X_0 \) > hom \( T \, X_star.op \)$,
    and hence $X_0 \, X_star.op$ are not $k$-WL equivalent.]
] <lem:choice-witness>

#proof[
  Given a successful choice $\( d_i \)_(i in \[ t \])$, map main vertex $i$ to $\( i \, d_i \)$ and each
    $h_(i j \; ell)$ to $\( h_(i j \; ell) \, lambda_(i j)^i \( d_i \) \)$.
    The common pair label and the unrestricted edge toward $ell$ make this a homomorphism $phi.alt : T arrow.r
    G$ with $tau compose phi.alt$ the identity. Set every vertex and edge weight to one.
    Each vertex of $T$ has exactly one neighbor of each adjacent type, and exactly one source vertex has type $1$,
    so (3.1) holds. Apply Lemma 8 and then Lemma 6. ◻
]

A successful choice has now supplied a noncancelling, explicitly detected witness.
  It remains to prove that a small-bag witness cannot arise without such a choice.
  The next section extracts one directly from the dual weights of Lemma 8.

== 4 Extracting a choice from a bounded-bag witness <sec:separator>

The dual equations force odd total weight at every type. We now use small separators to locate one bag whose main
  vertices give compatible choices. The odd-side orientation below is closely related to the separator argument
  for oddomorphisms of Neuen and Seppelt #cite(label("NS2026")) Lemma 4.4 and proof of Theorem 4.1.
  Here the helper types additionally force compatibility of the representatives;
  we retain the local orientation to control the weighted contribution of every outer side.

#thm([Lemma 4.1.])[
  (Choice extraction).  #emph[Let $F$ have a tree decomposition with bags of size at most $t$.
    Suppose that a homomorphism $phi.alt : F arrow.r G$ and weights $s : V \( F \) arrow.r bb(F)_2$ and $r :
    E \( F \) arrow.r bb(F)_2$ satisfy (3.1), where $a = tau compose phi.alt$.
    Then the choice system has a successful choice.]
] <lem:extract-choice>

#proof[
  All sums in this proof are in $bb(F)_2$. We use the type masses $m_u \( Y \)$ from (3.2); in particular,
    $m_u \( V \( F \) \) = 1$ for every type $u$.
  #emph[Orienting the decomposition.] Fix a decomposition tree $cal(D)$,
    and contract edges joining identical bags. Every remaining edge has an intersection $S$ of size at most $t -
    1$: an intersection of size $t$ would force both incident bags to be that same set.
    Deleting the tree edge partitions $V \( F \)$ into $S$ and two sides $A^0 \, A^1$.
    Indeed, the occurrence subtree of a vertex outside $S$ lies in just one of the two tree components.
    No graph edge joins the two sides, since its endpoints occur together in a bag.
  At least one main type is absent from $S$. If two main types $u \, v$ are absent,
    all $u v$-edges incident with either type on a side stay on that side.
    Summing (3.1) over their two endpoint classes gives $m_u \( A^nu \) = m_v \( A^nu \)$ for $nu in { 0 \, 1 }$.
    For any absent main type $u$,
  $ m_u \( A^0 \) + m_u \( A^1 \) = m_u \( V \( F \) \) = 1 . $
  Orient the tree edge toward the side of mass $1$. This is well defined whether there is one absent main type or
    several.
  Choose a sink of the oriented tree and denote its bag by $B$.
    For each incident edge let $A$ be its outer side and $S subset.eq B$ its intersection.
    These outer sides partition $V \( F \) \\ B$. To see this precisely,
    the occurrence subtree of a vertex outside $B$ avoids the sink node and lies in exactly one component of
    $cal(D)$ minus that node. A vertex in $B$ occurring in a branch must belong to that branch’s intersection $S$,
    so is excluded from its outer side. Thus vertices are counted once, regardless of how many bags contain them.
    Moreover, every neighbor of $A$ outside $A$ lies in $S$, and the sink orientation gives
  $ m_ell \( A \) = 0 wide upright("for every main type ") ell upright(" absent from ") S upright(".") $
  If a main type were absent from $B$, it would be absent from every such $S$ and have mass zero in the bag and in
    all outer sides, contrary to its global mass $1$. Since $\| B \| lt.eq t$,
    the bag therefore consists of exactly one vertex $x_i$ of each main type $i$, and no helper vertices.
    No condition on the individual weights $s \( x_i \)$ is needed.
  #emph[A global mismatch test.] Write $phi.alt \( x_i \) = \( i \, d_i \)$, with $d_i in D_i$.
    The bag $B$ need not induce a clique, so compatibility of these representatives does not follow from $phi.alt$
    alone. Suppose, for a contradiction, that some pair $i < j$ has different labels, and put $alpha =
    lambda_(i j)^i \( d_i \)$. We choose label predicates that vanish on these representatives and are
    complementary on matching labels. For source vertices of types $i \, j$, respectively, put
  $ p_i \( x \) = upright(bold(1))_({ lambda_(i j)^i \( phi.alt \( x \) \) eq.not alpha }) \, wide p_j \( x \) =
    upright(bold(1))_({ lambda_(i j)^j \( phi.alt \( x \) \) = alpha }) . $
  For $Y subset.eq V \( F \)$, let
  $ P \( Y \) = sum_(d in { i \, j }) med sum_(x in Y\
a \( x \) = d) s \( x \) p_d \( x \) . $
  Each $i j$-edge has matching labels under $phi.alt$, hence the two endpoint predicates sum to $1$.
    Expanding the corresponding coordinates of (3.1) gives
  #[#set math.equation(numbering: n => "(4.1)")
   $ P \( V \( F \) \) & = sum_(x y in E \( F \)\
a \( x \) = i \, med a \( y \) = j) r \( x y \) #scale(x: 120%, y: 120%)[\(] p_i \( x \) +
  p_j \( y \) #scale(x: 120%, y: 120%)[\)]\
 & = sum_(x y in E \( F \)\
a \( x \) = i \, med a \( y \) = j) r \( x y \) = m_i \( V \( F \) \) = 1 . $ <eq:global-mismatch>]
  Here each edge is listed with its $i$-endpoint first. On the other hand, $P \( B \) = 0$.
  #emph[Vanishing on an outer side.] Fix an outer side $A$ with intersection $S$,
    and choose a main type $ell$ absent from $S$; thus $m_ell \( A \) = 0$.
    We show that $P \( A \) = 0$, retaining the possible boundary edges.
  First suppose $ell = i$; the case $ell = j$ is symmetric.
    Every $i$-neighbor of a $j$-vertex in $A$ lies in $A$, because an external neighbor would lie in $S$,
    which has no $i$-vertex. An edge from an $i$-vertex in $A$ may reach a $j$-vertex in $S$,
    but its $p_j$-value is zero. Consequently expansion of (3.1) yields
  $ P \( A \) & = sum_(x in A\
a \( x \) = i) med sum_(y in N_F \( x \)\
a \( y \) = j) r \( x y \) #scale(x: 120%, y: 120%)[\(] p_i \( x \) + p_j \( y \) #scale(x: 120%, y: 120%)[\)]\
 & = sum_(x in A\
a \( x \) = i) med sum_(y in N_F \( x \)\
a \( y \) = j) r \( x y \) = m_i \( A \) = 0 . $
  Now suppose $ell in.not { i \, j }$, and put $h = h_(i j \; ell)$.
    Each base vertex of type $h$ couples the two predicates through its stored $L_(i j)$-label.
    Having this helper type for every possible $ell$ makes the calculation available whichever main type $S$
    omits. Since $S subset.eq B$, neither $h$ nor $ell$ occurs in $S$.
    We will show $P \( A \) = m_h \( A \) = m_ell \( A \) = 0$,
    using a zero boundary correction to complete the neighbor sums in the first equality.
    Write $H_A = { w in A : a \( w \) = h }$. Every $h$-neighbor of an $i$- or $j$-vertex in $A$ belongs to $H_A$:
    an outside neighbor would have to lie in $S$. Expanding the $h$-coordinate at each tested main vertex
    therefore gives
  $ P \( A \) = sum_(w in H_A) med sum_(d in { i \, j }) med sum_(x in A ∩ N_F \( w \)\
a \( x \) = d) r \( w x \) p_d \( x \) . $
  The boundary correction
  $ C_S = sum_(w in H_A) med sum_(d in { i \, j }) med sum_(x in S ∩ N_F \( w \)\
a \( x \) = d) r \( w x \) p_d \( x \) $
  is zero, since $p_i \, p_j$ vanish on their respective vertices of $S$.
    Adding it includes #emph[all] $i$- and $j$-neighbors of every $w in H_A$,
    because all external neighbors of $A$ lie in $S$.
  For each such $w$, let $q_w in L_(i j)$ be the label stored at $phi.alt \( w \)$, and write
  $ R_d \( w \) = sum_(x in N_F \( w \)\
a \( x \) = d) r \( w x \) = s \( w \) wide \( d = i \, j \) \, $
  where the equality is the corresponding coordinate of (3.1).
    Its $i$-neighbors have predicate $upright(bold(1))_({ q_w eq.not alpha })$,
    and its $j$-neighbors have predicate $upright(bold(1))_({ q_w = alpha })$. Hence
  $ P \( A \) & = P \( A \) + C_S\
 & = sum_(w in H_A) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ q_w eq.not alpha }) R_i \( w \) +
   upright(bold(1))_({ q_w = alpha }) R_j \( w \) #scale(x: 120%, y: 120%)[\)]\
 & = sum_(w in H_A) s \( w \) = m_h \( A \) . $
  These are separate coordinate equations at each source vertex $w$; its number of neighbors, its label $q_w$,
    and its weight $s \( w \)$ may vary. An empty neighbor class simply forces $s \( w \) = 0$.
    Finally, because neither $h$ nor $ell$ occurs in $S$, every $h
    ell$-edge incident to either type in $A$ stays in $A$. Summing its coordinate equations at the two endpoint
    classes gives $m_h \( A \) = m_ell \( A \) = 0$, as required.
  The disjoint vertex partition now gives
  $ P \( V \( F \) \) = P \( B \) + sum_(upright("outer sides ") A) P \( A \) = 0 \, $
  contradicting (4.1); the sum is empty if the decomposition has only one bag.
    Thus all $d_i$ have matching pair labels and form a successful choice. ◻
]

#proof[
  The parity lifts in Definition 7 are simple, uncolored and of equal order;
    their preceding tag count gives $n lt.eq A M_t$. If a successful choice exists,
    Lemma 9 gives a strict count difference for $T_t$. Lemma 6 detects that difference after two joint rounds or
    one separate round.
  Conversely, suppose that no successful choice exists. If a graph $F$ with bags of size at most $t$ had different
    counts into the two lifts, Lemma 8 would give the data $phi.alt \, s \, r$ of Lemma 10.
    That lemma would produce a successful choice, a contradiction. All such homomorphism counts therefore agree.
    Lemma 5 gives equivalence in the corresponding convention, including the pure-tuple disjoint-union implementation. ◻
]

== 5 The ETH lower bound <sec:complexity>

The parity reduction is unconditional. To obtain its complexity consequences we first control domain sizes,
  then account for the sparsification and graph-construction costs before choosing the dimension.
  We use the width-three case of the sparsification lemma #cite(label("IPZ2001")) Corollary 1, p. 523.
  Here clauses have at most three literals, and $\| F \|$ denotes the explicit encoding length of a formula $F$.

#thm([Lemma 5.1.])[
  (Sparsification).  #emph[For every $epsilon.alt > 0$ there are a constant $C_epsilon.alt gt.eq
    1$ and a deterministic algorithm that expresses any $3$-CNF $F$ on $N gt.eq
    1$ variables as a disjunction of at most $2^(epsilon.alt N)$ $3$-CNFs on the same variables,
    each with at most $C_epsilon.alt N$ clauses. The running time is $2^(epsilon.alt N) "poly" \( \| F \| \)$.
    For positive rational $epsilon.alt$, the procedure and a valid density bound can be chosen effectively.]
] <lem:sparsification>

The lemma is the imported sparsification theorem, not a consequence of the parity construction.
  In its constructive set-system proof, the universe consists of the $2 N$ literals:
  choosing rate $epsilon.alt \/ 2$ there gives the displayed variable-based rate $epsilon.alt$.
  The integer threshold choice and fixed branching procedure provide the effective rational-rate selection used
  below #cite(label("IPZ2001")) pp. 520–523.

The stated input-length bound allows an initial polynomial-time normalization:
  rename variables and remove tautologies and repeated clauses.
  There are only $O \( N^3 \)$ distinct clauses of width at most three,
  so the normalized encoding has length polynomial in $N$.

#thm([Lemma 5.2.])[
  (Grouping sparse clauses).  #emph[A $3$-CNF with $m$ clauses yields a simultaneous-choice instance with $t$
    domains, each domain and pair-label set having size at most
$ A = 2^(3 ceil.l m \/ t ceil.r) . $

 A simultaneous choice exists if and only if the formula is satisfiable.]
] <lem:sat-choice>

#proof[
  Partition the clauses into $t$ groups of size at most $ceil.l m \/ t ceil.r$.
    Let $V_i$ be the variables in group $i$, and let $D_i$ contain exactly the assignments on $V_i$ satisfying
    that group. Set
  $ L_(i j) = { 0 \, 1 }^(V_i ∩ V_j) \, wide lambda_(i j)^i \( d \) = d \|_(V_i ∩ V_j) \, wide
    lambda_(i j)^j \( d \) = d \|_(V_i ∩ V_j) . $
  Each scope has size at most $3 ceil.l m \/ t ceil.r$, proving the bounds.
    Pairwise agreement assigns every shared variable one value,
    so the choices join to an assignment satisfying all clauses; unused variables are free.
    Conversely, restrict a satisfying assignment to each scope.
    An empty group has its unique empty assignment, an unsatisfiable group has empty domain,
    and an empty overlap has one label, the empty assignment. Thus these cases require no exception. ◻
]

Apply Theorem 2 with $t = k + 1$ for the joint convention, or $t = k$ for separate coordinate multisets.
  For a sparse formula with $m lt.eq C N$, recall that

$ M_t = sum_(a in V \( T \)) 2^(deg_T \( a \) - 1) = 2^(O \( k^2 \)) . $

There are at most $A$ vertices in each base fiber, and precisely $2^(deg_T \( a \) - 1)$ tags per vertex of type
  $a$. The two output graphs therefore have a common order satisfying

#[#set math.equation(numbering: n => "(5.1)")
 $ n lt.eq M_t thin 2^(3 ceil.l m \/ t ceil.r) lt.eq b_k thin 2^(3 C N \/ t) \, wide b_k = 8 M_t . $ <eq:output-size>]

These are explicit graphs. Enumerate the scope and overlap assignments, retain the satisfying domain assignments,
  and enumerate the parity tags. A scan of all vertex pairs then writes both adjacency matrices:
  each entry is determined by restrictions of assignments and a comparison of tag bits.
  The vertex records have length $O \( N + k^2 \)$, so a direct multitape implementation takes at most

#[#set math.equation(numbering: n => "(5.2)")
 $ b'_k thin \( N + \| F \| \)^d thin 2^(B_0 C N \/ t) \, wide B_0 = 6 \, $ <eq:construction-time>]

for an absolute $d$ and a constant $b'_k$ depending only on $k$.
  Indeed, squaring the assignment bound gives $2^(6 ceil.l m \/ t ceil.r) lt.eq 64 thin 2^(6 C N \/ t)$.
  A fixed-power tape simulation only changes the absolute constant $B_0$.

#proof[
  Use positive-rate ETH #cite(label("IP2001")): for some $delta > 0$,
    no deterministic $3$-SAT algorithm runs in $2^(delta N) "poly" \( \| F \| \)$ time.
    Choose $epsilon.alt < delta \/ 4$, and fix $C = C_epsilon.alt$ from Lemma 11.
    For the Turing-machine model set $q = 1$. More generally,
    suppose the chosen machine model has a simulation taking at most $A_k \( T + ell + 1 \)^q$ steps,
    where $q gt.eq 1$ is fixed by the model, independently of the simulated program and $k$.
    Here $T$ is the program’s running time and $ell$ its input length;
    $A_k$ may depend on the chosen fixed program and $k$. Choose
  $ c = frac(delta, 24 C q) \, wide K gt.eq 4 \, wide K > frac(4 C max { B_0 \, 6 q }, delta) . $
  Fix any $k gt.eq K$ and suppose a solver takes $O \( n^(c k) \)$ time.
    Hardcode this solver and $k$ into a $3$-SAT algorithm. Sparsify the input,
    form the graph pair for every sparse disjunct, and accept exactly when at least one pair is inequivalent.
    Lemmas 11 and 12, together with Theorem 2, prove correctness.
  The matrix input has length $ell = O \( n^2 \)$, so the simulated solver takes
    $O_k \( n^(q c k) + n^(2 q) + 1 \)$ time. Both terms matter, even when $c k < 2$.
    By (5.1) and (5.2), the total time is bounded, up to polynomial input factors and fixed-$k$ constants, by
  $ 2^(epsilon.alt N) (2^(B_0 C N \/ t) + 2^(6 q C N \/ t) + 2^(3 C q c k N \/ t)) . $
  Since $t gt.eq k$, the first two inner rates are below $delta \/ 4$, and the third is at most $delta \/ 8$.
    The resulting rate is below $delta \/ 2$, contradicting ETH.
    The solver’s description, its running-time constant, $A_k$, $b_k$,
    and the eventual threshold in $N$ may all depend on this fixed $k$; $c$ and $K$ do not.
    Thus the contradiction applies to every fixed $k gt.eq K$, without a uniform way of selecting the alleged solvers. ◻
]

#prodef([Remark 5.3.])[
  (Small dimensions on matrix inputs).  On a comparison of two edgeless $n$-vertex graphs,
    a deterministic algorithm must inspect every potential edge:
    changing an unseen edge in one graph destroys equivalence,
    by degrees for ordinary $1$-WL and by atomic tuple types for $k gt.eq 2$.
    This gives an $Omega \( n^2 \)$ bit-query bound. Decreasing $c$ so that $c k < 2$ for the finitely many $2
    lt.eq k < K$ therefore includes those dimensions for both tuple conventions.
    Ordinary neighbor color refinement at dimension one is covered separately by the degree argument.
    The literal one-coordinate replacement rules above, whose atomic types see no edges,
    are not this ordinary $1$-WL convention.
]

=== 5.1 The uniform subexponential formulation <sec:uniformity>

The conclusion under an assumption that only excludes a single uniform subexponential $3$-SAT algorithm is
  explicitly uniform. Here a uniform WL algorithm takes $k$ and the two graphs as input.

#thm([Proposition 5.4.])[
  (Uniform lower bound).  #emph[If no deterministic $3$-SAT algorithm has running time $2^(o \( N \))
    "poly" \( \| F \| \)$, there is no uniform deterministic algorithm for $k$-WL equivalence with running time
    $f \( k \) n^(g \( k \))$, where $g \( k \) \/ k arrow.r 0$.]
] <prop:uniform>

#proof[
  The constructive sparsification proof chooses integer thresholds by a computable search from any positive
    rational rate and then runs a fixed branching procedure #cite(label("IPZ2001")) pp. 520–523.
    We may therefore fix an effectively indexed family $S_j$ with rate $1 \/ j$ and sparsity constant $C_j$,
    for $j gt.eq 1$.
  Suppose the uniform WL algorithm exists. We obtain one subexponential solver by racing all fixed parameter
    choices, so no effective rate of convergence for $g \( k \) \/ k$ is needed.
    One fixed Turing machine $U \( j \, k \, F \)$ runs $S_j$, constructs the graph pairs,
    and calls that algorithm. For every fixed $j gt.eq 1$ and $k gt.eq 4$, its full running time has the form
  $ T_(j \, k) \( F \) lt.eq A_(j \, k) N^(d_j) 2^(rho_(j \, k) N) \, wide rho_(j \, k) = 1 / j +
    max {frac(B_0 C_j, t) \, frac(3 C_j g \( k \), t)} \, $
  after normalization. Parameter initialization and graph output are included in $T_(j \, k)$.
  Run doubling rounds $R = 1 \, 2 \, 4 \, dots.h$. In each round simulate $U \( j \, k \, F \)$ from scratch for
    at most $R$ steps for every $1 lt.eq j lt.eq R$ and $4 lt.eq k lt.eq R$,
    stopping at the first completed decision. All these computations are correct.
    If $L$ is the normalized input length, a fixed tape simulator costs at most $O \( \( R + L + 1 \)^3 \)$ per
    trial, including input copying and resetting the at most $O \( L + R \)$ touched cells.
    There are at most $R^2$ trials. Consequently the single resulting machine has running time
  $ D \( F \) lt.eq C_U #scale(x: 120%, y: 120%)[\(] T_(j \, k) \( F \) + L + j + k + 4 #scale(x: 120%, y: 120%)[\)]^5 $
  for every fixed pair, with an absolute power and a constant $C_U$ independent of that pair.
  Given $eta > 0$, first fix $j$ with $1 \/ j < eta \/ 20$.
    Then fix $k$ so that both terms in the maximum defining $rho_(j \, k)$ are below $eta \/ 20$.
    This is possible since $t gt.eq k$ and $g \( k \) \/ k arrow.r 0$.
    Thus $rho_(j \, k) < eta \/ 10$; the fifth-power bound is $2^(eta N)$ for all sufficiently large $N$,
    after absorbing its fixed constants and polynomial factors. The same pair works at all these lengths.
    The machine need not recognize a good pair or know a convergence modulus for $g \( k \) \/ k$.
    For precision, normalize first to a canonical formula on its occurring variables.
    If none occur, decide the resulting constant formula directly,
    without invoking sparsification or the racing machine. Otherwise, if their number is $1 lt.eq N' lt.eq N$,
    its length is polynomial in $N'$. For every desired rate the same fixed pair bounds all sufficiently large
    $N'$; the finitely many canonical formulas with smaller $N'$ have a common finite maximum running time.
    Thus the normalized solver has a uniform $2^(o \( N \))$ bound even when the original encoding names many
    unused variables. Parsing and normalization cost one fixed polynomial in the original input length,
    so the complete algorithm contradicts the assumed uniform subexponential lower bound. ◻
]

The same model qualification applies: simulation replaces $g \( k \)$ by at most $max { q g \( k \) \, 2 q } + 1 =
  o \( k \)$ when $q$ is fixed. For this uniform transfer, the simulation must itself be uniform in $k$.
  An ineffective family of separately supplied fixed-$k$ solvers would not define $U$;
  Proposition 14 makes no assertion about such a family under its weaker premise.

Given two $n$-vertex graphs, consider deciding whether their $k$-tuple color histograms agree after two joint
  rounds, or after one separate round, starting from atomic types.
  This includes separate runs with common color names and pure-tuple comparison in the disjoint-union run.
  On the graph pairs produced by the reduction, Theorem 2 gives equality at every round when there is no
  successful choice, and inequality by the specified round when a choice exists.
  The inequality persists because each update retains the old color.
  Thus the reductions proving Theorem 3 and Proposition 14 give the same deterministic time exclusions for these
  fixed-round decisions, with their respective hypotheses and parameter ranges.
  The difficulty is already present in comparing these early histograms;
  it does not require many rounds of stabilization.

#bibliography("refs.bib", style: "ieee", title: [References])
