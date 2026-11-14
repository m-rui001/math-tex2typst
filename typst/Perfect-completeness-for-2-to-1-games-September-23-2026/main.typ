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

#align(center)[#text(size: 16pt, weight: "bold")[Perfect completeness for 2-to-1 games]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A #emph[projection game] consists of a finite bipartite multigraph with disjoint vertex sets $U \, V$,
  a nonempty multiset $E$ of edge occurrences, finite answer sets at its vertices,
  and a map $pi_e$ from the left answer set to the right answer set for each occurrence $e = \( u \, v \)$.
  A labeling chooses one answer at each vertex and satisfies $e$ when the right answer equals the image of the
  left answer under $pi_e$. The #emph[value] of the game is the maximum fraction of satisfied occurrences.
  Parallel occurrences may have different projection maps.

A #emph[2-to-1 game] has a common left alphabet $\[ 2 q \]$ and right alphabet $\[ q \]$, where $\[ m \] = { 1 \,
  dots.h \, m }$, and

$ \| pi_e^(- 1) \( b \) \| = 2 wide \( e in E \, med b in \[ q \] \) . $

Khot introduced the games conjectures in the study of hardness of approximation #cite(label("Khot2002")).
  His original formulation allowed fibers of size at most two; we use the exact-two convention.
  The 2-to-1 Games Conjecture asks for NP-hardness of distinguishing satisfiable games from games of arbitrarily
  small fixed value. The satisfiable case is the #emph[perfect-completeness] requirement:
  one labeling must satisfy every constraint. Completeness $1 -
  epsilon$ for each fixed $epsilon > 0$ does not itself give this endpoint,
  since those reductions need not produce any finite satisfiable game.
  There is also an obstruction to amplifying a constant gap by ordinary repetition:
  repeating an exact-two projection $k$ times gives $2^k$ preimages of every right answer.
  We prove the conjecture while retaining two-element fibers, in the following explicit form.

#thm([Theorem 1.1.])[
  #emph[For every fixed rational $delta in \( 0 \, 1 \)$ there are an integer $q = q \( delta \) gt.eq
    2$ and a deterministic polynomial-time reduction from $3$-SAT to 2-to-1 games with alphabets $\[ 2 q \]$ and
    $\[ q \]$ such that:]
  + #emph[a satisfiable formula produces a game of value $1$;]
  + #emph[an unsatisfiable formula produces a game of value at most $delta$.]
  #emph[The output contains a nonempty explicit list of unweighted edge occurrences and an explicit table for
    every projection map. Every table has exactly two preimages for each right answer.
    The polynomial running-time bound is in the ordinary binary input length;
    its degree and constants may depend on the fixed $delta$.]
] <thm:main>

The theorem supplies the hypothesis of several perfect-completeness reductions.
  We derive consequences for maximum $k$-colorable subgraph and satisfiable Not-Two constraints below,
  identifying those already known unconditionally.

=== 1.1 Historical context and ingredients <historical-context-and-ingredients>

Austrin, O’Donnell, Tan and Wright established perfect-completeness 2-to-1 Label Cover hardness with alphabets of
  sizes $6$ and $3$ and soundness $23 \/ 24 + epsilon$ #cite(label("AustrinODonnellTanWright2014")) Theorem 1.3,
  author manuscript. The remaining issue was to make soundness arbitrarily small while retaining both perfect
  completeness and two-element fibers.

The near-perfect-completeness theorem arose from the Grassmann and shortcode program.
  Khot, Minzer and Safra introduced a Grassmann-based candidate reduction #cite(label("KhotMinzerSafra2017"));
  Dinur, Khot, Kindler, Minzer and Safra developed the reduction to a Grassmann agreement hypothesis and the
  associated expansion problem #cite(label("DinurKhotKindlerMinzerSafra2018"))
  #cite(label("DinurKhotKindlerMinzerSafra2021")). Barak, Kothari and Steurer related the agreement problem to
  expansion through the shortcode viewpoint #cite(label("BarakKothariSteurer2018")).
  The near-perfect expansion theorem of Khot, Minzer and Safra completed these ingredients,
  giving completeness arbitrarily close to one and arbitrarily small
  soundness #cite(label("KhotMinzerSafra2018")). More recently, Fei,
  Minzer and Wang proved perfect-completeness hardness for 4-to-1 games at arbitrarily small fixed soundness
  #cite(label("FeiMinzerWang2026")) Theorem 1.6.

Our conclusion concerns ordinary 2-to-1 games. In the Rich 2-to-1 framework of Braverman, Khot and Minzer,
  a uniformly random edge incident to each fixed left vertex must induce a partition that is uniform among all
  partitions of the left alphabet into pairs #cite(label("BravermanKhotMinzer2021")) Definition 5.
  No such condition is part of Theorem 1. For any positive real soundness target,
  one may apply the theorem with a smaller fixed rational target.

Our external theorem inputs are a perfect-completeness PCP gap, projection-game parallel repetition,
  and Grassmann expansion #cite(label("Dinur2007")) #cite(label("DinurSteurer2014"))
  #cite(label("KhotMinzerSafra2018")). From the last input we derive the inverse shortcode estimates using the
  chart and averaging arguments of Barak, Kothari and Steurer #cite(label("BarakKothariSteurer2018"));
  Section 2 gives the forms needed here. The sampling comparisons have antecedents in the sub-code covering
  framework of Khot and Safra #cite(label("KhotSafra2013")).
  The passage from agreement of restricted bilinear forms to a fixed form of bounded rank has a close counterpart
  in Fei, Minzer and Wang #cite(label("FeiMinzerWang2026")) Lemmas 5.15–5.16.
  We prove the comparisons needed for the function spaces and sampling laws below.

=== 1.2 Proof overview <proof-overview>

We start with a clause-versus-variable game: the left player answers a clause with a satisfying assignment to its
  variables, the right player answers a variable with a bit,
  and the constraint checks their agreement on that variable.
  A perfect-completeness PCP and parallel repetition make the source value a fixed small constant on NO inputs.
  We place independent copies of its questions at the leaves of a finite rooted tree.
  Each leaf carries all binary functions on its local answer domain.
  At an internal node we take the sum of the spaces spanned by products of pairs of functions from each child.
  In particular, the product of two functions from one descendant space belongs to every space above that descendant.

At every nonleaf node we display an array, meaning a list of functions from its space.
  A question is the unordered partition of the product of all leaf-answer domains according to the joint
  evaluation of these arrays. A legal answer is a nonempty part,
  so one assignment realizes all its restored outputs simultaneously.
  We discard input coordinates that these evaluations cannot distinguish;
  a clause coordinate seen only through one variable is recorded by that variable.
  This identifies a question on projected source domains with its pullback to the original domains.
  Deleting one binary output direction merges at most two parts and gives the preliminary at-most-two constraints.
  A satisfying source assignment answers every constraint. The same joint partitions also remain unchanged when an
  upper row is shifted by products of displayed lower rows, forcing exact identities on all restored responses.
  Section 3 defines the questions, their sampling law, and these identities.

To analyze soundness, we sample a random root-to-leaf path.
  Arrays off that path are uniform; arrays on it use a recursive sampler with fresh randomness for every call.
  Stopping the calls at a node expresses every ancestor array as a deterministic function of a bounded number of
  draws there. Increasing the number of children hides the special path child and makes the observed draws close
  to uniform. A separate comparison replaces the source questions below a small random set of children by their
  right questions. After lifting the resulting functions to the original domains,
  this change also has small total variation. Section 4 proves these comparisons and bounds the chance that a
  child selected from the observed functions was projected.

Suppose a labeling satisfies a fixed positive fraction of the preliminary constraints.
  With enough levels, some pair of levels has positive simultaneous success.
  At the upper level an inverse shortcode theorem finds one response occurring with positive density on an affine
  slice. The table records responses at every lower-level descendant of the upper node, so its range may be large;
  Theorem 9 has constants independent of that range and also applies to small quotient spaces.
  Joint partition identities convert the slice into a coset of linear functionals $z$ on the upper function space
  with $z \( 1 \) = 1$. Each functional defines a product form $F \( g \, h \) =
  z \( g h \)$ on the lower function space. For the displayed lower rows $s_1 \, dots.h \,
  s_ell$ and their restored response $y$, joint legality gives

$ #scale(x: 120%, y: 120%)[\(] F \( s_t \, s_u \) #scale(x: 120%, y: 120%)[\)]_(t \, u) = y y^(sans(t)) \, $

so this tested matrix has rank at most one. A Fourier decoder on the projected side selects from a bounded list
  computed under a small-bias law determined by its own local input (Lemma 26).
  The two local forms agree after projection with fixed positive probability.
  Section 5 constructs these decoders, with an agreement bound independent of the lower row count.

The remaining difficulty is that the left form depends on the very rows on which its rank is tested.
  Passing that test therefore does not immediately bound its full rank.
  Resampling within the lower omitted-direction fiber gives equal restrictions with positive probability.
  The sparse-projection posterior bound promotes this to equality of full forms, apart from a small error.
  A second inverse application then finds one output form occurring densely on an affine slice of row lists.
  A fixed high-rank form almost never has a tested matrix of rank at most one on that slice.
  Thus a positive part of the agreement must come from bounded-rank forms (Section 6).

A low-rank normalized product form selects a short odd list of answers at each source leaf.
  On a projected leaf, agreement gives the parity pushforward of that list:
  retain exactly those right answers having an odd number of preimages in the left list.
  Some projected children have all their sampled contributions equal to zero.
  After exposing the other data, both decoders can reconstruct their original inputs from their own questions at
  designated leaves in these children. The designated source pairs remain independent because the probability of
  the zero event is exactly independent of them (Lemmas 32 and 33).
  Projection-game repetition then contradicts positive agreement (Section 7).

Finally, Section 8 chooses the constants in their dependency order,
  completes at-most-two maps to exact 2-to-1 maps, and replaces rational edge weights by an explicit unweighted
  multiset.

=== 1.3 Applications <applications>

#thm([Corollary 1.2.])[
  (Maximum $k$-colorable subgraph).  #emph[There are absolute constants $C > 0$ and an integer $k_0 gt.eq
    3$ such that, for every fixed integer $k gt.eq k_0$, it is NP-hard to distinguish the following cases for a
    finite unweighted graph $G = \( W \, F \)$ with $F eq.not diameter$:]
  + #emph[$G$ is $k$-colorable;]
  + #emph[every coloring $chi : W arrow.r \[ k \]$ satisfies
$ frac(\| { { u \, v } in F : chi \( u \) eq.not chi \( v \) } \|, \| F \|) lt.eq 1 - 1 / k + C frac(log k, k^2) . $

]
  #emph[The fraction on the left is the proportion of edges properly colored by $chi$,
    or equivalently cut by its partition into $k$ color classes.]
] <cor:max-k-colorable>

#proof[
  Theorem 1 supplies the exact-two, perfect-completeness premise of Guruswami and Sinop’s reduction
    #cite(label("GuruswamiSinop2013")) Conjecture 3.4 and Theorem 3.26.
    Their regularization and reduction preserve perfect completeness, giving $k$-colorable YES graphs,
    and their Remark 2.6 transfers the hardness to unweighted graphs.
    Their soundness bound $1 - 1 \/ k + O \( log k \/ k^2 \)$ is therefore unconditional.
    Choose an absolute upper bound $C$ for the lower-order term and enlarge $k_0$ so the two cases are disjoint.
    The reduction parameters, including the soundness used in Theorem 1, are fixed once $k$ is chosen. ◻
]

The next corollary recovers Håstad’s unconditional hardness theorem for satisfiable Not-Two and the corresponding
  three-query PCP consequence #cite(label("Hastad2014NotTwo")) Theorem 4.3,
  using the earlier reduction of O’Donnell and Wu.

#thm([Corollary 1.3.])[
  (Satisfiable Not-Two and three-query PCPs).  #emph[Let $"NTW" \( a \, b \, c \)$ be the Boolean predicate
    accepting exactly zero, one, or three true inputs. For every fixed $0 < epsilon < 3 \/ 8$,
    it is NP-hard to distinguish a satisfiable instance with constraints $"NTW" \( ell_1 \, ell_2 \, ell_3 \)$
    from one in which every assignment satisfies at most a $5 \/ 8 + epsilon$ fraction of the constraints;
    each literal $ell_i$ may be a variable or its negation. Consequently,
    every language in NP has a polynomial-time verifier using $O \( log n \)$ random bits and three nonadaptive
    proof-bit queries, with perfect completeness and soundness at most $5 \/ 8 + epsilon$,
    where $n$ is the input length.]
] <cor:not-two-pcp>

#proof[
  Apply O’Donnell and Wu’s reduction #cite(label("ODonnellWu2008")) Theorem 2.1 and Corollary 2.2,
    author manuscript. Their premise requires only at-most-$d$-to-1 projections for some fixed $d$.
    Take $d = 2$, use the uniform distribution on the explicit edge occurrences,
    and choose a fixed rational $delta in \( 0 \, 1 \)$ smaller than their required soundness threshold.
    Theorem 1 supplies this premise with perfect completeness.
    Their folded verifier allows all eight literal-sign variants of Not-Two and gives both conclusions. ◻
]

Corollary 3 also follows by applying the O’Donnell–Wu reduction to Fei,
  Minzer and Wang’s perfect 4-to-1 theorem #cite(label("FeiMinzerWang2026")).

Through Guruswami and Sandeep’s reduction at $d = 2$ #cite(label("GuruswamiSandeep2020")) Theorem 1,
  Theorem 1 also recovers the known NP-hardness of distinguishing three-colorable graphs from graphs that are not
  $c$-colorable, for every fixed integer $c gt.eq 3$ #cite(label("FeiMinzerWang2026")) Corollary 1.7;
  the companion #cite(label("OpenAIIndependentSets2026")) Theorem 1.1 separately proves stronger independent-set
  soundness with three-colorable completeness.

== 2 Source games and inverse matrix structure <sec:preliminaries>

This section supplies the three external ingredients of the reduction and the precise matrix consequence that we
  will use. A perfect-completeness PCP and parallel repetition give a source game of arbitrarily small constant
  value. Grassmann expansion gives a dense constant-value slice of a matrix table that often agrees across a
  rank-one step. We prove the extensions needed for tables with arbitrarily many possible values,
  for small column spaces, and for finding a slice by random row advice.

Throughout, $bb(F)_2$ denotes the field with two elements.
  All vector spaces are finite-dimensional over $bb(F)_2$, and all unspecified uniform distributions are on finite
  sets. For probability measures $mu \, nu$ on a common finite set, write $"TV" \( mu \, nu \) = 1 /
  2 sum_x \| mu \( x \) - nu \( x \) \|$; in particular, every event has probabilities differing by at most
  $"TV" \( mu \, nu \)$.

=== 2.1 Finite projection games and the source gap <finite-projection-games-and-the-source-gap>

A #emph[finite projection game] $G$ consists of disjoint finite question sets $U \, V$,
  nonempty finite answer sets $L_u \, R_v$, a nonempty finite set of edge occurrences $cal(E)$,
  and a probability distribution $mu$ on $cal(E)$. An occurrence $e$ has endpoints $u \( e \) \,
  v \( e \)$ and a total map $pi_e : L_(u \( e \)) arrow.r R_(v \( e \))$.
  Distinct occurrences may have the same endpoints and different maps.
  A deterministic strategy is a pair of functions selecting $a \( u \) in L_u$ and $b \( v \) in R_v$, and

$ "val" \( G \) = max_(a \, b) Pr_(e tilde.op mu) \[ pi_e \( a \( u \( e \) \) \) = b \( v \( e \) \) \] . $

Thus each player receives only its own question, and neither receives the edge occurrence unless that information
  is already determined by its question. Question-dependent legal answer sets are part of the definition.
  Zero-weight occurrences may be discarded. Isolated questions, when retained to define auxiliary tables,
  do not affect value. Independent private randomness, or shared randomness independent of the sampled edge,
  cannot increase value: fix complete answer functions for all questions using the random tapes,
  and average their deterministic success probabilities.

For $k gt.eq 1$, the game $G^(⊗ k)$ samples $k$ independent occurrences.
  Each player receives its ordered tuple of questions and returns a tuple of legal answers;
  acceptance requires all $k$ constraints. The answer coordinates remain separate even when a question is
  repeated. We also set $"val" \( G^(⊗ 0) \) = 1$.

#thm([Theorem 2.1.])[
  (Perfect-completeness PCP gap).  #emph[There is a constant $gamma_0 >
    0$ and a deterministic polynomial-time map taking any Boolean $3$-CNF formula $phi$ to a nonempty $3$-CNF
    formula $Psi$ such that every clause of $Psi$ uses three distinct variables.
    If $phi$ is satisfiable, then $Psi$ is satisfiable. If $phi$ is unsatisfiable,
    every assignment violates at least a $gamma_0$ fraction of the clauses of $Psi$.
    Clause occurrences are explicitly listed, and the binary encoding length of $Psi$ is polynomial in that of $phi$.]
] <thm:pcp>

#proof[
  The PCP theorem originates in the work of Arora–Safra and Arora–Lund–Motwani–Sudan–Szegedy
    #cite(label("AroraSafra1998")) #cite(label("AroraLundMotwaniSudanSzegedy1998")).
    We use Dinur’s perfect-completeness formulation #cite(label("Dinur2007")) Definition 8.1 and Theorem 8.1,
    February 13, 2007 author manuscript. It gives, in deterministic polynomial time,
    an explicitly listed family of $N$ predicates of bounded arity over a fixed finite alphabet,
    with a satisfying assignment in the YES case and a fixed rejected fraction $theta >
    0$ under every assignment in the NO case. We spell out the conversion to clauses,
    since perfect completeness must survive every local encoding.
  Encode each alphabet symbol injectively by a fixed number of bits.
    For each predicate, require both that its queried bit blocks encode valid symbols and that the decoded symbols
    satisfy the predicate. A satisfying symbol assignment satisfies all these Boolean predicates.
    Conversely, decode every invalid block to a fixed default symbol.
    Whenever an original predicate rejects this decoded assignment,
    the corresponding Boolean predicate rejects the bit assignment:
    either a queried block is invalid, or all are valid and the original rejection is unchanged.
    Thus every Boolean assignment still violates at least $theta N$ predicates on a NO input.
    After identifying repeated queried variables, each predicate involves at most a fixed number $k_0$ of distinct bits.
  For each rejecting assignment of a Boolean predicate, form the clause that excludes precisely that assignment.
    The conjunction of these at most $2^(k_0)$ clauses is exactly the predicate.
    Each clause has width at most $k_0$; a rejecting zero-bit predicate contributes the empty clause.
    For a clause $ell_1 or dots.h.c or ell_k$ with $k gt.eq 4$, introduce fresh variables $y_1 \, dots.h \,
    y_(k - 3)$ and replace it by
  $ \( ell_1 or ell_2 or y_1 \) \, wide \( not y_j or ell_(j + 2) or y_(j + 1) \)
    med \( 1 lt.eq j lt.eq k - 4 \) \, wide \( not y_(k - 3) or ell_(k - 1) or ell_k \) . $
  If all $ell_h$ are false, the first clause forces $y_1 = 1$, each middle clause propagates this value,
    and the last clause fails. If the original clause is true, setting $y_j = 1$ exactly when $ell_1 \, dots.h \,
    ell_(j + 1)$ are all false satisfies every displayed clause.
    Use disjoint auxiliary variables for every such replacement. Clauses of width at most three are retained.
    Consequently an accepting predicate admits a satisfying extension,
    whereas a rejecting predicate forces a violated clause for every extension.
    There is a fixed bound $B gt.eq 1$ on the number of clauses per predicate.
    The resulting formula has at most $B N$ clauses and at least $theta
    N$ violated clauses under every assignment on a NO input, so its gap is at least $hat(gamma) = theta \/ B > 0$.
  Here is the further normalization, including its gap loss.
    Remove tautological clauses and simplify repeated literals in each remaining clause.
    A resulting clause $C$ on $k lt.eq 3$ distinct variables is replaced by all $2^(3 - k)$ clauses obtained by
    adjoining every sign pattern on $3 - k$ fresh variables, used only for this occurrence.
    If $C$ is true, every extension is true. If $C$ is false,
    exactly one extension is false for every assignment to the fresh variables.
    This also handles an empty clause, using all eight sign patterns on three fresh variables.
    Consequently every violated original clause still contributes a violated clause,
    while the number of clauses increases by at most eight. The gap is therefore at least $hat(gamma) \/ 8$,
    and completeness remains one. If normalization leaves no clauses,
    use a single satisfiable clause on three fresh variables;
    this case cannot occur for a NO output of the gap reduction.
    An input with no clauses can likewise be sent directly to this fixed satisfiable formula.
    All steps are deterministic and polynomial. ◻
]

#thm([Theorem 2.2.])[
  (Weighted projection-game repetition).  #emph[Let $G$ be any finite projection game with the conventions above.
    For $0 < g < 1$ and every integer $k gt.eq 1$,
#[#set math.equation(numbering: n => "(2.1)")
 $ "val" \( G \) lt.eq 1 - g quad arrow.r.double quad "val" \( G^(⊗ k) \) lt.eq \( 1 - g^2 \/ 16 \)^k .
   $ <eq:prelim-repetition>]

 The bound is uniform in the question sets, answer sets, and probability distribution on edge occurrences.]
] <thm:repetition>

Raz proved exponential decay under parallel repetition for general two-player games #cite(label("Raz1998"));
  Holenstein simplified that proof #cite(label("Holenstein2009")),
  and Rao obtained an alphabet-independent bound for projection games #cite(label("Rao2011")).
  The precise estimate above is the parallel repetition theorem of Dinur and Steurer
  #cite(label("DinurSteurer2014")) Corollary 1.2. Their Sections 2.1–2.2 allow nonnegative weights and parallel
  edges and use independent products of questions. Interchanging the players matches our projection direction.
  To express question-dependent answer sets in their common-alphabet convention,
  embed all legal answers in one finite alphabet and give illegal answers no accepting pairs.
  Such partial projection constraints are allowed there, and legal defaults show that this extension does not
  change value. Thus the stated version applies directly to our games.

We now specify the source questions, because their exact local domains will matter in the construction.
  For a normalized clause occurrence $C$, let $cal(A)_C subset.eq bb(F)_2^3$ be its seven satisfying assignments,
  recorded as #emph[variable bits], including the signs of the clause only in the definition of $cal(A)_C$.
  The game $G_Psi$ samples a uniform clause occurrence $C$ and a uniform position $h in { 1 \, 2 \, 3 }$.
  The left question is $C$, with answer domain $cal(A)_C$; the right question is the variable ID at position $h$,
  with answer domain $bb(F)_2$; and the projection selects the $h$th bit.
  The occurrence and selected position remain with the verifier.

A satisfying assignment to $Psi$ gives value one. Conversely, fix any right labeling,
  hence an assignment to the variables of $Psi$. At every clause it violates,
  any legal left answer differs from that assignment in at least one position. Therefore

#[#set math.equation(numbering: n => "(2.2)")
 $ phi upright(" unsatisfiable") quad arrow.r.double quad "val" \( G_Psi \) lt.eq 1 -
   gamma_0 \/ 3 . $ <eq:prelim-clause-gap>]

For any required constant $sigma > 0$, choose a fixed integer $t$ with $\( 1 - gamma_0^2 \/ 144 \)^t lt.eq
  sigma$ and take

#[#set math.equation(numbering: n => "(2.3)")
 $ G_(upright("src")) = G_Psi^(⊗ t) . $ <eq:prelim-source-game>]

Theorem 5 gives source soundness at most $sigma$, with perfect completeness.
  Its left question is an ordered tuple of clause occurrences,
  its answer domain is the product of their $cal(A)_C$, its right question is the corresponding tuple of variable
  IDs, and its right answer domain is always $bb(F)_2^t$. In particular,
  a repeated variable ID in a right question imposes no equality condition on the corresponding answer
  coordinates. Both answer-domain sizes, $7^t$ and $2^t$, are constants,
  and the explicit game has polynomial size because $t$ is fixed.

Each $cal(A)_C$ projects onto both bits at any single position and onto all four bit pairs at any two distinct
  positions. Indeed, a clause excludes just one of the eight triples, and any prescribed pair has two extensions.
  Taking products proves that every source projection is surjective.
  The pair-surjectivity observation will also make the support reduction of function queries unambiguous.

=== 2.2 Matrix slices and the Grassmann input <matrix-slices-and-the-grassmann-input>

Let $H$ be a finite vector space, put $K = bb(F)_2^ell$, and identify $K ⊗ H$ with $"Hom" \( H^(*) \, K \)$.
  Thus a matrix $M$ is a list of $ell$ rows in $H$, and $M q in K$ evaluates those rows at $q in H^(*)$.
  For a linear map $A : K arrow.r bb(F)_2^a$, the notation $A M$ denotes its $a$ specified combinations of rows.
  A #emph[row and column slice] is a nonempty affine set

#[#set math.equation(numbering: n => "(2.4)")
 $ cal(S) = { M in K ⊗ H : A M = U \, med M q_b = t_b med \( 1 lt.eq b lt.eq c \) } \, $ <eq:prelim-slice>]

where $U in bb(F)_2^a ⊗ H$, $q_b in H^(*)$, and $t_b in K$.
  There is no independence requirement on the rows of $A$ or on the $q_b$.
  We count specified row combinations and column values, rather than their ranks;
  redundant equations can always be removed. A slice with no column constraints is a #emph[row fiber].

For $a in K$ and $h in H$, write $a h = a ⊗ h$. The matrix step used below is

$ M mapsto M + a h \, wide M upright(" uniform") \, quad a upright(" uniform in ") K \\ { 0 } \, quad
  h upright(" uniform in ") H \, $

with the three choices independent. This step is stationary: both endpoints are uniform.
  The possibility $h = 0$ is retained.

We recall the precise structural theorem behind the matrix argument.
  The Grassmann graph on an $N$-dimensional binary vector space has the $ell$-dimensional subspaces as its
  vertices; distinct vertices are adjacent when their intersection has dimension $ell - 1$.
  For a nonempty vertex set $S$, its #emph[retention] is the probability that a uniform vertex of $S$ has a
  uniformly chosen neighbor in $S$.

#thm([Theorem 2.3.])[
  (Grassmann expansion consequence).  #emph[For each $0 < zeta < 1$, there are $alpha > 0$, an integer $r gt.eq
    1$, and $ell_0$ such that, for every $ell gt.eq ell_0$ and then every sufficiently large $N$,
    the following holds. Every nonempty set of vertices with retention at least $zeta$ has density at least
    $alpha$ in an interval
$ { L : A_0 subset.eq L subset.eq B_0 \, med dim L = ell } \, wide dim A_0 + "codim" B_0 lt.eq r . $

 The constants $alpha \, r \, ell_0$ depend only on $zeta$; the threshold for $N$ may also depend on $ell$.]
] <thm:prelim-grassmann>

For sets of density at most $1 \/ 2$, this is Theorem 1.12 of Khot–Minzer–Safra in ECCC TR18-006,
  revision 2 #cite(label("KhotMinzerSafra2018")), with expansion written as one minus retention;
  Definitions 1.8 and 1.10 give the expansion and interval conventions.
  If the set has density greater than $1 \/ 2$, take $A_0 = { 0 }$ and $B_0 = bb(F)_2^N$.
  This whole interval has co-order zero and density greater than $1 \/ 2$,
  so replacing the cited density constant by its minimum with $1 \/ 2$ proves the statement in that case too.
  The order of the dimension quantifiers is important. We next give the matrix-chart argument,
  as in #cite(label("BarakKothariSteurer2018")) Section 3, and then remove the column-dimension requirement explicitly.

#thm([Lemma 2.4.])[
  (Matrix set extraction in large dimension).  #emph[For every $0 < eta < 1$ there are $alpha > 0$, $r gt.eq 1$,
    and $ell_0$, depending only on $eta$, such that for each $ell gt.eq
    ell_0$ and all sufficiently large $m$ the following holds.
    If a nonempty set $S subset.eq "Mat"_(ell \, m) \( bb(F)_2 \)$ satisfies
$ Pr_(M upright(" uniform in ") S \, med a eq.not 0 \, med h) \[ M + a h^(sans(t)) in S \] gt.eq eta \, $

 where $a in bb(F)_2^ell \\ { 0 }$ and $h in bb(F)_2^m$ are independent uniform vectors,
   then $S$ has density at least $alpha$ in a nonempty row and column slice with at most $r$ equations of each kind.]
] <lem:prelim-matrix-set>

#proof[
  Increase the lower threshold on $m$ so that $2^(- m) lt.eq eta \/ 2$.
    The step has $h = 0$ with probability $2^(- m)$. Its retention conditional on $h eq.not
    0$ is therefore at least $\( eta - 2^(- m) \) \/ \( 1 - 2^(- m) \) gt.eq eta \/ 2$.
  Associate to $M$ its graph subspace
  $ L_M = { \( x \, M^(sans(t)) x \) : x in bb(F)_2^ell } subset.eq bb(F)_2^ell xor bb(F)_2^m . $
  These subspaces form the chart $cal(C)$ on which projection to the first summand is invertible,
    and $M mapsto L_M$ is a bijection onto that chart. The identity $dim \( L_M ∩ L_(M') \) = ell -
    "rank" \( M - M' \)$ shows that chart neighbors are precisely the nonzero rank-one changes.
    Over $bb(F)_2$, each nonzero rank-one matrix has exactly one factorization $a
    h^(sans(t))$ with both factors nonzero. The degree within the chart is thus $\( 2^ell - 1 \) \( 2^m - 1 \)$.
  For comparison, a vertex of the full Grassmann graph has $\( 2^ell - 1 \) \( 2^(m + 1) - 2 \)$ neighbors:
    choose a hyperplane in the vertex, then a one-dimensional extension in its quotient,
    excluding the original vertex. Exactly half the neighbors of every chart vertex therefore remain in the chart.
    The set $tilde(S) = { L_M : M in S }$ has full Grassmann retention at least $eta \/ 4$.
    Apply Theorem 6 with $zeta = eta \/ 4$. It supplies an interval $\[ A_0 \, B_0 \]$ of bounded co-order on
    which $tilde(S)$ has density at least $alpha$. Its intersection with $cal(C)$ is nonempty,
    and restricting the denominator to this intersection cannot decrease that density,
    since $tilde(S) subset.eq cal(C)$.
  It remains to identify the intersection as a slice. A basis of $A_0$ consists of vectors $\( d_b \, s_b \)$,
    and its containment in $L_M$ is exactly $d_b^(sans(t)) M = s_b^(sans(t))$ for every basis vector.
    Using the standard dot product, a basis $\( t_b \, q_b \)$ of $B_0^perp$ gives the equations $M q_b =
    t_b$ for containment $L_M subset.eq B_0$. Thus there are at most $r$ row equations and at most $r$ column
    equations. The Grassmann theorem fixes $alpha \, r \, ell_0$ using only $eta$; after fixing $ell$,
    its ambient-dimension threshold is met by taking $m$ sufficiently large. ◻
]

Our eventual matrices may have very small column spaces, including quotient spaces of dimension zero.
  Adding unused columns preserves the matrix test, but a dense slice in the enlarged space can mix real and dummy
  columns. The next lemma describes its projection exactly.

#thm([Lemma 2.5.])[
  (Eliminating dummy columns).  #emph[Let $H \, D \, K$ be finite binary vector spaces,
    and write a matrix on $H xor D$ as $\( X \, Y \)$, with $X in "Hom" \( H^(*) \, K \)$ and $Y in
    "Hom" \( D^(*) \, K \)$. Suppose the nonempty affine slice
#[#set math.equation(numbering: n => "(2.5)")
 $ tilde(cal(S)) = { \( X \, Y \) : A X = U_H \, med A Y = U_D \, med X q_b + Y d_b =
   t_b med \( 1 lt.eq b lt.eq c \) } $ <eq:prelim-padded-slice>]

 has $A : K arrow.r bb(F)_2^a$, $q_b in H^(*)$, and $d_b in D^(*)$.
   Its image $cal(S)$ under $\( X \, Y \) mapsto X$ is a nonempty row and column slice with the same $a$ row
   combinations and at most $c$ column values. Every $X in cal(S)$ has equally many lifts in $tilde(cal(S))$.
   In particular, a uniform point of the padded slice projects to a uniform point of $cal(S)$.]
] <lem:padding>

#proof[
  Put $W = ker A$. Encode all dependencies among the column equations by the linear maps
  $ q : bb(F)_2^c arrow.r H^(*) \, quad q \( lambda \) = sum_b lambda_b q_b \, wide d : bb(F)_2^c arrow.r D^(*) \,
    quad d \( lambda \) = sum_b lambda_b d_b \, wide t \( lambda \) = sum_b lambda_b t_b . $
  We claim that the image consists exactly of the matrices $X$ obeying
  #[#set math.equation(numbering: n => "(2.6)")
   $ A X = U_H \, wide X q \( lambda \) = t \( lambda \) quad \( lambda in ker d \) . $ <eq:prelim-projected-slice>]
  A basis of $ker d$ gives at most $c$ column equations, whether or not their real arguments are independent.
    Necessity follows by taking linear combinations of the original column equations whose dummy arguments vanish.
  For sufficiency, fix one point $\( X_(*) \, Y_(*) \)$ of the original nonempty slice,
    and let $X$ satisfy Equation (2.6). The row equations give $A \( X_(*) - X \) = 0$.
    Define on $"im" d$ the candidate linear map
  #[#set math.equation(numbering: n => "(2.7)")
   $ L_0 \( d \( lambda \) \) = \( X_(*) - X \) q \( lambda \) . $ <eq:prelim-dummy-extension>]
  It is well-defined: if $d \( lambda \) = 0$, the projected equations for $X$ and $X_(*)$ give $\( X_(*) - X \)
    q \( lambda \) = 0$. Its values lie in $W$ because $A \( X_(*) - X \) = 0$.
    Extend $L_0$ arbitrarily to a linear map $L : D^(*) arrow.r W$, and put $Y = Y_(*) + L$. Then $A Y = U_D$, and
  $ X q \( lambda \) + Y d \( lambda \) = X q \( lambda \) +
    Y_(*) d \( lambda \) + \( X_(*) - X \) q \( lambda \) = t \( lambda \) $
  for every $lambda$. This gives a lift. It also shows explicitly why the row compatibility and all dependent
    column equations suffice.
  Every lift is obtained this way, since its difference from $Y_(*)$ takes values in $W$ and must restrict to
    $L_0$ on $"im" d$. The number of such extensions is
  $ 2^(dim W thin \( dim D - "rank" d \)) \, $
  independent of $X$. Thus all projection fibers have the same size, which proves the uniform-measure assertion.
    The argument permits zero dimensions and rank-deficient $A$ throughout. ◻
]

=== 2.3 Partial tables and many row fibers <partial-tables-and-many-row-fibers>

A partial table with finite range $cal(Y)$ is a function $f : K ⊗ H arrow.r cal(Y) union { tack.t }$,
  where $tack.t in.not cal(Y)$ means undefined. A #emph[defined equality] requires both endpoints to have the same
  value in $cal(Y)$; two undefined values never count.

#thm([Theorem 2.6.])[
  (Inverse theorem for a finite-range partial table).  #emph[For every $0 < eta < 1$, there are $alpha > 0$,
    integers $r gt.eq 1$ and $ell_0$, depending only on $eta$, with the following property.
    For every $ell gt.eq ell_0$, every finite binary vector space $H$, every finite set $cal(Y)$,
    and every partial table $f : K ⊗ H arrow.r cal(Y) union { tack.t }$, where $K = bb(F)_2^ell$, if
#[#set math.equation(numbering: n => "(2.8)")
 $ Pr_(M \, a \, h) \[ f \( M \) = f \( M + a h \) eq.not tack.t \] gt.eq eta \, $ <eq:prelim-defined-equality>]

 for independent uniform $M$, $a in K \\ { 0 }$, and $h in H$,
   then some $y in cal(Y)$ has density at least $alpha$ on a nonempty slice with at most $r$ row combinations and
   at most $r$ column values. The constants are independent of both $dim H$ and $\| cal(Y) \|$.]
] <thm:inverse>

#proof[
  Use the constants of Lemma 7 for $eta$. Add a dummy space $D$ so that $dim \( H xor D \)$ meets its column
    threshold, and define $tilde(f) \( X \, Y \) = f \( X \)$.
    A uniform padded matrix projects to a uniform real matrix; likewise,
    a uniform step factor in $H xor D$ projects to a uniform factor in $H$.
    Thus the defined-equality probability is unchanged, even when $H = 0$.
  For a defined value $y$, let $S_y = tilde(f)^(- 1) \( y \)$, let $mu_y$ be its uniform matrix measure,
    and let $theta_y$ be its retention under the padded matrix step. Empty fibers can be omitted.
    Partitioning according to the first value gives exactly
  #[#set math.equation(numbering: n => "(2.9)")
   $ Pr \[ tilde(f) \( tilde(M) \) = tilde(f) \( tilde(M) + a tilde(h) \) eq.not tack.t \] =
     sum_(y in cal(Y)) mu_y theta_y . $ <eq:prelim-fiber-average>]
  Since $sum_y mu_y lt.eq 1$, a value $y$ has $theta_y gt.eq eta$.
    This averaging, also used in #cite(label("BarakKothariSteurer2018")) Lemma 2.3,
    incurs no factor for the number of fibers. Lemma 7 supplies a padded slice on which that fixed value has
    density at least $alpha$. Project the slice using Lemma 8.
    Its uniform measure projects uniformly, and $tilde(f)$ depends only on the projected matrix.
    The same value therefore has the same density on the resulting slice in $K ⊗ H$,
    with no increase in either count of constraints. ◻
]

We will need random row advice to encounter such a slice,
  rather than merely the existence of one slice somewhere in the table.
  The next erasure argument supplies exactly this averaged guarantee.

#thm([Lemma 2.7.])[
  (Many good row fibers).  #emph[Fix $0 < eta < 1$, and let $alpha \, r \,
    ell_0$ be constants from Theorem 9 with threshold $eta \/ 2$.
    Suppose $ell gt.eq ell_0$ and a partial table on $K ⊗ H$ has defined-equality probability at least $eta$.
    For each linear map $A : K arrow.r bb(F)_2^r$, call a nonempty row fiber ${ M : A M =
    U }$ #emph[good] if there are at most $r$ column specifications and a defined value $y$ such that the
    resulting slice is nonempty and has $f = y$ on at least an $alpha$ fraction of its uniform points. Then
#[#set math.equation(numbering: n => "(2.10)")
 $ Pr_M \[ M upright(" lies in a good row fiber for some ") A \] gt.eq eta \/ 4 . $ <eq:prelim-good-union>]

 Consequently, for independent uniform $A in "Hom" \( K \, bb(F)_2^r \)$ and $M in K ⊗ H$,
#[#set math.equation(numbering: n => "(2.11)")
 $ Pr_(A \, M) \[ upright("the fiber of ") A M upright(" for ") A upright(" is good") \] gt.eq \( eta \/ 4 \)
   2^(- r ell) . $ <eq:prelim-many-fibers>]

 The witnesses can be chosen deterministically from $f \, A \, U$ alone.
   For every good row fiber, any chosen nonempty slice defined by at most $r$ column values has conditional
   uniform probability at least $2^(- r ell)$ inside that row fiber.]
] <lem:many-fibers>

#proof[
  Let $T$ be the union of all good row fibers, over all the $2^(r ell)$ possible row maps.
    Suppose its uniform measure were less than $eta \/ 4$. Erase the table on $T$, obtaining $f_0$.
    Stationarity of the matrix step gives
  $ Pr \[ f_0 \( M \) = f_0 \( M + a h \) eq.not tack.t \] gt.eq
    Pr \[ f \( M \) = f \( M + a h \) eq.not tack.t \] - Pr \[ M in T \] - Pr \[ M + a h in T \] > eta \/ 2 . $
  Theorem 9 gives a defined value of $f_0$ of density at least $alpha$ on a nonempty slice with at most $r$ row
    and $r$ column specifications. Pad its row map by zero output coordinates to make its codomain $bb(F)_2^r$.
    Because $f_0$ is a restriction of $f$, this slice certifies that its row fiber is good for $f$.
    That entire fiber belongs to $T$, where $f_0$ is undefined, a contradiction. This proves Equation (2.10).
  For each $M in T$, at least one of the $2^(r ell)$ maps has a good fiber through $M$.
    Averaging the number of such maps gives Equation (2.11). No statement for every particular row map is needed
    or asserted.
  All vector spaces and value sets involved are finite. After fixing orders on them,
    select the first witnessing list of columns, values, and $y$ for each $\( f \, A \, U \)$.
    This choice uses the row advice and the table, without inspecting any further part of $M$.
    Finally, the column equations restricted to a nonempty row fiber form an affine linear system with at most $r
    ell$ scalar equations. Whenever it is consistent its solution set has relative size $2^(- b)$, where $b lt.eq
    r ell$ is the rank of that system. This proves the stated conditional probability,
    including all dependent and zero-rank cases. ◻
]

All three matrix conclusions apply to quotient spaces without any change of constants.
  In particular, when $H$ is replaced by $H \/ B$, the column functionals produced above belong to
  $\( H \/ B \)^(*)$; their pullbacks to $H$ annihilate $B$.
  The proof adds dummy columns to the quotient itself and removes them by Lemma 8,
  so no functional outside this annihilator is introduced.

== 3 The tree of function spaces and the one-bit test <sec:construction>

We first construct questions whose labels are nonempty parts of a joint-evaluation partition.
  Deleting one output direction gives maps with fibers of size at most two,
  and a satisfying source assignment supplies labels that satisfy every such map.
  We then specify the distribution of tests, obtaining a finite weighted game with perfect completeness.
  Its soundness will be proved in the next four sections; the conversion to the exact alphabets and unweighted
  format of Theorem 1 is deferred to Section 8. The shared questions must forget both the names of their output
  values and every input coordinate that their evaluations cannot distinguish.
  We give this identification explicitly, since it is responsible for both exact folding and the later comparison
  of clause and variable questions.

=== 3.1 Formal slots and pointwise spaces <formal-slots-and-pointwise-spaces>

Let the source game be the fixed power of the clause–variable game from Section 2, and let $t gt.eq
  1$ denote its power. A source left question is an ordered tuple of $t$ clause occurrences.
  For a clause occurrence $c$, write $v \( c \, 1 \) \, v \( c \, 2 \) \,
  v \( c \, 3 \)$ for its three distinct variable IDs in their specified order, and let

$ Omega_c = cal(A)_c = { x in bb(F)_2^3 : x upright(" satisfies ") c } . $

These are actual variable values, with the literal signs accounted for in the satisfaction condition.
  Thus $\| Omega_c \| = 7$, and every coordinate map $x mapsto x_j$, and every pair of distinct coordinate maps,
  is surjective. A source edge chooses one position in each clause.
  Its right question is the resulting ordered tuple of variable IDs and its answer domain is $bb(F)_2^t$.
  Coordinates of this domain remain separate even when two IDs agree.

Fix positive integers $d \, n_1 \, dots.h \, n_d$, row counts $ell_1 \, dots.h \, ell_d$,
  and product counts $R_1 \, dots.h \, R_d$. Let $cal(T)$ be the rooted ordered tree with a single root at level
  $d$, leaves at level $0$, and exactly $n_p$ children at every level-$p$ node.
  Write $cal(T)_p$ for its level-$p$ nodes, and set $K_p = bb(F)_2^(ell_p)$.
  Every location in this fixed tree is part of its indexing, independently of the question ID placed there.

Let $E$ be a tuple of source left questions, one at each leaf.
  Its elementary slots are the formal pairs $\( C \, k \)$ with $C in cal(T)_0$ and $k in \[ t \]$.
  If the clause occurrence at this slot is $c$, its domain is $Omega_c$.
  All slots are distinct factors of a Cartesian product: repeated clause or variable IDs impose no equality
  constraint between their answer coordinates. For any node $D$,
  let $Omega_D \( E \)$ be the product of the elementary-slot domains below $D$,
  and write $Omega \( E \)$ for the root domain.

We will also use a mixed tuple $O$ obtained by replacing some leaf left questions by source right questions along
  specified source edges. At a projected elementary slot the domain is $bb(F)_2$,
  tagged with the selected variable ID. Write $Omega_D \( O \)$ and $Omega \( O \)$ for the resulting products.
  The selected coordinate maps give a surjection

$ pi_D : Omega_D \( E \) arrow.r Omega_D \( O \) . $

Neither the formal location nor the independence of the answer coordinates is changed by projection.
  For example, the right question $\( v \, v \)$ has the legal answer $\( 0 \, 1 \)$,
  although a completeness labeling will not use that answer.

#prodef([Definition 3.1.])[
  (Pointwise function spaces).  For any such tuple $Q$ of clause and variable questions,
    define finite vector spaces over $bb(F)_2$ recursively. At a leaf $C$, set $H_C \( Q \) =
    bb(F)_2^(Omega_C \( Q \))$, the space of all functions from its answer domain to $bb(F)_2$. For every node $C$, set
  $ H_C \( Q \)^2 = "span" { g h : g \, h in H_C \( Q \) } \, wide \( g h \) \( x \) = g \( x \) h \( x \) . $
  At a nonleaf node $D$, put
  #[#set math.equation(numbering: n => "(3.1)")
   $ H_D \( Q \) = sum_(C upright(" child of ") D) H_C \( Q \)^2 med subset.eq med
     bb(F)_2^(Omega_D \( Q \)) . $ <eq:construction-spaces>]
  Here a function on a descendant domain is extended by ignoring every other argument.
    All sums, products and equalities are equalities of actual functions on these product domains,
    rather than formal polynomials.
] <def:spaces>

#thm([Lemma 3.2.])[
  #emph[The spaces in Definition 11 contain $1$ and satisfy $H_C \( Q \) subset.eq H_C \( Q \)^2$.
    For every proper descendant $C$ of $D$,
#[#set math.equation(numbering: n => "(3.2)")
 $ H_C \( Q \)^2 subset.eq H_D \( Q \) . $ <eq:descendant-square-inclusion>]

 Moreover, pullback by $pi_D$ injectively identifies $H_D \( O \)$ with a subspace of $H_D \( E \)$ and preserves
   pointwise multiplication.]
] <lem:construction-space-properties>

#proof[
  Every elementary domain is nonempty, so extension by ignoring arguments is injective.
    At a leaf, the constant $1$ belongs to the full function space.
    Inductively, any child’s constant $1 = 1 dot.op 1$ supplies the constant at its parent.
    Multiplication by $1$ gives $H_C \( Q \) subset.eq H_C \( Q \)^2$. For a child, (3.2) is the definition.
    For a more distant descendant, repeatedly use $H_C \( Q \)^2 subset.eq H_(D') \( Q \) subset.eq
    H_(D') \( Q \)^2$ along the route to $D$.
  Each elementary projection onto a selected bit is surjective; their product $pi_D$ is therefore surjective.
    Consequently pullback is injective on the entire function space and respects sums and products.
    At a leaf its image lies in the full original function space.
    Applying the recursive sum-of-products definition proves the asserted inclusion at every other node. ◻
]

We henceforth use these injective pullbacks without writing their symbols.
  No assertion that the summands in (3.1) form a direct sum is intended.
  In particular their copies of the constant function coincide.

=== 3.2 Joint evaluations and canonical questions <joint-evaluations-and-canonical-questions>

An array at a level-$p$ nonleaf node $D$ is an element $M_D in K_p ⊗ H_D \( E \)$,
  equivalently an ordered list of $ell_p$ rows in $H_D \( E \)$.
  At $x in Omega \( E \)$, its evaluation is the vector $M_D \( x \) in K_p$.
  The full question function of an array family
  $upright(bold(M)) = \( M_D \)_(D in cal(T) \, thin D upright(" nonleaf"))$ is

#[#set math.equation(numbering: n => "(3.3)")
 $ Psi_(E \, upright(bold(M))) : Omega \( E \) arrow.r product_(p = 1)^d product_(D in cal(T)_p) K_p \, wide
   x mapsto \( M_D \( x \) \)_D . $ <eq:joint-question-function>]

Every nonleaf output occurs in this tuple.

For a nonleaf node $D$ at level $p$ and a nonzero direction $a in K_p$,
  let $Q_(D \, a)$ act on the output product in (3.3) by the quotient map $K_p arrow.r
  K_p \/ "span" { a }$ at the $D$ block and by the identity at every other block. Define

#[#set math.equation(numbering: n => "(3.4)")
 $ Psi_(E \, upright(bold(M)))^(D \, a) = Q_(D \, a) Psi_(E \, upright(bold(M))) . $ <eq:quotient-question-function>]

The quotient merges at most two attained output values. To turn this observation into a game constraint,
  we must first specify which representations of a joint function give the same question and which answers are legal.

We now turn an array-valued function into a question without retaining unobservable metadata.
  The construction applies to any finite-valued function $f : Omega \( Q \) arrow.r Y$ on a mixed product domain,
  and in particular to both functions (3.3) and (3.4). The codomain $Y$ may be a product of vector spaces and
  quotient spaces.

An elementary slot $s$ is #emph[unused by $f$] if changing only its argument never changes $f$.
  A clause slot with domain $Omega_c$ is #emph[reducible to position $j$] if,
  for every fixed choice $x_(- s)$ of all other arguments and every $u \, u' in Omega_c$ with $u_j = u'_j$,

#[#set math.equation(numbering: n => "(3.5)")
 $ f \( x_(- s) \, u \) = f \( x_(- s) \, u' \) . $ <eq:global-singleton-factorization>]

Thus one fixed position $j$ must work for the whole joint function, for all choices of the other arguments.

#thm([Lemma 3.3.])[
  #emph[If a used clause slot is reducible to a position, that position is unique.
    The following reductions can be performed simultaneously:
    discard unused slots; replace each used reducible clause slot by its selected bit;
    retain every other used clause slot in full; and retain each used variable slot as its bit.
    They give a surjection $r_f : Omega \( Q \) arrow.r Omega_f$ and a unique induced function $tilde(f) :
    Omega_f arrow.r Y$ such that $f = tilde(f) compose r_f$. The reduced domain and its partition into fibers
    depend only on the equality relation
$ x tilde.op_f x' quad arrow.l.r.double quad f \( x \) = f \( x' \) $

 on the original product domain, not on names of the output values.]
] <lem:canonical-support>

#proof[
  Suppose the clause slot factors through two distinct positions $j \, k$. Fix all other arguments.
    For this section, write the value both as $g \( u_j \)$ and as $h \( u_k \)$.
    Pair-surjectivity gives $g \( b \) = h \( b' \)$ for every $\( b \, b' \) in bb(F)_2^2$.
    Both functions are constant, so this section is constant.
    This holds for every choice of the other arguments, making the slot unused.
  For each slot let its coordinate reduction be the constant map to a one-point set, the selected coordinate map,
    or the identity, according to the stated rule. Each is surjective, hence their product $r_f$ is surjective.
    If $r_f \( x \) = r_f \( x' \)$, replace the slots of $x$ by those of $x'$ one at a time.
    At every replacement the value of $f$ is unchanged by the definition of the reduction at that slot.
    This proves that $f$ is constant on fibers of $r_f$, giving the unique $tilde(f)$.
    One-point factors are removed in the notation $Omega_f$; if all slots disappear, $Omega_f$ is a one-point domain.
  Both unusedness and (3.5) are predicates about pairs of arguments having equal $f$-values.
    They are therefore determined by $tilde.op_f$. So are the coordinate reductions,
    by uniqueness in the used singleton case. Surjectivity then shows that the fiber partition of $tilde(f)$ is
    determined by the same relation. ◻
]

The global quantifier in (3.5) cannot be replaced by a sectionwise choice of position.
  For example, on $Omega_c times bb(F)_2$ the function $f \( x \, b \) = \( 1 + b \) x_1 +
  b x_2$ uses one clause position in each fixed-$b$ section,
  but has no single position through which it factors globally. The canonical reduction retains its clause slot.
  Pair-surjectivity proves uniqueness when a global factorization exists;
  it does not turn these different sectionwise choices into one factorization.

The reduced domain has explicit typed coordinates. At a retained full clause slot we record its formal location,
  clause occurrence ID and triple domain. At a retained bit slot we record its formal location and variable ID,
  with domain $bb(F)_2$. When a clause slot is reduced to a bit,
  its clause occurrence and selected position are discarded. Unused locations are discarded.
  Retained locations are kept in the fixed tree-and-slot order, so equal IDs in distinct slots are never merged. Let

#[#set math.equation(numbering: n => "(3.6)")
 $ cal(P)_f = { tilde(f)^(- 1) \( y \) : y in "im" f } $ <eq:canonical-partition>]

be the #emph[unordered] partition of this reduced domain into nonempty fibers.
  The canonical key $frak(k)_L \( f \)$ consists of a left-side tag, the retained typed coordinates,
  and $cal(P)_f$. Define $frak(k)_R \( f \)$ with a distinct right-side tag.
  The codomain $Y$, names $y$ of its values, array coordinates,
  source projection positions and any sampling choices are not additional fields of a key.
  The typed coordinates and finite subsets in (3.6) have ordinary deterministic finite encodings.

A legal label at this key is a part $P in cal(P)_f$. At a particular representation $f$ of the key,
  define its restored output by

#[#set math.equation(numbering: n => "(3.7)")
 $ "out"_f \( P \) = y quad arrow.l.r.double quad P = tilde(f)^(- 1) \( y \) . $ <eq:restored-output>]

This is a bijection from legal labels to $"im" f$. In particular every restored joint response is realized by one
  $x in Omega \( Q \)$: choose a point of the part and lift it through $r_f$.
  We never allow separately legal block outputs that do not belong to the image of the whole joint function.

#thm([Lemma 3.4.])[
  (Sharing across projected domains).  #emph[Let $O$ be obtained from $E$ by the specified source projections,
    let $pi : Omega \( E \) arrow.r Omega \( O \)$ be their product, and let $f : Omega \( O \) arrow.r
    Y$ be any function. For either side tag, the keys of $f$ and $f pi$ coincide literally,
    with the same parts and the same restored outputs.]
] <lem:canonical-sharing>

#proof[
  At an unprojected slot, unusedness and every candidate singleton factorization are the same for $f$ and $f pi$,
    because the projection of all other arguments is surjective.
    At a projected slot, unusedness is likewise equivalent by surjectivity.
    If the slot is used by $f$, then $f pi$ factors through its selected position and is used.
    Lemma 13 makes that position its unique singleton reduction.
    Both representations consequently retain the same formal location and selected variable ID,
    with the same bit domain; neither retains the original clause occurrence or projection position there.
    These observations identify their reduced domains. On that common domain the two induced functions are
    identical, since the relevant product maps are surjective and both lift to $f pi$.
    Their fiber partitions and restored values therefore agree. ◻
]

Take as vertices all keys of the indicated side obtainable from mixed tuples of source questions,
  arbitrary arrays in their prescribed spaces, and, on the right,
  one quotient at a nonleaf node in a nonzero direction. Every key used by the sampling law below belongs to this
  set. Keys never used by a test have zero incident weight and may be assigned any legal part.
  Equivalently, a labeling of the positive-weight vertices can always be extended to these auxiliary keys.
  Because the definition identifies keys before choosing labels,
  all such extensions retain the exact sharing identity of Lemma 14.

=== 3.3 One-bit constraints and perfect completeness <one-bit-constraints-and-perfect-completeness>

Fix an array family on $E$, a nonleaf node $D$ at level $p$, and $a in K_p \\ { 0 }$.
  Put $f = Psi_(E \, upright(bold(M)))$ and $g = Q_(D \, a) f$.
  The edge joins $frak(k)_L \( f \)$ to $frak(k)_R \( g \)$ and has the following map on legal parts:

#[#set math.equation(numbering: n => "(3.8)")
 $ pi_(f \, D \, a) \( P \) = "out"_g^(- 1) #scale(x: 120%, y: 120%)[\(] Q_(D \, a) "out"_f \( P \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:legal-edge-map>]

The argument of the inverse belongs to $"im" g$, since $"out"_f \( P \) in "im" f$.
  These edge records define the constraints that our game may use.
  We specify their sampling distribution at the end of this section.
  Distinct records may have identical endpoints and may be combined only when their actual maps agree.

#thm([Lemma 3.5.])[
  #emph[Every map (3.8) is a well-defined surjection between nonempty legal label sets and has at most two
    preimages per right label. For a fixed labeling, acceptance of the edge is exactly equality of its restored
    outputs through $Q_(D \, a)$.]
] <lem:construction-two-fibers>

#proof[
  Restoration is a bijection between parts and attained values on each side.
    Since $g = Q_(D \, a) f$, every attained $g$-value has a preimage among attained $f$-values.
    This proves surjectivity and the acceptance description. The linear map $Q_(D \, a)$ has kernel consisting of
    the zero vector and the vector supported at $D$ with value $a$.
    Hence every fiber on the entire output space has exactly two elements,
    and its intersection with $"im" f$ has at most two. Applying the two restoration bijections proves the claimed
    fiber bound. This argument is unchanged if the two question functions retain different input supports. ◻
]

The local label sets have a uniform finite bound once the parameters are fixed.
  Indeed, if $N = \| cal(T)_0 \|$, every mixed answer domain has size at most $7^(t N)$,
  so every legal partition has at most $7^(t N)$ parts. The canonicalization and each edge map can be computed by
  enumerating these finite domains. Quantitative polynomial-time and weight-removal details will be given when the
  parameters have been chosen.

#thm([Proposition 3.6.])[
  (Perfect completeness).  #emph[If the source clause instance has a satisfying assignment,
    every constraint just defined is satisfied by one common legal labeling,
    for every choice of the positive integer parameters. Consequently every game supported on these constraints
    has value one.]
] <prop:completeness>

#proof[
  Let $xi$ be a satisfying assignment to all source variables.
    At a canonical key, assign each retained full clause coordinate the corresponding satisfying triple from $xi$,
    and each retained bit coordinate its variable value under $xi$.
    These choices form a point of the reduced domain, even if IDs recur at distinct locations.
    Label the vertex by the unique part containing this point.
    This prescription depends only on the typed coordinates and partition in the key,
    so it gives one consistent label at every shared vertex.
  For any original tuple $E$, the assignment $xi$ gives a legal point $x_xi in
    Omega \( E \)$ whose support reduction is exactly the point just prescribed at either endpoint.
    The restored outputs are therefore $f \( x_xi \)$ and $g \( x_xi \)$, respectively.
    Their equality through $Q_(D \, a)$ follows from $g = Q_(D \, a) f$, so Lemma 15 shows that the edge accepts.
    Every constraint therefore accepts, proving the assertion. ◻
]

=== 3.4 Algebraic identities forced by joint answers <algebraic-identities-forced-by-joint-answers>

Evaluation tables and folding are standard mechanisms in PCP constructions; see Bellare,
  Goldreich and Sudan #cite(label("BellareGoldreichSudan1998")) Section 3.3.
  Here the canonical joint partition forces an exact algebraic identity on every labeling.
  It allows an upper array to absorb products of already displayed descendant rows,
  including all relations among those products.

#thm([Lemma 3.7.])[
  (Joint folding).  #emph[Fix a full array question on $Omega \( Q \)$ and a nonleaf node $D$.
    For each row index $h$ of $M_D$, choose
#[#set math.equation(numbering: n => "(3.9)")
 $ b_h = c_h 1 + sum_(C \, u \, v) lambda_(h \, C \, u \, v) \( M_C \)_u \( M_C \)_v \, wide c_h \,
   lambda_(h \, C \, u \, v) in bb(F)_2 \, $ <eq:folding-shift>]

 where $C$ ranges over any collection of proper nonleaf descendants of $D$ and $u \, v$ over their displayed rows.
   Let $tilde(upright(bold(M)))$ replace $\( M_D \)_h$ by $\( M_D \)_h + b_h$ and keep every other array fixed.
   Then $tilde(upright(bold(M)))$ is a valid array family and its full question has exactly the same canonical key
   as that of $upright(bold(M))$. For any fixed label at this key,
   write $y_C$ and $tilde(y)_C$ for its restored block outputs. They satisfy
#[#set math.equation(numbering: n => "(3.10)")
 $ tilde(y)_C = y_C quad \( C eq.not D \) \, wide \( tilde(y)_D \)_h = \( y_D \)_h + c_h +
   sum_(C \, u \, v) lambda_(h \, C \, u \, v) \( y_C \)_u \( y_C \)_v . $ <eq:folding-output>]

 The same statement holds for a question with quotient blocks whenever the shift uses only unchanged scalar rows
   actually displayed in that question; a shift at a quotient block is interpreted through its quotient map.]
] <lem:folding>

#proof[
  By Lemma 12, every term in (3.9) lies in $H_D \( Q \)$, proving validity.
    On the full output product, define a transformation that fixes every block other than $D$ and adds the
    displayed polynomial in those blocks to block $D$. Applying this transformation twice is the identity:
    its input blocks remain fixed, and addition is in characteristic two.
    It is therefore a bijection, and the new joint function is this bijection composed with the old joint
    function. The two functions have identical equality relations on $Omega \( Q \)$.
    Lemma 13 gives the same coordinate reduction and the same unordered partition.
    Thus a fixed part represents precisely the same set of reduced arguments in both questions,
    and evaluating either function on any such argument gives (3.10).
  For quotient blocks use the identical triangular transformation on the product of displayed quotient spaces.
    Its inverse is again itself because all arguments of the added expression are unchanged displayed outputs.
    The previous proof applies verbatim. No action on labels is assumed to be free,
    and no choice of a representative assignment is needed to define the identity. ◻
]

#thm([Lemma 3.8.])[
  (Joint evaluation of product generators).  #emph[Fix a legal response to a full array question and a node $D$.
    For any collection $cal(C)$ of proper nonleaf descendants of $D$, let
$ B = "span" #scale(x: 120%, y: 120%)[\(] { 1 } union { \( M_C \)_u \( M_C \)_v : C in cal(C) \, med 1 lt.eq u \,
  v lt.eq ell_("level" \( C \)) } #scale(x: 120%, y: 120%)[\)] subset.eq H_D \( Q \) . $

 If $y_C$ are the restored outputs, there is a unique linear functional $b_y : B arrow.r
   bb(F)_2$ such that $b_y \( 1 \) = 1$ and $b_y \( \( M_C \)_u \( M_C \)_v \) = \( y_C \)_u \( y_C \)_v$.
   The functional $b_y$ extends to $H_D \( Q \)^(*)$. Every such extension $z$ has value $1$ on the constant
   function, and its matrix on these products at each $C$ is $y_C y_C^(sans(t))$, of rank at most one.]
] <lem:joint-evaluation>

#proof[
  The restored response has one realizing assignment $x in Omega \( Q \)$.
    Point evaluation at $x$ restricts to a linear functional on $B$ and has the stated generator values.
    This proves that every pointwise linear relation between the generators is respected,
    including relations involving different descendants. The generators span $B$,
    so this functional is unique and depends only on the displayed $y_C$.
    Extend a basis of $B$ to a basis of $H_D \( Q \)$ and assign arbitrary values on the added basis vectors to
    obtain an extension. Any extension has the same generator values,
    giving the asserted outer product at each descendant. ◻
]

The use of all relevant descendant outputs in Lemma 18 will allow one upper quotient table to handle every
  possible lower node. A label always supplies those outputs together;
  selecting a single descendant is not part of the vertex key.

=== 3.5 The distribution of tests <the-distribution-of-tests>

The low-rank, Hadamard-bucket viewpoint is inspired by Golowich’s construction #cite(label("Golowich2023")),
  as mediated by Fei–Minzer–Wang #cite(label("FeiMinzerWang2026")).
  The sampler here is a recursive-product redesign with separate independent calls.
  We prove its sampling estimates below; no expansion theorem or identical sampler from those works is assumed.

We now choose an original tuple $E$, an array family, a node,
  and an omitted direction to sample one of the preceding constraints.
  Sample a source left question independently at each leaf, using the source left marginal,
  and denote the resulting tuple by $E$.

Independently of $E$, sample a path $sans(P) = \( D_d \, D_(d - 1) \, dots.h \, D_0 \)$ by choosing $D_(p - 1)$
  uniformly among the children of $D_p$, successively for $p = d \, dots.h \, 1$.
  We next define scalar laws conditional on $E$ and this whole path.
  The procedure $"Sample" \( D_p \)$ returns a function in $H_(D_p) \( E \)$.
  At $p = 0$ it returns an independent uniform element of $H_(D_0) \( E \)$.
  At $p gt.eq 1$, write $C_(*) = D_(p - 1)$ for the path child and make the following independent draws:

$ U_C tilde.op "Unif" \( H_C \( E \)^2 \) quad \( C eq.not C_(*) \) \, wide G_h \,
  H_h tilde.op "Sample" \( C_(*) \) quad \( 1 lt.eq h lt.eq R_p \) . $

Return

#[#set math.equation(numbering: n => "(3.11)")
 $ "Sample" \( D_p \) = sum_(C eq.not C_(*)) U_C + sum_(h = 1)^(R_p) G_h H_h . $ <eq:scalar-sampler>]

Its conditional law is denoted $nu_(D_p)$; the dependence on $E$ and the path below $D_p$ is suppressed in this
  notation. An empty sum over ordinary children is zero. By (3.1), every returned function lies in the claimed space.

Every invocation of $"Sample"$ uses a new random tape for the entire recursive call tree.
  In particular the two factors in one product, the factors in different products,
  and calls made on behalf of different displayed arrays are independent conditional on $E \, sans(P)$.
  Visiting the same geometric node in two calls does not reuse a value.
  Uniform functions in ordinary children are drawn directly from the stated spaces;
  they do not refer to the displayed arrays in those children.

For every nonleaf path node $D_p$, $1 lt.eq p lt.eq d$, independently take a fresh sample $h_(p \, v) tilde.op
  nu_(D_p)$ for each $v in K_p \\ { 0 }$ and set

#[#set math.equation(numbering: n => "(3.12)")
 $ M_(D_p) = sum_(v in K_p \\ { 0 }) v ⊗ h_(p \, v) . $ <eq:array-bucket-sampler>]

We refer to the summands indexed by $v$ as buckets; $v$ is a bucket direction in $K_p$, not a row map.
  For every nonleaf node off the path, take $M_D$ uniform in $K_("level" \( D \)) ⊗ H_D \( E \)$.
  All these displayed arrays use separate random tapes. Thus, conditional on $E \, sans(P)$,
  the displayed arrays are independent, including a path array and an ancestor array whose scalar calls pass
  through that path node. They need not be independent after the common path is averaged out.
  The same definitions apply to any mixed tuple $O$ in its own function spaces.
  Later modifications will explicitly replace calls at a specified cut by uniform draws.

Figure 1, beside the decoder input definitions, depicts the two cuts and the distinction between a node and
  separate calls at that node.

Only the canonical key of the joint function (3.3) is supplied as the left question.
  The path, buckets, and internal tapes determine its distribution and are not appended to that key.

To specify all candidate tests on the sampled array family, draw independently

$ a_p tilde.op "Unif" \( K_p \\ { 0 } \) \, wide 1 lt.eq p lt.eq d \, $

independently of the preceding data. At level $p$ use the quotient $Q_(D_p \, a_p)$;
  abbreviate it to $Q_(p \, a_p)$. The actual test chooses $p$ uniformly from $\[ d \]$, independently,
  and uses the edge with left question $frak(k)_L \( Psi_(E \, upright(bold(M))) \)$,
  right question $frak(k)_R \( Psi_(E \, upright(bold(M)))^(D_p \, a_p) \)$, and projection (3.8).
  This finite distribution of edge records defines the preliminary weighted game.
  Equivalently, one may draw only the direction belonging to the chosen level.
  Sampling all directions specifies a joint law of the candidate tests whose individual marginals are precisely
  this test.

By Proposition 16, the game has perfect completeness. The remaining sections prove its soundness by analyzing what
  a successful labeling reveals about the sampled arrays.

== 4 Changing the sampling law without revealing the path <sec:sampling>

The decoding argument will use uniform matrices at two different levels.
  Here we prove the distributional comparisons that permit those changes. There are two distinct conclusions:
  a total-variation comparison of the #emph[displayed functions],
  and a posterior bound for a child selected after inspecting those functions.
  Neither conclusion permits disclosure of the hidden path or of the projection mask.
  All statements below hold conditional on the complete original question tuple $E$;
  consequently they also hold after averaging over $E$, uniformly in the size of the source instance.
  We first replace the recursive draws at a cut by uniform draws,
  then compare that law with one in which a sparse set of children is projected.
  Each comparison retains only the observation specified in its lemma.

For probability measures on a finite set, use

$ "TV" \( P \, Q \) = 1 / 2 sum_x \| P \( x \) - Q \( x \) \| \, wide chi^2 \( Q bar.v.double P \) =
  bb(E)_P \[ \( d Q \/ d P - 1 \)^2 \] $

when $Q lt.double P$. Cauchy–Schwarz gives $"TV" \( P \, Q \) lt.eq 1 / 2 sqrt(chi^2 \( Q bar.v.double P \))$.
  An observation formed by a deterministic map cannot increase total variation:
  its discrepancy on an event is the discrepancy on that event’s inverse image.
  The same assertion holds on adjoining independent randomness and applying a randomized map,
  by conditioning on that randomness. These elementary facts will let us retain complete assembled queries without
  treating their components as independent.

=== 4.1 Stopping the ancestor generators <stopping-the-ancestor-generators>

A scalar call means one invocation of the law $nu_D$ defined in Section 3, with its own fresh random choices.
  Write $b_p = 2^(ell_p) - 1$ and $c_p = 2 R_p$. For a fixed path prefix ending at a node $D_p$ of level $p$,
  a call at a higher path node branches into exactly $c_h$ independent calls at its path child when it crosses
  level $h$. Its ordinary child contributions are uniform functions supported outside that child and require no
  calls farther down the distinguished path.

#thm([Lemma 4.1.])[
  (Stopped-call representation).  #emph[Fix $E$ and the path from the root through $D_p$,
    including $D_p$ but no choice of its child. The original sampling can be generated as follows.
    First generate an exterior record $Xi_p$ consisting of the random choices outside $D_p$’s subtree,
    with every recursive call reaching $D_p$ left unevaluated.
    Then generate the pending scalar calls at $D_p$, its own buckets, and the arrays strictly below $D_p$.
    Every displayed array is a deterministic function of this record and these remaining values.]
  #emph[The pending ancestor calls together with the own buckets number at most
#[#set math.equation(numbering: n => "(4.1)")
 $ T_p = sum_(k = p)^d b_k product_(h = p + 1)^k c_h . $ <eq:stopped-count>]

 An empty product is one. If $e_k$ additional fresh scalar draws are requested at each level $k gt.eq p$,
   a sufficient bound is
#[#set math.equation(numbering: n => "(4.2)")
 $ T_p \( e \) = sum_(k = p)^d \( b_k + e_k \) product_(h = p + 1)^k c_h . $ <eq:stopped-extra-count>]

 In particular, replacing one level-$k$ bucket uses one extra draw and adds $product_(h = p + 1)^k
   c_h$ calls at the cut. The count is independent of $n_p$ and of all higher branching numbers.]
  #emph[Conditional on the full path, distinct stopped calls have independent randomness.
    Pending ancestor calls are independent of the tapes of the actual arrays at or below the cut;
    own buckets are independent of the tapes of actual descendant arrays.
    Calls for the own buckets and calls pending from ancestors are distinct even when they sample the same
    function space. The exterior record can be exposed before sampling the continuation of the path.
    Already assembled ancestor arrays are deterministic outputs of the construction and are not independent
    exterior information.]
] <lem:stopped-calls>

#proof[
  Expand each of the $b_k$ scalar buckets used for the actual matrix at $D_k$, for every $k gt.eq p$.
    A call at level $h > p$ is a sum of ordinary-child uniform functions and $R_h$ products of two fresh calls at
    the path child. Stop each of those factors the first time it reaches $D_p$.
    Thus a bucket originating at level $k$ produces exactly $product_(h = p + 1)^k c_h$ stopped calls.
    Adding over $k$ proves (4.1); expanding additional calls proves (4.2).
    Ordinary children at every step are disjoint from $D_p$’s subtree,
    so their contributions can be generated before any path choice below $D_p$.
  Give each recursive invocation a separate random tape, indexed by its originating matrix,
    bucket and sequence of factor indices. These indices are distinct even if two invocations visit the same node.
    The sampler’s fresh-call convention says precisely that these tapes and the tapes of actual descendant
    matrices are independent, conditional on the shared path.
    All unevaluated expressions are finite expressions involving sums and pointwise products.
    Filling their stopped leaves therefore reconstructs every ancestor array deterministically.
    The expression may involve many exterior functions when higher branching is large,
    but its number of stopped leaves is still (4.1). This proves all the assertions. ◻
]

We will also use an equivalent representation after uniformizing the cut.
  Instead of generating $M_(D_p)$ from $b_p$ uniform buckets, generate its $ell_p$ rows as separate uniform draws.
  The relevant number of calls is then

#[#set math.equation(numbering: n => "(4.3)")
 $ hat(T)_p = ell_p + sum_(k = p + 1)^d b_k product_(h = p + 1)^k c_h . $ <eq:direct-cut-count>]

We reserve $hat(T)_p$ for the displayed original call family.
  If a comparison adds $e$ independent uniform rows, where $e$ is fixed, its enlarged count is $hat(T)_p + e$.
  For instance, forming a uniform matrix together with one rank-one step from it requires its rows and one
  additional independent scalar draw, giving the count $hat(T)_p + 1$.
  These rows have separate tapes from the ancestor calls. If visibility of upper buckets will later be chosen by a
  row map $A$, predetermine calls for #emph[all] buckets before choosing which are visible.
  Selecting or discarding calls afterward adds no dependence to the count.

=== 4.2 Finite child blocks and a hidden special child <finite-child-blocks-and-a-hidden-special-child>

Fix a level-$p$ cut $D = D_p$ and an integer $t_(upright("cut"))$ bounding all scalar draws retained at that cut.
  For a child $C$ of $D$, put $V_C = H_C \( E \)^2$ and define the following finite product space:

#[#set math.equation(numbering: n => "(4.4)")
 $ cal(X)_C = V_C^(t_(upright("cut"))) times product_(T subset.eq C\
T upright(" nonleaf")) \( K_("level" \( T \)) ⊗ H_T \( E \) \) . $ <eq:raw-child-block>]

Here $T subset.eq C$ means that $T$ is $C$ or a descendant of $C$.
  A block $X_C$ records a separate child contribution to each of the $t_(upright("cut"))$ cut draws and the actual
  arrays throughout this child’s subtree. The factors used internally to generate a special contribution are not
  included in $X_C$. Each recorded contribution is just a function in $V_C$.

Let $P_C$ be uniform on $cal(X)_C$. To construct independent uniform cut draws,
  sample these blocks independently and, for each draw, add its child contributions.
  This uses a latent product of spaces even though the actual spaces $V_C$ share the constant functions. Indeed the map

$ product_(C upright(" child of ") D) V_C arrow.r H_D \( E \) \, wide \( u_C \)_C mapsto sum_C u_C $

is a surjective linear map. Every fiber is a coset of its kernel, so the image of uniform measure is uniform.
  Separate copies give independent uniform cut draws, independently of all descendant arrays.
  No direct-sum decomposition, or recovery of the summands from their sum, is asserted.

There is a uniform finite density bound for any law on $cal(X)_C$.
  For clarity, if the source’s legal assignment domains have size at most $a$, put $N_0 = 1$ and $N_k =
  product_(h = 1)^k n_h$. Every space on a level-$k$ subtree has dimension at most $a^(N_k)$.
  Thus, for children at level $p - 1$,

#[#set math.equation(numbering: n => "(4.5)")
 $ dim cal(X)_C lt.eq D_p \( t_(upright("cut")) \) := a^(N_(p - 1))
   (t_(upright("cut")) + sum_(k = 1)^(p - 1) ell_k product_(h = k + 1)^(p - 1) n_h) . $ <eq:block-dimension-bound>]

In particular we may use $L_p \( t_(upright("cut")) \) = 2^(D_p \( t_(upright("cut")) \))$.
  Every probability law $Q_C$ on $cal(X)_C$ has density $q_C = d Q_C \/ d P_C lt.eq L_p \( t_(upright("cut")) \)$,
  since each $P_C$ atom has mass $2^(- dim cal(X)_C)$. This bound uses the source alphabet,
  the fixed row and repetition counts through $t_(upright("cut"))$, and branching below $p$.
  It uses neither $n_p$, higher branching, source question identities, nor the source instance size.
  Any larger fixed common bound will also be denoted by $L_p$.

#thm([Lemma 4.2.])[
  (One hidden child).  #emph[In the original experiment, expose $E$, the path through $D_p$,
    and the exterior record of Lemma 19. Forget the entire continuation of the path below $D_p$.
    Retain any fixed family of stopped scalar values, the own buckets at $D_p$, and all actual arrays below $D_p$.
    Let $sans(U)_p$ be the #emph[unrestricted experiment]: replace the retained cut scalar values by independent
    uniform draws in $H_(D_p) \( E \)$, and replace all descendant arrays by independent uniform arrays in their
    respective spaces, retaining the same exterior record and reconstruction expressions. Then
#[#set math.equation(numbering: n => "(4.6)")
 $ "TV" \( sans(A)_p \, sans(U)_p \) lt.eq epsilon_p^(upright("cut")) := frac(L_p, 2 sqrt(n_p)) $ <eq:cut-tv-bound>]

 for the retained values and for every deterministic observation of them.
   Here $sans(A)_p$ denotes the corresponding retained original law,
   and $L_p$ can be chosen using (4.5) with the count in (4.2).]
  #emph[One may also append a fixed number of independent uniform cut rows,
    or a fixed number of fresh bucket replacements, with the appropriate increased count.
    The bound includes the reconstructed ancestor arrays and candidate edge tests at levels at least $p$,
    with independent quotient directions. It does not include a tag identifying the next path child,
    any later path indices, or the internal factor tapes generating a special child block.]
] <lem:cut-tv>

#proof[
  Condition on $E$, the prefix and the exterior record. Let $J$ be the next path child, uniform among $n =
    n_p$ children. Given $J = C$, every block other than $X_C$ has law $P_(C')$:
    all its scalar contributions are ordinary-child uniforms,
    and all its subtree matrices are off the path and uniform. They are independent of one another and of $X_C$.
    Within $X_C$, the scalar contributions are sums of $R_p$ products from fresh factor calls,
    and its subtree arrays use the continued path. Average over that continuation to obtain a law $Q_C$ on (4.4).
    Correlations among the coordinates of this one block cause no difficulty. Its density $q_C$ is bounded by $L_p$.
  Relative to $P = product_C P_C$, the original raw-block law has density
  $ Z = 1 / n sum_C q_C \( X_C \) . $
  Under $P$ these summands are independent and have expectation one. Therefore
  $ bb(E)_P \[ \( Z - 1 \)^2 \] = 1 / n^2 sum_C bb(E)_(P_C) \[ \( q_C - 1 \)^2 \] lt.eq L_p^2 / n . $
  The total-variation bound follows by Cauchy–Schwarz. Summing the child contributions and reconstructing all
    pending expressions is the same deterministic map in both laws, so it preserves the bound.
    It remains valid conditional on every exterior record and hence on averaging that record.
    Fresh bucket replacements merely enlarge the finite family of scalar calls;
    independent uniform cut rows add uniform coordinates to every block. Both are covered by the same argument.
    A revealed value of $J$ would replace the average density by $q_J$ and would lose the factor $n^(- 1 \/ 2)$,
    which explains the required information restriction. ◻
]

In $sans(U)_p$, the own buckets are separate from the pending ancestor calls and the descendant matrices.
  The matrix $M = sum_(v in K_p \\ { 0 }) v h_v$ is uniform:
  the linear map from its uniform buckets onto $K_p ⊗ H_(D_p) \( E \)$ is surjective,
  since the standard basis vectors occur among the indices.
  Replacing $h_a$ by an independent uniform $h_a^(*)$, for an independent nonzero $a in K_p$, gives

#[#set math.equation(numbering: n => "(4.7)")
 $ M^(*) = M + a h \, wide h = h_a + h_a^(*) . $ <eq:unrestricted-step>]

Conditional even on all old buckets, $h$ is uniform and independent of the old data.
  Thus this is exactly the uniform rank-one step, and $M$ is independent of the other displayed arrays and the
  pending ancestor calls. This conclusion would not follow by reusing a bucket as an ancestor call.

=== 4.3 Sparse projection and its posterior <sparse-projection-and-its-posterior>

The next comparison is a form of sub-code covering: a sparse restriction leaves the lifted query law nearly
  unchanged. This method appears in Khot and Safra #cite(label("KhotSafra2013")) Section 3.4,
  with advice-conditioned thinning estimates in Dinur, Khot, Kindler,
  Minzer and Safra #cite(label("DinurKhotKindlerMinzerSafra2018")) Lemma 5.5, full version and Fei,
  Minzer and Wang #cite(label("FeiMinzerWang2026")) Propositions 4.7–4.8 and 5.5.
  Here the independent units are entire child subtrees, whose records include all stopped-call contributions and
  displayed descendant arrays. We prove the comparison and posterior estimate for these finite blocks.

At a level-$i$ cut $D_i$, independently mark each child with probability $beta_i = n_i^(- 2 \/ 3)$;
  take $n_i > 1$ to be a cube. At every leaf in a marked child,
  sample a source projection conditional on its left question, and replace that question by its right question.
  Leave all other questions unchanged, and call the resulting tuple $O$.
  Pullback along these projections identifies $H_T \( O \)$ with a subspace of $H_T \( E \)$ and preserves
  pointwise multiplication. Define $sans(M)_i$, the #emph[modified experiment],
  by stopping all ancestor calls at $D_i$ and making their values independent uniform draws in $H_(D_i) \( O \)$.
  Also sample $M_(D_i)$ and all its descendant matrices independently uniformly in the corresponding projected
  spaces. Reconstruct all ancestors by the original stopped expressions. Path choices below $i$ are unused.
  Independent extra cut rows and bucket replacements are treated in the same way.
  The original unmodified law will be denoted by $sans(A)$.

#thm([Lemma 4.3.])[
  (Sparse projection comparison).  #emph[Fix $E$, the path through $D_i$ and an exterior record generated without
    the projections. Compare $sans(M)_i$ and $sans(U)_i$ as laws of lifted functions on $E$, forgetting the marks,
    the projection choices, and the projected-question tuple $O$.
    All raw child summands and descendant arrays may be retained. For a bound $L_i$ from (4.5),
#[#set math.equation(numbering: n => "(4.8)")
 $ "TV" \( sans(M)_i \, sans(U)_i \) lt.eq epsilon_i^(upright("spr")) := 1 /
   2 sqrt(\( 1 + beta_i^2 L_i^2 \)^(n_i) - 1) . $ <eq:sparse-tv-bound>]

 The bound holds for any fixed number of independent extra cut rows and fresh higher-level bucket draws,
   with their enlarged call count. In particular it holds for observations containing the assembled ancestor
   arrays and both candidate tests at levels $i < j$.]
  #emph[Consequently the modified experiment and the original experiment have observation distance at most
    $epsilon_i^(upright("spr")) + epsilon_i^(upright("cut"))$ when the path below $i$ is forgotten.
    For the further comparison at a level $j > i$, require the observation to be a common deterministic function
    of the exterior record $Xi_j$, the retained scalar values at $D_j$ (including its own buckets and any extra
    cut draws), all displayed arrays strictly below $D_j$, and independent auxiliary choices.
    Here $E$ and the path through $D_j$ are fixed. Such an observation may include reconstructed ancestors and
    descendant arrays with their tree locations, but it cannot use the hidden continuation of the path or the
    internal decompositions of the retained scalar values. In particular,
    a selected lower-level test is permitted only if it is determined by these data without using the hidden path.
    The distance from the corresponding unrestricted-$j$ observation is then at most
#[#set math.equation(numbering: n => "(4.9)")
 $ epsilon_i^(upright("spr")) + epsilon_i^(upright("cut")) + epsilon_j^(upright("cut")) . $ <eq:two-cut-triangle>]

]
] <lem:sparse-tv>

#proof[
  For a child $C$ of $D_i$, let $P_C$ be uniform on the unprojected block (4.4).
    Conditional on marking $C$, average over all its projection choices and lift the independent projected uniform
    contributions and arrays to $E$; call the resulting law $Q_C$.
    It is a law on the same finite set, so $q_C = d Q_C \/ d P_C lt.eq L_i$.
    Different children use independent marks, projections and tapes. Thus their lifted blocks have product law
  $ product_C #scale(x: 120%, y: 120%)[\(] \( 1 - beta_i \) P_C + beta_i Q_C #scale(x: 120%, y: 120%)[\)] \, $
  whose density with respect to $product_C P_C$ is $product_C \( 1 + beta_i \( q_C - 1 \) \)$.
    Squaring and using independence yields the exact identity
  $ 1 +
    chi^2 #h(-0.16667em)
    (product_C \( \( 1 - beta_i \) P_C + beta_i Q_C \) thin mid(bar.v.double) thin product_C P_C) =
    product_C #scale(x: 120%, y: 120%)[\(] 1 + beta_i^2 chi^2 \( Q_C bar.v.double P_C \)
    #scale(x: 120%, y: 120%)[\)] lt.eq \( 1 + beta_i^2 L_i^2 \)^(n_i) . $
  This proves (4.8). Uniform cut rows are obtained by the same addition map in both laws.
    A uniform matrix can be represented either by independent rows or by independent uniform buckets,
    as proved above; choose the latter representation when retaining a bucket replacement.
    Additional calls simply add coordinates to each finite block.
  All higher arrays, and their quotients in a candidate test, are functions of the blocks,
    exterior record and independent test directions. Data processing therefore proves their bounds,
    without conditioning on their realized values. The comparison with $sans(A)$ is the triangle through
    $sans(U)_i$ and Lemma 20. For (4.9), take the common observation just specified.
    First average the preceding $i$-cut comparison over the prefix between levels $j$ and $i$,
    and then apply Lemma 20 at $j$ to the original law. A pending scalar value at $j$ is an output of the $i$-cut
    reconstruction and is a retained cut draw in the $j$-cut comparison, so it can be included throughout.
    The internal factor choices within its subtree cannot be included in the latter comparison.
    This establishes precisely the stated triangle. ◻
]

===== 4.3.1 Common observations in the three comparisons. <sec:law-guide>

The laws just defined serve different purposes, and each comparison forgets different information:

Lemma 20 replaces the cut draws and descendant arrays by uniforms after forgetting the path below that cut.
  The observation may include the ancestors reconstructed from those draws.

Lemma 21 compares lifted functions on $E$ after forgetting $O$, the projection choices, and the marks.
  Raw child contributions and all displayed descendant arrays may be retained.

For $j > i$, Equation (4.9) applies to a common function of the upper-cut record specified in Lemma 21.
  That record retains pending scalar values there, but not their internal decompositions,
  and all displayed descendant arrays. The observation cannot select among those arrays using the hidden path.

The sparse product calculation also gives a posterior bound for a child selected after seeing the lifted matrices.
  This is stronger than a bound for a child fixed in advance,
  and will allow the lower decoder to choose a witness from its observed data.

#thm([Lemma 4.4.])[
  (Posterior bound for adaptive witnesses).  #emph[In $sans(M)_i$, condition on $E$,
    the path through $D_i$ and a permissible exterior record.
    Let $X = \( X_C \)_C$ consist of all lifted raw child blocks,
    including any fixed number of independent uniform cut rows.
    Let $cal(G)$ be the sigma-algebra generated by these data and additional independent random choices,
    such as a test direction or fixed full strategy tapes. It contains neither projected-question metadata nor
    projection marks. For every child $C$, almost surely,
#[#set math.equation(numbering: n => "(4.10)")
 $ bb(P) \( C upright(" marked") divides cal(G) \) lt.eq q_i := frac(beta_i L_i, 1 - beta_i) . $ <eq:posterior-bound>]

 If a set $cal(C) \( X \)$ of at most $m$ children is selected measurably from these data, then
#[#set math.equation(numbering: n => "(4.11)")
 $ bb(P) \( cal(C) \( X \) upright(" contains a marked child") \) lt.eq m q_i . $ <eq:adaptive-child-bound>]

 Both assertions remain valid for a coarsening of this information.]
  #emph[In particular, let $F_0 \, F_1$ be bilinear forms on $H_(D_i) \( E \)$ determined by these lifted data. Then
#[#set math.equation(numbering: n => "(4.12)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] F_0 eq.not F_1 \, med F_0 \|_(H_(D_i) \( O \) times H_(D_i) \( O \)) =
   F_1 \|_(H_(D_i) \( O \) times H_(D_i) \( O \)) #scale(x: 120%, y: 120%)[\)] lt.eq 2 q_i \,
   $ <eq:adaptive-bilinear-error>]

 where the restrictions in this display mean restriction of both arguments to $H_(D_i) \( O \)$.
   No part of the statement conditions on strategy success, a right output, a slice event, or a witness-matching event.]
] <lem:posterior>

#proof[
  Conditional on the fixed exterior data, child independence and Bayes’s formula give,
    simultaneously at every lifted block tuple with positive probability,
  $ bb(P) \( C upright(" marked") divides X \) = frac(beta_i q_C \( X_C \), 1 - beta_i + beta_i q_C \( X_C \))
    lt.eq frac(beta_i L_i, 1 - beta_i) . $
  Independent extra choices do not change this conditional formula.
    For an adaptively selected set, condition on $cal(G)$ first and use
  $ bb(E) [sum_(C in cal(C) \( X \)) upright(bold(1))_({ C upright(" marked") }) med mid(bar.v) med cal(G)]
    lt.eq \| cal(C) \( X \) \| q_i lt.eq m q_i . $
  Taking expectations and a union bound proves (4.11); the tower property proves the coarsened versions.
    There is no factor for the total number of available children.
  For the bilinear consequence, write $Delta = F_0 - F_1$. Since $H_(D_i) \( E \) = sum_C H_C \( E \)^2$,
    if $Delta eq.not 0$, then there are children $C_1 \, C_2$ and functions $x in H_(C_1) \( E \)^2$,
    $y in H_(C_2) \( E \)^2$ with $Delta \( x \, y \) = 1$. Indeed decompose a pair on which $Delta$ is nonzero
    into such sums and expand bilinearly; at least one summand is nonzero.
    Fix orders on the finite spaces and choose the first such witness from the lifted data.
    The children may coincide. If neither is marked, their spaces are unchanged and lie in $H_(D_i) \( O \)$,
    so the two restricted forms cannot be equal. The bad event in (4.12) is therefore contained in the event that
    one of at most two adaptively selected children is marked. Apply (4.11) with $m = 2$. ◻
]

The distinction from success conditioning is substantive:
  after the unconditional bad-event probability is bounded, it may be subtracted from any success probability.
  The posterior estimate itself need not hold within that success event.
  Exposing a direction $a_i$ to the analyst does not provide it to the left strategy.
  Likewise, adding assembled ancestor values to the lifted blocks changes no information,
  because they are functions of those blocks and $Xi_i$; treating those values as independently sampled exterior
  data would not justify the product law used above.

=== 4.4 Bias that is independent of dimension <bias-that-is-independent-of-dimension>

Total variation above is obtained by increasing branching.
  The upper Fourier argument instead requires a small-bias bound before any slice conditioning,
  obtained by increasing the product counts. We use the character-wise notion of small bias of Naor and
  Naor #cite(label("NaorNaor1993")); the required sampler estimate is proved below.
  For a law $mu$ on a finite binary vector space $V$, call it #emph[quarter-balanced] if every nonzero $f in
  V^(*)$ satisfies $bb(P)_(x tilde.op mu) \( f \( x \) = b \) gt.eq 1 \/ 4$ for both $b in bb(F)_2$.

#thm([Lemma 4.5.])[
  (Scalar bias and independent hidden buckets).  #emph[There is an absolute integer $R_min$ such that the
    following holds if $R_p gt.eq R_min$ at every nonleaf level.
    Fix the domains and the full path in the original sampler, or fix $E \, O$, all projection choices,
    and the path through a modified cut in $sans(M)_i$. Every scalar law is quarter-balanced.
    For each nonzero $f in H_(D_p)^(*)$ at an original path node,
    or $f in H_(D_p) \( O \)^(*)$ at a node strictly above the modified cut,
#[#set math.equation(numbering: n => "(4.13)")
 $ lr(|bb(E)_(h tilde.op nu_(D_p)) \( - 1 \)^(f \( h \))|) lt.eq \( 7 \/ 8 \)^(R_p) . $ <eq:scalar-bias>]

 At leaves, and at or below the uniformized cut, uniform scalar draws have zero bias on nonzero functionals.]
  #emph[More generally, fix $j > i$, a linear map $A : K_j arrow.r bb(F)_2^r$, and $W = ker A$.
    In the modified experiment let $h_v$, $v eq.not 0$, be the separate level-$j$ buckets and set
$ X = sum_(v in W \\ { 0 }) v h_v in W ⊗ H_(D_j) \( O \) . $

 Conditional on the domain and path data just specified, all other actual matrices,
   and all buckets with $A v eq.not 0$, every nonzero character of $X$ has bias at most $\( 7 \/ 8 \)^(R_j)$.
   This remains so on revealing original questions and any other independent sampling tapes.
   Its law is determined by $O$, the path through the cut, $A$, and the fixed sampling parameters;
   it does not require the original questions or the missing part of a lower matrix.
   Revealing a full lower matrix here is an analytical exposure;
   the right decoder still receives only its prescribed quotient.
   These conclusions are not asserted after conditioning on a column slice, on successful decoding, or on cleanliness.]
] <lem:bias>

#proof[
  First suppose $g \, h$ are independent draws from quarter-balanced laws on a binary space $V$, and $B : V times
    V arrow.r bb(F)_2$ is a nonzero bilinear form. The linear map $g mapsto
    B \( g \, dot.op \)$ has proper kernel. Some nonzero linear functional on $V$ vanishes on that kernel;
    quarter balance therefore implies
  $ bb(P) \( B \( g \, dot.op \) eq.not 0 \) gt.eq 1 \/ 4 . $
  For each such $g$, quarter balance of the independent $h$ implies $bb(P) \( B \( g \, h \) = b divides g \)
    gt.eq 1 \/ 4$ for each bit $b$. Hence each bit of $B \( g \, h \)$ has probability at least $1 \/ 16$,
    and $\| bb(E) \( - 1 \)^(B \( g \, h \)) \| lt.eq 7 \/ 8$.
  Now apply induction from the leaves, or upward from the modified uniform cut.
    Let $f$ be nonzero on the space at a path node $D_p$. If its restriction to the square space of some ordinary
    child is nonzero, the corresponding uniform summand makes $f \( h \)$ an exactly uniform bit.
    Otherwise $f$ vanishes on every ordinary child’s square space.
    Since these spaces together with the special child’s square space span $H_(D_p)$,
    its restriction to the latter is nonzero. The bilinear form
  $ B \( g \, h \) = f \( g h \) $
  on that child’s row space is then nonzero, since pointwise products span its square space.
    The induction hypothesis makes the two independent factor laws quarter-balanced.
    Each product thus has sign expectation of absolute value at most $7 \/ 8$,
    and the $R_p$ independent products give (4.13). Choose $R_min$ so that $\( 7 \/ 8 \)^(R_min) lt.eq 1 \/ 2$.
    Then the resulting scalar law is again quarter-balanced, closing the induction.
    Uniform cut and leaf laws provide the initial step. The argument uses only whether linear or bilinear maps are
    nonzero, and no dimension enters its bound.
  For the hidden sum, identify a character with a functional $Phi in \( W ⊗ H_(D_j) \( O \) \)^(*)$.
    If $Phi eq.not 0$, then for some nonzero $v in W$ the functional $h mapsto Phi \( v ⊗ h \)$ is nonzero;
    simple tensors span the tensor product. Conditional on the stated information,
    every hidden bucket retains its own fresh tape, independently of the other hidden buckets.
    This follows directly from the call indexing in Lemma 19;
    higher matrices use distinct calls even where they visit the same spaces. Consequently
  $ bb(E) \( - 1 \)^(Phi \( X \)) = product_(v in W \\ { 0 }) bb(E) \( - 1 \)^(Phi \( v ⊗ h_v \)) . $
  One factor has absolute value at most $\( 7 \/ 8 \)^(R_j)$ and the others at most one.
    If $W = 0$ there are no nonzero characters and the assertion is vacuous.
    Every hidden bucket is generated on the projected domain $O$ by fresh recursion ending with uniform draws at
    the cut. That recipe uses neither $E$ nor the values of other actual matrices,
    proving the asserted law and its invariance under the permissible additional exposure. ◻
]

The order of accuracy choices follows from this proof. At descendants one needs only the absolute quarter-balance
  guarantee, obtained by the common $R_min$. Once an upper level $j$ requires a tolerance $lambda_j > 0$,
  it suffices to choose $R_j$ with $\( 7 \/ 8 \)^(R_j) lt.eq lambda_j$.
  No requested upper accuracy imposes a finer accuracy at a lower level.
  After all row counts, product counts and the source alphabet are fixed, choose branching upward.
  At cut $p$, $L_p$ is already fixed by lower branching, and

$ epsilon_p^(upright("cut")) arrow.r 0 \, wide epsilon_p^(upright("spr")) arrow.r 0 \, wide
  frac(2 n_p^(- 2 \/ 3) L_p, 1 - n_p^(- 2 \/ 3)) arrow.r 0 . $

For the middle limit, use $\( 1 + n_p^(- 4 \/ 3) L_p^2 \)^(n_p) lt.eq exp \( L_p^2 n_p^(- 1 \/ 3) \)$.
  Enlarging higher branching changes only the exterior record and the reconstruction map,
  so all three bounds already secured at $p$ persist.

== 5 Two successful levels and upper decoding <sec:upper>

We show that appreciable test acceptance produces two local bilinear-form decoders.
  Their outputs agree on the projected lower space with a probability depending only on the upper row count.
  The left output is always a normalized product form whose restriction to its displayed lower rows has rank at
  most one. Keeping this probability independent of the lower row count will allow us to choose that count afterward.

Fix a legal labeling of the partition vertices, extended to unused legal keys as in Section 3.
  All responses below are evaluations restored from this fixed labeling.
  For a candidate test at level $p$, write $upright("Acc")_p$ for its acceptance event.
  Sample the directions for all candidate tests independently, using the same left query and sampled path.

=== 5.1 Selecting two levels and a quotient table <selecting-two-levels-and-a-quotient-table>

Suppose that the labeling accepts with probability at least $epsilon$, where $0 < epsilon < 1$,
  and choose $d epsilon gt.eq 4$. If $N = sum_(p = 1)^d upright(bold(1))_(upright("Acc")_p)$, then

$ bb(E) \[ N \( N - 1 \) \] gt.eq \( bb(E) N \)^2 - bb(E) N gt.eq d^2 epsilon^2 - d epsilon . $

Consequently some $i < j$ satisfies

#[#set math.equation(numbering: n => "(5.1)")
 $ bb(P) \( upright("Acc")_i ∩ upright("Acc")_j \) gt.eq frac(d^2 epsilon^2 - d epsilon, d \( d - 1 \)) gt.eq
   frac(3 epsilon^2, 4) . $ <eq:upper-pair>]

No independence between the acceptance events is used here.
  Pass to the modified experiment at level $i$ from Section 4:
  each child of $D_i$ is independently projected with probability $beta_i = n_i^(- 2 \/ 3)$,
  and all calls stopped at $D_i$, its own matrix, and its descendant matrices are independent uniform draws in
  their new spaces. Write $bb(P)_i$ for this law, with all functions also pulled back to the original tuple $E$.
  By Lemmas 20 and 21, we can require the comparison error in (5.1) to be at most $epsilon^2 \/ 4$.
  Thus, throughout this section,

#[#set math.equation(numbering: n => "(5.2)")
 $ bb(P)_i \( upright("Acc")_i ∩ upright("Acc")_j \) gt.eq c \, wide c = epsilon^2 \/ 2 . $ <eq:upper-c>]

All eventual parameter choices will satisfy the stated bounds for every possible pair $i < j$.

The comparison at the upper cut forgets which level-$i$ descendant lies on the path.
  We therefore build one response table using the displayed rows at every level-$i$ descendant of $D_j$.
  Put $H = H_(D_j) \( E \)$, $K = K_j = bb(F)_2^ell$, $ell = ell_j$, and $M = M_(D_j)$. The data

$ P = \( E \, upright("path through ") D_j \, \( M_D \)_(D eq.not D_j) \) $

contain actual functions on the original domains. The record $P$ does not include an explicit tag for the selected
  level-$i$ descendant of $D_j$, and does not append the projection mask or the questions in $O$.
  The retained arrays may carry statistical information about these latent choices;
  the law comparisons already apply to the entire retained record.
  Let $cal(D)_i \( D_j \)$ be the set of #emph[all] level-$i$ descendants of $D_j$.
  Write $s_(C \, t) in H_C \( E \)$ for row $t$ of $M_C$, where $C in cal(D)_i \( D_j \)$ and $1 lt.eq t lt.eq
  ell_i$. Define

#[#set math.equation(numbering: n => "(5.3)")
 $ B = B \( P \) = "span" #scale(x: 120%, y: 120%)[\(] { 1 } union { s_(C \, t) s_(C \, u) :
   C in cal(D)_i \( D_j \) \, med 1 lt.eq t \, u lt.eq ell_i } #scale(x: 120%, y: 120%)[\)] subset.eq H .
   $ <eq:upper-B>]

The inclusion follows from $H_C^2 subset.eq H_(D_j)$. Fix, by deterministic linear algebra on $P$,
  a linear section $s : H \/ B arrow.r H$ of the quotient map $pi : H arrow.r H \/ B$. Apply both maps row by row.

For $macron(M) in K ⊗ \( H \/ B \)$, query the left table with upper matrix $s \( macron(M) \)$ and all other
  matrices specified by $P$. Retain the response

#[#set math.equation(numbering: n => "(5.4)")
 $ f_P \( macron(M) \) = #scale(x: 120%, y: 120%)[\(] u \, \( y_C \)_(C in cal(D)_i \( D_j \))
   #scale(x: 120%, y: 120%)[\)] \, wide u in K \, quad y_C in K_i . $ <eq:upper-representative>]

Thus the response contains the upper evaluation and the evaluations at every level-$i$ descendant,
  without a tag marking the selected descendant. This finite range can be large;
  none of our inverse bounds depends on its size.

To recover the response at the original matrix $M$, put $macron(M) = pi \( M \)$ and write $Delta = M -
  s \( macron(M) \) in K ⊗ B$. Addition of $Delta$ to the upper rows is an invertible triangular transformation of
  the combined evaluation tuple, since each row of $Delta$ is a constant plus a sum of products of unchanged lower
  rows. Lemma 17 therefore shows that all $y_C$ are unchanged and that the upper response changes from $u$ to $u +
  Delta b_y$, where $b_y$ evaluates the generators of $B$ according to $1 mapsto 1$ and $s_(C \, t) s_(C \, u)
  mapsto \( y_C \)_t \( y_C \)_u$. This rule is a well-defined linear functional:
  one legal assignment realizes the #emph[entire] representative response,
  and its evaluation respects every pointwise linear relation among the generators in (5.3).

Define a usefulness mark by

#[#set math.equation(numbering: n => "(5.5)")
 $ U \( P \, macron(M) \) = upright(bold(1)) { bb(P)_i \( upright("Acc")_i divides P \, macron(M) \) gt.eq
   kappa } \, wide kappa = c \/ 2 \, $ <eq:upper-mark>]

setting it to zero off the support of the conditioning data.
  The conditional probability averages over the selected lower path, its omitted direction,
  the $B$-component of $M$, and any other unexposed randomness.
  Define the partial table $tilde(f)_P$ to equal $f_P$ where $U = 1$, and to be undefined ($tack.t$) elsewhere.
  We fix these marks once using $bb(P)_i$ and use exactly the same partial tables under all subsequent laws.

#thm([Lemma 5.1.])[
  (Defined equality from a two-response fiber).  #emph[Under (5.2),
    resampling the level-$j$ bucket indexed by its omitted direction gives two matrices $M \, M'$ such that
$ bb(P)_i #scale(x: 120%, y: 120%)[\(] tilde(f)_P \( macron(M) \) =
  tilde(f)_P \( macron(M)' \) eq.not tack.t #scale(x: 120%, y: 120%)[\)] gt.eq c^2 \/ 8 . $

 If the cut comparison for this enlarged experiment has total-variation error at most $c^2 \/ 16$,
   then under the unrestricted level-$j$ cut law the same frozen partial tables have average defined equality at
   least $theta = c^2 \/ 16$ on the ordinary uniform rank-one walk on $K ⊗ \( H \/ B \)$.]
] <lem:useful-equality>

#proof[
  The part of $upright("Acc")_i ∩ upright("Acc")_j$ on which $U = 0$ has probability at most $kappa$,
    by conditioning on $\( P \, macron(M) \)$. Hence $bb(P)_i \( upright("Acc")_j ∩ { U = 1 } \) gt.eq c \/ 2$.
  For the resampling, first fix the domains and projection choices, the path through $D_i$,
    all matrices other than $M$, the omitted direction $a in K \\ { 0 }$ for the level-$j$ test,
    and every bucket $h_v$ of $M = sum_(v eq.not 0) v ⊗ h_v$ except $h_a$.
    Denote this full background by $cal(B)$. Fresh calls make $h_a$ and its resampled copy conditionally
    independent with the same law. The right level-$j$ query is constant as a function of this bucket,
    because $M med mod med chevron.l a chevron.r$ is constant.
    Every successful left response therefore has the same lower outputs and the same upper output modulo
    $chevron.l a chevron.r$.
  This assertion also holds for the representative upper output.
    Indeed, if $M' - M = a ⊗ h$, linearity of the section gives
  $ \[ M' - s \( macron(M)' \) \] - \[ M - s \( macron(M) \) \] = a ⊗ \( h - s \( pi h \) \) . $
  Successful samples have the same $b_y$, so the corresponding folding correction changes by a multiple of $a$.
    Thus at fixed $cal(B)$ the useful successful samples have at most two possible values of (5.4).
    If their probabilities are $p_1 \, p_2$ (allowing one to be zero),
    two independent bucket draws yield equal defined responses with probability at least
  $ p_1^2 + p_2^2 gt.eq \( p_1 + p_2 \)^2 \/ 2 . $
  Averaging and applying Cauchy–Schwarz again proves the first bound.
  The event just obtained is a function of $P \, M \, M'$ and the fixed partial tables.
    It records neither the selected descendant below $D_j$ nor the projection metadata.
    Apply the modified-$i$ to unrestricted-$j$ comparison from Lemmas 20 and 21,
    including the additional bucket call. Own buckets at $D_j$, pending calls used in its ancestors,
    and descendant matrices are separate independent families in the reference experiment.
    Consequently $M$ is uniform independently of $P$: independent uniform buckets map surjectively to $K ⊗ H$.
    Given all old buckets, $h = h_a + h'_a$ is uniform in $H$ and independent of those buckets.
    Hence $M' = M + a ⊗ h$ is precisely the uniform rank-one walk,
    and its image in $H \/ B$ is the same walk on the quotient. The claimed loss gives $c^2 \/ 8 - c^2 \/ 16 = theta$. ◻
]

=== 5.2 From row advice to a predictable upper response <from-row-advice-to-a-predictable-upper-response>

Write $bb(P)_j^0$ for the unrestricted cut law in the last assertion of Lemma 24,
  with independent auxiliary choices appended as needed. Put $eta = theta \/ 2$.
  If the average conditional equality given $P$ is at least $theta = 2 eta$,
  the set of $P$ for which it is at least $eta$ has probability at least $\( theta - eta \) \/ \( 1 - eta \) gt.eq
  eta$. Use the constants $0 < alpha lt.eq 1$, $r gt.eq 1$ in Lemma 10 at equality threshold $eta$,
  obtained from Theorem 9 at threshold $eta \/ 2$. Assume that $ell$ meets their largeness requirement.

Sample $A in "Hom" \( K \, bb(F)_2^r \)$ uniformly and independently.
  For any $\( P \, A \, C \)$, where $C in bb(F)_2^r ⊗ \( H \/ B \)$,
  call the advice #emph[good] if the row fiber $A macron(M) =
  C$ has a nonempty slice obtained by specifying at most $r$ columns on which one defined value of $tilde(f)_P$
  has density at least $alpha$ in uniform slice measure. For each good advice choose,
  using fixed deterministic orders, column functionals $q_1 \, dots.h \, q_k in \( H \/ B \)^(*)$, values $v_1 \,
  dots.h \, v_k in K$, and a response

$ t_(*) = \( u \, \( y_C \)_(C in cal(D)_i \( D_j \)) \) \, wide k lt.eq r \, $

witnessing this condition. These choices depend only on the advice;
  they are not selected using the actual position within the column slice.
  The probability of good advice $\( P \, A \, A macron(M) \)$ under $bb(P)_j^0$ is at least

#[#set math.equation(numbering: n => "(5.6)")
 $ g = eta^2 / 4 thin 2^(- r ell) . $ <eq:upper-g>]

Indeed, the set of qualifying $P$ has mass at least $eta$,
  and for each such $P$ Lemma 10 gives good-advice probability at least $\( eta \/ 4 \) 2^(- r ell)$.
  Row maps of deficient rank are allowed throughout.

Pull the chosen $q_a$ back to $H^(*)$ and put $Z = "span" { q_1 \, dots.h \, q_k } subset.eq "Ann" \( B \)$.
  The chosen response occurs on a nonempty set of legal representative queries,
  so the preceding joint-legality argument defines its functional $b_y in B^(*)$. Define $z_0 in H^(*)$ by

#[#set math.equation(numbering: n => "(5.7)")
 $ z_0 \( b + s \( macron(h) \) \) = b_y \( b \) quad \( b in B \, med macron(h) in H \/ B \) . $ <eq:upper-z0>]

This uses the direct-sum decomposition $H = B xor s \( H \/ B \)$.
  At every match to the selected response the restored upper output equals

#[#set math.equation(numbering: n => "(5.8)")
 $ M z_0 + u . $ <eq:upper-restored>]

Every $z in z_0 + Z$ satisfies

#[#set math.equation(numbering: n => "(5.9)")
 $ z \( 1 \) = 1 \, wide #scale(x: 120%, y: 120%)[\(] z \( s_(C \, t) s_(C \, u) \)
   #scale(x: 120%, y: 120%)[\)]_(t \, u) = y_C y_C^(sans(t)) quad \( C in cal(D)_i \( D_j \) \) . $ <eq:upper-valid>]

Thus the whole coset is normalized and has tested rank at most one at each of these descendants.
  Dependent generators in $B$ cause no ambiguity; legality, rather than a choice of their representation, defined $b_y$.

Define two events on $\( P \, A \, M \)$:

$ J & = { upright("advice is good and ") M q_a = v_a upright(" for ") 1 lt.eq a lt.eq k } \,\
I & = J ∩ { tilde(f)_P \( macron(M) \) = t_(*) } . $

Both events belong to $sigma \( P \, A \, macron(M) \)$, since every $q_a$ annihilates $B$ and the witness uses
  only $\( P \, A \, A macron(M) \)$. In particular, $I$ asks for a representative-table match;
  it does not ask for a restored right answer to equal (5.8).
  For uniform $M$ in a fixed nonempty row fiber, imposing $k$ columns costs at most $k ell lt.eq
  r ell$ binary equations. Therefore, with

#[#set math.equation(numbering: n => "(5.10)")
 $ h_0 = 2^(- r ell) \, wide q_0 = g h_0 \, $ <eq:upper-q0>]

the reference law satisfies

#[#set math.equation(numbering: n => "(5.11)")
 $ bb(P)_j^0 \( J \) gt.eq q_0 \, wide bb(P)_j^0 \( I \) gt.eq alpha bb(P)_j^0 \( J \) . $ <eq:upper-IJ>]

The entire definition of goodness and the chosen witnesses is now fixed.
  When evaluating $I \, J$ under another law we use these same predicates.

#thm([Lemma 5.2.])[
  (Predicting the upper response).  #emph[Let $R_j^(\( i \)) in
    K$ be the restored upper response of the level-$i$ right table in the modified experiment.
    Suppose the total-variation comparison between $bb(P)_i$ and $bb(P)_j^0$, for the observations defining $I \,
    J$, is at most $v lt.eq alpha q_0 \/ 16$. Then, with
$ rho = kappa alpha \/ 4 \, wide b = kappa alpha q_0 \/ 4 \, $

 one has
#[#set math.equation(numbering: n => "(5.12)")
 $ bb(P)_i #scale(x: 120%, y: 120%)[\(] J \, med R_j^(\( i \)) = M z_0 + u #scale(x: 120%, y: 120%)[\)] -
   rho bb(P)_i \( J \) gt.eq b > 0 . $ <eq:upper-difference>]

 All quantities $g \, h_0 \, q_0 \, rho \, b$ depend only on $c \, alpha \, r \, ell$.]
] <lem:positive-difference>

#proof[
  On $I$ the mark $U$ is one. Independence of $A$ and the measurability just proved imply
  $ bb(P)_i \( I ∩ upright("Acc")_i \) = bb(E)_i #scale(x: 120%, y: 120%)[\[] upright(bold(1))_I
    bb(P)_i \( upright("Acc")_i divides P \, macron(M) \, A \) #scale(x: 120%, y: 120%)[\]] gt.eq
    kappa bb(P)_i \( I \) . $
  Acceptance at level $i$ preserves the entire upper evaluation.
    Thus on $I ∩ upright("Acc")_i$ the right response is $M z_0 + u$.
    Exact sharing of canonical keys permits evaluating this right response directly on $O$.
    Writing $h = bb(P)_j^0 \( J \) gt.eq q_0$, unconditional total variation and (5.11) give
  $ bb(P)_i \( I \) gt.eq alpha h - v \, wide bb(P)_i \( J \) lt.eq h + v . $
  The left side of (5.12) is consequently at least
  $ \( kappa alpha - rho \) h - \( kappa + rho \) v gt.eq frac(3 kappa alpha, 4) q_0 -
    kappa \( 1 + alpha \/ 4 \) frac(alpha q_0, 16) gt.eq b . $
  This proves an unconditional inequality. We will disintegrate it below,
    without reusing the usefulness estimate after a finer conditioning. ◻
]

The affine witness now predicts the upper response with positive probability,
  and every functional in its coset is normalized and passes the lower rank test.
  To obtain two local decoders, we need a bounded collection of candidate functionals,
  computed from the right input, that contains the restriction of some functional in this coset to the projected
  space. The same collection must work for every compatible left witness.

=== 5.3 The local inputs and the original hidden law <sec:right-hidden-law>

Here and below the experiment is $bb(P)_i$. Write $H' = H_(D_j) \( O \)$, $H_i = H_(D_i) \( E \)$, $H'_i =
  H_(D_i) \( O \)$, and $S = M_(D_i)$. Pullback identifies the primed spaces with subspaces of the unprimed ones,
  preserving products. Put $W = ker A$ and split the upper matrix into

#[#set math.equation(numbering: n => "(5.13)")
 $ M = M_(upright("known")) + X \, wide M_(upright("known")) = sum_(v in K \\ W) v ⊗ h_v \, wide X =
   sum_(v in W \\ { 0 }) v ⊗ h_v in W ⊗ H' . $ <eq:upper-hidden>]

The known sum is determined without any bucket whose index lies in $W$. In particular $A M = A M_(upright("known"))$.

We specify the two inputs exactly. Tree locations are retained in these analytical inputs,
  even though the original partition keys omit unnecessary sampling metadata. The left information is

#[#set math.equation(numbering: n => "(5.14)")
 $ cal(L) = sigma #scale(x: 120%, y: 120%)[\(] E \, upright("path through ") D_i \,
   A \, \( M_D \)_(D eq.not D_j) \, \( h_v \)_(v in K \\ W) #scale(x: 120%, y: 120%)[\)] \, $ <eq:upper-left-input>]

where every function is represented on its original $E$-domain.
  These data supply $S$ in full, without supplying $a_i$, $O$, or the projection choices as additional fields.
  The right information is

#[#set math.equation(numbering: n => "(5.15)")
 $ cal(R) = sigma #scale(x: 120%, y: 120%)[\(] O \, upright("path through ") D_i \, A \,
   a_i \, \( M_D \)_(D eq.not D_j \, D_i) \, S med mod med chevron.l a_i chevron.r \, \( h_v \)_(v in K \\ W)
   #scale(x: 120%, y: 120%)[\)] \, $ <eq:upper-right-input>]

with functions represented on their $O$-domains. The right is supplied only the displayed quotient of $S$,
  with no additional missing-component ingredients. Neither side is supplied $X$.
  The left can compute $P$ and $A macron(M)$ from (5.14), so it can compute the good-advice predicate and its
  chosen witness without knowing $M$. Figure 1 summarizes these information restrictions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((3.2, 0), [#text(size: 9pt)[Latent sampling structure]])
  content((11.1, 0.1), [#text(size: 9pt)[Original sampler:#linebreak()separate calls at the same node]])
  content((3.2, -0.55), [#text(size: 9pt)[ancestors]])
  content((3.2, -1.25), [#box(inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$D_j$: upper matrix $M$]]])])
  line((3.2, -0.78), (3.2, -0.9198), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, -1.25), (1, -1.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((5.4, -1.25), (6.6, -1.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.6, -1.78), [#text(size: 8pt)[upper#linebreak()cut]])
  content((3.2, -2.05), [#text(size: 9pt)[$dots.v$]])
  content((5.45, -2), [#text(size: 8pt)[$j>i$; not necessarily#linebreak()adjacent levels]])
  content((3.2, -2.85), [#box(inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$D_i$: lower matrix $S$]]])])
  line((3.2, -1.58), (3.2, -1.82), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.2, -2.28), (3.2, -2.54), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, -2.85), (1, -2.85), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((5.4, -2.85), (6.6, -2.85), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.6, -3.38), [#text(size: 8pt)[lower#linebreak()cut]])
  content((1.65, -3.95), [#text(size: 9pt)[ordinary $C$]])
  content((4.7, -3.95), [#text(size: 9pt)[$C_* = D_(i-1)$]])
  line((2.763, -3.16), (2.024, -3.684), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.623, -3.16), (4.337, -3.684), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.2, -4.65), [#box(width: 6.735cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$C_*$ is the original sampler's latent child.#linebreak()The modified-$i$ law uses no path below $D_i$.]]])])
  content((11.1, -1.45), [#box(width: 5.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Own bucket at $D_p$#linebreak()$h_(p,v) tilde.op nu_(D_p)$]]])])
  content((11.1, -3.35), [#box(width: 5.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Stopped ancestor call at $D_p$#linebreak()$h' tilde.op nu_(D_p)$]]])])
  line((11.1, -0.5), (11.1, -0.9138), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((11.1, -0.7069), [#text(size: 8pt)[fresh tape]], anchor: "west", padding: 0.1176cm)
  line((11.1, -2.4), (11.1, -2.814), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((11.1, -2.607), [#text(size: 8pt)[fresh tape]], anchor: "west", padding: 0.1176cm)
  content((11.1, -4.65), [#box(width: 6.035cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[Independent conditional on the domains and shared path;#linebreak()no call is reused in the other array.]]])])
  content((-0.2, -5.35), [#box(width: 7.194cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fffff5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Left decoder: functions on $E$#linebreak() $E$, path through $D_i$, and $A$#linebreak() Full $S$#linebreak() $(M_D)_(D != D_j,D_i)$ on $E$#linebreak() $(h_v)_("Av" != 0)$ on $E$#linebreak() No $a_i$ or projection metadata is supplied.]])], anchor: "north-west")
  content((14.5, -5.35), [#box(width: 7.194cm, inset: 0.2469cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fffff5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[Right decoder: functions on $O$#linebreak() $O$, path through $D_i$, $A$, and $a_i$#linebreak() Only $S mod chevron.l a_i chevron.r$#linebreak() $(M_D)_(D != D_j,D_i)$ on $O$#linebreak() $(h_v)_("Av" != 0)$ on $O$#linebreak() The missing component of $S$ is not supplied.]])], anchor: "north-east")
  content((7.15, -9.496), [#box(width: 14.24cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Neither decoder is supplied the hidden upper sum $X= sum_(0 != v in ker A)v ⊗ h_v$.]]])])
})],
  caption: [Figure 1: Cuts and the information supplied to the decoders. The selected levels satisfy $j > i$. The tree depicts latent sampling choices; the upper-cut comparison forgets the path below $D_j$. The call panel shows the original sampler; at a modified cut these calls are replaced by independent uniform draws in the cut space. An own bucket and a stopped ancestor call at the same node use separate tapes, independently conditional on the domains and shared path. The cards summarize the analytical inputs (5.14)–(5.15), with $W = ker A$. The left receives full $S$ without $a_i$; the right receives $a_i$ and only the quotient of $S$. Both receive upper buckets with $A v eq.not 0$ on their own domains. These analytical records are distinct from the original game’s canonical partition keys. ],
) <fig:tree-cut>

For clarity, the independence underlying these inputs is exact, not an approximation.
  Conditional on $O$, the projection choices, and the path through $D_i$,
  give each actual node matrix its own random tape. Give each scalar bucket in a matrix a fresh recursive call
  tree, with independent ordinary-child uniforms and independent factor calls at every product.
  All calls that reach $D_i$ terminate in separate uniform draws in $H'_i$.
  In particular, even a call used for an ancestor of $D_j$ and a bucket of $M$ that both visit $D_j$ use disjoint
  random tapes. The product factorization of these tapes implies

#[#set math.equation(numbering: n => "(5.16)")
 $ \( h_v \)_(v in W \\ { 0 }) perp #h(-0.16667em) #h(-0.16667em) #h(-0.16667em) perp
   #scale(x: 120%, y: 120%)[\(] \( h_v \)_(v in.not W) \, \( M_D \)_(D eq.not D_j) #scale(x: 120%, y: 120%)[\)]
   quad upright("given the domains, path, and ") A . $ <eq:upper-factorization>]

The same statement remains true if the original questions $E$ and the projection maps are additionally given:
  they determine the embeddings of the spaces but do not change the intrinsic $O$-space sampler.
  This also explains why analytical disclosure of the full $S$ is harmless for this factorization,
  although $S$ is not part of the right input.

Let $mu_(cal(R))$ be the distribution on $W ⊗ H'$ obtained by sampling the hidden buckets in (5.13) with this
  original modified-$i$ sampler. It is a function of the right input alone.
  Indeed, the right knows $O$, the path down to the terminating cut, all spaces and all sampler parameters.
  Independent recursive calls above that cut can be enumerated on those spaces without knowing $E$,
  any projection map, or the missing part of $S$. Formula (5.16) shows that $mu_(cal(R))$ is also the actual
  conditional hidden law after revealing all of the data in both inputs, including full $S$.

For each fixed right input, define

#[#set math.equation(numbering: n => "(5.17)")
 $ G_(cal(R)) : W ⊗ H' arrow.r K $ <eq:upper-G>]

by assembling the level-$i$ right query with upper matrix $M_(upright("known")) + X$,
  consulting its fixed partition label, and restoring the upper component. This is a well-defined local function:
  the lower matrix in this query is precisely $S med mod med chevron.l a_i chevron.r$.
  The original labeling has already been extended to unused legal keys,
  so this definition is total for every $X$ in the ambient space.

Assume that every product count meets the absolute balance minimum of Lemma 23, and that

#[#set math.equation(numbering: n => "(5.18)")
 $ \( 7 \/ 8 \)^(R_j) lt.eq lambda . $ <eq:upper-R>]

Every nonzero character of $W ⊗ H'$ then has bias at most $lambda$ under $mu_(cal(R))$.
  To check this directly, identify a character with a nonzero linear map $Phi : W arrow.r \( H' \)^(*)$.
  Some nonzero $v in W$ has $Phi \( v \) eq.not 0$, so its expectation on the corresponding bucket has absolute
  value at most $lambda$ by Lemma 23. Independence factors the expectation over all hidden buckets,
  and all remaining factors have absolute value at most one.
  This argument makes no claim about small bias after a slice, a successful match, or any later conditioning.

=== 5.4 A bounded list for an arbitrary small-bias law <a-bounded-list-for-an-arbitrary-small-bias-law>

We record the Fourier calculation separately. It uses characters under their actual sampling law rather than
  treating small bias as total-variation closeness to uniform measure.
  The short-list principle is related to Goldreich–Levin heavy-character
  decoding #cite(label("GoldreichLevin1989")). We prove the needed statement for the present nonuniform,
  own-question law; no efficient decoding algorithm is required. If $V = W ⊗ H'$, write

$ chi_Phi \( X \) = \( - 1 \)^(chevron.l Phi \, X chevron.r) \, wide Phi in V^(*) = "Hom" \( W \, \( H' \)^(*) \) . $

For $sigma in K^(*)$ and a fixed function $G : V arrow.r K$, put $g_sigma \( X \) = \( - 1 \)^(sigma \( G \( X \) \))$.

#thm([Lemma 5.3.])[
  (One heavy list for all affine-slice witnesses).  #emph[Let $K = bb(F)_2^ell$,
    let $W subset.eq K$ have codimension at most $r$, and let $H'$ be a finite vector space.
    Let $mu$ be a probability law on $V = W ⊗ H'$ with $\| bb(E)_mu chi_Phi \| lt.eq
    lambda$ for every nonzero $Phi in V^(*)$. Fix $G : V arrow.r K$, $0 < rho lt.eq 1$, and set
$ h_0 = 2^(- r ell) \, wide tau = rho h_0 \/ 4 . $

 Suppose
#[#set math.equation(numbering: n => "(5.19)")
 $ 2^(- \( ell - r \)) < rho \/ 8 \, wide 0 lt.eq lambda lt.eq min { h_0 \/ 2 \,
   tau^2 \/ 2 } . $ <eq:upper-Fourier-conditions>]

 For each $sigma in K^(*)$ define the list
#[#set math.equation(numbering: n => "(5.20)")
 $ cal(H)_sigma = { Phi in V^(*) : \| bb(E)_mu \[ g_sigma chi_Phi \] \| gt.eq tau } . $ <eq:upper-heavy-definition>]

 Each list has size at most $2 \/ tau^2$. Moreover, let $Q subset.eq \( H' \)^(*)$ have dimension at most $r$,
   let $t_Q in "Hom" \( Q \, W \)$ specify the nonempty affine slice $cal(C) = { X : X \|_Q = t_Q }$,
   and let $z' in \( H' \)^(*)$ and $k_0 in K$. If
#[#set math.equation(numbering: n => "(5.21)")
 $ bb(P)_mu \( G \( X \) = X z' + k_0 divides X in cal(C) \) gt.eq rho \, $ <eq:upper-slice-equality>]

 then some $sigma$ with $sigma \|_W eq.not 0$ has a list element in
#[#set math.equation(numbering: n => "(5.22)")
 $ \( sigma \|_W \) ⊗ z' + W^(*) ⊗ Q . $ <eq:upper-heavy-coset>]

 The lists in (5.20) depend on $mu \, G \, W \, H'$ and $tau$, and not on the witness $Q \, t_Q \, z' \, k_0$.]
] <lem:heavy-list>

#proof[
  Put $w = dim W$ and $q = dim Q$. The map $V arrow.r "Hom" \( Q \, W \)$ given by $X mapsto
    X \|_Q$ is surjective: choose a basis of $Q$, extend it to a basis of $\( H' \)^(*)$,
    and extend any specified linear map to all of $\( H' \)^(*)$.
    Thus the linear equations for $cal(C)$ have rank $w q lt.eq ell r$.
    Their dual space is $L = W^(*) ⊗ Q subset.eq V^(*)$. Choose any $X_0 in cal(C)$.
    The exact character identity for the affine slice is
  #[#set math.equation(numbering: n => "(5.23)")
   $ upright(bold(1))_(cal(C)) \( X \) = frac(1, \| L \|) sum_(Psi in L) chi_Psi \( X_0 \) chi_Psi \( X \) .
     $ <eq:upper-slice-expansion>]
  Indeed, the sum is one when $X - X_0$ annihilates $L$, and zero otherwise. Consequently
  #[#set math.equation(numbering: n => "(5.24)")
   $ mu \( cal(C) \) gt.eq 2^(- w q) - lambda gt.eq h_0 - lambda gt.eq h_0 \/ 2 > 0 . $ <eq:upper-slice-mass>]
  This proves the needed slice mass using unconditional bias.
  Expand the equality in (5.21) over $K^(*)$:
  $ bb(P)_mu \( G \( X \) = X z' + k_0 divides cal(C) \) = 2^(- ell)
    sum_(sigma in K^(*)) \( - 1 \)^(sigma \( k_0 \))
    bb(E)_mu \[ g_sigma \( X \) chi_(\( sigma \|_W \) ⊗ z') \( X \) divides cal(C) \] . $
  The fraction of $sigma$ annihilating $W$ is $2^(- w)$, which is at most $2^(- \( ell - r \)) < rho \/ 8$.
    Each term has absolute value at most one, so some remaining $sigma$ has
  $ lr(|bb(E)_mu \[ g_sigma chi_(\( sigma \|_W \) ⊗ z') divides cal(C) \]|) gt.eq rho \/ 2 . $
  Multiply by (5.24) and then insert (5.23). The coefficients in that expansion have total absolute value one.
    It follows that for some $Psi in L$,
  $ lr(|bb(E)_mu \[ g_sigma chi_(\( sigma \|_W \) ⊗ z' + Psi) \]|) gt.eq \( rho \/ 2 \) \( h_0 \/ 2 \) = tau . $
  This gives (5.22). Notice that the unknown target offset contributes only a sign in the equality expansion.
  It remains to bound the lists under the possibly nonuniform law $mu$.
    Take $m$ distinct elements $Phi_1 \, dots.h \, Phi_m$ of one list and choose signs $epsilon.alt_a in { - 1 \,
    1 }$ aligning their correlations with $g_sigma$. Cauchy–Schwarz gives
  $ m^2 tau^2 & lt.eq (bb(E)_mu [g_sigma sum_(a = 1)^m epsilon.alt_a chi_(Phi_a)])^2\
 & lt.eq bb(E)_mu [(sum_(a = 1)^m epsilon.alt_a chi_(Phi_a))^2] lt.eq m + m \( m - 1 \) lambda lt.eq m + m^2 lambda . $
  For distinct indices the product character is nonzero, which justifies the off-diagonal bound even after sign
    alignment. If $m > 0$, the hypothesis $lambda lt.eq tau^2 \/ 2$ yields $m lt.eq 2 \/ tau^2$;
    the empty case is immediate. Only the selected characters were summed, so no ambient-dimension factor appears.
    All correlations defining the lists are unconditional under the same law $mu$. ◻
]

=== 5.5 Constructing the two decoders <constructing-the-two-decoders>

#thm([Proposition 5.4.])[
  (Upper decoding with a lower rank test).  #emph[Suppose a legal labeling has acceptance at least $epsilon$,
    $d epsilon gt.eq 4$, and the cut comparisons have the errors required in (5.2), Lemma 24, and Lemma 25.
    Choose upper inverse constants $alpha \, r$ and $ell = ell_j$ as above, and assume (5.19) and (5.18),
    with the absolute balance minimum at every level. For the pair $i < j$ supplied by (5.1),
    there are randomized strategies, measurable on (5.14) and (5.15) respectively,
    returning bilinear forms $F_L$ on $H_i$ and $F_R$ on $H'_i$ such that
#[#set math.equation(numbering: n => "(5.25)")
 $ bb(P)_i #scale(x: 120%, y: 120%)[\(] F_R = F_L \|_(H'_i times H'_i) #scale(x: 120%, y: 120%)[\)] gt.eq
   gamma_j := b thin 2^(- ell) tau^2 / 2 thin 2^(- r) > 0 . $ <eq:upper-gamma>]

 Every left output has the form
$ F_L \( x \, y \) = z \( x y \) \, quad z in \( H_i^2 \)^(*) \, quad z \( 1 \) = 1 \, wide
  "rank" #scale(x: 120%, y: 120%)[\(] F_L \( S_t \, S_u \) #scale(x: 120%, y: 120%)[\)]_(t \, u) lt.eq 1 . $

 The constant $gamma_j$ depends only on $c \, alpha \, r \, ell_j$;
   it is independent of the lower row count $ell_i$, the branching numbers, the source alphabet and instance size,
   and the bias accuracies chosen for lower levels. The left strategy never receives $a_i$,
   and the right strategy uses $S$ only through its quotient by $chevron.l a_i chevron.r$.]
] <prop:upper>

#proof[
  On good advice the left samples $z$ uniformly from $z_0 + Z$, using fresh private randomness,
    and returns $F_L \( x \, y \) = z \( x y \)$ for $x \, y in H_i$.
    The products belong to $H$ because $D_i$ is a proper descendant of $D_j$.
    Equation (5.9) proves normalization and the rank bound on $S$.
    On bad advice it evaluates at a fixed legal assignment on the original subtree,
    obtaining the same two validity properties. These rules also define valid defaults on any other well-typed
    left input: use the stated construction whenever its witness is valid, and point evaluation otherwise.
    The rule involves no omitted direction.
  For the right decoder, use $mu = mu_(cal(R))$ and $G = G_(cal(R))$ from (5.17), and compute all lists (5.20).
    Choose $sigma in K^(*)$ uniformly. If $sigma \|_W eq.not 0$ and its list is nonempty,
    choose an element $Phi$ uniformly from that list. Choose $h_sigma in
    W$ deterministically from $\( A \, sigma \)$ with $sigma \( h_sigma \) = 1$,
    for example the first such vector in a fixed order, and put $z_R = Phi \( h_sigma \) in \( H' \)^(*)$. Return
  #[#set math.equation(numbering: n => "(5.26)")
   $ F_R \( x \, y \) = z_R \( x y \) \, wide x \, y in H'_i . $ <eq:upper-right-form>]
  The inclusion $\( H'_i \)^2 subset.eq H'$ makes this a bilinear form.
    In the remaining cases return the zero bilinear form. These defaults make the algorithm total;
    normalization is required only of the left output. No chosen witness from the left enters the right rule.
  We now prove agreement for these particular algorithms. For this analysis only, expose $E \, O$,
    all projection maps, the path through $D_i$, $A \, a_i$, all nonhidden upper buckets,
    and all other matrices including full $S$. Call the resulting data $cal(D)$.
    Do not expose $X$, any hidden bucket ingredients, the slice event $J$, the representative-match event $I$,
    a successful test, or either decoder’s final random choices.
    This exposure determines $P$, $M_(upright("known"))$ and $A macron(M)$, since $A X = 0$.
    Hence it determines goodness, $Z \, z_0 \, u$ and the column witness.
    By (5.16), the conditional distribution of $X$ given $cal(D)$ remains exactly $mu_(cal(R))$,
    with the bias bound already proved.
  On good data let $Q = Z \|_(H') subset.eq \( H' \)^(*)$ and $z' = z_0 \|_(H')$.
    The event $J$ either is impossible, or is an affine slice
  $ cal(C)_(cal(D)) = { X in W ⊗ H' : X \( q_a \|_(H') \) = v_a -
    M_(upright("known")) q_a upright(" for every ") a } . $
  In the latter case these equations define a well-defined linear specification on $Q$, of dimension at most $r$.
    This also handles a collapse of some columns on restriction to $H'$.
    The target in (5.12) is $X z' + k_0$, where $k_0 = M_(upright("known")) z_0 + u$ is fixed by $cal(D)$.
  Set $p_(cal(D)) = mu_(cal(R)) \( cal(C)_(cal(D)) \)$ on good compatible data, and zero otherwise.
    When $p_(cal(D)) > 0$, let
  $ q_(cal(D)) = bb(P)_i #scale(x: 120%, y: 120%)[\(] G_(cal(R)) \( X \) = X z' + k_0 divides cal(D) \, med
    X in cal(C)_(cal(D)) #scale(x: 120%, y: 120%)[\)] \, $
  and set $q_(cal(D)) = 0$ otherwise. Disintegrating the already proved unconditional inequality (5.12) gives
  #[#set math.equation(numbering: n => "(5.27)")
   $ bb(E)_i \[ p_(cal(D)) \( q_(cal(D)) - rho \) \] gt.eq b . $ <eq:upper-favorable-mass>]
  Its integrand is nonpositive unless the data are good and compatible, $p_(cal(D)) > 0$, and $q_(cal(D)) gt.eq
    rho$. The integrand is at most one everywhere. The set of data with those properties consequently has
    probability at least $b$. This is the sole use of the finer exposure:
    we have not asserted that usefulness persists upon conditioning on it.
  Fix any such favorable $cal(D)$. Lemma 26 supplies at least one nonannihilating $sigma$ and one
  $ Phi in cal(H)_sigma ∩ #scale(x: 120%, y: 120%)[\(] \( sigma \|_W \) ⊗ z' +
    W^(*) ⊗ Q #scale(x: 120%, y: 120%)[\)] . $
  The right chooses such a pair with probability at least $2^(- ell) tau^2 \/ 2$.
    Every such choice, with the already fixed $h_sigma$, has
  $ z_R = Phi \( h_sigma \) in z' + Q . $
  The restriction map $Z arrow.r Q$ is surjective. Uniform measure on $z_0 +
    Z$ therefore pushes to uniform measure on $z' + Q$, so the fresh left choice has restriction equal to this
    particular $z_R$ with probability $2^(- dim Q) gt.eq 2^(- r)$.
    It is independent of the right’s final choices conditional on $cal(D)$.
    Equality of these functionals on $H'$ implies agreement of their product forms on $H'_i times H'_i$.
    Averaging over the favorable data proves (5.25).
  For a fixed right input, the law $mu_(cal(R))$, function $G_(cal(R))$, lists $cal(H)_sigma$,
    and contraction vectors $h_sigma$ are identical for all compatible left inputs and witnesses.
    Different favorable exposures may certify different elements of these same lists.
    The preceding hit probability holds separately for each exposure,
    so averaging introduces no factor for the number of witnesses.
  Finally, $eta \, alpha \, r$ were fixed from $c$, while $g \, q_0 \, b \, rho \,
    tau$ were fixed from these constants and $ell_j$. Conditions (5.19) require only an upper row-count lower
    bound and an upper bias tolerance. Condition (5.18) is met by choosing $R_j$ large enough;
    below $j$ it uses only the common absolute balance minimum.
    The inverse statement applies to $H \/ B$ even in small dimension by Lemma 8.
    Thus none of these choices depends on the later lower row count or source and branching dimensions. ◻
]

The algorithms in Proposition 27 are now fixed local rules.
  In particular, the right rule always computes its heavy lists from the original law $mu_(cal(R))$ just defined.
  A later conditioning may change the physical law of the hidden buckets; it does not change that algorithm.
  The subsequent rank and repetition arguments use these same rules with their prescribed inputs.

== 6 From tested rank to full rank <sec:lower>

Proposition 27 provides two local decoders whose bilinear forms agree after projection with probability at least
  $gamma_j > 0$. The left form has rank at most one on the displayed lower rows.
  We now show that a positive part of this agreement comes from left forms of bounded rank on the entire lower
  function space. The distinction matters: the form selected by the decoder can depend on the rows on which it is
  tested.

The passage from agreement of restricted forms to a fixed form of bounded rank has a close predecessor in Fei,
  Minzer and Wang #cite(label("FeiMinzerWang2026")) Lemmas 5.15–5.16.
  Here we carry it out for the tree function spaces, using the sparse-projection posterior bound and an estimate
  on affine row and column slices.

Fix the levels $i < j$, and write

$ H_i = H_(D_i) \( E \) \, wide H'_i = H_(D_i) \( O \) subset.eq H_i \, wide K_i = bb(F)_2^(ell_i) \, wide S =
  M_(D_i) . $

All restrictions below use the injective pullback identifying $H'_i$ with a subspace of $H_i$.
  For a bilinear form $F$ on $H_i$, let

$ "Gram"_F \( S \) = #scale(x: 120%, y: 120%)[\(] F \( S_u \, S_v \)
  #scale(x: 120%, y: 120%)[\)]_(1 lt.eq u \, v lt.eq ell_i) . $

Call $F$ #emph[admissible at $S$] if there is a linear functional $z in \( H_i^2 \)^(*)$ such that

#[#set math.equation(numbering: n => "(6.1)")
 $ F \( x \, y \) = z \( x y \) \, wide z \( 1 \) = 1 \, wide "rank" "Gram"_F \( S \) lt.eq 1 . $ <eq:lower-admissible>]

The left form in Proposition 27 is admissible: its functional on $H_(D_j) \( E \)$ restricts to $H_i^2$,
  since $D_i$ is a proper descendant of $D_j$. On a default input a legal point evaluation has the same
  properties. Admissibility is a condition on the left input and output alone;
  in these finite spaces it can also be checked by solving the linear equations for $z$ and computing a matrix rank.

=== 6.1 Local tapes and the unfiltered pair experiment <local-tapes-and-the-unfiltered-pair-experiment>

We first specify the randomness to be used without enlarging either decoder’s information.
  At the modified cut at $D_i$, condition on $E \, O$, the projections and the path through $D_i$.
  The advice outside the list $S$ is generated by independent exterior ingredients,
  independent uniform descendant arrays in their projected spaces,
  and a bounded number of independent uniform scalar calls in $H'_i$.
  The scalar calls generate all dependencies of ancestor arrays and the visible level-$j$ buckets.
  The list $S$ uses fresh randomness independent of all these calls.
  This uses the stopped-call representation of Lemma 19, with the independent cut rows in the modified experiment
  defined before Lemma 21. In particular, already assembled ancestor arrays are functions of these calls and the
  exterior ingredients; they are not additional independent exterior variables.

The direct-row representation in Equation (4.3) uses $hat(T)_i$ scalar cut rows, including the rows of $S$.
  The lower resampling below adds one independent row, giving the count $hat(T)_i + 1$ for that comparison.
  Calls may be included before the row map $A$ selects which level-$j$ buckets are visible.
  Thus their number depends on the fixed row and product counts, and not on $n_i$ or on branching at higher levels.

The left decoder receives $E$, the path through $D_i$, its displayed arrays including $S$, the upper row map $A$,
  and the prescribed visible upper buckets as functions on its own domains.
  It receives neither $O$, the projection choices, nor the omitted lower direction $a_i$.
  The right decoder receives its corresponding data on $O$, together with $a_i$ and $S med mod med a_i$,
  and receives no ingredients determining the missing part of $S$.
  The latent data just described are an analytical representation of these inputs,
  not additional inputs to the decoders.

A #emph[complete local random tape] specifies the decoder’s random choices on every possible local input.
  Since all input and output sets are finite, each randomized decoder is a distribution on deterministic local
  functions. Averaging therefore permits fixing both complete tapes while preserving any hypothesized
  unconditional agreement probability. Such a fixing does not condition on a realized answer or on an agreement
  event. For a cutoff $s$, erase a left output if it is not admissible at its own input or if its full rank is at
  most $s$. This erasure depends only on the left input and its fixed tape.

#thm([Lemma 6.1.])[
  (Resampling and transfer to full equality).  #emph[Fix complete local tapes and the left erasure just described.
    Suppose the nonerased left form agrees with the right form on $H'_i times
    H'_i$ with probability $h$ in the modified experiment. Let $L_i$ be a simultaneous child likelihood bound for
    the lifted raw cut data, including the rows of $S$ and one additional independent row.
    Let $upsilon_i$ bound the total variation between these lifted data and their unrestricted uniform version.
    There is an unrestricted experiment in which $S in K_i ⊗ H_i$ and $l in
    H_i$ are independent uniform variables, $a_i in K_i \\ { 0 }$ is uniform and independent, and
#[#set math.equation(numbering: n => "(6.2)")
 $ Pr_(upright("unif")) #scale(x: 120%, y: 120%)[\[] f \( S \) =
   f \( S + a_i l \) eq.not tack.t #scale(x: 120%, y: 120%)[\]] gt.eq h^2 - frac(2 beta_i L_i, 1 - beta_i) -
   upsilon_i . $ <eq:lower-full-equality>]

 Here $f$ also depends on background data independent of $\( S \, a_i \, l \)$ conditional on the domains.
   For every fixing of that background it is one partial table on $K_i ⊗ H_i$, with no $a_i$ or $l$ input.
   Every defined output is admissible at its argument and has full rank greater than $s$.]
] <lem:resampling>

#proof[
  We use two disintegrations of the same pair distribution.
    The first establishes a lower bound for agreement of restrictions;
    the second bounds the chance that unequal full forms become equal after projection.
  For the first disintegration, let $cal(C)$ include both domains, all projections, the path through $D_i$, $A$,
    exterior ingredients, descendant arrays, and all cut calls other than those generating $S$.
    The fixed tapes are part of this background. Conditional on $\( cal(C) \, a_i \)$,
    the list $S$ is uniform in $K_i ⊗ H'_i$. Write $q = S med mod med a_i$.
    Once $\( cal(C) \, a_i \, q \)$ is fixed, the right input and hence its answer $F_R$ are fixed. Let
  $ p \( cal(C) \, a_i \, q \) = Pr #scale(x: 120%, y: 120%)[\[] f \( S \) eq.not tack.t \, med
    f \( S \) \|_(H'_i times H'_i) = F_R divides cal(C) \, a_i \, q #scale(x: 120%, y: 120%)[\]] . $
  Draw $S \, S'$ independently from this same quotient fiber. Conditional independence and then Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(6.3)")
   $ Pr \[ upright("both draws agree with ") F_R upright(" and are nonerased") \] =
     bb(E) \[ p^2 \] gt.eq \( bb(E) p \)^2 = h^2 . $ <eq:lower-fiber-square>]
  In particular both defined left restrictions agree with each other with probability at least $h^2$.
  Before either agreement event is inspected, this pair distribution has the following exact alternative description:
  #[#set math.equation(numbering: n => "(6.4)")
   $ cal(C) upright(" has its original law") \, wide a_i upright(" is uniform nonzero") \,\
S upright(" is uniform in ") K_i ⊗ H'_i \, wide l upright(" is independently uniform in ") H'_i \,\
S' = S + a_i l . $ <eq:lower-unfiltered-law>]
  Indeed the quotient $q$ has its original marginal, the first draw is uniform,
    and for every fixed $S$ the map $l mapsto S + a_i l$ is a bijection from $H'_i$ onto the fiber containing $S$.
    Thus the pair construction has introduced no filtering by either success or rank.
    The inequality in Equation (6.3) is an event probability under the unfiltered law (6.4).
  For the second disintegration, expose $E$, the independent exterior ingredients, the path through $D_i$, $A$,
    the fixed tapes, and $a_i$. Within each child of $D_i$, expose only the #emph[lifted raw block]:
    the child summands for all cut calls, including the rows of $S$ and $l$, and its descendant arrays.
    Do not expose $O$, projection metadata, the right answer, or any success event.
    Let $cal(D)$ denote this exposure. All visible left inputs for both draws are functions of $cal(D)$.
    Consequently both full left outputs are determined by $cal(D)$, even though the projection flags need not be.
  Write $F_0 = f \( S \)$ and $F_1 = f \( S + a_i l \)$. On inputs where either value is undefined,
    assign that output the zero bilinear form solely for applying Lemma 22.
    The resulting two forms are functions of the permitted lifted data $cal(D)$.
    That lemma applies with the enlarged call family containing the extra row $l$:
    the exposure includes the independent direction and fixed tapes, but no projection metadata or right response.
    Its bilinear consequence (4.12) therefore gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ Pr #scale(x: 120%, y: 120%)[\[] F_0 \, F_1 eq.not tack.t \, med F_0 eq.not F_1 \, med
     F_0 \|_(H'_i times H'_i) = F_1 \|_(H'_i times H'_i) #scale(x: 120%, y: 120%)[\]] lt.eq
     frac(2 beta_i L_i, 1 - beta_i) . $ <eq:lower-bad-restriction>]
  Here $F_0 \, F_1 eq.not tack.t$ refers to the original partial-table outputs.
    The inequality is unconditional under the pair law (6.4);
    neither successful draw has been used as a conditioning event.
    Subtracting Equation (6.5) from the event probability in Equation (6.3) yields full defined equality with
    probability at least $h^2 - 2 beta_i L_i \/ \( 1 - beta_i \)$.
  Full defined equality depends only on $E$, the lifted raw data and the independent exterior choices.
    Lemma 21, applied with the extra row $l$, therefore transfers this event at loss at most $upsilon_i$ to the
    unrestricted cut law. In that law $S \, l$ are fresh independent uniforms on $H_i$,
    all other cut calls and descendant arrays are independent of them, and $a_i$ is independent of all these data.
    This proves Equation (6.2).
  For clarity, the function evaluated at an arbitrary unrestricted input $S$ is the original left algorithm on its
    reconstructed input, followed by the local erasure. In particular, its space $B = B \( S \)$,
    splitting of $H_(D_j) \( E \) \/ B \( S \)$, good-advice predicate and chosen upper slice witness are
    recomputed from that input. The usefulness marks and witness selection #emph[rules] remain the fixed rules of
    Section 5; their values are not held constant as $S$ varies.
    Neither $a_i$ nor $l$ is passed to this algorithm. Values outside the original support are defined by the same
    local extension and erased if they fail (6.1). Fixing the other independently generated data therefore leaves
    a single partial table $f \( S \)$ with all the asserted pointwise properties. ◻
]

We have converted substantial high-rank agreement into equality of one partial table under an ordinary rank-one
  step. The inverse theorem will select a single output form dense on a row/column slice.
  The next lemma shows that a fixed form of high rank cannot pass the tested rank condition on such a slice,
  even when its free rows have affine offsets.

=== 6.2 A rank bound on affine slices <a-rank-bound-on-affine-slices>

#thm([Lemma 6.2.])[
  (Fixed forms on affine row/column slices).  #emph[Let $H$ be a finite-dimensional vector space over $bb(F)_2$,
    let $F$ be a bilinear form on $H$, and let $ell \, r' \, m$ be nonnegative integers with $m gt.eq
    1$ and $ell gt.eq 2 m + r'$. Let $cal(A) subset.eq H^ell$ be a nonempty affine slice defined by at most $r'$
    row combinations and at most $r'$ column functionals: for suitable linear maps $A_0$ and $q_1 \, dots.h \,
    q_b in H^(*)$, where $b lt.eq r'$,
$ cal(A) = { S : A_0 S = U \, med S q_v = w_v med \( 1 lt.eq v lt.eq b \) } \, wide
  A_0 upright(" has at most ") r' upright(" rows") . $

 Then, for uniform $S in cal(A)$ and $t_0 = "rank" F - 2 r'$,
#[#set math.equation(numbering: n => "(6.6)")
 $ Pr #scale(x: 120%, y: 120%)[\[] "rank" "Gram"_F \( S \) lt.eq
   1 #scale(x: 120%, y: 120%)[\]] lt.eq \( 2^m - 1 \) 2^(- t_0) +
   #scale(x: 120%, y: 120%)[\[] 1 + \( 2^m - 1 \)^2 #scale(x: 120%, y: 120%)[\]] 2^(- m^2) .
   $ <eq:lower-rank-slice-bound>]

 In particular, if $"rank" F > s$, the first term can be replaced by $2^(m - \( s - 2 r' \))$.]
] <lem:rank-slice>

#proof[
  The form $F$ is fixed throughout this proof. First remove dependent row equations, leaving $a = "rank" A_0 lt.eq
    r'$ independent ones. Nonemptiness of the slice guarantees the corresponding relations among their prescribed
    values. Extend these $a$ row combinations to an invertible matrix $T in
    "Mat"_(ell times ell) \( bb(F)_2 \)$ and put $Y = T S$. The first $a$ rows of $Y$ are fixed.
    Bilinearity gives the congruence
  #[#set math.equation(numbering: n => "(6.7)")
   $ "Gram"_F \( Y \) = T "Gram"_F \( S \) T^(sans(t)) . $ <eq:lower-gram-congruence>]
  It follows that the two Gram matrices have the same rank.
    We are transforming the rows of a fixed form, and make no equivariance assumption about any decoder that might
    have selected $F$.
  Remove dependent column functionals as well, leaving a basis $q_1 \, dots.h \, q_c$ of their span with $c lt.eq
    r'$. Again, the nonempty slice guarantees every required dependence among the right-hand sides.
    The column equations transform to $Y q_v = T w_v$. Define
  $ N = ⋂_(v = 1)^c ker q_v \, wide "codim"_H N = c . $
  After the first $a$ rows have been fixed, the equations on each remaining row are independent of those on the
    other rows and specify a nonempty translate of $N$. Thus the uniform slice measure makes its $ell - a gt.eq
    2 m$ free rows independent, each uniform on a possibly different affine space $u_k + N$.
    This conclusion also covers redundant original equations, zero column span, and zero row rank.
  Let $F_N$ be the restriction of $F$ to $N times N$, and put $t = "rank" F_N$.
    Regard a bilinear form as a map from its first argument space to the dual of its second argument space.
    Restricting the domain from $H$ to $N$ loses at most $c$ in rank.
    Restricting the codomain from $H^(*)$ to $N^(*)$ also loses at most $c$,
    since the restriction map has a kernel of dimension $c$. Consequently
  #[#set math.equation(numbering: n => "(6.8)")
   $ t gt.eq "rank" F - 2 c gt.eq "rank" F - 2 r' = t_0 . $ <eq:lower-rank-loss>]
  Choose two disjoint groups of $m$ free rows, denoted $x_1 \, dots.h \, x_m$ and $y_1 \, dots.h \, y_m$.
    Write $x_u = u_u + n_u$ with independent uniform $n_u in N$. The full functionals supplied by the first group are
  $ lambda_u = F \( x_u \, dot.op \) \|_N = F \( u_u \, dot.op \) \|_N + F \( n_u \, dot.op \) \|_N in N^(*) . $
  Let $V subset.eq N^(*)$ be the image of $F_N$, of dimension $t$.
    Each $lambda_u$ is uniform on its specified translate of $V$, and the $lambda_u$ are independent.
    For any nonzero $e = \( e_1 \, dots.h \, e_m \) in bb(F)_2^m$,
    the sum $sum_u e_u lambda_u$ is uniform on a translate of $V$:
    select one index with $e_u = 1$ and condition on all other summands.
    Its probability of being zero is therefore either zero or $2^(- t)$.
    Taking the union over the $2^m - 1$ nonzero coefficient vectors gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ Pr \[ lambda_1 \, dots.h \, lambda_m upright(" are linearly dependent") \] lt.eq \( 2^m - 1 \) 2^(- t) .
     $ <eq:lower-affine-dependence>]
  The offsets $F \( u_u \, dot.op \) \|_N$ are included in these functionals;
    no claim about independence of only their variable parts is being made.
  Conditional on a realization of the first group for which the $lambda_u$ are linearly independent, the linear map
  $ N arrow.r bb(F)_2^m \, wide n mapsto \( lambda_1 \( n \) \, dots.h \, lambda_m \( n \) \) $
  is surjective. A second-group row $y_v = v_v + n'_v$ has $n'_v$ uniform in $N$,
    independently of the first group and of the other such rows.
    Its cross column $\( F \( x_u \, y_v \) \)_(u = 1)^m$ is a fixed offset plus the image of $n'_v$ under this
    surjection. It is therefore uniform in $bb(F)_2^m$. The cross matrix
  $ C = #scale(x: 120%, y: 120%)[\(] F \( x_u \, y_v \) #scale(x: 120%, y: 120%)[\)]_(1 lt.eq u \, v lt.eq m) $
  is consequently uniform in $"Mat"_(m times m) \( bb(F)_2 \)$, conditional on that first group.
  Exactly one such matrix has rank zero. Every rank-one matrix has a factorization $u
    v^(sans(t))$ with nonzero $u \, v in bb(F)_2^m$, unique over $bb(F)_2$ because the only nonzero scalar is one.
    Hence exactly $1 + \( 2^m - 1 \)^2$ matrices have rank at most one.
    If the full Gram matrix of $Y$ has rank at most one, its cross submatrix $C$ does as well.
    Combining this count with Equations (6.7), (6.8) and (6.9) proves (6.6).
    Finally, $"rank" F > s$ implies $\( 2^m - 1 \) 2^(- t) lt.eq 2^(m - \( s - 2 r' \))$,
    giving the stated simpler bound. Neither symmetry nor nonalternation of $F$ was required. ◻
]

=== 6.3 Positive agreement of bounded-rank forms <positive-agreement-of-bounded-rank-forms>

#thm([Proposition 6.3.])[
  (Low-rank agreement).  #emph[Fix a pair $i < j$ for which Proposition 27 supplies agreement at least $gamma =
    gamma_j > 0$. Apply Theorem 9, including Lemma 8, at the equality threshold
$ eta_(upright("low")) = gamma^2 \/ 8 \, $

 and let $alpha' > 0$, $r'$ and $ell'_0$ be its density, constraint and row-count constants.
   Choose integers $m gt.eq 1$, $s gt.eq 1$ and $ell_i$ such that
#[#set math.equation(numbering: n => "(6.10)")
 $ #scale(x: 120%, y: 120%)[\[] 1 + \( 2^m - 1 \)^2 #scale(x: 120%, y: 120%)[\]] 2^(- m^2) < alpha' \/ 2 \, wide
   2^(m - \( s - 2 r' \)) < alpha' \/ 2 \, wide ell_i gt.eq max { ell'_0 \, 2 m +
   r' } . $ <eq:lower-parameter-conditions>]

 Take $n_i$ sufficiently large that the data in Lemma 28 satisfy
#[#set math.equation(numbering: n => "(6.11)")
 $ frac(2 beta_i L_i, 1 - beta_i) lt.eq gamma^2 \/ 64 \, wide upsilon_i lt.eq gamma^2 \/ 64 \, wide beta_i =
   n_i^(- 2 \/ 3) . $ <eq:lower-error-conditions>]

 Then the original randomized decoders satisfy, in the modified experiment,
#[#set math.equation(numbering: n => "(6.12)")
 $ Pr #scale(x: 120%, y: 120%)[\[] F_L \|_(H'_i times H'_i) = F_R \, med F_L upright(" is admissible at ") S \,
   med "rank" F_L lt.eq s #scale(x: 120%, y: 120%)[\]] gt.eq gamma \/ 2 . $ <eq:lower-low-rank-mass>]

 The rank cutoff and row-count requirements depend only on the upper agreement constant.
   The likelihood and total-variation requirements can be met after the source alphabet and lower branching
   numbers have been fixed, without any dependence on higher branching numbers.]
] <prop:low-rank>

#proof[
  Suppose instead that agreement from left outputs of rank greater than $s$ has probability at least $gamma \/ 2$.
    Fix complete local tapes preserving this high-rank agreement mass, and erase the left outputs as above.
    Since the original left decoder is admissible, this leaves nonerased agreement probability $h gt.eq
    gamma \/ 2$. By Lemma 28 and Equation (6.11), the unrestricted experiment satisfies
  $ Pr_(upright("unif")) \[ f \( S \) = f \( S + a_i l \) eq.not tack.t \] gt.eq gamma^2 / 4 - gamma^2 / 64 -
    gamma^2 / 64 = frac(7 gamma^2, 32) > eta_(upright("low")) . $
  Fix the domains and all remaining independent background data at a value for which this equality probability is
    at least $eta_(upright("low"))$. Conditional on this fixing, $S \, l \,
    a_i$ still have the independent uniform laws required by the inverse theorem.
    The output alphabet is the finite set of bilinear forms on this fixed $H_i$;
    its size has no effect on the inverse constants.
  Theorem 9 now selects one #emph[fixed] defined output $F$ and a nonempty affine row/column slice,
    with at most $r'$ constraints of either type, on which $f \( S \) = F$ has density at least $alpha'$.
    Every such occurrence satisfies $"rank" F > s$ and $"rank" "Gram"_F \( S \) lt.eq 1$,
    by the pointwise definition of the partial table. Only after fixing this output do we apply the row operations
    in Lemma 29. That lemma and Equation (6.10) show that the latter rank event has density strictly less than
    $alpha'$ on the same slice, a contradiction. Dependence of $B \( S \)$ and the upper witness on $S$ does not
    enter this step: at each occurrence of the selected form its Gram rank condition holds on that occurrence’s
    own list.
  Thus high-rank agreement has probability less than $gamma \/ 2$ for the original randomized decoders.
    Subtracting it from the agreement mass at least $gamma$ proves Equation (6.12).
    The temporary fixing of tapes was used only to refute the hypothesized high-rank mass;
    it has not replaced the original decoder algorithms in the conclusion.
  For the parameter claims, the second summand in Equation (6.6) tends to zero as $m$ grows.
    Choose $m$ first, then $s$, and then $ell_i$ as in (6.10). All these choices depend only on $gamma$.
    The finite likelihood bound $L_i$ is fixed once the source alphabet, upper row and product counts,
    and lower branching numbers have been fixed; the extra resampling row changes only this finite bound.
    Lemmas 21 and 22 then make both losses in (6.11) arbitrarily small by increasing $n_i$.
    For the finitely many upper levels $j > i$, one may meet all row requirements and take the maximum rank
    cutoff. Increasing a cutoff only strengthens every high-rank exclusion already proved. ◻
]

The resulting agreement event supplies a normalized product form of bounded full rank.
  Its restrictions to the atomic indicators at a leaf will produce an odd list of at most $s$ legal answers.
  The next section turns those lists into local strategies on many independent source questions.

== 7 Clean children and independent repetition <sec:clean>

A normalized product form of bounded rank determines a short odd list of answers at each source leaf.
  When the decoded forms agree after projection, their lists satisfy a projection constraint.
  To apply parallel repetition to these lists, we must recover independent source edges and local answer rules
  despite their sampled advice.

We do this by finding projected children whose contributions to every sampled function are zero.
  The probability of this event is exactly independent of their source questions.
  Revealing the remaining data therefore leaves independent source edges at designated leaves,
  and each player can reconstruct its original decoder input from its own questions there.
  Repetition then bounds the low-rank agreement from Proposition 30.

Fix levels $i < j$ and use the modified experiment at $D_i$ throughout this section. Write

$ H_i = H_(D_i) \( E \) \, wide H'_i = H_(D_i) \( O \) \, wide S = M_(D_i) . $

We identify $H'_i$ with its pullback subspace of $H_i$. The integer $s gt.eq
  1$ is a full-rank cutoff as in Proposition 30. The source game, denoted by $G_(upright("src"))$,
  is a fixed $t$-fold power of the clause–variable game. For a source question $u$ on the left and $v$ on the
  right, write $Lambda_u$ and $Gamma_v$ for their nonempty legal answer sets.
  Thus $Gamma_v = bb(F)_2^t$, with a separate coordinate for each slot,
  including slots with repeated variable IDs. Let $mu$ be the distribution on source edge records
  $e = \( u \, v \, pi_e \)$.

=== 7.1 Odd lists and leaf indicators <odd-lists-and-leaf-indicators>

For a finite nonempty set $Lambda$, define

$ cal(O)_s \( Lambda \) = { L subset.eq Lambda : 1 lt.eq \| L \| lt.eq s \, \| L \| upright(" odd") } . $

Given a map $pi : Lambda arrow.r Gamma$, define its parity pushforward by

#[#set math.equation(numbering: n => "(7.1)")
 $ pi_(upright("odd")) \( L \) = { b in Gamma : \| L ∩ pi^(- 1) \( b \) \| upright(" is odd") } .
   $ <eq:clean-parity-map>]

The same parity pushforward describes restriction of Fourier characters in low-degree long-code analysis
  #cite(label("DinurGuruswami2015")) Section 2.3, Equation (1), ECCC version.
  The odd-list game $G_(upright("odd") \, s)$ has the same questions and edge distribution as
  $G_(upright("src"))$, legal answers $cal(O)_s \( Lambda_u \)$ and $cal(O)_s \( Gamma_v \)$,
  and edge map $\( pi_e \)_(upright("odd"))$.

#thm([Lemma 7.1.])[
  (Odd-list projection and extraction).  #emph[Every map in Equation (7.1) sends $cal(O)_s \( Lambda \)$ into
    $cal(O)_s \( Gamma \)$. In particular, $G_(upright("odd") \, s)$ is a total projection game, and
#[#set math.equation(numbering: n => "(7.2)")
 $ "val" \( G_(upright("odd") \, s) \) lt.eq s^2 "val" \( G_(upright("src")) \) . $ <eq:clean-list-value>]

 Suppose a bilinear form $F$ on $H_i$ has the form
$ F \( x \, y \) = z \( x y \) \, wide z in \( H_i^2 \)^(*) \, wide z \( 1 \) = 1 \, wide "rank" F lt.eq s . $

 For every leaf $lambda$ below $D_i$, with local answer set $Lambda_lambda$,
   its diagonal on the leaf indicators specifies a member of $cal(O)_s \( Lambda_lambda \)$.
   If that leaf is projected by $pi_e$ and a form $F'$ on $H'_i$ equals the restriction of $F$,
   then its corresponding diagonal list is the parity pushforward of the left list.]
] <lem:parity-game>

#proof[
  For $L in cal(O)_s \( Lambda \)$, summing all preimage multiplicities modulo two gives
  $ \| pi_(upright("odd")) \( L \) \| equiv \| L \| equiv 1 med \( mod med 2 \) . $
  Each member of $pi_(upright("odd")) \( L \)$ has at least one preimage in $L$,
    and these preimage sets are disjoint. Consequently its size is at most $\| L \|$, proving totality.
  Take any deterministic labeling of the odd-list game. Each player independently chooses a uniformly random
    member of the list it would return. On an accepted list edge,
    the two lists contain an accepting ordinary answer pair: any element of the nonempty right list has an odd,
    hence positive, number of preimages in the left list. The independent choices select some accepting pair with
    probability at least $1 \/ \( \| L \| \| R \| \) gt.eq s^(- 2)$.
    This is a legal randomized source strategy; averaging deterministic answer tables bounds its success by
    $"val" \( G_(upright("src")) \)$. Maximizing over the list labeling proves Equation (7.2).
  For the extraction statement, let $e_a$ be the indicator that the answer at leaf $lambda$ is $a in
    Lambda_lambda$, extended by ignoring every other leaf. By Definition 11, $e_a in H_i$.
    Pointwise multiplication gives
  $ e_a e_b = 0 quad \( a eq.not b \) \, wide e_a^2 = e_a \, wide sum_(a in Lambda_lambda) e_a = 1 . $
  Thus $\( F \( e_a \, e_b \) \)_(a \, b)$ is diagonal, with diagonal $d_a = z \( e_a \)$.
    Its rank is the integer $\| { a : d_a = 1 } \|$ and is at most $"rank" F lt.eq s$.
    Moreover, $sum_a d_a = z \( 1 \) = 1$ in $bb(F)_2$, so this support is odd and nonempty.
  For a projected answer $b$, the pullback of its indicator is
  $ e'_b = sum_(a : pi_e \( a \) = b) e_a . $
  Agreement of the forms and the diagonal identity imply
  #[#set math.equation(numbering: n => "(7.3)")
   $ F' \( e'_b \, e'_b \) = sum_(a : pi_e \( a \) = b) d_a . $ <eq:clean-indicator-pushforward>]
  The support on the right is exactly the parity pushforward in Equation (7.1), completing the proof. ◻
]

Low-rank symmetric matrices also yield short assignment lists in the quadratic-code analysis of Khot and Saket,
  through rank-one decompositions #cite(label("KhotSaket2017")) Lemma 2.1 and Section 7.2, ECCC version.
  Here the orthogonal leaf indicators give the lists directly as diagonal supports of legal answers.

We use a total local extraction rule also when a decoder fails to return such a form.
  Order the legal answers to every source question once and for all.
  At each designated leaf, a player reads the diagonal support of its own output form.
  If that support is odd and has size at most $s$, it returns the support.
  If the output is not a form or this test fails, it returns the singleton consisting of the first legal answer to
  its own question. The test and default use only that player’s input and output.
  In particular, the right player need not determine the rank or validity of the left form.
  These rules produce legal lists on every input, and Lemma 31 identifies their outputs whenever normalized
  low-rank agreement occurs.

=== 7.2 An exact law for vanishing advice <an-exact-law-for-vanishing-advice>

Zero advice was already used to hide a source coordinate and recover soundness under repetition by Khot,
  Minzer and Safra #cite(label("KhotMinzerSafra2017")) Sections 3.3–3.4, especially Remark 3.2.
  Here we zero all sampled contributions from selected children and prove that the resulting conditional source
  law is exactly a product law.

Choose the first leaf of each child of $D_i$ as its designated leaf. This choice depends only on the ordered tree.
  We will express every uniform cut draw as a sum of independent child contributions.
  A projected child will be clean when all its contributions and all its internal arrays are zero.
  Its arguments then disappear from the sampled functions, while the zero probability can be computed on that
  child’s projected domain.

The family of contributions must cover every input used by the decoders.
  Stop every recursive scalar call used by an ancestor array when it first reaches $D_i$,
  including the calls for every bucket of $M = M_(D_j)$. Fix this family before the row map $A$ selects visible
  buckets, and add the $ell_i$ independent rows of the uniform matrix $S$. By Equation (4.3), its size is

#[#set math.equation(numbering: n => "(7.4)")
 $ T_i^(upright("cl")) = hat(T)_i = ell_i + sum_(h = i + 1)^d \( 2^(ell_h) - 1 \)
   product_(p = i + 1)^h \( 2 R_p \) . $ <eq:clean-call-count>]

Indeed, an array at level $h$ has $2^(ell_h) - 1$ scalar buckets,
  and each scalar call at level $p > i$ makes $2 R_p$ calls in its path child.
  All other contributions lie outside $D_i$, and distinct calls use fresh randomness.
  If a recipe uses fewer calls, pad it with independent unused calls to reach $T_i^(upright("cl"))$.
  Thus the call count is fixed before any visibility decision.
  The notation $T_i^(upright("cl"))$ distinguishes this family from those enlarged by extra rows in comparison
  experiments.

Let $Xi$ record the questions outside $D_i$, the path through $D_i$,
  the exterior ingredients of the stopped expressions, and all other arrays supported outside $D_i$.
  Include the independent choices $A$ and $a_i$ after fixing the call family.
  Record each exterior function on the domain of its supporting subtree,
  together with its location in the expression. This representation requires no endpoint questions inside $D_i$;
  each player will later extend it to its own product domain by ignoring the other arguments.
  Assembled ancestor values are still functions of the pending cut calls and are not exposed in $Xi$.
  Consequently $Xi$ depends only on exterior source records and independent exterior randomness,
  so the source samples inside $D_i$ retain their independent laws conditional on $Xi$.

It is convenient to sample a complete source edge at every leaf, even when its child will remain unprojected.
  This merely augments the modified experiment: sample the left question and then a source projection conditional
  on it, using that projection only if the child is selected.
  For each child $C$ of $D_i$, independently let $P_C$ be its projection flag, with $Pr \( P_C = 1 \) = beta_i =
  n_i^(- 2 \/ 3)$. Write $bold(e)_C$ for the tuple of source edge records at its leaves and $m_i$ for the number
  of those leaves. Thus $bold(e)_C$ has distribution $mu^(⊗ m_i)$.

Generate cut call $q in \[ T_i^(upright("cl")) \]$ by taking, independently for all $q \, C$, a uniform latent summand

$ U_(q \, C) in H_C \( O \)^2 \, wide U_q = sum_(C upright(" child of ") D_i) U_(q \, C) . $

The sum is uniform in $H'_i$ because the addition map from the product of the child square spaces onto $H'_i$ is a
  surjective linear map. Its fibers all have the same size.
  The resulting calls are independent, and are independent of the uniform arrays at every nonleaf proper
  descendant of $D_i$. The first $ell_i$ calls can therefore serve as the rows of $S$,
  with the rest substituted in the stopped ancestor expressions.
  This is exactly the modified sampling law on the visible arrays.
  No direct-sum assumption on the child spaces is involved.

Call $C$ #emph[clean] if $P_C = 1$, every $U_(q \, C)$ is zero,
  and every sampled array at a nonleaf node in the subtree rooted at $C$ is zero.
  Write $cal(C)$ for the set of clean children.

#thm([Lemma 7.2.])[
  (Exact clean probability and conditional source law).  #emph[Conditional on any exterior datum $Xi =
    xi$ of positive probability, the clean indicators are independent.
    In the padded construction above each has probability $beta_i p_(0 \, i)$, where
#[#set math.equation(numbering: n => "(7.5)")
 $ p_(0 \, i) = 2^(- T_i^(upright("cl")) dim \( H'_C ""^2 \) - sum_(D prec.curly.eq C\
D upright(" nonleaf")) ell_("level" \( D \)) dim H'_D) > 0 . $ <eq:clean-zero-probability>]

 Here $D prec.curly.eq C$ includes $D = C$, and $H'_D$ is the function space on a fully projected subtree of the
   indicated shape. The exponent has the same value for every child and every choice of source questions and
   projection positions. It depends only on the source power, the fixed row and product counts,
   and branching below level $i$; it is independent of the instance, $n_i$, and all higher branching numbers.]
  #emph[After fixing $cal(C)$, expose all source questions,
    projection choices and latent data at nonclean children, and all source edge records at nondesignated leaves
    of clean children. Denote this additional exposure together with $Xi$ and $cal(C)$ by
    $cal(D)_(upright("pub"))$. Conditional on every value of $cal(D)_(upright("pub"))$ of positive probability,
    the source edge records at the designated clean leaves are independent and each has distribution $mu$.]
] <lem:clean-law>

#proof[
  Fix $Xi = xi$ and a child edge tuple $bold(e)_C$. Conditional on $P_C = 1$,
    the $T_i^(upright("cl"))$ latent summands in that child are independent uniform points of $H'_C ""^2$.
    Their probability of all being zero is $2^(- T_i^(upright("cl")) dim \( H'_C ""^2 \))$.
    An independent uniform $ell_p$-row array in $H'_D$ is zero with probability $2^(- ell_p dim H'_D)$.
    Multiplication over all such descendant arrays proves Equation (7.5).
    This calculation sets each latent summand to zero separately.
    The possibility that nonzero summands could cancel, including shared constants,
    has no effect on this event or on its probability.
  We next prove that the displayed probability is exactly independent of $bold(e)_C$.
    Each fully projected leaf has answer domain $bb(F)_2^t$. Given two projected subtrees of the same ordered
    shape, identify these domains coordinatewise, retaining a separate factor at every leaf and every source-power
    slot. Pullback by this product bijection identifies their full leaf function spaces.
    It preserves sums and pointwise products, so induction through the tree identifies every corresponding $H'_D$
    and $H'_D ""^2$. In particular their dimensions agree. Neither the question IDs nor the selected projection
    positions enter these identifications. Even a right question $\( v \, v \)$ has the full answer domain
    $bb(F)_2^2$ in its two slots; it does not identify their answer coordinates.
  Consequently, for every possible edge tuple $bold(e)$,
  #[#set math.equation(numbering: n => "(7.6)")
   $ Pr \( bold(e)_C = bold(e) \, C in cal(C) divides Xi = xi \) =
     mu^(⊗ m_i) \( bold(e) \) thin beta_i p_(0 \, i) . $ <eq:clean-factorization>]
  The latent child blocks, edge tuples and flags are independent across children conditional on $Xi$.
    Thus the clean indicators are independent, and the constant factor in Equation (7.6) cancels on conditioning
    that a child is clean. The entire edge tuple in each clean child retains its original product law.
    Positivity of a question-dependent zero probability would not suffice for this cancellation;
    its constancy has just been proved.
  Fixing the whole clean mask still leaves a product across children.
    Exposing full data of nonclean children therefore imposes no additional condition on any clean edge tuple.
    Within each clean child, fixing the nondesignated edge records in its product tuple leaves the designated edge
    with law $mu$. This proves the asserted law conditional on $cal(D)_(upright("pub"))$.
    Natural repetitions of an ID in different samples are permitted throughout;
    this exposure neither requires nor forbids a collision with an exposed ID.
  Finally, the child shapes involve only $n_1 \, dots.h \, n_(i - 1)$,
    and Equation (7.4) involves row and product counts but no branching numbers.
    This proves the stated parameter dependence. If $i = 1$, the children are leaves and the descendant-array sum
    is empty, with value zero, so the same argument applies. ◻
]

=== 7.3 Reconstructing the original local strategies <reconstructing-the-original-local-strategies>

The preceding lemma leaves independent source questions, but repetition also requires local answer rules on those
  questions. Here the input restriction is substantive: the left decoder in Proposition 27 never receives $a_i$,
  while the right decoder receives $S$ only modulo $a_i$. We now reconstruct precisely those inputs after the
  final exposure.

#thm([Lemma 7.3.])[
  (Local reconstruction on clean children).  #emph[Fix $cal(D)_(upright("pub")) =
    d_0$ of positive probability as in Lemma 32. From $d_0$ and its own designated source questions in $cal(C)$,
    each player can reconstruct its input to the original decoder of Proposition 27.
    Composing these decoders with the total diagonal extraction rule defines local strategies for
    $G_(upright("odd") \, s)^(⊗ \| cal(C) \|)$. Whenever their original forms agree on $H'_i$ and the left form is
    normalized, of product form, and of full rank at most $s$, these strategies accept every designated clean edge.]
] <lem:reconstruction>

#proof[
  First reconstruct the two question tuples. The left player combines its designated clause-tuple questions with
    all the exposed questions to obtain $E$. It does not need the selected positions or variable IDs at its
    designated clean leaves. The right player combines its designated variable-tuple questions with the exposure
    to obtain $O$: every clean child is projected, and the entire question and projection data at every nonclean
    child are exposed. The right player does not need the missing clause-tuple questions.
    Repeated IDs specify separate slots in both reconstructions.
  We next reconstruct the functions appearing in the advice.
    At a nonclean child the exposure supplies its actual latent summands and descendant arrays,
    including the projections needed to pull them back on the left.
    At a clean child substitute a zero symbol for each latent summand and descendant row.
    Such a symbol specifies only its call, row and tree location.
    The left interprets it as the zero function on its own original domain;
    the right interprets it as the zero function on its own projected domain.
    It carries no missing endpoint ID, selected position or partner-domain metadata.
    In either interpretation it equals the corresponding actual function,
    because zero pulls back to zero under every projection.
  Sum these child contributions to obtain every cut call, including all rows of $S$.
    Then evaluate the stopped expressions using the exposed exterior ingredients.
    This yields all ancestor arrays and all their individual buckets,
    hence every nonhidden bucket required by the decoders. This is a reconstruction from the chosen sampled
    decomposition, not an attempt to recover a unique decomposition from the resulting function.
    Overlaps of constants between child spaces, or other nonuniqueness of a sum representation,
    do not alter the resulting sums.
  To check that no missing domain information enters these expressions,
    consider the full algebra of functions on the product of all leaf domains that ignore the arguments in clean
    children. It contains constants and is closed under sums and pointwise products.
    Every reconstructed cut call belongs to this algebra: its clean summands are zero and its other summands are
    supported on nonclean children. Every exterior ingredient also belongs to it,
    since its support is outside $D_i$. Induction over each stopped expression therefore shows that every
    reconstructed ancestor function ignores all clean arguments.
    Descendant arrays in clean children are identically zero.
    Thus products at higher levels cannot introduce dependence on the unavailable endpoint questions.
  Each player now has its own domains and all the functions supplied to its decoder.
    It can form their reduced-support partition keys, consult the fixed labeling,
    and restore the evaluations of the selected parts in its own domain, using the conventions of Section 3.
    For each reconstructed sampled joint function, every clean slot is unused,
    so canonicalization discards that slot and its domain metadata.
    On nonclean projected slots, the exposed projection supplies the necessary pullback;
    on designated clean slots, the functions just proved independent of those arguments require none.
    A decoder can also evaluate any hypothetical matrices called for by its algorithm:
    it constructs them on its own now-known domain. Such additional matrices need not ignore the designated
    arguments, since the player already knows its own questions there.
  Although this final public record may determine full $S$,
    the simulated right decoder is called with its original input $S med mod med a_i$.
    Similarly the left decoder is called without $a_i$, even though the final public record may contain that
    direction. Neither decoder receives the reconstructed hidden $M$ or additional buckets that are absent from
    its specified input. Extra public information in the simulation is simply omitted from the relevant arguments.
    All information used to form the original arguments is a function of $d_0$ and the player’s own designated
    questions.
  The simulation runs the same fixed algorithms on these reconstructed inputs.
    The left uses its fixed usefulness marks and deterministic witness rule.
    The right computes the heavy lists in Equation (5.20) using the original law and response function determined
    by its own input in Section 5.3, then applies the same selection and contraction rules.
    Conditioning on $cal(D)_(upright("pub"))$ may change the physical distribution of the sampled hidden buckets,
    but it does not change the reference law prescribed by this algorithm.
    The local simulation therefore requires no small-bias assertion under the clean conditioning.
  Finally, run the total diagonal extraction rule at the designated clean leaves.
    Each player has exactly its own source question there, so this is a legal local answer rule on the repeated
    game. The rules are defined even on inputs on which the original decoder chooses a default,
    produces a high-rank form, or fails the diagonal test. On normalized low-rank agreement,
    Lemma 31 says that the left supports are valid odd lists and their right supports are their parity
    pushforwards. Both diagonal tests then pass, so every designated clean edge accepts.
    This is an event inclusion, with no conditioning on the forms’ validity, their agreement, or their rank. ◻
]

=== 7.4 The vanishing upper bound <the-vanishing-upper-bound>

We can now bound low-rank agreement in the original modified law.
  All public exposures used for this purpose have already been specified, and none includes a useful-advice event,
  a slice event, a decoder output or a successful character match.

#thm([Proposition 7.4.])[
  (Clean repetition bound).  #emph[Assume $"val" \( G_(upright("src")) \) < 1 \/ \( 2 s^2 \)$.
    Let $cal(L)_(i \, j \, s)$ be the event in the modified experiment that the two original decoder outputs agree
    on $H'_i$, while the left output is a normalized product form on $H_i$ of full rank at most $s$.
    Then, for the clean probability in Equation (7.5),
#[#set math.equation(numbering: n => "(7.7)")
 $ Pr \( cal(L)_(i \, j \, s) \) lt.eq (1 - frac(beta_i p_(0 \, i), 64))^(n_i) lt.eq
   exp #h(-0.16667em) (- p_(0 \, i) / 64 n_i^(1 \/ 3)) . $ <eq:clean-final-bound>]

 The bound holds for randomized decoders and is uniform over the source instance and over the fixed labeling.]
] <prop:clean-bound>

#proof[
  Lemma 31 gives $"val" \( G_(upright("odd") \, s) \) < 1 \/ 2$.
    Fix a public record $cal(D)_(upright("pub")) = d_0$, and put $k = \| cal(C) \|$.
    By Lemma 32, its designated edge records have exactly the independent product distribution of $k$ source
    samples. By Lemma 33, the original decoders and the total extraction rules give local strategies for the
    corresponding odd-list game. Theorem 5, with gap $1 \/ 2$,
    bounds their probability of accepting all $k$ edges by $\( 63 \/ 64 \)^k$.
    For $k = 0$ the bound is interpreted as one. Private or shared random tapes independent of the questions cause
    no difficulty: fixing complete tapes gives deterministic local functions,
    to each of which the same bound applies, and then one averages over those tapes.
  The event inclusion in Lemma 33 therefore gives
  $ Pr \( cal(L)_(i \, j \, s) divides cal(D)_(upright("pub")) = d_0 \) lt.eq \( 63 \/ 64 \)^(\| cal(C) \|) . $
  This inequality bounds the favorable agreement event; that event has never been used to define the conditional
    source distribution or the local strategies. Average over $cal(D)_(upright("pub"))$,
    and then use independence of the clean indicators conditional on $Xi$.
    In the padded construction this yields the exact generating-function identity
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \( 63 \/ 64 \)^(\| cal(C) \|) divides Xi #scale(x: 120%, y: 120%)[\]] =
    product_(C upright(" child of ") D_i) (1 - beta_i p_(0 \, i) + 63 / 64 beta_i p_(0 \, i)) =
    (1 - frac(beta_i p_(0 \, i), 64))^(n_i) . $
  The second bound in Equation (7.7) follows from $1 - x lt.eq e^(- x)$ and $n_i beta_i = n_i^(1 \/ 3)$. ◻
]

#prodef([Remark 7.5.])[
  (Exterior-dependent call families).  The padded family above gives one constant clean probability.
    The argument also permits independent exterior recipe choices with $T_i^(upright("cl")) \( xi \) lt.eq
    T_i^(upright("cl"))$ calls. Substituting this count in Equation (7.5) gives an exact question-independent
    probability $p_(0 \, i) \( xi \) gt.eq p_(0 \, i)$. If the recipe differs between children,
    denote these probabilities by $p_(0 \, C) \( xi \)$. Conditional on $Xi = xi$,
    the clean indicators remain independent, and every $p_(0 \, C) \( xi \)$ is at least $p_(0 \, i)$.
    The exact factors, rather than this lower bound, cancel in Equation (7.6);
    hence the conditional source law and the local reconstruction are unchanged.
  The same generating-function calculation then gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ Pr \( cal(L)_(i \, j \, s) \) lt.eq bb(E)_Xi product_(C upright(" child of ") D_i)
     (1 - frac(beta_i p_(0 \, C) \( Xi \), 64)) lt.eq exp #h(-0.16667em) (- p_(0 \, i) / 64 n_i^(1 \/ 3)) .
     $ <eq:clean-exterior-average>]
  Only the second inequality uses the uniform positive lower bound.
]

For the decoders supplied by Proposition 27, Proposition 30 gives $Pr \( cal(L)_(i \, j \, s) \) gt.eq
  gamma_j \/ 2$. Once the source power and the lower branching numbers have been fixed,
  $p_(0 \, i) > 0$ is already fixed independently of $n_i$ and of higher branching. Taking, for example,

$ n_i^(1 \/ 3) > 64 / p_(0 \, i) log 4 / gamma_j $

makes Equation (7.7) smaller than $gamma_j \/ 4$, a contradiction.
  There are only finitely many choices of $j > i$, so one branching number at level $i$ accommodates all of them.
  Enlarging a higher branching number adds only exterior data and changes the deterministic stopped expressions;
  it changes neither the number of calls in Equation (7.4) nor the projected child dimensions in Equation (7.5).
  This is the uniform contradiction needed for the parameter selection in Section 8.

== 8 Choosing the parameters and completing the reduction <sec:assembly>

We now combine the local statements into a reduction. The parameters are constants depending on the requested
  soundness, but their order of choice matters: the upper agreement guarantee and its constants must be fixed
  before the lower row counts used to test rank. We choose row counts from the root downwards,
  fix the source repetition power, and then choose branching numbers from the leaves upwards.
  The bounds used during these choices are uniform in every dimension and table range not yet fixed;
  the decoders themselves are instantiated after all choices.
  This establishes soundness for the preliminary weighted game.
  Completing its at-most-two maps and rounding its weights will give the fixed alphabets and explicit unweighted
  output of Theorem 1.

=== 8.1 Row counts, rank cutoffs, and source repetition <row-counts-rank-cutoffs-and-source-repetition>

Fix $delta in bb(Q) ∩ \( 0 \, 1 \)$ and put $epsilon = delta \/ 3$. Choose a depth $d$ with $d epsilon gt.eq 4$.
  The pair-counting argument of Section 5 allows a common positive simultaneous-success threshold; for definiteness take

$ c = epsilon^2 \/ 2 \, wide kappa = c \/ 2 \, wide eta = c^2 \/ 32 . $

The losses below will be small enough for these choices. Apply Theorem 9 at the upper inverse threshold $eta \/
  2$, and denote its density, number of constraints and minimum row count by $alpha \, r \, ell_0$.
  Set $rho = kappa alpha \/ 4$.

Choose the row counts from the root downwards. When choosing $ell_j$,
  all agreement constants $gamma_k$ with $k > j$ have already been fixed.
  For every such $k$, apply the lower analysis of Section 6 with agreement threshold $gamma_k$:
  fix its inverse constants, then a cross-matrix size, then a rank cutoff.
  Choose $ell_j$ large enough for each of these finitely many lower row requirements, and also so that

#[#set math.equation(numbering: n => "(8.1)")
 $ ell_j gt.eq ell_0 \, wide 2^(- \( ell_j - r \)) < rho \/ 8 . $ <eq:upper-row-choice>]

At the top level there are no preceding lower-test requirements.

With $ell_j$ fixed, the following conservative constants from Section 5 are available:

#[#set math.equation(numbering: n => "(8.2)")
 $ h_j & = 2^(- r ell_j) \, & g_j & = eta^2 / 4 thin 2^(- r ell_j) \, & q_j & = g_j h_j \,\
b_j & = kappa alpha q_j \/ 4 \, & tau_j & = rho h_j \/ 4 \, & gamma_j & =
  b_j thin 2^(- ell_j - r) tau_j^2 \/ 2 . $ <eq:upper-masses>]

Choose

#[#set math.equation(numbering: n => "(8.3)")
 $ lambda_j lt.eq min { h_j \/ 2 \, tau_j^2 \/ 2 } \, wide \( 7 \/ 8 \)^(R_j) lt.eq lambda_j \, $ <eq:bias-choice>]

and require every $R_j$ to exceed the absolute minimum giving the quarter-balance premise in Lemma 23.
  The scalar induction uses only this lower balance minimum, not a lower level’s eventual accuracy $lambda_i$.
  Thus choosing $R_j$ creates no requirement to determine a lower source dimension or a lower row count first.

Carry this procedure down to level $1$. Take $s gt.eq 1$ to be the maximum of all the resulting rank cutoffs.
  Increasing a cutoff only strengthens the high-rank exclusion estimate,
  so the estimates for every pair $i < j$ remain valid. With $s$ fixed, choose the source repetition power $t$ so that

#[#set math.equation(numbering: n => "(8.4)")
 $ "val" \( G_(upright("src")) \) < frac(1, 2 s^2) $ <eq:source-value-choice>]

on unsatisfiable inputs. Theorem 5 and the fixed source gap permit this choice.
  The parameter $t$ fixes the source alphabets.

The absence of dimension and range factors in Theorem 9, Lemma 8, and the heavy-list bound is essential here.
  Although $t$ changes the dimensions of all actual function spaces,
  it changes none of the already selected lower bounds in (8.2).
  Thus the source alphabet can be chosen after all row counts and rank cutoffs, leaving only branching to be determined.

=== 8.2 Choosing the branching numbers <choosing-the-branching-numbers>

It remains to choose the branching numbers $n_1 \, dots.h \, n_d$.
  Take them to be integer cubes greater than one, so $beta_p = n_p^(- 2 \/ 3)$ is rational.
  All row counts, product counts, source alphabets, inverse densities,
  rank cutoffs and agreement thresholds have already been fixed.

There are finitely many cuts, pairs of levels and extra-call variants.
  Fix a positive accuracy smaller than one tenth of every tolerance needed for the following uses:

+ transferring the original pair success to the modified lower-cut law;
+ preserving positive upper defined equality before the inverse step;
+ the row-fiber transfer in Lemma 25, with error at most $alpha q_j \/ 16$;
+ the lower full-law comparison, with error at most $gamma_j^2 \/ 64$.

In (i) one may reserve error less than $epsilon^2 \/ 4$, and in (ii) less than $c^2 \/ 16$.
  The comparison from the modified $i$-law to the unrestricted $j$-law is a triangle of at most three raw
  comparisons. The factor ten accommodates this triangle as well as the direct uses.
  Reserve separately posterior discrepancy less than $gamma_j^2 \/ 64$ for every lower test,
  and require the clean-game upper bound to be below $gamma_j \/ 4$.

Choose $n_p$ in ascending order of $p$. At that moment, Lemmas 20–22 and Lemma 32 provide a finite likelihood
  bound $L_p$ and a positive clean zero-probability lower bound $p_(0 \, p)$.
  They depend on already chosen lower branching and fixed parameters, but not on $n_p$ or higher branching.
  As $n_p$ tends to infinity through cubes, all of

#[#set math.equation(numbering: n => "(8.5)")
 $ L_p / sqrt(n_p) \, wide sqrt(\( 1 + n_p^(- 4 \/ 3) L_p^2 \)^(n_p) - 1) \, wide
   frac(2 n_p^(- 2 \/ 3) L_p, 1 - n_p^(- 2 \/ 3)) \,\
\( 1 - n_p^(- 2 \/ 3) p_(0 \, p) \/ 64 \)^(n_p) $ <eq:vanishing-errors>]

tend to zero. Choose $n_p$ to satisfy every relevant fixed tolerance.
  For (8.5), use the uniform bound conditional on exterior choices if those choices alter the zero probability.

Later higher branching cannot invalidate an earlier choice.
  The stopped-call representation in Section 4 bounds the number of raw calls into the $p$-cut using only the
  already fixed upper row and product counts. Higher branching introduces independent exterior functions and
  changes the deterministic map assembling ancestors; it does not change that raw block law or its number of
  calls. Total variation decreases under the assembly map, and the posterior estimate is proved on the raw lifted
  blocks before assembly. The clean event zeros a predetermined collection of those same calls.
  This proves the uniformity needed for the ascending choice.

#thm([Proposition 8.1.])[
  #emph[With these fixed parameters, the preliminary legal-answer game has perfect completeness,
    fibers of size at most two, and value less than $epsilon$ on every unsatisfiable source instance.]
] <prop:preliminary-soundness>

#proof[
  The structural assertions follow from Lemma 15 and Proposition 16.
    Suppose that a labeling on an unsatisfiable input has value at least $epsilon$.
    Pair counting and the selected comparison errors give levels $i <
    j$ for which Proposition 27 supplies agreement at least $gamma_j$.
    The lower row requirements and error schedule give, by Proposition 30,
    agreement at least $gamma_j \/ 2$ with a normalized full form of rank at most $s$.
    By (8.4) and Lemma 31, the parity-list game has value less than $1 \/ 2$.
    Proposition 34 bounds the same agreement by a quantity less than $gamma_j \/ 4$, by our choice of $n_i$.
    This is impossible. ◻
]

=== 8.3 Completing every fiber to size two <completing-every-fiber-to-size-two>

For fixed parameters, let $L_max$ and $R_max$ bound the numbers of legal answers at left and right vertices.
  These bounds are independent of the input length. Choose a common integer $q$ with

#[#set math.equation(numbering: n => "(8.6)")
 $ q gt.eq max { 2 \, R_max \, ceil.l 1 \/ delta ceil.r } \, wide 2 q - L_max gt.eq
   6 \/ delta . $ <eq:padding-alphabet>]

At each vertex, embed its legal answers in the common alphabet by a fixed ordering.

Consider one preliminary edge with legal projection $pi : L arrow.r R$. For each $b in \[ q \]$ its residual capacity is

$ c_b = 2 - \| pi^(- 1) \( b \) \| in { 0 \, 1 \, 2 } \, $

where a right label outside $R$ has no legal preimage. The residual capacities sum to $N = 2 q - \| L \|$.
  Enumerate all maps from the $N$ illegal left labels into these capacities,
  giving each completion the same conditional weight. Together with $pi$,
  each such completion is a map $hat(pi) : \[ 2 q \] arrow.r \[ q \]$ with every fiber of size exactly two.
  There are finitely many completions, and their number is a constant.

For any fixed illegal left label $a$ and fixed right label $b$, symmetry among the $N$ illegal labels gives

#[#set math.equation(numbering: n => "(8.7)")
 $ Pr_(hat(pi)) \[ hat(pi) \( a \) = b \] = c_b \/ N lt.eq 2 \/ N lt.eq delta \/ 3 . $ <eq:illegal-probability>]

This bound is pointwise in the answers chosen by a labeling. Legal-left/illegal-right pairs never satisfy an edge.
  Given a labeling of the enlarged alphabets, retain all its legal answers and extend its other choices to
  arbitrary legal answers. Every edge satisfied with two legal answers remains satisfied by this legal extension.
  The weighted fraction of such edges is consequently at most the preliminary value.
  Equation (8.7) bounds all remaining accepting occurrences by $delta \/ 3$ in total.
  Thus the completed weighted game’s value on an unsatisfiable input is at most $epsilon + delta \/ 3$.

Every completion agrees with the original map on legal answers.
  A completeness labeling therefore satisfies every completed occurrence, not merely their average.

=== 8.4 Explicit enumeration and removal of weights <explicit-enumeration-and-removal-of-weights>

We verify the deterministic running-time and encoding assertions.
  The source power $t$, the number of tree leaves, every row count,
  and every local answer-domain size are constants. If the PCP instance has size $N_(upright("PCP"))$,
  all ordered outer question tuples can be enumerated in $N_(upright("PCP"))^C$ time for a fixed $C$.
  Repeated question IDs remain separate coordinates, exactly as in the definition of the source game.

For each tuple, the local spaces can be constructed from their finite truth tables.
  Pointwise multiplication, linear algebra, supports, joint partitions and their canonical keys can all be found
  by exhaustive enumeration on constant-size domains. The recursively specified sampling law is likewise a finite
  enumeration of constant-size random choices. Question IDs require only polynomially many bits.
  After equal keys are identified, every vertex and every projection table can therefore be listed explicitly in
  polynomial time.

The preliminary probabilities are rational. Uniform finite-space choices have constant denominators,
  and source-question probabilities have polynomial bit complexity.
  Completions introduce only another constant denominator. Hence we obtain a polynomial list of positive-weight
  edge entries $e_1 \, dots.h \, e_m$, with rational weights $w_a$ summing to one and with polynomial bit complexity.

In this fixed enumeration of positive-weight entries, set $K = ceil.l 3 m \/ delta ceil.r$ and $k_a =
  floor.l K w_a floor.r$. Add one to each of the first $K - sum_a k_a$ entries.
  The remainder is an integer in $\[ 0 \, m \)$, so this adds at most one copy to any entry and is a deterministic
  rule. Then $sum_a k_a = K$ and every copy lies in the original positive support.
  Some original occurrences may receive zero copies; no new support is added. Moreover,

$ "TV" #scale(x: 120%, y: 120%)[\(] \( w_a \)_(a = 1)^m \, \( k_a \/ K \)_(a = 1)^m #scale(x: 120%, y: 120%)[\)]
  lt.eq m \/ K lt.eq delta \/ 3 . $

Output $k_a$ copies of entry $e_a$, with its already explicit exact-two table. The output is nonempty.
  Since $K < 3 m \/ delta + 1 = O \( m \)$ for fixed $delta$,
  polynomial-bit rational arithmetic and writing the $K$ explicit copies both take polynomial time.
  For every labeling its acceptance probability changes by at most the total variation distance.
  Completeness remains one because only accepting support edges were retained. Soundness is at most

$ epsilon + delta \/ 3 + delta \/ 3 = delta . $

Any syntactically trivial instance certified during preprocessing may be handled by fixed games with the same
  common alphabets. A single exact-two edge is a satisfiable game.
  For a fixed unsatisfiable output, take one vertex on each side and enumerate all exact-two maps uniformly as
  parallel occurrences. For any fixed pair of answers, the accepting fraction is $1 \/ q lt.eq delta$,
  by symmetry of the right labels. This also ensures the nonempty-output convention in every degenerate
  preprocessing case.

All constants chosen above can be hardcoded into one deterministic machine for the fixed rational $delta$.
  Theorem 1 requires no efficient dependence on $delta$. Together with Proposition 36,
  the completion and rounding arguments prove Theorem 1.

#bibliography("refs.bib", style: "ieee", title: [References])
