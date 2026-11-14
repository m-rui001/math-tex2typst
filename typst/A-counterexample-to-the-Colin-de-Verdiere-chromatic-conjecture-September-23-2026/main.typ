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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to the Colin de Verdière chromatic conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Colin de Verdière invariant connects graph colouring with the inertia and nullity of real symmetric matrices.
  We prove that the chromatic number need not be at most one more than this invariant.

=== 1.1 The invariant and the main result <the-invariant-and-the-main-result>

A real symmetric matrix $M$, indexed by the vertices of a finite nonempty simple graph $G = \( V \, E \)$,
  is #emph[well-signed for $G$] if, for distinct vertices $u \, v$,

$ M_(u v) < 0 quad upright("when ") { u \, v } in E \, wide M_(u v) = 0 quad upright("when ") { u \, v } in.not E . $

Its diagonal entries are unrestricted. Such a matrix has the #emph[Strong Arnold Property] if the only real
  symmetric matrix $X$ satisfying

$ M X = 0 \, wide X_(u u) = 0 med \( u in V \) \, wide X_(u v) = 0 med \( { u \, v } in E \) $

is $X = 0$. The Colin de Verdière invariant is

$ mu \( G \) = max {dim ker M : med M upright(" is well-signed for ") G \, quad n_(-) \( M \) = 1 \,\
M upright(" has the Strong Arnold Property")} \, $

where $n_(-) \( M \)$ counts negative eigenvalues with multiplicity. This class is nonempty:
  perturb an invertible diagonal matrix with one negative entry by sufficiently small negative entries on the
  edges. Inertia and invertibility persist, and an invertible matrix has the Strong Arnold Property.

Write $alpha \( G \)$ and $chi \( G \)$ for the independence number and chromatic number.
  The chromatic conjecture for this invariant asserts that $chi \( G \) lt.eq mu \( G \) +
  1$ for every finite nonempty simple graph. Our main result gives a negative resolution.

#thm([Theorem 1.1.])[
  #emph[There are finite graphs $G$ of arbitrarily large order for which
$ alpha \( G \) lt.eq 2 \, wide mu \( G \) + 1 < frac(\| V \( G \) \|, 2) lt.eq chi \( G \) . $

 In particular, the Colin de Verdière chromatic conjecture is false.]
] <thm:main>

We prove a stronger matrix obstruction than is necessary for the upper bound on $mu$:
  every well-signed matrix on the constructed graph with one negative eigenvalue has rank greater than $\|
  V \( G \) \| \/ 2 + 1$. The Strong Arnold Property is not used in this bound.
  The maximum corank in this larger class is the related parameter $kappa$ considered by Lovász and Schrijver
  #cite(label("lovaszschrijver2017")) pp. 572–574. Thus the construction also satisfies $kappa \( G \) +
  1 < \| V \( G \) \| \/ 2$. Unlike $mu$, this larger parameter is not minor-monotone in general;
  our argument uses it only through the stated matrix class.

=== 1.2 History, significance, and the construction <history-significance-and-the-construction>

Colin de Verdière introduced $mu$ through the spectral study of Schrödinger operators on graphs
  #cite(label("cdv1990")) #cite(label("hls1999")). The Strong Arnold Property expresses a transversality condition
  from that spectral framework #cite(label("cdv1988arnold")).
  The small values of the invariant have concrete geometric meanings:
  $mu lt.eq 2$ characterizes outerplanar graphs, $mu lt.eq 3$ planar graphs, and $mu lt.eq
  4$ linklessly embeddable graphs #cite(label("cdv1990")) #cite(label("lovaszschrijver1998"))
  #cite(label("hls1999")). The proposed chromatic bound holds throughout the range $mu \( G \) lt.eq
  4$ #cite(label("hls1999")) p. 35. Gram representations and nullspace embeddings have provided geometric ways to
  study these matrices #cite(label("kotlovlovaszvempala1997")) #cite(label("lovaszschrijver1999")).
  These connections make the proposed chromatic bound a natural test of how much colouring information the
  spectral invariant retains.

Write $h \( G \)$ for the largest $t$ such that $K_t$ is a minor of $G$.
  Minor monotonicity of $mu$, together with $mu \( K_t \) = t - 1$, gives $h \( G \) lt.eq mu \( G \) +
  1$ #cite(label("hls1999")) §1.3 and Theorem 2.4. Thus Hadwiger’s conjecture $chi \( G \) lt.eq
  h \( G \)$ #cite(label("hadwiger1943")) would imply the chromatic bound proposed by Colin de Verdière
  #cite(label("cdv1990")) #cite(label("cdv1998")) #cite(label("hls1999")).
  For completeness, the complete-graph identity follows directly from $- J_t$:
  it has one negative eigenvalue and nullity $t - 1$, and the Strong Arnold Property is automatic on a complete
  graph. No admissible matrix can have rank zero. The examples in 1 therefore also violate Hadwiger’s inequality.
  The matrix obstruction below is proved directly; its conclusion does not follow from a clique-minor obstruction.

A distinct connected-matching route to the failure of Hadwiger’s inequality is given in the companion
  manuscript #cite(label("OpenAIHadwigerCounterexample2026")) Theorem 1.1 and Corollary 1.2.

The construction starts with a finite-field relation of #emph[holes]. Its vertices are injective frames.
  A hole is witnessed by a tensor shared by two frames, two compatible affine-gradient equations,
  and a parity condition. Summing those equations around a triangle gives a contradiction.
  The complement of the hole relation consequently has independence number at most two,
  and so needs at least half its order in colours. Our remaining task is to force matrix rank strictly above half
  the order. For this purpose, ordinary control of connected matchings is insufficient:
  the matrix argument needs conflicts between specified classes of matching edges and between a matching and a
  separately chosen vertex set.

The new probabilistic ingredient is a thinning of the allowed channel images that preserves the primal-frame
  distribution. It penalizes prescribed nonzero translates of channel combinations,
  turning the difficult phase alternative into one with a fixed positive mass of compatible pairs.
  This gives both a version of conflict supersaturation that distinguishes colours and an asymmetric edge–point
  version. We prove these extensions together with their common-limit and finite-sampling steps.
  The low-rank Boolean moment argument uses commuting multiplication operators,
  as in the flat-extension method for moments #cite(label("laurentmourrain2009")); here the characteristic-two,
  partly truncated version is proved directly. The probabilistic comparison combines entropy control with the
  energy-increment method of weak regularity #cite(label("cover2006")) #cite(label("frieze1999")).
  For finite sampling we adapt the deterministic fingerprint procedure of Kleitman and Winston
  #cite(label("kleitmanwinston1982")) #cite(label("samotij2015")),
  using a constrained entropy minimum as its potential #cite(label("csiszar1975")).

The second ingredient is a matrix criterion for clique blow-ups.
  A finite-tree representation of hyperbolic flats locates large families of blocks that can be normalized
  simultaneously. A first spectral normalization produces an almost perfect matching of coordinates.
  A second normalization extracts additional positive directions from selected pair blocks.
  The resulting rank gain contradicts a kernel of approximately half the total dimension.
  The criterion needs only the graph properties stated next and may be used independently of the tensor construction.

=== 1.3 The base graphs and the proof structure <the-base-graphs-and-the-proof-structure>

A #emph[hole] of a graph is a pair of distinct nonadjacent vertices.
  Two edges #emph[conflict] if they are disjoint and all four cross pairs between their endpoints are holes.
  An edge and a vertex conflict if the vertex is distinct from both endpoints and both cross pairs are holes.
  Edges #emph[touch] if they have a common endpoint or an edge joins their endpoint sets.
  Thus two disjoint edges fail to touch exactly when they conflict.

#thm([Theorem 1.2.])[
  (Base graphs).  #emph[There is a constant $a > 0$ such that, for every $beta > 0$,
    there are arbitrarily large integers $m$ and graphs $H$ on $m$ vertices with $alpha \( H \) lt.eq
    2$ and the following properties.]
  + #emph[ Every matching of size at least $m \/ 20$, partitioned into classes of size at most $a m$,
    contains two conflicting edges in different classes.]
  + #emph[ Every matching of size at least $beta m$ and every vertex set of size at least $beta
    m$ contain an edge and a vertex in conflict.]
  + #emph[ Every two vertex sets of size at least $beta m$ contain a cross hole.]
  #emph[The two vertex sets in Theorem 1.2 may overlap.]
] <thm:base-graphs>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 1), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 1), [$A_1$], anchor: "east")
  circle((0, -1), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((-0.03528, -1), [$A_2$], anchor: "east")
  circle((3.8, 1), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((3.835, 1), [$B_1$], anchor: "west")
  circle((3.8, -1), radius: 0.09978, fill: rgb("#000000"), stroke: none)
  content((3.835, -1), [$B_2$], anchor: "west")
  line((0, 1), (0, -1), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.8, 1), (3.8, -1), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((0, 1), (3.8, 1), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 1), (3.8, -1), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, -1), (3.8, 1), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, -1), (3.8, -1), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0, 1.65), [#text(size: 9pt)[edge $A$]])
  content((3.8, 1.65), [#text(size: 9pt)[edge $B$]])
})],
  caption: [Figure 1: A conflict: solid segments are graph edges, and dashed segments are holes. The construction forces such a configuration between different classes of a large matching. ],
) <fig:four-holes>

For a positive integer $s$, the #emph[clique blow-up] $H \[ s \]$ replaces each vertex of $H$ by a clique of size
  $s$, and each edge by all edges between the two corresponding cliques.
  We also write $H \[ K_s \]$ for $H \[ s \]$. An independent set in $H \[ s \]$ uses at most one vertex from each
  clique and projects to an independent set in $H$. Hence $alpha \( H \[ s \] \) lt.eq 2$,
  and $chi \( H \[ s \] \) gt.eq ceil.l m s \/ 2 ceil.r$.

14 proves that, when $a$ is fixed, $beta$ is sufficiently small, and $m$ is sufficiently large,
  properties Theorem 1.2–Theorem 1.2 force every well-signed one-negative matrix on $H \[ s \]$ to have rank
  greater than $m s \/ 2 + 1$, for every sufficiently large $s$.
  Choosing one base graph from 2 and applying rank–nullity therefore proves 1. Notice the order:
  the base graph is fixed before the blow-up parameter tends to infinity.

The independence-number estimate also yields a stronger fractional-colouring consequence.
  For a finite nonempty simple graph $G$, let $cal(I) \( G \)$ be the family of its independent vertex sets.
  A fractional colouring assigns nonnegative real weights $w_I$ to these sets with $sum_(I in.rev v) w_I gt.eq
  1$ at every vertex $v$. The ordinary fractional chromatic number $chi_f \( G \)$ is the minimum of $sum_I
  w_I$ over all such assignments. An ordinary colouring is a feasible assignment with unit weights on its colour
  classes, so $chi_f \( G \) lt.eq chi \( G \)$. On the other hand, summing the vertex constraints gives

$ \| V \( G \) \| lt.eq sum_(v in V \( G \)) sum_(I in.rev v) w_I = sum_(I in cal(I) \( G \)) \| I \| w_I lt.eq
  alpha \( G \) sum_(I in cal(I) \( G \)) w_I \, $

and therefore $chi_f \( G \) gt.eq \| V \( G \) \| \/ alpha \( G \)$.

#thm([Corollary 1.3.])[
  (Fractional-colouring obstruction).  #emph[There are finite nonempty simple graphs $G$ of arbitrarily large
    order for which
$ chi_f \( G \) gt.eq frac(\| V \( G \) \|, alpha \( G \)) gt.eq frac(\| V \( G \) \|, 2) > kappa \( G \) +
  1 gt.eq mu \( G \) + 1 gt.eq h \( G \) . $

]
] <cor:fractional-spectral>

#proof[
  Take the constructed examples in Theorem 1 and put $m = \| V \( G \) \|$. They have $alpha \( G \) lt.eq 2$.
    Every well-signed one-negative matrix on these graphs has rank greater than $m \/ 2 + 1$,
    so rank–nullity gives corank less than $m \/ 2 - 1$. Maximizing in the larger matrix class yields
    $kappa \( G \) + 1 < m \/ 2$. Every matrix admitted in the definition of $mu \( G \)$ is admitted for
    $kappa \( G \)$, so $mu \( G \) lt.eq kappa \( G \)$. The inequality $h \( G \) lt.eq mu \( G \) +
    1$ was established above. Combining these bounds with the fractional-colouring estimate proves the chain. ◻
]

The same graphs also violate the fractional-colouring weakening of Hadwiger’s conjecture discussed by
  #cite(label("reedseymour1998"), form: "prose") p. 148: for every positive integer $p$,
  excluding a $K_(p + 1)$ minor was predicted to give a fractional $p$-colouring.
  Their definition uses nonnegative rational weights with coverage exactly one at each vertex and total weight at
  most $p$, which are admissible above; their result (1.3) proves the corresponding $2 p$-bound.
  Taking $p = h \( G \) gt.eq 1$ in the corollary rules out the coefficient-one prediction.
  The fractional relaxation here concerns colouring, while $h \( G \)$ remains the ordinary clique-minor number.
  The comparisons with $kappa$ and $mu$ show that the obstruction survives both fractional colouring and omission
  of the Strong Arnold Property.

The list chromatic number $chi_(upright("list")) \( G \)$ is the least integer $k$ such that every assignment of
  finite colour lists of size at least $k$ to the vertices admits a proper colouring from those lists.

#thm([Corollary 1.4.])[
  (A linear list-colouring bound).  #emph[Let $C$ be the absolute integer in
    #cite(label("OpenAILinearListHadwiger2026"), form: "prose") Theorem 1.1.
    Every finite nonempty simple graph $G$ satisfies
$ chi_(upright("list")) \( G \) lt.eq C #scale(x: 120%, y: 120%)[\(] mu \( G \) + 1 #scale(x: 120%, y: 120%)[\)] . $

]
] <cor:list-spectral>

#proof[
  That theorem gives $chi_(upright("list")) \( G \) lt.eq C h \( G \)$.
    Combining this with $h \( G \) lt.eq mu \( G \) + 1$, proved above, gives the result. ◻
]

=== 1.4 From distribution tests to finite graphs <from-distribution-tests-to-finite-graphs>

To prove 2, we first work with probability laws on the finite set of frames.
  An ordered pair with no hole is called a #emph[unit]. The two frames within a unit may be strongly dependent.
  The tests in 25 give a positive lower bound for the probability that two independently sampled units conflict
  across distinct colours, and that a unit conflicts with an independently sampled point,
  under specified density bounds and, in the coloured test, an upper bound on each colour’s mass.

The algebraic part gives sufficient certificates for four cross holes,
  using scalar conditions and equalities between ordered tuples of frame images, called #emph[keys].
  Once these equalities and scalar conditions hold, 39 prescribes the remaining inner products between primal and
  channel frames, and 40 bounds the probability of agreement with that prescription.
  The main probabilistic task is therefore to force overlap between the accepted key distributions despite
  dependence within each unit. Channel thinning supplies compatible scalar data.
  The histogram and product comparisons pass the actual query laws to a common limit,
  where finite-dimensional duality produces overlapping choices.
  Finally, the entropy fingerprint argument transfers the two distribution tests to one finite sample satisfying
  all three base-graph properties.

The paper first proves the matrix criterion. It then constructs the base graphs.
  Section 4, Section 5 define the frame model and thinned law and formulate the distribution tests.
  Section 6, Section 7, Section 8 supply the finite algebraic certificates and the collision criterion.
  Section 9, Section 10 establish compatibility on positive mass.
  Section 11, Section 12, Section 13, Section 14 prove the comparison and overlap statements that establish the
  coloured distribution test. 15 proves the independent-point distribution test.
  16 transfers both tests to finite graphs, proving 2, and 17 records the parameter order and quantitative
  margins. 18 gives the compact measure constructions used in the limiting steps.

In the probabilistic construction, $n$ is its unbounded input dimension, $N =
  M_0 n$ is the ambient frame dimension, and $m = 2^(1000 g N)$ is the sampled graph order.
  The graph threshold $beta$ is distinct from the selector length $b$.
  The original raw probability law is denoted by $sans(P)_0$, and its thinned version by $pi$;
  $mu$ always denotes the graph invariant.

== 2 Finite trees for Lorentz blocks <mt:section>

The matrix argument needs a way to normalize several positive definite blocks at once,
  even when their dimensions tend to infinity. We first give a geometric construction whose constants depend only
  on the number of blocks. We then use the three conflict properties of 2 to select the blocks that will be
  normalized together. All vector spaces and bilinear forms in this section are real.
  Logarithms in the hyperbolic estimates are natural logarithms.

=== 2.1 Hyperbolic flats and block normalization <hyperbolic-flats-and-block-normalization>

A #emph[Lorentz space] is a finite-dimensional real vector space with bilinear form

$ \[ x \, y \] = - x_0 y_0 + sum_(j = 1)^d x_j y_j . $

Its future unit hyperboloid is

$ bb(H)^d = { x : \[ x \, x \] = - 1 \, med x_0 > 0 } \, wide d_(bb(H)) \( x \, y \) = "arcosh" \( - \[ x \, y \] \) . $

Unused positive coordinates may always be added, so we may take $d gt.eq 1$.
  The orthogonal complement of a future unit vector is positive definite.
  Indeed, if $x = \( x_0 \, u \)$ and $\[ x \, \( t \, v \) \] = 0$, then $t = u dot.op v \/ x_0$, and

$ \| v \|^2 - t^2 gt.eq \| v \|^2 \/ x_0^2 . $

An orthonormal basis of this complement, together with $x$,
  therefore gives Lorentz coordinates in which $x = \( 1 \, 0 \)$.
  In these coordinates any other future unit vector has the form $\( cosh r \, sinh r thin u \)$, with $\| u \| =
  1$ and $r gt.eq 0$. In particular $- \[ x \, y \] gt.eq 1$.
  If $y \, z$ have radii $r \, s$ about $x$, the ordinary Cauchy–Schwarz inequality gives

$ - \[ y \, z \] = cosh r cosh s - sinh r sinh s thin \( u dot.op v \) lt.eq cosh \( r + s \) . $

This proves the triangle inequality for $d_(bb(H))$; its other metric properties follow from the same coordinates.

The segment from $x$ to $y$, of length $ell > 0$, is

#[#set math.equation(numbering: n => "(2.1)")
 $ gamma \( t \) = frac(sinh \( ell - t \), sinh ell) x + frac(sinh t, sinh ell) y \, wide 0 lt.eq t lt.eq
   ell . $ <mt:hyperbolic-segment>]

In coordinates about $x$ it is $\( cosh t \, sinh t thin u \)$,
  so $d_(bb(H)) \( gamma \( t \) \, gamma \( t' \) \) = \| t - t' \|$. When $x = y$ the segment is constant.
  A subspace $P$ is #emph[positive] if the Lorentz form restricted to it is positive definite.
  Its associated #emph[flat] is

$ F_P = P^perp ∩ bb(H)^d . $

Orthogonal decomposition by a positive subspace leaves exactly one negative square, so $F_P$ is nonempty.
  Formula (2.1) shows that it contains the segment between any two of its points.

#thm([Lemma 2.1.])[
  (Normalization near a flat).  #emph[Let $P$ be positive and write $x = x_P +
    x_perp$ for the orthogonal decomposition of $x in bb(H)^d$ relative to $P$. Then
#[#set math.equation(numbering: n => "(2.2)")
 $ sinh^2 d_(bb(H)) \( x \, F_P \) = \[ x_P \, x_P \] . $ <mt:flat-distance>]

 Suppose $P_1 \, dots.h \, P_k$ are positive subspaces whose flats have distance at most $R$ from one common
   point. Choose any Lorentz-orthonormal basis in each $P_i$, concatenate these bases into a list $A$,
   and let $\[ A \, A \]$ be its Gram matrix. Then
#[#set math.equation(numbering: n => "(2.3)")
 $ parallel \[ A \, A \] parallel_(upright("op")) lt.eq k \( cosh^2 R + sinh^2 R \) . $ <mt:block-operator-bound>]

 This bound does not depend on the dimensions of the subspaces. The subspaces are allowed to overlap.
   If $P_i perp P_j$, then $F_(P_i) ∩ F_(P_j) eq.not diameter$.]
] <mt:flat-normalization>

#proof[
  Put $q = \[ x_P \, x_P \]$. Then $\[ x_perp \, x_perp \] = - 1 - q$, and $y =
    x_perp \/ sqrt(1 + q)$ is future unit timelike. For $z in F_P$, the hyperbolic coordinates above,
    now in $P^perp$, give
  $ - \[ x \, z \] = - \[ x_perp \, z \] gt.eq sqrt(1 + q) \, $
  with equality at $z = y$. This proves (2.2).
  Use the common point as the time coordinate. For the basis matrix $A_i$,
    let $t_i$ be its time-coordinate row and $S_i$ its spatial-coordinate matrix.
    The projection formula gives $parallel t_i parallel lt.eq sinh R$, and orthonormality gives
  $ S_i^(sans(T)) S_i = I + t_i^(sans(T)) t_i \, wide parallel S_i parallel_(upright("op")) lt.eq cosh R . $
  For the concatenated matrices $S \, t$, Cauchy–Schwarz over the $k$ blocks gives $parallel S
    parallel_(upright("op"))^2 lt.eq k cosh^2 R$ and $parallel t parallel^2 lt.eq k sinh^2 R$.
    Since $\[ A \, A \] = S^(sans(T)) S - t^(sans(T)) t$, this proves (2.3).
    Finally, if $P_i perp P_j$, their sum is positive, and its orthogonal complement contains a future unit
    timelike vector perpendicular to both. ◻
]

=== 2.2 A finite configuration and its segment points <a-finite-configuration-and-its-segment-points>

A #emph[finite metric tree] is a finite tree whose edges are intervals of positive lengths,
  equipped with path distance; a single point is also allowed. Its segment between $a \, b$ is denoted $\[ a \, b \]_T$.

Finite hyperbolic configurations admit tree approximations with logarithmic additive error through Gromov’s
  construction #cite(label("Gromov1987Hyperbolic")). Its maximum–minimum chain closure is recorded explicitly by
  #cite(label("CornectMartinezPedroza2025Tree"), form: "prose") Section 2, equation (11).
  We give a direct hyperboloid argument with an error depending only on the number of marked points;
  the subsequent segment and flat lemmas supply the additional assertions needed for matrix normalization.

#thm([Lemma 2.2.])[
  (Finite tree approximation).  #emph[For $ell gt.eq 1$, put
$ K \( ell \) = 4 + 2 log #scale(x: 120%, y: 120%)[\(] max { 1 \, ell - 1 } #scale(x: 120%, y: 120%)[\)] . $

 Given any $ell$ points $z_1 \, dots.h \, z_ell$ in a hyperboloid, in any dimension,
   there is a finite metric tree with marked points $z_1^T \, dots.h \, z_ell^T$ such that
#[#set math.equation(numbering: n => "(2.4)")
 $ \| d_T \( z_i^T \, z_j^T \) - d_(bb(H)) \( z_i \, z_j \) #scale(x: 120%, y: 120%)[\|] lt.eq
   K \( ell \) . $ <mt:endpoint-error>]

 The tree may be taken to be the hull of its marked points.]
] <mt:finite-metric>

#proof[
  Take $z_1$ as origin and write $z_i = \( cosh r_i \, sinh r_i thin u_i \)$.
    A direction with $r_i = 0$ can be chosen arbitrarily. For distinct indices set
  $ q_(i j) = frac(\| u_i - u_j \|, 2) \, wide a_(i j) = min { r_i \, r_j \, - log q_(i j) } \, $
  with $- log 0 = + oo$, and set $a_(i i) = r_i$. The exact identity
  #[#set math.equation(numbering: n => "(2.5)")
   $ cosh d_(bb(H)) \( z_i \, z_j \) = cosh \( r_i - r_j \) + 2 sinh r_i sinh r_j thin q_(i j)^2 $ <mt:radial-identity>]
  implies
  #[#set math.equation(numbering: n => "(2.6)")
   $ lr(|d_(bb(H)) \( z_i \, z_j \) - \( r_i + r_j - 2 a_(i j) \)|) lt.eq 4 . $ <mt:raw-depth-error>]
  Here is a dimension-free verification. If $min \( r_i \, r_j \) < 1$,
    the triangle inequality and its reverse put both $\( r_i + r_j - d_(bb(H)) \( z_i \, z_j \) \) \/
    2$ and $a_(i j)$ between zero and $min \( r_i \, r_j \)$, giving error at most two. Otherwise, writing
  $ D = max { \| r_i - r_j \| \, med r_i + r_j + 2 log q_(i j) } = r_i + r_j - 2 a_(i j) \, $
  the two terms in (2.5) give $e^D \/ 4 lt.eq cosh d_(bb(H)) \( z_i \, z_j \) lt.eq 2 e^D$.
    Use $log u lt.eq "arcosh" u lt.eq log \( 2 u \)$ for $u gt.eq 1$ to obtain an error at most $log 4 < 4$.
  For $i eq.not j$, define $A_(i j)$ as the largest bottleneck value $min_(0 lt.eq t < k)
    a_(i_t i_(t + 1))$ over chains $i = i_0 \, dots.h \, i_k = j$, and put $A_(i i) = r_i$.
    Deleting loops never decreases a bottleneck, so only simple chains of at most $ell - 1$ edges are needed.
    If a chain has bottleneck $h$, its endpoint radii are at least $h$,
    and the triangle inequality for the direction chords gives $q_(i j) lt.eq \( ell - 1 \) e^(- h)$. Consequently
  #[#set math.equation(numbering: n => "(2.7)")
   $ a_(i j) lt.eq A_(i j) lt.eq a_(i j) + log #scale(x: 120%, y: 120%)[\(] max { 1 \, ell -
     1 } #scale(x: 120%, y: 120%)[\)] \, wide A_(i j) lt.eq min \( r_i \, r_j \) . $ <mt:bottleneck-bound>]
  Concatenating chains also gives $A_(i j) gt.eq min \( A_(i t) \, A_(t j) \)$ for every $t$.
    Take intervals $\[ 0 \, r_i \]$, identifying their points of equal height $t$ whenever $t lt.eq A_(i j)$.
    The last inequality makes this an equivalence relation at every height.
    These equivalence classes are nested as height decreases;
    their finitely many splitting heights therefore form a rooted finite tree.
    The distance between the two marked upper endpoints is $r_i + r_j - 2 A_(i j)$.
    Equations (2.6)–(2.7) prove (2.4). Restricting to the hull of the marked points preserves their distances. ◻
]

Endpoint approximation alone does not justify lifting a point of a tree hull back into a flat.
  The next lemma supplies this additional step, uniformly in the location of the point along its segment.

#thm([Lemma 2.3.])[
  (Comparison of segment points).  #emph[Let $T$ and the points $z_i^T$ satisfy (2.4).
    For $theta in \[ 0 \, 1 \]$, associate the point at fraction $theta$ of $\[ z_i^T \, z_j^T \]_T$ with the
    point at the same fraction of the hyperbolic segment $\[ z_i \, z_j \]$.
    If $p \, q$ are obtained in this way, from any two pairs of marked points, and $hat(p) \,
    hat(q)$ are their associated hyperbolic points, then
#[#set math.equation(numbering: n => "(2.8)")
 $ \| d_(bb(H)) \( hat(p) \, hat(q) \) - d_T \( p \, q \) #scale(x: 120%, y: 120%)[\|] lt.eq
   11 K \( ell + 2 \) . $ <mt:segment-error>]

 For a degenerate segment any choice of its fractional parameter gives the same conclusion.]
] <mt:segment-comparison>

#proof[
  We first record an identity valid in any metric tree. If $p in \[ a \, b \]_T$ and $q in \[ c \, d \]_T$, then
  #[#set math.equation(numbering: n => "(2.9)")
   $ d_T \( p \, q \) = max_(e in { a \, b } \, med f in { c \, d }) { d_T \( e \, f \) - d_T \( e \, p \) -
     d_T \( f \, q \) } . $ <mt:tree-segment-identity>]
  Every term is at most the left side by the triangle inequality.
    If $p eq.not q$, choose an endpoint $e$ whose path from $p$ does not enter the component toward $q$,
    and an endpoint $f$ whose path from $q$ does not enter the component toward $p$.
    Such choices exist because $p \, q$ lie on their respective segments;
    an endpoint equal to the segment point is allowed. Then the path from $e$ to $f$ passes through $p \, q$,
    giving equality. If $p = q$, either choose an endpoint equal to this common point,
    or choose endpoints in different components of its complement; again equality holds.
  A second exact tree identity will locate the new marked points.
    If $P_theta$ is at fraction $theta$ of $\[ A \, B \]$ and $X$ is any point of the tree, then
  #[#set math.equation(numbering: n => "(2.10)")
   $ d \( X \, P_theta \) = max { d \( A \, X \) - theta d \( A \, B \) \,
     thin d \( B \, X \) - \( 1 - theta \) d \( A \, B \) } . $ <mt:tree-point-identity>]
  Indeed, if the projection of $X$ onto $\[ A \, B \]$ is at distance $u$ from $A$ and at distance $h$ from $X$,
    both sides equal $h + \| u - theta d \( A \, B \) \|$. This also holds for a degenerate segment.
  Apply 6 to the original configuration together with $hat(p) \, hat(q)$, obtaining a tree $T'$ with error $K' =
    K \( ell + 2 \)$. Denote their marked points by $p' \, q'$.
    Suppose $hat(p)$ is at fraction $theta$ of the hyperbolic segment $\[ a \, b \]$,
    and let $tilde(p)$ have that fraction on $\[ a' \, b' \]_(T')$.
    The two exact hyperbolic distances from $hat(p)$ to its endpoints are $theta
    d_(bb(H)) \( a \, b \)$ and $\( 1 - theta \) d_(bb(H)) \( a \, b \)$.
    In (2.10), each corresponding difference is therefore at most $2 K'$. Thus
  $ d_(T') \( p' \, tilde(p) \) lt.eq 2 K' \, wide d_(T') \( q' \, tilde(q) \) lt.eq 2 K' . $
  Together with the $K'$ distance error for the pair $hat(p) \, hat(q)$, this gives
  $ \| d_(bb(H)) \( hat(p) \, hat(q) \) - d_(T') \( tilde(p) \, tilde(q) \) \| lt.eq 5 K' . $
  Between the original endpoint sets, distances in $T$ and $T'$ differ by at most $K \( ell \) + K' lt.eq 2 K'$.
    Distances from an endpoint to its fractional segment point are that fraction, or its complement,
    times the segment length. Each term in (2.9) therefore changes by at most $6 K'$, and hence
  $ \| d_T \( p \, q \) - d_(T') \( tilde(p) \, tilde(q) \) \| lt.eq 6 K' . $
  The total error is at most $11 K'$. All identities remain valid when an endpoint segment has length zero. ◻
]

#thm([Proposition 2.4.])[
  (Finite tree principle).  #emph[For each index $s$, let $P_(1 \, s) \, dots.h \,
    P_(k \, s)$ be positive subspaces in a Lorentz space, whose dimension may depend on $s$.
    Fix a set $cal(D)$ of pairs of distinct labels, and assume
$ sup_s d_(bb(H)) \( F_(P_(i \, s)) \, F_(P_(j \, s)) \) lt.eq D < oo wide \( { i \, j } in cal(D) \) . $

 After passing to a subsequence, there are a finite combinatorial tree $T$ and a nonempty connected vertex set
   $S_i subset.eq V \( T \)$ for every label, with the following properties.]
  + #emph[$S_i ∩ S_j eq.not diameter$ for every ${ i \, j } in cal(D)$.]
  + #emph[For every vertex $x$, called a #emph[bag], choose any Lorentz-orthonormal basis in every $P_(i \, s)$
    with $x in S_i$. The Gram matrix of the concatenated list has operator norm bounded uniformly in $s$.
    The bound depends only on $k \, D$, and not on the dimensions or on the bases.]
  #emph[In particular, mutually orthogonal blocks can always be required to have intersecting subtrees.]
] <mt:finite-tree>

#proof[
  For every required pair, choose a point in each of its two flats at distance at most $D + 1$;
    an infimum need not be attained. Choose also one point in each flat.
    This gives $ell = k + 2 \| cal(D) \| lt.eq k^2$ marked representatives.
    Apply 6 and work in their tree hull $K_s$. Let $H_(i \, s)$ be the hull of representatives chosen from the
    $i$-th flat, and set
  $ R = frac(D + 1 + K \( ell \), 2) \, wide U_(i \, s) = { x in K_s : d_T \( x \, H_(i \, s) \) lt.eq R } . $
  The $R$-neighborhood of a subtree in a tree is a closed subtree:
    the segment between two of its points lies in the union of their paths to the original subtree and the subtree
    itself, and stays within distance $R$ of it. For a required pair,
    the midpoint of its two witness representatives belongs to both neighborhoods.
    Thus every required contact is preserved inside $K_s$.
  Suppose $x in U_(i \, s) ∩ U_(j \, s)$. Choose $h_i in H_(i \, s)$,
    $h_j in H_(j \, s)$ at distance at most $R$ from $x$. Every point of a finite tree hull lies on a segment
    between two of its defining representatives, allowing a repeated representative when the hull is a point.
    For example, after fixing one representative the union of its segments to all the others is already their
    hull. Lift $h_i \, h_j$ at their fractional parameters along the corresponding actual hyperbolic segments.
    Their lifts $z_i \, z_j$ belong to their respective flats by convexity, and 7 gives
  #[#set math.equation(numbering: n => "(2.11)")
   $ d_(bb(H)) \( z_i \, z_j \) lt.eq 2 R + 11 K \( ell + 2 \) = : R_(*) . $ <mt:bag-radius>]
  For any nonempty bag, fix one of these lifts. It has distance at most $R_(*)$ from every flat in the bag.
    By 5, their joint Gram norm is at most $k \( cosh^2 R_(*) + sinh^2 R_(*) \)$.
  It remains to obtain a single finite combinatorial pattern.
    Suppress the degree-two vertices of $K_s$ except marked representatives;
    there are at most $2 ell$ vertices and at most $2 ell$ edges.
    Each $U_(i \, s)$ meets an edge in an interval or the empty set.
    Subdivide every edge at all endpoints of these intervals.
    This adds at most $2 k$ vertices per edge, so the resulting tree has at most $2 ell \( 2 k + 1 \)$ vertices.
    Each $U_(i \, s)$ is now a subcomplex. There are only finitely many trees of this bounded size with $k$
    specified nonempty connected vertex sets. Along a subsequence the labelled pattern is constant.
    Take this pattern for $T \, S_i$. Equation (2.11) proves the uniform bag assertion.
    The final assertion follows from 5 with $D = 0$. ◻
]

For a finite list of flat sequences, a preliminary subsequence can also arrange that every pairwise distance is
  either uniformly bounded or tends to infinity. For each pair in turn, take a bounded subsequence if one exists,
  and otherwise the distance tends to infinity; previous choices remain valid after further subselection.
  Applying 8 with all bounded pairs as required contacts preserves every such pair.
  No assertion that the remaining subtrees are disjoint is needed.

=== 2.3 Weighted extraction from the conflict properties <weighted-extraction-from-the-conflict-properties>

We use a finite graph $G$ on $m$ vertices with the three properties in 2, with parameters $a \, beta > 0$.
  For clarity, the properties used here are:

+ Every matching of size at least $m \/ 20$, partitioned into classes of size at most $a m$,
  contains conflicting edges from different classes.
+ Every matching of size at least $beta m$ and every vertex set of size at least $beta
  m$ contain an edge and a vertex in conflict.
+ Every two vertex sets of size at least $beta m$ have a cross hole.

A hole is a nonedge between distinct vertices. Edges conflict when they are disjoint and all four cross pairs are
  holes. An edge and a vertex conflict when the vertex is outside the edge and both cross pairs are holes.
  Thus a shared endpoint prevents a conflict. We may decrease $a$ and assume $0 < a lt.eq 1$. Put

#[#set math.equation(numbering: n => "(2.12)")
 $ q = ceil.l beta m ceil.r \, wide D_a = ceil.l log_2 \( 5 \/ a \) ceil.r + 1 \, wide K_a =
   ceil.l 5 \/ a ceil.r D_a \, wide c = c \( a \) = frac(1, 40 K_a) . $ <mt:constants>]

An edge family $cal(E) subset.eq E \( G \)$ has #emph[loads at most one] if its nonnegative weights satisfy

#[#set math.equation(numbering: n => "(2.13)")
 $ sum_(e in cal(E) : thin v in e) w_e lt.eq 1 wide \( v in V \( G \) \) . $ <mt:loads>]

Then $sum_e w_e lt.eq m \/ 2$. We only need edges of positive weight.

#thm([Lemma 2.5.])[
  (Matching from bounded loads).  #emph[Every edge family of total weight $W$ satisfying (2.13) has a matching of
    size at least $W \/ 2$. If it contains no conflicting pair and $a m gt.eq 1$, then $W < m \/ 10$.]
] <mt:load-matching>

#proof[
  Take a maximal matching of size $k$ in the family. Its $2 k$ endpoints cover every edge,
    so the load bound gives $W lt.eq 2 k$. In the second assertion, $k gt.eq
    m \/ 20$ would violate Property Section 2.3 with each matching edge given its own class.
    Hence $k < m \/ 20$, proving the claim. ◻
]

#thm([Lemma 2.6.])[
  (A bag with almost all vertex labels).  #emph[Let $V_0 subset.eq V \( G \)$,
    and assign a nonempty subtree $S_v$ of a finite combinatorial tree to each $v in V_0$.
    Assume $S_u ∩ S_v eq.not diameter$ whenever $u v$ is a hole.
    Then some tree vertex belongs to all but fewer than $3 q$ of the subtrees.]
] <mt:single-bag>

#proof[
  At a tree vertex $x$, each subtree missing $x$ is wholly contained in a unique component of $T - x$.
    No two components can each contain at least $q$ whole subtrees:
    taking $q$ labels from each would give two vertex sets with no cross hole, contrary to Property Section 2.3.
    If there is a component with at least $q$ whole subtrees,
    orient the first edge from $x$ toward that component. Each vertex has at most one outgoing edge.
    An edge cannot be oriented both ways, since its two orientations would again supply two separated sets of $q$
    labels. Following arrows in a finite tree must therefore end at a sink $r$.
  Every component of $T - r$ contains at most $q - 1$ whole subtrees. If $q = 1$, no subtree misses $r$.
    If $q gt.eq 2$ and at least $3 q - 2$ labels missed $r$, greedily unite components until their total first
    reaches $q$. This total is at most $2 q - 2$; the remaining components contain at least $q$ labels.
    These two separated families contradict Property Section 2.3.
    The sink thus misses fewer than $3 q - 2$, and in particular fewer than $3 q$, labels. ◻
]

#thm([Lemma 2.7.])[
  (A bag with positive edge weight).  #emph[Suppose $a m gt.eq 2$.
    Let an edge family $cal(E)$ satisfy (2.13) and have total weight greater than $3 m \/ 10$.
    Assign a nonempty subtree $S_e$ of a finite tree to each edge,
    and suppose conflicting edges have intersecting subtrees. Then some vertex $z$ satisfies
$ sum_(e : thin z in S_e) w_e gt.eq c m . $

]
] <mt:weighted-bag>

#proof[
  Assign every edge’s weight to one chosen vertex of its subtree.
    Every finite tree with an assigned nonnegative mass has a vertex whose removal leaves each component with at
    most half the total mass. To see this, minimize the sum of mass times graph distance from the vertex.
    Moving to a neighbor in a component of mass greater than half the total would strictly decrease that sum.
    Such a minimizing vertex is a weighted centroid.
  Starting with $T$, cut at a weighted centroid in every current component whose assigned mass exceeds $a m \/
    10$, and repeat. At depth $j$ each component has mass at most $m \/ 2^(j + 1)$,
    since the original mass is at most $m \/ 2$. Consequently at most $D_a$ rounds are needed.
    At each depth there are at most $ceil.l 5 \/ a ceil.r$ components requiring a cut,
    because their masses sum to at most $m \/ 2$. Thus at most $K_a$ cut vertices are used.
    Mass located at a cut vertex is removed at that cut.
  Suppose every bag has edge weight less than $c m$. Delete every edge whose subtree meets a cut vertex.
    The deleted weight is less than $K_a c m = m \/ 40$, so the surviving weight $W'$ satisfies $W' > m \/ 4$.
    Each surviving subtree is wholly contained in one component of the cut tree;
    its assigned vertex lies there too. The total surviving weight in each such component is at most $a m \/ 10$.
    Use the components as classes of surviving edges. Subtrees of different classes are disjoint,
    so edges in different classes cannot conflict.
  Put $Q = floor.l a m floor.r$, so $Q gt.eq a m \/ 2$. Greedily choose a matching,
    with at most $Q$ selected edges from any class, until no further edge can be added.
    If $k$ edges have been selected, every surviving edge either meets one of their $2
    k$ endpoints or belongs to a class with $Q$ selected edges. The first family has weight at most $2 k$.
    There are at most $k \/ Q$ saturated classes, each of weight at most $a m \/ 10$. Therefore
  $ m / 4 < W' lt.eq 2 k + k / Q frac(a m, 10) lt.eq 11 / 5 k . $
  It follows that $k > 5 m \/ 44 > m \/ 20$. Its class sizes are at most $Q lt.eq a m$,
    but it has no conflict between different classes. This contradicts Property Section 2.3. ◻
]

#thm([Proposition 2.8.])[
  (A common bag).  #emph[Suppose the hypotheses of Lemma 2.6, Lemma 2.7 hold in the same tree.
    Suppose additionally that $S_e ∩ S_v eq.not diameter$ whenever the edge $e$ and the vertex $v in
    V_0$ conflict. If $q lt.eq c m \/ 4$, there is a vertex $x$ such that
#[#set math.equation(numbering: n => "(2.14)")
 $ \| { v in V_0 : x in.not S_v } \| < 5 q \, wide sum_(e : thin x in S_e) w_e gt.eq
   frac(c m, 2) . $ <mt:common-counts>]

 If all edges of $cal(E)$ have both endpoints in $V_0$ and $q lt.eq c m \/ 30$,
   deleting every edge incident with a missing vertex leaves bag weight at least $c m \/ 3$.]
] <mt:common-bag>

#proof[
  Let $r$ be the vertex bag from 10, let $z$ be the edge bag from 11, and let $A = { v in V_0 : r in S_v }$.
    Along the path from $r$ to $z$, each $S_v$ with $v in A$ is an initial interval.
    Thus the number of absent labels from $A$ is nondecreasing.
    If fewer than $2 q$ are absent at $z$, use $x = z$. It misses fewer than $3 q +
    2 q$ supplied vertex labels and has edge weight at least $c m$.
  Otherwise let $x y$ be the first edge of this path, in the direction from $r$ to $z$,
    for which fewer than $2 q$ labels of $A$ are absent at $x$, and at least $2 q$ are absent at $y$. Set
  $ A_(-) = { v in A : y in.not S_v } \, wide cal(E)_(+) = { e : z in S_e \, med x in.not S_e } . $
  Every subtree indexed by $A_(-)$ is contained in the $x$-side of $T - x y$: it contains $r$ and avoids $y$.
    Every subtree indexed by $cal(E)_(+)$ is contained in the $y$-side: it contains $z$ and avoids $x$.
    In particular these two families are disjoint. This uses #emph[all] root labels absent at $y$,
    including labels that ceased to occur earlier on the path;
    it does not require many labels to disappear on the single edge $x y$. See 2.
  If the bag weight at $x$ were less than $c m \/ 2$, then $sum_(e in cal(E)_(+)) w_e > c m \/ 2$.
    By 9, $cal(E)_(+)$ has a matching of size greater than $c m \/ 4$, hence at least $q$ since $q lt.eq
    c m \/ 4$. Also $\| A_(-) \| gt.eq 2 q$. No selected edge conflicts with any label in $A_(-)$,
    because such a conflict would force intersecting subtrees.
    Taking any $q$ of these labels violates Property Section 2.3.
    Thus the bag at $x$ has weight at least $c m \/ 2$; it misses fewer than $5 q$ supplied labels.
  Finally, the load bound shows that removing all edges incident with these missing vertices costs less than $5
    q$ weight. If $q lt.eq c m \/ 30$, the surviving bag weight is at least $c m \/ 2 - 5 q gt.eq c m \/ 3$,
    as asserted. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (8, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((0, 0), radius: 0.05997, fill: black, stroke: none)
  circle((1.5, 0), radius: 0.05997, fill: black, stroke: none)
  circle((3, 0), radius: 0.05997, fill: black, stroke: none)
  circle((4.3, 0), radius: 0.05997, fill: black, stroke: none)
  circle((5.4, 0), radius: 0.05997, fill: black, stroke: none)
  circle((6.7, 0), radius: 0.05997, fill: black, stroke: none)
  circle((8, 0), radius: 0.05997, fill: black, stroke: none)
  line((1.5, 0), (1.1, -0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3, 0), (3.4, -0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6.7, 0), (7.05, -0.55), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  content((4.3, 0), [#text(size: 9pt)[$x$]], anchor: "north", padding: 0.1176cm)
  content((5.4, 0), [#text(size: 9pt)[$y$]], anchor: "north", padding: 0.1176cm)
  content((8, 0), [#text(size: 9pt)[$z$]], anchor: "north", padding: 0.1176cm)
  line((4.85, -0.9), (4.85, 2.4), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((4.85, -0.92), [#text(size: 9pt)[cut edge $"xy"$]], anchor: "north", padding: 0.1176cm)
  line((0, 0.55), (1.5, 0.55), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((0, 0.95), (3, 0.95), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((0, 1.35), (4.3, 1.35), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((2.05, 2), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[root labels absent at $y$#linebreak()at least $2q$ in total]]])
  line((5.4, 0.55), (8, 0.55), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((6, 0.95), (8, 0.95), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((6.7, 1.35), (8, 1.35), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  content((6.65, 2), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[groups at $z$#linebreak()absent at $x$]]])
})],
  caption: [Figure 2: The path argument uses cumulative absence. The blue intervals show intersections with the path of root subtrees that avoid $y$; some may end well before $x$. The red intervals come from group subtrees containing $z$ and avoiding $x$. The two whole families lie on opposite sides of the cut, so no edge–vertex conflict can occur between them. ],
) <mt:fig-path>

#prodef([Remark 2.9.])[
  (Use with coordinate matchings).  In the matrix application a base label indexes at most $s$ coordinates,
    and the edge weight is the limit of the number of matched coordinate pairs of that type divided by $s$.
    A matching gives (2.13) automatically. Deleting all pairs incident with the fewer than $5
    q$ labels missing from the common bag removes fewer than $5 q s$ pairs.
    It removes entire edge types, so any previously chosen normalization inside a retained type stays the same.
    The finite tree principle applies jointly to the original positive label blocks and the positive blocks of the
    candidate edge types. These subspaces may overlap. A common bag consequently bounds all their normalized Gram
    interactions at once. Passing to coordinate subsets is a compression by an isometry, so it preserves that bound.
] <mt:coordinate-interface>

== 3 The matrix obstruction <mr:section>

We now prove the conditional matrix statement. Only the three properties of the base graph enter this section;
  the Strong Arnold Property is not needed. Throughout, $v = m s$ denotes the order of the clique blow-up.
  Matrix traces and squared Frobenius norms will be divided by $v$,
  even when the matrix under consideration has fewer than $v$ rows.

#thm([Theorem 3.1.])[
  (Matrix obstruction).  #emph[For every $a in \( 0 \, 1 \]$ there are constants $beta_0 \( a \) >
    0$ and $m_0 \( a \) in bb(N)$ with the following property.
    Let $0 < beta lt.eq beta_0 \( a \)$, let $m gt.eq m_0 \( a \)$,
    and let $G$ be an $m$-vertex graph satisfying the following conditions:]
  + #emph[Every matching of size at least $m \/ 20$, partitioned into classes of size at most $a m$,
    contains two conflicting edges in different classes.]
  + #emph[Every matching of size at least $beta m$ and every vertex set of size at least $beta
    m$ contain a conflicting edge–point pair.]
  + #emph[Every two vertex sets of size at least $beta m$ have a cross hole.]
  #emph[Then there is $s_0 = s_0 \( G \, a \, beta \)$ such that, for every integer $s gt.eq s_0$,
    every real symmetric well-signed matrix $M$ for the clique blow-up $G \[ K_s \]$ with exactly one negative
    eigenvalue satisfies
$ "rank" M > frac(m s, 2) + 1 . $

 Consequently $mu \( G \[ K_s \] \) + 1 < m s \/ 2$ for all these $s$.]
] <thm:matrix-obstruction>

The proof uses two normalizations. A first normalization, separately inside the vertex cliques,
  produces almost disjoint coordinate pairs. A second normalization,
  inside groups of pairs having the same two base labels, supplies additional positive directions.
  The tree lemmas ensure that both normalizations can be used in one bounded Gram matrix.
  We first give the linear-algebra estimates that make the errors independent of the bounds furnished by the tree.

=== 3.1 Positive blocks and bounded spectral limits <positive-blocks-and-bounded-spectral-limits>

For a real symmetric matrix $A$, write $n_(+) \( A \)$ and $n_(-) \( A \)$ for its positive and negative indices,
  counting multiplicity. The notation $parallel A parallel$ means the Euclidean operator norm,
  and $parallel A parallel_(upright(F))^2 = "Tr" \( A^(sans(T)) A \)$.
  A symmetric matrix with at most one negative eigenvalue is a Gram matrix for the Lorentz form

$ chevron.l x \, y chevron.r = - x_0 y_0 + sum_(i gt.eq 1) x_i y_i : $

diagonalize the matrix and multiply each eigenvector coordinate by the square root of the absolute value of its
  eigenvalue. Unused positive coordinates can be added. Every restriction or coefficient pullback of this Gram
  matrix still has at most one negative eigenvalue. For lists $X \, Y$ of Lorentz vectors, $chevron.l X \,
  Y chevron.r$ denotes their rectangular Gram matrix; the same letter denotes the corresponding synthesis map.

The next facts are standard consequences of symmetric $M$-matrix theory and the Perron–Frobenius theorem;
  see #cite(label("FiedlerSchneider1983Analytic"), form: "prose") Theorem 5.2 and
  #cite(label("DebreuHerstein1953Nonnegative"), form: "prose") Theorem I.
  Here an $M$-matrix has the form $c I - A$ with $A$ entrywise nonnegative and $c$ at least its spectral radius.
  We include the elementary proofs for the precise symmetric cases used below.

#thm([Lemma 3.2.])[
  (Normalization of a positive block).  #emph[Let $D$ be real symmetric with nonpositive off-diagonal entries.]
  + #emph[If $D$ is positive definite, its positive inverse square root $D^(- 1 \/ 2)$ is entrywise nonnegative
    and has positive diagonal entries.]
  + #emph[Suppose $D$ is positive semidefinite and the graph of its strictly negative off-diagonal entries is
    connected. If $D$ is singular, its kernel is one-dimensional and is spanned by a vector all of whose
    coordinates are positive. Every proper principal submatrix of $D$ is positive definite.]
] <mr:positive-block>

#proof[
  For (i), choose $c > lambda_max \( D \)$ and put $A = I - D \/ c$.
    All entries of $A$ are nonnegative, and its eigenvalues lie in $\[ 0 \, 1 \)$. The convergent binomial series gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ D^(- 1 \/ 2) = c^(- 1 \/ 2) sum_(k = 0)^oo binom(2 k, k) / 4^k A^k . $ <mr:inverse-root>]
  Every term is entrywise nonnegative, and the constant term has positive diagonal.
  For (ii), take $c > lambda_max \( D \)$ and consider $A = c I - D$.
    It is symmetric and entrywise nonnegative, with positive diagonal and connected off-diagonal support.
    A unit vector maximizing its Rayleigh quotient may be replaced by its coordinatewise absolute value,
    so a nonnegative maximizing eigenvector exists. Its eigenvalue is positive.
    The eigenvector equation and connectivity imply that it has no zero coordinate:
    a zero coordinate would force zeros at every adjacent coordinate and then everywhere.
    Moreover, every vector for the largest eigenvalue has one sign.
    Indeed, equality in the absolute-value Rayleigh inequality forces equal signs across each positive edge,
    while its absolute value is a nonnegative maximizing eigenvector and thus has full support.
    If the largest eigenspace had dimension at least two, it would contain a nonzero vector orthogonal to the
    positive eigenvector; that vector could not have one sign. The largest eigenvalue is therefore simple.
  When $D$ is singular and positive semidefinite, this largest eigenvalue of $A$ is $c$,
    so the asserted kernel description follows. If a proper principal submatrix were singular,
    extend a nonzero vector of zero quadratic form by zero coordinates.
    Its quadratic form under $D$ is zero, hence it belongs to $ker D$ by the spectral theorem.
    This contradicts full support. ◻
]

#thm([Lemma 3.3.])[
  (Spectral support from signs and inertia).  #emph[Let $v_j arrow.r oo$,
    and let $B_j$ be symmetric entrywise nonnegative matrices of orders $d_j lt.eq v_j$,
    with zero diagonal and $sup_j parallel B_j parallel < oo$. Suppose $n_(-) \( I - B_j \) lt.eq 1$.
    Every weak subsequential limit of
$ nu_j = 1 / v_j sum_(i = 1)^(d_j) delta_(lambda_i \( B_j \)) $

 is supported on $\[ - 1 \, 1 \]$ and has first moment zero.
   In particular, for each $epsilon > 0$, the number of eigenvalues of $I -
   B_j$ outside $\[ - epsilon \, 2 + epsilon \]$ is $o \( v_j \)$.]
  #emph[If also
$ liminf_j d_j / v_j gt.eq 1 - delta \, wide "rank" \( I - B_j \) lt.eq v_j \/ 2 + 1 \, $

 then
#[#set math.equation(numbering: n => "(3.2)")
 $ limsup_j frac(parallel B_j^2 - I parallel_(upright(F))^2, v_j) lt.eq 2 delta . $ <mr:spectral-error>]

 The constant in this inequality is independent of the operator bound.]
] <mr:spectral-support>

#proof[
  By 94, all measures have bounded mass and support in a common compact interval,
    so every subsequence has a weakly convergent further subsequence.
    Fix such a limit $nu$, and write $theta = nu \( bb(R) \) lt.eq 1$.
    At most one eigenvalue of $B_j$ exceeds $1$, hence $nu$ is supported on $\( - oo \, 1 \]$.
    For every integer $k gt.eq 0$, entrywise nonnegativity gives $"Tr" B_j^(2 k + 1) gt.eq 0$,
    and therefore $integral x^(2 k + 1) thin d nu \( x \) gt.eq 0$.
    If $nu$ gave mass $h > 0$ to $\( - oo \, - 1 - epsilon \]$, this integral would be at most $theta -
    h \( 1 + epsilon \)^(2 k + 1)$, which is negative for large $k$. This proves the support assertion.
    The zero diagonal gives $integral x thin d nu \( x \) = 0$.
    The asserted eigenvalue count follows by applying these facts to any putative subsequence on which the
    normalized exceptional count stays positive.
  For the additional assertion, pass to a subsequence realizing the limsup in (3.2) and then to a weak limit as
    above. The nullity assumption supplies at least $d_j - v_j \/ 2 - 1$ eigenvalues equal to $1$.
    Since singleton sets are closed, weak convergence gives $r := nu \( { 1 } \) gt.eq theta - 1 \/ 2$. Consequently
  $ integral_(x eq.not 1) \( 1 + x \) thin d nu \( x \) = theta - 2 r lt.eq 1 - theta lt.eq delta . $
  For $- 1 lt.eq x lt.eq 1$ we have $\( 1 - x^2 \)^2 lt.eq 1 - x^2 lt.eq 2 \( 1 + x \)$,
    and the first expression vanishes at $x = 1$. Polynomial integrals converge on the common compact support, so
  $ lim_j frac(parallel B_j^2 - I parallel_(upright(F))^2, v_j) = integral \( 1 - x^2 \)^2 thin d nu \( x \) lt.eq
    2 delta . $
  In this argument the bound on $parallel B_j parallel$ is fixed before $j$ tends to infinity.
    It removes the contribution of any exceptional eigenvalue to each fixed moment;
    it does not enter the resulting bound. ◻
]

Row-maximum rounding also appears in the study of nonnegative orthogonality constraints
  #cite(label("JiangMengWenChen2023Nonnegative")) #cite(label("ChenHeZhang2025Stiefel")).
  Here symmetry and zero diagonal produce a partial matching,
  with bounds independent of the matrix order after normalization by $v$.

#thm([Lemma 3.4.])[
  (Extraction of coordinate pairs).  #emph[Let $B$ be a symmetric entrywise nonnegative $d times
    d$ matrix with zero diagonal, where $d lt.eq v$. Suppose
$ parallel B^2 - I parallel_(upright(F))^2 lt.eq epsilon v \, wide 0 < epsilon lt.eq 8^(- 4) \, wide tau =
  epsilon^(1 \/ 4) . $

 There is a matching of coordinates with adjacency matrix $W$, extended by zero on the omitted coordinates, such that
#[#set math.equation(numbering: n => "(3.3)")
 $ \# { upright("omitted coordinates") } & lt.eq 5 tau^2 v \,\
parallel B - W parallel_(upright(F))^2 & lt.eq 8 tau^2 v \,\
\| B_(i j) - 1 \| & lt.eq tau quad upright("on every retained pair ") { i \, j } . $ <mr:matching-count>]

 Every retained pair has $B_(i j) > 0$.]
] <mr:matching>

#proof[
  Put
  $ d_i = sum_j B_(i j)^2 \, wide r_i = d_i^2 - sum_j B_(i j)^4 gt.eq 0 . $
  The diagonal entries of $B^2 - I$ show that $sum_i \( d_i - 1 \)^2 lt.eq epsilon v$. Nonnegativity also gives
  $ sum_i r_i & = sum_(j eq.not k) sum_i B_(i j)^2 B_(i k)^2\
 & lt.eq sum_(j eq.not k) (sum_i B_(i j) B_(i k))^2 lt.eq epsilon v . $
  Call row $i$ good when $\| d_i - 1 \| lt.eq tau$ and $r_i lt.eq tau^2$. There are at most $2 tau^2 v$ bad rows.
    In a good row, let $a_i = max_j B_(i j)^2$. Then
  $ a_i gt.eq frac(sum_j B_(i j)^4, d_i) = d_i - r_i \/ d_i \, wide d_i - a_i lt.eq frac(tau^2, 1 - tau) . $
  Because $tau lt.eq 1 \/ 8$, it follows that
  $ a_i gt.eq frac(1 - 2 tau, 1 - tau) gt.eq 6 / 7 \, wide d_i - a_i lt.eq 8 / 7 tau^2 \, wide \| sqrt(a_i) -
    1 \| lt.eq tau . $
  For the last inequality, use $1 - tau - tau^2 \/ \( 1 - tau \) gt.eq \( 1 - tau \)^2$ and $a_i lt.eq 1 +
    tau lt.eq \( 1 + tau \)^2$. There is a unique entry attaining $a_i$.
    If its other endpoint is good, symmetry forces it to be the dominant entry there as well,
    since its square is at least $6 \/ 7$ whereas every nondominant squared entry in a good row is at most $8
    tau^2 \/ 7$. These good–good pairs form the required matching.
  For any set $S$ of rows, Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(i in S) d_i lt.eq \| S \| + sqrt(\| S \| epsilon v) . $ <mr:row-mass>]
  Thus the total squared row mass at bad rows is at most $\( 2 + sqrt(2) tau \) tau^2 v$.
    Every good row whose dominant endpoint is bad contributes at least $6 \/ 7$ to this mass, by symmetry.
    The total number of omitted coordinates is consequently at most
  $ (2 + 7 / 6 \( 2 + sqrt(2) tau \)) tau^2 v lt.eq 5 tau^2 v . $
  For a retained row, its contribution to $parallel B - W parallel_(upright(F))^2$ is at most $tau^2 +
    8 tau^2 \/ 7 = 15 tau^2 \/ 7$. By (3.4), the omitted rows contribute at most $\( 5 + sqrt(5) tau \) tau^2 v$.
    Since $d lt.eq v$ and $tau lt.eq 1 \/ 8$, the sum is less than $8 tau^2 v$.
    The remaining assertions have already been proved. ◻
]

#thm([Lemma 3.5.])[
  (A trace bound across the second normalization).  #emph[For each $j$, let $H_j \,
    Q_j$ be two lists of Lorentz vectors whose joint Gram matrix has operator norm at most a fixed $K$.
    Let $v_j arrow.r oo$. Suppose that for every $epsilon > 0$ the Gram matrix $chevron.l Q_j \,
    Q_j chevron.r$ has $o \( v_j \)$ eigenvalues above $2 + epsilon$. If
$ limsup_j frac("Tr" chevron.l H_j \, H_j chevron.r, v_j) lt.eq eta \, $

 then
#[#set math.equation(numbering: n => "(3.5)")
 $ limsup_j frac(parallel chevron.l H_j \, Q_j chevron.r parallel_(upright(F))^2, v_j) lt.eq
   2 eta . $ <mr:trace-cross-bound>]

 The conclusion is independent of $K$.]
] <mr:trace-cross>

#proof[
  Let $J_j$ be the joint Gram matrix. Its negative part has rank at most one and norm at most $K$.
    Replacing $J_j$ by its positive part changes any normalized trace by $O \( K \/ v_j \)$ and changes a
    Frobenius norm divided by $sqrt(v_j)$ by $O \( K \/ sqrt(v_j) \)$.
    Write the resulting positive semidefinite matrix as
  $ P_j = mat(delim: "(", A_j, C_j; C_j^(sans(T)), D_j) . $
  A rank-one perturbation changes the number of eigenvalues above any fixed threshold by at most one,
    by the variational characterization of eigenvalues. Thus the spectral projector $E_(upright("hi"))$ of $D_j$
    for $\( 2 + epsilon \, oo \)$ has rank $o \( v_j \)$. Put $E_(upright("lo")) = I - E_(upright("hi"))$.
    Factor $P_j$ as a Euclidean Gram matrix, say $A_j = U_j^(sans(T)) U_j$, $D_j = V_j^(sans(T)) V_j$ and $C_j =
    U_j^(sans(T)) V_j$. Since $parallel V_j E_(upright("lo")) parallel^2 lt.eq 2 + epsilon$,
  $ parallel C_j E_(upright("lo")) parallel_(upright(F))^2 lt.eq \( 2 + epsilon \) "Tr" A_j . $
  On the other spectral subspace, $parallel C_j E_(upright("hi")) parallel_(upright(F))^2 lt.eq
    K^2 "rank" E_(upright("hi")) = o \( v_j \)$. Divide by $v_j$ and take the limsup.
    This first bounds $parallel C_j parallel_(upright(F)) \/ sqrt(v_j)$.
    The original cross block differs by Frobenius norm at most $K$,
    so it has the same squared normalized limsup bound, at most $\( 2 + epsilon \) eta$.
    Finally let $epsilon arrow.b 0$. In particular the hypotheses force $eta gt.eq 0$,
    since the normalized trace of the original $H_j$ block has nonnegative liminf. ◻
]

=== 3.2 The first normalization and the candidate groups <the-first-normalization-and-the-candidate-groups>

#proof[
  Use the constant $c = c \( a \) > 0$ from 11; explicitly we may take
  #[#set math.equation(numbering: n => "(3.6)")
   $ K \( a \) & = ⌈5 / a⌉ (⌈log_2 5 / a⌉ + 1) \, & c \( a \) & = frac(1, 40 K \( a \)) \,\
delta_0 \( a \) & = min {frac(1, 3 dot.op 8^4) \, frac(c \( a \), 12) \, 1 /
  3 (frac(c \( a \), 2340))^4} \, & beta_0 \( a \) & = frac(delta_0 \( a \), 10) \,\
m_0 \( a \) & = ⌈max {2 / a \, frac(10, delta_0 \( a \)) \, 2}⌉ . $ <mr:constants>]
  Fix $a \, beta \, m \, G$ as in the theorem with these choices, and put
  #[#set math.equation(numbering: n => "(3.7)")
   $ q = ceil.l beta m ceil.r \, wide delta = 5 \( beta + 1 \/ m \) \, wide
     tau = \( 3 delta \)^(1 \/ 4) . $ <mr:error-parameters>]
  These choices imply
  #[#set math.equation(numbering: n => "(3.8)")
   $ delta lt.eq delta_0 \, wide tau lt.eq 1 / 8 \, wide tau lt.eq c / 2340 \, wide q / m lt.eq delta / 5 lt.eq
     c / 60 \, wide a m gt.eq 2 . $ <mr:smallness>]
  Suppose the conclusion fails. There is then an unbounded sequence of integers $s$ and corresponding well-signed
    matrices $M_s$ with one negative eigenvalue such that, writing $v = m s$,
  #[#set math.equation(numbering: n => "(3.9)")
   $ "rank" M_s lt.eq v \/ 2 + 1 . $ <mr:contradiction-rank>]
  All subsequences below keep $a \, beta \, m$ and the graph $G$ fixed, and $s arrow.r
    oo$ is the only limiting operation. An expression $o \( v \)$ has ratio to $v$ tending to zero in this limit;
    its constants may depend on the fixed graph and subsequence.
    The displayed constants in the errors involving $delta$ or $tau$ are absolute.
  Represent $M_s$ by Lorentz Gram vectors, one for each blow-up vertex.
    An original vertex label $u in V \( G \)$ specifies its $s$-column clique block.
    By passing to a subsequence, the set of labels whose clique blocks have a negative eigenvalue can be fixed.
    Two such labels cannot be a hole: zero cross Gram would make their negative directions orthogonal and give two
    negative eigenvalues of $M_s$. These labels therefore form a clique in $G$.
    There are fewer than $2 q$ of them, since two disjoint $q$-element subsets of a larger clique would violate
    condition (iii). Discard these labels.
  The other clique blocks are positive semidefinite. They have strictly negative off-diagonal entries;
    15 shows that deleting at most one coordinate makes each positive definite.
    Work with $s gt.eq 2$, and apply 8 to their positive spans.
    For every hole between two labels the blocks are orthogonal, so their tree subtrees intersect.
    By 10, there is a bag missing fewer than $3 q$ of the supplied single labels.
    Keep the labels in this bag and denote their set by $U$. There are fewer than $5 q$ missing original labels.
    The retained coordinate dimension $d_s$ satisfies
  #[#set math.equation(numbering: n => "(3.10)")
   $ d_s gt.eq \( m - 5 q \) \( s - 1 \) \, wide liminf_(s arrow.r oo) d_s / v gt.eq 1 - delta . $ <mr:first-dimension>]
  The tree and the chosen bag are fixed on a further subsequence.
  Normalize each retained clique block by its positive inverse square root,
    and denote the resulting column lists by $X_u$, $u in U$. Their diagonal Gram blocks are identities.
    By 15, the normalizing coefficient matrices are entrywise nonnegative with positive diagonal.
    Thus cross blocks remain zero on holes and strictly negative on base edges. The full Gram matrix of the $X_u$ is
  #[#set math.equation(numbering: n => "(3.11)")
   $ A_s = I - B_s \, wide B_s gt.eq 0 med upright("entrywise") \, wide \( B_s \)_(u u) = 0 med
     upright("as a whole diagonal block") . $ <mr:first-gram>]
  The bag bound from Proposition 2.4, Lemma 2.1 makes $parallel B_s parallel$ uniformly bounded in $s$.
    The rank is at most that of $M_s$, and its negative index is at most one. Consequently 16 gives
  $ limsup_(s arrow.r oo) frac(parallel B_s^2 - I parallel_(upright(F))^2, v) lt.eq 2 delta . $
  Since $delta > 0$ is fixed, the left-hand quantity before taking a limsup is at most $3 delta =
    tau^4$ for all sufficiently large $s$. Apply 17 to obtain a coordinate matching with $p_s^0$ pairs and
    adjacency matrix $W_s$. Then
  #[#set math.equation(numbering: n => "(3.12)")
   $ liminf_s p_s^0 / v & gt.eq 1 / 2 - delta / 2 - 5 / 2 tau^2 \,\
parallel B_s - W_s parallel_(upright(F))^2 & lt.eq 8 tau^2 v \, wide \| \( B_s \)_(i j) - 1 \| lt.eq tau quad
  upright("on retained pairs") . $ <mr:first-matching>]
  Every pair connects two different adjacent base labels, because $B_s$ vanishes within each original block and on
    base holes.
  Group the pairs by their unordered label pair $e = { u \, w } in E \( G \)$.
    If group $e$ contains $k_e \( s \)$ pairs, pass to a subsequence on which every $k_e \( s \) \/ s$ converges,
    and put
  #[#set math.equation(numbering: n => "(3.13)")
   $ w_e = lim_s k_e \( s \) \/ s \, wide sum_(e in.rev u) w_e lt.eq 1 \, wide sum_e w_e lt.eq m \/ 2 . $ <mr:weights>]
  There are only finitely many types, so we may also fix whether each group is empty or its endpoint Gram block is
    positive definite, singular positive semidefinite, or has a negative eigenvalue.
  Groups in the last category will not be candidates for the second normalization.
    Their types are pairwise touching: a conflict between two of them would make their cross Gram zero and give
    two orthogonal negative directions. Choose a maximal ordinary matching of these types in the base graph,
    of size $k$. If $k gt.eq m \/ 20$, putting each edge in its own class contradicts (i), since $a m gt.eq 1$.
    Thus $k < m \/ 20$. The $2 k$ endpoints of this maximal matching cover all the types under consideration.
    The load bound in (3.13) therefore gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_(e : thin upright("group has a negative eigenvalue")) w_e lt.eq 2 k < m \/ 10 . $ <mr:indefinite-weight>]
  Their coordinate pairs are retained in the first matching.
  For every group of positive weight with positive semidefinite endpoint Gram, that Gram has the form
  $ mat(delim: "(", I, - C; - C^(sans(T)), I) \, wide C med upright("entrywise strictly positive") . $
  The graph of negative entries is connected. If the group is singular, delete one whole matching pair.
    By 15 its remaining Gram block is positive definite. Positive weight ensures that the group is eventually
    nonempty after this deletion. There are at most $binom(m, 2)$ groups, so these deletions cost $O \( m^2 \) =
    o \( v \)$ coordinates. Call the resulting positive definite groups of positive weight the #emph[candidate
    groups]. Groups of zero limiting weight need not be candidates and keep their pairs in the first matching.
    By (3.12), (3.14) and $tau lt.eq 1 \/ 8$, the total candidate weight satisfies
  #[#set math.equation(numbering: n => "(3.15)")
   $ sum_(e upright(" candidate")) w_e gt.eq m (2 / 5 - delta / 2 - 5 / 2 tau^2) > frac(3 m, 10) .
     $ <mr:candidate-weight>]
  === 3.3 A common bag for both normalizations <a-common-bag-for-both-normalizations>
  Apply 8 again, this time to the single-label positive spans for all $u in
    U$ together with the positive spans of all candidate groups. These spans are allowed to overlap.
    The required subtree contacts hold in each of the following cases:
    two single labels form a hole; two group types conflict; or a group type and a single label conflict.
    In each case all cross Gram entries vanish, so the positive spans are orthogonal and their flats intersect.
  The candidate weights satisfy 11, so a bag has group weight at least $c m$.
    Apply 12 to the supplied single labels $U$ and these groups, using $q lt.eq c m \/ 60$.
    It yields a bag containing all but fewer than $5 q$ labels of $U$,
    and containing candidate group weight at least $c m \/ 2$.
    The common-bag proof uses all root labels absent after its threshold edge,
    so it applies equally when the losses occur one label at a time.
  Discard from the remaining coordinate matching every pair incident to one of the missing labels of $U$.
    This removes whole label-pair groups and at most $5 q s$ pairs.
    Denote the surviving total number of pairs by $p = p_s$. Let $cal(T)$ be the candidate groups in the common
    bag whose endpoints both remain, and let $t = t_s$ be their total number of pairs.
    Since the load at a missing label is at most one, the limiting weight lost from the bag is at most $5 q$. Thus
  #[#set math.equation(numbering: n => "(3.16)")
   $ liminf_s p / v & gt.eq 1 / 2 - delta / 2 - 5 / 2 tau^2 - frac(5 q, m) gt.eq 1 / 2 - 3 tau^2 \,\
lim_s t / v & gt.eq c / 2 - frac(5 q, m) gt.eq c / 3 . $ <mr:final-pair-count>]
  For the last inequality in (3.16), use $5 q \/ m lt.eq delta = tau^4 \/ 3$ and $tau lt.eq 1$.
    All group counts have limits after the earlier subselection, so $t \/ v$ does as well.
  Write $X$ for the list of the $2 p$ surviving matched endpoint columns, still in the first normalization.
    For $e in cal(T)$, let $k_e$ denote its remaining number of pairs and write $X_e$ for its $2
    k_e$-column sublist, $D_e = chevron.l X_e \, X_e chevron.r$, and
  #[#set math.equation(numbering: n => "(3.17)")
   $ Q_e = X_e D_e^(- 1 \/ 2) \, wide Q = \( Q_e \)_(e in cal(T)) . $ <mr:second-normalization>]
  The common bag gives a uniform operator bound for the joint Gram of the first-normalized single blocks and all
    $Q_e$. Passing to the sublist $X$ does not increase this bound.
    This point controls $Q_e$ even when some eigenvalues of $D_e$ tend to zero and the coefficients in
    $D_e^(- 1 \/ 2)$ become large.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.553cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[First normalization#linebreak()$chevron.l X_u,X_u chevron.r =I$#linebreak()coordinate pairs]]])])
  content((5.653, 0), [#box(width: 4.553cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Pair differences $R$#linebreak()$chevron.l R,R chevron.r approx 2I$#linebreak()pair sums $H$#linebreak()have small trace]]])])
  content((0, -3), [#box(width: 4.553cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Second normalization#linebreak()$chevron.l Q_e,Q_e chevron.r =I$#linebreak()within candidate groups]]])])
  content((5.653, -3), [#box(width: 4.553cm, inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Exact complements $Q_"eL"_e$#linebreak()$k_e$ extra directions#linebreak()orthogonal to $R_e$]]])])
  line((2.276, 0), (3.376, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, -0.925), (0, -2.075), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, -1.5), [#text(size: 9pt)[one common#linebreak()tree bag]], anchor: "east", padding: 0.1176cm)
  line((2.276, -3), (3.376, -3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((5.653, -0.925), (5.653, -2.075), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.653, -1.5), [#text(size: 9pt)[small cross Gram#linebreak()via $H$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 3: The two normalizations. The common bag bounds all indicated Gram matrices. The trace estimate for $H$, followed by a spectral cutoff at $2$, controls the interaction with the second normalization using an absolute constant. ],
  ) <mr:two-scales>
  === 3.4 The additional positive directions <the-additional-positive-directions>
  For each surviving pair $j = { i \, i' }$ choose an order of its endpoints and form
  $ R_j = frac(X_i - X_(i'), sqrt(2)) \, wide H_j = frac(X_i + X_(i'), sqrt(2)) . $
  The coefficient maps producing either list from $X$ are Euclidean isometries.
    The restriction of $I - W_s$ to retained pair endpoints has Gram $2 I$ on the difference coefficients.
    Hence (3.3) and contraction of Frobenius norm give
  #[#set math.equation(numbering: n => "(3.18)")
   $ parallel chevron.l R \, R chevron.r - 2 I_p parallel_(upright(F))^2 lt.eq 8 tau^2 v . $ <mr:R-bound>]
  Also $chevron.l H_j \, H_j chevron.r = 1 - \( B_s \)_(i i')$, so
  #[#set math.equation(numbering: n => "(3.19)")
   $ \| "Tr" chevron.l H \, H chevron.r \| lt.eq p tau lt.eq frac(tau v, 2) . $ <mr:H-trace>]
  These statements persist after all the pair deletions: they are restrictions of the original matching estimates.
  The coefficients in each $D_e^(- 1 \/ 2)$ are entrywise nonnegative.
    Distinct groups have disjoint endpoint coordinates, and all cross Gram entries between such coordinates are
    nonpositive. Coordinates with the same base label have zero interaction,
    since the first diagonal blocks are identities. Therefore
  #[#set math.equation(numbering: n => "(3.20)")
   $ chevron.l Q \, Q chevron.r = I - C_s \, wide C_s gt.eq 0 med upright("entrywise") \, wide \( C_s \)_(e e) =
     0 med upright("as a whole group block") . $ <mr:Q-sign>]
  It is bounded in operator norm and has at most one negative eigenvalue.
    By 16, its limiting spectral support lies in $\[ 0 \, 2 \]$:
    more precisely, for every fixed $epsilon > 0$ there are $o \( v \)$ eigenvalues outside
    $\[ - epsilon \, 2 + epsilon \]$. The joint Gram of $\( H \, Q \)$ is bounded by the common bag.
    Applying 18 to (3.19) yields the absolute estimate
  #[#set math.equation(numbering: n => "(3.21)")
   $ limsup_s frac(parallel chevron.l H \, Q chevron.r parallel_(upright(F))^2, v) lt.eq tau . $ <mr:HQ-bound>]
  In particular, no factor depending on the norm of the common bag appears here.
  Fix a candidate group $e in cal(T)$. Let $U_e$ be the $2 k_e times
    k_e$ Euclidean isometry whose columns are the coefficient vectors of its pair differences. Then
  $ R_e = X_e U_e = Q_e T_e \, wide T_e = D_e^(1 \/ 2) U_e . $
  Because $D_e$ is positive definite, $T_e$ has rank exactly $k_e$.
    Choose a $2 k_e times k_e$ matrix $L_e$ whose columns are an orthonormal basis of $\( "im" T_e \)^perp$. Thus
  #[#set math.equation(numbering: n => "(3.22)")
   $ L_e^(sans(T)) L_e = I_(k_e) \, wide chevron.l R_e \, Q_e L_e chevron.r = T_e^(sans(T)) L_e =
     0 . $ <mr:exact-complement>]
  This uses the full span of all the group’s original difference directions;
    no small singular direction is discarded. Write $L = "diag" \( L_e \)_(e in cal(T))$ and $Y = Q L$.
    The list $Y$ has exactly $t$ columns.
  For a pair $j$ outside group $e$, each of the two numbers $x = chevron.l X_i \, \( Q_e \)_k chevron.r$ and $y =
    chevron.l X_(i') \, \( Q_e \)_k chevron.r$ is nonpositive. Consequently
  #[#set math.equation(numbering: n => "(3.23)")
   $ \| chevron.l R_j \, \( Q_e \)_k chevron.r \| = frac(\| x - y \|, sqrt(2)) lt.eq - frac(x + y, sqrt(2)) = -
     chevron.l H_j \, \( Q_e \)_k chevron.r . $ <mr:sign-domination>]
  This includes pairs in noncandidate groups. Let $Z$ be $chevron.l R \,
    Q chevron.r$ with the entries between each $R_e$ and its own $Q_e$ replaced by zero.
    Then $parallel Z parallel_(upright(F))^2 lt.eq parallel chevron.l H \, Q chevron.r parallel_(upright(F))^2$,
    and (3.22) gives $chevron.l R \, Y chevron.r = Z L$. Since $L$ is an isometry,
    Frobenius contraction and (3.21) imply
  #[#set math.equation(numbering: n => "(3.24)")
   $ limsup_s frac(parallel chevron.l R \, Y chevron.r parallel_(upright(F))^2, v) lt.eq tau . $ <mr:RY-bound>]
  Put $E_s = chevron.l Y \, Y chevron.r = L^(sans(T)) chevron.l Q \, Q chevron.r L$.
    Every diagonal group block of $E_s$ is an identity, so
  #[#set math.equation(numbering: n => "(3.25)")
   $ "Tr" E_s = t . $ <mr:Y-trace>]
  This is a Euclidean coefficient compression. The variational characterization of eigenvalues shows that the
    number of eigenvalues of $E_s$ above $2 + epsilon$ is at most that for $chevron.l Q \, Q chevron.r$,
    hence is $o \( v \)$. Its norm is bounded. If $k_s$ denotes its number of eigenvalues greater than $1 \/ 4$,
    use the cutoff $2 + epsilon = 5 \/ 2$ to obtain
  $ t = "Tr" E_s lt.eq frac(t - k_s, 4) + 5 / 2 k_s + o \( v \) . $
  Possible negative eigenvalues only decrease the left-hand trace contribution in this upper estimate. Rearranging gives
  #[#set math.equation(numbering: n => "(3.26)")
   $ k_s gt.eq t \/ 3 - o \( v \) . $ <mr:Y-positive-count>]
  Finally consider the joint Gram matrix of $\( R \, Y \)$.
    By (3.18), the number of eigenvalues of $chevron.l R \, R chevron.r$ at most $1 \/ 4$ is at most
  $ 16 / 49 parallel chevron.l R \, R chevron.r - 2 I_p parallel_(upright(F))^2 lt.eq 128 / 49 tau^2 v . $
  Restrict the two diagonal blocks to their spectral spaces above $1 \/ 4$.
    This leaves at least $p - \( 128 \/ 49 \) tau^2 v$ dimensions on the $R$ side and $t \/ 3 -
    o \( v \)$ on the $Y$ side. The restricted cross matrix has squared Frobenius norm at most $parallel chevron.l
    R \, Y chevron.r parallel_(upright(F))^2$. Delete from the first side its left singular directions with
    singular values greater than $1 \/ 8$. The number deleted is at most $64 parallel chevron.l R \,
    Y chevron.r parallel_(upright(F))^2$. The remaining diagonal blocks are greater than $I \/ 4$,
    and the cross operator norm is at most $1 \/ 8$. For their coefficient vectors $x \, y$,
    the joint quadratic form is bounded below by
  $ 1 / 4 \( parallel x parallel^2 + parallel y parallel^2 \) - 1 /
    4 parallel x parallel parallel y parallel gt.eq 1 / 8 \( parallel x parallel^2 + parallel y parallel^2 \) \, $
  so this remaining space is positive definite. Using (3.24), the positive index of the joint Gram is at least
  #[#set math.equation(numbering: n => "(3.27)")
   $ p + t / 3 - 128 / 49 tau^2 v - 64 tau v - o \( v \) . $ <mr:rank-gain>]
  Every column used here is a linear combination of the original Lorentz Gram columns for $M_s$.
    The joint Gram is therefore a coefficient pullback of $M_s$, and its positive index is at most $"rank" M_s$.
    This argument does not require the combined list $\( R \, Y \)$ to be linearly independent.
  Combine (3.16), (3.16) and (3.27). Since $tau lt.eq 1 \/ 8$,
  $ liminf_s frac("rank" M_s, v) & gt.eq 1 / 2 + c / 9 - 64 tau - 275 / 49 tau^2\
 & gt.eq 1 / 2 + c / 9 - 65 tau gt.eq 1 / 2 + c / 12 \, $
  where the last inequality uses $tau lt.eq c \/ 2340$. This contradicts (3.9),
    whose normalized right-hand side tends to $1 \/ 2$. Hence only finitely many $s$ can violate the stated rank
    bound. The positive gap also shows directly why the literal additive $+
    1$ is harmless for all sufficiently large $s$.
  Every matrix in the definition of $mu \( G \[ K_s \] \)$ is among the matrices just considered.
    Rank–nullity gives $dim ker M < m s \/ 2 - 1$, and taking the maximum yields $mu \( G \[ K_s \] \) +
    1 < m s \/ 2$ as asserted. ◻
]

For completeness, the matrix class defining $mu \( H \)$ is nonempty for every finite nonempty graph $H$.
  Start from a diagonal matrix with one diagonal entry $- 1$ and all others $1$,
  and put the same sufficiently small negative number in each edge position.
  The perturbation has operator norm less than $1 \/ 2$ when its size is sufficiently small,
  so the matrix is nonsingular with exactly one negative eigenvalue.
  Nonsingularity makes the Strong Arnold Property immediate.

If the base graph additionally satisfies $alpha \( G \) lt.eq 2$, then $alpha \( G \[ K_s \] \) lt.eq 2$:
  an independent set uses at most one vertex of each clique, and its base labels are independent.
  Thus $chi \( G \[ K_s \] \) gt.eq ceil.l m s \/ 2 ceil.r > mu \( G \[ K_s \] \) + 1$.
  Together with 2, the theorem above proves 1. One may also recover the chromatic number exactly as
  $chi \( G \[ K_s \] \) = m s - nu \( overline(G \[ K_s \]) \)$, where $nu$ is the maximum matching size:
  every color class has one or two vertices, and the two-vertex classes are precisely disjoint hole pairs.

== 4 The tensor geometry and the hole relation <sec:geometry>

We construct a triangle-free relation of holes from tensor equations.
  The complement of this relation will be our base graph; the moment arguments in the next sections force its
  conflict properties. All vector spaces, linear maps, tensor products and ranks in the construction are over
  $bb(F)_2 = bb(F)_2$. We use the entrywise pairing of matrices:

$ chevron.l A \, B chevron.r = sum_(r \, c) A_(r c) B_(r c) = "Tr" \( A^(sans(T)) B \) . $

Probabilities and entropy take real values.

=== 4.1 The order of parameters <the-order-of-parameters>

We first fix the parameter hierarchy, then define the coefficient space, its tensor-valued frame embeddings,
  and the hole equations. The fixed constants below bound the information retained about a unit and the number of
  vectors whose equality will certify a conflict. Their order ensures that the colour-class scale precedes the
  graph threshold, and that the thinning rate precedes the ambient dimension multiplier.

The construction has one asymptotic parameter $n$. Every numerical parameter below,
  including the dimension multiplier $M_0$, is fixed before $n$ tends to infinity. Set

#[#set math.equation(numbering: n => "(4.1)")
 $ C_0 = 1000 \, wide g = 10^9 + 1 \, wide D = 4 C_0 g \, wide M = 2^1000 \, wide k_max =
   56 \( g - 1 \) . $ <eq:early-constants>]

In particular, $g$ is odd. The first pin budget and the entropy slack are

#[#set math.equation(numbering: n => "(4.2)")
 $ zeta = frac(1, 1000 k_max) \, wide K_1 = ⌈frac(4 \( D + 1 \), zeta)⌉ . $ <eq:pin-budgets>]

For the phase estimates and a common upper bound on all pin dimensions, define

#[#set math.equation(numbering: n => "(4.3)")
 $ r = 2 K_1 + 2 \, wide L_0 = ceil.l 100 \( D + 10 \) ceil.r \, wide d_0 = 4 r L_0 \,\
u_0 = 10 \( K_1 + d_0 + 1 \) \, wide K = ⌈frac(10 \( D + K_1 + u_0 + 10 \), zeta)⌉ . $ <eq:law-budgets>]

The budget $K$ is a conservative upper bound; the construction uses only the first peeling,
  whose pin dimension is at most $K_1$. The additional probability thresholds in 9 use only these early parameters
  and fixed numerical tolerances. They do not depend on the selector or channel dimensions.

The early probability margins determine a colour cap $eta_(upright("col")) >
  0$ and then the graph class scale $a > 0$. Given the graph threshold $beta > 0$,
  choose the endpoint-density bound $L$ required in 16. Next choose the selector parameters $j_(*) \,
  b$ and the mixer parameters through $J$ as in 6. Choose $r_0$ sufficiently large after those choices and all
  fixed density bounds, and put $h = 1000 r_0$. After $h$, choose a sufficiently small thinning rate $rho >
  0$ as in 5. Finally choose a sufficiently large integer $M_0$, also relative to $1 \/ rho$, and set

#[#set math.equation(numbering: n => "(4.4)")
 $ \( C_0 \, g \, D \, M \, k_max \, zeta \, K_1 \; med r \, L_0 \, d_0 \, u_0 \, K \)\
arrow.r med \( eta_(upright("col")) \, a \) med arrow.r med \( beta \, L \) med arrow.r
  med \( j_(*) \, b \, upright("mixer parameters") \, J \)\
arrow.r med \( r_0 \, h = 1000 r_0 \) med arrow.r med rho med arrow.r med M_0 \, wide N = M_0 n \, wide m =
  2^(C_0 g N) . $ <eq:parameter-order>]

We always take $n gt.eq 2 r_0$ and subsequently increase its lower bound as needed.
  The matrices used below have dimensions depending on $n$; for each $n$ they are chosen to satisfy 35,
  before any law of units is considered. The complete ledger of inequalities is in 17.

An $O \( n \)$ bit count below has a constant depending only on parameters chosen before $M_0$.
  It can therefore be made a prescribed small fraction of $N$. This is different from an $o \( N \)$ bound:
  after $M_0$ is fixed, $n \/ N = 1 \/ M_0$ is constant. Later fixed tests and tolerances may change how large $n$
  must be; they do not change any earlier construction parameter.

=== 4.2 Moment matrices and cut profiles <moment-matrices-and-cut-profiles>

Let

$ cal(I) = bb(Z) \/ g bb(Z) \, wide cal(E) = binom(cal(I), 2) \, wide I_d = { d + 1 \, dots.h \,
  d + \( g - 1 \) \/ 2 } subset cal(I) . $

Elements of $cal(I)$ are #emph[tags]; elements of $cal(E)$ are #emph[components].
  The ordinary, or base, variables comprise $g^2 + 3$ blocks of $n$ bits:

$ O_(d \, t) quad \( d \, t in cal(I) \) \, wide S \, quad \# \, quad Z . $

A separate selector has $b$ bits. Its values $s in bb(F)_2^b$ are called #emph[labels], to distinguish them from tags.

The $O$-blocks carry testers whose availability depends on the tag,
  while $S$ carries a tester available at every tag. The additional $\#$-block lets the self-Gram form $E$,
  defined below, distinguish different selector labels. The $Z$-block is absent from $E$;
  its free coordinates and change-of-basis symmetry are used in the later parameter tests.

Let

$ p_(*) = sum_(j = 0)^(j_(*)) binom(b, j) \, wide cal(B) = bb(F)_2^(p_(*)) ⊗ bb(F)_2^(thin 1 + \( g^2 + 3 \) n) . $

The first factor is indexed by squarefree selector monomials of degree at most $j_(*)$;
  the second by the constant and the individual base variables.
  If $p_s$ is the vector of selector-monomial evaluations and $z$ is a base value, write

#[#set math.equation(numbering: n => "(4.5)")
 $ v \( s \, z \) = p_s ⊗ \( 1 \, z \) in cal(B) . $ <eq:point-evaluation>]

Thus the row and column coordinates both represent monomials of base degree at most one and selector degree at
  most $j_(*)$.

Let $W subset cal(B) ⊗ cal(B)$ be the span of the point moments $v \( s \, z \) v \( s \, z \)^(sans(T))$.
  For $l in cal(I)$, let $W_l$ be the span of those point moments for which

$ O_(d \, t) = 0 quad upright("whenever ") l in.not I_d . $

Let $W_(*)$ be defined by requiring every $O$-block to be zero. The cut-profile space is

#[#set math.equation(numbering: n => "(4.6)")
 $ cal(X) = {x = \( x_({ l \, l' }) \)_({ l \, l' } in cal(E)) : x_({ l \, l' }) = w_l + w_(l') \, quad
   w_l in W_l} . $ <eq:cut-profile-space>]

A tuple $w = \( w_l \)_(l in cal(I))$ as in this display is a #emph[representation] of $x$.

#thm([Lemma 4.1.])[
  #emph[The intersection of $W_l$ over any strict majority of tags is $W_(*)$.
    Two representations of the same cut profile differ by a constant tuple with value in $W_(*)$.]
] <lem:cut-kernel>

#proof[
  Fix a base coordinate in $O_(d \, t)$. It is allowed at exactly $\( g - 1 \) \/ 2$ tags.
    A strict majority therefore contains a tag where that coordinate is disallowed.
    Every row and column involving it is zero in $W_l$ for that tag.
    A matrix in the intersection consequently has zero rows and columns at all $O$-coordinates.
  The coordinate projection that sets all $O$-variables to zero sends each point moment to a point moment defining
    $W_(*)$. Applied on both matrix factors, it fixes the matrix just described.
    That matrix is therefore in $W_(*)$, proving the nontrivial inclusion.
  If $w \, w'$ give the same differences, then $w_l + w'_l = w_(l') + w'_(l')$ for every pair of tags.
    Their difference is a constant tuple. Its value belongs to every $W_l$, hence to $W_(*)$.
    Conversely every such constant tuple lies in the kernel of the cut map. ◻
]

In each $O_(d \, t)$-block and in $S$, choose the first $2 r_0$ coordinates in disjoint ordered pairs.
  The corresponding linear functionals on moments are

$ eta_(d \, t) #scale(x: 120%, y: 120%)[\(] v \( s \, z \) v \( s \, z \)^(sans(T)) #scale(x: 120%, y: 120%)[\)] =
  sum_(rho = 1)^(r_0) z_(O_(d \, t) \, 2 rho - 1) z_(O_(d \, t) \, 2 rho) \, wide
  eta_S #scale(x: 120%, y: 120%)[\(] v \( s \, z \) v \( s \, z \)^(sans(T)) #scale(x: 120%, y: 120%)[\)] =
  sum_(rho = 1)^(r_0) z_(S \, 2 rho - 1) z_(S \, 2 rho) . $

They are well defined by selecting the indicated ordered matrix entries. Put

$ eta_O = sum_(d \, t) eta_(d \, t) \, wide eta = eta_O + eta_S . $

For a cut profile represented by $w$, define

#[#set math.equation(numbering: n => "(4.7)")
 $ a_t \( x \) & = sum_(l \, d) eta_(d \, t) \( w_l \) \, & a \( x \) & = sum_t a_t \( x \) = sum_l eta_O \( w_l \) \,\
b_t \( x \) & = sum_(l eq.not t) eta_S \( w_l \) \, & chi_(*) \( w \) & = sum_l eta \( w_l \) . $ <eq:cut-functionals>]

The functions $a_t \, a \, b_t$ are well defined on $cal(X)$.
  Indeed, a constant kernel value in $W_(*)$ contributes zero to every $O$-tester,
  while it contributes $\( g - 1 \) eta_S \( w_(*) \) = 0$ to $b_t$.
  The quantity $chi_(*) \( w \)$ is used only when a representation has been specified.

Define a symmetric bilinear form $T^0$ on $cal(X)$ by

#[#set math.equation(numbering: n => "(4.8)")
 $ T^0 = a ⊗ a + sum_(t in cal(I)) \( a_t ⊗ b_t + b_t ⊗ a_t \) . $ <eq:T-zero>]

For $1 lt.eq j lt.eq J$ and ordered components $e \, f$, choose endomorphisms $L_j^(e f) \,
  R_j^(e f)$ of $cal(B)$. Their required properties will be proved in 35. Set

#[#set math.equation(numbering: n => "(4.9)")
 $ B^1 \( x \, y \) & = sum_(j = 1)^J sum_(e \, f in cal(E)) chevron.l x_e \,
   L_j^(e f) y_f \( R_j^(e f) \)^(sans(T)) chevron.r \,\
T^1 \( x \, y \) & = B^1 \( x \, y \) + B^1 \( y \, x \) \, wide T = T^0 + T^1 \, wide r \( x \) = a +
  T \( x \, dot.op \) in cal(X)^(*) . $ <eq:T-one>]

Here and later the letter $r$ in $r \( x \)$ denotes an affine-gradient map;
  the early integer $r$ in (4.3) is its separately specified rank budget.
  Since the mixed terms in $T^0 \( x \, x \)$ cancel, $T^1$ is alternating, and $a \( x \)^2 = a \( x \)$, we have

#[#set math.equation(numbering: n => "(4.10)")
 $ T \( x \, x \) = a \( x \) wide \( x in cal(X) \) . $ <eq:T-diagonal>]

The prescribed self-frame Gram matrix is denoted by $E$. It is the sum of the ordered tester matrices for $eta$
  and a matrix $E^(\#)$ characterized on evaluation vectors by

#[#set math.equation(numbering: n => "(4.11)")
 $ v \( s \, z \)^(sans(T)) E^(\#) v \( s' \, z' \) = sum_(rho = 1)^b \( s_rho + s'_rho \) thin z_(\#)^(sans(T))
   M_rho z'_(\#) \, $ <eq:E-sharp>]

where $M_rho$ are $n$-by-$n$ matrices chosen in 35. The expression is a bilinear form on $cal(B)$ because $j_(*)
  gt.eq 1$. It vanishes when the two point inputs coincide. Consequently

#[#set math.equation(numbering: n => "(4.12)")
 $ chevron.l E \, w chevron.r = eta \( w \) wide \( w in W \) . $ <eq:E-moments>]

The $Z$-block does not occur in $E$. In particular, any invertible linear change of the $Z$-variables preserves
  $E$; this symmetry will be used in unary probability estimates.

=== 4.3 Raw vertices <raw-vertices>

For each $e in cal(E)$, take copies $V_e^(+) \, V_e^(-)$ of $bb(F)_2^N$, paired by the usual dot product.
  We regard $V_e^(-)$ as the dual of $V_e^(+)$ through that pairing.
  A raw vertex, also called an #emph[orientation], consists at each component of four maps

$ P_e \, Q_e : cal(B) arrow.r V_e^(+) \, V_e^(-) \, wide X_e \, Y_e : bb(F)_2^h arrow.r V_e^(+) \, V_e^(-) \, $

where the target is the first or second one as appropriate. They satisfy

#[#set math.equation(numbering: n => "(4.13)")
 $ \[ P_e \, X_e \] upright(" and ") \[ Q_e \, Y_e \] upright(" are injective") \, wide P_e^(sans(T)) Q_e = E \,
   quad X_e^(sans(T)) Q_e = 0 \, quad P_e^(sans(T)) Y_e = 0 . $ <eq:raw-frame-law>]

No value is prescribed for $X_e^(sans(T)) Y_e$.

Write $d = dim cal(B)$. For all large $n$, $N gt.eq 2 \( d + h \)$, by the final choice of $M_0$.
  The frame set is then nonempty. For example, take the plus columns to be the first $d + h$ coordinate vectors.
  Prescribe the full $\( d + h \)$-square Gram matrix to be $E & 0\
0 & 0$. Lift its columns to minus vectors using the first $d + h$ coordinates,
  and append distinct coordinate vectors in a complementary space of dimension $d + h$.
  These minus columns are independent and have the desired Gram values.

Take the uniform distribution on this finite frame set, independently over components.
  Let $Omega_n$ be the raw vertex space and $sans(P)_0 = sans(P)_0_n$ this distribution.
  We call $P_e \, Q_e$ the primal maps and $X_e \, Y_e$ the channel maps.
  The sampling law $pi = pi_n$, defined in 5, will preserve the $sans(P)_0$-marginal of all primal maps and
  restrict the conditional channel choices. All identities in this section hold for every raw vertex,
  and therefore under either law. There are at most $2^(2 \| cal(E) \| N \( d + h \))$ raw vertices, so

#[#set math.equation(numbering: n => "(4.14)")
 $ log_2 \| Omega_n \| = O \( N^2 \) . $ <eq:raw-space-size>]

Use the common ambient tensor space

$ cal(V) = xor.big_(e in cal(E)) V_e^(+) ⊗ V_e^(-) . $

For a raw vertex $o$, define

#[#set math.equation(numbering: n => "(4.15)")
 $ U_o x = \( P_(o \, e) x_e Q_(o \, e)^(sans(T)) \)_(e in cal(E)) \, wide u_o \( xi \) =
   sum_(e in cal(E)) chevron.l Y_(o \, e) X_(o \, e)^(sans(T)) \, xi_e chevron.r . $ <eq:raw-embedding>]

On a simple tensor $p q^(sans(T))$ in component $e$, the latter pairing is

$ u_o \( p q^(sans(T)) \) = \( Y_(o \, e)^(sans(T)) p \) dot.op \( X_(o \, e)^(sans(T)) q \) . $

Thus the minus channel is paired with the first tensor factor and the plus channel with the second.
  All copies of coefficient spaces attached to different vertices are distinct,
  although the ambient $V_e^plus.minus$ are common.

Each $U_o$ is injective: a left inverse of $P_(o \, e)$ and the transpose of a left inverse of $Q_(o \, e)$
  recover $x_e$ from $P_(o \, e) x_e Q_(o \, e)^(sans(T))$. The two annihilator conditions in (4.13) also give

#[#set math.equation(numbering: n => "(4.16)")
 $ u_o U_o = 0 . $ <eq:self-contraction-zero>]

#prodef([Definition 4.2.])[
  Two raw vertices $i \, j$ have a #emph[hole] between them if there exist $lambda_i \, lambda_j in cal(X)$ such that
  #[#set math.equation(numbering: n => "(4.17)")
   $ U_i lambda_i = U_j lambda_j \, wide u_j U_i = r \( lambda_i \) \, wide u_i U_j = r \( lambda_j \) \,\
a \( lambda_i \) + a \( lambda_j \) = 1 . $ <eq:hole-equations>]
  The middle two identities are identities of linear functionals on the whole cut-profile space.
] <def:hole>

#thm([Lemma 4.3.])[
  #emph[The hole relation is symmetric, has no loops, and is triangle-free.]
] <lem:hole-triangle-free>

#proof[
  Symmetry follows by interchanging the endpoints. A loop would have $U_i lambda_i = U_i lambda_j$,
    hence $lambda_i = lambda_j$ by injectivity, contradicting the last equation of (4.17).
  Suppose that three distinct raw vertices have holes on all three pairs.
    For a directed incidence $i j$, let $x_(i j)$ be its witness at $i$.
    For distinct $i \, j \, k$, evaluate the gradient identity for $i j$ on $x_(i k)$:
  $ u_j \( U_i x_(i k) \) = a \( x_(i k) \) + T \( x_(i j) \, x_(i k) \) . $
  Sum over the six ordered choices of $\( i \, j \, k \)$. For fixed $j$,
    the two arguments on the left are equal by the sharing equation for the remaining edge $i k$, so they cancel.
    For fixed $i$, the two bilinear terms cancel by symmetry of $T$. The remaining sum is
  $ sum_({ i \, j }) #scale(x: 120%, y: 120%)[\(] a \( x_(i j) \) + a \( x_(j i) \) #scale(x: 120%, y: 120%)[\)] =
    1 + 1 + 1 = 1 \, $
  a contradiction. ◻
]

Sample $m$ raw vertices independently from the law $pi$ defined in 5, and form $G$ on their #emph[positions]:
  two distinct positions are adjacent when their raw types have no hole.
  This gives a finite simple graph even when types repeat. Equal raw types are adjacent because holes have no
  loops. An independent triple of positions would therefore give three distinct raw types forming a hole triangle.
  By 21,

#[#set math.equation(numbering: n => "(4.18)")
 $ alpha \( G \) lt.eq 2 \, wide chi \( G \) gt.eq ceil.l m \/ 2 ceil.r . $ <eq:sample-independence>]

== 5 The distribution problem and its preliminary tools <sec:distributions>

A #emph[unit] is an ordered pair of raw vertices with no hole between its endpoints.
  The endpoints of a unit may be dependent. When two units are sampled independently,
  their four endpoints need not be independent within either unit.
  The event of interest is that all four cross pairs have holes, as in 1.

The raw reference law $sans(P)_0$ is the uniform law of the exact frames in (4.13).
  We will replace its conditional channel law by a thinned law $pi$, while preserving its primal marginal exactly.
  The reference image and peeling arguments below use the absolute joint cap

#[#set math.equation(numbering: n => "(5.1)")
 $ sigma lt.eq 2^(D N) sans(P)_0^2 . $ <eq:raw-law-caps>]

This condition alone imposes no constant bound on either endpoint marginal.
  The stronger marginal hypotheses required for the distribution tests will always be stated separately,
  relative to $pi$.

=== 5.1 Uniform frame laws <uniform-frame-laws>

We record the linear algebra behind all reference image laws.
  For a subspace of a nominal coefficient space, its #emph[image] is its image under the relevant frame map.
  Nominal independence is independence before applying these maps.

#thm([Lemma 5.1.])[
  #emph[Let $A \, A' : U arrow.r V$ and $B \, B' : W arrow.r
    V^(*)$ be injective maps between finite-dimensional spaces over $bb(F)_2$. If
$ B^(sans(T)) A = \( B' \)^(sans(T)) A' \, $

 there is $L in "GL" \( V \)$ with $L A = A'$ and $L^(- sans(T)) B = B'$.
   Thus based individually injective plus and minus frames with a prescribed Gram matrix form one orbit under the
   simultaneous primal and dual action.]
] <lem:paired-frame-orbit>

#proof[
  Write $Phi = B^(sans(T)) : V arrow.r W^(*)$ and $Phi' = \( B' \)^(sans(T)) : V arrow.r W^(*)$.
    Both are surjective. The based map $f : A \( U \) arrow.r A' \( U \)$ given by $f \( A u \) =
    A' u$ satisfies $Phi' f = Phi$. It therefore maps $A \( U \) ∩ ker Phi$ isomorphically onto $A' \( U \) ∩ ker
    Phi'$. Extend this restriction to an isomorphism $L_0 : ker Phi arrow.r ker Phi'$.
  Choose a complement $U_0$ of $A \( U \) ∩ ker Phi$ in $A \( U \)$. Its images under $Phi$ are independent.
    Extend a basis of $Phi \( U_0 \)$ to a basis of $W^(*)$, and choose lifts of the added basis vectors under
    $Phi$ and $Phi'$, respectively. For the basis vectors in $Phi \( U_0 \)$,
    choose the lifts in $U_0$ and their images under $f$. Define $L$ to equal $L_0$ on $ker
    Phi$ and to carry each chosen lift to its primed lift. These are direct-sum decompositions of $V$,
    so $L$ is an isomorphism. It extends $f$ and satisfies $Phi' L = Phi$,
    which is equivalent to the two required frame identities. ◻
]

#thm([Lemma 5.2.])[
  #emph[The following statements hold for all sufficiently large $n$.]
  + #emph[At independently sampled raw vertices and components,
    images of prescribed primal coefficient tuples that are independent separately at each vertex and sign are
    uniform subject to their individual injectivities and their prescribed same-vertex Gram matrices.
    For tuples using channels as well, the same assertion holds conditionally on the full self-channel Gram
    matrices $X_e^(sans(T)) Y_e$; the relevant full Gram matrix is $E & 0\
0 & X_e^(sans(T)) Y_e$.]
  + #emph[Let a fixed tuple of nominal directions use arbitrary combinations of the two endpoints’ primal and
    channel coefficients. Compute its rank separately in each component and sign in the #emph[direct sum over both
    endpoints], and let the total be $t$. For every preassigned $epsilon.alt > 0$,
    choosing $M_0$ sufficiently large gives, under $sans(P)_0^2$,
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(P) { upright("all those images equal prescribed vectors") } lt.eq
   2^(- \( 1 - epsilon.alt \) t N) wide \( t gt.eq 1 \) . $ <eq:reference-image-cap>]

 This is valid for all possible ranks $t$, including $t = O \( n \)$, not only for bounded tuples.]
  + #emph[The plus frame $\[ P \, X \]$ is uniform among injective maps.
    Conditional on it, the minus columns are independent uniforms on the affine spaces prescribed in (4.13),
    followed only by the conditioning that $\[ Q \, Y \]$ is injective.
    The failure probability of this last condition, before conditioning,
    is at most $2^(2 \( d + h \) - N)$ per component.]
    #emph[Given $P \, Q$, the channels $X \, Y$ are independent uniform-column draws on $ker Q^(sans(T))$ and $ker
      P^(sans(T))$, respectively, conditioned on $\[ P \, X \]$ and $\[ Q \, Y \]$ being injective.
      The two rank-failure probabilities are exponentially small in $N$.
      Each channel frame alone is uniform among injective maps $bb(F)_2^h arrow.r bb(F)_2^N$.
      For any fixed $q$ independent vectors in its paired ambient space,
      the probability that transpose evaluation on their span is not injective is at most
#[#set math.equation(numbering: n => "(5.3)")
 $ 2^(q - h + 1) . $ <eq:channel-transpose-failure>]

 The unconditional joint channel law is bounded above by a constant, depending on $g \, h$ but not on $n$,
   times the completely independent uniform-column law.]
  + #emph[For $p$ independent uniform plus vectors and $q$ independent uniform minus vectors in paired copies of
    $bb(F)_2^N$, and a prescribed $p$-by-$q$ Gram matrix $G$,
    the probability of that Gram matrix together with individual injectivity of both frames is at most $2^(- p q)$
    and at least
#[#set math.equation(numbering: n => "(5.4)")
 $ 2^(- p q) \( 1 - 2^(p - N) \) \( 1 - 2^(p + q - N) \) . $ <eq:bounded-gram-normalization>]

 In particular, any consistent Gram specification on a bounded number of vectors,
   together with injectivity on each side, has probability bounded below by a positive constant for large $N$.]
] <lem:frame-images>

#proof[
  The raw law is invariant under $L$ on each $V_e^(+)$ and $L^(- sans(T))$ on $V_e^(-)$,
    independently at vertices and components. For primal tuples, their restricted Gram is fixed by $E$.
    By 22, all based realizations with that Gram and individual injectivity lie in one orbit.
    Projection of an invariant uniform raw law is uniform on this orbit:
    an element carrying one partial realization to another bijects their full-frame completions.
    There is at least one completion because these tuples are restrictions of a raw frame.
    After fixing $X_e^(sans(T)) Y_e$, the same argument applies to arbitrary full-frame coefficient tuples.
    Independence over raw draws and components proves (a).
  For (c), the action is transitive on injective plus frames, so their marginal is uniform.
    Given a plus frame, each column of $Q$ has specified evaluations against $P \, X$,
    while each column of $Y$ has zero evaluations against $P$.
    There is no other constraint until full minus injectivity is imposed.
    The remaining allowed set is therefore the product of those affine column spaces restricted to full rank.
  Each column space contains the common translation space $"ann" \( "im" \[ P \, X \] \)$, of dimension $N - d -
    h$. For a nonzero coefficient vector $c in bb(F)_2^(d + h)$,
    the corresponding linear combination of minus columns is consequently uniform on an affine space containing
    that translation space. Its chance of being zero is at most $2^(- \( N - d - h \))$.
    Union over the fewer than $2^(d + h)$ nonzero coefficient vectors gives the asserted bound $2^(2 \( d + h \) - N)$.
  Alternatively, condition first on $P \, Q$. The allowed $X$-columns lie in $ker Q^(sans(T))$,
    the allowed $Y$-columns in $ker P^(sans(T))$, and their two full-rank restrictions are separate.
    This proves the stated conditional independence. For example, before imposing injectivity of $\[ P \, X \]$,
    any dependence with a nonzero $X$-coefficient has probability at most $2^(- \( N - d \))$;
    union over its at most $2^(d + h)$ coefficient choices gives a bound $2^(2 d + h - N)$.
    The estimate for $Y$ is identical.
  The marginal of $X$ alone is invariant under $"GL" \( bb(F)_2^N \)$ and supported on injective maps;
    transitivity gives its uniformity, and likewise for $Y$. Before conditioning independent channel columns to be
    injective, their evaluations on a fixed independent $q$-tuple form a uniform $h$-by-$q$ matrix.
    For each nonzero coefficient vector in $bb(F)_2^q$, the chance that its evaluation is zero is $2^(- h)$.
    Union over those coefficient vectors gives at most $2^(q - h)$,
    and channel injectivity has probability at least $1 \/ 2$ for large $N$. This proves (5.3).
    To compare their joint marginal with completely independent columns, condition on $G = X^(sans(T)) Y$.
    The conditional marginal is uniform on the orbit of two individually injective $h$-frames having Gram matrix
    $G$. Under independent uniform columns that orbit has probability at least $2^(- h^2 - 2)$ for large $N$,
    by the argument for (d) below. Since the raw probability of any $G$ is at most one,
    the density ratio on every such orbit is at most $2^(h^2 + 2)$.
    Multiply over the fixed number of components to obtain the joint channel bound.
    Its possible dependence on $h$ is harmless: $h$ is fixed before $n$ grows.
  We next prove (b), keeping explicit the dependence on the rank.
    Replace each tested tuple by a basis of its nominal span;
    inconsistent dependent prescriptions have probability zero.
    For the plus directions at the two endpoints, start with completely independent uniform plus columns and then
    impose individual full-frame injectivity. The image of a rank-$t_(+)$ tuple in the joint nominal direct sum is
    exactly uniform on $t_(+)$ independent ambient vectors before this conditioning.
    Indeed, at each ambient coordinate the coefficient map is a surjective linear map onto $bb(F)_2^(t_(+))$,
    and different ambient coordinates use independent input bits.
    Full injectivity has probability $1 - 2^(- Omega \( N \))$, uniformly over the given construction,
    so the plus prescription costs at most $\( 1 - 2^(- Omega \( N \)) \)^(- 1) 2^(- t_(+) N)$.
  Now condition on all plus frames. At a component let $S$ be the span of both endpoints’ plus columns;
    then $dim S lt.eq 2 \( d + h \)$. Before minus injectivity,
    every minus column has an affine distribution whose translation space contains $S^perp$.
    Split off an independent uniform $S^perp$-part of each column and condition on the remaining parts.
    For a rank-$t_(-)$ tuple of minus coefficient combinations,
    the $S^perp$-parts of its images are independent uniform vectors in $S^perp$,
    because the coefficient map has rank $t_(-)$. Thus prescribed minus images have probability at most
  $ 2^(- \( N - 2 \( d + h \) \) t_(-)) . $
  The additional conditioning on the two minus frames being injective changes this by a factor $1 +
    2^(- Omega \( N \))$, by (c). Perform this argument componentwise.
    There is a fixed total conditioning factor bounded, for example, by $4^(\| cal(E) \|)$, and the resulting bound is
  $ 4^(\| cal(E) \|) thin 2^(- t_(+) N - \( N - 2 \( d + h \) \) t_(-)) . $
  Choose $M_0$ so that $2 \( d + h \) \/ N < epsilon.alt \/ 2$ for large $n$,
    and then increase $n$ so that the fixed prefactor is at most $2^(epsilon.alt N \/ 2)$.
    Since $t = t_(+) + t_(-) gt.eq 1$, this proves (5.2) uniformly for every allowable $t$.
    In particular, mixing the two endpoints in a direction causes no loss of an entire $N$-bit image constraint.
  Finally, to prove (d), the plus columns are independent with probability at least $1 - 2^(p - N)$:
    each nonzero coefficient dependence has probability $2^(- N)$.
    Given their independence, each minus column takes its required evaluations with probability $2^(- p)$,
    independently, so the Gram costs $2^(- p q)$. Under this Gram conditioning,
    every nonzero combination of minus columns is uniform on an affine space of dimension at least $N - p$.
    Its probability of vanishing is at most $2^(- \( N - p \))$.
    Union over fewer than $2^q$ combinations gives failure probability at most $2^(p + q - N)$.
    This proves the lower bound. For the upper bound with plus injectivity required,
    condition on the plus columns and use the exact $2^(- p q)$ Gram probability whenever they are independent.
    A partially specified consistent Gram contains some full specification; for bounded $p \, q$,
    the same positive lower bound for that full specification proves the last assertion. ◻
]

=== 5.2 Thinning the channel images <thinning-the-channel-images>

Write $e_(*) = \| cal(E) \|$, $d = dim cal(B)$, and

$ q_h = 2^h - 1 \, wide k_h = 2 e_(*) q_h \, wide epsilon_(upright("ch")) = 10 e_(*) 2^h rho . $

After the channel dimension $h$ has been fixed, choose $rho > 0$ so small that $10^4 e_(*) 2^(2 h) rho < zeta \/
  100$ and that this quantity is smaller than every fixed rate slack used below.
  We then choose $M_0$ large enough also in terms of $1 \/ rho$.
  The channel frame in sign $+$ is $X_e$, and that in sign $-$ is $Y_e$.

#thm([Lemma 5.3.])[
  (Channel thinning).  #emph[Fix any bound $q_(upright("test"))$ on the lengths of the ambient tuples to be
    tested; this bound is fixed before $rho \, M_0 \, n$. For all sufficiently large $n$ there are subsets
    $A_e^plus.minus subset.eq V_e^plus.minus$, each of density $\( 1 + o \( 1 \) \) 2^(- rho N)$,
    with the following properties. Keep the $sans(P)_0$-marginal on all primal frames $\( P_e \, Q_e \)_e$.
    Given those frames, condition the original channel law on
#[#set math.equation(numbering: n => "(5.5)")
 $ X_e c in A_e^(+) \, wide Y_e c in A_e^(-) quad \( e in cal(E) \, 0 eq.not c in bb(F)_2^h \) . $ <eq:channel-allowed>]

 This conditional event has positive probability for every primal frame. The resulting probability law $pi$ satisfies:]
  + #emph[Its primal marginal is exactly that of $sans(P)_0$, and
#[#set math.equation(numbering: n => "(5.6)")
 $ pi^2 lt.eq 2^(epsilon_(upright("ch")) N) sans(P)_0^2 . $ <eq:thinning-density>]

]
  + #emph[For every fixed independent ambient $q$-tuple, $q lt.eq q_(upright("test"))$,
    transpose evaluation by any specified channel frame has failure probability at most $2^(q - h + 1) +
    o \( 1 \)$ under $pi$, uniformly in the tuple. More generally every fixed finite union of these rank-failure
    tests has its $sans(P)_0$-probability plus $o \( 1 \)$ as an upper bound.]
  + #emph[Given any primal frames, any component and sign, and any nonzero $v in V_e^plus.minus$,
#[#set math.equation(numbering: n => "(5.7)")
 $ pi { exists c eq.not 0 : med X_e c in A_e^(+) + v divides \( P \, Q \) #scale(x: 120%, y: 120%)[}] lt.eq
   2^(- rho N \/ 2) \, $ <eq:channel-translate>]

 with the analogous statement for $Y_e \, A_e^(-)$.]
  #emph[The error in (b) is exponentially small in $N$. The ambient tuple there is fixed before sampling the
    vertex; no uniform conditional rank bound for a tuple selected from the sampled primal frame is asserted.]
] <lem:channel-thinning>

#proof[
  Include every ambient vector in each $A_e^plus.minus$ independently with probability $p = 2^(- rho N)$;
    subsets for different components and signs are independent.
    Fix a complete primal frame $f$, and let $nu_f$ be the original conditional channel law.
    Define its survival fraction $Z_f = nu_f \( upright("Equation 5.5") \)$,
    a random variable in the random subsets. Channel injectivity makes the $q_h$ nonzero values in each component
    and sign distinct. Consequently
  $ bb(E)_A Z_f = p^(k_h) . $
  For any transpose-rank test $T$, or any union of at most $N$ such tests, the numerator $Z_(f \, T) =
    nu_f \( T ∩ upright("Equation 5.5") \)$ similarly has expectation $p^(k_h) nu_f \( T \)$.
  We establish simultaneous concentration of these fractions by the bounded-differences method
    #cite(label("azuma1967")) #cite(label("mcdiarmid1989")), with the needed exponential-moment estimate included
    below. By 23(c), a prescribed nonzero channel combination, conditional on $f$,
    has probability at most $2^(- \( N - d \) + 1)$ of taking any prescribed value for all sufficiently large $N$.
    Indeed before full-frame injectivity it is uniform on the appropriate annihilator,
    and injectivity has probability $1 - 2^(- Omega \( N \))$, uniformly in $f$.
    Changing one membership bit of a subset can therefore change any such fraction by at most
  $ c_N = C_h 2^(- N + d) \, $
  where $C_h$ is fixed in $n$. There are $2 e_(*) 2^N$ membership bits,
    so the sum of their squared influence bounds is at most
  $ S_N = C_(g \, h) 2^(- N + 2 d) . $
  For clarity, expose these independent bits and use the Doob martingale of any one fraction.
    A centered increment whose conditional range has length at most $c$ has exponential moment at most
    $exp \( t^2 c^2 \/ 8 \)$. To see this, the second derivative of its log moment generating function is the
    variance under an exponential tilt, at most $c^2 \/ 4$; integrate twice using value and derivative zero at the
    origin. Multiplication of the conditional bounds and Markov’s inequality give
  $ Pr_A \( \| Z - bb(E)_A Z \| > u \) lt.eq 2 exp \( - 2 u^2 \/ S_N \) . $
  Take $u = epsilon.alt_N = 2^(- N \/ 10)$. Since $d \/ N$ can be made arbitrarily small by increasing $M_0$,
    these tails are at most $2 exp \( - c_(g \, h) 2^(N \/ 2) \)$.
    There are $2^(O \( N^2 \))$ primal frames and $2^(O \( N \))$ primitive transpose tests,
    since their tuple lengths are bounded by the fixed $q_(upright("test"))$.
    The unions of at most $N$ primitive tests therefore number at most $2^(O \( N^2 \))$ as well.
    A union bound gives simultaneous error at most $epsilon.alt_N$ for all these denominators and test numerators.
    The same argument for $2^(- N) \| A_e^plus.minus \|$, whose bit influences are $2^(- N)$,
    gives $\| A_e^plus.minus \| \/ 2^N = \( 1 + o \( 1 \) \) p$.
  We include the translated numerators in this simultaneous estimate.
    Fix $f \, e \, plus.minus \, v eq.not 0$, and let $Z_(f \, v)^(plus.minus \, e)$ be the original conditional
    probability of survival and of the event in (5.7). Consider, for example, sign $+$.
    If $X_e c + v$ coincides with another already required nonzero channel value $X_e c'$, then $v =
    X_e \( c + c' \)$ is a nonzero channel value. The original probability of this possibility is at most $C_h
    2^(- N + d)$, by the point bound and a union over the nonzero coefficients.
    On that exceptional event we bound the extra test by one;
    the survival probability over the random subsets is still $p^(k_h)$.
    In every other case $X_e c + v$ is a new membership bit and supplies an additional factor $p$.
    This includes the case $X_e c + v = 0$, since zero is not among the required nonzero channel values.
    Union over $c$ yields
  $ bb(E)_A Z_(f \, v)^(+ \, e) lt.eq p^(k_h) #scale(x: 120%, y: 120%)[\(] C_h 2^(- N + d) +
    q_h p #scale(x: 120%, y: 120%)[\)] . $
  A changed membership bit can affect this numerator only by being an original channel value or a translated
    channel value. Both have point probability at most $C_h 2^(- N + d)$;
    hence the same influence and concentration estimates apply.
    The additional $2^N$ choices of translate do not affect the union bound.
    We may therefore fix one realization of all subsets for which every displayed concentration statement holds
    simultaneously.
  Our choice of $rho$ gives $k_h rho < 1 \/ 100$. Thus
  $ Z_f = p^(k_h) \( 1 + O \( epsilon.alt_N \/ p^(k_h) \) \) > 0 $
  uniformly, and the relative error tends to zero exponentially.
    The pointwise density of $pi$ with respect to $sans(P)_0$ is the survival indicator divided by $Z_f$. Consequently
  $ frac(d pi^2, d sans(P)_0^2) lt.eq 4 p^(- 2 k_h) lt.eq 2^(epsilon_(upright("ch")) N) $
  for large $N$; the primal law was left unchanged by definition.
    Division of $Z_(f \, T)$ by $Z_f$ gives $pi \( T divides f \) = nu_f \( T \) +
    O \( epsilon.alt_N \/ p^(k_h) \)$, uniformly in every specified fixed test.
    Average over the original primal marginal and apply (5.3) to prove (b).
    Every fixed finite union is among our tested unions once $N$ is large enough;
    applying the same numerator estimate directly to that union gives its raw probability plus the stated error,
    without replacing the union probability by the sum of its constituent probabilities.
    Finally, dividing the translated numerator by $Z_f$ bounds it by
  $ C_h 2^(- N + d) + q_h 2^(- rho N) + O \( epsilon.alt_N \/ p^(k_h) \) lt.eq 2^(- rho N \/ 2) $
  for all sufficiently large $N$. This proves (c) and the lemma. ◻
]

=== 5.3 The two distribution tests <the-two-distribution-tests>

For independent units $A = \( A_1 \, A_2 \)$, $B = \( B_1 \, B_2 \)$,
  write $A ⋈ B$ when all four pairs $\( A_i \, B_j \)$ are holes.
  For a point $z$, write $A ⋈ z$ when both $\( A_i \, z \)$ are holes.
  These definitions also cover repeated raw types; the absence of hole loops automatically forbids a conflict with
  a shared endpoint.

#thm([Theorem 5.4.])[
  (Distribution tests).  #emph[There is a constant $eta_(upright("col")) > 0$,
    depending only on the early parameters and $M$, with the following property.
    Fix any $L < oo$ after $eta_(upright("col"))$ and before the selector and channel parameters;
    choose all remaining parameters in the order of (4.4), Section 17.
    For every sufficiently large $n$, the law $pi$ constructed above satisfies both conclusions.]
  + #emph[Let $\( A \, c \)$ have a probability law on units marked by a colour in any fixed finite palette.
    The colour may be randomized conditional on $A$. Write $sigma_1 \,
    sigma_2$ for the endpoint marginals of its projected unit law $sigma$, and suppose
#[#set math.equation(numbering: n => "(5.8)")
 $ sigma_1 lt.eq M pi \, wide sigma_2 lt.eq M pi \, wide sigma lt.eq 2^(3000 g N) pi^2 \, wide
   Pr \( c = j \) lt.eq eta_(upright("col")) quad upright("for every ") j . $ <eq:coloured-law-caps>]

 For two independent draws $\( A \, c \) \, \( B \, c' \)$,
$ Pr \( A ⋈ B \, c eq.not c' \) gt.eq 2^(- 100 g N) . $

]
  + #emph[Let $A$ have a unit law $sigma$ and let $z$ be an independent point with law $theta$, where
#[#set math.equation(numbering: n => "(5.9)")
 $ sigma_1 lt.eq L pi \, wide sigma_2 lt.eq L pi \, wide sigma lt.eq 2^(3000 g N) pi^2 \, wide theta lt.eq
   L pi . $ <eq:asymmetric-law-caps>]

 Then $Pr \( A ⋈ z \) gt.eq 2^(- 100 g N)$.]
  #emph[The threshold for $n$ may depend on the fixed palette and on $L$.
    All inequalities between measures are pointwise on their finite spaces.]
] <thm:distribution-tests>

The two conclusions are proved after the collision and overlap arguments, in Proposition 14.8, Section 15,
  respectively. The finite graph transfer is given in 16. Here we establish their leaf and image hypotheses.
  In particular, (5.6) places every projected test law below $2^(\( 3000 g + epsilon_(upright("ch")) \) N)
  sans(P)_0^2$, leaving strict slack below the absolute budget $D = 4000 g$.

=== 5.4 Sparse profiles arising from true intersections <sparse-profiles-arising-from-true-intersections>

For a matrix profile, its #emph[total component rank] means $sum_(e in cal(E)) "rank" x_e$.

#thm([Lemma 5.5.])[
  #emph[Let $sigma$ satisfy the joint cap in (5.1). Outside a set of $sigma$-probability $2^(- Omega \( N \))$,
$ sum_(e in cal(E)) dim #scale(x: 120%, y: 120%)[\(] "im" P_(1 \, e) ∩ "im" P_(2 \, e)
  #scale(x: 120%, y: 120%)[\)] lt.eq 2 D . $

 For any unit outside that exceptional set and any $U_1 lambda_1 = U_2 lambda_2$,
   both $lambda_i$ have total component rank at most $2 D$. Each has a unique representation $\( w_(i \, l) \)_l$
   vanishing at a strict majority of tags, and
$ \| { l : w_(i \, l) eq.not 0 } \| lt.eq 4 D \/ g \, wide chi_(*) \( w_1 \) = chi_(*) \( w_2 \) . $

]
] <lem:raw-intersections>

#proof[
  If the summed intersection dimension exceeds $2 D$, choose $2 D$ independent common-image vectors,
    componentwise. Write each as $P_(1 \, e) a = P_(2 \, e) b$.
    Their nominal relation directions $\( a \, b \)$ are independent in the direct sum of the two primal
    coefficient spaces at that component. Indeed a dependence between the pairs would,
    after applying $P_(1 \, e)$, be the corresponding dependence between the selected common-image vectors.
    Across components their ranks add.
  There are at most $2^(O \( n \))$ ways to choose this bounded number of coefficient pairs and their component
    indices. For each choice, (5.2) bounds the probability of their zero images by
    $2^(- \( 1 - epsilon.alt \) 2 D N)$ under $sans(P)_0^2$. After paying $2^(D N)$ for $sigma$,
    and making the coefficient count a sufficiently small fraction of $N$ by the choice of $M_0$,
    the union bound is $2^(- Omega \( N \))$.
  Suppose $U_1 lambda_1 = U_2 lambda_2 = xi$. The column space of $xi_e$ lies in both primal plus spans.
    Since multiplication by the two injective frame maps preserves matrix rank,
  $ "rank" \( lambda_(i \, e) \) = "rank" \( xi_e \) lt.eq dim \( "im" P_(1 \, e) ∩ "im" P_(2 \, e) \) . $
  This proves the total-rank assertion.
  Take any representation $\( w_l \)_l$ of one of the profiles.
    A component $w_l + w_(l')$ is nonzero whenever $w_l eq.not w_(l')$,
    so there are at most $2 D$ unequal unordered pairs. If no value occurred at a strict majority of tags,
    write $c_v$ for its multiplicities. Then
  $ \# { upright("unequal pairs") } = 1 / 2 (g^2 - sum_v c_v^2) gt.eq 1 / 2 (g^2 - g / 2 sum_v c_v) = g^2 / 4 > 2 D \, $
  a contradiction. Let the majority have size $g - z$. There are at least $z \( g - z \) gt.eq
    z g \/ 2$ unequal pairs, hence $z lt.eq 4 D \/ g$. Its common value belongs to $W_(*)$ by 19,
    so subtract it from every coordinate. The resulting representation vanishes at a strict majority.
    It is unique: two such representations differ by a constant, and their two majority zero sets intersect.
  Finally, equality of the component tensors gives equality of their ambient traces. By cyclicity of trace and (4.12),
  $ "Tr" \( P_(i \, e) lambda_(i \, e) Q_(i \, e)^(sans(T)) \) = chevron.l P_(i \, e)^(sans(T)) Q_(i \, e) \,
    lambda_(i \, e) chevron.r = eta \( lambda_(i \, e) \) . $
  For $e = { l \, l' }$, it follows that
  $ eta \( w_(1 \, l) \) + eta \( w_(2 \, l) \) = eta \( w_(1 \, l') \) + eta \( w_(2 \, l') \) . $
  This value is independent of the tag. The two sparse representations together have at most $8 D \/ g =
    32000 < g$ nonzero coordinates, so some tag has both entries zero. The common value is therefore zero.
    Summing over tags proves equality of the two specified $chi_(*)$-values. ◻
]

=== 5.5 Peeling into leaves with exact pins <peeling-into-leaves-with-exact-pins>

For a unit $O = \( 1 \, 2 \)$, introduce nominal coefficient spaces at each component

$ cal(L)_(O \, e) = xor.big_(i in O) \( cal(B)_i xor H_i^(+) \) \, wide cal(R)_(O \, e) =
  xor.big_(i in O) \( cal(B)_i xor H_i^(-) \) \, wide H_i^plus.minus = bb(F)_2^h . $

Their frame-image maps add the endpoint images in the common ambient $V_e^plus.minus$.
  A #emph[pin space] is a specified subspace $D_(O \, e)^plus.minus$ of this nominal direct sum together with
  specified exact images of every vector in a chosen basis.
  It may mix both endpoints, and it may mix primal and channel coordinates.
  Once the basis images are known, every image on the pin space is fixed.

For a tested tuple of directions, its #emph[rank modulo the pins] is the sum, over components and signs,
  of the dimensions of the spans of its images in the quotients by $D_(O \, e)^plus.minus$.
  The rank is nominal; it is not computed after applying the raw frames.

#thm([Lemma 5.6.])[
  (First peeling and restriction).  #emph[Take the constants in (4.2), (4.3),
    and choose the reference accuracy in (5.2) with $epsilon.alt < zeta \/ 4$.
    For every law $sigma$ satisfying the absolute joint cap (5.1), the following decompositions are available.]
  + #emph[After discarding the exception in 26 and at most $2^(- zeta N)$ further mass,
    the law is partitioned into #emph[leaves]. Each leaf has fixed pin spaces with total dimension at most $K_1$,
    and its normalized law $sigma_lambda$ satisfies
#[#set math.equation(numbering: n => "(5.10)")
 $ sigma_lambda { upright("a specified exact-image constraint of rank ") t upright(" modulo the pins") } lt.eq
   2^(- \( 1 - zeta \) t N) wide \( t gt.eq 1 \) . $ <eq:leaf-minentropy>]

 The normalized leaf laws satisfy a common bound $2^(O \( N \)) sans(P)_0^2$,
   with the implied constant determined by the early parameters.]
  + #emph[Suppose a restriction of the mixed law has relative mass $2^(- o \( N \))$.
    One may discard an exponentially small fraction of that restricted law so that every remaining normalized leaf
    restriction satisfies
#[#set math.equation(numbering: n => "(5.11)")
 $ sigma_lambda { upright("a specified exact-image constraint of rank ") t upright(" modulo the pins") } lt.eq
   2^(- \( 1 - 2 zeta \) t N) wide \( t gt.eq 1 \) \, $ <eq:final-leaf-minentropy>]

 and still has density $2^(O \( N \))$ relative to $sans(P)_0^2$.
   For several successive restrictions, the same statement applies to their combined relative cost.]
  #emph[In all parts the mixed law uses each leaf’s actual mass, normalized only after the indicated discards.
    No equal reweighting of leaves is used.]
] <lem:peeling>

#proof[
  We give the finite procedure and its quantitative bounds.
    Work first with the original, unnormalized restriction of $sigma$ obtained by removing the intersection
    exception. In particular its density is still at most $2^(D N)$ relative to $sans(P)_0^2$.
    Let $R$ be its residual support. As long as its residual mass exceeds $2^(- zeta N)$,
    begin with its normalized restriction and no pins. If (5.10) fails,
    condition on a violating image constraint and add its nominal directions to the pins.
    Given the existing pins, a consistent tuple constraint can be reduced to a basis of its span modulo the pins.
    The other prescriptions are either automatic or inconsistent;
    an inconsistent event cannot violate a positive probability bound. Thus every step adds positive rank.
  If the cumulative added rank is $u$, the unnormalized mass of the current part is greater than
  $ 2^(- zeta N - \( 1 - zeta \) u N) . $
  The cumulative directions are independent after taking a basis,
    so the absolute density cap and (5.2) give the upper bound
  $ 2^(D N - \( 1 - epsilon.alt \) u N) . $
  Comparing the bounds yields
  #[#set math.equation(numbering: n => "(5.12)")
   $ \( zeta - epsilon.alt \) u < D + zeta . $ <eq:peeling-rank-comparison>]
  This is strictly below the rank budget $K_1$. The same comparison applies to a whole violating tuple at once,
    so a large tuple cannot jump beyond that budget. The rank therefore cannot increase indefinitely.
    The process reaches a part with no violating constraint; remove that entire part as a leaf and restart on the
    residual. The underlying raw unit space is finite, and every leaf is nonempty,
    so the procedure terminates with residual mass at most $2^(- zeta N)$.
  A leaf of rank $u lt.eq K_1$ has mass greater than $2^(- zeta N - \( 1 - zeta \) u N)$.
    Dividing the original density cap by this lower bound shows, for example,
  $ sigma_lambda lt.eq 2^(\( D + K_1 + 1 \) N) sans(P)_0^2 . $
  This proves (a), including uniformity of its density constant.
  For (b), write the current normalized mixture as $sum_lambda w_lambda sigma_lambda$.
    Let $q_lambda$ be the relative mass retained by the combined restriction in leaf $lambda$, and let $q =
    sum_lambda w_lambda q_lambda = 2^(- o \( N \))$. Discard leaves for which $q_lambda < 2^(- zeta N)$.
    Their mass in the restricted law is at most
  $ q^(- 1) sum_(lambda : q_lambda < 2^(- zeta N)) w_lambda q_lambda lt.eq 2^(- zeta N + o \( N \)) . $
  On every other leaf, division by $q_lambda$ multiplies probabilities by at most $2^(zeta N)$. For $t gt.eq 1$,
  $ 2^(zeta N) 2^(- \( 1 - zeta \) t N) lt.eq 2^(- \( 1 - 2 zeta \) t N) . $
  This proves the claimed min-entropy and density bounds. It also explains why the small mass bound is needed for
    the mixed law, rather than separately asserted for every old leaf.
  Throughout these operations, disintegration over the finite parts is exact.
    Multiplying each normalized part by its actual mass recovers the retained law.
    This proves the last assertion as well. ◻
]

The per-leaf density bounds in 27 are joint bounds relative to $sans(P)_0^2$.
  They do not assert that each leaf has the original one-vertex marginal cap.
  If the initial mixed law has endpoint caps $C pi$, restricting it by mass $q$ gives endpoint caps $\( C \/ q \)
  pi$. Its primal marginal caps are therefore $\( C \/ q \) "pr"_(*) sans(P)_0$,
  where $"pr"$ forgets all channel columns. For $q = 2^(- o \( N \))$ these are $C
  2^(o \( N \))$ times the original #emph[primal] law. The corresponding full-frame bound is $C 2^(o \( N \)) pi$,
  not $C 2^(o \( N \)) sans(P)_0$. The absolute joint bound is $2^(\( D + o \( 1 \) \) N) sans(P)_0^2$.
  17.5 records where these distinct controls are used.

#thm([Corollary 5.7.])[
  (Colours and actual leaf weights).  #emph[For a law satisfying (5.8),
    discard colours whose mass is below $2^(- zeta N)$, and apply 27(a) to each remaining conditional colour law.
    The total discarded mass tends to zero exponentially, the leaves have at most $K_1$ pins and satisfy (5.10),
    and each leaf has an absolute density bound $2^(\( D + K_1 + 1 \) N) sans(P)_0^2$.
    With their actual retained masses these leaves form a mixed law whose endpoint marginals are bounded by
    $\( 1 + o \( 1 \) \) M pi$. Any subsequent combined restriction of mass $2^(- o \( N \))$ has the first-pin
    freshness in (5.11), after the trimming in 27(b).]
] <cor:coloured-peeling>

#proof[
  The palette size is fixed, so deleting light colours costs at most a fixed multiple of $2^(- zeta N)$.
    Every retained conditional colour law has absolute density at most
    $2^(\( 3000 g + epsilon_(upright("ch")) + zeta \) N) sans(P)_0^2$, which is below $2^(D N) sans(P)_0^2$.
    The intersection exception and the residual mass in 27(a) are exponentially small uniformly over these laws.
    Multiply each normalized leaf by its actual colour mass and its mass within that colour.
    Summing recovers exactly the retained restriction of the original law,
    so its endpoint marginals are bounded by the original ones divided by the total retained mass.
    This proves the asserted pooled bounds. The final assertion is precisely 27(b), applied to this mixture.
    In particular no inverse colour mass enters the pooled marginal constant. ◻
]

#thm([Corollary 5.8.])[
  (An independent pair as an unpinned leaf).  #emph[Let $theta lt.eq L pi$,
    and draw two independent $theta$-points. The probability that they form an internal hole is
    $2^(- Omega \( N \))$. Their law conditioned on being a unit is a single leaf with no pins,
    with endpoint marginals at most $\( 1 + o \( 1 \) \) L pi$, and it satisfies (5.10) for every rank $t gt.eq
    1$. Its effective spaces $C_1 \, C_2$, defined in 6, are consequently zero.]
] <cor:independent-point-leaf>

#proof[
  Under the raw primal law, each $P_e$ is uniform injective.
    Two independent such images have nonzero intersection with probability at most
    $\( 2^d - 1 \)^2 \/ \( 2^N - 1 \)$, by a union bound over nonzero coefficient pairs.
    The primal marginals under $theta$ have density at most $L$ relative to those laws.
    Union over components therefore bounds the probability of any plus-span intersection by
    $O_g \( L^(22^(2 d - N)) \) = 2^(- Omega \( N \))$. If the plus spans are disjoint in every component,
    a tensor common to the two endpoint primal tensor spaces has every component zero:
    each of its column spaces lies in the corresponding plus-span intersection.
    Injectivity of the primal frame maps then makes the sharing witnesses zero,
    contrary to the parity sum one in (4.17). A hole is thus included in the exceptional event just bounded.
  Before deleting internal holes the pair law is at most $L^2 pi^2$.
    For a rank-$t$ exact-image event, (5.2) and (5.6) bound its probability by
  $ L^2 2^(epsilon_(upright("ch")) N - \( 1 - epsilon.alt \) t N) . $
  Take $epsilon.alt < zeta \/ 4$. Since $epsilon_(upright("ch")) < zeta \/ 4$ and $t gt.eq 1$,
    division by the nonhole probability $1 - 2^(- Omega \( N \))$ leaves this at most $2^(- \( 1 - zeta \) t N)$
    for large $N$, uniformly for all ranks. The same normalization gives the endpoint caps.
    Empty pin spaces have zero primal projections, which gives the assertion about $C_i$. ◻
]

=== 5.6 Bilinear sign estimates <bilinear-sign-estimates>

#thm([Lemma 5.9.])[
  (Walsh estimates).  #emph[Let all weights below have absolute value at most one.]
  + #emph[If $x \, y$ are independent uniform vectors and $B \( x \, y \)$ is a bilinear form of rank $d$, then
$ lr(|bb(E) f \( x \) g \( y \) \( - 1 \)^(B \( x \, y \))|) lt.eq 2^(- d \/ 2) . $

 Replacing either uniform law by a law of density at most $C_i$ multiplies this bound by at most $C_1 C_2$.]
  + #emph[If $alpha \, beta$ are subprobability measures on $bb(F)_2^d$, with point masses at most $p_1 \, p_2$,
    respectively, then
$ lr(|sum_(x \, y) alpha \( x \) beta \( y \) f \( x \) g \( y \) \( - 1 \)^(x dot.op y)|) lt.eq
  2^(d \/ 2) \( p_1 p_2 \)^(1 \/ 2) . $

]
  + #emph[For independent uniform global $N$-bit vector slots in two groups,
    a cross-pairing character with coefficient matrix $C$ has bit rank $N "rank" C$.
    In particular, if its cross coefficient pattern is nonzero, its correlation against two bounded weights,
    one on each group, is at most $2^(- N \/ 2)$. Arbitrary phases depending separately on the groups may be
    included in these weights.]
] <lem:walsh>

#proof[
  Let $H$ be the $2^d$-square matrix with entries $H_(x y) = \( - 1 \)^(x dot.op y)$. For $x \, x' in bb(F)_2^d$,
  $ \( H H^(sans(T)) \)_(x x') = sum_y \( - 1 \)^(\( x + x' \) dot.op y) =
    cases(delim: "{", 2^d \, & x = x' \,, 0 \, & x eq.not x' .) $
  The second value is zero by pairing $y$ with $y + e_j$ at any coordinate where $x + x'$ is nonzero.
    Thus the Euclidean operator norm of $H$ is $2^(d \/ 2)$.
  For (b), set $a_x = alpha \( x \) f \( x \)$ and $b_y = beta \( y \) g \( y \)$. Then
  $ \| a^(sans(T)) H b \| lt.eq 2^(d \/ 2) parallel a parallel_2 parallel b parallel_2 \, wide
    parallel a parallel_2^2 lt.eq p_1 sum_x alpha \( x \) lt.eq p_1 \, $
  and similarly for $b$, proving the result.
  For (a), invertible changes of coordinates reduce the form to the dot product on its $d$ active coordinates.
    Average each bounded weight over its inactive coordinates.
    Apply (b) to the uniform probabilities $p_1 = p_2 = 2^(- d)$.
    A bounded-density change can be absorbed into the weights after dividing their bounds by $C_1 \, C_2$.
  Finally, the matrix of the full bit form in (c) is $C ⊗ I_N$.
    Choose bases reducing $C$ to $"diag" \( I_("rank" C) \, 0 \)$; the tensor matrix then has rank $N "rank" C$.
    Apply (a), absorbing any within-group phases into the corresponding bounded weight. ◻
]

== 6 Low-rank moments and mixing forms <sec:moments>

This section supplies the finite algebra used in the queries.
  Low-rank moment representations bound the number of selector labels,
  protected labels keep attack atoms independent of the pins,
  and fixed mixing forms provide the rank estimates used in later parameter and status tests.

The pin budget $K$ is fixed before the parameters chosen in this Section.
  The arguments in this section concern the coefficient spaces and exact frame constraints;
  they apply to the thinned law $pi$ as well as to $sans(P)_0$. Set

#[#set math.equation(numbering: n => "(6.1)")
 $ R_(*) = 2 \( K + 20 \) \, wide j_(*) gt.eq 10 \( K + 1 \) \( R_(*) + 20 \) . $ <eq:moment-parameters>]

All inequalities concerning ranks in this section are over $bb(F)_2$. The selector size $b$ will be chosen below.
  Put $p_(*) = sum_(j = 0)^(j_(*)) binom(b, j)$ and write $d_(upright(b)) = \( g^2 + 3 \)
  n$ for the number of ordinary base coordinates. Thus $cal(B) =
  bb(F)_2^(p_(*)) ⊗ bb(F)_2^(1 + d_(upright(b)))$ and $v \( s \, z \) = p_s ⊗ \( 1 \, z \)$, as in 4.
  The constant base coordinate has index $0$.

The quotient by the radical and the commuting coordinate operators used below belong to the flat-extension
  approach to moment matrices; see #cite(label("laurentmourrain2009"), form: "prose").
  We prove the required Boolean version with separate selector and base-degree bounds.

=== 6.1 Boolean moment matrices <boolean-moment-matrices>

#thm([Lemma 6.1.])[
  #emph[The span of $\( 1 \, z \) \( 1 \, z \)^(sans(T))$, $z in bb(F)_2^(d_(upright(b)))$,
    consists precisely of symmetric $\( 1 + d_(upright(b)) \)$-by-$\( 1 + d_(upright(b)) \)$ matrices $Z$
    satisfying $Z_(i i) = Z_(0 i)$ for every $i$. For any $u$ distinct selectors,
    their evaluation vectors $p_s$ are linearly independent if $j_(*) gt.eq u - 1$.]
] <lem:base-moments>

#proof[
  Every point matrix has the stated identities. Conversely the space specified by these identities has a basis
    consisting of the matrix supported at $\( 0 \, 0 \)$, the matrices supported at
    $\( 0 \, i \) \, \( i \, 0 \) \, \( i \, i \)$, and the matrices supported at $\( i \, j \) \, \( j \, i \)$
    for $0 < i < j$. The first is the point matrix at zero. The second is the sum of the point matrices at zero
    and at the $i$th unit vector. The third is the sum of the point matrices at zero,
    at the $i$th and $j$th unit vectors, and at their sum. This proves the first assertion.
  To isolate a selector $s$ among $u$ distinct selectors, for each other selector choose a coordinate on which it
    differs from $s$, and take the product of the corresponding affine bit functions that equal one at $s$ and
    zero at the chosen other selector. This polynomial has degree at most $u -
    1$ and evaluates to the indicator of $s$ on the specified set.
    Applying these interpolating linear functionals to a relation among the evaluation vectors proves independence. ◻
]

#thm([Lemma 6.2.])[
  (Label support).  #emph[Every $w in W$ of rank at most $R_(*)$ has a representation
#[#set math.equation(numbering: n => "(6.2)")
 $ w = sum_(s in L) \( p_s ⊗ I \) Z_s \( p_s ⊗ I \)^(sans(T)) \, wide \| L \| lt.eq R_(*) \, $ <eq:label-decomposition>]

 where each $Z_s$ is symmetric, $\( Z_s \)_(i i) = \( Z_s \)_(0 i)$, and $sum_(s in L) "rank" Z_s lt.eq R_(*)$.]
] <lem:label-support>

#proof[
  Choose a linear combination of point matrices representing $w$.
    It defines a linear functional $Lambda$ on the Boolean functions of selector degree at most $2
    j_(*)$ and base degree at most two. The matrix $w$ is the matrix of the pairing $B \( f \, g \) =
    Lambda \( f g \)$ on functions of base degree at most one and selector degree at most $j_(*)$.
    Products and degrees here are in the Boolean algebra, so each variable satisfies $x^2 = x$.
  Let $V_j$ denote the subspace with selector degree at most $j$,
    and let $r_j$ be the rank of $B \|_(V_j times V_j)$. The sequence $r_j$ is nondecreasing and bounded by
    $R_(*)$. Because $j_(*) gt.eq 6 R_(*) + 4$, there is $j gt.eq 4 R_(*) + 2$ such that
  #[#set math.equation(numbering: n => "(6.3)")
   $ r_j = r_(j + 1) = r_(j + 2) . $ <eq:flat-levels>]
  Indeed, if no such three successive values occurred between levels $4 R_(*) + 2$ and $j_(*)$,
    every two successive increments in that interval would contain a strict increase,
    giving more than $R_(*)$ increases.
  Let $Q$ be the quotient of $V_(j + 2)$ by the radical of its restricted pairing.
    The induced pairing on $Q$ is nondegenerate. Equality of the first and last ranks in (6.3) means that the
    image of $V_j$ is all of $Q$: its dimension is at least $r_j = dim Q$.
    Since the quotient pairing is nondegenerate, a vector of $V_j$ pairing to zero with $V_j$ consequently pairs
    to zero with $V_(j + 2)$. For a selector coordinate $s_a$,
    define $M_a \[ f \] = \[ s_a f \]$ using $f in V_j$. This is well defined:
    if $\[ f \] = 0$, then for every $g in V_j$,
  $ B \( s_a f \, g \) = B \( f \, s_a g \) = 0 \, $
  and $V_j$ spans $Q$. The same identity proves that $M_a$ is self-adjoint.
    Replacing $s_b f$ by a representative in $V_j$ and transferring $s_a$ to the other argument gives
  $ B \( M_a M_b \[ f \] \, \[ g \] \) = Lambda \( s_a s_b f g \) . $
  All representatives needed in this comparison lie in $V_(j + 2)$.
    Thus $M_a M_b = M_b M_a$ and, since $s_a^2 = s_a$, $M_a^2 = M_a$.
  Commuting idempotents over $bb(F)_2$ have a simultaneous eigenspace splitting
  $ Q = xor.big_(s in L) Q_s \, wide M_a \|_(Q_s) = s_a I . $
  For completeness, a single idempotent splits its space into kernel and image;
    all the other commuting maps preserve both summands, so iteration proves the assertion.
    Distinct joint eigenspaces are orthogonal, by self-adjointness of a coordinate on which their labels differ.
    Each nonzero summand has positive dimension, so $\| L \| lt.eq dim Q lt.eq R_(*)$.
    Define $Z_s$ by pairing the projections onto $Q_s$ of the affine base coordinates.
    Then $Z_s$ is symmetric and $"rank" Z_s lt.eq dim Q_s$.
  Repeated application of the $M_a$ gives the class of a base coordinate times any selector monomial of degree at
    most $j$. It follows that (6.2) reproduces all moments of selector degree at most $2 j$.
    To verify the diagonal identity separately on a label, use an interpolating selector polynomial $e_s$ of
    degree at most $\| L \| - 1$. Its operator on $Q$ is the projection onto $Q_s$. The Boolean identities give
  $ B \( z_i e_s \, z_i e_s \) = Lambda \( z_i e_s^2 \) = B \( e_s \, z_i e_s \) \, $
  which is $\( Z_s \)_(i i) = \( Z_s \)_(0 i)$. The interpolation degrees are within $j$.
  Extend the right side of (6.2) to the full row and column indexing.
    Its rank is at most $sum_s dim Q_s lt.eq R_(*)$. By 31 it belongs to $W$.
    If its difference from $w$ were nonzero, choose a nonzero difference moment of minimal selector degree $d' > 2
    j$. Write its selector monomial as the product on a set $U$ of size $d'$,
    and keep the two affine base coordinates in that moment fixed.
    Index rows by the subsets $A subset U$ of size $floor.l d' \/ 2
    floor.r$ and columns by the complementary monomials $U \\ A'$ with the same indexing.
    The union $A union \( U \\ A' \)$ is $U$ exactly when $A = A'$; otherwise its degree is smaller than $d'$.
    The difference on this square submatrix is therefore the identity.
    Both its row and column degrees are at most $j_(*)$, whereas its rank is $binom(d', floor.l d' \/ 2 floor.r) >
    2 R_(*)$. This contradicts the rank bound $2 R_(*)$ for the difference and completes the proof. ◻
]

=== 6.2 Labels protected from the pins <labels-protected-from-the-pins>

For an endpoint $i$ of a leaf, let $S_(i \, e)^plus.minus subset
  cal(B)$ be the projection of $D_(O \, e)^plus.minus$ onto its individual primal coordinate block.
  These are projections, not intersections; a stored pin may mix endpoints and channel coordinates.

#thm([Lemma 6.3.])[
  #emph[Put $L_0^(upright("lab")) = R_(*) + 14$. At an endpoint,
    the union of the nonzero label supports of all vectors in all $S_(i \, e)^plus.minus$ that can be written as
    $sum_(s in L) p_s ⊗ z_s$ with $\| L \| lt.eq L_0^(upright("lab"))$ has size at most
#[#set math.equation(numbering: n => "(6.4)")
 $ B_0 = 2 \| cal(E) \| K \( R_(*) + 14 \) . $ <eq:label-budget>]

]
] <lem:sparse-pin-labels>

#proof[
  For one projected space, choose a basis from its members admitting such sparse representations,
    for the span of all these members. There are at most $K$ chosen members.
    Comparing any further sparse member with its expression in this basis uses at most
    $\( K + 1 \) \( R_(*) + 14 \)$ labels. Their evaluation vectors are independent by 31 and (6.1).
    Consequently every label of the further member occurs in one of the chosen basis representations.
    There are at most $K \( R_(*) + 14 \)$ such labels per projected space.
    Summing over signs and components proves the stated, deliberately generous, bound. ◻
]

Exclude these labels whenever an attack atom is selected at that endpoint. For later finite exclusions set

$ B_(*) = 10 \( B_0 + 10000 g + 1 \) $

and choose $b$ so large that

#[#set math.equation(numbering: n => "(6.5)")
 $ 2^(b - 2 j_(*)) > 100 g \( B_(*) + 1 \) . $ <eq:selector-size>]

The effective test space at endpoint $i$ is

#[#set math.equation(numbering: n => "(6.6)")
 $ C_i = { x in cal(X) : x_e in S_(i \, e)^(+) ⊗ S_(i \, e)^(-) upright(" for every ") e in cal(E) } .
   $ <eq:effective-space>]

Fix a basis of this space on each leaf. Since the total stored pin dimension is at most $K$,
  the sum over components of the individual projection dimensions in either sign is at most $K$. Therefore

#[#set math.equation(numbering: n => "(6.7)")
 $ dim C_i lt.eq K^2 \, wide sum_e "rank" x_e lt.eq K quad \( x in C_i \) . $ <eq:effective-bounds>]

If pins are enlarged, retain the old effective spaces and their chosen basis data as well;
  they are subspaces of the new ones.

#prodef([Definition 6.4.])[
  (Atoms and flavors).  For a tag $l$, selector $s$, and base point $z$ allowed at $l$,
    let $frak(a)_l \( s \, z \) in cal(X)$ be the cut profile represented by $w_l =
    v \( s \, z \) v \( s \, z \)^(sans(T))$ and $w_t = 0$ for $t eq.not l$.
    Its diagonal bit is $q = eta \( w_l \)$ and its role bit is $a \( frak(a)_l \( s \, z \) \)$.
    A generic flavor retains all base coordinates allowed at $l$.
    A shared-only flavor sets all $O$ blocks to zero. A pure flavor sets $S$ to zero and retains a specified
    subset of the allowed $O$ blocks, setting the others to zero.
    Every flavor retains both $\#$ and $Z$ in their entirety.
    At a fixed label, a parameter test samples all retained bits independently and uniformly.
    Its tester summary is the list of all individual quadratic tester values.
    In addition to this summary we may record the basis values of $T \( frak(a)_l \( s \, z \) \, dot.op \) \|_(C_i)$.
] <def:atom>

=== 6.3 Choice of the mixers <choice-of-the-mixers>

For a quadratic function $f$ on a binary vector space, its polar form is $\( u \, v \) mapsto f \( u + v \) +
  f \( u \) + f \( v \) + f \( 0 \)$; its polar rank is the rank of this bilinear form.

Fix, for example,

#[#set math.equation(numbering: n => "(6.8)")
 $ A = 10 \( K + 1 \) p_(*) \( g^2 + 5 \) \, wide s_0 = 4 ceil.l A ceil.r \, wide
   J > 100 \( s_0 + K^2 + 1 \) . $ <eq:mixer-parameters>]

These constants precede $r_0 \, h$ and $M_0$.

#thm([Lemma 6.5.])[
  (Uniform mixing forms).  #emph[For all sufficiently large $n$ one can choose the matrices $L_j^(e f) \,
    R_j^(e f)$ and $M_a$ in 4 so that:]
  + #emph[ For every nonzero $x in cal(X)$ of total component rank at most $K$, every tag, label and flavor,
    and every fixing of the non-$Z$ base coordinates, the quadratic function $T \( x \, frak(a)_l \( s \, z \) \)$
    of the $n$ remaining $Z$ bits has polar rank at least $2 \( J - s_0 \)$.
    It uses a space of linear forms on $Z$ of bounded dimension, independent of $n$.
    This space can be chosen before the non-$Z$ coordinates are fixed.]
  + #emph[ For two distinct labels and any two flavors, every nonzero parity of the indexed $L_j^(e f) \,
    R_j^(e f)$ evaluations between the two point inputs, allowing each matrix in either order or both,
    and optionally either or both orders of $E$, has bilinear-part rank at least $n \/ 5$.
    Here a nonzero parity involving an $L$ or $R$ evaluation means that at least one such indexed ordered
    evaluation occurs. The same rank bound holds for the three parities consisting of $E$ alone,
    its reverse alone, or their sum.]
  #emph[The choices are made before any unit law is selected.]
] <lem:generic-mixers>

#proof[
  A symmetric rank-$r$ matrix $x$ on a $d_B$-dimensional coordinate space can be written $Z H Z^(sans(T))$,
    where $Z$ has $r$ independent columns and $H$ is a nonsingular symmetric $r$-by-$r$ matrix.
    To verify the factorization, take a left inverse $L$ of the chosen column basis $Z$ and put $H =
    L x L^(sans(T))$. The projection $Z L$ fixes $x$ on the left and, by symmetry, on the right;
    hence $Z H Z^(sans(T)) = x$. Its rank forces $H$ to be nonsingular.
    Neither $H$ nor the original matrix is required to have nonzero diagonal.
    For a fixed component rank tuple of total at most $K$, counting $Z \,
    H$ gives at most $2^(d_B K + K^2 + K)$ choices. There are at most $\( K + 1 \)^(\| cal(E) \|)$ such rank
    tuples. Therefore the number of profiles under consideration satisfies
  #[#set math.equation(numbering: n => "(6.9)")
   $ \# { x in cal(X) : sum_e "rank" x_e lt.eq K } lt.eq 2^(A n) $ <eq:low-rank-profile-count>]
  for all sufficiently large $n$, since $d_B = p_(*) \( 1 + \( g^2 + 3 \) n \)$.
  Choose all $L \, R$ matrices independently and uniformly.
    Fix a nonzero profile and write $x_e = Z_e H_e Z_e^(sans(T))$, with $r_e = "rank" x_e$.
    For a tag-$l$ atom the contribution from a single indexed matrix uses the forward forms $Z_e^(sans(T)) L
    v$ when $l in f$, and the reverse forms $v^(sans(T)) L Z_f$ when $l in e$,
    and the corresponding forms for $R$. Regard these initially as separate formal variables.
    Across all indices their number is at most
  $ m_0 = 4 J \( g - 1 \) K . $
  Each forward or reverse pair contributes a bilinear product with nonsingular middle matrix $H_e$ or $H_f$.
    These products use disjoint formal variables. Since $x eq.not 0$,
    for each $j$ there is at least one such nonzero product, so the formal quadratic has polar rank at least $2 J$.
  We justify the distribution of their linear parts on $Z$ even when forward and reverse restrictions overlap.
    For a fixed matrix $L$, specifying $Z_e^(sans(T)) L$ and $L Z_f$ imposes at most $r_e r_f$ compatibility bits,
    namely their common $Z_e^(sans(T)) L Z_f$ block. After restriction to the free $Z$ directions,
    the resulting list remains uniform on a linear subspace of codimension at most $r_e
    r_f$ in the space of all lists. Equivalently its law is dominated by $2^(r_e r_f)$ times the completely
    uniform law. Over all matrices the domination factor is at most $2^(2 J K^2)$;
    only matrices with both relevant incidences contribute a compatibility term.
  For a uniform $m$-by-$n$ matrix, the probability of corank at least $s_0 +
    1$ is at most $2^(m \( s_0 + 1 \) - \( s_0 + 1 \) n)$: choose $s_0 +
    1$ independent row relations and require all their $n$ evaluations to vanish.
    If $m < s_0 + 1$ the probability is zero. The preceding domination therefore bounds the bad probability for a
    fixed profile, tag and label by
  $ 2^(2 J K^2 + \( s_0 + 1 \) m_0) thin 2^(- \( s_0 + 1 \) n) . $
  There is no union over non-$Z$ values or flavors in this estimate:
    they affect affine shifts, not these linear parts on the always retained $Z$ block.
    A union over at most $2^(A n) g 2^b$ choices tends to zero.
    On the complementary event the image of the $Z$ inputs in the formal variable space has codimension at most
    $s_0$. Restricting a bilinear form to a subspace of codimension $s_0$ reduces rank by at most $2 s_0$:
    in a basis extending that subspace one deletes $s_0$ rows and $s_0$ columns,
    each deletion decreasing rank by at most one. This proves Lemma 6.5.
    The formal list itself supplies the claimed bounded space of linear forms.
    The term $T^0$ has no $Z$ variables and does not affect this argument.
  For Lemma 6.5, distinct labels have independent selector evaluation vectors.
    Their two $Z$ direction spaces are therefore disjoint. Restricting a random matrix to these two spaces in the
    two orders reads independent off-diagonal blocks. Any nonempty parity involving ordered $L \,
    R$ evaluations is consequently a uniform $n$-by-$n$ matrix on these directions,
    even after all other matrices and $E$ have been fixed.
  For the parities using only $E$, choose its matrices $M_a$ independently and uniformly.
    On the two $\#$ direction spaces, $E$ restricts to
  $ A_(s \, s') = sum_(a = 1)^b \( s_a + s'_a \) M_a \, $
  which is uniform because $s eq.not s'$. The reverse gives $A_(s \, s')^(sans(T))$, and their sum is alternating.
    An $floor.l n \/ 2 floor.r$ square block with disjoint row and column indices is uniform also in this last
    case. A uniform $d_1$-by-$d_2$ matrix has probability at most $2^(\( d_1 + d_2 \) r - d_1 d_2)$ of rank at
    most $r$, by representing such a matrix as a product of a $d_1$-by-$r$ and an $r$-by-$d_2$ matrix.
    Taking $r < n \/ 5$ gives probability $2^(- Omega \( n^2 \))$ in all the preceding cases,
    including the square block of side $floor.l n \/ 2 floor.r$.
  There are at most $2^(2 b)$ ordered label pairs and $2^(4 J \| cal(E) \|^2 + 2)$ parities to check.
    These counts are fixed in $n$. The $Z$ and $\#$ restrictions also show that the tester part of $E$ and the
    choice of flavor cannot reduce the ranks just proved. A union bound establishes both properties
    simultaneously. Fix one successful choice for each sufficiently large $n$. ◻
]

#prodef([Remark 6.6.])[
  Both $sans(P)_0$ and $pi$ have an exact symmetry under a common $G in
    "GL"_n \( 2 \)$ change of the $Z$ input coordinates at one vertex,
    using that change at every component and in both primal modes.
    To see this, let $R_G$ be the induced automorphism of $cal(B)$:
    it acts as $G$ on the $Z$ block, as the identity on the constant and other base blocks,
    and as the identity on the selector factor. Replace
  $ \( P_e \, Q_e \, X_e \, Y_e \) quad upright("by") quad \( P_e R_G \, Q_e R_G \, X_e \, Y_e \) . $
  Since $E$ has no $Z$ rows or columns, $R_G^(sans(T)) E R_G = E$.
    All prescribed self-Grams, annihilator equations and full-frame injectivities are therefore preserved.
    The inverse transformation uses $G^(- 1)$, so this is a bijection preserving $sans(P)_0$ and its primal marginal.
  Moreover $"im" \( P_e R_G \) = "im" P_e$ and $"im" \( Q_e R_G \) = "im" Q_e$.
    Conditional on the primal maps, the admissible channel maps are consequently exactly the same before and after
    this transformation: their annihilator and injectivity conditions depend only on these primal spans.
    The ambient channel maps themselves and all prescribed ambient thinning sets are fixed.
    Thus the allowed channel sets and their conditional normalizing counts are unchanged.
    Explicitly, if $cal(S)$ denotes the channel-thinning event and $c \( P \, Q \) =
    bb(P)_(sans(P)_0) \( cal(S) divides P \, Q \)$, then $c \( P R_G \, Q R_G \) = c \( P \, Q \)$.
    Both the retained primal marginal and the conditional density $upright(bold(1))_(cal(S)) \/
    c \( P \, Q \)$ defining $pi$ in 5 are therefore preserved.
  Tester summaries are unchanged. The assertion concerns the two reference laws; $T^1$ need not be invariant.
    Under the inverse change of variables in a parameter test,
    each resulting key and its tester data are preserved, while the bounded space of linear forms on $Z$ in 35,
    part Lemma 6.5, is reparametrized. In particular the unfiltered empirical mass of every test depending only on
    that key and the unchanged tester data is preserved. The same equality holds after conditioning on any
    feasible tester summary: this event is independent of $Z$, and its input normalizing count is unchanged.
] <rem:Z-reparametrization>

Choose $r_0$ only after the preceding parameters and the bounded rank requirements in Section 7, Section 9,
  with all fixed marginal-density bounds already specified; retain $h = 1000 r_0$.
  Choose the thinning rate $rho > 0$ after $h$ as in 5. Finally choose $M_0$, also relative to $1 \/ rho$,
  large enough for every stated nominal-coefficient and scalar-record cost to be the required small fraction of
  $N = M_0 n$. None of the finite-test accuracies used later changes these choices.

== 7 Recipes and realization of the gradients <sec:realization>

This section is deterministic. We construct cross Gram entries that turn a finite collection of matched vector
  keys into four hole witnesses. The construction uses the exact frame identities,
  the stored nominal pin spaces and finite-dimensional linear algebra.
  It therefore applies to every frame in the support of the thinned law $pi$, and to every restricted leaf law,
  without any conditional uniformity assumption on its channels.

We use the nominal coefficient spaces of 5. For a unit $O$ and component $e$, these are

$ cal(L)_(O \, e) = xor.big_(i in O) \( cal(B)_i xor H_i^(+) \) \, wide cal(R)_(O \, e) =
  xor.big_(i in O) \( cal(B)_i xor H_i^(-) \) \, wide H_i^plus.minus = bb(F)_2^h . $

Their images are obtained by summing the corresponding frame columns in the common ambient space.
  If $i'$ is the other endpoint of $O$, put $p_i = u_(i') U_i in cal(X)^(*)$.

=== 7.1 Small tables and scalar recipes <small-tables-and-scalar-recipes>

#prodef([Definition 7.1.])[
  For a leaf and component, put
  $ cal(J)_(O \, e)^plus.minus = xor.big_(i in O) \( S_(i \, e)^plus.minus xor H_i^plus.minus \) . $
  For two leaves belonging to units $A \, B$, a small table specifies the two cross bilinear forms on
    $cal(J)_(A \, e)^(+) times cal(J)_(B \, e)^(-)$ and $cal(J)_(B \, e)^(+) times cal(J)_(A \, e)^(-)$,
    for every $e$. It is admissible for two orientations if it agrees with their actual cross Grams whenever at
    least one of the two table arguments is a stored pin direction.
  Let $H_(i \, 0)^plus.minus$ be the projection of the appropriate pin space onto $H_i^plus.minus$,
    and fix a complement $H_i^plus.minus = H_(i \, 0)^plus.minus xor H_(i \, 1)^plus.minus$.
    The complement is called private. We identify the two channel coordinate copies with $bb(F)_2^h$ in their
    common column order. The table is injecting if, for each component, each orientation of the roles $O \, O'$,
    and $i in O \, z in O'$, the following maps are injective:
  #[#set math.equation(numbering: n => "(7.1)")
   $ D_(O \, e)^(+) ∩ cal(B)_i & arrow.r bb(F)_2^h \/ H_(z \, 0)^(+) \, & d & mapsto
     upright("table evaluation of ") d upright(" against ") Y_z \,\
D_(O \, e)^(-) ∩ cal(B)_i & arrow.r bb(F)_2^h \/ H_(z \, 0)^(-) \, & d & mapsto upright("table evaluation of ") d
  upright(" against ") X_z . $ <eq:table-injection>]
  These quotient conditions use the standard coordinate dot pairing on the channels.
    For instance, the first image is zero in the quotient precisely when it pairs to zero with all vectors
    annihilating $H_(z \, 0)^(+)$.
] <def:small-table>

Contractions on $C_i$ computed from the table carry a star.
  Thus $\( u_z U_i \)^(*) \( x \)$, for $x in C_i$, is computed by writing $x_e$ in $S_(i \, e)^(+) ⊗
  S_(i \, e)^(-)$ and taking the dot product of its two table evaluations against $Y_z \, X_z$.
  This is linear in $x$. All coordinates involved have bounded dimension, although that bound may depend on $h$.

For every cross pair $i \, z$, choose between one and seven atoms at $i$ and the same number at $z$,
  with a bijection preserving the tag and the diagonal bit $q$ of each position.
  At any one endpoint all labels in its two lists must be distinct and must avoid the exclusions of 33.
  Write $v_(i z)$ for the sum of its list toward $z$. A scalar recipe requires,
  in both orientations of the two unit roles,

#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(upright("list toward ") z) q = 1 \, wide a \( v_(i z) \) + a \( v_(z i) \) = 1 \,\
T \( v_(i z) \, dot.op \) \|_(C_i) = #scale(x: 120%, y: 120%)[\(] a + \( u_z U_i \)^(*)
  #scale(x: 120%, y: 120%)[\)] \|_(C_i) \,\
\( p_i + a \) \( v_(i z) \) = \( p_(i') + a \) \( v_(i' z) \) . $ <eq:recipe-scalars>]

An atom $frak(a)_l \( s \, y \)$ at $i$ has vector key

$ #scale(x: 120%, y: 120%)[\(] P_(i e) v \( s \, y \) \, med
  Q_(i e) v \( s \, y \) #scale(x: 120%, y: 120%)[\)]_(e in.rev l) \, $

with a fixed order of its $2 \( g - 1 \)$ entries. Matching keys means equality in this order at every matched
  atom position.

#thm([Lemma 7.2.])[
  (Table flags and binary prescriptions).  #emph[The following statements hold.]
  + #emph[For a fixed pair of leaves and a numerical small table,
    admissibility is the intersection of two unary orientation filters, one on each unit.
    Its numerical coordinate data, including injection and the bases of the effective spaces,
    have bounded description length apart from the nominal coefficient bases, which require $O \( n \)$ bits.]
  + #emph[The key directions of the lists at either unit are jointly independent modulo its table-coordinate
    spaces, component by component and sign by sign.]
  + #emph[Given (7.2), there is a prescription of the binary $L \,
    R$ evaluations between distinct atoms at each endpoint, depending only on their tags,
    tester summaries and $p$ bits, which makes
#[#set math.equation(numbering: n => "(7.3)")
 $ r \( v_(i z) \) \( x \) =
   cases(delim: "{", 0 \, & x upright(" is an atom of the list toward ") z \,, p_(z') \( tilde(x) \) \, & x
   upright(" is an atom toward ") z' \,) $ <eq:recipe-gradients>]

 where $z'$ is the other endpoint of the opposite unit and $tilde(x)$ is the matched atom there.]
] <lem:small-tables>

#proof[
  A pin image is fixed on its leaf. A cross entry with a pinned first argument therefore depends only on the other
    unit’s orientation, and conversely for a pinned second argument.
    Entries with both arguments pinned are numerical tests on the leaf pair.
    This proves the first assertion about filters. Use bases of the projected pin spaces to encode tensors of
    $C_i$: their coordinates lie in spaces of dimension at most $K^2$, and there are at most $K^2$ basis tensors.
    The pin, projection and channel relationships and the table are bounded-dimensional matrices.
    The nominal bases themselves have $O \( K dim cal(B) \) = O \( n \)$ coefficients.
  For the second assertion, project a purported dependence onto an individual primal coordinate block.
    It expresses a sum of at most fourteen attack rays as an element of $S_(i \, e)^plus.minus$.
    Any nonzero such vector would have a sparse representation on attack labels and is forbidden by 33.
    Independence of those label factors and the nonzero constant coordinate of each point then makes all
    coefficients zero. The channels introduce no relation because the table space is the direct sum of its
    individual primal and channel blocks.
  For the last assertion, at one endpoint let $I_1 \, I_2$ be its two disjoint nonempty lists.
    The matrix of $T$ on its atoms must be symmetric, with diagonal $a$ on each atom.
    Prescribing the two list sums of its rows is possible exactly when their self-pairings equal the corresponding
    diagonal sums and their mutual pairings agree. To see sufficiency,
    subtract any symmetric matrix with the required diagonal.
    The remaining task prescribes an alternating form on the span of the two independent list indicators and its
    pairings with the whole coordinate space. Extend those indicators to a basis,
    retain the prescribed entries in their rows and columns, and assign the remaining alternating entries arbitrarily.
  For (7.3), the self-pairing requirements hold because $T \( v \, v \) = a \( v \)$. Mutual consistency is
  $ p_z \( v_(z i) \) + p_(z') \( v_(z' i) \) = a \( v_(i z) \) + a \( v_(i z') \) . $
  The coupled equation at the opposite unit gives the left side as $a \( v_(z i) \) + a \( v_(z' i) \)$,
    which equals the displayed right side by the two role-sum equations in (7.2). Thus the symmetric matrix exists.
  Every off-diagonal entry can be implemented by formal $L \, R$ bit prescriptions on that pair of atoms.
    The value of $T^0$ is already determined by their tester summaries.
    Choose one indexed product term in $T^1$ linking a component of the first star to a component of the second
    star; set its two factors to give the desired correction and set all other product factors to zero.
    Forward and reverse evaluations are distinguished. The two labels at this endpoint differ,
    so these are the indexed ordered evaluations covered by 35.
    This argument specifies the bits; their occurrence in parameter tests will be supplied by 61.
    It makes no assumption about independence of arbitrary actual evaluations at fixed points. ◻
]

=== 7.2 The deterministic realization theorem <the-deterministic-realization-theorem>

#thm([Theorem 7.3.])[
  (Gradient realization).  #emph[Suppose two units in fixed leaves have lists satisfying (7.2),
    the binary prescriptions yielding (7.3), equal matched keys, and an admissible injecting small table.
    Freeze their actual cross Gram entries whenever either argument is a pin or a key direction.
    Then there are abstract cross bilinear forms on the full nominal spaces, extending all these frozen entries,
    whose primal-versus-channel entries satisfy
#[#set math.equation(numbering: n => "(7.4)")
 $ u_z U_i = r \( v_(i z) \) quad
   upright("on ") cal(X) wide \( i upright(" and ") z upright(" in opposite units") \) . $ <eq:realized-gradients>]

 Only the primal-versus-channel entries need be prescribed in the final test.
   Their number is at most $16 \| cal(E) \| h dim cal(B) = O \( n \)$, with its coefficient fixed before $M_0$.
   Agreement of the actual cross Grams with these entries produces all four cross holes,
   with witnesses $\( v_(i z) \, v_(z i) \)$.]
] <thm:gradient-realization>

#proof[
  Equal keys imply $U_i v_(i z) = U_z v_(z i)$, and the role sums in (7.2) supply the witness parity.
    It remains to construct the gradients. We distinguish abstract Gram entries from the random event that the
    actual entries agree with them.
  ===== 7.2.1 A baseline of bounded primal rank. <a-baseline-of-bounded-primal-rank.>
  At each component and sign choose a splitting of the table space as $cal(J) = D xor cal(J)'$,
    append the key space, and append an additional primal complement.
    The independence in 38 makes these splittings possible. Retain the small table on the product of the two table
    spaces and the actual frozen entries in any pin or key row or column.
    These prescriptions agree on their overlaps by admissibility.
    Set the free blocks from an additional primal complement to the opposite $cal(J)'$ to zero,
    in both orientations, and set the additional-primal by additional-primal block to zero.
    This defines baseline cross bilinear forms.
  Fix an opposite endpoint $z$. Let
  $ F_(z \, e)^0 : cal(L)_(O \, e) arrow.r bb(F)_2^h \, wide G_(z \, e)^0 : cal(R)_(O \, e) arrow.r bb(F)_2^h $
  be evaluation against its $Y_z \, X_z$ channels. On additional primal inputs,
    evaluation of an opposite channel factors through its projection from $cal(J)$ onto $D$;
    hence the rank there is at most $dim D$. The remaining primal inputs are in bounded-dimensional projected pin
    and key spaces. It follows that the ranks of both baseline maps on all primal inputs are bounded independently
    of $r_0 \, h \, n$. Arbitrary channel-channel entries of the small table do not affect this bound.
    A uniform bound for either map on the combined primal inputs of the two endpoints is
  #[#set math.equation(numbering: n => "(7.5)")
   $ B_(upright("lin")) = 3 K + 28 : $ <eq:baseline-rank-bound>]
  the opposite pin projection costs at most $K$ dimensions,
    the two individual projected primal spaces cost at most $2 K$,
    and the two endpoints have at most twenty-eight key rays.
  Let $u_z^0 U_i$ denote the resulting contractions. They give the table values on $C_i$.
    On an attack atom toward $z$ they are zero, since its tensor is the equal-key tensor at $z$ and $u_z U_z = 0$.
    On an attack toward $z'$ they equal $p_(z')$ of its matched atom,
    since that tensor is the corresponding tensor at $z'$. These are precisely the values in (7.3).
  ===== 7.2.2 Allowed changes. <allowed-changes.>
  Let $cal(A)_(O \, e)^plus.minus$ be the span of all key directions on the indicated side of the unit, and put
  $ cal(F)_(O \, e)^plus.minus = D_(O \, e)^plus.minus + cal(A)_(O \, e)^plus.minus . $
  Write bars for the quotients
  $ overline(cal(L))_(O \, e) = cal(L)_(O \, e) \/ #scale(x: 120%, y: 120%)[\(] cal(F)_(O \, e)^(+) +
    xor.big_i H_(i \, 1)^(+) #scale(x: 120%, y: 120%)[\)] \, quad overline(cal(R))_(O \, e) =
    cal(R)_(O \, e) \/ #scale(x: 120%, y: 120%)[\(] cal(F)_(O \, e)^(-) +
    xor.big_i H_(i \, 1)^(-) #scale(x: 120%, y: 120%)[\)] . $
  We may change $F_z^0 \, G_z^0$ by any maps
  #[#set math.equation(numbering: n => "(7.6)")
   $ delta F_(z \, e) : overline(cal(L))_(O \, e) arrow.r \( H_(z \, 0)^(-) \)^perp \, wide delta G_(z \, e) :
     overline(cal(R))_(O \, e) arrow.r \( H_(z \, 0)^(+) \)^perp . $ <eq:allowed-channel-changes>]
  Here each map is extended to a bilinear change supported on its opposite channel block and zero on the opposite
    primal blocks. It vanishes on all frozen entries: the domain quotient kills frozen directions on one side,
    while on the other side a pin’s channel projection lies in $H_(z \, 0)$ and is annihilated by the allowed
    values. A reciprocal-role change in the same Gram block contributes nothing on this map’s primal inputs,
    because it is supported on a channel argument there. On private-by-private blocks both changes are zero.
    They may add further channel-channel values, which are irrelevant to the primal contractions.
    Thus all choices below may be made independently for opposite endpoints and for the reciprocal unit roles as
    far as primal-input values are concerned.
  ===== 7.2.3 The unrestricted linear response. <the-unrestricted-linear-response.>
  Fix $z$ and solve simultaneously for the two $i in O$. Consider the linear space of responses formed by
  $ F_z^0 dot.op delta G_z + delta F_z dot.op G_z^0 $
  and all bilinear forms on $overline(cal(L))_(O \, e) times overline(cal(R))_(O \, e)$,
    with their contractions summed over components on each individual cut profile.
    We claim that the pair of target forms
  #[#set math.equation(numbering: n => "(7.7)")
   $ #scale(x: 120%, y: 120%)[\(] r \( v_(i z) \) - u_z^0 U_i #scale(x: 120%, y: 120%)[\)]_(i in O)
     $ <eq:target-difference>]
  belongs to this response space.
  Let $\( x_i \)_(i in O) in cal(X)^O$ annihilate all responses.
    Annihilating the arbitrary pure bilinear forms says that at each component the sum of the two nominal tensors
    has zero image in the product of barred quotients. Project further onto the individual primal spaces modulo
    $S_(i \, e)^plus.minus$ and the individual key spans. This projection is well defined on the barred spaces,
    since every pin projects into $S_(i \, e)^plus.minus$. It shows that $x_(i \, e)$ vanishes after both such
    quotients. A matrix killed after quotienting its two factors by spaces of dimensions $d_(+) \,
    d_(-)$ has rank at most $d_(+) + d_(-)$: in bases extending those spaces all entries outside their rows and
    columns vanish. Consequently
  $ "rank" x_(i \, e) lt.eq 2 K + 28 lt.eq R_(*) . $
  Apply 32 to every component.
  For an attack label at $i$, compare its label summand with all key directions in that component.
    Their combined label set has at most $R_(*) + 14$ elements,
    whose direction spaces $p_s ⊗ bb(F)_2^(1 + d_(upright(b)))$ form a direct sum.
    Any vector of $S_(i \, e)^plus.minus$ in this sum has zero attack-label component, by 33.
    Thus the attack summand projects to zero modulo just its individual key ray if the atom uses this component,
    and is zero if there is no such ray. In the former case, writing its affine base vector as $v = \( 1 \, y \)$,
    a symmetric matrix killed in the two quotients by $v$ has the form
  $ Z = c v v^(sans(T)) + v d^(sans(T)) + d v^(sans(T)) . $
  Indeed choose $v$ as the first basis vector: the surviving matrix can be supported only on its first row and
    column. The moment identities in the original affine coordinates now give
  $ Z_(i i) = c v_i \, wide Z_(0 i) = c v_i + d_i + d_0 v_i \, $
  so $d_i = d_0 v_i$ and $Z = c v v^(sans(T))$.
  The cut relation on any triangle of tags separates label by label:
    the union of the three supports has at most $3 R_(*)$ labels, within the interpolation bound.
    At this attack label the nonzero components lie on its tag star;
    the triangle relation forces their scalar coefficients to be equal.
    Subtract that scalar multiple of the attack atom from $x_i$. Do this for every attack label.
    Each subtracted atom annihilates the response space, because both its factor directions are keys.
    The remaining profiles still annihilate the response and have only nonattack label support.
    Removing these separated label blocks does not increase their component ranks or label support sizes.
  At one component contract a remaining $x_(i \, e)$ on the minus side by a primal functional $phi.alt$ at $i$
    annihilating $S_(i \, e)^(-)$ and all individual key directions.
    Extend $phi.alt$ by zero on other endpoint and channel blocks;
    it is a functional on $overline(cal(R))_(O \, e)$. Pure annihilation shows that the resulting individual plus
    vector $d$ is a sum of a pin, key directions, and private channel directions.
    In this representation all key coefficients vanish. To see this, project onto each individual primal block.
    At the other endpoint the projected pin would be a sparse sum of attack rays.
    At endpoint $i$ it is the difference of the nonattack vector $d$, supported on at most $R_(*)$ labels,
    and a sum of at most fourteen attack rays. In both cases the label exclusion prevents any attack coefficient.
    The channel components of the pin lie in the protected spaces $H_0$,
    whereas the remaining channel term lies in their chosen complements $H_1$. They must both vanish. Therefore
  $ d in D_(O \, e)^(+) ∩ cal(B)_i . $
  Test the derivative response using $delta G_(z \, e) = phi.alt ⊗ c$ for arbitrary $c
    in \( H_(z \, 0)^(+) \)^perp$. It gives $F_(z \, e)^0 \( d \) dot.op c = 0$.
    Hence the table evaluation of $d$ is zero modulo $H_(z \, 0)^(+)$, and injection in (7.1) yields $d = 0$.
    The reciprocal contraction proves the same assertion in the minus mode.
  It follows that the remaining component tensors lie in the products of the individual projected pin plus key
    spaces. Their nonattack support removes the key directions by the same sparse-label argument.
    Thus the remaining profiles belong to $C_i$. We have proved that every annihilator is a sum of effective-space
    profiles and attack atoms. The target (7.7) vanishes on the former by (7.2) and on the latter by (7.3) and the
    baseline values. In a finite-dimensional vector space the image of a linear map is the annihilator of the
    kernel of its dual: this follows by extending a basis of the image to a basis of the target space.
    It proves the claimed linear solvability.
  ===== 7.2.4 A low-rank representation of the target. <a-low-rank-representation-of-the-target.>
  For one $i$, the form $r \( v_(i z) \)$ has a matrix representation on the components of rank at most
  #[#set math.equation(numbering: n => "(7.8)")
   $ 15 r_0 + 14 J \| cal(E) \| $ <eq:unconstrained-gradient-rank>]
  per component. Here is an explicit routing for its tester part.
    Let $w = \( w_t \)$ be the representation given by its atom list.
    The list condition gives $chi_(*) \( w \) = sum q = 1$. On an allowed $O_(d \, t)$ block at any tag the
    coefficient in $a + T^0 \( v_(i z) \, dot.op \)$ is
  $ 1 + a \( v_(i z) \) + b_t \( v_(i z) \) = 1 + chi_(*) \( w \) + eta_S \( w_t \) = eta_S \( w_t \) . $
  There are at most seven tags $t$ with nonzero $eta_S \( w_t \)$.
    Route this tester from each allowed tag $l in I_d$ to $d$ through the component ${ l \, d }$.
    It contributes nothing at $d$, where $O_(d \, t)$ is disallowed.
    At a component this uses at most fourteen ordinary testers, allowing either endpoint as center.
    For the shared tester, route a star centered at $t$ with coefficient $a_t \( v_(i z) \)$.
    Its contribution at the center is $\( g - 1 \) a_t \( v_(i z) \) = 0$,
    and at any other tag it gives the desired term in $a_t \( v_(i z) \) b_t$.
    Consolidating gives at most one shared tester per component.
    Each ordered tester matrix has rank $r_0$, proving the $15 r_0$ bound.
  For $T^1 \( v_(i z) \, dot.op \)$, each of the two orientations of an indexed term supplies a matrix of rank at
    most the component rank of $v_(i z)$. This profile is a sum of at most seven atoms,
    so its total component rank is at most $7 \( g - 1 \)$. The total contribution per component has rank at most
    $14 J \( g - 1 \) lt.eq 14 J \| cal(E) \|$. This proves (7.8).
  ===== 7.2.5 Removing the bounded-dimensional obstructions. <removing-the-bounded-dimensional-obstructions.>
  Let $M_(i \, e)$ be the preceding representing matrices. On each individual primal factor choose a projection
    $A_(i \, e)^plus.minus$ whose kernel is the sum of its projected pin and key spaces.
    The matrix $\( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) A_(i \, e)^(-)$,
    extended by zero outside that individual block, is a permitted pure quotient form.
    Its sum over $i$ has rank at most twice (7.8). Moreover
  #[#set math.equation(numbering: n => "(7.9)")
   $ M_(i \, e) - \( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) A_(i \, e)^(-) & = \( I - A_(i \, e)^(+) \)^(sans(T))
     M_(i \, e) + \( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) \( I - A_(i \, e)^(-) \) \,\
"rank" #scale(x: 120%, y: 120%)[\(] M_(i \, e) - \( A_(i \, e)^(+) \)^(sans(T)) M_(i \, e) A_(i \, e)^(-)
  #scale(x: 120%, y: 120%)[\)] & lt.eq "rank" \( I - A_(i \, e)^(+) \) + "rank" \( I - A_(i \, e)^(-) \) lt.eq
  2 K + 28 . $ <eq:bounded-rank-removal>]
  Subtract these pure forms from the linear task. Its residual, including the baseline contraction,
    has a per-individual matrix representation of bounded rank independent of $r_0 \, h \, n$,
    and remains linearly soluble.
  In any unrestricted solution, replace the derivative output maps by bounded-rank maps in the same allowed value
    spaces, preserving all their dot products with the opposite baseline values on primal inputs.
    Such replacement is possible as follows. The map from the allowed value space to the dual of the span of those
    baseline values has bounded rank. Choose a linear section of its image and compose with that map.
    This has bounded-dimensional image and preserves every observed pairing.
    Postcomposing the original derivative map with this value projection leaves its primal derivative response
    unchanged and preserves its domain quotient. The two new derivative maps have bounded rank.
    Their extra product $delta F_z dot.op delta G_z$ is also a bounded-rank pure form,
    which we include with opposite sign in the remaining pure task.
    That task still has an unrestricted pure solution. Its per-individual target matrices have rank at most
  #[#set math.equation(numbering: n => "(7.10)")
   $ R_(upright("res")) = 2 K + 28 + 4 B_(upright("lin")) = 14 K + 140 . $ <eq:residual-rank-bound>]
  Here the first term bounds the projection difference, one $B_(upright("lin"))$ bounds the baseline contraction,
    two bound the derivative terms, and one bounds their extra product.
  ===== 7.2.6 Compression of the remaining pure task. <compression-of-the-remaining-pure-task.>
  We show that the latter task has a pure solution of bounded rank.
    At endpoint $i$, expand all projected pin and key vectors,
    and all row and column forms in its bounded-rank target representation,
    along selector coordinates and base blocks. Their counts depend on earlier construction parameters but not on
    $r_0 \, h \, n$. On each ordinary base block let $U$ be the span of the vectors to fix and $K_0$ the common
    kernel of the forms to preserve. Choose a complement in $K_0$ to $U ∩ K_0$,
    and project along that complement onto a subspace containing $U$.
    The resulting endomorphism fixes $U$, preserves all the forms, and has rank at most $dim U + "codim" K_0$.
    There are at most $2 \| cal(E) \| \( K + 14 \)$ vectors to fix and at most $2 \| cal(E) \|
    R_(upright("res"))$ forms to preserve at one endpoint before selector expansion.
    Thus an explicit bound for the rank on an ordinary block is
  #[#set math.equation(numbering: n => "(7.11)")
   $ D_(upright("blk")) = 2 p_(*) \| cal(E) \| \( K + 14 + R_(upright("res")) \) . $ <eq:block-compression-bound>]
  Use these endomorphisms blockwise, fix the constant base coordinate, and act trivially on the selector factor.
    Use the same resulting map at every component and in both modes at this endpoint.
    It sends each allowed point to an allowed point and therefore preserves all $W_l$ and the cut domain.
    It fixes the individual projected pin and key vectors. Taking identity on channels consequently fixes every
    mixed pin itself and preserves private channel subspaces.
    The map descends to the barred spaces and has bounded rank there:
    only the bounded protected channel dimensions survive their quotients. On either barred space a uniform bound is
  #[#set math.equation(numbering: n => "(7.12)")
   $ D_(upright("quo")) = 2 p_(*) #scale(x: 120%, y: 120%)[\(] 1 + \( g^2 + 3 \) D_(upright("blk"))
     #scale(x: 120%, y: 120%)[\)] + 2 K . $ <eq:quotient-compression-bound>]
  The first term counts the two compressed primal blocks and the second bounds their surviving channel projections.
  Precompose an unrestricted pure solution on its two arguments with these maps.
    Its rank per component becomes bounded. On individual cut profiles its value is unchanged,
    because the compressed profile remains in that cut domain and every form in the target representation is
    preserved. It is therefore the required bounded-rank pure solution.
  ===== 7.2.7 Factoring the pure forms through channels. <factoring-the-pure-forms-through-channels.>
  Restore the earlier projected pure forms. Their sum with the compressed correction has rank at most
  #[#set math.equation(numbering: n => "(7.13)")
   $ 30 r_0 + 28 J \| cal(E) \| + D_(upright("quo")) $ <eq:final-pure-rank>]
  per component for the fixed opposite endpoint. In particular the additive constant is independent of $r_0 \,
    h \, n$. In the two allowed channel value spaces impose, in addition,
    orthogonality to the opposite baseline and bounded derivative values on primal inputs.
    These are only boundedly many linear restrictions. Each remaining value space has codimension at most $K +
    2 B_(upright("lin"))$, so their dot pairing has rank at least $h - 2 K - 4 B_(upright("lin"))$:
    restricting a nondegenerate pairing by codimensions $c_1 \, c_2$ loses at most $c_1 + c_2$ in rank.
    With $h = 1000 r_0$, the sufficient requirement is
  #[#set math.equation(numbering: n => "(7.14)")
   $ 970 r_0 > 28 J \| cal(E) \| + D_(upright("quo")) + 2 K + 4 B_(upright("lin")) . $ <eq:realization-r0-requirement>]
  Every quantity on its right is fixed before $r_0$, so this is one of the permitted requirements on that choice.
  Factor a rank-$r$ desired pure bilinear form as $sum_(a = 1)^r ell_a ⊗ m_a$.
    Choose vectors $f_a \, g_a$ in these remaining channel spaces with $f_a dot.op
    g_b$ equal to the Kronecker delta; they exist by the pairing rank.
    The changes $sum_a ell_a f_a$ and $sum_a m_a g_a$ realize that form as their dot product.
    Their cross terms with the baseline and the previous small derivative changes vanish on primal inputs by the
    additional orthogonality conditions. They obey (7.6) and hence preserve every frozen entry.
    This realizes the target exactly for both endpoints $i in O$.
  Repeat for both opposite endpoints and both unit roles. The independence of primal-input changes already proved
    ensures that the resulting two cross Gram blocks realize all equations (7.4) simultaneously.
    Only primal-channel entries have been used. In each of the two blocks there are at most $8 h dim
    cal(B)$ such entries per component, proving the asserted count.
    Actual agreement with them gives all gradient equations; equal keys and the role sums give the other witness
    conditions. All four cross pairs are therefore holes. ◻
]

== 8 From overlapping key distributions to four holes <sec:collision>

The deterministic construction becomes useful when its keys collide.
  The principal cost is equality of ambient vectors; the remaining primal-channel scalar entries have a smaller
  cost. We give a criterion that retains this distinction, including for cells selected using the parameters on
  the opposite side. The two unit laws may be different. We also keep colour and type tests in the successful
  event throughout the argument.

=== 8.1 Queries and their reference measure <queries-and-their-reference-measure>

A numerical template fixes the shape of all lists in a scalar recipe:
  positions, endpoints, tags, labels, flavors and desired $q$ bits,
  with matching tags and $q$ bits across the two sides. It also fixes each atom’s #emph[numerical unary status]:
  its tester summary, role $a \( upright("atom") \)$, basis values of
  $T \( upright("atom") \, dot.op \) \|_(C_i)$, and $p_i$ bit.
  It fixes the within-endpoint $L \, R$ bit prescriptions of 38. Its labels are distinct at every endpoint.
  For a fixed pair of leaves it may specify a small table and two separate orientation filters,
  including its admissibility filters. Only choices for which equal accepted keys satisfy the hypotheses of 39
  will be used.

The query at a unit draws fresh independent point parameters at all its positions and evaluates their keys.
  Parameters may be uniform on the retained flavor coordinates, or normalized conditional on the prescribed,
  possible $q$ bit at each position. This latter conditioning depends only on point parameters and has a fixed
  positive probability whenever it is possible. In particular the two units’ parameter draws remain independent.
  No normalization is made for the other status, binary, Gram or orientation acceptance conditions.
  Every resulting accepted measure is a subprobability measure.

Let $k$ be the number of ambient vector slots on one template side, counting components and signs.
  There are at most four lists of seven atoms, each with $2 \( g - 1 \)$ slots, so

#[#set math.equation(numbering: n => "(8.1)")
 $ k lt.eq 56 \( g - 1 \) = k_max . $ <eq:key-rank-budget>]

Let $cal(K)_n$ be the set of global tuples of these $k$ vectors satisfying the prescribed paired diagonal bit at
  every position and component, and having every off-position plus/minus inner product within a component equal to
  zero. Write $nu_n$ for the uniform probability measure on $cal(K)_n$.

The set $cal(K)_n$ has density bounded below by a positive constant in the space of all $k$ independent uniform
  vectors, and

#[#set math.equation(numbering: n => "(8.2)")
 $ \| cal(K)_n \| lt.eq 2^(k N) . $ <eq:key-space-size>]

Indeed the number of slots is fixed. With probability tending to one the plus vectors in each component are
  independent; given them, each minus vector fulfills a fixed list of independent linear equations with the
  prescribed probability $2^(- r)$, where $r$ is the number of equations on it. Their total number is fixed.
  This supplies a constant lower bound, including all diagonal and off-position requirements.
  Queries are accepted only when their keys belong to $cal(K)_n$.

For a pair of leaves, let $d_A \, d_B$ be the densities relative to $nu_n$ of the separate accepted key measures,
  integrating over their normalized leaf orientation laws and parameter draws.
  The densities include their orientation filters and all query conditions but are not renormalized for success.
  Thus $integral d_A thin d nu_n \, integral d_B thin d nu_n lt.eq 1$.
  Both filters may depend on the ordered pair of leaves, while each is a predicate on its own orientation and
  query parameters. A test on the leaf pair, such as distinct colours or prescribed law types,
  is written as an external indicator $J_n \( ell_A \, ell_B \) in { 0 \, 1 }$.
  Equivalently, one can set both accepted measures to zero when that test fails.

#thm([Proposition 8.1.])[
  (Filtered collision criterion).  #emph[Let $sigma_A \, sigma_B$ be two laws on units,
    possibly carrying finitely many colour or type marks. After forgetting these marks,
    suppose each law has density at most $2^(3000 g N)$ relative to $pi ⊗ pi$.
    For $O in { A \, B }$, let $tilde(sigma)_O$ be a normalized restriction of $sigma_O$ of relative mass at least
    $2^(- o \( N \))$, decomposed into leaves satisfying (5.11).
    On each side mix the leaves with their actual masses in $tilde(sigma)_O$.]
  #emph[Fix a required predicate $Psi \( A \, B \)$ on the marked units and an allowed leaf-pair indicator $J_n$.
    Use only numerical query options whose joint acceptance on an allowed leaf pair,
    including their separate orientation filters, implies $Psi \( A \, B \)$. Suppose these accepted queries satisfy
#[#set math.equation(numbering: n => "(8.3)")
 $ bb(E)_(upright("independent leaf pair")) J_n \( ell_A \, ell_B \) integral d_A d_B thin d nu_n gt.eq
   2^(- o \( N \)) . $ <eq:overlap-criterion>]

 Then independent draws $A tilde.op sigma_A$, $B tilde.op sigma_B$ satisfy $Psi \( A \, B \)$ and have all four
   cross holes with probability at least
#[#set math.equation(numbering: n => "(8.4)")
 $ 2^(- \( k_max + .03 \) N - o \( N \)) . $ <eq:collision-conclusion>]

 It suffices to obtain (8.3) after skipping some leaf pairs,
   or after summing over a bounded number of numerical options.
   In particular, a positive subsequential overlap lower bound yields (8.4) along that subsequence.
   With $sigma_A = sigma_B$ and $Psi$ the distinct-colour test, the conclusion retains that test.
   The statement also applies when the two sides have different prescribed law types.]
] <prop:collision>

#proof[
  First note where thinning enters the hypotheses. By 24, with $epsilon_(upright("ch")) =
    10 \| cal(E) \| 2^h rho$, the projected unit laws satisfy
  $ sigma_O lt.eq 2^(3000 g N) pi^(⊗ 2) lt.eq 2^(\( 3000 g + epsilon_(upright("ch")) \) N) sans(P)_0^(⊗ 2) . $
  The choice of $rho$ leaves this exponent strictly below $D = 4000 g$,
    also after a restriction of mass $2^(- o \( N \))$. Thus the reference image estimates and first peeling are
    charged against the original law $sans(P)_0$; they supply the all-rank leaf hypothesis used here.
    No uniform conditional channel law under $sigma_O$ or $pi$ is used in this proof.
  We first work with one shape of vector slots and one option per leaf pair.
    A bounded number of shapes or options will be handled at the end.
    We count only leaf pairs with $J_n = 1$, and every accepted measure already contains its filters enforcing
    $Psi$ on these pairs. Leaves are drawn independently from their two actual mass distributions;
    none of the following estimates requires those distributions to be equal.
  ===== 8.1.1 The numerical records. <the-numerical-records.>
  Fix two leaves, a key $q in cal(K)_n$, and point parameter values $a \, b$ on the two sides.
    Freeze the images of all pin and key directions. The pin images are known from the leaves and the key images
    are the entries of $q$. At each unit record the pairings of all its nominal columns with these opposite frozen
    images. Record any numerical statuses in (7.2), (7.3) not already fixed by the query conditions.
    For fixed parameters these records, together with acceptance,
    partition the unit’s orientations into unary cells. A partition is allowed to depend on the opposite
    parameters; it does not depend on the opposite orientation once its frozen images have been specified.
  There are at most
  #[#set math.equation(numbering: n => "(8.5)")
   $ L_n = 2^(C n) $ <eq:record-count>]
  cells on either side, for a constant $C$ fixed before $M_0$.
    To verify the count, there are $O \( dim cal(B) + h \) = O \( n \)$ columns and only boundedly many pin and
    key vectors to pair against. Nominal projected-pin bases use $O \( n \)$ coefficients.
    The basis tensors of $C_i$ are encoded in their bounded projected pin bases,
    rather than as full matrices on $cal(B)$; this uses boundedly many further coordinates.
    Parameter values require $O \( n \)$ bits and the remaining table and status information has bounded size.
    The ambient pin and key images are already fixed and are not charged again as new records.
  The numerical records determine every frozen cross entry.
    Together with the fixed algebraic data, leaves, parameters, and table,
    they determine a choice of the abstract solution in 39. One can make this choice deterministic by taking the
    first solution in fixed coordinate orders on the finite spaces.
    Its unknown entries need not be encoded as additional records.
    In particular, a global signature cylinder or a complicated orientation filter is only an acceptance
    predicate, not an input requiring a new coordinate description for this solver.
  ===== 8.1.2 Pruning at a fixed parameter pair. <pruning-at-a-fixed-parameter-pair.>
  Put
  #[#set math.equation(numbering: n => "(8.6)")
   $ tau_n = 2^(- \( k + .01 \) N) . $ <eq:cell-threshold>]
  For the fixed parameter pair $\( a \, b \)$ and key $q$, let $alpha_a^b \( c \; q \)$ be the mass of a
    first-side accepted orientation in record cell $c$, measured in its normalized leaf law.
    Define $beta_b^a \( d \; q \)$ similarly. Denote their sums over records by $alpha_a \( q \) \,
    beta_b \( q \)$; these sums do not depend on the opposite parameter,
    since it only refines the record partition. Their sums over all keys are at most one.
  Discard for this fixed pair only cells of mass less than $tau_n$.
    The product mass lost from small first-side cells at key $q$ is at most
  $ L_n tau_n thin beta_b \( q \) . $
  Sum over keys and average the independent parameter weights.
    The loss in collision probability is at most $L_n tau_n$, since $sum_q beta_b \( q \) lt.eq 1$ for every $b$.
    Discarding small second-side cells loses at most the same amount.
    Because $nu_n$ is uniform, the overlap integral is $\| cal(K)_n \|$ times the probability of an accepted key
    collision. Thus the total overlap loss, for any fixed leaf pair and also after averaging leaf pairs, is at most
  #[#set math.equation(numbering: n => "(8.7)")
   $ 2 \| cal(K)_n \| L_n tau_n lt.eq 2^(1 + C n - .01 N) lt.eq 2^(- .005 N) $ <eq:fubini-pruning>]
  for the chosen sufficiently large $M_0$ and all sufficiently large $n$.
  Every retained cell is its original unary cell and has mass at least $tau_n$.
    We have not intersected the retained sets over different opposite parameter values;
    such an intersection could reduce a cell below its threshold.
    Instead all subsequent estimates are made for this fixed parameter pair and its unaltered cells,
    and then averaged. This preserves both their mass bounds and the product of the two conditional orientation laws.
  ===== 8.1.3 Image entropy inside a retained cell. <image-entropy-inside-a-retained-cell.>
  By 38, the $k$ nominal key directions are jointly independent modulo the pins,
    with rank computed separately by component and sign and jointly across the two endpoints.
    Suppose a further tuple has rank $t gt.eq 1$ modulo pins and these key directions.
    Apply (5.11) to the combined tuple of rank $k + t$, prescribe the known key images and any images of the
    further tuple, and divide by the cell mass at least $tau_n$. Its largest conditional point mass is at most
  #[#set math.equation(numbering: n => "(8.8)")
   $ 2^(- \( 1 - 2 zeta \) \( k + t \) N + \( k + .01 \) N) & =
     2^(\[ - \( 1 - 2 zeta \) t + .01 + 2 zeta k \] N) lt.eq 2^(- .95 t N) . $ <eq:cell-pmax>]
  Here $k lt.eq k_max$ and $zeta = 1 \/ \( 1000 k_max \)$, so $.01 + 2 zeta k lt.eq .012$.
    The inequality holds for every $t gt.eq 1$, including tuples whose rank grows with $n$.
    Further restrictions defining the cell cause no additional loss:
    the numerator was bounded by an event containing the entire cell and the prescribed images,
    and only the original cell mass has been divided out.
  ===== 8.1.4 Testing the remaining scalar Gram entries. <testing-the-remaining-scalar-gram-entries.>
  For a retained cell pair the abstract target is fixed. Let $s_n$ be the number of its tested primal-channel
    entries in the two cross Gram blocks. By 39 and the final choice of $M_0$,
  $ s_n lt.eq 16 \| cal(E) \| h dim cal(B) < .01 N . $
  Expand the indicator that all these entries agree with the target as a sum of $2^(s_n)$ binary characters,
    with the factor $2^(- s_n)$.
  A character has a coefficient tensor in the direct sum of the two cross nominal tensor products,
    over all components. Take its image after quotienting every nominal factor by pins and keys.
    If this image is zero, its value depends only on frozen cross entries.
    More explicitly the kernel of a tensor-product quotient is the sum of tensors with a frozen factor on at least
    one side; all their pairings have been recorded. The actual and target Grams agree there,
    so the disagreement character is identically one.
  Otherwise let $t gt.eq 1$ be the sum of the ranks of the quotient coefficient matrices,
    over components and the two cross orientations. A rank factorization expresses its phase,
    up to a constant and two separate phases involving frozen images, as
  $ sum_(a = 1)^t X_a dot.op Y_a . $
  On each unit the corresponding coefficient directions have joint rank $t$ modulo its frozen space.
    The two different cross orientations use opposite nominal signs, so their ranks add.
    By (8.8), each tuple of actual images has largest point mass at most $2^(- .95 t N)$ under its conditional
    cell law. The two laws are independent. Absorb the separated phases into bounded weights.
    30, in dimension $t N$, bounds the absolute character mean by
  #[#set math.equation(numbering: n => "(8.9)")
   $ 2^(t N \/ 2) #scale(x: 120%, y: 120%)[\(] 2^(- .95 t N) 2^(- .95 t N) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) =
     2^(- .45 t N) lt.eq 2^(- .45 N) . $ <eq:gram-character-bound>]
  There is at least the trivial character with value one, and all other zero-quotient characters also have value
    one. Consequently the conditional agreement probability on every retained cell pair is at least
  $ 2^(- s_n) #scale(x: 120%, y: 120%)[\(] 1 - 2^(s_n) 2^(- .45 N) #scale(x: 120%, y: 120%)[\)] gt.eq
    2^(- s_n - 1) gt.eq 2^(- .02 N) $
  for all sufficiently large $n$. No independence of the individual tested Gram bits is asserted or required.
  ===== 8.1.5 Averaging and the exponent. <averaging-and-the-exponent.>
  The assumed overlap is subexponentially large. The error in (8.7) is exponentially small,
    so the retained collision probability, after averaging leaves and independent parameters,
    is at least $2^(- o \( N \)) \/ \| cal(K)_n \|$. Integrating the preceding scalar agreement bound gives four
    holes with probability at least
  $ 2^(- \( k + .02 \) N - o \( N \)) $
  under $tilde(sigma)_A ⊗ tilde(sigma)_B$, with $Psi$ satisfied.
    This implication is valid even if many successful queries certify the same orientation pair:
    the fresh query experiment is a probability space, and its successful event is contained in the event that the
    underlying orientations satisfy $Psi$ and have all four holes.
    Each original law dominates its restricted normalized law by its own restriction mass.
    The product of those two masses is at least $2^(- o \( N \))$,
    which gives the same additional cost even when the laws and restrictions are different.
  If there are boundedly many options, sum the corresponding overlap quantities and choose one whose expectation
    is at least the sum divided by their number, or partition into these fixed cases.
    Shapes of $cal(K)_n$ and varying finite numerical formats can likewise be separated into boundedly many cases.
    These constant factors are absorbed by the slack from $.02$ to $.03$ in (8.4). Finally
  $ k_max + .03 = 56 \( g - 1 \) + .03 < 100 g \, $
  so (8.4) contradicts a sequence whose probability of four holes satisfying the required predicate $Psi$ is less
    than $2^(- 100 g N)$. In particular, failure of a filtered distribution test forces vanishing overlap only for
    its permitted options; the argument makes no assertion about the overlaps of excluded colour or type pairs. ◻
]

== 9 Phase estimates before key collisions <sec:phases>

The estimates in this section supply the compatible small tables used in 50.
  Channel thinning makes the retained mass and the compatibility margin positive constants chosen before the
  channel size. The original frame law is $sans(P)_0$, whereas all marginal bounds below are against the thinned
  law $pi$.

Throughout this section, different units are independent,
  but the two endpoints of one unit may have arbitrary dependence.
  A marked unit is a unit together with choices $lambda_i in C_i^(upright("old"))$, $i = 1 \, 2$,
  where $C_i^(upright("old"))$ denotes its effective space after the first peeling.
  Marks are permitted to depend on the entire unit. Put

#[#set math.equation(numbering: n => "(9.1)")
 $ Delta_O = U_1 lambda_1 + U_2 lambda_2 \, wide u_(O \, S) =
   sum_(i in S) u_i quad \( S subset.eq { 1 \, 2 } \) . $ <eq:delta-phase>]

The total component rank of $Delta_O$ is at most $r = 2 K_1 + 2$.
  We use $L_0 \, d_0 \, u_0 \, K$ from (4.3), (4.2); in particular,

$ L_0 = ceil.l 100 \( D + 10 \) ceil.r \, wide d_0 = 4 r L_0 \, wide u_0 = 10 \( K_1 + d_0 + 1 \) . $

Write $epsilon_(upright("ch")) = 10 \| cal(E) \| 2^h rho$, as in 24.
  A marked law with endpoint marginals at most $Lambda pi$ has unchanged primal marginal bound $Lambda "pr"_(*)
  sans(P)_0$, but its full-frame bound is only $Lambda 2^(epsilon_(upright("ch")) N) sans(P)_0$.
  Here $Lambda$ is a fixed constant specified before $h$. In the coloured test it comes from the pooled law and
  the total mass retained, and does not depend on the probability of an individual colour.
  The starting absolute pair cap is $2^(3000 g N) pi^2$. After the first peeling and restrictions of fixed
  positive mass it is at most $2^(\( D + .01 \) N) sans(P)_0^2$, by 24 and $D = 4000 g$.
  Every use of a full-frame image bound below explicitly pays the loss $epsilon_(upright("ch")) N$.
  We choose $epsilon_(upright("ch")) < min { zeta \/ 100 \, 10^(- 4) }$, after $h$,
  and choose $M_0$ afterward to make each primal ratio loss as small as required.
  A fixed multiplicative constant is absorbed by taking $n$ sufficiently large.

#prodef([Definition 9.1.])[
  A componentwise cover is a collection of subspaces $T_e^plus.minus subset.eq V_e^plus.minus$.
    A tensor $xi = \( xi_e \)_e$ is covered by it if
  $ xi_e in T_e^(+) ⊗ V_e^(-) + V_e^(+) ⊗ T_e^(-) quad upright("for every ") e . $
  The dimensions of the two modes of the cover are $sum_e dim T_e^(+)$ and $sum_e dim T_e^(-)$.
]

#thm([Lemma 9.2.])[
  (Rank growth without a cover).  #emph[Let $r gt.eq 1$ be an integer, set $m_r = 100 r + 10$ and $q_r =
    2^(- m_r)$, and let $s$ be a power of two with $s gt.eq 2^(m_r)$.
    Suppose $T_1 \, dots.h \, T_s$ are independent copies of a random tensor of total component rank at most $r$.
    If every fixed componentwise cover with dimension at most $r s$ in each mode has probability less than $p$, then
#[#set math.equation(numbering: n => "(9.2)")
 $ bb(P) {"rank" (sum_(j = 1)^s T_j) < q_r s \/ 4} lt.eq 4^s p^(q_r s \/ 2) . $ <eq:no-cover-rank>]

 Here rank means the sum of component ranks.]
] <lem:no-cover-rank>

#proof[
  Regard all components as blocks in the direct sums of the two mode spaces.
    Their column and row spaces are direct sums of componentwise spaces,
    so that every cover obtained in this proof is componentwise.
    We first make a deterministic observation about any realized list of tensors.
  Expose a subset $E$ of the indices and quotient the two modes by the column and row spans of the exposed
    tensors. If $b = s - \| E \|$ indices remain, let $C_j \,
    R_j$ be their projected original column and row spaces. Define their span deficits by
  $ delta_C = sum_(j in.not E) dim C_j - dim sum_(j in.not E) C_j \, wide delta_R = sum_(j in.not E) dim R_j -
    dim sum_(j in.not E) R_j . $
  The projected sum has rank at least
  #[#set math.equation(numbering: n => "(9.3)")
   $ \# { j in.not E : overline(T)_j eq.not 0 } - delta_C - delta_R . $ <eq:rank-deficits>]
  Indeed, before adding the mode spaces, place the projected tensors on the separate formal summands $C_j ⊗ R_j$.
    Their block diagonal sum has rank at least the displayed number of nonzero tensors.
    Applying the two addition maps can decrease rank by at most their kernel dimensions, which are $delta_C \, delta_R$.
  There is an exposed set leaving $b = s \/ 2^j$ indices for some $0 lt.eq j < m_r$ such that $delta_C +
    delta_R lt.eq b \/ 4$. To prove this, order the realized direction spaces by a uniform random permutation.
    In either mode, let $a_t$ be the expected increase of their span dimension at the $t$-th step.
    Submodularity and exchangeability give
  $ r gt.eq a_1 gt.eq a_2 gt.eq dots.h.c gt.eq a_s gt.eq 0 . $
  For $b_j = s \/ 2^j$, set
  $ f_j = a_(s - b_j + 1) \, wide v_j = f_j - 1 / b_j sum_(t = s - b_j + 1)^s a_t . $
  Each remaining index has expected projected dimension $f_j$ immediately after the first $s - b_j$ exposures.
    Consequently its mode’s expected deficit divided by $b_j$ is $v_j$.
    The average increment on the first half of this tail is at least $f_(j + 1)$. It follows that
  $ v_j lt.eq f_j - f_(j + 1) + 1 / 2 v_(j + 1) . $
  Summing for $0 lt.eq j < m_r$ yields
  $ sum_(j = 0)^(m_r - 1) v_j lt.eq 2 \( f_0 - f_(m_r) \) - v_0 + v_(m_r) lt.eq 2 r . $
  The two modes therefore have total expected deficit ratios at most $4 r$ across these $m_r$ scales.
    Some scale has expected ratio less than $1 \/ 4$, and some permutation realizes a ratio at most $1 \/ 4$,
    as claimed.
  If the original sum has rank less than $q_r s \/ 4$, its projection at this exposed set has no larger rank.
    By (9.3), at most $q_r s \/ 4 + b \/ 4 lt.eq b \/ 2$ remaining tensors have nonzero projections.
    At least $q_r s \/ 2$ of them thus belong to the cover formed by the exposed column and row spans.
    Both cover dimensions are at most $r s$.
  For fixed disjoint index sets $E \, J$, with $\| J \| = ceil.l q_r s \/ 2 ceil.r$,
    condition only on the tensors indexed by $E$. The cover is then fixed,
    and the tensors indexed by $J$ are still independent. The probability that all are covered is at most
    $p^(\| J \|)$. There are at most $2^s$ choices for each index set. Taking their union proves (9.2). ◻
]

#thm([Theorem 9.3.])[
  (Phase alternative).  #emph[Suppose a marked-unit law $sigma$ satisfies
$ sigma_i lt.eq Lambda pi quad \( i = 1 \, 2 \) \, wide sigma lt.eq 2^(\( D + .01 \) N) sans(P)_0^2 \, $

 where $Lambda$ is fixed before the channel size, and suppose $Delta_O eq.not 0$ throughout.
   For all sufficiently large $n$, one can retain a sublaw of relative mass at least $delta_(upright("ph")) > 0$,
   depending only on the early parameters, such that one of the following holds for independent draws $A \, B$:]
  + #emph[every nontrivial phase mean
$ bb(E) \( - 1 \)^(u_(B \, S) \( Delta_A \) + u_(A \, R) \( Delta_B \)) \,
  wide \( S \, R \) eq.not \( diameter \, diameter \) \, $

 has absolute value less than $.005$;]
  + #emph[writing $F \( A \, B \) = u_(B \, { 1 \, 2 }) \( Delta_A \)$, one has $F \( A \, B \) =
    0$ for every pair of retained units, and every displayed mean for which $\| S \| = 1$ or $\| R \| =
    1$ is $2^(- Omega \( N \))$.]
  #emph[All marks remain in their first effective spaces. No additional image directions are pinned.
    Neither the retained-mass bound nor the tiny-cover dimension used in the proof depends on selector or channel
    sizes; the lower bound required of $h$ may depend on $Lambda$.]
] <thm:phase-alternative>

#proof[
  We first choose the parameters and treat the case with no large cover.
    In the cover case we pass to offset records. A tiny cover either makes $F$ identically zero or permits a gain
    from thinning; in the absence of a tiny cover, a fresh-direction count gives mixing.
  Write
  $ c_s = 10^(- 12) \( 1 + r \)^(- 4) \, wide q_0 = 2^(- 100 r - 10) \, wide theta = 10^(- 4) \, wide Gamma = D +
    2 r + 10 \, $
  and let $s$ be the largest power of two not exceeding $c_s N$.
    For large $n$, it satisfies the size requirement of 42 and $s gt.eq c_s N \/ 2$.
    Choose $p_0 > 0$, using only these early parameters, so small that
  #[#set math.equation(numbering: n => "(9.4)")
   $ q_0 / 2 log_2 \( 1 \/ p_0 \) gt.eq 2 + log_2 \( 1 \/ theta \) + frac(2 Gamma, c_s) . $ <eq:early-p0>]
  When the channel size is chosen, require also
  #[#set math.equation(numbering: n => "(9.5)")
   $ frac(h q_0, 4) gt.eq log_2 \( 1 \/ theta \) + frac(2 Gamma, c_s) . $ <eq:early-h-moment>]
  Further lower bounds for $h$ arising below will again involve only early parameters.
  #emph[No large cover.] Suppose no fixed cover of dimension at most $r s$ in each mode has mass at least $p_0$.
    Fix a candidate value $xi$ of $Delta_B$, a nonempty $S$, and a set $R$.
    Define the unit-side sign $psi \( A \) = \( - 1 \)^(u_(A \, R) \( xi \))$.
    Against completely iid channel columns at the endpoints selected by $S$, expansion of the even $s$-th moment gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ & bb(E)_(upright(i i d med c h a n n e l s)) lr(|bb(E)_A psi \( A \) \( - 1 \)^(u_(B \, S) \( Delta_A \))|)^s\
 & #h(25mm)  lt.eq bb(E)_(A_1 \, dots.h \, A_s) 2^(- h "rank" \( Delta_(A_1) + dots.h.c + Delta_(A_s) \)) .
   $ <eq:phase-moment>]
  For one channel pair the expectation of its bilinear character on a tensor $xi$ is $2^(- "rank" xi)$.
    Independence over channels and components proves this assertion;
    selecting both endpoints only squares the factor. The signs $psi \( A_j \)$ have absolute value one and can be
    removed for an upper bound. By 42, the last expression is at most
  $ 2^(2 s) p_0^(q_0 s \/ 2) + 2^(- h q_0 s \/ 4) . $
  The channel marginal comparison in 23 multiplies this bound by a constant depending on $h$ and the number of
    components, but independent of $n$. Markov’s inequality and (9.4),
    (9.5) bound the probability that the inner mean has magnitude at least $theta$ by $C_h 2^(- Gamma N)$.
  There are at most $C_r 2^(2 r N)$ tensors of total component rank at most $r$:
    choose their component ranks, then factor each matrix through that rank.
    The component-rank choices and the overcounting factors are bounded independently of $n$.
    Take a union over these candidate values and the bounded choices of $S \, R$,
    and then pay the joint-law density $2^(\( D + .01 \) N)$. The exceptional $B$-mass is exponentially small.
    On all other $B$’s the conditional $A$-mean is at most $theta$,
    even after inserting the actual value $Delta_B$. Every required phase mean is therefore at most $theta +
    2^(- Omega \( N \)) < .005$. Interchanging $A \, B$ deals with $S = diameter$.
    This proves the first alternative without a further restriction.
  #emph[A large cover and its offsets.] Otherwise retain mass at least $p_0$ in a fixed cover
    $\( T_e^(+) \, T_e^(-) \)$ of dimension at most $r s$ in each mode.
    Each individual primal frame span avoids these fixed subspaces except on exponentially small mass.
    Indeed its dimension is $dim cal(B)$, its location is uniform under $sans(P)_0$, and
  $ bb(P)_(sans(P)_0) { "im" P_(i e) ∩ T_e^(+) eq.not 0 } lt.eq 2^(dim cal(B) + dim T_e^(+) - N + 1) \; $
  the same estimate holds for the minus mode. Here $r s lt.eq
    r c_s N$ and $dim cal(B) \/ N$ is sufficiently small. The primal marginal bound $Lambda "pr"_(*)
    sans(P)_0$ permits deletion of these exceptions; this step does not use a full-frame bound against
    $sans(P)_0$. Normalize the retained law, still denoted $sigma$.
    Its marginal bound $sigma_i lt.eq L pi$ has $L lt.eq 2 Lambda \/ p_0$ for all sufficiently large $n$.
    Thus this fixed bound may also depend on the given $Lambda$,
    whereas the retained-mass bound remains independent of $Lambda$.
  Project both modes of each component modulo $T_e^plus.minus$.
    Because $Delta$ is covered, the two endpoint tensors have the same quotient.
    The projections are injective on the individual primal spans, so they preserve each tensor rank.
    Choose a shortest outer-product factorization of the common quotient tensor and lift each factor to the two
    endpoint primal spans. Componentwise, the difference has the form
  #[#set math.equation(numbering: n => "(9.7)")
   $ Delta = sum_alpha #scale(x: 120%, y: 120%)[\(] p_alpha b_alpha^(sans(T)) + a_alpha q_alpha^(sans(T)) +
     a_alpha b_alpha^(sans(T)) #scale(x: 120%, y: 120%)[\)] \, quad a_alpha in T^(+) \, quad
     b_alpha in T^(-) . $ <eq:cover-lifting>]
  The first endpoint is the reference here; its factors are $p_alpha \, q_alpha$,
    and those at the second endpoint are $p_alpha + a_alpha \, q_alpha + b_alpha$.
    The factor lists at either endpoint are independent in their respective modes.
  Choose bases for the spans of the offsets $a_alpha \, b_alpha$ in each component.
    Their combined ordered list is denoted $omega_O$, and its size is $t_O$, with
  #[#set math.equation(numbering: n => "(9.8)")
   $ 1 lt.eq t_O lt.eq 2 r . $ <eq:offset-rank>]
  The lower bound follows from $Delta eq.not 0$. Collect the companions of these offset basis vectors in a tuple
    $Z_O$: minus companions pair with plus offsets and vice versa.
    The companions are independent within each component and mode.
    For example, writing $b_alpha = sum_k c_(k alpha) omega_k^(-)$ gives a full-row-rank matrix
    $\( c_(k alpha) \)$, so the vectors $sum_alpha c_(k alpha) p_alpha$ are independent.
    Using the second endpoint as reference changes each companion by a known combination of offsets,
    and preserves independence.
  An offset record consists of these basis vectors, their component and sign assignments,
    and the bounded coefficient arrays in (9.7). Its logarithmic count is at most
  $ 2 r^2 s + O_(r \, g) \( 1 \) < .002 N $
  for sufficiently large $n$. Choosing a nominal representation of a companion tuple in one endpoint’s primal
    frame costs $2^(O \( r dim cal(B) \)) = 2^(O \( n \))$ possibilities.
    This last cost has an arbitrarily small ratio exponent after choosing $M_0$.
    Fix deterministic conventions for all these records and factorizations;
    their choices can be arbitrary functions of the marked unit.
  For a linear tensor functional $u$, let $Phi_u \( omega \)$ be the tuple obtained by contracting $u$ with the
    offset basis vectors. In particular, on a plus offset $a$ its corresponding plus output is
    $X \( Y^(sans(T)) a \)$; on a minus offset $b$ the minus output is $Y \( X^(sans(T)) b \)$.
    At fixed two offset records the phase in the theorem is, up to a sum of two unary phases,
  #[#set math.equation(numbering: n => "(9.9)")
   $ Z_A dot.op Phi_(u_(B \, S)) \( omega_A \) + Z_B dot.op Phi_(u_(A \, R)) \( omega_B \) . $ <eq:offset-walsh>]
  The unary phases are evaluations of the last term of (9.7);
    fixed offset records make them separate functions of $A$ and $B$.
  #emph[Singleton phase estimates.] All record laws in the following calculation are unnormalized subprobabilities
    of $sigma$. For any record, the companion tuple alone has point masses at most
  #[#set math.equation(numbering: n => "(9.10)")
   $ p_max \( Z_O \) lt.eq 2^(- t_O N + .01 N) . $ <eq:companion-pmax>]
  To obtain this, enumerate its nominal primal representations,
    apply the individual primal frame-image estimate and the unchanged primal marginal bound $L "pr"_(*)
    sans(P)_0$, and choose $M_0$ large enough to absorb the coefficient count and lost primal codimensions.
  Suppose $S = { j }$, and use endpoint $j$ as the reference for the $B$-companions.
    For fixed $omega_A$, discard pairs on which the coefficient lists $Y_j^(sans(T)) a$ or $X_j^(sans(T)) b$,
    for its independent offsets, fail full rank in any component.
    Under the original law, comparison with iid columns bounds the transpose-rank failure on $d$ independent
    ambient vectors by $2^(d - h + 1)$ for large $n$. The fixed-list assertion of 24 bounds the same event under
    $pi$ by $2^(d - h + 1) + o \( 1 \)$, uniformly over the fixed list.
    For each fixed $A$, the list being tested is fixed before drawing $B$.
    Consequently the discarded pair mass is at most
  $ L thin O \( r \) thin 2^(2 r - h) + o \( 1 \) < 10^(- 4) \, $
  on making $h$ sufficiently large in terms of the fixed marginal cap and the early rank bound.
  On the remaining pairs, the tuple $\( Z_B \, Phi_(u_(B \, j)) \( omega_A \) \)$ has point masses at most
  #[#set math.equation(numbering: n => "(9.11)")
   $ 2^(- \( t_B + t_A \) N + \( .02 + epsilon_(upright("ch")) \) N) . $ <eq:singleton-joint-pmax>]
  Here is a direct conditional count. Enumerate a nominal representation of $Z_B$, first test its values,
    and condition on the primal frames at endpoint $j$. The two channel maps are independent uniform-column draws
    in the appropriate annihilators, apart from a bounded injectivity conditioning.
    Freeze the values of $Y^(sans(T)) a$ and $X^(sans(T)) b$.
    Their number of possibilities is bounded in $n$, and their lists have full rank on the retained event.
    Ignore the equations that originally defined these coefficient values.
    Prescribing their images under $X$ and $Y$ then costs at least $\( N - dim cal(B) \) t_A$ bits,
    up to a bounded factor. This is a count under $sans(P)_0$, conditional on its primal frames.
    Replacing its channel law by that of $pi$ costs at most $2^(epsilon_(upright("ch")) N)$;
    applying the endpoint marginal bound costs the fixed factor $L$.
    Together with the primal companion test this gives (9.11).
    The ignored equations only enlarge the event, so no independence between a coefficient list and the map
    defining it has been assumed.
  Apply 30 to (9.9), on $\( t_A + t_B \) N$ bits. On the $A$-side the point-mass bound for the entire tuple is no
    larger than (9.10); on the $B$-side use (9.11). Separate unary phases have absolute value one.
    The contribution for two fixed records is at most
  $ 2^(\( t_A + t_B \) N \/ 2)
    (2^(- t_A N + .01 N) 2^(- \( t_A + t_B \) N + \( .02 + epsilon_(upright("ch")) \) N))^(1 \/ 2) =
    2^(\( - t_A \/ 2 + .015 + epsilon_(upright("ch")) \/ 2 \) N) . $
  There are at most $2^(.004 N)$ record pairs. By (9.8), their total is at most $2^(- .480 N)$.
    Thus every singleton phase mean is bounded by $10^(- 4) + 2^(- .480 N)$. The same proof applies when $\| R \| = 1$.
  #emph[A tiny cover or mixing of the full endpoint sum.] Put $delta = .0005$.
    If a cover of total dimension at most $d_0$ contains the whole offset list with probability at least $delta \/
    4$, restrict to those units. Intersect its spaces componentwise with the preceding large cover.
    This preserves every captured offset list and does not increase its dimension.
    Each individual primal span therefore still avoids it. Delete units whose channel transpose at either endpoint
    is not injective on a fixed basis of any component and sign of this tiny cover.
    By 24 and the endpoint bound, the deleted relative mass is at most
  $ L' thin O \( d_0 + \| cal(E) \| \) 2^(d_0 - h) + o \( 1 \) \, wide L' lt.eq 4 L \/ delta . $
  Take $h$ so this is less than $1 \/ 2$. This leaves relative mass at least $delta \/ 8$ in the large-cover law.
    All future offset lists in this tiny cover now pass the singleton rank tests.
  Repeat (9.7) with the tiny cover as the quotient directions. Fix an offset record:
    the actual offset basis, its component and sign assignments, and its bounded binary coefficient arrays.
    These data have at most
  $ R_0 = 2^(100 \( r + 1 \)^2 \( d_0 + \| cal(E) \| + 1 \)) $
  possibilities. Indeed at most $2 r$ vectors are chosen from a fixed space of dimension $d_0$,
    at most $2 r$ component/sign assignments are made, and all coefficient arrays have bounded sizes in terms of
    $r \, \| cal(E) \|$. The deliberately generous exponent bounds the product of these finite counts.
    Retain a record of mass at least $1 \/ R_0$. This fixes a common ordered tuple $omega$, of length $1 lt.eq
    t lt.eq 2 r$, but fixes neither the companions nor any frame image.
    In particular this restriction is not an additional pinning step.
  Split once more, retaining at least half the mass, according as $Phi_(u_(O \, { 1 \, 2 })) \( omega \)$ is zero
    or nonzero. All normalizations in this paragraph are bounded by early constants.
    In the zero case each term in (9.7) has one factor from $omega$, so
  $ u_(B \, { 1 \, 2 }) \( Delta_A \) = 0 quad upright("for every retained ") A \, B . $
  This includes the last, offset–offset term of the lift. The singleton count already proved,
    with no rank discard because the whole tiny cover passes the transpose tests,
    gives exponentially small singleton means under this fixed restriction. Thus alternative (ii) holds.
  In the nonzero case we claim the stronger full-sum point bound
  #[#set math.equation(numbering: n => "(9.12)")
   $ bb(P)_sigma { Z_O = z \, Phi_(u_(O \, { 1 \, 2 })) \( omega \) = phi.alt } lt.eq
     2^(- t N - rho N \/ 3) quad \( phi.alt eq.not 0 \) . $ <eq:tp-fullsum-pmax>]
  Here $sigma$ denotes the normalized retained law; its endpoint marginals are at most $L''
    pi$ for an early constant $L''$. To verify the claim, choose endpoint one as reference in the lift.
    Enumerate all nominal primal descriptions of its $t$ independent companions; their count is $2^(O \( n \))$.
    For each description, prescribing the companion images $z$ has probability at most $2^(- t N + O \( n \))$
    under the primal marginal of $pi$, which is exactly the primal marginal of $sans(P)_0$.
    Choose a nonzero coordinate $d$ of the prescribed output $phi.alt$.
    The corresponding contraction of each endpoint’s channel form is a nonzero channel combination,
    because its transpose is injective on the fixed cover basis. Call these combinations $v_1 \, v_2$.
    They lie in the same prescribed component/sign subset, and $v_1 + v_2 = d eq.not 0$.
    Necessarily, therefore, endpoint one has a nonzero channel combination in the translate by $d$ of its allowed
    subset. Conditional on all its primal frames, this endpoint-one event has $pi$-probability at most
    $2^(- rho N \/ 2)$, by 24.
  This is a necessary event on endpoint one alone. Consequently its probability under the dependent two-endpoint
    law is bounded using only the endpoint marginal $L'' pi$:
    no independence of the endpoints, and no conditional density bound for endpoint two, is used.
    Sum the nominal descriptions to obtain
  $ bb(P)_sigma { Z_O = z \, Phi = phi.alt } lt.eq L'' 2^(- t N + C n) 2^(- rho N \/ 2) $
  for a constant $C$ fixed before $M_0$. Choose $M_0$ so $C \/ M_0 < rho \/ 12$,
    and then $n$ so $log_2 L'' \/ N < rho \/ 12$. This proves (9.12).
  For the other side of the Walsh estimate the companion-only bound can now be sharpened to
  #[#set math.equation(numbering: n => "(9.13)")
   $ p_max \( Z_O \) lt.eq 2^(- t N + rho N \/ 12) . $ <eq:tp-fine-companion-pmax>]
  Its errors are solely $O \( n \)$ primal image and nominal-description costs plus a fixed normalization,
    so increasing $M_0$ after $rho$ proves this bound. There is no full-frame thinning loss in (9.13).
    For a phase containing a full-sum term, apply 30 to (9.9),
    using (9.12) on that term’s side and (9.13) on the other.
    Both records are already fixed, so there is no exponential record union. The absolute value is at most
  $ 2^(2 t N \/ 2) (2^(- t N + rho N \/ 12) 2^(- t N - rho N \/ 3))^(1 \/ 2) = 2^(- rho N \/ 8) . $
  When the other phase term is absent, its output coordinates are zero;
    the companion bound still bounds the full tuple. Phases containing a singleton have the previous exponential
    estimate. Every nontrivial phase is of one of these types, so the nonzero case gives alternative (i).
  Assume instead that no such cover captures mass $delta \/ 4$.
    Fix an $A$-offset list $v = omega_A$, and use endpoint $1$ as reference throughout the next calculation.
    Call $B$ frequent for this list if its offset record $m$, its companion value $z$, and its output $phi.alt =
    Phi_(u_(B \, { 1 \, 2 })) \( v \)$ have joint point probability greater than $2^(- \( t_B + .5 \) N)$.
    For fixed $m \, z$, define the deterministic list
  #[#set math.equation(numbering: n => "(9.14)")
   $ cal(F)_v \( m \, z \) = {phi.alt : sigma #scale(x: 120%, y: 120%)[\(] m_B = m \, Z_B = z \,
     Phi_(u_(B \, { 1 \, 2 })) \( v \) = phi.alt #scale(x: 120%, y: 120%)[\)] > 2^(- \( t_B + .5 \) N)} .
     $ <eq:frequent-list>]
  By (9.10), $\| cal(F)_v \( m \, z \) \| lt.eq 2^(.51 N)$.
  We claim that the frequent-pair mass is at most $delta$. Otherwise a set of $B$’s of mass at least $delta \/
    2$ has frequent $A$-mass at least $delta \/ 2$. Draw $L_0$ independent $A$-probes.
    At each stage the spans of all past offsets have total dimension at most $2 r L_0 < d_0$.
    The mass of a probe whose whole offset list lies in those spans is less than $delta \/ 4$.
    Thus each stage has conditional probability at least $delta \/
    4$ of being frequent and having a fresh offset vector. Select one fresh vector by a fixed rule using only the
    probe lists. Averaging fixes a probe collection with independent selected witnesses in each component and
    mode, and with successful $B$-mass at least
  #[#set math.equation(numbering: n => "(9.15)")
   $ q_(*) = \( delta \/ 2 \) \( delta \/ 4 \)^(L_0) > 0 . $ <eq:fresh-probe-mass>]
  This lower bound is independent of selector and channel sizes. Require
  #[#set math.equation(numbering: n => "(9.16)")
   $ L thin O \( L_0 \) thin 2^(L_0 - h) < q_(*) \/ 2 . $ <eq:early-h-probes>]
  By 24, the successful $B$’s can then be trimmed so that the channel transpose at endpoint $1$ has full rank on
    all these fixed witness vectors, while leaving mass at least $q_(*) \/ 2$,
    after absorbing the uniform $o \( 1 \)$ error in a strict version of (9.16).
  Now estimate this event under the raw law $sans(P)_0^2$. Condition on all of endpoint $2$ and on the primal
    frames at endpoint $1$. Enumerate the offset record $m$, and enumerate a nominal primal tuple representing
    $Z_B$ at endpoint $1$. There are at most $2^(.002 N + O \( n \))$ such choices.
    For each choice the ambient value $z$, all the lists in (9.14), and their endpoint-$2$ translations are fixed.
    The event defined by the adaptive marks is contained in the union of these raw events.
    This uses no conditional density assertion about the marked law,
    and does not enumerate $2^(t_B N)$ arbitrary ambient companion values.
  Project each of the $L_0$ lists onto the coordinate of its chosen fresh witness.
    Their total product size is at most $2^(.51 L_0 N)$. Freeze the bounded lists of channel coefficient values on
    the witnesses. On their full-rank event, prescribing the corresponding endpoint-$1$ output tuple costs at
    least $.99 L_0 N$ bits, by the same annihilator count as in (9.11).
    The upper probability under $sigma$, after paying its joint density, is therefore at most
  $ 2^(\( D + .01 \) N + .002 N + O \( n \) - .48 L_0 N + O \( 1 \)) . $
  Choose $M_0$ to make the $O \( n \) \/ N$ term small. Because $L_0 gt.eq 100 \( D + 10 \)$,
    this is exponentially small, contradicting the mass $q_(*) \/ 2$. The claim follows.
  Discard the frequent events in a full-sum phase test. For fixed records,
    this is a restriction on $B$ alone once the $A$-offset record is fixed.
    The $B$-tuple point bound is now $2^(- \( t_B + .5 \) N)$; the $A$-tuple bound is $2^(- \( t_A - .01 \) N)$.
    Walsh on $\( t_A + t_B \) N$ bits gives $2^(- .245 N)$, before the $2^(.004 N)$ record count.
    Thus every phase with $S = { 1 \, 2 }$ has magnitude at most $delta + 2^(- Omega \( N \))$.
    Interchanging the units covers the cases with $R = { 1 \, 2 }$.
    Together with the singleton estimates, all nontrivial means are less than $.005$.
  All retained laws have relative mass at least
  #[#set math.equation(numbering: n => "(9.17)")
   $ delta_(upright("ph")) = frac(p_0 delta, 64 R_0) > 0 . $ <eq:tp-phase-retained-mass>]
  The large-cover span deletion leaves at least $p_0 \/ 2$; the tiny-cover restriction, transpose deletion,
    record restriction and zero/nonzero split retain at least $p_0 delta \/ \( 32 R_0 \)$ in total.
    This proves the stated, slightly smaller uniform bound. The lower bounds on $h$ depend on the fixed marginal
    caps after these early restrictions. Only after $h$ do we choose the thinning rate $rho$;
    the new full-sum estimate then requires $M_0$ large relative to $1 \/ rho$.
    No inverse mass depending on $n$ or on a numerical table is paid. ◻
]

#thm([Corollary 9.4.])[
  (A uniform phase compatibility margin).  #emph[On either retained law of 43,
    for each fixed $c in bb(F)_2$ and all sufficiently large $n$,
#[#set math.equation(numbering: n => "(9.18)")
 $ bb(P) { u_(B \, 1) \( Delta_A \) = u_(B \, 2) \( Delta_A \) = u_(A \, 1) \( Delta_B \) =
   u_(A \, 2) \( Delta_B \) = c } gt.eq 1 \/ 32 . $ <eq:tp-four-equal-phases>]

 Also $bb(P) { F \( A \, B \) + F \( B \, A \) = 0 } gt.eq .49$,
   and each single prescribed phase bit has probability at least $.49$.]
] <tp:phase-compatibility>

#proof[
  In alternative (i), Fourier inversion of the four bits gives every prescribed pattern probability at least
    $\( 1 - 15 dot.op .005 \) \/ 16 > 1 \/ 32$. The even-sum condition and each single-bit condition have
    probability at least $\( 1 - .005 \) \/ 2 > .49$. In alternative (ii),
    both full endpoint sums are zero identically. Among the sixteen Fourier characters,
    the four with even support in each endpoint pair therefore equal one.
    Their coefficients for the common pattern $\( c \, c \, c \, c \)$ are all one, for either value of $c$.
    Each of the other twelve characters contains a singleton and has mean $2^(- Omega \( N \))$.
    Thus the probability in (9.18) is $1 \/ 4 + O \( 2^(- Omega \( N \)) \)$.
    The remaining assertions follow from the same zero sums and singleton means. ◻
]

#thm([Lemma 9.5.])[
  (Injection on independent pairs).  #emph[Let $sigma_A \, sigma_B$ be two possibly different marked-unit laws,
    each with pins of total dimension at most $K$. Suppose all four mixed endpoint marginals are at most $Lambda
    pi$, where $Lambda$ is fixed before $h$. Draw $A tilde.op sigma_A$ and $B tilde.op sigma_B$ independently;
    the endpoints within either unit may be dependent. For every fixed $epsilon > 0$,
    choosing $h$ sufficiently large in terms of $K \, epsilon \,
    g$ makes the probability that the pair fails a small-table injection condition at most $epsilon$,
    for all sufficiently large $n$. This is an unconditional estimate,
    so its error can be subtracted from any independently established compatibility mass.]
] <lem:injection>

#proof[
  It suffices to treat one component, endpoint pair and sign, and then sum over at most $16 \| cal(E) \|$ tests.
    All copies of $A$ used below are drawn from $sigma_A$ independently of $B tilde.op sigma_B$.
    The argument uses only this independence and the separate marginal bounds,
    and does not require the two unit laws to coincide. Let $V_A$ be the image of the individual pinned primal
    space $D_(A \, e)^(+) ∩ cal(B)_i$, and let $H_B subset.eq
    bb(F)_2^h$ be the protected coefficient space at the opposite tested endpoint.
    Both have dimension at most $K$. Failure means that some $0 eq.not v in V_A$ has $Y_B^(sans(T)) v in H_B$.
    Both the pins and $H_B$ may depend on their entire units.
  Put $ell = floor.l N \/ \( 10 \( K + 1 \) \) floor.r$. The probability that an independent new individual primal
    span meets a fixed space of dimension at most $K ell$ is at most
  $ Lambda 2^(dim cal(B) + K ell - N + 1) = 2^(- Omega \( N \)) . $
  This uses only the unchanged primal marginal, and tests the whole primal span,
    so it is uniform over the adaptive pin choices. If a fixed $B$ has failure probability greater than $eta > 0$,
    successive independent draws $A_1 \, dots.h \, A_ell$ can each witness failure while the spaces $V_(A_j)$
    remain mutually independent, with conditional probability at least $c = eta \/ 2$ at every step.
    The probability of this complete test is at least $c^ell$.
  Conversely fix any such independent spaces. There are at most $2^(K ell)$ choices of one nonzero witness in
    each, and the chosen witnesses are independent. For iid $Y_B$ columns their transpose images are independent
    uniform elements of $bb(F)_2^h$. For a fixed $H_B$ of dimension at most $K$,
    the probability that all these images belong to it is at most $2^(- \( h - K \) ell)$.
    There are at most $\( K + 1 \) 2^(K h)$ possible subspaces $H_B$, independently of $n$.
    The original channel marginal comparison in 23 therefore bounds this event under $sans(P)_0$ by $C_(K \, h)
    2^(- \( h - 2 K \) ell)$. Here the tested list has length proportional to $N$;
    we use this absolute reference-law count, rather than the bounded-list rank assertion of 24.
  The endpoint bound against $pi$ and the absolute thinning density loss multiply this upper bound by $Lambda
    2^(epsilon_(upright("ch")) N)$. Fubini and the lower bound $c^ell$ give
  $ bb(P)_B { bb(P)_A \( upright("failure") divides B \) > eta } lt.eq
    C_(K \, h) Lambda 2^(- \( h - 2 K - log_2 \( 1 \/ c \) \) ell + epsilon_(upright("ch")) N) . $
  Take $h > 2 K + log_2 \( 1 \/ c \) + 30 \( K + 1 \)$, before choosing $epsilon_(upright("ch")) < 10^(- 4)$.
    The right side is exponentially small. The unconditional failure probability for this test is at most $eta +
    2^(- Omega \( N \))$. Choose $eta < epsilon \/ \( 32 \| cal(E) \| \)$, sum the tests,
    and then take $n$ sufficiently large. This proves the assertion. ◻
]

== 10 Preparation of the two-endpoint statuses <sec:preparation>

We work along a sequence of unit laws with endpoint marginals at most $M
  pi$ and projected pair density at most $2^(3000 g N) pi^2$, as in the first part of 25.
  A colour is an additional mark and may be randomized conditional on the unit.
  Passing to subsequences is allowed. By 24, the absolute joint density relative to $sans(P)_0^2$ has ample slack
  below $2^(D N)$. Apply 28, or 27 when there is no colour, and discard the exception in 26.
  This removes only $o \( 1 \)$ total mass.

All restrictions in this section act on the resulting #emph[pooled law], with the actual leaf weights.
  Although a colour is fixed on each leaf, no prediction or phase argument is applied separately to its normalized
  colour class. In particular the endpoint marginal bound depends on the total retained mass,
  not on the smallest colour mass or the number of colours.
  All effective spaces in the following definition are the first spaces $C_i^(upright("old"))$,
  with total pin dimension at most $K_1$. They will not be enlarged.

Let $"pr"$ forget the channel columns and retain the primal frames. The marginal fact used below is exactly

$ "pr"_(*) pi = "pr"_(*) sans(P)_0 . $

Thus a restriction of fixed positive pooled mass has endpoint law at most a fixed multiple of $pi$,
  and its primal projection is at most that same multiple of $"pr"_(*) sans(P)_0$.
  This does not assert a constant full-frame density relative to $sans(P)_0$.

For a tag $l$ and a diagonal bit $q$, let $Omega_(l \, q \, n)$ be the probability space of global plus and minus
  vector slots on the star of $l$, with the uniform law subject to paired diagonal $q$ in every component.
  Requiring its individual vectors to be nonzero changes this law by exponentially small total variation,
  which will be harmless.

#prodef([Definition 10.1.])[
  (Common prediction).  A prediction along a subsequence consists of common binary functions
  $ f_(i \, n) \( l \, q \, dot.op \) : Omega_(l \, q \, n) arrow.r bb(F)_2 \, wide i = 1 \, 2 \, $
  a set of units of mass at least $10^(- 6)$, and, on every unit in this set, choices
  $ lambda_i in C_i^(upright("old")) \, wide alpha_i in bb(F)_2 \, wide cal(E)_i subset.eq bb(F)_2^b \,
    quad \| cal(E)_i \| lt.eq B_(*) \, $
  such that the following uniform statement holds. There is $epsilon_n arrow.r 0$ for which, at both endpoints,
    at every label outside $cal(E)_i$, at every tag, and in every permitted flavor,
    a uniform parameter atom $x$ satisfies
  #[#set math.equation(numbering: n => "(10.1)")
   $ p_i \( x \) = T \( lambda_i \, x \) + alpha_i a \( x \) +
     f_(i \, n) \( l \, q \, "key" \( x \) \) $ <eq:prediction>]
  except with probability at most $epsilon_n$. Here $p_i = u_(i') U_i$, where $i'$ is the other endpoint.
    The functions $f_(i \, n)$ are the same for all retained units.
    The marks $lambda_i \, alpha_i \, cal(E)_i$ may depend on the whole unit.
] <def:prediction>

The errors in 46 refer to uniform parameters in each flavor, before conditioning on a tester bit.
  Conditioning on a possible fixed tester value only multiplies the error by a fixed constant.
  There are finitely many labels, tags and flavors, with their numbers fixed independently of $n$.

If a prediction exists, retain its marked population and pigeonhole the values of the two $alpha_i$’s, of

$ c = a \( lambda_1 \) + a \( lambda_2 \) \, $

and of the indicator $Delta = 0$. This loses a factor at most $16$,
  leaving mass at least $6.25 dot.op 10^(- 8) > 10^(- 12)$.
  Pass to a subsequence on which every reference error probability of every binary combination of $f_1 \, f_2 \,
  q$ has a limit, for each tag and bit. This requires only finitely many comparisons.

For sequences of common functions, write $f tilde.eq g$ if their disagreement probability tends to zero on every
  $Omega_(l \, q \, n)$, and identify sequences related in this way.
  Then quotient their binary vector space by the span of the common function with value $q$.
  Denote the resulting class by $\[ f \]$, and put

#[#set math.equation(numbering: n => "(10.2)")
 $ d_i = 1 + alpha_i \, wide e_i = \( d_i \, \[ f_i \] \) . $ <eq:status-class>]

The pairs $e_i$ are #emph[prediction classes]; a query’s numerical unary status records the scalar outcomes
  specified in 8. The support of this pair of statuses is ${ i : e_i eq.not 0 }$.
  These statuses are common to all retained units, although the marked $lambda_i$’s can vary.

#thm([Lemma 10.2.])[
  (Exactification of empty status).  #emph[If $e_1 = e_2 = 0$, deleting $o \( 1 \)$ unit mass makes
#[#set math.equation(numbering: n => "(10.3)")
 $ p_i = T \( lambda_i \, dot.op \) + a quad upright("on all of ") cal(X) \, wide i = 1 \, 2 \, $ <eq:exact-prediction>]

 an exact identity on every retained unit. The same conclusion holds on any marked population of fixed positive
   mass satisfying (10.1) with $alpha_i = 1$ and $f_i tilde.eq gamma_i q$;
   the threshold $10^(- 6)$ in 46 is not needed here.]
] <lem:empty-status>

#proof[
  Empty status gives $alpha_i = 1$ and $f_i tilde.eq gamma_i q$ for a fixed $gamma_i in bb(F)_2$.
    Restriction to any fixed positive population only changes the primal marginal bound by a fixed factor,
    which is all the proof uses. At any fixed tag, label and parameter point,
    the key depends only on the primal frames. Under $pi$ its law is therefore the same as under $sans(P)_0$:
    the single-key reference up to an exponentially small injectivity error, by 23.
    The bounded #emph[primal] marginal density transfers the reference disagreement of $f_i$ and $gamma_i
    q$ to an average $o \( 1 \)$ parameter error on the marked population.
    No channel coordinate is tested in this comparison. There are only finitely many endpoint,
    tag and label choices. Markov’s inequality therefore allows deletion of $o \( 1 \)$ unit mass so that this
    error tends to zero uniformly on the remaining units and choices.
    Combining it with (10.1) gives, at every nonexceptional label,
  $ p_i \( x \) + T \( lambda_i \, x \) + a \( x \) + gamma_i q \( x \) = 0 $
  with parameter error tending to zero in the generic flavor.
  For fixed label and tag the left side is a Boolean polynomial of base degree at most two.
    A nonzero Boolean polynomial of degree at most $k$ has nonzero probability at least $2^(- k)$ under uniform
    bits. For completeness, this follows by induction: choose a coordinate with a nonzero derivative;
    the derivative has degree at most $k - 1$, and whenever it is nonzero at least one of the two values on that
    coordinate is nonzero. The constant nonzero polynomial is the initial case.
    Thus the displayed relation, once its error is below $1 \/ 4$, is exact for every allowed base value.
  For any fixed allowed base value its dependence on the selector has degree at most $2 j_(*)$.
    It vanishes at every selector outside a set of size at most $B_(*)$.
    The choice of $b$ gives $B_(*) < 2^(b - 2 j_(*))$, so the same polynomial bound forces it to vanish at the
    excluded labels also.
  Use one shared-only base point with $eta_S = 1$, the same at every tag.
    The sum of its $g$ star atoms is zero in the cut space. Summing the exact relation over these atoms gives $0 =
    gamma_i g = gamma_i$, because $g$ is odd and the first three terms are linear on $cal(X)$.
    Consequently $gamma_i = 0$. The point atoms span the cut space by its definition, proving (10.3). ◻
]

=== 10.1 A comparison for affine parameter slices <a-comparison-for-affine-parameter-slices>

The next elementary comparison is stated separately because the global predictors in 46 need not be polynomial.
  All tests in it are common functions of the displayed image columns;
  they are not arbitrary orientation-dependent tests.

#thm([Lemma 10.3.])[
  (Affine-slice comparison).  #emph[Fix a selector, a flavor,
    and a fixed number $d$ of affine parameter variables. Write a random affine coefficient map as
$ C \( t \, u \) = p_s ⊗ \( t \, z_0 t + L u \) \, wide \( t \, u \) in bb(F)_2 xor bb(F)_2^d . $

 Assume the flavor retains an $n$-bit $Z$-block absent from $E$.
   Suppose we condition the affine coefficients on $C^(sans(T)) E C = G$, where $G$ is fixed,
   this event has probability at least a fixed $beta > 0$, and it depends on no $Z$ coefficient.
   Let $cal(T)_n$ be any common test of absolute value at most one on the image column arrays
   $\( P_e C \, Q_e C \)_e$, using a fixed set of components.
   Its empirical average over the conditioned affine coefficients,
   with the primal frame sampled from $"pr"_(*) sans(P)_0 = "pr"_(*) pi$, has variance
$ O \( 2^(- N \/ 2) + 2^(2 d + 1 - n) \) $

 around its mean under uniform injective image column arrays with internal Gram $G$.
   The constants may depend on the fixed column counts and $beta$,
   but the estimate is uniform over the tests $cal(T)_n$.]
] <lem:synthetic-slice>

#proof[
  The $Z$-coefficients remain independent uniform bits after the conditioning.
    The columns of $C$ are independent except with probability $O \( 2^(d - n) \)$.
    For two independent conditioned maps $C \, C'$, a relation
  $ C \( a \, u \) + C' \( a' \, u' \) = 0 $
  has $a = a'$, by its constant coordinate. Its $Z$-part is
  $ a \( z_0 + z'_0 \) + L_Z u + L'_Z u' = 0 . $
  The matrix $\[ z_0 + z'_0 \, L_Z \, L'_Z \]$ is a uniform $n times \( 2 d + 1 \)$ bit matrix.
    A union over its nonzero coefficient vectors bounds the failure of combined independence by
    $\( 2^(2 d + 1) - 1 \) 2^(- n)$. In particular, the two translation columns do not share a forced nominal
    constant direction.
  For fixed independent nominal columns, the restricted-image transitivity in 23 gives the uniform injective law
    with its specified Gram. One batch consequently has the claimed reference law,
    independently of the remaining nominal coefficients. For two batches,
    compared with two independent copies of this reference law,
    the actual images have finitely many additional mutual Gram entries prescribed.
    Joint injectivity contributes only $O \( 2^(- N + O \( d \)) \)$ to the comparison:
    under independent uniform vector slots, a dependence among a fixed number of columns has this probability,
    and the fixed Gram conditioning has bounded reciprocal probability.
  Expand the mutual Gram indicator in binary characters, collapsing any repeated identical entries.
    A nonzero character has a nonzero coefficient matrix on at least one interaction between the two batches.
    More explicitly the coefficient blocks pairing first-batch plus vectors with second-batch minus vectors and
    first-batch minus vectors with second-batch plus vectors give cross-batch bit rank
    $N \( "rank" A + "rank" B \) gt.eq N$. The internal Gram constraints, individual injectivity indicators,
    and the two arbitrary tests are separate bounded weights on the two batches;
    their normalization factors are fixed. 30 bounds every nontrivial character contribution by
    $O \( 2^(- N \/ 2) \)$. The same computation without the tests gives the normalization of the mutual Gram
    conditioning. There are only a fixed number of characters.
    Thus the conditional two-batch product expectation differs from the product of the one-batch expectations by
    $O \( 2^(- N \/ 2) \)$, uniformly over the nominal mutual Gram values.
  Averaging the coefficients, and including the probability of nominal dependence,
    proves the asserted second-moment estimate. The one-batch mean differs from the reference mean only by the
    already bounded nominal-dependence error. ◻
]

#thm([Lemma 10.4.])[
  (Equal coefficients when the tensor difference vanishes).  #emph[On a predicted branch with $Delta =
    0$ throughout, $alpha_1 = alpha_2$.]
] <lem:zero-delta>

#proof[
  Suppose otherwise. By 26, the two canonical sparse representations $w^(\( i \)) = \( w_l^(\( i \)) \)_l$ of the
    marked $lambda_i$’s have the same value of $chi_(*)$. Each has at most $4 D \/ g$ nonzero tag entries.
    As $alpha_1 eq.not alpha_2$, on every unit exactly one endpoint has $chi_(*) \( w^(\( i \)) \) + alpha_i = 1$.
    Fix an endpoint $i$ on a positive fraction of the units. Pigeonhole the set
  $ T_0 = { t : eta_S \( w_t^(\( i \)) \) = 1 } \, wide \| T_0 \| lt.eq 4 D \/ g \, $
  and choose a single selector outside the stored exceptions on a positive fraction of this remaining population.
    The latter is possible by averaging over selectors, since $B_(*) < 2^(b - 1)$.
    All these restrictions have fixed positive mass in $n$; their endpoint primal marginal is at most $Lambda_0
    "pr"_(*) sans(P)_0$ for a fixed $Lambda_0$. No restriction made solely for this contradiction will be used
    later to choose a channel-size threshold.
  At each tag $l$, use the pure flavor retaining exactly the allowed $O_(d \, t)$ blocks with $t in.not T_0$,
    setting all $S$ bits to zero and retaining the $\# \, Z$ blocks.
    For a pure tag atom, $a \( x \) = q \( x \)$ and every $b_t \( x \) = 0$.
    The coefficient of its tester $eta_(d \, t)$ in $T^0 \( lambda_i \, x \) + alpha_i a \( x \)$ is
  $ a \( lambda_i \) + b_t \( lambda_i \) + alpha_i = chi_(*) \( w^(\( i \)) \) + eta_S \( w_t^(\( i \)) \) +
    alpha_i = 1 $
  on the retained $t$’s. Hence (10.1) gives
  #[#set math.equation(numbering: n => "(10.4)")
   $ f_i \( l \, q \, "key" \( x \) \) + q = p_i \( x \) + T^1 \( lambda_i \, x \) $ <eq:pure-prediction>]
  with uniform $o \( 1 \)$ parameter error.
  The right side of (10.4) is a sum of at most
  #[#set math.equation(numbering: n => "(10.5)")
   $ s_1 = \( g - 1 \) \( h + 2 J K_1 \) $ <eq:synthetic-product-count>]
  products of affine functions of the base variables. Indeed $p_i$ contributes at most $h$ products in each of the
    $g - 1$ star components. Factoring the old $lambda_i$’s, whose total component rank is at most $K_1$,
    gives at most $2 J \( g - 1 \) K_1$ products for $T^1$. The selected pure tester retains at least
  #[#set math.equation(numbering: n => "(10.6)")
   $ frac(g - 1, 2) \( g - 4 D \/ g \) r_0 > 2 s_1 + 1 $ <eq:synthetic-tester-room>]
  disjoint ordered bit pairs. To check the last inequality, use $D = 4000 g$ and $h = 1000 r_0$.
    After division by $\( g - 1 \) r_0$, the left side is $\( g - 16000 \) \/
    2$ and the right side is at most $2000 + 4 J K_1 \/ r_0 + o \( 1 \)$.
    The fixed value $g = 10^9 + 1$ and the later choice of sufficiently large $r_0$ make the inequality hold.
  Put $m_1 = 2 g s_1 + 1$, and introduce synthetic variables $xi \, upsilon in bb(F)_2^(m_1)$ and
  $ q_(*) = sum_(j = 1)^(m_1) xi_j upsilon_j . $
  For every component independently, choose uniform injective maps of the affine coefficient columns
    $\( 1 \, xi \, upsilon \)$ into the plus and minus ambient spaces with full paired Gram
  $ chevron.l upright("plus") \( 1 \, xi \, upsilon \) \, upright("minus") \( 1 \, xi' \, upsilon' \) chevron.r =
    sum_j xi_j upsilon'_j . $
  Such maps exist for large $n$, since the number of columns is fixed.
    Their point evaluations form one synthetic array of global component keys;
    all tag stars use the corresponding entries of this same array.
  We next prove two properties of this array with probability tending to one.
  #emph[Shared-only parity.] In a local shared-only test use the fixed selector and the same point at every tag.
    The sum of the tag atoms is zero in $cal(X)$. Summing (10.1) therefore gives
  $ sum_l f_i \( l \, q \, "key"_l \) = 0 $
  except on $o \( 1 \)$ parameter mass, uniformly on the retained units.
    Both tester bits have probability at least $1 \/ 4$: the bias of the sum of $r_0$ independent bit-pair
    products is $2^(- r_0)$.
  Apply 48 with no affine variables ($d = 0$), the shared-only flavor, and internal Gram $\( q \)$.
    The Gram event depends only on the fixed tester coordinates and has probability at least $1 \/ 4$.
    The common test is the displayed parity predicate of the global keys in all components.
    Its empirical frequency under the primal reference law concentrates at its global reference probability.
    The endpoint primal marginal bound $Lambda_0 "pr"_(*) sans(P)_0$, and its frequency $1 -
    o \( 1 \)$ on the retained population, force that reference probability to tend to one.
    At every point of the synthetic array the point-key marginal is this reference,
    up to the exponentially small nonzero-vector conditioning. There are a fixed finite number of points.
    Thus, with probability tending to one,
  #[#set math.equation(numbering: n => "(10.7)")
   $ sum_l f_i \( l \, q_(*) \, "key"_l \) = 0 quad upright("at every synthetic point") . $ <eq:synthetic-parity>]
  #emph[Affine-product representations on every small slice.] Fix sets $I \, J subset.eq { 1 \, dots.h \, m_1 }$,
    each of size at most $2 s_1 + 1$, and set all $xi$ and $upsilon$ coordinates outside $I \, J$, respectively,
    to zero. There are $d = \| I \| + \| J \| lt.eq 4 s_1 + 2$ remaining variables.
    At a given tag, map this slice into its selected local pure flavor by independent uniform affine functions for
    every retained base bit, including independent translations.
    Condition their full oriented Gram to equal the synthetic slice Gram.
  This conditioning has a fixed positive probability. At the fixed selector $E^(\#)$ vanishes on pairs.
    There are at most $2 s_1 + 1$ active terms $xi_j upsilon'_j$ in the target Gram,
    so (10.6) lets us route them into distinct retained ordered tester pairs,
    and set all other tester affine coefficients to zero. If $t_0$ scalar tester coordinates are prescribed,
    this assignment alone has probability $2^(- t_0 \( d + 1 \)) > 0$, independent of $n$.
    The $Z$-affine coefficients remain iid. At every fixed slice point the unconditioned base input is uniform;
    after conditioning, its density is bounded by the fixed reciprocal Gram probability.
  Consequently (10.4) holds simultaneously at all points of the slice except on $o \( 1 \)$ of these
    parametrizations, uniformly on the marked population. Its right side pulls back to a sum of at most $s_1$
    affine products. Consider only the event
  #quote(block: true)[
    the array of values of the common function $f_i + q_(*)$ on this specified slice admits such an affine-product
      representation.
  ]
  This is a common test of the image column arrays. It contains neither the mark $lambda_i$ nor any coefficients
    of the unit-specific representation. Its empirical success probability is $1 -
    o \( 1 \)$ on the retained population. 48 and the bounded primal marginal therefore force its probability
    under the synthetic slice law to tend to one. That law is also the marginal of the corresponding slice in the
    full synthetic array, by restricted frame transitivity.
  There are only finitely many choices of tag and slice, with the number fixed independently of $n$.
    We may therefore require all these events and (10.7) simultaneously.
    Notice that we embedded only the small slices locally; no local realization of the entire synthetic tester was
    required.
  Choose one synthetic array on which all these properties hold, and define
  $ F_l \( xi \, upsilon \) = f_i \( l \, q_(*) \, "key"_l \) + q_(*) . $
  For each tag define its Boolean cross-coefficient matrix by
  $ C_l \[ j \, k \] = F_l \( e_j \, e_k \) + F_l \( e_j \, 0 \) + F_l \( 0 \, e_k \) + F_l \( 0 \, 0 \) . $
  On a coordinate slice where $F_l$ is a sum of $s_1$ affine products,
    this is the matrix of $xi_j upsilon_k$ coefficients. One affine product contributes a sum of two rank-one
    matrices to this cross matrix. Every $\( 2 s_1 + 1 \)$-square minor of $C_l$ is therefore singular,
    so $"rank" C_l lt.eq 2 s_1$. On the other hand (10.7), together with odd $g$, gives $sum_l F_l = q_(*)$ and hence
  $ sum_l C_l = I_(m_1) . $
  Rank subadditivity would imply $m_1 lt.eq sum_l "rank" C_l lt.eq 2 g s_1$, contradicting $m_1 = 2 g s_1 + 1$.
    This proves $alpha_1 = alpha_2$. ◻
]

=== 10.2 Compatible tables and the prepared alternatives <compatible-tables-and-the-prepared-alternatives>

For an admissible small table, a contraction on a marked $lambda_i$ means its table contraction.
  This is well defined because $lambda_i in C_i^(upright("old"))$ and all first effective spaces are retained.
  We use the following phase requirements:

#[#set math.equation(numbering: n => "(10.8)")
 $ u_(B \, S^compose) \( Delta_A \) + u_(A \, S^compose) \( Delta_B \) = \| S^compose \| d \, &
   upright("if the nonzero ") e_i upright(" all coincide") \,\
S^compose = { i : e_i eq.not 0 } eq.not diameter \, quad d = upright("their first bit") \;\
u_(B \, j) \( Delta_A \) = c \, quad u_(A \, i) \( Delta_B \) =
  c quad \( i \, j = 1 \, 2 \) \, & upright("if ") e_1 = e_2 = 0 . $ <eq:phase-compatibility>]

In all other status cases there is no additional phase condition.
  The four equations in the second line all use the #emph[same] previously fixed bit $c = a \( lambda_1 \) +
  a \( lambda_2 \)$. For a candidate table these contractions are computed from its entries and the numerical
  coordinates of the marks.

#thm([Proposition 10.5.])[
  (Status preparation).  #emph[There are constants $delta_(*) \, c_(*) > 0$,
    fixed before the selector and channel sizes, with the following property.
    Along a subsequence, the original pooled unit law has a restriction of mass at least $delta_(*)$ whose first
    pin dimension is at most $K_1$ and whose normalized leaves satisfy (5.11).
    One of the following descriptions applies.]
  + #emph[There is no prediction as in 46 on the first pooled law before the final negligible leaf trimming.
    For independent draws from the prepared law, the probability of an admissible injecting actual small table is
    greater than $.99$.]
  + #emph[A prediction with fixed $alpha_i \, c$ and common classes $e_i$ is retained.
    Its marks and exceptions are preserved, and (10.1) has uniform $o \( 1 \)$ error on every retained unit.
    If both classes vanish, (10.3) is exact on every unit. For independent draws from the prepared law,
    the probability of an admissible injecting actual table satisfying (10.8) is at least $1 \/ 64$.]
  #emph[In particular the corresponding successful pair event, measured in two draws from the original pooled law,
    has mass at least $c_(*)$. One may take
#[#set math.equation(numbering: n => "(10.9)")
 $ delta_(*) = frac(10^(- 6) delta_(upright("ph")), 64) \, wide c_(*) = delta_(*)^2 / 64 \, wide
   0 < eta_(upright("col")) < c_(*) / 4 \, $ <eq:preparation-early-margins>]

 where $0 < delta_(upright("ph")) lt.eq 1$ is the early retained-mass constant in 43.
   The colour bound in (10.9) can be chosen using the initial $M$ and early geometric constants only;
   the marginal constant $L$ of the second distribution test does not enter it.]
  #emph[After forgetting colour and other marks, the prepared law $sigma'$ satisfies
#[#set math.equation(numbering: n => "(10.10)")
 $ sigma'_i lt.eq M / delta_(*) pi quad \( i = 1 \, 2 \) \, wide sigma' lt.eq
   2^(\( D + o \( 1 \) \) N) sans(P)_0^2 . $ <eq:prepared-marginals>]

 The endpoint primal marginals consequently have the same constant bound relative to $"pr"_(*) sans(P)_0$.
   Every normalized leaf has joint density at most $2^(O \( N \)) sans(P)_0^2$.
   The successful table event is detected by a finite list of numerical tables and separate unary orientation
   flags, together with leaf-pair tests. The size of this list is fixed in $n$, but need not be early.]
] <prop:status-preparation>

#proof[
  Consider first the pooled law after the first peeling and intersection deletion.
    If no prediction exists on any subsequence, apply 45 to independent draws with no additional acceptance
    condition. Its failure tolerance can be chosen below $1 \/ 128$,
    so the success probability is greater than $.99$ for large $n$. The actual table is automatically admissible.
    Later leaf trimming removes only $o \( 1 \)$ mass. A prediction on the trimmed law with mass bounded strictly
    above $10^(- 6)$ would give one on the preceding law, by multiplying its mass by the retained proportion and
    preserving its common functions and unitwise error. This is the form of the no-prediction conclusion used below.
  Otherwise retain a prediction population and pigeonhole $alpha_1 \, alpha_2 \, c$ and the indicator $Delta = 0$,
    as above. Its relative mass is at least $10^(- 6) \/ 16$.
    If the statuses are empty, perform the $o \( 1 \)$ deletion in 47.
    All subsequent restrictions then preserve the exact identities (10.3).
  Suppose $Delta = 0$. By 49, $alpha_1 = alpha_2$. If precisely one status is active, its first bit cannot be $1$:
    that would give $alpha_i = 0$ there and $alpha_(i') = 1$ at the inactive endpoint.
    Thus the right side of the first line of (10.8) is zero. With two equal active statuses it is also zero,
    because $2 d = 0$ over $bb(F)_2$. Every left side vanishes when $Delta = 0$,
    so all these conditions hold automatically.
  If both statuses are empty and $c = 1$, then $U_1 lambda_1 = U_2 lambda_2$,
    while the two identities (10.3) give the affine-gradient equations for an internal hole and $c =
    1$ gives its unequal $a$-values. This contradicts the assumption that the pair is a unit.
    Consequently $c = 0$, and all four required phase bits vanish. Thus compatibility is automatic also in this case.
  Suppose next that $Delta eq.not 0$. Apply 43 to the pooled marked law.
    It retains at least the early fraction $delta_(upright("ph"))$, and gives either full mixing or the identity
  $ F \( A \, B \) = u_(B \, { 1 \, 2 }) \( Delta_A \) = 0 quad upright("for every two retained units ") A \, B \, $
  together with exponentially small singleton character means. For clarity, write the four phase bits as
  $ X_j = u_(B \, j) \( Delta_A \) \, wide Y_i = u_(A \, i) \( Delta_B \) \, wide i \, j in { 1 \, 2 } . $
  Full mixing bounds the absolute mean of every nonconstant character of $\( X_1 \, X_2 \, Y_1 \, Y_2 \)$ by
    $.005$. Binary Fourier inversion therefore gives every prescribed four-bit pattern probability at least
  $ frac(1 - 15 \( .005 \), 16) > 1 / 32 . $
  Each condition in (10.8) admits such a pattern. In particular the empty-status pattern is exactly
    $\( c \, c \, c \, c \)$.
  In the other alternative, $X_1 = X_2$ and $Y_1 = Y_2$ identically.
    If there is one active status, the required bit is $X_i + Y_i = d$;
    its nontrivial character has singleton support in both units, so its probability is $1 \/ 2 + o \( 1 \)$.
    If two active statuses coincide, the condition is $F \( A \, B \) + F \( B \, A \) = 0$,
    which holds identically. With empty statuses put $X = X_1 = X_2$ and $Y = Y_1 = Y_2$.
    The characters of $X \, Y \, X + Y$ all have singleton representatives. Hence
  $ bb(P) { X_1 = X_2 = Y_1 = Y_2 = c } & = 1 /
    4 (1 + \( - 1 \)^c bb(E) \( - 1 \)^X + \( - 1 \)^c bb(E) \( - 1 \)^Y + bb(E) \( - 1 \)^(X + Y))\
 & = 1 / 4 + o \( 1 \) > 1 / 32 . $
  This explicitly requires the same fixed $c$ on both sides. The remaining status cases impose no condition.
    Thus all branches have conditional compatibility probability at least $1 \/ 32$ for large $n$, in agreement with 44.
  Apply the unconditional form of 45 to this retained law, with failure below $1 \/ 128$.
    The probability of a compatible injecting actual table is then at least
  $ 1 / 32 - 1 / 128 - o \( 1 \) > 1 / 64 . $
  This is subtraction of exceptional mass; it makes no independence assumption about injection and compatibility.
    The injection estimate uses the endpoint bound relative to $pi$,
    together with the unchanged primal marginal and the allowed thinning loss in the full-frame estimates.
    Its tolerance is fixed before $h$.
  We now justify the claimed leaf estimates without adding any pins.
    Let $w_lambda$ be the original actual weights of the first leaves,
    and let $q_lambda$ be the fraction of leaf $lambda$ retained by all restrictions just made.
    Discard the retained parts with $q_lambda < 2^(- zeta N)$. Their total unnormalized mass is at most
  $ sum_(lambda : q_lambda < 2^(- zeta N)) w_lambda q_lambda lt.eq 2^(- zeta N) . $
  On each remaining leaf, division by $q_lambda$ weakens (5.10) to
  $ 2^(zeta N) 2^(- \( 1 - zeta \) t N) lt.eq 2^(- \( 1 - 2 zeta \) t N) wide \( t gt.eq 1 \) \, $
  as required. Its joint density gains at most $2^(zeta N)$ and remains $2^(O \( N \)) sans(P)_0^2$.
    The pin spaces and all old marks are unchanged. This exponentially small deletion changes the successful pair
    probability by $o \( 1 \)$, already allowed above.
  The first peeling loses $o \( 1 \)$ mass. On a predicted branch,
    the finite initial selection costs at most $16 dot.op 10^6$,
    and the phase restriction costs at most $1 \/ delta_(upright("ph"))$.
    All further losses tend to zero; for large $n$ their combined retained factor, including first peeling,
    is at least $1 \/ 4$. This proves the unit-mass lower bound $delta_(*)$ in (10.9).
    The no-prediction branch retains $1 - o \( 1 \)$ mass and satisfies the same lower bound.
    Multiplying the conditional pair-success bound by $delta_(*)^2$ proves the original-scale bound $c_(*)$.
    The density statements follow by dividing the initial bounds by the retained unit mass and using (5.6).
    All marginal constants required by the phase and injection steps are fixed in advance,
    for example below $2 M \/ delta_(*)$, so their channel-size thresholds can be imposed after these early
    margins have been selected.
  Finally, every numerical table has bounded coordinate dimensions.
    The marked tensors are recorded by their coordinates in the first effective bases,
    and the exception sets have bounded descriptions. For a fixed leaf pair and a fixed numerical option,
    the two admissibility conditions are separate unary orientation flags,
    since the pin images are fixed on each leaf. Fixing numerical mark coordinates is also a unary flag.
    The phase requirements then depend only on the table entries and those coordinates.
    An actual successful table supplies at least one successful option in this finite list.
    This proves the asserted finite-data form without selecting one table during preparation or conditioning the
    two draws jointly on table success. ◻
]

#thm([Corollary 10.6.])[
  (Removing equal colours).  #emph[Suppose the original colour masses are $p_gamma lt.eq eta_(upright("col"))$.
    The successful prepared pair event of 50, with the further requirement that its two colours differ,
    has mass at least $c_(*) - eta_(upright("col")) > 3 c_(*) \/ 4$ in the original pooled law.]
] <tp:preparation-colours>

#proof[
  Two independent original draws have equal colours with probability
  $ sum_gamma p_gamma^2 lt.eq eta_(upright("col")) sum_gamma p_gamma = eta_(upright("col")) . $
  Subtract this upper bound from the original-scale successful mass $c_(*)$.
    Equivalently, in a restriction of mass $delta$, the equal-colour probability is at most
    $eta_(upright("col")) \/ delta^2$. This calculation applies also to randomized colours,
    which are simply part of the original marked probability space.
    It uses actual colour probabilities and imposes no lower bound on them. ◻
]

#prodef([Remark 10.7.])[
  (No feedback from later accuracies).  The margins $delta_(*) \, c_(*)$, the choice of $eta_(upright("col"))$,
    and the injection tolerance are fixed before $h$. At this stage success means that some numerical table
    passes. The later choice of one option from a finite list may have a much smaller mass depending on $h$,
    which is irrelevant to the earlier injection estimate. The errors in the affine-slice comparison and in
    subsequent fixed-test limits are handled by increasing $n$; their slice counts,
    partitions and flag thresholds do not change the channel size or pin budget.
    Only the first peeling has been used throughout.
] <rem:preparation-accuracies>

== 11 Histogram and parameter estimates <sec:histograms>

We prepare the estimates needed to pass successful queries to a common limit.
  Histogram control gives uniform integrability and finite nets within each leaf.
  Typicality compares prescribed common tests with their raw reference averages,
  binary mixing controls the specified parameter constraints,
  and unary positivity supplies the base-coordinate choices used in 14.

All construction parameters, including $M_0$, are fixed throughout this section, and $N = M_0 n$.
  Constants in estimates may depend on those parameters. A bounded number always means a number bounded
  independently of $n$. In particular, the numbers of tags, labels, coordinates in a small table,
  and positions in a query are bounded in this sense.

=== 11.1 Query measures and the distinction between tests and flags <query-measures-and-the-distinction-between-tests-and-flags>

A position specifies an endpoint of a unit, a tag $l$, a label $s$, and one of the flavors from 6.
  Its parameter is a uniform allowed base input. We may condition this input on a possible value of $q$,
  or on a feasible tester summary. The probability of any such fixed conditioning is bounded below by a positive
  constant. The $Z$ block remains uniform and independent of the other input coordinates.
  The parameters of different positions are independent, even when some positions have the same label.
  At a fixed orientation $O$, the key at position $j$ is denoted by $K_j \( O \, z_j \)$.
  A query consists of a fixed bounded list of positions and their fresh parameters.
  The key uses only the primal maps $P_e \, Q_e$. Write $"pr" \( O \)$ for the tuple of those maps,
  with both endpoints included when $O$ is a unit. Forgetting the channel maps and any auxiliary marks in a law
  will always mean this projection.

For a position of tag $l$ and diagonal value $q$, let $Omega_(l \, q \, n)$ be the uniform law on its global
  vector slots, subject to the prescribed plus–minus diagonal $q$ at each component of its star. For a query, write

$ overline(Omega)_n = ⨂_j Omega_(l_j \, q_j \, n) . $

Let $omega_n$ instead be uniform on all its vector slots without any Gram conditions.
  Finally, $nu_n$ is uniform on $cal(K)_n$, the set obtained by imposing all the individual diagonals and all the
  off-position Gram zeros required in 8. Each of these bounded lists of Gram conditions has probability bounded
  below under $omega_n$.

We will use three different kinds of assertions.

+ A #emph[common key test] is a prescribed function of global keys.
  It may depend on $n$ and on the law under consideration, but it is not chosen using the particular orientation
  being queried.
+ A #emph[common input-and-key test] may also use the nominal parameters.
  The concentration result below applies to these more general tests.
  The positivity result for basis statuses applies only to common key tests.
+ A histogram #emph[flag] is any one of a fixed bounded list of bits depending on an orientation and its query
  parameters. The histogram compactness result permits arbitrary filters of the orientation and these flags.
  In particular a flag may use all channel maps; the bits $p_i$ used later are such flags.
  Later successful queries use a narrower class: products of unary status requirements,
  the specified Gram and $L \, R$ constraints, and an additional orientation-only filter.
  The product comparison in 12 is stated for that narrower class.

All filtered measures in this section are subprobability measures.
  We do not divide them by the probabilities of their filters.
  Colours and law types may be retained as finite marks on the orientations and on the leaves.
  The number of their possible values is fixed before $n$ grows.
  Neither a mark nor a channel-dependent flag becomes a common key test merely by being recorded.

=== 11.2 Finite Gram comparisons <finite-gram-comparisons>

We first record the counting and Fourier facts used several times below.

#thm([Lemma 11.1.])[
  (Gram normalization).  #emph[Let $a$ plus slots and $b$ minus slots in one ambient component be independent
    uniform vectors, and prescribe their entire $a$ by $b$ Gram matrix.
    If $a + b lt.eq N \/ 2$, the probability of that prescription together with injectivity in each mode is
$ 2^(- a b) #scale(x: 120%, y: 120%)[\(] 1 + O \( 2^(- N + a + b) \) #scale(x: 120%, y: 120%)[\)] \, $

 uniformly in the prescribed matrix. The same statement holds for a fixed collection of independent
   endpoint/component groups, with the sum of their Gram-bit counts in place of $a
   b$ and a fixed factor in the error bound. In particular, for a bounded number of slots all relevant Gram
   normalizations and their ratios are bounded above and below by positive constants, uniformly in the nominal inputs.]
] <lem:histogram-gram-normalization>

#proof[
  The plus slots are linearly independent with probability $product_(j = 0)^(a - 1) \( 1 - 2^(j - N) \) = 1 -
    O \( 2^(- N + a) \)$. Given such plus slots, each minus slot has probability $2^(- a)$ of satisfying its
    prescribed values. Conditional on those values the minus slots are independent uniform vectors in specified
    affine cosets of one common annihilator of dimension $N - a$.
    For any nonzero combination of the $b$ slots, the resulting vector is uniform in an affine coset of that
    annihilator. Its probability of being zero is at most $2^(- \( N - a \))$.
    A union bound over fewer than $2^b$ combinations proves the claimed injectivity error.
    Multiplication over independent groups gives the last assertion. ◻
]

When the number of slots is bounded, dropping an injectivity condition in a normalized Gram law changes a bounded
  integral by $O \( 2^(- N + O \( 1 \)) \)$. For the growing batches used below we will instead retain injectivity
  in the denominator and drop it only from a nonnegative numerator;
  this avoids paying an inappropriate additive error before a density bound.

#thm([Lemma 11.2.])[
  (Comparison of two bounded batches).  #emph[Consider two bounded batches of prescribed nominal columns in one
    raw endpoint, or in two independent raw endpoints. Suppose their union is nominally independent in every
    endpoint, component, and mode. Let $F$ and $G$ be bounded functions of the separate image batches,
    respectively. The difference between their joint raw expectation and the product of their separate raw
    expectations is
$ O #scale(x: 120%, y: 120%)[\(] lr(bar.v.double F bar.v.double)_oo lr(bar.v.double G bar.v.double)_oo
  2^(- N \/ 2) #scale(x: 120%, y: 120%)[\)] . $

 The bound is uniform in the independent nominal columns and all their prescribed same-endpoint Gram entries.
   The functions may also depend on the fixed nominal inputs determining their own batch.]
] <lem:histogram-batch-comparison>

#proof[
  By 23, the image laws are uniform laws on the indicated independent vectors with their same-endpoint Gram
    entries prescribed. Relative to the product of the two separate batch laws,
    the union law adds only the mutual Gram entries and joint injectivity.
    The latter may be omitted at an exponentially small error because the number of columns is bounded.
  Expand the indicators of the mutual Gram entries into binary characters.
    Their values, which are determined by the nominal inputs, enter this expansion only as signs.
    In a nontrivial character, after identical descriptions of an unordered slot pair have been collapsed,
    the coefficient matrix between the two batches is nonzero. Its bit rank is at least $N$.
    The individual batch Gram densities can be included in the two separate bounded weights.
    30 bounds this character by a constant times $lr(bar.v.double F bar.v.double)_oo
    lr(bar.v.double G bar.v.double)_oo 2^(- N \/ 2)$. There are only boundedly many characters.
    Applying the same expansion with $F = G = 1$ controls the normalization,
    while 53 bounds all internal normalization factors. The zero character gives the product of separate expectations. ◻
]

#thm([Lemma 11.3.])[
  (Product tests under the key reference).  #emph[For a fixed query shape and arbitrary global single-key
    functions $f_(j \, n)$ with $\| f_(j \, n) \| lt.eq 1$,
$ integral product_j f_(j \, n) \( k_j \) thin d nu_n = product_j integral f_(j \, n) thin d
  Omega_(l_j \, q_j \, n) + O \( 2^(- N \/ 2) \) . $

 The bound is uniform over the functions.]
] <lem:reference-product>

#proof[
  Start with $overline(Omega)_n$ and expand the off-position Gram conditions.
    For any nonzero character, choose an interacting pair of positions and fix all other positions.
    The remaining phase has rank at least $N$ between the two selected position groups.
    The prescribed single-position diagonal densities and the unary functions are separately bounded weights.
    30 gives the error above. The identical expansion with all functions one gives the normalization of the
    off-position Gram event. Its zero-character contribution is a fixed positive constant,
    and all other contributions are exponentially small. Dividing proves the assertion. ◻
]

=== 11.3 A many-query Fourier bound <a-many-query-fourier-bound>

Here and in the histogram lemma, a leaf is normalized to have mass one.
  Its law may be very far from having bounded individual marginals.

#thm([Lemma 11.4.])[
  (Many queries and prescribed cells).  #emph[Fix a bounded query shape.
    There are constants $c_1 \, c_2 > 0$, independent of any key-space partition, with the following property.
    Put $ell = floor.l c_1 n floor.r$ and repeat the query independently $ell$ times at a common orientation.
    Let $A_1 \, dots.h \, A_ell$ be cells of a partition of the full slot space, with weights $w_j =
    omega_n \( A_j \)$. Suppose the partition has bounded size and its nonempty weights have a positive lower
    bound along the sequence under consideration. Conditional on any nominal inputs whose queried columns are
    jointly independent in every endpoint, component, and mode,
    the raw image probability that each query $j$ lies in $A_j$ is at most
#[#set math.equation(numbering: n => "(11.1)")
 $ 2^(c_2 ell) product_(j = 1)^ell w_j $ <eq:histogram-many-query-bound>]

 for all sufficiently large $n$. How large $n$ must be may depend on the partition and its weight bound.
   The constants $c_1 \, c_2$ do not.]
  #emph[The probability, over the repeated fresh parameters,
    that the required nominal independence fails tends to zero exponentially in $n$,
    uniformly over the common orientation.]
] <lem:histogram-many-queries>

#proof[
  Let $k$ bound the number of vector slots in one draw, enlarging it by a fixed factor when convenient.
    At any endpoint and component, a new point column contains the component $p_s ⊗
    Z$ with a fresh uniform $n$-bit vector $Z$. Its probability of lying in a previously exposed space of
    dimension $v$ is at most $2^(- n + v)$: the projection of that space onto its $p_s ⊗
    Z$ direction space has dimension at most $v$. This remains valid with repeated labels,
    and also after the input is conditioned on $q$ or a tester summary.
    A union bound, with $k ell$ a small fraction of $n$, proves the independence assertion.
  Fix independent nominal inputs. The raw image law is an iid global slot law conditioned on all required
    same-endpoint Gram entries and on injectivity. Divide the Gram entries into those within a draw and those
    between draws, after collapsing duplicate entries. Write their numbers as $b_(upright("in"))$ and
    $b_(upright("cross"))$, respectively. We have $b_(upright("in")) = O \( ell \)$.
    The normalization in the denominator is at least a fixed constant times
    $2^(- b_(upright("in")) - b_(upright("cross")))$ by 53. In the nonnegative numerator,
    drop injectivity and the within-draw conditions, and expand only the cross-draw conditions. It remains to bound
  $ 2^(O \( ell \)) sum_chi \| bb(E)_(omega_n^(⊗ ell)) chi product_(j = 1)^ell upright(bold(1))_(A_j) \| \, $
  where the zero character has contribution $product_j w_j$.
  Represent a nonzero character by a symmetric binary matrix on the distinguished slot indices,
    grouped into $ell$ draw blocks of size at most $k$. Its diagonal draw blocks are zero.
    A coefficient records one unordered interacting slot pair;
    in particular there is no nontrivial character represented by the zero matrix.
    Let $t gt.eq 1$ be the maximum rank of a coefficient rectangle whose row draw-block set and column draw-block
    set are disjoint.
  We claim that the number of such patterns with this value of $t$ is at most $2^(C k^2 ell t)$ for an absolute
    constant $C$. Choose a nonsingular $t$ by $t$ minor witnessing the rank,
    with row-block set $I$ and column-block set $J$. Each of $I \, J$ has at most $t$ blocks.
    Specify all entries incident with those blocks. If $u \, v$ lie in two distinct unselected blocks,
    border the chosen minor by row $u$ and column $v$. The enlarged row and column block sets are still disjoint.
    Its rank cannot exceed $t$, so its bottom-right entry is uniquely determined by the other entries and the
    invertible minor. Entries in a single unselected diagonal block are already zero.
    Thus the specified entries determine the whole pattern. Their number is $O \( k^2 ell t \)$;
    the choices of the minor add at most $2 t log_2 \( k ell \)$ bits, which is absorbed in the asserted bound.
  For one pattern, fix slots outside the draw blocks $I union J$.
    Across $I$ and $J$ the phase has bit rank at least $t N$.
    Phases internal to each group or involving the fixed slots are separate weights,
    and the cell indicators within the two groups are bounded by one. The Walsh estimate gives $2^(- t N \/ 2)$.
    Integrating the other cell indicators gives
  #[#set math.equation(numbering: n => "(11.2)")
   $ \| bb(E) chi product_j upright(bold(1))_(A_j) \| lt.eq 2^(- t N \/ 2) product_(j in.not I union J) w_j lt.eq
     2^(- t N \/ 2) w_min^(- 2 t) product_j w_j \, $ <eq:histogram-character-bound>]
  where $w_min = min_j w_j$. This argument treats components and modes as distinguished slots;
    their only effect is to constrain which coefficient entries may be nonzero.
  The sum of nonzero characters, divided by $product_j w_j$, is therefore at most
  $ sum_(t gt.eq 1) 2^(C k^2 ell t - t N \/ 2 + 2 t log_2 \( 1 \/ w_min \)) . $
  Choose $c_1$ small enough both for nominal independence and for $C k^2 c_1 < M_0 \/ 8$.
    For any fixed positive weight bound, the displayed sum is at most $sum_(t gt.eq 1)
    2^(- t N \/ 4)$ for all sufficiently large $n$. It can consequently be absorbed in the within-draw factor
    $2^(O \( ell \))$. This proves (11.1) with a constant independent of the partition and its positive weight bound. ◻
]

=== 11.4 Uniform integrability and per-leaf nets <uniform-integrability-and-per-leaf-nets>

For a finite partition $cal(P)$ and reference weights $w_C$, use relative entropy in bits,

$ D_2 \( p bar.v.double w \) = sum_(C in cal(P)) p_C log_2 p_C / w_C \, wide 0 log_2 0 = 0 . $

Only nonempty reference cells are used.

For the finite entropy chain rule and Pinsker inequality in these units,
  see #cite(label("cover2006"), form: "prose") Theorem 2.5.3 and Lemma 11.6.1.
  We include the short derivation of the inequality and its constants in bits.
  For probability vectors $p \, q$, put $A = { j : p_j > q_j }$.
  Convexity of $t log t$ (the log-sum inequality) collapses their relative entropy to that of the two
  probabilities $p \( A \) \, q \( A \)$. Binary relative entropy in natural units has second derivative
  $1 \/ \[ u \( 1 - u \) \] gt.eq 4$ in its first argument and has value and first derivative zero at $u =
  q \( A \)$. Since $p \( A \) - q \( A \) = lr(bar.v.double p - q bar.v.double)_1 \/ 2$,
  Taylor’s integral formula gives

#[#set math.equation(numbering: n => "(11.3)")
 $ D_2 \( p bar.v.double q \) gt.eq frac(lr(bar.v.double p - q bar.v.double)_1^2, 2 ln 2) gt.eq 1 /
   2 lr(bar.v.double p - q bar.v.double)_1^2 . $ <eq:histogram-pinsker>]

Zero probabilities follow by continuity, with infinite relative entropy when appropriate.

#thm([Lemma 11.5.])[
  (Uniform histogram control).  #emph[Fix a query shape, a constant $C_L$, and an integer $F$.
    Consider any collection of normalized leaf laws $nu_L$ satisfying
#[#set math.equation(numbering: n => "(11.4)")
 $ nu_L lt.eq 2^(C_L N) sans(P)_0^2 . $ <eq:histogram-leaf-cap>]

 The following assertions are uniform over those leaves and over the bounded numerical choices of a query.]
  + #emph[If $A_n$ is a sequence of slot sets with $omega_n \( A_n \) arrow.r 0$,
    then the probability that the unfiltered query key belongs to $A_n$, averaged on any choice of leaves,
    tends to zero. Equivalently, the averaged key laws are uniformly absolutely continuous in this asymptotic
    small-set sense.]
  + #emph[On each leaf, choose any $F$ binary flags of the orientation and query parameters.
    Let $cal(H)_(L \, n)$ be the family of unnormalized key densities obtained by filtering by any event of the
    orientation and the flag values. For every $epsilon > 0$,
    this family has an $L^1 \( omega_n \)$ $epsilon$-net of cardinality bounded independently of $n$ and of the
    leaf, for all sufficiently large $n$. The net itself may depend on the leaf.]
  + #emph[Both conclusions persist after restricting the query to $cal(K)_n$ and expressing the subdensities
    relative to $nu_n$. In particular these subdensities are uniformly integrable:
    for every $eta > 0$ there is $R < oo$ such that, for all sufficiently large $n$,
    all their tails above $R$ have integral at most $eta$.]
  #emph[The flag functions may vary with the leaf and with $n$. The number of flags is fixed.
    No bound on the normalized marginal of an individual leaf is assumed here.
    The displayed cap concerns the orientation law after any marks are forgotten.
    Marks can be fixed on a leaf or included among the bounded flag data.]
] <lem:histogram-control>

#proof[
  We first obtain a uniform bound for coarse conditional information.
    Fix a partition with a bounded number $r$ of cells and with every nonempty reference weight bounded below by a
    positive constant. At an orientation $O$, let $H_O \( C \)$ be its input probability of cell $C$.
    Repeated queries are independent with this cell law. Uniformly over probability vectors on the fixed
    $r$-simplex, the empirical histogram of $ell = floor.l c_1 n floor.r$ samples converges to $H_O$.
    Relative entropy against the fixed positive reference weights is uniformly continuous on that simplex:
    each cell frequency has variance at most $1 \/ \( 4 ell \)$, and $u log u$ is continuous at zero.
    Consequently, on orientations with $D_2 \( H_O bar.v.double w \) > T + 1$,
    the empirical histogram has entropy greater than $T$ with probability $1 - o \( 1 \)$,
    uniformly over those orientations. The nominal independence event of 56 can be imposed simultaneously at a
    further $o \( 1 \)$ loss, also uniformly over orientations.
  There are at most $\( ell + 1 \)^r$ empirical types. For a type $v$, the multinomial bound gives
  $ frac(ell !, product_C \( ell v_C \) !) product_C w_C^(ell v_C) lt.eq 2^(- ell D_2 \( v bar.v.double w \)) . $
  Indeed the probability of that same type under cell probabilities $v$ is at most one,
    which bounds its multinomial coefficient by $product_C v_C^(- ell v_C)$.
    Apply (11.1) for each cell sequence of a type, and then pay (11.4). We obtain
  #[#set math.equation(numbering: n => "(11.5)")
   $ & \( 1 - o \( 1 \) \) nu_L { D_2 \( H_O bar.v.double w \) > T + 1 }\
 & #h(1cm)  lt.eq 2^(C_L M_0 n + \( c_2 - T \) ell + r log_2 \( ell + 1 \)) . $ <eq:histogram-entropy-tail>]
  Choose $T > c_2 + C_L M_0 \/ c_1 + 2$. This bound is exponentially small.
    The density cap has been applied only on the event of nominal independence.
    Its failure was removed in the uniform per-orientation lower bound,
    not multiplied by $2^(C_L N)$ as an additive raw exceptional probability.
  Since $D_2 \( H_O bar.v.double w \) lt.eq log_2 \( 1 \/ w_min \)$, it follows that
  #[#set math.equation(numbering: n => "(11.6)")
   $ limsup_(n arrow.r oo) bb(E)_(O tilde.op nu_L) D_2 \( H_O bar.v.double w \) lt.eq
     C_H $ <eq:histogram-coarse-entropy>]
  for a constant $C_H$ independent of the fixed partition size and its positive weight bound.
    The onset of the bound may depend on both. The constant may depend on $C_L \, M_0$ and the query shape.
  Let $V$ denote the flag vector, let $C_(cal(P)) \( K \)$ denote the cell of $cal(P)$ containing the key $K$,
    and let $p_(O \, V)$ be its cell law conditional on $O \, V$.
    Average this law with the actual joint distribution of $\( O \, V \)$;
    flag values of probability zero may be given any conditional law. The entropy chain rule gives
  $ bb(E) D_2 \( p_(O \, V) bar.v.double w \) = bb(E) D_2 \( H_O bar.v.double w \) +
    I \( C_(cal(P)) \( K \) \; V divides O \) lt.eq bb(E) D_2 \( H_O bar.v.double w \) + F . $
  Indeed, split each logarithm $log_2 \( p_(O \, V) \( C \) \/ w_C \)$ through $H_O \( C \)$.
    The first term averages to $I \( C_(cal(P)) \( K \) \; V divides O \)$;
    the second averages to $bb(E) D_2 \( H_O bar.v.double w \)$ because averaging $p_(O \, V)$ over the
    conditional flag law gives $H_O$. The information term is at most the entropy of the $F$-bit flag vector,
    hence at most $F$. Thus (11.6) holds for these conditional histograms with $C_H + F$ in place of $C_H$.
  For the small-set assertion, suppose by contradiction that $omega_n \( A_n \) arrow.r
    0$ but the averaged query probability of $A_n$ is bounded below by $a > 0$ on a sequence of leaves.
    Fix $0 < delta < 1 \/ 2$ and enlarge $A_n$ to a set of reference weight tending to $delta$;
    the uniform slot atoms tend to zero, so this is possible.
    On the resulting two-cell partition, the binary entropy inequality gives
  $ D_2 \( \( p \, 1 - p \) bar.v.double \( delta \, 1 - delta \) \) gt.eq p log_2 \( 1 \/ delta \) - 1 . $
  Taking expectations and limits in (11.6) yields $a log_2 \( 1 \/ delta \) lt.eq C_H + 1$.
    Sending $delta$ to zero is a contradiction. This proves (i),
    and the same assertion holds for every filtered submeasure by domination.
  We next prove the net assertion. For a partition $cal(P)$,
    write $Pi_(cal(P)) d$ for its conditional-average density relative to $omega_n$.
    If some filtered density $d$ satisfies $lr(bar.v.double d - Pi_(cal(P)) d bar.v.double)_1 > epsilon$,
    split every cell by the set where $d - Pi_(cal(P)) d$ is positive.
    On the refined partition the filtered cell masses differ in $ell^1$ by more than $epsilon$ from their parent
    masses subdivided in reference proportions. Since the filter is a function of $\( O \, V \)$ with values in
    $\[ 0 \, 1 \]$, the triangle inequality implies that the #emph[expected] corresponding discrepancy of the
    unfiltered conditional vectors $p_(O \, V)$ is at least $epsilon$.
  For any refinement, the relative entropy chain rule and (11.3) give
  #[#set math.equation(numbering: n => "(11.7)")
   $ & bb(E) D_2 \( p_(upright("child")) bar.v.double w_(upright("child")) \) -
     bb(E) D_2 \( p_(upright("parent")) bar.v.double w_(upright("parent")) \)\
 & quad gt.eq 1 /
   2 (bb(E) lr(bar.v.double p_(upright("child")) - "split"_w \( p_(upright("parent")) \) bar.v.double)_1)^2 .
   $ <eq:histogram-refinement-gain>]
  Here $"split"_w$ divides each parent mass among its children in their reference proportions.
    To see the last step, apply the usual conditional relative entropy identity inside each parent, then Pinsker,
    and then Jensen first with the parent masses and then over $\( O \, V \)$.
  A bounded number of refinements must suffice uniformly asymptotically.
    For otherwise choose any large fixed depth $d$ and a sequence of leaves with $d$ successive witnessing
    refinements. Their final partitions have at most $2^d$ cells.
    Pass to a subsequence on which the reference weights of the entire finite tree converge and the laws of the
    conditional histogram vectors converge. A final cell of zero limiting reference weight has zero limiting
    expected conditional mass by (i), and hence zero conditional mass almost surely.
    Delete these zero-weight cells in the limit. For a positive-weight parent,
    reference subdivision ratios converge. For a zero-weight parent,
    both the actual and subdivided total masses tend to zero in expectation.
    The positive discrepancy at every refinement consequently persists in the limit,
    at least as $epsilon \/ 2$ if needed.
  The limiting final conditional entropy is at most $C_H + F$.
    Indeed, before taking limits merge all zero-limiting-weight final cells into one positive cell,
    and use the conditional version of (11.6) on that partition.
    All its limiting weights are positive, so entropy is continuous.
    This merging is used only for the final upper bound. The remaining positive limit cells still form a genuine
    refinement tree, on which (11.7) telescopes. That identity forces the final entropy to be at least $d
    epsilon^2 \/ 8$, a contradiction for large fixed $d$.
  Apply the preceding argument with $epsilon \/ 2$. On a partition of bounded size $r'_0$ that approximates every
    family member, quantize each cell mass downwards in increments $epsilon \/ \( 2 r'_0 \)$.
    The $L^1$ error in the piecewise-constant density is the sum of the cell-mass errors, at most $epsilon \/ 2$.
    There are at most $\( 1 + 2 r'_0 \/ epsilon \)^(r'_0)$ possible quantized mass lists.
    They form the required net, proving (ii).
  For (iii), the restriction of a density $d$ relative to $omega_n$ has density $omega_n \( cal(K)_n \)
    d$ on $cal(K)_n$ relative to $nu_n$. Restriction therefore cannot increase the $L^1$ distance.
    A $nu_n$-small set is also $omega_n$-small, so (i) transfers as well.
    Every resulting subdensity has integral at most one; its superlevel set above $R$ has reference measure at
    most $1 \/ R$. Assertion (i), applied along any contrary sequence,
    makes the integrals on those superlevel sets tend to zero uniformly as $R arrow.r oo$.
    This is uniform integrability. ◻
]

#prodef([Remark 11.6.])[
  The preceding lemma allows a leaf to have strongly nonuniform histograms.
    For example, forcing a whole primal frame map into a fixed ambient subspace of constant codimension costs
    $2^(O \( n \))$ and can be consistent with (11.4). It puts its keys on a fixed small reference set.
    The uniform entropy constant is therefore allowed to depend on the leaf density exponent and on $M_0$.
    The next results concern typical orientations under a mixed law and use a different, stronger marginal hypothesis.
] <rem:histogram-leaf-versus-mixed>

=== 11.5 Typical empirical integrals under a paired law <typical-empirical-integrals-under-a-paired-law>

Write $sans(P)_0^(upright("pr")) = "pr"_(*) sans(P)_0$ for the raw single-endpoint primal law.
  In the rest of the section let $rho_n$ be a law on units satisfying, after forgetting any finite marks,
  for a fixed $C$ and some $a_n arrow.r 0$,

#[#set math.equation(numbering: n => "(11.8)")
 $ rho_n lt.eq 2^(C N) sans(P)_0^2 \, wide "pr"_(*) \( rho_n \)_i lt.eq
   M 2^(a_n N) sans(P)_0^(upright("pr")) quad \( i = 1 \, 2 \) . $ <eq:histogram-mixed-caps>]

Changing the fixed factor $M$ does not matter. Since $M_0$ is fixed, $a_n N = o \( n \)$.
  The law may have arbitrary dependence between its two endpoints.
  A decomposition into leaves does not change (11.8) for its mixture.
  The second inequality is solely a primal marginal bound. No $M 2^(o \( N \))
  sans(P)_0$ bound on the full endpoint law is required or asserted.
  In particular $"pr"_(*) pi = sans(P)_0^(upright("pr"))$ allows endpoint caps relative to the thinned law $pi$ to
  supply this hypothesis. Projecting the first inequality also gives $"pr"_(*) rho_n lt.eq
  2^(C N) \( sans(P)_0^(upright("pr")) \)^2$.

#thm([Lemma 11.7.])[
  (Typicality of common input-and-key tests).  #emph[Let $F_n$ be a uniformly bounded common function of the
    inputs and primal keys of a fixed bounded query, with no other orientation dependence.
    In particular it does not inspect channel maps or the orientation’s marks. Put
$ A_n \( O \) = bb(E)_z F_n \( z \, K \( O \, z \) \) \, wide m_n =
  bb(E)_(O tilde.op sans(P)_0^2 \, z) F_n \( z \, K \( O \, z \) \) . $

 For every fixed $epsilon > 0$, under (11.8),
$ rho_n { \| A_n - m_n \| > epsilon } = 2^(- Omega \( n \)) . $

 Repeated labels in the query are allowed. The constants may depend on the query and $epsilon$,
   but the estimate is uniform over tests with the given sup bound. The exceptional set may depend on the test.]
  #emph[For a query at just one endpoint, its raw variance about its raw mean is $2^(- Omega \( n \))$.
    This variance bound is also uniform when an arbitrary external input-and-image datum is fixed as an argument
    of the test. This datum may include a channel frame from a separately fixed vertex;
    uniformity refers to each fixed datum.]
] <lem:typicality>

#proof[
  Every empirical integral and exceptional event used in this proof is measurable with respect to the primal maps.
    We can therefore work throughout with the projected law, paying only the projected marginal bound in (11.8).
    Raw expectations are unchanged by this projection. Rescale the test to have absolute value at most one.
    First consider one raw endpoint and duplicate its parameter batch.
    The two batches have jointly independent nominal columns except with $2^(- Omega \( n \))$ probability,
    because their $Z$ inputs are independent and their total number of columns is bounded.
    With the nominal inputs fixed on this event, 54 compares the product of the two tests with the product of
    their separate raw expectations, at error $O \( 2^(- N \/ 2) \)$.
    Averaging the two independent input batches and bounding the dependent-input event trivially proves
  #[#set math.equation(numbering: n => "(11.9)")
   $ "Var"_(O tilde.op sans(P)_0) #scale(x: 120%, y: 120%)[\(] bb(E)_z F_n \( z \, K \( O \, z \) \)
     #scale(x: 120%, y: 120%)[\)] lt.eq C_1 2^(- c'_1 n) . $ <eq:histogram-one-endpoint-variance>]
  All these estimates are uniform in a fixed external datum,
    since it only changes the separate bounded test functions.
    Chebyshev’s inequality proves the one-endpoint assertion at every fixed tolerance.
  For the paired assertion, assume that both endpoints are used;
    the other case follows at once from the marginal bound. Let $D_2$ denote the second endpoint’s input-and-image
    data under its raw model, and for a first primal orientation $o$ define
  $ h_o \( D_2 \) = bb(E)_(z_1) F_n \( z_1 \, K_1 \( o \, z_1 \) \, D_2 \) \, wide macron(h) \( D_2 \) =
    bb(E)_(o tilde.op sans(P)_0) h_o \( D_2 \) . $
  Fix a small constant $eta > 0$. By (11.9), uniformly in $D_2$,
    $bb(P)_(sans(P)_0^(upright("pr"))) { \| h_o \( D_2 \) - macron(h) \( D_2 \) \| >
    eta }$ is exponentially small. Fubini and Markov show that,
    outside an exponentially small set of first primal orientations, the raw-model probability of the bad data set
  $ B_o = { D_2 : \| h_o \( D_2 \) - macron(h) \( D_2 \) \| > eta } $
  is at most $2^(- c n)$ for some $c > 0$. The projected marginal cap in (11.8) still makes the discarded
    first-endpoint mass exponentially small.
  Fix any of the remaining first orientations. We claim that a raw second orientation $o'$ has empirical input
    probability at least $eta$ of $B_o$ only with probability $2^(- Omega \( n^2 \))$.
    Draw $ell' = floor.l c'_2 n floor.r$ independent second-endpoint input batches.
    For an orientation with empirical bad probability at least $eta$,
    at each step success and nominal independence of the new columns modulo the previous ones have conditional
    probability at least
  $ eta - O \( 2^(- n + O \( ell' \)) \) gt.eq eta \/ 2 . $
  The failure bound depends only on fresh uniform $Z$ coordinates and holds for any past inputs.
    Thus all successes together with joint nominal independence have probability at least $\( eta \/ 2 \)^(ell')$.
  For independent nominal columns, the joint raw image law of these batches has density at most
    $2^(C_2 \( ell' \)^2)$ relative to the product of the individual raw batch laws.
    Indeed it adds only $O \( \( ell' \)^2 \)$ mutual Gram conditions and injectivity;
    count their normalizations by 53 and bound the indicator in the numerator by one.
    After averaging the inputs, the all-success probability on the independence event is consequently at most
  $ 2^(C_2 \( ell' \)^2) bb(P) \( D_2 in B_o \)^(ell') lt.eq 2^(C_2 \( ell' \)^2 - c n ell') . $
  Choose $c'_2 > 0$ small enough that $C_2 \( c'_2 \)^2 < c c'_2 \/ 2$ and that nominal independence is available.
    Dividing by $\( eta \/ 2 \)^(ell')$ proves the claim.
  This quadratic-exponential estimate is uniform in the fixed good first primal orientation.
    Hence the set of paired primal orientations with a good first endpoint but a bad oversampling second endpoint
    has $\( sans(P)_0^(upright("pr")) \)^2$-mass $2^(- Omega \( n^2 \))$.
    Multiplying by the projected joint density $2^(C N) = 2^(C M_0 n)$ still leaves quadratic-exponentially small
    mass. On every remaining pair,
  $ \| bb(E)_(z_2) h_o \( D_2 \) - bb(E)_(z_2) macron(h) \( D_2 \) \| lt.eq 3 eta . $
  Finally, $macron(h)$ is a common input-and-key test of the second endpoint.
    Apply the one-endpoint estimate again and its projected marginal cap to compare its empirical integral with
    its raw mean to within $eta$. Taking $4 eta < epsilon$ proves the lemma. ◻
]

#prodef([Remark 11.8.])[
  Uniformity in the test means that each prescribed test has a small exceptional set with the stated bound.
    It does not mean that one orientation is simultaneously good for every possible global test.
    The later arguments use only finitely many common tests at a time.
    For two distinct laws, apply these results on a mixture with fixed positive type weights and retain the type
    as a mark. A test prescribed for each of the finitely many types is handled by taking the union of its
    exceptional sets. The same argument permits colours to be recorded on leaves while using the original,
    mass-weighted mixture for every marginal estimate. It does not require the normalized individual colour
    classes to satisfy a common marginal cap. Restriction to a sublaw of inverse-polynomial mass,
    or more generally of reciprocal mass $2^(o \( n \))$, preserves (11.8).
    Such restriction need not preserve a uniform cap on every individually normalized old leaf.
    The mixed-law lemmas do not require that additional conclusion.
] <rem:typicality-no-test-supremum>

=== 11.6 Mixing of the binary parameter constraints <mixing-of-the-binary-parameter-constraints>

#thm([Lemma 11.9.])[
  (Binary mixing).  #emph[Fix a query template whose labels are distinct at each used endpoint.
    Impose the off-position Gram zeros of $cal(K)_n$ and a consistent fixed specification of the within-endpoint
    ordered $L \, R$ evaluations used in 7. Let $cal(A)_n \( O \, z \)$ be their joint indicator.
    There is a template constant $kappa > 0$ such that, outside an exponentially small set of orientations under (11.8),
#[#set math.equation(numbering: n => "(11.10)")
 $ bb(E)_z cal(A)_n \( O \, z \) product_j w_j \( O \, z_j \) = kappa product_j bb(E)_(z_j) w_j \( O \, z_j \) +
   O \( 2^(- c n) \) $ <eq:binary-mixing>]

 uniformly over all unary weights with $\| w_j \| lt.eq 1$.
   These weights may depend on the entire fixed orientation.
   The input laws may be conditioned separately on feasible diagonal values or tester summaries.
   The exceptional set is independent of the unary weights.]
] <lem:binary-mixing>

#proof[
  Collapse all identical Gram entries, including the repeated same-endpoint entries that equal the same $E$
    evaluation, and impose only one copy of each. Consistency means that their prescribed values respect these
    repetitions. Expand the resulting binary indicators into characters.
    The zero character has coefficient $kappa = 2^(- b)$, where $b$ is the number of the resulting specified bits.
    We show that every nonzero character has an exponentially small integral against the product of unary weights.
  If an interacting pair of positions belongs to the same endpoint, their labels are distinct.
    The second property of 35 says that every nonzero parity of its ordered $L \, R$ bits,
    with its possible $E$ bits in either order, has bilinear rank at least $n \/
    5$ on the retained free variables. This includes characters involving only $E$ bits.
  For positions from opposite endpoints, we establish the analogous claim for their global Gram bits except on a
    $2^(- Omega \( n^2 \))$ raw exceptional set. Write $d = dim cal(B) + h$ for the full plus-frame dimension.
    At one component, an intersection of dimension at least $v =
    floor.l n \/ 10 floor.r$ between the two full plus spans gives $v$ independent image relations.
    Their coefficient choices number at most $2^(2 d v)$, and the frame image estimate bounds each event by
    $2^(- \( 1 - epsilon.alt \) v N)$, for a fixed small $epsilon.alt$.
    The choice of $M_0$, hence $d \/ N$ small, makes this $2^(- Omega \( n^2 \))$.
    There are only boundedly many components.
  Condition on plus frames off this exception. Choose a nonzero pair pattern and a component where,
    after exchanging the endpoints if necessary, it uses a plus slot at endpoint 1 paired with a minus slot at
    endpoint 2. At least $n - v$ of the first position’s $Z$ directions are independent modulo the second
    endpoint’s full plus frame. The second position’s nominal minus $Z$ directions are independent.
    Conditional on the plus frames, the latter minus columns have independent uniform values on the appropriate
    affine annihilator spaces, before their full-rank conditioning.
    Their evaluations on these $n - v$ directions therefore form a uniform rectangular matrix,
    up to a fixed translation. Terms in the reverse order and other components may be frozen first;
    they use separate minus-frame randomness. The final injectivity conditioning costs only a bounded
    multiplicative factor.
  A uniform $a$ by $b$ binary matrix has rank at most $r$ with probability at most $2^(\( a + b \) r - a b)$,
    by writing it as a product of an $a$ by $r$ and an $r$ by $b$ matrix and counting.
    With $a gt.eq n - v$ and $b = n$, this shows that the bilinear rank is greater than $n \/
    5$ except with probability $2^(- Omega \( n^2 \))$. Union over the boundedly many nonzero pair patterns.
    The joint density in (11.8) preserves this exceptional scale.
  For any nonzero full character, choose a pair with nonzero coefficient pattern and fix the other position
    inputs. The remaining terms become separate unary phases.
    The selected pair has rank at least $n \/ 5$ by one of the preceding two arguments.
    30 gives an error $O \( 2^(- n \/ 10) \)$ against the two remaining bounded unary weights.
    Input conditioning costs only the fixed reciprocal probabilities of the diagonal values or tester summaries;
    those events can be absorbed into the respective weights.
    Summing the bounded number of characters proves (11.10). All estimates were uniform in the unary weights,
    so the exceptional set does not depend on them. ◻
]

=== 11.7 Positive basis fractions on common key cells <positive-basis-fractions-on-common-key-cells>

We give the small-cell argument explicitly, because its uniform lower fraction will be used on a countable
  collection of signature cells.

#thm([Lemma 11.10.])[
  (Quadratic signs on affine subspaces).  #emph[Let $Q$ be a quadratic function on a binary vector space and let
    its polar form have rank $2 r$. Its uniform sign bias has magnitude at most $2^(- r)$.
    On an affine subspace of codimension $c$, the restricted polar rank is at least $2 r - 2 c$,
    and its sign bias is at most $2^(- r + c)$ whenever this bound is less than one.]
] <lem:histogram-quadratic-bias>

#proof[
  Squaring the mean sign and translating one variable gives
  $ \| bb(E)_x \( - 1 \)^(Q \( x \)) \|^2 = bb(E)_h \( - 1 \)^(Q \( h \) + Q \( 0 \))
    upright(bold(1))_({ B \( h \, dot.op \) = 0 }) \, $
  where $B$ is the polar form. Its absolute value is at most the kernel proportion $2^(- 2 r)$.
    Restricting a bilinear form to a codimension-$c$ subspace in each of its two factors can decrease rank by at
    most $2 c$. Apply the first assertion on that affine subspace,
    where translation affects only the linear and constant terms. ◻
]

#thm([Lemma 11.11.])[
  (Unary reference law and base-status positivity).  #emph[Fix an endpoint, tag, label, flavor,
    and feasible tester summary with diagonal $q$. For a bounded number of common global key tests,
    its empirical conditional key frequencies differ from $Omega_(l \, q \, n)$ by any prescribed fixed tolerance
    except on exponentially small mixed mass under (11.8).]
  #emph[At each unit, let $C_i subset cal(X)$ be any orientation-dependent space of dimension at most $K^2$ all of
    whose elements have total component rank at most $K$, and choose any basis.
    Fix a sequence of global single-key sets $A_n$ with $Omega_(l \, q \, n) \( A_n \) gt.eq delta > 0$.
    Except on exponentially small mixed mass, every basis assignment has,
    conditional on the tester summary and on $K_i in A_n$, fraction at least $\( 7 \/ 8 \) 2^(- dim C_i)$.
    For the fixed common key sets, the exceptional event depends only on the primal frames and is chosen uniformly
    over all nominal profiles of the indicated rank before $C_i$ or its basis is selected.
    Thus these selections may depend on the channels and all orientation marks.
    We use the first effective spaces from (6.6); the larger generality in this statement requires no further peeling.]
  #emph[For the full generic flavor and inputs conditional just on $q$, the following conservative constant is valid:
#[#set math.equation(numbering: n => "(11.11)")
 $ beta_(upright("base")) = 2^(- K^2 - 1) 4^(- \( g^2 + 1 \)) > 0 . $ <eq:uniform-base-fraction>]

 For every feasible specified tester summary and basis assignment, outside an exponentially small exceptional set,
#[#set math.equation(numbering: n => "(11.12)")
 $ bb(P)_z { K_i in A_n \, med upright("the specified summary and basis bits") divides q } gt.eq
   beta_(upright("base")) thin Omega_(l \, q \, n) \( A_n \) . $ <eq:histogram-base-cell-lower>]

 In particular each joint choice of the role $a \( "atom" \)$ and the basis bits has this lower bound,
   after choosing a compatible summary. Both roles are available for either possible generic $q$.
   No prescribed value of the channel flag $p_i$ is included in these lower bounds.
   If that bit is recorded together with the role and basis bits,
   the bound holds only after summing over its two values.]
  #emph[The lower constants do not depend on $delta$, on the key tests,
    or on the orientation-dependent choice of $C_i$. The onset of the asymptotics and the exceptional-set
    constants may depend on a fixed positive lower bound $delta$.
    The exceptional set is allowed to depend on the prescribed tests:
    there is no simultaneous assertion over all measurable key sets at one orientation.]
] <lem:unary-positivity>

#proof[
  For each fixed point parameter, the raw key law is the single-key reference up to an exponentially small
    injectivity error, by 23. The first conclusion therefore follows from the one-endpoint part of 59,
    also after conditioning on a feasible summary.
  Fix a nonzero profile $x in cal(X)$ of total component rank at most $K$, and consider the sign
  $ s_x \( z \) = \( - 1 \)^(T \( x \, "atom" \( z \) \)) . $
  By the first property of 35, its dependence on $Z$ factors through a bounded-dimensional space of linear forms,
    independent of the other input values, and its $Z$-polar rank is at least $2 \( J - s_0 \)$. Put
  $ gamma = 2^(- K^2 - 3) \, wide b_(*) = 2^(- J + 2 s_0) < gamma . $
  The strict inequality follows from the chosen lower bound on $J$.
  Apply a uniform $G in "GL"_n \( bb(F)_2 \)$ simultaneously to the $Z$ input coordinates in all primal frames at
    the queried endpoint. This preserves the raw primal law because $E$ has no $Z$ rows or columns.
    We perform this averaging on $sans(P)_0^(upright("pr"))$, not on the thinned conditional channel law.
    It also preserves the empirical mass of a global key cell:
    change variables in the uniform $Z$ input and leave the other coordinates unchanged.
    After this change of variables the cell event is fixed and the sign’s bounded row-bit space is moved by the
    inverse transformation.
  Fix a starting orientation for which the cell, conditional on the summary, has input mass at least $delta \/ 2$.
    We claim that at most $2^(- 2 A n)$ of the transformations can make its conditional absolute sign bias exceed
    $gamma$, for sufficiently large $n$. Suppose the contrary and retain one bias sign,
    losing at most a factor two. For any fixed integer $u$, choose $u$ such transformations successively so that
    each new row-bit space meets the span of the previous ones in dimension at most $s_0$.
    This is possible for large $n$. Indeed, for a uniformly moved space of bounded dimension and a fixed space of
    bounded dimension, the probability of an intersection of dimension greater than $s_0$ is
    $O_u \( 2^(- s_0 n) \)$: choose $s_0$ independent vectors in the former and bound the probability that their
    uniformly independent images all lie in the latter. The number of such choices and target vectors is bounded
    independently of $n$. Since $s_0 = 4 ceil.l A ceil.r > 2 A$,
    this excluded fraction is smaller than the retained fraction at each of the fixed number of choices.
  Let $E_0$ be the fixed cell event in the conditional input probability space and let $delta' =
    bb(P) \( E_0 \) gt.eq delta \/ 2$. Denote the chosen signs,
    with their common bias sign adjusted to be positive, by $s_1 \, dots.h \, s_u$.
    Let $cal(F)_(j - 1)$ contain all non-$Z$ inputs and the row bits of the preceding chosen spaces, and put
  $ m_j = bb(E) \( s_j divides cal(F)_(j - 1) \) \, wide D_j = s_j - m_j . $
  Conditioning the current row bits on the past imposes at most $s_0$ linear conditions on their distribution.
    The polar rank can therefore lose at most $2 s_0$ further dimensions. By 62,
  $ \| m_j \| lt.eq b_(*) $
  pointwise, including after the non-$Z$ inputs are fixed. The $D_j$ are martingale differences with second
    moments at most one, so $lr(bar.v.double u^(- 1) sum_j D_j bar.v.double)_2 lt.eq u^(- 1 \/ 2)$.
    On the other hand every selected sign has conditional mean greater than $gamma$ on $E_0$. Consequently
  #[#set math.equation(numbering: n => "(11.13)")
   $ \( gamma - b_(*) \) delta' lt.eq \| bb(E) upright(bold(1))_(E_0) thin u^(- 1) sum_j D_j \| lt.eq
     sqrt(delta' \/ u) . $ <eq:histogram-tiny-cell-martingale>]
  Here the intrinsic bias costs $b_(*) delta'$, because its conditional mean is bounded pointwise;
    it does not cost an absolute $b_(*)$ before division by the cell mass.
    Taking $u > 2 \/ \[ delta \( gamma - b_(*) \)^2 \]$ contradicts (11.13).
    This proves the transformation claim with $J$ fixed independently of the cell mass.
  Integrate that claim over the starting raw primal orientation, using frame-law invariance.
    The first part of the lemma makes the cell mass at least $delta \/ 2$ outside an exponentially small set.
    More precisely, the transformation estimate is used only on orientations with this mass;
    that property is itself invariant under the transformations.
    This cell-mass exceptional set is common to all profiles and is discarded only once.
    For a fixed $x$, the event that the cell mass is at least $delta \/
    2$ and the conditional sign bias is bad has raw probability at most $2^(- 2 A n)$.
    There are at most $2^(A n)$ nonzero profiles of the required rank for all sufficiently large $n$, by 35.
    Union over them, and over the bounded numerical position and summary choices.
    The resulting event is still exponentially small, also after the projected marginal inflation in (11.8).
    This union is taken before making any channel-dependent choice of effective space or basis:
    its exceptional event is a function of the primal frames alone.
  On its complement every nonzero linear combination of a basis of $C_i$ has conditional sign bias at most
    $gamma$, regardless of how the space and basis were selected from the unit.
    Fourier inversion, for $d_i = dim C_i$, gives for every assignment
  $ bb(P) \( upright("assignment") divides E_0 \, upright("summary") \) gt.eq
    2^(- d_i) #scale(x: 120%, y: 120%)[\(] 1 - \( 2^(d_i) - 1 \) gamma #scale(x: 120%, y: 120%)[\)]
    gt.eq \( 7 \/ 8 \) 2^(- d_i) . $
  This also covers $d_i = 0$.
  It remains to check the uniform generic constant. For one retained tester block, the sum of $r_0 gt.eq
    1$ independent bit-pair products has probabilities $\( 1 plus.minus 2^(- r_0) \) \/ 2$,
    both at least $1 \/ 4$. Distinct tester blocks use disjoint input bits.
    There are at most $g^2 + 1$ such blocks, so every feasible summary has probability at least
    $4^(- \( g^2 + 1 \))$. Conditional on its compatible value of $q$, its probability is no smaller.
    Its empirical key-cell mass, conditional on that summary,
    is at least $\( 3 \/ 4 \) Omega_(l \, q \, n) \( A_n \)$ outside an exponentially small set by the first part.
    Combining this with the basis lower fraction gives (11.12), since $\( 3 \/ 4 \) \( 7 \/ 8 \) > 1 \/ 2$.
    In the generic flavor there is at least one retained $O$ tester and the independent shared tester.
    Prescribing their parities realizes either $a$ role at either fixed $q$,
    and a feasible summary for each has the same lower probability bound. ◻
]

#prodef([Remark 11.12.])[
  The key-only hypothesis cannot be omitted. For a fixed nonzero profile $x_0$, the input event ${ z :
    T \( x_0 \, "atom" \( z \) \) = 0 }$ has zero conditional mass for the opposite basis bit.
    This is an allowed input-and-key test for concentration, but is not a common global key cell for positivity.
    The constants in 63 apply on every fixed positive limiting key cell, however small.
    Countably many resulting cell inequalities can be passed through a diagonal subsequence;
    they do not assert simultaneous finite-$n$ control of all possible cells.
    An orientation-only subfilter preserves an almost-sure limiting positivity statement,
    whereas an arbitrary additional input filter need not.
] <rem:unary-positivity-key-only>

== 12 Weak product testing <sec:product-tests>

The preceding histogram lemma gives compact families within each leaf. We now prove a different statement:
  a fixed global test on a tuple of keys can be replaced, for the integrations that occur here,
  by a bounded sum of products of global single-key functions.
  Both its reference and its actual-query conclusions are needed.

Fix a query template with $r$ positions and with labels distinct at each used endpoint.
  Its input laws and reference measures are those of 11. In particular $overline(Omega)_n = ⨂_(j = 1)^r
  Omega_(l_j \, q_j \, n)$ and $nu_n$ is its off-position-Gram-conditioned reference on $cal(K)_n$.
  The additional prescribed binary tests are the within-endpoint ordered $L \, R$ evaluations from 7.
  Let $cal(A)_n \( O \, z \)$ be the successful binary indicator from 61, including the off-position Gram zeros.
  All common functions below inspect primal keys only. Channel maps may enter the unary input weights and the
  orientation filters.

#thm([Theorem 12.1.])[
  (Weak product comparison).  #emph[Let $W_n$ be any sequence of real functions on $cal(K)_n$ with
    $lr(bar.v.double W_n bar.v.double)_oo lt.eq B$, where $B$ is fixed.
    Extend it to the product of the single-key spaces with the same bound.
    For every $epsilon > 0$ there are constants $L \, C < oo$, independent of $n$, and functions
#[#set math.equation(numbering: n => "(12.1)")
 $ S_n \( k_1 \, dots.h \, k_r \) = sum_(a = 1)^L c_(a \, n) product_(j = 1)^r f_(a \, j \, n) \( k_j \) \,
   wide \| c_(a \, n) \| lt.eq C \, quad \| f_(a \, j \, n) \| lt.eq 1 \, $ <eq:weak-product-approximant>]

 with the following properties.]
  + #emph[For arbitrary global unary functions $g_(j \, n)$ of bound one,
#[#set math.equation(numbering: n => "(12.2)")
 $ \| integral \( W_n - S_n \) product_j g_(j \, n) \( k_j \) thin d nu_n \| lt.eq
   epsilon $ <eq:weak-product-reference>]

 for all sufficiently large $n$.]
  + #emph[Under any mixed unit law satisfying (11.8), outside an exponentially small exceptional set of orientations,
#[#set math.equation(numbering: n => "(12.3)")
 $ sup_(\| w_j \| lt.eq 1) \| bb(E)_z cal(A)_n \( O \, z \) \( W_n - S_n \) \( K \( O \, z \) \) product_j
   w_j \( O \, z_j \) \| lt.eq epsilon . $ <eq:weak-product-actual>]

 The unary input weights may depend on the entire fixed orientation and on any additional marks fixed with it.
   The exceptional set is independent of these weights. Thus one may prescribe channel flags such as $p_i$ in a
   unary weight without making them common key tests or asserting positivity for their individual values.]
  #emph[The functions $f_(a \, j \, n)$ are global key functions; they can be chosen to be indicators of sets,
    or finite linear combinations of such indicators with uniformly bounded complexity.
    They do not depend on the sampled orientation. The constants may depend on $B \,
    epsilon$ and the fixed template and construction parameters, but not on $n$.]
  #emph[An additional orientation-only filter of bound one may multiply (12.3) without changing it.
    In particular, after averaging normalized leaves, the same error control applies to unnormalized
    admissibility-filtered query measures, even when the filter is chosen using the opposite leaf.
    No assertion is made for an arbitrary additional joint input filter.
    For distinct marked laws, use their fixed-weight mixture, with caps checked after forgetting the marks.
    A retained ordered type pair or different-colour condition is an orientation/leaf-pair filter,
    so the same conclusion applies before normalization. All leaf averages use their actual weights;
    no marginal hypothesis on a separately normalized colour class is needed.]
] <thm:weak-product>

The proof uses a finite family of twists. If $I \, J$ partition a set of positions into two nonempty groups,
  let $cal(T)_(I \, J)$ consist of all products of their available inter-position global Gram signs:
  the dot products of a plus slot at one position with a minus slot at another position in the same component.
  These signs are defined on the product reference whether or not that Gram is prescribed by a raw same-endpoint
  frame law. Every such twist equals one on $cal(K)_n$. The number of twists is a constant depending only on the
  query shape.

For a real function $D$ on the keys of $I union J$, define its twisted cut norm by

#[#set math.equation(numbering: n => "(12.4)")
 $ lr(bar.v.double D bar.v.double)_(square.stroked.tiny \, cal(T)) =
   max_(tau in cal(T)_(I \, J)) sup_(\| f \| \, \| g \| lt.eq 1) \| integral D \( k_I \, k_J \)
   tau \( k_I \, k_J \) f \( k_I \) g \( k_J \) thin d overline(Omega)_(I union J \, n) \| . $ <eq:twisted-cut-norm>]

Here $f \, g$ may be arbitrary functions on their whole respective groups.
  Only after the recursion below will they become unary.

We use the finite-partition energy-increment method underlying weak regularity;
  see #cite(label("frieze1999"), form: "prose"). The additional Gram conditioning needed here is retained
  explicitly in the following self-contained proof.

#thm([Lemma 12.2.])[
  (Finite twisted regularity).  #emph[Let $\| W \| lt.eq B$ on the product key space of $I union J$,
    and let $delta > 0$. There is a decomposition
#[#set math.equation(numbering: n => "(12.5)")
 $ W = sum_(a = 1)^(L') c_a f_a \( k_I \) g_a \( k_J \) tau_a \( k_I \, k_J \) + D \,
   $ <eq:twisted-regularity-decomposition>]

 where $\| f_a \| \, \| g_a \| lt.eq 1$, $tau_a in cal(T)_(I \, J)$, $\| c_a \| lt.eq B$,
   $lr(bar.v.double D bar.v.double)_oo lt.eq 2 B$,
   and $lr(bar.v.double D bar.v.double)_(square.stroked.tiny \, cal(T)) lt.eq delta$.
   The number $L'$ is bounded in terms of $B \, delta$ and the twist count only.
   The functions $f_a \, g_a$ may be chosen as indicators of cells in finite group partitions.]
] <lem:product-twisted-regularity>

#proof[
  Let $Gamma$ be the finite list of crossing Gram bits generating the twists.
    Begin with the trivial partitions of the two groups. For any current pair of finite partitions,
    condition $W$ on their cells and on $Gamma$; call the resulting conditional expectation $S$.
    Then $lr(bar.v.double S bar.v.double)_oo lt.eq B$ and $lr(bar.v.double W - S bar.v.double)_oo lt.eq 2 B$.
  If $D = W - S$ has twisted cut norm greater than $delta$, choose a twist and witnesses $f \,
    g$ giving correlation greater than $delta$. Quantize $f \, g$ uniformly within their bounds finely enough,
    with a mesh depending only on $B \, delta$, that their quantized product times the twist still correlates with
    $D$ by more than $delta \/ 2$. Refine the group partitions by the values of these quantized functions.
    The witness product is measurable for the new conditioning algebra and has $L^2$ norm at most one.
    Thus the new conditional expectation of $D$ has $L^2$ norm at least $delta \/ 2$.
    Since $D$ is orthogonal to the old conditioning algebra, the squared $L^2$ norm of the new conditional
    expectation of $W$ increases by at least $delta^2 \/ 4$. It is bounded above by $B^2$.
    At most $4 B^2 \/ delta^2 + 1$ refinements are possible. Each increases the partition sizes by a factor
    bounded in terms of $B \, delta$, so the final partitions have bounded size.
  On each product of group cells, the final conditional expectation is a bounded function of $Gamma$.
    Assign value zero to any impossible combination of a cell pair and Gram bits.
    Its finite Fourier expansion on the Gram bits has coefficients of absolute value at most $B$.
    Multiplying by the two cell indicators gives (12.5). The decomposition is exact everywhere on the product key
    space, regardless of which Gram bit values occur in a particular cell pair. ◻
]

We next prove that a small twisted-cut remainder is negligible on actual queries.
  This is the step that is not supplied by unary histograms alone.

#thm([Lemma 12.3.])[
  (A terminal remainder on actual inputs).  #emph[Let $I \,
    J$ be a nontrivial partition of some of the template positions.
    Let $D_n$ be a common function of their global keys with $lr(bar.v.double D_n bar.v.double)_oo lt.eq
    B_1$ and $lr(bar.v.double D_n bar.v.double)_(square.stroked.tiny \, cal(T)) lt.eq delta$.
    Let $psi_n \( I \, J \)$ be any product of the specified nominal $L \,
    R$ signs and global Gram signs crossing from $I$ to $J$, evaluated on their actual inputs and keys.
    For each fixed $epsilon_(upright("emp")) > 0$, except on exponentially small mixed mass,
#[#set math.equation(numbering: n => "(12.6)")
 $ sup_(\| f \| \, \| g \| lt.eq 1) \| bb(E)_(z_I \, z_J) D_n \( K_I \, K_J \) psi_n \( I \, J \) f \( O \, z_I \)
   g \( O \, z_J \) \| lt.eq #scale(x: 120%, y: 120%)[\(] C_3 delta + epsilon_(upright("emp")) +
   o \( 1 \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 4) . $ <eq:product-remainder-actual>]

 The constant $C_3$ and the vanishing error depend only on $B_1$ and the fixed template.
   The weights may depend arbitrarily on the fixed orientation. The exceptional set does not depend on those weights.]
] <lem:product-terminal-remainder>

#proof[
  For one fixed orientation, put $U \( I \, J \) = D_n \( K_I \, K_J \)
    psi_n \( I \, J \)$ and use independent copies of the parameter groups $I \, J$. Cauchy–Schwarz in $I$ gives
  $ \| bb(E) U \( I \, J \) f \( I \) g \( J \) \|^2 lt.eq bb(E)_I #scale(x: 120%, y: 120%)[\(] bb(E)_J
    U \( I \, J \) g \( J \) #scale(x: 120%, y: 120%)[\)]^2 . $
  Expand the square, and apply Cauchy–Schwarz in the two $J$ variables.
    The factors $g \( J_0 \) g \( J_1 \)$ have bound one. We obtain
  #[#set math.equation(numbering: n => "(12.7)")
   $ \| bb(E) U \( I \, J \) f \( I \) g \( J \) \|^4 lt.eq Q_n \( O \) :=
     bb(E)_(I_0 \, I_1 \, J_0 \, J_1) product_(a \, b in { 0 \, 1 }) U \( I_a \, J_b \) . $ <eq:product-four-corner>]
  In particular $Q_n \( O \) gt.eq 0$: it is the expectation over $J_0 \,
    J_1$ of the square of $bb(E)_I U \( I \, J_0 \) U \( I \, J_1 \)$.
    All separate weights, including their orientation dependence, have disappeared.
  The right-hand side is a bounded common input-and-key test,
    involving two fresh copies of each original position. It depends only on the primal maps:
    the channel-dependent weights and all marks have disappeared in (12.7), and the nominal $L \,
    R$ signs involve only the displayed fresh parameters. Repeated labels across these copies are permitted by 59.
    It follows that, outside an exponentially small mixed exceptional set,
  #[#set math.equation(numbering: n => "(12.8)")
   $ Q_n \( O \) lt.eq bb(E)_(sans(P)_0^2) Q_n + epsilon_(upright("emp")) . $ <eq:product-four-corner-typical>]
  We bound the raw mean by $C_3 delta + o \( 1 \)$.
  Fix the nominal inputs of the four groups. Their columns are jointly independent within each endpoint,
    component, and mode except with $2^(- Omega \( n \))$ probability, since all copies have fresh $Z$ inputs.
    The dependent-input contribution is $o \( 1 \)$ by the fixed sup bound.
    On the independence event, 23 gives the uniform image law with prescribed same-endpoint Grams and injectivity.
    Ignore injectivity at an exponentially small error and express this law relative to the product of all the
    individual single-key references. There are only boundedly many additional Gram bits,
    and their normalization is bounded uniformly in the nominal inputs by 53.
    Expand their indicators into characters. The nominal $L \, R$ phases are now constants.
    The global Gram phases already in the four copies of $psi_n$ can be combined with the expansion characters.
  For completeness, distinguish a slot by its group $I$ or $J$, its copy, its position, component, and sign.
    Remove the diagonals already in the reference and collapse repeated descriptions of the same unordered slot
    dot. Every remaining Gram coefficient belongs to exactly one of the following classes:
  + both slots lie in one of $I_0 \, I_1 \, J_0 \, J_1$;
  + the slots join $I_0$ to $I_1$, or $J_0$ to $J_1$;
  + the slots lie in one of the four $I_a$–$J_b$ quadrants.
  Class (a) contributes bounded separate group phases. Suppose a nonzero class-(b) pattern between $I_0 \,
    I_1$ remains. Fix both $J$ groups. The four $D_n$ factors split into two bounded functions of $I_0$ and $I_1$.
    The class-(c) phases become separate functions of those two groups, as do all class-(a) phases.
    Their only remaining interaction is the nonzero coefficient rectangle between $I_0$ and $I_1$,
    whose bit rank is at least $N$. The individual diagonal densities may also be absorbed into the respective
    bounded weights. 30 bounds this term by $O \( 2^(- N \/ 2) \)$.
    The same argument applies to a nonzero $J_0$–$J_1$ pattern.
  If neither class-(b) pattern remains, attach each class-(c) pattern as an available twist to its corresponding
    $D_n \( K_(I_a) \, K_(J_b) \)$. Fix $I_1 \, J_1$. The remaining integral in $I_0 \,
    J_0$ has one factor $D_n$ times an available twist, tested against bounded separate functions.
    The two other unfixed $D_n$ factors have bound $B_1$ and the fixed factor has bound $B_1$.
    The twisted cut estimate therefore bounds this term by $B_1^3 delta$,
    with the harmless fixed normalization factors included in the constant.
  These cases exhaust the character expansion. The groups $I$ and $J$ may each contain positions from both
    endpoints of the unit: this only removes some same-endpoint Gram bits from the expansion and does not create a
    new class. A nonzero coefficient rectangle has rank at least one in distinguished global slots,
    hence bit rank at least $N$. The two dots $P_a dot.op Q_b$ and $P_b dot.op Q_a$, for example,
    use different slots and are not duplicates. The prescribed nominal Gram values affect character coefficients
    only by signs.
  Summing the bounded number of terms and averaging the nominal inputs gives $bb(E)_(sans(P)_0^2) Q_n lt.eq
    C_3 delta + o \( 1 \)$. Combine this with (12.7) and (12.8).
    The same $Q_n \( O \)$ bounds every choice of separate weights, so the exceptional set is independent of them. ◻
]

#proof[
  If $r = 1$, quantize the values of $W_n$ in $\[ - B \, B \]$ with mesh at most $epsilon \/ 2$,
    choosing representatives in the same interval. The resulting $S_n$ satisfies
    $lr(bar.v.double W_n - S_n bar.v.double)_oo lt.eq epsilon \/ 2$ and is a linear combination of at most $1 +
    ceil.l 4 B \/ epsilon ceil.r$ global level-set indicators, with coefficients bounded by $B$.
    Both required errors are at most $epsilon \/ 2$, since the reference measure is a probability measure and the
    actual-query indicator and weights have bound one. This includes $B = 0$, when $S_n = 0$.
    For $r gt.eq 2$, apply 66 to a nontrivial split of the full set of positions.
    Recursively apply it to group factors in the structured terms until every factor is unary.
    Whenever a remainder is produced, leave that whole term terminal; do not expand its other factors.
    We obtain the exact decomposition, on the unconditioned product reference,
  #[#set math.equation(numbering: n => "(12.9)")
   $ W_n = S_n^(upright("tw")) + sum_(v in cal(V)_n) R_(v \, n) . $ <eq:product-recursive-decomposition>]
  Each structured term is a product of unary global functions times available Gram twists.
    Each terminal term has the form
  #[#set math.equation(numbering: n => "(12.10)")
   $ R_(v \, n) \( k \) = c_(v \, n) D_(v \, n) \( k_I \, k_J \) product_H f_(v \, H \, n) \( k_H \) thin
     tau_(v \, n) \( k \) \, $ <eq:product-terminal-form>]
  where $I \, J$ partition one group, the groups $H$ are disjoint outside $I union J$,
    all outside functions are bounded, $tau_(v \, n)$ is a product of available Gram signs,
    and $D_(v \, n)$ has a specified small twisted cut norm on $I \| J$.
    The sup bounds, numbers of terms, and partition complexities are all bounded independently of $n$.
  Here is an explicit way to organize the tolerance choices.
    Along any structured branch a split replaces one group by two, so at most $r -
    1$ splits are needed before all groups are unary. At any fixed depth the number of pending terms and all their
    coefficient and factor bounds have already been bounded using previous choices.
    Allocate at most $epsilon \/ \( 2 r \)$ of each desired final error to that depth,
    dividing this budget among its pending terms and their known outside bounds.
    Choose the next cut tolerances small enough for the reference estimates below and for the fourth roots in 67.
    These choices determine a finite bound on the next level’s number of structured terms.
    Continue for at most $r - 1$ levels. The empirical tolerance $epsilon_(upright("emp"))$ for each terminal test
    is chosen at the same stage, sufficiently small for its allotted fourth-root error.
    All choices are constants; none requires a change in the construction parameters or in $M_0$.
  On $cal(K)_n$, every Gram twist in $S_n^(upright("tw"))$ equals one.
    Removing them gives the function $S_n$ in (12.1). Its unary factors are indicators of the finite partitions
    used in the recursion; coefficients and term counts have the asserted bounds.
  To prove the reference assertion, multiply a terminal term (12.10) by a product of arbitrary bounded unary tests
    and expand the off-position Gram event defining $nu_n$. Fix all positions outside its remainder.
    Their group factors are bounded constants. Gram phases internal to $I$ or $J$ and phases involving a fixed
    outside position are separate bounded group weights. The only other phases are available crossing twists.
    Thus the integral is bounded by the twisted cut norm of $D_(v \, n)$ times a constant depending only on its
    known bounds and the fixed Gram normalization. The tolerance allocation makes the sum of these errors at most
    $epsilon$, proving (12.2). This estimate is uniform over all unary reference test functions.
  For the actual-query assertion, expand $cal(A)_n$ into its Gram and nominal $L \, R$ characters.
    The number of terms is bounded. Consider a terminal term and fix the outside position parameters.
    All phases internal to $I$ or $J$, or involving an outside position,
    can be absorbed into separate group weights. The remaining crossing phases are a product $psi_n \( I \, J \)$
    of precisely the form in 67. It is independent of the outside parameter values:
    a binary bit involving an outside position has already been put into a separate weight.
    All original unary weights, even when they depend on the orientation, can also be included in these two weights.
  Apply 67, scaling the known outside bounds as necessary. Its common four-copy test is independent of the fixed
    outside parameters, so one exceptional orientation set controls every such fixation.
    Integrate the outside parameters, sum the bounded binary-character expansion, and sum the terminal terms.
    The chosen cut and empirical tolerances make the total at most $epsilon$ for sufficiently large $n$.
    The union of the finitely many exceptional sets is exponentially small.
    Since each four-copy estimate is uniform over its separate weights,
    the final exceptional set is independent of all unary input weights and of orientation-only filters.
    This proves (12.3). ◻
]

#thm([Corollary 12.4.])[
  (Factorized integration of the approximant).  #emph[For the structured sum in (12.1) and arbitrary bounded unary
    input weights, outside exponentially small mixed mass,
#[#set math.equation(numbering: n => "(12.11)")
 $ & bb(E)_z cal(A)_n \( O \, z \) S_n \( K \( O \, z \) \) product_j w_j \( O \, z_j \)\
 & wide = kappa sum_(a = 1)^L c_(a \, n) product_j bb(E)_(z_j) #scale(x: 120%, y: 120%)[\[]
   f_(a \, j \, n) \( K_j \( O \, z_j \) \) w_j \( O \, z_j \) #scale(x: 120%, y: 120%)[\]] +
   o \( 1 \) . $ <eq:weak-product-factorized-integration>]

 The error is uniform over the unary weights. An orientation-only filter may be included before averaging this
   identity over leaves. In particular the same statement applies to marked mixtures and retained type/colour
   pairs as in 65.]
] <cor:weak-product-factorized-integration>

#proof[
  Apply 61 to each structured term, with $f_(a \, j \, n) \( K_j \) w_j$ as its unary weights.
    The number of terms and their bounds are fixed at the chosen approximation accuracy,
    so the sum of the exponentially small errors tends to zero.
    The exceptional set in that lemma is independent of these weights. ◻
]

#prodef([Remark 12.5.])[
  (What the two comparisons do not assert).  The reference error in (12.2) is weak testing error, not $L^1$ error.
    The actual comparison allows arbitrary orientation-dependent #emph[unary] parameter weights,
    and the specified binary Gram/$L \, R$ conditions. It does not allow an unprescribed joint input filter to be
    inserted without proof. For instance, two complementary bounded tuple densities determined by a high-rank
    global bilinear bit can have nearly uniform unary marginals and zero overlap.
    A two-element histogram net would not exclude that example.
    The additional actual-query conclusion of 65, proved by the four-copy expansion,
    is what rules it out for the successful-query format used here.
    All factors added to the common signature lists by this theorem are global key functions.
    Nominal input status bits remain weights, not common key cells in 63.
] <rem:weak-product-filter-class>

== 13 A common limit for successful queries <sec:common-limit>

We work with two independently sampled unit laws, which may be different.
  Each has a family of first-peeling leaves satisfying the per-leaf image bounds of 27;
  their mixtures satisfy the absolute joint and projected primal marginal bounds of (11.8).
  The restrictions supplied by 50 are one application; an independent pair of points will be another.
  All arguments in this section concern a sequence with $n arrow.r oo$, with the construction parameters,
  including $M_0$, fixed. We freely pass to subsequences, using the compactness and measurable-density
  constructions in 18. The leaves retain their actual mass weights.
  Conditional on a leaf, its orientation law is normalized;
  a restriction imposed on a query is never normalized away.
  More explicitly, if $w_(A \, n) \( L \)$ and $w_(B \, n) \( L' \)$ are the respective leaf probabilities,
  every average below uses $w_(A \, n) \( L \) w_(B \, n) \( L' \)$.
  Neither a uniform law on leaves nor a new normalization of an individual colour is permitted.
  The marginal hypotheses apply to these mixtures, not to their normalized leaves.

We also fix a permitted-pair indicator $J_n \( L_A \, L_B \) in { 0 \, 1 }$.
  It can test a finite colour mark or the ordered types of the two laws.
  Randomized colours are sampled as part of the original unit and then included in the leaf record.
  In particular, different-colour acceptance is a leaf-pair test.
  All statements about vanishing overlap and product zero below are restricted to $J_n = 1$;
  no assertion about the complementary pairs is needed.

The limit has two tasks. First, own-leaf nets and global projections pass truncated overlaps to a common space;
  uniform integrability then removes the truncation. Second,
  the actual-query and reference conclusions of 65 identify each limiting density for the successful-query format
  (13.1) from its unary status measures. Lemma 13.5, Lemma 13.6 combine these tasks in 76.
  A limit of unary marginals alone would not justify this conversion.

=== 13.1 Options and the permitted filters <options-and-the-permitted-filters>

#prodef([Definition 13.1.])[
  (Numerical option).  A numerical option specifies a recipe shape with between one and seven positions on each
    cross edge, together with the following data:
  + the endpoint, tag, label, flavor, and diagonal bit at every position;
  + the full numerical unary statuses required at those positions, including the tester summary,
    the role $a \( upright("atom") \)$, the basis coordinates of $T \( upright("atom") \, dot.op \) \|_(C_i)$,
    and the $p_i$ bit;
  + the required within-endpoint binary evaluations, and the off-position Gram conditions defining the reference
    key space;
  + the small tables and the finite coordinate formats in which they are written.
  The two sides have matching tags and diagonal bits position by position.
    All labels used at one endpoint are distinct. Coordinate formats of smaller dimension are padded by zeros.
] <def:limit-option>

Once the construction parameters have been chosen, the collection of options is finite.
  In particular, a large selector length does not make this collection grow with $n$.
  A basis of each $C_i$ was chosen on its own leaf. Its tensor coordinates in the projected pin bases,
  its $a$ values, the pin/projection relations, and the mandatory support exclusions all have bounded finite
  descriptions. No arbitrary ambient tensor is included in this metadata.

Fix an option $omega$ and a pair of leaves $\( L_A \, L_B \)$.
  Call the option #emph[usable] on this pair if its finite metadata satisfy the label and injection requirements
  and its numerical statuses imply (7.2), with its binary prescriptions supplying (7.3).
  Denote this indicator by $U_omega \( L_A \, L_B \)$. Usability is determined by bounded discrete metadata.
  The phase conditions in 50 will help us find usable options;
  they need not be added to the definition of usability. Likewise,
  prediction exceptions may remain orientation metadata. They restrict our later choice of an option,
  rather than its definition of usability on an entire leaf pair.

For a specified table, admissibility against pinned images is checked separately on the two orientations.
  Write these flags as $F_(A \, omega)$ and $F_(B \, omega)$.
  They may depend on both leaves, but each is a function of only one orientation once the leaves are fixed.
  The successful query on one side therefore consists exactly of

#[#set math.equation(numbering: n => "(13.1)")
 $ & upright("an orientation-only flag") med times med product_ell upright("a unary status indicator at ") ell\
 & #h(3em)  times med upright("the specified binary and Gram indicators") . $ <eq:limit-success-format>]

The parameter input at each position is independent and uniform in its specified flavor,
  conditional on the requested feasible diagonal bit. Only the diagonal conditioning is included in this input
  normalization. The other successful-query factors remain unnormalized.

#prodef([Remark 13.2.])[
  (Two different classes of flags).  The density nets in 57 cover arbitrary orientation filters and a bounded
    family of additional numerical flags. The factorization argument below uses the narrower format (13.1).
    It does not introduce an arbitrary additional joint predicate on the point parameters.
    In particular, membership in a nominal basis-bit cell is a status requirement,
    not a global key test on which all basis assignments are asserted to remain possible.
] <rem:limit-filter-boundary>

For the key shape of $omega$, let $\( cal(K)_n \, nu_n \)$ be the uniform reference space from 8.
  Define $d_(A \, n)^omega$ and $d_(B \, n)^omega$ to be the densities of the two successful queries with respect
  to $nu_n$, after averaging orientations in their normalized leaves. Their integrals are at most one. Set

#[#set math.equation(numbering: n => "(13.2)")
 $ I_n \( omega \) = bb(E)_(L_A \, L_B) J_n \( L_A \, L_B \) U_omega \( L_A \, L_B \) integral_(cal(K)_n)
   d_(A \, n)^omega d_(B \, n)^omega thin d nu_n . $ <eq:limit-option-overlap>]

Here the leaves are independent before the permitted-pair test, usability, or flag passage is tested.
  All restrictions in the integrand have already been charged to the subdensities.
  By 40, a positive lower bound for $I_n \( omega \)$ along a subsequence suffices for the desired collision.
  We shall analyze the contrary possibility

#[#set math.equation(numbering: n => "(13.3)")
 $ I_n \( omega \) arrow.r 0 wide upright("for every numerical option ") omega . $ <eq:limit-vanishing-overlap>]

=== 13.2 A global projection for independent leaf families <a-global-projection-for-independent-leaf-families>

The nets supplied by 57 are chosen separately for each leaf.
  The next elementary Hilbert-space argument produces the common partitions that will be needed in the limit.

#thm([Lemma 13.3.])[
  (Global projections with adaptive filter choices).  #emph[Let $\( K_n \, nu_n \)$ be finite probability spaces.
    On each first-side leaf $L$ and each second-side leaf $L'$ let there be a family of subdensities.
    Assume that, for each fixed $R < oo$ and $epsilon > 0$, their truncations at height $R$ have $L^1 \( nu_n \)$
    nets of uniformly bounded size, with the nets chosen using their own leaf only.
    The bounds may depend on $R \, epsilon$ but not on $n$ or the leaf.]
  #emph[For every $R < oo$ and $eta > 0$, there are deterministic partitions $cal(P)_n$ of uniformly bounded size
    such that the following holds. These partitions may depend on the leaf laws,
    but are chosen before the leaves are sampled. For independent leaves,
    choose a member $f$ and a member $g$ of the two truncated families,
    allowing either choice to depend on both leaves. If $P_n$ is conditional expectation onto $cal(P)_n$, then
#[#set math.equation(numbering: n => "(13.4)")
 $ bb(E) \| chevron.l f \, g chevron.r - chevron.l P_n f \, P_n g chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq
   eta . $ <eq:limit-projection-error>]

 The same conclusion holds for every deterministic refinement of $cal(P)_n$ chosen independently of the sampled
   leaves. Multiplication of the discrepancy by any indicator determined by the leaf pair does not increase the bound.]
] <lem:limit-global-projection>

#proof[
  We may truncate net representatives to $\[ 0 \, R \]$. Since $lr(bar.v.double f - g bar.v.double)_2^2 lt.eq
    R lr(bar.v.double f - g bar.v.double)_1$ for functions in this interval,
    we obtain $L^2$ nets with uniformly bounded size, say at most $m$. Pad shorter nets by zero functions.
    Write their members as $f_(L \, a)$ and $g_(L' \, b)$, and form the positive operators on $L^2 \( nu_n \)$
  $ C_A = bb(E)_L sum_(a = 1)^m f_(L \, a) ⊗ f_(L \, a) \, wide C_B =
    bb(E)_(L') sum_(b = 1)^m g_(L' \, b) ⊗ g_(L' \, b) . $
  Here $\( f ⊗ f \) v = f chevron.l f \, v chevron.r$. Both traces are at most $T = m R^2$.
  Fix $delta > 0$. There are at most $T \/ delta$ eigenvalues of $C_A$ larger than $delta$.
    A unit eigenfunction $e$ for such an eigenvalue $lambda$ satisfies, pointwise,
  $ \| e \( x \) \| lt.eq lambda^(- 1) bb(E)_L sum_a \| f_(L \, a) \( x \) \| thin \| chevron.l f_(L \, a) \,
    e chevron.r \| lt.eq T \/ lambda lt.eq T \/ delta . $
  Quantize these finitely many bounded eigenfunctions with a common finite partition.
    Its conditional expectation $P$ can be made to satisfy $lr(bar.v.double \( 1 - P \) e bar.v.double)_2 lt.eq
    epsilon$ for every one of them. With $Q = 1 - P$, the spectral decomposition gives
  $ lr(bar.v.double Q C_A Q bar.v.double)_(upright("op")) lt.eq delta + T epsilon^2 . $
  The number of partition cells is bounded in terms of $m \, R \, delta \, epsilon$.
    If $P'$ is a refinement and $Q' = 1 - P'$, then $Q' = Q' Q = Q Q'$,
    so the same operator bound holds for $Q' C_A Q'$.
  For net representatives, independence of the leaves gives
  $ bb(E)_(L \, L') sum_(a \, b) \| chevron.l f_(L \, a) \, g_(L' \, b) chevron.r - chevron.l P' f_(L \, a) \,
    P' g_(L' \, b) chevron.r #scale(x: 120%, y: 120%)[\|]^2 & = "Tr" \( Q' C_A Q' C_B \)\
 & lt.eq \( delta + T epsilon^2 \) T . $
  This estimate permits pairwise-adaptive choices: the squared error for any chosen pair of representatives is
    pointwise at most the displayed sum. Cauchy–Schwarz bounds its expected absolute error.
    Approximating arbitrary family members by their net representatives costs at most a constant times $R$ times
    the $L^2$ net error, since orthogonal projections are contractions.
    Choose the net accuracy, then $delta$ and $epsilon$, sufficiently small in terms of $eta$.
    This proves (13.4), also for refinements. The final indicator assertion follows from the absolute-value bound
    before the indicator is applied. ◻
]

For a fixed numerical option, all parameter-dependent predicates needed by one side can be put in a bounded
  own-leaf flag family: its own basis bits, tester outcomes,
  and prescribed binary tests are already fixed by the option.
  All remaining dependence on the opposite leaf is an orientation filter.
  Consequently 57 supplies the net hypothesis of 72 for all such filters simultaneously.
  No net need be chosen anew using the opposite leaf.

=== 13.3 Common signatures and stored conditional measures <common-signatures-and-stored-conditional-measures>

#thm([Lemma 13.4.])[
  (Common signature model).  #emph[There is a subsequence and a common limiting experiment with the following
    properties.]
  + #emph[For each tag and diagonal bit $\( l \, q \)$ there is a compact bit-sequence space $Xi_(l \, q)$ with
    reference law $m_(l \, q)$. For each key shape there is a compact tuple-test space $Upsilon$ with reference
    law $rho$. Here $rho$ denotes this measure, distinct from the scalar thinning parameter in 24.
    Its single-position projections $xi_ell$ have the independent laws $m_(l_ell \, q_ell)$.]
  + #emph[A base orientation array $theta$ contains its bounded discrete metadata and its single-atom status
    measures. For a unary type $t = \( i \, l \, s \, phi \, q \)$ and a full numerical status $upsilon$,
    these measures have jointly measurable densities
#[#set math.equation(numbering: n => "(13.5)")
 $ h_(t \, upsilon)^theta : Xi_(l \, q) arrow.r \[ 0 \, 1 \] \, wide sum_upsilon h_(t \, upsilon)^theta = 1 quad
   m_(l \, q) upright("-almost everywhere") . $ <eq:limit-unary-densities>]

 For the full generic flavor, the sum of these densities over statuses with any specified role and basis vector in
   the recorded actual dimension is bounded below by a positive construction constant, almost everywhere.
   Compatible finer tester requirements have the lower fractions supplied by 63.]
  + #emph[There is first a random limiting leaf-pair record $Z$, which includes two conditional laws $Lambda_A \,
    Lambda_B$ of the arrays and their finite flag vectors. Conditional on $Z$,
    the two orientation records are drawn independently from these laws.
    After flags are dropped and $Z$ is averaged out, $theta_A \,
    theta_B$ are independent with their respective base laws;
    they are identically distributed when the two original laws coincide.
    The record also includes the limiting permitted-pair bit $J \( Z \)$.]
  + #emph[Every discrete assertion of table usability, injection, and any imposed phase compatibility is retained,
    jointly with $J$ and with its probability. Thus the preparation guarantees from 50, when imposed,
    remain valid in this experiment: the no-prediction branch has a passed injecting table on mass at least $.99$,
    and the predicted branch has the stated positive mass of passed compatible injecting tables.
    Each imposed prediction whose error tends to zero is exact in the limiting status measures outside its stored
    exceptions. No prediction is required for the construction of the model itself.]
  #emph[All single-key tests used to define $Xi_(l \, q)$ are functions of global keys only.]
] <lem:limit-model>

#proof[
  Choose countable lists of global binary tests on each $Omega_(l \, q \, n)$.
    Include every imposed global predictor bit, if there is one.
    A key’s values under this list form its unary signature. For each key shape also choose countably many binary
    tests on $cal(K)_n$, including the pullbacks of all unary tests at its positions.
    Their values form a tuple signature.
  The lists are constructed by countable closure. For every numerical option, positive integer truncation height,
    and successively improving fixed accuracy, include the cells of a partition provided by 72.
    For every tuple cylinder test and successively improving accuracy,
    include all unary indicator factors needed in 65; close under the finite Boolean operations needed to record
    them. Repeat these operations. Every finite stage has bounded complexity independent of $n$,
    so it defines sequences of tests for all sufficiently large $n$;
    finitely many missing initial values may be assigned arbitrarily.
    Bounded coefficients in the approximations are also included among the scalar coordinates that will converge.
    Crucially, regularity in 65 is performed on key spaces. Its new unary factors remain global key functions.
    Nominal input phases handled in the proof of that theorem are not added to the signature lists.
  At an orientation, and for every unary type $t$, record the empirical mass of each finite signature cylinder
    together with each numerical status outcome. Include the finite metadata needed for the chosen $C_i$ bases and
    all numerical options; in predicted cases include the old marked profiles in these bases,
    the fixed role coefficients, and their exception sets. Call this array $theta_n$.
    The cylinder masses lie in $\[ 0 \, 1 \]$ and obey consistent finite additivity identities.
    Their closed consistency space, together with the finite metadata, is compact and metrizable.
  For each pair of leaves retain its permitted-pair bit $J_n$ and, as part of the same random record,
    the #emph[conditional measures] of $\( theta_n \, upright("flag vector") \)$ on each side.
    Also retain the full and truncated successful-query measures on all tuple cylinders, for each option.
    These are measures of mass at most one on compact bit-sequence spaces;
    their spaces are compact for weak convergence. Take a common subsequence of the laws on the resulting
    countable product, and simultaneously of the deterministic reference laws and the bounded approximation
    coefficients. Consistent limiting cylinder masses define countably additive measures on the bit-sequence
    spaces, for example by first defining the measure on finite prefixes and taking the unique measure with those
    finite-dimensional laws.
  Cylinder evaluation is continuous because bit cylinders are clopen.
    For each fixed unary cylinder, 59 says that the sum of its empirical status masses differs in probability from
    its reference mass by a quantity tending to zero. This test uses only primal images.
    The projected primal marginal assumption on the actual mixture is the one needed here;
    no original full-frame marginal bound and no assertion about every individually normalized leaf is used.
    The status bits may depend arbitrarily on channels: summing all statuses removes those bits.
    Countably many limiting cylinder equalities imply that the total status measure is $m_(l \, q)$ almost surely.
    Each status measure is therefore dominated by $m_(l \, q)$, giving (13.5).
    Versions jointly measurable in $\( theta \, xi \)$ are obtained by taking the limits of their conditional
    density averages on increasing finite cylinder partitions, as in 95.
    An exceptional null set for the base law also has $Lambda_A$- and $Lambda_B$-mass zero for almost every stored
    record on the respective side, because averaging these conditional laws recovers that side’s base law.
    The same is true after any flag restriction.
  For a generic role/basis assignment, apply 63 to each fixed cylinder of positive limiting reference weight.
    The lower fraction is independent of the cell; the onset of the estimate may depend on its positive weight.
    All profiles of the relevant rank are covered by that lemma before the profile is selected,
    so the chosen $C_i$ may vary with the entire orientation, including its channels.
    The $p_i$ flag is summed over in this positivity statement;
    no value of $p_i$ is prescribed as a positive base coordinate.
    Its lower inequalities pass to the limiting cylinder masses.
    Zero-reference cylinders already have zero total status mass.
    The cylinder inequalities extend by finite unions and monotone approximation to all measurable sets,
    giving the claimed almost-everywhere lower densities. This argument does not condition on arbitrary nominal
    input cells.
  By 55, every finite collection of unary signature tests has its product reference law in the tuple limit.
    Therefore the unary projections under $rho$ are independent with the stated marginal laws.
  There is no need to interchange disintegration and weak convergence.
    The conditional laws themselves were retained as random coordinates.
    For bounded continuous tests, taking their product is continuous in these two laws.
    Consequently sampling from $Lambda_A ⊗ Lambda_B$ conditional on the limiting record $Z$ reproduces the
    limiting joint orientation tests. Before flags are applied,
    the two base orientations were independent under their respective mixture laws at every $n$,
    so independence with those respective laws remains true after averaging $Z$ and dropping flags.
    If the laws agree, their limits agree as well. Finite metadata are discrete coordinates,
    hence all their incidence and compatibility identities are retained.
    This proves the table assertions and their mass statements.
    Finally the prediction errors tend uniformly to zero on the retained orientations.
    Since the predictor bits are included as unary tests, each such error is a finite status-cylinder mass and
    becomes zero in the limit. ◻
]

=== 13.4 Truncation and the zero-product implication <truncation-and-the-zero-product-implication>

Fix the common model from 73. For an option and a side, let $eta_R \( Z \)$ and $eta \( Z \)$ denote the limiting
  successful-query measures obtained respectively from $min \( d_n \, R \) nu_n$ and $d_n nu_n$.
  All are measures on the tuple space for that shape.

#thm([Lemma 13.5.])[
  (Passage of vanishing overlaps).  #emph[Assume (13.3). For almost every $Z$, the measures $eta_A \( Z \) \,
    eta_B \( Z \)$ are absolutely continuous with respect to $rho$.
    For each usable option their densities have product zero $rho$-almost everywhere on the event $J \( Z \) = 1$.]
] <lem:limit-zero-product>

#proof[
  For each integer $R$, cylinder inequalities give $0 lt.eq eta_R lt.eq R rho$,
    and the measures increase with $R$. The uniform small-set conclusion of 57 also gives uniform integrability of
    the successful-query densities. Indeed, since their masses are at most one, $nu_n { d_n > R } lt.eq 1 \/ R$;
    uniform small-set control bounds the mass on this set by a quantity tending to zero as $R arrow.r oo$,
    uniformly asymptotically in the leaf and in its orientation filter.
    Thus there is a deterministic function $epsilon_R arrow.r 0$ such that, in the limit,
  $ 0 lt.eq eta \( Z \) \( Upsilon \) - eta_R \( Z \) \( Upsilon \) lt.eq epsilon_R quad upright("almost surely") . $
  It follows that $eta = sup_R eta_R$. In particular it has a density which is the increasing supremum of the
    truncated limiting densities.
  Fix $R$. The prelimit inner product of the two truncated densities, multiplied by $J_n$ and usability,
    tends to zero because it is bounded above by (13.2). Choose a global partition with projection error at most
    $epsilon$ in 72. For that finite partition the inner product of the projected densities is
  $ sum_(C : thin nu_n \( C \) > 0) frac(eta_(A \, R \, n) \( C \) eta_(B \, R \, n) \( C \), nu_n \( C \)) . $
  This expression passes to its limiting counterpart in expectation,
    jointly with the discrete permitted-pair and usability indicators.
    A cell whose reference weight tends to zero contributes at most $R^2 nu_n \( C \)$ and may be omitted.
    On the other cells ordinary continuity applies.
  Take increasing cylinder partitions which generate all tuple tests and include global projection partitions at
    accuracies tending to zero. The refinement assertion in 72 preserves the error estimate.
    Conditional expectations of the limiting bounded densities on these partitions converge in $L^2 \( rho \)$:
    this follows, for instance, by approximating an $L^2$ function by cylinder-simple functions and using that
    conditional expectation is an $L^2$ contraction. Their inner products therefore converge in expectation,
    being bounded by $R^2$. We obtain
  $ bb(E)_Z J \( Z \) U_omega \( Z \) integral frac(d eta_(A \, R), d rho) frac(d eta_(B \, R), d rho) thin d
    rho = 0 . $
  All terms are nonnegative. Taking the countable intersection of the resulting almost-sure assertions,
    then increasing $R$, proves the same product-zero conclusion for the full densities on $J = 1$.
    Multiplication by $J$ is legitimate at the projection step because the projection error bound is in absolute
    value and permits every leaf-pair indicator. There are only finitely many options. ◻
]

=== 13.5 Identification of the full limiting density <identification-of-the-full-limiting-density>

For a side of an option, let $alpha_Z$ be the subprobability law of $theta$ obtained from its conditional law
  $Lambda$ by retaining the appropriate orientation flag. Let $t_ell \,
  upsilon_ell$ be its required unary type and status at position $ell$.
  Write $kappa > 0$ for the binary mixing constant for this side and numerical prescription.
  Constants on the two sides need not be denoted by the same letter.

#thm([Lemma 13.6.])[
  (Successful-query density).  #emph[For almost every $Z$, the full limiting successful-query measure on this side
    has density
#[#set math.equation(numbering: n => "(13.6)")
 $ G_Z \( u \) = kappa integral product_ell h_(t_ell \, upsilon_ell)^theta #scale(x: 120%, y: 120%)[\(]
   xi_ell \( u \) #scale(x: 120%, y: 120%)[\)] thin d alpha_Z \( theta \) wide \( u in Upsilon \) $ <eq:limit-density>]

 with respect to $rho$.]
] <lem:limit-density>

#proof[
  The displayed expression is jointly measurable and nonnegative, by 73.
    We prove equality against every tuple cylinder indicator $W$.
  At a fixed accuracy $epsilon$, apply 65 to its prelimit global key test $W_n$.
    On the reference key space its structured approximation has the form
  $ W_n^(\( epsilon \)) \( k \) = sum_(a = 1)^(m_epsilon) c_(a \, n) product_ell
    phi.alt_(a \, ell \, n) \( k_ell \) \, $
  where the number of terms and all bounds are fixed at this accuracy.
    The unary factors may be taken to be finite linear combinations of indicator factors already in the common
    test lists. In the actual-query assertion of that theorem,
    take as unary weights the numerical status indicators of this option. These may depend on the orientation.
    The extra admissibility condition is orientation-only. Thus, after averaging over leaves,
    the successful mass tested by $W_n$ differs from that tested by $W_n^(\( epsilon \))$ by at most the
    prescribed accuracy and a vanishing error.
  For clarity, this last use does not require typicality separately on every leaf.
    At a typical orientation the product-testing error is uniform over the allowed bounded unary weights.
    Multiplying by any orientation flag only decreases its bound.
    After both leaves are averaged, the mass of exceptional orientations is bounded by the mixed orientation error
    in 59. An opposite-leaf-dependent choice of the flag cannot increase that unconditional error.
  Apply 61 to each structured term. Again its unary weights are the status indicators times bounded global unary
    factors. The resulting expression is
  #[#set math.equation(numbering: n => "(13.7)")
   $ kappa integral sum_a c_(a \, n) product_ell
     (integral phi.alt_(a \, ell \, n) thin d eta_(t_ell \, upsilon_ell \, n)^(theta_n)) d
     alpha_(Z_n) \( theta_n \) \, $ <eq:limit-structured-mass>]
  up to a vanishing error at this fixed complexity. Here the measures inside the product are the empirical
    single-atom status measures at the given orientation. Every integral in parentheses is a finite linear
    combination of status-cylinder coordinates. The coefficients and conditional measures were stored in the
    compactification. Consequently (13.7) converges jointly with the successful cylinder mass to the analogous
    expression in the limit. The preceding errors are controlled in mean absolute value over $Z$.
  It remains to compare that limiting structured expression with the integral of $W G_Z$.
    This is where the #emph[reference] conclusion of 65 is also needed.
    Its error bound, uniform against products of bounded unary functions,
    passes to the limiting reference law first for cylinder-simple unary functions,
    since all the relevant finite test probabilities converge.
    It then holds for all bounded measurable unary functions on the signature spaces:
    approximate each one in $L^1 \( m_(l \, q) \)$ by cylinder-simple functions, and telescope the product.
    At this fixed approximation accuracy the structured test has a fixed finite bound,
    so this passage costs a quantity tending to zero.
  We may therefore use the unary functions $h_(t_ell \, upsilon_ell)^theta$ in the limiting reference comparison,
    for each $theta$, and integrate it under the subprobability law $alpha_Z$.
    Independence of the unary projections under $rho$ gives
  $ integral W^(\( epsilon \)) \( u \) G_Z \( u \) thin d rho \( u \) & =
    kappa integral sum_a c_a product_ell
    (integral phi.alt_(a \, ell) \( xi \) h_(t_ell \, upsilon_ell)^theta \( xi \) thin d m_(l_ell \, q_ell) \(
    xi \)) d alpha_Z \( theta \) . $
  This is exactly the limit of (13.7). Replacing $W^(\( epsilon \))$ by $W$ in this last integral costs at most
    $kappa$ times the reference approximation accuracy. Combining the empirical and reference estimates and
    sending $epsilon arrow.r 0$ yields
  $ bb(E)_Z lr(|eta \( Z \) \( W \) - integral W G_Z thin d rho|) = 0 . $
  There are countably many cylinder indicators. Equality on all of them determines the measures and proves the lemma. ◻
]

#thm([Proposition 13.7.])[
  (The limiting overlap obstruction).  #emph[Assume (13.3).
    In the common experiment of 73, almost every sampled pair of orientation records with $J \( Z \) =
    1$ has the following property: there is no usable numerical option whose two orientation flags pass and for
    which, at every matched position,
#[#set math.equation(numbering: n => "(13.8)")
 $ integral_(Xi_(l \, q)) h_(t_A \, upsilon_A)^(theta_A) \( xi \) h_(t_B \, upsilon_B)^(theta_B) \( xi \) thin d
   m_(l \, q) \( xi \) > 0 . $ <eq:limit-positive-generator>]

]
] <prop:limit-overlap>

#proof[
  For a usable option, Lemma 13.5, Lemma 13.6 give $integral G_(A \, Z) G_(B \, Z) thin d rho =
    0$ for almost every $Z$ with $J \( Z \) = 1$. Fubini’s theorem and independence of the unary projections
    express this integral as
  $ kappa_A kappa_B integral #h(-0.16667em) integral product_ell
    (integral h_(t_(A \, ell) \, upsilon_(A \, ell))^(theta_A) \( xi \) h_(t_(B \, ell) \, upsilon_(B \,
    ell))^(theta_B) \( xi \) thin d m_(l_ell \, q_ell) \( xi \)) thin d alpha_(A \, Z) \( theta_A \) thin d
    alpha_(B \, Z) \( theta_B \) . $
  All factors are nonnegative and both $kappa$ constants are positive.
    Hence the product inside is zero for almost every passed pair from the conditional laws.
    Averaging $Z$ and taking the finite union over options proves the assertion. ◻
]

== 14 Solving the status constraints <sec:status-span>

We now construct the options forbidden by 76. The argument takes place in the common signature model,
  but the no-prediction alternative will require a transfer back to global functions on the finite key spaces.
  We show that a positive mass of permitted pairs with soluble scalar constraints forces positive key overlap.
  Applied to the prepared coloured law, the collision criterion then supplies a four-hole event between different
  colours.

Write the endpoints of the two units as $\( A \, 1 \) \, \( A \, 2 \)$ and $\( B \, 1 \) \, \( B \, 2 \)$.
  In this section $h_(A \, i)$ or $h_(B \, j)$ denotes an atom’s role bit $a \( upright("atom") \)$,
  not the channel dimension. The basis status vector at an endpoint is denoted by $upright(bold(x))$,
  and its dimension is the recorded dimension of that endpoint’s effective space $C_i$.

=== 14.1 Generators and the coupled linear system <generators-and-the-coupled-linear-system>

Fix two orientation arrays $theta_A \, theta_B$ satisfying the almost-sure conclusions of 73.
  Some labels at each endpoint may be excluded. In particular,
  the mandatory support exclusions from (6.4) are always excluded.

#prodef([Definition 14.1.])[
  (Available generator).  On the cross edge $\( i \, j \)$, a vector
  #[#set math.equation(numbering: n => "(14.1)")
   $
     g = \( q \, h_(A \, i) \, h_(B \, j) \, upright(bold(x))_(A \, i) \, upright(bold(x))_(B \, j) \, p_(A \,
     i) \, p_(B \, j) \) $ <eq:status-generator-vector>]
  is an available generator if some common tag, surviving label at each end,
    and allowed flavors give positive overlap as in (13.8) for these entries.
    Entries of the tester summary not displayed in (14.1) are summed over.
    A generator is retained with one such certificate of its tags, labels, and flavors.
  Let $V_(i j)$ be the binary span of these generators. Its #emph[base projection] forgets the final two $p$
    entries and has target
  $ B_(i j) = bb(F)_2 xor bb(F)_2 xor bb(F)_2 xor bb(F)_2^(dim C_(A \, i)) xor bb(F)_2^(dim C_(B \, j)) . $
] <def:status-generator>

For any surviving pair of labels and any tag, the full generic flavor gives at least one available generator above
  every base vector. Indeed, at fixed $q$ the sum of the status densities with any requested role/basis assignment
  is bounded below almost everywhere by 73. The product of the two such sums has positive integral on the common
  signature space. Splitting its finite sum over the two $p$ bits yields an available generator.
  Both diagonal bits are feasible in the full generic flavor. Thus

#[#set math.equation(numbering: n => "(14.2)")
 $ V_(i j) arrow.r B_(i j) upright(" is surjective") \, wide dim ker \( V_(i j) arrow.r B_(i j) \) lt.eq
   2 . $ <eq:status-full-projection>]

This remains true after any exclusions leaving surviving generic labels.

Fix a small table. Its local target basis vectors are the evaluations of

$ \( a + \( u_(B \, j) U_(A \, i) \)^(*) \) \|_(C_(A \, i)) \,
  wide \( a + \( u_(A \, i) U_(B \, j) \)^(*) \) \|_(C_(B \, j)) \, $

in the recorded bases. Denote these vectors by $upright(bold(t))_(A \, i \; j)$ and
  $upright(bold(t))_(B \, j \; i)$, respectively. We seek one sum vector $v_(i j) in V_(i j)$ for each cross edge,
  subject to

#[#set math.equation(numbering: n => "(14.3)")
 $ q_(i j) & = 1 \, & h_(A \, i \; i j) + h_(B \, j \; i j) & = 1 \,\
upright(bold(x))_(A \, i \; i j) & = upright(bold(t))_(A \, i \; j) \, & upright(bold(x))_(B \, j \; i j) & =
  upright(bold(t))_(B \, j \; i) \, $ <eq:status-local-targets>]

#[#set math.equation(numbering: n => "(14.4)")
 $ sum_(i = 1)^2 \( p_(A \, i \; i j) + h_(A \, i \; i j) \) & = 0 &  & \( j = 1 \, 2 \) \,\
sum_(j = 1)^2 \( p_(B \, j \; i j) + h_(B \, j \; i j) \) & = 0 &  & \( i = 1 \, 2 \) . $ <eq:status-coupled-targets>]

These are precisely the scalar recipe equations (7.2). The occurrence of a given endpoint in two different sums is
  distinguished by its edge subscript. By 39, these are the effective-space conditions needed for the full
  gradients; the attack-atom conditions are supplied by (7.3).
  This use does not require pins to be supported at individual endpoints.
  The realization theorem already treats the mixed pin spaces through their projections and the injection hypothesis.

#thm([Lemma 14.2.])[
  (Dual relations).  #emph[Any obstruction to the scalar system has a nonzero vector of weights
    $\( s_1 \, s_2 \, r_1 \, r_2 \) in bb(F)_2^4$. On every edge span $V_(i j)$ these give a relation
#[#set math.equation(numbering: n => "(14.5)")
 $ s_j \( p_(A \, i) + h_(A \, i) \) + r_i \( p_(B \, j) + h_(B \, j) \) =
   upright(bold(c))_(i j) dot.op upright(bold(x))_(A \, i) +
   upright(bold(c))'_(i j) dot.op upright(bold(x))_(B \, j) + beta_(i j) \( h_(A \, i) + h_(B \, j) \) +
   gamma_(i j) q $ <eq:status-dual-relation>]

 for suitable coefficients. The scalar system is soluble if, for every such relation,
   the sum of the right sides evaluated at the local targets is zero.]
] <lem:status-duality>

#proof[
  Apply finite-dimensional duality to the linear constraint map on $xor.big_(i \, j) V_(i j)$.
    The coefficients of the four coupled equations are $s_j \, r_i$, giving (14.5) separately on each edge.
    If they were all zero,
    the local projection onto
    $\( q \, h_(A \, i) + h_(B \, j) \, upright(bold(x))_(A \, i) \, upright(bold(x))_(B \, j) \)$ would be
    surjective by (14.2), forcing all other dual coefficients to vanish.
    Hence a nonzero obstruction uses some coupled equation. Conversely the constraint target lies in the image
    exactly when it annihilates every dual relation. The coupled targets are zero,
    so their evaluated contribution is the sum stated in the lemma. ◻
]

=== 14.2 A dual pattern on positive mass gives a global prediction <a-dual-pattern-on-positive-mass-gives-a-global-prediction>

Call a pair of arrays #emph[obstructable] if there are total exclusion sets of size at most $B_(*)$ at each
  endpoint, containing the mandatory exclusions, and some nonzero weights for which (14.5) holds throughout.
  We do not require the relation to take a nonzero value on a particular table target.
  This stronger event is useful because its complement works for every table.

#thm([Lemma 14.3.])[
  (Extraction of a global prediction).  #emph[On the no-prediction alternative of 50,
    the probability that the iid base arrays are obstructable is less than $.1$.]
] <lem:status-global-prediction>

#proof[
  Suppose otherwise. Let $E_s$ be the event that a witnessing relation has some $s_j = 1$,
    and define $E_r$ similarly. Interchanging the two iid units interchanges these events,
    so they have the same probability. Their union is the obstructable event. Therefore $bb(P) \( E_s \) gt.eq .05$.
  Fix a witness with $s_j = 1$. For each first-side endpoint $i$, rewrite its edge relation as
  #[#set math.equation(numbering: n => "(14.6)")
   $ p_(A \, i) + upright(bold(c))_(i j) dot.op upright(bold(x))_(A \, i) + \( 1 + beta_(i j) \) h_(A \, i) =  &
     r_i p_(B \, j) + upright(bold(c))'_(i j) dot.op upright(bold(x))_(B \, j) + \( r_i + beta_(i j) \)
     h_(B \, j) + gamma_(i j) q . $ <eq:status-deterministic-comparison>]
  For any surviving label/flavor choices and any common feasible $\( l \, q \)$,
    this equality holds almost surely under the product of the two status distributions conditional on the same
    signature. Otherwise a violating pair of numerical statuses would have positive overlap and would be a
    generator violating the relation. The two bits in (14.6) are conditionally independent at a fixed signature.
    If two independent bits agree almost surely, both are constant almost surely with their common value:
    writing their success probabilities as $a \, b$, the mismatch probability $a \( 1 - b \) + \( 1 - a \)
    b$ is zero only for $\( a \, b \) = \( 0 \, 0 \)$ or $\( 1 \, 1 \)$.
  Compare all surviving first-side choices to one fixed generic surviving choice at $\( B \, j \)$.
    Its total conditional status mass is one on every signature space, and its generic flavor admits either $q$.
    It follows that, simultaneously over all tags, feasible bits, labels and flavors remaining at $\( A \, i \)$,
  #[#set math.equation(numbering: n => "(14.7)")
   $ p_(A \, i) = T \( lambda_(A \, i) \, upright("atom") \) + alpha_(A \, i) h_(A \, i) +
     f_i \( l \, q \, xi \) \, $ <eq:status-extracted-prediction>]
  where $lambda_(A \, i)$ is the basis combination specified by $upright(bold(c))_(i j)$ and $alpha_(A \, i) = 1 +
    beta_(i j)$. The coefficients are common to these choices.
    The offset is also common across them; one does not choose a new offset for every label or flavor.
  There are very few possible offsets after the second-side array is fixed.
    If $r_i = 0$, generic positivity of the role and basis at $\( B \, j \)$ forces $upright(bold(c))'_(i j) =
    0$ and $beta_(i j) = 0$ in (14.6). The offset is then either zero or $q$.
    If $r_i = 1$, it is, up to a common multiple of $q$, the deterministic value of
  #[#set math.equation(numbering: n => "(14.8)")
   $ p_(B \, j) + upright(bold(c))' dot.op upright(bold(x))_(B \, j) +
     alpha' h_(B \, j) . $ <eq:status-opposite-offset>]
  For this fixed array and endpoint there is at most one possible deterministic expression (14.8),
    including its coefficients, even if the permitted exclusions vary.
    Indeed two candidate exclusion sets of size at most $B_(*)$ have a common surviving generic label,
    since the label universe is larger than $2 B_(*)$. At that label every role/basis assignment has positive
    density conditional on the signature. Subtracting the two claimed deterministic expressions therefore forces
    their coefficient differences to be zero, and then their offset functions agree almost everywhere on every
    $\( l \, q \)$ space. The same generic label can be used at every tag and diagonal bit.
  Thus, for a fixed second-side array, each choice of $j$ supplies at most four offsets for each first-side
    endpoint: the two multiples of $q$, and the unique function (14.8) plus those two multiples,
    if that function exists. Across both choices of $j$ there are at most $2 dot.op 4^2 = 32$ pairs $\( f_1 \, f_2 \)$.
  All events used here are measurable. There are finitely many types, status vectors, coefficients,
    and exclusion sets, and generator availability is a positivity test on the integral of jointly measurable
    densities. By Fubini, choose a fixed second-side array for which the first-side mass of $E_s$ exceeds $.04$.
    One of the at most 32 pairs of offset functions then gives (14.7) on first-side mass at least
    $delta_0 = .04 \/ 32$, allowing its coefficients and exclusion sets to vary with the first-side array.
    This is much larger than $10^(- 6)$.
  We now transfer these fixed signature functions to a prediction in the finite problem.
    This step is necessary because the definition of prediction asks for global functions of actual keys.
    For any $epsilon > 0$, approximate each fixed binary function $f_i$ by a binary cylinder function
    $f_i^(\( epsilon \))$, with disagreement measure at most $epsilon$ on each of the finitely many $\( l \, q \)$
    reference spaces. Such approximation follows by approximating the measurable event where $f_i =
    1$ in measure by the algebra of finite cylinders. The total unary measure of every type is its reference
    measure, so replacing $f_i$ increases every relation error in (14.7) by at most $epsilon$.
  For fixed cylinder functions and a fixed choice of coefficient bits and exclusions,
    all these error probabilities are finite linear combinations of status-cylinder coordinates.
    Their maximum over the remaining unary types is continuous.
    Minimizing over the finitely many permitted coefficient/exclusion choices is also continuous,
    separately on each discrete coordinate format. The strict event that this minimum is below $2
    epsilon$ consequently has limiting probability at least $delta_0$.
    Weak convergence implies that its prelimit probability exceeds $delta_0 \/
    2$ for all sufficiently large indices. One may see this directly by approximating the indicator of an open
    strict-error event from below by continuous functions.
  Choose decreasing $epsilon_m arrow.r 0$ and increasing prelimit indices at which the last mass bound holds.
    At index $m$ use the two global functions obtained by evaluating $f_i^(\( epsilon_m \))$ on the actual global
    key signature. Keep the orientations in the strict-error event and choose one of their successful
    coefficient/exclusion records. The kept mass is at least $delta_0 \/ 2 > 10^(- 6)$,
    and the maximum relation error over all remaining unary types tends uniformly to zero.
    Conditional-on-$q$ errors give the same conclusion for the unconditioned flavor tests.
    These are precisely the requirements of 46. The no-prediction branch has only the first effective spaces and
    only negligible trimming, so this mass margin also gives a prediction before that trimming.
    This contradiction proves the lemma. ◻
]

=== 14.3 The predicted dual relations <the-predicted-dual-relations>

In the predicted alternatives, exclude the stored prediction exceptions as well as the mandatory support
  exclusions. Write the marked profiles as $lambda_(A \, i)$ and $lambda_(B \, i)$.
  The constants $alpha_i$ and the functions $f_i$ are common by endpoint index across units.
  Put $d_i = 1 + alpha_i$. The prepared class $e_i = \( d_i \, \[ f_i \] \)$ is as in (10.2):
  functions are first identified almost everywhere on all tag/bit signature spaces,
  and then quotiented by the span of the one function $q$, with a common coefficient on those spaces.

In a limiting table computation, use the notation

#[#set math.equation(numbering: n => "(14.9)")
 $ sans(u)_(B \, j) \( Delta_A \) = sum_(i = 1)^2 \( u_(B \, j) U_(A \, i) \)^(*) \( lambda_(A \, i) \) \, wide
   sans(u)_(A \, i) \( Delta_B \) = sum_(j = 1)^2 \( u_(A \, i) U_(B \, j) \)^(*) \( lambda_(B \, j) \) .
   $ <eq:status-table-delta>]

These are finite contractions in the recorded table coordinates.
  The notation does not require retaining an ambient tensor $Delta$ in the compactification.

#thm([Lemma 14.4.])[
  (Predicted scalar compatibility).  #emph[For a predicted pair with a table satisfying the compatibility
    conditions of 50, the system (14.3)–(14.4) is soluble. The assertion survives any further bounded label
    exclusions leaving generic labels.]
] <lem:status-predicted>

#proof[
  The exact limiting prediction is
  $ p_(A \, i) = bold(lambda)_(A \, i) dot.op upright(bold(x))_(A \, i) + alpha_i h_(A \, i) + f_i \, wide
    p_(B \, j) = bold(lambda)_(B \, j) dot.op upright(bold(x))_(B \, j) + alpha_j h_(B \, j) + f_j \, $
  where bold $bold(lambda)$ denotes coordinates in the effective basis.
    Substitute this into a dual relation (14.5). At a fixed signature the two generic status distributions have
    every pair of role/basis assignments available. Comparing their coefficients forces
  #[#set math.equation(numbering: n => "(14.10)")
   $ upright(bold(c))_(i j) & = s_j bold(lambda)_(A \, i) \, & upright(bold(c))'_(i j) & =
     r_i bold(lambda)_(B \, j) \, & beta_(i j) & = s_j d_i = r_i d_j \,\
s_j f_i + r_i f_j & = gamma_(i j) q . $ <eq:status-forced-coefficients>]
  Thus
  #[#set math.equation(numbering: n => "(14.11)")
   $ s_j e_i = r_i e_j wide \( i \, j in { 1 \, 2 } \) . $ <eq:status-class-equations>]
  Equality of functions here is exactly the almost-everywhere equality recorded in the prepared subsequential class.
  If both $e_i$ vanish, 47 supplies the exact identity $p_i = T \( lambda_i \, upright("atom") \) +
    h_i$ on all atoms. Hence on each span $p_i + h_i = bold(lambda)_i dot.op upright(bold(x))_i$.
    At the local targets, the first coupled sum for a fixed $j$ is
  $ sum_i a \( lambda_(A \, i) \) + sans(u)_(B \, j) \( Delta_A \) = c + sans(u)_(B \, j) \( Delta_A \) = 0 $
  by the empty-status compatibility condition. The reciprocal coupled sums vanish in the same way.
    Local surjectivity therefore solves all constraints in this case.
  Suppose that some $e_i$ is nonzero. A nonzero solution of (14.11) is possible only when all nonzero $e_i$ are
    equal, and then both weight vectors are the indicator of their support $S$.
    To check this without any assumption on the dimension of the function space,
    first consider a support with one index, say $e_1 eq.not 0 \, e_2 = 0$.
    The off-diagonal equations force $r_2 = s_2 = 0$, and the diagonal gives $s_1 = r_1 =
    1$ for a nonzero solution. If both $e_i$ are nonzero, the diagonal equations give $s_i = r_i$.
    The off-diagonal equation $s_2 e_1 = s_1 e_2$ either makes both weights zero, or makes both one and $e_1 =
    e_2$. These cases exhaust the possibilities.
  If the two nonzero classes are unequal, no dual obstruction exists.
    Otherwise let $d$ be the common first bit on $S$. With $s_i = r_i = upright(bold(1))_(i in S)$,
    (14.10) is symmetric in $i \, j$. Its diagonal is zero. Since the function $q$ is not zero on the family of
    reference spaces, this gives $gamma_(i j) = gamma_(j i)$ and $gamma_(i i) = 0$.
    The sum of all four $q$-contributions to a target is therefore zero. The total role contribution is
  $ sum_(i \, j) beta_(i j) = \| S \| d quad upright("in ") bb(F)_2 . $
  Evaluate the basis terms in (14.10) at their local targets.
    The $a$-terms sum to $\| S \| c + \| S \| c = 0$, because 50 fixed the same value $c =
    sum_i a \( lambda_i \)$ in both units. The remaining terms are
  $ sum_(j in S) sans(u)_(B \, j) \( Delta_A \) + sum_(i in S) sans(u)_(A \, i) \( Delta_B \) . $
  By (10.8), this equals $\| S \| d$. Together with the role contribution it is zero.
    Thus every dual relation vanishes on the target, and 78 proves solvability.
    The argument used only surviving generic labels and the prediction on those labels,
    so additional exclusions of the indicated kind do not change it. ◻
]

#thm([Lemma 14.5.])[
  (Scalar solvability on positive mass).  #emph[In each positive-mass alternative of 50,
    the common experiment has positive mass of passed injecting tables for which the scalar system is soluble,
    robustly under the exclusions needed below. On the no-prediction branch this holds whenever the total
    exclusions stay within $B_(*)$ per endpoint. On a predicted branch it holds after the stored exceptions and
    any further bounded exclusions leaving generic labels.]
] <lem:status-span>

#proof[
  Without prediction, the probability of an obstructable base pair is less than $.1$ by 79.
    This statement uses the unflagged iid base law. In the full conditional-law experiment,
    a passed injecting table exists on mass at least $.99$ by 73.
    Their intersection therefore has mass greater than $.89$.
    On it no nonzero dual pattern exists for any exclusions within the stated budget,
    so 78 solves the scalar system for every such table. No independence of the two events is being assumed.
  With prediction, a passed compatible injecting table exists on positive mass in the same experiment.
    The exact prediction and all almost-sure unary properties continue to hold on that event,
    and 80 gives the assertion. ◻
]

=== 14.4 Stable spans and fresh short lists <stable-spans-and-fresh-short-lists>

It remains to replace a vector in an edge span by a short list of actual generators,
  using distinct labels across both lists at an endpoint. The small dimension in (14.2) is decisive.

#thm([Lemma 14.6.])[
  (Fresh lists of at most seven generators).  #emph[On any pair for which scalar solvability survives the bounded
    exclusions specified in 81, further bounded exclusions can be made so that every scalar solution on the
    resulting four edge spans can be realized by between one and seven available generators per edge.
    The two endpoint labels of each generator are retained with its certificate,
    and all labels used at an endpoint are distinct across its two incident lists.
    Every realized matched position has positive status overlap.]
] <lem:fresh-lists>

#proof[
  Begin with the mandatory support exclusions and, in the predicted case, the stored exceptions.
    More generally, start with the initial exceptions allowed by the scalar-solvability hypothesis.
    Whenever deleting at most 100 additional labels at each endpoint can shrink any of the four edge spans,
    make such a deletion. Each span continues to project onto its full base space.
    Its dimension exceeds that base dimension by at most two,
    so there are at most eight dimension-reducing steps in total.
    At the end, every edge span is unchanged by deleting up to 100 further labels at each endpoint.
    There remain generic labels, since (6.5) makes the label universe much larger than all these bounded
    exclusions. On the no-prediction branch the total budget, including later fresh-label removals,
    is at most $B_0 + 900 < B_(*)$. On a predicted branch it is at most the stored exceptions plus this quantity,
    still leaving many generic labels. Scalar solvability is retained by the scalar-solvability hypothesis.
    Fix one solution on these stabilized spans.
  We prove a statement for one edge after any labels used on earlier edges have also been reserved.
    Write its stabilized span as $V$, its base space as $B$, and its projection as $"pr"_B$.
    Let $G_L$ be the generators avoiding the current reserved sets $L$. Their span is still $V$.
    Let $H_L$ be the span of sums of one, two, or three members of $G_L$ whose total base projection is zero and
    whose endpoint labels are mutually disjoint within that word. We claim
  #[#set math.equation(numbering: n => "(14.12)")
   $ H_L = ker "pr"_B . $ <eq:status-short-kernel>]
  To prove the claim, take two generator lifts of the same $b in B$.
    There is a third generic lift of $b$ at labels avoiding both of them and $L$.
    Comparing each original lift to this third one gives an allowed two-generator kernel word.
    Hence all lifts of $b$ have the same class modulo $H_L$. Call that class $ell \( b \)$.
    A generator above base zero is itself an allowed one-generator kernel word, so $ell \( 0 \) = 0$.
    Choose mutually label-disjoint generic lifts of $b \, c \, b + c$.
    Their sum is an allowed three-generator kernel word, and therefore $ell \( b \) + ell \( c \) =
    ell \( b + c \)$. The generators span $V$, so this additive lift identifies $V \/ H_L$ with $B$:
    the induced projection is inverse to $ell$. This proves (14.12), including the case of zero base projection.
  For the desired vector in $V$, first choose a generic singleton lift of its base projection. Reserve its labels.
    The remaining discrepancy belongs to $ker "pr"_B$, whose dimension is at most two.
    On the remaining labels (14.12) still holds because stability has preserved $V$.
    If the kernel is zero no correction is needed. If it is one-dimensional,
    choose a nonzero short kernel word and use it if needed. If it is two-dimensional,
    choose a nonzero short word, reserve its at most three labels at each end, and apply (14.12) again.
    The new short words still span the full kernel, so one lies outside the first word’s direction.
    These two words form a basis and the discrepancy is the sum of an appropriate subset of them.
    This uses at most $1 + 3 + 3 = 7$ generators. The initial lift is always retained, so the list is nonempty;
    reserving labels before each choice ensures disjointness even when two generators have the same numerical bit
    vector.
  Carry out this procedure on the four edges in turn. Each endpoint is incident to only two lists and uses at most
    fourteen labels in total. All removals and auxiliary freshness comparisons in the procedure are within the
    100-label stability allowance. The generators keep their certificates of positive overlap, proving the lemma. ◻
]

=== 14.5 Positive overlap on permitted pairs <positive-overlap-on-permitted-pairs>

#thm([Proposition 14.7.])[
  (Positive-mass overlap).  #emph[Consider two independent unit laws with actual leaf weights,
    the mixed caps (11.8), the final per-leaf image bounds, and a permitted-pair indicator $J_n$ as in 13.
    Suppose their common model has positive mass of pairs with $J =
    1$ admitting a passed injecting table whose scalar system is soluble after every bounded exclusion used by 82.
    Then some fixed numerical option has expected unnormalized,
    permitted-pair overlap bounded below by a positive constant along a subsequence.
    Consequently it satisfies (8.3), with the same permitted-pair predicate. The two laws need not coincide.
    If the original laws additionally satisfy the hypotheses of 40,
    its probability bound holds along the same subsequence, with any initial restrictions of reciprocal mass
    $2^(o \( N \))$ charged to that probability.]
] <prop:positive-overlap>

#proof[
  Work on the subsequence defining the common model in the hypothesis.
    If the conclusion failed, finiteness of the option collection would give (13.3) along this same subsequence.
    Apply 76 in this model.
  By hypothesis, there is positive model mass of permitted pairs with a table whose flags pass and whose scalar
    solution survives the needed exclusions. Apply 82. This gives between one and seven matched generators per
    edge with fresh allowed labels. Their sum vectors obey (14.3) and (14.4); equivalently,
    the lists obey all scalar recipe equations. At each generator the unspecified tester bits were only
    aggregated. Expanding the positive overlap integral as a finite sum over the two full tester summaries yields
    at least one pair of summaries for which the overlap is still positive.
    Make that refinement independently at each position.
  The scalar consistency argument in 7, in particular (7.3),
    now supplies a consistent numerical prescription of the required within-endpoint binary bits from these
    summaries and $p$ bits. Together with the already passed table, these data define a usable numerical option.
    The only parameter filters added are precisely the unary statuses and the prescribed binary conditions in
    (13.1). At every matched position the refined status overlap is positive.
    This contradicts 76 on a positive-mass event.
  No pointwise uniform lower bound for these individual positive integrals is needed.
    The options form a finite collection and every product has finitely many nonnegative factors.
    A positive-mass event on which some such product is positive gives positive expectation for at least one
    option. Its lower bound is a constant on the chosen subsequence, however small that constant may be.
    The preceding contradiction therefore proves the stated subsequential lower bound.
  For this probability consequence, assume additionally that the original laws satisfy the hypotheses of 40.
    The successful densities are unnormalized with respect to the retained law,
    and 40 explicitly charges any law restriction of reciprocal mass $2^(o \( N \))$.
    A positive constant, or its product with such restriction costs, is $2^(- o \( N \))$.
    The resulting four-hole probability, including the permitted-pair predicate,
    has exponent at most $k_max + .03 + o \( 1 \)$, whereas
  $ 100 g - \( k_max + .03 \) = 44 g + 55.97 > 0 . $
  Thus these overlaps are on the scale required for 25. ◻
]

=== 14.6 The coloured unit distribution test <the-coloured-unit-distribution-test>

#thm([Proposition 14.8.])[
  (Different-colour conflicts).  #emph[Let the early constant $eta_(upright("col")) > 0$ satisfy
$ eta_(upright("col")) < 1 / 4 c_(*) \, wide c_(*) := delta_(*)^2 / 64 \, $

 where $delta_(*)$ is the retained-mass margin in (10.9). This choice depends on the original endpoint bound $M$
   and the early geometric constants, and precedes the selector and channel dimensions.
   For every fixed finite palette and all sufficiently large $n$,
   a unit law with both endpoint marginals bounded by $M pi$,
   pair law after forgetting colour bounded by $2^(3000 g N) pi^2$,
   and each colour of mass at most $eta_(upright("col"))$ satisfies
$ Pr { A upright(" and ") B upright(" have four cross holes and different colours") } gt.eq 2^(- 100 g N) \, $

 where $A \, B$ are independent draws from that law. In particular, 25(i) holds.]
] <prop:coloured-distribution>

#proof[
  Suppose that the assertion fails along an unbounded sequence of $n$.
    The laws and their randomized colour marks may vary with $n$; the palette is fixed.
    Refine by colour and discard the exponentially light colour classes as in 27.
    Peel each remaining conditional class, but retain the original mass of every leaf.
    Their mixture is a restriction of the original law with total mass $1 -
    o \( 1 \)$ before the fixed preparation restrictions. Hence its endpoint marginals remain bounded by a fixed
    multiple of $M pi$ and its primal marginals by the same multiple of the original primal law.
    The conditioning of a small colour may change a leaf’s joint density bound;
    this is already included in its absolute density and image budgets.
    It never changes the mixed marginal constant used next.
  Apply 50 to this pooled law, carrying its colour as a mark.
    In the predicted case this yields a retained law of original mass at least $delta_(*)$,
    and an event of passed compatible injecting tables of conditional pair mass at least $1 \/ 64$.
    Its scalar systems are soluble by 80, robustly under the fresh-label exclusions.
    In the no-prediction case the retained mass is also at least $delta_(*)$ and 81 supplies conditional pair mass
    greater than $.89$. In both cases the successful scalar-table event has mass at least $c_(*)$ in two draws
    from the original law.
  If the original colour probabilities are $p_c$, their equal-colour pair mass is
  $ sum_c p_c^2 lt.eq \( max_c p_c \) sum_c p_c lt.eq eta_(upright("col")) . $
  The equal-colour part of any subevent, including a prepared subevent, has no larger original mass.
    Subtracting it therefore leaves at least $c_(*) - eta_(upright("col")) >
    0$ of successful scalar-table pairs of different colours.
    Equivalently, if preparation retained mass $delta$, its normalized equal-colour pair mass is at most
    $eta_(upright("col")) \/ delta^2$. This subtraction takes place before any pigeonholing of a numerical table.
    Thus neither the number of tables nor the palette size enters the early choice of $eta_(upright("col"))$.
  Use the permitted-pair indicator $J_n \( L_A \, L_B \) =
    upright(bold(1))_({ "col" \( L_A \) eq.not "col" \( L_B \) })$. Store this bit in the common model.
    The preceding original-mass lower bound, together with the retained prediction and injection assertions of 73,
    gives positive limiting mass on $J = 1$ satisfying the hypothesis of 83.
    That proposition yields a fixed option with positive subsequential overlap on different-colour pairs.
    The filtered form of 40 now gives probability at least $2^(- \( k_max + .03 \) N - o \( N \))$ for a four-hole
    event on those same pairs. Because $k_max + .03 < 100 g$,
    this is larger than $2^(- 100 g N)$ for all sufficiently large indices, contradicting the chosen violating sequence.
  The overlap constant is allowed to depend on the subsequential model.
    This causes no loss in the uniform eventual assertion: any sequence violating it has a further subsequence
    with one fixed positive constant, and the fixed exponential gap just used defeats that sequence. ◻
]

== 15 Conflicts between a unit and an independent point <sec:asymmetric>

We prove the second distribution test. Its two endpoint bounds are separate assumptions:
  throughout this section, $sigma$ is a law on units, $nu$ is a law on points, and

#[#set math.equation(numbering: n => "(15.1)")
 $ sigma lt.eq 2^(3000 g N) pi^2 \, wide sigma_1 \, sigma_2 lt.eq L pi \, wide nu lt.eq L pi . $ <eq:asym-caps>]

Here $pi$ is the thinned law and $sans(P)_0$ is the original frame law.
  In particular only their primal marginals agree. We use $epsilon_(upright("ch")) =
  10 \| cal(E) \| 2^h rho$ as an upper bound on the exponent lost in comparing $pi^2$ with $sans(P)_0^2$.
  All restrictions made below have fixed positive mass, so all their constant marginal factors can be specified
  before the channel size is chosen.

Draw $A tilde.op sigma$ and, independently, two points $B_1 \, B_2 tilde.op nu$.
  We use this independent experiment for all calculations involving the two points. By 29,

#[#set math.equation(numbering: n => "(15.2)")
 $ bb(P) { B_1 B_2 upright(" is a hole") } lt.eq O_g #scale(x: 120%, y: 120%)[\(] L^2 2^(2 dim cal(B) - N)
   #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <eq:asym-internal-hole>]

Indeed the two primal spans in each component are disjoint except on the displayed exceptional mass.
  On their complement, the first hole equation forces both profiles to be zero,
  contradicting the last hole equation. Only after the independent-point calculations will we delete these
  internal holes. The resulting unit law has a single unpinned leaf and

#[#set math.equation(numbering: n => "(15.3)")
 $ C_(B \, 1) = C_(B \, 2) = 0 . $ <eq:asym-zero-space>]

The full-frame image bounds needed for that leaf pay $epsilon_(upright("ch")) N$;
  they do not assert an unchanged full-frame marginal. Conditioning on a nonhole costs $1 + o \( 1 \)$.

=== 15.1 No common prediction for the point side <no-common-prediction-for-the-point-side>

Write $Omega_(l \, q \, n)$ for the single-key reference space from 10.
  For a channel frame $v$ and a key $k = \( \( x_e \, y_e \) \)_(e in.rev l)$ in this space, put

$ chi_v \( k \) = \( - 1 \)^(u_v \( k \)) \, wide u_v \( k \) =
  sum_(e in.rev l) \( Y_(v \, e)^(sans(T)) x_e \) dot.op \( X_(v \, e)^(sans(T)) y_e \) . $

Every component has $x_e dot.op y_e = q$. This notation agrees with evaluating $u_v$ on the tensor represented by
  the key.

#thm([Lemma 15.1.])[
  (Channel correlations on a common key).  #emph[Let $v \, w$ be two frames for which the concatenated channel
    columns $\[ X_(v \, e) \, X_(w \, e) \]$ and $\[ Y_(v \, e) \, Y_(w \, e) \]$ have rank $2 h$,
    in every component of the star of $l$. Uniformly in these frames and in $q$,
#[#set math.equation(numbering: n => "(15.4)")
 $ bb(E)_(Omega_(l \, q \, n)) chi_v & = 2^(- h \( g - 1 \)) + O_g \( 2^(- N + 4 h) \) \,\
bb(E)_(Omega_(l \, q \, n)) chi_v chi_w & = 2^(- 2 h \( g - 1 \)) + O_g \( 2^(- N + 4 h) \) . $ <eq:asym-channel-mean>]

 For independent frames of law $nu lt.eq L pi$, these rank conditions fail with probability $o \( 1 \)$.]
] <lem:asym-channel-orthogonality>

#proof[
  Before imposing $x dot.op y = q$ in one component, the four channel evaluation vectors
  $ \( Y_v^(sans(T)) x \, Y_w^(sans(T)) x \, X_v^(sans(T)) y \, X_w^(sans(T)) y \) $
  are uniform on $bb(F)_2^(4 h)$. Conditional on their values, $x \,
    y$ are independent uniforms on affine subspaces of codimension $2 h$.
    The pairing between their translation spaces has rank at least $N - 4 h$.
    For a bilinear form of rank $R$, its sign average on an affine product is either zero or has absolute value
    $2^(- R)$: average first in one variable, leaving at most a $2^(- R)$ fraction of the other variable.
    Thus every fixed evaluation tuple has diagonal probability $1 / 2 + O \( 2^(- N + 4 h) \)$.
    Conditioning on the diagonal changes its uniform law by $O \( 2^(- N + 4 h) \)$ in total variation.
    Deleting zero key vectors incurs an additional $O \( 2^(- N) \)$ error.
  For independent uniform bits $a \, b$, $bb(E) \( - 1 \)^(a b) = 1 \/ 2$.
    There are $h$ such products for one frame and $2 h$ independent products for the pair of frames in each of the
    $g - 1$ components. Independence across components proves the two formulas.
  Under $sans(P)_0^2$, two independent channel frames have concatenation rank less than $2
    h$ with probability at most $O_g \( 2^(2 h - N) \)$, by exposing their uniform injective columns.
    The domination $nu^2 lt.eq L^2 2^(epsilon_(upright("ch")) N)
    sans(P)_0^2$ still makes this probability exponentially small, since $epsilon_(upright("ch")) < 1 \/ 2$.
    This proves the last assertion. ◻
]

#thm([Lemma 15.2.])[
  (Absence of a point-side prediction).  #emph[In the common limit of the independent two-point law,
    there is no positive mass on which, at either endpoint, a prediction
#[#set math.equation(numbering: n => "(15.5)")
 $ p_(B \, j) = alpha h_(B \, j) + f \( l \, q \, xi \) $ <eq:asym-point-prediction>]

 holds for a fixed measurable common-signature function $f$, a fixed bit $alpha$,
   and all surviving unary types after bounded label exclusions.
   The assertion holds for every fixed positive mass, however small, and after deletion of internal holes.]
] <lem:asym-no-point-prediction>

#proof[
  Suppose the limiting mass is positive. Approximate $f$, on each of the finitely many tag/diagonal reference
    spaces, by binary cylinder functions. For a fixed approximation,
    the maximum prediction error over the surviving unary types is a continuous function of the finitely many
    stored status-cylinder coordinates. Minimizing over the finite allowed exclusion choices preserves continuity.
    The strict-error transfer in the proof of 79 therefore gives a subsequence and global key functions $f_n$ for
    which the finite prediction error tends to zero on a set of pairs of mass at least some $delta > 0$.
    The functions are fixed before sampling these pairs. We use no supremum over functions chosen by a sampled
    orientation.
  There is a fixed surviving generic label on positive pair mass:
    average over the finite label set and retain one of its positive terms.
    Fix also a tag, a feasible diagonal, and a feasible generic tester summary $tau$.
    This summary has a fixed positive nominal probability and fixes the role $a \( tau \)$.
    Conditioning the vanishing error on it still leaves vanishing error.
    Absorb the term $alpha a \( tau \)$ into the global binary test $phi.alt_n \( k \)$.
    Write the two points in the relevant order as $U \, V$, so that $p_(B \, j)$ evaluates the channel form of $V$
    on the primal key supplied by $U$. Set
  $ D_n \( U \, V \) & = bb(P)_z { u_V \( K_U \( z \) \) eq.not phi.alt_n \( K_U \( z \) \) divides tau } \,\
d_n \( V \) & = bb(P)_(k tilde.op Omega_(l \, q \, n)) { u_V \( k \) eq.not phi.alt_n \( k \) } . $
  For each fixed $V$, the one-endpoint assertion of 59 applies with that entire frame as external data.
    Its exceptional set depends on this prescribed test, and its bound is uniform in the external data.
    The raw mean is $d_n \( V \) + o \( 1 \)$ by the single-key frame law.
    The marginal of the primal frame of $U$ is at most $L$ times its $sans(P)_0$-marginal.
    Consequently, for every fixed $t > 0$,
  $ bb(P)_(U \, V tilde.op nu) { \| D_n \( U \, V \) - d_n \( V \) \| > t } = o \( 1 \) . $
  For example the variance proof bounds the left side, apart from the negligible reference error,
    by $L C 2^(- c n) \/ t^2$. Choose $t_n arrow.b 0$ slowly enough for the exceptional probability still to
    vanish. If $D_n lt.eq epsilon.alt_n arrow.r 0$ on the successful pair set,
    its projection to the $V$-coordinate therefore yields
  $ G_n = { v : d_n \( v \) lt.eq epsilon.alt_n + t_n } \, wide nu \( G_n \) gt.eq delta - o \( 1 \) . $
  Any adaptive choice of the successful pair set is harmless here:
    the typicality exception was bounded on the independent product law before restricting it.
  Take two independent frames $V \, W$ from $nu$ conditioned on $G_n$.
    The probability of channel rank failure is at most its unconditioned $o \( 1 \)$ probability divided by
    $nu \( G_n \)^2$, and hence still tends to zero. On a pair with full ranks,
    agreement of both channel signs with the same test gives
  $ bb(E)_(Omega_(l \, q \, n)) chi_V chi_W gt.eq 1 - 4 \( epsilon.alt_n + t_n \) . $
  This contradicts (15.4), whose right side tends to $2^(- 2 h \( g - 1 \)) < 1$.
    This use of two successful frames is essential: it introduces no required lower bound on $delta$ besides
    positivity. Finally, (15.2) changes all bounded error or event probabilities by $o \( 1 \)$,
    so deleting internal holes cannot create the asserted limiting prediction. ◻
]

=== 15.2 A singleton phase estimate <a-singleton-phase-estimate>

The point side needs only one phase calculation. In the following lemma the marks on $A$ belong to its first
  effective spaces, and $Delta_A = U_(A \, 1) lambda_(A \, 1) + U_(A \, 2) lambda_(A \, 2)$.

#thm([Lemma 15.3.])[
  (One point, then two independent points).  #emph[Let a marked unit law have a fixed marginal bound relative to
    $pi$ and an absolute joint bound $2^(\( D + o \( 1 \) \) N)$ relative to $sans(P)_0^2$.
    Suppose $Delta_A eq.not 0$ throughout, with its component rank bounded by $r$, and fix $c in bb(F)_2$.
    One can retain a fixed positive fraction of the unit law such that, for an independent point $Z tilde.op nu$,
$ bb(P) { u_Z \( Delta_A \) = c upright(" and ") R \( A \, Z \) } > .49 . $

 Here $R$ is either the whole space or the transpose-rank condition on the offset list used below.
   The retained fraction can be fixed before $h$; the sufficiently large choice of $h$ may depend on the fixed
   marginal constants. With two independent points, under this same retained unit law,
#[#set math.equation(numbering: n => "(15.6)")
 $ bb(P) { u_(B_1) \( Delta_A \) = u_(B_2) \( Delta_A \) = c \, med R \( A \, B_1 \) \,
   R \( A \, B_2 \) } > .49^2 . $ <eq:asym-two-phase-bits>]

]
] <lem:asym-singleton-phase>

#proof[
  Use the cover threshold $p_0$, even moment $s$, and rank-growth constants in 42 and the proof of 43.
    Explicitly, $s$ is the largest power of two at most $c_s N$, where $c_s = 10^(- 12) \( 1 + r \)^(- 4)$,
    so $s gt.eq c_s N \/ 2$ for large $n$. Put $theta = 10^(- 4)$ and $Gamma = D + 2 r + 10$.
    If no cover of the specified size has unit mass at least $p_0$,
    expand the moment against independent uniform channel columns of the one point:
  $ bb(E)_(upright(i i d med c h a n n e l s)) lr(|bb(E)_A \( - 1 \)^(u_Z \( Delta_A \))|)^s lt.eq
    bb(E)_(A_1 \, dots.h \, A_s) 2^(- h "rank" \( Delta_(A_1) + dots.h.c + Delta_(A_s) \)) lt.eq
    4^s p_0^(q_0 s \/ 2) + 2^(- h q_0 s \/ 4) . $
  This is (9.6) with no reciprocal phase and no candidate value of $Delta_Z$.
    The inequalities (9.4) and (9.5), followed by Markov’s inequality at threshold $theta$,
    bound the raw channel exception by $C_h 2^(- Gamma N)$. The channel comparison in 23 is included in the fixed
    factor $C_h$. Paying $L 2^(epsilon_(upright("ch")) N)$ once leaves an exponentially small point-law exception.
    Thus $lr(|bb(E)_(A \, Z) \( - 1 \)^(u_Z \( Delta_A \))|) < .01$ for large $n$.
    Take $R$ to be the whole space; each value of the bit has probability greater than $.495$.
  Otherwise retain the $p_0$ mass in a fixed cover and delete the negligible set whose individual primal spans
    meet that cover. The deletion uses the unchanged primal marginal.
    The lifting identity (9.7) gives offset records with at most $2^(.002 N)$ possibilities and offset basis size
    $1 lt.eq t lt.eq 2 r$. At one fixed record, let $Z_A$ be its companion tuple.
    Its unnormalized subprobability law satisfies
  $ p_max \( Z_A \) lt.eq 2^(- t N + .01 N) $
  by (9.10). For that record let $R \( A \, Z \)$ require the channel transposes of $Z$ to have full rank on the
    plus and minus offset lists. The transpose estimate in 24, multiplied by the fixed point marginal factor, gives
  $ bb(P) { R \( A \, Z \) upright(" fails") } lt.eq L thin O \( r \) 2^(2 r - h) + o \( 1 \) < .01 $
  after increasing $h$. We may, and do, make this bound less than $.005$.
  On the retained rank event the output tuple $Phi_(u_Z) \( omega_A \)$ has point masses at most
    $2^(- t N + .01 N)$. To check this directly, condition on the point’s primal frame and freeze the bounded
    lists of transpose coefficients on the offsets. Each list has full rank.
    Ignoring the equations defining those coefficients, their prescribed images under the opposite channel maps
    cost $t \( N - dim cal(B) \)$ bits. The number of coefficient lists is fixed in $n$.
    The density loss from thinning and the ratio $dim cal(B) \/ N$ are absorbed into $.01 N$.
    This is the singleton image calculation of (9.11) with no point-side companion tuple.
  The phase is $Z_A dot.op Phi_(u_Z) \( omega_A \)$, plus a function of the point alone at this fixed record.
    The Walsh bound 30 therefore bounds its unnormalized signed mass, including the rank filter, by
  $ 2^(t N \/ 2) (2^(- t N + .01 N) 2^(- t N + .01 N))^(1 \/ 2) = 2^(\( - t \/ 2 + .01 \) N) . $
  Summing over records gives at most $2^(- .488 N)$. Since $bb(P) \( R \) > .995 - o \( 1 \)$,
    the mass where $R$ holds and the phase bit has either prescribed value exceeds $.49$.
    This proves the singleton assertion.
  For the last assertion put
  $ f \( A \) = bb(P)_(Z tilde.op nu) { u_Z \( Delta_A \) = c \, R \( A \, Z \) divides A } . $
  The two points are conditionally independent given $A$, with the identical separate rank filter,
    so the left side of (15.6) is
  $ bb(E)_A f \( A \)^2 med gt.eq med \( bb(E)_A f \( A \) \)^2 med > med .49^2 . $
  This argument asserts an averaged singleton estimate; it does not require a pointwise estimate for each unit.
    Internal holes have not yet been deleted. ◻
]

=== 15.3 The mixed dual relations and the conflict bound <the-mixed-dual-relations-and-the-conflict-bound>

#thm([Proposition 15.4.])[
  (The asymmetric distribution test).  #emph[For every fixed $L$, with the late parameters chosen as above,
    all sufficiently large $n$ and all laws satisfying (15.1) obey
$ bb(P)_(A tilde.op sigma \, med Z tilde.op nu) { A upright(" and ") Z upright(" conflict") } gt.eq 2^(- 100 g N) . $

 Thus 25(ii) holds.]
] <prop:asymmetric-distribution>

#proof[
  Suppose a violating sequence exists. Peel the $A$ law once by 27(a);
    retain the actual leaf weights and the resulting first effective spaces.
    After making all restrictions on this law, we will apply part (b) once to restore the required normalized-leaf
    image bounds without adding pins. The margins between $3000 g$ and $D =
    4000 g$ absorb thinning and fixed normalizations. Throughout, the mixed marginal bounds used in Section 11,
    Section 13 concern the primal frames.
  ===== 15.3.1 Preparing the unit and the point pair. <preparing-the-unit-and-the-point-pair.>
  Make the following subsequential choice on the $A$ law. If an empty prediction exists on mass at least
    $10^(- 6)$, retain it. Here empty means $alpha_1 = alpha_2 = 1$ and the offsets are $gamma_1 q \,
    gamma_2 q$ with fixed bits $gamma_i$, modulo errors tending to zero in the reference spaces.
    47 exactifies it, after negligible deletion, to
  #[#set math.equation(numbering: n => "(15.7)")
   $ p_(A \, i) = T \( lambda_(A \, i) \, dot.op \) + a quad upright("on all of ") cal(X) \, wide i = 1 \,
     2 . $ <eq:asym-exact-A>]
  In particular its proof eliminates the multiples of $q$, using the odd number of star atoms.
    Fix $c = a \( lambda_(A \, 1) \) + a \( lambda_(A \, 2) \)$ and the indicator of $Delta_A = 0$,
    losing a factor at most four. If no such empty prediction exists,
    retain the first law without prediction preparation. Only this specialized empty prediction is tested;
    arbitrary common predictions need not be excluded.
  In the predicted branch with $Delta_A eq.not 0$, apply 87.
    In the branch with $Delta_A = 0$, necessarily $c = 0$. Indeed the identities (15.7) give
    $\( u_(A \, 1) + u_(A \, 2) \) U_(A \, i) = T \( lambda_(A \, i) \, dot.op \) + a$,
    since $u_(A \, i) U_(A \, i) = 0$; if $c = 1$, these profiles and $Delta_A =
    0$ satisfy all hole equations for the unit $A$, a contradiction.
    Thus in either predicted branch the independent experiment has fixed positive mass on
  #[#set math.equation(numbering: n => "(15.8)")
   $ u_(B \, j) \( Delta_A \) = c wide \( j = 1 \, 2 \) . $ <eq:asym-compatible>]
  In the nonzero case this mass exceeds $.49^2$ under the normalized retained $A$ law.
    Before constructing either common model, apply 27(b) to the combined restriction made on $A$.
    More explicitly, let $w_lambda$ be the original first-leaf weights and let $q_lambda$ be the fraction retained
    in leaf $lambda$ by all the $A$-only restrictions just made.
    Their total mass $q = sum_lambda w_lambda q_lambda$ is bounded below by a fixed positive constant.
    Discard the leaves with $q_lambda < 2^(- zeta N)$. They have mass at most $2^(- zeta N) \/ q =
    o \( 1 \)$ in the restricted law; every remaining normalized leaf has the image bound (5.11) and an absolute
    density $2^(O \( N \))$ relative to $sans(P)_0^2$. The pins and first effective spaces have not changed,
    and the actual remaining leaf weights are retained. This operation depends only on $A$,
    so the two points remain independent conditional on $A$. On the predicted branch the two-bit compatibility
    mass is still at least $.49^2 - o \( 1 \)$.
  Now delete internal $B$ holes, costing $o \( 1 \)$ by (15.2), and take the single unpinned $B$ leaf from 29.
    Apply the independent-law version of 45 to these two laws, with failure probability less than $.01$.
    On the predicted branch compatibility and injection therefore coexist on mass at least $.49^2 - .01 -
    o \( 1 \) > .22$, for large $n$. On the branch without prediction a passed injecting actual table has mass at
    least $.99$. These are subtractions of exceptional mass, and require no independence between the exceptional
    events and compatibility.
  ===== 15.3.2 Separate flags for candidate tables. <separate-flags-for-candidate-tables.>
  We record this mass in the permitted finite-table format.
    For each leaf pair enumerate all numerical candidate small tables $T$, as in 70; there are finitely many,
    with a bound independent of $n$. A fixed $T$ has separate admissibility flags $F_(A \, T) \( A \)$ and
    $F_(B \, T) \( B \)$ by 38. In the predicted branch define
  #[#set math.equation(numbering: n => "(15.9)")
   $ H_(A \, T) \( A \) =
     upright(bold(1)) {sum_(i = 1)^2 \( u_(B \, j) U_(A \, i) \)_T^(*) \( lambda_(A \, i) \) =
     c quad \( j = 1 \, 2 \)} . $ <eq:asym-table-flag>]
  The star denotes contraction in the numerical table $T$, as in (14.9).
    It is calculated from the entries of $T$, the recorded tensor coordinates of the $C_(A \, i)$ bases,
    and the bounded coordinate vectors of the marks $lambda_(A \, i)$.
    Thus, for a fixed leaf pair and $T$, $H_(A \, T)$ is a flag of $A$ alone.
    Include the mark coordinates among the finite orientation metadata and replace $F_(A \, T)$ by $F_(A \, T)
    H_(A \, T)$. In the branch without prediction set $H_(A \, T) = 1$.
    Injection is a finite matrix-rank test on the candidate table and the leaf metadata.
  Each pair counted by the ambient compatibility and injection estimate has at least one passed candidate:
    take $T$ to be its actual small table. Therefore the union of these permitted candidate-table events has at
    least the mass just established. We store their entire finite flag vector in the common model.
    This argument does not impose equality of a candidate table with the actual cross entries between private
    directions; such an equality would be a joint condition. The actual table is used only to witness the
    existence of a passed candidate. Nor do we condition the two unit laws on the ambient phase event (15.8).
    They remain independent laws with the separate flags just described.
  ===== 15.3.3 Solving the mixed scalar system. <solving-the-mixed-scalar-system.>
  Construct the common model for these two different unit laws, retaining the ordered $A$–$B$ type filter.
    The dual relations (14.5) become
  #[#set math.equation(numbering: n => "(15.10)")
   $ s_j \( p_(A \, i) + h_(A \, i) \) + r_i \( p_(B \, j) + h_(B \, j) \) =
     upright(bold(c))_(i j) dot.op upright(bold(x))_(A \, i) + beta_(i j) \( h_(A \, i) + h_(B \, j) \) +
     gamma_(i j) q \, $ <eq:asym-dual>]
  because $C_(B \, j) = 0$. We first show that no relation with some $r_i = 1$ can occur on positive model mass,
    for any of the permitted bounded exclusions. If it did, Fubini fixes an $A$ array with a positive-mass set of
    such $B$ arrays. Pigeonhole its finite coefficient and exclusion data and fix a surviving generic label on the
    $A$ side. At a fixed common signature, the two status distributions are independent.
    The two expressions in (15.10) must agree almost surely, because a mismatching positive-density pair would be
    an available generator violating the relation. Two independent bits which agree almost surely are both
    deterministic. The generic $A$ type has total status density one on every signature space,
    so its deterministic value gives a fixed common function on all surviving $B$ types.
    Solving (15.10) for $p_(B \, j)$ gives
  $ p_(B \, j) = \( 1 + beta_(i j) \) h_(B \, j) + f \( l \, q \, xi \) . $
  The strict-error cylinder transfer used in 86 applies, and that lemma rules this out.
    The finite number of possible dual and exclusion records implies that, almost surely,
    every remaining dual relation has $r_1 = r_2 = 0$.
  In the branch without an empty prediction, suppose obstructable pairs had probability at least $.1$.
    A nonzero weight now has some $s_j = 1$. Generic positivity of the two possible $B$-role values in (15.10)
    forces $beta_(i j) = 0$. The same relation, for both $i$, is then
  #[#set math.equation(numbering: n => "(15.11)")
   $ p_(A \, i) = T \( lambda_(A \, i) \, upright("atom") \) + h_(A \, i) +
     gamma_(i j) q . $ <eq:asym-empty-extraction>]
  It holds on all surviving unary types, by comparison to a fixed generic $B$ type of total density one.
    These are empty predictions. There are only two choices of $j$ and four offset pairs
    $\( gamma_(1 j) q \, gamma_(2 j) q \)$; therefore one choice occurs on $A$ mass at least $.1 \/ 8$.
    The marked profiles and exclusions may still vary with $A$, as allowed in 46;
    their number is not a further pigeonhole cost. Cylinder transfer with strict error events, as in 79,
    loses at most a factor two in this mass and supplies a finite empty prediction of mass much larger than
    $10^(- 6)$. This is a contradiction. Thus obstructable mass is less than $.1$,
    whereas passed injecting tables have mass at least $.99$.
    Their intersection with nonobstructable pairs has mass greater than $.89$.
    On it 78 solves the scalar system for every such table and every allowed exclusion.
  On the predicted branch, substitute (15.7) into (15.10). The full generic base projection forces
  $ upright(bold(c))_(i j) = s_j bold(lambda)_(A \, i) \, wide beta_(i j) = 0 \, wide gamma_(i j) = 0 . $
  For $s_j = 0$ all these coefficients are zero. Fix any passed injecting candidate table $T$,
    including the flag $H_(A \, T) = 1$. At its local targets the dual evaluation is
  $ sum_(i \, j) upright(bold(c))_(i j) dot.op upright(bold(t))_(A \, i \; j) =
    sum_j s_j (sum_i a \( lambda_(A \, i) \) + sum_i \( u_(B \, j) U_(A \, i) \)_T^(*) \( lambda_(A \, i) \)) = 0 $
  by (15.9) and $sum_i a \( lambda_(A \, i) \) = c$. This calculation uses the selected candidate’s starred
    contractions throughout; it does not require that candidate to equal the actual cross table of the sampled
    pair. Every dual relation vanishes on its target. By 78, the scalar system is soluble on the positive mass
    having a passed compatible injecting candidate. The reasoning uses only surviving generic labels and hence
    persists through the further bounded exclusions for fresh lists.
  ===== 15.3.4 Positive overlap and collision. <positive-overlap-and-collision.>
  In either branch we now have the hypothesis of the mixed, filtered 83.
    Equivalently, 82 supplies at most seven generators per cross edge,
    with distinct labels at each endpoint and positive status overlap at every matched position.
    The scalar recipe and gradient realization produce a usable numerical option;
    the filtered zero-product conclusion of 76 cannot hold on this positive mass.
    Consequently some option has a positive subsequential expected unnormalized overlap.
    This positive constant need not be uniform over all possible limit models.
  The collision criterion 40 therefore gives four cross holes between $A$ and $B$ with probability
  $ 2^(- \( k_max + .03 + o \( 1 \) \) N) . $
  All retained-law normalizations have fixed positive mass and are included in the $o \( 1 \) N$ loss.
    In particular these four holes imply that $A$ conflicts with $B_1$.
    Viewed in the original independent experiment, the latter has exactly the probability of a conflict with one
    point of law $nu$. Since
  $ k_max + .03 = 56 \( g - 1 \) + .03 < 100 g \, $
  this contradicts the assumed bound below $2^(- 100 g N)$ for all sufficiently large indices of the violating
    sequence. The asserted uniform eventual distribution test follows. ◻
]

== 16 From distribution tests to finite graphs <sec:graph-transfer>

We now prove 2. The only probabilistic input to this section is 25,
  whose two parts were proved in Proposition 14.8, Proposition 15.4. The sample uses the thinned law $pi$. Write

#[#set math.equation(numbering: n => "(16.1)")
 $ Q_N = 2^(3000 g N) \, wide epsilon.alt_N = 2^(- 100 g N) \, wide m = 2^(1000 g N) \, wide Omega =
   "supp" pi . $ <eq:transfer-scales>]

All spaces in this section are finite. In particular, $pi$ is strictly positive on $Omega$, and $log \| Omega \| =
  O \( N^2 \)$: specifying all frame entries uses $O \( N^2 \)$ bits,
  and restricting their support by thinning only decreases its size.
  We regard the fixed construction parameters as constants in this estimate.

=== 16.1 Entropy and terminal covers <entropy-and-terminal-covers>

For probabilities $p \, q$ on a finite space with $q > 0$, define

$ sans(D) \( p bar.v.double q \) = sum_x p \( x \) log frac(p \( x \), q \( x \)) \, wide 0 log 0 = 0 . $

Logarithms in entropy expressions are natural logarithms.

This is the finite convex information-projection inequality underlying the entropy method of
  #cite(label("csiszar1975"), form: "prose").

#thm([Lemma 16.1.])[
  (Entropy increase after a deletion).  #emph[Let $cal(P)$ be a nonempty compact convex family of probabilities
    and let $p$ minimize $sans(D) \( dot.op bar.v.double q \)$ on $cal(P)$.
    Then $p$ is positive on the union of the feasible supports. For every $p' in cal(P)$ supported on $S$,
$ sans(D) \( p' bar.v.double q \) - sans(D) \( p bar.v.double q \) gt.eq sans(D) \( p' bar.v.double p \) gt.eq -
  log p \( S \) . $

]
] <gt:entropy>

#proof[
  The minimum exists by continuity. If $p \( x \) = 0 < p' \( x \)$,
    the right derivative of entropy along $\( 1 - t \) p + t p'$ is $- oo$ at zero;
    all terms on the support of $p$ have finite derivative. This contradicts minimality.
    Differentiating now on the common feasible support gives
  $ sum_x \( p' \( x \) - p \( x \) \) log frac(p \( x \), q \( x \)) gt.eq 0 . $
  Subtracting the two entropies proves the first inequality. If $p'$ is supported on $S$, then
  $ sans(D) \( p' bar.v.double p \) = sans(D) \( p' bar.v.double p \( dot.op divides S \) \) - log p \( S \) . $
  Relative entropy is nonnegative: apply $log t lt.eq t - 1$ with $t =
    q \( x \) \/ p' \( x \)$ and sum on the positive support of $p'$. This proves the second inequality as well. ◻
]

We require a terminal cover for coloured units that accounts for four different capacities.
  The following elementary separation argument supplies the finite linear programming duality needed here.

#thm([Lemma 16.2.])[
  (Resource prices).  #emph[Let $cal(R)$ be a nonempty finite collection of objects,
    each having a nonnegative load vector $v_r in bb(R)^d$, and let $c in
    bb(R)_(gt.eq 0)^d$ be the vector of capacities. If no probability $\( p_r \)_(r in cal(R))$ has $sum_r p_r v_r
    lt.eq c$ coordinatewise, there are nonnegative prices $w in bb(R)^d$ with
$ w dot.op c < 1 \, wide w dot.op v_r gt.eq 1 quad \( r in cal(R) \) . $

]
] <gt:prices>

#proof[
  The compact convex sets $C = "conv" { v_r : r in cal(R) }$ and $B =
    product_(j = 1)^d \[ 0 \, c_j \]$ are disjoint. Choose a closest pair $z in C \, b in B$, and put $u = z -
    b eq.not 0$. For fixed $z$, the nearest point of $B$ is its coordinatewise truncation, so $b_j =
    min \( z_j \, c_j \)$, $u gt.eq 0$, and $u dot.op b = u dot.op c$.
    For every $v in C$, comparison with $\( 1 - t \) z + t v$ at $t = 0$ gives $u dot.op \( v - z \) gt.eq 0$.
    Consequently
  $ u dot.op v gt.eq u dot.op z = u dot.op c + parallel u parallel^2 > u dot.op c gt.eq 0 . $
  Take $w = u \/ \( u dot.op z \)$. This proves both assertions using only minimization on compact subsets of a
    Euclidean space. ◻
]

#thm([Lemma 16.3.])[
  (The coloured terminal cover).  #emph[Fix a palette $\[ q \] = { 1 \, dots.h \, q }$.
    Suppose that a set $R subset.eq Omega^2 times \[ q \]$ supports no probability $sigma$ whose two endpoint
    marginals are at most $M pi$, whose projection onto $Omega^2$ is at most $Q_N pi^2$,
    and whose mass on each colour is at most $eta_(upright("col"))$.
    There are sets $S subset.eq Omega$, $E subset.eq Omega^2$ and $C subset.eq \[ q \]$ such that
#[#set math.equation(numbering: n => "(16.2)")
 $ pi \( S \) < 8 / M \, wide pi^2 \( E \) < 4 / Q_N \, wide \| C \| < 4 / eta_(upright("col")) \,
   $ <eq:coloured-terminal-cover>]

 and each $\( x \, y \, c \) in R$ has $x in S$, $y in S$, $\( x \, y \) in E$, or $c in C$.]
] <gt:coloured-cut>

#proof[
  The assertion is immediate for empty $R$. Otherwise introduce separate resources for each left vertex,
    right vertex, ordered pair, and colour, with capacities
  $ M pi \( x \) \, quad M pi \( y \) \, quad Q_N pi \( x \) pi \( y \) \, quad eta_(upright("col")) \, $
  respectively. An object $\( x \, y \, c \)$ uses one unit of each of its four resources. Apply 90.
    Write the resulting prices as $ell_x \, r_y \, e_(x y) \, d_c$; their capacity-weighted sum is less than one,
    and $ell_x + r_y + e_(x y) + d_c gt.eq 1$ on $R$. Take all resources of price at least $1 \/ 4$.
    They cover $R$. Let $S$ be the union of the high-price left and right vertex sets. In fact
  $ pi \( S \) lt.eq 4 sum_x pi \( x \) \( ell_x + r_x \) < 4 \/ M < 8 \/ M . $
  The corresponding pair and colour inequalities are $pi^2 \( E \) < 4 \/ Q_N$ and $\| C \| < 4 \/
    eta_(upright("col"))$. This uses the capacity on the pair projection,
    so all colours of one pair share a single pair resource. ◻
]

The next cover is a capacitated max-flow/min-cut argument #cite(label("fordfulkerson1956"));
  we include the finite proof for the real capacities used here.

#thm([Lemma 16.4.])[
  (The uncoloured terminal cover).  #emph[If $R subset.eq Omega^2$ supports no probability with both marginals at
    most $L pi$ and joint law at most $Q_N pi^2$, then there are $S subset.eq Omega$ and $E subset.eq Omega^2$ with
#[#set math.equation(numbering: n => "(16.3)")
 $ pi \( S \) < 1 \/ L \, wide pi^2 \( E \) < 1 \/ Q_N \, $ <eq:uncoloured-terminal-cover>]

 such that each pair in $R$ meets $S$ or belongs to $E$. A set $T subset.eq
   Omega$ supports no probability at most $L pi$ precisely when $pi \( T \) < 1 \/ L$.]
] <gt:flow-cut>

#proof[
  Make a directed network from a source to a left copy of $Omega$, then to a right copy, then to a sink.
    The source and sink arcs have capacities $L pi \( x \)$ and $L pi \( y \)$.
    The middle arc $x arrow.r y$, present for $\( x \, y \) in R$, has capacity $Q_N pi \( x \) pi \( y \)$.
    A flow of value one is exactly a feasible unit law, and a larger flow can be scaled to value one.
  A maximum flow exists by compactness. Its value is less than one.
    In its residual network there is no source-to-sink path, since augmenting by the smallest residual capacity on
    such a path would increase the value. Let $Z$ be the vertices reachable from the source.
    Every original arc leaving $Z$ is saturated; every original arc entering $Z$ carries zero flow.
    Summing flow conservation over $Z$ therefore shows that its cut capacity is the maximum flow value,
    hence is less than one.
  Let $A$ be the left types outside $Z$, and $B$ the right types inside $Z$. The cut inequality reads
  $ L pi \( A \) + L pi \( B \) + Q_N pi^2 #scale(x: 120%, y: 120%)[\(]
    R ∩ \( \( Omega \\ A \) times \( Omega \\ B \) \) #scale(x: 120%, y: 120%)[\)] < 1 . $
  Take $S = A union B$ and take $E$ to be the pair set in the last summand. This proves the cover and both bounds.
    For the point assertion, a law of total mass one on $T$ bounded by $L pi$ exists exactly when $L pi \( T \)
    gt.eq 1$: necessity follows by summing, and sufficiency follows by normalizing $pi \|_T$. ◻
]

=== 16.2 Finite fingerprints <finite-fingerprints>

Call two coloured units adjacent when their colours differ and their four cross pairs are holes.
  This is a finite simple graph: a unit cannot conflict with itself, because a vertex has no hole to itself.
  For a fixed palette, consider its independent sets. Also consider the bipartite graph with raw units on one side
  and points of $Omega$ on the other, with adjacency meaning an edge–point conflict.
  In this graph the relevant objects are pairs $\( I \, J \)$ having no adjacency between $I$ and $J$.

The recording-and-replay construction follows the graph fingerprint method of Kleitman and Winston
  #cite(label("kleitmanwinston1982")); see also #cite(label("samotij2015"), form: "prose").
  Its potential here is the constrained entropy minimum, whose increase makes the terminal count small.

#thm([Lemma 16.5.])[
  (Fingerprint bound).  #emph[There are families of terminal sets, respectively terminal pairs of sets,
    containing every such independent set, respectively every such pair $\( I \, J \)$,
    with the following properties. Each coloured terminal has an infeasible coloured region as in 91;
    in each bipartite terminal at least one of the two feasible regions in 92 is empty.
    The number of terminals of either kind is
#[#set math.equation(numbering: n => "(16.4)")
 $ exp #scale(x: 120%, y: 120%)[\(] O \( N^3 2^(100 g N) \) #scale(x: 120%, y: 120%)[\)] =
   exp \( o \( m \) \) . $ <eq:transfer-terminal-count>]

 The constants may depend on the fixed palette and on $L$.]
] <gt:fingerprints>

#proof[
  Start with the entire relevant graph as residual set. On a nonempty feasible region choose the entropy
    minimizer, breaking all choices deterministically. For coloured units the reference probability is $pi^2$
    times the uniform law on $\[ q \]$. The projected pair cap gives density at most $q
    Q_N$ against this reference. The minimum entropy is therefore in $\[ 0 \, log \( q Q_N \) \]$.
    By 25(i), the average minimizer mass of a residual neighbourhood is at least $epsilon.alt_N$.
    Select a vertex of maximal neighbourhood mass. If it belongs to the independent set being contained,
    record it and delete its neighbours. Otherwise delete only that vertex.
    These operations preserve containment of the target independent set.
  For the bipartite problem, choose separate entropy minimizers on the two residual sides,
    against $pi^2$ and $pi$. Their sum lies in $\[ 0 \, log Q_N + log L \]$.
    By 25(ii), some vertex on either side has opposite minimizer neighbourhood mass at least $epsilon.alt_N$.
    Choose deterministically a vertex of maximal such mass, including its side in the choice.
    If it belongs to the corresponding target set, record it and delete its neighbours on the opposite side;
    otherwise delete only the chosen vertex. The absence of edges between $I$ and $J$ preserves both containments.
  In either procedure every step removes a vertex: a recorded vertex has a nonempty neighbourhood.
    Stop when feasibility fails (on either side in the bipartite case).
    Deleting vertices can only increase each minimum entropy.
    If a recording leaves the relevant feasible region nonempty, 89 increases its minimum by at least $-
    log \( 1 - epsilon.alt_N \) gt.eq epsilon.alt_N$. Consequently the number of recordings is at most
  #[#set math.equation(numbering: n => "(16.5)")
   $ 1 + ⌈frac(max { log \( q Q_N \) \, log Q_N + log L }, epsilon.alt_N)⌉ =
     O \( N 2^(100 g N) \) . $ <eq:transfer-fingerprint-length>]
  The extra one permits a last recording that destroys feasibility.
  After recording a vertex, its residual neighbourhood is empty forever.
    Since a selected vertex always has positive neighbourhood mass, it cannot be selected again.
    The set of recorded vertices, with side information in the bipartite case,
    thus determines the entire procedure: replay its deterministic choices,
    performing a recording exactly when the selected vertex is in that set, and otherwise deleting it.
    In particular it determines the terminal. The total number of available vertices has logarithm $O \( N^2 \)$.
    Bounding the number of fingerprints of length at most (16.5) by the corresponding power of one plus that
    number proves (16.4). ◻
]

=== 16.3 One sample satisfies all three properties <one-sample-satisfies-all-three-properties>

Choose the colour threshold $eta_(upright("col")) > 0$ from 25(i), and fix

#[#set math.equation(numbering: n => "(16.6)")
 $ 0 < a < min { 1 \/ 100 \, eta_(upright("col")) \/ 800 } \, wide L > 10^6 \/ beta . $ <eq:transfer-a-L>]

Here we may assume $0 < beta lt.eq 1$, since increasing $beta$ only weakens the required graph properties.
  The order is $eta_(upright("col")) \, a$, then $beta \, L$,
  followed by the remaining construction parameters as in 17.
  Let $X_1 \, dots.h \, X_m$ be independent samples from $pi$.
  On positions $\[ m \]$, put an edge between distinct positions exactly when their types have no hole.
  Repeated types are allowed. By 21, this graph has independence number at most two for every sample.

First consider any matching whose edges have been partitioned into classes of size at most $a m$.
  Merge successive classes until a merged class first has size at least $a m$, and repeat,
  leaving a possible final smaller class. Every merged class has size at most $2 a m$.
  As a matching has at most $m \/ 2$ edges, there are at most

$ q = ⌈frac(1, 2 a)⌉ + 1 $

merged classes. Assign these the fixed palette $\[ q \]$. Different merged colours imply different original classes.

For every coloured terminal, fix a cover $\( S \, E \, C \)$ from 91. Put $k = ceil.l m \/ 100 ceil.r$.
  The probability that at least $k$ sampled positions lie in $S$ is at most

$ binom(m, k) \( 8 \/ M \)^k lt.eq \( 800 e \/ M \)^k = exp \( - Omega \( m \) \) . $

A fixed collection of $k$ disjoint ordered position pairs gives independent $pi^2$-draws,
  and is entirely in $E$ with probability less than $\( 4 \/ Q_N \)^k$.
  There are at most $m^(2 k)$ such collections, so its union bound is

#[#set math.equation(numbering: n => "(16.7)")
 $ m^(2 k) \( 4 \/ Q_N \)^k = 2^(- \( 1000 g N - 2 \) k) . $ <eq:transfer-pair-tail>]

Union over (16.4). With probability $1 - exp \( - Omega \( m \) \)$,
  simultaneously every coloured terminal has fewer than $m \/ 100$ exceptional positions and fewer than $m \/
  100$ disjoint exceptional ordered pairs. The strict bounds use $k - 1 < m \/ 100$.

Suppose there were a matching of size at least $m \/ 20$ with no conflict between original classes.
  Orient its edges arbitrarily, merge its classes as above, and take the set of resulting coloured raw types.
  This is an independent set in the coloured conflict graph, so is contained in a terminal.
  Every matching edge is covered by an exceptional position, an exceptional ordered pair,
  or an exceptional colour. The first two covers each account for fewer than $m \/ 100$ edges.
  The last accounts for fewer than

$ 4 / eta_(upright("col")) thin 2 a m < m \/ 100 $

edges. Their sum is less than $3 m \/ 100 < m \/ 20$, a contradiction. This proves the first graph property.
  Multiple sampled edges may have the same raw type; the counting uses their disjoint sample positions and does
  not assume distinct types.

For the bipartite terminals put $k_beta = ceil.l beta m \/ 100 ceil.r$.
  At a terminal with infeasible unit region, fix $\( S \, E \)$ from 92.
  At a terminal with infeasible point region, its entire point region has $pi$-mass less than $1 \/ L$.
  For every one of these vertex sets, the position tail is at most

$ binom(m, k_beta) L^(- k_beta) lt.eq (frac(100 e, beta L))^(k_beta) = exp \( - Omega_beta \( m \) \) . $

The exceptional ordered-pair tail is at most

$ m^(2 k_beta) Q_N^(- k_beta) = 2^(- 1000 g N k_beta) . $

Another union over (16.4) shows that all these sets simultaneously contain fewer than $beta m \/
  100$ sample positions, and all pair exceptions contain fewer than that many disjoint ordered pairs,
  with probability tending to one.

If a matching and vertex set, each of size at least $beta m \/ 10$, had no edge–point conflict,
  their raw type sets would give a pair $\( I \, J \)$ contained in a bipartite terminal.
  An infeasible point region cannot contain that vertex set.
  An infeasible unit region covers fewer than $2 beta m \/ 100$ matching edges, also a contradiction.
  We have proved the second property even at the stronger threshold $beta m \/ 10$.
  There is no disjointness requirement between the original vertex set and matching;
  a conflict itself ensures that its point differs from both edge endpoints.

Finally let $A \, B subset.eq \[ m \]$ each have size at least $beta m$.
  A maximal matching in the induced graph on $A$ leaves at most two vertices unmatched:
  the unmatched vertices are independent, and the whole graph has independence number at most two.
  Its size is at least $\( \| A \| - 2 \) \/ 2 gt.eq beta m \/ 10$ for all sufficiently large $m$.
  Apply the second property to this matching and $B$. The resulting edge–point conflict supplies a hole from $A$
  to $B$, proving the third property.

All the required events hold together with probability tending to one.
  Their intersection therefore contains a finite sample for every sufficiently large allowed $n$; since $m =
  2^(1000 g M_0 n)$ tends to infinity, this proves 2.

== 17 Parameters, ranks, and probability scales <sec:parameters>

This Appendix collects the choices made throughout the proof and checks their dependencies.
  All quantities chosen before $n$ are constants. They can be very large; no upper bound on their size is needed,
  and none of these choices depends on an adversarial unit law.
  The fixed mixers may be chosen separately at each sufficiently large $n$, by 35.

=== 17.1 The acyclic order of construction <the-acyclic-order-of-construction>

The early constants in (4.1)–(4.4) are

#[#set math.equation(numbering: n => "(17.1)")
 $ C_0 & = 1000 \, & g & = 10^9 + 1 \, & D & = 4 C_0 g \, & M & = 2^1000 \,\
k_max & = 56 \( g - 1 \) \, & zeta & = frac(1, 1000 k_max) \, & K_1 & = ⌈frac(4 \( D + 1 \), zeta)⌉ .
  $ <eq:ledger-early>]

In particular $g$ is odd and $D = 4000 g$. The early rank budgets are

#[#set math.equation(numbering: n => "(17.2)")
 $ r & = 2 K_1 + 2 \, & L_0 & = ceil.l 100 \( D + 10 \) ceil.r \, & d_0 & = 4 r L_0 \,\
u_0 & = 10 \( K_1 + d_0 + 1 \) \, & K & in bb(N) \, wide K gt.eq
  frac(10 \( D + K_1 + u_0 + 10 \), zeta) . $ <eq:ledger-law>]

These are the bounds in (4.3) and (4.2); the construction takes $K$ to be the least integer meeting the displayed
  lower bound. Only the first peeling is used. The auxiliary number $u_0$ is retained in the numerical definition
  of a conservative bound $K gt.eq K_1$; it does not count another operation in the present construction.

The remaining early tolerances in Theorem 9.3, Lemma 9.5 include

#[#set math.equation(numbering: n => "(17.3)")
 $ c_s = 10^(- 12) \( 1 + r \)^(- 4) \, wide q_0 = 2^(- 100 r - 10) \, wide
   delta_(upright("cov")) = .0005 . $ <eq:ledger-cover-tolerances>]

For each $n$, the moment order is the largest power of two $s lt.eq c_s N$; it is even for sufficiently large $n$,
  and $s gt.eq c_s N \/ 2$. Choose $p_0 > 0$ sufficiently small in terms of $r \, D \, c_s \,
  q_0$ and the fixed phase tolerance. Fix the transpose-injection error thresholds as well,
  with their total over all component and endpoint roles below the required constant error, such as $.001$.
  These thresholds precede selector and channel sizes. For the bounded-tuple transpose tests in 24, we may fix

$ q_(upright("test")) = d_0 + L_0 + 2 r + 2 K + 10 . $

This covers the tiny covers, fixed fresh probes, and bounded pin and marked-profile tests.
  The growing lists of length proportional to $N$ in 45 instead use an absolute reference-law count,
  as explained in its proof.

The exponential demands of the no-cover argument are simultaneously satisfiable in this order.
  Fix a phase-test threshold $theta.alt > 0$ smaller than the required fixed phase accuracy,
  and choose a constant $Gamma > D + 2 r + 1$ large enough to absorb the indicated density and bounded-rank tensor
  counts. With $L_theta.alt = log_2 \( 1 \/ theta.alt \)$, it suffices to arrange

#[#set math.equation(numbering: n => "(17.4)")
 $ c_s / 2 (q_0 / 2 log_2 \( 1 \/ p_0 \) - 2 - L_theta.alt) & > Gamma \,\
c_s / 2 (frac(h q_0, 4) - L_theta.alt) & > Gamma . $ <eq:ledger-p0-demand>]

The first determines a sufficiently small $p_0$ using only early quantities;
  the second is a later lower bound on $h$. Indeed the two moment terms are $2^(2 s)
  p_0^(q_0 s \/ 2)$ and $2^(- h q_0 s \/ 4)$, and Markov at threshold $theta.alt$ costs $2^(s L_theta.alt)$.
  The comparison between raw and independent channel laws has a factor depending on $h$,
  but it is constant in $n$ and does not alter the linear exponents.

For the bounded tiny-cover record use

$ R_0 = 2^(100 \( r + 1 \)^2 \( d_0 + \| cal(E) \| + 1 \)) \, wide delta_(upright("ph")) =
  frac(p_0 delta_(upright("cov")), 64 R_0) \, wide delta_(*) = 10^(- 6) delta_(upright("ph")) \/ 64 . $

The preparation argument supplies these early retained-mass bounds and $c_(*) = delta_(*)^2 \/ 64 > 0$,
  as in (10.9). They measure retained unit mass and successful pair mass in the original pooled law with endpoint
  bound $M pi$. Choose

#[#set math.equation(numbering: n => "(17.5)")
 $ 0 < eta_(upright("col")) < c_(*) \/ 4 \, wide 0 < a < min { 1 \/ 100 \,
   eta_(upright("col")) \/ 800 } . $ <eq:ledger-colours>]

A colour partition is refined into leaves with their actual weights; preparation is performed on their pooled law.
  Thus these margins are independent of both the number of colours and the smallest positive colour mass.
  Indeed original equal-colour pair mass is at most $sum_c p_c^2 lt.eq eta_(upright("col"))$;
  after restriction of mass $delta_(*)$ its normalized mass is at most $eta_(upright("col")) \/ delta_(*)^2$.
  Either calculation gives strictly positive successful mass after the colour exclusion.

Now prescribe $0 < beta lt.eq 1$, and choose $L > 10^6 \/ beta$, as in (16.6).
  Larger values of $beta$ follow by weakening the graph assertions.
  For the matrix obstruction one chooses $beta$ sufficiently small in terms of $a$, which is permitted here.
  Fix the additional bounded marginal factors and positive injection/phase tolerances required by the asymmetric
  test with this $L$. These later fixed tolerances may depend on $L$;
  they do not change the preceding $delta_(*) \, c_(*) \, eta_(upright("col"))$.
  In particular the two preparation problems need not have the same success margin.

Next choose the row and selector parameters:

#[#set math.equation(numbering: n => "(17.6)")
 $ R_(*) & = 2 \( K + 20 \) \, & j_(*) & gt.eq 10 \( K + 1 \) \( R_(*) + 20 \) \,\
B_0 & = 2 \| cal(E) \| K \( R_(*) + 14 \) \, & B_(*) & = 10 \( B_0 + 10000 g + 1 \) \,\
2^(b - 2 j_(*)) & > 100 g \( B_(*) + 1 \) \, & p_(*) & = sum_(j = 0)^(j_(*)) binom(b, j) \,\
A & = 10 \( K + 1 \) p_(*) \( g^2 + 5 \) \, & s_0 & = 4 ceil.l A ceil.r \, wide
  J > 100 \( s_0 + K^2 + 1 \) . $ <eq:ledger-selectors>]

Integer inequalities are met by rounding upward when needed. This agrees with Lemma 6.2, Lemma 6.5.
  In particular $j_(*)$ exceeds the interpolation degree required for $\( K + 1 \) \( R_(*) + 14 \)$ labels.
  The length $b$ is chosen before $A$, and hence before $s_0 \, J$.

Now choose a sufficiently large integer $r_0$, always setting

#[#set math.equation(numbering: n => "(17.7)")
 $ h = 1000 r_0 . $ <eq:ledger-channels>]

The demands are finite in number and depend only on preceding constants:

+ the moment demand (17.4);
+ fixed-cover and fresh-probe transpose-injection errors in 43;
+ the unconditional transpose-injection estimate in 45;
+ residual ranks and private-channel space in 39;
+ the tester rank inequality in 49.

Each is eventually satisfied by increasing $r_0$. Quantitative checks appear below.

After fixing $h$, choose the thinning rate $rho > 0$. It is enough to require

#[#set math.equation(numbering: n => "(17.8)")
 $ 10^4 \| cal(E) \| 2^(2 h) rho < min { zeta \/ 100 \, 10^(- 6) \, epsilon.alt_(upright("img")) \,
   epsilon.alt_(upright("inj")) } \, $ <eq:ledger-thinning-rate>]

where the positive constants $epsilon.alt_(upright("img"))$ and $epsilon.alt_(upright("inj"))$ are chosen below
  the reserved full-frame image and injection rate margins. Those margins are fixed before this choice. Put

$ kappa_(upright("thin")) = 2 \| cal(E) \| \( 2^h - 1 \) \, wide tau_(upright("thin")) = 10 \| cal(E) \| 2^h rho . $

The thinning lemma gives

#[#set math.equation(numbering: n => "(17.9)")
 $ pi^2 lt.eq 2^(tau_(upright("thin")) N) sans(P)_0^2 \, wide 3000 g + tau_(upright("thin")) < D -
   1 . $ <eq:ledger-thinned-density>]

Thus the distribution-test pair cap leaves a fixed positive reserve below the absolute cap $2^(D N) sans(P)_0^2$,
  even after bounded normalizations and removal of exponentially light colours.
  The survival fraction is asymptotic to $2^(- kappa_(upright("thin")) rho N)$.
  Because $kappa_(upright("thin")) rho < .01$, the simultaneous additive concentration error $2^(- .1 N)$ in the
  construction of the thinning sets is exponentially smaller than this fraction.
  Its use in conditional probabilities is therefore justified.

Finally choose a sufficiently large integer $M_0$, also relative to $1 \/ rho$, and put

#[#set math.equation(numbering: n => "(17.10)")
 $ N = M_0 n \, wide m = 2^(C_0 g N) . $ <eq:ledger-final-dimensions>]

The coefficient of every $O \( n \)$ count paid as a fraction of $N$ has then been fixed.
  Choose $M_0$ to make all those fractions smaller than their prescribed slacks.
  Only afterward does $n$ tend to infinity through integers with $n gt.eq 2 r_0$. The resulting dependency order is

$ \( C_0 \, g \, D \, M \, k_max \, zeta \, K_1 \)
  arrow.r \( r \, L_0 \, d_0 \, u_0 \, K \, upright("early tolerances") \, p_0 \, delta_(*) \, c_(*) \)\
arrow.r \( eta_(upright("col")) \, a \) arrow.r \( beta \, L \, upright("asymmetric tolerances") \)\
arrow.r \( R_(*) \, j_(*) \, B_0 \, B_(*) \, b \, p_(*) \, A \, s_0 \, J \) arrow.r \( r_0 \, h \) arrow.r
  rho arrow.r M_0 arrow.r n . $

Here $b$ is only the selector length; $beta$ is the graph threshold.
  The fixed palette has size at most $ceil.l 1 \/ \( 2 a \) ceil.r + 1$,
  and changes only bounded complexities and the sufficiently-large-$n$ onset.

=== 17.2 The channel demands precede later tests <the-channel-demands-precede-later-tests>

In the frequent-output argument, a fixed collection of $L_0$ fresh probes succeeds on B-mass at least

#[#set math.equation(numbering: n => "(17.11)")
 $ q_(*) = \( delta_(upright("cov")) \/ 2 \) \( delta_(upright("cov")) \/ 4 \)^(L_0) > 0 . $ <eq:ledger-probe-mass>]

The one-vertex density factor depends only on the early marked-law restrictions and $p_0$.
  Transpose-injection failure on the fixed fresh vectors is at most that factor times $O \( L_0 \) 2^(L_0 - h)$.
  It can be made smaller than $q_(*) \/ 2$ by increasing $h$,
  without consulting a selector choice or a future common test. The later raw-event exponent is at most

$ - \( .99 - .51 \) L_0 N + D N + upright("small linear errors") . $

The specified $L_0$ leaves a margin close to $\( .48 L_0 - D \) N$.
  The small coefficient-count errors are paid by $M_0$.

For 45 only the unconditional accepting family is needed.
  The independent primal-span part uses the unchanged primal marginals.
  For the channel part, the estimate with $ell = floor.l N \/ \( 10 \( K + 1 \) \)
  floor.r$ compares $c^ell$ with $2^(- \( h - 2 K \) ell + o \( N \))$,
  where $c > 0$ is fixed by the required failure tolerance. A sufficient demand is

#[#set math.equation(numbering: n => "(17.12)")
 $ h > 2 K + log_2 \( 1 \/ c \) + 30 \( K + 1 \) . $ <eq:ledger-injection-demand>]

It leaves a positive linear exponent margin. The thinning loss in (17.8) is chosen smaller than that margin;
  fixed marginal factors cost only constants. In particular this estimate does not require a table-dependent
  tolerance or a new pinning step.

For channel realization, the explicit bounds in (7.5), (7.10), (7.11), (7.12) are

$ B_(upright("lin")) & = 3 K + 28 \, & R_(upright("res")) & = 14 K + 140 \,\
D_(upright("blk")) & = 2 p_(*) \| cal(E) \| \( K + 14 + R_(upright("res")) \) \, & D_(upright("quo")) & =
  2 p_(*) #scale(x: 120%, y: 120%)[\(] 1 + \( g^2 + 3 \) D_(upright("blk")) #scale(x: 120%, y: 120%)[\)] + 2 K . $

The pure correction rank per component is at most $30 r_0 + 28 J \| cal(E) \| + D_(upright("quo"))$,
  and the remaining channel pairing has rank at least $h - 2 K - 4 B_(upright("lin"))$. Thus (7.14) asks precisely for

#[#set math.equation(numbering: n => "(17.13)")
 $ 970 r_0 > 28 J \| cal(E) \| + D_(upright("quo")) + 2 K + 4 B_(upright("lin")) . $ <eq:ledger-realization-demand>]

Every quantity on the right is independent of $h \, r_0 \, n$ and is fixed by parameters through $J$.
  The baseline first factors through bounded pin/key projections on primal inputs,
  then derivative corrections of bounded rank are chosen, and the small residual is compressed before the
  $r_0$-sized pure terms are factored through private channels.

The tester inequality in 49 is

#[#set math.equation(numbering: n => "(17.14)")
 $ frac(g - 1, 2) (g - frac(4 D, g)) r_0 > 2 \( g - 1 \) \( h + 2 J K_1 \) + 1 . $ <eq:ledger-pure-tester-demand>]

Substituting $D = 4000 g$ and $h = 1000 r_0$ gives

$ frac(g - 20000, 2) thin r_0 > 4 J K_1 + frac(1, g - 1) . $

The coefficient on the left is positive for the specified $g$.
  This is therefore another compatible lower bound on $r_0$.

=== 17.3 Pin, atom, and tensor-rank ledger <pin-atom-and-tensor-rank-ledger>

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Bound and role
]),
  table.cell(rowspan: 1, colspan: 1)[First pin dimension
], table.cell(rowspan: 1, colspan: 1)[$K_1$, summed over components and signs.
],
  table.cell(rowspan: 1, colspan: 1)[Pin dimension used throughout
], table.cell(rowspan: 1, colspan: 1)[At most $K_1$, hence at most the conservative budget $K$.
],
  table.cell(rowspan: 1, colspan: 1)[Tiny-cover dimension
], table.cell(rowspan: 1, colspan: 1)[At most $d_0 = 4 r L_0$; its offset record has a bounded number of possibilities.
],
  table.cell(rowspan: 1, colspan: 1)[Effective space
], table.cell(rowspan: 1, colspan: 1)[$dim C_i lt.eq K^2$; every member has total component rank at most $K$.
],
  table.cell(rowspan: 1, colspan: 1)[Attack atoms at one endpoint
], table.cell(rowspan: 1, colspan: 1)[At most $14$, across its two lists.
],
  table.cell(rowspan: 1, colspan: 1)[Component rank in the annihilator argument
], table.cell(rowspan: 1, colspan: 1)[$2 \( K + 14 \) lt.eq R_(*) = 2 \( K + 20 \)$.
],
  table.cell(rowspan: 1, colspan: 1)[List length per cross edge
], table.cell(rowspan: 1, colspan: 1)[At most $7$ on either side.
],
  table.cell(rowspan: 1, colspan: 1)[Atom positions in one unit’s full query
], table.cell(rowspan: 1, colspan: 1)[At most $4 dot.op 7 = 28$.
],
  table.cell(rowspan: 1, colspan: 1)[General key-vector slots
], table.cell(rowspan: 1, colspan: 1)[$28 dot.op 2 \( g - 1 \) = k_max = 56 \( g - 1 \)$.
],
)
]

Each tag atom occupies $g - 1$ star components and supplies one plus and one minus vector at each.
  These are vector counts, not scalar Gram counts. The label exclusions in 33 give nominal independence modulo the
  pins, as proved in 38, part (ii). The effective-space dimension is counted in projected pin bases:
  for a fixed endpoint $sum_e dim S_(i \, e)^plus.minus lt.eq K$, so

$ sum_e dim \( S_(i \, e)^(+) ⊗ S_(i \, e)^(-) \) lt.eq (sum_e dim S_(i \, e)^(+)) (sum_e dim S_(i \, e)^(-))
  lt.eq K^2 . $

Thus an effective tensor basis is encoded in bounded projected coordinates,
  not as unrestricted matrices with $O \( n^2 \)$ entries.

The unprojected representation of one gradient in 39 has per-component rank at most

$ 15 r_0 + 14 J \| cal(E) \| . $

Two endpoint contributions give $30 r_0 + O \( 1 \)$. If $A_(+) \, A_(-)$ remove bounded pin/key subspaces, then

$ "rank" \( M - A_(+)^(sans(T)) M A_(-) \) lt.eq "rank" \( I - A_(+) \) + "rank" \( I - A_(-) \) . $

Hence this projection contributes only bounded residual rank,
  without multiplying the tester rank by a pin-dependent constant.
  The later blockwise compression and derivative corrections preserve that independence from $r_0$.

=== 17.4 Scalar records and the final dimension multiplier <scalar-records-and-the-final-dimension-multiplier>

Write

#[#set math.equation(numbering: n => "(17.15)")
 $ d_n = dim cal(B) = p_(*) #scale(x: 120%, y: 120%)[\(] 1 + \( g^2 + 3 \) n #scale(x: 120%, y: 120%)[\)] .
   $ <eq:ledger-column-dimension>]

Then

$ d_n / N = frac(p_(*) \( g^2 + 3 \), M_0) + frac(p_(*), M_0 n) . $

This ratio, and the ratio after adding the bounded channel dimension,
  can be made arbitrarily small by choosing $M_0$ last. In particular the image estimate can use a fixed
  sufficiently small $epsilon < zeta \/ 4$. For the tiny-cover calculation impose, in addition,
  that the total primal coefficient-count and image loss be smaller than $rho \/ 12$.
  The same choice leaves room for the injective frames and prescribed self-Gram values.

The collision records are linear in $n$. There are at most $56$ point inputs across two units, costing at most

$ 56 \( g^2 + 3 \) n + 56 b $

bits. A list of $K$ nominal pin directions uses at most $2 K \( d_n + h \)$ coefficient bits,
  plus bounded component, sign and rank indices. Once pin projections are fixed,
  a basis of $C_i$ uses at most $K^4$ binary coefficients in its tensor-coordinate space;
  there are four endpoints. Tester summaries, numerical small tables,
  projection relationships and finite statuses have bounded lengths in $n$.
  The construction matrices $E \, L \, R$ are fixed data and are not encoded afresh in each query record.

The total frozen dimension of a unit is at most $K + k_max$, over all components and signs.
  There are $2 \( d_n + h \)$ nominal columns of a given sign at each component.
  Recording all interactions of both units’ columns with opposite frozen images therefore uses at most

$ 4 \( d_n + h \) \( K + k_max \) $

scalar bits. The deterministic solution is selected from these data and the point parameters.
  No unrestricted $O \( n^2 \)$-entry matrix is appended. The number of record cells,
  including bounded nominal choices when needed, is consequently at most

#[#set math.equation(numbering: n => "(17.16)")
 $ 2^(C_(upright("rec")) n + C_(upright("rec") \, 0)) \, $ <eq:ledger-record-count>]

for constants fixed before $M_0$.

Only mixed primal-channel Gram entries are tested in the final target.
  For one cross Gram block and component, the two endpoint primal summands have total dimension $2
  d_n$ and the channel summands have total dimension $2 h$ on either side.
  The two mixed products contain at most $8 d_n h$ entries. There are two cross Gram blocks; hence at most

#[#set math.equation(numbering: n => "(17.17)")
 $ 16 \| cal(E) \| thin h thin d_n $ <eq:ledger-tested-gram-bits>]

bits are tested. Frozen or redundant entries only reduce this count.
  This is $O \( n \)$, with coefficient already fixed.

Choose $M_0$ to meet every earlier coefficient/codimension slack and, in particular, so that for sufficiently large $n$,

#[#set math.equation(numbering: n => "(17.18)")
 $ log_2 \( upright("record-cell count") \) < .005 N \, wide
   upright("tested scalar Gram bits") < .01 N . $ <eq:ledger-collision-bit-slacks>]

The smaller image and pin-count slacks form a finite collection and can be met by the same final enlargement of $M_0$.

The conditional point-mass estimate on a surviving cell is

$ log_2 p_max \/ N & lt.eq - \( 1 - 2 zeta \) \( k + t \) + \( k + .01 \)\
 & = - \( 1 - 2 zeta \) t + .01 + 2 zeta k lt.eq - .95 t wide \( t gt.eq 1 \, med k lt.eq k_max \) . $

Here $2 zeta k lt.eq .002$. A nonzero quotient character of rank $t$ has mean at most

$ 2^(t N \/ 2) #scale(x: 120%, y: 120%)[\(] 2^(- .95 t N) 2^(- .95 t N) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) =
  2^(- .45 t N) . $

This pays for fewer than $.01 N$ scalar bits, leaving agreement probability at least $2^(- .02 N)$.
  For each fixed parameter pair and key, pruning cells below $2^(- \( k + .01 \) N)$ loses overlap at most

$ 2 \| cal(K)_n \| thin 2^(C_(upright("rec")) n + C_(upright("rec") \, 0)) 2^(- \( k + .01 \) N) \, $

which is exponentially small since $\| cal(K)_n \| lt.eq 2^(k N)$ and (17.18) holds.
  This uses Fubini at a fixed parameter pair, without intersecting pruning decisions over all opposite parameters.

=== 17.5 Probability scales and later analytic choices <sec:probability-scales>

The marginal distinctions used in the proof are summarized below.
  A bounded multiplier may depend on a fixed preparation restriction; it is independent of $n$.

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Mechanism
], table.cell(rowspan: 1, colspan: 1)[Scale and permissible cost
]),
  table.cell(rowspan: 1, colspan: 1)[Thinned reference law
], table.cell(rowspan: 1, colspan: 1)[Primal marginal exactly that of $sans(P)_0$;
  full pair density at most $2^(tau_(upright("thin")) N) sans(P)_0^2$.
],
  table.cell(rowspan: 1, colspan: 1)[Original tested unit law
], table.cell(rowspan: 1, colspan: 1)[Joint cap $Q_N pi^2$; both endpoint marginals at most $M pi$,
  or $L pi$ for the asymmetric test.
],
  table.cell(rowspan: 1, colspan: 1)[Prepared mixed law
], table.cell(rowspan: 1, colspan: 1)[Absolute joint cap within the reserved $2^(D N) sans(P)_0^2$ budget;
  bounded marginals relative to $pi$, hence bounded primal marginals relative to the original primal law.
],
  table.cell(rowspan: 1, colspan: 1)[Normalized leaves
], table.cell(rowspan: 1, colspan: 1)[A common $2^(C_(upright("leaf")) N)
  sans(P)_0^2$ cap and fresh-image min-entropy with at most $2 zeta$ slack;
  no bounded individual full-frame marginal is asserted.
],
  table.cell(rowspan: 1, colspan: 1)[Fixed-cost preparation restrictions
], table.cell(rowspan: 1, colspan: 1)[Positive mass fixed before $h$;
  bounded logarithmic costs are absorbed by rate reserves.
],
  table.cell(rowspan: 1, colspan: 1)[Single-endpoint typicality
], table.cell(rowspan: 1, colspan: 1)[Error $2^(- Omega \( n \))$, tested on primal frames;
  arbitrary channel-dependent flags remain flags.
],
  table.cell(rowspan: 1, colspan: 1)[Paired oversampling and cross-rank failures
], table.cell(rowspan: 1, colspan: 1)[Error $2^(- Omega \( n^2 \))$, surviving $2^(O \( N \)) =
  2^(O \( n \))$ joint inflation.
],
  table.cell(rowspan: 1, colspan: 1)[Tiny-cover compatible pairs
], table.cell(rowspan: 1, colspan: 1)[Positive mass fixed before $h$,
  using either the identically zero full-sum phase or the additional thinning gain.
],
  table.cell(rowspan: 1, colspan: 1)[Key equality
], table.cell(rowspan: 1, colspan: 1)[Factor $\| cal(K)_n \|^(- 1) gt.eq 2^(- k N)$, $k lt.eq k_max$.
],
  table.cell(rowspan: 1, colspan: 1)[Final four-hole probability
], table.cell(rowspan: 1, colspan: 1)[$2^(- \( k_max + .03 \) N - o \( N \))$,
  exceeding $2^(- 100 g N)$ for sufficiently large $n$.
],
)
]

For clarity, the extra gain from thinning is not obtained by subtracting the full-frame density loss from $rho$.
  On a fixed tiny-cover record, the companion tuple of length $t$ has primal point probability at most
  $2^(- t N + rho N \/ 12)$. If the full output is nonzero,
  one endpoint must have a nonzero channel combination in a prescribed nonzero translate of its allowed set.
  Conditional on its primal frame, 24 bounds that event by $2^(- rho N \/ 2)$.
  The point probability of companion plus nonzero full output is therefore at most $2^(- t N - rho N \/ 3)$,
  after absorbing fixed normalizations. The Walsh estimate pairs one such bound with a companion-only bound,
  giving at most

$ 2^(\( t_A + t_B \) N \/ 2) #scale(x: 120%, y: 120%)[\(] 2^(- t_A N + rho N \/ 12) 2^(- t_B N - rho N \/ 3)
  #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq 2^(- rho N \/ 12) . $

There is no exponential union over these records: one of their boundedly many values was fixed at an early
  constant mass cost. If the full output is zero on the retained record,
  the lifted phase vanishes for every ordered retained pair. Both cases supply constant compatibility mass.
  No further peeling or inverse-polynomial compatibility branch is used.

Fixed-cost restrictions are compatible with the leaf trimming in 27.
  More generally, if a later analytical restriction has total mass $q_n = 2^(- o \( N \))$,
  leaves on which its relative mass is below $2^(- zeta N)$ contribute at most

$ 2^(- zeta N) \/ q_n = 2^(- \( zeta - o \( 1 \) \) N) $

of the restricted law. On the other leaves division costs at most $2^(zeta N)$,
  changing $\( 1 - zeta \) t N$ to at worst $\( 1 - 2 zeta \) t N$ for every positive rank $t$.
  This trimming preserves the old pins. Marginal hypotheses for later empirical common tests concern the primal
  projection; none requires replacing $pi$ by $sans(P)_0$ in a full-frame marginal inequality.

Partitions, entropy bounds, weak-product accuracies and finite transformation sample sizes are analytical choices
  made after the construction constants. They may depend on $M_0$, a fixed positive test-cell mass,
  or a fixed accuracy. They do not change pin ranks, key-slot counts or the scalar record coefficient in (17.16).
  For each finite common-test stage these choices change only constants and the required onset in $n$;
  a diagonal subsequence passes each fixed finite stage in turn. No rate uniform over all such stages is needed.

For example, unary positivity uses $gamma = 2^(- K^2 - 3)$ and $b_(upright("int")) = 2^(- J + 2 s_0) < gamma$.
  On a reference key cell of mass at least $delta > 0$, the proof first obtains conditional input mass at least
  $delta \/ 2$, so it can use

$ u > frac(2, delta \( gamma - b_(upright("int")) \)^2) $

transformations. This changes the constant in $O_u \( 2^(- s_0 n) \)$, while $s_0 =
  4 ceil.l A ceil.r$ and the profile count $2^(A n)$ remain fixed.
  Thus a smaller cell does not require a larger construction parameter $J$.

The final collision margin is

$ 100 g - \[ 56 \( g - 1 \) + .03 \] = 44 g + 55.97 > 0 . $

This positive exponent gap absorbs any fixed positive subsequential overlap constant.
  A violating sequence for either distribution test would yield one limit model with positive successful overlap,
  which contradicts its asserted upper bound $2^(- 100 g N)$. Uniformity over all limit models is unnecessary.

Finally, 16 uses $Q_N = 2^(3000 g N)$ and $m = 2^(1000 g N)$. Entropy fingerprints have logarithmic count

$ O \( N^3 2^(100 g N) \) = o \( m \) . $

For either fixed positive linear choice of $k$, the coloured exceptional-pair estimate is

$ m^(2 k) \( 4 \/ Q_N \)^k = 2^(- \( 1000 g N - 2 \) k) . $

The coloured position exception has mass less than $8 \/ M$; at $k =
  ceil.l m \/ 100 ceil.r$ its tail is at most $\( 800 e \/ M \)^k$.
  Fewer than $4 \/ eta_(upright("col"))$ exceptional colours, each of size at most $2 a m$,
  account for fewer than $m \/ 100$ matching edges by (17.5).
  In the asymmetric transfer use $k = ceil.l beta m \/ 100 ceil.r$;
  vertex and point exceptional sets have mass below $1 \/ L$, with tail at most $\( 100 e \/ \( beta L \) \)^k$.
  These bounds pay for the $exp \( o \( m \) \)$ terminal union and prove the graph properties at $m \/
  20$ and $beta m \/ 10$, respectively.

== 18 Compact measure constructions used in the proof <sec:measure-constructions>

The spectral argument and the common signature model use compactness only for compact metric spaces,
  countable arrays, and bounded finite measures. We record constructions for these particular uses,
  including the jointly measurable densities in 73.

#thm([Lemma 18.1.])[
  (Compact arrays and finite measures).  #emph[Let $X$ be a compact metric space and $C < oo$.
    The positive Borel measures on $X$ of mass at most $C$ form a compact metrizable space for convergence against
    continuous functions. Countable products of compact metric spaces are compact metrizable.
    If $nu_j$ converges weakly to $nu$ and $F subset.eq X$ is closed, then $limsup_j nu_j \( F \) lt.eq nu \( F \)$.]
] <lem:compact-measures>

#proof[
  Choose nested finite Borel partitions of $X$ whose cell diameters tend to zero.
    Such partitions result by taking a finite cover by balls of arbitrarily small radius,
    making it disjoint by successive differences, and refining the previous partition.
    Given a sequence of measures, successive subsequences make every cell mass converge,
    as well as the total mass. The limiting cell masses are nonnegative and consistent under refinement.
  Realize these masses by subdividing an interval of the limiting total length,
    first into intervals of the masses of the first partition,
    then recursively into intervals for its refinements. Outside the countable set of subdivision endpoints,
    each interval point specifies a nested sequence of cells.
    Representatives from those cells form a Cauchy sequence: all representatives after level $j$ belong to one
    cell of diameter tending to zero. Compactness gives a limiting point of $X$.
    The representative step maps are measurable, so their limit is measurable.
    Push forward interval length by this limit map. Uniform continuity shows that the integral of each continuous
    function is the limit of its finite representative sums. The same sums approximate the integrals of the
    original measures uniformly. This proves weak subsequential compactness, including zero limiting mass.
  Continuous functions on $X$ have a countable uniformly dense family.
    For instance, finite nets from a countable dense subset of $X$,
    together with continuous distance cutoffs and rational values,
    give uniformly accurate piecewise weighted approximations to each continuous function.
    If $\( f_j \)$ is such a family, convergence of the integrals of all $f_j$ metrizes weak convergence on
    measures of bounded mass, by uniform approximation. The preceding subsequence argument therefore gives
    compactness in that metric. For a countable product use the metric $sum_j 2^(- j) min { 1 \, d_j }$;
    successive coordinate subsequences and a diagonal choice prove its compactness.
  Finally the continuous functions $f_k \( x \) = max { 0 \, 1 -
    k thin d \( x \, F \) }$ decrease to $upright(bold(1))_F$.
    For every $k$, weak convergence gives $limsup_j nu_j \( F \) lt.eq integral f_k thin d nu$.
    Bounded monotone approximation as $k arrow.r oo$ gives the stated closed-set inequality. ◻
]

In particular, consistent masses of finite bit cylinders define a measure on the compact bit-sequence space:
  apply the interval subdivision construction directly to the successive bit prefixes.
  If the masses depend measurably on a stored record, all subdivision thresholds are measurable functions of that
  record. Using an additional uniform interval coordinate gives a jointly measurable sample.
  The same construction works for a compact metric target using the nested partitions above:
  evaluation of a measure on a Borel cell is measurable in the weak topology.
  For closed cells this follows from continuous distance cutoffs,
  and a monotone-class argument gives all Borel cells. Two independent interval coordinates sample independently
  from the two conditional measures stored in 73. Thus the argument retains those conditional measures before
  taking limits; it does not interchange an unrecorded conditional distribution with a weak limit.

#thm([Lemma 18.2.])[
  (Densities of dominated cylinder measures).  #emph[Let $X$ be a compact bit-sequence space with Borel
    probability $m$, let $theta$ have a probability law, and suppose $nu_theta$ is a measurable family of measures
    satisfying $0 lt.eq nu_theta lt.eq m$. There is a jointly measurable $h \( theta \, x \)
    in \[ 0 \, 1 \]$ such that, for almost every $theta$, $nu_theta \( A \) =
    integral_A h \( theta \, x \) thin d m \( x \)$ for every Borel $A$.
    Conditional averages of an $L^2 \( m \)$ function on increasing finite-prefix partitions converge in $L^2 \( m \)$.]
] <lem:cylinder-densities>

#proof[
  Let $cal(P)_k$ be the partition by the first $k$ bits, and set $h_k \( theta \, x \) =
    nu_theta \( C \) \/ m \( C \)$ when $x in C in cal(P)_k$ and $m \( C \) > 0$, with value zero on null cells.
    These functions are jointly measurable and lie in $\[ 0 \, 1 \]$.
    Their successive differences are orthogonal in $L^2 \( d Pr \( theta \) thin d m \( x \) \)$,
    because the average of $h_(k + 1) - h_k$ over each parent cell is zero for every $theta$.
    The squared norms of $h_k$ are bounded by one. Hence $\( h_k \)$ is Cauchy in $L^2$,
    and has an $L^2$ limit $h$. One can see completeness here directly:
    choose a subsequence with summable $L^2$ norms of its successive differences;
    their $L^1$ norms are also summable, giving an almost-everywhere convergent sum with the required $L^2$ tail
    bound. A further almost-everywhere convergent subsequence makes $h$ jointly measurable with values in
    $\[ 0 \, 1 \]$.
  For each cylinder $C$, all sufficiently late $h_k$ integrate over $C$ to $nu_theta \( C \)$.
    Convergence in the product $L^2$ space gives the same identity for $h$,
    first in $L^1$ of $theta$ and thus almost surely. There are countably many cylinders,
    so these identities hold simultaneously outside one null set. They then extend to all Borel sets:
    the class of sets approximable in measure by the finite cylinder algebra is a sigma-algebra,
    and both measures are dominated by $m$.
  Finite-cell averaging is an $L^2$ contraction by Cauchy–Schwarz.
    Cylinder-simple functions are dense in $L^2 \( m \)$, by simple-function approximation and the same cylinder
    approximation of measurable sets. Approximating a function by such a simple function and using the contraction
    proves the final assertion. ◻
]

Rescaling gives the same density construction for $nu_theta lt.eq R m$.
  For countably many ordered measures, the versions can be chosen simultaneously with their almost-everywhere
  ordering; their increasing supremum represents the increasing supremum of the measures. This is the use in 74.
  The integration identity for the sampled kernels holds first for rectangle indicators.
  The class of sets satisfying it is closed under complements and disjoint countable unions;
  hence it holds on the product sigma-algebra and then for nonnegative or bounded measurable integrands by
  simple-function approximation. These constructions justify the limiting integrations and projections used in 13.

#bibliography("refs.bib", style: "ieee", title: [References])
