#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to Kaplansky's quasitrace conjecture and failure of tensor-product stable finiteness]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A unital $C^(*)$-algebra is #emph[stably finite] when every matrix algebra over it has no nonunitary isometry, and is #emph[properly infinite] when it contains two isometries with orthogonal ranges. Milhøj and Rørdam asked whether the minimal tensor product of two unital simple stably finite $C^(*)$-algebras must again be stably finite [8] Question 2.5. They proved that this question is equivalent to the quasitrace problem and that a negative answer to that problem would yield a properly infinite tensor product with $C_r^(*) \( bb(F)_oo \)$ [8] Section 2 and Theorem 3.1. We construct the required quasitrace counterexample. The resulting tensor product can be properly infinite with one factor equal to the reduced $C^(*)$-algebra $C_r^(*) \( bb(F)_2 \)$ of the free group on two generators.

A quasitrace retains positivity and the identity $tau \( x^(*) x \) = tau \( x x^(*) \)$, but is required to be linear only on commutative subalgebras, together with compatibility with real and imaginary parts. A $2$-quasitrace must also extend to the two-by-two matrix algebra. Whether this extra condition forces full linearity is the general quasitrace problem. It is equivalent to Kaplansky’s question whether every $A W^(*)$-factor of type $upright("II")_1$ is a von Neumann algebra; see [8] Section 2 and [4] Conjectures 1.1–1.2 and Theorem 4.11. Here the term #emph[von Neumann algebra] has its abstract $W^(*)$ meaning: the $C^(*)$-algebra admits a Banach-space predual.

Gow’s historical account explains that Kaplansky introduced $A W^(*)$-algebras in 1951 to characterize $W^(*)$-algebras by intrinsic algebraic conditions, independent of a chosen Hilbert-space representation. The factor types have different outcomes: every type $upright(I)$ $A W^(*)$-factor is a $W^(*)$-algebra, whereas type $upright("III")$ counterexamples exist. The type $upright("II")_1$ factor question is the finite case addressed here [4] Introduction.

Quasitraces also connect the projection-theoretic origins of the question to dimension theory for general $C^(*)$-algebras. Cuntz developed dimension functions for simple algebras [3], and Blackadar and Handelman established the correspondence between $2$-quasitraces and lower semicontinuous dimension functions [1]. Haagerup credits Blackadar and Handelman with proving that a positive answer to Kaplansky’s factor question would imply that every $2$-quasitrace on a unital $C^(*)$-algebra is a trace. He also recalls their realization of such quasitraces as pullbacks of quasitraces on finite $A W^(*)$-algebras along unital $*$-homomorphisms [6] Introduction and Proposition 3.3. Blackadar and Rørdam later developed the extension of states on preordered semigroups that underlies the general existence criterion [2].

The exact case was settled by Haagerup: every $2$-quasitrace on a unital exact $C^(*)$-algebra is a trace [6] Theorem 5.11. A first draft was completed in 1991 and circulated thereafter; the paper was published in 2014. Without exactness, the existence of quasitraces is governed by a different condition. The Cuntz–Blackadar–Handelman existence theorem provides a normalized $2$-quasitrace whenever no matrix algebra over the given unital algebra is properly infinite [8] Theorem 2.3. Thus a unital algebra with that property but without tracial states would answer the general question negatively.

We construct such an algebra and obtain a fixed positive pair witnessing nonadditivity. Throughout, a normalized $2$-quasitrace has value one on the unit of its domain; its corner-preserving extension to $M_2$ has value two on the matrix identity. The definitions are recalled in Section 2.

#thm([Theorem 1.1.])[
  #emph[There exist a separable unital complex $C^(*)$-algebra $A$, admitting a normalized $2$-quasitrace, and positive contractions $a \, b in A$ such that every normalized $2$-quasitrace $tau$ on $A$ satisfies 
$ tau \( a + b \) - tau \( a \) - tau \( b \) gt.eq 1 / 144 . $

]
] <thm:main>

Theorem 1 refutes the conjecture that every normalized $2$-quasitrace on every unital complex $C^(*)$-algebra is a tracial state. By the equivalence recalled above, it also gives a negative answer to Kaplansky’s $upright("II")_1$ $A W^(*)$-factor question. The constructed algebra is necessarily nonexact, by Haagerup’s result.

The matrix-extension requirement is essential to this conclusion. Haagerup reports Kirchberg’s 2006 unpublished example of a $1$-quasitrace that is not a $2$-quasitrace, and hence is not a trace [6] Introduction. This example lacks the matrix extension required here. Gow’s recent work places the established factor–quasitrace equivalence alongside further equivalent formulations involving maximal abelian subalgebras and bidual retractions [4] Theorem 4.11.

The tensor-product conclusion and two related consequences can be stated together. All tensor products below are minimal $C^(*)$-tensor products.

#thm([Corollary 1.2.])[
  (Tensor products and stable finiteness).  #emph[]
  + #emph[There are two unital simple stably finite complex $C^(*)$-algebras whose minimal tensor product is properly infinite. One factor can be taken to be $C_r^(*) \( bb(F)_2 \)$.]
  + #emph[There is a separable unital complex $C^(*)$-algebra $B$ admitting a normalized $2$-quasitrace such that $B ⊗_min C_r^(*) \( bb(F)_2 \)$ is properly infinite and admits no normalized $2$-quasitrace.]
  + #emph[There is a separable unital stably finite complex $C^(*)$-algebra with no tracial state.]
] <cor:stable-finiteness>

The three assertions use related but different algebras. The simple tensor-product example comes from a non-von-Neumann $A W^(*)$-factor of type $upright("II")_1$, with no separability assertion for that factor. The quasitrace-loss example uses the explicit separable algebra $B$ constructed below; we prove that no matrix algebra over $B$ is properly infinite, not that $B$ is stably finite. A finitely generated subalgebra of the $A W^(*)$-factor gives the separable stably finite traceless example, without a simplicity assertion. The short deductions from established trace-obstruction and tensor-product results are given in Section 6.

=== The construction <the-construction>

We first build a unital algebra $B = C^(*) \( 1 \, x_1 \, dots.h \, x_24 \)$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ sum_(i = 1)^24 x_i^(*) x_i = 1 \, #h(2em) sum_(i = 1)^24 x_i x_i^(*) lt.eq 2 / 3 thin 1 \, $ <eq:intro-relations>]

while no $M_m \( B \)$, $m gt.eq 1$, contains two isometries with orthogonal ranges. A tracial state would make the two sums in (1.1) have the same value, so $B$ has none. These relations instantiate Haagerup’s characterization of the absence of tracial states by a finite tuple with column sum one and a strict row bound [6] Lemma 2.1. Milhøj and Rørdam proposed separating a uniformly bounded length of such a tuple from increasingly delayed matrix proper infiniteness [8] Remark 4.7. The construction below uses a bounded product and a generated subalgebra, with a separate test for every matrix size and polynomial degree. The fixed number of generators preserves the trace obstruction while all finite polynomial candidates are excluded.

The generators are shifts between finite-rank vector bundles. For each pair of positive integers $\( m \, R \)$, we choose a compact base $Y_(m \, R)$ and bundles $E_j arrow.r Y_(m \, R)$ for all $j gt.eq 0$, with $E_0$ trivial. Only levels $0 \, dots.h \, R$ enter the finite topological test. A polynomial matrix $P in M_(m \, 2 m) \( B \)$ whose entries contain only words of length at most $R$ restricts to a bundle map

$ P_0 : E_0^(xor 2 m) arrow.r (xor.big_(j = 0)^R E_j)^(xor m) . $

The target’s Chern class forbids the trivial image bundle that would result from $P^(*) P gt.eq 1 / 2 I$. Write $S_i^(m \, R) \( y \)$ for the corresponding forward shift on the Hilbert direct sum $xor.big_(j gt.eq 0) E_j \( y \)$. Uniform norm bounds allow the simultaneous definitions

$ x_i = #scale(x: 120%, y: 120%)[\(] S_i^(m \, R) \( y \) #scale(x: 120%, y: 120%)[\)]_(m \, R gt.eq 1 \, #h(0.27778em) y in Y_(m \, R)) \, #h(2em) B = C^(*) \( 1 \, x_1 \, dots.h \, x_24 \) \, $

in one bounded operator product. The number of generators and the row bound in (1.1) are uniform, while the bundle ranks and base dimensions may depend on $\( m \, R \)$. A polynomial matrix approximating a candidate pair of isometries has the same coefficients at every coordinate. Its finite degree selects one of the tests already present in the product, which obstructs that approximation.

The topological obstruction follows the use of characteristic classes in the constructions of Villadsen [13] Section 3 and Rørdam [10] Proposition 4.5. Here projective-space factors retain a nonzero Chern class after a controlled trivial summand is allowed. The parameters are selected anew for each finite test.

Two ingredients keep the expansion and the topological obstruction compatible. First, a family of bundle maps whose collective image expands every source subspace by a factor of two can be normalized continuously to have column sum one and row sum at most $2 \/ 3$. The determinant-potential approach is related to operator scaling [5] Section 4 and to geodesically convex matrix optimization [12] Corollary 2.11. We prove strict convexity and existence of a unique minimizer for the present rectangular maps; uniqueness makes the normalization compatible with changes of bundle frame. Second, the bundle tests separate small and large source subspaces: sixteen maps into reduced copies of old line bundles handle the small ones, while eight generic maps into a new line-bundle block handle the large ones. This keeps the generator count fixed as the matrix size and word-length bound increase.

Finally, set $A = M_48 \( B \)$ and apply Theorem 3 directly to $A$. A finite telescoping construction, using only linearity on commuting elements, gives the pair in Theorem 1. This last step works for every normalized $1$-quasitrace on $A$, hence for every normalized $2$-quasitrace there, and requires no formula for a chosen quasitrace.

=== Organization <organization>

Section 2 records the operator-algebra conventions and the existence theorem. Section 3 proves the incidence and scaling lemmas. The finite bundle tests are assembled in Section 4. Section 5 constructs $B$, excludes proper infiniteness in every matrix size, exhibits the positive pair, and completes the proof of Theorem 1. Section 6 proves Corollary 2.

== 2 Quasitraces and proper infiniteness <sec:preliminaries>

All $C^(*)$-algebras in this paper are complex, and all matrix algebras carry their usual $C^(*)$-norms. For a unital $C^(*)$-algebra $C$, a #emph[$1$-quasitrace] is a function $tau : C arrow.r bb(C)$ satisfying

+ $tau \( x^(*) x \) = tau \( x x^(*) \) gt.eq 0$ for every $x in C$;
+ $tau \( h + i k \) = tau \( h \) + i tau \( k \)$ for self-adjoint $h \, k in C$;
+ the restriction of $tau$ to every abelian $C^(*)$-subalgebra of $C$ is complex linear.

It is a #emph[$2$-quasitrace] if a $1$-quasitrace on $M_2 \( C \)$ restricts to $tau$ on the upper-left corner. It is #emph[normalized] when $tau \( 1_C \) = 1$. The extension then has value two at $1_(M_2 \( C \))$: the two diagonal corner units have the same value by (i) and their values add by (iii).

A unital $C^(*)$-algebra $C$ is #emph[properly infinite] when it contains isometries $s_1 \, s_2$ with orthogonal ranges. Equivalently,

$ s_i^(*) s_j = delta_(i j) 1_C \, #h(2em) i \, j in { 1 \, 2 } . $

It is #emph[stably properly infinite] if $M_m \( C \)$ is properly infinite for some positive integer $m$. Absence of stable proper infiniteness is the condition needed below; no assertion about finiteness of every projection is required.

#thm([Theorem 2.1.])[
  (Quasitrace existence).  #emph[A unital $C^(*)$-algebra $C$ admits a normalized $2$-quasitrace if and only if $M_m \( C \)$ is not properly infinite for every positive integer $m$.]
] <thm:existence>

We use Theorem 3 in the formulation of [8] Theorem 2.3, with the normalization and matrix-extension conventions fixed at the start of its Section 2. Cuntz’s work on dimension functions [3] precedes the general criterion. The correspondence between $2$-quasitraces and lower semicontinuous dimension functions is due to Blackadar–Handelman [1] Theorems II.2.2 and II.3.1; the extension of semigroup states underlying this formulation is discussed in [2]. In particular, Theorem 3 has no exactness, simplicity, or representation assumption.

For finite-rank complex vector bundles, Hermitian metrics are fixed. Adjoints, positive endomorphisms, and their square roots are taken fiberwise. A positive lower bound on the adjoint square of a continuous bundle map makes it injective with a continuous image subbundle: if $W^(*) W$ is invertible, then

$ Q = W \( W^(*) W \)^(- 1 \/ 2) \, #h(2em) Q^(*) Q = I \, $

has the same image, and $Q Q^(*)$ is its continuous orthogonal projection. We will use this observation when passing from polynomial operators to the Chern-class obstruction.

== 3 Two bundle-map lemmas <sec:bundle-map-lemmas>

We first construct maps whose collective images expand subspaces. We then normalize such a family by a fiberwise minimization. Uniqueness of the minimizer will make the normalization continuous on the base, even when the bundles are nontrivial.

#thm([Lemma 3.1.])[
  (Avoiding small collective images).  #emph[Let $E \, F$ be smooth Hermitian complex vector bundles of ranks $d \, r$ over a compact smooth manifold $Y$ of real dimension $2 h$, and let $q gt.eq 1$. Let $cal(A)$ be a finite set of integer pairs $\( s \, t \)$ with $1 lt.eq s lt.eq d$ and $0 lt.eq t lt.eq r$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ \( q s - t \) \( r - t \) - s \( d - s \) > h #h(2em) \( \( s \, t \) in cal(A) \) . $ <eq:incidence-dimension>]

 There are smooth bundle maps $T_1 \, dots.h \, T_q : E arrow.r F$ such that, for every $y in Y$, every $\( s \, t \) in cal(A)$, and every complex $s$-plane $S subset E_y$, 
$ dim_(bb(C)) sum_(i = 1)^q T_i \( y \) S > t . $

 Here and below the sum denotes linear span. The same statement holds over a point, with $h = 0$.]
] <lem:incidence>

#proof[
  Choose a finite cover trivializing $"Hom" \( E \, F \)$ and a smooth partition of unity subordinate to it, with each support contained in its trivializing open set. Multiply every local frame section by the corresponding partition function and extend by zero. Their complex linear span is a finite-dimensional space $V$ of smooth bundle maps whose evaluation map
  $ V arrow.r "Hom" \( E_y \, F_y \) $
  is surjective for every $y$: at least one partition function is nonzero there, and its multiplied frame still spans the fiber. Thus the space $cal(V) = V^q$, of some complex dimension $M$, parametrizes tuples with surjective evaluation onto $"Hom" \( E_y \, F_y \)^q$.
  Fix $\( s \, t \) in cal(A)$. The Grassmann bundle of triples $\( y \, S \, U \)$, where $S subset E_y$ is an $s$-plane and $U subset F_y$ is a $t$-plane, has real dimension
  $ 2 h + 2 s \( d - s \) + 2 t \( r - t \) . $
  Over this bundle, evaluation followed by restriction and quotient gives a smooth, fiberwise surjective complex-linear map from the trivial bundle with fiber $cal(V)$ to the bundle with fiber $"Hom" \( S \, F_y \/ U \)^q$. Surjectivity follows because any linear map $S arrow.r F_y \/ U$ extends to a map $E_y arrow.r F_y$, and evaluation from $V$ is surjective. The target has complex rank $q s \( r - t \)$, so the kernels form a smooth vector bundle whose total space $cal(I)_(s \, t)$ has real dimension
  $ 2 M + 2 h + 2 s \( d - s \) + 2 t \( r - t \) - 2 q s \( r - t \) < 2 M \, $
  where the inequality is precisely (3.1).
  The image of the smooth projection $cal(I)_(s \, t) arrow.r cal(V)$ consists exactly of tuples having some $s$-plane whose collective image lies in a $t$-plane. A smooth image of a manifold of smaller dimension is a Lebesgue null set, as in the lower-dimensional case of Sard’s theorem [11]. Indeed, on a compact coordinate patch the projection is Lipschitz. Subdivision into cubes of side $delta$ covers its image by $O \( delta^(- a) \)$ balls of radius $O \( delta \)$, where $a < 2 M$ is the domain dimension; their total $2 M$-dimensional volume tends to zero. A countable exhaustion by such patches handles the possibly noncompact total space. The finite union of these null sets over $cal(A)$ cannot exhaust $cal(V)$. A tuple outside that union has the required properties. ◻
]

The next normalization uses a determinant potential. Gurvits’s operator-scaling theory uses determinant capacity to relate rank nondecrease to approximate doubly stochastic scaling [5] Section 4. Related affine log-determinant functions are studied by Sra and Hosseini [12] Corollary 2.11. We prove the version needed here, including the strict convexity and continuity that allow normalization over nontrivial bundles.

#thm([Lemma 3.2.])[
  (Continuous normalization).  #emph[Let $E \, F$ be Hermitian complex vector bundles of positive ranks over a compact manifold $Y$. Suppose that continuous bundle maps $T_1 \, dots.h \, T_n : E arrow.r F$ satisfy 
#[#set math.equation(numbering: n => "(3.2)")
 $ dim_(bb(C)) sum_(i = 1)^n T_i \( y \) S gt.eq 2 dim_(bb(C)) S #h(2em) \( y in Y \, med S subset E_y \) . $ <eq:expansion>]

 Then there are continuous bundle maps $X_1 \, dots.h \, X_n : E arrow.r F$ with 
#[#set math.equation(numbering: n => "(3.3)")
 $ sum_(i = 1)^n X_i^(*) X_i = I_E \, #h(2em) sum_(i = 1)^n X_i X_i^(*) lt.eq 2 / 3 I_F . $ <eq:scaled-bounds>]

]
] <lem:scaling>

#proof[
  Write $d = "rank" E$ and $r = "rank" F$. In each fiber define
  $ D_y \( P \) = sum_(i = 1)^n T_i \( y \) P T_i \( y \)^(*) \, #h(2em) g_y \( P \) = log det \( I_(F_y) + D_y \( P \) \) - 3 / 2 log det P $
  for positive definite $P in "End" \( E_y \)$. Both determinants are intrinsic. We will prove that $g_y$ has a unique minimizer depending continuously on $y$. The expansion factor $2$ and the coefficient $3 \/ 2$ leave a strict margin that prevents this minimizer from escaping to infinity.
  ===== 3.1 Uniform compact sublevels. <uniform-compact-sublevels.>
  Order all eigenvalues decreasingly. For an orthogonal rank-$s$ projection $p$ on $E_y$,
  $ "ran" D_y \( p \) = sum_i T_i \( y \) "ran" p . $
  Indeed, both sides have orthogonal complement $⋂_i ker \( p T_i \( y \)^(*) \)$. By (3.2), the $2 s$-th eigenvalue of $D_y \( p \)$ is positive; in particular $r gt.eq 2 d$. Eigenvalues are continuous, and the Grassmann bundle of such projections is compact. Taking a minimum there and then over $1 lt.eq s lt.eq d$ gives $epsilon.alt > 0$ such that
  $ mu_(2 s) \( D_y \( p \) \) gt.eq epsilon.alt $
  for every $y \, s \, p$ under consideration.
  If $P$ has eigenvalues $lambda_1 gt.eq dots.h.c gt.eq lambda_d > 0$, choose any projection $p_s$ onto $s$ top eigenvectors. Then $P gt.eq lambda_s p_s$, so positivity of $D_y$ and eigenvalue monotonicity give
  $ mu_(2 s) \( D_y \( P \) \) gt.eq epsilon.alt lambda_s . $
  Pairing the target eigenvalues with indices $2 s - 1 \, 2 s$, and discarding any remaining nonnegative terms, yields
  #[#set math.equation(numbering: n => "(3.4)")
   $ log det \( I + D_y \( P \) \) gt.eq 2 sum_(s = 1)^d log \( 1 + epsilon.alt lambda_s \) . $ <eq:scaling-determinant-bound>]
  No continuous choice of the projections $p_s$ is needed.
  Set $f \( t \) = 2 log \( 1 + epsilon.alt t \) - 3 / 2 log t$. This function is bounded below and tends to $+ oo$ at both endpoints of $\( 0 \, oo \)$. Let $b = min f$ and $C = max_(y in Y) g_y \( I_(E_y) \)$. Equation (3.4) shows that, whenever $g_y \( P \) lt.eq C$,
  $ f \( lambda_j \) lt.eq C - \( d - 1 \) b #h(2em) \( 1 lt.eq j lt.eq d \) . $
  Thus all eigenvalues of every such $P$ lie in a common compact interval $\[ a \, A \] subset \( 0 \, oo \)$. Outside the compact set $a I_(E_y) lt.eq P lt.eq A I_(E_y)$, we have $g_y \( P \) > C gt.eq g_y \( I_(E_y) \)$. Minimizing on this set therefore gives a global minimizer in each fiber, lying in the interior of the positive definite cone.
  ===== 3.2 Strict convexity along positive definite geodesics. <strict-convexity-along-positive-definite-geodesics.>
  Fix $P_0 > 0$ and a nonzero Hermitian $H$ in one source fiber, and put
  $ P \( u \) = P_0^(1 \/ 2) exp \( u H \) P_0^(1 \/ 2) . $
  Choose an orthonormal eigenbasis $e_j$ for $H$, with eigenvalues $h_j$, and set $v_(i j) = T_i P_0^(1 \/ 2) e_j$. Then
  $ D \( P \( u \) \) = sum_(i \, j) e^(u h_j) v_(i j) v_(i j)^(*) . $
  The Gram determinant expansion of $det \( I + C C^(*) \)$, applied to the columns $e^(u h_j \/ 2) v_(i j)$, expresses $det \( I + D \( P \( u \) \) \)$ as a finite sum $sum_alpha c_alpha e^(u alpha)$ with $c_alpha gt.eq 0$. The empty subset contributes $1$, and singleton subsets contribute $parallel v_(i j) parallel^2 e^(u h_j)$. For every $j$, the total singleton coefficient at $h_j$ is positive: the vector $P_0^(1 \/ 2) e_j$ is nonzero and (3.2) makes the common kernel of the maps $T_i$ trivial. Since some $h_j eq.not 0$, the expansion contains positive terms at two distinct exponents, $0$ and $h_j$.
  The second derivative of the logarithm of a positive exponential sum is the variance of its exponents under weights proportional to $c_alpha e^(u alpha)$. It is therefore strictly positive here. On the other hand,
  $ log det P \( u \) = log det P_0 + u "tr" H $
  is affine. Hence $g \( P \( u \) \)$ is strictly convex. Any two distinct positive definite matrices $P_0 \, P_1$ are joined by such a nonconstant curve, by taking $H = log \( P_0^(- 1 \/ 2) P_1 P_0^(- 1 \/ 2) \)$. The minimizer is unique.
  ===== 3.3 Continuity and gluing. <continuity-and-gluing.>
  In local unitary frames, $\( y \, P \) mapsto g_y \( P \)$ is continuous and the minimizers lie in the common compact matrix set $a I lt.eq P lt.eq A I$. If $y_k arrow.r y$, every subsequential limit of their minimizers minimizes $g_y$: pass to the limit in the minimizing inequality against any fixed positive definite comparison matrix. Uniqueness forces every such limit to be the minimizer at $y$, proving continuity. On overlaps of unitary frames, $P$ and $I_(F_y) + D_y \( P \)$ change by unitary conjugation, preserving both determinants. Uniqueness therefore makes the local minimizers glue to a continuous positive definite endomorphism $P$ of $E$.
  ===== 3.4 The normalization. <the-normalization.>
  Put $Q = I_F + D \( P \)$. Differentiation at the minimizer in an arbitrary Hermitian source direction $K$ gives
  $ 0 = "tr" [(sum_i T_i^(*) Q^(- 1) T_i - 3 / 2 P^(- 1)) K] . $
  The trace pairing on Hermitian matrices is nondegenerate, so $sum_i T_i^(*) Q^(- 1) T_i = 3 / 2 P^(- 1)$. Define
  $ X_i = sqrt(2 / 3) thin Q^(- 1 \/ 2) T_i P^(1 \/ 2) . $
  Continuous functional calculus makes these continuous bundle maps, and the order of the factors gives
  $ sum_i X_i^(*) X_i & = 2 / 3 P^(1 \/ 2) (sum_i T_i^(*) Q^(- 1) T_i) P^(1 \/ 2) = I_E \,\
sum_i X_i X_i^(*) & = 2 / 3 Q^(- 1 \/ 2) D \( P \) Q^(- 1 \/ 2) = 2 / 3 \( I_F - Q^(- 1) \) lt.eq 2 / 3 I_F . $
  These are (3.3). ◻
]

== 4 Bundle tests of bounded degree <sec:bundle-tests>

We now construct the finite topological tests used to exclude polynomial witnesses of proper infiniteness. The matrix size $m$ and the degree bound $R$ determine the bundles and their base, while the number of maps remains fixed at $24$. The use of characteristic classes to obstruct comparison follows the methods of Villadsen [13] Section 3 and Rørdam [10] Sections 3–4. Our test retains enough of a Chern class to exclude a specified trivial subbundle, even though the maps between successive levels have the normalized column and row bounds.

#thm([Proposition 4.1.])[
  #emph[For every pair of integers $m \, R gt.eq 1$, set 
#[#set math.equation(numbering: n => "(4.1)")
 $ d_0 = 64 m 4^R \, #h(2em) d_j = 4^j d_0 quad \( 0 lt.eq j lt.eq R \) . $ <eq:test-ranks>]

 There are a compact smooth manifold $Y$, Hermitian complex vector bundles $E_j arrow.r Y$ for all $j gt.eq 0$, and continuous bundle maps $X_i^(\( j \)) : E_j arrow.r E_(j + 1)$, for $1 lt.eq i lt.eq 24$ and $j gt.eq 0$, such that $E_0$ is trivial of rank $d_0$, the rank of $E_j$ is $d_j$ for $0 lt.eq j lt.eq R$, and 
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(i = 1)^24 \( X_i^(\( j \)) \)^(*) X_i^(\( j \)) = I_(E_j) \, #h(2em) sum_(i = 1)^24 X_i^(\( j \)) \( X_i^(\( j \)) \)^(*) lt.eq 2 / 3 I_(E_(j + 1)) . $ <bundle:scaled-identities>]

 Moreover, 
#[#set math.equation(numbering: n => "(4.3)")
 $ (xor.big_(j = 0)^R E_j)^(xor m)\
upright("contains no trivial subbundle of rank ") 2 m d_0 . $ <eq:chern-obstruction>]

]
] <prop:bundle-test>

#proof[
  Fix the matrix size $m$ and degree bound $R$. The bundles must satisfy two requirements. Their sum through level $R$ must retain a Chern class after allowing the trivial directions coming from $E_0$. At the same time, successive bundles must admit a fixed number of maps that expand every source subspace. We reduce each old line-bundle multiplicity by a factor of four at every step, so the total trivial part stays small. Each new projective-space factor is then sized to retain the Chern class contributed by every later occurrence of its line bundle. The initial rank leaves enough room in the reduced blocks to expand small subspaces; a large new block handles the others.
  ===== 4.1 The bundles and their base. <the-bundles-and-their-base.>
  For $1 lt.eq i lt.eq R$, define the fresh multiplicities
  $ b_i = 15 / 4 d_(i - 1) . $
  Let the multiplicity of the line bundle $L_i$ in $E_j$ be
  #[#set math.equation(numbering: n => "(4.4)")
   $ a_(0 \, j) & = d_0 4^(- j) = 64 m 4^(R - j) \,\
a_(i \, j) & = b_i 4^(- \( j - i \)) = 960 m 4^(R + 2 i - j - 2) #h(2em) \( 1 lt.eq i lt.eq j lt.eq R \) . $ <bundle:multiplicities>]
  All these numbers are positive integers. Put
  #[#set math.equation(numbering: n => "(4.5)")
   $ K_i = m sum_(j = i)^R a_(i \, j) = 320 m^2 4^(2 i - 2) #scale(x: 120%, y: 120%)[\(] 4^(R - i + 1) - 1 #scale(x: 120%, y: 120%)[\)] \, #h(2em) Y = product_(i = 1)^R bb(C P)^(K_i) . $ <eq:test-base>]
  Thus every $K_i$ is a positive integer. Take $L_0$ to be the trivial line bundle on $Y$, and for $i gt.eq 1$ let $L_i$ be the pullback of the hyperplane line bundle from the $i$th factor. Choose Hermitian metrics and define
  $ E_j = xor.big_(i = 0)^j L_i^(xor a_(i \, j)) #h(2em) \( 0 lt.eq j lt.eq R \) . $
  In passing from $E_j$ to $E_(j + 1)$, each old multiplicity is divided by four and a fresh block of rank $b_(j + 1) = \( 15 \/ 4 \) d_j$ is added. Consequently the ranks satisfy
  $ "rank" E_(j + 1) = 1 / 4 d_j + 15 / 4 d_j = 4 d_j \, $
  which proves the rank assertion by induction. Formula (4.4) also shows that every multiplicity $D$ to which division by four is applied is divisible by four and satisfies $D gt.eq 256 m$.
  ===== 4.2 The retained Chern class. <the-retained-chern-class.>
  The choice of $K_i$ records exactly the total multiplicity of $L_i$ in the bundle to be tested. Set
  $ G = (xor.big_(j = 0)^R E_j)^(xor m) \, #h(2em) h_0 = m sum_(j = 0)^R a_(0 \, j) \, #h(2em) p = sum_(i = 1)^R K_i . $
  The definitions of the multiplicities and $K_i$ give
  #[#set math.equation(numbering: n => "(4.6)")
   $ G tilde.equiv L_0^(xor h_0) xor xor.big_(i = 1)^R L_i^(xor K_i) \, #h(2em) h_0 = 4 / 3 m d_0 #scale(x: 120%, y: 120%)[\(] 1 - 4^(- \( R + 1 \)) #scale(x: 120%, y: 120%)[\)] < 2 m d_0 . $ <bundle:chern-decomposition>]
  Let $z_i = c_1 \( L_i \)$. The integral cohomology ring is
  $ H^(*) \( Y \; bb(Z) \) tilde.equiv bb(Z) \[ z_1 \, dots.h \, z_R \] \/ \( z_1^(K_1 + 1) \, dots.h \, z_R^(K_R + 1) \) \, #h(2em) deg z_i = 2 . $
  In particular $product_i z_i^(K_i)$ is nonzero. The Whitney sum formula and the normalization for line bundles give
  $ c_p \( G \) = product_(i = 1)^R z_i^(K_i) eq.not 0 \; $
  we use the standard Chern-class properties in [7] Theorem 3.2. If $G$ had a trivial subbundle of rank $k > h_0$, its Hermitian complement would have rank $h_0 + p - k < p$. The Whitney sum formula would identify $c_p \( G \)$ with the $p$th Chern class of that complement, which vanishes above its rank. This contradiction, together with (4.6), proves (4.3). The argument applies to any continuous subbundle, without a condition on its position relative to the displayed line summands.
  ===== 4.3 The bases for the expanding maps. <the-bases-for-the-expanding-maps.>
  It remains to construct the maps between these bundles. For the step $j arrow.r j + 1$, with $0 lt.eq j < R$, the source and target use only $L_0 \, dots.h \, L_(j + 1)$ and are pulled back from
  $ Y_(j + 1) = product_(i = 1)^(j + 1) bb(C P)^(K_i) . $
  The dimensions $K_i$ here are those in (4.5), including all later occurrences of $L_i$ through level $R$. The complex dimension $eta_j$ of this smaller base satisfies
  #[#set math.equation(numbering: n => "(4.7)")
   $ eta_j = sum_(i = 1)^(j + 1) K_i & lt.eq 4 / 3 m sum_(i = 1)^(j + 1) b_i\
 & = 5 / 3 m d_0 \( 4^(j + 1) - 1 \) < 20 / 3 m d_j . $ <bundle:prefix-dimension>]
  Here the first inequality uses the geometric series with ratio $1 \/ 4$. We construct the maps for this step on $Y_(j + 1)$, and then pull them back to $Y$. The estimate by a multiple of $m d_j$ is what will allow the incidence argument to handle all subspaces of dimension greater than $m$, even though the full base $Y$ may be much larger.
  ===== 4.4 Sixteen maps for small subspaces. <sixteen-maps-for-small-subspaces.>
  Decompose $E_(j + 1)$ as the sum of its replacement blocks and its fresh block. On a source block $L_i^(xor D)$, the corresponding replacement block is $L_i^(xor \( D \/ 4 \))$. We seek $16$ scalar matrices between the multiplicity spaces and tensor them with the identity of $L_i$. For $1 lt.eq s lt.eq m$, set $r = D \/ 4$ and $t = 2 s$. Since $D gt.eq 64 m$,
  $ t < r \, #h(2em) r - 2 s gt.eq D \/ 8 . $
  The incidence expression of Lemma 4, with $q = 16$ and base a point, is strictly positive:
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( 16 s - 2 s \) \( D \/ 4 - 2 s \) - s \( D - s \) = 5 / 2 s D - 27 s^2 gt.eq 133 m s > 0 . $ <bundle:small-incidence>]
  Applying Lemma 4 simultaneously for $s = 1 \, dots.h \, m$ gives matrices whose images of every such $s$-plane span a space of dimension at least $2 s$. In fact, avoiding dimension at most $2 s$ gives a slightly stronger conclusion. Make these choices for each block and assemble them into $16$ block diagonal maps $T_1 \, dots.h \, T_16$ to the replacement part, with zero component in the fresh block.
  We verify that the same $16$ maps expand every subspace of the whole source of dimension at most $m$. Work in one fiber and write the ordered source and replacement blocks as $V_k$ and $F_k$. Let $V_(lt.eq k)$ and $F_(lt.eq k)$ denote their initial sums. Given a subspace $S$ of dimension at most $m$, set
  $ S_k = S ∩ V_(lt.eq k) \, #h(2em) W = sum_(i = 1)^16 T_i S \, #h(2em) W_k = W ∩ F_(lt.eq k) . $
  Use the zero spaces before the first flag terms. Projection onto the $k$th block identifies $S_k \/ S_(k - 1)$ and $W_k \/ W_(k - 1)$ with subspaces of $V_k$ and $F_k$, respectively. Block diagonality gives $T_i \( S_k \) subset.eq W_k$ and hence
  $ sum_(i = 1)^16 T_(i \, k) \( S_k \/ S_(k - 1) \) subset.eq W_k \/ W_(k - 1) \, $
  where $T_(i \, k)$ is the map on the $k$th block. Each source quotient has dimension at most $m$, so the block estimates yield
  #[#set math.equation(numbering: n => "(4.9)")
   $ dim W = sum_k dim \( W_k \/ W_(k - 1) \) gt.eq 2 sum_k dim \( S_k \/ S_(k - 1) \) = 2 dim S . $ <bundle:flag-expansion>]
  This proves the required estimate even when $S$ has correlated components in several blocks.
  ===== 4.5 Eight maps for large subspaces. <eight-maps-for-large-subspaces.>
  Let $d = d_j$ and let the target now be the fresh block of rank $r = \( 15 \/ 4 \) d$. For every integer $m < s lt.eq d$, take $q = 8$ and $t = 2 s$. The rank endpoint is valid because $2 s lt.eq 2 d < r$. The incidence expression satisfies
  #[#set math.equation(numbering: n => "(4.10)")
   $ \( 8 s - 2 s \) \( 15 d \/ 4 - 2 s \) - s \( d - s \) & = 43 / 2 s d - 11 s^2\
 & gt.eq 21 / 2 s d > 20 / 3 m d > eta_j . $ <bundle:large-incidence>]
  The first inequality follows from $s lt.eq d$. Lemma 4 on $Y_(j + 1)$, applied to the finite list $s = m + 1 \, dots.h \, d$, therefore supplies eight smooth maps to the fresh block whose image spans have dimension at least $2 s$ for all these subspaces. Regard these as maps to $E_(j + 1)$ with zero replacement components.
  Together, the two lists give $24$ maps $T_i : E_j arrow.r E_(j + 1)$ satisfying
  $ dim sum_(i = 1)^24 T_i S gt.eq 2 dim S $
  for every fiber subspace $S$. The estimate is supplied by the first list when $dim S lt.eq m$ and by the second when $dim S > m$; adding maps cannot decrease an image span. Pull back to $Y$ and apply Lemma 5. This gives continuous maps $X_i^(\( j \))$ satisfying (4.2) for every $0 lt.eq j < R$. The scaling may mix the displayed line summands, but each resulting map still has source $E_j$ and target $E_(j + 1)$.
  ===== 4.6 Continuation beyond the test. <continuation-beyond-the-test.>
  For $j gt.eq R$, define $E_(j + 1) = E_j xor E_j$, and let
  $ X_1^(\( j \)) = 2^(- 1 \/ 2) iota_1 \, #h(2em) X_2^(\( j \)) = 2^(- 1 \/ 2) iota_2 \, #h(2em) X_i^(\( j \)) = 0 quad \( 3 lt.eq i lt.eq 24 \) \, $
  where $iota_1 \, iota_2$ are the two inclusions. Their column sum is $I_(E_j)$ and their row sum is $1 / 2 I_(E_(j + 1))$, so (4.2) holds for these steps as well. This continuation leaves the retained bundle in (4.3) unchanged and completes the construction. ◻
]

== 5 The algebra and a uniform additivity defect <sec:algebra>

We now put all the bundle tests into one algebra. The uniform number of maps and their uniform norm bounds allow this construction, while each test obstructs polynomial candidates at its prescribed matrix size and degree.

#thm([Theorem 5.1.])[
  #emph[There is a separable unital complex $C^(*)$-algebra $B = C^(*) \( 1 \, x_1 \, dots.h \, x_24 \)$ such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ sum_(i = 1)^24 x_i^(*) x_i = 1 \, #h(2em) sum_(i = 1)^24 x_i x_i^(*) lt.eq 2 / 3 thin 1 \, $ <eq:algebra-relations>]

 and $M_m \( B \)$ is not properly infinite for every integer $m gt.eq 1$.]
] <thm:construction>

#proof[
  For each pair of integers $m \, R gt.eq 1$, choose the data supplied by Proposition 6, and denote its base by $Y_(m \, R)$. At a point $y in Y_(m \, R)$ form the Hilbert space
  $ cal(H)_(m \, R \, y) = xor.big_(j = 0)^oo E_j \( y \) . $
  For $1 lt.eq i lt.eq 24$, let $S_i^(m \, R) \( y \)$ be the forward shift on this space whose block from $E_j \( y \)$ to $E_(j + 1) \( y \)$ is $X_i^(\( j \)) \( y \)$. The column identity in Proposition 6 gives
  $ X_i^(\( j \) *) X_i^(\( j \)) lt.eq I_(E_j) \, $
  so every block, and hence every shift, has norm at most one. These bounds hold uniformly over all coordinates.
  Let $cal(D)$ be the bounded $C^(*)$-product of the algebras $cal(B) \( cal(H)_(m \, R \, y) \)$ over all these indices: its elements are the operator families of finite supremum norm. The uniform bound therefore defines a single tuple in $cal(D)$,
  $ x_i = #scale(x: 120%, y: 120%)[\(] S_i^(m \, R) \( y \) #scale(x: 120%, y: 120%)[\)]_(m \, R gt.eq 1 \, #h(0.27778em) y in Y_(m \, R)) #h(2em) \( 1 lt.eq i lt.eq 24 \) . $
  The column sum of the shifts is the identity on every level. Their row sum is zero on level zero and, on level $j gt.eq 1$, is
  $ sum_(i = 1)^24 X_i^(\( j - 1 \)) X_i^(\( j - 1 \) *) lt.eq 2 / 3 I_(E_j) . $
  Thus (5.1) holds in $cal(D)$. Take $B = C^(*) \( 1 \, x_1 \, dots.h \, x_24 \) subset.eq cal(D)$. This is a nonzero unital algebra, and it is separable: the $*$-polynomials in these generators with rational complex coefficients form a countable dense subset.
  Fix $m gt.eq 1$ and suppose, towards a contradiction, that $M_m \( B \)$ contains isometries $s_1 \, s_2$ with orthogonal ranges. Their rectangular concatenation satisfies
  $ W = \[ s_1 med s_2 \] in M_(m \, 2 m) \( B \) \, #h(2em) W^(*) W = I_(2 m) . $
  By norm density choose $P in M_(m \, 2 m) \( B \)$ with $*$-polynomial entries such that $parallel P - W parallel < 1 \/ 5$. Since $parallel W parallel = 1$,
  $ parallel P^(*) P - I_(2 m) parallel lt.eq 2 parallel P - W parallel + parallel P - W parallel^2 < 1 / 2 \, $
  and consequently
  #[#set math.equation(numbering: n => "(5.2)")
   $ P^(*) P gt.eq 1 / 2 I_(2 m) . $ <eq:polynomial-lower-bound>]
  After fixing this approximation, choose $R gt.eq 1$ at least the length of every word occurring in its entries. We use the coordinate family belonging to the already constructed test $\( m \, R \)$.
  A word of length at most $R$, applied to level zero, takes values in levels zero through $R$. Each generator raises the level by one, each adjoint lowers it by one, and an adjoint applied at level zero gives zero. Constant terms preserve level zero. Restricting the evaluated matrix $P$ to the input at level zero therefore gives a fiberwise map
  #[#set math.equation(numbering: n => "(5.3)")
   $ P_0 : E_0^(xor 2 m) arrow.r F_(m \, R) := (xor.big_(j = 0)^R E_j)^(xor m) quad upright("over ") Y_(m \, R) . $ <eq:polynomial-bundle-map>]
  This is a continuous bundle map. Indeed, each block of the restriction is a finite sum of compositions of the continuous maps $X_i^(\( j \))$ and their adjoints, with $j < R$. This description is intrinsic to the bundles; no simultaneous trivialization of the Hilbert fibers or continuity between different tests is required. The continuation beyond level $R$ does not enter these compositions. Figure 1 illustrates this finite propagation and the resulting bundle map.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 1.2cm, height: 0.9cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E_0$]]])])
  content((1.8, 0), [#box(width: 1.2cm, height: 0.9cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E_1$]]])])
  content((3.45, 0), [#text(size: 9pt)[$dots.h$]])
  content((5.1, 0), [#box(width: 1.2cm, height: 0.9cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E_R$]]])])
  content((7.2, 0), [#box(width: 1.2cm, height: 0.9cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E_(R+1)$]]])])
  bezier((0.6, 0.45), (1.2, 0.45), (0.826, 0.5106), (0.974, 0.5106), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.9, 0.4954), [#text(size: 9pt)[$x_i$]], anchor: "south", padding: 0.1176cm)
  bezier((1.2, -0.45), (0.6, -0.45), (0.974, -0.5106), (0.826, -0.5106), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.9, -0.4954), [#text(size: 9pt)[$x_i^*$]], anchor: "north", padding: 0.1176cm)
  line((2.4, 0), (3.246, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  line((3.654, 0), (4.5, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  line((5.7, 0), (6.6, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  rect((-1.007, -1.257), (6.107, 1.257), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 3pt)
  content((2.55, 1.5), [#text(size: 9pt)[A word of length at most $R$, starting at level zero,#linebreak()stays in these levels]], anchor: "south", padding: 0.1176cm)
  content((2.55, -1.5), [#text(size: 9pt)[$P_0:E_0^( plus.o 2m) arrow.r.long (E_0 plus.o dots.h plus.o E_R )^( plus.o m)$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: The test indexed by $\( m \, R \)$, shown schematically. A polynomial matrix $P$ whose entries contain only words of length at most $R$ maps its trivial level-zero input into the displayed target. If $P^(*) P gt.eq 1 / 2 I$, this restriction would embed a trivial bundle of rank $2 m d_0$ into that target, contradicting its retained Chern class. The arrows show level changes; each forward block is one of the maps $X_i^(\( j \))$. The continuation after level $R$ does not affect this test. When $R = 1$, the labels $E_1$ and $E_R$ denote the same level. ],
  ) <fig:finite-test>
  At each $y$, let $iota_0$ include the level-zero input in $cal(H)_(m \, R \, y)^(xor 2 m)$, and let $iota_F$ include $F_(m \, R) \( y \)$ in $cal(H)_(m \, R \, y)^(xor m)$. The range statement above says $P \( y \) iota_0 = iota_F P_0 \( y \)$. Evaluation preserves (5.2), so compression of this quadratic-form inequality gives
  $ P_0 \( y \)^(*) P_0 \( y \) = iota_0^(*) P \( y \)^(*) P \( y \) iota_0 gt.eq 1 / 2 I #h(2em) \( y in Y_(m \, R) \) . $
  Hence
  $ Q = P_0 \( P_0^(*) P_0 \)^(- 1 \/ 2) $
  is a continuous fiberwise isometry. Its image is a subbundle of $F_(m \, R)$ isomorphic to the trivial bundle $E_0^(xor 2 m)$, of rank $2 m "rank" \( E_0 \)$. This contradicts Proposition 6. Since $m$ was arbitrary, the conclusion holds for every matrix algebra over $B$. ◻
]

The passage from the two relations to a specified positive pair is useful independently of the construction. It requires only the $1$-quasitrace axioms once a quasitrace on the matrix algebra is given.

#thm([Lemma 5.2.])[
  #emph[Let $B$ be a unital complex $C^(*)$-algebra, let $N gt.eq 1$, and suppose $x_1 \, dots.h \, x_N in B$ satisfy 
$ sum_(i = 1)^N x_i^(*) x_i = 1 \, #h(2em) sum_(i = 1)^N x_i x_i^(*) lt.eq c 1 quad upright("for some ") 0 lt.eq c < 1 . $

 There are positive contractions $a \, b in M_(2 N) \( B \)$, determined by this tuple, such that every normalized $1$-quasitrace $tau$ on $M_(2 N) \( B \)$ satisfies 
#[#set math.equation(numbering: n => "(5.4)")
 $ tau \( a + b \) - tau \( a \) - tau \( b \) gt.eq frac(1 - c, 2 N) . $ <eq:uniform-defect>]

]
] <lem:defect>

#proof[
  Put
  $ u_i = x_i^(*) x_i \, #h(2em) v_i = x_i x_i^(*) \, #h(2em) H_i = sum_(j = 1)^i u_j \, #h(2em) J_i = sum_(j = 1)^i v_j \, $
  with $H_0 = J_0 = 0$. We use these partial sums to define two diagonal matrices. In their additivity defect, the first $N$ blocks will telescope the column partial sums, while the last $N$ use complements to telescope the row partial sums with the opposite sign and keep the entries positive.
  #[#set math.equation(numbering: n => "(5.5)")
   $ a & = "diag" \( H_0 \, dots.h \, H_(N - 1) \, thin 1 - J_0 \, dots.h \, 1 - J_(N - 1) \) \,\
b & = "diag" \( u_1 \, dots.h \, u_N \, thin 1 - v_1 \, dots.h \, 1 - v_N \) . $ <eq:defect-pair>]
  All entries are positive contractions: $0 lt.eq H_i lt.eq H_N = 1$, $0 lt.eq u_i lt.eq 1$, and $0 lt.eq J_i \, v_i lt.eq J_N lt.eq c 1$.
  Fix a normalized $1$-quasitrace $tau$ on $M_(2 N) \( B \)$. Write $iota_k \( z \)$ for $z in B$ placed in the $k$th diagonal corner and define $phi \( z \) = tau \( iota_1 \( z \) \)$. If $z gt.eq 0$, let $t$ be the matrix with $z^(1 \/ 2)$ in its $\( k \, ell \)$ entry and zeros elsewhere. Then $t^(*) t = iota_ell \( z \)$ and $t t^(*) = iota_k \( z \)$, so the identity $tau \( t^(*) t \) = tau \( t t^(*) \)$ gives
  $ tau \( iota_k \( z \) \) = phi \( z \) #h(2em) \( z gt.eq 0 \, 1 lt.eq k lt.eq 2 N \) . $
  Since self-adjoint elements supported in distinct diagonal corners commute, abelian linearity yields
  #[#set math.equation(numbering: n => "(5.6)")
   $ tau #scale(x: 120%, y: 120%)[\(] "diag" \( z_1 \, dots.h \, z_(2 N) \) #scale(x: 120%, y: 120%)[\)] = sum_(k = 1)^(2 N) phi \( z_k \) quad \( z_k gt.eq 0 \) \, #h(2em) phi \( 1 \) = frac(1, 2 N) . $ <eq:corner-normalization>]
  The last equality follows by taking every $z_k = 1$. The square axiom applied within the first corner also gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ phi \( u_i \) = phi \( v_i \) #h(2em) \( 1 lt.eq i lt.eq N \) . $ <eq:corner-square-equality>]
  The first $N$ diagonal blocks contribute to the additivity defect the terms
  $ phi \( H_i \) - phi \( H_(i - 1) \) - phi \( u_i \) . $
  The last $N$ contribute
  $ & phi \( 2 - J_i \) - phi \( 1 - J_(i - 1) \) - phi \( 1 - v_i \)\
 & #h(2em)  = - phi \( J_i \) + phi \( J_(i - 1) \) + phi \( v_i \) . $
  Here each scalar-translation identity is taken within the abelian algebra generated by the corner identity and the indicated self-adjoint element. Thus these equalities use no additivity on noncommuting elements of $B$. Summing the scalar defects, telescoping, and using (5.7), we obtain
  $ tau \( a + b \) - tau \( a \) - tau \( b \) & = phi \( H_N \) - sum_(i = 1)^N phi \( u_i \) - phi \( J_N \) + sum_(i = 1)^N phi \( v_i \)\
 & = phi \( 1 \) - phi \( J_N \) . $
  The restriction of $phi$ to $C^(*) \( 1 \, J_N \) subset.eq B$ is positive and linear. Since $0 lt.eq J_N lt.eq c 1$, it follows that $phi \( J_N \) lt.eq c phi \( 1 \)$. Equation (5.6) now gives (5.4). ◻
]

#proof[
  Theorem 7 supplies the separable unital algebra $B$, generated by twenty-four elements satisfying (5.1), with no properly infinite matrix algebra over it. Consequently the same is true of $A = M_48 \( B \)$, because $M_k \( A \) tilde.equiv M_(48 k) \( B \)$ for every $k$. Theorem 3 gives a normalized $2$-quasitrace on $A$.
  Apply Lemma 8 with $N = 24$ and $c = 2 \/ 3$. It supplies positive contractions $a \, b in A$ for which every normalized $2$-quasitrace has defect at least $\( 1 - c \) \/ \( 2 N \) = 1 \/ 144$. Matrix amplification preserves separability and unitality, so all assertions of Theorem 1 follow. ◻
]

== 6 Tensor products and stable finiteness <sec:consequences>

The consequences in Corollary 2 use the established factor form of the quasitrace problem and a trace-obstruction theorem for tensor products. We record their scopes before applying them to the different algebras in the corollary.

===== 6.1 The factor input. <the-factor-input.>

The assertion that every normalized $2$-quasitrace on every unital $C^(*)$-algebra is a tracial state is equivalent to the assertion that every $A W^(*)$-factor of type $upright("II")_1$ is a $W^(*)$-algebra; see [8] Section 2 and [4] Theorem 4.11. Every such factor admits a normalized $2$-quasitrace, and it admits a tracial state exactly when it is a $W^(*)$-algebra [8] Section 2. A finite $A W^(*)$-factor is simple as a $C^(*)$-algebra [4] Remark 2.7. For a simple unital $C^(*)$-algebra, absence of stable proper infiniteness is equivalent to stable finiteness [8] Section 2. These statements impose no separability condition on the factor.

===== 6.2 The tensor input and the passage to $bb(F)_2$. <the-tensor-input-and-the-passage-to-mathbb-f_2.>

Haagerup’s trace-obstruction theorem, in the properly infinite formulation recorded by Milhøj and Rørdam [8] Theorem 3.1, says that a unital $C^(*)$-algebra $D$ has no tracial state if and only if $D ⊗_min C_r^(*) \( bb(F)_oo \)$ is properly infinite. Haagerup notes that the subgroup inclusion $bb(F)_oo arrow.r.hook bb(F)_2$ induces a unital inclusion $C_r^(*) \( bb(F)_oo \) arrow.r.hook C_r^(*) \( bb(F)_2 \)$ [6] Remark 2.5(a). The minimal tensor product preserves injective $*$-homomorphisms, so it gives a unital inclusion

$ D ⊗_min C_r^(*) \( bb(F)_oo \) arrow.r.hook D ⊗_min C_r^(*) \( bb(F)_2 \) . $

The two isometries witnessing proper infiniteness retain their relations under this inclusion. Consequently,

#[#set math.equation(numbering: n => "(6.1)")
 $ D upright(" has no tracial state") quad arrow.r.double quad D ⊗_min C_r^(*) \( bb(F)_2 \) upright(" is properly infinite") . $ <eq:traceless-tensor>]

#proof[
  For (i), Theorem 1 and the factor input give an $A W^(*)$-factor $M$ of type $upright("II")_1$ that is not a $W^(*)$-algebra. Hence $M$ has no tracial state. It is simple and admits a normalized $2$-quasitrace. Theorem 3 therefore excludes stable proper infiniteness, and the criterion for simple algebras makes $M$ stably finite.
  Powers’s theorem [9] gives simplicity of $R = C_r^(*) \( bb(F)_2 \)$. Its canonical tracial state is faithful, as are the matrix traces induced by it. A faithful trace rules out a nonunitary isometry, so $R$ is stably finite. It is also unital. Applying (6.1) to $M$ proves (i): $M ⊗_min R$ is properly infinite.
  For (ii), take the explicit algebra $B$ of Theorem 7. No matrix algebra over $B$ is properly infinite, so Theorem 3 supplies a normalized $2$-quasitrace. The relations (5.1) exclude a tracial state: applying one to their two sums would give $1 lt.eq 2 \/ 3$. Equation (6.1) makes $B ⊗_min R$ properly infinite, and Theorem 3 then excludes a normalized $2$-quasitrace on that tensor product.
  For (iii), Haagerup’s finite trace-obstruction criterion [6] Lemma 2.1 supplies $y_1 \, dots.h \, y_n in M$ such that
  $ sum_(i = 1)^n y_i^(*) y_i = 1 \, #h(2em) ∥sum_(i = 1)^n y_i y_i^(*)∥ < 1 . $
  Let $C = C^(*) \( 1 \, y_1 \, dots.h \, y_n \) subset M$. This algebra is separable and unital. It inherits stable finiteness from $M$: an isometry in $M_k \( C \)$ is an isometry in $M_k \( M \)$, hence is unitary there and therefore already unitary in $M_k \( C \)$. A tracial state $tau$ on $C$ would satisfy
  $ 1 = tau (sum_(i = 1)^n y_i^(*) y_i) = tau (sum_(i = 1)^n y_i y_i^(*)) lt.eq ∥sum_(i = 1)^n y_i y_i^(*)∥ < 1 \, $
  a contradiction. This proves (iii). ◻
]

#heading(level: 1)[References]
#bibitem([1])[Bruce Blackadar and David Handelman, #emph[Dimension functions and traces on $C^(*)$-algebras], J. Funct. Anal. #strong[45] (1982), no.~3, 297--340. #link("https://doi.org/10.1016/0022-1236(82)90009-X")[doi:10.1016/0022-1236(82)90009-X].]
#bibitem([2])[Bruce Blackadar and Mikael Rørdam, #emph[Extending states on preordered semigroups and the existence of quasitraces on $C^(*)$-algebras], J. Algebra #strong[152] (1992), no.~1, 240--247. #link("https://doi.org/10.1016/0021-8693(92)90098-7")[doi:10.1016/0021-8693(92)90098-7].]
#bibitem([3])[Joachim Cuntz, #emph[Dimension functions on simple $C^(*)$-algebras], Math. Ann. #strong[233] (1978), no.~2, 145--153. #link("https://doi.org/10.1007/BF01421922")[doi:10.1007/BF01421922].]
#bibitem([4])[Alec Gow, #emph[On the quasitrace problem and a characterization of $W^(*)$-algebras], preprint, 2026, version~2, 14~July~2026. #link("https://arxiv.org/abs/2601.04431v2")[arXiv:2601.04431v2].]
#bibitem([5])[Leonid Gurvits, #emph[Classical deterministic complexity of Edmonds' problem and quantum entanglement], preprint, 2003. #link("https://arxiv.org/abs/quant-ph/0303055v1")[arXiv:quant-ph/0303055v1].]
#bibitem([6])[Uffe Haagerup, #emph[Quasitraces on exact $C^(*)$-algebras are traces], C. R. Math. Rep. Acad. Sci. Canada #strong[36] (2014), no.~2--3, 67--92. #link("https://arxiv.org/abs/1403.7653")[arXiv:1403.7653].]
#bibitem([7])[Allen Hatcher, #emph[Vector Bundles and $K$-Theory], online manuscript, version~2.2, November~2017. #link("https://pi.math.cornell.edu/~hatcher/VBKT/VB.pdf")[Author's manuscript].]
#bibitem([8])[Henning Olai Milhøj and Mikael Rørdam, #emph[Around traces and quasitraces], preprint, 2023, version~2, 30~November~2023; to appear in Münster J. Math. #link("https://arxiv.org/abs/2309.17412v2")[arXiv:2309.17412v2].]
#bibitem([9])[Robert T. Powers, #emph[Simplicity of the $C^(*)$-algebra associated with the free group on two generators], Duke Math. J. #strong[42] (1975), no.~1, 151--156. #link("https://doi.org/10.1215/S0012-7094-75-04213-1")[doi:10.1215/S0012-7094-75-04213-1].]
#bibitem([10])[Mikael Rørdam, #emph[A simple $C^(*)$-algebra with a finite and an infinite projection], Acta Math. #strong[191] (2003), no.~1, 109--142. #link("https://doi.org/10.1007/BF02392697")[doi:10.1007/BF02392697].]
#bibitem([11])[Arthur Sard, #emph[The measure of the critical values of differentiable maps], Bull. Amer. Math. Soc. #strong[48] (1942), no.~12, 883--890. #link("https://doi.org/10.1090/S0002-9904-1942-07811-6")[doi:10.1090/S0002-9904-1942-07811-6].]
#bibitem([12])[Suvrit Sra and Reshad Hosseini, #emph[Conic geometric optimization on the manifold of positive definite matrices], SIAM J. Optim. #strong[25] (2015), no.~1, 713--739. #link("https://doi.org/10.1137/140978168")[doi:10.1137/140978168].]
#bibitem([13])[Jesper Villadsen, #emph[On the stable rank of simple $C^(*)$-algebras], J. Amer. Math. Soc. #strong[12] (1999), no.~4, 1091--1102. #link("https://doi.org/10.1090/S0894-0347-99-00314-8")[doi:10.1090/S0894-0347-99-00314-8].]


