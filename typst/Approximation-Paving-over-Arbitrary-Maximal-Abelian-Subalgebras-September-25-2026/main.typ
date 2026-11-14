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

#align(center)[#text(size: 16pt, weight: "bold")[Approximation Paving over Arbitrary Maximal Abelian Subalgebras]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $A$ be a maximal abelian unital $*$-subalgebra, or MASA, of a complex von Neumann algebra $M$.
  For a finite partition $cal(P) = \( p_i \)_(i = 1)^r$ of the unit by projections in $A$, write

$ C_(cal(P)) \( z \) = sum_(i = 1)^r p_i z p_i . $

Norm paving asks whether $C_(cal(P)) \( z \)$ can be made close in operator norm to an element of $A$.
  Approximation paving allows a bounded perturbation of $z$ within any prescribed strong-operator neighborhood
  before choosing the partition.

Kadison and Singer posed the pure-state extension problem for the atomic diagonal MASA of $cal(B) \( ell^2 \)$
  [9]. Anderson formulated its diagonal paving counterpart [3], and Marcus,
  Spielman and Srivastava resolved it by mixed characteristic polynomials [12].
  For general MASAs, ordinary norm paving of the original operator is too restrictive:
  in the separable-predual setting, it characterizes type I algebras with a normal expectation onto the MASA [16]
  Theorem 3.3. Popa and Vaes introduced strong-operator and approximation versions of paving and conjectured that
  every MASA has both properties [16] Definitions 2.2–2.3 and Conjecture 2.8(1).
  We resolve the approximation-paving assertion of that conjecture positively.

Popa proved norm paving in ultraproducts of singular finite MASAs,
  and hence strong-operator paving in the original finite inclusions [15].
  Popa and Vaes established strong-operator and approximation paving for type I algebras with separable predual
  and for Cartan inclusions in amenable algebras or arising from free ergodic profinite actions [16] Sections 3–4.
  For singular finite MASAs they obtained quadratic paving bounds [16] Theorem 5.1, later sharpened in [17].
  These restricted cases do not provide the expectation-free approximation theorem below.

#thm([Theorem 1.1.])[
  #emph[There is a universal constant $C_(upright("ap")) > 0$ such that for every $0 < epsilon <
    1$ there is an integer $R \( epsilon \) lt.eq C_(upright("ap")) epsilon^(- 6)$ with the following property.
    Let $M subset.eq cal(B) \( H \)$ be a complex von Neumann algebra, let $A subset.eq M$ be a MASA, and let $x =
    x^(*) in M$. For every finite $F subset H$ and every $delta > 0$, there exist $y = y^(*) in M$,
    a partition $cal(P) = \( p_i \)_(i = 1)^(R \( epsilon \))$ of the unit in $A$, and $a = a^(*) in A$, such that
$ ∥y∥ lt.eq 3 ∥x∥ \, wide ∥\( y - x \) xi∥ < delta quad \( xi in F \) \, $

 and
$ ∥a∥ lt.eq ∥y∥ \, wide ∥C_(cal(P)) \( y \) - a∥ lt.eq epsilon ∥y∥ . $

 Zero projections may be included in the partition.]
] <thm:main>

Thus the norm-control constant is universal, and the number of projections is independent of the algebra,
  its representation, the operator, and the strong neighborhood. We do not optimize the sixth-power bound.
  The relative error in the theorem is measured against the actual approximant’s norm;
  a norming test vector and a final clipping argument will ensure that normalization.

There is also a direct consequence for strong-operator paving when a normal expectation exists.
  In its definition, the compression is estimated on a large projection whose complement lies in a prescribed
  strong neighborhood of zero.

#thm([Corollary 1.2.])[
  #emph[Suppose that a MASA $A subset.eq M$ is the range of a normal conditional expectation.
    For each $0 < epsilon < 1$ there is an integer $R_s \( epsilon \)$, independent of the inclusion,
    such that for every $x = x^(*) in M$ and every strong-operator neighborhood $cal(V)$ of zero,
    there exist an $R_s \( epsilon \)$-partition $cal(P)$ in $A$, an $a = a^(*) in A$ with $∥a∥ lt.eq ∥x∥$,
    and a projection $q in M$ with $upright(bold(1)) - q in cal(V)$, satisfying
$ ∥q \( C_(cal(P)) \( x \) - a \) q∥ lt.eq epsilon ∥x∥ . $

]
] <cor:so-paving>

The proof is given in Section 7.4.

The separate companion [13] Theorem 1.1 proves a direct quadratic strong-operator paving bound for the original
  operator. Theorem 1 instead norm-paves a nearby bounded operator,
  with error relative to that approximant’s norm. The two main proofs are independent;
  the conversion in Corollary 2 retains its normal-expectation hypothesis.
  We claim no quadratic bound for $R \( epsilon \)$.

#thm([Corollary 1.3.])[
  (Quadratic approximation paving for expected MASAs).  #emph[There is a universal constant $C >
    0$ such that for every $0 < epsilon < 1$ one can choose an integer $N \( epsilon \) lt.eq
    C epsilon^(- 2)$ with the following property. If the MASA $A subset.eq
    M$ is the range of a normal conditional expectation, then the conclusion of Theorem 1 holds with
    $N \( epsilon \)$ in place of $R \( epsilon \)$.]
] <cor:quadratic-expected-approximation>

The proof is given in Section 7.4.

===== 1.1 The measured argument. <the-measured-argument.>

The first part of the proof develops a measurable version of one-sided matrix paving for nonsingular equivalence
  relations. The finite paving-polynomial framework of [18,19] supplies the starting point.
  Its stable expected determinants yield local spectral probabilities and spectral-shift functions.
  A buffered pinning lemma selects a color while increasing the diagonal penalty by a fixed universal factor and
  controlling the increase of positive-root mass. The initial root estimate from [19] Lemma 24 and proof of
  Theorem 25 is derived here from [12] Theorems 4.1 and 5.1,
  using positive-defect completion and deletion of added Gram columns.

Nonsingularity is handled by passing to the Maharam extension, where mass transport is invariant,
  and weighting the matrix by the height variable. Uniform comparisons between slabs allow the pinning decisions
  to descend to a single coloring of the base. Sparse random updates then control the accumulated cost.
  Only local independence is needed; auxiliary graph colorings do not increase the number of colors in the final
  paving. The slab comparison and buffered-pinning estimates isolate the two uniformity issues in this passage
  from finite matrices to measurable operators.

===== 1.2 The operator-algebra argument. <the-operator-algebra-argument.>

For a MASA in the centralizer of a faithful normal state, we first pave the algebra generated by its normalizers,
  using the Feldman–Moore representation [6] and the measured theorem.
  The complementary part has diffuse left–right kernels. We adapt the free-product matrix dilation of [16] proof
  of Theorem 5.1, using random diagonal phases to obtain asymptotic freeness with respect to the induced state.
  The proof controls the moments and their concentration without assuming traciality,
  using analytic right multiplication for the modular group.

Finally, a separable reduction preserves the partition bounds.
  The corner carrying centralizing normal positive functionals has a normal expectation;
  on the complementary corner, almost disjoint conjugate states produce positive contractions with small diagonal
  compressions. A three-corner construction preserves the original off-diagonal entries until the final partition
  is chosen. This is the step that removes the normal-expectation hypothesis.

All new estimates needed for these passages are proved below.
  We use established structure theorems for conditional expectations, standard form,
  type I algebras and free products, with their hypotheses specified at the points of application.

Section 2 fixes the state-topology tools; Sections 3–5 prove the measured paving theorem,
  Section 6 handles the state-preserving case, and Section 7 removes the remaining hypotheses.

== 2 State topology and bounded sequence quotients <sec:preliminaries>

All algebras and Hilbert spaces are over $bb(C)$. A MASA is automatically a von Neumann algebra:
  its relative commutant equals itself, by taking real and imaginary parts.
  Partitions are finite indexed families of orthogonal projections with sum $upright(bold(1))$;
  we allow zero projections. For a self-adjoint operator $t$, let $t_(+)$ denote its positive part.
  We use the same functional-calculus notation for continuous real functions, including

$ "clip"_c \( t \) = max \( - c \, min \( t \, c \) \) \, wide c > 0 . $

Suppose for this section that $M$ has a faithful normal state $phi$,
  and $A subset.eq M_phi$ is a MASA in its centralizer. Here

$ M_phi = { a in M : phi \( a z \) = phi \( z a \) upright(" for all ") z in M } . $

The modular group fixes $A$ pointwise. The conditional-expectation theorem gives a faithful normal
  $phi$-preserving expectation $E_A : M arrow.r A$; see [21] or [7] Theorem 6.6. Set

$ ∥z∥_phi = phi \( z^(*) z \)^(1 \/ 2) \, wide ∥z∥_phi^(\#) = ∥z∥_phi + ∥z^(*)∥_phi . $

On bounded sets these seminorms determine, respectively, the $sigma$-strong and $sigma$-strong\* topologies.
  Indeed, in the faithful state representation, $∥z∥_phi = ∥z xi_phi∥$, and $M' xi_phi$ is dense.
  Boundedness therefore promotes convergence on $xi_phi$ to strong convergence on all vectors.
  The bounded $sigma$-strong topology is intrinsic to the von Neumann algebra.
  Apply the same reasoning to adjoints for the second assertion.
  In standard $L^2 \( M \)$ notation we write $xi_phi = phi^(1 \/ 2)$.
  Elements of $A$ commute with this vector under the left and right actions.

#thm([Lemma 2.1.])[
  #emph[Every $A$-partition compression $C_(cal(Q))$ preserves $phi$ and is contractive for both state seminorms.
    As $cal(Q)$ refines through all finite $A$-partitions,
$ C_(cal(Q)) \( z \) arrow.r E_A \( z \) quad upright("in ") ∥dot.op∥_phi^(\#) wide \( z in M \) . $

 The same holds along any refining sequence of partitions generating $A$.]
] <lem:compression-net>

#proof[
  The centralizer identity gives $phi \( C_(cal(Q)) \( z \) \) = phi \( z \)$.
    Compression is unital completely positive, so its Schwarz inequality gives state-norm contraction;
    apply it to adjoints as well. On the state Hilbert space the compression is implemented by the orthogonal projection
  $ zeta mapsto sum_(q in cal(Q)) q zeta q . $
  These projections decrease under refinement. Their action on $z phi^(1 \/ 2)$ is $C_(cal(Q)) \( z \)
    phi^(1 \/ 2)$. Meanwhile the operators $C_(cal(Q)) \( z \)$ are uniformly bounded.
    Every ultraweak cluster point commutes with all projections of $A$, and hence is in $A$.
    Since $E_A C_(cal(Q)) \( z \) = E_A \( z \)$, the cluster point equals $E_A \( z \)$.
    The Hilbert-space limit of the decreasing projections must therefore be $E_A \( z \) phi^(1 \/ 2)$.
    Repeating for $z^(*)$ proves the claim. For a generating refining sequence,
    commuting with all of its partition projections is already equivalent to commuting with $A$,
    so the same proof applies. ◻
]

The following quotient allows us to record vanishing state errors while retaining norm estimates.
  Its multiplier condition matters when $phi$ is not tracial.

#thm([Lemma 2.2.])[
  #emph[Let
$ cal(I)_phi = { \( z_j \) in ell^oo \( M \) : ∥z_j∥_phi^(\#) arrow.r 0 } \, $

 and let
$ cal(C)_phi = { t in ell^oo \( M \) : t cal(I)_phi subset.eq cal(I)_phi \, med cal(I)_phi t subset.eq cal(I)_phi } . $

 Then $cal(C)_phi$ is a unital $C^(*)$-algebra and $cal(I)_phi$ is a closed two-sided ideal in it.
   Constant sequences from $M$ and all sequences in $ell^oo \( A \)$ belong to $cal(C)_phi$.]
] <lem:sequence-quotient>

#proof[
  The set $cal(I)_phi$ is self-adjoint and norm closed. If $s \, t in cal(I)_phi$, then
  $ ∥s_j t_j∥_phi lt.eq ∥s_j∥ ∥t_j∥_phi \, wide ∥\( s_j t_j \)^(*)∥_phi lt.eq ∥t_j∥ ∥s_j^(*)∥_phi \, $
  so $s t in cal(I)_phi$. The two multiplier conditions now show directly that $cal(C)_phi$ is a unital,
    norm-closed $*$-algebra, contains $cal(I)_phi$, and makes it an ideal.
    Multiplication by a fixed bounded operator is continuous on bounded sets for strong\* convergence,
    so constant sequences are multipliers.
  If $a in A$, then left multiplication has state-norm bound $∥a∥$, and the centralizer property gives
  $ ∥t a∥_phi^2 = phi \( a^(*) t^(*) t a \) = phi \( t^(*) t a a^(*) \) lt.eq ∥a∥^2 phi \( t^(*) t \) . $
  The last inequality follows from positivity, since $phi \( t^(*) t b \) =
    phi \( b^(1 \/ 2) t^(*) t b^(1 \/ 2) \) gt.eq 0$ for $b gt.eq 0$ in $A$.
    The same estimates apply to adjoints, uniformly on bounded $A$-sequences. Thus these sequences are multipliers. ◻
]

Write $\[ t_j \]$ for an image in $cal(C)_phi \/ cal(I)_phi$.
  A sequence of $A$-partitions of uniformly bounded size acts by compression in this quotient.
  If $q$ refines $p$, its compression applied to a $p$-compression is its compression of the original element.
  Since these maps are unital and positive, a common refinement preserves separate scalar upper and lower bounds
  for a self-adjoint element. In particular it preserves a norm bound.

We will also use the following direct consequence of functional calculus.
  If a self-adjoint multiplier sequence $T_j$ has $∥\[ T_j \]∥ lt.eq c$, then

$ w_j = T_j - "clip"_c \( T_j \) in cal(I)_phi \, wide ∥T_j - w_j∥ lt.eq c . $

If $T_j$ is block diagonal for a partition, so is $w_j$. This converts the quotient estimates below into explicit
  corrections.

== 3 Finite mixed polynomials and buffered pinning <poly:section>

We develop a rule for fixing one vertex’s color while controlling the total positive-root mass of an expected
  characteristic polynomial. The rule will be applied repeatedly in the measured paving argument;
  its constants must therefore be independent of the matrix size and of previous color choices.
  We first identify the rooted mass and the change caused by one pin, then prove the inequality that relates them.

=== 3.1 Stable polynomials and local spectral data <stable-polynomials-and-local-spectral-data>

Let $Q$ be a finite set, let $W = \( W_(v w) \)_(v \, w in Q)$ be Hermitian with zero diagonal,
  and let $a_v in bb(R)$. At each $v$, independently choose a color in ${ 1 \, dots.h \,
  r }$ with probabilities $t_(v i) gt.eq 0$, $sum_i t_(v i) = 1$.
  The matrix $W_(upright("pav"))$ retains the entries between vertices of the same color and sets all other
  entries to zero. Define

#[#set math.equation(numbering: n => "(3.1)")
 $ f_Q \( Y \) = bb(E) det #scale(x: 120%, y: 120%)[\(] "diag" \( Y_v + a_v \)_(v in Q) -
   W_(upright("pav")) #scale(x: 120%, y: 120%)[\)] \, wide f_diameter = 1 . $ <poly:definition>]

All restrictions to subsets of $Q$ use the restricted matrix, penalties, and probabilities.
  The polynomial is real and multiaffine, its leading monomial is $product_(v in Q) Y_v$, and

#[#set math.equation(numbering: n => "(3.2)")
 $ partial_(Y_v) f_Q = f_(Q \\ { v }) . $ <poly:deletion>]

We write $f_Q \( z \)$ when every variable is set equal to $z$.
  The uniform-probability paving polynomial and its determinant-derivative representation occur in [18]
  Theorem 1.6 and Proposition 1.7; independent nonuniform distributions are also discussed in [19] remark
  following Lemma 24. We give the identities and stability arguments in the form needed for local perturbations below.

#thm([Lemma 3.1.])[
  (Stability).  #emph[Put $t_i^(1 \/ 2) = "diag" \( sqrt(t_(v i)) \)_(v in Q)$. Then
#[#set math.equation(numbering: n => "(3.3)")
 $ f_Q \( Y \) = (product_(v in Q) frac(1, r !) partial_(Y_v)^(r - 1)) product_(i = 1)^r det
   #scale(x: 120%, y: 120%)[\(] "diag" \( Y + a \) - r t_i^(1 \/ 2) W t_i^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] .
   $ <poly:differential-formula>]

 This identity remains valid for complex $t_(v i)$ with $sum_i t_(v i) = 1$,
   where the expectation means the finite algebraic sum with the corresponding product weights,
   and the same square root is used in both occurrences of $t_i^(1 \/ 2)$.
   The algebraic identity also holds with complex penalties and arbitrary complex off-diagonal entries of $W$,
   still with zero diagonal.]
  #emph[More generally, let $cal(H)$ be an open half-plane.
    If the product of determinants on the right of (3.3), for every principal restriction,
    is nonzero whenever all its variables lie in $cal(H)$, then the same holds for $f_Q$.
    In particular, for Hermitian $W$ and real probabilities and penalties,
    $f_Q$ is upper-half-plane stable and its univariate specialization is real-rooted.]
] <lem:stability>

#proof[
  Expand each determinant by permutations. Since $W$ has zero diagonal,
    the off-diagonal terms are collections of disjoint nontrivial permutation cycles.
    Each such cycle $C$ has sign minus and weight
  #[#set math.equation(numbering: n => "(3.4)")
   $ w_C = (product_(\( v \, w \) in C) W_(v w)) sum_(i = 1)^r product_(v in C) t_(v i) $ <poly:cycle-weight>]
  in the expectation; unused vertices contribute $Y_v + a_v$.
    Indeed, all vertices on a cycle must receive one common color,
    and disjoint cycles involve disjoint independent choices.
  In the product on the right of (3.3), suppose a vertex occurs in nontrivial cycles of $k$ different determinant
    factors. Its degree in $Y_v + a_v$ is $r - k$. If $k gt.eq 2$, the indicated derivative kills the term.
    If $k = 0$, the normalized derivative sends $\( Y_v + a_v \)^r$ to $Y_v + a_v$.
    If $k = 1$, it sends $\( Y_v + a_v \)^(r - 1)$ to $1 \/ r$,
    cancelling the factor $r$ from the matrix scaling at that vertex.
    The remaining terms are precisely (3.4) for disjoint cycles.
    The two square-root factors at each cycle vertex multiply to $t_(v i)$,
    so this argument also proves the complex-parameter identity independently of the choices of square roots.
    This cycle calculation is algebraic in the entries of $W$ and does not require them to be Hermitian;
    that hypothesis is used for the real-data stability conclusion, not for the identity.
  For the half-plane assertion, proceed by induction on the subset $D$ of vertices at which $r -
    1$ derivatives have already been taken, simultaneously for all principal restrictions.
    Fix the other variables in $cal(H)$ and take a vertex $v in.not D$.
    In each determinant, the coefficient of $Y_v$ is its principal determinant with $v$ removed,
    even for complex penalties. Extracting the coefficient of $Y_v^r$ from the product commutes with all
    normalized derivatives at vertices in $D$. Thus this coefficient is exactly the already-processed product for
    the principal set with $v$ removed. It is nonzero by induction,
    so the polynomial in $Y_v$ has degree exactly $r$. Its roots lie in the closed convex complement of $cal(H)$.
    Gauss–Lucas implies that each of its successive derivatives has all roots in that complement and is nonzero.
    This proves the induction step.
  For completeness, the determinant hypothesis holds whenever $cal(H)$ lies strictly beyond a numerical-range bound for
  #[#set math.equation(numbering: n => "(3.5)")
   $ B_i = r t_i^(1 \/ 2) W t_i^(1 \/ 2) - "diag" \( a \) . $ <poly:matrix-numerical-range>]
  For example, if $"Im" ⟨B_i u \, u⟩ lt.eq beta ∥u∥^2$ and $"Im" Y_v > beta$ for all $v$,
    a null vector of $"diag" \( Y \) - B_i$ contradicts the imaginary part of its quadratic form.
    The same reasoning applies after a common rotation of the half-plane;
    principal compressions inherit numerical-range bounds. For Hermitian $W$ and real probabilities and penalties,
    the matrices (3.5) are Hermitian, giving upper-half-plane stability.
    Real coefficients and complex conjugation then give real-rootedness of the univariate specialization. ◻
]

#thm([Lemma 3.2.])[
  (Local spectral data).  #emph[Fix $v in Q$, put $f = f_Q$, $g = f_(Q \\ { v })$, and write $h = f \/ g$, $G =
    1 \/ h$ at univariate arguments. For $z in bb(C)$ with $"Im" z > 0$,
#[#set math.equation(numbering: n => "(3.6)")
 $ "Im" h \( z \) gt.eq "Im" z . $ <poly:pick-inequality>]

 If $s_j$ are the roots of $g$, with multiplicities, there are $nu_j gt.eq 0$ such that
#[#set math.equation(numbering: n => "(3.7)")
 $ h \( z \) = z + a_v - sum_j frac(nu_j, z - s_j) . $ <poly:arrow-quotient>]

 Consequently, on choosing $\| c_j \|^2 = nu_j$,
#[#set math.equation(numbering: n => "(3.8)")
 $ B = mat(delim: "(", - a_v, c^(*); c, S) \, wide S = "diag" \( s_j \) \, wide det \( z I - B \) =
   f \( z \) . $ <poly:arrow-matrix>]

 The function $G$ is the transform
#[#set math.equation(numbering: n => "(3.9)")
 $ G \( z \) = integral_(bb(R)) frac(d gamma_v \( x \), z - x) $ <poly:stieltjes>]

 of the spectral probability measure of $B$ at its first coordinate. Its first two moments are
#[#set math.equation(numbering: n => "(3.10)")
 $ integral x thin d gamma_v \( x \) = - a_v \, wide integral x^2 thin d gamma_v \( x \) = a_v^2 + sum_j nu_j \,\
sum_j nu_j = sum_(w eq.not v) \| W_(v w) \|^2 sum_i t_(v i) t_(w i) . $ <poly:moments>]

]
  #emph[Let $N_f \( x \)$ and $N_g \( x \)$ count roots strictly greater than $x$, including multiplicities, and define
#[#set math.equation(numbering: n => "(3.11)")
 $ xi_h \( x \) = N_f \( x \) - N_g \( x \) \, wide ell_v = integral_0^oo xi_h \( x \) thin d x \, wide m_v =
   integral_(bb(R)) x_(+) thin d gamma_v \( x \) . $ <poly:local-functionals>]

 Then $xi_h = upright(bold(1))_({ h < 0 })$ off a finite subset of $bb(R)$, and
#[#set math.equation(numbering: n => "(3.12)")
 $ 1 / pi arg h \( x + i eta \) = \( P_eta * xi_h \) \( x \) \, wide P_eta \( x \) =
   frac(eta, pi \( x^2 + eta^2 \)) \, quad eta > 0 \, $ <poly:poisson>]

 where $arg h in \( 0 \, pi \)$. Moreover,
#[#set math.equation(numbering: n => "(3.13)")
 $ sum_(v in Q) G_(v \, Q) \( z \) = frac(f'_Q \( z \), f_Q \( z \)) \, wide sum_(v in Q) gamma_v =
   sum_(f_Q \( lambda \) = 0) delta_lambda \, $ <poly:sum-local-measures>]

 with multiplicities on the right.]
  #emph[If $v$ is made deterministic of color $i$, write $h_i$ for the new quotient relative to the same $g$,
    and put $R_i = h_i \/ h$. Its representation has the same $a_v$ and poles $s_j$, and masses $nu_(i j) gt.eq
    0$ which can be chosen so that
#[#set math.equation(numbering: n => "(3.14)")
 $ h = sum_i t_(v i) h_i \, wide nu_j = sum_i t_(v i) nu_(i j) . $ <poly:pin-average>]

 If the penalty at $v$ is also changed to $K a_v$, the quotient becomes
#[#set math.equation(numbering: n => "(3.15)")
 $ h'_i = h_i + \( K - 1 \) a_v . $ <poly:buffered-quotient>]

 Here the prime with a color index denotes the buffered quotient, not a derivative.
   We write $ell'_(v \, i)$ for the positive-axis integral of the spectral shift defined using $h'_i$ and the
   unchanged $g$.]
] <lem:local-data>

#proof[
  Fix every variable except $Y_v$ at $z$ in the upper half-plane.
    By (3.2), division by $g \( z \) eq.not 0$ produces a monic affine polynomial $Y_v - alpha \( z \)$.
    Its root cannot be in the upper half-plane by Lemma 6. Hence $h \( z \) = z - alpha \( z \)$ satisfies (3.6).
  The rational function $h$ has real coefficients and only real poles.
    Its upper-half-plane property rules out poles of order two or higher:
    the imaginary part of a real leading polar term of such order has both signs along rays approaching the pole
    from above. At an actual simple pole the residue must be negative, as seen by approaching vertically.
    The polynomial part is $z + a_v$, by comparing the two highest coefficients of the monic polynomials $f$ and
    $g$. This gives (3.7). For repeated roots of $g$, assign the total residue to one copy and pad with zero
    masses at the others. The Schur complement proves (3.8) and (3.9),
    first away from the poles and then as identities of rational functions.
    The first two moments follow from the first diagonal entries of $B$ and $B^2$.
    Expanding $f \/ g$ at infinity, the coefficient of $1 \/ z$ is minus the sum of the length-two cycle weights
    through $v$, giving the final identity in (3.10).
  For real $x$ away from roots and poles, the Schur complement of $x I - S$ in $x I - B$ is $h \( x \)$.
    Inertia is additive under this congruence, so the number of negative eigenvalues of $x I -
    B$ exceeds that of $x I - S$ by exactly $upright(bold(1))_({ h \( x \) < 0 })$.
    This proves the assertion about $xi_h$ and in particular $0 lt.eq xi_h lt.eq 1$ almost everywhere.
  Factor $f$ and $g$ over their real roots. On the upper half-plane, take each factor $z -
    lambda$ with argument in $\( 0 \, pi \)$. The sum of the numerator arguments minus the denominator arguments
    equals $arg h$: their difference is a continuous multiple of $2 pi$ and tends to zero at $z =
    i R$ as $R arrow.r oo$. The argument of $x + i eta - lambda$, divided by $pi$,
    is the Poisson integral of $upright(bold(1))_(\( - oo \, lambda \))$. Summing and subtracting gives (3.12).
    Finally the chain rule and (3.2) give the first identity in (3.13).
    The second follows by comparing the finite Stieltjes transforms on the two sides.
  Pinning changes only the probability at $v$, so $g$ is unchanged and $f$ is the weighted sum of its pinned
    versions. This gives the first identity in (3.14). Each pinned polynomial is stable by Lemma 6,
    and thus has the same type of quotient representation. Comparing residues at each distinct pole gives the
    second identity; use the same placement on repeated copies for every choice.
    Finally changing the $v$-penalty adds $\( K - 1 \) a_v g$ to the polynomial, proving (3.15). ◻
]

The two local quantities have different roles. Define the total positive-root mass,
  with roots counted according to multiplicity, by

#[#set math.equation(numbering: n => "(3.16)")
 $ cal(E) \( Q \) = sum_(f_Q \( lambda \) = 0) lambda_(+) . $ <poly:total-cost>]

The sum-of-measures identity and the definition of the spectral shift give

#[#set math.equation(numbering: n => "(3.17)")
 $ cal(E) \( Q \) = sum_(v in Q) m_v \, wide ell_v = cal(E) \( Q \) - cal(E) \( Q \\ { v } \) . $ <poly:cost-response>]

Thus $m_v$ distributes the total cost among the vertices, whereas $ell_v$ is the cost of inserting $v$.
  A buffered pin at $v$ leaves the deleted polynomial unchanged,
  so its change of total cost is exactly $ell'_(v \, i) - ell_v$.
  These are costs of the expected characteristic polynomial;
  in general they are not expectations of the positive-part trace of the randomly paved matrix.
  They become the ordinary spectral costs when all colors are deterministic.

=== 3.2 The initial largest-root bound <the-initial-largest-root-bound>

The following estimate is obtained in [19] Lemma 24 and proof of Theorem 25.
  We include a derivation from the MSS covariance bound, explaining both the positive-defect completion and the
  deletion of the added Gram columns.

#thm([Lemma 3.3.])[
  (Initial largest-root bound).  #emph[Let $T$ be a Hermitian contraction on a nonempty finite index set $Q$,
    with zero diagonal. In (3.1), take $W = T$, $a_v = 0$, and $t_(v i) = 1 \/ r$. Then
#[#set math.equation(numbering: n => "(3.18)")
 $ max "root" \( f_Q \) lt.eq 2 sqrt(2 \/ r) + 2 \/ r . $ <poly:mss-bound>]

 In particular, giving every vertex the same penalty $b$ places all roots strictly below zero if $2 sqrt(2 \/ r) +
   2 \/ r < b$.]
] <lem:mss-paving>

#proof[
  Set $D_0 = I + T$. Then $0 lt.eq D_0 lt.eq 2 I$ and $\( D_0 \)_(v v) = 1$. Independently form the columns
  $ u_v = D_0^(1 \/ 2) e_v ⊗ e_(upright("color") \( v \)) quad upright("in ") bb(C)^Q ⊗ bb(C)^r . $
  They have squared norm one, their Gram matrix is $I + T_(upright("pav"))$, and, with $d = 2 \/ r$,
  $ sum_(v in Q) bb(E) u_v u_v^(*) = \( D_0 \/ r \) ⊗ I_r lt.eq d I . $
  Write the positive defect as a finite sum of deterministic outer products.
    Splitting its positive eigenvalues into finitely many summands at most one makes each added column have
    squared norm at most one. For all original and added columns together,
    their covariances $A_j$ satisfy $sum_j A_j = d I$ and $"Tr" A_j lt.eq 1$.
  Theorem 4.1 of [12] identifies the expected characteristic polynomial of a sum of independent,
    finitely supported rank-one outer products with the mixed characteristic polynomial of the covariances.
    Theorem 5.1 of [12] gives largest root at most $\( 1 + sqrt(epsilon.alt) \)^2$ for positive semidefinite
    covariances summing to $I$ with individual traces at most $epsilon.alt$.
    Apply these results to $A_j \/ d$, with $epsilon.alt = 1 \/ d$, and rescale the spectral variable.
    The expected characteristic polynomial of the enlarged sum has largest root at most
  #[#set math.equation(numbering: n => "(3.19)")
   $ d \( 1 + sqrt(1 \/ d) \)^2 = 1 + 2 sqrt(d) + d . $ <poly:enlarged-root>]
  We justify carefully the removal of the added columns. For independent, finitely supported columns $u_1 \,
    dots.h \, u_m$ in a finite-dimensional space, let $A_j = bb(E) u_j
    u_j^(*)$ and let $U$ be the matrix of columns. Then
  #[#set math.equation(numbering: n => "(3.20)")
   $ F \( Y \) := bb(E) det #scale(x: 120%, y: 120%)[\(] "diag" \( Y \) - U^(*) U #scale(x: 120%, y: 120%)[\)] =
     (product_(j = 1)^m \( Y_j - partial_(s_j) \)) det (I + sum_(j = 1)^m s_j A_j)\|_(s = 0) . $ <poly:gram-stability>]
  Indeed, the coefficient indexed by a subset $J$ of columns on either side is $\( - 1 \)^(\| J \|)$ times the
    expected principal Gram determinant $bb(E) det \( U_J^(*) U_J \)$.
    This follows first for deterministic rank-one matrices by determinant expansion,
    and then for the mean outer products by independence and multilinearity in the distinct matrices indexed by $J$.
  The determinant on the right of (3.20) is stable in the variables $s_j$.
    If it had a null vector with all $"Im" s_j > 0$, taking the imaginary part of its quadratic form would force
    the vector into $ker A_j$ for every $j$; the identity term then forces the vector to be zero.
    If a polynomial $p$ is stable, fixing all variables except $s_j$ at upper-half-plane arguments gives
  $ frac(partial_(s_j) p, p) = sum_k frac(1, s_j - lambda_k) \, wide "Im" lambda_k lt.eq 0 . $
  The sum is zero when the degree is zero, and otherwise has negative imaginary part.
    Thus a new upper-half-plane variable $Y_j$ cannot equal this logarithmic derivative,
    and $\( Y_j - partial_(s_j) \) p$ is stable. Repeating this observation,
    and then specializing the $s_j$ to zero by the zero-free limit theorem, proves stability of $F$.
    The limit is not the zero polynomial, since its leading monomial $product_j Y_j$ has coefficient one.
    The same proof works for every principal set of columns.
  Differentiating $F$ in a diagonal variable deletes the corresponding column from the expected Gram polynomial.
    The monic affine argument of Lemma 7 therefore applies to the quotient of its univariate specialization by the
    deleted polynomial. It has imaginary part at least $"Im" z$, and its polynomial part is $z - bb(E) ∥u_j∥^2$.
    The residue argument in that Lemma realizes the full polynomial as the characteristic polynomial of a
    Hermitian arrow matrix whose principal compression has the deleted polynomial as characteristic polynomial.
    The largest eigenvalue of a principal compression cannot exceed the largest eigenvalue of the whole matrix.
    Thus deleting columns cannot increase the largest root.
  If the ambient column space has dimension $q$, the exact identity
  $ z^q bb(E) det \( z I_m - U^(*) U \) = z^m bb(E) det \( z I_q - U U^(*) \) $
  shows that the enlarged Gram polynomial and the enlarged sum polynomial differ only by zero roots.
    Since the bound (3.19) is positive, it also bounds the largest root of the enlarged Gram polynomial.
    Delete every added column using the preceding paragraph. The original Gram polynomial is $bb(E)
    det \( z I - \( I + T_(upright("pav")) \) \) = f_Q \( z - 1 \)$. Shifting by minus one proves (3.18).
    A common penalty $b$ replaces $f_Q \( z \)$ by $f_Q \( z + b \)$, giving the final assertion. ◻
]

=== 3.3 Residue tails and exceedance lengths <residue-tails-and-exceedance-lengths>

The rest of this section concerns arbitrary arrow quotients, not just those arising from a coloring.
  Let $s_j in bb(R)$, $nu_j gt.eq 0$, and

#[#set math.equation(numbering: n => "(3.21)")
 $ h \( z \) = z + a - sum_j frac(nu_j, z - s_j) \, wide a > 0 . $ <poly:general-arrow>]

Let $gamma$ be the first-coordinate spectral probability measure of the corresponding arrow matrix, and put

#[#set math.equation(numbering: n => "(3.22)")
 $ m = integral x_(+) thin d gamma \( x \) \, wide L \( a \, nu \) =
   lr(|{lambda > 0 : sum_j frac(nu_j, lambda - s_j) > lambda + a}|) . $ <poly:length-definition>]

Here and below $\| dot.op \|$ denotes Lebesgue measure when applied to a set of real numbers.
  By Lemma 7, this length is the positive-axis integral of the spectral shift for $h$.

#thm([Lemma 3.4.])[
  (Control of the residues).  #emph[Suppose $a = 1$ in (3.21), and set $H =
    integral \| x \| thin d gamma \( x \) = 1 + 2 m$. There is a universal $C_0$ such that
#[#set math.equation(numbering: n => "(3.23)")
 $ sum_(\| s_j \| lt.eq 60 H) nu_j & lt.eq C_0 H^2 \,\
sum_(s_j gt.eq 20 H) nu_j / s_j & lt.eq C_0 m \,\
sum_(s_j lt.eq - 20 H) frac(nu_j, \| s_j \|) & lt.eq C_0 H . $ <poly:near-mass>]

 For example, $C_0 = 6000$ suffices.]
] <poly:tail-control>

#proof[
  The first spectral moment is $- 1$, so $H = 1 + 2 m gt.eq 1$. By Markov’s inequality,
  $ gamma \( \[ - 4 H \, 4 H \] \) gt.eq 3 \/ 4 . $
  Writing $G = 1 \/ h$, we obtain
  $ - "Im" G \( i 10 H \) = integral frac(10 H, x^2 + 100 H^2) thin d gamma \( x \) gt.eq frac(15, 232 H) . $
  Since $"Im" \( 1 \/ G \) lt.eq 1 \/ \( - "Im" G \)$,
  $ 10 H + sum_j frac(10 H nu_j, s_j^2 + 100 H^2) = "Im" h \( i 10 H \) lt.eq 232 / 15 H < 16 H . $
  For $\| s_j \| lt.eq 60 H$, the denominator is at most $3700 H^2$.
    It follows that the left side of (3.23) is at most $2220 H^2$.
  Let $e$ be the first coordinate vector of the arrow matrix $B$, and let $e_j$ be the other coordinate vectors,
    so that $\( B - s_j \) e_j$ is a scalar multiple of $e$ of modulus $sqrt(nu_j)$.
    Fix $lambda gt.eq 4 H$ and $s_j gt.eq 2 lambda$. Spectral calculus on $\( - oo \, lambda \]$,
    which is separated from $s_j$, and $⟨e_j \, e⟩ = 0$ give
  $ lr(|⟨e_j \, upright(bold(1))_(\( lambda \, oo \)) \( B \) e⟩|) & =
    lr(|⟨e_j \, upright(bold(1))_(\( - oo \, lambda \]) \( B \) e⟩|)\
 & = sqrt(nu_j) integral_(x lt.eq lambda) frac(d gamma \( x \), s_j - x) gt.eq frac(sqrt(nu_j), 2 s_j) . $
  The last inequality uses $gamma \( \[ - lambda \, lambda \] \) gt.eq 3 \/ 4$ and $s_j + lambda lt.eq
    3 s_j \/ 2$. Bessel’s inequality now yields
  $ sum_(s_j gt.eq 2 lambda) nu_j / s_j^2 lt.eq 4 gamma \( \( lambda \, oo \) \) . $
  Integrating for $lambda gt.eq 4 H$ gives
  $ sum_(s_j gt.eq 8 H) nu_j / s_j^2 (s_j / 2 - 4 H) lt.eq 4 integral_(4 H)^oo gamma \( \( lambda \, oo \) \) thin
    d lambda lt.eq 4 m . $
  For $s_j gt.eq 20 H$ the summand on the left is at least $3 nu_j \/ \( 10 s_j \)$.
    Thus (3.23) holds with constant $40 \/ 3$. The same positive-tail calculation applied to $-
    B$ has first absolute moment $H$ and positive first moment $integral \( - x \)_(+) thin d gamma \( x \) = 1 +
    m lt.eq H$. It gives (3.23) with the same constant. These calculations include zero residues and repeated poles. ◻
]

The next lemma is Boole’s identity for finite positive atomic measures [5];
  see [1] Proposition 2.6 and Appendix A. For this one-sided normalization, see [14] Section 1, equations (1.1),
  (1.3), and (1.5). Its elementary root-sum proof will also fix the sign and endpoint conventions used here.

#thm([Lemma 3.5.])[
  (Boole length identity).  #emph[For finitely many real poles $s_j$, nonnegative weights $w_j$, and $c > 0$,
#[#set math.equation(numbering: n => "(3.24)")
 $ lr(|{lambda in bb(R) : sum_j frac(w_j, lambda - s_j) > c}|) =
   lr(|{lambda in bb(R) : sum_j frac(w_j, lambda - s_j) < - c}|) = frac(sum_j w_j, c) . $ <poly:boole-identities>]

 If every pole carrying positive weight is strictly positive, the first exceedance set lies in $\( 0 \, oo \)$.]
] <poly:boole>

#proof[
  Merge coincident poles and omit zero weights. If there are no remaining poles the assertion is immediate.
    Otherwise list them in increasing order. The rational function is strictly decreasing between poles.
    Immediately to the right of each pole it tends to $+ oo$; before the next pole it tends to $- oo$,
    and after the last pole it tends to zero. Thus the positive-level exceedance consists of one interval from
    each pole to the ensuing root of the level equation. Clearing denominators in $sum_j
    w_j \/ \( lambda - s_j \) = c$, comparison of the two highest coefficients shows that the sum of the level
    roots exceeds the sum of the poles by $\( sum_j w_j \) \/ c$. This is precisely the total interval length.
    Reflection of the variable gives the negative-level identity.
    With positive poles the rational function is nonpositive on $\( - oo \, 0 \]$, proving the last assertion.
    Values at the finitely many poles and endpoints do not affect these lengths. ◻
]

=== 3.4 The buffered choice <the-buffered-choice>

The buffer makes it possible to retain coefficient one on the existing cost $ell$.
  When $m$ is large, we bound the whole child cost by a multiple of $m$; when $m$ is small,
  we reserve half of the existing length and control the remaining exceedance by the residue tails.

#thm([Lemma 3.6.])[
  (Buffered pin inequality).  #emph[There are universal constants $K gt.eq
    1$ and $C > 0$ with the following property. In (3.21), let a finite family of choices have masses $nu_(i j)
    gt.eq 0$ and probabilities $t_i gt.eq 0$ such that $sum_i t_i = 1$ and $sum_i t_i nu_(i j) = nu_j$.
    Keep the poles $s_j$ unchanged, and define
$ h'_i \( z \) = z + K a - sum_j frac(nu_(i j), z - s_j) \, wide ell'_i = L \( K a \, nu_i \) \, wide ell =
  L \( a \, nu \) . $

 Then
#[#set math.equation(numbering: n => "(3.25)")
 $ min_(i : t_i > 0) ell'_i lt.eq ell + C m . $ <poly:buffered-pin-bound>]

 The constants have no dependence on the number or positions of the poles, the masses, the probabilities,
   or the positive penalty $a$.]
] <lem:buffered-pin>

#proof[
  Dividing the arrow matrix by $a$ sends $s_j$ to $s_j \/ a$, the masses to $nu_j \/ a^2$,
    and both lengths and $m$ to their values divided by $a$. It therefore suffices to prove the assertion for $a =
    1$. Write $L = L \( 1 \, nu \)$ and $H = 1 + 2 m$, and fix $C_0$ from Lemma 9.
    Only positive-probability choices are used below.
  Suppose first that $m gt.eq 1$. The means of the two nonnegative statistics
  $ A_i = sum_(\| s_j \| lt.eq 20 H) nu_(i j) \, wide B_i = sum_(\| s_j \| > 20 H) frac(nu_(i j), \| s_j \|) $
  are at most $C_0 H^2$ and $C_0 \( m + H \) lt.eq 2 C_0 H$, respectively.
    Markov’s inequality and a union bound give a choice satisfying
  #[#set math.equation(numbering: n => "(3.26)")
   $ A_i lt.eq C_2 H^2 \, wide B_i lt.eq C_2 H \, wide C_2 = 8 C_0 . $ <poly:large-m-selection>]
  For $lambda > D H$ and $D gt.eq 40$, all denominators from poles $\| s_j \| lt.eq
    20 H$ are positive and their total contribution is at most $C_2 H^2 \/ \( lambda - 20 H \) lt.eq C_2 H$.
    The contribution from poles $s_j < - 20 H$ is at most $C_2 H$ as well. Put $C_3 = 2 C_2$.
    For the remaining positive poles the identity
  #[#set math.equation(numbering: n => "(3.27)")
   $ sum_(s_j > 20 H) frac(nu_(i j), lambda - s_j) = \( lambda + H \) sum_(s_j > 20 H)
     frac(nu_(i j), \( s_j + H \) \( lambda - s_j \)) - sum_(s_j > 20 H) frac(nu_(i j), s_j + H)
     $ <poly:large-m-transform>]
  holds. Choose $D gt.eq max { 40 \, 2 C_3 + 1 }$. For any $K gt.eq 1$,
    if the entire rational sum exceeds $lambda + K$, then (3.27) forces
  $ sum_(s_j > 20 H) frac(nu_(i j), \( s_j + H \) \( lambda - s_j \)) > 1 / 2 . $
  Indeed the necessary lower bound for this sum is at least $\( lambda - C_3 H \) \/ \( lambda + H \) gt.eq
    1 \/ 2$. By Lemma 10 and (3.26), its exceedance length is at most
  $ 2 sum_(s_j > 20 H) frac(nu_(i j), s_j + H) lt.eq 2 C_2 H . $
  Including the initial interval $\( 0 \, D H \)$, we obtain
  #[#set math.equation(numbering: n => "(3.28)")
   $ L \( K \, nu_i \) lt.eq \( D + 2 C_2 \) H lt.eq 3 \( D + 2 C_2 \) m . $ <poly:large-m-conclusion>]
  This proves the required bound in this case, with a universal constant, for every $K gt.eq 1$.
  It remains to treat $0 lt.eq m < 1$, so $1 lt.eq H lt.eq 3$. Set
  $ P = sum_(s_j > 0) frac(nu_j, 1 + s_j) \, wide M_(-) \( d \) =
    sum_(s_j lt.eq 0) frac(nu_j, d + \| s_j \|) quad \( d > 0 \) \, $
  using the right limit $M_(-) \( 0 + \)$ when necessary. Splitting the positive poles at $60$ and using Lemma 9 gives
  #[#set math.equation(numbering: n => "(3.29)")
   $ P lt.eq 9 C_0 + C_0 m lt.eq C_4 \, wide C_4 = 10 C_0 . $ <poly:P-bound>]
  Here $60 lt.eq 60 H$ controls the near part and $60 gt.eq 20 H$ controls the tail.
    For $lambda > 0$ away from the poles, the parent exceedance condition is equivalent to
  #[#set math.equation(numbering: n => "(3.30)")
   $ R \( lambda \) := sum_(s_j > 0) frac(nu_j, \( 1 + s_j \) \( lambda - s_j \)) > 1 +
     frac(P - M_(-) \( lambda \), 1 + lambda) . $ <poly:parent-exceedance>]
  The threshold on the right is at most $1 + P$. All poles of $R$ with positive weight are positive.
    Lemma 10 therefore gives
  #[#set math.equation(numbering: n => "(3.31)")
   $ L gt.eq frac(P, 1 + P) \, wide P lt.eq C_5 L \, wide C_5 = 1 + C_4 . $ <poly:P-controlled-by-L>]
  We next prove the uniform bound
  #[#set math.equation(numbering: n => "(3.32)")
   $ M_(-) \( L \/ 2 \) lt.eq C_6 \, $ <poly:negative-control>]
  with the right-limit interpretation when $L = 0$. If $L gt.eq 1$,
    split the negative poles at absolute value $60 H$. The near part is at most $2 C_0 H^2 lt.eq 18 C_0$,
    while the far part is at most $C_0 H lt.eq 3 C_0$. Thus $21 C_0$ suffices in this case.
    If $L = 0$, then (3.31) implies $P = 0$. If $M_(-) \( 0 + \) > 1$, including an infinite right limit,
    then $M_(-) \( lambda \) > 1 + lambda$ on a nonempty interval immediately to the right of zero.
    With no positive-pole contribution this would be an interval of parent exceedance, contradicting $L = 0$.
    Hence $M_(-) \( 0 + \) lt.eq 1$.
  Finally suppose $0 < L < 1$. If $M_(-) \( 2 L \) > 7 C_5 + 9$, then for $0 < lambda < 2 L$ we have $P lt.eq
    C_5$, $M_(-) \( lambda \) gt.eq M_(-) \( 2 L \)$, and $1 + lambda lt.eq 3$.
    Consequently the right side of (3.30) is strictly less than $- 2 \( C_5 + 1 \)$.
    By the negative-level identity in Lemma 10,
  $ lr(|{ lambda in bb(R) : R \( lambda \) < - 2 \( C_5 + 1 \) }|) = frac(P, 2 \( C_5 + 1 \)) < L / 2 . $
  Outside this exceptional set, the parent exceedance holds throughout $\( 0 \, 2 L \)$,
    apart from finitely many poles. Its length is therefore greater than $3 L \/ 2$,
    contradicting the definition of $L$. It follows that $M_(-) \( 2 L \) lt.eq 7 C_5 + 9$.
    Termwise comparison of denominators gives $M_(-) \( L \/ 2 \) lt.eq 4 M_(-) \( 2 L \)$.
    Thus (3.32) holds in all cases with, for instance,
  #[#set math.equation(numbering: n => "(3.33)")
   $ C_6 = max { 21 C_0 \, 1 \, 28 C_5 + 36 } . $ <poly:C6-choice>]
  For each choice define $P_i$ and $M_(- \, i)$ by replacing $nu$ with $nu_i$.
    Averaging these nonnegative quantities, followed by Markov’s inequality and a union bound,
    gives a single choice $i$ with
  #[#set math.equation(numbering: n => "(3.34)")
   $ P_i lt.eq 4 P \, wide M_(- \, i) \( L \/ 2 \) lt.eq 4 C_6 \, wide sum_(s_j > 60) nu_(i j) / s_j lt.eq
     4 C_0 m . $ <poly:small-m-selection>]
  There is no exception when one of the means is zero: the corresponding nonnegative statistic then vanishes at
    every positive-probability choice. When $L = 0$, finiteness of $M_(-) \( 0 + \)$ forces $nu_j =
    0$ at every pole $s_j = 0$. The nonnegative averaging identities then force $nu_(i j) =
    0$ at those poles for every positive-probability choice. The right-limit child statistics are therefore finite
    sums over strictly negative poles, and their averages equal the parent statistic.
    Thus the same selection argument applies at $L = 0$ and at $m = 0$.
  For this choice put $P_i^(\( K \)) = sum_(s_j > 0) nu_(i j) \/ \( K + s_j \)$. The child’s exceedance condition is
  #[#set math.equation(numbering: n => "(3.35)")
   $ sum_(s_j > 0) frac(nu_(i j), \( K + s_j \) \( lambda - s_j \)) > 1 +
     frac(P_i^(\( K \)) - M_(- \, i) \( lambda \), K + lambda) . $ <poly:child-exceedance>]
  For $lambda > L \/ 2$ the negative statistic is at most $4 C_6$ by monotonicity.
    Therefore $K gt.eq 8 C_6$ makes the right side of (3.35) at least $1 \/ 2$.
    The length of the child exceedance beyond $L \/ 2$ is at most $2 P_i^(\( K \))$ by Lemma 10.
    Split the positive poles at $60$. For $0 < s_j lt.eq 60$,
  $ frac(1, K + s_j) lt.eq 61 / K frac(1, 1 + s_j) \, $
  whereas for $s_j > 60$ it is at most $1 \/ s_j$. Thus
  #[#set math.equation(numbering: n => "(3.36)")
   $ 2 P_i^(\( K \)) lt.eq 122 / K P_i + 2 sum_(s_j > 60) nu_(i j) / s_j lt.eq frac(488 C_5, K) L +
     8 C_0 m . $ <poly:child-length-estimate>]
  Choose once and for all
  $ K gt.eq max { 1 \, 8 C_6 \, 976 C_5 } . $
  The first term in (3.36) is at most $L \/ 2$. Adding the possible length $L \/
    2$ of the initial interval gives $L \( K \, nu_i \) lt.eq L + 8 C_0 m$.
    Together with (3.28), this proves (3.25) with $C gt.eq max { 8 C_0 \, 3 \( D + 2 C_2 \) }$.
    Scaling back to arbitrary $a > 0$ completes the proof. ◻
]

We fix the universal constants $K \, C$ supplied by Lemma 11 for the remainder of the argument.
  By (3.17), at a vertex with positive penalty the lemma supplies a buffered pin increasing $cal(E) \( Q \)$ by at
  most $C m_v$. The coefficient one on $ell_v$ is what cancels the old insertion cost in this difference.
  The measured argument will sum these local charges while making interactions between simultaneous pins negligible.

== 4 Measured matrices and coherent choices on Maharam slabs <sec:slabs>

Let $cal(R)$ be a countable nonsingular Borel equivalence relation on a standard probability space
  $\( V \, mu \)$. All measurable objects are understood modulo null sets, with Borel representatives.
  Our convention for the multiplicative Radon–Nikodym cocycle is

#[#set math.equation(numbering: n => "(4.1)")
 $ d mu \( w \) = omega \( v \, w \) thin d mu \( v \) $ <slab:cocycle>]

along partial isomorphisms $v mapsto w$ with graph in $cal(R)$.
  An invariant null set can be removed so that the cocycle identities hold on the resulting relation.

Consider a measurable system $T$ of Hermitian contractions with zero diagonal on the spaces
  $ell^2 \( \[ v \]_(cal(R)) \)$. The system is #emph[principal]:
  the indices are the points of an equivalence class, with one index for each point.
  On changing the root within a class, the matrices agree up to conjugation by diagonal unitaries.
  Suppose their entries are supported on an undirected Borel graph $cal(G)$ in $cal(R)$,
  of degree at most a fixed finite number $D$, and suppose that for a fixed $J gt.eq 1$,

#[#set math.equation(numbering: n => "(4.2)")
 $ J^(- 1) lt.eq omega \( v \, w \) lt.eq J quad upright("on every edge of ") cal(G) . $ <slab:edge-cocycle>]

A measurable coloring of $V$ defines $T_(upright("pav"))$ by retaining entries whose two indices have the same
  color and setting the other entries to zero. For a function of an orbit matrix,
  its diagonal entry at the root $v$ is denoted by a subscript $v v$.

#thm([Theorem 4.1.])[
  (One-sided measured paving).  #emph[There is a universal constant $K gt.eq 1$ with the following property.
    Suppose $T$, $cal(R)$, $cal(G)$, and $omega$ satisfy the preceding assumptions.
    Let $b > 0$, and choose a positive integer $r$ such that
#[#set math.equation(numbering: n => "(4.3)")
 $ 2 sqrt(2 \/ r) + 2 \/ r < b . $ <slab:r-choice>]

 For every $sigma > 0$ and $rho > 0$, there is a measurable coloring of $V$ with $r + 1$ colors for which
#[#set math.equation(numbering: n => "(4.4)")
 $ integral_V #scale(x: 120%, y: 120%)[\(] \( T_(upright("pav")) - \( K b + sigma \) upright(bold(1)) \)_(+)^2
   #scale(x: 120%, y: 120%)[\)]_(v v) thin d mu \( v \) < rho . $ <slab:measured-conclusion>]

]
] <thm:measured-paving>

We use the constants $K$ and $C$ of Lemma 11. This section constructs choices that are coherent along the height
  coordinate of the Maharam extension: the finite buffered inequality selects a color at a lifted vertex,
  but a paving of the base requires the same choice at every height above that vertex.
  The proof of Theorem 12 is completed by the sparse pinning and descent argument in the next section.
  All constants called uniform in this section may depend on $D \, J \, r \, b$ and the fixed matrix system,
  but not on a partial assignment or on the endpoints of a slab.
  Constants for a single fixed slab will be identified separately.

=== 4.1 Invariant measure and weighted polynomial systems <invariant-measure-and-weighted-polynomial-systems>

For the Maharam extension, see [11] and the formula in [20] Section 2, before Theorem 2.1;
  the multiplicative coordinate there is $y = e^(- s)$ in our convention.
  We verify invariance in the present cocycle notation before developing the slab construction.
  The Maharam extension has vertices $u = \( v \, s \) in V times bb(R)$ and relates $\( v \, s \)$ to

$ \( w \, s + log omega \( v \, w \) \) \, wide \( v \, w \) in cal(R) . $

Projection to $V$ is injective on each lifted orbit: the cocycle identities fix the height over $w$ uniquely.
  The measure

$ d tilde(mu) \( v \, s \) = d mu \( v \) e^(- s) thin d s $

is invariant along this relation. Indeed, writing $s' = s + log omega \( v \, w \)$, Equation (4.1) gives

$ d mu \( w \) e^(- s') d s' = omega \( v \, w \) d mu \( v \) frac(e^(- s), omega \( v \, w \)) thin d s =
  d mu \( v \) e^(- s) d s . $

Consequently the mass-transport identity is

#[#set math.equation(numbering: n => "(4.5)")
 $ integral sum_y F \( u \, y \) thin d tilde(mu) \( u \) =
   integral sum_u F \( u \, y \) thin d tilde(mu) \( y \) $ <slab:mass-transport>]

for nonnegative measurable transports along the lifted relation, and for integrable complex transports.
  The identity remains true after restricting both endpoints to a slab or to any further measurable subset.
  To justify it, decompose the countable Borel relation into countably many graphs of partial Borel isomorphisms,
  using the countable-section decomposition theorem and its application to the inverse relation.
  On each lifted graph it is precisely the preceding change of variables;
  summing the graphwise identities proves the claim. The scalar polynomial data used below are invariant under the
  allowed diagonal-unitary gauges, so they define transports without any choice of gauge.

Fix a bounded interval $I$ and restrict the lifted graph and matrices to $V times I$.
  A partial assignment on the base $V$ specifies a color at some vertices.
  At unassigned vertices let $t_(v i) = 1 \/ r$ for every $i$ and let $c_v = b$;
  at assigned vertices let $\( t_(v i) \)_i$ be the corresponding point mass and let $c_v = K b$.
  Lift these data unchanged in $s$, and set

#[#set math.equation(numbering: n => "(4.6)")
 $ d_u = e^s quad \( u = \( v \, s \) \) \, wide W = d^(1 \/ 2) T d^(1 \/ 2) \, wide a_u =
   d_u c_v . $ <slab:weighted-system>]

The weight $d_u = e^s$ cancels the density $e^(- s)$ of the invariant measure:
  an absolute spectral cost integrated against $d tilde(mu)$ is its normalized cost, divided by $d_u$,
  integrated against $d mu thin d s$. This will make long slabs comparable by ordinary averages over height.
  We use the finite mixed polynomials and local data of Lemma 7 with these matrices and penalties.
  A prospective buffered pin at an unassigned lifted vertex fixes its color and replaces its penalty $b d_u$ by $K
  b d_u$. During comparisons we also allow arbitrary vertex deletions and single lifted-vertex changes;
  these intermediate configurations need not arise from a base assignment.
  Distances are always taken in the original restricted lift of $cal(G)$,
  including edges whose entries have subsequently been set to zero.

All finite principal systems in a fixed slab, and all their prospective pins,
  have their roots and poles in a common interval $\[ - B \, B \]$.
  For example, an enlarged value of $sup_u a_u + r ∥W∥$ is sufficient:
  apply Lemma 6 to the two half-planes beyond the numerical ranges of the determinant matrices.
  The same conclusion holds if some cross edges are cut or interpolated as below, with an enlarged fixed-slab bound.

There are also estimates which do not depend on the slab.
  The residue formula in Lemma 7, together with $d_y \/ d_u lt.eq J$ on edges, gives

$ a_u lt.eq K b d_u \, wide sum_j nu_(u \, j) lt.eq sum_y lr(|W_(u y)|)^2 lt.eq
  J d_u^2 sum_y lr(|T_(u y)|)^2 lt.eq J d_u^2 . $

They hold for each pin alternative as well. They continue to hold under the cuts and real edge interpolations used
  later, since these only decrease the absolute values of the entries.
  The second-moment formula for $gamma_u$ and the arrow representation therefore give a constant
  $C_(upright("loc"))$ such that

#[#set math.equation(numbering: n => "(4.7)")
 $ m_u lt.eq C_(upright("loc")) d_u \, wide 0 lt.eq ell_u lt.eq C_(upright("loc")) d_u \, wide 0 lt.eq
   ell'_(u \, i) lt.eq C_(upright("loc")) d_u . $ <slab:local-bounds>]

For the last two estimates, adding the off-diagonal arrow to $\( - a_u \) xor
  S$ changes the trace of the positive part by at most the trace norm of that arrow,
  namely $2 \( sum_j nu_(u \, j) \)^(1 \/ 2)$. The positive-part trace variational formula proves this estimate;
  interlacing gives its nonnegative sign. Here and below $h'_i$ denotes the buffered pin, rather than a derivative.

=== 4.2 Locality and infinite bounded slabs <locality-and-infinite-bounded-slabs>

#thm([Lemma 4.2.])[
  (Local limits on a bounded slab).  #emph[On each bounded slab, the finite local functions $h_u \, G_u \,
    h_(u \, i) \, h'_(u \, i) \, R_(u \, i)$, the probability and residue measures, and the data $m_u \, ell_u \,
    ell'_(u \, i)$ have unique limits as finite graph balls increase to a component.
    They are measurable and independent of the exhaustion, and the local Cauchy-transform and Poisson-transform
    identities pass to the limits. Their supports have a common fixed-slab bound, and Equation (4.7) continues to hold.]
  #emph[The Laurent coefficients through order $k$ of $h_u \/ z$, $z G_u$, $h_(u \, i) \/ z$, $h'_(u \, i) \/ z$,
    and $R_(u \, i)$, and the moments of $gamma_u$ through order $k$,
    depend only on the data within graph distance $k$ of $u$.
    The same assertion holds for coefficients of logarithmic derivatives under data perturbations,
    with the local perturbation directions included in the data.
    It remains valid under arbitrary deletion configurations.]
  #emph[At an unassigned vertex the buffered pin inequality of Lemma 11 holds for these infinite local data.
    If every base vertex is unassigned, then $m_u = 0$ on every bounded slab.]
] <lem:slab-limits>

#proof[
  We first establish locality directly at the level of formal Laurent series,
    so that the assertion does not depend on any limiting argument.
    For a finite principal set $Q$ and $v in Q$, put $H_(v \, Q) = h_(v \, Q) \/ z$.
    Expanding the determinant expectation according to the singleton or nontrivial permutation cycle containing
    $v$ gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ H_(v \, Q) = 1 + a_v / z - sum_(C in.rev v\
\| C \| gt.eq 2) w_C z^(- \| C \|) product_(x in C \\ { v }) H_(x \, Q \( x \))^(- 1) . $ <slab:local-expansion>]
  Here $w_C$ is the cycle weight in Equation (3.4). Delete $v$ first and then the other vertices of $C$ in a fixed
    order; $Q \( x \)$ denotes the principal set remaining just before $x$ is deleted.
    The inverse quotients in the product telescope to $f_(Q \\ C) \/
    f_(Q \\ { v })$ after the displayed powers of $z$ are accounted for.
    Each oriented permutation cycle is counted once, with the convention of the finite expansion.
  All series $H$ have constant term $1$. A coefficient of order at most $k$ in a term coming from a cycle of
    length $l$ uses only coefficients through order $k - l$ in its inverse factors.
    Induction on $k$ now proves the radius-$k$ locality assertion:
    the cycle has length at most $k$, and the further radii of the needed factors stay within distance $k$ of $v$.
    Formal inversion, multiplication, and differentiation preserve this property.
    This proves locality for all the listed series and for their perturbation derivatives,
    including complex perturbations; only the algebraic finite polynomial identities were used.
    The expansion of $z G_v$ is the moment expansion of $gamma_v$, proving the moment assertion.
  For real data, the measures $gamma_v$ are probability measures with support in the common compact interval
    $\[ - B \, B \]$. The residue measures have support there and bounded mass for each fixed vertex,
    uniformly in the finite principal subset. Locality stabilizes all their moments:
    for the residue measure use the Laurent expansion of $h_v \( z \) = z + a_v -
    integral \( z - x \)^(- 1) thin d nu_v \( x \)$. Compact-support moment determinacy proves unique weak
    convergence. It also gives locally uniform convergence of $h_v \,
    G_v$ and their pin alternatives on $bb(C) \\ \[ - B \, B \]$, in particular on the upper half-plane.
    Their limits satisfy $"Im" h_v \( z \) gt.eq "Im" z$.
  For the finite spectral-shift functions $xi_h$, we have $0 lt.eq xi_h lt.eq 1$.
    Every weak-\* subsequential limit therefore has these bounds. The identity
  $ pi^(- 1) arg h \( x + i eta \) = \( P_eta * xi_h \) \( x \) $
  passes to the limit, since the Poisson kernel belongs to $L^1 \( bb(R) \)$ and the analytic functions converge.
    Poisson approximation uniquely determines the limit function from these identities.
    Thus the entire sequence converges weak-\*; all functions vanish above $B$,
    so their integrals over the positive axis converge. The integrals defining $m$ also converge by the compact
    support of $gamma$. Apply this reasoning to every pin alternative.
    The inequalities in Equation (4.7) and Lemma 11 pass to the limit,
    the latter because there are only finitely many choices of color.
  Finite graph balls and the corresponding finite polynomial computations are measurable in the countable Borel
    relation. Their limits are therefore measurable. The same construction applies to single-vertex response
    functions indexed by pairs in an orbit. Components disconnected in the distance graph do not affect these
    local functions, so they can be treated separately. Throughout this construction the heights and weights are
    absolute on the lifted orbit; they are not reset when the root changes.
  Finally suppose all vertices are unassigned. On a finite set $Q$,
    the weighted polynomial at common argument $z$ is $product_(v in Q)
    d_v$ times the unweighted mixed polynomial for $T$, with zero penalties,
    evaluated at the tuple $\( b + z \/ d_v \)_(v in Q)$. Its multiaffine Taylor coefficients at the constant
    tuple $b$ are the corresponding smaller principal polynomials evaluated at $b$.
    All are strictly positive by Equation (4.3) and Lemma 8, including the empty polynomial $1$.
    Hence the weighted polynomial is strictly positive for every real $z gt.eq 0$.
    All its roots are real, so its local spectral measures have no positive support.
    Taking the local limits gives $m_u = 0$. ◻
]

=== 4.3 Uniform comparison under far deletions <uniform-comparison-under-far-deletions>

At an unassigned vertex of a slab define the normalized tuple

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(D)^I \( v \, s \) = e^(- s) #scale(x: 120%, y: 120%)[\(] m_(\( v \, s \)) \,
   ell_(\( v \, s \)) \, \( ell'_(\( v \, s \) \, i) \)_(1 lt.eq i lt.eq r) #scale(x: 120%, y: 120%)[\)] .
   $ <slab:normalized-data>]

We use the sum of absolute values as its norm. The superscript records the slab,
  and will be omitted when the ambient configuration is clear.

#thm([Lemma 4.3.])[
  (Far-deletion comparison).  #emph[Consider any bounded slab containing $V times \[ 0 \, 1 \]$,
    any base partial assignment, and any further measurable restriction that retains the central vertices being
    tested. Deleting a measurable set of vertices at heights $s > R$, or at heights $s < - R$,
    changes the tuple in Equation (4.9) by an amount tending to zero in $L^1 \( d mu thin d s \)$ on the central
    unassigned band as $R arrow.r oo$. The convergence is uniform in the slab, the partial assignment,
    and the deletion set. The same conclusion holds for the union of a far high set and a far low set.]
] <lem:far-deletion>

#proof[
  We prove the analytic comparisons first and then recover the integral data.
    The transform $G$ determines the local probability measure; $h = 1 \/ G$ and $R_i =
    h_i \/ h$ then determine the parent and pinned spectral shifts.
    For high deletions we test their integrated differences against bounded complex directions and express a
    single deletion response as a logarithmic derivative. Stability bounds that derivative independently of
    height. We transport its local Laurent coefficients and use analytic uniqueness to recover the whole-deletion
    response. Low deletions instead cut a matrix of small norm.
    All pre- and post-deletion systems use the same absolute heights, penalties, and retained probabilities.
  ===== 4.3.1 High deletions and test directions. <high-deletions-and-test-directions.>
  Write $D$ for a set above height $R$, with $R > 1$. Then $tilde(mu) \( D \) lt.eq e^(- R)$.
    For upper-half-plane arguments $z$ we claim
  #[#set math.equation(numbering: n => "(4.10)")
   $ integral_(upright("central")) lr(|G_v^(upright("pre")) \( z \) - G_v^(upright("post")) \( z \)|) thin d
     tilde(mu) \( v \) & lt.eq C \( z \) tilde(mu) \( D \) \,\
integral_(upright("central")\
upright("unassigned")) lr(|R_(v \, i)^(upright("pre")) \( z \) - R_(v \, i)^(upright("post")) \( z \)|) thin d
  tilde(mu) \( v \) & lt.eq C \( z \) tilde(mu) \( D \) . $ <slab:high-G>]
  Here $v$ denotes a lifted vertex, and $R_(v \, i) = h_(v \, i) \/ h_v$ uses the pin with unchanged penalty.
    The constants are bounded uniformly for $z$ in upper-half-plane compact sets,
    independently of the slab and assignment.
  It suffices to bound the integral of each complex difference against an arbitrary measurable direction
    $lambda \( v \)$ with $lr(|lambda \( v \)|) lt.eq 1$, supported on the tested set.
    For the first comparison perturb $Y_v$ by $zeta lambda \( v \)$.
    For the second, fix a color $i$ and add $zeta lambda \( v \)$ to its probability at every tested unassigned
    vertex, leaving the other probabilities unchanged. For this second perturbation,
    first use unnormalized weights in the polynomial sum. Equivalently,
    normalize the weights at each vertex and multiply the resulting polynomial on $Q$ by
    $product_(v in Q) \( 1 + zeta lambda \( v \) \)$. These additional factors cancel in the quotient deleting one
    high vertex $u$, since $lambda \( u \) = 0$.
  In a finite principal system, differentiation of the numerator and denominator yields
  #[#set math.equation(numbering: n => "(4.11)")
   $ U_u \( z \) := partial_zeta log h_u \( z \; zeta \)\|_(zeta = 0) =
     sum_(v med upright("tested")) lambda \( v \) #scale(x: 120%, y: 120%)[\(] cal(B)_v^(upright("pre")) \( z \) -
     cal(B)_v^(upright("post") \( u \)) \( z \) #scale(x: 120%, y: 120%)[\)] \, $ <slab:derivative-identity>]
  where $cal(B)_v = G_v$ or $R_(v \, i)$, respectively, and $upright("post") \( u \)$ means deletion of this one
    vertex. For the probability perturbation, the unnormalized derivative at $v$ is exactly the polynomial with
    $v$ pinned to color $i$; its logarithmic derivative is $R_(v \, i)$.
    The cancellation just noted allows us to estimate $h_u \( z \; zeta \)$ using the normalized determinant
    formula in Lemma 6.
  ===== 4.3.2 A uniform bound for the logarithmic derivative. <a-uniform-bound-for-the-logarithmic-derivative.>
  Fix $eta > 0$ and upper arguments with $"Im" z gt.eq eta$.
    There is a disk $lr(|zeta|) < s_(*)$, independent of the slab, directions, finite principal set,
    and assignment, on which $"Im" h_u \( z \; zeta \) gt.eq eta \/ 2$.
    For the diagonal perturbation, the relevant determinant matrices change by norm at most $lr(|zeta|)$.
    For the probability perturbation, all tested vertices initially have probabilities $1 \/ r$.
    The normalized probabilities have analytic square roots near these positive values on a common disk
    $lr(|zeta|) < c \/ r$, and their changes are bounded by a constant times $lr(|zeta|)$ on a smaller disk.
    Square roots at all other vertices are unchanged, including the zero probabilities at assigned vertices.
    Every changed matrix entry is incident to the central band,
    and its other endpoint has height in $\[ - log J \, 1 + log J \]$ by Equation (4.2).
    Bounded row and column sums, using the degree bound, therefore bound the entire matrix perturbation by $C
    lr(|zeta|)$, uniformly in the enclosing slab.
  The initial determinant matrices are Hermitian. Taking $s_(*)$ small enough,
    their perturbed numerical ranges have imaginary parts less than $eta \/ 2$ in absolute value.
    Lemma 6 gives nonvanishing when all diagonal variables have imaginary part greater than $eta \/ 2$,
    for every principal subset. In the diagonal-perturbation case,
    regard the shifts as perturbations of the penalties. The final quotient at the unperturbed vertex $u$ is monic
    affine in $Y_u$; its zero therefore has imaginary part at most $eta \/ 2$.
    Evaluating at the common argument $z$ proves the asserted lower bound on the imaginary part of
    $h_u \( z \; zeta \)$.
  A holomorphic logarithm on the $zeta$ disk now has imaginary part between $0$ and $pi$.
    The harmonic gradient estimate and the Cauchy–Riemann equations give
  #[#set math.equation(numbering: n => "(4.12)")
   $ lr(|U_u \( z \)|) lt.eq C \( eta \) . $ <slab:uniform-U>]
  The bound does not involve the size of $h_u$ or the height of $u$.
    Thus high vertices with arbitrarily large real weights cause no loss of uniformity.
  For each fixed bounded enclosing slab, we also need uniform control near infinity.
    On a common small $zeta$ disk all perturbed determinant matrices then have a uniform norm bound.
    Choose $B'$ larger than this bound and larger than every real support bound, with positive slack.
    For $lr(|z|) > B'$, use the half-plane in the direction $z \/ lr(||) z$ strictly beyond the matrix norm bound.
    The affine quotient belongs to a rotated half-plane through the origin,
    so the same logarithmic argument gives a uniform bound for $U_u$ there.
    This bound and $B'$ may depend on the fixed slab; they are uniform in its principal subsets, directions,
    and assignment states. In particular the functions $U_u$ are analytic and locally bounded on
  #[#set math.equation(numbering: n => "(4.13)")
   $ Omega = bb(C)^(+) med union med { z : lr(||) z > B' } \, $ <slab:normal-domain>]
  and are bounded near the removable point at infinity.
  As finite balls around $u$ increase, normal families give subsequential locally uniform limits on $Omega$,
    also near infinity. The locality in Lemma 13, applied to perturbation derivatives,
    stabilizes every Laurent coefficient at infinity. All subsequential limits therefore have the same Laurent
    series and coincide by the identity theorem on the connected domain $Omega$.
    This defines a unique measurable function $U_u$ for infinite components, retaining Equation (4.12).
  The endpoint functions $cal(B)_v$ are also analytic on $Omega$, with removable values at infinity.
    At central vertices they are uniformly bounded on upper-half-plane compact sets.
    Indeed the residue representation gives
  $ lr(|h_(v \, i) \( z \)|) lt.eq lr(||) z + a_v + frac(sum_j nu_(v \, i \, j), "Im" z) \, wide
    "Im" h_v \( z \) gt.eq "Im" z \, $
  and the central residue masses and penalties are uniformly bounded. The same statements hold after deletions.
  ===== 4.3.3 Recovering the whole-deletion response. <recovering-the-whole-deletion-response.>
  Let $H_(*) \( z \)$ be the integral against $lambda \( v \)$ of the difference between the endpoint functions
    before and after deleting all of $D$. The preceding bounds show that $H_(*)$ is analytic on $Omega$,
    including at infinity. We do not sum individual analytic responses over an entire orbit.
    Instead we first match their local Laurent coefficients.
  For each integer $k gt.eq 1$, partition $D$ measurably into finitely many batches such that distinct vertices of
    a batch have distance greater than $2 k$ in the enclosing graph, and delete the batches in order.
    The required finite Borel coloring exists for every bounded-degree Borel graph and each finite-distance graph
    power [10]. For completeness, choose a countable family of Borel binary labels separating points;
    assign each vertex a finite prefix long enough to distinguish it from its finitely many neighbors.
    These prefixes give a countable proper Borel coloring. Process the countably many color classes in order,
    recoloring each class with a palette of size one more than the degree bound and avoiding the previously
    assigned neighbor colors. Each class is independent, so this is a proper finite Borel coloring.
  For each batch use the single-deletion logarithmic derivative in the configuration just before that batch, and put
  $ S_k \( z \) = sum_(upright("batches")) integral_(upright("batch")) U_u^(upright("pre")) \( z \) thin d
    tilde(mu) \( u \) . $
  Because the batches partition $D$, Equation (4.12) gives the locally uniform bound $lr(|S_k \( z \)|) lt.eq
    C \( z \) tilde(mu) \( D \)$ on $bb(C)^(+)$, independent of $k$ and of the number of batches.
    There is a common fixed-slab bound near infinity as well.
  The Laurent coefficients of $S_k$ and $H_(*)$ agree through order $k$.
    To see this, first apply Equation (4.11) to one deletion.
    At these orders only vertices within distance $k$ of the deletion can contribute, by Lemma 13;
    hence this coefficient identity on an infinite component is verified in a sufficiently large finite
    neighborhood. Within one batch the coefficient change at a tested vertex is the sum of the single changes in
    the pre-batch configuration, because at most one batch vertex belongs to its radius-$k$ neighborhood.
    Sum this coefficient identity over the tested vertices and use Equation (4.5) to move the sum to the deletion
    vertices. The transports are integrable: for the fixed slab and fixed order their coefficients are bounded,
    and their supports have a uniform finite ball-size bound.
    The analytic bounds near infinity justify interchanging coefficients and integrals.
    Finally sum over the batches; the successive endpoint changes telescope to $H_(*)$.
  Apply normal families to $S_k$ on $Omega$ with its removable point at infinity.
    Every subsequential limit has every Laurent coefficient of $H_(*)$,
    since the first $k$ coefficients agree for each $k$. The identity theorem shows that this limit is $H_(*)$
    throughout $Omega$. It follows that $lr(|H_(*) \( z \)|) lt.eq C \( z \) tilde(mu) \( D \)$ on $bb(C)^(+)$,
    with the slab-independent constants already established there.
    The fixed-slab compactness near infinity has thus transferred the uniform upper-half-plane bound;
    it has not supplied a spectral-support bound uniform over slabs.
    For each fixed target $z$, choosing the measurable complex sign $lambda$ of the endpoint difference proves
    Equations (4.10) and (4.10).
  At central vertices $h_v$ and $h_(v \, i)$ are bounded uniformly on upper-half-plane compact sets.
    The identity $h^(upright("pre")) - h^(upright("post")) = h^(upright("pre"))
    h^(upright("post")) \( G^(upright("post")) - G^(upright("pre")) \)$ therefore gives the same $L^1$ comparison
    for $h$. Then $h_i = h R_i$ gives the comparison for every $h_i$ on the central unassigned set.
    Adding the unchanged shift $\( K - 1 \) a_v$ gives it for $h'_i$ as well.
  ===== 4.3.4 Low deletions. <low-deletions.>
  Suppose now that $D$ lies below height $- R$. Cut every edge between $D$ and its complement,
    writing $V_0$ for the removed matrix. Each such edge has both heights below $- R + log J$.
    Its entry is therefore $O \( e^(- R) \)$; the degree bound yields $∥V_0∥ =
    O \( e^(- R) \)$ uniformly in the slab. Interpolate by $W \( t \) = W_(upright("cut")) + t V_0$, $0 lt.eq
    t lt.eq 1$. For finite systems at a central vertex, $h_v \( z \; t \)$ lies in the upper half-plane and is
    bounded uniformly for upper $z$ in compact sets, by the central second-moment and residue estimates.
    Around each real $t$, allow complex perturbations in a disk of radius $c eta \/ \( r ∥V_0∥ \)$ when $∥V_0∥ >
    0$, where $"Im" z gt.eq eta$. The corresponding determinant matrix perturbation has norm at most $c eta$.
    The complex interpolation still has zero diagonal, so the algebraic identity and conditional half-plane
    assertion of Lemma 6 apply even though the matrix need not be Hermitian away from real $t$.
    The stability and logarithmic gradient argument just given implies
  $ lr(|partial_t log h_v \( z \; t \)|) lt.eq C \( eta \, r \) ∥V_0∥ . $
  The zero-norm case is immediate. The argument applies also to each prospective buffered pin,
    considered as a separate real-data system under the same edge interpolation.
    Integrate in real $t$, using the uniform absolute bound on $h$ and $"Im" h gt.eq eta$ for reciprocation.
    We obtain $O \( e^(- R) \)$ endpoint comparisons for $h \, G \, h'_i$ at every tested central vertex.
    In the cut system the low component factors out of the polynomial quotients, so the endpoint at $t =
    0$ has exactly the same central data as the deleted system.
    The finite-ball limits pass these comparisons to infinite bounded-slab components.
  ===== 4.3.5 Recovering the integral data. <recovering-the-integral-data.>
  At central vertices the probability measures $gamma_v$ have uniformly bounded second moments.
    Therefore $m_v = integral x_(+) thin d gamma_v$ is uniformly approximated by integration against continuous
    compactly supported cutoffs of $x_(+)$. For such a test function,
    Poisson convolution approximates it uniformly, so its integral against $gamma_v$ is in turn uniformly
    approximated by its integral against $- pi^(- 1) "Im" G_v \( x + i eta \) thin d
    x$ at a sufficiently small fixed $eta > 0$.
  For the $ell$ data we also have a uniform positive-tail estimate:
  #[#set math.equation(numbering: n => "(4.14)")
   $ integral_M^oo xi_h \( x \) thin d x lt.eq frac(sum_j nu_j, M) \, wide M > 0 . $ <slab:xi-tail>]
  For finite systems, $xi_h \( x \) = 1$ with $x > M$ implies $sum_j nu_j \/ \( x - s_j \) > x + a_v > M$.
    The Boole length identity used in Lemma 11 proves Equation (4.14);
    weak-\* convergence on a fixed bounded slab gives the infinite version.
    The bound is uniform at central vertices and for their pins.
    After choosing $M$ large, approximate the remaining integral over $\( 0 \, M \)$ by
  $ 1 / pi integral_0^M arg h \( x + i eta \) thin d x . $
  By the Poisson identity, the error is at most $∥P_eta * 1_(\( 0 \, M \)) - 1_(\( 0 \, M \))∥_(L^1 \( bb(R) \))$,
    which tends to zero as $eta arrow.b 0$. At this fixed height,
    arguments are Lipschitz-controlled by differences of $h$ values in $"Im" h gt.eq eta$.
  Choose the tail and smoothing errors first; then use the preceding analytic comparisons on the resulting compact
    upper-half-plane sets and integrate in $x$. This proves convergence for $m \, ell$ and all the $ell'_i$.
    On the central band the measures $d tilde(mu)$ and $d mu thin d s$, and the normalization factors $e^(- s)$,
    are boundedly comparable, proving the claimed tuple comparison.
    A union of far high and far low deletions is handled in two successive steps.
    Non-strict far cutoffs have the same conclusion, by inserting a unit of slack in $R$. ◻
]

=== 4.4 A color choice independent of height <a-color-choice-independent-of-height>

Figure 1 summarizes how the far-deletion estimates allow a single base color to be used throughout a long slab.

#thm([Lemma 4.4.])[
  (Coherent choices).  #emph[For every $tau_0 > 0$ there are arbitrarily large integers $L gt.eq
    1$ with the following property, uniformly over all base partial assignments.
    On the slab $V times \[ 0 \, L \]$ one can choose a measurable prospective color $i \( v \)$ at each
    unassigned base vertex, using the same color at every height, so that
#[#set math.equation(numbering: n => "(4.15)")
 $ 1 /
   L
   integral_(upright("unassigned") med upright("in") med V times \[ 0 \, L \]) \( ell'_(\( v \, s \) \, i \(
   v \)) - ell_(\( v \, s \)) \) thin d tilde(mu) \( v \, s \) lt.eq C Phi + tau_0 \, wide Phi = 1 /
   L integral_(V times \[ 0 \, L \]) m_(\( v \, s \)) thin d tilde(mu) \( v \, s \) . $ <slab:coherent-inequality>]

 Here $C$ is the universal constant in Lemma 11, and every $ell'_(u \, i)$ on the left is the insertion cost after
   changing only the lifted vertex $u$. The same $L$ can be used at every stage of a sequence of partial assignments.]
] <lem:coherent-choice>

#proof[
  The normalized tuple obeys the exact translation rule
  #[#set math.equation(numbering: n => "(4.16)")
   $ cal(D)^I \( v \, s + alpha \) = cal(D)^(I - alpha) \( v \, s \) . $ <slab:translation>]
  Indeed translating the heights by $alpha$ multiplies all weights $d$, the matrix $W$,
    and the penalties in the orbit by $e^alpha$. The spectral quantities $m \, ell \,
    ell'_i$ scale by this same factor, which is canceled by the normalization at the root.
    The lifted probabilities are unchanged because the partial assignment is on the base.
    This proves Equation (4.16) first in finite balls and then in the local limits.
  Take a large integer $R$, use the reference interval $\[ - R \, R \]$,
    and write its tuple as $cal(D)^0$ in this proof. For $alpha in \[ - 1 \, 1 \]$,
    compare this interval and its translate $\[ - R \, R \] - alpha$ to their intersection.
    The differences involve only far high and low deletions. Equations (4.16) and Lemma 14 imply
  #[#set math.equation(numbering: n => "(4.17)")
   $ integral_(v med upright("unassigned")) integral_({ s in \[ 0 \, 1 \] : med s + alpha in \[ 0 \, 1 \] })
     lr(|cal(D)^0 \( v \, s + alpha \) - cal(D)^0 \( v \, s \)|) thin d s thin d mu \( v \) lt.eq e \( R \) \,
     $ <slab:small-translation>]
  where $e \( R \) arrow.r 0$ uniformly in the assignment. We enlarge $e \( R \)$ if necessary so that it is
    positive. Integrating in $alpha$ turns the left side into the corresponding integral over all pairs
    $\( s \, t \) in \[ 0 \, 1 \]^2$. Fubini therefore gives a single $s_0 in \[ 0 \, 1 \]$ such that
  #[#set math.equation(numbering: n => "(4.18)")
   $ integral_(v med upright("unassigned")) integral_0^1 lr(|cal(D)^0 \( v \, s \) - cal(D)^0 \( v \, s_0 \)|)
     thin d s thin d mu \( v \) lt.eq 3 e \( R \) . $ <slab:reference-slice>]
  The slice can also be chosen so that the local data and the buffered pin inequality hold almost everywhere on it.
  At this slice choose the least minimizing color for $ell'_(\( v \, s_0 \) \, i)$.
    This is a measurable function $i \( v \)$ because there are finitely many colors. Lemma 11 gives
  $ e^(- s_0) #scale(x: 120%, y: 120%)[\(] ell'_(\( v \, s_0 \) \, i \( v \)) - ell_(\( v \, s_0 \)) -
    C m_(\( v \, s_0 \)) #scale(x: 120%, y: 120%)[\)] lt.eq 0 . $
  The tuple norm contains all color alternatives. Consequently Equation (4.18) implies that the integral of this
    same normalized difference over $v$ and $s in \[ 0 \, 1 \]$, now using the data at $s$,
    is at most a fixed constant times $e \( R \)$.
  Consider a unit band $\[ k \, k + 1 \]$ in $\[ 0 \, L \]$, where $k$ is an integer with $k gt.eq R$ and $L -
    k gt.eq R$. Translate it to $\[ 0 \, 1 \]$; its ambient interval becomes $\[ - k \, L - k \]$.
    Trimming this interval to $\[ - R \, R \]$ removes only far high and low vertices.
    Lemma 14 and Equation (4.16) show that its tuple differs from $cal(D)^0 \( v \, s \)$ in integrated norm by at
    most $e \( R \)$, after enlarging the same uniformly vanishing error function.
    Thus the $mu thin d s$ integral over this unit band of
  $ e^(- s) #scale(x: 120%, y: 120%)[\(] ell'_(\( v \, s \) \, i \( v \)) - ell_(\( v \, s \)) -
    C m_(\( v \, s \)) #scale(x: 120%, y: 120%)[\)] $
  on unassigned vertices is at most a constant times $e \( R \)$.
    All remaining boundary bands have total length at most $2 R + 2$.
    Their normalized data are uniformly bounded by Equation (4.7).
  Absolute costs against $d tilde(mu)$ are exactly normalized costs against $d mu thin d s$.
    Summing the unit-band estimates and dividing by $L$ bounds the total error by $C_1 e \( R \) +
    C_2 \( R + 1 \) \/ L$, with constants independent of the assignment.
    Choose $R$ sufficiently large, then choose $L$ sufficiently large and satisfying any prescribed lower bound.
    This makes the error at most $tau_0$. Finally $m gt.eq 0$ permits replacing its integral over unassigned
    vertices by the integral over the whole slab, yielding Equation (4.15).
    All choices of the numerical parameters used only uniform estimates,
    proving the assertion about using the same $L$ at different stages.
    Null modifications of base data can be absorbed into an invariant null set by nonsingularity. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 5.7), [#text(size: 9pt)[\(a\) Far deletions around a test band]], anchor: "west", padding: 0.07056cm)
  rect((0.8, 4.25), (2.7, 5.05), fill: rgb("#f2ece4"), stroke: none)
  rect((0.8, 0.4), (2.7, 1.2), fill: rgb("#e5ebf0"), stroke: none)
  rect((0.8, 2.5), (2.7, 3.15), fill: rgb("#e5eeeb"), stroke: none)
  rect((0.8, 0.4), (2.7, 5.05), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  rect((0.8, 1.2), (2.7, 4.25), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.68, 1.2), (2.7, 1.2), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((0.62, 1.2), [#text(size: 9pt)[$-R$]], anchor: "east", padding: 0.07056cm)
  line((0.68, 2.5), (2.7, 2.5), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((0.62, 2.5), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.07056cm)
  line((0.68, 3.15), (2.7, 3.15), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((0.62, 3.15), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.07056cm)
  line((0.68, 4.25), (2.7, 4.25), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((0.62, 4.25), [#text(size: 9pt)[$R$]], anchor: "east", padding: 0.07056cm)
  line((0.8, 2.82), (2.7, 2.82), stroke: (paint: rgb("#277456"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((2.92, 4.65), [#text(fill: rgb("#95641b"))[#text(size: 9pt)[High deletion: small measure#linebreak()$tilde( mu ) (D) lt.eq e^(-R)$]]], anchor: "west", padding: 0.07056cm)
  content((2.92, 2.82), [#text(size: 9pt)[Test band $[0,1]$#linebreak()reference slice $s_0$]], anchor: "west", padding: 0.07056cm)
  content((2.92, 0.78), [#text(fill: rgb("#275b86"))[#text(size: 9pt)[Low deletion: small cut matrix#linebreak()$\| Delta W\|=O(e^(-R))$]]], anchor: "west", padding: 0.07056cm)
  content((1.75, -0.1), [#text(size: 9pt)[Retained reference slab#linebreak()$V times [-R,R]$]])
  content((8, 5.7), [#text(size: 9pt)[\(b\) One base color at every height]], anchor: "west", padding: 0.07056cm)
  rect((8.65, 0.4), (11.4, 1.12), fill: rgb("#eeeeee"), stroke: none)
  rect((8.65, 4.33), (11.4, 5.05), fill: rgb("#eeeeee"), stroke: none)
  rect((8.65, 1.12), (11.4, 4.33), fill: rgb("#f0f5f3"), stroke: none)
  rect((8.65, 0.4), (11.4, 5.05), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((8.65, 1.12), (11.4, 1.12), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((8.65, 4.33), (11.4, 4.33), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((8.65, 2.43), (11.4, 3.05), stroke: (paint: rgb("#277456"), thickness: 0.4pt, miter-limit: 10))
  line((9.13, 0.54), (9.13, 4.91), stroke: (paint: rgb("#275b86"), thickness: 1.2pt, miter-limit: 10))
  circle((9.13, 0.75), radius: 0.0635, fill: rgb("#275b86"), stroke: none)
  circle((9.13, 1.65), radius: 0.0635, fill: rgb("#275b86"), stroke: none)
  circle((9.13, 2.74), radius: 0.0635, fill: rgb("#275b86"), stroke: none)
  circle((9.13, 3.65), radius: 0.0635, fill: rgb("#275b86"), stroke: none)
  circle((9.13, 4.7), radius: 0.0635, fill: rgb("#275b86"), stroke: none)
  line((10.02, 0.54), (10.02, 4.91), stroke: (paint: rgb("#95641b"), thickness: 1.2pt, miter-limit: 10))
  circle((10.02, 0.75), radius: 0.0635, fill: rgb("#95641b"), stroke: none)
  circle((10.02, 1.65), radius: 0.0635, fill: rgb("#95641b"), stroke: none)
  circle((10.02, 2.74), radius: 0.0635, fill: rgb("#95641b"), stroke: none)
  circle((10.02, 3.65), radius: 0.0635, fill: rgb("#95641b"), stroke: none)
  circle((10.02, 4.7), radius: 0.0635, fill: rgb("#95641b"), stroke: none)
  line((10.91, 0.54), (10.91, 4.91), stroke: (paint: rgb("#277456"), thickness: 1.2pt, miter-limit: 10))
  circle((10.91, 0.75), radius: 0.0635, fill: rgb("#277456"), stroke: none)
  circle((10.91, 1.65), radius: 0.0635, fill: rgb("#277456"), stroke: none)
  circle((10.91, 2.74), radius: 0.0635, fill: rgb("#277456"), stroke: none)
  circle((10.91, 3.65), radius: 0.0635, fill: rgb("#277456"), stroke: none)
  circle((10.91, 4.7), radius: 0.0635, fill: rgb("#277456"), stroke: none)
  content((8.48, 0.4), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.07056cm)
  content((8.48, 5.05), [#text(size: 9pt)[$L$]], anchor: "east", padding: 0.07056cm)
  content((11.58, 4.65), [#text(size: 9pt)[Boundary#linebreak()bands]], anchor: "west", padding: 0.07056cm)
  content((11.58, 2.74), [#text(size: 9pt)[Interior unit band#linebreak()$[k,k+1]$]], anchor: "west", padding: 0.07056cm)
  content((11.58, 0.76), [#text(size: 9pt)[Boundary#linebreak()bands]], anchor: "west", padding: 0.07056cm)
  content((9.13, 0.08), [#text(size: 9pt)[$v_1$]])
  content((10.02, 0.08), [#text(size: 9pt)[$v_2$]])
  content((10.91, 0.08), [#text(size: 9pt)[$v_3$]])
  content((10.02, -0.52), [#text(size: 9pt)[Long slab $V times [0,L]$]])
})],
  caption: [Figure 1: Height geometry behind Lemmas 14 and 15 (not to scale). High and low deletions are controlled by different estimates. A color selected on the reference slice is used at every height above the same base vertex. Translated interior unit bands compare with the reference slab in integrated normalized data; the boundary bands have total length at most $2 R + 2$. The colored vertical lines are base fibers ${ v } times \[ 0 \, L \]$, not lifted relation orbits. ],
) <fig:maharam>

== 5 Sparse pinning and descent <sec:pinning>

=== 5.1 Sparse pinning and removal of unassigned vertices <sparse-pinning-and-removal-of-unassigned-vertices>

We retain the notation and hypotheses of Theorem 12. In particular,
  $b > 0$ and $r$ satisfy its strict largest-root inequality, and $K \,
  C$ are the universal constants from Lemma 11. The lifted graph on a slab is always the restriction of the
  original enclosing graph, including edges at which a particular matrix entry happens to vanish.
  All distances below refer to this enclosing graph.

#thm([Proposition 5.1.])[
  #emph[For every $zeta \, eta > 0$ and $L_0 gt.eq 1$, there are an integer $L gt.eq L_0$ and a measurable partition
$ V = cal(U) union.sq V_1 union.sq dots.h.c union.sq V_r $

 such that $mu \( cal(U) \) < eta$ and the following holds.
   On the surviving lifted vertices $\( V \\ cal(U) \) times \[ 0 \, L \]$,
   let $T_(upright("col"))^L$ be the restriction of $T$, keeping only entries between vertices whose basepoints
   belong to the same $V_i$, and put
#[#set math.equation(numbering: n => "(5.1)")
 $ A_L = d^(1 \/ 2) \( T_(upright("col"))^L - K b upright(bold(1)) \) d^(1 \/ 2) \, wide d_(\( v \, s \)) =
   e^s . $ <pin:surviving-operator>]

 Extend $m_u^(upright("surv")) = \( \( A_L \)_(+) \)_(u u)$ by zero on the deleted vertices. Then
#[#set math.equation(numbering: n => "(5.2)")
 $ 1 / L integral_(V times \[ 0 \, L \]) m_u^(upright("surv")) thin d tilde(mu) \( u \) < zeta . $ <pin:surviving-cost>]

]
] <prop:sparse-pinning>

#proof[
  We first construct a partial assignment with small mixed-polynomial cost.
    Polynomial moments depend on finite graph balls, so sufficiently sparse simultaneous pins have an additive
    first-order response except on an event of quadratic order in the update probability.
    Approximating the derivative of the positive-part function controls the error in that response independently
    of the number of roots. Parameters used to select the slab will be specified below.
    On a fixed slab $\[ 0 \, L \]$, write
  $ Phi = 1 / L integral_(V times \[ 0 \, L \]) m_u thin d tilde(mu) \( u \) . $
  Choose a common spectral support bound $\[ - B \, B \]$ for all the finite principal systems, pin alternatives,
    and deletion configurations on this slab, as in Lemma 13. For $tau > 0$, choose a real polynomial $P$ such that
  #[#set math.equation(numbering: n => "(5.3)")
   $ P \( - B \) = 0 \, wide integral_(- B)^B lr(|P' \( x \) - upright(bold(1))_(\( 0 \, oo \)) \( x \)|) thin d x
     lt.eq tau . $ <pin:polynomial-approximation>]
  For example, approximate the indicated step function first by a continuous function in
    $L^1 \( \[ - B \, B \] \)$, then uniformly by a polynomial, and integrate that polynomial from $- B$.
    It follows that
  $ sup_(\[ - B \, B \]) lr(|P \( x \) - x_(+)|) lt.eq tau . $
  Define
  $ m_(P \, u) = integral P \( x \) thin d gamma_u \( x \) \, wide Phi_P = 1 /
    L integral_(V times \[ 0 \, L \]) m_(P \, u) thin d tilde(mu) \( u \) . $
  Since $gamma_u$ is a probability measure and $tilde(mu) \( V times \[ 0 \, L \] \) = 1 - e^(- L) lt.eq 1$, we have
  #[#set math.equation(numbering: n => "(5.4)")
   $ lr(|Phi - Phi_P|) lt.eq tau wide \( L gt.eq 1 \) . $ <pin:cost-approximation>]
  ===== 5.1.1 The response to one buffered pin. <the-response-to-one-buffered-pin.>
  At an unassigned lifted vertex $u$, consider pinning to a specified color $i$,
    increasing its penalty from $b d_u$ to $K b d_u$ at the same time. The total polynomial response on its component is
  #[#set math.equation(numbering: n => "(5.5)")
   $ D_P \( u \) & = sum_y #scale(x: 120%, y: 120%)[\(] m_(P \, y)^(upright("pin") med u upright(med t o med) i) -
     m_(P \, y)^(upright("pre")) #scale(x: 120%, y: 120%)[\)]\
 & = integral_(- B)^B P' \( x \) #scale(x: 120%, y: 120%)[\(] xi_(h'_(u \, i)) \( x \) -
   xi_(h_u) \( x \) #scale(x: 120%, y: 120%)[\)] thin d x . $ <pin:single-response>]
  Here $h'_(u \, i)$ denotes the buffered alternative; the prime does not denote differentiation.
    To prove the identity on a finite principal set, use the fact that the sum of its local spectral probability
    measures is the counting measure of the roots. The pre-pin and post-pin polynomials have equal degree and the
    same principal polynomial with $u$ removed. Integrating the difference of their root counts above $x$ against
    $P' \( x \)$ gives exactly (5.5).
  Put $k = max { 1 \, deg P }$. By the locality in Lemma 13,
    only vertices at distance at most $k$ from $u$ contribute to the sum on the first line of (5.5).
    Compute in finite balls large enough to contain these vertices and their relevant neighborhoods.
    The local polynomial moments stabilize, while the functions $xi$ converge weak-\* on $\[ - B \, B \]$.
    This proves the identity on infinite components as well. Since both $xi$-functions take values in
    $\[ 0 \, 1 \]$ almost everywhere, (5.3) implies
  #[#set math.equation(numbering: n => "(5.6)")
   $ lr(|D_P \( u \) - \( ell'_(u \, i) - ell_u \)|) lt.eq tau . $ <pin:single-error>]
  ===== 5.1.2 One sparse update. <one-sparse-update.>
  For a current partial base assignment, choose the prospective colors $i \( v \)$ supplied by Lemma 15,
    with tolerance $tau_0 > 0$. The color $i \( v \)$ is the same at all heights over $v$.
    Properly color the distance-$2 k$ power of the base graph with finitely many auxiliary Borel color classes.
    The finite Borel coloring fact used in the proof of Lemma 14 applies because this power still has bounded
    degree. Independently for these auxiliary classes, select a Bernoulli-$alpha$ indicator,
    where $0 < alpha < 1$. Every currently unassigned base vertex in a selected class is pinned to its prospective
    color, with its penalty buffered, at all heights simultaneously.
  Within a radius-$k$ lifted ball, different vertices project to different base vertices,
    and their pairwise base distance is at most $2 k$. They consequently have different auxiliary classes.
    The indicators of all candidate pins affecting the local moment $m_(P \, y)$ are therefore independent.
    This assertion uses injectivity of projection within each lifted orbit;
    it does not require independent indicators at all vertices of the base.
  If at most one candidate in this local ball is selected, the change in $m_(P \, y)$ is exactly the sum of its
    selected single-pin responses. A ball has at most a fixed finite number $N$ of vertices,
    so the probability of two or more selections is at most $binom(N, 2) alpha^2$.
    On this event the discrepancy between the actual change and the sum of single-pin responses is bounded in
    absolute value by a constant depending only on $N$ and $sup_(\[ - B \, B \]) lr(|P|)$.
    Integrate this estimate and exchange roots and pin locations using (4.5). The result is
  #[#set math.equation(numbering: n => "(5.7)")
   $ bb(E) \[ Phi_P^(upright("new")) divides upright("pre") \] lt.eq Phi_P + alpha /
     L integral_(upright("unassigned")) D_P \( u \) thin d tilde(mu) \( u \) + C_P alpha^2 . $ <pin:sparse-update>]
  All the transports here are measurable, uniformly bounded on the fixed slab,
    and supported on bounded-radius pairs. Thus they are integrable and the signed version of mass transport is
    applicable. The constant $C_P$ may depend on the slab, graph and polynomial,
    but not on the current assignment, the prospective choices, or $alpha$.
  By Lemma 15, (5.6), and (5.4), (5.7) gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ bb(E) \[ Phi_P^(upright("new")) divides upright("pre") \] lt.eq \( 1 + C alpha \) Phi_P +
     alpha #scale(x: 120%, y: 120%)[\(] tau_0 + \( 1 + C \) tau +
     C_P alpha #scale(x: 120%, y: 120%)[\)] . $ <pin:recurrence>]
  The same $L$ from Lemma 15 works for all partial base assignments, so this step can be repeated.
  ===== 5.1.3 Iteration and choice of parameters. <iteration-and-choice-of-parameters.>
  Start with every vertex unassigned. The initial cost is $Phi = 0$ by Lemma 13.
    Use fresh independent class indicators at each step and recalculate the prospective colors from the current
    assignment. Given $S > 0$, perform $n = ceil.l S \/ alpha ceil.r$ steps.
    For these fixed parameters there are only finitely many possible histories.
    At every node one may choose separately the measurable prospective-color functions furnished by Lemma 15;
    no selection measurable in an infinite-dimensional space of assignments is needed.
  We have $n alpha lt.eq S + 1$ and $\( 1 + C alpha \)^n lt.eq e^(C \( S + 1 \))$.
    Iterating (5.8), using the initial bound $Phi_P lt.eq tau$, and then using (5.4) again yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ bb(E) Phi_(upright("final")) lt.eq tau + e^(C \( S + 1 \)) #scale(x: 120%, y: 120%)[\[]
     tau + \( S + 1 \) \( tau_0 + \( 1 + C \) tau + C_P alpha \) #scale(x: 120%, y: 120%)[\]] . $ <pin:iteration>]
  If $cal(U)$ is the final unassigned base set, each still-unassigned vertex has conditional probability $alpha$
    of being selected at the next step, regardless of its prospective color. Therefore
  #[#set math.equation(numbering: n => "(5.10)")
   $ bb(E) mu \( cal(U) \) = \( 1 - alpha \)^n lt.eq e^(- S) . $ <pin:unassigned-measure>]
  Here is an order of choices which makes both expectations small.
    First take $S$ so large that $e^(- S) < eta \/ 4$. Next take $tau_0 \,
    tau > 0$ so small that the terms in (5.9) not involving $C_P alpha$ have sum less than $zeta \/ 8$.
    Choose an integer $L gt.eq L_0$ using Lemma 15 for this $tau_0$.
    Now choose $B$ and $P$ as above, thereby fixing $C_P$. Finally take $alpha$ small enough that the remaining
    term in (5.9) is less than $zeta \/ 8$. Thus
  $ bb(E) Phi_(upright("final")) < zeta \/ 4 \, wide bb(E) mu \( cal(U) \) < eta \/ 4 . $
  Both random variables are nonnegative. By Markov’s inequality and a union bound, some history satisfies simultaneously
  #[#set math.equation(numbering: n => "(5.11)")
   $ Phi_(upright("final")) < zeta \, wide mu \( cal(U) \) < eta . $ <pin:chosen-history>]
  Fix such a history.
  ===== 5.1.4 Removing the unassigned vertices. <removing-the-unassigned-vertices.>
  We show that deleting $cal(U) times \[ 0 \, L \]$ cannot increase the integrated positive cost.
    Keep the initial and final deletion states fixed. For an arbitrary $theta.alt > 0$,
    choose another polynomial $Q$ with
  $ Q \( - B \) = 0 \, wide integral_(- B)^B lr(|Q' \( x \) - upright(bold(1))_(\( 0 \, oo \)) \( x \)|) thin d x
    lt.eq theta.alt . $
  At each intermediate deletion state, extend $m_(Q \, y)$ by zero at vertices that have already been deleted.
  For one deletion at $u$, the total pre-minus-post polynomial cost is
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_y #scale(x: 120%, y: 120%)[\(] m_(Q \, y)^(upright("pre")) -
     m_(Q \, y)^(upright("post")) #scale(x: 120%, y: 120%)[\)] =
     integral_(- B)^B Q' \( x \) xi_(h_u) \( x \) thin d x gt.eq - theta.alt . $ <pin:single-deletion>]
  For finite sets the identity again follows by integrating the difference of root counts;
    the boundary term caused by the loss of one root is $Q \( - B \) = 0$.
    The inequality uses $0 lt.eq xi_(h_u) lt.eq 1$. The finite-range locality argument used for (5.5) proves the
    identity in an infinite component.
  Partition the set to be deleted into finitely many Borel batches whose distinct vertices have distance greater
    than $2 max { 1 \, deg Q }$ within each batch in the enclosing lifted graph.
    For one batch, at most one deletion affects any local polynomial moment,
    so the batch change is exactly the sum of single-deletion responses in its pre-state.
    Mass transport, (5.12), and telescoping over the batches show that the integrated pre-minus-post polynomial
    cost, divided by $L$, is at least
  $ - theta.alt thin frac(tilde(mu) \( cal(U) times \[ 0 \, L \] \), L) . $
  The error is charged once to each deleted vertex; it is not multiplied by the number of batches.
    Intermediate deleted sets need not be constant in the height variable,
    since Lemma 13 allows arbitrary deletion configurations in the enclosing slab.
  At each endpoint the integrated error between the $Q$-cost and the positive cost is at most $theta.alt$.
    Thus the pre-minus-post positive cost is at least $- 3 theta.alt$.
    The endpoints are independent of $Q$ and of the batch decomposition,
    so letting $theta.alt arrow.b 0$ proves the desired monotonicity.
  All surviving vertices are now deterministically colored, with penalty $K b d_u$.
    Their finite mixed polynomial is the characteristic polynomial of the corresponding restriction of (5.1),
    so its local measure is the diagonal spectral probability measure of that operator.
    On an infinite component the same assertion follows from stabilization of polynomial moments and the common
    compact spectral support. Hence the surviving positive cost is exactly $m_u^(upright("surv"))$.
    Monotonicity and (5.11) give (5.2). ◻
]

=== 5.2 Descent from a slab to the base relation <descent-from-a-slab-to-the-base-relation>

The next estimate converts the integrated weighted cost into the desired spectral error on the base.
  A finite ball with a large eigenvalue forces a definite positive cost in its lift;
  mass transport then bounds the measure of such bad balls.
  For an integer $k gt.eq 1$, let $N_k$ be a uniform upper bound for the number of vertices in a radius-$k$ ball
  of the base graph.

#thm([Lemma 5.2.])[
  #emph[Fix $sigma \, beta > 0$, and choose a real polynomial $p$ of degree at most $k gt.eq 1$ such that
$ sup_(x in \[ - 1 \, 1 \]) lr(|p \( x \) - \( x - \( K b + sigma \) \)_(+)^2|) lt.eq beta . $

 Suppose a base partial assignment, with unassigned set $cal(U)$, and a slab length $L gt.eq max { 1 \,
   4 k log J }$ have surviving cost
$ Psi = 1 / L integral_(V times \[ 0 \, L \]) m_u^(upright("surv")) thin d tilde(mu) \( u \) \, $

 where $m^(upright("surv"))$ is defined from (5.1). Complete the base coloring by giving $cal(U)$ one additional
   color, and denote its paved matrix system by $T_(upright("pav"))$. Then
#[#set math.equation(numbering: n => "(5.13)")
 $ integral_V #scale(x: 120%, y: 120%)[\(] \( T_(upright("pav")) - \( K b + sigma \) upright(bold(1)) \)_(+)^2
   #scale(x: 120%, y: 120%)[\)]_(v v) thin d mu \( v \) lt.eq 2 beta + mu \( cal(U) \) +
   frac(2 J^k N_k, sigma) Psi . $ <pin:descent-bound>]

]
] <lem:descent>

#proof[
  Put $g \( x \) = \( x - \( K b + sigma \) \)_(+)^2$. Since the paved operator is a compression by mutually
    orthogonal color projections, it remains a self-adjoint contraction; in particular $0 lt.eq
    g \( T_(upright("pav")) \) lt.eq upright(bold(1))$.
  For an assigned base vertex $v$, let $B_k \( v \)$ be its radius-$k$ ball in the base graph,
    and let $T_v$ be the finite compression of the paved matrix to the assigned vertices of this ball.
    Polynomial diagonal moments through degree $k$ at $v$ are unchanged by this compression.
    Indeed every walk contributing to such a moment stays within $B_k \( v \)$,
    and edges from assigned to unassigned vertices are zero after paving. Consequently
  $ \( p \( T_(upright("pav")) \) \)_(v v) = \( p \( T_v \) \)_(v v) . $
  Let $cal(F)$ be the measurable set of assigned vertices for which $lambda_max \( T_v \) > K b + sigma$.
    Measurability follows by finite matrix evaluation on the Borel balls.
    If $v in.not cal(F)$ is assigned, then $g \( T_v \) = 0$ and the two polynomial approximation errors give
  $ \( g \( T_(upright("pav")) \) \)_(v v) lt.eq 2 beta . $
  On $cal(F) union cal(U)$ its diagonal is at most $1$. Therefore
  #[#set math.equation(numbering: n => "(5.14)")
   $ integral_V \( g \( T_(upright("pav")) \) \)_(v v) thin d mu \( v \) lt.eq 2 beta + mu \( cal(U) \) +
     mu \( cal(F) \) . $ <pin:failure-reduction>]
  It remains to bound $mu \( cal(F) \)$. Set $I_(upright("int")) = \[ k log J \, L - k log J \]$.
    For $u = \( v \, s \)$ with $s in I_(upright("int"))$, the entire ball $B_k \( v \)$ lifts into the slab:
    the height change along each graph edge has absolute value at most $log J$.
    Let $Q_u$ project onto the assigned vertices of this lifted ball.
    With $A_L$ as in (5.1), the order inequality $A_L lt.eq \( A_L \)_(+)$ gives,
    after compression and diagonal congruence,
  #[#set math.equation(numbering: n => "(5.15)")
   $ T_v - K b upright(bold(1)) lt.eq d_(upright("ball"))^(- 1 \/ 2) Q_u \( A_L \)_(+) Q_u
     d_(upright("ball"))^(- 1 \/ 2) . $ <pin:positive-upper-bound>]
  The base and lifted finite matrices here are identified up to the allowed diagonal unitary gauge,
    which does not affect the inequality or any diagonal spectral quantities. The right side is positive.
    If $v in cal(F)$, its norm is greater than $sigma$ by (5.15), and hence its trace is greater than $sigma$.
    Equivalently,
  #[#set math.equation(numbering: n => "(5.16)")
   $ sum_(y in B_k \( u \) med upright("assigned")) m_y^(upright("surv")) / d_y > sigma . $ <pin:failure-trace>]
  Here $B_k \( u \)$ denotes the lift of the base ball, which agrees with the radius-$k$ enclosing lifted ball at
    these interior heights. The comparison uses only $A_L lt.eq \( A_L \)_(+)$;
    it does not require positive part to commute with compression or diagonal congruence.
  Integrate (5.16) against $d mu \( v \) thin d s \/ L$ over $cal(F) times I_(upright("int"))$,
    and enlarge the resulting nonnegative sum to all interior roots.
    Since $d mu \( v \) thin d s = d_u thin d tilde(mu) \( u \)$,
    the resulting integrand is a sum of $\( d_u \/ d_y \) m_y^(upright("surv"))$.
    On a radius-$k$ ball, $d_u \/ d_y lt.eq J^k$. Exchanging roots and targets by (4.5),
    each target $y$ has at most $N_k$ possible roots. Deleted vertices may be retained as locations for the
    enclosing-ball relation, with $m_y^(upright("surv")) = 0$ there. Thus
  $ sigma lr(|I_(upright("int"))|) / L mu \( cal(F) \) lt.eq J^k N_k Psi . $
  Our lower bound on $L$ ensures $lr(|I_(upright("int"))|) \/ L gt.eq 1 \/ 2$, including the case $J = 1$.
    We conclude that
  $ mu \( cal(F) \) lt.eq frac(2 J^k N_k, sigma) Psi . $
  Combining this with (5.14) proves (5.13). ◻
]

#proof[
  #emph[Completion of the proof of Theorem 12.] Fix the prescribed $sigma \, rho > 0$.
    Choose $beta > 0$ with $2 beta < rho \/ 4$, and then choose the polynomial and its degree $k gt.eq
    1$ in Lemma 17. Thus $N_k$ is fixed before selecting the slab. Take
  $ eta = rho \/ 4 \, wide zeta = frac(rho sigma, 8 J^k N_k) \, wide L_0 = max { 1 \, 4 k log J } . $
  Proposition 16 supplies a partial assignment and a slab of length at least $L_0$ with $mu \( cal(U) \) <
    eta$ and $Psi < zeta$. Give $cal(U)$ the additional color and apply Lemma 17.
    Its right side is strictly less than $rho$, as required.
  Only the $r$ assigned colors and one extra color occur in the final partition.
    The auxiliary graph colors, the slab length, the approximation degrees and the number of updates affect its
    construction but not this number of final colors. In particular the graph and cocycle bounds do not enter the
    condition on $r$ in the theorem. ◻
]

== 6 Expected maximal abelian subalgebras <sec:expected>

We now combine the measured paving theorem with a separate argument for the part of an operator orthogonal to the
  normalizer algebra. Throughout this section, $M$ has separable predual, $phi$ is a faithful normal state,
  and $A subset M$ is a MASA contained in the centralizer $M_phi$.
  We write $E_A$ for the $phi$-preserving normal conditional expectation and use the sequence quotient of Lemma 5.
  Brackets denote classes in that quotient; a fixed operator also denotes its constant sequence.
  A partition in the quotient will always be represented by partitions in $A$ with one fixed finite number of members.

#thm([Theorem 6.1.])[
  #emph[For every $gamma > 0$ there is an integer $R_(upright("st")) \( gamma \)$ with the following property.
    For every self-adjoint $x in M$ with $∥x∥ lt.eq 1$, there are partitions $cal(P)_j$ of $1$ in $A$,
    each with $R_(upright("st")) \( gamma \)$ members, and self-adjoint $w_j in M$ such that
#[#set math.equation(numbering: n => "(6.1)")
 $ ∥w_j∥ lt.eq 2 \, wide ∥w_j∥_phi arrow.r 0 \, wide ∥C_(cal(P)_j) \( x - w_j \) - E_A \( x \)∥ lt.eq
   gamma . $ <exp:state-paving>]

 The integer $R_(upright("st")) \( gamma \)$ is independent of $M \, A \, phi$, and $x$.]
] <thm:state-paving>

=== 6.1 The normalizer algebra <the-normalizer-algebra>

Let $N$ be the von Neumann algebra generated by the groupoid normalizers of $A$ in $M$.
  These are the partial isometries $v$ with $v^(*) v \, v v^(*) in A$ such that conjugation by $v$ carries $A
  v^(*) v$ onto $A v v^(*)$. The algebra $N$ contains $A$. Since the modular group of $phi$ fixes $A$ pointwise,
  it carries every groupoid normalizer to another with the same supports and the same induced corner isomorphism.
  Hence $N$ is globally modular invariant. Takesaki’s theorem [21] gives a normal $phi$-preserving conditional
  expectation $E_N : M arrow.r N$; uniqueness of the state-preserving expectation onto $A$ gives

#[#set math.equation(numbering: n => "(6.2)")
 $ E_A E_N = E_A . $ <exp:expectation-composition>]

The inclusion $A subset N$ is Cartan. For completeness, groupoid regularity here implies regularity by unitary
  normalizers. Represent $A$ on a standard probability space.
  A normal isomorphism between two corners of $A$ is represented by a nonsingular measurable partial bijection.
  On its fixed-point set, the corresponding partial normalizer belongs to $A$.
  On the complement, a countable separating family of measurable sets partitions the domain into countably many
  pieces on each of which the domain and range are disjoint. If $v$ is the restriction to one such piece, then

$ v + v^(*) + 1 - v^(*) v - v v^(*) $

is a unitary normalizer. Multiplication by its source projection recovers $v$,
  and strong summation recovers the original partial normalizer.
  Also $A$ is a MASA in $N$ and $E_A \|_N$ is a faithful normal expectation, as required for the Cartan theorem.

The Feldman–Moore representation [6] identifies $A$ with $L^oo \( V \, mu \)$,
  where $mu$ is the probability measure given by $phi \|_A$,
  and identifies $N$ with the algebra of a countable nonsingular equivalence relation,
  allowing a scalar unitary cocycle. We use the representation on square-integrable columns,
  with the right base point integrated against $mu$ and counting measure in its orbit.
  An algebra element acts by left matrix multiplication on the orbit column.
  In the twisted case, changing the base point changes the matrix by diagonal unitary conjugacy,
  by the scalar cocycle identity. The conditional expectation onto $A$ is its rooted diagonal. This is $E_A \|_N$:
  if $F : N arrow.r A$ is any normal conditional expectation, bimodularity gives $F \( C_(cal(Q)) \( z \) \) =
  F \( z \)$. The bounded compression net converges ultraweakly to $E_A \( z \)$ by Lemma 4,
  so normality gives $F \( z \) = F \( E_A \( z \) \) = E_A \( z \)$.

Bounded graph partial-isometry kernels and diagonal coefficients generate $N$.
  Their algebraic span, including products, is strongly dense.
  A finite such expression has off-diagonal support in a finite union of partial-bijection graphs,
  and therefore in an undirected graph of uniformly bounded degree.
  Operator-norm bounds in the column representation give the same matrix bounds for almost every orbit.
  All models and cocycle identities below may be restricted to a common conull invariant set for the countably
  many operators involved.

Fix $x = x^(*)$ with $∥x∥ lt.eq 1$, and put

#[#set math.equation(numbering: n => "(6.3)")
 $ a_0 = E_A x \, wide Y = E_N x - a_0 \, wide Z = x - E_N x . $ <exp:decomposition>]

Then $x - a_0 = Y + Z$, with $∥Y∥ \, ∥Z∥ lt.eq 2$ and $E_N Z = 0$.
  The measured theorem will control $Y$ through its relation matrices.
  For $Z$, a unitary dilation with a diffuse left–right kernel will provide random diagonal compressions whose
  moments approach a free compression law. Its norm bound will make the spectral excess state-null,
  giving a second quotient norm estimate. Common refinement combines the two bounds;
  clipping the resulting block-diagonal residual then supplies the correction in Theorem 18.

#thm([Lemma 6.2.])[
  #emph[Let $b \, sigma > 0$ and let $r$ be an integer such that
$ 2 sqrt(2 \/ r) + 2 \/ r < b . $

 There are sequences of $A$-partitions with $\( r + 1 \)^2$ members whose quotient partition $cal(P)$ satisfies
#[#set math.equation(numbering: n => "(6.4)")
 $ ∥C_(cal(P)) \[ Y \]∥ lt.eq 6 \( K b + sigma \) \, $ <exp:normalizer-bound>]

 where $K$ is the universal constant in Theorem 12.]
] <exp:normalizer-paving>

#proof[
  Bounded Kaplansky approximation, followed by norm approximation inside the generating algebra,
    gives self-adjoint finite graph expressions converging strongly-star to $Y$, with norms at most $3$.
    Subtracting their $A$-expectations makes their diagonals zero and increases the norm bound to $6$;
    state-norm contractivity of $E_A$ preserves convergence. For each such expression,
    cut down by the base set on which every incident edge in its finite-degree enclosing graph has cocycle ratio
    between $J^(- 1)$ and $J$. These sets increase to full measure as $J arrow.r oo$,
    and the cuts converge strongly-star to the expression. A diagonal choice therefore gives self-adjoint $Y_j$ with
  $ E_A Y_j = 0 \, wide ∥Y_j∥ lt.eq 6 \, wide ∥Y_j - Y∥_phi^(\#) arrow.r 0 \, $
  whose orbit matrices have bounded-degree support and bounded cocycle ratios, with the bounds allowed to depend on $j$.
  Apply Theorem 12 to $Y_j \/ 6$ and separately to $- Y_j \/ 6$, using state-error tolerances tending to zero.
    The rooted diagonal formula for the state says that the positive part above $K b +
    sigma$ has $phi$-norm tending to zero in each case. These positive parts are self-adjoint and uniformly
    bounded, so they belong to the null ideal of Lemma 5. The sequence $Y_j - Y$ belongs to that ideal as well.
    The resulting two quotient partitions, each of size $r + 1$, therefore give respectively
  $ C_(cal(P)^(+)) \[ Y \/ 6 \] lt.eq \( K b + sigma \) 1 \, wide
    C_(cal(P)^(-)) \[ Y \/ 6 \] gt.eq - \( K b + sigma \) 1 . $
  Take their common refinement. All partition projections commute, and compression is positive and unital,
    so both scalar bounds hold after refinement. This proves the lemma.
    Further finite $A$-refinement preserves the bound. ◻
]

We have completed the normalizer part. The remaining component has the following target,
  whose proof is given after the kernel and free-moment lemmas below.

#thm([Proposition 6.3.])[
  #emph[For every $n gt.eq 2$, there are sequences of $n$-partitions in $A$ whose quotient partition $cal(P)$ satisfies
#[#set math.equation(numbering: n => "(6.5)")
 $ ∥C_(cal(P)) \[ Z \]∥ lt.eq 4 / sqrt(n) . $ <exp:off-normalizer-bound>]

]
] <prop:off-normalizer>

=== 6.2 The diffuse kernel outside the normalizer algebra <the-diffuse-kernel-outside-the-normalizer-algebra>

We retain the faithful normal state $phi$, with $A subset M_phi$,
  and the algebra $N$ generated by the groupoid normalizers of $A$.
  Use a standard probability model $A = L^oo \( V \, mu \)$ for $phi \|_A$.
  We use the standard-form realization $L^2 \( M \)$, equivalently Haagerup $L^2 \( M \)$,
  and write $phi^(1 \/ 2)$ for the positive vector implementing $phi$.
  In particular, $a phi^(1 \/ 2) = phi^(1 \/ 2) a$ for $a in A$.

For $X in M$, the commuting left and right actions of $A$ give a finite joint spectral measure $nu_X$ for $X
  phi^(1 \/ 2)$ on $V times V$. Our first coordinate is the right coordinate: for Borel sets $B \, C subset V$,

#[#set math.equation(numbering: n => "(6.6)")
 $ nu_X \( B times C \) = parallel 1_C X phi^(1 \/ 2) 1_B parallel_2^2 =
   integral_B E_A \( X^(*) 1_C X \) \( v \) thin d mu \( v \) . $ <exp:joint-measure>]

Both marginal measures are absolutely continuous with respect to $mu$.
  The right marginal has density $E_A \( X^(*) X \) lt.eq parallel X parallel^2$;
  the left marginal is absolutely continuous because $a mapsto phi \( X^(*) a X \)$ is normal on $A$.
  Disintegration on standard Borel spaces therefore gives a measurable kernel $k_X \( v \, d w \)$ such that

#[#set math.equation(numbering: n => "(6.7)")
 $ nu_X \( d v \, d w \) = d mu \( v \) k_X \( v \, d w \) \, wide E_A \( X^(*) a X \) \( v \) =
   integral_V a \( w \) thin k_X \( v \, d w \) \, wide k_X \( v \, V \) lt.eq parallel X parallel^2 $ <exp:kernel>]

almost everywhere, for $a in A$. As usual, individual function identities are understood modulo null sets.
  The joint spectral resolution can be constructed from a bounded real coordinate generating the standard model
  and the commuting left and right spectral resolutions of that coordinate.

#thm([Lemma 6.4.])[
  #emph[If $E_N \( X \) = 0$, then $k_X \( v \, dot.op \)$ has no atoms for almost every $v in V$.]
] <lem:atomless>

#proof[
  Choose Borel representatives for the kernel. The set
  $ cal(T) = { \( v \, w \) : k_X \( v \, { w } \) > 0 } $
  is Borel and has countable sections in the second coordinate.
    For example, joint measurability of the singleton mass follows by using shrinking neighborhoods in a
    compatible separable metric on the standard Borel space. The countable-section uniformization theorem
    expresses $cal(T)$ as a countable union of graphs of partial Borel maps.
    If the conclusion fails, one such map $F : S arrow.r V$ has a domain of positive $mu$-measure, with
  $ g \( v \) := k_X \( v \, { F \( v \) } \) > 0 quad \( v in S \) . $
  There is no assumption that $F$ is injective. For a $mu$-null Borel set $B subset V$,
    absolute continuity of the left marginal gives
  $ integral_(S ∩ F^(- 1) \( B \)) g \( v \) thin d mu \( v \) lt.eq nu_X \( V times B \) = 0 . $
  Thus $F$ pulls back null sets to null sets. With $e = 1_S in A$,
    composition with $F$ consequently defines a normal $*$-homomorphism
  $ theta : A arrow.r A e \, wide theta \( a \) \( v \) = a \( F \( v \) \) quad \( v in S \) \, wide
    theta \( 1 \) = e . $
  The graph will intertwine $A$ with the possibly proper subalgebra $theta \( A \)$ of $A e$;
    its polar partial isometry need not yet normalize $A$. We will use an expected type I intermediate algebra to
    split the right support into corners where these two abelian algebras coincide.
  Apply the joint spectral projection of the graph of $F$ to $X
    phi^(1 \/ 2)$ and call the resulting vector $zeta$. It is nonzero and satisfies
  #[#set math.equation(numbering: n => "(6.8)")
   $ zeta e = zeta \, wide a zeta = zeta theta \( a \) quad \( a in A \) . $ <exp:graph-intertwining>]
  Its right spectral density on $S$ is $g$. In particular, $e$ is its smallest right supporting projection among
    the projections of $A$: if $f in A$ is a projection and $zeta f = zeta$, then $e lt.eq f$.
  Take the $L^2$ polar decomposition $zeta = u h$, where $h = \| zeta \| in L^2 \( M \)_(+)$ and $u in
    M$ is a partial isometry. Put $p = u^(*) u lt.eq e$ and $q = u u^(*)$.
    We use here the usual polar decomposition and support properties of standard-form noncommutative $L^2$; see,
    for example, [7] Lemma 11.12 and Theorem 11.30. For a unitary $a in A$, the operator $b = theta \( a \) + 1 -
    e$ is unitary and (6.8) reads $a zeta = zeta b$. Taking absolute values gives $h = b^(*) h b$.
    Uniqueness of the polar decomposition then gives $a u = u b = u theta \( a \)$. Consequently,
  #[#set math.equation(numbering: n => "(6.9)")
   $ h theta \( a \) = theta \( a \) h \, wide p theta \( a \) = theta \( a \) p \, wide a u =
     u theta \( a \) quad \( a in A \) \, wide q in A . $ <exp:polar-intertwining>]
  The identities for all $a$ follow by linearity from unitaries.
    For the last assertion, the identities imply that $q$ commutes with $A$, and $A$ is maximal abelian.
  Consider the von Neumann algebra
  $ D = theta \( A \)' ∩ e M e . $
  It contains $p$ and $A e$, and $A e$ is a MASA in $D$. Moreover $theta \( A \) subset Z \( D \)$.
    If $d in p D p$, then $u d u^(*)$ commutes with $A q$, by (6.9), and hence belongs to $A q$. On the other hand,
  $ u theta \( a \) p u^(*) = a q quad \( a in A \) . $
  Conjugation by $u$ therefore identifies $p D p$ with $A q$, and
  #[#set math.equation(numbering: n => "(6.10)")
   $ p D p = theta \( A \) p . $ <exp:abelian-corner>]
  Let $c$ be the central support of $p$ in $D$. Since $Z \( D \) subset A e$, the identity $p c =
    p$ gives $zeta c = zeta$; the minimal right $A$-support property gives $c = e$.
    Thus $D$ has an abelian projection with full central support and is type I.
    Finally, if $d in Z \( D \)$, then (6.10) gives $d p = theta \( a \) p$ for some $a in A$.
    The central element $d - theta \( a \)$ annihilates a projection of full central support and is zero. We have proved
  #[#set math.equation(numbering: n => "(6.11)")
   $ Z \( D \) = theta \( A \) . $ <exp:center>]
  We next need a partition of $e$ by projections $e_j in A e$ such that
  #[#set math.equation(numbering: n => "(6.12)")
   $ \( A e \) e_j = theta \( A \) e_j . $ <exp:branch-partition>]
  The restriction of $E_A$ to $D$ is a normal conditional expectation onto $A e$.
    The type I MASA theorem of Akemann and Sherman [2] Theorem 4.1 supplies a partition of $e$ by projections in
    $A e$ that are abelian in $D$. There are only countably many nonzero members,
    because $D$ has the faithful normal state $phi \|_D \/ phi \( e \)$. For an abelian projection in a type I algebra,
  $ e_j D e_j = Z \( D \) e_j . $
  This follows, for instance, by writing the type I algebra as a direct integral:
    an abelian projection has fiber rank at most one. Together with (6.11) and $theta \( A \) subset A e subset
    D$, this proves (6.12).
  Set $eta_j = zeta e_j$ and take its polar decomposition $eta_j = u_j h_j$. Its right support is at most $e_j$.
    Repeating (6.9) shows that $h_j$ commutes with $theta \( A \)$ and that
  $ a u_j = u_j theta \( a \) quad \( a in A \) . $
  By (6.12) and the support condition, $h_j$ commutes with all of $A$.
    Therefore the right support $p_j = u_j^(*) u_j$ belongs to $A$; the left support $q_j =
    u_j u_j^(*)$ belongs to $A$ by the same polar argument as before. In addition,
  $ theta \( A \) p_j = A p_j \, wide u_j \( A p_j \) u_j^(*) = A q_j . $
  Thus each nonzero $u_j$ is a groupoid normalizer and belongs to $N$.
  Let $psi_j$ be the normal positive functional whose positive implementing vector is $h_j$.
    Since $h_j$ commutes with $A$, this functional centralizes $A$.
    In particular $psi_j compose C_(cal(Q)) = psi_j$ for every finite partition $cal(Q)$ in $A$.
    Lemma 4, normality, and boundedness of the compression net imply
  $ psi_j = psi_j compose E_A . $
  Write $f_j = d \( psi_j \|_A \) \/ d mu in L^1 \( V \, mu \)_(+)$ and $f_(j \, m) = min \( f_j \, m \)$.
    The positive vectors $f_(j \, m)^(1 \/ 2) phi^(1 \/ 2)$ belong to $A phi^(1 \/ 2)$ and converge in $L^2$;
    indeed their squared pairwise distances are
  $ integral_V \| f_(j \, m)^(1 \/ 2) - f_(j \, n)^(1 \/ 2) \|^2 thin d mu . $
  Their normal positive functionals are $x mapsto integral f_(j \, m) E_A \( x \) thin d
    mu$ and converge in norm to $psi_j$. The limit is therefore the unique positive implementing vector $h_j$.
    It follows that
  $ h_j in overline(A phi^(1 \/ 2)) \, wide eta_j in cal(H)_N := overline(N phi^(1 \/ 2)) . $
  The right projections $e_j$ are orthogonal and sum to $e$, so $zeta = sum_j zeta e_j in cal(H)_N$,
    with convergence in $L^2$.
  The closed space $cal(H)_N$ reduces both the left and right actions of $A$:
    for the right action, use $n phi^(1 \/ 2) a = n a phi^(1 \/ 2)$.
    It therefore reduces their joint spectral projections, including the graph projection defining $zeta$.
    But $E_N \( X \) = 0$ gives, for $n in N$,
  $ phi \( n^(*) X \) = phi \( n^(*) E_N \( X \) \) = 0 \, $
  so $X phi^(1 \/ 2) perp cal(H)_N$. Thus $zeta perp cal(H)_N$,
    contradicting $zeta eq.not 0$ and the membership just proved. ◻
]

===== 6.2.1 Removing atomic summands. <removing-atomic-summands.>

For the remaining treatment of $Z = x - E_N \( x \)$ we may assume that $A$ is diffuse.
  Here are the details of this reduction. If $f$ is an atom of $A$, then $A f = bb(C) f$ is a MASA in $f M f$,
  so $f M f = bb(C) f$. Thus $f$ is minimal in $M$. Let $z_f$ be its central support in $M$.
  The algebra $z_f M$ is type I, since $f$ is an abelian projection with full central support there.
  Compression by $f$ is faithful on its center and has scalar range, so $z_f M$ is a type I factor.

The algebra $A z_f$ is a MASA in this factor and has the normal expectation $E_A \|_(z_f M)$.
  Again by [2] Theorem 4.1, it has a partition of $z_f$ into rank-one projections.
  In particular it is purely atomic. Partial isometries joining any two of these rank-one projections normalize
  their $A$-corners. A compatible system of these matrix units generates $z_f M$, and hence

$ z_f M subset N . $

Distinct central supports of atoms are either equal or orthogonal, because each supports a factor summand.
  Their sum $z_(upright("at"))$ is a central projection, belongs to $A$,
  and satisfies $z_(upright("at")) M subset N$. Consequently

$ z_(upright("at")) Z = 0 . $

On the complementary central summand, $A \( 1 - z_(upright("at")) \)$ has no atoms.
  The algebra generated there by its groupoid normalizers is $N \( 1 - z_(upright("at")) \)$:
  corner normalizers extend by zero, and global normalizers restrict to this central summand.
  We may use the normalized restriction of $phi$ on the nonzero complementary summand.
  This changes state seminorms only by a fixed scalar factor.
  A partition obtained there extends to $M$ with the same number of cells by adding $z_(upright("at"))$ to one
  cell; all estimates for $Z$ are preserved because $Z$ vanishes on $z_(upright("at"))$.

=== 6.3 Random diagonal unitaries and free moments <random-diagonal-unitaries-and-free-moments>

It remains to compress the diffuse summand of $Z$. The next two lemmas supply the free law and its norm bound for
  the matrix dilation used to prove Proposition 20. The state in the probabilistic argument need not be tracial.

#thm([Lemma 6.5.])[
  #emph[Let $cal(M)$ have separable predual, let $phi.alt_0$ be a faithful normal state,
    and let $D subset cal(M)_(phi.alt_0)$ be a diffuse MASA. Suppose that $U in
    cal(M)$ is a self-adjoint unitary with $phi.alt_0 \( U \) = 0$, and that the normal positive map
$ cal(K) \( a \) = E_D \( U a U \) \, wide a in D \, $

 has an almost everywhere diffuse kernel on a standard probability model of $\( D \, phi.alt_0 \|_D \)$.
   For every integer $n gt.eq 2$ there are unitaries $w_l in D$, with $w_l^n = 1$,
   such that the joint star moments of $\( w_l \, U \)$ converge to those of free unitaries
   $\( w \, U_(upright(f)) \)$, where $w$ is uniform on the $n$th roots of unity and $U_(upright(f))$ is uniform
   on ${ - 1 \, 1 }$.]
] <lem:random-freeness>

#proof[
  Choose an increasing sequence of finite partitions $cal(Q)$ in $D$ which generates $D$,
    separates points of a conull standard model, and satisfies
  #[#set math.equation(numbering: n => "(6.13)")
   $ max_(q in cal(Q)) phi.alt_0 \( q \) arrow.r 0 . $ <exp:small-cells>]
  Such a sequence is obtained by adjoining a countable separating family and, at each stage,
    a sufficiently small-mass finite refinement; the latter exists by diffuseness.
    Give its cells independent labels $Z_q$ uniform on the $n$th roots of unity, and put $w_(cal(Q)) = sum_q Z_q q$.
  We first make the averaged reduced moments vanish by estimating return probabilities for diffuse kernels.
    We then control their fluctuations using the small masses of the partition cells,
    so that one deterministic labeling works for each prescribed finite list of moments.
  ===== 6.3.1 Averaged words and a repeated-cell compression. <averaged-words-and-a-repeated-cell-compression.>
  We first prove that the label expectation tends to zero for each scalar
  #[#set math.equation(numbering: n => "(6.14)")
   $ F_(cal(Q)) = phi.alt_0 \( x_0 w_(cal(Q))^(k_1) x_1 dots.h.c w_(cal(Q))^(k_h) x_h \) \, wide h gt.eq 1 \, quad
     1 lt.eq k_j < n \, $ <exp:reduced-test-word>]
  where $x_j = U$ for $1 lt.eq j < h$ and each endpoint $x_0 \, x_h$ is either $1$ or $U$.
    Expand over cell assignments $q_1 \, dots.h \, q_h$. An assignment survives label averaging only if,
    in every block of equal cells, the sum of its exponents is zero modulo $n$.
    Consequently every block of its exact equality pattern has size at least two.
    For any surviving exact pattern, inclusion-exclusion expresses its word sum as a finite linear combination of sums
  #[#set math.equation(numbering: n => "(6.15)")
   $ S_pi = sum_(q_1 \, dots.h \, q_h in cal(Q)\
q_i = q_j upright(" if ") i \, j upright(" are in one block of ") pi)
  phi.alt_0 \( x_0 q_1 x_1 dots.h.c q_h x_h \) \, $ <exp:partition-word-sum>]
  where every block of $pi$ has at least two members. There is no distinctness requirement between different
    blocks in (6.15). It is enough to show $S_pi arrow.r 0$ for each such $pi$.
  Choose positions $c < d$ in one block whose distance $d - c$ is minimal among all pairs in a common block.
    The positions strictly between them belong to distinct other blocks.
    We impose the equalities of $pi$ using auxiliary Haar phases.
    For a block other than the selected block, place independently sampled cellwise Haar diagonal unitaries at all
    but one of its occurrences, and their inverse product at the remaining occurrence.
    Haar averaging forces precisely the equality of the cells at those occurrences.
    In the selected block, use the same projection $q$ explicitly at $c$ and $d$ and sum over $q$;
    put independent Haar diagonals at every other occurrence of that block,
    with their inverse product additionally at $c$. All initial draws are independent.
    Expanding and averaging now gives exactly $S_pi$ as the auxiliary expectation of
  #[#set math.equation(numbering: n => "(6.16)")
   $ phi.alt_0 #scale(x: 120%, y: 120%)[\(] upright("PRE") thin C_(cal(Q)) \( Y_(cal(Q)) \) thin upright("POST")
     #scale(x: 120%, y: 120%)[\)] \, wide Y_(cal(Q)) = U d_(c + 1) U dots.h.c d_(d - 1) U . $ <exp:haar-compression>]
  When $d = c + 1$, the last expression is $U$. The extra inverse product at $c$ can be moved before its
    projection, since both lie in $D$, and is included in $upright("PRE")$.
    The factors outside the compression are products of fixed contractions $x_j$ and diagonal unitaries.
    Each interior $d_j$ is a cellwise Haar diagonal: this is also true if it is the inverse product placed at the
    last occurrence of its block. The interior diagonals are mutually independent because their positions belong
    to different blocks. Independence from $upright("PRE")$ and $upright("POST")$ is not asserted or needed.
  Their independence and orthogonality of the outside projections give
  #[#set math.equation(numbering: n => "(6.17)")
   $ bb(E) ∥C_(cal(Q)) \( Y_(cal(Q)) \)∥_(phi.alt_0)^2 = sum_(q \, q_(c + 1) \, dots.h \, q_(d - 1) in cal(Q)) ∥q
     U q_(c + 1) U dots.h.c q_(d - 1) U q∥_(phi.alt_0)^2 . $ <exp:haar-square-sum>]
  There are no middle cells when $d = c + 1$. Fix a coarser partition $cal(E)$ from the generating sequence.
    When $cal(Q)$ refines $cal(E)$, contractivity of $C_(cal(Q))$ in the state norm,
    applied with each middle cell tuple fixed, bounds the right side by
  #[#set math.equation(numbering: n => "(6.18)")
   $ sum_(p in cal(E)) sum_(q_(c + 1) \, dots.h \, q_(d - 1) in cal(Q)) ∥p U q_(c + 1) U dots.h.c q_(d - 1) U
     p∥_(phi.alt_0)^2 . $ <exp:coarse-square-sum>]
  ===== 6.3.2 Diffuse kernel return probabilities. <diffuse-kernel-return-probabilities.>
  Here is the limit of this expression without a tracial assumption. Put $m = d - c$. For each $p in cal(E)$ define
  $ B_(1 \, cal(Q)) \( p \) = U p U \, wide B_(j + 1 \, cal(Q)) \( p \) =
    U C_(cal(Q)) \( B_(j \, cal(Q)) \( p \) \) U . $
  Expanding the squares in (6.18) and summing the middle cells identifies that expression with $sum_(p in cal(E))
    phi.alt_0 \( p B_(m \, cal(Q)) \( p \) p \)$. All $B_(j \, cal(Q)) \( p \)$ are positive contractions.
    By Lemma 4, $C_(cal(Q)) \( t \) arrow.r E_D \( t \)$ strongly-star on each fixed bounded element.
    Its contractivity for both state seminorms also controls a bounded, varying, strong-star null error.
    Bounded strong-star continuity of multiplication by the fixed $U$ therefore proves recursively that
    $B_(j \, cal(Q)) \( p \)$ converges strongly-star to $B_j \( p \)$, where
  $ B_1 \( p \) = U p U \, wide B_(j + 1) \( p \) = U E_D \( B_j \( p \) \) U . $
  Thus $E_D \( B_j \( p \) \) = cal(K)^j \( p \)$. If $mu_0$ denotes the probability measure on $D$,
    state preservation and bimodularity of $E_D$ show that the limit of (6.18) is
  #[#set math.equation(numbering: n => "(6.19)")
   $ sum_(p in cal(E)) phi.alt_0 \( p cal(K)^m \( p \) p \) =
     sum_(p in cal(E)) integral_p \( cal(K)^m 1_p \) \( v \) thin d mu_0 \( v \) . $ <exp:kernel-return>]
  The positive normal map $cal(K)$ is unital. Its kernel is nonsingular in the integrated sense:
    a fixed $mu_0$-null set receives zero mass for almost every starting point.
    This follows from normality, since its indicator is zero in $D$.
    In particular the kernel avoids, for almost every starting point,
    the fixed exceptional null set on which its successor kernel is not diffuse.
    Integrating diffuse successor kernels consequently produces a diffuse kernel.
    Induction shows that each fixed iterate $cal(K)^m$ has an almost everywhere diffuse kernel.
    As $cal(E)$ increases along the separating sequence, the cell containing $v$ decreases to ${
    v }$ on the chosen conull model. Its return mass in (6.19) therefore tends to zero for almost every $v$.
    It is bounded by $cal(K)^m 1 \( v \) = 1$. Dominated convergence proves that (6.19) tends to zero.
    First fixing $cal(E)$ and letting $cal(Q)$ refine, and then letting $cal(E)$ refine, proves
  #[#set math.equation(numbering: n => "(6.20)")
   $ bb(E) ∥C_(cal(Q)) \( Y_(cal(Q)) \)∥_(phi.alt_0)^2 arrow.r 0 . $ <exp:haar-square-zero>]
  ===== 6.3.3 Nontracial state estimates. <nontracial-state-estimates.>
  We next explain the state estimates that turn this into scalar moment convergence.
    For an entire analytic element $a$ for the modular group, the standard-form right-action identity gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ ∥t a∥_(phi.alt_0) lt.eq ∥sigma_(i \/ 2)^(phi.alt_0) \( a \)∥ ∥t∥_(phi.alt_0) . $ <exp:analytic-right>]
  See [7] Lemma 8.12, Equation (8.4), applied to $a^(*)$. Entire analytic elements approximate each fixed element
    boundedly in the state norm, for example by Gaussian modular smoothing [7] Lemma 2.13.
    A centralizer unitary has right-multiplication bound $1$.
    In any scalar word consisting of fixed bounded factors and varying centralizer unitaries,
    replace the fixed factors from right to left by bounded analytic approximants.
    At a replacement step all factors to the right already have uniformly bounded right actions,
    and all factors to the left have uniformly bounded operator norms.
    The error in the scalar state value is therefore at most a fixed constant times the state-norm error of the
    factor being replaced. Choosing the approximants in that order makes the total error arbitrarily small,
    uniformly over the varying diagonals and partitions.
  Apply this procedure only to the fixed factors in $upright("POST")$ in (6.16).
    The compression and all remaining left factors are contractions.
    With the approximants fixed, the absolute scalar value is bounded by
    $C ∥C_(cal(Q)) \( Y_(cal(Q)) \)∥_(phi.alt_0)$, where $C$ is independent of every phase and of $cal(Q)$.
    Cauchy–Schwarz in the auxiliary probability space and (6.20) make its phase expectation tend to zero.
    The uniformly arbitrarily small replacement error proves $S_pi arrow.r 0$. Hence
  #[#set math.equation(numbering: n => "(6.22)")
   $ bb(E) F_(cal(Q)) arrow.r 0 . $ <exp:word-expectation-zero>]
  ===== 6.3.4 Concentration and deterministic labels. <concentration-and-deterministic-labels.>
  It remains to choose deterministic labels simultaneously for the moments.
    Replace all fixed factors in (6.14) analytically, again from right to left,
    and call the resulting scalar $G_(cal(Q))$. It approximates $F_(cal(Q))$ uniformly to any prescribed accuracy.
    Changing one label $Z_q$ changes a power of $w_(cal(Q))$ by a scalar of absolute value at most $2$ times $q$.
    Telescoping over the finitely many occurrences, each difference is thus a bounded scalar times
    $phi.alt_0 \( upright("PRE") thin q thin upright("POST") \)$. Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(6.23)")
   $ lr(|phi.alt_0 \( upright("PRE") thin q thin upright("POST") \)|) & lt.eq ∥q
     upright("PRE")^(*)∥_(phi.alt_0) ∥q upright("POST")∥_(phi.alt_0)\
 & lt.eq C_(upright("word")) phi.alt_0 \( q \) . $ <exp:two-sided-influence>]
  The second line follows from (6.21) for both products, including their analytic adjoints.
    Their modular norm bounds are uniform over all other labels,
    since the diagonal unitaries are in the centralizer. Independent bounded differences (or the martingale
    variance sum obtained by revealing one label at a time) now give
  $ bb(E) lr(|G_(cal(Q)) - bb(E) G_(cal(Q))|)^2 lt.eq C'_(upright("word")) sum_(q in cal(Q)) phi.alt_0 \( q \)^2
    arrow.r 0 $
  by (6.13). The uniform approximation shows that $F_(cal(Q)) - bb(E) F_(cal(Q)) arrow.r 0$ in probability.
    Together with (6.22), this gives $F_(cal(Q)) arrow.r 0$ in probability.
  There are only countably many test words. For successively larger finite lists,
    convergence in probability gives a partition far enough along the sequence and a deterministic labeling for
    which every word in the list is as small as prescribed. A diagonal choice gives $w_l$ with all those moments
    tending to zero. The tests include the nontrivial single powers of $w_l$,
    so its limiting distribution is uniform on the $n$th roots.
    Also $U^2 = 1$ and $phi.alt_0 \( U \) = 0$ give the symmetric two-point distribution.
    Centered elements of the two limiting generated algebras are linear combinations of the tested powers and of
    $U$, respectively; all alternating centered moments are precisely the tests above.
    This establishes the asserted joint free law. ◻
]

#thm([Lemma 6.6.])[
  #emph[Let $w$ and $U_(upright(f))$ have the free law in Lemma 22, in its reduced free-product representation.
    If $p_1 \, dots.h \, p_n$ are the spectral projections of $w$, then
#[#set math.equation(numbering: n => "(6.24)")
 $ ∥sum_(j = 1)^n p_j U_(upright(f)) p_j∥ lt.eq 2 / sqrt(n) . $ <exp:free-norm-bound>]

]
] <lem:free-compression>

#proof[
  Let $E_0$ be the Hilbert-space projection onto the vacuum and all reduced words not starting in the centered
    part of the $w$-algebra. For a spectral projection $p$ of $w$, put $t = 1 \/ n$.
    On this subspace, left multiplication by $p$ is the sum of the scalar action $t$ and creation by $p - t 1$.
    The two resulting subspaces are orthogonal, and $∥p - t 1∥_2^2 = t \( 1 - t \)$; hence
  $ ∥p E_0∥ = ∥E_0 p∥ = sqrt(t) . $
  Since $U_(upright(f))$ is centered, it sends a word starting in the $w$-centered space to a word starting in the
    other factor. Therefore $U_(upright(f)) \( 1 - E_0 \) = E_0 U_(upright(f)) \( 1 - E_0 \)$, and
  $ p U_(upright(f)) p = p U_(upright(f)) E_0 p + p E_0 U_(upright(f)) \( 1 - E_0 \) p . $
  Unitarity gives norm at most $2 sqrt(t)$. The sum of the compressions is block diagonal for the mutually
    orthogonal $p_j$, so its norm is the largest block norm. ◻
]

=== 6.4 A free-product matrix dilation <a-free-product-matrix-dilation>

#proof[
  By the atomic reduction following Lemma 21, it is enough to work on the central summand where $A$ is diffuse.
    Normalize the state on that summand and retain the same notation.
    Put $z = Z \/ 2$, so $z$ is a self-adjoint contraction and $E_N z = 0$.
  The ordinary two-by-two unitary dilation need not have a diffuse kernel over $A xor A$:
    already at $z = 0$, its identity off-diagonal entry gives an atomic cross-kernel.
    We replace the second diagonal algebra by a free diffuse abelian algebra,
    turning the cross terms into normal functionals on diffuse spaces.
    This is the symmetry form of the free-product projection dilation in [16] proof of Theorem 5.1:
    with $y = \( 1 + z \) \/ 2$, the symmetry below is twice that projection minus the identity.
    The kernel and moment lemmas above supply the required freeness in the present nontracial setting.
  Let $\( B_0 \, tau_B \)$ be a diffuse standard separable abelian probability algebra and form the reduced von
    Neumann free product
  $ \( P \, psi \) = \( M \, phi \) * \( B_0 \, tau_B \) . $
  The free-product state is faithful and normal, the two factor expectations preserve it,
    and its Hilbert-space representation is the reduced-word representation; see, for example, [8].
    Both $A$ and $B_0$ remain MASAs in $P$. We give the argument to make its nontracial applicability explicit.
    There are unitaries $v_k in A$ tending weakly to zero, since $A$ is diffuse.
    They centralize $psi$, by the expectation onto $M$. On $L^2 \( P \, psi \) ⊖ L^2 \( M \, phi \)$,
    a dense family consists of vectors of words
  $ x_0 b_1 x_1 dots.h.c b_h x_h \, wide h gt.eq 1 \, $
  where $b_i in B_0$ are centered, the internal $x_i in M$ are centered, and the endpoints are arbitrary.
    To compute a matrix coefficient of conjugation by $v_k$, take another such word with initial endpoint $y_0$,
    and split the middle product $y_0^(*) v_k x_0$ into its centered part and its scalar mean.
    The centered part gives a reduced word with zero expectation onto $M$.
    The scalar part is $phi \( y_0^(*) v_k x_0 \)$ times an expression with a fixed norm bound and tends to zero.
    The additional right factor $v_k^(*)$ in the conjugation does not change that norm bound.
    Conjugation is unitary on the state Hilbert space; density proves that it tends weakly to zero on the
    indicated complement. If an element of $P$ commutes with $A$,
    its vector after subtracting its $M$-expectation lies in this complement and is fixed by all these
    conjugations. It must be zero. The element belongs to $M$, and then to $A$.
    Interchanging the factors proves the assertion for $B_0$.
  In $tilde(M) = "Mat"_2 \( P \)$ use the state $tilde(phi) = "tr"_2 ⊗ psi$, with normalized matrix trace.
    The diagonal algebra $D = A xor B_0$ is a diffuse MASA in its centralizer. Define
  #[#set math.equation(numbering: n => "(6.25)")
   $ U = mat(delim: "(", z, s; s, - z) \, wide s = \( 1 - z^2 \)^(1 \/ 2) . $ <exp:unitary-dilation>]
  Since $z$ commutes with $s$, this is a self-adjoint unitary. Furthermore $E_D \( U \) = 0$.
    For $a in A$ and $b in B_0$, direct free-product expectation gives
  #[#set math.equation(numbering: n => "(6.26)")
   $ E_D #scale(x: 120%, y: 120%)[\(] U \( a xor b \) U #scale(x: 120%, y: 120%)[\)] =
     #scale(x: 120%, y: 120%)[\(] E_A \( z a z \) + tau_B \( b \) E_A \( s^2 \) #scale(x: 120%, y: 120%)[\)] xor
     #scale(x: 120%, y: 120%)[\(] phi \( s a s \) 1 + tau_B \( b \) phi \( z^2 \) 1 #scale(x: 120%, y: 120%)[\)] .
     $ <exp:dilation-kernel>]
  In particular, $E_(B_0) \( z b z \) = tau_B \( b \) phi \( z^2 \) 1$ because $phi \( z \) = 0$.
    Lemma 21 makes the first kernel $a mapsto E_A \( z a z \)$ diffuse.
    The other kernels in (6.26) are diffuse because the base algebras are diffuse and the displayed functionals
    are normal. Thus the kernel of $a mapsto E_D \( U a U \)$ is almost everywhere diffuse.
  Apply Lemma 22 with $phi.alt_0 = tilde(phi)$. Let $P_(j \, l) in D$, $1 lt.eq j lt.eq n$,
    be the spectral projections of the resulting finite-order $w_l$, padded with zero projections when necessary,
    and set
  $ S_l = sum_(j = 1)^n P_(j \, l) U P_(j \, l) . $
  Each projection is a polynomial in $w_l$ and $w_l^(*)$. Consequently the scalar moments of the self-adjoint
    contractions $S_l$ tend to the moments of $S_(upright(f)) =
    sum_j p_j U_(upright(f)) p_j$ in the reduced free law. Let $c = 2 \/ sqrt(n)$.
    Lemma 23 gives $∥S_(upright(f))∥ lt.eq c$. Uniform polynomial approximation on $\[ - 1 \, 1 \]$,
    applied to the continuous function $t mapsto \( lr(|t|) - c \)_(+)^2$, gives
  #[#set math.equation(numbering: n => "(6.27)")
   $ ∥\( lr(|S_l|) - c \)_(+)∥_(tilde(phi)) arrow.r 0 . $ <exp:excess-null>]
  This passage uses moments to obtain a state-norm estimate, not operator-norm convergence in $tilde(M)$.
  The sequence $\( S_l \)$ belongs to the multiplier algebra of Lemma 5:
    $U$ is fixed and each $\( P_(j \, l) \)_l$ is a bounded centralizer sequence.
    Its excess in (6.27) is self-adjoint, so it belongs to the strong-star null ideal.
    Continuous functional calculus in the quotient gives $∥\[ S_l \]∥ lt.eq c$.
  Compress by the fixed first matrix projection $e_11$. Write $P_(j \, l) = p_(j \, l) xor b_(j \, l)$,
    so the $\( p_(j \, l) \)_(j = 1)^n$ form a partition in $A$. The compressed sequence is
  $ e_11 S_l e_11 = sum_(j = 1)^n p_(j \, l) z p_(j \, l) $
  in the first corner. Its quotient norm upstairs is at most $c$.
    Functional calculus there makes its absolute-value excess above $c$ strong-star null.
    These compressed elements belong to $M$, and the state on their corner restricts to $phi \/ 2$;
    hence the same excess is strong-star null for $\( M \, phi \)$.
    The compressed sequence is also a multiplier sequence for $M$,
    since its partition projections centralize $phi$. Its original quotient norm is therefore at most $c$.
    Multiplying by $2$ proves (6.5) on the diffuse summand. Extending the same colors over the central summand
    where $Z = 0$ proves the full assertion. ◻
]

=== 6.5 Completion of the state-preserving paving argument <completion-of-the-state-preserving-paving-argument>

#proof[
  Choose
  $ b = sigma = frac(gamma, 24 \( K + 1 \)) \, $
  choose $r$ with $2 sqrt(2 \/ r) + 2 \/ r < b$, and choose $n gt.eq 2$ with $4 \/ sqrt(n) lt.eq gamma \/ 2$.
    Use Lemma 19 and Proposition 20, and take the common refinement of their partition sequences.
    It has $R_(upright("st")) \( gamma \) = \( r + 1 \)^2 n$ members after padding.
    Finite refinement preserves each quotient bound, so for
  $ T_j^0 = C_(cal(P)_j) \( x - E_A x \) $
  we have $∥\[ T_j^0 \]∥ lt.eq gamma$, since the two contributions are at most $gamma \/ 4$ and $gamma \/ 2$.
  Let $"clip"_gamma \( t \) = max \( - gamma \, min \( t \, gamma \) \)$ for real $t$, and define
  $ w_j = T_j^0 - "clip"_gamma \( T_j^0 \) . $
  The quotient norm bound and continuous functional calculus show that $\( w_j \)$ has zero quotient image.
    It is self-adjoint, hence $∥w_j∥_phi arrow.r 0$. Also $∥T_j^0∥ lt.eq 2$, so $∥w_j∥ lt.eq 2$.
    The operator $T_j^0$, and therefore $w_j$, is block diagonal for $cal(P)_j$.
    Since $E_A x$ belongs to $A$, this gives
  $ C_(cal(P)_j) \( x - w_j \) - E_A x = T_j^0 - w_j = "clip"_gamma \( T_j^0 \) \, $
  of norm at most $gamma$. These are all the assertions of (6.1). ◻
]

== 7 Passage to arbitrary von Neumann algebras <gen:section>

We first remove the separability assumption from the state-preserving result.
  We then treat the part of an inclusion on which no normal positive functional centralizes the MASA.
  The two arguments will be combined using corners by projections in the MASA;
  these projections need not be central in the ambient algebra.
  The support $e$ of the centralizing functionals will carry an expected MASA,
  while its complement $h$ has none of those functionals. Only after choosing the finite vector tests will we
  split $e = f + g$, with a faithful state on the $f$-corner and a residual projection $g$ that annihilates the
  test vectors.

=== 7.1 Separable reduction <separable-reduction>

#thm([Lemma 7.1.])[
  #emph[The conclusion of Theorem 18 holds without the assumption of separable predual,
    with the same partition-size bound.]
] <lem:separable-reduction>

#proof[
  Let $phi$ be a faithful normal state on $M$, let $A subset M$ be a MASA in its centralizer,
    and fix a self-adjoint contraction $x in M$. Construct countable sets of generators as follows.
    Start with $upright(bold(1)) \, x$. At each stage form the unital $bb(Q) \( i \)$-algebra generated by the
    current set and its adjoints. For every element $t$ of this countable algebra,
    add $E_A \( t \)$ and the projections of finite $A$-partitions $cal(Q)_(t \, k)$ satisfying
  $ ∥C_(cal(Q)_(t \, k)) \( t \) - E_A \( t \)∥_phi^(\#) < 1 \/ k \, wide k gt.eq 1 . $
  These partitions exist by Lemma 4. Repeat this procedure countably many times,
    let $B$ be the union of the resulting countable algebras, and set
  $ M_1 = W^(*) \( B \) \, wide A_1 = A ∩ M_1 . $
  Every element of $M_1$ is the limit of an operator-norm bounded sequence from $B$ in $∥dot.op∥_phi^(\#)$.
    Indeed, Kaplansky density gives bounded strong-star approximants from the norm closure of $B$,
    and one can then approximate in norm by elements of $B$. On bounded sets the state sharp seminorm determines
    the strong-star topology, so sequences suffice here. Taking real and imaginary parts separately gives this
    assertion for arbitrary elements. Since $E_A$ is contractive for the state sharp seminorm and in operator
    norm, it follows that $E_A \( M_1 \) subset A_1$.
  Suppose $z in M_1$ commutes with $A_1$. Choose bounded $t_j in B$ converging to $z$ in the state sharp seminorm,
    and choose one of the stored partitions $cal(Q)_j subset A_1$ for each $t_j$ so that its compression error is
    less than $1 \/ j$. Since $C_(cal(Q)_j) \( z \) = z$, contractivity gives
  $ ∥z - E_A \( z \)∥_phi^(\#) lt.eq 2 ∥z - t_j∥_phi^(\#) + ∥C_(cal(Q)_j) \( t_j \) -
    E_A \( t_j \)∥_phi^(\#) arrow.r 0 . $
  Thus $z = E_A \( z \) in A_1$, proving that $A_1$ is a MASA in $M_1$.
    It lies in the centralizer of $phi \|_(M_1)$. The GNS representation of this restricted faithful normal state
    is faithful and normal, and its Hilbert space is separable because the countable set $B$ applied to the cyclic
    vector is dense. Hence $M_1$ has separable predual. The restriction of $E_A$ is its state-preserving
    expectation onto $A_1$. Applying Theorem 18 in $M_1$ proves the assertion,
    including the unchanged bound on the partition size. ◻
]

=== 7.2 The corner without centralizing normal functionals <the-corner-without-centralizing-normal-functionals>

We use standard form in the next argument. Write $a xi b$ for the commuting left and right actions,
  with the right action of $b$ given by $J b^(*) J$. Every normal positive functional $theta$ has a unique
  representative $xi_theta$ in the natural positive cone. This cone is selfdual and is preserved by $xi mapsto u
  xi u^(*)$ for a unitary $u$. Moreover,

#[#set math.equation(numbering: n => "(7.1)")
 $ ∥xi_theta - xi_psi∥^2 lt.eq ∥theta - psi∥_(M_(*)) . $ <gen:powers-stormer>]

These standard-form facts hold for arbitrary von Neumann algebras; see [7] Theorem 3.12.
  The inequality also appears in [4] Theorem 4(8), Equation (5.10).
  For two functionals in a non-$sigma$-finite algebra, it can also be applied in the corner supported by
  $"supp" \( theta + psi \)$, where their sum is faithful.

#thm([Lemma 7.2.])[
  #emph[Let $D subset P$ be a MASA such that no nonzero normal positive functional on $P$ centralizes $D$.
    For every normal state $theta$ on $P$, every integer $m gt.eq 2$, and every $alpha > 0$,
    there are a positive contraction $s in P$ and an $m$-partition $\( p_i \)_(i = 1)^m$ in $D$ such that
#[#set math.equation(numbering: n => "(7.2)")
 $ theta \( s \) > 1 - alpha \, wide p_i s p_i lt.eq m^(- 1) p_i quad \( 1 lt.eq i lt.eq m \) . $ <gen:small-diagonal>]

]
] <lem:no-central-functional>

#proof[
  In standard form, each finite partition $cal(Q)$ in $D$ defines an orthogonal projection
  $ P_(cal(Q)) xi = sum_(q in cal(Q)) q xi q . $
  These projections decrease under refinement to the projection onto the $D$-central vectors.
    A nonzero central vector $zeta$ would give a nonzero $D$-central normal positive functional $a mapsto ⟨a
    zeta \, zeta⟩$: conjugation by a unitary of $D$ can be transferred to the commuting right action.
    The hypothesis therefore implies $P_(cal(Q)) arrow.r 0$ strongly along the net of finite partitions.
  Choose independent random labels $Z_q$, uniform on the $m$th roots of unity, and put $u =
    sum_(q in cal(Q)) Z_q q$. For $1 lt.eq k < m$, independence and $bb(E) Z_q^k = 0$ give
  $ bb(E) ⟨u^k xi_theta u^(- k) \, xi_theta⟩ = ⟨P_(cal(Q)) xi_theta \, xi_theta⟩ arrow.r 0 . $
  Each overlap is real and nonnegative, by the natural-cone properties.
    Consequently, for a sufficiently fine partition there is one choice of labels making all these overlaps
    arbitrarily small. The states
  $ theta_j = theta compose "Ad" \( u^(- j) \) \, wide 0 lt.eq j < m \, $
  have natural-cone vectors $xi_j = u^j xi_theta u^(- j)$. Their pairwise overlaps are among those just
    considered. Equation (7.1) shows that $∥theta_j - theta_k∥_(P_(*))$ is arbitrarily close to $2$ for every $j
    eq.not k$.
  Fix a small $eta > 0$. The positive support projection of $theta_j -
    theta_k$ attains half the norm of that Hermitian functional, since its value at $upright(bold(1))$ is zero.
    Thus the labels can be chosen so that there are projections $q_(j k) in P$ with
  #[#set math.equation(numbering: n => "(7.3)")
   $ theta_j \( q_(j k) \) gt.eq 1 - eta \, wide theta_k \( q_(j k) \) lt.eq
     eta wide \( j eq.not k \) . $ <gen:pair-separation>]
  For $0 < t < 1$ put
  $ a_j = frac(1, m - 1) sum_(k eq.not j) q_(j k) \, wide b_j = 1_(\[ 1 - t \, 1 \]) \( a_j \) . $
  Spectral calculus and Equation (7.3) yield
  #[#set math.equation(numbering: n => "(7.4)")
   $ theta_j \( b_j \) gt.eq 1 - eta / t \, wide theta_k \( b_j \)^(1 \/ 2) lt.eq sqrt(eta) +
     sqrt(\( m - 1 \) t) quad \( k eq.not j \) . $ <gen:spectral-separation>]
  For the first estimate, use $theta_j \( 1 - a_j \) lt.eq eta$ and $1 - b_j lt.eq t^(- 1) \( 1 - a_j \)$.
    For the second, the positive-summand inequality $1 - q_(j k) lt.eq \( m - 1 \) \( 1 - a_j \)$ gives
  $ ∥\( 1 - q_(j k) \) b_j∥^2 = ∥b_j \( 1 - q_(j k) \) b_j∥ lt.eq \( m - 1 \) t . $
  Splitting $b_j xi_k = b_j q_(j k) xi_k + b_j \( 1 - q_(j k) \) xi_k$ proves the claim,
    using the adjoint of this operator-norm estimate.
  The pairwise separating projections need not be mutually orthogonal,
    so they cannot simply be added to form a partition. Sequential products give positive effects with sum at most
    the identity while retaining almost full mass for their respective states. Define
  $ V_0 = upright(bold(1)) \, wide V_j = \( 1 - b_(j - 1) \) dots.h.c \( 1 - b_0 \) \, wide s_j =
    V_j^(*) b_j V_j quad \( 0 lt.eq j < m \) . $
  These positive elements need not be projections. They satisfy
  #[#set math.equation(numbering: n => "(7.5)")
   $ s_j = V_j^(*) V_j - V_(j + 1)^(*) V_(j + 1) \, wide sum_(j = 0)^(m - 1) s_j = upright(bold(1)) -
     V_m^(*) V_m lt.eq upright(bold(1)) . $ <gen:effects>]
  Telescoping the products of contractions also gives
  $ ∥V_j xi_j - xi_j∥ lt.eq sum_(k < j) ∥b_k xi_j∥ . $
  By Equation (7.4), whenever $eta < t$,
  $ ∥b_j V_j xi_j∥ gt.eq sqrt(1 - eta \/ t) - j #scale(x: 120%, y: 120%)[\(] sqrt(eta) +
    sqrt(\( m - 1 \) t) #scale(x: 120%, y: 120%)[\)] . $
  For fixed $m$, choosing $t$ small and then $eta$ sufficiently small makes every $theta_j \( s_j \) = ∥b_j V_j
    xi_j∥^2$ arbitrarily close to $1$.
  Set
  $ s = 1 / m sum_(j = 0)^(m - 1) u^(- j) s_j u^j . $
  Then $0 lt.eq s lt.eq upright(bold(1))$ and $theta \( s \)$ is the average of the $theta_j \( s_j \)$,
    so it exceeds $1 - alpha$ with the choices above. Since $u^m = upright(bold(1))$, Equation (7.5) gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ sum_(ell = 0)^(m - 1) u^ell s u^(- ell) = 1 / m sum_(k = 0)^(m - 1) u^k (sum_(j = 0)^(m - 1) s_j) u^(- k)
     lt.eq upright(bold(1)) . $ <gen:cyclic-average>]
  Let $p_1 \, dots.h \, p_m$ be the spectral projections of $u$ for the $m$th roots, allowing zero projections.
    Compressing Equation (7.6) by $p_i$ gives $m p_i s p_i lt.eq p_i$, as required. ◻
]

#thm([Corollary 7.3.])[
  #emph[Under the hypotheses of Lemma 25, let $P$ act normally on a Hilbert space and let $x =
    x^(*) in P$ satisfy $∥x∥ lt.eq 1$. For each $m gt.eq 2$, the operators $s x
    s$ supplied by that lemma approximate $x$ strongly, with associated $m$-partitions $cal(P)$ satisfying
$ ∥s x s∥ lt.eq 1 \, wide ∥C_(cal(P)) \( s x s \)∥ lt.eq 1 \/ m . $

 Here the approximation is on any prescribed finite set of vectors, to any positive accuracy, while $m$ stays fixed.]
] <gen:no-central-approximation>

#proof[
  For test vectors $xi_1 \, dots.h \, xi_d$, normalize the sum of their vector functionals and those of $x xi_1 \,
    dots.h \, x xi_d$ to obtain a normal state $theta$. If this sum vanishes,
    all tests are zero and one may take $s = 0$. Otherwise Lemma 25 makes
  $ theta \( \( 1 - s \)^2 \) lt.eq 1 - theta \( s \) $
  arbitrarily small. Thus $1 - s$ is arbitrarily small on every test vector and its image under $x$. The identity
  $ s x s - x = s x \( s - 1 \) + \( s - 1 \) x $
  proves the strong approximation. Finally, $- s^2 lt.eq s x s lt.eq s^2$ and $s^2 lt.eq s$ imply $-
    p_i \/ m lt.eq p_i s x s p_i lt.eq p_i \/ m$. The norm of the block diagonal sum is the maximum of its block
    norms. ◻
]

=== 7.3 Assembly of the three corners <assembly-of-the-three-corners>

#thm([Lemma 7.4.])[
  #emph[For any MASA $A subset M$, set
$ e = or.big { "supp" \( lambda \) : lambda in M_(*)^(+) \, med lambda upright(" centralizes ") A } \, wide h =
  upright(bold(1)) - e . $

 Then $e \, h in A$. If $e eq.not 0$, there is a faithful normal conditional expectation $E : e M e arrow.r A e$.
   If $h eq.not 0$, the inclusion $A h subset h M h$ has no nonzero centralizing normal positive functional.]
] <gen:support-decomposition>

#proof[
  The support of an $A$-central normal positive functional is invariant under every unitary in $A$,
    and hence belongs to $A$ by maximal abelianness. Such a functional is faithful on its support corner,
    and remains faithful and centralizing upon restriction to any nonzero $A$-subprojection of its support.
  Choose a maximal orthogonal family $\( q_beta \)$ of nonzero projections in $A$,
    each subordinate to the support of one such functional. Their sum is $e$:
    a nonzero remainder under $e$ would have nonzero intersection with one of the defining supports,
    contradicting maximality. On each $q_beta M q_beta$, normalize the restricted functional to a faithful normal
    state. The corner $A q_beta$ is a MASA in its centralizer.
    Takesaki’s conditional expectation theorem [21], in the state formulation [7] Theorem 6.6,
    gives a faithful normal expectation $E_beta : q_beta M q_beta arrow.r A q_beta$.
    Its hypotheses hold because the centralizer is fixed by the modular group and a state is finite on the subalgebra.
  Define
  #[#set math.equation(numbering: n => "(7.7)")
   $ E \( z \) = sum_beta E_beta \( q_beta z q_beta \) \, wide z in e M e . $ <gen:glued-expectation>]
  The orthogonal block sum is well defined, bounded in norm by $∥z∥$, and belongs to $A e$.
    It is positive, unital, $A e$-bimodular, and fixes $A e$.
    For a bounded increasing net of positive elements, normality of every $E_beta$ identifies the supremum of
    every $q_beta$-block; this proves normality of $E$, even for an uncountable family.
    If $z gt.eq 0$ and $E \( z \) = 0$, faithfulness on each corner gives $q_beta z q_beta = 0$,
    hence $z^(1 \/ 2) q_beta = 0$ for all $beta$. Since $sum_beta q_beta = e$, this forces $z = 0$.
    Thus $E$ is faithful.
  An $A h$-central normal positive functional on $h M h$ would extend by $z mapsto h z
    h$ to an $A$-central one on $M$ supported under $h$. The definition of $e$ excludes a nonzero such functional.
    All corner MASAs used here remain maximal abelian: an element in a corner commuting with the corner of $A$,
    extended by zero, commutes with $A$. ◻
]

#proof[
  If $x = 0$, take $y = a = 0$ and the one-part partition, padded with zero projections to the size chosen below.
    Otherwise, by scaling it suffices to prove the assertion for $∥x∥ = 1$,
    with an arbitrary strong-approximation tolerance $delta > 0$.
    Fix $0 < epsilon < 1$ and put $gamma = epsilon \/ 4$. Let $r_f$ be the partition-size bound
    $R_(upright("st")) \( gamma \)$ in Theorem 18, and fix $m gt.eq 2$ with $1 \/ m lt.eq gamma$. We shall use
  #[#set math.equation(numbering: n => "(7.8)")
   $ R \( epsilon \) = r_f + m + 1 . $ <gen:final-size>]
  More explicitly, the choices in the state-paving proof may be taken as
  $ b = sigma = frac(epsilon, 96 \( K + 1 \)) \, wide r = ⌈32 / b^2⌉ \, wide n = ⌈1024 / epsilon^2⌉ \, wide
    m = ⌈4 / epsilon⌉ . $
  Here $2 sqrt(2 \/ r) + 2 \/ r lt.eq b \/ 2 + b^2 \/ 16 < b$, $4 \/ sqrt(n) lt.eq gamma \/ 2$, and $1 \/ m lt.eq
    gamma$. Consequently $r_f = \( r + 1 \)^2 n$ and
  #[#set math.equation(numbering: n => "(7.9)")
   $ R \( epsilon \) = \( r + 1 \)^2 n + m + 1 lt.eq C_(upright("ap")) epsilon^(- 6) wide \( 0 < epsilon < 1 \)
     $ <gen:sixth-power>]
  for a universal constant $C_(upright("ap"))$. Only the universal buffer $K$ enters this constant; graph, slab,
    and approximation parameters do not enter the color count.
    These choices precede the finite test set and its tolerance.
  Let $e \, h$ and $E$ be as in Lemma 27. Given a finite set $F$ of test vectors,
    choose a unit vector $xi_0$ such that $∥x xi_0∥ > 3 \/ 4$, and put $F' = F union { xi_0 }$.
    On $A e$ consider the normal positive functional
  $ psi \( a \) = sum_(xi in F') ⟨a e xi \, e xi⟩ \, wide a in A e \, $
  and let $f = "supp" \( psi \) in A e$ and $g = e - f$. The equality $psi \( g \) = 0$ implies $g xi =
    0$ for every $xi in F'$. Empty corners below are interpreted as zero.
  If $f eq.not 0$, then $psi \|_(A f)$ is faithful. After normalizing it, compose it with the restriction $E :
    f M f arrow.r A f$ to obtain a faithful normal state $phi_f$ on $f M f$.
    Bimodularity of $E$ and commutativity of $A f$ show that $A f$ is in the $phi_f$-centralizer.
    Apply Theorem 18 and Lemma 24 to the self-adjoint contraction $x_f = f x f$. They give
  $ y_f = x_f - w \, wide w = w^(*) \, quad ∥w∥ lt.eq 2 \, wide ∥C_(cal(P)_f) \( y_f \) - d_f∥ lt.eq gamma \, quad
    d_f = E \( x_f \) \, $
  where $cal(P)_f$ is an $r_f$-partition of $f$, and $w$ can be chosen arbitrarily small on the vectors $f
    xi$ for $xi in F'$. Indeed, the bounded self-adjoint corrections in that theorem have state norm tending to
    zero, hence converge strongly in the given normal representation.
  On $g$ put $y_g = 0$. On $h$ put $x_h = h x h$ and use Corollary 26 to choose $y_h =
    s x_h s$ arbitrarily close to $x_h$ on the vectors $h xi$, $xi in F'$,
    together with an $m$-partition $cal(P)_h$ of $h$ such that
  $ ∥y_h∥ lt.eq 1 \, wide ∥C_(cal(P)_h) \( y_h \)∥ lt.eq gamma . $
  Keep all off-diagonal blocks of $x$ between $f \, g \, h$,
    and replace its diagonal blocks by the operators just constructed. Explicitly, set
  $ y = y_f + y_g + y_h + sum_(b \, c in { f \, g \, h }\
b eq.not c) b x c . $
  This operator is self-adjoint. The difference $y - x$ is block diagonal:
    its $f$-block has norm at most $2$, its $g$-block has norm at most $1$,
    and its $h$-block has norm at most $2$. Hence
  #[#set math.equation(numbering: n => "(7.10)")
   $ ∥y - x∥ lt.eq 2 \, wide ∥y∥ lt.eq 3 . $ <gen:norm-control>]
  The $g$-block of the difference annihilates $F'$. Choosing the other two approximation errors sufficiently small
    therefore ensures
  #[#set math.equation(numbering: n => "(7.11)")
   $ ∥\( y - x \) xi∥ < min { delta \, 1 \/ 4 } wide \( xi in F' \) . $ <gen:test-control>]
  In particular $∥y∥ > 1 \/ 2$, by applying this inequality to $xi_0$.
  Use the projections of $cal(P)_f$, the projections of $cal(P)_h$,
    and the single projection $g$ as distinct members of one $A$-partition $cal(P)$,
    padding with zeros in absent corners. It has the size in Equation (7.8) and kills every off-diagonal block
    between $f \, g \, h$. With $d = d_f$ on $f$ and zero on $g + h$, we obtain
  $ d = d^(*) in A \, wide ∥C_(cal(P)) \( y \) - d∥ lt.eq gamma . $
  Since compression is norm-contractive, $∥d∥ lt.eq ∥y∥ + gamma$.
    Clip $d$ by functional calculus to the interval $\[ - ∥y∥ \, ∥y∥ \]$,
    obtaining $a in A$ with $∥a∥ lt.eq ∥y∥$ and $∥a - d∥ lt.eq gamma$. It follows that
  $ ∥C_(cal(P)) \( y \) - a∥ lt.eq 2 gamma = epsilon \/ 2 lt.eq epsilon ∥y∥ . $
  Equations (7.10) and (7.11) give the remaining requirements.
    The partition size depends only on $epsilon$, since the bound in Theorem 18 is uniform over the
    state-preserving inclusions used here. Finally, scaling $y$ and $a$ by the original $∥x∥$,
    and first dividing the requested strong tolerance by that norm,
    proves the theorem with the universal constant $kappa = 3$. ◻
]

=== 7.4 Consequences for related paving formulations <gen:consequences>

The main theorem concerns norm paving of bounded approximants.
  The two introductory consequences use the normal-expectation hypothesis to pass between that formulation and
  strong-operator paving of the original operator. The quadratic consequence additionally uses the separate
  companion theorem.

#proof[
  By Theorem 1, every such $x$ is $\( epsilon \/ 12 \, R \( epsilon \/ 12 \) \; 3 \)$-approximately pavable in the
    terminology of [16] Definition 2.3. Apply [16] Proposition 2.4(1) with $epsilon' = epsilon \/ 6$.
    Its error is $2 dot.op 3 dot.op \( epsilon \/ 6 \) = epsilon$, so $R_s \( epsilon \) =
    R \( epsilon \/ 12 \)$ suffices. ◻
]

#proof[
  By [13] Theorem 1.1, every self-adjoint $x in M$ is $\( epsilon \/ 2 \, r_(epsilon \/ 2) \)$ so-pavable,
    where $r_(epsilon \/ 2) lt.eq C epsilon^(- 2)$ for a universal $C$.
    Since $epsilon \/ 2 < epsilon$, [16] Proposition 2.4(2) makes $x$
    $\( epsilon \, r_(epsilon \/ 2) \; 3 \)$-approximately pavable.
    Its proof supplies self-adjoint approximants and diagonal witnesses,
    with paving error relative to the approximant’s norm. The strong-limit net in [16] Definition 2.3 supplies the
    finite-vector conclusion with the fixed count $N \( epsilon \) = r_(epsilon \/ 2)$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M. Aizenman and S. Warzel, #emph[On the ubiquity of the Cauchy distribution in spectral problems],
  Probab. Theory Related Fields #strong[163] (2015), 61--87.
  #link("https://doi.org/10.1007/s00440-014-0587-3")[doi:10.1007/s00440-014-0587-3]\;
  #link("https://arxiv.org/abs/1312.7769v2")[arXiv:1312.7769v2] (cited proposition numbering).]
#bibitem([2])[C.~A. Akemann and D. Sherman, #emph[Conditional expectations onto maximal abelian $*$-subalgebras],
  J. Operator Theory #strong[68] (2012), no.~2, 597--607.
  #link("https://jot.theta.ro/jot/archive/2012-068-002/2012-068-002-013.pdf")[Journal PDF].]
#bibitem([3])[J. Anderson, #emph[Extensions, restrictions, and representations of states on $C^(*)$-algebras],
  Trans. Amer. Math. Soc. #strong[249] (1979), no.~2, 303--329.
  #link("https://doi.org/10.2307/1998793")[doi:10.2307/1998793].]
#bibitem([4])[H. Araki, #emph[Some properties of modular conjugation operator of von Neumann algebras and a
  non-commutative Radon--Nikodym theorem with a chain rule], Pacific J. Math. #strong[50] (1974), no.~2, 309--354.
  #link("https://msp.org/pjm/1974/50-2/pjm-v50-n2-p02-p.pdf")[Journal PDF].]
#bibitem([5])[G. Boole, #emph[On the comparison of transcendents,
  with certain applications to the theory of definite integrals],
  Philosophical Transactions of the Royal Society of London #strong[147] (1857), 745--803.
  #link("https://doi.org/10.1098/rstl.1857.0037")[doi:10.1098/rstl.1857.0037].]
#bibitem([6])[J. Feldman and C.~C. Moore, #emph[Ergodic equivalence relations, cohomology,
  and von Neumann algebras. II], Trans. Amer. Math. Soc. #strong[234] (1977), no.~2, 325--359.
  #link("https://doi.org/10.1090/S0002-9947-1977-0578730-2")[doi:10.1090/S0002-9947-1977-0578730-2].]
#bibitem([7])[F. Hiai, #emph[Concise lectures on selected topics of von Neumann algebras], 2020,
  #link("https://arxiv.org/abs/2004.02383v1")[arXiv:2004.02383v1].]
#bibitem([8])[C. Houdayer and Y. Ueda, #emph[Asymptotic structure of free product von Neumann algebras], Math.
  Proc. Cambridge Philos. Soc. #strong[161] (2016), no.~3, 489--516.
  #link("https://doi.org/10.1017/S0305004116000396")[doi:10.1017/S0305004116000396]\;
  #link("https://arxiv.org/abs/1503.02460v3")[arXiv:1503.02460v3].]
#bibitem([9])[R.~V. Kadison and I.~M. Singer, #emph[Extensions of pure states], Amer. J. Math.
  #strong[81] (1959), no.~2, 383--400. #link("https://doi.org/10.2307/2372748")[doi:10.2307/2372748].]
#bibitem([10])[A.~S. Kechris, S. Solecki and S. Todorcevic, #emph[Borel chromatic numbers], Adv. Math.
  #strong[141] (1999), no.~1, 1--44. #link("https://doi.org/10.1006/aima.1998.1771")[doi:10.1006/aima.1998.1771].]
#bibitem([11])[D. Maharam, #emph[Incompressible transformations], Fund. Math. #strong[56] (1964), no.~1, 35--50.
  #link("https://doi.org/10.4064/fm-56-1-35-50")[doi:10.4064/fm-56-1-35-50].]
#bibitem([12])[A.~W. Marcus, D.~A. Spielman and N. Srivastava, #emph[Interlacing families II:
  Mixed characteristic polynomials and the Kadison--Singer problem], Ann. of Math.
  (2) #strong[182] (2015), no.~1, 327--350.
  #link("https://doi.org/10.4007/annals.2015.182.1.8")[doi:10.4007/annals.2015.182.1.8]\;
  #link("https://arxiv.org/abs/1306.3969v4")[arXiv:1306.3969v4].]
#bibitem([13])[OpenAI, #emph[Quadratic Strong-Operator Paving over Arbitrary Maximal Abelian Subalgebras],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Quadratic-Strong-Operator-Paving-over-Arbitrary-Maximal-Abelian-Subalgebras-September-25-2026/Quadratic-Strong-Operator-Paving-over-Arbitrary-Maximal-Abelian-Subalgebras-September-25-2026.pdf")[OAI:Quadratic-Strong-Operator-Paving-over-Arbitrary-Maximal-Abelian-Subalgebras-September-25-2026],
  2026.]
#bibitem([14])[A. Poltoratski, B. Simon and M. Zinchenko, #emph[The Hilbert transform of a measure], 2009,
  #link("https://arxiv.org/abs/0811.0791v2")[arXiv:0811.0791v2].]
#bibitem([15])[S. Popa, #emph[A $upright(I I)_1$ factor approach to the Kadison--Singer problem], Comm. Math.
  Phys. #strong[332] (2014), 379--414.
  #link("https://doi.org/10.1007/s00220-014-2055-4")[doi:10.1007/s00220-014-2055-4]\;
  #link("https://arxiv.org/abs/1303.1424v3")[arXiv:1303.1424v3].]
#bibitem([16])[S. Popa and S. Vaes, #emph[Paving over arbitrary MASAs in von Neumann algebras], Anal.
  PDE #strong[8] (2015), no.~4, 1001--1023.
  #link("https://doi.org/10.2140/apde.2015.8.1001")[doi:10.2140/apde.2015.8.1001]\;
  #link("https://arxiv.org/abs/1412.0631v3")[arXiv:1412.0631v3].]
#bibitem([17])[S. Popa and S. Vaes, #emph[On the optimal paving over MASAs in von Neumann algebras], Contemp.
  Math. #strong[671] (2016), 199--208.
  #link("https://doi.org/10.1090/conm/671/13511")[doi:10.1090/conm/671/13511]\;
  #link("https://arxiv.org/abs/1507.01072v1")[arXiv:1507.01072v1].]
#bibitem([18])[M. Ravichandran and J. Leake, #emph[Mixed determinants and the Kadison--Singer problem], Math. Ann.
  #strong[377] (2020), 511--541.
  #link("https://doi.org/10.1007/s00208-020-01986-7")[doi:10.1007/s00208-020-01986-7]\;
  #link("https://arxiv.org/abs/1609.04195v2")[arXiv:1609.04195v2] (cited theorem numbering).]
#bibitem([19])[M. Ravichandran and N. Srivastava, #emph[Asymptotically optimal multi-paving], Int. Math. Res. Not.
  IMRN #strong[2021], no.~14, 10908--10940.
  #link("https://doi.org/10.1093/imrn/rnz111")[doi:10.1093/imrn/rnz111]\;
  #link("https://arxiv.org/abs/1706.03737v2")[arXiv:1706.03737v2] (cited theorem numbering).]
#bibitem([20])[P. Roy and G. Samorodnitsky, #emph[Maharam extension for nonsingular group actions], 2006,
  #link("https://arxiv.org/abs/math/0611891v1")[arXiv:math/0611891v1].]
#bibitem([21])[M. Takesaki, #emph[Conditional expectations in von Neumann algebras], J. Funct. Anal.
  #strong[9] (1972), no.~3, 306--321.
  #link("https://doi.org/10.1016/0022-1236(72)90004-3")[doi:10.1016/0022-1236(72)90004-3].]
