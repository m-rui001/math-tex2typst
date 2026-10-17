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

#align(center)[#text(size: 16pt, weight: "bold")[An irrational-trace counterexample to reduced Baum--Connes]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

For a countable discrete group $G$, let $C_r^(*) \( G \)$ be the norm closure of its complex group ring in the left regular representation. The reduced Baum–Connes assembly map is

$ mu_j^G : K_j^G \( underline(E) G \) arrow.r K_j \( C_r^(*) \( G \) \) \, #h(2em) j = 0 \, 1 . $

Here $underline(E) G$ is the classifying space for proper actions: its fixed-point sets are contractible for finite subgroups and empty for infinite subgroups. The domain is equivariant $K$-homology with $G$-compact supports, and assembly takes geometric classes to their analytic indices. The conjecture asserts that $mu_j^G$ is an isomorphism for $j = 0 \, 1$. We use integral complex $K$-theory, with coefficient algebra $bb(C)$ carrying the trivial action; no finite-dimensional or cocompact model for $underline(E) G$ is assumed.

Baum and Connes first formulated the conjecture in a manuscript circulated in 1982 and published in 2000 #cite(label("BaumConnes2000")). Their geometric formulation connects elliptic indices with the $K$-theory of reduced crossed products. The formulation of Baum–Connes–Higson uses the universal proper space and equivariant Kasparov theory to state this index problem for second-countable locally compact groups #cite(label("BCH1994")) Conjecture 3.15. The stronger formulation allows a separable $G$-$C^(*)$-algebra $A$ as coefficient, with target $K_j \( A times.r_r G \)$ #cite(label("BCH1994")) Conjecture 9.6.

For the discrete groups considered here, important positive results cover both flexible Hilbert-space geometry and hyperbolic geometry. Higson–Kasparov prove assembly with coefficients for groups acting properly by affine isometries on Hilbert space, including countable amenable groups #cite(label("HigsonKasparov2001")) Theorem 9.1 and Corollary 9.2. Using Lafforgue’s Banach $K K$-theory, Mineyev–Yu prove the coefficient-free conjecture for hyperbolic groups and their subgroups #cite(label("MineyevYu2002")) Theorems 19 and 20; Lafforgue later proves the conjecture with coefficients for hyperbolic groups #cite(label("Lafforgue2012")) Theorem 0.4.

The distinction between trivial and general coefficients is central to this history. Higson–Lafforgue–Skandalis use expanders and spectral projections to detect failures of exactness in reduced crossed products, obtaining counterexamples for groupoids and for discrete groups with suitable commutative coefficients #cite(label("HLS2002")) Section 7 and Remark 12. Those constructions do not give a counterexample to the coefficient-free group assertion above.

Our obstruction uses the canonical trace $tau_G \( sum_g a_g g \) = a_1$, normalized by $tau_G \( 1 \) = 1$. Lück’s trace theorem implies that its value on every degree-zero assembly class is rational. Thus a projection in $C_r^(*) \( G \)$ with irrational trace would obstruct surjectivity. We construct such a projection.

#thm([Theorem 1.1.])[
  #emph[There exist a finitely generated discrete group $G_(upright("sur"))$ and a projection $b_0 in C_r^(*) \( G_(upright("sur")) \)$ with irrational canonical trace. Moreover, 
$ \[ b_0 \] in.not mu_0^(G_(upright("sur"))) #scale(x: 120%, y: 120%)[\(] K_0^(G_(upright("sur"))) \( underline(E) G_(upright("sur")) \) #scale(x: 120%, y: 120%)[\)] . $

 In particular, the coefficient-free reduced Baum–Connes conjecture for countable discrete groups is false.]
] <thm:main>

The trace restriction just used holds without a surjectivity assumption. The extension of $tau_G$ to matrices is the sum of the diagonal traces, and $tau_(G *)$ denotes the induced homomorphism on $K_0$.

#thm([Theorem 1.2.])[
  (Lück).  #emph[For every countable discrete group $G$, 
$ tau_(G *) #h(-0.16667em) (mu_0^G \( K_0^G \( underline(E) G \) \)) subset.eq bb(Q) . $

]
] <thm:trace-image>

#proof[
  #emph[Deduction from the trace theorem.] Put $Lambda_G = bb(Z) \[ 1 \/ \| F \| : F lt.eq G upright(" finite") \] subset.eq bb(Q)$. Lück’s Theorem 0.3 #cite(label("Luck2002")) states that the trace image of assembly after extension of scalars to $Lambda_G$ is $Lambda_G$. On $1 ⊗ x$, this composite has value $tau_(G *) \( mu_0^G \( x \) \)$. Hence that value belongs to $Lambda_G subset.eq bb(Q)$ for every integral class $x$, without assuming surjectivity of assembly or injectivity of localization.
  For precision, our domain is the direct limit of $K K_j^G \( C_0 \( Z \) \, bb(C) \)$ over closed invariant $G$-compact subspaces of a proper $G$-CW model. Assembly is reduced Kasparov descent followed by the product with a cutoff projection and this direct limit. Lück uses the same proper equivariant $K K$-homology and analytic index #cite(label("Luck2002")) Sections 4 and 5. His cocompact subcomplexes are cofinal among these supports: the quotient is a CW complex, and its compact subsets lie in finite subcomplexes. Comparisons with the Davis–Lück formulation are given in #cite(label("HambletonPedersen2004")) Corollary 8.4 and #cite(label("Kranz2021")) Theorem 5.3. ◻
]

===== 1.1 Kernel dimensions and the spectral gap. <kernel-dimensions-and-the-spectral-gap.>

The distinction between an individual kernel and a $K$-theory index already appears in Atiyah’s question about irrational $L^2$-Betti numbers of coverings #cite(label("Atiyah1976")) Section 6.4, question (iii). Grigorchuk and Żuk’s lamplighter spectral calculation led Grigorchuk–Linnell–Schick–Żuk to examples with kernel dimension $1 \/ 3$, although every finite subgroup had order a power of two #cite(label("GLSZ2000")). Dicks–Schick gave an elementary spectral decomposition using finite path operators and projections #cite(label("DicksSchick2002")). Austin then obtained irrational kernel dimensions by varying translation-invariant quotients of finite-field lamp modules #cite(label("Austin2013")) Theorem 1.1 and Corollary 1.2. Fourier transformation turns these operators into local rules on the compact dual of the module; this viewpoint also underlies the present construction. Pichot–Schick–Żuk refined the method to compute explicit transcendental values #cite(label("PichotSchickZuk2015")).

These results concern projections in group von Neumann algebras, which need not belong to reduced group $C^(*)$-algebras. The difference is particularly clear in Grabowski’s construction of integral group-ring matrices with transcendental kernel dimension over the ordinary lamplighter groups $\( bb(Z) \/ m bb(Z) \) wreath bb(Z)$, for integers $m > 1$ #cite(label("Grabowski2016")) Theorem 2. Those groups are amenable and satisfy Baum–Connes. By Theorem 2, their irrational kernel projections cannot lie in matrix algebras over their reduced group $C^(*)$-algebras.

A uniform spectral gap at zero supplies the required $C^(*)$-algebra property: the indicator of zero becomes continuous on the spectrum. Li–Nowak–Pooya use this mechanism for cohomological Laplacians and higher Kazhdan projections, relating gaps and trace restrictions to surjectivity of assembly #cite(label("LiNowakPooya2024")) Propositions 1, 5 and 7. Here the operator comes from local finite-field rules. Its kernel consists of constants on designated expander components, and its trace is computed from their pattern probabilities. Beyond the gaps on those expanders, the construction must provide a uniform positive lower bound on the entire remaining graph.

We obtain that bound using labelled expanders as graphical relators, following the strategy of Gromov #cite(label("Gromov2003")). Osajda’s stronger labelling theorem provides one finite alphabet, globally distinguishable long paths, and isometrically embedded relators #cite(label("Osajda2020")) Theorems 2.7 and 3.2. To pass from separate expander estimates to the full operator, we prove a geometric bound on simultaneous intersections of translated relators and use it in a global cycle-rank estimate.

===== 1.2 Construction and proof. <construction-and-proof.>

The two ingredients that distinguish the construction are exact local module relations and a global spectral estimate. Both use the same geometric ordering, but neither follows from pairwise small overlaps alone. We first choose finite $d$-regular expanders $Theta_i$ with large girth and label them by Osajda’s theorem so that they embed isometrically in a Cayley graph $X = "Cay" \( Gamma \, S \)$ of a finitely generated group $Gamma$. A #emph[copy] is any left translate of an embedded $Theta_i$. Coning off every copy gives a uniformly hyperbolic graph. An avoidance estimate then shows that, relative to any root, all intersections of a copy with other copies whose centers are no farther from the root lie in one small intrinsic tree ball.

This simultaneous intersection bound has two uses. It makes the finite cycle spaces of copies an internal direct sum, and it prevents new local linear relations when codes on copies are imposed on a lamp module. For one prime $p$, codes over $bb(F)_p$ of large dual distance give exact finite-pattern distributions; large primal distance forces a positive proportion of discrepancies on every copy whose pattern is not the designated one.

The resulting group is $G_(upright("sur")) = V times.r Gamma$, with $V$ a finite-field module. On its compact dual, a coordinate value specifies allowed generator labels. The operator $T in C_r^(*) \( G_(upright("sur")) \)$ is $d$ minus the adjacency operator of the enabled graph. Copies carrying the designated pattern are isolated expander components. To control everything else, we eliminate copy coordinates in finite cycle spaces and charge their ranks to disjoint exterior vertex sets. This yields a uniform spectral gap at zero and hence $b_0 = upright(bold(1))_({ 0 }) \( T \) in C_r^(*) \( G_(upright("sur")) \)$ by continuous functional calculus. Its trace is a series $sum_i p^(- k_i)$ whose base-$p$ digits are not eventually periodic; here $k_i$ are the code dimensions, selected to have increasingly large gaps.

The external geometric inputs are recalled where used. The diagram, module, and spectral arguments are given in full, including the simultaneous overlap bound needed to pass from individual copies to the whole enabled graph.

===== 1.3 Organization. <organization.>

Section 2 proves the coned geometry and simultaneous overlap estimate. Section 3 chooses the labelled expanders and derives the finite cycle-space decomposition. Section 4 constructs the codes, the module, and its exact finite marginals. Section 5 proves the spectral gap, with Figure 1 illustrating the cycle-rank argument. Section 6 computes the irrational trace and applies Theorem 2.

== 2 Coned geometry of graphical presentations <sec:geometry>

This section establishes the geometric control needed by the module and spectral arguments: relative to one root, all intersections of a translated relator with relators no farther from the root lie in one short intrinsic ball. We first define the labelled graphs and their coned Cayley graph, then prove an avoidance estimate and uniform thinness. The existence of the graph data, with the required expansion properties, is established in Section 3.

Let $\( Theta_i \)$ be finite connected simple $d$-regular graphs, $d gt.eq 3$, of girths $sigma_i$. Label their oriented edges by a finite alphabet $S^(plus.minus 1)$, with reversal corresponding to formal inversion. Assume that the labelling is reduced, meaning locally injective into the bouquet with alphabet $S$, and that

#[#set math.equation(numbering: n => "(1)")
 $ 0 < lambda lt.eq 1 / 12 \, #h(2em) lambda sigma_i > 3 . $ <eq:geometric-parameters>]

We require the following uniqueness property: the label word of a simple path in $Theta_i$ of length at least $lambda sigma_i$ occurs on no other simple path in the disjoint family.

Define

$ Gamma = chevron.l S divides upright("labels of all closed walks in all ") Theta_i chevron.r \, #h(2em) X = "Cay" \( Gamma \, S \) . $

Initially $X$ is the formal labelled Cayley graph: it has the specified edge from $h$ to $h s$ for each $s in S$, and the reverse traversal has label $s^(- 1)$. This graph is deterministic for reading words, even before loops or multiple edges have been excluded. Assume that the based label maps $phi.alt_i : Theta_i arrow.r X$ are isometric embeddings on vertices. They are well-defined by the presentation. For every $g in Gamma$, write

$ P_(g \, i) = g phi.alt_i \( Theta_i \) $

for the corresponding #emph[copy], with its source identification, and put $sigma \( P_(g \, i) \) = sigma_i$. Denote intrinsic distance in a copy by $d_P$.

#thm([Lemma 2.1.])[
  #emph[Different indexed copies cannot share a simple edge path of length at least $lambda sigma \( P \)$ in either copy $P$. In particular, different index pairs give different labelled subgraphs.]
] <lem:distinct-copies>

#proof[
  Read a common path in the same direction in $X$. Its pullbacks are simple, since the vertex maps are injective. Label uniqueness identifies the source paths and hence their source graph. Equality at the first target vertex then identifies the translating elements. The graphs have simple paths longer than the threshold, by regularity and girth, so equality of whole copies also forces equality of their indices. ◻
]

Adjoin a new center $c_P$ for every copy and join it by an edge to every vertex of $P$. The resulting graph is denoted $hat(X)$; all edges have length one.

=== 2.1 Diagrams with adjustable sides <diagrams-with-adjustable-sides>

We shall use one boundary estimate twice: first to control paths avoiding a specified center, and then to obtain short fillings in $hat(X)$. For a passage through a center, we hold fixed its endpoints and assigned copy, while allowing the path inside that copy to change. A minimal filling will cut these paths into linearly many arcs, counted in terms of the length of the coned walk. An arc separating different assigned copies will be short relative to the girth of either copy.

Start a nonempty closed edge walk in $hat(X)$ at a group vertex and partition it into $m$ sides. Each side is a generator edge in $X$ or a two-edge passage through a center. Inflate a center passage to any walk between its endpoints in its assigned copy. Such a side is #emph[adjustable]; an empty walk is allowed when the endpoints coincide. Generator sides remain fixed. The result is a closed walk in $X$.

For an inflated loop, use a finite connected plane multigraph diagram whose exterior contour maps to that loop and whose bounded-face contours are closed walks in assigned copies. Such diagrams exist by van Kampen’s lemma: the presentation allows all closed walks in the source graphs, and the group value at a face’s initial vertex selects its translated copy. Contours may repeat vertices and edges. This is essential for the surgeries below: deleting a common edge merges its incident regions, but other contacts can remain as repeated vertices or bridges. The merged bounded contour must remain a closed walk in its assigned copy; an adjusted exterior side must remain a walk with its prescribed endpoints and assignment.

An #emph[incidence] is one occurrence of an edge on a contour; a bridge has two incidences on the same contour. The exterior contour retains its partition into side occurrences. Mark the positions where sides end, and also the corresponding plane-graph vertices. There are at most $m$ distinct marked vertices, although the contour may visit a marked vertex repeatedly. Only the marked positions are side breaks: another visit to the same vertex need not end the current side. If inflation gives the empty walk, an isolated marked vertex is permitted.

Minimize the number $F$ of bounded faces, then the number of edges, over diagrams and adjustable walks with the prescribed side data. Suppress all unmarked degree-two vertices; the resulting edges will be called #emph[arcs], and their number will be denoted $b$. An arc retains its original edge length. Loop arcs are allowed.

#thm([Lemma 2.2.])[
  (Short arcs and their number).  #emph[In a diagram chosen as above, the following hold.]
  + #emph[Every bounded face assigned to $P$ has perimeter at least $sigma \( P \)$. Every arc incident to that face has original length less than $lambda sigma \( P \)$.]
  + #emph[More generally, an arc with different copy assignments on its two incidences has length less than $lambda sigma \( Q \)$ for either assignment $Q$. An arc with a generator-side incidence has length one.]
  + #emph[The compressed diagram satisfies 
#[#set math.equation(numbering: n => "(2)")
 $ \( 1 \/ lambda - 6 \) F lt.eq 6 m - 6 \, #h(2em) b lt.eq 6 m . $ <eq:diagram-count>]

]
] <lem:diagram-count>

#proof[
  We first record the consequences of minimality, with contour incidences understood throughout.
  #emph[Face words and mergers.] A bounded-face word cannot be freely trivial. Indeed, the diagram identity expresses the exterior word as a product of conjugates of the face words, each used once. Omitting a freely trivial factor and applying van Kampen’s lemma again gives a diagram with fewer faces for the same exterior word. Its prescribed exterior paths lift identically by determinism of $X$. A closed walk in $P$ shorter than $sigma \( P \)$ cancels to the empty walk, so every face has the claimed lower perimeter bound.
  Suppose two distinct bounded faces with the same copy assignment share an edge. That edge is not a bridge. Delete it and join the two contours along its former incidences. Every remaining step lies in the same copy, so the merged contour is an admissible closed walk there. Exactly one bounded face disappears. Other contacts between the old contours may produce repeated vertices or bridges, which our diagram category allows. Thus this configuration contradicts minimality of $F$.
  The same operation excludes an edge shared by a bounded face and an adjustable exterior side with the same assignment. Replace this particular occurrence of the edge in the side by the rest of the bounded contour. The resulting side is still a walk in that copy with the same endpoints. Its prescribed position among the exterior sides is unchanged, and again one bounded face disappears.
  #emph[Leaves and bounded-face bridges.] There is no unmarked vertex of valence one. Its leaf edge gives an immediate backtrack; on the exterior this lies within one adjustable side, because a side break would be marked and a generator side has marked endpoints. Erasing the leaf preserves the assignments and lowers the edge count.
  There is also no bridge whose two incidences belong to a bounded face. After its open edge is removed, the exterior contour lies wholly in one component. Keep that component and discard the other component together with the bridge. On the affected bounded contour this replaces $q e gamma e^(- 1) q'$ by $q q'$, where $e$ is the bridge and $gamma$ is the entire excursion around the discarded component. The retained walk is still closed and still lies in the assigned copy; no free triviality of $gamma$ is required. The exterior, including its side data, is unchanged. The face count cannot increase—also directly from $F = E - V + 1$—and the edge count decreases.
  #emph[Short arcs.] The incidence type on either side of a compressed arc is constant: it is a bounded face or an exterior side of the prescribed decomposition. Changes of exterior side occur at marked vertices and are not suppressed. An arc with a generator-side incidence therefore has length one. By the preceding restrictions, an arc incident to a bounded face has either such an incidence on the other side or a different copy assignment there.
  Consider an arc with different assignments and length greater than two. Its word is freely reduced. Otherwise a consecutive cancelling pair has an unmarked bivalent midpoint and two distinct endpoints in the diagram. The latter assertion holds even for a loop arc: its internal vertices are distinct and closure occurs only at the two ends of the entire arc. Contract the cancelling pair as a length-two tree, identifying its outer endpoints, which have the same group value. At each incident contour the two steps cancel, so assignments and side data are preserved. This non-loop contraction preserves $F$ and lowers the edge count, a contradiction.
  If the arc had length at least $lambda sigma \( Q \)$ for one assignment $Q$, its first $ceil.l lambda sigma \( Q \) ceil.r$ edges would be a nonbacktracking path shorter than the girth. It is simple in $Q$, hence also in the other source by the vertex embeddings. This contradicts Lemma 3. Arcs of length at most two are already shorter than the threshold. This proves (a) and (b).
  #emph[Counting.] There is a marked vertex, so suppression cannot leave an exceptional unmarked circle component. Every unmarked surviving vertex has valence at least three. If $v_D$ is the compressed vertex count, then
  $ v_D - b + F = 1 \, #h(2em) 2 b gt.eq 3 \( v_D - m \) \, #h(2em) b lt.eq 3 F + 3 m - 3 . $
  By (a), every bounded face has at least $1 \/ lambda$ arc incidences, counted with multiplicity. Their total is at most $2 b$, so
  $ F \/ lambda lt.eq 2 b lt.eq 6 F + 6 m - 6 . $
  This is the first inequality in (2). Since $lambda lt.eq 1 \/ 12$, it gives $F lt.eq m - 1$ and then $b lt.eq 6 m$. The same formulas cover trees and the isolated marked vertex. ◻
]

=== 2.2 Avoidance and uniform thinness <avoidance-and-uniform-thinness>

The arc bound has two geometric consequences. Closing an avoiding path by a designated cone passage bounds its endpoints’ intrinsic distance. Replacing arcs by cone passages while retaining fixed generator edges produces a linear filling inequality with universal constants.

#thm([Proposition 2.3.])[
  #emph[There is an integer $D_0$, independent of all the above data, such that every vertex on a geodesic triangle in $hat(X)$ is within $D_0$ of a vertex on another side. Moreover:]
  + #emph[ If an edge path of length $L$ joins $x \, a in P$ while avoiding $c_P$, then 
#[#set math.equation(numbering: n => "(3)")
 $ d_P \( x \, a \) lt.eq 12 \( L + 1 \) lambda sigma \( P \) . $ <eq:avoidance>]

]
  + #emph[ If $lambda < 1 \/ 12$, the graph $X$ is simple: no nonfreely-trivial closed label word in $X$ has length at most two.]
] <prop:cone-geometry>

#proof[
  #emph[Avoidance.] For (3), close the given avoiding path by one designated side through $c_P$. Then $m lt.eq L + 1$, and no other side has center $c_P$. Use a minimal diagram. An arc incidence on the designated side is opposite a bounded face of different assignment or an exterior incidence across a bridge. In the latter case the other incidence cannot also lie in the designated side. If it did, the interval from that bridge’s first traversal to its retraversal in the #emph[linear] side walk would contain no prescribed side break. Excise the visited component and the bridge. This shortens only the designated side, preserving its endpoints and copy assignment, and cannot increase $F$. It contradicts minimality. This argument concerns marked positions; additional visits to a marked vertex do not insert a side break.
  Thus every designated-side incidence has length less than $lambda sigma \( P \)$, either by Lemma 4(b) or because its opposite incidence is a generator side. There are at most $2 b$ such occurrences. The adjusted walk inside $P$ has length at most $12 \( L + 1 \) lambda sigma \( P \)$, giving the distance bound. Empty walks, including the case $x = a$, satisfy it as well.
  #emph[Simplicity of the Cayley graph.] For part (3), consider a closed word of one or two generator sides. Strict $lambda < 1 \/ 12$ in (2) forces $F = 0$. The exterior contour of a tree is freely trivial. This excludes identity generators, unintended coincidences of generator edges, and generator involutions, as claimed.
  #emph[Short fillings.] To establish uniform thinness, we first show that every edge loop of length $n > 0$ in $hat(X)$ has a filling with at most $12 n$ relation faces of perimeter at most four. For its $m lt.eq n$ sides, take the compressed minimal diagram. Choose one #emph[standard path] for each arc, consistently under reversal. Keep the unit edge if the arc has a generator-side incidence. Otherwise an assignment at an incidence contains both endpoints, so use the two-edge path through that copy’s center.
  Around a bounded face assigned to $P$, replace each standard path by the two-edge path through $c_P$. Each replacement uses one closed walk of length at most four. The resulting contour freely contracts through that one center. Thus the standard exterior walk can be filled at cost at most the number of bounded-face incidences. On an exterior adjustable side, make the same replacements through its prescribed center. The consecutive pairs reduce to the required single cone passage. If an inflated side was empty, insert its desired backtrack freely. Generator sides need no change. The total cost is at most the number of bounded-face and exterior adjustable-side incidences, hence at most $2 b lt.eq 12 m lt.eq 12 n$.
  This filling argument works for the singular diagrams being used. More explicitly, for directed edge paths with their endpoint values, the plane-diagram identity expresses the exterior contour as a product of conjugates of the bounded contours, one for each face, up to free edge cancellations and their inverses. Substituting the indicated fillings gives the claimed product of short relations. Conversely, the van Kampen construction from this product gives a plane diagram over the graph: inverse-edge folds identify only vertices with the same target value.
  #emph[From fillings to thin triangles.] The bound implies the coarse filling hypothesis in #cite(label("BH1999")) III.H.2.1 and III.H.2.9 with universal constants. Subdivide a rectifiable loop of length $ell$ into $O \( ell + 1 \)$ arcs of length at most one. Choose nearby vertices at distance at most one and join successive ones by paths of at most three edges. Fill this edge loop as above. In a resulting small-face diagram with $f$ faces and exterior length $n$,
  $ 2 E = n + sum_F \| partial F \| lt.eq n + 4 f \, #h(2em) V lt.eq E + 1 . $
  Thicken its finite plane graph to a regular neighborhood, using vertex disks and edge strips, and cap the bounded contour components. The result is a disk. The vertex regions are mapped to vertices, the strips along their edges, and each cap has a boundary of bounded image perimeter. Triangulation has total cost $O \( E + V + f \)$; each triangle can be assigned a map of uniformly bounded image diameter. Coarse fillings do not require continuous maps on their interiors. An additional collar with $O \( n \)$ triangles restores the prescribed exterior parameterization: each block joins a unit-edge traversal to that traversal with its inserted vertex pauses, and its image lies in the same edge. The short paths to the original subdivision points give an annulus with $O \( ell + 1 \)$ further triangles of bounded image diameter. Constant loops or empty approximating walks are filled separately by a bounded number of triangles.
  The constants in this construction are independent of the graphs, alphabet, and $lambda$. A connected unit-edge graph is geodesic, regardless of local finiteness. The cited theorem therefore gives a hyperbolicity constant depending only on these universal coarse filling constants. Enlarging it to an integer accounts for moving points on triangle sides to vertices and gives the required $D_0$. ◻
]

=== 2.3 Simultaneous overlaps <simultaneous-overlaps>

Set, once and for all,

#[#set math.equation(numbering: n => "(4)")
 $ t = D_0 + 3 \, #h(2em) L_0 = 2 + 2 t + 2 D_0 . $ <eq:root-constants>]

The next consequence is stronger than a pairwise intersection bound: one ball controls all the intersections in the specified distance order.

#thm([Lemma 2.4.])[
  (Simultaneous overlap bound).  #emph[Let $R$ be a group vertex or a center of $hat(X)$, and let $A = c_P eq.not R$. Choose one geodesic from $A$ to $R$, whose first group vertex is $a in P$. Every vertex shared by $P$ and any #emph[different] copy $Q$ with 
$ d_(hat(X)) \( c_Q \, R \) lt.eq d_(hat(X)) \( c_P \, R \) $

 lies in the intrinsic induced ball $B_P$ about $a$ of radius 
#[#set math.equation(numbering: n => "(5)")
 $ r_P = ⌊12 \( L_0 + 1 \) lambda sigma \( P \)⌋ . $ <eq:overlap-radius>]

]
] <lem:overlap>

#proof[
  Take such a $Q$ and a shared vertex $x$, and write $B = c_Q$. The path $A \, x \, B$ is a length-two geodesic. A geodesic from $B$ to $R$ avoids $A$, since passing through $A$ would give length $2 + d \( A \, R \) > d \( A \, R \)$. All distances in the rest of this paragraph are in $hat(X)$.
  If $d \( A \, R \) gt.eq t$, let $z$ be the vertex at distance $t$ along the chosen $A$-to-$R$ geodesic. Its distance from every vertex of $A \, x \, B$ is at least $t - 2 > D_0$. Thinness supplies a vertex $y$ on the $B$-to-$R$ side with $d \( y \, z \) lt.eq D_0$. A shortest bridge between them avoids $A$, because $d \( A \, z \) = t > D_0$. Follow $x \, B \, y \, z \, a$, using that bridge and the indicated geodesic segments. This walk avoids $A$, and its length is at most
  $ 1 + \( 2 + t + D_0 \) + D_0 + \( t - 1 \) = L_0 . $
  If $d \( A \, R \) < t$, use instead the walk from $x$ through $B$ to $R$ and back to $a$. It avoids $A$ and has length at most $1 + d \( B \, R \) + d \( A \, R \) - 1 lt.eq 2 d \( A \, R \) lt.eq L_0$.
  Apply (3) to obtain $d_P \( x \, a \) lt.eq 12 \( L_0 + 1 \) lambda sigma \( P \)$. Intrinsic vertex distances are integers, so taking the floor gives the claimed radius. Crucially, the chosen $a$ does not depend on $Q$ or $x$. ◻
]

== 3 Labelled expanders and their finite cycle spaces <sec:data>

Fix a positive $lambda < 1 \/ 24$ so small that

#[#set math.equation(numbering: n => "(6)")
 $ 12 \( L_0 + 1 \) lambda lt.eq 1 / 16 \, $ <eq:lambda-choice>]

where $L_0$ is the universal constant from (4). Put $eta = 1 \/ 100$.

#thm([Proposition 3.1.])[
  (Choice of data).  #emph[There are labelled graphs $\( Theta_i \)_(i gt.eq 1)$ satisfying all the hypotheses of Section 2, with the following additional properties. Write $n_i = \| "Vert" \( Theta_i \) \|$, $k_i = floor.l n_i \/ 2 floor.r$, and let $sigma_i$ be the girth. There are constants $rho \, kappa > 0$, independent of $i$, such that:]
  + #emph[On the orthogonal complement of constants in $ell^2 \( "Vert" \( Theta_i \) \)$, $d I - "Adj"_(Theta_i) gt.eq rho I$, and for every vertex subset $W$, 
#[#set math.equation(numbering: n => "(7)")
 $ \| partial W \| gt.eq kappa min { \| W \| \, n_i - \| W \| } . $ <eq:expansion>]

 Here $partial W$ is the unoriented edge boundary in $Theta_i$.]
  + #emph[With 
#[#set math.equation(numbering: n => "(8)")
 $ c = eta / 2 min { kappa \, 1 } \, $ <eq:c-definition>]

 we have $n_i > 100$, $sigma_i > max { 16 \, 20 \/ c }$, $lambda sigma_i > 3$, and $1 < floor.l lambda sigma_i floor.r < floor.l lambda sigma_(i + 1) floor.r$.]
  + #emph[Every induced intrinsic ball of radius at most $sigma_i \/ 16$ is a tree with fewer than $eta n_i$ vertices.]
  + #emph[The integers $k_i$ strictly increase and $k_(i + 1) - k_i arrow.r oo$.]
  #emph[Consequently every ball $B_P$ in Lemma 6, for every permitted root and chosen root geodesic, is an induced tree satisfying 
#[#set math.equation(numbering: n => "(9)")
 $ r_P lt.eq sigma \( P \) \/ 16 \, #h(2em) \| B_P \| < eta \| P \| . $ <eq:small-ball>]

]
] <prop:data>

#proof[
  Start with a fixed-degree family of connected regular expanders of unbounded order and girth at least a positive constant times logarithmic order, as supplied by the Lubotzky–Phillips–Sarnak construction #cite(label("LPS1988")) Theorems 3.4 and 4.1; see also #cite(label("Osajda2020")) Section 2.4. Discarding small graphs leaves simple graphs. Their Laplacians have a common gap $rho > 0$ off the constants. Bipartiteness, if present, causes no problem: the adjacency eigenvalue $- d$ gives Laplacian eigenvalue $2 d$, not another zero eigenvalue.
  For $w = \| W \|$, the centered indicator of $W$ has squared norm $w \( n - w \) \/ n$ and Laplacian energy $\| partial W \|$. Thus
  $ \| partial W \| gt.eq rho frac(w \( n - w \), n) gt.eq rho / 2 min { w \, n - w } \, $
  so we may choose $kappa = rho \/ 2$. A ball containing at most half the vertices has an outside vertex boundary of size at least $kappa \/ d$ times its size. Balls grow by a fixed factor until they contain more than half the graph. Any two such balls intersect, giving a uniform $O \( log n \)$ diameter bound. Hence the diameter/girth ratio is bounded.
  An induced ball of integer radius $r$ with $2 r + 1 < sigma$ is a tree: an edge outside a shortest-path tree would create a cycle of length at most $2 r + 1$. Its order at $r lt.eq sigma \/ 16$ is at most
  $ 1 + d sum_(j = 0)^(floor.l sigma \/ 16 floor.r - 1) \( d - 1 \)^j . $
  Regularity and the same tree property at radius $floor.l \( sigma - 2 \) \/ 2 floor.r$ give the lower bound
  $ n gt.eq 1 + d sum_(j = 0)^(floor.l \( sigma - 2 \) \/ 2 floor.r - 1) \( d - 1 \)^j . $
  The ratio tends to zero with $sigma$. A subsequence therefore satisfies (ii)–(iv), including (iii); growing order allows the gaps in (iv) to be chosen arbitrarily large.
  The resulting sequence has bounded degree, growing girth, bounded diameter/girth ratio, and the required strictly increasing floors. Osajda’s labelling theorem #cite(label("Osajda2020")) Theorem 2.7, applied to the already chosen $lambda$, gives a reduced labelling over one finite alphabet with no repeated long path word. Its conclusion for nonbacktracking paths includes the simple-path condition used here. The associated graphical presentation has isometrically embedded relators by #cite(label("Osajda2020")) Lemma 3.1 and Theorem 3.2. This supplies the data of Section 2. Finally, (6), (5), and (iii) give (9). ◻
]

===== 3.1 Order of choices. <order-of-choices.>

The constants used above are chosen in the order recorded in Table 1. In particular, the geometric constant is universal before the small-cancellation parameter is selected. Neither the alphabet nor the code field is fixed while choosing the expanders.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Choice
], table.cell(rowspan: 1, colspan: 1)[Requirement and subsequent use
]),
  table.cell(rowspan: 1, colspan: 1)[$D_0 \, t \, L_0$
], table.cell(rowspan: 1, colspan: 1)[Universal thinness and root-path constants from Proposition 5 and (4).
],
  table.cell(rowspan: 1, colspan: 1)[$lambda$
], table.cell(rowspan: 1, colspan: 1)[$0 < lambda < 1 \/ 24$ and $12 \( L_0 + 1 \) lambda lt.eq 1 \/ 16$, so every overlap ball has radius at most one sixteenth of the girth.
],
  table.cell(rowspan: 1, colspan: 1)[$d \, rho \, kappa$
], table.cell(rowspan: 1, colspan: 1)[One fixed-degree expander family; take $kappa = rho \/ 2$. Set $eta = 1 \/ 100$ and $c = \( eta \/ 2 \) min { kappa \, 1 }$.
],
  table.cell(rowspan: 1, colspan: 1)[$\( Theta_i \)$
], table.cell(rowspan: 1, colspan: 1)[Pass to a subsequence with $sigma_i > max { 16 \, 20 \/ c }$, small tree balls, strictly increasing $floor.l lambda sigma_i floor.r$, and diverging gaps between $k_i = floor.l n_i \/ 2 floor.r$.
],
  table.cell(rowspan: 1, colspan: 1)[$S$
], table.cell(rowspan: 1, colspan: 1)[A single finite alphabet supplied by the labelling theorem for this sequence and this value of $lambda$.
],
  table.cell(rowspan: 1, colspan: 1)[$p \, C_i$
], table.cell(rowspan: 1, colspan: 1)[Choose a prime $p > 2$ encoding all $d$-element sets of outgoing labels; then choose the $k_i$-dimensional codes in Lemma 9.
],
  table.cell(rowspan: 1, colspan: 1)[$epsilon$
], table.cell(rowspan: 1, colspan: 1)[The uniform gap is $min { rho \, c^2 \/ \( 8 d \) }$, as proved in Lemma 17.
],
)
]],
  caption: [Table 1: Parameter choices for $G_(upright("sur"))$. Each row uses only earlier choices; the last row records the resulting spectral estimate. ],
)

From now on all these data, the group $Gamma$, its Cayley graph $X$, and the coned graph $hat(X)$ are fixed. By Proposition 5, $X$ is simple. We identify a copy with its vertex set when discussing supports and specify its edges when discussing chains.

For a graph $Y$, let $Z_1 \( Y \; bb(F)_2 \)$ be its ordinary #emph[finite-support] cycle space: its elements are finite sums of edges with coefficients in $bb(F)_2$, with even incidence at every vertex. Thus no completed chain spaces are used in the next statement.

#thm([Lemma 3.2.])[
  (Direct sum of copy cycles).  #emph[The inclusions of the copies give an internal algebraic direct sum 
#[#set math.equation(numbering: n => "(10)")
 $ Z_1 \( X \; bb(F)_2 \) = xor.big_P Z_1 \( P \; bb(F)_2 \) . $ <eq:cycle-sum>]

]
] <lem:cycle-sum>

#proof[
  Every finite cycle is a sum of closed walks. The label of any such walk is trivial in $Gamma$, so a finite van Kampen diagram over the presentation expresses its edge chain, modulo two, as the sum of the chains of its bounded-face walks. Each lies in a copy. This proves spanning.
  Suppose finitely many nonzero cycles in distinct copies sum to zero. Choose a group-vertex root $R$ and a participating copy $P$ whose center is farthest from $R$. By Lemma 6, all its intersections with the other participating copies lie in one ball $B_P$, which is an induced tree by (9). Every nonzero edge coefficient in its cycle must cancel against an edge of another participating copy. Both endpoints therefore lie in $B_P$, and inducedness puts the edge itself in that tree. A tree has no nonzero finite cycle, a contradiction. ◻
]

== 4 Codes and the module extension <sec:module>

Fix the labelled graphs and the group $Gamma$ supplied by Proposition 7. Retain the notation

$ n_i = \| "Vert" \( Theta_i \) \| \, #h(2em) k_i = floor.l n_i \/ 2 floor.r \, #h(2em) eta = 1 / 100 . $

In particular, $n_i > 100$. A copy $P = P_(g \, i)$ carries its prescribed identification with $Theta_i$, and its vertex set is a subset of $Gamma$. For every choice of root and copy to which Lemma 6 applies, the ball furnished by that lemma is an induced tree with fewer than $eta n_i$ vertices, by Proposition 7.

=== 4.1 Port patterns and codes <port-patterns-and-codes>

We call an outgoing generator label a #emph[port]. At a vertex $v$ of $Theta_i$, let

$ J_i \( v \) subset.eq S^(plus.minus 1) $

be the set of outgoing labels of its incident edges. Reducedness of the labelling and $d$-regularity give $\| J_i \( v \) \| = d$. Choose a prime $p > 2$ large enough that the $d$-element subsets of $S^(plus.minus 1)$ admit an injection

$ J mapsto a_J in bb(F)_p^times . $

Define the decoder

$ cal(J) \( a \) = cases(delim: "{", J \, & a = a_J upright(" for a ") d upright("-element subset ") J subset.eq S^(plus.minus 1) \,, diameter \, & upright("otherwise") \,) #h(2em) a in bb(F)_p . $

The prototype pattern on $Theta_i$ is

$ w_i \( v \) = a_(J_i \( v \)) . $

Every coordinate of $w_i$ is nonzero. Write $J_P \( h \)$ and $w_P \( h \)$ for the corresponding data transported to a copy $P = P_(g \, i)$, so that $cal(J) \( w_P \( h \) \) = J_P \( h \)$.

On a finite coordinate space $bb(F)_p^E$, orthogonal complements will always refer to the nondegenerate bilinear form

$ chevron.l z \, z' chevron.r = sum_(v in E) z \( v \) z' \( v \) in bb(F)_p . $

For $z in bb(F)_p^E$, let $"supp" z = { v in E : z \( v \) eq.not 0 }$.

We seek a linear code containing the prescribed word $w_i$ with two different support guarantees. Any other codeword must differ from $w_i$ at many vertices, forcing many missing prescribed edge incidences after decoding. Vectors in the dual code will instead supply the module relations. Their support must be larger than an overlap ball, so that a nonzero relation on a farthest copy cannot cancel against all the other relations. The following Gilbert–Varshamov type counting argument #cite(label("Gilbert1952")) #cite(label("Varshamov1957")) obtains both bounds while keeping $w_i$ in the code.

#thm([Lemma 4.1.])[
  (Codes with both distances).  #emph[For every $i$ there is a $k_i$-dimensional subspace $C_i subset.eq bb(F)_p^("Vert" \( Theta_i \))$ such that $w_i in C_i$ and 
$ \| "supp" z \| > eta n_i #h(2em) upright("for every nonzero ") z in C_i union C_i^perp . $

]
] <lem:codes>

#proof[
  Write $n = n_i$, $k = k_i$, and $w = w_i$, and choose $C$ uniformly among the $k$-dimensional subspaces containing $chevron.l w chevron.r$. For a fixed $z in.not chevron.l w chevron.r$, the quotient by $chevron.l w chevron.r$ gives
  #[#set math.equation(numbering: n => "(11)")
   $ Pr \( z in C \) = frac(p^(k - 1) - 1, p^(n - 1) - 1) < p^(k - n) . $ <eq:primal-probability>]
  Indeed, a uniform $a$-dimensional subspace of an $N$-dimensional vector space contains a fixed nonzero vector with probability $\( p^a - 1 \) \/ \( p^N - 1 \)$, by counting nonzero vectors and symmetry. Nonzero vectors of $chevron.l w chevron.r$ have full support.
  Orthogonal complementation is a bijection from the sample space just used to the $\( n - k \)$-dimensional subspaces of the $\( n - 1 \)$-dimensional space $w^perp$. Consequently, for a fixed nonzero $z$,
  #[#set math.equation(numbering: n => "(12)")
   $ Pr \( z in C^perp \) = cases(delim: "{", frac(p^(n - k) - 1, p^(n - 1) - 1) < p^(1 - k) \, & z in w^perp \,, 0 \, & z in.not w^perp .) $ <eq:dual-probability>]
  This argument uses nondegeneracy of the form on the ambient coordinate space, not of its restriction to $w^perp$; it remains valid when $chevron.l w \, w chevron.r = 0$.
  We bound the number of low-weight vectors. Put $r = floor.l eta n floor.r$ and $q = eta \/ \( 1 - eta \) < 1$. The binomial theorem gives
  $ q^r sum_(j = 0)^r binom(n, j) lt.eq sum_(j = 0)^r binom(n, j) q^j lt.eq \( 1 + q \)^n . $
  It follows that
  $ sum_(j = 0)^r binom(n, j) lt.eq q^(- eta n) \( 1 + q \)^n = 2^(H_2 \( eta \) n) \, #h(2em) H_2 \( t \) = - t log_2 t - \( 1 - t \) log_2 \( 1 - t \) . $
  Here $H_2 \( 1 \/ 100 \) < 9 \/ 100$: use $log_2 100 < 7$, $- log \( 1 - eta \) lt.eq eta \/ \( 1 - eta \)$, and $log 2 > 1 \/ 2$. Since $p gt.eq 2$, the Hamming ball therefore satisfies
  #[#set math.equation(numbering: n => "(13)")
   $ \| { z : \| "supp" z \| lt.eq r } #scale(x: 120%, y: 120%)[\|] = sum_(j = 0)^r binom(n, j) \( p - 1 \)^j lt.eq p^(eta n) 2^(H_2 \( eta \) n) lt.eq p^(\( eta + H_2 \( eta \) \) n) < p^(n \/ 4) . $ <eq:hamming-ball>]
  Every nonzero vector in this ball lies outside $chevron.l w chevron.r$. By (11)–(13) and the union bound, the probability that either $C$ or $C^perp$ contains such a vector is less than
  $ p^(n \/ 4) #scale(x: 120%, y: 120%)[\(] p^(k - n) + p^(1 - k) #scale(x: 120%, y: 120%)[\)] lt.eq p^(- n \/ 4) + p^(3 \/ 2 - n \/ 4) < 1 \, $
  where $k = floor.l n \/ 2 floor.r$ and $n > 100$. Thus a suitable $C$ exists. ◻
]

Choose a code $C_i$ as in Lemma 9 for every $i$. Transporting coordinates defines subspaces $C_P$ and $C_P^perp$ on every copy $P = P_(g \, i)$. The transport preserves the bilinear form, so these subspaces are orthogonal complements in $bb(F)_p^P$.

=== 4.2 The quotient module <the-quotient-module>

Translation-invariant quotients of finite-field lamp modules also occur in Austin’s irrational-kernel construction #cite(label("Austin2013")) Sections 1–2. Here the relations are dual codewords on all translated expander copies. We must show that imposing them globally creates exactly the prescribed relations on each individual copy.

Let $bb(F)_p^(\( Gamma \))$ denote the finite-support coordinate space with basis $\( upright(bold(e))_h \)_(h in Gamma)$, on which $Gamma$ acts by $g upright(bold(e))_h = upright(bold(e))_(g h)$. Regard $bb(F)_p^P$ as its coordinate subspace by extension by zero. Define the algebraic sum

#[#set math.equation(numbering: n => "(14)")
 $ W_0 = sum_(g in Gamma\
i gt.eq 1) C_(P_(g \, i))^perp subset.eq bb(F)_p^(\( Gamma \)) . $ <eq:relation-module>]

Every vector in this sum is a sum of finitely many terms. Left translation carries $C_(P_(g \, i))^perp$ to $C_(P_(h g \, i))^perp$, so $W_0$ is $Gamma$-invariant.

#thm([Lemma 4.2.])[
  (Exact coordinate relations).  #emph[For every copy $P$, 
#[#set math.equation(numbering: n => "(15)")
 $ W_0 ∩ bb(F)_p^P = C_P^perp . $ <eq:module-intersection>]

]
] <lem:module-intersection>

#proof[
  The inclusion from right to left follows from (14). For the converse, let
  $ z = sum_(Q in cal(F)) z_Q in W_0 ∩ bb(F)_p^P \, #h(2em) 0 eq.not z_Q in C_Q^perp \, $
  where $cal(F)$ is finite and its copies are distinct. Such an expression is obtained by combining terms on the same copy and discarding zero terms.
  Suppose that $cal(F)$ contains a copy different from $P$. Root the coned graph at $R = c_P$, and choose $Q in cal(F) \\ { P }$ whose center is farthest from $R$. Every other copy in $cal(F)$, and also $P$ itself, has center at distance from $R$ at most $d_(hat(X)) \( c_Q \, R \)$. Lemma 6 places all their vertex intersections with $Q$ in one intrinsic ball $B_Q subset.eq Q$. If $Q$ has type $j$, Proposition 7 gives
  $ \| B_Q \| < eta n_j < \| "supp" z_Q \| . $
  Choose $h in "supp" z_Q \\ B_Q$. Then $h in.not P$ and $h$ belongs to no other copy in $cal(F)$. The $h$-coordinate of $z$ is therefore $z_Q \( h \) eq.not 0$, contradicting $z in bb(F)_p^P$. Hence the expression has no term away from $P$, and $z in C_P^perp$. ◻
]

#prodef([Definition 4.3.])[
  Define the discrete additive group and distinguished element
  $ V = bb(F)_p^(\( Gamma \)) \/ W_0 \, #h(2em) v_(*) = \[ upright(bold(e))_1 \] in V \, $
  with the induced $Gamma$-action, and put
  $ G_(upright("sur")) = V times.r Gamma . $
  We use the multiplication $\( v \, g \) \( v' \, g' \) = \( v + g v' \, g g' \)$ in $G_(upright("sur"))$.
]

For $h in Gamma$, one has $h v_(*) = \[ upright(bold(e))_h \]$. The group $G_(upright("sur"))$ is countable: $Gamma$ is finitely generated, and the finite-support coordinate space over the finite field $bb(F)_p$, its quotient $V$, and $V times Gamma$ are countable. In fact $G_(upright("sur"))$ is finitely generated. The additive group of $V$ is generated by the $Gamma$-orbit of $v_(*)$, since these are the images of the coordinate basis and multiplication by a scalar in $bb(F)_p$ is repeated addition. In the semidirect product,

$ \( 0 \, h \) \( v_(*) \, 1 \) \( 0 \, h \)^(- 1) = \( h v_(*) \, 1 \) . $

It follows that $\( v_(*) \, 1 \)$ together with the finitely many lifts $\( 0 \, s \)$, $s in S$, generates $G_(upright("sur"))$.

=== 4.3 The compact dual and its finite marginals <the-compact-dual-and-its-finite-marginals>

Write the compact dual of $V$ as

$ Omega = "Hom"_(bb(F)_p) \( V \, bb(F)_p \) . $

The corresponding complex character is $v mapsto exp \( 2 pi upright(i) thin omega \( v \) \/ p \)$, where field elements are identified with residues modulo $p$. We equip $Omega$ with the topology of pointwise convergence, equivalently the subspace topology from $bb(F)_p^V$. It is a closed subgroup of this compact product, and hence a compact abelian group. Let $m_Omega$ be its Haar probability measure. For $omega in Omega$ and $h in Gamma$, define

$ X_omega \( h \) = omega \( h v_(*) \) . $

The notation $X_omega$ denotes a coordinate pattern, not the Cayley graph $X$.

#thm([Lemma 4.4.])[
  (Uniform pattern marginals).  #emph[For a copy $P = P_(g \, i)$, the restriction map 
$ "res"_P : Omega arrow.r bb(F)_p^P \, #h(2em) omega mapsto X_omega \|_P $

 has image exactly $C_P$. Its pushforward of $m_Omega$ is the uniform measure on $C_P$. In particular, for every $a in C_P$, 
#[#set math.equation(numbering: n => "(16)")
 $ m_Omega { omega : X_omega \|_P = a } = p^(- k_i) \, $ <eq:uniform-marginal>]

 and this applies to $a = w_P$.]
] <lem:marginals>

#proof[
  Let $q_P : bb(F)_p^P arrow.r V$ be the restriction of the quotient map. Lemma 10 gives
  $ ker q_P = C_P^perp . $
  For $z in bb(F)_p^P$ and $omega in Omega$,
  $ omega \( q_P \( z \) \) = sum_(h in P) z \( h \) omega \( h v_(*) \) = chevron.l z \, X_omega \|_P chevron.r . $
  Thus $X_omega \|_P$ annihilates $C_P^perp$, and belongs to $\( C_P^perp \)^perp = C_P$.
  Conversely, if $a in C_P$, the rule
  $ q_P \( z \) mapsto chevron.l z \, a chevron.r $
  is a well-defined linear functional on $q_P \( bb(F)_p^P \)$. Extend a basis of this subspace to a basis of $V$, and extend the functional linearly to obtain $omega in Omega$. Then $X_omega \|_P = a$, proving surjectivity. No continuity condition is lost in this extension, since $V$ is discrete.
  The map $"res"_P$ is a continuous homomorphism of compact groups onto the finite group $C_P$. Its pushforward of Haar probability is translation-invariant and hence uniform on $C_P$. As $\| C_P \| = p^(k_i)$, formula (16) follows. ◻
]

#prodef([Remark 4.5.])[
  Lemma 12 specifies each individual copy marginal. It makes no independence assertion about patterns on different copies. The exact intersection (15), which uses simultaneous containment of all relevant overlaps in one ball, is what guarantees these marginals despite the relations imposed on every translated copy.
]

== 5 An operator with a uniform spectral gap <sec:spectrum>

We use the data of Proposition 7 and the module constructed above. In particular, the induced intrinsic balls supplied by Lemma 6 have radius at most $sigma \( P \) \/ 16$, are trees, and contain fewer than $eta \| P \|$ vertices. All copies below retain their indices, and $\| P \| = n_i$ for a copy of type $i$.

=== 5.1 The reduced algebra and its evaluation representations <the-reduced-algebra-and-its-evaluation-representations>

The action of $Gamma$ on the compact dual $Omega$ of $V$ is

$ \( g omega \) \( v \) = omega \( g^(- 1) v \) . $

Write $alpha_g \( f \) \( omega \) = f \( g^(- 1) omega \)$ for the corresponding action on $C \( Omega \)$. Fourier transformation on the discrete abelian group $V$ identifies $C_r^(*) \( V \)$ with $C \( Omega \)$. The regular representation of the semidirect product, or equivalently regular induction followed by this Fourier transformation, gives

#[#set math.equation(numbering: n => "(17)")
 $ C_r^(*) \( G_(upright("sur")) \) = C_r^(*) \( V times.r Gamma \) tilde.equiv C \( Omega \) times.r_(alpha \, r) Gamma . $ <eq:semidirect-fourier>]

We use this identification throughout, and write $u_g$ for the canonical unitary corresponding to $g in Gamma$. Thus $u_g f u_g^(*) = alpha_g \( f \)$.

For $omega in Omega$, the regular representation induced by evaluation at $omega$ acts on $ell^2 \( Gamma \)$. After inverting the usual group index, its formulas are

#[#set math.equation(numbering: n => "(18)")
 $ \( pi_omega \( f \) xi \) \( h \) & = f \( h^(- 1) omega \) xi \( h \) \, #h(2em) f in C \( Omega \) \,\
\( pi_omega \( u_g \) xi \) \( h \) & = xi \( h g \) \, #h(2em) g in Gamma . $ <eq:regular-evaluations>]

The direct sum of all evaluations is a faithful representation of $C \( Omega \)$; inducing it regularly shows that $xor.big_(omega in Omega) pi_omega$ is faithful for the reduced crossed product. In particular, the norm of an element of (17) is the supremum of its norms in this family.

Let $tau_(G_(upright("sur")))$ denote the canonical trace, normalized by $tau_(G_(upright("sur"))) \( 1 \) = 1$. For every $b in C_r^(*) \( G_(upright("sur")) \)$,

#[#set math.equation(numbering: n => "(19)")
 $ tau_(G_(upright("sur"))) \( b \) = integral_Omega chevron.l pi_omega \( b \) delta_1 \, delta_1 chevron.r thin upright(d) m_Omega \( omega \) . $ <eq:trace-integral>]

Indeed, for a finite crossed-product sum $b = sum_g F_g u_g$ the diagonal coefficient at $1$ is $F_1 \( omega \)$, and its Haar integral is the canonical group trace under Fourier transformation. Such sums are dense. The diagonal coefficients converge uniformly under norm approximation, so the identity extends to every $b$. This also proves that the integrand in (19) is continuous.

For $s in S^(plus.minus 1)$, let $f_s in C \( Omega \)$ be the clopen-set projection

$ f_s \( omega \) = upright(bold(1))_({ s in cal(J) \( omega \( v_(*) \) \) }) . $

Define

#[#set math.equation(numbering: n => "(20)")
 $ T = d I - sum_(s in S^(plus.minus 1)) f_s u_s f_(s^(- 1)) quad in C_r^(*) \( G_(upright("sur")) \) . $ <eq:operator>]

This element is self-adjoint, since taking adjoints interchanges the terms indexed by $s$ and $s^(- 1)$. Each $f_s$ is a function of a single finite-valued coordinate and hence is a finite Fourier sum of characters of $Omega$ indexed by elements of $V$. Thus the construction takes place in the ordinary reduced group $C^(*)$-algebra in (17).

#prodef([Definition 5.1.])[
  For $omega in Omega$, its #emph[enabled graph] $G_omega$ has vertex set $Gamma$. At $h in Gamma$ the allowed outgoing labels are $cal(J) \( X_omega \( h \) \)$. The Cayley edge from $h$ to $h s$ is enabled precisely when $s$ is allowed at $h$ and $s^(- 1)$ is allowed at $h s$. A copy $P$ is #emph[valid for $omega$] if $X_omega \|_P = w_P$. Let $U_omega$ be the complement in $Gamma$ of the union of all valid copies.
]

The graph $G_omega$ is undirected and simple, and all its degrees are at most $d$, because the decoder returns either a $d$-element set or the empty set. Since

$ \( h^(- 1) omega \) \( v_(*) \) = omega \( h v_(*) \) = X_omega \( h \) \, $

the formulas (18) give

#[#set math.equation(numbering: n => "(21)")
 $ pi_omega \( T \) = d I - "Adj" \( G_omega \) . $ <eq:enabled-operator>]

The degree bound implies $parallel "Adj" \( G_omega \) parallel lt.eq d$, so this operator is bounded, positive, and at most $2 d I$.

On a valid copy $P$, the allowed port sets are exactly $J_P \( h \)$. All copy edges are therefore enabled, and their $d$ incidences at each vertex exhaust its allowed labels. As $P$ is connected, it is a whole isolated component of $G_omega$, with precisely its copy edges. Moreover, distinct valid copies are disjoint. To see this, two valid copies meeting at a vertex would both be the entire same component. If their indices were distinct, root $hat(X)$ at a shared group vertex. Their centers would both have distance one from the root, so Lemma 6 would place their entire common vertex set in an intrinsic ball of the first copy containing fewer than $eta \| P \| < \| P \|$ vertices, a contradiction. It follows also that no enabled edge joins $U_omega$ to its complement.

=== 5.2 Deficits on invalid copies and on arbitrary finite sets <deficits-on-invalid-copies-and-on-arbitrary-finite-sets>

For $B subset.eq P$, let $e_(omega \, P) \( B \)$ be the number of enabled copy edges with both endpoints in $B$.

#thm([Lemma 5.2.])[
  (Deficit inside an invalid copy).  #emph[If $P$ is invalid for $omega$, then every subset $B subset.eq P$ satisfies 
#[#set math.equation(numbering: n => "(22)")
 $ d \| B \| - 2 e_(omega \, P) \( B \) gt.eq c \| B \| . $ <eq:local-deficit>]

]
] <lem:local-deficit>

#proof[
  Write $n = \| P \|$, and let $M = { h in P : X_omega \( h \) eq.not w_P \( h \) }$. By Lemma 12, the restriction $X_omega \|_P$ belongs to $C_P$, and $w_P in C_P$ by Lemma 9. Their difference is nonzero, since $P$ is invalid. The primal-distance bound therefore gives $\| M \| > eta n$.
  At a vertex of $M$, the decoder returns either the empty set or a $d$-element set different from the prescribed $J_P \( h \)$. In either case at least one prescribed incidence is missing. Consequently, writing $b = \| B \|$, we have both
  $ d b - 2 e_(omega \, P) \( B \) gt.eq \| M ∩ B \| quad upright("and") quad d b - 2 e_(omega \, P) \( B \) gt.eq \| partial_P B \| . $
  If $n - b gt.eq eta n \/ 2$, then $min \( b \, n - b \) gt.eq \( eta \/ 2 \) b$. The edge-expansion bound in Proposition 7 yields
  $ \| partial_P B \| gt.eq kappa min \( b \, n - b \) gt.eq \( eta kappa \/ 2 \) b gt.eq c b . $
  Otherwise,
  $ \| M ∩ B \| gt.eq \| M \| - \( n - b \) > eta n \/ 2 gt.eq \( eta \/ 2 \) b gt.eq c b . $
  Here we used $c = \( eta \/ 2 \) min \( kappa \, 1 \)$. The assertion for $B = diameter$ is included. ◻
]

#thm([Lemma 5.3.])[
  (Deficit on the remaining graph).  #emph[For every $omega in Omega$ and every finite set $Y subset.eq U_omega$, let $A$ be the graph on $Y$ consisting of all its internal enabled edges. Then 
#[#set math.equation(numbering: n => "(23)")
 $ d \| Y \| - 2 \| E \( A \) \| gt.eq \( c \/ 2 \) \| Y \| . $ <eq:global-deficit>]

]
] <lem:global-deficit>

#proof[
  The local deficits cannot simply be added over copies, since their vertices and edges can overlap. Instead, we bound the cycle rank $b_1 \( A \) = dim Z_1 \( A \; bb(F)_2 \)$. Euler’s identity
  $ \| E \( A \) \| = \| Y \| - \# pi_0 \( A \) + b_1 \( A \) $
  holds also for isolated vertices and the empty graph. It shows that the desired deficit follows from
  $ b_1 \( A \) lt.eq #scale(x: 120%, y: 120%)[\(] d \/ 2 - 1 - c \/ 4 #scale(x: 120%, y: 120%)[\)] \| Y \| . $
  We will obtain this bound by charging the ranks of successive copy coordinates to pairwise disjoint subsets of $Y$.
  #emph[Eliminating cycle coordinates.] We regard the finite-dimensional space $cal(L) = Z_1 \( A \; bb(F)_2 \)$ as a subspace of $Z_1 \( X \; bb(F)_2 \)$. Lemma 8 provides the algebraic direct-sum decomposition
  $ Z_1 \( X \; bb(F)_2 \) = xor.big_P Z_1 \( P \; bb(F)_2 \) \, $
  with coordinate maps $"pr"_P$. These are the coordinates in the algebraic decomposition, not restrictions of edge chains to $P$: a projected cycle can contain edges absent from the original cycle. Only finitely many coordinates can be nonzero on $cal(L)$: choose a finite basis of $cal(L)$ and take the union of its finite coordinate supports. Call these copies $P_1 \, dots.h \, P_N$, ordered by nonincreasing distance of their centers from a fixed group-vertex root $R$ in $hat(X)$. Ties may be resolved arbitrarily.
  For $1 lt.eq j lt.eq N + 1$, set
  $ cal(L)_j = { z in cal(L) : "pr"_(P_i) z = 0 upright(" for ") i < j } . $
  Then $cal(L)_1 = cal(L)$, $cal(L)_(N + 1) = 0$, and rank-nullity gives
  #[#set math.equation(numbering: n => "(24)")
   $ dim cal(L) = sum_(j = 1)^N dim "pr"_(P_j) \( cal(L)_j \) . $ <eq:cycle-elimination>]
  If $cal(L) = 0$, this is understood as an empty sum.
  #emph[Localizing projected cycles.] Fix a step $j$, put $P = P_j$, and choose the induced intrinsic tree ball $B_P$ given by Lemma 6 for this root. It contains every vertex of $P$ shared with any of the other remaining copies $P_(j + 1) \, dots.h \, P_N$. Let
  $ D_P = B_P union \( A ∩ P \) \, $
  where $A ∩ P$ has vertex set $Y ∩ P$ and the edges common to $A$ and $P$. We claim that
  #[#set math.equation(numbering: n => "(25)")
   $ "pr"_P \( cal(L)_j \) subset.eq Z_1 \( D_P \; bb(F)_2 \) . $ <eq:projected-cycle-support>]
  Indeed, let an edge $e$ occur with nonzero coefficient in $"pr"_P z$ for $z in cal(L)_j$. If $e$ does not belong to $A$, its coefficient must cancel with a coefficient from another remaining copy, because the total chain $z$ is supported in $A$. Both endpoints of $e$ are consequently shared with that copy and lie in $B_P$. As the ball is induced in $P$, the edge $e$ itself lies in $B_P$. All other edges of $"pr"_P z$ lie in $A ∩ P$. The projection is already a cycle in $P$, so the claimed inclusion follows. In particular,
  #[#set math.equation(numbering: n => "(26)")
   $ dim "pr"_P \( cal(L)_j \) lt.eq b_1 \( D_P \) . $ <eq:projected-cycle-rank>]
  Figure 1 summarizes the bookkeeping in the next step. The projected cycle may acquire edges in the overlap tree, but its other edges remain enabled edges on $Y$. The tree can contribute to a cycle only through multiple attachments of an exterior component.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.5303, -0.5303), (0.5303, 0.5303), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_P$]]], frame: "circle", fill: rgb("#ebebff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4, 0.8), [#box(width: 3.5cm, height: 1.8cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff2e6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C_1$]]])])
  content((4, -1.3), [#box(width: 3cm, height: 1.4cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff2e6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C_2$]]])])
  bezier((0, 0), (4, 0.8), (1.461, 0.6295), (2.409, 0.8192), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.951, 0.6433), [#text(size: 9pt)[attachments]], anchor: "south", padding: 0.1176cm)
  bezier((0, 0), (4, 0.8), (1.59, 0.03637), (2.518, 0.2218), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (4, -1.3), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -1.65), [#box(width: 3.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[overlap tree#linebreak()contracted schematically]]])])
  content((4, -2.6), [#box(width: 4.535cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[exterior vertices#linebreak()charged only to $P$]]])])
  content((0, 1.6), [#box(width: 3.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[all remaining copies#linebreak()meet $P$ inside $B_P$]]])])
})],
    caption: [Figure 1: The graph $D_P = B_P union \( A ∩ P \)$ used to bound a projected cycle coordinate. The tree $B_P$ is shown as a single region, and $C_1 \, C_2$ represent components after deleting its vertices. Multiple attachments contribute $l_C - 1$ to the cycle rank, where $l_C$ is the number of attachment edges of $C$. Large girth separates their exterior endpoints. Only vertices outside $B_P$ are charged to $P$, so the charges for successively eliminated copies are disjoint. The drawing is schematic and specifies no distances. ],
  ) <fig:cycle-charging>
  #emph[Bounding exterior cycles and attachments.] If $P$ is valid, $Y ∩ P = diameter$, so $D_P = B_P$ is a tree and the right side is zero. Suppose from now on that $P$ is invalid, and write $sigma = sigma \( P \)$ and $r$ for the radius of $B_P$. Thus $r lt.eq sigma \/ 16$ and $sigma > max \( 16 \, 20 \/ c \)$.
  Consider the connected components $C$ of the graph obtained from $D_P$ by deleting the vertices of $B_P$. Their vertex sets partition $\( Y ∩ P \) \\ B_P$. Let $l_C$ be the number of edges joining $C$ to $B_P$. Since $B_P$ is a connected tree, the Euler characteristic formula for graph cycle rank gives
  #[#set math.equation(numbering: n => "(27)")
   $ b_1 \( D_P \) = sum_C #scale(x: 120%, y: 120%)[\(] b_1 \( C \) + max \( 0 \, l_C - 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:tree-attachment-rank>]
  This formula includes components with no attachment: such a component contributes only its own cycle rank.
  All edges of $C$ are enabled copy edges, and all enabled copy edges between its vertices occur in $C$, by the definition of $A$. If $C$ is cyclic, it has at least $sigma$ vertices. Applying Lemma 15 to its vertex set and using connectedness, we obtain
  #[#set math.equation(numbering: n => "(28)")
   $ b_1 \( C \) & = \| E \( C \) \| - \| C \| + 1\
 & lt.eq #scale(x: 120%, y: 120%)[\(] d \/ 2 - 1 - c \/ 2 + 1 \/ sigma #scale(x: 120%, y: 120%)[\)] \| C \| . $ <eq:exterior-cycle-rank>]
  The same bound holds for an acyclic $C$, because then $b_1 \( C \) = 0$ and the displayed coefficient is positive. Here $d gt.eq 3$ and $0 < c lt.eq eta \/ 2 = 1 \/ 200$.
  We next bound the extra rank caused by attachments to the tree. Choose two distinct attachment edges, and denote their endpoints in $C$ by $v \, v'$ and their endpoints in $B_P$ by $b \, b'$. A shortest path in $C$ from $v$ to $v'$, these two edges, and the tree path from $b'$ to $b$ form a simple cycle in $P$. This remains true if one pair of endpoints agrees, using the corresponding path of length zero; both pairs cannot agree because $P$ is simple. The tree path has length at most $2 r$, since both its endpoints lie in the intrinsic ball of radius $r$. Girth therefore gives
  #[#set math.equation(numbering: n => "(29)")
   $ "dist"_C \( v \, v' \) gt.eq sigma - 2 r - 2 > sigma \/ 2 . $ <eq:attachment-separation>]
  In particular, all the attachment endpoints in $C$ are distinct.
  If $l_C gt.eq 2$, the intrinsic balls in $C$ of radius $floor.l sigma \/ 4 floor.r$ centered at these endpoints are pairwise disjoint, by (29). Each contains at least $floor.l sigma \/ 4 floor.r + 1 > sigma \/ 4$ vertices: take an initial segment of a shortest path to any other attachment endpoint. Thus
  #[#set math.equation(numbering: n => "(30)")
   $ max \( 0 \, l_C - 1 \) lt.eq \( 4 \/ sigma \) \| C \| . $ <eq:attachment-packing>]
  For $l_C = 0$ or $1$ the same inequality is immediate.
  Combining (27), (28), and (30), and using $5 \/ sigma < c \/ 4$, yields
  #[#set math.equation(numbering: n => "(31)")
   $ b_1 \( D_P \) & lt.eq #scale(x: 120%, y: 120%)[\(] d \/ 2 - 1 - c \/ 2 + 5 \/ sigma #scale(x: 120%, y: 120%)[\)] \| \( Y ∩ P \) \\ B_P \|\
 & lt.eq #scale(x: 120%, y: 120%)[\(] d \/ 2 - 1 - c \/ 4 #scale(x: 120%, y: 120%)[\)] \| \( Y ∩ P \) \\ B_P \| . $ <eq:exterior-rank-bound>]
  As observed above, this last bound holds also for a valid copy, since both sides then vanish.
  #emph[Summing over disjoint vertex sets.] The exterior sets charged in (31) are pairwise disjoint. Indeed, if $j < k$, the center of $P_k$ is no farther from $R$ than the center of $P_j$. Lemma 6 therefore implies
  $ P_j ∩ P_k subset.eq B_(P_j) . $
  Consequently $\( Y ∩ P_j \) \\ B_(P_j)$ misses all of $P_k$, including its charged exterior. The non-strict distance comparison also covers ties in the elimination order.
  Summing (26) and (31) in (24) now gives
  $ dim Z_1 \( A \; bb(F)_2 \) lt.eq #scale(x: 120%, y: 120%)[\(] d \/ 2 - 1 - c \/ 4 #scale(x: 120%, y: 120%)[\)] \| Y \| . $
  The coefficient is positive, so this statement also follows from the empty sum when $cal(L) = 0$. Substituting this bound into Euler’s identity proves (23). ◻
]

=== 5.3 The spectral gap and its projection <the-spectral-gap-and-its-projection>

The passage from finite-set expansion to a spectral estimate belongs to the discrete Cheeger tradition #cite(label("Dodziuk1984")) #cite(label("AlonMilman1985")). We give the coarea and Cauchy–Schwarz calculation to account for the vertex potential $d - deg_omega \( x \)$ and the unnormalized Laplacian used here.

#thm([Lemma 5.4.])[
  (Uniform spectral gap).  #emph[For every $omega in Omega$, the restriction of $pi_omega \( T \)$ to $ell^2 \( U_omega \)$ satisfies 
#[#set math.equation(numbering: n => "(32)")
 $ pi_omega \( T \) \|_(ell^2 \( U_omega \)) gt.eq frac(c^2, 8 d) I . $ <eq:remaining-spectral-bound>]

 Put 
$ epsilon = min { rho \, c^2 \/ \( 8 d \) } > 0 . $

 Then 
#[#set math.equation(numbering: n => "(33)")
 $ "spec" \( pi_omega \( T \) \) subset.eq { 0 } union \[ epsilon \, 2 d \] \, $ <eq:uniform-spectrum>]

 and its kernel is exactly the Hilbert-space direct sum of the one-dimensional spaces of constants on the valid copies.]
] <lem:spectral-gap>

#proof[
  On $U_omega$ write $deg_omega \( x \)$ for the enabled degree and put $q \( x \) = d - deg_omega \( x \) gt.eq 0$. There are no enabled edges to the removed set. Thus, for finitely supported complex $xi$ on $U_omega$,
  #[#set math.equation(numbering: n => "(34)")
   $ cal(E) \( xi \) := chevron.l pi_omega \( T \) xi \, xi chevron.r = sum_({ x \, y } in E \( G_omega \|_(U_omega) \)) \| xi \( x \) - xi \( y \) \|^2 + sum_(x in U_omega) q \( x \) \| xi \( x \) \|^2 . $ <eq:remaining-energy>]
  All edge sums in the rest of this proof are over enabled unoriented edges on $U_omega$. For a finite set $F subset.eq U_omega$, its deficit is exactly
  $ d \| F \| - 2 \| E \( G_omega \|_F \) \| = \| partial_(G_omega \|_(U_omega)) F \| + sum_(x in F) q \( x \) . $
  Set $s \( x \) = \| xi \( x \) \|$. Apply Lemma 16 to the finite level sets ${ x : s \( x \)^2 > t }$ and integrate in $t gt.eq 0$. The layer-cake identity gives
  $ \( c \/ 2 \) parallel xi parallel^2 lt.eq sum_({ x \, y }) \| s \( x \)^2 - s \( y \)^2 \| + sum_x q \( x \) s \( x \)^2 . $
  Cauchy–Schwarz, applied together to the edge terms and the vertex-potential terms, then gives
  $ \( c \/ 2 \) parallel xi parallel^2 & lt.eq (sum_({ x \, y }) \| s \( x \) - s \( y \) \|^2 + sum_x q \( x \) s \( x \)^2)^(1 \/ 2) (sum_({ x \, y }) \( s \( x \) + s \( y \) \)^2 + sum_x q \( x \) s \( x \)^2)^(1 \/ 2)\
 & lt.eq cal(E) \( xi \)^(1 \/ 2) sqrt(2 d) thin parallel xi parallel . $
  For the first factor we used $\| \| xi \( x \) \| - \| xi \( y \) \| \| lt.eq \| xi \( x \) - xi \( y \) \|$. For the second we used
  $ sum_({ x \, y }) \( s \( x \) + s \( y \) \)^2 + sum_x q \( x \) s \( x \)^2 lt.eq sum_x #scale(x: 120%, y: 120%)[\(] 2 deg_omega \( x \) + q \( x \) #scale(x: 120%, y: 120%)[\)] s \( x \)^2 lt.eq 2 d parallel xi parallel^2 . $
  If $xi eq.not 0$, division and squaring prove $cal(E) \( xi \) gt.eq \( c^2 \/ \( 8 d \) \) parallel xi parallel^2$; the zero vector satisfies the same inequality. Finite-support vectors are dense and the operator is bounded, so (32) holds on all of $ell^2 \( U_omega \)$. If $U_omega$ is empty, this assertion is vacuous.
  On each valid copy $P$ of type $i$, the operator is its graph Laplacian $d I - "Adj" \( P \)$. Its kernel consists of constants, and on the orthogonal complement of constants it is at least $rho I$, by Proposition 7. The valid copies are disjoint isolated components. Decomposing $ell^2 \( Gamma \)$ into their component spaces and $ell^2 \( U_omega \)$ therefore shows that the full kernel is exactly
  $ xor.big_(P upright(" valid for ") omega) bb(C) upright(bold(1))_P \, $
  and that the operator is at least $epsilon I$ on its orthogonal complement. These conclusions remain true for infinitely many valid components, because both lower bounds are uniform. The earlier bound $pi_omega \( T \) lt.eq 2 d I$ proves (33). ◻
]

#thm([Proposition 5.5.])[
  (A projection in the reduced group algebra).  #emph[There exists a projection $b_0 in C_r^(*) \( G_(upright("sur")) \)$ such that, for every $omega in Omega$, $pi_omega \( b_0 \)$ is the orthogonal projection onto $ker pi_omega \( T \)$. Explicitly, it is projection onto constants on each valid copy and is zero on $ell^2 \( U_omega \)$. In particular, 
#[#set math.equation(numbering: n => "(35)")
 $ chevron.l pi_omega \( b_0 \) delta_1 \, delta_1 chevron.r = cases(delim: "{", 1 \/ n_i \, & upright("if ") 1 upright(" belongs to a valid copy of type ") i \,, 0 \, & upright("if ") 1 in U_omega .) $ <eq:projection-diagonal>]

 The valid copy in the first case is unique.]
] <prop:projection>

#proof[
  Take the faithful direct sum of the representations $pi_omega$. Lemma 17 gives the same positive constant $epsilon$ in every summand, so its spectrum is contained in the closed set ${ 0 } union \[ epsilon \, 2 d \]$. Faithfulness preserves the spectrum of the self-adjoint element $T$; hence
  $ "spec"_(C_r^(*) \( G_(upright("sur")) \)) \( T \) subset.eq { 0 } union \[ epsilon \, 2 d \] . $
  Choose a continuous real-valued function $chi$ on $\[ 0 \, 2 d \]$ with $chi \( 0 \) = 1$ and $chi = 0$ on $\[ epsilon \, 2 d \]$, and set $b_0 = chi \( T \)$ by continuous functional calculus. Since $chi^2 = chi$ on the spectrum, $b_0$ is a projection in $C_r^(*) \( G_(upright("sur")) \)$. This uses the ordinary C\*-algebra functional calculus, with no passage to a von Neumann algebra.
  Functional calculus commutes with each $pi_omega$. The kernel description in Lemma 17 thus identifies $pi_omega \( b_0 \)$ as claimed, also when there are no valid copies or infinitely many of them. The normalized constant vector on a valid copy of type $i$ is $n_i^(- 1 \/ 2) upright(bold(1))_P$, so the diagonal of its rank-one projection at any vertex of $P$ is $1 \/ n_i$. At vertices of $U_omega$ the diagonal is zero. Disjointness of the valid copies proves uniqueness and (35). ◻
]

== 6 An irrational trace and failure of assembly <sec:trace>

We now compute the trace of the projection constructed in Proposition 18.

#thm([Proposition 6.1.])[
  #emph[The projection $b_0 in C_r^(*) \( G_(upright("sur")) \)$ satisfies 
#[#set math.equation(numbering: n => "(36)")
 $ tau_(G_(upright("sur"))) \( b_0 \) = sum_(i gt.eq 1) p^(- k_i) in.not bb(Q) . $ <eq:irrational-trace>]

]
] <prop:irrational-trace>

#proof[
  For a fixed $omega$, the diagonal entry of $pi_omega \( b_0 \)$ at the identity is zero unless that vertex belongs to a valid copy. If it does, the copy is unique and has some type $i$; projection onto the constants on that component has diagonal entry $1 \/ n_i$.
  Exactly $n_i$ indexed copies of type $i$ contain the identity. Indeed, their translating elements are precisely $g = phi.alt_i \( v \)^(- 1)$ for the $n_i$ distinct embedded vertices $v in "Vert" \( Theta_i \)$. Lemma 3 ensures that these indices give distinct copies. By Lemma 12, each is valid on an event of Haar measure $p^(- k_i)$. Validity events for copies containing the identity are mutually exclusive, including across types. The trace formula (19) and nonnegative countable summation therefore give
  $ tau_(G_(upright("sur"))) \( b_0 \) = sum_(i gt.eq 1) n_i 1 / n_i p^(- k_i) = sum_(i gt.eq 1) p^(- k_i) . $
  No independence of these events is needed.
  Since $p > 2$ and the positive integers $k_i$ strictly increase, this number lies in $\[ 0 \, 1 \)$ and has base-$p$ digits equal to one exactly at positions $k_i$, and zero elsewhere. There is no eventually $\( p - 1 \)$ expansion ambiguity. The digits contain infinitely many ones, but their successive gaps tend to infinity by Proposition 7(iv). They cannot be eventually periodic. Rational numbers have eventually periodic base-$p$ expansions, so (36) is irrational. ◻
]

#proof[
  The module construction gives a finitely generated discrete group $G_(upright("sur"))$, and Proposition 18 gives an actual projection $b_0 in C_r^(*) \( G_(upright("sur")) \)$. Its trace is positive and irrational by Proposition 19; in particular its integral $K_0$-class is nonzero. Every class in the image of the proper-action assembly map has rational trace by Theorem 2. Thus $\[ b_0 \]$ is outside that image.
  The algebra $C \( Omega \) times.r_r Gamma$ was used to represent $C_r^(*) \( V times.r Gamma \)$ and to analyze the operator. The assembly map just obstructed is the coefficient-free reduced map for $G_(upright("sur"))$ itself, with the full proper classifying space. Its failure of surjectivity in degree zero refutes the universal Baum–Connes assertion. ◻
]

The obstruction persists after rationalization. Extend the canonical trace to $K_0 \( C_r^(*) \( G_(upright("sur")) \) \) ⊗_(bb(Z)) bb(Q)$ by $x ⊗ q mapsto q tau_(G_(upright("sur")) *) \( x \)$. Every element in the image of $mu_0^(G_(upright("sur"))) ⊗_(bb(Z)) "id"_(bb(Q))$ has rational trace, since it is a finite rational linear combination of assembly classes. The trace of $\[ b_0 \] ⊗ 1$ remains irrational, so this class is outside the image of rationalized assembly as well.

0pt


#bibliography("refs.bib", style: "ieee", title: [References])
