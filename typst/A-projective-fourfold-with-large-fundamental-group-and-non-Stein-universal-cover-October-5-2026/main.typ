#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[A-projective-fourfold-with-large-fundamental-group-and-non-Stein-universal-cover-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $X$ be a smooth connected projective complex variety, and let $tilde(X)$ denote its simply connected topological universal cover, equipped with the lifted complex structure. Shafarevich’s holomorphic-convexity conjecture asks whether $tilde(X)$ is holomorphically convex. Its particularly direct form for varieties with large fundamental group asks whether $tilde(X)$ is Stein when it contains no positive-dimensional compact complex analytic subvariety.

Recall that $X$ has #emph[large fundamental group] if, for every positive-dimensional closed irreducible subvariety $Z subset X$, the image of $pi_1 \( Z^nu \) arrow.r pi_1 \( X \)$ is infinite; here $Z^nu$ is the normalization. This is equivalent to the absence of positive-dimensional compact analytic subvarieties in $tilde(X)$. We prove the following.

#thm([Theorem 1.1.])[
  #emph[There exist a smooth connected projective complex fourfold $X$ and a simple abelian surface $A subset X$ such that]
  + #emph[$X$ has large fundamental group;]
  + #emph[$"im" #scale(x: 120%, y: 120%)[\(] pi_1 \( A \) arrow.r pi_1 \( X \) #scale(x: 120%, y: 120%)[\)] tilde.eq bb(Z)$.]
  #emph[The universal cover $tilde(X)$ contains no positive-dimensional compact complex analytic subvariety and is not Stein.]
] <thm:main>

The obstruction to Steinness is topological and occurs in a closed complex surface inside $tilde(X)$. Since $pi_1 \( A \) tilde.eq bb(Z)^4$, the kernel of the homomorphism in Theorem 1 has rank three. The corresponding cover of $A$ is therefore diffeomorphic to $bb(R) times \( S^1 \)^3$ and has nonzero third homology. A Stein surface has the homotopy type of a CW complex of real dimension at most two. This contradiction rules out Steinness of the lifted surface and hence of $tilde(X)$. Simplicity of $A$ ensures that this topological obstruction introduces no compact complex curve in that covering.

=== 1.1 Historical context <historical-context>

Shafarevich’s question extends the uniformization viewpoint for curves to universal covers of projective varieties. Kollár’s account #cite(label("Kollar1995")) Introduction, Section 0.3 explains both the holomorphic-convexity conjecture and its formulation for large fundamental groups. These formulations are related by Remmert reduction: a holomorphically convex complex manifold admits a proper holomorphic map to a Stein space with connected compact analytic fibers #cite(label("EKPR2012")) Introduction, p. 1546. If there are no positive-dimensional compact analytic subvarieties, all those fibers are points and the reduction is an isomorphism. Theorem 1 therefore also disproves the holomorphic-convexity conjecture.

An important development was the construction of almost-holomorphic reduction maps by Campana and Kollár #cite(label("Campana1994")) #cite(label("Kollar1993")) #cite(label("Kollar1995")). They describe, through a very general point, the normalized subvarieties whose fundamental groups have finite image in the ambient group. Their existence provides an algebraic and geometric description of the part of the variety that such subvarieties fill. Holomorphic convexity asks in addition for a proper holomorphic reduction of the universal cover to a Stein space. The large case makes this additional analytic requirement especially visible: the expected reduction has no positive-dimensional fibers.

Linearity of the fundamental group supports strong affirmative results. Katzarkov and Ramachandran proved holomorphic convexity for projective surfaces whose fundamental group admits a faithful complex representation with reductive Zariski closure #cite(label("KatzarkovRamachandran1998")). Eyssidieux treated the reductive linear case in arbitrary dimension #cite(label("Eyssidieux2004")). Eyssidieux, Katzarkov, Pantev, and Ramachandran proved the linear Shafarevich conjecture for smooth projective varieties #cite(label("EKPR2012")). More recently, Bakker, Brunebarbe, and Tsimerman developed linear Shafarevich theory for normal algebraic spaces and quasiprojective varieties #cite(label("BBT2024")). The construction here concerns the unrestricted fundamental group. Its infinite-order argument uses compatible local covers of an arrangement, so it does not require a faithful linear representation of that group.

A closely related line of inquiry appears in Bogomolov and Katzarkov’s constructions of projective surfaces and their potential counterexamples to the Shafarevich conjecture #cite(label("BogomolovKatzarkov1998")) Section 4. Their proposed obstruction uses infinite chains of compact curves and depends on group-infiniteness statements left conjectural there. Here the obstruction is a rank-three lattice cover of a simple abelian surface. The group-theoretic task is to prove that its cyclic image survives all global relations; the local path criterion supplies that infiniteness argument.

Several established tools make the construction possible. Arithmetic ball quotients supply arbitrarily large regions with exactly prescribed finite hyperplane configurations. Stover and Toledo’s virtual ramified-cover theorem supplies the required sign covers #cite(label("StoverToledo")) #cite(label("LlosaPy")), and Zarhin’s theorem supplies a genus-two curve with simple Jacobian #cite(label("Zarhin")). Standard hyperbolic geometry #cite(label("BridsonHaefliger")) underlies the local path criterion. Hamm–Lê’s quasi-projective Lefschetz theorem #cite(label("HammLe")), together with a deformation argument, allows us to retain a prescribed surface while passing from an orbifold to a smooth projective ambient variety. Each use is stated with its hypotheses at the relevant point below.

=== 1.2 The central construction <the-central-construction>

The principal task is to embed a simple abelian surface in a smooth projective variety so that its fundamental group has infinite cyclic image. Once such an embedding is available, an ample complete intersection in a product with a sufficiently large abelian variety gives Theorem 1. The complete intersection contains the prescribed surface, and its other fibers over the added abelian variety are finite. This separates the two reasons that a subvariety has infinite fundamental-group image: it either moves in the added abelian variety or lies in the simple surface. Section 2 proves this reduction first.

To obtain the cyclic image, we begin with a genus-two curve $C$ whose Jacobian is simple. Its presentation as a double cover of $bb(P)^1$ uses four branch points in one small disk and two outside that disk. We call the corresponding meridians red and blue. A complex hyperbolic arrangement realizes this marked line as an exceptional fiber. Extra hyperplanes meeting the red part of the pencil impose relations that identify all four red meridians. The sphere relation then identifies the two blue meridians. The image of the genus-two surface group is therefore cyclic: it lies in the cyclic subgroup generated by the product of the resulting red and blue involutions.

These relations alone give only an upper bound. The central difficulty is to prove that the cyclic image is infinite after all global identifications and fillings. We use covers defined separately on large local models of the arrangement. We model their monodromies using the infinite dihedral group generated by two involutions $r \, b$; its even words $\( r b \)^n$ carry the integer translation label $n$. These local monodromies need not define a representation of the full projective fundamental group. Instead, they agree on the endpoint tests needed to read short paths in overlapping charts. The graphs of these local covers are uniformly Gromov hyperbolic. A local path criterion then prevents a loop detected by one chart from becoming trivial through global relations.

The edges of these graphs are paths with bounded #emph[projected diameter], rather than bounded length. Consequently every power of a fixed loop near the distinguished fiber is a single edge. The local criterion detects every nonzero power separately and gives the infinite-order lower bound. This feature is essential to the argument; neither a global coloring nor a family of finite quotients is needed for that lower bound.

Two copies of the pencil give a distinguished fiber $C times C$. An order-four symmetry exchanges the factors and rotates their normal directions. Resolving its coarse quotient over this fiber produces a map from a point blowup of $"Sym"^2 C$, itself the blowup of $"Jac" \( C \)$ at a point. The same local argument detects the sum of the two translation labels. We then realize the resulting surface map in an ordinary smooth projective ambient variety and remove its point blowups by projective modifications. Throughout these operations we preserve the actual homomorphism from the surface group.

The local path criterion and the ambient blowdown construction are formulated separately from the example. The former converts bounded chart compatibility and hyperbolicity into nontriviality of loops. The latter realizes a point blowdown of an embedded surface inside a new smooth projective ambient variety, preserving the ambient fundamental group and the induced surface homomorphism. These two statements isolate the group-theoretic and projective-geometric mechanisms of the construction.

=== 1.3 Structure of the proof <structure-of-the-proof>

Section 3 proves the local path criterion independently of the geometric application. Its hypotheses are bounded-range path readings, compatibility of endpoint equality, and uniform hyperbolicity of the reading graphs; no local compactness is required. Section 4 constructs the arithmetic arrangement, its sign covers, and the distinguished surface map. Section 5 defines the local monodromy labels, proves their buffered compatibility, and establishes hyperbolicity of the associated graphs. Section 6 verifies the path criterion for the constructed orbifold and proves that the surface image is infinite cyclic. Section 7 carries this image into an ordinary smooth projective variety, removes the point blowups, and completes the proof using Section 2.

=== 1.4 Conventions <conventions>

All varieties are over $bb(C)$ unless a field is specified, and all fundamental groups are taken in the usual topology. For a smooth complex orbifold, equivalently a smooth Deligne–Mumford stack in the constructions below, the fundamental group means that of its classifying space. An #emph[ordinary] point has trivial stabilizer. Fundamental-group image statements are understood up to a common choice of basepoints and connecting paths. Projective bundles parametrize lines. Complex hyperbolic distance is normalized so that a point of Euclidean radius $tanh r$ in the unit ball has distance $r$ from its center.

== 2 Reduction to an abelian surface with cyclic image <sec:reduction>

The main construction will produce a simple abelian surface inside a smooth projective variety, with infinite cyclic image on fundamental groups. We first explain why that is enough. This separates the geometric obstruction to Steinness from the group-theoretic construction that occupies the intervening sections.

#thm([Proposition 2.1.])[
  #emph[Let $A$ be a simple abelian surface and let $A arrow.r.hook S'$ be a closed embedding in a smooth connected projective complex variety. Suppose that 
$ "im" #scale(x: 120%, y: 120%)[\(] pi_1 \( A \) arrow.r pi_1 \( S' \) #scale(x: 120%, y: 120%)[\)] tilde.eq bb(Z) . $

 There exist a smooth connected projective fourfold $X$ with large fundamental group and a closed embedding $A arrow.r.hook X$ with infinite cyclic image on fundamental groups, such that the universal cover of $X$ is not Stein.]
] <prop:large-reduction>

We begin with the equivalence between largeness and the condition on the universal cover used in Theorem 1.

#thm([Lemma 2.2.])[
  #emph[Let $X$ be a smooth connected projective complex variety. Its universal cover contains no positive-dimensional compact complex-analytic subvariety if and only if $X$ has large fundamental group.]
] <red:compact-criterion>

#proof[
  Suppose that $Z subset X$ has positive dimension and that $pi_1 \( Z^nu \)$ has finite image in $pi_1 \( X \)$. The covering of $Z^nu$ corresponding to the kernel has finite degree and is compact. Its map to $X$ lifts holomorphically to $tilde(X)$. The image of the lift is a positive-dimensional compact analytic subvariety, by the proper mapping theorem.
  Conversely, let $K subset tilde(X)$ be a positive-dimensional irreducible compact analytic subvariety. Its image $Z$ in $X$ is analytic by the same theorem and algebraic by Chow’s theorem. The restriction $K arrow.r Z$ is finite: it is proper and its fibers are discrete, since the covering map is locally biholomorphic. Thus $K^nu arrow.r Z^nu$ is finite and surjective. Such a map has finite-index image on fundamental groups. To see the latter assertion, remove a proper analytic subset of the target so that the map becomes a finite unramified cover of smooth connected spaces. On these open sets the index is its covering degree. Their fundamental groups surject onto those of the normal spaces, by general position for loops; passing to these quotients can only decrease the index. But the composite $pi_1 \( K^nu \) arrow.r pi_1 \( X \)$ is zero, because $K^nu$ maps to $tilde(X)$. Hence $pi_1 \( Z^nu \)$ has finite image in $pi_1 \( X \)$. ◻
]

The next elementary interpolation observation allows us to control all fibers of a general complete intersection simultaneously.

#thm([Lemma 2.3.])[
  #emph[Let $W$ be a projective variety, $F subset W$ a closed subscheme, and $L$ a very ample line bundle. Fix a positive integer $ell$. For all sufficiently large $m$ and every set of distinct points $p_1 \, dots.h \, p_ell in W \\ F$, the evaluation map 
$ H^0 \( W \, cal(I)_F ⊗ L^m \) arrow.r xor.big_(i = 1)^ell L^m \|_(p_i) $

 is surjective. The same bound on $m$ works for every such set.]
] <red:interpolation>

#proof[
  Choose $m_0$ so that $cal(I)_F ⊗ L^(m_0)$ is globally generated. For each $i$, choose a section $a_i$ nonzero at $p_i$. For every $j eq.not i$, very ampleness gives a section of $L$ vanishing at $p_j$ and nonzero at $p_i$. Their product $b_i$ vanishes at all the $p_j$ with $j eq.not i$ and is nonzero at $p_i$. The sections $a_i b_i$ therefore give a diagonal basis for evaluation in degree $m_0 + ell - 1$. Multiplying each by a section of the remaining power of $L$ nonzero at $p_i$ gives the assertion in every higher degree. ◻
]

#proof[
  Put $d = dim S'$, choose an abelian variety $B$ of dimension $g = 6$, and write
  $ W = S' times B \, #h(2em) F = A times { 0 } \, #h(2em) c = d + g - 4 = d + 2 . $
  Fix a very ample line bundle $L$ on $W$. We shall take $X$ to be the common zero locus of $c$ general sections of $cal(I)_F ⊗ L^m$, for a sufficiently large $m$. There are two requirements: $X$ must be smooth with the expected fundamental group, and its fibers over $B$ must be finite away from $F$.
  #emph[Smoothness and the fundamental group.] For large $m$, the sections generate the ideal away from $F$ and their normal derivatives generate $N_(F \/ W)^(*) ⊗ L^m \|_F$. Bertini’s theorem gives smoothness away from $F$. Along $F$, smoothness is the independence of $c$ general vectors in a bundle of rank $d + g - 2 = c + 2$. The rank-deficient matrices have codimension $3$, larger than $dim F = 2$, so no rank loss occurs for a general tuple. The same count for each prefix of the tuple shows that the successive intersections are smooth. They are ample hypersurfaces in their predecessors, with final dimension four. The Lefschetz hyperplane theorem consequently gives connectedness and an isomorphism, induced by inclusion,
  #[#set math.equation(numbering: n => "(2.1)")
   $ pi_1 \( X \) arrow.r^(med tilde.op med) pi_1 \( S' times B \) = pi_1 \( S' \) times pi_1 \( B \) . $ <red:fundamental-group>]
  Here and below we use sufficiently high powers of a very ample line bundle to obtain both ideal generation and generation of the indicated normal derivatives; these are the usual applications of Serre vanishing and Bertini’s theorem #cite(label("Hartshorne")).
  #emph[Fibers away from the fixed surface.] We claim that a general such tuple excludes four distinct points of $W \\ F$ in any one fiber of $W arrow.r B$. Excluding four points is enough to exclude every positive-dimensional fiber component outside $F$; the choice $g = 6$ makes the following incidence count strict. The parameter space of ordered quadruples in one fiber has dimension at most $4 d + g = 4 d + 6$. By Lemma 4, requiring all $c$ equations to vanish at such a quadruple imposes exactly $4 c = 4 d + 8$ independent linear conditions on the space of tuples of sections. The incidence variety of tuples and quadruples thus has dimension strictly less than the section parameter space. Its constructible image has closure of strictly smaller dimension as well. A general tuple lies outside this closure. This condition is compatible with the open smoothness conditions already imposed.
  It follows that each fiber of $X arrow.r B$ contains at most three points outside $F$. In particular, every positive-dimensional subvariety of a fiber is contained in $F$.
  #emph[Largeness.] Let $Z subset X$ be a positive-dimensional closed irreducible subvariety. If its projection to $B$ is nonconstant, then $pi_1 \( Z^nu \) arrow.r pi_1 \( B \)$ has infinite image. Otherwise its image, a finite subgroup of the torsion-free group $pi_1 \( B \)$, would be trivial. The map $Z^nu arrow.r B$ would then lift holomorphically to $bb(C)^g$. Every holomorphic function on the connected compact normal space $Z^nu$ is constant, a contradiction.
  If the projection is constant, the fiber property gives $Z subset F$. For $Z = F$, its image in $pi_1 \( X \)$ is infinite cyclic by (2.1) and the hypothesis. The only other possibility is an irreducible curve in $A$. Let $D$ be its smooth normalization. After a translation in $A$, the nonconstant map $D arrow.r A$ extends to a homomorphism $"Jac" \( D \) arrow.r A$. Its image is a nonzero abelian subvariety, and therefore all of $A$ by simplicity. A surjective homomorphism of complex tori carries the source integral lattice to a finite-index subgroup of the target lattice. Consequently $pi_1 \( D \)$ has finite-index image in $pi_1 \( A \) tilde.eq bb(Z)^4$, and its image under the homomorphism onto the infinite cyclic group remains infinite. This proves largeness in every case. Lemma 3 then gives the required absence of compact analytic subvarieties in $tilde(X)$.
  #emph[The obstruction to Steinness.] Let $K$ be the kernel of $pi_1 \( A \) arrow.r pi_1 \( X \)$. Its quotient is infinite cyclic, so $K tilde.eq bb(Z)^3$. A connected component of the inverse image of $F$ in $tilde(X)$ is the connected covering
  $ A_K = bb(C)^2 \/ K . $
  It is a closed complex submanifold of $tilde(X)$: the full inverse image of $F$ is closed, and its components are closed and locally separated in covering charts. The real span of $K$ has dimension three, so, as a real manifold,
  $ A_K tilde.eq \( bb(R)^3 \/ bb(Z)^3 \) times bb(R) \, #h(2em) H_3 \( A_K \, bb(Z) \) tilde.eq bb(Z) . $
  By the Andreotti–Frankel theorem #cite(label("AndreottiFrankel1959")), a Stein manifold of complex dimension two has the homotopy type of a CW complex of real dimension at most two; see #cite(label("MilnorMorse")) Theorem 7.2. Thus $A_K$ is not Stein. A closed complex submanifold of a Stein manifold is Stein, so $tilde(X)$ cannot be Stein either. ◻
]

Proposition 2 leaves one concrete task: embed a simple abelian surface in a smooth projective variety so that its fundamental group has infinite cyclic image. We first construct the corresponding map from a point blowup of the surface to a smooth orbifold, and then convert it to the required embedding in Section 7.

== 3 A local criterion for nontrivial loops <sec:paths>

The geometric construction will attach group labels to paths only within bounded regions. We therefore need a criterion that detects a nontrivial loop using such local information. The criterion below uses hyperbolic graphs as the local models. It does not require a global map to a model, local finiteness of a graph, or a bound on the information carried by one edge.

A model to keep in mind is a graph whose vertices are points of a space and whose edges are paths confined to small regions. A reading lifts such paths to a covering space chosen near the initial vertex; its endpoint records both the actual endpoint and the sheet of the cover. The argument follows the coarse local-to-global viewpoint of hyperbolic geometry #cite(label("Gromov1987")); we prove here the version for bounded path readings in compatible charts.

=== 3.1 Paths and their readings <paths-and-their-readings>

All graphs have oriented edges with specified reverses; multiple edges and loops are allowed. Each edge has length one. Paths are finite edge paths, and their lengths count edges. A constant path has length zero. The path groupoid of a graph is obtained by cancelling consecutive reverse edges. We use the path metric on each connected component of a graph.

Fix a positive integer $N$. At each vertex $v$ of a graph $G$, suppose that we are given a pointed graph $\( D_v \, d_v \)$ and a rule for reading every path of length at most $N$ starting at $v$ as an edge path in $D_v$ starting at $d_v$. Write $\[ p \]_v$ for the terminal vertex of the reading of $p$. The following are the required properties.

+ Readings respect prefixes and reverses of edges, and read a backtrack as a backtrack. If $p$ starts at $v$ and $\| p \| < N$, reading gives a bijection between the edges leaving the actual endpoint of $p$ and the edges leaving $\[ p \]_v$. If $\[ p \]_v = \[ p' \]_v$, then $p$ and $p'$ have the same actual endpoint in $G$, and their edge bijections agree whenever both are defined.
+ Suppose that $p$ runs from $v$ to $w$ and that $a \, b$ start at $w$. If each of $p \, a \, b$ has length at most $N \/ 2$, then
  #[#set math.equation(numbering: n => "(3.1)")
   $ \[ p a \]_v = \[ p b \]_v quad arrow.l.r.double quad \[ a \]_w = \[ b \]_w . $ <path:change-root>]
+ All connected components of all the graphs $D_v$ are Gromov hyperbolic with a common constant.

These rules concern paths within the stated range. They do not assert that the whole graph $G$ maps to $D_v$, or that the whole graph $D_v$ maps to $G$.

A loop $p$ at $v$ #emph[closes on reading] if $\[ p \]_v = d_v$. Let $cal(Q)$ be the quotient of the path groupoid of $G$ by the relations that every such loop of length at most three is the constant path.

#thm([Lemma 3.1.])[
  (Local path criterion).  #emph[There is a bound $N_0$, depending only on the common hyperbolicity constant, with the following property. If the readings satisfy (P1)–(P3) with $N gt.eq N_0$, and $e$ is a single-edge loop at $v$ satisfying $\[ e \]_v eq.not d_v$, then $e$ is nontrivial in $cal(Q)$.]
] <thm:path-lemma>

The proof constructs a locally geodesic representative for each path, unique up to a uniformly narrow comparison. Such representatives can be continued one edge at a time. The comparison class is unchanged by the relations defining $cal(Q)$, but distinguishes the edge in the lemma from the constant path.

=== 3.2 Calculations within one chart <calculations-within-one-chart>

We first record precisely how the reading rules allow short calculations to move between charts. By (P1), any edge path in $D_v$ starting at a state already reached by reading can be lifted to a path in $G$, as long as the total reading length is at most $N$. If two such readings have the same endpoint, their lifted paths have the same actual endpoint, and any further common continuation reads identically. Together with (P2), this has three useful consequences.

First, a short circuit closes on reading if and only if its two complementary paths from one corner to another have equal read endpoints. Indeed one may read one path and the reverse of the other, using (P1). Closure can be tested at any corner: a cyclic change of starting corner amounts to prefixing by a side, applying (P2), and cancelling that side using (P1). Here and below, “short” means that all prefixes and continuations in the comparison lie within the ranges of (P1) and (P2).

Second, geodesicity of a short reading is independent of a short prefix. For example, if the reading of $a$ from $w$ is geodesic but its reading after $p : v arrow.r w$ has a shorter competitor, lift that competitor from $\[ p \]_v$. It gives a path $b$ from $w$ with $\[ p a \]_v = \[ p b \]_v$. Equation (3.1) gives $\[ a \]_w = \[ b \]_w$, contradicting geodesicity. The reverse implication uses a shorter competitor in $D_w$ and the same argument. For distance comparison, suppose the states are reached by paths $a \, b$ from $w$. Lift a shortest connector $c$ between their read states, starting after $a$ (or after $p a$). Its length is at most $\| a \| + \| b \|$, and apply (P2) to $a c$ and $b$. Doing this in both charts proves equality of the distances whenever $\| p \| lt.eq N \/ 2$ and $2 \| a \| + \| b \| lt.eq N \/ 2$. These bounds, as well as their versions with $a \, b$ interchanged, hold in every use below.

Third, a short strip of closed circuits can be calculated in one chart without adding the lengths of all its transverse paths. Here is the explicit bookkeeping. Let $a_j \, b_j$ be the prefixes down the two sides of the strip, and let $rho_j$ be its transverse path from the endpoint of $a_j$ to that of $b_j$. Starting in the chart at the beginning of the first side, the equalities to prove are

#[#set math.equation(numbering: n => "(3.2)")
 $ \[ a_j rho_j \] = \[ rho_0 b_j \] . $ <path:strip-calculation>]

Closure of the next elementary circuit, transported after $a_j$ by (P2), compares its two routes across the next step. Explicitly, write $a_(j + 1) = a_j s_j$ and $b_(j + 1) = b_j t_j$, where $s_j \, t_j$ are the next side portions. Closure and then the preceding equality give

$ \[ a_(j + 1) rho_(j + 1) \] & = \[ a_j rho_j t_j \]\
 & = \[ rho_0 b_j t_j \] = \[ rho_0 b_(j + 1) \] \, $

using (P1) for the common continuation, edge by edge. This proves (3.2) at the next step. Thus only the side prefixes and each individual transverse path enter the range bound. Conversely, transverse paths found in this one chart lift to $G$ and give circuits that close when read from their own corners. These facts will justify all uses of diagrams below.

Choose an integer $Delta gt.eq 10$ large enough for the following standard consequences of the common hyperbolicity bound. In every component of every chart, geodesic triangles are $Delta$-slim on vertices: every vertex on one side lies within $Delta$ of a vertex on one of the other two sides. Dividing a geodesic quadrangle by a diagonal then shows that each side lies within $2 Delta$ of the union of the other three sides. The Gromov product

$ \( x divides y \)_u = 1 / 2 #scale(x: 120%, y: 120%)[\(] d \( u \, x \) + d \( u \, y \) - d \( x \, y \) #scale(x: 120%, y: 120%)[\)] $

satisfies

#[#set math.equation(numbering: n => "(3.3)")
 $ \( x divides z \)_u gt.eq min { \( x divides y \)_u \, \( y divides z \)_u } - Delta . $ <path:product>]

Moreover, for a geodesic segment $\[ x \, z \]$, there is a vertex on that segment at distance at most $\( x divides z \)_u + 10 Delta$ from $u$. Enlarging $Delta$ absorbs all rounding to vertices. These are the usual equivalent forms of hyperbolicity; see #cite(label("BridsonHaefliger")) Chapter III.H.

We will also use the following elementary comparison. If two geodesic segments $gamma_1 \, gamma_2$, of lengths $ell_1 \, ell_2$, have corresponding endpoints at distance at most $h$, then for every integer $t gt.eq 0$,

#[#set math.equation(numbering: n => "(3.4)")
 $ d #scale(x: 120%, y: 120%)[\(] gamma_1 \( min { t \, ell_1 } \) \, gamma_2 \( min { t \, ell_2 } \) #scale(x: 120%, y: 120%)[\)] lt.eq 10 \( h + Delta \) . $ <path:geodesic-comparison>]

This is a #emph[synchronous comparison] of width $10 \( h + Delta \)$: the parameters advance by one on both segments until the shorter segment ends, and then that segment waits at its endpoint. To check the bound, join the corresponding endpoints by geodesics of length at most $h$. The resulting quadrangle is $2 Delta$-slim. A point close to the opposite geodesic has a mate whose distance from that geodesic’s initial endpoint differs from its own parameter by at most $h + 2 Delta$. A point close to an end connector is within $h + 2 Delta$ of the corresponding end. These estimates, together with the bound $2 h$ on the difference of the lengths, imply (3.4), also when one segment has ended.

Fix integers

#[#set math.equation(numbering: n => "(3.5)")
 $ H = 1000 Delta \, #h(2em) L gt.eq 10^6 H \, #h(2em) k = 20 L \, #h(2em) N gt.eq 10^5 k . $ <path:constants>]

Taking $L = 10^6 H$, for example, gives a threshold $N_0 = 10^5 \( 20 L \)$ depending only on the original hyperbolicity constant. A #emph[guide] is a path each of whose subpaths of length at most $k$ reads as a geodesic in the chart at its initial vertex. Its entire length may be arbitrarily large. Every individual chart calculation below uses paths, including prefixes, of length less than $1000 k$. Consequently (P1) and (P2) always apply. A long guide is handled in separate short pieces, never by reading its whole prefix.

=== 3.3 Narrowing comparisons between guides <narrowing-comparisons-between-guides>

For paths $alpha \, beta$ with the same initial and terminal vertices, a #emph[ladder of width $h$] consists of the following data. A finite schedule of pairs of positions begins at $\( 0 \, 0 \)$ and ends at $\( \| alpha \| \, \| beta \| \)$; at each step each position advances by zero or one. At each scheduled pair there is a path, called a rung, from the vertex on $alpha$ to the vertex on $beta$, of length at most $h$. The first and last rungs are empty. Each elementary circuit, formed by consecutive rungs and the intervening portions of the two paths, must close on reading. Pausing both paths is allowed. In particular, this definition does not require an elementary circuit to have length at most three. Ladders are comparisons of readings, rather than expressions in the relations defining $cal(Q)$.

For the widths used below, ladders are symmetric, by changing corners of their elementary circuits. They compose with addition of widths whenever the sum is at most $1000 H$, which suffices for every composition below. Indeed, given ladders from $alpha$ to $beta$ and from $beta$ to $gamma$, synchronize the advances along $beta$, inserting pauses in the other sides as necessary, and concatenate the two rungs. Each resulting circuit is a union of one or two elementary circuits from the given ladders, so closes by (3.2). Appending the same trailing path to both sides preserves the width: use empty rungs along that trailing path.

#thm([Lemma 3.2.])[
  (Narrowing).  #emph[If two guides have a ladder of width at most $1000 H$, then they have one of width at most $H$.]
] <path:narrowing>

#proof[
  Let $alpha \, beta$ be the guides, and let the given width be $h lt.eq 1000 H$. Consider an interval of the schedule on which $alpha$ advances by at most $8 L$. On this interval $beta$ advances by less than $k$. Otherwise stop at its first advance of $k$ edges. The strip up to that point calculates in one chart: its sides have lengths at most $8 L$ and $k$, and its rungs have length at most $h$. The second side is geodesic there, whereas its endpoints can be joined using the first side and the two end rungs. This gives the contradiction
  $ k lt.eq 8 L + 2 h < 20 L = k . $
  It follows also that on every such schedule interval both sides read as geodesics, and their lengths differ by at most $2 h$.
  Suppose first that $\| alpha \| gt.eq L$. Mark $alpha$ at $x_0 \, dots.h \, x_m$, including its endpoints, so that consecutive marked intervals have lengths in $\[ L \, 2 L \]$. Choose scheduled mates $b_0 \, dots.h \, b_m$ on $beta$, using its actual endpoints for $b_0 \, b_m$. The distance along $beta$ between consecutive old mates is at least $L - 2 h$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 2.05), (10.8, 2.05), stroke: (thickness: 0.9pt, miter-limit: 10))
  line((0, 0.2), (10.8, 0.2), stroke: (thickness: 0.9pt, miter-limit: 10))
  line((0, 2.05), (0, 0.2), stroke: (paint: rgb("#595959"), thickness: 0.65pt, miter-limit: 10, dash: "densely-dashed"))
  content((0, 1.125), [#text(size: 9pt)[$lt.eq h$]], anchor: "east", padding: 0.1176cm)
  line((10.8, 2.05), (10.8, 0.2), stroke: (paint: rgb("#595959"), thickness: 0.65pt, miter-limit: 10, dash: "densely-dashed"))
  content((10.8, 1.125), [#text(size: 9pt)[$lt.eq h$]], anchor: "west", padding: 0.1176cm)
  line((5.4, 2.05), (6.7, 0.2), stroke: (paint: rgb("#595959"), thickness: 0.65pt, miter-limit: 10, dash: "densely-dashed"))
  content((6.05, 1.125), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[old: $lt.eq h$]]])], anchor: "west")
  line((5.4, 2.05), (5.4, 0.2), stroke: (paint: rgb("#165b77"), thickness: 1.1pt, miter-limit: 10))
  content((5.4, 1.032), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[new: $lt.eq 2 Delta$]]])], anchor: "east")
  circle((0, 2.05), radius: 0.05997, fill: black, stroke: none)
  circle((5.4, 2.05), radius: 0.05997, fill: black, stroke: none)
  circle((10.8, 2.05), radius: 0.05997, fill: black, stroke: none)
  circle((0, 0.2), radius: 0.05997, fill: black, stroke: none)
  circle((6.7, 0.2), radius: 0.05997, fill: black, stroke: none)
  circle((10.8, 0.2), radius: 0.05997, fill: black, stroke: none)
  circle((5.4, 0.2), radius: 0.07761, fill: rgb("#ffffff"), stroke: (paint: rgb("#165b77"), thickness: 1.1pt, miter-limit: 10))
  content((0, 2.191), [#text(size: 9pt)[$x_(i-1)$]], anchor: "south", padding: 0.1176cm)
  content((5.4, 2.191), [#text(size: 9pt)[$x_i$]], anchor: "south", padding: 0.1176cm)
  content((10.8, 2.191), [#text(size: 9pt)[$x_(i+1)$]], anchor: "south", padding: 0.1176cm)
  content((0, 0.02361), [#text(size: 9pt)[$b_(i-1)$]], anchor: "north", padding: 0.1176cm)
  content((5.4, 0.02361), [#text(size: 9pt)[$b_i'$]], anchor: "north", padding: 0.1176cm)
  content((6.7, 0.02361), [#text(size: 9pt)[$b_i$]], anchor: "north", padding: 0.1176cm)
  content((10.8, 0.02361), [#text(size: 9pt)[$b_(i+1)$]], anchor: "north", padding: 0.1176cm)
  content((-0.635, 2.05), [#text(size: 9pt)[$alpha$]], anchor: "east", padding: 0.1176cm)
  content((-0.635, 0.2), [#text(size: 9pt)[$beta$]], anchor: "east", padding: 0.1176cm)
  line((0, 2.76), (5.4, 2.76), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.7, 2.936), [#text(size: 9pt)[length in $[L,2L]$]], anchor: "south", padding: 0.1176cm)
  line((5.4, 2.76), (10.8, 2.76), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((8.1, 2.936), [#text(size: 9pt)[length in $[L,2L]$]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 1: Narrowing a ladder in a single chart. Both displayed guide pieces read as geodesics. The interior mark $x_i$ is far from the end rungs, so quadrangle slimness supplies a new mate $b'_i$ on the opposite side, within $2 Delta$ of $x_i$. The old scheduled mate $b_i$ is at distance at most $h + 2 Delta$ from $b'_i$ along that side. The drawing is schematic: the long side intervals and the two rung bounds use different visual scales. ],
  ) <fig:path-ladder>
  At an interior mark $x_i$, calculate the part between $x_(i - 1)$ and $x_(i + 1)$ in one chart, as in Figure 1. Replace its end rungs by geodesics of length at most $h$. The point $x_i$ is at distance at least $L - h > 2 Delta$ from either end connector. Quadrangle slimness therefore puts it within $2 Delta$ of a vertex $b'_i$ on the opposite geodesic, the corresponding piece of $beta$. Its old mate $b_i$ was within $h$ of $x_i$, so geodesicity gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ \| b'_i - b_i \|_beta lt.eq h + 2 Delta . $ <path:mate-shift>]
  Here the left side denotes distance in the parameter of the path $beta$. The new mates remain in order, since the difference between consecutive new positions is at least
  $ L - 2 h - 2 \( h + 2 Delta \) = L - 4 h - 4 Delta > 0 . $
  The same estimate at the ends puts them strictly between the unchanged endpoint mates. Lift short paths from $x_i$ to $b'_i$ to obtain new rungs of length at most $2 Delta$; use empty rungs at $i = 0 \, m$.
  The new rungs agree with the old calculation: following an old rung and the relevant portion of $beta$ has the same read endpoint as the new rung. On a marked interval this equality can be checked together with both adjacent marked intervals. Their union has first-side length at most $6 L$, so the preceding bound and the short-strip calculation apply. Thus between successive new mates both sides are geodesic, and their end rungs have length at most $2 Delta$. Apply (3.4), lift the comparison rungs, and retain the specified rungs at the marked endpoints. Each elementary circuit closes in this chart and hence at its own corner. The resulting width is at most $30 Delta < H$.
  If $\| alpha \| < L$, the initial schedule argument applies to the whole ladder. Both sides calculate as geodesics in one chart with identical endpoints, and (3.4) directly gives width at most $10 Delta < H$. ◻
]

In particular, existence of a width-$H$ ladder is an equivalence relation on guides with fixed endpoints. Reflexivity uses empty rungs, symmetry was noted above, and transitivity follows by composing two ladders and applying Lemma 6.

=== 3.4 Continuing a guide by one edge <continuing-a-guide-by-one-edge>

We next show that this comparison class can be continued along any edge. The difficulty is that appending an edge need not preserve local geodesicity. We repair the guide by choosing nearby vertices at widely spaced marks and minimizing the total distance between those choices. All nearby choices are specified by paths in the charts; distance in $G$ alone would forget the states that must be compared.

#thm([Lemma 3.3.])[
  (Extension).  #emph[If $alpha$ is a guide and $e$ is an edge starting at its terminal vertex, there is a guide $beta$ to the endpoint of $alpha e$ and a ladder between $alpha e$ and $beta$ of width at most $50 H$.]
] <path:extension>

#proof[
  If $\| alpha \| < L$, read $alpha e$ in its initial chart and join its endpoints by a geodesic. Lift that geodesic to $G$. The result is a guide by transport of geodesicity. Compare it with $alpha$, whose final endpoint differs by at most one in the chart, using (3.4). Finish the comparison by letting the first side traverse $e$ while the second waits. This proves the claim in this case.
  Suppose $\| alpha \| gt.eq L$, and mark it at $a_0 \, dots.h \, a_m$ in intervals $alpha_i$ of lengths $ell_i in \[ L \, 2 L \]$, where $alpha_i$ runs from $a_i$ to $a_(i + 1)$. At each mark choose a path $c_i$ starting there, with $\| c_i \| lt.eq H$. Require $c_0$ to be empty and $c_m = e$. For adjacent marks define
  $ F_i \( c_i \, c_(i + 1) \) = d_(D_(a_i)) #scale(x: 120%, y: 120%)[\(] \[ c_i \]_(a_i) \, \[ alpha_i c_(i + 1) \]_(a_i) #scale(x: 120%, y: 120%)[\)] . $
  Choose the paths $c_i$ to minimize $sum_(i = 0)^(m - 1) F_i$. A minimum exists because the set of choices is nonempty and the objective takes nonnegative integer values; no compactness assumption is needed.
  The point of this minimization is that, on each short block, hyperbolicity will supply a geodesic in one chart between its chosen outer endpoints, with points lying in order within $H$ of the interior marks. Replacing the interior choices by short paths to those points will force equality in the triangle inequality for the minimizing choices.
  For each $i$, lift a geodesic realizing $F_i$, starting after $c_i$ in the chart at $a_i$, to a path $beta_i$ in $G$. Equality of read endpoints shows that $beta_i$ ends at the actual endpoint of $c_(i + 1)$. Thus the paths concatenate to a path $beta = beta_0 dots.h.c beta_(m - 1)$ from $a_0$ to the endpoint of $e$. The comparison circuit between $alpha_i$ and $beta_i$, using $c_i \, c_(i + 1)$, closes on reading. The paths $c_i$, rather than just their actual endpoints, retain the states used in this assertion.
  We claim that on every block of at most $100$ consecutive marked intervals the concatenation of the $beta_i$ is geodesic in a single chart calculation. Read such a block in the chart at its first mark. The paths $alpha_i$, $c_i$, and $beta_i$ all calculate there consistently, by (3.2); each side has length bounded by $100 \( 2 L + 2 H \)$, well within the prescribed range. Distances computed here agree with the single-interval distances $F_i$, by transport of short competitors.
  For the hyperbolic calculation, denote the read marks on this block by $x_0 \, dots.h \, x_q$, where $q lt.eq 100$. Their consecutive distances are in $\[ L \, 2 L \]$, and
  #[#set math.equation(numbering: n => "(3.7)")
   $ \( x_(i - 1) divides x_(i + 1) \)_(x_i) = 0 #h(2em) \( 1 lt.eq i < q \) \, $ <path:zero-products>]
  because two consecutive marked intervals of $alpha$ have total length at most $4 L < k$. We record the consequences of (3.7) explicitly. Induction using (3.3) gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ \( x_0 divides x_(i + 1) \)_(x_i) lt.eq Delta #h(2em) \( 1 lt.eq i < q \) . $ <path:forward-product>]
  The first case follows from (3.7). For the next case, the preceding estimate and the identity
  $ \( x_0 divides x_(i - 1) \)_(x_i) = d \( x_(i - 1) \, x_i \) - \( x_0 divides x_i \)_(x_(i - 1)) gt.eq L - Delta $
  show that this product exceeds $Delta$. Applying (3.3) to the zero product $\( x_(i - 1) divides x_(i + 1) \)_(x_i)$ forces (3.8). The same argument backwards, followed by another application of (3.3), gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ \( x_0 divides x_q \)_(x_i) lt.eq 2 Delta #h(2em) \( 1 lt.eq i < q \) . $ <path:block-products>]
  For the last implication, use $\( x_(i - 1) divides x_q \)_(x_i) lt.eq Delta$ and $\( x_(i - 1) divides x_0 \)_(x_i) gt.eq L - Delta > 2 Delta$. Also, the distances from $x_0$ increase at every mark by at least $L - 2 Delta$, since
  $ d \( x_0 \, x_(i + 1) \) - d \( x_0 \, x_i \) = d \( x_i \, x_(i + 1) \) - 2 \( x_0 divides x_(i + 1) \)_(x_i) . $
  The analogous estimate holds from the other endpoint.
  Let $A \, B$ be the read endpoints of the chosen paths at the two ends of the block. They are at distance at most $H$ from $x_0 \, x_q$, respectively. By (3.9), every interior $x_i$ has a mate on a geodesic $\[ x_0 \, x_q \]$ at distance at most $12 Delta$. Such a mate is farther than $2 Delta$ from either of the geodesic connectors $\[ x_0 \, A \]$ and $\[ x_q \, B \]$: its distance from those connectors is at least $L - H - 14 Delta$. Quadrangle slimness therefore gives a vertex $y_i$ on $\[ A \, B \]$ with
  #[#set math.equation(numbering: n => "(3.10)")
   $ d \( x_i \, y_i \) lt.eq 20 Delta < H . $ <path:block-mates>]
  The vertices $y_i$ occur in increasing order along $\[ A \, B \]$. Indeed their distances from $A$ differ from the corresponding distances $d \( x_0 \, x_i \)$ by at most $H + 20 Delta$. Consequently each consecutive difference is at least
  $ L - 2 Delta - 2 H - 40 Delta > 0 . $
  The same inequalities keep them strictly between $A$ and $B$.
  Lift short paths from the interior $x_i$ to the $y_i$ to replace the interior choices $c_i$, keeping the two outer choices fixed. These are legal choices by (3.10). For them the sum of the successive distances equals $d \( A \, B \)$, since their endpoints occur in order on a geodesic. Transport of distances shows that this is also their sum of single-interval objectives $F_i$. Minimality of the original total objective implies that its sum on this block is at most $d \( A \, B \)$: changing only interior choices leaves every term outside the block unchanged. The triangle inequality gives the reverse inequality. Thus the original joins concatenate geodesically on the block, as claimed.
  Each join $beta_i$ has length at least $L - 2 H$. A subpath of $beta$ of length at most $k = 20 L$ therefore meets fewer than $100$ consecutive joins: apart from at most two end joins, every join it meets is entirely contained in that subpath. The block result and transport of geodesicity prove that $beta$ is a guide.
  Finally compare $alpha_i$ and $beta_i$ in their single-interval chart. Their corresponding endpoints are joined by the given paths $c_i \, c_(i + 1)$ of length at most $H$. Formula (3.4) gives comparison rungs of length at most $10 \( H + Delta \)$; retain the given choice paths as rungs at the marks. Lift these comparisons and concatenate them. At the last mark the rung is $e$; let the first side traverse $e$ and finish with an empty rung. This gives the required ladder of width at most $50 H$. ◻
]

=== 3.5 The invariant of a path <the-invariant-of-a-path>

We can now finish the local criterion. Fix an initial vertex $v$ and consider guides starting at $v$, modulo width-$H$ ladders. By Lemma 7, appending an edge $e$ defines a continuation of such a class. It is independent of both choices involved. If $alpha \, alpha'$ represent the same class, append $e$ to their width-$H$ ladder. If $beta \, beta'$ are any two guides supplied by Lemma 7, composition gives a ladder between them of width at most

$ 50 H + H + 50 H = 101 H . $

Lemma 6 reduces this to width $H$. The same argument covers different choices of the extension for a fixed guide.

Let $q$ be a loop of length at most three that closes on reading. It has a ladder of width at most three with the constant path. One explicit schedule traverses $q$ on the first side while the second waits: after a noninitial position use the remaining suffix of $q$ as the rung, and use empty first and last rungs. The first circuit closes because $q$ does, and the subsequent ones cancel consecutive reverse edges. The short-chart rules justify the same assertion at each corner. Appending this ladder after any guide $alpha$ gives a width-three ladder between $alpha q$ and $alpha$.

Successively applying Lemma 7 along $q$ produces a guide $beta$ with a ladder to $alpha q$ of width at most $150 H$. To see the bound, at each step append the remaining common trailing edges to the comparison and compose; each of at most three steps adds $50 H$. Composing with the preceding width-three ladder and narrowing shows that $beta$ and $alpha$ represent the same class. The same reasoning applies to a backtrack, which closes on reading by (P1).

Starting from the empty guide at $v$ and continuing along a path thus gives a class unchanged by every defining relation of $cal(Q)$. Insertion of a relation in the middle of a path causes no problem: the classes agree after the inserted loop, and the well-defined continuations along the remaining edges preserve that agreement.

#proof[
  Let $e$ be the edge in the statement. Its reading has distinct endpoints and length one, so $e$ itself is a guide. Its class is therefore the continuation of the empty guide along $e$. If $e$ were trivial in $cal(Q)$, the invariant just constructed would give a width-$H$ ladder between $e$ and the constant path. This entire comparison calculates in the chart at $v$: its sides have lengths one and zero and its individual rungs have length at most $H$. Equation (3.2), with the empty final rung, would then give $\[ e \]_v = d_v$, a contradiction. ◻
]

== 4 An arithmetic arrangement and a distinguished surface <sec:geometry>

We construct a smooth proper effective orbifold $cal(S)$ with projective coarse space and a morphism $f : Y arrow.r cal(S)$, where $Y$ is obtained from a simple abelian surface by point blowups. The image of $f$ will lie in the ordinary locus of $cal(S)$. The arrangement constructed here provides both the relations and the local covering spaces used to prove that $f_(*) pi_1 \( Y \)$ is infinite cyclic. The fundamental-group calculation is made in Theorem 18.

=== 4.1 Two pencils and their coupling hyperplanes <geo:prototype>

The two pencils will use the same six marked directions on $bb(P)^1$. We first choose these markings so that their double cover has simple Jacobian, and then choose the arithmetic ball containing the pencils. Choose six distinct real algebraic numbers $lambda_1 \, dots.h \, lambda_6$ with

#[#set math.equation(numbering: n => "(4.1)")
 $ \| lambda_i \| < 0.01 quad \( 1 lt.eq i lt.eq 4 \) \, #h(2em) lambda_5 < - 4 \, quad lambda_6 > 4 \, $ <geo:slopes>]

and such that the smooth double cover

#[#set math.equation(numbering: n => "(4.2)")
 $ pi : C arrow.r bb(P)^1 \, #h(2em) y^2 = product_(i = 1)^6 \( t - lambda_i \) \, $ <geo:curve>]

has simple Jacobian. We call the first four slopes #emph[red] and the last two #emph[blue]. These requirements can be imposed simultaneously, as follows.

Start with six disjoint real open intervals satisfying (4.1). Monic real polynomials with one root in each interval form a nonempty open set in coefficient space. At three sufficiently large distinct primes prescribe squarefree degree-six reductions with factor degrees

$ \( 6 \) \, #h(2em) \( 5 \, 1 \) \, #h(2em) \( 2 \, 1 \, 1 \, 1 \, 1 \) . $

Weak approximation produces a monic polynomial in $bb(Q) \[ t \]$, integral at these primes, with these reductions and with its real coefficients in the chosen open set. Its Galois group contains a six-cycle, a five-cycle, and a transposition, by the Frobenius cycle criterion. The six-cycle makes the group transitive. The stabilizer of the fixed point of the five-cycle is transitive on the remaining five points, so the group is two-transitive. Conjugating its transposition then gives every transposition, and the Galois group is $S_6$. Let $F$ be its splitting field. Then $F$ is totally real, $F eq.not bb(Q)$, and all six slopes belong to $F$. Zarhin’s theorem gives $"End" \( "Jac" \( C \) \) = bb(Z)$ over an algebraic closure, hence $"Jac" \( C \)$ is simple #cite(label("Zarhin")) Theorem 2.1.

Use the inclusion $F subset bb(R)$ containing the chosen roots as the distinguished real embedding. Choose a CM extension $E \/ F$ and an element $a in F$ which is positive at this embedding and negative at every other real embedding; weak approximation supplies $a$. On $E^5$ put

#[#set math.equation(numbering: n => "(4.3)")
 $ h = "diag" \( 1 \, 1 \, 1 \, 1 \, - a \) . $ <geo:hermitian>]

At the distinguished embedding the negative lines form complex hyperbolic space of dimension four. In the affine chart with last homogeneous coordinate one, write this ball as

$ bb(B) = { \( z \, w \) in bb(C)^2 times bb(C)^2 : \| z \|^2 + \| w \|^2 < a } \, #h(2em) o = \( 0 \, 0 \) . $

The metric is normalized so that in the unit-radius ball a point at distance $r$ from the origin has Euclidean radius $tanh r$.

Choose $c in F$ with

#[#set math.equation(numbering: n => "(4.4)")
 $ 0.85 < c \/ sqrt(a) < 0.9 . $ <geo:coupling-size>]

The #emph[$z$-family] consists of the six slope hyperplanes and two coupling hyperplanes

$ H_i^z = { z_2 = lambda_i z_1 } ∩ bb(B) quad \( 1 lt.eq i lt.eq 6 \) \, #h(2em) K_plus.minus^z = { z_1 = plus.minus c } ∩ bb(B) . $

Define the $w$-family by the same equations in $w$. Let $cal(D)$ denote these sixteen labeled complex hyperbolic hyperplanes. They are all defined over $E$ and are preserved, with their labels permuted, by

#[#set math.equation(numbering: n => "(4.5)")
 $ sigma \( z \, w \) = \( w \, - z \) . $ <geo:sigma>]

This is an order-four isometry represented by an integral unitary matrix. The two pencils have centers

$ L_z = { z = 0 } ∩ bb(B) \, #h(2em) L_w = { w = 0 } ∩ bb(B) . $

The intersection pattern is elementary but important. The $z$ slopes all meet along $L_z$. On $K_plus.minus^z$, a slope of value $lambda$ meets the ball exactly when $c^2 \( 1 + \| lambda \|^2 \) < a$. Thus each coupling hyperplane meets the four red slopes, in distinct subspaces disjoint from $L_z$, and meets neither blue slope. The two $z$ coupling hyperplanes are disjoint. These statements hold also in the $w$-family. A $z$ coupling hyperplane and a $w$ coupling hyperplane are disjoint because $2 c^2 > a$. Every intersection involving the two families has a local product description in the $z$ and $w$ variables. In particular, the phrase “product” here concerns local analytic coordinates, rather than a product decomposition of the hyperbolic metric.

Figure 2 shows the incidences in one family; the second family is obtained by using the other coordinate pair.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.55, 4.55), [#text(size: 9pt)[The six marked directions]])
  line((0, 2.6), (5.1, 2.6), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((5.1, 2.6), [#text(size: 9pt)[$lambda$]], anchor: "west", padding: 0.1176cm)
  rect((1.35, 2.12), (3.75, 3.08), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10), radius: 9pt)
  circle((1.7, 2.6), radius: 0.0898, fill: rgb("#a53a25"), stroke: (paint: rgb("#a53a25"), thickness: 0.4pt, miter-limit: 10))
  circle((2.25, 2.6), radius: 0.0898, fill: rgb("#a53a25"), stroke: (paint: rgb("#a53a25"), thickness: 0.4pt, miter-limit: 10))
  circle((2.8, 2.6), radius: 0.0898, fill: rgb("#a53a25"), stroke: (paint: rgb("#a53a25"), thickness: 0.4pt, miter-limit: 10))
  circle((3.35, 2.6), radius: 0.0898, fill: rgb("#a53a25"), stroke: (paint: rgb("#a53a25"), thickness: 0.4pt, miter-limit: 10))
  circle((0.35, 2.6), radius: 0.05, fill: rgb("#1f5791"), stroke: (paint: rgb("#1f5791"), thickness: 0.4pt, miter-limit: 10))
  circle((4.75, 2.6), radius: 0.05, fill: rgb("#1f5791"), stroke: (paint: rgb("#1f5791"), thickness: 0.4pt, miter-limit: 10))
  content((2.55, 3.6), [#text(fill: rgb("#a53a25"))[#text(size: 9pt)[four red points#linebreak()$| lambda_i|<0.01$]]])
  content((2.55, 1.45), [#text(fill: rgb("#1f5791"))[#text(size: 9pt)[two blue points: $| lambda_i|>4$]]])
  content((2.55, 0.45), [#text(size: 9pt)[$C arrow.r.long bb(P)^1_( lambda )$#linebreak()double cover branched at these points]])
  content((9.15, 4.55), [#text(size: 9pt)[One pencil and its couplings]])
  circle((9.15, 2.25), radius: 2.05, stroke: (paint: rgb("#999999"), thickness: 0.6pt, miter-limit: 10))
  line((11.15, 1.789), (7.153, 2.711), stroke: (paint: rgb("#a53a25"), thickness: 0.8pt, miter-limit: 10))
  line((11.2, 2.107), (7.105, 2.393), stroke: (paint: rgb("#a53a25"), thickness: 0.8pt, miter-limit: 10))
  line((11.2, 2.393), (7.105, 2.107), stroke: (paint: rgb("#a53a25"), thickness: 0.8pt, miter-limit: 10))
  line((11.15, 2.711), (7.153, 1.789), stroke: (paint: rgb("#a53a25"), thickness: 0.8pt, miter-limit: 10))
  line((9.576, 4.255), (8.724, 0.2448), stroke: (paint: rgb("#1f5791"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((8.724, 4.255), (9.576, 0.2448), stroke: (paint: rgb("#1f5791"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((7.37, 1.233), (7.37, 3.267), stroke: (thickness: 1.0pt, miter-limit: 10))
  line((10.93, 1.233), (10.93, 3.267), stroke: (thickness: 1.0pt, miter-limit: 10))
  circle((10.93, 1.839), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((7.37, 2.661), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((10.93, 2.126), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((7.37, 2.374), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((10.93, 2.374), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((7.37, 2.126), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((10.93, 2.661), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((7.37, 1.839), radius: 0.06703, fill: rgb("#a53a25"), stroke: none)
  circle((9.15, 2.25), radius: 0.07056, fill: black, stroke: none)
  content((9.15, 1.968), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$L_z$]]])], anchor: "north")
  content((7.37, 1.092), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$z_1=-c$]]])], anchor: "north")
  content((10.93, 1.092), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$z_1=c$]]])], anchor: "north")
  content((10.01, 3.89), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(fill: rgb("#1f5791"))[#text(size: 9pt)[blue]]]])])
  content((10.07, 2.82), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(fill: rgb("#a53a25"))[#text(size: 9pt)[red]]]])])
  content((9.15, -0.3), [#text(size: 9pt)[$z_2= lambda_i z_1$]])
})],
  caption: [Figure 2: The finite arrangement in one coordinate pair. Left: a schematic placement of the six branch points on the real direction axis, grouped into four red circles and two blue squares. Right: the slice $w = 0$, $z_1 \, z_2 in bb(R)$ of the $z$ pencil in the ball; solid red slopes meet both coupling hyperplanes, whereas dashed blue slopes meet neither. The red angular separation is exaggerated to show these incidences. The center represents the slice of $L_z$. The $w$ family is an identical construction in the other coordinate pair; the full arrangement lies in complex dimension four. ],
) <fig:arrangement>

=== 4.2 Exact models in congruence quotients <geo:separation>

The arithmetic lattice theorem of Borel–Harish-Chandra #cite(label("BorelHarishChandra1962")) Corollary 12.4, applied to (4.3), gives a cocompact arithmetic lattice of simplest type in $upright("PU") \( 4 \, 1 \)$. Indeed all the other archimedean factors are compact, and the form is anisotropic over $E$: a nonzero $E$-rational isotropic vector would remain isotropic at a definite conjugate embedding. Torsion-free principal congruence subgroups therefore give compact complex hyperbolic manifolds, which are projective by the Baily–Borel theorem #cite(label("BailyBorel1966")) Theorem 10.11. One can also obtain projectivity from the positive canonical bundle of a compact ball quotient. We use principal congruence subgroups normalized by $sigma$, and may take their levels arbitrarily deep. These standard arithmetic facts are recalled in #cite(label("StoverToledo")) Section 3.1.

Fix positive normal vectors $n_i in E^5$ for the members of $cal(D)$, scaled to have integral coordinates. We always label a translate of the $i$th hyperplane by $i$, and use the prescribed normal $gamma n_i$ for its translate by $gamma$. Congruence subgroups may be chosen to avoid the finite scalar kernel of the projective action.

#thm([Proposition 4.1.])[
  (Exact local arrangements).  #emph[Given $W > 0$ and $R_0 > 0$, there is a torsion-free principal congruence subgroup $Gamma_0$, normalized by $sigma$, with the following properties. Let $cal(A)_0$ be the union of all $Gamma_0$-translates of the labeled hyperplanes of $cal(D)$.]
  + #emph[The arrangement $cal(A)_0$ is locally finite. The hyperplanes meeting any ball of radius $W$ have distinct labels and are carried to the corresponding subarrangement of $cal(D)$ by a holomorphic isometry induced by a unitary map sending each prescribed translated normal to its prototype normal.]
  + #emph[The injectivity radius of $Gamma_0 without bb(B)$ is greater than $R_0$.]
  + #emph[In the ball of radius $R_0$ about $o$, the arrangement is exactly $cal(D)$ restricted to that ball. The analogous assertion holds in every $Gamma_0$-translate of this ball.]
  #emph[All these conclusions concerning the lifted arrangement remain valid on any subsequent finite cover of $Gamma_0 without bb(B)$, provided one uses the full inverse image of the arrangement.]
] <prop:arrangement-local>

#proof[
  First fix a radius $W$ and a finite collection of hyperplanes meeting a $W$-ball. At its viewpoint, represented by a unit negative vector $x$, the distance to the hyperplane with positive normal $n$ satisfies
  $ sinh d \( x \, H_n \) = frac(\| h \( n \, x \) \|, sqrt(h \( n \, n \))) . $
  For a normal of one of our finitely many fixed lengths, intersection with the $W$-ball bounds $\| h \( n \, x \) \|$. Write $n = n_(+) + alpha x$ with $n_(+) in x^perp$. Since
  $ h \( n_(+) \, n_(+) \) = h \( n \, n \) + \| alpha \|^2 \, $
  the positive component is bounded as well. Cauchy–Schwarz in $x^perp$ now bounds every Gram entry of two normals visible from this ball, by a constant depending only on $W$ and their labels.
  At every other archimedean place, definiteness and the fixed normal lengths bound the same Gram entries. All entries belong to one fixed fractional ideal of $E$. Its image under the archimedean embeddings is a lattice, so only finitely many Gram entries satisfy these bounds. If $gamma \, gamma'$ are in a sufficiently deep integer principal congruence subgroup, then
  $ h \( gamma n_i \, gamma' n_j \) equiv h \( n_i \, n_j \) $
  modulo the level, in this fractional ideal. Choose the level to separate all the finitely many possible nonzero differences. We obtain exact equality:
  #[#set math.equation(numbering: n => "(4.6)")
   $ h \( gamma n_i \, gamma' n_j \) = h \( n_i \, n_j \) $ <geo:gram>]
  whenever the corresponding hyperplanes are visible together.
  Here equality of Gram matrices gives the asserted isometry even for dependent collections. Every $E$-rational subspace of $E^5$ is nondegenerate for $h$: a nonzero radical, being defined by linear equations over $E$, would persist at a definite embedding. Consequently the kernel of a Gram matrix is exactly the relation space of its vectors. Equality (4.6) thus defines an isometry between their spans, which extends to a unitary isometry of the ambient Hermitian space. Its projectivization is a holomorphic ball isometry. Two visible copies of the same label must in fact have the same normal: their difference has norm zero by (4.6), and anisotropy over $E$ makes that difference zero. Two different labels cannot coincide, since this would contradict equality of their relation spaces with those of the distinct prototypes.
  Local finiteness follows from the same boundedness argument applied to normals themselves at a fixed viewpoint. The normals have integral coordinates; their distinguished components are bounded by the distance bound and their conjugate components by definiteness. Only finitely many can meet a fixed bounded ball.
  To obtain exact agreement at $o$, choose an auxiliary ball about $o$ large enough to contain the prescribed $R_0$-ball and to meet every prototype hyperplane. Apply the Gram argument to this ball. The prototype normals span $E^5$: the slope normals span the four positive coordinate directions, and a coupling normal supplies the last homogeneous direction. An additional translated normal visible in this ball has, by (4.6), the same inner products with this spanning set as its prototype. It therefore equals that prototype. This proves the third assertion.
  Finally fix a torsion-free congruence subgroup in advance and a compact fundamental set for its action on $bb(B)$. A group element moving a point of this set a bounded distance belongs to a finite set. A nested sequence of normal principal congruence subgroups has trivial intersection, after the scalar kernel has been removed. Deep enough levels avoid every nonidentity element of the finite set. Normality allows an arbitrary viewpoint to be moved into the compact fundamental set without changing subgroup membership. This proves the required uniform lower bound on injectivity radius. Increasing the level accommodates all the preceding requirements simultaneously. Passing to a subgroup preserves them when the arrangement is pulled back in full. ◻
]

We next record the consequences for the divisors and centers that we will blow up. In $M_0 = Gamma_0 without bb(B)$, each label gives a closed embedded smooth totally geodesic divisor, possibly disconnected. Its lifts are locally finite and have disjoint sheets by Proposition 8. The divisors are algebraic because $M_0$ is projective.

Within one family the intersection centers have complex codimension two. A center is either a common intersection of at least two slopes, or an intersection of a red slope with a coupling hyperplane. At a slope center only a subset of the six slopes may occur. The subset is constant along a connected center: if another slope meets it, the local model shows that it contains the intersection, and the containment extends along its lifts. Distinct centers within one family are disjoint; otherwise all participating hyperplanes would be visible near a point of intersection, contradicting the prototype pattern. Coincident centers are counted once. Thus these centers are closed embedded smooth subvarieties. Centers from different families have the product structure already described. These assertions apply to the full pulled-back arrangement after any finite cover.

=== 4.3 Two global sign covers <geo:signs>

For the later local models we need global parity characters on the arrangement complement. We obtain these from the following theorem of Stover–Toledo, in the form stated by Llosa Isenrich–Py #cite(label("LlosaPy")) Theorem 4.2; see also #cite(label("StoverToledo")).

#thm([Theorem 4.2.])[
  (Virtual cyclic ramified covers).  #emph[Let $M_0$ be a compact ball quotient of complex dimension at least two by a torsion-free congruence arithmetic lattice of simplest type. Let $D$ be a nonempty totally geodesic divisor whose components are smooth, embedded, and pairwise disjoint. For every integer $d gt.eq 2$ there is a finite unramified cover $M_1 arrow.r M_0$ such that $M_1$ admits a cyclic cover of degree $d$, branched over the full inverse image of $D$.]
] <geo:stover-toledo>

Apply Theorem 9 with $d = 2$ to each of the sixteen label divisors separately, on the initial congruence quotient $M_0$. Each application satisfies the disjoint-component hypothesis. We do not apply the theorem to the union of the intersecting divisors. Take a common finite unramified cover of the resulting base covers. The sum, in $bb(Z) \/ 2$, of the eight characters for the $z$ labels gives a character $chi_z$ on the complement of the $z$ arrangement. It has value one on a meridian of every $z$ hyperplane. Pull it back to the complement of both families. The same procedure gives a $w$ character. Subsequent finite covers need not be congruence: every use of Theorem 9 has already taken place on $M_0$.

We arrange equivariance before fixing the signs. First intersect the finitely many $sigma$-conjugates of the subgroup defining our common cover, so that $sigma$ acts on it. Since $sigma^2$ preserves the $z$-family, the character

$ delta = chi_z + sigma^(2 *) chi_z $

is zero on all meridians. The kernel of the map from the fundamental group of a divisor complement to that of the ambient smooth variety is normally generated by meridians. Hence $delta$ factors through the fundamental group of the compact ball quotient. Pass to a further finite cover by intersecting the kernel of this character with its $sigma$-conjugates. On that cover the pulled-back $z$ character satisfies $sigma^(2 *) chi_z = chi_z$. Define

#[#set math.equation(numbering: n => "(4.7)")
 $ chi_w = sigma^(*) chi_z . $ <geo:sign-equivariance>]

Then $sigma$ exchanges the two characters. They have the prescribed meridian values in their respective families, and each is defined using only that family.

Write $M = Gamma without bb(B)$ for this final finite cover, still with the full pulled-back arrangement. The image of $o$ in $M$, also denoted $o$, is fixed by $sigma$. It is an isolated component even of the fixed locus of $sigma^2$, because the derivative of $sigma^2$ at $o$ is $- "id"$. No assertion of this kind is needed for the other fixed loci of the symmetry on $M$.

=== 4.4 Filling the arrangement <geo:fill>

Blow up all intersection centers within the $z$-family, and then the transforms of those within the $w$-family. Product coordinates show that the operations for the two families commute. The branch rule for the $z$ character is as follows. Every strict transform of a $z$ hyperplane is a branch divisor of order two. If $k$ such hyperplanes pass through a center, its exceptional meridian is the product of their meridians, and therefore has sign $k med mod med 2$. Accordingly the exceptional divisor is branched precisely when $k$ is odd. In that case blow up each meeting of this exceptional divisor with a strict transform of a hyperplane. The two meeting divisors both have sign one; their new exceptional divisor has sign zero. The branch components within this family are now smooth and disjoint. Apply the identical rule to the $w$ character. This prescription includes partial pencils. In particular an ordinary red–coupling pair has $k = 2$, so its first exceptional divisor is unbranched.

Let $hat(M)$ denote the resulting smooth projective base. Extend the two sign covers from the complement by normalization over $hat(M)$, and take them together. Finite topological covers of smooth complex algebraic varieties algebraize, and normalization in the resulting finite extensions gives finite algebraic covers; thus this procedure is projective. Locally along a branch divisor the normalization is the smooth double-cover model $t = u^2$. Branch divisors within a family are disjoint, and across the families the local equations and the two signs are independent. Their combined normalization is therefore smooth, including at crossings, where it has product equations $\( t_1 \, t_2 \) = \( u_1^2 \, u_2^2 \)$. We obtain a smooth projective variety

#[#set math.equation(numbering: n => "(4.8)")
 $ V arrow.r hat(M) $ <geo:V>]

with deck group $\( bb(Z) \/ 2 \)^2$. It is connected: a meridian at a general point of a $z$ divisor has sign $\( 1 \, 0 \)$, and a meridian at a general point of a $w$ divisor has sign $\( 0 \, 1 \)$, so the combined monodromy is surjective.

Near $o$ all six slopes in each pencil occur and the coupling hyperplanes are absent after the neighborhood has been made small. The blowups are the product of the blowups of the two coordinate planes at their origins. The exceptional fiber of $hat(M) arrow.r M$ is $bb(P)^1 times bb(P)^1$. Each exceptional line has six branch markings and has even meridian sign. Its inverse image in $V$ is consequently

#[#set math.equation(numbering: n => "(4.9)")
 $ F_(*) = C times C . $ <geo:Fstar>]

Put

$ L = pi^(*) cal(O)_(bb(P)^1) \( - 1 \) \, #h(2em) N = N_(F_(*) \/ V) = "pr"_1^(*) L xor "pr"_2^(*) L . $

In fact a neighborhood of $F_(*)$ has the product line-bundle description provided by these two tautological lines. Indeed, in each factor, after the unbranched radial disks have been filled, their disk bundle retracts onto its zero section. Away from the six marked directions its cover is thus pulled back from the direction line. Normalization gives the six-branch cover in that direction variable, with the radial line bundle pulled back unchanged.

The equivariance (4.7) makes the kernel of the combined sign character invariant, so $sigma$ lifts on the complement. The equivariant blowups and normalization extend the lift to an automorphism $s$ of $V$. Its restriction to $F_(*)$ exchanges the two copies of $C$, possibly followed by either hyperelliptic deck involution. Composing with a deck transformation makes this restriction the pure swap. To determine the lift in the whole local model, note that $u \, v$ are actual tautological vectors: the covering map in these coordinates is

$ \( p \, q \; u \, v \) mapsto \( pi \( p \) \, pi \( q \) \; u \, v \) . $

The pure swap determines the lifted direction maps on the connected local cover. Since the base map sends the radial vectors to $\( v \, - u \)$, there is no further radial multiplier. Thus

#[#set math.equation(numbering: n => "(4.10)")
 $ s \( p \, q \; u \, v \) = \( q \, p \; v \, - u \) . $ <geo:line-action>]

Its fourth power is a deck transformation fixing $F_(*)$ pointwise, so $s^4 = 1$; a nonidentity element of $\( bb(Z) \/ 2 \)^2$ does not fix $C times C$ pointwise. Its square is the identity on $F_(*)$ and is multiplication by $- 1$ on both normal lines.

=== 4.5 An ordinary neighborhood of the distinguished fiber <geo:resolution>

The quotient stack $\[ V \/ chevron.l s chevron.r \]$ is a smooth proper orbifold with projective coarse space, but a surface mapping into its distinguished fiber would meet stabilizers. We now replace just that fiber by an ordinary smooth resolution. Retaining the quotient stack elsewhere allows all other fixed loci to be left in place.

First blow up $F_(*)$ in $V$, and take the coarse quotient by $chevron.l s^2 chevron.r$. The exceptional divisor is

#[#set math.equation(numbering: n => "(4.11)")
 $ P = bb(P)_(F_(*)) \( N \) \, $ <geo:P>]

where projectivization parametrizes lines. Before taking the quotient, $s^2$ acts trivially on $P$ and as $t mapsto - t$ on its transverse coordinate. The quotient is thus smooth near $P$, with transverse coordinate $t^2$.

The residual involution induced by $s$ has fixed points near $P$ only in $P$: away from the fiber, a fixed point would project to a nontrivial fixed point of the symmetry near $o$ in $M$. Its fixed points in $P$ project to the diagonal of $C times C$. On the projective normal line over that diagonal, it acts by

$ \[ u : v \] mapsto \[ v : - u \] . $

There are exactly two eigensections, with eigenvalues $i$ and $- i$ before projectivization. These give two disjoint smooth fixed curves. On the three normal directions to either curve the involution acts by $- 1$: one direction is antisymmetric in the base, one is tangent to the projective fiber, and the transverse coordinate to $P$ has eigenvalue $\( plus.minus i \)^2 = - 1$. Blow up both fixed curves and take the coarse quotient by the residual involution. This quotient is smooth near the distinguished fiber. Indeed, for the linear local model

$ \( x \, t_1 \, t_2 \, t_3 \) mapsto \( x \, - t_1 \, - t_2 \, - t_3 \) \, $

blowing up the fixed curve ${ t_1 = t_2 = t_3 = 0 }$ makes the action a reflection in the coordinate normal to the exceptional divisor, and the coarse quotient is smooth. Finite-order holomorphic actions are locally linearizable, so this model applies.

All centers just used are closed and lie over $o$. The blowups and finite coarse quotients can therefore be performed globally, producing a projective coarse space $S_0$ which modifies $V \/ chevron.l s chevron.r$ only over $o$. The intermediate coarse spaces may retain quotient singularities elsewhere; the preceding calculation establishes smoothness on a neighborhood of the distinguished fiber. To form $cal(S)$, use this smooth scheme near that fiber and use $\[ V \/ chevron.l s chevron.r \]$ away from it. This is an algebraic gluing. More explicitly, in $M$ remove all components of the nontrivial fixed loci other than the isolated point $o$, and take the resulting invariant Zariski neighborhood. Outside $o$ in this neighborhood the action is free, so both constructions restrict to the same ordinary quotient. Their gluing is a smooth connected effective orbifold $cal(S)$ with coarse space $S_0$. The map $cal(S) arrow.r S_0$ is separated and proper: these properties are local on $S_0$, where it is either the coarse map of a finite-group quotient stack or the identity. Since $S_0$ is projective, $cal(S)$ is separated and proper over $bb(C)$. In particular the whole distinguished fiber lies in the ordinary smooth locus of $cal(S)$.

=== 4.6 The surface mapping into the ordinary fiber <geo:surface>

Let $A = "Jac" \( C \)$. For a genus-two curve, the Abel map

$ "Sym"^2 C arrow.r "Pic"^2 \( C \) tilde.eq A $

is the blowup at the canonical class, after choosing the displayed translation. To recall the geometry, Riemann–Roch gives a unique effective divisor in every degree-two class except $K_C$; the latter has the pencil $E_C = \| K_C \| tilde.eq bb(P)^1$. For the degree-two quotient $q : C times C arrow.r "Sym"^2 C$, the inverse image of $E_C$ is the graph $Gamma_iota$ of the hyperelliptic involution. The map $q$ is generically unramified along this graph, so $q^(*) E_C = Gamma_iota$ as divisors; ramification at its six diagonal points does not change the generic multiplicity. The projection formula gives

$ 2 E_C^2 = \( q^(*) E_C \)^2 = Gamma_iota^2 = 2 - 2 g \( C \) = - 2 . $

The Abel map is therefore a birational morphism between smooth surfaces with one exceptional $\( - 1 \)$-curve, and is the stated point blowup.

Choose a nonzero rational section $tau$ of $L$. On the open subset of $C times C$ where both values are defined and nonzero, put

#[#set math.equation(numbering: n => "(4.12)")
 $ \( p \, q \) mapsto \[ tau \( p \) \, i tau \( q \) \] in P . $ <geo:rational-section>]

This section is equivariant for swapping the two factors and the involution on $P$. Indeed (4.10) gives

$ \[ tau \( p \) \, i tau \( q \) \] mapsto \[ i tau \( q \) \, - tau \( p \) \] = \[ tau \( q \) \, i tau \( p \) \] . $

Away from the diagonal it avoids the two fixed curves, and thus gives a rational map from $"Sym"^2 C$ to the smooth resolution constructed above. All the bundles and maps in this description are algebraic: the normal-bundle identification is algebraic as well as analytic, by GAGA on the projective fiber. Resolve the rational map by a finite sequence of point blowups of its smooth projective source, using the projective coarse space as target. The resolved image remains in its closed distinguished fiber, where the coarse space agrees with the ordinary locus of $cal(S)$. We therefore obtain a morphism

#[#set math.equation(numbering: n => "(4.13)")
 $ f : Y arrow.r cal(S) $ <geo:Ymap>]

whose image lies entirely over $o$. Thus $Y$ is an iterated point blowup of the simple abelian surface $A$, and $f \( Y \)$ lies in the ordinary locus.

#thm([Proposition 4.3.])[
  (The geometric construction).  #emph[After any prescribed finite lower bounds on the arrangement radii and injectivity radius, the construction above gives a smooth connected proper effective orbifold $cal(S)$ with projective coarse space, a simple abelian surface $A = "Jac" \( C \)$, an iterated point blowup $Y arrow.r A$, and a morphism $f : Y arrow.r cal(S)$ with image in its ordinary locus. The distinguished fiber is obtained from the product $C times C$, its normal bundle $"pr"_1^(*) L xor "pr"_2^(*) L$, and the action (4.10) by the explicit blowups and coarse quotients above. Away from that fiber the orbifold is $\[ V \/ chevron.l s chevron.r \]$, with $V$ given by the two parity covers and the filling rules of Section 4.4.]
] <prop:orbifold-surface>

All parameters used in the finite arrangement have now been fixed. The depth of $Gamma_0$ has not: Proposition 8 permits its choice after the constants required for the finite-model graphs in the next section. Passing to the finite covers which produce the signs preserves these estimates. This order of choices will allow the local calculations to establish

$ "im" \( f_(*) : pi_1 \( Y \) arrow.r pi_1 \( cal(S) \) \) tilde.eq bb(Z) . $

== 5 Local covers and hyperbolic path graphs <sec:models>

The geometric construction gives relations among the loops in the surface. To show that these relations leave an element of infinite order, we will read paths in auxiliary covers of finite arrangements. This section constructs those covers and proves the two properties needed for Lemma 5: their kernels agree on sufficiently buffered overlaps, and their path graphs are uniformly hyperbolic. All constants in this section depend only on the finite arrangement $cal(D)$. In particular, they are fixed before choosing the arithmetic level.

=== 5.1 Dihedral labels on a finite arrangement <dihedral-labels-on-a-finite-arrangement>

For a subset $T subset.eq cal(D)$, set

$ U_T = bb(B) \\ union.big_(H in T) H . $

There are characters $epsilon.alt_z \, epsilon.alt_w : pi_1 \( U_T \) arrow.r bb(Z) \/ 2$, with $epsilon.alt_z$ equal to one on a meridian of a $z$ hyperplane and zero on a meridian of a $w$ hyperplane, and conversely for $epsilon.alt_w$. One can define each character by the parity of the winding number of the product of defining affine equations of the hyperplanes in its family. Let $E_T arrow.r U_T$ denote the associated four-sheet cover; it may be disconnected. These signs restrict canonically to any ball patch, up to a choice of sheets. Indeed, meridians normally generate the complement group in a simply connected ball, as is seen by filling a loop with a disk transverse to the hypersurfaces. Thus their values determine a sign character there.

We refine these signs using the infinite dihedral group

$ D_oo = chevron.l r \, b divides r^2 = b^2 = 1 chevron.r \, #h(2em) epsilon.alt \( r \) = epsilon.alt \( b \) = 1 . $

Its even subgroup is the infinite cyclic translation subgroup $chevron.l r b chevron.r$. Conjugation in $D_oo$ preserves this subgroup and changes its integer coordinate at most by a sign.

We first construct $q_z : pi_1 \( U_T \) arrow.r D_oo$. The construction ignores all $w$ hyperplanes. If $T$ contains fewer than all six $z$ slope hyperplanes, define

$ q_z \( gamma \) = r^(epsilon.alt_z \( gamma \)) . $

Suppose instead that the whole $z$ pencil is present. With only its six hyperplanes removed, projection to the direction $lambda = z_2 \/ z_1$ gives a map to the six-punctured projective line. Choose its standard meridians so that the four red punctures occur first, based together in a small red disk, and the two blue punctures occur last. Assign $r$ to each red meridian and $b$ to each blue meridian. The sphere relation is respected because $r^4 b^2 = 1$. We fix this choice of the direction-line representation once, and use the same choice for every complete pencil and for both families.

It remains to add the coupling hyperplanes that belong to $T$. They lie over the red-direction disk: on $z_1 = plus.minus c$ in the ball,

$ \| lambda \| < 0.7 . $

Over $\| lambda \| < 1.5$, the pencil local system has a reduction of structure group to $chevron.l r chevron.r$. In this reduction, multiply its transition functions by the two-sheet systems defined, for the coupling hyperplanes that are present, by

#[#set math.equation(numbering: n => "(5.1)")
 $ \( 1 - z_1 \/ c \)^(1 \/ 2) \, #h(2em) \( 1 + z_1 \/ c \)^(1 \/ 2) . $ <mod:coupling-functions>]

This means adding their winding parities to the exponent of $r$. Over $\| lambda \| > 1$ one has $\| z_1 \| < c$, so both systems in (5.1) have the distinguished trivializations obtained by the branch of the square root near $1$. These trivializations identify the modified system with the unmodified pencil system on $1 < \| lambda \| < 1.5$. They therefore glue the two systems. This constructs $q_z$, up to conjugacy, on all of $U_T$. Its parity is $epsilon.alt_z$: this is true on every meridian, and meridians normally generate. Interchanging $z$ and $w$ gives $q_w$.

On each component of $E_T$, both representations take values in translations. Choose integer coordinates on the translation groups and write the resulting homomorphisms as

$ ell_z \, ell_w : pi_1 \( E_T \) arrow.r bb(Z) . $

The notation is componentwise. Their individual kernels are independent of conjugating the dihedral representations or changing sheets. The signs of the integer coordinates are immaterial until we form a sum in the central model.

For each $T$, apply the intersection-center blowups, parity branching, and normalization of Section 4.4 to the arrangement $T$ in $bb(B)$ and its sign cover $E_T$. The resulting smooth space is its #emph[filled finite model].

#thm([Lemma 5.1.])[
  #emph[The homomorphisms $ell_z$ and $ell_w$ extend across the blowups and branched fillings of the finite model prescribed in Section 4.4.]
] <mod:extension>

#proof[
  It suffices to check the meridians of the divisors being added to the sign cover. Removing subsets of complex codimension at least two does not change the fundamental group of a smooth manifold, and adding a smooth divisor kills its meridian. These assertions follow by general position for paths and disks, so they also apply to the successive local modifications here.
  For an incomplete $z$ pencil, $q_z$ is the sign character in $chevron.l r chevron.r$; hence $ell_z$ is already zero on the sign cover. For a complete pencil, a meridian of the exceptional divisor over $L_z$ circles the common intersection at a fixed direction. Its image under direction projection is constant, and the coupling systems trivialize near $L_z$. Its $q_z$ label is therefore the identity. At an intersection of a coupling hyperplane with a red slope hyperplane, the two local meridians both have label $r$ in the same reduction. The meridian of their exceptional divisor is the product of these two meridians, and its label is $r^2 = 1$. Every meridian that is filled after branching of order two is the square of a meridian with reflection label, so again has trivial label. These are all the complete-pencil centers. The additional blowups needed for odd partial pencils cause no difficulty, since the label on the corresponding sign cover is zero. The $w$ calculation is identical, and intersections involving both families are products of these local calculations. Thus both labels kill every required meridian. ◻
]

=== 5.2 The sum cover at the distinguished fiber <the-sum-cover-at-the-distinguished-fiber>

For the full model $T = cal(D)$, let $overline(E)$ denote its filled sign cover. Its fiber over $o$ is $F_(*) = C times C$, and it has the lift $s$ of $sigma \( z \, w \) = \( w \, - z \)$ described in Section 4. On $F_(*)$, the action of $s$ interchanges the factors. The first translation label is nonzero on the first factor and zero on the second; the reverse holds for the second label. For example, the product of one red and one blue meridian has even parity and label $r b$, so its lift to $C$ gives a nonzero translation. This calculation on $F_(*)$ agrees with that on the complement: push a representative path slightly in a nonzero normal direction, keeping its directions away from the branch points. The coupling square roots are trivial there.

To pass from this filled model to the resolved distinguished fiber, we need an ordinary covering across the fixed points of the coarse quotient. The descent argument below will achieve this by making the lifted symmetry commute with deck translations. We will orient the two labels so that their sum is $s$-invariant.

The construction of $q_z$ is unchanged under $z mapsto - z$, with the two coupling hyperplanes interchanged. Indeed this map fixes the direction $lambda$, interchanges the functions in (5.1), and preserves their distinguished trivializations. The analogous statement holds for $w$. Consequently $s$ interchanges the two translation homomorphisms up to signs. Orient them by the preceding comparison on $F_(*)$ so that

$ ell_z compose s_(*) = ell_w \, #h(2em) ell_w compose s_(*) = ell_z . $

The nonzero restrictions to the two factors determine these signs. In particular the homomorphism

#[#set math.equation(numbering: n => "(5.2)")
 $ ell = ell_z + ell_w : pi_1 \( overline(E) \) arrow.r bb(Z) $ <mod:sum-label>]

is $s$-invariant.

#thm([Lemma 5.2.])[
  #emph[The regular covering associated with $ker ell$ admits an order-four lift of $s$ commuting with its deck translations. Its quotient by this lift is an ordinary topological covering of the coarse space $overline(E) \/ chevron.l s chevron.r$. Consequently it pulls back to a covering of the resolution used over the distinguished fiber.]
] <mod:central>

#proof[
  Choose an $s$-fixed point of $F_(*)$, for example a point on its diagonal, and a point above it in the $ker ell$ cover. Invariance of $ell$ gives a unique lift $hat(s)$ fixing this point. Since $s^4 = 1$, its fourth power is a deck transformation fixing a point, hence is the identity. Its order is four because it projects to $s$. Invariance of the integer label also says that conjugation by $hat(s)$ acts trivially on the deck group.
  For descent to a topological cover, consider a point fixed by a subgroup $H subset.eq chevron.l s chevron.r$. On the fiber over that point, the lifted $H$ action commutes with deck translations, and therefore acts by translations of this integer torsor. Each such translation has finite order because the lift is an action of the finite group $chevron.l s chevron.r$. It is thus the identity. Choose a sufficiently small invariant neighborhood at the point on which the original cover is trivial. The stabilizer acts trivially on the discrete factor, so its quotient is again a product with that factor. Translating these neighborhoods under the finite group proves that the quotient map is a covering. Pullback of a covering along the resolution map remains a covering. ◻
]

The model using both kernels will be called an #emph[individual model]. The full model using the sum kernel and then the lifted $s$ quotient will be called the #emph[central model]. The distinction is essential: the sum is used only near a distinguished fiber.

=== 5.3 How kernels compare on bounded balls <how-kernels-compare-on-bounded-balls>

Before constructing graph metrics, we prove that these local labels can be compared without a global coloring of the arithmetic arrangement. There are two possible sources of disagreement: normal-matching isometries may not be unique, and a larger chart may contain hyperplanes absent from a smaller one.

First suppose the prescribed normal vectors of a complete pencil have been matched as in Proposition 8. Two distinct slope normals span its positive normal plane and specify its two coordinate functionals, hence the ratio $z_2 \/ z_1$. Thus the direction-line local system is independent of the choice of an isometry extending the normal match. If a coupling normal is also matched, its homogeneous linear equation, together with those two functionals, specifies the ratio $z_1 \/ c$. Explicitly, if $X_1$ is the first coordinate functional, $T_0$ is the last homogeneous coordinate, and $F_c = X_1 - c T_0$ defines the positive coupling hyperplane, then

$ z_1 \/ c = frac(X_1, c T_0) = frac(X_1, X_1 - F_c) . $

The negative coupling gives the same conclusion with the signs reversed. The gluing rule (5.1) is therefore intrinsic to these matched data as well. The corresponding assertions hold for the $w$ family. Under $sigma$, the two families are interchanged and the $w$ coordinates are negated. If the chosen representative of a relabeled normal differs by a scalar, use that same scalar on both sides of the match. The resulting coordinate ratios transform as just described, so the individual kernels are carried to the corresponding individual kernels. This is the equivariance needed below; it does not require a globally chosen orientation of a translation label.

Next, consider a coupling hyperplane absent from a metric ball $Q$. A metric ball in the ball model is a Euclidean ellipsoid and is convex. Its $z_1$ image is therefore convex and avoids the relevant value $c$ or $- c$. On that image the corresponding function in (5.1) has a single-valued square root. Where the image meets $\| z_1 \| < c$, choose its sign to agree with the distinguished square root. The intersection is convex, so one choice works throughout it. If the intersection is empty, there is no overlap requiring a prescribed sign. This trivializes the extra coupling system compatibly with the red-disk gluing. Hence including or omitting a coupling hyperplane missing $Q$ gives isomorphic label systems on $Q$.

#thm([Lemma 5.3.])[
  #emph[For every $R > 0$ there is $B_1 \( R \)$ with the following property. In any finite model with a complete $z$ pencil, if a loop in the sign cover projects into $B \( x \, R \)$ and has nonzero $z$ translation, then 
$ "dist" \( x \, L_z \) lt.eq B_1 \( R \) . $

 The analogous assertion holds for $w$. The same bounds hold if the loops must avoid any additional analytic subsets.]
] <mod:buffer-bound>

#proof[
  If the ball meets at most one hyperplane of the relevant family, its complement for that family has trivial or cyclic fundamental group generated by the one meridian. One way to see the latter assertion is to use the convexity of the ball and a transverse complex coordinate for the hyperplane: its projection has an ellipse as image, and the centers of the convex fibers give a continuous section. The complement thus has the homotopy type of a punctured ellipse. Thus its dihedral image lies in a conjugate of an order-two subgroup. It has zero translation on the sign lift. Omitting hyperplanes from the other family does not alter this conclusion, because the representation factors through the complement of the relevant family.
  If two distinct slope hyperplanes meet $B \( x \, R \)$, take a unit negative homogeneous vector representing $x$. Its inner products with their fixed positive normals are bounded in terms of $R$: for a normal $n$ the normalized absolute inner product is $sinh "dist" \( x \, H_n \)$. The two normals form a basis of the positive normal plane of $L_z$. Their inner-product bounds therefore bound the positive projection of $x$ onto that plane, and hence bound $"dist" \( x \, L_z \)$. There are only finitely many pairs of normals, so this bound is uniform.
  For the remaining case, suppose toward a contradiction that there are balls supporting nonzero translation whose centers leave every bounded neighborhood of $L_z$. After passing to a subsequence, at least one fixed coupling hyperplane meets each ball: otherwise the preceding two cases apply. The centers tend to a boundary point $xi$, and a fixed-radius hyperbolic ball converges to the same boundary point as its center. Thus $xi$ belongs to the closure of that coupling hyperplane. The closures of the two coupling hyperplanes are disjoint. At $xi$ the direction coordinate is defined and lies strictly inside the red disk, since $z_1 = plus.minus c$ and the boundary estimate is uniform:
  $ \| z_2 \/ z_1 \| lt.eq sqrt(a - c^2) / c < sqrt(1 - 0.85^2) / 0.85 < 0.62 < 0.7 . $
  Eventually the whole ball lies over this red disk and misses the other coupling hyperplane. Its label system consequently reduces to $chevron.l r chevron.r$, contradicting the assumed nonzero translation. This proves the bound. Restricting the class of allowed loops does not weaken it. ◻
]

#thm([Proposition 5.4.])[
  (Compatibility of kernels).  #emph[For every $R > 0$ there are constants $B \( R \) > R$ and $J_0 \( R \)$, depending only on $cal(D)$, with the following properties.]
  + #emph[Suppose two finite-model descriptions, with their prescribed normal matches, agree on all hyperplanes meeting $B \( x \, B \( R \) \)$. Identify their sign covers there by a fixed choice of sheets. On loops in this sign cover that project into $B \( x \, R \)$, their individual $z$ kernels agree and their individual $w$ kernels agree. More precisely, for each family the corresponding integer homomorphisms agree up to sign. The descriptions may include additional hyperplanes outside the buffered ball.]
  + #emph[In the full model, if $"dist" \( x \, o \) > J_0 \( R \)$, then on such loops 
$ ker \( ell_z + ell_w \) = ker ell_z ∩ ker ell_w . $

]
  #emph[Both statements remain valid after restricting the loops to avoid any further analytic subsets. The first statement is equivariant under the symmetry interchanging the families.]
] <prop:kernel-compatibility>

#proof[
  Choose $B \( R \) > R + B_1 \( R \) + 1$, enlarging it if needed to include the corresponding bound for both families. Use the subset of hyperplanes visible in the buffered ball as an intermediate description. If a larger description has an incomplete pencil, so does this subset, and both corresponding translation labels vanish. If the larger pencil is complete but the buffered pencil is not, a nonzero translation on an $R$-ball would, by Lemma 13, put its center within $B_1 \( R \)$ of the common pencil intersection. Since every slope hyperplane contains that intersection, all six slopes would then meet the buffered ball, a contradiction. Thus again both labels vanish on these loops. If both pencils are complete, the normal match fixes the direction-line system, and extra coupling hyperplanes can be omitted by the square-root trivialization just proved. The only remaining change is conjugation of a dihedral label, which changes a translation coordinate at most by sign. This proves the first assertion, including its equivariance and its compatibility with the chosen sign sheets.
  The sets
  $ { x : "dist" \( x \, L_z \) lt.eq B_1 \( R \) } \, #h(2em) { x : "dist" \( x \, L_w \) lt.eq B_1 \( R \) } $
  have bounded intersection. Indeed, in homogeneous coordinates the two normal planes together form the positive four-dimensional space. Bounds on both positive projections bound the distance from $o$. Choose $J_0 \( R \)$ beyond that intersection. Outside it, at least one of $ell_z \, ell_w$ vanishes on every loop over $B \( x \, R \)$, by Lemma 13. The displayed equality of kernels follows. Every argument concerns the same individual loops before and after imposing additional omissions, so those omissions preserve the conclusions. ◻
]

=== 5.4 Graphs defined by projected diameter <graphs-defined-by-projected-diameter>

We now turn the local covers into graphs to which the path lemma applies. Over each connected component of $E_T$, let $hat(E)_T$ be the connected regular cover defined by $ker ell_z ∩ ker ell_w$. For the full arrangement we also use the cover defined by $ker \( ell_z + ell_w \)$ and its lifted-$s$ quotient. Restrict all these covers to the open arrangement complement when defining graph vertices.

For $u > 0$, vertices are all points of the relevant covering space. An oriented edge is a parametrized continuous path whose projection to $bb(B)$ has diameter strictly less than $u$; its reverse is the reverse path. Multiple edges are retained. In the central case we take the quotient graph by $hat(s)$. The symmetry acts freely on the open arrangement complement, so edges out of a quotient vertex correspond bijectively to edges out of any chosen representative. Denote these graphs by $cal(G)_T \( u \)$, with $cal(G)_(upright("cen")) \( u \)$ for the central quotient.

The use of diameter has an important consequence. A word of arbitrary length in loops supported in one fixed bounded region can be one edge. It is this feature that prevents the unbounded translation labels from producing large flat regions in the graphs.

#thm([Proposition 5.5.])[
  (Hyperbolicity of the models).  #emph[There are $u > 0$ and $delta gt.eq 0$, depending only on $cal(D)$, such that every connected component of every $cal(G)_T \( u \)$ and of $cal(G)_(upright("cen")) \( u \)$ is $delta$-hyperbolic. The same $delta$ can be used if an arbitrary locally finite union of proper complex analytic subsets of $bb(B)$ is additionally omitted, with invariant omissions in the central case. On the vertices retained after such an omission, graph distances are unchanged.]
] <prop:model-hyperbolicity>

The proof has three parts. First, paths carrying arbitrary deck translations inside a fixed bounded region give bounded graph diameter over every bounded radial region. Next, an arrangement-preserving collar identifies the remaining vertices with points of a covering of the sphere complement, together with a radial coordinate; the angular diameter permitted by a graph edge decays exponentially with that coordinate. Finally, comparison with the cone graph defined below proves uniform hyperbolicity. No properness or local finiteness of the graphs is required.

#thm([Lemma 5.6.])[
  #emph[One can choose $u$, simultaneously for all the finite models, so that the vertices projecting into any fixed bounded radial region have bounded graph diameter within each connected component.]
] <mod:bounded-core>

#proof[
  The deck group over a component of $E_T$ is a subgroup of $bb(Z)^2$, or of $bb(Z)$ for the sum cover, and is finitely generated. At a basepoint choose loops representing a finite set of its generators. There are only finitely many sign sheets; also choose finitely many paths joining the sheets that belong to the same component. All these projected paths lie in a fixed bounded region. Choose $u$ greater than its diameter, for each of the finitely many models. An arbitrary word in the generator loops then defines a single edge. Thus all deck translates over a basepoint have uniformly bounded graph distance, including the finitely many sign choices.
  For a fixed radial bound, any point in the ball region can be joined to a chosen basepoint by a uniformly bounded chain of small balls. Within each ball, paths can avoid the finite complex hypersurface arrangement: its complement is path connected by general position. Choose successive junctions off the arrangement in the overlaps. The resulting paths have uniformly bounded edge count and lift to the covering. Any discrepancy in their terminal sheet is corrected using the preceding generator loops. This gives the asserted diameter bound. One can take the chain bound uniformly, for example by covering the compact closure of the radial region and a path to the basepoint by finitely many small balls with connected overlap graph. No positive lower bound on distance to the arrangement is needed. ◻
]

=== 5.5 The arrangement at the sphere at infinity <the-arrangement-at-the-sphere-at-infinity>

Rescale the ball to unit radius and write

$ x = tanh \( r \) xi \, #h(2em) \| xi \| = 1 . $

Let $Sigma$ be its unit sphere. Each affine intersection of the hyperplanes that reaches $Sigma$ is transverse to $Sigma$. Indeed its homogeneous Hermitian subspace is nondegenerate by the arithmetic normal-space property in the proof of Proposition 8. More explicitly, write an affine intersection as $a_0 + V_0$ with $a_0 perp V_0$. On its homogeneous span, the Hermitian form is

$ \| v \|^2 + \( \| a_0 \|^2 - 1 \) \| t \|^2 . $

Nondegeneracy excludes $\| a_0 \| = 1$, precisely the tangency case. If the intersection reaches the sphere, then $\| a_0 \| < 1$, and the intersection is transverse there. This also excludes intersections supported only on the boundary.

There is an arrangement-preserving product collar near $Sigma$. Here is a direct construction, including the estimate needed for the graph metric. At each $xi in Sigma$, choose a constant real vector tangent to all affine hyperplanes through $xi$ and with positive outward radial component. Transversality of their intersection supplies this vector. Use a small neighborhood missing every other hyperplane. A partition of unity combines these local vectors into a smooth vector field tangent to each hyperplane and transverse to the spheres. Normalize it so that the derivative of the Euclidean radius is one. Its flow yields, for $r gt.eq r_0$ with $r_0$ sufficiently large, diffeomorphisms between the ideal arrangement complement and the complement on the radius-$r$ sphere. They preserve all arrangement strata. Because the vector field is bounded on a compact collar, their angular displacement from the original ideal point is

#[#set math.equation(numbering: n => "(5.3)")
 $ O \( 1 - tanh r \) = O \( e^(- 2 r) \) quad upright("in Euclidean distance.") $ <mod:collar-shift>]

In the central model, average the field under $sigma$ before normalizing. This retains tangency and positive radial component and makes the collar equivariant. The collar lifts to each covering; the lifted end is a radial product with a possibly disconnected covering $I$ of the ideal complement.

On $Sigma$ use the metric

$ d_K \( xi \, eta \) = \| 1 - chevron.l xi \, eta chevron.r \|^(1 \/ 2) . $

For completeness, it satisfies the triangle inequality. If $a = d_K \( xi \, zeta \)$ and $b = d_K \( zeta \, eta \)$, then $\| xi - zeta \| lt.eq sqrt(2) a$ and $\| zeta - eta \| lt.eq sqrt(2) b$. Expanding the Hermitian inner product around $zeta$ gives

$ \| 1 - chevron.l xi \, eta chevron.r \| lt.eq a^2 + b^2 + \| xi - zeta \| thin \| eta - zeta \| lt.eq \( a + b \)^2 . $

Positivity and symmetry are immediate. In particular, (5.3) is an $O \( e^(- r) \)$ displacement in $d_K$.

The ball distance in our normalization satisfies

#[#set math.equation(numbering: n => "(5.4)")
 $ cosh d \( x \, y \) = frac(\| 1 - chevron.l x \, y chevron.r \|, sqrt(1 - \| x \|^2) sqrt(1 - \| y \|^2)) . $ <mod:ball-distance>]

Consequently, for points of radii $r + O \( 1 \)$, bounded hyperbolic distance is equivalent, with uniform constants, to angular $d_K$ distance $O \( e^(- r) \)$. To check both implications, write $x = rho xi$, $y = tau eta$, where $rho = tanh r$ and $tau = tanh r'$. Then

$ 1 - chevron.l x \, y chevron.r = 1 - rho tau + rho tau \( 1 - chevron.l xi \, eta chevron.r \) . $

The second parenthesis has nonnegative real part. Thus the absolute value is at least $rho tau d_K \( xi \, eta \)^2$ and at most $1 - rho tau + d_K \( xi \, eta \)^2$. For $\| r - r' \|$ bounded and both radii large, the denominator in (5.4) and $1 - rho tau$ are comparable to $e^(- 2 r)$. These inequalities prove the assertion. Conversely a bounded ball distance bounds $\| r - r' \|$ by the triangle inequality for radial distance, so no separate radial hypothesis is needed in that direction.

On the lifted ideal complement $I$, define

#[#set math.equation(numbering: n => "(5.5)")
 $ d_I \( xi' \, eta' \) = min {1 \, inf_alpha "diam"_(d_K) \( pi alpha \)} \, $ <mod:ideal-metric>]

where $alpha$ runs over paths in $I$ joining $xi'$ to $eta'$ and $pi$ is projection to $Sigma$. Put $d_I = 1$ for points in different components. The triangle inequality follows by concatenation, because the projected paths meet and the diameter of their union is at most the sum of their diameters. Distinct projected endpoints give positivity directly. For distinct lifts of the same endpoint, take a small evenly covered neighborhood in the ideal complement. A path changing the lift must leave this neighborhood, so its projected diameter has a positive lower bound. Therefore $d_I$ is a metric, bounded by one.

=== 5.6 A cone over an arbitrary bounded metric space <a-cone-over-an-arbitrary-bounded-metric-space>

We isolate the metric calculation, a discrete form of the familiar hyperbolic-cone construction; compare #cite(label("BonkSchramm2000")) Section 7. We give the proof for arbitrary bounded metric spaces, as no compactness hypothesis is available here. For a metric space $\( I \, d_I \)$ with $d_I lt.eq 1$, let $cal(C) \( I \)$ have vertices $\( xi' \, t \)$, $xi' in I$, $t in bb(Z)_(gt.eq 0)$. Add vertical unit edges between successive heights at the same point, and horizontal unit edges at height $t$ whenever $d_I \( xi' \, eta' \) lt.eq e^(- t)$. In particular all vertices at height zero are pairwise adjacent.

#thm([Lemma 5.7.])[
  #emph[The graph $cal(C) \( I \)$ is hyperbolic with an absolute constant, independent of the bounded metric space $I$. More precisely, put 
$ j = min { t \, t' \, - log d_I \( xi' \, eta' \) } \, #h(2em) - log 0 = + oo . $

 Its distance $D$ satisfies 
#[#set math.equation(numbering: n => "(5.6)")
 $ t + t' - 2 j lt.eq D #scale(x: 120%, y: 120%)[\(] \( xi' \, t \) \, \( eta' \, t' \) #scale(x: 120%, y: 120%)[\)] lt.eq t + t' - 2 j + 3 . $ <mod:cone-distance>]

]
] <mod:cone>

#proof[
  If $xi' = eta'$, both the formula without its additive error and the claim are immediate from vertical distance. Otherwise, descend to height $floor.l j floor.r$, take one horizontal edge, and ascend. This gives the upper bound.
  For the lower bound, let any connecting path have minimum height $m$ and $n gt.eq 1$ horizontal edges. The number of its vertical edges is at least $t + t' - 2 m$. By the triangle inequality in $I$,
  $ d_I \( xi' \, eta' \) lt.eq n e^(- m) . $
  Since also $m lt.eq t \, t'$, this implies $m lt.eq j + log n$. The path length is therefore at least
  $ t + t' - 2 j + n - 2 log n gt.eq t + t' - 2 j . $
  The last inequality holds for every integer $n gt.eq 1$ (indeed its minimum over positive real $n$ is $2 - 2 log 2 > 0$).
  To deduce hyperbolicity, fix a height-zero basepoint $p$. Its distance to $\( xi' \, t \)$ differs from $t$ by at most one. It follows from (5.6) that the Gromov product of two vertices differs by at most $3 \/ 2$ from their corresponding $j$ value. For three base points, the metric triangle inequality implies
  $ - log d_I \( xi' \, eta' \) gt.eq min { - log d_I \( xi' \, zeta' \) \, - log d_I \( zeta' \, eta' \) } - log 2 . $
  Taking the minimum with the relevant heights preserves this inequality. Thus the Gromov products satisfy the hyperbolicity inequality with an absolute additive constant. The standard Gromov-product characterization of hyperbolicity for graphs completes the proof; see #cite(label("BridsonHaefliger")) Chapter III.H. ◻
]

=== 5.7 Comparison with the model graphs <comparison-with-the-model-graphs>

We can now complete the proof of Proposition 15. Work first before the finite symmetry quotient, in a connected component. Using the collar coordinates, send a cone vertex $\( xi' \, t \)$ to the covering point of radius $r_0 + t$ above its ideal coordinate. A horizontal edge at positive height is represented by a path whose projected ideal diameter is at most $2 e^(- t)$: the factor two allows the infimum in (5.5) to be unattained. Place that path at radius $r_0 + t$ with the collar. The angular estimates and (5.4) give a uniform bound on its projected ball diameter. Vertical edges likewise have uniformly bounded projected diameter. Enlarge $u$ to exceed these bounds strictly. At height zero, even when ideal components are different, Lemma 16 gives a uniform bound on the graph distance of the two images. The cone map therefore sends adjacent vertices to pairs at uniformly bounded graph distance.

In the opposite direction, round a point of radius at least $r_0$ to the nearest integer layer, retaining its lifted ideal coordinate. Map the bounded radial part to one fixed height-zero vertex. The two maps are coarse inverses. Radial rounding has uniformly bounded graph displacement, and the bounded-core lemma handles all other points. To verify that this inverse also sends edges to pairs of bounded distance, consider an edge whose projection lies sufficiently far out. If one endpoint has radius $r$, its whole projected path has radii in $\[ r - u \, r + u \]$. Formula (5.4) bounds the angular diameter of this path by $O_u \( e^(- r) \)$. The collar changes this by another term of the same order. Following the lifted path in the collar consequently gives

$ d_I \( xi' \, eta' \) lt.eq C_u e^(- r) . $

Its rounded heights differ by a bounded amount, so (5.6) bounds their cone distance uniformly. If an edge meets the bounded radial part, both endpoints have bounded radius and the same conclusion follows through height zero. Hence the two graphs are quasi-isometric. Hyperbolicity of the cone and quasi-isometry invariance for geodesic spaces #cite(label("BridsonHaefliger")) Chapter III.H prove hyperbolicity of the model graph.

For the central model, the collar and the comparison maps on the end are equivariant under $hat(s)$. The lifted action preserves $d_I$, since its projection is unitary and hence preserves $d_K$. For the finite group $H = chevron.l hat(s) chevron.r$, the formula

$ overline(d)_I \( H xi' \, H eta' \) = min_(h in H) d_I \( xi' \, h eta' \) $

defines a metric on $I \/ H$. Positivity uses finiteness of $H$, and the triangle inequality follows by translating and concatenating minimizers. The quotient of the cone graph is the cone graph of this quotient metric, possibly with multiple edges and loops, which do not affect vertex distances. The preceding comparison thus descends, while the quotient radial core remains bounded. Lemma 17 proves hyperbolicity also in the central case. There are only finitely many subsets $T$ and one central model, so one choice of $u$ and one hyperbolicity constant work for all of them.

Finally, let an additional locally finite union of proper complex analytic subsets be omitted. Removing vertices and restricting edges cannot decrease distances. For the reverse inequality, take a finite edge path whose endpoints are retained. Perturb its finitely many junctions and constituent paths, relative to the endpoints, to miss the omitted loci. General position permits this because proper complex analytic subsets have real codimension at least two. Locally finite omissions cause no extra difficulty: a compact path meets only finitely many members, and the perturbation can be made in finitely many coordinate neighborhoods. Make this perturbation as a homotopy of the whole concatenated chain in the existing arrangement complement, relative to its two overall endpoints. Homotopy lifting preserves those two endpoints in the cover; the intermediate junctions move coherently. Each original projected path has diameter strictly smaller than $u$, so a sufficiently small perturbation preserves that strict inequality. The perturbed path has exactly the same number of edges. Thus all distances between retained vertices are unchanged. For a central quotient edge path, lift the whole chain to the cover, perturb it relative to its overall endpoints, and project back; invariance of the omitted set ensures that the projected chain avoids it. The four-point inequality for hyperbolicity restricts to the retained vertex set with the same constant, proving the last assertion of the proposition.

We now fix such a value of $u$, a common hyperbolicity constant, and a reading radius $N$ supplied by Lemma 5. Only after these choices will we choose the arithmetic level and the geometric sizes of the charts.

== 6 An infinite cyclic image <sec:image>

We now compute the image of the surface constructed in Proposition 10. The relations supplied by a coupling hyperplane show that this image is cyclic. Proving that the cyclic group is infinite requires a separate argument: the translation labels of the preceding section exist in charts, and need not define a homomorphism on the fundamental group of the whole orbifold.

#thm([Theorem 6.1.])[
  #emph[For a sufficiently deep choice of the arithmetic level in the construction of Proposition 10, the map $f : Y arrow.r cal(S)$ satisfies 
$ "im" #scale(x: 120%, y: 120%)[\(] f_(*) : pi_1 \( Y \) arrow.r pi_1 \( cal(S) \) #scale(x: 120%, y: 120%)[\)] tilde.equiv bb(Z) . $

 Here $Y$ is an iterated point blowup of the simple abelian surface $"Jac" \( C \)$, and its image lies in the ordinary locus of $cal(S)$.]
] <thm:orbifold-cyclic>

Throughout the proof, fundamental groups are based at points in the ordinary locus. Changes of basepoint are made along specified common paths; in particular, the comparisons below concern homomorphisms with one common conjugation, rather than separate conjugations of individual generators.

=== 6.1 Surface loops and the cyclic upper bound <surface-loops-and-the-cyclic-upper-bound>

Recall the distinguished fiber $F_(*) = C times C$ in $V$, the order-four lift $s$, and the rational section used to construct $Y$ in Section 4.6. Put

$ cal(K) = \[ V \/ chevron.l s chevron.r \] . $

There is a natural homomorphism

#[#set math.equation(numbering: n => "(6.1)")
 $ pi_1 \( cal(K) \) arrow.r pi_1 \( cal(S) \) . $ <app:comparison-map>]

Indeed, the substack $\[ F_(*) \/ chevron.l s chevron.r \]$ has complex codimension two in the smooth stack $cal(K)$. Removing it does not change the orbifold fundamental group, and its complement is the open substack on which the construction of $cal(S)$ leaves $cal(K)$ unchanged.

Choose a general point $q_0 in C$. The map

$ C arrow.r "Sym"^2 C arrow.r "Jac" \( C \) \, #h(2em) p mapsto p + q_0 \, $

is, up to translation, an Abel map. Its map on fundamental groups surjects onto $pi_1 \( "Jac" \( C \) \) = H_1 \( C \, bb(Z) \)$. Since point blowups preserve fundamental groups, loops from $C times { q_0 }$ supply generators of $pi_1 \( Y \)$. They may be represented by a finite bouquet avoiding the branch points, $p = q_0$, the zeros and poles of the rational section, and the finitely many points where the rational map or its resolution must be avoided. Removing finitely many points from a smooth curve is surjective on fundamental groups, so these restrictions do not lose any generators.

#thm([Lemma 6.2.])[
  #emph[With common choices of basing, the images in $pi_1 \( cal(S) \)$ of the preceding generators of $pi_1 \( Y \)$ equal the images, under (6.1), of the corresponding loops in $C times { q_0 } subset V$. The loops can also be represented in the sign-covered arrangement complement, arbitrarily close to $F_(*)$, with both normal coordinates nonzero.]
] <app:surface-comparison>

#proof[
  Lift the bouquet by the rational section to the exceptional divisor of $"Bl"_(F_(*)) V$. Over this bouquet the section has the form
  $ \[ tau \( p \) \, sqrt(- 1) thin tau \( q_0 \) \] \, $
  with both entries nonzero. It avoids the fixed curves involved in the last resolution step, because the bouquet avoids the diagonal of $C times C$.
  A complex line bundle on a finite graph is topologically trivial. Thus the normal line to this exceptional divisor admits one continuous nonvanishing section over the entire lifted bouquet. In the product normal coordinates, this push can be written explicitly as
  $ epsilon #scale(x: 120%, y: 120%)[\(] tau \( p \) \, sqrt(- 1) thin tau \( q_0 \) #scale(x: 120%, y: 120%)[\)] . $
  One sufficiently small $epsilon > 0$ works over the compact bouquet and gives a closed based bouquet off the exceptional divisor. On blowing down to $V$, the pushed bouquet is homotopic to the original one in $F_(*)$. On passing to the resolution neighborhood in $cal(S)$, it is homotopic to the bouquet obtained from $Y$. These homotopies use the same push of the common basepoint.
  The two components of the displayed section are nonzero, and the chosen directions avoid the marked slopes. Taking the push small therefore puts its projection off the arrangement. The distinguished point is an isolated component of the fixed locus of every nonidentity power of $sigma$ in a sufficiently small neighborhood. Hence the pushed bouquet can also avoid the inverse images of all those fixed loci. This proves all the assertions, including the common basing. ◻
]

We next compute an upper bound before taking the quotient by $s$. Write $H = \( bb(Z) \/ 2 \)^2$ for the sign deck group. The map

$ V arrow.r \[ V \/ H \] $

is an orbifold covering, so it induces an injection of $pi_1 \( V \)$ into $pi_1 \( \[ V \/ H \] \)$. This remains true over branch points: the target is the quotient stack, which retains their isotropy groups.

The pencil through $L_z$ gives the orbifold line $\[ C \/ \( bb(Z) \/ 2 \) \]$, with six order-two points. Number the four red points first. Its fundamental group has the presentation

#[#set math.equation(numbering: n => "(6.2)")
 $ Q = chevron.l h_1 \, dots.h \, h_6 divides h_i^2 = 1 \, med h_1 h_2 h_3 h_4 h_5 h_6 = 1 chevron.r . $ <app:pencil-group>]

The kernel of the parity character sending every $h_i$ to $1 in bb(Z) \/ 2$ is $pi_1 \( C \)$. With the $w$ sign point fixed over a general direction, the map of this orbifold pencil to $\[ V \/ H \]$ identifies the homomorphism from this even subgroup with the homomorphism from $pi_1 \( C times { q_0 } \)$ to $pi_1 \( V \)$, followed by the injection just described.

#thm([Lemma 6.3.])[
  #emph[The image of $pi_1 \( C times { q_0 } \)$ in $pi_1 \( V \)$ is cyclic. Consequently the image of $pi_1 \( Y \)$ in $pi_1 \( cal(S) \)$ is cyclic.]
] <app:cyclic-upper>

#proof[
  We show that the four red meridians in (6.2) have the same image in $pi_1 \( \[ V \/ H \] \)$. First move the $w$ coordinate a little off its exceptional direction line, keeping it fixed, generic, and small. Push the red pencil meridians off the $z$ exceptional divisor. They can be represented with
  $ t = z_1 eq.not 0 quad upright("fixed and small") \, #h(2em) lambda = z_2 \/ z_1 $
  and with the red meridians based by paths in a small disk containing exactly the four red values of $lambda$.
  Slide this calculation in the $t$ variable to the coupling hyperplane $t = c$. The disk of red directions can be chosen small enough that this entire motion, with the chosen small $w$, remains inside the ball: the red slopes have modulus less than $0.01$, whereas $c \/ sqrt(a) < 0.9$. The motion and the finitely many paths used here lie in a fixed compact part of the full finite model. We include this compact set among the regions that must agree with the actual arrangement when the arithmetic level is chosen.
  Before blowing up the pair intersections, the relevant local divisor is
  $ { t = c } med union med union.big_(i = 1)^4 { lambda = lambda_i } . $
  Let $k$ be the meridian in the $t$ variable, with one common choice of basing. The product structure makes $k$ commute with each red meridian. More precisely, the same $t$ circle can be transported along each of the based paths in the direction disk; this gives one element $k$, not four unrelated conjugates.
  Blowing up ${ t = c \, lambda = lambda_i }$ introduces an exceptional divisor whose meridian is $k h_i$: in the two transverse coordinates, the exceptional meridian circles both coordinates once. The filling rules of Section 4.4 impose no branching along this exceptional divisor, since two branch components met there. Thus its meridian is killed. Therefore
  $ k h_i = 1 #h(2em) \( 1 lt.eq i lt.eq 4 \) . $
  The strict transforms retain order two, so $k^2 = h_i^2 = 1$. All four red images are consequently one involution, denoted $r$.
  The product relation in (6.2) now gives $h_5 h_6 = 1$, and the two blue images are one involution $b$. The image of $Q$ is thus a quotient of
  $ chevron.l r \, b divides r^2 = b^2 = 1 chevron.r . $
  Every even word in $r \, b$ is a power of $r b$. Hence the image of the even subgroup $pi_1 \( C \)$ is cyclic. Injectivity of $pi_1 \( V \) arrow.r pi_1 \( \[ V \/ H \] \)$ gives the assertion in $pi_1 \( V \)$. Lemma 19 and the surjectivity from the chosen $C$ loops onto $pi_1 \( Y \)$ give the final assertion. ◻
]

This argument allows the cyclic image to be finite. We will exclude that possibility by applying Lemma 5 to paths in a dense open subset of $cal(S)$.

=== 6.2 Paths in the ordinary open set <paths-in-the-ordinary-open-set>

Let $O subset cal(S)$ be the sign-covered arrangement complement, quotiented by $s$, after also removing the full inverse image of the fixed loci in $M$ of all nonidentity powers of $sigma$. The modifications defining $cal(S)$ are isomorphisms over this set. In particular $O$ is a dense connected smooth variety, and all quotient actions used over it are free.

There is a useful space for specifying lifts. Over the complement in $bb(B)$ of the lifted arrangement and the lifted omitted fixed loci, pull back the sign data from $V$, and call the resulting space $O^(\#)$. Then

$ O^(\#) arrow.r O $

is an ordinary covering. Changes of lift are generated by the ball deck group $Gamma$ and by $sigma$, the latter acting on the sign data through $s$. These are precisely the transformations used to form $O$; we do not divide out the two sign deck transformations. The group generated by $Gamma$ and $sigma$ acts freely on the retained ball region.

Fix the diameter bound $u$ supplied by Proposition 15. Define a graph $G$ whose vertices are the points of $O$. An edge is a parametrized continuous path in $O$ whose lifted projection to $bb(B)$ has diameter strictly less than $u$. All graphs use the same parametrization and reversal conventions. The diameter condition is independent of the lift, because changes of lift act by ball isometries. No bound is imposed on path length or winding. In particular, arbitrarily high powers of a loop can be individual edges when their projections stay in one small region.

=== 6.3 Choosing and comparing the charts <choosing-and-comparing-the-charts>

We make the order of the parameters explicit. First fix $u$, then a common hyperbolicity constant for the model graphs, and then the integer $N$ required by Lemma 5. Set

#[#set math.equation(numbering: n => "(6.3)")
 $ R = \( 2 N + 100 \) \( u + 1 \) . $ <app:radius>]

A lift of a graph path with at most $N$ edges stays within distance $N u$ of its initial ball point, regardless of the lengths of the individual parametrized paths.

The special points of $bb(B)$ are the points of $Gamma o$, the lifts of the distinguished point of $M$. Choose $J > 10 R$ so large that, in the central model, both of the following hold at every point of distance at least $J - 3 R$ from $o$:

+ On sign loops projected into the $R$ ball about that point, the kernel of the sum translation equals the intersection of the two individual translation kernels.
+ For $j = 1 \, 2 \, 3$, the displacement by $sigma^j$ exceeds $10 R$.

The first requirement follows from Proposition 14. For the second, none of $sigma \, sigma^2 \, sigma^3$ has a boundary fixed point. The ball distance formula then implies that its displacement tends uniformly to infinity as the viewpoint tends to the boundary.

Let $B \( R \)$ be the buffer radius in Proposition 14, enlarged so that $B \( R \) > R$, and choose

#[#set math.equation(numbering: n => "(6.4)")
 $ K > 10 #scale(x: 120%, y: 120%)[\(] J + R + B \( R \) #scale(x: 120%, y: 120%)[\)] . $ <app:chart-radius>]

All these constants depend only on the finite models. Now take the initial arithmetic level deep enough that Proposition 8 holds on balls of radius $10 K$, that such balls inject into the torsion-free ball quotient, that the full finite arrangement agrees with the lifted arrangement in these neighborhoods of every special point, and that distinct special points have distance greater than $100 K$. Enlarge this last choice, if necessary, to include the fixed compact paths used in Lemma 20. Subsequent finite covers preserve all these requirements.

For a vertex $v in G$, choose a lift with ball coordinate $x$ and its actual sign data. Its chart has one of two forms.

*Central chart.* If $"dist" \( x \, Gamma o \) < J$, use the full finite model centered at the unique nearby special point. Read in the sum-translation cover and then quotient by the lifted order-four symmetry, as in Lemma 12.
*Individual chart.* Otherwise take all lifted hyperplanes meeting $B_(bb(B)) \( x \, K \)$, identify them, with their prescribed normal vectors, with the corresponding subset of $cal(D)$, and use the model cover given by the two individual translation kernels. There is no symmetry quotient in this chart.

These chart graphs are the graphs of Proposition 15, with the appropriate additional analytic omissions. One can transport the whole locally finite union of lifted omitted fixed loci to model coordinates; any extra lifted arrangement hyperplanes outside the comparison region may be omitted as well. Such omissions are globally defined on the model ball. In central coordinates they are invariant under the symmetry. Proposition 15 shows that these omissions do not enlarge the uniform hyperbolicity constant.

For central charts, fix the identifications of sign data once on the large comparison ball about $o$. Sign characters on that ball complement are determined by their meridians. Choose the sheet identifications to agree with the local construction near $F_(*)$; they then intertwine the actual lift $s$ with the model lift throughout this connected region. Transport the choices to all special points by $Gamma$. These choices are also compatible with $sigma$, by the symmetry of the construction.

Within the comparison ball about a special point, the only quotient transformations that can identify two ball points are the four symmetry powers centered there. Indeed, if $g in chevron.l Gamma \, sigma chevron.r$ identifies two such points, it carries the special point to another one at distance at most twice the comparison radius. Separation forces it to fix that special point. Its stabilizer is exactly the corresponding conjugate of $chevron.l sigma chevron.r$, since $Gamma$ is torsion free.

To read a path of at most $N$ graph edges from $v$, lift it from the chosen point of $O^(\#)$. Its ball projection remains in the comparison region. Identify the resulting sign path with the model sign path, lift further from a chosen initial point in the translation cover, and, in a central chart, take the class modulo the lifted symmetry. This is a path in a model graph $D_v$, with initial state $d_v$. Write $\[ p \]_v$ for its terminal state.

Central models are centered only at points of $Gamma o$. Other full pencil fibers, including those over $Gamma_0 o \\ Gamma o$, and the other quotient fixed loci remain unmodified in $\[ V \/ chevron.l s chevron.r \]$. An ordinary-open loop around such a locus may have a ball or sign lift with different endpoints; an individual chart retains this difference. Equality of actual endpoints is not required to imply equality of read states. For orbifold relations, the relevant meridian power lifts to a closed loop in a smooth chart in $V$; its closure will be checked separately below.

#thm([Lemma 6.4.])[
  #emph[The readings just constructed satisfy the three chart hypotheses of Lemma 5.]
] <app:chart-axioms>

#proof[
  The uniform hyperbolicity assertion is Proposition 15. We verify the two path compatibility assertions.
  #emph[Continuation from a state.] Path lifting is consistent with prefixes and reversals. Equal read states project to the same actual point of $O$. In an individual chart, equality means equality in the model covering, and hence also in the ball and sign data. Every outgoing model edge at a state reached after fewer than $N$ edges gives an actual edge of $G$: its projection stays within $u$ of its starting ball point and therefore inside the comparison region. It avoids precisely the arrangement and extra loci excluded in $O$. Lifting and projecting parametrized paths are mutually inverse once the starting lift is fixed. This is the required bijection on outgoing edges, and it depends only on the read state.
  In a central chart the symmetry acts freely on the open complement. An outgoing edge of its quotient graph consequently has a unique representative from any chosen representative of the starting vertex. Representatives at equal states differ by a symmetry power, which respects the identification with the actual open set. Thus the same outgoing-edge bijection holds, including its dependence only on the state. This proves the first chart hypothesis.
  #emph[Comparison after a prefix.] Let $p$ go from $v$ to a vertex $v'$, and let $a \, b$ start at $v'$, with
  $ \| p \| \, \| a \| \, \| b \| lt.eq N \/ 2 . $
  We must prove
  #[#set math.equation(numbering: n => "(6.5)")
   $ \[ p a \]_v = \[ p b \]_v quad arrow.l.r.double quad \[ a \]_(v') = \[ b \]_(v') . $ <app:prefix-compatibility>]
  For this calculation, use for $v'$ the lift reached by lifting $p$. The equality tests do not depend on this change from its initially chosen lift. For $Gamma$ this follows from transport of the normal data. For $sigma$ the two families are interchanged and the finite arrangement has the same symmetry. If relabeling changes a chosen normal vector by a scalar, it changes the corresponding translated normal by the same scalar, because $sigma$ normalizes the arithmetic group. Thus the intrinsic prescriptions of Proposition 14 give the same individual kernels, with possible reversals of translation orientations. Individual sign-sheet choices likewise do not affect a kernel test on a closed sign loop. For central charts the fixed, equivariant identifications above give the same conclusion for the sum cover. Finally, the choice of initial point in a translation cover is irrelevant because the covers are regular, and the deck translations commute with the lifted central symmetry.
  All projected paths in the comparison are contained in the $R$ ball about the endpoint of the lifted $p$. If both charts are individual, equality first requires coincident endpoints in the actual ball and sign data. If this requirement fails, both tests fail. If it holds, compare the two sign paths by the loop $a overline(b)$. The further lifts end together exactly when both translations of this loop vanish. The common prefix does not change that condition. Both charts contain the required buffered ball about this new viewpoint, by (6.4); therefore Proposition 14 identifies the two kernel tests. This proves (6.5) in this case.
  If both charts are central, their special points coincide. Otherwise these two special points would be at distance at most $2 J + N u$, contrary to their separation. The two readings then use restrictions of the same covering with the same lifted symmetry, so their endpoint equality tests agree.
  It remains to compare a central and an individual chart. The viewpoint at the end of $p$ is at distance at least $J - R$ from the special point of the central chart. This follows directly from the criterion for the individual root and from the bound $N u < R$ on the distance between the two roots. Every endpoint being compared is therefore at distance at least $J - 2 R$ from that special point. Two such endpoints in the comparison ball cannot differ by a nontrivial symmetry power: their mutual distance is at most $2 R$, whereas the relevant displacement exceeds $10 R$. Thus the central test, too, requires equality of the ball and sign endpoints. On the remaining sign loop, the sum kernel equals the intersection of the individual kernels by the choice of $J$. The buffered comparison of individual kernels now applies as before. This proves (6.5) in the mixed case, and completes the verification of the chart hypotheses. ◻
]

=== 6.4 From orbifold relations to path relations <from-orbifold-relations-to-path-relations>

Let $cal(P) \( G \)$ be the path groupoid of $G$ modulo backtracking and every edge loop of at most three edges that closes in its starting chart. Lemma 5 and Lemma 21 detect nontrivial elements of this groupoid. To use that conclusion for $cal(S)$, we need the following direction of comparison: every loop that is trivial in $pi_1 \( cal(S) \)$ must already be trivial in $cal(P) \( G \)$.

We recall explicitly the topological fact about orbifolds used in this comparison.

#thm([Lemma 6.5.])[
  #emph[Let $cal(T)$ be a connected smooth effective complex orbifold, and let $U$ be a dense ordinary open subset whose complement is complex analytic. Then $pi_1 \( U \) arrow.r pi_1 \( cal(T) \)$ is surjective. Its kernel is normally generated by the loops obtained from boundaries of small transverse disks in smooth orbifold charts at general points of the omitted divisors. Equivalently, if the generic stabilizer along such a divisor has order $m$, one kills the $m$th power of a small meridian in the ordinary quotient. Omitted strata of complex codimension at least two add no relations.]
] <app:orbifold-meridians>

#proof[
  One may apply ordinary general position to a smooth frame presentation of $cal(T)$. Effectiveness and finite-group linearization imply that the action of each chart group on tangent frames is free. Consequently the frame space is a manifold, with a locally free action of the connected group $"GL"_n \( bb(C) \)$, and its quotient stack is $cal(T)$. The homotopy fibration from this presentation, as in #cite(label("Noohi2014")) Example 5.6, computes $pi_1 \( cal(T) \)$ as the fundamental group of the frame space modulo the image of $pi_1 \( "GL"_n \( bb(C) \) \)$; the same description applies over $U$.
  In the frame space, paths can avoid real-codimension-two loci, and a nullhomotopy disk can meet such loci transversely in finitely many general divisor points. Removing small disks around those intersection points expresses its boundary as a product of conjugates of transverse meridians. Real codimension at least four can be avoided by the entire disk. Passing through the preceding quotient of fundamental groups proves the assertion. At a general point of a divisor, the effective stabilizer is cyclic and acts faithfully on the transverse line. A circle in that line projects to the $m$th power of a quotient meridian, giving the last description. ◻
]

#thm([Lemma 6.6.])[
  #emph[A loop of edges of $G$ that is nullhomotopic in $cal(S)$ is trivial in $cal(P) \( G \)$.]
] <app:true-relations>

#proof[
  First consider homotopies within $O$. Every ordinary path admits a finite subdivision into graph edges. An already specified edge may itself be subdivided without changing its class in $cal(P) \( G \)$: if $e = e_1 e_2$ is a subdivision, then $e_1 \, e_2$ are still edges, and $e_1 e_2 overline(e)$ is a three-edge loop that closes on reading, since all three pieces lift the same parametrized path. Repeating this observation allows arbitrary finite subdivision even when an original edge winds arbitrarily often.
  A homotopy in $O$ can now be subdivided into sufficiently small path triangles. To choose the neighborhoods uniformly over its compact image, take lifted ball patches avoiding the arrangement and the omitted fixed loci, each disjoint from its distinct quotient translates. For every root in a smaller patch, the oversized chart agrees with this same arrangement-free ball patch. The sign and translation covers trivialize there, and a central symmetry quotient makes no additional identifications inside the patch. A finite cover of the homotopy image by these smaller neighborhoods supplies the required subdivision. Each triangle consequently closes in its starting chart and is one of the imposed relations. This is the usual edge-path proof that ordinary homotopy relations are respected.
  It remains, by Lemma 22, to check the transverse-disk relations. Away from the distinguished fiber, $cal(S)$ is $\[ V \/ chevron.l s chevron.r \]$. Even at points with inertia, the required power of a quotient meridian lifts to a closed small loop bounding a disk in the smooth local uniformizing space in $V$. Its projection to $M$ bounds a disk in an arbitrarily small simply connected ball patch, so its further lift to $bb(B)$ is closed and lies in the corresponding small region. The finite model there has exactly the same participating hyperplanes and the same blowups, sign branching, and fillings as $V$. This local identification extends across the fillings by the explicit local rules, or equivalently by uniqueness of the normalizations extending the sign covers. Lemma 11 therefore says that the translation covers extend over this disk. Its boundary closes in an individual chart, and also closes in a central chart by the sum rule. This argument includes unbranched exceptional divisors, order-two branch divisors, and the powers required by any further quotient inertia. Additional analytic loci removed in defining $O$ cause no new obstruction: the extension test is made after those additional omissions are restored.
  Over the distinguished point, the relevant chart is central. By Lemma 12, its sum cover descends to the coarse quotient and pulls back to a covering of the resolution neighborhood. Thus it extends over every transverse disk used for the ordinary smooth space there. Those meridians close in the central graph as well. A sufficiently small representative is a single edge: its ball lift stays arbitrarily close to the distinguished point, even when its endpoint differs from its start by a central symmetry power. Away from this fiber the same diameter assertion follows from the small local chart in $V$, including for a power of a meridian.
  Every required transverse-disk boundary is consequently a single-edge loop that closes in its chart, and is killed in $cal(P) \( G \)$. Normal generation, together with the homotopy argument in $O$, proves the lemma. ◻
]

Combining the last two lemmas with Lemma 5 gives

#[#set math.equation(numbering: n => "(6.6)")
 $ upright("a single edge loop with distinct read endpoints represents a
 nonidentity element of ") pi_1 \( cal(S) \) . $ <app:detection>]

This conclusion does not require any of the translation labels to extend to all of $pi_1 \( cal(S) \)$.

=== 6.5 Infinite order and completion of the proof <infinite-order-and-completion-of-the-proof>

Choose a based loop $alpha$ in $C times { q_0 }$ on which the first translation label is nonzero. Such a loop comes from lifting a product of a red and a blue meridian in the six-point pencil: its parity is even and its dihedral label is $r b$, a nontrivial translation. The second label is zero on this factor. The loop can be represented in the good locus used in Lemma 19, since deleting its finite exceptional set is surjective on $pi_1 \( C \)$ and the translation label extends over the filled curve.

Push $alpha$ to a loop $e$ in $O$ as in that lemma, so close to the distinguished fiber that its ball projection has diameter less than $u$. Its basepoint has a central chart. The sum label on the pushed loop is the same nonzero integer as on $alpha$, by extension of the sum covering over the filled model. For every nonzero integer $n$, the parametrized loop $e^n$ has the same projected image as $e$, and hence is itself one edge of $G$.

The read endpoints of $e^n$ are distinct in the central quotient graph. Before taking the symmetry quotient they differ by the nonzero translation $n thin ell \( alpha \)$. The lift of $e$ is closed in the actual ball and sign data, because the push is closed upstairs in $V$ and its projection lies inside the prescribed small simply connected ball about $o$. If the two translated endpoints became equal after quotienting by a lifted symmetry power, that power would fix their common ball point. This point lies in the ordinary open set where the symmetry acts freely, so the power would have to be the identity. A nonzero deck translation cannot fix a point of a covering. Thus the endpoints remain distinct.

By (6.6), every nonzero power of the class of $e$ is nontrivial in $pi_1 \( cal(S) \)$. Lemma 19 puts this infinite-order element in the image of $pi_1 \( Y \)$. That image is cyclic by Lemma 20; it is therefore infinite cyclic. This proves Theorem 18.

== 7 Projective realization and removal of the surface blowups <sec:projective>

Theorem 18 supplies a map $Y arrow.r cal(S)$, where $Y$ is obtained by point blowups from the simple abelian surface $A$, and where the image of $pi_1 \( Y \)$ is infinite cyclic. We now make two changes of ambient space. The first replaces the orbifold by a smooth projective variety containing $Y$. The second removes the point blowups from $Y$ while preserving the homomorphism on fundamental groups. Together they produce the embedding required by Proposition 2.

=== 7.1 Replacing the orbifold ambient space <replacing-the-orbifold-ambient-space>

The projective-bundle construction below is a relative version of the free-locus method in the Godeaux–Serre construction; compare #cite(label("Serre1958")) §20 and #cite(label("Totaro1999")) Remark 1.4 and §5. We include the containment and fundamental-group arguments, since the specified surface must survive the replacement.

#thm([Lemma 7.1.])[
  #emph[Let $cal(T)$ be a smooth connected effective proper complex Deligne–Mumford stack with projective coarse space. Let $Y$ be a smooth projective surface and let $f : Y arrow.r cal(T)$ have image in the locus with trivial stabilizers. There exist a smooth connected projective variety $S$, an embedding $i : Y arrow.r.hook S$, and a morphism $h : S arrow.r cal(T)$ such that $h compose i = f$ and 
$ h_(*) : pi_1 \( S \) arrow.r^(med tilde.op med) pi_1 \( cal(T) \) . $

 One may take $dim S = 5$.]
] <lem:ambient-realization>

#proof[
  We first pass to a projective bundle whose nonordinary locus has arbitrarily large codimension, without changing the fundamental group. Choose an embedding $Y arrow.r.hook bb(P)^(b - 1)$ and form
  $ cal(E) = \( cal(O)_(cal(T)) xor T_(cal(T)) \)^(xor a) xor cal(O)_(cal(T))^(xor b) \, #h(2em) cal(P) = bb(P)_(cal(T)) \( cal(E) \) \, $
  using the convention that projectivization parametrizes lines. The trivial summands give a closed substack $cal(T) times bb(P)^(b - 1) subset cal(P)$, in which the graph of $f$ is a closed copy of $Y$. This copy lies in the ordinary locus, because $f \( Y \)$ does.
  The representation of each stabilizer on the tangent space of $cal(T)$ is faithful; in particular, every nonidentity element acts nontrivially. Indeed a finite holomorphic action is linearizable at a fixed point, and effectiveness rules out an element with trivial tangent action. The added trivial line ensures that its action on $cal(O) xor T_(cal(T))$ is not scalar. Consequently every eigenspace in $cal(E)$ has codimension at least $a$, including after the extra trivial summands are added. The projective fixed locus of each such element is a union of projective eigenspaces. It follows, in local finite quotient charts, that the nonordinary locus of $cal(P)$ has codimension at least $a$. The same bound holds in its coarse space $P$.
  The coarse space $P$ is projective. Stabilizer orders are bounded on the proper stack, so a sufficiently divisible power of the tautological polarization has trivial stabilizer actions and descends to $P$; it is relatively ample over the coarse space of $cal(T)$. These statements can be checked on finite quotient charts, where descent is precisely triviality of the stabilizer action on the fibers of the line bundle. Twisting by a sufficiently ample bundle from the projective base gives a polarization of $P$. Let $U subset P$ be the ordinary locus. It is smooth and identifies with the ordinary locus of $cal(P)$.
  Choose $a > 5$. Removing a subset of complex codimension at least two from a smooth orbifold does not change its orbifold fundamental group: paths and their homotopies can be moved off that subset in smooth charts, or in a smooth frame presentation. Also, the projective-space bundle $cal(P) arrow.r cal(T)$ induces an isomorphism on fundamental groups, since its fibers are simply connected. Thus the natural maps give
  #[#set math.equation(numbering: n => "(7.1)")
   $ pi_1 \( U \) tilde.eq pi_1 \( cal(P) \) tilde.eq pi_1 \( cal(T) \) . $ <proj:ordinary-group>]
  It remains to cut down inside $U$ while retaining the embedded surface. Put $N = dim P$. In a sufficiently high projective embedding of $P$, take $N - 5$ general hyperplane sections through $Y$. Their linear systems are free off $Y$ and generate the normal differentials along $Y$. The locus where $r$ general normal differentials fail to be independent has expected codimension
  #[#set math.equation(numbering: n => "(7.2)")
   $ \( N - 2 \) - r + 1 $ <proj:rank-loss>]
  on the surface. For $r = N - 5$ this is $4 > 2$, so the final intersection is smooth along $Y$. Bertini gives smoothness elsewhere in $U$. Since $P \\ U$ has codimension greater than five and is disjoint from $Y$, a general constrained intersection avoids it. We obtain a smooth projective fivefold $S subset U$ containing $Y$.
  To verify the assertion about $pi_1$, first take unconstrained general hyperplane sections in this same embedding. The quasi-projective Lefschetz theorem of Hamm and Lê #cite(label("HammLe")) Theorem 1.1.3(ii) says that a smooth open variety of complex dimension $n$ is obtained, up to homotopy, from a general hyperplane section by attaching cells of dimensions at least $n$. At every stage here the dimension before cutting is at least six. The successive inclusions therefore preserve connectedness and induce isomorphisms on fundamental groups. The final intersection avoids $P \\ U$, by the same dimension count.
  Now consider the full product of the hyperplane parameter spaces, without a containment requirement. The tuples whose intersections have dimension five, are smooth, and avoid $P \\ U$ form a nonempty Zariski-open set $Omega$. It contains both a general unconstrained tuple and the constrained tuple just constructed, and it is path connected. The universal complete intersection over $Omega$ is a smooth proper family with a map to $U$. Along a path in $Omega$, Ehresmann’s theorem identifies its fibers by diffeomorphisms and gives a homotopy of their inclusions into $U$. Thus the isomorphism on fundamental groups for an unconstrained fiber also holds for $S$. Composing $S arrow.r.hook U subset cal(P)$ with the bundle projection gives $h$, with $h compose i = f$, and (7.1) proves the lemma. ◻
]

Applied to $Y arrow.r cal(S)$, this gives a smooth connected projective ambient variety $S$ with an embedding of $Y$ and

#[#set math.equation(numbering: n => "(7.3)")
 $ "im" #scale(x: 120%, y: 120%)[\(] pi_1 \( Y \) arrow.r pi_1 \( S \) #scale(x: 120%, y: 120%)[\)] tilde.eq bb(Z) . $ <proj:blownup-image>]

The remaining issue is that Proposition 2 requires $A$ itself. We address one point blowup at a time.

=== 7.2 Realizing a surface blowdown in a new ambient variety <realizing-a-surface-blowdown-in-a-new-ambient-variety>

#thm([Lemma 7.2.])[
  #emph[Let $Y_1 arrow.r.hook S$ be an embedding of a smooth projective surface in a smooth connected projective variety, and let $b : Y_1 arrow.r Y_0$ be the blowdown of a $\( - 1 \)$-curve to a smooth projective surface. There exist a smooth connected projective variety $S_0$, an embedding $Y_0 arrow.r.hook S_0$, and an isomorphism $theta : pi_1 \( S \) arrow.r^tilde.op pi_1 \( S_0 \)$ such that 
$ theta compose \( pi_1 \( Y_1 \) arrow.r pi_1 \( S \) \) = \( pi_1 \( Y_0 \) arrow.r pi_1 \( S_0 \) \) compose b_(*) . $

 The equality is understood with compatible basepoints, or up to conjugation.]
] <lem:ambient-blowdown>

The proof first places $Y_1$ in a projective threefold and adjusts the normal bundle of its exceptional curve to $cal(O) \( - 1 \) xor cal(O) \( - 1 \)$. Blowing up that curve gives an exceptional $bb(P)^1 times bb(P)^1$. Contracting the other ruling then performs $b$ on the surface. This is the classical local two-ruling construction; compare #cite(label("Atiyah1958")). The essential global point here is to construct a polarization that makes this second contraction projective.

#proof[
  Write $E subset Y_1$ for the exceptional curve. Replace $S$ by its product with a projective space and embed $Y_1$ by the graph of
  $ Y_1 arrow.r^b Y_0 arrow.r.hook bb(P)^r . $
  The new ambient fundamental group is naturally $pi_1 \( S \)$. Let $Q$ be the pullback of $cal(O)_(bb(P)^r) \( 1 \)$; it is nef, and $Q \|_(Y_1) = b^(*) L_0$ for a very ample line bundle $L_0$ on $Y_0$. Further projective-space factors allow us to make the ambient dimension as large as convenient.
  #emph[A threefold containing the unchanged surface.] Cut to a smooth projective fourfold $W$ containing $Y_1$, using high ample degrees. For each successive cut the rank-loss count (7.2), with final dimension four, is at least three; thus it exceeds $dim Y_1 = 2$. Together with Bertini, this gives smooth successive cuts, and the Lefschetz theorem preserves the fundamental group throughout.
  For a final threefold, the rank-loss codimension is now two, equal to the dimension of the surface. We therefore allow isolated singularities in the last cut and resolve them while leaving $Y_1$ unchanged. Take one more sufficiently ample hypersurface $Z subset W$ through $Y_1$. On the surface, its two normal derivatives form a general section of the rank-two bundle $N_(Y_1 \/ W)^(*) ⊗ cal(O)_W \( Z \) \|_(Y_1)$. In sufficiently high degree, generation of its first jets makes the zeros transverse and isolated; since $dim E = 1$, they can also avoid $E$. Bertini gives smoothness away from $Y_1$. At a zero choose coordinates with $Y_1 = \( x = y = 0 \)$. Writing the equation as $x a + y b = 0$, transversality says that $a \, b$ restrict to coordinates on $Y_1$. Hence $x \, y \, u = a \, v = b$ are coordinates on $W$ and the hypersurface equation is
  #[#set math.equation(numbering: n => "(7.4)")
   $ x u + y v = 0 \, #h(2em) Y_1 = \( x = y = 0 \) . $ <proj:node>]
  Thus $Z$ is a connected normal threefold with only ordinary double points, all disjoint from $E$.
  We require the small resolution of these nodes that leaves $Y_1$ unchanged. It exists projectively as follows. Choose a high-degree Cartier divisor on $Z$ containing $Y_1$, general in its ideal at the finitely many nodes. At each node its equation can be taken to be $x$, after a change of the coordinates in (7.4). This divisor is the sum of $Y_1$ and a residual effective Weil divisor $R$. The latter is Cartier away from the nodes, and at a node its ideal is $\( x \, v \)$. Blow up this coherent ideal. The blowup is projective, is an isomorphism away from the nodes, and is smooth at every node. Indeed its two charts are
  $ x = t v \, quad y = - t u #h(2em) upright("and") #h(2em) v = s x \, quad u = - s y \, $
  with coordinates $\( t \, u \, v \)$ and $\( s \, x \, y \)$, respectively. The strict transform of $Y_1$ is $t = 0$ in the first chart and misses the second chart. It therefore maps isomorphically to the original $\( u \, v \)$-plane. Denote the resulting smooth projective threefold by $T$ and keep the notation $Y_1 subset T$.
  These operations preserve the required fundamental group. For the last cut, deform $Z$ to a smooth ample hypersurface in $W$. Away from disjoint small neighborhoods of its nodes the family is locally trivial. A three-dimensional ordinary double point has simply connected link and simply connected Milnor fiber, and the small resolution neighborhood retracts to $bb(P)^1$. For completeness, after writing the node as $sum_(j = 0)^3 z_j^2 = 0$, its link is the space of orthonormal two-frames in $bb(R)^4$, hence the unit tangent bundle of $S^3 tilde.eq upright("SU") \( 2 \)$, which is $S^3 times S^2$. Its smoothing retracts to $S^3$; writing $z = x + i y$ identifies it with the tangent bundle of $S^3$ before truncation. These are also the elementary quadratic case of the Milnor-fiber theorem #cite(label("MilnorSingular")). Van Kampen therefore gives the same fundamental group for the nodal hypersurface, its smoothing, and its small resolution, compatibly with the maps to $W$. Lefschetz for the smoothing yields $pi_1 \( T \) tilde.eq pi_1 \( W \) tilde.eq pi_1 \( S \)$, with the prescribed map from $pi_1 \( Y_1 \)$.
  #emph[Adjusting the normal bundle.] The hypersurface degree can be chosen so large that
  $ N_(Y_1 \/ T) \|_E tilde.eq cal(O)_E \( - m \) \, #h(2em) m gt.eq 1 . $
  In fact there are no nodes on $E$, and the normal exact sequence there subtracts $deg cal(O)_W \( Z \) \|_E$ from the fixed degree of $det N_(Y_1 \/ W) \|_E$. The sequence
  $ 0 arrow.r cal(O)_E \( - 1 \) arrow.r N_(E \/ T) arrow.r cal(O)_E \( - m \) arrow.r 0 $
  splits because $H^1 \( E \, cal(O)_E \( m - 1 \) \) = 0$. Blow up the threefold along $E$. Since $E$ is a Cartier divisor on $Y_1$, the strict transform of $Y_1$ is isomorphic to $Y_1$. Its normal line bundle becomes $N_(Y_1 \/ T) ⊗ cal(O)_(Y_1) \( - E \)$, so its degree on $E$ increases by one, because $E^2 = - 1$. Repeating $m - 1$ times gives a smooth projective threefold, still denoted $T$, in which
  $ N_(E \/ T) tilde.eq cal(O)_E \( - 1 \) xor cal(O)_E \( - 1 \) \, $
  with the first summand the tangent-normal direction inside $Y_1$. At each step the same extension vanishing justifies this splitting.
  Blow up $E$ once more, obtaining $hat(T)$, and let $hat(Y)$ be the strict transform of $Y_1$. The exceptional divisor is
  #[#set math.equation(numbering: n => "(7.5)")
   $ G = bb(P)_(upright("curve"))^1 times bb(P)_(upright("normal"))^1 \, #h(2em) N_(G \/ hat(T)) = cal(O)_G \( - 1 \, - 1 \) \, #h(2em) hat(Y) ∩ G = bb(P)_(upright("curve"))^1 times { q } . $ <proj:exceptional-quadric>]
  The intersection is transverse. Moreover $cal(O)_(hat(T)) \( hat(Y) \) \|_G = cal(O)_G \( 0 \, 1 \)$, and $N_(hat(Y) \/ hat(T)) \|_E = cal(O)_E$. We continue to denote by $Q$ the pullback of the earlier nef bundle; it is trivial on $G$ and restricts on $hat(Y) tilde.eq Y_1$ to $b^(*) L_0$. Figure 3 shows the two rulings and the curve on the surface that the second contraction must remove.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((3.6, 0.65), (7.8, 0.65), (8.7, 3.25), (4.5, 3.25), close: true, fill: rgb("#f7f7f7"), stroke: none)
  line((3.825, 1.3), (8.025, 1.3), stroke: (paint: rgb("#c4c4c4"), thickness: 0.4pt, miter-limit: 10))
  line((4.65, 0.65), (5.55, 3.25), stroke: (paint: rgb("#c4c4c4"), thickness: 0.4pt, miter-limit: 10))
  line((4.05, 1.95), (8.25, 1.95), stroke: (paint: rgb("#c4c4c4"), thickness: 0.4pt, miter-limit: 10))
  line((5.7, 0.65), (6.6, 3.25), stroke: (paint: rgb("#c4c4c4"), thickness: 0.4pt, miter-limit: 10))
  line((4.275, 2.6), (8.475, 2.6), stroke: (paint: rgb("#c4c4c4"), thickness: 0.4pt, miter-limit: 10))
  line((6.75, 0.65), (7.65, 3.25), stroke: (paint: rgb("#c4c4c4"), thickness: 0.4pt, miter-limit: 10))
  line((3.6, 0.65), (7.8, 0.65), (8.7, 3.25), (4.5, 3.25), close: true, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  line((4.05, 1.95), (8.25, 1.95), stroke: (paint: rgb("#165b77"), thickness: 1.5pt, miter-limit: 10))
  content((6.65, 3.462), [#text(size: 9pt)[$G= bb(P)^1_( upright("curve") ) times bb(P)^1_( upright("normal") )$]], anchor: "south", padding: 0.1176cm)
  content((6.15, 1.95), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#165b77"))[#text(size: 9pt)[$hat(Y) inter G=E times \{q\}$]]]])])
  content((5.7, 0.5089), [#text(size: 9pt)[curve direction]], anchor: "north", padding: 0.1176cm)
  line((0, 0.7), (2.05, 0.7), stroke: (paint: rgb("#165b77"), thickness: 1.5pt, miter-limit: 10))
  content((1.025, 0.5236), [#text(size: 9pt)[$E subset Y_1 subset T$]], anchor: "north", padding: 0.1176cm)
  line((3.45, 1.65), (1.65, 1.05), stroke: (thickness: 0.75pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((1.6, 2.35), [#text(size: 9pt)[original blowdown#linebreak()$G arrow.r.long bb(P)^1_( upright("curve") )$]])
  line((11.1, 0.75), (11.7, 2.65), stroke: (paint: rgb("#595959"), thickness: 0.8pt, miter-limit: 10))
  circle((11.4, 1.7), radius: 0.09878, fill: rgb("#165b77"), stroke: none)
  content((11.58, 1.7), [#text(size: 9pt)[$q$#linebreak()in $Y_0$]], anchor: "west", padding: 0.1176cm)
  line((8.7, 1.9), (10.7, 1.9), stroke: (thickness: 0.75pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10.35, 3.65), [#text(size: 9pt)[other blowdown#linebreak()$G arrow.r.long bb(P)^1_( upright("normal") )$]])
  content((11.1, 0.3883), [#text(size: 9pt)[image curve#linebreak()in $T'$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 3: The two rulings of the last exceptional divisor in $hat(T)$. The original blowdown contracts the normal-direction fibers and leaves the curve $E$ in $Y_1$ unchanged. The other blowdown, whose target threefold $T'$ is constructed below, contracts the horizontal ruling, including $hat(Y) ∩ G = E times { q }$, so the surface undergoes its point blowdown $Y_1 arrow.r Y_0$. The parallelogram records only the product structure of $G$, whose normal bundle is $cal(O)_G \( - 1 \, - 1 \)$. ],
  ) <fig:blowdown>
  #emph[A polarization for the other contraction.] We seek an ample line bundle $H$ restricting to $cal(O)_G \( alpha \, beta \)$, with $beta > alpha > 0$. Since $cal(O)_(hat(T)) \( G \) \|_G = cal(O)_G \( - 1 \, - 1 \)$, adding $alpha G$ will then give the restriction $cal(O)_G \( 0 \, beta - alpha \)$: it is trivial on the curves to be contracted and positive on the retained factor. Choose an ample integral line bundle $H_0$ on $hat(T)$, with $H_0 \|_G = cal(O)_G \( alpha \, beta_0 \)$, where $alpha \, beta_0 > 0$. Adding $k hat(Y)$ increases the second degree by $k$ and leaves the first unchanged. Choose $k gt.eq 0$ with $beta := beta_0 + k > alpha$. On $hat(Y)$, the line bundle $H_0 + k hat(Y)$ still has positive degree on $E$, because $N_(hat(Y) \/ hat(T)) \|_E$ is trivial. It is therefore relatively ample for $b : hat(Y) arrow.r Y_0$, whose only positive-dimensional fiber is $E$. Adding a sufficiently large multiple $l Q$ makes its restriction to $hat(Y)$ ample.
  We claim that
  $ H = H_0 + k hat(Y) + l Q $
  is ample on all of $hat(T)$. Here $H_0 + l Q$ is ample since $Q$ is nef. We use the following consequence of the Nakai–Moishezon criterion: if $A_0$ is ample, $D_0$ is an effective Cartier divisor, $k gt.eq 0$, and $\( A_0 + k D_0 \) \|_(D_0)$ is ample, then $A_0 + k D_0$ is ample. Indeed, for an irreducible $r$-dimensional subvariety $V$ not contained in $D_0$, the difference of top intersections is
  $ #scale(x: 120%, y: 120%)[\(] \( A_0 + k D_0 \)^r - A_0^r #scale(x: 120%, y: 120%)[\)] dot.op V = k D_0 dot.op V dot.op sum_(j = 0)^(r - 1) \( A_0 + k D_0 \)^j A_0^(r - 1 - j) gt.eq 0 . $
  Every term on the right is a mixed intersection of ample restrictions on the effective cycle $D_0 ∩ V$. For $V subset D_0$, positivity follows directly from the restriction hypothesis. Nakai–Moishezon now applies. Taking $D_0 = hat(Y)$ proves the claim. We have obtained
  #[#set math.equation(numbering: n => "(7.6)")
   $ H \|_G = cal(O)_G \( alpha \, beta \) \, #h(2em) beta > alpha > 0 . $ <proj:ample-degrees>]
  The relative ampleness, Serre vanishing, and numerical ampleness facts used here are standard projective criteria; see #cite(label("Hartshorne")).
  Set $D = H + alpha G$. We shall prove directly that a high multiple of $D$ contracts $G$ to its second factor and has smooth projective image. For a sufficiently large integer $n$, put $L_j = n D - j G$. Then
  $ L_(n alpha) = n H \, #h(2em) L_j \|_G = cal(O)_G #scale(x: 120%, y: 120%)[\(] j \, n \( beta - alpha \) + j #scale(x: 120%, y: 120%)[\)] . $
  Serre vanishing gives $H^1 \( hat(T) \, L_(n alpha) \) = 0$. For $0 lt.eq j < n alpha$, the restriction exact sequences and $H^1 \( G \, cal(O)_G \( j \, n \( beta - alpha \) + j \) \) = 0$ propagate this vanishing downwards:
  #[#set math.equation(numbering: n => "(7.7)")
   $ H^1 \( hat(T) \, L_j \) = 0 #h(2em) \( 0 lt.eq j lt.eq n alpha \) . $ <proj:vanishing>]
  Choose also $n alpha gt.eq 2$ and $n H$ very ample. In particular the restriction maps for $L_0$ and $L_1$ are surjective. The former gives all sections of $cal(O)_G \( 0 \, n \( beta - alpha \) \)$. Hence $\| n D \|$ is basepoint free on $G$ and restricts to the second projection followed by a Veronese embedding. Away from $G$, it contains the system obtained by multiplying sections of $n H$ by the canonical section of $n alpha G$. This subsystem embeds the complement of $G$ and separates each of its points from $G$. Thus $\| n D \|$ defines a projective morphism
  $ phi : hat(T) arrow.r T' $
  that is an isomorphism off $G$ and whose nontrivial fibers are exactly the curves $bb(P)_(upright("curve"))^1 times { t }$.
  #emph[Smoothness of the contracted space and of the surface.] We check the local model, rather than assume that an analytic contraction is projective or smooth. Fix a fiber $F_t = bb(P)_(upright("curve"))^1 times { t }$ of $G arrow.r bb(P)_(upright("normal"))^1$. Use a section of $n D$ nonzero on $F_t$ as an affine denominator. The restriction surjection for $L_0$ gives a section ratio $z$ whose restriction to $G$ is a local coordinate on its second factor. The restriction surjection for $L_1 = n D - G$ gives two section ratios $x \, y$ vanishing on $G$, whose first normal coefficients on $F_t$ are a basis of $H^0 \( bb(P)^1 \, cal(O) \( 1 \) \)$.
  If $e = 0$ is a local equation for $G$, write $x = e a$, $y = e b$. The functions $a \, b$ have no common zero near $F_t$. Thus $\[ x : y \] = \[ a : b \]$ extends across $G$, and the map $\( z \, x \, y \)$ lifts to the blowup of $bb(C)^3$ along the axis $x = y = 0$. On $F_t$, its projective coordinate is the standard isomorphism to the exceptional $bb(P)^1$. In the chart $a eq.not 0$, the coordinates $\( z \, x \, y \/ x \)$ have nonsingular Jacobian along the fiber: they respectively detect its base direction, the direction normal to $G$, and the tangent direction of the fiber. The same holds in the other chart. If injectivity failed on every smaller neighborhood of $F_t$, colliding pairs would have subsequences converging to two points of this compact fiber. Injectivity on the fiber identifies their limits, contradicting local biholomorphism there; hence the lifted map is an isomorphism of neighborhoods. Properness of the standard blowup then allows us to shrink its image to the full inverse image of a neighborhood of the point on the axis.
  All the other affine section ratios defining $phi$ are holomorphic on this blowup neighborhood and descend to holomorphic functions on the unblown-up neighborhood. One may use here the elementary identity $pi_(*) cal(O)_("Bl"_(upright("axis")) bb(C)^3) = cal(O)_(bb(C)^3)$: a function descends off the codimension-two axis and extends across it by normality. Since the entire fiber of $phi$ over $phi \( F_t \)$ is $F_t$, properness ensures that the resulting neighborhood computes the germ of its projective image. In these coordinates that image is a graph over $\( z \, x \, y \)$. Consequently $T'$ is smooth, and $phi$ is the ordinary smooth blowdown of $G$ along its other ruling.
  At $F_q = hat(Y) ∩ G$, transversality in (7.5) makes projection to the blowup of the $\( x \, y \)$-plane a local isomorphism on $hat(Y)$ along $F_q$, and it is an isomorphism on that fiber. The same compactness and shrinking argument gives an isomorphism of neighborhoods with the surface blowup. Its remaining coordinate $z$ is a holomorphic function there and descends to the plane, by the same extension argument. Thus the image of $hat(Y)$ is a smooth surface, and its restriction is exactly the point blowdown of $E$. By uniqueness of that blowdown, this image identifies with $Y_0$.
  Finally, smooth blowups and blowdowns along smooth centers of complex codimension at least two preserve fundamental groups. This follows from the usual tubular-neighborhood model and van Kampen, or from general position together with the simply connected projective-space fibers. The earlier threefold construction preserved the groups compatibly with the surface inclusion. The final diagram
  $ hat(Y) arrow.r hat(T) arrow.r T' \, #h(2em) hat(Y) tilde.eq Y_1 arrow.r^b Y_0 subset T' $
  shows that the induced identifications also preserve the homomorphism from the surface. Taking $S_0 = T'$ gives the required $theta$. ◻
]

=== 7.3 Completion of the construction <completion-of-the-construction>

#thm([Theorem 7.3.])[
  #emph[There exist a simple abelian surface $A$, a smooth connected projective complex variety $S'$, and a closed embedding $A arrow.r.hook S'$ such that 
$ "im" #scale(x: 120%, y: 120%)[\(] pi_1 \( A \) arrow.r pi_1 \( S' \) #scale(x: 120%, y: 120%)[\)] tilde.eq bb(Z) . $

]
] <thm:cyclic-embedding>

#proof[
  Theorem 18 gives an iterated point blowup $Y$ of the simple abelian surface $A$, a smooth connected effective proper orbifold $cal(S)$ with projective coarse space, and a map $Y arrow.r cal(S)$ whose image lies in the ordinary locus and whose fundamental-group image is infinite cyclic. Lemma 24 replaces this map by an embedding $Y arrow.r.hook S$ with the same group image. Apply Lemma 25 to the point blowups in reverse order. Every step preserves both the ambient fundamental group and the homomorphism from the surface. After the last step the surface is $A$, giving the asserted embedding and cyclic image. ◻
]

#proof[
  Apply Proposition 2 to the embedding supplied by Theorem 26. The resulting smooth connected projective fourfold contains $A$ with infinite cyclic fundamental-group image, has large fundamental group, and has a non-Stein universal cover. By Lemma 3, its universal cover contains no positive-dimensional compact complex-analytic subvariety. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
