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

#align(center)[#text(size: 16pt, weight: "bold")[Bounded-degree coboundary expanders in every dimension]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

In an expander graph, the edge boundary of a set of vertices controls its distance from the empty set or the whole
  vertex set. Coboundary expansion extends this condition to sets of faces in a simplicial complex.
  Over $bb(F)_2$, the coboundary of a set of $i$-faces consists of the $\( i + 1 \)$-faces containing an odd
  number of them. We construct complexes of increasing size for which this boundary controls distance from the
  space of coboundaries, uniformly in the size and with a bounded number of top-dimensional faces at each vertex.

Let $Y$ be a finite pure $s$-dimensional simplicial complex, and let $Y \( i \)$ denote its faces with $i +
  1$ vertices. Purity means that every face is contained in an $s$-face.
  Write $C^i \( Y \; bb(F)_2 \)$ for the functions from $Y \( i \)$ to $bb(F)_2$. We use the weights

#[#set math.equation(numbering: n => "(1.1)")
 $ w_i^Y \( sigma \) =
   frac(\# { tau in Y \( s \) : sigma subset.eq tau }, binom(s + 1, i + 1) thin \| Y \( s \) \|) \,
   wide ∥f∥_(Y \, i) = sum_(sigma : thin f \( sigma \) eq.not 0) w_i^Y \( sigma \) . $ <eq:weights>]

Equivalently, sample an $s$-face uniformly and then one of its $i$-faces uniformly;
  $∥f∥_(Y \, i)$ is the probability that $f$ is nonzero there.
  All simplicial chains and cochains have coefficients in $bb(F)_2$ unless specified otherwise. The coboundary is

$ \( delta_i f \) \( tau \) = sum_(sigma subset tau\
\| sigma \| = i + 1) f \( sigma \) quad upright("in ") bb(F)_2 . $

Write $Z^i \( Y \) = ker delta_i$ and $B^i \( Y \) = "im" delta_(i - 1)$,
  taking $B^0 \( Y \)$ to be the constant functions. For a subspace $A subset.eq C^i \( Y \; bb(F)_2 \)$, put

$ "dist"_(Y \, i) \( f \, A \) = min_(a in A) ∥f - a∥_(Y \, i) . $

Thus $Z^0 \( Y \) = B^0 \( Y \)$ when $Y$ is connected.

#thm([Theorem 1.1.])[
  #emph[For every integer $d gt.eq 3$, there exist constants $D < oo$, $epsilon > 0$,
    and finite connected pure $d$-dimensional simplicial complexes $X_m$, with $\| X_m \( 0 \) \| arrow.r oo$,
    such that every vertex belongs to at most $D$ faces of dimension $d$ and, for every $f in C^i \( X_m \; bb(F)_2 \)$,
#[#set math.equation(numbering: n => "(1.2)")
 $ ∥delta_i f∥_(X_m \, i + 1) gt.eq epsilon thin "dist"_(X_m \, i) \( f \, B^i \( X_m \) \)
   wide \( 0 lt.eq i < d \) . $ <eq:goal>]

 The constants are independent of $m$, $i$, and $f$.]
] <thm:main>

The distinction between cocycles and coboundaries is essential.
  If $f in Z^i \( Y \) \\ B^i \( Y \)$, its coboundary vanishes while its distance from $B^i \( Y \)$ is positive.
  Thus (1.2) requires the vanishing of $H^i \( Y \; bb(F)_2 \) = Z^i \( Y \) \/ B^i \( Y \)$,
  with reduced cohomology understood in degree zero. A uniform inequality against $Z^i \( Y \)$ alone allows
  nonzero cohomology. Our proof supplies both that quantitative inequality and the required vanishing for the same
  complexes.

===== 1.1 Prior work. <prior-work.>

The higher-dimensional coisoperimetric viewpoint developed through the random-complex work of Linial and Meshulam
  [16] and Meshulam and Wallach [20]. Their models retain a complete lower skeleton and study the disappearance of
  cohomology as top-dimensional faces are added. Gromov connected cohomological filling inequalities with
  topological overlap and asked for arbitrarily large complexes with bounded vertex incidence and uniform filling
  bounds [9] Sections 2.3–2.5 and 2.14. The full coboundary expansion problem also demands vanishing cohomology;
  a recent formulation is [5] Problem 1.3.

There are two different degree conditions in this history.
  Lubotzky and Meshulam constructed random Latin-square coboundary expanders in dimension two [18]; Lubotzky,
  Luria, and Rosenthal constructed random Steiner-system coboundary expanders in every dimension [17].
  These results bound the number of top-dimensional faces through a codimension-one face.
  The Latin-square complexes have a complete tripartite $1$-skeleton,
  and the Steiner-system complexes have a complete $\( d - 1 \)$-skeleton.
  In dimensions at least two, vertex degrees grow with the size. The degree bound in 1 is at vertices.

For bounded vertex degree, Kaufman, Kazhdan, and Lubotzky established cosystolic and topological expansion for
  two-dimensional skeleta of Ramanujan complexes [11]. Evra and Kaufman obtained bounded-degree cosystolic
  expanders in every dimension through a local-to-global theorem [7].
  The associated expansion methods include the building-like complexes of Lubotzky, Meshulam, and Mozes [19],
  the strongly symmetric complexes of Kaufman and Oppenheim [13],
  the coefficient-independent methods of Kaufman and Mass [12],
  and the quantitative local-to-global results of Dikstein and Dinur [6].
  We use only the distance-to-cocycles part of cosystolic expansion, stated precisely in (5.1).

Chapman and Lubotzky proved the existence of bounded-degree two-dimensional coboundary expanders over $bb(F)_2$
  [5] Theorem 1.9. In higher ambient dimensions, Kaufman, Oppenheim, and Weinberger [15],
  and Oppenheim and Valentiner-Branth [24], proved degree-one coboundary expansion for coset complexes with
  suitable non-Abelian coefficients. Those degree-one results and the cosystolic constructions above do not give
  the vanishing in every degree required by 1. Together with the two-dimensional result and the graph case,
  our theorem gives bounded-degree $bb(F)_2$ coboundary expanders in every positive dimension.

Our complexes belong to an established algebraic construction program.
  Kaufman and Oppenheim developed locally spectral expanding coset geometries [14];
  O’Donnell and Pratt used Chevalley groups [22]; and Grave de Peralta and Valentiner-Branth developed
  Kac–Moody–Steinberg group constructions [8]. Oppenheim and Valentiner-Branth proved the cosystolic expansion
  theorem for these KMS complexes that supplies our quantitative input [23].
  Their affine-type-$A$ polynomial matrix construction [23] Example 4.13 already uses the simple root groups
  appearing here, with quotients by irreducible polynomials.
  Powers of $t$ also occur, with different local groups, in the degree-one construction of [15] Section 2.5 and
  Theorem 6.3. For the local groups used here, we pass to the tower of quotients modulo $t^m$ and prove the
  cohomology vanishing needed to obtain coboundary expansion in all degrees below $d$.

===== 1.2 Proof strategy. <proof-strategy.>

Fix $d$ and put $n = 2 d$ and $N = 2 d + 1$. Over a sufficiently large fixed odd prime field $k$, let $U lt.eq
  "SL"_N \( k \[ t \] \)$ be the inverse image of the upper unitriangular group under evaluation at zero.
  We construct an infinite $n$-dimensional coset complex $L$ for $U$ and its finite congruence quotients $T_m$.
  The desired $X_m$ is the $d$-skeleton of $T_m$. The local groups are fixed finite groups,
  which gives uniform degree bounds; the congruence quotients grow with $m$.

The first step is geometric. We identify $L$ with the subcomplex opposite a chamber in an affine twin building.
  A filtration by codistance expresses the relative chain groups of each attachment in terms of a spherical
  opposition complex. The opposition-complex input of [23] makes these attachments acyclic in the required range.
  Since the whole affine building is contractible, $L$ has vanishing reduced homology below degree $n - 1$.
  Its simplex stabilizers have odd order, so its chain complex gives a partial projective resolution over
  $bb(F)_2 \[ U \]$. The orbit complex $U without L$ is a single simplex,
  which yields the corresponding homology vanishing for $U$.

The second step passes from $U$ to each congruence subgroup.
  Morrow’s pro Tor-unitality theorem [21] and Iwasa’s homology pro-stability theorem [10] apply to the ideals $t^m
  k \[ t \]$. Their initial conclusion concerns an inverse system, whereas we need a statement at every level.
  Odd-index transfer makes the homology maps towards shallower levels surjective over $bb(F)_2$.
  The cokernels of stabilization are therefore both pro-zero and connected by surjective transition maps,
  so each cokernel vanishes. Two stabilization steps then show that ambient conjugation acts trivially in degrees
  $1 \, dots.h \, d - 1$. Averaging over the finite odd-order quotient transfers the vanishing from $U$ to the
  congruence subgroup, and hence to $T_m$.

Finally, the KMS theorem gives a uniform inequality against cocycles on the $\( n - 1 \)$-skeleton of $T_m$.
  Its weighted norms agree with the corresponding norms on $T_m$ because every panel lies in the same number of
  chambers. Passing to the $d$-skeleton requires a further comparison:
  the number of chambers through a $d$-face is bounded above and below,
  and the normalization contributes the same factor in two successive cochain degrees.
  This factor cancels in the expansion inequality. The cohomology vanishing replaces cocycles by coboundaries and
  completes the proof.

===== 1.3 Organization. <organization.>

Section 2 defines the congruence complexes. Section 3 proves the local group identities and the acyclicity of $L$.
  Section 4 proves the cohomology vanishing of the finite quotients.
  Section 5 checks the KMS hypotheses, compares skeleton weights, and proves 1.

== 2 The congruence complexes <sec:construction>

We now define the complexes appearing in 1. Fix

$ n = 2 d \, wide N = n + 1 = 2 d + 1 \, $

and choose a sufficiently large odd prime $q$, depending only on $N$.
  The precise largeness requirements will be stated where they are used. Set $k = bb(F)_q$, $R = k \[ t \]$, and

$ Gamma_a \( m \) = ker #scale(x: 120%, y: 120%)[\(] "SL"_a \( R \) arrow.r
  "SL"_a \( R \/ \( t^m \) \) #scale(x: 120%, y: 120%)[\)] . $

Let $U lt.eq "SL"_N \( R \)$ be the inverse image, under evaluation at $t = 0$,
  of the upper unitriangular subgroup of $"SL"_N \( k \)$. Put

$ S = { 0 \, 1 \, dots.h \, N - 1 } \, wide x_i = e_(i \, i + 1) \( 1 \) med \( 1 lt.eq i < N \) \, wide x_0 =
  e_(N \, 1) \( t \) \, $

where $e_(a b) \( f \) = I + f E_(a b)$, and define

#[#set math.equation(numbering: n => "(2.1)")
 $ H_i = chevron.l x_j : j in S \\ { i } chevron.r . $ <eq:Hi>]

For a group $G$ and subgroups $\( K_i \)_(i in S)$, the #emph[coset complex] $"CC" \( G \; \( K_i \) \)$ has
  vertices the tagged left cosets $g K_i$; a collection of vertices is a face when the corresponding cosets have
  nonempty common intersection. Its chambers are the sets ${ g K_i : i in S }$,
  so it is pure of dimension $\| S \| - 1$. For $m gt.eq 2$, set

#[#set math.equation(numbering: n => "(2.2)")
 $ G_m = U \/ Gamma_N \( m \) \, wide T_m = "CC" \( G_m \; \( overline(H)_i \)_(i in S) \) \, wide X_m =
   "skel"_d T_m . $ <eq:construction>]

The bar denotes reduction modulo $t^m$. Here $Gamma_N \( m \) subset.eq U$,
  and $G_m$ is the finite image of $U$ in $"SL"_N \( R \/ \( t^m \) \)$.

== 3 The infinite coset complex <sec:geometry>

Put $L = "CC" \( U \; \( H_i \)_(i in S) \)$. We will prove

#[#set math.equation(numbering: n => "(3.1)")
 $ tilde(H)_j \( L \; bb(F)_2 \) = 0 wide \( 0 lt.eq j < n - 1 \) . $ <eq:L-acyclic>]

This is the acyclicity needed to compare group homology with the homology of the finite complexes.
  We first identify the finite stabilizers, then realize $L$ inside an affine building and compute the relative
  chains of a filtration. Connectedness will also show that the $x_i$ generate $U$.

=== 3.1 The finite local groups <the-finite-local-groups>

Regard $S$ as the edges of the directed cycle $1 arrow.r 2 arrow.r dots.h.c arrow.r N arrow.r 1$,
  with edge $0$ equal to $N arrow.r 1$. For $J subset.neq S$, put $U_J = chevron.l x_j :
  j in J chevron.r$ and $U_diameter = { 1 }$. Between distinct indices $a \,
  b$ there is a unique simple directed path in the cycle. Set

$ V_(a b) \( J \) =
  cases(delim: "{", k \, & upright("if that path lies in ") J upright(" and avoids edge ") 0 \,, k t \, &
  upright("if that path lies in ") J upright(" and uses edge ") 0 \,, 0 \, & upright("otherwise") .) $

#thm([Lemma 1.])[
  #emph[For every proper $J subset.neq S$,
#[#set math.equation(numbering: n => "(3.2)")
 $ U_J = { g : g_(a a) = 1 \, med g_(a b) in V_(a b) \( J \) upright(" for ") a eq.not b } . $ <eq:pattern>]

 These are finite groups, and
#[#set math.equation(numbering: n => "(3.3)")
 $ U_J ∩ U_K = U_(J ∩ K) \, wide ⋂_(i in A) H_i = U_(S \\ A) quad \( diameter eq.not A subset.eq S \) .
   $ <eq:intersections>]

 For $m gt.eq 2$, reduction modulo $t^m$ is injective on all $U_J$ and preserves all these intersections. In particular,
#[#set math.equation(numbering: n => "(3.4)")
 $ \| H_i \| = M := q^(binom(N, 2)) quad \( i in S \) \, wide \| U_({ i }) \| = q . $ <eq:M>]

]
] <lem:patterns>

#proof[
  Deleting an edge outside $J$ cuts the cycle into a linear order.
    In this order the right side of (3.2) is a product of unitriangular groups,
    one for each path component of $J$. Factors of $t$ correspond to conjugation by a diagonal matrix over
    $k \[ t \, t^(- 1) \]$. In particular the displayed matrices form a group.
  Because $q$ is prime, powers of $x_j$ provide every coefficient in its simple root group. Iterated commutators
  $ \[ e_(a b) \( f \) \, e_(b c) \( g \) \] = e_(a c) \( f g \) wide \( a \, b \, c upright(" distinct") \) $
  provide every allowed path entry. Unitriangular elimination in the cut order then gives every matrix on the
    right of (3.2). This proves the equality. The path descriptions also show the intersection identities.
    Finally, every entry has degree at most one; reduction modulo $t^m$, for $m gt.eq 2$,
    neither identifies distinct such entries nor changes their allowed subspaces.
    The same intersection identities therefore hold after reduction. ◻
]

=== 3.2 The twin-building model <the-twin-building-model>

The matrix calculation identifies the stabilizers we need.
  To obtain acyclicity, we now place the coset complex in the classical affine twin building of
  $"SL"_N \( k \[ t \, t^(- 1) \] \)$. We use the lattice construction of Abramenko–Van Maldeghem [3] Section 4,
  Proposition 4.4 and Remark 4.6; see also [1] Lemma 5 and [2].
  Its two halves are the affine buildings at $0$ and at infinity, both of type $tilde(A)_n$ and dimension $n$.
  Their chambers have one vertex of each type in $S$. The stabilizers of opposite base chambers are

$ B_(+) = { g in "SL"_N \( k \[ t \] \) : g \( 0 \) upright(" is upper triangular") } \, $

and the analogous group $B_(-)$ over $k \[ t^(- 1) \]$ with lower triangular reduction at infinity.
  They satisfy $B_(+) = U times.r T$ and $B_(+) ∩ B_(-) = T$, where $T$ is the constant diagonal torus.

Fix the positive base chamber $c_(+)$. A chamber $c$ in the negative building has a #emph[codistance]
  $delta^(*) \( c \) = delta^(*) \( c_(+) \, c \) in W$, where $\( W \, S \)$ is the affine Coxeter system.
  For two chambers in the same half, their Weyl distance is the element of $W$ represented by the types of a
  minimal gallery between them. Write $ell$ for word length with respect to $S$, and $W_J =
  chevron.l J chevron.r$ for $J subset.eq S$. The chambers of codistance $1$ are exactly the $B_(+)$-orbit of the
  negative base chamber. We use the convention that an $s$-panel varies the vertex of type $s$.
  If $delta^(*) \( c \) = w$, the codistances in this panel belong to ${ w \, w s }$; the value $w s$ is attained,
  and, when $ell \( w s \) < ell \( w \)$, every chamber in the panel other than $c$ has codistance $w s$.
  These are the twin-building axioms with the positive argument fixed [3] Definition 1.1.
  Every proper $J subset.neq S$ is spherical: a $J$-residue, obtained by varying only types in $J$,
  is a finite spherical building whose irreducible factors have type $A$ over $k$.
  In the lattice model, fixing the other types fixes a partial lattice chain;
  completing that chain amounts to choosing flags in its successive finite-dimensional $k$-vector-space quotients.
  This gives the asserted type-$A$ factors.

Let $L'$ be the subcomplex consisting of all codistance-$1$ chambers and their faces.
  The preceding description shows that $U$ acts simply transitively on its chambers.
  We check their vertex stabilizers. In the standard lattice model at infinity,
  vertices are homothety classes of $k \[ \[ t^(- 1) \] \]$-lattices.
  Choose the negative base chamber with vertices represented by exponent vectors

$ \( 0 \, dots.h \, 0 \) quad upright("(type ") 0 upright(")") \,
  wide \( underbrace(0 \, dots.h \, 0, i) \, underbrace(1 \, dots.h \, 1, N - i) \) quad
  upright("(type ") i upright(")") . $

For a vertex represented by exponents $\( b_a \)$, a polynomial matrix in its stabilizer satisfies

#[#set math.equation(numbering: n => "(3.5)")
 $ deg g_(a b) lt.eq b_a - b_b . $ <eq:lattice-bounds>]

This is the condition for preserving the lattice generated by $t^(b_a) e_a$ over $k \[ \[ t^(- 1) \] \]$;
  because the determinant is $1$, preservation of its homothety class implies preservation of the lattice itself.
  Intersecting these bounds with $U$ gives upper unitriangular constant matrices at the type-$0$ vertex.
  At type $i eq.not 0$ they give two upper unitriangular constant diagonal blocks, cut after coordinate $i$,
  a zero upper-right block, and arbitrary entries in $k t$ in the lower-left block.
  By 1, these stabilizers are exactly $H_0 \, H_i$, respectively. Sending $u H_i$ to the corresponding vertex identifies

#[#set math.equation(numbering: n => "(3.6)")
 $ L = "CC" \( U \; \( H_i \) \) tilde.equiv L' . $ <eq:L-opposite>]

This uses the common-representative definition of faces: a face of $L'$ lies in one of its chambers,
  and every such chamber is a unique translate of the base chamber.

=== 3.3 A filtration by codistance <a-filtration-by-codistance>

We have identified $L$ with an opposition subcomplex. The next step is to compare it with the whole negative
  building by adding chambers in codistance order. The homology of each attachment is controlled by spherical
  opposition complexes, for which we use the following input.
  In a spherical building of type $A_r$ over $k$, let $O$ be the subcomplex formed by chambers opposite a fixed
  chamber and their faces. For $q gt.eq 2^(r - 1)$,

#[#set math.equation(numbering: n => "(3.7)")
 $ tilde(H)_j \( O \; bb(F)_2 \) = 0 wide \( j < r - 1 \) . $ <eq:spherical-opposition>]

This follows from the integral cone function in [23] Corollary 6.10,
  whose chain contraction identity remains valid after reduction modulo two.
  For $r = 1$, the required assertion is just nonemptiness of the opposition complex.
  For a product of spherical buildings, the opposition complex is the simplicial join of the opposition complexes
  of the factors, and the augmented chain formula for joins gives the same vanishing below its dimension.
  We henceforth require $q gt.eq 2^(n - 1)$, which covers every proper residue of our affine building.

#thm([Proposition 1.])[
  #emph[The complex $L$ satisfies (3.1).]
] <prop:L-acyclic>

#proof[
  Starting with $L$, add all chambers of the negative building in increasing order of the length of their
    codistance. Order the finitely many codistance values of each length arbitrarily. Fix a value $w eq.not 1$, and put
  $ D = { s in S : ell \( w s \) < ell \( w \) } \, wide J = S \\ D . $
  The descent set $D$ is nonempty, so $J$ is proper and $W_J$ is finite.
    The element $w$ is the minimal representative of $w W_J$; in particular $ell \( w v \) = ell \( w \) +
    ell \( v \)$ for $v in W_J$.
  Group the chambers of codistance $w$ by their $J$-residues.
    Such a residue is specified by the common face $F$ whose vertex types are $D$.
    Its varying part is a spherical building of type $J$. We claim that the codistance-$w$ chambers in this
    residue are precisely the chambers opposite a single chamber $c_max$ there.
    Indeed, follow a reduced expression for the longest element $w_J$ from any chamber of codistance $w$,
    choosing at each step the codistance increase permitted by the panel axiom.
    This reaches $c_max$ of codistance $w w_J$. From $c_max$,
    any minimal gallery within the residue has types forming a reduced word in $W_J$.
    Every step decreases codistance length, since
  $ ell \( w w_J v \) = ell \( w \) + ell \( w_J \) - ell \( v \) wide \( v in W_J \) . $
  The descent panel axiom thus forces the endpoint at Weyl distance $v$ from $c_max$ to have codistance $w w_J v$.
    It has codistance $w$ exactly when $v = w_J$, which proves the claim.
    It also proves that no chamber in this residue has smaller codistance length or a different codistance of the
    same length. The same formula proves uniqueness of $c_max$:
    a chamber of codistance $w w_J$ has Weyl distance $1$ from it.
  Let $O$ denote this opposition complex. The chambers in the residue now being added, together with their faces,
    form $F * O$. Its intersection with the previously added subcomplex is exactly $partial F * O$.
    For one inclusion, a face missing a vertex of type $s in D$ lies in the corresponding panel of a
    codistance-$w$ chamber, and hence in a chamber of codistance $w s$, which was added earlier.
    Conversely, a face containing all of $F$ can lie only in chambers of the same $J$-residue,
    so the preceding paragraph shows that it was not present earlier.
    Distinct blocks for this $w$ meet only in their attaching loci,
    since a face outside such a locus determines its face of types $D$.
  The relative chain complex of a block is particularly simple:
  #[#set math.equation(numbering: n => "(3.8)")
   $ C_k \( F * O \, partial F * O \; bb(F)_2 \) tilde.equiv tilde(C)_(k - \| D \|) \( O \; bb(F)_2 \) \, wide
     H_k \( F * O \, partial F * O \; bb(F)_2 \) tilde.equiv tilde(H)_(k - \| D \|) \( O \; bb(F)_2 \) .
     $ <eq:relative-chains>]
  Only faces containing all vertices of $F$ survive in relative chains; deleting one of those vertices gives zero,
    leaving the augmented boundary in $O$, as illustrated in Figure 1.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.8), [#box(width: 6.723cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[A face $tau$ of the block $F*O$#linebreak()$F$ has $|D|$ vertices; $dim O=|J|-1$]]])])
  content((-3.3, 1), [#box(width: 5.423cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2f2"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$tau$ omits a vertex of $F$#linebreak()$tau in partial F*O$: already present]]])])
  content((3.3, 1), [#box(width: 5.423cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$tau =F union sigma$, with $sigma in O$#linebreak()Survives in relative chains; $sigma = nothing$ is allowed]]])])
  line((-3.362, 2.244), (-3.3, 1.547), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.362, 2.244), (3.3, 1.547), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((-3.3, -1.1), [#box(width: 5.423cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2f2"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[A vertex of $F$ is deleted#linebreak()The resulting face is zero in relative chains]]])])
  content((3.3, -1.1), [#box(width: 5.423cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[A vertex $v$ of $sigma$ is deleted#linebreak()The resulting face is $F union ( sigma without \{v\})$]]])])
  line((0.5883, 0.4533), (-0.5883, -0.5533), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.3, 0.4533), (3.3, -0.5444), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((0, -2.35), [#text(size: 9pt)[$C_k(F*O, partial F*O; bb(F)_2) tilde.equiv tilde(C)_(k-|D|)(O; bb(F)_2)$]])
})],
    caption: [Figure 1: One block of the codistance filtration, shown as a schematic of its faces and boundary operations. The new relative faces contain every vertex of $F$. Deleting an $F$-vertex lands in the old subcomplex; the remaining boundary is the augmented boundary of $O$, shifted by $\| D \|$. The complex $O$ is not assumed to be contractible. ],
  ) <fig:codistance-attachment>
  Since $dim O = \| J \| - 1$, (3.7) shows that these relative groups vanish for
  $ k < \| D \| + \| J \| - 1 = \| S \| - 1 = n . $
  If $J = diameter$, interpret $O$ as the complex consisting of the empty face;
    the pair is $\( F \, partial F \)$ and the same conclusion holds.
  Relative chains for the whole step are the direct sum of the block relative chains.
    The long exact sequence of the pair therefore shows that every step induces an isomorphism in reduced homology
    in degrees $j < n - 1$. The filtration exhausts the negative affine building,
    which is contractible [4] Theorem II.10A.4 and Remark II.10A.6,
    and simplicial homology commutes with this increasing union.
    Thus $tilde(H)_j \( L \; bb(F)_2 \) = 0$ in precisely the asserted range. ◻
]

#thm([Corollary 1.])[
  #emph[The simple generators $x_i$, $i in S$, generate $U$.]
] <cor:generation>

#proof[
  By 1, $L$ is connected. In a connected pure complex, any two chambers can be joined by a sequence of chambers in
    which successive chambers share a vertex. If the chambers labeled $u \, v in U$ share a vertex of type $i$,
    then $u H_i = v H_i$, so $u^(- 1) v in H_i$. The chamber action is simply transitive,
    so following such a sequence from the base chamber shows that $U = chevron.l H_i : i in S chevron.r$.
    Each $H_i$ is generated by a subset of the $x_j$. ◻
]

== 4 Homology and the finite quotients <sec:homology>

We now prove that the finite complexes $T_m$ have no cohomology in degrees $1 \, dots.h \, d - 1$.
  We write $H_j \( G \; A \)$ for group homology with trivial coefficients in $A$.
  The acyclic complex $L$ first compares the homology of $U$ and its congruence subgroups with simplicial
  homology. We then use stabilization to show that the congruence subgroups inherit the vanishing of
  $H_j \( U \; bb(F)_2 \)$.

=== 4.1 An acyclic complex as a partial resolution <subsec:projective-resolution>

Finite odd-order stabilizers make the simplicial chains projective over the group algebra.
  This allows the acyclicity already proved for $L$ to replace a full contractible model in the degrees we need.

#thm([Lemma 2.])[
  #emph[Let $h gt.eq 0$ be an integer, and let a group $K$ act on a nonempty simplicial complex $Z$ without
    inversions. Suppose every nonempty simplex stabilizer is finite of odd order.
    If $tilde(H)_j \( Z \; bb(F)_2 \) = 0$ for $0 lt.eq j lt.eq h$, then
$ H_j \( K \; bb(F)_2 \) tilde.equiv H_j \( C_(*) \( Z \; bb(F)_2 \)_K \) wide \( 0 lt.eq j lt.eq h \) . $

 Here the subscript denotes coinvariants; this is the chain complex of simplex orbits,
   with boundary induced by deleting vertices.]
] <lem:projective-chains>

#proof[
  For every $r gt.eq 0$, the permutation module $C_r \( Z \; bb(F)_2 \)$ is a direct sum of modules
    $bb(F)_2 \[ K \/ H \]$, where $H$ runs over simplex stabilizers.
    Because $\| H \|$ is odd, averaging over $H$ splits the augmentation $bb(F)_2 \[ H \] arrow.r bb(F)_2$.
    Thus $bb(F)_2$ is a projective $bb(F)_2 \[ H \]$-module, and induction makes $bb(F)_2 \[ K \/ H \]$ a
    projective $bb(F)_2 \[ K \]$-module. The augmented chains of $Z$ are exact through degree $h$.
    Retain the chain modules through degree $h + 1$, choose a projective module mapping onto the kernel of the
    boundary out of $C_(h + 1) \( Z \; bb(F)_2 \)$, and continue in higher degrees.
    This gives a projective resolution of the trivial module $bb(F)_2$ with the same terms and differentials in
    all degrees needed to compute $H_j$, $j lt.eq h$. Taking coinvariants proves the assertion. ◻
]

#thm([Proposition 2.])[
  #emph[For $0 < j < n - 1$ and $m gt.eq 2$,
#[#set math.equation(numbering: n => "(4.1)")
 $ H_j \( U \; bb(F)_2 \) = 0 \, wide H_j \( T_m \; bb(F)_2 \) tilde.equiv H_j \( Gamma_N \( m \) \; bb(F)_2 \) .
   $ <eq:homology-comparisons>]

 Moreover, $T_m$ is connected.]
] <prop:homology-comparisons>

#proof[
  For a nonempty type set $A subset.eq S$, the simplices of $L$ of type $A$ are the cosets of $⋂_(i in A) H_i =
    U_(S \\ A)$. Thus $U$ is transitive on the faces of each type,
    and the orbit complex $U without L$ is a single $n$-simplex.
    Its stabilizers are conjugates of the finite unitriangular groups in 1, so they have odd order.
    Apply 2 and 1 to obtain the first assertion of (4.1). In the coinvariant boundary each face is obtained by
    deleting one vertex, with coefficient $1$; there are no stabilizer-index factors.
  Reduction modulo $t^m$ preserves all the stabilizer intersections by 1.
    To check the resulting quotient, let two type-$A$ simplices have representatives $u \,
    v in U$ and the same reduced vertices. Then the reduction of $u^(- 1) v$ belongs to $⋂_(i in A)
    overline(H)_i = overline(U_(S \\ A))$. Choose $h in U_(S \\ A)$ with this reduction.
    The element $v h^(- 1) u^(- 1) in Gamma_N \( m \)$ carries the first simplex to the second.
    Thus reduction identifies precisely the simplex orbits and gives
  #[#set math.equation(numbering: n => "(4.2)")
   $ Gamma_N \( m \) without L tilde.equiv T_m . $ <eq:quotient>]
  The $Gamma_N \( m \)$-stabilizers of nonempty simplices are trivial,
    since the reduction is injective on every local group and $Gamma_N \( m \)$ is normal in $U$.
    The action preserves types. A second application of 2 gives the remaining homology comparison.
    Connectedness follows from 1 and (4.2). ◻
]

=== 4.2 From pro-stability to ordinary surjectivity <subsec:pro-stability>

Our next goal is a surjection on homology at each fixed congruence level.
  The available stability theorem concerns inverse systems;
  odd-index transfer will supply the additional step from that theorem to an ordinary surjection.

We first specify its ring conventions. For a commutative nonunital ring $A$,
  its #emph[integer unitization] is $bb(Z) times.l A = bb(Z) xor A$, with

$ \( u \, a \) \( v \, b \) = \( u v \, u b + v a + a b \) \, wide 1 = \( 1 \, 0 \) . $

The projection to $bb(Z)$ defines

$ "GL"_a \( A \) = ker #scale(x: 120%, y: 120%)[\(] "GL"_a \( bb(Z) times.l A \) arrow.r
  "GL"_a \( bb(Z) \) #scale(x: 120%, y: 120%)[\)] . $

A row $b in \( bb(Z) times.l A \)^ell$ is #emph[$A$-unimodular] if $b equiv
  e_1 med \( mod med A \)$ and there is a row $c equiv e_1 med \( mod med A \)$ with $b dot.op c = 1$.
  Here $e_1 = \( 1 \, 0 \, dots.h \, 0 \)$. We use the relative stable range convention of Vaserstein [25]
  Section 2, pp. 384–385: $"sr" \( A \) lt.eq s$ means that, for every such row of length $ell gt.eq s + 1$,
  there are $v_1 \, dots.h \, v_(ell - 1) in A$ for which

$ \( b_1 + v_1 b_ell \, dots.h \, b_(ell - 1) + v_(ell - 1) b_ell \) $

is $A$-unimodular.

An inverse system $\( A_m \)$ is #emph[pro-zero] if, for every index, some later transition to that index is zero.
  A level map of inverse systems of abelian groups is a #emph[pro-isomorphism] precisely when its kernel and
  cokernel systems are pro-zero. The system $\( A_m \)$ is #emph[Tor-unital] if
  $\( "Tor"_i^(bb(Z) times.l A_m) \( bb(Z) \, bb(Z) \) \)_m$ is pro-zero for every $i > 0$.
  Morrow’s theorem says that the powers of any ideal in a commutative Noetherian ring form a Tor-unital system
  [21] Theorem 0.3, arXiv v2. For a Tor-unital inverse system of commutative nonunital rings,
  Iwasa’s integral homology pro-stability theorem says that, if $r = max { 2 \, sup_m "sr" \( A_m \) } < oo$, then

#[#set math.equation(numbering: n => "(4.3)")
 $ \( H_j \( "GL"_a \( A_m \) \; bb(Z) \) \)_m arrow.r \( H_j \( "GL"_(a + 1) \( A_m \) \; bb(Z) \) \)_m quad
   upright("is a pro-isomorphism for ") a gt.eq 2 j + r - 1 . $ <eq:iwasa>]

We cite the published version [10] Theorem 5.13.

#thm([Lemma 3.])[
  #emph[Let $h gt.eq 0$ be an integer. If $a gt.eq 2 h + 1$,
    the inclusion on the first $a$ coordinates induces surjections
$ H_j \( Gamma_a \( m \) \; bb(F)_2 \) arrow.r H_j \( Gamma_(a + 1) \( m \) \; bb(F)_2 \)
  wide \( 0 lt.eq j lt.eq h \, med m gt.eq 1 \) . $

]
] <lem:stabilization>

#proof[
  Apply (4.3) to $A_m = t^m k \[ t \]$. In this case $"GL"_a \( A_m \)$ is exactly the group of matrices in
    $"GL"_a \( R \)$ congruent to $I$ modulo $t^m$: the entrywise map from the unitization is injective on $A_m$,
    and an inverse congruent to $I$ lifts back to the unitization.
    Such a matrix has determinant in $R^(*) = k^(*)$, congruent to $1$ modulo $t^m$; hence its determinant is $1$.
    Thus $"GL"_a \( A_m \) = Gamma_a \( m \)$.
  The nonunital stable range of every $A_m$ is at most $2$.
    Here is a direct verification of the relative row criterion.
    For a unimodular row $\( b_1 \, dots.h \, b_r \)$ with $r gt.eq
    3$ and $\( b_1 \, dots.h \, b_r \) equiv \( 1 \, 0 \, dots.h \, 0 \) med \( mod med t^m \)$,
    the polynomial $b_1$ is coprime to $t$. At each irreducible divisor of $b_1$ at which $b_r$ is nonzero,
    choose a residue for $v$ avoiding $- b_2 \/ b_r$. The Chinese remainder theorem allows all these choices with
    $v in t^m R$. Then $\( b_1 \, b_2 + v b_r \, b_3 \, dots.h \, b_(r - 1) \)$ is unimodular and still has the
    same residue modulo $t^m$: at a divisor where $b_r$ vanishes,
    original unimodularity already makes one of $b_2 \, dots.h \, b_(r - 1)$ nonzero.
    To check the unitization condition, if a row $b$ has $b dot.op c = 1$ over $R$ and $b equiv
    e_1 med \( mod med t^m \)$, then
  $ c' = e_1 + \( 1 - b_1 \) c quad upright("satisfies") quad b dot.op c' = 1 \, wide c' equiv
    e_1 med \( mod med t^m \) . $
  It therefore lifts to a unimodularity relation over $bb(Z) times.l A_m$:
    the difference between the lifted dot product and $1$ lies in $A_m$, where the map to $R$ is injective.
    This proves the claimed stable-range bound.
  Morrow’s theorem and (4.3) now give pro-isomorphisms in integral homology for $0 lt.eq j lt.eq h$.
    The natural universal coefficient sequences
  $ 0 arrow.r H_j \( G \; bb(Z) \) ⊗ bb(F)_2 arrow.r H_j \( G \; bb(F)_2 \) arrow.r
    "Tor"_1^(bb(Z)) \( H_(j - 1) \( G \; bb(Z) \) \, bb(F)_2 \) arrow.r 0 $
  give pro-isomorphisms with $bb(F)_2$ coefficients in the same range.
    For $j gt.eq 1$, both integral degrees $j$ and $j - 1$ are covered; degree zero is immediate.
    Indeed, the tensor and Tor functors extend to inverse systems and preserve isomorphisms in the pro-category,
    and these levelwise exact sequences are exact there as well.
    In particular, the systems of cokernels of the displayed stabilization maps over $bb(F)_2$ are pro-zero.
  For $m' gt.eq m$, the index $\[ Gamma_a \( m \) : Gamma_a \( m' \) \]$ is finite and odd.
    To see this, reduce modulo $t^(m')$ and filter matrices congruent to $I$ modulo $t^m$ by successive powers of
    $t$; each successive quotient embeds into an additive matrix group over $k$. Transfer therefore gives
  $ H_j \( Gamma_a \( m \) \; bb(F)_2 \) arrow.r^("tr") H_j \( Gamma_a \( m' \) \; bb(F)_2 \) arrow.r^("inc"_(*))
    H_j \( Gamma_a \( m \) \; bb(F)_2 \) \, wide "inc"_(*) "tr" = 1 . $
  Thus all homology transition maps, and consequently all cokernel transition maps, are surjective.
    A pro-zero system with surjective transition maps is zero at every level:
    a sufficiently late transition to any chosen term is both zero and surjective.
    Applying this observation to the cokernels gives the required ordinary surjections. ◻
]

=== 4.3 Trivial conjugation and vanishing cohomology <subsec:conjugation>

Stabilization lets us represent every homology class on any chosen set of $N - 2$ coordinates.
  The two remaining coordinates will make each elementary conjugation act trivially.
  This is the finite-level argument corresponding to the stability-to-conjugation principle in [10] Corollary 5.14.

#thm([Lemma 4.])[
  #emph[For $1 lt.eq j lt.eq d - 1$, conjugation by $"SL"_N \( R \)$ acts trivially on
    $H_j \( Gamma_N \( m \) \; bb(F)_2 \)$, for every $m gt.eq 1$.]
] <lem:trivial-action>

#proof[
  Our choice of $N$ gives $N - 2 = 2 \( d - 1 \) + 1$. By two applications of 3,
    the subgroup $Gamma_(N - 2) \( m \)$ on the first $N - 2$ coordinates surjects onto
    $H_j \( Gamma_N \( m \) \; bb(F)_2 \)$ in the stated degrees.
    Conjugating by permutation matrices gives the same surjectivity on any specified $N - 2$ coordinates,
    since each such matrix normalizes $Gamma_N \( m \)$ and therefore induces an automorphism of its homology.
  Every elementary matrix $e_(a b) \( f \)$ centralizes the congruence subgroup on the coordinates complementary
    to $a \, b$. Its conjugation action therefore fixes the image of a surjection onto
    $H_j \( Gamma_N \( m \) \; bb(F)_2 \)$, so that action is trivial.
    Elementary matrices generate $"SL"_N \( R \)$ because $R$ is Euclidean, proving the lemma. ◻
]

We can now recover all the required congruence-group homology from its coinvariants under $G_m$.
  The odd order of $G_m$ makes taking these coinvariants exact, and the preceding lemma makes their action trivial.

#thm([Proposition 3.])[
  #emph[For every $m gt.eq 2$,
$ H_j \( Gamma_N \( m \) \; bb(F)_2 \) = H_j \( T_m \; bb(F)_2 \) = H^j \( T_m \; bb(F)_2 \) =
  0 wide \( 1 lt.eq j lt.eq d - 1 \) . $

]
] <prop:quotient-homology>

#proof[
  The finite group $G_m = U \/ Gamma_N \( m \)$ has odd order:
    its quotient modulo $t$ is the upper unitriangular group over $k$,
    and the kernel has a filtration whose factors embed into additive matrix groups over $k$.
    Let $P_(*)$ be a projective $bb(F)_2 \[ U \]$-resolution of the trivial module $bb(F)_2$.
    Its restriction to $Gamma_N \( m \)$ is still projective,
    because $bb(F)_2 \[ U \]$ is free over $bb(F)_2 \[ Gamma_N \( m \) \]$.
    Hence $\( P_(*) \)_(Gamma_N \( m \))$ computes $H_(*) \( Gamma_N \( m \) \; bb(F)_2 \)$.
    The quotient $G_m$ acts on this chain complex, and its action on homology is the usual conjugation action.
    Averaging over the odd-order group $G_m$ makes its coinvariant functor exact.
    Since $P_U = \( P_(Gamma_N \( m \)) \)_(G_m)$, taking homology gives
  $ H_j \( U \; bb(F)_2 \) tilde.equiv H_j \( Gamma_N \( m \) \; bb(F)_2 \)_(G_m) . $
  By 4, the right side equals $H_j \( Gamma_N \( m \) \; bb(F)_2 \)$ for $1 lt.eq j lt.eq d - 1$.
    Both homology assertions now follow from 2, since $d - 1 < n - 1$.
    The cohomology assertion follows by duality over $bb(F)_2$. ◻
]

== 5 Coboundary expansion <sec:expansion>

The cohomology calculation has removed the obstruction to coboundary expansion.
  We now obtain a uniform cosystolic inequality from the KMS construction, verify bounded degree and growth,
  and compare the weights on the two skeleta.

=== 5.1 The quantitative input and its hypotheses <the-quantitative-input-and-its-hypotheses>

We recall the Kac–Moody–Steinberg (KMS) construction in the case needed here.
  The affine diagram $tilde(A)_n$ has type set $S$, and each proper subdiagram is a disjoint union of paths of
  type $A$. Its #emph[spherical local groups] are the corresponding unitriangular groups $U_J$, $J subset.neq S$,
  with their standard inclusions. Their #emph[universal completion] is the group obtained by taking the free
  product of these groups and identifying each $U_J$ with its image in $U_K$ whenever $J subset.eq K$.
  This is the KMS group of type $tilde(A)_n$ [23] Definition 4.6.

A finite quotient of the completion defines a #emph[KMS complex] if its map is injective on every spherical local
  group and preserves their pairwise intersections; the complex is formed from the images of the maximal local
  groups by the common-intersection coset construction [23] Definitions 4.8 and 4.11.
  A diagram on $n + 1$ types is #emph[$n$-classical] when every proper subdiagram has irreducible components of
  classical type $A_r$, $B_r$, $C_r$ or $D_r$ [23] Definition 4.2. Thus $tilde(A)_n$ is $n$-classical.

We use the following part of the theorem of Oppenheim–Valentiner-Branth [23] Theorem 1.2.
  For fixed $n gt.eq 3$ and sufficiently large $q$, the $\( n - 1 \)$-skeleta $Y$ of finite $n$-dimensional,
  $n$-classical KMS complexes over $bb(F)_q$ satisfy, for some $eta > 0$ independent of the finite quotient,

#[#set math.equation(numbering: n => "(5.1)")
 $ ∥delta_i f∥_(Y \, i + 1) gt.eq eta thin "dist"_(Y \, i) \( f \, Z^i \( Y \) \) wide \( 0 lt.eq i < n - 1 \) .
   $ <eq:cosystolic>]

The weights are exactly (1.1). We only need this inequality, not the additional lower bound on nontrivial cosystoles.

The polynomial local groups above also appear in [23] Example 4.13,
  where the finite quotients use irreducible polynomials. We verify the recognition conditions for our reductions
  modulo $t^m$ directly. Our matrix model supplies a homomorphism from that completion to $U$,
  and it is onto by 1. The local groups are realized faithfully by 1;
  their intersections are the groups belonging to the intersecting subsets.

The composite map to $G_m$ has both properties by 1. Indeed the equality of intersections already holds in the
  universal completion: a member of two local groups has, in the matrix model, image in $U_(J ∩ K)$,
  and injectivity on either local group identifies it with the corresponding member of that common subgroup.
  Therefore $T_m$ is an $n$-dimensional, $n$-classical KMS complex.
  This also explains why reduction modulo $t^m$ is allowed:
  the definition requires a finite group quotient with the two stated local properties,
  and imposes no field condition on the quotient ring.

Choose $q$ once and for all to satisfy $q gt.eq 5$, $q gt.eq 2^(n - 1)$, and the largeness requirement for (5.1).
  There are arbitrarily large odd primes. Thus

$ Y_m = "skel"_(n - 1) T_m $

satisfies (5.1) with a common constant $eta > 0$. It remains to pass from these $\( n - 1 \)$-skeleta to the
  $d$-skeleta $X_m$ without losing a uniform expansion constant.

=== 5.2 Degree bounds and growth <degree-bounds-and-growth>

Recall $M = q^(binom(N, 2))$ from (3.4). The common stabilizer of all base vertices is $U_diameter = { 1 }$,
  so the chambers of $T_m$ are in bijection with $G_m$. A face of type $A$ lies in exactly $\|
  U_(S \\ A) \|$ chambers. In particular, every vertex lies in exactly $M$ chambers,
  and every panel (a face of dimension $n - 1$) lies in exactly $q$ chambers.
  Each chamber has $N$ vertices, so every vertex of $X_m$ lies in at most

#[#set math.equation(numbering: n => "(5.2)")
 $ D = M binom(N - 1, d) $ <eq:D>]

faces of dimension $d$. The complexes $T_m$ and $X_m$ are pure, and $X_m$ is connected by 2.

The subgroup ${ e_12 \( f \) : f in R }$ lies in $U$ by definition, and its image in $G_m$ has order $q^m$.
  There are $\| G_m \| \/ M$ vertices of each of the $N$ types. Thus

#[#set math.equation(numbering: n => "(5.3)")
 $ \| X_m \( 0 \) \| = frac(N \| G_m \|, M) gt.eq frac(N q^m, M) arrow.r oo . $ <eq:growth>]

=== 5.3 Weights on skeleta <weights-on-skeleta>

The expansion theorem uses the intrinsic weights of $Y_m$, while 1 uses those of $X_m$.
  The following elementary observation keeps track of this change of normalization.
  Let $T$ be a finite pure $n$-complex, put $X = "skel"_s T$, and write $mu_i = w_i^T$ and $nu_i = w_i^X$.
  For $tau in T \( s \)$ let $c \( tau \)$ be its number of containing chambers.
  If $0 < a lt.eq c \( tau \) lt.eq b$ for all $tau in T \( s \)$, then, with

$ Lambda = frac(binom(n + 1, s + 1) \| T \( n \) \|, \| T \( s \) \|) \, $

we have

#[#set math.equation(numbering: n => "(5.4)")
 $ Lambda / b mu_i \( sigma \) lt.eq nu_i \( sigma \) lt.eq Lambda /
   a mu_i \( sigma \) wide \( 0 lt.eq i lt.eq s \) . $ <eq:skeleton-weights>]

For $i = s$, this follows from $nu_s \( tau \) = Lambda mu_s \( tau \) \/ c \( tau \)$.
  For $i < s$, use the averaging identities

$ mu_i \( sigma \) = binom(s + 1, i + 1)^(- 1) sum_(tau in T \( s \)\
sigma subset.eq tau) mu_s \( tau \) \, wide nu_i \( sigma \) = binom(s + 1, i + 1)^(- 1) sum_(tau in T \( s \)\
sigma subset.eq tau) nu_s \( tau \) . $

The first is a double count of chamber–face incidences, and the second is the definition of skeleton weights.
  Summing the bounds in degree $s$ proves (5.4). The same inequalities hold for norms and distances to any common
  subspace.

Apply this first with $T = T_m$ and $s = n - 1$. Every panel lies in $q$ chambers, so $a = b = Lambda =
  q$ and the weights of $Y_m$ are exactly the weights of $T_m$ in their common degrees. Next take $s = d$.
  Every $d$-face lies in between $1$ and $M$ chambers, so (5.4) gives

#[#set math.equation(numbering: n => "(5.5)")
 $ Lambda_m / M ∥f∥_(Y_m \, i) lt.eq ∥f∥_(X_m \, i) lt.eq Lambda_m ∥f∥_(Y_m \, i) wide \( 0 lt.eq i lt.eq d \) .
   $ <eq:norm-comparison>]

Here $Lambda_m = binom(N, d + 1) \| T_m \( n \) \| \/ \| T_m \( d \) \|$ is common to all degrees and cancels in
  the expansion inequality below.

#proof[
  Take the complexes in (2.2). We have proved finiteness, purity, connectedness, the degree bound (5.2),
    and the growth (5.3). For $i < d$, the cochain spaces and coboundary maps needed to compute $Z^i$ and $B^i$
    are identical for $X_m$, $Y_m$, and $T_m$. By 3, and by connectedness when $i = 0$,
  $ Z^i \( Y_m \) = B^i \( Y_m \) = B^i \( X_m \) wide \( 0 lt.eq i < d \) . $
  Combining (5.1) and (5.5) gives
  $ ∥delta_i f∥_(X_m \, i + 1) & gt.eq Lambda_m / M ∥delta_i f∥_(Y_m \, i + 1)\
 & gt.eq frac(Lambda_m eta, M) "dist"_(Y_m \, i) \( f \, Z^i \( Y_m \) \)\
 & gt.eq eta / M "dist"_(X_m \, i) \( f \, B^i \( X_m \) \) . $
  Thus (1.2) holds with $epsilon = eta \/ M > 0$, independent of $m$ and $i$.
    Reindexing $m = 2 \, 3 \, dots.h$ gives the required sequence. ◻
]

#heading(level: 1)[References]
#bibitem([1])[P.~Abramenko, Group actions on twin buildings,
  #emph[Bulletin of the Belgian Mathematical Society -- Simon Stevin] #strong[3] (1996), no.~4, 391--406.
  #link("https://eudml.org/doc/119921")[EuDML:119921].]
#bibitem([2])[P.~Abramenko and K.~S.~Brown, #emph[Buildings:
  Theory and Applications], Graduate Texts in Mathematics #strong[248], Springer, 2008.
  #link("https://doi.org/10.1007/978-0-387-78835-7")[doi:10.1007/978-0-387-78835-7].]
#bibitem([3])[P.~Abramenko and H.~Van Maldeghem, 1-twinnings of buildings,
  #emph[Mathematische Zeitschrift] #strong[238] (2001), no.~1, 187--203.
  #link("https://doi.org/10.1007/PL00004899")[doi:10.1007/PL00004899].]
#bibitem([4])[M.~R.~Bridson and A.~Haefliger, #emph[Metric Spaces of Non-Positive Curvature],
  Grundlehren der mathematischen Wissenschaften #strong[319], Springer, 1999.
  #link("https://doi.org/10.1007/978-3-662-12494-9")[doi:10.1007/978-3-662-12494-9].]
#bibitem([5])[M.~Chapman and A.~Lubotzky, Stability of homomorphisms, coverings and cocycles II:
  Examples, applications and open problems, #emph[Advances in Mathematics] #strong[463] (2025), article 110117.
  #link("https://doi.org/10.1016/j.aim.2025.110117")[doi:10.1016/j.aim.2025.110117].]
#bibitem([6])[Y.~Dikstein and I.~Dinur, Coboundary and cosystolic expansion without dependence on dimension or
  degree, in #emph[APPROX/RANDOM 2024], LIPIcs #strong[317], 62:1--62:24.
  #link("https://doi.org/10.4230/LIPIcs.APPROX/RANDOM.2024.62")[doi:10.4230/LIPIcs.APPROX/RANDOM.2024.62].]
#bibitem([7])[S.~Evra and T.~Kaufman, Bounded degree cosystolic expanders of every dimension,
  #emph[Journal of the American Mathematical Society] #strong[37] (2024), no.~1, 39--68.
  #link("https://doi.org/10.1090/jams/1019")[doi:10.1090/jams/1019].]
#bibitem([8])[L.~Grave de Peralta and I.~Valentiner-Branth,
  High-dimensional expanders from Kac--Moody--Steinberg groups,
  #emph[European Journal of Combinatorics] #strong[126] (2025), article 104131.
  #link("https://doi.org/10.1016/j.ejc.2025.104131")[doi:10.1016/j.ejc.2025.104131].]
#bibitem([9])[M.~Gromov, Singularities, expanders and topology of maps. Part 2:
  From combinatorics to topology via algebraic isoperimetry,
  #emph[Geometric and Functional Analysis] #strong[20] (2010), no.~2, 416--526.
  #link("https://doi.org/10.1007/s00039-010-0073-8")[doi:10.1007/s00039-010-0073-8].]
#bibitem([10])[R.~Iwasa, Homology pro stability for Tor-unital pro rings, #emph[Homology,
  Homotopy and Applications] #strong[22] (2020), no.~1, 343--374.
  #link("https://doi.org/10.4310/HHA.2020.v22.n1.a20")[doi:10.4310/HHA.2020.v22.n1.a20].]
#bibitem([11])[T.~Kaufman, D.~Kazhdan, and A.~Lubotzky, Isoperimetric inequalities for Ramanujan complexes and
  topological expanders, #emph[Geometric and Functional Analysis] #strong[26] (2016), no.~1, 250--287.
  #link("https://doi.org/10.1007/s00039-016-0362-y")[doi:10.1007/s00039-016-0362-y].]
#bibitem([12])[T.~Kaufman and D.~Mass, Unique-neighbor-like expansion and group-independent cosystolic expansion,
  in #emph[ISAAC 2021], LIPIcs #strong[212], 56:1--56:17.
  #link("https://doi.org/10.4230/LIPIcs.ISAAC.2021.56")[doi:10.4230/LIPIcs.ISAAC.2021.56].]
#bibitem([13])[T.~Kaufman and I.~Oppenheim, Coboundary and cosystolic expansion from strong symmetry,
  in #emph[ICALP 2021], LIPIcs #strong[198], 84:1--84:16.
  #link("https://doi.org/10.4230/LIPIcs.ICALP.2021.84")[doi:10.4230/LIPIcs.ICALP.2021.84].]
#bibitem([14])[T.~Kaufman and I.~Oppenheim, High dimensional expanders and coset geometries,
  #emph[European Journal of Combinatorics] #strong[111] (2023), article 103696.
  #link("https://doi.org/10.1016/j.ejc.2023.103696")[doi:10.1016/j.ejc.2023.103696].]
#bibitem([15])[T.~Kaufman, I.~Oppenheim, and S.~Weinberger, #emph[Coboundary expansion of coset complexes], 2024;
  conference version in #emph[STOC 2025]. #link("https://arxiv.org/abs/2411.02819v1")[arXiv:2411.02819v1].]
#bibitem([16])[N.~Linial and R.~Meshulam, Homological connectivity of random 2-complexes,
  #emph[Combinatorica] #strong[26] (2006), no.~4, 475--487.
  #link("https://doi.org/10.1007/s00493-006-0027-9")[doi:10.1007/s00493-006-0027-9].]
#bibitem([17])[A.~Lubotzky, Z.~Luria, and R.~Rosenthal, Random Steiner systems and bounded degree coboundary
  expanders of every dimension, #emph[Discrete & Computational Geometry] #strong[62] (2019), no.~4, 813--831.
  #link("https://doi.org/10.1007/s00454-018-9991-2")[doi:10.1007/s00454-018-9991-2].]
#bibitem([18])[A.~Lubotzky and R.~Meshulam, Random Latin squares and 2-dimensional expanders,
  #emph[Advances in Mathematics] #strong[272] (2015), 743--760.
  #link("https://doi.org/10.1016/j.aim.2014.12.015")[doi:10.1016/j.aim.2014.12.015].]
#bibitem([19])[A.~Lubotzky, R.~Meshulam, and S.~Mozes, Expansion of building-like complexes, #emph[Groups,
  Geometry, and Dynamics] #strong[10] (2016), no.~1, 155--175.
  #link("https://doi.org/10.4171/GGD/346")[doi:10.4171/GGD/346].]
#bibitem([20])[R.~Meshulam and N.~Wallach, Homological connectivity of random $k$-dimensional complexes,
  #emph[Random Structures & Algorithms] #strong[34] (2009), no.~3, 408--417.
  #link("https://doi.org/10.1002/rsa.20238")[doi:10.1002/rsa.20238].]
#bibitem([21])[M.~Morrow, Pro unitality and pro excision in algebraic $K$-theory and cyclic homology,
  #emph[Journal für die reine und angewandte Mathematik] #strong[736] (2018), 95--139.
  #link("https://arxiv.org/abs/1404.4179v2")[arXiv:1404.4179v2].]
#bibitem([22])[R.~O'Donnell and K.~Pratt, High-dimensional expanders from Chevalley groups, in #emph[CCC 2022],
  LIPIcs #strong[234], 18:1--18:26.
  #link("https://doi.org/10.4230/LIPIcs.CCC.2022.18")[doi:10.4230/LIPIcs.CCC.2022.18].]
#bibitem([23])[I.~Oppenheim and I.~Valentiner-Branth, #emph[New cosystolic high-dimensional expanders from KMS
  groups], 2025, revised September 9, 2026; to appear in #emph[Mathematische Annalen].
  #link("https://arxiv.org/abs/2504.05823v2")[arXiv:2504.05823v2].]
#bibitem([24])[I.~Oppenheim and I.~Valentiner-Branth, #emph[Non-Abelian expansion of congruence KMS
  complexes], 2025. #link("https://arxiv.org/abs/2510.18351v1")[arXiv:2510.18351v1].]
#bibitem([25])[L.~N.~Vaserstein, On the stabilization of the general linear group over a ring,
  #emph[Mathematics of the USSR-Sbornik] #strong[8] (1969), no.~3, 383--400.
  #link("https://doi.org/10.1070/SM1969v008n03ABEH001279")[doi:10.1070/SM1969v008n03ABEH001279].]
