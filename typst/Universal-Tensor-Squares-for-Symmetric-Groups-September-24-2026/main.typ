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

#align(center)[#text(size: 16pt, weight: "bold")[Universal Tensor Squares for Symmetric Groups]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a partition $lambda tack.r n$, write $S^lambda$ for the corresponding irreducible complex representation of the symmetric group $S_n$. Its Kronecker coefficients are

$ g \( lambda \, mu \, nu \) = dim "Hom"_(S_n) \( S^nu \, S^lambda ⊗ S^mu \) \, $

where the tensor product carries the diagonal action. We prove the following statement.

#thm([Theorem 1.1.])[
  #emph[For every positive integer $n in.not { 2 \, 4 \, 9 }$ there is a partition $lambda tack.r n$ such that 
$ g \( lambda \, lambda \, nu \) > 0 #h(2em) upright("for every ") nu tack.r n . $

 Thus one irreducible representation has a tensor square containing every irreducible representation of $S_n$.]
] <thm:main>

The partition $lambda$ is fixed for each degree: it does not vary with the desired constituent $nu$. In particular the trivial and sign representations both occur. The latter forces $lambda$ to be self-conjugate, since

$ g \( lambda \, lambda \, \( 1^n \) \) = dim "Hom"_(S_n) \( S^lambda \, S^(lambda^t) \) = cases(delim: "{", 1 \, & lambda = lambda^t \,, 0 \, & lambda eq.not lambda^t .) $

Our construction meets this necessary condition throughout.

#thm([Corollary 1.2.])[
  (Unipotent tensor squares).  #emph[For each positive integer $n in.not { 2 \, 4 \, 9 }$, choose a partition $lambda_n$ supplied by Theorem 1, including its finite-range witnesses. For every prime power $q$, let $U_q^lambda$ denote the unipotent irreducible complex character of $"GL"_n \( bb(F)_q \)$ indexed by $lambda tack.r n$. Then $U_q^(lambda_n) ⊗ U_q^(lambda_n)$ contains $U_q^nu$ for every $nu tack.r n$.]
] <cor:unipotent-squares>

#proof[
  Theorem 1 gives $g \( lambda_n \, lambda_n \, nu \) > 0$ for every $nu tack.r n$. Letellier’s nonnegativity theorem and constant-term bound [11] Theorem 4 and Proposition 6, recalled in [12] Theorem 2.8, transfer this positivity to the unipotent multiplicity for the same partition labels and every prime power $q$. ◻
]

The Steinberg character already gives this unipotent coverage in every degree [11] Proposition 33, and staircase labels give it at triangular degrees [12] Theorem 1.1. The corollary identifies further covering squares using the same labels that solve the symmetric-group problem.

=== 1.1 History and significance <history-and-significance>

Pak, Panova, and Vallejo formulate the assertion for $n gt.eq 3$, with $n eq.not 4 \, 9$, as the #emph[tensor square conjecture] for symmetric groups [17] Conjecture 1.1. The case $n = 1$ is immediate. Hence Theorem 1 resolves that conjecture affirmatively, including every nontriangular degree.

The related #emph[Saxl conjecture] specifies the staircase partition $rho_m = \( m \, m - 1 \, dots.h \, 1 \)$ at the triangular degree $N_m = m \( m + 1 \) \/ 2$; see [17] Conjecture 1.2. Saxl proposed it at the UCLA Combinatorics Seminar on 20 March 2012, as recorded in [17] Footnote 2. It is a more specific assertion about a distinguished family, but only at triangular degrees. Earlier work established substantial support families: Pak, Panova, and Vallejo gave a character-nonvanishing test for constituents of self-conjugate squares [17] Lemma 1.3, while Ikenmeyer proved the staircase assertion for partitions comparable with the staircase in dominance order [9] Theorem 2.1. His triangular arrangement of alternating tensors and nonzero contractions [9] Sections 3–5 is a methodological predecessor of the cyclic construction used here. Heide, Saxl, Tiep, and Zalesski conjectured the analogous tensor-square covering property for alternating simple groups [8] Remark 1.3(3), partly motivated by Thompson’s conjugacy-class-square conjecture for finite simple groups.

Several complementary approaches explain the strength of the square problem. Luo and Sellke proved that staircase squares contain almost all partitions under both the uniform and Plancherel measures, and obtained full fourth-power coverage in all sufficiently large degrees, using modified shapes at nontriangular degrees [14] Theorems 1.4–1.6. Harman and Ryba subsequently proved full coverage for every staircase tensor cube [7] Theorem 1.1. Spin-character methods gave Bessenrodt all double-hook constituents, and Li proved the triple-hook case: these are targets with two and three diagonal cells, respectively [1] Theorem 4.10[13] Theorem 4.22. Modular methods yield, among other families, all 2-height-zero constituents and framed staircases [3] Theorems 5.2 and 5.5. More recent semigroup and generalized-block criteria give additional constituent families [5] Theorem 1.6. These results concern different support families or tensor powers: neither almost-all coverage nor a third or fourth power gives the universal square required here.

The passage to nontriangular degrees also has a direct antecedent. Outside degrees $2 \, 4 \, 9$, Li conjectured universal-square support for every self-conjugate staircase-like partition in a parity-dependent family, and asked whether suitable additions of one or two boxes preserve universal-square support [13] Section 5.5, Definition 5.3, Conjecture 1 and Problem 5.4. Our large-degree construction uses a different family, making matching additions to the first two rows and columns of a parity-compatible staircase. The proof controls all constituents of the chosen enlargement; the candidate is fixed before the target is specified. Bessenrodt and Bowman formulate stronger conjectural refinements in terms of symmetric and alternating parts of tensor squares [2] Conjectures 10.2–10.3; the tensor product in Theorem 1 is the ordinary diagonal tensor square.

We use the stronger cyclic form of the staircase result proved in #emph[A Cyclic Polytabloid Proof of Saxl’s Conjecture] [16] Theorem 3.1. The exact theorem and generator are specified in Theorem 6. The new task here is to pass from staircase degrees to all the degrees in Theorem 1.

=== 1.2 The proof and its reusable ingredients <the-proof-and-its-reusable-ingredients>

The obstacle is not simply to place a smaller staircase inside a larger diagram. Its constituents must survive a map from the actual enlarged square, and attachments can introduce cancelling alternating terms. Section 3 constructs the fixed self-conjugate partition for each large degree. Two complementary sufficient tests show that its square contains a prescribed target.

The first test, developed in Section 4, starts with one tensor obtained by alternating along the candidate’s rows in the first factor and its columns in the second. A coordinate projection of its diagonal orbit separates a smaller triangle from a width-two band and two attached diagrams. The projected module is the full induction of the triangle and complement modules. The cyclic staircase input supplies every constituent on the triangle, so branching reduces the task to finding a supported complement diagram contained in the desired target. The band is an odd path of alternating pairs: its contraction is a word of two-by-two matrices and adjugates. The attachments are handled by nondegenerate symmetric forms and a parity-sensitive Littlewood–Richardson splitting. Keeping the attached dual columns away from the path endpoints makes every surviving term factor, so the nonzero contractions do not cancel.

The second test, in Section 5, works in the full square, using column alternations in both factors. It allows independent position permutations in the two layers before applying a common projection. Label the two alphabets by positive integers; a pair of letters $a \, a'$ has output $a + a' - 1$. Components can then be separated by both the numbers and sums of their outputs. This combines four-row path supports, two-row symmetric-form supports, and an additional three-row support construction. This size-and-sum projection, as well as the explicit attachment criterion, can be applied independently of the final degree estimates.

These tests divide the targets by their initial row and column sums. The balance test supplies a target whenever its first four rows or first four columns have small total size. For a remaining target, failure of the band test in both orientations bounds the first few row sums and column sums simultaneously. Section 6 shows that, for large parameters, a diagram satisfying both bounds has less area than the target’s prescribed size. Two exact capacity calculations settle the remaining bounded parameters. The Murnaghan–Nakayama recursion of Section 7 verifies every eligible degree at most $64$. The latter computes exact residues of whole Kronecker-coefficient vectors, not floating-point approximations. We prove the soundness of every test and pruning rule used by the programs and include their complete source. Thus the finite computations close specified finite cases rather than impose an unproved threshold on positivity.

Section 2 fixes the common polytabloid conventions and the exact cyclic companion input before either construction begins. Section 8 assembles the candidate, the support tests, and the finite range. Appendices 9 and 10 supply the two proof-critical programs; the accompanying source also contains their independent checking tools.

== 2 Representation-theoretic tools <sec:prelim>

We fix the tensor conventions used by both the coordinate projections and the staircase input. The two transfer mechanisms below are dual polytabloid detection of a constituent and ordinary induction on disjoint position sets.

All representations are finite-dimensional over $bb(C)$. A partition is padded with zeros when needed; $lambda^t$ denotes its conjugate. For partitions of the same integer, $lambda gt.closed.eq mu$ means $sum_(i lt.eq k) lambda_i gt.eq sum_(i lt.eq k) mu_i$ for every $k$. Conjugation reverses dominance. Every symmetric-group representation is semisimple, every Specht module is self-dual, and $S^lambda ⊗ "sgn" tilde.equiv S^(lambda^t)$. We use the standard Specht construction, Young’s rule, branching, Schur–Weyl duality, and the Littlewood–Richardson and Pieri rules [10,6,15]. Their precise consequences needed below are recorded here.

=== 2.1 Alternating blocks and dual tests <alternating-blocks-and-dual-tests>

We realize Specht modules by column alternation and detect constituents by contracting with dual tensors. This viewpoint also underlies Ikenmeyer’s triangular construction [9] Sections 3–5.

Let $B$ be a finite set of positions, and let $E$ have ordered basis $e_1 \, dots.h \, e_D$. For an ordered block $A = \( b_1 \, dots.h \, b_k \)$, $k lt.eq D$, put

$ v_A = sum_(pi in S_k) "sgn" \( pi \) e_(pi \( 1 \)) ⊗ dots.h.c ⊗ e_(pi \( k \)) \, $

with the displayed factors placed at $b_1 \, dots.h \, b_k$. For a set partition $cal(A)$ of $B$, put $v_(cal(A)) = ⨂_(A in cal(A)) v_A$. Changing the order of one block changes only the overall sign. The position action of $S_B$ is the usual permutation of tensor factors; all regroupings of factors are ordinary tensor identifications and add no signs.

If the block sizes are the column lengths of $theta$, then

#[#set math.equation(numbering: n => "(2.1)")
 $ bb(C) \[ S_B \] v_(cal(A)) tilde.equiv S^theta . $ <eq:block-specht>]

Indeed, arrange the blocks as tableau columns, and send a row tabloid to the word assigning letter $i$ to its $i$th row. Column alternation sends its polytabloid to $v_(cal(A))$, which is nonzero because the initial row word has coefficient one. The same construction applies in a dual alphabet; see [10] Definitions 4.1 and 4.3, Theorem 4.12 for the Specht construction and ordinary irreducibility.

#thm([Lemma 2.1.])[
  (Dual-polytabloid test).  #emph[Let $z in E^(⊗ B)$ and $theta tack.r \| B \|$ with at most $D$ rows. Then $S^theta$ occurs in $bb(C) \[ S_B \] z$ if and only if $z$ has a nonzero contraction with a dual block tensor whose blocks are the columns of $theta$, for some placement of the blocks and some common ordered basis of $E^(*)$. If such a contraction exists for a fixed placement, it is nonzero for a generic ordered basis. Finitely many separately nonzero contractions can be made nonzero simultaneously with a common generic basis.]
] <lem:dual-test>

#proof[
  For any fixed basis and placement the orbit of the dual block tensor is a copy of $S^theta$, by (2.1). Restricting the natural tensor pairing gives an equivariant map from $bb(C) \[ S_B \] z$ to the dual of this copy of $S^theta$. A nonzero contraction makes this map nonzero, hence proves the required constituent. Conversely, Schur–Weyl duality [15] Appendix A, (5.5$'$), (5.6), and (8.2) identifies the $theta$-isotypic component with $S^theta ⊗ bb(S)_theta \( E \)$. The symmetric-group translates and common basis changes of one nonzero dual polytabloid span the corresponding full dual isotypic component: each of the two factors is irreducible for its own group. They therefore detect any nonzero $theta$-component of $z$. For a fixed placement, contraction is a polynomial in the entries of the common change-of-basis matrix. A nonzero polynomial remains nonzero on a nonempty Zariski-open subset of $"GL"_D \( bb(C) \)$. The product of finitely many such polynomials is nonzero, proving the final statement. ◻
]

=== 2.2 Support under induction <support-under-induction>

Throughout, combining constituents on disjoint position sets means #emph[ordinary induction] from the product of their symmetric groups, not a Kronecker product. We use $times.square$ for an outer tensor product. Let $c_(alpha \, beta)^gamma$ denote the Littlewood–Richardson coefficient, equivalently the multiplicity of $S^gamma$ in $"Ind" \( S^alpha times.square S^beta \)$. This is the induction form of the LR rule [10] Rule 16.4; its polynomial $"GL"$ counterpart is [15] Appendix A, (6.1). Only support, rather than equality of multiplicities, is required.

#thm([Lemma 2.2.])[
  (Young support).  #emph[For a finite list $A$ of positive integers of sum $n$, the module $"Ind"_(product_(a in A) S_a)^(S_n) upright(bold(1))$ contains exactly the $S^nu$ whose column heights $h_1 gt.eq h_2 gt.eq dots.h.c$ satisfy 
#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(j = 1)^k h_j lt.eq P_A \( k \) := sum_(a in A) min \( k \, a \) #h(2em) \( k gt.eq 1 \) . $ <eq:young-prefix>]

 The constituent indexed by the decreasing rearrangement of $A$ has multiplicity one. A component containing every shape of total $t$ with at most $j$ rows contains the support of the induced-trivial module corresponding to a balanced division of $t$ into $j$ parts.]
] <lem:young-support>

#proof[
  Young’s rule [10] Rule 14.1 says that the support consists of the partitions dominating the decreasing rearrangement of $A$, with diagonal multiplicity one. Transposing dominance gives (2.2). The balanced partition of $t$ into $j$ parts is dominated by every partition of $t$ with at most $j$ rows; conversely, any partition dominating it has at most $j$ rows. Zero parts in a balanced division can be omitted. ◻
]

#thm([Lemma 2.3.])[
  (Horizontal addition).  #emph[If $c_(alpha \, beta)^gamma > 0$ and $c_(alpha' \, beta')^(gamma') > 0$, then 
$ c_(alpha + alpha' \, thin beta + beta')^(gamma + gamma') > 0 \, $

 where addition is rowwise. In particular, suppose a target has column heights $h_i = a_i + b_i$, with $a_i \, b_i gt.eq 0$. Form $alpha$ from the column-height list $\( a_i \)$ and $beta$ from $\( b_i \)$, omitting zeros and sorting each list. Then $c_(alpha \, beta)^gamma > 0$ for the target $gamma$.]
] <lem:lr-addition>

#proof[
  The first assertion is the Littlewood–Richardson semigroup property [18] Theorem 1, applied to the two triples of partitions. For the second assertion, the exterior-power case of Pieri gives $c_(\( 1^(a_i) \) \, \( 1^(b_i) \))^(\( 1^(h_i) \)) > 0$ for each $i$. Add these containments horizontally. A rowwise sum of single-column partitions is exactly the diagram specified by their column-height multiset, so sorting the individual lists changes nothing. ◻
]

We also use two other immediate forms of the LR rule. First, $c_(alpha \, \( t \))^gamma > 0$ precisely when $gamma \/ alpha$ is a horizontal $t$-strip, meaning at most one new cell per column. This is Pieri’s rule [15] Chapter I, (5.16)–(5.17). Second, if $alpha$ fits in a rectangle, its rotated complement $beta$ satisfies $c_(alpha \, beta)^(upright("rectangle")) = 1$. For a rectangle $\( w^j \)$, the complement has parts $beta_i = w - alpha_(j + 1 - i)$, and the Schur-character formula gives $bb(S)_beta \( bb(C)^j \) tilde.equiv det^w ⊗ bb(S)_alpha \( bb(C)^j \)^(*)$ [15] Chapter I, (3.1); Appendix A, (8.2) and (8.4). Since $bb(S)_(\( w^j \)) \( bb(C)^j \) = det^w$, the LR tensor-product rule and Schur’s lemma give the asserted multiplicity one. The zero-area case uses the empty partition, and the stated induction conventions include empty partitions as well.

=== 2.3 The cyclic staircase input <the-cyclic-staircase-input>

For $m gt.eq 1$, set

$ B_m = { \( i \, j \) in bb(Z)_(gt.eq 1)^2 : i + j lt.eq m + 1 } \, #h(2em) N_m = frac(m \( m + 1 \), 2) \, #h(2em) rho_m = \( m \, m - 1 \, dots.h \, 1 \) . $

Let $R_m$ and $C_m$ be the actual row and column set partitions of $B_m$. Order each row by increasing $j$ and each column by increasing $i$. In each tensor layer use the ordered alphabet $e_1 \, dots.h \, e_m$. With the unnormalized initial-letter alternations defined above, set

#[#set math.equation(numbering: n => "(2.3)")
 $ w_m = v_(R_m) ⊗ v_(C_m) \, #h(2em) W_m = bb(C) \[ S_(B_m) \] w_m subset.eq S^(rho_m) ⊗ S^(rho_m) . $ <eq:cyclic-generator>]

The action in (2.3) is diagonal.

#thm([Theorem 2.4.])[
  (Cyclic staircase support, [16] Theorem 3.1).  #emph[For every $m gt.eq 1$ and every $alpha tack.r N_m$, the irreducible $S^alpha$ occurs in the particular cyclic module $W_m$ of (2.3).]
] <thm:cyclic-input>

The complete proof is given in Section 6 of the companion [16], with the same ordered row and column blocks as here. The bibliography records the separate preprint’s stable article identifier. It is important that the theorem concerns the specified row/column generator, not merely the ambient staircase square. Common relabelings of the two ordered alphabets and changes of block orders preserve the assertion.

== 3 A fixed self-conjugate candidate <sec:candidate>

We now choose one diagram for the degree, before fixing a desired constituent. The construction preserves self-conjugacy by attaching transpose-matched cells to a staircase; its parameter bounds will later make the two support tests exhaustive.

Set $N_0 = 0$ and choose the largest nonnegative $M$ for which $N_M lt.eq n$ and $N_M equiv n med \( mod med 2 \)$, and put

#[#set math.equation(numbering: n => "(3.1)")
 $ r = frac(n - N_M, 2) \, #h(2em) b = ⌊r / 2⌋ \, #h(2em) s = 1 + \( r med mod med 2 \) \, #h(2em) K = 2 M - 1 . $ <eq:parameters>]

Only $M gt.eq 9$ will be used in this construction; smaller degrees will be treated separately.

#thm([Lemma 3.1.])[
  #emph[The parameters satisfy 
#[#set math.equation(numbering: n => "(3.2)")
 $ r lt.eq cases(delim: "{", \( M - 1 \) \/ 2 \, & M upright(" odd") \,, 3 M \/ 2 + 2 \, & M upright(" even") .) $ <eq:r-bounds>]

 For $M gt.eq 9$, the partition with column lengths 
#[#set math.equation(numbering: n => "(3.3)")
 $ L = \( M + b + s - 1 \, med M - 1 + b \, med M - 2 \, M - 3 \, dots.h \, 3 \, med 2^(b + 1) \, med 1^s \) $ <eq:candidate>]

 is self-conjugate and has size $n$. Consequently the support of $S^L ⊗ S^L$ is invariant under transposition of the target. If no parity-compatible $M gt.eq 9$ is available, then $n lt.eq 64$.]
] <lem:candidate>

#proof[
  If $M$ is odd, the next triangular number of the same parity is $N_(M + 1)$, with difference $M + 1$. Maximality gives $2 r lt.eq M - 1$. If $M$ is even, the next such number is $N_(M + 3)$, with difference $3 M + 6$, giving $2 r lt.eq 3 M + 4$.
  Relative to the staircase, the increments to the first two columns sum to $2 b + s - 1$, and the added short columns have the same total. Thus the size increases by $4 b + 2 s - 2 = 2 r$. There are $M + b + s - 1$ columns in total and $M + b - 1$ columns of height at least two. Counting those of height at least $j$ for $j gt.eq 3$ gives successively $M - 2 \, M - 3 \, dots.h \, 3$, followed by $b + 1$ twos and $s$ ones. These are exactly the column lengths in (3.3), so $L = L^t$. It follows that
  $ \( S^L ⊗ S^L \) ⊗ "sgn" tilde.equiv S^L ⊗ \( S^L ⊗ "sgn" \) tilde.equiv S^L ⊗ S^L . $
  Finally, every odd $n gt.eq 45 = N_9$ admits a parity-compatible index at least nine, and every even $n gt.eq 66 = N_11$ admits one at least eleven. The remaining degrees are at most $64$. ◻
]

Figure 1 shows the matched additions in a small instance. The path-incidence picture in Figure 2 will describe a different decomposition of the same construction.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (0.31, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, 0), (0.31, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, 0), (0.62, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, 0), (0.62, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, 0), (0.93, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.62, 0), (0.93, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.93, 0), (1.24, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.93, 0), (1.24, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.24, 0), (1.55, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.24, 0), (1.55, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.55, 0), (1.86, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.55, 0), (1.86, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.86, 0), (2.17, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.86, 0), (2.17, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((2.17, 0), (2.48, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((2.17, 0), (2.48, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((2.48, 0), (2.79, -0.31), fill: rgb("#d9d9ff"), stroke: none)
  rect((2.48, 0), (2.79, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((2.79, 0), (3.1, -0.31), fill: rgb("#ffc68c"), stroke: none)
  rect((2.79, 0), (3.1, -0.31), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -0.31), (0.31, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -0.31), (0.31, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -0.31), (0.62, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, -0.31), (0.62, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -0.31), (0.93, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.62, -0.31), (0.93, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.93, -0.31), (1.24, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.93, -0.31), (1.24, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.24, -0.31), (1.55, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.24, -0.31), (1.55, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.55, -0.31), (1.86, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.55, -0.31), (1.86, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.86, -0.31), (2.17, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.86, -0.31), (2.17, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((2.17, -0.31), (2.48, -0.62), fill: rgb("#d9d9ff"), stroke: none)
  rect((2.17, -0.31), (2.48, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((2.48, -0.31), (2.79, -0.62), fill: rgb("#ffc68c"), stroke: none)
  rect((2.48, -0.31), (2.79, -0.62), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -0.62), (0.31, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -0.62), (0.31, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -0.62), (0.62, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, -0.62), (0.62, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -0.62), (0.93, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.62, -0.62), (0.93, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.93, -0.62), (1.24, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.93, -0.62), (1.24, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.24, -0.62), (1.55, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.24, -0.62), (1.55, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.55, -0.62), (1.86, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.55, -0.62), (1.86, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.86, -0.62), (2.17, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.86, -0.62), (2.17, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -0.93), (0.31, -1.24), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -0.93), (0.31, -1.24), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -0.93), (0.62, -1.24), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, -0.93), (0.62, -1.24), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -0.93), (0.93, -1.24), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.62, -0.93), (0.93, -1.24), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.93, -0.93), (1.24, -1.24), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.93, -0.93), (1.24, -1.24), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.24, -0.93), (1.55, -1.24), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.24, -0.93), (1.55, -1.24), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.55, -0.93), (1.86, -1.24), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.55, -0.93), (1.86, -1.24), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -1.24), (0.31, -1.55), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -1.24), (0.31, -1.55), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -1.24), (0.62, -1.55), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, -1.24), (0.62, -1.55), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -1.24), (0.93, -1.55), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.62, -1.24), (0.93, -1.55), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.93, -1.24), (1.24, -1.55), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.93, -1.24), (1.24, -1.55), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.24, -1.24), (1.55, -1.55), fill: rgb("#d9d9ff"), stroke: none)
  rect((1.24, -1.24), (1.55, -1.55), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -1.55), (0.31, -1.86), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -1.55), (0.31, -1.86), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -1.55), (0.62, -1.86), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, -1.55), (0.62, -1.86), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -1.55), (0.93, -1.86), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.62, -1.55), (0.93, -1.86), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.93, -1.55), (1.24, -1.86), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.93, -1.55), (1.24, -1.86), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -1.86), (0.31, -2.17), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -1.86), (0.31, -2.17), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -1.86), (0.62, -2.17), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, -1.86), (0.62, -2.17), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -1.86), (0.93, -2.17), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.62, -1.86), (0.93, -2.17), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -2.17), (0.31, -2.48), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -2.17), (0.31, -2.48), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -2.17), (0.62, -2.48), fill: rgb("#d9d9ff"), stroke: none)
  rect((0.31, -2.17), (0.62, -2.48), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -2.48), (0.31, -2.79), fill: rgb("#d9d9ff"), stroke: none)
  rect((0, -2.48), (0.31, -2.79), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0.31, -2.48), (0.62, -2.79), fill: rgb("#ffc68c"), stroke: none)
  rect((0.31, -2.48), (0.62, -2.79), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((0, -2.79), (0.31, -3.1), fill: rgb("#ffc68c"), stroke: none)
  rect((0, -2.79), (0.31, -3.1), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((3.72, -0.62), (4.03, -0.93), fill: rgb("#d9d9ff"), stroke: none)
  rect((3.72, -0.62), (4.03, -0.93), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((4.185, -0.775), [#text(size: 9pt)[staircase $rho_9$]], anchor: "west", padding: 0.1176cm)
  rect((3.72, -1.24), (4.03, -1.55), fill: rgb("#ffc68c"), stroke: none)
  rect((3.72, -1.24), (4.03, -1.55), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((4.185, -1.395), [#text(size: 9pt)[matched additions]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The degree-$49$ candidate with $M = 9$, $r = 2$, $b = 1$, and $s = 1$. Its row and column lengths are both $\( 10 \, 9 \, 7 \, 6 \, 5 \, 4 \, 3 \, 2 \, 2 \, 1 \)$. The four added cells come in transposed pairs, preserving self-conjugacy. ],
) <fig:candidate>

When $r = 0$, the candidate is the staircase itself, and Theorem 6 already supplies all constituents. For $r > 0$ we give two sufficient support tests. For a target $nu$, write its column heights and row lengths as

$ h = \( h_1 \, h_2 \, dots.h \) = nu^t \, #h(2em) w = \( w_1 \, w_2 \, dots.h \) = nu \, $

with zeros appended. Both tests refer to the single square $S^L ⊗ S^L$ fixed above. We are free to interchange $h$ and $w$ by Lemma 7.

The coverage has four steps. A small first-four row or column sum is handled by Proposition 21. Otherwise the band criterion covers every $M gt.eq 22$ and all intermediate parameters apart from the nineteen pairs in (6.5); the exact capacity check handles those pairs. Proposition 30 handles all eligible degrees at most $64$, completing the small-index remainder. The two finite checks thus have separate, explicitly bounded roles.

== 4 The band criterion <sec:band>

We use the parameters and the self-conjugate diagram $L$ from (3.3), and write $K = 2 M - 1$. In particular, $r = 2 b + s - 1$. The following criterion supplies constituents whose diagrams have enough room for a path and its two attachments.

#thm([Proposition 4.1.])[
  (Band criterion).  #emph[Let $M gt.eq 9$, and let $lambda tack.r \| L \|$ have column heights $h_1 gt.eq h_2 gt.eq dots.h.c$ and row lengths $w_1 gt.eq w_2 gt.eq dots.h.c$, with zeros appended. Suppose that integers $d \, q$ satisfy $1 lt.eq d lt.eq 4$, $0 lt.eq q lt.eq 8$, and 
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(i = 1)^d w_i gt.eq K \, #h(2em) d q + 7 + d lt.eq K \, #h(2em) sum_(i = 1)^q max (0 \, ⌊frac(h_i - d, 2)⌋) gt.eq r . $ <eq:band-criterion>]

 Then $S^lambda$ occurs in $S^L ⊗ S^L$.]
] <prop:band-test>

The three inequalities have separate roles: the first gives room for the path, the second reserves space at its endpoints, and the third provides the even column heights needed for the attachments. We first force the smaller cyclic triangle, then find nonzero path and attachment contractions, and finally show that they combine without cancellation. All alternating tensors use the conventions of Section 2; changing the order of a block changes only its overall sign.

=== 4.1 A forced triangle and a full induced quotient <a-forced-triangle-and-a-full-induced-quotient>

We first record the elementary induction fact used here and in the balance constructions. It is the coordinate-sector principle of [16] Section 4, applied to the marked alphabets of the enlarged diagram.

#thm([Lemma 4.2.])[
  (Induction from coordinate sectors).  #emph[Let a finite group $G$ act transitively on a finite set $Omega$. Suppose a $G$-module has a direct-sum decomposition $T = xor.big_(A in Omega) T_A$ with $g T_A = T_(g A)$. Fix $D in Omega$, let $H$ be its stabilizer, and let $z in T_D$. Writing $A_0 = bb(C) \[ H \] z$, the map 
$ bb(C) \[ G \] ⊗_(bb(C) \[ H \]) A_0 arrow.r bb(C) \[ G \] z \, #h(2em) g ⊗ a mapsto g a \, $

 is an isomorphism. In particular, the cyclic module on the right is the full induced module $"Ind"_H^G A_0$.]
] <lem:sector-induction>

#proof[
  Choose one representative $g_A$ with $g_A D = A$ for each $A in Omega$. The source is the direct sum of the spaces $g_A ⊗ A_0$. Their images are $g_A A_0 subset.eq T_A$, so the images for distinct $A$ are linearly independent. On each summand the displayed map is injective, since $g_A$ acts invertibly. Its image contains every translate of $z$, proving surjectivity as well. ◻
]

Regard $L$ as its set $B$ of cells, with rows and columns indexed from one. Let $v_R \, v_C$ be the alternating block tensors for its rows and columns, respectively, and put

$ W_L = bb(C) \[ S_B \] \( v_R ⊗ v_C \) . $

Both factors have type $L$, since $L$ is self-conjugate; hence $W_L subset.eq S^L ⊗ S^L$ after choosing the Specht identifications. Let

$ D = { \( i \, j \) : i \, j gt.eq 1 \, med i + j lt.eq M - 1 } \, #h(2em) F = B \\ D . $

Thus $D$ is the staircase of order $M - 2$, and $\| F \| = K + 2 r$.

#thm([Lemma 4.3.])[
  (Triangle quotient).  #emph[There is a quotient of $W_L$ isomorphic to 
#[#set math.equation(numbering: n => "(4.2)")
 $ "Ind"_(S_D times S_F)^(S_B) \( W_(M - 2) times.square U_F \) \, $ <eq:band-triangle-quotient>]

 where $W_(M - 2)$ is the specified cyclic module in Theorem 6. The module $U_F$ is generated by the row and column block alternations on $F$, using an initial alphabet on every remaining block. Consequently, it suffices to find a diagram $mu subset.eq lambda$ of size $\| F \|$ such that $S^mu$ occurs in $U_F$.]
] <band:triangle-quotient>

#proof[
  Set $ell = M + b + s - 1$, the largest row and column length of $L$. The triangle $D$ has $t_i = max \( M - 1 - i \, 0 \)$ cells in row $i$ and in column $i$. We will give each full row and column block exactly this number of marked letters. In each of the two alphabets $1 \, dots.h \, ell$, mark precisely
  $ { 3 \, 4 \, dots.h \, M - 1 } union { M + b } . $
  There are $M - 2$ marked letters. The number of marked letters in the initial alphabet of row or column $i$ is indeed $t_i$: for the two largest blocks these counts are $M - 2 \, M - 3$, and thereafter they are $M - 4 \, M - 5 \, dots.h \, 1 \, 0 \, dots.h$. The ordered unmarked alphabet is $\( 1 \, 2 \, M \, dots.h \, M + b - 1 \)$, followed by $M + b + 1$ if $s = 2$. The interval $M \, dots.h \, M + b - 1$ is empty when $b = 0$; in this case the marked alphabet is $\( 3 \, dots.h \, M \)$ and the unmarked alphabet is $\( 1 \, 2 \)$ or $\( 1 \, 2 \, M + 1 \)$, respectively. In every case each block inherits an initial list in each of these two ordered alphabets. Project the pair-letter tensor space by retaining only those words whose two letters at every position have the same marking status. The projection commutes with permutations of positions.
  For any retained term of $v_R ⊗ v_C$, the set $A$ of marked positions has row and column margins $\( t_i \)$. For every $k$,
  $ sum_(i = 1)^k t_i = sum_j min \( k \, t_j \) . $
  Column $j$ can place at most $min \( k \, t_j \)$ marked cells in the first $k$ rows. Equality of the sums therefore gives equality in every column. Taking $k = t_j$ shows that, when $t_j > 0$, all its marked cells occupy the first $t_j$ rows. Hence $A = D$.
  Within each row or column block, the marked and unmarked positions are now fixed. Expanding that block’s alternation gives the tensor product of its marked and unmarked alternations, multiplied by one fixed shuffle sign. The two alphabets, each in its inherited order, have initial lists on every block. Thus, up to an overall sign, the projected generator is
  $ w_(M - 2) ⊗ u_F \, $
  where $w_(M - 2)$ is exactly the row-column generator of Theorem 6, with its ordered alphabet relabeled, and $u_F$ is the generator described in the statement. The stabilizer $S_D times S_F$ generates $W_(M - 2) times.square U_F$ from this tensor. To specify the sectors, let $V_(upright("mark"))$ and $V_(upright("unmark"))$ be the pair-letter spaces in which both letters are marked or both are unmarked, respectively. For $A subset.eq B$ with $\| A \| = \| D \|$, put
  $ T_A = V_(upright("mark"))^(⊗ A) ⊗ V_(upright("unmark"))^(⊗ \( B \\ A \)) . $
  These spaces have disjoint word bases, and $g T_A = T_(g A)$. Lemma 9 therefore identifies the entire projected cyclic image with the full induced module in (4.2), not merely with one of its quotients.
  For the last assertion, suppose $mu subset.eq lambda$. Iterated branching implies that $S^mu$ occurs on restriction of $S^lambda$ to $S_F$. Decompose $"Res"_(S_D times S_F)^(S_B) S^lambda$ and then forget the $S_D$ action. The occurrence just noted implies that some $alpha tack.r \| D \|$ satisfies $c_(alpha \, mu)^lambda > 0$. Theorem 6 supplies $S^alpha$ in $W_(M - 2)$. Thus $S^lambda$ occurs in the induced module in (4.2), and hence in $W_L$ by complete reducibility. ◻
]

=== 4.2 The path and its two attachments <the-path-and-its-two-attachments>

Write $delta = s - 1 in { 0 \, 1 }$ and $E = \( b + delta \, b \)$, omitting zero parts. Each copy of $E$ has area $r$. To decompose $F$, start with the boundary cells $i + j = M$ or $M + 1$ in the staircase $B_M$. They form a width-two path of length $K$. Move its endpoint singletons from $\( M \, 1 \)$ and $\( 1 \, M \)$ to $\( ell \, 1 \)$ and $\( 1 \, ell \)$, respectively. More precisely, the resulting path positions are $p_1 \, dots.h \, p_K$, where

$ p_1 & = \( ell \, 1 \) \, & p_K & = \( 1 \, ell \) \,\
p_(2 j) & = \( M - j \, j \) &  & \( 1 lt.eq j < M \) \,\
p_(2 j - 1) & = \( M + 1 - j \, j \) &  & \( 2 lt.eq j < M \) . $

The northeastern attachment is

$ E_(+) = { \( 1 \, j \) : M lt.eq j lt.eq ell - 1 } union { \( 2 \, j \) : M lt.eq j lt.eq M + b - 1 } \, $

with an interval interpreted as empty when its upper endpoint is smaller than its lower endpoint. Let $E_(-)$ be its transpose. These sets are pairwise disjoint and exhaust $F$. The attachment $E_(+)$ has shape $E$, and $E_(-)$ has the transposed incidence pattern.

Along the path, the column pairs are $\( p_1 \, p_2 \) \, \( p_3 \, p_4 \) \, dots.h \, \( p_(K - 2) \, p_(K - 1) \)$, with a column singleton at $p_K$. The row pairs are $\( p_2 \, p_3 \) \, \( p_4 \, p_5 \) \, dots.h \, \( p_(K - 1) \, p_K \)$, with a row singleton at $p_1$. Only the first two column pairs and the last two row pairs belong to blocks extended by attachment cells.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.05997, fill: black, stroke: none)
  content((0, -0.1411), [#text(size: 9pt)[$p_1$]], anchor: "north", padding: 0.1176cm)
  circle((1.105, 0), radius: 0.05997, fill: black, stroke: none)
  content((1.105, -0.1411), [#text(size: 9pt)[$p_2$]], anchor: "north", padding: 0.1176cm)
  circle((2.21, 0), radius: 0.05997, fill: black, stroke: none)
  content((2.21, -0.1411), [#text(size: 9pt)[$p_3$]], anchor: "north", padding: 0.1176cm)
  circle((3.315, 0), radius: 0.05997, fill: black, stroke: none)
  content((3.315, -0.1411), [#text(size: 9pt)[$p_4$]], anchor: "north", padding: 0.1176cm)
  circle((5.85, 0), radius: 0.05997, fill: black, stroke: none)
  content((5.85, -0.1411), [#text(size: 9pt)[${p_(K-3)}$]], anchor: "north", padding: 0.1176cm)
  circle((6.955, 0), radius: 0.05997, fill: black, stroke: none)
  content((6.955, -0.1411), [#text(size: 9pt)[${p_(K-2)}$]], anchor: "north", padding: 0.1176cm)
  circle((8.06, 0), radius: 0.05997, fill: black, stroke: none)
  content((8.06, -0.1411), [#text(size: 9pt)[${p_(K-1)}$]], anchor: "north", padding: 0.1176cm)
  circle((9.165, 0), radius: 0.05997, fill: black, stroke: none)
  content((9.165, -0.1411), [#text(size: 9pt)[$p_K$]], anchor: "north", padding: 0.1176cm)
  line((0, 0), (1.105, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.105, 0), (2.21, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((2.21, 0), (3.315, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.315, 0), (3.965, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((4.576, 0), [#text(size: 9pt)[$dots.h$]])
  line((5.2, 0), (5.85, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.85, 0), (6.955, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((6.955, 0), (8.06, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.06, 0), (9.165, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((1.657, 1.45), [#text(size: 9pt)[$E_-=E_+^t$#linebreak()column attachments]])
  line((1.657, 1.006), (0.5525, 0.17), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.657, 1.006), (2.763, 0.17), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.508, 1.45), [#text(size: 9pt)[$E_+ tilde.equiv (b+ delta ,b)$#linebreak()row attachments]])
  line((7.508, 1.012), (6.402, 0.17), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.508, 1.012), (8.613, 0.17), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.583, -1.02), [#text(size: 9pt)[solid: column pairs dashed: row pairs]])
})],
  caption: [Figure 2: Block-incidence schematic for $F$. Each attachment extends the two indicated pair blocks by $b + delta$ and $b$ cells, respectively (at the right, the outer pair receives $b + delta$). The displayed coordinates $p_i$ are defined in the text; the drawing is not a geometric placement of the Young diagram. Every path position outside its first and last four belongs only to unextended blocks. ],
) <fig:band-attachments>

Relabel the unmarked alphabet in increasing order, starting at one. Let $P$ be the four-dimensional pair-letter space spanned by $e_a ⊗ e_c$ with $a \, c lt.eq 2$. Let

$ X_(+) = "span" { e_a ⊗ e_c : a > 2 \, med c lt.eq 2 } \, #h(2em) X_(-) = "span" { e_a ⊗ e_c : a lt.eq 2 \, med c > 2 } \, #h(2em) X = X_(+) xor X_(-) . $

Only letters available in the complement alphabet are included in these spans. There are $b + delta$ letters above two, so

$ dim X = 4 \( b + delta \) gt.eq 4 b + 2 delta = 2 r . $

In particular, every extra diagram of size $2 r$ fits this actual alphabet; when $r = 0$, both the diagram and $X$ are empty. No cell of $F$ is simultaneously in one of its two long rows and one of its two long columns, so every pair letter in $u_F$ lies in $P xor X$.

#thm([Lemma 4.4.])[
  (Separated contraction).  #emph[Retain from $u_F$ only terms using $P$ on the path, $X_(+)$ on $E_(+)$, and $X_(-)$ on $E_(-)$. The resulting tensor is, up to one nonzero overall sign, 
#[#set math.equation(numbering: n => "(4.3)")
 $ u_(upright("path")) ⊗ z_(+) ⊗ z_(-) . $ <eq:band-separated>]

 Here $u_(upright("path"))$ is the product of the two path block alternations, with both endpoint singleton letters equal to one. The tensors $z_(+) \, z_(-)$ are the row-column alternating generators for the two copies of $E$, with the long-block index shifted by two and the two tensor layers interchanged for $E_(-)$.]
] <band:separated>

#proof[
  In each extended block its two path positions must take its low letters $1 \, 2$, while its extra positions must take all remaining letters. These are prescribed sets of positions. The alternation therefore splits into an independent alternation on each set, with a fixed shuffle sign. Every other block belongs entirely to the path or to one attachment. Multiplying these factorizations proves (4.3). ◻
]

The selection in Lemma 11 refers to fixed regions of $F$ and need not commute with position permutations. We will use the factorization inside a dual-polytabloid contraction: the endpoint placement in the final proof will force precisely these selected terms to survive.

=== 4.3 Contractions on an odd path <contractions-on-an-odd-path>

For $t gt.eq 0$, Brown, van Willigenburg, and Zabrocki [4] Corollary 4.1 proved that the square of $S^(\( t + 1 \, t \))$ contains exactly the partitions of $2 t + 1$ with at most four rows, each with multiplicity one. We need this support in a specified cyclic path tensor, with any consecutive placement of the dual columns. The following proof extends the explicit contraction in [16] Section 5 to every odd length, including a single position, and gives the common-basis conclusion needed for several paths at once in the balance constructions.

#thm([Lemma 4.5.])[
  (Odd-path support).  #emph[Let $k = 2 t + 1$ with $t gt.eq 0$. On positions $1 \, dots.h \, k$, put alternating pairs in the first layer on $\( 2 \, 3 \) \, \( 4 \, 5 \) \, dots.h \, \( k - 1 \, k \)$ and the singleton letter $1$ at position $1$. In the second layer put alternating pairs on $\( 1 \, 2 \) \, \( 3 \, 4 \) \, dots.h \, \( k - 2 \, k - 1 \)$ and the singleton letter $1$ at position $k$. Denote the resulting pair-letter tensor by $u$.]
  #emph[For every ordered list $a_1 \, dots.h \, a_c$ with $1 lt.eq a_i lt.eq 4$ and $sum_i a_i = k$, place the columns of a dual polytabloid consecutively along the path with these lengths. There is a common ordered basis of $"Mat"_2 \( bb(C) \)$ for which its contraction with $u$ is nonzero. In particular, the cyclic span of $u$ contains every partition of $k$ with at most four rows. For any finite collection of such paths and ordered column lists, one common generic basis makes all their contractions nonzero.]
] <band:path-support>

#proof[
  Identify a pair-letter covector with a matrix $Y$ by evaluation $Y \( e_a ⊗ e_c \) = Y_(a c)$, and put
  $ J = mat(delim: "(", 0, 1; - 1, 0) . $
  Expanding the pair alternations and successively contracting the indices along the path gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ chevron.l u \, Y_1 ⊗ dots.h.c ⊗ Y_k chevron.r & = #scale(x: 120%, y: 120%)[\[] Y_1 J Y_2^(sans(T)) J Y_3 dots.h.c J Y_(k - 1)^(sans(T)) J Y_k #scale(x: 120%, y: 120%)[\]]_11\
 & = \( - 1 \)^t #scale(x: 120%, y: 120%)[\[] Y_1 "adj" \( Y_2 \) Y_3 dots.h.c "adj" \( Y_(k - 1) \) Y_k #scale(x: 120%, y: 120%)[\]]_11 \, $ <eq:band-path-contraction>]
  because $J Y^(sans(T)) J = - "adj" \( Y \)$ for a two-by-two matrix. The formula also holds for $k = 1$, with no intervening factors.
  Use the ordered matrix basis
  $ M_1 = I \, #h(2em) M_2 = Z = mat(delim: "(", 1, 0; 0, - 1) \, #h(2em) M_3 = T = mat(delim: "(", 0, 1; 1, 0) \, #h(2em) M_4 = J = Z T . $
  The last three matrices are traceless, invertible, and pairwise anticommuting. Adjugation fixes $I$ and negates the other three. For a segment of length $a lt.eq 4$ beginning at global position $p$, write $D_j \( Y \) = Y$ for odd $j$ and $D_j \( Y \) = "adj" \( Y \)$ for even $j$. Its alternated matrix is
  $ A_(a \, p) = sum_(pi in S_a) "sgn" \( pi \) D_p \( M_(pi \( 1 \)) \) dots.h.c D_(p + a - 1) \( M_(pi \( a \)) \) . $
  Let $e$ be the number of even positions in this segment, and let $epsilon.alt = 1$ when $p$ is even and $epsilon.alt = 0$ otherwise. Then
  #[#set math.equation(numbering: n => "(4.5)")
   $ A_(a \, p) = a ! \( - 1 \)^(e - epsilon.alt) M_1 dots.h.c M_a . $ <eq:band-segment>]
  Indeed, if $I$ occupies the local slot $j$, moving it there contributes $\( - 1 \)^(j - 1)$ to the permutation sign, while reordering all remaining matrices contributes precisely their permutation sign by anticommutation. The adjugations contribute $\( - 1 \)^(e - epsilon.alt_j)$, where $epsilon.alt_j$ records whether $p + j - 1$ is even. Since $epsilon.alt_j equiv epsilon.alt + j - 1 med \( mod med 2 \)$, the total sign is $\( - 1 \)^(e - epsilon.alt)$ for every summand. This proves (4.5), whose right side is invertible. For example, at length three the formula gives $- 6 J$ for both starting parities: the canonical product is $I Z T = J$, and $e - epsilon.alt = 1$ in either case.
  Consequently, alternating independently within the prescribed consecutive segments in (4.4) gives $\( - 1 \)^t \[ B \]_11$, where $B$ is the ordered product of their invertible matrices $A_(a \, p)$. Choose an eigenvector of $B$ with nonzero eigenvalue $beta$, and a matrix $Q in "GL"_2 \( bb(C) \)$ taking it to the first coordinate vector. Replace every $M_i$ by $Q M_i Q^(- 1)$. Since adjugation commutes with conjugation, the new contraction is $\( - 1 \)^t \[ Q B Q^(- 1) \]_11 = \( - 1 \)^t beta eq.not 0$. The endpoint letters of $u$ have remained fixed throughout.
  The dual tensor is a polytabloid for the partition with the specified column lengths, regardless of their order along the path. Lemma 3 proves the support assertion. For any one placement its contraction is a polynomial in the entries of the common basis and is not identically zero by what we just proved. The nonvanishing loci of finitely many such polynomials have nonempty intersection with the open set of ordered bases, since $"GL"_4 \( bb(C) \)$ is irreducible. This proves the last assertion. ◻
]

=== 4.4 The support of the two extra copies <the-support-of-the-two-extra-copies>

The path supplies the four-row component. We now determine enough support in each attachment to supply every even-column diagram required by the last inequality of Proposition 8. The first step adapts the signed-average argument of [16] Section 3 to the two-row attachment.

#thm([Lemma 4.6.])[
  (One extra copy).  #emph[Let $E = \( b + delta \, b \)$, where $b gt.eq 0$ and $delta in { 0 \, 1 }$, and let $Z_E$ be the cyclic span of its row-column alternating generator. The sign twist $Z_E ⊗ "sgn"$ contains every partition $alpha tack.r 2 b + delta$ with at most four rows such that all its row lengths are even when $delta = 0$, or exactly one row length is odd when $delta = 1$.]
] <band:one-extra>

#proof[
  The empty diagram is immediate, so assume $\| E \| > 0$. Let $p$ be its short-column alternating vector and $v$ its long-row alternating vector. These generate Specht modules of types $E$ and $E^t$, respectively; denote them by $V_p$ and $V_v$. Put $G = S_(\| E \|)$ and $epsilon = "sgn"$. Let $H$ permute positions within each short column, so that $h p = "sgn" \( h \) p$. Signed averaging of the product gives
  $ sum_(h in H) "sgn" \( h \) h \( v ⊗ p \) = (sum_(h in H) h v) ⊗ p . $
  The first factor $v_0 = sum_(h in H) h v$ is nonzero. In fact the word assigning letter $j$ to every cell of short column $j$ is fixed by $H$ and has coefficient one in the row alternation $v$, so its coefficient in $v_0$ is $\| H \|$.
  Choose an abstract $G$-isomorphism $phi.alt : V_v ⊗ epsilon arrow.r V_p$, which exists by sign conjugacy. The $H$-alternating line of $V_p$ is unique:
  $ dim "Hom"_H \( epsilon \|_H \, "Res"_H^G V_p \) & = dim "Hom"_G \( "Ind"_H^G epsilon \|_H \, V_p \)\
 & = dim "Hom"_G \( "Ind"_H^G upright(bold(1)) \, V_p ⊗ epsilon \)\
 & = 1 . $
  For the last equality, $H$ has block sizes given by $E^t$, and $V_p ⊗ epsilon tilde.equiv S^(E^t)$; this is the diagonal multiplicity in Lemma 4. Since $v_0$ is $H$-fixed, $phi.alt \( v_0 ⊗ zeta \) = c p$ for a nonzero sign-module vector $zeta$ and some $c eq.not 0$. Reassociating the sign twist into the first factor and then applying $phi.alt ⊗ upright("id")$ identifies $\( V_v ⊗ V_p \) ⊗ epsilon$ with $V_p ⊗ V_p$. The image of $Z_E ⊗ epsilon$ contains $c p ⊗ p$, so it contains the cyclic span of $p ⊗ p$.
  This is an isomorphism of abstract symmetric-group modules; it does not change the physical long alphabet into a two-letter alphabet. It proves a support inclusion for the original attachment module. The subsequent contraction calculation may therefore be made in the convenient realization of $p ⊗ p$ on two copies of a two-dimensional alphabet.
  Regroup the latter tensor by positions. Each repeated short pair is the symmetric tensor
  #[#set math.equation(numbering: n => "(4.6)")
   $ H_0 = e_11 ⊗ e_22 + e_22 ⊗ e_11 - e_12 ⊗ e_21 - e_21 ⊗ e_12 $ <eq:band-pair-form>]
  on the four-dimensional space with basis $e_(a c) = e_a ⊗ e_c$. It is nondegenerate. If $delta = 1$, there is also the singleton vector $v_(*) = e_11$.
  Suppose first that $alpha$ has even rows. Pair adjacent columns of its dual tableau; the two columns in each pair have equal height. Place the $b$ position pairs of $H_0^(⊗ b)$ across corresponding rows of these paired columns. Choose an orthonormal basis of covectors for the form $H_0$. In any nonzero term of the dual column alternations, the two permutations on a paired column pair must match. Their signs therefore multiply to one. A paired column pair of height $a$ contributes $a !$, so the entire contraction is nonzero.
  When $alpha$ has exactly one odd row, adjacent columns have equal heights except for a single paired column pair of heights $a \, a - 1$. Put the singleton at the bottom of its longer column and place the remaining position pairs across corresponding rows. In that exceptional pair, matching the other covectors forces the singleton to receive the $a$th basis covector. The contribution is $\( a - 1 \) !$ times its evaluation on $v_(*)$. Choose the orthonormal basis so that this evaluation is nonzero; this is possible since $v_(*) eq.not 0$, by permuting the members of any orthonormal basis if necessary. The covectors span the dual space, so at least one evaluates nontrivially on $v_(*)$. The other column pairs contribute their positive factorials as before. Thus this contraction is also nonzero. The height bound four ensures that all covectors used belong to the available basis. Lemma 3 completes the proof. ◻
]

#thm([Lemma 4.7.])[
  (Two extra copies).  #emph[The cyclic span of $z_(+) ⊗ z_(-)$ on $E_(+) union.sq E_(-)$ contains every diagram $eta tack.r 2 r$ whose column heights are even and whose number of columns is at most eight.]
] <band:two-extras>

#proof[
  The alphabets $X_(+)$ and $X_(-)$ are disjoint. The same coordinate sector argument as in Lemma 9 identifies this cyclic module with the full induction of the two local cyclic modules. Transposing $E$ merely interchanges its two tensor layers, so both local modules are isomorphic to $Z_E$.
  Put $theta = eta^t$. Its rows have even lengths and there are at most eight of them. Group its columns in adjacent pairs, and let $j_1 \, dots.h \, j_a lt.eq 8$ be the heights of those double columns. Thus
  $ theta = \( 2^(j_1) \) + dots.h.c + \( 2^(j_a) \) \, #h(2em) j_1 + dots.h.c + j_a = r \, $
  where addition of diagrams is rowwise. For each $j$, splitting its height as $j = u + v$ gives
  $ c_(\( 2^u \) \, \( 2^v \))^(\( 2^j \)) > 0 . $
  Indeed the corresponding single-column coefficient is positive, and Lemma 5 applies twice. Choose $u = floor.l j \/ 2 floor.r$, $v = ceil.l j \/ 2 ceil.r$, allowing their interchange. Both are at most four.
  If $r$ is even, the number of odd $j_i$ is even. Alternate the orientation of the split on these odd heights. The resulting two rowwise sums $alpha \, beta$ each have size $r$, at most four rows, and all row lengths even. Repeated use of Lemma 5 gives $c_(alpha \, beta)^theta > 0$.
  If $r$ is odd, reserve one odd height $j = 2 k + 1$. For this double column take the two equal-area shapes
  $ kappa = \( 2^k \, 1 \) \, #h(2em) c_(kappa \, kappa)^(\( 2^(2 k + 1) \)) > 0 . $
  The displayed coefficient follows from rectangle complement duality in the Littlewood–Richardson rule, since $kappa$ is its own rotated complement in this rectangle. Equivalently, fill the single remaining cell in row $k + 1$ by $1$, and in each later row $k + t$, for $2 lt.eq t lt.eq k + 1$, put $t - 1 \, t$ from left to right. This is a Littlewood–Richardson filling with content $kappa$, including the case $k = 0$. There are now an even number of odd heights left; alternate their orientations as above. Their combined area is $2 \( r - j \)$, and the balanced split gives $r - j$ cells to each factor; the reserved copy of $kappa$ adds $j$ cells to each. Each final factor thus has size $r$, at most four rows, and exactly one odd row, since the remaining rowwise summands have only even rows. Here $k + 1 lt.eq 4$ because $j lt.eq 8$. At the endpoints this includes $r = j = 1$, with $kappa = \( 1 \)$, and $j = 7$, with $kappa = \( 2 \, 2 \, 2 \, 1 \)$ of size seven and height four. Again horizontal addition gives a positive coefficient for $theta$.
  Lemma 13 supplies both resulting factor partitions in $Z_E ⊗ "sgn"$. Induction commutes with a sign twist, since the restriction of the sign character is the product of the two local sign characters. Thus $theta$ occurs in the sign twist of the two-copy module, and $eta$ occurs in the untwisted module. The case $r = 0$ is the empty tensor and obeys the same conclusion. ◻
]

=== 4.5 Attaching without cancellation <attaching-without-cancellation>

The local contractions are now available. The remaining issue is their interaction: an elongated dual column could in principle mix path and attachment covectors. The endpoint clearance in the criterion allows us to place the covectors so that all mixed assignments vanish.

#proof[
  Choose an even list $e_1 gt.eq dots.h.c gt.eq e_t > 0$, with $t lt.eq q$, such that
  #[#set math.equation(numbering: n => "(4.7)")
   $ sum_(i = 1)^t e_i = 2 r \, #h(2em) e_i lt.eq h_i - d . $ <eq:band-extra-capacities>]
  For example, fill the capacities $max \( 0 \, floor.l \( h_i - d \) \/ 2 floor.r \)$ from left to right until their sum reaches $r$, then double the filled amounts and discard zeros. The capacities decrease, so the resulting positive list decreases. When $r = 0$, take the empty list and $t = 0$.
  Put $d$ path cells in each of these $t$ columns. The total available path capacity is
  $ sum_i min \( d \, h_i \) = sum_(i = 1)^d w_i gt.eq K . $
  Fill further columns, in order, with at most $min \( d \, h_i \)$ path cells until the path total is exactly $K$. This produces a decreasing column list for a path diagram $pi$; its first $t$ columns have height $d$, and every column has height at most $d$. Increase the first $t$ column heights by $e_i$ to form $mu$. By construction $mu subset.eq lambda$ and $\| mu \| = K + 2 r$. Call the first $t$ path columns chosen and all other nonempty path columns unchosen.
  The total length of unchosen path columns is
  $ K - d t gt.eq K - d q gt.eq 7 + d . $
  Order some of these columns first, stopping when their total length first reaches four. Each has length at most $d$, so this prefix has length between four and $3 + d$. Put the chosen columns next, then all remaining unchosen columns. The final group has length at least four. Lay these columns consecutively along the path in this order. All path positions in a chosen column now lie outside the first and last four path positions; their original row and column blocks are consequently unextended.
  By Lemma 12, there is an ordered basis $N_1 \, dots.h \, N_4$ of $P^(*)$ for which the path polytabloid using these consecutive columns has nonzero contraction with $u_(upright("path"))$. Only its first $d$ basis covectors are used. Let $eta$ be the extra diagram with column heights $e_1 \, dots.h \, e_t$. Lemma 14 and Lemma 3 give an ordered basis $Q_1 \, dots.h \, Q_(dim X)$ of $X^(*)$ and a placement of its dual columns on the extra positions for which the contraction with $z_(+) ⊗ z_(-)$ is nonzero. The empty case has contraction one. This applies the dual test to the actual extra tensor in $X$; the abstract Specht identification in Lemma 13 was used only to prove its support. The $Q_j$ may mix $X_(+)^(*)$ and $X_(-)^(*)$, and an extra dual column may use positions from both attachments. Neither is a restriction: assign each such extra column to a chosen path column with the corresponding height $e_i$.
  Extend these covectors by zero on the other summand of $P xor X$. Use the single ordered flag beginning
  $ N_1 \, dots.h \, N_d \, Q_1 \, dots.h \, Q_(dim X) \, N_(d + 1) \, dots.h \, N_4 . $
  For every chosen column, adjoin its extra column of $e_i$ positions below its $d$ path positions. The other columns have only their path positions. This is a placement of the column blocks of a dual polytabloid of shape $mu$.
  We check all terms of its alternating expansion. At each chosen path position, both row and column block lengths in the complement generator $u_F$ are at most two (the assertion is about its remaining blocks, not their lengths in $L$). The pair letter therefore belongs to $P$ and is annihilated by every $Q_j$. The $d$ path positions in such a column must use all its $N$-covectors, leaving precisely its $Q$-covectors on its extra positions. There are exactly $d$ such $N$-covectors, so none can be assigned to an extra slot. Unchosen columns already have only $N$-covectors. Thus every surviving assignment uses $P$ on the entire path and $X$ on all extra positions. On $E_(+)$ the only possible such letters lie in $X_(+)$, and on $E_(-)$ they lie in $X_(-)$. No additional mixed assignment survives.
  We may consequently replace $u_F$ in this contraction by its separated tensor from Lemma 11. In every elongated dual column the surviving permutations also factor: they permute the $N$-covectors among its path slots and the $Q$-covectors among its extra slots, with a fixed cross sign. Order the path slots before the extra slots to make that sign one. The full contraction is therefore, up to the fixed sign in (4.3),
  $ chevron.l u_(upright("path")) \, upright("path polytabloid") chevron.r #h(0.27778em) chevron.l z_(+) ⊗ z_(-) \, upright("extra polytabloid") chevron.r \, $
  and both factors are nonzero. Lemma 3 gives $S^mu$ in $U_F$. Finally, $mu subset.eq lambda$, so Lemma 10 proves the proposition. ◻
]

== 5 Balance tests <sec:balance>

Retain the self-conjugate candidate $L$ in Equation (3.3). For this second support test we use the full square $S^L ⊗ S^L$, with both factors realized by column-alternating tensors on the same column blocks. Put

$ c = 2 b + 2 \, #h(2em) T = 2 M - 1 + r . $

Thus $c$ is the total size of the columns of length two, and $T$ is the sum of the two largest column lengths. We prove that a target occurs whenever its first four column heights have sum at most $2 M - 2$. The local components below supply balanced lists of trivial-factor sizes, whose induced support is tested by Young’s rule. We then establish an additional three-row support statement for the bounded capacity checks.

For reference, write

$ cal(H)_j \( t \) & = { nu tack.r t : ell \( nu \) lt.eq j } \,\
cal(E)_j \( t \) & = { nu in cal(H)_j \( t \) : upright("every row length of ") nu upright(" is even") } . $

If $t$ is even, let $cal(O)_4 \( t \)$ be the members of $cal(H)_4 \( t \)$ having an odd-height column. Finally, $cal(P)_3 \( c \, s \)$ denotes the partitions with at most three rows obtained from a member of $cal(E)_3 \( c \)$ by adding a horizontal strip of size three and then a horizontal strip of size $s$. All support statements below mean inclusion, without any assertion about multiplicities.

=== 5.1 Separating components by output values <separating-components-by-output-values>

Use independent ordered alphabets in the two Specht factors. A pair of letters $\( a \, a' \)$ has output

$ z \( a \, a' \) = a + a' - 1 . $

For a collection $B$ of column blocks on a position set $D_B$, let $v_B$ be their alternating tensor and put $Y_B = bb(C) \[ S_(D_B) \] v_B$. By Equation (2.1), this is the Specht module whose column lengths are the sizes of the blocks in $B$. Realize both copies of $Y_B$ on $D_B$. Every pair word occurring in their tensor square has the same number of positions and the same output sum:

#[#set math.equation(numbering: n => "(5.1)")
 $ d_B = sum_(A in B) \| A \| \, #h(2em) sigma_B = sum_(A in B) \| A \|^2 . $ <bal:fixed-sums>]

Indeed, a block of length $k$ uses $1 \, dots.h \, k$ once in each factor, so its output sum is $2 \( 1 + dots.h.c + k \) - k = k^2$. Permuting positions within $D_B$, independently in the two layers, preserves these totals.

#thm([Lemma 5.1.])[
  (Separation by sizes and sums).  #emph[Partition the column blocks of $L$ into collections $B_1 \, dots.h \, B_v$ on disjoint position sets $D_1 \, dots.h \, D_v$, using the same blocks in both factors. Suppose $I_1 \, dots.h \, I_v$ are nonempty sets of integers with every element of $I_i$ smaller than every element of $I_(i + 1)$. Let $W_i$ be the image of $Y_(B_i) ⊗ Y_(B_i)$ under the coordinate projection retaining words all of whose outputs lie in $I_i$. Then the support of $S^L ⊗ S^L$ contains the support of 
$ "Ind"_(S_(d_(B_1)) times dots.h.c times S_(d_(B_v)))^(S_n) \( W_1 times.square dots.h.c times.square W_v \) . $

]
] <lem:balance-separation>

#proof[
  In the full pair-word space, retain precisely the words whose outputs lie in $union.big_i I_i$ and for which the outputs in $I_i$ have cardinality $d_(B_i)$ and sum $sigma_(B_i)$, for every $i$. This coordinate projection commutes with all position permutations.
  Consider a word from the tensor product with the prescribed component positions. The positions in $D_1$ have cardinality $d_(B_1)$ and sum $sigma_(B_1)$ by Equation (5.1). In a retained word, the positions whose outputs lie in $I_1$ have the same cardinality and sum. If these two sets of positions differed, the positions in the first set but not the second would all have larger outputs than the positions in the second but not the first. The two set differences have equal positive cardinality, contradicting equality of their sums. The two sets therefore agree. Remove them and repeat the argument for $I_2$, and then successively for every range.
  It follows that the global projection on these prescribed positions is the tensor product of the local projections. More explicitly, write $v_i = v_(B_i)$, $Y_i = Y_(B_i)$, and $H = product_i S_(D_i)$. Inside either Specht factor,
  $ bb(C) \[ H \] \( v_1 ⊗ dots.h.c ⊗ v_v \) = Y_1 times.square dots.h.c times.square Y_v subset.eq S^L . $
  Taking its tensor square gives the actual subspace $times.square_i \( Y_i ⊗ Y_i \)$ in $S^L ⊗ S^L$: the two layers can be generated independently. The symmetric groups act diagonally on each local square and on the global square. The restriction of the global projection is $⨂_i P_i$, where $P_i$ is the local projection. Its image is therefore the full outer product $W_1 times.square dots.h.c times.square W_v$. Different ordered placements of these components have disjoint coordinate supports, distinguished by which positions have outputs in each $I_i$. Their translates therefore give the full induced module in the statement. Since an equivariant image cannot acquire a new irreducible type, the result follows. ◻
]

The local support guarantees proved in the following subsections are summarized in Table 1. The entries concerning the largest two lengths use $q = M + b - 1$. When $s = 1$, their lengths are $q + 1 \, q$; when $s = 2$, their lengths are $q + 2 \, q$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Column blocks
], table.cell(rowspan: 1, colspan: 1)[Total size
], table.cell(rowspan: 1, colspan: 1)[Allowed outputs
], table.cell(rowspan: 1, colspan: 1)[Guaranteed support
]),
  table.cell(rowspan: 1, colspan: 1)[$a$ copies of $k$
], table.cell(rowspan: 1, colspan: 1)[$a k$
], table.cell(rowspan: 1, colspan: 1)[${ k }$
], table.cell(rowspan: 1, colspan: 1)[$\( a k \)$
],
  table.cell(rowspan: 1, colspan: 1)[$u \, u - 1$
], table.cell(rowspan: 1, colspan: 1)[$2 u - 1$
], table.cell(rowspan: 1, colspan: 1)[$\[ u - 1 \, u \]$
], table.cell(rowspan: 1, colspan: 1)[$cal(H)_4 \( 2 u - 1 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$q + 2 \, q$
], table.cell(rowspan: 1, colspan: 1)[$2 q + 2$
], table.cell(rowspan: 1, colspan: 1)[$\[ q \, 2 q + 3 \]$
], table.cell(rowspan: 1, colspan: 1)[$cal(O)_4 \( 2 q + 2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$b + 1$ copies of $2$
], table.cell(rowspan: 1, colspan: 1)[$c$
], table.cell(rowspan: 1, colspan: 1)[${ 2 }$
], table.cell(rowspan: 1, colspan: 1)[$cal(E)_2 \( c \)$
],
  table.cell(rowspan: 1, colspan: 1)[$3$, $b + 1$ copies of $2$, and $s$ copies of $1$
], table.cell(rowspan: 1, colspan: 1)[$c + 3 + s$
], table.cell(rowspan: 1, colspan: 1)[$\[ 1 \, 3 \]$
], table.cell(rowspan: 1, colspan: 1)[$cal(P)_3 \( c \, s \)$
],
)
]],
  caption: [Table 1: Local projected supports. Neighboring intervals in a packing are chosen disjoint before applying Lemma 15. ],
)

After applying Lemma 15, transitivity of induction permits us to combine selected factors in any order. In particular, the big pair can be combined with the singleton component even though their output ranges are not adjacent.

=== 5.2 Coordinate functionals and path components <coordinate-functionals-and-path-components>

We first explain exactly how a surviving word coordinate supplies a path vector after the two sign twists.

#thm([Lemma 5.2.])[
  (The sign-twisted coordinate line).  #emph[Let $X = S^mu$ be realized by column-alternating vectors in the word space of content $mu = \( mu_1 \, mu_2 \, dots.h \)$. For a word $a$ of this content, let $R_a$ permute separately the positions carrying each equal letter. The restriction $epsilon.alt_a \|_X$ of its coordinate functional is nonzero. Under $X^(*) ⊗ "sgn" tilde.eq S^(mu^t)$, its line is the line of the column-alternating vector on the equal-letter blocks of $a$, whose lengths are $mu_1 \, mu_2 \, dots.h$.]
] <bal:coordinate-line>

#proof[
  For the row-constant word of a tableau, its coefficient in the tableau’s column-alternating vector is one: only the identity in each column stabilizes that word. Hence its coordinate restriction is nonzero. Every other word of the same content is a position translate, which proves nonvanishing in general.
  The restricted coordinate is $R_a$-invariant. Young’s rule and Frobenius reciprocity give
  $ dim \( X^(*) \)^(R_a) = 1 \, $
  using the diagonal multiplicity in Lemma 4. After twisting by sign, this becomes the unique line on which $R_a$ acts by its sign character. The nonzero alternating vector on the equal-letter blocks is such a vector, and its column lengths are the parts of $mu$; it therefore belongs to $S^(mu^t)$. This identifies the two lines. The identification is equivariant, so translating a word changes the identification only by the corresponding sign and the position translate. ◻
]

In a tensor square, these two sign twists cancel. To make the passage through a projection explicit, let $P : X ⊗ X arrow.r W$ be a local coordinate projection onto its image. Its dual embeds $W^(*)$ in $\( X ⊗ X \)^(*)$. For a surviving pair word, its coordinate functional $epsilon.alt$ satisfies $epsilon.alt \( P z \) = epsilon.alt \( z \)$, so its restriction belongs to this embedded copy of $W^(*)$. Lemma 16 identifies it with a nonzero multiple of the product of the two alternating vectors on its equal-letter blocks. Its entire position-permutation span remains in $W^(*)$. Finding a path among these products therefore proves support in $W$ itself, since complex Specht modules are self-dual. In the next two lemmas, zero column lengths are omitted.

#thm([Lemma 5.3.])[
  (Neighboring lengths).  #emph[For every integer $u gt.eq 1$, the local component with column lengths $u \, u - 1$, projected to outputs in $\[ u - 1 \, u \]$, contains every type in $cal(H)_4 \( 2 u - 1 \)$.]
] <bal:neighboring>

#proof[
  Its content is $\( 2^(u - 1) \, 1 \)$. The equal-letter blocks thus consist of $u - 1$ pairs and one singleton in each layer. Arrange the two pairings as one odd path. From its first-layer singleton, label that singleton $u$, and label the successive first-layer pairs $u - 1 \, u - 2 \, dots.h \, 1$. Label the second-layer pairs, in path order, $1 \, 2 \, dots.h \, u - 1$, and label its terminal singleton $u$. At the path positions the outputs are alternately $u$ and $u - 1$, with output $u$ at both ends.
  The pair word survives the stated projection. By Lemma 16, its coordinate functional gives the odd-path tensor in the sign-twisted dual square. The twists cancel, and Lemma 12 gives every partition with at most four rows. Consequently all these types occur in the projected component. ◻
]

#thm([Lemma 5.4.])[
  (The two-path component).  #emph[For every integer $q gt.eq 0$, the component with column lengths $q + 2 \, q$, projected to outputs in $\[ q \, 2 q + 3 \]$, contains $cal(O)_4 \( 2 q + 2 \)$. If $q gt.eq 3$, inducing this support together with a trivial representation of size two contains every member of $cal(H)_4 \( 2 q + 4 \)$.]
] <bal:two-paths>

#proof[
  The content is $\( 2^q \, 1 \, 1 \)$. In each layer there are pair labels $1 \, dots.h \, q$ and singleton labels $q + 1 \, q + 2$. For any $0 lt.eq p lt.eq q$, make odd paths of sizes $2 p + 1$ and $2 \( q - p \) + 1$. On the first path use first-layer pair labels $1 \, dots.h \, p$ and second-layer pair labels $q - p + 1 \, dots.h \, q$; on the second path use the complementary intervals. In path order, the first-layer pairs decrease and the second-layer pairs increase. Give the first path the initial first-layer singleton $q + 1$ and terminal second-layer singleton $q + 2$, and the second path the remaining singletons.
  Internal outputs are $q$ or $q + 1$. Endpoint outputs are at least $q$, and all outputs are at most $2 q + 3$. If one path is a singleton, its two singleton labels satisfy the same bounds. The resulting pair word therefore survives the projection, and Lemma 16 identifies its coordinate with the product of the two path tensors.
  Let $nu in cal(O)_4 \( 2 q + 2 \)$. Since its size is even, it has an even positive number of odd-height columns. Divide its columns into two groups, each of odd total size. These totals are $2 p + 1$ and $2 \( q - p \) + 1$ for an allowed $p$. Arrange each group’s columns consecutively on the corresponding path. By Lemma 12, each contraction is a nonzero polynomial in a common ordered basis of the pair-letter dual space. Their product is also nonzero, so a common generic ordered basis gives a nonzero contraction of the two-path tensor with the dual tableau of $nu$. This proves the first assertion.
  For the second assertion, let $eta in cal(H)_4 \( 2 q + 4 \)$. It has width greater than two when $q gt.eq 3$. We claim that some removable horizontal two-strip leaves an odd-height column. If $eta$ has no odd-height columns, removing any horizontal two-strip creates two. If it has at least four, such a strip cannot remove all of them. If it has exactly two, its width ensures that an even-height column also exists. Remove one cell from an odd-height column and one from an even-height column, choosing the rightmost column of each selected height. Their heights are different, and these removals preserve the weakly decreasing order of column heights. This is a horizontal two-strip and leaves two odd-height columns. Pieri now proves the desired containment. ◻
]

For the candidate diagram, the big component has $T$ positions. When $s = 1$, Lemma 17 supplies $cal(H)_4 \( T \)$. When $s = 2$, its two singleton columns can supply a trivial representation of size two at output one; Lemma 15 and Lemma 18 then supply $cal(H)_4 \( T + 2 \)$. The big component’s outputs are at least $M - 1$ in both cases.

=== 5.3 Symmetric pairs and short strips <symmetric-pairs-and-short-strips>

The path calculations handle the long columns. For the short-column components we use a direct fact about repeated symmetric tensors. Its polynomial-module conclusion is Littlewood’s classical even-row decomposition of symmetric powers of a symmetric square [15] Chapter I, Section 5, Example 5(a); Appendix A, Section 7, Example (1). The explicit contraction below also detects the prescribed tensor, which is what our coordinate projection requires.

#thm([Lemma 5.5.])[
  (Repeated symmetric pairs).  #emph[Let $m gt.eq 0$ be an integer, let $E$ have dimension $j$, and let $H in "Sym"^2 E$ be nondegenerate. The position-permutation span of $H^(⊗ m) in E^(⊗ 2 m)$ contains every member of $cal(E)_j \( 2 m \)$. Moreover, the polynomial $"GL" \( E \)$-module $"Sym"^m \( "Sym"^2 E \)$ contains the Schur module of each such partition.]
] <bal:even-rows>

#proof[
  Choose an orthonormal basis for $H$, so $H = sum_(i = 1)^j e_i ⊗ e_i$. A diagram with even row lengths has its columns paired into equal-height pairs. Place the two positions of each copy of $H$ in corresponding cells of two paired columns. Contract against the usual column-alternating dual tensor. For a pair of columns of height $h$, the two permutations must agree, their signs multiply to one, and their contribution is $h !$. The entire contraction is the nonzero product of these factorials. Lemma 3 proves the first statement.
  For the second, use the natural embedding of $"Sym"^m \( "Sym"^2 E \)$ into $E^(⊗ 2 m)$ with the $m$ pairs of positions fixed, and choose the dual tableau placements as above. The same contraction proves that this $"GL" \( E \)$-stable subspace has a nonzero projection to the indicated Schur-Weyl isotypic space. Complete reducibility then gives the required Schur module. ◻
]

An isolated length-$k$ block, projected to constant output $k$, has the pair labels $\( a \, k + 1 - a \)$ for $1 lt.eq a lt.eq k$. Reversing one block’s labels shows that all terms in the projected tensor have the same sign. It is a nonzero symmetric tensor and hence supplies the trivial type of size $k$. For several equal-length blocks, the projected product still has coefficients of one common sign. Its full position average is nonzero, supplying the trivial type of their total size. This proves the first row of Table 1.

On an aligned length-two block, projection to constant output two gives, up to a common nonzero scalar,

$ e_12 ⊗ e_21 + e_21 ⊗ e_12 . $

This is a nondegenerate symmetric form on the two-letter space $"span" \( e_12 \, e_21 \)$. Thus $b + 1$ such blocks supply $cal(E)_2 \( c \)$ by Lemma 19.

#thm([Lemma 5.6.])[
  (An odd horizontal strip).  #emph[Let $c$ be positive and even, and let $x in { 1 \, 3 }$ with $x lt.eq c$. Inducing the support $cal(E)_2 \( c \)$ with the trivial representation of size $x$ supplies $cal(H)_2 \( c + x \)$.]
] <bal:odd-strip>

#proof[
  Write a target as $\( alpha \, beta \)$, allowing $beta = 0$. A precursor of size $c$ with even row lengths has the form $\( c - y \, y \)$ with $y$ even. The horizontal-strip interlacing conditions are precisely
  #[#set math.equation(numbering: n => "(5.2)")
   $ max \( 0 \, beta - x \) lt.eq y lt.eq min \( beta \, c - beta \) . $ <bal:parity-interval>]
  The upper bound is at most $c \/ 2$, so this also guarantees that the precursor is a partition. If the interval contains zero, choose $y = 0$. Otherwise its lower endpoint is $beta - x > 0$. When $beta lt.eq c \/ 2$, its length is $x gt.eq 1$. When $beta > c \/ 2$, its length is $c + x - 2 beta = alpha - beta$, a positive integer because $c + x$ is odd. The interval therefore contains an even integer. Pieri gives the assertion. ◻
]

In our applications, the size-one strip is a singleton column at output one, and the size-three strip is the length-three block at output three. These ranges are disjoint from output two, so Lemma 15 justifies the required inductions.

=== 5.4 The first-four-column bound <the-first-four-column-bound>

We now combine the local path and symmetric-pair supports. The aim is to replace each component by a list of trivial-factor sizes and then verify Young’s dominance inequalities for the entire target.

For positive integers $t \, j$, let $"pack" \( t \, j \)$ be the list of $j$ integers whose entries differ by at most one and sum to $t$; zero entries, if any, are omitted. Young’s rule implies that the support obtained by inducing trivial factors of these sizes is exactly $cal(H)_j \( t \)$. Indeed, every partition of $t$ with at most $j$ rows dominates the balanced $j$-part partition, whereas a partition with more than $j$ rows fails its $j$th dominance inequality. Thus a local component supplying $cal(H)_j \( t \)$ may contribute $"pack" \( t \, j \)$ to a list of trivial-factor sizes for a support calculation.

#thm([Proposition 5.7.])[
  (The balance bound).  #emph[Assume $M gt.eq 9$, and let $h_1 gt.eq h_2 gt.eq dots.h.c$ be the column heights of $nu tack.r n$. If 
#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(i = 1)^4 h_i lt.eq 2 M - 2 \, $ <bal:four-small>]

 then $S^nu$ occurs in $S^L ⊗ S^L$. The same conclusion holds if Equation (5.3) holds for the column heights of $nu^t$.]
] <prop:balance-four>

#proof[
  Use the big pair, together with the two singleton columns when $s = 2$, to contribute four balanced parts of total $T + 2 \( s - 1 \)$. When $s = 1$, retain its singleton column as a separate part one. If $c lt.eq M$, use the length-two columns to contribute the single part $c$. Pair the middle lengths $3 \, dots.h \, M - 2$ consecutively, leaving their smallest member alone if their number is odd. Each paired pair of neighboring lengths contributes four balanced parts by Lemma 17, and an unpaired length contributes itself.
  If $c > M$, use the length-three block with the length-two blocks. Lemma 20 contributes two balanced parts of total $c + 3$, and now pair the remaining middle lengths $4 \, dots.h \, M - 2$ in the same fashion. All output ranges used are disjoint: the singletons have output one, the length-two and length-three constructions use outputs two and three, a middle neighboring pair uses the interval between its two lengths, and the big pair uses outputs at least $M - 1$. Apply Lemma 15 first to these separate components. Then reassociate induction to combine the big pair with the output-one singleton component when $s = 2$, and to combine the output-two and output-three components when $c > M$. The local support statements above now validate the specified packing; no disconnected output range is treated as a single component in the separation lemma. Call the resulting list of parts $A$; its sum is $n$.
  We record two uniform bounds:
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| A \| gt.eq 2 M - 5 \, #h(2em) max A lt.eq M + 1 . $ <bal:packing-bounds>]
  A run of $p$ middle lengths contributes $2 p - \( p med mod med 2 \) gt.eq 2 p - 1$ parts. If $c lt.eq M$, there are $p = M - 4$ middle lengths and at least five other parts, giving at least $2 M - 4$ parts in total. If $c > M$, then $M$ must be even: for odd $M$, the bound $r lt.eq M \/ 2$ gives $c lt.eq r + 2 lt.eq M \/ 2 + 2 < M$. In the even case, $p = M - 5$ is odd, so the middle contribution is $2 M - 11$, and the big and short components contribute at least six more parts. This proves the first bound.
  Untouched lengths and balanced middle parts are at most $M$. The largest big-component part is at most
  $ ⌈frac(T + 2, 4)⌉ lt.eq ⌈frac(7 M \/ 2 + 3, 4)⌉ lt.eq M + 1 \, $
  using $r lt.eq 3 M \/ 2 + 2$. In the exceptional case $c > M$, the largest short-component part is
  $ ⌈frac(c + 3, 2)⌉ = ⌊r / 2⌋ + 3 lt.eq ⌊frac(3 M, 4)⌋ + 4 lt.eq M + 1 . $
  The last inequality holds for even $M gt.eq 10$: it is equality at $M = 10$, and follows from $3 M \/ 4 + 4 lt.eq M + 1$ for $M gt.eq 12$. This proves the second bound in Equation (5.4). In particular,
  #[#set math.equation(numbering: n => "(5.5)")
   $ frac(n, max A) gt.eq frac(N_M, M + 1) = M / 2 > frac(2 M - 2, 4) . $ <bal:average-bound>]
  We verify the inequalities of Lemma 4. The target has at least four columns, since otherwise Equation (5.3) would give $n lt.eq 2 M - 2 < N_M$. Consequently $h_1 lt.eq 2 M - 5$, and the first inequality follows from $P_A \( 1 \) = \| A \|$. The four big-component parts are each at least two, so
  $ P_A \( 2 \) gt.eq \| A \| + 4 gt.eq 2 M - 1 . $
  This proves the inequalities for prefixes two and three as well.
  For $k gt.eq 4$, decreasing column heights and Equation (5.3) imply
  $ sum_(i = 1)^k h_i lt.eq min (n \, frac(k \( 2 M - 2 \), 4)) . $
  Writing $B = max A$, the termwise bound $min \( k \, a \) gt.eq k a \/ B$ for $k lt.eq B$ gives
  $ P_A \( k \) gt.eq min (n \, frac(k n, B)) . $
  Equation (5.5) proves every remaining dominance inequality. The constructed support therefore contains $S^nu$. Finally, since $L$ is self-conjugate, its square is invariant under sign twist, so the same conclusion follows from the condition on $nu^t$. ◻
]

=== 5.5 A three-row component <a-three-row-component>

The following construction is independent of the big pair and will be used in the cases $M = 10 \, 12 \, 14$.

#thm([Proposition 5.8.])[
  (The short three-row component).  #emph[Group the length-three block, the $b + 1$ length-two blocks, and the $s$ singleton blocks in both layers, and project to outputs in $\[ 1 \, 3 \]$. The resulting module contains every partition in $cal(P)_3 \( c \, s \)$. This component can be induced independently with components on the remaining lengths $4 \, dots.h \, M - 2$ and with the big pair.]
] <prop:three-row>

#proof[
  Align corresponding blocks in the two layers and use pair letters $e_(a a')$. Set
  $ p = e_11 \, quad q = e_22 \, quad u = e_12 \, quad v = e_21 \, #h(2em) a = e_13 \, quad d = e_31 . $
  These six pair letters form a basis of the space of outputs at most three. Each aligned length-two block contributes
  #[#set math.equation(numbering: n => "(5.6)")
   $ H = p ⊗ q + q ⊗ p - u ⊗ v - v ⊗ u . $ <bal:four-form>]
  Each singleton contributes $p$. The length-three block has fixed output sum nine; since all its outputs are at most three, they must all equal three. Its contribution is, up to a nonzero scalar, the full symmetrization of $a \, d \, q$. Thus the projected module contains the position orbit of
  #[#set math.equation(numbering: n => "(5.7)")
   $ G = H^(⊗ \( b + 1 \)) ⊗ p^(⊗ s) ⊗ sum_(sigma in S_3) z_(sigma \( 1 \)) ⊗ z_(sigma \( 2 \)) ⊗ z_(sigma \( 3 \)) \, #h(2em) \( z_1 \, z_2 \, z_3 \) = \( a \, d \, q \) . $ <bal:three-generator>]
  We want to vary the symmetric-pair, singleton, and triple factors independently so that Pieri applies to their tensor product. Let $P = "span" \( p \, q \, u \, v \, a \, d \)$. Common linear maps from $P$ provide the needed vectors without adding any symmetric-group types. More precisely, let $E = bb(C)^3$, let $D = c + s + 3$, and set
  $ N = bb(C) \[ S_D \] G \, #h(2em) W = sum_(phi.alt : P arrow.r E) phi.alt^(⊗ D) \( N \) subset.eq E^(⊗ D) . $
  Each $phi.alt^(⊗ D)$ intertwines the position action, so every $S_D$-type in $W$ already occurs in $N$. Moreover, $W$ is $"GL" \( E \)$-stable, since postcomposing $phi.alt$ with an element of $"GL" \( E \)$ gives another map in the sum. The choice $dim E = 3$ restricts the Schur-Weyl types to partitions with at most three rows.
  Our immediate aim is to put
  #[#set math.equation(numbering: n => "(5.8)")
   $ Q^(⊗ \( b + 1 \)) ⊗ x^(⊗ s) ⊗ y^(⊗ 3) $ <bal:independent-tensors>]
  in $W$ for generic independently chosen symmetric tensors $Q in "Sym"^2 E$ and vectors $x \, y in E$. Here $Q$ will be the image of $H$, while $x$ and $y$ control the singleton and triple factors. The same source letter $q$ occurs in both $H$ and the triple, so these choices require a construction.
  Identify $Q$ with its symmetric matrix and assume it is invertible. We seek a map with $p mapsto x$ and $q \, a \, d mapsto t y$ for some $t eq.not 0$. The requirement $H mapsto Q$ then asks that $t \( x y^(sans(T)) + y x^(sans(T)) \) - Q = U V^(sans(T)) + V U^(sans(T))$ for the still unchosen images $U \, V$ of $u \, v$. Since the right side has rank at most two, we choose $t$ to make the left side singular. Put
  $ alpha = x^(sans(T)) Q^(- 1) y \, #h(2em) beta = x^(sans(T)) Q^(- 1) x \, #h(2em) gamma = y^(sans(T)) Q^(- 1) y . $
  The determinant lemma gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ det #scale(x: 120%, y: 120%)[\(] Q - t \( x y^(sans(T)) + y x^(sans(T)) \) #scale(x: 120%, y: 120%)[\)] = det \( Q \) #scale(x: 120%, y: 120%)[\(] 1 - 2 alpha t + \( alpha^2 - beta gamma \) t^2 #scale(x: 120%, y: 120%)[\)] . $ <bal:density-determinant>]
  The quadratic coefficient is generically nonzero: for $Q = I$, $x = e_1$, and $y = e_2$, it equals $- 1$. The constant coefficient is one. Over $bb(C)$, there is therefore a nonzero root $t$. The symmetric matrix
  $ R = t \( x y^(sans(T)) + y x^(sans(T)) \) - Q $
  has rank at most two. Every such symmetric matrix over $bb(C)$ can be written $U V^(sans(T)) + V U^(sans(T))$: diagonalize it by congruence, write it as $A A^(sans(T)) + B B^(sans(T))$ with at most two summands, and take $U = \( A + upright(i) B \) \/ sqrt(2)$ and $V = \( A - upright(i) B \) \/ sqrt(2)$.
  Consequently the common linear map $phi.alt : P arrow.r E$ given by
  #[#set math.equation(numbering: n => "(5.10)")
   $ p mapsto x \, quad q mapsto t y \, quad u mapsto U \, quad v mapsto V \, quad a mapsto t y \, quad d mapsto t y $ <bal:density-map>]
  sends $H$ to $Q$ and the symmetric triple to $6 t^3 y^(⊗ 3)$. Its image of $G$ is therefore $6 t^3$ times Equation (5.8). Since $t eq.not 0$ and $W$ is a linear space, the desired tensor belongs to $W$.
  Varying the generic choices of $Q \, x \, y$ shows that $W$ contains the naturally embedded space
  #[#set math.equation(numbering: n => "(5.11)")
   $ "Sym"^(b + 1) \( "Sym"^2 E \) ⊗ "Sym"^s E ⊗ "Sym"^3 E . $ <bal:pieri-space>]
  Indeed, a linear functional annihilating $W$ gives a multihomogeneous polynomial in $\( Q \, x \, y \)$ when evaluated on Equation (5.8). It vanishes on a dense set and hence identically. Pure powers span each symmetric power, proving the containment in Equation (5.11).
  By Lemma 19, the first factor contains the Schur module for every member of $cal(E)_3 \( c \)$. Two applications of Pieri give every Schur module indexed by $cal(P)_3 \( c \, s \)$. Schur-Weyl duality transfers these $"GL" \( E \)$-types to the corresponding $S_D$-types in $W$, hence in $N$ and in the local projected module. This proves the asserted support.
  Finally, the remaining middle components can use outputs at least four and at most $M - 2$, while the big pair uses outputs at least $M - 1$. They are disjoint from $\[ 1 \, 3 \]$, so their independence follows from Lemma 15. ◻
]

=== 5.6 Using the local supports in capacity tests <using-the-local-supports-in-capacity-tests>

The capacity tests use these local supports in two ways. First, they retain partitions with at most three rows whose entire dominance upper set lies in $cal(P)_3 \( c \, s \)$. The precise condition in Equation (6.8) guarantees the full induced-trivial support associated with each retained partition’s row lengths. Combining these lower supports with balanced middle parts gives the dominance bounds used below.

Second, they allocate at most four cells from each target column to the big pair, with total allocation $T$ and at least one odd allocation when $s = 2$. If the residual diagram is supplied by the other components, Lemma 5 combines the columnwise allocations to give the target. The exact allocation test and its support justification are given in Lemma 27.

== 6 Exhaustion of the capacity conditions <sec:capacity>

The balance and band constructions cover complementary shapes. A small sum of the first four rows or columns gives balance support. Otherwise both orientations have room for the path in the band criterion. Failure of that criterion then bounds both row and column prefixes, forcing an upper bound on the whole diagram’s area. We use this contradiction for large parameters and for most intermediate parameters. Nineteen pairs remain, for which we enumerate targets using the proved support tests.

Throughout this section, $M gt.eq 9$ and $r > 0$, and $M \, r \, b \, s \, L \, K$ have the meanings fixed above. Put

$ c = 2 b + 2 \, #h(2em) T = K + r \, #h(2em) H_i = sum_(a = 1)^i h_a \, #h(2em) W_j = sum_(a = 1)^j w_a \, $

where $h$ and $w$ are the column heights and row lengths of a target partition of $n$, extended by zeros. Since $L$ is self-conjugate, we may apply every test to either orientation of the target.

By Proposition 21, any target not already supplied satisfies

#[#set math.equation(numbering: n => "(6.1)")
 $ H_4 gt.eq K \, #h(2em) W_4 gt.eq K . $ <eq:capacity-four-assumption>]

=== 6.1 Two opposite prefixes <two-opposite-prefixes>

#thm([Lemma 6.1.])[
  #emph[Let $i \, j gt.eq 1$. If $H_i lt.eq U$ and $W_j lt.eq V$, then 
#[#set math.equation(numbering: n => "(6.2)")
 $ n lt.eq max (U + V - 1 \, ⌊frac(U V, i j)⌋) . $ <eq:capacity-rectangle>]

]
] <lem:capacity-rectangle>

#proof[
  If the cell in row $j$, column $i$ is absent, no cell lies outside both the first $i$ columns and the first $j$ rows. Those two strips cover the diagram and share its first cell, giving $n lt.eq U + V - 1$. Otherwise their intersection is an $i$-by-$j$ rectangle. Put $x = h_i gt.eq j$ and $y = w_j gt.eq i$. Every cell outside both strips has row index at most $x$ and column index at most $y$, so the remaining corner has at most $\( x - j \) \( y - i \)$ cells. Since $i x lt.eq U$ and $j y lt.eq V$,
  $ n lt.eq U + V - i j + \( x - j \) \( y - i \) lt.eq U + V - i j + \( U \/ i - j \) \( V \/ j - i \) = frac(U V, i j) . $
  Integrality gives the asserted floor. ◻
]

#thm([Lemma 6.2.])[
  #emph[If $M gt.eq 22$, a target satisfying Equation (6.1) passes the band test in one of its two orientations.]
] <lem:capacity-large>

#proof[
  The choice $d = 4$, $q = 8$ is admissible in Proposition 8, because $d q + 7 + d = 43 lt.eq 2 M - 1$. If the band test fails in both orientations, then
  $ sum_(i = 1)^8 max (0 \, ⌊frac(h_i - 4, 2)⌋) lt.eq r - 1 \, $
  and likewise for $w$. The termwise inequality
  #[#set math.equation(numbering: n => "(6.3)")
   $ x lt.eq 2 max (0 \, ⌊frac(x - f, 2)⌋) + f + 1 quad \( x in bb(Z)_(gt.eq 0) \) $ <eq:capacity-floor-bound>]
  therefore gives $H_8 \, W_8 lt.eq S := 2 r + 38$. Lemma 23 implies $n lt.eq max \( 2 S \, S^2 \/ 64 \)$. On the other hand,
  $ n - 2 S gt.eq frac(M^2 - 5 M - 160, 2) > 0 \, #h(2em) 64 n - S^2 gt.eq 23 M^2 - 28 M - 1508 > 0 . $
  For the first inequality substitute $r lt.eq 3 M \/ 2 + 2$; for the second write $64 n - S^2 = 32 M \( M + 1 \) - 4 r^2 - 24 r - 1444$ and make the same substitution. Both displayed polynomials are positive at $M = 22$ and increase thereafter. This is a contradiction. ◻
]

For the remaining intermediate cases, retain the least adequate core height in each orientation. Let $d$ be least with $H_d gt.eq K$ and $e$ least with $W_e gt.eq K$; by Equation (6.1), both belong to ${ 1 \, 2 \, 3 \, 4 }$. Define

$ q_f = min (8 \, ⌊frac(2 M - 8 - f, f)⌋) quad \( 1 lt.eq f lt.eq 4 \) \, $

and the following finite set of pairs consisting of a prefix length and an upper bound for its sum:

#[#set math.equation(numbering: n => "(6.4)")
 $ cal(D)_(M \, r) \( d \, e \) =  & { \( d - 1 \, 2 M - 2 \) : d > 1 }\
 &  union { \( q_f \, 2 r - 2 + q_f \( f + 1 \) \) : e lt.eq f lt.eq 4 \, med q_f > 0 } . $ <eq:capacity-D>]

If neither band test succeeds, every pair $\( i \, U \)$ in this set satisfies $H_i lt.eq U$. Indeed minimality of $d$ gives its first element, and $W_f gt.eq K$ for $f gt.eq e$; failure of the band test with this $f \, q_f$, followed by Equation (6.3), gives the other elements. Similarly, $cal(D)_(M \, r) \( e \, d \)$ bounds the row prefixes. The indices are crossed because enough room in the first $f$ rows allows the band criterion to test the excess heights of columns, and conversely after transposition.

#thm([Lemma 6.3.])[
  #emph[The first-four balance test and the band tests cover every target when $9 lt.eq M lt.eq 21$, $r > 0$, except possibly for 
#[#set math.equation(numbering: n => "(6.5)")
 $ \( M \, r \) in { \( 10 \, 8 \) \, dots.h \, \( 10 \, 17 \) } union { \( 12 \, 14 \) \, dots.h \, \( 12 \, 20 \) } union { \( 14 \, 22 \) \, \( 14 \, 23 \) } . $ <eq:capacity-exceptions>]

]
] <lem:capacity-intermediate>

#proof[
  Use $1 lt.eq r lt.eq floor.l M \/ 2 floor.r$ for odd $M$ and $1 lt.eq r lt.eq 3 M \/ 2 + 2$ for even $M$. After removing Equation (6.5), there are 177 pairs $\( M \, r \)$. For each pair and each of the 16 choices of $d \, e$, the following integer inequality holds:
  #[#set math.equation(numbering: n => "(6.6)")
   $ min_(\( i \, U \) in cal(D)_(M \, r) \( d \, e \)\
\( j \, V \) in cal(D)_(M \, r) \( e \, d \)) max (U + V - 1 \, ⌊frac(U V, i j)⌋) < n . $ <eq:capacity-intermediate-check>]
  This is a bounded integer calculation involving 2,832 assertions. The function #raw("intermediate") in Appendix 9 evaluates exactly Equation (6.6); its complete execution verified every assertion. If a target failed the first-four and band tests, its least $d \, e$ would give both the upper bounds in Equation (6.4). Equation (6.6) would then contradict Lemma 23. ◻
]

=== 6.2 The nineteen exceptional cases <the-nineteen-exceptional-cases>

For the remaining parameters we first assemble induced supports of full degree. When these do not settle a target, we allocate cells to a constituent with at most four rows on the big pair and test the residual diagram against the lower components. A recursive enumeration checks that every target is covered by one of these supports or by the band criterion. All arithmetic is exact; the tests certify the sufficient support conditions, rather than approximate Kronecker coefficients.

For a multiset $A$ of positive integers, write

$ \| A \| = upright("its number of entries") \, #h(2em) parallel A parallel = sum_(a in A) a \, #h(2em) P_A \( k \) = sum_(a in A) min \( k \, a \) . $

By Lemma 4, inducing trivial representations of the sizes in $A$ has precisely the support of partitions $gamma tack.r parallel A parallel$ satisfying

#[#set math.equation(numbering: n => "(6.7)")
 $ sum_(j = 1)^k gamma_j^t lt.eq P_A \( k \) quad \( k gt.eq 1 \) . $ <eq:capacity-young>]

We call this the support associated with $A$. For integers $u \, j > 0$, let $"pack" \( u \, j \)$ be the multiset of $j$ integers $floor.l \( u + i \) \/ j floor.r$, $0 lt.eq i < j$, with zero entries omitted. This is the balanced division from Section 5. Every use below has $u gt.eq j$, so the code’s fixed-length tuples have no zero entries. The implementation in Appendix 9 follows these constructions with integer lists and sets.

For a consecutive increasing list $J$ of middle lengths, let $cal(P) \( J \)$ be the following collection of multisets. If $\| J \|$ is even, pair consecutive entries $u \, u + 1$, replacing each pair by $"pack" \( 2 u + 1 \, 4 \)$. If $\| J \|$ is odd, choose an entry with an even number of predecessors, retain it as a single entry, and perform this pairing separately on the two remaining even lists. The empty list gives the empty multiset. Thus every member of $cal(P) \( J \)$ has the support supplied by those middle components, by Lemma 17 and Lemma 15. The function #raw("bal") enumerates this collection.

===== 6.2.1 Full-degree supports. <full-degree-supports.>

Construct a collection $cal(B)$ as follows. For each row of Table 2 having the prescribed value of $s$, and each $R in cal(P) \( J \)$, take the multiset union of $R$ with the displayed parts. The indices $\( t \, x \)$ match those in the code. Omit a row if $x > c$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$s$
], table.cell(rowspan: 1, colspan: 1)[$\( t \, x \)$
], table.cell(rowspan: 1, colspan: 1)[Parts adjoined to $R$
], table.cell(rowspan: 1, colspan: 1)[$J$
]),
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$"pack" \( T \, 4 \) union.plus \( c \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, dots.h \, M - 2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$"pack" \( T \, 4 \) union.plus "pack" \( c + 1 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, dots.h \, M - 2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$"pack" \( T + 2 \, 4 \) union.plus \( c \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, dots.h \, M - 2 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 3 \)$
], table.cell(rowspan: 1, colspan: 1)[$"pack" \( T + 2 \, 4 \) union.plus "pack" \( c + 3 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, dots.h \, M - 2 \)$
],
)
]],
  caption: [Table 2: Full-degree support multisets. The symbol $union.plus$ denotes multiset union; the row with $x = 3$ uses the length-three block in the short component and removes it from $J$. ],
)

Here $t = 2$ combines the two singleton cells with the big pair; $x = 1$ combines the singleton with the length-two blocks; and $x = 3$ combines the length-three block with those blocks. The singleton left in the first row contributes the part $1$. Every $A in cal(B)$ has $parallel A parallel = n$, and its support is supplied by Lemmas 17, 18, and 20, combined by Lemma 15.

===== 6.2.2 Supports below the big pair. <supports-below-the-big-pair.>

These full-degree supports sometimes settle the target immediately. For the remaining targets we seek a columnwise allocation

$ h_i = delta_i + \( h_i - delta_i \) \, #h(2em) 0 lt.eq delta_i lt.eq min \( 4 \, h_i \) \, #h(2em) sum_i delta_i = T \, $

with at least one odd $delta_i$ when $s = 2$. The big pair supplies the partition with column-height multiset $\( delta_i \)$ by Lemmas 17 and 18. We therefore need lower-component support for the residual partition, whose column heights are the decreasing rearrangement of $\( h_i - delta_i \)$ and whose size is $n - T$. Lemma 5 will combine these two constituents.

Next construct a collection $cal(C)$ for the components other than the big pair. Write $u = c + 3 + s$, and let $cal(G)$ consist of the partitions of $u$ with at most three rows obtained from a partition of $c$ with even row lengths by successively adding horizontal strips of sizes $3$ and $s$. Proposition 22 supplies all of $cal(G)$ on the blocks of lengths at most three. For partitions of equal size, write $alpha gt.closed.eq beta$ for dominance of row lengths. Retain a partition $a$ of $u$ with at most three rows if

#[#set math.equation(numbering: n => "(6.8)")
 $ alpha gt.closed.eq a quad arrow.r.double quad alpha in cal(G) quad upright("for every ") alpha tack.r u upright(" with at most three rows") . $ <eq:capacity-low-mask>]

No partition of more than three rows can dominate $a$, since its first three rows have sum strictly less than $u$. Thus Lemma 4 says that the entire support associated with the row lengths of $a$ is available on the lower blocks. For each retained $a$ and each $R in cal(P) \( \( 4 \, 5 \, dots.h \, M - 2 \) \)$, put their multiset union in $cal(C)$. Every resulting multiset has total $n - T$ and supplied support. We may delete $A$ from $cal(C)$ if its decreasing rearrangement strictly dominates that of another member $B$: every partition dominating $A$ also dominates $B$, so this deletion does not shrink the union of their supports. Deleting all such members simultaneously is harmless: every descending chain in this finite strict dominance order terminates at a retained member whose support contains the supports of its predecessors.

These definitions explain the construction of #raw("B") and #raw("C") in the code. The function #raw("parts") lists all partitions with at most three parts. For such partitions $a \, b$, the function #raw("strip") tests the interlacing inequalities

$ a_1 gt.eq b_1 gt.eq a_2 gt.eq b_2 gt.eq a_3 gt.eq b_3 gt.eq 0 \, $

which are exactly the horizontal-strip condition. The calls have the prescribed size differences $3$ and $s$. The list #raw("bad") is the complement of $cal(G)$, so the test excluding any $alpha in mono("bad")$ dominating $a$ is exactly Equation (6.8). The final dominance deletion is the valid deletion just described.

===== 6.2.3 Safe pruning of partial diagrams. <safe-pruning-of-partial-diagrams.>

The available supports have now been specified. The next bound determines when an initial column list already certifies every possible completion.

#thm([Lemma 6.4.])[
  #emph[Let $A$ be a nonempty multiset of positive integers with total $N$, and let $a = \( a_1 \, dots.h \, a_l \)$ be a nonempty prefix of the column-height list of a partition of $N$. If 
#[#set math.equation(numbering: n => "(6.9)")
 $ min (N \, sum_(v = 1)^(min \( i \, l \)) a_v + \( i - l \)_(+) a_l) lt.eq P_A \( i \) #h(2em) \( 1 lt.eq i < max A \) \, $ <eq:capacity-prefix-bound>]

 then every completion of $a$ has the support associated with $A$. For a complete column-height list followed by a zero, these inequalities are equivalent to that support condition.]
] <lem:capacity-prefix-pruning>

#proof[
  Every unknown entry is at most $a_l$. The left side of Equation (6.9) is therefore an upper bound for the corresponding prefix sum of any completion. For $i gt.eq max A$, the right side is already $N$, so the omitted inequalities hold automatically. If the prefix includes a final zero, it has no nonzero extension and the upper bounds are exact. ◻
]

The predicate #raw("bound(A,a)") is exactly Equation (6.9); it returns false on an empty prefix. The predicate #raw("F(a,b)") applies the band test, using known column and row prefixes and the largest admissible $q = min \( 8 \, floor.l \( K - 7 - d \) \/ d floor.r \)$ for each $d = 1 \, dots.h \, 4$. The lists contain exact initial row and column lengths. Summing only the known entries therefore gives lower bounds for both sums in the band criterion, since every capacity summand is nonnegative. Extending either prefix cannot invalidate a successful test. Thus the predicate #raw("stop(a,b)"), which accepts either band orientation or any support from $cal(B)$, certifies all completions of these prefixes. Its use before the diagram is fully constructed is justified by Lemma 26.

===== 6.2.4 Certifying a completed allocation. <certifying-a-completed-allocation.>

If prefix pruning does not settle a target, the next routine allocates cells to the big pair and tests the residual diagram against the lower supports. Only successful allocations are used.

#thm([Lemma 6.5.])[
  #emph[If the code returns #raw("hit(h)=True") on a complete column-height list followed by zero, the target is supplied by the big pair and the other balance components.]
] <lem:capacity-hit>

#proof[
  The routine constructs allocations $delta_i$ from the original columns, with $0 lt.eq delta_i lt.eq min \( 4 \, h_i \)$. If $s = 1$, the protected index is the final zero, to which it allocates zero. If $s = 2$, it chooses a column and fixes its allocation to $z = 1$ or $3$; no later step changes this column. Every other step decreases the residual of an eligible column by one, stopping at residual $max \( 0 \, h_i - 4 \)$. Entering the loop’s #raw("else") clause means exactly $T = K + r$ cells have been allocated. Taking the positive allocations as column heights gives a partition with at most four rows and size $T$, and when $s = 2$ it has the protected odd-height column. Its support on the big pair is supplied by Lemma 17 when $s = 1$ and Lemma 18 when $s = 2$.
  The residual columns are nonnegative and have total $n - T$, the total of every member of $cal(C)$. A successful #raw("bound") call on their decreasing rearrangement, which retains a final zero, certifies an available residual constituent by Lemma 26. Indeed, the original appended zero is protected when $s = 1$; when $s = 2$, it is neither eligible for the positive allocation $z$ nor for a later decrement. Sorting does not remove that zero. For each original column separately, the height-$h_i$ column occurs in the induction of the columns of heights $delta_i$ and $h_i - delta_i$. Applying Lemma 5 to these single-column containments supplies the original target. No optimality claim about the greedy choice of decrements is needed: only its successful allocations are used. ◻
]

===== 6.2.5 Exhausting the targets. <exhausting-the-targets.>

We have justified what each successful test certifies. It remains to show that the recursive search visits every target not already certified.

#thm([Lemma 6.6.])[
  #emph[For each pair in Equation (6.5), the procedure #raw("gen") exhausts all targets, up to transposition and the already justified pruning conditions.]
] <lem:capacity-enumeration>

#proof[
  At depth $k$, the lists $a \, b$ give the first $k$ full row and column lengths, and #raw("left") is the area after removal of these successive diagonal hooks. The remaining southeast partition, if nonempty, has a first row of length $x$ and a first column of length $y$. Necessarily
  $ 1 lt.eq x lt.eq mono("left") \, quad 1 lt.eq y lt.eq mono("left") + 1 - x \, quad mono("left") lt.eq x y . $
  If $k > 0$, decreasing full row and column lengths further require $x lt.eq a_k - k$ and $y lt.eq b_k - k$. These are exactly the loop bounds: the rectangle inequality is written $y gt.eq ceil.l mono("left") \/ x ceil.r$. The next lists append $x + k$ and $y + k$, and the remaining area becomes $mono("left") + 1 - x - y$, subtracting the next hook. At the root the additional bound $y lt.eq x$ selects the orientation whose first row is at least its number of rows. Every target has such an orientation, and all final tests allow both orientations. Every actual partition therefore follows a permitted path.
  Conversely, the row and column constraints make the corresponding Frobenius arm and leg lists strictly decreasing and nonnegative. Every completed path consequently specifies a partition. At #raw("left=0"), its rows beyond the first $k$ are
  $ \# { j lt.eq k : b_j gt.eq i } \, #h(2em) k < i lt.eq b_1 \, $
  and its columns are given by the symmetric formula. These are exactly the two calls to #raw("fill"); the appended zero is for the support tests. Hook sizes account for the entire area $n$.
  The recursion terminates since a nonempty hook removes at least one cell. A successful #raw("stop") discards only certified completions. The other early rejection, at $k gt.eq 4$, is used only when a first-four sum is below $K$; those four entries are then fixed and Proposition 21 applies. At each remaining leaf the program verifies $mono("hit(u) or hit(v)")$ for the complete conjugate lists. By Lemma 27, a successful assertion certifies that target as well. ◻
]

The calls #raw("run(m,r)") in Appendix 9 were executed for every pair in Equation (6.5). All nineteen calls completed with every assertion satisfied; none was omitted using the optional earlier rectangle test. This verifies the remaining finite assertion in Lemma 28. As supplementary checks on the implementation, the accompanying #raw("capacity_independent.py") compared diagonal-hook enumeration with ordinary partition enumeration for every $1 lt.eq n lt.eq 40$ (113,696 emitted partitions in the selected orientation), checked the three-row Pieri support sets in all nineteen cases by a separate columnwise test, checked the totals of the multisets in $cal(B)$ and $cal(C)$, and checked 748,716 prefix-bound instances for $1 lt.eq n lt.eq 16$. These checks all passed; the preceding invariants, rather than their smaller degree ranges, justify exhaustive coverage in the nineteen required cases.

#thm([Proposition 6.7.])[
  #emph[For every admissible $M gt.eq 9$ and $r > 0$, every target partition of $n = N_M + 2 r$ is supplied by the band and balance constructions for $L$.]
] <prop:capacity-exhaustion>

#proof[
  Proposition 21 handles a small first-four sum in either orientation. For the remaining targets, Lemma 24 handles $M gt.eq 22$, and Lemma 25 handles $9 lt.eq M lt.eq 21$ outside Equation (6.5). The nineteen verified calls, justified by Lemmas 27 and 28, handle exactly those remaining pairs. ◻
]

== 7 Small degrees by exact character calculation <sec:finite>

The capacity calculations apply to the fixed large-degree candidate. For the remaining small degrees we instead calculate exact character residues, checking one self-conjugate candidate against every target. A nonzero residue certifies a positive integer multiplicity; no estimate or reconstruction of that integer is needed. We give the invariant of the calculation and its implementation bounds. The source is reproduced in Appendix 10.

#thm([Proposition 7.1.])[
  #emph[For every integer $1 lt.eq n lt.eq 64$ other than $2 \, 4 \, 9$, there is a self-conjugate partition $lambda tack.r n$ such that 
$ g \( lambda \, lambda \, nu \) > 0 #h(2em) upright("for every ") nu tack.r n . $

]
] <prop:finite-check>

=== 7.1 A recurrence for the entire coefficient vector <a-recurrence-for-the-entire-coefficient-vector>

Write $chi^lambda \( rho \)$ for the character of $S^lambda$ on the conjugacy class of cycle type $rho$. If $m_j \( rho \)$ is the number of parts of size $j$, put $z_rho = product_j j^(m_j \( rho \)) m_j \( rho \) !$. The character inner-product formula gives

#[#set math.equation(numbering: n => "(7.1)")
 $ g \( lambda \, lambda \, nu \) = sum_(rho tack.r n) frac(chi^lambda \( rho \)^2 chi^nu \( rho \), z_rho) \, $ <eq:finite-character>]

since symmetric-group characters are real. The program computes this sum for every $nu tack.r n$ at once, recursively selecting the parts of $rho$ in decreasing order.

Calculations take place in $bb(F)_p$, where $p in { 1000000007 \, 1000000009 }$. Both numbers are prime, as is checked by trial division through $31622$. Since $n lt.eq 64 < p$, every denominator in (7.1) is invertible modulo $p$. All character values and vectors below are interpreted in this field. For $s gt.eq 0$, let $cal(P)_s$ be the partitions of $s$, including the empty partition when $s = 0$. For a vector $v = \( v_lambda \)_(lambda in cal(P)_s)$, write

$ chi_v \( rho \) = sum_(lambda in cal(P)_s) v_lambda chi^lambda \( rho \) . $

Let $\[ lambda \]$ denote the coordinate vector with entry one at $lambda$ and zero elsewhere, so $chi_(\[ lambda \]) = chi^lambda$.

A border strip is an edge-connected skew diagram containing no $2 times 2$ square; its leg length is one less than its number of occupied rows. Let $R_k$ denote the matrix that adds a border strip of size $k$, with entry $\( - 1 \)^(upright("leg length"))$ for each permitted addition. Its source and target degrees will be understood from context. For $v$ of degree $s$ and $rho tack.r s - k$, the Murnaghan–Nakayama rule [15] Chapter I, §7, Example 5[10] Rule 21.1 gives

#[#set math.equation(numbering: n => "(7.2)")
 $ chi_(R_k^(sans(T)) v) \( rho \) = chi_v \( \( k \) union rho \) \, #h(2em) sum_mu \( R_k \)_(nu mu) chi^mu \( rho \) = chi^nu \( \( k \) union rho \) . $ <eq:finite-mn>]

In a call #raw("calc(s,k,e,v)"), the remaining cycle type has total size $s$ and no part larger than $k$; $e$ counts the size-$k$ parts already selected. The extra counter records the factorial in $z_rho$ when several equal parts are selected successively. Reached states have $0 lt.eq s lt.eq 64$, $k gt.eq 1$, and $e gt.eq 0$. Set $rho_1 = 0$ for the empty partition and abbreviate $m_j = m_j \( rho \)$. Define $F_(s \, k \, e) \( v \)$ by its $nu$ coordinate

#[#set math.equation(numbering: n => "(7.3)")
 $ F_(s \, k \, e) \( v \)_nu = sum_(rho tack.r s\
rho_1 lt.eq k) chi_v \( rho \)^2 chi^nu \( rho \) frac(e !, k^(m_k) \( e + m_k \) !) product_(1 lt.eq j < k) frac(1, j^(m_j) m_j !) . $ <eq:finite-invariant>]

Only states with $e + m_k lt.eq 64$ are reached, so all displayed denominators are invertible. For $2 lt.eq k lt.eq s$, separating the terms with $m_k = 0$ from those with $m_k > 0$ yields

#[#set math.equation(numbering: n => "(7.4)")
 $ F_(s \, k \, e) \( v \) = F_(s \, k - 1 \, 0) \( v \) + frac(1, k \( e + 1 \)) R_k F_(s - k \, k \, e + 1) \( R_k^(sans(T)) v \) . $ <eq:finite-recursion>]

Indeed, (7.2) supplies the three character factors, while for $m = m_k > 0$ the coefficient of the second term is

$ frac(1, k \( e + 1 \)) frac(\( e + 1 \) !, k^(m - 1) \( e + m \) !) = frac(e !, k^m \( e + m \) !) . $

When $m_k = 0$, the counter contributes only $e ! \/ e ! = 1$, so the first term resets it to zero. The counter is needed precisely when another part of size $k$ is selected. Each recursive call decreases $\( s \, k \)$ in lexicographic order: either the largest permitted part decreases, or the remaining degree decreases. The recursion therefore terminates.

The base cases are exact. At degree zero the answer is $v_diameter^2$. If $0 < s < k$, no size-$k$ part remains, so $F_(s \, k \, e) \( v \) = F_(s \, s \, 0) \( v \)$: the factor involving $e$ in (7.3) is then $e ! \/ e ! = 1$. Calls with $k = 1$ always have $e = 0$, since this case is returned immediately rather than recursed into. Writing $d_s = \( dim S^nu \)_(nu tack.r s)$ gives

#[#set math.equation(numbering: n => "(7.5)")
 $ F_(s \, 1 \, 0) \( v \) = frac(1, s !) thin d_s \( d_s^(sans(T)) v \)^2 . $ <eq:finite-base>]

The vector $d_s$ is computed by successive applications of $R_1$ to the empty partition: the resulting Young-lattice chains are standard tableaux. The array named #raw("fac") in the source stores inverse factorials. Finally, a zero vector $R_k^(sans(T)) v$ contributes zero to the second term of (7.4); omitting that branch is therefore valid even if the vector is zero only modulo $p$.

The recurrence and base cases prove by induction on $\( s \, k \)$ that #raw("calc(s,k,e,v)") returns $F_(s \, k \, e) \( v \)$. At the initial call $s = k = n$ and $e = 0$, the weight in (7.3) is $1 \/ z_rho$. Thus (7.1) identifies the output as

#[#set math.equation(numbering: n => "(7.6)")
 $ F_(n \, n \, 0) \( \[ lambda \] \)_nu = g \( lambda \, lambda \, nu \) med \( mod med p \) . $ <eq:finite-output>]

=== 7.2 Exact implementation <exact-implementation>

Pad a partition $lambda$ with zero parts to length $64$, and encode it by the beta set

$ B_lambda = { 64 + lambda_j - j : 1 lt.eq j lt.eq 64 } subset.eq { 0 \, dots.h \, 127 } . $

There are $64$ beads, and their positions sum to $2016 + \| lambda \|$. The partition enumeration starts with $B_diameter = { 0 \, dots.h \, 63 }$ and moves the $j$th bead to $64 + lambda_j - j$ while selecting nonincreasing parts. It enumerates every partition exactly once.

Moving a bead from $x$ to an empty position $x + k$ adds a border strip of size $k$. If the bead passes $r$ other beads, the strip occupies $r + 1$ rows, giving the sign $\( - 1 \)^r$. For the bit mask $b$ of $B_lambda$, the expression

$ b & \( \( tilde.op b \) gt.double k \) $

selects just the permitted starting positions. Its top $k$ bits are zero, so every selected position satisfies $x + k lt.eq 127$. With $m = 2^x$ and $t = 2^(x + k)$, the mask $t - 2 m$ has exactly the bits strictly between the two positions. Thus #raw("cnt((t-m-m)&b)") supplies precisely the strip leg length. The routine #raw("op") implements $R_k$ or its transpose according to its direction argument.

The finite beta-set identity

$ B_(lambda^t) = { 0 \, dots.h \, 127 } \\ { 127 - x : x in B_lambda } $

shows that #raw("sym") tests self-conjugacy by requiring opposite bits at positions $i$ and $127 - i$. Searching only these diagrams is legitimate; indeed

$ g \( lambda \, lambda \, \( 1^n \) \) = chevron.l chi^lambda \, chi^lambda "sgn" chevron.r = cases(delim: "{", 1 \, & lambda = lambda^t \,, 0 \, & lambda eq.not lambda^t .) $

The floating-point score orders candidates by the logarithm of their hook product. It is finite and affects only search order, never the arithmetic certificate or the list of available candidates. The search stops as soon as one candidate passes the test for every target.

We record the implementation bounds to make the use of machine arithmetic explicit. Residues lie in $\[ 0 \, p - 1 \]$; their sum is at most $2000000016$, within a signed $32$-bit integer, and their product fits a signed $64$-bit integer. All mask shifts are between $0$ and $127$ and use unsigned $128$-bit arithmetic. The possible final enumeration argument #raw("pos=-1") occurs only after the last part has been placed, and the routine returns before shifting. Bit scans receive nonzero masks. All degree indices lie in $\[ 0 \, 64 \]$. In a non-base recursive step $k gt.eq 2$, at most $32$ parts of size $k$ can be selected, so the inverse-array indices are also in range.

The partition-count recurrence, adding parts of sizes $1 \, 2 \, dots.h \, 64$, gives

$ \| cal(P)_64 \| = 1741630 \, #h(2em) sum_(s = 0)^64 \| cal(P)_s \| = 12308139 . $

The largest padded hash table has $4194304$ entries and is at most half full. Hash arithmetic wraps only in unsigned types; collisions are resolved by equality of complete $128$-bit masks. To see that every queried mask occurs in its table, sort its $64$ occupied positions as $b_1 > dots.h.c > b_64 gt.eq 0$. The numbers $b_j - 64 + j$ are nonnegative and nonincreasing, hence form a partition. Moving one bead by $k$ increases their sum by $k$, so the lookup is in precisely the enumerated target degree. Conversely, a size-at-most-$64$ partition never requires a position outside the mask.

#proof[
  For each self-conjugate candidate $lambda$, the program evaluates (7.6) modulo one or, if needed, both of the two primes. Its array #raw("ok") is initialized afresh for that candidate, and records whether each coordinate has a nonzero residue for at least one prime. Therefore a successful return for an eligible degree certifies one and the same $lambda$ for all target partitions $nu$. Since each Kronecker coefficient is a nonnegative integer, a nonzero residue implies positive multiplicity. No bound on the coefficient sizes or reconstruction from the two moduli is required. A residue that vanishes for both primes is inconclusive: this is a sufficient test for positivity, and an unsuccessful search would not prove nonexistence.
  The recorded calculation compiled the source in Appendix 10 with GNU C++ 13.3.0 and executed it for exactly the $61$ eligible degrees ${ 1 \, 3 \, 5 \, 6 \, 7 \, 8 } union { 10 \, 11 \, dots.h \, 64 }$. Every invocation returned success. The complete execution record is ; records the source and log identities. These successful invocations establish the required existence statement in every eligible degree of the finite range. The record contains exit statuses rather than the selected partitions; their meaning is the successful return condition of the source just analyzed. ◻
]

=== 7.3 Reproducibility and independent checks <reproducibility-and-independent-checks>

The files #raw("smallcode_submitted.cpp"), #raw("smallcode_dump.cpp"), and #raw("smallcode_verify.py") accompany this proof under ; the execution records are under . From , the complete check can be reproduced in Bash by

#raw(block: true, lang: "bash", "g++ -O3 -std=c++17 smallcode_submitted.cpp -o smallcode_submitted\npython3 smallcode_verify.py runs 1 3 {5..8} {10..64} \\\n  --seconds 300 --log ../computation/recheck.log")

Each child has a $1536$-MiB address-space limit, a $300$-second wall limit and a $301$-second CPU limit. The driver returns failure if any child fails or times out. The complete expected set of eligible degrees must be checked: the three excluded degrees are deliberately skipped by the C++ program and their zero exit statuses do not certify a square.

As an independent check of the implementation, the dump harness exposes every square vector at degrees $1$ through $12$, together with dimensions, self-conjugacy flags, and a nontrivial mixed input vector. The Python verifier computes integer characters by enumerating contained grid diagrams and testing border strips for connectivity and the absence of a $2 times 2$ square. Thus its strip enumeration and signs do not reuse the bead implementation. It checks character orthogonality, computes exact integer Kronecker coefficients using conjugacy-class sizes, and compares every exposed coefficient modulo both primes. Every comparison passed, including the dimensions and mixed vectors; the exact calculation also finds no covering square in degrees $2 \, 4 \, 9$. The dump harness ran through degree $12$ with undefined-behavior sanitization enabled and reported no failure. These checks are recorded in and can be repeated with

#raw(block: true, lang: "bash", "g++ -O2 -std=c++17 -fsanitize=undefined \\\n  -fno-sanitize-recover=all smallcode_dump.cpp -o smallcode_dump_ubsan\npython3 smallcode_verify.py compare {1..12} \\\n  --log ../computation/recheck-independent.log")

Before comparing coefficients, the Python verifier requires every expected record to occur exactly once, including every square vector under both moduli. Its fault-injection tests reject missing or duplicate records even when the child exits successfully. These tests can be run with

#raw(block: true, lang: "bash", "python3 -m unittest -v test_smallcode_verify.py")

== 8 Completion of the proof <sec:completion>

#proof[
  If the largest parity-compatible staircase index is less than nine, Lemma 7 gives $n lt.eq 64$. Proposition 30 supplies one self-conjugate partition whose square contains every irreducible, for every eligible degree in this range.
  Otherwise choose the single self-conjugate partition $L$ of (3.3). If $r = 0$, it is a staircase and Theorem 6 applies. Suppose $r > 0$, and fix any target partition of $n$. Proposition 29 shows that this target, or its transpose, satisfies one of the proved band or balance support tests. Hence it occurs in $S^L ⊗ S^L$, using transpose invariance from Lemma 7 when necessary. Since $L$ depends only on $n$, the same square contains every target. This proves the theorem. ◻
]

The finite calculations in this proof serve two distinct purposes. The capacity programs exhaust the explicitly listed intermediate parameters of the fixed family $L$; the character program proves existence directly in all eligible degrees at most $64$. Neither calculation assumes that the fixed family works beyond a numerically observed threshold. Beyond the listed finite ranges, the sufficient tests and diagram-area inequalities give the proof.

== 9 Exact capacity verification <app:capacity-code>

The following standalone Python 3 file, , contains both finite capacity checks. The mathematical justification of its tests and pruning rules is in Section 6. From the #raw("verification/code") directory, run

#quote(block: true)[
  python3 capacity\_checks.py intermediate python3 capacity\_checks.py exceptional
]

Assertions must be enabled: do not use #raw("-O"). The accompanying provides separate checks of enumeration and dominance. In the listing, #raw("B") and #raw("C") are the collections of full-degree and lower support multisets of Section 6. The routines #raw("bound"), #raw("hit"), and #raw("gen") implement, respectively, the prefix bound, the big-pair allocation, and diagonal-hook enumeration.

#raw(block: true, lang: "Python", "")

== 10 Exact square-coefficient verification <app:smallcode>

This is the complete C++ verifier justified in Section 7. Compile with a compiler supporting #raw("unsigned __int128"), for example #raw("g++ -O3 -std=c++17"), and supply one integer degree $1 lt.eq n lt.eq 64$, $n in.not { 2 \, 4 \, 9 }$, as its argument. A zero exit status certifies the search for that supplied degree only. The three excluded degrees are deliberately skipped without certification. The accompanying independent harness and execution records are described in . The arrays #raw("masks") and #raw("dimv") store beta sets and dimensions; #raw("fac") stores inverse factorials. The routines #raw("op") and #raw("calc") implement the border-strip operator and the coefficient-vector recurrence of Section 7.

#raw(block: true, lang: "C++", "")

#heading(level: 1)[References]
#bibitem([1])[Christine Bessenrodt. Critical classes, Kronecker products of spin characters, and the Saxl conjecture. #emph[Algebraic Combinatorics] #strong[1] (2018), no.~3, 353--369. #link("https://doi.org/10.5802/alco.18")[doi:10.5802/alco.18].]
#bibitem([2])[Christine Bessenrodt and Chris Bowman. Splitting Kronecker squares, 2-decomposition numbers, Catalan combinatorics, and the Saxl conjecture. #emph[Algebraic Combinatorics] #strong[6] (2023), no.~4, 863--899. #link("https://doi.org/10.5802/alco.294")[doi:10.5802/alco.294].]
#bibitem([3])[Christine Bessenrodt, Chris Bowman, and Louise Sutton. Kronecker positivity and 2-modular representation theory. #emph[Transactions of the American Mathematical Society, Series B] #strong[8] (2021), 1024--1055. #link("https://doi.org/10.1090/btran/70")[doi:10.1090/btran/70].]
#bibitem([4])[Andrew A.~H. Brown, Stephanie van Willigenburg, and Mike Zabrocki. Expressions for Catalan Kronecker products. #emph[Pacific Journal of Mathematics] #strong[248] (2010), no.~1, 31--48. #link("https://doi.org/10.2140/pjm.2010.248.31")[doi:10.2140/pjm.2010.248.31].]
#bibitem([5])[Mahdi Ebrahimi. The problem of deciding the positivity of Kronecker coefficients and Saxl conjecture. Preprint, version~3, November 26, 2025. #link("https://arxiv.org/abs/2511.03484v3")[arXiv:2511.03484v3].]
#bibitem([6])[William Fulton and Joe Harris. #emph[Representation Theory: A First Course]. Graduate Texts in Mathematics, vol.~129. Springer-Verlag, New York, 1991. #link("https://doi.org/10.1007/978-1-4612-0979-9")[doi:10.1007/978-1-4612-0979-9].]
#bibitem([7])[Nate Harman and Christopher Ryba. A tensor-cube version of the Saxl conjecture. #emph[Algebraic Combinatorics] #strong[6] (2023), no.~2, 507--511. #link("https://doi.org/10.5802/alco.267")[doi:10.5802/alco.267].]
#bibitem([8])[Gerhard Heide, Jan Saxl, Pham Huu Tiep, and Alexandre E. Zalesski. Conjugacy action, induced representations and the Steinberg square for simple groups of Lie type. #emph[Proceedings of the London Mathematical Society] (3) #strong[106] (2013), no.~4, 908--930. #link("https://doi.org/10.1112/plms/pds062")[doi:10.1112/plms/pds062]. Preprint: #link("https://arxiv.org/abs/1209.1768")[arXiv:1209.1768].]
#bibitem([9])[Christian Ikenmeyer. The Saxl conjecture and the dominance order. #emph[Discrete Mathematics] #strong[338] (2015), no.~11, 1970--1975. #link("https://doi.org/10.1016/j.disc.2015.04.027")[doi:10.1016/j.disc.2015.04.027]. Preprint: #link("https://arxiv.org/abs/1410.6549v2")[arXiv:1410.6549v2].]
#bibitem([10])[G.~D. James. #emph[The Representation Theory of the Symmetric Groups]. Lecture Notes in Mathematics, vol.~682. Springer-Verlag, Berlin, 1978. #link("https://doi.org/10.1007/BFb0067708")[doi:10.1007/BFb0067708].]
#bibitem([11])[Emmanuel Letellier. Tensor products of unipotent characters of general linear groups over finite fields. #emph[Transformation Groups] #strong[18] (2013), no.~1, 233--262. #link("https://doi.org/10.1007/s00031-013-9211-3")[doi:10.1007/s00031-013-9211-3].]
#bibitem([12])[Emmanuel Letellier and GyeongHyeon Nam. The Saxl conjecture and the tensor square of unipotent characters of $"GL"_n \( q \)$. #emph[Algebraic Combinatorics] #strong[8] (2025), no.~4, 1119--1140. #link("https://doi.org/10.5802/alco.434")[doi:10.5802/alco.434].]
#bibitem([13])[Xin Li. Saxl Conjecture for triple hooks. #emph[Discrete Mathematics] #strong[344] (2021), no.~6, article 112340. #link("https://doi.org/10.1016/j.disc.2021.112340")[doi:10.1016/j.disc.2021.112340].]
#bibitem([14])[Sammy Luo and Mark Sellke. The Saxl conjecture for fourth powers via the semigroup property. #emph[Journal of Algebraic Combinatorics] #strong[45] (2017), no.~1, 33--80. #link("https://arxiv.org/abs/1511.02387v2")[arXiv:1511.02387v2].]
#bibitem([15])[I.~G. Macdonald. #emph[Symmetric Functions and Hall Polynomials], second edition. Oxford Mathematical Monographs. Clarendon Press, Oxford, 1995. #link("https://doi.org/10.1093/oso/9780198534891.001.0001")[doi:10.1093/oso/9780198534891.001.0001].]
#bibitem([16])[OpenAI. A Cyclic Polytabloid Proof of Saxl's Conjecture. OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026/paper.pdf")[OAI:A-Cyclic-Polytabloid-Proof-of-Saxls-Conjecture-September-24-2026], 2026. Theorem~3.1, proved in Section~6.]
#bibitem([17])[Igor Pak, Greta Panova, and Ernesto Vallejo. Kronecker products, characters, partitions, and the tensor square conjectures. #emph[Advances in Mathematics] #strong[288] (2016), 702--731. #link("https://doi.org/10.1016/j.aim.2015.11.002")[doi:10.1016/j.aim.2015.11.002]. Preprint: #link("https://arxiv.org/abs/1304.0738v2")[arXiv:1304.0738v2]. Cited numbering follows this version.]
#bibitem([18])[Andrei Zelevinsky. Littlewood--Richardson semigroups. In #emph[New Perspectives in Algebraic Combinatorics], Louis J. Billera, Anders Björner, Curtis Greene, Rodica Simion, and Richard P. Stanley (eds.), Mathematical Sciences Research Institute Publications, vol.~38, Cambridge University Press, Cambridge, 1999, pp.~337--345. #link("https://library.slmath.org/books/Book38/files/zelevinsky.pdf")[Institutional full text].]


