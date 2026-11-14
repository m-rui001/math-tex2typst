#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A classification of finite Euclidean Ramsey configurations]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 The classification problem <the-classification-problem>

A finite nonempty set $A$ in a Euclidean space is #emph[Ramsey] if, for every integer $r gt.eq 2$,
  there is an integer $D gt.eq 1$ such that every map $c : bb(R)^D arrow.r { 1 \, dots.h \,
  r }$ is constant on a congruent copy of $A$. Congruence means preservation of every pairwise distance,
  at the original scale. The coloring is an arbitrary function.
  In particular, no measurability or other regularity is assumed.

Erdős, Graham, Montgomery, Rothschild, Spencer and Straus introduced Euclidean Ramsey theory and proved that every
  finite Ramsey set is spherical #cite(label("egm-rss")) Theorem 13.
  Graham later conjectured that sphericity is also sufficient #cite(label("graham-survey")).
  Major positive results established the Ramsey property for nondegenerate triangles and then all nondegenerate
  simplices, by Frankl and Rödl #cite(label("frankl-rodl-triangles")) #cite(label("frankl-rodl-simplices"));
  finite sets with a soluble transitive isometry group and cyclic trapezoids,
  by Kříž #cite(label("kriz-permutation")) #cite(label("kriz-trapezoids")); and vertex sets of regular polytopes,
  by Cantwell #cite(label("cantwell-polytopes")).

Leader, Russell and Walters proposed a different characterization:
  a finite set is Ramsey exactly when it embeds in a finite transitive Euclidean
  set #cite(label("lrw-transitive")) Conjecture A. Transitivity means that the isometries of the finite set act
  transitively on its points. An isometric subset of such a set is called #emph[subtransitive].
  Their group-theoretic and Hales–Jewett formulations led to the Block Sets Conjecture;
  subsequent work studies the possible block sizes #cite(label("ilw-blocks")).
  The link with soluble symmetry has also expanded: Karamanlis embedded every simplex in a finite product of
  regular polygons #cite(label("karamanlis-tori")), and Behague constructed soluble transitive extensions for many
  known Ramsey classes and further permutation configurations #cite(label("behague-subsoluble")).
  Ivan, Leader and Walters developed generalized-prism constructions,
  with Ramsey conclusions under a soluble symmetry hypothesis #cite(label("ilw-prisms")).
  Moore and, independently, Mirabi proved that adjoining a point outside the affine span of a Ramsey set preserves
  the Ramsey property #cite(label("moore-pyramid")) #cite(label("mirabi-extensions")).
  The affine-span restriction leaves the case of arbitrary coplanar circle points beyond this extension theorem.

Pálvölgyi has recently given a seven-point circle configuration that is not Ramsey,
  disproving the spherical conjecture #cite(label("palvolgyi-heptagon")) Theorem 1.
  The appendix to that version also states that generic seven-point circle configurations are not Ramsey.
  Its author’s note announces a proof that all finite transitive sets are Ramsey and says that its exposition is
  still being prepared.#footnote[Pálvölgyi attributes the writing, proofs,
  and ideas in that manuscript to ChatGPT. He labels the additional appendix claims as unchecked by him.] Our main
  theorem gives a necessary and sufficient algebraic condition for an arbitrary finite Euclidean configuration.

=== 1.1 The exact tensor criterion <the-exact-tensor-criterion>

The problem is to characterize these finite sets up to congruence. A singleton is Ramsey.
  For any other set, let $d gt.eq 1$ be its affine dimension, and choose a congruent representative $A = { a_1 \,
  dots.h \, a_s } subset bb(R)^d$ whose affine span is $bb(R)^d$. The points are distinct and $s gt.eq 2$. Define

$ p_i = vec(1, a_i) \, wide F = bb(Q) #scale(x: 120%, y: 120%)[\(] \( a_i \)_alpha : 1 lt.eq i lt.eq s \, med
  1 lt.eq alpha lt.eq d #scale(x: 120%, y: 120%)[\)] \, wide B = F ⊗_(bb(Q)) F . $

The commutative ring $B$ has a multiplication homomorphism

$ m_F : B arrow.r F \, wide m_F \( x ⊗ y \) = x y . $

An equality in $B$ is stronger than the equality obtained by applying $m_F$; this map need not be injective.
  Index the entries of $p_i$ and the rows and columns of a $\( d + 1 \)$-by-$\( d + 1 \)$ matrix by $0 \, 1 \,
  dots.h \, d$. Thus index $0$ is the constant coordinate.

#thm([Theorem 1.1.])[
  (Classification).  #emph[Let $A = { a_1 \, dots.h \, a_s } subset
    bb(R)^d$ be a finite set of at least two points with affine span $bb(R)^d$, and define $p_i \, F \, B \,
    m_F$ as above. Then $A$ is Ramsey if and only if there is a matrix $P in "Mat"_(d + 1) \( B \)$ such that
#[#set math.equation(numbering: n => "(1)")
 $ \( p_i ⊗ 1 \)^T P \( 1 ⊗ p_i \) & = 0 &  & \( 1 lt.eq i lt.eq s \) \,\
m_F \( P_(alpha beta) \) & = delta_(alpha beta) &  & \( 1 lt.eq alpha \, beta lt.eq d \) . $ <eq:field-evaluations>]

 Here the entries of $p_i ⊗ 1$ and $1 ⊗ p_i$ are formed componentwise.
   There are no separate conditions on the multiplied constant row or constant column of $P$.]
] <thm:classification>

The condition is independent of the chosen congruent representative in its affine dimension;
  we also prove this directly through its tensor formulation. It uses exact relations in the coordinate field.
  It is not a procedure for recovering those relations from numerical approximations to arbitrary real coordinates.

=== 1.2 Geometric consequences <geometric-consequences>

Applying $m_F$ to the evaluation equations gives an ordinary sphere equation

$ parallel a_i parallel^2 + ell dot.op a_i + c = 0 wide \( 1 lt.eq i lt.eq s \) $

for some $ell in F^d$ and $c in F$. The tensor condition requires the evaluation identities to hold before
  multiplication. This is the distinction between sphericity and the Ramsey property that the classification detects.

Every subtransitive set satisfies the tensor condition. Another sufficient condition is that evaluation at the
  points of a spherical set gives independent functionals on the space of quadratic polynomials.
  It applies to every nonempty set of at most five points on a circle, and hence to every cyclic quadrilateral.
  In Corollary 23, we combine this result with the non-subtransitive cyclic kites of Leader,
  Russell and Walters #cite(label("lrw-kites")) Corollary 2.
  Those kites are Ramsey, disproving the necessity direction of their proposed characterization and their
  non-Ramseyness conjecture for the same family #cite(label("lrw-kites")) Conjecture 3.

For negative examples, nine points obtained from algebraically independent real parameters in a rational
  parametrization of a circle fail the tensor condition. Pálvölgyi’s generic seven-point
  claim #cite(label("palvolgyi-heptagon")) Theorem A.3 already implies this non-Ramseyness conclusion;
  our determinant calculation illustrates how to apply the classification directly.
  We also give a tensor obstruction for a twelve-point configuration consisting of three rotated coordinate
  squares, using the same type of weighted derivation moments as his heptagon construction.
  These consequences are proved after the classification and require no further Ramsey construction.

=== 1.3 How the algebra forces a monochromatic copy <how-the-algebra-forces-a-monochromatic-copy>

The proof begins by replacing the coordinate-field matrix with a finite rational combination of tensors of affine
  functions on $bb(R)^d$. Its evaluations at all points of $A$ vanish as rational tensors,
  while its gradient Gram matrix is $I_d$. If no such tensor exists,
  algebraic separation produces a finite coloring that avoids $A$ in every dimension. This proves necessity.

For sufficiency, the difficulty is to convert the tensor cancellations into a congruent copy at scale one:
  arbitrary colorings provide no continuity with which to absorb approximation errors. The proof has three stages.

First, the tensor determines signed rational multiplicities for a finite list of affine functions.
  At every point of $A$, the positive and negative multiplicities cancel separately at each evaluation value.
  A Gaussian construction, followed by discretization and rational approximation within a fixed convolution image,
  makes the negative gradient second moment small while retaining these cancellations exactly.
  The positive and negative multiplicities then give two lists of affine functions.
  Evaluating the lists at $a_i$ gives vectors $f_i \, g_i$ with

$ parallel f_i - f_j parallel^2 = parallel a_i - a_j parallel^2 \, wide parallel g_i - g_j parallel^2 =
  q parallel a_i - a_j parallel^2 \, $

where $q > 0$ can be arbitrarily small, and each $g_i$ is a coordinate permutation of $f_i$.
  Both the distances and the matching coordinate multisets are exact.

Second, we associate a free-group generator to each real sequence with finite support.
  A #emph[path] is an ordered product of $s$-tuples: each factor either records an ordered scaled copy of $A$ or
  has the same group element in every position. Its #emph[endpoint] is the coordinatewise product,
  and its #emph[weight] is the sum of the squared copy scales.
  We prove that equal endpoints with arbitrarily small weight ratios force the Ramsey property.
  The obstacle, familiar from the group and word methods of Leader,
  Russell and Walters #cite(label("lrw-transitive")) Sections 2–3,
  is the initially unknown number $t$ of variable positions in a Hales–Jewett line.
  After fixing the Hales–Jewett word length $n$, we prepare one endpoint at weights $1 \, 1 \/ 2 \, dots.h \,
  1 \/ n$ before coloring the words. An ultrafilter construction then realizes the products by finite strings,
  keeping common factors identical. The $t$ variable positions give squared-distance multiplier $t \( 1 \/ t \) =
  1$. Compactness supplies a finite ambient dimension for each number of colors.

Third, the permutation pairs from the first stage must be made to have equal path endpoints.
  Permutation averaging puts the discrepancies between their group entries in a subgroup whose elements can be
  corrected by appending paths of unit-scale copies. Further averaging makes the total correction weight small
  relative to the larger original weight. Appending these corrections produces the equal endpoints and arbitrarily
  small weight ratios required in the second stage.

Sections 2–4 establish the algebraic formulation, necessity, and the exact pair construction.
  Section 5 states and proves the group-endpoint criterion that suffices for Ramsey forcing.
  Section 6 constructs the required endpoints and completes the proof of Theorem 1.
  Section 7 derives the geometric examples. All arguments take place in ZFC.

== 2 Rational tensors and the coloring obstruction <sec:tensors>

We first express the matrix condition of Theorem 1 as a condition on affine functions.
  This formulation makes the obstruction to arbitrary colorings explicit and supplies the input for the
  construction in the next section. Throughout, $s gt.eq 2$, $d gt.eq 1$, and $A = { a_1 \, dots.h \,
  a_s }$ affinely spans $bb(R)^d$; the field $F$, ring $B$, columns $p_i$,
  and multiplication map $m_F$ are as in the theorem.

Put $W = bb(R) times bb(R)^d$, regarded as a vector space over $bb(Q)$.
  An element $w = \( v \, u \)$ specifies the affine function $a mapsto v + a dot.op u$.
  For each label define the $bb(Q)$-linear evaluation map

$ e_i : W arrow.r bb(R) \, wide e_i \( v \, u \) = v + a_i dot.op u . $

Let $cal(T) \( W \)$ be the subspace of $W ⊗_(bb(Q)) W$ fixed by the flip $w ⊗ w' mapsto w' ⊗ w$.
  Thus our symmetric tensors are flip-invariant tensors. The map

$ \( v \, u \) ⊗ \( v' \, u' \) mapsto u \( u' \)^(sans(T)) $

is $bb(Q)$-linear on the tensor product and restricts to a map $G : cal(T) \( W \) arrow.r "Sym"_d \( bb(R) \)$,
  where $"Sym"_d \( bb(R) \)$ denotes the real symmetric matrices. In particular, $G \( w ⊗ w \) = u u^(sans(T))$.
  The tensor condition is the existence of $T in cal(T) \( W \)$ such that

#[#set math.equation(numbering: n => "(2)")
 $ \( e_i ⊗ e_i \) \( T \) = 0 quad \( 1 lt.eq i lt.eq s \) \, wide G \( T \) = I_d . $ <alg:tensor>]

The first identities hold in $bb(R) ⊗_(bb(Q)) bb(R)$. They are stronger than their images under real multiplication.

#thm([Proposition 2.1.])[
  #emph[The matrix condition in Theorem 1 is equivalent to (2).]
] <alg:equivalence>

#proof[
  Write $cal(B) = bb(R) ⊗_(bb(Q)) bb(R)$, let $tau \( x ⊗ y \) = y ⊗ x$, and let $m_(bb(R)) : cal(B) arrow.r
    bb(R)$ be multiplication. The coordinate decomposition of $W$ identifies $W ⊗_(bb(Q))
    W$ with arrays $Q = \( Q_(alpha beta) \)_(0 lt.eq alpha \, beta lt.eq d)$ over $cal(B)$.
    Under this identification, evaluation is
  $ E_i \( Q \) = sum_(alpha \, beta = 0)^d \( p_(i \, alpha) ⊗ 1 \) Q_(alpha beta) \( 1 ⊗ p_(i \, beta) \) \, $
  and the gradient matrix is the spatial block
    $\( m_(bb(R)) \( Q_(alpha beta) \) \)_(1 lt.eq alpha \, beta lt.eq d)$. Tensor flip becomes
  $ Q_(alpha beta)^(*) = tau \( Q_(beta alpha) \) . $
  Directly from the evaluation formula, $E_i \( Q^(*) \) = tau \( E_i \( Q \) \)$,
    and multiplication of $Q^(*)$ transposes the multiplied array.
    Consequently $1 / 2 \( Q + Q^(*) \)$ preserves every zero evaluation and any multiplied spatial block equal to
    $I_d$. This proves the implication from a matrix over $B$ to a symmetric tensor,
    using the natural inclusion $B subset cal(B)$.
  For the converse, we show that extending the coefficient ring from $B$ to $cal(B)$ introduces no new solutions.
    Choose an $F$-basis $\( r_lambda \)_(lambda in Lambda)$ of $bb(R)$.
    Distributing tensor products over direct sums gives the free $B$-module decomposition
  #[#set math.equation(numbering: n => "(3)")
   $ cal(B) = xor.big_(lambda \, mu in Lambda) B \( r_lambda ⊗ r_mu \) . $ <alg:free-expansion>]
  Here a coefficient $x ⊗ y in B$ in the indicated summand represents $\( x r_lambda \) ⊗ \( y r_mu \)$.
    If an array $Q$ over $cal(B)$ solves the evaluation equations and has multiplied spatial block $I_d$,
    its entries have a common finite expansion
  $ Q = sum_(\( lambda \, mu \) in J) \( r_lambda ⊗ r_mu \) P^(lambda mu) \, wide
    P^(lambda mu) in "Mat"_(d + 1) \( B \) . $
  All coefficients in the maps $E_i$ belong to $B$. Thus (3) implies $E_i \( P^(lambda mu) \) =
    0$ for each pair and each label. Let $C^(lambda mu) in "Mat"_d \( F \)$ be the multiplied spatial block of
    $P^(lambda mu)$. Applying multiplication to the expansion gives
  $ I_d = sum_(\( lambda \, mu \) in J) r_lambda r_mu C^(lambda mu) . $
  This finite linear system has coefficients and right-hand side in $F$.
    Since it is consistent over $bb(R)$, row reduction over $F$ shows that it is consistent over $F$.
    Choose $c_(lambda mu) in F$ with $I_d = sum c_(lambda mu) C^(lambda mu)$. Then
  $ P = sum_(\( lambda \, mu \) in J) \( c_(lambda mu) ⊗ 1 \) P^(lambda mu) $
  is a solution over $B$. The individual matrices $C^(lambda mu)$ need not be symmetric;
    the descent took place in the full space $"Mat"_d \( F \)$.
    If a symmetric tensor is wanted after descent, the symmetrization already proved applies to $P$. ◻
]

#prodef([Remark 2.2.])[
  The finite coordinate presentation explains the algebraic nature of the criterion.
    Let $F_0 = bb(Q) \[ \( a_i \)_j \]$, the subring of $bb(R)$ generated by all coordinates.
    It is a finitely generated domain and $F = "Frac" \( F_0 \)$.
    The ring $B$ is the localization of $F ⊗_(bb(Q)) F_0$ at the elements $1 ⊗ f$ for $0 eq.not f in F_0$.
    The latter ring is a finitely generated $F$-algebra, so $B$ is Noetherian.
    The kernel of the finite evaluation system therefore has finitely many $B$-module generators.
    Its multiplied spatial image is the $F$-span of their multiplied spatial blocks,
    because every scalar $c in F$ lifts to $c ⊗ 1$. This description uses exact coordinate-field relations;
    it makes no claim to recover those relations from numerical real inputs.
] <alg:noetherian>

#prodef([Remark 2.3.])[
  The tensor condition is directly invariant under congruence.
    If $a'_i = Q a_i + t$ with $Q in O \( d \)$, the invertible $bb(Q)$-linear map
  $ H : W arrow.r W \, wide H \( v \, u \) = \( v - t dot.op Q u \, Q u \) $
  satisfies $e'_i compose H = e_i$ and $G \( \( H ⊗ H \) T \) = Q G \( T \) Q^(sans(T))$.
    It therefore carries certificates for $A$ to certificates for $A'$; the inverse congruence gives the converse.
    Reordering labels merely reorders the equations. Any two congruent representatives in their affine dimension
    are related by such a map, so Proposition 2 also proves representative independence for the matrix criterion,
    even when their coordinate fields differ.
] <alg:congruence>

We next prove the necessary direction of the classification.
  Failure of (2) gives an algebraic functional, and its values provide a fixed finite coloring that works in every
  ambient dimension. The invariant-and-coloring strategy goes back to Erdős et al.
  #cite(label("egm-rss")) Theorem 13 and Lemma 15; here rational tensor separation supplies the invariant,
  and the modular coloring is proved directly. Their real-variable coloring lemma extends Rado’s work on partition
  regularity #cite(label("rado-note")).

#thm([Proposition 2.4.])[
  #emph[If (2) has no solution, then there is an integer $r_0 gt.eq
    2$ such that every $bb(R)^D$ admits an $r_0$-coloring with no monochromatic congruent copy of $A$.
    In particular, every Euclidean Ramsey set satisfies the matrix condition of Theorem 1.]
] <alg:necessity>

#proof[
  Regard
  $ cal(Y) = \( bb(R) ⊗_(bb(Q)) bb(R) \)^s xor "Sym"_d \( bb(R) \) $
  as a $bb(Q)$-vector space and define the $bb(Q)$-linear map
  $ Phi : cal(T) \( W \) arrow.r cal(Y) \, wide Phi \( T \) =
    #scale(x: 120%, y: 120%)[\(] \( e_i ⊗ e_i \) \( T \) #scale(x: 120%, y: 120%)[\)]_(i = 1)^s xor G \( T \) . $
  By assumption $y_0 = \( 0 \, dots.h \, 0 \, I_d \)$ is outside its image.
    In the quotient vector space $cal(Y) \/ "im" Phi$, extend the nonzero class of $y_0$ to a basis over $bb(Q)$.
    Sending that basis element to $1$ and the others to $0$ gives a $bb(Q)$-linear functional $ell :
    cal(Y) arrow.r bb(R)$ such that
  $ ell compose Phi = 0 \, wide ell \( y_0 \) = 1 . $
  Write its components as $ell_i : bb(R) ⊗_(bb(Q)) bb(R) arrow.r bb(R)$ and $L : "Sym"_d \( bb(R) \) arrow.r
    bb(R)$, and put $h_i \( x \) = ell_i \( x ⊗ x \)$. Applying $ell$ to $Phi \( w ⊗ w \)$ gives
  #[#set math.equation(numbering: n => "(4)")
   $ sum_(i = 1)^s h_i \( v + a_i dot.op u \) + L \( u u^(sans(T)) \) = 0 \, wide L \( I_d \) = 1 . $ <alg:separated>]
  Taking $u = 0$ shows that
  #[#set math.equation(numbering: n => "(5)")
   $ sum_(i = 1)^s h_i \( x \) = 0 wide \( x in bb(R) \) . $ <alg:constant-cancellation>]
  These are purely algebraic functionals; no continuity or measurability is asserted or needed.
  Fix $D$ and define $H_i \( z \) = sum_(j = 1)^D h_i \( z_j \)$ for $z in bb(R)^D$.
    We claim that every ordered congruent copy $\( b_1 \, dots.h \, b_s \)$ satisfies
  #[#set math.equation(numbering: n => "(6)")
   $ sum_(i = 1)^s H_i \( b_i \) = - 1 . $ <alg:copy-obstruction>]
  Indeed, equality of the pairwise distances gives equality of the Gram matrices of $\( a_i - a_1 \)_i$ and
    $\( b_i - b_1 \)_i$ by polarization. Thus sending each $a_i - a_1$ to $b_i -
    b_1$ defines an inner-product-preserving linear map on their span:
    any relation among the first differences has squared norm zero for the corresponding combination of the
    second. Since $A$ affinely spans $bb(R)^d$, there are a linear isometry $Q : bb(R)^d arrow.r
    bb(R)^D$ and $t in bb(R)^D$ such that $b_i = t + Q a_i$. Writing $u_j^(sans(T))$ for the $j$th row of $Q$, we have
  $ \( b_i \)_j = e_i \( t_j \, u_j \) \, wide sum_(j = 1)^D u_j u_j^(sans(T)) = Q^(sans(T)) Q = I_d . $
  Sum (4) over $j$. The finite additivity of $L$ proves (6).
    Also (5) gives $sum_i H_i \( z \) = 0$ at every single point $z$.
  Choose $K = 2 s + 1$ and partition $\[ 0 \, 2 \)$ into $K$ half-open intervals of equal length $2 \/ K < 1 \/
    s$. Color a point $z$ by the $s$-tuple of interval labels of the representatives of $H_i \( z \)$ modulo $2$.
    This uses at most $r_0 = K^s$ colors, independently of $D$.
    If $b_1 \, dots.h \, b_s$ were monochromatic, there would be integers $n_i$ and real numbers $epsilon_i$,
    with $\| epsilon_i \| < 2 \/ K$, such that
  $ H_i \( b_i \) - H_i \( b_1 \) = 2 n_i + epsilon_i . $
  Summation yields
  $ - 1 = 2 sum_i n_i + sum_i epsilon_i \, wide lr(|sum_i epsilon_i|) < 1 . $
  The first identity makes the error sum an odd integer, contradicting the second.
    This coloring avoids $A$ in every dimension and completes the proof. ◻
]

The remaining direction begins with a tensor satisfying (2).
  Its evaluations vanish before multiplication, and that exact cancellation will produce equal coordinate
  histograms for two embeddings at different scales.

== 3 A finite lattice identity <stencil:section>

Assume that the tensor condition holds. We begin the sufficiency proof by turning its rational tensor equalities
  into exact cancellation identities for finitely many affine functions.
  These identities will let us construct two copies of the configuration at different scales whose corresponding
  points have the same coordinates in different orders.

Recall that $W = bb(R) times bb(R)^d$ is viewed over $bb(Q)$, and that $e_i \( v \, u \) = v + a_i dot.op u$.
  Let $T in W ⊗_(bb(Q)) W$ be symmetric, with

$ \( e_i ⊗ e_i \) T = 0 quad \( 1 lt.eq i lt.eq s \) \, wide G \( T \) = I_d . $

A tensor uses only finitely many vectors. Choose a basis $w_1 \, dots.h \,
  w_k$ over $bb(Q)$ for a finite-dimensional subspace containing its factors, and write

$ T = sum_(a \, b = 1)^k C_(a b) w_a ⊗ w_b \, wide C in "Mat"_k \( bb(Q) \) \, quad C = C^(sans(T)) . $

For $lambda in bb(Q)^k$, put

$ w \( lambda \) = sum_(j = 1)^k lambda_j w_j . $

Write $w_j = \( v_j \, u_j \)$ and let $U = \( u_1 med dots.h.c med u_k \)$ be the real $d times
  k$ matrix whose columns are their gradients. The gradient identity for $T$ is

#[#set math.equation(numbering: n => "(7)")
 $ U C U^(sans(T)) = I_d . $ <stencil:gram>]

Set $Gamma = bb(Z)^k$ and define the evaluation lattices

$ Lambda_i = { lambda in Gamma : e_i \( w \( lambda \) \) = 0 } \, wide V_i = "span"_(bb(Q)) Lambda_i . $

Clearing denominators shows that $V_i$ is the kernel of the rational linear map $lambda mapsto
  e_i \( w \( lambda \) \)$ on $bb(Q)^k$. Thus $bb(Q)^k \/ V_i$ embeds into $bb(R)$ over $bb(Q)$.
  Tensoring this injection with itself remains injective, so the tensor represented by $C$ has zero image in
  $\( bb(Q)^k \/ V_i \) ⊗_(bb(Q)) \( bb(Q)^k \/ V_i \)$.

The next lemma converts these tensor equalities into a finitely supported rational function on $Gamma$.
  Vanishing of its sums on each coset will record exact cancellation among equal evaluations.

#thm([Lemma 3.1.])[
  (Finite lattice identity).  #emph[Let $k \, s gt.eq 1$, let $Lambda_1 \, dots.h \,
    Lambda_s$ be subgroups of $Gamma = bb(Z)^k$, and put $V_i = "span"_(bb(Q)) Lambda_i$.
    Let $C in "Mat"_k \( bb(Q) \)$ be symmetric. Suppose that the image of $sum_(a \, b) C_(a b) epsilon_a ⊗
    epsilon_b$ in $\( bb(Q)^k \/ V_i \) ⊗_(bb(Q)) \( bb(Q)^k \/ V_i \)$ is zero for every $i$, where $epsilon_1 \,
    dots.h \, epsilon_k$ is the standard basis of $bb(Q)^k$. There is a finitely supported function $nu :
    Gamma arrow.r bb(Q)$ such that
#[#set math.equation(numbering: n => "(8)")
 $ sum_(gamma in q) nu \( gamma \) = 0 wide \( q in Gamma \/ Lambda_i \, med 1 lt.eq i lt.eq s \) $ <stencil:cosets>]

 and
#[#set math.equation(numbering: n => "(9)")
 $ sum_gamma nu \( gamma \) = 0 \, wide sum_gamma nu \( gamma \) gamma = 0 \, wide
   sum_gamma nu \( gamma \) gamma gamma^(sans(T)) = C . $ <stencil:moments>]

]
] <stencil:finite>

#proof[
  The Laurent polynomial ring
  $ R = bb(Q) \[ X_1^(plus.minus 1) \, dots.h \, X_k^(plus.minus 1) \] $
  is the group algebra of $Gamma$, with $X^gamma = product_j X_j^(gamma_j)$.
    The quotient map $Gamma arrow.r Gamma \/ Lambda_i$ induces a ring homomorphism whose kernel is
  $ J_i = \( X^h - 1 : h in Lambda_i \) . $
  Indeed, its kernel consists of Laurent polynomials with zero coefficient sum on each coset.
    Within a coset, choose a representative $gamma_0$ from the finite support;
    a zero-sum polynomial on that coset is a sum of terms $c_gamma \( X^gamma - X^(gamma_0) \)$, each in $J_i$.
  We will find a Laurent polynomial in every $J_i$ with prescribed terms through degree two near
    $X = \( 1 \, dots.h \, 1 \)$. To use the tensor hypothesis, we pass to formal logarithmic coordinates,
    in which the generators $X^h - 1$ become linear forms multiplied by units.
    Put $frak(m) = \( X_1 - 1 \, dots.h \, X_k - 1 \)$ and complete $R$ with respect to $frak(m)$.
    With $Z_j = X_j - 1$, its completion is $hat(R) = bb(Q) \[ \[ Z_1 \, dots.h \, Z_k \] \]$:
    the factors $1 + Z_j$ are already invertible modulo each power of $\( Z_1 \, dots.h \, Z_k \)$.
    The formal changes of variables
  $ Y_j = log \( 1 + Z_j \) \, wide Z_j = exp \( Y_j \) - 1 $
  identify this ring with $bb(Q) \[ \[ Y_1 \, dots.h \, Y_k \] \]$ and identify $frak(m)
    hat(R)$ with $\( Y_1 \, dots.h \, Y_k \)$. For each $h in Gamma$,
  $ X^h - 1 = exp \( h dot.op Y \) - 1 = \( h dot.op Y \) sum_(n gt.eq 0) frac(\( h dot.op Y \)^n, \( n + 1 \) !) . $
  The final factor is a unit. Hence
  #[#set math.equation(numbering: n => "(10)")
   $ J_i hat(R) = \( h dot.op Y : h in Lambda_i \) hat(R) . $ <stencil:linear-ideals>]
  Consider the quadratic polynomial
  $ Q_2 \( Y \) = 1 / 2 Y^(sans(T)) C Y . $
  Identify $bb(Q) \[ Y_1 \, dots.h \, Y_k \]$ with the symmetric algebra of $bb(Q)^k$ by sending $epsilon_j$ to
    $Y_j$. The map to the symmetric algebra of $bb(Q)^k \/ V_i$ has kernel generated by $V_i$ in degree one.
    This follows, for example, by extending a basis of $V_i$ to a basis of $bb(Q)^k$.
    The tensor hypothesis therefore puts $Q_2$ in the ideal generated by the linear forms $h dot.op Y$,
    $h in Lambda_i$. By (10), $Q_2 in J_i hat(R)$ for every $i$.
  The ring $R$ is Noetherian, being a localization of a polynomial ring over $bb(Q)$.
    Its $frak(m)$-adic completion is therefore flat over $R$ #cite(label("stacks-completion")) Lemma 10.97.2,
    Tag 00MB. If $I = ⋂_(i = 1)^s J_i$, the injection
  $ R \/ I arrow.r xor.big_(i = 1)^s R \/ J_i $
  remains injective after tensoring with $hat(R)$. Consequently
  $ I hat(R) = ⋂_(i = 1)^s J_i hat(R) \, $
  and $Q_2 in I hat(R)$.
  We now recover a finite Laurent polynomial while retaining exact membership in $I$. Write
  $ Q_2 = sum_(a = 1)^N f_a alpha_a \, wide f_a in I \, quad alpha_a in hat(R) \, $
  as a finite sum. For each $a$, truncate the formal $Z$-expansion of $alpha_a$ through degree two to obtain $b_a
    in R$ with $b_a - alpha_a in frak(m)^3 hat(R)$. Then $f = sum_a f_a b_a in I$ and
  $ f \( e^(Y_1) \, dots.h \, e^(Y_k) \) = 1 / 2 Y^(sans(T)) C Y med \( mod med \( Y_1 \, dots.h \, Y_k \)^3 \) . $
  Write the finite Laurent expansion as $f = sum_gamma nu \( gamma \) X^gamma$.
    Membership in each $J_i$ gives (8). Finally,
  $ X^gamma = exp \( gamma dot.op Y \) = 1 + gamma dot.op Y + 1 /
    2 \( gamma dot.op Y \)^2 med \( mod med \( Y \)^3 \) . $
  Comparing the constant term, gradient, and Hessian at $Y = 0$ gives (9). ◻
]

Apply Lemma 6 to the matrix and evaluation lattices constructed above.
  If $gamma \, gamma' in Gamma$, then $e_i \( w \( gamma \) \) = e_i \( w \( gamma' \) \)$ exactly when $gamma -
  gamma' in Lambda_i$. Thus (8) says that the positive and negative weights cancel separately at every evaluation
  value. The second moment in (9), together with (7), gives their prescribed difference in gradient Gram matrices.
  We next redistribute these weights so that the negative part has arbitrarily small gradient second moment,
  while all these equalities remain exact.

== 4 Exact coordinate permutations at two scales <pairs:section>

The tensor condition will now produce two configurations with the same coordinate values at each label,
  but with arbitrarily different scales. The equality of coordinate values is an equality of finite multisets,
  including multiplicities.

#thm([Lemma 4.1.])[
  (Two-scale configurations).  #emph[Let $A = { a_1 \, dots.h \, a_s } subset bb(R)^d$ have affine span $bb(R)^d$,
    with $s gt.eq 2$. Let $W = bb(R)^(1 + d)$ be regarded as a vector space over $bb(Q)$.
    Suppose that a symmetric tensor $T in W ⊗_(bb(Q)) W$ satisfies
$ \( e_i ⊗ e_i \) \( T \) = 0 quad \( 1 lt.eq i lt.eq s \) \, wide G \( T \) = I_d \, $

 where $e_i \( v \, u \) = v + a_i dot.op u$. For every $eta > 0$, there are an integer $ell gt.eq
   1$ and vectors $f_i \, g_i in bb(R)^ell$ such that
#[#set math.equation(numbering: n => "(11)")
 $ parallel f_i - f_j parallel^2 & = parallel a_i - a_j parallel^2 \, & parallel g_i - g_j parallel^2 & =
   q parallel a_i - a_j parallel^2 \, & q & = frac(eta, 1 + eta) \, $ <pairs:distances>]

 for every $i \, j$, and $g_i$ is a permutation of the coordinates of $f_i$ for each $i$.]
] <pairs:two-scale>

The finite function $nu$ from Lemma 6 supplies signed rational weights whose sums vanish on every evaluation
  class. Positive and negative weights can therefore become two lists of coordinates with identical multisets of
  values. Their second moments control the difference of their gradient Gram matrices.
  The remaining task is to make the negative list’s Gram matrix arbitrarily small.
  We first obtain the required inequality by smoothing, and then obtain finite rational weights while preserving
  all cancellation identities exactly.

For a real symmetric $k times k$ matrix $C$, write

$ D_C = 1 / 2 sum_(j \, l = 1)^k C_(j l) partial_j partial_l \, wide r_(+) = max { r \, 0 } \, quad r_(-) =
  max { - r \, 0 } quad \( r in bb(R) \) . $

#thm([Lemma 4.2.])[
  (A compactly supported smoothing function).  #emph[Let $C$ be a real symmetric $k times
    k$ matrix and let $U in "Mat"_(d times k) \( bb(R) \)$, where $d gt.eq 1$ and $U C U^(sans(T)) = I_d$.
    For every $eta > 0$, there is a nonnegative $b in C_c^oo \( bb(R)^k \)$ such that
#[#set math.equation(numbering: n => "(12)")
 $ integral_(bb(R)^k) b \( x \) thin d x > 0 \, wide integral_(bb(R)^k) \( D_C b \)_(-) \( x \) parallel U x
   parallel^2 thin d x < eta integral_(bb(R)^k) b \( x \) thin d x . $ <pairs:bump-bound>]

]
] <pairs:bump>

#proof[
  We will average Gaussian densities with covariance matrices running from $S$ to $S + C$.
    We first construct a positive definite $S$ for which $S +
    C$ is positive definite and $"tr" \( U S U^(sans(T)) \)$ is small.
  The identity $U C U^(sans(T)) = I_d$ implies that $U$ has rank $d$.
    Set $H = "im" \( U^(sans(T)) \)$ and $V = ker U$, so that $bb(R)^k = H xor V$ orthogonally.
    The restriction of the quadratic form $C$ to $H$ is positive definite: if $0 eq.not h = U^(sans(T)) y$, then
  $ h^(sans(T)) C h = y^(sans(T)) U C U^(sans(T)) y = parallel y parallel^2 > 0 . $
  Choose $epsilon.alt > 0$ with $epsilon.alt "tr" \( U U^(sans(T)) \) < eta \/ 8$.
    We claim that, for a sufficiently large $L > 0$, the matrix
  $ S = epsilon.alt P_H + L P_V $
  is positive definite and so is $S + C$. Here $P_H \, P_V$ are the orthogonal projections.
    To check the latter assertion, write
  $ S + C = mat(delim: "(", A, B; B^(sans(T)), C_(V V) + L I_V) \, wide A = C_(H H) + epsilon.alt I_H > 0 . $
  Choose $L$ such that $C_(V V) + L I_V - B^(sans(T)) A^(- 1) B > 0$ and use the Schur complement.
    If $V = { 0 }$, the second block is absent. Since $U P_V = 0$, this construction also gives
  #[#set math.equation(numbering: n => "(13)")
   $ "tr" \( U S U^(sans(T)) \) = epsilon.alt "tr" \( U U^(sans(T)) \) < eta \/ 8 . $ <pairs:small-covariance>]
  Every matrix $S + t C$, $0 lt.eq t lt.eq 1$, is positive definite, being a convex combination of $S$ and $S + C$.
  For a positive definite $k times k$ matrix $Q$, let
  $ phi.alt_Q \( x \) = \( 2 pi \)^(- k \/ 2) \( det Q \)^(- 1 \/ 2) exp #h(-0.16667em)
    (- 1 / 2 x^(sans(T)) Q^(- 1) x) $
  be the centered Gaussian density with covariance $Q$. Differentiating the displayed formula, with $Q_t = S +
    t C$, gives
  $ frac(d, d t) phi.alt_(Q_t) \( x \) = 1 / 2 (x^(sans(T)) Q_t^(- 1) C Q_t^(- 1) x - "tr" \( Q_t^(- 1) C \))
    phi.alt_(Q_t) \( x \) = D_C phi.alt_(Q_t) \( x \) . $
  This identity does not require $C$ to be positive semidefinite.
    The covariances $Q_t$ have uniformly bounded eigenvalues, bounded away from zero,
    so the densities and each of their spatial derivatives have uniform Gaussian decay. Consequently
  $ b_(*) \( x \) = integral_0^1 phi.alt_(S + t C) \( x \) thin d t $
  is a nonnegative Schwartz function of integral $1$, and differentiation under the integral gives
  $ D_C b_(*) = phi.alt_(S + C) - phi.alt_S . $
  The pointwise inequality $\( phi.alt_(S + C) - phi.alt_S \)_(-) lt.eq phi.alt_S$ and (13) imply
  #[#set math.equation(numbering: n => "(14)")
   $ integral_(bb(R)^k) \( D_C b_(*) \)_(-) \( x \) parallel U x parallel^2 thin d x lt.eq
     integral_(bb(R)^k) phi.alt_S \( x \) parallel U x parallel^2 thin d x =
     "tr" \( U S U^(sans(T)) \) < eta \/ 8 . $ <pairs:gaussian-bound>]
  To make the support compact, choose a smooth function $chi$ with $0 lt.eq chi lt.eq 1$,
    equal to $1$ on the unit ball and zero outside the ball of radius $2$.
    Put $chi_R \( x \) = chi \( x \/ R \)$ and $b_R = chi_R b_(*)$. Then $integral b_R arrow.r 1$.
    The product rule reads
  $ D_C b_R = chi_R D_C b_(*) + sum_(j \, l) C_(j l) \( partial_j chi_R \) \( partial_l b_(*) \) + b_(*) D_C chi_R . $
  The derivatives of $chi_R$ have bounds of orders $R^(- 1)$ and $R^(- 2)$ and are supported where $R lt.eq
    parallel x parallel lt.eq 2 R$. The Schwartz decay therefore implies
  $ integral_(bb(R)^k) \| D_C b_R - D_C b_(*) \| \( x \) parallel U x parallel^2 thin d x arrow.r 0 . $
  Since $r mapsto r_(-)$ is $1$-Lipschitz, the corresponding weighted negative-part integrals converge as well.
    For sufficiently large $R$, we have $integral b_R > 1 \/ 2$ and the last displayed integral is less than
    $eta \/ 8$. Equation (14) now gives
  $ integral \( D_C b_R \)_(-) parallel U x parallel^2 < eta \/ 4 < eta integral b_R . $
  Taking $b = b_R$ proves the lemma. ◻
]

#thm([Lemma 4.3.])[
  (Finite rational weights).  #emph[Let $Gamma = bb(Z)^k$, and let $Lambda_1 \, dots.h \,
    Lambda_s$ be subgroups of $Gamma$. Suppose that a finitely supported function $nu : Gamma arrow.r
    bb(Q)$ has zero pushforward on each $Gamma \/ Lambda_i$, and satisfies
$ sum_gamma nu \( gamma \) = 0 \, wide sum_gamma nu \( gamma \) gamma = 0 \, wide
  sum_gamma nu \( gamma \) gamma gamma^(sans(T)) = C . $

 Let $U$ be a real $d times k$ matrix with $U C U^(sans(T)) = I_d$, where $d gt.eq 1$.
   For every $eta > 0$, there are an integer $n gt.eq 1$, a finitely supported $mu : Gamma arrow.r bb(Q)$,
   and $zeta in bb(Q)_(> 0)$ such that $mu$ has zero pushforward on each $Gamma \/ Lambda_i$ and
#[#set math.equation(numbering: n => "(15)")
 $ sum_lambda mu \( lambda \) lambda / n lambda^(sans(T)) / n & = zeta C \,\
sum_lambda mu \( lambda \)_(-) ∥U lambda / n∥^2 & < eta zeta . $ <pairs:exact-moment>]

]
] <pairs:rational>

#proof[
  Take $b$ from Lemma 8. For each positive integer $n$, set
  $ d_n \( lambda \) = n^(2 - k) b \( lambda \/ n \) \, wide mu_n \( lambda \) = \( nu * d_n \) \( lambda \) =
    sum_gamma nu \( gamma \) d_n \( lambda - gamma \) . $
  These functions have finite support. Quotient pushforward commutes with convolution,
    so every required pushforward of $mu_n$ is zero. More generally,
    for any finitely supported real function $d$ on $Gamma$, the moment identities for $nu$ give
  #[#set math.equation(numbering: n => "(16)")
   $ sum_lambda \( nu * d \) \( lambda \) = 0 \, wide sum_lambda \( nu * d \) \( lambda \) lambda
     lambda^(sans(T)) = (sum_beta d \( beta \)) C . $ <pairs:convolution-moments>]
  Indeed, substitute $lambda = beta + gamma$ in the double sum.
    The terms in $beta beta^(sans(T))$, $beta gamma^(sans(T))$ and $gamma
    beta^(sans(T))$ vanish by the zeroth and first moments of $nu$. Thus, with
  $ zeta_n = n^(- 2) sum_lambda d_n \( lambda \) = n^(- k) sum_lambda b \( lambda \/ n \) \, $
  the identity in (15) holds exactly for $\( mu_n \, zeta_n \)$, and Riemann sums give $zeta_n arrow.r integral b > 0$.
  For $x = lambda \/ n$, Taylor expansion gives
  $ n^k mu_n \( lambda \) & = n^2 sum_gamma nu \( gamma \) b \( x - gamma \/ n \)\
 & = 1 / 2 sum_(j \, l) C_(j l) partial_j partial_l b \( x \) + O \( n^(- 1) \) = D_C b \( x \) + O \( n^(- 1) \) . $
  The error is uniform in $x$: the third derivatives of $b$ are bounded,
    and $sum_gamma \| nu \( gamma \) \| parallel gamma parallel^3$ is finite.
    Moreover, the supports of both $mu_n \( lambda \)$ and $D_C b \( lambda \/ n \)$,
    after division of the lattice by $n$, lie in a single fixed ball for all $n gt.eq 1$.
    There are $O \( n^k \)$ relevant lattice points and the weight $parallel U x
    parallel^2$ is bounded on that ball. The $1$-Lipschitz property of the negative part therefore shows that
  $ sum_lambda mu_n \( lambda \)_(-) parallel U lambda \/ n parallel^2 -
    n^(- k) sum_lambda \( D_C b \( lambda \/ n \) \)_(-) parallel U lambda \/ n parallel^2 = O \( n^(- 1) \) . $
  The second sum is a Riemann sum for a continuous compactly supported function. By (12), it follows that
  $ sum_lambda mu_n \( lambda \)_(-) parallel U lambda \/ n parallel^2 arrow.r
    integral \( D_C b \)_(-) parallel U x parallel^2 < eta integral b . $
  Fix a sufficiently large $n$ such that $zeta_n > 0$ and (15) holds strictly for $\( mu_n \, zeta_n \)$.
  It remains to obtain rational coefficients. Let $E subset Gamma$ be a finite set supporting $d_n$.
    For functions $d$ supported in $E$, the maps
  $ d mapsto nu * d \, wide d mapsto zeta = n^(- 2) sum_lambda d \( lambda \) $
  are linear, and the function
  $ d mapsto sum_(lambda in "supp" nu + E) \( nu * d \) \( lambda \)_(-) parallel U lambda \/ n parallel^2 $
  is continuous on $bb(R)^E$. The two strict inequalities $zeta >
    0$ and (15) consequently persist in an open neighborhood of $d_n$.
    Choose a rational vector $d$ in that neighborhood and extend it by zero outside $E$. Put $mu = nu * d$.
    Both $mu$ and $zeta$ are rational. Convolution still gives zero quotient pushforwards,
    and (16) still gives the exact second moment (15). This proves the lemma. ◻
]

We have now obtained finite rational weights with exact cancellation and the required second moment.
  The inequalities will only be used to add a common positive semidefinite Gram increment;
  no further approximation is needed.

#proof[
  Use the notation preceding Lemma 6 and the function $nu$ supplied by that lemma:
    $w_j = \( v_j \, u_j \)$, $w \( lambda \) = sum_j lambda_j w_j$, $U = \( u_1 med dots.h.c med u_k \)$,
    $Gamma = bb(Z)^k$, and
  $ Lambda_i = { lambda in Gamma : e_i \( w \( lambda \) \) = 0 } . $
  The rational symmetric matrix $C$ of the tensor satisfies $U C U^(sans(T)) = I_d$.
    Apply Lemma 9 to obtain $n \, mu \, zeta$. Choose a positive integer $M$ such that every $M
    mu \( lambda \)$ is an integer. Form two finite lists of affine rows:
    the positive list has $M mu \( lambda \)_(+)$ repetitions of $w \( lambda \/ n \)$,
    and the negative list has $M mu \( lambda \)_(-)$ repetitions.
  The zero total mass of $mu$ shows that the two lists have the same length. For each label $i$,
  $ e_i \( w \( lambda \/ n \) \) = e_i \( w \( lambda' \/ n \) \) quad arrow.l.r.double quad lambda -
    lambda' in Lambda_i . $
  Thus the zero pushforward on $Gamma \/ Lambda_i$ says exactly that, after evaluating at $a_i$,
    every real coordinate value appears equally often in the two lists.
    The resulting evaluation vectors are coordinate permutations of one another.
  Divide every affine row in both lists by $sqrt(zeta M)$. Their gradient Gram matrices become
  $ B_plus.minus = 1 / zeta sum_lambda mu \( lambda \)_plus.minus \( U lambda \/ n \) \( U lambda \/ n \)^(sans(T)) . $
  Equations (15) and (15) give
  $ B_(+) - B_(-) = I_d \, wide "tr" \( B_(-) \) < eta . $
  Since $B_(-)$ is positive semidefinite, each of its eigenvalues is at most its trace.
    Hence $P = eta I_d - B_(-)$ is positive semidefinite. Choose vectors $r_1 \, dots.h \,
    r_d in bb(R)^d$ with $sum_j r_j r_j^(sans(T)) = P$, for example the columns of $P^(1 \/ 2)$,
    and append the same affine rows $\( 0 \, r_j \)$ to both lists.
    The two Gram matrices are now $\( 1 + eta \) I_d$ and $eta I_d$.
    Identical appended rows preserve equality of all coordinate multisets.
  Finally divide every row in both lists by $sqrt(1 + eta)$, and let $f_i \,
    g_i$ be their respective evaluation vectors at $a_i$. Their coordinate multisets remain equal.
    For any affine row $\( v \, u \)$, the difference of its evaluations at $a_i$ and $a_j$ is $\( a_i - a_j \)
    dot.op u$. The two gradient Gram identities therefore give (11) exactly, with $q = eta \/ \( 1 + eta \)$. ◻
]

== 5 From paths to monochromatic copies <paths:section>

We now give a criterion that converts products of scaled copies into the Ramsey property.
  The products will first be taken in a free group. A word construction then turns their algebraic relations into
  actual monochromatic point sets. Throughout this section, $A = { a_1 \, dots.h \,
  a_s }$ is a finite Euclidean configuration with $s gt.eq 2$.

Let $cal(E) = bb(R)^(\( bb(N) \))$ be the Euclidean space of real sequences with finite support,
  and let $K$ be the free group on the symbols $xi_z$, indexed by $z in cal(E)$.
  Write $Delta g = \( g \, dots.h \, g \) in K^s$ for $g in K$.
  A #emph[path] is a chosen finite sequence of factors in $K^s$ of the following two kinds:

+ a diagonal factor $Delta g$, assigned weight zero;
+ a factor $X_b = \( xi_(b_1) \, dots.h \, xi_(b_s) \)$, where $b_1 \, dots.h \, b_s in cal(E)$ and,
  for some $u gt.eq 0$,
  $ parallel b_i - b_j parallel^2 = u parallel a_i - a_j parallel^2 wide \( 1 lt.eq i \, j lt.eq s \) \, $
  assigned weight $u$.

The #emph[endpoint] is the product of the factors in $K^s$, in their given order.
  The #emph[weight] is the sum of their assigned weights. The weight belongs to the chosen path,
  not to its endpoint. In particular, two paths with the same endpoint can have different weights.

#thm([Proposition 5.1.])[
  (A path criterion).  #emph[Suppose that for every integer $n gt.eq
    1$ there are two paths with the same endpoint and weights $lambda > 0$ and $mu gt.eq
    0$ satisfying $mu \/ lambda < 1 \/ n$. Then $A$ is Euclidean Ramsey.]
] <paths:criterion>

We prove the proposition in three steps. We first reduce to colorings of $cal(E)$ and synchronize the available
  path weights. We then develop the ultrafilter facts needed to realize group products by finite strings.
  Finally, the Hales–Jewett theorem chooses the variable positions of a monochromatic string family.

=== 5.1 Finite dimensions and synchronized weights <finite-dimensions-and-synchronized-weights>

The following finite-dimensional reduction is the compactness principle used in Euclidean Ramsey theory;
  compare #cite(label("egm-rss")) Proposition 4. We include its proof for arbitrary colorings.

#thm([Lemma 5.2.])[
  #emph[Fix an integer $r gt.eq 2$. If every $r$-coloring of $cal(E)$ contains a monochromatic congruent copy of
    $A$, then the same holds for every $r$-coloring of $bb(R)^D$, for some finite $D$.]
] <paths:compactness>

#proof[
  Suppose instead that every $bb(R)^D$ admits an $r$-coloring avoiding $A$.
    Consider the compact product space ${ 1 \, dots.h \, r }^(cal(E))$.
    For each ordered congruent copy $\( b_1 \, dots.h \, b_s \)$ of $A$ in $cal(E)$,
    impose the condition that the colors of the $b_i$ are not all equal.
    This is a clopen condition depending on finitely many coordinates of the product space.
  Every finite collection of these conditions involves finitely many finite-support vectors.
    They all lie in the first $D$ coordinate positions for some $D$.
    An avoiding coloring of this $bb(R)^D$, extended arbitrarily to $cal(E)$, satisfies the finite collection.
    Compactness therefore gives a coloring satisfying all the conditions, contrary to the hypothesis. ◻
]

#thm([Lemma 5.3.])[
  #emph[Fix an integer $n gt.eq 1$. Let two paths have the same endpoint and weights $lambda > 0$ and $mu gt.eq
    0$. If $rho = mu \/ lambda < 1 \/ n$, then there is an endpoint $w in K^s$ admitting a path of weight $1 \/
    t$ for every integer $1 lt.eq t lt.eq n$.]
] <paths:synchronization>

#proof[
  Set
  $ alpha_t = frac(1 \/ t - rho, 1 - rho) wide \( 1 lt.eq t lt.eq n \) . $
  These numbers satisfy $0 < alpha_n < dots.h.c < alpha_1 = 1$. Partition $\[ 0 \, 1 \]$ at these points.
    For each resulting interval of length $l > 0$, apply to both paths the endomorphism of $K$ defined by
  $ xi_z mapsto xi_(sqrt(l \/ lambda) thin z) . $
  It preserves diagonal factors and multiplies every copy-factor weight by $l \/ lambda$.
    The two new paths thus have the same endpoint and weights $l$ and $rho l$.
  Concatenate the interval paths in increasing interval order.
    The resulting endpoint is independent of which of the two paths is chosen on each interval.
    For a given $t$, choose the larger weight on the intervals before $alpha_t$ and the smaller weight on the
    remaining intervals. The total weight is
  $ alpha_t + rho \( 1 - alpha_t \) = 1 / t . $
  The fixed order of concatenation gives one endpoint $w$ for all $t$; no commutation of factors is used. ◻
]

=== 5.2 Realizing ultrafilter products by strings <realizing-ultrafilter-products-by-strings>

Let $cal(S)$ be the monoid of finite strings on the alphabet $cal(E)$,
  with concatenation as multiplication and the empty string $epsilon.alt$ as identity.
  Choose pairwise disjoint infinite coordinate blocks in $cal(E)$, and let $J_j : cal(E) arrow.r
  cal(E)$ be the corresponding linear isometric embeddings, one for each $j gt.eq 1$.
  For a finite string $z = \( z_1 \, dots.h \, z_L \)$, define

$ Phi \( z \) = sum_(j = 1)^L J_j z_j . $

For two strings of the same length,

#[#set math.equation(numbering: n => "(17)")
 $ parallel Phi \( z \) - Phi \( z' \) parallel^2 = sum_(j = 1)^L parallel z_j -
   z'_j parallel^2 . $ <paths:string-distance>]

Thus we seek a realization in which each copy factor supplies its prescribed one-letter strings,
  while each diagonal factor supplies one common string in all $s$ roles.
  Common strings will contribute zero to the squared distances;
  the remaining contribution will be the path weight times the corresponding squared distance in $A$.
  Diagonal factors may contain group inverses, so they cannot in general be evaluated directly in the string
  monoid. We instead map $K$ into a group of ultrafilters on $cal(S)$ and then realize its common factors by
  common strings.

The following standard construction fixes the multiplication convention;
  see #cite(label("hindman-strauss")) Theorem 2.5, Corollary 2.6, and Theorem 1.42.
  The classical idempotent argument also appears in Ellis’s semigroup lemma #cite(label("ellis-idempotent"))
  Lemma 1; taking the opposite semigroup matches the one-sided continuity convention used here.

An ultrafilter on $cal(S)$ is a maximal proper filter of subsets of $cal(S)$.
  Write $beta cal(S)$ for the space of all such ultrafilters. For $B subset.eq cal(S)$, its basic clopen set is

$ overline(B) = { u in beta cal(S) : B in u } . $

This space is compact and Hausdorff: the ultrafilter conditions define a closed subset of ${ 0 \,
  1 }^(cal(P) \( cal(S) \))$. For a string $x$, put $x^(- 1) B = { y in cal(S) : x y in B }$;
  this notation denotes a preimage under concatenation, not a string inverse. Define the product of ultrafilters by

#[#set math.equation(numbering: n => "(18)")
 $ B in u v quad arrow.l.r.double quad { x in cal(S) : x^(- 1) B in v } in u . $ <paths:ultrafilter-product>]

The principal ultrafilter at $x$ is denoted by $delta_x$.

#thm([Lemma 5.4.])[
  #emph[The operation in (18) makes $beta cal(S)$ a compact right-topological semigroup with identity
    $delta_epsilon.alt$. It contains an idempotent $p$ such that $p \( beta cal(S) \) p$ is a group with identity $p$.]
] <paths:corner-group>

#proof[
  For fixed $v$, the map $B mapsto { x : x^(- 1) B in v }$ preserves finite intersections and complements.
    Thus (18) defines an ultrafilter $u v$. For $u \, v \, w in beta cal(S)$,
    both parenthesizations of their product contain $B$ precisely when
  $ { x : { y : { z : x y z in B } in w } in v } in u . $
  This proves associativity. For fixed $v$, the inverse image of $overline(B)$ under $u mapsto u
    v$ is $overline({ x : x^(- 1) B in v })$, so right translation is continuous.
    The assertion about $delta_epsilon.alt$ follows directly from the definition.
  Choose a minimal nonempty compact left ideal $L_0$ in $beta cal(S)$.
    Such an ideal exists because every chain of nonempty compact left ideals has a nonempty intersection.
    For each $v in L_0$, the set $\( beta cal(S) \) v$ is a nonempty compact left ideal contained in $L_0$, hence
  #[#set math.equation(numbering: n => "(19)")
   $ \( beta cal(S) \) v = L_0 . $ <paths:minimal-left-ideal>]
  The ideal $L_0$ is also a compact subsemigroup.
  Choose a minimal nonempty compact subsemigroup $H_0 subset.eq L_0$.
    For $x in H_0$, the set $H_0 x$ is compact and is a subsemigroup:
    $\( a x \) \( b x \) = a \( x b \) x in H_0 x$ for $a \, b in H_0$. Minimality gives $H_0 x = H_0$. Consequently
  $ { y in H_0 : y x = x } $
  is nonempty, compact, and a subsemigroup. It equals $H_0$ by minimality, so $x^2 = x$.
    In particular $L_0$ contains an idempotent $p$.
  The corner $G = p \( beta cal(S) \) p$ is a monoid with identity $p$.
    Every $y in G$ lies in $L_0$, so (19) gives $p = v y$ for some $v in beta cal(S)$. Since $p y = y$,
  $ \( p v p \) y = p v y = p . $
  Thus every element of $G$ has a left inverse in $G$. A monoid with this property is a group:
    if $a y = p$ and $b a = p$, then $b = b \( a y \) = \( b a \) y = y$, whence $y a = p$ as well. ◻
]

The next lemma explains why common ultrafilter factors can be replaced by common strings.
  This is the step that will preserve the distances between the different roles in a monochromatic configuration.

#thm([Lemma 5.5.])[
  (Simultaneous realization).  #emph[Let $q_(i \, j) in beta cal(S)$ for $1 lt.eq i lt.eq s$ and $1 lt.eq j lt.eq
    M$, where $M gt.eq 1$. Suppose that every column $j$ has one of the following specified forms:]
  + #emph[$q_(i \, j) = q_j$ is independent of $i$;]
  + #emph[$q_(i \, j) = delta_(z_(i \, j))$ for prescribed strings $z_(i \, j) in cal(S)$.]
  #emph[If $B in q_(i \, 1) dots.h.c q_(i \, M)$ for every $i$,
    there are strings $x_(i \, j)$ such that all products $x_(i \, 1) dots.h.c x_(i \, M)$ belong to $B$,
    with $x_(i \, j)$ independent of $i$ in each column of the first form and $x_(i \, j) =
    z_(i \, j)$ in each column of the second form.]
] <paths:realization>

#proof[
  Choose the strings from left to right. Before column $j$,
    let $P_i$ be the already chosen prefix and maintain the invariant
  $ P_i^(- 1) B in q_(i \, j) dots.h.c q_(i \, M) . $
  Initially $P_i = epsilon.alt$. Put $v_i = q_(i \, j + 1) dots.h.c q_(i \, M)$,
    interpreting an empty product here as $delta_epsilon.alt$. By (18), the set
  $ E_i = { x : x^(- 1) \( P_i^(- 1) B \) in v_i } $
  belongs to $q_(i \, j)$. In a common column, the finite intersection $⋂_i
    E_i$ belongs to the common ultrafilter and is nonempty; choose the same string from it for all $i$.
    In a prescribed principal column, $z_(i \, j) in E_i$, so choose that string.
    Replacing $P_i$ by $P_i x_(i \, j)$ preserves the invariant.
    After the last column it says $P_i^(- 1) B in delta_epsilon.alt$, which is precisely $P_i in B$. ◻
]

We now have both ingredients for the word construction: a group in which the path endpoints can be evaluated,
  and a way to realize their products by strings while choosing every common factor equally in all roles.

=== 5.3 The Hales–Jewett step <the-halesjewett-step>

#proof[
  Fix $r gt.eq 2$ and an arbitrary coloring $c : cal(E) arrow.r { 1 \, dots.h \, r }$.
    Choose $n$ such that every $r$-coloring of ${ 1 \, dots.h \, s }^n$ has a monochromatic combinatorial line,
    by the Hales–Jewett theorem #cite(label("hales-jewett"));
    see also Shelah’s proof and primitive-recursive bound #cite(label("shelah")) p. 686 and Section 1.
    We use only existence of the length. Such a line has a nonempty set of variable positions,
    occupied by one common letter, and fixed letters in all other positions.
  In the group formulation of Leader, Russell and Walters #cite(label("lrw-transitive")) Conjecture C and the
    following discussion, the number of varying positions is prescribed before coloring; without that restriction,
    ordinary Hales–Jewett applies. Here we allow the line to choose that number and prepare all the required path
    weights in advance. The hypothesis and Lemma 12 give an endpoint $w = \( w_1 \, dots.h \, w_s \) in
    K^s$ and a path of weight $1 \/ t$ ending at $w$ for every $1 lt.eq t lt.eq n$.
  Color $cal(S)$ by $c compose Phi$, and write its color classes as $B_1 \, dots.h \, B_r$.
  Choose $p$ as in Lemma 13. The freeness of $K$ gives a homomorphism
  $ psi : K arrow.r p \( beta cal(S) \) p \, wide psi \( xi_z \) = p delta_(\( z \)) p \, $
  where $\( z \)$ is the one-letter string with entry $z$. Color a word $i_1 dots.h.c
    i_n$ by the unique index $k$ for which
  $ B_k in psi \( w_(i_1) \) dots.h.c psi \( w_(i_n) \) . $
  Every ultrafilter contains exactly one class of a finite partition, so this defines an $r$-coloring.
  Take a monochromatic combinatorial line and let $t$ be its number of variable positions.
    Figure 1 records the order of these choices.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Fix the number of colors $r$.#linebreak()Choose a Hales--Jewett length $n$.]]])])
  content((6.853, 0), [#box(width: 5.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Prepare one endpoint $w$#linebreak()with paths of weights $1, frac(1, 2) , dots.h , frac(1, n)$.]]])])
  content((6.853, -2.2), [#box(width: 5.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Color words using $w$.#linebreak()A monochromatic line has $t$ variable positions.]]])])
  content((0, -2.2), [#box(width: 5.953cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Use the path of weight $1"/"t$#linebreak()at each variable position.#linebreak()Squared-distance factor: $t(1"/"t)=1$.]]])])
  line((2.976, 0), (3.876, 0), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#000073"))))
  line((6.853, -0.6), (6.853, -1.6), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#000073"))))
  line((3.876, -2.2), (2.976, -2.2), stroke: (paint: rgb("#000073"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#000073"))))
})],
    caption: [Figure 1: The order of choices in the path criterion. Every possible variable count is accommodated before the word coloring is defined. Choosing a path representation later leaves its endpoint unchanged; common factors become common strings, so only the variable blocks contribute to pairwise distances. ],
  ) <fig:synchronization>
  For each of the line’s $s$ words, expand the factor at every variable position using the chosen path ending at
    $w$ with weight $1 \/ t$. A diagonal path factor contributes one common ultrafilter $psi \( g \)$.
    A copy factor contributes $p delta_(\( b_i \)) p$ in role $i$:
    the two $p$ factors are common and the middle factor is principal at a prescribed one-letter string.
    Unexpanded fixed positions are common factors as well. The identity of the corner group is $p$;
    if an empty group product occurs, it is retained as this common factor.
    The expanded products therefore have the column forms required by Lemma 14,
    and all contain the same color class $B_k$.
  Apply that lemma. It produces strings $z^(\( 1 \)) \, dots.h \, z^(\( s \))$ in $B_k$.
    Every common factor was realized by the same string in all roles, and every varying factor has length one.
    Hence the resulting strings have equal lengths and their entries align.
    Common strings contribute zero to their pairwise squared distances.
    Each of the $t$ expanded paths contributes $parallel a_i - a_j parallel^2 \/ t$ by its weight.
    Equation (17) consequently gives
  $ parallel Phi \( z^(\( i \)) \) - Phi \( z^(\( j \)) \) parallel^2 = t 1 / t parallel a_i - a_j parallel^2 =
    parallel a_i - a_j parallel^2 . $
  Their images form a monochromatic congruent copy of $A$ in $cal(E)$.
    Lemma 11 now supplies a finite forcing dimension for this $r$. Since $r$ was arbitrary, $A$ is Euclidean Ramsey. ◻
]

== 6 From coordinate permutations to equal path endpoints <sec:groups>

We now turn the two images of Lemma 7 into the equal-endpoint paths required by Proposition 10.
  Recall that $cal(E) = bb(R)^(\( bb(N) \))$, that $K$ is the free group on the letters $xi_z$ for $z in cal(E)$,
  and that path weights count the squared-distance scales of their copy factors.
  The two images give paths of very different weights. Their endpoints need not agree.
  Our task is to correct those endpoints at a cost small relative to the larger weight.

=== 6.1 Corrections supported on individual coordinates <corrections-supported-on-individual-coordinates>

Let $M subset K^s$ be the monoid generated by the diagonal subgroup $Delta
  K$ and the tuples $X_b = \( xi_(b_i) \)_(i = 1)^s$ associated to ordered congruent copies $b$ of $A$.
  Thus a chosen expression for an element of $M$ is a path using only copy factors of weight one.
  Its #emph[degree] is the number of those factors; diagonal factors have degree zero.
  Degrees always refer to chosen expressions.

Suppose two paths have endpoints $D_(+) \, D_(-) in K^s$. If we can write

$ D_(+)^(- 1) D_(-) = u v^(- 1) wide \( u \, v in M \) \, $

then $D_(+) u = D_(-) v$. Appending the chosen expressions for $u$ and $v$ therefore gives equal endpoints,
  with added weights $deg u$ and $deg v$, respectively. We will make their sum small relative to the larger
  original path weight, so that correcting the endpoints retains the small ratio of weights.

To construct these corrections, let

$ N = ker #scale(x: 120%, y: 120%)[\(] K arrow.r bb(Z) \, med xi_z mapsto 1 #scale(x: 120%, y: 120%)[\)] . $

For distinct labels $i \, j$, write $M_(i j)$ for the image of $M$ under projection onto coordinates $i \, j$.

#thm([Lemma 6.1.])[
  #emph[For every $i eq.not j$, the monoid $M_(i j)$ is a group containing $N times N$.]
] <groups:pairs>

#proof[
  Put $r = parallel a_i - a_j parallel > 0$. Every ordered pair $z \,
    z' in cal(E)$ at distance $r$ extends to an ordered congruent copy of $A$.
    Indeed, send the direction of $a_j - a_i$ to $\( z' - z \) \/ r$,
    extend it to an orthonormal frame for the affine span of $A$, and translate to send $a_i$ to $z$.
    The frame can be chosen inside a finite-dimensional coordinate subspace of $cal(E)$.
  Set $x = xi_z$ and $y = xi_(z')$. Both $\( x \, y \)$ and $\( y \, x \)$ therefore belong to $M_(i j)$, and
  $ \( x \, y \)^(- 1) = \( x^(- 1) \, x^(- 1) \) \( y \, x \) \( y^(- 1) \, y^(- 1) \) in M_(i j) . $
  The diagonal generators are also invertible within $M_(i j)$, so this monoid is a group. It contains
  $ \( x \, y \) \( y^(- 1) \, y^(- 1) \) = \( x y^(- 1) \, 1 \) \,
    wide \( x \, y \) \( x^(- 1) \, x^(- 1) \) = \( 1 \, y x^(- 1) \) \, $
  and their conjugates by diagonal elements.
  The graph on $cal(E)$ joining points at distance $r$ is connected.
    To see this, subdivide any displacement into pieces of length at most $2 r$.
    The endpoints of each piece have a common point at distance $r$:
    choose an appropriate perpendicular displacement from their midpoint.
    An additional coordinate supplies the perpendicular direction if needed.
    Differences of letters along graph edges consequently generate, after taking their normal closure in $K$,
    all differences $xi_z xi_(z')^(- 1)$. That normal closure is $N$,
    since identifying all free generators gives the infinite cyclic group.
    The two displayed types of elements and diagonal conjugation thus give $N times N subset M_(i j)$. ◻
]

For $g in K$, let $g^(\[ i \]) in K^s$ have value $g$ in coordinate $i$ and identity in every other coordinate. Define

$ L_i = { g in K : g^(\[ i \]) = u v^(- 1) upright(" for some ") u \, v in M } . $

We call $u v^(- 1)$ a #emph[right fraction]. Its cost, with chosen expressions for $u \, v$,
  is the sum of their degrees. For $g in L_i$, let $c_i \( g \)$ be the minimum cost of a right fraction
  representing $g^(\[ i \])$. The minimum exists because its possible costs form a nonempty set of nonnegative integers.

We will only multiply right fractions when their supports permit an explicit construction of a new denominator.
  No closure assertion for the whole set $M M^(- 1)$ is needed.

#thm([Lemma 6.2.])[
  #emph[Each $L_i$ is a normal subgroup of $K$, and its cost satisfies
$ c_i \( g^(- 1) \) = c_i \( g \) \, wide c_i \( k g k^(- 1) \) = c_i \( g \) \, wide c_i \( g h \) lt.eq
  c_i \( g \) + c_i \( h \) $

 for $g \, h in L_i$ and $k in K$. Every tuple $\( g_i \)_(i = 1)^s$ with $g_i in
   L_i$ has a represented right fraction of cost at most $sum_i c_i \( g_i \)$. Moreover,
#[#set math.equation(numbering: n => "(20)")
 $ N^(\( s - 2 \)) subset L_i wide \( 1 lt.eq i lt.eq s \) \, $ <groups:derived-inclusion>]

 where $N^(\( 0 \)) = N$ and $N^(\( r + 1 \)) = \[ N^(\( r \)) \, N^(\( r \)) \]$.]
] <groups:fractions>

#proof[
  Inversion of a right fraction interchanges its numerator and denominator. If $d = Delta \( k \)$, then
  $ \( k g k^(- 1) \)^(\[ i \]) = \( d u \) \( d v \)^(- 1) quad upright("whenever") quad g^(\[ i \]) = u v^(- 1) . $
  These operations preserve the represented cost. Applying each operation in both directions proves inversion and
    conjugation invariance.
  The following multiplication rule supplies the cost estimate.
    Given any represented right fraction $u v^(- 1)$ and $g in L_i$, put $h =
    v_i^(- 1) g v_i$ and choose $h^(\[ i \]) = a b^(- 1)$ of cost $c_i \( h \) = c_i \( g \)$. Then
  #[#set math.equation(numbering: n => "(21)")
   $ u v^(- 1) g^(\[ i \]) = u h^(\[ i \]) v^(- 1) = u a b^(- 1) v^(- 1) = \( u a \) \( v b \)^(- 1) .
     $ <groups:single-multiplication>]
  The resulting cost is at most the previous cost plus $c_i \( g \)$.
    This proves product closure and subadditivity for $L_i$; together with inversion and conjugation it proves
    normality. Successively applying (21) to the single-coordinate factors of $\( g_i \)_i$ proves the asserted
    tuple cost bound.
  For the derived subgroup inclusion, we also need a multiplication rule for fractions supported on a pair of
    coordinates. Suppose that $z = c d^(- 1)$ is such a fraction, supported on a pair $J$,
    and let $u v^(- 1)$ be any right fraction. Since the projection of $M$ onto $J$ is a group,
    choose $b in M$ such that $t = v b$ is the identity on $J$.
    The tuples $t$ and $z$ commute, because their supports are disjoint. Consequently
  #[#set math.equation(numbering: n => "(22)")
   $ u v^(- 1) z = u b t^(- 1) z = u b z t^(- 1) = u b c d^(- 1) t^(- 1) = \( u b c \) \( t d \)^(- 1) .
     $ <groups:pair-multiplication>]
  This is a right fraction of finite cost. We require no bound on the cost of the auxiliary $b$.
  We now prove (20) by induction on the number of coordinates.
    The proof applies to any submonoid of $K^s$ containing the diagonal whose pair projections are groups
    containing $N times N$. For $s = 2$, the whole monoid is its pair projection and contains $N times N$,
    which proves the claim. For $s gt.eq 3$, fix distinct indices $i \, j \, k$.
    The monoid obtained by projecting away $j$ satisfies the same abstract hypotheses.
    By induction, every $a in N^(\( s - 3 \))$ has a right fraction in that projection supported at $i$.
    Lift its numerator and denominator to $M$. Their quotient is a right fraction $z_a$ supported on ${ i \, j }$,
    with value $a$ at $i$. Projecting away $k$ similarly gives a right fraction $z_b$ supported on ${ i \,
    k }$ with any prescribed $b in N^(\( s - 3 \))$ at $i$.
  The four factors of $z_a z_b z_a^(- 1) z_b^(- 1)$ are pair-supported right fractions;
    inverses remain fractions by interchanging numerator and denominator.
    Repeated use of (22) makes their product a right fraction.
    Its only possibly nonidentity coordinate is $i$, where its value is $\[ a \, b \]$.
    Thus $\[ a \, b \] in L_i$. Since $L_i$ is a subgroup, it contains the subgroup generated by all these
    commutators, namely $N^(\( s - 2 \))$. ◻
]

Set

#[#set math.equation(numbering: n => "(23)")
 $ L = N^(\( s - 2 \)) \, wide c \( g \) = max_(1 lt.eq i lt.eq s) c_i \( g \) quad \( g in L \) . $ <groups:cost>]

The subgroup $L$ is normal in $K$. Lemma 16 shows that $c$ is finite, symmetric under inversion, subadditive,
  and invariant under conjugation by every element of $K$. We have therefore identified a subgroup of allowable
  endpoint corrections and a cost for each one. We next construct long paths for which the needed corrections have
  small cost relative to their degree.

=== 6.2 Averaging over coordinate permutations <averaging-over-coordinate-permutations>

Let $H$ be a finite group of coordinate permutations acting on $cal(E)$,
  and let $Z subset cal(E)$ be a finite $H$-invariant set. Consider represented tuples $w = \( w_x \)_(x in Z) in
  K^Z$ obtained by multiplying diagonal factors and factors

$ \( xi_(h x) \)_(x in Z) \, wide h in H . $

The degree of such an expression is the number of factors of the latter kind.
  Right multiplication by a diagonal element has degree zero. Replacing $w_x$ by $w_(h x)$ preserves the degree:
  it sends a generator indexed by $g in H$ to the generator indexed by $g h$.

#thm([Lemma 6.3.])[
  #emph[Let $H$ be a finite group of coordinate permutations of $cal(E)$,
    and let $Z subset cal(E)$ be a finite $H$-invariant set. For every $delta > 0$,
    there is a tuple $w in K^Z$ represented by diagonal factors and factors $\( xi_(h x) \)_(x in Z)$, $h in H$,
    with degree $m > 0$, for which
#[#set math.equation(numbering: n => "(24)")
 $ w_x w_y^(- 1) in L \, wide c \( w_x w_y^(- 1) \) lt.eq delta m quad upright("whenever ") x \,
   y upright(" belong to the same ") H upright("-orbit") . $ <groups:orbit-bound>]

]
] <groups:averaging>

#proof[
  We first arrange membership in $L$, then make the costs small.
    Start with $w_x = xi_x$, represented with degree one; its differences $w_x w_y^(- 1)$ belong to $N$.
  Suppose the differences on an orbit $O$ belong to $N^(\( r \))$.
    Choose $x_0 in O$ and right-multiply by the diagonal element $w_(x_0)^(- 1)$.
    After this operation, every value on $O$ belongs to $N^(\( r \))$,
    and every difference on every orbit is unchanged. Replace the resulting tuple by
  #[#set math.equation(numbering: n => "(25)")
   $ w'_x = product_(h in H) w_(h x) \, $ <groups:derived-average>]
  using a fixed order on $H$. For $x in O$, the list $\( h x \)_(h in H)$ visits every point of $O$ with the same
    multiplicity $\| H \| \/ \| O \|$. The products in (25) therefore have the same image in the abelian group
    $N^(\( r \)) \/ N^(\( r + 1 \))$ for every $x in O$. Their differences belong to $N^(\( r + 1 \))$.
  This procedure preserves any normal-subgroup condition already obtained on another orbit.
    Indeed, if $w_x w_y^(- 1) in G$ there for a normal subgroup $G lt.closed K$,
    corresponding factors of the two products have the same image in $K \/ G$.
    Their products have the same image as well. Process the finitely many orbits,
    increasing the derived depth on each to $s - 2$. Every degree stays positive,
    and we obtain membership in $L$ for all within-orbit differences.
    When $s = 2$, the initial tuple already has this property.
  Fix one orbit $O$. Right-normalize at $x_0 in O$ once more, so all values on $O$ lie in $L$, and write $B =
    max_(x in O) c \( w_x \)$. Put $h = \| H \|$. If $h = 1$, all orbits are singletons and (24) already holds.
    Hence suppose $h gt.eq 2$. Repeatedly perform the operation
  #[#set math.equation(numbering: n => "(26)")
   $ w'_x = (product_(g in H) w_(g x)) w_(x_0)^(- 1) . $ <groups:contract>]
  For each $x in O$, one factor in the product is $a = w_(x_0)$. Write the product as $P a Q$. Then
  $ w'_x = P \( a Q a^(- 1) \) \, wide c \( w'_x \) lt.eq c \( P \) + c \( Q \) lt.eq \( h - 1 \) B . $
  All new values on $O$ still lie in $L$, and their represented degree is $h$ times the preceding degree.
    Thus, after $k$ repetitions starting from degree $m_0$, the maximum difference cost divided by degree is at most
  #[#set math.equation(numbering: n => "(27)")
   $ frac(2 B, m_0) (frac(h - 1, h))^k . $ <groups:contraction-rate>]
  Here the factor two uses $c \( w_x w_y^(- 1) \) lt.eq c \( w_x \) + c \( w_y \)$. The bound tends to zero.
  It remains to check that treating this orbit does not spoil a bound on another orbit.
    If $a_j b_j^(- 1) in L$ for $1 lt.eq j lt.eq h$, conjugation invariance and subadditivity give
  #[#set math.equation(numbering: n => "(28)")
   $ c #scale(x: 120%, y: 120%)[\(] \( a_1 dots.h.c a_h \) \( b_1 dots.h.c b_h \)^(- 1)
     #scale(x: 120%, y: 120%)[\)] lt.eq sum_(j = 1)^h c \( a_j b_j^(- 1) \) . $ <groups:product-bound>]
  For completeness, write $A_j = a_1 dots.h.c a_j$ and $B_j = b_1 dots.h.c b_j$, with $A_0 = B_0 = 1$. The identity
  $ A_j B_j^(- 1) = #scale(x: 120%, y: 120%)[\(] A_(j - 1) \( a_j b_j^(- 1) \) A_(j - 1)^(- 1)
    #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] A_(j - 1) B_(j - 1)^(- 1) #scale(x: 120%, y: 120%)[\)] $
  proves (28) inductively. Consequently the product in (26) multiplies the maximum difference cost on any other
    orbit by at most $h$, while multiplying the degree by exactly $h$.
    The appended common right factor does not change differences. Their cost divided by degree cannot increase.
    We may therefore achieve the bound $delta$ on one orbit after another; there are only finitely many orbits. ◻
]

=== 6.3 Equal endpoints and completion of sufficiency <equal-endpoints-and-completion-of-sufficiency>

We can now compare the two paths supplied by coordinate permutations.
  The preceding lemma makes their endpoint discrepancies inexpensive,
  and Lemma 16 realizes all discrepancies by actual paths of unit-scale copies.

#thm([Proposition 6.4.])[
  #emph[Suppose $q > 0$ and $f_i \, g_i in bb(R)^ell$ satisfy
$ parallel f_i - f_j parallel^2 = parallel a_i - a_j parallel^2 \, wide parallel g_i - g_j parallel^2 =
  q parallel a_i - a_j parallel^2 quad \( 1 lt.eq i \, j lt.eq s \) \, $

 and each $g_i$ is a coordinate permutation of $f_i$. For every $delta >
   0$ there exist two paths with the same endpoint and weights $lambda > 0$ and $mu gt.eq 0$ such that
$ mu / lambda lt.eq q + s delta . $

]
] <groups:endpoints>

#proof[
  Embed $bb(R)^ell$ into $cal(E)$, let $H$ be its full coordinate permutation group,
    acting trivially on the remaining coordinates, and let $Z$ be the union of the $H$-orbits of the $f_i$ and
    $g_i$. It is finite, and $f_i \, g_i$ lie in the same orbit for each $i$.
    Apply Lemma 17 with the given $delta$ and let $m > 0$ be the degree of its represented tuple $w$.
  Restricting the same expression to the labels $f_i$ gives the endpoint $D_(+) = \( w_(f_i) \)_(i = 1)^s$ of a
    path of weight $m$. Restricting it to the labels $g_i$ gives the endpoint $D_(-) = \( w_(g_i) \)_(i = 1)^s$ of
    a path of weight $q m$. Indeed, each counted factor acts by a coordinate permutation,
    so it preserves the corresponding distances; diagonal factors stay diagonal.
  For each $i$, put $r_i = w_(f_i) w_(g_i)^(- 1)$. By (24), $r_i in L$ and $c \( r_i \) lt.eq delta m$.
    The $i$th component of $D_(+)^(- 1) D_(-)$ is
  $ w_(f_i)^(- 1) w_(g_i) = w_(f_i)^(- 1) r_i^(- 1) w_(f_i) \, $
  so it too belongs to $L$ and has cost at most $delta m$. Lemma 16 supplies represented $u \, v in M$ such that
  $ D_(+)^(- 1) D_(-) = u v^(- 1) \, wide deg u + deg v lt.eq s delta m . $
  Thus $D_(+) u = D_(-) v$. Writing $a = deg u$ and $b = deg v$, the two resulting paths have weights
  $ lambda = m + a > 0 \, wide mu = q m + b gt.eq 0 \, wide mu / lambda lt.eq frac(q m + b, m) lt.eq q + s delta . $
  ◻
]

#proof[
  #emph[Completion of the sufficiency implication in Theorem 1.] Assume the matrix condition of the theorem.
    By Proposition 2, the tensor condition (2) holds. For every integer $n gt.eq 1$,
    Lemma 7 supplies two images as in Proposition 18 with $0 < q < 1 \/ \( 2 n \)$.
    Apply that proposition with $delta = 1 \/ \( 2 s n \)$. It gives equal-endpoint paths whose weight ratio is
    strictly less than $1 \/ n$. Proposition 10 now implies that $A$ is Ramsey.
    All choices are made after fixing $n$; no bound uniform in $n$ on the degrees or the number of coordinates is
    required. ◻
]

== 7 Geometric consequences and examples <cons:section>

The criterion separates two different questions about a spherical set:
  whether its ordinary quadratic equations admit the required identity block,
  and whether that solution lifts to the tensor ring. We first give positive examples,
  then exhibit two failures of the lift.

#thm([Corollary 7.1.])[
  #emph[Every finite Euclidean Ramsey set is spherical.]
] <cons:spherical>

#proof[
  A singleton is spherical. Otherwise use the notation and a matrix $P$ from Theorem 1, and put $H = m_F \( P \)$,
    entrywise. Multiplying the evaluation equations gives
  $ parallel a_i parallel^2 + ell dot.op a_i + c = 0 \, wide c = H_00 \, wide ell_alpha = H_(0 alpha) +
    H_(alpha 0) quad \( 1 lt.eq alpha lt.eq d \) . $
  Thus all points lie on the sphere with center $- ell \/ 2$ and squared radius $parallel ell parallel^2 \/ 4 -
    c$. The radius is positive because the set has at least two distinct points.
    No symmetry of the constant row and column of $H$ is needed. ◻
]

A finite Euclidean set is #emph[transitive] if its distance-preserving permutations act transitively on its points.

#thm([Corollary 7.2.])[
  #emph[Every nonempty subset of a finite transitive Euclidean set is Ramsey.]
] <cons:transitive>

#proof[
  Singletons are immediate. Let $A = { a_1 \, dots.h \, a_s } subset bb(R)^d$, with $s gt.eq 2$,
    affinely span $bb(R)^d$, and suppose an isometric embedding maps $a_i$ to $y_i$ in a finite transitive set $Y
    subset bb(R)^n$. Write $H$ for the finite group of distance-preserving permutations of $Y$.
    For each $h in H$, the map $a_i mapsto h \( y_i \)$ extends to an affine isometry.
    Let $w_(h j) in W = bb(R)^(1 + d)$ be its $j$th affine coordinate row,
    so that $e_i \( w_(h j) \) = \( h \( y_i \) \)_j$. The gradient Gram matrix of these $n$ rows is $I_d$.
  Let $c_(h j) = \( \( h \( y_1 \) \)_j \, 0 \) in W$, a constant affine row. The symmetric rational tensor
  $ T = frac(1, \| H \|) sum_(h in H) sum_(j = 1)^n #scale(x: 120%, y: 120%)[\(] w_(h j) ⊗ w_(h j) -
    c_(h j) ⊗ c_(h j) #scale(x: 120%, y: 120%)[\)] $
  has $G \( T \) = I_d$. For each $i$, the multiset $\( h \( y_i \) \)_(h in H)$ contains every point of $Y$
    exactly $\| H \| \/ \| Y \|$ times. Consequently
  $ sum_(h \, j) \( h \( y_i \) \)_j ⊗ \( h \( y_i \) \)_j = sum_(h \, j) \( h \( y_1 \) \)_j ⊗ \( h \( y_1 \) \)_j \, $
  and $\( e_i ⊗ e_i \) \( T \) = 0$. Proposition 2 and Theorem 1 now give the Ramsey property. ◻
]

Quadratic interpolation gives another source of tensor certificates.
  The row-independence hypothesis below says that quadratic polynomials can prescribe arbitrary values on the
  configuration.

#thm([Proposition 7.3.])[
  #emph[Let $A = { a_1 \, dots.h \, a_s } subset bb(R)^d$ be spherical and affinely span $bb(R)^d$.
    Put $p_i = \( 1 \, a_i \)^(sans(T))$ and let $F$ be its coordinate field. If the $s$ row vectors
$ \( p_(i alpha) p_(i beta) \)_(0 lt.eq alpha \, beta lt.eq d) quad \( 1 lt.eq i lt.eq s \) $

 are linearly independent over $F$, then $A$ is Ramsey.]
] <cons:quadratic>

#proof[
  The singleton case is immediate, so assume $s gt.eq 2$. Write $N = \( d + 1 \)^2$.
    Sphericity gives a real matrix with spatial block $I_d$ and quadratic values zero at every $p_i$.
    These requirements are a linear system over $F$, so a solution exists over $F$ as well,
    by Gaussian elimination. Denote such a matrix, written as a vector in $F^N$, by $h$.
  Let $D in "Mat"_(s times N) \( B \)$ be the tensor evaluation matrix,
    whose entry in row $i$ and column $\( alpha \, beta \)$ is $p_(i alpha) ⊗ p_(i beta)$.
    Lift $h$ to $b in B^N$ by applying $x mapsto x ⊗ 1$ entrywise.
    The assumed row independence allows us to select $s$ columns of $D$ whose square submatrix $M$ has
  $ delta = m_F \( det M \) eq.not 0 . $
  Let $iota : B^s arrow.r B^N$ insert a vector into these selected coordinates, so that $D iota = M$.
    Multiplying by $det M$ allows us to cancel the tensor evaluation error $D b$ through the selected columns:
    the adjugate identity gives
  $ z = \( det M \) b - iota "adj" \( M \) D b in ker D . $
  Since $m_F \( D \) h = 0$, multiplication gives $m_F \( z \) = delta h$.
    Multiplying $z$ by $delta^(- 1) ⊗ 1$ therefore produces a solution of the criterion in Theorem 1.
    This argument does not require $det M$ to be a unit of $B$. ◻
]

For at most five circle points, products of two line equations supply the required interpolation.
  The same observation appears in Pálvölgyi’s analysis of derivation obstructions
  #cite(label("palvolgyi-heptagon")) proof of Theorem A.2.

#thm([Corollary 7.4.])[
  #emph[Every nonempty set of at most five distinct points on a circle is Ramsey.
    In particular, every cyclic quadrilateral is Ramsey.]
] <cons:quadrilateral>

#proof[
  Work in the plane of the circle and extend the set, if necessary, to five distinct points on that circle.
    Let $F$ be the coordinate field of the resulting five-point set.
    Fix one of these points $a_i$, partition the other four into two pairs,
    and take the product of affine equations for the two lines through those pairs.
    No three circle points are collinear, so this quadratic polynomial vanishes at the other four points and is
    nonzero at $a_i$. Its coefficients lie in the coordinate field $F$.
    Rescaling the five resulting polynomials shows that quadratic evaluation onto $F^5$ is surjective.
    Its five rows are therefore independent, and Proposition 21 makes the five-point set Ramsey.
    A monochromatic copy of that set contains a copy of the original set. ◻
]

#thm([Corollary 7.5.])[
  #emph[For every transcendental $a in \( - 1 \, 1 \)$, the cyclic quadrilateral
$ K_a = { \( - 1 \, 0 \) \, \( 1 \, 0 \) \, \( a \, sqrt(1 - a^2) \) \, \( a \, - sqrt(1 - a^2) \)
  #scale(x: 120%, y: 120%)[}] $

 is Ramsey and is not subtransitive.]
] <cons:kites>

#proof[
  The four points are distinct and lie on the unit circle, so Corollary 22 makes $K_a$ Ramsey.
    Leader, Russell and Walters proved that $K_a$ does not embed in any finite transitive Euclidean set
    #cite(label("lrw-kites")) Corollary 2. ◻
]

Thus the necessity direction of the Leader–Russell–Walters subtransitive characterization fails
  #cite(label("lrw-transitive")) Conjecture A. The same family also disproves their conjecture that these kites
  are not Ramsey #cite(label("lrw-kites")) Conjecture 3.

=== 7.1 Nine points on a circle <nine-points-on-a-circle>

The tensor equations can have full rank even when their multiplied versions admit a sphere equation.
  The following determinant calculation illustrates this distinction.
  Pálvölgyi’s earlier generic-seven-point claim #cite(label("palvolgyi-heptagon")) Theorem A.3 already implies its
  non-Ramsey conclusion by taking a subset; the source labels its appendix as unchecked.
  We give a direct proof from the tensor criterion.

#thm([Proposition 7.6.])[
  #emph[Let $t_1 \, dots.h \, t_9$ be algebraically independent real numbers over $bb(Q)$. The nine points
$ a_i = (frac(1 - t_i^2, 1 + t_i^2) \, frac(2 t_i, 1 + t_i^2)) \, wide 1 lt.eq i lt.eq 9 \, $

 form a spherical set that is not Ramsey.]
] <cons:nine>

#proof[
  The parametrization lies on the unit circle and is injective,
    since $t_i = \( a_i \)_2 \/ \( 1 + \( a_i \)_1 \)$. Thus the points are distinct, affinely span $bb(R)^2$,
    and have coordinate field $F = bb(Q) \( t_1 \, dots.h \, t_9 \)$.
    Algebraic independence identifies this field with a rational function field.
    Consequently $B =
    F ⊗_(bb(Q)) F$ is the localization of $bb(Q) \[ T_1 \, dots.h \, T_9 \, U_1 \, dots.h \, U_9 \]$ obtained by
    inverting all nonzero polynomials in the $T$ variables alone and all nonzero polynomials in the $U$ variables
    alone. In particular, $B$ is a domain and embeds in $bb(Q) \( T_1 \, dots.h \, T_9 \, U_1 \, dots.h \, U_9 \)$.
  Put
  $ p \( t \) = (1 \, frac(1 - t^2, 1 + t^2) \, frac(2 t, 1 + t^2))^(sans(T)) . $
  Over this fraction field, the nine tensor evaluation equations have coefficient matrix $D$ with rows
    $\( p_alpha \( T_i \) p_beta \( U_i \) \)_(0 lt.eq alpha \, beta lt.eq 2)$. We claim that $det D eq.not 0$.
    To check the claim, specialize the nine pairs $\( T_i \, U_i \)$ to the grid ${ 0 \, 1 \, - 1 }^2$,
    with both coordinates ordered as $0 \, 1 \, - 1$. All denominators in the displayed matrix remain nonzero.
    The resulting matrix is the ordinary Kronecker product $C ⊗ C$, where
  $ C = mat(delim: "(", 1, 1, 0; 1, 0, 1; 1, 0, - 1) \, wide det C = 2 . $
  Its determinant is $2^6 = 64$, proving the claim. This evaluates the specific determinant expression;
    no specialization of the entire localized ring $B$ is asserted.
  Thus the only solution of $D thin "vec" \( P \) = 0$ over the fraction field is $P = 0$.
    Injectivity of the embedding of $B$ shows that the same holds over $B$.
    Such a matrix cannot have multiplied spatial block $I_2$, so Theorem 1 excludes the Ramsey property. ◻
]

=== 7.2 Three concentric squares <three-concentric-squares>

A second example uses only one transcendental parameter. It also shows how a derivation can detect the failure of
  the tensor equations directly inside the coordinate field.
  Its weighted cancellation is related to the derivation obstruction in Pálvölgyi’s smaller circular example
  #cite(label("palvolgyi-heptagon")) Theorem 1; the calculation below is independent of that proof.
  The parameter is Liouville’s constant #cite(label("liouville1851")).

#thm([Proposition 7.7.])[
  #emph[Set
$ t = sum_(m = 1)^oo 10^(- m !) \, wide u = frac(1 - t^2, 1 + t^2) \, wide v = frac(2 t, 1 + t^2) \, wide Q_0 =
  { \( plus.minus 1 \, 0 \) \, \( 0 \, plus.minus 1 \) } \, $

 and define
$ R_(+) = mat(delim: "(", u, - v; v, u) \, wide R_(-) = mat(delim: "(", u, v; - v, u) \, wide X =
  R_(+) Q_0 union R_(-) Q_0 union Q_0 . $

 Then $X$ is a twelve-point subset of the unit circle that is not Ramsey.]
] <cons:twelve>

#proof[
  First, $0.11 < t < 0.12$ and $t$ is transcendental. Indeed, the rational partial sums $t_m = p_m \/ q_m$,
    with $q_m = 10^(m !)$, satisfy
  $ 0 < t - t_m < 2 q_m^(- \( m + 1 \)) wide \( m gt.eq 2 \) . $
  If $t$ had an irreducible polynomial $P in bb(Z) \[ T \]$ of degree $d$,
    then $P \( t_m \) eq.not 0$ and $\| P \( t_m \) \| gt.eq q_m^(- d)$.
    A bound $C gt.eq 1$ for $\| P' \|$ on $\[ 0 \, 1 \]$ would give $q_m^(- d) < 2 C q_m^(- \( m + 1 \))$,
    a contradiction for large $m$. The rotations $R_(+)$ and $R_(-)$ have angles $theta = 2 arctan t$ and $-
    theta$, where $0 < theta < pi \/ 4$. Their differences from each other and from zero are nonzero and smaller
    than $pi \/ 2$ in absolute value. Hence the three squares are disjoint.
    They lie on the unit circle, and $Q_0$ already affinely spans the plane.
  The coordinate field of $X$ is $F = bb(Q) \( t \)$: its coordinates include $u \, v$, and $t =
    v \/ \( 1 + u \)$. On this field define the derivation
  $ partial = frac(1 + t^2, 2) frac(d, d t) . $
  It satisfies $partial u = - v$ and $partial v = u$. Write $R_0 = I_2$,
    label the points by $x_(epsilon.alt \, q) = R_epsilon.alt q$ for $epsilon.alt in { + \, - \,
    0 }$ and $q in Q_0$, and assign weights $beta_(+ \, q) = beta_(- \, q) = 1$, $beta_(0 \, q) = - 2$.
    For these twelve labels put $p_i = \( 1 \, x_i \)^(sans(T))$. We have the three augmented moment identities
  #[#set math.equation(numbering: n => "(29)")
   $ sum_i beta_i p_i p_i^(sans(T)) = 0 \, wide sum_i beta_i \( partial p_i \) p_i^(sans(T)) = 0 \, wide
     sum_i beta_i \( partial p_i \) \( partial p_i \)^(sans(T)) =
     mat(delim: "(", 0, 0; 0, 4 I_2) . $ <cons:derivation-moments>]
  Here the block sizes are $1$ and $2$. To verify them, use $sum_(q in Q_0) q =
    0$ and $sum_(q in Q_0) q q^(sans(T)) = 2 I_2$. With $J = mat(delim: "(", 0, - 1; 1, 0)$,
    the derivatives are $partial R_(+) = R_(+) J$, $partial R_(-) = - R_(-) J$, and $partial R_0 = 0$.
    The first spatial moment is $2 \( 1 + 1 - 2 \) I_2 = 0$; the mixed moment is $2 J - 2 J = 0$;
    and the derivative moment is $2 I_2 + 2 I_2 = 4 I_2$. The constant and vector entries vanish by the same
    square symmetries.
  Define the $bb(Q)$-linear map $Phi : F ⊗_(bb(Q)) F arrow.r
    F$ by $Phi \( a ⊗ b \) = \( partial a \) \( partial b \)$.
    For every $P in "Mat"_3 \( B \)$, the product rule and (29) give
  #[#set math.equation(numbering: n => "(30)")
   $ sum_i beta_i Phi #scale(x: 120%, y: 120%)[\(] \( p_i ⊗ 1 \)^(sans(T)) P \( 1 ⊗ p_i \)
     #scale(x: 120%, y: 120%)[\)] = 4 sum_(alpha = 1)^2 m_F \( P_(alpha alpha) \) . $ <cons:derivation-obstruction>]
  For completeness, expand each entry of $P$ into pure tensors $a ⊗ b$.
    In $partial \( p_(i alpha) a \) partial \( p_(i beta) b \)$,
    the terms involving $partial a$ or $partial b$ vanish after summing with $beta_i$ by the first two moment
    identities and the transpose of the second. The remaining term is $a
    b \( partial p_(i alpha) \) \( partial p_(i beta) \)$, and the third identity gives exactly the right side of (30).
  A matrix satisfying the classification criterion would make the left side zero and the right side $8$.
    This contradiction proves the claim. The argument uses a derivation only on $F$,
    and imposes no regularity condition on the colorings in the Ramsey definition. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
