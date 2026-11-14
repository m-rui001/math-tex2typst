#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The Kirchberg--Rørdam character criterion]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

For a nonzero unital $C^(*)$-algebra $A$ and a free ultrafilter $omega$ on $bb(N)$, write

$ A_omega = ell^oo \( bb(N) \, A \) #scale(x: 120%, y: 120%)[\/] { \( a_n \) :
  lim_(n arrow.r omega) parallel a_n parallel = 0 } \, wide F_omega \( A \) = A_omega ∩ A' \, $

where $A$ is identified with its diagonal image in $A_omega$.
  A #emph[character] is a nonzero $*$-homomorphism to $bb(C)$; on a unital algebra it is automatically unital.
  We write $cal(Z)$ for the Jiang–Su algebra introduced by Jiang and Su [2].
  An algebra is #emph[$cal(Z)$-stable] if it is isomorphic to its minimal tensor product with $cal(Z)$.

Tensorial absorption can be recognized through central copies of the absorbed algebra.
  The theory of strongly self-absorbing algebras developed by Toms and Winter makes this principle precise [10].
  In the case of $cal(Z)$, Kirchberg and Rørdam proved that a unital separable algebra is $cal(Z)$-stable exactly
  when its norm central-sequence algebra contains, with the same unit,
  a separable subhomogeneous algebra without characters [3] Theorem 2.5.
  Here subhomogeneity means a common finite bound on the dimensions of irreducible representations.
  The absence of characters on that subalgebra plainly forces the same absence on the whole central-sequence
  algebra. The question is whether this elementary obstruction is already sufficient.

Kirchberg and Rørdam asked whether the absence of characters on $F_omega \( A \)$ characterizes Jiang–Su
  absorption among unital separable $C^(*)$-algebras [3] Question 3.1.
  Their work relates this question to tensor powers of algebras without characters [3] Question 3.7 and
  Proposition 3.9. The character question also appears as Problem LXXX in the recent collection of Schafhauser,
  Tikuisis, and White [9] Section 22. We prove the proposed characterization.

#thm([Theorem 1.1.])[
  #emph[Let $A$ be a nonzero unital separable complex $C^(*)$-algebra,
    and let $omega$ be any free ultrafilter on $bb(N)$. Then
$ F_omega \( A \) upright(" has no characters") quad arrow.l.r.double quad A tilde.equiv A ⊗_min cal(Z) . $

]
] <thm:main>

The hypothesis uses the norm central-sequence algebra. The theorem applies to all such $A$, with no nuclearity,
  simplicity, trace, dimension, or comparison assumption. Its main ingredient is the following finite
  construction, in which separability is unnecessary.

#thm([Theorem 1.2.])[
  #emph[Let $D$ be a nonzero unital complex $C^(*)$-algebra without characters.
    There is an integer $m gt.eq 1$ and a unital $*$-homomorphism
$ I \( 2 \, 3 \) arrow.r D^(⊗_max m) \, $

 where
$ I \( 2 \, 3 \) = { f in C \( \[ 0 \, 1 \] \, M_2 ⊗ M_3 \) : f \( 0 \) in M_2 ⊗ 1_3 \, med f \( 1 \) in 1_2 ⊗ M_3 } . $

]
] <thm:finite>

The exponent depends on $D$. The conclusion is a unital homomorphism,
  not a claim that this finite tensor power itself absorbs $cal(Z)$.
  Its image is subhomogeneous and characterless, even if the homomorphism has a kernel.
  These are precisely the properties needed for the central-sequence application.
  They also give the following consequence.

#thm([Corollary 1.3.])[
  (Infinite minimal tensor powers).  #emph[Let $D$ be a nonzero unital separable complex $C^(*)$-algebra without
    characters, and write
$ B = D^(⊗_min oo) := "inj lim"_(n gt.eq 1) #scale(x: 120%, y: 120%)[\(] D^(⊗_min n) \,
  thin x mapsto x ⊗ 1_D #scale(x: 120%, y: 120%)[\)] . $

 Then $B tilde.equiv B ⊗_min cal(Z)$, and $B$ contains a unital copy of $cal(Z)$.]
] <cor:infinite-tensor>

Separability is needed for this application of Dadarlat–Toms, but neither nuclearity nor simplicity is assumed.
  The absorption conclusion concerns the infinite minimal tensor power, not a finite power.

=== 1.1 Earlier results and the remaining construction <earlier-results-and-the-remaining-construction>

Dadarlat and Toms connected Jiang–Su absorption with infinite tensor powers [1].
  Their Theorem 1.1 shows that the infinite minimal tensor power of a unital separable algebra is $cal(Z)$-stable
  whenever it contains a same-unit subhomogeneous characterless subalgebra.
  The construction in their Theorem 6.2 gives, for each fixed prime dimension-drop algebra,
  a unital map into any separable recursive subhomogeneous algebra of finite topological dimension whose minimum
  matrix size is sufficiently large relative to that dimension.
  Our finite theorem begins only with absence of characters on $D$ and uses maximal tensor products,
  so it must construct the required subhomogeneous image without such a structural hypothesis.

A positive element is #emph[full] if the closed two-sided ideal it generates is the whole ambient algebra.
  Several regularity criteria explain why finding the subhomogeneous image is useful.
  Robert and Tikuisis showed that two full orthogonal positive elements in the central-sequence algebra suffice
  for absorption when the original separable algebra has finite nuclear dimension [7] Theorem 1.2.
  More recently, Perera, Thiel, and Vilalta characterized $cal(Z)$-stability of separable algebras by purity of
  the central-sequence algebra [5] Theorem 3.6. Purity imposes comparison and divisibility conditions on its Cuntz
  semigroup. The present argument assumes neither finite nuclear dimension nor these comparison and divisibility
  properties.

The companion [4] Theorem 1.4 proves that a finite maximal tensor power of every nonzero unital characterless
  algebra contains two full orthogonal positive elements, without separability or nuclearity.
  Its Gaussian and pure-state-excision proof is different from the representation-label argument developed below.
  We also use the companion’s commuting-copy lemma [4] Lemma 9.3,
  with the primary reindexing provenance in [3] Proposition 2.2 and Corollary 2.3.

The bridge from full orthogonal elements to a homomorphism from the matrix cone $C_0 \( \( 0 \, 1 \] \) ⊗
  M_2$ that sends $t mapsto t e_11$ to a full element already appears in the proof of [3] Proposition 6.1.
  We give a complete construction using representation-stable tensor labels.
  A matrix-cone map can equivalently be viewed as a completely positive contractive order-zero map on a matrix
  algebra, meaning one that preserves orthogonality of positive elements,
  as in Winter and Zacharias [11] Corollary 4.1; below we construct the cone homomorphism directly.
  Fullness of its first matrix corner is not by itself the dimension-drop criterion.
  The additional task is to produce two #emph[exactly equivalent] orthogonal positive contractions,
  of the form $v^(*) v$ and $v v^(*)$ for a single element $v$,
  and compare their unit defect with a positive cutoff of one of them.
  This is the input to the stable-rank-free implication of Rørdam and Winter [8] Proposition 5.1,
  (ii)$arrow.r.double$(iv), whose needed form is proved explicitly in Section 3.

=== 1.2 Proof overview <proof-overview>

We give the finite construction in two stages. First, a finite-dimensional space of selfadjoints detects
  noncommutativity in every representation of $D$. An incidence argument supplies tensor labels that remain
  linearly independent after arbitrary rank-at-least-two maps on the individual legs.
  These labels yield two selfadjoints that do not commute in any irreducible representation of a suitable tensor
  power. A double commutator then has full positive and negative parts,
  and a second use of the labels assembles finitely many bridges between them into one full square-zero element.

Second, the square-zero element gives a matrix-cone homomorphism with a full first corner.
  A continuous simplex of embeddings of $M_2$ organizes this cone across a finite tensor power.
  Two orthogonal equivalent positive elements leave a defect concentrated near the origin of a cube.
  Disjoint regions near its coordinate axes support elements that absorb this defect after a further finite
  amplification. The resulting comparison is precisely the one required by the Rørdam–Winter dimension-drop
  criterion. This comparison is the step that turns full orthogonal elements into a unital $I \( 2 \, 3 \)$ map.

Section 2 records the comparison conventions and structural criteria,
  with the dimension-drop conversion proved in Section 3. Section 4 constructs this cone homomorphism,
  and Section 5 proves the finite comparison. Section 6 deduces both theorems and Corollary 3.
  All tensor exponents and comparison constants are allowed to depend on the algebra $D$.

== 2 Preliminaries <sec:preliminaries>

=== 2.1 Tensor products and positive elements <tensor-products-and-positive-elements>

All algebras are complex. All tensor products in the construction are #emph[maximal],
  and we abbreviate $D^(⊗_max n)$ to $D^(⊗ n)$. We specify minimal tensor products explicitly.
  Algebraic tensor products are denoted by $⊙$ over $bb(C)$ and by $⊗_(bb(R))$ over $bb(R)$.
  Representations called irreducible are nonzero and nondegenerate,
  hence unital when the represented algebra is unital. An element is #emph[full] if its generated closed two-sided
  ideal is the whole algebra. Equivalently, it is nonzero in every irreducible representation:
  a proper ideal has a nonzero irreducible representation of its quotient.

For positive elements in finite matrix algebras over a unital algebra $B$, write $a prec.tilde b$ if,
  after adjoining zero corners as necessary, there are matrices $x_j$ with $x_j^(*) b x_j arrow.r a$ in norm.
  Write $\[ a \]$ for the resulting Cuntz equivalence class.
  Thus $\[ a \] lt.eq \[ b \]$ means $a prec.tilde b$, and addition is induced by direct sum.
  We use only the following elementary rules:

+ $\[ v^(*) v \] = \[ v v^(*) \]$ for every rectangular matrix $v$;
+ if $a_1 \, dots.h \, a_l$ are positive and pairwise orthogonal, then $\[ sum_i a_i \] = sum_i \[ a_i \]$;
+ comparison and addition are preserved by $*$-homomorphisms and by external tensoring with a fixed positive
  element, including for maximal tensor products.

For the first rule, with $b = v^(*) v$, the matrices $x_gamma =
  v \( b + gamma \)^(- 1 \/ 2)$ satisfy $x_gamma^(*) \( v v^(*) \) x_gamma = b^2 \( b + gamma \)^(- 1) arrow.r
  b$ as $gamma arrow.b 0$; apply the same argument to $v^(*)$ for the converse.
  For the second rule, apply the first to the row $\( a_1^(1 \/ 2) \, dots.h \, a_l^(1 \/ 2) \)$.
  For the third rule, apply a homomorphism to the witnesses, or tensor them with the unit of the other algebra.
  The norm estimate for the resulting error is at most the original error times the norm of the fixed positive
  tensor factor. Direct sums agree under the canonical matrix identifications.
  These rules use no cancellation or regularity of the Cuntz order.
  We also use $\[ a \] lt.eq \[ 1_B \]$ for $a in B_(+)$, which follows from the exact witness $a^(1 \/ 2)$.

=== 2.2 The dimension-drop criterion <the-dimension-drop-criterion>

We say that positive elements $a_1 \, a_2 in B$ are #emph[equivalent] if $a_1 = v^(*) v$ and $a_2 =
  v v^(*)$ for one $v in B$. This is the exact relation required in the next proposition.

#thm([Proposition 2.1.])[
  (Rørdam–Winter).  #emph[Let $B$ be a unital $C^(*)$-algebra.
    Suppose that $a_1 \, a_2 in B$ are orthogonal positive contractions with $a_1 = v^(*) v$, $a_2 =
    v v^(*)$ for some $v in B$, and that, for some $epsilon > 0$,
$ 1_B - a_1 - a_2 prec.tilde \( a_1 - epsilon \)_(+) . $

 Then there is a unital $*$-homomorphism $I \( 2 \, 3 \) arrow.r B$.]
] <prop:rw>

This is [8] Proposition 5.1, (ii)$arrow.r.double$(iv), with $n = 2$.
  Section 3 supplies a complete proof using their method, with the support projections, scalar endpoint fiber,
  and weighted flip identity made explicit. The stable-rank-one hypothesis appearing elsewhere in that proposition
  is needed only for (i)$arrow.r.double$(ii). It is not a hypothesis of the implication stated here.
  Orthogonality ensures $a_1 + a_2 lt.eq 1_B$, so the defect in the display is positive.

=== 2.3 Central-sequence inputs <central-sequence-inputs>

We use the following results of Kirchberg and Rørdam for the fixed free ultrafilter $omega$.

#thm([Proposition 2.2.])[
  (Kirchberg–Rørdam).  #emph[Let $A$ be a nonzero unital separable $C^(*)$-algebra.]
  + #emph[If $D subset F_omega \( A \)$ is separable and contains the ambient unit, then for every $m gt.eq
    1$ there is a unital $*$-homomorphism $D^(⊗_max m) arrow.r F_omega \( A \)$.]
  + #emph[$A tilde.equiv A ⊗_min cal(Z)$ if and only if $F_omega \( A \)$ contains, with the ambient unit,
    a separable subhomogeneous $C^(*)$-algebra without characters.]
] <prop:kr>

The first assertion is the unital specialization of the commuting-copies lemma in [4] Lemma 9.3,
  whose primary source is [3] Proposition 2.2 and Corollary 2.3.
  For unital $A$, the annihilator ideal used in that companion is zero:
  an element annihilating every element of $A$ annihilates its unit.
  Thus its $F \( A \)$ is precisely the norm central-sequence algebra used here.
  This particular lemma has no nuclear-dimension assumption.
  We include the short specialization to make its quantifiers explicit.

#proof[
  For any separable subalgebra $E subset F_omega \( A \)$, we construct a unital map from $D$ into
    $F_omega \( A \) ∩ E'$. Choose a countable dense unital $*$-subalgebra $D_0 subset D$ over $bb(Q) + i bb(Q)$.
    For every $x in D_0$, choose a bounded lift $\( a_l^x \)_l$ in $A$ with $sup_l parallel a_l^x parallel lt.eq
    2 parallel x parallel$, using the zero lift for $x = 0$ and the constant unit lift for $x = 1$.
    Such choices follow from the quotient norm, by truncating coordinate norms without changing the ultrapower
    class. All additive, rational-complex scalar, multiplicative and adjoint relation defects tend to zero in norm
    along $omega$.
  Choose a countable dense subset of $A$ and bounded lifts $\( b_s^j \)_s$ of a countable dense subset of $E$.
    Enumerate the relation-defect tests and the tests for centrality of the $a_l^x$ against the chosen subset of
    $A$. For each output index $s$, choose $l \( s \)$ so that the first $s$ tests hold within $1 \/ s$, and so that
  $ parallel \[ a_(l \( s \))^x \, b_s^j \] parallel < 1 \/ s $
  for the first $s$ pairs $\( x \, j \)$ in an enumeration.
    Each of the finitely many requirements holds on an $omega$-large set of old indices $l$:
    for this fixed $s$, each $b_s^j$ is a fixed element of $A$, so original centrality applies.
    Their finite intersection is nonempty.
  The new sequences $\( a_(l \( s \))^x \)_s$ are central and satisfy every algebraic relation in the ordinary
    limit, hence along the arbitrary free ultrafilter $omega$.
    Their classes define a unital rational-complex $*$-homomorphism on $D_0$ into $F_omega \( A \) ∩ E'$.
    The uniform bound $2 parallel x parallel$ extends it continuously to a complex unital $*$-homomorphism on $D$.
    Starting with the given copy of $D$ and taking $E$ successively to be the algebra generated by the earlier
    images produces any prescribed finite number of commuting unital images.
    The universal property of the maximal tensor product gives (1). Injectivity of the reindexed maps is not needed. ◻
]

The second assertion is [3] Theorem 2.5. Here #emph[subhomogeneous] means that the dimensions of all irreducible
  representations have a common finite bound. In particular,
  this input does not replace norm central sequences by a tracial ultrapower or impose nuclearity on $A$.

== 3 The dimension-drop criterion without stable rank one <sec:rw>

This section proves the implication of Rørdam and Winter [8] Proposition 5.1,
  (ii)$arrow.r.double$(iv) used in the finite construction.
  We retain their order-zero and flip-path method, while making the support projections and endpoint domains
  explicit. The argument applies to an arbitrary unital $C^(*)$-algebra.

For $b gt.eq 0$, write $"Her" \( b \) = overline(b B b)$.
  Support projections and polar decompositions will be taken in $B^(* *)$.
  They need not belong to $B$; we will verify membership in $B$ whenever they are used to construct an element of
  the original algebra.

#thm([Lemma 3.1.])[
  #emph[If $a \, b in B_(+)$ satisfy $a prec.tilde b$, then for every $delta > 0$ there is $z in B$ such that
$ z^(*) z = \( a - delta \)_(+) \, wide z z^(*) in "Her" \( b \) . $

]
] <lem:rw-exact-cut>

#proof[
  Since $a \, b$ lie in $B$, compression of stabilized comparison witnesses to their $\( 1 \, 1 \)$ entries gives
    witnesses in $B$ itself. Choose $x in B$ with $parallel a - x^(*) b x parallel < eta < delta$,
    and put $e = \( a - delta \)_(+)$ and $y = b^(1 \/ 2) x e^(1 \/ 2)$. Then
  $ T = y^(*) y gt.eq e^(1 \/ 2) \( a - eta \) e^(1 \/ 2) gt.eq \( delta - eta \) e \, wide T lt.eq
    parallel x^(*) b x parallel e . $
  Thus $T$ and $e$ have the same support. If $y = u T^(1 \/ 2)$ is the polar decomposition, set $z =
    u e^(1 \/ 2)$ in $B^(* *)$. To see that $z in B$, approximate it by
  $ z_tau = y \( T + tau \)^(- 1 \/ 2) e^(1 \/ 2) in b^(1 \/ 2) B \, wide tau > 0 . $
  Writing $f_tau \( t \) = 1 - sqrt(t \/ \( t + tau \))$, the domination of $e$ by $T$ gives
  $ parallel z - z_tau parallel^2 lt.eq parallel f_tau \( T \) e f_tau \( T \) parallel lt.eq
    frac(sup_(t gt.eq 0) t f_tau \( t \)^2, delta - eta) lt.eq frac(tau, delta - eta) . $
  No commutation of $e$ with $T$ is used here. Hence $z in B$, $z^(*) z = e$,
    and $z z^(*)$ is a norm limit of elements of $b^(1 \/ 2) B b^(1 \/ 2)$, as required. ◻
]

We shall use a concrete description of order-zero maps. If $x_1 \, dots.h \,
  x_q$ are contractions with $x_i x_j^(*) = delta_(i j) h$ for a positive contraction $h$, then

$ alpha \( e_(i j) \) = x_i^(*) x_j $

defines a completely positive contractive order-zero map from $M_q$.
  Indeed, complete positivity follows from this Gram formula.
  The positive elements $x_i^(*) x_i$ are orthogonal, so their sum $H$ is a contraction;
  multiplication gives $alpha \( e_(i j) \) alpha \( e_(k l) \) = delta_(j k) H alpha \( e_(i l) \)$.
  This identity proves preservation of orthogonality. It also gives a supporting homomorphism $macron(alpha) :
  M_q arrow.r B^(* *)$ with

$ alpha \( x \) = H macron(alpha) \( x \) = macron(alpha) \( x \) H \, wide macron(alpha) \( 1_q \) = "supp" \( H \) . $

For completeness, its matrix units are the strong limits of $alpha \( e_(i j) \) \( H + tau \)^(- 1)$ as $tau
  arrow.b 0$. The displayed multiplication identity and $alpha \( e_(i j) \)^(*) alpha \( e_(i j) \) lt.eq
  H^2$ verify their boundedness, matrix-unit relations, and stated support.

#thm([Lemma 3.2.])[
  #emph[Let $alpha : M_3 arrow.r B$ and $beta : M_2 arrow.r
    B$ be completely positive contractive maps with commuting ranges, satisfying $psi \( x \) psi \( y \) =
    psi \( 1 \) psi \( x y \)$ for $psi = alpha \, beta$. If $alpha \( 1_3 \) + beta \( 1_2 \) = 1_B$,
    there is a unital homomorphism $I \( 2 \, 3 \) arrow.r B$.]
] <lem:rw-commuting-maps>

#proof[
  This is the order-zero presentation used in [8] Proposition 2.5; we include the verification.
    The canonical maps into $I \( 2 \, 3 \)$ are
  $ alpha_0 \( y \) \( t \) = t \( 1_2 ⊗ y \) \, wide beta_0 \( x \) \( t \) = \( 1 - t \) \( x ⊗ 1_3 \) . $
  Their generated algebra contains the scalar function $t$,
    and products of their entries generate the ideal $C_0 \( \( 0 \, 1 \) \, M_2 ⊗ M_3 \)$.
    Their endpoint values also generate $M_2 xor M_3$. Consequently they generate all of $I \( 2 \, 3 \)$.
  Put $E = C^(*) \( alpha \( M_3 \) \, beta \( M_2 \) \, 1_B \)$. The element $alpha \( 1_3 \)$ is central in $E$.
    In any irreducible representation of $E$ it is a scalar $r in \[ 0 \, 1 \]$.
    If $0 < r < 1$, the rescaled maps $r^(- 1) alpha$ and $\( 1 - r \)^(- 1)
    beta$ in this representation are commuting unital matrix homomorphisms,
    and hence define a representation of $M_2 ⊗ M_3$. At $r = 0$ only the $M_2$ map remains, and at $r =
    1$ only the $M_3$ map remains. These assertions follow either from the supporting homomorphisms or directly
    from the order-zero multiplication identity.
  It follows that substitution of $alpha \, beta$ for $alpha_0 \,
    beta_0$ in a noncommutative $*$-polynomial is bounded in norm by the norm of the polynomial in
    $I \( 2 \, 3 \)$: test in each irreducible representation of $E$ and use the corresponding evaluation at $r$.
    Substitution is therefore well defined and extends from the dense generated algebra to the required unital
    homomorphism. ◻
]

#proof[
  #emph[Exact relations from the comparison.] Write $a_1 = w^(*) w$ and $a_2 =
    w w^(*)$ for the equivalence witness. Decreasing $epsilon$ if necessary, assume $0 < epsilon < 1$.
    Let $f \( t \) = min { t \/ epsilon \, 1 }$ and put $s_1 = f \( a_1 \)^(1 \/ 2)$.
    If $w^(*) = u_0 a_2^(1 \/ 2)$ is its polar decomposition, put $s_2 = u_0 f \( a_2 \)^(1 \/ 2)$.
    This belongs to $B$: it equals $w^(*) q \( a_2 \)$, where the continuous function $q \( t \) =
    sqrt(f \( t \) \/ t)$ for $t > 0$ is assigned the value $epsilon^(- 1 \/ 2)$ at zero. Thus
  $ s_i s_j^(*) = delta_(i j) s_1^2 \, wide d := s_1^(*) s_1 + s_2^(*) s_2 = f \( a_1 \) + f \( a_2 \) . $
  Here the off-diagonal products vanish because the initial positive elements are orthogonal.
    Writing $c = 1 - a_1 - a_2$, functional calculus in the commuting algebra generated by $a_1 \, a_2$ gives
  $ a := 1 - d = epsilon^(- 1) \( c - \( 1 - epsilon \) \)_(+) . $
  Apply Lemma 6 to $c prec.tilde \( a_1 - epsilon \)_(+)$, with $delta = 1 - epsilon$,
    and divide its element by $sqrt(epsilon)$. We obtain a contraction $v in B$ satisfying
  #[#set math.equation(numbering: n => "(3.1)")
   $ v^(*) v = a = 1 - d \, wide v v^(*) in "Her" \( \( a_1 - epsilon \)_(+) \) \, wide s_1^2 v v^(*) =
     v v^(*) . $ <eq:rw-relations>]
  In particular $s_1 v = v$, $s_2 v = 0$, and $a v = 0$. The initial and final support relations also give $d
    s_i = s_1^2 s_i = s_i d$; hence $a$ commutes with the $s_i$.
    The Gram construction gives $rho : M_2 arrow.r B$ with $rho \( e_(i j) \) = s_i^(*) s_j$ and $rho \( 1_2 \) =
    d$. Write $sigma$ for its supporting homomorphism and $p = "supp" \( d \)$.
  #emph[Two orthogonal copies of the defect algebra.] Let $v = u a^(1 \/ 2)$ be the polar decomposition and $e =
    u^(*) u = "supp" \( a \)$. Set
  $ r_i = s_i^(*) u = sigma \( e_(i 1) \) u quad \( i = 1 \, 2 \) \, wide R = r_1 r_1^(*) + r_2 r_2^(*) . $
  The second formula for $r_i$ follows from $d u = u$ and $s_1 u = u$. Direct multiplication gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ r_i^(*) r_j = delta_(i j) e \, wide d r_i = r_i \, wide R lt.eq p \, wide R perp e \, wide
     sigma \( e_(j k) \) r_i = delta_(k i) r_j . $ <eq:rw-corners>]
  For $R perp e$, note that $a$ commutes with each $s_i$ (because $d$ does) and $a u = 0$. The map
  $ phi : "Her" \( a \) arrow.r B \, wide phi \( b \) = sum_(i = 1)^2 r_i b r_i^(*) $
  is a homomorphism by (3.2). Its values belong to $B$: approximate $b in "Her" \( a \)$ by $a^(1 \/ 2) b_m
    a^(1 \/ 2)$ and use $u a^(1 \/ 2) = v$ to see that $u b u^(*) in B$.
    The same approximation, with one outer factor omitted, shows that $u b in B$. The same relations show
  #[#set math.equation(numbering: n => "(3.3)")
   $ phi \( b \) r_i = r_i b \, wide \[ phi \( b \) \, sigma \( M_2 \) \] = 0 \, wide
     phi \( "Her" \( a \) \) perp "Her" \( a \) . $ <eq:rw-phi>]
  Here $phi \( b \) = sum_i r_i b r_i^(*)$ places the same defect element in the two ranges of the $r_i$,
    while $sigma \( e_(j k) \)$ acts on their index $i$. To obtain the other coordinate,
    we use sections on $\[ 0 \, 1 \]$ with values in $M_2$, evaluated at $d$,
    that are scalar at zero and vanish at one. The scalar value accounts for the corner outside $p =
    "supp" \( d \)$; vanishing at one keeps the evaluated section in $"Her" \( 1 - d \)$. Define
  $ D_1 = { F in C \( \[ 0 \, 1 \] \, M_2 \) : F \( 0 \) in bb(C) 1_2 \, med F \( 1 \) = 0 } \, $
  and let $c_F$ be the scalar with $F \( 0 \) = c_F 1_2$. Since $d$ commutes with $sigma \( M_2 \)$,
    continuous functional calculus defines $macron(lambda) \( F \) =
    sum_(i \, j) F_(i j) \( d \) sigma \( e_(i j) \)$ in $p B^(* *) p$. The required homomorphism is
  #[#set math.equation(numbering: n => "(3.4)")
   $ lambda \( F \) = macron(lambda) \( F \) + c_F \( 1 - p \) . $ <eq:rw-lambda>]
  The extra summand retains the scalar fiber at zero. In particular $lambda \( f 1_2 \) =
    f \( d \)$ for scalar $f$ vanishing at one. The algebra $D_1$ is generated by $\( 1 - t \)
    1_2$ and $t \( 1 - t \) x$, $x in M_2$. Their images are respectively $a$ and $a rho \( x \)$,
    so $lambda$ takes values in $"Her" \( a \)$. This also verifies membership in $B$, without assuming $p in B$.
  Let
  $ D_2 = { F in C \( \[ 0 \, 1 \] \, M_2 ⊗ M_2 \) : F \( 0 \) in bb(C) 1_4 \, med F \( 1 \) = 0 } . $
  It is a subalgebra of $D_1 ⊗ M_2$. By (3.3), the commuting product of $phi compose
    lambda$ and $sigma$ defines a homomorphism on $D_1 ⊗ M_2$; denote its restriction to $D_2$ by $gamma$.
    Its range lies in $B$: since $d phi \( b \) = phi \( b \)$, $phi \( b \) sigma \( x \) =
    phi \( b \) rho \( x \) in B$. Its support projection is $R$,
    because its range is supported there and contains $phi \( a \)$, which has support $R$.
  The product defining $gamma$ pairs this transported section action with the action of $sigma$ on the copy index.
    A weighted flip will interchange them only on the overlap needed for the final commutation calculation.
  #emph[The flip where the two pieces overlap.] Let $F in M_2 ⊗ M_2$ be the flip unitary.
    Choose a continuous function $theta : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ that is zero on $\[ 0 \, 1 \/ 3 \]$
    and one on $\[ 2 \/ 3 \, 1 \]$, and set
  $ U \( t \) = frac(1 + F, 2) + e^(i pi theta \( t \)) frac(1 - F, 2) . $
  This is an ordinary unitary path, equal to $1$ near zero and to $F$ on $\[ 2 \/ 3 \, 1 \]$.
    It is a multiplier of $D_2$. The multiplier extension of $gamma$ sends it to a unitary $w_0$ in the corner $R
    B^(* *) R$; put $W = w_0 + 1 - R$.
  Let $g \( t \) = 1$ for $0 lt.eq t lt.eq 2 \/ 3$ and $g \( t \) = 3 \( 1 - t \)$ otherwise. Put
  $ h = lambda \( g 1_2 \) = g \( d \) \, wide k = phi \( h \) \, wide l = 1 - h - k . $
  The elements $h \, k$ are orthogonal positive contractions, and $g \( t \) gt.eq 1 - t$ implies $0 lt.eq l lt.eq
    d$. Also $k W = W k$ and
  $ k^alpha W = gamma \( g^alpha U \) in B wide \( alpha > 0 \) . $
  The formula is legitimate because $g^alpha U in D_2$. Define
  $ x_i = h^(1 \/ 2) r_i^(*) W quad \( i = 1 \, 2 \) \, wide x_3 = h^(1 \/ 2) . $
  These elements belong to $B$: for $i lt.eq 2$ use the factorization
  $ x_i = \( r_i^(*) k^(1 \/ 4) \) \( k^(1 \/ 4) W \) \, wide r_i^(*) k^(1 \/ 4) = h^(1 \/ 4) r_i^(*) in B . $
  By (3.2), $R perp e$, and unitarity of $W$,
  $ x_i x_j^(*) = delta_(i j) h quad \( 1 lt.eq i \, j lt.eq 3 \) \, wide sum_(i = 1)^3 x_i^(*) x_i = h + k . $
  Thus $alpha \( e_(i j) \) = x_i^(*) x_j$ defines an order-zero map $alpha : M_3 arrow.r
    B$ with $alpha \( 1_3 \) = h + k$.
  Since $h \, k$ commute with $sigma \( M_2 \)$ and $0 lt.eq l lt.eq d$, the formula $beta \( y \) =
    l sigma \( y \)$ defines an order-zero map $beta : M_2 arrow.r B$.
    To justify its range directly, $l$ vanishes on the spectral subspace of $d$ for $\[ 0 \, 2 \/ 3 \]$,
    since $h = 1$ there and $h k = 0$. Choose a continuous scalar function $j$ that equals $1 \/ t$ for $t gt.eq
    2 \/ 3$. Then $beta \( y \) = l j \( d \) rho \( y \) in B$.
    Since $l p = l$, we have $alpha \( 1_3 \) + beta \( 1_2 \) = 1$.
  It remains to check that their ranges commute. This is precisely where the flip is needed.
    The scalar function $Q = g \( 1 - g \)$ vanishes at both endpoints and is supported where $U = F$. Therefore
  $ Q \( t \) \( 1 ⊗ y \) U \( t \)^(*) = U \( t \)^(*) Q \( t \) \( y ⊗ 1 \) \, wide y in M_2 . $
  Both sides are elements of $D_2$. Applying $gamma$ gives the well-defined identity
  #[#set math.equation(numbering: n => "(3.5)")
   $ k \( 1 - k \) sigma \( y \) W^(*) = W^(*) phi #scale(x: 120%, y: 120%)[\(] lambda \( Q ⊗ y \)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:rw-weighted-flip>]
  In particular, no constant nonscalar section is evaluated by $lambda$.
    For $i = 1 \, 2$, put $C_i = alpha \( e_(i 3) \) = W^(*) r_i h$. Using (3.3) and (3.5), we obtain
  $ beta \( y \) C_i & = k \( 1 - k \) sigma \( y \) W^(*) r_i\
 & = W^(*) r_i lambda \( Q ⊗ y \)\
 & = W^(*) r_i h \( 1 - h \) sigma \( y \) = C_i beta \( y \) . $
  Here $lambda \( Q ⊗ y \) = Q \( d \) sigma \( y \)$ because $Q \( 0 \) = 0$; the last equality uses $h k = 0$.
  The $C^(*)$-algebra generated by the $C_i$ contains $alpha \( M_3 \)$.
    Indeed, $C_i^(*) C_i = h^2$ and $C_i C_i^(*) = alpha \( e_(i i) \)^2$,
    so their generated algebra contains $h$, all diagonal entries, and $A_0 := alpha \( 1_3 \)$.
    Moreover $C_i C_j^(*) = A_0 alpha \( e_(i j) \)$, and multiplication by $\( A_0 + tau \)^(- 1)$ followed by
    $tau arrow.b 0$ recovers every remaining matrix entry. The convergence follows from $alpha \( e_(i j) \) =
    A_0 macron(alpha) \( e_(i j) \)$ and $parallel tau A_0 \( A_0 + tau \)^(- 1) parallel lt.eq tau$.
    Thus $alpha \( M_3 \)$ commutes with $beta \( M_2 \)$. Lemma 7 completes the proof.
  The construction also covers $v = 0$: then $a = h = k = 0$, $R = 0$, $W = 1$,
    and $beta$ is a unital $M_2$ homomorphism. No step requires stable rank one or a nonzero defect. ◻
]

== 4 A matrix-cone homomorphism with a full corner <sec:tensor>

We first construct a full square-zero element in a finite tensor power of a unital $C^(*)$-algebra without
  characters. Its polar decomposition will then give the matrix-cone homomorphism needed in the next section.
  The absence of characters is detected by finitely many commutators.
  The main issue is to combine those finitely many tests into one element that survives every irreducible
  representation of a maximal tensor product, including representations that are not spatial tensor products.

=== 4.1 Algebraic independence of commuting factors <algebraic-independence-of-commuting-factors>

#thm([Lemma 4.1.])[
  #emph[Let $M subset.eq B \( H \)$ be a von Neumann factor with $1_M = 1_H$,
    and let $B subset.eq M'$ be a unital algebra. The multiplication map
$ M ⊙ B arrow.r B \( H \) \, wide a ⊗ b mapsto a b \, $

 is injective. Consequently, multiplication is injective on the complex algebraic tensor product of any finite
   family of commuting von Neumann factors on the same Hilbert space, all with unit $1_H$.]
] <lem:tensor-independence>

#proof[
  Fix complex linearly independent elements $b_1 \, dots.h \, b_l in B$. It suffices to show that
  $ S = {\( a_1 \, dots.h \, a_l \) in M^(1 times l) : sum_(i = 1)^l a_i b_i = 0} $
  is zero. This row space is weak-operator closed and invariant under diagonal multiplication by $M$ on either
    side. The right invariance uses $B subset.eq M'$. Let $J subset.eq
    M_l \( M \)$ consist of the matrices whose rows belong to $S$. It is a weak-operator closed left ideal:
    each row of a left matrix product is an $M$-linear combination of the original rows.
  We give the support-projection argument for the form of this ideal. For $x in J$, we have $x^(*) x in J$.
    Functional calculus with functions vanishing at zero, followed by weak-operator closure,
    puts the support projection of $x^(*) x$ in $J$: one may first take $x^(*)
    x \( x^(*) x + epsilon 1 \)^(- 1)$ and then let $epsilon arrow.b 0$.
    Finite joins of these projections also belong to $J$, since the join of finitely many projections is the
    support of their sum. Their increasing join $p$ therefore belongs to $J$; this is a net of finite joins,
    so no separability assumption is involved. Every $x in J$ satisfies $x = x p$, and $p in J$ gives
  $ J = M_l \( M \) p . $
  For any unitary $u in M$, put $U = "diag" \( u \, dots.h \, u \)$.
    Right invariance and its counterpart for $u^(*)$ give $J U = J$.
    The right support projection of $x U$ is the conjugate by $U$ of the right support projection of $x$.
    Taking their joins gives
  $ U^(*) p U = p . $
  Thus every entry of $p$ belongs to the center of $M$, and is scalar.
    Each row of $p$ is consequently a scalar relation among the independent $b_i$, so $p = 0$.
    Hence $J = 0$ and $S = 0$, proving the first assertion.
  For finitely many commuting factors, apply the first assertion to one factor and the algebra generated by the
    remaining factors, and induct on their number. ◻
]

#thm([Lemma 4.2.])[
  #emph[Let $pi : B_1 ⊗_max dots.h.c ⊗_max B_q arrow.r B \( H \)$ be an irreducible representation,
    where the $B_j$ are nonzero unital $C^(*)$-algebras. The weak-operator closures of the represented tensor legs
    are commuting von Neumann factors. The same is true after grouping the legs according to any partition into
    nonempty blocks.]
] <lem:tensor-grouped-factors>

#proof[
  Every represented block contains $pi \( 1 \) = 1_H$. The represented blocks commute,
    and this commutation persists under weak-operator closure.
    A central element of the closure of one block commutes both with that block and with every complementary
    block. It therefore belongs to the commutant of the full irreducible image, which consists of the scalars.
    This proves factorhood for each block. ◻
]

These lemmas concern algebraic tensor independence. They require neither faithfulness of the restrictions to the
  tensor legs nor a spatial decomposition of the represented factors.

=== 4.2 Labels that remain independent in representations <labels-that-remain-independent-in-representations>

#thm([Lemma 4.3.])[
  #emph[Let $D$ be a nonzero unital $C^(*)$-algebra without characters.
    There is a finite-dimensional real subspace $V subset.eq D_(upright("sa"))$ such that the image of $V$
    contains a noncommuting pair in every nonzero unital representation of $D$.]
] <lem:tensor-detecting-space>

#proof[
  The closed ideal generated by the commutators of selfadjoint elements is all of $D$.
    Otherwise the quotient by this ideal would be a nonzero unital commutative $C^(*)$-algebra,
    and a character of the quotient would give a character of $D$.
  Choose a finite algebraic expression in these commutators within distance less than one of $1_D$.
    This expression is invertible, so the finitely many commutators it uses already generate the unit ideal.
    Let $V$ be the real span of their selfadjoint entries. If a unital representation sent $V$ to a commuting
    space, it would annihilate all these commutators, and hence their unit ideal. This is impossible. ◻
]

#thm([Lemma 4.4.])[
  #emph[Let $V$ be a finite-dimensional real vector space with $m = dim_(bb(R)) V gt.eq 2$.
    For every integer $r gt.eq 1$, there are $n gt.eq 1$ and tensors $x_1 \, dots.h \,
    x_r in V^(⊗_(bb(R)) n)$ with the following property: whenever $P_j : V arrow.r
    E_j$ are real linear maps of rank at least two, the tensors
$ \( P_1 ⊗ dots.h.c ⊗ P_n \) \( x_i \) \, wide 1 lt.eq i lt.eq r \, $

 are linearly independent over $bb(R)$.]
] <lem:tensor-real-labels>

#proof[
  It suffices to consider surjections $P_j : V arrow.r bb(R)^2$.
    Indeed, a map of rank at least two can be postcomposed, on its finite-dimensional image,
    with a surjection onto $bb(R)^2$; a dependence before this postcomposition would remain a dependence afterward.
  Choose $n$ such that
  $ 2^n > 2 m n + r - 1 \, $
  and put $W = V^(⊗_(bb(R)) n)$. Let $cal(P) = "Surj" \( V \, bb(R)^2 \)^n$,
    an open subset of a real vector space of dimension $2 m n$. Consider the smooth map
  $ Phi : cal(P) times S^(r - 1) times W^r & arrow.r \( bb(R)^2 \)^(⊗_(bb(R)) n) \,\
\( P \, u \, x \) & mapsto \( P_1 ⊗ dots.h.c ⊗ P_n \) (sum_(i = 1)^r u_i x_i) . $
  Its differential in the $x$ variables is surjective everywhere:
    some $u_i eq.not 0$, and the tensor product of the $P_j$ is surjective.
    Thus $Phi^(- 1) \( 0 \)$ is a smooth manifold of dimension
  $ 2 m n + r - 1 + r m^n - 2^n < r m^n = dim_(bb(R)) W^r . $
  By Sard’s theorem, its projection to $W^r$ has Lebesgue measure zero.
    The manifolds here are second countable, so this assertion can be applied on a countable atlas;
    no compactness of $cal(P)$ is needed. Choose $x in W^r$ outside that projection.
    For this one tuple, no nonzero real dependence occurs for any tuple of surjections:
    any nonzero coefficient vector can be normalized to lie in $S^(r - 1)$. ◻
]

#thm([Corollary 4.5.])[
  #emph[Let $D$ and $V$ be as in Lemma 10. For each $r gt.eq 1$, there are $n gt.eq
    1$ and selfadjoint elements $x_1 \, dots.h \, x_r in D^(⊗ n)$ whose images are complex linearly independent
    under every irreducible representation of $D^(⊗ n) ⊗_max B$, for every nonzero unital $C^(*)$-algebra $B$.
    Here the elements $x_i$ occupy the first $n$ tensor legs.]
] <cor:tensor-represented-labels>

#proof[
  Take the real tensors supplied by Lemma 11 and map them naturally into $D^(⊗ n)$.
    They are selfadjoint, since they are real linear combinations of elementary tensors with selfadjoint entries.
  Fix such an irreducible representation and write $pi_j$ for its restriction to the $j$-th copy of $D$.
    Each $pi_j$ is unital, so Lemma 10 implies $dim_(bb(R)) pi_j \( V \) gt.eq 2$.
    Apply Lemma 11 to the real maps $V arrow.r pi_j \( V \)$.
  The resulting independence also holds after complexification.
    Indeed, a real basis of a space of selfadjoint operators is complex linearly independent:
    taking adjoints of a complex relation separates its real and imaginary parts.
    Hence the complexification of each $pi_j \( V \)$ embeds in the represented algebra.
    Tensoring these injections shows that the real independent tensors remain complex independent in the complex
    algebraic tensor product of the represented legs: the latter tensor product contains the complexification of
    the real tensor product injectively. By Lemma 9 their weak closures are commuting factors,
    and Lemma 8 preserves this independence under multiplication. ◻
]

=== 4.3 A full square-zero element <a-full-square-zero-element>

The existence of two full orthogonal positive elements in a finite maximal tensor power is already established in
  [4] Theorem 1.4. The bridge construction below is related to Kirchberg–Rørdam’s proof of [3] Proposition 6.1,
  (i)$arrow.r.double$(v), which combines finitely many bridges with orthogonal full tensor labels.
  Here we use representation-stable linear independence and give the full construction of the square-zero element
  needed for the cone map.

The labels allow linear independence to replace orthogonality when combining finitely many algebraic witnesses.
  We first construct two full orthogonal positive elements,
  and then use a second label family to retain all bridges between them in a single square-zero element.

#thm([Lemma 4.6.])[
  #emph[If $D$ is a nonzero unital $C^(*)$-algebra without characters,
    then some finite maximal tensor power $P$ of $D$ contains a full element $w$ satisfying $w^2 =
    0$ and $parallel w parallel = 1$.]
] <lem:tensor-full-square-zero>

#proof[
  Choose $V$ as in Lemma 10, and let $v_1 \, dots.h \, v_m$ be a real basis of $V$.
    Take the labels $x_1 \, dots.h \, x_m in D^(⊗ n)$ from Corollary 12. In
  $ P_0 = D ⊗_max D^(⊗ n) ⊗_max D^(⊗ n) $
  define selfadjoint elements
  $ s = sum_(i = 1)^m v_i ⊗ x_i ⊗ 1 \, wide t = sum_(i = 1)^m v_i ⊗ 1 ⊗ x_i . $
  We first show that their images do not commute in any irreducible representation $pi$ of $P_0$.
    Denote the restrictions to the three displayed blocks by $pi_0 \, pi_L \, pi_R$.
    Their weak closures are commuting factors by Lemma 9, and each of the two label families has independent
    images by Corollary 12. The expansion
  $ pi \( \[ s \, t \] \) = sum_(i \, j = 1)^m pi_0 \( \[ v_i \, v_j \] \) thin pi_L \( x_i \) thin pi_R \( x_j \) $
  and Lemma 8 show that $pi \( \[ s \, t \] \) = 0$ would imply $pi_0 \( \[ v_i \, v_j \] \) = 0$ for all $i \,
    j$. This contradicts the defining property of $V$ for the unital representation $pi_0$.
    Independence of the images of the $v_i$ themselves is not required.
  Set $z = \[ s \, \[ s \, t \] \]$, which is selfadjoint. We claim that both $z_(+)$ and $z_(-)$ are full in
    $P_0$. Fix an irreducible representation $pi$, and suppose first that $pi \( z \) gt.eq 0$.
    For every vector $xi$, the real function
  $ f_xi \( lambda \) = ⟨e^(i lambda pi \( s \)) pi \( t \) e^(- i lambda pi \( s \)) xi \, xi⟩ \, wide
    lambda in bb(R) \, $
  is bounded and twice continuously differentiable, with
  $ f''_xi \( lambda \) = - ⟨e^(i lambda pi \( s \)) pi \( z \) e^(- i lambda pi \( s \)) xi \, xi⟩ lt.eq 0 . $
  A bounded concave function on the whole real line is constant. Consequently
  $ f'_xi \( 0 \) = chevron.l i pi \( \[ s \, t \] \) xi \, xi chevron.r = 0 wide upright("for every ") xi . $
  The operator $i pi \( \[ s \, t \] \)$ is selfadjoint, so it must be zero, a contradiction.
    The assumption $pi \( z \) lt.eq 0$ leads to the same contradiction using bounded convex functions.
    Thus both the positive and negative parts of $pi \( z \)$ are nonzero.
    Functional calculus commutes with $pi$, so $z_(+)$ and $z_(-)$ survive every irreducible representation and
    are full.
  Let $J$ be the closed ideal generated by $z_(-) P_0 z_(+)$. The algebraic two-sided ideals
  $ I_plus.minus = "span" { a z_plus.minus b : a \, b in P_0 } $
  are both norm dense in $P_0$. Their products lie in $J$, since
  $ \( a z_(-) b \) \( c z_(+) d \) = a \( z_(-) b c z_(+) \) d . $
  Approximating $1_(P_0)$ from both $I_(-)$ and $I_(+)$ shows that $1_(P_0) in J$, and hence $J = P_0$.
    An algebraic expression within distance less than one of $1_(P_0)$ uses only finitely many elements of $z_(-)
    P_0 z_(+)$ and their adjoints. We can therefore choose
  $ c_i = z_(-) d_i z_(+) \, wide 1 lt.eq i lt.eq r \, $
  whose closed ideal is $P_0$. Notice that $c_i c_j = 0$ for all $i \, j$, because $z_(+) z_(-) = 0$.
  Choose new labels $x'_1 \, dots.h \, x'_r in D^(⊗ n')$ from Corollary 12, and put
  $ P = P_0 ⊗_max D^(⊗ n') \, wide w_0 = sum_(i = 1)^r c_i ⊗ x'_i . $
  The identities $c_i c_j = 0$ give $w_0^2 = 0$. To prove fullness, take any irreducible representation of $P$,
    with restrictions $rho_0$ to $P_0$ and $rho_1$ to the new label block.
    The images $rho_1 \( x'_i \)$ are independent by Corollary 12, allowing $P_0$ as the additional algebra.
    The two grouped weak closures are factors by Lemma 9. Thus Lemma 8 implies
  $ sum_i rho_0 \( c_i \) rho_1 \( x'_i \) = 0 quad arrow.r.double quad rho_0 \( c_i \) = 0 quad
    upright("for all ") i . $
  The latter conclusion is impossible, since the $c_i$ generate the unit ideal and $rho_0$ is unital.
    Hence $w_0$ is full. In particular $w_0 eq.not 0$, and $w =
    w_0 \/ parallel w_0 parallel$ has the required properties.
    The exponents $n \, n'$, and hence the exponent of $P$, depend on the finite detecting space and the finite
    bridge family; no bound uniform over $D$ is asserted. ◻
]

=== 4.4 The cone homomorphism <the-cone-homomorphism>

Let

$ C = { f in C \( \[ 0 \, 1 \] \, M_2 \) : f \( 0 \) in bb(C) 1_(M_2) } \, wide iota \( t \) = t . $

Thus $C$ is the unitization of $C_0 \( \( 0 \, 1 \] \, M_2 \)$.

#thm([Proposition 4.7.])[
  #emph[For every nonzero unital $C^(*)$-algebra $D$ without characters, there are an integer $m gt.eq 1$,
    the maximal tensor power $P = D^(⊗ m)$, and a unital $*$-homomorphism $eta : C arrow.r
    P$ such that $eta \( iota e_11 \)$ is full in $P$.]
] <prop:full-cone>

#proof[
  Let $P$ and $w$ be supplied by Lemma 13. Take the polar decomposition $w = u \| w \|$ in $P^(* *)$, and put $p =
    u^(*) u$, $q = u u^(*)$. Since $w^2 = 0$, the closure of the range of $w$ lies in its kernel; hence $q lt.eq
    1 - p$, since $p$ is the projection onto the orthogonal complement of that kernel in a faithful normal
    representation of $P^(* *)$. The elements
  $ E_11 = p \, wide E_22 = q \, wide E_21 = u \, wide E_12 = u^(*) $
  are therefore matrix units with unit $p + q$.
  The positive element $h = \| w \| + \| w^(*) \|$ has norm one, support $p + q$,
    and commutes with these matrix units. Indeed, the two summands have orthogonal supports,
    and the polar decomposition gives
  $ h E_11 = \| w \| \, wide h E_22 = \| w^(*) \| \, wide h E_21 = w \, wide h E_12 = w^(*) . $
  Commuting functional calculus now defines a $*$-homomorphism
  $ phi : C_0 \( \( 0 \, 1 \] \, M_2 \) & arrow.r P^(* *) \,\
f ⊗ e_(i j) & mapsto f \( h \) E_(i j) \, wide f in C_0 \( \( 0 \, 1 \] \) . $
  It takes its values in $P$. To see this directly, approximate $f$ uniformly by polynomials vanishing at zero.
    Each corresponding term $h^k E_(i j)$, $k gt.eq 1$, belongs to $P$, because $h E_(i j) in P$.
    Thus $f \( h \) E_(i j) in P$. Unitizing $phi$ gives a unital homomorphism $eta : C arrow.r P$, and
  $ eta \( iota e_21 \) = w \, wide eta \( iota e_11 \) = \| w \| . $
  No assertion that $u$ belongs to $P$, or that $p + q = 1_P$, is needed for this unitization.
  Finally, $w$ and $\| w \|$ generate the same closed ideal.
    The ideal of $w$ contains $w^(*) w$ and hence $\| w \|$ by functional calculus. Conversely,
  $ w \( \| w \| + epsilon 1_P \)^(- 1) \| w \| arrow.r w wide \( epsilon arrow.b 0 \) $
  in norm, so the ideal of $\| w \|$ contains $w$. Fullness of $w$ therefore implies fullness of
    $eta \( iota e_11 \) = \| w \|$. ◻
]

== 5 From a cone map with a full corner to a dimension-drop map <sec:dimension-drop>

Recall the unitized matrix cone

$ C = { f in C \( \[ 0 \, 1 \] \, M_2 \) : f \( 0 \) in bb(C) 1 } \, wide iota \( t \) = t . $

We show that a unital map from $C$ whose first matrix corner is full produces a unital dimension-drop map after
  taking a finite tensor power. The comparison we construct has a fixed cutoff:
  the defect of an exactly equivalent orthogonal pair is Cuntz below the positive part of its first element minus
  $1 \/ 2$. Two elementary constructions in tensor powers of $C$ will be useful.
  The first identifies these tensor powers with matrix-valued functions on a cube;
  the second moves a copy of $M_2$ continuously between the available tensor factors.

#thm([Lemma 5.1.])[
  #emph[For $k gt.eq 1$, the algebra $C^(⊗ k)$ identifies with
$ {f in C \( \[ 0 \, 1 \]^k \, M_2^(⊗ k) \) : f \( t \) in ⨂_(i = 1)^k E_i \( t \)} \, wide E_i \( t \) =
  cases(delim: "{", M_2 \, & t_i > 0 \,, bb(C) 1 \, & t_i = 0 .) $

]
] <lem:cone-cube>

#proof[
  The algebra $C$ is nuclear, being the unitization of $C_0 \( \( 0 \, 1 \] \) ⊗ M_2$.
    Its maximal and minimal tensor powers therefore agree. The natural map from its minimal tensor power into
    $C \( \[ 0 \, 1 \]^k \, M_2^(⊗ k) \)$ is isometric: the direct sum of point evaluations is a faithful
    representation of $C$, and its spatial tensor power is the direct sum of the evaluations on the cube.
    The range satisfies the indicated boundary conditions.
  To prove the reverse inclusion, choose a vector-space basis $b_0 \, b_1 \, b_2 \, b_3$ of $M_2$ with $b_0 = 1$,
    and write a section as
  $ f \( t \) = sum_(alpha in { 0 \, 1 \, 2 \, 3 }^k) f_alpha \( t \) thin b_(alpha_1) ⊗ dots.h.c ⊗ b_(alpha_k) . $
  Its scalar coefficients are continuous. If $S_alpha = { i : alpha_i eq.not 0 }$,
    the boundary conditions say that $f_alpha \( t \) = 0$ whenever $t_i = 0$ for some $i in S_alpha$.
    Put $p_alpha \( t \) = product_(i in S_alpha) t_i$, with empty product equal to one. Then
  $ f_alpha \( t \) frac(p_alpha \( t \), p_alpha \( t \) + epsilon) arrow.r f_alpha \( t \) quad
    upright("uniformly as ") epsilon arrow.b 0 . $
  Indeed, $f_alpha$ vanishes on the zero set of $p_alpha$, and is uniformly small on sufficiently small sublevel
    sets of $p_alpha$; on their complements the displayed convergence is uniform.
    Thus $f_alpha$ belongs to the closed scalar ideal generated by $p_alpha$.
  Every continuous scalar function on the cube, multiplied by the matrix identity, lies in $C^(⊗ k)$,
    by approximation by finite sums of products of one-variable functions. Moreover,
  $ p_alpha \( t \) thin b_(alpha_1) ⊗ dots.h.c ⊗ b_(alpha_k) $
  is an elementary tensor of elements of $C$: its $i$-th factor is $iota b_(alpha_i)$ if $i in S_alpha$,
    and is $1$ otherwise. The scalar-ideal approximation now puts each summand of $f$, and hence $f$ itself,
    in $C^(⊗ k)$. ◻
]

#thm([Lemma 5.2.])[
  #emph[For every $k gt.eq 1$, there is a point-norm continuous family of unital $*$-homomorphisms
$ theta_r : M_2 arrow.r M_2^(⊗ k) \, wide r in Delta_(k - 1) = {r in \[ 0 \, 1 \]^k : sum_i r_i = 1} \, $

 whose range uses only the tensor factors indexed by ${ i : r_i > 0 }$.
   At the $j$-th vertex, $theta_r$ is the $j$-th coordinate inclusion.]
] <lem:matrix-simplex>

#proof[
  Let $F in M_2 ⊗ M_2$ be the flip unitary, and fix the unitary path
  $ U \( s \) = frac(1 + F, 2) + e^(i pi s) frac(1 - F, 2) \, wide 0 lt.eq s lt.eq 1 . $
  Thus $U \( 0 \) = 1$, $U \( 1 \) = F$, and $F \( a ⊗ 1 \) F^(*) = 1 ⊗ a$.
  Proceed by induction on $k$, starting with the identity map when $k = 1$.
    For $r_k < 1$, let $tau : M_2 arrow.r M_2^(⊗ \( k - 1 \))$ be the map supplied by induction for
  $ (frac(r_1, 1 - r_k) \, dots.h \, frac(r_(k - 1), 1 - r_k)) \, $
  and set
  $ theta_r \( a \) = \( tau ⊗ upright("id") \) #scale(x: 120%, y: 120%)[\(] U \( r_k \) \( a ⊗ 1 \)
    U \( r_k \)^(*) #scale(x: 120%, y: 120%)[\)] . $
  This is a unital $*$-homomorphism, varying continuously where $r_k < 1$.
    At $r_k = 1$, define $theta_r \( a \) = 1^(⊗ \( k - 1 \)) ⊗ a$. For every preceding map $tau$, contractivity gives
  $ parallel theta_r \( a \) - 1^(⊗ \( k - 1 \)) ⊗ a parallel & lt.eq
    parallel U \( r_k \) \( a ⊗ 1 \) U \( r_k \)^(*) - F \( a ⊗ 1 \) F^(*) parallel\
 & lt.eq 2 parallel a parallel thin parallel U \( r_k \) - F parallel . $
  The last quantity tends to zero as $r_k arrow.r 1$, uniformly in $tau$.
    This proves continuity even when the normalized preceding weights have no limit.
  If $r_k = 0$, the formula is exactly $tau \( a \) ⊗ 1$. If $r_i = 0$ for an earlier index,
    the induction hypothesis makes the $i$-th tensor factor scalar throughout the range of $tau$,
    and applying $tau ⊗ upright("id")$ preserves this restriction.
    These observations prove the support condition on every face, as well as the assertion at the vertices. ◻
]

#thm([Proposition 5.3.])[
  #emph[Let $P$ be a nonzero unital $C^(*)$-algebra. Suppose that there is a unital $*$-homomorphism $eta :
    C arrow.r P$ such that $eta \( iota e_11 \)$ is full in $P$.
    Then, for some finite $m gt.eq 1$, the maximal tensor power $B =
    P^(⊗ m)$ contains orthogonal positive contractions $b_1 \, b_2$ and an element $v_B$ such that
$ b_1 = v_B^(*) v_B \, wide b_2 = v_B v_B^(*) \, wide 1_B - b_1 - b_2 prec.tilde \( b_1 - 1 \/ 2 \)_(+) . $

 Consequently there is a unital $*$-homomorphism
$ I \( 2 \, 3 \) arrow.r P^(⊗ m) . $

]
] <prop:cone-drop>

#proof[
  We first obtain a finite comparison constant from fullness.
    An auxiliary tensor power will provide an element whose class is both small enough to fit that many copies
    under the unit and large enough to dominate the unit after another finite amplification.
    The cube construction then places the defect under elements on which the first member of the pair acts as the
    identity.
  #emph[A full cut and its comparison.] Write $b = eta \( iota e_11 \)$.
    By fullness, choose $h_i \, ell_i in P$, $1 lt.eq i lt.eq N$, such that
  $ ∥1_P - sum_(i = 1)^N h_i b ell_i∥ < 1 / 2 . $
  For sufficiently small $0 < delta < 1$, the element
  $ c = \( b - delta \)_(+) = eta \( q \) \, wide q \( t \) = \( t - delta \)_(+) e_11 \, $
  still satisfies $parallel 1_P - S parallel < 1$, where $S = sum_i h_i c ell_i$.
    Thus $S$ is invertible, and $c$ is full.
  We record an exact matrix comparison. Put
  $ T = \( h_1 c^(1 \/ 2) \, dots.h \, h_N c^(1 \/ 2) \) \, wide
    Z = \( c^(1 \/ 2) ell_1 \, dots.h \, c^(1 \/ 2) ell_N \)^(upright(T)) \, wide d = Z^(*) Z . $
  Since $S = T Z$, we have
  $ S^(*) S lt.eq parallel T parallel^2 d . $
  Invertibility of $S$ therefore implies invertibility of $d$.
    The column $V = \( ell_i d^(- 1 \/ 2) \)_(i = 1)^N$ satisfies
  #[#set math.equation(numbering: n => "(5.1)")
   $ V^(*) "diag" \( c \, dots.h \, c \) V = 1_P \, wide upright("so") wide \[ 1_P \] lt.eq
     N \[ c \] . $ <eq:full-cut-comparison>]
  #emph[An auxiliary amplification.] Let $c_1 = c$ and $c_2 = eta \( \( iota - delta \)_(+) e_22 \)$.
    These are orthogonal equivalent positive contractions, with equivalence witness
    $eta \( sqrt(\( iota - delta \)_(+)) thin e_21 \)$, and $c_1 + c_2 lt.eq 1_P$.
    Choose $L gt.eq 1$ such that $2^L gt.eq N$, and set
  $ R = P^(⊗ L) \, wide e = c^(⊗ L) \, wide k = N^L . $
  The $2^L$ elements
  $ c_(sigma_1) ⊗ dots.h.c ⊗ c_(sigma_L) \, wide sigma in { 1 \, 2 }^L \, $
  are pairwise orthogonal, all have Cuntz class $\[ e \]$, and have sum $\( c_1 + c_2 \)^(⊗ L) lt.eq 1_R$.
    Tensoring (5.1) $L$ times gives the other bound in
  #[#set math.equation(numbering: n => "(5.2)")
   $ N \[ e \] lt.eq 2^L \[ e \] lt.eq \[ 1_R \] lt.eq N^L \[ e \] = k \[ e \] . $ <eq:cone-amplification>]
  The two integers play different roles: $N$ is the comparison constant from fullness,
    whereas $k$ will be the number of cube coordinates. Both are finite and may depend on $P$ and $eta$.
    After applying $eta^(⊗ k)$, the cube construction below will supply positive elements $X \,
    Y in P^(⊗ k)$ with $k \[ X \] lt.eq N \[ Y \]$. The two bounds on $\[ e \]$ will then combine with this
    inequality to give $\[ X ⊗ 1_R \] lt.eq \[ Y ⊗ 1_R \]$.
  #emph[An orthogonal pair in the cube.] We next work in the cube model of $C^(⊗ k)$ from Lemma 15.
    Regard scalar functions as scalar matrix functions, and define
  $ g \( s \) = \( 1 - 2 s \/ delta \)_(+) \, wide H \( t \) = 1 - product_(j = 1)^k g \( t_j \) . $
  For $t eq.not 0$, put
  $ d \( t \) = max_j t_j \, wide r_i \( t \) =
    frac(\( t_i \/ d \( t \) - 1 \/ 2 \)_(+), sum_(j = 1)^k \( t_j \/ d \( t \) - 1 \/ 2 \)_(+)) . $
  At least one term in the denominator is $1 \/ 2$, so $r \( t \)$ is well defined and continuous off the origin.
    Let $theta_r$ be the family from Lemma 16, and set
  $ a_i \( t \) = H \( t \) theta_(r \( t \)) \( e_(i i) \) quad \( i = 1 \, 2 \) \, wide v \( t \) =
    sqrt(H \( t \)) thin theta_(r \( t \)) \( e_21 \) quad \( t eq.not 0 \) . $
  Set all three functions equal to zero at the origin. The bounds
  $ 0 lt.eq H \( t \) lt.eq 2 / delta sum_j t_j \, wide parallel a_i \( t \) parallel lt.eq H \( t \) \, wide
    parallel v \( t \) parallel lt.eq sqrt(H \( t \)) $
  prove continuity there. If $t eq.not 0$ and $t_j = 0$, then $r_j \( t \) = 0$,
    so the support condition on $theta$ supplies the scalar boundary condition in that tensor factor.
    Consequently $a_1 \, a_2 \, v in C^(⊗ k)$. They satisfy
  #[#set math.equation(numbering: n => "(5.3)")
   $ v^(*) v = a_1 \, wide v v^(*) = a_2 \, wide a_1 a_2 = 0 \, wide a_1 + a_2 = H 1 . $ <eq:cone-positive-pair>]
  In particular $a_1 \, a_2$ are equivalent orthogonal positive contractions, and their defect is
  $ X = 1 - a_1 - a_2 = g^(⊗ k) . $
  For $1 lt.eq j lt.eq k$, define
  $ y_j = g^(⊗ \( j - 1 \)) ⊗ q ⊗ g^(⊗ \( k - j \)) . $
  The $y_j$ are positive and pairwise orthogonal, because $q g = 0$. Moreover,
  #[#set math.equation(numbering: n => "(5.4)")
   $ a_1 y_j = y_j wide \( 1 lt.eq j lt.eq k \) . $ <eq:cone-local-support>]
  Indeed, wherever $y_j \( t \) eq.not 0$, one has $t_j > delta$ and $t_i < delta \/ 2$ for every $i eq.not j$.
    Hence $d \( t \) = t_j$ and $t_i \/ d \( t \) < 1 \/ 2$ for all $i eq.not j$.
    The vector $r \( t \)$ is therefore exactly the $j$-th vertex, while $H \( t \) = 1$.
    At that vertex $theta_(r \( t \)) \( e_11 \)$ acts as the identity on the $q$-factor of $y_j \( t \)$.
    At all other points with $y_j \( t \) = 0$, the desired identity is immediate.
    Figure 1 illustrates this localization in two coordinates.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (0.6, 0.6), fill: rgb("#ffe8d1"), stroke: none)
  rect((1.2, 0), (4, 0.6), fill: rgb("#e0e0ff"), stroke: none)
  rect((0, 1.2), (0.6, 4), fill: rgb("#e0e0ff"), stroke: none)
  rect((0, 0), (4, 4), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0.6, 0), (0.6, 4), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 0.6), (4, 0.6), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.2, 0), (1.2, 4), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((0, 1.2), (4, 1.2), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((0, 0), (4.45, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.45, 0), [#text(size: 9pt)[$t_1$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 4.45), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0, 4.45), [#text(size: 9pt)[$t_2$]], anchor: "south", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  line((0.6, 0.05), (0.6, -0.05), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.6, -0.06), [#text(size: 9pt)[$delta"/"2$]], anchor: "north", padding: 0.1176cm)
  line((0.05, 0.6), (-0.05, 0.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.06, 0.6), [#text(size: 9pt)[$delta"/"2$]], anchor: "east", padding: 0.1176cm)
  line((1.2, 0.05), (1.2, -0.05), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.2, -0.06), [#text(size: 9pt)[$delta$]], anchor: "north", padding: 0.1176cm)
  line((0.05, 1.2), (-0.05, 1.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.06, 1.2), [#text(size: 9pt)[$delta$]], anchor: "east", padding: 0.1176cm)
  line((4, 0.05), (4, -0.05), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4, -0.06), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  line((0.05, 4), (-0.05, 4), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.06, 4), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  content((0.3, 0.3), [#text(size: 9pt)[$X$]])
  content((2.6, 0.3), [#text(size: 9pt)[$y_1$]])
  content((0.3, 2.6), [#text(size: 9pt)[$y_2$]])
})],
    caption: [Figure 1: Support geometry for $k = 2$, drawn schematically. Shading shows the closures of the regions where $X$, $y_1$, and $y_2$ can be nonzero. In the $y_j$ region, $r \( t \)$ is the $j$-th vertex and $H \( t \) = 1$, giving (5.4). ],
  ) <fig:cone-support>
  Use the same letters for the images of these elements under $eta^(⊗ k) : C^(⊗ k) arrow.r P^(⊗ k)$, and put $Y =
    sum_(j = 1)^k y_j$. All the identities just proved persist.
    Writing $G = eta \( g \)$, we have $\[ G \] lt.eq \[ 1_P \] lt.eq N \[ c \]$.
    Tensor this comparison with $G$ in the other $k - 1$ positions to obtain
  $ \[ X \] lt.eq N \[ y_j \] quad \( 1 lt.eq j lt.eq k \) . $
  Adding these comparisons and using orthogonality gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ k \[ X \] lt.eq N sum_(j = 1)^k \[ y_j \] = N \[ Y \] . $ <eq:cone-defect-sum>]
  Thus the cube supplies $k$ copies of the defect below $N$ copies of an element supported where $a_1 = 1$.
    The auxiliary algebra $R$ was chosen precisely to remove these unequal multiplicities without any cancellation
    in the Cuntz order.
  #emph[Absorbing the defect.] Finally, work in
  $ B = P^(⊗ k) ⊗ R = P^(⊗ \( k + L \)) \, wide b_i = a_i ⊗ 1_R . $
  Since $a_1 Y = Y$, taking adjoints gives $Y a_1 = Y$. Thus $a_1$ and $Y$ commute,
    and functional calculus gives $\( a_1 - 1 \/ 2 \)_(+) Y = Y \/ 2$.
    In particular the element $z = sqrt(2 Y) ⊗ 1_R$ satisfies
  $ z^(*) \( b_1 - 1 \/ 2 \)_(+) z = Y ⊗ 1_R . $
  The following use of tensor divisibility to obtain comparison follows the pattern of Robert and Rørdam [6]
    Lemma 6.1(i); we verify the comparisons directly in maximal tensor products.
    Together with (5.2) and (5.5), this yields
  $ \[ X ⊗ 1_R \] & lt.eq k \[ X ⊗ e \]\
 & lt.eq N \[ Y ⊗ e \]\
 & lt.eq \[ Y ⊗ 1_R \]\
 & lt.eq \[ \( b_1 - 1 \/ 2 \)_(+) \] . $
  The first comparison tensors $\[ 1_R \] lt.eq k \[ e \]$ with $X$, the second tensors (5.5) with $e$,
    and the third tensors $N \[ e \] lt.eq \[ 1_R \]$ with $Y$. The last uses the exact witness $z$.
    These are comparisons in finite matrices over the maximal tensor product $B$.
  To express the conclusion inside $B$ itself, recall that if $a \, b in B_(+)$ and
  $ W_n^(*) \( b xor 0 \) W_n arrow.r a xor 0 $
  in finite matrices, compression to the upper-left corner gives $\( W_n \)_11^(*) b \( W_n \)_11 arrow.r a$.
    The final comparison therefore gives
  $ 1_B - b_1 - b_2 = X ⊗ 1_R prec.tilde \( b_1 - 1 \/ 2 \)_(+) quad upright("in ") B . $
  By (5.3), the elements $b_1 \, b_2$ are orthogonal positive contractions with exact equivalence witness $v_B =
    v ⊗ 1_R in B$. This proves the asserted pair and defect comparison.
    Proposition 4, with cutoff $1 \/ 2$, now gives a unital $*$-homomorphism $I \( 2 \, 3 \) arrow.r B$.
    Taking $m = k + L$ completes the proof. ◻
]

== 6 From finite tensor powers to absorption <sec:application>

#proof[
  Proposition 14 supplies a finite tensor power $P = D^(⊗ m_0)$ and a unital map $eta : C arrow.r
    P$ for which $eta \( iota e_11 \)$ is full. Proposition 17 supplies a unital map from $I \( 2 \, 3 \)$ into a
    finite tensor power $P^(⊗ s)$. Associativity of the maximal tensor product identifies the latter with
    $D^(⊗ m_0 s)$, as required. ◻
]

For the application, we first record explicitly why the possibly nonseparable central-sequence algebra contains a
  suitable separable subalgebra. This is the separable-reduction argument of [3] Lemma 3.5;
  we include its finite commutator witness.

#thm([Lemma 6.1.])[
  #emph[Every nonzero unital $C^(*)$-algebra $B$ without characters contains a separable $C^(*)$-subalgebra $D$
    without characters and with $1_D = 1_B$.]
] <lem:separable>

#proof[
  The closed ideal generated by commutators of selfadjoint elements is $B$;
    a proper such ideal would give a nonzero unital commutative quotient and hence a character.
    Consequently, there are finitely many $h_i \, k_i in B$ and $b_i \, c_i in B_(upright("sa"))$ such that
  $ ∥1_B - sum_(i = 1)^r h_i \[ b_i \, c_i \] k_i∥ < 1 . $
  Let $D$ be generated by $1_B$ and all the displayed elements. It is unital and separable.
    A character of $D$ would send the sum to zero and the unit to one,
    contradicting its contractivity and the strict norm bound. ◻
]

#proof[
  Assume that $F_omega \( A \)$ has no characters. This algebra is nonzero and unital because it contains the
    diagonal unit of $A$. By Lemma 18, choose a separable unital characterless subalgebra $D subset
    F_omega \( A \)$ with the same unit. By Theorem 2 and Proposition 5(1),
    there is a composition of unital $*$-homomorphisms
  $ I \( 2 \, 3 \) arrow.r D^(⊗_max m) arrow.r F_omega \( A \) . $
  Denote its image by $E$. The image is separable and is a quotient of $I \( 2 \, 3 \)$.
    Every irreducible representation of $I \( 2 \, 3 \)$ factors through evaluation at a point of $\[ 0 \, 1 \]$:
    the central algebra $C \( \[ 0 \, 1 \] \) 1$ acts by a character,
    and sections vanishing at its evaluation point are annihilated,
    by approximation using scalar functions vanishing there. The resulting irreducible dimensions are $2$ at $0$,
    $3$ at $1$, and $6$ in the interior. Thus $I \( 2 \, 3 \)$ is subhomogeneous and has no characters.
    The same properties hold for $E$, since any irreducible representation or character of $E$ pulls back along
    the quotient map. Also $1_E = 1_(F_omega \( A \))$. Proposition 5(2) gives $A tilde.equiv A ⊗_min cal(Z)$.
  Conversely, if $A tilde.equiv A ⊗_min cal(Z)$, Proposition 5(2) supplies a unital subalgebra $E subset
    F_omega \( A \)$ without characters. Any character of $F_omega \( A \)$ would restrict to a character of $E$,
    a contradiction. ◻
]

#proof[
  Because $D$ is nonzero and unital, each spatial connecting map $x mapsto x ⊗ 1_D$ is a unital embedding.
    Thus $B$ is nonzero, unital, and separable, and the canonical maps $iota_m :
    D^(⊗_min m) arrow.r.hook B$ are unital. Choose the unital homomorphism $phi.alt$ from Theorem 2 and compose it
    with the canonical maximal-to-minimal quotient and the finite-stage inclusion:
  $ I \( 2 \, 3 \) arrow.r^(med phi.alt med) D^(⊗_max m) arrow.r^(med q_m med) D^(⊗_min m)
    arrow.r^(med iota_m med) B . $
  The quotient $q_m$ is unital, with no nuclearity assumption on $D$.
    Let $theta$ denote this composite and put $E = theta \( I \( 2 \, 3 \) \)$.
    Since $theta$ is unital, $1_E = 1_B eq.not 0$. The algebra $I \( 2 \, 3 \)$ is separable and,
    as checked above, subhomogeneous and characterless. Its quotient $E tilde.equiv I \( 2 \, 3 \) \/ ker
    theta$ is therefore separable and subhomogeneous: every irreducible representation of $E$ pulls back to one of
    $I \( 2 \, 3 \)$. A character of $E$ would compose with the unital quotient map to a character of
    $I \( 2 \, 3 \)$, which is impossible. These conclusions hold even when $theta$ has a kernel.
  Dadarlat–Toms [1] Theorem 1.1, applied to the unital separable algebra $D$ and this same-unit subalgebra of $B$,
    gives $B tilde.equiv B ⊗_min cal(Z)$. Finally, because $B eq.not 0$,
    the map $z mapsto 1_B ⊗ z$ embeds $cal(Z)$ unitally into $B ⊗_min cal(Z)$.
    Transporting this map through the inverse of an isomorphism $B tilde.equiv B ⊗_min cal(Z)$,
    which is automatically unital, gives the asserted unital copy of $cal(Z)$ in $B$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Marius Dadarlat and Andrew S. Toms, #emph[$cal(Z)$-stability and infinite tensor powers of
  $C^(*)$-algebras], Adv. Math. #strong[220] (2009), 341--366.
  #link("https://doi.org/10.1016/j.aim.2008.07.002")[doi:10.1016/j.aim.2008.07.002].]
#bibitem([2])[Xinhui Jiang and Hongbing Su, #emph[On a simple unital projectionless $C^(*)$-algebra], Amer. J.
  Math. #strong[121] (1999), no.~2, 359--413.
  #link("https://doi.org/10.1353/ajm.1999.0012")[doi:10.1353/ajm.1999.0012].]
#bibitem([3])[Eberhard Kirchberg and Mikael Rørdam, #emph[When central sequence $C^(*)$-algebras have characters],
  Internat. J. Math. #strong[26] (2015), no.~7, 1550049, 32~pp.
  #link("https://doi.org/10.1142/S0129167X15500494")[doi:10.1142/S0129167X15500494].
  #link("https://arxiv.org/abs/1409.1395v2")[arXiv:1409.1395v2].]
#bibitem([4])[OpenAI, #emph[Nuclear dimension and Jiang--Su stability without elementary subquotients],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Nuclear-dimension-and-Jiang-Su-stability-without-elementary-subquotients-September-23-2026/paper.pdf")[OAI:Nuclear-dimension-and-Jiang-Su-stability-without-elementary-subquotients-September-23-2026], 2026.
  Theorem~1.4 and Lemma~9.3.]
#bibitem([5])[Francesc Perera, Hannes Thiel, and Eduard Vilalta, #emph[Centrally pure $C^(*)$-algebras], preprint,
  submitted December~19, 2025. #link("https://arxiv.org/abs/2512.17261v1")[arXiv:2512.17261v1].
  Online journal publication: #link("https://doi.org/10.1016/j.jfa.2026.111578")[doi:10.1016/j.jfa.2026.111578].]
#bibitem([6])[Leonel Robert and Mikael Rørdam, #emph[Divisibility properties for $C^(*)$-algebras], Proc. Lond.
  Math. Soc. (3) #strong[106] (2013), no.~6, 1330--1370.
  #link("https://doi.org/10.1112/plms/pds082")[doi:10.1112/plms/pds082].]
#bibitem([7])[Leonel Robert and Aaron Tikuisis, #emph[Nuclear dimension and $cal(Z)$-stability of non-simple
  $C^(*)$-algebras], Trans. Amer. Math. Soc. #strong[369] (2017), no.~7, 4631--4670.
  #link("https://doi.org/10.1090/tran/6842")[doi:10.1090/tran/6842].]
#bibitem([8])[Mikael Rørdam and Wilhelm Winter, #emph[The Jiang--Su algebra revisited], J. Reine Angew. Math.
  #strong[642] (2010), 129--155. #link("https://doi.org/10.1515/crelle.2010.039")[doi:10.1515/crelle.2010.039].
  #link("https://web.math.ku.dk/~rordam/manus/jiang-su-revisited.pdf")[Author manuscript], January~27, 2009.]
#bibitem([9])[Christopher Schafhauser, Aaron Tikuisis, and Stuart White, #emph[Nuclear $C^(*)$-algebras:
  99 problems], preprint, 2025, revised May~8, 2026. #link("https://arxiv.org/abs/2506.10902v2")[arXiv:2506.10902v2].]
#bibitem([10])[Andrew S. Toms and Wilhelm Winter, #emph[Strongly self-absorbing $C^(*)$-algebras], Trans. Amer.
  Math. Soc. #strong[359] (2007), no.~8, 3999--4029.
  #link("https://doi.org/10.1090/S0002-9947-07-04173-6")[doi:10.1090/S0002-9947-07-04173-6].]
#bibitem([11])[Wilhelm Winter and Joachim Zacharias, #emph[Completely positive maps of order zero], Münster J.
  Math. #strong[2] (2009), 311--324.
  #link("https://www.uni-muenster.de/FB10/mjm/vol_2/mjm_vol_2_14.pdf")[Published version].]
