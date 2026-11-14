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

#align(center)[#text(size: 16pt, weight: "bold")[Integral points on character varieties of curves]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

Let $X$ be a smooth connected complex algebraic curve and let $r gt.eq 1$.
  Its $"SL"_r$-character variety parametrizes semisimple representations of $pi_1 \( X \)$ up to isomorphism.
  Although $X$ need not be defined over a number field, this character variety has a natural integral model:
  a finite presentation of its fundamental group gives a representation scheme over $bb(Z)$,
  and we take the spectrum of its ring of conjugation invariants. Write this affine scheme as $M_r \( X \)$.

An arithmetic question is whether its integral points become Zariski dense after extending the ground field once.
  Here integrality always refers to the full ring of integers.
  We prove this for curves, retaining arbitrary quasi-unipotent conjugacy classes at the punctures.

Let $overline(X)$ be the smooth projective completion of $X$, and write $overline(X) \\ X = { x_1 \, dots.h \,
  x_s }$. For each $i$, fix a positive meridian $gamma_i$ about $x_i$.
  A matrix is #emph[quasi-unipotent] if all its eigenvalues are roots of unity.
  Choose quasi-unipotent conjugacy classes $C_i subset "SL"_r \( bb(C) \)$,
  and let $Y$ be the reduced locus in $M_r \( X \)_(bb(C))$ whose semisimple representations have
  $rho \( gamma_i \) in C_i$. This condition allows nonsemisimple boundary matrices:
  semisimplicity of a representation is a condition on the whole group action.
  The locus $Y$ is locally closed, as explained in Section 2.

For a number field $L subset bb(C)$, write $cal(O)_L$ for its full ring of integers.
  We use #emph[ambient] integrality on $Y$: a point extends to $M_r \( X \)$ over $cal(O)_L$,
  and its complex semisimple representation has the specified boundary classes.
  It need not avoid smaller Jordan classes after reduction at every finite prime.
  Requiring a section of a strict locally closed integral model is a different condition.

#thm([Theorem 1.1.])[
  #emph[Let $X$ be a smooth connected complex algebraic curve and let $r gt.eq 1$.
    For prescribed quasi-unipotent conjugacy classes $C_1 \, dots.h \, C_s$ as above,
    let $K subset bb(C)$ be a number field containing their eigenvalues. There is a finite extension $L \/ K$ such that
$ M_r \( X \) \( cal(O)_L \) ∩ Y \( bb(C) \) $

 is Zariski dense in $Y$, and hence in every irreducible component of $Y$.
   The same conclusion holds when only the characteristic polynomial of each boundary monodromy is prescribed,
   with all its roots roots of unity. It also holds for the entire character variety without boundary conditions;
   in that case one may take $K = bb(Q)$.]
  #emph[For the relative statements and for projective $X$, one may take distinct primes $p \, q > r$ and
#[#set math.equation(numbering: n => "(1)")
 $ F = K \( sqrt(2) \, zeta_(p q) \) \, wide L = F #scale(x: 120%, y: 120%)[\(] zeta_r \, { u^(1 \/ r) :
   u in cal(O)_F^times } #scale(x: 120%, y: 120%)[\)] \, $ <eq:main-field>]

 where $zeta_m$ denotes a primitive $m$th root of unity. In the projective case there are no boundary conditions
   and $K = bb(Q)$.]
] <thm:main>

The extension in (1) is finite because the unit group of $cal(O)_F$ is finitely generated.
  It is fixed for the entire locus, including all its components.
  No restriction on the genus or on the Jordan forms is imposed.

For a nonprojective curve without boundary conditions, density already holds over $bb(Z)$:
  the fundamental group is free and $"SL"_r \( bb(Z) \)$ is Zariski dense in $"SL"_r \( bb(C) \)$.
  The substantive cases here are prescribed boundary monodromy and projective curves,
  where the surface relation couples the matrices. We construct actual integral representations and then pass to
  their characters; the exact boundary conditions are selected only after this passage.

=== 1.1 History and relation to previous work <history-and-relation-to-previous-work>

The arithmetic study of local systems includes Simpson’s conjecture that rigid irreducible representations of
  smooth projective fundamental groups are defined over rings of integers #cite(label("Simpson1992")) p. 9.
  Esnault and Groechenig prove integrality for irreducible cohomologically rigid local systems with finite
  determinant and quasi-unipotent boundary monodromy on smooth quasiprojective
  varieties #cite(label("EsnaultGroechenig2018")) Theorem 1.1.
  Here an integral local system may have a finite projective lattice over a number ring;
  freeness is not part of that assertion. Without a rigidity assumption,
  de Jong and Esnault prove that the existence of an irreducible complex local system with torsion determinant and
  quasi-unipotent boundary monodromy implies the existence of an absolutely irreducible integral $ell$-adic local
  system for every prime $ell$, preserving the determinant and the semisimplified boundary
  classes #cite(label("DeJongEsnault2024")) Theorem 1.1. This prime-by-prime existence is distinct from density
  over the full ring of integers of one number field.

Litt asks for potential integral density on character varieties of smooth projective varieties and also formulates
  a boundary variant #cite(label("LittProblems")); his survey explicitly asks whether one number field
  suffices #cite(label("Litt2024")) Question 5.4.3(2). Coccia and Litt formulate a related conjecture for
  Chevalley groups with fixed boundary data in the adjoint quotient #cite(label("CocciaLitt")) Conjecture 1.1.1.
  Theorem 1 answers the determinant-one form of Litt’s question affirmatively for curves, in every rank,
  and proves the $"SL"_r$ curve case of the Coccia–Litt conjecture for quasi-unipotent boundary data.
  The higher-dimensional, higher-rank question remains outside its scope.

Coccia and Litt prove full-ring potential integral density for $"SL"_2$ and $upright("PGL")_2$ on smooth varieties
  admitting a smooth projective compactification with simple normal crossings boundary #cite(label("CocciaLitt"))
  Theorem 1.1.2. Their surface theorem allows arbitrary algebraic-integer boundary traces and gives an extension
  of degree at most four over the field generated by those traces #cite(label("CocciaLitt")) Theorem 5.0.4 and
  Remark 5.0.5. Their ordinary and twisted surface theorems also imply the ambient-integral exact-class statement
  in rank two, as explained in Remark 16. Their use of integral representations and mapping-class-group dynamics
  is an arithmetic predecessor of the closed-surface argument below.
  Theorem 1 treats every rank with exact quasi-unipotent boundary data; in rank two,
  Coccia and Litt allow a broader range of boundary traces.

Earlier arithmetic work includes Whang’s descent framework for rank-two integral characters with fixed integer
  boundary traces #cite(label("WhangDescent")). For the Markoff cubic family $x^2 + y^2 + z^2 - x y z = k$,
  Ghosh and Sarnak prove integral density for almost all locally admissible integer parameters,
  and also exhibit infinitely many admissible parameters with no integral points #cite(label("GhoshSarnak"))
  Theorem 1.2. These results concern ordinary integral points and help distinguish that question from density
  after one finite extension of the ground field.

On the geometric side, Mellit uses flags and braid operations to stratify a vector bundle over a character variety
  into torus and affine-space pieces, for generic semisimple data with a regular semisimple
  puncture #cite(label("Mellit")) Theorem 1.2. Su constructs an open dense torus for nonempty character varieties
  with generic semisimple boundary data and a regular semisimple puncture #cite(label("Su")) Theorem 0.5.
  These results concern complex geometric decompositions. The present argument must also preserve integral
  splittings and identified graded modules while treating arbitrary Jordan types and nongeneric components.
  It therefore carries out the local operations over the full ring of integers,
  rather than obtaining integral points merely from a complex coordinate parametrization.

=== 1.2 The proof <the-proof>

We first work with $"GL"_n$ rather than $"SL"_n$. This makes direct sums,
  subspaces and quotients available without determinant restrictions.
  A boundary matrix with a prescribed Jordan type admits an invariant flag on whose successive quotients it acts
  by scalar roots of unity. We attach disks carrying these scalar local systems to the boundary.
  The resulting object consists of oriented surfaces of various ranks,
  joined along boundary pieces by flags and their graded identifications.
  Section 4 defines exactly which joins are allowed.

The main construction proves integral density for all such diagrams by induction on the largest rank.
  A surface of maximal rank with boundary is cut into disks.
  Two flags at the ends of a cut are compared by refining them to their common graded pieces and interchanging
  adjacent pieces. On each disk, a proper subspace chosen from one boundary flag is preserved by all puncture
  monodromies, since these are scalar. Passing to that subspace and its quotient lowers the rank.
  The lost extension data are recovered by successive choices of linear maps.
  Choosing the subspace as a prefix of the starting flag makes the lifted flag unique on that interval,
  so returning around the boundary introduces no further equation.
  The reduction includes the complementary swaps needed for nonregular boundary data (Section 5).

Closed surfaces enter at the same induction step. Cutting along one nonseparating circle and fixing a convenient
  spectrum brings them into the preceding case. Powers of a Dehn twist then enlarge the closure of the integral
  points. At one explicit smooth representation, the resulting torus motions vary the spectrum in every direction.
  Irreducibility of the twisted surface equation finishes the argument.
  We give a finite-field proof of irreducibility, following the character-counting method of Liebeck and
  Shalev #cite(label("LiebeckShalev2005")). Sections 6 and 7 carry out this closed-surface step;
  the latter then assembles the rank induction.

Finally, all handle determinants of our integral representations are units in $cal(O)_F$.
  Adjoining their $r$th roots uniformly by (1) permits determinant-one twisting.
  Exact Jordan conditions are then selected on the character quotient. This order is essential:
  taking the semisimplification of a representation can reduce its boundary Jordan blocks.
  Section 8 completes this descent.

The reusable ingredient is the diagram density theorem. It transfers integral density through rank reduction using
  free graded modules and linear extension parameters.

Three standard inputs enter at distinct points. Finite generation of integral invariants gives the affine model in
  Section 2. Dirichlet’s unit theorem gives the single field in Section 3.
  The Lang–Weil estimate converts the finite-group count proved in Section 6 into geometric irreducibility.
  The flag reconstruction, character estimates, twist directions and exact-Jordan descent are proved below.

== 2 The integral model and exact boundary conditions <sec:model>

We specify the integral model once and record how to select exact boundary classes on its complex quotient.
  In particular, we distinguish semisimplification of a representation from diagonalization of its individual matrices.

=== 2.1 Representation schemes <representation-schemes>

For a finitely presented group $Gamma$ and an integer $r gt.eq 1$,
  let $cal(R)_r \( Gamma \)$ be the affine $bb(Z)$-scheme representing

$ S mapsto "Hom" \( Gamma \, "SL"_r \( S \) \) . $

Concretely, choose a matrix for each generator and impose the matrix relations of a finite presentation.
  Simultaneous conjugation defines an action of $"SL"_(r \, bb(Z))$. With $A = bb(Z) \[ cal(R)_r \( Gamma \) \]$, put

#[#set math.equation(numbering: n => "(2)")
 $ M_r \( Gamma \) = "Spec" #scale(x: 120%, y: 120%)[\(] A^("SL"_(r \, bb(Z))) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:integral-model>]

This definition is independent of the chosen presentation, by the representing property.
  The invariant ring is finitely generated over $bb(Z)$ by finite generation for Chevalley-group invariants
  #cite(label("FranjouVanderKallen")) Theorem 3. Here the base $bb(Z)$ is Noetherian,
  $A$ is a finite-type commutative algebra, and $"SL"_(r \, bb(Z))$ is a split Chevalley group with its rational
  conjugation action. This input does not require $A$ to be reduced or flat over $bb(Z)$.

Flat base change commutes with these invariants: they are the kernel of the difference between the coaction and
  the map $a mapsto a ⊗ 1$, and tensoring with a flat algebra preserves that kernel.
  In particular, the complex fiber of (2) is the usual affine character quotient.
  Its complex points correspond to the unique closed orbits in the fibers of the
  quotient #cite(label("MumfordSuominen")) pp. 184–185. The representation scheme is closed in the space of
  generator tuples: inverses in $"SL"_r$ are polynomial adjugates, so the relators are polynomial equations.
  Kraft’s matrix-tuple closed-orbit criterion, recalled in #cite(label("BateMartinRoehrleTange")) Section 3.4,
  therefore identifies these orbits with semisimple representations.
  Conjugation by $"GL"_r \( bb(C) \)$ gives the same orbits as conjugation by $"SL"_r \( bb(C) \)$,
  since any invertible matrix can be multiplied by a scalar to have determinant one.

For the curve $X$, we use $Gamma = pi_1 \( X \)$ and write $M_r \( X \) = M_r \( Gamma \)$.
  Every representation $Gamma arrow.r "SL"_r \( cal(O)_L \)$ gives a point of $M_r \( X \) \( cal(O)_L \)$ by
  evaluating invariant functions. Thus it suffices to construct actual integral matrices.
  No assertion about generation of invariants in positive characteristic is needed for this implication.

=== 2.2 Rank conditions on the quotient <rank-conditions-on-the-quotient>

Write $cal(R) = cal(R)_r \( Gamma \)_(bb(C))$ and let $q : cal(R) arrow.r
  M_r \( Gamma \)_(bb(C))$ be the quotient map. We use reduced closed subsets when imposing additional conditions.
  An invariant closed subset $D subset cal(R)$ has closed image under $q$. Moreover,

#[#set math.equation(numbering: n => "(3)")
 $ q \( x \) in q \( D \) quad arrow.l.r.double quad upright("the closed orbit in ") q^(- 1) \( q \( x \) \)
   upright(" lies in ") D . $ <eq:closed-orbit-test>]

Indeed the closure of every orbit in the fiber contains that closed orbit,
  and a closed invariant subset contains the closure of each of its orbits.
  These are the standard closed-orbit properties of an affine quotient by a reductive group in characteristic
  zero #cite(label("MumfordSuominen")) pp. 184–185.

Fix the characteristic polynomial of each boundary matrix and let $lambda$ range over its eigenvalues.
  A Jordan form is determined by these eigenvalues and the numbers

$ d_(i \, lambda \, k) = "rk" #scale(x: 120%, y: 120%)[\(] \( C_i - lambda I \)^k #scale(x: 120%, y: 120%)[\)] \,
  wide 1 lt.eq k lt.eq r . $

Here the expression on the right means the rank for any matrix in the chosen class $C_i$.
  Let $D$ be the invariant closed subset defined by the fixed characteristic polynomials and the inequalities

$ "rk" #scale(x: 120%, y: 120%)[\(] \( rho \( gamma_i \) - lambda I \)^k #scale(x: 120%, y: 120%)[\)] lt.eq
  d_(i \, lambda \, k) . $

Let $D_(upright("sm")) subset D$ be the finite union of the closed subsets on which at least one of these
  inequalities is strict; indices with $d_(i \, lambda \, k) = 0$ contribute an empty subset.
  The matrices have exactly the prescribed classes precisely on $D \\ D_(upright("sm"))$.

#thm([Lemma 2.1.])[
  #emph[The locus of characters whose semisimple representations have exactly the prescribed boundary classes is
$ Y = q \( D \) \\ q \( D_(upright("sm")) \) . $

 In particular, $Y$ is open in the closed subset $q \( D \)$ and is defined over any number field containing the
   boundary eigenvalues.]
] <lem:exact-stratum>

#proof[
  Apply (3) first to $D$, then to $D_(upright("sm"))$. A closed orbit belongs to the first set and not the second
    exactly when its boundary matrices have all the prescribed ranks. These ranks determine their Jordan forms.
    The defining equations and rank inequalities have coefficients in the indicated field $K$.
    Write $A_K = A ⊗_(bb(Z)) K$. If $I_K subset A_K$ is the ideal of either closed rank locus,
    its closed quotient image is defined by the contracted ideal $I_K ∩ A_K^("SL"_r)$.
    This is the kernel of $A_K^("SL"_r) arrow.r A_K \/ I_K$; flat extension from $K$ to $bb(C)$ preserves that
    kernel and the invariant algebra. The two closed images, and hence their difference,
    are therefore defined over $K$. ◻
]

The lemma permits us to construct integral representations in closed rank bounds and impose the exact conditions
  after passing to characters. Density will then meet every open part of the desired locus,
  including those in individual irreducible components.

== 3 Arithmetic parameters and integral splittings <sec:arithmetic>

Our constructions will use matrices, split flags, and gluing maps over one ring of integers.
  We first record the parameter sets that are dense over that ring and the finite extension needed to remove
  determinants.

Fix the rank bound $r gt.eq 1$ and a number field $K subset bb(C)$ containing the prescribed boundary eigenvalues.
  Choose distinct primes $p \, q > r$, fix a primitive $p q$-th root of unity $zeta$, and put

$ F = K \( sqrt(2) \, zeta \) \, wide R = cal(O)_F . $

For a projective curve we take $K = bb(Q)$. Throughout the proof, “integral” means over the full ring $R$,
  or over the full ring of integers of a specified finite extension.
  In particular, an invertible integral matrix belongs to $"GL"_d \( R \)$: its determinant is a unit.

#thm([Lemma 3.1.])[
  #emph[For every $a \, b gt.eq 0$, the set $R^a times \( R^times \)^b$ is Zariski dense in $bb(C)^a
    times \( bb(C)^times \)^b$. For every $d gt.eq 1$, the group $"GL"_d \( R \)$ is Zariski dense in
    $"GL"_d \( bb(C) \)$.]
] <lem:integral-parameters>

#proof[
  The sets $R$ and $R^times$ are infinite. For the unit group, use the powers of the unit $1 + sqrt(2)$,
    whose inverse is $sqrt(2) - 1$. A polynomial vanishing on a product of infinite subsets of $bb(C)$ is zero,
    by induction on the number of variables. Multiplying a Laurent polynomial by a monomial gives the same
    conclusion for the stated product with multiplicative factors.
  For $d gt.eq 2$, the Zariski closure of $"GL"_d \( R \)$ contains every elementary one-parameter unipotent
    subgroup, since its parameters in $R$ are dense. These subgroups generate $"SL"_d \( bb(C) \)$.
    The closure also contains the full diagonal torus, by the first assertion.
    Together these generate $"GL"_d \( bb(C) \)$. The case $d = 1$ is unit density. ◻
]

We will always supply free graded modules as part of integral flag data.
  This requirement permits the following elementary splitting argument over $R$,
  without any assumption on its ideal class group.

#thm([Lemma 3.2.])[
  #emph[Let $0 arrow.r A arrow.r B arrow.r C arrow.r 0$ be an exact sequence of $R$-modules,
    with $A$ and $C$ finite free. Then the sequence splits over $R$.
    Its sections form a nonempty affine space under $"Hom"_R \( C \, A \)$,
    and their integral points are Zariski dense in the complex space of sections.
    Consequently, a finite filtration with specified free graded modules admits a splitting over $R$ that respects
    those graded identifications.]
] <lem:free-splittings>

#proof[
  Lift an $R$-basis of $C$ to $B$ and extend linearly to obtain a section.
    The difference of any two sections is an arbitrary map from $C$ to $A$.
    After choosing bases this is a free matrix module, so density follows from Lemma 3.
    Apply the splitting argument successively to the quotients of a filtration. ◻
]

In particular, every matrix changing between two such integral splittings is an $R$-isomorphism;
  its inverse is integral. This argument concerns flags whose graded modules are explicitly free.
  We will establish that property for each flag used below.

#thm([Lemma 3.3.])[
  #emph[For every $1 lt.eq n lt.eq r$, the units
$ alpha_i = zeta^(i - 1) \, wide 1 lt.eq i lt.eq n \, $

 are distinct, and $alpha_i - alpha_j in R^times$ whenever $i eq.not j$.]
] <lem:unit-spectrum>

#proof[
  The nonzero integer $i - j$ has absolute value less than both $p$ and $q$, so it is prime to $p q$.
    Thus $zeta^(i - j)$ is primitive of order $p q$. The algebraic integer $1 -
    zeta^(i - j)$ has norm $Phi_(p q) \( 1 \) = 1$ in $bb(Q) \( zeta \)$, and hence is a unit.
    Here the value follows directly by taking $T arrow.r 1$ in
  $ Phi_(p q) \( T \) = frac(\( T^(p q) - 1 \) \( T - 1 \), \( T^p - 1 \) \( T^q - 1 \)) . $
  Multiplication by the unit $zeta^(j - 1)$ proves the claim. ◻
]

The unit differences in Lemma 5 allow spectral projectors to be formed over $R$.
  The freeness of their images, when needed, will follow from the free graded lines of the accompanying flag.

#thm([Lemma 3.4.])[
  #emph[The field
$ L = F #scale(x: 120%, y: 120%)[\(] zeta_r \, { u^(1 \/ r) : u in R^times } #scale(x: 120%, y: 120%)[\)] $

 is a finite extension of $F$. It contains every $r$-th root of every unit of $R$,
   and every such root belongs to $cal(O)_L^times$.]
] <lem:uniform-field>

#proof[
  By Dirichlet’s unit theorem #cite(label("MilneANT")) Theorem 5.1, choose finitely many generators $u_0 \,
    dots.h \, u_s$ of $R^times$, including a generator of its finite torsion subgroup.
    Choose $v_i$ with $v_i^r = u_i$. The finite extension
  $ F \( zeta_r \, v_0 \, dots.h \, v_s \) $
  contains all $r$-th roots of all units: if $u = product_i u_i^(m_i)$ with $m_i in bb(Z)$,
    its roots are $zeta_r^j product_i v_i^(m_i)$. Both $v_i$ and $v_i^(- 1)$ are integral,
    by the monic equations $T^r - u_i$ and $T^r - u_i^(- 1)$, respectively.
    Hence all these roots are units in $cal(O)_L$. ◻
]

The field $L$ depends only on the fixed initial data. Later we will take roots of determinants of matrices over
  $R$; Lemma 6 handles all those roots simultaneously, regardless of the representation or irreducible component.

== 4 Filtered local systems on surfaces <sec:diagrams>

The proof uses auxiliary surfaces whose boundary local systems are related by filtrations.
  Cutting these surfaces and refining their filtrations will reduce the rank.
  We first define the auxiliary objects and the linear algebra needed to reconstruct them after a cut.

Use the field $F$ and its full ring of integers $R$ from Section 3.
  All prescribed scalars below are roots of unity in $F$. A local system over $R$ is required to have finite free
  fibers. Its parallel transports are thus isomorphisms over the full ring $R$.

=== 4.1 Surfaces, seams, and their solutions <surfaces-seams-and-their-solutions>

A #emph[surface diagram] has finitely many compact oriented surfaces, called its facets.
  Each facet has an assigned rank between $0$ and $r$ and finitely many interior punctures.
  A scalar monodromy is prescribed at each puncture, using the positive orientation around that puncture.

Every boundary circle is either left unmarked or divided into intervals by finitely many marked points.
  These boundary pieces are grouped into #emph[seams]. A seam has a distinguished parent side and an ordered list
  of child sides, written

$ E : \( W_1 \, dots.h \, W_m \) \, wide "rk" E = sum_(j = 1)^m "rk" W_j . $

All its sides are parametrized by the same interval or circle.
  The boundary orientation of each child is opposite to that of the parent.
  Different side occurrences may belong to the same facet. An unmarked circle seam uses entire circles and has no
  permutation of its sides.

At an interval endpoint, the boundary of each facet pairs its two incident side germs.
  We permit precisely the following vertices.

+ A parent list continues with the same ordered children, or with two adjacent children interchanged.
  Each child continues to itself.
+ A child $W$ of one parent list is replaced by an ordered list $W'_1 \, dots.h \, W'_s$,
  and there is a third seam $W : \( W'_1 \, dots.h \, W'_s \)$.
  The parent germs continue to each other; the two occurrences of $W$ are paired;
  the two occurrences of each $W'_j$ are paired; and unchanged children continue to themselves.
  The reverse operation is also permitted.

The specification concerns distinct occurrences of germs, even when some belong to one facet.
  No embedding of the diagram in a surrounding space is required.

A #emph[solution] assigns to each punctured facet a local system of its rank,
  with the prescribed scalar monodromies. At a seam it assigns a parallel filtration of the parent and parallel
  identified quotients

$ 0 = E_0 subset E_1 subset dots.h.c subset E_m = E \, wide E_j \/ E_(j - 1) tilde.eq W_j . $

The conditions at vertices are as follows. At a continuation, all data continue.
  At a split or merge, the finer parent filtration is obtained by refining the $W$-quotient with its given
  filtration, and the identified quotients agree. At an interchange of $A \, B$,
  the coarsened filtration with quotient $A xor B$ is unchanged.
  Within that quotient the two intermediate subspaces are complementary,
  and the maps to the identified quotients are the natural projections.
  Thus the interchange includes a specified direct-sum decomposition, not just a pair of transverse flags.

Choose one frame on each connected facet. Holonomies along a finite set of paths, the seam flags,
  and their identified quotients describe the solutions by finitely many algebraic equations and open conditions.
  They form a complex variety, denoted $cal(S) \( D \)$ for a diagram $D$.
  Changing the auxiliary paths gives the same data through composition and inversion of transport matrices.

An #emph[integral solution] uses free $R$-local systems and filtrations whose identified graded modules are the
  specified free child fibers. Complementarity at an interchange means a direct sum over $R$.
  In particular, each filtration splits on a fiber: successive free quotients are projective.
  This definition does not assert that every submodule of a free $R$-module is free.

#thm([Theorem 4.1.])[
  (Diagram density).  #emph[For every surface diagram $D$ with ranks at most $r$ and prescribed scalar puncture
    monodromies in $F$, its integral solutions over $R$ are Zariski dense in $cal(S) \( D \)$.]
] <thm:diagram-density>

We prove Theorem 7 by induction on the largest rank, normalizing identity seams before separating closed facets.
  The nonclosed step is proved in Section 5. The rank-one and genus-zero closed cases are elementary,
  and the genus-one case is Lemma 13. At each remaining rank, Lemma 15 gives the closed-surface step;
  it uses the normalized nonclosed step at that same rank and the completed induction at smaller ranks.

=== 4.2 Transferring density through choices <transferring-density-through-choices>

#thm([Lemma 4.2.])[
  #emph[Let $Y$ be a complex variety. For each member $tau$ of a finite index set, suppose there are morphisms
$ B_tau arrow.l^(med p_tau med) T_tau arrow.r^(med f_tau med) Y \, $

 where $p_tau$ is open and surjective and the images of the $f_tau$ cover $Y$.
   Suppose that a set $I_tau subset B_tau$ is dense and that, over every point of $I_tau$,
   a dense set of points in the fiber of $p_tau$ maps into a subset $J subset Y$. Then $J$ is dense in $Y$.]
] <lem:density-transfer>

#proof[
  A nonempty open subset $O subset Y$ has nonempty inverse image under some $f_tau$.
    Its image under $p_tau$ is nonempty and open, hence contains a point of $I_tau$.
    The dense specified subset of that fiber meets $f_tau^(- 1) \( O \)$. ◻
]

We apply this lemma with $B_tau$ the solutions of a simpler diagram and $T_tau$ the choices for reconstruction.
  The index $tau$ records ranks of finitely many intersections and projection images.
  Its finiteness follows from the fixed rank bound. The forward reduction need not be a morphism on the entire
  original solution variety; it is enough that every original solution has a reconstruction in one of the finitely
  many spaces $T_tau$.

The choice spaces used below are locally affine bundles, or products of these with general linear groups.
  Their projections are therefore open. Over an integral solution,
  the stated free splittings identify their parameters with matrices over $R$ and with invertible matrices over
  $R$. Both sets are Zariski dense in the corresponding complex spaces by Lemma 3.
  We may include arbitrary frame changes among the choices;
  coverage up to isomorphism then suffices for framed coverage.

=== 4.3 Comparing two flags <comparing-two-flags>

The following lemma includes the compatibility of the identified quotients.
  That compatibility is needed when a cut surface is sewn back together.
  Flag decompositions and braid operations also underlie the geometric stratifications of
  Mellit #cite(label("Mellit")) Theorem 1.2 and Su #cite(label("Su")) Theorem 0.5.
  Here we formulate reconstruction over one ring of integers with specified free graded modules,
  so that every change of splitting has integral matrix parameters.

#thm([Lemma 4.3.])[
  (Two-flag reconstruction).  #emph[Let $F_bullet \, H_bullet$ be two flags in a complex vector space $V$.
    There are nonnegative integers $m_(i j)$ and a sequence of the allowed split, interchange,
    and merge operations with these properties:]
  + #emph[It refines $F_bullet$ into blocks of ranks $m_(i j)$ in row-first order,
    sorts them into column-first order by adjacent interchanges, and merges them to $H_bullet$.]
  + #emph[Each inverted pair of blocks is interchanged once.
    The flags and all identified quotients in any such sequence admit a common splitting into the labeled blocks.]
  + #emph[Given two such pairs of flags, prescribed isomorphisms on their $F$-graded modules and their $H$-graded
    modules extend to a full isomorphism if they preserve the induced refinements and agree on the double-graded
    modules. The extensions form an affine space.]
  #emph[The last two assertions hold over $R$ when the labeled graded modules are free.
    The affine spaces then have free integral parameters. In families with fixed ranks,
    the spaces of extensions are locally affine bundles.]
] <lem:two-flags>

#proof[
  Set
  $ m_(i j) =  & dim \( F_i ∩ H_j \) - dim \( F_(i - 1) ∩ H_j \)\
 & - dim \( F_i ∩ H_(j - 1) \) + dim \( F_(i - 1) ∩ H_(j - 1) \) . $
  Split each intersection modulo the sum of the preceding row and column intersections. This gives
  $ V = xor.big_(i \, j) V_(i j) \, wide F_i = xor.big_(k lt.eq i \, j) V_(k j) \, wide H_j =
    xor.big_(i \, ell lt.eq j) V_(i ell) . $
  Use these summands for the refinements. Sort row-first into column-first order,
    interchanging each inverted pair exactly once. Every interchange is a direct-sum interchange.
  Conversely, start by splitting the first fully refined flag of a sequence as in the statement.
    At an interchange of adjacent labels $a \, b$, the new $b$-subspace in the two-block quotient is the graph of
    a map from the former $b$-summand to the $a$-summand. Modify the $b$-summand by that graph.
    The label $a$ preceded $b$ in every earlier order, since this pair has not previously crossed.
    Adding an $a$-component to the $b$-summand therefore preserves every earlier prefix and its identified
    quotients. The modified splitting realizes the new flag and the natural quotient identifications at the
    interchange. Induction produces one splitting of all the flags.
    The argument uses only splittings of free quotients and linear maps, so also works over $R$.
  For the extension assertion use common splittings on source and target.
    A matrix preserving both flags has a block from $\( i \, j \)$ to $\( i' \, j' \)$ only if $i' lt.eq
    i$ and $j' lt.eq j$. Its blocks in equal rows are prescribed by the $F$-graded maps;
    those in equal columns are prescribed by the $H$-graded maps.
    The prescriptions coincide on their overlap precisely when they agree on the double-graded modules.
    All blocks strictly lowering both indices are arbitrary. The diagonal blocks are isomorphisms,
    so the resulting matrix is invertible. It also respects every intermediate flag in the gallery.
    Indeed each sorting order extends the coordinatewise partial order on the labels $\( i \, j \)$:
    only incomparable labels are interchanged. A block lowering the indices therefore maps into an earlier prefix,
    and the diagonal blocks give the prescribed maps on the labeled quotients.
    This gives the claimed affine space and its integral parameters.
    For families, split the constant-rank subbundles locally and apply the same block description. ◻
]

=== 4.4 Lifting a filtered exact sequence <lifting-a-filtered-exact-sequence>

Replacing a local system by a subspace $U$ and quotient $Q$ loses both the position of a boundary flag in $U xor
  Q$ and the identifications of its quotients with the child systems. The next lemma recovers both.
  Its second part concerns a further loss of information at a vertex:
  a coarse quotient is identified with a space $W$ carrying an internal flag or decomposition,
  whereas an adjoining interval retains only the resulting finer flag and its fine quotient identifications.

#thm([Lemma 4.4.])[
  #emph[Let $U \, Q$ be vector spaces, with flags $U_i \, Q_i$, and let
$ 0 arrow.r U_i \/ U_(i - 1) arrow.r W_i arrow.r Q_i \/ Q_(i - 1) arrow.r 0 quad \( 1 lt.eq i lt.eq m \) $

 be exact sequences. In $V = U xor Q$, consider flags $V_i$ inducing the given flags on $U \, Q$,
   together with compatible identifications $V_i \/ V_(i - 1) tilde.eq W_i$.
   Their space is a nonempty homogeneous space for the additive group $H = "Hom" \( Q \, U \)$, whose stabilizer is
$ K = { h in H : h \( Q_i \) subset U_(i - 1) upright(" for every ") i } . $

 If a $W_i$ is further equipped with a flag or a direct-sum decomposition,
   transport that structure to the lifted quotient, then retain its induced refined flags and graded
   identifications while forgetting the coarse identification with $W_i$.
   Let $K_(upright("coarse"))$ be the stabilizer in $H$ of the coarse flag with its full identified quotients,
   and let $K_(upright("interval"))$ be the stabilizer of the induced refined flag with its identified fine
   quotients. They are given by the displayed stabilizer formula for the respective flags.
   For compatible coarse and refined data, restriction gives a surjection $H \/ K_(upright("coarse")) arrow.r
   H \/ K_(upright("interval"))$, with affine fiber $K_(upright("interval")) \/ K_(upright("coarse"))$.]
  #emph[These assertions hold over $R$ when all named graded modules are free.
    After free splittings, all choices and all fibers have free integral parameters.
    In fixed-rank algebraic families the maps are locally affine bundles.]
] <lem:filtered-lift>

#proof[
  Split the flags on $U \, Q$ and the exact sequences for $W_i$. Their direct sum supplies a lift.
    For any other lift, successively lift basis vectors of $W_i$ to $V_i$,
    using the chosen lifts in $U$ on $U_i \/ U_(i - 1)$. Adjust the remaining lifts by $V_(i - 1)$ to give them
    the chosen projections to $Q$. This splits $V$ as the sum of its $W_i$ in a way compatible with the fixed
    splittings on $U \, Q$. Two resulting isomorphisms differ by
  $ \( u \, q \) mapsto \( u + h \( q \) \, q \) \, wide h in H \, $
  which proves transitivity. Such an automorphism fixes a lifted flag and its identified quotients exactly when
    $h \( Q_i \) subset U_(i - 1)$.
  An internal flag or decomposition of a $W_i$ is restored through its identified quotient.
    An automorphism fixing that full identification fixes all the induced fine data.
    Forgetting the full identification therefore enlarges the stabilizer:
    $K_(upright("coarse")) subset K_(upright("interval"))$. Restriction is the surjection between the
    corresponding homogeneous spaces. Its fibers are $K_(upright("interval")) \/ K_(upright("coarse"))$.
    In splittings compatible with the given refinements these stabilizers are sums of matrix blocks,
    and the indicated inclusion is split. This proves the assertions about integral parameters and,
    after local splittings of vector bundles, the assertion for families. ◻
]

For example, let $U \, Q$ be lines and take $W = U xor Q$ with its standard exact sequence.
  An identification of $V$ with $W$ inducing the identity on $U \,
  Q$ can vary by any element of $"Hom" \( Q \, U \)$. If we retain only the flag $0 subset U subset
  V$ and its two identified quotients, all those choices give the same data.
  The coarse stabilizer is zero and the refined-interval stabilizer is all of $"Hom" \( Q \, U \)$.
  The reversal comes from forgetting the full coarse identification, not from imposing fewer subspaces.

At a vertex there will be two adjoining intervals. We use the surjection to either one separately:
  an incoming lift extends to a vertex lift, which then determines an outgoing lift.
  We do not prescribe two interval lifts independently or assert that every such pair comes from a vertex lift.

== 5 Reducing the rank of a surface diagram <sec:reduction>

We prove the nonclosed step in the diagram-density induction.
  Call a diagram #emph[normalized] if all its facets have positive rank and every seam has at least two children;
  call these seams #emph[proper]. The first subsection explains how to reach this form.
  This operation may create closed facets, so it must precede their separation from the facets with boundary.

#thm([Proposition 5.1.])[
  #emph[Let $2 lt.eq n lt.eq r$, and suppose integral solutions are dense for every surface diagram of ranks less
    than $n$. Then they are dense for every normalized diagram of ranks at most $n$ whose rank-$n$ facets have
    nonempty boundary. Closed facets of smaller rank are allowed.]
] <prop:nonclosed-reduction>

We prove the proposition by constructing finitely many lower-rank diagrams from which every original solution can
  be recovered. Over each lower solution variety, reconstruction consists of successive locally affine bundles and
  changes of frames. Every integral lower solution admits lifts, with dense integral choices in each fiber.
  Lemma 8 will then give the conclusion.

There are two geometric stages. First, removing bands cuts the rank-$n$ facets to disks;
  the two-flag lemma recovers each band through affine matching choices.
  Next, a proper subspace and its quotient replace each disk.
  The vertex constructions ensure that arbitrary lower data admit the successive lifts needed to reconstruct the
  disk, including closure around its boundary.

=== 5.1 Removing identity seams <subsec:identity-normalization>

Delete every zero-rank facet and every zero child. Interchanges with a zero child become continuations.
  A seam with one positive child is an #emph[identity seam];
  its specified isomorphism sews its two sides together. Opposite boundary orientations give an oriented surface.
  At a split vertex with only one positive subblock, this sewing turns the split into continuation.
  If the original parent list has just one positive block, sewing identifies its refined list with the additional
  seam. If all three lists have one positive block, three corner sectors sew to a disk,
  and the refinement compatibility is precisely the composition condition for the local system to extend over its
  center. Identity circle seams are sewn in the same way.

These operations use occurrences of boundary germs and therefore also apply to seams incident several times to the
  same facet. Solutions of the sewn diagram restrict to solutions of the old one;
  allowing frame changes gives all old solutions. The construction is valid over $R$.
  We can consequently work with normalized diagrams. A facet of maximal rank $n$ can then only be a parent,
  and every child on its boundary has rank less than $n$.

The closed rank-$n$ facets of a normalized diagram are independent factors of its solution variety.
  Set them aside when applying Proposition 11; Sections 6 and 7 will supply their density.
  We now prove the proposition for the remaining diagram, using only the smaller-rank induction hypothesis.
  If it has no rank-$n$ facets, that hypothesis already applies.

=== 5.2 Cutting the maximal-rank facets to disks <cutting-the-maximal-rank-facets-to-disks>

In each nonclosed rank-$n$ facet choose disjoint properly embedded arcs which cut the underlying surface to disks.
  Their endpoints are distinct interior points of seam intervals; an unmarked circle seam may first be marked.
  The arcs avoid all punctures, which do not affect this topological choice. Remove narrow bands around the arcs.

Consider one band. At its two short ends, the old seams give flags of types $F_bullet$ and $H_bullet$.
  On each long side put the two-flag sequence of Lemma 9, with the same array of block ranks on the two sides.
  Across the band put a lower-rank strip for each block of the running list.
  Its two long sides are children of the two parent sides. At a short end it extends the corresponding old child
  facet. To split a block on both long sides, put a transverse seam across its strip;
  its endpoints give the two split vertices. Merges reverse this construction.
  At an interchange put an interchange vertex on both parents and continue each labeled strip unchanged.
  Strips may cross one another in this description: the diagram is specified by its side incidences,
  not by a planar embedding. Figure 1 shows one strip occurrence and the two-by-two example of the common gallery;
  its blocks $W_(i j)$ have ranks $m_(i j)$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.604, 2.604), [#text(size: 9pt)[\(a\) A band between two cut sides]])
  rect((0, 0), (5.208, 1.581), fill: rgb("#f5f5f5"), stroke: none)
  line((0, 0), (0, 1.581), (5.208, 0), (5.208, 1.581), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((1.86, 0), (3.348, 1.581), fill: rgb("#d9d9ff"), stroke: none)
  line((1.86, 0), (1.86, 1.581), (3.348, 0), (3.348, 1.581), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.581), (5.208, 1.581), (0, 0), (5.208, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.6975, 1.581), (1.534, 1.581), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.6975, 0), (1.534, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black)))
  line((2.093, 1.209), (3.116, 1.209), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#000099"))))
  line((2.093, 0.372), (3.116, 0.372), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#000099"))))
  content((2.604, 1.581), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$dots.h ,W_(i j), dots.h$]]])])
  content((2.604, 0), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$dots.h ,W_(i j), dots.h$]]])])
  content((2.604, 2.018), [#text(size: 9pt)[first parent gallery]])
  content((2.604, -0.4371), [#text(size: 9pt)[second parent gallery]])
  content((0.4185, 0.7905), [#text(size: 9pt)[$F_ bullet$]])
  content((4.79, 0.7905), [#text(size: 9pt)[$H_ bullet$]])
  content((2.604, 0.7905), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[lower strip]]])])
  line((0.372, -1.004), (4.836, -1.004), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.604, -1.004), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[common gallery parameter]]])])
  content((9.558, 2.604), [#text(size: 9pt)[\(b\) The same gallery on both sides]])
  content((7.046, 1.135), [#text(size: 9pt)[$F_1$]])
  content((6.814, 0.0186), [#text(size: 9pt)[$F_2"/"F_1$]])
  content((8.162, 1.414), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_11$]]])])
  content((8.162, 0.8556), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_12$]]])])
  content((8.162, 0.2976), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_21$]]])])
  content((8.162, -0.2604), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_22$]]])])
  content((10.77, 1.414), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_11$]]])])
  content((10.77, 0.8556), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_21$]]])])
  content((10.77, 0.2976), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_12$]]])])
  content((10.77, -0.2604), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$W_22$]]])])
  content((12, 1.135), [#text(size: 9pt)[$H_1$]])
  content((12.24, 0.0186), [#text(size: 9pt)[$H_2"/"H_1$]])
  line((7.353, 1.135), (7.854, 1.414), (7.353, 1.135), (7.854, 0.8556), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.446, 0.0186), (7.854, 0.2976), (7.446, 0.0186), (7.854, -0.2604), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.471, 1.414), (10.46, 1.414), (8.471, -0.2604), (10.46, -0.2604), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.471, 0.8556), (10.46, 0.2976), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.471, 0.2976), (10.46, 0.8556), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((11.08, 1.414), (11.65, 1.135), (11.08, 0.8556), (11.65, 1.135), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((11.08, 0.2976), (11.59, 0.0186), (11.08, -0.2604), (11.59, 0.0186), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.162, 2), [#text(size: 9pt)[row-first]])
  content((10.77, 2), [#text(size: 9pt)[column-first]])
  content((9.465, -0.9486), [#text(size: 9pt)[split $W_12 arrow.l.r W_21$ merge]])
})],
  caption: [Figure 1: Replacing a cut band by lower-rank strips. Both parent sides carry the same gallery from $F_bullet$ to $H_bullet$, with the same array $\( m_(i j) \)$. Panel (a) displays one strip occurrence; the arrows on its boundary oppose the parent boundary arrows. The galleries use a common parameter, independently of those boundary orientations. Panel (b) shows the two-by-two sorting pattern, with $F_2 = H_2 = V$. Splits and merges are performed on both parent sides, using transverse seams on the relevant strips. The crossing represents an interchange and adds no incidence between strips. This is an incidence schematic, not a planar embedding of the whole diagram. ],
) <fig:band-gallery>

All strips inherit the band orientation. Their long-side boundary orientations are opposite to those of the
  corresponding parents, and the short-end attachments sew opposite orientations.
  Thus the result is again an oriented surface diagram. Its only rank-$n$ facets are disks,
  possibly with punctures. Every new strip has rank less than $n$, since it refines a child of a proper seam.
  Zero blocks can be deleted.

We verify reconstruction before applying density. A solution of the cut diagram gives two pairs of flags,
  one on each side of the band. The old child transports prescribe isomorphisms on their $F$-graded and $H$-graded
  modules. Transverse split and merge seams make those isomorphisms preserve the refinements.
  Transports on the fully refined strips and the natural maps at interchanges make them agree on the double-graded
  modules. Lemma 9 therefore supplies a full isomorphism respecting the entire gallery,
  not just its endpoint flags. Use it to sew back the rank-$n$ band.
  The old seam flags extend across its short ends. Different bands give independent matching choices.

Conversely, transport the two endpoint flags of an old solution into a band.
  Their intersection ranks specify one of finitely many arrays;
  a simultaneous splitting gives its two-flag sequences and all the strips, matched by the old band transport.
  This produces a cut solution reconstructing the old one. The matching choices form locally affine bundles by
  Lemma 9, and over integral cut solutions they have dense integral parameters.
  Thus Lemma 8 reduces the problem to diagrams whose maximal-rank facets are disks.
  The added topology of the lower-rank facets is retained and causes no restriction in the induction hypothesis.

=== 5.3 Replacing a disk by a subspace and a quotient <replacing-a-disk-by-a-subspace-and-a-quotient>

Let $V$ be one rank-$n$ disk. At one starting boundary interval, choose a nonzero proper prefix of its seam flag,
  ending at index $k$. Such a prefix exists because the seam is proper.
  In an old solution this subspace extends to a parallel subsystem $U$ throughout the punctured disk,
  because every puncture monodromy is scalar. Put $Q = V \/ U$.
  Both ranks are less than $n$, and both systems have the same scalar puncture monodromies as $V$.

The prefix will make the reconstruction close around the boundary.
  At this interval the induced flags satisfy $Q_i = 0$ for $i lt.eq k$ and $U_i = U$ for $i gt.eq k$.
  Once these flags and their identified quotients are fixed, they have a unique lift in $U xor Q$:
  before $k$ it is the given flag in $U$, and after $k$ it is the inverse image of the flag in $Q$.
  Equivalently, the stabilizer in Lemma 10 is all of $H = "Hom" \( Q \, U \)$.
  These zero-rank conditions will be part of the chosen lower diagram,
  so the unique starting lift exists for every lower solution, not only for one extracted from an old solution.

On an interval with old seam list $W_1 \, dots.h \, W_m$, the old flag induces flags on $U \, Q$ and exact sequences

#[#set math.equation(numbering: n => "(4)")
 $ 0 arrow.r U_i \/ U_(i - 1) arrow.r W_i arrow.r Q_i \/ Q_(i - 1) arrow.r 0 . $ <eq:boundary-exact-sequences>]

Choose the ranks of all these modules, and of the modules at the finitely many vertices below.
  There are finitely many possibilities; we use the possibilities arising from old complex solutions.
  The actual construction of the lower diagram depends only on these ranks, not on the old solution.
  In particular, at the starting interval the $Q$-graded pieces have rank zero for $i lt.eq k$,
  and the $U$-graded pieces have rank zero for $i > k$. Intersections and projection images are extracted only
  from complex solutions. Integral reconstruction will instead use the specified free child modules;
  it does not require intersections of arbitrary $R$-lattices to be free.

Replace $V$ by two disks $U \, Q$, with the same orientation and scalar punctures.
  On a regular interval replace its seam by

$ U : \( u_1 \, dots.h \, u_m \) \, wide Q : \( q_1 \, dots.h \, q_m \) \, wide W_i : \( u_i \, q_i \) . $

Here $u_i$ is an actual strip joining the $U$ side to the $W_i$ side, as child on both,
  and $q_i$ similarly joins $Q$ to $W_i$. Its transport gives the maps in (4).
  Along an unmarked seam circle these may be cyclic strips.
  The old parent and child have opposite boundary orientations, so the strips sew with the required orientations.

We describe the two vertex replacements. In these descriptions,
  time increases along the positive boundary orientation of $V$, and along those of $U \, Q$.
  It therefore runs opposite to the old child boundary orientation. Unaffected strips and lists continue.

Each replacement has a common reconstruction requirement.
  At a split, the coarse quotient is $W$ with its internal flag; at an interchange,
  it is $A xor B$ with its given decomposition. The lower data must supply an exact sequence with this middle term
  whose restrictions are the exact data on both neighboring intervals.
  Lemma 10 will then extend an incoming interval lift to the vertex, and that choice will determine the outgoing lift.

==== A split or merge <a-split-or-merge>

Suppose an old block $W$ splits into $W'_1 \, dots.h \, W'_s$. Before the event its list is $W : \( w \, q \)$.
  Split the $w \, q$ connections into $w_1 \, dots.h \, w_s$ and $q_1 \, dots.h \, q_s$ by transverse seams,
  refining the lists at both ends of each connection. On $W$, use the two-flag sequence to interleave them as

$ w_1 \, q_1 \, dots.h \, w_s \, q_s . $

Merge each pair in this list to $W'_j$, introducing the side of $W'_j$ through the merge vertex and its seam
  $W'_j : \( w_j \, q_j \)$. The resulting list on $W$ continues onto the old additional seam
  $W : \( W'_1 \, dots.h \, W'_s \)$.

At this merge vertex the $W'_j$ corner joins its occurrence as a child of $W$ to its occurrence as parent of
  $w_j \, q_j$. The strip boundaries formerly at $W$ continue at $W'_j$, and their other ends remain at $U \, Q$.
  This describes all germ pairings. The $W$ lists run opposite to its boundary orientation toward the old side
  seam; the $W'_j$ sides run into that seam as children and out along their new strips as parents.
  Hence the orientations agree. Reverse this construction for an old merge.

Lemma 9 says exactly what the construction records: the flag of $W$ with two pieces $w \,
  q$ is compared with its flag having pieces $W'_j$. Their intersections induce the refined flags on $U \, Q$,
  and the matched double-graded maps give the exact sequences for the $W'_j$.
  Every old complex solution admits this replacement. Conversely,
  any lower solution supplies these compatible refined exact sequences, including all their identified quotients.

Here the seam $W : \( w \, q \)$ supplies the coarse exact sequence,
  and the retained seam $W : \( W'_1 \, dots.h \, W'_s \)$ supplies its internal flag.
  The two-flag gallery makes their induced fine quotient maps agree.
  Thus every lower solution supplies the coarse exact sequence with middle term $W$ and its fixed internal flag,
  not only the sequences on the fine quotients $W'_j$. The restriction of a vertex lift to the coarse interval is
  the identity. On the fine interval we forget the full identification with $W$.
  For the exact sequences $0 arrow.r w_j arrow.r W'_j arrow.r q_j arrow.r 0$, free compatible splittings give

$ K_(upright("interval")) \/ K_(upright("coarse")) = xor.big_(k < j) "Hom"_R \( q_j \, w_k \) . $

The restriction to that interval is therefore an affine surjection with free integral parameters.
  The same two restrictions handle the reverse merge.

==== An interchange and the negative scalar <an-interchange-and-the-negative-scalar>

Now suppose the old event interchanges $A \, B$. Their coarsened quotient of $V$ is identified with $A xor B$.
  In an old solution write $U_(*) subset A xor B$ and $Q_(*) = \( A xor B \) \/ U_(*)$ for the induced subquotients. Put

$ a = U_(*) ∩ A \, quad b = U_(*) ∩ B \, quad tilde(a) = "pr"_A \( U_(*) \) \, quad tilde(b) = "pr"_B \( U_(*) \) . $

The modules $tilde(a) \/ a$ and $tilde(b) \/ b$ have the same rank, denoted $h$.
  Put $x = A \/ tilde(a)$ and $y = B \/ tilde(b)$. The required before and after lists are

$ & upright("before") & upright("after")\
U_(*) & a \, tilde(b) & b \, tilde(a)\
Q_(*) & A \/ a \, y & B \/ b \, x\
A & a \, A \/ a & tilde(a) \, x\
B & tilde(b) \, y & b \, B \/ b . $

These symbols name ranks and strip occurrences in the new diagram;
  the intersection description explains how every old solution determines such data.

Split the incoming $tilde(b)$ connection into $b \, h$, and the incoming $A \/ a$ connection into $h \, x$.
  The four lists become

$ U_(*) : \( a \, b \, h \) \, quad Q_(*) : \( h \, x \, y \) \, quad A : \( a \, h \, x \) \, quad
  B : \( b \, h \, y \) . $

Interchange $a \, b$ on $U$ and $x \, y$ on $Q$, leaving those connections unchanged. Replace the two $h$ connections

$ \( U \, B \) \, \( Q \, A \) wide upright("by") wide \( U \, A \) \, \( Q \, B \) $

using one punctured disk of rank $h$, with scalar monodromy $- I$.
  Its boundary contacts, all as child, occur in the cyclic order $U \, B \, Q \, A$.
  Along $U$ it runs from positive to negative time, then crosses the incoming $\( U \, B \)$ strip end;
  along $B$ it runs from negative to positive time, then crosses the outgoing $\( B \, Q \)$ end;
  along $Q$ it runs from positive to negative time, then crosses the incoming $\( Q \, A \)$ end;
  along $A$ it runs from negative to positive time, then crosses the outgoing $\( A \, U \)$ end.
  This specifies the oriented sewing to all four strip ends.
  Finally merge $a \, h$ to $tilde(a)$ and $h \, y$ to $B \/ b$. If $h = 0$, delete this disk.

The lower solution provides maps $p_A : U_(*) arrow.r A$, $p_B : U_(*) arrow.r B$, $i_A : A arrow.r
  Q_(*)$ and $i_B : B arrow.r Q_(*)$, with the images and kernels specified in the table. Write

$ h_U = U_(*) \/ \( a xor b \) \, wide h_A = tilde(a) \/ a \, wide h_B = tilde(b) \/ b \, wide h_Q =
  "im" i_A ∩ "im" i_B . $

These are the rank-$h$ subquotients at the four contacts.
  The maps $p_A \, p_B$ induce isomorphisms from $h_U$ to $h_A \, h_B$, and $i_A \,
  i_B$ induce isomorphisms from $h_A \, h_B$ to $h_Q$. Figure 2 displays the two resulting paths from $h_U$ to $h_Q$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.495, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((0, 1.495), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$h_U$]])])
  content((1.495, 0), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$h_B$]])])
  content((0, -1.495), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$h_Q$]])])
  content((-1.495, 0), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$h_A$]])])
  bezier((0, 1.495), (1.495, 0), (0.7748, 1.213), (1.213, 0.7748), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.9323, 0.9323), [$p_B$], anchor: "south-west", padding: 0.1176cm)
  bezier((1.495, 0), (0, -1.495), (1.213, -0.7748), (0.7748, -1.213), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.9323, -0.9323), [$i_B$], anchor: "north-west", padding: 0.1176cm)
  bezier((0, 1.495), (-1.495, 0), (-0.7748, 1.213), (-1.213, 0.7748), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((-0.9323, 0.9323), [$p_A$], anchor: "south-east", padding: 0.1176cm)
  bezier((-1.495, 0), (0, -1.495), (-1.213, -0.7748), (-0.7748, -1.213), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((-0.9323, -0.9323), [$i_A$], anchor: "north-east", padding: 0.1176cm)
  content((0, 0.138), [$times$])
  content((0, -0.322), [$-I$])
})],
  caption: [Figure 2: The four contacts of the punctured $h$-disk. The symbols denote the corresponding $h$-subquotients and the maps they inherit. The two paths from $h_U$ to $h_Q$ differ by the monodromy $- I$, so $i_A p_A + i_B p_B = 0$. ],
) <fig:swap-disk>

The two composites $i_A p_A \, i_B p_B$ factor through $h_U$ to $h_Q$.
  They are opposite, because they are the two transports around the punctured $h$-disk.
  Hence the following sequence is a complex:

#[#set math.equation(numbering: n => "(5)")
 $ 0 arrow.r U_(*) arrow.r^(\( p_A \, p_B \)) A xor B arrow.r^(\( i_A \, i_B \)) Q_(*) arrow.r
   0 $ <eq:swap-exact-sequence>]

It is exact over $R$ as well as over $bb(C)$. The kernels of $p_A \, p_B$ are respectively $b \, a$,
  and their intersection is zero by the interchange on $U$.
  The images of $i_A \, i_B$ span $Q_(*)$ because their $x \, y$ quotients are complementary.
  If $i_A \( z \) + i_B \( t \) = 0$, projection modulo $"im" i_A$ gives $t in tilde(b)$.
  Lift $t$ under $p_B$ and subtract the image of that lift; the remaining vector is in $ker i_A = a$,
  which is again in the image of $U_(*)$. The needed lifts exist over $R$ because the named quotients are free.

For clarity, in split coordinates the maps are

$ U_(*) & = a xor b xor h \, & A & = a xor h xor x \,\
Q_(*) & = h xor x xor y \, & B & = b xor h xor y \,\
p_A \( a \, b \, h \) & = \( a \, h \, 0 \) \, & p_B \( a \, b \, h \) & = \( b \, h \, 0 \) \,\
i_A \( a \, h \, x \) & = \( h \, x \, 0 \) \, & i_B \( b \, h \, y \) & = \( - h \, 0 \, y \) . $

Thus the scalar $- I$ supplies exactly the sign needed in (5); no division by $2$ is involved.
  Conversely, any old exact sequence with the induced flags gives the refinements and maps above,
  and its two induced $h$-maps have this opposite sign. They therefore extend over the punctured disk.

The exact sequence with middle term $A xor B$ is the coarse vertex data required for reconstruction.
  In the displayed free coordinates, forgetting its full identification permits the additional stabilizer block
  $"Hom"_R \( y \, a \)$ on the incoming interval and $"Hom"_R \( x \, b \)$ on the outgoing interval.
  All unchanged blocks cancel from these quotients. Each restriction is considered separately:
  split its refined flags on $U \, Q$ and group the free summands to obtain the coarse flags.
  Both restrictions are affine surjections with free integral parameters.
  No simultaneous choice of both interval lifts is required.

All replacements occur in separate side intervals and corner neighborhoods.
  They preserve the other seams of every lower-rank facet, including repeated occurrences of the same facet.
  Parallel maps on the strips extend across the specified cross sections,
  so the construction also applies to cyclic boundary lists.

=== 5.4 Reconstruction and closure around a disk <reconstruction-and-closure-around-a-disk>

We now reconstruct a disk from an arbitrary solution of its lower diagram. Put $V = U xor Q$.
  All puncture monodromies are the prescribed scalars, so this is a local system with the required monodromy.
  Moreover $H = "Hom" \( Q \, U \)$ is constant on the punctured disk:
  the identical scalar monodromies of $U \, Q$ act trivially on it.

The starting interval has the unique lift already established.
  Continue it by parallel transport to the first vertex. The relevant vertex construction gives an affine space of
  extensions of this incoming lift. Choose one and restrict it to the outgoing interval,
  then repeat around the boundary. Every step is surjective with affine fiber,
  and over integral lower data that fiber has free integral parameters.
  On return, the starting interval still has just one lift, so the propagated lift agrees with it automatically.
  This includes all identified quotients: they belong to the lift spaces and are not additional data to be matched
  afterward. With no vertices, the same unique lift is parallel around the unmarked seam circle.
  Thus closure imposes no further equation.

For each fixed rank pattern these successive choices form a finite tower of locally affine bundles over the lower
  solution variety. Indeed the flags have constant ranks, so they can be split locally,
  and the preceding matrix-block descriptions give each event fiber.
  Every integral lower solution admits integral choices, dense in those fibers by Lemma 3.
  Conversely, every old complex solution is recovered from its induced lower data and its original lifts,
  up to the allowed frame changes. Its disk local system is isomorphic to $U xor
  Q$ because all puncture generators act by the prescribed scalars.

Perform the construction on every rank-$n$ disk. No new rank-$n$ facet has been introduced.
  After normalizing zero blocks and identity seams, the induction hypothesis gives density on each resulting lower
  diagram. Lemma 8 gives density on the disk diagrams and then on the original nonclosed diagram.
  This proves Proposition 11.

Closed maximal-rank facets remain. The next two sections treat their scalar-monodromy equations;
  after the closed-density lemma we assemble the full induction proving Theorem 7.

== 6 Closed surfaces with scalar monodromy <sec:surfaces>

Closing a surface with prescribed scalar monodromies leads to a product of commutators.
  We first settle the case of genus one, and then prove the irreducibility needed for the higher-genus argument.
  For $n gt.eq 1$, $g gt.eq 0$, and $c in bb(C)^times$, write

$ cal(R)_(n \, g) \( c \) = {\( A_1 \, B_1 \, dots.h \, A_g \, B_g \) in "GL"_n \( bb(C) \)^(2 g) :
  product_(j = 1)^g \[ A_j \, B_j \] = c I_n} \, wide \[ A \, B \] = A B A^(- 1) B^(- 1) . $

As throughout the paper, this is a reduced variety. Taking determinants shows that it is empty unless $c^n = 1$.
  For genus zero it is a point if $c = 1$, and is empty otherwise.
  For rank one and $c = 1$, it is the torus $\( bb(C)^times \)^(2 g)$.

=== 6.1 Genus one <genus-one>

The density of simultaneously diagonalizable commuting pairs goes back to Motzkin and
  Taussky #cite(label("MotzkinTaussky1955")); see also Gerstenhaber #cite(label("Gerstenhaber1961")) and
  Guralnick #cite(label("Guralnick1992")). We use the regular-centralizer proof described by Guralnick and
  Sethuraman #cite(label("GuralnickSethuraman2000")) Section 3, Proposition 6,
  then record its integral consequence over the full ring in use here.

#thm([Lemma 6.1.])[
  #emph[Let $R subset bb(C)$ be an infinite domain with infinitely many units.
    Then the pairs of commuting matrices in $"GL"_d \( R \)$ are Zariski dense in the variety of commuting pairs
    in $"GL"_d \( bb(C) \)$.]
] <lem:commuting-density>

#proof[
  Call a matrix regular if its minimal polynomial has degree $d$.
    The centralizer of any matrix $C$ contains a regular matrix $E$:
    in a Jordan basis for $C$, take $E$ to have blocks $mu_i I + N_i$,
    where $N_i$ is the nilpotent Jordan block of the corresponding size and all $mu_i$ are distinct.
    The minimal polynomial of $E$ then has degree $d$.
  Given a commuting invertible pair $\( C \, D \)$, the matrix $D +
    t E$ is regular and invertible for generic $t$. Indeed regularity is open and holds near infinity on this
    line, since $E + t^(- 1) D$ tends to $E$; the determinant polynomial is nonzero at $t = 0$. Fix such a $t$.
    The centralizer of the regular matrix $D_t = D + t E$ is $bb(C) \[ D_t \]$:
    a commuting map is determined by its value on a cyclic vector,
    and that value is achieved by a polynomial in $D_t$. Thus $C = f \( D_t \)$ for a polynomial $f$.
    Perturbing $D_t$ to matrices $D'$ with distinct eigenvalues,
    while keeping both $D'$ and $f \( D' \)$ invertible, approximates $\( C \, D_t \)$ by simultaneously
    diagonalizable pairs. Letting $t$ tend to zero proves their density among all commuting invertible pairs.
  The group $"GL"_d \( R \)$ is Zariski dense in $"GL"_d \( bb(C) \)$.
    Its closure contains all elementary unipotent groups, since $R$ is infinite, and the diagonal torus,
    since $R^times$ is infinite; these generate $"GL"_d$. Thus the integral points in the domain of
  $ "GL"_d times \( bb(G)_m \)^d times \( bb(G)_m \)^d arrow.r "GL"_d^2 \,
    wide \( P \, u \, v \) mapsto #scale(x: 120%, y: 120%)[\(] P "diag" \( u \) P^(- 1) \,
    P "diag" \( v \) P^(- 1) #scale(x: 120%, y: 120%)[\)] $
  are dense. Their images are integral commuting pairs, and the image is exactly the simultaneously diagonalizable
    locus. Notice that $P^(- 1)$ has entries in $R$ when $P in "GL"_d \( R \)$. ◻
]

#thm([Lemma 6.2.])[
  #emph[Let $R subset bb(C)$ be an infinite domain with infinitely many units.
    If $c in R$ is a root of unity and $c^n = 1$, then $cal(R)_(n \, 1) \( c \) \( R \)$ is Zariski dense in
    $cal(R)_(n \, 1) \( c \)$.]
] <lem:torus-density>

#proof[
  Put $m = "ord" \( c \)$, so $m divides n$. The equation is $A B = c B A$.
    Therefore $B$ carries the generalized $lambda$-eigenspace of $A$ onto its generalized $c lambda$-eigenspace.
    All eigenvalues are nonzero, so each orbit under multiplication by $c$ has length $m$.
    Let $V_0$ be the sum of one generalized eigenspace from each orbit, and identify $V_j = B^j V_0$ with $V_0$,
    for $0 lt.eq j < m$, using $B^j$. These spaces give a direct sum of $bb(C)^n$, and $dim V_0 = n \/ m$.
    In these coordinates the matrices have the form
  $ A = "diag" \( C \, c C \, dots.h \, c^(m - 1) C \) \, wide
    B \( v_0 \, dots.h \, v_(m - 1) \) = \( D v_(m - 1) \, v_0 \, dots.h \, v_(m - 2) \) \, $
  where $C = A \|_(V_0)$ and $D = B^m \|_(V_0)$ commute. Conversely, any commuting invertible $C \,
    D$ give a solution by these formulas. In particular the wrap-around relation uses precisely $C D =
    D C$ and $c^m = 1$.
  We have obtained a surjective morphism from $"GL"_n$ times the variety of commuting invertible
    $\( n \/ m \)$-dimensional pairs to $cal(R)_(n \, 1) \( c \)$,
    by the displayed construction followed by conjugation. Lemma 12 and density of $"GL"_n \( R \)$ give a dense
    set of integral points in its domain. Their images are integral solutions. ◻
]

In our application $R = cal(O)_F$, and the unit $1 + sqrt(2)$ has infinite order.
  Thus these lemmas, as well as the rank-one torus case, apply over the fixed ring already chosen.

=== 6.2 Irreducibility in higher genus <irreducibility-in-higher-genus>

The proof below follows the character-count and Lang–Weil method of
  Liebeck–Shalev #cite(label("LiebeckShalev2005")) Section 7, Lemma 7.1 and the proof of Theorem 1.8.
  We give the elementary estimates for $"SL"_n$, and use a lower bound for the dimension of every component to
  obtain irreducibility of the entire fiber.

#thm([Proposition 6.3.])[
  #emph[For $n gt.eq 2$, $g gt.eq 2$, and $c^n = 1$, the variety $cal(R)_(n \, g) \( c \)$ is irreducible of
    dimension $\( 2 g - 1 \) n^2 + 1$.]
] <prop:surface-irreducibility>

#proof[
  For a field $k$ and a scalar $c in k^times$ with $c^n = 1$,
    let $cal(S)_k \( c \)$ denote the fiber obtained by imposing determinant one on every handle matrix.
    First work over a finite field $k = bb(F)_q$, and put $G = "SL"_n \( bb(F)_q \)$ and $z = c I_n$.
    We need two elementary estimates:
  #[#set math.equation(numbering: n => "(6)")
   $ \| "Irr" \( G \) \| = O_n \( q^(n - 1) \) \, wide chi \( 1 \) gt.eq frac(q^(n - 1) - 1, 2) quad
     upright("for every nontrivial ") chi in "Irr" \( G \) . $ <eq:surface-character-bounds>]
  For the first estimate, there are $q^(n - 1)$ possible monic characteristic polynomials of degree $n$ and
    determinant one. For each polynomial, rational canonical form is specified by a partition for each of its
    distinct irreducible factors. There are at most $n$ factors,
    and the relevant partition numbers are bounded in terms of $n$.
    Thus there are $O_n \( q^(n - 1) \)$ $"GL"_n \( bb(F)_q \)$-classes of determinant one. Such a class splits into
  $ \[ bb(F)_q^times : det C_("GL"_n \( bb(F)_q \)) \( x \) \] lt.eq n $
  classes in $G$, since the centralizer contains the scalar matrices, whose determinants are the $n$-th powers.
    This bounds the number of conjugacy classes in $G$, hence its number of irreducible characters.
  For the degree estimate, restrict a nontrivial irreducible complex representation to the abelian subgroup
  $ U = {mat(delim: "(", 1, v; 0, I_(n - 1)) : v in bb(F)_q^(n - 1)} . $
  A nontrivial character of $U$ must occur: otherwise the representation would be trivial on $U$ and on all its
    conjugates, which generate $G$. Every character in its orbit under the normalizer also occurs.
    For $n gt.eq 3$, the subgroup $"diag" \( 1 \, "SL"_(n - 1) \( bb(F)_q \) \)$ acts transitively on the
    nontrivial characters of $U$. Indeed a fixed nontrivial additive character of the prime field,
    composed with the field trace, identifies them with the nonzero vectors in the dual of $bb(F)_q^(n - 1)$.
    This gives the stronger bound $q^(n - 1) - 1$. For $n = 2$,
    conjugation by $"diag" \( a \, a^(- 1) \)$ acts by square scalings;
    a nontrivial character has an orbit of size $\( q - 1 \) \/ gcd \( 2 \, q - 1 \)$.
    This proves (6), including the small fields.
  The Frobenius commutator formula now gives the number of solutions as
  #[#set math.equation(numbering: n => "(7)")
   $ \| G \|^(2 g - 1) sum_(chi in "Irr" \( G \)) frac(chi \( z^(- 1) \), chi \( 1 \)^(2 g - 1)) = \|
     G \|^(2 g - 1) #scale(x: 120%, y: 120%)[\(] 1 + O_n \( q^(- \( n - 1 \)) \) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:surface-frobenius>]
  For completeness, the central element $T = sum_(a \, b in G) \[ a \, b \] in
    bb(C) \[ G \]$ acts on an irreducible representation of degree $d$ as $\| G \|^2 \/ d^2$,
    by Schur orthogonality. Expanding $T^g$ in the central idempotents
  $ e_chi = frac(chi \( 1 \), \| G \|) sum_(x in G) chi \( x^(- 1) \) x $
  and taking its coefficient at $z$ proves the first expression in (7);
    see also #cite(label("LiebeckShalev2005")) Lemma 3.1(i). Centrality gives $\| chi \( z^(- 1) \) \| =
    chi \( 1 \)$. Since $g gt.eq 2$, the absolute contribution of all nontrivial characters is at most
    $sum_(chi eq.not 1) chi \( 1 \)^(- 2) = O_n \( q^(- \( n - 1 \)) \)$, by (6).
  Let $cal(S) = cal(S)_(overline(bb(F))_q) \( c \)$, and set $D = \( 2 g - 1 \) \( n^2 - 1 \)$.
    The target $"SL"_n$ of the product-of-commutators map is smooth of dimension $n^2 - 1$.
    Its fiber is therefore locally cut out in the smooth variety $"SL"_n^(2 g)$ by $n^2 - 1$ equations.
    The principal ideal theorem implies that every component of $cal(S)$ has dimension at least $D$. On the other hand,
  $ \| "SL"_n \( bb(F)_q \) \| = q^(n^2 - 1) product_(i = 2)^n \( 1 - q^(- i) \) \, $
  so (7) says that its fiber has $q^D \( 1 + o \( 1 \) \)$ points as $q$ tends to infinity through extensions of
    any fixed field of definition.
  Pass to a finite field $bb(F)_Q$ over which $c$ and all geometric components are defined, and write $q = Q^m$.
    For a fixed geometrically irreducible component of dimension $d$, the Lang–Weil estimate is $q^d +
    O \( q^(d - 1 \/ 2) \)$, with a constant independent of $m$; a fixed variety of dimension at most $d -
    1$ has $O \( q^(d - 1) \)$ points #cite(label("LangWeil1954"));
    see also #cite(label("Poonen2017")) Theorem 7.7.1. The character count holds over every one of these extension
    fields. It therefore first rules out components of dimension greater than $D$.
    All components consequently have dimension $D$. If there are $e$ of them, the same estimate,
    together with the smaller dimensions of their pairwise intersections, gives
  $ \| cal(S) \( bb(F)_q \) \| = e q^D + O \( q^(D - 1 \/ 2) \) . $
  Comparison with the preceding count yields $e = 1$. The counts are positive over sufficiently large extensions,
    so the fiber is nonempty. We have proved geometric irreducibility, including when the initial field is small.
  This also proves irreducibility in characteristic zero. The characteristic-zero fiber is nonempty:
    take the clock-and-shift solution in Lemma 13, normalize its two determinants by complex scalar roots,
    and put identities on the remaining handles. If the fiber were reducible,
    after extending the number field containing $c$, the geometric generic fiber would contain two disjoint
    nonempty open subsets, obtained by removing the other irreducible components.
    Spread their finite defining data over a localization of its ring of integers.
    After shrinking this base, the two opens remain disjoint and both have nonempty fibers.
    Here constructibility of images ensures that an open which meets the generic fiber meets every fiber over some
    nonempty open of the base. A closed fiber would thus have two disjoint nonempty geometric opens,
    contradicting the irreducibility just proved. The characteristic-zero dimension is $D$:
    after shrinking the arithmetic base, fiber dimension agrees with generic fiber dimension,
    whereas the closed fibers all have dimension $D$.
  Finally, multiplication of the $2 g$ handle matrices by independent central scalars gives a surjective morphism
  $ cal(S)_(bb(C)) \( c \) times \( bb(G)_m \)^(2 g) arrow.r cal(R)_(n \, g) \( c \) . $
  Surjectivity follows by taking an $n$-th root of each determinant.
    The domain is irreducible and the fibers are finite, consisting of the scalar choices of these roots.
    The image is therefore irreducible of dimension $D + 2 g = \( 2 g - 1 \) n^2 + 1$. ◻
]

Proposition 14 is a geometric statement. The roots used in its last paragraph are taken in $bb(C)$;
  the arithmetic passage to determinant one over a single number field will be treated separately.

== 7 From one spectrum to a closed surface <sec:dynamics>

The remaining step in the diagram induction concerns a closed facet.
  Cutting a nonseparating circle reduces it to a facet with boundary,
  but prescribes the spectrum of the gluing monodromy. We first obtain density with this spectrum fixed.
  A Dehn twist then supplies the missing directions.

Multiplication by a centralizer element is the algebraic form of the generalized twist motions described by
  Goldman #cite(label("Goldman1986")) Section 4.6. We use the matrix relation directly,
  then verify the needed torus closure and tangent directions at an explicit representation.

#thm([Lemma 7.1.])[
  #emph[Let $2 lt.eq n lt.eq r$, $g gt.eq 2$, and let $c in F$ satisfy $c^n = 1$.
    Assume that integral solutions are dense for every normalized diagram of ranks at most $n$ whose rank-$n$
    facets have nonempty boundary. Then $cal(R)_(n \, g) \( c \) \( R \)$ is Zariski dense in
    $cal(R)_(n \, g) \( c \)$.]
] <lem:closed-density>

#proof[
  Write $V = cal(R)_(n \, g) \( c \)$ and let $D$ be the Zariski closure of its integral points.
    By Proposition 14, $V$ is irreducible.
  #emph[Integral gluing at a fixed spectrum.] Choose
  $ alpha_i = zeta^(thin i - 1) wide \( 1 lt.eq i lt.eq n \) . $
  These numbers are distinct and their pairwise differences are units of $R$, by Lemma 5.
    We first show that $D$ contains the entire fiber
  $ V_alpha = { \( A_j \, B_j \) in V : det \( X I - A_1 \) = product_(i = 1)^n \( X - alpha_i \) } . $
  Represent $V$ by a genus-$g$ facet with one puncture of scalar monodromy $c^(- 1)$,
    so that the surface relation is $product_j \[ A_j \, B_j \] = c I$.
    Cut this surface along the circle represented by $A_1$. On each new boundary,
    require a full flag with successive scalar monodromies $alpha_1 \, dots.h \, alpha_n$,
    using rank-one punctured disk caps. Here the two loops are read in the same original direction;
    their induced boundary orientations are opposite, so one reverses the cap scalar when necessary.
    The new seams have $n > 1$ rank-one children, so they are proper; the resulting rank-$n$ facet has boundary.
    The hypothesis gives density of integral solutions on this cut diagram.
  To reglue, choose an isomorphism between the two boundary systems.
    Because the eigenvalues are distinct, the choices form a torsor for $\( bb(G)_m \)^n$,
    by matching corresponding eigenlines. They vary locally algebraically with the cut solution,
    so their projection to the cut solution variety is open and surjective. This description also holds over $R$.
    Indeed the spectral projectors
  #[#set math.equation(numbering: n => "(8)")
   $ E_i \( A \) = product_(j eq.not i) frac(A - alpha_j I, alpha_i - alpha_j) in M_n \( R \)
     $ <eq:spectral-projectors>]
  split off the eigenmodules. Write $F_bullet$ for the prescribed flag.
    The projector $E_i$ is zero on $F_(i - 1)$ and on $R^n \/ F_i$:
    on each of their graded pieces its action is zero, so its induced action is both nilpotent and idempotent.
    It induces the identity on $F_i \/ F_(i - 1)$. Hence its image is isomorphic to that graded line,
    which is free because it is identified with a framed cap fiber.
    Thus every integral cut solution has gluing choices, and in these bases the integral choices are
    $\( R^times \)^n$, a dense subset of the gluing torus by Lemma 3.
    The open-projection density principle therefore gives dense integral glued solutions.
    Conversely, every point of $V_alpha$ admits these ordered eigenflags and cap frames,
    and is recovered by gluing, up to frame changes. Frame changes over $R$ are dense by the same lemma.
    Hence $V_alpha subset D$.
  #emph[Torus saturation by Dehn twists.] The automorphisms
  $
    tau^(plus.minus 1) \( A_1 \, B_1 \, A_2 \, B_2 \, dots.h \) = \( A_1 B_1^(plus.minus 1) \, B_1 \, A_2 \,
    B_2 \, dots.h \) $
  preserve $V$, since $\[ A_1 B_1 \, B_1 \] = \[ A_1 \, B_1 \]$, and preserve its integral points.
    Consequently they preserve $D$. We show that this discrete invariance enlarges $V_alpha$ to an analytic open
    subset of $V$.
  Choose distinct rational primes $beta_1 \, dots.h \, beta_n$. They are multiplicatively independent.
    Let $P$ be the cyclic permutation matrix $P e_i = e_(i + 1)$, with indices modulo $n$. The point $x_0 in V$ given by
  #[#set math.equation(numbering: n => "(9)")
   $ A_1 & = "diag" \( alpha_1 \, dots.h \, alpha_n \) \, & B_1 & = "diag" \( beta_1 \, dots.h \, beta_n \) \,\
A_2 & = P \, & B_2 & = "diag" \( 1 \, c^(- 1) \, dots.h \, c^(1 - n) \) $ <eq:twist-test-point>]
  and identity matrices on the other handles belongs to $V_alpha$.
    Indeed $P B_2 P^(- 1) = c B_2$, including the wraparound entry because $c^n = 1$.
    The numbers $beta_i$ are used only to choose this complex point; they need not be units of $R$.
  The relation map $"GL"_n^(2 g) arrow.r "SL"_n$ is submersive at $x_0$.
    Left infinitesimal variations of $B_1$ give $\( "Ad"_(A_1) - 1 \) X$, spanning all off-diagonal matrices.
    Diagonal variations of $B_2$ give $\( "Ad"_P - 1 \) H$, spanning the traceless diagonal matrices.
    These span $frak(s l)_n$, so $V$ is smooth at $x_0$. The map $sigma$ recording the characteristic coefficients
    of $A_1$ is also submersive there: varying $A_1$ diagonally preserves the relation,
    and the elementary-symmetric-functions map has invertible differential at distinct eigenvalues.
    Thus $V_alpha$ is smooth near $x_0$.
  Take a small connected analytic neighborhood $U$ of $x_0$ in $V_alpha$.
    The eigenvalues $b_i \( x \)$ of $B_1 \( x \)$ and their spectral projectors $P_i \( x \)$ can be labeled
    holomorphically on $U$, since the spectrum at $x_0$ is simple.
    For each nonzero $m in bb(Z)^n$, the holomorphic function
  $ product_i b_i \( x \)^(m_i) - 1 $
  is nonzero at $x_0$. Its zero set is therefore closed with empty interior.
    The Baire theorem implies that the points $x in U$ with multiplicatively independent $b_i \( x \)$ form a
    dense subset $U_0$. For such an $x$, the powers of $B_1 \( x \)$ are Zariski dense in its centralizer torus:
    otherwise a nontrivial character of that torus would equal one on the cyclic subgroup,
    giving a multiplicative relation. Since $x in D$ and $tau^k \( x \) in D$ for every $k in bb(Z)$,
    closedness then gives every tuple obtained by replacing $A_1 \( x \)$ with $A_1 \( x \) T$,
    for $T$ in this centralizer.
  #emph[A submersive family of twists.] To extend this conclusion over all of $U$,
    write the centralizers in the holomorphic form
  $ T \( x \, t \) = sum_(i = 1)^n t_i P_i \( x \) \, wide t in \( bb(C)^times \)^n . $
  Replacing $A_1 \( x \)$ with $A_1 \( x \) T \( x \, t \)$ defines a holomorphic map $Psi :
    U times \( bb(C)^times \)^n arrow.r V$; it preserves the relation because $T \( x \, t \)$ commutes with
    $B_1 \( x \)$. Its values on $U_0 times \( bb(C)^times \)^n$ lie in $D$.
    Since $D$ is analytically closed, all values of $Psi$ lie in $D$.
  At $\( x_0 \, 1 \)$ the directions from $U$ give $ker \( d sigma \)$.
    The torus directions independently multiply the diagonal entries of $A_1$,
    so their images under $d sigma$ span its target. Hence $d Psi$ is surjective.
    Its image contains an analytic open subset of $V$. Such a subset is Zariski dense in an irreducible complex
    variety, proving $D = V$. ◻
]

=== 7.1 Completion of the rank induction <completion-of-the-rank-induction>

#proof[
  We induct on the largest facet rank $n$. The rank-zero diagram has only empty data.
    Normalize zero pieces and identity seams as in Section 5.1;
    solutions of the original diagram are recovered from solutions of the normalized diagram by integral
    restriction and frame changes. At rank one no proper seam can remain,
    since it would have at least two positive-rank children. Thus the normalized diagram consists of independent
    closed scalar local systems. Each solution variety is empty or a torus, so the rank-one case follows from Lemma 3.
  Now let $n gt.eq 2$ and assume the theorem for all diagrams of ranks less than $n$.
    Proposition 11 proves density for the part of the normalized diagram having no closed rank-$n$ facet.
    It allows all lower-rank facets, closed or not. Every remaining closed rank-$n$ facet is an independent factor
    $cal(R)_(n \, g) \( c \)$, where $c$ is the inverse product of its scalar puncture monodromies.
    If $c^n eq.not 1$, that factor is empty. Otherwise the genus-zero factor is a point or empty,
    Lemma 13 gives density for genus one, and Lemma 15 gives it for higher genus.
    The hypothesis of the last lemma is exactly the normalized nonclosed step already established at this rank.
  The product of these dense sets is dense in the normalized solution variety.
    Restoring the original diagram and its frames preserves density by Lemma 3.
    This completes the induction over the same fixed ring $R$. ◻
]

== 8 Boundary classes and the character quotient <sec:descent>

We now apply Theorem 7 to the surface underlying the curve.
  Flags encode the boundary classes by closed rank bounds. We then make the handle determinants one and select the
  exact classes on the character quotient. This order is important:
  semisimplifying a representation can decrease the Jordan blocks of a boundary matrix.

=== 8.1 Flags for arbitrary Jordan classes <flags-for-arbitrary-jordan-classes>

Let $overline(X)$ be the smooth compactification of the curve, of genus $g$,
  and replace each missing point by a boundary circle. For a prescribed boundary class,
  write $nu_lambda$ for its Jordan partition at the eigenvalue $lambda$, and write

$ c_(lambda \, 1) gt.eq c_(lambda \, 2) gt.eq dots.h.c > 0 $

for the column lengths of this partition. Its generalized $lambda$-eigenspace has dimension $n_lambda = \|
  nu_lambda \|$. Order the eigenvalues once and for all. On the boundary put a flag whose graded pieces,
  in that order, have dimensions $c_(lambda \, 1) \, c_(lambda \, 2) \, dots.h$ and scalar monodromy $lambda$.
  Realize each piece by a punctured disk cap, choosing the scalar according to the meridian orientation.

Every matrix in the prescribed class admits this flag: on its generalized $lambda$-eigenspace use the successive
  kernels of powers of $A - lambda I$. Conversely, any matrix with the prescribed flag has the required
  characteristic polynomial and satisfies

#[#set math.equation(numbering: n => "(10)")
 $ "rk" #scale(x: 120%, y: 120%)[\(] \( A - lambda I \)^k #scale(x: 120%, y: 120%)[\)] lt.eq r -
   sum_(j = 1)^k c_(lambda \, j) wide \( lambda upright(" prescribed") \, med k gt.eq 1 \) \, $ <eq:jordan-rank-bounds>]

where missing columns are zero. To see this, restrict the flag to the generalized $lambda$-eigenspace.
  The nilpotent part lowers its flag by one step, so the first $k$ steps lie in its $k$th kernel.
  On the other generalized eigenspaces, $A - lambda I$ is invertible. These observations give (10).
  Restriction to the generalized eigenspaces is valid because their polynomial projectors preserve every invariant
  flag. This argument takes place over $bb(C)$ and requires no unit condition on differences between the
  prescribed boundary eigenvalues.

Use the compact surface as a rank-$r$ parent facet and attach the caps just described.
  In the projective case no caps are needed. Let $Z$ be the reduced Zariski closure,
  in the framed $"GL"_r$ representation variety, of the main-surface representations obtained from this diagram.
  Theorem 7 gives a dense set of actual $"GL"_r \( R \)$ matrix points in $Z$.
  The preceding flag argument shows that $Z$ contains every representation with the prescribed exact classes and
  lies within the closed conditions consisting of their characteristic polynomials and (10).
  In particular all its peripheral determinants are one.

The set $Z$ is invariant under simultaneous conjugation. It is also invariant under twisting by characters of
  $pi_1 \( overline(X) \)$: such a twist independently multiplies each of the $2
  g$ handle matrices by a scalar and leaves all peripheral and cap data unchanged.
  These two invariances also hold for its closure.

=== 8.2 A single field makes all determinants one <a-single-field-makes-all-determinants-one>

Put $S = Z ∩ "Hom" \( pi_1 \( X \) \, "SL"_r \)$, taking reduced varieties, and let $T = \( bb(G)_m \)^(2 g)$.
  Write $delta : Z arrow.r T$ for the handle determinants. Scalar twisting defines

$ f : S times T arrow.r Z \, wide \( s \, t \) mapsto t dot.op s . $

It is the base change of the power map $\[ r \] : T arrow.r T$. More explicitly,

#[#set math.equation(numbering: n => "(11)")
 $ S times T & med arrow.r^(med tilde.op med) med { \( z \, t \) in Z times T : delta \( z \) = t^r } \,\
\( s \, t \) & mapsto \( t dot.op s \, t \) \, $ <eq:determinant-pullback>]

with inverse $\( z \, t \) mapsto \( t^(- 1) dot.op z \, t \)$.
  Twist invariance of $Z$ ensures that this inverse takes values in $S times T$.
  Consequently $f$ is finite, étale and surjective, and in particular open.

Let $L \/ F$ be the fixed finite extension of Lemma 6, containing all $r$th roots of all units of $R$.
  If $z$ is one of the integral matrix points dense in $Z$, every coordinate of $delta \( z \)$ is a unit of $R$.
  Every preimage of $z$ under $f$ therefore has $t in \( cal(O)_L^times \)^(2 g)$ and $s =
  t^(- 1) dot.op z$ an actual $"SL"_r \( cal(O)_L \)$ representation.
  Since $f$ is open, the full preimage of this dense set is dense in $S times T$.
  Projection to $S$ shows that actual $"SL"_r \( cal(O)_L \)$ representations are dense in $S$.
  The field $L$ is chosen before the points and is the same for all components.
  For $g = 0$, the torus $T$ is trivial and this argument is the identity map.

=== 8.3 Selecting the exact classes after semisimplification <selecting-the-exact-classes-after-semisimplification>

Let $cal(R) = "Hom" \( pi_1 \( X \) \, "SL"_r \)$ over $bb(C)$ and let $q : cal(R) arrow.r
  M_r \( X \)_(bb(C))$ be its affine character quotient. Let $C subset
  cal(R)$ be the invariant closed locus defined by the prescribed characteristic polynomials and all the bounds
  (10). Only $1 lt.eq k lt.eq r$ is needed. Let $C_(upright("bad")) subset
  C$ be the union of the loci where at least one rank is strictly smaller than the rank in the prescribed class.
  This is a finite union of invariant closed subsets, obtained by lowering one of the positive rank bounds by one.

Lemma 2 identifies the exact character locus as

#[#set math.equation(numbering: n => "(12)")
 $ Y = q \( C \) \\ q \( C_(upright("bad")) \) . $ <eq:exact-character-open>]

In particular it is open in $q \( C \)$, including when semisimplification can shrink some boundary blocks.

We have $S subset C$, and $S$ contains every representation with the exact prescribed boundary classes.
  Hence $q \( S \)$ is a closed subset of $q \( C \)$ containing $Y$.
  The dense integral representations in $S$ give a dense subset $A subset
  q \( S \)$ of ambient integral character points: evaluating integral conjugation invariants on their entries
  gives points of the specified model over $cal(O)_L$. No integral matrix realization of their semisimplifications
  is needed. By (12), $Y$ is open in $q \( S \)$, so $A ∩ Y$ is dense in $Y$.

This proves Theorem 1 for exact classes. It proves density in the entire reduced locus,
  hence in every irreducible component, without an irreducibility assumption on $Z$, $S$ or $Y$.
  It also retains the genus-zero and nonregular boundary cases.
  The selection concerns only the generic-fiber character; it imposes no avoidance of $q \( C_(upright("bad")) \)$
  at finite primes.

Finally, fixed characteristic polynomials allow only finitely many Jordan partitions.
  Their exact strata cover the fixed-polynomial locus. The same $F$ and $L$ work for all of them,
  because these fields depend on the rank and the boundary eigenvalues, not on the partitions.
  Taking the finite union of the dense sets proves the fixed-polynomial assertion as well. Empty strata are harmless.

For completeness, if $X$ is nonprojective and no boundary conditions are imposed,
  its fundamental group is free of rank $2 g + s - 1$. The group $"SL"_r \( bb(Z) \)$ is Zariski dense in
  $"SL"_r \( bb(C) \)$: its closure contains every elementary one-parameter unipotent subgroup,
  and these generate $"SL"_r \( bb(C) \)$. Thus the integral matrix tuples are dense in the free-group
  representation variety, and their characters are dense in its quotient, already over $bb(Z)$.
  The cases of a free group of rank zero and of $r = 1$ give a point.
  Together with the projective case proved above, this establishes the unrestricted assertion of Theorem 1.

#prodef([Remark 8.1.])[
  (The rank-two comparison).  The ambient-integral exact-class statement in rank two also follows from
    Coccia–Litt’s surface results #cite(label("CocciaLitt")) Theorems 5.0.4 and 6.1.5.
    Write $epsilon I$ for the product of the prescribed central boundary matrices and remove those punctures from
    the presentation. If another puncture remains, multiply its matrix by $epsilon$.
    The relation becomes the ordinary surface relation, and the corresponding trace changes only by a sign.
    These tuple maps have integral coefficients and commute with conjugation;
    their pullbacks therefore induce maps on integral invariant rings and preserve ambient integral points.
  For the remaining noncentral boundary classes, the trace determines the class unless it is $2$ or $- 2$.
    In those cases exclude the closed quotient locus of the corresponding scalar matrix.
    By Lemma 2, exactness is thus an open condition in the trace locus,
    to which their ordinary surface theorem applies. If every prescribed boundary matrix was central,
    the remaining relation is
  $ product_(j = 1)^g \[ A_j \, B_j \] = epsilon I . $
  For $epsilon = 1$ use their ordinary theorem; for $epsilon = - 1$ and $g gt.eq 1$ use their twisted theorem.
    In genus zero these two cases are respectively a point and the empty set.
    This deduction imposes no exact Jordan condition at finite primes.
] <rem:rank-two-comparison>

#bibliography("refs.bib", style: "ieee", title: [References])
