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

#align(center)[#text(size: 16pt, weight: "bold")[A Counterexample to Wall's $D \( 2 \)$ Problem]]
#align(center)[OpenAI]
#align(center)[October 6, 2026]

== 1 Introduction <sec:introduction>

Wall’s finiteness conditions ask when algebraic restrictions on a CW complex force it to have a homotopy model of
  a prescribed dimension. Let $X$ be a finite connected CW complex, let $G = pi_1 \( X \)$,
  and let $tilde(X)$ be its universal cover. The $D \( 2 \)$ condition is

#[#set math.equation(numbering: n => "(1)")
 $ H_i \( tilde(X) \; bb(Z) \) = 0 quad \( i > 2 \) \, wide H^3 \( X \; M \) = 0 quad
   upright("for every finitely generated ") bb(Z) G upright("-module ") M \, $ <eq:d2-condition>]

where cohomology uses the corresponding local coefficients.
  The finite $D \( 2 \)$ problem asks whether every such $X$ is homotopy equivalent to a finite CW complex of
  dimension at most two #cite(label("Wall65")) Section 2, #cite(label("Wall79")) Problem D3.
  The finiteness of both complexes is part of the question, and no asphericity hypothesis is imposed.
  This is also the formulation in Hofmann–Nicholson #cite(label("HofmannNicholson27")) p. 254.

#thm([Theorem 1.1.])[
  #emph[There is a finite connected three-dimensional CW complex $X$ such that
$ H_i \( tilde(X) \; bb(Z) \) = 0 quad \( i > 2 \) \, wide H^3 \( X \; M \) = 0 quad
  upright("for every ") bb(Z) \[ pi_1 \( X \) \] upright("-module ") M \, $

 but $X$ is not homotopy equivalent to any finite CW complex of dimension at most two.]
] <thm:main>

The example has infinite fundamental group; the finiteness assertion concerns its cell structure.

=== 1.1 Background and approach <background-and-approach>

Wall introduced the dimension conditions in his work on finiteness for CW complexes #cite(label("Wall65")).
  His reduction produces a finite three-dimensional model in the $D \( 2 \)$ case;
  the remaining question is whether its three-dimensional cells can also be removed up to homotopy.
  The problem reappeared as Problem D3 in his 1979 list #cite(label("Wall79")).
  It lies at the interface between two-dimensional topology and the realization of chain complexes over group
  rings. Johnson’s work #cite(label("Johnson03")) develops this algebraic viewpoint and the role of cancellation
  in passing from a stable realization to an actual two-dimensional complex.

A stable form of the problem has a positive answer: adjoining sufficiently many two-spheres makes a finite
  $D \( 2 \)$ complex homotopy equivalent to a finite two-dimensional complex.
  This goes back to Cohen #cite(label("Cohen78")); Hambleton #cite(label("Hambleton18")) Lemma 2.1 gives a proof
  with the number of added spheres bounded by the number of three-dimensional cells.
  Such stabilization does not answer the unstabilized question.
  There are also substantial positive results for particular fundamental groups.
  Hambleton #cite(label("Hambleton18")) Theorem B proves the $D \( 2 \)$ property for finite subgroups of
  $"SO" \( 3 \)$. More recently, Hofmann and Nicholson #cite(label("HofmannNicholson27")) Theorem A establish the
  $D \( 2 \)$ property for the generalized quaternion groups of orders $24$ and $32$ and recover the order-$28$
  case previously proved using work of Mannan–Popiel and Nicholson #cite(label("MannanPopiel21"))
  #cite(label("Nicholson21")). In particular, they show that the longstanding candidate with fundamental group of
  order $32$, proposed by Cohen and Dyer, does have a finite two-dimensional model.

Candidate counterexamples have also come from relation modules.
  A relation gap occurs when the relator subgroup of a free group needs more normal generators than its
  abelianization needs as a module over the quotient group ring.
  Bridson and Tweedale #cite(label("BridsonTweedale07")) Sections 3–4 use coprime annihilation relations to reduce
  the number of module generators and construct finite $D \( 2 \)$ complexes with virtually free fundamental
  groups. Their failure to have finite two-dimensional models is conditional on a relation-gap assertion.

We apply Quillen’s plus construction #cite(label("Quillen71")).
  It kills a perfect normal subgroup of the fundamental group while preserving homology with coefficients from the
  quotient. Mannan #cite(label("Mannan09")) Section 2 shows directly that applying it to a finite two-dimensional
  complex along a finitely normally generated perfect subgroup produces a finite $D \( 2 \)$ complex.
  He also proves that every finite cohomologically two-dimensional three-dimensional complex arises in this way up
  to homotopy #cite(label("Mannan09")) Theorem 3.4. Thus this construction supplies the dimension condition;
  the task is to find an obstruction to a two-dimensional model of its result.

Our obstruction uses a character. For a connected space $Y$, a homomorphism $rho : pi_1 \( Y \) arrow.r
  bb(C)^times$ determines a one-dimensional complex local system $L_rho$.
  We prove that, when $Y$ is a finite two-dimensional complex,

#[#set math.equation(numbering: n => "(2)")
 $ H_2 \( Y \; L_rho \) = 0 quad arrow.r.double quad rho \( g \) = 1 med
   upright("for every finite-order ") g in pi_1 \( Y \) . $ <eq:obstruction-overview>]

The proof gives the stronger statement that every map $F arrow.r
  Y$ from a finite connected simplicial complex with $b_1 \( F \; bb(Q) \) =
  0$ pulls $L_rho$ back to a system with trivial monodromy.
  The method is a tower of infinite cyclic covers and image subcomplexes,
  following the cyclic-tower method of Howie #cite(label("Howie81Pairs"));
  see also the formulation of Louder–Wilton #cite(label("LouderWilton17")) Section 3 and its account of the
  earlier work of Papakyriakopoulos and Stallings. The additional input is that vanishing of rank-one twisted
  second homology persists under these cyclic covers, by a Laurent-polynomial rank argument.

=== 1.2 Proof structure <proof-structure>

Section 2 establishes this obstruction independently of the construction.
  If a map $F arrow.r Y$ violated it, its finite image would have nonpositive Euler characteristic and hence admit
  an infinite cyclic cover. The map lifts because $b_1 \( F \; bb(Q) \) = 0$.
  Twisted second homology still vanishes upstairs, so the argument can be repeated.
  Each lifted image contains strictly more simplices, although all are images of the same fixed triangulated $F$.
  This forces a contradiction.

Section 3 presents the finite plus construction with its explicit cellular splitting.
  Section 4 then gives a five-generator, four-relator presentation and a perfect normal subgroup generated
  normally by two powers. The quotient has an element of order two detected by a complex character.
  An exact four-row boundary calculation shows that the presentation complex has zero second homology with that
  character. The plus construction preserves this vanishing and gives the required finite $D \( 2 \)$ complex.
  Equation (2) excludes its two-dimensional realization.

The geometric obstruction and the finite plus construction play separate roles:
  the former applies to any rank-one local system on a finite two-dimensional complex,
  while the latter is standard once a suitable perfect normal subgroup is available.
  Their combination makes the failure of two-dimensional realization visible in a small twisted cellular boundary
  matrix.

== 2 A tower obstruction in dimension two <sec:tower>

We first isolate the obstruction to a finite two-dimensional model.
  Its input is the vanishing of second homology with a rank-one local system.
  Its conclusion restricts the maps into the complex from finite complexes with vanishing first rational Betti
  number. The case of a Moore complex will then show that the corresponding character cannot detect a finite-order
  element.

A #emph[rank-one complex local system] $L$ on a connected CW complex $T$ assigns a one-dimensional complex vector
  space to each point, with parallel transport along paths that depends only on homotopy relative to the
  endpoints. After choosing a basepoint and a basis of its fiber, its monodromy is a character

$ rho : pi_1 \( T \) arrow.r bb(C)^times . $

We use ordinary homology with these coefficients. In module notation,
  write $bb(C)_rho$ for the right $bb(Z) \[ pi_1 \( T \) \]$-module with $v dot.op g = rho \( g \) v$.
  If the universal-cover cellular chains carry the left deck action, then

$ C_(*) \( T \; L \) = bb(C)_rho ⊗_(bb(Z) \[ pi_1 \( T \) \]) C_(*) \( tilde(T) \; bb(Z) \) . $

Thus cellular chains have finite support, even when $T$ is infinite.
  Equivalently, $C_j \( T \; L \)$ is the direct sum of one coefficient fiber for each oriented $j$-cell,
  with boundary maps defined by parallel transport.

Two elementary consequences will be used throughout the proof.
  First, if $A subset.eq T$ is a subcomplex and $dim T lt.eq 2$, then

#[#set math.equation(numbering: n => "(3)")
 $ H_2 \( A \; L \|_A \) arrow.r H_2 \( T \; L \) quad upright("is injective") . $ <eq:subcomplex-injection>]

Indeed, the cellular chain inclusion is injective, and in dimension at most two the second homology is the kernel
  of the second boundary. This argument requires no injectivity of $pi_1 \( A \) arrow.r pi_1 \( T \)$.
  Second, on a connected complex the zeroth homology is the space of coinvariants,

$ H_0 \( T \; L \) = bb(C) \/ chevron.l \( rho \( g \) - 1 \) v : g in pi_1 \( T \) \, med v in bb(C) chevron.r . $

Consequently, nontrivial monodromy implies $H_0 \( T \; L \) = 0$.

The next lemma ensures that vanishing of second homology also survives the covering operation needed in the tower.

#thm([Lemma 2.1.])[
  (Infinite cyclic covers).  #emph[Let $A$ be a finite connected CW complex of dimension at most two,
    let $L$ be a rank-one complex local system on $A$, and let $p : hat(A) arrow.r
    A$ be a connected infinite cyclic cover. If $H_2 \( A \; L \) = 0$, then
$ H_2 \( hat(A) \; p^(*) L \) = 0 . $

]
] <lem:cyclic-cover>

#proof[
  Choose a generator $tau$ of the deck group and put $R = bb(C) \[ z \, z^(- 1) \]$.
    There is a canonical deck action on the pulled-back local system: in the fiber description of $p^(*) L$, it is
  #[#set math.equation(numbering: n => "(4)")
   $ \( hat(x) \, v \) mapsto \( tau hat(x) \, v \) \, wide v in L_(p \( hat(x) \)) . $ <eq:canonical-deck-action>]
  The equality $p tau = p$ makes this action compatible with parallel transport.
    Let $z$ act by this deck transformation. Choosing one lift of each cell of $A$ and a basis in its coefficient
    fiber identifies $C_j \( hat(A) \; p^(*) L \)$ with a finite free $R$-module,
    of rank equal to the number of $j$-cells of $A$.
  Taking coinvariants of this deck action identifies translated cell lifts and their coefficient fibers.
    It therefore gives an isomorphism of chain complexes
  #[#set math.equation(numbering: n => "(5)")
   $ C_(*) \( hat(A) \; p^(*) L \) ⊗_R R \/ \( z - 1 \) tilde.equiv C_(*) \( A \; L \) . $ <eq:cyclic-specialization>]
  In the chosen bases, let $D \( z \)$ be the matrix of the second boundary upstairs,
    and let $m$ be its number of columns. The matrix $D \( 1 \)$ is the second boundary downstairs,
    so it is injective by the hypothesis. If $m = 0$, there is nothing to prove.
    Otherwise, some $m times m$ minor of $D \( 1 \)$ is nonzero.
    The corresponding minor of $D \( z \)$ is consequently a nonzero Laurent polynomial.
    Thus $D \( z \)$ has full column rank over $bb(C) \( z \)$ and is injective over $R$,
    since $R^m$ embeds in $bb(C) \( z \)^m$. There are no cells above dimension two,
    and hence $H_2 \( hat(A) \; p^(*) L \) = ker D \( z \) = 0$. ◻
]

The following proof adapts the cyclic-tower method of Howie #cite(label("Howie81Pairs")),
  in which one alternates subcomplex inclusions and infinite cyclic covers;
  see Louder–Wilton #cite(label("LouderWilton17")) Section 3.
  Lemma 2 supplies the property that persists along the tower here: vanishing of twisted second homology.

#thm([Theorem 2.2.])[
  (Tower obstruction).  #emph[Let $Y$ be a finite connected CW complex of dimension at most two,
    and let $L$ be a rank-one complex local system on $Y$ with $H_2 \( Y \; L \) = 0$.
    There is no map $f : F arrow.r Y$ from a finite connected simplicial complex satisfying
    $b_1 \( F \; bb(Q) \) = 0$ for which $f^(*) L$ has nontrivial monodromy.]
] <thm:tower>

#proof[
  Suppose that such a map exists. We will repeatedly lift it to an infinite cyclic cover and replace that cover by
    the image of the lift. At every step the image will contain strictly more simplices,
    although the domain retains one fixed finite triangulation.
    For a finite simplicial complex $A$, write $s \( A \)$ for its number of nonempty simplices.
  We first justify working simplicially without increasing the dimension of $Y$.
    Its one-skeleton is a finite graph. Subdivide that graph to make it simplicial and homotope each two-cell
    attaching map to an edge path. After further subdivision if necessary,
    each nonconstant attaching path can be represented by a map from a polygonal circle with at least three edges,
    with every edge mapping homeomorphically onto a graph edge.
    Replace the attachment by the mapping cylinder of this map, capped by a disk along its free boundary circle.
    This merely inserts a collar into the attached disk. The resulting cylinder has one rectangle for each
    traversal of a graph edge. Each rectangle is embedded, with its two upper vertices in the separate domain
    circle and its two lower vertices at distinct endpoints of the graph edge.
    After compatible subdivisions of boundary edges, triangulate each rectangle from its own interior vertex and
    each capping disk from a new interior vertex. This yields a finite simplicial complex even when different
    rectangles traverse the same graph edge: their interiors and upper edges remain distinct.
    A constant attaching map contributes a triangulated two-sphere joined to the graph at one vertex.
    Homotoping the attaching maps preserves the homotopy type,
    so this construction gives a finite simplicial model of dimension at most two.
  Transfer $L$ and $f$ across this homotopy equivalence. Homotopy invariance preserves both $H_2 \( Y \; L \) =
    0$ and the nontrivial pullback monodromy. After a sufficiently fine subdivision of $F$,
    simplicial approximation makes $f$ simplicial. Fix this triangulation of $F$ for the rest of the proof.
    Let $A_0 = f \( F \)$, let $f_0 : F arrow.r A_0$ be the corestriction, and let $L_0 = L \|_(A_0)$.
    The simplicial image $A_0$ is a finite connected subcomplex, and (3) gives $H_2 \( A_0 \; L_0 \) = 0$.
  Here is the inductive step. Suppose that $A_i$ is a finite connected simplicial complex of dimension at most
    two, $f_i : F arrow.r A_i$ is a simplicial map onto its image $A_i$, and $L_i$ satisfies
  #[#set math.equation(numbering: n => "(6)")
   $ H_2 \( A_i \; L_i \) = 0 \, wide f_i^(*) L_i upright(" has nontrivial monodromy") . $ <eq:tower-invariants>]
  The second condition implies that $L_i$ itself has nontrivial monodromy, so $H_0 \( A_i \; L_i \) = 0$.
    Since rank-one cellular chains have the same dimensions as ordinary complex cellular chains,
    the Euler characteristic gives
  $ chi \( A_i \) = - dim_(bb(C)) H_1 \( A_i \; L_i \) lt.eq 0 . $
  On the other hand,
  $ chi \( A_i \) = 1 - b_1 \( A_i \; bb(Q) \) + b_2 \( A_i \; bb(Q) \) . $
  It follows that $b_1 \( A_i \; bb(Q) \) gt.eq 1$. The finitely generated abelianization of $pi_1 \( A_i \)$
    therefore has a nonzero free part, and there is an epimorphism $phi.alt_i : pi_1 \( A_i \) arrow.r.twohead bb(Z)$.
  Let $p_i : hat(A)_i arrow.r A_i$ be the connected cover corresponding to $ker phi.alt_i$.
    The composite $phi.alt_i \( f_i \)_(*)$ is zero: every homomorphism $pi_1 \( F \) arrow.r
    bb(Z)$ factors through $H_1 \( F \; bb(Z) \)$, which is finite because $F$ is finite and
    $b_1 \( F \; bb(Q) \) = 0$. Thus $f_i$ lifts to $tilde(f)_i : F arrow.r hat(A)_i$.
    Give the cover the lifted triangulation. The lift is simplicial on the already fixed triangulation of $F$,
    since on each domain simplex it is the lift of a simplicial map into a single target simplex.
    No new subdivision of $F$ is needed.
  Set
  $ A_(i + 1) = tilde(f)_i \( F \) \, wide L_(i + 1) = \( p_i^(*) L_i \) \|_(A_(i + 1)) \, $
  and corestrict the lift to $f_(i + 1) : F arrow.r A_(i + 1)$.
    Lemma 2, followed by (3), gives $H_2 \( A_(i + 1) \; L_(i + 1) \) = 0$.
    Moreover, $f_(i + 1)^(*) L_(i + 1) tilde.equiv f_i^(*) L_i$, so the nontrivial monodromy persists.
    These are precisely the conditions (6) needed to continue. Figure 1 shows one step.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 10pt)[$F$]])
  content((3, 1.1), [#text(size: 10pt)[$A_(i+1)$]])
  content((6.2, 1.1), [#text(size: 10pt)[$hat(A)_i$]])
  content((6.2, -1.1), [#text(size: 10pt)[$A_i$]])
  line((0.2657, 0.09744), (2.549, 0.9346), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.5, 0.55), [#text(size: 10pt)[$f_(i+1)$]], anchor: "south", padding: 0.1176cm)
  line((3.451, 1.1), (5.758, 1.1), stroke: (thickness: 0.6pt, miter-limit: 10))
  content((4.6, 1.1), [#text(size: 10pt)[inclusion]], anchor: "south", padding: 0.1176cm)
  line((6.2, 0.7369), (6.2, -0.8284), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6.2, 0), [#text(size: 10pt)[$p_i$]], anchor: "west", padding: 0.1176cm)
  content((6.85, 0), [#text(size: 9pt)[infinite cyclic#linebreak()cover]], anchor: "west", padding: 0.1176cm)
  line((0.2657, -0.04715), (5.873, -1.042), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.1, -0.55), [#text(size: 10pt)[$f_i$]], anchor: "north", padding: 0.1176cm)
  content((2.85, -1.85), [#text(size: 9pt)[$s(A_i)<s(A_(i+1)) lt.eq s(F)$]])
})],
    caption: [Figure 1: One step of the tower. The lifted map factors through its finite image $A_(i + 1) subset.eq hat(A)_i$, and the diagram commutes. The domain $F$ keeps the same triangulation at every step; only the indicated subcomplex arrow is an inclusion. ],
  ) <fig:tower>
  It remains to show that $s \( A_i \)$ increases strictly.
    The restriction $p_i \|_(A_(i + 1))$ maps onto $A_i$ and maps each simplex isomorphically onto a simplex.
    Hence $s \( A_(i + 1) \) gt.eq s \( A_i \)$. If equality held,
    there would be exactly one simplex above each simplex of $A_i$, compatibly with all faces.
    The restriction would then be a simplicial isomorphism. Its inverse,
    followed by the inclusion into $hat(A)_i$, would give a section of $p_i$.
    Such a section would make $\( p_i \)_(*)$ surjective, contrary to
  $ "im" \( p_i \)_(*) = ker phi.alt_i eq.not pi_1 \( A_i \) . $
  Thus $s \( A_(i + 1) \) > s \( A_i \)$. But every simplex of $A_i$ is the image of a simplex in the fixed
    triangulation of $F$, so
  $ s \( A_0 \) < s \( A_1 \) < s \( A_2 \) < dots.h.c lt.eq s \( F \) . $
  This is impossible, and the theorem follows. ◻
]

The following consequence is the form used in the construction.

#thm([Corollary 2.3.])[
  (Characters and torsion).  #emph[Let $Y$ be a finite connected CW complex of dimension at most two.
    If a character $rho : pi_1 \( Y \) arrow.r bb(C)^times$ satisfies $H_2 \( Y \; bb(C)_rho \) = 0$,
    then $rho \( g \) = 1$ for every finite-order element $g in pi_1 \( Y \)$.]
] <cor:torsion>

#proof[
  Suppose that $g$ has finite order $n$ and $rho \( g \) eq.not 1$; in particular, $n gt.eq 2$. Let
  $ M_n = S^1 union_(deg n) D^2 $
  be the Moore complex obtained by attaching a disk along a map of degree $n$.
    A loop in $Y$ representing $g$ extends to a map $M_n arrow.r Y$, because its $n$th power is nullhomotopic.
    The cellular boundary $C_2 \( M_n \; bb(Z) \) arrow.r C_1 \( M_n \; bb(Z) \)$ is multiplication by $n$,
    so $H_1 \( M_n \; bb(Z) \) = bb(Z) \/ n$ and $b_1 \( M_n \; bb(Q) \) = 0$.
    The pullback character sends the circle generator to $rho \( g \) eq.not 1$.
  Use the finite simplicial model for $M_n$ constructed in the proof of Theorem 3,
    and compose its homotopy equivalence to $M_n$ with the map to $Y$.
    This gives a finite connected simplicial domain with vanishing first rational Betti number and nontrivial
    pullback monodromy, contradicting that theorem. For $n = 2$ the standard model $M_2$ is $bb(R P)^2$,
    the case needed below. ◻
]

== 3 A finite plus construction <sec:plus>

We next recall how a finitely normally generated perfect subgroup produces a finite $D \( 2 \)$ complex.
  This is the finite form of Quillen’s plus construction #cite(label("Quillen71")) used by
  Mannan #cite(label("Mannan09")) Section 2. We give the construction because its cellular splitting proves both
  the required cohomological vanishing and the preservation of the twisted homology used in Section 2.

Recall that a group $K$ is #emph[perfect] if $K = \[ K \, K \]$,
  or equivalently if its abelianization $K_(upright("ab"))$ is zero.
  A normal subgroup of a group $P$ is #emph[finitely normally generated] if it is the normal closure in $P$ of
  finitely many elements. This condition does not require finite generation as an abstract group.

#thm([Proposition 3.1.])[
  (Finite plus construction).  #emph[Let $B$ be a finite connected CW complex of dimension at most two,
    with $pi_1 \( B \) = P$. Suppose that the normal closure $K$ of elements $t_1 \, dots.h \,
    t_r in P$ is perfect, and put $G = P \/ K$. There is a finite complex $X supset.eq B$,
    obtained by attaching $r$ cells of dimension two and $r$ cells of dimension three, such that:]
  + #emph[the inclusion induces the quotient $P arrow.r G$ on fundamental groups;]
  + #emph[$H_i \( tilde(X) \; bb(Z) \) = 0$ for every $i > 2$, and $H^3 \( X \; M \) =
    0$ for every left $bb(Z) G$-module $M$;]
  + #emph[for every right $bb(Z) G$-module $N$, the inclusion induces $H_(*) \( B \; N \) tilde.equiv
    H_(*) \( X \; N \)$, with the coefficients on $B$ pulled back along $P arrow.r G$.]
] <prop:plus>

#proof[
  Attach two-dimensional cells along loops representing $t_1 \, dots.h \, t_r$,
    and call the resulting complex $B'$. The van Kampen theorem gives $pi_1 \( B' \) = G$.
    Let $overline(B)$ be the full preimage of $B$ in the universal cover $tilde(B')$.
    Since $P arrow.r G$ is onto, $overline(B)$ is connected; it is the covering of $B$ corresponding to $K$. Hence
  $ H_1 \( overline(B) \; bb(Z) \) = K_(upright("ab")) = 0 . $
  Write $R = bb(Z) G$ and regard cellular chains of these covers as left $R$-modules.
    The relative cellular complex $C_(*) \( tilde(B') \, overline(B) \)$ consists of $R^r$ in degree two and zero
    in every other degree. The homology exact sequence of the pair therefore gives a surjection
  #[#set math.equation(numbering: n => "(7)")
   $ H_2 \( tilde(B') \; bb(Z) \) arrow.r H_2 \( tilde(B') \, overline(B) \; bb(Z) \) =
     R^r . $ <eq:relative-surjection>]
  Choose classes $alpha_1 \, dots.h \, alpha_r$ mapping to the standard basis vectors,
    where the basis records chosen lifts and orientations of the new cells.
    The space $tilde(B')$ is simply connected, so the degree-two Hurewicz theorem represents each $alpha_j$ by a
    map $S^2 arrow.r tilde(B')$. Project these maps to $B'$ and attach one three-dimensional cell along each
    projected map. This defines $X$. Only finitely many cells have been added,
    and attaching the last cells does not change the fundamental group.
  The preimage of $B'$ in $tilde(X)$ is its universal cover,
    so we may retain the notation $tilde(B')$ and $overline(B)$. In the chosen cellular bases,
  $ C_3 \( tilde(X) \) = R^r \, wide C_2 \( tilde(X) \) = C_2 \( overline(B) \) xor R^r . $
  Let $q : C_2 \( tilde(X) \) arrow.r R^r$ be projection onto the second summand. The choice in (7) says exactly that
  #[#set math.equation(numbering: n => "(8)")
   $ q thin partial_3 = "id"_(R^r) . $ <eq:split-boundary>]
  Indeed, the relative cellular boundary of the $j$th three-dimensional cell is the $j$th basis vector;
    in the two-dimensional complex $tilde(B')$, a homology class is represented by its cellular two-cycle without
    any ambiguity from three-boundaries.
  Equation (8) proves that $partial_3$ is injective. There are no cells above dimension three,
    so $H_i \( tilde(X) \; bb(Z) \) = 0$ for all $i > 2$. It also gives the cohomological assertion directly.
    For any $R$-linear map $phi : C_3 \( tilde(X) \) arrow.r M$, its extension $phi q : C_2 \( tilde(X) \) arrow.r
    M$ satisfies
  $ \( phi q \) partial_3 = phi . $
  Thus the cochain boundary $"Hom"_R \( C_2 \( tilde(X) \) \, M \) arrow.r
    "Hom"_R \( C_3 \( tilde(X) \) \, M \)$ is onto, and $H^3 \( X \; M \) = 0$.
  Finally, the relative cellular complex of $\( tilde(X) \, overline(B) \)$ is
  #[#set math.equation(numbering: n => "(9)")
   $ 0 arrow.r R^r arrow.r^(thin "id" thin) R^r arrow.r 0 \, $ <eq:relative-complex>]
  in degrees three and two. It is contractible. The short exact sequence of absolute and relative cellular
    complexes is split in each degree, since the cells of $overline(B)$ form subsets of the chosen cellular bases.
    Tensoring with any right $R$-module $N$ therefore leaves a short exact sequence of complexes whose relative
    term is still contractible. Its homology exact sequence gives
  $ H_(*) \( N ⊗_R C_(*) \( overline(B) \) \) tilde.equiv H_(*) \( N ⊗_R C_(*) \( tilde(X) \) \) . $
  The left side computes $H_(*) \( B \; N \)$: the coefficient action of $P$ factors through the deck group $G$ of
    $overline(B) arrow.r B$. The right side computes $H_(*) \( X \; N \)$, proving the last assertion. ◻
]

The splitting in (8) is stronger than ordinary third-homology vanishing:
  it makes the cohomology calculation work for every coefficient module.
  In the application, we will choose $B$ and $K$ so that a character of $G$ has vanishing second homology on $B$,
  yet detects a torsion element of $G$. Proposition 5 preserves that homology vanishing when passing to $X$.

== 4 The counterexample <sec:construction>

We now construct the presentation complex and perfect normal subgroup needed in Proposition 5.
  The quotient must contain torsion detected by a character,
  and the corresponding local system on the presentation complex must have vanishing second homology.
  Perfectness will follow from annihilation relations with coprime coefficients in the subgroup’s abelianization.
  Related uses of coprime annihilators for relation modules appear in
  Bridson–Tweedale #cite(label("BridsonTweedale07")) Proposition 3.3.

Let $B$ be the presentation complex of

#[#set math.equation(numbering: n => "(10)")
 $ P = ⟨x_1 \, a_1 \, x_2 \, a_2 \, s med mid(bar.v) med x_1 a_1 x_1^(- 1) & = a_1^4 \, & x_2 a_2 x_2^(- 1) & =
   a_2^3 \,\
x_1 & = a_2^13 \, & s x_2 s^(- 1) & = a_1^5⟩ . $ <eq:presentation>]

Thus $B$ has one vertex, five edges, and four two-dimensional cells. Define

$ t_1 = x_1^2 \, wide t_2 = x_2^3 \, wide K = chevron.l #h(-0.16667em) chevron.l t_1 \,
  t_2 chevron.r #h(-0.16667em) chevron.r_P \, wide G = P \/ K \, $

where the double brackets denote normal closure in $P$. Sending $s$ to $1 in
  bb(Z)$ and the other four generators to zero respects all these relations and descends to an epimorphism $G
  arrow.r bb(Z)$. In particular, $G$ is infinite. We use the commutator convention $\[ g \, h \] = g h g^(- 1) h^(- 1)$.

#thm([Lemma 4.1.])[
  #emph[The normal subgroup $K$ is perfect.]
] <lem:perfect>

#proof[
  The exponents are matched by $4^2 - 1 = 15 = 3 dot.op 5$ and $3^3 - 1 = 26 = 2 dot.op 13$,
    with $gcd \( 15 \, 26 \) = 1$. Conjugation by $t_1 = x_1^2$ sends $a_1$ to $a_1^16$,
    while conjugation by $t_2 = x_2^3$ sends $a_2$ to $a_2^27$.
    Squaring $x_1 = a_2^13$ and cubing $s x_2 s^(- 1) = a_1^5$ now give
  #[#set math.equation(numbering: n => "(11)")
   $ t_1 = a_2^26 = \[ t_2 \, a_2 \] \, wide s t_2 s^(- 1) = a_1^15 = \[ t_1 \, a_1 \] . $ <eq:commutators>]
  Write $K_(upright("ab"))$ additively and let $u_j$ be the image of $t_j$.
    Conjugation makes $K_(upright("ab"))$ a left $bb(Z) G$-module:
    every element of $K$ acts trivially on its own abelianization.
    For $t in K$, the image of $\[ t \, a \]$ is $\( 1 - a \) \[ t \]$. Consequently
  #[#set math.equation(numbering: n => "(12)")
   $ u_1 = \( 1 - a_2 \) u_2 \, wide s u_2 = \( 1 - a_1 \) u_1 . $ <eq:module-relations>]
  Since $t_1 = a_2^26$, the element $a_2$ fixes $u_1$ and $a_2^26$ acts trivially on all of $K_(upright("ab"))$.
    Applying $1 + a_2 + dots.h.c + a_2^25$ to the first equality gives
  $ 26 u_1 = \( 1 - a_2^26 \) u_2 = 0 . $
  Likewise, $a_1$ fixes $s u_2$, because $s t_2 s^(- 1) = a_1^15$;
    and $a_1^15$ acts trivially on $K_(upright("ab"))$. Applying $1 + a_1 + dots.h.c +
    a_1^14$ to the second equality gives
  $ 15 s u_2 = \( 1 - a_1^15 \) u_1 = 0 . $
  The action of $s$ is invertible, so $15 u_2 = 0$, and the first equality of (12) then gives $15 u_1 = 0$.
    Since $15$ and $26$ are relatively prime, $u_1 = 0$. The second equality gives $s u_2 = 0$, hence $u_2 = 0$.
  Every element of $K$ is a product of $P$-conjugates of $t_1^(plus.minus 1)$ and $t_2^(plus.minus 1)$.
    Thus $u_1 \, u_2$ generate $K_(upright("ab"))$ under addition and the $P$-action.
    Their vanishing proves $K_(upright("ab")) = 0$. ◻
]

By Proposition 5, there is a finite complex $X supset.eq B$ with fundamental group $G$,
  obtained by adding two two-dimensional and two three-dimensional cells, such that

#[#set math.equation(numbering: n => "(13)")
 $ H_i \( tilde(X) \; bb(Z) \) = 0 quad \( i > 2 \) \, wide H^3 \( X \; M \) = 0 quad
   upright("for every left ") bb(Z) G upright("-module ") M . $ <eq:d2-for-x>]

It remains to find the character that obstructs a two-dimensional model.

Choose a primitive third root of unity $zeta in bb(C)$. The assignments

#[#set math.equation(numbering: n => "(14)")
 $ rho \( x_1 \) = - 1 \, quad rho \( a_1 \) = zeta \, quad rho \( x_2 \) = zeta^2 \, quad rho \( a_2 \) = - 1 \,
   quad rho \( s \) = 1 $ <eq:character>]

satisfy the four relations of (10), since

$ zeta = zeta^4 \, wide - 1 = \( - 1 \)^3 \, wide - 1 = \( - 1 \)^13 \, wide zeta^2 = zeta^5 . $

They also send $t_1$ and $t_2$ to $1$. Hence they define a character $rho : G arrow.r bb(C)^times$.
  Denote its local system on $X$ and its pullback to $B$ by $L_rho$.

#thm([Lemma 4.2.])[
  #emph[The local system $L_rho$ satisfies $H_2 \( X \; L_rho \) = 0$.]
] <lem:twisted-vanishing>

#proof[
  Proposition 5 reduces the computation to $B$. Its twisted cellular groups in degrees two and one are $bb(C)^4$
    and $bb(C)^5$, respectively. We compute the second boundary by the lifted edge-path sum,
    equivalently by Fox differentiation #cite(label("Fox53")). In this convention the derivative of a word obeys
  $ frac(partial \( u v \), partial g) = frac(partial u, partial g) + u frac(partial v, partial g) \, wide
    frac(partial g, partial g) = 1 \, wide frac(partial g^(- 1), partial g) = - g^(- 1) \, $
  and the derivatives with respect to other generators are zero. Evaluate their group-ring coefficients at $rho$.
  Use the relators
  $ r_1 & = x_1 a_1 x_1^(- 1) a_1^(- 4) \, wide r_2 = x_2 a_2 x_2^(- 1) a_2^(- 3) \,\
r_3 & = x_1 a_2^(- 13) \, wide r_4 = s x_2 s^(- 1) a_1^(- 5) . $
  With the edges ordered as $x_1 \, a_1 \, x_2 \, a_2 \, s$, the four boundary vectors, written as rows, are
  #[#set math.equation(numbering: n => "(15)")
   $ D =
     mat(delim: "(", 1 - zeta, - 2, 0, 0, 0; 0, 0, 2, zeta^2 - 1, 0; 1, 0, 0, - 1, 0; 0, - \( 1 + zeta \), 1, 0,
     1 - zeta^2) . $ <eq:fox-matrix>]
  Here is a direct check of the entries. For a relator $x a x^(- 1) a^(- n)$,
    the evaluated entries in the $x$ and $a$ coordinates are
  $ 1 - rho \( a \)^n \, wide rho \( x \) - sum_(j = 0)^(n - 1) rho \( a \)^j . $
  For $r_1$, the latter sum is $1 + zeta + zeta^2 + zeta^3 = 1$; for $r_2$, it is $1 - 1 + 1 = 1$.
    For $r_3$, the alternating sum of thirteen terms is $1$. For $r_4$, the $a_1$ entry is $-
    sum_(j = 0)^4 zeta^j = - \( 1 + zeta \)$, the $x_2$ entry is $rho \( s \) = 1$, and the $s$ entry is $1 -
    rho \( x_2 \) = 1 - zeta^2$. These give (15).
  The minor using columns $x_1 \, a_1 \, x_2 \, s$ has determinant
  #[#set math.equation(numbering: n => "(16)")
   $ - 4 \( 1 - zeta^2 \) eq.not 0 . $ <eq:nonzero-minor>]
  Thus the four rows are independent, so the boundary $C_2 \( B \; L_rho \) arrow.r
    C_1 \( B \; L_rho \)$ is injective. Since $B$ has no three-dimensional cells, $H_2 \( B \; L_rho \) = 0$,
    as required. ◻
]

#proof[
  The complex $X$ constructed above is finite and satisfies (13).
    In $G$, the element $x_1$ has square one, and it is nonidentity because $rho \( x_1 \) = - 1$.
    Thus its order is exactly two.
  Suppose that $X$ were homotopy equivalent to a finite connected complex $Y$ of dimension at most two.
    Transfer $rho$ along the induced isomorphism of fundamental groups, giving a local system $L$ on $Y$.
    Homotopy invariance and Lemma 7 give $H_2 \( Y \; L \) = 0$.
    But the transferred character takes the value $- 1$ on an element of order two, contrary to Corollary 4.
  Concretely, a loop representing that element extends to a map $bb(R P)^2 arrow.r Y$:
    the attaching loop of the two-dimensional cell of $bb(R P)^2$ is its generator traversed twice.
    The pulled-back local system has monodromy $- 1$, whereas $b_1 \( bb(R P)^2 \; bb(Q) \) = 0$.
    This is precisely the map excluded by Theorem 3. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
