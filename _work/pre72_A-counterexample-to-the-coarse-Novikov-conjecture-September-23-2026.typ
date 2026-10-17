#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to the coarse Novikov conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

Coarse index theory relates the large-scale geometry of a space to the K-theory of an algebra of controlled operators. Its assembly map sends geometric K-homology classes to their analytic indices. The injectivity question asks whether that index retains the information in a class after one has passed to large scales. Roe developed this viewpoint and its Novikov-type formulation #cite(label("Roe93")); Higson and Roe clarified the role of bounded geometry and coarsened K-homology #cite(label("HR95")). Here we construct a bounded-geometry space for which ordinary reduced coarse assembly loses a class of infinite order.

A metric space $X$ is uniformly discrete if distinct points have distance bounded below by a positive constant. It has bounded geometry if, for every $R < oo$, the cardinalities of its radius-$R$ balls have a common finite bound. For such a space, let $P_r \( X \)$ be the Rips complex: its simplices are the finite subsets of $X$ of diameter at most $r$. We use locally finite analytic K-homology and its coarsening,

$ K_i^(upright("lf")) \( Y \) = "KK"_i \( C_0 \( Y \) \, bb(C) \) \, #h(2em) K X_i \( X \) = "inj lim"_(r arrow.r oo) K_i^(upright("lf")) \( P_r \( X \) \) . $

Here and throughout, $i$ is taken modulo two. The reduced, locally compact Roe algebra $C^(*) \( X \)$ is the operator-norm closure of the locally compact finite-propagation operators on $ell^2 \( X \) ⊗ cal(H)_0$, where $cal(H)_0$ is an infinite-dimensional separable Hilbert space. Section 2 specifies these conventions and the ordinary coarse assembly map

$ mu_X : K X_i \( X \) arrow.r K_i \( C^(*) \( X \) \) . $

The coarse Baum–Connes conjecture asks whether this map is an isomorphism #cite(label("HR95")) Conjecture 6.6. The rational coarse Novikov assertion is that $mu_X ⊗ upright("id")_(bb(Q))$ is injective. Passing through all Rips scales is essential: a cycle at one scale can bound at a larger scale and therefore represent zero in $K X_(*)$. An obstruction to injectivity must survive every such coarsening while its analytic index vanishes.

Yu proved coarse assembly isomorphism for bounded-geometry spaces of finite asymptotic dimension #cite(label("Yu98")) Theorem 7.1, and subsequently for those admitting a coarse embedding into Hilbert space #cite(label("Yu00")). Skandalis, Tu and Yu placed the latter result in a groupoid framework #cite(label("STY02")). Further positive injectivity results include coarse embeddings into uniformly convex Banach spaces #cite(label("KY06")) Theorem 1.1 and fibred coarse embeddings into Hilbert space #cite(label("FS14")) Theorem 34. These theorems impose geometric hypotheses beyond bounded geometry. Our result shows that bounded geometry alone does not suffice.

We prove the following integral statement.

#thm([Theorem 1.1.])[
  #emph[There is a uniformly discrete bounded-geometry metric space $X$, which is a coarse disjoint union of finite connected graphs of uniformly bounded degree, and an infinite-order element $alpha in K X_1 \( X \)$ such that 
$ mu_X \( alpha \) = 0 quad upright("in ") K_1 \( C^(*) \( X \) \) . $

 Consequently, ordinary coarse assembly for $X$ fails to be injective both integrally and after tensoring its domain and target with $bb(Q)$.]
] <thm:main>

=== Predecessors and the scope of the obstruction <predecessors-and-the-scope-of-the-obstruction>

Yu already constructed a non-bounded-geometry example with a nontrivial coarse K-homology class of zero index, using spheres of increasing dimension and size #cite(label("Yu98")) Section 8, Proposition 8.1. Dranishnikov, Ferry and Weinberger constructed integral noninjectivity examples for a map from locally finite K-homology to Roe-algebra K-theory, also allowing spaces without bounded geometry #cite(label("DFW")) Introduction, pp. 920–921. Their Remark 6.2 distinguishes those examples from the Rips-coarsened formulation: the relevant classes die under coarsening. Theorem 1 retains bounded geometry and detects its class in the actual direct limit.

Higson, Lafforgue and Skandalis constructed injectivity and surjectivity obstructions for several groupoid assembly maps #cite(label("HLS")). Their Hausdorff groupoid example in Section 5 combines a degree-one Bott class with a Kazhdan projection to produce a kernel class. This is a close methodological antecedent of the winding and constant-vector averaging used here. Their coarse-space construction in Section 6 instead establishes non-surjectivity for specific congruence expander unions #cite(label("HLS")) Section 6, Proposition 11. These conclusions must be separated: a groupoid kernel example does not itself provide the bounded-geometry space and ordinary Rips-domain kernel in Theorem 1.

Expander phenomena also coexist with injectivity. Willett and Yu proved ordinary coarse injectivity for coarse disjoint unions of finite graphs whose girth tends to infinity; with an additional weak-expansion hypothesis, surjectivity fails #cite(label("WY12I")) Theorem 1.5. The fibers in our construction have short cycles, so persistent boundary winding does not imply that large-girth hypothesis. More recent isomorphism results for certain relative expanders likewise depend on specific embedding hypotheses for the kernel and quotient families #cite(label("DWY23")) Theorem 1.1. The organization of our vertices into finite fibers does not assert such an embedding or a finite-group extension. Throughout, our target is the reduced, locally compact Roe algebra; maximal completions and coefficient-free group assembly are different questions. The independent companion article #cite(label("OpenAITorsionFreeBC2026")) Theorem 1.1 concerns group assembly, which for a torsion-free group maps the compactly supported K-homology of its classifying space to the K-theory of its reduced group algebra. It constructs a finitely generated torsion-free group for which this coefficient-free map is not rationally injective.

=== How the construction works <how-the-construction-works>

Begin with finite discs $D_j$ of radii $j$ in the triangular lattice, and let $C_j$ be their boundary cycles. Above each vertex of $D_j$ place a finite congruence quotient of $"SL"_3 \( bb(Z) \)$. The quotient is trivial on $C_j$ and grows with depth inside the disc. Cayley edges connect vertices within a fiber; reduction maps and twisted matchings connect neighboring fibers. The resulting finite graph is denoted by $X_j$. Thus $C_j$ is also a cycle in $X_j$.

Let $B$, $D$ and $X$ be the separated unions of the $C_j$, $D_j$ and $X_j$, respectively. The family of oriented boundary classes gives an element of $K_1^(upright("lf")) \( P_1 \( B \) \)$, and its image defines $alpha in K X_1 \( X \)$. Two features of the fibers have different roles.

First, the twisting prevents short loops in $X_j$ from winding around the center once $j$ is sufficiently large. At any prescribed Rips scale this produces an integral cocycle whose restriction to $C_j$ has winding one. The associated K-theory pairing detects every nonzero integer multiple of $alpha$ at that scale. Sections 3 and 4 prove that $alpha$ has infinite order in the direct limit.

Second, property (T) uniformly approximates the projections onto constant vectors in all the finite fibers. Averaging into those vectors defines an isometry $V : ell^2 \( D \) ⊗ cal(H)_0 arrow.r ell^2 \( X \) ⊗ cal(H)_0$. The right translations used for twisting fix the constant vectors, so they do not interfere with this averaging. Section 5 proves that conjugation by $V$ maps $C^(*) \( D \)$ into $C^(*) \( X \)$, despite the unbounded sizes of the fibers. On the boundary fibers this isometry is the ordinary inclusion. Since the boundary classes bound the filled discs, naturality of assembly then gives $mu_X \( alpha \) = 0$ in Section 6.

The transfer argument isolates a useful principle: uniform finite-propagation approximation of constant-fiber projections, together with controlled operators between adjacent fibers, can produce a Roe-algebra homomorphism without a corresponding coarse map. This principle accounts for the difference between the persistent winding in $X$ and the vanishing of its index through $D$.

Section 2 fixes the analytic K-homology, Rips metrics, and index naturality used by both branches. Section 3 constructs the common graph family and its short-loop estimate. Section 4 then proves persistence, independently of averaging. Section 5 proves the operator transfer, and Section 6 combines its exact boundary restriction with the filled-disc argument to annihilate the same class.

== 2 Coarse assembly and locally finite classes <sec:conventions>

We collect the functorial facts needed to carry a family of boundary classes through the construction. All spaces below are proper metric spaces, and all maps used to push forward locally finite K-homology are continuous and proper. A map between discrete metric spaces is #emph[coarse] if it is proper and bornologous: for every $R$ there is $S$ such that points at distance at most $R$ have images at distance at most $S$.

=== 2.1 Rips complexes and their coarse structure <rips-complexes-and-their-coarse-structure>

For a uniformly discrete bounded-geometry space $Y$, the complex $P_r \( Y \)$ is locally finite and has uniformly bounded dimension at each fixed $r$. We use its usual simplicial topology. A concrete proper metric compatible with that topology and its coarse structure is convenient when the complex has disconnected components. Regard a point as a finitely supported probability measure on $Y$ whose support has diameter at most $r$, and use the transportation metric

#[#set math.equation(numbering: n => "(1)")
 $ d_r \( nu \, eta \) = inf_pi sum_(x \, y in Y) d_Y \( x \, y \) pi \( x \, y \) \, $ <eq:wasserstein>]

where $pi$ ranges over the couplings of $nu$ and $eta$. On each finite subcomplex this metric gives the usual topology, equivalently the topology from spherical simplices. The inclusion $y mapsto delta_y$ is isometric, and every point is within distance $r$ of every vertex in its support. Moreover, a closed ball about $delta_y$ of radius $R$ has all its supports in the finite set $B_Y \( y \, R + r \)$. Indeed, for $x \, z in "supp" \( nu \)$, $d_Y \( y \, x \) lt.eq d_Y \( y \, z \) + r$; averaging over $z$ gives $d_Y \( y \, x \) lt.eq d_r \( delta_y \, nu \) + r$. The closed ball is a closed subset of a finite subcomplex and is compact. Local finiteness gives the asserted topology globally.

In particular, choosing a support vertex gives a coarse inverse to the vertex inclusion. Distances between chosen support vertices and between the corresponding points differ by at most $2 r$. Thus (1) realizes the usual coarse structure determined by supports; it also supplies finite distances between disconnected simplicial components.

===== 2.1.1 Comparison with spherical metrics. <comparison-with-spherical-metrics.>

One can compare this metric directly with the standard semi-spherical extension: allow paths in spherical simplices, normalized to have edge length one, and jumps between vertices of cost $d_Y$. Write $d_(upright("ss"))$ for the infimum of their lengths. At fixed $r$, simplex dimensions have a common bound. On each simplex, the transportation distance is bounded by a constant depending only on $r$ times its spherical distance; this follows by comparing barycentric coordinates in the bounded dimensions and using $d_r lt.eq \( r \/ 2 \) lr(bar.v.double nu - eta bar.v.double)_1$. The same inequality, with constant one, holds for vertex jumps. Conversely, one may travel to a support vertex, make one vertex jump, and travel to the endpoint. Thus, for a finite constant $c_r$,

$ d_r lt.eq c_r d_(upright("ss")) \, #h(2em) d_(upright("ss")) lt.eq d_r + 2 . $

The second inequality uses that the minimum distance between the two supports is at most $d_r$. The inequalities give the same coarse structure; the finite-subcomplex argument above gives the usual simplicial topology. These choices give the standard Rips coarsening and Roe-algebra identifications #cite(label("WY")) Definition 7.2.8, Proposition 7.2.11 and Theorem 7.2.16. The inclusions for increasing $r$ are continuous proper coarse maps. A proper Lipschitz map of vertex spaces induces the corresponding proper simplicial maps of Rips complexes. The support-vertex selections are used for the Roe-algebra K-theory identifications; locally finite K-homology is pushed forward by the continuous proper simplicial maps. The selector compositions before and after an inclusion differ by a bounded distance, since their values lie in the same bounded support. This also applies to a proper Lipschitz map of vertex spaces, with the bound given by the diameter of its image support. Thus the Roe K-theory identifications respect these maps and the passage to larger scales.

=== 2.2 Roe algebras and naturality <roe-algebras-and-naturality>

On an ample module over a proper metric space, an operator is locally compact if multiplication on either side by any function in $C_0$ makes it compact. Its propagation is at most $R$ if its matrix coefficients between sets at distance greater than $R$ vanish. For a discrete bounded-geometry space $Y$ on $ell^2 \( Y \) ⊗ cal(H)_0$, a finite-propagation operator is locally compact exactly when each of its matrix entries in $cal(B) \( cal(H)_0 \)$ is compact. Indeed, the propagation bound leaves only finitely many nonzero entries in each row and column; finite-support functions give compact products, and $C_0 \( Y \)$ follows by uniform approximation.

The locally finite analytic index at each Rips scale takes values in the Roe algebra of that complex. Coarse equivalence with the vertex space identifies its K-theory with $K_(*) \( C^(*) \( Y \) \)$. The compatible indices define $mu_Y$. We use the usual reduced Roe index and its naturality #cite(label("WY")) Sections 5.1 and 6.7, Lemma 7.1.3 and Theorem 7.2.16, with the corrected localization comparison in the authors’ errata #cite(label("WYerrata")) items 30–31. All spaces used in this application are nonempty, and their ample modules may be chosen with infinite multiplicity. In particular, for a proper Lipschitz inclusion $f : Y arrow.r Z$ and its covering isometry $F \( delta_y ⊗ v \) = delta_(f \( y \)) ⊗ v$,

#[#set math.equation(numbering: n => "(2)")
 $ mu_Z compose f_(*) = \( "Ad" F \)_(*) compose mu_Y . $ <eq:naturality>]

On vertex Roe algebras $"Ad" F$ is an actual homomorphism; the induced map on K-theory is independent of the covering choices. All the maps to which we apply (2) will be inclusions of this form.

=== 2.3 Families and winding pairings <families-and-winding-pairings>

For a countable topological disjoint union of second-countable locally compact spaces $Y_j$, all the algebras $C_0 \( Y_j \)$ and their countable direct sum are separable. Countable additivity in the first variable of $"KK"$ #cite(label("Blackadar")) Theorem 19.7.1 and Section 19.8.10 gives

#[#set math.equation(numbering: n => "(3)")
 $ K_i^(upright("lf")) (product.co_j Y_j) = "KK"_i (xor.big_j C_0 \( Y_j \) \, bb(C)) tilde.equiv product_j K_i^(upright("lf")) \( Y_j \) . $ <eq:additivity>]

This is an integral product. Restriction to a clopen union of components is the corresponding coordinate projection, induced contravariantly by extension by zero on $C_0$.

For an oriented circle $C$, choose its analytic fundamental class $\[ C \]$ so that its index pairing with a unitary of winding one is $1$. The circle index formula then reads

#[#set math.equation(numbering: n => "(4)")
 $ chevron.l \[ f \] \, \[ C \] chevron.r = deg \( f \) \, #h(2em) f : C arrow.r S^1 . $ <eq:winding>]

This fixes the otherwise harmless sign convention for the Dirac or Toeplitz description of the class #cite(label("Khalkhali")) Example 4.2.4. An integral simplicial $1$-cocycle on a finite complex $Y$ determines a class in $H^1 \( Y \; bb(Z) \)$, represented by a map $f : Y arrow.r S^1$, and hence a unitary class $\[ f \] in K_1 \( C \( Y \) \)$. For an included oriented circle, naturality of the index pairing identifies its pairing with the sum of the cocycle around that circle #cite(label("Blackadar")) Proposition 18.7.1 and Corollary 18.10.3. One can see the representing map directly: map vertices to $1$, traverse each edge with the assigned integer winding, and extend over triangles because their winding sums vanish. Higher extensions exist since $pi_k \( S^1 \) = 0$ for $k gt.eq 2$.

== 3 Finite discs with congruence fibers <sec:geometry>

We construct finite graphs $X_j$ containing distinguished boundary cycles $C_j$. The goal of this section is a uniform statement about short loops: at any fixed length bound, loops sufficiently far out in the family have zero signed crossing count for a fixed ray from the center of the underlying disc. This count agrees with winding whenever the projected loop avoids the center.

=== 3.1 Congruence quotients and a separated holonomy <congruence-quotients-and-a-separated-holonomy>

We need a quotient tower with uniformly bounded successive kernels, so that lifting base edges preserves bounded degree. We will also choose compatible twists whose trace separation rules out nonzero crossing count on short closed paths in sufficiently late graphs $X_j$. The choice of $"SL"_3 \( bb(Z) \)$ supplies both this quotient tower and the uniform averaging estimates used in Section 5.

Let $Gamma = "SL"_3 \( bb(Z) \)$ and let $S$ be the finite symmetric generating set of elementary matrices $I plus.minus E_(a b)$, $a eq.not b$. To see that these generate, apply the Euclidean algorithm by determinant-one row operations to the primitive first column of an integral determinant-one matrix, then to its remaining $2$-by-$2$ block. Each integral elementary operation is a power of a member of $S$. Put

$ Q_0 = { 1 } \, #h(2em) Q_k = "SL"_3 \( bb(Z) \/ 2^k bb(Z) \) quad \( k gt.eq 1 \) \, $

with their reduction maps. All reductions from $Gamma$, and between successive $Q_k$, are surjective. Indeed, over $bb(Z) \/ 2^k bb(Z)$ an invertible matrix has a unit in its first column. Elementary row operations move it to the first position and clear the remaining entries. Continuing reduces the matrix to a diagonal one. The identity

$ mat(delim: "(", 0, u; - u^(- 1), 0) = mat(delim: "(", 1, u; 0, 1) mat(delim: "(", 1, 0; - u^(- 1), 1) mat(delim: "(", 1, u; 0, 1) $

expresses the needed determinant-one row interchanges and diagonal matrices by elementary matrices. Every elementary matrix over the quotient lifts to an integral one, itself generated by $S$. There is a uniform bound

#[#set math.equation(numbering: n => "(5)")
 $ h := 2^9 med gt.eq med \| ker \( Q_(k + 1) arrow.r Q_k \) \| quad \( k gt.eq 0 \) . $ <eq:kernelbound>]

For $k gt.eq 1$, a kernel element has the form $I + 2^k A$ modulo $2^(k + 1)$ and is specified by the nine binary entries of $A$; the same bound holds for $Q_1$.

Choose a $2$-adic unit $t in 1 + 2 bb(Z)_2$ transcendental over $bb(Q)$. Such a choice exists because $1 + 2 bb(Z)_2$ is uncountable and the algebraic elements over $bb(Q)$ are countable. For every nonzero integer $m$,

#[#set math.equation(numbering: n => "(6)")
 $ t^m + t^(- m) + 1 in.not bb(Z) . $ <eq:transcendentaltrace>]

Otherwise multiplying the alleged equality by $t^(\| \| m)$ gives a nonzero polynomial over $bb(Z)$ satisfied by $t$. Define

$ g_k = "diag" \( t \, t^(- 1) \, 1 \) med \( mod med 2^k \) in Q_k quad \( k gt.eq 1 \) \, #h(2em) g_0 = 1 . $

These elements are compatible with reduction.

#thm([Lemma 3.1.])[
  (Trace separation).  #emph[For each integer $A gt.eq 1$ there is an integer $N \( A \) gt.eq 1$ such that, whenever $ell gt.eq N \( A \)$, $0 < \| \| m lt.eq A$, and $w in Gamma$ has word length at most $A$ with respect to $S$, 
$ "tr" \( g_ell^m \) eq.not "tr" \( w \) med \( mod med 2^ell \) . $

]
] <lem:trace>

#proof[
  There are only finitely many pairs $\( m \, w \)$ in question. Each difference $t^m + t^(- m) + 1 - "tr" \( w \)$ is a nonzero $2$-adic integer by (6). Choose $N \( A \)$ greater than all their $2$-adic valuations. ◻
]

=== 3.2 The base discs and the lifted edges <the-base-discs-and-the-lifted-edges>

Use the triangular lattice with coordinates $\( a \, b \) in bb(Z)^2$ and neighbor differences

$ plus.minus \( 1 \, 0 \) \, quad plus.minus \( 0 \, 1 \) \, quad plus.minus \( 1 \, - 1 \) . $

Embed its two coordinate axes at angle $pi \/ 3$. Set

$ rho \( a \, b \) = max { \| \| a \, \| \| b \, \| a + b \| } . $

For $j gt.eq 2$, let $D_j$ be the finite induced graph on $rho lt.eq j$, equipped with its graph metric. Its elementary triangles fill a closed topological disc. The boundary $C_j$, given by $rho = j$, is a cycle of length $6 j$; we equip its vertex set with its own cycle metric. When used as a topological circle, $C_j$ denotes the geometric realization of this cycle. The depth of a vertex $u in D_j$ is

$ k_j \( u \) = j - rho \( u \) . $

Depths of neighboring vertices differ by at most one.

Fix a ray from the origin meeting no other lattice vertex. For an oriented lattice edge $\( u \, v \)$ not incident to the origin, let $a \( u \, v \) in { - 1 \, 0 \, 1 }$ be its signed intersection with this ray. Set $a \( u \, v \) = 0$ for edges incident to the origin. Choose the sign so that the positively oriented boundary has total charge one. Then $a \( v \, u \) = - a \( u \, v \)$, and the sum of $a$ on any closed edge path avoiding the origin equals its winding number.

The vertices of $X_j$ are

$ { \( u \, q \) : u in D_j \, med q in Q_(k_j \( u \)) } . $

Put undirected edges of length one as follows; repeated edges and loops may be discarded.

+ Within the fiber over $u$, join $q$ to $s q$ for every $s in S$.
+ If $\( u \, v \)$ is an oriented base edge with equal depth $k$, join $\( u \, q \)$ to $\( v \, q g_k^(a \( u \, v \)) \)$.
+ If $\( u \, v \)$ goes from depth $k + 1$ to depth $k$, join $\( u \, q \)$ to $\( v \, macron(q) g_k^(a \( u \, v \)) \)$, where $macron(q)$ denotes reduction. The reverse direction uses the inverse edge relation.

Left Cayley multiplication and right holonomy commute. This choice of sides will allow a short closed path to yield a conjugacy relation in a single quotient.

Each $X_j$ is connected: the fibers are connected Cayley graphs, and every base edge has nonempty relations to both endpoint fibers. Each vertex has degree at most

#[#set math.equation(numbering: n => "(7)")
 $ Delta = \| \| S + 6 h . $ <eq:degree>]

Indeed, a base neighbor gives a bijection, a single parent, or at most $h$ children. Boundary fibers are trivial, so the cycle $C_j$ includes in $X_j$ by $u mapsto \( u \, 1 \)$. Figure 1 shows the depth labels and the two types of inter-fiber edge relation.

These graphs do have uniformly short cycles. In a fiber of depth $k gt.eq 1$, the commuting generators $A = I + E_12$ and $B = I + E_13$ give the four distinct vertices $q \, A q \, B A q \, B q$ of a Cayley square. Thus the short-loop statement below concerns their charge, not the absence of short cycles.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0.77, 0), (0.385, 0.6668), (-0.385, 0.6668), (-0.77, 9.43e-17), (-0.385, -0.6668), (0.385, -0.6668), close: true, stroke: (paint: rgb("#acacac"), thickness: 0.4pt))
  line((1.54, 0), (0.77, 1.334), (-0.77, 1.334), (-1.54, 1.886e-16), (-0.77, -1.334), (0.77, -1.334), close: true, stroke: (paint: rgb("#acacac"), thickness: 0.4pt))
  line((2.31, 0), (1.155, 2.001), (-1.155, 2.001), (-2.31, 2.829e-16), (-1.155, -2.001), (1.155, -2.001), close: true, stroke: (paint: rgb("#acacac"), thickness: 0.4pt))
  line((0, 0), (2.31, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt))
  line((0, 0), (1.155, 2.001), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt))
  line((0, 0), (-1.155, 2.001), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt))
  line((0, 0), (-2.31, 2.829e-16), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt))
  line((0, 0), (-1.155, -2.001), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt))
  line((0, 0), (1.155, -2.001), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt))
  line((2.31, 0), (1.155, 2.001), (-1.155, 2.001), (-2.31, 2.829e-16), (-1.155, -2.001), (1.155, -2.001), close: true, stroke: (paint: rgb("#00008c"), thickness: 0.4pt))
  line((0, 0), (2.657, 0.915), stroke: (thickness: 0.4pt, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((2.657, 0.915), [#text(size: 9pt)[cut]], anchor: "west")
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$Q_3$]], anchor: "north-east")
  circle((-0.385, 0.6668), radius: 0.07056, fill: black, stroke: none)
  content((-0.385, 0.6668), [#text(size: 9pt)[$Q_2$]], anchor: "south-east")
  circle((-0.77, 1.334), radius: 0.07056, fill: black, stroke: none)
  content((-0.77, 1.334), [#text(size: 9pt)[$Q_1$]], anchor: "south-east")
  circle((-1.155, 2.001), radius: 0.07056, fill: black, stroke: none)
  content((-1.155, 2.001), [#text(size: 9pt)[$Q_0$]], anchor: "south-east")
  content((0, -2.349), [#text(fill: rgb("#00008c"))[#text(size: 9pt)[$C_j$: singleton fibers]]])
  content((4.543, 2.195), [#text(size: 9pt)[equal depth $k$]])
  circle((3.619, 1.155), radius: 0.07056, fill: black, stroke: none)
  circle((5.467, 1.155), radius: 0.07056, fill: black, stroke: none)
  line((3.696, 1.155), (5.39, 1.155), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt), mark: (end: (symbol: ">>", fill: rgb("#a0a0a0"))))
  circle((3.619, 1.502), radius: 0.07056, fill: black, stroke: none)
  circle((5.467, 1.502), radius: 0.07056, fill: black, stroke: none)
  line((3.696, 1.502), (5.39, 1.502), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt), mark: (end: (symbol: ">>", fill: rgb("#a0a0a0"))))
  circle((3.619, 1.848), radius: 0.07056, fill: black, stroke: none)
  circle((5.467, 1.848), radius: 0.07056, fill: black, stroke: none)
  line((3.696, 1.848), (5.39, 1.848), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt), mark: (end: (symbol: ">>", fill: rgb("#a0a0a0"))))
  content((4.543, 0.77), [#text(size: 9pt)[$q arrow.r.long.bar "qg"_k^a$]])
  content((3.619, -0.1925), [#text(size: 9pt)[$Q_k$]])
  content((5.467, -0.1925), [#text(size: 9pt)[$Q_(k+1)$]])
  circle((3.619, -0.924), radius: 0.07056, fill: black, stroke: none)
  circle((5.467, -0.539), radius: 0.07056, fill: black, stroke: none)
  line((3.696, -0.924), (5.39, -0.539), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt))
  circle((5.467, -0.924), radius: 0.07056, fill: black, stroke: none)
  line((3.696, -0.924), (5.39, -0.924), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt))
  circle((5.467, -1.309), radius: 0.07056, fill: black, stroke: none)
  line((3.696, -0.924), (5.39, -1.309), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt))
  content((4.543, -1.617), [#text(size: 9pt)[$macron(z) ="qg"_k^a$]])
  content((4.543, -2.156), [#text(size: 9pt)[within a fiber: $q arrow.l.r.long "sq"$]])
})],
  caption: [Figure 1: The base disc and its fibers, shown schematically for $j = 3$. The shell at depth $k$ carries $Q_k$; the boundary carries $Q_0 = { 1 }$. Crossing the dashed ray applies right multiplication by $g_k^(a \( u \, v \))$, with reduction to the shallower level when the depths differ. The center has depth $j$. The insets show selected inter-fiber edges: a twisted matching at equal depth and a shallow vertex with its deep children. In each inset, $a = a \( u \, v \)$ for the base edge oriented from the left-hand fiber to the right-hand fiber. The number of drawn vertices is schematic, not the quotient cardinality. ],
) <fig:disc>

=== 3.3 Separated unions and their boundary maps <separated-unions-and-their-boundary-maps>

Choose $b_j in C_j$. In each of the three unions

$ B = product.co_(j gt.eq 2) C_j \, #h(2em) D = product.co_(j gt.eq 2) D_j \, #h(2em) X = product.co_(j gt.eq 2) X_j \, $

join the chosen basepoints of successive components by an auxiliary edge of length $M_j = 100 + j^2$; in $X_j$ use $\( b_j \, 1 \)$. Use the induced path distance on the original vertex sets, without adding vertices along these auxiliary edges. Inside each component this is its original graph or cycle metric: leaving a component cannot provide a shortcut back into it. The distances between distinct components tend to infinity outside a finite family, so these are coarse disjoint unions.

The spaces are uniformly discrete and proper, and have bounded geometry. To check the last assertion directly, the weighted graph has degree at most $Delta + 2$ and every edge has length at least one. Hence a ball of radius $R$ has at most $sum_(m = 0)^(floor.l R floor.r) \( Delta + 2 \)^m$ vertices. The same argument applies to $B$ and $D$ with their smaller degree bounds. There are proper $1$-Lipschitz inclusions

#[#set math.equation(numbering: n => "(8)")
 $ e : B arrow.r D \, quad u mapsto u \, #h(2em) i : B arrow.r X \, quad u mapsto \( u \, 1 \) . $ <eq:boundarymaps>]

Every path in $B$ maps to a path of the same length, including the auxiliary links. Properness follows from injectivity and finiteness of bounded subsets in the target. The use of the intrinsic cycle metric on $B$ ensures these Lipschitz assertions.

For later use, at every fixed distance bound $R$ only finitely many pairs $\( u \, v \) in D times D$ from different components satisfy $d_D \( u \, v \) lt.eq R$. Such a path must cross a link of length at most $R$. There are only finitely many such links, and both endpoints of the pair lie within distance $R$ of their endpoints. Those balls are finite.

=== 3.4 Short loops have zero charge far out <short-loops-have-zero-charge-far-out>

For an edge path in $X_j$, define its charge to be the sum of $a \( u \, v \)$ on its projected base steps; fiber steps contribute zero. Charges are additive under concatenation and change sign under reversal.

#thm([Lemma 3.2.])[
  (Small-loop lemma).  #emph[For each integer $A gt.eq 1$ there is $J \( A \)$ such that, for all $j gt.eq J \( A \)$, every closed edge path in $X_j$ of length at most $A$ has charge zero. One may take $J \( A \) = max { 2 \, N \( A \) + floor.l A \/ 2 floor.r }$, with $N \( A \)$ from Lemma 2.]
] <lem:smallloops>

#proof[
  Consider a closed path of length $n lt.eq A$ and projected vertices in $D_j$. Suppose its charge $m$ is nonzero. We first show that every projected vertex $u$ satisfies $rho \( u \) lt.eq floor.l n \/ 2 floor.r$. If not, choose a linear functional $f in { plus.minus a \, plus.minus b \, plus.minus \( a + b \) }$ attaining $rho \( u \)$. Every other vertex is reachable from $u$ along a shorter arc of the closed path of length at most $floor.l n \/ 2 floor.r$. Since $f$ changes by at most one in each step, including the stationary projections of fiber steps, the entire polygon lies in the open half-plane $f > 0$. This argument applies to each occurrence of a vertex, so repeated vertices and edges cause no change. The polygon is contractible in that half-plane, avoids the origin, and has winding zero, contradicting its charge. In particular, the same argument covers paths whose projection initially might have met the origin: the supposed vertex outside the bound would force the whole projection to avoid it.
  Let $ell$ be the minimum depth along the path. The preceding bound gives $ell gt.eq j - floor.l A \/ 2 floor.r$. Reduce every fiber coordinate along the path to $Q_ell$. A fiber step becomes left multiplication by an element of $S$. An oriented base step becomes right multiplication by $g_ell^(a \( u \, v \))$. This is immediate in the equal-depth and deep-to-shallow cases. In the reverse case the defining edge relation says $q_(upright("shallow")) = macron(q)_(upright("deep")) g_k^(- a)$, so that $macron(q)_(upright("deep")) = q_(upright("shallow")) g_k^a$, as required.
  Commuting left and right multiplications and using closure of the path, we obtain
  $ w z g_ell^m = z $
  for its starting coordinate $z in Q_ell$ and a word $w$ of length at most $A$ in $S$. Consequently $g_ell^m = z^(- 1) w^(- 1) z$ and $"tr" \( g_ell^m \) = "tr" \( w^(- 1) \)$ modulo $2^ell$. Here $0 < \| \| m lt.eq A$. If $j gt.eq J \( A \)$, then $ell gt.eq N \( A \)$ and this contradicts Lemma 2 applied to $w^(- 1)$. ◻
]

The qualification “$j$ sufficiently large” is part of the conclusion. It is precisely what is needed for a test at each fixed Rips scale; no single short-loop bound is asserted simultaneously for all components.

== 4 An infinite-order coarse K-homology class <sec:persistence>

The small-loop lemma converts winding on the base lattice into an integral cocycle on each sufficiently late Rips component. We use this cocycle to test the same boundary family at every scale.

All links between components of $B$ have length greater than one, and each $C_j$ has length $6 j gt.eq 12$. Thus $P_1 \( B \)$ is exactly the topological disjoint union of the circles $C_j$. By (3), their positively oriented analytic classes determine

$ beta_1 = \( \[ C_j \] \)_(j gt.eq 2) in K_1^(upright("lf")) \( P_1 \( B \) \) . $

Let $beta in K X_1 \( B \)$ be its direct-limit image. For each integer $r gt.eq 1$, let $i_r : P_1 \( B \) arrow.r P_r \( X \)$ be the map induced by the boundary inclusion, and put

$ alpha_r = \( i_r \)_(*) beta_1 \, #h(2em) alpha = i_(*) beta in K X_1 \( X \) . $

The classes $alpha_r$ represent one and the same element $alpha$.

#thm([Proposition 4.1.])[
  #emph[For every integer $r gt.eq 1$ there is a homomorphism 
$ lambda_r : K_1^(upright("lf")) \( P_r \( X \) \) arrow.r bb(Z) quad upright("such that") quad lambda_r \( alpha_r \) = 1 . $

 Consequently, every nonzero integer multiple of $alpha$ is nonzero in $K X_1 \( X \)$.]
] <prop:persistence>

#proof[
  Choose $j$ sufficiently large that $j gt.eq J \( 3 r \)$ and that both auxiliary links adjacent to $X_j$ have length greater than $r$. Then $Y = P_r \( X_j \)$ is a finite clopen component of $P_r \( X \)$.
  For an oriented edge $\( x \, y \)$ of $Y$, choose an edge path in $X_j$ from $x$ to $y$ of length at most $r$, and let $b_r \( x \, y \)$ be its charge. Two choices differ by a closed path of length at most $2 r$, so Lemma 3 makes this integer independent of the choice. Reversing a path gives $b_r \( y \, x \) = - b_r \( x \, y \)$. Around any Rips triangle, the three chosen paths form a closed path of length at most $3 r$, again with zero charge. Therefore $b_r$ is an integral simplicial $1$-cocycle on $Y$.
  On each unit boundary edge of $C_j$ we may choose that edge itself. Hence the sum of $b_r$ around the positively oriented $C_j$ is one. By the construction in Section 2, there is a map $f_r : Y arrow.r S^1$ whose unitary class pairs with the included boundary as
  $ chevron.l \[ f_r \] \, \( C_j arrow.r.hook Y \)_(*) \[ C_j \] chevron.r = 1 . $
  Define $lambda_r$ by restriction of locally finite K-homology to the clopen component $Y$, followed by this index pairing. Restriction of $alpha_r$ is exactly the included $j$th boundary class. Indeed, $i_r^(- 1) \( Y \) = C_j$, and pullback along $i_r$ carries extension by zero from $C \( Y \)$ to extension by zero from $C \( C_j \)$, after restriction to $C_j$. Applying the contravariant first variable of $"KK"$ gives the claimed coordinate projection in (3), regardless of connections among the other Rips components. This proves the displayed claim. Equivalently, one may extend $f_r$ by $1$ outside $Y$ to obtain a unitary in the unitization of $C_0 \( P_r \( X \) \)$; it is a compactly supported K-theory test for the locally finite class.
  For any integer $n eq.not 0$, we have $lambda_r \( n alpha_r \) = n eq.not 0$ at every integer scale $r gt.eq 1$. If $n alpha$ vanished in the direct limit, its representative $n alpha_1$ would vanish at some later scale, and then at some integer scale. This contradicts the pairing. Integer scales are cofinal, so the conclusion holds in $K X_1 \( X \)$. ◻
]

The component and the compactly supported test may change with $r$. The argument requires one test at each scale, and does not assert a single test persisting at all scales. We have proved that $alpha$ has infinite order integrally. Since the kernel of $A arrow.r A ⊗_(bb(Z)) bb(Q)$ is the torsion subgroup for any abelian group $A$, it follows that

#[#set math.equation(numbering: n => "(9)")
 $ alpha ⊗ 1 eq.not 0 quad upright("in ") K X_1 \( X \) ⊗_(bb(Z)) bb(Q) . $ <eq:rationalnonzero>]

No product in (3) has been rationalized separately.

== 5 Averaging defines a Roe-algebra homomorphism <sec:transfer>

We now prove the analytic input for vanishing. Averaging over each fiber will embed the module of the filled base discs into the module of $X$. The main point is to show that the resulting spatial homomorphism takes values in the locally compact Roe algebra, uniformly over growing fibers.

=== 5.1 A general transfer criterion <a-general-transfer-criterion>

The following criterion separates that operator argument from the particular congruence construction. Propagation of an operator between two fiber subspaces is measured using the ambient metric of $X$.

#thm([Proposition 5.1.])[
  (Transfer through finite fibers).  #emph[Let $D$ and $X$ be countable uniformly discrete bounded-geometry spaces. Suppose $X = product.co_(u in D) F_u$ is a partition into nonempty finite sets. Write $xi_u = \| F_u \|^(- 1 \/ 2) sum_(x in F_u) delta_x$ and let $P$ be the orthogonal projection on $ell^2 \( X \)$ onto the span of the $xi_u$. Assume:]
  + #emph[$P$ is an operator-norm limit of finite-propagation contractions $P_n$ on $ell^2 \( X \)$;]
  + #emph[for every $R < oo$ there is $s_R < oo$ such that, whenever $d_D \( u \, v \) lt.eq R$, there is a contraction $O_(u v) : ell^2 \( F_v \) arrow.r ell^2 \( F_u \)$ of propagation at most $s_R$ with $O_(u v) xi_v = xi_u$.]
  #emph[For the isometry 
$ V : ell^2 \( D \) ⊗ cal(H)_0 arrow.r ell^2 \( X \) ⊗ cal(H)_0 \, #h(2em) V \( delta_u ⊗ h \) = xi_u ⊗ h \, $

 conjugation defines a $*$-homomorphism $"Ad" V : C^(*) \( D \) arrow.r C^(*) \( X \)$ between the reduced, locally compact Roe algebras.]
] <prop:transfer>

#proof[
  The empty case is immediate, so assume $D$ is nonempty. We first lift the supported blocks of an operator by a finite decomposition into matchings. Sandwiching this lift between the constant-fiber projections gives the desired conjugate, and the approximants to those projections place it in the Roe algebra.
  Let $T in cal(B) \( ell^2 \( D \) ⊗ cal(H)_0 \)$ be locally compact and of propagation at most $R$. Its entries $T_(u v)$ are compact operators on $cal(H)_0$. Set $b_R = sup_u \| B_D \( u \, R \) \|$. The bipartite support graph of these entries has degree at most $b_R$, so its edges partition into at most $N_R = 2 b_R - 1$ matchings. For completeness, enumerate the edges and color them greedily with $2 b_R - 1$ colors: at most $2 \( b_R - 1 \)$ already colored edges meet the endpoints of the next edge. A matching has no repeated row or column.
  For each matching form the block operator with entries $O_(u v) ⊗ T_(u v)$. Orthogonality of both its source and target blocks gives norm at most $sup_(u \, v) lr(bar.v.double T_(u v) bar.v.double) lt.eq lr(bar.v.double  bar.v.double) T$. Summing the finitely many matching operators gives a bounded operator $A_T$ with
  #[#set math.equation(numbering: n => "(10)")
   $ lr(bar.v.double A_T bar.v.double) lt.eq N_R lr(bar.v.double  bar.v.double) T \, #h(2em) "prop" \( A_T \) lt.eq s_R . $ <eq:matchingnorm>]
  Its vertex-level entries are scalar multiples of compact operators, so finite propagation implies local compactness.
  Put $hat(P) = P ⊗ 1_(cal(H)_0)$ and $hat(P)_n = P_n ⊗ 1_(cal(H)_0)$. Compression of the $\( u \, v \)$ block gives
  $ p_u O_(u v) p_v = \| xi_u chevron.r chevron.l xi_v \| \, #h(2em) hat(P) A_T hat(P) = V T V^(*) \, $
  where $p_u$ is the rank-one projection onto $xi_u$. Put $d_n = "prop" \( P_n \)$. For every $n$, $hat(P)_n A_T hat(P)_n$ has propagation at most $2 d_n + s_R$. Its $\( x \, y \)$ entry sums only over intermediate vertices $z in B_X \( x \, d_n \)$ and $w in B_X \( y \, d_n \)$. These sets are finite, and each summand is a scalar multiple of the compact entry $\( A_T \)_(z w)$. Thus the sandwich is locally compact and belongs to $C^(*) \( X \)$. Moreover,
  #[#set math.equation(numbering: n => "(11)")
   $ lr(bar.v.double hat(P)_n A_T hat(P)_n - V T V^(*) bar.v.double) lt.eq 2 lr(bar.v.double P_n - P bar.v.double) N_R lr(bar.v.double  bar.v.double) T arrow.r 0 . $ <eq:sandwich>]
  It follows that $V T V^(*) in C^(*) \( X \)$.
  Such $T$ are dense in $C^(*) \( D \)$, and conjugation by an isometry is norm continuous. Therefore its range is contained in $C^(*) \( X \)$ on the whole algebra. Finally $V^(*) V = 1$ proves multiplicativity and preservation of adjoints. The auxiliary choices in $A_T$ are used only to prove this range inclusion; they need not depend linearly on $T$. ◻
]

The amplified projection $hat(P)$ in this proof is a bounded operator, not a locally compact Roe-algebra element. Its diagonal compression at $x in F_u$ is $\| F_u \|^(- 1) 1_(cal(H)_0)$, which is not compact. The proof establishes local compactness for the sandwiches, where it is actually needed.

=== 5.2 Uniform approximation from property (T) <uniform-approximation-from-property-t>

Return to the finite fibers $F_u = { u } times Q_(k_j \( u \))$ of our graph $X$. Kazhdan introduced property (T) and proved its higher-rank and lattice instances #cite(label("Kazhdan")). For $"SL"_3 \( bb(Z) \)$ it provides a constant $kappa > 0$ for the fixed generating set $S$: in any unitary representation without invariant vectors, each unit vector is moved by at least $kappa$ by some $s in S$ #cite(label("BHV")) Proposition 1.3.2 and Example 1.7.4.

Let $lambda_k$ denote the left regular representation on $ell^2 \( Q_k \)$, and define

$ L_k = 1 - frac(1, \| \| S) sum_(s in S) lambda_k \( s \) . $

The sum retains multiplicities when elements of $S$ have the same image in $Q_k$. Since $S$ is symmetric, $0 lt.eq L_k lt.eq 2$. Its kernel consists exactly of the constants, since $S$ generates $Q_k$. On the orthogonal complement of the constants,

$ chevron.l L_k eta \, eta chevron.r = frac(1, 2 \| \| S) sum_(s in S) lr(bar.v.double lambda_k \( s \) eta - eta bar.v.double)^2 gt.eq delta lr(bar.v.double eta bar.v.double)^2 \, #h(2em) delta = frac(kappa^2, 2 \| \| S) > 0 . $

If $p_k$ denotes projection onto the normalized constant vector, it follows that

#[#set math.equation(numbering: n => "(12)")
 $ lr(bar.v.double \( 1 - L_k \/ 2 \)^n - p_k bar.v.double) lt.eq \( 1 - delta \/ 2 \)^n . $ <eq:gap>]

For $k = 0$ the approximation is exact. Take the direct sum of these lazy averaging powers over all fibers and call it $P_n$. They are contractions of propagation at most $n$, since each Cayley generator moves at most one edge in $X$. Equation (12) proves uniform norm convergence to the constant-fiber projection $P$. This verifies the first hypothesis of Proposition 5.

=== 5.3 Controlled operators between fibers <controlled-operators-between-fibers>

It remains to verify the second hypothesis. Equal-depth edges act by the permutation prescribed by their right holonomy. For an edge from a shallow vertex $u$ of depth $k$ to a deep vertex $v$ of depth $k + 1$, put $a = a \( u \, v \)$ and $h_k = \| ker \( Q_(k + 1) arrow.r Q_k \) \|$. The graph relation gives an isometry $J_a : ell^2 \( Q_k \) arrow.r ell^2 \( Q_(k + 1) \)$ and its adjoint:

#[#set math.equation(numbering: n => "(13)")
 $ J_a delta_q = h_k^(- 1 \/ 2) sum_(macron(z) = q g_k^a) delta_z \, #h(2em) J_a^(*) delta_z = h_k^(- 1 \/ 2) delta_(macron(z) g_k^(- a)) . $ <eq:childmap>]

Every coefficient lies on a graph edge, so these maps have propagation at most one. The child sets have the common cardinality $h_k$ and are disjoint; this proves the isometry assertion. Since $\| Q_(k + 1) \| = h_k \| Q_k \|$, both $J_a$ and its adjoint carry the normalized constant vectors to the corresponding normalized constants: each deep coefficient in the image under $J_a$ is $\( h_k \| Q_k \| \)^(- 1 \/ 2)$, and each shallow coefficient in the image under $J_a^(*)$ is $h_k \( h_k \| Q_(k + 1) \| \)^(- 1 \/ 2)$. These formulas also apply to the singleton quotient $Q_0$. The equal-depth permutations have the same property.

For $u \, v$ in the same base disc with $d_D \( u \, v \) lt.eq R$, choose a base path from $v$ to $u$ of length at most $floor.l R floor.r$. Composing the edge operators just described gives a contraction $O_(u v)$ of propagation at most $floor.l R floor.r$, with $O_(u v) xi_v = xi_u$. This includes $u = v$ by using the identity on its fiber.

For the cross-component pairs at distance at most $R$, use $O_(u v) = \| xi_u chevron.r chevron.l xi_v \|$. There are only finitely many such pairs by Section 3, and their fibers are finite. Consequently their propagations have a common finite bound. Combining this bound with $floor.l R floor.r$ supplies $s_R$ in Proposition 5. We conclude that

#[#set math.equation(numbering: n => "(14)")
 $ Phi = "Ad" V : C^(*) \( D \) arrow.r C^(*) \( X \) $ <eq:Phi>]

is a $*$-homomorphism. This conclusion is an operator-norm statement in the reduced Roe algebra. It does not require $V$ to cover a coarse map from $D$ to $X$.

== 6 The boundary index vanishes <sec:vanishing>

We finish by applying the transfer homomorphism to the boundary family constructed in Section 4. Only the actual boundary inclusions $e : B arrow.r D$ and $i : B arrow.r X$ use assembly naturality.

Let $W_j$ be the filled triangulated disc underlying the lattice graph $D_j$, and put $W = product.co_(j gt.eq 2) W_j$. Every elementary triangle has vertices at pairwise distance one, so there is a factorization by continuous proper maps

$ P_1 \( B \) = product.co_j C_j arrow.r W arrow.r P_1 \( D \) . $

The second map includes each elementary triangle as a Rips simplex. At scale one, no simplex of $P_1 \( D \)$ joins different $D_j$. A compact subset of this topological disjoint union therefore meets only finitely many of its finite components. Its inverse image in $W$ is a closed subset of finitely many compact discs, proving properness of the second map; the first map is proper for the same reason. Each $W_j$ is contractible; homotopy invariance in the first variable of $"KK"$ and $"KK"_1 \( bb(C) \, bb(C) \) = K_1 \( bb(C) \) = 0$ #cite(label("Blackadar")) Proposition 17.9.1 and Section 19.8.3 therefore give

$ K_1^(upright("lf")) \( W \) tilde.equiv product_j "KK"_1 \( C \( W_j \) \, bb(C) \) = product_j "KK"_1 \( bb(C) \, bb(C) \) = 0 . $

Thus the whole family $beta_1$ dies in $K_1^(upright("lf")) \( P_1 \( D \) \)$, and

#[#set math.equation(numbering: n => "(15)")
 $ e_(*) beta = 0 quad upright("in ") K X_1 \( D \) . $ <eq:filledzero>]

Write $cal(H)_Y = ell^2 \( Y \) ⊗ cal(H)_0$ for $Y = B \, D \, X$. The covering isometries $E : cal(H)_B arrow.r cal(H)_D$ and $I : cal(H)_B arrow.r cal(H)_X$ of $e$ and $i$ are

$ E \( delta_u ⊗ h \) = delta_u ⊗ h \, #h(2em) I \( delta_u ⊗ h \) = delta_(\( u \, 1 \)) ⊗ h quad \( u in B \) . $

Put $e_(upright("Roe")) = "Ad" E$ and $i_(upright("Roe")) = "Ad" I$. Because the boundary fibers are the singleton $Q_0$, the averaging isometry of Section 5 satisfies the exact identity

$ V E = I . $

It follows on the entire Roe algebra $C^(*) \( B \)$ that

#[#set math.equation(numbering: n => "(16)")
 $ Phi compose e_(upright("Roe")) = i_(upright("Roe")) . $ <eq:operatorfactor>]

The following diagram displays the naturality square for $e$ and its operator-algebra continuation. The lower composite equals $\( i_(upright("Roe")) \)_(*)$ by (16):

#cetz.canvas({
  import cetz.draw: *
  content((0, 1.3), [$"KX"_1(B)$])
  content((3.9, 1.3), [$"KX"_1(D)$])
  content((0, 0), [$K_1(C^*(B))$])
  content((3.9, 0), [$K_1(C^*(D))$])
  content((7.4, 0), [$K_1(C^*(X))$])
  line((0, 1.3), (3.9, 1.3), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  content((1.95, 1.3), [$e_*$], anchor: "south")
  line((0, 1.3), (0, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.65), [$mu_B$], anchor: "east")
  line((3.9, 1.3), (3.9, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  content((3.9, 0.65), [$mu_D$], anchor: "west")
  line((0, 0), (3.9, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  content((1.95, 0), [$(e_( upright("Roe") ))_*$], anchor: "north")
  line((3.9, 0), (7.4, 0), stroke: (thickness: 0.4pt), mark: (end: (symbol: ">>", fill: black)))
  content((5.65, 0), [$Phi_*$], anchor: "north")
})

Naturality for $i$, followed by (16), naturality for $e$, and (15), now gives

$ mu_X \( alpha \) & = \( i_(upright("Roe")) \)_(*) mu_B \( beta \)\
 & = Phi_(*) \( e_(upright("Roe")) \)_(*) mu_B \( beta \)\
 & = Phi_(*) mu_D \( e_(*) beta \) = 0 . $

The class here is exactly $alpha = i_(*) beta$ tested at every Rips scale in Proposition 4. That proposition makes it an infinite-order class, while (9) makes $alpha ⊗ 1$ nonzero in the rationalized domain. Its rational index is zero as well. This proves Theorem 1.


#bibliography("refs.bib", style: "ieee", title: [References])
