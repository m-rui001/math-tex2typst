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

#align(center)[#text(size: 16pt, weight: "bold")[Constant-factor hardness of Min-UnCut]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a finite simple undirected graph $G = \( V \, E \)$ and a bipartition $V = S union.sq \( V \\ S \)$, define

$ "uncut"_G \( S \) = \| { u v in E : u \, v in S upright(" or ") u \, v in.not S } \| \, #h(2em) "OPT"_(upright("uncut")) \( G \) = min_(S subset.eq V) "uncut"_G \( S \) . $

The two parts may be empty and need not be balanced. Equivalently, $"OPT"_(upright("uncut")) \( G \)$ is the minimum number of edges whose deletion makes $G$ bipartite: deleting the uncut edges of a partition suffices, and a bipartition of any remaining bipartite graph makes every uncut edge belong to the deleted set. This is the edge-deletion problem throughout.

Min-UnCut measures distance from bipartiteness. Although its objective is the number of edges minus the maximum cut size, a multiplicative approximation for Max-Cut does not give a comparable multiplicative approximation for Min-UnCut when the graph is nearly bipartite. Its approximation question therefore concerns how accurately one can recognize and exploit that regime. Agarwal, Charikar, Makarychev and Makarychev gave a randomized polynomial-time $O \( sqrt(log \| V \|) \)$ approximation for Min-UnCut #cite(label("ACMM2005")) Theorem 2.1. Under the Unique Games Conjecture, the near-satisfiable Max-Cut gap of Khot, Kindler, Mossel and O’Donnell implies arbitrarily large constant gaps for weighted Min-UnCut #cite(label("KKMO2007")): graphs admitting a cut that misses at most an $eta$ fraction of the total edge weight are hard to distinguish from graphs in which every cut misses a constant times $sqrt(eta)$ of that weight. The ratio of these two uncut costs grows without bound as $eta$ decreases.

Unconditional lower bounds for particular constants have developed through successively stronger finite gadgets. Håstad, Huang, Manokaran, O’Donnell and Wright proved hardness for every factor below $11 \/ 8$ in the weighted minimum-deletion formulation of Max-Cut #cite(label("HHMOW2017")) Corollary 3.3. Wiman strengthened the near-satisfiable Max-Cut gap to give factors below $1.45685$ #cite(label("Wiman2018")) Theorem 3.18. Martinsson subsequently obtained hardness for every factor below $73139148 \/ 49096883 approx 1.48969$ for minimizing the weight of violated two-variable parity equations #cite(label("Martinsson2024")) Theorem 1.1. The last result transfers to weighted Min-UnCut by replacing equality and inequality constraints by paths of lengths four and three, respectively, with fresh internal vertices and the constraint’s weight on each edge. For fixed endpoint bits each path has minimum uncut weight equal to the violated constraint’s weight, so this preserves absolute minimum cost even though the total weight changes. These results concern individual constant factors; the theorem below gives every prescribed constant factor on simple unweighted graphs.

#thm([Theorem 1.1.])[
  #emph[For every fixed integer $K gt.eq 2$, there is a deterministic polynomial-time many-one reduction mapping a $3$SAT formula $phi$ to a pair $\( G \, k \)$, where $G$ is an explicit finite simple undirected unweighted graph and $k gt.eq 1$ is a binary-encoded integer, such that 
$ phi upright(" satisfiable") & quad arrow.r.double quad "OPT"_(upright("uncut")) \( G \) lt.eq k \,\
phi upright(" unsatisfiable") & quad arrow.r.double quad "OPT"_(upright("uncut")) \( G \) > K k . $

 For each fixed $K$, the graph size, full construction work, and bit complexity are polynomial in the bit length of $phi$. All constants are effective; no advice or oracle is supplied to the reduction.]
] <thm:main>

Theorem 1 resolves the constant-factor approximability question for Min-UnCut in the hardness direction. It assumes neither the Unique Games Conjecture nor any other unproved hardness hypothesis. Choosing an integer $K$ at least any prescribed real factor $C > 1$ shows that a deterministic polynomial-time $C$-approximation would imply $sans(P) = sans(N P)$. The positive threshold $k$ separates this assertion from ordinary bipartiteness testing. For a randomized approximation with constant success probability, the corresponding consequence is $sans(N P) subset.eq sans(R P)$; Section 7 explains the one-sided test.

In minimum $2$CNF clause deletion, the input is an explicit list of two-literal disjunctions, each of unit cost, and one deletes as few clause occurrences as possible to make the remaining formula satisfiable. Write $"OPT"_(upright("del")) \( F \)$ for this minimum and $"unsat" \( F \, a \)$ for the number of clause occurrences falsified by an assignment $a$. Agarwal et al. also give a randomized polynomial-time $O \( sqrt(log n) \)$ approximation for this problem on $n$ variables #cite(label("ACMM2005")) Theorem 3.1.

#thm([Corollary 1.2.])[
  #emph[For every fixed real $C > 1$, minimum $2$CNF clause deletion is NP-hard to approximate within factor $C$. In particular, a deterministic polynomial-time $C$-approximation would imply $sans(P) = sans(N P)$.]
] <cor:min-2cnf-deletion>

The proof in Section 7.5 replaces each edge by two clauses and preserves the optimum deletion cost exactly.

=== 1.1 Proof strategy <proof-strategy>

The reduction first constructs weighted comparisons between bits using Gaussian-sampled queries. A satisfying source instance admits bits of total comparison cost at most $4$, whereas an unsatisfiable instance forces cost greater than an arbitrarily prescribed constant $J$. The graph construction then realizes each failed comparison by exactly one uncut edge. The main work is obtaining this comparison gap with constants chosen before the label alphabet.

===== 1.1.1 A game with affine labels. <a-game-with-affine-labels.>

The starting point is Håstad’s near-satisfiable gap for three-variable parity equations #cite(label("Hastad2001")), recalled with ordinary parallel repetition in Section 2. A first player receives a tuple of equations and labels it by satisfying assignments to the separate equations. A second player sees the full equations in most coordinates and only a queried variable in a small set of hidden coordinates. Its label supplies the corresponding bits. The verifier checks agreement. The two label sets are finite affine spaces over $bb(F)_2$, and agreement is an affine map from the first space to the second.

Section 5 proves two properties of this game. Its soundness survives giving both players a fixed number of shared affine functions on their labels: many hidden coordinates have zero coefficients in all those functions and still support ordinary repetition. Also, a fixed number of uniform affine functions on the second alphabet, pulled back through the random agreement map, have joint distribution close to independent uniform functions on the first alphabet. The latter is a statement about the whole collection; it allows later decoding choices to depend on some of its members. These properties are proved directly for the questions used here.

===== 1.1.2 A comparison test for arbitrary bit proofs. <a-comparison-test-for-arbitrary-bit-proofs.>

At each question with alphabet $A$, replace a label $a$ by a function $f$ assigning a sign $f \( P \) in { 1 \, - 1 }$ to every Boolean query $P : A arrow.r { 1 \, - 1 }$. The intended function evaluates queries, $f \( P \) = P \( a \)$. Arbitrary functions are required only to satisfy $f \( - P \) = - f \( P \)$, the usual folding relation. We must extract labels from arbitrary such functions whose comparison cost is small.

Section 3 constructs three tests using random affine functions and Gaussian thresholds. The affine functions are arranged on $X = \[ n \]^m$ as sums of $m$ arrays, with the $i$th array independent of the $i$th coordinate. Each test compares two queries obtained by a controlled change of this data. The tests respectively control Gaussian perturbations, resampling of array entries, and changes in individual entries of a Boolean truth table. Evaluation proofs have small cost in all three tests.

For a general proof, Gaussian averaging gives a smooth real-valued function of the threshold parameters. Its gradient retains nonzero energy because the first test rarely changes the answer. The other two tests control its Fourier degrees and its correlation with products of functions each missing one coordinate of $X$. These bounds use the number of array positions, not the number of affine labels.

===== 1.1.3 Extracting a label without an alphabet-size loss. <extracting-a-label-without-an-alphabet-size-loss.>

Section 4 converts that correlation into a large Fourier coefficient in one affine-function entry, with all other entries fixed. The coefficient is odd: its character changes sign upon adding the constant function $1$. Each such character has the form $b mapsto \( - 1 \)^(b \( a \))$ for a unique label $a$, by Lemma 3.

The extraction uses symmetries of the array representation to pair equal odd frequencies. Restricting to a random smaller box then separates their remaining random variables. Repeated Cauchy–Schwarz removes the arbitrary functions missing coordinates and leaves products over cube vertices. The terms involving the Gaussian coordinate at the tested point vanish by centering, while the paired terms factor over independent four-corner squares, each controlled by a Fourier coefficient. The selection of terms depends only on which array entries and Gaussian degrees occur; it never enumerates label frequencies. This distinction gives an extraction probability and coefficient size independent of the affine alphabet.

===== 1.1.4 Composition and finite graphs. <composition-and-finite-graphs.>

Section 6 adds a fourth test comparing the two players’ answers to the same pulled-back query. Low cost makes their smoothed one-entry functions close. The large coefficients on each side form short label lists. Joint approximation of the affine-function distributions controls the remaining small coefficients through a fourth-moment identity, even when the first list was chosen using shared background functions. The lists yield an agreeing pair with fixed positive probability, contradicting the game’s soundness. All inner constants are fixed before the game’s repetition parameters and alphabet.

Finally, Section 7 approximates the complete joint Gaussian sign tables by a rational law. Enumerating this law gives a deterministic comparison system with polynomial numerical multiplicities for fixed $K$. Fresh paths of lengths four and three realize equality and inequality demands exactly, including demands with coincident endpoints. Their costs have no additive baseline, so a positive integer threshold preserves the strict multiplicative gap. The constants may be large; the approximation factor is fixed before the input formula is given.

=== 1.2 Relation to earlier methods <relation-to-earlier-methods>

The parity-equation starting point belongs to the PCP approach to hardness of approximation: a locally checked proof gives a finite constraint system with a gap between satisfiable and unsatisfiable inputs. Håstad’s construction provides the near-satisfiable parity gap used here, while the parallel repetition theorems of Raz and Holenstein amplify the corresponding two-player game #cite(label("Hastad2001")) #cite(label("Raz1998")) #cite(label("Holenstein2009")). Neither step assumes Unique Games. In particular, the completeness error is positive and is selected only after the repetitions have been fixed.

Our bit proofs use the long code and folding of Bellare, Goldreich and Sudan #cite(label("BGS1998")), which also underlie Håstad’s Fourier analysis. Khot and Safra use smooth equation–variable games and decode short label lists from large Fourier coefficients #cite(label("KS13")) Sections 3.2–3.4 and 5.2. Shared linear advice and coordinates on which that advice vanishes appear in Khot, Minzer and Safra #cite(label("KMS17")) Sections 3.3–3.4; a related shared-subspace formulation appears in Dinur et al. #cite(label("DKKMS2025")) Lemma 5.4. Our outer-game proofs retain this mechanism but establish the precise hinted soundness and joint approximation estimates needed by a decoder that depends on its shared background.

The analytic tools also have established precedents. The Gaussian sign identity is the random-hyperplane calculation of Goemans and Williamson #cite(label("GW95")), and Gaussian smoothing and Hermite expansions are standard in noise-stability analysis #cite(label("MOO10")). The box estimate uses the iterated Cauchy–Schwarz mechanism in Gowers’s hypergraph arguments #cite(label("Gowers2007")). We prove the identities and inequalities used here. The additional argument is the extraction of an odd one-entry coefficient from an arbitrary bit proof, uniformly in its alphabet, and its transfer through a random affine map when the remaining coefficients depend on the background.

== 2 Preliminaries and unconditional starting theorems <sec:preliminaries>

All finite-set averages and Fourier transforms use probability normalization. Every affine space in the paper is a finite nonempty affine space over $bb(F)_2$. Constants described as fixed are independent of the input instance; their dependence on the requested approximation factor is allowed.

=== 2.1 Affine alphabets and odd characters <affine-alphabets-and-odd-characters>

For an affine space $A$, let $D \( A \)$ be the vector space of affine functions $A arrow.r bb(F)_2$, including constants. If $A$ has dimension $r$, then $D \( A \)$ has dimension $r + 1$. Write $1 in D \( A \)$ for the constant-one function. A frequency is an element $alpha$ of the linear dual $D \( A \)^(*)$, with character $chi_alpha \( b \) = \( - 1 \)^(alpha \( b \))$. Call $alpha$ #emph[odd] if $alpha \( 1 \) = 1$.

#thm([Lemma 2.1.])[
  (Odd frequencies are labels).  #emph[The map $a mapsto "ev"_a$, where $"ev"_a \( b \) = b \( a \)$, is a bijection from $A$ onto the odd frequencies of $D \( A \)$. If $pi : A arrow.r A'$ is affine and $pi^(*) : D \( A' \) arrow.r D \( A \)$ is pullback, then its dual sends $"ev"_a$ to $"ev"_(pi \( a \))$.]
] <lem:odd-labels>

#proof[
  Choose affine coordinates $A = bb(F)_2^r$. Every affine function is $b \( x \) = b_0 + sum_(j = 1)^r b_j x_j$. A functional taking the constant function to one is uniquely $b mapsto b_0 + sum_j b_j a_j$, for some $a in bb(F)_2^r$. Finally $\( pi^(*) \)^(*) \( "ev"_a \) \( b \) = b \( pi \( a \) \)$. ◻
]

For a real function $v$ on a finite binary vector space $W$, write

$ hat(v) \( alpha \) = bb(E)_(w in W) v \( w \) \( - 1 \)^(alpha \( w \)) \, #h(2em) v \( w \) = sum_(alpha in W^(*)) hat(v) \( alpha \) \( - 1 \)^(alpha \( w \)) . $

Character orthogonality gives Parseval’s identity $sum_alpha \| hat(v) \( alpha \) \|^2 = bb(E) v^2$. If $T : W' arrow.r W$ is linear, each character of $v$ pulls back to its image under $T^(*)$; coefficients with the same image add. Injectivity and surjectivity of $T$ are unnecessary. We will use the identity

#[#set math.equation(numbering: n => "(2.1)")
 $ sum_alpha \| hat(v) \( alpha \) \|^4 = bb(E)_(a \, b \, c in W) v \( a \) v \( b \) v \( c \) v \( a + b + c \) . $ <eq:fourth-moment>]

Indeed, expansion of the four factors and averaging over the three independent points force all four frequencies to agree.

=== 2.2 Gaussian identities <gaussian-identities>

We recall the Fourier–Hermite identities used in Gaussian noise-stability analysis #cite(label("MOO10")) Sections 4.1 and 5, with proofs of the needed forms. Let $gamma_d$ be standard Gaussian probability measure on $bb(R)^d$. The normalized Hermite polynomials $H_j$ are specified by

$ e^(t z - t^2 \/ 2) = sum_(j gt.eq 0) H_j \( z \) t^j / sqrt(j !) . $

Gaussian integration of the product of two generating functions proves their orthonormality. Their products $psi_I \( c \) = product_x H_(I_x) \( c_x \)$ form an orthonormal basis of $L^2 \( gamma_d \)$. For completeness, if a function is orthogonal to all these polynomials, its Gaussian-weighted exponential transform has every Taylor coefficient zero. Cauchy–Schwarz makes that transform entire in each variable; its restriction to imaginary arguments is the Fourier transform of an integrable function, which is therefore zero. Thus the original function is zero almost everywhere.

Differentiating the generating function gives $H'_j = sqrt(j) H_(j - 1)$. Consequently, for a function with square-integrable weak gradient,

#[#set math.equation(numbering: n => "(2.2)")
 $ integral lr(bar.v.double nabla F bar.v.double)^2 thin upright(d) gamma_d = sum_I \| I \| \| hat(F) \( I \) \|^2 \, #h(2em) \| I \| = sum_x I_x . $ <eq:hermite-energy>]

One first proves this for polynomials, and then passes to the Hermite partial sums and weak derivatives. In the smoothed functions used below the weighted series converges directly. In particular, mean-zero $F$ satisfies the Gaussian Poincaré inequality $integral F^2 thin upright(d) gamma_d lt.eq integral lr(bar.v.double nabla F bar.v.double)^2 thin upright(d) gamma_d$.

For $0 < rho < 1$, the Gaussian noise operator

$ T_rho Q \( c \) = bb(E)_g Q \( rho c + sqrt(1 - rho^2) thin g \) $

multiplies $psi_I$ by $rho^(\| I \|)$, as follows by averaging its generating function. If $Q$ is bounded and $sigma > 0$, ordinary Gaussian convolution is smooth and

#[#set math.equation(numbering: n => "(2.3)")
 $ partial_(c_x) bb(E)_g Q \( c + sigma g \) = 1 / sigma bb(E)_g g_x Q \( c + sigma g \) . $ <eq:gaussian-derivative>]

Differentiation of the Gaussian density is justified by its integrable derivatives; an additional independent average may be included in $Q$.

We also use the elementary sign identity underlying random-hyperplane rounding #cite(label("GW95")) Lemma 3.2: if $u \, v$ are unit vectors and $g$ is standard isotropic Gaussian, then

#[#set math.equation(numbering: n => "(2.4)")
 $ bb(P) \[ "sgn" chevron.l \, chevron.r g u eq.not "sgn" chevron.l \, chevron.r g v \] = frac(angle \( u \, v \), pi) lt.eq lr(bar.v.double u - v bar.v.double) . $ <eq:gaussian-signs>]

It follows by rotational symmetry in the two-dimensional plane spanned by $u \, v$; the collinear cases follow by continuity. In particular, adding an independent centered Gaussian of standard deviation $a$ to a standard Gaussian changes its sign with probability $arctan \( a \) \/ pi lt.eq a$.

=== 2.3 The starting gap and repetition <the-starting-gap-and-repetition>

#thm([Theorem 2.2.])[
  (An unconditional equation gap).  #emph[For every fixed rational $zeta > 0$, there is a deterministic polynomial-time reduction from $3$SAT to a nonempty explicit list of equations $x_i + x_j + x_k = b$ over $bb(F)_2$, with uniform sampling from the list, such that satisfiable inputs admit an assignment satisfying at least $1 - zeta$ of the list and unsatisfiable inputs admit none satisfying more than $3 \/ 4$. The list length and the full bit complexity are polynomial for fixed $zeta$.]
] <thm:max3lin>

#proof[
  Håstad’s Theorem 5.4, including the verifier-to-equations construction in its proof, gives a deterministic polynomial construction of rationally weighted three-variable equations with YES value at least $1 - delta$ and NO value at most $\( 1 + delta \) \/ 2$, for every fixed sufficiently small dyadic $delta > 0$ #cite(label("Hastad2001")). Here the weights and their polynomial-size support are explicit.
  We record why a uniform list costs only polynomial work. For a probability vector $\( w_1 \, dots.h \, w_r \)$ of rational weights and an integer $Q$, take $floor.l Q w_j floor.r$ copies of equation $j$ and distribute the remaining copies among the largest fractional remainders. The resulting probabilities differ from the original ones in total variation by at most $r \/ \( 2 Q \)$. All floors, comparisons and sorting require polynomial bit complexity. Choose a fixed $epsilon > 0$ and $delta > 0$ with $delta + epsilon < zeta$ and $\( 1 + delta \) \/ 2 + epsilon < 3 \/ 4$, then $Q gt.eq r \/ \( 2 epsilon \)$ with $Q = O_epsilon \( r \)$. Satisfaction probabilities change by at most $epsilon$ for every assignment simultaneously, giving the asserted list. The underlying construction can be taken nonempty; any exceptional bounded input cases are decidable directly and replaced by fixed YES or NO lists. ◻
]

A finite two-player game consists of a joint distribution on questions $\( U \, V \)$, finite answer sets, and an acceptance predicate. Its value is the maximum acceptance probability of separate deterministic response functions. Independent shared or private randomness does not increase this maximum: fixing the random seed realizes at least its average success. The ordinary $r$-fold repetition samples $r$ independent question pairs and accepts only if all coordinates accept.

#thm([Theorem 2.3.])[
  (Uniform parallel repetition).  #emph[There is an effectively specified constant $c < 1$ such that every finite game with at most eight first-player answers, at most two second-player answers, and value at most $11 \/ 12$ has $r$-fold repeated value at most $c^r$ for all integers $r gt.eq 0$. The same $c$ works for all question distributions and all question-set sizes.]
] <thm:parallel-repetition>

#proof[
  This is an instance of ordinary parallel repetition #cite(label("Raz1998")). More explicitly, Theorem 2.5 of Holenstein #cite(label("Holenstein2009")), after padding the answer sets to sizes eight and two, permits
  $ c = (1 - frac(1, 6000 dot.op 12^3))^(1 \/ 4) < 1 . $
  Holenstein’s Theorem 2.5 imposes no regularity condition on the joint question distribution. A rational upper bound strictly between this $c$ and one may be used in every effective parameter choice below. ◻
]

== 3 The bit test and its smoothed correlation <sec:inner-smoothing>

We first define the inner test, including the distribution of its queries. Its soundness statement is uniform in the size of the affine alphabet. This uniformity will permit us to select the inner parameters before the outer repetition parameters.

=== 3.1 Folded proofs, face arrays, and queries <folded-proofs-face-arrays-and-queries>

For a nonempty affine alphabet $A$, a #emph[folded bit proof] is a function

$ f : { P : A arrow.r { 1 \, - 1 } } arrow.r { 1 \, - 1 } \, #h(2em) f \( - P \) = - f \( P \) . $

A query is the Boolean function $P$ itself: two descriptions that give the same function on $A$ must receive the same answer. The intended proof at $a in A$ is evaluation, $f \( P \) = P \( a \)$. The evaluation encoding is the long code of the label, and the displayed antisymmetry is the standard folding relation #cite(label("BGS1998")) #cite(label("Hastad2001")). Nonemptiness of $A$ ensures that $P eq.not - P$, so the folding requirement is consistent.

We allow a finite random index $xi$ with arbitrary probability weights to select an alphabet $A_xi$ and a folded proof $f_xi$. Conditional on $xi$, all sampling below is performed on its indicated alphabet. Expectations include $xi$ unless a conditioning is stated. Thus a bound on the average test failure will not be replaced by a bound for every individual index. We usually suppress $xi$ and write $A \, f$.

Let $m \, n gt.eq 2$ be integers, to be selected later. Write

$ X = \[ n \]^m \, #h(2em) N = n^m \, #h(2em) cal(R) = { \( i \, y \) : i in \[ m \] \, med y in \[ n \]^(\[ m \] \\ { i }) } \, #h(2em) M = \| cal(R) \| = m n^(m - 1) . $

Here $\[ n \]^S$ denotes coordinate tuples indexed by $S$. If $x in X$, then $x_(- i)$ is the tuple obtained by deleting coordinate $i$, and $x_(- i j)$ deletes both $i$ and $j$. A #emph[row] is one entry of an array $\( B_y^i \)_(\( i \, y \) in cal(R))$. We take these entries independently and uniformly from $D \( A \)$ and put

#[#set math.equation(numbering: n => "(3.1)")
 $ B \( x \) = sum_(i = 1)^m B_(x_(- i))^i in D \( A \) \, #h(2em) B \( a \) = \( B \( x \) \( a \) \)_(x in X) . $ <eq:face-array>]

All sums of affine functions or binary arrays are over $bb(F)_2$. The #emph[face code] is the subspace

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(C) = {z in bb(F)_2^X : z_x = sum_(i = 1)^m z_(x_(- i))^i upright(" for some ") z^i in bb(F)_2^(\[ n \]^(\[ m \] \\ { i }))} . $ <eq:face-code>]

In particular, $B \( a \) in cal(C)$ for every $a in A$. The code depends only on $m \, n$, even when the index $xi$ changes the alphabet.

For $u in bb(R)^X$ and $d in bb(R)^(cal(C))$ define a table on $cal(C)$ by

#[#set math.equation(numbering: n => "(3.3)")
 $ P_(u \, d) \( z \) = "sgn" (1 / sqrt(N) sum_(x in X) u_x \( - 1 \)^(z_x) + d_z) . $ <eq:inner-query>]

Use a fixed convention at zero. Its pullback is the Boolean query $P_(u \, d) \( B \) : a mapsto P_(u \, d) \( B \( a \) \)$. If $P$ is a table on $cal(C)$ and $z in cal(C)$, write $P^(z \, +)$ and $P^(z \, -)$ for the same table with its entry at $z$ forced to $1$ and $- 1$, respectively. Repeated codewords among the labels present no difficulty: this operation changes the query value at every label with that codeword.

Let $0 < eta lt.eq sigma < 1$ and $0 < delta < 1$. Draw independent standard Gaussian vectors $c \, g in bb(R)^X$ and $lambda in bb(R)^(cal(C))$, independently of $xi \, B$, and set

$ P = P_(c + sigma g \, eta lambda) . $

The following tests fail precisely when the two indicated proof answers are unequal. A denominator is a positive weight normalization; it need not itself be a failure probability.

+ Compare $f \( P_(c \, 0) \( B \) \)$ and $f \( P \( B \) \)$, with denominator $b_1 = 10 sigma$.
+ Independently for each row, replace $B_y^i$ by a fresh uniform element of $D \( A \)$ with probability $delta^2 \/ m$, obtaining $B'$. Compare $f \( P \( B \) \)$ and $f \( P \( B' \) \)$, using the same $c \, g \, lambda$ and the same table $P$ on both sides. The denominator is $b_2 = 10 \( delta + eta \)$.
+ Draw $z$ uniformly from $cal(C)$, independently of the other random choices, and compare $f \( P^(z \, +) \( B \) \)$ and $f \( P^(z \, -) \( B \) \)$. The denominator is $b_3 = \| cal(C) \|^(- 1)$.

Write $epsilon_j$ for the failure probability of test (T$j$). Although the tables are defined at ties, every unforced threshold here has a continuous Gaussian input of positive variance, so the choice at ties does not affect any of these probabilities.

#thm([Lemma 3.1.])[
  (Honest proof budgets).  #emph[For any choice of labels $a_xi in A_xi$, the evaluation proofs $f_xi \( P \) = P \( a_xi \)$ satisfy $epsilon_j lt.eq b_j$ for $j = 1 \, 2 \, 3$. In fact, 
$ epsilon_1 lt.eq 2 sigma \, #h(2em) epsilon_2 lt.eq 2 delta + 2 eta \, #h(2em) epsilon_3 = \| cal(C) \|^(- 1) . $

]
] <lem:honest>

#proof[
  Condition on the index and its label $a$. For any $z in cal(C)$, put
  $ v_z = N^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] \( - 1 \)^(z_x) #scale(x: 120%, y: 120%)[\)]_(x in X) \; #h(2em) lr(bar.v.double v_z bar.v.double)_(bb(R)^X) = 1 . $
  For the first test, conditional on $B$, the input $chevron.l c \, v_(B \( a \)) chevron.r$ is standard Gaussian, and its added perturbation $sigma chevron.l g \, v_(B \( a \)) chevron.r + eta lambda_(B \( a \))$ is an independent Gaussian of standard deviation $sqrt(sigma^2 + eta^2)$. The sign identity (2.4) gives disagreement probability
  $ 1 / pi arctan sqrt(sigma^2 + eta^2) lt.eq sqrt(sigma^2 + eta^2) lt.eq 2 sigma . $
  For the second test, let $D$ be the relative Hamming distance between $B \( a \)$ and $B' \( a \)$. For each $x$, the evaluation $B \( x \) \( a \)$ can change only if at least one of its $m$ rows was selected for resampling. A union bound therefore gives $bb(E) D lt.eq delta^2$. Consequently
  $ bb(E) lr(bar.v.double v_(B \( a \)) - v_(B' \( a \)) bar.v.double)_(bb(R)^X) = 2 bb(E) sqrt(D) lt.eq 2 delta . $
  Conditional on $B \, B'$, apply (2.4) to the isotropic Gaussian $c + sigma g$, initially omitting the table perturbations. Its two signs disagree with probability at most $lr(bar.v.double v_(B \( a \)) - v_(B' \( a \)) bar.v.double)$. Restoring each perturbation $eta lambda_(B \( a \))$ or $eta lambda_(B' \( a \))$ changes the corresponding sign with probability at most $eta \/ sqrt(1 + sigma^2) lt.eq eta$. The union bound gives $epsilon_2 lt.eq 2 delta + 2 eta$. Independence of the two table perturbations is not needed, so this reasoning also covers $B \( a \) = B' \( a \)$.
  In the third test, the two evaluation answers differ if and only if $z = B \( a \)$. Uniform sampling of $z$ gives exactly $\| cal(C) \|^(- 1)$. All bounds hold conditional on the chosen label and can be averaged over $xi$. ◻
]

=== 3.2 The decoding statement <the-decoding-statement>

For every folded proof define

#[#set math.equation(numbering: n => "(3.4)")
 $ F_B \( c \) = bb(E)_(g \, lambda) f \( P_(c + sigma g \, eta lambda) \( B \) \) \, #h(2em) h_x \( B \, c \) = sqrt(N) thin partial_(c_x) F_B \( c \) . $ <eq:smoothed-gradient>]

These derivatives exist everywhere by Gaussian convolution, as also verified below. For real arrays on $X$ our conventions are

$ chevron.l v \, w chevron.r_x = 1 / N sum_(x in X) v_x w_x \, #h(2em) lr(bar.v.double v bar.v.double)_(2 \, x)^2 = 1 / N sum_(x in X) \| v_x \|^2 . $

If a row $\( i \, x_(- i) \)$ is removed, the remaining rows are its #emph[background]. For any background write $B \[ B_(x_(- i))^i arrow.l b \]$ for the array with that row filled by $b in D \( A \)$.

#thm([Theorem 3.2.])[
  (Inner decoding).  #emph[For every rational $J gt.eq 1$, there are effectively selectable integers $m \, n gt.eq 2$ and positive rational constants $sigma \, delta \, eta \, p \, theta < 1$, with $eta lt.eq sigma$, depending only on $J$, with the following property. For any finite weighted family of nonempty affine alphabets and folded bit proofs, suppose 
$ epsilon_j lt.eq J b_j #h(2em) \( j = 1 \, 2 \, 3 \) . $

 Draw $xi$, a standard Gaussian $c in bb(R)^X$, independent uniform $x in X$ and $i in \[ m \]$, and all background rows independently and uniformly in $D \( A_xi \)$. With probability at least $p$, the function 
$ b mapsto h_x \( B \[ B_(x_(- i))^i arrow.l b \] \, c \) $

 has a Fourier coefficient of absolute value at least $theta$ at an odd frequency of $D \( A_xi \)$. Equivalently, the event is 
#[#set math.equation(numbering: n => "(3.5)")
 $ max_(alpha in D \( A_xi \)^(*) : alpha \( 1 \) = 1) lr(|bb(E)_(b in D \( A_xi \)) h_x \( B \[ B_(x_(- i))^i arrow.l b \] \, c \) \( - 1 \)^(alpha \( b \))|) gt.eq theta . $ <eq:inner-atom-event>]

 For every folded proof, without any test assumption, one has pointwise 
#[#set math.equation(numbering: n => "(3.6)")
 $ lr(bar.v.double h \( B \, c \) bar.v.double)_(2 \, x) lt.eq sigma^(- 1) \, #h(2em) \| h_x \( B \, c \) \| lt.eq sqrt(N) \/ sigma . $ <eq:gradient-bounds>]

]
] <thm:inner>

The rest of this Section proves a low-degree correlation estimate. Section 4 turns that estimate into (3.5); the parameter choices in Section 4.6 complete the proof of Theorem 7.

=== 3.3 Quantitative smoothing and degree projections <quantitative-smoothing-and-degree-projections>

For the rest of this Section fix the following parameters, before choosing $m \, n$:

#[#set math.equation(numbering: n => "(3.7)")
 $ sigma = frac(1, 2560 J) \, #h(2em) delta = eta = frac(sigma^2, 2560 J) \, #h(2em) R = ceil.l delta^(- 2) ceil.r \, #h(2em) T = ⌈frac(32 J, eta sigma^4)⌉ . $ <eq:smoothing-parameters>]

Choose an integer $s gt.eq 1$ such that

#[#set math.equation(numbering: n => "(3.8)")
 $ s + 2 > sigma^(- 2) \, #h(2em) \( s + 2 \) \( 1 + sigma^2 \)^(- \( s + 2 \)) lt.eq 1 / 16 . $ <eq:hermite-cutoff-choice>]

Such an $s$ is found by increasing integers and testing rational inequalities. The sequence $k \( 1 + sigma^2 \)^(- k)$ tends to zero, and is decreasing once $k > sigma^(- 2)$, since the ratio of its next term to its current term is $\( 1 + 1 \/ k \) \/ \( 1 + sigma^2 \) < 1$. Thus these choices are effective and imply

#[#set math.equation(numbering: n => "(3.9)")
 $ sup_(k gt.eq s + 2) k \( 1 + sigma^2 \)^(- k) lt.eq 1 / 16 . $ <eq:hermite-tail-choice>]

All constants in (3.7)–(3.8) are independent of the alphabet, its proof, and the integers $m \, n$.

The Fourier degree of a function of $B$ is its degree in the independent #emph[rows]. More precisely, a product character is

$ chi_(bold(alpha)) \( B \) = product_(\( i \, y \) in cal(R)) \( - 1 \)^(alpha_y^i \( B_y^i \)) \, #h(2em) alpha_y^i in D \( A \)^(*) \, $

and its degree is the number of nonzero $alpha_y^i$. This counts nonzero rows, regardless of the dimension of each row’s vector space. Gaussian degree means total degree $\| I \|$ in the product Hermite basis $psi_I \( c \)$. Conditional on each $xi$, let $Pi_B$ project onto Fourier row degree at most $R m$, and let $Pi_c$ project onto Hermite degree at most $s$. They act on different variables and commute. Define

#[#set math.equation(numbering: n => "(3.10)")
 $ L = Pi_B Pi_c h . $ <eq:low-degree-field>]

The definition is coordinatewise in $x$. Both projections also act orthogonally in the Hilbert space averaged over the arbitrary weights of $xi$.

#thm([Lemma 3.3.])[
  (Gradient energy and the two cutoffs).  #emph[Assume $epsilon_1 lt.eq J b_1$ and $epsilon_2 lt.eq J b_2$, and use (3.7)–(3.8). For every $m \, n gt.eq 2$, 
#[#set math.equation(numbering: n => "(3.11)")
 $ bb(E) lr(bar.v.double h bar.v.double)_(2 \, x)^2 & gt.eq 3 / 4 \,\
bb(E) lr(bar.v.double \( I - Pi_c \) h bar.v.double)_(2 \, x)^2 & lt.eq 1 / 16 \,\
bb(E) lr(bar.v.double \( I - Pi_B \) h bar.v.double)_(2 \, x)^2 & lt.eq 1 / 32 \,\
bb(E) chevron.l L \, h chevron.r_x = bb(E) lr(bar.v.double L bar.v.double)_(2 \, x)^2 & gt.eq 1 / 2 \, #h(2em) bb(E) lr(bar.v.double L bar.v.double)_(2 \, x)^2 lt.eq sigma^(- 2) . $ <eq:gradient-lower>]

]
] <lem:smoothing-cutoffs>

#proof[
  Set $Q_B \( u \) = bb(E)_lambda f \( P_(u \, eta lambda) \( B \) \)$. This is a bounded measurable function of $u$: it is obtained from finitely many threshold signs followed by a function on a finite set. Gaussian convolution and (2.3) give the identity
  #[#set math.equation(numbering: n => "(3.12)")
   $ h_x \( B \, c \) = sqrt(N) / sigma bb(E)_(g \, lambda) g_x f \( P_(c + sigma g \, eta lambda) \( B \) \) . $ <eq:h-convolution>]
  For fixed $xi \, B \, c$, the functions $g_x$ form an orthonormal family in the joint probability space of $\( g \, lambda \)$. Bessel’s inequality gives
  $ lr(bar.v.double h bar.v.double)_(2 \, x)^2 = 1 / sigma^2 sum_x lr(|bb(E)_(g \, lambda) g_x f \( P \( B \) \)|)^2 lt.eq 1 / sigma^2 bb(E)_(g \, lambda) \| f \( P \( B \) \) \|^2 = sigma^(- 2) . $
  The individual-coordinate bound in (3.6) follows as well. In particular all gradients used here are square-integrable.
  Negating $u$ and changing $lambda$ to $- lambda$ negates every table entry almost surely. Indeed, conditional on $u$, each entry has an independent continuous perturbation of variance $eta^2 > 0$. Folding therefore implies $Q_B \( - u \) = - Q_B \( u \)$. Symmetry of $g$ gives $F_B \( - c \) = - F_B \( c \)$, so $bb(E)_c F_B \( c \) = 0$ for every $xi \, B$. Let $f_0 \( B \, c \) = f \( P_(c \, 0) \( B \) \)$, which has absolute value one. Jensen’s inequality and the first test give
  $ bb(E) \| F_B \( c \) - f_0 \( B \, c \) \|^2 lt.eq bb(E)_(xi \, B \, c \, g \, lambda) \| f \( P \( B \) \) - f_0 \( B \, c \) \|^2 = 4 epsilon_1 lt.eq 40 J sigma lt.eq 1 / 64 . $
  The triangle inequality in the joint $L^2$ space consequently gives $lr(bar.v.double F bar.v.double)_2 gt.eq 1 - 1 \/ 8 = 7 \/ 8$ and $bb(E) F^2 gt.eq 49 \/ 64 > 3 \/ 4$. By the mean-zero Gaussian energy identity (2.2),
  $ bb(E) lr(bar.v.double h bar.v.double)_(2 \, x)^2 = bb(E) sum_x \| partial_(c_x) F_B \( c \) \|^2 gt.eq bb(E) \| F_B \( c \) \|^2 gt.eq 3 / 4 \, $
  proving (3.11). This argument only uses the averaged failure bound.
  For the Gaussian cutoff put
  $ rho = \( 1 + sigma^2 \)^(- 1 \/ 2) \, #h(2em) G_B \( v \) = Q_B \( sqrt(1 + sigma^2) thin v \) . $
  Then $F_B = T_rho G_B$ and $\| G_B \| lt.eq 1$. If $G_B = sum_I a_I \( B \) psi_I$, its noise average has coefficients $rho^(\| I \|) a_I \( B \)$. For precision about the derivative, Gaussian integration by parts and the Hermite recurrence give
  $ integral partial_(c_x) F_B \( c \) psi_J \( c \) thin upright(d) gamma_N \( c \) = sqrt(J_x + 1) integral F_B \( c \) psi_(J + e_x) \( c \) thin upright(d) gamma_N \( c \) . $
  Integration by parts is legitimate because $F_B$ and its first derivatives are bounded, and a Gaussian times any polynomial has integrable tails. This identifies the actual derivative coefficients with those obtained by formally differentiating the Hermite expansion. Parseval and $sum_I \| a_I \( B \) \|^2 lt.eq 1$ now yield, for every $xi \, B$,
  $ bb(E)_c lr(bar.v.double \( I - Pi_c \) h bar.v.double)_(2 \, x)^2 = sum_(\| I \| gt.eq s + 2) \| I \| rho^(2 \| I \|) \| a_I \( B \) \|^2 lt.eq sup_(k gt.eq s + 2) k \( 1 + sigma^2 \)^(- k) lt.eq 1 / 16 . $
  The shift from $s + 1$ to $s + 2$ occurs because differentiating a degree $k$ Hermite polynomial gives degree $k - 1$. This proves (3.11) uniformly in $N$.
  For the row cutoff, apply Bessel’s inequality to the difference of the two representations (3.12), with the same $g \, lambda$:
  #[#set math.equation(numbering: n => "(3.13)")
   $ bb(E) lr(bar.v.double h \( B \, c \) - h \( B' \, c \) bar.v.double)_(2 \, x)^2 & lt.eq sigma^(- 2) bb(E) \| f \( P \( B \) \) - f \( P \( B' \) \) \|^2\
 & = 4 epsilon_2 \/ sigma^2 lt.eq 4 J b_2 \/ sigma^2 = 1 / 32 . $ <eq:gradient-row-comparison>]
  Write $a = delta^2 \/ m$. Conditional expectation over the row-resampling channel multiplies a constant character on one row by $1$, and a nonconstant character by $1 - a$: on resampling, its uniform average is zero. Independence of rows therefore gives eigenvalue $\( 1 - a \)^k$ for row degree $k$. Stationarity of the channel and Parseval show that a degree-$k$ squared Fourier norm contributes
  $ 2 #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - a \)^k #scale(x: 120%, y: 120%)[\)] $
  times that norm to the left side of (3.13). If $k > R m$, then $k a > R delta^2 gt.eq 1$. The elementary inequality $\( 1 - a \)^k lt.eq \( 1 + k a \)^(- 1)$ follows by applying the binomial inequality to $\( 1 - a \)^(- k)$, using $\( 1 - a \)^(- 1) gt.eq 1 + a$. Hence $\( 1 - a \)^k < 1 \/ 2$, and the displayed multiplier exceeds one. The total squared Fourier norm of row degrees $k > R m$ is at most $1 \/ 32$, proving (3.11).
  Finally, commuting orthogonal projections give $bb(E) chevron.l L \, h chevron.r_x = bb(E) lr(bar.v.double L bar.v.double)_(2 \, x)^2$. Their discarded parts satisfy
  $ bb(E) lr(bar.v.double h - L bar.v.double)_(2 \, x)^2 lt.eq bb(E) lr(bar.v.double \( I - Pi_B \) h bar.v.double)_(2 \, x)^2 + bb(E) lr(bar.v.double \( I - Pi_c \) h bar.v.double)_(2 \, x)^2 lt.eq 1 / 32 + 1 / 16 . $
  Combining this with (3.11) gives $bb(E) lr(bar.v.double L bar.v.double)_(2 \, x)^2 gt.eq 21 \/ 32 > 1 \/ 2$. Orthogonal projection and (3.6) give the upper bound in (3.11). ◻
]

=== 3.4 Truth-table differentiation and a product-of-faces correlation <truth-table-differentiation-and-a-product-of-faces-correlation>

For a real array $v$ on $X$, define

#[#set math.equation(numbering: n => "(3.14)")
 $ frak(d)_X \( v \) = max_(z in cal(C)) lr(|1 / N sum_(x in X) v_x \( - 1 \)^(z_x)|) = max_(z^1 \, dots.h \, z^m) lr(|bb(E)_(x in X) v_x product_(i = 1)^m \( - 1 \)^(z_(x_(- i))^i)|) . $ <eq:face-correlation>]

The second maximum is over the binary face arrays appearing in (3.2); equality of the maxima follows from that definition. In particular $frak(d)_X \( v \) lt.eq lr(bar.v.double v bar.v.double)_(2 \, x)$.

#thm([Proposition 3.4.])[
  (Low-degree correlation).  #emph[Fix $J$ and the constants (3.7)–(3.8). For every $m \, n gt.eq 2$ and every finite weighted family of folded proofs satisfying $epsilon_j lt.eq J b_j$ for $j = 1 \, 2 \, 3$, the field $L$ from (3.10) has Fourier row degree at most $R m$ and Gaussian degree at most $s$, satisfies (3.11), and obeys 
#[#set math.equation(numbering: n => "(3.15)")
 $ bb(E) frak(d)_X \( L \) gt.eq frac(1, 4 T) . $ <eq:correlation-lower>]

 All constants preceding $m \, n$ are uniform in their values and in the affine alphabets.]
] <prop:correlation>

#proof[
  It remains to prove (3.15). For fixed $B$ define the bounded function on $bb(R)^(cal(C))$
  $ Phi_B \( t \) = f #scale(x: 120%, y: 120%)[\(] a mapsto "sgn" \( t_(B \( a \)) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) Psi_B \( t \) = bb(E)_lambda Phi_B \( t + eta lambda \) . $
  Gaussian differentiation in the independent truth-table coordinates gives
  $ partial_(t_z) Psi_B \( t \) = eta^(- 1) bb(E)_lambda lambda_z Phi_B \( t + eta lambda \) . $
  In (3.4), the input to this function is $t_z = N^(- 1 \/ 2) sum_x \( c_x + sigma g_x \) \( - 1 \)^(z_x)$. The chain rule therefore gives the exact representation
  #[#set math.equation(numbering: n => "(3.16)")
   $ h_x \( B \, c \) = sum_(z in cal(C)) mu_z \( B \, c \) \( - 1 \)^(z_x) \, #h(2em) mu_z \( B \, c \) = eta^(- 1) bb(E)_(g \, lambda) lambda_z f \( P \( B \) \) . $ <eq:truth-table-representation>]
  There are finitely many table coordinates, and $\| partial_(t_z) Psi_B \| lt.eq eta^(- 1) bb(E) \| lambda_z \|$ uniformly in $t$, so differentiation may pass through the expectation over $g$.
  We bound the absolute coefficients by the third bit test. Condition on $xi \, B \, c \, g$ and on all coordinates of $lambda$ other than $lambda_z$. The two numbers
  $ f_(+) = f \( P^(z \, +) \( B \) \) \, #h(2em) f_(-) = f \( P^(z \, -) \( B \) \) $
  do not depend on $lambda_z$. If $t_z = N^(- 1 \/ 2) sum_x \( c_x + sigma g_x \) \( - 1 \)^(z_x)$ and $phi \( u \) = \( 2 pi \)^(- 1 \/ 2) e^(- u^2 \/ 2)$, elementary integration of the one-dimensional Gaussian density yields
  $ bb(E)_(lambda_z) lambda_z f \( P \( B \) \) & = f_(+) integral_(- t_z \/ eta)^oo u phi \( u \) thin upright(d) u + f_(-) integral_(- oo)^(- t_z \/ eta) u phi \( u \) thin upright(d) u\
 & = \( f_(+) - f_(-) \) phi \( t_z \/ eta \) . $
  Its absolute value is at most $2 upright(bold(1))_({ f_(+) eq.not f_(-) })$. This calculation depends only on the two possible table values at $z$; it does not require $B : A arrow.r cal(C)$ to be injective. Taking absolute values after the other averages and summing over $z$ gives, with $W = sum_(z in cal(C)) \| mu_z \|$,
  #[#set math.equation(numbering: n => "(3.17)")
   $ bb(E) W lt.eq 2 / eta sum_(z in cal(C)) bb(P) \[ f \( P^(z \, +) \( B \) \) eq.not f \( P^(z \, -) \( B \) \) \] = frac(2 \| cal(C) \|, eta) epsilon_3 lt.eq frac(2 J, eta) . $ <eq:truth-table-mass>]
  Thus (3.16) places $h$ in $W$ times the convex hull of the signed codeword arrays ${ plus.minus \( \( - 1 \)^(z_x) \)_(x in X) : z in cal(C) }$ (with $h = 0$ if $W = 0$). For every realization it follows that
  #[#set math.equation(numbering: n => "(3.18)")
   $ \| chevron.l L \, h chevron.r_x \| lt.eq W frak(d)_X \( L \) . $ <eq:convex-hull-correlation>]
  The large-$W$ contribution can be controlled without a pointwise bound on $L$. By (3.6), Cauchy–Schwarz, Markov’s inequality, and (3.11),
  $ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ W > T }) \| chevron.l L \, h chevron.r_x \| #scale(x: 120%, y: 120%)[\]] & lt.eq sigma^(- 1) bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ W > T }) lr(bar.v.double L bar.v.double)_(2 \, x) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq sigma^(- 1) \( bb(E) lr(bar.v.double L bar.v.double)_(2 \, x)^2 \)^(1 \/ 2) bb(P) \[ W > T \]^(1 \/ 2)\
 & lt.eq sigma^(- 2) sqrt(frac(2 J, eta T)) lt.eq 1 / 4 . $
  Since $bb(E) chevron.l L \, h chevron.r_x gt.eq 1 \/ 2$, we obtain
  $ 1 / 4 lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ W lt.eq T }) chevron.l L \, h chevron.r_x #scale(x: 120%, y: 120%)[\]] lt.eq T bb(E) frak(d)_X \( L \) \, $
  which is (3.15). The low-degree and energy claims have already been proved in Lemma 8. ◻
]

At this stage $m \, n$ remain free. The next Section chooses $m$ from $R \, s$, then a localization scale and $n$, and finally $p \, theta$. It uses (3.15) to prove the asserted one-row Fourier atom. In particular, the possibly large truth-table truncation constant $T$ has been chosen before any of these later parameters.

== 4 From face correlation to an odd row coefficient <sec:inner-box>

Proposition 9 gives a low-degree field $L$ with $bb(E) frak(d)_X \( L \) gt.eq 1 \/ \( 4 T \)$. We will show that this correlation forces a large odd Fourier coefficient in one row of the original field $h$, as required by Theorem 7. We first choose $m$ large enough to partition the Fourier–Hermite terms of $L_x$: each nonzero term either has positive degree in $c_x$, or carries equal odd frequencies in two rows $B_(x_(- i))^i$ and $B_(x_(- j))^j$. Equal frequencies turn the two row factors into a character of their sum. Restriction to a random smaller box will then separate the other variables, allowing the two kinds of terms to be estimated by centering and by a four-corner Fourier identity.

Throughout this Section, $sigma \, delta \, eta \, R \, s \, T$ are the constants of Proposition 9, already chosen independently of $m \, n$ and of the affine alphabet. All expectations include the weighted proof index $xi$, unless explicitly conditioned on it. We use only averaged test bounds; individual indices need not satisfy those bounds.

Let

$ cal(R) = { \( i \, y \) : i in \[ m \] \, med y in \[ n \]^(\[ m \] \\ { i }) } \, #h(2em) M = \| cal(R) \| = m n^(m - 1) $

be the set of rows. For a family of frequencies $bold(alpha) = \( alpha_r : r in cal(R) \)$, write $chi_(bold(alpha)) \( B \) = product_r chi_(alpha_r) \( B_r \)$ and $S_i = { y : alpha_y^i eq.not 0 }$. Thus $S = \( S_i \)_i$ is the exact row mask, and $\| S \| = sum_i \| S_i \|$ is the row degree. At a fixed proof index, the Fourier–Hermite expansion of the projected field is

#[#set math.equation(numbering: n => "(4.1)")
 $ L_x \( B \, c \) = sum_(\| I \| lt.eq s\
\| S \( bold(alpha) \) \| lt.eq R m) hat(h)_x \( bold(alpha) \, I \) chi_(bold(alpha)) \( B \) psi_I \( c \) . $ <eq:box-expansion>]

This is a finite sum. Coefficients and the row frequency spaces may depend on $xi$; the sets of row positions and Hermite indices do not. We select components using only $x \, I \, S$. Counting row masks and Hermite indices, without counting the possible values of the nonzero frequencies, will keep the coefficient estimates independent of the alphabet.

=== 4.1 Gauge identities and a partition selected by masks <gauge-identities-and-a-partition-selected-by-masks>

We use two symmetries of $h$ to find these equal, odd local frequencies. First fix distinct axes $i \, j$ and a tuple $q in \[ n \]^(\[ m \] \\ { i \, j })$. For $a in D \( A \)$, add $a$ to every row $B_y^i$ with $y_(- j) = q$ and every row $B_y^j$ with $y_(- i) = q$. Call the resulting array $B^(\( a \))$. At a point $u in X$, either both additions occur or neither occurs, so $B^(\( a \)) \( u \) = B \( u \)$. Consequently $h_x \( B^(\( a \)) \, c \) = h_x \( B \, c \)$. Orthogonality, or a change of variables in the Fourier coefficient, shows that every nonzero coefficient satisfies

#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(y : y_(- j) = q) alpha_y^i + sum_(y : y_(- i) = q) alpha_y^j = 0 #h(2em) upright("in ") D \( A \)^(*) . $ <eq:cylinder-gauge>]

Indeed, otherwise some $a$ makes the character change sign while the function remains unchanged.

For the second symmetry fix a row $r = \( i \, v \)$ and put $k_u = upright(bold(1))_({ u_(- i) = v })$. This is a codeword in $cal(C)$. Let $B + 1_r$ denote addition of the constant-one affine function in this row, and let $D_k c = \( \( - 1 \)^(k_u) c_u \)_(u in X)$. Translation of a codeword argument by $k$ gives the exact identity

$ P_(c + sigma g \, eta lambda) \( z + k \) = P_(D_k c + sigma D_k g \, eta lambda') \( z \) \, #h(2em) lambda'_z = lambda_(z + k) . $

The Gaussian vectors $D_k g$ and $lambda'$ have the original joint law. The proof is a function of the resulting Boolean table on $A$, so

$ F_(B + 1_r) \( c \) = F_B \( D_k c \) \, #h(2em) h_x \( B + 1_r \, c \) = \( - 1 \)^(k_x) h_x \( B \, D_k c \) . $

The derivative in the second equality supplies its displayed sign. Since $psi_I \( D_k c \) = \( - 1 \)^(sum_u k_u I_u) psi_I \( c \)$, every nonzero coefficient also satisfies

#[#set math.equation(numbering: n => "(4.3)")
 $ alpha_r \( 1 \) equiv k_x + sum_(u in X) k_u I_u med \( mod med 2 \) . $ <eq:row-gauge>]

These identities hold separately for every proof index and for every alphabet.

Choose $m > s + 1$ so large that

#[#set math.equation(numbering: n => "(4.4)")
 $ binom(m - s, 2) > R m . $ <eq:choose-m>]

Partition the terms of $L_x$ as follows. Those with $I_x > 0$ form class $0$. For each remaining pair $\( I \, S \)$, choose two axes $i < j$ subject to:

+ No $u$ with $I_u > 0$ satisfies $u_(- i) = x_(- i)$ or $u_(- j) = x_(- j)$.
+ Among rows of $S_i$ above $x_(- i j)$, the only permitted row is $x_(- i)$; among rows of $S_j$ above $x_(- i j)$, the only permitted row is $x_(- j)$.

Such a pair exists. Since $I_x = 0$, each positive Hermite support point differs from $x$. It can agree with $x$ after deleting an axis for at most one axis, so at most $s$ axes are forbidden by (i). A nonlocal row $y in S_i$, $y eq.not x_(- i)$, obstructs (ii) for at most one other axis $j$: its coordinates must differ from $x_(- i)$ only at $j$. Thus all masks together forbid at most $R m$ unordered pairs. Inequality (4.4) leaves an admissible pair.

Fix an ordering of the pairs and choose the first admissible one. This rule uses only $x \, I \, S$, never the values of the nonzero frequencies. Assign the entire exact-mask/Hermite component to that pair class. For a nonzero term in class $\( i \, j \)$, apply (4.2) with $q = x_(- i j)$. Condition (ii) leaves only the two local frequencies, so they are equal. Apply (4.3) to $r = \( i \, x_(- i) \)$. Here $k_x = 1$ and condition (i) makes the Hermite sum zero. Therefore

#[#set math.equation(numbering: n => "(4.5)")
 $ alpha_(x_(- i))^i = alpha_(x_(- j))^j \, #h(2em) alpha_(x_(- i))^i \( 1 \) = 1 . $ <eq:matching-odd>]

In particular both local rows really occur in the mask. Equality and oddness are consequences of the two symmetries, rather than extra conditions used to filter individual frequencies.

Write $L^a$ for the class arrays, with $a in cal(K) = { 0 } union { \( i \, j \) : 1 lt.eq i < j lt.eq m }$, and set

#[#set math.equation(numbering: n => "(4.6)")
 $ d_0 = frac(1, 4 T \( 1 + binom(m, 2) \)) . $ <eq:class-target>]

By subadditivity of $frak(d)_X$ and Proposition 9,

#[#set math.equation(numbering: n => "(4.7)")
 $ frac(1, 4 T) lt.eq bb(E) frak(d)_X \( L \) lt.eq sum_(a in cal(K)) bb(E) frak(d)_X \( L^a \) . $ <eq:class-correlation-lower>]

It will suffice to show, under failure of the asserted row-atom conclusion, that every summand is strictly less than $d_0$.

=== 4.2 Localization to a random subbox <localization-to-a-random-subbox>

Let $2 lt.eq ell < n$, with both integers to be chosen later. Independently on each axis choose a uniform $ell$-element subset $Y_i subset \[ n \]$, and put $Y = product_i Y_i$. The average of a uniform point in $Y$, over this random choice, is uniform in $X$. For every deterministic array $v$,

#[#set math.equation(numbering: n => "(4.8)")
 $ frak(d)_X \( v \) lt.eq bb(E)_Y frak(d)_Y \( v \|_Y \) . $ <eq:box-restriction>]

To prove this, choose face signs attaining $frak(d)_X \( v \)$, restrict them to $Y$, and use that the original correlation is the average of their restricted correlations. The absolute value of the average is at most the average of the absolute values. This is a pointwise assertion and allows the maximizing face signs to depend on the full array.

For $x in Y$, retain from $L_x^a$ only those terms whose positive Hermite support on $Y$ is contained in ${ x }$ and whose masked rows on the faces of $Y$ are contained in ${ \( r \, x_(- r) \) : r in \[ m \] }$. Denote the retained field by $v_x^a$. Equivalently, $v_x^a = Q_x^(a \, Y) h_x$, where $Q_x^(a \, Y)$ is an orthogonal projection selecting complete exact-mask/Hermite components. In particular its choice depends only on $a \, Y \, x \, I \, S$.

Conditional on a uniform point of $Y$ being $x$, the subsets $Y_i$ are independent uniform $ell$-subsets containing $x_i$. For a fixed point $u eq.not x$, membership in $Y$ requires that at least one particular value other than $x_i$ be selected, so its conditional probability is at most $\( ell - 1 \) \/ \( n - 1 \)$. The same assertion holds for a face tuple different from the corresponding face of $x$. A term has at most $s$ positive Hermite support positions and $R m$ masked rows. A union bound, followed by orthogonality for fixed $x \, Y$, therefore gives

#[#set math.equation(numbering: n => "(4.9)")
 $ bb(E) bb(E)_(x in Y) \| L_x^a - v_x^a \|^2 & lt.eq sigma^(- 2) \( s + R m \) frac(ell, n - 1) \,\
bb(E) bb(E)_(x in Y) \| v_x^a \|^2 & lt.eq sigma^(- 2) . $ <eq:localization-l2>]

For the first inequality one can sum the squared coefficients of $L_x^a$ multiplied by their conditional removal probabilities; their total, averaged over uniform $x$ and $xi$, is at most $sigma^(- 2)$. For the second, each retained projection contracts the squared norm of $h_x$, and then one averages over $x \, Y \, xi$. Thus the expected normalized $L^1$ loss in localization is at most

#[#set math.equation(numbering: n => "(4.10)")
 $ e_(upright("loc")) = sigma^(- 1) sqrt(\( s + R m \) frac(ell, n - 1)) . $ <eq:localization-loss>]

No pointwise bound on a retained field is needed here.

There are two useful conditional descriptions. For class $0$, condition on $xi \, Y$, all rows $B$, and all Gaussians outside $Y$. Each $v_x^0$ is then a function of $c_x$ alone, and its conditional mean is zero: every retained Hermite term has $I_x > 0$ and no other positive index on $Y$.

For class $\( i \, j \)$, condition on $xi \, Y$, all Gaussians, all tables other than $B^i \, B^j$, and the rows of those two tables outside the faces of $Y$. Call this background $cal(F)_(i j \, Y)$. The remaining rows of these two tables are still independent and uniform. Localization and (4.5) give, for each $x in Y$, a function $V_x : D \( A \) arrow.r bb(R)$, determined by this background, such that

#[#set math.equation(numbering: n => "(4.11)")
 $ v_x^(i j) = V_x \( B_(x_(- i))^i + B_(x_(- j))^j \) \, #h(2em) V_x \( b \) = sum_(alpha : alpha \( 1 \) = 1) hat(V)_x \( alpha \) chi_alpha \( b \) . $ <eq:local-sum-slice>]

Indeed, a retained term has no other on-subbox row in either table, and its two local character factors multiply to the character of their sum. Thus $V_x$ is independent of the sampled values of every on-subbox row in tables $i \, j$. The slice norm $parallel V_x parallel_2$ and its maximum Fourier coefficient are functions of $cal(F)_(i j \, Y)$ as well. Integrating the two local rows makes their sum uniform, and hence (4.9) says

#[#set math.equation(numbering: n => "(4.12)")
 $ bb(E) bb(E)_(x in Y) parallel V_x parallel_2^2 lt.eq sigma^(- 2) . $ <eq:slice-energy>]

=== 4.3 A coefficient estimate with no dependence on the alphabet <a-coefficient-estimate-with-no-dependence-on-the-alphabet>

The next estimate connects the projected slices to the original field. For an axis $i$ and point $x$, put $r = \( i \, x_(- i) \)$ and define the original maximum odd row coefficient by

$ a_(x \, i) \( B_(eq.not r) \, c \) = max_(alpha : alpha \( 1 \) = 1) lr(|bb(E)_(b in D \( A \)) h_x \( B \[ r arrow.l b \] \, c \) chi_alpha \( b \)|) . $

This is a function only of the indicated background and the proof index. Its pointwise upper bound is $sqrt(N) \/ sigma$.

#thm([Lemma 4.1.])[
  (Uniform transfer through the selected projection).  #emph[Let $Q_x^Y$ select any collection of complete exact-mask/Hermite components with $\| I \| lt.eq s$, using only $x \, Y \, I \, S$. For a fixed axis $i$ let $q_(x \, i)^Y$ be the maximum odd row coefficient of $Q_x^Y h_x$ in $r = \( i \, x_(- i) \)$, with the other rows and $c$ held fixed. Then 
#[#set math.equation(numbering: n => "(4.13)")
 $ bb(E) bb(E)_(x in Y) q_(x \, i)^Y lt.eq C_0 (bb(E) bb(E)_(x in X) a_(x \, i)^2)^(1 \/ 2) \, #h(2em) C_0 = 4^M binom(N + s, s) . $ <eq:projector-maximum>]

 The estimate is valid for every weighted distribution of proof indices.]
] <lem:projected-row-atom>

#proof[
  For a row $t$, write $E_t$ for averaging that row uniformly. The projection onto an exact mask $S subset.eq cal(R)$ is
  $ P_S = product_(t in S) \( "Id" - E_t \) product_(t in.not S) E_t . $
  The projection onto the Hermite index $I$ is
  $ H_I u \( B \, c \) = psi_I \( c \) bb(E)_(c') psi_I \( c' \) u \( B \, c' \) . $
  There are $2^M$ masks and $binom(N + s, s)$ multi-indices with $\| I \| lt.eq s$. Thus $Q_x^Y$ is a sum of at most their product of operators $P_S H_I$.
  Taking a Fourier coefficient in the distinguished row $r$ commutes with all the other row averages. If $r in.not S$, the average $E_r$ annihilates every odd coefficient. If $r in S$, the factor $"Id" - E_r$ leaves such a coefficient unchanged. Expand the remaining factors $"Id" - E_t$ into signed averages; there are at most $2^M$ terms. Each term averages some of the other rows without changing the distinguished frequency. For one such term, its maximum odd coefficient is consequently bounded by
  $ \| psi_I \( c \) \| thin bb(E)_(c' \, thin upright("averaged rows")) \| psi_I \( c' \) \| thin a_(x \, i) \( B'_(eq.not r) \, c' \) . $
  This follows by moving the maximum inside the absolute-value integral; no sum over row frequencies is introduced. At fixed $xi \, x$, average the output $c$ and all the other output rows. Uniform row averages preserve the product measure, $bb(E) \| psi_I \( c \) \| lt.eq 1$, and Cauchy–Schwarz gives
  $ bb(E)_(B_(eq.not r) \, c') \| psi_I \( c' \) \| a_(x \, i) \( B_(eq.not r) \, c' \) lt.eq (bb(E)_(B_(eq.not r) \, c') a_(x \, i)^2)^(1 \/ 2) . $
  The bound is independent of $I \, S \, Y$. Summing at most $4^M binom(N + s, s)$ expanded terms proves the corresponding bound at fixed $xi \, x \, Y$. Finally apply Cauchy–Schwarz to the probability measure on $xi \, Y \, x in Y$, and use the uniform marginal of $x$. This proves (4.13), including arbitrary weights on $xi$. Only counts of positions, masks and Hermite indices entered the constant. ◻
]

Suppose, for a contradiction, that the row-atom conclusion in Theorem 7 fails for positive constants $p \, theta$ to be chosen at the end. In this notation the failed assertion is

$ bb(P)_(xi \, x \, i \, B_(eq.not \( i \, x_(- i) \)) \, c) \[ a_(x \, i) gt.eq theta \] < p . $

Since $i$ is uniform, for each fixed axis $i$ this event has probability less than $m p$. The pointwise bound on $a_(x \, i)$ gives

#[#set math.equation(numbering: n => "(4.14)")
 $ bb(E) bb(E)_(x in X) a_(x \, i)^2 lt.eq D \, #h(2em) D = theta^2 + frac(m p N, sigma^2) . $ <eq:original-atom-square>]

This is only an averaged estimate in $x \, xi$, which is exactly the estimate required in Lemma 10.

For a retained pair class use $Q_x^Y = Q_x^(i j \, Y)$ and the distinguished axis $i$. From (4.11), its coefficient in the row $B_(x_(- i))^i$, when the other local row has value $b'$, is $hat(V)_x \( alpha \) chi_alpha \( b' \)$. The maximum magnitude is therefore precisely $q_x = max_(alpha : alpha \( 1 \) = 1) \| hat(V)_x \( alpha \) \|$, independently of $b'$ or any other remaining row. Equations (4.13)–(4.14) imply

#[#set math.equation(numbering: n => "(4.15)")
 $ bb(E) bb(E)_(x in Y) q_x lt.eq C_0 sqrt(D) \, #h(2em) bb(P) \[ q_x > gamma \] lt.eq frac(C_0 sqrt(D), gamma) $ <eq:slice-atom-probability>]

for every $gamma > 0$. The probability here is over a uniform point of $Y$ and its slice background.

=== 4.4 Bounded arrays and background-measurable slice operations <bounded-arrays-and-background-measurable-slice-operations>

For $A_0 > 0$, let $"clip"_(A_0) \( z \) = max \( - A_0 \, min \( z \, A_0 \) \)$. We use

#[#set math.equation(numbering: n => "(4.16)")
 $ \| z - "clip"_(A_0) \( z \) \| lt.eq z^2 \/ A_0 . $ <eq:clip-elementary>]

For class $0$, use its conditional description above and set

$ w_x^0 = "clip"_(A_0) \( v_x^0 \) - bb(E)_(c_x) "clip"_(A_0) \( v_x^0 \) . $

Here the conditional expectation fixes all rows and the Gaussians outside $Y$. Since $bb(E)_(c_x) v_x^0 = 0$, inequality (4.16) bounds both the clipping loss and the absolute value of the subtracted mean. Thus

#[#set math.equation(numbering: n => "(4.17)")
 $ \| w_x^0 \| lt.eq 2 A_0 \, #h(2em) bb(E) bb(E)_(x in Y) \| v_x^0 - w_x^0 \| lt.eq frac(2 sigma^(- 2), A_0) . $ <eq:class-zero-processing>]

Conditioned on that common background, the variables $w_x^0$, $x in Y$, depend on distinct independent Gaussians and have mean zero.

For class $\( i \, j \)$, operate on the entire slice $V_x$ as follows:

+ Set the slice to zero if $parallel V_x parallel_2 > H$.
+ Set it to zero if $q_x > gamma$.
+ Clip every value of a remaining slice to $\[ - A_0 \, A_0 \]$.

Both discard decisions depend only on $cal(F)_(i j \, Y)$. In particular, a decision is made from the function of the free sum variable and is independent of the sampled local rows. Let $W_x$ be the resulting slice and $w_x^(i j) = W_x \( B_(x_(- i))^i + B_(x_(- j))^j \)$.

Write $nu_x = parallel V_x parallel_2$. The first discard costs at most

$ bb(E) bb(E)_(x in Y) nu_x upright(bold(1))_({ nu_x > H }) lt.eq H^(- 1) bb(E) bb(E)_(x in Y) nu_x^2 lt.eq sigma^(- 2) / H . $

For the second discard, Cauchy–Schwarz, (4.12) and (4.15) give the bound

#[#set math.equation(numbering: n => "(4.18)")
 $ e_(upright("atom")) = sigma^(- 1) sqrt(C_0 \/ gamma) thin D^(1 \/ 4) . $ <eq:atom-discard-loss>]

Indeed its loss is at most $bb(E) bb(E)_(x in Y) nu_x upright(bold(1))_({ q_x > gamma })$, regardless of whether the first discard has already occurred. The last clipping operation costs at most $sigma^(- 2) \/ A_0$ by (4.16). Consequently

#[#set math.equation(numbering: n => "(4.19)")
 $ bb(E) bb(E)_(x in Y) \| v_x^(i j) - w_x^(i j) \| lt.eq sigma^(- 2) / H + e_(upright("atom")) + sigma^(- 2) / A_0 . $ <eq:pair-processing-loss>]

Every processed slice has absolute bound $A_0$ and $L^2$ norm at most $H$. For a slice surviving both discards, its clipping error in conditional $L^1 \( D \( A \) \)$ is at most $H^2 \/ A_0$. Each Fourier coefficient changes by at most this amount. Before clipping the spectrum was odd and all its coefficients had magnitude at most $gamma$, so, for all frequencies,

#[#set math.equation(numbering: n => "(4.20)")
 $ parallel W_x parallel_2 lt.eq H \, #h(2em) max_alpha \| hat(W)_x \( alpha \) \| lt.eq epsilon_0 \, #h(2em) epsilon_0 = gamma + H^2 \/ A_0 . $ <eq:processed-slice-bounds>]

Discarded slices satisfy the same bounds. Symmetric clipping in fact preserves oddness, since $V_x \( b + 1 \) = - V_x \( b \)$, although the following estimate only needs the bound for all coefficients.

=== 4.5 Box Cauchy–Schwarz and the independent squares <box-cauchyschwarz-and-the-independent-squares>

We prove the deterministic inequality used to remove the face signs. This is the iterated Cauchy–Schwarz mechanism of the box norms in hypergraph-uniformity arguments #cite(label("Gowers2007")) Section 3.5 and Lemma 4.1. The conditional square calculation that follows is specific to our localized array. For a finite product $Y = product_(j = 1)^m Y_j$ and an array $v : Y arrow.r bb(R)$, let $u^0 \, u^1$ be independent uniform points of $Y$ and set $u^omega = \( u_1^(omega_1) \, dots.h \, u_m^(omega_m) \)$ for $omega in { 0 \, 1 }^m$.

#thm([Lemma 4.2.])[
  (Box Cauchy–Schwarz).  #emph[For every real array $v$, 
#[#set math.equation(numbering: n => "(4.21)")
 $ frak(d)_Y \( v \)^(2^m) lt.eq bb(E)_(u^0 \, u^1) product_(omega in { 0 \, 1 }^m) v \( u^omega \) . $ <eq:box-cs>]

 In particular the right side is nonnegative.]
] <lem:box-cs>

#proof[
  Fix face multipliers $a_j : Y_(- j) arrow.r \[ - 1 \, 1 \]$. We describe each Cauchy–Schwarz step. At stage $k$, double the first $k$ coordinates and keep the last $m - k$ coordinates single. For $omega in { 0 \, 1 }^k$, write
  $ z^omega = \( u_1^(omega_1) \, dots.h \, u_k^(omega_k) \, u_(k + 1) \, dots.h \, u_m \) $
  and define
  $ A_k = bb(E) [product_(omega in { 0 \, 1 }^k) v \( z^omega \) product_(j = k + 1)^m product_(omega in { 0 \, 1 }^k) a_j \( z_(- j)^omega \)] . $
  Thus $A_0$ is the original correlation and $A_m$ is the right side of (4.21). In $A_(k - 1)$, the product of factors $a_k$ is independent of the single coordinate $u_k$ and has absolute value at most one. Put the average over $u_k$ innermost and apply Cauchy–Schwarz over all outer variables, removing that product. The result is the average of the square of the remaining inner average. Expanding this square with two independent values $u_k^0 \, u_k^1$ gives exactly $A_k$. Therefore
  $ \| A_(k - 1) \|^2 lt.eq A_k #h(2em) \( 1 lt.eq k lt.eq m \) . $
  Iterating yields $\| A_0 \|^(2^m) lt.eq A_m$, as well as nonnegativity of $A_m$. Taking the maximum over the finitely many face signs proves the assertion. ◻
]

Apply Lemma 11 pointwise to a processed random field $w$, before averaging any of its randomness. Write $Q = 2^m$. By Jensen’s inequality,

#[#set math.equation(numbering: n => "(4.22)")
 $ \( bb(E) frak(d)_Y \( w \) \)^Q lt.eq bb(E) frak(d)_Y \( w \)^Q lt.eq bb(E) bb(E)_(u^0 \, u^1) product_omega w \( u^omega \) . $ <eq:box-outer-average>]

The choices with $u_i^0 = u_i^1$ for at least one $i$ have probability at most $m \/ ell$. Since all processed fields have bound $2 A_0$, their contribution to the last expectation is at most $\( m \/ ell \) \( 2 A_0 \)^Q$ in absolute value.

On a cube with no repeated coordinates, all its vertices are distinct. For class $0$, condition on all rows and on the Gaussians outside $Y$. The factors $w^0 \( u^omega \)$ are independent centered functions of distinct $c_(u^omega)$, so their product has conditional mean zero. Thus

#[#set math.equation(numbering: n => "(4.23)")
 $ bb(E) frak(d)_Y \( w^0 \) lt.eq 2 A_0 \( m \/ ell \)^(1 \/ 2^m) . $ <eq:class-zero-correlation>]

For class $\( i \, j \)$, condition instead on $cal(F)_(i j \, Y)$ and on the chosen cube without repetitions. Partition its vertices into $2^(m - 2)$ squares by fixing all coordinates other than $i \, j$. On any one square its four local sums have the form

$ r_a + s_b \, #h(2em) \( a \, b \) in { 0 \, 1 }^2 \, $

where $r_0 \, r_1$ are the two rows of table $B^j$, and $s_0 \, s_1$ the two rows of table $B^i$. These four rows are independent and uniform in $D \( A \)$. Figure 1 displays the shared rows. The four sums are uniform subject to their zero-sum relation; they are not four independent variables.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.3), [#text(size: 9pt)[$W_00(r_0+s_0)$]])
  content((4.6, 2.3), [#text(size: 9pt)[$W_01(r_0+s_1)$]])
  content((0, 0), [#text(size: 9pt)[$W_10(r_1+s_0)$]])
  content((4.6, 0), [#text(size: 9pt)[$W_11(r_1+s_1)$]])
  line((0.8708, 2.3), (3.729, 2.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.3, 2.3), [#text(size: 9pt)[shared row $r_0$]], anchor: "south", padding: 0.1176cm)
  line((0.8708, 0), (3.729, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.3, 0), [#text(size: 9pt)[shared row $r_1$]], anchor: "north", padding: 0.1176cm)
  line((0, 2.017), (0, 0.2834), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 1.15), [#text(size: 9pt)[$s_0$]], anchor: "east", padding: 0.1176cm)
  line((4.6, 2.017), (4.6, 0.2834), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.6, 1.15), [#text(size: 9pt)[$s_1$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: A square after fixing the slice background. The four rows $r_0 \, r_1 \, s_0 \, s_1$ are independent, but their four sums satisfy one parity relation. Fourier expansion therefore leaves one common frequency. Different squares of a collision-free cube use disjoint rows. ],
) <fig:square>

For four possibly different real slice functions $W_(a b)$, direct Fourier expansion gives

#[#set math.equation(numbering: n => "(4.24)")
 $ bb(E)_(r_0 \, r_1 \, s_0 \, s_1) product_(a \, b in { 0 \, 1 }) W_(a b) \( r_a + s_b \) = sum_alpha product_(a \, b in { 0 \, 1 }) hat(W)_(a b) \( alpha \) . $ <eq:square-fourier>]

Indeed averaging $r_0 \, r_1$ forces the two frequencies in each row of the square to agree, and averaging $s_0 \, s_1$ forces agreement between these rows. Using the coefficient bound on two factors and Cauchy–Schwarz and Parseval on the other two, the absolute value of (4.24) is at most

#[#set math.equation(numbering: n => "(4.25)")
 $ epsilon_0^2 sum_alpha \| hat(W)_10 \( alpha \) hat(W)_11 \( alpha \) \| lt.eq epsilon_0^2 H^2 . $ <eq:square-bound>]

Different squares use disjoint rows in both tables: any change in one of the other $m - 2$ coordinates changes a retained coordinate of every such row. Conditional on the fixed background, their products are consequently independent. Their slice functions may share that background, which does not affect this independence. The absolute conditional expectation of the full cube product is therefore at most $\( epsilon_0^2 H^2 \)^(2^(m - 2))$. Combining this with the collision bound and (4.22), and using $\( a + b \)^(1 \/ Q) lt.eq a^(1 \/ Q) + b^(1 \/ Q)$ for $a \, b gt.eq 0$, gives

#[#set math.equation(numbering: n => "(4.26)")
 $ bb(E) frak(d)_Y \( w^(i j) \) lt.eq 2 A_0 \( m \/ ell \)^(1 \/ 2^m) + sqrt(H \( gamma + H^2 \/ A_0 \)) . $ <eq:pair-correlation>]

The maximizing face signs were eliminated by the deterministic inequality before the conditional independence argument was used. No independence assumption about those signs is involved.

=== 4.6 Choosing parameters and completing inner decoding <sec:inner-completion>

For any two fields on a fixed box, $\| frak(d)_Y \( u \) - frak(d)_Y \( v \) \| lt.eq bb(E)_(x in Y) \| u_x - v_x \|$. Thus (4.8), localization, the processing losses, and (4.26) imply, for each pair class,

#[#set math.equation(numbering: n => "(4.27)")
 $ bb(E) frak(d)_X \( L^(i j) \) lt.eq  & underbrace(sigma^(- 1) sqrt(\( s + R m \) ell \/ \( n - 1 \)), e_(upright("loc"))) + sigma^(- 2) / H + underbrace(sigma^(- 1) sqrt(C_0 \/ gamma) \( theta^2 + m p N \/ sigma^2 \)^(1 \/ 4), e_(upright("atom")))\
 & + sigma^(- 2) / A_0 + 2 A_0 \( m \/ ell \)^(1 \/ 2^m) + sqrt(H \( gamma + H^2 \/ A_0 \)) . $ <eq:six-errors>]

For class $0$, the corresponding bound is

#[#set math.equation(numbering: n => "(4.28)")
 $ bb(E) frak(d)_X \( L^0 \) lt.eq e_(upright("loc")) + frac(2 sigma^(- 2), A_0) + 2 A_0 \( m \/ ell \)^(1 \/ 2^m) . $ <eq:zero-errors>]

#proof[
  The smoothing parameters were fixed in Proposition 9. Choose $m$ as in (4.4), define $d_0$ by (4.6), and set $e = d_0 \/ 10$. Make the following successive choices, each with strict slack:
  + Choose a positive integer $H$ with $sigma^(- 2) \/ H < e$.
  + Choose a positive rational $gamma$ with $H gamma < e^2 \/ 4$.
  + Choose a positive integer $A_0$ so large that $2 sigma^(- 2) \/ A_0 < e$ and $H^3 \/ A_0 < e^2 \/ 4$. These choices give $sqrt(H \( gamma + H^2 \/ A_0 \)) < e$.
  + Choose an integer $ell gt.eq 2$ so large that $2 A_0 \( m \/ ell \)^(1 \/ 2^m) < e$.
  + Choose an integer $n > ell$ so large that $sigma^(- 1) sqrt(\( s + R m \) ell \/ \( n - 1 \)) < e$.
  + Now $N = n^m$, $M = m n^(m - 1)$ and $C_0 = 4^M binom(N + s, s)$ are fixed. Choose positive rationals $p \, theta < 1$ so small that
    $ theta^2 + frac(m p N, sigma^2) < frac(e^4 sigma^4 gamma^2, C_0^2) . $
    This makes $e_(upright("atom")) < e$.
  All choices are finite and use explicit inequalities. Roots in these inequalities can be removed by raising positive quantities to integer powers, so rational arithmetic and integer search suffice. Neither the alphabet size nor the distribution of the proof index enters them.
  If the row-atom assertion failed for these $p \, theta$, the preceding argument would apply. Each pair-class correlation in (4.27) would be less than $6 e < d_0$, and the class-$0$ correlation in (4.28) would be less than $3 e < d_0$. Summing over the $1 + binom(m, 2)$ classes would give
  $ bb(E) frak(d)_X \( L \) < \( 1 + binom(m, 2) \) d_0 = frac(1, 4 T) \, $
  contradicting (4.7). This proves the claimed probability at least $p$ of an odd conditional coefficient of magnitude at least $theta$. The pointwise bound on $h_x$ is (3.6), completing Theorem 7. ◻
]

== 5 An outer game with affine hints <sec:outer>

This Section constructs the outer game and proves the two properties used in Section 6: soundness with shared affine hints, and approximate joint uniformity of pulled-back affine functions.

Smooth equation–variable sampling and Fourier decoding have antecedents in Khot and Safra #cite(label("KS13")) Sections 3.2–3.4 and 5.2. Khot, Minzer and Safra #cite(label("KMS17")) Sections 3.3–3.4 use shared linear information and zero-advice coordinates; Dinur et al. #cite(label("DKKMS2025")) Section 5.2, Lemma 5.4 give a related shared-subspace formulation. We prove both properties for the exact questions and hints defined below.

Let $cal(E) = \( E^(\( 1 \)) \, dots.h \, E^(\( M_0 \)) \)$ be the nonempty uniform equation list supplied by Theorem 4. An equation question $E$ consists of its ordered three variable names $v \( E \, 1 \) \, v \( E \, 2 \) \, v \( E \, 3 \)$ and its right-hand side $tau_E in bb(F)_2$. Thus it asks that

$ x_(v \( E \, 1 \)) + x_(v \( E \, 2 \)) + x_(v \( E \, 3 \)) = tau_E . $

The list may have repeated equations, and variable names may repeat within an equation. Sampling is uniform over list entries, but equal equation questions have identical encodings: an index distinguishing equal list entries is not part of a player’s question.

=== 5.1 Questions, fresh slots, and canonical functions <questions-fresh-slots-and-canonical-functions>

For an equation $E$, put

$ A \( E \) = { a in bb(F)_2^3 : a_1 + a_2 + a_3 = tau_E \, quad a_p = a_(p') upright(" whenever ") v \( E \, p \) = v \( E \, p' \) } . $

This is a nonempty affine space of dimension at most two. Indeed, after identifying repeated variable names, there are $k lt.eq 3$ free bit slots and one nonzero linear equation: at least one multiplicity is odd because the sum of the multiplicities is three. The equation therefore has rank one, and $dim A \( E \) = k - 1$.

Fix integers $t gt.eq t_0 gt.eq 1$. An #emph[outer sample] $e$ is drawn as follows. First draw $t$ independent uniform list entries, with resulting equation questions $E_1 \, dots.h \, E_t$, and let

$ U = \( E_1 \, dots.h \, E_t \) \, #h(2em) A_U = product_(j = 1)^t A \( E_j \) . $

Next draw a uniform $t_0$-element subset $H subset.eq \[ t \]$. For each $j in H$, independently draw $p_j in \[ 3 \]$ uniformly. The second question is the ordered, tagged tuple $V = \( V_1 \, dots.h \, V_t \)$, where

$ V_j = cases(delim: "{", \( upright("variable") \, v \( E_j \, p_j \) \) \, & j in H \,, \( upright("equation") \, E_j \) \, & j in.not H .) $

In particular, a variable question contains its variable name and the coordinate $j$ in the ordered tuple, but neither its position $p_j$ nor its originating equation. Set

$ A_V = product_(j = 1)^t A_(V \, j) \, #h(2em) A_(V \, j) = cases(delim: "{", bb(F)_2 \, & j in H \,, bb(F)_2^3 \, & j in.not H .) $

Every displayed slot in this product is unrestricted. Even when the same variable name occurs more than once, no equalities between these slots are imposed. Likewise, the slots belonging to distinct coordinates of $A_U$ are separate; its only equalities between repeated names are those inside a single factor $A \( E_j \)$. These fresh slots are essential both to independent repetition and to the distribution of affine forms below.

Define the affine map $pi_e : A_U arrow.r A_V$ coordinatewise by

#[#set math.equation(numbering: n => "(5.1)")
 $ \( pi_e \( a \) \)_j = cases(delim: "{", \( a_j \)_(p_j) \, & j in H \,, a_j \, & j in.not H .) $ <eq:outer-projection>]

The verifier accepts labels $a in A_U$ and $b in A_V$ precisely when $pi_e \( a \) = b$. The map need not be onto: the unrestricted full triples on the second side need not satisfy their equations. Pullback is the linear map

$ pi_e^(*) : D \( A_V \) arrow.r D \( A_U \) \, #h(2em) L mapsto L compose pi_e \, $

and preserves the constant-one function.

We specify exactly what a question and an affine hint reveal. Every actual $U$ or $V$ is the tuple just defined, without extra information identifying its occurrence in $e$. Put its alphabet in lexicographic order as a subset of its displayed bit slots. A function on that alphabet is represented by its complete truth table in this order. In particular, a hint in $D \( A_U \)$ or $D \( A_V \)$ is the function itself, with this canonical encoding. It is not accompanied by a formula, its original coefficients on another alphabet, or an encoding of the map through which it was pulled back. Equal functions on the same actual question have equal encodings. The same convention will apply to Boolean queries in the bit proofs. Thus a response function at a given question cannot distinguish different descriptions of the same query.

For an integer $q gt.eq 0$, the #emph[game with $q$ affine hints] additionally draws independent uniform functions $L_1 \, dots.h \, L_q in D \( A_V \)$. The first player receives

$ \( U \, pi_e^(*) L_1 \, dots.h \, pi_e^(*) L_q \) $

and the second receives $\( V \, L_1 \, dots.h \, L_q \)$. The acceptance condition is still $pi_e \( a \) = b$. Giving independent shared or private randomness to these players does not change the upper bounds on its value.

=== 5.2 Soundness despite the affine hints <soundness-despite-the-affine-hints>

Consider first the ordinary equation-versus-variable game: draw a uniform list entry $E$, choose a uniform position $p in \[ 3 \]$, give $E$ to the first player and only $v \( E \, p \)$ to the second, and ask for $a in A \( E \)$ and a bit $b$. Accept when $a_p = b$. Equivalently the first answer alphabet can be $bb(F)_2^3$ with invalid answers rejected, so the answer sizes are at most eight and two.

#thm([Lemma 5.1.])[
  #emph[If no assignment satisfies more than $3 \/ 4$ of the equation list, the ordinary equation-versus-variable game has value at most $11 \/ 12$. Consequently its ordinary $r$-fold repetition has value at most $c^r$, for the effective universal constant $c < 1$ of Theorem 5, for every $r gt.eq 0$.]
] <lem:base-equation-game>

#proof[
  Fix a deterministic second strategy. Its bit for each variable name defines a global assignment. On at least $1 \/ 4$ of the sampled equations this assignment violates the equation. Every valid first answer to one of these equations disagrees with this assignment in at least one of the three positions, so a uniform position detects disagreement with probability at least $1 \/ 3$. An invalid answer is rejected in every position. The overall failure probability is therefore at least $1 \/ 12$. Repeated variable names do not affect the argument: equality at all three positions would still give precisely the violated assignment on that equation. The repeated bound follows from Theorem 5; its hypotheses depend only on this value bound and the two answer sizes. ◻
]

#thm([Lemma 5.2.])[
  (Hint soundness).  #emph[Suppose no assignment satisfies more than $3 \/ 4$ of the equation list. For every $q gt.eq 0$ and $t gt.eq t_0 gt.eq 1$, the value of the game with $q$ affine hints is at most 
#[#set math.equation(numbering: n => "(5.2)")
 $ #scale(x: 120%, y: 120%)[\(] 1 - 2^(- q) \( 1 - c \) #scale(x: 120%, y: 120%)[\)]^(t_0) . $ <eq:hint-bound>]

 The bound also applies to strategies using arbitrary independent shared or private randomness. In particular, for fixed $q$ and any prescribed rational $s > 0$, an effective choice of $t_0$ makes the bound strictly less than $s$, simultaneously for every $t gt.eq t_0$, every equation-list size, and every completeness parameter in Theorem 4.]
] <lem:hint-soundness>

#proof[
  Use the unrestricted slots of $A_V$ to generate the hints. Let $z_j$ denote the one-bit coordinate when $j in H$, and let $z_(j p)$, $p in \[ 3 \]$, denote the three coordinates when $j in.not H$. A uniform affine form has the unique expression
  #[#set math.equation(numbering: n => "(5.3)")
   $ L_ell \( z \) = kappa_ell + sum_(j in H) beta_(ell j) z_j + sum_(j in.not H) sum_(p = 1)^3 beta_(ell j p) z_(j p) . $ <eq:hint-coefficients>]
  All coefficients and constants in these expressions, for $1 lt.eq ell lt.eq q$, are independent uniform bits. They can be sampled after $H$ and before any equation or position, because the abstract slots in this expression depend only on $H$. Thus their distribution is independent of all sampled equations and positions.
  Define the active coordinates by
  $ A = { j in H : beta_(ell j) = 0 upright(" for every ") 1 lt.eq ell lt.eq q } . $
  For each $j in H$ its vector of $q$ coefficients is uniform in $bb(F)_2^q$, independently across $j$. Consequently
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| A \| tilde.op "Bin" \( t_0 \, 2^(- q) \) . $ <eq:active-binomial>]
  Conditional on $H$, the active set and the coefficient bits are independent of the equation and position samples. The equations are also independent of $H$. When $q = 0$, all hidden coordinates are active and (5.4) means $\| A \| = t_0$ deterministically.
  For the analysis give both players the following additional information: $H$, every coefficient and constant in (5.3), and all equation samples and all chosen positions outside $A$. Denote this background by $W$. It determines $A$ without inspecting its equation or position samples. Conditional on any possible $W$, the pairs
  $ \( E_j \, p_j \) \, #h(2em) j in A \, $
  are still independent samples of a uniform equation-list entry and an independent uniform position in $\[ 3 \]$. This follows directly from the product sampling distribution: once $H$ and the coefficients are fixed, $A$ is fixed, and conditioning on samples in its complement does not change the samples in $A$.
  We now show that, for fixed $W$, ordinary repeated-game questions in the active coordinates simulate each player’s original information exactly. List $A$ in increasing order, so that its $\| A \|$ coordinates can be identified with an ordinary repetition.
  + The first player receives the active equation questions $\( E_j \)_(j in A)$. Together with $W$, these reconstruct all of $U$ and hence $A_U$. For every hint the active summands in (5.3) are identically zero. On any $a in A_U$, therefore,
    $ \( pi_e^(*) L_ell \) \( a \) = kappa_ell + sum_(j in H \\ A) beta_(ell j) \( a_j \)_(p_j) + sum_(j in.not H) sum_(p = 1)^3 beta_(ell j p) \( a_j \)_p . $
    Every position appearing on the right is in the background. Thus the first player can compute the canonical truth table of each pulled-back hint, without receiving any active $p_j$ or active variable question from the second side. Although the domain $A_U$ depends on active equations, these are exactly the first player’s own repeated-game questions.
  + The second player receives only the active variable names $\( v \( E_j \, p_j \) \)_(j in A)$. Together with $W$ and the tags specified by $H$, these reconstruct $V$ and $A_V$. Formula (5.3), whose active coefficients vanish, computes every direct hint on this alphabet. Thus the second player can compute its canonical truth table without receiving an active equation or the chosen position within one.
  These reconstructions also explain why the representation of a hint matters. No metadata attached to a zero summand is present in the actual message. Restricting the zero function to an affine domain cannot create an offset or convey a hidden position. All nonzero contributions and their possible affine offsets are determined by the background and the receiving player’s own question.
  Apply the original response functions to the reconstructed information, and restrict their answers to the active coordinates. This defines a strategy for the ordinary $\| A \|$-fold repeated game, with $W$ fixed as a parameter. Acceptance of the full outer sample implies acceptance in every active coordinate, since (5.1) imposes exactly the ordinary equation-versus-variable comparison there. By Lemma 12, its conditional probability is at most $c^(\| A \|)$; for $A = diameter$ this is the trivial bound one.
  This reasoning includes coincidences between variable names or equation questions in different coordinates, and coincidences with the exposed background. Independent samples may coincide without ceasing to have a product distribution. Once $W$ is fixed, the simulated strategies may use all information about such coincidences obtainable from their respective questions, just as arbitrary strategies for ordinary repetition may do. No equality between fresh answer slots, nor any further information about an active question on the opposite side, has been supplied.
  Average over $W$ and use (5.4). The binomial generating function gives
  $ bb(P) \[ upright("outer acceptance") \] lt.eq bb(E) c^(\| A \|) = sum_(r = 0)^(t_0) binom(t_0, r) \( 2^(- q) c \)^r \( 1 - 2^(- q) \)^(t_0 - r) = #scale(x: 120%, y: 120%)[\(] 1 - 2^(- q) \( 1 - c \) #scale(x: 120%, y: 120%)[\)]^(t_0) . $
  One may first fix all independent random seeds of the players, apply the bound, and then average; this covers the stated random strategies.
  Finally replace $c$, if necessary, by an effectively chosen rational number $macron(c)$ with $c lt.eq macron(c) < 1$. Successively multiplying the rational number $1 - 2^(- q) \( 1 - macron(c) \) < 1$ finds an integer $t_0$ whose power is strictly less than $s$. This finite procedure is independent of $t$, the instance, and its completeness error. It supplies the asserted effective choice. ◻
]

=== 5.3 Joint marginal smoothness <joint-marginal-smoothness>

The following estimate concerns the joint distribution of several forms pulled back through the same outer sample. Conditioning is on $U$ only; in particular it is not conditioning on any previously received hint. For finite probability distributions $mu \, nu$, use $"TV" \( mu \, nu \) = 1 / 2 sum_x \| mu \( x \) - nu \( x \) \|$.

#thm([Lemma 5.3.])[
  (Joint smoothness).  #emph[Fix any actual first question $U$, integers $d gt.eq 1$ and $t gt.eq t_0 gt.eq 1$, and draw the remaining outer sample conditional on $U$. Draw $L_1 \, dots.h \, L_d$ independently and uniformly from $D \( A_V \)$. Then 
#[#set math.equation(numbering: n => "(5.5)")
 $ "TV" (cal(L) #scale(x: 120%, y: 120%)[\(] \( pi_e^(*) L_1 \, dots.h \, pi_e^(*) L_d \) divides U #scale(x: 120%, y: 120%)[\)] \, "Unif" \( D \( A_U \)^d \)) lt.eq 1 / 2 sqrt(\( 2^(4 d t_0) - 1 \) t_0^2 / t) . $ <eq:smoothness-bound>]

 The bound is uniform in $U$ and the equation list, including repeated variable names and zero-dimensional local alphabets. For fixed $d \, t_0$ and positive rational $Delta$, an effective integer $t gt.eq t_0$ makes the right-hand side strictly less than $Delta$.]
] <lem:smoothness>

#proof[
  Write $A_j = A \( E_j \)$ and $r_j = dim A_j lt.eq 2$. Choose, using $E_j$ alone, an affine origin $o_j in A_j$ and an injective linear map $T_j : bb(F)_2^(r_j) arrow.r bb(F)_2^3$ with image the translation space of $A_j$. Thus every label has a unique expression
  $ a_j = o_j + T_j u_j \, #h(2em) u_j in bb(F)_2^(r_j) . $
  For example, lexicographic search and binary Gaussian elimination make these choices canonical and effective. In these product coordinates a form on $A_U$ consists of one constant bit and a linear part in each coordinate group $bb(F)_2^(r_j)$. A $d$-tuple of forms consequently consists of $d$ constant bits and groups
  $ xi_j in \( bb(F)_2^(r_j) \)^d \, #h(2em) 1 lt.eq j lt.eq t . $
  Generate the $d$ forms by their independent raw coefficients and constants on the unrestricted slots of $A_V$, as in (5.3). After pullback, their constant bits are the original independent uniform constants plus offsets determined by the other coefficients, the positions, and the origins $o_j$. Conditional on all those other data, this addition is a translation of $bb(F)_2^d$. Hence the resulting constants are jointly uniform and independent of every linear part, of $H$, and of the chosen positions. Their common uniform factor contributes no total-variation distance, so it suffices to analyze the joint linear parts $\( xi_1 \, dots.h \, xi_t \)$.
  Fix $H$. If $j in.not H$, a single form has independent uniform coefficient vector $w in bb(F)_2^3$ on its three raw slots; its pulled-back linear part is $T_j^(sans(T)) w$. The map $T_j^(sans(T))$ has rank $r_j$ and is onto $bb(F)_2^(r_j)$. Every fiber therefore has the same size, so its output is uniform. All $d$ forms in this group are independent, and their joint law is the uniform law $mu_j$ on $\( bb(F)_2^(r_j) \)^d$.
  If $j in H$, condition first on its chosen position $p_j$. The $ell$th form has a uniform bit coefficient $beta_(ell j)$ on that slot, so its linear part is $beta_(ell j) v_(j \, p_j)$, where $v_(j \, p)$ is the linear part of the $p$th coordinate of $o_j + T_j u_j$. Average over the single uniform choice of $p_j$ shared by all $d$ forms, to obtain a distribution $Q_j$ on $\( bb(F)_2^(r_j) \)^d$. Its density $rho_j$ with respect to $mu_j$ satisfies
  #[#set math.equation(numbering: n => "(5.6)")
   $ bb(E)_(mu_j) rho_j = 1 \, #h(2em) 0 lt.eq rho_j lt.eq 2^(r_j d) lt.eq 2^(2 d) . $ <eq:local-density>]
  Indeed, every point of this finite space has uniform mass $2^(- r_j d)$, whereas its $Q_j$ mass is at most one. This argument allows a position’s linear part to be zero or to coincide with another position’s linear part. If $r_j = 0$, the space is a singleton and $rho_j = 1$.
  For fixed $H$, the linear-part groups are independent across $j$: their coefficients are independent, and the positions in distinct hidden coordinates are independently sampled. Fresh slots give this independence even when variable names in different equations coincide. Relative to the product uniform measure $mu = product_(j = 1)^t mu_j$, their joint density is therefore
  $ g_H \( xi_1 \, dots.h \, xi_t \) = product_(j in H) rho_j \( xi_j \) . $
  The densities $rho_j$ depend on $U \, d \, j$ but not on the other elements of $H$. Since $H$ is uniform and independent of $U$, the desired mixed density is $g = bb(E)_H g_H$.
  Let $H'$ be an independent uniform $t_0$-element subset of $\[ t \]$. If $H ∩ H' = diameter$, independence of the coordinate groups and (5.6) give $bb(E)_mu g_H g_(H') = 1$. For every $H \, H'$, the pointwise bound $g_H g_(H') lt.eq 2^(4 d t_0)$ gives the sufficient bound $bb(E)_mu g_H g_(H') lt.eq 2^(4 d t_0)$. Moreover, for fixed $H$,
  $ bb(P) \[ H ∩ H' eq.not diameter \] lt.eq sum_(j in H) bb(P) \[ j in H' \] = t_0^2 / t . $
  Since $bb(E)_mu g = 1$, it follows that
  $ bb(E)_mu \( g - 1 \)^2 & = bb(E)_(H \, H') bb(E)_mu g_H g_(H') - 1\
 & lt.eq \( 2^(4 d t_0) - 1 \) bb(P) \[ H ∩ H' eq.not diameter \]\
 & lt.eq \( 2^(4 d t_0) - 1 \) t_0^2 / t . $
  Cauchy–Schwarz now yields $"TV" \( g mu \, mu \) = 1 / 2 bb(E)_mu \| g - 1 \| lt.eq 1 / 2 sqrt(bb(E)_mu \( g - 1 \)^2)$, proving (5.5), including the independent uniform constants.
  All estimates used only $r_j lt.eq 2$, so the bound is uniform as asserted. For effectiveness, it is enough to choose an integer
  $ t gt.eq t_0 \, #h(2em) t > frac(\( 2^(4 d t_0) - 1 \) t_0^2, 4 Delta^2) . $
  The right-hand side is an explicitly computable rational number for fixed $d \, t_0 \, Delta$. No parameter depending on $U$ occurs in this choice. ◻
]

#prodef([Remark 5.4.])[
  Because (5.5) is uniform in $U$, it may be averaged over any distribution of $U$ and any extra randomness independent of the outer sample. In particular, if a bounded statistic is chosen as a function of $U$ and some of the pulled-back forms, one may apply Lemma 14 to the joint collection of all forms used by that statistic. For a statistic bounded in absolute value by $B$, the change in expectation is at most $2 B$ times the displayed total-variation bound. This does not assert uniformity of one form conditional on previously revealed forms.
] <rem:joint-smoothness-use>

Finally, these outer games are explicit finite objects. Their complete sampling space has

$ M_0^t binom(t, t_0) 3^(t_0) $

equally likely draws, counting repeated list entries with their multiplicities. There are at most $2^(2 t)$ labels at a first question and $2^(3 t - 2 t_0)$ labels at a second question. Their affine spaces, functions, canonical truth tables, and projections are all enumerable by binary linear algebra and finite evaluation. For fixed $t \, t_0 \, q \, d$ these local enumerations have constant size independent of the input. Comparing actual question encodings and identifying equal ones takes polynomial bit complexity. Thus the fresh-slot and canonical-function conventions introduce no oracle or uncharged lookup table.

== 6 Composition and soundness of the bit comparisons <sec:composition>

We now compose the inner test with the outer game. The main issue is that the first player’s Fourier truncation depends on the shared background. The joint form of Lemma 14 is designed to retain that dependence.

#thm([Proposition 6.1.])[
  (A gap for bit comparisons).  #emph[For every fixed integer $J gt.eq 20$, effective choices of constants give a four-test comparison system with the following properties. It is constructed from the uniform equation list in Theorem 4, for a fixed completeness error $zeta > 0$ chosen by the construction. Every test compares two bits in folded proof tables, and its contribution to cost is its failure probability divided by a positive rational budget $b_j$. In the YES case there are proof tables of cost at most $4$; in the NO case every collection of proof tables has cost greater than $J$. Alphabet sizes are bounded by effective constants depending only on $J$, and all local numerical parameters depend only on $J$.]
] <prop:bit-gap>

#proof[
  Apply Theorem 7 with $J$, taking its atom constants $p \, theta$ to be positive rationals by decreasing them if necessary. Set
  $ M = m n^(m - 1) \, #h(2em) q = M - 1 \, #h(2em) M_(*) = sqrt(N) / sigma . $
  The counts $t_0 lt.eq t$ of the outer game will be chosen below. Give each actual first question $U$ a folded bit proof $f_U$ on $A_U$, and each actual second question $V$ a folded bit proof $f_V$ on $A_V$. The same question always uses the same proof; an occurrence of a hidden variable is never separately indexed by its unrevealed equation or position.
  The first three tests are those of Theorem 7, applied to $f_V$ under the marginal distribution of $V$. For the fourth test sample a full outer edge $e$, an independent uniform face array $B$ over $D \( A_V \)$, and the Gaussian query table $P = P_(c + sigma g \, eta lambda)$ on the common code $cal(C)$. Compare
  #[#set math.equation(numbering: n => "(6.1)")
   $ f_U #scale(x: 120%, y: 120%)[\(] P \( pi_e^(*) B \) #scale(x: 120%, y: 120%)[\)] quad upright("and") quad f_V #scale(x: 120%, y: 120%)[\(] P \( B \) #scale(x: 120%, y: 120%)[\)] . $ <eq:fourth-test>]
  Here $pi_e^(*)$ acts on every entry of $B$. The Gaussian table on $cal(C)$ is literally the same on both sides, even if distinct codewords have identical pullbacks at one alphabet. Let $b_4 > 0$ be a small rational budget, to be fixed shortly, and define
  $ "Cost" \( f \) = sum_(j = 1)^4 frac(bb(P) \[ upright("test ") j upright(" fails") \], b_j) . $
  Suppose, toward a contradiction in the NO case, that $"Cost" \( f \) lt.eq J$. Each of the first three failure bounds required by Theorem 7 then holds, including the random index $V$. Draw an outer edge $e$, a uniform $i in \[ m \]$ and $x in X$, and independent $c$. The $q$ rows other than $B_(x_(- i))^i$ will serve as the independent uniform background forms allowed in Lemma 13. Put them in a fixed order depending only on the public $i \, x$. The two players receive these rows on their own alphabets, and use $c \, i \, x$ as additional public randomness, independent of the game. From their respective information they form the one-row functions
  #[#set math.equation(numbering: n => "(6.2)")
   $ H_V \( b \) & = h_(x \, V) #scale(x: 120%, y: 120%)[\(] B \[ B_(x_(- i))^i arrow.l b \] \, c #scale(x: 120%, y: 120%)[\)] \, &  & b in D \( A_V \) \,\
H_U \( a' \) & = h_(x \, U) #scale(x: 120%, y: 120%)[\(] \( pi_e^(*) B \) \[ B_(x_(- i))^i arrow.l a' \] \, c #scale(x: 120%, y: 120%)[\)] \, &  & a' in D \( A_U \) . $ <eq:HV>]
  The notation in (6.2) simply means filling the missing entry of the received array with a free argument. The first player needs no knowledge of $e$ or $V$ to define $H_U$. Both functions are bounded in absolute value by $M_(*)$.
  ===== 6.1 The two row functions are close. <the-two-row-functions-are-close.>
  For fixed $e \, B \, c$, apply (2.3) to the difference between the two bits in (6.1), using the same $g \, lambda$. Bessel’s inequality for the orthonormal functions $g_x$ gives
  $ 1 / N sum_x \| h_(x \, V) \( B \, c \) - h_(x \, U) \( pi_e^(*) B \, c \) \|^2 lt.eq 1 / sigma^2 bb(E)_(g \, lambda) \| f_V \( P \( B \) \) - f_U \( P \( pi_e^(*) B \) \) \|^2 . $
  Averaging $e \, B \, c$ bounds the right-hand side by $4 J b_4 \/ sigma^2$. Integrating the missing row in (6.2) restores a fully independent uniform array $B$, regardless of $i \, x$. Thus
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(E) lr(bar.v.double H_V - H_U compose pi_e^(*) bar.v.double)_(L^2 \( D \( A_V \) \))^2 lt.eq frac(4 J b_4, sigma^2) . $ <eq:row-comparison>]
  Choose a positive rational $b_4$ so small that
  #[#set math.equation(numbering: n => "(6.4)")
   $ frac(64 J b_4, sigma^2 theta^2) < p / 4 . $ <eq:budget-choice>]
  Markov’s inequality then makes the norm in (6.3) less than $theta \/ 4$, except on an event of probability less than $p \/ 4$.
  ===== 6.2 Diffuse first-side frequencies remain small after pullback. <diffuse-first-side-frequencies-remain-small-after-pullback.>
  Choose a positive rational $u < 1$. At each first-player information state, let $r_U$ be $H_U$ with all Fourier terms of magnitude at least $u$ removed. Parseval and the bound $\| H_U \| lt.eq M_(*)$ give
  #[#set math.equation(numbering: n => "(6.5)")
   $ \# { alpha : \| hat(H)_U \( alpha \) \| gt.eq u } lt.eq M_(*)^2 / u^2 \, #h(2em) sum_alpha \| hat(r)_U \( alpha \) \|^4 lt.eq u^2 M_(*)^2 \, #h(2em) lr(bar.v.double r_U bar.v.double)_oo lt.eq M_r := M_(*) + M_(*)^2 / u . $ <eq:remainder-bounds>]
  For the last bound, each removed coefficient satisfies $\| a \| lt.eq \| a \|^2 \/ u$.
  We claim that if the total-variation bound of Lemma 14 for $d = q + 3$ is at most $Delta$, then
  #[#set math.equation(numbering: n => "(6.6)")
   $ bb(E) sum_(beta in D \( A_V \)^(*)) \| accent(r_U compose pi_e^(*), ̂) \( beta \) \|^4 lt.eq u^2 M_(*)^2 + 2 Delta M_r^4 . $ <eq:restricted-fourth>]
  To prove this, fix $U$ and the independent public randomness $c \, i \, x$. For fixed background and $e$, identity (2.1) expresses the Fourier sum on the left as the average of
  $ r_U \( pi_e^(*) a \) r_U \( pi_e^(*) b \) r_U \( pi_e^(*) c' \) r_U #scale(x: 120%, y: 120%)[\(] pi_e^(*) \( a + b + c' \) #scale(x: 120%, y: 120%)[\)] \, $
  where $a \, b \, c'$ are independent uniform forms on $A_V$. Pullback is linear on the spaces of affine forms, so its fourth argument is determined by the first three. The entire expression, including the choice of $r_U$, depends only on $U \, c \, i \, x$ and the $q + 3$ pulled-back forms consisting of the background and these three additional arguments. It is bounded by $M_r^4$ in absolute value. Replace their joint distribution by independent uniform forms on $A_U$. Lemma 14 changes the expectation by at most $2 Delta M_r^4$. Under the replacement, conditioning on the background fixes $r_U$, and (2.1) and (6.5) bound its expectation by $u^2 M_(*)^2$. Averaging proves (6.6). This argument uses joint total variation; it does not conditionally replace the missing row while keeping a nonuniform background fixed.
  First choose $u > 0$ rational sufficiently small, and then require a sufficiently small positive rational $Delta$, so that
  #[#set math.equation(numbering: n => "(6.7)")
   $ frac(256 #scale(x: 120%, y: 120%)[\(] u^2 M_(*)^2 + 2 Delta M_r^4 #scale(x: 120%, y: 120%)[\)], theta^4) < p / 4 . $ <eq:remainder-choice>]
  By (6.6) and Markov’s inequality, no Fourier coefficient of $r_U compose pi_e^(*)$ has magnitude at least $theta \/ 4$, except on an event of probability less than $p \/ 4$.
  ===== 6.3 Local lists give a strategy for the outer game. <local-lists-give-a-strategy-for-the-outer-game.>
  Theorem 7 supplies an odd coefficient $beta$ of $H_V$ with magnitude at least $theta$ with probability at least $p$. Combining that event with the two preceding estimates leaves probability at least $p \/ 2$. On this event, the coefficient of $H_U compose pi_e^(*)$ at $beta$ has magnitude greater than $3 theta \/ 4$, since every coefficient is bounded by the $L^2$ norm of a function. The coefficient of its remainder has magnitude less than $theta \/ 4$. Consequently the pullback of the removed part has a nonzero coefficient at $beta$. At least one removed frequency $alpha$ therefore satisfies
  $ \( pi_e^(*) \)^(*) alpha = beta . $
  This conclusion permits multiple frequencies to have the same image: a nonzero sum has at least one nonzero summand. Since $pi_e^(*) \( 1 \) = 1$ and $beta$ is odd, such an $alpha$ is odd as well.
  The first player lists the odd frequencies of $H_U$ of magnitude at least $u$, and the second lists the odd frequencies of $H_V$ of magnitude at least $theta$. These lists are functions of their own information. By Lemma 3, they are lists of labels, and on the event just described they contain a pair agreeing under $pi_e$. Their sizes are at most $M_(*)^2 \/ u^2$ and $M_(*)^2 \/ theta^2$. Choose uniformly from nonempty lists and choose any fixed label when a list is empty. With independent private randomness, the resulting strategy succeeds with probability at least
  #[#set math.equation(numbering: n => "(6.8)")
   $ s_(*) := frac(p \/ 2, \( 1 + M_(*)^2 \/ u^2 \) \( 1 + M_(*)^2 \/ theta^2 \)) > 0 . $ <eq:decoder-success>]
  The strategy is used only to bound the value of a finite game. Its Fourier computations need not be efficient, and its independent continuous public randomness does not raise the game value above the maximum deterministic value.
  ===== 6.4 Parameter order and contradiction. <parameter-order-and-contradiction.>
  All quantities so far depend only on the inner constants and $J$. Choose $t_0$ effectively so that the upper bound in Lemma 13 is strictly below $s_(*)$ for the fixed $q$. Then choose $t gt.eq t_0$ so large that Lemma 14 gives the required $Delta$ for $d = q + 3$. Equation (6.8) contradicts the hinted-game upper bound, proving that no NO-case proof has cost at most $J$.
  Finally choose a positive rational $zeta$ with $t zeta lt.eq b_4$ and invoke Theorem 4. Its NO bound is always $3 \/ 4$, independently of $zeta$, so this last choice does not affect the repetition constants. In the YES case let a global assignment satisfy at least $1 - zeta$ of the equations. Give each $V$ its values at all requested slots. Give $U$ these values whenever all its equations are satisfied, and choose any label in $A_U$ otherwise. The first labels lie in their required affine alphabets, and the labels agree under $pi_e$ except on an event of probability at most $t zeta$. Use evaluation proofs at these labels. Lemma 6 bounds each of the first three normalized costs by one; agreement of labels makes the fourth comparison exact, so its normalized cost is also at most one. This proves the YES bound.
  The order of choices is, explicitly,
  $ J med arrow.r med upright("inner constants") arrow.r med b_4 \, u \, Delta \, s_(*) arrow.r med t_0 med arrow.r med t med arrow.r zeta . $
  All strict inequalities can be imposed with rational slack and integer searches using the displayed bounds. In these searches $M_(*)^2 = N \/ sigma^2$ is rational; the possibly irrational quantity $M_r$ may be bounded above by the rational number $N \/ sigma + N \/ \( sigma^2 u \)$ before choosing $Delta$. The complete construction therefore has effective constants independent of the input length. ◻
]

== 7 A deterministic finite reduction to simple graphs <sec:finite>

Fix an integer $K gt.eq 2$, put $J = 10 K$, and make the effective parameter choices in Proposition 16. Write $"Cost"_oo$ for its cost, and put

$ W = sum_(j = 1)^4 b_j^(- 1) . $

This is a positive rational constant depending only on $K$. The Gaussian randomness will now be replaced by one finite rational distribution. We retain the full joint distribution of the queried sign tables.

=== 7.1 Rational Gaussian sign tables <rational-gaussian-sign-tables>

Let $c \, g in bb(R)^X$ and $lambda in bb(R)^(cal(C))$ have independent standard Gaussian coordinates. Define the two tables on $cal(C)$

$ T_0 \( z \) & = "sgn" (N^(- 1 \/ 2) sum_(x in X) c_x \( - 1 \)^(z_x)) \,\
T_1 \( z \) & = "sgn" (N^(- 1 \/ 2) sum_(x in X) \( c_x + sigma g_x \) \( - 1 \)^(z_x) + eta lambda_z) . $

Their pair is a random element of a finite set of size $2^(2 \| cal(C) \|)$. All four tests are deterministic functions of this pair and their finite random choices. The first uses both tables. The second uses the same $T_1$ for $B$ and $B'$. The third forces one entry of $T_1$ to the two specified values. The fourth uses the same $T_1$ on the two outer alphabets. Thus a single approximation of $\( T_0 \, T_1 \)$ suffices.

#thm([Lemma 7.1.])[
  (Effective finite comparisons).  #emph[There is a deterministic construction, with all preliminary work depending only on $K$, of a finite rational replacement for the four tests such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ \| "Cost"_(upright("fin")) \( f \) - "Cost"_oo \( f \) \| < 1 / 2 #h(2em) upright("for every collection of folded proof tables ") f . $ <eq:uniform-finite-error>]

 Consequently its minimum cost is less than $9 \/ 2$ in the YES case, and every proof has cost greater than $10 K - 1 \/ 2$ in the NO case. The rational distribution replacing $\( T_0 \, T_1 \)$ has a positive integer common denominator depending only on $K$, computed by the construction.]
] <lem:finite-game>

#proof[
  We give a deterministic rational approximation with any prescribed rational accuracy $0 < epsilon < 1 \/ 4$. Set
  $ d = 2 N + \| cal(C) \| \, #h(2em) S = 2 \| cal(C) \| \, #h(2em) A = 2 N + 1 . $
  The $S$ unforced threshold inputs are linear forms in a vector $Z in bb(R)^d$ of independent standard Gaussians. Each input for $T_0$ has variance $1$, and each input for $T_1$ has variance $1 + sigma^2 + eta^2$. Its coefficient vector has $ell^1$ norm at most
  $ \( 1 + sigma \) sqrt(N) + eta lt.eq A . $
  These bounds do not require nonsingularity of the joint distribution of the threshold inputs.
  Choose an integer $T_G gt.eq 1$ such that
  $ d \/ T_G^2 < epsilon \/ 4 . $
  The probability $alpha$ that $Z in.not \[ - T_G \, T_G \]^d$ is at most $d \/ T_G^2$, by the second-moment bound in each coordinate and a union bound. Partition $\[ - T_G \, T_G \]$ into $L$ equal intervals of length $h = 2 T_G \/ L$, with rational midpoints. Choose the integer $L$ large enough that
  #[#set math.equation(numbering: n => "(7.2)")
   $ S A h < epsilon \/ 4 . $ <eq:gaussian-mesh-choice>]
  Endpoint conventions for the intervals are immaterial to their Gaussian masses. Rounding an interior vector to its cell midpoint changes any threshold input by at most $A h \/ 2$. If the corresponding signs change, the original threshold input has absolute value at most $A h \/ 2$. A centered Gaussian of variance at least one has density at most one, so the probability of this event for any one threshold is at most $A h$. The union bound over all $S$ thresholds is therefore at most $S A h$. In particular, all unrounded ties have probability zero.
  For completeness, this estimate can be combined with truncation without losing control at the boundary. Couple $Z$ with a vector $Y$ as follows: keep $Y = Z$ when $Z$ is in the cube, and otherwise draw $Y$ independently from the Gaussian conditioned on the cube. Then $Y$ has exactly that conditional law. On the event that $Z$ is outside, charge the full probability $alpha$; on its complement use the preceding sign-change estimate. Hence the law of the original joint sign table and the law obtained by rounding the conditioned Gaussian differ in total variation by at most
  #[#set math.equation(numbering: n => "(7.3)")
   $ d \/ T_G^2 + S A h < epsilon \/ 2 . $ <eq:tail-and-grid-error>]
  We next compute rational approximations to the conditioned Gaussian cell masses, including their exact normalization. This step uses no real-number oracle. Put $U = T_G^2 \/ 2$, and choose an integer $r gt.eq 0$ such that
  $ e_r := frac(U^(2 r + 1), \( 2 r + 1 \) !) quad upright("satisfies") quad 2 d T_G e_r < epsilon \/ 4 . $
  This is a terminating search with rational comparisons. Indeed $e_(r + 1) \/ e_r = U^2 \/ \( \( 2 r + 2 \) \( 2 r + 3 \) \)$, so after an effectively found index the ratio is at most $1 \/ 2$. Define the rational polynomial
  $ Q_r \( v \) = sum_(j = 0)^(2 r) frac(\( - 1 \)^j v^(2 j), 2^j j !) . $
  Taylor’s remainder for $e^(- u)$, with $u = v^2 \/ 2 gt.eq 0$, gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ 0 lt.eq Q_r \( v \) - e^(- v^2 \/ 2) lt.eq e_r #h(2em) \( \| v \| lt.eq T_G \) . $ <eq:positive-density-polynomial>]
  In particular $Q_r$ is strictly positive on the interval. For each grid interval $I = \[ a \, b \]$, compute the rational number
  #[#set math.equation(numbering: n => "(7.5)")
   $ w_I = frac(integral_a^b Q_r \( v \) thin upright(d) v, integral_(- T_G)^(T_G) Q_r \( v \) thin upright(d) v) . $ <eq:rational-cell-mass>]
  Both integrals are evaluated by the rational antiderivative
  $ sum_(j = 0)^(2 r) frac(\( - 1 \)^j v^(2 j + 1), 2^j j ! \( 2 j + 1 \)) . $
  Thus the $w_I$ are positive rationals and their sum is exactly one.
  Here is a quantitative error bound for these cell masses. Write $g \( v \) = e^(- v^2 \/ 2)$ on $\[ - T_G \, T_G \]$, let $Z_g = integral_(- T_G)^(T_G) g$, and let $E_r = integral_(- T_G)^(T_G) \( Q_r - g \)$. Since $T_G gt.eq 1$ and $e^(- u) gt.eq 1 - u$ for $u gt.eq 0$,
  $ Z_g gt.eq integral_(- 1)^1 \( 1 - v^2 \/ 2 \) thin upright(d) v > 1 \, #h(2em) 0 lt.eq E_r lt.eq 2 T_G e_r . $
  The probability density $Q_r \/ \( Z_g + E_r \)$ is a mixture of $g \/ Z_g$ and the normalized nonnegative residual $Q_r - g$, with residual mixture weight $E_r \/ \( Z_g + E_r \)$ (if $E_r = 0$ the densities coincide). Their total variation distance is therefore at most $2 T_G e_r$. The Gaussian conditioned on the cube is a product of these one-dimensional conditioned laws. Taking products increases the total variation error by at most the sum of the coordinate errors, as follows by replacing the coordinates one at a time. Rounding to the grid cannot increase total variation. Consequently the grid distribution assigning mass $product_(i = 1)^d w_(I_i)$ to a cell has total variation distance at most $2 d T_G e_r < epsilon \/ 4$ from the rounded conditional Gaussian law. Together with (7.3), this proves error less than $epsilon$ for the complete joint sign table.
  Every sign at a rational midpoint is also computed exactly. A $T_0$ input has the sign of a rational number. Multiplying a $T_1$ input by $sqrt(N) > 0$ expresses it as
  $ a + b sqrt(N) #h(2em) \( a \, b in bb(Q) \) . $
  If $a \, b$ have the same sign, or one is zero, its sign is immediate. If their signs are opposite, compare the rationals $a^2$ and $N b^2$; the term of larger magnitude determines the sign, and equality is an exact zero. Declare the sign of zero to be $+ 1$. This also handles square $N$. Thus grid ties and all algebraic comparisons use finite rational arithmetic.
  Choose a common denominator $Q_1$ for the finitely many rationals $w_I$, for example the product of their reduced positive denominators, and put $Q = Q_1^d$. Every cell probability is an integer multiple of $1 \/ Q$. Enumerate the $L^d$ cells, compute their complete sign-table pairs, and add the integer numerators for cells giving the same pair. This gives an explicit rational law $hat(mu)$ for $\( T_0 \, T_1 \)$ with denominator $Q$. The code $cal(C)$, the grid, the polynomial, these numerators, and all sign classifications are computed from the fixed parameters. Their complete enumeration and the bit operations on their rational numbers are finite work depending only on $K$ and $epsilon$.
  Finally take $epsilon = 1 \/ \( 8 \( 1 + W \) \)$. For each fixed outer sample and each fixed collection of finite random choices in a test, its failure indicator for any fixed proof is a function of the joint table with values in ${ 0 \, 1 }$. Replacing its law by $hat(mu)$ changes its expectation by less than $epsilon$. Averaging the finite choices and the outer sample preserves this bound. It follows simultaneously for every proof $f$ that
  $ \| "Cost"_(upright("fin")) \( f \) - "Cost"_oo \( f \) \| < epsilon W < 1 / 2 . $
  No union bound over proofs is involved. Applying Proposition 16 gives the two claimed finite cost bounds. ◻
]

=== 7.2 Numerical multiplicities and canonical proof variables <numerical-multiplicities-and-canonical-proof-variables>

Let $M_0 gt.eq 1$ be the length of the uniform equation list from Theorem 4. The rounding needed to obtain that list was included in its proof. Set

$ H_K = binom(t, t_0) 3^(t_0) \, #h(2em) M = m n^(m - 1) . $

There are exactly $H_K M_0^t$ elementary outer samples: ordered choices of list entries, a hidden-coordinate set, and a position at every hidden coordinate. Each has probability $1 \/ \( H_K M_0^t \)$. For the first three tests enumerate the full outer sample and ignore its unused information; this gives exactly the required second-question marginal. Repeated question encodings are identified as specified in Section 5. The sampling indices are not appended to actual questions.

All remaining probability denominators divide an effectively computable integer $A_K$ depending only on $K$. An explicit choice can be given. Write the row-resampling probability in lowest terms as $delta^2 \/ m = a_0 \/ r_0$, and use the Gaussian-table denominator $Q$ from Lemma 17. Each second alphabet has dimension at most $3 t$, so a uniform row in $D \( A_V \)$ has a probability denominator dividing $2^(3 t + 1)$. Sample both the original and fresh replacement arrays even when some or all replacement rows are unused, and similarly allow the unused resampling flags and forced codeword to be drawn in every test. Their joint probabilities have denominators dividing

#[#set math.equation(numbering: n => "(7.6)")
 $ A_K = Q thin 2^(2 M \( 3 t + 1 \)) r_0^M \| cal(C) \| . $ <eq:inner-denominator>]

Every elementary test outcome therefore has probability $a \/ \( H_K A_K M_0^t \)$ for a nonnegative integer $a$. Dummy choices do not change any test’s distribution. They only give a uniform denominator.

Write $b_j = s_j \/ t_j$ in lowest terms, with positive integers $s_j \, t_j$, and choose a positive integer $B_K$ divisible by all four $s_j$. The common denominator for the #emph[cost weights] can now be taken to be

#[#set math.equation(numbering: n => "(7.7)")
 $ D_0 = C_K M_0^t \, #h(2em) C_K = H_K A_K B_K . $ <eq:polynomial-denominator>]

Indeed an elementary outcome of test $j$ contributes weight $a t_j \/ \( H_K A_K M_0^t s_j \)$ times its failure indicator, and multiplication by $D_0$ gives the integer $a B_K t_j \/ s_j$. Zero multiplicities may be omitted. Summing all multiplicities, before or after collecting equal demands, gives exactly

#[#set math.equation(numbering: n => "(7.8)")
 $ sum_(upright("elementary demands")) upright("multiplicity") = D_0 sum_(j = 1)^4 b_j^(- 1) = D_0 W = O_K \( M_0^t \) . $ <eq:total-multiplicity>]

This is a bound on their numerical sum, so expanding the multiplicities is polynomial work for fixed $K$.

We describe explicitly the finite proof variables to which these demands refer. Each $A_U$ is a nonempty affine subset of at most $3 t$ bit slots, and each $A_V$ has at most $3 t$ slots. List each alphabet in lexicographic order. Its affine forms can be found by binary Gaussian elimination and enumerated by their truth tables; there are at most $2^(3 t + 1)$ forms. Its Boolean query tables can all be enumerated as well, in number at most $2^(2^(3 t))$. These are constants for fixed $K$. All pullbacks and the arrays $B \( x \)$ are evaluated on these explicit tables. In particular, the construction never computes a smoothed derivative, a Fourier decoder, or an optimum proof.

For each actual question on each side, introduce one sign variable for every complementary pair ${ P \, - P }$ of Boolean tables on its alphabet. The two tables are distinct because the alphabet is nonempty. If $a_(*)$ is its first label, define

$ tau \( P \) = P \( a_(*) \) \, #h(2em) R \( P \) = tau \( P \) P . $

The representative $R \( P \)$ takes value $+ 1$ at $a_(*)$. Assigning a sign $y_(q \, R) in { - 1 \, 1 }$ to each such representative is in bijection with folded proofs, by

#[#set math.equation(numbering: n => "(7.9)")
 $ f_q \( P \) = tau \( P \) y_(q \, R \( P \)) . $ <eq:finite-folding>]

Here $q$ includes the first- or second-side tag and the actual question, but no description of an outer-sample occurrence. Identical semantic query tables at the same question therefore use the same variable.

A comparison $f_q \( P \) = f_(q') \( P' \)$ becomes the signed demand

#[#set math.equation(numbering: n => "(7.10)")
 $ y_(q \, R \( P \)) y_(q' \, R \( P' \)) = tau \( P \) tau \( P' \) . $ <eq:signed-demand>]

The required relation is equality when the right side is $+ 1$ and inequality when it is $- 1$. This formula applies even when the two variables coincide: a self-equality never fails and a self-inequality always fails. Equation (7.9) proves exact equality between weighted demand cost and $"Cost"_(upright("fin"))$, for every assignment, including these cases.

=== 7.3 Exact realization by an unweighted simple graph <exact-realization-by-an-unweighted-simple-graph>

#thm([Lemma 7.2.])[
  (Path realization).  #emph[The finite rational comparison system can be transformed deterministically into a simple undirected unweighted graph $G$ with 
#[#set math.equation(numbering: n => "(7.11)")
 $ "OPT"_(upright("uncut")) \( G \) = D_0 min_f "Cost"_(upright("fin")) \( f \) . $ <eq:exact-graph-optimum>]

 The graph has $O_K \( M_0^t \)$ vertices and edges and is constructed in polynomial time, including bit complexity, for fixed $K$.]
] <lem:graph-realization>

#proof[
  Start with a vertex for each sign variable. For every unit of integer multiplicity in (7.10), join its endpoint vertices by a path of length four for an equality demand and length three for an inequality demand. See Figure 2. All internal vertices are fresh for that unit demand. If the two endpoints coincide, this prescription means respectively a four-cycle through three fresh vertices or a triangle through two fresh vertices.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.735, 1.26), [#text(size: 9pt)[Equality $y_u=y_v$:]], anchor: "east", padding: 0.1176cm)
  content((-0.735, 0), [#text(size: 9pt)[Inequality $y_u=-y_v$:]], anchor: "east", padding: 0.1176cm)
  line((0, 1.26), (4.2, 1.26), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (4.2, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, 1.26), radius: 0.07056, fill: black, stroke: none)
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  circle((4.2, 1.26), radius: 0.07056, fill: black, stroke: none)
  circle((4.2, 0), radius: 0.07056, fill: black, stroke: none)
  circle((1.05, 1.26), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.1, 1.26), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.15, 1.26), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.4, 0), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.8, 0), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 1.26), [#text(size: 9pt)[$u$]], anchor: "south", padding: 0.1176cm)
  content((4.2, 1.26), [#text(size: 9pt)[$v$]], anchor: "south", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$u$]], anchor: "north", padding: 0.1176cm)
  content((4.2, 0), [#text(size: 9pt)[$v$]], anchor: "north", padding: 0.1176cm)
  content((4.725, 1.26), [#text(size: 9pt)[$4$ edges]], anchor: "west", padding: 0.1176cm)
  content((4.725, 0), [#text(size: 9pt)[$3$ edges]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 2: Each unit demand becomes a path with fresh internal vertices. For fixed endpoint signs, its minimum uncut cost is zero if the demand holds and one otherwise. Identifying the endpoints gives a four-cycle or a triangle and handles self-demands with the same exact cost. ],
  ) <fig:paths>
  For an ordinary path with $L$ edges, write the vertex signs along it as $x_0 \, dots.h \, x_L$, and let $r$ be the number of its uncut edges. Exactly $L - r$ adjacent pairs have opposite signs. Hence
  #[#set math.equation(numbering: n => "(7.12)")
   $ x_0 x_L = product_(i = 1)^L x_(i - 1) x_i = \( - 1 \)^(L - r) . $ <eq:path-parity>]
  When the prescribed relation holds, alternating signs from the first endpoint give $r = 0$ and reach the prescribed last sign. When it fails, (7.12) rules out $r = 0$; making exactly one adjacent pair equal and alternating on all other edges reaches the prescribed last sign and gives $r = 1$. The same argument with $x_L = x_0$ proves the assertion for coincident endpoints. A four-cycle has minimum zero, as required by a self-equality; a triangle has minimum one, as required by a self-inequality. Thus each gadget has conditional minimum equal to the failure indicator of its demand.
  For any fixed signs on the original vertices, its gadgets can attain these minima independently because their internal vertices are disjoint. Conversely any sign assignment on the graph pays at least the sum of these conditional minima. Minimizing over the original signs and using (7.9) proves (7.11), with no additive term.
  No gadget has a loop or a repeated edge. Within a gadget all its internal vertices are distinct; the coincident-endpoint cases have lengths at least three. Between gadgets an edge cannot be repeated, since every edge contains a vertex internal to its own gadget. The construction therefore gives a simple undirected graph and assigns every edge unit weight.
  There are at most $2 H_K M_0^t$ actual questions, and a constant number depending only on $K$ of sign variables at each. A gadget introduces at most three vertices and four edges. Equation (7.8) therefore proves the stated size bound. All actual questions and query tables can be identified by deterministic comparisons or sorting of their canonical encodings. Equality of variable names, construction of the affine alphabets, and table pullback require a polynomial amount of work per outer sample; the only unbounded strings are names from the polynomial-size starting instance. The sample count is polynomial for fixed $t$. The integers in (7.7) and (7.8) have $O_K \( 1 + log M_0 \)$ bits. Explicitly writing their multiplicities costs $O_K \( M_0^t \)$ iterations, and vertex identifiers have $O_K \( 1 + log M_0 \)$ bits. These observations include the cost of constructing the vertex and edge lists and all required integer arithmetic. ◻
]

=== 7.4 The strict gap and algorithmic consequences <the-strict-gap-and-algorithmic-consequences>

#proof[
  Given a $3$SAT instance, perform the deterministic reduction in Theorem 4 with the rational completeness error chosen by Proposition 16. It supplies the nonempty uniform list of length $M_0$. Carry out Lemmas 17 and 18, compute $D_0$ by (7.7), and output the graph together with
  $ k = 5 D_0 . $
  This is a positive integer, computed without knowledge of the optimum. In the YES case these Lemmas give
  $ "OPT"_(upright("uncut")) \( G \) < 9 / 2 D_0 < 5 D_0 = k . $
  In the NO case they give
  $ "OPT"_(upright("uncut")) \( G \) > (10 K - 1 / 2) D_0 > 5 K D_0 = K k \, $
  where the second inequality holds for every $K gt.eq 2$.
  All parameter searches in the preceding sections use the displayed effective inequalities. The additional integer searches, rational integrations, cell enumerations, and sign-table construction in this Section are also algorithms. The reduction performs this preliminary work itself; no table or numerical advice is supplied to it. Its cost is a finite constant for fixed $K$. The starting reduction has polynomial work and output length, and Lemma 18 establishes polynomial work and output length for every subsequent step. The integer $k$ has $O_K \( 1 + log M_0 \)$ bits. Composition is therefore a deterministic polynomial-time many-one reduction with all the graph properties and the strict positive-threshold gap in the statement. ◻
]

For clarity, the deterministic and randomized approximation consequences are distinct. Let $C > 1$ be a fixed real factor and choose a fixed integer $K gt.eq max { 2 \, C }$. A deterministic polynomial-time algorithm returning a bipartition of cost at most $C "OPT"_(upright("uncut")) \( G \)$ would decide $3$SAT: run it on the output graph and accept exactly when its cut has cost at most $K k$. In a YES instance its cost is at most $C k lt.eq K k$; in a NO instance every bipartition costs more than $K k$. Thus such an algorithm implies $sans(P) = sans(N P)$.

If instead a randomized polynomial-time algorithm returns such a bipartition with probability at least a fixed positive constant, validate the returned bipartition and apply the same cost check. A NO instance can never be accepted, regardless of the algorithm’s random choices. A YES instance is accepted whenever the approximation succeeds. Independent repetition a fixed number of times raises this probability to at least $1 \/ 2$ if necessary. This puts $3$SAT in $sans(R P)$, and composing with deterministic reductions to $3$SAT gives $sans(N P) subset.eq sans(R P)$. The randomized conclusion is therefore the latter containment.

=== 7.5 Minimum 2CNF clause deletion <sec:2cnf-consequence>

#proof[
  Given $G = \( V \, E \)$, introduce a variable $x_v$ for each vertex and, for each edge $u v$, the two clauses
  $ \( x_u or x_v \) \, #h(2em) \( not x_u or not x_v \) . $
  Call the resulting formula $F_G$. Equal endpoint values falsify exactly one of these clauses, while unequal values satisfy both. Thus, for every assignment $a$ and $S_a = { v : a \( x_v \) = 1 }$,
  $ "unsat" \( F_G \, a \) = "uncut"_G \( S_a \) . $
  Deleting an assignment’s false clauses gives a feasible deletion set of the same cost. Conversely, from every feasible deletion set $D$, a polynomial-time $2$SAT algorithm finds an assignment $a$ satisfying $F_G \\ D$. Every original clause it falsifies belongs to $D$, so $"uncut"_G \( S_a \) = "unsat" \( F_G \, a \) lt.eq \| D \|$. Consequently,
  $ "OPT"_(upright("del")) \( F_G \) = min_a "unsat" \( F_G \, a \) = "OPT"_(upright("uncut")) \( G \) . $
  Fix $C > 1$ and choose a fixed integer $K gt.eq max { 2 \, C }$ in Theorem 1. The construction has $\| V \|$ variables and $2 \| E \|$ clauses and preserves the gap at the same binary-encoded integer $k gt.eq 1$: $"OPT"_(upright("del")) \( F_G \) lt.eq k$ if the source formula is satisfiable, and $"OPT"_(upright("del")) \( F_G \) > K k$ otherwise. A $C$-approximation returns a feasible deletion set with $\| D \| lt.eq C k lt.eq K k$ in the former case, whereas every feasible deletion set has $\| D \| > K k$ in the latter. Comparing its size with the integer $K k$ therefore decides $3$SAT in polynomial time. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
