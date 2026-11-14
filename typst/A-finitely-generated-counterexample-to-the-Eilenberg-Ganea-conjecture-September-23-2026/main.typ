#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A finitely generated counterexample to the \
Eilenberg--Ganea conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a discrete group $Gamma$, its integral cohomological dimension $"cd"_(bb(Z))
  Gamma$ is the projective dimension of the trivial left $bb(Z) \[ Gamma \]$-module $bb(Z)$:
  it measures the length of the shortest projective resolution of $bb(Z)$.
  Its geometric dimension $"gd" Gamma$ is the least dimension of a connected CW complex with fundamental group
  $Gamma$ and contractible universal cover. Such a complex is a #emph[classifying space],
  or a $K \( Gamma \, 1 \)$. These are ordinary dimensions;
  no family of subgroups or proper-action variant is involved.
  The cellular chains of a contractible universal cover give a free resolution, so $"cd"_(bb(Z)) Gamma lt.eq
  "gd" Gamma$.

The Eilenberg–Ganea theorem of 1957 identifies these dimensions when $"cd"_(bb(Z)) Gamma gt.eq 3$.
  In dimension one, Stallings proved that a finitely generated group of integral cohomological dimension one is
  free, and Swan removed the finite-generation hypothesis #cite(label("Stallings1968")) #cite(label("Swan1969"));
  a free group has a one-dimensional classifying space. The remaining dimension-two conjecture asks whether every
  group of integral cohomological dimension two has a two-dimensional classifying space #cite(label("EG1957")).
  We answer this question negatively with a finitely generated residually finite group.
  Here #emph[residually finite] means that every nonidentity element remains nonidentity in some finite quotient.

Our group comes from a finite simplicial complex. A simplicial complex is #emph[flag] if every finite set of
  pairwise adjacent vertices spans a simplex. For such a complex $L$ with vertex set $V$,
  the associated #emph[right-angled Artin group] is

$ A_L = ⟨a_q med \( q in V \) med mid(bar.v) med \[ a_q \, a_r \] = 1 upright(" if ") { q \,
  r } upright(" is an edge of ") L⟩ . $

The #emph[height homomorphism] $lambda : A_L arrow.r bb(Z)$ sends every standard generator $a_q$ to $1$.
  Its kernel is a Bestvina–Brady group. Acyclicity below always means vanishing reduced integral homology.

#thm([Theorem 1.1.])[
  #emph[There is a finitely generated residually finite group $G$ such that
$ "cd"_(bb(Z)) G = 2 \, wide "gd" G = 3 . $

 One may take $G$ to be the height kernel in the right-angled Artin group associated to a finite acyclic flag
   triangulation of the presentation complex
#[#set math.equation(numbering: n => "(1.1)")
 $ chevron.l x \, y divides x^2 = y^5 \, med x^2 = \( x y^(- 1) \)^3 chevron.r . $ <eq:seed-presentation-intro>]

 No two-dimensional classifying space for this $G$ exists, regardless of the number of its cells.]
] <thm:main>

Section 4 constructs the triangulation and proves the stated algebraic and geometric properties of its height
  kernel. Finite generation also makes $G$ countable, so restricting the conjecture to countable groups does not
  restore it.

Proposition 13 also supplies a length-two resolution of the trivial $bb(Z) \[ G \]$-module $bb(Z)$ by finitely
  generated free $bb(Z) \[ G \]$-modules. A group admitting such a finite-length free resolution is said to be of
  #emph[type $upright("FL")$]. Consequently, $G$ is of #emph[type $upright("FP")_oo$]:
  it admits a projective resolution with finitely generated terms in every degree.
  Here the length-two free resolution extends to such a projective resolution by taking all higher terms to be
  zero. The group is not finitely presented: $L$ has nontrivial fundamental group by Lemma 9,
  and the Bestvina–Brady finite-presentability criterion applies #cite(label("BB1997")) Main Theorem, part (3).

=== History and the obstruction <history-and-the-obstruction>

Bestvina and Brady used height kernels to distinguish homological from homotopical finiteness conditions
  #cite(label("BB1997")) Main Theorem. Their acyclic two-dimensional examples provide candidates for the
  dimension-two problem #cite(label("BB1997")) Example 6.3(3).
  For suitable flag triangulations of a spine of the Poincaré homology sphere,
  they proved that at least one of the Eilenberg–Ganea and Whitehead conjectures fails #cite(label("BB1997"))
  Theorem 8.7. Whitehead’s asphericity question asks whether every connected subcomplex of an aspherical
  two-dimensional CW complex is aspherical #cite(label("Whitehead1941"));
  see also #cite(label("BB1997")) Section 8. The classical alternative does not itself determine the geometric
  dimension of a height kernel. Leary and Petrosyan give a recent conditional comparison between Coxeter and
  Bestvina–Brady candidates for the ordinary problem #cite(label("LP2026")) Section 5.6,
  Conjecture 5.20 and Corollary 5.21.

Dicks and Leary describe height kernels by edge generators and power relators associated to cycles
  #cite(label("DicksLeary1999")) Theorem 1 and Proposition 2.
  Howie studied related Bestvina–Brady examples through plus constructions and obtained finite-rank free relation
  modules #cite(label("Howie1999")). These works provide the construction and relation-module setting for the
  present paper. The interface needed here is the particular free basis represented by triangular boundary chains;
  its exact form is displayed below and proved directly in Proposition 13.

The obstacle is that a free action on an acyclic two-complex supplies a short free resolution,
  whereas a classifying space requires a contractible universal cover.
  An acyclic complex need not be contractible. Proving that one acyclic model is noncontractible therefore leaves
  open the possibility of a different two-dimensional classifying space.
  We compare the cycle module of the acyclic model with the presentation arising from #emph[any] hypothetical
  two-dimensional classifying space. The comparison permits arbitrary sets of generators and relators in that
  hypothetical model.

=== The geometric model and the proof interfaces <the-geometric-model-and-the-proof-interfaces>

For the complex $L$ in Theorem 1, form the union of the coordinate subtori in $\( S^1 \)^V$ indexed by the
  simplices of $L$, using the common basepoint in all other coordinates.
  This is a cubical model for $A_L$ with a contractible three-dimensional universal cover $E$.
  Identify its vertices with $A_L$. The height homomorphism extends affinely over its cubes, and

$ X = lambda^(- 1) \( 0 \) subset E $

is a two-dimensional level complex with vertex set $G$. The group $G =
  ker lambda$ acts freely on $X$ by left translation, with one vertex orbit and finitely many cell orbits.
  Proposition 13 proves that $X$ is acyclic and that $G$ is finitely generated and residually finite,
  with $"cd"_(bb(Z)) G = 2$ and $"gd" G lt.eq 3$. These are the geometric inputs to the obstruction;
  their proofs are included in Section 4.

Here is the exact algebraic information supplied by $X$. Choose the lift based at $1$ of one oriented edge in each
  $G$-orbit. Its endpoint is the value of the corresponding letter in a finite generating alphabet $S$ for $G$;
  distinct edge orbits retain distinct letters. Reading the boundaries of representatives of the triangular
  two-cell orbits gives a finite indexed list $cal(D)$ of words on $S$.
  Write parenthesized superscripts for direct sums. For $Lambda = bb(Z) \[ G \]$, let $partial_1 :
  Lambda^(\( S \)) arrow.r Lambda$ be the cellular edge boundary and let $\[ z \]$ be the edge chain of a word $z
  in cal(D)$. The canonical map

$ Lambda^(\( cal(D) \)) arrow.r ker partial_1 \, wide e_z mapsto \[ z \] \, $

is an isomorphism. Thus the specified boundary chains form a free basis, with both spanning and independence.
  The words in $cal(D)$ are trivial in $G$, but they need not be a presentation of $G$;
  this distinction is the reason for the comparison argument.

We use labels in $H = "SU" \( 2 \)$, identified with the unit quaternions.
  An edge labeling assigns an element of $H$ to each oriented edge and the inverse element to its reverse.
  A #emph[path product] multiplies the labels in traversal order;
  for a closed path we also call this its #emph[holonomy]. A labeling is #emph[flat on the triangles] when every
  triangular boundary has product $1$. The two main interfaces give incompatible conclusions about these labels:

+ Theorem 4 shows that a hypothetical two-dimensional $K \( G \, 1 \)$ would force every sufficiently small
  labeling, flat on all translates of the words in $cal(D)$, to have trivial product along every closed path.
+ Proposition 14 constructs, for every $epsilon.alt > 0$,
  labels of distance less than $epsilon.alt$ from $1$ that are flat on every triangle of $X$ and have nontrivial
  product along some closed path.

Choosing the second labeling below the threshold in the first statement excludes every two-dimensional classifying
  space. The quotient $E \/ G$ supplies a three-dimensional one.

=== How the comparison and transport work <how-the-comparison-and-transport-work>

Boundary chains record signed edge traversals but forget their order,
  so equal chains need not give equal path products in $H$.
  Theorem 4 overcomes this loss of information using an actual aspherical presentation.
  After adding generators with defining relators, we change the relator words so that a finite distinguished list
  has exactly the boundary chains $\[ z \]$ supplied by $X$;
  all additional generators represent the identity of $G$ and therefore give loop edges.
  The word identities in this presentation yield exact translated signed counts.
  Once the remaining relator equations hold, these counts cancel the linear discrepancy between the distinguished
  products and the triangular products. Commutators of elements close to $1$ contribute only a quadratic error.
  The construction works even if the hypothetical presentation has infinitely or uncountably many generators and
  relators.

This estimate prevents the distinguished products from reaching a fixed positive distance from $1$ while the
  prescribed edge labels remain sufficiently small. On a finite quotient,
  each finite collection of the remaining relator equations has independent vectors recording the total exponents
  of the unknown labels. The word-equation degree method of Gerstenhaber and Rothaus #cite(label("GR1962")),
  with related representation-theoretic applications in Frøyshov #cite(label("Froyshov2013")),
  supplies the starting point for solving these systems. At the coefficient-free starting system,
  Lemma 2 gives nonzero degree on the conjugation-invariant region where the distinguished products are small.
  The quadratic barrier preserves this degree as the prescribed labels move to their required values.

Residual finiteness allows us to copy any finite collection of prescribed labels to a suitable quotient.
  Compactness then gives labels on all additional edges of the original graph.
  Since the original triangular products are exactly $1$, the same quadratic estimate forces the distinguished
  products to be exactly $1$ as well. All relators of an actual presentation now vanish,
  so every closed path has trivial product. The original labeling need not descend to any single finite quotient.

The transport construction contradicts this conclusion. Reduced words in $A_L$ give maps from the graph of $X$ to
  $L$ whose edge and triangle-boundary images are uniformly small,
  while special long paths map exactly around prescribed loops of $L$.
  The seed in Equation (1.1) supplies a nontrivial representation $pi_1 \( L \) arrow.r "SU" \( 2 \)$.
  Pulling its transport back along these maps gives small edge labels:
  the small triangle images force trivial triangular products,
  and an exactly traced loop detected by the representation retains nontrivial holonomy.
  Section 5 constructs the maps and labels explicitly.

=== Conventions and organization <conventions-and-organization>

We measure distance in $H$ by the quaternion norm $lr(|a - b|)$; this metric is bi-invariant.
  Our traversal-order convention makes the product along a path followed by another path the product of their
  respective labels in that order. We use

#[#set math.equation(numbering: n => "(1.2)")
 $ lr(|a_1 dots.h.c a_k - 1|) lt.eq sum_(j = 1)^k lr(|a_j - 1|) \, wide lr(|a b - b a|) lt.eq
   2 lr(|a - 1|) lr(|b - 1|) . $ <eq:quaternion-basic>]

The first inequality follows by telescoping; the second follows by expanding $a b -
  b a = \( a - 1 \) \( b - 1 \) - \( b - 1 \) \( a - 1 \)$.

Group rings act from the left. Generator edges run from $g$ to $g s$,
  and translating a path by $g$ means left translation. We work in ordinary set theory with choice,
  including compactness of products indexed by arbitrary sets.

Section 2 proves the localized degree statement. Section 3 derives the presentation obstruction,
  including its arbitrary-cardinality comparison and compactness steps.
  Section 4 constructs the seed, the group and the acyclic level model,
  and Section 5 constructs the small labels and completes the contradiction.
  Standard CW topology, covering-space theory, and finite-dimensional degree theory enter with their stated
  hypotheses at the relevant steps.

== 2 Degree on a conjugation-invariant part of a word fiber <sec:degree>

The comparison argument will need a solution that remains in a specified part of a word map’s identity fiber as
  its coefficients vary. A global degree calculation does not locate that solution.
  When the exponent-sum matrix is nonsingular, we prove nonvanishing for any conjugation-invariant isolating part
  that contains the identity.

Write $H = "SU" \( 2 \)$ as the group of unit quaternions.
  We orient $H$ once and give $H^m$ the product orientation.
  A #emph[word map] $f : H^m arrow.r H^m$ has coordinates that are words in its $m$ arguments and their inverses,
  without coefficients. Its exponent-sum matrix $B = \( B_(i j) \)$ records the total exponent of the $j$th
  argument in the $i$th word.

We use ordinary mapping degree on an isolating open set. Thus, if $M$ is a closed oriented $n$-manifold, $f :
  M arrow.r M$ is smooth, and $y in.not f \( partial cal(O) \)$,
  then $deg \( f \, cal(O) \, y \)$ counts the part of $f^(- 1) \( y \)$ in $cal(O)$.
  It is defined even when $partial cal(O)$ is not smooth. For the compact selected fiber $K =
  f^(- 1) \( y \) ∩ cal(O)$, map the local orientation class in $H_n \( cal(O) \, cal(O) \\ K \; bb(Z) \)$ to
  $H_n \( M \, M \\ { y } \; bb(Z) \) tilde.equiv bb(Z)$. This relative-homology construction gives excision and
  homotopy invariance while the boundary avoids $y$; when $y$ is regular it gives the signed count of preimages.
  We use the relative orientation class over a compact subset from #cite(label("Hatcher2002")) Lemma 3.27(a),
  together with excision. Regular fibers and the signed-degree and homotopy-invariance facts are supplied by
  #cite(label("Milnor1965")) Section 2, Lemmas 1–2; Section 5, Theorems A–B.

The global degree formula for compact connected Lie groups goes back to Gerstenhaber and Rothaus
  #cite(label("GR1962")) Theorem 1; for $H = "SU" \( 2 \)$ it gives $deg f = det B$.
  A coefficient-free formulation also appears in #cite(label("Froyshov2013")) Proposition 2.1.
  We need a statement about an individual invariant part of the fiber.
  The following proof provides that localization directly.

#thm([Lemma 2.1.])[
  (Localized word-map degree).  #emph[Let $m gt.eq 1$, and let $f : H^m arrow.r
    H^m$ be a word map with $det B eq.not 0$. Suppose that $cal(O) subset H^m$ is open,
    invariant under simultaneous conjugation, contains $upright(bold(1))$, and satisfies
$ partial cal(O) ∩ f^(- 1) \( upright(bold(1)) \) = diameter . $

 Then $deg \( f \, cal(O) \, upright(bold(1)) \) eq.not 0$.]
] <lem:localized-degree>

#proof[
  Let $J = { e^(i theta) : theta in bb(R) }$ be the standard maximal torus.
    On $J^m$, the map $f$ is the torus homomorphism with matrix $B$.
    In particular, its fiber over $upright(bold(1))$ consists of $lr(|det B|)$ points,
    each regular for the torus restriction, each with tangent sign $"sign" \( det B \)$.
    Let $b$ be the number of these points in $cal(O)$. The identity is one of them, so $b gt.eq 1$.
  Fix an odd prime $p > b$. Simultaneous conjugation by $e^(2 pi i \/ p)$ generates a cyclic group $C_p$ acting on
    $H^m$. Its fixed set is $J^m$, and the action is free off $J^m$:
    since $p$ is prime, a nontrivial stabilizer is the whole group. The word map is equivariant.
    We shall perturb it equivariantly, without changing its restriction to $J^m$,
    until $upright(bold(1))$ is regular. The fixed preimages will each contribute $"sign" \( det B \)$,
    while the others will contribute in multiples of $p$.
  #emph[Regularizing the fixed preimages.] At a torus root $x$,
    use left-translated exponential coordinates in the source and exponential coordinates at $upright(bold(1))$ in
    the target. Since $x$ commutes with $J$, the coordinate actions are the same adjoint representation:
  $ bb(R)^m xor bb(C)^m \, wide \( u \, v \) mapsto \( u \, e^(4 pi i \/ p) v \) . $
  Here the real directions are the $i$-directions, and each complex plane is spanned by $j \, k$.
    An equivariant derivative has no mixed blocks, because the normal rotation has no fixed vector.
    Its normal block $N$ is complex linear: commuting with the nonreal scalar $e^(4 pi i \/ p)$ is equivalent to
    commuting with multiplication by $i$. The tangent block is $B$.
  Choose mutually disjoint invariant coordinate neighborhoods of all torus roots.
    Each can be chosen entirely inside $cal(O)$ or entirely outside its closure,
    because no root lies on the boundary. In one such chart add
  $ \( u \, v \) mapsto s chi \( u \, v \) \( 0 \, v \) $
  to the coordinate expression of $f$, where $chi$ is an invariant smooth bump function equal to one near the
    root. Choose $s in bb(R)$ arbitrarily small with $det_(bb(C)) \( N + s I \) eq.not 0$;
    only finitely many real values are excluded. This changes neither the torus restriction nor the tangent block.
    The resulting derivative is invertible, and its sign is
  $ "sign" \( det B \) thin "sign" det_(bb(R)) \( N + s I \) = "sign" \( det B \) \, $
  since the real determinant of an invertible complex linear map is positive.
    The coordinate orientations can be chosen compatibly in source and target.
    Each fixed preimage is now isolated and regular.
  #emph[Regularizing the remaining preimages.] Choose an invariant open neighborhood of each regular fixed root,
    with closure contained in a coordinate neighborhood where that root is the only zero.
    Keep the map unchanged near the closures of the chosen neighborhoods.
    The zero set outside their union is closed in $H^m$, hence compact. It lies in the free-action locus:
    a sequence of these remaining zeros approaching $J^m$ would limit to a torus root,
    already inside one of the chosen neighborhoods.
  Cover this compact set by finitely many smaller coordinate neighborhoods,
    each inside a larger neighborhood whose $p$ translates are disjoint.
    Different families of translates need not be disjoint from one another.
    Choose the closures of the bump supports to map into a smaller target logarithm ball,
    and keep the parameters small enough that every perturbed value stays in the larger exponential coordinate
    ball. In these target coordinates, add a vector parameter times a bump function in each larger neighborhood,
    and propagate the change to its translates by equivariance.
    Choose the bumps positive on the smaller neighborhoods. Near every remaining zero at least one parameter block
    therefore gives a surjective derivative to the target. By compactness,
    sufficiently small perturbations introduce no zeros elsewhere outside the protected fixed-root neighborhoods.
  The joint map of source point and parameters is consequently transverse to $upright(bold(1))$ near all its
    zeros. The regular-value theorem and Sard’s theorem, applied to the projection of its zero manifold onto
    parameter space, give arbitrarily small parameter values for which the slice has only regular zeros.
    These are standard finite-dimensional results; no equivariant transversality theorem is needed on the fixed
    set. All perturbations can be kept uniformly small enough that $partial
    cal(O)$ stays disjoint from the fiber over $upright(bold(1))$, since this boundary is compact.
    Homotopy invariance preserves the selected degree.
  Every nonfixed zero of the resulting equivariant map occurs in an orbit of $p$ points.
    The local signs in an orbit agree: conjugation preserves the orientations of both source and target.
    The signed-count formula thus gives
  $ deg \( f \, cal(O) \, upright(bold(1)) \) equiv b thin "sign" \( det B \) med \( mod med p \) . $
  The right side is nonzero modulo $p$, since $0 < b < p$. The degree is therefore nonzero. ◻
]

#prodef([Remark 2.2.])[
  The same argument works for arbitrarily large odd primes,
    so it actually gives $deg \( f \, cal(O) \, upright(bold(1)) \) = b thin "sign" \( det B \)$.
    Only nonvanishing is needed below. When there are no variables and no equations,
    the corresponding map is the identity of a point, with degree one.
]

== 3 Comparison with an arbitrary aspherical presentation <sec:presentation>

Let $Gamma$ be a group with a finite generating alphabet $S$.
  Distinct letters are kept distinct, even if they have the same value in $Gamma$.
  Its generator graph has vertices $g in Gamma$ and an oriented edge $\( g \, s \)$ from $g$ to $g s$ for each $s
  in S$. Put $Lambda = bb(Z) \[ Gamma \]$, acting on chains on the left.
  For a word $w$ on $S$, write $macron(w)$ for its value in $Gamma$ and $\[ w \]$ for the chain of the path
  starting at $1$. Thus

$ partial_1 : Lambda^(\( S \)) arrow.r Lambda \, wide partial_1 \( e_s \) = s - 1 \, wide partial_1 \[ w \] =
  macron(w) - 1 . $

Here and throughout this section, a parenthesized superscript denotes a #emph[direct sum].
  All words and all chains have finite support.

#thm([Theorem 3.1.])[
  (The presentation comparison theorem).  #emph[Suppose that $Gamma$ is residually finite and that $cal(D)$ is a
    finite indexed list of words on $S$, trivial in $Gamma$, whose chains form a free $Lambda$-basis of $ker
    partial_1$. Thus the canonical map
#[#set math.equation(numbering: n => "(3.1)")
 $ Lambda^(\( cal(D) \)) arrow.r ker partial_1 \, wide e_z mapsto \[ z \] \, $ <eq:cycle-basis>]

 is an isomorphism. If $Gamma$ admits a $K \( Gamma \, 1 \)$ of dimension at most two,
   there is an $eta > 0$ with the following property. Assign a label in $H =
   "SU" \( 2 \)$ to every oriented generator edge, assign the inverse label to its reverse,
   and assume that every label has distance less than $eta$ from $1$.
   If the product along every translate of every $z in cal(D)$ is $1$,
   then the product along every closed edge path is $1$.]
] <thm:presentation>

The words in $cal(D)$ need not present $Gamma$. This distinction is the reason a comparison argument is necessary.
  We first arrange an arbitrary aspherical presentation so that its relators include a finite list with chains
  exactly $\[ z \]$. The remaining relators give independent word equations in additional loop labels.
  A uniform quadratic estimate isolates the small values of the distinguished relators.
  We solve finite systems on finite group quotients by Lemma 2,
  and then use compactness to obtain an extension of the original labels.
  The presentation used in this argument can have any cardinality.

=== 3.1 A presentation with distinguished boundary chains <a-presentation-with-distinguished-boundary-chains>

The correspondence between relator operations and group-ring boundary operations is classical;
  compare Fox’s transformation (III) in #cite(label("Fox1954")) Section 2.
  We give the word realization explicitly because the presentation here may have arbitrary index sets.

#thm([Lemma 3.2.])[
  #emph[Under the hypotheses of Theorem 4, including the existence of the two-dimensional $K \( Gamma \, 1 \)$,
    there is a presentation
$ Gamma = chevron.l S \, cal(T) divides \( rho_z \)_(z in cal(D)) \, med \( r \)_(r in cal(R)) chevron.r $

 with the following properties:]
  + #emph[every letter of $cal(T)$ has value $1$ in $Gamma$;]
  + #emph[the complete relator boundary list is a $Lambda$-basis of the cycle module of the generator graph on $S
    product.co cal(T)$;]
  + #emph[$\[ rho_z \] = \[ z \]$ as edge chains, for each $z in cal(D)$;]
  + #emph[projecting the ordinary boundaries $\[ r \]$, $r in cal(R)$,
    to the $cal(T)$-edge coordinates gives an isomorphism
#[#set math.equation(numbering: n => "(3.2)")
 $ Lambda^(\( cal(R) \)) arrow.r^(med tilde.equiv med) Lambda^(\( cal(T) \)) . $ <eq:ordinary-projection>]

]
  #emph[No finiteness assumption is imposed on $cal(T)$ or $cal(R)$.]
] <lem:aligned-presentation>

#proof[
  Start with any two-dimensional $K \( Gamma \, 1 \)$. Collapse a maximal tree in its connected one-skeleton and
    replace the two-cell attaching loops by finite edge words. These operations preserve the homotopy type:
    a contractible CW subcomplex can be collapsed, and homotopic attaching maps give homotopy equivalent
    adjunction spaces #cite(label("Hatcher2002")) Propositions 0.17 and 0.18.
    These facts apply to infinite CW complexes as well; a loop in a graph is homotopic to a finite edge path.
    The resulting presentation complex has one vertex, with some sets of generators and relators.
    Its universal cover is acyclic and has no cells above dimension two.
    Consequently its relator boundary map is an isomorphism onto the cycle module.
    The relator words also normally generate the kernel of the map from the free generator group to $Gamma$.
  Adjoin the prescribed letters $S$, with one definition relator for each letter.
    Each new relator boundary has coefficient $1$ on its own new edge and coefficient $0$ on the other new edges.
    Subtracting these boundaries reduces any cycle uniquely to an old cycle,
    so the boundary basis property persists. For each former generator $a$,
    choose a word $w_a \( S \)$ with value $a$ in $Gamma$, and replace $a$ by $t_a w_a \( S \)$.
    This is an invertible change of free generators: its inverse sends $t_a$ to $a
    w_a \( S \)^(- 1)$ and fixes $S$. The new letters $t_a$ all have value $1$.
    On edge chains the substitution fixes the $S$-edges and sends $e_a$ to $e_(t_a) + \[ w_a \]$,
    so it is a chain isomorphism and preserves the boundary basis property.
    Let $T$ be the set of these new letters, $R$ the current relator index set, and $I = cal(D) product.co T$.
    Equation (3.1) identifies the cycle module with $Lambda^(\( I \))$.
    In these coordinates the relator boundary map is an isomorphism
  $ A : Lambda^(\( R \)) arrow.r Lambda^(\( I \)) . $
  We next arrange that the prescribed cycles themselves occur as relator boundaries.
    An auxiliary copy of the cycle module allows the three shears below to move this basis into a new relator
    block. Adjoin letters $U = \( u_i \)_(i in I)$ and defining relators $u_i$. The stabilized boundary map is
  $ D_0 = mat(delim: "(", A, 0; 0, 1) : Lambda^(\( R \)) xor Lambda^(\( I \)) arrow.r
    Lambda^(\( I \)) xor Lambda^(\( I \)) \, $
  where the second target summand consists of the $U$-edges. On its domain put
  $ P = mat(delim: "(", 1, A^(- 1); 0, 1) \, wide Q = mat(delim: "(", 1, 0; - A, 1) . $
  These are blocks of homomorphisms of left modules; all products below mean composition. Direct multiplication gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ P Q P = mat(delim: "(", 0, A^(- 1); - A, 0) \, wide D_0 P Q P =
     mat(delim: "(", 0, 1; - A, 0) . $ <eq:presentation-shears>]
  We realize each of the successive precompositions $P \, Q \, P$ by actual relator words.
    A shear leaves one block of words unchanged and adds to each boundary in the other block a finite sum $sum_k
    n_k g_k \[ b_k \]$ of translates of unchanged boundaries.
    Choose a generator word $v_k$ representing $g_k$ and multiply the changing relator by copies of $v_k
    b_k^(plus.minus 1) v_k^(- 1)$, with the indicated multiplicities and signs.
    All these words represent $1$ in $Gamma$; the added boundary is precisely the stated sum.
    The unchanged words belong to both old and new relator lists,
    so the old changing word is recovered from the new one by a finite inverse multiplication.
    Thus the old and new lists have exactly the same normal closure.
    Every column of $A$ and $A^(- 1)$ has finite support because their domains and targets are direct sums.
    Hence this construction uses finite words for every relator even when the index sets are uncountable.
    It does not require an infinite product of words or a limiting sequence of presentation moves.
  In the final second block, the relator indexed by $i in I$ has boundary $\( e_i \, 0 \)$.
    Designate those indexed by $z in cal(D)$ as $rho_z$. Set $cal(T) = T product.co U$.
    The remaining second-block relators are indexed by $T$, and the first-block relators are indexed by $R$;
    these are the ordinary relators, with $cal(R) = T product.co R$. Their projected boundary map is, in these orders,
  #[#set math.equation(numbering: n => "(3.4)")
   $ mat(delim: "(", 1_T, 0; 0, - A) : Lambda^(\( T \)) xor Lambda^(\( R \)) arrow.r^(med tilde.equiv med)
     Lambda^(\( T \)) xor Lambda^(\( I \)) . $ <eq:ordinary-diagonal>]
  Equation (3.3) also shows that the complete boundary list remains a basis.
    Normal closure was preserved at every step, so these are the relators of an actual presentation of $Gamma$. ◻
]

The relators now form an actual presentation, and their boundaries are aligned with the chosen cycle basis.
  The next step extracts information that survives evaluation in the nonabelian group $H$:
  exact signed counts will cancel the linear error, leaving a quadratic estimate.

=== 3.2 Exact counts and a uniform quadratic estimate <exact-counts-and-a-uniform-quadratic-estimate>

Fix the presentation supplied by Lemma 5. For every $z in cal(D)$,
  choose a finite normal-closure expression in the free group on $S product.co cal(T)$:

#[#set math.equation(numbering: n => "(3.5)")
 $ z = product_(j = 1)^(n_z) u_(z \, j) thin r_(z \, j)^(sigma_(z \, j)) u_(z \, j)^(- 1) \, wide
   sigma_(z \, j) in { 1 \, - 1 } . $ <eq:relator-expression>]

Each $r_(z \, j)$ is an indexed final relator, ordinary or distinguished.
  Let $cal(T)_0 subset cal(T)$ consist of the finitely many extra letters appearing in the words $u_(z \, j)$.
  For each $t in cal(T)_0$, also fix a finite expression of $t$ as a product of conjugates of final relators and
  their inverses. Finally choose a finite set $cal(A) subset
  cal(R)$ containing every ordinary relator used in these expressions, both those for $z$ and those for $t$.

#thm([Lemma 3.3.])[
  #emph[In the free module on all final relator indices,
#[#set math.equation(numbering: n => "(3.6)")
 $ sum_(j = 1)^(n_z) sigma_(z \, j) macron(u)_(z \, j) e_(r_(z \, j)) = e_(rho_z) . $ <eq:translated-counts>]

]
] <lem:exact-counts>

#proof[
  The boundary of a conjugate $u r^sigma u^(- 1)$ is $sigma macron(u) \[ r \]$:
    the two conjugating paths cancel as chains because $r$ has group value $1$.
    Every factor in Equation (3.5) also has value $1$, so multiplying the factors introduces no further prefix
    translations in its chain. Applying the complete relator boundary isomorphism to the left side of
    Equation (3.6) therefore gives $\[ z \]$. The right side has the same image, namely $\[ rho_z \] = \[ z \]$.
    Injectivity gives the asserted equality, coefficient by coefficient. ◻
]

We will use labels either on $Gamma$ or on any finite quotient $F$ of $Gamma$.
  In the latter case the graph is formed with the prescribed images of the generators,
  retaining distinct edges for distinct alphabet letters even when their images coincide.
  All extra-generator edges are loops in either graph. Write $L \( w \, v \)$ for the product of the labels along
  the word $w$ starting at $v$, in traversal order. Endpoints depend only on the group values of the letters,
  not on their labels. Consequently free word identities can be evaluated on these graphs. In particular,

$ L \( u r^sigma u^(- 1) \, v \) = L \( u \, v \) L \( r \, v macron(u) \)^sigma L \( u \, v \)^(- 1) quad
  upright("if ") macron(r) = 1 \, $

with group values projected to $F$ when appropriate.

#thm([Lemma 3.4.])[
  (Uniform estimate).  #emph[There is a constant $C gt.eq 1$, depending only on the finite choices above,
    with the following property on $Gamma$ and on every finite quotient.
    Suppose that all $S$-labels have distance at most $epsilon.alt$ from $1$,
    and that all translates of the ordinary relators in $cal(A)$ have product $1$. Put
$ h = sup_(z in cal(D) \, med v) \| L \( rho_z \, v \) - 1 \| \, $

 where the supremum is $0$ if $cal(D)$ is empty. If $0 lt.eq h \, epsilon.alt lt.eq 1$, then,
   for every $z in cal(D)$ and vertex $v$,
#[#set math.equation(numbering: n => "(3.7)")
 $ \| L \( z \, v \) - L \( rho_z \, v \) \| & lt.eq C \( h + epsilon.alt \) h \,\
\| L \( z \, v \) - 1 \| & lt.eq C epsilon.alt . $ <eq:quadratic-estimate>]

]
] <lem:quadratic-estimate>

#proof[
  For unit quaternions, telescoping products and bi-invariance give
  #[#set math.equation(numbering: n => "(3.8)")
   $ lr(|product_(j = 1)^n a_j - product_(j = 1)^n b_j|) lt.eq sum_(j = 1)^n \| a_j - b_j \| \, wide \| a b -
     b a \| lt.eq 2 \| a - 1 \| thin \| b - 1 \| . $ <eq:quaternion-estimates>]
  The second inequality follows by expanding $a b - b a = \( a - 1 \) \( b - 1 \) - \( b - 1 \) \( a - 1 \)$.
    Inverses and conjugation preserve distance from $1$.
  Evaluate the fixed expression for each $t in cal(T)_0$ at any vertex.
    Ordinary relators disappear, and every distinguished factor has distance at most $h$ from $1$,
    regardless of its conjugator. Thus
  $ \| L \( t \, v \) - 1 \| lt.eq M h wide \( t in cal(T)_0 \) $
  for one finite constant $M$, independent of the vertex and the group quotient.
    No bound on the conjugators in these auxiliary expressions is required.
    Each $u_(z \, j)$ uses only letters of $S product.co cal(T)_0$, so another fixed constant $K$ gives
  $ \| L \( u_(z \, j) \, v \) - 1 \| lt.eq K \( epsilon.alt + h \) . $
  On evaluating Equation (3.5), discard its ordinary factors.
    Removing the conjugation from a remaining factor costs at most
  $ \| a b a^(- 1) - b \| = \| a b - b a \| lt.eq 2 K \( epsilon.alt + h \) h \, $
  including when the relator occurs with exponent $- 1$. There are at most $n_z$ such factors.
  The resulting factors are values of distinguished relators, or their inverses, at specified vertices.
    Any interchange of two adjacent factors costs at most $2 h^2$, by Equation (3.8).
    Group together occurrences having the same relator index and the same vertex;
    at most $n_z \( n_z - 1 \) \/ 2$ interchanges are needed.
    Their signed multiplicities are prescribed exactly by Equation (3.6), translated from $1$ to $v$.
    On a finite quotient, coincident vertices merely add the corresponding coefficients,
    so the same identity still applies. After cancellation within each group,
    the product is exactly $L \( rho_z \, v \)$. The total error is bounded by
  $ 2 n_z K \( epsilon.alt + h \) h + n_z \( n_z - 1 \) h^2 . $
  Since $cal(D)$ is finite, this proves Equation (3.7) with one $C$.
    The word $z$ contains only $S$-letters, so $\| L \( z \, v \) - 1 \| lt.eq "length" \( z \) epsilon.alt$.
    Increasing $C$ proves Equation (3.7) as well. If the distinguished list is empty,
    the two assertions are vacuous and any $C gt.eq 1$ suffices. ◻
]

Fix from now on numbers $0 < delta < 1$ and $0 < eta < 1$ such that

#[#set math.equation(numbering: n => "(3.9)")
 $ C \( delta + eta \) < 1 / 2 \, wide C eta < delta / 2 . $ <eq:small-thresholds>]

Under the hypotheses of Lemma 7, with $epsilon.alt lt.eq eta$, the value $h = delta$ is impossible.
  Indeed, taking the supremum in its two inequalities gives

#[#set math.equation(numbering: n => "(3.10)")
 $ h & lt.eq C epsilon.alt + C \( h + epsilon.alt \) h \;\
h = delta & med arrow.r.double med delta lt.eq C eta + C \( delta + eta \) delta < delta . $ <eq:no-threshold-crossing>]

The supremum need not be attained for this argument.

The constants $C$, $delta$, and $eta$ are now fixed, independently of any finite quotient or finite collection of
  equations. The exclusion of $h = delta$ will keep the degree calculation inside the region of small
  distinguished products while the prescribed labels move.

=== 3.3 Solving finite systems by degree <solving-finite-systems-by-degree>

#thm([Lemma 3.5.])[
  #emph[Let $F$ be any finite quotient of $Gamma$, and prescribe arbitrary $S$-edge labels on $F$ of distance less
    than $eta$ from $1$. For every finite set $cal(B) subset cal(R)$ containing $cal(A)$,
    there are labels on all $cal(T)$-edges such that
$ L \( r \, v \) = 1 quad \( r in cal(B) \, med v in F \) \, wide
  max_(z in cal(D) \, med v in F) \| L \( rho_z \, v \) - 1 \| < delta . $

 The maximum over an empty distinguished list is interpreted as $0$.]
] <lem:finite-quotient-solvability>

#proof[
  Tensor the isomorphism (3.2) with the right $Lambda$-module $bb(Z) \[ F \]$. This gives an isomorphism
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(Z) \[ F \]^(\( cal(R) \)) arrow.r^(med tilde.equiv med) bb(Z) \[ F \]^(\( cal(T) \)) . $ <eq:quotient-basis>]
  No flatness claim is involved: tensoring the inverse gives an inverse to the displayed map.
    As an abelian-group basis, the source has indices $\( v \, r \) in F times cal(R)$.
    Its image consists of the projected boundary chains of $r$ based at $v$.
    Thus the chains for $F times cal(B)$ are linearly independent over $bb(Q)$.
  Give an unknown $x_(v \, t) in H$ to each extra edge $\( v \, t \)$.
    In the equation $L \( r \, v \) = 1$, the exponent count of each unknown is exactly its coefficient in the
    projected boundary chain. This holds even though the fixed $S$-labels need not commute:
    the path traversed is determined by the generator values in $F$, and all $t in cal(T)$ have value $1$.
    Write the $m = \| F \| thin \| cal(B) \|$ exponent vectors as rows.
    Their union of supports is finite, and their row rank is $m$.
    Choose $m$ unknowns giving a nonsingular $m times m$ integer minor $B$,
    and set every other extra label equal to $1$.
  Move all the prescribed $S$-labels from $1$ to their final values along the short quaternion arcs,
    with common parameter $tau in \[ 0 \, 1 \]$. These arcs stay at distance less than $eta$ from $1$.
    The selected equations now define a continuous family of smooth maps
  $ f_tau : H^m arrow.r H^m . $
  For an assignment $x in H^m$, let
  $ h \( tau \, x \) = max_(z in cal(D) \, med v in F) \| L_tau \( rho_z \, v \; x \) - 1 \| \, wide cal(O)_tau =
    { x : h \( tau \, x \) < delta } . $
  Only finitely many words occur here, so $h$ is continuous.
    Every root $f_tau \( x \) = upright(bold(1))$ satisfies all equations from $cal(A)$.
    Equation (3.10) therefore implies
  #[#set math.equation(numbering: n => "(3.12)")
   $ f_tau \( x \) = upright(bold(1)) quad arrow.r.double quad h \( tau \, x \) eq.not delta . $ <eq:root-isolation>]
  If $m = 0$, the domain and target are points. The unique assignment starts with $h = 0$,
    and continuity together with Equation (3.12) keeps $h < delta$ throughout.
    This proves the assertion in that case; henceforth assume $m gt.eq 1$.
  We justify degree invariance with these moving open sets.
    For fixed $tau_0$, the roots with $h \( tau_0 \, x \) < delta$ form a compact set:
    by (3.12) they are also the roots with $h \( tau_0 \, x \) lt.eq delta$.
    Choose an open neighborhood $V$ containing exactly these roots, with $overline(V) subset cal(O)_(tau_0)$.
    If there are no such roots, take $V = diameter$. Compactness of $H^m$ and continuity show that,
    for all $tau$ sufficiently close to $tau_0$, every root with $h \( tau \, x \) < delta$ lies in $V$,
    every root in $overline(V)$ has $h \( tau \, x \) < delta$, and there is no root on $partial V$.
    For example, a sequence of selected roots outside $V$ with parameters tending to $tau_0$ would have a limit
    root with $h lt.eq delta$, hence $h < delta$, outside $V$, a contradiction.
    The other assertions follow in the same way, or from $overline(V) subset cal(O)_(tau_0)$.
    Excision and homotopy invariance of ordinary degree now give
  $ deg \( f_tau \, cal(O)_tau \, upright(bold(1)) \) = deg \( f_tau \, V \, upright(bold(1)) \) =
    deg \( f_(tau_0) \, V \, upright(bold(1)) \) $
  near $tau_0$. Thus the selected degree is locally constant, and hence constant on $\[ 0 \, 1 \]$.
  At $tau = 0$, the map $f_0$ is a pure word map with exponent matrix $B$: all fixed coefficients are $1$.
    The set $cal(O)_0$ is invariant under simultaneous conjugation, contains the identity assignment,
    and its boundary contains no root. Lemma 2 therefore gives
  $ deg \( f_0 \, cal(O)_0 \, upright(bold(1)) \) eq.not 0 . $
  The same holds at $tau = 1$, so a root exists in $cal(O)_1$, as required. ◻
]

Finite quotients now provide solutions for every finite set of ordinary relators,
  with the distinguished products uniformly bounded. To return to the original graph,
  we must preserve its prescribed $S$-labels exactly. The following compactness argument does this one finite
  collection of constraints at a time.

=== 3.4 Finite-coordinate compactness and the conclusion <finite-coordinate-compactness-and-the-conclusion>

We use compactness of arbitrary products of compact spaces #cite(label("Munkres2000")) Theorem 37.3.
  Its unrestricted index set is essential: the set of extra generators in the hypothetical presentation need not
  be countable.

#proof[
  Let $a$ be any prescribed labeling of the $S$-edges on $Gamma$ satisfying the theorem’s hypotheses,
    with the fixed $eta$ of Equation (3.9). In the compact product
  $ cal(P) = H^(Gamma times cal(T)) $
  consider all the following conditions on the unknown extra-edge labels:
  #[#set math.equation(numbering: n => "(3.13)")
   $ L \( r \, g \) & = 1 &  & \( r in cal(R) \, med g in Gamma \) \,\
\| L \( rho_z \, g \) - 1 \| & lt.eq delta &  & \( z in cal(D) \, med g in Gamma \) . $ <eq:compact-ordinary>]
  Each condition is closed and depends on finitely many coordinates.
    We verify the finite intersection property, keeping the original labeling $a$ fixed throughout.
  First choose an arbitrary finite collection $cal(C)$ of the conditions (3.13)–(3.13).
    Let $P subset Gamma$ be the finite set of starting vertices of all #emph[positively oriented] $S$-edges used
    when evaluating the words in $cal(C)$. An inverse occurrence traversing the edge from $g$ to $g
    s^(- 1)$ uses the positively oriented edge starting at $g s^(- 1)$,
    and this starting vertex is included in $P$. Let $cal(B)$ contain $cal(A)$ and all ordinary relator indices
    appearing in $cal(C)$. These choices are made before choosing a finite quotient.
  Residual finiteness supplies a finite quotient $q : Gamma arrow.r.twohead F$ that is injective on $P$:
    separate the finitely many nonidentity elements $p^(- 1) p'$ for distinct $p \, p' in P$,
    and let $F$ be the image of $Gamma$ in the product of the resulting finite quotients.
    For each $S$-edge actually used in $cal(C)$, assign to its image edge in $F$ its prescribed label from $a$.
    Injectivity on $P$ ensures that no two inconsistent prescriptions are placed on the same edge.
    Give every remaining $S$-edge of $F$ label $1$. All these labels have distance less than $eta$ from $1$.
  Apply Lemma 8 to this finite quotient, this assignment, and $cal(B)$.
    Pull the resulting extra-edge labels back by $q$, and combine them with the #emph[original] $S$-labels $a$ on
    $Gamma$. In every word from $cal(C)$, each traversed $S$-edge has the same label as its image in $F$,
    by construction; the same is true for each extra edge by pullback.
    Its path product therefore agrees with the quotient path product.
    The selected ordinary equations hold, and the selected distinguished products even have distance strictly less
    than $delta$. This supplies a point of $cal(P)$ satisfying $cal(C)$.
  We have proved: for each finite collection of constraints, one can choose a finite quotient,
    copy the finitely many required prescribed labels, solve a finite system there,
    and pull back a solution to that collection. The quotient may depend on the collection;
    the original assignment $a$ is never assumed to descend to any one finite quotient.
    Compactness of $cal(P)$ now gives an extension satisfying all of (3.13)–(3.13) simultaneously.
  For this extension, $h lt.eq delta$ and all the equations in $cal(A)$ hold.
    The original hypothesis says $L \( z \, g \) = 1$ for every $z$ and $g$.
    Taking suprema in Equation (3.7), with $epsilon.alt = eta$, gives
  $ h lt.eq C \( h + eta \) h lt.eq C \( delta + eta \) h < 1 / 2 h quad upright("if ") h > 0 . $
  Thus $h = 0$. All distinguished relators, as well as all ordinary relators, have product $1$ at every vertex.
    Finally, a closed edge path spells a word representing $1$ in $Gamma$.
    Because Lemma 5 gives an actual presentation, that word is a finite product of conjugates of final relators
    and their inverses. Evaluating at the starting vertex makes every factor $1$.
    Hence the original closed path has product $1$, as claimed. ◻
]

== 4 An acyclic level model for a height kernel <sec:geometry>

We use the height-kernel construction of Bestvina and Brady #cite(label("BB1997")).
  We give the geometric details, including the integral acyclicity statements that will supply the boundary basis
  required in Section 3.

=== 4.1 A finite seed with quaternion monodromy <a-finite-seed-with-quaternion-monodromy>

#thm([Lemma 4.1.])[
  #emph[There is a finite, connected, two-dimensional flag simplicial complex $L$ with
    $tilde(H)_(*) \( L \; bb(Z) \) = 0$ and a nontrivial homomorphism $alpha : pi_1 \( L \) arrow.r H = "SU" \( 2 \)$.]
] <lem:geometric-seed>

#proof[
  Start with the presentation complex $K$ of
  #[#set math.equation(numbering: n => "(4.1)")
   $ chevron.l x \, y divides x^2 y^(- 5) \, med x^2 \( x y^(- 1) \)^(- 3) chevron.r . $ <eq:seed-presentation>]
  The presented group also occurs in Hatcher #cite(label("Hatcher2002")) Example 2.38, with relations $a^5 =
    b^3 = \( a b \)^2$: take $a = y$ and $b = y^(- 1) x$. Indeed, $x^2 =
    y^5$ is central and $b$ is conjugate to $x y^(- 1)$. We verify the acyclicity of $K$ and construct the
    required $"SU" \( 2 \)$ representation directly.
  Its cellular boundary $C_2 \( K \; bb(Z) \) arrow.r C_1 \( K \; bb(Z) \)$ has exponent-sum rows $\( 2 \, - 5 \)$
    and $\( - 1 \, 3 \)$. Their determinant is $1$, so this boundary is an isomorphism.
    Since $K$ has one vertex and no cells above dimension two, it is integrally acyclic.
  Identify $H$ with the unit quaternions. Put $theta = pi \/ 5$ and choose imaginary unit quaternions $u \, v$ with
  $ u dot.op v = frac(1, 2 sin theta) \; $
  this is possible because $sin theta > 1 \/ 2$. Send $x$ to $u$ and $y$ to $cos theta + v sin theta$.
    Then $x^2$ and $y^5$ both map to $- 1$. Moreover, the real part of $u \( cos theta - v sin theta \)$ is $1 \/
    2$. A unit quaternion with real part $1 \/ 2$ has cube $- 1$, so both relations in (4.1) hold.
    The homomorphism is nontrivial because the image of $x$ is $u eq.not 1$.
  Here is a flag triangulation that avoids any assumption that a presentation complex is regular.
    Subdivide each circle of its one-skeleton into at least three edges.
    Express the two attaching maps as polygonal edge paths, and cone the boundary of each polygon to a new
    interior vertex before making the boundary identifications.
    Keep the radial edges indexed by the boundary occurrences:
    distinct occurrences of the same graph vertex give distinct radial edges.
    Every sector is now a closed triangle with three distinct vertices, and its closure is embedded.
    Indeed, its one outer edge is embedded in the subdivided graph,
    while its two radial edges have disjoint interiors. Thus this is a finite regular CW structure on $K$.
  Take the order complex of its nonempty cells, ordered by inclusion of closures. This triangulates $K$:
    inductively triangulate cell boundaries and cone each such triangulation from an interior point of the cell.
    Regularity makes these constructions compatible on common faces.
    The result is two-dimensional, and it is flag, since pairwise comparable cells form a chain. Call it $L$.
    The resulting homeomorphism transfers both acyclicity and the nontrivial homomorphism to $L$. ◻
]

Fix this $L$ and $alpha$ for the rest of the paper. Write $V$ for its finite vertex set and put

#[#set math.equation(numbering: n => "(4.2)")
 $ P = A_L = ⟨a_q med \( q in V \) med mid(bar.v) med \[ a_q \, a_r \] = 1 upright(" if ") { q \, r } in L⟩ \,\
lambda : P arrow.r bb(Z) \, quad lambda \( a_q \) = 1 \, wide G = ker lambda . $ <eq:height-kernel>]

The map $lambda$ is well defined and surjective. We shall prove all the properties of $G$ needed below directly.

=== 4.2 Residual finiteness and the cubical universal cover <residual-finiteness-and-the-cubical-universal-cover>

Residual finiteness is classical for graph products of residually finite groups #cite(label("Green1990"))
  Corollary 5.4; see also #cite(label("HsuWise1999")) Theorem 3.7.
  The following induction includes the retract-separation argument in the form needed here;
  compare #cite(label("HsuWise1999")) Lemma 3.9(1).

#thm([Lemma 4.2.])[
  #emph[The group associated to any finite commutation graph is residually finite.
    In particular, $P$ and $G$ are residually finite.]
] <lem:graph-group-rf>

#proof[
  We induct on the number of vertices. Delete one vertex, with generator $t$,
    and let $P'$ be the group on the remaining graph. The neighbors of the deleted vertex generate the graph group
    $C$. Both inclusions into $P'$ and into the original group are injective:
    killing the other generators gives retractions. Let $r : P' arrow.r C$ be the first of these retractions.
    There is an isomorphism
  #[#set math.equation(numbering: n => "(4.3)")
   $ P tilde.equiv F \( P' \/ C \) times.r P' \, $ <eq:graph-group-splitting>]
  where $P' \/ C$ denotes left cosets, $F \( P' \/ C \)$ is the free group on symbols $b_(q C)$,
    and $P'$ acts by left translation of their indices. To verify the formula,
    map $P'$ identically to the second factor and $t$ to $b_C$.
    This respects the relations $\[ t \, c \] = 1$ for $c in C$. Conversely, send $b_(q C)$ to $q t q^(- 1)$.
    This is independent of the representative of $q C$ and respects the semidirect-product action.
    The maps are inverse on the indicated generators.
  By induction $P'$ is residually finite. For $g in.not C$, we have $g eq.not r \( g \)$,
    so some finite quotient $p$ of $P'$ satisfies $p \( g \) eq.not p \( r \( g \) \)$.
    The map $\( p \, p compose r \)$ separates $g$ from $C$: every element of $C$ has equal coordinates,
    whereas $g$ does not. Taking a product of finitely many such maps shows that any finite list of distinct left
    cosets in $P' \/ C$ remains distinct in $D \/ overline(C)$ for a suitable finite quotient $D$ of $P'$,
    where $overline(C)$ is the image of $C$.
  Consider a nonidentity element $\( w \, q \)$ of (4.3). If $q eq.not 1$,
    a finite quotient of $P'$ separates it from the identity.
    If $q = 1$, choose $D$ preserving the distinct indices appearing in the nonempty reduced free word $w$.
    Its image is still nontrivial in $F \( D \/ overline(C) \) times.r D$. A free group is residually finite:
    for a nonempty reduced word of length $n$, prescribe its successive steps on distinct points $0 \, dots.h \,
    n$. For each free generator these steps prescribe an injective partial permutation,
    because the word has no adjacent inverse letters. Complete each partial permutation to a permutation of this
    finite set. The resulting finite permutation representation sends $0$ to $n$ along the word.
    Apply this fact to obtain a finite-index normal subgroup $N$ of $F \( D \/ overline(C) \)$ not containing the
    image of $w$. Intersect the finitely many translates of $N$ under $D$.
    The intersection is normal, has finite index, is $D$-invariant, and still omits $w$.
    Its quotient, semidirect $D$, is the required finite quotient. This proves the induction.
    Residual finiteness passes to subgroups, so it also holds for $G$. ◻
]

We now use the cubical construction in #cite(label("BB1997")) Theorem 5.12,
  giving a direct proof of its needed properties. Let $S_L$ be the union,
  inside the coordinate torus $\( S^1 \)^V$, of the coordinate subtori corresponding to the simplices of $L$,
  including the common basepoint. Use the usual one-vertex cell structure on each circle.
  This gives $S_L$ a cubical cell structure, with one $k$-cube for each clique of size $k$.
  Its two-skeleton gives the presentation of $P$ in (4.2). Since $L$ is flag and two-dimensional,
  $S_L$ has dimension three. Let $E$ be its universal cover.
  Identify the vertices of $E$ with $P$ so that an edge in the positive $q$-direction runs from $p$ to $p a_q$;
  deck transformations act by multiplication on the left.

#thm([Lemma 4.3.])[
  #emph[The space $E$ is a locally finite, contractible, three-dimensional cubical complex.
    Its cubes are embedded, and two intersecting cubes intersect in a common face.]
] <lem:cubical-cover>

#proof[
  First we prove acyclicity of the universal cover for every finite commutation graph,
    by induction on its number of vertices. Use $t \, P' \, C$ as in the preceding proof.
    Downstairs, the cubical complex is obtained from $S_(P')$ by attaching $S_C times \[ 0 \, 1 \]$,
    identifying both ends with the coordinate subcomplex $S_C subset S_(P')$.
    Here $S_(P')$ and $S_C$ denote the same coordinate-torus construction for those graphs.
  Upstairs, the components over $S_(P')$ are its universal covers, indexed by left cosets $P \/ P'$,
    and the lifted cylinders are products of the universal cover of $S_C$ with $\[ 0 \, 1 \]$,
    indexed by $P \/ C$. These covering assertions follow from the injectivity of the subgroup inclusions.
    The cylinder indexed by $g C$ joins the vertex spaces indexed by $g P'$ and $g t P'$.
    Its incidence graph is a tree. Indeed, under (4.3), write $g = w q$ with $w in F \( P' \/ C \)$ and $q in P'$.
    The vertex cosets are identified with $w$, and this cylinder runs from $w$ to $w b_(q C)$.
    The incidence graph is therefore the Cayley tree of the free group $F \( P' \/ C \)$.
  By induction every vertex space and every cylinder cross-section is acyclic.
    The union over a finite subtree is acyclic: adjoining a leaf amounts to gluing in its vertex space and
    incident cylinder along one acyclic cylinder end, and the assertion follows from Mayer–Vietoris.
    Any cellular cycle in $E$ meets only finitely many vertex spaces and cylinders,
    hence lies in such a finite-subtree union. It bounds there. This proves acyclicity of $E$.
    The base case, the empty graph, is a point.
  As a universal cover, $E$ is simply connected. A simply connected acyclic CW complex is contractible:
    a first nonzero homotopy group would, by the Hurewicz theorem, give a nonzero homology group,
    and the Whitehead theorem then applies to the map to a point.
    These are the usual CW forms of the two theorems; see #cite(label("Hatcher2002")) Sections 4.1–4.2.
  For completeness, consider the cubical structure itself. A cube is specified by its initial vertex $p$ and a
    clique $sigma$; its vertices are
  $ p product_(q in tau) a_q \, wide tau subset.eq sigma . $
  They are distinct by the abelianization map $P arrow.r bb(Z)^V$.
    Each lifted face is determined by its initial vertex and its direction subset;
    distinct faces of one cube have distinct such data, again by abelianization.
    Thus every closed cube is embedded. Suppose two cubes contain a vertex $p$.
    Seen from $p$, each has a set of distinct signed directions $a_q^(epsilon_q)$,
    with mutually commuting underlying generators. Abelianization shows that any common vertex is obtained from
    $p$ using only the equally signed directions shared by the two cubes.
    These directions span the same face in each cube, by uniqueness of lifts.
    It contains all common vertices and hence every common cell.
    Since the intersection is a union of common cells, it is exactly this face.
    Every nonempty intersection contains such a vertex. Finally,
    only finitely many signed cliques are available at a vertex, proving local finiteness.
    The three-dimensional assertion follows from the existence of two-simplices in $L$. ◻
]

Extend $lambda$ affinely over every cube of $E$. On a cube with initial vertex $p$ and coordinates $x_1 \,
  dots.h \, x_k in \[ 0 \, 1 \]$, it is

#[#set math.equation(numbering: n => "(4.4)")
 $ lambda \( p \) + x_1 + dots.h.c + x_k . $ <eq:affine-height>]

These formulas agree on faces, and $lambda \( g x \) = lambda \( g \) + lambda \( x \)$.
  In particular, $G$ preserves the level

#[#set math.equation(numbering: n => "(4.5)")
 $ X = lambda^(- 1) \( 0 \) . $ <eq:zero-level>]

The ambient complex $E$ is contractible, and its quotient by $G$ already gives the three-dimensional classifying
  space. To obtain the required length-two resolution, we must instead prove that the two-dimensional level $X$ is
  acyclic. This is a homological assertion about the level; we do not assert that the level is contractible.

=== 4.3 Acyclicity of the level <acyclicity-of-the-level>

#thm([Lemma 4.4.])[
  #emph[The level $X$ is a connected, integrally acyclic, two-dimensional simplicial complex.
    Its vertices are $G$, its edges are the integer level diagonals of squares,
    and its two-simplices are integer level sections of three-cubes.]
] <lem:acyclic-level>

#proof[
  Triangulate each cube of $E$ by chains in its Boolean poset of vertices:
    a simplex is a chain under the order of increasing coordinates. These triangulations agree on faces.
    Heights are strictly increasing along every such chain; in particular,
    no edge of this triangulation joins vertices of equal height.
  At a vertex $p$, the full subcomplex of its link spanned by vertices of height greater than $lambda \( p \)$ is
    the barycentric subdivision of $L$. Indeed, a higher vertex adjacent to $p$ in the triangulation is obtained
    by multiplying by the positive generators of a nonempty clique,
    and a simplex of these vertices corresponds exactly to a chain of such cliques.
    This description remains valid when $p$ is an intermediate corner of a cube,
    since any comparable higher corner changes only positive directions. We call this the ascending link.
    The descending link is described identically using negative directions, and is also a subdivision of $L$.
    Both links are integrally acyclic.
  Let $K_n$ be the full subcomplex of the triangulation spanned by vertices of height at least $- n$, for $n gt.eq
    0$. To pass from $K_n$ to $K_(n + 1)$, add simultaneously the vertices $p$ of height $- n -
    1$ and the cones on their ascending links. No simplex contains two of these new vertices.
    Consequently the relative cellular chain complex is the direct sum, over the new vertices, of
  $ C_(*) #scale(x: 120%, y: 120%)[\(] "cone" \( "Asc" \( p \) \) \, "Asc" \( p \) \;
    bb(Z) #scale(x: 120%, y: 120%)[\)] . $
  Each summand has zero homology, since its base is acyclic and nonempty.
    Hence $K_n arrow.r.hook K_(n + 1)$ induces an isomorphism on all homology groups.
    This argument explicitly allows infinitely many vertices at each height.
    The union of the $K_n$ is $E$, and cellular chains have finite support, so homology commutes with this union.
    Thus $K_0 arrow.r.hook E$ is a homology isomorphism. Using descending links in the same way,
    the full subcomplex on vertices of height at most zero is also acyclic.
  The closed halfspace $E_(+) = lambda^(- 1) \( \[ 0 \, oo \) \)$ deformation retracts onto $K_0$.
    To see this directly, write a point in a triangulated simplex as $sum_i t_i
    v_i$ and discard the weights of vertices of negative height, renormalizing the others:
  $ R_(+) (sum_i t_i v_i) = frac(sum_(lambda \( v_i \) gt.eq 0) t_i v_i, sum_(lambda \( v_i \) gt.eq 0) t_i) . $
  The denominator is positive on $E_(+)$: otherwise all vertices with positive weight would have negative height,
    contrary to the affine height of the point. The linear homotopy from the point to $R_(+)$ stays in the same
    simplex and in $E_(+)$. It fixes $K_0$, and its formulas agree on faces.
    Local finiteness gives a continuous global homotopy. The corresponding construction retracts $E_(-) =
    lambda^(- 1) \( \( - oo \, 0 \] \)$ onto the full subcomplex on nonpositive-height vertices.
    Thus both closed halfspaces are acyclic.
  Cut the triangulation along height zero, and subdivide the resulting polytopes if desired.
    The spaces $E_(+)$, $E_(-)$, and their intersection $X$ are then subcomplexes,
    so the reduced Mayer–Vietoris sequence applies to $E = E_(+) union E_(-)$.
    Since $E$ and the two halfspaces are acyclic and $X$ contains the vertex $1$,
    that sequence proves $tilde(H)_(*) \( X \; bb(Z) \) = 0$, including connectedness.
  For the final cell structure on $X$, return to the original cubes.
    The integer slices of $\[ 0 \, 1 \]^2$ by $x_1 + x_2 = m$ are a vertex or, for $m = 1$,
    the diagonal joining $\( 1 \, 0 \)$ to $\( 0 \, 1 \)$. The nondegenerate integer slices of $\[ 0 \, 1 \]^3$
    are the triangles at sums $1$ and $2$. Slices of edges introduce no new vertices.
    Formula (4.4) therefore gives exactly the asserted vertices, edges, and triangles.
    The face-intersection property in Lemma 11 makes them a simplicial complex.
    Triangles occur by taking a three-cube whose initial vertex has height $- 1$, so its dimension is two.
    Figure 1 illustrates the positive-dimensional slices. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.4), (2.6, 0.4), (2.6, 3), (0, 3), close: true, stroke: (paint: rgb("#737373"), thickness: 0.65pt, join: "round"))
  line((2.6, 0.4), (0, 3), stroke: (paint: rgb("#0000bf"), thickness: 1.3pt, join: "round"))
  circle((0, 0.4), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((-0.02495, 0.3751), [$-1$], anchor: "north-east")
  circle((2.6, 0.4), radius: 0.0898, fill: rgb("#0000bf"), stroke: none)
  content((2.625, 0.3751), [$0$], anchor: "north-west")
  circle((0, 3), radius: 0.0898, fill: rgb("#0000bf"), stroke: none)
  content((-0.02495, 3.025), [$0$], anchor: "south-east")
  circle((2.6, 3), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((2.625, 3.025), [$1$], anchor: "south-west")
  content((1.3, 0.4), [#text(size: 9pt)[$a_q$]], anchor: "north", padding: 0.1176cm)
  content((0, 1.7), [#text(size: 9pt)[$a_r$]], anchor: "east", padding: 0.1176cm)
  content((1.3, 3.7), [#text(size: 9pt)[\(a\) Commuting square]])
  content((1.3, -0.7), [#text(size: 9pt)[$lambda =-1+x_1+x_2$]])
  line((9.4, 0), (7.6, 0.55), (6.8, 2.5), close: true, fill: rgb("#dedeff"), stroke: none)
  line((6.8, 0), (7.6, 0.55), stroke: (paint: rgb("#737373"), thickness: 0.65pt, join: "round", dash: "dashed"))
  line((7.6, 0.55), (10.2, 0.55), stroke: (paint: rgb("#737373"), thickness: 0.65pt, join: "round", dash: "dashed"))
  line((10.2, 0.55), (7.6, 0.55), stroke: (paint: rgb("#737373"), thickness: 0.65pt, join: "round", dash: "dashed"))
  line((7.6, 0.55), (7.6, 3.05), stroke: (paint: rgb("#737373"), thickness: 0.65pt, join: "round", dash: "dashed"))
  line((6.8, 0), (9.4, 0), (10.2, 0.55), (10.2, 3.05), (7.6, 3.05), (6.8, 2.5), (9.4, 0), (9.4, 2.5), (6.8, 2.5), (9.4, 2.5), (10.2, 3.05), close: true, stroke: (paint: rgb("#737373"), thickness: 0.65pt, join: "round"))
  line((9.4, 0), (7.6, 0.55), (6.8, 2.5), close: true, stroke: (paint: rgb("#0000bf"), thickness: 1.3pt, join: "round"))
  circle((6.8, 0), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((6.775, -0.02495), [$-1$], anchor: "north-east")
  circle((9.4, 0), radius: 0.0898, fill: rgb("#0000bf"), stroke: none)
  content((9.425, -0.02495), [$0$], anchor: "north-west")
  circle((7.6, 0.55), radius: 0.0898, fill: rgb("#0000bf"), stroke: none)
  content((7.696, 0.6102), [$0$], anchor: "south-west")
  circle((6.8, 2.5), radius: 0.0898, fill: rgb("#0000bf"), stroke: none)
  content((6.775, 2.525), [$0$], anchor: "south-east")
  circle((10.2, 0.55), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((10.24, 0.55), [$1$], anchor: "west")
  circle((9.4, 2.5), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((9.304, 2.475), [$1$], anchor: "north-east")
  circle((7.6, 3.05), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((7.575, 3.075), [$1$], anchor: "south-east")
  circle((10.2, 3.05), radius: 0.07484, fill: rgb("#000000"), stroke: none)
  content((10.22, 3.075), [$2$], anchor: "south-west")
  content((8.1, 0), [#text(size: 9pt)[$a_q$]], anchor: "north", padding: 0.1176cm)
  content((6.8, 1.25), [#text(size: 9pt)[$a_s$]], anchor: "east", padding: 0.1176cm)
  line((6.8, 0), (7.6, 0.55), stroke: none)
  content((7.184, 0.264), [#text(size: 9pt)[$a_r$]], anchor: "south", padding: 0.1176cm)
  content((8.5, 3.7), [#text(size: 9pt)[\(b\) Commuting three-cube]])
  content((8.5, -0.7), [#text(size: 9pt)[$lambda =-1+x_1+x_2+x_3$]])
  line((2, -1.25), (2.65, -1.25), stroke: (paint: rgb("#737373"), thickness: 0.65pt, join: "round"))
  content((2.75, -1.25), [#text(size: 9pt)[ambient cube edges]], anchor: "west", padding: 0.1176cm)
  line((6.8, -1.25), (7.45, -1.25), stroke: (paint: rgb("#0000bf"), thickness: 1.3pt, join: "round"))
  content((7.55, -1.25), [#text(size: 9pt)[level set $X$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Integer slices of cubes; vertex labels are heights. The blue diagonal and triangle are an edge and a two-simplex of $X$. Each generator increases height by one. Initial height $- 2$ gives the other triangular slice, at $x_1 + x_2 + x_3 = 2$. ],
) <fig:level-slices>

The edge and triangular-word descriptions belong to the presentation framework of Dicks and Leary
  #cite(label("DicksLeary1999")) Theorem 1 and Proposition 2.
  We now pass from the level geometry to the precise algebraic input for Theorem 4.
  The finite cell orbits will give finite alphabets, and acyclicity in both dimensions one and two will give an
  isomorphism onto the cycle module, not merely a collection of generators.

=== 4.4 The group and its boundary basis <the-group-and-its-boundary-basis>

#thm([Proposition 4.5.])[
  #emph[The finite flag complex $L$, its nontrivial representation $alpha : pi_1 \( L \) arrow.r H$,
    and the group $G$ of (4.2) have the following properties.]
  + #emph[$G$ is countable, finitely generated, and residually finite, with $"cd"_(bb(Z)) \( G \) =
    2$ and $"gd" \( G \) lt.eq 3$.]
  + #emph[$G$ acts freely on the integrally acyclic two-dimensional simplicial complex $X$ of (4.5).
    The action has finitely many cell orbits and one vertex orbit, identified with $G$ acting on itself on the left.]
  + #emph[There is a finite generating alphabet $S$ for $G$ and a finite indexed list $cal(D)$ of words trivial in
    $G$ such that, for $Lambda = bb(Z) \[ G \]$, the graph of $X$ has edges $g arrow.r g s$ and
#[#set math.equation(numbering: n => "(4.6)")
 $ 0 arrow.r Lambda^(\( cal(D) \)) arrow.r^(med partial_2 med) Lambda^(\( S \)) arrow.r^(med partial_1 med) Lambda
   arrow.r^(med upright("aug") med) bb(Z) arrow.r 0 $ <eq:model-resolution>]

 is exact, with $partial_1 \( e_s \) = s - 1$ and $partial_2 \( e_z \) = \[ z \]$.
   Here $\[ z \]$ is the oriented edge chain of the triangular boundary word $z$ based at $1$.
   In particular, the chains $\[ z \]$, $z in cal(D)$, are a free $Lambda$-basis of $ker partial_1$.]
] <prop:model>

#proof[
  The first two lemmas supply $L$, $alpha$, and residual finiteness.
    The cubical deck action restricts to $G$ on $X$. It preserves the cell structure just described,
    and no nonidentity element stabilizes a cell: such an element would preserve its unique ambient open cube in
    $E$, hence also that cube’s initial vertex. The action is free, being the restriction of a deck action.
    Vertices of $X$ are exactly the elements of $G$, so there is one vertex orbit.
  There are only finitely many cell orbits. An ambient cube is specified by its clique of directions and its
    initial vertex; a nonempty integer slice has only finitely many possible relative heights.
    Two initial vertices of the same height differ by left multiplication by an element of $G$.
    Hence the finite list of cliques and possible relative heights accounts for all the orbits.
    The quotient $Y = X \/ G$ is thus a finite complex with one vertex, and $X arrow.r Y$ is a regular $G$-cover.
    One can obtain this covering by restricting $E arrow.r E \/ G$.
  Choose orientations for the edge orbits. For each orbit choose its oriented lift starting at $1$,
    and call its endpoint $s in G$. Keep different edge orbits as different letters even if their values coincide;
    this defines $S$. Left translation identifies every oriented edge with $g arrow.r g s$.
    Connectedness of $X$ implies that its graph is connected, so $S$ generates $G$.
  For each triangle orbit choose an orientation, a starting corner, and the lift having that corner at $1$.
    Reading its boundary gives a word $z$ on $S$, necessarily trivial in $G$. These indexed words form $cal(D)$.
    The cellular chains of $X$, with the chosen cell orbit representatives,
    are precisely the free modules in (4.6). Acyclicity makes the augmented chain complex exact.
    In particular, $H_2 \( X \; bb(Z) \) = 0$ and the absence of three-cells make $partial_2$ injective,
    which gives the asserted basis rather than only a spanning set.
  This free resolution proves $"cd"_(bb(Z)) \( G \) lt.eq 2$.
    To obtain the opposite inequality, choose a two-simplex of $L$ with vertices $q \, r \, s$.
    The three corresponding commuting generators form an embedded $bb(Z)^3$ in $P$:
    their map from $bb(Z)^3$ is injective after abelianization in $bb(Z)^V$.
    Its height kernel is a subgroup $bb(Z)^2 subset G$. Cohomological dimension cannot increase upon restriction
    to a subgroup, because a free group-ring module remains free over the subgroup ring,
    and consequently projective modules remain projective. The torus resolution gives $H^2 \( bb(Z)^2 \; bb(Z) \)
    tilde.equiv bb(Z)$, so $"cd"_(bb(Z)) \( G \) gt.eq 2$.
  Finally, $P$ is finitely generated, hence countable, and so is $G$.
    The contractible three-dimensional complex $E$ is also a free $G$-complex;
    the quotient $E \/ G$ is a three-dimensional $K \( G \, 1 \)$. Thus $"gd" \( G \) lt.eq 3$, completing the proof. ◻
]

== 5 Small transport with nontrivial holonomy <sec:transport>

Retain the finite flag complex $L$, the homomorphism $alpha : pi_1 \( L \) arrow.r H = "SU" \( 2 \)$,
  and the level complex $X$ of Proposition 13. Write $V$ for the vertex set of $L$ and $a_v$ for the corresponding
  standard generator of $P = A_L$. We realize $\| L \|$ in $bb(R)^V$ by barycentric coordinates and give it the
  metric induced by the $ell^1$ norm. Our aim is the following.

#thm([Proposition 5.1.])[
  #emph[For every $epsilon.alt > 0$, the oriented edges of $X$ admit labels $h_e in H$ such that
$ h_(macron(e)) = h_e^(- 1) \, wide \| h_e - 1 \| < epsilon.alt \, $

 the product around every triangular two-cell is $1$, and the product around some closed edge path is different
   from $1$.]
] <prop:small-labels>

For an abelian target, products along closed paths would factor through $H_1 \( X \; bb(Z) \) =
  0$ and would all be trivial. The nonabelian target is therefore essential.

The construction has two parts. A direction map on reduced words of $P$ changes slowly far from the identity.
  Translating the level $X$ far from the identity therefore gives a map of its graph to $L$ with small edge
  images. Its image nevertheless contains prescribed loops of $L$, allowing $alpha$ to detect nontrivial holonomy.

The long commuting-power paths below lie along expanded copies of $L$ in level sets,
  formed from commuting coordinate directions as in Bestvina and Brady #cite(label("BB1997")) Definition 8.8 and
  the following paragraph.

=== 5.1 Reduced traces and their direction vectors <reduced-traces-and-their-direction-vectors>

Two signed standard generators are called #emph[independent] when their underlying vertices are distinct and
  adjacent in $L$. In particular, two occurrences of the same generator are dependent, regardless of their signs.
  A #emph[trace] is a word modulo exchanges of adjacent independent letters,
  as in the theory of partially commutative monoids #cite(label("CartierFoata1969")) Chapter I, Section 2.
  Occurrences can be followed through these exchanges. The #emph[occurrence poset] of a word orders every
  dependent pair in its order of appearance and takes the transitive closure. It records the trace:
  its linear extensions are precisely the representatives of that trace;
  see also Krattenthaler’s appendix to the 2006 reedition of #cite(label("CartierFoata1969")) Definition 2.2 and
  Section 3 of the appendix. Indeed, exchanges preserve this poset,
  and any two linear extensions of a finite poset are related by exchanges of adjacent incomparable elements.
  Here incomparable occurrences have independent directions.

The following signed-letter version of the graph-product normal form #cite(label("Green1990")) Theorem 3.9 records
  individual occurrences rather than vertex-group syllables.
  We include its reduction proof because that occurrence information is used in the direction-vector estimate.

#thm([Lemma 5.2.])[
  #emph[Every element of $P$ has a unique reduced trace, obtained by deleting inverse pairs that can be made
    adjacent by exchanges. Its length is the word length in the standard generators.
    Right multiplication by a signed standard generator changes this occurrence poset by either adjoining a
    maximal occurrence or deleting a maximal occurrence.]
] <lem:trace-normal-form>

#proof[
  An inverse pair can be deleted exactly when every occurrence between its endpoints is independent of its
    direction. This criterion is independent of the representative:
    the order of an occurrence dependent on that direction relative to either endpoint cannot change under
    exchanges. Deletion gives the trace represented by removing the two occurrences.
  We check the local confluence of deletion. For two disjoint deletable pairs,
    either deletion leaves the other available, and both orders remove exactly the same four occurrences.
    If two pairs share an occurrence, they cannot share their first endpoint or their last endpoint,
    because an intervening occurrence of the same direction would prevent deletion.
    The relevant subword consequently has the form
  $ x B x^(- 1) C x $
  or the same form with $x$ replaced by $x^(- 1)$, where every letter of $B$ and $C$ is independent of $x$.
    The two deletions leave $B C x$ and $x B C$, which are the same trace.
    Since deletion decreases length, induction on length using these local diamonds proves uniqueness of the
    terminal trace. Exchanges and adjacent inverse insertions or deletions preserve that terminal trace.
    These operations generate equality in the defining presentation of $P$,
    so the terminal trace depends only on the group element. Every word representing that element reduces to it,
    proving the assertion about word length.
  Write $\| g \|_P$ for word length in the signed standard generators.
    Let $w$ be reduced of length $n$, and append a signed generator $x$.
    If the result is reduced, its new occurrence is maximal. Otherwise an available deletion must involve the new
    last occurrence, since a deletion involving only old occurrences would already have been available in $w$.
    Its inverse mate $y$ has only independent occurrences after it in $w$,
    and is therefore maximal in the old occurrence poset. Deleting $y$ and the new $x$ leaves a word of length
    $n - 1$. If $g$ is the element represented by $w$, the word-metric inequality gives
  $ \| g x \|_P gt.eq \| g \|_P - 1 = n - 1 . $
  Thus the remaining word is reduced. Deleting a maximal occurrence also leaves exactly the induced order on the
    retained occurrences: no dependency chain between two retained occurrences can pass through a maximal
    occurrence. This proves the last assertion. ◻
]

Fix a total order on $V$. In a nonempty reduced trace, the minimal occurrences have distinct pairwise independent
  directions, hence their directions span a simplex of $L$.
  Assign each occurrence $p$ to the first direction, in our fixed order,
  among the minimal occurrences below or equal to $p$. This set is nonempty because the poset is finite.
  Let $c_v \( g \)$ be the number assigned to $v$, and set

#[#set math.equation(numbering: n => "(5.1)")
 $ b \( g \) = frac(1, \| g \|_P) sum_(v in V) c_v \( g \) e_v in \| L \| \, wide g eq.not 1 . $ <eq:direction-map>]

Here $e_v$ is the barycentric vertex corresponding to $v$.
  Each minimal occurrence is assigned to its own direction,
  so the support of $b \( g \)$ is exactly the set of minimal directions.

#thm([Lemma 5.3.])[
  #emph[Suppose $g$ and $g x$ are nonidentity, where $x$ is a signed standard generator.
    Their direction vectors belong to a common simplex of $L$.
    If their word lengths are $n$ and $n + 1$, in either order, then
#[#set math.equation(numbering: n => "(5.2)")
 $ ∥b \( g x \) - b \( g \)∥_1 lt.eq frac(2, n + 1) . $ <eq:trace-direction-bound>]

]
] <lem:trace-direction>

#proof[
  By Lemma 15, one occurrence poset is obtained from the other by adjoining a maximal occurrence.
    Every retained occurrence has the same principal downset before and after this operation:
    a maximal occurrence cannot lie on a dependency chain ending at a different occurrence.
    The globally minimal predecessors of a retained occurrence are precisely the minimal elements of its principal
    downset. Its assigned direction is therefore unchanged. This also covers a changed occurrence that is both
    minimal and maximal: it is isolated and has no retained successors.
  Consequently, if $c$ is the count vector for the shorter trace, the longer trace has count vector $c +
    e_v$ for some $v in V$. Since $∥c \/ n∥_1 = 1$,
  $ ∥frac(c + e_v, n + 1) - c / n∥_1 = frac(∥e_v - c \/ n∥_1, n + 1) lt.eq frac(2, n + 1) . $
  For the common-simplex assertion, adjoining a maximal occurrence preserves all old minimal occurrences.
    If the new occurrence is not minimal, the minimal set is unchanged.
    If it is also minimal, it is isolated, and its direction is independent of every old occurrence:
    dependent occurrences would be comparable. Thus the union of the two sets of minimal directions is a clique.
    Flagness of $L$ completes the proof. ◻
]

The direction vector changes by at most the reciprocal word-length bound in Equation (5.2) under a generator step.
  We next apply this estimate on a translate of the level graph where all relevant words are long.
  At the same time, we retain exact control of certain paths,
  so that making every edge image small does not erase the loops detected by $alpha$.

=== 5.2 A slowly varying map of the level graph <a-slowly-varying-map-of-the-level-graph>

Let $N gt.eq 2$ and choose $d in P$ with $lambda \( d \) = N$. Define a map on the vertices of $X$ by

#[#set math.equation(numbering: n => "(5.3)")
 $ f_N \( g \) = b \( d^(- 1) g \) \, wide g in G . $ <eq:translated-direction-map>]

It is defined because $lambda \( d^(- 1) g \) = - N$. Every edge of $X$ is the diagonal of a commuting square in
  $E$ with corner heights $- 1 \, 0 \, 0 \, 1$. If its endpoints are $g \, h$,
  write $u$ for the square’s unique corner of height $1$. The two steps $g \, u \,
  h$ are standard generator steps in $E$. Their translates by $d^(- 1)$ have heights $- N \, 1 - N \, - N$,
  hence word lengths at least $N \, N - 1 \, N$. The larger word length in each step is therefore at least $N$.
  Lemma 16 gives

$ ∥b \( d^(- 1) g \) - b \( d^(- 1) u \)∥_1 lt.eq 2 \/ N \, wide ∥b \( d^(- 1) u \) - b \( d^(- 1) h \)∥_1 lt.eq
  2 \/ N . $

Each pair belongs to a common simplex, so the two straight segments joining them lie in $\| L \|$.

Map the edge from $g$ to $h$ to this two-segment path, with the following convention:
  whenever $f_N \( g \)$ and $f_N \( h \)$ themselves lie in a common simplex,
  use their single straight segment instead. This segment is unambiguous even if several simplices contain the
  endpoints: it is the same segment in barycentric coordinates and lies in their common face.
  Choose the reverse path for the reverse orientation. These choices define a continuous map $f_N :
  X^(\( 1 \)) arrow.r \| L \|$, since they agree at vertices and the domain is a CW complex.
  Every edge image has diameter at most $4 \/ N$. Moreover,
  any two of the three edge images of a triangle meet at their common vertex image. Therefore

#[#set math.equation(numbering: n => "(5.4)")
 $ "diam" f_N \( partial sigma \) lt.eq 8 \/ N wide upright("for every triangular two-cell ") sigma
   upright(" of ") X upright(".") $ <eq:small-triangle-image>]

There is also exact control on selected long paths. If ${ q \, r }$ is an edge of $L$, put

#[#set math.equation(numbering: n => "(5.5)")
 $ p_j = d thin a_q^(- \( N - j \)) a_r^(- j) \, wide 0 lt.eq j lt.eq N . $ <eq:commuting-power-path>]

These vertices have height zero. Consecutive vertices are joined by an edge of $X$:
  the square based at $p_j a_r^(- 1)$ in the positive $q \,
  r$ directions has level-zero corners $p_j$ and $p_(j + 1)$.
  The trace of $d^(- 1) p_j$ consists of two mutually independent chains of negative occurrences,
  one in each direction, with lengths $N - j$ and $j$; a chain of length zero is omitted.
  Every occurrence is assigned to its own direction. Hence

#[#set math.equation(numbering: n => "(5.6)")
 $ f_N \( p_j \) = (1 - j / N) e_q + j / N e_r . $ <eq:exact-subdivision>]

Our straight-segment convention means that this level path maps exactly to the edge $\[ q \, r \]$,
  subdivided into $N$ equal parts; see Figure 2.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0, 2.88), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0.72, 0), (0.72, 2.88), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.44, 0), (1.44, 2.88), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.16, 0), (2.16, 2.88), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.88, 0), (2.88, 2.88), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (2.88, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.72), (2.88, 0.72), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.44), (2.88, 1.44), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.16), (2.88, 2.16), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.88), (2.88, 2.88), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.88), (2.88, 0), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10))
  circle((0, 2.88), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((0.72, 2.16), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((1.44, 1.44), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((2.16, 0.72), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((2.88, 0), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  content((0, 2.88), [$p_0=d a_q^(-N)$], anchor: "south-east", padding: 0.1176cm)
  content((2.88, 0), [$p_N=d a_r^(-N)$], anchor: "north-west", padding: 0.1176cm)
  content((1.152, -0.468), [Level path in a commuting flat], anchor: "north", padding: 0.1176cm)
  line((3.312, 1.584), (4.536, 1.584), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.924, 1.584), [$f_N$], anchor: "south", padding: 0.1176cm)
  line((5.04, 1.44), (7.92, 1.44), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10))
  circle((5.04, 1.44), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((5.76, 1.44), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((6.48, 1.44), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((7.2, 1.44), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  circle((7.92, 1.44), radius: 0.07761, fill: rgb("#0000b2"), stroke: none)
  content((5.04, 1.368), [$q$], anchor: "north", padding: 0.1176cm)
  content((7.92, 1.368), [$r$], anchor: "north", padding: 0.1176cm)
  content((5.76, 1.548), [$frac(1, 4)$], anchor: "south", padding: 0.1176cm)
  content((6.48, 1.548), [$frac(1, 2)$], anchor: "south", padding: 0.1176cm)
  content((7.2, 1.548), [$frac(3, 4)$], anchor: "south", padding: 0.1176cm)
  content((6.48, 0.468), [The edge $[q,r] subset L$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: The special path (5.5), shown for $N = 4$, joins $d a_q^(- N)$ to $d a_r^(- N)$ across level-cut squares. Formula (5.6) sends it to the exact subdivision of $\[ q \, r \]$. Here $a_q \, a_r$ commute and $lambda \( d \) = N$. Each blue diagonal step multiplies by $a_q a_r^(- 1)$, preserving height zero; $f_N$ is shown on this level path. ],
) <fig:commuting-path>

We have obtained both properties needed from $f_N$: every triangle boundary has small image,
  and selected closed paths trace prescribed loops of $L$ exactly.
  The representation $alpha$ will turn these two properties into flatness on triangles and nontrivial closed-path
  holonomy, respectively.

=== 5.3 Pulling back transport <pulling-back-transport>

#proof[
  Choose a base vertex $q_0$ for $alpha$ and a base lift of $q_0$ in the universal cover $tilde(L) arrow.r L$.
    Choose the left deck action convention so that lifting a loop representing $gamma$ from that base lift ends at
    $gamma$ times the lift. There is a continuous map
  #[#set math.equation(numbering: n => "(5.7)")
   $ D : tilde(L) arrow.r H \, wide D \( gamma xi \) = alpha \( gamma \) D \( xi \) . $ <eq:developing-map>]
  To construct it, choose images for representatives of the vertex orbits and extend equivariantly.
    On representatives of the edge orbits, extend between the prescribed endpoints using path connectedness of
    $H$. Extend over representatives of the two-cell orbits using $pi_1 \( H \) = 0$.
    The deck action is free on cells, so equivariance introduces no ambiguity; $L$ has dimension two,
    so there are no further extensions. The CW topology gives continuity.
  Fix $epsilon.alt > 0$. There is a finite open cover $\( U_i \)$ of $L$ such that each $U_i$ is evenly covered
    and $D$ has image of diameter less than $epsilon.alt$ on each sheet over $U_i$.
    Indeed, around any lift of a point, continuity of $D$ gives a sufficiently small such neighborhood on one
    sheet. All other sheets are its deck translates, and left multiplication by $alpha \( gamma \)$ preserves
    quaternion distance. Compactness of $L$ then gives a finite subcover.
    Let $ell > 0$ be a Lebesgue number in the diameter form: every subset of $L$ of diameter less than $ell$ lies
    in some $U_i$. Choose $N gt.eq 2$ so large that $8 \/ N < ell$, and construct $f_N$ as above.
  For an oriented edge $e$ of $X$, lift its assigned path $f_N \( e \)$ from $xi$ to $xi'$ in $tilde(L)$, and define
  #[#set math.equation(numbering: n => "(5.8)")
   $ h_e = D \( xi \)^(- 1) D \( xi' \) . $ <eq:edge-transport>]
  Changing the lift multiplies both $D$ values on the left by the same $alpha \( gamma \)$,
    so the label is independent of the lift. Reversing the path inverts the label.
    Its image lies in some $U_i$ because its diameter is at most $4 \/ N < ell$.
    The lift stays in one sheet, and therefore
  $ \| h_e - 1 \| = \| D \( xi' \) - D \( xi \) \| < epsilon.alt . $
  The whole image of the boundary of a triangular two-cell lies in one $U_i$ by (5.4).
    The inverse homeomorphism of a sheet over $U_i$ lifts this boundary to a closed loop in that sheet.
    In multiplying the three edge labels, choose these consecutive lifts; the intermediate $D$ values cancel,
    giving product $1$.
  Finally, choose a finite edge loop based at $q_0$, $q_0 \, q_1 \, dots.h \, q_k =
    q_0$ in $L$ whose class $gamma$ has $alpha \( gamma \) eq.not 1$.
    Such a loop exists because $alpha$ is nontrivial and every element of the fundamental group of a simplicial
    complex is represented by a finite edge loop. For each successive pair, concatenate the path (5.5).
    The endpoint of each piece is $d a_(q_(i + 1))^(- N)$, the initial vertex of the next piece,
    so this is a closed edge path in $X$ based at $d a_(q_0)^(- N)$.
    By (5.6), its image under $f_N$ is precisely the chosen loop with each edge subdivided.
    Lift that image from the chosen base lift $xi$ of $q_0$. The terminal lift is $gamma xi$,
    and telescoping (5.8) gives the path product
  $ D \( xi \)^(- 1) D \( gamma xi \) = D \( xi \)^(- 1) alpha \( gamma \) D \( xi \) eq.not 1 . $
  This proves all assertions of the proposition. ◻
]

=== Completion of the proof of Theorem 1 <completion-of-the-proof-of-theorem-thmmain>

Choose the finite acyclic flag complex and the nontrivial representation from Section 4.
  Proposition 13 gives a finitely generated residually finite group $G$ of integral cohomological dimension two,
  together with finite lists $S \, cal(D)$ satisfying the cycle-basis hypothesis of Theorem 4.
  If a two-dimensional classifying space for $G$ existed, that theorem would supply a positive threshold $eta$.
  Proposition 14, applied below this threshold, supplies labels with trivial product around every translate of
  every word in $cal(D)$ but nontrivial product on a closed path. This is a contradiction.

The three-dimensional contractible complex $E$ of Section 4 carries a free cellular action of $G$,
  so $E \/ G$ is a three-dimensional classifying space. Therefore $"gd" G = 3$, whereas $"cd"_(bb(Z)) G = 2$.
  This completes the proof of Theorem 1.0◻

#bibliography("refs.bib", style: "ieee", title: [References])
