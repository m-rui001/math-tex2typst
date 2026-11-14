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

#align(center)[#text(size: 16pt, weight: "bold")[Combinatorial invariance of \
Kazhdan--Lusztig polynomials]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The defining recursion for Kazhdan–Lusztig polynomials uses the simple generators of a Coxeter system,
  while geometric and categorical constructions use root labels.
  An abstract Bruhat interval poset retains neither kind of data.

For a Coxeter system $\( W \, S \)$, write $ell$ for its length function and $lt.eq$ for Bruhat order.
  For $u lt.eq b$, the interval

$ \[ u \, b \] = { x in W : u lt.eq x lt.eq b } $

is a finite graded poset of rank $ell \( b \) - ell \( u \)$, even when $W$ is infinite.
  Let $P_(u \, b)^W \( q \)$ denote the usual equal-parameter Kazhdan–Lusztig polynomial,
  normalized by $P_(u \, u)^W = 1$ and $deg P_(u \, b)^W < \( ell \( b \) - ell \( u \) \) \/ 2$ for $u < b$.
  The combinatorial invariance conjecture asks whether isomorphic interval posets have the same polynomial.
  An isomorphism here is only a bijection preserving and reflecting order; it carries no labels or root data.
  The following theorem gives a positive answer in full equal-parameter generality.

#thm([Theorem 1.1.])[
  (Combinatorial invariance).  #emph[Let $\( W \, S \)$ and $\( W' \, S' \)$ be arbitrary Coxeter systems,
    and let $u lt.eq b$ in $W$ and $u' lt.eq b'$ in $W'$. If
$ iota : \[ u \, b \] arrow.r \[ u' \, b' \] $

 is an isomorphism of abstract Bruhat interval posets, then their equal-parameter Kazhdan–Lusztig polynomials satisfy
$ P_(u \, b)^W \( q \) = P_(u' \, b')^(W') \( q \) . $

]
] <thm:main>

The statement includes infinite and noncrystallographic groups.
  Restricting $iota$ to subintervals also determines every polynomial $P_(x \, y)$ on the interval;
  reciprocity then recovers all its $R$-polynomials (Corollary 23).

=== 1.1 History and the missing label data <history-and-the-missing-label-data>

Kazhdan and Lusztig introduced these polynomials through the canonical basis of the Hecke algebra [27].
  Their geometric interpretation identifies them with local intersection-cohomology invariants of Schubert
  varieties in the Weyl-group setting [28]. Thus combinatorial invariance asks how much of an invariant initially
  defined by algebra, and subsequently understood geometrically, is already recorded by a finite poset.
  The conjecture is attributed to Lusztig and Dyer [11]. Dyer’s published formulation appears in the setting of
  finite Coxeter systems in [17] Section 3.5. His reconstruction of the directed Bruhat graph from the interval
  order supplies all reflection edges, including edges that are not covers [17] Proposition 3.3.
  Section 3 gives a closure proof for arbitrary Coxeter systems. The reconstruction does not supply root labels.

A principal lower interval is an interval $\[ 1 \, b \]$ starting at the identity.
  Special matchings gave an order-theoretic approach to recursion on these intervals.
  Du Cloux developed an abstract model for Bruhat intervals [13] and proved that isomorphisms of principal lower
  intervals preserve all corresponding $P_(x \, y)$ when one ambient group belongs to a class including all finite
  and affine Coxeter groups [14]. Brenti established the corresponding result for symmetric groups [7].
  Brenti, Caselli, and Marietti proved it for arbitrary Coxeter systems [8] Theorem 7.8 and Corollary 8.4,
  as did Delanoy [11] Theorem 7.2 and Corollary 7.3. Their input includes the positions of $x$ and $y$ inside the
  supplied principal lower interval; the general conjecture asks for $P_(x \, y)$ from the abstract interval
  $\[ x \, y \]$ alone.

Caselli and Marietti more recently proved that every special matching of a Bruhat interval in a symmetric group
  satisfies Brenti’s $R$-polynomial recursion [9] Theorem 8.6.
  The same preprint leaves its proposed algorithm for all type-$A$ intervals conjectural [9] Conjecture 8.13 and
  Proposition 8.15.

For intervals with arbitrary bottom elements, Incitti obtained short-interval results in classical types [26].
  Patimo proved invariance of the coefficient of $q$ in finite simply-laced Weyl groups [30].
  Barkley, Gaetz, and Lam established the same coefficient invariance for arbitrary Coxeter systems and deduced
  full invariance in interval rank at most six [3] Corollaries 1.3 and 1.4.
  Combining the flipclass approach with this coefficient result, Esposito, Marietti,
  and Stella obtained full invariance through rank ten in finite Weyl groups and rank twelve in finite type $A$
  [21] Corollary 1.3(ii).

Another approach uses hypercube decompositions of Bruhat intervals.
  Blundell, Buesing, Davies, Veličković, and Williamson developed a recurrence for $P$-polynomials in symmetric
  groups, guided by analyses of trained machine-learning models.
  They proved it for a particular decomposition defined using the permutation labels of the vertices and
  conjectured it for every hypercube decomposition of such an interval [5] Theorem 3.7 and Conjecture 3.8.
  Barkley and Gaetz proved invariance of the normalized $R$-polynomial $tilde(R)$ for elementary intervals in
  symmetric groups [1] Theorem 1.6. They later proved the BBDVW recurrence for every hypercube decomposition of a
  principal lower interval $\[ 1 \, v \]$ in a symmetric group [2] Theorem 1.3.

Our approach uses the moment-graph form of the theory. The fixed-point descriptions of equivariant cohomology
  developed by Goresky, Kottwitz, and MacPherson provide the geometric ancestry of its polynomial congruence
  conditions [25]. Braden and MacPherson constructed sheaves that recover intersection cohomology from moment
  graphs [6] Theorems 1.5–1.6. Soergel’s categorification [31],
  Fiebig’s moment-graph and Coxeter-category constructions [24,23,22],
  and the character theorem of Elias and Williamson [20] make the relevant sheaves available for arbitrary Coxeter
  systems over a suitable real realization. Lanini studied invariance through isomorphisms of labeled moment
  graphs. Her pullback statement compares Braden–MacPherson sheaves when the graph isomorphism includes compatible
  vertexwise automorphisms of a common label space: they carry edge labels to unit multiples and agree modulo the
  edge label at neighboring vertices [29] Definitions 2.3–2.4, Lemma 5.1, and Remark 5.1.
  An abstract Bruhat interval isomorphism does not include these label automorphisms.
  We retain the two realizations separately and compare images in their sheaves through an order on edges.

The reflection-subgroup theory of Deodhar and Dyer, together with Dyer’s reflection-order theory,
  supplies the combinatorial inputs [12,15,16,17,18]. The reflection-path formula already appears in his thesis
  [15] Theorem 6.23. His reconstruction of dihedral coset intersections by four-cycle moves [17] Section 3.4
  precedes the relative-interval transport argument below. Dyer also describes polynomials indexed by initial
  sections of a reflection order and interpolating between $q^(- d \/ 2) P_(u \, b) \( q \)$ and $q^(d \/ 2)
  P_(u \, b) \( q^(- 1) \)$, where $d = ell \( b \) - ell \( u \)$ [18] Introduction.
  His rank-two manuscript contains an integer model of the dihedral graph and the planar length-sum identity used
  below, proves scalar congruence and intersection statements,
  and sketches localization of projective modules along cosets [19] Sections 1.9–1.11 and 3.16.
  The proof here combines an exact later-edge count for transported relative intervals with a bound for the two
  endpoint images in a sheaf. A reciprocal comparison forces every such bound to be attained,
  with freeness supplied by the same induction.

=== 1.2 The proof mechanism <the-proof-mechanism>

A moment-graph sheaf assigns a graded module to each vertex and edge,
  together with restriction maps from an edge’s endpoints to its module.
  For the sheaf $B \( b \)$ with top $b$, the vertex module $B^x$ is free over a real polynomial ring $A$,
  and its graded rank is $P_(x \, b) \( q \)$.

If $F$ is a set of upward edges at $x$, write

$ L_x \( F \) = ker (B^x arrow.r xor.big_(e in F) B^e) . $

These are the vectors whose restrictions vanish along $F$. Their two extreme cases are known:
  $L_x \( diameter \) = B^x$, while the kernel for all upward edges is free with graded rank
  $q^(ell \( b \) - ell \( x \)) P_(x \, b) \( q^(- 1) \)$.
  Intermediate kernels are the objects for which we must establish freeness.

Choose a reflection order in the second Coxeter system. Use the labels there to order the edges of the first
  interval through $iota$; call the resulting order a transported schedule.
  It need not be a reflection order in the first system. A terminal portion at a vertex consists of all its edges
  from a chosen place to the end of this schedule. We prove polynomial invariance simultaneously with freeness of
  $L_u \( F \)$ for every terminal portion $F$ at the bottom.
  The induction is on interval rank, so the same freeness is already available at every strictly higher vertex.

The local step concerns an edge $e : x arrow.r y$. Let $F$ and $G$ be the strictly later upward edges at $x$ and
  $y$. Compare their images in the common edge module:

$ I_e = "res"_(x \, e) L_x \( F \) \, wide J_e = "res"_(y \, e) L_y \( G \) . $

Localization at a plane of root labels decomposes the sheaf into rank-one dihedral models.
  Relative dihedral intervals transport through $iota$, so their later-edge counts compare these two images.
  Assuming only the known freeness of $L_y \( G \)$, the result is a graded inclusion

$ I_e subset.eq f_e J_e \, wide deg f_e = frac(ell \( y \) - ell \( x \) - 1, 2) \, $

where $alpha_e$ is the root label of $e$, $f_e$ is a nonzero homogeneous element of $A \/ \( alpha_e \)$,
  and $f_e J_e$ is free over $A \/ \( alpha_e \)$. The later global comparison will make this inclusion an equality.

Remove the edge conditions in schedule order. At any real $0 < q < 1$,
  the inclusion bounds the increase in the Hilbert series at $x$ by a positive multiple of the current kernel’s
  Hilbert series at $y$. The successive bounds form a product of nonnegative elementary matrices.
  This product counts decreasing paths for the reflection order in the second system,
  so Dyer’s path formula identifies it with that system’s normalized $R$-matrix.
  Reciprocity in both directions then proves polynomial equality.

The matrices have nonnegative entries and diagonal entries one.
  Equality at the endpoints therefore forces every intermediate bound to be exact, giving $I_e =
  f_e J_e$ for every edge. Adding the bottom conditions back in reverse order now proves freeness for all terminal
  kernels and closes the simultaneous induction.

Section 2 states the standard inputs and verifies the realization and grading conventions.
  Section 3 proves graph reconstruction, transport, and the later-edge counts.
  Section 4 gives the dihedral models and their local decomposition,
  and Section 5 obtains the edge-image inclusion. Section 6 carries out reciprocity and the simultaneous induction.

=== 1.3 Conventions <conventions>

Write $1$ for the identity of a Coxeter group. For comparable elements set

$ d \( x \, y \) = ell \( y \) - ell \( x \) . $

An upward Bruhat edge is $x arrow.r t x$, where $t$ is a reflection and $t x > x$.
  Its label is the positive root of $t$; labels are always on the left.

We use the equal-parameter polynomials with $P_(x \, x) = R_(x \, x) = 1$,
  and both polynomials zero when $x lt.eq.not y$. For $x < y$, $deg P_(x \, y) < d \( x \, y \) \/ 2$.
  The $R$-polynomial convention is, for $s in S$ with $s y < y$,

$ R_(x \, y) \( q \) =
  cases(delim: "{", R_(s x \, s y) \( q \) \, & s x < x \,, \( q - 1 \) R_(x \, s y) \( q \) + q R_(s x \, s y) \(
  q \) \, & s x > x .) $

Together with the degree condition, the reciprocity identity

#[#set math.equation(numbering: n => "(1.1)")
 $ q^(d \( x \, y \)) P_(x \, y) \( q^(- 1) \) = sum_(x lt.eq z lt.eq y) R_(x \, z) \( q \) P_(z \, y) \( q \)
   $ <eq:reciprocity>]

fixes the normalization of $P$ [27]. The same conventions apply to primed systems.
  Polynomial rings are over $bb(R)$, with root labels in degree one.
  Ranks of graded free modules record basis degrees with positive exponents for generators in positive degree.

== 2 Real realizations and moment-graph sheaves <sec:background>

We first construct a real realization to which the character theorems apply.
  We then state the reflection-order and sheaf inputs, ending with the two graded ranks that will be the endpoints
  of the comparison in Section 6. All constructions are made separately for the two Coxeter systems.
  All sheaf constructions use the coefficient field $bb(R)$, and linear forms have degree one.
  Theorem and section locators for [23,20] refer to the arXiv versions specified in the bibliography.

=== 2.1 Reduction to finite rank <reduction-to-finite-rank>

Let $J$ be the finite set of simple reflections occurring in a reduced expression for $b$.
  Every element below $b$ lies in the standard parabolic subgroup $W_J$,
  by the subword criterion for Bruhat order [4] Theorem 2.2.2.
  The Bruhat order on $W_J$ is the restriction of the ambient order [4] Proposition 2.4.1,
  and its equal-parameter Hecke algebra is the corresponding standard subalgebra.
  The defining recursions therefore give the same $R$- and Kazhdan–Lusztig polynomials on this subgroup.
  The interval graph also restricts. For an ambient edge $x arrow.r y$ with $x \, y in W_J$, its label $t =
  y x^(- 1)$ belongs to $W_J$. Strong exchange applied to $t t =
  1$ and a reduced $J$-word for $t$ expresses $t$ as a $W_J$-conjugate of a generator in $J$ [4] Corollary 1.4.4;
  the converse is immediate. Consequently we may, and do, assume that both Coxeter systems have finite rank.
  The groups themselves need not be finite.

=== 2.2 A reflection-faithful real realization <a-reflection-faithful-real-realization>

#thm([Lemma 2.1.])[
  #emph[For a finite-rank Coxeter system $\( W \, S \)$ there is a finite-dimensional real vector space $V$,
    with a nondegenerate symmetric bilinear form, having the following properties.]
  + #emph[The simple roots $alpha_s$ are linearly independent,
$ \( alpha_s \, alpha_s \) = 2 \, wide \( alpha_s \, alpha_t \) = - 2 cos \( pi \/ m_(s t) \) quad \( s eq.not t \) \, $

 where $cos \( pi \/ oo \) = 1$, and $s$ acts by
$ s \( v \) = v - \( alpha_s \, v \) alpha_s . $

]
  + #emph[The representation is reflection faithful: it is faithful, and $"rank" \( w - 1 \) =
    1$ holds precisely for the reflections of $W$.]
  + #emph[After identifying $V$ with its dual by the bilinear form,
    both the simple roots and the simple coroots are independent.
    A strictly dominant linear form $rho$ can be chosen so that
$ \( w rho \) \( alpha_s \) > 0 quad arrow.l.r.double quad s w > w . $

]
  #emph[This realization may be chosen to have the minimal dimension required by the independent-root and
    independent-coroot conditions in [20] Section 3.1.]
] <bg:realization>

#proof[
  Start with the usual geometric root space $V_0$ and its symmetric Tits form [4] Sections 4.2–4.4.
    Let $K$ be its radical and choose a complement $V_1$ to $K$.
    Adjoin a vector space $K'$ dual to $K$, pair $K$ and $K'$ nondegenerately,
    and take $K'$ to be isotropic and orthogonal to $V_1$. The resulting form on
  $ V = V_1 xor K xor K' $
  is nondegenerate and extends the original form. Its dimension is $dim V_0 + dim K$,
    the minimal possible dimension of such an extension. This is also minimal under the independent-root and
    independent-coroot conditions. Indeed, let $G = \( \( alpha_s \, alpha_t \) \)_(s \, t in S)$.
    In any realization $tilde(V)$ with these pairings and independent simple roots and coroots,
    evaluation by the root covectors maps $tilde(V)$ onto $bb(R)^S$.
    Its restriction to the coroot span has matrix $G$, so its kernel there has dimension $"corank" G$.
    This subspace lies in the full kernel, so rank–nullity gives
  $ dim tilde(V) gt.eq \| S \| + "corank" G = dim V_0 + dim K \, $
  which the construction attains. For distinct simple reflections with $m_(s t) < oo$,
    their root plane is positive definite. The displayed reflections have product of order $m_(s t)$ on that plane
    and fix its orthogonal complement. Thus the Coxeter relations hold on all of $V$; pairs with $m_(s t) =
    oo$ impose no relation. The action restricts to the faithful geometric action on $V_0$ [4] Theorem 4.2.7,
    so it is faithful on $V$ as well. The simple roots and their corresponding linear forms are independent by
    nondegeneracy.
  For clarity, reflection faithfulness can also be seen directly.
    If an orthogonal transformation has rank-one difference from the identity, write it as $g = 1 + u ⊗ phi$.
    Orthogonality first implies $u^flat = c phi$ for some nonzero scalar $c$, and then implies $phi \( u \) = -
    2$. Thus $g^2 = 1$ and $\( u \, u \) eq.not 0$: $g$ is an orthogonal reflection.
    If $g in W$, the finite-subgroup theorem for Coxeter groups [10] Theorem 12.3.4(i) puts $chevron.l g
    chevron.r$, after conjugation, in a finite standard parabolic subgroup.
    Its root span is positive definite, and its orthogonal complement in $V$ is fixed by that parabolic subgroup.
    The restriction of $g$ to the root span still has rank-one difference from the identity,
    and finite Coxeter geometry identifies it as a Coxeter reflection.
    Conversely every Coxeter reflection has rank-one difference from the identity.
    This is the reflection-faithful realization used in [20] Section 3.1.
  Choose $rho in V^(*)$ positive on every simple coroot. Such a choice exists by their independence.
    A real coroot has either nonnegative or nonpositive simple-coroot coefficients.
    Applying this observation to $w^(- 1) alpha_s$ gives the displayed length-sign criterion.
    The same argument applies to roots under the symmetric identification.
  The chosen $rho$ has trivial stabilizer. If $w eq.not 1$, take a left descent $s$ of $w$;
    then $\( w rho \) \( alpha_s \) < 0 < rho \( alpha_s \)$, so $w rho eq.not rho$.
    The identification of $V$ with its dual therefore supplies a regular orbit.
    The comparison constructions of [23] Sections 2 and 5 also use an orbit with stabilizer ${ 1 \,
    s }$ for each simple reflection $s$. Such an orbit exists here. Put $H_s = V^s$.
    An element fixing $H_s$ pointwise has rank at most one after subtracting the identity,
    so reflection faithfulness and uniqueness of the orthogonal reflection with hyperplane $H_s$ force it to be
    $1$ or $s$. For every other element $w$, $H_s ∩ V^w$ is therefore a proper subspace of $H_s$.
    Since $W$ is countable, a point outside their union exists over $bb(R)$ and has stabilizer exactly ${ 1 \, s }$. ◻
]

Let $Phi = { w alpha_s : w in W \, med s in S }$ be the real root system, and let $Phi^(+)$ be its positive roots.
  For $gamma in Phi^(+)$, write $r_gamma$ for its reflection.
  The extension leaves the root action unchanged, so the standard reflection length-sign criterion [4]
  Proposition 4.4.6, applied to $w^(- 1)$, gives

#[#set math.equation(numbering: n => "(2.1)")
 $ r_gamma w > w quad arrow.l.r.double quad ell \( r_gamma w \) > ell \( w \) quad arrow.l.r.double quad
   w^(- 1) gamma in Phi^(+) . $ <eq:bg-reflection-sign>]

Put

$ A = "Sym"_(bb(R)) \( V \) \, wide N = dim V \, $

where the bilinear form identifies each root with a linear polynomial.
  Throughout the proof, linear polynomials have degree $1$.
  If $E$ is an edge labeled by a reflection $t$, write $alpha_E$ for any nonzero scalar multiple of its root.
  Only the principal ideal $\( alpha_E \)$ matters. Distinct reflections give nonproportional labels.
  We include the additional directions of $V$ in the polynomial ring, even when the original Tits form is degenerate.

For a finitely generated graded free $A$-module $M$ with homogeneous basis degrees $j_1 \, dots.h \, j_r$, set

$ "grk"_A \( M \; q \) = sum_(i = 1)^r q^(j_i) . $

Thus a generator in positive degree contributes a positive exponent, and

$ "Hilb" \( M \; q \) = frac("grk"_A \( M \; q \), \( 1 - q \)^N) . $

=== 2.3 Reflection orders and their path formula <reflection-orders-and-their-path-formula>

A reflection order is a total order of the positive roots whose restriction to the positive roots in every
  rank-two root subsystem is one of their two angular orders. We shall use geometric reflection orders.
  Choose a linear functional $h$ strictly positive on the simple roots, and therefore on every positive root.
  Choose another linear functional $f$ such that the numbers

$ frac(f \( alpha \), h \( alpha \)) \, wide alpha in Phi^(+) \, $

are pairwise distinct, and order the roots by these numbers. Such an $f$ exists:
  the root set is countable, and each equality to be avoided cuts out a proper hyperplane in the space of
  functionals. Within a root plane, the normalized positive roots $alpha \/ h \( alpha \)$ lie on an affine line;
  their order is consequently one of the angular orders. This produces a reflection order even when the root
  system is infinite. Reversing it produces another reflection order.

#thm([Theorem 2.2.])[
  (Dyer’s reflection-order path formula).  #emph[Fix a reflection order and use left reflection labels on Bruhat
    edges. Let $tilde(R)_(x \, y) \( T \)$ be the sum of $T^r$ over directed paths of $r$ edges from $x$ to $y$
    having strictly increasing labels. The empty path contributes $1$ when $x = y$. Then
#[#set math.equation(numbering: n => "(2.2)")
 $ q^(- d \( x \, y \) \/ 2) R_(x \, y) \( q \) = tilde(R)_(x \, y) #scale(x: 120%, y: 120%)[\(] q^(1 \/ 2) -
   q^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:bg-path-formula>]

 The same polynomial counts paths with strictly decreasing labels.]
] <bg:paths>

The path formula is due to Dyer [18] Corollary 3.4; its left-label version follows from the right-label version by
  inversion. The decreasing statement follows by reversing the reflection order.
  Every path between $x$ and $y$ lies in the finite interval $\[ x \, y \]$, so all these sums are finite.
  Finally, edges with the same reflection label are pairwise disjoint:
  a reflection pairs each vertex $w$ only with $t w$. Thus any schedule obtained by ordering reflection labels has
  no interacting ties.

=== 2.4 The sheaf and its full upward kernels <the-sheaf-and-its-full-upward-kernels>

Fix $b in W$. The Bruhat graph on $\[ 1 \, b \]$ has an edge $E : x arrow.r y$ whenever $y =
  t x > x$ for a reflection $t$; labels are on the left. A sheaf on this graph consists of vertex modules $B^x$,
  edge modules $B^E$, and restriction maps from the two endpoints of each edge.
  A section over a set of vertices is a tuple whose endpoint restrictions agree on every edge with both endpoints
  in the set.

We use the following standard form of the Braden–MacPherson construction and its relation to Soergel bimodules.
  The construction and the Verma-flag properties are due to Braden–MacPherson and Fiebig [6,24,23],
  within Soergel’s categorification [31]; the character identity used below is the theorem of Elias–Williamson.
  The precise bridges are [23] Theorem 6.3, Corollary 6.5, and Proposition 7.1, [22] Section 3, and [20] Theorem 1.1.

#thm([Theorem 2.3.])[
  (Moment-graph sheaf).  #emph[There is an indecomposable graded sheaf $B = B \( b \)$ on $\[ 1 \, b \]$,
    normalized by $B^b = A$, with the following properties.]
  + #emph[Every vertex module $B^x$ is finitely generated and graded free. For $E : x arrow.r y$,
$ B^E = B^y \/ alpha_E B^y \, $

 and restriction from $y$ is the quotient map.]
  + #emph[If $Omega subset.eq \[ 1 \, b \]$ is upward closed,
    every section over $Omega$ extends to a global section. Moreover the projection from global sections onto each
    $B^x$ is surjective.]
  + #emph[Let $U_x$ be the set of edges out of $x$. For $F subset.eq U_x$ put
$ L_x \( F \) = ker (B^x arrow.r xor.big_(E in F) B^E) . $

 Then $L_x \( U_x \)$ is graded free.]
] <bg:bmp>

The second property will be called flabbiness and generation by global sections.
  No freeness assertion for an arbitrary subset $F subset.eq U_x$ is included in this theorem.
  Freeness for the particular subsets needed later will be proved by induction.

#thm([Proposition 2.4.])[
  (Grading normalization).  #emph[For $x lt.eq b$, write $d = d \( x \, b \) = ell \( b \) - ell \( x \)$.
    In the degree-one convention above,
#[#set math.equation(numbering: n => "(2.3)")
 $ "grk"_A \( B^x \; q \) = P_(x \, b) \( q \) \, wide "grk"_A \( L_x \( U_x \) \; q \) =
   q^d P_(x \, b) \( q^(- 1) \) . $ <eq:bg-ranks>]

]
] <bg:normalization>

#proof[
  We track the shifts explicitly. Temporarily double all degrees, so that linear forms have degree $2$,
    and let $z$ record the resulting generator degrees. Denote the regraded sheaf by $hat(B)$, and write $n =
    ell \( b \)$ and $m = ell \( x \)$. With the shift convention $M \( k \)^j = M^(j + k)$, put
  $ M = Gamma \( hat(B) \) \( n \) $
  and note that its top generator has degree $- n$. This is the normalized self-dual indecomposable projective in
    [23] Corollary 6.5 and Theorem 6.1.
  We first compute the full upward-kernel rank. For $w lt.eq b$, let $M^(\[ w \])$ be the lower-support layer
  $ M^(\[ w \]) = Gamma_(lt.eq w) M \/ Gamma_(< w) M \, $
  where $Gamma_J M$ means the submodule of sections supported on $J$.
    Restriction to $x$, together with flabbiness, identifies $M^(\[ x \])$ with $hat(L)_x \( U_x \) \( n \)$.
    Indeed a vector in the full upward kernel, placed at $x$ and extended by zero outside ${ y : y lt.eq x }$,
    is a section on the upward-closed set $\[ 1 \, b \] \\ { y : y < x }$;
    flabbiness extends it to a global section supported on ${ y : y lt.eq x }$.
  The layer in [23] Section 2.4 is described instead as the kernel of the map between the projections to the upper
    sets ${ y : y gt.eq x }$ and ${ y : y > x }$. Flabbiness identifies those projections with section modules;
    a tuple in the kernel has only its $x$-coordinate nonzero,
    with precisely the full upward vanishing conditions. Thus that layer and the lower-support quotient above are
    canonically identified through $hat(L)_x \( U_x \) \( n \)$.
  We now compare the character conventions in the cited sources.
    In the Hecke normalization $H_s^2 = 1 + \( z^(- 1) - z \) H_s$,
    write $underline(H)_w$ for the Kazhdan–Lusztig basis element.
    The Hecke bar involution is determined by $overline(z) = z^(- 1)$ and $overline(H_s) = H_s^(- 1)$.
    Fiebig’s twisted graph indexed by $w$ is ${ \( w^(- 1) v \, v \) : v in V }$ [23] Section 4,
    whereas Elias–Williamson use ${ \( w v \, v \) : v in V }$ [20] Section 3.5.
    Under Fiebig’s equivalence with Soergel bimodules [23] Theorem 6.3,
    this index reversal and the top normalization identify the corresponding bimodule as the unshifted
    $B_(b^(- 1))$. Let $frak(a)$ be the $bb(Z) \[ z \, z^(- 1) \]$-linear anti-involution of the Hecke algebra
    defined by $frak(a) \( H_w \) = H_(w^(- 1))$ [20] Section 3.2.
  Fiebig’s lower-support character of $M$ is $frak(a) \( "ch"_nabla \( B_(b^(- 1)) \) \)$ in Elias–Williamson’s
    notation. The coefficient convention can be checked on one generator.
    Their standard lower-support module $nabla_(x^(- 1))$ has its generator in degree $- m$.
    A generator of $M^(\[ x \])$ in degree $j$ therefore corresponds to $nabla_(x^(- 1)) \( - m - j \)$.
    Its shift contributes $z^(- m - j)$ before the coefficient conjugation in $"ch"_nabla$ changes this to
    $z^(m + j)$. Thus the coefficient after applying $frak(a)$ is $z^m "grk"_z \( M^(\[ x \]) \)$,
    as in [23] Section 8.2.
  Let $"ch"$ denote the standard character in [20] Theorem 1.1.
    For a Soergel bimodule, the characters satisfy $"ch"_nabla \( B \) = overline("ch" \( B \))$ [20] Section 3.5.
    The character theorem, together with bar invariance of the Kazhdan–Lusztig basis,
    therefore gives $"ch"_nabla \( B_(b^(- 1)) \) = underline(H)_(b^(- 1))$.
    The anti-involution $frak(a)$ commutes with bar and inversion preserves Bruhat order,
    so the triangular characterization gives $frak(a) \( underline(H)_(b^(- 1)) \) = underline(H)_b$.
    Using the Kazhdan–Lusztig expansion in [20] Remark 3.2, the full character identity is
  $ sum_(w lt.eq b) z^(ell \( w \)) "grk"_z \( M^(\[ w \]) \) H_w & = frak(a) \( "ch"_nabla \( B_(b^(- 1)) \) \) =
    underline(H)_b\
 & = sum_(w lt.eq b) z^(n - ell \( w \)) P_(w \, b) \( z^(- 2) \) H_w . $
  Comparison of the coefficient of $H_x$ gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ z^m "grk"_z \( M^(\[ x \]) \) = z^(n - m) P_(x \, b) \( z^(- 2) \) . $ <eq:bg-character>]
  Since $M^(\[ x \]) tilde.eq hat(L)_x \( U_x \) \( n \)$, this gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ "grk"_z hat(L)_x \( U_x \) = z^(2 \( n - m \)) P_(x \, b) \( z^(- 2) \) . $ <eq:bg-upward-rank>]
  For the stalk rank, write $M^x$ for the image of the projection of $M$ to $hat(B)^x \( n \)$.
    Generation by global sections gives $M^x = hat(B)^x \( n \)$.
    Fiebig’s integral graded-module statement [23] Proposition 7.1(4), with Corollary 6.5 says,
    in the shift convention above, that
  $ M^x tilde.eq xor.big_i A \( k_i \) quad arrow.r.double quad M^(\[ x \]) tilde.eq xor.big_i A \( 2 m - k_i \) . $
  Both sides are the actual graded free modules over $A$. In our positive-generator rank convention,
    this relation becomes
  $ "grk"_z \( M^x \) = z^(- 2 m) "grk"_z \( M^(\[ x \]) \) \|_(z mapsto z^(- 1)) . $
  Using $M^x = hat(B)^x \( n \)$ and (2.4), we obtain
  $ z^(- n) "grk"_z \( hat(B)^x \) = z^(- 2 m) z^(n - 2 m) P_(x \, b) \( z^(- 2) \)\|_(z mapsto z^(- 1)) =
    z^(- n) P_(x \, b) \( z^2 \) . $
  Thus $"grk"_z hat(B)^x = P_(x \, b) \( z^2 \)$. Finally set $q = z^2$ in this formula and in (2.5).
    This gives (2.3). ◻
]

#prodef([Remark 2.5.])[
  Although $B \( b \)$ is constructed on $\[ 1 \, b \]$, every upward edge out of a vertex $x
    in \[ u \, b \]$ has its other endpoint in $\[ u \, b \]$.
    Thus $U_x$ and all the modules $L_x \( F \)$ used on this upper interval are computed without any additional
    upward conditions outside it.
] <bg:upper-interval>

== 3 Dihedral intervals and transported reflection orders <sec:dihedral>

We first establish the plane and graph facts that let an interval isomorphism transport full relative dihedral
  intervals. For an edge, a nonnegative integer attached to each root plane then measures a difference of
  later-edge counts; the sum of these integers is half the excess of the edge’s length difference over one.
  Dyer’s reconstruction of dihedral coset intersections by four-cycle moves [17] Section 3.4 precedes the
  transport argument needed for the later sheaf comparison.

=== 3.1 Root planes and relative orders <root-planes-and-relative-orders>

We use left reflection labels throughout. If $Pi$ is a plane spanned by two roots,
  let $D_Pi$ be the subgroup generated by the reflections whose roots belong to $Pi$, and write $Phi_D^(+) =
  Phi^(+) ∩ Pi$ for the induced positive roots. The following facts distinguish the relative Bruhat order of a
  reflection subgroup from the ambient Bruhat order.

#thm([Lemma 3.1.])[
  (Planes and relative orders).  #emph[Let $Pi$ be spanned by two linearly independent roots in the real
    realization of $W$.]
  + #emph[The subgroup $D = D_Pi$, with its canonical Coxeter generators, is dihedral.
    Its reflections are exactly the ambient reflections whose roots lie in $Pi$.]
  + #emph[Each coset $D a$ has a unique element $a_0$ of minimal ambient length.
    The map $w mapsto w a_0$ identifies the labeled directed Bruhat graph of $D$ with the directed subgraph of the
    ambient Bruhat graph on $D a$. Write $lt.eq_D$ for the resulting relative order and put
$ ell_D \( w a_0 \) = ell_D \( w \) . $

 Then $x lt.eq_D y$ implies $x lt.eq y$, and
$ ell_D \( x \) = \# { gamma in Phi_D^(+) : x^(- 1) gamma < 0 } \, wide x in D a . $

]
  + #emph[If a nonidentity element has two factorizations as products of two distinct reflections,
    the two pairs of roots span the same plane. Consequently,
    all directed two-edge paths with fixed endpoints have their labels in one maximal dihedral subgroup.]
] <dih:plane>

#proof[
  We use the reflection-subgroup theorem: a reflection subgroup has a canonical Coxeter system whose simple roots
    are positive ambient roots with positive squared lengths and pairwise nonpositive pairings; see [12,16,17,18].
    Every reflection with root in $Pi$ preserves $Pi$ and has the image of its difference from the identity
    contained in $Pi$. These properties persist under products.
    If an ambient reflection belongs to $D$, its root line, being the image of its difference from the identity,
    therefore lies in $Pi$.
  The canonical simple roots of $D$ consequently lie in $Pi$. There cannot be three of them:
    in the pointed intersection of $Pi$ with the ambient positive cone,
    one of three distinct rays lies strictly between the other two.
    Its root $gamma$ is a positive linear combination of the outside roots $alpha \, beta$.
    Pairing this combination with $gamma$ would give
  $ \( gamma \, gamma \) = c \( gamma \, alpha \) + d \( gamma \, beta \) lt.eq 0 \, wide c \, d > 0 \, $
  contrary to its positive squared length. Since $D$ contains two distinct reflections with independent root
    lines, its canonical rank is exactly two.
  Choose an element $a_0$ of least ambient length in $D a$.
    For $gamma in Phi_D^(+)$, minimality and the reflection length-sign criterion (2.1) give $a_0^(- 1) gamma >
    0$. Thus $a_0^(- 1)$ preserves the signs of all roots of $D$.
    For $w in D$, the signs of $\( w a_0 \)^(- 1) gamma$ and $w^(- 1) gamma$ agree.
    This proves the inversion-count formula and identifies the orientations and labels of all relative reflection
    edges. Conversely, an ambient reflection carrying one element of $D a$ to another belongs to $D$,
    so there are no further ambient edges on this coset. The relative graph has a unique minimum,
    hence $a_0$ is also the unique ambient-length minimum. Relative directed paths are ambient directed paths,
    which proves the asserted implication between orders. In the finite setting,
    this is the coset graph property of [17] Theorem 1.4.
  For the final assertion, use the nondegenerate ambient bilinear space,
    even when its restriction to $Pi$ is degenerate. For independent roots $alpha \, beta$, set
  $ a \( v \) = frac(2 \( v \, alpha \), \( alpha \, alpha \)) \, wide b \( v \) =
    frac(2 \( v \, beta \), \( beta \, beta \)) . $
  The normal forms $a \, b$ are independent, and the reflection formula gives
  $ \( r_alpha r_beta - 1 \) v = alpha #scale(x: 120%, y: 120%)[\(] - a \( v \) +
    a \( beta \) b \( v \) #scale(x: 120%, y: 120%)[\)] - beta b \( v \) . $
  The two coefficient forms are independent as well. Therefore
  $ "im" \( r_alpha r_beta - 1 \) = "span" \( alpha \, beta \) . $
  This image depends only on the product. It gives the common plane for any other two-reflection factorization,
    and part (1) supplies the maximal dihedral subgroup attached to that plane.
    The labels of a directed two-edge path are distinct, since repeating a reflection would return to its starting
    vertex. ◻
]

#thm([Lemma 3.2.])[
  (Dihedral interval shape).  #emph[Let $D$ be a finite or infinite dihedral Coxeter group,
    with length function $ell_D$ and Bruhat order $lt.eq_D$. If $ell_D \( p \) < ell_D \( q \)$, then $p <_D q$.
    For $a <_D c$, put $n = ell_D \( c \) - ell_D \( a \)$. The interval $\[ a \, c \]_D$ has one vertex at each
    endpoint and two vertices in each internal rank.]
  #emph[For comparable $p <_D q$, there is a directed reflection edge $p arrow.r q$ exactly when $ell_D \( q \) -
    ell_D \( p \)$ is odd. In particular, if $n$ is even, exactly $n$ directed two-edge paths join $a$ to $c$;
    if $n$ is odd, there is no such path.]
] <dih:shape>

#proof[
  Reduced words alternate between the two canonical generators.
    In the infinite group there are two elements of every positive length.
    In $I_2 \( m \)$ there are two elements of each length strictly between $0$ and $m$,
    and one element at lengths $0$ and $m$. The identity is below every element.
    At positive shorter length, either alternating word occurs as a subword of every longer alternating word:
    choose the run beginning at its first or second letter. The subword criterion [4] Theorem 2.2.2 gives
    comparability in length order. At equal length, comparability forces equality.
    These facts give the stated interval shape, including a possible finite longest element as the singleton top.
  An odd alternating reduced word is a palindrome and hence is conjugate to its middle generator,
    while every reflection has odd sign. Thus the reflections of $D$ are exactly its elements of odd Coxeter
    length. For $p <_D q$, the sign of $q p^(- 1)$ is $\( - 1 \)^(ell_D \( q \) - ell_D \( p \))$,
    which proves the left-reflection edge criterion. A two-edge path must therefore have an even total rank
    difference. If $n = 2 h > 0$, its intermediate vertex may occupy precisely the $h$ odd offsets $1 \, 3 \,
    dots.h \, 2 h - 1$. Each of those internal ranks has two vertices, giving $2 h = n$ paths. ◻
]

#prodef([Remark 3.3.])[
  The coset graph identification in Lemma 7 transfers these statements to the relative order in every coset of a
    maximal plane subgroup. This relative order need not be the order induced by all ambient comparabilities.
    What we use is the exact identification of directed reflection edges.
    In particular, if $x <_D c$ has relative length difference two, Lemma 8 gives two relative two-edge paths.
    Every ambient two-edge path from $x$ to $c$ is one of them:
    its labels lie in the same maximal plane by Lemma 7(3), and its intermediate vertex therefore lies in $D x$.
] <dih:relative-paths>

=== 3.2 Graph reconstruction from interval order <graph-reconstruction-from-interval-order>

The cover relations and rank differences of a Bruhat interval are intrinsic to its poset.
  Dyer reconstructed all reflection edges from the covers for finite Coxeter systems [17] Proposition 3.3.
  We give a closure proof for arbitrary Coxeter systems using the plane and shape facts above.

#thm([Theorem 3.4.])[
  (Graph reconstruction).  #emph[An isomorphism of Bruhat intervals in arbitrary Coxeter systems preserves their
    directed Bruhat graphs. More explicitly, if $iota : \[ u \, b \]
    arrow.r \[ u' \, b' \]$ is a poset isomorphism, then
$ y = t x > x upright(" for a reflection ") t quad arrow.l.r.double quad iota \( y \) =
  t' iota \( x \) > iota \( x \) upright(" for a reflection ") t' . $

]
] <bg:graph>

#proof[
  For a finite Bruhat interval $Q$, let $cal(E)_Q$ be the least relation containing its cover pairs and closed
    under the following rule. Arrange six distinct vertices in four layers
  $ { a } divides { p \, q } divides { r \, s } divides { c } . $
  If all eight ordered pairs from one layer to the next are in $cal(E)_Q$, add $\( a \, c \)$.
    This rule depends only on the poset.
  First suppose that the eight pairs in an application of the rule are actual directed reflection edges.
    The two paths from $a$ to $r$ through $p \, q$ have a common root plane by Lemma 7(3).
    The two labels leaving $a$ are distinct and span that plane.
    Applying the same argument to the paths from $a$ to $s$ puts all four middle edges in this plane.
    The labels of $p arrow.r r$ and $p arrow.r s$ are again distinct,
    so the two paths from $p$ to $c$ put the last two labels there as well.
    Thus all six vertices lie in one maximal plane coset. By Lemmas 7 and 8,
    the three edges from $a$ through $p \, r$ to $c$ have positive odd relative gaps;
    their sum is positive and odd. Lemma 8 gives a relative reflection edge $a arrow.r c$,
    which is an ambient edge by Lemma 7. Hence the rule adds only actual reflection edges.
  To prove the converse, we first refine every non-cover reflection edge $a arrow.r^t c =
    t a$ to a directed three-edge path in one maximal plane coset.
    Its gap is odd, so write $d = d \( a \, c \) gt.eq 3$. We use a consequence of simple-reflection lifting:
    for a directed edge $z arrow.r^tau tau z$ and a simple reflection $v$,
    left multiplication gives a directed edge $v z arrow.r v tau z$ with label $v tau v$, unless $tau = v$.
    For a gap at least three, the new gap is at least the old gap minus two and is positive.
    For a cover, a reversal would require $v z > z$ and $v \( tau z \) < tau z$.
    The lifting property [4] Proposition 2.2.7 then gives $z lt.eq v \( tau z \)$; their lengths are equal,
    so $z = v \( tau z \)$ and $tau = v$. When $tau = v$, left multiplication indeed swaps the endpoints.
  We prove the refinement by induction on $ell \( c \)$ in the ambient group.
    Choose a simple left descent $v$ of $c$. If $v a > a$, then
  $ a arrow.r v a arrow.r v c arrow.r c $
  is directed: the middle gap is $d - 2 gt.eq 1$. Its labels are $v \, v t v \,
    v$ and lie in the plane subgroup spanned by the roots of $v$ and $t$.
    These roots are independent, since $v = t$ would make the original gap one.
  Suppose instead that $v a < a$. The edge $v a arrow.r v c$ has the same gap $d$ and an upper vertex of length
    $ell \( c \) - 1$. By induction it has a directed path
  $ w_0 = v a arrow.r w_1 arrow.r w_2 arrow.r w_3 = v c $
  whose labels $r_1 \, r_2 \, r_3$ lie in a maximal plane subgroup $D$. Its last label cannot be $v$:
    that would give $w_2 = v w_3 = c > w_3$. Nor can both $r_1 \, r_2$ equal $v$,
    since two consecutive uses of $v$ return to the same vertex.
    If neither equals $v$, left multiplication by $v$ preserves the whole directed path,
    and its labels lie in the conjugate plane subgroup $v D v$. If $r_1 = v$ or $r_2 = v$, use instead
  $ a = v w_0 arrow.r w_2 arrow.r w_3 arrow.r v w_3 = c . $
  Its first edge is respectively the original second edge, because $v w_0 = w_1$,
    or the $v$-translate of the original first edge, because $v w_1 = w_2$.
    In the latter case $r_1 eq.not v$, so that translate is directed.
    The last two edges are the original last edge and the upward $v$-edge.
    All labels lie in $D$, since $v in D$ in these cases. This proves the refinement.
    Its final path is directed with endpoints $a \, c$, so it lies inside $\[ a \, c \]$,
    even though the descent induction need not stay there.
  Now induct on the ambient gap of a reflection edge $a arrow.r c$ inside $Q$.
    For gap one it is a cover and belongs to $cal(E)_Q$. Otherwise choose the three-edge path just constructed in
    a maximal plane coset. In $\[ a \, c \]_D$, take both vertices at each of the two internal relative ranks
    occupied by this path. Lemma 8 supplies these vertices and all eight reflection edges between the four
    selected layers, since the three relative gaps are odd. These edges are ambient edges in $\[ a \, c \]
    subset.eq Q$ by Lemma 7. Each meets an internal layer, so its ambient gap is smaller than $d \( a \, c \)$.
    By induction all eight are in $cal(E)_Q$, and the closure rule adds $\( a \, c \)$.
  Thus $cal(E)_Q$ is exactly the directed Bruhat graph of $Q$.
    A poset isomorphism preserves covers and the closure rule, hence preserves all its directed reflection edges.
    The rule recovers their presence and direction, without identifying their root labels. ◻
]

=== 3.3 Transport of relative intervals <transport-of-relative-intervals>

We now fix a poset isomorphism

$ iota : \[ u \, b \] arrow.r \[ u' \, b' \] . $

By Theorem 10, it preserves the directed Bruhat graphs of these intervals.
  The next statement recovers all the relative interval structure that we will need,
  without requiring labels to be preserved.

#thm([Proposition 3.5.])[
  (Transport of dihedral intervals).  #emph[Let $D = D_Pi$ be a maximal root-plane subgroup of $W$.
    Suppose $x \, c$ belong to a common coset of $D$ and to $\[ u \, b \]$,
    with $x lt.eq_D c$ and $ell_D \( c \) - ell_D \( x \) gt.eq 2$.
    Then there is a maximal dihedral plane subgroup $D'$ of $W'$ such that
$ iota #scale(x: 120%, y: 120%)[\(] \[ x \, c \]_D
  #scale(x: 120%, y: 120%)[\)] = \[ iota \( x \) \, iota \( c \) \]_(D') . $

 The restricted map preserves and reflects relative order, relative rank differences,
   and all directed relative reflection edges.]
] <dih:transport>

#proof[
  Write $n = ell_D \( c \) - ell_D \( x \)$. By Lemma 8, the interval has one vertex at each end,
    two vertices in every internal rank, and all possible directed edges between consecutive ranks.
    Its vertices lie in $\[ u \, b \]$, by Lemma 7.
  The two arrows from $x$ to its relative atoms have distinct labels after applying $iota$.
    Let $Pi'$ be the plane of those two root labels. For each vertex in the next relative rank,
    the two paths through the atoms have the same plane by Lemma 7(3).
    Their remaining arrows therefore have labels in $Pi'$. Repeat this argument through the ranks.
    More explicitly, if the arrows into a two-vertex rank have labels in $Pi'$,
    choose a vertex of the preceding rank and form the two paths through these vertices to each vertex of the
    following rank. Their common plane is $Pi'$, so the next arrows also lie in that plane.
    This proves that all image vertices lie in one coset of $D' = D_(Pi')$.
  Consider an original pair of vertices with relative rank difference two.
    By Remark 9, exactly two ambient directed two-edge paths join them.
    Every intermediate vertex of such a path belongs to $\[ u \, b \]$,
    so graph preservation implies that their images also have exactly two ambient two-edge paths.
  In the target dihedral coset, the two-edge paths imply a positive even relative rank difference $r$.
    Lemma 8 gives exactly $r$ relative two-edge paths. All are ambient paths and lie in $\[ u' \, b' \]$;
    conversely, the common-plane property puts every ambient two-edge path for these endpoints in this coset.
    Thus $r = 2$. The two edges of any such path each have positive relative rank difference,
    so both have difference one.
  Every consecutive-rank edge of $\[ x \, c \]_D$ lies in a consecutive two-edge path, because $n gt.eq 2$.
    Hence every relative cover maps to a relative cover. The image endpoints have relative rank difference $n$,
    and the image contains two vertices in each internal relative rank.
    These exhaust the full target dihedral interval. The comparability and odd-gap criteria in Lemma 8 now show
    that the restricted map preserves and reflects the relative order and all reflection edges. ◻
]

Figure 1 illustrates the relative ranks and reflection edges preserved by the proposition.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-2, 3.272), [#text(size: 8pt)[relative#linebreak()rank]])
  content((-2, 0), [#text(size: 8pt)[$0$]])
  content((-2, 0.85), [#text(size: 8pt)[$1$]])
  content((-2, 1.7), [#text(size: 8pt)[$2$]])
  content((-2, 2.55), [#text(size: 8pt)[$3$]])
  content((0, 3.272), [#text(size: 8pt)[$[x,c]_D$]])
  circle((0, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, -0.03528), [$x$], anchor: "north")
  circle((-0.62, 0.85), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((-0.6553, 0.85), [$a_1$], anchor: "east")
  circle((0.62, 0.85), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0.6553, 0.85), [$a_2$], anchor: "west")
  circle((-0.62, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((-0.6553, 1.7), [$b_1$], anchor: "east")
  circle((0.62, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0.6553, 1.7), [$b_2$], anchor: "west")
  circle((0, 2.55), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((0, 2.585), [$c$], anchor: "south")
  line((0, 0), (-0.62, 0.85), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, 0), (0.62, 0.85), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-0.62, 0.85), (-0.62, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-0.62, 0.85), (0.62, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.62, 0.85), (-0.62, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.62, 0.85), (0.62, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-0.62, 1.7), (0, 2.55), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.62, 1.7), (0, 2.55), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  bezier((0, 0), (0, 2.55), (-1.65, 0.1275), (-1.65, 2.422), stroke: (thickness: 0.45pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((4.45, 3.272), [#text(size: 8pt)[$[ iota (x), iota (c)]_(D')$]])
  circle((4.45, 0), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((4.45, -0.03528), [$iota (x)$], anchor: "north")
  circle((3.83, 0.85), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.795, 0.85), [$iota (a_1)$], anchor: "east")
  circle((5.07, 0.85), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5.105, 0.85), [$iota (a_2)$], anchor: "west")
  circle((3.83, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((3.795, 1.7), [$iota (b_1)$], anchor: "east")
  circle((5.07, 1.7), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((5.105, 1.7), [$iota (b_2)$], anchor: "west")
  circle((4.45, 2.55), radius: 0.07982, fill: rgb("#000000"), stroke: none)
  content((4.45, 2.585), [$iota (c)$], anchor: "south")
  line((4.45, 0), (3.83, 0.85), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.45, 0), (5.07, 0.85), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.83, 0.85), (3.83, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.83, 0.85), (5.07, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.07, 0.85), (3.83, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.07, 0.85), (5.07, 1.7), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.83, 1.7), (4.45, 2.55), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.07, 1.7), (4.45, 2.55), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  bezier((4.45, 0), (4.45, 2.55), (7.05, 0.1275), (7.05, 2.422), stroke: (thickness: 0.45pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  line((1.5, 1.275), (2.8, 1.275), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.15, 1.275), [#text(size: 8pt)[$iota$]], anchor: "south", padding: 0.1176cm)
  content((2.05, -0.8925), [#text(size: 8pt)[$ell_D(z)- ell_D(x) = ell_(D')( iota (z))- ell_(D')( iota (x))$]])
})],
  caption: [Figure 1: Transport of a relative dihedral interval of rank three. Each internal relative rank contains two vertices. The eight solid relative covers give the rank-three instance of the closure rule in Theorem 10; the dashed arrow is the recovered reflection edge. The heights record relative rank differences, not ambient length differences, and a relative cover need not be an ambient cover. The restriction of $iota$ preserves these ranks and directed edges; no matching of root labels is asserted. ],
) <fig:dihedral-transport>

The proposition lets us count within an ordinary dihedral interval in the second system.
  The counts therefore depend on its genuine reflection order,
  even though the transported order need not be a reflection order in the first system. We now compute their difference.

=== 3.4 Later edges and the degree formula <later-edges-and-the-degree-formula>

We first describe the reflection labels in a dihedral group. Let $s \, t$ be its canonical generators.
  Index the identity by $0$, the alternating word of length $r$ beginning with $s$ by $r$,
  and the one beginning with $t$ by $- r$. For $I_2 \( m \)$ use the representatives $- m < i lt.eq
  m$ modulo $2 m$; the index $m$ is the longest element. For the infinite group use all integers.
  An integer model of the dihedral graph also appears in [19] Section 1.10. The length of $i$ is $\| i \|$.

Left multiplication by $s$ and $t$ sends $i$ to $1 - i$ and $- 1 - i$, respectively.
  The alternating palindromes with $2 n + 1$ letters beginning with $s$ and $t$ therefore act by $i mapsto a -
  i$ with parameters $a = 2 n + 1$ and $a = - \( 2 n + 1 \)$, respectively.
  These are all the reflections by Lemma 8, with parameters reduced modulo $2 m$ in finite type.
  Thus an arrow $i arrow.r j$ has reflection parameter $a = i + j$, its doubled midpoint.

#thm([Lemma 3.6.])[
  (Midpoint labels and their order).  #emph[Let $D = D_Pi$ be a maximal plane subgroup in either real realization,
    with canonical generators $s \, t$ and positive roots $alpha \, beta$.
    Choose $h$ positive on the ambient positive roots, as in Section 2,
    and put $kappa = - \( alpha \, beta \) \/ 2 gt.eq 0$. If $D = I_2 \( m \)$, then $kappa = cos \( pi \/ m \)$,
    and the angular order from $alpha$ to $beta$ lists the reflection parameters as
$ 1 prec 3 prec dots.h.c prec 2 m - 1 med \( mod med 2 m \) . $

 If $D$ is infinite, then $kappa gt.eq 1$, and that order is
$ 1 prec 3 prec 5 prec dots.h.c prec dots.h.c prec - 5 prec - 3 prec - 1 . $

 The geometric construction using $h$ gives this order or its reverse.]
] <dih:midpoint-order>

#proof[
  All ambient real roots have squared length $2$, since the action preserves the form and the simple roots have
    that length. Define
  $ p_0 = 0 \, wide p_1 = 1 \, wide p_(n + 1) = 2 kappa p_n - p_(n - 1) quad \( n gt.eq 1 \) . $
  For an alternating word of length $n + 1$, let $w_n$ be its prefix of length $n$ and $sigma_n$ its next letter,
    with $alpha_s = alpha$ and $alpha_t = beta$. The reflection formulas give, by induction,
    the two roots $w_n alpha_(sigma_n)$
  $ delta_n = p_(n + 1) alpha + p_n beta \, wide epsilon.alt_n = p_n alpha + p_(n + 1) beta $
  for the words beginning with $s$ and $t$, respectively. Their left labels $w_n sigma_n
    w_n^(- 1)$ are the alternating palindromes with parameters $2 n + 1$ and $- \( 2 n + 1 \)$.
  For $0 lt.eq n < m$ in finite type and every $n gt.eq 0$ in infinite type, the word of length $n +
    1$ is reduced. Its last relative cover is an ambient upward edge by Lemma 7.
    The sign criterion (2.1) then identifies $delta_n \, epsilon.alt_n$ as the positive ambient roots of their
    labels. Applying $h$ to both and adding gives
  $ p_(n + 1) + p_n > 0 $
  throughout those ranges.
  In finite type, the parameter $2 m - 1$ equals $- 1$ modulo $2 m$,
    so $delta_(m - 1)$ lies on the $beta$ line and $p_m = 0$.
    If $kappa gt.eq 1$, the recurrence instead gives $p_(n + 1) > p_n gt.eq 0$ by induction.
    Thus finite type has $kappa < 1$. Write $kappa = cos theta$ with $0 < theta lt.eq pi \/ 2$. Then
  $ p_n = frac(sin \( n theta \), sin theta) \, wide p_(n + 1) + p_n > 0 quad arrow.l.r.double quad
    sin #scale(x: 120%, y: 120%)[\(] \( n + 1 / 2 \) theta #scale(x: 120%, y: 120%)[\)] > 0 . $
  The equation $p_m = 0$ gives $m theta = j pi$ for a positive integer $j$.
    If $j gt.eq 2$, the first $n$ with $\( n + 1 / 2 \) theta gt.eq pi$ is less than $m$,
    and its angle lies in $\[ pi \, pi + theta \) subset.eq \[ pi \, 3 pi \/ 2 \]$.
    Its sine is nonpositive, a contradiction. Hence $j = 1$ and $kappa = cos \( pi \/ m \)$.
    In infinite type, $kappa < 1$ would give the same first sign crossing for some $n$,
    contradicting positivity for every $n$. Thus $kappa gt.eq 1$ there.
  The recurrence also gives $p_(n + 1)^2 - p_n p_(n + 2) = 1$ by induction.
    Therefore the slopes $r_n = p_n \/ p_(n + 1)$ of the $delta_n$ satisfy
  $ r_(n + 1) - r_n = frac(1, p_(n + 1) p_(n + 2)) > 0 $
  whenever the denominators are positive. In finite type, the sine formula makes these slopes increase from $0$ to
    $+ oo$, ending at $beta$; their parameters are all the odd residues $1 \, 3 \, dots.h \, 2 m - 1$.
    In infinite type, $p_(n + 1) > p_n gt.eq 0$, so the slopes of the $delta_n$ increase below $1$,
    while the reciprocal slopes of the $epsilon.alt_n$ decrease from $+ oo$ above $1$.
    The two families exhaust the reflections. Hence no other root intervenes,
    whether their limiting rays coincide or are distinct, and their slope order is the displayed positive string
    followed by the reversed negative string.
  Since $h \( alpha \) \, h \( beta \) > 0$, the normalized point $\( alpha + r beta \) \/
    h \( alpha + r beta \)$ moves monotonically along the affine line $h = 1$ as the slope $r$ increases.
    The functional $f$ in the geometric construction separates the endpoint rays,
    so $f \/ h$ gives this order or its reverse. ◻
]

Choose a reflection order in $W'$ and use its labels to schedule the edges of $\[ u \, b \]$:
  an edge is earlier when its image label is smaller. Edges with equal image labels are disjoint,
  so the upward edges at each fixed vertex are totally ordered without ties.
  If they are $e_1 \, dots.h \, e_r$ in increasing schedule order,
  their #emph[terminal portions] are the sets ${ e_i \, dots.h \, e_r }$ for $1 lt.eq i lt.eq r$,
  together with the empty set. If $e : x arrow.r y$ is an edge and its root belongs to a plane subgroup $D$, put

$ k_D \( e \) = frac(ell_D \( y \) - ell_D \( x \) - 1, 2) . $

This is a nonnegative integer by Lemmas 7 and 8. The following identity is the reason that a schedule transported
  from another interval suffices.

#thm([Lemma 3.7.])[
  (Later edges in a plane).  #emph[Let $D$ be a maximal dihedral plane subgroup containing the reflection that
    labels an edge $e : x arrow.r y$ of $\[ u \, b \]$. Suppose $y lt.eq_D c$ and $c in \[ u \, b \]$.
    Let $h_x \, h_y$ be the numbers of outgoing arrows from $x \, y$, respectively,
    in $\[ x \, c \]_D$ whose scheduled labels are strictly later than that of $e$. Then
#[#set math.equation(numbering: n => "(3.1)")
 $ h_x - h_y = k_D \( e \) . $ <eq:count>]

]
] <dih:count>

#proof[
  If $\[ x \, c \]_D$ has relative rank one, then $c = y$, and both sides vanish.
    Otherwise apply $iota$ using Proposition 11, then identify the target coset with its dihedral group by
    Lemma 7. The transported schedule is now the target label order, and the relative gaps are unchanged.
    By the definition of reflection order, this label order is one of the two angular orders in Lemma 12.
    Rename the resulting group and vertices $D \, x \, y \, c$, and use the integer indexing above.
    Lemma 8 says that $i arrow.r j$ is an arrow exactly when
  $ \| i \| < \| j \| quad upright("and") quad i - j med upright("is odd") . $
  We first use the order starting with $s$; the reversed order will follow from the count below.
  Write $i \, j$ for the indices of $x \, y$, and put
  $ L = \| i \| \, wide M = \| j \| \, wide C = ell_D \( c \) \, wide k = frac(M - L - 1, 2) . $
  We use the following midpoint comparison, which we verify after deriving the count.
    Every row concerns only an arrow that exists, so its endpoint has the required parity and greater absolute
    length. In the finite group $- m$ is omitted because $m$ already represents the longest element.
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[starting index
], table.cell(rowspan: 1, colspan: 1)[endpoint
], table.cell(rowspan: 1, colspan: 2, align: center)[label is later than that of $i arrow.r j$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$j = M > 0$
], table.cell(rowspan: 1, colspan: 1)[$j = - M < 0$
],
  table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[$+ r$, $r > L$
], table.cell(rowspan: 1, colspan: 1)[$r > M$
], table.cell(rowspan: 1, colspan: 1)[never
],
  table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[$- r$, $r > L$
], table.cell(rowspan: 1, colspan: 1)[always
], table.cell(rowspan: 1, colspan: 1)[$r < M$
],
  table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$+ r$, $r > M$
], table.cell(rowspan: 1, colspan: 1)[always
], table.cell(rowspan: 1, colspan: 1)[never
],
  table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$- r$, $r > M$
], table.cell(rowspan: 1, colspan: 1)[always
], table.cell(rowspan: 1, colspan: 1)[never
],
)
]
  Suppose first that $j = - M$. The table leaves precisely the negative endpoints in the eligible ranks strictly
    between $L$ and $M$. By Lemma 8, those vertices belong to $\[ x \, c \]_D$. Their ranks form the possibly empty list
  $ L + 1 \, L + 3 \, dots.h \, M - 2 \, $
  which has $k$ entries. The table gives no later outgoing arrow at $j$, so $h_x - h_y = k$.
  Now suppose that $j = M$. The same $k$ negative endpoints below rank $M$ contribute at $i$.
    If $c = y$, there are no further contributions. If $C > M$, the opposite endpoint $-
    j$ is an internal vertex and contributes one more later arrow at $i$.
    In the finite case $C > M$ implies $M < m$, so this endpoint is represented. Put $H = C - M$.
    Above rank $M$, all outgoing arrows from either $i$ or $j$ are later.
    At an internal rank $M + t$, the parity condition permits arrows from $i$ when $t$ is even and from $j$ when
    $t$ is odd. The two vertices there therefore contribute $2 \( - 1 \)^t$ to $h_x - h_y$,
    while the singleton top contributes $\( - 1 \)^H$. The total contribution above rank $M$ is
  $ 2 sum_(t = 1)^(H - 1) \( - 1 \)^t + \( - 1 \)^H = - 1 . $
  It cancels the extra arrow to $- j$, leaving $h_x - h_y = k$.
  For the reversed angular order, Lemma 8 shows that the number of outgoing edges at $a$ in $\[ a \, c \]_D$
    equals $ell_D \( c \) - ell_D \( a \)$: each eligible internal rank contributes two vertices,
    and the singleton top contributes when this difference is odd.
    The outgoing edges at $y$ in $\[ x \, c \]_D$ are exactly those in $\[ y \, c \]_D$,
    so the total outgoing-edge counts at $x$ and $y$ differ by $2 k + 1$.
    The edge $e$ contributes one at $x$ and none at $y$, and no other edge incident to $x$ or $y$ has its label.
    Removing it and the later arrows leaves an earlier-arrow difference of $\( 2 k + 1 \) - 1 - k = k$.
    Those arrows are later in the reversed order.
  It remains to verify the midpoint table. In the infinite group, $r > \| i \|$ implies $i + r > 0$ and $i -
    r < 0$, while the sign of $i + j$ is the sign of $j$. The positive midpoint block precedes the negative block,
    and each block is ordered by the ordinary integer order. Comparing $i + r$ and $i - r$ with $i +
    j$ gives the two rows starting at $i$. For arrows from $j$, use $r > M > \| i \|$.
    If $j = M$, the positive midpoint $M + r$ exceeds $i + M$ and the negative midpoint lies in the later block.
    If $j = - M$, the positive midpoint lies in the earlier block and the negative midpoint $- M -
    r$ is smaller than $i - M$. This gives the other two rows.
  In the finite group, a negative midpoint $a$ is represented by $2 m + a$.
    Comparisons inside one block are unchanged. For a cross-block arrow from $i$ when $j = M$,
    the negative endpoint $- r$ is later because
  $ 2 m + i - r > i + M $
  is equivalent to $r + M < 2 m$. This is strict since $r lt.eq m -
    1$ for a represented negative endpoint and $M lt.eq m$. When $j = - M$,
    a positive endpoint could be later only if $r + M > 2 m$, which is impossible since $r lt.eq m$ and $M lt.eq m - 1$.
  For arrows starting at $j = M$, the two possible midpoint residues $M + r$ and $2 m + M - r$ exceed $i + M$:
    the first inequality follows from $r > \| i \|$, and the second from $2 m - r > i$, using $r lt.eq
    m$ and $i < m$. For arrows starting at $j = - M$, the residues $r - M$ and $2 m - M -
    r$ are smaller than $2 m + i - M$: these are respectively $r < 2 m + i$, using $r lt.eq m$ and $i > - m$,
    and $- r < i$, using $r > \| i \|$. These inequalities include the possible longest endpoint,
    so the table has no wrap-around exception. This completes its verification and the proof. ◻
]

The following identity appears in [19] equation (1.11.2), with the Bruhat orientation reversed.
  We give an inversion-set proof in the present conventions.

#thm([Lemma 3.8.])[
  (Sum of the planar contributions).  #emph[For every arrow $e : x arrow.r y$,
    the sum over distinct root planes containing its label satisfies
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_D k_D \( e \) = frac(d \( x \, y \) - 1, 2) . $ <eq:sum>]

 Only finitely many summands are nonzero.]
] <dih:sum>

#proof[
  Let $alpha$ be the positive root of $e$, so that $y = r_alpha x$. For every positive root $gamma$, set
  $ epsilon \( gamma \) = upright(bold(1))_({ y^(- 1) gamma < 0 }) - upright(bold(1))_({ x^(- 1) gamma < 0 }) . $
  The two ambient inversion sets are finite, so $epsilon$ has finite support and
  $ sum_(gamma in Phi^(+)) epsilon \( gamma \) = ell \( y \) - ell \( x \) = d \( x \, y \) . $
  The direction of the arrow gives $x^(- 1) alpha > 0$ and $y^(- 1) alpha < 0$, hence $epsilon \( alpha \) = 1$.
  Partition the positive roots other than $alpha$ according to their planes $Pi = "span" \( alpha \, gamma \)$.
    By the relative inversion formula in Lemma 7, the contribution of all positive roots in such a plane is
  $ sum_(gamma in Phi_D^(+)) epsilon \( gamma \) = ell_D \( y \) - ell_D \( x \) = 2 k_D \( e \) + 1 . $
  Removing $alpha$ leaves the contribution $2 k_D \( e \)$.
    These contributions are nonnegative, and only finitely many can be nonzero,
    because each nonzero one meets the finite support of $epsilon$ away from $alpha$.
    Summing the disjoint parts now gives
  $ d \( x \, y \) - 1 = sum_D 2 k_D \( e \) \, $
  as required. If there is no root independent of $alpha$, the sum is empty and the same identity follows directly
    from the ambient inversion count. ◻
]

== 4 Localization at a root plane <sec:localization>

We now establish the local description needed for the edge comparison.
  Localization along reflection-subgroup cosets appears in Dyer’s nil-Hecke and projective-module approach to
  Schubert singularities [19] Sections 1.7–1.9 and 3.16. Here we prove the precise decomposition for the
  moment-graph sheaf and its actual edge maps. The key point is that localization leaves a dihedral moment graph,
  and on that graph every indecomposable Braden–MacPherson sheaf is a structure sheaf.
  We will also prove the resulting direct-sum decomposition over the local coefficient ring;
  no preservation of indecomposability under localization is asserted or needed.

Throughout this section, $A$ is the polynomial ring of the real realization fixed in Lemma 2,
  with roots in degree one. The sheaf $B$ has top $b$ and is supported on $\[ 1 \, b \]$.
  Its stalks and edge modules are denoted by $B^a$ and $B^e$, respectively.
  We use the generation, flabbiness, and upper-end quotient properties from Theorem 4,
  with the normalization of Proposition 5.

=== 4.1 Dihedral structure sheaves <dihedral-structure-sheaves>

We first record the elementary polynomial calculation that will identify the dihedral models.

#thm([Lemma 4.1.])[
  (Dihedral Kazhdan–Lusztig polynomials).  #emph[Let $D$ be a finite or infinite dihedral Coxeter group.
    For all $a lt.eq_D c$,
$ P_(a \, c)^D \( q \) = 1 . $

]
] <loc:dihedral-kl>

#proof[
  Use the Hecke algebra convention $\( T_s + 1 \) \( T_s - q \) = 0$.
    The bar involution sends $q^(1 \/ 2)$ to $q^(- 1 \/ 2)$ and $T_s$ to $T_s^(- 1)$ for each simple generator,
    preserving products. For $w in D$, put
  $ C_w^compose = q^(- ell_D \( w \) \/ 2) sum_(z lt.eq_D w) T_z . $
  We prove that these elements are bar invariant. This is immediate for $w = 1$ and for a simple reflection.
    Let $w$ have an alternating reduced expression starting with $s$, and set $n = ell_D \( w \) gt.eq 2$. We claim that
  #[#set math.equation(numbering: n => "(4.1)")
   $ C_s^compose C_(s w)^compose =
     cases(delim: "{", C_w^compose \, & n = 2 \,, C_w^compose + C_p^compose \, & n > 2 \,) $ <loc:dihedral-product>]
  where $p$ is the prefix of length $n - 2$ of the chosen expression for $w$.
  To check this, partition $D$ into left $s$-strings ${ r \, s r }$ with $ell_D \( s r \) = ell_D \( r \) + 1$.
    A lower interval cannot contain $s r$ without containing $r$. If only $r$ is present in $\[ 1 \, s w \]_D$, then
  $ \( 1 + T_s \) T_r = T_r + T_(s r) . $
  If both elements are present, the quadratic relation gives
  $ \( 1 + T_s \) \( T_r + T_(s r) \) = \( 1 + q \) \( T_r + T_(s r) \) . $
  The strings that meet $\[ 1 \, s w \]_D$ have union $\[ 1 \, w \]_D$.
    There are no doubly included strings when $n = 2$. When $n > 2$, their union is $\[ 1 \, p \]_D$:
    both alternating words occur in every length below $n - 2$, and the unique element of length $n -
    2$ in this union is the prefix $p$. This is also valid when $w$ is the longest element of a finite dihedral
    group. Consequently
  $ \( 1 + T_s \) sum_(z lt.eq_D s w) T_z = sum_(z lt.eq_D w) T_z +
    cases(delim: "{", 0 \, & n = 2 \,, q sum_(z lt.eq_D p) T_z \, & n > 2 .) $
  Multiplication by $q^(- n \/ 2)$ proves (4.1). Induction now proves bar invariance of $C_w^compose$.
  Relative to the normalized standard basis ${ q^(- ell_D \( z \) \/ 2) T_z : z in D }$,
    the leading coefficient of $C_w^compose$ is $1$, and its lower coefficients are
  $ q^(- \( ell_D \( w \) - ell_D \( z \) \) \/ 2) in q^(- 1 \/ 2) bb(Z) \[ q^(- 1 \/ 2) \] wide \( z <_D w \) . $
  Bar invariance and the triangular characterization therefore give
  $ C_w^compose = q^(- ell_D \( w \) \/ 2) sum_(z lt.eq_D w) P_(z \, w)^D \( q \) T_z . $
  Comparison of coefficients proves the lemma. ◻
]

Let $Pi$ be a plane spanned by two independent roots, and let $D$ be its maximal dihedral reflection subgroup.
  We always use the canonical positive roots of $D$ induced from the ambient system and the relative order on each
  coset from Lemma 7. The associated reflection-subgroup description is valid for arbitrary Coxeter systems by
  Lemma 7; Dyer’s finite-setting treatment is a predecessor [17].
  For a coset $C$ and a vertex $c in C$, define a sheaf $cal(O)_c$ on the relative dihedral graph of $C$ by

$ cal(O)_c^a = cases(delim: "{", A \, & a lt.eq_D c \,, 0 \, & a lt.eq.not_D c .) $

On an edge whose two endpoints lie below $c$, its module is $A \/ \( alpha_e \)$ and both restrictions are the
  quotient map. On every other edge its module is zero. This is consistent with the upper-end quotient rule
  because its support is a relative lower ideal.

#thm([Lemma 4.2.])[
  (Dihedral models in the induced realization).  #emph[The Braden–MacPherson sheaf with top $c$ on the relative
    dihedral graph of $C$, normalized to have top stalk $A$ in degree zero, is isomorphic to $cal(O)_c$.
    In particular $cal(O)_c$ is generated at its stalks by sections and is flabby for relative upper sets.
    The statement uses the actual ambient root labels, including when $D$ is infinite and its induced
    representation is not the standard geometric representation of an infinite dihedral group.]
] <loc:models>

#proof[
  We first justify the character theorem for precisely this realization.
    Restrict the ambient finite-dimensional representation to $D$. It is faithful.
    Every reflection of $D$ has rank-one change from the identity.
    Conversely, suppose an element $d in D$ has rank-one change.
    Ambient reflection faithfulness implies that $d$ is an ambient reflection.
    The image of $d - 1$ lies in $Pi$, since this is true for every product of reflections whose roots lie in
    $Pi$. Its root therefore lies in $Pi$, and the maximal plane-subgroup description makes it a reflection of
    $D$. The restricted representation is consequently reflection faithful.
  If $D$ is finite of type $I_2 \( m \)$, its normalized canonical simple roots have Gram matrix with diagonal
    entries one and off-diagonal entries $- cos \( pi \/ m \)$ by Lemma 12.
    Its root plane is therefore positive definite and carries the usual real dihedral reflection representation.
    The nondegenerate ambient space splits into this plane and its orthogonal complement,
    and $D$ fixes the latter pointwise. The real Soergel character theorem therefore applies to the plane
    representation [20]; adjoining the fixed polynomial directions preserves the character formula and the
    Braden–MacPherson construction. Indeed the relevant kernels and images commute with this flat polynomial
    extension, and graded minimal free covers remain minimal.
  If $D$ is infinite, it is a universal Coxeter system of rank two.
    Fiebig’s universal-group character theorem applies under its standing reflection-faithful hypotheses and orbit
    choices [23] Definition 2.1, Sections 2 and 5, and Theorem 9.3.
    These requirements hold for the restricted real representation.
    A regular orbit exists by avoiding the countable union of proper fixed subspaces.
    The required simple-subregular orbits exist by the generic-hyperplane argument in Lemma 2,
    applied to the restricted orthogonal representation. In particular,
    no assertion that its simple-root pairing is the geometric pairing is needed.
    The moment-graph identification and duality give the same stalk normalization as above [23] Corollary 6.5 and
    Proposition 7.1(4).
  The coset identification preserves the relative orientation and the left root labels,
    so these statements apply on $C$. Lemma 15 and the stalk character formula now show that every stalk below $c$
    is $A$ with a generator in degree zero. Every nonzero edge module is likewise $A \/ \( alpha_e \)$ with its
    generator in degree zero.
  Choose a homogeneous global section extending the generator at $c$.
    We show that its value at every vertex of $\[ m \, c \]_D$ is a generator,
    where $m$ is the relative minimum of $C$. Descend along any path from $c$ to the chosen vertex.
    If its value at the upper endpoint of an edge is a nonzero degree-zero generator,
    its restriction to that edge is nonzero, by the upper-end quotient rule.
    Compatibility forces the section value at the lower endpoint to be nonzero.
    Since that stalk is a rank-one free module generated in degree zero,
    a nonzero homogeneous value of degree zero is again a generator.
    This proves the assertion along the path, and every vertex below $c$ lies on such a path.
  Use these section values as the generators of the vertex stalks,
    and use their common restrictions as the generators of the edge modules.
    Both maps at every supported edge are then the quotient map. This identifies the sheaf with $cal(O)_c$.
    Generation and flabbiness are properties of the Braden–MacPherson sheaf, so they hold for this model. ◻
]

=== 4.2 Relative flabbiness after localization <relative-flabbiness-after-localization>

Let $frak(p) subset A$ be the prime ideal generated by the plane $Pi$, and put

$ R = A_(frak(p)) \, wide frak(m) = frak(p) R \, wide B_R = B ⊗_A R . $

The ring $R$ is a regular local unique factorization domain of dimension two. We regard its sheaves as ungraded.
  An edge module of $B_R$ vanishes unless its label lies in $Pi$: any other label becomes a unit.
  The surviving edges thus lie inside the cosets of $D$.

Fix such a coset $C$ and write

$ K = C ∩ \[ 1 \, b \] . $

This is a finite relative lower ideal. Indeed, if $a lt.eq_D c$ with $c in K$,
  every relative upward edge is also an ambient upward edge, so $a lt.eq c lt.eq
  b$ in the ambient order and hence $a in K$. This uses only the implication from relative to ambient
  comparability; the two orders on the coset need not coincide.

#thm([Lemma 4.3.])[
  #emph[The restriction $B_R \|_K$ has free stalks, the upper-end quotient rule,
    generation at each stalk by sections, and flabbiness for upper sets in the relative dihedral order.]
] <loc:relative-flabbiness>

#proof[
  Freeness and the quotient rule persist under localization.
    The graph on $\[ 1 \, b \]$ is finite, and its section module is the kernel of a map between finite direct
    sums of stalk and edge modules. Formation of sections therefore commutes with flat localization.
    In particular, ambient flabbiness and generation at stalks persist.
    Restricting a global section to $K$ proves generation there.
  To prove relative flabbiness, let $J subset.eq K$ be a relative upper set and prescribe a section on $J$.
    Regard $J$ as a subset of $\[ 1 \, b \]$. It is upper closed under all surviving edges:
    those edges stay in $C$, and their orientations agree with the relative dihedral graph.
    We extend the section by adding missing vertices in decreasing ambient order.
  When a missing vertex $a$ is added, all ambient vertices strictly above $a$ are already present. Put
  $ Omega_a = { z in \[ 1 \, b \] : a < z } . $
  This is an ambient upper set. Ambient flabbiness extends the restriction of the prescribed section to $Omega_a$;
    use the resulting value at $a$. It is compatible with every already prescribed upper neighbor.
    An already prescribed lower neighbor $z$ cannot be joined to $a$ by a surviving edge:
    upper closure under surviving edges would have required $a$ to be present already.
    Edges with zero modules impose no condition. Consequently the chosen value at $a$ is compatible with every
    previous value. Moreover, the enlarged set is still upper closed under surviving edges,
    since all vertices above $a$ are present. The finite induction extends the original section to $\[ 1 \, b \]$.
    Restriction to $K$ proves the required surjectivity. ◻
]

For $c in K$, write $cal(O)_(c \, R)$ for the model in Lemma 16 with coefficients localized to $R$,
  restricted to $K$. It is supported on the full relative lower interval $\[ m \, c \]_D$, which lies in $K$.
  These models retain generation and relative flabbiness. To see the latter directly,
  a relative upper subset of $K$ has the same intersection with $\[ m \, c \]_D$ as its upward closure in the full
  coset. A section on that subset extends by zero to this upward closure outside the model’s support,
  and then extends by the flabbiness in Lemma 16. Restrict the resulting section to $K$.
  Localization commutes with these finite-support section conditions.

=== 4.3 The decomposition over the local ring <the-decomposition-over-the-local-ring>

Braden and MacPherson decompose pure sheaves by descending through the vertices and splitting each free stalk over
  the image of sections above it [6] Theorem 1.4. The next proposition carries out this descent over the ungraded
  local ring $R$, retaining both endpoint restrictions on every edge.

#thm([Proposition 4.4.])[
  (Plane localization).  #emph[For each coset $C$ with $K = C ∩ \[ 1 \, b \] eq.not diameter$,
    there are nonnegative integers $m_c$, indexed by $c in K$, such that
$ B_R \|_K tilde.equiv xor.big_(c in K) cal(O)_(c \, R)^(xor m_c) $

 as ungraded sheaves over $R$.]
] <loc:decomposition>

#proof[
  We construct an isomorphism in descending relative order.
    Suppose the sheaf has already been identified above a vertex $a$ with a sum of the models in the statement.
    More precisely, take any descending linear extension of the finite poset $K$;
    the isomorphism has been constructed on all previously processed vertices and on edges between them.
    All relative upper neighbors of $a$ have already been processed.
  Let $E_a$ be the set of relative upward edges from $a$ in $K$ and let $K_(> a) = { y in K : a <_D y }$.
    Define the boundary image
  $ N_a = "im" (Gamma \( K_(> a) \, B_R \) arrow.r xor.big_(e in E_a) B_R^e) \, $
  where the map restricts a section from the upper endpoint of each edge. The image of the stalk map
  $ phi : B_R^a arrow.r xor.big_(e in E_a) B_R^e $
  is exactly $N_a$. For one inclusion, generation at $a$ extends any stalk value to a section,
    whose upper restriction gives its boundary value. For the other,
    relative flabbiness extends any section on $K_(> a)$ to $K$,
    producing a preimage of its boundary value at $a$. Thus $phi$ is a surjection from the free stalk $B_R^a$ onto
    $N_a$.
  We will show that the stalks of the models already constructed above $a$ give a free cover of $N_a$ which is an
    isomorphism modulo $frak(m)$. Splitting the given stalk through this cover will leave a free summand with zero
    boundary map. That summand will supply the models with top $a$.
  The edge modules immediately above $a$, together with their upper restriction maps, are already identified:
    the upper-end quotient rule identifies each with its upper stalk modulo the corresponding label.
    Hence the isomorphism already constructed above $a$ also identifies $N_a$ with the boundary image for the sum
    of the existing models. Only models with top $c >_D a$ contribute to this image.
    Models whose tops are not above $a$ have neither a stalk at $a$ nor a nonzero edge module immediately above it.
  Consider one contributing copy with top $c$. Let $E_(a \, c)$ be its upward edges at $a$ whose upper endpoints
    are at most $c$ in relative order. This set is nonempty. Its stalk map is
  $ R arrow.r xor.big_(e in E_(a \, c)) R \/ \( alpha_e \) . $
  Distinct labels at a vertex are nonassociate irreducibles in $R$. Consequently its kernel is
  #[#set math.equation(numbering: n => "(4.2)")
   $ ⋂_(e in E_(a \, c)) alpha_e R = p_(a \, c) R \, wide p_(a \, c) =
     product_(e in E_(a \, c)) alpha_e . $ <loc:boundary-product>]
  The boundary image of this model is therefore $R \/ \( p_(a \, c) \)$.
    Here we use its generation and flabbiness, as above, to identify the stalk image with the boundary image
    coming from sections above $a$. Since all the labels lie in $frak(m)$ and $E_(a \, c)$ is nonempty,
    $p_(a \, c) in frak(m)$. Thus
  $ R arrow.r R \/ \( p_(a \, c) \) $
  is a minimal free cover: reduction modulo $frak(m)$ is an isomorphism.
  The section and boundary maps of a finite direct sum split componentwise.
    Taking the sum of the existing model stalks at $a$ therefore gives a free module $P_a$ and a surjection
  $ pi : P_a arrow.r N_a $
  whose reduction modulo $frak(m)$ is an isomorphism. If no model contributes,
    both $P_a$ and $N_a$ are zero and the same argument applies.
  We now split the given stalk by an explicit lift. Because $B_R^a$ is free and $pi$ is surjective, there exists
  $ g : B_R^a arrow.r P_a \, wide pi g = phi . $
  Modulo $frak(m)$, the map $pi$ is an isomorphism and $phi$ is surjective, so $g$ is surjective modulo $frak(m)$.
    Nakayama’s lemma applied to its finitely generated cokernel implies that $g$ is surjective.
    Since $P_a$ is free, $g$ splits. We obtain
  $ B_R^a tilde.equiv P_a xor Q_a \, wide phi = \( pi \, 0 \) \, $
  where $Q_a = ker g$ is finite projective and therefore free over the local ring $R$.
  The factor $P_a$ extends the isomorphism for the existing models to the stalk at $a$ and all its upward
    restrictions. Add one copy of $cal(O)_(a \, R)$ for each basis element of $Q_a$.
    These new models have zero outgoing edge maps at their top and vanish at every previously processed vertex.
    Thus they realize the factor $Q_a$ without changing any previously constructed data.
    The incoming edge modules will be identified when their lower endpoints are processed,
    using the upper-end quotient rule. This completes the descending induction and proves the decomposition. ◻
]

#prodef([Remark 4.5.])[
  The decomposition concerns the sheaf itself and does not depend on any ordering of its edges.
    In a summand $cal(O)_(c \, R)$ with $a lt.eq_D c$, the kernel conditions for any subset $F$ of upward edges at
    $a$ impose exactly
  $ L_a \( F \) = (product_(e in F\
upright("upper endpoint of ") e med lt.eq_D c) alpha_e) R \, $
  with the empty product equal to one. Edges outside the support have zero modules and impose no condition.
    This identity is simply the unique-factorization calculation in (4.2);
    in particular it is valid for an edge order transported from another Coxeter system.
] <loc:arbitrary-edge-subsets>

== 5 Comparison of edge images <sec:edge>

The local models of Section 4 now give an inclusion between the two endpoint images of an edge.
  We prove only an inclusion here, under freeness at the upper endpoint;
  Section 6 will force equality and supply the remaining freeness.

Fix an interval isomorphism

$ iota : \[ u \, b \] arrow.r \[ u' \, b' \] $

and a geometric reflection order in the second system. By Theorem 10,
  it orders the edges of the first interval through their images under $iota$.
  We call this the #emph[transported schedule]. Order edges with equal labels arbitrarily.
  Such edges share no vertex, since a reflection acts as an involution without fixed vertices on its incident
  pairs. In particular, the schedule totally orders the upward edges at each fixed vertex.

Work with $B \( b \)$ over $A$. By Remark 6, every upward edge at $x
  in \[ u \, b \]$ already lies in this interval, so the same sets $U_x$ and kernels $L_x \( F \)$ are used here.

We first isolate the commutative-algebra fact used in the comparison.

#thm([Lemma 5.1.])[
  #emph[Let $C$ be a polynomial ring over a field, let $E$ be a finite free $C$-module,
    and let $M subset.eq E$ be a free submodule with the same span over $K = "Frac" \( C \)$. Then, inside $E ⊗_C K$,
$ M = ⋂_(frak(p) subset C\
"ht" frak(p) = 1) M_(frak(p)) . $

 If $C$ is a field, the same conclusion means $M = E$.]
] <edge:lattice>

#proof[
  Choose a $C$-basis of $M$, which is also a $K$-basis of $E ⊗_C K$.
    A vector in the intersection has coordinates in $⋂_("ht" frak(p) = 1) C_(frak(p)) = C$.
    For completeness, write a coordinate as a quotient of coprime polynomials.
    Any nonconstant irreducible divisor of the denominator defines a height-one prime at which the quotient does
    not belong to the local ring. The denominator must therefore be a unit. ◻
]

#thm([Proposition 5.2.])[
  (Edge-image bound).  #emph[Let $e : x arrow.r y$ be an edge.
    Let $F subset U_x$ and $G subset U_y$ consist of the upward edges strictly later than $e$ in the transported
    schedule. Put
$ C = A \/ \( alpha_e \) \, wide I = "res"_(x \, e) L_x \( F \) \, wide J = "res"_(y \, e) L_y \( G \) quad
  upright("inside ") B^e . $

 If $L_y \( G \)$ is graded free over $A$, there is a nonzero homogeneous $f_e in C$ such that
#[#set math.equation(numbering: n => "(5.1)")
 $ I subset.eq f_e J \, wide deg f_e = frac(d \( x \, y \) - 1, 2) . $ <eq:edge-bound>]

 Moreover $J$, and hence $f_e J$, is graded free over $C$.]
] <edge:bound>

#proof[
  Write $alpha = alpha_e$ and $L = L_y \( G \)$. For every $g in G$,
    the label $alpha_g$ is not proportional to $alpha$: distinct reflections incident to a vertex have distinct
    root lines. The module $B^g$ is free over $A \/ \( alpha_g \)$.
    Multiplication by $alpha$ is consequently injective on $B^g$.
    Applying this observation to all kernel conditions gives
  $ L ∩ alpha B^y = alpha L \, wide J tilde.eq L \/ alpha L . $
  Indeed, if $alpha v in L$, all restrictions of $v$ along $G$ vanish by that injectivity.
    The asserted freeness of $J$ follows.
  There is also no loss of generic rank. For $p_G = product_(g in G) alpha_g$, with the empty product equal to $1$,
  $ p_G B^y subset.eq L \, wide overline(p)_G B^e subset.eq J subset.eq B^e . $
  The element $overline(p)_G$ is nonzero in $C$. Thus $J$ spans $B^e$ over $"Frac" \( C \)$.
  For every root plane $Pi$ containing $alpha$, write $D_Pi$ for its maximal dihedral subgroup and put
  $ k_Pi = frac(ell_(D_Pi) \( y \) - ell_(D_Pi) \( x \) - 1, 2) . $
  These are nonnegative integers. By Lemma 14, only finitely many are nonzero and
  $ sum_Pi k_Pi = frac(d \( x \, y \) - 1, 2) . $
  Choose a root $beta_Pi in Pi$ independent of $alpha$ whenever $k_Pi > 0$, and define
  $ f_e = product_(k_Pi > 0) overline(beta_Pi)^(thin k_Pi) in C . $
  Different planes yield nonproportional reduced linear forms.
    This is a nonzero homogeneous element of the required degree.
  The target $f_e J$ is a free $C$-module of full generic rank in $B^e$.
    If $C$ is a field, it equals $B^e$, and the inclusion is immediate.
    Otherwise Lemma 20 reduces the inclusion to height-one primes of $C$.
    At a prime containing no nonzero reduced root label, all factors in $overline(p)_G$ and $f_e$ are units.
    Then $J = B^e = f_e J$ locally, and there is nothing to prove.
    Every remaining height-one prime has the form $frak(q) = \( overline(beta) \)$,
    where $beta$ is a root independent of $alpha$. Its inverse image in $A$ is the plane prime
    $frak(d) = \( alpha \, beta \)$. Put
  $ Pi = "span" \( alpha \, beta \) \, wide R = A_(frak(d)) \, wide overline(R) =
    R \/ \( alpha \) tilde.equiv C_(frak(q)) . $
  The ring $overline(R)$ is a discrete valuation ring. Every root in $Pi$ not proportional to $alpha$ reduces to a
    uniformizer times a unit. Write $I_(frak(q))$ and $J_(frak(q))$ for the localized images in $B^e ⊗_C overline(R)$.
  Let $K = D_Pi x ∩ \[ 1 \, b \]$, and choose the sheaf isomorphism
  $ psi : B_R \|_K arrow.r xor.big_(c in K) cal(O)_(c \, R)^(xor m_c) $
  from Proposition 18. The edge $e$ is supported in a model with top $c$ exactly when $y lt.eq_(D_Pi) c$.
    Thus the edge component of $psi$ is an $overline(R)$-linear isomorphism
  $ psi_e : B^e ⊗_C overline(R) arrow.r xor.big_(c in K\
y lt.eq_(D_Pi) c) overline(R)^(xor m_c) . $
  The definitions of $L_x \( F \)$ and $L_y \( G \)$ are finite kernel conditions,
    and their restrictions to $e$ define $I$ and $J$ as images.
    Flat localization commutes with these kernels and images.
    The localized modules of edges outside $Pi$ are zero, so those conditions disappear.
    Because $psi$ intertwines every restriction map, its vertex components carry these localized kernels to the
    direct sums of the corresponding model kernels. Its single edge component $psi_e$ then carries both
    $I_(frak(q))$ and $J_(frak(q))$ to the corresponding direct sums of model images.
    Denote their ideals in a copy with top $c$ by $I_c \, J_c subset.eq overline(R)$.
  For this copy, the full relative interval $\[ x \, c \]_(D_Pi)$ lies in $\[ u \, b \]$:
    relative paths are ambient paths, with $x gt.eq u$ and $c lt.eq b$.
    By Remark 19, the kernel at either endpoint is generated by the product of the labels of its later supported
    outgoing edges.
  None of these labels is proportional to $alpha$, so every factor reduces to a uniformizer times a unit.
    The valuations of $I_c$ and $J_c$ are therefore the later-edge counts $h_x$ and $h_y$ in
    $\[ x \, c \]_(D_Pi)$. Lemma 13 gives $h_x - h_y = k_Pi$.
    At $frak(q)$, the element $f_e$ has valuation $k_Pi$: all other plane contributions are units,
    and the contribution from $Pi$ is the unit $1$ when $k_Pi = 0$. Hence $I_c = f_e J_c$.
  This equality holds in every supported copy. Since $psi_e$ is $overline(R)$-linear, it gives
  $ psi_e \( I_(frak(q)) \) = f_e psi_e \( J_(frak(q)) \) = psi_e \( f_e J_(frak(q)) \) \, $
  and thus $I_(frak(q)) = f_e J_(frak(q))$ as embedded submodules of the original localized edge module.
    Only $overline(R)$-linearity is used here, so the ungraded sheaf decomposition suffices.
  We have proved $I_(frak(q)) subset.eq f_e J_(frak(q))$ at every height-one prime.
    Lemma 20 gives $I subset.eq f_e J$ globally. The original maps and $f_e$ are homogeneous,
    so the inclusion is graded. ◻
]

#prodef([Remark 5.3.])[
  The argument tests membership in the free #emph[target] $f_e J$.
    It makes no reflexivity assumption on $I$, and does not infer global equality from equality at height one.
    A quotient $\( f_e J \) \/ I$ supported in higher codimension could still exist at this stage.
    It will be eliminated by the equality argument below.
] <edge:codimension>

== 6 Reciprocity and the simultaneous induction <sec:induction>

We prove Theorem 1 together with the following statement:

#quote(block: true)[
  For every interval isomorphism and every transported schedule,
    the modules $L_u \( F \)$ are graded free over $A$ for all terminal portions $F$ of the upward edges at the
    bottom vertex $u$.
]

The statement includes the empty terminal portion and the full set.
  It is quantified over both systems, so we may also interchange them.

Induct on $d \( u \, b \)$. The statement is quantified over all choices of ambient systems and realizations as
  above. Within each comparison, keep those data and the sheaf $B \( b \)$ fixed:
  passage to $\[ y \, b \]$ changes only the bottom vertex.
  For rank zero the polynomial is $1$, there are no edges, and the only kernel is the free top stalk.
  Suppose now that $d \( u \, b \) > 0$. For every $y > u$,
  restriction of $iota$ gives an isomorphism $\[ y \, b \] tilde.equiv \[ iota \( y \) \, b' \]$ of smaller rank.
  Restriction of the same reflection order gives exactly the schedule on its edges.
  The induction hypothesis therefore supplies both polynomial equality at $y$ and freeness for every terminal
  upward kernel at $y$. In particular, the hypothesis of Proposition 21 is available at the upper endpoint of
  every edge in $\[ u \, b \]$. No partial-kernel freeness at $u$ is assumed.

Figure 2 records how these two induction hypotheses lead to the bottom assertions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.053cm, inset: (x: 0.1764cm, y: 0.1411cm), radius: 1.5pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Upper terminal kernels are free#linebreak()at every $y>u$, in both systems.]]])])
  content((6.753, 0), [#box(width: 6.053cm, inset: (x: 0.1764cm, y: 0.1411cm), radius: 1.5pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Upper polynomials agree#linebreak()$P_(y,b)=P'_( iota (y),b')$ for every $y>u$.]]])])
  content((0, -1.9), [#box(width: 6.053cm, inset: (x: 0.1764cm, y: 0.1411cm), radius: 1.5pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Hilbert comparison#linebreak()The inclusion $I subset.eq f_"eJ"$ bounds each increase in Hilbert series.]]])])
  content((6.753, -1.9), [#box(width: 6.053cm, inset: (x: 0.1764cm, y: 0.1411cm), radius: 1.5pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Reciprocity and cancellation#linebreak()Cancel the upper terms; compare in both directions.]]])])
  line((-3.026, -2.7), (9.779, -2.7), stroke: none)
  content((3.376, -3.778), [#box(width: 12.8cm, inset: (x: 0.1764cm, y: 0.1411cm), radius: 1.5pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Polynomial equality at the bottom#linebreak()The strict degree bound gives $P_(u,b)=P'_(u',b')$.]]])])
  content((3.376, -5.233), [#box(width: 12.8cm, inset: (x: 0.1764cm, y: 0.1411cm), radius: 1.5pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Equality of all edge images#linebreak()Exact endpoint comparison forces every bound to be attained: $I=f_"eJ"$.]]])])
  content((3.376, -6.694), [#box(width: 12.8cm, inset: (x: 0.1764cm, y: 0.1411cm), radius: 1.5pt, stroke: (paint: rgb("#595959"), thickness: 0.45pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Bottom terminal kernels are free#linebreak()Reverse the bottom schedule, starting from $L_u( nothing )=B^u$.]]])])
  line((0, -0.6), (0, -1.1), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, width: 0.14cm, fill: black)))
  line((6.753, -0.6), (6.753, -1.1), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, width: 0.14cm, fill: black)))
  line((3.026, -1.9), (3.726, -1.9), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, width: 0.14cm, fill: black)))
  line((6.753, -2.7), (6.753, -3.3), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, width: 0.14cm, fill: black)))
  line((3.376, -4.257), (3.376, -4.757), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, width: 0.14cm, fill: black)))
  line((3.376, -5.709), (3.376, -6.209), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, width: 0.14cm, fill: black)))
})],
  caption: [Figure 2: The two uses of smaller-rank induction. Upper freeness supplies the edge bound; upper polynomial equality permits row cancellation against reciprocity. Polynomial equality then forces the edge bounds to be exact, and the reverse bottom schedule proves terminal-kernel freeness. ],
) <fig:comparison-dependencies>

=== 6.1 A nonnegative comparison <a-nonnegative-comparison>

Fix a real number $q$ with $0 < q < 1$, and put

$ T = q^(- 1 \/ 2) - q^(1 \/ 2) > 0 . $

Recall that $A$ has $N$ polynomial variables. For each $x in \[ u \, b \]$, set

$ p_x \( q \) = q^(- d \( x \, b \) \/ 2) P_(x \, b) \( q \) \, wide p'_x \( q \) =
  q^(- d \( x \, b \) \/ 2) P'_(iota \( x \) \, b') \( q \) . $

Regard $p = \( p_x \)_(x in \[ u \, b \])$ and $p' = \( p'_x \)_(x in \[ u \, b \])$ as column vectors indexed by
  the first interval. The rank differences agree because $iota$ is a poset isomorphism.

Process all interval edges in increasing schedule order. At any time,
  let $H_x$ be the set of unprocessed upward edges at $x$, and keep the vector

#[#set math.equation(numbering: n => "(6.1)")
 $ D_x = q^(- d \( x \, b \) \/ 2) \( 1 - q \)^N "Hilb" \( L_x \( H_x \) \; q \) . $ <eq:state>]

Each kernel is finitely generated and bounded below in degree, so this Hilbert series converges at the chosen $q$,
  regardless of whether the kernel is free. Proposition 5 gives the endpoints

#[#set math.equation(numbering: n => "(6.2)")
 $ D_(upright("initial")) = p \( q^(- 1) \) \, wide D_(upright("final")) = p \( q \) . $ <eq:endpoints>]

At $e : x arrow.r y$, removing its kernel condition gives the exact sequence

$ 0 arrow.r L_x \( F union { e } \) arrow.r L_x \( F \) arrow.r I arrow.r 0 \, $

where $F$ is the strictly later set. The current set at $y$ is $G$ from Proposition 21;
  edges tied with $e$ do not meet $y$. Only coordinate $x$ changes. Since $J = L_y \( G \) \/ alpha_e L_y \( G \)$,

$ "Hilb" \( f_e J \; q \) = q^(\( d \( x \, y \) - 1 \) \/ 2) \( 1 - q \) "Hilb" \( L_y \( G \) \; q \) . $

The increase of $D_x$ is consequently at most

#[#set math.equation(numbering: n => "(6.3)")
 $ & q^(- d \( x \, b \) \/ 2) \( 1 - q \)^N "Hilb" \( f_e J \; q \)\
 & quad = q^(- d \( x \, b \) \/ 2) \( 1 - q \)^(N + 1) q^(\( d \( x \, y \) - 1 \) \/ 2)
   "Hilb" \( L_y \( G \) \; q \) = T D_y . $ <eq:step>]

Let $E_(x y)$ be the matrix unit whose only nonzero entry is $1$ in row $x$, column $y$, and associate $M_e =
  "id" + T E_(x y)$ to $e$. All entries of these matrices are nonnegative.
  Repeatedly applying (6.3) bounds the final vector by the corresponding matrix product applied to the initial vector.

This product counts #emph[decreasing] reflection-label paths.
  Indeed, an upper edge $y arrow.r z$ must already have transferred its contribution into coordinate $y$ before a
  lower edge $x arrow.r y$ can use it. For a whole path the edge labels therefore decrease from $x$ toward its
  final vertex. Conversely, each such path appears once in the matrix expansion.
  Equal labels cannot occur in a composable pair, and disjoint tied edges have commuting matrices.
  Define the matrix
  $tilde(R)' \( T \) = \( tilde(R)'_(iota \( x \) \, iota \( z \)) \( T \) \)_(x \, z in \[ u \, b \])$,
  with rows and columns indexed through $iota$. Theorem 3, applied in the second system, gives

#[#set math.equation(numbering: n => "(6.4)")
 $ p \( q \) lt.eq tilde(R)' \( T \) p \( q^(- 1) \) quad upright("entrywise") \, $ <eq:comparison>]

By the defining reciprocity identity in the second system, evaluated at $q^(- 1)$, and by

$ \( q^(- 1) \)^(- d \( x \, z \) \/ 2) R'_(iota \( x \) \, iota \( z \)) \( q^(- 1) \) =
  tilde(R)'_(iota \( x \) \, iota \( z \)) \( T \) \, $

we have the exact identity

#[#set math.equation(numbering: n => "(6.5)")
 $ p' \( q \) = tilde(R)' \( T \) p' \( q^(- 1) \) . $ <eq:reciprocal-vector>]

The positive sign of $T$ here comes from evaluation at $q^(- 1)$.

=== 6.2 Polynomial equality <polynomial-equality>

The induction hypothesis gives $p_y = p'_y$ for all $y > u$.
  Subtracting (6.5) from (6.4) in row $u$, and using $\( tilde(R)' \( T \) \)_(u \, u) = 1$, yields

$ Delta \( q \) lt.eq Delta \( q^(- 1) \) \, wide Delta = p_u - p'_u . $

Interchanging the two systems gives the reverse inequality.
  Both comparisons use only smaller-rank freeness at upper endpoints. Thus

$ Delta \( q \) = Delta \( q^(- 1) \) wide \( 0 < q < 1 \) . $

The strict degree bound on Kazhdan–Lusztig polynomials implies that $Delta$,
  as a Laurent polynomial in $q^(1 \/ 2)$, has only strictly negative exponents.
  Its reciprocal has only strictly positive exponents. Equality on the interval $\( 0 \, 1 \)$ forces both to
  vanish. Hence $P_(u \, b) = P'_(u' \, b')$.

=== 6.3 Equality forces all edge images <equality-forces-all-edge-images>

It remains to prove the supplementary freeness statement.
  The polynomial equality just obtained, together with the proper upper equalities,
  makes the entire endpoint comparison (6.4) an equality.

Write the edge schedule as $e_1 \, dots.h \, e_r$, let $D_k$ be the actual state after step $k$, and put $M_k =
  M_(e_k)$. Define the nonnegative deficit vector

$ delta_k = M_k D_(k - 1) - D_k gt.eq 0 . $

An exact telescoping identity gives

#[#set math.equation(numbering: n => "(6.6)")
 $ M_r dots.h.c M_1 D_0 - D_r = sum_(k = 1)^r M_r dots.h.c M_(k + 1) delta_k . $ <eq:deficit>]

Every factor has nonnegative entries and diagonal entries $1$; so does every product,
  since each off-diagonal entry goes from a strictly higher vertex to a lower one in the Bruhat order.
  In particular, a positive coordinate of $delta_k$ remains positive in the corresponding summand on the right.
  The left side is zero by endpoint equality. Therefore every deficit is zero.

At a particular edge, its only possibly nonzero coordinate is a positive scalar times

$ "Hilb" #scale(x: 120%, y: 120%)[\(] \( f_e J \) \/ I \; q #scale(x: 120%, y: 120%)[\)] . $

A nonzero finitely generated graded module has a strictly positive Hilbert series at $0 < q < 1$,
  including if its support has codimension at least two or it has finite length.
  Consequently the vanishing of the deficit proves

#[#set math.equation(numbering: n => "(6.7)")
 $ I = f_e J $ <eq:image-equality>]

as graded modules globally. This supplies the equality deliberately not inferred from the codimension-one tests.

=== 6.4 Freeness closes the induction <freeness-closes-the-induction>

Each image in (6.7) is graded free over $A \/ \( alpha_e \)$;
  it therefore has a graded free $A$-resolution of length at most one.
  At the bottom $u$, work backward through its upward-edge schedule, starting with $L_u \( diameter \) = B^u$.
  Adding back one condition gives

$ 0 arrow.r K arrow.r F arrow.r I arrow.r 0 \, $

where $F$ is the previously reached free kernel and $"pd"_A I lt.eq 1$.
  Comparing this sequence with a length-one graded free resolution of $I$,
  graded Schanuel’s lemma makes $K$ graded projective.

A finitely generated graded projective module over a positively graded polynomial ring whose degree-zero part is a
  field is graded free. Here is the relevant argument. Lift a homogeneous basis of $K \/ A_(> 0)
  K$ to obtain a graded surjection from a finite graded free module $F_0$ onto $K$. Graded projectivity splits it.
  The complementary kernel has zero quotient modulo $A_(> 0)$, and graded Nakayama makes that kernel zero.
  Thus $F_0 tilde.eq K$.

This reverse procedure reaches every terminal portion of $U_u$.
  It proves the supplementary freeness assertion and closes the simultaneous induction, establishing Theorem 1. 0◻

#thm([Corollary 6.1.])[
  #emph[Every poset isomorphism $iota : \[ u \, b \] arrow.r \[ u' \, b' \]$ preserves all Kazhdan–Lusztig
    polynomials on its subintervals:
$ P_(x \, y) \( q \) = P'_(iota \( x \) \, iota \( y \)) \( q \) wide \( u lt.eq x lt.eq y lt.eq b \) . $

 It also preserves the corresponding $R$-polynomials.]
] <cor:all-subintervals>

#proof[
  Apply Theorem 1 to each restricted interval. For the second assertion, write reciprocity as
  $ q^(d \( x \, y \)) P_(x \, y) \( q^(- 1) \) = sum_(x lt.eq z lt.eq y) R_(x \, z) \( q \) P_(z \, y) \( q \) . $
  The term with $z = y$ is $R_(x \, y)$, and all other terms use smaller rank differences for $R$.
    Induction therefore recovers all $R$-polynomials from the order and the preserved $P$-polynomials. ◻
]

#prodef([Remark 6.2.])[
  (Ranks of terminal kernels).  Use the chosen reflection order in $W'$ also for its native schedule on
    $\[ u' \, b' \]$, with the same order for corresponding tied edges in the two global schedules.
    Let $L'_(iota \( x \))$ denote the kernels of $B' \( b' \)$ over its polynomial ring $A'$,
    with $N'$ variables. For each $x in \[ u \, b \]$ and terminal portion $F$ at $x$, its image $F' =
    iota \( F \)$ is a native terminal portion at $iota \( x \)$, and
  $ "grk"_A \( L_x \( F \) \; q \) = "grk"_(A') \( L'_(iota \( x \)) \( F' \) \; q \) . $
  Indeed, (6.7) makes every transition exact, so $D_k = M_k dots.h.c M_1 p \( q^(- 1) \)$.
    Apply the same argument to the identity comparison in the second system.
    Corollary 23 identifies the initial vectors, and the matched schedules give the same matrices under $iota$.
    For each chosen pair $x \, F$, the two state coordinates therefore agree at a common stage realizing $F \,
    F'$; such a stage exists because incident edges are untied.
    The auxiliary assertion on $\[ x \, b \]$ and on the identity comparison of $\[ iota \( x \) \, b' \]$ makes
    both kernels free. Their separate factors $\( 1 - q \)^N$ and $\( 1 - q \)^(N')$ in the two versions of (6.1)
    then convert their Hilbert series to graded ranks, and the common length factor cancels.
    Equality for all $0 < q < 1$ proves the polynomial identity.
] <rem:terminal-ranks>

#heading(level: 1)[References]
#bibitem([1])[G.~T.~Barkley and C.~Gaetz, #emph[Combinatorial invariance for Kazhdan--Lusztig $R$-polynomials of
  elementary intervals], Math. Ann. #strong[392] (2025), 3299--3317.
  #link("https://doi.org/10.1007/s00208-025-03175-w")[doi:10.1007/s00208-025-03175-w].]
#bibitem([2])[G.~T.~Barkley and C.~Gaetz, #emph[The BBDVW Conjecture for Kazhdan--Lusztig polynomials of lower
  intervals], Int. Math. Res. Not. IMRN #strong[2026] (2026), no.~4, rnag022.
  #link("https://doi.org/10.1093/imrn/rnag022")[doi:10.1093/imrn/rnag022].]
#bibitem([3])[G.~T.~Barkley, C.~Gaetz, and T.~Lam, #emph[Combinatorial invariance for the coefficient of $q$ in
  Kazhdan--Lusztig polynomials], 2026, #link("https://arxiv.org/abs/2601.07793v2")[arXiv:2601.07793v2].]
#bibitem([4])[A.~Björner and F.~Brenti, #emph[Combinatorics of Coxeter Groups],
  Graduate Texts in Mathematics #strong[231], Springer, New York, 2005.
  #link("https://doi.org/10.1007/3-540-27596-7")[doi:10.1007/3-540-27596-7].]
#bibitem([5])[C.~Blundell, L.~Buesing, A.~Davies, P.~Veličković, and G.~Williamson,
  #emph[Towards combinatorial invariance for Kazhdan--Lusztig polynomials], Represent.
  Theory #strong[26] (2022), 1145--1191. #link("https://doi.org/10.1090/ert/624")[doi:10.1090/ert/624].]
#bibitem([6])[T.~Braden and R.~MacPherson, #emph[From moment graphs to intersection cohomology], Math. Ann.
  #strong[321] (2001), 533--551. #link("https://doi.org/10.1007/s002080100232")[doi:10.1007/s002080100232]\;
  #link("https://arxiv.org/abs/math/0008200")[arXiv:math/0008200].]
#bibitem([7])[F.~Brenti, #emph[The intersection cohomology of Schubert varieties is a combinatorial invariant],
  European J. Combin. #strong[25] (2004), no.~8, 1151--1167.
  #link("https://doi.org/10.1016/j.ejc.2003.10.011")[doi:10.1016/j.ejc.2003.10.011].]
#bibitem([8])[F.~Brenti, F.~Caselli, and M.~Marietti, #emph[Special matchings and Kazhdan--Lusztig polynomials],
  Adv. Math. #strong[202] (2006), no.~2, 555--601.
  #link("https://doi.org/10.1016/j.aim.2005.01.011")[doi:10.1016/j.aim.2005.01.011].]
#bibitem([9])[F.~Caselli and M.~Marietti, #emph[Special Matchings, Brenti's Conjecture,
  and the Combinatorial Invariance Conjecture], 2026, #link("https://arxiv.org/abs/2606.11776v1")[arXiv:2606.11776v1].]
#bibitem([10])[M.~W.~Davis, #emph[The Geometry and Topology of Coxeter Groups],
  London Mathematical Society Monographs Series #strong[32], Princeton University Press, Princeton, NJ, 2008.]
#bibitem([11])[E.~Delanoy, #emph[Combinatorial invariance of Kazhdan--Lusztig polynomials on intervals starting
  from the identity], J. Algebraic Combin. #strong[24] (2006), 437--463.
  #link("https://doi.org/10.1007/s10801-006-0014-7")[doi:10.1007/s10801-006-0014-7].]
#bibitem([12])[V.~V.~Deodhar, #emph[A note on subgroups generated by reflections in Coxeter groups], Arch. Math.
  (Basel) #strong[53] (1989), 543--546. #link("https://doi.org/10.1007/BF01199813")[doi:10.1007/BF01199813].]
#bibitem([13])[F.~du Cloux, #emph[An abstract model for Bruhat intervals], European J. Combin.
  #strong[21] (2000), no.~2, 197--222. #link("https://doi.org/10.1006/eujc.1999.0343")[doi:10.1006/eujc.1999.0343].]
#bibitem([14])[F.~du Cloux, #emph[Rigidity of Schubert closures and invariance of Kazhdan--Lusztig polynomials],
  Adv. Math. #strong[180] (2003), no.~1, 146--175.
  #link("https://doi.org/10.1016/S0001-8708(02)00100-7")[doi:10.1016/S0001-8708(02)00100-7].]
#bibitem([15])[M.~J.~Dyer, #emph[Hecke algebras and reflections in Coxeter groups], Ph.D.
  thesis, University of Sydney, August 1987.
  #link("https://academicweb.nd.edu/~dyer/papers/dyerthesis.pdf")[Author's PDF].]
#bibitem([16])[M.~Dyer, #emph[Reflection subgroups of Coxeter systems], J.
  Algebra #strong[135] (1990), no.~1, 57--73.
  #link("https://doi.org/10.1016/0021-8693(90)90149-I")[doi:10.1016/0021-8693(90)90149-I].]
#bibitem([17])[M.~Dyer, #emph[On the "Bruhat graph" of a Coxeter system], Compositio Math.
  #strong[78] (1991), no.~2, 185--191. #link("https://www.numdam.org/item/CM_1991__78_2_185_0/").]
#bibitem([18])[M.~J.~Dyer, #emph[Hecke algebras and shellings of Bruhat intervals], Compositio Math.
  #strong[89] (1993), no.~1, 91--115. #link("https://www.numdam.org/item/CM_1993__89_1_91_0/").]
#bibitem([19])[M.~J.~Dyer, #emph[Rank two detection of singularities of Schubert varieties],
  unpublished manuscript, undated. #link("https://academicweb.nd.edu/~dyer/papers/ranktwo.pdf").]
#bibitem([20])[B.~Elias and G.~Williamson, #emph[The Hodge theory of Soergel bimodules], Ann. of Math.
  (2) #strong[180] (2014), no.~3, 1089--1136.
  #link("https://doi.org/10.4007/annals.2014.180.3.6")[doi:10.4007/annals.2014.180.3.6]\;
  #link("https://arxiv.org/abs/1212.0791v2")[arXiv:1212.0791v2].]
#bibitem([21])[F.~Esposito, M.~Marietti, and S.~Stella, #emph[Flip Combinatorial Invariance and Weyl groups],
  2026, #link("https://arxiv.org/abs/2509.16433v2")[arXiv:2509.16433v2].]
#bibitem([22])[P.~Fiebig, #emph[Kazhdan--Lusztig combinatorics via sheaves on Bruhat graphs],
  in #emph[Algebraic and Geometric Combinatorics] (Anogia, 2005), Contemp. Math. #strong[423], Amer. Math.
  Soc., 2007, 195--204. #link("https://arxiv.org/abs/math/0512311")[arXiv:math/0512311].]
#bibitem([23])[P.~Fiebig, #emph[The combinatorics of Coxeter categories], Trans. Amer. Math. Soc.
  #strong[360] (2008), no.~8, 4211--4233.
  #link("https://doi.org/10.1090/S0002-9947-08-04376-6")[doi:10.1090/S0002-9947-08-04376-6]\;
  #link("https://arxiv.org/abs/math/0512176v3")[arXiv:math/0512176v3].]
#bibitem([24])[P.~Fiebig, #emph[Sheaves on moment graphs and a localization of Verma flags], Adv. Math.
  #strong[217] (2008), no.~2, 683--712.
  #link("https://doi.org/10.1016/j.aim.2007.08.008")[doi:10.1016/j.aim.2007.08.008]\;
  #link("https://arxiv.org/abs/math/0505108")[arXiv:math/0505108].]
#bibitem([25])[M.~Goresky, R.~Kottwitz, and R.~MacPherson, #emph[Equivariant cohomology, Koszul duality,
  and the localization theorem], Invent. Math. #strong[131] (1998), 25--83.
  #link("https://doi.org/10.1007/s002220050197")[doi:10.1007/s002220050197].]
#bibitem([26])[F.~Incitti, #emph[More on the combinatorial invariance of Kazhdan--Lusztig polynomials], J. Combin.
  Theory Ser. A #strong[114] (2007), no.~3, 461--482.
  #link("https://doi.org/10.1016/j.jcta.2006.06.009")[doi:10.1016/j.jcta.2006.06.009].]
#bibitem([27])[D.~Kazhdan and G.~Lusztig, #emph[Representations of Coxeter groups and Hecke algebras], Invent.
  Math. #strong[53] (1979), no.~2, 165--184. #link("https://doi.org/10.1007/BF01390031")[doi:10.1007/BF01390031].]
#bibitem([28])[D.~Kazhdan and G.~Lusztig, #emph[Schubert varieties and Poincaré duality],
  in #emph[Geometry of the Laplace Operator], Proc. Sympos. Pure Math. #strong[36], Amer. Math. Soc., 1980, 185--203.]
#bibitem([29])[M.~Lanini, #emph[Kazhdan--Lusztig combinatorics in the moment graph setting], J.
  Algebra #strong[370] (2012), 152--170.
  #link("https://doi.org/10.1016/j.jalgebra.2012.07.023")[doi:10.1016/j.jalgebra.2012.07.023]\;
  #link("https://arxiv.org/abs/1103.2282v3")[arXiv:1103.2282v3].]
#bibitem([30])[L.~Patimo, #emph[A combinatorial formula for the coefficient of $q$ in Kazhdan--Lusztig
  polynomials], Int. Math. Res. Not. IMRN #strong[2021] (2021), no.~5, 3203--3223.
  #link("https://doi.org/10.1093/imrn/rnz255")[doi:10.1093/imrn/rnz255].]
#bibitem([31])[W.~Soergel, #emph[Kazhdan--Lusztig-Polynome und unzerlegbare Bimoduln über Polynomringen], J. Inst.
  Math. Jussieu #strong[6] (2007), no.~3, 501--525.
  #link("https://doi.org/10.1017/S1474748007000023")[doi:10.1017/S1474748007000023].]
