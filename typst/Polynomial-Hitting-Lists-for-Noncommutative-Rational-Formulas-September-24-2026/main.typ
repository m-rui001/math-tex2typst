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

#align(center)[#text(size: 16pt, weight: "bold")[Polynomial Hitting Lists for Noncommutative Rational Formulas]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A noncommutative rational formula is a rooted tree whose leaves are variables or rational constants, whose binary gates are addition or ordered multiplication, and whose unary gates are inversion. Its size is its number of vertices, including leaves and inverse gates. At a tuple of square rational matrices, a scalar is interpreted as a scalar multiple of the identity. Evaluation is defined only when every inverse gate encounters an invertible matrix.

Call a formula #emph[admissible] if it has a defined rational matrix evaluation of some positive dimension, and #emph[nonzero] if one of its defined rational matrix evaluations is nonzero. These operational definitions suffice for the hitting-list theorem; its proof does not need a construction of the free skew field. In particular, algebraic cancellations do not enlarge a formula’s domain of evaluation.

Identity testing asks whether an admissible formula is zero at every defined evaluation. Scalar substitutions cannot answer this question: for example, $x_1 x_2 - x_2 x_1$ vanishes on all scalar tuples but is nonzero on matrices. A matrix hitting list is a fixed finite list of tuples that supplies a defined nonzero evaluation for each nonzero formula in the prescribed class. Such a list permits testing through evaluations without access to the formula tree. With inverse gates, the same tuple must satisfy every domain condition imposed by that tree, including conditions in branches that later cancel. In oracle terminology, an undefined evaluation is reported as such; only defined outputs are tested for zero.

#thm([Theorem 1.1.])[
  #emph[There are a deterministic Turing machine $G$ and fixed positive integers $C \, k$ with the following property. Given $1^n \, 1^s$, where $n \, s gt.eq 1$, the machine outputs a finite list $cal(H)_(n \, s)$ of $n$-tuples of rational square matrices, in at most $C \( n + s + 1 \)^k$ bit operations. The entire output, with signed binary numerators and positive binary denominators, has at most $C \( n + s + 1 \)^k$ bits. For every nonzero admissible rational formula $Phi$ in $n$ variables of size at most $s$, some tuple in $cal(H)_(n \, s)$ is a defined evaluation of $Phi$ with invertible value.]
  #emph[The same list works for all such formulas, regardless of the bit lengths of their rational constants or their inverse depth. The generator receives no formula, oracle, randomness, or advice.]
] <thm:main>

The invertible-value conclusion is stronger than the nonzero-value requirement. All tuples produced below even have one common dimension depending only on $n \, s$.

=== 1.1 Context <context>

The algebraic setting comes from the theory of rational identities and universal fields of fractions #cite(label("Amitsur66")) #cite(label("Cohn06")). Affine-matrix representations of free-field elements appear in Cohn and Reutenauer #cite(label("CR94")) Section 3.1; Kaliuzhnyi-Verbovetskyi and Vinnikov give a systematic account of matrix evaluation domains and rational functions #cite(label("KVV10")) Section 2. The distinction between a rational function and an expression representing it matters here: equivalent expressions can impose different conditions on their intermediate inverses. Our operational formulation retains the original expression throughout.

For division-free computation, Nisan’s coefficient-matrix characterization made rank a central tool in noncommutative branching-program complexity #cite(label("Nisan91")). Raz and Shpilka gave deterministic polynomial-time identity testing with access to a formula or branching program #cite(label("RS05")). Bogdanov and Wee developed randomized black-box matrix evaluation for bounded-degree noncommutative polynomials #cite(label("BW05")), and Forbes and Shpilka constructed deterministic quasipolynomial-size matrix hitting sets for noncommutative algebraic branching programs, a model including division-free formulas #cite(label("FS13")).

For computation with division, Hrubeš and Wigderson developed the rational-formula model and its reduction to linear-matrix singularity testing #cite(label("HW15")). Their inverse-matrix realizations and tests for the domains of gate subformulas are direct predecessors of our certificate construction. Deterministic polynomial-time algorithms with access to the input formula followed from operator scaling and constructive noncommutative-rank computation #cite(label("GGOW16")) #cite(label("GGOW20")) #cite(label("IQS18")). These algorithms use the given coefficients, with their encoding lengths included in the bit model. Derksen and Makam established polynomial bounds on the dimensions needed for an admissible rational formula to have a defined evaluation, and derived randomized polynomial-time rational identity testing #cite(label("DM17")) Section 6. Small witnesses and algorithms that depend on the input coefficients leave open the construction of a universal deterministic list from size bounds alone.

Arvind, Chatterjee, and Mukhopadhyay obtained deterministic quasipolynomial-size hitting sets for rational formulas of inversion height two #cite(label("ACM22")) Theorem 1.1. Their subsequent general result handles unrestricted inverse nesting with quasipolynomial-size rational matrix hitting sets #cite(label("ACM26")); the quantitative bounds used in this comparison are Theorem 2, Corollary 3, and the paragraph following Remark 52 of the specified preprint version #cite(label("ACM25")). Thus rational matrix outputs and arbitrary inverse nesting already occur in the preceding literature. Invertible evaluations are also used in the division-algebra methods of these works #cite(label("ACM22")) #cite(label("ACM25")). Their general treatment states a depth reduction that preserves the input formula’s evaluation domain #cite(label("ACM25")) Fact 1. Theorem 1 gives polynomial bounds on construction time, total binary output length, and matrix dimension. Its complexity bound concerns generation of the list; the cost of evaluating an unknown formula with arbitrarily large rational constants is not included.

The result resolves, over $bb(Q)$, the explicit polynomial-size hitting-set problem for this formula model, and gives the polynomial matrix dimension asked for in the conclusion of #cite(label("ACM25"), form: "prose"). The proof of Theorem 1 below establishes all the algebraic and algorithmic ingredients it uses.

The proof also draws on established methods. The multiplicity argument for explicit subspace designs of Guruswami and Kopparty #cite(label("GK16")), and the connection between subspace designs, rank condensers, and dimension expansion studied by Forbes and Guruswami #cite(label("FG15")), provide context for our construction. The underlying Wronskian calculation is classical #cite(label("BD10")). The common-subspace obstruction to invertibility belongs to noncommutative-rank theory #cite(label("FR04")), while cyclic division algebras and rank divisibility underlie the regularity methods of Ivanyos, Qiao, and Subrahmanyam #cite(label("IQS17")) #cite(label("IQS18")). We prove the precise expansion, deformation, and domain statements needed here, without importing the stronger general algorithms from those works.

=== 1.2 The construction and its logic <the-construction-and-its-logic>

Write $"Mat"_q \( F \)$ for the $q$ by $q$ matrices over a field $F$. The bridge from formula evaluation to linear algebra is an #emph[affine linear pencil], a matrix

$ L \( x \) = A_0 + sum_(i = 1)^n A_i x_i \, #h(2em) A_i in "Mat"_q \( bb(Q) \) \, $

of order $q$. Its evaluation at matrices $X_i in "Mat"_e \( E \)$ over an extension field $E \/ bb(Q)$ is $A_0 ⊗ I_e + sum_i A_i ⊗ X_i$. Call the pencil #emph[feasible] if one such evaluation is invertible. Tensor products and ranks are taken over the indicated field.

A size-$s$ formula gives at most $s + 1$ pencils of order at most $B = 2 s + 1$. Their simultaneous invertibility certifies that every inverse occurrence in the original tree is defined and that the final value is invertible. A nonzero admissible formula has a matrix evaluation over an extension field satisfying all these conditions. Section 4 proves this reduction, including the exact conditions at the inverse gates. The construction therefore seeks a universal rational list on which each such finite family of feasible pencils is simultaneously invertible.

Two obstacles remain: obtaining full rank at matrices independent of the pencil coefficients, and keeping all conditions valid when the parameters become rational numbers. The proof handles them in the following order.

+ Section 2 constructs $n + 1$ rectangular matrices over $bb(Q) \[ t \]$. They act on coefficient vectors of polynomials, reversing the Taylor expansion about the distinct points $0 \, dots.h \, n$ and weighting the Taylor coefficients by powers of $t$. A Wronskian bound shows that, for every nonzero subspace of dimension at most $B$, the sum of its images has dimension greater than $n$ times its dimension, even when the subspace has Laurent-series coefficients. The resulting test for a feasible pencil is injective. Padding the test matrices to a common square order $M$ gives matrices $R_i \( t \)$ for which every feasible pencil of order $1 lt.eq q lt.eq B$ satisfies
  $ "rank" #scale(x: 180%, y: 180%)[\(] sum_(i = 0)^n A_i ⊗ R_i \( t \) #scale(x: 180%, y: 180%)[\)] > \( q - 1 \) M . $
+ Section 3 uses two further parameters $p \, r$ to lift these matrices into a division algebra represented by $M times M$ matrices. Ranks of block matrices over this algebra are multiples of $M$, so the strict inequality forces full rank. Dividing on the left by the lifted $R_0$ restores the constant term of an affine pencil. A separate application of the lift turns any defined nonzero formula evaluation into a defined invertible one over an extension field. This supplies the feasibility assertion needed for the certificates in Section 4.
+ Section 5 represents multiplication in a finite-dimensional rational algebra by rational matrices, thereby replacing the root of unity used in the lift. All root components must be invertible simultaneously. For any fixed formula, the product of their determinant conditions is a nonzero polynomial of bounded degree in $t \, p \, r$. A fixed three-dimensional integer grid detects it. Exact rational arithmetic bounds both the generation time and the total binary output length.

The witnesses, subspaces, and formula-specific determinant products in this proof certify the construction. None is computed by $G$. In particular, the dimension of an initial witness for a formula has no effect on the generator’s resource bounds.

The construction also hits every feasible rational affine pencil of bounded order; see Corollary 13. In particular, it answers the rational-coefficient version of the black-box #smallcaps[Singular] construction question for homogeneous pencils posed by Garg, Gurvits, Oliveira, and Wigderson #cite(label("GGOW20")) Section 6, p. 280. Section 6 then treats rectangular affine pencils. Their #emph[noncommutative rank] is their rank over the free skew field. Corollary 15 constructs a universal nonadaptive list whose normalized evaluation ranks recover this rank for every rectangular rational affine pencil with prescribed row, column, and variable counts. It permits exact matrix-value or ordinary-rank responses and accounts for their processing costs.

== 2 Rectangular tests from subspace expansion <sec:expansion>

Fix the variable and formula-size bounds $n \, s gt.eq 1$. We construct rectangular matrices $T_0 \, dots.h \, T_n$ such that $sum_(i = 0)^n A_i ⊗ T_i$ is injective whenever $A_0 + sum_(i = 1)^n A_i x_i$ is a feasible affine pencil of order at most $2 s + 1$. The construction uses an indeterminate $t$; no specialization of a formal Laurent series will be needed. Set

#[#set math.equation(numbering: n => "(2.1)")
 $ w = n + 1 \, #h(2em) B = 2 s + 1 \, #h(2em) Delta = 2 w^3 B \,\
M = min { 2^a : a in bb(Z)_(gt.eq 0) \, med 2^a > B Delta } \, #h(2em) N = M - Delta . $ <eq:parameters>]

The bound $B$ will accommodate all certificate pencils in Proposition 10. The padding width $Delta$ provides the expansion margin, while $M > B Delta$ makes the eventual rank deficit smaller than one block. These choices give $1 lt.eq N < M lt.eq 2 B Delta$.

For a field $K$ and an integer $d gt.eq 1$, let

$ cal(P)_d \( K \) = { f in K \[ z \] : deg f < d } \, $

with its monomial basis. Put $F = bb(Q) \( \( t \) \)$ and $cal(O) = bb(Q) \[ \[ t \] \]$. For $0 lt.eq i lt.eq n$, define an $F$-linear map $T_i : cal(P)_N \( F \) arrow.r cal(P)_M \( F \)$ by

#[#set math.equation(numbering: n => "(2.2)")
 $ f = sum_(a = 0)^(N - 1) c_(i a) \( f \) \( z - i \)^a \, #h(2em) T_i f = sum_(a = 0)^(N - 1) c_(i a) \( f \) t^a \( z - i \)^(M - 1 - a) . $ <eq:rectangular-test>]

The exponents in the output are nonnegative and distinct. Since each $t^a$ is nonzero in $F$, every $T_i$ is injective. Its matrix in the monomial bases has entries in $bb(Z) \[ t \]$. More explicitly, its column corresponding to $z^b$, for $0 lt.eq b < N$, is the coefficient vector of

#[#set math.equation(numbering: n => "(2.3)")
 $ T_i \( z^b \) = sum_(a = 0)^b binom(b, a) i^(b - a) t^a \( z - i \)^(M - 1 - a) . $ <eq:test-column>]

Thus all its entries have $t$-degree at most $N - 1$. Let $R_i \( t \)$ be the $M times M$ matrix obtained by appending $M - N$ zero columns to $T_i$.

The conclusion of this section is the following proposition.

#thm([Proposition 2.1.])[
  (Rectangular rank bound).  #emph[Let $1 lt.eq q lt.eq B$ and $A_0 \, dots.h \, A_n in "Mat"_q \( bb(Q) \)$. Suppose that, for some extension field $E \/ bb(Q)$, some integer $e gt.eq 1$, and some $X_1 \, dots.h \, X_n in "Mat"_e \( E \)$, the matrix 
$ A_0 ⊗ I_e + sum_(i = 1)^n A_i ⊗ X_i $

 is invertible. Then $sum_(i = 0)^n A_i ⊗ T_i$ is injective over $F$, and 
#[#set math.equation(numbering: n => "(2.4)")
 $ "rank"_(bb(Q) \( t \)) (sum_(i = 0)^n A_i ⊗ R_i \( t \)) gt.eq q N > \( q - 1 \) M . $ <eq:padded-rank>]

]
] <prop:rectangular>

We prove the proposition by showing that the maps $T_i$ jointly expand every nonzero subspace of dimension at most $B$. Two elementary facts will control the vanishing orders of their leading coefficients. The ordinary-Wronskian multiplicity method used in the subspace designs of Guruswami and Kopparty #cite(label("GK16")) Section 5.1 of the preprint is a predecessor of this argument. Their construction bounds intersections with multiplicity subspaces; here Taylor reversal relates the vanishing sequences of the input and image spaces. Forbes and Guruswami #cite(label("FG15")) explain broader connections among subspace designs, rank condensers, and dimension expansion. The lossless and unbalanced dimension expanders of Guruswami, Resch, and Xing #cite(label("GRX18")) provided a comparison for the required small-subspace expansion parameters during development. Their linearized-polynomial construction is not used here. We prove the order estimate and the rectangular expansion statement directly for the maps above.

=== 2.1 Vanishing orders and integral reduction <vanishing-orders-and-integral-reduction>

Let $V subset.eq cal(P)_d \( bb(Q) \)$ have dimension $h gt.eq 1$. Row reduction of Taylor coefficient vectors about $z = i$ gives a basis with distinct vanishing orders

$ 0 lt.eq d_(i 1) < dots.h.c < d_(i h) < d . $

These orders describe the entire vanishing filtration: for every integer $r gt.eq 0$,

#[#set math.equation(numbering: n => "(2.5)")
 $ dim_(bb(Q)) { f in V : \( z - i \)^r upright(" divides ") f } = \# { j : d_(i j) gt.eq r } . $ <eq:vanishing-filtration>]

Indeed, in a nonzero linear combination of the echelon basis, the first basis vector with a nonzero coefficient supplies its lowest Taylor term.

The leading-term Wronskian computation in the following lemma is classical; the echelon-basis and Vandermonde argument is also presented by Bostan and Dumas #cite(label("BD10")) Lemmas 1–3.

#thm([Lemma 2.2.])[
  (Wronskian order bound).  #emph[With the notation above, at the $w = n + 1$ points $0 \, dots.h \, n$ one has 
#[#set math.equation(numbering: n => "(2.6)")
 $ sum_(i = 0)^n sum_(j = 1)^h d_(i j) lt.eq h \( d - 1 \) + w binom(h, 2) . $ <eq:wronskian-bound>]

]
] <lem:wronskian-orders>

#proof[
  For a basis $f_1 \, dots.h \, f_h$ of $V$, consider its Wronskian
  $ cal(W) \( z \) = det #scale(x: 120%, y: 120%)[\(] f_j^(\( r \)) \( z \) #scale(x: 120%, y: 120%)[\)]_(0 lt.eq r < h \, thin 1 lt.eq j lt.eq h) . $
  Changing the basis multiplies $cal(W)$ by a nonzero rational constant. At a fixed point $i$, use the echelon basis and write $f_j = alpha_j \( z - i \)^(d_(i j)) +$ higher powers, where $alpha_j eq.not 0$. The contribution of these leading terms to the determinant is
  $ (product_(j = 1)^h alpha_j) det #scale(x: 120%, y: 120%)[\(] \( d_(i j) \)_r #scale(x: 120%, y: 120%)[\)]_(0 lt.eq r < h \, thin 1 lt.eq j lt.eq h) \( z - i \)^(sum_j d_(i j) - binom(h, 2)) \, $
  where $\( X \)_r = X \( X - 1 \) dots.h.c \( X - r + 1 \)$ and $\( X \)_0 = 1$. Because these are monic polynomials of successive degrees, the displayed coefficient determinant is the Vandermonde $product_(a < b) \( d_(i b) - d_(i a) \)$, which is nonzero. Terms using a higher power from any $f_j$ have strictly larger total exponent, or vanish on differentiation. The displayed exponent is nonnegative because the $d_(i j)$ are distinct nonnegative integers. Consequently
  $ "ord"_(z = i) cal(W) = sum_(j = 1)^h d_(i j) - binom(h, 2) \, $
  and in particular $cal(W)$ is not the zero polynomial.
  Each entry in its determinant has degree at most $d - 1$, so $deg cal(W) lt.eq h \( d - 1 \)$. The sum of its vanishing orders at the distinct points $0 \, dots.h \, n$ is at most its degree. This gives (2.6). ◻
]

For a subspace $U subset.eq F^D$, define its reduction by

$ overline(U) = { u med mod med t : u in U ∩ cal(O)^D } subset.eq bb(Q)^D . $

It is important here to use all integral vectors of the subspace, not merely the reductions of an arbitrarily chosen basis.

#thm([Lemma 2.3.])[
  (Integral bases of Laurent-series subspaces).  #emph[Every $k$-dimensional subspace $U subset.eq F^D$ has a basis $u_1 \, dots.h \, u_k in cal(O)^D$ whose reductions are linearly independent. For such a basis, 
#[#set math.equation(numbering: n => "(2.7)")
 $ U ∩ cal(O)^D = xor.big_(j = 1)^k cal(O) u_j \, #h(2em) dim_(bb(Q)) overline(U) = k . $ <eq:integral-lattice>]

]
] <lem:integral-reduction>

#proof[
  We first construct the basis by induction on $k$, the case $k = 0$ being immediate. Multiply a nonzero vector of $U$ by a power of $t$ so that all its coordinates are integral and some coordinate is a unit. Call this vector $u_1$ and its unit coordinate $c$. The subspace of $U$ whose $c$-th coordinate is zero has dimension $k - 1$. By induction it has an integral basis with independent reductions. All those reductions have zero $c$-th coordinate, whereas the reduction of $u_1$ does not. Together they are therefore independent and form a basis of $U$ over $F$.
  Some $k times k$ coordinate minor of the resulting basis matrix is a unit in $cal(O)$. If an $F$-linear combination of its columns is integral, restriction to those coordinates and inversion of that minor show that all its coefficients belong to $cal(O)$. This proves the first assertion of (2.7); reducing its coefficients modulo $t$ proves the second. ◻
]

For a nonzero vector $f$ with Laurent-series coordinates, let $nu_t \( f \)$ denote the minimum of their $t$-valuations. Its #emph[leading reduction] is the nonzero vector $t^(- nu_t \( f \)) f med mod med t$. Any invertible coordinate change over $bb(Q)$ preserves both the integral lattice and this minimum valuation: the change-of-basis matrix and its inverse both have entries in $cal(O)$. In particular, this applies to conversion between monomial and Taylor coordinates. All these statements concern formal series and require no convergence assumption.

=== 2.2 Expansion of every small subspace <expansion-of-every-small-subspace>

For an integral input having a unit Taylor coefficient with index $a lt.eq A$, the leading reduction of its image uses only indices $a lt.eq A$; reversal turns these into output orders at least $M - 1 - A$. The Wronskian bound then rules out too small a common image space. The proof below applies this observation to a suitable subspace for each vanishing order.

#thm([Lemma 2.4.])[
  (Small-subspace expansion).  #emph[For every $k$-dimensional subspace $U subset.eq cal(P)_N \( F \)$ with $1 lt.eq k lt.eq B$, 
#[#set math.equation(numbering: n => "(2.8)")
 $ dim_F (sum_(i = 0)^n T_i U) > \( w - 1 \) k . $ <eq:small-expansion>]

]
] <lem:small-expansion>

#proof[
  Put $W = sum_(i = 0)^n T_i U$ and $ell = dim_F W$. Since $T_0$ is injective, $ell gt.eq k$. By Lemma 4, $overline(U) subset.eq cal(P)_N \( bb(Q) \)$ has dimension $k$ and $overline(W) subset.eq cal(P)_M \( bb(Q) \)$ has dimension $ell$. Write their increasing vanishing orders at $i$ as
  $ a_(i 1) < dots.h.c < a_(i k) \, #h(2em) b_(i 1) < dots.h.c < b_(i ell) . $
  We claim that, for every $i$ and every $1 lt.eq j lt.eq k$,
  #[#set math.equation(numbering: n => "(2.9)")
   $ b_(i \, ell - j + 1) gt.eq M - 1 - a_(i j) . $ <eq:order-reversal>]
  Fix $i \, j$ and set $A = a_(i j)$. Projection of $overline(U)$ onto its Taylor coefficients of orders $0 \, dots.h \, A$ has rank $j$. Choose $j$ vectors in $overline(U)$ whose projections are independent, lift them to integral vectors of $U$, and let $U'$ be their $F$-span. Their reductions are independent, so Lemma 4 shows that these reductions form a basis of $overline(U')$. The chosen Taylor projection is therefore injective on $overline(U')$.
  Take a nonzero $f in U'$ and multiply it by a power of $t$ so that $nu_t \( f \) = 0$. All its Taylor coefficients $c_(i a) \( f \)$ are integral. Because its nonzero reduction has a nonzero low Taylor projection, at least one coefficient with $a lt.eq A$ is a unit. With the convention $nu_t \( 0 \) = + oo$, put
  $ m = min_(0 lt.eq a < N) #scale(x: 120%, y: 120%)[\(] nu_t \( c_(i a) \( f \) \) + a #scale(x: 120%, y: 120%)[\)] . $
  Then $m lt.eq A$, whereas for every $a > A$ one has $nu_t \( c_(i a) \( f \) \) + a gt.eq a > A gt.eq m$. Thus the leading reduction of $T_i f$ uses only output powers $\( z - i \)^(M - 1 - a)$ with $a lt.eq A$. These powers are independent, so their leading coefficients cannot all cancel. Since Taylor coordinate changes preserve minimum valuation, $m$ is also the minimum valuation of the output in monomial coordinates. Its leading reduction consequently vanishes at $i$ to order at least $M - 1 - A$. Figure 1 illustrates this reversal.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, -0.23), (3.3, 0.23), fill: rgb("#ebebff"), stroke: none)
  rect((3, -2.23), (6.3, -1.77), fill: rgb("#ebebff"), stroke: none)
  line((-0.2, 0), (6.6, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6.6, 0), [#text(size: 9pt)[$a$]], anchor: "west", padding: 0.1176cm)
  line((-0.2, -2), (6.6, -2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6.6, -2), [#text(size: 9pt)[order in $z-i$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.08), (0, 0.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0.1411), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  line((3.3, -0.08), (3.3, 0.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.3, 0.1411), [#text(size: 9pt)[$A$]], anchor: "south", padding: 0.1176cm)
  line((6.3, -0.08), (6.3, 0.08), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.3, 0.1411), [#text(size: 9pt)[$N-1$]], anchor: "south", padding: 0.1176cm)
  line((0, -2.08), (0, -1.92), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -2.141), [#text(size: 9pt)[$Delta$]], anchor: "north", padding: 0.1176cm)
  line((3, -2.08), (3, -1.92), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3, -2.141), [#text(size: 9pt)[$M-1-A$]], anchor: "north", padding: 0.1176cm)
  line((6.3, -2.08), (6.3, -1.92), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.3, -2.141), [#text(size: 9pt)[$M-1$]], anchor: "north", padding: 0.1176cm)
  line((0.5, -0.3), (5.8, -1.68), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000099"))))
  line((2.8, -0.3), (3.5, -1.68), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#000099"))))
  content((1.65, 0.45), [#text(size: 8pt)[possible surviving indices]], anchor: "south", padding: 0.1176cm)
  content((3.15, 0.95), [#text(size: 9pt)[A unit coefficient with $a lt.eq A$ forces minimum $t$-valuation $lt.eq A$.]], anchor: "south", padding: 0.1176cm)
  content((3.2, 1.5), [#text(size: 9pt)[$c_a(z-i)^a#h(0.3333em) arrow.r.long.bar#h(0.3333em) c_"at"^a(z-i)^(M-1-a)$]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: Taylor reversal in the expansion argument (schematic, not to scale). For a normalized input with integral Taylor coefficients and a unit among $a lt.eq A$, every term surviving in the leading reduction of its image has $a lt.eq A$. The reduction therefore vanishes to order at least $M - 1 - A$ at $i$. The proof applies this to every vector in a $j$-dimensional subspace, with $A = a_(i j)$. ],
  ) <fig:taylor-reversal>
  This conclusion controls the whole reduction $overline(T_i U')$. Indeed, every nonzero $v in T_i U'$ has a preimage $f in U'$. Normalizing $f$ multiplies $v$ by the same power of $t$, so the leading reduction of $v$ is exactly the leading reduction already considered. An integral $v$ reduces either to this leading reduction or to zero. We have not assumed that $T_i \( U' ∩ cal(O)^N \)$ is the full integral lattice of $T_i U'$. By injectivity of $T_i$ and Lemma 4, $overline(T_i U')$ has dimension $j$. It lies in $overline(W)$ and in its vanishing filtration of order at least $M - 1 - A$. Formula (2.5) now gives (2.9).
  For each fixed $i$, summing (2.9) over $j = 1 \, dots.h \, k$ uses the largest $k$ distinct orders of the same space $overline(W)$. The remaining orders are nonnegative. Although the auxiliary spaces $U'$ may depend on $j$, these are bounds on the fixed filtration of $overline(W)$ and can therefore be summed. Applying Lemma 3 to both reduced spaces gives
  $ ell \( M - 1 \) + w binom(ell, 2) & gt.eq sum_(i = 0)^n sum_(h = 1)^ell b_(i h)\
 & gt.eq w k \( M - 1 \) - sum_(i = 0)^n sum_(j = 1)^k a_(i j)\
 & gt.eq w k \( M - 1 \) - k \( N - 1 \) - w binom(k, 2)\
 & = \( w - 1 \) k \( M - 1 \) + k Delta - w binom(k, 2) . $
  If $ell lt.eq \( w - 1 \) k$, this implies
  $ k Delta lt.eq w (binom(k, 2) + binom(ell, 2)) lt.eq w / 2 #scale(x: 120%, y: 120%)[\(] 1 + \( w - 1 \)^2 #scale(x: 120%, y: 120%)[\)] k^2 lt.eq w^3 / 2 B k < 2 w^3 B k = k Delta \, $
  a contradiction. This proves the strict expansion bound. ◻
]

=== 2.3 From expansion to the rank bound <from-expansion-to-the-rank-bound>

The proof uses the standard shrunk-subspace obstruction: if every coefficient matrix sends a common subspace into one of smaller dimension, no matrix substitution can be invertible. This is the elementary obstruction direction of the noncommutative-rank characterization of Fortin and Reutenauer #cite(label("FR04")) Section 2, Theorem 1; see also #cite(label("IQS18"), form: "prose") Definition 1.1 and Section 5.1. We derive the obstruction from expansion and give the required extension-field comparison explicitly.

#proof[
  Suppose that $sum_i A_i ⊗ T_i$ has a nonzero kernel vector, written as $q$ components $f_1 \, dots.h \, f_q in cal(P)_N \( F \)$. Let $U$ be their span, of dimension $1 lt.eq k lt.eq q lt.eq B$, and choose a basis $u_1 \, dots.h \, u_k$ of $U$. Write
  $ f_alpha = sum_(j = 1)^k P_(alpha j) u_j \, #h(2em) P in "Mat"_(q times k) \( F \) . $
  Since the $f_alpha$ span $U$, the matrix $P$ has rank $k$. Each row of the concatenated matrix
  $ C = \[ thin A_0 P med med A_1 P med med dots.h.c med med A_n P thin \] $
  is a relation among the $w k$ vectors $T_i u_j$: this is exactly the corresponding component of the kernel equation. Those vectors span $sum_i T_i U$, whose dimension is greater than $\( w - 1 \) k$ by Lemma 5. Their relation space therefore has dimension less than $k$, and hence $"rank" C < k$.
  Let $V$ be the column space of $P$ and $V_(-)$ the column space of $C$, both in $F^q$. Equality of row rank and column rank yields
  #[#set math.equation(numbering: n => "(2.10)")
   $ dim_F V = k \, #h(2em) dim_F V_(-) < k \, #h(2em) A_i V subset.eq V_(-) quad \( 0 lt.eq i lt.eq n \) . $ <eq:shrunk-subspace>]
  Thus every coefficient matrix sends the same input subspace into a strictly smaller common output subspace.
  To compare this obstruction with the given witness over $E$, introduce a fresh formal variable $tau$ and work in $J = E \( \( tau \) \)$. Embed $E$ as the constant series and embed $F$ by
  $ sum_m q_m t^m mapsto sum_m q_m tau^m . $
  These embeddings agree on $bb(Q)$, which contains all the $A_i$. A transcendental element already in $E$, even one named $t$, remains a coefficient and is not identified with $tau$. The embeddings preserve matrix ranks, since nonzero minors stay nonzero. Denote the extended subspaces in (2.10) by $V_J$ and $\( V_(-) \)_J$. Putting $X_0 = I_e$, the witness evaluation maps
  $ (sum_(i = 0)^n A_i ⊗ X_i) \( V_J ⊗_J J^e \) subset.eq \( V_(-) \)_J ⊗_J J^e . $
  The domain on the left has dimension $k e$, and the space on the right has dimension strictly less than $k e$. This contradicts invertibility of the witness matrix, whose inverse over $E$ remains an inverse over $J$. The rectangular evaluation is therefore injective.
  In the padded evaluation $sum_i A_i ⊗ R_i \( t \)$, selecting the first $N$ columns within each of the $q$ blocks recovers the rectangular evaluation. Its rank over $F$ is at least $q N$. The corresponding nonzero maximal minor belongs to $bb(Q) \[ t \]$, so it is also nonzero over $bb(Q) \( t \)$. In particular, no coefficient of the formal subspaces or their bases has to be specialized. Finally,
  $ q N - \( q - 1 \) M = M - q Delta gt.eq M - B Delta > 0 \, $
  which proves (2.4). ◻
]

== 3 Deformation inside a division algebra <sec:division>

The rank bound from Proposition 2 is close to full rank. We now deform the test matrices so that every possible rank is a multiple of their block size. The same deformation will also turn a defined nonzero value of a rational formula into an invertible value over an extension field. The construction is a form of the generic cyclic, or symbol, division algebra. Explicit split representations and block-rank divisibility appear in the constructive regularity methods of Ivanyos, Qiao, and Subrahmanyam #cite(label("IQS17")) Sections 4.3 and 5.2 of the preprint; see also their later regularity algorithm #cite(label("IQS18")) Section 4. Division-algebra witnesses and invertible hits are also used in rational-formula black-box testing by Arvind, Chatterjee, and Mukhopadhyay #cite(label("ACM22")) #cite(label("ACM25")). Here the needed deformation and rank-divisibility statement have a direct proof using two explicit matrices. This matrix embedding is distinct from the rational multiplication representation in Section 5.

#thm([Lemma 3.1.])[
  (A matrix lift into a division algebra).  #emph[Let $d gt.eq 1$, let $K$ be a field of characteristic zero, and let $omega in K$ be a primitive $d$th root of unity. On the standard basis $e_0 \, dots.h \, e_(d - 1)$ of $K^d$, with subscripts taken modulo $d$, set 
$ D e_j = omega^j e_j \, #h(2em) S e_j = e_(j + 1) . $

 For algebraically independent indeterminates $p \, r$ over $K$, there is a division algebra 
$ cal(D) subset.eq "Mat"_d #scale(x: 120%, y: 120%)[\(] K \( p \, r \) #scale(x: 120%, y: 120%)[\)] $

 containing, for every $R in "Mat"_d \( K \)$, the matrix 
#[#set math.equation(numbering: n => "(3.1)")
 $ R^(*) = sum_(a \, b = 0)^(d - 1) c_(a b) p^a r^b D^a S^b \, #h(2em) c_(a b) = 1 / d sum_(j = 0)^(d - 1) omega^(- a j) R_(j \, j - b) . $ <eq:division-lift>]

 The matrix $R^(*)$ specializes to $R$ at $p = r = 1$. Moreover, $cal(D)$ has dimension $d^2$ over the central subfield $K \( p^d \, r^d \)$, and every matrix with blocks in $cal(D)$ has rank over $K \( p \, r \)$ divisible by $d$.]
] <lem:division-lift>

#proof[
  For each $b$, the only potentially nonzero entries of $D^a S^b$ have the form
  $ \( D^a S^b \)_(j \, j - b) = omega^(a j) . $
  The identity
  $ sum_(j = 0)^(d - 1) omega^(\( a - a' \) j) = cases(delim: "{", d \, & a = a' \,, 0 \, & a eq.not a' \,) #h(2em) 0 lt.eq a \, a' < d \, $
  therefore gives Fourier inversion separately on each of these cyclic diagonals. In particular, the $d^2$ matrices $D^a S^b$ form a basis of $"Mat"_d \( K \)$, with the coefficients displayed in (3.1). This proves the asserted specialization.
  Put $X = p D$ and $Y = r S$, and let $cal(A)$ be the unital $K$-algebra they generate inside $"Mat"_d \( K \( p \, r \) \)$. Since $D S = omega S D$, we have
  #[#set math.equation(numbering: n => "(3.2)")
   $ X Y = omega Y X \, #h(2em) \( X^i Y^j \) \( X^k Y^ell \) = omega^(- j k) X^(i + k) Y^(j + ell) quad \( i \, j \, k \, ell gt.eq 0 \) . $ <eq:division-monomials>]
  Thus the ordered monomials $X^i Y^j$ span $cal(A)$ over $K$. They are also linearly independent: in any finite relation, the coefficient of the scalar monomial $p^i r^j$ is the corresponding scalar coefficient times the invertible constant matrix $D^i S^j$. Algebraic independence of $p \, r$ forces each such coefficient to vanish.
  Order the exponent pairs lexicographically. For two nonzero elements of $cal(A)$, the largest exponent in their product is the sum of their largest exponents, by (3.2). Its coefficient is the product of two nonzero coefficients and a nonzero power of $omega$. Hence $cal(A)$ has no zero divisors.
  The elements
  $ X^d = p^d I_d \, #h(2em) Y^d = r^d I_d $
  are scalar matrices. We may consequently invert every nonzero element of the central polynomial ring $K \[ p^d \, r^d \] I_d$ and obtain a subalgebra $cal(D)$ of $"Mat"_d \( K \( p \, r \) \)$. Every element of this localization can be written $a \/ z$ with $a in cal(A)$ and $0 eq.not z in K \[ p^d \, r^d \]$. Products of nonzero such fractions remain nonzero, so $cal(D)$ still has no zero divisors.
  Let $F_0 = K \( p^d \, r^d \)$. Reducing the exponents of $X \, Y$ modulo $d$ shows that
  #[#set math.equation(numbering: n => "(3.3)")
   $ { X^a Y^b : 0 lt.eq a \, b < d } $ <eq:division-central-basis>]
  spans $cal(D)$ over $F_0$. To see independence over $F_0$, clear a common denominator in a proposed relation. Expanding the resulting coefficients in $K \[ p^d \, r^d \]$ gives a relation among the ordered monomials over $K$; distinct pairs $\( a \, b \)$ in (3.3) have distinct exponent residues modulo $d$. All its coefficients must therefore vanish. It follows that $dim_(F_0) cal(D) = d^2$.
  For a nonzero $z in cal(D)$, left and right multiplication by $z$ are injective $F_0$-linear maps from this finite-dimensional space to itself, and hence are surjective. There exist $b \, c in cal(D)$ with $z b = 1$ and $c z = 1$, and associativity gives $c = c \( z b \) = \( c z \) b = b$. Thus $z$ has a two-sided inverse in $cal(D)$. This proves that $cal(D)$ is a division algebra. Since $p^a r^b D^a S^b = X^a Y^b$, every lift in (3.1) belongs already to $cal(A)$.
  Finally, consider an arbitrary block matrix with entries in $cal(D)$. If it has a nonzero block, move that block to the first position by block row and column permutations. Writing the result as
  $ mat(delim: "(", a, b; c, E) \, #h(2em) a eq.not 0 \, $
  block elimination gives
  $ mat(delim: "(", 1, 0; - c, I) mat(delim: "(", a^(- 1), 0; 0, I) mat(delim: "(", a, b; c, E) mat(delim: "(", 1, - a^(- 1) b; 0, I) = mat(delim: "(", 1, 0; 0, E - c a^(- 1) b) . $
  All blocks and all these invertible operations remain in $cal(D)$. Iterating reduces the matrix to identity blocks and zero blocks. Each identity block is an ordinary $d times d$ identity matrix, and the operations are invertible over $K \( p \, r \)$ as well. Its ordinary rank is therefore $d$ times the number of identity blocks, as required. ◻
]

The scalar fields in this lemma have different roles. Finite dimensionality and the division property are proved over the central field $K \( p^d \, r^d \)$. Ordinary matrix rank is measured over the larger field $K \( p \, r \)$ in the given embedding. The elimination proof uses only operations in $cal(D)$; it does not enlarge that algebra by arbitrary scalars from $K \( p \, r \)$.

#thm([Proposition 3.2.])[
  (Full-rank deformed pencils).  #emph[Fix a primitive $M$th root of unity $omega in bb(C)$, and lift the padded matrices $R_0 \( t \) \, dots.h \, R_n \( t \)$ by Lemma 6 with $d = M$ and $K = bb(Q) \( omega \) \( t \)$. Let 
$ L \( x \) = A_0 + sum_(i = 1)^n A_i x_i \, #h(2em) A_i in "Mat"_q \( bb(Q) \) \, #h(2em) 1 lt.eq q lt.eq B \, $

 be an affine pencil admitting an invertible matrix evaluation over some extension field of $bb(Q)$. Then 
#[#set math.equation(numbering: n => "(3.4)")
 $ P_(L \, omega) \( t \, p \, r \) := det #h(-0.16667em) (sum_(i = 0)^n A_i ⊗ R_i^(*) \( t \, p \, r \)) eq.not 0 . $ <eq:deformed-pencil-determinant>]

 This is a polynomial in $bb(Q) \( omega \) \[ t \, p \, r \]$ of total degree at most $3 B M^2$. In particular $det R_0^(*)$ is a nonzero polynomial.]
] <prop:pencil-deformation>

#proof[
  Proposition 2 gives
  $ "rank"_(bb(Q) \( t \)) (sum_(i = 0)^n A_i ⊗ R_i \( t \)) gt.eq q N > \( q - 1 \) M . $
  Choose a nonzero minor of order greater than $\( q - 1 \) M$. It remains nonzero over $bb(Q) \( omega \) \( t \)$. The corresponding minor of the lifted matrix specializes to it at $p = r = 1$, so the lifted minor is not identically zero. The lifted matrix consequently has rank greater than $\( q - 1 \) M$ over $bb(Q) \( omega \) \( t \, p \, r \)$.
  Its $M times M$ blocks belong to the division algebra of Lemma 6: each is a rational linear combination of the $R_i^(*)$. Its rank is thus a multiple of $M$. As the whole matrix has order $q M$, its rank must be $q M$, proving (3.4).
  The entries of $R_i \( t \)$ lie in $bb(Z) \[ t \]$ and have degree at most $N - 1$. The Fourier coefficients in (3.1) introduce only the constant denominator $M$, while the factors $p^a r^b$ have total degree at most $2 \( M - 1 \)$. Every lifted entry is therefore a polynomial of total degree at most $N - 1 + 2 \( M - 1 \) < 3 M$. A determinant of order $q M$ has total degree at most $3 q M^2 lt.eq 3 B M^2$.
  For the last assertion, apply the result to the order-one constant pencil $L = 1$, whose coefficient $A_0$ is $1$ and whose other coefficients vanish. Its determinant in (3.4) is exactly $det R_0^(*)$. ◻
]

At any specialization at which $R_0^(*)$ is invertible, set $X_i = \( R_0^(*) \)^(- 1) R_i^(*)$ for $1 lt.eq i lt.eq n$. The identity

#[#set math.equation(numbering: n => "(3.5)")
 $ A_0 ⊗ I_M + sum_(i = 1)^n A_i ⊗ X_i = #scale(x: 120%, y: 120%)[\(] I_q ⊗ \( R_0^(*) \)^(- 1) #scale(x: 120%, y: 120%)[\)] (sum_(i = 0)^n A_i ⊗ R_i^(*)) $ <eq:division-left-normalization>]

shows that simultaneous nonvanishing of the determinant constraints in Proposition 7, including the constant-pencil constraint, makes the corresponding affine pencils invertible on this normalized tuple. The order of multiplication in (3.5) is part of the identity.

#thm([Lemma 3.3.])[
  (An invertible witness for a nonzero formula).  #emph[Every admissible nonzero rational formula over $bb(Q)$ has a defined evaluation at matrices over an extension field of $bb(Q)$ for which its value is invertible.]
] <lem:invertible-witness>

#proof[
  By the definition of nonzero, there is a tuple $W = \( W_1 \, dots.h \, W_n \)$ of rational matrices of some common dimension $d gt.eq 1$ at which the given formula is defined and has nonzero value. Choose a primitive $d$th root $omega$, put $K = bb(Q) \( omega \)$, and lift each $W_i$ to $W_i^(*)$ by Lemma 6.
  We first verify the domain of the actual formula tree independently of the division-algebra argument. Inside $K \( p \, r \)$ consider the commutative ring
  $ cal(O) = {f / g : f \, g in K \[ p \, r \] \, med g \( 1 \, 1 \) eq.not 0} . $
  Evaluation at $\( 1 \, 1 \)$ is a ring homomorphism $epsilon : cal(O) arrow.r K$. An element of $cal(O)$ whose image under $epsilon$ is nonzero is a unit in $cal(O)$: if it is written $f \/ g$, then $f \( 1 \, 1 \) eq.not 0$ and its inverse is $g \/ f$.
  We claim, by induction up the original tree, that each subtree evaluated at the lifted inputs gives a matrix over $cal(O)$ whose image under $epsilon$ is its value at $W$. This holds for leaves by the specialization property of the lift, and is preserved by addition and ordered multiplication. At an inverse gate, let $G in "Mat"_d \( cal(O) \)$ be the already constructed value of the child. Since the original evaluation is defined, $epsilon \( G \)$ is invertible. Consequently
  $ epsilon \( det G \) = det epsilon \( G \) eq.not 0 \, $
  so $det G$ is a unit of $cal(O)$. The formula
  $ G^(- 1) = frac("adj" \( G \), det G) $
  then constructs its inverse in $"Mat"_d \( cal(O) \)$ and gives the correct specialized inverse. This proves the claim at every inverse gate, regardless of its nesting depth.
  The lifted formula is therefore defined over $K \( p \, r \)$. Its final matrix is nonzero, because one of its entries specializes to a nonzero entry of the original final value.
  Now use the division algebra $cal(D)$ from Lemma 6. Every lifted input and every rational scalar constant belongs to $cal(D)$. A second induction shows that every intermediate value belongs to $cal(D)$: sums and products stay in it, and an operand at an inverse gate is already known to be invertible as an ambient matrix, hence is nonzero in $cal(D)$. Its inverse in $cal(D)$ equals its ordinary matrix inverse by uniqueness. The final nonzero value is thus a nonzero element of a division algebra, and is invertible as a matrix over $K \( p \, r \)$. ◻
]

Only those entries proved to lie in $cal(O)$ are specialized in this argument. No specialization map on the whole division algebra is needed. In particular, the inverse of the final value may have a pole at $\( 1 \, 1 \)$ when the original nonzero value is singular; its invertibility is asserted only at the lifted tuple over the extension field. If $d = 1$, the lift leaves every input scalar unchanged, and a nonzero scalar final value is already invertible. The witness dimension $d$ in Lemma 8 is purely existential and need not be bounded. The matrices used in the construction instead have the predetermined block size $M$.

== 4 Encoding a formula and its evaluation domain <sec:encoding>

We now turn the conditions imposed by a rational formula into finitely many affine-pencil invertibility conditions. We keep the original formula tree: an inverse gate must have an invertible operand even when its contribution later cancels or is multiplied by zero. Affine-matrix representations of free-field elements appear in Cohn and Reutenauer #cite(label("CR94")) Section 3.1. Linear realizations by block inverses and tests for the original domain appear in Hrubeš and Wigderson #cite(label("HW15")) Theorem 2.6, Section 6, and Proposition 7.1. Their domain criterion retains pencils for all gate subformulas. We give the recursions and the domain argument in full for the precise tree-size convention used here, and show why the inverse-node pencils together with one root augmentation suffice. The argument concerns the given tree and requires no domain-preserving balancing transformation.

For a subtree $h$, let $\| h \|$ denote its number of vertices, let $lambda \( h \)$ denote its number of leaves, and let $iota \( h \)$ denote its number of inverse gates. Each occurrence of a subtree is treated separately. A pencil of order $q$ has the form

$ L \( x \) = A_0 + sum_(i = 1)^n A_i x_i \, #h(2em) A_0 \, dots.h \, A_n in "Mat"_q \( bb(Q) \) . $

At a tuple $X = \( X_1 \, dots.h \, X_n \)$ of matrices of order $d$ over a field extension of $bb(Q)$, its evaluation is

$ L \( X \) = A_0 ⊗ I_d + sum_(i = 1)^n A_i ⊗ X_i . $

When a constant row $u$ or column $v$ is used with such an evaluation, we write $u$ and $v$ for $u ⊗ I_d$ and $v ⊗ I_d$, respectively. Thus the expression $u L \( X \)^(- 1) v$ is a matrix of order $d$.

#thm([Lemma 4.1.])[
  (Affine realization of a subtree).  #emph[For each subtree $h$ there are an affine pencil $L_h$ of order $q_h$, a constant rational row $u_h$ of length $q_h$, and a constant rational column $v_h$ of length $q_h$, such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ q_h = 2 lambda \( h \) + iota \( h \) = \| h \| + 1 . $ <eq:realization-order>]

 At every matrix tuple over every field extension of $bb(Q)$ where the original subtree $h$ is defined, $L_h$ is invertible and 
#[#set math.equation(numbering: n => "(4.2)")
 $ h = u_h L_h^(- 1) v_h . $ <eq:realization-invariant>]

]
] <lem:formula-realization>

#proof[
  Here are the constructions, followed by verification of the invariant. All zero blocks have the sizes prescribed by the adjacent blocks.
  #emph[Leaf.] If $h$ is a variable or a rational constant, set
  $ L_h = mat(delim: "(", 1, - h; 0, 1) \, #h(2em) u_h = mat(delim: "(", 1, 0) \, #h(2em) v_h = vec(0, 1) . $
  #emph[Addition.] For $h = f + g$, set
  $ L_h = mat(delim: "(", L_f, 0; 0, L_g) \, #h(2em) u_h = mat(delim: "(", u_f, u_g) \, #h(2em) v_h = vec(v_f, v_g) . $
  #emph[Ordered multiplication.] For $h = f g$, set
  $ L_h = mat(delim: "(", L_f, - v_f u_g; 0, L_g) \, #h(2em) u_h = mat(delim: "(", u_f, 0) \, #h(2em) v_h = vec(0, v_g) . $
  #emph[Inversion.] For $h = g^(- 1)$, set
  $ L_h = mat(delim: "(", L_g, v_g; u_g, 0) \, #h(2em) u_h = mat(delim: "(", 0, - 1) \, #h(2em) v_h = vec(0, 1) \, $
  where the zero part of each selector has length $q_g$. Equivalently, $u_h = - e_(q_g + 1)^(sans(T))$ and $v_h = e_(q_g + 1)$.
  The rows and columns just specified are constant. In particular, $v_f u_g$ is a constant matrix, so every displayed pencil is affine in the original variables. No multiplication of variable entries is introduced into a pencil.
  Fix an evaluation tuple and prove the invariant by induction on the subtree. A leaf pencil has inverse $mat(delim: "(", I_d, h; 0, I_d)$, and its selectors give $h$. At an addition gate, definedness of the gate implies definedness of both children. Their pencils are invertible by induction, and block-diagonal inversion gives the sum of the two represented values. At a multiplication gate, the same induction gives
  $ L_h^(- 1) = mat(delim: "(", L_f^(- 1), L_f^(- 1) v_f u_g L_g^(- 1); 0, L_g^(- 1)) . $
  The selected block is consequently
  $ u_f L_f^(- 1) v_f u_g L_g^(- 1) v_g = \( u_f L_f^(- 1) v_f \) \( u_g L_g^(- 1) v_g \) = f g \, $
  with the required order of multiplication.
  At an inverse gate $h = g^(- 1)$, definedness means that $g$ is defined and its value is invertible. By induction $L_g$ is invertible and $u_g L_g^(- 1) v_g = g$. The block factorization
  #[#set math.equation(numbering: n => "(4.3)")
   $ mat(delim: "(", L_g, v_g; u_g, 0) = mat(delim: "(", I, 0; u_g L_g^(- 1), I) mat(delim: "(", L_g, 0; 0, - g) mat(delim: "(", I, L_g^(- 1) v_g; 0, I) $ <eq:inverse-schur-factorization>]
  shows that $L_h$ is invertible. The lower-right block of its inverse is $\( - g \)^(- 1) = - g^(- 1)$, so the negative row selector gives precisely $g^(- 1)$. This proves the invariant in all four cases.
  The orders are $2$ at leaves, add at binary gates, and increase by one at inverse gates. Hence $q_h = 2 lambda \( h \) + iota \( h \)$. A rooted tree whose internal vertices have one or two children has $lambda \( h \) - 1$ binary vertices: counting edges both by vertices and by children gives this identity. Thus
  $ \| h \| = lambda \( h \) + \( lambda \( h \) - 1 \) + iota \( h \) = 2 lambda \( h \) + iota \( h \) - 1 \, $
  which proves (4.1). ◻
]

For the root formula $Phi$, define its #emph[root augmentation] by

#[#set math.equation(numbering: n => "(4.4)")
 $ J_Phi = mat(delim: "(", L_Phi, v_Phi; u_Phi, 0) . $ <eq:root-augmentation>]

This has the same block form as an inverse-node pencil, but no inverse gate is being added to the formula or counted in its size.

#thm([Proposition 4.2.])[
  (Pencil certificates for the original formula tree).  #emph[Let $Phi$ be a formula of size at most $s$, and put $B = 2 s + 1$. Form the indexed collection $cal(C)_Phi$ consisting of $L_h$ for every inverse-node occurrence $h$ of $Phi$, together with $J_Phi$. Then:]
  + #emph[The collection contains at most $s + 1$ affine pencils over $bb(Q)$, each of positive order at most $B$.]
  + #emph[At every tuple of matrices of a common positive order over a field extension of $bb(Q)$, all pencils in $cal(C)_Phi$ are invertible if and only if the original formula tree $Phi$ is defined there and its value is invertible.]
  + #emph[If $Phi$ is admissible and nonzero, there is a single tuple over some field extension of $bb(Q)$ at which every pencil in $cal(C)_Phi$ is invertible.]
  #emph[Adding the order-one constant pencil $1$ for normalization gives at most $s + 2$ pencils, still of order at most $B$, with the same simultaneous feasibility property in the third assertion.]
] <prop:formula-certificates>

#proof[
  There are at most $s$ inverse-node occurrences. By Lemma 9, each corresponding pencil has order $\| h \| + 1 lt.eq s + 1 lt.eq B$. The augmentation has order $\| Phi \| + 2 lt.eq s + 2 lt.eq 2 s + 1 = B$, where the last inequality uses $s gt.eq 1$. This proves the first assertion. The extra constant pencil has order one and evaluates to an identity matrix at every tuple.
  For one implication in the second assertion, assume that $Phi$ is defined and its value is invertible. Each subtree is then defined, so Lemma 9 makes every inverse-node pencil invertible. The same lemma makes $L_Phi$ invertible and gives $u_Phi L_Phi^(- 1) v_Phi = Phi$. Applying factorization (4.3) at the root shows that $J_Phi$ is invertible, because its Schur complement is $- Phi$.
  Conversely, suppose all pencils in $cal(C)_Phi$ are invertible. First establish that the original tree is defined, proceeding from the leaves toward the root. Leaves are always defined. At an addition or multiplication gate, both children have already been shown defined, so the gate is defined. At an inverse gate $h = g^(- 1)$, all gates in the child subtree have already been handled; in particular $g$ is defined. Lemma 9 therefore makes $L_g$ invertible and represents $g$ by $u_g L_g^(- 1) v_g$. The pencil $L_h$ is one of the assumed invertible pencils. The two outer factors in (4.3) are invertible, so the middle factor is invertible as well. It follows that $g$ is invertible, which is exactly the condition needed for this inverse gate to be defined.
  This induction proves definedness of the entire original tree. It also explains why no separate constraint on the pencil of an ordinary subtree is needed: whenever that pencil is used, its invertibility already follows from the established definedness of its subtree. Now $L_Phi$ is invertible by the realization lemma. The assumed invertibility of $J_Phi$, whose Schur complement is $- Phi$, forces the final value $Phi$ to be invertible. This proves the reverse implication without simplifying the formula or enlarging its domain.
  Finally, if $Phi$ is admissible and nonzero, Lemma 8 supplies an evaluation over a field extension of $bb(Q)$ at which the original tree is defined and its value is invertible. The second assertion makes every pencil in $cal(C)_Phi$ invertible at this one evaluation. The constant pencil $1$ is invertible there as well. This proves the third assertion and the normalization statement. ◻
]

#prodef([Remark 4.3.])[
  (Why every inverse occurrence is retained).  Consider the scalar expression
  $ a = x^(- 1) \, #h(2em) b = a^(- 1) \, #h(2em) Phi = b + 1 . $
  It is undefined at $x = 0$, although its simplified rational function is $x + 1$. For the pencils above, direct computation gives
  $ det L_a = - x \, #h(2em) det L_b = 1 \, #h(2em) det J_Phi = - \( x + 1 \) . $
  Thus the outer inverse pencil and the root augmentation alone would accept $x = 0$. The retained inner inverse pencil $L_a$ rejects it. Likewise, the formula $1 + 0 dot.op x^(- 1)$ retains the requirement that $x$ be invertible. The certificate collection is indexed by gates of the given tree, including gates in branches whose later contributions cancel.
]

The witnesses and pencils in this section are used to prove the hitting property; the generator will receive only $n \, s$ and will not construct them from an unknown formula. The order and count bounds depend only on the number of vertices. They impose no restriction on inverse nesting or on the bit lengths of the rational leaf constants.

== 5 A rational hitting list and its bit complexity <sec:generator>

Proposition 7 supplies polynomial matrices $R_i^(*) \( t \, p \, r \)$ for which $sum_i A_i ⊗ R_i^(*)$ is invertible over $bb(Q) \( omega \) \( t \, p \, r \)$ whenever the pencil $A_0 + sum_(i = 1)^n A_i x_i$ is feasible and has order at most $B$. We now replace the root-of-unity coefficients and specialize the three parameters to obtain a single list of rational matrix tuples. The parameters $w \, B \, Delta \, M \, N$ retain their earlier definitions.

To remove the root of unity, we represent multiplication in a finite-dimensional rational algebra. Over $bb(C)$ this representation is a direct sum of root evaluations, so our invertibility conditions must hold simultaneously at all roots. Set

#[#set math.equation(numbering: n => "(5.1)")
 $ ell = M / 2 \, #h(2em) D = M ell = M^2 / 2 \, #h(2em) H = 1 + 3 \( s + 2 \) B M^3 \, #h(2em) cal(R) = bb(Q) \[ xi \] \/ \( xi^ell + 1 \) . $ <eq:generator-parameters>]

Here and below $xi$ also denotes its residue class. In particular, $xi^ell = - 1$ and $xi^M = 1$, so every integral power of $xi$, including a negative power, reduces to a signed member of the basis $1 \, xi \, dots.h \, xi^(ell - 1)$.

=== 5.1 The rational representation and the generator <the-rational-representation-and-the-generator>

Let $Omega$ be the set of complex roots of $X^ell + 1$. Since $M$ is a power of two, these are the $ell$ distinct numbers

$ exp #h(-0.16667em) (frac(2 pi upright(i) \( 2 j + 1 \), M)) \, #h(2em) 0 lt.eq j < ell . $

Every one is a primitive $M$th root of unity: its exponent $2 j + 1$ is coprime to $M$. Evaluation at these roots is an algebra isomorphism

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(R) ⊗_(bb(Q)) bb(C) arrow.r product_(omega in Omega) bb(C) \, #h(2em) f mapsto #scale(x: 120%, y: 120%)[\(] f \( omega \) #scale(x: 120%, y: 120%)[\)]_(omega in Omega) . $ <eq:cyclotomic-splitting>]

Indeed, a polynomial of degree less than $ell$ is uniquely determined by its values at $ell$ distinct points, and interpolation gives a polynomial with any prescribed values there.

For $a in cal(R)$, let $rho \( a \) in "Mat"_ell \( bb(Q) \)$ be the matrix of multiplication by $a$ in the power basis. This is a unital algebra homomorphism. It is computed using only rational arithmetic and the relation $xi^ell = - 1$. To make its splitting explicit, let $V$ be the evaluation matrix whose $\( omega \, j \)$ entry is $omega^j$, for $omega in Omega$ and $0 lt.eq j < ell$. Interpolation says that $V$ is invertible, and

#[#set math.equation(numbering: n => "(5.3)")
 $ V rho \( a \) V^(- 1) = "diag" #scale(x: 120%, y: 120%)[\(] a \( omega \) : omega in Omega #scale(x: 120%, y: 120%)[\)] . $ <eq:regular-representation-splitting>]

If $Q in "Mat"_d \( cal(R) \)$, write $rho_d \( Q \)$ for the rational $d ell$ by $d ell$ matrix obtained by applying $rho$ to every entry. First changing basis by $I_d ⊗ V$, and then reordering the basis to group together coordinates belonging to the same root, gives

#[#set math.equation(numbering: n => "(5.4)")
 $ rho_d \( Q \) tilde.op_(bb(C)) xor.big_(omega in Omega) Q \( omega \) . $ <eq:matrix-regular-splitting>]

In particular, $rho_d \( Q \)$ is invertible if and only if every $Q \( omega \)$ is invertible. These complex basis changes are used to prove this assertion; the generator will not compute them.

We use the lift of Lemma 6, now with $xi$ in place of a primitive root. For clarity, it can be computed directly over $cal(R)$. Number the coordinates from $0$ to $M - 1$ and set

$ D_xi e_j = xi^j e_j \, #h(2em) S e_j = e_(j + 1) \, $

with indices taken modulo $M$. For $0 lt.eq i lt.eq n$ define

#[#set math.equation(numbering: n => "(5.5)")
 $ tilde(c)_(i \, a \, b) \( t \) & = 1 / M sum_(j = 0)^(M - 1) xi^(- a j) \( R_i \( t \) \)_(j \, j - b) \, &  & 0 lt.eq a \, b < M \,\
tilde(R)_i \( t \, p \, r \) & = sum_(a \, b = 0)^(M - 1) tilde(c)_(i \, a \, b) \( t \) p^a r^b D_xi^a S^b in "Mat"_M #scale(x: 120%, y: 120%)[\(] cal(R) \[ t \, p \, r \] #scale(x: 120%, y: 120%)[\)] . $ <eq:universal-cyclotomic-lift>]

Evaluating its coefficients at $xi = omega$ gives exactly the lifted matrix $R_i^(* \, omega) \( t \, p \, r \)$ from Proposition 7. In particular, no choice of a complex root is needed to compute (5.5).

The generator, on input $1^n \, 1^s$, performs the following finite computation in a fixed order.

+ Compute the integer parameters and the explicit matrices $R_0 \( t \) \, dots.h \, R_n \( t \)$ of Proposition 2.
+ For each $\( t_0 \, p_0 \, r_0 \) in { 1 \, dots.h \, H }^3$, compute
  $ Z_i = rho_M #scale(x: 120%, y: 120%)[\(] tilde(R)_i \( t_0 \, p_0 \, r_0 \) #scale(x: 120%, y: 120%)[\)] in "Mat"_D \( bb(Q) \) \, #h(2em) 0 lt.eq i lt.eq n . $
+ If $Z_0$ is singular, emit nothing for this triple. Otherwise emit the tuple
  #[#set math.equation(numbering: n => "(5.6)")
   $ #scale(x: 120%, y: 120%)[\(] Z_0^(- 1) Z_1 \, dots.h \, Z_0^(- 1) Z_n #scale(x: 120%, y: 120%)[\)] . $ <eq:generator-output>]

Denote the resulting list by $cal(H)_(n \, s)$. Repetitions are harmless. Every tuple has the same positive matrix dimension $D$.

=== 5.2 The hitting property <the-hitting-property>

#thm([Proposition 5.1.])[
  #emph[Every nonzero admissible formula of size at most $s$ has a defined, invertible evaluation at a tuple in $cal(H)_(n \, s)$.]
] <prop:generator-hitting>

#proof[
  Fix one such formula $Phi$. By Proposition 10, there is a family of at most $s + 1$ affine linear pencils over $bb(Q)$, each of order at most $B$, whose simultaneous invertibility ensures that the original formula tree is defined and has an invertible value. These are the pencils of all inverse-node occurrences and the root augmentation. Each has an invertible evaluation over an extension field. Add the order-one constant pencil $1$ to this family, and call the resulting family $hat(cal(C))_Phi$. Thus $\| hat(cal(C))_Phi \| lt.eq s + 2$.
  For $L = A_0 + sum_(i = 1)^n A_i x_i in hat(cal(C))_Phi$ and $omega in Omega$, recall from Proposition 7 that
  $ P_(L \, omega) \( t \, p \, r \) = det #h(-0.16667em) (sum_(i = 0)^n A_i ⊗ R_i^(* \, omega) \( t \, p \, r \)) . $
  Proposition 7 says that each of these is a nonzero polynomial of total degree at most $3 B M^2$. Regard all of them as polynomials in the one integral domain $bb(C) \[ t \, p \, r \]$ and form
  $ P_Phi \( t \, p \, r \) = product_(L in hat(cal(C))_Phi) product_(omega in Omega) P_(L \, omega) \( t \, p \, r \) . $
  This is a finite product of nonzero polynomials, and
  #[#set math.equation(numbering: n => "(5.7)")
   $ deg P_Phi lt.eq \( s + 2 \) M / 2 thin 3 B M^2 = 3 / 2 \( s + 2 \) B M^3 < H . $ <eq:generator-product-degree>]
  The extension field used to witness invertibility of a pencil is not part of this coefficient ring: the $A_i$ are rational, and the displayed lift has coefficients in $bb(Q) \( omega \)$. Thus there is no need to embed that witness field into $bb(C)$.
  A nonzero polynomial in three variables of total degree less than $H$ cannot vanish on all of ${ 1 \, dots.h \, H }^3$. To see this, suppose it did. Fixing the last two coordinates gives a univariate polynomial of degree less than $H$ with $H$ roots, so every coefficient in the first variable vanishes on the two-dimensional grid. Repeating the same argument for the second and then the third variable makes every coefficient zero, a contradiction. Choose a triple at which $P_Phi$ is nonzero.
  At this triple every root evaluation of $tilde(R)_0$ is invertible, by the factor corresponding to the constant pencil $1$. Equation (5.4) therefore shows that $Z_0$ is invertible, so the generator retains the triple. The same equation, applied to each raw pencil, shows that
  $ sum_(i = 0)^n A_i ⊗ Z_i $
  is invertible for every $L in hat(cal(C))_Phi$. If $L$ has order $q$, left multiplication gives the exact identity
  #[#set math.equation(numbering: n => "(5.8)")
   $ \( I_q ⊗ Z_0^(- 1) \) (sum_(i = 0)^n A_i ⊗ Z_i) = A_0 ⊗ I_D + sum_(i = 1)^n A_i ⊗ \( Z_0^(- 1) Z_i \) . $ <eq:generator-normalization>]
  Hence all the certificate pencils are invertible on the rational tuple (5.6).
  The preceding splitting proved invertibility after extending scalars to $bb(C)$. For a rational matrix this implies that its rational determinant is nonzero; the adjugate formula then supplies its inverse over $bb(Q)$. We may consequently apply Proposition 10 directly over $bb(Q)$ to the output tuple. It makes every required inverse of the original tree defined over $bb(Q)$ and makes the final value invertible. This also shows why no assertion about preservation of arbitrary inverse domains under a homomorphism is needed. ◻
]

#thm([Corollary 5.2.])[
  #emph[Let $L = A_0 + sum_(i = 1)^n A_i x_i$ be a rational affine linear pencil of order $q lt.eq B$ that admits an invertible matrix evaluation over an extension field of $bb(Q)$. There is a tuple $X in cal(H)_(n \, s)$ for which $L \( X \)$ is invertible.]
] <cor:pencil-hitting>

#proof[
  Use the same argument with the two pencils $L$ and $1$. The product of their determinant polynomials over all $omega in Omega$ is nonzero and has total degree at most $3 B M^3 < H$. A grid point where this product is nonzero is retained by the generator, and (5.8) makes $L$ invertible at its output tuple. ◻
]

The proof of Proposition 12 fixes $Phi$ only after the list has been specified. Its polynomial $P_Phi$ is used solely to prove the existence of a good triple in the fixed grid; the generator never constructs this polynomial, the certificates, or a witness evaluation. Different formulas may use different triples. Arbitrarily large rational constants change the coefficients of $P_Phi$, but neither its degree bound nor the construction of $cal(H)_(n \, s)$.

=== 5.3 Bit complexity and output length <bit-complexity-and-output-length>

#thm([Proposition 5.3.])[
  #emph[The list $cal(H)_(n \, s)$ can be constructed and written by one deterministic Turing machine in a number of bit operations bounded by a fixed polynomial in $n + s + 1$. Its entire binary encoding has length bounded by a fixed polynomial in the same quantity.]
] <prop:generator-complexity>

#proof[
  Put $m = n + s + 1$. The parameter definitions give
  $ w lt.eq m \, #h(2em) B lt.eq 2 m \, #h(2em) Delta lt.eq 4 m^4 \, #h(2em) M lt.eq 2 B Delta lt.eq 16 m^5 . $
  Consequently
  #[#set math.equation(numbering: n => "(5.9)")
   $ H = O \( m^17 \) \, #h(2em) D = O \( m^10 \) \, #h(2em) H^3 = O \( m^51 \) . $ <eq:generator-dimension-bounds>]
  Counting the unary inputs, forming these parameters, and finding $M$ by successive doubling all take polynomial time.
  We first bound the integers actually computed at a grid triple. For an input monomial $z^j$, where $0 lt.eq j < N$, the defining formula for $T_i$ gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ T_i z^j = sum_(a = 0)^j binom(j, a) i^(j - a) t^a \( z - i \)^(M - 1 - a) . $ <eq:generator-binomial-formula>]
  Expanding each power in the monomial basis computes every entry using integer arithmetic. Each coefficient in either of the two basis expansions has absolute value at most $2^M w^M$. At a grid value $1 lt.eq t lt.eq H$, an entry of the padded matrix $R_i \( t \)$ therefore has absolute value at most
  $ M thin 2^(2 M) w^(2 M) H^M . $
  In (5.5), the only division of a coefficient is by $M$. All powers of $xi$ reduce to signed basis monomials. The Fourier sum and the lift involve polynomially many terms, and $p^a r^b lt.eq H^(2 M)$ on the grid. For example, the absolute values of the power-basis coefficients of every entry of $M tilde(R)_i \( t \, p \, r \)$ are bounded by
  $ M^4 thin 2^(2 M) w^(2 M) H^(3 M) . $
  Multiplication by a power-basis monomial merely permutes those coefficients and changes signs. Thus
  #[#set math.equation(numbering: n => "(5.11)")
   $ U_i := M Z_i in "Mat"_D \( bb(Z) \) \, #h(2em) b = O #h(-0.16667em) (M log #scale(x: 120%, y: 120%)[\(] \( w + 1 \) \( H + 1 \) #scale(x: 120%, y: 120%)[\)] + log M) = O \( m^5 log m \) $ <eq:generator-input-bit-bound>]
  is a common bound on the bit lengths of their entries. These calculations have explicit nested loops of polynomial length: binomial coefficients may be formed by Pascal’s recurrence, integer powers by repeated multiplication, and all ring coefficients by the signed reductions just described. Every intermediate sum and product in these loops has polynomial bit length. The matrices $U_i$ can therefore be constructed in polynomial bit time.
  The common clearing factor cancels in normalization:
  #[#set math.equation(numbering: n => "(5.12)")
   $ Z_0^(- 1) Z_i = U_0^(- 1) U_i . $ <eq:generator-common-denominator>]
  If $U_0$ is nonsingular, Cramer’s rule computes each column of this matrix using $det U_0$ and determinants of $U_0$ with one column replaced by a column of $U_i$. All these are integer matrices of order $D$ with the same entry bit bound $b$. Every minor of any such matrix has absolute value at most $D ! 2^(D b)$. Hence its bit length is bounded by
  #[#set math.equation(numbering: n => "(5.13)")
   $ Lambda = O #scale(x: 120%, y: 120%)[\(] D \( b + log \( D + 1 \) \) #scale(x: 120%, y: 120%)[\)] = O \( m^15 log m \) . $ <eq:generator-minor-bit-bound>]
  Each output entry is a ratio of two such determinants. It can be written with a signed binary numerator and a positive binary denominator using $O \( Lambda \)$ bits, changing both signs if necessary. Cancelling their gcd is optional for this encoding.
  For completeness, exact Gaussian elimination computes the needed determinants in polynomial bit time without permitting fractions to grow unchecked. Let $A$ be any one of these integer matrices. After $k$ successful pivots, let $I_k$ be the ordered list of the selected original row indices, and let
  $ B_k = A \[ I_k \, { 1 \, dots.h \, k } \] . $
  This submatrix is invertible. For an unselected row index $u$ and a column $v > k$, the remaining Gaussian entry is
  #[#set math.equation(numbering: n => "(5.14)")
   $ A_(u v) - A \[ u \, { 1 \, dots.h \, k } \] thin B_k^(- 1) A \[ I_k \, v \] = frac(det mat(delim: "(", B_k, A \[ I_k \, v \]; A \[ u \, { 1 \, dots.h \, k } \], A_(u v)), det B_k) . $ <eq:generator-pivot-minors>]
  For $k = 0$ the denominator is $1$ and the entry is $A_(u v)$. The determinant identity follows by subtracting the appropriate linear combination of the first $k$ block rows from the last row. It also shows inductively that ordinary Gaussian updates compute the displayed entries.
  If the next pivot column has a nonzero remaining entry, swap its row into the pivot position and append that original row index to $I_k$. These swaps involve only unselected rows, so they do not change any previously selected submatrix. Writing the next pivot as $p_(k + 1)$, equation (5.14) gives
  $ p_(k + 1) = frac(det B_(k + 1), det B_k) \, #h(2em) p_1 dots.h.c p_k = det B_k . $
  If the entire next remaining column is zero, the Schur complement is singular and $det A = 0$. Otherwise all $D$ pivots can be taken, and their product, multiplied by the sign of the accumulated row permutation, equals $det A$.
  Both the stored Gaussian entries and the accumulated pivot products, when reduced to fractions, therefore have $O \( Lambda \)$-bit numerators and denominators: they are ratios of minors or minors themselves. Each individual update combines only a constant number of these fractions, so its intermediate products and sums also have $O \( Lambda \)$ bits before reduction. Integer addition, multiplication, and division on such operands have polynomial bit cost by the elementary digit algorithms. Gcd reduction does as well: in the Euclidean algorithm the nonzero remainders decrease by a factor of at least two within every two steps, so there are $O \( Lambda \)$ polynomial-cost divisions. There are $O \( D^3 \)$ Gaussian arithmetic updates. Pivot searches, row swaps, and sign bookkeeping also have polynomial cost. This proves polynomial bit time for each determinant, including singular matrices and all the column-replaced matrices used by Cramer’s rule.
  At each grid triple, at most $n D^2 + 1$ determinants suffice for the singularity test and all output entries. Equations (5.9)–(5.13) therefore give a fixed polynomial bound on the total computation. The complete list contains at most $H^3 n D^2$ rational entries, so its encoding length is
  #[#set math.equation(numbering: n => "(5.15)")
   $ O \( H^3 n D^2 Lambda \) = O \( m^87 log m \) . $ <eq:generator-output-bit-bound>]
  Dimensions, signs, and fixed delimiters fit within the same bound. A fixed delimited encoding allows the list to be written as its entries are produced; if its length is placed first, one may instead buffer the polynomial-length list or make a preliminary counting pass.
  Finally, these arithmetic and loop bounds give a Turing-machine bound as well. All arrays have polynomially many entries of polynomial bit length. They may be stored as indexed binary records on work tapes; even scanning all records for each requested access adds only a fixed polynomial factor. The loops, elementary digit algorithms, and delimiters are fixed in advance. Thus one deterministic Turing machine performs the construction and writes the whole list within $C \( n + s + 1 \)^k$ bit operations for some fixed positive integers $C \, k$. None of its arithmetic uses the constants or coefficients of an unknown formula. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Use the generator just defined. Proposition 12 gives the universal hitting property, with invertible and therefore nonzero output values. Proposition 14 gives both required polynomial bounds, after increasing the same fixed constants $C \, k$ if necessary. The generator is deterministic and depends only on its two unary inputs. ◻
]

== 6 A universal rank-detecting list <sec:rank>

The hitting list and its complexity bounds are now established. We use the pencil-hitting consequence to recover the exact noncommutative rank of a rectangular affine pencil from one list that is independent of all coefficient values. The additional input is the characterization of free-field rank by normalized matrix-evaluation ranks, recalled in the proof.

#thm([Corollary 6.1.])[
  #emph[Let $a \, b gt.eq 1$ and $k gt.eq 0$, and put $P = a + b + k + 1$. From these parameters in unary, a deterministic generator constructs a nonempty finite list $cal(R)_(a \, b \, k)$ of pairs 
$ \( e \, X \) \, #h(2em) e gt.eq 1 \, quad X = \( X_1 \, dots.h \, X_k \) in "Mat"_e \( bb(Q) \)^k \, $

 in a fixed polynomial in $P$ bit operations. Its number of entries, total binary encoding length, and every matrix dimension $e$ are bounded by fixed polynomials in $P$. The list depends only on $a \, b \, k$.]
  #emph[For every rectangular rational affine pencil 
$ A \( x \) = A_0 + sum_(i = 1)^k A_i x_i \, #h(2em) A_i in bb(Q)^(a times b) \, $

 write $"ncrk" A$ for its rank over the free skew field on $x_1 \, dots.h \, x_k$ over $bb(Q)$, with ordinary rational rank when $k = 0$. Then the exact identity 
#[#set math.equation(numbering: n => "(6.1)")
 $ "ncrk" A = max_(\( e \, X \) in cal(R)_(a \, b \, k)) frac("rank"_(bb(Q)) #h(-0.16667em) (A_0 ⊗ I_e + sum_(i = 1)^k A_i ⊗ X_i), e) $ <eq:rank-detecting-list>]

 holds for all choices and bit lengths of the coefficients.]
  #emph[Suppose that, at each requested pair $\( e \, X \)$, an oracle returns either the complete exact rational $a e$ by $b e$ matrix in (6.1), in binary rational encoding, or its exact ordinary rank. Querying the whole list nonadaptively and taking the maximum of the exact quotients returns $"ncrk" A$. If $L$ is the total binary length of the responses, list generation, query writing, and response processing use $"poly" \( P + L \)$ bit operations, in addition to the sum of the oracle’s costs. The response lengths and oracle costs may depend on the coefficient heights. If $a = 0$ or $b = 0$, the rank is zero and no queries are needed.]
] <cor:rank-detecting-list>

#proof[
  #emph[Affine evaluations and free-field rank.] Put $H \( z \) = sum_(i = 0)^k A_i z_i$, with a new variable $z_0$. The coefficient-span invariance of Fortin and Reutenauer #cite(label("FR04")) Section 2, Corollary 1, and Section 3, Lemma 1 includes the constant coefficient: the free-field rank of a rectangular affine linear matrix depends only on the span of all its coefficient matrices. The coefficient spans of $A$ and $H$ are both $"span"_(bb(Q)) { A_0 \, dots.h \, A_k }$, so their free-field ranks agree. This uses coefficient-span invariance, not a specialization $z_0 = 1$ in a free skew field.
  For $e gt.eq 1$, let $h_e$ be the maximum rank of $sum_(i = 0)^k A_i ⊗ Z_i$ over $Z_i in "Mat"_e \( bb(Q) \)$, and let $alpha_e$ be the maximum rank of $A_0 ⊗ I_e + sum_(i = 1)^k A_i ⊗ X_i$ over rational $X_i$. Zero-padding the $A_i$ to square matrices of order $max \( a \, b \)$ preserves both free-field rank and every ordinary blow-up rank. The homogeneous blow-up characterization and its attainment over $bb(Q)$ #cite(label("IQS18")) arXiv version, Definition 1.2 and its discussion, Theorem 1.5 therefore give
  $ r := "ncrk" A = max_(e gt.eq 1) h_e / e \, $
  with the maximum attained. The tensor order used in that reference differs from $A_i ⊗ Z_i$ only by row and column permutations. Here padding is used to preserve ranks, not to test invertibility.
  For each fixed $e$, taking $Z_0 = I_e$ gives $alpha_e lt.eq h_e$. If $h_e > 0$, some $h_e$ by $h_e$ minor is a nonzero polynomial $p$ in the entries of the $Z_i$. The polynomial $p det Z_0$ is nonzero; since $bb(Q)$ is infinite, it is nonzero at a rational tuple. There $Z_0$ is invertible and the rank is $h_e$. Right multiplication gives
  $ (sum_(i = 0)^k A_i ⊗ Z_i) \( I_b ⊗ Z_0^(- 1) \) = A_0 ⊗ I_e + sum_(i = 1)^k A_i ⊗ \( Z_i Z_0^(- 1) \) \, $
  without changing rank. The case $h_e = 0$ is immediate, so $alpha_e = h_e$ for every $e$. Consequently
  #[#set math.equation(numbering: n => "(6.2)")
   $ r = max_(e gt.eq 1) alpha_e / e $ <eq:affine-normalized-rank>]
  is attained: every individual affine evaluation has rank at most $r e$, and some rational evaluation has rank exactly $r e$. No bound on the dimension or entry heights of this existence witness will be used.
  #emph[Square completions for rank thresholds.] For $0 lt.eq t lt.eq min \( a \, b \)$, form the square affine pencil
  $ C_t = mat(delim: "(", A, U_t; V_t, 0) \, #h(2em) U_t : a times \( a - t \) \, quad V_t : \( b - t \) times b . $
  The entries of $U_t \, V_t$ are independent variables, so their dimension-$e$ evaluations may be arbitrary matrices of the displayed block sizes multiplied by $e$. For a fixed rational tuple $X$, there exist rational choices of these completion blocks making $C_t \( X \, U_t \, V_t \)$ invertible if and only if $"rank" A \( X \) gt.eq t e$. Necessity follows by splitting the completed matrix into its $A \( X \)$ and two off-diagonal blocks:
  $ \( a + b - t \) e = "rank" C_t \( X \, U_t \, V_t \) lt.eq "rank" A \( X \) + \( a - t \) e + \( b - t \) e . $
  For sufficiency, choose a $t e$-dimensional subspace $K subset.eq bb(Q)^(b e)$ on which $A \( X \)$ is injective. Take $V_t$ to be surjective with kernel $K$, and take $U_t$ to map isomorphically onto a complement of $A \( X \) K$ in $bb(Q)^(a e)$. A vector in the kernel of the completed matrix then has its first component in $K$, and the direct sum $A \( X \) K xor "im" U_t$ makes both components zero. This proves invertibility. It includes $t = 0$ and all empty-block cases; in particular $C_0$ can always be made invertible.
  #emph[A coefficient-independent list.] Reserve $a^2$ variables $u_(i j)$ and $b^2$ variables $v_(i j)$, disjoint from the first $k$ variables. For $C_t$, use the first $a - t$ columns of the $u$-pool for $U_t$ and the first $b - t$ rows of the $v$-pool for $V_t$. The pools can be reused for different $t$. Thus every $C_t$ is a pencil in the same $N = k + a^2 + b^2$ variables, with unused variables allowed, and has order $a + b - t lt.eq a + b$. Set $s = a + b$, so this order is at most $B = 2 s + 1$. Both $N$ and $s$ are positive. Apply the single list $cal(H)_(N \, s)$ from Corollary 13, and project each output onto its first $k$ matrices, retaining its dimension $e$ and any repetitions. This defines $cal(R)_(a \, b \, k)$; it is nonempty because $C_0$ is feasible.
  For $t = r$, equation (6.2) and the completion criterion make $C_r$ feasible. A hit for $C_r$ therefore has projected rank at least $r e$, while every projected evaluation has rank at most $r e$. This proves (6.1) exactly, without rounding; individual ranks need not be divisible by $e$. The argument includes $r = 0$. When $k = 0$, the projected tuple is empty but still carries $e$, and the identity also follows directly from $"rank" \( A_0 ⊗ I_e \) = e "rank" A_0$.
  Since $N + s + 1$ is polynomial in $P$, Proposition 14 and the dimension bound (5.9) give the stated generation, query-encoding, and dimension bounds. The generator never constructs $C_t$, learns $r$, or reads the coefficients: $C_r$ is used only in the existence proof. For complete matrix responses, exact rational elimination is polynomial in the encoded response lengths and dimensions. For ordinary-rank responses, only exact comparison of the rank/dimension quotients is needed. These observations give the stated cost accounting. ◻
]

The assertion concerns exact matrix values or ordinary ranks, not singularity-bit access to the original pencil. It makes no claim for arbitrary rational circuits, finite fields, or total oracle-computation bit time independent of coefficient heights. If complete scalar value queries at zero and the standard basis points are also available, then $k + 1$ such queries reveal all coefficients, after which known coefficient-aware rank algorithms apply with those bit lengths counted #cite(label("IQS18")) arXiv version, Theorem 1.5. The distinct conclusion here is the universal nonadaptive coefficient-independent list, which also works with ordinary-rank responses.


#bibliography("refs.bib", style: "ieee", title: [References])
