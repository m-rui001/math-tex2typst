#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[The maximum number of mutually unbiased bases \
in dimension six]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Two orthonormal bases $cal(B)$ and $cal(C)$ of $bb(C)^d$ are #emph[mutually unbiased] if

$ \| chevron.l b \, c chevron.r \|^2 = 1 / d #h(2em) \( b in cal(B) \, med c in cal(C) \) . $

Here $chevron.l u \, v chevron.r = sum_j overline(u_j) v_j$. For $d gt.eq 2$, let $N \( d \)$ be the largest number of pairwise mutually unbiased orthonormal bases in $bb(C)^d$. Our main result is the following.

#thm([Theorem 1.1.])[
  (Computer-assisted).  #emph[Under the arithmetic and compiler conditions in Appendix 9, the fresh complete execution documented in Section 7.5 certifies that there are no four pairwise mutually unbiased orthonormal bases in $bb(C)^6$. Consequently, $N \( 6 \) = 3$.]
] <thm:main>

A common unitary transformation makes one basis the coordinate basis. The second is then the column basis of $H \/ sqrt(6)$, where $H$ is a complex matrix satisfying

$ \| H_(i j) \| = 1 \, #h(2em) H H^(*) = 6 I . $

Such an unscaled matrix is called a complex Hadamard matrix. The upper-bound problem is to exclude an extension of this pair by #emph[two] further bases, for every possible $H$. The second basis is unrestricted: the argument covers arbitrary complex Hadamard matrices, including those outside previously studied families.

=== 1.1 Historical context and scope <historical-context-and-scope>

Mutually unbiased bases describe projective measurements for which a state from one basis produces the uniform outcome distribution in every other basis. This finite-dimensional form of complementarity appears in Schwinger’s unitary-operator framework #cite(label("Schwinger1960Unitary")). Ivanović developed the state-determination problem and prime-dimensional constructions #cite(label("Ivanovic1981StateDetermination")); Wootters and Fields proved the statistical optimality of complete sets for state determination and constructed them in every prime-power dimension #cite(label("WoottersFields1989")). One has $N \( d \) lt.eq d + 1$; an operator-space proof and further prime-power constructions are given in #cite(label("BandyopadhyayEtAl2002")). Dimension six is the first dimension outside the prime-power class.

The tensor-product construction gives three bases in $bb(C)^6$ #cite(label("KlappeneckerRotteler2004")) Section 4. Zauner’s dimension-six MUB conjecture asserts that this lower bound is sharp. Its origin is traced to his 1991 diploma thesis #cite(label("Zauner1991Diploma")); see also the historical account in #cite(label("McNultyWeigert2026Review")) Section 2.3. His doctoral thesis states the corresponding quantum-design conjecture #cite(label("Zauner1999")) Section 3.3, later translated in #cite(label("Zauner2011")). The equation $N \( 6 \) = 3$ appears explicitly as Conjecture 1 of #cite(label("KlappeneckerRotteler2004")) Section 4.

Several complementary approaches developed the dimension-six problem. Grassl proved that the standard–Fourier pair cannot belong to four mutually unbiased bases #cite(label("Grassl2004SICMUB6")) Theorem 2. Bengtsson and collaborators studied its unbiased vectors and the surrounding landscape of Hadamard families #cite(label("BengtssonEtAl2007MUBHadamard")). Numerical searches by Butterley and Hall #cite(label("ButterleyHall2007Numerical")) and by Brierley and Weigert #cite(label("BrierleyWeigert2008")) supplied evidence for the conjecture. Brierley and Weigert also used algebraic equations to enumerate unbiased vectors for specified Hadamards #cite(label("BrierleyWeigert2009")); their Section 3.4 supplies rigorous approximation bounds for exact input matrices, while their Section 4.3 explains the limitations introduced by rounding coefficients in sampled non-affine families.

The closest antecedent of the present proof is the certified discretization of Jaming, Matolcsi, Móra, Szöllősi and Weiner. They proved that the standard basis together with any member of the two-parameter Fourier family cannot be extended to four bases #cite(label("JamingEtAl2009")) Theorem 1.4. Their Section 3 combines phase intervals, rigorous error bounds, subdivision, and exhaustive compatibility tests. Jaming, Matolcsi and Móra subsequently formulated an unrestricted discretization program #cite(label("JamingMatolcsiMora2010")) Sections 2–4. The present proof completes an exhaustive cover of arbitrary second bases. The completion and displacement estimates described below reduce this cover to a finite search with certified error bounds.

Recent work on triples retains conjectural sufficient conditions for $N \( 6 \) = 3$ #cite(label("MatolcsiEtAl2026")) Section 4. The classification preprint of Cárdenes Wuttig and Tindall concerns individual order-six Hadamard matrices and leaves their MUB compatibility unresolved #cite(label("CardenesWuttigTindall2026Classification")) Section VI. Our proof constructs a cover of arbitrary second bases directly. Its upper bound combines that exhaustive cover with local exclusion of two further bases and the complete execution and arithmetic contract of Theorem 58.

=== 1.2 The covering and exclusion strategy <the-covering-and-exclusion-strategy>

The second basis varies throughout the search, so the cover must retain its possible displacement while testing additional vectors. The proof first covers every second basis by balls in its real entrywise phases, then excludes two further bases uniformly throughout each ball. Figure 1 summarizes the five parts of this argument.

+ Row and column rephasings make the first row and column of $H$ equal to one. The first two rows and columns then contain nine remaining phases. A symmetry reduction and necessary interval tests cover their possible values by finitely many seed balls (2).
+ In Stage A, write $H$ in blocks with row and column sizes $2 + 4$. The seed fixes the upper-left, upper-right, and lower-left blocks up to their phase displacements; the lower-right $4$-by-$4$ block remains to be completed. At each seed center that passes the frame checks, the upper-right block and the conjugate transpose of the lower-left block have rank two, and hence two-dimensional kernels in $bb(C)^4$. Compressing the unknown block between these kernels gives a $2$-by-$2$ matrix. The Hadamard equations bound its distance from $sqrt(6)$ times its unitary polar factor. A closed cover of $U \( 2 \)$, the group of $2$-by-$2$ unitary matrices, therefore accounts for every feasible completion. Uniform Taylor bounds either exclude a cell or place all its exact completions in certified phase balls (Section 3, Section 4). The frames for these kernels remain fixed at the seed center, which need not itself be feasible.
+ In Stage B, each ball carries numerical directions approximating the tangent directions of the Hadamard equations. A verified residual identity bounds the error in representing every exact solution displacement by these directions. Covering the tangent coordinates and retaining this normal bound yields smaller balls covering all the same exact solutions (5). No manifold parametrization is required.
+ In Stage C, a phase-bin search in each final ball covers every vector unbiased to the first two bases by small vector balls. Make these vector balls the vertices of two graphs: an $cal(O)$ edge retains a possible orthogonal pair, and a $cal(U)$ edge retains a possible unbiased pair. Necessary tests remove only impossible edges. Two additional bases would require two disjoint six-cliques in $cal(O)$, with all $36$ cross edges in $cal(U)$. The finite search excludes this pattern (6).
+ The complete execution accounts for every seed, every refined ball, and every initially unresolved record. The fallback finishes with no unresolved record (7).

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), fill: rgb("#f7f7ff"), [#text(size: 9pt)[Arbitrary second basis $H/ sqrt(6)$#linebreak()Symmetries and closed phase bins $arrow.r.long$ nine-phase seed balls]])])
  content((0, -1), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), fill: rgb("#f7f7ff"), [#text(size: 9pt)[Stage A: all completions of each seed#linebreak()Fixed frames and a polar factor $arrow.r.long$ a complete $U(2)$ cover]])])
  content((0, -2), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), fill: rgb("#f7f7ff"), [#text(size: 9pt)[Stages A and B: certified phase balls#linebreak()Approximate tangent coordinates + bounded normal displacement]])])
  content((0, -3), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), fill: rgb("#f7f7ff"), [#text(size: 9pt)[Stage C: all possible additional vectors#linebreak()Closed vector bins $arrow.r.long$ vector balls $arrow.r.long$ two compatibility graphs]])])
  content((0, -4), [#box(inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#000073")), fill: rgb("#f7f7ff"), [#text(size: 9pt)[Every required two-clique pattern excluded#linebreak()Every unresolved record retained, refined, and checked in the fallback]])])
  line((0, 0), (0, -1), stroke: (paint: rgb("#000073")))
  line((0, -1), (0, -2), stroke: (paint: rgb("#000073")))
  line((0, -2), (0, -3), stroke: (paint: rgb("#000073")))
  line((0, -3), (0, -4), stroke: (paint: rgb("#000073")))
})],
  caption: [Figure 1: The proof preserves every exact candidate through successive covers. An exclusion removes a region only after a necessary condition fails with its certified margin. The execution documented in Section 7.5 supplies the finite coverage and terminal-exclusion premises of Theorem 58. ],
) <fig:proof-flow>

The distinction between proposing a numerical object and certifying it is used throughout. A floating-point center need not be an exact Hadamard matrix. A computed small eigenspace need not parametrize a component. A numerical linear solve need not be accurate: its output is accepted only when a separate bound verifies the required inequality. Every rejection uses a necessary condition with an explicit safety margin. A failed certification or an exhausted search cap retains an unresolved region; it cannot prove nonexistence.

All interval cells may be taken closed. Their overlap, repeated phase representatives, and redundant balls or graph vertices can weaken the exclusion but do not omit a possible configuration. The arithmetic premises are stated, and the finite ranges and rounding margins are proved, in 9. The accompanying execution and build archives, identified in #raw("verification/computation/README.md"), preserve the evidence for the fresh run documented in Section 7.5. This proof uses that run. The separate September 7 execution reported in the source manuscript has not been authenticated here.

=== 1.3 The elementary lower bound <the-elementary-lower-bound>

The lower bound uses only the tensor-product construction mentioned above. We give it explicitly to separate attainment of three bases from the computer-assisted exclusion of four.

#thm([Lemma 1.2.])[
  (Three mutually unbiased bases in dimension six).  #emph[There exist three pairwise mutually unbiased orthonormal bases in $bb(C)^6$.]
] <lem:three-mub-six>

#proof[
  Identify $bb(C)^6$ with $bb(C)^2 ⊗ bb(C)^3$ in the standard product coordinates. Define
  $ A_0 = I_2 \, #h(2em) A_1 = 1 / sqrt(2) mat(delim: "(", 1, 1; 1, - 1) \, #h(2em) A_2 = 1 / sqrt(2) mat(delim: "(", 1, 1; i, - i) . $
  These matrices are unitary, and for $r eq.not s$ every entry of $A_r^(*) A_s$ has squared modulus $1 \/ 2$; the only cross product that is not immediate from the entries is
  $ A_1^(*) A_2 = 1 / 2 mat(delim: "(", 1 + i, 1 - i; 1 - i, 1 + i) . $
  Let $omega = e^(2 pi i \/ 3)$, and set
  $ F = 1 / sqrt(3) \( omega^(j k) \)_(j \, k = 0)^2 \, #h(2em) D = "diag" \( 1 \, omega \, omega \) \, #h(2em) B_0 = I_3 \, quad B_1 = F \, quad B_2 = D F . $
  The identity $1 + omega + omega^2 = 0$ shows that $F$ is unitary; $D$ is unitary as well. Both $F$ and $D F$ have entries of squared modulus $1 \/ 3$. For their cross product,
  $ \( F^(*) D F \)_(j k) = 1 / 3 sum_(x = 0)^2 omega^(x^2 + \( k - j \) x) . $
  If $t = k - j$ is read modulo $3$, the sum on the right is $1 + 2 omega$ for $t = 0$ and $2 + omega^2$ for $t = 1 \, 2$. Each has squared modulus $3$. Consequently every entry of $B_r^(*) B_s$ has squared modulus $1 \/ 3$ when $r eq.not s$.
  For $r = 0 \, 1 \, 2$, let the columns of $U_r = A_r ⊗ B_r$ form the $r$th basis. Each $U_r$ is unitary. For $r eq.not s$,
  $ U_r^(*) U_s = \( A_r^(*) A_s \) ⊗ \( B_r^(*) B_s \) \, $
  so every entry has squared modulus $\( 1 \/ 2 \) \( 1 \/ 3 \) = 1 \/ 6$. Thus these three bases are mutually unbiased, and $U_0 = I_6$. ◻
]

=== 1.4 A Lie-algebra consequence <a-lie-algebra-consequence>

An orthonormal basis $cal(B)$ of $bb(C)^6$ determines the Cartan subalgebra $frak(h)_(cal(B))$ of traceless matrices diagonal in that basis. It is spanned by the matrices $b b^(*) - I \/ 6$ for $b in cal(B)$. The Killing form on $frak(s l)_6 \( bb(C) \)$ is $K \( X \, Y \) = 12 "tr" \( X Y \)$; two subalgebras are #emph[Killing-orthogonal] when this form vanishes between them. For unit vectors $b \, c$,

$ "tr" #scale(x: 120%, y: 120%)[\(] \( b b^(*) - I \/ 6 \) \( c c^(*) - I \/ 6 \) #scale(x: 120%, y: 120%)[\)] = \| chevron.l b \, c chevron.r \|^2 - 1 / 6 . $

Thus two bases are mutually unbiased exactly when their associated Cartan subalgebras are Killing-orthogonal. These algebras are closed under the standard adjoint, and the converse correspondence uses this same adjoint condition.

#thm([Corollary 1.3.])[
  (Adjoint-closed Cartan subalgebras).  #emph[Under the arithmetic and compiler conditions of Appendix 9, using the complete execution documented in Section 7.5 as in Theorem 1, the maximum number of pairwise Killing-orthogonal Cartan subalgebras of $frak(s l)_6 \( bb(C) \)$ that are all closed under the same standard adjoint $X mapsto X^(*) = overline(X)^(thin T)$ is three.]
] <cor:adjoint-cartan>

#proof[
  By #cite(label("BoykinSitharamTiepWocjan2005")) Theorem 5.2, such collections of Cartan subalgebras correspond to collections of mutually unbiased orthonormal bases of the same cardinality. Theorem 1 gives the upper bound under its stated contract, and Lemma 2 gives attainment. ◻
]

== 2 Equivalences and an exhaustive seed cover <sec:seed>

The goal is to replace every possible second basis by one of finitely many nine-phase seed balls. Closed phase discretization and necessary compatibility tests follow the approach of #cite(label("JamingEtAl2009")) Section 3 and #cite(label("JamingMatolcsiMora2010")) Sections 2–3. The symmetry reduction and shared-coordinate estimates below prove completeness of this particular seed cover.

We use phases in cycles and write

$ e \( t \) = exp \( 2 pi i t \) \, #h(2em) t in bb(R) \, $

with entrywise application to vectors and matrices. Matrix indices run from $0$ to $5$, and a phase matrix is stored in row-major order, with $\( i \, j \)$ in position $6 i + j$. The Hermitian inner product is $chevron.l u \, v chevron.r = sum_j overline(u_j) v_j$, and $A^(*)$ denotes conjugate transpose. Vectors have their Euclidean norms; a matrix regarded as a phase or displacement vector has Frobenius norm $parallel dot.op parallel_F$. The notation $parallel dot.op parallel_(upright("op"))$ denotes the induced Euclidean operator norm. We identify a complex equation with its real and imaginary parts, in that order, so that a complex scalar and its realification have the same norm. An angle is in radians only when this is stated explicitly.

=== 2.1 Equivalences and phase gauges <equivalences-and-phase-gauges>

#prodef([Definition 2.1.])[
  A matrix $H in bb(C)^(6 times 6)$ is a complex Hadamard matrix here if every entry has modulus one and $H H^(*) = 6 I$. It is #emph[extendible] if the standard basis and the columns of $H \/ sqrt(6)$ belong to a family of four mutually unbiased orthonormal bases.
] <seed:extendibility>

A common unitary maps the first member of any proposed family to the standard basis. Unbiasedness to that basis forces the entries of the second basis matrix to have modulus $1 \/ sqrt(6)$. Thus it is $H \/ sqrt(6)$ for a matrix as in Definition 4; since $H$ is square, $H H^(*) = 6 I$ also gives $H^(*) H = 6 I$. Every such $H$ admits a real phase lift $P$ with $H = e \( P \)$.

#thm([Lemma 2.2.])[
  (Equivalences).  #emph[Extendibility is invariant under row or column permutations, multiplication of rows or columns by unit scalars, complex conjugation, and transposition.]
] <seed:equivalences>

#proof[
  Permuting or rephasing columns only changes the order or phases of vectors within the second basis. A row permutation or row rephasing is a common unitary operation on all four bases; it preserves the standard basis up to the same irrelevant changes. Complex conjugation preserves both orthogonality and the moduli of inner products.
  For transposition, put $U = H \/ sqrt(6)$. Apply the common unitary $U^(*)$ to a family whose first two basis matrices are $I \, U$. These two matrices become $U^(*) \, I$. Interchange their roles and conjugate every coordinate. The first two matrices are now $I \, U^T$. All these operations are reversible, which proves the assertion in both directions. ◻
]

The transposition argument applies to an exact Hadamard matrix. It does not assert that an approximate center supplies a unitary change of basis.

For a real $6$-by-$6$ matrix $z$, define double centering by

$ \( Pi z \)_(i j) = z_(i j) - 1 / 6 sum_b z_(i b) - 1 / 6 sum_a z_(a j) + 1 / 36 sum_(a \, b) z_(a b) . quad "(2.1)" $ <seed:projection-formula>

Its range is the #emph[horizontal] subspace of matrices with every row sum and every column sum zero. We also use unwrapped dephasing,

$ D_0 \( P \)_(i j) = P_(i j) - P_(i 0) - P_(0 j) + P_00 . quad "(2.2)" $ <seed:dephasing-formula>

#thm([Lemma 2.3.])[
  (Horizontal phase representatives).  #emph[The map $Pi$ is the orthogonal projection onto the horizontal subspace. In particular, $parallel Pi z parallel_F lt.eq parallel z parallel_F$. If two phase representatives have difference $z$, the second is equivalent under row and column rephasings to the first plus $Pi z$. This statement remains valid after arbitrary entrywise integer changes of phase representatives.]
] <seed:horizontal>

#proof[
  Formula (2.1) has zero row and column sums, and $z - Pi z$ is a sum of a matrix constant on each row and a matrix constant on each column. Every such sum is orthogonal to the horizontal subspace in the real Frobenius inner product. This proves the projection assertion and its norm bound. If $Q = P + z$, then $P + Pi z = Q - \( z - Pi z \)$ differs from $Q$ by row and column phases, which are allowed by Lemma 5. Entrywise integer additions leave $e \( P \)$ unchanged. ◻
]

Likewise, $D_0 \( P \)$ gives an equivalent matrix with first row and column phases zero. When a wrapped difference is used, its chosen integers define legitimate phase representatives. No argument requires a rounded decision at a half-integer to agree with a uniquely preferred nearest representative.

=== 2.2 A symmetry arrangement for nine phases <a-symmetry-arrangement-for-nine-phases>

The #emph[gap] of a finite circular multiset is its largest circular gap. Equivalently, it is the greatest length of an open arc containing no point of the multiset. Points are counted with multiplicity when sorted; a repeated point contributes a zero gap. For each pair of distinct rows of $P$, consider their six phase differences modulo one, and do the same for each pair of distinct columns.

#thm([Lemma 2.4.])[
  (Seed arrangement).  #emph[Every exact Hadamard matrix has an equivalent dephased representative for which a pair of rows attaining the minimum gap among all row and column pairs is the first pair, and its phases can be written 
$ x = \( 0 \, x_1 \, x_2 \, x_3 \, x_4 \, x_5 \) \, #h(2em) 0 lt.eq x_1 lt.eq dots.h.c lt.eq x_5 lt.eq 1 \, #h(2em) g_x = 1 - x_5 \, #h(2em) x_1 lt.eq x_5 - x_4 . quad "(2.3)" $ <seed:x-arrangement>

 After any one of these five noninitial columns is selected and moved to second position, the last four rows can be permuted so that the second column has phases 
$ y = \( 0 \, xi \, y_2 \, y_3 \, y_4 \, y_5 \) \, #h(2em) 0 lt.eq y_2 lt.eq y_3 lt.eq y_4 lt.eq y_5 lt.eq 1 \, quad "(2.4)" $ <seed:y-arrangement>

 where $xi$ is the selected entry of $x$. These lists satisfy 
$ sum_(j = 0)^5 e \( x_j \) = 0 \, #h(2em) sum_(j = 0)^5 e \( y_j \) = 0 \, #h(2em) g_y gt.eq g_x . quad "(2.5)" $ <seed:local-conditions>

]
] <seed:arrangement>

#proof[
  There are finitely many row and column pairs, so a pair of minimum gap exists. Transpose if it is a column pair, and permute rows to make it the first pair. Choose one of its largest gaps, start the circular ordering immediately after that gap, and use this starting point as the first column. Dephase the first row and column. Ordering the remaining columns along the complementary arc gives $g_x = 1 - x_5$ and the sorted list in (2.3).
  If the final orientation inequality fails, interchange the two selected rows, use the old $x_5$ column as the starting column, and reverse the ordering. The new list is
  $ x'_0 = 0 \, #h(2em) x'_i = x_5 - x_(5 - i) quad \( 1 lt.eq i lt.eq 5 \) . $
  It has the same distinguished largest gap, and $x'_1 = x_5 - x_4$ whereas $x'_5 - x'_4 = x_1$. Thus this orientation satisfies the required inequality whenever the former one does not. The construction uses a chosen largest gap and is unchanged in validity by ties or repeated points.
  Select a noninitial column and place it second. Permuting the last four rows sorts its last four phase entries, without changing either of the first two rows. Orthogonality of those rows gives the first vanishing sum in (2.5); orthogonality of the first two columns gives the second. Row and column rephasings rotate the relevant difference multisets; permutations merely reorder points or relabel pairs. Transposition interchanges the two collections of pairs. Consequently their minimum gap remains $g_x$, and the newly selected column pair has $g_y gt.eq g_x$. ◻
]

Set $N = 112$ and $w = 1 \/ N$. All bins are closed:

$ I_b = \[ b \/ N \, \( b + 1 \) \/ N \] \, #h(2em) u_b = \( b + 1 \/ 2 \) \/ N \, #h(2em) 0 lt.eq b < N . quad "(2.6)" $ <seed:bins>

They cover $\[ 0 \, 1 \]$, including both endpoints. Assignments at shared boundaries need not be unique. Sorted exact phases admit nondecreasing bin indices, so write the five indices for $x_1 \, dots.h \, x_5$ as

$ b^X = \( a \, b \, c \, d \, l \) \, #h(2em) 0 lt.eq a lt.eq b lt.eq c lt.eq d lt.eq l < N . $

The orientation condition implies the necessary integral restriction

$ a / N lt.eq x_1 lt.eq x_5 - x_4 lt.eq frac(l + 1 - d, N) \, #h(2em) a lt.eq l - d + 1 . quad "(2.7)" $ <seed:orientation-filter>

For this index tuple choose $s in { 0 \, dots.h \, 4 }$ as the first minimizer of $\| 2 b_s^X + 1 - N \|$. This is the rule in #raw("seeds::mk"). Its selected original column is $s + 1$, its selected exact phase is $xi = x_(s + 1)$, and the new column order is the original column zero, column $s + 1$, and the other four columns in their former order. This selection only specifies a column; it imposes no further condition on $xi$.

After arranging $y$ as in (2.4), its five varying entries have bins

$ b^Y = \( b_s^X \, b_1^Y \, b_2^Y \, b_3^Y \, b_4^Y \) \, #h(2em) 0 lt.eq b_1^Y lt.eq b_2^Y lt.eq b_3^Y lt.eq b_4^Y < N . $

The shared entry uses precisely the same bin as in $x$; it is not required to be ordered relative to the four tail bins.

#thm([Lemma 2.5.])[
  (Stability of circular gaps).  #emph[If each point of one circular multiset is matched to a point of another at circular distance at most $delta$, their gaps differ by at most $2 delta$.]
] <seed:gap-stability>

#proof[
  Take an empty open arc of length $L$ in the first multiset. If $L > 2 delta$, trim $delta$ from each end. A point of the second multiset inside the remaining open arc would have its matched first point in the original empty arc, a contradiction. Hence the second gap is at least $L - 2 delta$. If $L lt.eq 2 delta$, the same lower bound follows from nonnegativity. Apply this to a largest gap and then interchange the two multisets. No preservation of the sorted order is used. ◻
]

#thm([Lemma 2.6.])[
  (Necessary midpoint gap filters).  #emph[For every bin pair containing lists as in Lemma 7, the midpoint gaps, including the fixed zero, satisfy 
$ g_(x \, upright("mid")) lt.eq 1 - frac(l - 1, N) \, #h(2em) g_(y \, upright("mid")) gt.eq 1 - frac(l + 2, N) . quad "(2.8)" $ <seed:gap-inequalities>

]
] <seed:gap-filters>

#proof[
  Each varying phase is within $w \/ 2$ of its midpoint, and the initial zero is unchanged. Lemma 8 bounds each gap change by $w$. Since $x_5 in \[ l \/ N \, \( l + 1 \) \/ N \]$, we have $1 - \( l + 1 \) \/ N lt.eq g_x lt.eq 1 - l \/ N$. Combining these inequalities with $g_y gt.eq g_x$ proves both assertions. ◻
]

For sorted midpoint bin indices $q_0 \, dots.h \, q_4$, the gap used by #raw("mk") is

$ max {frac(q_0 + 1 \/ 2, N) \, frac(q_1 - q_0, N) \, dots.h \, frac(q_4 - q_3, N) \, 1 - frac(q_4 + 1 \/ 2, N)} . $

For a $Y$ tuple it sorts a copy solely for this computation, preserving the stored shared-first ordering.

=== 2.3 Vanishing-sum filters and the shared displacement <vanishing-sum-filters-and-the-shared-displacement>

For either list, let $u = \( u_0 \, dots.h \, u_4 \)$ be its five varying midpoints. Define the real two-vector $c$ and real $2$-by-$5$ matrix $J$ by

$ c = frac(1 + sum_(j = 0)^4 e \( u_j \), 2 pi i) \, #h(2em) J_j = e \( u_j \) \, quad "(2.9)" $ <seed:residual-data>

using realification in both definitions.

#thm([Lemma 2.7.])[
  (Necessary sum test).  #emph[If $1 + sum_(j = 0)^4 e \( u_j + Delta_j \) = 0$ and $\| Delta_j \| lt.eq w \/ 2$, then 
$ parallel c + J Delta parallel lt.eq frac(5 pi w^2, 4) . quad "(2.10)" $ <seed:taylor-residual>

 In particular, for every $v in bb(R)^2$, 
$ \| v dot.op c \| lt.eq frac(5 pi w^2, 4) parallel v parallel + w / 2 sum_(j = 0)^4 \| v dot.op J_j \| . quad "(2.11)" $ <seed:sum-support>

]
] <seed:sum-test>

#proof[
  The second derivative of $e \( t \)$ has modulus $4 pi^2$. Taylor’s formula with integral remainder therefore gives
  $ lr(|frac(e \( u_j + Delta_j \) - e \( u_j \), 2 pi i) - e \( u_j \) Delta_j|) lt.eq pi Delta_j^2 . $
  Sum the five remainders and use the vanishing-sum hypothesis to obtain (2.10). Taking the dot product with $v$, followed by the triangle inequality and $\| Delta_j \| lt.eq w \/ 2$, gives (2.11). ◻
]

The function #raw("sumok") tests (2.11) in the residual direction and in directions perpendicular to the five unit-exponential columns. The inequality holds for every real direction, so their numerical construction need not reproduce any prescribed exact direction. The one-sided margins for evaluating the residuals and supports are established in Section 9.

In grid units $h = N Delta$, write

$ E = frac(5 pi, 4 N) \, #h(2em) parallel J h + N c parallel lt.eq E \, #h(2em) \| h_j \| lt.eq 1 / 2 . quad "(2.12)" $ <seed:grid-error>

#thm([Lemma 2.8.])[
  (Shared-coordinate intervals).  #emph[Let $t$ be the position of a shared entry in one of the two lists. Every feasible displacement satisfies, for each $v in bb(R)^2$, 
$ \| N v dot.op c + \( v dot.op J_t \) h_t \| lt.eq E parallel v parallel + 1 / 2 sum_(j eq.not t) \| v dot.op J_j \| . quad "(2.13)" $ <seed:clip-inequality>

 If $a = v dot.op J_t eq.not 0$ and the right side is $r$, this is the closed interval constraint 
$ - frac(N v dot.op c, a) - frac(r, \| a \|) lt.eq h_t lt.eq - frac(N v dot.op c, a) + frac(r, \| a \|) . quad "(2.14)" $ <seed:clip-interval>

 The intervals obtained for the shared entry from $X$ and $Y$ must intersect.]
] <seed:shared-interval>

#proof[
  Separate the shared term in (2.12), take its dot product with $v$, and bound each remaining coordinate by $1 \/ 2$. Solving the resulting absolute-value inequality gives (2.14) for either sign of $a$. The shared midpoint is identical in both lists, so the same exact grid displacement belongs to both sets of necessary intervals. ◻
]

The function #raw("extend") begins with $\[ - 1 \/ 2 \, 1 \/ 2 \]$ and intersects these constraints, using the shared column direction and directions perpendicular to the other four columns. Here $t = s$ for $X$ and $t = 0$ for $Y$. It omits divisors of magnitude below $10^(- 6)$, which only removes a constraint. Numerator and endpoint margins enlarge the computed intervals, as proved in Section 9. The pair is rejected only when the two resulting intervals are strictly disjoint; a common endpoint is retained.

The enumeration in #raw("seeds::build") now has an explicit interpretation. It visits every weakly increasing five-bin $X$ tuple and applies (2.7), the first inequality in (2.8), and #raw("sumok"). Separately, for every possible first bin it visits all weakly increasing four-bin $Y$ tails and applies #raw("sumok"). The program #raw("covout") matches the shared bin, applies the second gap inequality, and intersects the shared displacement intervals. Every discarded exact solution would therefore violate one of the necessary conditions just proved. The numerical gap comparisons include outward slack, treated in Section 9.

=== 2.4 Certified reuse of seed centers <certified-reuse-of-seed-centers>

The nine seed coordinates, before moving the selected column, are

$ q = \( x_1 \, x_2 \, x_3 \, x_4 \, x_5 \, y_2 \, y_3 \, y_4 \, y_5 \) in bb(R)^9 . quad "(2.15)" $ <seed:nine-coordinates>

For a bin pair let $u in bb(R)^9$ be its rational midpoint and put $h = N \( q - u \)$. Thus $h in \[ - 1 \/ 2 \, 1 \/ 2 \]^9$; the shared displacement is $h_s$. Retaining $u$ as a center would cover the entire bin with radius $3 \/ \( 2 N \) < 0.032$. To reduce the number of centers, we instead test whether its feasible portion lies in a radius-$0.032$ ball about a previously retained midpoint. If no such test succeeds, we retain $u$.

Let $J_X \, J_Y \, c_X \, c_Y$ denote the data in (2.9). Define a real $4$-by-$9$ matrix $J_(*)$ by specifying its action:

$ J_(*) h = vec(J_X \( h_0 \, h_1 \, h_2 \, h_3 \, h_4 \)^T, J_Y \( h_s \, h_5 \, h_6 \, h_7 \, h_8 \)^T) \, #h(2em) p_(*) = vec(- N c_X, - N c_Y) . quad "(2.16)" $ <seed:stacked-system>

For feasible $h$ we have $J_(*) h = p_(*) + r_(*)$, where the two real two-vector blocks $r_X \, r_Y$ of $r_(*)$ satisfy $parallel r_X parallel \, parallel r_Y parallel lt.eq E$.

#thm([Lemma 2.9.])[
  (Support bounds for center reuse).  #emph[Let $u'$ be a previously retained midpoint with the same selected position $s$, and let $k = N \( u - u' \) in bb(Z)^9$. Every feasible displacement in the current bin pair satisfies 
$ N^2 parallel q - u' parallel^2 = parallel k + h parallel^2 lt.eq parallel k parallel^2 + 9 / 4 + 2 k dot.op h . quad "(2.17)" $ <seed:distance-bound>

 Two upper bounds for the last term are 
$ 2 k dot.op h & lt.eq sum_(j = 0)^8 \| k_j \| \,\
2 k dot.op h & lt.eq sum_(j = 0)^8 \| k_j - \( J_(*)^T v \)_j \| + 2 v dot.op p_(*) + 2 E \( parallel v_X parallel + parallel v_Y parallel \) \, #h(2em) v in bb(R)^4 \, quad "(2.18)" $ <seed:box-support>

 where $v_X \, v_Y$ are the two real two-vector blocks of $v$.]
] <seed:dual-support>

#proof[
  Expand the square in (2.17) and use $parallel h parallel^2 lt.eq 9 \/ 4$. The coordinate bounds give (2.18). For the other bound, write
  $ 2 k dot.op h = 2 \( k - J_(*)^T v \) dot.op h + 2 v dot.op p_(*) + 2 v dot.op r_(*) . $
  The first term is at most $sum_j \| k_j - \( J_(*)^T v \)_j \|$ by the same coordinate bounds. Cauchy–Schwarz on the two residual blocks bounds the last term by $2 E \( parallel v_X parallel + parallel v_Y parallel \)$. ◻
]

The function #raw("supdual") proposes vectors $v$ and evaluates the right side of (2.18). The validity of a proposal does not depend on how it was generated or on the accuracy of the heuristic linear solve. Only finite proposed components of magnitude at most $10^4$ are used. Its evaluation replaces $1.25 pi \/ N$ by the larger $1.251 pi \/ N$ and adds a final support margin. Section 9 proves that the resulting bound is conservative.

Set $R = 0.032$. For a proposed previous center, #raw("testBucket") first tries (2.18), and then, if applicable, the dual bound. It returns success only when the resulting upper bound in (2.17) is below the safely lowered comparison threshold for $\( N R \)^2$. Hence success certifies the entire feasible portion of the current bin pair, rather than just its midpoint. Distance cutoffs, bucket indices, and reach tests only decide which previous centers to try. Omitting a possible previous center cannot produce a successful coverage test.

For clarity, the shared column is counted once in (2.15), although its displacement enters both equations in (2.16). Reuse requires equality of the selected #emph[position] $s$. Moving that position to the start of the five $X$ coordinates then applies the same coordinate permutation to the current point and the retained center, and preserves their Euclidean distance. The resulting order is the selected $X$ entry, the other four $X$ entries in order, and the four $Y$ tail entries. These are precisely the nine entries of the dephased first two rows and columns used in the next stage. Centers retained earlier for the same $X$ tuple are handled identically, with the first five components of $k$ zero.

#thm([Proposition 2.10.])[
  (Exhaustive seed cover).  #emph[For a completed execution of the specified #raw("covout") traversal under the arithmetic conditions of Section 9, the written rational midpoint centers, each with its recorded selected position, cover the seed coordinates of every exact complex Hadamard matrix up to the equivalences of Lemma 5, by closed Euclidean balls of radius $0.032$. After the indicated column ordering and conversion of the centers to binary phase values, radius $0.0320001$ is sufficient.]
] <seed:cover>

#proof[
  Given an exact Hadamard matrix, first use Lemma 7 to arrange $x$. Choose a nondecreasing closed bin assignment, determine $s$ from that tuple, and then arrange and assign $y$ with the same shared bin. All these choices exist also on bin boundaries and at repeated phases. The tuple is present in the stated enumeration. Lemmas 9, 10, and 11, together with their certified outward numerical margins, ensure that its bin pair is not rejected by a necessary filter.
  Consider the retained centers as the remaining bin pairs are traversed. If a coverage test succeeds, Lemma 12 and the certified comparison margins put every feasible point of the current pair in a radius-$R$ ball about an already retained center. If no test succeeds, the program retains the current midpoint itself. Its distance from any point of its full nine-dimensional bin is at most
  $ frac(sqrt(9), 2 N) = 3 / 224 < 0.032 . $
  Thus, by induction over the traversal, the retained centers cover every feasible point in every processed pair. Restricting the attempted reuse centers can only cause further midpoint insertions. Previously retained centers remain retained and are included in the output.
  The common selected-position permutation preserves all these distances. Finally, Section 9 bounds the joint error of the nine binary midpoint phases by less than $10^(- 14)$. The triangle inequality therefore permits the enlarged radius $0.0320001$. The centers need not themselves satisfy the exact Hadamard equations; their balls cover the necessary seed coordinates of all exact solutions. ◻
]

== 3 Completion over a fixed seed ball <sec:completion>

This section supplies necessary conditions for a dephased Hadamard matrix whose nine seed phases lie in one prescribed ball. It reduces the remaining completion problem to a covering of $U \( 2 \)$. The reduction uses frames fixed at the seed center; no exact Hadamard matrix is assumed to occur at that center. All statements in this section first concern exact real and complex arithmetic. The implementation uses the outward replacements and comparison margins justified in Section 9.

=== 3.1 Seed blocks and fixed complementary frames <seed-blocks-and-fixed-complementary-frames>

Fix the stored seed center, taking its binary phase coordinates as exact real numbers. After moving the shared column into the second position, write its relevant unit entries as $a \, b_0 \, dots.h \, b_3 \, c_0 \, dots.h \, c_3$, and put

$ E_0 = mat(delim: "(", 1, 1; 1, a) \, #h(2em) B_0 = mat(delim: "(", 1, 1, 1, 1; b_0, b_1, b_2, b_3) \, #h(2em) \( C_0 \)_(i \, :) = \( 1 \, c_i \) . quad "(3.1)" $ <completion:seed-blocks>

A feasible completion is an entrywise unit-modulus matrix

$ H' = mat(delim: "(", E', B'; C', D') \, #h(2em) H' H' ""^(*) = H' ""^(*) H' = 6 I \, $

with first row and first column equal to one. Its seed displacements, measured in radians, are ordered as

$ s = \( s_a \, s_(b_0) \, dots.h \, s_(b_3) \, s_(c_0) \, dots.h \, s_(c_3) \) in bb(R)^9 . $

Thus the varied entries are $a e^(i s_a)$, $b_j e^(i s_(b_j))$, and $c_i e^(i s_(c_i))$. The shared entry occurs once in $s$. With zero-based row-major phase indexing, these coordinates occupy

$ \( 7 \, 8 \, 9 \, 10 \, 11 \, 13 \, 19 \, 25 \, 31 \) . quad "(3.2)" $ <completion:position-map>

The enlarged seed radius in cycles is denoted by $r_s$, and $R_s = 2 pi r_s$. In the stated computation $r_s = .0320001$. Set $Delta E = E' - E_0$, and define $Delta B \, Delta C$ similarly. To avoid confusing norms with entries of the blocks, write

$ e_1 = lr(bar.v.double Delta E bar.v.double)_F \, #h(2em) b'_1 = lr(bar.v.double Delta B bar.v.double)_F \, #h(2em) c'_1 = lr(bar.v.double Delta C bar.v.double)_F . $

The chord bound $\| e^(i x) - 1 \| lt.eq \| x \|$ gives

$ e_1^2 + \( b'_1 \)^2 + \( c'_1 \)^2 lt.eq lr(bar.v.double s bar.v.double)^2 lt.eq R_s^2 . quad "(3.3)" $ <completion:seed-norm>

#thm([Lemma 3.1.])[
  (Fixed frames).  #emph[Let $p in bb(C)^4$ have unit-modulus entries, let $S = sum_j p_j$, and set $M = \( upright(bold(1)) med p \)$. The squared singular values of $M$ are $4 plus.minus \| S \|$. If $\| S \| < 4$, then 
$ M \( M^(*) M \)^(- 1) = frac(1, 16 - \| S \|^2) #scale(x: 120%, y: 120%)[\(] 4 upright(bold(1)) - p overline(S) thin \, #h(0em) 4 p - upright(bold(1)) S #scale(x: 120%, y: 120%)[\)] . quad "(3.4)" $ <completion:inverse-frame>

 Under the same condition $\| S \| < 4$, there is an orthonormal $4$-by-$2$ matrix $K$ with range $ker M^(*)$. It may be constructed by completing $upright(bold(1)) \/ 2$ and the normalized residual of $p$ by projected coordinate vectors with nonzero residuals.]
] <completion:frames>

#proof[
  Direct multiplication gives
  $ M^(*) M = mat(delim: "(", 4, S; overline(S), 4) . $
  Its eigenvalues and inverse give the assertions about singular values and (3.4). The first two Gram–Schmidt vectors span $"ran" M$. At each subsequent step, the orthogonal complement of the vectors already selected is nonzero. Since the coordinate vectors span $bb(C)^4$, at least one has a nonzero projection into that complement. Selecting and normalizing such a projection gives the next orthonormal vector. The final two vectors form $K$. ◻
]

Apply Lemma 14 to $p = \( overline(b)_j \)_j$ and $p = \( c_i \)_i$. Throughout the seed ball keep the resulting frames fixed, and write

$ G_B = B_0^(*) \( B_0 B_0^(*) \)^(- 1) \, #h(2em) G_C = C_0 \( C_0^(*) C_0 \)^(- 1) \, #h(2em) "ran" K_B = ker B_0 \, quad "ran" K_C = ker C_0^(*) . quad "(3.5)" $ <completion:frame-definitions>

Here $K_B^(*) K_B = K_C^(*) K_C = I_2$. Define

$ m_B = sigma_min \( B_0 \) \, quad m_C = sigma_min \( C_0 \) \, quad m = min \( m_B \, m_C \) > 0 \, $

so that $lr(bar.v.double G_B bar.v.double)_(upright("op")) = 1 \/ m_B$ and $lr(bar.v.double G_C bar.v.double)_(upright("op")) = 1 \/ m_C$. The numerical construction chooses particular coordinate vectors; the ideal frames in this argument use those same choices. The acceptance checks on rank and residual norms certify that this construction is defined. A failed frame check leaves the seed unresolved and never excludes it.

We shall use the orthogonal projections

$ P_K = K_B K_B^(*) \, #h(2em) P_B = I - P_K = G_B B_0 \, #h(2em) P_C = I - K_C K_C^(*) = G_C C_0^(*) . quad "(3.6)" $ <completion:projections>

Finally, put

$ A_0 = lr(bar.v.double E_0 bar.v.double)_(upright("op")) = sqrt(2 + \| 1 + a \|) \, #h(2em) A_(*) = min \( 2 \, A_0 + R_s \) . quad "(3.7)" $ <completion:A-bounds>

Both $A_0$ and $lr(bar.v.double E' bar.v.double)_(upright("op"))$ are at most $A_(*)$. Indeed $A_0 lt.eq 2$, every entry of $E'$ has modulus one and hence $lr(bar.v.double E' bar.v.double)_(upright("op")) lt.eq lr(bar.v.double E' bar.v.double)_F = 2$, and $lr(bar.v.double E' bar.v.double)_(upright("op")) lt.eq A_0 + e_1 lt.eq A_0 + R_s$.

=== 3.2 A unitary associated to every feasible completion <a-unitary-associated-to-every-feasible-completion>

The polar decomposition associates a unitary with a nonsingular square matrix, and its nearest-unitary property in unitarily invariant norms is classical #cite(label("FanHoffman1955")) Theorem 1; see also #cite(label("Higham1986Polar")) Theorem 1.1 and Corollary 2.3. Here the compressed completion has an explicit positive defect. The next lemma derives the trace-defect estimate required for the finite $U \( 2 \)$ cover.

#thm([Lemma 3.2.])[
  (Polar comparison).  #emph[For a feasible completion let $Y = K_C^(*) D' K_B$. Then 
$ 6 I - Y^(*) Y & = K_B^(*) B' ""^(*) B' K_B + K_B^(*) D' ""^(*) P_C D' K_B succ.curly.eq 0 \,\
"tr" \( 6 I - Y^(*) Y \) & lt.eq \( b'_1 \)^2 + frac(\( lr(bar.v.double E' bar.v.double)_(upright("op")) b'_1 + sqrt(6) thin c'_1 \)^2, m_C^2) lt.eq q \, quad "(3.8)" $ <completion:deficit-identity>

 where 
$ q = R_s^2 (1 + frac(A_(*)^2 + 6, m_C^2)) . quad "(3.9)" $ <completion:q-and-p>

 If $q < 6$, the polar factor $V = Y \( Y^(*) Y \)^(- 1 \/ 2)$ belongs to $U \( 2 \)$ and satisfies 
$ lr(bar.v.double Y - sqrt(6) V bar.v.double)_F lt.eq p := frac(q, sqrt(6) + sqrt(6 - q)) . quad "(3.10)" $ <completion:polar-bound>

]
] <completion:polar>

#proof[
  The lower-right block of $H' ""^(*) H' = 6 I$ is $B' ""^(*) B' + D' ""^(*) D' = 6 I$. Compress it by $K_B$, and subtract $Y^(*) Y = K_B^(*) D' ""^(*) \( I - P_C \) D' K_B$. This proves (3.8). Its trace is
  $ lr(bar.v.double B' K_B bar.v.double)_F^2 + lr(bar.v.double P_C D' K_B bar.v.double)_F^2 . $
  Since $B_0 K_B = 0$, the first term is at most $\( b'_1 \)^2$. The off-diagonal block of column orthogonality gives $C' ""^(*) D' = - E' ""^(*) B'$, and consequently
  $ C_0^(*) D' K_B = - E' ""^(*) Delta B K_B - Delta C^(*) D' K_B . $
  Now $P_C = G_C C_0^(*)$ and $lr(bar.v.double D' bar.v.double)_(upright("op")) lt.eq sqrt(6)$. These facts give the first inequality in (3.8). For the second, apply Cauchy–Schwarz to $A_(*) b'_1 + sqrt(6) c'_1$ and then use (3.3).
  Let $ell_1 \, ell_2$ be the eigenvalues of $6 I - Y^(*) Y$. They are nonnegative and have sum at most $q < 6$. The singular values of $Y$ are therefore positive and equal to $sqrt(6 - ell_j)$, so its polar factor is unitary. Moreover
  $ sqrt(6) - sqrt(6 - ell_j) = frac(ell_j, sqrt(6) + sqrt(6 - ell_j)) lt.eq frac(ell_j, sqrt(6) + sqrt(6 - q)) . $
  Taking the Euclidean norm of these two singular-value differences, and using $sqrt(ell_1^2 + ell_2^2) lt.eq ell_1 + ell_2 lt.eq q$, proves (3.10). ◻
]

The inequality $q < 6$ is checked using outward bounds. In the specified parameter range the stronger bound $q < .32$ follows from the accepted frame checks and the seed radius; see Section 9. The reduction therefore assigns at least one $V in U \( 2 \)$ to every feasible completion of an accepted seed ball.

=== 3.3 The unitary cells and their Taylor bounds <the-unitary-cells-and-their-taylor-bounds>

#thm([Lemma 3.3.])[
  (A closed covering of $U \( 2 \)$).  #emph[Every $V in U \( 2 \)$ has a representation 
$ V = e \( alpha \) mat(delim: "(", e \( beta \) cos \( 2 pi t \), e \( gamma \) sin \( 2 pi t \); - e \( - gamma \) sin \( 2 pi t \), e \( - beta \) cos \( 2 pi t \)) \, quad "(3.11)" $ <completion:unitary-parameterization>

 with $0 lt.eq alpha lt.eq 1 / 2$, $0 lt.eq t lt.eq 1 / 4$, and $0 lt.eq beta \, gamma lt.eq 1$. For an integer $N_u$ divisible by four, the products of closed intervals of width $1 \/ N_u$ in these ranges cover this parameter domain. Their four bin counts are $N_u \/ 2 \, N_u \/ 4 \, N_u \, N_u$.]
] <completion:unitary-cover>

#proof[
  Choose a square root of $det V$ having phase $alpha in \[ 0 \, 1 \/ 2 \]$ in cycles. Then $e \( - alpha \) V in S U \( 2 \)$ and has the form
  $ mat(delim: "(", z, w; - overline(w), overline(z)) \, #h(2em) \| z \|^2 + \| w \|^2 = 1 . $
  Choose $t in \[ 0 \, 1 \/ 4 \]$ with $\| z \| = cos \( 2 pi t \)$ and $\| w \| = sin \( 2 pi t \)$, and choose phases $beta$ and $gamma$ for $z$ and $w$. A phase of a zero entry may be chosen arbitrarily. Thus no boundary case requires division by an entry. The interval products cover the stated closed domain directly. ◻
]

Fix one cell and denote its midpoint matrix by $U$. If $V$ is represented inside the cell, let

$ theta = \( theta_alpha \, theta_t \, theta_beta \, theta_gamma \) \, #h(2em) \| theta_j \| lt.eq h := pi / N_u \, quad "(3.12)" $ <completion:unitary-cell>

be its displacement from the midpoint in radians. Denote the midpoint angular differential, applied to this displacement, by $d U \[ theta \]$. All four derivatives here are with respect to radian angles, although (3.11) uses cycle coordinates.

#thm([Lemma 3.4.])[
  (Uniform cell Taylor estimates).  #emph[For the cell and displacement in (3.12), 
$ lr(bar.v.double V - U bar.v.double)_F lt.eq sqrt(6) h \, #h(2em) lr(bar.v.double V - U - d U \[ theta \] bar.v.double)_F lt.eq sqrt(42) / 2 h^2 . quad "(3.13)" $ <completion:unitary-taylor-bounds>

]
] <completion:unitary-taylor>

#proof[
  Follow the straight segment in the four angle coordinates and write its matrix as $U \( tau \)$, $0 lt.eq tau lt.eq 1$. For this proof abbreviate the four constant angular velocities as $x = theta_alpha$, $y = theta_t$, $z = theta_beta$, and $w = theta_gamma$, and let $T$ be the current radian $t$ angle. Differentiating the four entries yields
  $ lr(bar.v.double U' \( tau \) bar.v.double)_F^2 = 2 #scale(x: 120%, y: 120%)[\(] x^2 + y^2 + z^2 cos^2 T + w^2 sin^2 T #scale(x: 120%, y: 120%)[\)] lt.eq 6 h^2 . $
  For the two diagonal entries, the squared magnitudes of the real factors in the second derivative have sum
  $ & #scale(x: 120%, y: 120%)[\(] \( \( x + z \)^2 + y^2 \)^2 + \( \( x - z \)^2 + y^2 \)^2 #scale(x: 120%, y: 120%)[\)] cos^2 T\
 & #h(2em) = 2 #scale(x: 120%, y: 120%)[\(] \( x^2 + z^2 + y^2 \)^2 + 4 x^2 z^2 #scale(x: 120%, y: 120%)[\)] cos^2 T lt.eq 26 h^4 cos^2 T . $
  The imaginary factors of those two entries contribute
  $ 4 y^2 #scale(x: 120%, y: 120%)[\(] \( x + z \)^2 + \( x - z \)^2 #scale(x: 120%, y: 120%)[\)] sin^2 T lt.eq 16 h^4 sin^2 T . $
  The off-diagonal entries give the same two bounds with $z$ replaced by $w$ and cosine and sine interchanged. Real and imaginary factors add in squared magnitude. Hence $lr(bar.v.double U'' \( tau \) bar.v.double)_F^2 lt.eq 42 h^4$. Integrating the first derivative, and then using the integral Taylor remainder with weight $1 - tau$, proves (3.13). ◻
]

For clarity about the implementation, if the entries of $U$ are $U_(i j)$, its alpha derivative is $i U$, its beta derivative has diagonal entries $i U_00 \, - i U_11$ and zero off-diagonal entries, and its gamma derivative has off-diagonal entries $i U_01 \, - i U_10$ and zero diagonal entries. The $t$ derivative differentiates the displayed sine and cosine factors. These are precisely the four angular derivatives assembled by #raw("uc::init") and #raw("uc::initDeriv").

=== 3.4 Comparison with a cell center <comparison-with-a-cell-center>

For the fixed seed and unitary cell define

$ D = D_(upright("span")) + D_(upright("ker")) \, #h(2em) D_(upright("span")) = - C_0 E_0^(*) G_B^(*) \, #h(2em) D_(upright("ker")) = sqrt(6) K_C U K_B^(*) \, #h(2em) Z = D' - D . quad "(3.14)" $ <completion:comparison-def>

The symbol $D$ henceforth denotes this comparison block, which need not be entrywise flat. It is not asserted to be the lower block of a Hadamard matrix at the seed center.

#thm([Lemma 3.5.])[
  (Orthogonal comparison pieces).  #emph[The matrices $Z P_B$, $P_C Z P_K$, and $\( I - P_C \) Z P_K$ are pairwise Frobenius-orthogonal and sum to $Z$. They satisfy 
$ Z P_B & = \( - Delta C E_0^(*) - C' Delta E^(*) - D' Delta B^(*) \) G_B^(*) \,\
P_C Z P_K & = G_C \( - E' ""^(*) Delta B - Delta C^(*) D' \) P_K \,\
\( I - P_C \) Z P_K & = K_C \( Y - sqrt(6) U \) K_B^(*) . quad "(3.15)" $ <completion:piece-B>

 Consequently every feasible completion associated to this unitary cell satisfies 
$ lr(bar.v.double Z bar.v.double)_F lt.eq z := sqrt((frac(R_s \( sqrt(6) + A_(*) \), m))^2 + \( 6 h + p \)^2) . quad "(3.16)" $ <completion:z-bound>

]
] <completion:comparison-pieces>

#proof[
  The right projections $P_B \, P_K$ are complementary and orthogonal; within the right $P_K$ part, the left projections $P_C \, I - P_C$ are complementary and orthogonal. This proves the decomposition and orthogonality. Row orthogonality gives $D' B' ""^(*) = - C' E' ""^(*)$. Since $P_B = B_0^(*) G_B^(*)$, $D_(upright("ker")) P_B = 0$, and $D_(upright("span")) P_B = D_(upright("span"))$, subtracting the comparison block gives (3.15). The identity $C' ""^(*) D' = - E' ""^(*) B'$, together with $B_0 P_K = 0$ and $P_C D P_K = 0$, gives (3.15). The definitions of $Y$, $K_B$, and $K_C$ give (3.15).
  Put $r_(E B) = sqrt(e_1^2 + \( b'_1 \)^2)$. The four lower rows of $H'$ are orthogonal and have norm $sqrt(6)$, so $lr(bar.v.double \[ C' med D' \] bar.v.double)_(upright("op")) = sqrt(6)$. Therefore
  $ lr(bar.v.double Z P_B bar.v.double)_F & lt.eq frac(sqrt(6) r_(E B) + A_0 c'_1, m_B) \,\
lr(bar.v.double P_C Z P_K bar.v.double)_F & lt.eq frac(A_(*) b'_1 + sqrt(6) c'_1, m_C) lt.eq frac(A_(*) r_(E B) + sqrt(6) c'_1, m) . $
  The vector of these two norms is bounded componentwise by
  $ 1 / m mat(delim: "(", sqrt(6), A_(*); A_(*), sqrt(6)) vec(r_(E B), c'_1) . $
  The displayed matrix has operator norm $sqrt(6) + A_(*)$; its input norm is at most $R_s$ by (3.3). For the third piece, multiplication by the two orthonormal frames preserves Frobenius norm, and
  $ lr(bar.v.double Y - sqrt(6) U bar.v.double)_F lt.eq lr(bar.v.double Y - sqrt(6) V bar.v.double)_F + sqrt(6) lr(bar.v.double V - U bar.v.double)_F lt.eq p + 6 h . $
  Pythagoras for the three pieces gives (3.16). ◻
]

#thm([Lemma 3.6.])[
  (A row-block operator bound).  #emph[For every cell midpoint $U in U \( 2 \)$, 
$ lr(bar.v.double \[ C_0 med D \] bar.v.double)_(upright("op")) lt.eq L := max (sqrt(6) \, #h(0em) lr(bar.v.double C_0 bar.v.double)_(upright("op")) sqrt(1 + \( A_0 \/ m_B \)^2)) . quad "(3.17)" $ <completion:L-definition>

 Also $lr(bar.v.double D P_K bar.v.double)_(upright("op")) = sqrt(6)$ and 
$ lr(bar.v.double D bar.v.double)_(upright("op")) lt.eq max (sqrt(6) \, frac(lr(bar.v.double C_0 bar.v.double)_(upright("op")) A_0, m_B)) . quad "(3.18)" $ <completion:D-operator-bound>

]
] <completion:L-bound>

#proof[
  The two terms $D_(upright("span")) \, D_(upright("ker"))$ in (3.14) have orthogonal right domains and orthogonal ranges. In particular the cross terms in $D D^(*)$ vanish, and $G_B^(*) G_B = \( B_0 B_0^(*) \)^(- 1)$ gives
  $ \[ C_0 med D \] \[ C_0 med D \]^(*) = C_0 #scale(x: 120%, y: 120%)[\[] I + E_0^(*) \( B_0 B_0^(*) \)^(- 1) E_0 #scale(x: 120%, y: 120%)[\]] C_0^(*) + 6 K_C K_C^(*) . quad "(3.19)" $ <completion:L-Gram>
  The first summand has range in $"ran" C_0$ and operator norm at most $lr(bar.v.double C_0 bar.v.double)_(upright("op"))^2 \( 1 + A_0^2 \/ m_B^2 \)$. The second is six times the projection onto its orthogonal complement. Thus their sum has norm equal to the larger of their norms, proving (3.17). Omitting the $C_0 C_0^(*)$ contribution proves (3.18). Finally $D P_K = D_(upright("ker"))$, whose two nonzero singular values are $sqrt(6)$. ◻
]

=== 3.5 A uniform linearization remainder <a-uniform-linearization-remainder>

Let $E_1 \, B_1 \, C_1$ be the seed first variations: at a varied entry, multiply the center entry by $i$ times the corresponding component of $s$; all fixed entries have variation zero. Define the linear map

$ cal(J) \( s \, theta \) =  & \( - C_1 E_0^(*) - C_0 E_1^(*) - D B_1^(*) \) G_B^(*)\
 & + G_C \( - E_0^(*) B_1 - C_1^(*) D \) P_K + sqrt(6) K_C d U \[ theta \] K_B^(*) . quad "(3.20)" $ <completion:linear-map>

This is a necessary linear comparison inferred from the exact orthogonality equations. In particular it is not obtained by assuming that the fixed frames vary differentiably with the seed or that an exact completion exists at every seed center.

#thm([Lemma 3.7.])[
  (Linear remainder bound).  #emph[Every feasible completion associated to the cell satisfies 
$ lr(bar.v.double Z - cal(J) \( s \, theta \) bar.v.double)_F lt.eq E_r \, #h(2em) E_r = sqrt(e_(upright("off"))^2 + (sqrt(6 dot.op 42) / 2 h^2 + p)^2) \, quad "(3.21)" $ <completion:linear-remainder-bound>

 where 
$ e_(upright("off")) = frac(R_s^2 \( L + A_0 + 1 \), 2 m) + frac(z R_s, m) . quad "(3.22)" $ <completion:e-off>

]
] <completion:linear-remainder>

#proof[
  The first two terms of (3.20) lie respectively in the spaces of the first two projections in Lemma 18; the last term lies in the third. We bound the remainders in those spaces.
  First replace $C' \, D'$ in (3.15) by $C_0 \, D$. The additional numerator terms are $- Delta C Delta E^(*) - Z Delta B^(*)$. Replacing $E' \, D'$ in (3.15) by $E_0 \, D$ leaves $- Delta E^(*) Delta B - Delta C^(*) Z$. Across the two orthogonal output spaces, the seed-only product terms have combined Frobenius norm at most
  $ frac(e_1 sqrt(\( b'_1 \)^2 + \( c'_1 \)^2), m) lt.eq frac(R_s^2, 2 m) . $
  The product terms involving $Z$ have combined norm at most
  $ frac(lr(bar.v.double Z bar.v.double)_F sqrt(\( b'_1 \)^2 + \( c'_1 \)^2), m) lt.eq frac(z R_s, m) . $
  These inequalities use submultiplicativity with a Frobenius norm on the varying factor, the bounds on $G_B \, G_C$, and contraction by $P_K$.
  It remains in the first two spaces to replace each of $Delta E \, Delta B \, Delta C$ by its first variation. Since $\| e^(i x) - 1 - i x \| lt.eq x^2 \/ 2$, the combined Frobenius norm of their three Taylor remainders is at most
  $ 1 / 2 (sum_(j = 1)^9 s_j^4)^(1 \/ 2) lt.eq 1 / 2 lr(bar.v.double s bar.v.double)^2 lt.eq 1 / 2 R_s^2 . $
  For arbitrary remainder inputs $F_E \, F_B \, F_C$, put $x = \( lr(bar.v.double F_E bar.v.double)_F^2 + lr(bar.v.double F_B bar.v.double)_F^2 \)^(1 \/ 2)$ and $y = lr(bar.v.double F_C bar.v.double)_F$. Lemma 19 shows that the norms of their two linear output pieces are bounded componentwise by
  $ 1 / m mat(delim: "(", L, A_0; A_0, sqrt(6)) vec(x, y) . $
  For the second component use $lr(bar.v.double D P_K bar.v.double)_(upright("op")) = sqrt(6)$. Since $L gt.eq sqrt(6)$, the matrix has operator norm at most $L + A_0$. The combined seed Taylor contribution is therefore at most $R_s^2 \( L + A_0 \) \/ \( 2 m \)$. Adding the two product bounds gives (3.22).
  In the third space the exact remainder is
  $ K_C #scale(x: 120%, y: 120%)[\[] Y - sqrt(6) U - sqrt(6) d U \[ theta \] #scale(x: 120%, y: 120%)[\]] K_B^(*) . $
  Insert $sqrt(6) V$, and apply the polar and unitary Taylor bounds. Its norm is at most $p + sqrt(6 dot.op 42) h^2 \/ 2$. This space is orthogonal to the first two, so Pythagoras proves (3.21). ◻
]

Here is the entrywise form used to assemble (3.20). For $0 lt.eq i \, j \, k < 4$, its shared seed coefficient is

$ - c_i overline(i a \( G_B \)_(j 1)) \, $

its $b_k$ coefficient is

$ - #scale(x: 120%, y: 120%)[\[] \( G_C \)_(i 0) + \( G_C \)_(i 1) overline(a) #scale(x: 120%, y: 120%)[\]] thin i b_k \( P_K \)_(k j) - D_(i k) overline(i b_k \( G_B \)_(j 1)) \, $

and its $c_k$ coefficient is

$ - upright(bold(1))_(i = k) thin i c_k #scale(x: 120%, y: 120%)[\(] overline(\( G_B \)_(j 0)) + overline(a \( G_B \)_(j 1)) #scale(x: 120%, y: 120%)[\)] - \( G_C \)_(i 1) overline(i c_k) \( D_(upright("ker")) \)_(k j) . $

For the angular coefficients, if the entries of $U$ are flattened in row-major order, use

$ W_(i j \, l) = sqrt(6) \( K_C \)_(i \, floor.l l \/ 2 floor.r) overline(\( K_B \)_(j \, l med mod med 2)) \, #h(2em) 0 lt.eq l < 4 \, $

and contract with each angular derivative of $U$. These formulas identify the fixed and moving parts of #raw("block::setup"), #raw("makeD"), and #raw("makeJ").

=== 3.6 Necessary flatness and separating inequalities <necessary-flatness-and-separating-inequalities>

We have bounded both the total block displacement $Z = D' - D$ by $z$ and its remainder after the linear comparison $cal(J) \( s \, theta \)$ by $E_r$. We now use these two bounds in the necessary equations $\| D'_(i j) \| = 1$: the first test uses the total displacement alone, and the second also uses its linear comparison and the seed sum equations.

#thm([Lemma 3.8.])[
  (Norm exclusion).  #emph[A feasible completion associated to a cell must satisfy 
$ sum_(i \, j = 0)^3 \( \| D_(i j) \| - 1 \)^2 lt.eq z^2 . quad "(3.23)" $ <completion:norm-test>

]
] <completion:norm-exclusion>

#proof[
  Each $D'_(i j)$ has modulus one, and the reverse triangle inequality gives $\| \| D_(i j) \| - 1 \| lt.eq \| D'_(i j) - D_(i j) \|$. Sum the squares and use (3.16). ◻
]

For the second test define two complex constants and their linear parts by

$ c_X & = \( 1 + a + sum_j b_j \) \/ i \, & J_X s & = a s_a + sum_j b_j s_(b_j) \,\
c_Y & = \( 1 + a + sum_i c_i \) \/ i \, & J_Y s & = a s_a + sum_i c_i s_(c_i) . $

The corresponding exact row and column sums vanish. Taylor’s formula therefore gives $c_X + J_X s + rho_X = 0$ and $c_Y + J_Y s + rho_Y = 0$, with

$ \| rho_X \| lt.eq 1 / 2 R_s^2 \, #h(2em) \| rho_Y \| lt.eq 1 / 2 R_s^2 . quad "(3.24)" $ <completion:seed-sum-remainders>

Take real and imaginary parts of these two equations, in that order. Append the following sixteen real constants and linear forms:

$ c_(i j) = frac(\| D_(i j) \|^2 - 1, 2) \, #h(2em) J_(i j) \( s \, theta \) = "Re" #scale(x: 120%, y: 120%)[\(] overline(D_(i j)) cal(J)_(i j) \( s \, theta \) #scale(x: 120%, y: 120%)[\)] . quad "(3.25)" $ <completion:flat-equations>

Denote the resulting real constant vector by $c_(upright("all")) in bb(R)^20$ and the real linear matrix by $J_(upright("all")) in bb(R)^(20 times 13)$, with its first nine columns corresponding to $s$ and its last four to $theta$.

#thm([Lemma 3.9.])[
  (Directional exclusion).  #emph[Let $y in bb(R)^20$ be arbitrary, split as two pairs $y_X \, y_Y in bb(R)^2$ and a flat part $y_D in bb(R)^16$, and write 
$ g = J_(upright("all"))^(*) y = \( g_s \, g_theta \) in bb(R)^9 times bb(R)^4 . $

 Every feasible completion associated to the cell satisfies 
$ y dot.op c_(upright("all")) lt.eq  & R_s lr(bar.v.double g_s bar.v.double) + h lr(bar.v.double g_theta bar.v.double)_1 + E_r lr(bar.v.double D compose y_D bar.v.double)_F\
 & + 1 / 2 z^2 max #scale(x: 120%, y: 120%)[\(] 0 \, max_(i \, j) \( - y_(D \, i j) \) #scale(x: 120%, y: 120%)[\)] + 1 / 2 R_s^2 \( lr(bar.v.double y_X bar.v.double) + lr(bar.v.double y_Y bar.v.double) \) . quad "(3.26)" $ <completion:directional-test>

 Here $compose$ denotes entrywise multiplication, with the sixteen flat coordinates arranged as a $4$-by-$4$ matrix.]
] <completion:directional-exclusion>

#proof[
  Write $R = Z - cal(J) \( s \, theta \)$, so $lr(bar.v.double R bar.v.double)_F lt.eq E_r$. Expanding the exact flatness equation gives
  $ 0 = frac(\| D'_(i j) \|^2 - 1, 2) = c_(i j) + J_(i j) \( s \, theta \) + "Re" \( overline(D_(i j)) R_(i j) \) + 1 / 2 \| Z_(i j) \|^2 . $
  Weight these equations by $y_D$, and weight the two complex seed equations by $y_X \, y_Y$ using their real coordinate pairs. Move every term other than $y dot.op c_(upright("all"))$ to the right. The linear contribution is bounded above by $R_s lr(bar.v.double g_s bar.v.double) + h lr(bar.v.double g_theta bar.v.double)_1$, using the seed ball and angle box. Real Cauchy–Schwarz bounds the flat remainder contribution by $E_r lr(bar.v.double D compose y_D bar.v.double)_F$. The seed remainders contribute at most the last term of (3.26) by (3.24).
  The quadratic term has a fixed sign before weighting. After it is moved to the right its contribution is
  $ - 1 / 2 sum_(i \, j) y_(D \, i j) \| Z_(i j) \|^2 lt.eq 1 / 2 max #scale(x: 120%, y: 120%)[\(] 0 \, max_(i \, j) \( - y_(D \, i j) \) #scale(x: 120%, y: 120%)[\)] sum_(i \, j) \| Z_(i j) \|^2 . $
  Use $lr(bar.v.double Z bar.v.double)_F lt.eq z$. This proves the remaining term and the stated inequality. ◻
]

#thm([Corollary 3.10.])[
  (Dual certificates).  #emph[A cell contains no feasible completion if (3.23) fails, or if some real direction $y$ violates (3.26). The choice of $y$ may be heuristic; only its final inequality must be certified. Positive normalization of $y$ preserves the certificate.]
] <completion:dual-certificates>

#proof[
  Both inequalities are necessary for every feasible completion in the cell. All terms of (3.26) are positively homogeneous in $y$. Thus a strict violation is a separating, or dual, certificate, independent of how the direction was found. ◻
]

The implementation stacks exactly these twenty equations in #raw("eq"). The routine #raw("trial::pass") proposes directions by regularized linear solves and weight updates. It excludes only when #raw("trial::certificate") verifies the final inequality. That routine checks finiteness, divides by the largest absolute coordinate, and treats the resulting stored coefficients as the direction. It uses the negative part of the flat weights, as required by (3.26). No accuracy or convergence assertion about the proposing solves is needed. The used Stage A path is #raw("Asearch::testA"); the auxiliary #raw("Usearch::test") and #raw("scalar") routines do not supply additional exclusion tests for this run. The actual norm and directional comparisons include the margins proved in Section 9.

=== 3.7 Finite recursion and unresolved cells <finite-recursion-and-unresolved-cells>

#thm([Proposition 3.11.])[
  (Completion coverage conditional on successful termination).  #emph[Fix a seed ball for which the frame and bound constructions are certified. Suppose that every final unitary cell is either excluded by a certified necessary-condition test or covered by a certified phase ball as in Section 4. Then those phase balls cover all feasible Hadamard completions of the seed ball, with the equivalences specified by the phase-ball certificates. The Stage A recursion establishes precisely this conclusion if it terminates with zero unresolved cells.]
] <completion:recursion>

#proof[
  Given any feasible completion, Lemma 15 produces a unitary $V$. Lemma 16 places one of its parameter representations in a closed base cell. Every certified exclusion test is necessary for that completion, so it cannot exclude a cell containing this representation. If a cell is subdivided, the two closed children in each coordinate cover the parent interval; their sixteen products cover the parent cell. Hence the representation can be followed into at least one child. A successful phase-ball certificate covers every feasible completion associated to its entire cell, so it covers the chosen completion if that outcome is reached.
  This is a finite induction through the processed cell tree. Zero unresolved cells means that every branch ends in a certified exclusion or a certified phase-ball assignment. The branch followed by a feasible completion cannot end in exclusion, and therefore ends in coverage. ◻
]

In the stated invocation the base grid is $N_u = 16$. Retained cells are split to $N_u = 32$ and then $64$ by replacing every bin index $b_j$ with both $2 b_j$ and $2 b_j + 1$. At the first level only the norm test is needed. At $64$ and deeper, every unexcluded cell is offered to the phase-ball coverage routine; unsuccessful coverage causes all sixteen children to be processed with the same seed and the same fixed frames, using the new value of $h$. Subdivision is allowed through $N_u = 512$.

A coverage or snapping failure does not exclude a cell. A live cell at the depth cap increments the unresolved count. Exceeding the deeper-node cap of $1 \, 000 \, 000$ sets the give-up flag and increments that count; later short returns under that flag cannot restore successful status. A failed frame construction is recorded as a failed seed. The driver records every seed with unresolved cells and returns failure if any seed failed. Thus a negative or global-coverage conclusion requires successful processing of all prescribed seed indices, including all shards, with no failed seed or unresolved cell. Retaining some valid phase balls from an unsuccessful seed does not certify the unprocessed remainder. These conditions are part of the computational obligation, not consequences of the local inequalities alone.

== 4 Certified phase balls and their atlas <sec:phase-cover>

This section converts a cell retained by the completion search of Section 3 into a ball of real phase matrices. For a center $P$, the matrix $e \( P \)$ need not be an exact Hadamard matrix. The certificates control the center’s residual and the displacement of every exact solution in the ball. Phase matrices and their ball radii are measured in cycles. Angular displacements explicitly identified below are measured in radians.

We use the entrywise exponential $e$ and the orthogonal double-centering projection $Pi$ defined in the seed-cover section. Real $6$-by-$6$ matrices are identified with $bb(R)^36$ in row-major order. A phase displacement is #emph[horizontal] if it belongs to $"ran" Pi$. All vector norms are Euclidean, all phase-matrix norms are Frobenius, and norms of linear maps are induced Euclidean norms unless a subscript specifies otherwise. Stars on real matrices mean transpose.

=== 4.1 Residual and Root certificates <sec:root-certificate>

For a real phase matrix $P$, define $F \( P \) in bb(C)^15$ by

$ F_(i j) \( P \) = frac(1, 2 pi i) sum_(g = 0)^5 e \( P_(i g) - P_(j g) \) \, #h(2em) 0 lt.eq j < i lt.eq 5 . quad "(4.1)" $ <phase:residual>

Edges are ordered by increasing $i$, then increasing $j$; a complex coordinate is stored as its real part followed by its imaginary part. We also regard $F \( P \)$ as a real $30$-vector. Since every entry of $e \( P \)$ has modulus one, $F \( P \) = 0$ is equivalent to the row Hadamard conditions, and hence to all the Hadamard conditions. Its real derivative $L_P : bb(R)^36 arrow.r bb(R)^30$, in complex notation, is

$ \( L_P x \)_(i j) = sum_(g = 0)^5 e \( P_(i g) - P_(j g) \) \( x_(i g) - x_(j g) \) . quad "(4.2)" $ <phase:derivative>

The factor $2 pi i$ from differentiation cancels the denominator in (4.1). These are the residual and full derivative in #raw("buildH::gen"), in #raw("patchx.cpp").

#prodef([Definition 4.1.])[
  (Root certificate).  A #raw("Root") consists of a stored real center $P$, a stored real $36$-by-$k$ matrix $T$, and nonnegative constants
  $ mono(C) \, quad mono(n 0) \, quad mono(i d) \, quad mono(o r t) \, quad mono(h o r) \, quad mono(m n o r m) \, quad mono(f r o o t) . $
  The source stores column $a$ of $T$ as #raw("T[a]") and uses $0 lt.eq k lt.eq 10$. Write
  $ n_P \( s \) = mono(n 0) + mono(i d) thin s + mono(C) thin s^2 \, #h(2em) s gt.eq 0 . quad "(4.3)" $ <phase:normal-polynomial>
  It is certified if the basic bounds
  $ parallel T^(*) T - I parallel lt.eq mono(o r t) \, #h(2em) parallel \( I - Pi \) T parallel lt.eq mono(h o r) \, #h(2em) parallel F \( P \) parallel lt.eq mono(f r o o t) quad "(4.4)" $ <phase:root-basic>
  hold, together with the following displacement assertions. For every horizontal $delta$ satisfying $F \( P + delta \) = 0$, put $eta = T^(*) delta$ and $s = parallel delta parallel$. Then
  $ parallel \( I - T T^(*) \) delta parallel & lt.eq n_P \( s \) \,\
s^2 & lt.eq \( 1 + mono(o r t) \) parallel eta parallel^2 + parallel \( I - T T^(*) \) delta parallel^2 . quad "(4.5)" $ <phase:root-normal>
  For every such $delta$ and every horizontal $v$, with $h' = delta - v$, one also has
  $ parallel \( I - T T^(*) \) h' parallel lt.eq #scale(x: 120%, y: 120%)[\[] mono(i d) + mono(C) \( parallel delta parallel + parallel v parallel \) #scale(x: 120%, y: 120%)[\]] parallel h' parallel + mono(m n o r m) thin parallel F \( P + v \) parallel . quad "(4.6)" $ <phase:root-difference>
  These assertions have no radius restriction. A Root certificate neither requires $F \( P \) = 0$ nor asserts the existence of an exact solution. A radius will be attached when a phase ball is recorded.
] <phase:root-data>

The first two displacement bounds explain how the certificate will be used. For such a $delta$, if $s_0 gt.eq parallel delta parallel$ and $t_0 gt.eq parallel T^(*) delta parallel$, then nonnegativity of the coefficients of $n_P$ gives

$ parallel delta parallel lt.eq (n_P \( s_0 \)^2 + \( 1 + mono(o r t) \) t_0^2)^(1 \/ 2) . $

For a retained completion cell we shall bound both the full displacement and its tangent coordinates. The displayed bound can then improve the radius that covers all exact completions in the cell. The difference bound will compare displacements from two centers during refinement.

#prodef([Remark 4.2.])[
  The columns of $T$ are only numerical directions. Neither exact horizontality nor exact orthogonality is assumed. In particular
  $ parallel T parallel lt.eq sqrt(1 + mono(o r t)) \, $
  and the explicit $mono(h o r)$ error will be retained when raw coordinate displacements are projected. The normal estimates bound the omitted directions; those directions are not set equal to zero. No constant-rank or manifold hypothesis on the exact solution set is needed.
] <phase:approximate-tangent>

=== 4.2 Constructing Root certificates <constructing-root-certificates>

The construction uses an auxiliary real map $M : bb(R)^30 arrow.r bb(R)^36$ to turn the residual equation into a bound on $\( I - T T^(*) \) delta$. This map is used only to establish the Root assertions and is not serialized. We first control the nonlinear remainder after applying $M$.

#thm([Lemma 4.3.])[
  (Quadratic and difference remainders).  #emph[There is a real $30$-vector $cal(R)_P \( x \)$ such that 
$ F \( P + x \) = F \( P \) + L_P x + cal(R)_P \( x \) . $

 Put $a_(i j) \( x \) = parallel x_i - x_j parallel^2$, where $x_i$ is row $i$ of $x$. Then 
$ \| \( cal(R)_P \( x \) \)_(i j) \| & lt.eq pi a_(i j) \( x \) \,\
\| \( cal(R)_P \( x \) - cal(R)_P \( v \) \)_(i j) \| & lt.eq pi sqrt(a_(i j) \( x - v \)) #scale(x: 120%, y: 120%)[\(] sqrt(a_(i j) \( x \)) + sqrt(a_(i j) \( v \)) #scale(x: 120%, y: 120%)[\)] . quad "(4.7)" $ <phase:edge-remainder>

 Let $M : bb(R)^30 arrow.r bb(R)^36$ be any real matrix. For real unit $y in bb(R)^36$, let $w_(i j) \( y \)$ be the Euclidean norm of the two edge coordinates of $M^(*) y$. If 
$ sum_(i > j) w_(i j) \( y \) a_(i j) \( x \) lt.eq b parallel x parallel^2 quad upright("for every horizontal ") x upright(" and every unit ") y upright(",") quad "(4.8)" $ <phase:weighted-constant>

 then, for horizontal $x \, v$, 
$ parallel M cal(R)_P \( x \) parallel & lt.eq pi b parallel x parallel^2 \,\
parallel M \( cal(R)_P \( x \) - cal(R)_P \( v \) \) parallel & lt.eq pi b thin parallel x - v parallel \( parallel x parallel + parallel v parallel \) . quad "(4.9)" $ <phase:matrix-remainder>

]
] <phase:remainder>

#proof[
  For real $t$, put
  $ r \( t \) = frac(e \( t \) - 1 - 2 pi i t, 2 pi i) . $
  Its derivative is $e \( t \) - 1$, of modulus at most $2 pi \| t \|$. Integration from zero gives $\| r \( t \) \| lt.eq pi t^2$. On the segment from $v$ to $x$, convexity of absolute value gives
  $ \| r \( x \) - r \( v \) \| lt.eq 2 pi \| x - v \| integral_0^1 \| \( 1 - u \) v + u x \| thin d u lt.eq pi \| x - v \| \( \| x \| + \| v \| \) . $
  Apply these formulas to each scalar row difference and sum over $g$. The unit factors $e \( P_(i g) - P_(j g) \)$ do not affect modulus. Cauchy–Schwarz in $g$ gives (4.7).
  Pairing $M cal(R)_P \( x \)$ with a real unit $y$ and using the two-coordinate Cauchy–Schwarz inequality on each edge proves (4.9). For the difference use, separately,
  $ sum_(i > j) w_(i j) sqrt(a_(i j) \( x - v \) a_(i j) \( x \)) lt.eq (sum_(i > j) w_(i j) a_(i j) \( x - v \))^(1 \/ 2) (sum_(i > j) w_(i j) a_(i j) \( x \))^(1 \/ 2) lt.eq b parallel x - v parallel parallel x parallel \, $
  and the same inequality with $v$ in the last factor. Take the supremum over $y$. This also proves that the same constant controls both remainders. ◻
]

#thm([Lemma 4.4.])[
  (Two computable remainder constants).  #emph[Two sufficient choices in (4.8) are 
$ b = sqrt(8) thin parallel M parallel \, #h(2em) b = sqrt(6) thin parallel cal(S) parallel \, $

 where the $30$-by-$216$ real matrix $cal(S)$ has row 
$ cal(S)_(a \, :) = M_(: \, a)^(*) ⊗ \( upright(bold(e))_i - upright(bold(e))_j \)^(*) $

 when $a$ is either of the two real-coordinate indices of edge $i > j$. Consequently $pi$ times the smaller of any certified upper bounds for these two quantities is a valid $mono(C)$.]
] <phase:remainder-constants>

#proof[
  For horizontal $x$, its row vectors satisfy $sum_i x_i = 0$. Let $s = parallel x parallel$ and $u_i = parallel x_i parallel^2$. Expansion gives
  $ sum_(i > j) a_(i j) \( x \) & = 6 s^2 \,\
sum_(i > j) a_(i j) \( x \)^2 & = 6 sum_i u_i^2 + s^4 + 2 sum_(i \, j) \( x_i dot.op x_j \)^2 . quad "(4.10)" $ <phase:row-distance-identities>
  Indeed the cross terms use $sum_(j eq.not i) x_i dot.op x_j = - u_i$. Also
  $ u_i = ∥- sum_(j eq.not i) x_j∥^2 lt.eq 5 \( s^2 - u_i \) \, #h(2em) sum_(i \, j) \( x_i dot.op x_j \)^2 lt.eq sum_(i \, j) u_i u_j = s^4 . $
  Thus $sum_i u_i^2 lt.eq \( 5 \/ 6 \) s^4$, and the second sum in (4.10) is at most $8 s^4$. Cauchy–Schwarz on the edges, with $sum w_(i j) \( y \)^2 = parallel M^(*) y parallel^2$, proves the first choice of $b$.
  For the second, apply $cal(S)$ to $y ⊗ x_(: \, g)$, then sum squared norms over $g$. For unit $y$ this gives
  $ sum_(i > j) w_(i j) \( y \)^2 a_(i j) \( x \) lt.eq parallel cal(S) parallel^2 s^2 . $
  Another Cauchy–Schwarz inequality, now using $sum a_(i j) = 6 s^2$, proves the claim. The row Gram of $cal(S)$ is computable without forming its $216$ columns:
  $ \( cal(S) cal(S)^(*) \)_(a b) = #scale(x: 120%, y: 120%)[\(] \( upright(bold(e))_i - upright(bold(e))_j \) dot.op \( upright(bold(e))_(i') - upright(bold(e))_(j') \) #scale(x: 120%, y: 120%)[\)] \( M_(: \, a) dot.op M_(: \, b) \) . quad "(4.11)" $ <phase:tensor-gram>
  Here the edge labels are repeated for their real and imaginary parts. This is the sign-factor formula in #raw("buildH::patch"). ◻
]

#thm([Proposition 4.5.])[
  (Sufficient conditions for a Root certificate).  #emph[Let $P \, T$ and the nonnegative constants be as in Definition 25. Suppose the basic bounds (4.4) hold and an auxiliary stored real $36$-by-$30$ matrix $M$ satisfies 
$ parallel M parallel lt.eq mono(m n o r m) \, #h(2em) mono(m n o r m) thin mono(f r o o t) lt.eq mono(n 0) \, #h(2em) parallel Pi - T T^(*) - M L_P Pi parallel lt.eq mono(i d) \, quad "(4.12)" $ <phase:projector-certificate>

 and $mono(C)$ is an upper bound for a remainder constant $pi b$ in Lemma 27. Then these data form a certified Root.]
] <phase:root-bounds>

#proof[
  Let $delta$ be horizontal with $F \( P + delta \) = 0$, and put $eta = T^(*) delta$. Write $E = Pi - T T^(*) - M L_P Pi$. The Taylor equation at the exact solution gives
  $ \( I - T T^(*) \) delta = E delta - M F \( P \) - M cal(R)_P \( delta \) . $
  The certificate and Lemma 27 prove (4.5). The squared inequality follows without assuming that $T T^(*)$ is a projector:
  $ parallel delta - T eta parallel^2 = parallel delta parallel^2 - 2 parallel eta parallel^2 + eta^(*) \( T^(*) T \) eta gt.eq parallel delta parallel^2 - \( 1 + mono(o r t) \) parallel eta parallel^2 . $
  In fact this calculation holds for arbitrary $delta$.
  For any horizontal $v$, put $h' = delta - v$ and subtract the Taylor formulas at $delta$ and $v$. Since $h'$ is horizontal and $F \( P + delta \) = 0$,
  $ \( I - T T^(*) \) h' = E h' - M F \( P + v \) - M #scale(x: 120%, y: 120%)[\(] cal(R)_P \( delta \) - cal(R)_P \( v \) #scale(x: 120%, y: 120%)[\)] . $
  Apply (4.9). This proves (4.6), including its residual term at the possibly inexact comparison point $P + v$. ◻
]

The use of a numerical factorization followed by a checked Gram defect is a standard device in verified matrix-norm estimation; compare #cite(label("Rump2011VerifiedSingularValues")). The bounds here are derived from the displayed residual identities and the source-specific arithmetic estimates, including the error in the proposed tangent frame.

#thm([Proposition 4.6.])[
  (Certificates produced by the source).  #emph[A successful call to #raw("buildH::patch"), under the arithmetic conditions of Section 9, certifies (4.4), (4.12), and a valid remainder constant $mono(C)$. Therefore it produces certified Root data in the sense of Definition 25.]
] <phase:stored-root-certificate>

#proof[
  The direct checks, rather than the accuracy of the proposed eigendecomposition, establish the assertion. The source first proposes an approximate horizontal basis and a splitting of the $25$-coordinate horizontal Jacobian. Eigenvalues below $.64$ propose columns of $T$; the other columns propose factors $H_V \, L_V$ for $M$. Every accepted factor entry is checked to have magnitude at most $2$, and at most $25$ columns occur. More than $10$ proposed $T$ columns causes failure.
  Certified absolute row sums of the column Grams of $H_V \, L_V$ bound their squared operator norms. The bound $mono(m n o r m)$ also includes the difference between the accumulated stored $M$ and the exact product $H_V L_V^(*)$ of those stored factors. The required additions and the $2.1 dot.op 10^(- 11)$ Frobenius bound on this difference are proved in Section 9.5. Thus $mono(m n o r m)$ bounds the actual stored map, and the first choice in Lemma 28 supplies a certified $mono(C)$.
  For the optional tensor improvement the source forms the row Gram (4.11). It proposes a real change of basis $U$ and checks an upper $beta$ for $parallel U^(*) U - I parallel$. If $beta < .1$, then $parallel U^(- 1) parallel^2 lt.eq 1 \/ \( 1 - beta \)$. A certified absolute-row-sum bound $r$ for $U^(*) \( cal(S) cal(S)^(*) \) U$ implies
  $ parallel cal(S) parallel^2 lt.eq frac(r, 1 - beta) . $
  This uses congruence by an invertible matrix, not assumed exact orthogonal diagonalization. The second choice in Lemma 28, with the one-sided margins in Section 9.5, gives the alternative $mono(C)$. Both candidates are upper bounds, so their minimum is allowed.
  Finally, the source evaluates the full $36$-coordinate identity in (4.12), not merely the identity in the proposed horizontal coordinates. The padded Frobenius residual gives $mono(i d)$. Corresponding checks on $T^(*) T - I$, $\( I - Pi \) T$, and $F \( P \)$ give the basic bounds, and the stored $mono(n 0)$ is an upper bound for $mono(m n o r m) thin mono(f r o o t)$. Section 9.5 proves the one-sided error estimates for all these checks and records their acceptance thresholds. Replacing operator norms by Frobenius norms only enlarges the bounds. Proposition 29 therefore applies to every successful call. ◻
]

=== 4.3 Transport and alignment of phase balls <transport-and-alignment-of-phase-balls>

#thm([Lemma 4.7.])[
  (Equivalence transport).  #emph[Let $Phi$ permute rows and columns of a phase matrix, with optional transpose and optional simultaneous change of all signs. Then $Phi$ is a real linear isometry commuting with $Pi$, and 
$ parallel F \( Phi P \) parallel = parallel F \( P \) parallel . quad "(4.13)" $ <phase:residual-invariance>

 The residual norm is also invariant under row/column rephasings and entrywise integer additions. Replacing $P \, T$ by $Phi P \, Phi T$, with $Phi$ applied to every column of $T$, preserves all the certified Root assertions with the same scalar constants. The existence of an extension by two further mutually unbiased bases is preserved in both directions.]
] <phase:transport>

#proof[
  Commutation with double centering and preservation of Euclidean norms follow from the formulas for these maps. Row or column permutations, conjugation, and rephasing preserve the residual norm directly. For transpose, put $A = e \( P \)$. Both $A A^(*)$ and $A^(*) A$ have diagonal entries $6$, and
  $ parallel A A^(*) parallel_F^2 = parallel A^(*) A parallel_F^2 \, #h(2em) parallel F \( P \) parallel^2 = frac(parallel A A^(*) parallel_F^2 - 216, 8 pi^2) . $
  The first identity follows by cyclically permuting the factors under the trace. For $A^T$ the same expression uses $A^(*) A$, up to transpose/conjugation. This proves (4.13) at every real center, not just at a solution.
  Pull back horizontal $delta \, v$ by $Phi^(- 1)$ in (4.5)–(4.6). Inner products, norms, horizontality, and exact solution status are preserved, and the residual term is preserved by (4.13). The same argument preserves (4.4). No transported matrix $M$ is required.
  Extendibility is preserved by Lemma 5. Its transpose argument applies to each exact solution; it does not use unitarity of the approximate center. ◻
]

Write

$ D_0 \( P \)_(i j) = P_(i j) - P_(i 0) - P_(0 j) + P_00 . $

For any two real centers $P \, Q$ and any integer matrix $N$,

$ d = Pi \( D_0 \( P \) - D_0 \( Q \) - N \) quad arrow.r.double quad e \( Q + d \) upright(" is phase-equivalent to ") e \( P \) . quad "(4.14)" $ <phase:alignment>

Indeed $Pi D_0 \( P \) = Pi P$; subtracting $Pi$ from the identity operator leaves a matrix constant on rows plus a matrix constant on columns. Thus the difference between $Q + d$ and $P - N$ is such a rephasing. For every horizontal $delta$, the same fixed alignment makes $e \( Q + d + delta \)$ equivalent to $e \( P + delta \)$. This is why a particular choice of integers suffices: no optimality of the wraps is needed. The source’s rounded #raw("dephase") and #raw("wrap") operations determine these integer choices, and Section 9 bounds their remaining arithmetic error.

=== 4.4 Phase displacements for a retained completion cell <phase-displacements-for-a-retained-completion-cell>

Use the notation of Section 3. In particular $D$ is the ideal comparison block at the fixed seed and unitary-cell center, $D'$ is the lower-right block of a feasible exact flat matrix, and $Z = D' - D$. The certified bounds and linearization are

$ parallel Z parallel_F lt.eq z \, #h(2em) parallel Z - cal(J) \( s \, theta \) parallel_F lt.eq E_r \, #h(2em) parallel s parallel lt.eq R_s \, quad \| theta_a \| lt.eq h quad \( 1 lt.eq a lt.eq 4 \) \, $

as in (3.16), (3.20), and (3.21). Here $s in bb(R)^9$ and $theta in bb(R)^4$ are in radians. Denote by $cal(I)_s$ the nine seed positions, whose row-major indices are

$ \( 7 \, 8 \, 9 \, 10 \, 11 \, 13 \, 19 \, 25 \, 31 \) \, $

and by $cal(I)_D$ the $16$ lower-right positions $\( i \, j \)$ with $2 lt.eq i \, j lt.eq 5$. The first row and column have zero raw displacement.

#thm([Lemma 4.8.])[
  (Arc and weighted-arc bounds).  #emph[Suppose $m_j = \| D_j \| > 0$ at every lower-right position and put $D_j^compose = D_j \/ m_j$. Choose the shortest angular displacement, in radians, $d_j in \[ - pi \, pi \]$ from $D_j^compose$ to $D'_j$. Let $mono(s l a c k)$ be a nonnegative upper bound for $z^2 - sum_j \( m_j - 1 \)^2$, let $mono(m i)$ be a positive lower bound for $min_j m_j$, and choose 
$ q_d gt.eq mono(s l a c k) / mono(m i) \, #h(2em) q_d < 3.8 . $

 Then valid upper bounds are 
$ parallel d parallel lt.eq mono(a r c) \, #h(2em) (sum_j m_j d_j^2)^(1 \/ 2) lt.eq mono(w e i g h t e d) \, quad "(4.15)" $ <phase:arc-weighted>

 provided 
$ mono(a r c) gt.eq sqrt(q_d) / sqrt(1 - q_d \/ 4) \, #h(2em) mono(w e i g h t e d) gt.eq sqrt(mono(s l a c k)) / sqrt(1 - q_d \/ 4) . $

]
] <phase:arc-bounds>

#proof[
  Since $D'_j$ has modulus one,
  $ \| D'_j - D_j \|^2 = \( m_j - 1 \)^2 + m_j \| D'_j - D_j^compose \|^2 . quad "(4.16)" $ <phase:chord-identity>
  Summing proves $sum_j m_j \| D'_j - D_j^compose \|^2 lt.eq mono(s l a c k)$, and hence $sum_j \| D'_j - D_j^compose \|^2 lt.eq q_d$. In particular no individual chord reaches $2$. If $c_j = \| D'_j - D_j^compose \|$, then $\| d_j \| = 2 arcsin \( c_j \/ 2 \)$. On $0 lt.eq c lt.eq sqrt(q_d)$ its derivative is at most $\( 1 - q_d \/ 4 \)^(- 1 \/ 2)$. Integrating from zero gives $\| d_j \| lt.eq c_j \( 1 - q_d \/ 4 \)^(- 1 \/ 2)$, and the two summed bounds follow. ◻
]

The source’s #raw("Candidate::prep") only attempts this argument when its direction and magnitude checks pass. It uses the stored flat sum $mono(s u m)$ and sets

$ mono(s l a c k) = max \( 0 \, mono(z)^2 - mono(s u m) + 10^(- 5) \) + 10^(- 10) \, #h(2em) q_d = mono(s l a c k) \/ mono(m i) + 10^(- 8) . $

The subtraction $10^(- 6)$ from each computed magnitude gives $mono(m i)$ and the upper reciprocal $mono(i n v m a g)_j = 1 \/ \( mono(m)_j - 10^(- 6) \) + 10^(- 9)$. The ratio has $10^(- 7)$ added and the final arc quantities each have $10^(- 8)$ added. As proved in Section 9, these numbers have the one-sided properties of Lemma 32 for the ideal comparison block. Failure of any check means failure to cover this cell by this route, not an exclusion of the cell.

#thm([Lemma 4.9.])[
  (Stored center and support representation).  #emph[Let $P_0$ be the stored #raw("Candidate") phase matrix. On a successful preparation path there is a correction $epsilon.alt$, in cycles, with 
$ parallel epsilon.alt parallel lt.eq 2 dot.op 10^(- 6) \, quad "(4.17)" $ <phase:epsilon>

 such that, up to entrywise integer choices, the actual feasible phase matrix has the form 
$ P_0 + epsilon.alt + frac(u, 2 pi) . quad "(4.18)" $ <phase:candidate-lift>

 Here the raw angular matrix $u$ is $s$ at $cal(I)_s$, is $d$ at $cal(I)_D$, and is zero elsewhere. In particular 
$ parallel u parallel lt.eq sqrt(R_s^2 + mono(a r c)^2) . quad "(4.19)" $ <phase:raw-displacement>

 Let $X : bb(R)^13 arrow.r bb(R)^36$ give $s$ at the seed positions and, at the lower-right positions, give 
$ \( X \( s \, theta \) \)_j = Im #scale(x: 120%, y: 120%)[\(] overline(D_j^compose) cal(J) \( s \, theta \)_j #scale(x: 120%, y: 120%)[\)] . quad "(4.20)" $ <phase:X>

 Then 
$ u = X \( s \, theta \) + e_D + e_sin \, #h(2em) parallel e_D parallel lt.eq E_r \, #h(2em) parallel e_sin parallel_1 lt.eq mono(a r c)^3 \/ 6 \, quad "(4.21)" $ <phase:raw-support>

 where both errors are supported on $cal(I)_D$.]
] <phase:center-correction>

#proof[
  The first row and column of $P_0$ are zero. Its seed entries are the binary seed-center phases after integer reduction; this is the fixed center used in the completion bounds. On $cal(I)_D$, the source proposes a phase with #raw("atan2") but checks its unit direction:
  $ \| e \( \( P_0 \)_j \) - D_j^(upright("num")) \/ m_j^(upright("num")) #scale(x: 120%, y: 120%)[\|] < 10^(- 7) . $
  Section 9 bounds the latter normalized direction’s error from the ideal $D_j^compose$ by $5.5 dot.op 10^(- 8)$, and the total true chord error by $1.56 dot.op 10^(- 7)$. For circular phase distance $t in \[ 0 \, 1 \/ 2 \]$, the chord $2 sin \( pi t \)$ is at least $4 t$, by concavity of sine on this interval. Thus a suitable integer lift has phase error at most one quarter of that chord. Over $16$ positions this is below (4.17). No accuracy property of the proposed #raw("atan2") value was assumed. Adding the shortest block displacements and the original seed displacements proves (4.18); their supports are disjoint, proving (4.19).
  On a lower-right position,
  $ Im \( overline(D_j^compose) Z_j \) = sin d_j . $
  The difference between this quantity and (4.20) has Euclidean norm at most $parallel Z - cal(J) \( s \, theta \) parallel_F lt.eq E_r$. Finally
  $ sum_j \| d_j - sin d_j \| lt.eq 1 / 6 sum_j \| d_j \|^3 lt.eq 1 / 6 parallel d parallel^3 lt.eq mono(a r c)^3 \/ 6 . $
  These are the two errors in (4.21). ◻
]

=== 4.5 Direct and tangent bounds for a cell <direct-and-tangent-bounds-for-a-cell>

Fix a certified Root $P \, T$. Let $N$ incorporate the particular integer choices made by #raw("Root::finish") and #raw("Candidate::delta"), and define the ideal horizontal alignment

$ Delta = Pi \( P_0 - D_0 \( P \) - N \) . quad "(4.22)" $ <phase:Delta>

By (4.14), every exact feasible matrix in the cell has an equivalent representation $e \( P + delta \)$, with horizontal

$ delta = Delta + Pi (epsilon.alt + frac(u, 2 pi)) . quad "(4.23)" $ <phase:delta>

The equivalence preserves the extension problem. The computed #raw("delta") array approximates the particular ideal $Delta$; its rounding error is included in the estimates below.

#thm([Lemma 4.10.])[
  (A direct displacement bound).  #emph[Either of the following is an upper bound for $Delta dot.op u$: 
$ S_1 =  & R_s parallel \( X^(*) Delta \)_s parallel + h parallel \( X^(*) Delta \)_theta parallel_1 + E_r parallel Delta_D parallel + parallel Delta_D parallel_oo mono(a r c)^3 \/ 6 \,\
S_2 =  & R_s parallel Delta_s parallel + mono(w e i g h t e d) (sum_(j in cal(I)_D) Delta_j^2 \/ m_j)^(1 \/ 2) . quad "(4.24)" $ <phase:support-linear>

 Subscripts $s \, D$ on a phase matrix mean restriction to $cal(I)_s \, cal(I)_D$; subscripts on $X^(*) Delta$ mean its nine seed and four angle coordinates. With $S_Delta = min \( S_1 \, S_2 \)$, a valid bound is 
$ parallel delta parallel lt.eq (parallel Delta parallel^2 + frac(R_s^2 + mono(a r c)^2, \( 2 pi \)^2) + S_Delta / pi)^(1 \/ 2) + parallel epsilon.alt parallel . quad "(4.25)" $ <phase:s0>

]
] <phase:direct-bound>

#proof[
  Equation (4.21), the seed ball, and the angle box give (4.24). Direct weighted Cauchy–Schwarz using (4.15) gives (4.24). Since $Delta$ is horizontal, $Delta dot.op Pi u = Delta dot.op u$. Expand the squared norm of $Delta + Pi u \/ \( 2 pi \)$, use contraction by $Pi$, and then add $parallel Pi epsilon.alt parallel lt.eq parallel epsilon.alt parallel$ by the triangle inequality. ◻
]

The source’s #raw("covercompute::value") computes these supports and uses their minimum, with $+ .0001$ before division by $pi$. Its $mono(d 2)$ bounds $\( R_s^2 + mono(a r c)^2 \) \/ \( 2 pi \)^2$, with $10^(- 8)$ added, and

$ mono(s 0) = sqrt(mono(n d) + mono(d 2) + \( mono(s u p p) + .0001 \) \/ pi) + .00001 . $

Section 9 proves this is an upper bound in (4.25): it includes the projection error in $mono(n d)$, support-coefficient error, and $epsilon.alt$. An early successful return based solely on this bound is valid.

For a sharper bound put $eta = T^(*) delta$. The expression obtained by temporarily omitting projection and center correction, in radians, is

$ 2 pi T^(*) Delta + T^(*) u . $

The total omission has the explicit bound

$ ∥2 pi eta - \( 2 pi T^(*) Delta + T^(*) u \)∥ lt.eq mono(h o r) sqrt(R_s^2 + mono(a r c)^2) + 2 pi sqrt(1 + mono(o r t)) thin parallel epsilon.alt parallel . quad "(4.26)" $ <phase:tangent-projection-error>

Indeed $T^(*) \( I - Pi \) = \( \( I - Pi \) T \)^(*)$, and $parallel T^(*) Pi epsilon.alt parallel lt.eq parallel T parallel parallel epsilon.alt parallel$.

We next enclose the sum of two linear images of balls by one ellipsoid. This is a standard outer-sum construction in ellipsoidal calculus; see #cite(label("KurzhanskiyVaraiya2006EllipsoidalToolbox")) Section 2.2.2, equation (2.16). The support-function proof below also covers singular shape matrices.

#thm([Lemma 4.11.])[
  (Ellipsoid containment).  #emph[For real linear maps $A \, B$, vectors $parallel s parallel lt.eq r$, $parallel v parallel lt.eq q$, and $beta > 0$, the sum $A s + B v$ belongs to the ellipsoid 
$ { G^(1 \/ 2) w : parallel w parallel lt.eq 1 } quad upright("whenever") quad G succ.curly.eq \( 1 + beta \) r^2 A A^(*) + \( 1 + 1 \/ beta \) q^2 B B^(*) . $

]
] <phase:ellipsoid-containment>

#proof[
  For each real test vector $z$, the support of the sum is at most
  $ r parallel A^(*) z parallel + q parallel B^(*) z parallel lt.eq #scale(x: 120%, y: 120%)[\(] \( 1 + beta \) r^2 parallel A^(*) z parallel^2 + \( 1 + 1 \/ beta \) q^2 parallel B^(*) z parallel^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq \( z^(*) G z \)^(1 \/ 2) . $
  The scalar inequality follows by completing a square. For completeness, diagonalizing the positive semidefinite $G$ shows that the vectors satisfying $\| z dot.op x \| lt.eq \( z^(*) G z \)^(1 \/ 2)$ for every $z$ are exactly $G^(1 \/ 2)$ times the unit ball: zero-eigenvalue directions force zero components, and taking $z_a = x_a \/ lambda_a$ in the positive-eigenvalue coordinates gives $sum x_a^2 \/ lambda_a lt.eq 1$. This proves the claimed containment, including singular $G$. ◻
]

Partition $X = \( X_s \, X_theta \)$, and let $T_s \, T_D$ denote the rows of $T$ restricted to the indicated position sets. From the angle box, $2 pi T^(*) Delta + h T^(*) X_theta \[ - 1 \, 1 \]^4$ is the convex hull of the $16$ offsets

$ U_sigma = 2 pi T^(*) Delta + h sum_(a = 1)^4 sigma_a T^(*) X_(theta \, a) \, #h(2em) sigma_a in { - 1 \, 1 } . quad "(4.27)" $ <phase:offset-corners>

By Lemma 35 with $beta = .45$, the sum of the seed and $e_D$ contributions to $T^(*) u$ lies in an ellipsoid whenever

$ G_(upright("lin")) succ.curly.eq 1.45 R_s^2 \( T^(*) X_s \) \( T^(*) X_s \)^(*) + \( 1 + 1 \/ .45 \) E_r^2 T_D^(*) T_D . quad "(4.28)" $ <phase:ellipsoid-linear>

The remaining sine error has norm at most

$ (max_(j in cal(I)_D) parallel T_(j \, :) parallel) mono(a r c)^3 \/ 6 . $

There is also a bound using the raw seed and weighted angle balls, with a single offset $U_0 = 2 pi T^(*) Delta$:

$ G_(upright("dir")) succ.curly.eq 1.8 R_s^2 T_s^(*) T_s + \( 1 + 1 \/ .8 \) mono(w e i g h t e d)^2 T_D^(*) "diag" \( 1 \/ m_j \) T_D . quad "(4.29)" $ <phase:ellipsoid-direct>

This is Lemma 35 with $beta = .8$. It has no sine-error term because it bounds $d$ directly.

#thm([Lemma 4.12.])[
  (Offset ellipsoid norm bound).  #emph[Let $G succ.curly.eq 0$ and $U in bb(R)^k$. For every $gamma > lambda_max \( G \)$ and $parallel w parallel lt.eq 1$, 
$ parallel U + G^(1 \/ 2) w parallel^2 lt.eq gamma #scale(x: 120%, y: 120%)[\(] 1 + U^(*) \( gamma I - G \)^(- 1) U #scale(x: 120%, y: 120%)[\)] . quad "(4.30)" $ <phase:ellipsoid-gamma>

 The simpler upper bound $parallel U parallel + sqrt(lambda_max \( G \))$ for the norm is also valid. If offsets range over a convex hull of finitely many $U_sigma$, it suffices to take the largest of the bounds at those offsets.]
] <phase:ellipsoid-norm>

#proof[
  Put $A = gamma I - G succ 0$. Expanding and completing the square,
  $ parallel U + G^(1 \/ 2) w parallel^2 lt.eq gamma + parallel U parallel^2 + 2 w^(*) G^(1 \/ 2) U - w^(*) A w lt.eq gamma + parallel U parallel^2 + U^(*) G^(1 \/ 2) A^(- 1) G^(1 \/ 2) U . $
  Since $G$ commutes with $A^(- 1)$, the last two terms equal $gamma U^(*) A^(- 1) U$. The simpler bound is the triangle inequality. For fixed $w$, convexity of norm bounds the norm at any convex combination of offsets by the maximum over those offsets; taking the supremum over $w$ proves the last assertion. ◻
]

Let $cal(E) \( G \; { U_sigma } \)$ denote any certified upper bound obtained from Lemma 36. The preceding arguments give either of the tangent bounds

$ parallel T^(*) delta parallel lt.eq  & frac(cal(E) \( G_(upright("lin")) \; { U_sigma } \) + max_(j in cal(I)_D) parallel T_(j \, :) parallel thin mono(a r c)^3 \/ 6 + mono(h o r) sqrt(R_s^2 + mono(a r c)^2), 2 pi) + sqrt(1 + mono(o r t)) parallel epsilon.alt parallel \,\
parallel T^(*) delta parallel lt.eq  & frac(cal(E) \( G_(upright("dir")) \; { U_0 } \) + mono(h o r) sqrt(R_s^2 + mono(a r c)^2), 2 pi) + sqrt(1 + mono(o r t)) parallel epsilon.alt parallel . quad "(4.31)" $ <phase:tangent-linear>

===== 4.5.1 Numerical realization of these tangent bounds. <numerical-realization-of-these-tangent-bounds.>

In #raw("covercompute"), #raw("off") is the computed $2 pi T^(*) Delta$, #raw("AB") is the computed $T^(*) X$, and #raw("U") holds the $16$ corners. The covariance calculations use the #emph[stored] #raw("AB") coefficients; their errors from the ideal coefficients are charged separately outside the ellipsoid. More explicitly, if $hat(A)$ denotes the stored #raw("AB") matrix, the first stored covariance dominates the right-hand side of (4.28) with $T^(*) X_s$ replaced by $hat(A)_s$, and its corners use $hat(A)_theta$. Section 9 gives

$ parallel hat(A) - T^(*) X parallel < 1.5 dot.op 10^(- 5) \, #h(2em) parallel \( s \, theta \) parallel < .226 \, $

so this substitution costs less than $3.4 dot.op 10^(- 6)$ radians. For both covariance choices a diagonal $10^(- 7) I$ is added. The reciprocals in the second choice are the certified upper #raw("invmag") values, so this change also enlarges the covariance. Section 9 proves positive semidefinite domination of the exact covariance expressions in this stored-coefficient model.

The function #raw("spectralUpper") bounds the norm of a symmetric stored $G$ by the smaller of a maximum absolute row sum plus $10^(- 10)$, and $parallel G^2 parallel_F^(1 \/ 2)$ computed with $2 dot.op 10^(- 7)$ added. Thus #raw("ell") starts with a certified triangle-inequality bound. For each attempted $gamma$, it uses a lower gap $mono(g a p) lt.eq gamma - lambda_max \( G \)$, requiring $mono(g a p) gt.eq 10^(- 6)$. If $z$ is any finite trial solve and $r = U - \( gamma I - G \) z$, then

$ U^(*) \( gamma I - G \)^(- 1) U lt.eq U^(*) z + frac(parallel U parallel parallel r parallel, mono(g a p)) . quad "(4.32)" $ <phase:inverse-residual>

This follows by substituting $\( gamma I - G \)^(- 1) U = z + \( gamma I - G \)^(- 1) r$. The source checks the finite scale of $z$, bounds this residual expression with its explicit $10^(- 10)$-scale additions, and adds $10^(- 6)$ after taking the candidate square root and again upon return. It does not rely on accuracy of its Cholesky solve. Section 9 verifies the errors including division by the lower gap.

On a potentially successful completion-cell path, the external error in either applicable tangent bound, in radians, is below $.00012$. This includes the coefficient and offset errors, the projection term in (4.26) (less than $8.81 dot.op 10^(- 5)$ radians), and the center correction (less than $1.27 dot.op 10^(- 5)$ radians). Accordingly the source adds $.00015$ in radians before division by $2 pi$, and another $.00002$ in cycles afterward. The sine term is included only for (4.31). These margins establish an upper $t_0 gt.eq parallel T^(*) delta parallel$ while retaining both the phase lift and approximate-horizontality errors.

=== 4.6 Bootstrap and local coverage <bootstrap-and-local-coverage>

#thm([Proposition 4.13.])[
  (Finite improvement of a certified radius).  #emph[Suppose $s_0 gt.eq parallel delta parallel$ and $t_0 gt.eq parallel T^(*) delta parallel$ for every feasible solution in a completion cell, using the particular alignment (4.23). Starting with any such upper $s$, a further upper is 
$ (n_P \( s \)^2 + \( 1 + mono(o r t) \) t_0^2)^(1 \/ 2) . quad "(4.33)" $ <phase:bootstrap-update>

 Replacing $s$ by this number only when it decreases $s$, and stopping after any finite number of steps, preserves coverage of every feasible solution in the cell.]
] <phase:bootstrap>

#proof[
  The constants in $n_P$ are nonnegative, so $n_P \( parallel delta parallel \) lt.eq n_P \( s \)$. Substitute (4.5) into (4.5) and use the given tangent upper. Each proposed update is an upper bound at the current stored upper, so induction proves the assertion. No convergence or uniqueness assertion is involved. ◻
]

The source’s #raw("bootstrap") uses at most $30$ updates. It inflates its tangent input by $.00002$ and its initial radius by $10^(- 6)$, then evaluates (4.33) with $10^(- 8)$ added at each attempted update. The positive-expression error bounds of Section 9 make each update an upper. When $k = 0$, the mathematical tangent norm is zero; the source’s small positive tangent input is harmless.

Scale failures in #raw("ell") return $100$, which makes that tangent path fail #raw("bootstrap")’s $t < 10$ guard. Its failure sentinel is $10$. These values cannot pass the local target $.103$; they are not certificates. The other guard requires $0 lt.eq mono(i n i t) < 3$ and $mono(C) < 20$. A direct valid $mono(s 0)$ can still establish coverage without either ellipsoid path.

#raw("local::test") returns success only after a certified #raw("covercompute") bound for a specific Root fits the target with its final margins. It grows that Root’s recorded radius to cover the bound, adding $10^(- 8)$. Selecting only a few nearby Roots by a heuristic score cannot invalidate this implication. If those fail, snapping merely proposes a new center, which must pass #raw("buildH::patch") and the same covering computation. Failed snapping or failed coverage does not discard the completion cell: the completion search subdivides it, or records an unresolved seed if its depth or node limit is reached, as described in Section 3.

=== 4.7 Merging the global atlas <merging-the-global-atlas>

#prodef([Definition 4.14.])[
  (Record and its covered solution set).  A #raw("Record") is a certified Root with a nonnegative radius $r$. Its solution set consists of matrices $e \( P + delta \)$ with $delta$ horizontal, $parallel delta parallel lt.eq r$, and $F \( P + delta \) = 0$. Coverage by Records may be up to the extendibility-preserving equivalences of Lemma 31; the chosen equivalence may differ for different assignments. The term #emph[sphere] in the source includes the interior and boundary of this closed ball.
] <phase:record>

#thm([Lemma 4.15.])[
  (A certified atlas merge).  #emph[Let a local Record have center $P$ and radius $r$. Let $Q$ be an existing certified atlas center. Suppose an allowed $Phi$ and integer matrix $N$ have been selected, and $d$ is a certified upper for 
$ ∥Pi #scale(x: 120%, y: 120%)[\(] D_0 \( Phi P \) - D_0 \( Q \) - N #scale(x: 120%, y: 120%)[\)]∥ . $

 Then the local Record is covered up to equivalence by the Record at $Q$ of radius $r + d$.]
] <phase:atlas-merge>

#proof[
  An exact solution $e \( P + delta \)$ from the local Record first transports to $e \( Phi P + Phi delta \)$. The center alignment (4.14) represents it at $Q$ by the horizontal displacement
  $ Pi \( D_0 \( Phi P \) - D_0 \( Q \) - N \) + Phi delta . $
  Its norm is at most $d + r$. Both transformations preserve exact solution status and extendibility. ◻
]

The implementation in #raw("atlas.cpp") uses #raw("mapH") for $Phi$. Its two index arrays are genuine permutations. To see this directly in #raw("variants"), the leading two row indices are distinct and #raw("complement") supplies precisely the other four. The six column labels remain attached to six distinct integers when their phase keys are sorted and cyclically reordered. The later tail sort and rotation only permute the four remaining row labels. With the transpose flag the lookup is $6 thin mono(c o l) \[ j \] + mono(r o w) \[ i \]$, rather than $6 thin mono(r o w) \[ i \] + mono(c o l) \[ j \]$; either lookup is a bijection of all $36$ entries. The sign flag multiplies every entry, and every column of $T$, by the same sign.

For a finite certified center, #raw("canonicalMap") obtains at least one callback, so it does not use an uninitialized or degenerate index choice. In each finite pivot list a largest gap is attained and is admitted by the nonnegative tolerance. A list attaining the smallest such largest gap is admitted by the next comparison. Among its five tail scores a maximum is attained and is admitted by the final comparison. The first resulting callback initializes the chosen map. Ties and repeated phase values do not alter the distinct attached labels. The signature used to choose among these maps need not be a canonical invariant.

#raw("Atlas::find") computes an explicit wrapped dephased difference, projects it, and evaluates its norm. On a successful return it adds $10^(- 7)$ to the computed norm, exceeding the dephasing/projection errors certified in Section 9. #raw("Atlas::add") then grows the selected radius to at least the incoming radius plus this distance, with another $10^(- 8)$ added and a separate $2 dot.op 10^(- 8)$-margin comparison to the cap. This is Lemma 39. It remains valid when an alternative map found by #raw("variants") supplied the distance; only existence of that allowed map is needed to establish the merge.

If no merge is certified, the source inserts the transformed Root and its original local radius. The hash buckets, pivot selection, and early raw-distance cuts only reduce the opportunities to merge; none removes an input Record. The A atlas uses radius cap $.125$. Its size cap aborts rather than certifying a discarded Record.

#thm([Proposition 4.16.])[
  (Output meaning of a successful A stage).  #emph[Suppose the initial seed cover is valid and the completion search processes all its seeds with no failed or unresolved seed. Then the A-stage Records cover, up to extendibility-preserving equivalence, every exact second-basis Hadamard matrix required for the four-basis problem.]
] <phase:A-cover>

#proof[
  The completion parametrization covers each feasible matrix in a seed by its closed unitary cells. Follow any such matrix through containing cells. A sound exclusion cannot reject it; subdivision retains a containing child. Since the search is finite and the failed-setup and unresolved depth/node-limit paths are assumed absent, this path must end with a certified local covering bound. The preceding propositions give a certified Root ball for that assignment. Atlas insertions preserve these balls, and every merge preserves their solution sets up to equivalence by Lemma 39. This proves the claim. Boundaries cause no exception: all seed balls, unitary cells, ellipsoids, and phase balls used in this argument may be taken closed, and overlapping assignments are harmless. ◻
]

== 5 Refining the phase-ball cover <sec:refinement>

The purpose of Stage B is to replace a finite collection of certified phase balls by balls of a smaller prescribed radius. The centers need not be exact Hadamard matrices, and the argument makes no regularity assumption on the Hadamard locus. In particular, the tangent coordinates used below do not parametrize that locus: they organize an exhaustive search, while the normal estimates from Section 4 control the remaining directions.

All vector spaces of phases in this section are real. A phase matrix is identified with a vector in $bb(R)^36$, and $""^(*)$ denotes transpose on real spaces. Write $cal(V) = "im" Pi$ for the horizontal subspace. For a certified center $P$ and a radius $R gt.eq 0$, let

$ cal(S) \( P \, R \) = { \[ e \( P + delta \) \] : delta in cal(V) \, quad parallel delta parallel lt.eq R \, med F \( P + delta \) = 0 #scale(x: 120%, y: 120%)[}] . quad "(5.1)" $ <refine:solution-set>

Here brackets denote the equivalence classes used in the preceding sections, including the permitted signed permutation and transpose operations. These equivalences preserve the extendibility property being tested. Thus a cover by the sets (5.1) is sufficient even when different parts of it use different arrangements of the same matrix.

=== 5.1 A certified relation between two centers <a-certified-relation-between-two-centers>

For the Root at $P$, denote its stored tangent matrix by $T : bb(R)^k arrow.r bb(R)^36$ and put

$ o_P & = mono(o r t)_P \, #h(2em) alpha_P = mono(i d)_P \, #h(2em) gamma_P = mono(C)_P \,\
mu_P & = mono(m n o r m)_P \, #h(2em) epsilon_P = mono(f r o o t)_P \, #h(2em) n_P \( s \) = mono(n 0)_P + alpha_P s + gamma_P s^2 . quad "(5.2)" $ <refine:constants>

All these constants are nonnegative. We use the same notation, with subscript $Q$, for a second certified Root with center $Q$ and tangent matrix $S : bb(R)^(k_Q) arrow.r bb(R)^36$. In particular,

$ parallel T^(*) T - I parallel lt.eq o_P \, #h(2em) parallel S^(*) S - I parallel lt.eq o_Q \, #h(2em) parallel F \( Q \) parallel lt.eq epsilon_Q . quad "(5.3)" $ <refine:gram-bounds>

We will apply the normal and difference inequalities (4.5) and (4.6).

The following elementary identity explains why approximate, rather than exact, orthogonality is sufficient throughout the construction.

#thm([Lemma 5.1.])[
  #emph[Put $A = I - T T^(*)$. For every $x in bb(R)^36$, with $zeta = T^(*) x$, 
$ parallel T parallel lt.eq sqrt(1 + o_P) \, #h(2em) parallel A parallel lt.eq 1 + o_P \, #h(2em) parallel x parallel^2 lt.eq \( 1 + o_P \) parallel zeta parallel^2 + parallel A x parallel^2 . quad "(5.4)" $ <refine:projection-estimates>

 These statements do not require $x$ or the columns of $T$ to be horizontal.]
] <refine:approximate-projection>

#proof[
  The Gram bound gives the first inequality. The eigenvalues of $T T^(*)$ lie in $\[ 0 \, 1 + o_P \]$, so those of $I - T T^(*)$ lie in $\[ - o_P \, 1 \]$; hence its norm is at most $max \( 1 \, o_P \) lt.eq 1 + o_P$. Finally,
  $ parallel A x parallel^2 = parallel x parallel^2 - 2 parallel zeta parallel^2 + parallel T zeta parallel^2 gt.eq parallel x parallel^2 - \( 1 + o_P \) parallel zeta parallel^2 \, $
  using $parallel T zeta parallel^2 gt.eq \( 1 - o_P \) parallel zeta parallel^2$. ◻
]

Let $D_0$ be the unwrapped dephasing operator,

$ \( D_0 X \)_(i j) = X_(i j) - X_(i 0) - X_(0 j) + X_00 . $

Choose any integer matrix $N$ and define

$ d_q = Pi #scale(x: 120%, y: 120%)[\(] D_0 Q - D_0 P - N #scale(x: 120%, y: 120%)[\)] \, #h(2em) eta_q = T^(*) d_q \, #h(2em) n_q = parallel A d_q parallel . quad "(5.5)" $ <refine:alignment>

The implementation chooses $N$ by wrapping differences of cached dephased entries. The chosen lift need not minimize any distance. Indeed, $D_0 X - X in ker Pi$, so

$ Q - P - d_q in N + ker Pi . $

Vectors in $ker Pi$ are row and column rephasings. Consequently $P + d_q$ and $Q$ differ only by integer phases and rephasings.

Fix a parent radius $R$ and an exact solution displacement $delta in cal(V)$ with $parallel delta parallel lt.eq R$. Set

$ eta = T^(*) delta \, #h(2em) h' = delta - d_q \, #h(2em) d = parallel h' parallel \, #h(2em) xi = T^(*) h' = eta - eta_q \, #h(2em) nu = A h' . quad "(5.6)" $ <refine:relative-displacement>

Both $d_q$ and $h'$ are horizontal. Moreover $Q + h'$ is equivalent by the same rephasing to $P + delta$, and therefore is exact. Thus the Root estimates at both centers apply to this one solution.

#thm([Proposition 5.2.])[
  #emph[Suppose $t gt.eq parallel xi parallel$. Choose upper bounds 
$ D & gt.eq R + parallel d_q parallel \, #h(2em) v_0 gt.eq n_P \( R \) + n_q \,\
lambda & gt.eq alpha_P + gamma_P D \, #h(2em) e_0 gt.eq mu_P epsilon_Q . quad "(5.7)" $ <refine:relation-constants>

 Let $S_h = Pi S$ and choose 
$ sigma gt.eq parallel S_h^(*) A parallel \, #h(2em) beta = \( 1 + o_P \) sqrt(\( 1 + o_P \) \( 1 + o_Q \)) . quad "(5.8)" $ <refine:sigma-definition>

 Then 
$ d & lt.eq D \, & d^2 & lt.eq \( 1 + o_P \) t^2 + parallel nu parallel^2 \,\
parallel nu parallel & lt.eq min { v_0 \, \( 1 + o_P \) d \, lambda d + e_0 } \,\
parallel S^(*) h' parallel & lt.eq beta t + sigma parallel nu parallel \,\
d^2 & lt.eq \( 1 + o_Q \) parallel S^(*) h' parallel^2 + n_Q \( d \)^2 . quad "(5.9)" $ <refine:parent-distance>

]
] <refine:relation-estimates>

#proof[
  The triangle inequality gives $d lt.eq R + parallel d_q parallel lt.eq D$. Lemma 41, applied to $h'$, gives the other inequality in (5.9). Also
  $ parallel nu parallel lt.eq parallel A delta parallel + parallel A d_q parallel lt.eq n_P \( R \) + n_q lt.eq v_0 \, $
  because the coefficients of $n_P$ are nonnegative. The operator bound on $A$ gives the second candidate in (5.9). For the third, use (4.6) with its horizontal argument $v = d_q$:
  $ parallel A h' parallel lt.eq #scale(x: 120%, y: 120%)[\[] alpha_P + gamma_P \( parallel delta parallel + parallel d_q parallel \) #scale(x: 120%, y: 120%)[\]] d + mu_P parallel F \( P + d_q \) parallel lt.eq lambda d + e_0 . $
  Here residual-norm invariance under rephasing gives $parallel F \( P + d_q \) parallel = parallel F \( Q \) parallel lt.eq epsilon_Q$.
  To prove (5.9), first use horizontality of $h'$ to obtain $S^(*) h' = S_h^(*) h'$. The identities
  $ h' = T xi + nu \, #h(2em) T^(*) nu = \( I - T^(*) T \) xi \, #h(2em) nu = A nu + T T^(*) nu $
  therefore imply
  $ S^(*) h' = S_h^(*) T xi + S_h^(*) A nu + S_h^(*) T \( I - T^(*) T \) xi . $
  Since $Pi$ is an orthogonal projection,
  $ parallel S_h^(*) T parallel lt.eq parallel S_h parallel thin parallel T parallel lt.eq sqrt(\( 1 + o_Q \) \( 1 + o_P \)) . $
  The first and third terms are thus bounded together by $beta t$, and the middle term by $sigma parallel nu parallel$. This calculation also shows why no assumption of exactly horizontal stored tangent columns, and no omitted error term involving $mono(h o r)$, is hidden in the estimate. Finally apply the squared inequality at the child Root and its normal bound to the horizontal exact-solution displacement $h'$. This gives (5.9). ◻
]

The coefficient $sigma$ has a direct small-matrix certificate. With $W = \( A S_h \)^(*)$, its row Gram is

$ G = W W^(*) = S_h^(*) A^2 S_h \, #h(2em) parallel S_h^(*) A parallel^2 = parallel G parallel . quad "(5.10)" $ <refine:sigma-gram>

The code constructs these rows by projecting each child tangent column and subtracting its components against the parent columns, in that order. A certified upper bound for the norm of $G$, followed by a square root, gives (5.8). For any exact real symmetric $G$, either of the quantities

$ max_i sum_j \| G_(i j) \| \, #h(2em) sqrt(parallel G^2 parallel_F) $

bounds $parallel G parallel$: the first is the symmetric absolute-row bound, while $parallel G parallel^2 = parallel G^2 parallel lt.eq parallel G^2 parallel_F$ proves the second. The routine #raw("spectralUpper") uses their minimum with margins for arithmetic and Gram perturbation, detailed in Section 9. When $k_Q = 0$, the operator is zero and the code sets $sigma = 0$.

=== 5.2 Distance iteration and the searched tangent radius <distance-iteration-and-the-searched-tangent-radius>

The relation estimates yield a useful upper iteration without requiring either contraction or a fixed-point theorem. For fixed $t$, write

$ z & = sqrt(1 + o_P) thin t \,\
v \( b \) & = min { v_0 \, \( 1 + o_P \) b \, lambda b + e_0 } \,\
psi_P \( b \) & = sqrt(z^2 + v \( b \)^2) \,\
psi_Q \( b \) & = sqrt(\( 1 + o_Q \) \( beta t + sigma v \( b \) \)^2 + n_Q \( b \)^2) . quad "(5.11)" $ <refine:iteration-functions>

Start at

$ b_0 = min { D \, sqrt(z^2 + v_0^2) } quad "(5.12)" $ <refine:iteration-start>

and replace $b_j$ by

$ b_(j + 1) = min { b_j \, psi_P \( b_j \) \, psi_Q \( b_j \) } . quad "(5.13)" $ <refine:iteration-step>

#thm([Lemma 5.3.])[
  #emph[Every iterate in (5.12)–(5.13) is an upper bound for the distance $d$ of every parent solution with $parallel eta - eta_q parallel lt.eq t$. The same conclusion holds if any proposed bound is replaced by a larger certified number, or if the process is stopped after any finite number of steps.]
] <refine:iteration-certificate>

#proof[
  Both candidates for $b_0$ are upper bounds by Proposition 42. If $d lt.eq b_j$, (5.9) and nonnegativity of all coefficients give $parallel nu parallel lt.eq v \( b_j \)$. Thus (5.9) gives $d lt.eq psi_P \( b_j \)$. Equations (5.9)–(5.9), together with $n_Q \( d \) lt.eq n_Q \( b_j \)$, give $d lt.eq psi_Q \( b_j \)$. Their minimum is therefore still an upper bound. The argument holds simultaneously for every solution satisfying the tangent constraint; it does not select a single solution at any step. Enlargement and early stopping preserve the conclusion. ◻
]

The routine #raw("relationB::eval") implements this argument with at most 30 attempted improvements. It accepts $0 lt.eq t lt.eq 2$ and otherwise returns the non-success sentinel $10$, which exceeds every radius used here. On the accepted path it first enlarges $t$ by $2 dot.op 10^(- 8)$, adds $10^(- 9)$ to the parent tangent factor, and uses $10^(- 8)$-scale enlargements in the initial distance, normal, child-tangent and updated distance bounds. A proposed value that does not improve the current upper bound ends the iteration. Section 9 verifies these enlargements, the bounds computed in #raw("init"), and the final $10^(- 8)$ addition against the separate binary64 operations. Denote the resulting computed function by $hat(D) \( t \)$. Its required semantic property is the conclusion of Lemma 43:

$ parallel eta - eta_q parallel lt.eq t quad arrow.r.double quad parallel delta - d_q parallel lt.eq hat(D) \( t \) #h(2em) \( 0 lt.eq t lt.eq 2 \) . quad "(5.14)" $ <refine:eval-semantics>

The proof of this property consists of the preceding induction plus the explicit arithmetic bounds; the numerical snapping or eigen-iterations are not premises of that induction.

There are two ways to use (5.14). One may evaluate it at the farthest tangent distance of a particular box. Alternatively, for a queried sphere radius $0 lt.eq a lt.eq .126$, #raw("init") searches for a useful tangent-distance threshold $rho$. The search begins with $ell = 0$ and $u = 1.01 a$, rejects if $hat(D) \( 0 \) > a - 10^(- 7)$, and makes 25 midpoint trials. A trial $m$ replaces $ell$ precisely when

$ hat(D) \( m \) < a - 2 dot.op 10^(- 7) \; quad "(5.15)" $ <refine:rho-trial>

otherwise it replaces $u$. Finally the code sets

$ rho = max \( 0 \, ell - 10^(- 8) \) quad "(5.16)" $ <refine:rho-return>

and reports a usable relation only if $rho > 10^(- 7)$.

#thm([Lemma 5.4.])[
  #emph[Every usable returned threshold certifies 
$ parallel eta - eta_q parallel lt.eq rho quad arrow.r.double quad \[ e \( P + delta \) \] in cal(S) \( Q \, a \) . $

 The search need not find the largest possible threshold. In particular, its correctness does not require monotonicity of the floating-point function $hat(D)$.]
] <refine:rho-certificate>

#proof[
  A positive returned $rho > 10^(- 7)$ cannot arise from the initial value $ell = 0$. Thus the final stored $ell$ was assigned by a successful trial (5.15). The arithmetic margins ensure $rho lt.eq ell$ and $hat(D) \( ell \) < a$. Apply (5.14) with this one stored trial value $ell$. It is a uniform certificate for every true tangent distance at most $ell$, and hence for every distance at most $rho$. The alignment (5.5) then gives the stated containment. No comparison between $hat(D)$ at distinct arguments is needed. ◻
]

For a previously completed parent used as a blocker, $a$ is its fixed input radius and this lemma suffices. For an atlas child, the search uses the allowed cap $a = tau$, not merely its current radius. When boxes are assigned to that child, the code evaluates $hat(D)$ again at an upper tangent distance for those boxes and grows the stored radius to that certified distance, with an additional margin. It checks both that the tangent argument is at most $rho$ and that the new radius is at most $tau$. Failure of either check aborts. Thus even an unfavorable rounded reevaluation cannot silently assign a box to a sphere too small to contain it.

=== 5.3 An exhaustive grid in tangent coordinates <an-exhaustive-grid-in-tangent-coordinates>

For every solution in the parent record,

$ parallel eta parallel = parallel T^(*) delta parallel lt.eq sqrt(1 + o_P) thin R = : E_P . quad "(5.17)" $ <refine:tangent-range>

Let $w > 0$ be the stored refinement width, regarded as an exact real number. The code forms an inflated upper bound $E$ for $E_P$ by adding $10^(- 7)$ to the computed right side of (5.17), and chooses

$ L = ⌈E \/ w + 0.500001⌉ \, #h(2em) n = 2 L + 1 \, $

with the stated rounded evaluation. The error bounds in Section 9 ensure that the resulting outer endpoints $plus.minus \( L + 1 \/ 2 \) w$ contain $\[ - E_P \, E_P \]$.

For $u in bb(R)^k$ and $h gt.eq 0$, write

$ B \( u \, h \) = product_(a = 1)^k \[ u_a - h \, u_a + h \] . quad "(5.18)" $ <refine:box-definition>

The base boxes have $u_a = b_a w$, $- L lt.eq b_a lt.eq L$, and $h = w \/ 2$. Their union contains $\[ - E_P \, E_P \]^k$, so every tangent vector in (5.17) belongs to at least one base box. All intervals are closed; grid boundaries are included.

The minimum squared distance of a box from the origin is

$ "dist" \( 0 \, B \( u \, h \) \)^2 = sum_(a = 1)^k max \( 0 \, \| u_a \| - h \)^2 . quad "(5.19)" $ <refine:outside-formula>

The routine #raw("outside") uses a lower version of this expression, subtracting $10^(- 8)$ inside each nonnegative part, and compares with the inflated $E^2$. Hence an accepted outside test means that the box cannot contain the tangent vector of a parent solution. Stored centers are approximations to the exact multiples of $w$; repeated subdivision centers are interpreted as exact dyadic offsets from this same grid. The coordinate and arithmetic errors, bounded in Section 9, are covered by these margins.

Subdivision is exhaustive because

$ B \( u \, h \) = union.big_(epsilon.alt in { - 1 \, 1 }^k) B \( u + epsilon.alt h \/ 2 \, h \/ 2 \) . quad "(5.20)" $ <refine:subdivision>

The code visits all $2^k$ children if they need to be examined; their common boundaries remain covered. When $k = 0$, the empty product (5.18) is the single point of $bb(R)^0$, so there is one base box and no subdivision is needed or permitted.

#thm([Lemma 5.5.])[
  #emph[For every tangent box, 
$ max_(eta in B \( u \, h \)) parallel eta - eta_q parallel = (sum_(a = 1)^k \( \| u_a - eta_(q \, a) \| + h \)^2)^(1 \/ 2) . quad "(5.21)" $ <refine:corner-formula>

 Consequently, if a certified upper bound $t_B in \[ 0 \, 2 \]$ for this expression satisfies $hat(D) \( t_B \) lt.eq r$, all parent solutions with tangent vector in this box belong to $cal(S) \( Q \, r \)$. The same statement holds with $r = a$ if $t_B lt.eq rho$ for a usable searched relation.]
] <refine:farthest-corner>

#proof[
  In each coordinate the maximum of $\| eta_a - eta_(q \, a) \|$ on the corresponding interval is $\| u_a - eta_(q \, a) \| + h$. The endpoints attaining these coordinate maxima can be chosen independently, so the maximum of the sum of their squares is the sum in (5.21). The conclusions follow from (5.14) and Lemma 44. ◻
]

The routine #raw("corner") adds $10^(- 8)$ after the computed norm to obtain such an upper $t_B$. The multi-box routine #raw("markRec") uses the same geometric fact on entire base boxes. At each coordinate it enlarges $\| b_a w - eta_(q \, a) \| + w \/ 2$ by $10^(- 8)$, accumulates its square, and keeps a branch only while the partial sum is at most $\( rho - 5 dot.op 10^(- 8) \)^2$. After a complete box is marked, the bound used for radius growth is the accumulated norm plus $2 dot.op 10^(- 8)$, or the maximum of these bounds when several boxes are marked. The coordinate inflations make this a true farthest-distance upper, while the gap between $5 dot.op 10^(- 8)$ and $2 dot.op 10^(- 8)$ keeps it below $rho$ after rounding. At $k = 0$ the marked bound is $2 dot.op 10^(- 8)$, also smaller than every usable $rho$. The detailed error comparison is given in Section 9.

In particular, a relation discovered while solving a proper subbox does not justify marking its base box merely because that subbox is covered. A mark is made only after the independent whole-base-box test just described. Integer coordinate ranges and hash neighborhoods only limit which marking or reuse attempts are made. Any unmarked box remains in the ordinary exhaustive traversal.

=== 5.4 Assignments, symmetry maps, and radius growth <assignments-symmetry-maps-and-radius-growth>

Let $tau$ be the common cap on child radii. The atlas stores a list of certified Roots $Q_i$ with current radii $r_i lt.eq tau$. Its centers, tangent columns and certificate constants remain fixed after insertion; only $r_i$ may grow.

For a live box, the program may propose a new center by snapping a matrix near $P + T u$. This is only a method of proposing a Root. It does not assert that $P + T u$ is exact, that snapping converges, or that the tangent coordinates describe a smooth locus. A proposal must pass the independent Root certificate and the parent–child relation test. If $t_B$ is the box’s corner bound, the direct path uses $r = hat(D) \( t_B \) + 2 dot.op 10^(- 8)$ and requires $r < tau - 10^(- 7)$ before assignment.

#thm([Lemma 5.6.])[
  #emph[Suppose a box has been certified into $cal(S) \( Q \, r \)$, with $r < tau$. A signed permutation/transpose map $Phi$ may be used to arrange $Q$. If an existing atlas center $Z$ has a certified aligned distance $ell$ from $Phi Q$, then growing its radius to any certified upper bound for $r + ell$ covers the box, provided that bound is at most $tau$. Alternatively, inserting $Phi Q$ with radius $r$ covers the box. A later failure to construct a reuse relation does not undo either assignment.]
] <refine:atlas-assignment>

#proof[
  For a solution in $cal(S) \( Q \, r \)$, take its horizontal displacement $h$ with $parallel h parallel lt.eq r$. Certificate transport and the commutation $Phi Pi = Pi Phi$ give a horizontal displacement $Phi h$ of the same norm at $Phi Q$. By the definition of aligned distance, there is a horizontal vector $a$ with $parallel a parallel lt.eq ell$ such that $Z + a$ is equivalent to $Phi Q$ by integer phases and rephasings. Therefore $Z + a + Phi h$ is an equivalent exact solution, and $parallel a + Phi h parallel lt.eq ell + r$. This proves the merge claim; the insertion claim is the special case of retaining the transformed center itself. Both are established before any later reuse attempt. ◻
]

The function #raw("assign") implements this triangle argument. For a merge it requires $r + ell + 2 dot.op 10^(- 8) < tau$ and grows the old radius to the maximum of its present value and $r + ell + 10^(- 8)$. These margins are certified in Section 9. If no merge succeeds, it inserts the canonical transformed Root with radius $r$. The returned map is the one used in the successful merge, or the canonical map in the insertion case; no assertion that the search found the nearest atlas center is needed.

For subsequent reuse, #raw("inverseTransform") pulls the selected atlas Root $Z$ back to $Phi^(- 1) Z$. This is a signed permutation of its stored phase and tangent coefficients, with its constants unchanged, as justified by Lemma 31. The pulled-back Root and $Z$ have isometric solution spheres. A fresh relation to $Phi^(- 1) Z$ may therefore grow the radius stored at $Z$. Any integer or rephasing alignment needed for that fresh relation is chosen anew in (5.5). A failure of this optional #raw("addNear") step cannot invalidate the already established direct assignment.

Preloading also permits a map to be applied to the #emph[parent]. This does not change the coordinates labeling its boxes. Indeed, for $V = Phi P$, the transported tangent matrix and displacement satisfy

$ \( Phi T \)^(*) \( Phi delta \) = T^(*) delta = eta . quad "(5.22)" $ <refine:mapped-coordinates>

Thus a relation from the parent Root at $V$ to a stored child or blocker can be used on the same grid indices. The represented matrices change only within their permitted equivalence classes. Trying a limited collection of maps, omitting hash neighbors, or applying an early distance cutoff can only omit possible reuse certificates; none of these operations declares a box covered by itself.

=== 5.5 Successful parents and the blocker induction <successful-parents-and-the-blocker-induction>

A blocker is an earlier input parent whose entire refinement has succeeded. It is queried at its original fixed radius. In contrast, an atlas child is queried directly as a certified-center sphere and its radius is grown when needed. This distinction is important: a child created during an unfinished parent search can already be reused, whereas that unfinished parent cannot be used as a blocker.

#thm([Proposition 5.7.])[
  #emph[Suppose Stage B is run on a finite list of records with valid Root certificates, under the arithmetic assumptions and error bounds of Section 9. On a completed run, let $cal(A)$ be its final atlas of children and let $cal(B)$ be the list of input parents whose refinement failed. Then 
$ union.big_(\( P \, R \) thin upright("input")) cal(S) \( P \, R \) & subset.eq union.big_(\( Q \, r \) in cal(A)) cal(S) \( Q \, r \)\
 & #h(2em) union union.big_(\( P \, R \) in cal(B)) cal(S) \( P \, R \) . quad "(5.23)" $ <refine:cover-inclusion>

 In particular, a completed run with no bad parents replaces the input cover by a child cover. A nonempty bad list remains an obligation.]
] <refine:cover-preservation>

#proof[
  Process the parents in the order used by the program. The induction invariant is that every previously successful parent sphere is covered by the current atlas. It holds before the first parent. Appending children and increasing radii preserve it.
  For the current parent, first consider an individual box in the finite subdivision tree. A successful outside test proves that it contains no parent solution. A successful direct assignment covers all its solutions by Lemmas 45 and 46. A successful relation to a child covers them by that child’s checked radius update. A successful relation to a blocker covers them by the blocker sphere, which is already covered by the atlas by the induction invariant. Finally, success on all children covers the box by (5.20). These are all the successful returns of the cell solver, so induction from the leaves proves its assertion for every successful cell.
  The grid covers every possible tangent vector by (5.17). The traversal can finish successfully only after every base box has been either rejected as outside, marked by a valid whole-box relation, or solved as above. Hence success for the current parent proves coverage of its entire sphere and permits its addition to the blocker list. If the parent fails, it is not added to that list and is retained in $cal(B)$. Any children already produced while attempting it remain valid stored spheres; reusing them does not assume that this failed parent has been covered.
  The invariant therefore holds for every successful parent. Failed parents appear explicitly on the right of (5.23), proving the claimed inclusion. ◻
]

This proof involves two finite inductions: one on subdivision depth and one on the order of completed parents. It does not infer coverage of a parent from children that merely assume coverage of that same parent. Moreover, later radius growth cannot invalidate an earlier certificate, because centers and Root constants are immutable and the corresponding solution sets only enlarge.

=== 5.6 Batch files and finite failure conditions <batch-files-and-finite-failure-conditions>

Batching writes appended atlas Roots in their insertion order, in groups of at most 256. The radius written for each Root is the common cap $tau$, rather than its current achieved radius. If a Root at index $i$ is emitted before the run ends, every later state satisfies

$ r_i lt.eq tau \, #h(2em) cal(S) \( Q_i \, r_i \) subset.eq cal(S) \( Q_i \, tau \) \, quad "(5.24)" $ <refine:batch-containment>

with exactly the same center, tangent columns and certificate constants as in its batch. No future merge changes these data. At successful completion, the final partial batch and the count marker account for every appended index. Consequently replacing the child union in (5.23) by the union of all batch spheres at radius $tau$ is valid.

Each batch is completed under a temporary filename before atomic rename. Downstream computation may read these completed files while Stage B continues, but the final conclusion still requires the complete batch collection and the final Stage B failure checks. The existence of an intermediate batch, or even a count marker without the exit and bad-list checks, is not a certificate that all parents were covered. The exact execution protocol is specified in Section 7.

#thm([Corollary 5.8.])[
  #emph[Under the hypotheses of Proposition 47, suppose a batching invocation completes with no bad parents and every emitted batch is included. Then the input solution sets are covered, up to the permitted equivalences, by the emitted records with their stored target radius $tau$.]
] <refine:batch-cover>

#proof[
  Use (5.23) with the bad union empty, and enlarge each final child sphere according to (5.24). The immutable insertion order and the completed batch collection include each final child center. ◻
]

For clarity, the implementation uses the following finite limits. Input radii satisfy $0 lt.eq R lt.eq 0.126$, the child cap and width satisfy

$ 0.0001 lt.eq tau lt.eq 0.126 \, #h(2em) 0.0001 lt.eq w lt.eq 0.05 \, #h(2em) 0 lt.eq k lt.eq 10 . $

The normal constants are nonnegative and are checked against

$ gamma_P < 20 \, quad mono(n 0)_P \, epsilon_P < 10^(- 6) \, quad alpha_P < 10^(- 4) \, quad o_P \, mono(h o r)_P < 10^(- 5) \, quad mu_P < 2 . $

Stored phase entries have magnitude at most $4$, and stored tangent entries at most $1.01$. These range checks accompany genuine Root certificates; the range checks alone do not establish those certificates. A prospective Root with more than ten tangent columns is rejected, not truncated.

The base grid is limited to $50 \, 000 \, 000$ boxes, subdivision depth is at most six, and the atlas is limited to $2 \, 000 \, 000$ Roots. A single Record file is limited to $2 \, 000 \, 000$ records and the combined input to $8 \, 000 \, 000$. The grid product is checked before multiplication past its limit. Within the admitted ranges one has $L lt.eq 1262$; the mixed-radix indices fit the stated integer types, and every split uses at most $2^10$ children. The integer and floating-point bounds are recorded in Section 9.

Exceeding the grid limit fails the parent. An unresolved cell at the depth limit, or an unresolved cell with $k = 0$, also fails it. Invalid input, impossible radius updates, exhausted atlas capacity and file errors abort the run. An unsuccessful proposal or relation can lead to subdivision or failure, but never directly to a discard. In particular, the clipped alignment tests in #raw("relationB::init") only decline a relation: their chosen cut is at most $0.249$ in the direct-proposal path and at most $0.23$ in ordinary reuse. They are not exclusions of parent solutions.

The invocation parameters used for the three prescribed refinement passes are respectively

$ \( tau \, w \) = \( 0.07 \, 0.013 \) \, #h(2em) \( 0.016 \, 0.005 \) \, #h(2em) \( 0.011 \, 0.0038 \) . $

The second pass uses batching; the third is applied to the records retained by the first exclusion pass. These choices affect whether the finite search succeeds, but not Proposition 47. The proposition is an algorithmic implication and does not assume any claimed run counts, hashes, or generated data. Establishing that its successful-completion hypothesis was met for the required records is a separate execution obligation, addressed in Section 7.

== 6 Excluding two further bases in a phase ball <sec:exclusion>

We now give a local exclusion procedure for a certified Hadamard phase ball. Its conclusion concerns every exact Hadamard in that ball, including its boundary. Theorem 58 combines these local conclusions with the exhaustive cover and the execution checks.

Two further bases would consist of two groups of six vectors, each vector unbiased to the first two bases. Within either group the vectors are pairwise orthogonal; across the groups every pair is unbiased. We first cover all possible individual vectors by small closed balls in their phase coordinates. We will show that the twelve vectors must have distinct covering-ball labels. Necessary pair tests then give two graphs on these labels: an edge is retained whenever the tests do not rule out orthogonality or unbiasedness, respectively. The two bases would require two disjoint orthogonality six-cliques with all $36$ cross edges in the unbiasedness graph. Excluding this pattern in the graphs will therefore exclude the two bases throughout the Hadamard phase ball.

Covering unbiased vectors and testing two compatible sets of six vectors goes back to #cite(label("JamingEtAl2009")) Section 3 and #cite(label("JamingMatolcsiMora2010")) Sections 2–4. In the present cover, the second basis varies throughout a certified phase ball. The pair tests therefore retain its common tangent displacement when combining the two vectors’ constraints.

=== 6.1 The common Hadamard displacement <the-common-hadamard-displacement>

Fix a Record with center $P in bb(R)^(6 times 6)$, radius $0 lt.eq r lt.eq .03$, and real tangent matrix $T in bb(R)^(36 times k)$, where $0 lt.eq k lt.eq 10$. Recall $e \( t \) = exp \( 2 pi i t \)$, and write $A = e \( P \)$ entrywise. The root certificates of Section 4 supply

$ parallel T^(*) T - I parallel lt.eq omega \, #h(2em) parallel F \( P \) parallel lt.eq f_0 < 10^(- 6) \, #h(2em) 0 lt.eq omega < 10^(- 5) \, quad "(6.1)" $ <exclude:root-data>

where

$ F_(i j) \( P \) = frac(1, 2 pi i) sum_g e \( P_(i g) - P_(j g) \) \, #h(2em) i > j . $

For every horizontal $delta$ with $parallel delta parallel lt.eq r$ such that $e \( P + delta \)$ is Hadamard, those certificates also give

$ eta = T^(*) delta \, quad nu = delta - T eta \, #h(2em) parallel eta parallel lt.eq r_H := sqrt(1 + omega) thin r \, #h(2em) parallel nu parallel lt.eq n := n_0 + iota r + Gamma r^2 . quad "(6.2)" $ <exclude:root-decomposition>

Here $omega \, n_0 \, iota \, Gamma$ are respectively the stored certificate constants #raw("ort"), #raw("n0"), #raw("id"), and #raw("C"). The admitted ranges include $0 lt.eq n_0 < 10^(- 6)$, $0 lt.eq iota < 10^(- 4)$, and $0 lt.eq Gamma < 20$. The tangent bound in (6.2) follows already from (6.1); the normal bound is the certified root estimate. In particular, no exact orthonormality of the stored columns of $T$ is assumed.

Throughout this section the first two bases are the coordinate basis and the columns of $e \( P + delta \) \/ sqrt(6)$. If further bases exist, they share this #emph[one] displacement $delta$ and hence this one $eta$. Each vector unbiased to the coordinate basis is of the form $e \( beta \) \/ sqrt(6)$. Its global phase may be chosen so that $beta_0 = 0$, and its other five phases may then be lifted to $\[ 0 \, 1 \]$. Further changes of a vector’s global phase, made independently for different vectors below, do not change the common Hadamard displacement.

The single-vector sums use a uniform operator bound. The identity

$ parallel A A^(*) - 6 I parallel_F = 2 pi sqrt(2) thin parallel F \( P \) parallel $

and (6.1) imply

$ parallel A \/ sqrt(6) parallel_(upright("op")) lt.eq sqrt(1 + frac(2 pi sqrt(2), 6) f_0) < K \, #h(2em) K := 1.00001 . quad "(6.3)" $ <exclude:operator-bound>

=== 6.2 Closed phase bins and single-vector inequalities <closed-phase-bins-and-single-vector-inequalities>

At resolution $M$, the five variable phases are covered by the closed intervals $\[ b \/ M \, \( b + 1 \) \/ M \]$, $0 lt.eq b < M$. The phase $1$ represents the same point as $0$, so this includes every torus boundary. Let $u$ be a bin midpoint, with $u_0 = 0$, and let

$ a = frac(1, 2 M) \, #h(2em) d_0 = 0 \, quad \| d_j \| lt.eq a med \( j > 0 \) \, #h(2em) x = d - 1 / 6 #scale(x: 180%, y: 180%)[\(] sum_j d_j #scale(x: 180%, y: 180%)[\)] upright(bold(1)) . $

Up to global phase the vector in this bin has phases $u + x$.

#thm([Lemma 6.1.])[
  (Bin displacement bounds).  #emph[Every such $x$ satisfies 
$ sum_j x_j = 0 \, #h(2em) parallel x parallel lt.eq X_M := sqrt(29 / 6) thin a \, #h(2em) parallel x parallel_1 lt.eq L_M := 5 a \, #h(2em) parallel x parallel_oo lt.eq I_M := 3 / 2 a . quad "(6.4)" $ <exclude:bin-bounds>

]
] <exclude:bin-geometry>

#proof[
  The squared norm is convex in the five free coordinates, so its maximum is attained at a vertex of their box. There $parallel x parallel^2 = 5 a^2 - \( sum_j d_j \)^2 \/ 6$; the sum of five signs is odd, giving the asserted upper bound. The $ell^1$ norm is likewise convex. With zero, one, or two positive free coordinates, its vertex values are respectively $10 a \/ 6$, $4 a$, and $5 a$; sign reversal covers the remaining cases. Finally, for $j > 0$, the centering map has coefficient $5 \/ 6$ on $d_j$ and coefficient $- 1 \/ 6$ on each of the other four free coordinates, giving $\| x_j \| lt.eq 3 a \/ 2$. Its zeroth coordinate is bounded by $5 a \/ 6$. ◻
]

For a center $u$, index the Hadamard columns by $i$ and vector coordinates by $j$, and define

$ q_(j i) = frac(e \( u_j - P_(j i) \), sqrt(6)) \, #h(2em) S_i = sum_j q_(j i) \, #h(2em) S'_i = sum_j q_(j i) e \( x_j - delta_(j i) \) . quad "(6.5)" $ <exclude:single-sums>

The necessary unbiasedness equations are $\| S'_i \| = 1$ for every $i$. The map $Q w = \( sum_j q_(j i) w_j \)_i$ has the same operator norm as $A \/ sqrt(6)$: conjugation, transposition, and multiplication by diagonal unitaries preserve the relevant norm. Thus (6.3) also bounds $Q$.

#thm([Lemma 6.2.])[
  (Direct displacement tests).  #emph[If $parallel x parallel lt.eq X$, $parallel x parallel_1 lt.eq L$, and $parallel delta parallel lt.eq r$, then 
$ parallel S' - S parallel lt.eq 2 pi \( K X + r \) \, #h(2em) \| S'_i - S_i \| lt.eq 2 pi \( L \/ sqrt(6) + r \) . quad "(6.6)" $ <exclude:sum-change>

 Consequently, with $tau = 2 pi \( L \/ sqrt(6) + r \)$, unbiasedness requires 
$ max { 0 \, 1 - tau }^2 lt.eq \| S_i \|^2 lt.eq \( 1 + tau \)^2 \, #h(2em) sum_i \( \| S_i \| - 1 \)^2 lt.eq \[ 2 pi \( K X + r \) \]^2 . quad "(6.7)" $ <exclude:direct-tests>

]
] <exclude:direct-single>

#proof[
  First perturb the vector phases by $x$ and then the Hadamard phases by $delta$. The first change has norm at most $K parallel \( e \( x_j \) - 1 \)_j parallel lt.eq 2 pi K X$. For the second change, the $i$th component has magnitude at most
  $ frac(2 pi, sqrt(6)) sum_j \| delta_(j i) \| lt.eq 2 pi parallel delta_(: \, i) parallel . $
  Their combined norm is at most $2 pi r$. The first change in a single component is bounded by $2 pi L \/ sqrt(6)$, which proves (6.6). Apply $\| \| S_i \| - \| S'_i \| #scale(x: 120%, y: 120%)[\|] lt.eq \| S_i - S'_i \|$ and use $\| S'_i \| = 1$. ◻
]

For the sharper tests introduce real arrays

$ c_i = frac(\| S_i \|^2 - 1, 4 pi) \, #h(2em) J_(i j) = - "Im" \( overline(S_i) q_(j i) \) \, #h(2em) B_(i k) = sum_j J_(i j) T_(\( j \, i \) \, k) . quad "(6.8)" $ <exclude:single-linearization>

In particular $sum_j J_(i j) = 0$. For $y in bb(R)^6$ put

$ G_y := max_j lr(|sum_i y_i overline(S_i) q_(j i)|) \, #h(2em) N_y := (sum_(i \, j) y_i^2 J_(i j)^2)^(1 \/ 2) . $

The product $S compose y$ denotes componentwise multiplication.

#thm([Lemma 6.3.])[
  (Weighted Taylor estimate).  #emph[Suppose $parallel x parallel lt.eq X$ and $parallel x parallel_oo lt.eq I$. For every $y in bb(R)^6$, the unbiasedness equations imply 
$ \| y dot.op \( c + J x - B eta \) #scale(x: 120%, y: 120%)[\|] lt.eq cal(E) \( y \; X \, I \) \, quad "(6.9)" $ <exclude:weighted-residual>

 where 
$ cal(E) \( y \; X \, I \) :=  & n N_y + pi #scale(x: 180%, y: 180%)[\[] parallel y parallel_oo \( K X + r \)^2 + min { G_y X^2 \, med K parallel S compose y parallel I X }\
 & thin + 2 / sqrt(6) parallel S compose y parallel X r + 1 / sqrt(6) parallel S compose y parallel_oo r^2 #scale(x: 180%, y: 180%)[\]] . quad "(6.10)" $ <exclude:weighted-error>

 For a bin, this gives the necessary support inequality 
$ \| y dot.op c \| lt.eq a sum_(j > 0) \| \( J^(*) y \)_j \| + r_H parallel B^(*) y parallel + cal(E) \( y \; X_M \, I_M \) . quad "(6.11)" $ <exclude:bin-support>

]
] <exclude:weighted-single>

#proof[
  Write $Delta_i = S'_i - S_i$. The expansion of $\( \| S'_i \|^2 - 1 \) \/ \( 4 pi \)$ has constant term $c_i$, linear term $sum_j J_(i j) \( x_j - delta_(j i) \)$, and the squared-increment term $\| Delta_i \|^2 \/ \( 4 pi \)$. After multiplication by $y_i$ and summation, the latter has magnitude at most $pi parallel y parallel_oo \( K X + r \)^2$ by (6.6).
  To bound the remaining exponential remainder, use the exact identity
  $ e \( x_j - delta_(j i) \) - 1 - 2 pi i \( x_j - delta_(j i) \) =  & \[ e \( x_j \) - 1 - 2 pi i x_j \] + \[ e \( - delta_(j i) \) - 1 + 2 pi i delta_(j i) \]\
 & + \( e \( x_j \) - 1 \) \( e \( - delta_(j i) \) - 1 \) . $
  The scalar estimates
  $ \| e \( t \) - 1 \| lt.eq 2 pi \| t \| \, #h(2em) \| e \( t \) - 1 - 2 pi i t \| lt.eq 2 pi^2 t^2 $
  follow by integrating the first and second derivatives along the real segment from $0$ to $t$. Pairing the pure-$x$ remainder with $sum_i y_i overline(S_i) q_(j i)$ and dividing by $2 pi$ gives $pi G_y X^2$. Alternatively, its remainder vector has norm at most $2 pi^2 parallel \( x_j^2 \)_j parallel lt.eq 2 pi^2 I X$; the $Q$ operator bound and Cauchy’s inequality give $pi K parallel S compose y parallel I X$. Both estimates are valid, so their minimum is valid.
  The pure-$delta$ contribution is at most
  $ pi / sqrt(6) sum_i \| y_i S_i \| sum_j delta_(j i)^2 lt.eq pi / sqrt(6) parallel S compose y parallel_oo r^2 . $
  The product contribution is at most
  $ frac(2 pi, sqrt(6)) sum_i \| y_i S_i \| sum_j \| x_j delta_(j i) \| & lt.eq frac(2 pi, sqrt(6)) X sum_i \| y_i S_i \| thin parallel delta_(: \, i) parallel\
 & lt.eq frac(2 pi, sqrt(6)) parallel S compose y parallel X r . $
  Finally, $delta = T eta + nu$ replaces each linear Hadamard sum $sum_j J_(i j) delta_(j i)$ by $\( B eta \)_i$, with weighted error at most $n N_y$. These estimates prove (6.9). For a bin, $J x = J d$ because every row of $J$ sums to zero. Its box support is $a sum_(j > 0) \| \( J^(*) y \)_j \|$, and $parallel eta parallel lt.eq r_H$ supplies the tangent support in (6.11). ◻
]

There is also a useful scalar test before the tangent decomposition. Set $S_max = max_i \| S_i \|$, and for a bin write $X = X_M$, $L = L_M$, $I = I_M$. Unbiasedness requires

$ \| c_i \| lt.eq a sum_(j > 0) \| J_(i j) \| + r parallel J_(i \, :) parallel + rho \, quad "(6.12)" $ <exclude:scalar-linear>

where

$ rho = min { & pi #scale(x: 120%, y: 120%)[\[] \( K X + r \)^2 + S_max #scale(x: 120%, y: 120%)[\(] K I X + \( 2 X r + r^2 \) \/ sqrt(6) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\]] \,\
 & pi #scale(x: 120%, y: 120%)[\[] \( L \/ sqrt(6) + r \)^2 + S_max \( X + r \)^2 \/ sqrt(6) #scale(x: 120%, y: 120%)[\]] #scale(x: 180%, y: 180%)[}] . quad "(6.13)" $ <exclude:scalar-remainder>

The first remainder bound follows from the proof of Lemma 51 with a coordinate direction and without decomposing $delta$. For the second, use the scalar increment bound in (6.6) and apply the second-order exponential bound directly to $x - delta_(: \, i)$, whose norm is at most $X + r$. The full Hadamard linear term is supported by $r parallel J_(i \, :) parallel$, so no normal-error term is added in (6.12).

The routine #raw("Layer::test") applies (6.7), (6.12), and then (6.11) for proposed directions $y$. In the last test it forms $J^(*) y$ and the real companion sums $sum_i y_i "Re" \( overline(S_i) q_(j i) \)$. The Euclidean norm of this pair of real sums is exactly the coefficient magnitude defining $G_y$. Directions may be proposed by an inexact linear solve: the inequality holds for every real $y$, so the proposal method is immaterial. The implementation checks that its proposal is finite with maximum absolute entry strictly between $10^(- 100)$ and $10^100$, then normalizes by that maximum. The resulting stored coefficients themselves are the test direction.

=== 6.3 From bins to closed vector balls <from-bins-to-closed-vector-balls>

The initial resolution is $M = 12$. Every bin is tested, and every retained bin is split into all $2^5 = 32$ children at each doubling $12 arrow.r 24 arrow.r 48 arrow.r 96$. On one coordinate the child indices are $2 b$ and $2 b + 1$, whose closed intervals cover the parent interval exactly. An actual vector therefore follows at least one surviving bin path, including when a phase lies on a bin or torus boundary. Exceeding the cap of $2 \, 000 \, 000$ retained bins is an unresolved outcome, never an exclusion.

For $v in bb(R)^6$ and $s gt.eq 0$, define the closed vector ball

$ cal(B)_(upright("vec")) \( v \, s \) = {frac(lambda e \( v + x \), sqrt(6)) : \| lambda \| = 1 \, med x in bb(R)^6 \, med sum_j x_j = 0 \, med parallel x parallel lt.eq s} . quad "(6.14)" $ <exclude:vector-ball>

The retained final bins are compressed into balls of this form. The required covering property does not depend on the quality of the clustering heuristic.

#thm([Lemma 6.4.])[
  (Certified clustering).  #emph[Suppose each retained bin midpoint $u$ is assigned to a center $v$ and an integer vector $m in bb(Z)^6$. Let 
$ h = u - v - m - 1 / 6 #scale(x: 180%, y: 180%)[\(] sum_j \( u_j - v_j - m_j \) #scale(x: 180%, y: 180%)[\)] upright(bold(1)) . $

 If the assigned radius is at least $parallel h parallel + X_M$, then $cal(B)_(upright("vec")) \( v \, s \)$ covers the whole bin up to global phase. The final assignment in #raw("cluster") has this property.]
] <exclude:cluster-cover>

#proof[
  For any raw displacement $d$ in the bin, subtracting its mean gives $x$ as in Lemma 49. With the assigned integers fixed, the phase difference from $v$ is $h + x$ up to an integer vector and a scalar phase. It has zero mean and norm at most $parallel h parallel + X_M$. This proves the covering assertion also on every boundary.
  In each assignment iteration the routine computes coordinatewise integer wraps of $u - v$, then subtracts their mean. A candidate rejected by its distance cutoff is simply not used; the bin is assigned to another center or to a newly inserted midpoint center. Thus no bin is dropped by the heuristic. For each assigned center its radius is updated to the maximum of the computed projected midpoint distance plus the bin-norm upper bound and $10^(- 9)$. This is an outward upper bound as certified in Section 9. New midpoint centers use midpoint distance zero, with the same allowance.
  The earlier Lloyd iterations adapt the nearest-center/centroid heuristic of #cite(label("Lloyd1982")) Sections IV–VI. They may move centers, but a subsequent complete assignment follows each such movement. In the last iteration the assigned centers are not moved. Deleting centers with no assigned bins cannot lose coverage. The returned centers and radii therefore meet the covering assertion. An attempt to exceed $2048$ centers, or a failure of the final checks $\| v_j \| lt.eq 2$ and $0 lt.eq s < .1$, is unresolved rather than negative. ◻
]

For the specified invocation, the heuristic radius parameter is $.042$ and there are two assignment iterations. With $w = 1 \/ M$ the candidate threshold is $\( .042 - 1.11 w \)^2$, and the coordinate cutoff is the square root of twice that threshold plus $10^(- 10)$. These constants affect only the choice of assignments; the proof is the final radius update in Lemma 52. In particular it does not assume that the selected wrapped lift minimizes torus distance.

#thm([Lemma 6.5.])[
  (Distinct labels).  #emph[Two vectors in the same ball $cal(B)_(upright("vec")) \( v \, s \)$ with $s < .1$ are neither orthogonal nor mutually unbiased. Hence the twelve vectors in two further mutually unbiased orthonormal bases must occupy twelve distinct retained balls.]
] <exclude:distinct-labels>

#proof[
  After removing global phases, their unscaled inner-product sum has the form $sum_j e \( z_j \)$ with $parallel z parallel lt.eq 2 s < .2$. Therefore
  $ lr(|sum_j e \( z_j \)|) gt.eq 6 - sum_j \| e \( z_j \) - 1 \| gt.eq 6 - 2 pi sqrt(6) thin parallel z parallel > 6 - 2 / 5 pi sqrt(6) > 20 / 7 > sqrt(6) . $
  The last estimates use $pi < 22 \/ 7$ and $sqrt(6) < 5 \/ 2$. Orthogonality requires the unscaled magnitude to be zero, and unbiasedness requires it to be $sqrt(6)$. Every pair among the twelve vectors has one of these two relations, so no pair can share its assigned ball. ◻
]

=== 6.4 Necessary edge tests <necessary-edge-tests>

Take two distinct balls with centers $u \, v$ and radii $s_u \, s_v < .1$. For actual representatives with displacements $x_u \, x_v$ as in (6.14), set

$ Q_j = e \( u_j - v_j \) \, quad S = sum_j Q_j \, quad z = x_u - x_v \, quad r_e = s_u + s_v \, #h(2em) parallel z parallel lt.eq r_e . quad "(6.15)" $ <exclude:edge-data>

The actual unscaled inner product is, up to conjugation and global phase, $S' = sum_j Q_j e \( z_j \)$. Since $\| S' - S \| lt.eq 2 pi sqrt(6) thin r_e$, necessary direct tests for orthogonality ($cal(O)$) and unbiasedness ($cal(U)$) are

$ frac(\| S \|, 2 pi sqrt(6)) lt.eq r_e quad \( cal(O) \) \, #h(2em) frac(\| \| S \| \/ sqrt(6) - 1 #scale(x: 120%, y: 120%)[\|], 2 pi) lt.eq r_e quad \( cal(U) \) . quad "(6.16)" $ <exclude:edge-distance>

Define the real matrix $D_(cal(O)) in bb(R)^(2 times 6)$ and the row $D_(cal(U)) in bb(R)^(1 times 6)$ by

$ \( D_(cal(O)) \)_(: \, j) = vec(- "Im" Q_j, "Re" Q_j) \, #h(2em) \( D_(cal(U)) \)_j = frac("Re" S thin \( D_(cal(O)) \)_(1 j) + "Im" S thin \( D_(cal(O)) \)_(2 j), 6) . quad "(6.17)" $ <exclude:edge-derivatives>

#thm([Lemma 6.6.])[
  (Edge Taylor equations).  #emph[For the indicated relation, the following necessary residual bound holds: 
$ parallel q_(cal(O)) + D_(cal(O)) z parallel & lt.eq E_(cal(O)) := pi r_e^2 \, & q_(cal(O)) & = frac(\( "Re" S \, "Im" S \)^(*), 2 pi) \,\
\| q_(cal(U)) + D_(cal(U)) z \| & lt.eq E_(cal(U)) := pi r_e^2 \( 1 + \| S \| \/ 6 \) \, & q_(cal(U)) & = frac(\| S \|^2 \/ 6 - 1, 4 pi) . quad "(6.18)" $ <exclude:orth-residual>

 Consequently the direct support tests 
$ frac(\| S \|^2, 2 pi) & lt.eq 6 r_e parallel D_(cal(U)) parallel + E_(cal(O)) \| S \| \,\
\| q_(cal(U)) \| & lt.eq r_e parallel D_(cal(U)) parallel + E_(cal(U)) quad "(6.19)" $ <exclude:orth-support>

 are necessary as well.]
] <exclude:edge-taylor>

#proof[
  The exponential remainder $R = S' - S - 2 pi i sum_j Q_j z_j$ has magnitude at most $2 pi^2 parallel z parallel^2 lt.eq 2 pi^2 r_e^2$. When $S' = 0$, division by $2 pi$ in real coordinates gives (6.18). Dot this equation with $\( "Re" S \, "Im" S \)$; the resulting derivative row is $6 D_(cal(U))$, proving (6.19).
  For unbiasedness expand $\( \| S' \|^2 \/ 6 - 1 \) \/ \( 4 pi \)$. Its constant and linear terms are $q_(cal(U))$ and $D_(cal(U)) z$. Pairing $R$ with $S$ contributes at most $2 \| S \| \| R \| \/ \( 24 pi \) lt.eq pi \| S \| r_e^2 \/ 6$. The squared-increment term contributes at most $\| S' - S \|^2 \/ \( 24 pi \) lt.eq pi r_e^2$. This proves (6.18); supporting its linear term over $parallel z parallel lt.eq r_e$ gives (6.19). ◻
]

=== 6.5 The joint test with one tangent variable <the-joint-test-with-one-tangent-variable>

For each ball $t = 0 \, 1$, form $c^t \, J^t \, B^t \, S^t$ from (6.5) and (6.8) at its actual center. Write its radius as $s_t$ and let

$ cal(E)_t^(upright("ball")) \( y \) :=  & n (sum_(i \, j) y_i^2 \( J_(i j)^t \)^2)^(1 \/ 2)\
 & + pi #scale(x: 300%, y: 300%)[\[] parallel y parallel_oo \( K s_t + r \)^2 + s_t^2 max_j lr(|sum_i y_i overline(S_i^t) q_(j i)^t|) + 2 / sqrt(6) parallel S^t compose y parallel s_t r + 1 / sqrt(6) parallel S^t compose y parallel_oo r^2 #scale(x: 300%, y: 300%)[\]] . quad "(6.20)" $ <exclude:ball-error>

This is the estimate proved in Lemma 51, using $X = s_t$ and only the first pure-$x$ remainder bound. In particular, it is valid on the whole closed Euclidean vector ball.

For an edge type $E in { cal(O) \, cal(U) }$, write $ell = 2$ or $1$, respectively, and use $D_E \, q_E \, E_E$ from Lemma 54.

#thm([Lemma 6.7.])[
  (Joint necessary support).  #emph[Suppose one vector from each of the two balls is unbiased to the coordinate basis and to the #emph[same] second basis, whose matrix is $e \( P + delta \) \/ sqrt(6)$, and the pair has relation $E$. For every $y_0 \, y_1 in bb(R)^6$ and $y_e in bb(R)^ell$, 
$ & \| y_0 dot.op c^0 + y_1 dot.op c^1 + y_e dot.op q_E #scale(x: 120%, y: 120%)[\|]\
 & quad lt.eq sum_(t = 0)^1 [s_t parallel \( J^t \)^(*) y_t + \( - 1 \)^t D_E^(*) y_e #scale(x: 120%, y: 120%)[parallel] + cal(E)_t^(upright("ball")) \( y_t \)] + r_H parallel \( B^0 \)^(*) y_0 + \( B^1 \)^(*) y_1 #scale(x: 120%, y: 120%)[parallel] + E_E parallel y_e parallel . quad "(6.21)" $ <exclude:joint-inequality>

]
] <exclude:joint-support>

#proof[
  For each single vector the linearized equation is $c^t + J^t x_t - B^t eta$ with weighted residual bounded by $cal(E)_t^(upright("ball")) \( y_t \)$. The edge equation is $q_E + D_E \( x_0 - x_1 \)$ with residual norm at most $E_E$. Multiply these three equations by their directions and add. The coefficients of $x_0 \, x_1$ are respectively $\( J^0 \)^(*) y_0 + D_E^(*) y_e$ and $\( J^1 \)^(*) y_1 - D_E^(*) y_e$. Their supports over the displacement balls give the first two norm terms in (6.21). Because the Hadamard is common, the coefficient of its single tangent variable is $- \( B^0 \)^(*) y_0 - \( B^1 \)^(*) y_1$; supporting it over $parallel eta parallel lt.eq r_H$ gives the displayed shared tangent term. The remaining terms follow by the triangle inequality and Cauchy’s inequality. Bounding the two normal remainders separately is safe even though they originate in the same $nu$. ◻
]

This is the comparison implemented by #raw("graph::joint"). It first calls #raw("single::support") with a zero vector-displacement coefficient array for each ball, and only afterwards adds the edge derivatives. Thus the maximum coefficient in (6.20) is formed from the pure single-vector remainder; it cannot be decreased by cancellation with an edge coefficient. The tangent coefficient array, in contrast, is shared and accumulates both $- \( B^t \)^(*) y_t$ contributions before its norm is taken. As with the single-vector test, the linear solve and its weights only propose normalized directions; validity depends solely on (6.21) for the proposed direction.

The inequalities just proved are necessary in exact real arithmetic. In the implementation, each rejection is a strict violation of an outward-enlarged bound; equalities and unresolved comparisons retain the candidate. Sections 9.10 and 9.11 certify these comparisons, whose margins are listed in Section 6.7 below. Thus every genuine pair retains its required relation when the tests are evaluated numerically.

=== 6.6 Exact graph exclusion <exact-graph-exclusion>

Make one vertex for each retained ball. Join two distinct vertices by an $cal(O)$ edge if their orthogonality type has not been excluded by its direct and joint tests. Define $cal(U)$ edges similarly for unbiasedness. Both graphs are undirected and have no self-loops. Every genuine pair retains its corresponding edge by the preceding lemmas. Extra edges are harmless: retained pairwise possibilities need not have a simultaneous realization.

By Lemmas 52 and 53, two additional mutually unbiased orthonormal bases would give disjoint vertex sets $A \, B$ satisfying

$ \| A \| = \| B \| = 6 \, #h(2em) A \, B upright(" are ") cal(O) upright("-cliques") \, #h(2em) A times B subset.eq E \( cal(U) \) . quad "(6.22)" $ <exclude:graph-configuration>

The following finite search tests this necessary configuration.

Figure 2 displays the required pattern. Every edge means that its necessary tests survived; the search asks whether even these permissive graphs contain the pattern.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-2.468, 1.155), (2.468, 1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, 1.155), (1.467, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, 1.155), (1.467, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, 1.155), (2.468, -1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, 1.155), (3.468, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, 1.155), (3.468, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, 0.5775), (2.468, 1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, 0.5775), (1.467, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, 0.5775), (1.467, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, 0.5775), (2.468, -1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, 0.5775), (3.468, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, 0.5775), (3.468, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, -0.5775), (2.468, 1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, -0.5775), (1.467, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, -0.5775), (1.467, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, -0.5775), (2.468, -1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, -0.5775), (3.468, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-3.468, -0.5775), (3.468, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, -1.155), (2.468, 1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, -1.155), (1.467, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, -1.155), (1.467, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, -1.155), (2.468, -1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, -1.155), (3.468, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, -1.155), (3.468, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, -0.5775), (2.468, 1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, -0.5775), (1.467, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, -0.5775), (1.467, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, -0.5775), (2.468, -1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, -0.5775), (3.468, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, -0.5775), (3.468, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, 0.5775), (2.468, 1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, 0.5775), (1.467, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, 0.5775), (1.467, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, 0.5775), (2.468, -1.155), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, 0.5775), (3.468, -0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-1.467, 0.5775), (3.468, 0.5775), stroke: (paint: rgb("#ffc68c"), thickness: 0.3pt))
  line((-2.468, 1.155), (-3.468, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((2.468, 1.155), (1.467, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-2.468, 1.155), (-3.468, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((2.468, 1.155), (1.467, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-2.468, 1.155), (-2.468, -1.155), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((2.468, 1.155), (2.468, -1.155), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-2.468, 1.155), (-1.467, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((2.468, 1.155), (3.468, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-2.468, 1.155), (-1.467, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((2.468, 1.155), (3.468, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-3.468, 0.5775), (-3.468, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((1.467, 0.5775), (1.467, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-3.468, 0.5775), (-2.468, -1.155), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((1.467, 0.5775), (2.468, -1.155), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-3.468, 0.5775), (-1.467, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((1.467, 0.5775), (3.468, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-3.468, 0.5775), (-1.467, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((1.467, 0.5775), (3.468, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-3.468, -0.5775), (-2.468, -1.155), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((1.467, -0.5775), (2.468, -1.155), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-3.468, -0.5775), (-1.467, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((1.467, -0.5775), (3.468, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-3.468, -0.5775), (-1.467, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((1.467, -0.5775), (3.468, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-2.468, -1.155), (-1.467, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((2.468, -1.155), (3.468, -0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-2.468, -1.155), (-1.467, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((2.468, -1.155), (3.468, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((-1.467, -0.5775), (-1.467, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  line((3.468, -0.5775), (3.468, 0.5775), stroke: (paint: rgb("#0000a6"), thickness: 0.6pt))
  content((-2.718, 0.905), (-2.218, 1.405), [#text(size: 7pt)[$a_0$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((2.218, 0.905), (2.718, 1.405), [#text(size: 7pt)[$b_0$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((-3.718, 0.3275), (-3.218, 0.8275), [#text(size: 7pt)[$a_1$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((1.217, 0.3275), (1.717, 0.8275), [#text(size: 7pt)[$b_1$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((-3.718, -0.8275), (-3.218, -0.3275), [#text(size: 7pt)[$a_2$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((1.217, -0.8275), (1.717, -0.3275), [#text(size: 7pt)[$b_2$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((-2.718, -1.405), (-2.218, -0.905), [#text(size: 7pt)[$a_3$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((2.218, -1.405), (2.718, -0.905), [#text(size: 7pt)[$b_3$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((-1.717, -0.8275), (-1.217, -0.3275), [#text(size: 7pt)[$a_4$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((3.218, -0.8275), (3.718, -0.3275), [#text(size: 7pt)[$b_4$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((-1.717, 0.3275), (-1.217, 0.8275), [#text(size: 7pt)[$a_5$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((3.218, 0.3275), (3.718, 0.8275), [#text(size: 7pt)[$b_5$]], frame: "circle", fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6")))
  content((-2.468, -1.68), [#text(size: 9pt)[$A$: six-clique in $cal(O)$]])
  content((2.468, -1.68), [#text(size: 9pt)[$B$: six-clique in $cal(O)$]])
  content((0, 1.943), [#text(size: 9pt)[All $36$ cross edges in $cal(U)$]])
})],
  caption: [Figure 2: Two further mutually unbiased bases would require twelve distinct vector-ball labels: six pairwise orthogonality-compatible labels in each set, with every cross pair unbiasedness-compatible. The graphs retain all necessary edges. A completed search excluding this pattern therefore excludes the two bases throughout the phase ball. ],
) <fig:two-cliques>

#thm([Lemma 6.8.])[
  (Complete graph search).  #emph[The mode-$1$ search of #raw("graph::exist"), started with both pools equal to the full vertex set and first-clique target size six, returns false only if (6.22) is impossible. A work-cap exhaustion never gives a negative certificate.]
] <exclude:graph-search>

#proof[
  First consider #raw("clique") on a candidate set $P$ and target size $m$. For $m = 0$ it succeeds, and for $m = 1$ it tests nonemptiness. For $m gt.eq 2$, it repeatedly selects the least remaining vertex $i$, removes it from $P$, and searches $P ∩ N_(cal(O)) \( i \)$ for an $\( m - 1 \)$-clique. For $m = 2$ that search is just nonemptiness. Every clique has a unique least vertex, so this enumerates every possibility. Terminating when fewer than $m$ candidates remain is also exact.
  Now suppose that $A \, B$ satisfy (6.22). Interchange their names if necessary so that $a = min \( A union B \)$ belongs to $A$. At the root, #raw("exist") tries possible least vertices of the first clique in increasing order. It deletes each tried root vertex from both its local first pool and its second pool. Thus when $a$ is selected, every required remaining vertex in $A union B$ is still available. This root deletion imposes only the chosen convention that the minimum of the union lies in the first clique. It is performed only when the remaining first-clique target is six, and therefore not in any recursive call.
  After an increasing prefix $S subset.eq A$ has been selected, with $1 lt.eq \| S \| lt.eq 5$, the recursive first pool is the set of vertices larger than $max S$ that are $cal(O)$-adjacent to every vertex of $S$. The second pool is the set of vertices larger than $a$ that are $cal(U)$-adjacent to every vertex of $S$. Selecting the next vertex $i$ intersects the remaining first pool with $N_(cal(O)) \( i \)$ and the second pool with $N_(cal(U)) \( i \)$. In the branch selecting the next member of $A$, these pools still contain the required remaining members of $A$ and all of $B$, respectively. The lack of $cal(U)$ self-loops also removes every selected first-clique vertex from the second pool.
  A first-pool cardinality check cannot reject a pool containing the needed remaining vertices. A second-pool cardinality check cannot reject a pool containing $B$. The mode-$1$ prune runs the exact auxiliary six-clique test on the second pool: it too must succeed if $B$ is present, and later intersections can only shrink that pool. On selection of the sixth first-clique vertex, an auxiliary six-clique test of the resulting second pool is exactly the remaining requirement. Hence a complete branch survives for every configuration (6.22).
  Finally, all recursive tests interpret exhaustion of the work budget as possibility and set a persistent give-up flag. The public #raw("candidate") result is the logical disjunction of its search result and this flag. A negative result therefore requires both an exhausted combinatorial search with no configuration and an unset give-up flag; hitting the cap cannot certify exclusion. ◻
]

The graph has at most $2048$ vertices and is represented by $32$ unsigned 64-bit words per adjacency set. Only valid vertex indices are inserted, all unused bits are zero, and intersections and cardinalities are exact integer operations. A least-set-bit operation is called only on a nonempty set. Thus the finite-set operations in the preceding proof are the operations performed by the code. The specified search uses mode $1$ and a cap of $5 \, 000 \, 000$ steps.

#thm([Proposition 6.9.])[
  (Local exclusion certificate).  #emph[Assume the root certificate (6.1)–(6.2) and the arithmetic guarantees of Section 9. If Stage C returns a negative result for the Record, then no exact Hadamard $e \( P + delta \)$ in its closed horizontal radius-$r$ ball can be extended, together with the coordinate basis, by two further mutually unbiased orthonormal bases.]
] <exclude:local-certificate>

#proof[
  Every additional vector belongs to a bin at the initial resolution. The necessary tests retain a bin path containing it at all four resolutions. If the retained set becomes empty, no such vector exists. Otherwise a successful clustering covers all retained bins by closed balls. Two additional bases would give twelve distinct ball labels with every required edge retained, hence a configuration (6.22). A completed negative graph search excludes that configuration by Lemma 56. Overflow, clustering failure, a surviving graph possibility, and work-cap exhaustion are all unresolved outcomes and are never reported as negative. These are exactly the two successful negative paths of #raw("negative"): an empty completed bin layer, or a completed negative graph search. ◻
]

=== 6.7 Conservative arithmetic and invocation <exclude:implementation>

We finish by specifying the outward replacements and comparison margins that connect the necessary inequalities to the implemented certificate. Their arithmetic justification is in Sections 9.10 and 9.11.

For a bin the source forms its halfwidth with a $10^(- 12)$ increase, then increases each of $X_M \, L_M \, I_M$ by a further $10^(- 12)$ after the indicated multiplication. The stored tangent and normal bounds are formed as

$ hat(r)_H = sqrt(1 + omega) thin r + 10^(- 9) \, #h(2em) hat(n) = n_0 + iota r + Gamma r^2 + 10^(- 9) . $

The upper scalar squared-magnitude threshold in (6.7) is increased by $2 dot.op 10^(- 7)$, and its lower threshold, when $tau < 1$, is decreased by that amount. The combined squared-distance threshold, the right side of (6.12), and the right side of (6.11) each receive a $2 dot.op 10^(- 7)$ comparison allowance.

For a pair, the radius sum is increased by $10^(- 10)$. The distance tests (6.16) permit a further $2 dot.op 10^(- 7)$ on that radius. Both edge residual bounds $E_(cal(O))$ and $E_(cal(U))$ are increased by $2 dot.op 10^(- 8)$; the direct comparisons (6.19) and (6.19) receive another $2 dot.op 10^(- 7)$. The right side of the joint comparison (6.21) receives $3 dot.op 10^(- 7)$. Cluster assignment radii include the $10^(- 9)$ allowance already described in Lemma 52.

The bounds $\| P_(i j) \| lt.eq 4$ and $\| v_j \| lt.eq 2$ keep all trigonometric arguments used here within the guarded range of #raw("expair"). The proof of Section 9 includes the errors in these arguments, in $q \, S \, c \, J \, B$, in the short weighted sums and norms, and in the positive support expressions. Inexact solution of the proposal systems supplies no separate assumption.

For clarity, the invocation parameters used for this certificate are #raw("12 4 1 .042 1 1 5000000"): initial resolution $12$, four bin layers, one proposed bin direction, clustering parameter $.042$, one proposed joint direction, graph mode $1$, and the stated graph work cap. The two Lloyd iterations are the fixed default. The conclusion of Proposition 57 is conditional on a completed negative result for the individual Record; no collection of unexecuted tests is itself such a result.

== 7 Finite execution and the recorded certificate <sec:execution>

The computation used below was completed on 4 October 2026 (UTC). This section specifies its finite inputs, the tests for complete execution, and the implication from those tests to nonexistence. The geometric and arithmetic justification of each rejection is given in Sections 2–6 and Appendix 9. A successful exit by itself is not the certificate: the inputs, record counts, saved failures, and coverage of all shards must agree as described here.

=== 7.1 Programs, records, and machine arithmetic <execute:programs>

The accompanying #raw("verification/code/") directory contains the seven unchanged source files #raw("seed.cpp"), #raw("covout.cpp"), #raw("ub.cpp"), #raw("patchx.cpp"), #raw("atlas.cpp"), #raw("stageB.cpp"), and #raw("stageC.cpp"). Their byte lengths and full SHA-256 digests are listed in #raw("verification/code/extraction.json"). The source hashes were checked before the recorded run, and the packaged copies match those same bytes. Only four translation units are built as entry points:

table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Executable
], table.cell(rowspan: 1, colspan: 1)[Translation unit
], table.cell(rowspan: 1, colspan: 1)[Role
]),
  table.cell(rowspan: 1, colspan: 1)[#raw("covrun")
], table.cell(rowspan: 1, colspan: 1)[#raw("covout.cpp")
], table.cell(rowspan: 1, colspan: 1)[Nine-phase seed cover
],
  table.cell(rowspan: 1, colspan: 1)[#raw("arun")
], table.cell(rowspan: 1, colspan: 1)[#raw("atlas.cpp")
], table.cell(rowspan: 1, colspan: 1)[Completion search and coarse atlas
],
  table.cell(rowspan: 1, colspan: 1)[#raw("brun")
], table.cell(rowspan: 1, colspan: 1)[#raw("stageB.cpp")
], table.cell(rowspan: 1, colspan: 1)[Certified refinement
],
  table.cell(rowspan: 1, colspan: 1)[#raw("crun")
], table.cell(rowspan: 1, colspan: 1)[#raw("stageC.cpp")
], table.cell(rowspan: 1, colspan: 1)[Vector cover and graph exclusion
],
)

The other files are included through the macros in these translation units. Their standalone sample drivers are not executed. In particular, A uses #raw("Asearch"), and C uses graph search mode 1.

A serialized #raw("Record") contains a certified #raw("Root") and a radius $r$. Its interpretation is the set of exact Hadamard solutions represented, up to the equivalences of Section 2, by $e \( p + h \)$ with horizontal $h$ and $parallel h parallel lt.eq r$. The stored $p$ need not itself be an exact solution. The Root data justify the normal-displacement inequalities on this set; their construction is part of Section 4.

The binary format is explicit. A file begins with an eight-byte unsigned record count. Each record consists, in order, of a four-byte signed integer $k$, 36 binary64 entries of $p$, $k$ rows of 36 binary64 entries of $T$, and the eight binary64 values

$ C \, med n_0 \, med upright("id") \, med upright("ort") \, med upright("hor") \, med upright("mnorm") \, med upright("froot") \, med r . $

Thus a record occupies $356 + 288 k$ bytes, and a valid zero-count file is exactly eight bytes. The platform is little endian. No phase data are converted to decimal between stages. The evidence checks parse every record, validate finite bounded fields, and require the declared count to reach the exact end of file. They also check that every saved C failure is an unchanged, ordered subsequence of its assigned inputs.

The recorded platform was x86-64, Intel Xeon Platinum 8573C, Ubuntu GCC 13.3.0, and glibc 2.39. The builds, prepared on the same UTC date before the run, were

#raw(block: true, lang: "", "g++ -O3 -march=native -ffp-contract=off covout.cpp -o covrun\ng++ -std=gnu++17 -O3 -march=native -ffp-contract=off atlas.cpp -o arun\ng++ -std=gnu++17 -O3 -march=native -ffp-contract=off stageB.cpp -o brun\ng++ -std=gnu++17 -O3 -march=native -ffp-contract=off stageC.cpp -o crun")

The first command used this compiler’s default GNU C++17 dialect. The arithmetic assumptions are binary64, round to nearest, separate operations without contraction or fast-math reassociation, correctly rounded binary64 square root, masked floating-point exceptions, and neither flush-to-zero nor denormals-are-zero. Separate probes compiled with the cover and A/B/C flag sets both passed and recorded #raw("FLT_EVAL_METHOD=0"), 32-bit #raw("int"), 64-bit #raw("size_t"), 64-bit #raw("uint64_t") equal to #raw("unsigned long"), eight-bit bytes, and MXCSR #raw("0x1f80"). Both probes recorded nearest rounding on entry and during the check, and passed the square-root and gradual-underflow samples. These probes and the program checks provide limited evidence for the stated platform conditions, not a proof of all primitive-operation or compiler semantics. Those semantics remain assumptions; Appendix 9 supplies the numerical bounds under them. The retained #raw("build/build-manifest.json") identifies the exact sources, binaries, compiler commands, probe outputs, and arithmetic evidence.

One additional code-generation condition is needed by #raw("coverSeeds::run"): both #raw("pow(…,2)") expressions must be lowered to the binary64 multiplications analyzed in Appendix 9. For the actual #raw("covrun"), inspection of the saved disassembly finds the scale multiplication, its square, subtraction, square root, addition, and second square at hexadecimal addresses #raw("6035"), #raw("6039"), #raw("603d"), #raw("605c"), #raw("606d"), and #raw("608b"), respectively. There is no dynamic #raw("pow") symbol. Absence of that symbol alone would not establish the required instruction sequence. The recorded binary is identified by its full SHA-256 digest, so this check applies to that build. The specified lowerings address only this code-generation condition, not the full arithmetic model itself. A new build requires this check again. Its binary hash, like any native build hash, need not equal that of the recorded binary.

=== 7.2 Specified finite control flow <execute:control>

All invocations use the C numeric locale and fresh output paths. The cover is run to normal completion before A reads its output. A uses all four parts $i = 0 \, 1 \, 2 \, 3$ with #raw("parts=4"); part $i$ processes exactly the center indices congruent to $i$ modulo 4. Its constants are seed radius #raw(".0320001"), local target #raw(".103"), global target #raw(".125"), #raw("levels=3"), #raw("iters=2"), and #raw("first=1").

The following are the program invocations, with $i$ and $j$ standing for the indicated shard and batch indices. The accompanying #raw("verification/code/proof_run.py") runner was used in this execution and performs the validation between stages; this display only specifies the program arguments. A separate bounded supervisor retained the runner’s exit and process-cleanup record.

#raw(block: true, lang: "", "export LC_ALL=C\n./covrun centers.txt\n./arun centers.txt i 4 coarsei.bin badi.txt\n./brun .07 .013 mid.bin midbad.bin - \\\n  coarse0.bin coarse1.bin coarse2.bin coarse3.bin\n./brun .016 .005 fine.bin finebad.bin batches/f mid.bin\n./crun 12 4 1 .042 1 1 5000000 0 1 \\\n  batches/badj.bin batches/fj.bin\n./brun .011 .0038 fb1.bin fb1bad.bin - ALL_NONEMPTY_C_BAD_FILES\n./crun 12 4 1 .042 1 1 5000000 i 4 fb1cbadi.bin fb1.bin")

There is one initial C invocation for every batch named by the completed #raw("batches/fdone.txt") marker. In C the first seven parameters mean initial grid $12$, four layers, one linear-support iteration, proposed cluster radius $.042$, detail 1, graph mode 1, and graph-step cap $5 \, 000 \, 000$. Thus the single-vector grids are $12 \, 24 \, 48 \, 96$. The unchanged default number of clustering passes is two.

The mid and fine B invocations are sequential. A batching B invocation writes consecutive groups of at most 256 atlas records, replacing each batch radius by its target $.016$, and atomically renames each completed batch. The checked concatenation of all batch records equals #raw("fine.bin"), except for that radius replacement. Every original fine radius is at most $.016$, so the replacement enlarges the represented sets. The completion marker agrees with both the number of batches and the sum of their record counts. The recorded run waited for B fine to finish before starting C; it used up to sixteen independent C workers. Concurrency changes scheduling only: workers have distinct output files and do not share mutable search state.

For every initial C process, the normal status is 0 exactly when its saved bad count is zero, and 1 exactly when that count is positive. The four reported failure categories—uncapped graph candidate, graph-step cap, bin overflow, and clustering failure—sum to that bad count. None of them is an exclusion. Every nonempty-count bad file is passed to B fallback in C-locale filename order, including failures whose locations differ from those in another run. Final C uses all four modulo-4 parts of the fallback output. If initial C has no bad records, fallback and final C are unnecessary; that shortcut was not used in the recorded run.

The required terminal conditions are:

+ successful builds, a normally completed cover, and a complete center file;
+ four A exits 0, all assigned centers processed, terminal #raw("failedBalls=0"), and four empty bad text files;
+ both B exits 0, all input parents processed, agreement of logged and saved output counts, and zero-count B bad files;
+ every initial C batch processed exactly once with consistent exit, done count, bad count, and saved records;
+ every initial C bad record included in fallback, fallback exit 0 with all parents processed and zero saved failures, and four final C exits 0 with total done equal to the fallback count and zero saved failures.

Missing files, truncated data, an unexpected exit, resource exhaustion, an unresolved A or B parent, or a final C bad record prevent acceptance. Recoverable search diagnostics are distinguished from these terminal conditions. For example, A’s #raw("ownfail") counts unsuccessful proposals of a local Root cover that are followed by subdivision. A0 reported such a diagnostic in this run; its terminal unresolved count was nevertheless zero.

=== 7.3 Finite bounds and conservative stopping <execute:bounds>

The control flow has explicit finite bounds. Before filtering, the nondecreasing five-bin lists for the seed cover number at most

$ binom(116, 5) = 160 \, 389 \, 488 \, $

and for any fixed shared bin the four ordered tail bins number at most

$ binom(115, 4) = 6 \, 913 \, 340 . $

The former bound is below the signed 32-bit limit. Pair traversals use range loops and 64-bit counters. All bin differences lie between $- 111$ and $111$; their nine-coordinate square sum is at most $9 dot.op 111^2$, so the integer distance and bucket arithmetic fit the stated types. The stored five-coordinate differences also fit the signed eight-bit type used by the cover.

A retains nonfinal unitary grid lists only through grid 32; the grid 64 has at most $64^4 \/ 8 = 2 \, 097 \, 152$ cell tests per seed. Further tests are bounded by the $1 \, 000 \, 000$ extra-node cap, and the deepest grid is 512. Reaching the cap or reaching the deepest grid without a certificate records an unresolved seed. Trial-direction and Root proposal failures can lose an opportunity to cover a cell, but cannot make an uncovered cell successful. The local candidate list uses #raw("topK=4") in an array of size 8.

The Root dimension is at most $k = 10$. Atlas sizes and individual record file counts are capped at $2 \, 000 \, 000$, and concatenated B/C input counts at $8 \, 000 \, 000$. For B the validated widths and radii give $L lt.eq 1262$ and hence axis indices at most 2524; the product grid is checked against $50 \, 000 \, 000$ before multiplication. Mixed-radix strides and marks therefore fit the stated index types. Each unresolved box is split to depth at most six, and the $2^k$ child masks fit an integer. Only successfully completed parents are inserted into B’s list of earlier covered parents. A grid-cap rejection is a parent failure, not a completed parent.

C retains at most $2 \, 000 \, 000$ phase bins. The first grid has $12^5 = 248 \, 832$ cells; a later grid tests at most 32 children per retained bin. Clustering permits at most 2048 balls. Its graph bitsets have 32 words of 64 bits, and all members have indices below the current node count. Word shifts are unsigned. The graph pair counts fit an integer, and the joint test has at most 14 rows. Recursive clique search decreases the requested clique size or removes a candidate; the step cap supplies an additional bound. A cap sets the conservative candidate/give-up flag and saves the record. It does not return a negative certificate. Consequently no finite resource cap in the specified run can establish nonexistence by silently dropping a region.

=== 7.4 The finite-execution implication <execute:implication>

#thm([Theorem 7.1.])[
  (Finite-execution certificate).  #emph[Use the seven specified source files and the arithmetic conditions of Appendix 9. Suppose the invocations in Section 7.2 meet all of its terminal conditions, with the record provenance and batch checks stated there. Then four mutually unbiased orthonormal bases in $bb(C)^6$ do not exist.]
] <execute:finite-theorem>

#proof[
  Suppose four such bases exist. Normalize the first to the standard basis and write the second as $H \/ sqrt(6)$. Proposition 13 places the seed coordinates of an equivalent exact Hadamard matrix in one of the generated seed balls. All A shards together process that seed. Proposition 40 therefore places an equivalent exact solution in a coarse Record. Each equivalence preserves extendibility by two further bases.
  Apply Proposition 47 first to B mid and then to B fine, and Corollary 48 to the emitted batches. They place an equivalent exact solution in a record of #raw("fine.bin"), and therefore in its checked, possibly enlarged batch record. Completeness of the marker and the per-batch done counts ensures that initial C processes that record. A negative C result would contradict its extendibility by Proposition 57. Hence it must occur among the saved initial failures. If there are none, this already gives a contradiction. Otherwise the fallback branch is executed, and the subsequence and fallback-input checks include that very record in B fallback.
  The successful fallback again covers its exact solutions, up to the same equivalences, by the records of #raw("fb1.bin"). The final four modulo-4 shards partition those records without omission. Every final record has a negative C result, contradicting extendibility. Each coverage implication used here is justified by its geometric lemma and the one-sided arithmetic bounds; counts and hashes establish the identity and completeness of the finite chain, not those inequalities in isolation. ◻
]

=== 7.5 The completed execution <execute:observed>

The execution began at 03:10:26 and completed at 04:24:56 on 4 October 2026 (UTC). Both the runner and its supervisor exited 0; the supervisor recorded no cleanup or finalization errors, no remaining children, and unchanged input hashes. The execution evidence includes the raw command and stream records, exact file contents, record provenance, batch concatenation, actual fallback inputs, and final modulo partition. Together with the validation records, these account for all 100 native invocations and show no final unresolved records. They document the finite execution, not an automatic verification of the geometric or arithmetic lemmas.

Table 1 records this computation. All four A shards exited 0, with empty bad text files. Each B invocation exited 0 with an eight-byte zero-count bad file. Initial C had 73 exits 0 and 15 exits 1, all accounted for by saved failures. All final C shards exited 0 with eight-byte zero-count bad files.

#figure(
  table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stage
], table.cell(rowspan: 1, colspan: 1)[Inputs processed
], table.cell(rowspan: 1, colspan: 1)[Output records
], table.cell(rowspan: 1, colspan: 1)[Unresolved records
]),
  table.cell(rowspan: 1, colspan: 1)[Seed cover
], table.cell(rowspan: 1, colspan: 1)[$151 \, 744 \, 086$ pairs
], table.cell(rowspan: 1, colspan: 1)[$249 \, 878$ centers
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[A0
], table.cell(rowspan: 1, colspan: 1)[$62 \, 470$
], table.cell(rowspan: 1, colspan: 1)[764
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[A1
], table.cell(rowspan: 1, colspan: 1)[$62 \, 470$
], table.cell(rowspan: 1, colspan: 1)[774
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[A2
], table.cell(rowspan: 1, colspan: 1)[$62 \, 469$
], table.cell(rowspan: 1, colspan: 1)[757
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[A3
], table.cell(rowspan: 1, colspan: 1)[$62 \, 469$
], table.cell(rowspan: 1, colspan: 1)[788
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[B mid
], table.cell(rowspan: 1, colspan: 1)[3083
], table.cell(rowspan: 1, colspan: 1)[600
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[B fine
], table.cell(rowspan: 1, colspan: 1)[600
], table.cell(rowspan: 1, colspan: 1)[$22 \, 379$
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[Initial C
], table.cell(rowspan: 1, colspan: 1)[$22 \, 379$
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[163 (all graph caps)
],
  table.cell(rowspan: 1, colspan: 1)[B fallback
], table.cell(rowspan: 1, colspan: 1)[163
], table.cell(rowspan: 1, colspan: 1)[1127
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[Final C0
], table.cell(rowspan: 1, colspan: 1)[282
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[Final C1
], table.cell(rowspan: 1, colspan: 1)[282
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[Final C2
], table.cell(rowspan: 1, colspan: 1)[282
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[Final C3
], table.cell(rowspan: 1, colspan: 1)[281
], table.cell(rowspan: 1, colspan: 1)[—
], table.cell(rowspan: 1, colspan: 1)[0
],
),
  caption: [Table 2: Observed execution on 4 October 2026 (UTC). The seed cover retained 22,829 five-bin $x$ lists. The fine records form 88 batches: $87 dot.op 256 + 107 = 22 \, 379$. ],
)

The nonzero initial C failure files, in the actual order supplied to B fallback, were

#raw(block: true, lang: "", "bad10.bin bad3.bin bad4.bin bad5.bin bad52.bin bad53.bin\nbad55.bin bad56.bin bad6.bin bad7.bin bad78.bin bad79.bin\nbad8.bin bad80.bin bad84.bin")

They contain all 163 unresolved records. There were no initial bin overflows, clustering failures, or uncapped graph candidates. There were no final failures of any category. Thus all 100 program invocations in the full pipeline are accounted for: one cover, four A processes, two B refinements, 88 initial C processes, one B fallback, and four final C processes. The fifteen initial C exits 1 are resolved by that fallback chain. No rejection threshold, graph cap, refinement width, or mathematical source file was altered, and no additional refinement level was inserted.

For scale, the wrapper-measured stage wall times, including polling and validation, were 621.59 seconds for the cover, 2020.32 seconds for the four parallel A shards, 1071.49 and 407.45 seconds for B mid and B fine, and 300.23, 8.12, and 36.27 seconds for initial C, fallback B, and final C. The outer supervisor measured 4470.33 seconds for the complete pipeline. These are observations on this platform, not native CPU times or running-time guarantees. No stage hit its wall deadline, and no retry or resource-limit increase was used.

#figure(
  table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[File
], table.cell(rowspan: 1, colspan: 1)[SHA-256
]),
  table.cell(rowspan: 1, colspan: 1)[File
], table.cell(rowspan: 1, colspan: 1)[SHA-256
],
  table.cell(rowspan: 1, colspan: 1)[#raw("centers.txt")
], table.cell(rowspan: 1, colspan: 1)[#raw("c48bc9a2be1eb2cdeea82ea1b030d7cb9f00a6c9563b63f0248dd115748a5789")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("coarse0.bin")
], table.cell(rowspan: 1, colspan: 1)[#raw("77b0cda59484ffde0654db8d6008bcaab1daf1deefd00d4dc085d3d751418cd4")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("coarse1.bin")
], table.cell(rowspan: 1, colspan: 1)[#raw("48ca7775dba57a87a10d154da8b172074b29c9a65b32e44ee169f23a48d24b8a")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("coarse2.bin")
], table.cell(rowspan: 1, colspan: 1)[#raw("418b6d9cf338187c63635d26050940a13177515050a057b2bc67fd11a163e43e")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("coarse3.bin")
], table.cell(rowspan: 1, colspan: 1)[#raw("8c23427e63e31cd18abbb80838e3289e646fd108fa850687ca7b857471376535")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("mid.bin")
], table.cell(rowspan: 1, colspan: 1)[#raw("e97c74dde90a0e758df2cb5d9708f5bd6bd660ed920b3299f5df92ff4de11be4")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("fine.bin")
], table.cell(rowspan: 1, colspan: 1)[#raw("9b5b743b61907277fa6687a0ad45677bbcd0e4c9bd44a0d93d258253fb52923d")
],
  table.cell(rowspan: 1, colspan: 1)[#raw("fb1.bin")
], table.cell(rowspan: 1, colspan: 1)[#raw("ef85ec73217ecb0c770d3c775396df88b60ca06918f77310df5dff2f6d9bf215")
],
),
  caption: [Table 3: SHA-256 digests of the actual principal data files. Full per-file inventories accompany the computation archive. ],
)

The execution archive identified by #raw("verification/computation/README.md") preserves the numerical data and records of this complete run, with internal path and host fields redacted: all sources and binaries, center and record files, all 88 input batches and their C bad files, fallback data, all final bad files, stdout and stderr, commands, exits, platform information, and validation records. In the execution archive, #raw("full-run-01/pipeline/status.json") is the whole-run record; #raw("*.stage.json") files describe stages and individual #raw("*.status.json") files describe child processes. The outer record is #raw("full-run-01/run.json"). #raw("verification/REPRODUCE.md") gives rebuild and execution instructions. Archived native binaries document this run; they are not a portability claim.

The proof here uses only this newly completed chain and the values in Tables 1 and 2. The complete evidence packet for the execution reported on 7 September 2026 was not recovered. Although the new principal data hashes and stage counts agree with those reported for that run, this agreement does not authenticate the earlier execution. Neither its reported results nor earlier timed or sampled diagnostics substitute for any stage of the new full run.

== 8 Conclusion of the proof <sec:conclusion>

#proof[
  Under the arithmetic and compiler conditions specified in Section 7.1 and Appendix 9, the checked terminal, provenance, and batch data for the execution documented in Section 7.5 permit application of Theorem 58. It excludes four mutually unbiased orthonormal bases in $bb(C)^6$. Lemma 2 gives three such bases, so $N \( 6 \) = 3$. ◻
]

== 9 Certified arithmetic <sec:rounding>

This section supplies the one-sided arithmetic estimates used in Sections 2, 3, 4, 5, and 6. The source files, parameters, build, and completed execution are documented in Section 7. The estimates concern those entry points and parameters. Auxiliary routines not called by those entry points are not additional exclusion tests.

We distinguish an #emph[exact stored number], meaning the real number represented by a binary64 datum, from the ideal mathematical quantity it approximates. Proposed solve directions, proposed inverse matrices, and proposed changes of basis are usually used in the first sense. Their accuracy is not assumed: finite bounds and residual inequalities are checked before a proposal can justify an exclusion or a covering step. For complex arrays, an entrywise error is an error in complex modulus. Matrix norms without a subscript are Euclidean operator norms.

=== 9.1 Arithmetic premises and elementary estimates <round:premises>

The primitive-operation model is the binary64 specification of IEEE 754 #cite(label("IEEE7542019")) Sections 3.4, 3.6, 4.3, 5.4.1 and 7.5. The accumulation estimates use the usual product-of-rounding-factors argument #cite(label("Higham2002Accuracy")) Section 2.12 and Lemma 3.1, with the explicit additive underflow allowance retained below.

The arithmetic premises are separate, correctly rounded binary64 addition, subtraction, multiplication, division, and square root in round-to-nearest mode, with binary64 evaluation of intermediate results. The build uses #raw("-ffp-contract=off"), and does not use fast-math or reassociation that changes these operations. Subnormal numbers are not flushed to zero, and denormal inputs are not treated as zero. Floating exceptions are masked, so an unsuccessful heuristic calculation can produce an infinity or NaN and be rejected by its subsequent checks. The relevant integer types, numeric locale, and file representation are specified in Section 7.

The function #raw("environment") sets and checks nearest rounding and checks the binary64 properties of #raw("double"). The A/B/C entry points also inspect MXCSR, rejecting a non-nearest mode, DAZ, FTZ, or unmasked exceptions. The same no-DAZ/no-FTZ environment is required for #raw("covout"), although its entry point does not itself inspect those bits. The default-nearest premise also applies to constants and the global basis constructed before #raw("main"). These are explicit arithmetic premises, not a claim that a source-level static assertion formally verifies every compiler transformation. The recorded build checks and their limits are described in Section 7.

The functions #raw("nearbyint") and #raw("floor") choose integers at finite bounded arguments. The particular integer chosen at a boundary is permissible wherever the proof subsequently uses that integer lift. No accuracy premise is imposed on #raw("atan2"): Candidate checks the unit exponential of the phase it proposes. Decimal literals are either used as exact stored parameters, or allowed a relative translation error of at most $5 dot.op 10^(- 16)$ when compared with a displayed decimal.

Put

$ u = 2 dot.op 10^(- 16) \, #h(2em) tau = 10^(- 300) \, #h(2em) gamma_m = 2.1 dot.op 10^(- 16) \( m + 1 \) . quad "(9.1)" $ <round:unit>

For a correctly rounded basic operation with finite exact result $z$ at the scales below,

$ \| "fl" \( z \) - z \| lt.eq u \| z \| + tau . quad "(9.2)" $ <round:basic>

The true binary64 relative unit roundoff is smaller than $u$, and the additive allowance is much larger than half the least positive subnormal. Overflows are excluded for the certificate evaluations by the scale bounds proved below; they need not be excluded in an untrusted solve.

#thm([Lemma 9.1.])[
  (Accumulation and norm bounds).  #emph[For $m lt.eq 2000$, a dot product on exact stored inputs, formed as separate products and successive additions, satisfies 
$ lr(|"fl" #h(-1em) (sum_(i = 1)^m a_i b_i) - sum_(i = 1)^m a_i b_i|) lt.eq gamma_m sum_(i = 1)^m \| a_i b_i \| + 4 \( m + 1 \) tau . quad "(9.3)" $ <round:dot>

 An initial addend is included in the absolute sum and increases the small operation-count constant by one. A product of three factors instead of two increases that constant by one more. For the square-sum/square-root norms used here, 
$ lr(|"fl" \( parallel a parallel \) - parallel a parallel|) lt.eq 2.2 dot.op 10^(- 16) \( m + 2 \) parallel a parallel + 10^(- 140) . quad "(9.4)" $ <round:norm>

 If the computed components approximate other components, their Euclidean difference is added to this bound.]
] <round:accumulation>

#proof[
  For each product term, the product rounding and the additions through which it passes contribute at most $m + 1$ multiplicative factors of the form $1 + delta$, $\| delta \| lt.eq u$. In the stated range, $\( 1 + u \)^(m + 1) - 1 < gamma_m$. Propagating the additive errors in (9.2) costs less than $4 \( m + 1 \) tau$; all amplification factors here are less than $1.001$. This proves (9.3). The same argument applies to positive sums and to three-factor products. For a sum of squares it gives relative error at most $gamma_m$ and an additive error at most $4 \( m + 1 \) tau$. Taking its square root, using $\| sqrt(1 + t) - 1 \| lt.eq \| t \| \/ \( 1 + sqrt(1 - \| t \|) \)$ for $\| t \| < 1$, and then including the final square-root rounding gives (9.4). The additive effect is bounded by $sqrt(4 \( m + 1 \) tau)$ plus the square-root rounding; this is smaller than $10^(- 140)$. Finally $\| parallel a parallel - parallel b parallel \| lt.eq parallel a - b parallel$. Thus no division by a small norm is needed to handle perturbed components. ◻
]

For exact stored complex numbers, the explicit source operations obey

$ \| "fl" \( z + w \) - \( z + w \) \| & lt.eq u \( \| z \| + \| w \| \) + 2 tau \,\
\| "fl" \( z w \) - z w \| & lt.eq 10^(- 15) \| z \| \| w \| + 8 tau . quad "(9.5)" $ <round:complex-add>

For the latter, each real component uses two real products and an addition or subtraction. Its error is bounded by $\( 2 u + u^2 \)$ times the sum of the two absolute products, plus the additive allowance. Cauchy’s inequality bounds each such sum by $\| z \| \| w \|$, and $sqrt(2) \( 2 u + u^2 \) < 10^(- 15)$. Real scaling and division are componentwise instances of (9.2). Squared moduli also satisfy the useful perturbation bound

$ \| \| z + e \|^2 - \| z \|^2 \| lt.eq 2 \| z \| \| e \| + \| e \|^2 \, quad "(9.6)" $ <round:squared-perturbation>

before their own multiplication/addition errors.

The additive underflow terms can be retained throughout these inequalities. The norm allowance $10^(- 140)$ is deliberately loose. All subsequent certified divisions have the explicit lower bounds given below; in particular the residual test divides only by a gap of order $10^(- 6)$ or larger. Its norm factors and scale are at most the displayed $10^8$–$10^11$ scales, so its propagated additive terms remain below $10^(- 120)$. The second square root in the spectral estimate is handled separately by an absolute term of order $10^(- 69)$. That term is covered there before the result is reused. Other normalizations have denominators bounded below by $.148$, $.45$, or larger. At each iterative upper-bound update the new local error is absorbed by its own positive margin. There is therefore no unchecked chain of ill-conditioned divisions propagating a subnormal error: all such additive contributions are below $10^(- 50)$ when they are absorbed in the strict budgets below.

=== 9.2 Pi and unit exponentials <round:exponentials>

The source literal #raw("0x1.921fb54442d18p+1") represents the binary rational

$ hat(pi) = 884279719003555 / 281474976710656 . $

Here is an exact certificate for its error. Write

$ A \( x \, n \) = sum_(j = 0)^(n - 1) frac(\( - 1 \)^j x^(2 j + 1), 2 j + 1) \, #h(2em) s = 16 A \( 1 \/ 5 \, 12 \) - 4 A \( 1 \/ 239 \, 4 \) . $

If $t = arctan \( 1 \/ 5 \)$, then $tan \( 2 t \) = 5 \/ 12$ and $tan \( 4 t \) = 120 \/ 119$; subtracting $arctan \( 1 \/ 239 \)$ gives tangent $1$ in $\( 0 \, pi \/ 2 \)$. This proves Machin’s identity $pi = 16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \)$. The alternating-series remainder gives

$ \| s - pi \| lt.eq frac(16, 25 thin 5^25) + frac(4, 9 thin 239^9) . $

Exact rational arithmetic gives

$ hat(pi) - s = frac(- 1204334632739641172855772829555432415587, 10003273510806667494906565283020800000000000000000000000) . quad "(9.7)" $ <round:pi-rational>

Adding the displayed rational remainder bounds and comparing integers proves

$ \| hat(pi) - pi \| < 1.225418 dot.op 10^(- 16) < 2 dot.op 10^(- 16) . quad "(9.8)" $ <round:pi-error>

The range-reduction argument uses Sterbenz’s exact-subtraction lemma #cite(label("Sterbenz1974FloatingPoint")); a statement including gradual underflow is given in #cite(label("Higham2002Accuracy")) Theorem 2.5 and the following discussion. The polynomial and argument-error estimates are proved here for the particular degree-$18 \/ 19$ implementation.

#thm([Lemma 9.2.])[
  (Unit-exponential error).  #emph[At a finite stored $x$ with $\| x \| lt.eq 16$, #raw("expair") differs from $e \( x \) = exp \( 2 pi i x \)$ in complex modulus by less than $2 dot.op 10^(- 14)$. For all its uses in the certificate, including argument formation, the following common bound is valid: 
$ epsilon_exp = 6 dot.op 10^(- 14) . quad "(9.9)" $ <round:exp-budget>

]
] <round:expair>

#proof[
  The multiplication $4 x$ is exact. Let $k$ be its nearest integer. Then $\| x - k \/ 4 \| lt.eq 1 \/ 8$. If $k eq.not 0$, $x$ and $k \/ 4$ have the same sign and their absolute values are within a factor two, so the subtraction is exact by Sterbenz’s lemma. If $k = 0$ it is immediate. Multiplication by the exact double $2 hat(pi)$ forms a stored angle $y$ with
  $ \| y - 2 pi \( x - k \/ 4 \) \| < 3 dot.op 10^(- 16) \, #h(2em) \| y \| < .786 . $
  The error follows from (9.8), the remainder bound $1 \/ 8$, and one multiplication rounding.
  The source evaluates cosine through degree 18 and sine through degree 19. In the $j$th nonconstant term, the error in $- y^2$ is reused $j$ times, and there are $j$ further multiplications and $j$ divisions. The small integer denominators are exact. Its relative error is therefore at most $\( 1 + u \)^(3 j) - 1 < 5.5 dot.op 10^(- 15)$ for $j lt.eq 9$. For additive underflow errors, compare with a recurrence using the same multiplicative rounding factors but zero additive errors. Its terms have magnitude below two, and each recurrence contracts the previous additive error by a factor less than $1 \/ 2$: the numerator factor has magnitude below $.786^2$ and the smallest denominator is two. Errors from that factor, the product, and the division give the conservative recurrence $E_j lt.eq E_(j - 1) \/ 2 + 4 tau$, $E_0 = 0$. Thus $E_j < 8 tau$; after both coordinates’ nine additions their total contribution is below $10^(- 295)$, including when $y^2$ or a later term underflows. The absolute even-term sum at $.786$ is below $1.4$, its nonconstant part below $.4$; the odd-term sum is below $1$, its part after $y$ below $.2$. For the nonconstant even terms the successive ratio after the first is at most $.786^2 \/ 12$, and for the odd terms after y it is at most $.786^2 \/ 20$. Their geometric majorants give the claimed absolute sums without evaluating a transcendental function. The first omitted cosine and sine terms are below $3.330 dot.op 10^(- 21)$ and $1.247 dot.op 10^(- 22)$, respectively; in particular both tails are below $4 dot.op 10^(- 20)$.
  The term errors contribute less than $2.2 dot.op 10^(- 15)$ in cosine and $1.1 dot.op 10^(- 15)$ in sine. Put $alpha = \( 1 + u \)^9 - 1 < 1.81 dot.op 10^(- 15)$ and $rho = \( 1 + u \)^27 - 1 < 5.5 dot.op 10^(- 15)$. Including the nine additions and the tails gives coordinate errors less than $.4 rho + 1.4 \( 1 + rho \) alpha + 4 dot.op 10^(- 20) < 4.74 dot.op 10^(- 15)$ and $.2 rho + \( 1 + rho \) alpha + 4 dot.op 10^(- 20) < 2.92 dot.op 10^(- 15)$. Their Euclidean combination, the $3 dot.op 10^(- 16)$ angle error, and the additive underflow term give complex error below $6 dot.op 10^(- 15)$, hence below the asserted $2 dot.op 10^(- 14)$. The quadrant permutations and sign changes are exact.
  For a rational bin midpoint, division by the grid size, or multiplication of $b + 1 \/ 2$ by the stored reciprocal of that size, has error below $5 dot.op 10^(- 16)$ cycles. The latter product has ideal magnitude at most one. Subtraction of a phase of magnitude at most four, or a stored ball phase of magnitude at most two, brings the total argument error to less than $2 dot.op 10^(- 15)$ cycles. The Lipschitz constant of $e$ is $2 pi$, so this additional error fits inside (9.9). Dyadic unitary centers are exact; Stage A treats the stored seed phases as exact after enlarging the seed ball; #raw("buildH") treats its stored $p$ as exact and compares row-edge exponentials with products of ideal unit entries. ◻
]

All relied-on arguments satisfy the range condition. Seed and dyadic unitary phases are bounded near $\[ 0 \, 1 \]$; #raw("gen") checks $\| p_j \| lt.eq 4$; Candidate checks $\| P_j \| lt.eq .51$ before its exponential; C validates $\| p_j \| lt.eq 4$ and checks ball phases of magnitude at most two. The largest C difference has magnitude at most six. The constants $sqrt(6)$ and its reciprocal are formed by the indicated square root and division; $2 dot.op 10^(- 15)$ is an ample absolute error bound for each.

=== 9.3 Seed filtering and seed-ball reuse <round:seed>

Here $n = 112$ and the stored $w$ approximates $1 \/ n$. Midpoint-gap calculations contain only small integer arithmetic and a few products/subtractions; (9.2) bounds their total error, including the comparison threshold, by $10^(- 14)$. Their slack is $10^(- 8)$. The orientation filter is integral.

For a list of five varying phases, the computed residual $c$ in #raw("sumok") has component error below $2 dot.op 10^(- 13)$. Indeed its five exponential errors, after division by $2 pi$, total less than $4.8 dot.op 10^(- 14)$ in complex modulus, and the divisions, additions, and constant error cost less than $3 dot.op 10^(- 15)$. The sharper componentwise bound $1.1 dot.op 10^(- 13)$ will also be useful. Each test direction is regarded as an exact stored pair; its norm is less than $1.1$. The five column perturbations, the residual perturbation, and ordinary arithmetic in #raw("chk") cost together less than $10^(- 11)$. Its remainder coefficient approximates $5 pi \/ \( 4 n^2 \)$ within $10^(- 15)$. The actual $10^(- 8)$ comparison addition therefore preserves every feasible list.

For #raw("extend"), the stored direction has norm at most $1.01$. Let $v$, $a$, and $r$ denote its stored directional residual in grid units, shared coefficient, and support before inflation. Their errors satisfy

$ \| Delta v \| < 3.3 dot.op 10^(- 11) \, #h(2em) \| Delta a \| < 10^(- 13) \, #h(2em) \| Delta r \| < 10^(- 12) . quad "(9.10)" $ <round:clip-errors>

For the first bound, multiply the sharpened residual bound by $112$ and by a direction of norm at most $1.01$, and include a two-term dot and one multiplication. The other two follow from (9.9), four absolute support terms, and a two-component norm. If $\| d_s \| lt.eq 1 \/ 2$ is feasible, these estimates give

$ \| v + a d_s \| lt.eq r + 3.3 dot.op 10^(- 11) + 1 / 2 dot.op 10^(- 13) + 10^(- 12) + upright("rounding") . $

The source adds $10^(- 7)$ to $r$ #emph[before] dividing by $\| a \|$. It skips $\| a \| < 10^(- 6)$; at an accepted divisor $\| a \| > .999 dot.op 10^(- 6)$, allowing literal translation. The midpoint quotient has magnitude below $1.2 dot.op 10^8$ and the radius quotient below $3 dot.op 10^6$: the residual has magnitude below 112, and the support before division is below three. Their divisions and endpoint additions can move an endpoint by less than $10^(- 7)$. The extra $10^(- 5)$ on each endpoint is therefore sufficient. Intersecting these outward intervals retains the true shared value.

In #raw("supdual"), all proposed entries are checked by $\| v_a \| lt.eq 10^4$, with a negated comparison that also rejects NaN. They are then exact stored test coefficients. The four right-hand side errors against $- n c$ are below $3 dot.op 10^(- 11)$ each. The signed term consequently has input error at most

$ 2 sum_(a = 1)^4 \| v_a \| thin 3 dot.op 10^(- 11) lt.eq 2.4 dot.op 10^(- 6) < 2.5 dot.op 10^(- 6) . $

Its absolute term sum is below $10^7$, so its arithmetic error is below $10^(- 7)$. Each of the nine row-dot residuals has error below $4 dot.op 10^(- 9)$: its four input contributions are at most $4 dot.op 10^4 epsilon_exp$, and its short dot costs less than $10^(- 10)$. Each pair norm has error below $10^(- 10)$ by (9.4). The remainder coefficient uses $1.251$ instead of $1.25$, which leaves positive slack after its own rounding. The final absolute scale is below $2 dot.op 10^7$. Summing these contributions shows that the ideal support expression is at most the computed proposal plus $10^(- 4)$. The actual addition is $.01$. If no usable proposal improves the initial $10^10$ bound, that initial bound already exceeds the trivial support.

Integer differences lie in $\[ - 111 \, 111 \]$, including those stored in #raw("int8_t"); all their squared/absolute sums are exact and small. The comparison radius is

$ mono("RN2") = "fl" \( \( "fl" \( .032 dot.op 112 \) \)^2 \) - .0001 $

with the source’s indicated operation ordering. The total possible error before the subtraction is below $10^(- 12)$, so this is smaller than the ideal $\( .032 dot.op 112 \)^2$. This reasoning requires the #raw("pow(x,2)") calls in #raw("covout") to be lowered to binary64 multiplication, as checked for the fresh build documented in Section 7. It is not a claim about an arbitrary library implementation of #raw("pow"). The other square-power value $T$, bucket reach, and integer cuts only select reuse attempts; missing an attempt does not discard the current bin pair. A newly inserted midpoint needs radius only $1.5 \/ 112 < .032$. Finally, the nine division-rounded seed phases differ from their rational midpoints in norm by less than $10^(- 14)$, which is absorbed when the A seed radius is increased to $.0320001$.

=== 9.4 Frames, comparison blocks, and A exclusion tests <round:frames>

All ideal quantities in this subsection use exact unit exponentials at the specified centers, and the same coordinate indices selected by the code. We never need the selected coordinate to maximize the #emph[ideal] projection score.

For #raw("frame"), the four-term sum $S$ has error below $2.5 dot.op 10^(- 13)$; its squared modulus has error below $2.2 dot.op 10^(- 12)$ by (9.6), and its modulus below $2.6 dot.op 10^(- 13)$ by (9.4). If the stored $m = sqrt(4 - \| S \|)$ passes $m > 1.25$, the ideal $m > 1.24$. Using $\| sqrt(a) - sqrt(b) \| = \| a - b \| \/ \( sqrt(a) + sqrt(b) \)$ at these lower bounds gives errors below $3 dot.op 10^(- 13)$ in $m$ and $upright("top") = sqrt(4 + \| S \|)$. In particular $16 - \| S \|^2 > 6.1$; its error is below $2.3 dot.op 10^(- 12)$, so its reciprocal has error below $7 dot.op 10^(- 14)$. The two pseudoinverse numerators have modulus at most eight and error below $5.1 dot.op 10^(- 13)$. For example the row-times-$overline(S)$ product contributes at most the row error times $\| S \|$, plus the $S$ error, plus (9.5). Division/scaling then gives

$ \| Delta G_(i j) \| < 10^(- 12) \, #h(2em) \| G_(i j)^(upright("ideal")) \| < .81 \, quad "(9.11)" $ <round:frame-g>

the second inequality following from the lower singular bound.

The first constant basis column is exact. The next column has numerator error below $1.3 dot.op 10^(- 13)$ and denominator $sqrt(4 - \| S \|^2 \/ 4) > 1.5$ with error below $2 dot.op 10^(- 13)$. Its ideal entries have modulus at most one, so the quotient error is below $4 dot.op 10^(- 13)$. For each of the remaining two columns, use the actual selected coordinate projection $q$. In the first such projection the earlier two products give entry error below $9 dot.op 10^(- 13)$, and its norm error is below $2 dot.op 10^(- 12)$. The accepted computed norm is greater than $.449999$, so the ideal projection is nonzero and normalization gives entry error below $7 dot.op 10^(- 12)$. In the last projection the extra column-product error gives entry error below $1.6 dot.op 10^(- 11)$ and norm error below $3.5 dot.op 10^(- 11)$. The same denominator check gives entry error below $1.2 dot.op 10^(- 10)$. This argument inductively constructs the ideal orthonormal complements with the selected coordinates. The two-product kernel projector has entry error below $3 dot.op 10^(- 10)$; multiplying two complement entries and $sqrt(6)$ gives a W entry error below $8 dot.op 10^(- 10)$.

The following table records the rest of the propagation, with the source array names. Its errors include ordinary operation rounding.

table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Absolute error per entry
], table.cell(rowspan: 1, colspan: 1)[Ideal scale used
]),
  table.cell(rowspan: 1, colspan: 1)[#raw("base")
], table.cell(rowspan: 1, colspan: 1)[$10^(- 11)$
], table.cell(rowspan: 1, colspan: 1)[two factors of modulus at most 2 times G
],
  table.cell(rowspan: 1, colspan: 1)[#raw("fixed")
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 9)$
], table.cell(rowspan: 1, colspan: 1)[projector times a factor at most 1.62
],
  table.cell(rowspan: 1, colspan: 1)[#raw("bm"), #raw("cm")
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 12)$
], table.cell(rowspan: 1, colspan: 1)[unit entry times G
],
  table.cell(rowspan: 1, colspan: 1)[#raw("uc.U"), angular derivatives
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 13)$
], table.cell(rowspan: 1, colspan: 1)[products of unit phases/trig entries
],
  table.cell(rowspan: 1, colspan: 1)[#raw("K"), #raw("D")
], table.cell(rowspan: 1, colspan: 1)[$4 dot.op 10^(- 9)$
], table.cell(rowspan: 1, colspan: 1)[four W products and base
],
  table.cell(rowspan: 1, colspan: 1)[#raw("mag")
], table.cell(rowspan: 1, colspan: 1)[$4 dot.op 10^(- 8)$
], table.cell(rowspan: 1, colspan: 1)[$\| D \| < 4.6$
],
  table.cell(rowspan: 1, colspan: 1)[$sqrt(mono("mag"))$
], table.cell(rowspan: 1, colspan: 1)[$5 dot.op 10^(- 9)$
], table.cell(rowspan: 1, colspan: 1)[norm Lipschitz
],
  table.cell(rowspan: 1, colspan: 1)[#raw("jac")
], table.cell(rowspan: 1, colspan: 1)[$10^(- 8)$
], table.cell(rowspan: 1, colspan: 1)[ideal modulus at most 6
],
  table.cell(rowspan: 1, colspan: 1)[flat real J
], table.cell(rowspan: 1, colspan: 1)[$10^(- 7)$
], table.cell(rowspan: 1, colspan: 1)[dot of D and jac
],
  table.cell(rowspan: 1, colspan: 1)[flat c
], table.cell(rowspan: 1, colspan: 1)[$5 dot.op 10^(- 8)$
], table.cell(rowspan: 1, colspan: 1)[$\( \| D \|^2 - 1 \) \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[pre-equation c
], table.cell(rowspan: 1, colspan: 1)[$4 dot.op 10^(- 13)$
], table.cell(rowspan: 1, colspan: 1)[short unit-exponential sums
],
  table.cell(rowspan: 1, colspan: 1)[pre-equation coefficients
], table.cell(rowspan: 1, colspan: 1)[$6 dot.op 10^(- 14)$
], table.cell(rowspan: 1, colspan: 1)[unit exponentials
],
)

To verify the larger entries, each base factor $1 + c_i overline(a)$ has error below $1.3 dot.op 10^(- 13)$; its multiplication by G and the two-term sum give the listed base bound. The larger fixed term uses the projector error times a factor at most $1.62$, plus a G/unit combination with error below $3 dot.op 10^(- 12)$, leaving room inside $2 dot.op 10^(- 9)$. Four W products cost less than $4 \( 8 dot.op 10^(- 10) \)$ plus the unitary and base errors, below $4 dot.op 10^(- 9)$. The ideal K entry is at most $sqrt(6)$, and the block operator estimate of Section 3 gives

$ parallel D parallel lt.eq max { sqrt(6) \, parallel C_0 parallel A_0 \/ m_B } < 4.6 . $

Each seed derivative has modulus at most $1.62 + .81 dot.op 4.6 < 6$; the individual angular derivatives before the complement/$sqrt(6)$ factors have operator norm at most one. Fixed error, moving-block error times $.81$, and coefficient error times $4.6$ fit inside $10^(- 8)$. The flat dot error is then less than $6 \( 4 dot.op 10^(- 9) \) + 4.6 \( 10^(- 8) \)$ plus a short-dot rounding error, below $10^(- 7)$. Finally, each $\| \| D_j \| - 1 \| lt.eq 3.6$; the 16 squared deviations have total error below $10^(- 6)$. The direct A flat-norm test adds $10^(- 5)$ to its threshold.

===== 9.4.1 The bounds returned by #raw("get"). <the-bounds-returned-by-get.>

The stored lower singular bounds subtract $10^(- 8)$ and remain greater than $1.239$. The A bound adds $10^(- 7)$, and L is recomputed with the inflated top and A bounds before adding another $10^(- 7)$. The seed and angular radii have their explicit $10^(- 9)$ and $10^(- 10)$ additions. They satisfy

$ R_s < .203 \, quad h < .197 \, quad A < 2.001 \, quad L < 6 . $

With $A_max = min \( 2 \, A + R_s + 10^(- 8) \)$ the relevant field scales are

$ q < .32 \, quad upright("off") < .74 \, quad upright("pol") < .068 \, quad u_(upright("get")) < 1.26 \, quad z < 1.5 \, quad E < 1 . quad "(9.12)" $ <round:get-scales>

For example $q lt.eq .203^2 \( 1 + 10 \/ 1.239^2 \) + 10^(- 7) < .32$, $upright("off") lt.eq .203 \( sqrt(6) + 2 \) \/ 1.239 + 10^(- 7) < .74$, and $upright("pol") lt.eq .32 \/ \( sqrt(6) + sqrt(6 - .32) \) + 10^(- 7) < .068$. Then $u_(upright("get")) = 6 h + upright("pol") + 10^(- 9)$ and the two-dimensional norm give the z bound. Substitution of the same bounds in

$ E_3 = 1 / 2 sqrt(252) thin h^2 + upright("pol") \, #h(2em) E_(upright("phase")) = frac(L + A + 1, 2 m) R_s^2 \, #h(2em) e_(upright("off")) = E_(upright("phase")) + z R_s \/ m $

before their additions gives $E = parallel \( e_(upright("off")) \, E_3 \) parallel < 1$. All displayed inequalities leave room for the literal/operation errors.

Each field is evaluated from the then-current stored upper/lower inputs, which are treated as exact in this local step. The scalar formulas contain fewer than twenty nonconstant elementary operations, positive sums/products, divisions by at least $1.239$, or by $sqrt(6) + sqrt(6 - q) > 4$, and square roots with arguments at least one except for norms. In $6 - q$ the relative amplification is less than $6 \/ 5$; norms use (9.4). Applying (9.2) with these bounds gives error below $10^(- 12)$ for each field before its explicit $10^(- 9)$, $10^(- 8)$, or $10^(- 7)$ addition. The single multiplication error in $R_s^2$ is included. Positive substitution therefore preserves the upper bounds. In particular the invalid-$q$ branch cannot occur after a successful setup at the specified seed radius.

===== 9.4.2 Directional A exclusion. <directional-a-exclusion.>

#raw("trial::certificate") rejects a nonfinite direction, then requires its maximum magnitude to lie between $10^(- 100)$ and $10^100$. Division by that maximum produces an exact stored direction with $\| y_i \| lt.eq 1$. Its computed constant pairing has error below $9 dot.op 10^(- 7)$ and each of its 13 derivative pairings has error below $1.7 dot.op 10^(- 6)$: there are 16 flat rows, four pre-equation rows, and short dots with ideal J magnitudes at most 28. Hence the seed and angular linear supports can together be low by less than

$ \( .203 sqrt(9) + .197 dot.op 4 \) 1.7 dot.op 10^(- 6) < 2.38 dot.op 10^(- 6) < 3 dot.op 10^(- 6) . $

The norm $sqrt(mono("sd"))$ approximates $parallel D compose y_D parallel$ within $2 dot.op 10^(- 8)$, by the positive square bound and the 16 D-entry errors. All other positive products/norms and their addition cost less than $10^(- 9)$ at these scales. Thus the actual $.0001$ margin exceeds the whole possible comparison error. A failed or skipped proposal does not reject the cell.

=== 9.5 Root certificates and normal-displacement constants <round:root>

This subsection verifies the numerical premises of the Root inequalities in Section 4. It concerns only successful #raw("patch") calls. The stored center $P$ is exact for these calculations; #raw("gen") rejects $\| P_j \| > 4$ or a nonfinite phase. Each ideal row-edge product is a product of unit exponentials, so its computed error is below $2 epsilon_exp + 10^(- 15) \( 1 + epsilon_exp \)^2 < 1.3 dot.op 10^(- 13)$. The six-term edge sum has error below $8 dot.op 10^(- 13)$. Across the 15 complex edges, division by $2 pi$ gives vector error less than

$ frac(sqrt(15) thin 8 dot.op 10^(- 13), 2 pi) < 5 dot.op 10^(- 13) . $

The squared-modulus, scaling, sum, and final root add less than $10^(- 13)$ at the bounded unit-sum scale. Thus $sqrt(mono("val"))$ approximates $parallel F \( P \) parallel$ within $10^(- 12)$. The accepted value satisfies $mono("val") < 10^(- 18)$, and the stored $mono(f r o o t) = sqrt(mono("val")) + 10^(- 9)$ is an upper bound.

===== 9.5.1 The stored inverse-like matrix M. <the-stored-inverse-like-matrix-m.>

Regard every accepted #raw("hvec"), #raw("lvec"), and T entry as an exact stored number. Their absolute values are checked to be at most two. There are at most 25 good columns. If $H_V \, L_V$ denote these stored factor arrays, the accumulated M differs from $H_V L_V^(*)$ by less than $6 dot.op 10^(- 13)$ per entry: a 25-term dot has absolute product sum at most 100, giving $gamma_25 100 < 5.5 dot.op 10^(- 13)$. There are $36 dot.op 30$ entries, so the Frobenius difference is below $2.1 dot.op 10^(- 11)$.

The Gram dots for $H_V$ and $L_V$ have lengths 36 or 30 and absolute product sums at most 144. Their errors are below $1.2 dot.op 10^(- 12)$. After absolute values and at most 25 additions, each Gram row sum has error below $10^(- 10)$: the input error contributes at most $3 dot.op 10^(- 11)$ and addition error at the 3600 row scale is less than $2 dot.op 10^(- 11)$. Consequently the code’s $mono(a h) + 10^(- 8)$ and $mono(a l) + 10^(- 8)$ bound the largest eigenvalues of the exact stored-factor Grams. The product and square root forming

$ mono(m n o r m) = sqrt(\( mono(a h) + 10^(- 8) \) \( mono(a l) + 10^(- 8) \)) + 10^(- 8) quad "(9.13)" $ <round:mnorm>

have error below $5 dot.op 10^(- 12)$, even before the acceptance check $mono(m n o r m) < 2$: the root scale is at most 3601, and only a few positive operations occur. The final $10^(- 8)$ also covers the $2.1 dot.op 10^(- 11)$ factor-product perturbation. Hence

$ parallel M_(upright("stored")) parallel lt.eq mono(m n o r m) < 2 . $

The code’s $mono(n 0) = mono(m n o r m) thin mono(f r o o t) + 10^(- 9)$ is upward, and so is the first remainder coefficient $C = hat(pi) sqrt(8) thin mono(m n o r m) + 10^(- 7)$.

===== 9.5.2 Optional tensor improvement. <optional-tensor-improvement.>

For the exact stored M, let $A_(*)$ be the $30$-by-$30$ row Gram of the tensor map $cal(S)$ in Section 4. Its $\( a \, b \)$ entry is an M-column dot product times

$ \( upright(bold(e))_i - upright(bold(e))_j \) dot.op \( upright(bold(e))_(i') - upright(bold(e))_(j') \) \, $

with the edge sign repeated for the two real edge parts. The sign factor is an integer of magnitude at most two. A length-36 dot with products bounded by four therefore has error below $3 dot.op 10^(- 12)$ after that multiplication. Since $parallel M parallel < 2$, the ideal Gram entries have magnitude at most eight.

The Jacobi output U is used only if all its stored entries have absolute value at most two. For that exact stored U, the residual Gram $U^(*) U - I$ has computed entry error below $10^(- 12)$, since its dots have length 30 and absolute sum at most 121 including the identity term. Its 900 entry errors have Euclidean total at most $3 dot.op 10^(- 11)$. The residual Frobenius norm is at most 3631 at these loose entry bounds; its accumulation/root error is below $8 dot.op 10^(- 10)$. Thus

$ mono(b e t a) = "fl" \( parallel U^(*) U - I parallel_F \) + 10^(- 8) $

is an upper bound for the operator defect.

The computed product X differs from $A_(*) U$ by less than $2 dot.op 10^(- 10)$ per entry: input perturbation contributes at most $30 dot.op 2 dot.op 3 dot.op 10^(- 12)$, and its dot has absolute product sum at most 481. Exact product entries are at most 480. The further product $U^(*) X$ differs from $U^(*) A_(*) U$ by less than $1.3 dot.op 10^(- 8)$ per entry: at most $30 dot.op 2 dot.op 2 dot.op 10^(- 10)$ comes from X, and the length-30 dot contributes less than $2 dot.op 10^(- 10)$. Each absolute row sum therefore has error below $10^(- 6)$, including addition rounding at row scale below $900000$.

If $mono(b e t a) < .1$, the exact stored U is invertible and $parallel U^(- 1) parallel^2 lt.eq \( 1 - mono(b e t a) \)^(- 1)$. The exact matrix $U^(*) A_(*) U$ is symmetric. The inflated computed absolute-row bound $mono(r o w) + .0002$ therefore gives

$ parallel A_(*) parallel lt.eq frac(mono(r o w) + .0002, 1 - mono(b e t a)) . $

The update

$ C arrow.l min {C \, hat(pi) sqrt(frac(6 \( mono(r o w) + .0002 \), 1 - mono(b e t a))) + .00001} quad "(9.14)" $ <round:tensor-c>

is consequently safe. The denominator exceeds $.9$; at the displayed row scale the scalar evaluation error is below $10^(- 8)$, smaller than its final $.00001$. No eigensolver accuracy has been assumed.

===== 9.5.3 The horizontal-projector identity. <the-horizontal-projector-identity.>

An entry of the exact double-centering projector is the product of the two appropriate centering-matrix entries. The computed #raw("PI") differs by less than $10^(- 15)$ per entry. In the matrix $L_P$, each row has only 12 nonzero entries, with error below $1.3 dot.op 10^(- 13)$ from the edge products. Forming #raw("LP") gives error below $5 dot.op 10^(- 12)$ per entry against $L_P Pi$; the ideal entry magnitude is at most $8.4$. In the residual

$ Pi - T T^(*) - M L_P Pi $

each computed entry then has error below $10^(- 9)$. The propagated LP error is at most $30 dot.op 2 dot.op 5 dot.op 10^(- 12) = 3 dot.op 10^(- 10)$; the remaining PI, T-product, and short accumulation errors fit in the remainder of the budget, with absolute sum below 560. The 1296 entry errors have Frobenius total below $3.6 dot.op 10^(- 8)$. Norm accumulation is below $10^(- 8)$ even with residual norm 20161. Thus the actual $2 dot.op 10^(- 6)$ addition in #raw("id") suffices.

For $T^(*) T - I$, length-36 dots have errors below $1.2 dot.op 10^(- 12)$. With $k lt.eq 10$, their aggregate and norm error is below $10^(- 10)$. Projecting a stored T column by the row/column mean formula has component error below $10^(- 13)$: its row, column, and grand sums have lengths 6, 6, and 36 and entries bounded by two. The subtraction and Frobenius calculation of $\( I - Pi \) T$ have error below $10^(- 11)$. The $10^(- 8)$ additions in #raw("ort") and #raw("hor") cover these. We have therefore established, on every successful Root path,

$ parallel F \( P \) parallel & lt.eq mono(f r o o t) \, & parallel M parallel & lt.eq mono(m n o r m) \, & mono(m n o r m) mono(f r o o t) & lt.eq mono(n 0) \,\
parallel Pi - T T^(*) - M L_P Pi parallel & lt.eq mono(i d) \, & parallel T^(*) T - I parallel & lt.eq mono(o r t) \, & parallel \( I - Pi \) T parallel & lt.eq mono(h o r) . quad "(9.15)" $ <round:root-invariants>

The acceptance thresholds are $mono(i d) < 10^(- 4)$, $mono(o r t) \, mono(h o r) < 10^(- 5)$, $C < 20$, and $mono(m n o r m) < 2$. In particular

$ parallel T parallel lt.eq sqrt(1 + mono(o r t)) < 1.00001 . quad "(9.16)" $ <round:t-operator>

Signed permutation transport of stored P and T is exact before dephasing. The transported inequalities of Section 4 therefore use the same constants.

=== 9.6 Integer lifts, dephasing, and sphere distances <round:dephasing>

For $\| p_j \| lt.eq 4$, the three operations in unwrapped dephasing $p_(i j) - p_(i 0) - p_(0 j) + p_00$ have entry error below $8 dot.op 10^(- 15)$; their intermediate magnitudes are at most 8, 12, and 16. Subtracting the integer selected by #raw("nearbyint") gives error below $10^(- 14)$ against the exact dephase minus that same integer. A wrapped difference of two such arrays has error below $3 dot.op 10^(- 14)$ per entry against the ideal difference with the combined selected integers. The one-sided Candidate version, whose other array is already a stored dephased phase, has the same bound. These comparisons do not assume identical rounding choices for an independently formed ideal phase.

For a stored wrapped array, $\| z_j \| lt.eq 1 \/ 2$. Its row and column sums have error below $4 dot.op 10^(- 15)$, and its length-36 grand sum below $1.4 dot.op 10^(- 13)$. Dividing by 6 or 36 and combining the means gives projection-operation error below $10^(- 14)$ per component. Projection contracts the prior input error. Consequently the computed projected difference has Frobenius error below $10^(- 11)$. All distance-square and norm errors at the successful cutoffs below are negligible compared with $10^(- 7)$.

Thus #raw("Atlas::find")’s returned $sqrt(s) + 10^(- 7)$ is an upper distance for the selected ideal projected lift. A merge uses radius $r + upright("distance") + 10^(- 8)$ and checks a cap with $2 dot.op 10^(- 8)$ slack. Its sum-rounding error is below $10^(- 14)$. The same arithmetic applies to #raw("assign") and to the local sphere-radius additions. Searching only some buckets or transforms may miss a merge; it cannot certify a merge that fails these tests.

=== 9.7 Candidate conversion and ellipsoidal coverage <round:candidate>

The coverage estimates here are needed only after successful Candidate preparation, at final unitary-grid levels $N_u gt.eq 64$. Let $m_j = \| D_j \|$ denote an ideal comparison-block magnitude. The stored magnitude test $sqrt(mono("mag")_j) > .15$ implies $m_j > .14999998$. Normalizing D by its computed magnitude has unit-direction error below

$ frac(2 dot.op 4 dot.op 10^(- 9), .14999998) + upright("norm/division rounding") < 5.5 dot.op 10^(- 8) . $

Candidate additionally checks a computed chord smaller than $10^(- 7)$ between this normalized value and the exponential of its proposed phase. With (9.9), the true unit chord error is less than $1.56 dot.op 10^(- 7)$. If a circular phase distance in cycles is $v in \[ 0 \, 1 \/ 2 \]$, its chord is $2 sin \( pi v \) gt.eq 4 v$. Across 16 entries the phase-center correction therefore has norm below $1.56 dot.op 10^(- 7)$, and in particular below the $2 dot.op 10^(- 6)$ allowance used in Section 4. The nine seed entries use exact stored seed centers and an exact integer subtraction.

For the D-position coefficients X, the normalized-direction error times the Jacobian bound six, plus the $10^(- 8)$ Jacobian error and short-dot rounding, is below $10^(- 6)$ per entry. The other used X entries are exact. The $mono(m i)$ subtraction of $10^(- 6)$ therefore gives a positive magnitude lower bound greater than $.148$, and $mono(i n v m a g)_j = 1 \/ \( hat(m)_j - 10^(- 6) \) + 10^(- 9)$ is an upper bound for $1 \/ m_j$, below $6.8$.

The flat-sum error is below $10^(- 6)$, so the $10^(- 5)$ addition in #raw("slack"), followed by its additional $10^(- 10)$, gives the required nonnegative weighted chord-square upper bound. In the passed branch $q < 3.8$ and $1 - q \/ 4 > .049$. The arithmetic in dividing #raw("slack") by #raw("mi") has error below $10^(- 12)$: #raw("slack")$< 4.1$ and the denominator is above $.148$. The ratio $\( 1 - q \/ 4 \)^(- 1 \/ 2)$ has error below $10^(- 12)$ before its $10^(- 7)$ addition; the denominator lower bound bounds the derivative, and $q \/ 4$ is a binary scaling. The remaining positive products/roots, and the division by $\( 2 pi \)^2$ in #raw("d2"), each have error below $10^(- 12)$ before their $10^(- 8)$ additions. In particular the stored quantities are upper bounds with

$ mono(a r c) < 8.8 \, #h(2em) mono(w e i g h t e d) < 10 \, #h(2em) mono(i n v m a g)_j < 6.8 . quad "(9.17)" $ <round:candidate-scales>

===== 9.7.1 The direct distance bound. <the-direct-distance-bound.>

If #raw("nd")$lt.eq .145^2$, the ideal horizontal difference $Delta$ has norm below $.146$. Its computed squared norm has error below $10^(- 10)$ by Section 9.6. Each pairing of $Delta$ with an X column has error below $7 dot.op 10^(- 7)$: the D-part column error has norm at most $4 dot.op 10^(- 6)$, the ideal column norm is below 25, and

$ .146 dot.op 4 dot.op 10^(- 6) + 25 dot.op 10^(- 11) + upright("dot rounding") < 7 dot.op 10^(- 7) . $

At $R_s < .203$ and $h < .05$, the two linear support terms have combined error below $10^(- 6)$. The D-subnorm error is below $2 dot.op 10^(- 11)$ and its infinity-norm error below $10^(- 11)$; the latter remains harmless even after multiplication by $8.8^3 \/ 6$. For the alternative support, the weighted norm on exact stored positive #raw("invmag") has component perturbation at most $sqrt(6.8) thin 10^(- 11)$, plus positive square/norm rounding. The weights themselves are upper bounds. Thus either support can be low by less than $2 dot.op 10^(- 6)$, and their minimum has the same property.

The code adds $.0001$ to that minimum before division by $pi$. This covers the support error, the $10^(- 10)$ squared-distance error, the error in division by $pi$, and the remaining positive additions in the square-root argument. The final $.00001$ covers the center correction $2 dot.op 10^(- 6)$ and square-root rounding. Consequently #raw("s0") is a valid upper bound for the true aligned solution distance.

===== 9.7.2 Tangent offsets and external errors. <tangent-offsets-and-external-errors.>

The computed #raw("off") approximates $2 pi T^(*) Delta$ within $10^(- 9)$ in norm, by (9.16), the projected difference error, and short-dot rounding. The error in the whole X array is at most $sqrt(208) thin 10^(- 6)$ in Frobenius norm; there are 13 columns and 16 affected positions. Multiplication by $T^(*)$ and the less than $2 dot.op 10^(- 13)$ rounding of each dot give

$ parallel mono(A B) - T^(*) X_(upright("ideal")) parallel < 1.5 dot.op 10^(- 5) . quad "(9.18)" $ <round:ab-error>

The parameter-vector norm is below $sqrt(.203^2 + 4 \( pi \/ 64 \)^2) < .226$, so substitution of stored AB costs less than $3.4 dot.op 10^(- 6)$ radians. Formation of the corner offsets adds less than $10^(- 11)$, using coefficients of magnitude below 25. The same bound applies to convex combinations of these corners.

Using raw rather than projected angular displacement costs at most

$ mono(h o r) sqrt(R_s^2 + mono(a r c)^2) < 8.81 dot.op 10^(- 5) quad upright("radians") \, $

and the center correction costs at most $2 pi sqrt(1 + mono(o r t)) thin 2 dot.op 10^(- 6) < 1.27 dot.op 10^(- 5)$ radians. The row-subnorm factor multiplying the sine remainder has downward arithmetic error below $10^(- 10)$ even after its $mono(a r c)^3 \/ 6$ factor, by positive square/norm propagation. Adding these errors and (9.18)’s effect gives less than $.00012$ radians in either appropriate tangent bound, excluding the covariance/ell error treated next. The code adds $.00015$ radians and then further cycle-unit slack of $.00002$.

===== 9.7.3 Covariance domination. <covariance-domination.>

For the first covariance, compare the exact stored symmetric G with the mathematical covariance using the #emph[stored] AB, $R_s$, and E, and rational $beta = .45$. Each nine-term AB outer-product dot has absolute sum at most $9 dot.op 25^2 = 5625$ and error below $1.3 dot.op 10^(- 11)$. Its multiplier $1.45 R_s^2$ is below $.06$. The D2 dots have 16 products, bounded even by four each. Including coefficient translation, products, sums, and the intended diagonal addition gives total entry error below $10^(- 11)$.

For the second covariance, use stored #raw("weighted") and #raw("invmag"), with rational $beta = .8$. Each Dweighted dot has absolute sum less than $16 \( 1.00001 \)^2 dot.op 6.8 < 110$. Its two-product-per-term accumulation has error below $5 dot.op 10^(- 13)$ by (9.3) with one extra factor. The multiplying coefficient is below 225. Coefficient translation and the subsequent arithmetic, even at absolute intermediate scale 26000, give total entry error below $10^(- 9)$. Both G arrays are explicitly stored symmetrically. The added $10^(- 7) I$ dominates $k$ times either entry-error bound for $k lt.eq 10$. Hence the exact stored G is positive semidefinite and dominates the required covariance in each case. This conclusion does not depend on numerically observed positive eigenvalues.

=== 9.8 The spectral and inverse-quadratic-form bounds <round:ell>

#thm([Lemma 9.3.])[
  (The stored spectral upper bound).  #emph[For an exact stored symmetric $k$-by-$k$ matrix G with $k lt.eq 10$ and $\| G_(i j) \| lt.eq 10$, #raw("spectralUpper") returns an upper bound for $parallel G parallel$.]
] <round:spectral>

#proof[
  An absolute row sum has error below $3 dot.op 10^(- 13)$ by (9.3) or direct positive-sum propagation. The code adds $10^(- 10)$ to their maximum. For its other bound, put $m = max_(i j) \| G_(i j) \|$ and $A = parallel G^2 parallel_F$. Each computed G-squared dot has error below $3 dot.op 10^(- 14) m^2 + 10^(- 297)$: it has ten products and absolute sum at most $10 m^2$. Symmetry implies $A gt.eq m^2$, because one diagonal sum of squares contains a term $m^2$. The 100 dot errors and the norm evaluation therefore give
  $ \| "fl" \( sqrt(mono(f r o 4)) \) - A \| < 4 dot.op 10^(- 13) A + 10^(- 139) . $
  This remains valid when individual off-diagonal dots cancel or underflow. Taking the next square root, by the inequality used in Lemma 59, costs less than $4 dot.op 10^(- 13) sqrt(A) + 10^(- 69)$ before its own tiny rounding. Since $sqrt(A) lt.eq 100$, the total possible downward error is less than $10^(- 10)$. The code adds $2 dot.op 10^(- 7)$. The exact fourth-norm quantity $sqrt(parallel G^2 parallel_F)$ bounds $parallel G parallel$. Both returned candidates are upper bounds, so their minimum is also an upper bound. In particular its value #raw("gu") is nonnegative and at most $100.1$. ◻
]

The #raw("ell") guard checks symmetry and $\| G_(i j) \| lt.eq 10$, and checks each offset component to have magnitude at most ten. Its invalid return value 100 cannot certify a cell: after conversion to cycles it exceeds 10, so the associated bootstrap path returns its nonsuccess sentinel. A different valid bound may still succeed. For valid data the initial triangle bound is $sqrt(mono(m x)) + sqrt(mono(g u)) + 10^(- 8)$. Here $mono(m x)$ is the maximum squared offset norm. Its norm error is below $10^(- 13)$ and the triangle bound is upward and smaller than 43.

For each proposed resolvent parameter, interpret stored $mono(g a m) = gamma$ as exact. The proposal formula and the input scales give $0 < gamma < 418$. Since #raw("gu") is an upper spectral bound,

$ mono(g a p) = "fl" \( gamma - mono(g u) - 10^(- 9) \) lt.eq gamma - lambda_max \( G \) . quad "(9.19)" $ <round:gap>

The two subtraction errors are below $2 dot.op 10^(- 13)$, absorbed by $10^(- 9)$. Only a stored gap of at least $10^(- 6)$ is used. Allowing literal translation still gives a gap above $.999 dot.op 10^(- 6)$ for scale estimates.

For one offset vector U, the trial solve is used only if each stored $\| z_i \| < 10^8$. Let $s_z = max \( 1 \, parallel z parallel_oo \)$. Its exact residual is $r = U - gamma z + G z$. The following local bounds hold:

table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Computed quantity
], table.cell(rowspan: 1, colspan: 1)[Error against exact stored-input expression
], table.cell(rowspan: 1, colspan: 1)[Scale
]),
  table.cell(rowspan: 1, colspan: 1)[each residual component
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 12) s_z$
], table.cell(rowspan: 1, colspan: 1)[absolute sum $lt.eq 528 s_z$
],
  table.cell(rowspan: 1, colspan: 1)[residual norm
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 11) s_z$
], table.cell(rowspan: 1, colspan: 1)[norm $lt.eq sqrt(10) thin 528 s_z$
],
  table.cell(rowspan: 1, colspan: 1)[U–z dot
], table.cell(rowspan: 1, colspan: 1)[$3 dot.op 10^(- 13) s_z$
], table.cell(rowspan: 1, colspan: 1)[absolute sum $lt.eq 100 s_z$
],
  table.cell(rowspan: 1, colspan: 1)[U norm
], table.cell(rowspan: 1, colspan: 1)[$10^(- 13)$
], table.cell(rowspan: 1, colspan: 1)[norm $lt.eq sqrt(1000)$
],
)

For example the component bound follows from at most twelve terms and the scale 528 using (9.3); its aggregate contributes at most $sqrt(10) thin 2 dot.op 10^(- 12) s_z$ to the norm, and (9.4) adds less than $5 dot.op 10^(- 12) s_z$. The dot and U-norm bounds are the same lemmas at lengths ten.

The exact inverse quadratic form satisfies

$ U^(*) \( gamma I - G \)^(- 1) U lt.eq U^(*) z + frac(parallel U parallel parallel r parallel, gamma - lambda_max \( G \)) . quad "(9.20)" $ <round:resolvent-residual>

Indeed $\( gamma I - G \)^(- 1) U = z + \( gamma I - G \)^(- 1) r$. The code forms the right-hand-side upper using

$ #scale(x: 120%, y: 120%)[\(] mono(d o t v) + 10^(- 10) s_z #scale(x: 120%, y: 120%)[\)] + frac(\( sqrt(mono(u n)) + 10^(- 10) \) \( sqrt(mono(r e s)) + 10^(- 10) s_z \), mono(g a p)) \, quad "(9.21)" $ <round:ell-upper-code>

with the shown binary64 operations. The rounded dot part exceeds $U^(*) z$ by at least $9 dot.op 10^(- 11) s_z$ and has magnitude at most $101 s_z$. The first rounded norm factor is at least $\( 1 + 2 dot.op 10^(- 12) \) parallel U parallel$, because $parallel U parallel lt.eq sqrt(1000)$; the second is at least $parallel r parallel$. Together with (9.19), product/division rounding therefore leaves a quotient B such that the required exact quotient in (9.20) is at most $\( 1 - 10^(- 12) \) B$. This quotient is finite and below $6 dot.op 10^18$ by the displayed norm scales and the gap lower bound. The final addition’s possible error is at most $u \( 101 s_z + B \) + tau$, which is smaller than the surplus $9 dot.op 10^(- 11) s_z + 10^(- 12) B$. Thus (9.21) is an upper bound even when its dot part is negative and cancellation occurs.

Taking the maximum with zero and over the offsets gives #raw("high"). The ellipsoid formula of Section 4 then uses $sqrt(gamma \( 1 + mono(h i g h) \)) + 10^(- 6)$. There is no overflow at the stated scales. If this candidate can lower the existing bound below 43, its exact unrounded root is less than 44; its scalar downward error is then below $10^(- 12)$, covered by $10^(- 6)$. A candidate that cannot improve the existing upper need not have a tighter absolute estimate. The routine adds another $10^(- 6)$ at return. Cholesky accuracy has not entered this argument; it merely proposes the checked stored z.

===== 9.8.1 Bootstrap and saved radii. <bootstrap-and-saved-radii.>

Together with Section 9.7, this establishes the tangent upper whenever its bootstrap path is usable. The bootstrap guard requires $0 lt.eq mono(i n i t) < 3$, $0 lt.eq t < 10$, and $C < 20$, with previously certified nonnegative Root constants. It first adds $.00002$ to t and $10^(- 6)$ to the distance upper. At a current upper $s lt.eq 3.00001$, the normal polynomial $mono(n 0) + mono(i d) s + C s^2$ is below 181. Its positive-operation error, the tangent-factor error, and the two-component norm error total less than $10^(- 12)$; there are only a few products/sums, and (9.4) applies at norm scale 181. The update’s $10^(- 8)$ addition is sufficient. Accepting an improvement therefore preserves the upper inductively, and stopping keeps the preceding valid upper. This is a finite sequence of up to 30 upper-bound improvements, not a convergence assertion. The subsequent positive additions in saved sphere radii preserve the same inequalities.

=== 9.9 Refinement relations, tangent grids, and radius updates <round:refinement>

The B inputs are genuine earlier Root certificates. In addition, #raw("validate") enforces $0 lt.eq R lt.eq .126$, $0 lt.eq C < 20$, $0 lt.eq mono(n 0) \, mono(f r o o t) < 10^(- 6)$, $0 lt.eq mono(i d) < 10^(- 4)$, $0 lt.eq mono(o r t) \, mono(h o r) < 10^(- 5)$, $0 lt.eq mono(m n o r m) < 2$, $0 lt.eq k lt.eq 10$, and $\| p_j \| lt.eq 4$. The stored T entries pass the range check $\| T_(j a) \| lt.eq 1.01$; their stronger operator bound is (9.16), supplied by the genuine Root certificate.

===== 9.9.1 The relation initialization. <the-relation-initialization.>

On a passed raw-difference/cut path, Section 9.6 gives a projected-difference error below $10^(- 11)$ in norm, and the computed cutoff implies $parallel d_q parallel < .251$ for the ideal chosen lift. More precisely, #raw("cut") is at most the stored #raw(".249"). The passed norm check, with its #raw("1e-6") allowance, therefore gives $accent(parallel d_q parallel, ̂) < .249002$, including literal and operation errors. Each computed $eta_(q \, a) = T_a^(*) d_q$ has error below $1.1 dot.op 10^(- 11)$: multiply the projection error by the norm-$< 1.00001$ T column and include a length-36 dot. For $n_q = parallel \( I - T T^(*) \) d_q parallel$, combine the $d_q$ error with

$ parallel T parallel sqrt(10) thin 1.1 dot.op 10^(- 11) $

and the short entrywise products and final norm. The result is below $5 dot.op 10^(- 11)$. The actual $10^(- 8)$ addition to #raw("nq") is sufficient.

Writing $o = mono(o r t)_P$, the ideal quantities in Section 5 are bounded by the stored fields

$ mono(t o t a l) & = R + accent(parallel d_q parallel, ̂) + 10^(- 8) \,\
mono(n u 0) & = mono(n 0)_P + mono(i d)_P R + C_P R^2 + mono(n q) + 10^(- 8) \,\
mono(l a m) & = mono(i d)_P + C_P mono(t o t a l) + 10^(- 8) \,\
mono(e) & = mono(m n o r m)_P mono(f r o o t)_Q + 10^(- 7) . $

Their ordinary positive-operation errors are below $10^(- 13)$, and their input errors have already been covered. The following loose scales hold on every passing path:

$ mono(t o t a l) < .377 \, #h(2em) mono(n u 0) < .58 \, #h(2em) mono(l a m) < 7.55 \, #h(2em) mono(e) < 2.2 dot.op 10^(- 6) . quad "(9.22)" $ <round:b-init-scales>

For the second bound, use $parallel I - T T^(*) parallel lt.eq 1 + o$ and $parallel d_q parallel < .251$; the parent normal polynomial at $R lt.eq .126$ is below $.318$. For the first, the sharper stored-norm bound above gives

$ mono(t o t a l) < .126 + .249002 + 10^(- 8) + 10^(- 12) < .375003 < .377 \, $

where $10^(- 12)$ covers literal translation and the two additions. The remaining inequalities follow from these range bounds.

For the cross-normal factor $sigma$, the code first projects each child T column, giving S, and then forms $W = \( I - T T^(*) \) S$. A projected component has error below $10^(- 13)$. Its dot with a parent column has error below $7 dot.op 10^(- 13)$ against the exact projected dot: the projection error has norm below $6 dot.op 10^(- 13)$, and the remaining dot rounding is small. At most ten such terms in W give component error below $10^(- 11)$. Exact W column norms are below $1.01$, since both projection and the checked T operators are bounded. Thus the W-column Gram has entry errors below $2 dot.op 10^(- 10)$: two column perturbations each of norm at most $6 dot.op 10^(- 11)$, times $1.01$, plus a length-36 dot suffice. The spectral perturbation is below $2 dot.op 10^(- 9)$. The Gram is explicitly stored symmetrically and passes $\| G_(i j) \| lt.eq 2$, so Lemma 61 applies. The returned

$ mono(s i g) = sqrt(mono(s p e c t r a l U p p e r) \( G \) + 10^(- 7)) + 10^(- 8) $

is an upper bound. The inner addition exceeds the Gram perturbation and any final scalar addition rounding; the outer one exceeds the square-root rounding. Its value is below $4.6$, already from the absolute-row bound. For zero child tangent columns, $sigma = 0$ is exact.

===== 9.9.2 The upper-bound iteration and the rho search. <the-upper-bound-iteration-and-the-rho-search.>

Interpret a passed input $t$ as an exact stored upper bound on the desired tangent distance, or as a threshold for the entire interval of distances below it. The guard is $0 lt.eq t lt.eq 2$. The initial increase of $t$ by $2 dot.op 10^(- 8)$ and the $10^(- 9)$ addition in $z = sqrt(1 + o) thin t + 10^(- 9)$ ensure the parent tangent upper. Both initial distance choices, #raw("total") plus $10^(- 8)$ and $"hp" \( z \, mono(n u 0) \) + 10^(- 8)$, are valid. With $o_c = mono(o r t)_Q$, each iteration forms upper bounds corresponding to

$ v & = min { mono(n u 0) \, \( 1 + o \) d \, mono(l a m) thin d + mono(e) } + 10^(- 8) \,\
e_p & = \( 1 + o \) sqrt(\( 1 + o \) \( 1 + o_c \)) thin t + mono(s i g) thin v + 10^(- 8) \,\
d_1 & = "hp" \( z \, v \) + 10^(- 8) \,\
d_2 & = "hp" #scale(x: 120%, y: 120%)[\(] sqrt(1 + o_c) thin e_p \, thin mono(n 0)_Q + mono(i d)_Q d + C_Q d^2 #scale(x: 120%, y: 120%)[\)] + 10^(- 8) . $

Here v is a computed upper for the true normal distance. The distance update takes the minimum of the last two bounds only if it improves the previous upper. Throughout, the stored current distance is below $.378$, the normal upper below $.39$, $e_p < 3.9$, and the child normal polynomial below $2.9$. The $\( 1 + o \) d$ choice alone supplies the normal scale. At these scales each positive product/sum, factor, and two-component norm has total local downward error below $10^(- 13)$, including the child polynomial’s error before its use in the norm. This follows from fewer than twenty elementary operations per field, the displayed magnitudes, and (9.4); no small norm appears in a denominator. Thus every $10^(- 8)$ addition, and the $10^(- 9)$ in z, preserves the upper. The final $10^(- 8)$ addition also does so.

If the rho search returns $rho > 10^(- 7)$, a positive lower-endpoint update must have occurred. Its final stored #raw("lo") came from an actual trial with $mono(e v a l) \( mono(l o) \) < mono(t a r g e t) - 2 dot.op 10^(- 7)$. Every actual tangent distance at most this #raw("lo") is covered by that upper computation. The returned $rho = max \( 0 \, mono(l o) - 10^(- 8) \)$ is at most #raw("lo"); subtraction rounding at these scales is far smaller than $10^(- 8)$. This argument requires no monotonicity of rounded evaluations and no assertion that bisection finds a maximal valid threshold. For child-radius growth, #raw("eval") is directly recomputed at the assigned tangent-distance upper, inflated, and checked against the target.

===== 9.9.3 The base grid and the outside test. <the-base-grid-and-the-outside-test.>

Use the stored positive width $w_B$ as an exact grid parameter. The allowed range is $10^(- 4) lt.eq w_B lt.eq .05$. The stored grid radius $E = sqrt(1 + mono(o r t)_P) thin R + 10^(- 7)$ exceeds the true tangent radius by more than $.999 dot.op 10^(- 7)$. For $L = ceil.l E \/ w_B + .500001 ceil.r$, the quotient scale is at most 1261 and its error is below $10^(- 12)$. The $.000001$ excess over the half-cell term is much larger, so the integer base range covers $\[ - E \, E \]$ in every coordinate. In particular $L lt.eq 1262$. Exact base centers have magnitude below $.203$ per coordinate. Their computed products have error below $10^(- 16)$. Halving a stored width is exact here; after at most six subdivision levels, each computed center differs from the intended exact dyadic child center by less than $10^(- 15)$ per coordinate.

For a box center c and halfwidth h, its true minimum coordinate distance from zero is $\( \| c_a \| - h \)_(+)$. The code instead forms $\( \| hat(c)_a \| - h - 10^(- 8) \)_(+)$, whose exact value is no larger than the true one after all center and elementary-operation errors. If a box intersects the true tangent ball of radius $E_0$, the exact sum of these squared lower distances is at most $E_0^2$. The square-sum rounding is below $4 dot.op 10^(- 17)$ at $E_0 lt.eq .127$, while

$ E^2 - E_0^2 gt.eq 2 E_0 \( .999 dot.op 10^(- 7) \) + \( .999 dot.op 10^(- 7) \)^2 > 9.9 dot.op 10^(- 15) . $

This also handles $E_0 = 0$. Rounding of $E^2$ is smaller still. Consequently #raw("outside") cannot reject an intersecting box.

===== 9.9.4 Farthest corners and marking. <farthest-corners-and-marking.>

The corner-distance norm before its final margin has error below $5 dot.op 10^(- 11)$ against the exact box and exact $eta_q$: use the $eta_q$ component errors, center errors, and (9.4). Its $10^(- 8)$ addition is sufficient. For #raw("markRec"), each coordinate radius

$ \| hat(c)_a - hat(eta)_(q \, a) \| + w_B \/ 2 + 10^(- 8) $

already exceeds the true farthest coordinate distance. The accumulated square sum s, followed by $sqrt(s) + 2 dot.op 10^(- 8)$, therefore bounds the true farthest tangent distance, including its norm-rounding error. For $k > 0$, the final accumulated s has also passed comparison with $\( rho - 5 dot.op 10^(- 8) \)^2$ and $rho gt.eq 5 dot.op 10^(- 8)$. At $rho < .13$, square/comparison/root rounding costs less than $10^(- 14)$ in distance; hence

$ sqrt(s) + 2 dot.op 10^(- 8) lt.eq rho - 3 dot.op 10^(- 8) + 10^(- 14) < rho . $

For $k = 0$, the marked distance is $2 dot.op 10^(- 8)$, which is below the required positive rho threshold. Thus a marked box is wholly covered, and the child-radius update receives a valid tangent upper within rho. Heuristic integer ranges can miss marks but cannot mark a box without this whole-box test. Split-box use of the separate corner test has an additional $10^(- 8)$ comparison slack, and a direct successful snap assignment uses its own inflated #raw("eval") return and target comparison. The triangle merges following assignment were certified in Section 9.6.

=== 9.10 Single-vector filters and vector-ball construction <round:single>

The C stage validates its Root and $0 lt.eq r lt.eq .03$. At every bin resolution $M gt.eq 6$, the halfwidth, Euclidean bin radius X, one-norm bound, and infinity-norm bound are formed as

$ a & = .5 \/ M + 10^(- 12) \, & X & = sqrt(5 - 1 \/ 6) thin a + 10^(- 12) \,\
x_1 & = 5 a + 10^(- 12) \, & x_oo & = 1.5 a + 10^(- 12) . $

Their operations have error below $10^(- 14)$, and their $10^(- 12)$ additions are upward. They satisfy $X < .19$, $x_1 < .42$, and $x_oo < .126$. The stored tangent and normal bounds

$ r_t = sqrt(1 + mono(o r t)) thin r + 10^(- 9) \, #h(2em) r_n = mono(n 0) + mono(i d) r + C r^2 + 10^(- 9) $

are upper bounds, with $r_t < .030001$ and $r_n < .019$. The square-root/product and positive-polynomial errors are below $10^(- 13)$. The constant $K = 1.00001$, even allowing its literal translation error, exceeds the needed operator bound: the Root residual gives

$ parallel e \( P \) \/ sqrt(6) parallel lt.eq sqrt(1 + \( 2 pi sqrt(2) \/ 6 \) thin 10^(- 6)) < 1.00000075 < K . $

For bin or ball centers, put, as in Section 6,

$ q_(j i) = e \( u_j - P_(j i) \) \/ sqrt(6) \, #h(2em) S_i = sum_j q_(j i) \, #h(2em) c_i = \( \| S_i \|^2 - 1 \) \/ \( 4 pi \) . $

Let $J_(i j) = - Im \( overline(S)_i q_(j i) \)$ and $D_(i j)^(upright("re")) = Re \( overline(S)_i q_(j i) \)$. The following errors are uniform for the called arrays:

table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Entry error
], table.cell(rowspan: 1, colspan: 1)[Ideal magnitude bound
]),
  table.cell(rowspan: 1, colspan: 1)[q
], table.cell(rowspan: 1, colspan: 1)[$10^(- 13)$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ sqrt(6)$
],
  table.cell(rowspan: 1, colspan: 1)[S
], table.cell(rowspan: 1, colspan: 1)[$7 dot.op 10^(- 13)$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(6)$
],
  table.cell(rowspan: 1, colspan: 1)[$\| S \|^2$
], table.cell(rowspan: 1, colspan: 1)[$4 dot.op 10^(- 12)$
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[$\| S \|$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 12)$
], table.cell(rowspan: 1, colspan: 1)[$sqrt(6)$
],
  table.cell(rowspan: 1, colspan: 1)[c, J, $D^(upright("re"))$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 12)$
], table.cell(rowspan: 1, colspan: 1)[J and $D^(upright("re"))$ at most 1
],
  table.cell(rowspan: 1, colspan: 1)[B
], table.cell(rowspan: 1, colspan: 1)[$7 dot.op 10^(- 12)$
], table.cell(rowspan: 1, colspan: 1)[at most $sqrt(6) thin 1.00001$
],
)

Indeed the scaled exponential error is actually less than $2.5 dot.op 10^(- 14)$ before the loose $10^(- 13)$ allowance. Six terms and addition rounding give the S bound. Equation (9.6) gives less than $2 sqrt(6) \( 7 dot.op 10^(- 13) \)$ plus tiny arithmetic, below $4 dot.op 10^(- 12)$. Norm Lipschitz gives the magnitude bound. The companion products cost at most $\( 7 dot.op 10^(- 13) \) \/ sqrt(6) + sqrt(6) thin 10^(- 13)$ plus product rounding, below $10^(- 12)$. Finally $B_(i a) = sum_j J_(i j) T_(j i \, a)$, where $T_(j i \, a)$ is the entry at phase position $\( j \, i \)$ in tangent column a, has six terms, each T entry bounded by $1.00001$, so its input and short-dot errors are below $7 dot.op 10^(- 12)$.

===== 9.10.1 Direct bin filters. <direct-bin-filters.>

The scalar magnitude-change bound $2 pi \( x_1 \/ sqrt(6) + r \)$ and its squared thresholds have arithmetic error below $10^(- 10)$ at the displayed scales. The same holds for the aggregate norm threshold and the accumulated distance of $\( \| S_i \| - 1 \)_i$; the six magnitude errors, multiplied by bounded factors in their squares, are below $10^(- 10)$ in total. The lower scalar test is used only when the computed magnitude-change bound is below one. If the required ideal bound crosses one solely because of rounding, the tested lower square is of order at most $\( 10^(- 10) \)^2$, and the code subtracts $2 dot.op 10^(- 7)$ from it. Otherwise the squared lower threshold can be propagated on the correct side of one with the same $10^(- 10)$ allowance. Thus this conditional lower test is safe also at the crossing.

The scalar linear-support sums use at most five absolute J coefficients and a six-component J norm. Their input errors, the two alternative Taylor remainders, and the error in the maximum S magnitude give total possible underestimation below $10^(- 9)$. For example their linear input effects are at most $5 dot.op 10^(- 12) a + sqrt(6) thin 10^(- 12) r$; the remainder factors use only $X < .19$, $x_oo < .126$, $r lt.eq .03$, and $\| S_i \| lt.eq sqrt(6)$, and hence multiply the S/J perturbations by bounded factors below ten. The remaining positive scalar arithmetic is below $10^(- 10)$. All these direct exclusions use a $2 dot.op 10^(- 7)$ comparison margin.

===== 9.10.2 The directional single-vector support. <the-directional-single-vector-support.>

The heuristic solve is accepted only with finite coordinates and a maximum magnitude between $10^(- 100)$ and $10^100$. After division by that maximum, regard the resulting stored $\| y_i \| lt.eq 1$ as the exact test direction. Define the exact stored-coefficient expressions

$ a_y & = sum_i y_i c_i \, & h_a & = sum_i y_i B_(i a) \,\
z_j & = sum_i y_i J_(i j) \, & tilde(z)_j & = sum_i y_i D_(i j)^(upright("re")) \,\
N_J & = sum_(i \, j) y_i^2 J_(i j)^2 \, & N_S & = sum_i y_i^2 \| S_i \|^2 \,\
M_S & = max_i y_i^2 \| S_i \|^2 \, & m_y & = max_i \| y_i \| \,\
M_z & = max_j \( z_j^2 + tilde(z)_j^2 \) . $

The support compared with $\| a_y \|$ is the stored evaluation of

$ & a sum_(j > 0) \| z_j \| + r_t parallel h parallel + r_n sqrt(N_J)\
 & quad + pi [m_y \( K X + r \)^2 + min { sqrt(M_z) thin X \, K sqrt(N_S) thin x_oo } X + 2 sqrt(N_S) / sqrt(6) X r + sqrt(M_S) / sqrt(6) r^2] . quad "(9.23)" $ <round:c-single-support>

This is the necessary support bound from Section 6. Its coefficient errors against ideal arrays satisfy

$ \| Delta a_y \| < 7 dot.op 10^(- 12) \, #h(2em) \| Delta z_j \| \, \| Delta tilde(z)_j \| < 7 dot.op 10^(- 12) \, #h(2em) \| Delta h_a \| < 4.3 dot.op 10^(- 11) . $

The first two use six input errors and a short dot. The last uses six B errors and the same dot estimate.

The square roots in (9.23) are norms, so they are stable also near zero. For example $sqrt(N_J)$ is the norm of the 36 components $y_i J_(i j)$; their perturbation norm is at most $6 dot.op 10^(- 12)$ before arithmetic, below $10^(- 11)$ overall. Similarly $sqrt(N_S)$ is the norm of the complex components $y_i S_i$, and $sqrt(M_S)$ their maximum modulus; their errors are below $10^(- 11)$. Finally $sqrt(M_z)$ is the maximum norm of the two-component pairs $\( z_j \, tilde(z)_j \)$. Each such norm changes by at most $sqrt(2) thin 7 dot.op 10^(- 12) < 1.1 dot.op 10^(- 11)$. A maximum and a minimum of a fixed collection of approximate scalar values have error at most the largest of their component errors; no agreement of the selected index is needed.

For completeness, the linear h effect in (9.23) is below $.030001 sqrt(10) \( 4.3 dot.op 10^(- 11) \) < 4.1 dot.op 10^(- 12)$; the z effect is below $5 a \( 7 dot.op 10^(- 12) \) < 3 dot.op 10^(- 12)$; the normal term contributes less than $.019 dot.op 10^(- 11)$. The first Taylor-norm choice contributes less than $pi \( .19 \)^2 \( 1.1 dot.op 10^(- 11) \) < 1.3 dot.op 10^(- 12)$, and the alternative choice is smaller at the quoted scales. The mixed and pure-r terms contribute less than $2 pi \( .19 \) \( .03 \) 10^(- 11) \/ sqrt(6)$ and $pi \( .03 \)^2 10^(- 11) \/ sqrt(6)$. The remaining positive-factor arithmetic is below $10^(- 10)$, so the entire possible support undererror is below $10^(- 9)$. Together with the constant-pairing error, this is well inside the actual $2 dot.op 10^(- 7)$ comparison slack.

===== 9.10.3 Vector-ball radii. <vector-ball-radii.>

A rational bin midpoint is formed with error below $5 dot.op 10^(- 16)$ per variable. All stored centers used by clustering are finite and of magnitude at most two; this holds for new midpoint centers and is checked after each update. For a nonfar difference, wrapped subtraction and subtraction of its mean have Euclidean error below $2 dot.op 10^(- 14)$ against the exact projection for the selected integer choices. The six-component distance norm costs less than $10^(- 13)$ more. The last assignment therefore covers the entire bin by the radius

$ sqrt(mono(d s t)) + mono(l a y e r . x n o r m) + 10^(- 9) . $

For a newly inserted center, #raw("dst") is zero and the midpoint error alone is already covered. The final assignment pass does not move its centers. Intermediate averaging passes are only proposals, and the last radii are recomputed from actual assignments. Nonfinite or oversized centers, a failed radius check, or a cluster cap cause failure, not an exclusion.

=== 9.11 Pair edges and the joint directional test <round:joint>

Let two accepted vector balls have radii $s_0 \, s_1 < .1$. The stored pair radius $r_e = s_0 + s_1 + 10^(- 10)$ is an upper bound for their sum and satisfies $r_e < .201$. Each product $Q_j$ of the two stored unit phases has complex error below $1.3 dot.op 10^(- 13)$, its six-term sum S below $8 dot.op 10^(- 13)$, and its squared modulus below $1.1 dot.op 10^(- 11)$; the last uses $\| S \| lt.eq 6$ in (9.6). The edge constants and derivatives, for either O or U, have error below $10^(- 12)$ per real component. For the U derivative, for instance, the product of S with a unit coefficient is divided by six, leaving error at most

$ frac(8 dot.op 10^(- 13) + 6 \( 1.3 dot.op 10^(- 13) \), 6) + upright("short product rounding") < 10^(- 12) . $

The O constant is S divided by $2 pi$, and the U constant is $\( \| S \|^2 \/ 6 - 1 \) \/ \( 4 pi \)$, which satisfy the same budget.

The edge-remainder bounds are evaluated with an added $2 dot.op 10^(- 8)$. Their positive-operation error, including the input error in $\| S \|$, is below $10^(- 10)$; at $r_e < .201$ their uninflated values are below $.255$. The direct distance and support comparisons, including the O test in direction S and the norm $sqrt(mono(j j))$, have combined possible error below $10^(- 9)$. Indeed the latter norm has coefficient perturbation at most $sqrt(6) thin 10^(- 12)$; its multiplier is at most $6 r_e < 1.206$, and the constant/norm-S effects are at most the displayed $1.1 dot.op 10^(- 11)$ scale times bounded factors. Their actual comparison slack is $2 dot.op 10^(- 7)$.

For the joint test there are at most $6 + 6 + 2 = 14$ rows. The proposed direction is checked finite and normalized as before, so its stored entries have magnitude at most one. The constant pairing has error below $1.5 dot.op 10^(- 11)$. Each accumulated shared-Hadamard coefficient has error below $9 dot.op 10^(- 11)$, since it receives at most twelve B input errors of $7 dot.op 10^(- 12)$ plus short-dot rounding. Each vector-phase coefficient, including its edge contribution, has error below $9 dot.op 10^(- 12)$: six single-vector entries and at most two edge entries each contribute at most $10^(- 12)$.

Within each call to #raw("single::support"), the vector-phase coefficient array starts at zero. The pure-vector remainder is formed using its J sum and real companion sum before the joint routine adds the edge derivatives. Thus its maximum two-component coefficient norm has the same $1.1 dot.op 10^(- 11)$ error bound as in Section 9.10, with $X$ replaced by $s_t < .1$ and only the first coefficient-norm alternative retained. The weighting of the common B norm has input effect below

$ .030001 sqrt(10) thin 9 dot.op 10^(- 11) < 8.6 dot.op 10^(- 12) . $

Each vector-phase norm has perturbation at most $sqrt(6) thin 9 dot.op 10^(- 12)$, multiplied by $s_t < .1$. The two single-vector residual supports have the norm-Lipschitz errors just proved; the edge residual upper multiplies a direction norm of at most $sqrt(2)$ and has only ordinary bounded norm/product rounding. Adding these contributions and the positive scalar arithmetic gives total possible support undererror below $10^(- 8)$. The actual comparison adds $3 dot.op 10^(- 7)$. Together with the constant-pairing error this certifies the joint rejection. No edge deletion depends on accuracy of the heuristic solves or their weight updates.

=== 9.12 Finite paths and preservation of inconclusive cases <round:finite>

The preceding estimates apply to bounded finite certificate evaluations. We finish by explaining why exceptional heuristic values cannot bypass those preconditions.

+ In the seed cover, all direct lists come from finite integer midpoints and #raw("expair"). The dual solver’s entries must pass the negated bounded comparison $\| v_a \| lt.eq 10^4$; NaN and infinity fail it. A failed proposal leaves the large safe support bound. Gap/hash/reach cuts that are not necessary feasibility tests select only possible reuse attempts.
+ For A, a failed frame normalization makes setup fail, and the entry point records an unresolved seed ball. It does not certify that seed ball empty. The passed frames, fixed radius, and dyadic unitaries give finite bounded block coefficients. The potentially ill-conditioned solves only propose directions; the final #raw("trial::certificate") checks every direction entry and its maximum before use.
+ The snapping iteration calls #raw("gen"), which rejects nonfinite or out-of-range phases. Root certification requires $mono(v a l) < 10^(- 18)$, checks proposed eigenvalues finite, checks HV/LV before using them, and checks T before its certificate products. Those bounded arrays make the products finite. The optional tensor change of basis is range-checked; an unusable one cannot lower the previously valid C bound. The final conjunction of strict Root thresholds also rejects NaN.
+ Candidate’s inverse-angle output passes a finite range condition before its exponential and a unit-direction comparison afterwards. Its magnitude and chord guards bound every normalization. Failure is an unsuccessful coverage proposal. In #raw("ell"), the data are range/symmetry checked, invalid Cholesky pivots fail, and every final trial-solve coordinate is checked before a residual certificate is evaluated. The bounded residual scales exclude overflow. The explicit sentinel values are outside the usable bootstrap range or far above the target radius.
+ B/C operate on genuine certified Records and also enforce the stated numeric ranges in #raw("validate"). The read-time #raw("finish") may form floating dephasings before validation, but performs no conversion of those values to an integer index; validation rejects invalid phases before they can reach indexed geometric searches. B’s relation and grid formulas are then finite and bounded as proved above. A failed relation only removes a coverage opportunity; a failed live-box solve keeps the parent unresolved.
+ C’s direct scalar and pair formulas have bounded finite inputs and nonnegative square-sum arguments, so explicit finite checks at every individual arithmetic operation are unnecessary. Every potentially ill-conditioned directional solve is separately checked and normalized. Its failure keeps the bin or edge. Clustering checks final center and radius bounds; caps and incomplete graph searches report possibility/failure, as described in Section 6, rather than a negative certificate.

In particular, #raw("min")/#raw("max") are not used to turn an unchecked NaN from a heuristic solve into a valid small certificate. Within successful bound evaluations their inputs are finite, and a minimum of two established upper bounds remains an upper bound. Within proposal generation, a bad proposal is checked before it can justify an exclusion or cover. These facts also explain why a less successful heuristic or a different valid rounding outcome may increase unresolved work without invalidating a successful certificate.

===== 9.12.1 Summary of the comparison margins. <summary-of-the-comparison-margins.>

The following table collects the numerical separation used above; #emph[error] means the entire adverse comparison error or the stated local upper-bound error, not the error of an untrusted solver.

table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Certificate path
], table.cell(rowspan: 1, colspan: 1)[Established adverse error
], table.cell(rowspan: 1, colspan: 1)[Explicit margin
]),
  table.cell(rowspan: 1, colspan: 1)[seed gap / direct support
], table.cell(rowspan: 1, colspan: 1)[$10^(- 14)$ / $10^(- 11)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 8)$
],
  table.cell(rowspan: 1, colspan: 1)[shared-coordinate numerator
], table.cell(rowspan: 1, colspan: 1)[$< 3.5 dot.op 10^(- 11)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 7)$
],
  table.cell(rowspan: 1, colspan: 1)[shared-coordinate endpoints
], table.cell(rowspan: 1, colspan: 1)[$10^(- 7)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 5)$
],
  table.cell(rowspan: 1, colspan: 1)[seed dual support
], table.cell(rowspan: 1, colspan: 1)[$10^(- 4)$
], table.cell(rowspan: 1, colspan: 1)[$.01$
],
  table.cell(rowspan: 1, colspan: 1)[A flat norm
], table.cell(rowspan: 1, colspan: 1)[$10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 5)$
],
  table.cell(rowspan: 1, colspan: 1)[A directional comparison
], table.cell(rowspan: 1, colspan: 1)[$< 4 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$.0001$
],
  table.cell(rowspan: 1, colspan: 1)[Root identity Frobenius check
], table.cell(rowspan: 1, colspan: 1)[$< 5 dot.op 10^(- 8)$
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 6)$
],
  table.cell(rowspan: 1, colspan: 1)[Root orthogonal / horizontal checks
], table.cell(rowspan: 1, colspan: 1)[$10^(- 10)$ / $10^(- 11)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 8)$
],
  table.cell(rowspan: 1, colspan: 1)[tensor transformed row bound
], table.cell(rowspan: 1, colspan: 1)[$10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$.0002$
],
  table.cell(rowspan: 1, colspan: 1)[Candidate direct support
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 6)$
], table.cell(rowspan: 1, colspan: 1)[$.0001$
],
  table.cell(rowspan: 1, colspan: 1)[Candidate external tangent error
], table.cell(rowspan: 1, colspan: 1)[$.00012$ radians
], table.cell(rowspan: 1, colspan: 1)[$.00015$ radians
],
  table.cell(rowspan: 1, colspan: 1)[first / second G entry error
], table.cell(rowspan: 1, colspan: 1)[$10^(- 11)$ / $10^(- 9)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 7) I$
],
  table.cell(rowspan: 1, colspan: 1)[spectral row / fourth-norm bound
], table.cell(rowspan: 1, colspan: 1)[$3 dot.op 10^(- 13)$ / $10^(- 10)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 10)$ / $2 dot.op 10^(- 7)$
],
  table.cell(rowspan: 1, colspan: 1)[bootstrap update
], table.cell(rowspan: 1, colspan: 1)[$10^(- 12)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 8)$
],
  table.cell(rowspan: 1, colspan: 1)[B projected normal / local update
], table.cell(rowspan: 1, colspan: 1)[$5 dot.op 10^(- 11)$ / $10^(- 13)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 8)$
],
  table.cell(rowspan: 1, colspan: 1)[B cross-Gram spectral perturbation
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 9)$
], table.cell(rowspan: 1, colspan: 1)[$10^(- 7)$ before root
],
  table.cell(rowspan: 1, colspan: 1)[C direct / directional comparison
], table.cell(rowspan: 1, colspan: 1)[$10^(- 9)$
], table.cell(rowspan: 1, colspan: 1)[$2 dot.op 10^(- 7)$
],
  table.cell(rowspan: 1, colspan: 1)[C joint support
], table.cell(rowspan: 1, colspan: 1)[$10^(- 8)$
], table.cell(rowspan: 1, colspan: 1)[$3 dot.op 10^(- 7)$
],
)

The resolvent signed-addition argument is given separately in Section 9.8, since its absolute scale can be large and its proof uses both an absolute dot surplus and a relative quotient surplus. All margins in the table are used in the source at the places proved above; none is inferred merely from an observed distance from a threshold.


#bibliography("refs.bib", style: "ieee", title: [References])
