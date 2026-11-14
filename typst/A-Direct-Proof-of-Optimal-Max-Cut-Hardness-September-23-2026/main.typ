#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 80.9pt, y: 80.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Direct Proof of Optimal Max-Cut Hardness]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

For a graph with nonnegative edge weights, Max-Cut asks for a partition of the vertices maximizing the weight of
  edges crossing the partition. A cut is encoded by signs on vertices,
  and an edge contributes exactly when its signs differ. For a maximization problem,
  an $alpha$-approximation returns a feasible solution worth at least $alpha$ times the optimum.
  Unless stated otherwise, the graph and its rational weights are given explicitly.
  We write $"MaxCut" \( G \)$ for the maximum crossing weight and, when the edge weights sum to one,
  also denote this value by $"Val" \( G \)$. The decision problem of whether a weighted graph has a cut of at
  least a given weight appears among Karp’s original NP-complete problems #cite(label("Karp72")).
  Approximation asks how much of this optimum can still be guaranteed in polynomial time.
  Goemans and Williamson #cite(label("GW95")) gave a semidefinite programming algorithm with random-hyperplane
  rounding for Max-Cut, with expected approximation ratio approaching

#[#set math.equation(numbering: n => "(1.1)")
 $ alpha_(upright("GW")) = min_(- 1 lt.eq rho < 1) frac(2 arccos rho, pi \( 1 - rho \)) =
   0.878567 dots.h . $ <eq:gw-constant>]

The expression compares two contributions of an edge whose endpoint vectors have inner product $rho$:
  its semidefinite objective value is $\( 1 - rho \) \/ 2$,
  whereas a random hyperplane separates the vectors with probability $arccos \( rho \) \/ pi$.
  The minimum ratio over $rho$ is the uniform guarantee of this rounding rule.
  Determining whether this ratio is optimal under ordinary NP-hardness has been a central question in
  approximation algorithms. Håstad’s hardness theorem #cite(label("Hastad01")),
  combined with the gadgets of Trevisan, Sorkin, Sudan, and Williamson #cite(label("TSSW00")),
  rules out ratios greater than $16 \/ 17$. Khot, Kindler, Mossel,
  and O’Donnell #cite(label("KKMO07")) established optimality of $alpha_(upright("GW"))$ assuming the Unique Games
  Conjecture #cite(label("Khot02")); the analytic input is the Majority Is Stablest theorem of Mossel, O’Donnell,
  and Oleszkiewicz #cite(label("MOO10")).

We resolve the unconditional optimality question for Max-Cut.

#thm([Theorem 1.1.])[
  #emph[For every fixed $alpha$ with $alpha_(upright("GW")) < alpha lt.eq 1$,
    it is NP-hard to approximate Max-Cut within a factor of $alpha$. This holds for simple unweighted graphs.]
] <thm:main>

The statement means that a polynomial-time algorithm which always returns a cut of weight at least $alpha$ times
  the maximum would imply $upright(P) = upright("NP")$. We prove the following more precise gap theorem. Write

#[#set math.equation(numbering: n => "(1.2)")
 $ B \( t \) = 2 / pi arcsin t \, wide 0 < t < 1 . $ <eq:B>]

#thm([Theorem 1.2.])[
  #emph[Fix a rational $t in \( 0 \, 1 \)$ and a constant $0 < epsilon < \( t - B \( t \) \) \/ 4$.
    For graphs equipped with a rational probability distribution on edges, it is NP-hard to distinguish
$ upright("YES:") quad & "Val" gt.eq frac(1 + t, 2) - epsilon \,\
upright("NO:") quad & "Val" lt.eq frac(1 + B \( t \), 2) + epsilon \, $

 where $"Val"$ is the maximum cut weight.]
] <thm:gap>

=== Prior work and the direct route <prior-work-and-the-direct-route>

The reduction of proof verification to approximation gaps has its roots in Feige, Goldwasser, Lovász, Safra,
  and Szegedy #cite(label("FGLSS96")) and in the PCP theorems of Arora–Safra and Arora, Lund, Motwani, Sudan,
  and Szegedy #cite(label("AroraSafra98")) #cite(label("ALMSS98")).
  Håstad’s Fourier analysis of proof-verification tests #cite(label("Hastad01")) made many of these gaps sharp.
  For Max-Cut, the Gaussian geometry of the semidefinite relaxation gives a particularly precise target.
  Feige and Schechtman #cite(label("FS02")) constructed integrality gaps approaching $alpha_(upright("GW"))$ for
  this relaxation; a limitation of that relaxation alone does not establish hardness for arbitrary algorithms.
  The Unique Games reduction of Khot, Kindler, Mossel, and O’Donnell #cite(label("KKMO07")) connected the same
  geometric threshold to computational hardness.

The original analysis of Khot, Kindler, Mossel, and O’Donnell proposed Majority Is Stablest as the analytic
  statement needed to obtain this threshold. Mossel, O’Donnell,
  and Oleszkiewicz proved it through a comparison between low-influence Boolean functions and Gaussian
  functions #cite(label("MOO10")), transferring Borell’s halfspace noise-stability bound #cite(label("Borell85"))
  to the Boolean setting. Their theorem leaves the Unique Games Conjecture as the hypothesis in the classical
  hardness reduction #cite(label("MOO10")) Corollary 2.12. We use Majority Is Stablest to identify an influential
  coordinate of our test, then prove the additional extraction needed to turn that coordinate into a source-game
  label. The algorithmic benchmark above is the ideal rounding ratio;
  finite-precision SDP optimization and random-hyperplane rounding give expected ratio $alpha_(upright("GW")) -
  eta$ for any fixed $eta > 0$ #cite(label("GW95")) Section 2.

The comparison between semidefinite approximation and hardness extends beyond a single worst-case ratio.
  O’Donnell and Wu #cite(label("OW08")) determined the full Max-Cut approximation curve under the Unique Games
  Conjecture, relating the attainable cut value to the instance’s optimum.
  Raghavendra #cite(label("Raghavendra08")) established a general correspondence between semidefinite relaxations
  and Unique-Games-based hardness for finite constraint satisfaction problems.
  Our theorem concerns the unconditional worst-case ratio for Max-Cut;
  the proof below establishes the specific family of completeness and soundness gaps in 2.

In a projection game, each vertex of a bipartite graph receives a label from a specified alphabet,
  and the edge weights form a probability distribution. An edge accepts when its prescribed map sends the left
  label to the right label. Its value is the maximum accepted edge weight.
  A two-to-one constraint has exactly two preimages for every right label.
  Completeness and soundness are, respectively, the promised lower bound on the YES-case value and upper bound on
  the NO-case value.

Our starting point is the published 2-to-1 game construction with imperfect completeness #cite(label("DKKMS25")).
  The Grassmann-graph approach was introduced by Khot, Minzer, and Safra #cite(label("KMS25")).
  Its soundness was completed through the connection between expansion and agreement established by Barak,
  Kothari, and Steurer #cite(label("BKS19")) and the expansion theorem of Khot, Minzer,
  and Safra #cite(label("KMS23")). We need a precise affine form of the construction:
  its projections are surjective affine maps between binary spaces of dimensions differing by one,
  and its alphabet can be fixed for a desired soundness before the completeness error is made arbitrarily small.
  4 states this input. Appendix 10 derives it from the published construction,
  specifying both the valid-subspace conditioning and the auxiliary candidate lists used in the soundness proof.
  Together with Majority Is Stablest, that construction supplies the external foundation of the argument.
  The Unique Games Conjecture enters only as historical context.
  The tree Fourier analysis, hashing bound, and hidden-coordinate decoding are proved here.

=== The proof and its main ingredients <the-proof-and-its-main-ingredients>

As in long-code reductions #cite(label("BGS98")) #cite(label("Hastad01")),
  a label $a$ is represented by the dictator $w mapsto w \( a \)$,
  where $w$ ranges over Boolean words indexed by labels. The graph has one such word domain for each tuple of left
  vertices of the source game. Thus an arbitrary cut specifies a Boolean function on each domain.
  To sample an edge, the test chooses two left tuples through a common right tuple,
  generates two words on the right label space, and pulls them back through the sampled affine projections.
  It negates the second word. When the sampled constraints are satisfied,
  dictator labels give a cut probability of one half of one plus the correlation between the two words evaluated
  at a common label.

The word generator is a finite rooted tree. Every internal node has $s$ pairs of children and a random table from
  $bb(F)_2^s$ to ${ - 1 \, 1 }$; the leaves carry affine forms on the label space.
  At a label $a$, these forms give leaf signs, and the tables recursively combine the child signs into the root
  sign $W \( a \)$. The gate rule is chosen so that each monomial of its Walsh expansion keeps one child from
  every pair. A second exploration keeps both children of one randomly selected pair at each reached node.
  At any fixed depth, the two explorations have exactly one node in common.
  The test couples the tables reached by this second exploration at a random depth,
  using entrywise correlation $t$, and leaves all other tables unchanged.
  Every monomial therefore acquires precisely one factor of $t$.
  A small independent resampling of the affine rows gives the smoothing needed for soundness and only a small
  completeness loss.

For an arbitrary cut, we first average its odd part over the source-game edges.
  The resulting function is balanced in the selected table entries,
  and a cut above the desired NO threshold makes its expected noise stability exceed $B \( t \)$.
  Majority Is Stablest then detects an influential entry. That entry is indexed by a gate input,
  not by a source-game label. The remaining task is to connect its influence to labels that the two endpoints of a
  source edge can choose consistently. Three steps address this task.

+ #emph[Local simplification of Fourier support.] The gate symmetries force the two child indices in each pair to
  have the same sum. After row smoothing, averaging the depth of the selected tables makes it inexpensive to
  retain indices which put this sum in one child of each pair and zero in the other.
  This simplification is imposed only at the influential gate.
  It is the structure that lets affine shifts act as translations of that gate’s table.
+ #emph[A vector-valued affine hashing lemma.] For independent affine shifts,
  a diffuse distribution of Fourier mass cannot create a large entry influence on average.
  The bound is uniform in the dimension of the row space. Its proof uses two truncations and a fourth-moment
  identity; it may be useful whenever translated coefficient arrays must be decoded without an alphabet-size loss.
+ #emph[Decoding with a hidden coordinate.] The mass concentration is obtained after fixing many row coordinates.
  A left endpoint cannot usually construct the pullback of this context without knowing its incident projection.
  We use a product of the game and plant zero linear coefficients in one uniformly chosen factor of the context
  and of the latent resampling rows. After that factor is forgotten, the planted law is close to the original law.
  At the planted factor, the context can be pulled back without knowing the projection.
  Only the $2 s$ free rows at the selected gate still have to be compared across it,
  at a cost of $2^(2 s)$ in Fourier mass.

The resulting decoding loss is independent of the source alphabet. This is essential:
  the alphabet dimension depends on the soundness we request,
  so a dimension-dependent loss could make the soundness choice circular.
  We first fix that loss and the source soundness, then the alphabet and the number of product factors,
  and finally the source completeness error. The quantifier order in 4 permits exactly this sequence.

2 fixes the Fourier conventions. Section 3, Section 4 define the code and the Max-Cut test.
  Section 5, Section 6, Section 7 prove the analytic ingredients.
  Section 8, Section 9 give the decoding and finish the proof.
  Appendix 10 derives the precise starting game from the published construction,
  and Appendix 11 gives a deterministic conversion to simple unweighted graphs.

== 2 Preliminaries <sec:preliminaries>

The proof uses two Fourier expansions. Characters of affine rows encode candidate labels,
  whereas characters of Boolean table entries detect the influences to which Majority Is Stablest applies.
  We introduce both conventions, then state the exact affine-game input.

All vector spaces over $bb(F)_2$ are finite dimensional. All expectations on a finite vector space or Boolean cube
  use the uniform probability measure, unless another distribution is specified.
  All Fourier coefficients use this probability normalization.
  An $L^2$ norm always integrates over the variables displayed in its subscript;
  variables declared fixed are not integrated.

=== 2.1 Affine rows and labels <affine-rows-and-labels>

Let $cal(A)$ be a nonempty affine space over $bb(F)_2$, with a fixed affine coordinate system, and set

$ H = "Aff" \( cal(A) \, bb(F)_2 \) . $

This is a vector space, containing the constant form $upright(bold(1))$.
  For $q in H^(*)$ define $chi_q \( h \) = \( - 1 \)^(q \( h \))$. Evaluation identifies $cal(A)$ with

#[#set math.equation(numbering: n => "(2.1)")
 $ { q in H^(*) : q \( upright(bold(1)) \) = 1 } . $ <eq:labels-dual>]

Indeed, if $h \( a \) = h_0 + sum_i h_i a_i$, a functional taking value one on $upright(bold(1))$ has the unique
  form $q \( h \) = h_0 + sum_i h_i a_i$. We call precisely these functionals #emph[labels];
  a general nonzero functional in $H^(*)$ need not be a label.

For $f : H^k arrow.r bb(R)$ and $C = \( q_1 \, dots.h \, q_k \) in \( H^(*) \)^k$, put

$ hat(f) \( C \) = bb(E)_R f \( R \) product_(i = 1)^k chi_(q_i) \( R_i \) \, wide \| C \| = \# { i : q_i eq.not 0 } . $

Parseval gives $sum_C hat(f) \( C \)^2 = bb(E)_R f \( R \)^2$.
  The same notation is used for functions with additional variables,
  which remain fixed during the indicated Fourier expansion.

For $0 lt.eq r lt.eq 1$, let $T_r$ be the row-noise operator:
  independently in each coordinate, retain the row with probability $r$ and otherwise replace it by an independent
  uniform row. Then

#[#set math.equation(numbering: n => "(2.2)")
 $ accent(T_r f, ̂) \( C \) = r^(\| C \|) hat(f) \( C \) . $ <eq:row-noise>]

This operator preserves the range $\[ - 1 \, 1 \]$. It is also convolution by an independent increment $E in H^k$,
  whose coordinates are zero with probability $r$ and independent uniform rows with probability $1 - r$.
  Convolution commutes with every fixed translation of the rows.

=== 2.2 Boolean Fourier analysis <boolean-fourier-analysis>

For a finite set $Omega$ and $h : { - 1 \, 1 }^Omega arrow.r bb(R)$, write

$ h \( x \) = sum_(S subset.eq Omega) hat(h) \( S \) product_(a in S) x_a . $

Its influence and degree-$K$ influence at $a in Omega$ are

$ "Inf"_a \( h \) = sum_(S in.rev a) hat(h) \( S \)^2 \, wide "Inf"_a^(lt.eq K) \( h \) = sum_(S in.rev a\
\| S \| lt.eq K) hat(h) \( S \)^2 . $

Let $P_(lt.eq K)$ be the orthogonal projection onto Fourier degree at most $K$. In particular,

#[#set math.equation(numbering: n => "(2.3)")
 $ sum_(a in Omega) "Inf"_a \( P_(lt.eq K) h \) lt.eq K ∥h∥_2^2 . $ <eq:degree-influence>]

For $t$-correlated uniform bits $x \, y$, independently coupled in each coordinate,

#[#set math.equation(numbering: n => "(2.4)")
 $ "Stab"_t \( h \) = bb(E) \[ h \( x \) h \( y \) \] = sum_(S subset.eq Omega) t^(\| S \|) hat(h) \( S \)^2 .
   $ <eq:stability>]

Thus stability is nonnegative for $t gt.eq 0$. If $h in \[ - 1 \, 1 \]$, it is at most one.

#thm([Lemma 2.1.])[
  (Majority Is Stablest with a degree cutoff).  #emph[Fix $0 < t < 1$ and $xi > 0$.
    There are an integer $K gt.eq 1$ and $tau > 0$, depending only on $t \, xi$, such that every $h : { - 1 \,
    1 }^Omega arrow.r \[ - 1 \, 1 \]$ with $bb(E) h = 0$ satisfies
$ #scale(x: 120%, y: 120%)[\(] "Inf"_a^(lt.eq K) \( h \) < tau upright(" for all ") a in Omega
  #scale(x: 120%, y: 120%)[\)] quad arrow.r.double quad "Stab"_t \( h \) lt.eq B \( t \) + xi . $

]
] <lem:mis>

#proof[
  The untruncated assertion follows from Majority Is Stablest #cite(label("MOO10")) Theorem 4.4.
    To match its $\[ 0 \, 1 \]$ convention, put $g = \( h + 1 \) \/ 2$:
    then $bb(E) g = 1 \/ 2$, each nonconstant Fourier coefficient is halved, and $"Stab"_t \( h \) =
    4 "Stab"_t \( g \) - 1$. The Gaussian halfspace value for $g$ is $1 \/ 4 + arcsin \( t \) \/ \( 2 pi \)$,
    which becomes $B \( t \)$ in our normalization; see #cite(label("MOO10")) Theorem 4.1 and Corollary 4.3 and
    #cite(label("Borell85")). Here is the degree-cutoff reduction to the untruncated assertion.
    For a cube-noise parameter $u < 1$, put $h_u = T_u h$, using ordinary bit noise in this paragraph.
    Range and mean are preserved. Uniformly over $h$ of norm at most one,
  $ 0 lt.eq "Stab"_t \( h \) - "Stab"_t \( h_u \) lt.eq sup_(j gt.eq 0) t^j \( 1 - u^(2 j) \) arrow.r
    0 quad \( u arrow.t 1 \) . $
  The convergence follows by first choosing a finite degree cutoff to bound the tail $t^j$,
    and then taking $u$ close to one on the remaining degrees. Choose $u$ so that this error is at most $xi \/ 2$.
    Let $delta > 0$ be the untruncated influence threshold for error $xi \/ 2$.
    Choose $K$ with $u^(2 \( K + 1 \)) lt.eq delta \/ 2$, and take $tau = delta \/ 2$. Then
  $ "Inf"_a \( h_u \) lt.eq "Inf"_a^(lt.eq K) \( h \) + u^(2 \( K + 1 \)) ∥h∥_2^2 < delta . $
  Apply the untruncated theorem to $h_u$ and add the stability error. ◻
]

=== 2.3 Affine projection games <affine-projection-games>

A weighted bipartite projection game consists of finite sets $X \, Y$,
  a rational probability distribution $lambda$ on a finite edge set $E$ with endpoint maps to $X$ and $Y$
  (parallel edges are allowed), finite alphabets, and a projection $pi_e$ for each edge. Its value is

$ "Val" \( cal(G) \) =
  max_(ell_X \, ell_Y) Pr_(e = \( x \, y \) tilde.op lambda) \[ pi_e \( ell_X \( x \) \) = ell_Y \( y \) \] . $

In this paper the alphabets are $bb(F)_2^(n + 1)$ and $bb(F)_2^n$, and every $pi_e : bb(F)_2^(n + 1) arrow.r
  bb(F)_2^n$ is surjective affine. 4 supplies NP-hard gaps with this structure.
  We discard endpoints with zero marginal probability whenever conditional edge distributions are used.

The starting theorem has the quantifier order

$ forall b in \( 0 \, 1 \) quad exists n = n \( b \) gt.eq 1 quad forall a in \( 0 \, 1 - b \) . $

The precise promise is given below; its derivation from the published construction is in 10.

#thm([Proposition 2.2.])[
  (Affine 2-to-1 Games Theorem).  #emph[For every constant $b in \( 0 \, 1 \)$ there is an integer $n gt.eq
    1$ such that, for every constant $a in \( 0 \, 1 - b \)$, the following promise problem is NP-hard.
    Its input is a weighted bipartite game with vertex sets $X \, Y$, respective label sets $bb(F)_2^(n + 1) \,
    bb(F)_2^n$, and a surjective affine map
$ pi_e : bb(F)_2^(n + 1) arrow.r bb(F)_2^n $

 on each edge $e = \( x \, y \)$. An edge is satisfied when $pi_e \( lambda_X \( x \) \) = lambda_Y \( y \)$.
   The promise cases are
$ upright("YES") : quad "Val" \( cal(G) \) gt.eq 1 - a \, wide upright("NO") : quad "Val" \( cal(G) \) lt.eq b . $

 The integer $n$ depends on $b$ alone. For fixed $a \, b$,
   the reduction is deterministic and has polynomial running time and output size.]
] <prop:affine-games>

A weighted graph is likewise specified by a rational distribution on unordered edges, allowing loops.
  A cut assigns signs to its vertices and satisfies an edge when its signs differ.
  Its value is its satisfaction probability. Loops have zero cut weight.
  The conversion in 19 keeps a common scale even when loops are deleted.

== 3 A tree code with complementary traversals <sec:tree>

We use the affine label space $cal(A)$ and row space $H = "Aff" \( cal(A) \, bb(F)_2 \)$ of 2.
  The code below turns affine rows and Boolean gate tables into a word indexed by labels.
  Its two complementary traversals control the correlation seen by a cut that evaluates the word at a single label.

#prodef([Definition 3.1.])[
  (Tree code).  Fix integers $s gt.eq 2$ and $m gt.eq 1$, and put
  $ k = \( 2 s \)^m \, wide d = s^m . $
  Let $cal(T)$ be the complete rooted $2 s$-ary tree of depth $m$.
    The children of each internal node $v$ are indexed by $\( g \, b \) in \[ s \] times { 0 \, 1 }$.
    Its leaves are indexed by $\[ k \]$. To each internal node assign a table $F_v : bb(F)_2^s arrow.r { - 1 \,
    1 }$, and to each leaf assign a row $R_i in H$. The word $W \( R \, F \) in { - 1 \,
    1 }^(cal(A))$ is defined pointwise as follows. At $a in cal(A)$, leaf $i$ has sign $\( - 1 \)^(R_i \( a \))$.
    An internal node with child signs $\( Z_(g \, b) \)$ outputs
  #[#set math.equation(numbering: n => "(3.1)")
   $ (product_(g = 1)^s Z_(g \, 0)) F_v \( z \) \, wide \( - 1 \)^(z_g) = Z_(g \, 0) Z_(g \, 1) . $ <eq:gate-rule>]
  The root output is $W \( R \, F \) \( a \)$.
] <def:tree-code>

We choose the tables to be noised by a second traversal of the tree.
  A #emph[random slice] is obtained by first choosing $J_0$ uniformly from ${ 0 \, dots.h \, m - 1 }$.
  Starting at the root, at each reached node of depth less than $J_0$ choose one of its $s$ child pairs uniformly
  and independently, and continue through both children of that pair.
  The set $cal(D)$ of reached nodes at depth $J_0$ is the slice.

Conditionally on $J_0 = j$, the slice has $2^j$ nodes, and every fixed node of depth $j$ belongs to it with
  probability $s^(- j)$. We write $F_(upright("out")) = \( F_u \)_(u in.not cal(D))$ for the tables outside the slice.

The two traversals of the tree used below complement one another.
  The slice construction chooses one pair and keeps both children.
  The Walsh expansion of a gate keeps one child from every pair.
  Their intersection therefore follows a single path. Figure 1 shows the local rule;
  iterating it gives one common node at every slice depth.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.2475, 1.453), (0.2475, 1.947), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$v$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((-3, 0), radius: 0.15, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-3, -0.12), [#text(size: 9pt)[$(1,0)$]], anchor: "north", padding: 0.1176cm)
  line((-0.3106, 1.524), (-2.863, 0.07743), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((-2, 0), radius: 0.15, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2, -0.12), [#text(size: 9pt)[$(1,1)$]], anchor: "north", padding: 0.1176cm)
  line((-0.2721, 1.469), (-1.88, 0.1017), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((-0.5, 0), radius: 0.15, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.5, -0.12), [#text(size: 9pt)[$(2,0)$]], anchor: "north", padding: 0.1176cm)
  line((-0.1007, 1.357), (-0.4557, 0.1507), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((0.5, 0), radius: 0.15, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.5, -0.12), [#text(size: 9pt)[$(2,1)$]], anchor: "north", padding: 0.1176cm)
  line((0.1007, 1.357), (0.4557, 0.1507), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((2, 0), radius: 0.15, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, -0.12), [#text(size: 9pt)[$(3,0)$]], anchor: "north", padding: 0.1176cm)
  line((0.2721, 1.469), (1.88, 0.1017), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  circle((3, 0), radius: 0.15, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3, -0.12), [#text(size: 9pt)[$(3,1)$]], anchor: "north", padding: 0.1176cm)
  line((0.3106, 1.524), (2.863, 0.07743), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((-0.3106, 1.524), (-2.863, 0.07743), stroke: (paint: rgb("#cc6600"), thickness: 1.4pt, miter-limit: 10))
  line((0.1007, 1.357), (0.4557, 0.1507), stroke: (paint: rgb("#cc6600"), thickness: 1.4pt, miter-limit: 10))
  line((0.2721, 1.469), (1.88, 0.1017), stroke: (paint: rgb("#cc6600"), thickness: 1.4pt, miter-limit: 10))
  line((-0.1007, 1.357), (-0.4557, 0.1507), stroke: (paint: rgb("#0000a6"), thickness: 1.4pt, miter-limit: 10, dash: "dashed"))
  line((0.1007, 1.357), (0.4557, 0.1507), stroke: (paint: rgb("#0000a6"), thickness: 1.4pt, miter-limit: 10, dash: "dashed"))
  circle((0.5, 0), radius: 0.2, stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-3, -1), (-2.4, -1), stroke: (paint: rgb("#cc6600"), thickness: 1.4pt, miter-limit: 10))
  content((-2.3, -1), [#text(size: 9pt)[one child per pair]], anchor: "west", padding: 0.1176cm)
  line((-3, -1.5), (-2.4, -1.5), stroke: (paint: rgb("#0000a6"), thickness: 1.4pt, miter-limit: 10, dash: "dashed"))
  content((-2.3, -1.5), [#text(size: 9pt)[both in one pair]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Complementary choices at one gate, illustrated for $s = 3$. A monomial traversal (solid) selects one child from each pair; the slice exploration (dashed) selects both children of one pair. Exactly one child is shared, shown in purple. Only this local selection is depicted; the same rule is repeated above the chosen slice. ],
) <fig:traversals>

#thm([Lemma 3.2.])[
  (Complementary traversal and correlation).  #emph[For every fixed collection of tables $F$,
    the root output as a multilinear polynomial in the $k$ leaf signs has only degree-$d$ monomials.
    Each such monomial chooses one child from every pair at every node that it reaches.
    Every resulting traversal meets every possible slice $cal(D)$ at exactly one node.
    Consequently, negating all the tables on a slice negates $W$.]
  #emph[Let $0 < t < 1$ and $0 < r < 1$. Draw $F$ uniformly,
    and construct $F'$ by leaving the tables outside $cal(D)$ unchanged and coupling each pair of corresponding
    table entries on $cal(D)$ as uniform signs of correlation $t$, independently across entries.
    Independently draw $R in H^k$ uniformly, and form $R^1 \,
    R^2$ by retaining each row of $R$ with probability $r$ and otherwise replacing it by an independent uniform
    row, independently in the two copies. Then, for every $a in cal(A)$ and every fixed slice,
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] W \( R^1 \, F \) \( a \) W \( R^2 \, F' \) \( a \) divides cal(D)
   #scale(x: 120%, y: 120%)[\]] = t r^(2 d) . $ <eq:tree-correlation>]

 In particular, if $r = 1 - mu \/ d$ with $0 < mu < 1 \/ 2$, then $r^(2 d) gt.eq 1 - 2 mu$.]
] <lem:tree-correlation>

#proof[
  For a fixed gate table, expand in its argument $z$: $F_v \( z \) =
    sum_(I subset.eq \[ s \]) hat(F)_v \( I \) \( - 1 \)^(sum_(g in I) z_g)$.
    Substituting into Equation (3.1), the term indexed by $I$ is
  $ hat(F)_v \( I \) product_(g in.not I) Z_(g \, 0) product_(g in I) Z_(g \, 1) . $
  Iterating this expansion gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ W_F \( x \) = sum_(P in cal(P)) a_P \( F \) product_(i in P) x_i \, wide \| P \| = d \, $ <eq:tree-polynomial>]
  where $cal(P)$ is the family of leaf sets produced by choosing one child per pair at each reached internal node.
    The leaf set determines all these choices: a selected child has a nonempty intersection with that leaf set,
    whereas an unselected child has none. Thus different traversals give different monomials,
    and $a_P \( F \)$ is the product of one Walsh coefficient of $F_v$ for each node reached by the traversal.
  At the root both a monomial traversal and the slice exploration are present.
    At any common node above the slice depth, exactly one child is selected by both explorations.
    Induction gives exactly one common node at the slice depth.
    Hence each $a_P$ contains exactly one factor from a table on $cal(D)$.
    Negating every such table negates each coefficient in Equation (3.3) and therefore negates the word.
    Moreover, each Walsh coefficient of a slice table satisfies
  $ bb(E) \[ hat(F)'_v \( I \) divides F_v \] = t hat(F)_v \( I \) . $
  Conditional independence between tables therefore gives $bb(E) \[ a_P \( F' \) divides F \, cal(D) \] =
    t a_P \( F \)$.
  For fixed $a$, the signs $x_i^b = \( - 1 \)^(R_i^b \( a \))$ are uniform, independent across $i$,
    and $bb(E) \[ x_i^1 x_i^2 \] = r^2$. Thus the product expectation of two monomials in Equation (3.3) is zero
    unless their leaf sets agree, and is $r^(2 d)$ when they agree.
    Since $W_F$ is Boolean, Parseval gives $sum_P a_P \( F \)^2 = 1$.
    Averaging first over rows and then over $F'$ proves Equation (3.2). The last claim is Bernoulli’s inequality:
    $\( 1 - mu \/ d \)^(2 d) gt.eq 1 - 2 mu$. ◻
]

The correlation identity describes a cut that evaluates the word at one label.
  To analyze arbitrary cuts, we also need functions that can depend on the entire word but do not see its
  generating rows or tables. We call $f$ a #emph[function of the code] if

#[#set math.equation(numbering: n => "(3.4)")
 $ f \( R \, F \) = phi.alt \( W \( R \, F \) \) $ <eq:function-of-code>]

for a fixed function $phi.alt$ on words. This class is closed under averaging over fixed choices of $phi.alt$,
  including choices that first pull a word back through a fixed affine map.
  For $r in \[ 0 \, 1 \]$, let $T_r$ denote independent row resampling with retention probability $r$,
  and write $macron(f) = T_r f$. The operator preserves bounds on the range of $f$.
  If $phi.alt$ is odd, Lemma 6 shows that both $f$ and $macron(f)$ are odd under simultaneous negation of the
  slice tables. In particular, they have mean zero in those table entries when all rows and outside tables are fixed.

At these fixed data, the remaining random input is the cube of $\| cal(D) \| 2^s$ independent entries,
  indexed by $\( v \, z \) in cal(D) times bb(F)_2^s$. Fourier degree and influence on this cube refer to subsets
  of #emph[entries]. This differs from the Walsh expansion of a fixed gate in its $s$-bit argument $z$ used in the
  correlation proof.

== 4 The Max-Cut reduction <sec:reduction>

Fix a rational $t in \( 0 \, 1 \)$, tree parameters $s \, m$, a rational $0 < mu < 1 \/ 2$, and $r = 1 - mu \/ d$.
  The parameters will be chosen in 9. Let $cal(G)$ be an affine game as in 4,
  with edge law $lambda$ and alphabet dimensions $n + 1 \, n$. Let $T gt.eq 1$ be an integer.
  We use the product label spaces

$ cal(B) = \( bb(F)_2^(n + 1) \)^T \, wide cal(A) = \( bb(F)_2^n \)^T \, $

and the row space $H = "Aff" \( cal(A) \, bb(F)_2 \)$.

=== 4.1 Vertices and edge distribution <vertices-and-edge-distribution>

For each $underline(x) in X^T$, make one graph vertex $\( underline(x) \, w \)$ for every word $w in { - 1 \,
  1 }^(cal(B))$. This is the standard long-code word domain #cite(label("BGS98")) #cite(label("Hastad01"));
  the tree construction specifies how the test samples its queries.
  Thus an arbitrary cut is exactly a family of functions

$ sigma_(underline(x)) : { - 1 \, 1 }^(cal(B)) arrow.r { - 1 \, 1 } . $

The functions receive only the resulting words; they do not receive the rows, gate tables, slice,
  or sampled game edges that produced them.

The graph’s edge distribution is the following test.

+ Draw $underline(y) in Y^T$ from the product right-endpoint marginal of $lambda$.
  Independently draw two edge tuples $underline(e) \, underline(e)'$ from the product conditional edge law given
  $underline(y)$. Write $underline(x) \, underline(x)'$ for their left endpoints and $pi_(underline(e)) \,
  pi_(underline(e)') : cal(B) arrow.r cal(A)$ for their coordinatewise projections.
+ Independently of all game data, draw a random slice $cal(D)$. Draw $F \, F'$ as in 6:
  corresponding entries are independent $t$-correlated uniform pairs on $cal(D)$,
  and identical uniform pairs off $cal(D)$.
+ Draw a uniform common row array $R in H^k$. In each of two copies,
  independently retain each row with probability $r$ and otherwise resample it uniformly, obtaining $R^1 \, R^2$.
+ Output the unordered edge whose endpoints are
  #[#set math.equation(numbering: n => "(4.1)")
   $ #scale(x: 120%, y: 120%)[\(] underline(x) \, W \( R^1 \, F \) compose
     pi_(underline(e)) #scale(x: 120%, y: 120%)[\)] \, wide #scale(x: 120%, y: 120%)[\(] underline(x)' \, -
     W \( R^2 \, F' \) compose pi_(underline(e)') #scale(x: 120%, y: 120%)[\)] . $ <eq:test-queries>]

All edge weights are the probabilities of these outcomes, aggregated over outcomes with the same unordered endpoints.

#thm([Lemma 4.1.])[
  (Completeness).  #emph[If $"Val" \( cal(G) \) gt.eq 1 - a$, the graph has a cut of value at least
#[#set math.equation(numbering: n => "(4.2)")
 $ \( 1 - 2 T a \) frac(1 + t r^(2 d), 2) gt.eq frac(1 + t, 2) - t mu - 2 T a . $ <eq:completeness>]

 The first lower bound is useful when $2 T a lt.eq 1$, which is the regime used below.]
] <lem:completeness>

#proof[
  Choose game labels $ell_X \, ell_Y$ satisfying an edge with probability at least $1 - a$.
    Label each word vertex by evaluation at the tuple of left labels:
  $ sigma_(underline(x)) \( w \) = w #scale(x: 120%, y: 120%)[\(] ell_X \( x_1 \) \, dots.h \,
    ell_X \( x_T \) #scale(x: 120%, y: 120%)[\)] . $
  Each coordinate of either sampled edge tuple has the original edge law.
    A union bound shows that all $2 T$ sampled constraints are satisfied except with probability at most $2 T a$.
    When all these constraints are satisfied, the two queried tuples project to the same label
    $l = \( ell_Y \( y_1 \) \, dots.h \, ell_Y \( y_T \) \) in cal(A)$.
    The cut signs then have product $- W \( R^1 \, F \) \( l \) W \( R^2 \, F' \) \( l \)$.
    The word-generation data are independent of the game edges,
    so 6 gives conditional cut probability $\( 1 + t r^(2 d) \) \/ 2$.
    On the remaining event the cut probability is nonnegative.
    This proves the first bound when $2 T a lt.eq 1$; if $2 T a > 1$ that bound is negative and is automatic.
    Finally, $r^(2 d) gt.eq 1 - 2 mu$, and the loss due to the prefactor is at most $2 T a$, giving the second bound. ◻
]

=== 4.2 A large cut produces excess stability <a-large-cut-produces-excess-stability>

An arbitrary cut need not change sign when its queried word is negated.
  We separate its two parities because the negative second query makes odd dependence increase the cut value and
  even dependence decrease it. For each cut table define its even and odd parts by

$ sigma^(upright("even")) \( w \) = frac(sigma \( w \) + sigma \( - w \), 2) \, wide sigma^o \( w \) =
  frac(sigma \( w \) - sigma \( - w \), 2) . $

For an edge tuple and a right-endpoint tuple, set

#[#set math.equation(numbering: n => "(4.3)")
 $ G_(underline(e)) \( R \, F \) & =
   sigma_(underline(x) \( underline(e) \))^o \( W \( R \, F \) compose pi_(underline(e)) \) \,\
G_(underline(y)) \( R \, F \) & = bb(E)_(underline(e) divides underline(y)) G_(underline(e)) \( R \, F \) \, wide
  macron(G)_(underline(y)) = T_r G_(underline(y)) . $ <eq:edge-function>]

Write $A_(underline(y))$ and $macron(A)_(underline(y)) = T_r
  A_(underline(y))$ for the analogous averages using $sigma^(upright("even"))$.
  These functions are bounded in absolute value by one. Moreover,

$ G_(underline(y)) \( R \, F \) = phi.alt_(underline(y)) \( W \( R \, F \) \) \, wide
  phi.alt_(underline(y)) \( w \) = bb(E)_(underline(e) divides underline(y))
  sigma_(underline(x) \( underline(e) \))^o \( w compose pi_(underline(e)) \) \, $

where $phi.alt_(underline(y))$ is odd and depends on no slice or row data.
  Thus $macron(G)_(underline(y))$ has mean zero in the slice entries for every fixed $underline(y) \, cal(D) \,
  R \, F_(upright("out"))$, by the observation following 6.
  The later extraction argument, 13, applies to precisely such bounded odd functions of the generated word.

#thm([Lemma 4.2.])[
  (Stability identity).  #emph[For every cut of the constructed graph,
#[#set math.equation(numbering: n => "(4.4)")
 $ "cut" \( sigma \) = 1 / 2 + 1 / 2 bb(E) "Stab"_t^(F_(cal(D))) \( macron(G)_(underline(y)) \) - 1 /
   2 bb(E) "Stab"_t^(F_(cal(D))) \( macron(A)_(underline(y)) \) \, $ <eq:cut-stability>]

 where both expectations are over $underline(y) \, cal(D) \, R \, F_(upright("out"))$. In particular,
#[#set math.equation(numbering: n => "(4.5)")
 $ "cut" \( sigma \) lt.eq 1 / 2 + 1 / 2 bb(E) "Stab"_t^(F_(cal(D))) \( macron(G)_(underline(y)) \) .
   $ <eq:cut-upper-stability>]

]
] <lem:cut-stability>

#proof[
  Condition on $underline(y) \, cal(D) \, R \, F_(upright("out"))$.
    The sampled edge tuples and the two row resamplings are independent between copies.
    After averaging over them, the expected first sign as a function of $F_(cal(D))$ is
    $macron(A)_(underline(y)) + macron(G)_(underline(y))$. The minus sign in the second queried word makes the
    expected second sign $macron(A)_(underline(y)) - macron(G)_(underline(y))$ at $F'_(cal(D))$.
    The two slice inputs are ordinary $t$-correlated uniform cube inputs.
    The rows in these functions are the common latent array $R$;
    the two independent row resamplings have already been absorbed into $T_r$.
    Negating every slice entry leaves $macron(A)_(underline(y))$ unchanged and negates $macron(G)_(underline(y))$.
    Their Fourier supports therefore have opposite total parities, so the cross terms vanish.
    The expected sign product is $"Stab"_t \( macron(A)_(underline(y)) \) -
    "Stab"_t \( macron(G)_(underline(y)) \)$. An edge is cut with probability one half of one minus its sign
    product, giving (4.4). Nonnegativity of stability for $t > 0$ gives (4.5). ◻
]

If a cut has value at least $\( 1 + B \( t \) \) \/ 2 + delta \/ 2$,
  then its odd average has expected slice stability at least $B \( t \) + delta$.
  The next three sections show that this excess stability yields a label carrying substantial Fourier mass,
  with constants independent of the game dimension and the number of repetitions; the formal statement is 13.
  8 then turns that mass into a labeling of a single copy of the original game.

== 5 Fourier structure of the tree code <sec:tree-fourier>

The cut depends on the generated word, so every transformation that preserves that word also constrains the cut’s
  row Fourier coefficients. At each gate these constraints give a common Fourier index shared by all child pairs.
  Negating the gate table distinguishes whether this index is an evaluation label.
  We then show that, at a random slice, little smoothed Fourier mass is lost by keeping the entire common index in
  just one child of each pair. Finally we express these retained indices in row coordinates that remain free after
  the other rows are fixed. This is the local form used in 7.
  Throughout the section, $f$ is a function of the code in the sense of (3.4).

=== 5.1 Row Fourier support <row-fourier-support>

For each node $v$, define its #emph[generator] $P \( v \)$, a set of leaves, recursively:
  $P \( v \) = { v }$ at a leaf, and $P \( v \) = P \( v_(1 \, 0) \) union
  P \( v_(1 \, 1) \)$ at an internal node. Thus a generator always follows both children of the first pair;
  unlike the slice, it involves no random choices. Adding the same $h in
  H$ to all rows in $P \( v \)$ multiplies the subtree output at $a$ by $\( - 1 \)^(h \( a \))$.
  This follows by induction from Equation (3.1): multiplying both children of one pair by the same sign leaves all
  gate inputs $z_g$ unchanged and multiplies the prefactor by that sign.

For a row Fourier index $C = \( q_i \)_(i = 1)^k in \( H^(*) \)^k$, put

$ chi_C \( R \) = product_i chi_(q_i) \( R_i \) \, wide \| C \| = \| { i : q_i eq.not 0 } \| \, wide q_v =
  sum_(i in P \( v \)) q_i . $

Write $q_(v \, g b)$ for the index of child $\( g \, b \)$ of $v$.
  Thus, by definition, $q_v = q_(v \, 10) + q_(v \, 11)$. At fixed tables, the row expansion and its smoothing are

#[#set math.equation(numbering: n => "(5.1)")
 $ f \( R \, F \) = sum_C hat(f)_C \( F \) chi_C \( R \) \, wide hat(macron(f))_C \( F \) =
   r^(\| C \|) hat(f)_C \( F \) . $ <eq:row-smoothing>]

#thm([Lemma 5.1.])[
  (Row symmetries).  #emph[Let $f$ be a function of the code.
    Every nonzero row Fourier coefficient of $f$ satisfies, at each internal node $v$,
#[#set math.equation(numbering: n => "(5.2)")
 $ q_(v \, g 0) + q_(v \, g 1) = q_v wide \( g in \[ s \] \) . $ <eq:row-relations>]

 For a table collection $F$, let $F^(v \, -)$ negate $F_v$ alone,
   and let $F^(v \, z)$ replace $F_v \( u \)$ by $F_v \( u + z \)$, leaving all other tables unchanged. Then
#[#set math.equation(numbering: n => "(5.3)")
 $ hat(f)_C \( F^(v \, -) \) & = \( - 1 \)^(q_v \( upright(bold(1)) \)) hat(f)_C \( F \) \,\
hat(f)_C \( F^(v \, z) \) & = \( - 1 \)^(sum_g z_g q_(v \, g 1) \( upright(bold(1)) \)) hat(f)_C \( F \) .
  $ <eq:table-flip-action>]

 All these statements remain true after row smoothing. They are also preserved by row Fourier projections and by
   projection to any range of total Fourier degrees in the entries of a specified collection of whole gate tables.]
] <lem:row-symmetry>

#proof[
  For each $g$, shifting the generators of both children in pair $g$ by $h$ has exactly the same effect on the
    subtree at $v$ as shifting $P \( v \)$ by $h$. Consequently the two row translations have the same effect on
    the whole word. Taking row Fourier coefficients yields
  $ chi_(q_(v \, g 0) + q_(v \, g 1)) \( h \) hat(f)_C \( F \) =
    chi_(q_v) \( h \) hat(f)_C \( F \) wide \( h in H \) . $
  Distinct characters are distinct functions, proving Equation (5.2).
  Negating $F_v$ has the same effect on the word as adding $upright(bold(1))$ to all rows in $P \( v \)$.
    This proves Equation (5.3). To translate the input of $F_v$ by $z$,
    add $upright(bold(1))$ to the generator of its second child in each pair with $z_g = 1$.
    This changes precisely those gate input bits and leaves its prefactor unchanged.
    Fourier transformation gives Equation (5.3).
  Row smoothing and row Fourier projections act diagonally on $C$, so preserve all three identities.
    On the cube of table-entry signs, a domain translation permutes coordinates,
    and negating a gate table multiplies each monomial by its parity sign.
    Both operations preserve total degree in any specified collection of whole gate tables and therefore commute
    with the stated degree projections. ◻
]

=== 5.2 An unsplit projection on a random slice <an-unsplit-projection-on-a-random-slice>

Equation (5.2) assigns one common sum $q_v$ to every child pair. Equation (5.3) then has a useful interpretation:
  coefficients odd under negating $F_v$ have $q_v \( upright(bold(1)) \) = 1$,
  so their common index is a label by (2.1). The individual child indices, however,
  can still be arbitrary functionals whose sum is $q_v$.

We simplify this last freedom at one gate at a time. Keeping $q_v$ in one child of each pair leaves only the
  choice of that child, rather than two arbitrary functionals with prescribed sum.
  Call $C$ #emph[unsplit at $v$] if, for every $g$, the ordered pair $\( q_(v \, g 0) \, q_(v \, g 1) \)$ is
  either $\( q_v \, 0 \)$ or $\( 0 \, q_v \)$. Let $S_v$ be the orthogonal row Fourier projection onto such
  indices. When $q_v = 0$, this requires every child index to be zero.
  The next bound averages the cost over the slice depth. It does not require an index to be unsplit at every gate
  of the tree.

#thm([Lemma 5.2.])[
  (Average cost of the unsplit projection).  #emph[Let $f$ be a function of the code with $\| f \| lt.eq 1$,
    let $r = 1 - mu \/ d$ with $0 < mu < 1 \/ 2$, and let $macron(f) = T_r f$.
    Choose the random slice independently of $f$. Then
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E)_(J_0 \, cal(D)) sum_(v in cal(D)) ∥\( I - S_v \) macron(f)∥_(2 \, R \, F)^2 lt.eq
   frac(s, 2 e m mu) . $ <eq:unsplit-bound>]

 The same bound holds after averaging over additional background data determining $f$,
   provided the slice is chosen independently of those data.]
] <lem:unsplit>

#proof[
  Fix an index $C$ satisfying Equation (5.2), and let $N_j$ be the number of nodes at depth $j$ with nonzero index
    $q_v$. If $q_v eq.not 0$, each child pair contains at least one nonzero index.
    A failure of the unsplit condition at such a node supplies at least one additional nonzero child.
    If $q_v = 0$, a failure supplies at least two nonzero children, whereas its minimum contribution is zero.
    Therefore the number $B_j$ of failures at depth $j$ satisfies
  $ B_j lt.eq N_(j + 1) - s N_j . $
  Using the slice inclusion probability and telescoping gives
  $ bb(E)_(J_0 \, cal(D)) sum_(v in cal(D)) upright(bold(1))_({ C upright(" is split at ") v }) & lt.eq 1 /
    m sum_(j = 0)^(m - 1) frac(N_(j + 1) - s N_j, s^j)\
 & = s / m (N_m / s^m - N_0) lt.eq frac(s \| C \|, m d) . $
  Here $N_m = \| C \|$. By Equation (5.1) and Parseval, the left side of Equation (5.4) is at most
  $ s / m sum_C (r^(2 \| C \|) frac(\| C \|, d)) bb(E)_F \| hat(f)_C \( F \) \|^2 . $
  For $x gt.eq 0$, $x e^(- 2 mu x) lt.eq \( 2 e mu \)^(- 1)$, and $log r lt.eq - mu \/ d$.
    Hence every parenthesized factor is at most $\( 2 e mu \)^(- 1)$,
    while $sum_C bb(E)_F \| hat(f)_C \( F \) \|^2 = ∥∥ f_2^2 lt.eq 1$. This proves the bound.
    The proof is pointwise in the background data, so its average satisfies the same inequality. ◻
]

=== 5.3 Free shifts and the remaining row coordinates <free-shifts-and-the-remaining-row-coordinates>

The extraction argument must use the common index after fixing most of the rows.
  We therefore choose coordinates in which translating a child generator changes one free row and leaves all other
  coordinates fixed. The unsplit projection will then act separately at each fixed context,
  and its retained characters will have an explicit form.

Fix a slice $cal(D)$ and a node $v in cal(D)$. The $2 s$ sets $P \( v_(g \, b) \)$ are nonempty and disjoint.
  Choose one representative leaf $i_(g \, b)$ from each of them, using a rule depending only on the tree,
  and set $L_(g \, b) = R_(i_(g \, b))$. For every other leaf $i$ in that generator, replace $R_i$ by $R_i +
  L_(g \, b)$. Keep all rows outside these generators as they are.
  Denote the resulting $k - 2 s$ remaining coordinates by $Gamma in H^(k - 2 s)$.

#thm([Lemma 5.3.])[
  (Free-shift coordinates).  #emph[The change of coordinates
$ H^k arrow.r H^(2 s) times H^(k - 2 s) \, wide R mapsto \( \( L_(g \, b) \) \, Gamma \) $

 is a linear bijection. In particular, under uniform rows the free shifts are independent uniforms conditional on
   $Gamma$. The Fourier index of $L_(g \, b)$ corresponding to a full row index $C$ is $Q_(g \, b) = q_(v \, g b)$.]
  #emph[Consequently, at every fixed $Gamma$, the operator $S_v$ acts as the Fourier projection in the $2
    s$ shifts onto precisely the unsplit shift indices. For a function of the code or its row smoothing,
    the shift coefficients vanish unless the sums $Q_(g \, 0) + Q_(g \, 1)$ are the same for every $g$.
    The table actions in Equations (5.3) and (5.3) hold for each shift coefficient at this fixed context,
    with $q_v = Q_(1 \, 0) + Q_(1 \, 1)$ and $q_(v \, g 1) = Q_(g \, 1)$.]
] <lem:shift-coordinates>

#proof[
  The inverse map sets the representative row equal to $L_(g \, b)$ and recovers every other row in its generator
    by adding $L_(g \, b)$ to its recorded difference. This proves bijectivity.
    In a row character, the coefficient of $L_(g \, b)$ is exactly $sum_(i in P \( v_(g \, b) \)) q_i =
    q_(v \, g b)$. Thus the condition defining $S_v$ depends only on the shift index $Q$,
    not on any Fourier index of $Gamma$. Grouping the full Fourier expansion by $Q$ proves its asserted action on
    each fixed fiber. The same grouping proves the support and table-action identities:
    all full row coefficients with a given $Q$ satisfy the same identities and carry the same signs. ◻
]

Thus, for a nonzero common index $q$, the retained shift indices are specified by the subset $I
  subset.eq \[ s \]$ of pairs in which $q$ occurs in the second child. Their characters are

$ product_(g in.not I) chi_q \( L_(g 0) \) product_(g in I) chi_q \( L_(g 1) \) . $

If $q = 0$, there is only the all-zero unsplit index, with character $1$.
  Negating $F_v$ multiplies the corresponding coefficient by $\( - 1 \)^(q \( upright(bold(1)) \))$.
  On the part odd in $F_v$, $q$ is therefore a label and hence nonzero,
  so the description by $q$ and $I$ is unique. For such a label,
  translating the argument of $F_v$ by $z in bb(F)_2^s$ multiplies its coefficient by
  $\( - 1 \)^(sum_(g in I) z_g)$. Thus the same subset $I$ records both the row character and the table
  translation character. This is the local Fourier description used in 7, valid at each fixed context.

== 6 A vector-valued hashing lemma <sec:hashing>

The following lemma turns dispersion among characters into dispersion among table entries.
  Its constants are independent of the dimension of the character space and of the dimension of the vectors being
  hashed. In the application, $q$ will index candidate labels and $z$ will index entries of a gate table.
  The resulting hashed vector will collect the Fourier coefficients contributing to one entry’s influence,
  so its squared norm will be that influence. This is why we need a vector-valued statement rather than a scalar
  estimate.

#thm([Lemma 6.1.])[
  (Vector-valued hashing).  #emph[Let $H$ be a finite-dimensional vector space over $bb(F)_2$,
    write $chi_q \( u \) = \( - 1 \)^(q \( u \))$ for $q in H^(*)$ and $u in H$,
    let $cal(V)$ be a real Hilbert space, let $s gt.eq 1$ be an integer, and let
$ c \( q \, z \) in cal(V) \, wide q in H^(*) \, quad z in bb(F)_2^s . $

 Set
$ w_q = sum_(z in bb(F)_2^s) ∥c \( q \, z \)∥^2 \, wide M = sum_(q in H^(*)) w_q . $

 Choose $L \, J_1 \, dots.h \, J_s$ independently and uniformly in $H$, and define
$ upright(bold(J)) \( q \) = \( q \( J_1 \) \, dots.h \, q \( J_s \) \) \, wide U \( z \) =
  sum_(q in H^(*)) chi_q \( L \) c \( q \, z + upright(bold(J)) \( q \) \) . $

 Then
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E) sum_(z in bb(F)_2^s) ∥U \( z \)∥^2 = M . $ <eq:hashing-total-mass>]

 For every $zeta > 0$, there are $gamma > 0$ and $s_0 in bb(N)$, depending only on $zeta$,
   such that for every $s gt.eq s_0$,
#[#set math.equation(numbering: n => "(6.2)")
 $ max_(q in H^(*)) w_q lt.eq gamma M quad arrow.r.double quad bb(E) max_(z in bb(F)_2^s) ∥U \( z \)∥^2 lt.eq
   zeta M . $ <eq:hashing-dispersion>]

]
] <lem:hashing>

#proof[
  All expectations over $H$ and $bb(F)_2^s$ below use uniform probability measure;
    the displayed sums defining $w_q$ and $M$ are unnormalized.
    Conditional on the $J_g$, orthogonality of the characters of $L$ gives
  $ bb(E)_L ∥U \( z \)∥^2 = sum_q ∥c \( q \, z + upright(bold(J)) \( q \) \)∥^2 . $
  Summing over $z$ proves (6.1). If $M = 0$, every vector $c \( q \, z \)$ is zero and (6.2) is immediate.
    Henceforth assume $M > 0$.
  Set $h = 2^s$ and $rho = max_q w_q \/ M$. We will prove the quantitative bound below for every $C \, D > 0$,
    and then choose its parameters. The main estimate bounds the maximum squared norm by the square root of the
    sum of fourth powers. After a Fourier change of variables,
    most terms in that fourth moment force the same character $q$ in all four factors;
    their total is controlled by the dispersion of the character masses.
    Two truncations will control the remaining terms and the cost of this change to the array:
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(E) max_z ∥U \( z \)∥^2 lt.eq
     2 M [sqrt(2 rho + frac(2 C^2, D^2) + frac(3 D^4, h)) + (1 / sqrt(C) + 1 / D)^2 + 1 / h] .
     $ <eq:hashing-quantitative>]
  ===== 6.1 Fourier representation. <fourier-representation.>
  For $p in bb(F)_2^s$ and $u in H$, define
  $ alpha_q \( p \) = sum_(z in bb(F)_2^s) \( - 1 \)^(p dot.op z) c \( q \, z \) \, wide A_p \( u \) =
    sum_(q in H^(*)) chi_q \( u \) alpha_q \( p \) \, wide S_p = L + sum_(g = 1)^s p_g J_g . $
  Fourier inversion in $z$ gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ U \( z \) = bb(E)_p \( - 1 \)^(p dot.op z) A_p \( S_p \) . $ <eq:hashing-inversion>]
  Writing $m_p = bb(E)_u ∥A_p \( u \)∥^2$, Parseval’s identity in the two groups gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ m_p = sum_q ∥alpha_q \( p \)∥^2 \, wide bb(E)_p m_p = M \, wide bb(E)_p ∥alpha_q \( p \)∥^2 =
     w_q . $ <eq:hashing-parseval>]
  For distinct $p \, p'$, the variables $S_p \, S_(p')$ are independent and uniform in $H$:
    the coefficient vectors $\( 1 \, p \) \, \( 1 \, p' \)$ are linearly independent over $bb(F)_2$.
    Similarly, any three distinct $p_1 \, p_2 \, p_3$ give three independent uniform variables $S_(p_1) \,
    S_(p_2) \, S_(p_3)$. Indeed, any nonempty subcollection of their coefficient vectors whose sum is zero must
    have even cardinality, and hence would consist of two equal vectors.
  ===== 6.2 Two truncations. <two-truncations.>
  We first discard indices $p$ with unusually large mean squared norm $m_p$,
    and then discard unusually large values of $A_p \( u \)$ on the remaining indices.
    The first cutoff makes the change to each individual character coefficient uniformly small under the second
    cutoff. The second gives the pointwise bound needed when the fourth-moment indices coincide.
    We will control the discarded part using a first-moment bound and a variance bound from the pairwise
    independence of the samples $S_p$. Define
  $ A'_p \( u \) =
    cases(delim: "{", A_p \( u \) \, & m_p lt.eq C M upright(" and ") ∥A_p \( u \)∥ lt.eq D sqrt(M) \,, 0 \, &
    upright("otherwise") \,) $
  and put
  $ alpha'_q \( p \) = bb(E)_u chi_q \( u \) A'_p \( u \) \, wide w'_q = bb(E)_p ∥alpha'_q \( p \)∥^2 \, wide
    U' \( z \) = bb(E)_p \( - 1 \)^(p dot.op z) A'_p \( S_p \) . $
  Pointwise truncation does not increase the total squared norm, so Parseval gives $sum_q w'_q lt.eq M$.
    If $m_p lt.eq C M$, then
  $ ∥alpha_q \( p \) - alpha'_q \( p \)∥ lt.eq bb(E)_u ∥A_p \( u \)∥
    upright(bold(1))_({ ∥A_p \( u \)∥ > D sqrt(M) }) lt.eq frac(m_p, D sqrt(M)) lt.eq frac(C sqrt(M), D) . $
  If $m_p > C M$, then $alpha'_q \( p \) = 0$. Consequently,
  #[#set math.equation(numbering: n => "(6.6)")
   $ sum_q w'_q lt.eq M \, wide w'_q lt.eq 2 w_q + frac(2 C^2 M, D^2) . $ <eq:hashing-truncated-mass>]
  Let
  $ X_p = ∥\( A_p - A'_p \) \( S_p \)∥ \, wide X = bb(E)_p X_p . $
  Equation (6.4) and the triangle inequality imply $max_z ∥U \( z \) - U' \( z \)∥ lt.eq X$.
    The contribution to $bb(E) X$ from the indices with $m_p > C M$ is at most
  $ bb(E)_p upright(bold(1))_({ m_p > C M }) sqrt(m_p) lt.eq frac(bb(E)_p m_p, sqrt(C M)) = sqrt(M \/ C) . $
  The contribution from the remaining indices is at most $bb(E)_p m_p \/ \( D sqrt(M) \) = sqrt(M) \/ D$.
    Moreover, the $X_p$ are pairwise independent, by the pairwise independence of the $S_p$.
    Since $A_p - A'_p$ is either $A_p$ or zero at each point,
  $ "Var" \( X \) = h^(- 2) sum_p "Var" \( X_p \) lt.eq h^(- 2) sum_p bb(E)_u ∥A_p \( u \) - A'_p \( u \)∥^2 lt.eq
    M / h . $
  We have proved
  #[#set math.equation(numbering: n => "(6.7)")
   $ bb(E) max_z ∥U \( z \) - U' \( z \)∥^2 lt.eq M [(1 / sqrt(C) + 1 / D)^2 + 1 / h] . $ <eq:hashing-truncation-error>]
  ===== 6.3 The fourth moment. <the-fourth-moment.>
  For brevity write $B_p = A'_p \( S_p \)$. Expanding the fourth power of the norm and summing the characters in
    $z$ gives the exact identity
  #[#set math.equation(numbering: n => "(6.8)")
   $ bb(E) sum_z ∥U' \( z \)∥^4 & = h^(- 3) sum_(p_1 \, p_2 \, p_3) bb(E) #scale(x: 120%, y: 120%)[\[] chevron.l
     B_(p_1) \, B_(p_2) chevron.r chevron.l B_(p_3) \, B_(p_1 + p_2 + p_3) chevron.r #scale(x: 120%, y: 120%)[\]]\
 & = bb(E)_(p_1 \, p_2 \, p_3) bb(E) #scale(x: 120%, y: 120%)[\[] chevron.l B_(p_1) \,
   B_(p_2) chevron.r chevron.l B_(p_3) \, B_(p_4) chevron.r #scale(x: 120%, y: 120%)[\]] \, wide p_4 = p_1 + p_2 +
   p_3 . $ <eq:hashing-fourth-expansion>]
  Here $p_1 \, p_2 \, p_3$ are independent uniform indices in the second line.
    The factor $h^(- 3)$ in the first line comes from four factors $h^(- 1)$ in Fourier inversion and the sum of
    $h$ characters over $z$.
  If any two of $p_1 \, p_2 \, p_3 \, p_4$ coincide, then some two of $p_1 \, p_2 \, p_3$ coincide.
    This event has probability at most $3 \/ h$. Since $∥B_p∥ lt.eq D sqrt(M)$,
    its contribution to (6.8) is at most $3 D^4 M^2 \/ h$ in absolute value.
  Now fix four distinct indices with $p_4 = p_1 + p_2 + p_3$.
    The first three $S_(p_i)$ are independent uniform elements of $H$, and $S_(p_4) = S_(p_1) + S_(p_2) +
    S_(p_3)$. Expanding the four $A'_(p_i)$ in characters and averaging over those three independent elements yields
  #[#set math.equation(numbering: n => "(6.9)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] chevron.l B_(p_1) \, B_(p_2) chevron.r chevron.l B_(p_3) \,
     B_(p_4) chevron.r #scale(x: 120%, y: 120%)[\]] = sum_q chevron.l alpha'_q \( p_1 \) \,
     alpha'_q \( p_2 \) chevron.r chevron.l alpha'_q \( p_3 \) \,
     alpha'_q \( p_4 \) chevron.r . $ <eq:hashing-common-character>]
  In detail, characters indexed by $q_1 \, q_2 \, q_3 \, q_4$ produce the factor
  $ product_(i = 1)^3 chi_(q_i + q_4) \( S_(p_i) \) \, $
  whose expectation is zero unless $q_1 = q_2 = q_3 = q_4$.
  The right side of (6.9) need not be nonnegative. For an upper bound,
    replace each summand by $product_(i = 1)^4 ∥alpha'_q \( p_i \)∥$, which is nonnegative,
    and then drop the restriction that the four indices be distinct. For every fixed $q$, Cauchy–Schwarz gives
  $ bb(E)_(p_1 \, p_2 \, p_3) product_(i = 1)^4 ∥alpha'_q \( p_i \)∥ & lt.eq
    (bb(E) ∥alpha'_q \( p_1 \)∥^2 ∥alpha'_q \( p_2 \)∥^2)^(1 \/ 2)
    (bb(E) ∥alpha'_q \( p_3 \)∥^2 ∥alpha'_q \( p_4 \)∥^2)^(1 \/ 2)\
 & = \( w'_q \)^2 . $
  The last equality uses the unconditioned independent uniform law of each pair $\( p_1 \, p_2 \)$ and
    $\( p_3 \, p_4 \)$; it does not assert independence after conditioning on distinctness.
    Thus the nondegenerate fourth moment is bounded by $sum_q \( w'_q \)^2$:
    dispersion among characters now controls concentration among table entries.
    Combining these estimates with (6.6) proves
  $ bb(E) sum_z ∥U' \( z \)∥^4 & lt.eq sum_q \( w'_q \)^2 + frac(3 D^4 M^2, h)\
 & lt.eq M^2 (2 rho + frac(2 C^2, D^2) + frac(3 D^4, h)) . $
  Therefore, using Cauchy–Schwarz once more,
  #[#set math.equation(numbering: n => "(6.10)")
   $ bb(E) max_z ∥U' \( z \)∥^2 lt.eq (bb(E) sum_z ∥U' \( z \)∥^4)^(1 \/ 2) lt.eq
     M sqrt(2 rho + frac(2 C^2, D^2) + frac(3 D^4, h)) . $ <eq:hashing-truncated-maximum>]
  The inequality $\( a + b \)^2 lt.eq 2 a^2 + 2 b^2$, together with (6.7) and (6.10), proves (6.3).
  Finally, set $epsilon = min { zeta \, 1 }$ and choose
  $ C = 64 / epsilon \, wide D = frac(8 C, epsilon) \, wide gamma = epsilon^2 / 128 \, wide 2^(s_0) gt.eq
    max {frac(192 D^4, epsilon^2) \, 16 / epsilon} . $
  If $s gt.eq s_0$ and $rho lt.eq gamma$, the square-root term in (6.3) is at most $epsilon \/ 4$.
    Also $D gt.eq sqrt(C)$, so the other two terms in its brackets are at most $epsilon \/ 16$ each.
    The resulting bound is $3 epsilon M \/ 4 lt.eq zeta M$, establishing (6.2) with constants depending only on
    $zeta$. ◻
]

== 7 From excess stability to a label <sec:extraction>

This section contains the analytic statement used in the reduction.
  Its constants do not depend on the dimension of the affine label space.
  The functions may depend on an additional random parameter $omega$, whose law is independent of all rows,
  gate tables, and the random slice. In the application, $omega$ will be a tuple of right endpoints of the game.

Let $phi.alt_omega : { - 1 \, 1 }^(cal(A)) arrow.r \[ - 1 \, 1 \]$ be odd, meaning $phi.alt_omega \( - w \) = -
  phi.alt_omega \( w \)$, and set

$ f_omega \( R \, F \) = phi.alt_omega \( W \( R \, F \) \) \, wide macron(f)_omega = T_r f_omega \, wide r = 1 -
  mu \/ d . $

The word, tree, and random slice $cal(D)$ are those of 3.
  Write $F_(upright("out"))$ for the tables outside $cal(D)$.
  Once $omega \, cal(D) \, R \, F_(upright("out"))$ are fixed,
  $macron(f)_omega$ is a function of the independent slice-table bits.

For a node $v in cal(D)$, use the free shift coordinates $\( L_(g b) \)_(g in \[ s \] \, b in { 0 \, 1 })$ and the
  remaining context $Gamma in H^(k - 2 s)$ from 11. A hat marked “shifts” expands only these $2 s$ free rows.
  For a label $q in cal(A)$ (equivalently, $q in H^(*)$ with $q \( upright(bold(1)) \) = 1$), define

#[#set math.equation(numbering: n => "(7.1)")
 $ m_q \( f \; Gamma \, F_(upright("out")) \) = bb(E)_(F_(cal(D))) sum_(Q in \( H^(*) \)^(2 s)\
Q_(g 0) + Q_(g 1) = q med \( g in \[ s \] \)) lr(|hat(f)^(thin upright("shifts")) \( Q \)|)^2 . $ <eq:mass>]

The dependence on $v \, cal(D)$, and $omega$ is suppressed.
  The sets of indices in this definition are disjoint as $q$ varies.
  For a fixed $q$, the mass includes every way to distribute that common sum between the two children of each
  pair. We seek such mass for the original smoothed function $macron(f)_omega$.
  The unsplit projection and a table-degree cutoff will serve only to find a label carrying this mass;
  neither projection is part of the conclusion. Keeping all the indices with a given common sum will let us
  compare masses under affine pullback in 8.

In particular, if $\| f \| lt.eq 1$, then at every fixed context

#[#set math.equation(numbering: n => "(7.2)")
 $ 0 lt.eq sum_(q in cal(A)) m_q \( f \; Gamma \, F_(upright("out")) \) lt.eq 1 . $ <eq:mass-bound>]

#thm([Proposition 7.1.])[
  (Dimension-independent extraction).  #emph[Fix $t in \( 0 \, 1 \)$, $0 < delta < 1 - B \( t \)$,
    and $0 < mu < 1 \/ 2$. There are tree parameters $s gt.eq 2 \, m gt.eq 1$ and constants $p_(*) \, theta > 0$,
    depending only on $t \, delta \, mu$, with the following property.
    For any affine label space $cal(A)$ and any family $phi.alt_omega$ as above, if
#[#set math.equation(numbering: n => "(7.3)")
 $ bb(E)_(omega \, cal(D) \, R \, F_(upright("out"))) "Stab"_t^(F_(cal(D))) \( macron(f)_omega \) gt.eq
   B \( t \) + delta \, $ <eq:excess-stability>]

 then
#[#set math.equation(numbering: n => "(7.4)")
 $ Pr [max_(q in cal(A)) m_q \( macron(f)_omega \; Gamma \, F_(upright("out")) \) gt.eq theta] gt.eq
   p_(*) . $ <eq:extraction-event>]

 Here we sample $omega$, the random slice $cal(D)$, and a uniform node $v in cal(D)$; conditional on these,
   we sample $F_(upright("out"))$ and $Gamma$ independently and uniformly.]
] <prop:extraction>

#proof[
  Excess stability first produces an influential slice entry.
    We retain that influence after the unsplit projection, discard the part even in its gate table,
    and express the remaining influence as an affine hash of vectors indexed by labels.
    The hashing lemma then forces one label to carry substantial conditional mass.
  All constants chosen below are independent of $cal(A)$ and of the law of $omega$.
    The degree cutoff $K$ and influence threshold $tau$ are chosen first.
    We leave $s \, m$ unspecified during the estimates: Step 4 will choose $s$ to control the even and hashed
    contributions, and then $m$ to control the cost of the unsplit projection.
  ===== 7.1 Step 1: find an influential slice entry. <step-1-find-an-influential-slice-entry.>
  Simultaneously negating the slice tables negates the word.
    Since $phi.alt_omega$ is odd and smoothing preserves this identity,
    $macron(f)_omega$ has mean zero in the slice bits for every fixed $omega \, cal(D) \, R \,
    F_(upright("out"))$. It also lies in $\[ - 1 \, 1 \]$. Apply 3 with $xi = delta \/ 2$, obtaining $K gt.eq
    1$ and $tau > 0$. We may decrease $tau$ to ensure $tau lt.eq 1$.
    Since stability is at most one, (7.3) implies that, with probability at least
  $ eta = delta \/ 2 \, $
  some entry $z in bb(F)_2^s$ of some $v in cal(D)$ has $"Inf"_(v \, z)^(lt.eq K) \( macron(f)_omega \) gt.eq
    tau$. Indeed, if the probability of this event is $p$, the expected stability is at most $B \( t \) +
    delta \/ 2 + p$.
  Let $S_v$ be the orthogonal row projection onto indices unsplit at $v$. Put
  $ H_v = P_(lt.eq K)^(F_(cal(D))) S_v macron(f)_omega . $
  By 10, the required bound on the projection loss is
  #[#set math.equation(numbering: n => "(7.5)")
   $ bb(E) sum_(v in cal(D)) ∥\( 1 - S_v \) macron(f)_omega∥_(2 \, R \, F)^2 lt.eq frac(s, 2 e m mu) lt.eq
     frac(eta tau, 8) . $ <eq:choose-m>]
  For any fixed $s$, the last inequality can be ensured by increasing $m$.
    The same expectation is the expectation over $omega \, cal(D) \, R \,
    F_(upright("out"))$ of the sum of the corresponding conditional squared norms in $F_(cal(D))$.
    Markov’s inequality shows that this sum is at most $tau \/ 4$ except on an event of probability $eta \/ 2$.
    On the intersection with the influential-entry event, the triangle inequality for the projection defining that
    influence gives
  $ sqrt("Inf"_(v \, z) \( H_v \)) gt.eq sqrt("Inf"_(v \, z)^(lt.eq K) \( macron(f)_omega \)) - ∥\( 1 - S_v \)
    macron(f)_omega∥_(2 \, F_(cal(D))) gt.eq sqrt(tau) / 2 . $
  Consequently,
  #[#set math.equation(numbering: n => "(7.6)")
   $ bb(E) sum_(v in cal(D)) max_z "Inf"_(v \, z) \( H_v \) gt.eq frac(eta tau, 8) = : Lambda . $ <eq:large-max-sum>]
  We will also use
  #[#set math.equation(numbering: n => "(7.7)")
   $ bb(E) sum_(v in cal(D)) sum_z "Inf"_(v \, z) \( H_v \) lt.eq K . $ <eq:total-influence>]
  To verify it, integrate over all rows. Each $S_v$ is an orthogonal projection in the rows and commutes with the
    slice-bit Fourier projections. It can therefore only decrease the integrated influence at its entries.
    After dropping each $S_v$ separately, the left side is bounded by the total influence of
    $P_(lt.eq K)^(F_(cal(D))) macron(f)_omega$, averaged over the remaining variables.
    Equation (2.3) and $\| macron(f)_omega \| lt.eq 1$ give (7.7).
    No pointwise boundedness of $H_v$ is asserted or needed.
  ===== 7.2 Step 2: discard even dependence on a gate. <step-2-discard-even-dependence-on-a-gate.>
  Fix $v in cal(D)$, and split $H_v$ into its even and odd parts under negation of $F_v$ alone.
    These parts have disjoint Fourier supports in the slice bits,
    also after retaining the monomials containing any specified entry. Thus
  $ "Inf"_(v \, z) \( H_v \) = "Inf"_(v \, z) \( H_v^(upright("even")) \) +
    "Inf"_(v \, z) \( H_v^(upright("odd")) \) . $
  By the sign action in 9, the even part has $q_v \( upright(bold(1)) \) = 0$ on row support.
    Since the index is unsplit, all its child indices are either $0$ or $q_v$,
    so they too take value zero on $upright(bold(1))$. The domain-translation action in that lemma shows that the
    even part is invariant under translations of the domain of $F_v$, with the rows and outside tables fixed.
    These translations act transitively on its entries. All entry influences at $v$ are therefore equal. By (7.7),
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(E) sum_(v in cal(D)) max_z "Inf"_(v \, z) \( H_v^(upright("even")) \) lt.eq K / 2^s . $ <eq:even-influence>]
  ===== 7.3 Step 3: express odd influences as affine hashes. <step-3-express-odd-influences-as-affine-hashes.>
  Fix $omega \, cal(D) \, v \, Gamma \, F_(upright("out"))$.
    The remaining row coordinates $L_(g b)$ are independent uniform elements of $H$.
    On the odd part, the common pair sum $q$ is a label, by (2.1), and hence is nonzero.
    An unsplit shift index with common sum $q$ puts $q$ in the second child on a subset $I
    subset.eq \[ s \]$ and in the first child elsewhere. Let $a_(q \, I) \( F_(cal(D)) \)$ be its coefficient in
    $H_v^(upright("odd"))$.
  Set
  $ L_Sigma = sum_(g = 1)^s L_(g 0) \, wide J_g = L_(g 0) + L_(g 1) \, wide
    upright(bold(J)) \( q \) = \( q \( J_1 \) \, dots.h \, q \( J_s \) \) . $
  The $s + 1$ forms $L_Sigma \, J_1 \, dots.h \, J_s$ are independent and uniform:
    the displayed linear map from $H^(2 s)$ onto $H^(s + 1)$ is surjective.
    The remaining $s - 1$ coordinates do not occur in the unsplit expansion.
    The character of the shift index $\( q \, I \)$ is
  $ chi_q \( L_Sigma \) \( - 1 \)^(sum_(g in I) q \( J_g \)) . $
  On the other hand, the domain-translation identity gives
  $ a_(q \, I) \( F_v \( dot.op + z \) \, F_(cal(D) \\ { v }) \) = \( - 1 \)^(sum_(g in I) z_g)
    a_(q \, I) \( F_(cal(D)) \) . $
  With $Psi_q = sum_(I subset.eq \[ s \]) a_(q \, I)$ we obtain
  #[#set math.equation(numbering: n => "(7.9)")
   $ H_v^(upright("odd")) = sum_(q in cal(A)) chi_q \( L_Sigma \) Psi_q #scale(x: 120%, y: 120%)[\(]
     F_v \( dot.op + upright(bold(J)) \( q \) \) \, F_(cal(D) \\ { v }) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:odd-hash-form>]
  The functions $a_(q \, I)$ for distinct $I$ are orthogonal in the uniform slice bits:
    a domain translation whose two characters differ preserves their inner product and changes its sign. Consequently,
  #[#set math.equation(numbering: n => "(7.10)")
   $ ∥Psi_q∥_(2 \, F_(cal(D)))^2 = sum_I ∥a_(q \, I)∥_(2 \, F_(cal(D)))^2 lt.eq
     m_q \( macron(f)_omega \; Gamma \, F_(upright("out")) \) . $ <eq:psi-mass>]
  The inequality follows because the unsplit row projection is determined by the free shift index,
    and the degree and parity projections are orthogonal projections in the slice bits at each fixed context.
    Every $Psi_q$ has degree at most $K$.
  Equation (7.9) has converted the free-shift characters into translations of a gate table.
    We next collect its Boolean Fourier coefficients into vectors whose squared norms are entry influences.
    These Fourier coefficients are indexed by sets of table entries;
    the earlier index $I subset.eq \[ s \]$ instead specified a character of the table’s domain $bb(F)_2^s$.
  Denote by $hat(Psi)_q \( B \, D \)$ the slice Fourier coefficient with entry set $B subset.eq
    bb(F)_2^s$ at gate $v$ and entry set $D$ on the other slice gates.
    For $z in bb(F)_2^s$ define a real vector $c \( q \, z \)$,
    with coordinates indexed by pairs $\( A \, D \)$ where $0 in A subset.eq bb(F)_2^s$, by
  $ c \( q \, z \)_(A \, D) = hat(Psi)_q \( z + A \, D \) . $
  Using entry sets relative to $z$ makes this vector space the same for every $z$ and every label $q$.
    Set $c \( q \, z \) = 0$ for functionals $q$ which are not labels.
    For the influence at $z$, a slice Fourier set $B$ containing $z$ has the unique form $B = z +
    A$ with $0 in A$. Translation by $upright(bold(J)) \( q \)$ sends its coefficient to
    $hat(Psi)_q \( z + A + upright(bold(J)) \( q \) \, D \)$. Hence, exactly,
  #[#set math.equation(numbering: n => "(7.11)")
   $ "Inf"_(v \, z) \( H_v^(upright("odd")) \) = ∥∥ * sum_q chi_q \( L_Sigma \)
     c \( q \, z + upright(bold(J)) \( q \) \)^2 . $ <eq:influence-hash>]
  Writing $w_q = sum_z ∥c \( q \, z \)∥^2$ and $M_v = sum_q w_q$, we have
  #[#set math.equation(numbering: n => "(7.12)")
   $ w_q = sum_(B \, D) \| B \| lr(|hat(Psi)_q \( B \, D \)|)^2 lt.eq K ∥Psi_q∥_2^2 lt.eq
     K m_q \( macron(f)_omega \; Gamma \, F_(upright("out")) \) . $ <eq:wq-mq>]
  The factor $\| B \|$ counts the entries whose influences contain that Fourier monomial;
    it is at most the monomial’s total degree, which is at most $K$. Thus $M_v lt.eq K$ at every context.
    The total-mass identity in 12, together with (7.11), also gives
  #[#set math.equation(numbering: n => "(7.13)")
   $ bb(E) sum_(v in cal(D)) M_v = bb(E) sum_(v in cal(D)) sum_z "Inf"_(v \, z) \( H_v^(upright("odd")) \) lt.eq
     K . $ <eq:sum-M>]
  For this identity the free coordinates are integrated separately for each node;
    their different coordinate systems do not affect the uniform row law.
  ===== 7.4 Step 4: force a heavy label. <step-4-force-a-heavy-label.>
  Choose $zeta > 0$ with $zeta K lt.eq Lambda \/ 4$. Apply 12, obtaining $gamma > 0$ and a lower bound on $s$.
    Choose $s gt.eq 2$ large enough for that lemma and for $K 2^(- s) lt.eq Lambda \/ 4$.
    Then choose $m$ as in (7.5). Finally put
  #[#set math.equation(numbering: n => "(7.14)")
   $ M_0 = frac(Lambda, 4 dot.op 2^m) \, wide theta = frac(gamma M_0, K) \, wide p_(*) =
     frac(Lambda, 4 K thin 2^m) . $ <eq:extraction-constants>]
  For each node, condition on $omega \, cal(D) \, v \, Gamma \, F_(upright("out"))$ and integrate the free shifts.
    Partition these contexts into three classes:
  + $w_q lt.eq gamma M_v$ for every $q$;
  + the first condition fails and $M_v < M_0$;
  + $M_v gt.eq M_0$ and $w_q > gamma M_v$ for some $q$.
  On class (i), the hashing lemma bounds the expected maximum odd influence by $zeta M_v$.
    Summing and using (7.13) costs at most $Lambda \/ 4$. On class (ii),
    the maximum is bounded in expectation by the total influence, namely $M_v < M_0$.
    Since $\| cal(D) \| lt.eq 2^m$, these contexts cost at most $Lambda \/ 4$.
    On class (iii), the same total-mass bound is at most $K$ per node.
    Equation (7.8) bounds all even contributions by $Lambda \/ 4$.
    Let $N_(upright("iii"))$ count the nodes whose induced contexts lie in class (iii).
    Comparing all four contributions with (7.6) gives
  $ Lambda lt.eq K 2^(- s) + zeta K + 2^m M_0 + K bb(E) N_(upright("iii")) lt.eq frac(3 Lambda, 4) +
    K bb(E) N_(upright("iii")) . $
  Thus $bb(E) N_(upright("iii")) gt.eq Lambda \/ \( 4 K \)$.
    At each such node (7.12) supplies a label with $m_q > gamma M_0 \/ K = theta$.
    Choosing a uniform node from the slice loses at most a factor $2^m$ and gives (7.4). This proves the proposition. ◻
]

== 8 Decoding with a hidden coordinate <sec:decoding>

We now convert the Fourier mass supplied by Proposition 13 into a labeling of the original affine game.
  The difficulty is that the mass is measured after fixing a row context.
  A labeler at an $X$-vertex does not know the projection on its incident edge,
  and therefore cannot usually lift that context to its own label space.
  We resolve this by repeating the game coordinates and planting one coordinate on which the context and the
  latent resampling rows have zero linear coefficients. Hiding the planted coordinate makes the resulting
  distribution close to the original one. The comparison across the unknown projection then involves only the $2
  s$ free shifts, so its loss is independent of $n$ and $T$.

Throughout this section, the cut tables are fixed. We use the tree parameters and the row coordinates of the
  preceding sections. For each choice of a slice $cal(D)$ and a node $v in cal(D)$, fix the coordinate change

$ R arrow.l.r \( L \, Gamma \) \, wide L = \( L_(g b) \)_(g in \[ s \] \, thin b in { 0 \, 1 }) in H^(2 s) \, quad
  Gamma in H^(k - 2 s) \, $

by choosing its representative leaves in a deterministic order.
  This change uses only additions of row coordinates and depends only on the tree and $v$.
  In particular, it commutes with pullback of affine forms.
  The masses $m_q$ always refer to these coordinates and to the uniform average over the slice tables in Equation (7.1).

=== 8.1 Removing the row smoothing <removing-the-row-smoothing>

Let $R_1^(upright("new")) \, dots.h \, R_k^(upright("new"))$ be independent uniform elements of $H$,
  and independently let $B_1 \, dots.h \, B_k$ be Bernoulli variables with $Pr \( B_i = 1 \) = 1 - r$. Set

$ E_i = B_i R_i^(upright("new")) \, wide E = \( E_1 \, dots.h \, E_k \) . $

For any fixed row array $R$, the array $R + E$ has the distribution of the one-copy row resampling used by the
  test. Write $\( E_L \, E_Gamma \)$ for the coordinates of $E$ under the above linear change of variables.

#thm([Lemma 8.1.])[
  (Removing smoothing).  #emph[For every fixed $underline(y)$, $cal(D)$, $v$, $Gamma$, $F_(upright("out"))$,
    and label $q in cal(A)$,
#[#set math.equation(numbering: n => "(8.1)")
 $ m_q \( macron(G)_(underline(y)) \; Gamma \, F_(upright("out")) \) lt.eq
   bb(E)_(E \, thin underline(e) divides underline(y))
   m_q \( G_(underline(e)) \; Gamma + E_Gamma \, F_(upright("out")) \) . $ <eq:unsmooth>]

 Here the noise $E$ is independent of the conditionally sampled edge tuple $underline(e)$.]
] <lem:unsmooth>

#proof[
  For the fixed context, regard a function of $\( L \, F_(cal(D)) \)$ as an element of the real Hilbert space with
    the uniform probability measure. Let $Pi_q$ be the orthogonal projection onto the shift Fourier indices $Q$
    satisfying $Q_(g 0) + Q_(g 1) = q$ for every $g$. Then the corresponding mass is the squared norm of this
    projection. The identity
  $ macron(G)_(underline(y)) \( L \, Gamma \, F \) = bb(E)_(E \, thin underline(e) divides underline(y))
    G_(underline(e)) \( L + E_L \, Gamma + E_Gamma \, F \) $
  and convexity of the squared Hilbert-space norm give the desired inequality.
    Indeed, translation by $E_L$ commutes with $Pi_q$ and preserves its norm:
    on each shift Fourier coefficient it only multiplies by a sign. ◻
]

Choose once and for all an ordering of each label space, and define

#[#set math.equation(numbering: n => "(8.2)")
 $ q^(*) = q^(*) \( underline(y) \, cal(D) \, v \, Gamma \, F_(upright("out")) \) in "arg max"_(q in cal(A))
   m_q \( macron(G)_(underline(y)) \; Gamma \, F_(upright("out")) \) $ <eq:decoder-choice>]

using that ordering to break ties. This definition uses the original conditional edge average and the original
  row-smoothing operator. It will remain unchanged when we modify the distribution of the row data below.

Sample $underline(y)$, the slice, its uniform node, the context, and the outside tables as in Proposition 13,
  and then sample $R^(upright("new"))$, $B$, and $underline(e) divides underline(y)$.
  Combining that Proposition with Lemma 14 gives

#[#set math.equation(numbering: n => "(8.3)")
 $ bb(E) thin m_(q^(*)) \( G_(underline(e)) \; Gamma + E_Gamma \, F_(upright("out")) \) gt.eq
   p_(*) theta . $ <eq:unplanted-score>]

The mass in this expectation lies in $\[ 0 \, 1 \]$, since $G_(underline(e))$ is bounded in absolute value by one.

=== 8.2 Planting a coordinate <planting-a-coordinate>

Write each affine row in coordinates on $cal(A) = \( bb(F)_2^n \)^T$.
  Apart from its single constant coefficient, it has one block of $n$ linear coefficients for each of the $T$
  slots. For a slot $a in \[ T \]$, let $Z_a$ be the event that the slot-$a$ blocks vanish in all $k -
  2 s$ context rows and all $k$ latent rows $R_i^(upright("new"))$.
  No condition is imposed on any constant coefficient. Under the original, unplanted law,

#[#set math.equation(numbering: n => "(8.4)")
 $ p_0 := Pr \( Z_a \) = 2^(- n \( 2 k - 2 s \)) . $ <eq:zero-slot-probability>]

Conditional on the depth, slice, and node, the events $Z_a$ are independent:
  they concern disjoint blocks of independent uniform coefficients.

The #emph[planted experiment] chooses a uniform mark $a_(*) in \[ T \]$ and sets these blocks to zero at $a_(*)$.
  All other row coefficients, the noise masks, the outside tables,
  and the game edges retain their original distributions. Equivalently, conditional on $a_(*) = a$,
  this is the unplanted law conditioned on $Z_a$.

#thm([Lemma 8.2.])[
  (Hiding the planted coordinate).  #emph[Let $sans(U)$ be the unplanted law and $sans(P)$ the planted law after
    forgetting the mark. Both laws are taken on the full data
$ #scale(x: 120%, y: 120%)[\(] underline(e) \, J_0 \, cal(D) \, v \, F_(upright("out")) \, Gamma \,
  R^(upright("new")) \, B #scale(x: 120%, y: 120%)[\)] . $

 Then
#[#set math.equation(numbering: n => "(8.5)")
 $ "TV" \( sans(P) \, sans(U) \) lt.eq 1 / 2 sqrt(frac(1 - p_0, T p_0)) lt.eq
   frac(1, 2 sqrt(T p_0)) . $ <eq:planting-tv>]

 Consequently, if
#[#set math.equation(numbering: n => "(8.6)")
 $ T gt.eq frac(1, p_0 \( p_(*) theta \)^2) \, $ <eq:decoder-repetition>]

 then under the planted law,
#[#set math.equation(numbering: n => "(8.7)")
 $ bb(E)_(sans(P)) thin m_(q^(*)) \( G_(underline(e)) \; Gamma + E_Gamma \, F_(upright("out")) \) gt.eq
   frac(p_(*) theta, 2) . $ <eq:planted-score>]

]
] <lem:planting>

#proof[
  Let $Z = sum_(a = 1)^T upright(bold(1))_(Z_a)$. Averaging the conditional densities over the uniform mark gives
  $ frac(d sans(P), d sans(U)) = frac(Z, T p_0) . $
  Conditional on the tree data, $Z$ has the binomial distribution with parameters $T \, p_0$;
    these parameters do not depend on the tree data. Thus Cauchy–Schwarz gives
  $ "TV" \( sans(P) \, sans(U) \) = 1 / 2 bb(E)_(sans(U)) lr(|frac(Z, T p_0) - 1|) lt.eq 1 /
    2 sqrt(frac(1 - p_0, T p_0)) . $
  The score in Equation (8.3) is a $\[ 0 \, 1 \]$-valued function of the displayed data without the mark.
    In particular, $q^(*)$ is the fixed function defined in Equation (8.2); it does not use the mark,
    the sampled incident edges beyond their $Y$-endpoints, or the sampled noise.
    Its statistical dependence on zero slots causes no difficulty.
    Expectations of this score under the two laws differ by at most their total variation distance.
    Equations (8.3) and (8.6) therefore imply Equation (8.7). ◻
]

=== 8.3 Fourier mass under an affine restriction <fourier-mass-under-an-affine-restriction>

The next elementary observation accounts for the loss in decoding.
  Let $rho : tilde(cal(A)) arrow.r cal(A)$ be a surjective affine map with two-element fibers, and write

$ tilde(H) = "Aff" \( tilde(cal(A)) \, bb(F)_2 \) \, wide iota = rho^(*) : H arrow.r.hook tilde(H) . $

Pullback is linear on the vector spaces of affine forms, even when $rho$ has a nonzero translation part.
  The image of $iota$ has codimension one, and $iota \( upright(bold(1)) \) = upright(bold(1))$.
  Its dual restriction map $iota^(*) : tilde(H)^(*) arrow.r H^(*)$ has two-element fibers and,
  on evaluation functionals, agrees with $rho$.

#thm([Lemma 8.3.])[
  (Restriction of shift mass).  #emph[Fix a context and the outside tables.
    Let $tilde(f) \( tilde(L) \, F_(cal(D)) \)$ be a function on $tilde(H)^(2 s)$ and the slice tables.
    Suppose its shift Fourier support has the common-pair-sum property
$ tilde(Q)_(g 0) + tilde(Q)_(g 1) = tilde(Q)_(h 0) + tilde(Q)_(h 1) quad upright("for all ") g \, h in \[ s \] . $

 Set $f \( L \, F_(cal(D)) \) = tilde(f) \( iota L \, F_(cal(D)) \)$, where $iota$ acts on each shift.
   For every label $q in cal(A)$,
#[#set math.equation(numbering: n => "(8.8)")
 $ m_q \( f \) lt.eq 2^(2 s) sum_(tilde(q) in tilde(cal(A))\
rho \( tilde(q) \) = q) tilde(m)_(tilde(q)) \( tilde(f) \) . $ <eq:restriction-mass>]

 The masses on both sides use the common-pair-sum definition of Equation (7.1), with the respective affine row spaces.]
] <lem:restriction>

#proof[
  For every fixed choice of slice tables, Fourier inversion and character orthogonality give
  $ hat(f) \( Q \) = sum_(tilde(Q)\
iota^(*) tilde(Q)_(g b) = Q_(g b) med forall g \, b) hat(tilde(f)) \( tilde(Q) \) . $
  The sum has $2^(2 s)$ indices. Hence its squared absolute value is at most $2^(2 s)$ times the sum of the
    squared absolute values of its terms. Now sum over all $Q$ with pair sums $q$.
    Every nonzero coefficient on the right has a common pair sum $tilde(q)$ whose restriction is $q$. Moreover,
  $ tilde(q) \( upright(bold(1)) \) = tilde(q) \( iota \( upright(bold(1)) \) \) = q \( upright(bold(1)) \) = 1 \, $
  so $tilde(q)$ is an evaluation functional, hence a label in $tilde(cal(A))$, and $rho \( tilde(q) \) = q$.
    Each lifted index is counted only once. Averaging over the slice tables proves Equation (8.8). ◻
]

=== 8.4 The endpoint labelers <the-endpoint-labelers>

Equation (8.7) is an average over full edge tuples. To turn it into a labeling of the original game,
  we place the input edge at the planted coordinate and make all other edges public.
  The zero coefficients ensure that the needed context lift does not require the projection on the input edge.

#thm([Proposition 8.4.])[
  (Decoding).  #emph[Suppose the extraction conclusion of Proposition 13 holds with constants $p_(*) \,
    theta > 0$. If $T$ satisfies Equation (8.6), then the original affine game has value at least
#[#set math.equation(numbering: n => "(8.9)")
 $ "Val" \( cal(G) \) gt.eq 2^(- 2 s) frac(p_(*) theta, 2) . $ <eq:decoded-value>]

]
] <prop:decoding>

#proof[
  We construct randomized labelers that use only their own endpoint and shared randomness.
    The entire game and the fixed cut tables are available as background data.
    No efficiency claim about the labelers is needed to lower-bound game value.
  ===== 8.4.1 Shared data and the $Y$-labeler. <shared-data-and-the-y-labeler.>
  Given a random input edge $e = \( x \, y \)$ from the original edge law,
    choose a uniform public mark $a_(*) in \[ T \]$. At every other slot, publicly sample an independent edge,
    including its endpoints and projection. Insert the input edge at the marked slot.
    Its projection is used only in the analysis; it is not revealed to either labeler.
    Conditional on any mark, the resulting full edge tuple has the product edge law;
    hence the tuple is independent of the mark. Each labeler knows its own endpoint tuple,
    and both know all edges outside the marked slot.
  Publicly sample the depth, slice, node, outside tables, context, latent rows,
    and masks according to the planted experiment above. The row sampling uses the fixed alphabet dimensions,
    the public tree coordinates, and the mark, and is independent of the input edge.
    Together with the edge tuple, these data have exactly the planted law used in Equation (8.7).
    The $Y$-labeler forms its endpoint tuple $underline(y)$, computes the label $q^(*)$ from Equation (8.2),
    and outputs its marked component $q_(a_(*))^(*)$. All quantities used in that computation are available to
    this labeler: in particular the conditional average defining $macron(G)_(underline(y))$ can be computed from
    the game and cut as fixed background data. It does not use the actual marked edge or its projection.
  ===== 8.4.2 The $X$-labeler. <the-x-labeler.>
  To define the $X$-labeler, replace the marked factor of $cal(A)$ by the $X$-alphabet:
  $ tilde(cal(A)) = product_(a eq.not a_(*)) bb(F)_2^n med times med bb(F)_2^(n + 1) \, $
  with factors in their original slot order. Let $cal(B) = \( bb(F)_2^(n + 1) \)^T$. The full projection factors as
  $ cal(B) arrow.r^(med kappa med) tilde(cal(A)) arrow.r^(med rho med) cal(A) . $
  Here $kappa$ is the public edge projection at every unmarked slot and the identity at the marked slot;
    $rho$ is the identity at every unmarked slot and the unknown map $pi_e$ at the marked slot.
    Thus $kappa$ is known to the $X$-labeler, while $rho$ is used only in the analysis.
  The planted zeros imply that every row in $Gamma$ and $R^(upright("new"))$ has zero linear coefficient block in
    the marked slot. The same holds for $E$, $E_Gamma$, and $Gamma' = Gamma + E_Gamma$,
    since the noise masks and context change only multiply by scalars and add rows.
    Consequently $tilde(Gamma)' = rho^(*) Gamma'$ is known to the $X$-labeler:
    it is obtained by leaving every unmarked coefficient and constant coefficient unchanged and setting all marked
    coefficients to zero. This description does not require $pi_e$, including its affine translation part.
  The $X$-labeler forms the bounded raw function
  $ tilde(G) \( tilde(R) \, F \) = sigma_(underline(x))^o #scale(x: 120%, y: 120%)[\(]
    W_(tilde(cal(A))) \( tilde(R) \, F \) compose kappa #scale(x: 120%, y: 120%)[\)] \, wide tilde(R) in tilde(H)^k . $
  Fix its context to $tilde(Gamma)'$ and its outside tables to the public $F_(upright("out"))$,
    leaving all $2 s$ shifts free in $tilde(H)$. Let $tilde(m)_(tilde(q))$ be its masses.
    They are nonnegative and their sum over labels is at most one, by Parseval and $lr(|tilde(G)|) lt.eq 1$.
    The labeler samples a label $tilde(q)$ with probability at least $tilde(m)_(tilde(q))$ for each label,
    assigning any leftover probability to a fixed label. It uses an additional independent public uniform random
    number to sample from this distribution and outputs the marked component of $tilde(q)$.
    This sampling does not use $q^(*)$.
  ===== 8.4.3 Comparison on the sampled edge. <comparison-on-the-sampled-edge.>
  We verify the restriction hypothesis needed to compare these probabilities with the score.
    For any $h in tilde(H)$, shifting both child generators in one pair by $h$ multiplies the output of gate $v$
    by $\( - 1 \)^(h \( tilde(l) \))$ at every label $tilde(l)$.
    Applying this shift in two distinct pairs leaves that output, and hence the whole word, unchanged.
    These operations only translate the free shifts and preserve the context.
    Character orthogonality therefore shows that every shift Fourier index of $tilde(G)$ has a common pair sum.
    This argument holds for each fixed choice of all gate tables.
  Word generation commutes with pullback of rows, pointwise in the label.
    Since $pi_(underline(e)) = rho compose kappa$, restricting each free shift of $tilde(G)$ to $rho^(*)
    H$ yields exactly $G_(underline(e))$ with context $Gamma'$ and the same tables.
    The map $rho$ has two-element fibers, so Lemma 16 applies and gives
  $ sum_(rho \( tilde(q) \) = q^(*)) tilde(m)_(tilde(q)) gt.eq
    2^(- 2 s) m_(q^(*)) \( G_(underline(e)) \; Gamma' \, F_(upright("out")) \) . $
  Conditional on all the planted data, the left side lower-bounds the probability that the sampled full label
    projects to $q^(*)$. That event in particular implies satisfaction of the marked input edge.
    Averaging and using Equation (8.7) gives success probability at least $2^(- 2 s) p_(*) theta \/ 2$.
  Finally, fix all shared randomness, including the uniform number used to sample the $X$-label.
    The same fixed data define the two strategies at every endpoint,
    so they give a deterministic labeling of the original game.
    Their average value over the shared randomness has the lower bound just proved,
    so some fixed choice attains it. This proves Equation (8.9). ◻
]

The decoding loss depends on $s \, p_(*) \, theta$, and hence on the target cut gap,
  but not on the alphabet dimension or the repetition length.
  After choosing a game soundness smaller than the right side of Equation (8.9),
  one may therefore fix the alphabet dimension and then choose $T$ by Equation (8.6).

== 9 Completing the hardness proof <sec:completion>

The parameter order is

$ \( t \, epsilon \, mu \) arrow.r \( s \, m \, p_(*) \, theta \) arrow.r b arrow.r n arrow.r T arrow.r a . $

The extraction constants fix the required game soundness $b$ before the alphabet dimension $n$ is known.
  Repetition is then chosen to hide the planted coordinate, and the game’s completeness error $a$ is chosen last.

#proof[
  Fix $t$ and $epsilon$ as in the theorem. Take $delta = epsilon$.
    This satisfies $0 < delta < 1 - B \( t \)$ because $epsilon < \( t - B \( t \) \) \/
    4 < \( 1 - B \( t \) \) \/ 4$. Choose a rational $0 < mu < 1 \/ 2$ with $t mu lt.eq epsilon \/ 4$.
    Apply 13 with $t \, delta \, mu$, fixing $s \, m \, p_(*) \, theta$, and hence $k \, d \, r$. Choose a rational
  $ 0 < b < 2^(- 2 s) frac(p_(*) theta, 2) . $
  By 4, this fixes an alphabet dimension $n$ for which the game has arbitrarily small completeness error.
    Choose an integer $T$ satisfying
  $ T gt.eq frac(2^(n \( 2 k - 2 s \)), \( p_(*) theta \)^2) . $
  Finally choose a positive rational $a < 1 - b$ small enough that $2 T a lt.eq epsilon \/ 4$,
    and start with the NP-hard game gap $"Val" \( cal(G) \) gt.eq 1 - a$ versus $"Val" \( cal(G) \) lt.eq b$.
  In the YES case, 7 gives cut value at least $\( 1 + t \) \/ 2 - epsilon \/ 2$, which is stronger than required.
    In the NO case, suppose a cut had value at least $\( 1 + B \( t \) \) \/ 2 + epsilon \/ 2$.
    By 8, its odd average has expected slice stability at least $B \( t \) + epsilon$.
    Proposition 7.1, Proposition 8.4 would then imply $"Val" \( cal(G) \) gt.eq 2^(- 2 s) p_(*) theta \/ 2 > b$,
    a contradiction. Thus every cut has value less than $\( 1 + B \( t \) \) \/ 2 + epsilon \/ 2$.
  For completeness, the test is a deterministic polynomial-size graph construction. The vertex set has
  $ \| X \|^T thin 2^(\| cal(B) \|) = \| X \|^T thin 2^(2^(\( n + 1 \) T)) $
  vertices. All factors except $\| X \|$ are constants for fixed $t \, epsilon$.
    There are polynomially many endpoint and edge tuples, and all word-generation sample spaces have constant
    size. Enumerate every test outcome and add its probability to the corresponding edge weight.
    The initial game weights, $t$, and $r$ are rational, so these weights have polynomial bit complexity.
    Conditional edge probabilities also have polynomial bit complexity.
    All alphabets and words can be enumerated in constant time relative to the input size.
    The resulting graph is therefore computable in deterministic polynomial time.
    It has a rational edge distribution and satisfies the asserted, weaker $epsilon$-loss bounds. ◻
]

#proof[
  Substituting $rho = - t$ into (1.1) gives
  #[#set math.equation(numbering: n => "(9.1)")
   $ alpha_(upright("GW")) = min_(- 1 < t lt.eq 1) frac(1 + B \( t \), 1 + t) \, $ <eq:gw-ratio>]
  where the same formula defines $B \( t \) = 2 arcsin \( t \) \/ pi$ for negative $t$.
    For $- 1 < t lt.eq 0$ the ratio is at least one, whereas for $0 < t < 1$ it is less than one.
    At $t = 1$ it equals one, and as $t arrow.b - 1$ it diverges. Thus its minimum occurs in $\( 0 \, 1 \)$.
  Fix $alpha_(upright("GW")) < alpha lt.eq 1$. By continuity and the density of the rationals,
    choose a rational $t in \( 0 \, 1 \)$ such that
  $ alpha frac(1 + t, 2) > frac(1 + B \( t \), 2) . $
  Choose positive rational $epsilon$ and $epsilon.alt'$ small enough that $epsilon < \( t - B \( t \) \) \/ 4$ and
  #[#set math.equation(numbering: n => "(9.2)")
   $ alpha (frac(1 + t, 2) - epsilon - epsilon.alt') > frac(1 + B \( t \), 2) + epsilon +
     epsilon.alt' . $ <eq:strict-final-gap>]
  Apply 2. Delete loops while retaining the original weight scale,
    so that the remaining weights sum to at most one. Apply 19 with error $epsilon.alt'$,
    producing a simple unweighted graph whose maximum cut, on the common scale $Q$,
    differs from the original maximum cut weight by at most $epsilon.alt'$.
    An $alpha$-approximation algorithm on that graph returns, in the YES case,
    a cut of scaled value at least the left side of (9.2). In the NO case,
    no cut has scaled value greater than its right side. A fixed rational threshold strictly between them
    therefore distinguishes the NP-hard promise cases. This proves the theorem. ◻
]

== 10 The affine game supplied by the 2-to-1 Games Theorem <sec:affine-games>

The Max-Cut reduction needs two features beyond the usual numerical 2-to-1 game gap:
  the projections must be affine over $bb(F)_2$, and the alphabet must be fixed before the completeness error is
  chosen. We derive these features from the construction and soundness analysis in #cite(label("DKKMS25"))
  Sections 4–5. Its Grassmann agreement hypothesis is supplied by the expansion theorem of Khot, Minzer,
  and Safra #cite(label("KMS23")) and the expansion-to-agreement implications of Barak, Kothari,
  and Steurer #cite(label("BKS19")) Theorems 9–11; the introduction of the published version
  of #cite(label("DKKMS25")) records this completion.

We first describe the folded game and its affine projections.
  The source’s vertex definition excludes certain subspaces that its displayed sampler can produce.
  We specify the resulting conditioning, complete the tables used in its soundness proof,
  and give the invariant-list argument with the needed exceptional-subspace estimates.
  For the second player we use bounded lists on quotient spaces,
  keeping each restriction to the advice space separate. Completeness then follows by choosing the initial 3Lin
  error last.

=== 10.1 The folded game and its edge law <the-folded-game-and-its-edge-law>

===== 10.1.1 Starting instance. <starting-instance.>

Theorem 4.1 of #cite(label("DKKMS25")), obtained from Håstad’s theorem #cite(label("Hastad01")),
  supplies an absolute constant $s_(*) < 1$ such that for every sufficiently small $epsilon >
  0$ it is NP-hard to distinguish regular binary 3Lin instances of value at least $1 -
  epsilon$ from those of value at most $s_(*)$. Regularity includes bounded variable occurrence,
  three distinct variables per equation, and at most one variable shared by two distinct equations.

For now let $ell gt.eq 2$, $k_0 gt.eq ell$, and $beta in \( 0 \, 1 \)$ be fixed parameters, with $beta$ rational.
  The two alphabet dimensions will be $ell$ and $ell - 1$, so the dimension in 4 is $n = ell - 1$.
  The soundness argument below chooses $ell \, k_0 \, beta$ using only $b$ and the absolute constant $s_(*)$.

===== 10.1.2 Spaces, labels, and folding. <spaces-labels-and-folding.>

Let $cal(Z)$ be the variables of the 3Lin instance, let $V_0 = bb(F)_2^(cal(Z))$, and view each equation $e$ as

$ chevron.l x_e \, alpha chevron.r = b_e \, wide x_e in V_0 \, quad b_e in bb(F)_2 \, $

where $x_e$ has its three variable coordinates equal to one.
  A #emph[legitimate] tuple $U$ consists of $k_0$ disjoint equations with the additional separation condition
  imposed in #cite(label("DKKMS25")) Section 4.2: variables from different equations of $U$ do not occur together
  in any input equation. Put

$ V_U = bb(F)_2^("var" \( U \)) \, wide H_U = "span" { x_e : e in U } . $

The vectors $x_e$, $e in U$, are independent, so $dim V_U = 3 k_0$, $dim H_U = k_0$,
  and there is a unique linear function $h_U : H_U arrow.r bb(F)_2$ with $h_U \( x_e \) = b_e$.

Before folding, a left question is $\( U \, L \)$, where

$ L lt.eq V_U \, wide dim L = ell \, wide L ∩ H_U = { 0 } . $

For a variable subset $V subset.eq cal(Z)$, write $V_V = bb(F)_2^V lt.eq V_0$;
  the rule for sampling $V$ is given below. A right question is $\( V \, L' \)$, with $L' lt.eq V_V$ and $dim L' =
  ell - 1$. On an incident pair, $L' lt.eq L$. The respective answers are linear functions on $L$ and $L'$,
  and the constraint is restriction. Choosing bases therefore identifies the unfolded alphabets with $bb(F)_2^ell$
  and $bb(F)_2^(ell - 1)$.

The folding of #cite(label("DKKMS25")) Section 4.2 puts $\( U \, L \)$ and $\( U_1 \, L_1 \)$ in the same class when

$ L + H_U + H_(U_1) = L_1 + H_U + H_(U_1) . $

Lemma 4.2 there proves that this is an equivalence relation and supplies, for every class $cal(C)$,
  a fixed $ell$-dimensional space $R_(cal(C))$ such that

#[#set math.equation(numbering: n => "(10.1)")
 $ R_(cal(C)) + H_U = L + H_U quad upright("for every ") \( U \, L \) in cal(C) . $ <eq:affine-complements>]

Both sides have dimension $ell + k_0$; consequently $R_(cal(C)) ∩ H_U = { 0 }$ as well.
  A folded answer is a linear function $sigma : R_(cal(C)) arrow.r bb(F)_2$.
  Its unfolding on $\( U \, L \)$ is the restriction to $L$ of the unique extension

#[#set math.equation(numbering: n => "(10.2)")
 $ tilde(sigma)_U \( r + h \) = sigma \( r \) + h_U \( h \) \, wide r in R_(cal(C)) \, quad
   h in H_U . $ <eq:affine-unfolding>]

For clarity, the affineness here is a property of the map between #emph[answer spaces].
  For $z in L$, write uniquely $z = A_U z + B_U z$ with $A_U z in R_(cal(C))$ and $B_U z in H_U$.
  The map $A_U : L arrow.r R_(cal(C))$ is a linear isomorphism by (10.1). Thus unfolding is

$ sigma mapsto sigma compose A_U + h_U compose B_U \, $

an affine bijection from $R_(cal(C))^(*)$ to $L^(*)$. Composing it with the surjective restriction $L^(*)
  arrow.r \( L' \)^(*)$ gives a surjective affine map with a one-dimensional kernel in its linear part.
  Every fiber has exactly two elements. This proves the required affine promise after bases are fixed.
  Claim 4.4 of #cite(label("DKKMS25")) shows that the projections agree when several unfolded edges are aggregated
  into the same folded edge. Equivalently, these edges may be kept separately with their individual weights.

===== 10.1.3 Validity of the edge sampling. <validity-of-the-edge-sampling.>

We specify the treatment of ill-formed samples omitted from the displayed sampler.
  Sampling $k_0$ equations independently produces a nonlegitimate tuple with probability
  $O \( k_0^2 \/ \| cal(Z) \| \)$, by bounded occurrence. For fixed $k_0$ this can be made arbitrarily small.
  If necessary, take sufficiently many disjoint copies of the input instance; this preserves its value and regularity.

Given a legitimate $U$, independently for each equation, the right variable set $V$ contains all three variables
  with probability $1 - beta$ and otherwise one uniformly chosen variable. If $f_0$ equations contribute all three, then

$ dim V_V = k_0 + 2 f_0 \, wide dim \( V_V ∩ H_U \) = f_0 . $

For a uniformly chosen $\( ell - 1 \)$-space $L' lt.eq V_V$, counting nonzero vectors gives

$ Pr \[ L' ∩ H_U eq.not { 0 } \] & lt.eq frac(\( 2^(f_0) - 1 \) \( 2^(ell - 1) - 1 \), 2^(k_0 + 2 f_0) - 1) lt.eq
  2^(ell - k_0) . $

If $L' ∩ H_U = { 0 }$, a uniformly chosen $ell$-space $L lt.eq
  V_U$ containing $L'$ is obtained by choosing a nonzero vector of $V_U \/ L'$.
  It intersects $H_U$ nontrivially precisely when this vector belongs to $\( H_U + L' \) \/ L'$. Hence

$ Pr \[ L ∩ H_U eq.not { 0 } divides L' \] = frac(2^(k_0) - 1, 2^(3 k_0 - ell + 1) - 1) lt.eq 2^(ell - 2 k_0) . $

We condition the sampling on legitimacy and $L ∩ H_U = { 0 }$. The discarded probability is at most

#[#set math.equation(numbering: n => "(10.3)")
 $ kappa = O \( k_0^2 \/ \| cal(Z) \| \) + 2^(ell - k_0) + 2^(ell - 2 k_0) . $ <eq:affine-invalid-probability>]

The two geometric terms can be made arbitrarily small by increasing $k_0$ after $ell$ is fixed.
  We take their sum at most $1 \/ 4$ and, by using disjoint copies of the input if needed,
  take the probability of nonlegitimacy at most $1 \/ 4$. Thus the probability $q_(upright("all"))$ of retaining a
  sample from the original independent-equation sampler is at least $1 \/ 2$.
  We distinguish this total retained probability from the normalization after legitimacy has already been imposed.

Let $P$ be that sampler after conditioning on legitimate $U$, and put $E = { L ∩ H_U = { 0 } }$ and $eta =
  2^(ell - k_0) + 2^(ell - 2 k_0)$. Our edge law is $R = P \( thin dot.op divides E \)$, so $"TV" \( P \, R \) =
  P \( E^c \) lt.eq eta$. On the source’s valid edge set define the subprobability weights

$ w \( e \) = sum_(omega in E\
omega mapsto e) P \( omega \) \, wide q_(upright("edge")) = sum_e w \( e \) = P \( E \) gt.eq 1 - eta . $

Thus $R \( e \) = w \( e \) \/ q_(upright("edge"))$. For any folded labeling,
  its acceptance under $R$ is its raw valid acceptance divided by $q_(upright("edge"))$.
  The raw valid acceptance uses the law $P$ above, conditioned on legitimate $U$ but not on $E$,
  with payoff zero on invalid outcomes. We next bound this quantity using completed tables in the published
  soundness analysis.

=== 10.2 Completed tables and the equations encoded by their lists <completed-tables-and-the-equations-encoded-by-their-lists>

The soundness proof uses tables on every $ell$-dimensional subspace,
  although a folded labeling specifies answers only at valid vertices.
  We first extend those answers, preserving the consistency between the tables on $V_U$ and $V_V$.
  We then show that the linear functions decoded from these tables still satisfy the equations in $U$.

===== 10.2.1 Completing the tables. <completing-the-tables.>

For a right variable set $V$ occurring with a legitimate $U$, define

$ H \( V \) = "span" { x_e : e upright(" is an input equation and ") "var" \( e \) subset.eq V } . $

Every input equation supported in $"var" \( U \)$ belongs to $U$:
  an equation using two tuple blocks violates legitimacy, and a distinct equation inside one block would share
  three variables with that block’s equation. Since the equations of $U$ have disjoint supports, this proves

#[#set math.equation(numbering: n => "(10.4)")
 $ H_U ∩ V_V = H \( V \) . $ <eq:affine-validity-common-side-space>]

In particular, for $L subset.eq V_V$, validity of $\( U \, L \)$ is independent of the containing legitimate tuple $U$.

Fix a folded labeling. Let $F_U \[ L \]$ be its unfolded answer at each valid $\( U \, L \)$,
  and the zero linear function whenever $L ∩ H_U eq.not { 0 }$.
  For each $V$, define $F_V \[ L \]$ using any containing $U$ when $L ∩ H \( V \) = { 0 }$, and by zero otherwise.
  For valid $L$, all vertices $\( U \, L \)$ with that same $L$ lie in one folding class;
  their unfolded answers agree by #cite(label("DKKMS25")) Claim 4.4.
  Equation (10.4) gives the same independence for invalid $L$. Hence the completed tables satisfy

#[#set math.equation(numbering: n => "(10.5)")
 $ F_U \[ L \] = F_V \[ L \] wide \( L subset.eq V_V \, med dim L = ell \) .
   $ <eq:affine-validity-completed-consistency>]

The auxiliary table $F_V$ is on $ell$-spaces; it is distinct from the game’s right-answer table on
  $\( ell - 1 \)$-spaces.

The completed $F_U$ has a second property. Fix $K supset.eq H_U$ of dimension $ell + k_0$.
  All valid $L$ with $L + H_U = K$ belong to one folding class.
  The common folded label and its $\( H_U \, h_U \)$-extension give one linear function $f_K : K arrow.r
  bb(F)_2$ with $f_K \|_(H_U) = h_U$ and $F_U \[ L \] = f_K \|_L$ for every such $L$.
  This condition imposes no restriction on invalid entries.

===== 10.2.2 Agreement and list parameters. <agreement-and-list-parameters.>

The Grassmann agreement test for a table $F$ first chooses a uniform $\( ell - 1 \)$-space,
  then two independent uniform $ell$-spaces containing it, and accepts when their table entries agree on the
  common $\( ell - 1 \)$-space. Write $"agreement" \( F \)$ for its acceptance probability.

Fix a soundness parameter $delta in \( 0 \, 1 \)$. The agreement lemma #cite(label("DKKMS25")) Lemma 3.7 supplies
  constants $q \, r \, C$ and a positive function $alpha \( ell \)$ at agreement threshold $delta^2 \/ 8$,
  as in the proof of its Lemma 5.3. Set the thresholds

$ tau_r = min { C \/ 2 \, 1 \/ 2 } \, wide tau_i = 10^(- 9) tau_(i + 1)^12 quad \( 0 lt.eq i < r \) . $

Thus $0 < tau_i lt.eq 1 \/ 2$, and the pairs supplied by the agreement lemma have agreement strictly above the
  relevant thresholds. We also fix the second list thresholds

$ zeta_r = tau_0 \/ 2 \, wide zeta_i = 10^(- 9) zeta_(i + 1)^12 quad \( 0 lt.eq i < r \) . $

Both vectors are fixed before choosing $ell$; the function $alpha \( ell \)$ is positive once $ell$ is fixed.
  We choose $ell$ large enough for that agreement lemma and for the ordinary list bound #cite(label("DKKMS25"))
  Lemma 3.12 on $\( ell - q \)$-spaces with thresholds $\( zeta_i \)$. We also require $q lt.eq ell - 1$ and

#[#set math.equation(numbering: n => "(10.6)")
 $ 2^(q - ell) lt.eq tau_0 \/ 4 . $ <eq:affine-validity-ell-margin>]

The repetition parameter $k_0$ is chosen subsequently, large enough that the cited ambient-dimension requirements
  hold for every dimension between $k_0$ and $3 k_0$ and for their quotients by a $q$-space.

For a fixed $q$-space $Q$, a list records linear functions on spaces of codimension at most $r$ whose restrictions
  agree with the table on more than the designated fraction of $ell$-spaces containing $Q$.
  Only pairs with no occurring extension are kept. The next lemma shows that, for the completed tables above,
  these maximal pairs respect the original equations whenever $Q$ avoids their span.

#thm([Lemma 10.1.])[
  (The invariant-list assertion on admissible advice spaces).  #emph[Let $X$ have dimension $3 k_0$, let $H lt.eq
    X$ have dimension $k_0$, and let $h : H arrow.r bb(F)_2$ be linear.
    Suppose a table $F$ assigns a linear function to every $ell$-space,
    and that for every $\( ell + k_0 \)$-space $K supset.eq H$ there is a linear function $f_K : K arrow.r
    bb(F)_2$ such that $f_K \|_H = h$ and $F \[ L \] = f_K \|_L$ whenever $L + H = K$.
    Fix a $q$-space $Q$ with $Q ∩ H = { 0 }$, and set
$ e_(k_0) = 2^(ell + r - 2 k_0 + 1) . $

 Assume $q lt.eq ell$, $3 k_0 - r > ell$, (10.6), and $e_(k_0) lt.eq tau_0 \/ 4$.
   For $Q subset.eq W subset.eq X$ of codimension $i lt.eq r$, say that $\( g \, W \)$ occurs if $g : W arrow.r
   bb(F)_2$ is linear and
$ Pr_(Q subset.eq L subset.eq W \, med dim L = ell) \[ F \[ L \] = g \|_L \] > tau_i . $

 Call it maximal if it has no occurring extension to a strictly larger space.
   Every maximal occurring pair satisfies $H subset.eq W$ and $g \|_H = h$.]
] <lem:affine-validity-invariance>

#proof[
  Put $H' = H ∩ W$. In $W \/ Q$, the image $\( H' + Q \) \/ Q$ has dimension $dim H'$ because $Q ∩ H = { 0 }$.
    Counting nonzero vectors in a uniform $\( ell - q \)$-space gives
  $ d_W & := Pr_(Q subset.eq L subset.eq W) \[ L ∩ H eq.not { 0 } \]\
 & lt.eq frac(\( 2^(dim H') - 1 \) \( 2^(ell - q) - 1 \), 2^(dim W - q) - 1) lt.eq
   2^(ell + dim H' - dim W + 1) lt.eq e_(k_0) . $
  The same bound holds with $W$ replaced by any containing space of codimension at most $r$.
  Partition the valid spaces $L$ with $Q subset.eq L subset.eq W$ by $Y = L + H'$.
    Within a fixed class, the table is the restriction of one linear function on $Y$ respecting $h \|_(H')$;
    this follows by restricting $f_(L + H)$. If $g \|_(H') eq.not h \|_(H')$,
    the difference of these two functions is nonzero on $H'$.
    A complement to $H'$ in $Y$ containing $Q$ is a graph of a linear map on an $\( ell - q \)$-dimensional
    quotient. Each of its $ell - q$ independent lift choices must satisfy one nontrivial linear equation for the
    two functions to agree. Thus agreement within this class is at most $2^(q - ell)$ (and is zero if the
    functions already disagree on $Q$). Total agreement is at most
  $ d_W + \( 1 - d_W \) 2^(q - ell) lt.eq e_(k_0) + 2^(q - ell) lt.eq tau_0 \/ 2 < tau_i \, $
  a contradiction. Hence $g \|_(H') = h \|_(H')$.
  There is consequently a unique extension $tilde(g)$ to $tilde(W) = W + H$ respecting $h$.
    Under either of the two uniform distributions on valid $ell$-spaces containing $Q$ in $W$ and in $tilde(W)$,
    the image of $L$ in
  $ W \/ \( W ∩ H \) tilde.eq tilde(W) \/ H $
  is uniform among the $ell$-spaces containing the image of $Q$.
    Indeed, every such image has the same number of complements containing $Q$,
    namely $2^(\( ell - q \) dim \( H ∩ W \))$ in $W$ and $2^(\( ell - q \) dim H)$ in $tilde(W)$.
    Moreover, agreement depends only on this image: $f_(L + H)$ and $tilde(g)$ agree on $H$,
    so their difference vanishes on one complement precisely when it vanishes on every complement.
    The conditional agreement on valid spaces is therefore identical in the two ambient spaces.
    Since agreement in $W$ is at least $tau_i$, agreement in $tilde(W)$ is at least
  $ \( 1 - d_(tilde(W)) \) frac(tau_i - d_W, 1 - d_W) gt.eq \( 1 - e_(k_0) \) \( tau_i - e_(k_0) \) gt.eq tau_i -
    2 e_(k_0) gt.eq tau_i \/ 2 . $
  If $H subset.eq.not W$, the codimension $j$ of $tilde(W)$ is strictly smaller than $i$, and $tau_j lt.eq
    tau_(i - 1) < tau_i \/ 2$. This gives an occurring extension, contradicting maximality. ◻
]

Applying this lemma with $X = V_U$, $H = H_U$, and $h = h_U$ shows that every maximal pair decoded from $F_U$
  respects all equations in $U$, provided $Q ∩ H_U = { 0 }$.
  We next estimate the probability of that condition under the distribution used by the source’s soundness proof.

=== 10.3 Soundness, completeness, and the parameter order <soundness-completeness-and-the-parameter-order>

===== 10.3.1 The advice distribution. <the-advice-distribution.>

The outer game in #cite(label("DKKMS25")) Section 5.2 first samples $\( U \, V \)$,
  then takes $Q$ uniformly from the $q$-spaces of $V_V$. It sends $\( U \, Q \)$ and $\( V \, Q \)$ to its two
  players and asks for assignments on $"var" \( U \)$ and $V$, respectively.
  It accepts when those assignments agree on $V$ and the first satisfies every equation of $U$.
  If $f_0$ equations contributed all three variables, then $dim V_V = k_0 + 2 f_0$ and $dim H \( V \) = f_0$.
  Consequently, under this actual distribution, uniformly in $U \, V$,

#[#set math.equation(numbering: n => "(10.7)")
 $ Pr \[ Q ∩ H_U eq.not { 0 } divides U \, V \] lt.eq frac(\( 2^(f_0) - 1 \) \( 2^q - 1 \), 2^(k_0 + 2 f_0) - 1)
   lt.eq 2^(q - k_0) . $ <eq:affine-validity-advice-loss>]

We further increase $k_0$ until

#[#set math.equation(numbering: n => "(10.8)")
 $ e_(k_0) lt.eq tau_0 \/ 4 \, wide 2^(q - k_0) lt.eq delta alpha \( ell \) \/ 8 . $ <eq:affine-validity-k-margins>]

===== 10.3.2 From game acceptance to nonempty lists. <from-game-acceptance-to-nonempty-lists.>

Suppose a folded labeling has raw valid acceptance greater than $delta$ under $P$,
  the sampler conditioned on legitimate $U$ but not on validity of $L$.
  Testing the completed $F_U \[ L \]$ against the original right answer on $\( V \, L' \)$ can only increase this
  acceptance: valid entries are unchanged, and invalid outcomes previously had payoff zero.
  We may therefore apply the agreement/list and covering arguments in #cite(label("DKKMS25")) Lemma 5.3,
  Claim 5.6, and Equation (5.1) to the completed tables. Before invoking invariance,
  these arguments use total linear tables, their agreement, and (10.5); all are now defined on every sampled subspace.

For fixed $U \, Q$, let $cal(L)_(U \, Q)$ be the uniform law on $ell$-spaces of $V_U$ containing $Q$.
  Let $cal(L)'_(U \, Q)$ first sample $V$ conditional on the outer question $\( U \, Q \)$ and then a uniform
  $ell$-space of $V_V$ containing $Q$. These are the conditional laws in #cite(label("DKKMS25")) Lemma 4.11.
  Indeed, if $N_q \( d \)$ denotes the number of $q$-spaces in $bb(F)_2^d$,
  then for $Q subset.eq V_V$ a uniform $ell$-space $L lt.eq V_V$ satisfies

$ Pr \[ Q subset.eq L divides V \] = frac(N_q \( ell \), N_q \( dim V_V \)) . $

Thus conditioning the source’s $V \, L$ sampler on $Q subset.eq
  L$ weights each $V$ proportionally to $Pr \[ V divides U \] \/ N_q \( dim V_V \)$, exactly as in the outer game.

Let $E_1$ be the event $"agreement" \( F_U \) > delta^2 \/ 8$, let $E_2$ be

$ "TV" \( cal(L)_(U \, Q) \, cal(L)'_(U \, Q) \) lt.eq 2^(ell + 5) sqrt(beta) thin k_0^(1 \/ 4) \, $

and let $E_3$ be nonemptiness of the $Q$-list of $F_U$ at thresholds $\( tau_i \)$.
  Event $E_2$ is precisely the smoothness condition in the source’s Equation (4.3).
  For $E_3$, Lemma 3.7 of the source supplies an occurring pair for an $alpha \( ell \)$ fraction of uniform $Q$
  whenever $E_1$ holds; any such pair has a maximal occurring extension.
  This uses only existence of the first list, not a bound on its size.
  The cited arguments give these events joint probability at least $delta alpha \( ell \) \/ 4$.
  Intersecting with $E_4 = { Q ∩ H_U = { 0 } }$ leaves probability at least $delta alpha \( ell \) \/ 8$,
  by (10.7)–(10.8). The event $E_4$ depends only on $U \, Q$.
  Consequently it does not alter the subsequent conditional law of $V$ after $U \, Q$ have been fixed.

===== 10.3.3 The second player’s quotient lists. <the-second-players-quotient-lists.>

For each question $\( V \, Q \)$ and each linear form $gamma : Q arrow.r bb(F)_2$,
  fix a linear extension $p_gamma : V_V arrow.r bb(F)_2$. Let $nu : V_V arrow.r V_V \/ Q$ be the quotient map.
  Define a total table $T_gamma$ on the $\( ell - q \)$-spaces of $V_V \/ Q$ by

$ T_gamma \[ L \/ Q \] =
  cases(delim: "{", overline(F_V \[ L \] - p_gamma \|_L) \, & F_V \[ L \] \|_Q = gamma \,, 0 \, & F_V \[ L \] \|_Q
  eq.not gamma .) $

Here $Q subset.eq L subset.eq V_V$, $dim L = ell$, and the overline denotes the induced linear form on $L \/ Q$;
  it is defined in the first case because the difference vanishes on $Q$.

For this total table, use the ordinary maximal list with thresholds $\( zeta_i \)$:
  a pair $\( g \, S \)$ occurs if $S lt.eq V_V \/ Q$ has codimension $i lt.eq
  r$ and $T_gamma$ agrees with $g$ on more than a $zeta_i$ fraction of the $\( ell - q \)$-spaces in $S$.
  By #cite(label("DKKMS25")) Lemma 3.12, each such list has size at most $M_0 = M_0 \( ell - q \, r \, zeta_r \)$,
  independent of $k_0$. The second player chooses a uniform $gamma in Q^(*)$,
  then a uniform pair $\( g \, S \)$ from this list. It lifts $g$ to the linear form $g compose nu +
  p_gamma$ on $nu^(- 1) \( S \)$, extends it uniformly to $V_V$, and outputs the corresponding assignment.
  If its chosen list is empty, it uses an arbitrary assignment.
  The entire procedure uses only $\( V \, Q \)$ and the fixed tables.

The zero entries may create additional occurring extensions in an auxiliary table. This causes no difficulty:
  the proof below needs an extension of a specified linear form,
  rather than an identification of these auxiliary maximal pairs with the maximal pairs of $F_V$.

===== 10.3.4 Success of the two strategies. <success-of-the-two-strategies.>

The first player chooses a uniform maximal pair $\( f \, W \)$ from the $tau$-list of $F_U$ and extends $f$
  uniformly to $V_U$, using an arbitrary assignment if its list is empty.
  This finite list need not have a size bound independent of $k_0$:
  the success estimate will hold for every one of its elements.
  The second player uses the quotient lists just constructed.

Fix $U \, Q$ in $E_1 ∩ E_2 ∩ E_3 ∩ E_4$, and any first-player choice $\( f \, W \)$, with $i =
  "codim"_(V_U) W lt.eq r$. By 18, $H_U subset.eq W$ and $f \|_(H_U) = h_U$.
  Every extension chosen by the first player therefore satisfies all equations of $U$.
  This is the only use of the invariant-list assertion in the source’s decoding argument.

The covering step of #cite(label("DKKMS25")) Lemmas 4.11 and 5.5 and the proof of Lemma 5.3, using (10.5),
  gives probability at least $0.3 tau_i gt.eq 0.3 tau_0$ over $V$ that

$ "codim"_(V_V) \( W ∩ V_V \) = i \, wide Pr_(Q subset.eq L subset.eq W ∩ V_V) \[ F_V \[ L \] = f \|_L \] >
  tau_i \/ 2 . $

Here $L$ has dimension $ell$. Set $S_0 = W ∩ V_V$ and $gamma = f \|_Q$.
  Every equality $F_V \[ L \] = f \|_L$ in this display is retained in $T_gamma$.
  Since $zeta_i lt.eq tau_0 \/ 2 lt.eq tau_i \/ 2$, the quotient pair

$ #scale(x: 120%, y: 120%)[\(] overline(f \|_(S_0) - p_gamma \|_(S_0)) \, med S_0 \/ Q #scale(x: 120%, y: 120%)[\)] $

occurs for $T_gamma$ and hence has a maximal occurring extension in that auxiliary table.
  Lifting any such extension by the same $p_gamma$ gives a function agreeing with $f$ on all of $S_0$.
  This conclusion concerns function extension and is unaffected by the extra agreements that zero completion may
  introduce.

The second player selects this tag and one such maximal extension with probability at least $1 \/ M$, where $M :=
  2^q M_0$ is independent of $k_0$. Its eventual answer then agrees with $f$ on $W ∩ V_V$.
  The first player’s uniform extension agrees with this answer on all of $V_V$ with probability $2^(- i) gt.eq
  2^(- r)$: the quotient $V_V \/ \( W ∩ V_V \)$ has dimension $i$.
  Thus, conditionally on $E_1 ∩ E_2 ∩ E_3 ∩ E_4$, the strategy wins with probability at least

$ c_(*) := 2^(- r) frac(0.3 tau_0, M) > 0 . $

The overall success probability is at least $delta alpha \( ell \) c_(*) \/ 8$,
  a positive constant independent of $k_0$. The upper bound in #cite(label("DKKMS25")) Lemma 5.4 tends to zero as
  $beta k_0 arrow.r oo$. Choosing $k_0$ sufficiently large gives the same contradiction as in the source and
  proves that raw valid acceptance is at most $delta$.

===== 10.3.5 Fixing soundness before completeness. <fixing-soundness-before-completeness.>

For the game in 4, take $delta = b \/ 4$ and retain the valid raw weights.
  Their total mass $q_(upright("edge"))$ is at least $1 \/ 2$ by the preceding rejection estimates.
  Normalization therefore gives

$ "Val" lt.eq delta \/ q_(upright("edge")) lt.eq b \/ 2 < b . $

Every restriction above concerns only $b$ and parameters fixed from it.
  After choosing $ell$, take $k_0 = j^4$ and $beta = j^(- 3)$ with $j$ sufficiently large.
  Then $beta k_0 arrow.r oo$, $beta sqrt(k_0) arrow.r 0$, and $sqrt(beta) thin k_0^(1 \/ 4) arrow.r 0$.
  These limits satisfy the outer-game soundness and covering requirements, including $2^ell beta lt.eq 1 \/ 8$,
  as well as all the displayed margins. In particular, the alphabet dimension $n = ell -
  1$ has been fixed using only $b$.

===== 10.3.6 Completeness with the alphabet fixed. <completeness-with-the-alphabet-fixed.>

Let $alpha : cal(Z) arrow.r bb(F)_2$ satisfy all but an $epsilon$ fraction of the input equations,
  and also write $alpha : V_0 arrow.r bb(F)_2$ for its linear extension.
  Give the folded left question $cal(C)$ the answer $alpha \|_(R_(cal(C)))$ and give $\( V \, L' \)$ the answer
  $alpha \|_(L')$. Whenever every equation of sampled $U$ is satisfied, $h_U = alpha \|_(H_U)$,
  so (10.2) is exactly $alpha \|_(R_(cal(C)) + H_U)$. The edge is therefore satisfied.
  This argument concerns the sampled edge; it does not require every member of its folding class to involve
  satisfied equations.

Before either conditioning step, a union bound gives probability at most $k_0
  epsilon$ of sampling an unsatisfied equation. Since the total retained probability $q_(upright("all"))$ is at
  least $1 \/ 2$, the conditioned game’s value is at least $1 - k_0 epsilon \/ q_(upright("all")) gt.eq 1 -
  2 k_0 epsilon$. After $ell \, k_0$ have been fixed for soundness, choose $epsilon lt.eq
  a \/ \( 2 k_0 \)$ in the initial 3Lin gap. This gives the asserted completeness without altering $n$.

===== 10.3.7 Effectivity and size. <effectivity-and-size.>

All spaces in an individual question have bounded dimension.
  There are polynomially many $k_0$-tuples of input equations, and each tuple has only constantly many subspaces,
  bases, and local sampling outcomes. The folding equivalence relation is explicitly testable by linear algebra.
  To find $R_(cal(C))$ effectively, start from any $\( U \, L \) in
  cal(C)$ and enumerate the $ell$-spaces inside $L + H_U$, whose dimension is the fixed constant $ell + k_0$;
  test each candidate against (10.1) for every class member. Lemma 4.2 guarantees a successful candidate.
  Gaussian elimination then computes bases and the affine edge maps.
  The finite sampling distributions, their conditioning, and the aggregation of parallel edges have rational
  weights of polynomial bit length. These observations give the deterministic polynomial reduction claimed in the
  proposition. This completes the proof of 4.

== 11 Conversion to simple unweighted graphs <sec:unweighted>

We include an explicit deterministic conversion so that rational edge weights and loops introduce no additional
  complexity assumption. The comparison uses the original, unnormalized weight scale.
  We replace each vertex by a cluster and approximate each weighted edge by a bipartite graph whose edge count on
  every rectangle approximates the weighted-density prediction with a uniform absolute error.
  An arbitrary cut may split each cluster. Its cluster proportions then describe a random cut of the original
  graph, so the rectangle estimates control all cuts of the enlarged graph, not just cuts constant on clusters.

#thm([Lemma 11.1.])[
  #emph[Let $G$ be a graph on $N$ vertices with nonnegative rational weights $w_(u v)$ on unordered distinct
    vertex pairs, and $sum_(u < v) w_(u v) lt.eq 1$. For every fixed $epsilon.alt' > 0$,
    one can construct in deterministic polynomial time a simple unweighted graph $G'$ and an integer scale $Q$ such that
$ lr(|frac("MaxCut" \( G' \), Q) - "MaxCut" \( G \)|) lt.eq epsilon.alt' . $

 The same conclusion holds when the input graph has loops, after deleting them without renormalizing its other weights.]
] <lem:unweighted>

#proof[
  Choose a prime $p > max { 2 \, 2 N^2 \/ epsilon.alt' }$. A prime of polynomial size can be found
    deterministically by testing successive integers, using Bertrand’s postulate to bound the search.
    Replace every vertex by a cluster indexed by $bb(F)_p^6$.
    For each $u < v$ let $I_(u v) subset.eq bb(F)_p$ be any fixed set of $floor.l p w_(u v) floor.r$ residues,
    for example the first such residues in the usual ordering.
    Join $x$ in cluster $u$ to $y$ in cluster $v$ exactly when
  $ x dot.op y in I_(u v) . $
  There are no edges within clusters. This defines a simple graph on $N p^6$ vertices,
    constructible by enumerating all possible pairs. Take $Q = p^12$.
  We first estimate its edge count on arbitrary rectangles between two clusters.
    Fix a residue set $I$ and subsets $S \, T subset.eq bb(F)_p^6$.
    Writing $psi \( a \) = exp \( 2 pi i a \/ p \)$, Fourier inversion gives
  $ upright(bold(1))_I \( a \) = sum_(h in bb(F)_p) beta_h psi \( h a \) \, wide beta_h = 1 /
    p sum_(a in I) psi \( - h a \) \, wide \| beta_h \| lt.eq 1 . $
  For $h eq.not 0$, the matrix $M_h \( x \, y \) = psi \( h x dot.op y \)$ satisfies
  $ M_h M_h^(*) = p^6 I \, $
  by character orthogonality, so its operator norm is $p^3$. Consequently,
  $ lr(|\# { \( x \, y \) in S times T : x dot.op y in I } - frac(\| I \|, p) \| S \| \| T \||) & lt.eq
    sum_(h eq.not 0) \| beta_h \| p^3 sqrt(\| S \| \| T \|)\
 & lt.eq p^10 . $
  For $I = I_(u v)$, division by $p^12$ and $\| \| I \| \/ p - w_(u v) #scale(x: 120%, y: 120%)[\|] lt.eq
    1 \/ p$ show that
  #[#set math.equation(numbering: n => "(11.1)")
   $ lr(|frac(e_(u v) \( S \, T \), p^12) - w_(u v) frac(\| S \|, p^6) frac(\| T \|, p^6)|) lt.eq 1 / p + 1 /
     p^2 . $ <eq:rectangle-discrepancy>]
  Now fix an arbitrary cut of $G'$, and let $a_u in \[ 0 \, 1 \]$ be the fraction of cluster $u$ on its positive
    side. Its crossing edges between clusters $u \, v$ form two rectangles.
    Equation (11.1) therefore compares their scaled count with
  $ w_(u v) #scale(x: 120%, y: 120%)[\(] a_u \( 1 - a_v \) + \( 1 - a_u \) a_v #scale(x: 120%, y: 120%)[\)] $
  to error at most $2 \/ p + 2 \/ p^2$. Summing over the at most $N \( N - 1 \) \/
    2$ pairs costs at most $N \( N - 1 \) \( 1 \/ p + 1 \/ p^2 \)$.
    The displayed weighted expression, summed over pairs, is the expected cut weight obtained by independently
    assigning vertex $u$ a positive sign with probability $a_u$. It is at most $"MaxCut" \( G \)$.
    This proves the desired upper bound for every cut of $G'$.
  Conversely, give all vertices in each cluster the sign of a maximum cut of $G$.
    The same rectangle bound compares its scaled weight with $"MaxCut" \( G \)$ to at most the same error,
    giving the reverse inequality. Our choice of $p$ ensures $N \( N - 1 \) \( 1 \/ p + 1 \/ p^2 \) <
    epsilon.alt'$, which proves the assertion. Loops contribute zero to every cut and can be deleted at the outset. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
