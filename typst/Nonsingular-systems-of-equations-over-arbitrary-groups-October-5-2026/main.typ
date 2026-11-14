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

#align(center)[#text(size: 16pt, weight: "bold")[Nonsingular systems of equations over arbitrary groups]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

An equation over a group permits coefficients from that group and asks whether the unknowns can be realized in a
  larger group without identifying distinct coefficients. The exponent sums record the dependence on the unknowns
  after abelianization. A system whose exponent rows are independent is called nonsingular.
  We prove that every such finite system is solvable over every coefficient group.

Let $G$ be a group and let $F_n = F \( x_1 \, dots.h \, x_n \)$ be the free group on $n$ generators.
  A system over $G$ consists of words $w_1 \, dots.h \, w_m in G * F_n$, interpreted as equations $w_i = 1$.
  A solution over $G$ is a group $H$ containing an isomorphic copy of $G$, together with elements $h_1 \,
  dots.h \, h_n in H$ at which all the words evaluate to the identity.
  Define the #emph[exponent-sum matrix] $A = \( a_(i j) \) in M_(m times n) \( bb(Z) \)$ by the homomorphism

$ G * F_n arrow.r bb(Z)^n \, wide G mapsto 0 \, quad x_j mapsto e_j : wide
  w_i mapsto \( a_(i 1) \, dots.h \, a_(i n) \) . $

The system is #emph[nonsingular] if $"rank"_(bb(Q)) A = m$.
  Here $chevron.l #h(-0.16667em) chevron.l w_1 \, dots.h \,
  w_m chevron.r #h(-0.16667em) chevron.r$ denotes normal closure in $G * F_n$.

#thm([Theorem 1.])[
  (Nonsingular systems).  #emph[Let $G$ be any group, let $1 lt.eq m lt.eq n$ be integers, and let $w_1 \,
    dots.h \, w_m in G * F_n$. If their exponent-sum matrix has row rank $m$ over $bb(Q)$,
    then the canonical homomorphism
$ G arrow.r \( G * F_n \) \/ chevron.l #h(-0.16667em) chevron.l w_1 \, dots.h \,
  w_m chevron.r #h(-0.16667em) chevron.r $

 is injective. Equivalently, the system has a simultaneous solution in an overgroup of $G$.]
] <thm:main>

The equivalence follows from the universal property of the displayed quotient.
  If the canonical map is injective, the quotient itself supplies the overgroup and the images of the free
  generators supply the solution. Conversely, any solution induces a homomorphism from the quotient whose
  restriction to $G$ is injective. Thus solving the equations amounts to showing that their normal closure kills
  no nonidentity element of $G$. Theorem 1 imposes no countability, finiteness, or torsion condition on $G$.
  The same conclusion for arbitrary sets of equations and variables with independent exponent rows follows by a
  finite-relation argument in Remark 4.

=== 1.1 History and significance <history-and-significance>

The general solvability assertion for nonsingular systems is commonly called Howie’s conjecture;
  see [9] Introduction for this formulation and terminology.
  Its one-equation, one-variable case is the Kervaire–Laudenbach conjecture:
  a nonzero exponent sum should guarantee coefficient injectivity.
  This is stronger than the nontriviality assertion usually called the Kervaire conjecture,
  which asks whether adjoining one generator and imposing one relation can annihilate a nontrivial group.
  Chen explains these formulations and their connection with high-dimensional knot groups [3] Section 1.
  Theorem 1 establishes the finite nonsingular-system assertion for arbitrary coefficient groups.

The foundational system theorem is due to Gerstenhaber and Rothaus [4].
  For a square system over a compact connected Lie group, they compute the degree of the word map from the
  determinant of its exponent-sum matrix. A nonzero determinant therefore forces surjectivity and a simultaneous
  solution in that Lie group. Their finite-group theorem also produces a finite solution overgroup,
  using arithmetic specialization and reduction over finite fields.
  A nonsingular rectangular system reduces to the square case by retaining columns of a nonzero maximal minor and
  setting the other variables equal to the identity. Their argument established the usefulness of compact Lie
  groups, cohomology, and degree theory in a problem stated entirely in group-theoretic terms.

A different line of work uses the topology of relative presentations.
  Howie proved solvability of finite independent systems over locally indicable groups [6] Corollary 4.2;
  locally indicable means that every nontrivial finitely generated subgroup maps onto $bb(Z)$.
  Klyachko’s theorem treats a single equation in one variable over a torsion-free group when the exponent sum is
  $plus.minus 1$ [8]. This unimodular hypothesis is stronger than a nonzero exponent sum.
  Chen later recovered that theorem by estimating the complexity of surfaces in HNN extensions [3] Theorem 6.9.
  These results illustrate two complementary sources of control:
  algebraic conditions on the coefficient group and topological restrictions on diagrams witnessing a kernel element.

The compact-unitary method also passes to metric ultraproducts.
  Pestov observed its application to hyperlinear groups [14] Corollary 10.4,
  and Nitsche and Thom give the nonsingular-system statement explicitly [12] Theorem 1.2 and Lemma 2.1.
  Here a hyperlinear, or Connes-embeddable, group is one that embeds into a metric ultraproduct of unitary groups
  with their normalized Hilbert–Schmidt metrics. Their stronger Theorem 1.3 replaces nonsingularity by vanishing
  second homology of a covering of the presentation complex obtained after deleting the coefficients.
  For the presentation complex itself, vanishing second homology is precisely independence of the exponent rows.
  Their covering criterion therefore reaches beyond nonsingular systems while retaining the hypothesis on the
  coefficient group.

Other developments control the solution overgroup more closely.
  Klyachko, Mikheenko, and Roman’kov obtain solutions within specified classes of solvable groups with suitable
  torsion-free abelian factors [9]. Ramirez-Côté and Wise use the Banach fixed-point theorem for groups embedded
  in Magnus-type power-series groups; their nonsingular-system construction inverts the determinant in the
  coefficient ring [15] Theorems 9–10. Such conclusions address additional structure beyond existence in an
  arbitrary overgroup.

The direct antecedent of our proof is the spectral-phase and planar argument in #emph[The Kervaire theorem for
  groups] [13] Lemma 2.1, Lemma 3.1, and Theorem 4.1. Its fixed-plane incidence construction treats one unimodular
  relator. The extension below uses products of unitary groups and rational intersection classes to accommodate
  several relator types with different multiplicities. The cohomological background is classical [2];
  related geometry of unitary eigenvalue strata and their intersection classes is developed by Nicolaescu [11].
  In finite dimensions, spectral-phase subadditivity also follows from Thompson’s exponential formula [16].
  Antezana, Larotonda, and Varela prove an approximate version, in operator norm,
  for embeddable $upright("II")_1$ factors [1] Theorem 4.4.
  Our argument instead uses the faithful trace of the group von Neumann algebra [7] Section 3.3 and proves the
  required phase inequality directly, so the coefficients need no unitary approximation hypothesis.

=== 1.2 Proof and technical contribution <proof-and-technical-contribution>

The proof passes from a possible kernel relation to a planar surface.
  A finite product of conjugates of the relators is represented by disks whose boundaries read the relators or
  their inverses. Rectangular bands pair occurrences of the same variable with opposite signs.
  The remaining boundary arcs carry only coefficients from $G$. The key assertion is a boundary obstruction:
  on a connected planar surface of this form, if all but one boundary words are trivial in $G$,
  then the last is trivial as well. Removing the innermost components then proves injectivity.

Two independent estimates establish the obstruction. First,
  full row rank forces equal numbers of positive and negative disks of each relator type.
  Suppose these numbers are $k_i$ for the types present. A topological argument supplies unitary matrices mixing
  the $k_i$ copies of each type so that a finite-dimensional unitary matrix has at least $2 sum_i
  k_i$ fixed directions. Second, a spectral-phase function measures the boundary words through the left regular
  representation of $G$. Its subadditivity turns the fixed-space estimate into an upper bound.
  A direct calculation around the boundary circles attains that bound plus a nonnegative term measuring the
  possibly nontrivial boundary word. Euler characteristic makes the two constants agree,
  and faithfulness of the trace forces that word to be the identity.

The spectral-phase and planar-surface strategy comes from the one-relator unimodular theorem in [13].
  We give the required arguments in full. The principal extension is the multi-block fixed-space theorem in
  Section 2. It concerns block matrices built from independent unitary variables of possibly different sizes,
  followed by arbitrary fixed unitary matrices. Full row rank of the signed block-multiplicity matrix forces a
  simultaneous lower bound on the dimensions of their fixed spaces.
  The proof pairs fixed-subspace incidence cycles with the product of the unitary-variable groups.
  Only the maximal-length exterior terms in cohomology contribute;
  their coefficient is a product of nested nonzero minors. This makes rational nonsingularity sufficient and gives
  an intersection principle that is independent of its application to equations over groups.

Section 3 establishes the phase inequality in the finite operator algebra of the left regular representation and
  computes the phase of a weighted cyclic shift. Section 4 combines these results to prove the boundary
  obstruction. Section 5 constructs the planar surfaces from an arbitrary kernel relation and completes the proof.
  The unitary topology is used only for finite complex matrices on the copy indices;
  the group coefficients are retained as operators throughout.
  This separation allows the argument to apply to arbitrary coefficient groups.

== 2 Simultaneous fixed spaces <sec:fixed>

The rank hypothesis enters the proof through the following finite-dimensional statement.
  A unitary matrix may occur in several blocks, with either exponent $1$ or exponent $- 1$.
  Only the signed numbers of its occurrences matter for the lower bound on the total fixed-space dimension.
  The proof extends the single-matrix incidence argument of [13] Lemma 3.1 by using rational cohomology and nested
  nonzero minors to accommodate several unitary matrix variables.

#thm([Theorem 2.])[
  (Simultaneous fixed spaces).  #emph[Let $r gt.eq 0$ and $n gt.eq 1$, and let $k_1 \, dots.h \,
    k_r$ be positive integers. For each $j in { 1 \, dots.h \, n }$,
    let $cal(B)_j$ be a finite ordered list of pairs $\( i \, s \)$ with $1 lt.eq i lt.eq r$ and $s in { 1 \, -
    1 }$; repetitions are allowed. Set
$ d_j = sum_(\( i \, s \) in cal(B)_j) k_i \, wide b_(i j) = sum_(\( i' \, s \) in cal(B)_j\
i' = i) s \, wide B = \( b_(i j) \) . $

 Suppose that $B$ has row rank $r$ over $bb(Q)$. For arbitrary $P_j in upright(U) \( d_j \)$, define
$ D = product_(i = 1)^r upright(U) \( k_i \) \, wide F_j \( X \) =
  "diag"_(\( i \, s \) in cal(B)_j) \( X_i^s \) P_j quad \( X in D \) . $

 Then there is $X in D$ such that
#[#set math.equation(numbering: n => "(2.1)")
 $ sum_(j = 1)^n dim_(bb(C)) ker \( F_j \( X \) - I_(d_j) \) med gt.eq med sum_(i = 1)^r k_i . $ <eq:fixed-space-bound>]

 Here $upright(U) \( 0 \)$ and an empty product of groups are points,
   and the fixed-space dimension in dimension zero is zero.]
] <thm:fixed-space>

#proof[
  #emph[Choosing target dimensions.] The case $r = 0$ is immediate.
    Assume $r > 0$, and reorder the rows so that $k_1 gt.eq dots.h.c gt.eq k_r$.
    We first allocate the desired fixed-space dimensions among the maps $F_j$.
    There are distinct columns $j_1 \, dots.h \, j_r$ such that
  #[#set math.equation(numbering: n => "(2.2)")
   $ det B \[ 1 \, dots.h \, t divides j_1 \, dots.h \, j_t \] eq.not 0 wide \( 1 lt.eq t lt.eq r \) .
     $ <eq:fixed-nested-minors>]
  Indeed, the first $t$ rows have rank $t$. The columns chosen at the previous step remain independent on these
    rows, since their restrictions to the first $t - 1$ rows are independent;
    they can therefore be extended by one column. Define
  $ l_(j_t) = k_t quad \( 1 lt.eq t lt.eq r \) \, wide l_j = 0 quad upright("for unchosen columns") . $
  These choices satisfy $l_j lt.eq d_j$. To see this for $j = j_t$,
    the nonzero minor in (2.2) implies that $b_(i \, j_t) eq.not 0$ for some $i lt.eq t$.
    The list $cal(B)_(j_t)$ thus contains a block of size $k_i gt.eq k_t$. Moreover,
  #[#set math.equation(numbering: n => "(2.3)")
   $ sum_j l_j = sum_i k_i \, wide sum_j l_j^2 = sum_i k_i^2 = dim_(bb(R)) D . $ <eq:fixed-target-dimensions>]
  We will obtain $dim ker \( F_j \( X \) - I_(d_j) \) gt.eq l_j$ simultaneously.
    The equality of dimensions in (2.3) makes this an intersection problem of complementary dimensions.
    We develop the cohomology classes that detect the required intersection.
  #emph[Primitive cohomology classes.] All cohomology in this proof has coefficients in $bb(Q)$.
    The classical computation of unitary-group cohomology [2] Proposition 9.1 and Sections 19–20 gives generators
  #[#set math.equation(numbering: n => "(2.4)")
   $ H^(*) \( upright(U) \( d \) \; bb(Q) \) = Lambda \( e_(1 \, d) \, dots.h \, e_(d \, d) \) \,
     wide \| e_(a \, d) \| = 2 a - 1 \, $ <eq:fixed-unitary-cohomology>]
  where $Lambda$ denotes the exterior algebra. Compatibility means that inclusion as a coordinate block,
    with the identity on its complement, satisfies
  #[#set math.equation(numbering: n => "(2.5)")
   $ iota_(k \, d)^(*) e_(a \, d) = cases(delim: "{", e_(a \, k) \, & a lt.eq k \,, 0 \, & a > k .)
     $ <eq:fixed-block-restriction>]
  We will choose the generators to satisfy this compatibility and to be #emph[primitive]:
    if $mu$ is group multiplication, then
  #[#set math.equation(numbering: n => "(2.6)")
   $ mu^(*) e_(a \, d) = e_(a \, d) ⊗ 1 + 1 ⊗ e_(a \, d) . $ <eq:fixed-primitivity>]
  Thus these classes add under multiplication, just as degree-one classes do on a torus.
  For completeness, these properties follow together from the last-column bundle
  $ upright(U) \( d - 1 \) arrow.r upright(U) \( d \) arrow.r S^(2 d - 1) . $
  Start with the degree-one generator of $upright(U) \( 1 \) = S^1$.
    For $d gt.eq 2$, the base is simply connected, so the coefficient system in the multiplicative Serre spectral
    sequence is constant [10] Theorem 5.2 and Section 5.3. Its second page is
  $ E_2^(p \, q) = H^p \( S^(2 d - 1) \; bb(Q) \) ⊗ H^q \( upright(U) \( d - 1 \) \; bb(Q) \) . $
  Its only nonzero columns are $p = 0 \, 2 d - 1$. The only possible differential between them is $d_(2 d - 1)$,
    which sends fiber degree $q$ to degree $q - 2 d + 2$. Each fiber generator has degree at most $2 d - 3$,
    so its differential has negative target degree and vanishes.
    The differential vanishes on all their products by the product rule for the differential.
    Consequently the spectral sequence collapses. Its edge maps show that restriction to $upright(U) \( d - 1 \)$
    is an isomorphism in degrees below $2 d - 1$, and that the pullback of the sphere’s top class is nonzero.
    Lift each earlier generator in its degree, and take this sphere pullback as $e_(d \, d)$.
    Their exterior products give the basis in (2.4): they give that basis in the associated graded algebra
    supplied by the spectral sequence, and their squares vanish because they have odd degree and the coefficients
    are rational. This also proves compatibility with the standard inclusions.
  To check primitivity, subtract the two summands on the right of (2.6) from its left side.
    The difference restricts to zero on either factor at the identity,
    so every term in its Künneth decomposition has positive degree in both factors.
    Each such degree is at most $2 d - 2$. Restriction to $upright(U) \( d - 1 \) times
    upright(U) \( d - 1 \)$ is injective on all these bidegrees, by the edge-map isomorphism just proved.
    On this product the difference vanishes: for $a < d$ this is the induction hypothesis, and for $a =
    d$ it follows because $e_(d \, d)$ is pulled back by the last-column projection,
    which is constant on the fiber. This proves (2.6); the case $d = 1$ is immediate.
    Coordinate-block inclusions in other positions are conjugate to the standard one,
    and conjugation is homotopic to the identity in the connected group $upright(U) \( d \)$.
    Finally, inversion sends $e_(a \, d)$ to $- e_(a \, d)$, by pulling (2.6) back along $X mapsto \( X \, X^(- 1) \)$.
  #emph[The fixed-space incidence class.] We next construct a class that detects a fixed space of dimension at
    least $l$, for $0 lt.eq l lt.eq d$. Let
  $ R \( d \, l \) = { \( W \, E \) : W in upright(U) \( d \) \, med E in "Gr"_l \( bb(C)^d \) \, med W \|_E =
    I_E } \, wide p \( W \, E \) = W \, $
  where $"Gr"_l \( bb(C)^d \)$ is the complex Grassmannian of $l$-dimensional subspaces.
    Over a subspace $E$, the possible $W$ are precisely the unitary transformations of $E^perp$,
    extended by the identity on $E$. Orthonormal frame charts therefore make $R \( d \, l \)$ a smooth bundle over
    the Grassmannian with fiber $upright(U) \( d - l \)$. It is compact and without boundary, and
  $ dim_(bb(R)) R \( d \, l \) = 2 l \( d - l \) + \( d - l \)^2 = d^2 - l^2 . $
  The complex orientation of the Grassmannian and an orientation of $upright(U) \( d - l \)$ orient this bundle:
    changes of frame act on the fiber by conjugation and preserve orientation. Choose orientations and let
  $ alpha \( d \, l \) = "PD" #scale(x: 120%, y: 120%)[\(] p_(*) \[ R \( d \, l \) \] #scale(x: 120%, y: 120%)[\)]
    in H^(l^2) \( upright(U) \( d \) \; bb(Q) \) . $
  Here $"PD"$ is Poincaré duality [5] Theorem 3.30. It applies to the homology class pushed forward by $p$;
    the image of $p$ need not itself be a submanifold. Its image consists exactly of those $W$ with $dim
    ker \( W - I_d \) gt.eq l$.
  We recall the geometric interpretation of this class. If $M$ is a closed oriented manifold of dimension $l^2$
    and $f : M arrow.r upright(U) \( d \)$, then $chevron.l f^(*) alpha \( d \, l \) \, \[ M \]
    chevron.r$ is the intersection number of $f$ and $p$. When these maps are transverse,
    it is the signed count of pairs $\( x \, \( W \, E \) \)$ with $f \( x \) = p \( W \, E \)$.
    This follows by intersecting $f times p$ with the diagonal of $upright(U) \( d \) times upright(U) \( d \)$:
    transversality makes its inverse image a compact oriented zero-manifold,
    whose signed count gives the intersection pairing. In particular,
    disjoint images give intersection number zero: disjoint maps from compact manifolds have disjoint sufficiently
    small transverse perturbations. The same interpretation holds for products of these maps and classes.
  The part of $alpha \( d \, l \)$ we need is
  #[#set math.equation(numbering: n => "(2.7)")
   $ alpha \( d \, l \) = c_(d \, l) e_(1 \, d) dots.h.c e_(l \, d) +
     upright("terms with fewer than ") l upright(" generators") \, wide
     c_(d \, l) eq.not 0 . $ <eq:fixed-incidence-leading-term>]
  For $l = 0$, the map $p$ is the identity and we take $alpha \( d \, 0 \) = 1$ and $c_(d \, 0) = 1$.
    For $l > 0$, a product of $u$ distinct generators has degree at least $1 + 3 + dots.h.c + \( 2 u - 1 \) =
    u^2$. Since $alpha \( d \, l \)$ has degree $l^2$, its expansion contains at most $l$ generators in each term,
    and the sole possible term of length $l$ is the one displayed in (2.7).
  To show that its coefficient is nonzero, consider
  $ f : upright(U) \( l \) arrow.r upright(U) \( d \) \, wide f \( X \) = X xor \( - I_(d - l) \) . $
  There is exactly one intersection pair for $f$ and $p$: it has $X = I_l$, $W = W_0 = I_l xor \( - I_(d - l) \)$,
    and $E = E_0 = bb(C)^l xor 0$. Indeed, the second summand has no fixed vectors,
    while an $l$-dimensional fixed space in the first summand forces $X = I_l$. This intersection is transverse.
    Identify the tangent space at $W_0$ with skew-Hermitian matrices by right multiplication by $W_0^(- 1)$.
    Variations of $f$ fill the upper-left block; variations of $p$ in the fiber over $E_0$ fill the lower-right
    block. For a linear map $Z : E_0 arrow.r E_0^perp$, put
  $ T = mat(delim: "(", 0, - Z^(*); Z, 0) . $
  The path $\( e^(t T) W_0 e^(- t T) \, e^(t T) E_0 \)$ lies in $R \( d \, l \)$ and its image under $p$ has
    tangent vector
  $ \[ T \, W_0 \] W_0^(- 1) = 2 T . $
  These vectors supply every off-diagonal direction. The unique intersection therefore has multiplicity $1$ or $-
    1$. The map $f$ is homotopic to the coordinate inclusion, so (2.5) computes its pullback.
    Terms with an index above $l$ vanish; any remaining term with fewer than $l$ generators has degree less than
    $dim upright(U) \( l \) = l^2$. Only the displayed term in (2.7) can account for the nonzero intersection
    number, proving $c_(d \, l) eq.not 0$. The same argument includes $l = d$, when the complementary blocks are absent.
  #emph[Computing the intersection number.] We now apply these classes to the maps in the statement.
    Write $e_(a \, k_i)^(\( i \))$ for the generator pulled back from the $i$th factor of $D$.
    Primitivity, compatibility with block inclusions, and the inversion formula give
  #[#set math.equation(numbering: n => "(2.8)")
   $ F_j^(*) e_(a \, d_j) = sum_(i : thin k_i gt.eq a) b_(i j) e_(a \, k_i)^(\( i \))
     wide \( 1 lt.eq a lt.eq d_j \) . $ <eq:fixed-generator-pullback>]
  To justify the use of multiplication here, write a block diagonal map as the product of maps that act on one
    block and are the identity on all others. Each positive occurrence contributes one generator and each negative
    occurrence its negative. Right multiplication by $P_j$ is homotopic to the identity and has no effect on cohomology.
  Consider the top-degree class
  $ Omega = product_(j = 1)^n F_j^(*) alpha \( d_j \, l_j \) in H^(sum_i k_i^2) \( D \; bb(Q) \) . $
  The exterior algebra $H^(*) \( D \; bb(Q) \)$ has altogether $sum_i k_i$ generators, all of positive degree.
    A nonzero monomial of top degree must contain every one of them.
    By (2.8), pullback preserves the number of generators in each term, unless that term vanishes.
    It follows that any use of a shorter term from (2.7) contributes zero to $Omega$.
    Thus we need only compute the product of the displayed leading terms.
  For each $a in { 1 \, dots.h \, k_1 }$, put $t_a = \| { i : k_i gt.eq a } \|$.
    The rows with $k_i gt.eq a$ are $1 \, dots.h \, t_a$, and the selected columns with $l_j gt.eq a$ are $j_1 \,
    dots.h \, j_(t_a)$. Grouping the exterior factors of degree $2 a - 1$ together gives
  $ product_(t = 1)^(t_a) (sum_(i = 1)^(t_a) b_(i \, j_t) e_(a \, k_i)^(\( i \))) =
    det B \[ 1 \, dots.h \, t_a divides j_1 \, dots.h \, j_(t_a) \] product_(i = 1)^(t_a) e_(a \, k_i)^(\( i \)) . $
  Consequently the coefficient of the top monomial in $Omega$, up to an overall sign, is
  #[#set math.equation(numbering: n => "(2.9)")
   $ (product_(j = 1)^n c_(d_j \, l_j)) product_(a = 1)^(k_1) det
     B \[ 1 \, dots.h \, t_a divides j_1 \, dots.h \, j_(t_a) \] . $ <eq:fixed-top-coefficient>]
  Every factor is nonzero, by (2.2) and (2.7). Hence $chevron.l Omega \, \[ D \] chevron.r eq.not 0$.
  Finally, let $F = \( F_1 \, dots.h \, F_n \)$ and let $p_(upright("tot")) =
    product_j p$ be the map from $product_j R \( d_j \, l_j \)$ to $product_j upright(U) \( d_j \)$.
    Up to the harmless orientation sign, $Omega$ is the pullback by $F$ of the Poincaré dual of the cycle defined
    by $p_(upright("tot"))$. Its nonzero evaluation implies that these two maps have intersecting images.
    At an intersection, $F_j \( X \)$ fixes an $l_j$-plane for every $j$, which gives (2.1) by (2.3). ◻
]

== 3 Spectral phase <sec:phase>

The planar argument will associate unitary operators to the boundary circles of a surface.
  We need a nonnegative numerical invariant that detects the identity, is subadditive under multiplication,
  and can be calculated on a weighted cyclic shift. We develop these properties in the operator algebra of an
  arbitrary group, following the spectral-phase argument of [13] Lemma 2.1 and Section 4.3.

=== 3.1 The trace and the choice of phase <the-trace-and-the-choice-of-phase>

Let $G$ be any group, and let ${ delta_x : x in G }$ be the standard orthonormal basis of $ell^2 \( G \)$.
  Define left and right translations by

$ L \( a \) delta_x = delta_(a x) \, wide R_a delta_x = delta_(x a^(- 1)) . $

They commute. We work in the von Neumann algebra

$ cal(M) = { T in cal(B) \( ell^2 \( G \) \) : T R_a = R_a T upright(" for every ") a in G } \, $

which contains every $L \( a \)$. For a positive integer $d$,
  regard $M_d \( cal(M) \)$ as operators on $bb(C)^d ⊗ ell^2 \( G \)$ and set

#[#set math.equation(numbering: n => "(3.1)")
 $ tau_d \( T \) = sum_(j = 1)^d \( T_(j j) \)_(1 \, 1) \, wide tau = tau_1 . $ <eq:group-trace>]

Here $\( T_(j j) \)_(1 \, 1)$ is the coefficient of $delta_1$ in $T_(j j) delta_1$.
  The trace is #emph[unnormalized]: $tau_d \( I \) = d$. For the group von Neumann algebra and this trace
  construction, see [7] Section 3.3.

We record why this is a faithful normal trace, including when $G$ is uncountable.
  If $T in cal(M)$ and $T delta_1 = sum_x t_x delta_x$, commutation with right translations gives

$ T_(x \, y) = t_(x y^(- 1)) . $

For $A \, B in cal(M)$ with corresponding coefficient families $a \, b$,

$ tau \( A B \) = sum_(x in G) a_(x^(- 1)) b_x = sum_(x in G) b_(x^(- 1)) a_x = tau \( B A \) . $

These sums converge absolutely by Cauchy–Schwarz; each square-summable family has countable support.
  Summing over the matrix indices proves traciality of $tau_d$.
  Positivity and normality follow from its expression as a finite sum of vector functionals.
  If $T gt.eq 0$ and $tau_d \( T \) = 0$, then

$ 0 = sum_(j = 1)^d parallel T^(1 \/ 2) \( e_j ⊗ delta_1 \) #scale(x: 120%, y: 120%)[parallel]^2 . $

The square root commutes with all simultaneous right translations, so it kills $e_j ⊗ delta_x$ for every $j \, x$.
  Thus $T = 0$, proving faithfulness.

The bounded Borel functional calculus of a normal operator in $M_d \( cal(M) \)$ remains in this algebra.
  For a unitary $U$, its spectral projections define a finite measure $mu_U \( E \) =
  tau_d \( upright(bold(1))_E \( U \) \)$ on the unit circle $bb(T)$, and

#[#set math.equation(numbering: n => "(3.2)")
 $ tau_d \( f \( U \) \) = integral_(bb(T)) f thin d mu_U \, wide mu_U \( bb(T) \) = d . $ <eq:phase-spectral-integral>]

In particular, uniformly bounded pointwise convergence of Borel functions implies convergence of these trace
  evaluations.

Choose the phase with its cut at $1$ by

#[#set math.equation(numbering: n => "(3.3)")
 $ h \( e^(2 pi i t) \) = t - floor.l t floor.r \, wide ell \( U \) = tau_d \( h \( U \) \) . $ <eq:phase-definition>]

Thus $h \( 1 \) = 0$, and $h$ is right-continuous in the angle.
  Since $h \( U \) gt.eq 0$ and $U = exp \( 2 pi i h \( U \) \)$, faithfulness gives

#[#set math.equation(numbering: n => "(3.4)")
 $ ell \( U \) gt.eq 0 \, wide ell \( U \) = 0 med arrow.l.r.double med U = I . $ <eq:phase-faithful>]

The phase is invariant under unitary conjugation and additive on direct sums.
  On scalar matrices, viewed as matrices over $cal(M)$, it is the sum of the phases of the eigenvalues,
  counted with multiplicity.

=== 3.2 Subadditivity <subadditivity>

#thm([Lemma 3.1.])[
  (Spectral-phase subadditivity).  #emph[For every group $G$, every positive integer $d$, and all unitaries $U \,
    V in M_d \( cal(M) \)$,
$ ell \( U V \) lt.eq ell \( U \) + ell \( V \) . $

]
] <lem:phase-subadditivity>

#proof[
  Put $D = h \( V \)$ and join $U$ to $U V$ by the unitary path
  $ W_u = U e^(2 pi i u D) \, wide 0 lt.eq u lt.eq 1 . $
  We first calculate the change of a smooth function along this path,
    and then approximate the discontinuous function $h$ from the correct side of its cut.
    For $f in C^oo \( bb(T) \)$ write $f' \( e^(2 pi i t) \) = frac(d, d t) f \( e^(2 pi i t) \)$. We claim that
  #[#set math.equation(numbering: n => "(3.5)")
   $ frac(d, d u) tau_d \( f \( W_u \) \) = tau_d \( f' \( W_u \) D \) . $ <eq:phase-derivative>]
  Indeed, $W'_u = 2 pi i W_u D$. The product and inverse rules, followed by cyclic permutation inside the trace,
    give for every integer $k$
  $ frac(d, d u) tau_d \( W_u^k \) = 2 pi i k thin tau_d \( W_u^k D \) . $
  This proves (3.5) for Laurent polynomials. For smooth $f$,
    its Fourier coefficients satisfy $sum_(k in bb(Z)) \( 1 + \| k \| \) \| hat(f) \( k \) \| < oo$,
    while $parallel frac(d, d u) W_u^k parallel lt.eq 2 pi \| k \| parallel D parallel$.
    Thus the Fourier series and its differentiated series converge uniformly in operator norm, proving (3.5) in general.
  If $f$ is real-valued and $f' lt.eq 1$, then $I - f' \( W_u \) gt.eq 0$.
    Although $D$ need not commute with $W_u$, traciality gives the required inequality:
  $ tau_d \( D \) - tau_d \( f' \( W_u \) D \) = tau_d #scale(x: 120%, y: 120%)[\(]
    D^(1 \/ 2) \( I - f' \( W_u \) \) D^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  Integration of (3.5) therefore yields
  #[#set math.equation(numbering: n => "(3.6)")
   $ tau_d \( f \( U V \) \) - tau_d \( f \( U \) \) lt.eq tau_d \( D \) . $ <eq:phase-smooth-bound>]
  For $0 < epsilon < 1$, choose a nonnegative smooth function $rho_epsilon$ supported in $\( 0 \, epsilon \)$ with
    integral one, and define
  $ f_epsilon \( e^(2 pi i t) \) = integral_0^epsilon rho_epsilon \( s \) h \( e^(2 pi i \( t + s \)) \) thin d s . $
  This is a smooth function on the circle, with $0 lt.eq f_epsilon lt.eq 1$.
    For $delta > 0$ the fractional-part function satisfies
  $ h \( e^(2 pi i \( t + delta \)) \) - h \( e^(2 pi i t) \) lt.eq delta . $
  Averaging this inequality and taking the difference quotient shows that $f'_epsilon lt.eq 1$.
    Right-continuity gives $f_epsilon \( lambda \) arrow.r h \( lambda \)$ for every $lambda in bb(T)$.
    At the cut this follows explicitly from $0 lt.eq f_epsilon \( 1 \) lt.eq epsilon$;
    symmetric smoothing would not have this property. Apply (3.6) to $f_epsilon$ and pass to the limit by (3.2).
    Since $tau_d \( D \) = ell \( V \)$, the result is the stated inequality. ◻
]

The same right-continuity also gives, for any fixed $c gt.eq 0$,

#[#set math.equation(numbering: n => "(3.7)")
 $ lim_(epsilon arrow.b 0) ell \( e^(2 pi i c epsilon) U \) = ell \( U \) . $ <eq:phase-right-limit>]

In the opposite direction the identity has a jump: $ell \( e^(- 2 pi i epsilon) I_d \) =
  d \( 1 - epsilon \)$ for $0 < epsilon < 1$. These two behaviors at the cut will distinguish the possibly
  nontrivial boundary circle from the trivial ones in the planar argument.

=== 3.3 The phase of a weighted cycle <the-phase-of-a-weighted-cycle>

Subadditivity will give an upper bound on the operator associated to a surface.
  The following exact calculation will express its phase in terms of the boundary words.

#thm([Lemma 3.2.])[
  (Weighted-cycle formula).  #emph[Let $a$ be a positive integer, let $Q_1 \, dots.h \, Q_a in cal(M)$ be unitary,
    and define $T in M_a \( cal(M) \)$ by
$ T \( e_t ⊗ v \) = e_(t + 1) ⊗ Q_t v quad \( 1 lt.eq t lt.eq a \) \, wide e_(a + 1) = e_1 . $

 If $C = Q_a Q_(a - 1) dots.h.c Q_1$ is the product around the cycle starting at the first coordinate, then
#[#set math.equation(numbering: n => "(3.8)")
 $ ell \( T \) = frac(a - 1, 2) + tau \( h \( C \) \) . $ <eq:cycle-phase>]

]
] <lem:cycle-phase>

#proof[
  Put $zeta = e^(2 pi i \/ a)$. Conjugating $T$ by the scalar diagonal matrix with entries $1 \, zeta \, dots.h \,
    zeta^(a - 1)$ gives $zeta T$. Hence $ell \( zeta^j T \) = ell \( T \)$ for every integer $j$. The scalar identity
  $ sum_(j = 0)^(a - 1) h \( zeta^j lambda \) = frac(a - 1, 2) + h \( lambda^a \) \, wide lambda in bb(T) \, $
  follows by listing the fractional parts of the $a$ equally spaced angles;
    it holds also when one of them is zero. Applying bounded Borel functional calculus and taking the unnormalized
    trace gives
  $ a ell \( T \) = frac(a \( a - 1 \), 2) + tau_a \( h \( T^a \) \) . $
  The operator $T^a$ is diagonal. Its first diagonal entry is $C$,
    and the other entries are the products around the same cycle with different starting coordinates.
    Consecutive such products are conjugate by the corresponding $Q_t$,
    so every diagonal entry has phase trace $tau \( h \( C \) \)$.
    Thus $tau_a \( h \( T^a \) \) = a tau \( h \( C \) \)$, proving (3.8). ◻
]

== 4 The planar boundary obstruction <sec:planar>

We now combine the fixed-space theorem with the phase inequality.
  The result is a statement about a planar surface assembled from copies of the relators:
  if every boundary component but one reads the identity in $G$, then the remaining component does too.
  This extends the one-relator boundary argument of [13] Theorem 4.1 and Section 4;
  the new fixed-space input allows the different relator types to be treated simultaneously.

Cyclically conjugating the words does not change their normal closure or their exponent sums. We may therefore write

#[#set math.equation(numbering: n => "(4.1)")
 $ w_i = x_(nu_(i \, 1))^(s_(i \, 1)) g_(i \, 1) dots.h.c x_(nu_(i \, N_i))^(s_(i \, N_i)) g_(i \, N_i) \, wide
   g_(i \, t) in G \, quad s_(i \, t) in { 1 \, - 1 } \, quad 1 lt.eq nu_(i \, t) lt.eq n . $ <eq:word-slots>]

Here each occurrence is a single variable letter, coefficients may be the identity, and $N_i gt.eq
  1$ because the $i$th row of $A$ is nonzero.

A #emph[word disk of type $i$ and sign $+$ or $-$] is an oriented disk whose boundary reads $w_i$ or $w_i^(- 1)$,
  respectively. Its variable letters occupy disjoint closed intervals called #emph[slots],
  separated by nonempty #emph[corner arcs] carrying the coefficients.
  On both signs of disk, index the slots by the positions $t$ in (4.1). Indices are cyclic modulo $N_i$.
  The boundary data are then

#[#set math.equation(numbering: n => "(4.2)")
 $ upright("disk sign") & upright("successor of ") t & upright("variable at ") t & upright("corner after ") t\
+ & t + 1 & x_(nu_(i \, t))^(s_(i \, t)) & g_(i \, t)\
- & t - 1 & x_(nu_(i \, t))^(- s_(i \, t)) & g_(i \, t - 1)^(- 1) $ <eq:slot-conventions>]

The exponent $s_(i \, t)$ or $- s_(i \, t)$ in this table is the slot’s #emph[traversal sign].
  Attach rectangular bands to pairs of slots so that the orientations extend across the bands.
  Every slot is used once, and paired slots must have the same variable index and opposite traversal signs.
  The remaining boundary consists of corner arcs and band sides;
  its word in $G$ is obtained by reading the corner labels, with no label contributed by a band side.
  Changing the starting corner conjugates this word, so its triviality is well defined.

#thm([Proposition 4.1.])[
  (Planar boundary obstruction).  #emph[Let $w_1 \, dots.h \,
    w_m in G * F_n$ have exponent-sum matrix of row rank $m$ over $bb(Q)$.
    Let $Sigma$ be a connected oriented surface of genus zero obtained from a nonempty finite collection of signed
    word disks for these words by attaching bands that pair every slot exactly once,
    always with the same variable index and opposite traversal signs.
    If the words on all boundary components except possibly one are trivial in $G$,
    then every boundary word is trivial in $G$.]
] <prop:planar>

#proof[
  The proof estimates one unitary operator in two ways. Mixing disks of the same type gives an upper bound for its
    phase. Reading the operator around the boundary gives an exact phase formula.
    A choice of scalar phases at the end makes the two expressions differ only by the phase of the possibly
    nontrivial boundary word.
  #emph[Disk counts and boundary cycles.] Let $p_i$ and $m_i$ be the numbers of positive and negative disks of
    type $i$. Each band pairs opposite occurrences of the same variable, whence
  $ sum_i \( p_i - m_i \) a_(i j) = 0 wide \( 1 lt.eq j lt.eq n \) . $
  Row independence gives $p_i = m_i$. In the rest of this proof,
    let $I$ be the set of types that occur and write $k_i = p_i = m_i gt.eq 1$ for $i in I$. Set
  #[#set math.equation(numbering: n => "(4.3)")
   $ K = sum_(i in I) k_i \, wide b = sum_(i in I) N_i k_i . $ <eq:disk-band-counts>]
  Thus $Sigma$ has $2 K$ disks, $2 b$ slots, and $b$ bands.
  Let $cal(D)$ be the set of slots. The successor permutation $sigma$ follows the oriented boundary of each disk;
    the fixed-point-free involution $theta$ pairs the ends of each band.
    For $d in cal(D)$, write $c_d in G$ for the label on the corner from the end of $d$ to the start of $sigma d$,
    as specified in (4.2). Starting at the start of slot $d$,
    a boundary path crosses a band side to the end of $theta d$,
    then follows its corner to the start of $sigma theta d$; see Figure 1.
    Consequently the cycles $z$ of $sigma theta$ are exactly the boundary components.
    If $z = \( d_1 \, dots.h \, d_a \)$ is written in this order, put
  #[#set math.equation(numbering: n => "(4.4)")
   $ a \( z \) = a \, wide r_z = c_(theta d_1) dots.h.c c_(theta d_a) . $ <eq:boundary-word>]
  The nonempty corner arcs ensure that there is at least one boundary component.
    If $q$ denotes their number, genus zero gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ 2 - q = chi \( Sigma \) = 2 K - b \, wide sum_z a \( z \) = 2 b . $ <eq:planar-euler>]
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (3.72, 1.069), fill: rgb("#f5f5f5"), stroke: none)
  line((0, 1.069), (3.72, 1.069), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (0, 1.069), stroke: (paint: rgb("#737373"), thickness: 1.2pt, miter-limit: 10))
  line((3.72, 0), (3.72, 1.069), stroke: (paint: rgb("#737373"), thickness: 1.2pt, miter-limit: 10))
  line((0, 0), (2.046, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.046, 0), (3.72, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((3.72, 0), (5.348, -0.4464), (4.045, -0.744), (4.743, -0.8835), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  bezier((5.348, -0.4464), (5.905, 0.1395), (5.58, -0.279), (5.766, -0.093), stroke: (paint: rgb("#737373"), thickness: 1.2pt, miter-limit: 10))
  line((3.72, 1.069), (3.906, 1.534), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((5.905, 0.1395), (6.138, 0.6045), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 1.069), (-0.186, 1.534), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((0, 0), radius: 0.05644, fill: black, stroke: none)
  circle((3.72, 0), radius: 0.05644, fill: black, stroke: none)
  circle((5.348, -0.4464), radius: 0.05644, fill: black, stroke: none)
  content((0, 0.6045), [#text(size: 9pt)[$d$]], anchor: "east", padding: 0.1176cm)
  content((3.72, 0.6045), [#text(size: 9pt)[$theta d$]], anchor: "west", padding: 0.1176cm)
  content((1.86, 0.7905), [#text(size: 9pt)[band]])
  content((1.674, 0.0744), [#text(size: 9pt)[band side]], anchor: "south", padding: 0.1176cm)
  content((0, -0.0465), [#text(size: 9pt)[start of $d$]], anchor: "north-east", padding: 0.1176cm)
  content((3.72, -0.1116), [#text(size: 9pt)[end of $theta d$]], anchor: "north-east", padding: 0.1176cm)
  content((4.883, -0.9486), [#text(size: 9pt)[corner $c_( theta d)$]], anchor: "north", padding: 0.1176cm)
  content((5.487, -0.6045), [#text(size: 9pt)[start of#linebreak()$sigma theta d$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: One boundary step, with the attached slots drawn as thick gray intervals. The arrow crosses a band side and then follows the corner after the partner slot. This gives the permutation $sigma theta$ and the label $c_(theta d)$. The drawing is local: the disk signs and types are unspecified, and the two band ends may lie on the same disk. ],
  ) <fig:boundary-step>
  #emph[Distributing phases among boundary components.] For any real numbers $\( eta_z \)_z$ with $sum_z eta_z =
    0$, we can choose real numbers $\( gamma_d \)_(d in cal(D))$ such that
  #[#set math.equation(numbering: n => "(4.6)")
   $ gamma_(theta d) = - gamma_d \, wide sum_(d in z) gamma_d = eta_z . $ <eq:boundary-flow>]
  To see this, form a graph whose vertices are the boundary cycles and whose edges are the pairs ${ d \,
    theta d }$, with an end incident to the cycle containing that slot. Loops and multiple edges are allowed.
    Connectedness of $Sigma$ means that $sigma$ and $theta$ act transitively on $cal(D)$.
    Since $sigma theta$ and $theta$ generate the same permutation group, this graph is connected.
    Choose a spanning tree and set the values on all other edges to zero.
    At a leaf, set the value at its end of the remaining edge equal to its prescribed sum and the value at the
    other end to its negative; remove the leaf and adjust the prescribed sum at its neighbor.
    The zero total ensures the last vertex is satisfied. This proves (4.6), including the one-vertex case.
  Use the algebra $M_(2 b) \( cal(M) \)$ of Section 3, acting on $bb(C)^(cal(D)) ⊗ ell^2 \( G \)$, and define
  #[#set math.equation(numbering: n => "(4.7)")
   $ S \( e_d ⊗ v \) & = e_(sigma d) ⊗ L \( c_d^(- 1) \) v \,\
Theta \( e_d ⊗ v \) & = e^(2 pi i gamma_d) e_(theta d) ⊗ v . $ <eq:surface-operators>]
  Both operators are unitary, and (4.6) gives $Theta^2 = I$.
    We identify scalar matrices with their tensor products with the identity on $ell^2 \( G \)$;
    their trace $tau_(2 b)$ is therefore the ordinary matrix trace.
  #emph[The upper phase bound.] We will choose a scalar unitary involution $J$ and use the factorization $S
    Theta = \( S J \) \( J Theta \)$. We arrange that $S J$ is an involution with known phase,
    and use the fixed-space theorem to give $J Theta$ many fixed vectors.
    For each $i in I$, order the $k_i$ disks of each sign. At each position $t$,
    their slots form two coordinate spaces, each identified with $bb(C)^(k_i)$.
    Given $X_i in upright(U) \( k_i \)$, define a scalar unitary involution $J$ by sending the positive array at
    $\( i \, t \)$ to the negative array by $X_i$, and the negative array back by $X_i^(- 1)$.
    The same $X_i$ is used at every position of type $i$.
  The corner conventions give
  #[#set math.equation(numbering: n => "(4.8)")
   $ J S J = S^(- 1) . $ <eq:reversal-involution>]
  Indeed, on positive arrays $S$ moves from $t$ to $t + 1$ with coefficient $L \( g_(i \, t)^(- 1) \)$,
    whereas on negative arrays it moves from $t$ to $t - 1$ with coefficient $L \( g_(i \, t - 1) \)$.
    Applying $J$ on either side interchanges these rules; its factors $X_i$ and $X_i^(- 1)$ cancel because the
    coefficients are constant across each array and commute with scalar matrices.
    Thus $S J$ is a unitary involution. It exchanges the two disk signs, so its diagonal blocks,
    and hence its trace, are zero. Its $- 1$ spectral projection $\( I - S J \) \/ 2$ has trace $b$, giving
  #[#set math.equation(numbering: n => "(4.9)")
   $ ell \( S J \) = b / 2 . $ <eq:disk-involution-phase>]
  We now choose the $X_i$ so that $J Theta$ has many fixed vectors.
    Regroup the scalar coordinates by variable index $j$ and traversal sign into spaces $V_(j \, +)$ and
    $V_(j \, -)$. For each occurrence $\( i \, t \)$ with $nu_(i \, t) = j$,
    each space has one block of dimension $k_i$: the positive or negative disk array is selected according to its
    traversal sign. In particular both spaces have dimension
  $ d_j = sum_(i in I \, med 1 lt.eq t lt.eq N_i\
nu_(i \, t) = j) k_i \, wide sum_j d_j = b . $
  Both $J$ and $Theta$ exchange $V_(j \, +)$ and $V_(j \, -)$.
    Under the array coordinates, let $P_j in upright(U) \( d_j \)$ represent $Theta : V_(j \, +) arrow.r
    V_(j \, -)$. On the return map $J : V_(j \, -) arrow.r V_(j \, +)$,
    the block at $\( i \, t \)$ is $X_i^(- s_(i \, t))$. Hence
  #[#set math.equation(numbering: n => "(4.10)")
   $ \( J Theta \) \|_(V_(j \, +)) = "diag"_(\( i \, t \) : thin nu_(i \, t) = j) \( X_i^(- s_(i \, t)) \) P_j .
     $ <eq:fixed-space-application>]
  The signed block counts here are $sum_(t : nu_(i \, t) = j) \( - s_(i \, t) \) = - a_(i j)$.
    The matrix formed by the rows of $- A$ indexed by $I$ has full row rank, so Theorem 2 supplies $X_i$ for which
  $ dim_(bb(C)) ker #scale(x: 120%, y: 120%)[\(] \( J Theta - I \) \|_(xor.big_j V_(j \, +))
    #scale(x: 120%, y: 120%)[\)] gt.eq K . $
  There are equally many fixed vectors on $xor.big_j V_(j \, -)$:
    $J$ interchanges the two sums and satisfies $J \( J Theta \) J = \( J Theta \)^(- 1)$.
    Thus the full fixed-space dimension $f$ of the scalar matrix $J Theta$ is at least $2 K$.
    The same conjugacy makes its eigenvalue multiset invariant under $lambda mapsto lambda^(- 1)$.
    Since $h \( lambda \) + h \( lambda^(- 1) \) = 1$ for $lambda eq.not 1$ and is zero at $1$,
  $ 2 ell \( J Theta \) = 2 b - f lt.eq 2 b - 2 K . $
  Using $S Theta = \( S J \) \( J Theta \)$, (4.9) and Lemma 1 now give
  #[#set math.equation(numbering: n => "(4.11)")
   $ ell \( S Theta \) lt.eq 3 / 2 b - K . $ <eq:surface-phase-upper>]
  This holds for every phase distribution in (4.6); the auxiliary choice of $J$ may depend on that distribution.
  #emph[The boundary formula and the cut limit.] It remains to read the left side of (4.11) from the boundary.
    On the coordinates of a cycle $z = \( d_1 \, dots.h \, d_a \)$ of $sigma theta$,
    the operator $S Theta$ is a weighted cyclic shift $T_z$ whose step from $d_t$ to $d_(t + 1)$ has weight
    $e^(2 pi i gamma_(d_t)) L \( c_(theta d_t)^(- 1) \)$. The circuit starting at $d_1$ therefore has weight
  $ e^(2 pi i sum_(d in z) gamma_d) L \( c_(theta d_a)^(- 1) dots.h.c c_(theta d_1)^(- 1) \) =
    e^(2 pi i eta_z) L \( r_z^(- 1) \) . $
  Lemma 2 yields the exact formula
  #[#set math.equation(numbering: n => "(4.12)")
   $ ell \( T_z \) = frac(a \( z \) - 1, 2) + tau #scale(x: 120%, y: 120%)[\(]
     h \( e^(2 pi i eta_z) L \( r_z^(- 1) \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:boundary-phase>]
  Choose the possibly exceptional component $z_0$, and for $epsilon.alt > 0$ set
  $ eta_z = - epsilon.alt quad \( z eq.not z_0 \) \, wide eta_(z_0) = \( q - 1 \) epsilon.alt . $
  These phases sum to zero, so (4.11) applies. For $z eq.not z_0$, the assumption $r_z =
    1$ makes the last term of (4.12) equal to $1 - epsilon.alt$ when $0 < epsilon.alt < 1$.
    For $z_0$, the scalar phase approaches zero from the nonnegative side.
    Thus $h \( e^(2 pi i \( q - 1 \) epsilon.alt) lambda \) arrow.r
    h \( lambda \)$ at every point of the unit circle, including $lambda = 1$.
    Bounded convergence in the spectral measure gives
  $ tau #scale(x: 120%, y: 120%)[\(] h \( e^(2 pi i \( q - 1 \) epsilon.alt) L \( r_(z_0)^(- 1) \) \)
    #scale(x: 120%, y: 120%)[\)] arrow.r tau #scale(x: 120%, y: 120%)[\(] h \( L \( r_(z_0)^(- 1) \) \)
    #scale(x: 120%, y: 120%)[\)] . $
  This also covers $q = 1$, when the scalar phase is identically zero.
    Summing (4.12) over all cycles and using (4.5), we obtain
  $ lim_(epsilon.alt arrow.b 0) ell \( S Theta \) & = frac(2 b - q, 2) + q - 1 +
    tau #scale(x: 120%, y: 120%)[\(] h \( L \( r_(z_0)^(- 1) \) \) #scale(x: 120%, y: 120%)[\)]\
 & = 3 / 2 b - K + tau #scale(x: 120%, y: 120%)[\(] h \( L \( r_(z_0)^(- 1) \) \) #scale(x: 120%, y: 120%)[\)] . $
  The upper bound (4.11) forces the last trace to be zero. Faithfulness of $tau$ and nonnegativity of $h$ imply
    $L \( r_(z_0)^(- 1) \) = I$. Applying this operator to $delta_1$ gives $r_(z_0) = 1$, as required. ◻
]

== 5 From a kernel relation to a solution <sec:kernel>

We now apply Proposition 3 to prove Theorem 1. The required surfaces must be embedded in a disk:
  an arbitrary pairing of variable occurrences would not guarantee planarity.
  Following the construction in [13] Section 5, we obtain the bands as level arcs of the variable-circle maps on a
  punctured disk. This also ensures that the coefficient map is constant along every band.

=== 5.1 A punctured disk for the relation <a-punctured-disk-for-the-relation>

Let $g in G$ lie in the normal closure of the relators. By definition, there is a finite expression in $G * F_n$

#[#set math.equation(numbering: n => "(5.1)")
 $ g = product_(alpha = 1)^u b_alpha w_(i_alpha)^(epsilon.alt_alpha) b_alpha^(- 1) \, wide b_alpha in G * F_n \,
   wide epsilon.alt_alpha in { 1 \, - 1 } . $ <eq:normal-product>]

If $u = 0$, then $g = 1$. Assume $u > 0$. Use the cyclic representatives of the relators chosen in Section 4;
  conjugating a relator only changes the corresponding conjugators in (5.1).

Choose a based CW presentation space $Y$ with $pi_1 \( Y \) = G$, and put

$ Y' = Y or S_1^1 or dots.h.c or S_n^1 . $

The added circles represent the variables, so $pi_1 \( Y' \) = G * F_n$.
  Choose based loops in $Y$ for the coefficients and for $g$. No asphericity or finiteness property of $Y$ is needed.

Let $Delta$ be an oriented polygonal disk and remove the interiors of $u$ disjoint polygonal disks $D_alpha$ in
  its interior. On the resulting punctured disk

$ P = Delta \\ union.big_(alpha = 1)^u "int" D_alpha $

there is a map $f : P arrow.r Y'$ with these boundary values:
  the outer boundary reads $g$ in $Y$, and $partial D_alpha$, oriented as the boundary of the missing disk,
  reads $w_(i_alpha)^(epsilon.alt_alpha)$. Each variable letter is represented by one monotone traversal of its
  circle. The intervening coefficient intervals are mapped to the chosen loops in $Y$;
  retain an interval even when its label is the identity.

Here is an explicit reason that these values extend over $P$.
  Cut $P$ along disjoint arcs from the outer boundary to the holes, and map those arcs to the loops for $b_alpha$.
  Place their outer endpoints in a constant portion of the outer loop,
  with the holes encountered in reverse order after the outer traversal. The boundary of the cut disk reads

$ g #scale(x: 120%, y: 120%)[\(] b_u w_(i_u)^(epsilon.alt_u) b_u^(- 1) #scale(x: 120%, y: 120%)[\)]^(- 1) dots.h.c
  #scale(x: 120%, y: 120%)[\(] b_1 w_(i_1)^(epsilon.alt_1) b_1^(- 1) #scale(x: 120%, y: 120%)[\)]^(- 1) . $

It is nullhomotopic by (5.1). A nullhomotopy extends the map across the cut disk.
  The two copies of each cut arc have the same map with opposite traversal, so the extension descends to $P$.
  Notice that the induced boundary orientation of $P$ on a hole is opposite to the missing-disk orientation;
  this explains the inverses in the displayed word.

=== 5.2 Disjoint bands from circle levels <disjoint-bands-from-circle-levels>

Let $f_j : P arrow.r S_j^1 = bb(R) \/ bb(Z)$ be the projection of $f$ that collapses all the other wedge summands,
  and let $v : P arrow.r Y$ be the coefficient projection. We construct bands on which $v$ is exactly constant,
  without changing the boundary values of any $f_j$.

Choose a common sufficiently fine finite triangulation of $P$ and piecewise affine circle maps $tilde(f)_j$ satisfying

$ tilde(f)_j \|_(partial P) = f_j \|_(partial P) \, wide "dist" \( tilde(f)_j \( p \) \, f_j \( p \) \) < 1 /
  12 quad \( p in P \) . $

These approximations can be constructed directly. The boundary maps are already piecewise affine in the angular
  coordinate. Subdivide to respect their breakpoints and so finely that the image of each triangle under each
  $f_j$ lies in a short arc of the circle. Lift that arc to $bb(R)$ and interpolate its vertex values.
  The lifts on a shared edge differ by an integer, so the interpolants agree as circle maps.
  Uniform continuity gives the stated error bound.

For each $j$, choose $t_j in \( 1 \/ 3 \, 2 \/ 3 \)$ that is not the image of any vertex under $tilde(f)_j$.
  The level set $tilde(f)_j^(- 1) \( t_j \)$ is a finite disjoint union of polygonal circles and properly embedded
  polygonal arcs. On each triangle it consists of line segments,
  and avoidance of vertices makes the segments join without branching.
  Since the approximation is fixed on the boundary, there is exactly one endpoint for each occurrence of
  $x_j^(plus.minus 1)$ on a hole and no endpoint on the outer boundary or on a coefficient interval.

These level sets are disjoint for different indices. Indeed,
  at a point of $tilde(f)_j^(- 1) \( t_j \)$ the original $f_j$ is at distance more than $1 \/
  4$ from the circle basepoint. Thus $f$ lands in the $j$th variable circle away from the wedge point,
  and all its other circle projections vanish. The same remains true in a neighborhood of the level set.
  In particular, $v$ is constant at the basepoint on that neighborhood.
  This argument uses the original wedge-valued map $f$; the separately approximated maps need not themselves
  combine to a map into the wedge.

Discard the closed level curves and choose thin, mutually disjoint rectangular neighborhoods of the proper arcs
  inside these neighborhoods. They are the bands. Each meets the holes in small intervals inside the corresponding
  variable traversals, and every occurrence has exactly one such interval.
  Coorientation of a circle level makes the two endpoint crossing signs of an arc opposite with respect to the
  boundary orientation of $P$. Reversing both orientations to the missing-disk orientations leaves the signs
  opposite. Hence each band pairs the same variable with opposite traversal signs, as required in Proposition 3.

Use the smaller attachment intervals as the slots. The pieces of a variable traversal outside its slot project
  constantly to $Y$, so shrinking the slots does not change any coefficient label between them.
  Moreover, $v$ is constant on every band. Reinsert the disks $D_alpha$ as the signed word disks.
  Their union with the bands is a compact surface embedded in the interior of $Delta$, with every slot paired.
  Every connected component is planar, and its boundary words are exactly the loops supplied by $v$ on those
  boundary circles.

=== 5.3 Filling from the inside out <filling-from-the-inside-out>

It remains to account for the possibility of several components nested inside one another.
  Each connected component has one exterior boundary circle whose Jordan disk contains the component;
  its other boundary circles enclose the inner complementary disks.
  The exterior Jordan disks of distinct components are disjoint or nested.
  Choose a component whose exterior disk is minimal under inclusion.
  Its inner complementary disks contain no other component, and hence contain no missing word disk.
  The coefficient map $v$ is already defined on each of them. Their boundary words are therefore trivial in $G$.

Proposition 3 now implies that the exterior boundary word of the chosen component is also trivial.
  Its exact boundary loop extends to a map of its Jordan disk into $Y$.
  Replace $v$ inside that disk by this extension. The two maps agree on the boundary, so they paste continuously.
  No other component lies in the disk, and the coefficient labels and band constants on all remaining components
  are unchanged.

Repeating this finite procedure removes all components. The result is a map $Delta arrow.r
  Y$ extending the original outer loop for $g$. Consequently $g = 1$ in $G$.
  This proves the injectivity in Theorem 1; its quotient supplies the simultaneous solution. 0◻

#prodef([Remark 5.1.])[
  The finite statement also implies the version with arbitrary sets of variables and equations.
    Assume the exponent rows, each of finite support, are linearly independent over $bb(Q)$.
    Any element of $G$ killed in the quotient has a normal-closure expression involving only finitely many
    relators and finitely many variables, including those in its conjugators.
    The corresponding finite exponent matrix still has independent rows, so Theorem 1 makes that element trivial.
] <rem:infinite-systems>

#heading(level: 1)[References]
#bibitem([1])[J.~Antezana, G.~Larotonda, and A.~Varela, #emph[Thompson-type formulae], J. Funct. Anal.
  #strong[262] (2012), no.~4, 1515--1528.
  #link("https://doi.org/10.1016/j.jfa.2011.11.011")[doi:10.1016/j.jfa.2011.11.011].]
#bibitem([2])[A.~Borel, #emph[Sur la cohomologie des espaces fibrés principaux et des espaces homogènes de groupes
  de Lie compacts], Ann. of Math. (2) #strong[57] (1953), no.~1, 115--207.
  #link("https://doi.org/10.2307/1969728")[doi:10.2307/1969728].]
#bibitem([3])[L.~Chen, #emph[The Kervaire conjecture and the minimal complexity of surfaces], Trans. Amer. Math.
  Soc. #strong[379] (2026), 587--626. #link("https://arxiv.org/abs/2302.09811")[arXiv:2302.09811].]
#bibitem([4])[M.~Gerstenhaber and O.~S.~Rothaus, #emph[The solution of sets of equations in groups], Proc. Nat.
  Acad. Sci. U.S.A. #strong[48] (1962), no.~9, 1531--1533.
  #link("https://doi.org/10.1073/pnas.48.9.1531")[doi:10.1073/pnas.48.9.1531].]
#bibitem([5])[A.~Hatcher, #emph[Algebraic Topology], Cambridge University Press, Cambridge, 2002.]
#bibitem([6])[J.~Howie, #emph[On pairs of $2$-complexes and systems of equations over groups], J. Reine Angew.
  Math. #strong[324] (1981), 165--174.
  #link("https://doi.org/10.1515/crll.1981.324.165")[doi:10.1515/crll.1981.324.165].]
#bibitem([7])[V.~F.~R.~Jones, #emph[Von Neumann Algebras], lecture notes, 1 October 2009.
  #link("https://math.berkeley.edu/~vfr/VonNeumann2009.pdf").]
#bibitem([8])[A.~A.~Klyachko, #emph[A funny property of sphere and equations over groups], Comm.
  Algebra #strong[21] (1993), no.~7, 2555--2575.
  #link("https://doi.org/10.1080/00927879308824692")[doi:10.1080/00927879308824692].]
#bibitem([9])[A.~A.~Klyachko, M.~A.~Mikheenko, and V.~A.~Roman'kov, #emph[Equations over solvable groups], J.
  Algebra #strong[638] (2024), 739--750.
  #link("https://doi.org/10.1016/j.jalgebra.2023.10.004")[doi:10.1016/j.jalgebra.2023.10.004].]
#bibitem([10])[J.~McCleary, #emph[A User's Guide to Spectral Sequences], second ed.,
  Cambridge Studies in Advanced Mathematics, vol.~58, Cambridge University Press, Cambridge, 2001.]
#bibitem([11])[L.~I.~Nicolaescu, #emph[Schubert calculus on the Grassmannian of hermitian lagrangian spaces], Adv.
  Math. #strong[224] (2010), no.~6, 2361--2434.
  #link("https://doi.org/10.1016/j.aim.2010.02.003")[doi:10.1016/j.aim.2010.02.003].]
#bibitem([12])[M.~Nitsche and A.~Thom, #emph[Universal solvability of group equations], J.
  Group Theory #strong[25] (2022), no.~1, 1--10.
  #link("https://doi.org/10.1515/jgth-2019-0167")[doi:10.1515/jgth-2019-0167].]
#bibitem([13])[OpenAI, #emph[The Kervaire theorem for groups],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-Kervaire-Theorem-for-Groups-September-24-2026/The-Kervaire-Theorem-for-Groups-September-24-2026.pdf")[OAI:The-Kervaire-Theorem-for-Groups-September-24-2026],
  2026.]
#bibitem([14])[V.~G.~Pestov, #emph[Hyperlinear and sofic groups: a brief guide], Bull.
  Symbolic Logic #strong[14] (2008), no.~4, 449--480. #link("https://arxiv.org/abs/0804.3968")[arXiv:0804.3968].]
#bibitem([15])[A.~Ramirez-Côté and D.~T.~Wise, #emph[The Kervaire conjecture via Banach fixed points in power
  series groups], Math. Z. #strong[311] (2025), article~6.
  #link("https://doi.org/10.1007/s00209-025-03753-3")[doi:10.1007/s00209-025-03753-3].]
#bibitem([16])[R.~C.~Thompson, #emph[Proof of a conjectured exponential formula],
  Linear Multilinear Algebra #strong[19] (1986), no.~2, 187--197.
  #link("https://doi.org/10.1080/03081088608817715")[doi:10.1080/03081088608817715].]
