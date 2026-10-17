#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 1in, y: 1in), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A-boundary-only-obstruction-to-four-dimensional-disk-embedding-September-24-2026]]
#align(center)[]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The Whitney trick is the geometric step that turns algebraic cancellation of intersections into disjoint embedded surfaces. In dimension four, the Whitney discs needed for this step may themselves meet the surfaces one is trying to separate. The disc embedding problem asks whether algebraic intersection data, supplemented by suitable dual spheres, suffice to produce the embedded discs. Its solution for good fundamental groups underlies topological surgery and the five-dimensional $s$-cobordism theorem for four-manifolds #cite(label("FQ1990")) Theorem 5.1A and Chapters 7 and 11.

Here is the formulation we use. Let $M$ be an oriented four-manifold, let $pi = pi_1 \( M \)$, and fix basing paths, or #emph[whiskers], for all surfaces. The equivariant intersection pairing $lambda$ records an intersection point with its sign and the element of $pi$ obtained from these paths; its values lie in $bb(Z) \[ pi \]$. A family of sphere maps $g_j$ is algebraically dual to disc maps $f_i$ if $lambda \( f_i \, g_j \) = delta_(i j) 1$. A geometric dual meets its corresponding disc in one transverse point and misses the other discs. We use the reduced Wall invariant

#[#set math.equation(numbering: n => "(1.1)")
 $ tilde(mu) : pi_2 \( M \) arrow.r bb(Z) \[ pi \] \/ chevron.l h - h^(- 1) \, thin bb(Z) dot.op 1 chevron.r_(upright("add")) . $ <eq:wall-convention>]

The quotient is additive, rather than a quotient by a group-ring ideal; these are the oriented conventions of #cite(label("PRT2025")) Section 1.3.

The disc embedding theorem applies to disc maps with disjoint locally flatly embedded boundaries and algebraic dual spheres satisfying $lambda \( g_i \, g_j \) = 0 = tilde(mu) \( g_i \)$. When $pi$ is good, it produces disjoint locally flat discs with those boundaries, with geometric duals, and with the induced boundary framings preserved for generically immersed input discs #cite(label("PRT2025")) Theorem A. The unrestricted disc embedding conjecture asks for this implication without the good-group assumption. Theorem 1 disproves it by excluding every disjoint locally flat filling of the specified boundary circles, even when no output framing or dual sphere is required.

#thm([Theorem 1.1.])[
  #emph[There exist a compact connected oriented smooth four-manifold $M$ with nonempty boundary, an integer $k gt.eq 1$, proper generically immersed discs 
$ f_i : \( D^2 \, S^1 \) arrow.r \( M \, partial M \) \, #h(2em) 1 lt.eq i lt.eq k \, $

 whose boundary restrictions form an embedding of $product.co_i S^1$, and framed sphere maps $g_i : S^2 arrow.r M$ such that 
#[#set math.equation(numbering: n => "(1.2)")
 $ lambda \( f_i \, g_j \) = delta_(i j) thin 1 \, #h(2em) lambda \( g_i \, g_j \) = 0 \, #h(2em) tilde(mu) \( g_i \) = 0 quad \( 1 lt.eq i \, j lt.eq k \) \, $ <eq:input-invariants>]

 but the given boundary circles do not bound pairwise disjoint proper locally flat embedded discs in $M$. Each $g_i$ can be chosen to be a smooth embedded sphere; different $g_i$ are allowed to intersect.]
] <thm:main>

The boundary condition in this formulation is classical. The additional force of the conclusion is its nonexistence assertion: changing the relative homotopy classes of the prospective discs cannot evade the obstruction. The vanishing assumptions are placed on the dual spheres; no vanishing of the intersections among the input discs is needed.

=== 1.1 Good groups and the free-group problem <good-groups-and-the-free-group-problem>

Casson supplied the handle-embedding construction that makes the simply connected theory possible. Freedman proved that every Casson handle is homeomorphic, relative to its attaching region, to an open two-handle #cite(label("Freedman1982")) Theorems 3.1 and 1.1. Together these results replace the unavailable smooth Whitney discs by topological ones. Freedman–Quinn developed a version using capped gropes, obtained by attaching surfaces along symplectic basis curves and closing the upper curves with immersed caps #cite(label("FQ1990")) Chapters 2–5. The caps may intersect; the loops through these intersections carry the fundamental-group information that must be controlled.

Goodness is a local condition on such models. In the formulation of #cite(label("PRT2025")) Definition 3.2, every height-$1.5$ disc-like capped grope, equipped with a homomorphism from its fundamental group to the group in question, must have an immersed disc in its four-dimensional thickening with the same framed boundary whose double-point loops map to the identity. A height-$1.5$ grope has a first surface stage with further surface stages attached along one curve from each symplectic pair; its remaining tips are capped. The thickenings used in this test have free fundamental groups, which explains the central role of the free-group case #cite(label("FT1995")) pp. 510–511.

Freedman–Teichner extended the positive theory to all groups of subexponential growth #cite(label("FT1995")) Theorem 0.1. Krushkal–Quinn gave a different proof based on splitting gropes into dyadic branches and organizing the resulting double-point words #cite(label("KQ2000")) p. 408. Their paper also contains the correction to the earlier height-raising argument. The known class is closed under subgroups, quotients, extensions and directed colimits; it includes finite and solvable groups as well as groups of subexponential growth #cite(label("PRT2025")) Section 1.1. Thus exponential growth alone does not mark the boundary of the theorem. The nonabelian free-group case remained open in the 2025 account #cite(label("PRT2025")); see also #cite(label("KOPR2021")) Chapter 23 for its place among four-manifold problems.

The construction of geometric dual spheres requires attention even in the positive theory. Powell–Ray–Teichner supplied the missing construction in the proof of Freedman–Quinn’s theorem and also controlled the homotopy classes of those duals #cite(label("PRT2025")) Theorem A and Remark 1.3. Their correction concerns output geometric duals and is distinct from the height-raising correction in #cite(label("KQ2000")).

#thm([Corollary 1.2.])[
  (Nongoodness of the free group).  #emph[The free group $F_2$ on two generators is not good in the sense of Freedman–Quinn. Every group containing a subgroup isomorphic to $F_2$ is likewise not good.]
] <cor:nongood>

#proof[
  The group $pi_1 \( M \)$ of the manifold in Theorem 1 is finitely presented because compact smooth manifolds have finite CW homotopy type. It is not good: otherwise #cite(label("PRT2025")) Theorem A, applied to the discs and spheres in (1.2), would supply the forbidden embedded discs.
  Choose a finite generating list for $pi_1 \( M \)$ of length $r gt.eq 2$, padding if necessary. There is then a surjection $F_r arrow.r.twohead pi_1 \( M \)$. The elements $a^j b a^(- j)$ for $0 lt.eq j < r$ freely generate a rank-$r$ subgroup of $F_2 = chevron.l a \, b chevron.r$, as follows from reduced-word normal form. Subgroups and quotients of good groups are good #cite(label("PRT2025")) Section 1.1, p. 4. If $F_2$ were good, its subgroup $F_r$ and then the quotient $pi_1 \( M \)$ would be good, a contradiction. Finally, a good group containing a subgroup isomorphic to $F_2$ would make $F_2$ good by subgroup closure, which proves the last assertion. ◻
]

The conclusion about $F_2$ is group-theoretic: it does not identify $pi_1 \( M \)$ with $F_2$, and the geometric counterexample remains the one in Theorem 1.

=== 1.2 Surgery and previous obstruction approaches <surgery-and-previous-obstruction-approaches>

The free-group problem also has concrete link formulations. Freedman asked whether the Borromean rings are $A$–$B$ slice #cite(label("Freedman1986AB")). Here each component is assigned a decomposition $D^4 = A_i union B_i$ extending the standard genus-one decomposition of $S^3$. One seeks disjoint copies of all the pieces with attaching curves given by the link and a parallel copy; each copy must extend to an ambient self-homeomorphism of $D^4$. Freedman–Lin relate this condition for the full generalized Borromean family to topological surgery, equivalently to slicing the corresponding Whitehead doubles with meridians freely generating the slice-complement group #cite(label("FL1989")) pp. 91–92.

Two results show why this obstruction program is delicate. Krushkal proved that every link with vanishing pairwise linking numbers is weakly $A$–$B$ slice, where the ambient-extension requirement is removed #cite(label("Krushkal2008")) Theorem 1 and Definition 2.4. Freedman–Krushkal subsequently constructed homotopy $A$–$B$ slices for the universal generalized Borromean family using the $2$-Engel relation #cite(label("FK2016")) Theorem 1 and Definition 3.10. These are positive results for weakened embedding problems. The present obstruction instead starts from the actual images of hypothetical embedded discs and extracts restrictions on them through representation deformations. The independent conjugates of all triple commutators used here are specified in Section 2; they are not an invocation of the Engel relation.

Positive surgery results for free fundamental groups also persist in important special cases. Krushkal–Lee solve the unobstructed surgery problem for a degree-one normal map from a closed four-manifold to a Poincare complex with free fundamental group, when the target intersection pairing is extended from the integers #cite(label("KL2002")) Theorem 1. Their proof cuts along inverse images of points under a map to a graph and reduces the stabilized problem to the simply connected case. In our construction the corresponding cuts have torus boundaries. Their boundary restriction data are retained throughout the obstruction; the closed-manifold result does not supply fillings for them #cite(label("KL2002")) Introduction, Remark.

For precision, we use the following two unrestricted assertions in the sense of #cite(label("KPT2021")) Conjectures 1.5–1.6. The #emph[topological surgery assertion] says that a degree-one normal map from a compact four-manifold to a four-dimensional Poincare pair $\( Z \, partial Z \)$, which is a $bb(Z) \[ pi_1 \( Z \) \]$-homology equivalence on the boundary and has zero Wall surgery obstruction, is normally bordant relative to the boundary to a homotopy equivalence. The #emph[$s$-cobordism assertion] says that every compact five-dimensional topological $s$-cobordism with a specified product on its boundary is homeomorphic to a product extending that boundary structure. Neither assertion restricts the fundamental group.

#thm([Corollary 1.3.])[
  #emph[The unrestricted topological surgery and $s$-cobordism assertions cannot both hold.]
] <cor:surgery-conjunction>

#proof[
  Together these assertions imply the unrestricted disc embedding conjecture #cite(label("KPT2021")) Section 3. Its algebraic hypotheses apply to the finite family of discs and framed spheres in the compact manifold of Theorem 1, so it would give the excluded boundary filling. ◻
]

The corollary concerns their conjunction; it does not determine which assertion fails. In particular, the free-group conclusion above is not being used as a substitute for the quoted equivalence.

=== 1.3 The obstruction <the-obstruction>

The construction starts with a smooth four-manifold having the homotopy type of a finite graph. A finite family of capped gropes inside it encodes every triple commutator of suitably conjugated end generators. Removing neighborhoods of the grope bases gives the actual manifold $M$. The shallow caps are the input discs. Product tori, compressed using the upper stages, give the spheres in (1.2). The proof checks their framings and all equivariant cancellation labels in $pi_1 \( M \)$.

Suppose disjoint locally flat discs with the prescribed boundaries existed. They would permit a graph map to be altered near their images and then cut along regular levels. The resulting three-dimensional walls have one torus boundary apiece, and the complementary four-dimensional region carries the triple commutator relations. An adjoint $"SL"_2 \( bb(C) \)$ local system turns these relations into a cube-zero ideal in a representation deformation ring. A two-sheeted Mayer–Vietoris calculation supplies two complementary tangent spaces.

The comparison of representation deformations and flat connections has a classical differential graded Lie algebra formulation in Goldman–Millson #cite(label("GM1988")) Proposition 2.6 and Section 6. Here finite transition-cochain charts retain the equations themselves, which will be needed with their full ideal structure.

To describe the resulting obstruction, label the walls $1 \, dots.h \, d$. Write $a_i in bb(C)^3$ for holonomy coordinates centered at the identity along a chosen boundary circle on the $i$th wall’s torus, and $y_i$ for its remaining deformation coordinates. Its function $P_i \( a_i \, y_i \)$ is a boundary-polarized version of the Chern–Simons transgression integral #cite(label("ChernSimons1974")) Section 3. Write $a = \( a_i \)_i$, and let $t$ be the remaining deformation parameters of the cut four-manifold. Label its two copies of each wall so that the chosen holonomy may vary on the positive copy and is trivial on the negative copy. Their restrictions then have the form $\( a_i \, Y_i^(+) \( a \, t \) \)$ and $\( 0 \, Y_i^(-) \( a \, t \) \)$. Let $Y = \( Y_i^(+) \, Y_i^(-) \)_i$, and let $C = \( C_i^(+) \, C_i^(-) \)_i$ be independent tuples with each $C_i^plus.minus$ of the same size as $y_i$. Put

$ Psi \( a \, C \) = sum_i #scale(x: 120%, y: 120%)[\(] P_i \( a_i \, C_i^(+) \) - P_i \( 0 \, C_i^(-) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) v \( a \, t \) = \( partial_C Psi \) \( a \, Y \( a \, t \) \) . $

Here differentiation precedes restriction to the graph $C = Y \( a \, t \)$. If $frak(r)$ is the ideal of equations for the four-dimensional representation chart, the two identities are

$ \( v \) = frak(r) \, #h(2em) Psi \( a \, Y \( a \, t \) \) in frak(r)^2 . $

The first identifies the whole ideal, including its nilpotent information. If the derivatives missed an equation, the resulting first obstruction to flatness would pair trivially with every wall variation. Duality and the paired Mayer–Vietoris isomorphism would then kill its curvature class, permitting a flat lift that contradicts the minimality of the defect equations. The second identity comes from comparing the wall connections on the closed boundary of the cut manifold: Stokes turns their total value into an integral of curvature squared.

Choose one scalar coordinate $a_(i \, 1)$ on each wall and set $p_i \( y_i \) = partial_(a_(i \, 1)) P_i \( 0 \, y_i \)$. The end-holonomy cube law gives two distinct families of memberships, for every triple of labels:

$ a_(i \, 1) a_(j \, 1) a_(k \, 1) in \( v \) \, #h(2em) p_i \( Y_i^(-) \) p_j \( Y_j^(-) \) p_k \( Y_k^(-) \) in \( v \) . $

The boundary term in polarized variation places each $p_i \( Y_i^(-) \)$ in the end-deviation ideal modulo $frak(r)$, giving the second family. These are ideal memberships with coefficients, stronger than statements about the common zero set.

The next step makes these identities available in positive characteristic. All gradient jets of each original $P_i$ have representatives in one fixed smooth complex algebraic chart. This allows replacement of $P_i$, to sufficiently high order along its wall ideal, by an algebraic germ. The replacement uses exactness and faithful flatness of completion #cite(label("Stacks")) Tags 00MA–00MC and differential tests for symbolic powers #cite(label("DSGJ2020")) Theorem 3.6 and Lemma 2.3. The square-value identity then permits a formal correction of $Y$ making $Psi$ vanish exactly on the corrected graph. An invertible change of gradient generators transports both displayed cubic memberships to that graph. Only finitely many constants and inverse Jacobians are needed for the new potentials, the correction and its membership witnesses, so all these data specialize to a field $𝕜$ of positive characteristic. The corrected graph need not describe representations; the original end-holonomy cube law has already supplied the two memberships that the remaining argument uses.

In characteristic $ell$, quotienting by the separate $ell$th powers of the coordinates gives a finite-dimensional complex of differential forms. The corrected graph at $a = 0$ and its copy with the positive and negative blocks exchanged have complementary tangent spaces, and the potential vanishes on both. They determine cohomology classes with nonzero pairing. Using this pairing and the cubic law for the $p_i$, we construct, when there are at least five walls, two classes in a deformation of the complex whose pairing is a unit in the deformation ring. The cubic law for the $a_(i \, 1)$ then forces a nonzero parameter product times that pairing to vanish. Section 6 constructs this contradiction in the finite complex.

Lemma 33 and Theorem 41 are stated independently of the geometric construction. They are available for other problems meeting their respective stated hypotheses; in Theorem 41 these include both cubic ideal-membership laws. No additional application is asserted here.

=== 1.4 Conventions and organization <conventions-and-organization>

All manifolds used in the construction are compact and smooth until the hypothetical locally flat discs are introduced. Corners are rounded when needed. Boundary orientations use the outward-normal-first convention. The commutator is $\[ x \, y \] = x y x^(- 1) y^(- 1)$, and changes of basing are retained as explicit conjugating words. A framed surface has a trivialized real normal two-plane bundle. The symbol $frak(m)$ denotes the maximal ideal of the local parameter ring currently in use. Formal series are always completed at the specified reference representation or origin.

Section 2 constructs the input discs and algebraic duals, and converts a hypothetical boundary filling into smooth cut data. Section 3 obtains complementary restriction tangents and the cubic holonomy law. Section 4 constructs the wall potentials and proves the derivative-ideal and square-ideal identities. Section 5 replaces the potentials by algebraic germs, corrects the restriction graph, and specializes the identities to positive characteristic. Section 6 proves the finite algebraic obstruction. Section 7 assembles these implications to prove Theorem 1.

== 2 A finite geometric test for disc embedding <sec:geometry>

We construct the input discs and their algebraic duals in an actual smooth four-manifold. The geometric conclusion needed later is conditional: any system of disjoint proper topological discs with the prescribed boundaries produces the smooth cut data specified in Proposition 11. In particular, the reduction places no relative homotopy requirement on those hypothetical discs. Intersection and reduced self-intersection invariants have the conventions of #cite(label("PRT2025")) Section 1.3; no disc-embedding theorem is used in this section.

=== 2.1 The ambient manifold and its boundary <the-ambient-manifold-and-its-boundary>

Fix an integer $d gt.eq 5$. For each $e in { 1 \, dots.h \, d }$ take two end labels $\( e \, 0 \) \, \( e \, 1 \)$, and put

$ cal(E) = { \( e \, epsilon \) : 1 lt.eq e lt.eq d \, med epsilon in { 0 \, 1 } } . $

The two ends have no preferred positive or negative designation yet.

Let $V$ be the oriented four-dimensional $1$-handlebody with $3 + 2 d$ handles. Label $2 d$ of its handle generators by the ends, and name the remaining three $h_0 \, h_(+) \, h_(-)$. Its boundary is a connected sum of $3 + 2 d$ copies of $S^1 times S^2$. In a separate punctured summand for each end $a$, choose a standard generator knot $K_a = S^1 times { upright("point") }$ and a closed tubular solid torus $N_a$. Choose all connected-sum balls away from these tori. On $partial N_a$ write $ell_a$ for the product longitude and $m_a$ for the meridian. Define

$ Q = overline(partial V \\ union.big_(a in cal(E)) "int" N_a) . $

The choices of basepoint and paths in $Q$ will be fixed throughout.

For each $e$, attach an oriented $4$-ball $P_e$ to $V$ along $N_(e \, 0)$ and $N_(e \, 1)$. In $partial P_e = S^3$ these are tubular neighborhoods of the two components of the standard Hopf link. Choose the gluing maps to identify the generator and product framing with those on $N_(e \, 0)$ and $N_(e \, 1)$, using the signs that give an oriented gluing. Equivalently, take the rounded product ball $D^2 times D^2$ and its two coordinate core discs. Denote the resulting compact smooth manifold, after rounding corners, by $G$. The remaining boundary portion of $P_e$ is a Hopf-link exterior

#[#set math.equation(numbering: n => "(2.1)")
 $ C_e tilde.equiv T^2 times \[ 0 \, 1 \] . $ <geo:hopf-collar>]

Under its two end identifications, $ell_(e \, 0)$ is $m_(e \, 1)$ and $m_(e \, 0)$ is $ell_(e \, 1)$, up to orientation signs. Thus the two longitude slopes become distinct coordinate circles on one common torus. The two core discs are framed and cross once; their small parallels have the explicit form

#[#set math.equation(numbering: n => "(2.2)")
 $ D^2 times { a_nu } \, #h(2em) { b_mu } times D^2 \, $ <geo:product-sheets>]

with distinct parameters in each family. Each opposite-family pair crosses once and each same-family pair is disjoint.

#thm([Lemma 2.1.])[
  (Graph model and peripheral group).  #emph[The manifold $Q$ is connected and 
$ pi_1 \( Q \) = F \( h_0 \, h_(+) \, h_(-) \, z_a med \( a in cal(E) \) \) \, #h(2em) \[ ell_a \] = z_a \, quad \[ m_a \] = 1 . $

 The manifold $G$ has the homotopy type of the rose $Gamma$ on $h_0 \, h_(+) \, h_(-) \, q_1 \, dots.h \, q_d$. There is a homotopy equivalence $p_0 : G arrow.r Gamma$ that sends $V$ into the $h$-subrose $Gamma_h$, induces the named generators on $h$, kills the end generators, and on each $C_e$ is its interval coordinate traversing $q_e$ once.]
] <geo:graph>

#proof[
  In an end summand, deleting $S^1 times "int" D^2$ leaves $S^1 times D^2$ with a ball removed. The old meridian bounds the complementary $D^2$, whereas the old longitude generates its fundamental group. Van Kampen across the connected-sum spheres gives the displayed free product and proves connectedness.
  All attachments are collared cofibrations, so the ordinary gluing computes the homotopy pushout. Replace $V$ by its bouquet of handle circles, each $N_a$ by its generator circle, and each $P_e$ by a point. For an edge $e$ the resulting pushout cones off the two independent circles $z_(e \, 0) \, z_(e \, 1)$ to the same new point. Each of the two cone discs retracts onto an arc from the old bouquet point to this cone point, keeping both endpoints fixed. The two arcs together give one circle $q_e$. The other circles are the three $h$ circles. The only point of each boundary circle shared with the other summands is the old bouquet point, so these retractions are compatible. This proves the asserted graph homotopy type.
  On $V$ take the handle map retaining the $h$ circles and constant on each $N_a$. On $P_e$ prescribe a function to $\[ 0 \, 1 \]$ equal to $0$ and $1$ on its two attaching tori and to the product coordinate on $C_e$. The compatible boundary function extends over the ball: extend it as a real function and compose with the retraction of $bb(R)$ onto $\[ 0 \, 1 \]$. Compose with the edge $q_e$, whose endpoints are the common vertex. The resulting map induces the graph identification just described, and is therefore a homotopy equivalence. All boundary values may be taken productwise in collars. ◻
]

Figure 1 records both parts of this construction: the new graph loop and the interchange of the two peripheral slopes.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 2.7cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$V$#linebreak()$h,z_(e,0),z_(e,1), dots.h$]]])])
  content((4.3, 0), [#box(width: 2.4cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$P_e=D^2 times D^2$#linebreak()two core cap types]]])])
  line((1.35, 0.85), (3.1, 0.85), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((2.225, 0.85), [#text(size: 9pt)[$N_(e,0)$]], anchor: "south", padding: 0.1176cm)
  line((1.35, -0.85), (3.1, -0.85), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((2.225, -0.85), [#text(size: 9pt)[$N_(e,1)$]], anchor: "north", padding: 0.1176cm)
  content((2.1, -1.7), [#text(size: 9pt)[Remaining boundary: $C_e=T^2 times [0,1]$#linebreak()$ell_(e,0) arrow.l.r m_(e,1)$, $m_(e,0) arrow.l.r ell_(e,1)$]])
  line((6.05, 0), (6.8, 0), stroke: (thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.4, 0.65), [#text(size: 9pt)[homotopy#linebreak()model]], anchor: "south", padding: 0.1176cm)
  circle((7.8, 0), radius: 0.07056, fill: black, stroke: none)
  circle((9.8, 0), radius: 0.07056, fill: black, stroke: none)
  bezier((7.8, 0), (9.8, 0), (8.4, 1), (9.2, 1), stroke: (thickness: 0.5pt, miter-limit: 10))
  bezier((7.8, 0), (9.8, 0), (8.4, -1), (9.2, -1), stroke: (thickness: 0.5pt, miter-limit: 10))
  bezier((7.8, 0), (7.8, 0), (6.9, 1.3), (6.9, -1.3), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((7.15, -0.75), [#text(size: 9pt)[$h$]])
  content((8.8, 0), [#text(size: 9pt)[$q_e$]])
  content((8.7, -1.7), [#text(size: 9pt)[Two end circles contract;#linebreak()two remaining arcs give one loop.]])
})],
  caption: [Figure 1: Incidence and peripheral data for one special edge. This is a gluing schematic, not a drawing of an embedding of the four-manifold in three-dimensional space. The Hopf exterior interchanges longitude and meridian; the ball kills two end generators and contributes the single graph loop $q_e$. ],
) <geo:fig-graph>

=== 2.2 The word list and capped stages <the-word-list-and-capped-stages>

Write $\[ u \, v \] = u v u^(- 1) v^(- 1)$ and $z^c = c z c^(- 1)$. Let $F_h$ be free on the three named generators $h_0 \, h_(+) \, h_(-)$. Take $cal(H)$ to be all reduced words of length at most five in $h_0^(plus.minus 1) \, h_(+)^(plus.minus 1) \, h_(-)^(plus.minus 1)$, including the empty word. This is a finite set closed under inversion and reversal. Put

$ cal(R) = \( cal(E) times cal(H) \)^3 . $

Thus $k = \| cal(R) \| = \( 2 d thin \| cal(H) \| \)^3$ is finite. The entry $r = \( \( a \, c_1 \) \, \( b \, c_2 \) \, \( c \, c_3 \) \)$ specifies the word

#[#set math.equation(numbering: n => "(2.3)")
 $ R_r = \[ z_a^(c_1) \, \[ z_b^(c_2) \, z_c^(c_3) \] \] . $ <geo:relations>]

All triples occur, including repetitions, and the three conjugators vary independently.

We realize each $R_r$ by two punctured tori. The base $B_r$ has basis curves $alpha_r \, beta_r$: the first receives a cap of end type $a$, while the second receives a punctured torus $S_r$ for the inner commutator. Its basis curves $x_r \, y_r$ receive caps of end types $b \, c$. Compressing $S_r$ with two copies of its $x_r$ cap will provide the contracting disc used to construct a dual sphere. We retain the unused $y_r$ cap as well; it will identify the group-ring labels of paired intersections in the exterior of the bases.

A #emph[body] means one of these embedded punctured tori, excluding its caps. Bodies and their attaching collars will be disjoint except at the prescribed attachments. Opposite end cap types are allowed to cross in $P_e$. We first explain how the ribbon construction controls the attachment framings, then assemble the finite word list.

#thm([Lemma 2.2.])[
  (The framed ribbon operation).  #emph[Given two disjoint oriented framed knots in the interior of $Q$ and a relative path class joining them, one can construct a punctured torus in a level of a collar $Q times \[ 0 \, epsilon.alt \)$ whose two basis curves resolve normally to these knots. Its oriented boundary represents their commutator, with the change of basing given by the chosen path. The two band framings can be varied by arbitrary integers independently. The resolved knots admit disjoint rising annuli to the given framed knots, and a unit band twist changes the relative oriented normal framing of its annulus by a unit integer.]
] <geo:framing>

#proof[
  Represent the path by an embedded arc disjoint from the knots except at its endpoints. Along a narrow finger following this arc move a short strand of the second knot to the first, stopping when the two strands meet transversely in a small two-dimensional patch. Before the final contact the move is an isotopy. Thicken the resulting crossed graph to an oriented ribbon with alternating cyclic order of the four half-edges at the crossing. Its regular neighborhood is a punctured torus. Choose the normal resolution determined by the pre-contact strands. Reversing that specific finger isotopy recovers the original two-component link. The boundary traverses the circuits in the order $u v u^(- 1) v^(- 1)$, after a choice of orientation and basing. The two sides of the finger insert precisely the chosen change-of-basing path and its inverse.
  The ribbon away from the crossing consists of separate bands. Insert full twists in either band, supported in a short segment away from the crossing and the other band. Take its supporting tube disjoint from the other resolved knot as well. Shrinking the displacement in this tube gives an ambient isotopy of the resolved link that fixes its other component. Thus a twist preserves the chosen two-component resolution, including its linking. The lateral ribbon vector rotates once per full twist, giving independent integer changes to the two knot framings.
  Here is the normal-bundle calculation needed to transfer that integer to a cap attachment. Let $t$ be tangent to a basis curve, $b$ its lateral ribbon vector, $n$ the normal to the ribbon in the level three-manifold, and $v$ the positive collar direction. A rising annulus initially has tangent plane spanned by $t$ and $r = a n + c v$, with $a^2 + c^2 = 1$ and $c > 0$. Set $w = c n - a v$. Its oriented normal quotient has frame $\( \[ b \] \, \[ w \] \)$. Subtracting the $v$ component divided by $c$ times $r$ identifies this quotient with the normal plane of the movie knot in the level slice, and gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ \[ b \] mapsto \[ b \] \, #h(2em) \[ w \] mapsto \[ n \/ c \] . $ <geo:normal-quotient>]
  Thus it carries exactly the ribbon framing, with a positive rescaling of the second vector. During one band twist the pair changes to
  $ b_theta = cos theta thin b + sin theta thin n \, #h(2em) n_theta = - sin theta thin b + cos theta thin n \, $
  where $theta$ makes a full turn. Equation (2.4) has degree one in the oriented rank-two frame group, up to the chosen sign convention. This is an integer calculation in $pi_1 \( "GL"^(+) \( 2 \, bb(R) \) \)$, rather than a calculation of the parity of an ambient three-frame.
  The separation of the attaching annuli can be checked in local collar coordinates $\( x \, y \, n \, v \)$, with the body in $n = v = 0$ and its basis curves the $x$- and $y$-axes. Choose the signs of these coordinates to match the selected normal resolution, and take the initial annuli to be
  $ \( x \, 0 \, s \, s \) \, #h(2em) \( 0 \, y \, - s \, s \) \, #h(2em) s gt.eq 0 . $
  They meet on the body at $s = 0$ and are disjoint for $s > 0$. At a small positive level they give the chosen normal resolution; continue them by the inverse finger isotopy of the whole link. The band-twist isotopies just described are supported away from the other component, so their traces also preserve this disjointness. Figure 2 separates the body coordinates from the normal coordinates in this local model. Along a rising movie the same quotient identification transports the framing to the given knot. Consequently a full band twist changes by one the obstruction to extending a prescribed ordered normal frame over an upper cap disc. Killing that integer extends both vectors: an extended nonzero first vector and its oriented quarter-turn give a frame, whose second vector can be adjusted at the boundary through positive independent vectors. This also explains why the statement controls a prescribed boundary framing, not just abstract triviality of a disc bundle. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1.9, -1.25), (1.9, 1.25), fill: rgb("#f2f2f2"), stroke: none)
  line((-1.7, 0), (1.7, 0), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.7, 0), [#text(size: 9pt)[$x$]], anchor: "west", padding: 0.1176cm)
  line((0, -1.05), (0, 1.05), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 1.05), [#text(size: 9pt)[$y$]], anchor: "south", padding: 0.1176cm)
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, -1.8), [#text(size: 9pt)[Body plane $n=v=0$#linebreak()basis curves meet once]])
  line((4, 0), (8, 0), stroke: (paint: rgb("#808080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((8, 0), [#text(size: 9pt)[$n$]], anchor: "west", padding: 0.1176cm)
  line((6, -0.2), (6, 1.65), stroke: (paint: rgb("#808080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((6, 1.65), [#text(size: 9pt)[$v$]], anchor: "south", padding: 0.1176cm)
  line((6, 0), (7.3, 1.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.3, 1.3), [#text(size: 9pt)[$x$-annulus#linebreak()$n=v=s$]], anchor: "west", padding: 0.1176cm)
  line((6, 0), (4.7, 1.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.7, 1.3), [#text(size: 9pt)[$y$-annulus#linebreak()$n=-s,#h(0.3333em) v=s$]], anchor: "east", padding: 0.1176cm)
  line((4.4, 0.75), (7.6, 0.75), stroke: (thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  circle((5.25, 0.75), radius: 0.07056, fill: black, stroke: none)
  circle((6.75, 0.75), radius: 0.07056, fill: black, stroke: none)
  content((7.65, 0.75), [#text(size: 9pt)[$v=s>0$]], anchor: "west", padding: 0.07056cm)
  content((6, -1.8), [#text(size: 9pt)[Normal plane $(n,v)$#linebreak()separate points at each positive level]])
})],
  caption: [Figure 2: Local coordinates for the ribbon attachment. The left panel shows the intersecting basis curves in the body plane; the right panel shows their distinct rising rays in the normal $\( n \, v \)$-plane. At each positive collar level the two annuli are separated in $n$. The chosen resolution is the one recovered by reversing the pre-contact finger isotopy. This local picture makes no assertion that cap images are mutually disjoint. ],
) <geo:fig-ribbon>

#thm([Lemma 2.3.])[
  (Simultaneous capped stages).  #emph[For every $r in cal(R)$ there is a punctured torus $B_r$ properly embedded in $V$, with boundary a knot in $"int" Q$. The $B_r$ are mutually disjoint. They have intersecting basis curves $alpha_r \, beta_r$ and the following attachments in $G$:]
  + #emph[A shallow cap at $alpha_r$ ends in a separate parallel copy of the core disc of end $a$.]
  + #emph[A further punctured torus $S_r$ is attached at $beta_r$. Its basis curves $x_r \, y_r$ have caps of end types $b \, c$, respectively. Its boundary, with the prescribed basing, represents $\[ z_b^(c_2) \, z_c^(c_3) \]$, and $partial B_r$ represents $R_r$.]
  + #emph[Compressing $S_r$ along $x_r$ with two framed parallels of its cap produces an embedded disc $D_r$. Intersections of $D_r$ with other objects are allowed. The extension of $D_r$ towards $beta_r$ has a framing that extends the angular normal-circle vector required to compress $beta_r times S^1$.]
  #emph[Except at the intended attachments, every body and attaching collar is disjoint from every other such piece. All other intersections are transverse crossings of opposite end cap sheets in the product charts (2.2).]
] <geo:stages>

#proof[
  Give each leaf occurrence its own parallel longitude knot on the $Q$ side of its end torus, even when several occurrences have the same label. Reserve a separate return lane inside the corresponding solid torus. Each lane leads to its own framed core-disc parallel in $P_e$. There are finitely many occurrences, so all lanes may be chosen disjoint within each end family.
  Choose narrow, separated ranges of collar levels centered at
  $ 0 < t_B < t_S < t_T < epsilon.alt . $
  The base-body operations occupy the range about $t_B$, the inner-body operations the range about $t_S$, and the transfers into the end solid tori the range about $t_T$. Each body-operation range includes room above its body level for the rising resolution and inverse finger isotopy of Lemma 5. Between ranges, continuing knots run in narrow disjoint pipes; at an active range all inactive continuations remain in their pipes.
  To trace one relation through these heights, its base boundary rises from level zero to $B_r$ near $t_B$. The shallow attachment at $alpha_r$ continues to the transfer range. The other attachment rises from $beta_r$ to the boundary of $S_r$ near $t_S$; the two attachments at $x_r \, y_r$ then rise through their own pipes to the transfer range. There every leaf moves from the $Q$ side into its end solid torus and returns down its reserved lane in the torus interior to its cap in $P_e$. These downward lanes lie outside the $Q$-side body neighborhoods. The construction order is upper stage first: after making $S_r$, we carry its boundary down to a handoff knot at the upper side of the base-operation range. With this knot and the slot-$1$ leaf fixed above the lower body level, we choose their connecting arc. The lower ribbon’s rising movie then joins the body to those two inputs. Thus the later base operation is below the earlier upper body and avoids the inactive leaf pipes.
  For either body-operation range, once its input knots have been fixed, choose the connecting arcs with separate endpoints and the prescribed relative path classes in $Q$. General position in this three-manifold makes the finitely many arcs embedded, mutually disjoint and disjoint from the other knots. No prescribed path class in a fixed link complement is needed. Small neighborhoods of these graphs accommodate the ribbons, isotopies and local twists.
  Choose the connecting arcs for the slot-$2 \, 3$ pairs as disjoint arcs in $Q$, and first apply Lemma 5 to every pair of leaf occurrences in slots $2 \, 3$, to make $S_r$, avoiding all slot-$1$ leaf knots. Attach the rising annuli to the leaf knots, and match the $x_r$ band framing to the framed $x_r$ cap. Cutting out an annulus along $x_r$ leaves a pair of pants. Capping its two new boundary circles by nearby copies of the $x_r$ cap gives a disc $D_r$. The extended lateral normal field supplied by Lemma 5 places the two copies at the cut band sides. This disc is embedded: the retained body and its collars are disjoint, and the only cap pieces retained have the same end type. In particular, crossings with the unused $y_r$ cap or with another leaf are not self-crossings of $D_r$.
  Return the boundary knot of $S_r$ along an attaching collar to a lower level. Its contracting disc supplies a normal-framing class at this handoff. With the returned boundary knots now fixed, choose the lower connecting arcs and pair each knot with its slot-$1$ leaf, again by Lemma 5, to make $B_r$. Choose the $beta_r$ band twist so that the transported ordered frame extends over this already constructed contracting disc. At the chosen normal phase of $beta_r times S^1$, the vector $w$ in (2.4) is its angular tangent. Extension of the ordered frame therefore extends this particular angular vector, as required for compression of the product torus.
  These choices are sequential. If $n_x \, n_beta$ are the two twists, the two relative framing obstructions have the form
  $ o_x \( n_x \, n_beta \) = o_x \( 0 \, 0 \) + epsilon_x n_x \, #h(2em) o_beta \( n_x \, n_beta \) = o_beta \( n_x \, 0 \) + epsilon_beta n_beta \, #h(2em) epsilon_x \, epsilon_beta in { 1 \, - 1 } . $
  The lower $beta_r$ twist does not change the fixed upper disc or its $x_r$ framing. One first sets $o_x = 0$, records the resulting handoff framing, and then sets $o_beta = 0$. There is no simultaneous parity assumption hidden in these choices.
  Chosen changes of basing make the leaf circuits the conjugates in (2.3). Applying the commutator rule first to $S_r$ and then to $B_r$ gives the asserted words. Paths recording basings need not themselves be physical attachments from a single basepoint.
  Finally extend the base boundaries down to level zero in $Q$. This makes the $B_r$ proper in $V$. Choose the remaining small parallel displacements and radii after all finitely many bodies and collars have been fixed. Outside the attachment charts and the cap-crossing charts their compact disjoint pieces have positive separation; inside the charts use the product choices (2.2). This gives simultaneous smooth choices with exactly the asserted intersections. ◻
]

=== 2.3 The exterior, the dual spheres, and their labels <the-exterior-the-dual-spheres-and-their-labels>

Delete small open relative tubular neighborhoods of the bases only:

#[#set math.equation(numbering: n => "(2.5)")
 $ M = overline(G \\ union.big_(r in cal(R)) nu \( B_r \)) . $ <geo:exterior>]

The relative neighborhoods meet $partial G$ in the corresponding boundary-knot neighborhoods. Choose their radii small enough to miss every upper-stage piece except its prescribed initial attachment. Round corners with compatible collars. This is a compact oriented smooth four-manifold with nonempty boundary. It is connected: paths may be moved off finitely many embedded surfaces in dimension four, and the complement of the surfaces retracts radially onto the exterior of sufficiently small tubes.

Truncate each shallow cap at the boundary of the corresponding base tube and call the resulting proper disc $f_r$. Its boundary circles are mutually disjoint smooth embeddings in $partial M$. The cap construction gives smooth disc maps, made generic while keeping the product collars fixed. In fact each individual disc is embedded; discs of opposite end types may meet one another. Their normal bundles supply their induced boundary framings.

At a slightly larger radius than the deleted tube, put

$ T_r = beta_r times S^1 med subset M . $

This product torus meets the shallow attaching annulus at exactly one transverse point, since $alpha_r$ and $beta_r$ cross once. At the distinct phase used by the further stage, compress $T_r$ along its $beta_r$ direction using two parallels of the extended contracting disc $D_r$. Denote the resulting sphere by $g_r$. Figure 3 distinguishes the two successive pairs of cap copies in this sphere.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B_r$#linebreak()$partial B_r=R_r$]]])])
  content((-1.65, 1.8), [#box(inset: 0.1411cm, radius: 8pt, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[shallow cap#linebreak()$z_a^(c_1)$]]])])
  content((1.55, 1.8), [#box(inset: 0.1764cm, radius: 4pt, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$S_r$#linebreak()$[z_b^(c_2),z_c^(c_3)]$]]])])
  content((0.3, 3.6), [#box(inset: 0.1411cm, radius: 8pt, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$x_r$ cap#linebreak()$z_b^(c_2)$]]])])
  content((2.9, 3.6), [#box(inset: 0.1411cm, radius: 8pt, stroke: (thickness: 0.5pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$y_r$ cap#linebreak()$z_c^(c_3)$]]])])
  line((-0.4608, 0.5027), (-1.205, 1.315), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((-0.5445, 0.594), [#text(size: 9pt)[$alpha_r$]], anchor: "east", padding: 0.1176cm)
  line((0.4328, 0.5027), (1.103, 1.281), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((0.5115, 0.594), [#text(size: 9pt)[$beta_r$]], anchor: "west", padding: 0.1176cm)
  line((1.19, 2.319), (0.6127, 3.15), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((0.925, 2.7), [#text(size: 9pt)[$x_r$]], anchor: "east", padding: 0.1176cm)
  line((1.939, 2.319), (2.562, 3.15), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((2.225, 2.7), [#text(size: 9pt)[$y_r$]], anchor: "west", padding: 0.1176cm)
  line((-2.65, 0.8), (3.6, 0.8), stroke: (thickness: 0.5pt, miter-limit: 10, dash: "dashed"))
  content((0.4, -0.8), [#text(size: 9pt)[Only the base tube is deleted.]])
  content((7, 4.15), [#text(size: 9pt)[$S_r arrow.r.long D_r$, then $T_r arrow.r.long g_r$#linebreak()Four retained $x_r$ sheets in $g_r$]])
  rect((4.9, 1.3), (6.7, 3.5), stroke: (thickness: 0.5pt, miter-limit: 10), radius: 4pt)
  rect((7.3, 1.3), (9.1, 3.5), stroke: (thickness: 0.5pt, miter-limit: 10), radius: 4pt)
  content((5.8, 3.15), [#text(size: 9pt)[$D_r^(+)$]])
  content((8.2, 3.15), [#text(size: 9pt)[$D_r^(-)$]])
  circle((5.8, 2.5), radius: (0.55, 0.22), stroke: (thickness: 0.5pt, miter-limit: 10))
  circle((5.8, 1.8), radius: (0.55, 0.22), stroke: (thickness: 0.5pt, miter-limit: 10))
  circle((8.2, 2.5), radius: (0.55, 0.22), stroke: (thickness: 0.5pt, miter-limit: 10))
  circle((8.2, 1.8), radius: (0.55, 0.22), stroke: (thickness: 0.5pt, miter-limit: 10))
  content((5.8, 2.5), [#text(size: 9pt)[$+$]])
  content((5.8, 1.8), [#text(size: 9pt)[$-$]])
  content((8.2, 2.5), [#text(size: 9pt)[$-$]])
  content((8.2, 1.8), [#text(size: 9pt)[$+$]])
  content((7, 0.6), [#text(size: 9pt)[Pair sheets within each $D_r$ copy.#linebreak()Opposite signs have equal Wall labels.]])
  content((7, -0.65), [#text(size: 9pt)[The unused $y_r$ cap remains in $M$#linebreak()and kills the label-comparison loop.]])
})],
  caption: [Figure 3: Attachment tree for one relation and the two ordered compressions. The left panel records attachments; the right panel separates the two outer contracting-disc copies and their inner cap pairs. Signs indicate the opposite induced orientations in each pair. Opposite end cap types may cross in the balls $P_e$. The unused $y_r$ cap remains in the manifold and will kill the comparison loop in Lemma 8. ],
) <geo:fig-stages>

#thm([Lemma 2.4.])[
  (Embedded framed dual candidates).  #emph[Each $g_r$ is individually embedded and has trivial normal bundle. It follows that 
$ lambda \( g_r \, g_r \) = 0 \, #h(2em) tilde(mu) \( g_r \) = 0 . $

 The compression leaves the single product-torus intersection with $f_r$ unchanged. Every other intersection involving an $f_r$ and a $g_s$, or two distinct spheres, occurs on the cap sheets in (2.2).]
] <geo:dual-candidates>

#proof[
  The chosen angular normal field extends over the embedded disc $D_r$, so a narrow interval thickening of that disc replaces the annulus on $T_r$ by its two disjoint parallel boundary discs. Away from the attaching curve the thickening misses $T_r$ if it is sufficiently small. All cap sheets in this one sphere come from its own $x_r$ cap and hence have the same end type. The disjoint-body construction and the local surgery model give embeddedness. The phase containing the shallow-cap intersection is disjoint from the annulus being replaced, so that point remains. The separation choices in Lemma 6 account for all other possible intersections.
  The interval thickening is an oriented three-chain in $M$ whose boundary is the difference between the original annulus and the two replacement discs. Consequently $\[ g_r \] = \[ T_r \]$ in $H_2 \( M \; bb(Z) \)$, up to a harmless orientation sign. The torus has an explicit trivial normal bundle, with one vector lateral to $beta_r$ in the base and one vector radial in the normal disc to the base. Thus its ordinary self-intersection is zero. Homology invariance of that pairing gives $g_r dot.op g_r = 0$. For an embedded oriented sphere this is the Euler number of its oriented normal plane bundle. Such a bundle on $S^2$ is classified by its Euler number, so $g_r$ has a disjoint normal pushoff. The pushoff computes zero in the full group-ring diagonal pairing. Embeddedness gives no double points at all in the Wall invariant, and in particular gives the stated reduced invariant. ◻
]

Opposite intersection signs do not suffice for the off-diagonal calculations: their labels must agree in $pi_1 \( M \)$, not merely in $pi_1 \( G \)$. The unused cap in each upper stage supplies this extra assertion.

#thm([Lemma 2.5.])[
  (Cancellation in the exterior).  #emph[Within one contracting-disc copy on a sphere, pair the two oppositely oriented $x$-cap sheets at their crossings with any fixed opposite-type sheet. The paired intersections have equal Wall labels in $pi_1 \( M \)$ and opposite signs. All cap-sheet contributions to $lambda \( f_r \, g_s \)$ and to $lambda \( g_r \, g_s \)$ for $r eq.not s$ therefore cancel.]
] <geo:labels>

#proof[
  Use the product attachment collars to make the carrier and its comparison homotopy explicit in the exterior. Choose a common small radius $epsilon$ for the deleted base tubes, smaller than all the finitely many collar lengths. Take $T_s$ at radius $2 epsilon$. Shorten the initial collar of $S_s$ at radius $3 epsilon$ and join it back to $T_s$ by the radial annulus between these two radii; call this retained upper stage $S_s$ as well. This collar shortening changes neither its two basis curves nor its fundamental group. All caps are retained. Choose subsequent parallel displacements smaller than $epsilon \/ 10$ and than the positive clearances from the other deleted tubes. The cap-parallel collapse and the band comparison below can be fixed on this radial collar, so their images stay outside every deleted tube.
  For this retained upper stage of entry $s$ form the abstract complexes
  $ K_x = S_s union_(x_s) D_x \, #h(2em) K = S_s union_(x_s) D_x union_(y_s) D_y . $
  Attaching annuli are included in the cap notation. The actual configuration gives a map $j : K arrow.r M$ with the collar just specified. The caps may cross other cap images; none of those images has been deleted from $M$. The presentations
  #[#set math.equation(numbering: n => "(2.6)")
   $ pi_1 \( K_x \) = chevron.l x_s \, y_s divides x_s chevron.r = chevron.l y_s chevron.r \, #h(2em) pi_1 \( K \) = chevron.l x_s \, y_s divides x_s \, y_s chevron.r = 1 $ <geo:carrier-groups>]
  are presentations of these abstract complexes.
  Collapse the small parallel displacement in the compressed disc $D_s$ and reglue its cut $x_s$ band. This gives a map $c : D_s arrow.r K_x$ identifying corresponding points of its two cap copies with the same point of $D_x$. The actual map of $D_s$ into $M$ is homotopic to $j compose c$ by the normal intervals of its cap parallels and the matching band collars. The homotopy stays in a neighborhood of the upper stage, away from every deleted base tube. It is a homotopy of maps and is allowed to cross the other cap images.
  Fix one of the two outer copies of $D_s$ in $g_s$. From a point on its retained upper body choose paths $gamma_(+) \, gamma_(-)$ to corresponding crossings on its two inner cap sheets. In a crossing chart these sheets and the fixed other sheet are
  $ D^2 times { a_(+) } \, quad D^2 times { a_(-) } \, quad { b } times D^2 . $
  The short comparison path $tau \( u \) = \( b \, \( 1 - u \) a_(+) + u a_(-) \)$ is simultaneously a path on the fixed other sheet and the normal interval between the paired cap points. Choose the paths on the fixed sheet using this segment. Up to conjugation by the common path from the sphere’s whisker, the quotient of the two Wall labels is represented by
  $ gamma_(+) thin tau thin gamma_(-)^(- 1) . $
  Under the collapse comparison this becomes $c \( gamma_(+) \) c \( gamma_(-) \)^(- 1)$ in $K_x$: the segment $tau$ collapses to the single point of $D_x$. The loop might represent a nonzero power of $y_s$ in $K_x$; Equation (2.6) kills it in $K$, using the actual unused $y_s$ cap. Composing its nullhomotopy with $j$ proves equality of the labels in $M$. Arbitrary conjugators are already part of the attaching paths; they do not alter the simple connectivity of $K$.
  The two inner cap copies cap the two boundary components of the annulus cut from $S_s$, so have opposite induced orientations. Their signs against any fixed sheet are therefore opposite. Reversing the orientation of an outer contracting-disc copy reverses both signs and preserves this conclusion. Apply the pairing separately within each outer copy, and separately for each fixed cap sheet on the other surface. This accounts for every cap crossing, including repeated end labels and opposite end labels within one entry. In particular no comparison of paths between the two outer phases, and no contraction of a base meridian in $M$, has been used. ◻
]

#thm([Corollary 2.6.])[
  (The exact algebraic input).  #emph[There are orientations and whiskers for the discs and spheres such that, for all $r \, s in cal(R)$ and $R = bb(Z) \[ pi_1 \( M \) \]$, 
#[#set math.equation(numbering: n => "(2.7)")
 $ lambda \( f_r \, g_s \) = delta_(r s) thin 1 in R \, #h(2em) lambda \( g_r \, g_s \) = 0 in R \, #h(2em) tilde(mu) \( g_r \) = 0 . $ <geo:invariants>]

 In particular the normal second Stiefel–Whitney number of every $g_r$ is zero. These data satisfy all algebraic and boundary hypotheses of the unrestricted disc-embedding assertion.]
] <geo:input-invariants>

#proof[
  Lemmas 7 and 8 leave exactly one signed group element in $lambda \( f_r \, g_r \)$ and no other contributions. Orient $g_r$ and change its whisker so that this coefficient is $+ 1$. Whisker changes multiply or conjugate zero entries by units and hence preserve the other vanishings. Triviality of the normal bundles proves the Stiefel–Whitney assertion. The manifold is oriented, so its orientation character is trivial and the involution on $R$ is $h mapsto h^(- 1)$. The reduced Wall invariant vanishes even before imposing its additive relations $h - h^(- 1)$ and the identity coefficient. The discs have disjoint embedded boundary circles and the proper collar model. There is no requirement to make their mutual intersections or self-intersection invariants vanish. ◻
]

=== 2.4 Topological disc images give smooth cuts <topological-disc-images-give-smooth-cuts>

#thm([Lemma 2.7.])[
  (Moving the graph map off the protected discs).  #emph[Suppose there are pairwise disjoint proper locally flat embeddings $overline(f)_r : D^2 arrow.r M$ with $overline(f)_r \|_(S^1) = f_r \|_(S^1)$. Then $p_0$ is homotopic, relative to $partial G$, to a map $p : G arrow.r Gamma$ with the following properties. The bases, the short return annuli in their deleted tubes, and the disc images lie in $p^(- 1) \( Gamma_h \)$. For one interior point of each $q_e$ edge, the inverse image $J_e$ is a compact smooth oriented three-manifold with exactly one boundary torus. Additional closed components of $J_e$ are allowed.]
] <geo:topological-cuts>

#proof[
  Join the boundary of each actual embedded disc back to $alpha_r$ by the radial annulus in the deleted base tube. The bases and these return annuli lie in $V$ and hence already map into $Gamma_h$. The boundary map of each disc lies in $Gamma_h$ and is nullhomotopic in $Gamma$ because the actual disc gives a filling. The inclusion $pi_1 \( Gamma_h \) arrow.r pi_1 \( Gamma \)$ is injective, so it has a filling in $Gamma_h$. The original filling and this new filling are homotopic relative boundary since $pi_2 \( Gamma \) = 0$. Transfer this homotopy to the disc image using the embedding parametrization. This step uses no homotopy between an output disc and its input cap.
  Let $B$ be the union of the bases, return annuli, and disc images, and put $A = B union partial G$. Prescribe the just constructed homotopies on the discs and keep the other parts fixed. These prescriptions agree on intersections: disc boundaries are fixed, disc interiors are mutually disjoint and proper in $M$, and the only intersections with the returned pieces are the stated attaching circles. Pasting finitely many compact closed sets gives a continuous homotopy on $A$. Only $B$ is to map into $Gamma_h$; the $q$-collar portions of $partial G$ keep their prescribed product values.
  Here the extension to $G$ need not assume that the topological disc images are smooth or that their inclusion is a cofibration. A finite graph is an absolute neighborhood retract for metric spaces. Apply its neighborhood-extension property to the prescribed map on the closed subset
  $ \( G times { 0 } \) union \( A times \[ 0 \, 1 \] \) med subset G times \[ 0 \, 1 \] . $
  It extends to an open neighborhood $O$ of that subset. Compactness of $A times \[ 0 \, 1 \]$ gives a neighborhood $U$ of $A$ with $U times \[ 0 \, 1 \] subset O$. Choose a continuous function $chi : G arrow.r \[ 0 \, 1 \]$ equal to one on $A$ and supported in $U$. If $tilde(H)$ is the neighborhood extension, then
  $ H \( x \, t \) = tilde(H) \( x \, chi \( x \) t \) $
  is defined on all of $G times \[ 0 \, 1 \]$: when $chi \( x \) > 0$ it uses $U times \[ 0 \, 1 \]$, and otherwise it uses the time-zero slice. It is the required extension, fixed on $partial G$. Its final map sends $B$ into $Gamma_h$.
  Choose mutually disjoint small open intervals about the midpoints of the $q_e$ edges. Their closed smaller intervals miss $Gamma_h$, so their inverse images miss the protected compact set $B$. On $partial G$ the map is already the fixed coordinate on the single collar $C_e = T^2 times \[ 0 \, 1 \]$. In a small boundary collar straighten its real interval coordinate to be constant in the inward normal direction, using an interpolation fixed on the boundary. Use a slightly larger target interval to localize this operation away from $B$. Relative smooth approximation of real functions, followed by relative transversality in the remaining interior, makes the map smooth and transverse near a smaller middle level, preserving the boundary product and staying off $B$. The intervals for different edges have disjoint supports. These changes are homotopies within intervals, so the resulting $p$ is still homotopic to $p_0$ relative boundary. The regular-value and boundary regular-fiber statements are those of #cite(label("Milnor1965")) Section 2, pp. 10–13; the fixed product collar supplies regularity on the boundary.
  Each level $J_e$ is therefore a compact smooth hypersurface, cooriented by the interval and oriented by $G$. Its boundary is exactly the boundary level $T^2 times { upright("point") }$ in $C_e$; $Q$ contributes no boundary point at that level. There is one component with this boundary torus, and every other component is closed. All the topological disc images and returned pieces remain disjoint from the cuts. ◻
]

For the deformation argument, fix the following reference representation of the $h$-subgroup, with $frak(l) = frak(s l)_2 \( bb(C) \)$:

#[#set math.equation(numbering: n => "(2.8)")
 $ rho \( h_0 \) = mat(delim: "(", 2, 0; 0, 1 \/ 2) \, #h(2em) rho \( h_(+) \) = mat(delim: "(", 1, 1; 0, 1) \, #h(2em) rho \( h_(-) \) = mat(delim: "(", 1, 0; 1, 1) . $ <geo:matrices>]

The length-five word set $cal(H)$ was chosen so that the operators $"Ad" rho \( c \)$ for $c in cal(H)$ span $"End" \( frak(l) \)$; the calculation is given at its point of use in Lemma 18.

#thm([Proposition 2.8.])[
  (The geometric input and the forced cut data).  #emph[For every $d gt.eq 5$, with the finite word set $cal(H)$ defined above, the preceding construction produces a compact connected oriented smooth four-manifold $M$ with nonempty boundary, a finite family $F = \( f_r \)_(r in cal(R))$ of smooth proper disc maps with disjoint embedded boundary, and individually embedded framed sphere maps $\( g_r \)_(r in cal(R))$ satisfying (2.7).]
  #emph[If the circles $partial F$ bound pairwise disjoint proper locally flat embedded discs in $M$, the following data exist:]
  + #emph[The compact oriented smooth four-manifold $G$ has a homotopy equivalence $p : G arrow.r Gamma$, where $Gamma$ is the rose on $h_0 \, h_(+) \, h_(-) \, q_1 \, dots.h \, q_d$. The boundary is $Q union union.big_e C_e$, with the free group and peripheral coordinates of Lemma 4 and the longitude–meridian interchange (2.1).]
  + #emph[There are disjoint cooriented smooth cuts $J_1 \, dots.h \, J_d$, each a compact oriented three-manifold with one boundary torus and possibly additional closed components. Their boundary tori are the fixed product cuts in the $C_e$.]
  + #emph[Cutting $G$ along all $J_e$ gives a compact oriented smooth four-manifold $X$, possibly disconnected. With half collars absorbed into $Q$, its boundary is obtained by gluing $Q$ to the two oppositely oriented copies of each $J_e$ along their boundary tori. Every torus-bearing wall component has just that one torus; closed wall components remain separate. Regluing the paired cuts recovers $G$.]
  + #emph[The map on $X$ lands in the graph cut open at the chosen $q_e$ points, namely $Gamma_h$ with the resulting half-edges; it is constant on every copy of a cut at its endpoint value. All words (2.3) are trivial in the fundamental group of the component $X_Q$ containing $Q$, with the original basings in $Q$.]
  + #emph[Extend (2.8) to $pi_1 \( Gamma \)$ by $rho \( q_e \) = 1$. The associated adjoint local system on $G$ restricts to $rho$ on the $h$ generators, to the identity on all $z_a$, and to a trivial system on each $J_e$, with matching reference frames on its two copies induced by the graph point.]
  #emph[The implication uses only the asserted embedded discs. It imposes neither output-dual conditions nor an additional framing or relative homotopy condition on those discs.]
] <geo:construction>

#proof[
  The input assertions are Corollary 9. Use Lemma 10 to obtain $p$ and $J_e$. Since $p$ is homotopic to $p_0$, Lemma 4 makes it a homotopy equivalence. Cutting along the disjoint level hypersurfaces gives the stated collared manifold $X$, whose corners can be rounded. Connectedness of $X$ was not used and is not asserted. The connected region $Q$ singles out one component $X_Q$.
  For each $r$, the union of $B_r$, its return annulus and its new disc misses every cut and meets $Q$. It therefore lies in $X_Q$. In that union the curve $alpha_r$ bounds the returned disc, so the base boundary, which represents $\[ alpha_r \, beta_r \]$, is nullhomotopic. Its word in $Q$ is exactly $R_r$, up to the already fixed orientation and basing conventions. Any overall conjugate or inverse has the same nullity, so all based relations in (2.3) hold in $pi_1 \( X_Q \)$. This group argument does not assert that an entire base has been compressed to an embedded disc. The map to the cut graph and all the peripheral assertions follow directly from the fixed product boundary values. Pullback from the graph gives the last local-system assertion. ◻
]

The remaining sections rule out the cut data in Proposition 11. Their smoothness comes from regular levels of the ambient graph map away from the protected disc images; the hypothetical discs themselves have not been smoothed.

== 3 Deformations of the cut data <sec:deformation>

The cut data in Proposition 11 have two consequences for representations near $rho$: complementary tangent spaces for the paired wall restrictions, and a cube-zero ideal generated by the end holonomies minus the identity. The first comes from the graph homotopy type of $G$ and the longitude–meridian interchange; the second uses the triple commutator relations retained in the component $X_Q$.

We use $Gamma$ and $Gamma_h$ for the graph and its $h$-subrose. The coefficient system $frak(l)_rho$ is the pullback of the adjoint system of (2.8), extended by $rho \( q_i \) = 1$. It is trivial on every wall, with matching reference frames on the two copies induced by the cut point. The trace form $\( u \, v \) mapsto "tr" \( u v \)$ identifies this system with its dual. Throughout, cohomology of $X$ or $J_i$ includes all components: $X$ need not be connected, and a wall may have closed components in addition to its one component with torus boundary.

=== 3.1 The paired restriction maps <the-paired-restriction-maps>

#thm([Lemma 3.1.])[
  (Paired Mayer–Vietoris maps).  #emph[Let 
$ W_h = "im" #scale(x: 120%, y: 120%)[\(] H^1 \( Gamma_h \; frak(l)_rho \) arrow.r H^1 \( X \; frak(l)_rho \) #scale(x: 120%, y: 120%)[\)] . $

 Here the map uses the retraction of the cut-open graph onto its $h$-rose. For either degree, write $r_i^plus.minus$ for restriction to the two copies of $J_i$. The map 
#[#set math.equation(numbering: n => "(3.1)")
 $ Delta \( u \, v \) = #scale(x: 120%, y: 120%)[\(] r_i^(+) u - r_i^(-) v \, med r_i^(-) u - r_i^(+) v #scale(x: 120%, y: 120%)[\)]_(i = 1)^d $ <def:delta>]

 is onto in degree one, with kernel $W_h xor W_h$, and is an isomorphism in degree two. Consequently, if $H^1 \( X \; frak(l)_rho \) = W_h xor U$, then 
$ Delta : U xor U arrow.r^(med tilde.equiv med) xor.big_i #scale(x: 120%, y: 120%)[\(] H^1 \( J_i \; frak(l) \) xor H^1 \( J_i \; frak(l) \) #scale(x: 120%, y: 120%)[\)] . $

]
] <def:paired-mv>

#proof[
  Take the two-sheeted cover of $G$ classified by the homomorphism sending every $q_i$ to the nontrivial element of $bb(Z) \/ 2$ and every $h$-loop to zero. The lift of $p$ is a homotopy equivalence with the corresponding graph cover. Thus the cover has zero cohomology in degrees at least two, with the lifted local system as well as with constant coefficients. After adjoining small product collars, its decomposition has two vertex spaces, both copies of $X$, and two edge spaces per label, both copies of $J_i$. The pairings go from one vertex copy to the opposite side of the other, giving exactly (3.1). The relevant part of Mayer–Vietoris is
  $ H^1 \( tilde(G) \) arrow.r H^1 \( X \)^(xor 2) arrow.r^Delta xor.big_i H^1 \( J_i \)^(xor 2) arrow.r H^2 \( tilde(G) \) = 0 $
  and
  $ 0 = H^2 \( tilde(G) \) arrow.r H^2 \( X \)^(xor 2) arrow.r^Delta xor.big_i H^2 \( J_i \)^(xor 2) arrow.r H^3 \( tilde(G) \) = 0 . $
  The omitted coefficients in these two displays are the specified local systems.
  The image in the middle degree-one group is precisely $W_h xor W_h$. In one direction, a class restricted from the graph cover factors on each vertex through its cut-open graph, and hence through the associated $h$-rose. Conversely, choose cellular one-cochains representing any two classes on the two $h$-roses. Extend them to the graph cover by arbitrary values, for example zero, on the remaining edges. There are no two-cells, so the extensions are cocycles. Their restrictions give the chosen pair of classes on $X$. This argument uses direct sums over all components of $X$, and imposes no connectedness assumption on it. ◻
]

#thm([Lemma 3.2.])[
  (Slopes and internal directions).  #emph[The ends of each cut can be designated $+$ and $-$, and torus coordinates $\( theta_i \, eta_i \)$ of period one can be chosen, so that the image of 
$ H^1 \( J_i \; bb(C) \) arrow.r H^1 \( partial J_i \; bb(C) \) $

 is the $theta_i$-axis. In $Q$, the $eta_i$-circle bounds on the positive side and the $theta_i$-circle bounds on the negative side. Put 
$ n_i = dim_(bb(C)) H^1 \( J_i \, partial J_i \; frak(l) \) \, #h(2em) D = sum_i n_i \, #h(2em) cal(Y) = xor.big_i \( bb(C)^(n_i) xor bb(C)^(n_i) \) . $

 Then $dim U = 3 d + D$. The joint first-slope restriction $U arrow.r frak(l)^d$ is onto. Its kernel $U_0$ has dimension $D$. The two maps from $U_0$ to $cal(Y)$ given by the paired restrictions and by their interchange are injective and have complementary images.]
] <def:slopes>

#proof[
  Poincare–Lefschetz duality #cite(label("Hatcher2002")) Theorem 3.43 and the exact sequence of the pair imply that the restriction image in the cohomology of the boundary of an oriented compact three-manifold is its own annihilator for the intersection form. For completeness, the connecting map $H^1 \( partial J_i \) arrow.r H^2 \( J_i \, partial J_i \)$ is dual, up to sign, to the restriction map. Exactness therefore identifies the kernel of that connecting map, which is the restriction image, with the annihilator of that image. On a single torus a subspace equal to its annihilator is a line. Closed components of $J_i$ make no contribution to the boundary map. Denote this line by $L_i$.
  Tensoring with $frak(l)$ gives the corresponding assertion for the trivial wall system. A restriction from the positive or negative copy of $X$ has zero evaluation on the slope which bounds in $Q$, because the local system is trivial on that torus. These two constraints are the distinct coordinate axes interchanged by the Hopf gluing. If $L_i$ were neither axis, both restrictions would have zero torus value. This contradicts surjectivity in Lemma 12, since $H^1 \( J_i \; frak(l) \)$ has a nonzero boundary restriction. Thus $L_i$ is one axis; designate the contributing end positive and call this the first slope.
  The map $H^0 \( J_i \; frak(l) \) arrow.r H^0 \( partial J_i \; frak(l) \)$ is onto: constants on the unique component with boundary suffice. The exact sequence consequently identifies
  #[#set math.equation(numbering: n => "(3.2)")
   $ H^1 \( J_i \, partial J_i \; frak(l) \) med tilde.equiv med ker #scale(x: 120%, y: 120%)[\(] H^1 \( J_i \; frak(l) \) arrow.r H^1 \( partial J_i \; frak(l) \) #scale(x: 120%, y: 120%)[\)] . $ <def:relative-identification>]
  These are the $n_i$ internal directions, including all degree-one cohomology of every closed component. They pair perfectly with $H^2 \( J_i \; frak(l) \)$ by integration and the trace form. In particular $dim H^1 \( J_i \; frak(l) \) = 3 + n_i$.
  The isomorphism in Lemma 12 now gives $dim U = 3 d + D$. Its first-slope coordinates are the first-slope values of $u$, and the negatives of those of $v$, because all opposite-side values are zero. Surjectivity implies independent surjectivity onto the $3 d$ first-slope coordinates. On their kernel the same isomorphism becomes
  $ U_0 xor U_0 arrow.r cal(Y) \, #h(2em) \( u \, v \) mapsto R \( u \) - sigma R \( v \) \, $
  where $R$ is paired restriction and $sigma$ interchanges the two slots for each $i$. This proves the last assertions. ◻
]

=== 3.2 Finite algebraic equation charts <finite-algebraic-equation-charts>

From now on orient $J_i$, including each of its closed components, as its positive copy in the oriented boundary of $X$. Its negative copy then has the opposite orientation.

#prodef([Definition 3.3.])[
  (Scalar rings and formal coefficients).  An algebraic parameter chart will mean a local $bb(C)$-algebra essentially of finite type and etale over an affine coordinate space at the designated origin. Its completion is $B = bb(C) \[ \[ v_1 \, dots.h \, v_N \] \]$, with maximal ideal $frak(m)$. Finite collections of algebraic germs obtained by an implicit equation with invertible Jacobian can always be placed in one such chart, after replacing it by a common etale neighborhood.
  For a smooth manifold $Z$, smooth forms with formal coefficients mean
  $ Omega^j \( Z \) accent(⊗ B, ̂) = "proj lim"_k #scale(x: 120%, y: 120%)[\(] Omega^j \( Z \) ⊗_(bb(C)) B \/ frak(m)^k #scale(x: 120%, y: 120%)[\)] . $
  For quotients of $B$, use the analogous inverse limit. The extension of a scalar ideal $I$ to this space always means its closed extension. Differential operations in the $Z$-variables preserve that extension; multiplication respects its powers. Integration over a compact manifold is defined at each finite parameter quotient and then by inverse limit.
] <def:coefficient-convention>

The tangent calculation alone does not retain the equations that obstruct a deformation. We now choose finite algebraic transition charts and keep their entire defect ideals, including their nonreduced structure. The construction removes equations with independent linear terms but retains every higher-order defect. A nonzero functional on its first ideal layer $frak(r)_Z \/ frak(m) frak(r)_Z$ detects an obstruction to a flat lift, even when that lift may leave the chosen tangent slice. This is the property used later to identify the full derivative ideal in Proposition 25. Small extensions and their second-cohomology obstructions are part of the deformation framework of #cite(label("GM1988")) Proposition 2.6(1); the explicit construction below keeps the triangle-defect ideal needed here.

#thm([Lemma 3.4.])[
  (Equation charts and their minimal defect layer).  #emph[Let $Z$ be a compact smooth manifold, possibly disconnected and with boundary, and let $rho_Z$ be a fixed $"SL"_2 \( bb(C) \)$-local system. Choose a subspace $T subset H^1 \( Z \; frak(l)_(rho_Z) \)$. There is an algebraic family of edge matrices on a finite good cover, with parameters $T$, having these properties:]
  + #emph[Its reference value is the chosen local system, its tangent is the specified inclusion of $T$, and its triangle-defect ideal $frak(r)_Z$ is contained in $frak(m)^2$.]
  + #emph[Modulo $frak(r)_Z$, its matrices are the transitions of an exact flat family.]
  + #emph[For a nonzero functional $lambda : frak(r)_Z \/ frak(m) frak(r)_Z arrow.r bb(C)$, let $frak(s)_lambda subset frak(r)_Z$ be the inverse image of $ker lambda$. The specified flat family over $B \/ frak(r)_Z$, where $B = bb(C) \[ \[ T \] \]$, has no flat lift over $B \/ frak(s)_lambda$. This excludes compatible general-linear lifts as well, and does not require a putative lift to remain in the parameter slice $T$.]
] <def:equation-chart>

#proof[
  Use a finite good cover, with contractible connected nonempty intersections, obtained from a finite smooth triangulation and boundary collars. Components are covered independently. Fix reference parallel frames. For each oriented edge of the nerve, vary a matrix $g_(alpha beta)$ in an algebraic group coordinate patch, impose $g_(beta alpha) = g_(alpha beta)^(- 1)$, and set $g_(alpha alpha) = 1$. For an oriented triangle use the traceless part of
  $ g_(alpha beta) g_(beta gamma) g_(gamma alpha) - 1 $
  as its three equation coordinates. These coordinates generate the full matrix defect ideal locally. Indeed, write the triangle product as $\( 1 + x \) 1 + T$, where $T$ is traceless and $x \( 0 \) = 0$. Its determinant equation reads $x \( 2 + x \) = - det T$. The factor $2 + x$ is a unit, so $x$ belongs to the ideal generated by the entries of $T$ (in fact to its square).
  In reference frames, the linearized defect map is the cochain differential
  $ d_rho : C^1 \( Z \; frak(l)_(rho_Z) \) arrow.r C^2 \( Z \; frak(l)_(rho_Z) \) $
  on the good-cover nerve. Choose decompositions
  $ C^1 = "im" d_rho^0 xor H xor L \, #h(2em) ker d_rho^1 = "im" d_rho^0 xor H \, $
  and choose a projection $pi : C^2 arrow.r "im" d_rho^1$ which is the identity on that image. Set the first summand of the coordinate variables equal to zero. Solve $pi \( upright("defect") \) = 0$ for the $L$-variables. Its derivative in those variables is the isomorphism $d_rho^1 : L arrow.r "im" d_rho^1$. The algebraic implicit function theorem gives the solution in an etale neighborhood. Its remaining coordinates are $H$, and its defect has no linear term. Finally restrict the $H$-parameters to the chosen linear subspace $T$. The identity $pi \( upright("defect") \) = 0$ survives this restriction. Good-cover cohomology agrees with local-system cohomology: the cover and every intersection are acyclic for these locally constant coefficients. Thus these are the asserted tangent coordinates.
  Write $B = bb(C) \[ \[ T \] \]$, $frak(r) = frak(r)_Z$, and suppose $lambda eq.not 0$. Its inverse-image kernel is the ideal
  $ frak(s) = { b in frak(r) : lambda \( b med mod med frak(m) frak(r) \) = 0 } . $
  It is an ideal because multiplication acts on $frak(r) \/ frak(m) frak(r)$ by its constant term. There is an exact sequence
  #[#set math.equation(numbering: n => "(3.3)")
   $ 0 arrow.r I = frak(r) \/ frak(s) arrow.r B \/ frak(s) arrow.r B \/ frak(r) arrow.r 0 \, #h(2em) dim_(bb(C)) I = 1 \, quad frak(m) I = I^2 = 0 . $ <def:small-extension>]
  Here $frak(r)^2 subset frak(m) frak(r)$ proves the last equality. Evaluating the triangle defects in $I$ gives a reference two-cochain $c$ with $pi c = 0$. It is nonzero, since the entries of the defects generate $frak(r)$ and hence span its quotient by $frak(m) frak(r)$.
  A flat lift changes edge matrices by $I$-valued corrections. Since $frak(m) I = 0$, their effect on triangle products is the reference differential, so flatness would give $c + d_rho u = 0$. Applying $pi$ gives $d_rho u = 0$, and then $c = 0$, a contradiction. If the corrections are general-linear, project them to their traceless parts. Conjugation preserves the splitting into scalar and traceless matrices, so this projection commutes with $d_rho$; the same contradiction follows. If the putative flat lift is specified only up to an isomorphism of its reduction, choose parallel frames on the contractible patches with initial values lifting the given reduced frames. Their transition matrices then lift exactly the original matrices, which is the case just proved. ◻
]

#prodef([Remark 3.5.])[
  (Based wall charts).  At the trivial wall representation the preceding construction can be made in based tree frames: choose a maximal tree in each component of the one-skeleton of the nerve and set its edge matrices equal to $1$. This removes exactly the degree-one coboundary directions, without dividing by constant conjugation. Any based flat representation sufficiently near the reference one, including one over a complete local quotient, is represented by its edge matrices in these tree frames. It lies in the implicit chart: take its free $H^1$-coordinates and use uniqueness in the solved $L$-coordinates. The same assertion follows order by order over an arbitrary complete quotient because the initial Jacobian determinant remains a unit.
] <def:based-wall>

#thm([Proposition 3.6.])[
  (Wall and vertex coordinates).  #emph[There are wall charts with parameters 
$ \( a_i \, y_i \) in bb(C)^3 xor bb(C)^(n_i) \, $

 vertex parameters $\( a \, t \) in bb(C)^(3 d) xor bb(C)^D$, a vertex defect ideal $frak(r) subset bb(C) \[ \[ a \, t \] \]$, and algebraic maps 
#[#set math.equation(numbering: n => "(3.4)")
 $ iota_i^(+) \( a \, t \) = \( a_i \, Y_i^(+) \( a \, t \) \) \, #h(2em) iota_i^(-) \( a \, t \) = \( 0 \, Y_i^(-) \( a \, t \) \) \, $ <def:restriction-maps>]

 with the following properties. The maps give the actual based restrictions of the flat vertex family modulo $frak(r)$. The $a_i$ are algebraic group coordinates for the first-slope holonomy, centered at the identity. The two maps 
$ t mapsto Y \( 0 \, t \) \, #h(2em) t mapsto sigma Y \( 0 \, t \) \, quad Y = \( Y_i^(+) \, Y_i^(-) \)_(i = 1)^d \, $

 have injective and complementary tangent images in $cal(Y)$.]
] <def:restriction-charts>

#proof[
  Apply Lemma 15 to each $J_i$ at its trivial reference representation, taking the full $H^1$, in the tree frames of Remark 16. A fixed edge word for the first torus generator gives an algebraic matrix function even when the transition cochain has nonzero defects. By Lemma 13 its three group coordinates have independent linear terms. Replace three of the $H^1$-coordinates by these coordinates, preserving complementary $y_i$-coordinates. The algebraic inverse function theorem permits this change.
  Apply Lemma 15 to $X$, retaining $U$. Restriction of a flat cochain to a wall, followed by tree normalization, is computed by finitely many based path words. One can arrange compatible refinements of the covers, or subdivide each of these finitely many paths into patches; in either description all resulting matrix expressions are finite products of transitions and their inverses. Taking the free coordinates of the wall chart therefore gives algebraic lifts of the restriction parameters. Over the quotient by $frak(r)$ the solved coordinates reproduce the same cochain by the uniqueness just proved.
  The joint positive first-slope values on $U$ have surjective derivative. Use their actual group coordinates as $a$, retaining complementary coordinates $t$. On the negative side the first slope bounds in $Q$, so its holonomy is exactly $1$ modulo $frak(r)$; its coordinate lift may thus be set equal to zero. This gives (3.4). Basing comparisons can also be lifted algebraically: they are products along finitely many paths and changes between chosen local frames. At reference all wall holonomies are $1$, so a varying basing frame makes no first-order change to their conjugated holonomies. The tangent maps are consequently the ordinary restriction maps. Lemma 13 gives their asserted complementarity. ◻
]

Let $H_(i \, 1) \( a_i \)$ and $H_(i \, 2) \( a_i \, y_i \)$ be the two slope matrices computed by the chosen words. Write $frak(d)_i$ for the wall triangle-defect ideal and put

#[#set math.equation(numbering: n => "(3.5)")
 $ U_i = - log H_(i \, 1) \, #h(2em) V_i = - log H_(i \, 2) \, #h(2em) frak(k)_i = #scale(x: 120%, y: 120%)[\(] frak(d)_i \, med H_(i \, 1) - 1 \, med H_(i \, 2) - 1 #scale(x: 120%, y: 120%)[\)] . $ <def:wall-ideal>]

Matrix entries generate the ideals in this notation. The logarithms are formal matrix logarithms; no algebraicity of their full series is asserted. They are traceless, because the matrices have determinant one and reference value $1$. The second-slope restriction has zero derivative, so

$ V_i in frak(m)_i^2 \, #h(2em) frak(d)_i subset frak(m)_i^2 . $

The first slope depends exactly on $a_i$, not on $y_i$. The convention $U_i = - log H_(i \, 1)$ is suited to the connection convention $d + A$, whose constant-circle holonomy is $exp \( - A \( partial_theta \) \)$.

=== 3.3 The nilpotent ideal of end holonomies <the-nilpotent-ideal-of-end-holonomies>

We now use the full finite word list. In $pi_1 \( X_Q \)$ the geometric construction gives

#[#set math.equation(numbering: n => "(3.6)")
 $ \[ z_1^(c_1) \, \[ z_2^(c_2) \, z_3^(c_3) \] \] = 1 \, #h(2em) c_1 \, c_2 \, c_3 in cal(H) \, $ <def:relations>]

where the three end labels are arbitrary and may repeat. Their independent conjugators turn the leading commutator terms into every scalar cubic product. The following calculation explains why words of length at most five suffice.

#thm([Lemma 3.7.])[
  (A finite adjoint spanning set).  #emph[For the word set $cal(H)$ fixed in Section 2 and the representation in (2.8), one has 
$ "span"_(bb(C)) { "Ad" rho \( c \) : c in cal(H) } = "End"_(bb(C)) \( frak(l) \) . $

]
] <geo:spanning>

#proof[
  Use the ordered basis $E = mat(delim: "(", 0, 1; 0, 0)$, $H = mat(delim: "(", 1, 0; 0, - 1)$, $F = mat(delim: "(", 0, 0; 1, 0)$. The operator $A = "Ad" rho \( h_0 \)$ has distinct eigenvalues $4 \, 1 \, 1 \/ 4$. Its three eigenprojections $P_E \, P_H \, P_F$ are polynomials of degree at most two in $A$. If $B_plus.minus = "Ad" rho \( h_plus.minus \)$, then
  $ B_(+) E = E \, & B_(+) H = H - 2 E \, & B_(+) F = F + H - E \,\
B_(-) E = E - H - F \, & B_(-) H = H + 2 F \, & B_(-) F = F . $
  For every two distinct basis lines, one of $P_i B_(+) P_j \, P_i B_(-) P_j$ is a nonzero multiple of the corresponding matrix unit. These operators are linear combinations of $A^a B_plus.minus A^b$ with $0 lt.eq a \, b lt.eq 2$, hence of adjoints of words of length at most five. The diagonal matrix units are the $P_i$ themselves. Thus the adjoints indexed by $cal(H)$ span all nine matrix units. ◻
]

#thm([Proposition 3.8.])[
  (Cubic nilpotence).  #emph[In $B \/ frak(r)$, where $B = bb(C) \[ \[ a \, t \] \]$, let $frak(n)$ be generated by all matrix entries of the end holonomies minus $1$. Then 
#[#set math.equation(numbering: n => "(3.7)")
 $ frak(n)^3 = 0 . $ <def:n-cube>]

 In particular, for either restriction map in (3.4), 
#[#set math.equation(numbering: n => "(3.8)")
 $ \( iota_i^plus.minus \)^(*) \( frak(k)_i \)^3 subset frak(r) . $ <def:k-cube>]

 The same conclusion holds for the cube of the sum of all these pulled-back ideals.]
] <def:cubic-nilpotence>

#proof[
  All computations initially take place in the Noetherian local ring $B \/ frak(r)$. Let $Z = z - 1$ for an end matrix. The determinant equation gives $"tr" Z = - det Z in frak(n)^2$. Thus one may replace $Z$ by its traceless part when computing triple products modulo $frak(m) frak(n)^3$. Indeed the discarded products lie in $frak(n)^4 subset frak(m) frak(n)^3$.
  The formal group-commutator expansion is
  $ \[ 1 + A \, \[ 1 + B \, 1 + C \] \] = 1 + \[ A \, \[ B \, C \] \] + upright("terms of total degree at least four") . $
  It follows by expanding each inverse as $\( 1 + A \)^(- 1) = 1 - A + A^2 - dots.h.c$; the inner commutator starts with $1 + \[ B \, C \]$, and its commutator with $1 + A$ first contributes $\[ A \, \[ B \, C \] \]$. In (3.6), replacing a conjugating matrix by its reference value changes the displayed cubic term only by $frak(m) frak(n)^3$. Every relation therefore implies, in $frak(n)^3 \/ frak(m) frak(n)^3$,
  $ \[ "Ad" rho \( c_1 \) Z_1 \, \[ "Ad" rho \( c_2 \) Z_2 \, "Ad" rho \( c_3 \) Z_3 \] \] = 0 \, $
  with traceless $Z_j$. The independent choice of all three conjugators, followed by linear combination and Lemma 18, replaces the three adjoint maps by arbitrary endomorphisms of $frak(l)$.
  For any three scalar linear functionals $ell_1 \, ell_2 \, ell_3$ on $frak(l)$, choose these endomorphisms as
  $ x mapsto ell_1 \( x \) E \, #h(2em) x mapsto ell_2 \( x \) H \, #h(2em) x mapsto ell_3 \( x \) F \, $
  where
  $ E = mat(delim: "(", 0, 1; 0, 0) \, quad H = mat(delim: "(", 1, 0; 0, - 1) \, quad F = mat(delim: "(", 0, 0; 1, 0) . $
  Since $\[ E \, \[ H \, F \] \] = - 2 H eq.not 0$, every product $ell_1 \( Z_1 \) ell_2 \( Z_2 \) ell_3 \( Z_3 \)$ vanishes in this quotient. The relation list permits repeated ends, so this includes all generators of $frak(n)^3 \/ frak(m) frak(n)^3$. Hence $frak(n)^3 = frak(m) frak(n)^3$; Nakayama’s lemma, applied to the finitely generated ideal $frak(n)^3$, proves (3.7).
  Under either restriction, the wall defects vanish modulo $frak(r)$. Each slope holonomy is either $1$ or the holonomy of its end longitude, with a possible inverse and a change of basing. Entries of its deviation therefore belong to $frak(n)$. This remains true for inverses, since $z^(- 1) - 1 = - z^(- 1) \( z - 1 \)$, and for conjugation. The images of all the $frak(k)_i$ are consequently contained in $frak(n)$, proving the final statements. ◻
]

== 4 Formal connections and the two ideal identities <sec:connections>

We retain the notation of Section 3. All connections and integrals in this section have characteristic-zero formal coefficients. We construct polarized Chern–Simons functions on the walls and prove two ideal identities. Their internal derivatives generate the vertex defect ideal, and the total wall value on the restriction graph belongs to the square of that ideal. The first conclusion transfers the cubic holonomy laws to gradient-ideal memberships; the second permits the graph correction in Section 5. After proving these identities, we control all finite gradient jets in one complex algebraic ring. This is the input for algebraic replacement; the full Chern–Simons series need not be algebraic.

=== 4.1 Realizing transition cochains by connections <realizing-transition-cochains-by-connections>

Off the triangle equations, the edge matrices need not be transition functions of a bundle. We first replace them by a genuine smooth formal bundle and connection while preserving the exact flat family modulo the triangle-defect ideal. The explicit inverses in the construction will also control its finite algebraic jets.

#thm([Lemma 4.1.])[
  (The image bundle).  #emph[For a finite algebraic transition-cochain chart on a compact smooth manifold $Z$, let $frak(d)$ be its triangle-defect ideal. There is a smooth formal rank-two bundle and connection whose reduction modulo $frak(d)$ is the specified flat family. Its fiber curvature lies in the closed extension of $frak(d)$. The construction permits a total connection including parameter directions. If the reference bundle is trivial, it has a global formal frame extending any chosen reference frame.]
] <conn:image-bundle>

#proof[
  Choose smooth functions $phi.alt_alpha$ subordinate to the good cover, with support contained in their patches and $sum_alpha phi.alt_alpha^2 = 1$. In a sufficiently large trivial bundle form the block matrix
  $ e_(alpha beta) = phi.alt_alpha phi.alt_beta g_(alpha beta) . $
  Terms with disjoint supports are zero; support containment makes the extensions by zero smooth. The triangle identities imply $e^2 - e in frak(d)$. Put $Delta = e^2 - e$ and define
  #[#set math.equation(numbering: n => "(4.1)")
   $ E = frac(1 + \( 2 e - 1 \) \( 1 + 4 Delta \)^(- 1 \/ 2), 2) . $ <conn:idempotent>]
  The binomial series is defined formally because $Delta in frak(m)$; indeed our charts have $frak(d) subset frak(m)^2$. All factors commute with $e$, and $\( 2 e - 1 \)^2 = 1 + 4 Delta$, so $E^2 = E$. Moreover $E = e$ modulo $frak(d)$. Its image has rank two, as its reference image does.
  On a patch indexed by $alpha$, set
  $ C_alpha = \( phi.alt_beta g_(beta alpha) \)_beta \, #h(2em) R_alpha = \( phi.alt_beta g_(alpha beta) \)_beta \, #h(2em) S_alpha = E C_alpha . $
  The first is a block column, the second a block row. One has the exact identity
  #[#set math.equation(numbering: n => "(4.2)")
   $ R_alpha C_alpha = sum_beta phi.alt_beta^2 g_(alpha beta) g_(beta alpha) = 1 . $ <conn:row-column>]
  Also $e C_alpha = C_alpha$ modulo $frak(d)$, so
  $ T_alpha := R_alpha S_alpha - 1 in frak(d) \, #h(2em) L_alpha = \( 1 + T_alpha \)^(- 1) R_alpha \|_("im" E) . $
  These give a frame and its inverse on the rank-two image bundle. For example $L_alpha S_alpha = 1$, and a rank-two frame with this left inverse is an isomorphism onto the rank-two image. In the reduction, the frames satisfy $S_beta = S_alpha g_(alpha beta)$ on intersections.
  Choose a subordinate partition $\( chi_alpha \)$ and blend the connections which are trivial in these frames:
  #[#set math.equation(numbering: n => "(4.3)")
   $ nabla s = sum_alpha chi_alpha S_alpha thin d_(upright("tot")) \( L_alpha s \) . $ <conn:blended-connection>]
  This is a connection since each summand satisfies the Leibniz rule and $sum chi_alpha = 1$. In the reduction modulo $frak(d)$ its fiber part is exactly the flat connection defined by the constant-in-fiber transitions. Its fiber curvature therefore has coefficients in $frak(d)$. Using the full differential in (4.3) also supplies a total connection, regardless of the parameter dependence of the reduced transition matrices.
  If a reference global frame is given, view it as a matrix of sections of $"im" E \( 0 \)$, extend its coefficients constantly in the parameters, and apply $E$. The resulting sections reduce to that frame, and hence are a formal global frame. Inverses exist by the maximal-ideal Neumann expansion. ◻
]

We shall also use a basic lifting property implicit in this construction. A formal flat connection over a complete local quotient has parallel frames on a contractible patch, uniquely specified by their values at one point. To verify this, pass to every finite parameter quotient, solve the ordinary parallel transport equations with values in its finite-dimensional coefficient algebra, and use flatness and contractibility for path independence. These constructions commute with quotient maps and give compatible formal frames. Thus a flat bundle isomorphism of reductions can be tested by based parallel transport, including over nonreduced coefficient rings.

#thm([Lemma 4.2.])[
  (Prescribed wall collars).  #emph[For a wall chart $\( a_i \, y_i \)$, the connection in Lemma 20 can be chosen, in a formal frame on a torus collar, to have total connection form 
#[#set math.equation(numbering: n => "(4.4)")
 $ U_i \( a_i \) thin d theta_i + V_i \( a_i \, y_i \) thin d eta_i \, $ <conn:collar>]

 with zero parameter components. It still reduces to the given flat family modulo $frak(d)_i$. The collar frame extends to a global formal frame on $J_i$ with $A_i \( 0 \) = 0$.]
] <conn:wall-collar>

#proof[
  Temporarily write $U \, V \, frak(d)$ for the wall data. Modulo $frak(d)$ the two torus holonomies commute. Their formal logarithms commute as well: they are power series in the two commuting matrices. On the simply connected cover of the collar, take the flat parallel frame $P$ issuing from the prescribed based frame. In the chosen convention the frame
  $ P exp \( theta U + eta V \) $
  is periodic, since the exponential cancels the deck holonomies $exp \( - U \)$, $exp \( - V \)$. Its fiber connection form is $U thin d theta + V thin d eta$.
  To lift it, use finitely many small collar patches with lifted torus coordinates. On each patch a lift of $P$ is expressed using an image frame $S_alpha$ and a fixed finite transition word. Multiply by the displayed exponential. These local lifted frames have the same reduction modulo $frak(d)$; their partition-of-unity average is therefore a formal frame with that reduction. In this frame prescribe (4.4) near the boundary, including its zero parameter components, and use a collar cutoff to interpolate with the previous total connection. Their fiber reductions are the same flat connection. Thus the interpolation preserves the reduction and keeps the fiber curvature in $frak(d)$. This reasoning does not require the off-equation matrices $U \, V$ to commute.
  At the origin the representation on each wall component is trivial, and the based choices make the collar frame the restriction of a global parallel frame. Lift that frame globally as in Lemma 20. On a collar its discrepancy from the prescribed frame is a matrix $G = 1 + O \( frak(m) \)$. Multiplication of the global frame by $1 + chi \( G - 1 \)$, extending coefficients by zero using a collar cutoff $chi$, makes it agree with the prescribed frame on a shorter collar. This matrix is formally invertible. The resulting global frame has the asserted properties. Closed wall components require only the initial global parallel frame and its formal lift. ◻
]

=== 4.2 Polarized Chern–Simons functions <polarized-chernsimons-functions>

The functional below uses the classical Chern–Simons form #cite(label("ChernSimons1974")) Section 3, Propositions 3.2 and 3.8 with the normalization displayed here. The boundary polarization and the identities needed in this proof are derived below.

#prodef([Definition 4.3.])[
  (The polarized wall function).  Use the global frame in Lemma 21, and denote the fiber connection form by $A_i$. With $epsilon.alt_i = integral_(partial J_i) d theta_i and d eta_i$, put
  #[#set math.equation(numbering: n => "(4.5)")
   $ "CS"_(J_i) \( A_i \) & = integral_(J_i) "tr" (A_i and d A_i + 2 / 3 A_i and A_i and A_i) \,\
P_i \( a_i \, y_i \) & = "CS"_(J_i) \( A_i \) + epsilon.alt_i "tr" \( U_i V_i \) . $ <conn:polarized-potential>]
  The differential in this integral is fiberwise. Integrals over all closed components are included with their chosen orientations.
] <conn:potential-definition>

#thm([Lemma 4.4.])[
  (Polarized variation).  #emph[Writing $F_A = d A + A and A$, every parameter variation satisfies 
#[#set math.equation(numbering: n => "(4.6)")
 $ delta P_i = 2 integral_(J_i) "tr" \( delta A_i and F_(A_i) \) + 2 epsilon.alt_i "tr" \( V_i thin delta U_i \) . $ <conn:variation-formula>]

 Consequently $P_i in frak(m)_i^3$ and every coefficient of its parameter differential lies in $frak(k)_i bb(C) \[ \[ a_i \, y_i \] \]$.]
] <conn:variation>

#proof[
  Differentiate the integrand in (4.5). Cyclic trace, with the signs from degrees of forms, gives
  $ delta "tr" (A and d A + 2 / 3 A^3) = 2 "tr" \( delta A and F_A \) - d "tr" \( A and delta A \) . $
  On the torus the integrated boundary term is
  $ - epsilon.alt_i "tr" \( U_i thin delta V_i - V_i thin delta U_i \) . $
  Adding the variation of $epsilon.alt_i "tr" \( U_i V_i \)$ gives (4.6). The fiber curvature is in $frak(d)_i subset frak(m)_i^2$, and $V_i in frak(m)_i^2$. Thus each first derivative of $P_i$ has order at least two. Since $A_i \( 0 \) = 0$, also $P_i \( 0 \) = 0$, which proves $P_i in frak(m)_i^3$. Finally $frak(d)_i$ and $V_i$ are contained in the completed ideal $frak(k)_i$; integration preserves that ideal by Definition 14. ◻
]

=== 4.3 The derivative ideal <the-derivative-ideal>

We now compare the wall functions on the two boundary copies of every cut. Their internal derivatives will recover every generator of the vertex defect ideal, including its nonreduced structure. The reason is cohomological: internal wall variations detect the restricted curvature classes by duality, and the degree-two Mayer–Vietoris isomorphism detects the vertex curvature class. We apply this to each possible first obstruction to lifting the flat vertex family.

Define the separated function and its restriction by

#[#set math.equation(numbering: n => "(4.7)")
 $ Psi \( a \, C \) = sum_(i = 1)^d #scale(x: 120%, y: 120%)[\(] P_i \( a_i \, C_i^(+) \) - P_i \( 0 \, C_i^(-) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) C = \( C_i^(+) \, C_i^(-) \)_(i = 1)^d in cal(Y) \, $ <conn:psi>]

and use $Y = \( Y_i^(+) \, Y_i^(-) \)_(i = 1)^d$ from Proposition 17. A notation such as $partial_C Psi \( a \, Y \)$ always means: first differentiate with respect to the independent $C$-coordinates, then substitute $C = Y \( a \, t \)$.

#thm([Lemma 4.5.])[
  (A traceless vertex curvature).  #emph[The vertex chart admits a global formal connection $A_X$ whose curvature is traceless and belongs to $frak(r)$. It reduces to the exact transition family modulo $frak(r)$. Its reference bundle is trivial.]
] <conn:vertex-connection>

#proof[
  Apply Lemma 20. The reference bundle comes from a graph; a complex rank-two bundle with connected structure group on a graph is trivial, by choosing a frame on its vertices and extending over its edges. Its pullback to each component of $X$ is therefore trivial. A continuous reference frame may be smoothly approximated in the smooth bundle, preserving invertibility, and then lifted formally.
  Modulo $frak(r)$, the special-linear transitions give a parallel determinant section. Lift it to a nonvanishing formal section of the determinant bundle; local coefficient lifts and a partition suffice, and the reference section is nonzero. If its induced determinant connection has one-form $alpha$, then $alpha in frak(r)$, because the reduced section is parallel. Subtract $1 / 2 alpha thin 1$ from the rank-two connection. This preserves its reduction and makes the determinant section parallel, so the resulting curvature has trace zero. ◻
]

#thm([Proposition 4.6.])[
  (Generation of the full defect ideal).  #emph[In $B = bb(C) \[ \[ a \, t \] \]$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ #scale(x: 120%, y: 120%)[\(] partial_C Psi \( a \, Y \( a \, t \) \) #scale(x: 120%, y: 120%)[\)] = frak(r) . $ <conn:derivative-identity>]

]
] <conn:derivative-ideal>

#proof[
  In a $y_i$-variation, $U_i$ is fixed. Thus the boundary term of (4.6) is zero. After either substitution $iota_i^plus.minus$, the wall curvature belongs to $frak(r)$, since the restriction is exactly flat modulo $frak(r)$. All the derivatives in (4.8) consequently belong to $frak(r)$.
  It remains to prove that their images span $frak(r) \/ frak(m) frak(r)$. Suppose a nonzero functional $lambda$ on this space annihilates all those images. Form its small extension (3.3), so that $I = frak(r) \/ frak(s)$ is one-dimensional and $frak(m) I = I^2 = 0$. Reduce the connection from Lemma 24 to $B \/ frak(s)$. Its curvature is an $I$-valued traceless two-form. Since multiplying $I$ by a positive-order parameter coefficient gives zero, Bianchi becomes the reference equation $d_(A_X \( 0 \)) F_(A_X) = 0$. The curvature thus defines
  $ kappa in H^2 \( X \; frak(l)_rho \) ⊗_(bb(C)) I . $
  The wall connections and the restrictions of $A_X$ are isomorphic modulo $frak(r)$, by the based restriction construction. Lift a smooth formal identification of their bundles over $B \/ frak(s)$. In that identification their difference is an $I$-valued one-form $eta$. Curvature changes by exactly $d_(A \( 0 \)) eta$: its quadratic term is zero since $I^2 = 0$, and the positive-order part of $A$ acts trivially since $frak(m) I = 0$. Thus the wall curvature classes are the restrictions of $kappa$, in the common reference frames.
  At the wall origin a $y_i$-derivative $partial_(y_(i \, j)) A_i \( 0 \)$ is a closed one-form, because wall curvature has order at least two. Its tangential boundary value is zero: $U_i$ does not vary with $y_i$, and $V_i$ has zero linear term. Its absolute cohomology class is the corresponding chart tangent, as is seen by first-order holonomy. Hence these forms represent all of $H^1 \( J_i \, partial J_i \; frak(l) \)$, by (3.2). If a general-linear frame adds a scalar exact term, traceless projection has the same $frak(l)$-class and the same pairing with the traceless curvature. The assertion includes every closed wall component.
  Now apply $lambda$ to the internal derivatives. The polarized variation formula reduces to the nonzero scalar $2$ times the trace integration pairing of these relative one-forms with the wall restrictions of $kappa$, with an irrelevant overall minus sign on negative copies. Poincare–Lefschetz duality #cite(label("Hatcher2002")) Theorem 3.43 gives a perfect pairing of these relative classes with $H^2 \( J_i \; frak(l) \)$: the manifolds are compact oriented three-manifolds and the trace form identifies the coefficient system with its dual. Thus every wall restriction of $kappa$ vanishes. Apply the degree-two isomorphism of Lemma 12 to the pair $\( kappa \, 0 \)$. Its image is zero, so $kappa = 0$ on every component of $X$.
  De Rham cohomology with a flat smooth coefficient bundle computes this local-system cohomology. Consequently there is a traceless reference one-form $eta_X$, with values in $I$, satisfying
  $ d_(A_X \( 0 \)) eta_X = - F_(A_X) . $
  Then $A_X + eta_X$ is #emph[exactly] flat over $B \/ frak(s)$; all omitted nonlinear terms are zero by $frak(m) I = I^2 = 0$. It has the prescribed reduction over $B \/ frak(r)$.
  On every contractible patch choose the original parallel frame of that reduction, namely the one realizing its chart transitions. Lift its initial value at a point and parallel-transport with the corrected connection. Uniqueness of parallel transport makes the reduced frame equal to the original specified frame. The lifted constant transition matrices therefore give a flat lift of the actual vertex cochain, not merely of an unbased isomorphism class. This contradicts Lemma 15. The contradiction does not require the corrected connection to remain in the chosen $U$-slice; the equation-chart lemma excludes arbitrary cochain corrections. No nonzero annihilating functional exists.
  The quotient $frak(r) \/ frak(m) frak(r)$ is finite-dimensional. Its derivative images therefore span, and Nakayama’s lemma applied to the quotient of $frak(r)$ by the derivative ideal proves (4.8). ◻
]

=== 4.4 The square of the ideal and gluing <the-square-of-the-ideal-and-gluing>

The derivative identity is now established. To control the value of the potential on the restriction graph, we compare connections on the closed boundary of $X$. Changes of connection and changes of frame have different effects on Chern–Simons values; the next lemma records both before they are used in the gluing argument.

#thm([Lemma 4.7.])[
  (Two Chern–Simons comparisons on a closed manifold).  #emph[Let $N$ be a closed oriented three-manifold, and let $A$ be a global formal connection with $F_A in I$, for a scalar ideal $I$.]
  + #emph[If $eta in I$ is a one-form, then 
$ "CS"_N \( A + eta \) - "CS"_N \( A \) in I^2 . $

]
  + #emph[For an arbitrary smooth formal gauge $g$, 
$ "CS"_N \( A^g \) - "CS"_N \( A \) $

 is independent of the parameters. The reference gauge need not be nullhomotopic.]
] <conn:closed-comparisons>

#proof[
  For the first assertion put $A_u = A + u eta$, $0 lt.eq u lt.eq 1$. Its curvature $F_A + u thin d_A eta + u^2 eta and eta$ lies in $I$. The variation formula on the closed manifold gives
  $ "CS"_N \( A + eta \) - "CS"_N \( A \) = 2 integral_0^1 integral_N "tr" \( eta and F_(A_u) \) thin d u in I^2 . $
  For the second use $A^g = g^(- 1) A g + g^(- 1) d_N g$. For a parameter variation set $xi = g^(- 1) delta g$. Then
  $ delta A^g = g^(- 1) \( delta A \) g + d_(A^g) xi \, #h(2em) F_(A^g) = g^(- 1) F_A g . $
  Bianchi and the closedness of $N$ give
  $ delta #scale(x: 120%, y: 120%)[\(] "CS"_N \( A^g \) - "CS"_N \( A \) #scale(x: 120%, y: 120%)[\)] = 2 integral_N d_N "tr" \( xi F_(A^g) \) = 0 . $
  In characteristic zero a formal series with zero first derivatives is constant. This argument permits any reference homotopy class of $g$; its possible degree affects only that constant. ◻
]

#thm([Proposition 4.8.])[
  (The square-ideal value identity).  #emph[For the same maps and potential, 
#[#set math.equation(numbering: n => "(4.9)")
 $ Psi \( a \, Y \( a \, t \) \) in frak(r)^2 . $ <conn:value-identity>]

]
] <conn:value-ideal>

#proof[
  All wall connections in this proof are first pulled back by their maps $iota_i^plus.minus$ to $B = bb(C) \[ \[ a \, t \] \]$. Their curvature lies in $frak(r)$. On a positive wall the second torus slope bounds in $Q$, so $V_i \( a_i \, Y_i^(+) \) in frak(r)$. Choose a fiber cutoff $chi$ supported on its collar, equal to one near the boundary, and put
  $ A_(i \, u) = A_i - u chi V_i thin d eta_i \, #h(2em) 0 lt.eq u lt.eq 1 . $
  The connection change lies in $frak(r)$, and every interpolated curvature also lies in $frak(r)$. This is immediate from the curvature change formula and does not assume commutation away from the defect quotient. Use the polarized functional along this path:
  $ P_(i \, u) = "CS"_(J_i) \( A_(i \, u) \) + epsilon.alt_i "tr" \( U_i \( 1 - u \) V_i \) . $
  Here $U_i$ is held fixed. Formula (4.6) has zero boundary term for the $u$-variation; its bulk term is a product of two $frak(r)$-valued factors. Thus $P_(i \, 1) - P_(i \, 0) in frak(r)^2$. At $u = 1$ the polarization correction is zero and the collar form is the pure form $U_i thin d theta_i$. On a negative wall $U_i \( 0 \) = 0$ already, so its functional is raw Chern–Simons and its collar form is the pure form $V_i \( 0 \, Y_i^(-) \) thin d eta_i$. It follows that, modulo $frak(r)^2$, $Psi \( a \, Y \)$ is the oriented sum of the raw wall Chern–Simons integrals of these modified connections.
  We next construct an #emph[exactly flat] formal connection on $Q$ with those pure collar forms. Its reduction must be the actual restriction from the flat vertex family, including based transports. Fix the standard paths from the main basepoint of $Q$ to the seam basepoints. Lift their comparison transport matrices from $B \/ frak(r)$ to $B$. Assign each free end generator the required pure collar holonomy, conjugated by its lifted comparison transport and adjusted for its orientation. The other slope at that seam bounds in $Q$. Lift the matrices of the $h$-generators from the vertex restriction arbitrarily in $"SL"_2 \( B \)$. Such lifts exist because the group is smooth at every reference matrix. Since the end generators and $h$-generators freely generate $pi_1 \( Q \)$, these choices impose no relations and define a representation over $B$ lifting the specified one over $B \/ frak(r)$. Its associated flat bundle has an exactly flat connection. Choose its frame at each seam basepoint using the lifted comparison transport; parallel transport followed by a one-slope exponential gives the prescribed pure connection form on that collar.
  These collar frames extend to a global frame on $Q$. At the origin this is a relative section problem for a special-linear bundle on a compact three-manifold, with prescribed section on its boundary collars and at its basepoint. The group $"SL"_2 \( bb(C) \)$ retracts onto $"SU"_2 tilde.equiv S^3$, so its $pi_0 \, pi_1 \, pi_2$ vanish. The obstruction to extending a section across a relative cell of dimension $j lt.eq 3$ lies in $pi_(j - 1)$ of this group; all such obstructions vanish. A smooth reference extension follows by relative smooth approximation. At successive formal orders the discrepancy is identity modulo the maximal ideal and extends coefficientwise with a cutoff, just as in Lemma 21. This yields a global formal frame agreeing with every prescribed collar frame.
  In this frame $"CS"_Q$ is constant in the parameters. Its variation has zero bulk term by exact flatness. On each torus both its connection form and its variation lie along the same single one-form $d theta_i$ or $d eta_i$, so $"tr" \( A_Q and delta A_Q \)$ is zero. The boundary term of the raw Chern–Simons variation therefore also vanishes.
  Glue these framed pieces to form a connection $A_partial$ in a global frame on the closed three-manifold $partial X$. The forms agree on the product collars, so their integrals add. We must compare the assembled flat reduction with the actual restriction from $X$, including its transports. The component $X_0 = X_Q$ containing $Q$ contains all the torus-bearing wall copies in its boundary. Each such copy attaches to $Q$ along exactly one connected torus. The incidence graph has one $Q$-vertex and one leaf for each such wall copy. It has no cycles. Fix the flat comparison on $Q$, including its seam-basepoint values. On a wall its based representation is the prescribed restriction, so choose the flat comparison with that same value at its single seam basepoint. Parallel transport makes the two comparisons agree on the entire connected torus. There is no second attachment imposing an additional transport condition. Every closed wall component is an isolated boundary piece for this purpose and is compared separately, whether it belongs to $X_0$ or to another component of $X$. Thus the assembled reduction is isomorphic to the full boundary restriction of the vertex family.
  Lift this boundary bundle isomorphism formally. In global frames this amounts to lifting smooth matrix coefficients; the reference determinant is nonzero, so the lifted matrix has a formal inverse. No extension of this identification over $X$ is required. Denote by $g$ the resulting boundary gauge comparison with the already chosen global frame of $A_X$. Then in a common boundary frame
  $ A_partial = A_X^g \|_(partial X) + eta \, #h(2em) eta in frak(r) . $
  Both compared curvatures are in $frak(r)$. The first part of Lemma 26 shows that this #emph[connection change] contributes only an element of $frak(r)^2$. The second part shows that the separate #emph[frame change] contributes a parameter-constant term, which disappears after subtracting reference values. The gauge $g \( 0 \)$ may have nonzero degree; it is not asserted to extend over $X$.
  Finally apply Stokes in the global frame already chosen on $X$. The identity
  $ d thin "tr" (A_X and d A_X + 2 / 3 A_X^3) = "tr" \( F_(A_X) and F_(A_X) \) $
  follows by the graded cyclic trace rule. Hence
  $ "CS"_(partial X) \( A_X \|_(partial X) \) = integral_X "tr" \( F_(A_X) and F_(A_X) \) in frak(r)^2 . $
  Stokes applies componentwise to the compact oriented smooth four-manifold with its rounded collared corners, including any components with empty boundary. The $Q$-contribution is constant, all $P_i \( 0 \)$ are zero, and the preceding connection and gauge comparisons hold after subtracting the origin values. These facts prove (4.9). ◻
]

=== 4.5 Algebraic control of the wall gradients <algebraic-control-of-the-wall-gradients>

The two ideal identities are now proved in the completed parameter ring. To pass to algebraic replacement, we return to the original wall functions $P_i$ and the total connections that define them. The modified connections in the square-ideal proof were comparison devices after pullback to the vertex chart; they did not change these wall functions. We show that every finite gradient jet has a representative in one fixed smooth complex algebraic ring.

#thm([Proposition 4.9.])[
  (All gradient jets in one complex algebraic ring).  #emph[For each wall there is one fixed algebraic chart ring $A_i^(*)$, with completion $bb(C) \[ \[ a_i \, y_i \] \]$, containing the original transition germs and $frak(k)_i$, such that for every integer $b gt.eq 1$, every coefficient of $d_(upright("param")) P_i$ modulo $frak(k)_i^b$ is the image of an element of $A_i^(*)$. The ring is independent of $b$.]
] <conn:all-jets>

#proof[
  Fix a wall $Z = J_i$, put $v = \( a_i \, y_i \)$, and write $B = bb(C) \[ \[ v \] \]$, $frak(d) = frak(d)_i$, and $frak(k) = frak(k)_i$. Choose the common etale chart ring $A^(*)$ once, containing the finite transition cochain, its defects, and the two holonomy matrices $H_(i \, 1) \, H_(i \, 2)$.
  The global frame defining $P_i$ has only formal control in the maximal ideal; this does not give algebraic coefficients modulo powers of $frak(k)$. We first express the gradient without derivatives of that frame, then control the local expressions that remain.
  Suppress the wall index. In the global frame defining $P$, write the total connection as
  $ nabla = d_Z + d_(upright("param")) + A + Gamma . $
  Here $A$ and $Gamma$ are its fiber and parameter components. For a parameter vector $delta$, define the mixed curvature with the parameter argument first:
  #[#set math.equation(numbering: n => "(4.10)")
   $ K_delta = F_(upright("tot")) \( delta \, thin dot.op thin \) = delta A - d_A Gamma_delta . $ <conn:mixed-curvature>]
  Bianchi’s identity $d_A F_A = 0$ and trace invariance give
  $ "tr" \( d_A Gamma_delta and F_A \) = d_Z "tr" \( Gamma_delta F_A \) . $
  Consequently the exact polarized variation is
  #[#set math.equation(numbering: n => "(4.11)")
   $ delta P & = 2 integral_Z "tr" \( K_delta and F_A \) + 2 integral_(partial Z) "tr" \( Gamma_delta F_A \) + 2 epsilon.alt "tr" \( V thin delta U \)\
 & = 2 integral_Z "tr" \( K_delta and F_A \) + 2 epsilon.alt "tr" \( V thin delta U \) . $ <conn:controlled-gradient>]
  The second equality holds because the global frame agrees with the prescribed collar frame for every parameter, and the total connection has $Gamma_delta = 0$ there. Both curvature components in the bulk trace transform by conjugation under every parameter-dependent frame change. We can therefore compute that trace in the local image and collar frames of Lemmas 20 and 21, without differentiating the global gauge.
  We now check that the coefficients needed in (4.11) can be computed in $A^(*)$ to any prescribed $frak(k)$-adic order. On each smooth coordinate patch we maintain the following property: modulo $frak(k)^b$, each required coefficient is a finite sum
  #[#set math.equation(numbering: n => "(4.12)")
   $ sum_(nu = 1)^(N_b) f_nu \( x \) thin a_nu \( v \) \, #h(2em) f_nu upright(" smooth") \, quad a_nu in A^(*) . $ <conn:finite-sums>]
  The functions, constants, and number of summands may depend on $b$; the complex algebra $A^(*)$ does not. We verify this for every operation actually used.
  Recall the image-frame construction: $S_alpha = E C_alpha$, $T_alpha = R_alpha S_alpha - 1 in frak(d)$, and $L_alpha = \( 1 + T_alpha \)^(- 1) R_alpha \|_("im" E)$. The block matrix $e_(alpha beta) = phi.alt_alpha phi.alt_beta g_(alpha beta)$ has the finite-sums property exactly. Since $Delta = e^2 - e in frak(d) subset frak(k)$, the binomial series in (4.1) truncates after finitely many terms modulo $frak(k)^b$. The explicit inverse (4.2) is equally important. In the notation of Lemma 20,
  $ \( 1 + T_alpha \)^(- 1) equiv sum_(j = 0)^(b - 1) \( - T_alpha \)^j med \( mod med frak(k)^b \) . $
  Thus image frames and their inverses satisfy (4.12); no smooth partition function has been inverted. In frame $S_beta$, the total connection (4.3) has matrix
  $ sum_alpha chi_alpha \( L_beta S_alpha \) thin d_(upright("tot")) \( L_alpha S_beta \) . $
  This expression introduces only the already specified inverse matrices, multiplication, and differentiation.
  Next consider the averaged collar frame. Its local lifts have the form
  $ T_gamma = S_(alpha \( gamma \)) W_gamma exp \( theta_gamma U + eta_gamma V \) \, $
  where $W_gamma$ is a fixed transition word. Both $U \, V$ belong to $frak(k) B$, since the corresponding matrix deviations generate part of $frak(k)$. The logarithms and this exponential consequently truncate to finite expressions modulo each $frak(k)^b$. Write $T = sum_gamma chi_gamma T_gamma$ for the average. On a fixed small patch choose one participating lift $T_0$. All the lifts agree modulo $frak(d)$; hence
  $ T - T_0 = sum_gamma chi_gamma \( T_gamma - T_0 \) in frak(d) . $
  Modulo $frak(k)$, the exponential is $1$. An explicit leading inverse on that patch is therefore
  $ V_0 = W_0^(- 1) R_(alpha \( 0 \)) \|_("im" E) . $
  It satisfies $V_0 T = 1 + N$ with $N in frak(k)$, and the inverse of the average is
  #[#set math.equation(numbering: n => "(4.13)")
   $ T^(- 1) equiv (sum_(j = 0)^(b - 1) \( - N \)^j) V_0 med \( mod med frak(k)^b \) . $ <conn:average-inverse>]
  This proves the finite-sums property for the average and its inverse. Agreement of its reductions, not merely invertibility of its summands, is what permits this calculation. The collar interpolation uses only fixed smooth cutoffs and these expressions, so it preserves the same property.
  The coordinate derivations of the affine parameter space extend uniquely to its etale algebra and preserve its local ring $A^(*)$. In an implicit presentation $cal(F) \( v \, w \) = 0$, differentiation gives
  $ partial_(v_j) w = - #scale(x: 120%, y: 120%)[\(] partial_w cal(F) \( v \, w \) #scale(x: 120%, y: 120%)[\)]^(- 1) partial_(v_j) cal(F) \( v \, w \) . $
  The variable Jacobian determinant is a unit germ in $A^(*)$, because its value at the origin is nonzero. Its inverse therefore already belongs to this local etale ring. The product rule gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ partial_(v_j) \( frak(k)^(b + 1) B \) subset frak(k)^b B . $ <conn:derivative-order>]
  Fiber derivatives preserve scalar ideal order. Accordingly, compute primitive frame and logarithm expressions one ideal order higher when taking a parameter derivative.
  The fiber connection and fiber curvature use only fiber derivatives of primitive frame expressions. The parameter connection component uses one parameter derivative, and $K_delta$ uses at most one: its two terms are a parameter derivative of $A$ and a fiber covariant derivative of $Gamma_delta$. Thus calculations modulo $frak(k)^(b + 1)$, followed by (4.14), suffice to compute every term of (4.11) modulo $frak(k)^b$. The torus term is likewise controlled by finite logarithm expansions one order higher.
  Finally take a finite partition to integrate the local expressions. The integral of (4.12) is $sum_nu \( integral f_nu \) a_nu$, which belongs to $A^(*)$ because every integration constant is a complex scalar. For the remainder, work modulo $frak(m)^N$. It has values in the finite-dimensional scalar subspace which is the image of $frak(k)^b$, and integration preserves that subspace. The integrated remainder therefore lies in $frak(k)^b + frak(m)^N$ for every $N$. Ideals of a complete Noetherian local ring are adically closed, so it lies in $frak(k)^b$. This justifies the assertion with the completed smooth coefficient modules actually in use. ◻
]

#prodef([Remark 4.10.])[
  (Scope of the fixed-ring assertion).  Proposition 28 asserts finite-sum jets in one local #emph[complex] algebraic ring. It does not assert that an arbitrary integral of algebraic functions of a parameter is algebraic, or that all coefficients of the original Chern–Simons series lie in one finitely generated $bb(Z)$-algebra. The latter kind of coefficient ring will be chosen only after algebraic replacement and a finite selection of ideal-membership witnesses.
] <conn:fixed-ring-scope>

=== 4.6 The data supplied to algebraic replacement <the-data-supplied-to-algebraic-replacement>

We collect the identities just proved and transfer the cube-zero holonomy law to the two types of functions used by the final algebraic obstruction. Both the first-slope coordinates and the negative-wall first-slope derivatives lie in the end-deviation ideal modulo $frak(r)$.

#thm([Corollary 4.11.])[
  (The deformation output).  #emph[The algebraic maps in Proposition 17 and the formal functions $P_i in bb(C) \[ \[ a_i \, y_i \] \]$ have the following properties:]
  + #emph[$P_i in frak(m)_i^3$, its gradient is zero modulo $frak(k)_i$, and all its gradient jets have representatives in one fixed complex algebraic chart ring as in Proposition 28.]
  + #emph[The two tangent images of $Y \( 0 \, t \)$ and $sigma Y \( 0 \, t \)$ are complementary $D$-planes in the $2 D$-dimensional $C$-space.]
  + #emph[For $Psi$ in (4.7), 
$ #scale(x: 120%, y: 120%)[\(] partial_C Psi \( a \, Y \) #scale(x: 120%, y: 120%)[\)] = frak(r) \, #h(2em) Psi \( a \, Y \) in frak(r)^2 . $

]
  + #emph[Choose one scalar first-slope coordinate $a_(i \, 1)$ for each $i$, and define 
#[#set math.equation(numbering: n => "(4.15)")
 $ p_i \( y_i \) = partial_(a_(i \, 1)) P_i \( 0 \, y_i \) . $ <conn:p-functions>]

 For every triple of labels, including repetitions, 
#[#set math.equation(numbering: n => "(4.16)")
 $ a_(i \, 1) a_(j \, 1) a_(k \, 1) \, #h(2em) p_i \( Y_i^(-) \) thin p_j \( Y_j^(-) \) thin p_k \( Y_k^(-) \) med in med #scale(x: 120%, y: 120%)[\(] partial_C Psi \( a \, Y \) #scale(x: 120%, y: 120%)[\)] . $ <conn:cubic-laws>]

]
  #emph[Moreover the cube of the sum of the pulled-back wall ideals is contained in $frak(r)$, as in Proposition 19.]
] <conn:output>

#proof[
  Only the last item remains to be checked. Work modulo $frak(r)$, where the end-deviation ideal $frak(n)$ satisfies $frak(n)^3 = 0$. Each $a_(i \, 1)$ is an algebraic coordinate of an end holonomy at the identity, and hence belongs to $frak(n)$. Evaluate (4.6) with the $a_(i \, 1)$-variation on the negative copy, at $\( 0 \, Y_i^(-) \( a \, t \) \)$. Its curvature term vanishes modulo $frak(r)$, while its torus term is
  $ 2 epsilon.alt_i "tr" (V_i \( 0 \, Y_i^(-) \) thin partial_(a_(i \, 1)) U_i \( 0 \)) . $
  The remaining second-slope matrix on that copy is the end holonomy, with the prescribed orientation and basing. Its negative logarithm consequently has entries in $frak(n)$, so $p_i \( Y_i^(-) \) in frak(n)$. Both kinds of triple products vanish modulo $frak(r)$. Proposition 25 identifies that ideal with the derivative ideal, which gives (4.16). ◻
]

== 5 Algebraic replacement and specialization <sec:algebra>

The connection construction supplies formal potentials over $bb(C)$, algebraic restriction maps, and identities in their completed local rings. We first record exactly the data used in this section. We then replace the potentials to sufficiently high order along the wall ideals, correct the restriction graph formally, and put all resulting identities over one finitely generated coefficient ring. Only these new data will be specialized to positive characteristic.

#prodef([Definition 5.1.])[
  (The algebraic input).  Fix finitely many labels $1 lt.eq i lt.eq d$, integers $n_i gt.eq 0$, and $D = sum_i n_i$. Write
  $ a_i = \( a_(i \, 1) \, a_(i \, 2) \, a_(i \, 3) \) \, #h(2em) y_i in bb(C)^(n_i) \, #h(2em) C = \( C_i^(+) \, C_i^(-) \)_(i = 1)^d in bb(C)^(2 D) \, #h(2em) z = \( a \, t \) \, quad t in bb(C)^D . $
  An algebraic germ in specified coordinates means a regular germ at the specified complex point of an étale neighborhood of their affine coordinate space, expanded in those coordinates. Finitely many such germs can be placed in a common neighborhood. The following are the input data established by the preceding geometric and connection constructions.
  + For each $i$ there is a local étale complex ring $A_i$ in coordinates $\( a_i \, y_i \)$, with completion $B_i = bb(C) \[ \[ a_i \, y_i \] \]$, maximal ideal $frak(m)_i$, and an ideal $frak(k)_i subset frak(m)_i$. The formal potential $P_i^(upright(o)) in frak(m)_i^3 B_i$ satisfies, for every wall coordinate $x$,
    $ partial_x P_i^(upright(o)) in frak(k)_i B_i \, #h(2em) partial_x P_i^(upright(o)) in A_i + frak(k)_i^b B_i quad \( b gt.eq 1 \) . $
    The second assertion means that a representative in the #emph[same] ring $A_i$ exists at every indicated ideal order; it does not assert that the full gradient is algebraic.
  + There are centered algebraic germs $Y_i^plus.minus \( z \)$ and an algebraic ideal $frak(r)$ in a local étale chart in $z$. All ideals in the following identities are extended to $B_X = bb(C) \[ \[ z \] \]$, whose maximal ideal is $frak(m)$. Put
    $ phi.alt_i^(+) \( z \) = \( a_i \, Y_i^(+) \( z \) \) \, #h(2em) phi.alt_i^(-) \( z \) = \( 0 \, Y_i^(-) \( z \) \) \, #h(2em) L_i^plus.minus = phi.alt_i^(plus.minus *) \( frak(k)_i \) B_X . $
    Then $L_i^plus.minus subset frak(m)$ and
    #[#set math.equation(numbering: n => "(5.1)")
     $ \( L_i^plus.minus \)^3 subset frak(r) . $ <alg:cube-input>]
  + With $Y = \( Y_i^(+) \, Y_i^(-) \)_(i = 1)^d$, define
    $ Psi^(upright(o)) \( a \, C \) = sum_(i = 1)^d #scale(x: 120%, y: 120%)[\(] P_i^(upright(o)) \( a_i \, C_i^(+) \) - P_i^(upright(o)) \( 0 \, C_i^(-) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) p_i^(upright(o)) \( y_i \) = partial_(a_(i \, 1)) P_i^(upright(o)) \( 0 \, y_i \) . $
    Differentiation with respect to $C$ is performed before substitution. The following identities hold in $B_X$:
    #[#set math.equation(numbering: n => "(5.2)")
     $ #scale(x: 120%, y: 120%)[\(] \( partial_C Psi^(upright(o)) \) \( a \, Y \) #scale(x: 120%, y: 120%)[\)] = frak(r) \, #h(2em) Psi^(upright(o)) \( a \, Y \) in frak(r)^2 \, $ <alg:value-gradient-input>]
    and, for every ordered triple $\( i \, j \, k \)$, with repetitions allowed,
    #[#set math.equation(numbering: n => "(5.3)")
     $ a_(i \, 1) a_(j \, 1) a_(k \, 1) in frak(r) \, #h(2em) p_i^(upright(o)) \( Y_i^(-) \) p_j^(upright(o)) \( Y_j^(-) \) p_k^(upright(o)) \( Y_k^(-) \) in frak(r) . $ <alg:triple-input>]
    Here the original triple memberships and (5.1) are consequences of the end-deviation cube law on the original restriction graph.
  + Let $sigma$ exchange $C_i^(+)$ and $C_i^(-)$ for every $i$, and set $J = partial_t Y \( 0 \, 0 \)$, a $2 D$-by-$D$ matrix. The two tangent images are complementary:
    #[#set math.equation(numbering: n => "(5.4)")
     $ Delta = det \[ thin J med med sigma J thin \] eq.not 0 . $ <alg:tangent-input>]
] <alg:input-data>

No assertion about connections over a field of positive characteristic will be needed. In particular the algebraic input is a package of consequences of the connection argument, not an assumption that its Chern–Simons integrals have algebraic power-series coefficients.

=== 5.1 A primitive modulo an arbitrary ideal power <a-primitive-modulo-an-arbitrary-ideal-power>

We use the following form of detection by a formal arc.

#thm([Lemma 5.2.])[
  (Detection on a formal arc).  #emph[Let $S$ be a reduced complete Noetherian local $bb(C)$-algebra with residue field $bb(C)$. Every nonzero element $b$ of its maximal ideal has nonzero image under some continuous local $bb(C)$-algebra homomorphism $S arrow.r bb(C) \[ \[ u \] \]$. Consequently, if $I subset B = bb(C) \[ \[ v_1 \, dots.h \, v_n \] \]$ is radical and $P in B$ satisfies $partial_(v_j) P in I$ for every $j$, then $P - P \( 0 \) in I$.]
] <alg:arc>

#proof[
  Choose a minimal prime of $S$ not containing $b$ and pass to the corresponding complete local domain $S_0$. Its dimension $r$ is positive. Choose $r - 1$ elements $x_2 \, dots.h \, x_r$ such that $\( b \, x_2 \, dots.h \, x_r \)$ is primary to the maximal ideal. Such a choice is possible because $b eq.not 0$ in a domain and $dim S_0 \/ \( b \) lt.eq r - 1$. A minimal prime $frak(q)$ over $\( x_2 \, dots.h \, x_r \)$ has height at most $r - 1$, so it is not maximal. It cannot contain $b$, since otherwise it would contain the displayed maximal-primary ideal. In $S_1 = S_0 \/ frak(q)$ the ideal $\( b \)$ is maximal-primary. The principal ideal theorem and nonmaximality of $frak(q)$ give $dim S_1 = 1$. These dimension and height steps use the Noetherian local dimension theorems #cite(label("Stacks")) Tags 00KQ, 0BBZ, and 00KW.
  The continuous map $bb(C) \[ \[ b \] \] arrow.r S_1$ is injective: a nonzero one-variable series is a power of $b$ times a unit. It is finite. Indeed $S_1 \/ \( b \)$ is a finite-dimensional complex vector space; lift a basis, and successively expand remainders in powers of $b$. Completeness, together with equivalence of the $\( b \)$-adic and maximal ideal topologies, expresses every element as a $bb(C) \[ \[ b \] \]$-linear combination of those finitely many lifts. The normalization of the complete discrete valuation ring $bb(C) \[ \[ b \] \]$ in the finite fraction-field extension $"Frac" \( S_1 \)$ is a finite complete discrete valuation ring. Its residue field is finite over $bb(C)$, hence equals $bb(C)$. These conclusions use the complete-DVR extension theorem, applicable because the fraction-field extension is finite and separable, and completeness of finite algebras #cite(label("Stacks")) Tags 09E8 and 0325. Choosing a uniformizer identifies the normalization with $bb(C) \[ \[ u \] \]$ as a $bb(C)$-algebra: subtract successive complex residue coefficients and use completeness #cite(label("Stacks")) Tag 0C0S(2). Since $S_1$ is integral over $bb(C) \[ \[ b \] \]$, it embeds in this normalization, locally and continuously. The resulting arc detects $b$.
  For the consequence, suppose the class of $P - P \( 0 \)$ in $B \/ I$ is nonzero. An arc as above detects it. If $v_j$ maps to $v_j \( u \) in \( u \)$, the formal chain rule gives
  $ frac(d, d u) P \( v \( u \) \) = sum_j \( partial_(v_j) P \) \( v \( u \) \) thin v'_j \( u \) = 0 . $
  In characteristic zero a one-variable series with zero derivative is constant. Its constant is $P \( 0 \)$, contradicting detection. ◻
]

#thm([Lemma 5.3.])[
  (Algebraic replacement of a formal primitive).  #emph[Let $A$ be the local ring at a complex point of an étale neighborhood of affine $n$-space, with coordinates $v$ centered at that point, and let $B = hat(A) = bb(C) \[ \[ v \] \]$. Let $K$ be any ideal of $A$. Suppose $P in B$ satisfies 
#[#set math.equation(numbering: n => "(5.5)")
 $ partial_(v_j) P in K B \, #h(2em) partial_(v_j) P in A + K^b B quad upright("for every ") j upright(" and every ") b gt.eq 1 . $ <alg:replacement-hyp>]

 For every $m gt.eq 1$ there is $P_m in A$ such that $P - P_m in K^m B$. No reducedness, primaryness, or equidimensionality condition is imposed on $K$.]
] <alg:replacement>

#proof[
  We first descend a finite Taylor tuple of $P$ along the reduced support of $K$ to the Taylor tuple of a single element of $A$. We then choose the length of that tuple so that a function with zero tuple belongs to $K^m$, including at embedded primary components.
  If $K = A$ there is nothing to prove. Otherwise put $I = sqrt(K)$. The reduced ring $A \/ I$ is essentially of finite type over $bb(C)$, hence excellent. Its completion is reduced: excellence makes the completion map regular, and reducedness ascends along a regular map. Also completion of the quotient identifies this completion with $B \/ I B$. These results apply to a Noetherian local ring here #cite(label("Stacks")) Tags 07QW, 07QU, 07GH, 07QK, and 00MA. Thus $I B$ is radical, and Lemma 32 gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ P equiv P \( 0 \) med \( mod med I B \) . $ <alg:constant-support>]
  The coordinate derivations extend uniquely to $A$, because the chart is étale, and they commute. For a positive integer $q$, let
  $ T_q = \( A \/ I \) \[ s_1 \, dots.h \, s_n \] \/ \( s_1 \, dots.h \, s_n \)^q \, #h(2em) tau_q \( f \) = sum_(\| alpha \| < q) frac(partial^alpha f, alpha !) s^alpha med \( mod med I \) . $
  The product rule says that $tau_q$ is a ring homomorphism; on the coordinate ring it is the shift $v mapsto v + s$. Give $T_q$ its $A$-module structure #emph[through $tau_q$]. Its filtration by $S = \( s_1 \, dots.h \, s_n \)$ has successive quotients that are finite sums of $A \/ I$ with their ordinary coefficient action. The shifted module $T_q$ is therefore finite over $A$.
  For clarity, its completion is the usual finite Taylor target with a shifted scalar action. If $frak(m)_A$ is the maximal ideal of $A$, put $J_q = tau_q \( frak(m)_A \) T_q$ and $H_q = frak(m)_A T_q$, where the latter uses the ordinary coefficient map. Since $J_q + S = H_q + S$ and $S^q = 0$, expansion of ideal powers gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ J_q^(thin N + q - 1) subset H_q^N \, #h(2em) H_q^(thin N + q - 1) subset J_q^N quad \( N gt.eq 1 \) . $ <alg:cofinal-topologies>]
  The identity of the underlying ring thus identifies the two completions, and yields
  #[#set math.equation(numbering: n => "(5.8)")
   $ T_q ⊗_(A \, tau_q) B tilde.equiv \( B \/ I B \) \[ s_1 \, dots.h \, s_n \] \/ \( s_1 \, dots.h \, s_n \)^q . $ <alg:taylor-completion>]
  The $B$-action on the right is still the Taylor-shifted action. Under this identification the completed map $hat(tau)_q$ is the formal Taylor map on $B$. Indeed $A$ is dense in $B$ and each of the finitely many derivatives in the formula is continuous, losing at most $\| alpha \|$ powers of the maximal ideal; (5.7) identifies that coefficientwise limit with the shifted-module limit.
  Every coefficient of $hat(tau)_q \( P \)$ has a representative in $A \/ I$. The constant coefficient is supplied by (5.6). For $1 lt.eq \| alpha \| < q$, choose $j$ with $alpha_j > 0$, put $beta = alpha - e_j$, and use (5.5) to choose $g_j in A$ with $partial_(v_j) P - g_j in K^q B$. The product rule gives the explicit loss estimate
  #[#set math.equation(numbering: n => "(5.9)")
   $ partial^beta \( K^q B \) subset K^(q - \| beta \|) B subset I B . $ <alg:derivative-loss>]
  Hence $partial^alpha P \/ alpha !$ is represented modulo $I B$ by $partial^beta g_j \/ alpha !$. These finitely many coefficients define one element $x in T_q$ whose image in (5.8) is $hat(tau)_q \( P \)$.
  It is essential to descend the image condition for this #emph[whole] tuple. Set $L_q = ker tau_q$, $U_q = "im" tau_q$, and $Q_q = T_q \/ U_q$, using the shifted module structure throughout. There are exact sequences of finite $A$-modules
  #[#set math.equation(numbering: n => "(5.10)")
   $ 0 & arrow.r L_q arrow.r A arrow.r U_q arrow.r 0 \,\
0 & arrow.r U_q arrow.r T_q arrow.r Q_q arrow.r 0 . $ <alg:descent-sequences>]
  Completion of finite modules is exact and agrees with tensoring by $B$; $A arrow.r B$ is faithfully flat #cite(label("Stacks")) Tags 00MA–00MC. The class of $x$ in $Q_q$ becomes zero after this tensor product, so it was zero already. Thus $x = tau_q \( P_q \)$ for a single element $P_q in A$. Exactness of the first sequence additionally gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ ker hat(tau)_q = L_q B \, #h(2em) P - P_q in L_q B . $ <alg:kernel-descent>]
  The whole Taylor tuple has now descended to one algebraic primitive. It remains to ensure that equality of that tuple measures the required order along every component of the original ideal, including embedded components. We now choose $q$ so that $L_q subset K^m$. Take a finite primary decomposition
  $ K^m = ⋂_(lambda = 1)^h Q_lambda \, #h(2em) frak(p)_lambda = sqrt(Q_lambda) \, $
  including all embedded components. For each $lambda$, choose $N_lambda$ with $frak(p)_lambda^(N_lambda) subset Q_lambda$; this follows by taking powers of finitely many generators of the radical. For $f in L_q$ we have
  $ partial^alpha f in I subset frak(p)_lambda #h(2em) \( \| alpha \| < q \) . $
  The Zariski–Nagata differential-power theorem gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ f in frak(p)_lambda^(\( q \)) = frak(p)_lambda^q A_(frak(p)_lambda) ∩ A . $ <alg:differential-order>]
  Its hypotheses are satisfied at #emph[every] $frak(p)_lambda$: $A$ is essentially smooth over the characteristic-zero field $bb(C)$, and $kappa \( frak(p)_lambda \) \/ bb(C)$ is separable. The coordinate operators $partial^alpha \/ alpha !$ of order less than $q$ form an $A$-basis of the differential operators of that order, by the étale coordinate description. These are precisely the operators tested above; see #cite(label("DSGJ2020")) Theorem 3.6 and Lemma 2.3.
  Choose $q gt.eq max_lambda N_lambda$. Equation (5.12) then puts $f$ in $Q_lambda A_(frak(p)_lambda)$ for every $lambda$. A primary ideal contracts from localization at its radical:
  $ Q_lambda A_(frak(p)_lambda) ∩ A = Q_lambda \, $
  since $s f in Q_lambda$ with $s in.not frak(p)_lambda$ forces $f in Q_lambda$. Intersecting gives $L_q subset K^m$. Together with (5.11) this proves the lemma. ◻
]

#prodef([Remark 5.4.])[
  (Normal order and embedded components).  The differential test in (5.12) measures order in the normal directions at each prime $frak(p)$, including nonclosed primes. In the regular local ring $A_(frak(p))$ the normal cotangent space $frak(p) A_(frak(p)) \/ \( frak(p) A_(frak(p)) \)^2$ injects into $Omega_(A \/ bb(C)) ⊗_A kappa \( frak(p) \)$. The conormal sequence is injective here because smoothness and separability give its image dimension $"ht" frak(p)$, the dimension of that normal space #cite(label("Stacks")) Tags 00TT, 00NO, and 00TU. The coordinate derivations therefore span the dual normal directions over $kappa \( frak(p) \)$. A nonzero initial form of degree $j$ in the symmetric graded ring of $A_(frak(p))$ is detected by $j$ such directions: in characteristic zero a nonzero degree-$j$ polynomial has a nonzero $j$-fold polarized derivative. Lift their coefficients to $A_(frak(p))$ and expand the resulting composition of derivations. It is an $A_(frak(p))$-linear combination of coordinate derivatives of orders at most $j$. Thus the vanishing of all derivatives of orders less than $q$ rules out an initial degree $j < q$. This is the local normal-order content of (5.12); the possibly singular quotient $A \/ frak(p)$ at the original closed point causes no difficulty.
  The embedded components also affect the required Taylor order. For $A = bb(C) \[ x \, y \, z \]_(\( x \, y \, z \))$ and $K = \( x^2 \, x y \)$ one has
  $ sqrt(K) = \( x \) \, #h(2em) K^2 = \( x^4 \, x^3 y \, x^2 y^2 \) = \( x^2 \) ∩ \( x \, y \)^4 . $
  Here $L_q = \( x^q \)$. Taylor order $q = 4$ suffices for $K^2$, whereas $q = 2$ or $3$ does not. The second component is primary for the embedded prime $\( x \, y \)$, whose residue field after localization is $bb(C) \( z \)$. The proof used neither a closed-point residue field at that prime nor an identification of global symbolic and ordinary powers.
] <alg:embedded-example>

=== 5.2 Preserving the equations and obtaining algebraic witnesses <preserving-the-equations-and-obtaining-algebraic-witnesses>

We apply the replacement lemma at ninth ideal order. Since each pulled-back wall ideal has cube in $frak(r)$, the resulting value error lies in $frak(r)^3$ and the derivative error lies in $frak(m) frak(r)$. These two containments preserve the square-value identity and, by Nakayama’s lemma, the entire gradient ideal. The following proposition also retains the two cubic laws and chooses algebraic coefficients witnessing all these memberships.

#thm([Proposition 5.5.])[
  #emph[For the data of Definition 31, one can replace each $P_i^(upright(o))$ by an algebraic germ $P_i$ with $P_i - P_i^(upright(o)) in frak(k)_i^9 B_i$. The $P_i$ still have order at least three. Define 
$ Psi \( a \, C \) = sum_i #scale(x: 120%, y: 120%)[\(] P_i \( a_i \, C_i^(+) \) - P_i \( 0 \, C_i^(-) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) p_i \( y_i \) = partial_(a_(i \, 1)) P_i \( 0 \, y_i \) \, $

 and, as columns and scalars in $B_X$, set 
$ v = \( partial_C Psi \) \( a \, Y \) \, #h(2em) g = Psi \( a \, Y \) \, #h(2em) nu_i = p_i \( Y_i^(-) \) . $

 Then $\( v \) = frak(r)$, $g in frak(r)^2$, and both types of triple products in (5.3) belong to $\( v \)$ with the new $p_i$. Moreover, there are algebraic germs $b_(j l)$ and row vectors $h_(+)^(i j k) \, h_(-)^(i j k)$, in one common local étale chart in $z$, such that 
#[#set math.equation(numbering: n => "(5.13)")
 $ g = v^(sans(T)) b v \, #h(2em) a_(i \, 1) a_(j \, 1) a_(k \, 1) = h_(+)^(i j k) v \, #h(2em) nu_i nu_j nu_k = h_(-)^(i j k) v . $ <alg:algebraic-witnesses>]

 Here $b$ is a $2 D$-by-$2 D$ matrix, with no symmetry requirement.]
] <alg:replacement-preserves>

#proof[
  Apply Lemma 33 with $K = frak(k)_i$ and $m = 9$. Since $frak(k)_i subset frak(m)_i$, the replacement changes no terms of degree less than nine, in particular preserving cubic order. For $E_i = P_i - P_i^(upright(o))$, differentiate first in the wall variables and then substitute the original maps $phi.alt_i^plus.minus$. The product rule gives $partial E_i in frak(k)_i^8 B_i$, so
  #[#set math.equation(numbering: n => "(5.14)")
   $ phi.alt_i^(plus.minus *) E_i & in \( L_i^plus.minus \)^9 subset frak(r)^3 \,\
phi.alt_i^(plus.minus *) \( partial E_i \) & in \( L_i^plus.minus \)^8 subset frak(r)^2 frak(m)^2 subset frak(m) frak(r) . $ <alg:ninth-order-estimates>]
  The middle containment uses $\( L_i^plus.minus \)^3 subset frak(r)$ and $L_i^plus.minus subset frak(m)$, not an estimate for a derivative of a pulled-back function. The value estimate preserves $g in frak(r)^2$. If $v^(upright(o)) = \( partial_C Psi^(upright(o)) \) \( a \, Y \)$, then $v - v^(upright(o)) in \( frak(m) frak(r) \)^(2 D)$. Thus $\( v \) subset frak(r)$ and $frak(r) = \( v \) + frak(m) frak(r)$. Nakayama’s lemma applied to the finite $B_X$-module $frak(r) \/ \( v \)$ proves $\( v \) = frak(r)$.
  The positive triple products have not changed. For each negative factor, $nu_i - p_i^(upright(o)) \( Y_i^(-) \) in frak(r)$ by the same derivative estimate. Telescoping a product of three factors therefore preserves its membership in $frak(r) = \( v \)$, including repeated labels.
  All the new germs $P_i$, the original maps $Y_i^plus.minus$, their indicated derivatives, and their compositions are algebraic. Place the finitely many germs in $z$ in a common local étale ring $E$: pull back the wall presentations along the maps $\( a_i \, Y_i^(+) \)$ and $\( 0 \, Y_i^(-) \)$, take finite fiber products, and localize at the specified point. Then $hat(E) = B_X$. Faithful flatness contracts the ideals $\( v \)^2 B_X$ and $\( v \) B_X$ to $\( v \)^2 E$ and $\( v \) E$. Consequently the three membership assertions admit the coefficients in (5.13) in $E$. We use these algebraic coefficients, rather than any previously chosen formal witnesses. ◻
]

=== 5.3 One coefficient ring and a formal correction <one-coefficient-ring-and-a-formal-correction>

The replacement has produced algebraic witnesses for all the needed ideal memberships. We can therefore select finitely many defining equations and constants before choosing a coefficient ring. The next steps put their coefficients in one ring and correct the graph using only operations in that ring; this is what makes specialization possible.

#thm([Lemma 5.6.])[
  (Coefficients of finitely many algebraic germs).  #emph[Given finitely many algebraic germs in finitely many coordinate spaces over $bb(C)$, and finitely many specified nonzero complex constants, there is a finitely generated $bb(Z)$-subalgebra $R subset bb(C)$ containing every coefficient of those germs and the inverses of the specified constants.]
] <alg:finite-ring>

#proof[
  Use finite étale presentations, near the chosen points, of the form
  $ cal(F) \( x \, w \) = 0 \, #h(2em) w \( 0 \) = c \, #h(2em) J_0 = partial_w cal(F) \( 0 \, c \) \, quad det J_0 eq.not 0 . $
  Regular-function denominators can be included as additional variables by equations $r f \( x \, w \) = 1$. Adjoin to $bb(Z)$ the finitely many polynomial coefficients, the entries of $c$, the inverses of all the initial Jacobian determinants and denominator values, and the specified inverses. This defines a finitely generated subring $R$.
  Solve the equations by total degree in $x$. At each positive degree the unknown homogeneous coefficient vector is multiplied by the #emph[same] matrix $J_0$; the other terms are expressions in previously determined coefficients. The inverse $J_0^(- 1) = "adj" \( J_0 \) \/ det J_0$ already has entries in $R$. Induction therefore puts every coefficient in $R$. This procedure introduces no division by the degree or by a growing family of factorials. Apply it to all the finite presentations at once. ◻
]

We also need a remainder formula valid over a coefficient ring that need not contain $bb(Q)$.

#thm([Lemma 5.7.])[
  (Remainders without numerical denominators).  #emph[Let $R$ be a commutative ring and $Phi \( a \, C \) in \( a \, C \)^3 R \[ \[ a \, C \] \]$, where $C$ has $N$ entries. There is an $N$-by-$N$ matrix $H \( a \, C \, delta \)$ over $R \[ \[ a \, C \, delta \] \]$, with every entry in $\( a \, C \, delta \)$, such that 
#[#set math.equation(numbering: n => "(5.15)")
 $ Phi \( a \, C + delta \) = Phi \( a \, C \) + \( partial_C Phi \) \( a \, C \)^(sans(T)) delta + delta^(sans(T)) H \( a \, C \, delta \) delta . $ <alg:remainder-formula>]

 There is also a matrix $G \( a \, C \, delta \)$ with positive-order entries satisfying 
#[#set math.equation(numbering: n => "(5.16)")
 $ \( partial_C Phi \) \( a \, C + delta \) - \( partial_C Phi \) \( a \, C \) = G \( a \, C \, delta \) delta . $ <alg:gradient-difference>]

 Both constructions use only addition, multiplication, and integer binomial coefficients. The difference of any formal scalar function at $C + delta$ and $C$ similarly factors as a row times $delta$.]
] <alg:remainder>

#proof[
  Expand a monomial $c_(alpha beta) a^alpha C^beta$ by the binomial formula. After subtracting its constant and linear terms in $delta$, the remaining terms are
  $ c_(alpha beta) binom(beta, gamma) a^alpha C^(beta - gamma) delta^gamma \, #h(2em) \| gamma \| gt.eq 2 . $
  Choose two occurrences among the $delta$ factors by a fixed rule, allowing the same index twice, and assign the coefficient after removing those factors to the corresponding entry of $H$. The remaining total degree is $\| alpha \| + \| beta \| - 2 gt.eq 1$. Summing defines $H$ coefficientwise; each coefficient receives only finitely many contributions. The other assertions follow by applying the one-factor version of the same construction. For a first partial of $Phi$, of order at least two, its one-factor remainder has order at least one, giving the claim for $G$. ◻
]

#thm([Theorem 5.8.])[
  (Formal data after algebraic replacement).  #emph[The input in Definition 31 yields a finitely generated $bb(Z)$-subalgebra $R subset bb(C)$, separated potentials 
$ P_i in \( a_i \, y_i \)^3 R \[ \[ a_i \, y_i \] \] \, #h(2em) p_i \( y_i \) = partial_(a_(i \, 1)) P_i \( 0 \, y_i \) \,\
Psi \( a \, C \) = sum_i #scale(x: 120%, y: 120%)[\(] P_i \( a_i \, C_i^(+) \) - P_i \( 0 \, C_i^(-) \) #scale(x: 120%, y: 120%)[\)] \, $

 and a centered formal map $tilde(Y) \( a \, t \) in \( z \) R \[ \[ z \] \]^(2 D)$ with the same first-order part as the original $Y$. With $tilde(v) = \( partial_C Psi \) \( a \, tilde(Y) \)$, there are row vectors $tilde(h)_(+)^(i j k) \, tilde(h)_(-)^(i j k)$ over $R \[ \[ z \] \]$ such that, for every ordered triple of labels, 
#[#set math.equation(numbering: n => "(5.17)")
 $ Psi \( a \, tilde(Y) \) & = 0 \,\
a_(i \, 1) a_(j \, 1) a_(k \, 1) & = tilde(h)_(+)^(i j k) tilde(v) \,\
p_i \( tilde(Y)_i^(-) \) p_j \( tilde(Y)_j^(-) \) p_k \( tilde(Y)_k^(-) \) & = tilde(h)_(-)^(i j k) tilde(v) . $ <alg:seven>]

 The determinant $det \[ partial_t tilde(Y) \( 0 \, 0 \) med sigma partial_t tilde(Y) \( 0 \, 0 \) \]$ is a unit of $R$. In particular $tilde(Y) \( 0 \, t \)$ and $sigma tilde(Y) \( 0 \, t \)$ parametrize smooth formal submanifolds of the $C$-space with complementary tangent spaces. On both submanifolds $F \( C \) = Psi \( 0 \, C \)$ vanishes identically. The same ring $R$ contains the coefficients of the potentials, the corrected map, and all the displayed membership witnesses.]
] <alg:formal-data>

#proof[
  Start with Proposition 35. Apply Lemma 36 to the unspecialized wall germs $P_i$, all entries of $Y$, and all algebraic witnesses $b \, h_(+)^(i j k) \, h_(-)^(i j k)$ in (5.13). Include $Delta^(- 1)$ among the specified inverses. Partial differentiation multiplies coefficients by integers and centered substitution uses finite sums at each degree, so $Psi \, p_i \, v \, g \, nu_i$ also have coefficients in this one ring $R$. All identities in (5.13) hold in $R \[ \[ z \] \]$, since $R subset bb(C)$. Because $Psi$ has order at least three and $Y$ is centered, $v in \( z \)^2 R \[ \[ z \] \]^(2 D)$.
  Apply Lemma 37 to $Psi$, with $N = 2 D$, and look for
  $ tilde(Y) = Y + B v \, $
  where $B$ is an $N$-by-$N$ formal matrix. For $delta = B v$, (5.15) and $g = v^(sans(T)) b v$ give
  $ Psi \( a \, Y + B v \) = v^(sans(T)) #scale(x: 120%, y: 120%)[\(] b + B + B^(sans(T)) H \( a \, Y \, B v \) B #scale(x: 120%, y: 120%)[\)] v . $
  It suffices to solve the matrix equation
  #[#set math.equation(numbering: n => "(5.18)")
   $ B = - b - B^(sans(T)) H \( a \, Y \, B v \) B . $ <alg:matrix-recursion>]
  Here is the coefficient construction over $R$. Set $cal(T) \( B \) = - b - B^(sans(T)) H \( a \, Y \, B v \) B$. The entries of $H \( a \, Y \, B v \)$ lie in $\( z \)$ for every $B$, since $a \, Y \, B v$ are centered and $H$ has positive order. If $B - B'$ has entries in $\( z \)^n$, changing either outer matrix factor changes $B^(sans(T)) H \( a \, Y \, B v \) B$ only in $\( z \)^(n + 1)$. Changing the inner argument $B v$ changes it in $\( z \)^(n + 2)$ because $v in \( z \)^2$. Thus
  #[#set math.equation(numbering: n => "(5.19)")
   $ B - B' in \( z \)^n quad arrow.r.double quad cal(T) \( B \) - cal(T) \( B' \) in \( z \)^(n + 1) . $ <alg:contraction>]
  The constant coefficient is forced to be $B \( 0 \) = - b \( 0 \)$. For every higher degree the coefficient on the right of (5.18) depends only on previously determined coefficients of $B$ and on the already known coefficients of $b \, H \, Y \, v$. This determines a unique solution in $"Mat"_N \( R \[ \[ z \] \] \)$. Equivalently, iterate $cal(T)$ and use (5.19). The recursion uses only ring operations; there are no new numerical inverses. It proves the first identity in (5.17) exactly.
  We next transport the two triple laws to this corrected graph. Equation (5.16) gives
  #[#set math.equation(numbering: n => "(5.20)")
   $ tilde(v) = \( 1 + M \) v \, #h(2em) M = G \( a \, Y \, B v \) B in \( z \) "Mat"_N \( R \[ \[ z \] \] \) . $ <alg:gradient-transport>]
  Hence $A_1 = 1 + M$ is invertible over the same ring, with $A_1^(- 1) = sum_(n gt.eq 0) \( - M \)^n$. Let $tilde(nu)_i = p_i \( tilde(Y)_i^(-) \)$. The one-factor difference formula of Lemma 37, followed by projection of $B v$ to its $i$th negative block, gives a row $q_i in R \[ \[ z \] \]^(1 times N)$ satisfying
  #[#set math.equation(numbering: n => "(5.21)")
   $ tilde(nu)_i - nu_i = q_i v . $ <alg:negative-factor-transport>]
  For all ordered triples the exact telescoping formula reads
  $ tilde(nu)_i tilde(nu)_j tilde(nu)_k - nu_i nu_j nu_k = #scale(x: 120%, y: 120%)[\(] tilde(nu)_j tilde(nu)_k q_i + nu_i tilde(nu)_k q_j + nu_i nu_j q_k #scale(x: 120%, y: 120%)[\)] v . $
  Consequently the required witnesses can be chosen as
  #[#set math.equation(numbering: n => "(5.22)")
   $ tilde(h)_(+)^(i j k) & = h_(+)^(i j k) A_1^(- 1) \,\
tilde(h)_(-)^(i j k) & = #scale(x: 120%, y: 120%)[\(] h_(-)^(i j k) + tilde(nu)_j tilde(nu)_k q_i + nu_i tilde(nu)_k q_j + nu_i nu_j q_k #scale(x: 120%, y: 120%)[\)] A_1^(- 1) . $ <alg:witness-transport>]
  These identities also hold when labels coincide. All coefficients stay in $R$: the difference factorizations use integer coefficients, and centered substitution and the geometric inverse series involve only finitely many terms at each degree. This proves both remaining identities in (5.17).
  Finally $B v in \( z \)^2$, so the first-order part of $Y$ and its paired tangent determinant are unchanged. This determinant is a unit of $R$ by its choice. The map
  $ \( t \, u \) mapsto tilde(Y) \( 0 \, t \) + sigma J u $
  has invertible linear term $\[ J med sigma J \]$, and therefore has a formal inverse over $R$. To see coefficient control directly, solve for each homogeneous degree using this same invertible constant matrix. This identifies the first graph with the coordinate subspace $u = 0$; the swapped graph is treated identically. They have complementary tangent spaces. The value identity at $a = 0$ makes $F$ vanish on the first; $F \( sigma C \) = - F \( C \)$ makes it vanish on the second. ◻
]

#prodef([Remark 5.9.])[
  The correction changes the graph of evaluation, while retaining the separated formula for $Psi$. It may mix all graph variables, and no geometric realization of $tilde(Y)$ is required. The original end-deviation cube law is used only before correction. Afterwards, (5.20)–(5.22) prove the needed laws entirely within the common formal coefficient ring.
] <alg:formal-not-geometric>

=== 5.4 Specialization <specialization>

#thm([Corollary 5.10.])[
  (Formal data in large positive characteristic).  #emph[For every sufficiently large rational prime $ell$, the ring $R$ in Theorem 38 has a homomorphism to a finite field $𝕜$ of characteristic $ell$. Reducing every coefficient by such a homomorphism gives separated potentials of order at least three, the identities (5.17) with their witnesses, and the two complementary zero graphs over $𝕜$. In particular $ell$ can be chosen larger than any prescribed finite bound.]
] <alg:specialization>

#proof[
  Because $R subset bb(C)$, the finite type $bb(Q)$-algebra $R_(bb(Q)) = R ⊗_(bb(Z)) bb(Q)$ is nonzero. Choose a maximal ideal. The weak Nullstellensatz, or Zariski’s lemma, says that its residue field $L$ is a finite extension of $bb(Q)$. We obtain a homomorphism $R arrow.r L$. The images of the finitely many ring generators, including all designated inverses, lie in $cal(O)_L \[ 1 \/ N \]$ for some positive integer $N$: multiplying each algebraic number by a suitable nonzero integer makes it integral. Thus the homomorphism factors as
  $ R arrow.r cal(O)_L \[ 1 \/ N \] arrow.r cal(O)_L \/ frak(l) = 𝕜 $
  for any prime ideal $frak(l)$ above a rational prime $ell divides.not N$. The residue field is finite. Every designated determinant stays a unit, because its inverse is already in $R$.
  Coefficientwise reduction commutes with multiplication, centered substitution, and formal differentiation; each coefficient involves only a finite sum and differentiation multiplies by an integer. It therefore preserves every identity in (5.17), including the membership coefficients, and the unit tangent determinant. It also preserves the order-at-least-three condition and the separated formula for $Psi$. The formal inverse construction in the theorem reduces over the same ring, giving the claimed smooth zero graphs. Only the algebraic replacements and their subsequent formal recursions are reduced. The original complex Chern–Simons series, and all integration used to obtain them, are absent from this specialization step. ◻
]

== 6 A Frobenius–Koszul obstruction to the formal data <frob:section>

The obstruction in this section is an algebraic statement about formal power series. Its hypotheses include both ideal-membership laws: neither law follows here merely from the vanishing of the potential on a graph. The proof will take place in coordinate Frobenius quotients, with the ordinary differential on forms as well as the wedge Koszul differential.

#thm([Theorem 6.1.])[
  (Nonexistence of the formal data).  #emph[Let $𝕜$ be a field of prime characteristic $ell > 2$, and let $d gt.eq 5$. For $1 lt.eq i lt.eq d$, choose an integer $n_i gt.eq 0$, a tuple $a_i = \( a_(i \, 1) \, a_(i \, 2) \, a_(i \, 3) \)$ of variables, and a tuple $y_i$ of $n_i$ variables. Put $D = sum_i n_i$, write $a = \( a_1 \, dots.h \, a_d \)$, and let $C = \( C_i^(+) \, C_i^(-) \)_(i = 1)^d$ be $2 D$ variables, with $n_i$ variables in each indicated block. There do not exist series 
$ P_i in \( a_i \, y_i \)^3 𝕜 \[ \[ a_i \, y_i \] \] \, #h(2em) Y = \( Y_i^(+) \, Y_i^(-) \)_(i = 1)^d in \( a \, t \) 𝕜 \[ \[ a \, t \] \]^(2 D) \, #h(2em) t = \( t_1 \, dots.h \, t_D \) \, $

 having the following properties. Define 
#[#set math.equation(numbering: n => "(6.1)")
 $ Psi \( a \, C \) = sum_(i = 1)^d #scale(x: 120%, y: 120%)[\(] P_i \( a_i \, C_i^(+) \) - P_i \( 0 \, C_i^(-) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) p_i \( y_i \) = \( partial_(a_(i \, 1)) P_i \) \( 0 \, y_i \) \, $ <frob:separated>]

 and let $sigma$ interchange the $+$ and $-$ blocks for each $i$. All indicated derivatives are taken before substitution. First, the two linear maps 
$ A = partial_t Y \( 0 \, 0 \) \, #h(2em) sigma A : 𝕜^D arrow.r 𝕜^(2 D) $

 have complementary images and are injective, or equivalently the square matrix $\[ A med sigma A \]$ is invertible. Second, 
#[#set math.equation(numbering: n => "(6.2)")
 $ Psi \( a \, Y \( a \, t \) \) = 0 . $ <frob:graph-zero>]

 Finally, for every $i \, j \, k$ (including repetitions), both memberships 
#[#set math.equation(numbering: n => "(6.3)")
 $ a_(i \, 1) a_(j \, 1) a_(k \, 1) & in J_Y \,\
p_i \( Y_i^(-) \( a \, t \) \) p_j \( Y_j^(-) \( a \, t \) \) p_k \( Y_k^(-) \( a \, t \) \) & in J_Y \, #h(2em) J_Y = #scale(x: 120%, y: 120%)[\(] \( partial_(C_nu) Psi \) \( a \, Y \( a \, t \) \) #scale(x: 120%, y: 120%)[\)]_(nu = 1)^(2 D) $ <frob:memberships>]

 hold in $𝕜 \[ \[ a \, t \] \]$.]
] <frob:no-data>

Only distinct triples will be used in the proof. The formulation with all triples records the stronger input that is available. The field need not be perfect.

The proof has four stages. First the two complementary zero graphs give differential forms with nonzero residue pairing. The cubic law for the $p_i$ then selects a tensor class with three suitable positive blocks. Deforming those blocks over three square-zero parameters lifts that tensor to an actual cycle. Finally the cubic law for the $a_(i \, 1)$ makes the parameter product times the moving graph’s normal form a boundary. The resulting pairing forces a nonzero parameter product to vanish. The following subsections construct each form and primitive in the same finite coordinate complex.

=== 6.1 Forms, normal cycles, and residue <frob:forms-subsection>

Fix an ordering $C_1 \, dots.h \, C_(2 D)$, in block order $1^(+) \, 1^(-) \, 2^(+) \, 2^(-) \, dots.h \, d^(+) \, d^(-)$. Define

#[#set math.equation(numbering: n => "(6.4)")
 $ T = 𝕜 \[ \[ C \] \] \/ \( C_1^ell \, dots.h \, C_(2 D)^ell \) \, #h(2em) Omega^q = T ⊗_𝕜 and.big^q chevron.l upright(d) C_1 \, dots.h \, upright(d) C_(2 D) chevron.r . $ <frob:quotient>]

The coefficient monomials $C^e$ with $0 lt.eq e_nu < ell$ form a basis of $T$. The ordinary formal partial derivatives descend to $T$, since $partial_(C_mu) \( C_nu^ell \) = 0$. Consequently the usual differential $upright(d)$ is well-defined on $Omega$, satisfies $upright(d)^2 = 0$, and obeys the graded product rule. These are also the ordinary Kähler forms of $T$ over $𝕜$: the relations $C_nu^ell = 0$ impose no relations on the coordinate differentials.

For $F in 𝕜 \[ \[ C \] \]$ put

$ delta = upright(d) F and  \, #h(2em) H = H^(*) \( Omega \, delta \) . $

We have $delta^2 = 0$ and $upright(d) delta + delta upright(d) = 0$. Thus ordinary differentiation induces a degree-one differential $cal(D)$ on $H$: $cal(D) \[ omega \] = \[ upright(d) omega \]$. This differential must be distinguished from $delta$, whose cohomology defines $H$.

The finite coordinate calculation has a classical antecedent in the coordinate proof of Cartier’s theorem: the one-variable classes $C_nu^(ell - 1) upright(d) C_nu$ and their tensor products survive ordinary differentiation #cite(label("Katz1970")) Theorem 7.2 and (7.2.11)–(7.2.12). Here the additional differential $delta = upright(d) F and $ and the two graph membership laws will connect those forms to the obstruction. Their required properties are proved below.

Define $"Res"_C$ on $Omega$ by taking, in top form degree, the coefficient of $C_1^(ell - 1) dots.h.c C_(2 D)^(ell - 1)$ in the coefficient of $upright(d) C_1 and dots.h.c and upright(d) C_(2 D)$; it is zero in other degrees. Directly from the monomial basis,

#[#set math.equation(numbering: n => "(6.5)")
 $ "Res"_C \( upright(d) omega \) = 0 . $ <frob:residue-exact>]

Indeed a derivative producing exponent $ell - 1$ in its differentiated variable would have to differentiate exponent $ell$, whose coefficient is zero in characteristic $ell$; in the chosen basis no such monomial is present. If $eta$ is homogeneous and $delta zeta = 0$, then

#[#set math.equation(numbering: n => "(6.6)")
 $ \( delta eta \) and zeta = \( - 1 \)^(\| eta \|) eta and delta zeta = 0 . $ <frob:boundary-wedge>]

It follows that

$ chevron.l \[ omega \] \, \[ zeta \] chevron.r = "Res"_C \( omega and zeta \) $

is a well-defined pairing on Koszul cohomology. We require no assertion that this scalar is unchanged by a change of coordinates.

#thm([Lemma 6.2.])[
  (Normal cycles and restricted memberships).  #emph[Suppose that $Gamma$ is a formal smooth $D$-dimensional graph in the $C$ variables, centered at the origin, with $F \|_Gamma = 0$. Complete a parametrization to formal coordinates $\( t \, u \)$, with $Gamma$ given by $u_1 = dots.h.c = u_D = 0$. In $Omega$ its normal form 
#[#set math.equation(numbering: n => "(6.7)")
 $ gamma = (product_(b = 1)^D u_b^(ell - 1)) upright(d) u_1 and dots.h.c and upright(d) u_D $ <frob:normal-form>]

 is annihilated by the normal ideal $\( u \)$ and satisfies $upright(d) gamma = delta gamma = 0$. If an ambient function $g$ has a restricted expression 
#[#set math.equation(numbering: n => "(6.8)")
 $ g \|_Gamma = sum_(nu = 1)^(2 D) h_nu \( t \) \( partial_(C_nu) F \) \|_Gamma \, $ <frob:restricted-membership>]

 then $g gamma$ is a Koszul boundary. More precisely, lift $h_nu$ to $tilde(h)_nu \( C \)$ by the inverse tangential coordinates and let $iota_nu$ be contraction with $partial \/ partial C_nu$. Then 
#[#set math.equation(numbering: n => "(6.9)")
 $ g gamma = delta (sum_nu tilde(h)_nu iota_nu gamma) . $ <frob:primitive-general>]

 If two such graphs have complementary tangent spaces, their normal forms have nonzero residue pairing.]
] <frob:normal-cycle>

#proof[
  A centered formal coordinate change and its inverse preserve the coordinate Frobenius ideals. For a centered series $f \( z \) = sum_(e eq.not 0) c_e z^e$ in characteristic $ell$, the coefficientwise Frobenius identity gives
  $ f \( z \)^ell = sum_(e eq.not 0) c_e^ell z^(ell e) in \( z_1^ell \, dots.h \, z_(2 D)^ell \) . $
  Apply this to every component of each inverse coordinate map. Hence we may calculate in $𝕜 \[ \[ t \, u \] \] \/ \( t^ell \, u^ell \)$, where the notation means the separate $ell$th powers of all coordinates. Multiplication by $u_b$ annihilates (6.7). Its ordinary differential is zero because every term differentiating its coefficient repeats one of its normal differentials. Write $F \( t \, u \) in \( u \)$. The tangential coefficients of $upright(d) F$ belong to $\( u \)$, whereas each normal differential wedges to zero with the full normal volume. Therefore $delta gamma = 0$.
  The difference $g - sum_nu tilde(h)_nu partial_(C_nu) F$ lies in $\( u \)$ before truncation and continues to do so after truncation. The contraction identity in the original coordinates is the coefficient-linear extension of the exterior and interior product identity in #cite(label("Koszul1950")) Section 2, p. 72, (2.9):
  #[#set math.equation(numbering: n => "(6.10)")
   $ delta iota_nu + iota_nu delta = \( partial_(C_nu) F \) "id" . $ <frob:contraction>]
  Since $delta$ is linear over $T$, annihilation of $\( u \)$ and $delta gamma = 0$ prove (6.9). There are no derivatives of the coefficients $tilde(h)_nu$ in this calculation.
  For the last assertion let $u$ and $v$ be the respective normal coordinates. Complementarity of the tangent spaces says exactly that $\( u \, v \)$ has invertible linear part, so it too is a full coordinate system. The socle of $T$, namely the annihilator of its maximal ideal, is the one-dimensional space spanned by $C_1^(ell - 1) dots.h.c C_(2 D)^(ell - 1)$. This follows directly by multiplying a monomial expansion by each $C_nu$. The coordinate automorphism carries its nonzero socle generator to
  $ q = product_b u_b^(ell - 1) product_b v_b^(ell - 1) eq.not 0 . $
  The wedge of the two normal forms is $q J \( C \)$ times the original coordinate volume, where $J \( C \)$ is the unit Jacobian determinant of $\( u \, v \)$. Since $q$ is in the socle, $q J \( C \) = J \( 0 \) q eq.not 0$. Its residue is therefore nonzero. This proves nonvanishing in the fixed original coordinates without a coordinate-invariance formula for the residue. ◻
]

=== 6.2 A chain retraction and a tensor-kernel calculation <frob:linear-subsection>

The next two lemmas address the obstruction to deforming a Koszul cycle. For a single block, let $Q$ and $p$ be scalar functions in its Frobenius quotient, and write $delta = upright(d) Q and $. Replacing $Q$ by $Q + s p$ over $𝕜 \[ s \] \/ \( s^2 \)$ changes the differential to $delta + s thin upright(d) p and $. A $delta$-cycle $omega$ lifts to a cycle $omega + s xi$ precisely when

$ delta xi = - upright(d) p and omega . $

On the block Koszul cohomology let $S$ be multiplication by $p$ and let $cal(D)$ be induced by ordinary differentiation. The product rule gives $\[ cal(D) \, S \] = \[ upright(d) p and  \]$. For a class already in $N = ker S$, the lift condition is therefore $S cal(D) \[ omega \] = 0$: the classes we need belong to $K = N ∩ cal(D)^(- 1) N$. The cubic law will first express a class as a sum of tensors with enough factors in $N$. The lemmas below replace those factors by ones in $K$ through a homotopy for $cal(D)$, preserving the pairing with an ordinary-closed normal cycle.

#thm([Lemma 6.3.])[
  (Retraction with an explicit homotopy).  #emph[Let $\( V \, cal(D) \)$ be a finite-dimensional graded complex over a field, and let $S : V arrow.r V$ have degree zero. No relation between $S$ and $cal(D)$ is assumed. Set 
$ N = ker S \, #h(2em) K = N ∩ cal(D)^(- 1) N . $

 There are a degree-zero chain idempotent $r$ and a degree-minus-one map $h$ such that 
#[#set math.equation(numbering: n => "(6.11)")
 $ r \( N \) = K \, #h(2em) r \|_K = "id" \, #h(2em) 1 - r = cal(D) h + h cal(D) . $ <frob:retraction-identity>]

 The image of $r$ is not asserted to equal $K$.]
] <frob:retraction>

#proof[
  The subspace $K$ is a subcomplex: if $x in K$, then $cal(D) x in N$ and $cal(D)^2 x = 0 in N$. Choose a graded complement $N = K xor E$. If $e in E$ and $cal(D) e in N$, then $e in K$, hence $e = 0$. Thus $cal(D)$ is injective on $E$, and $cal(D) E ∩ N = 0$. In particular $K xor E xor cal(D) E$ is a graded direct sum. Also $E xor cal(D) E$ injects into $V \/ K$: if $e + cal(D) e' in K$, then $cal(D) e' in N$, so $e' = e = 0$.
  Take any graded vector-space complement $C'$ to that direct sum, and define
  $ h \( cal(D) e \) = e quad \( e in E \) \, #h(2em) h \|_(K xor E xor C') = 0 . $
  Set $Q = cal(D) h + h cal(D)$. The image of $cal(D) h$ lies in $cal(D) E$, and the image of $h cal(D)$ lies in $E$, even when $cal(D) C'$ has components in the other summands. Moreover $Q$ is the identity on $E$ and on $cal(D) E$, and is zero on $K$. Consequently $Q^2 = Q$. The equation $cal(D)^2 = 0$ gives
  $ cal(D) Q = cal(D) h cal(D) = Q cal(D) . $
  Now $r = 1 - Q$ has all the asserted properties. This calculation is why an arbitrary complement is allowed; an arbitrary vector-space projection by itself would not give a chain map. ◻
]

#thm([Lemma 6.4.])[
  (Joint kernels in a tensor product).  #emph[For finite-dimensional vector spaces $V_i$ and endomorphisms $S_i$, put $N_i = ker S_i$, and let $W$ be an additional tensor factor on which all $S_i$ act as the identity. On $V_1 ⊗ dots.h.c ⊗ V_d ⊗ W$ one has 
#[#set math.equation(numbering: n => "(6.12)")
 $ ⋂_(\| I \| = 3) ker (product_(i in I) S_i) = sum_(\| J \| gt.eq d - 2) (⨂_(i = 1)^d V_i \( J \)) ⊗ W \, #h(2em) V_i \( J \) = cases(delim: "{", N_i & i in J \,, V_i & i in.not J .) $ <frob:tensor-kernel-identity>]

 This also holds with additional passive factors interspersed in any fixed tensor order.]
] <frob:tensor-kernel>

#proof[
  Choose complements $V_i = N_i xor M_i$. The total tensor product is the direct sum of subspaces $V_A$, indexed by subsets $A subset { 1 \, dots.h \, d }$, using $M_i$ when $i in A$ and $N_i$ when $i in.not A$, together with the passive factor. Fix a triple $I$. The operator $S_I = product_(i in I) S_i$ kills $xor.big_(I subset.not A) V_A$. Its restriction to the complementary subspace, which has $M_i$ in every slot $i in I$ and unrestricted factors elsewhere, is injective: it is a tensor product of the injections $S_i \|_(M_i)$ and identity maps over a field. Thus
  $ ker S_I = xor.big_(I subset.not A) V_A . $
  Intersecting these coordinate direct sums over all triples leaves exactly $\| A \| lt.eq 2$, which is the right-hand side of (6.12). The images $S_i \( M_i \)$ may intersect $N_i$; this does not affect injectivity on the specified complementary #emph[domain] subspace. Passive factors have no effect on the argument. ◻
]

We shall also use the following explicit tensor homotopy. Suppose each graded complex $\( V_b \, cal(D)_b \)$ has $r_b \, h_b$ as in (6.11); identity maps and zero homotopies are allowed. With the usual signed tensor differential, put

#[#set math.equation(numbering: n => "(6.13)")
 $ R = ⨂_b r_b \, #h(2em) cal(H) = sum_b (⨂_(c < b) r_c) ⊗ h_b ⊗ (⨂_(c > b) 1) . $ <frob:tensor-homotopy>]

On a homogeneous tensor the $b$th summand in $cal(H)$ has sign $\( - 1 \)^(sum_(c < b) \| x_c \|)$. Since every $r_c$ is a degree-zero chain map, terms in which the differential acts in a slot other than $b$ cancel in $cal(D) cal(H) + cal(H) cal(D)$. The remaining terms give the telescoping identity

#[#set math.equation(numbering: n => "(6.14)")
 $ cal(D) cal(H) + cal(H) cal(D) = sum_b r_(< b) ⊗ \( 1 - r_b \) ⊗ 1_(> b) = 1 - R . $ <frob:tensor-homotopy-identity>]

=== 6.3 The special fiber and selection of a tensor <frob:special-fiber>

#proof[
  Suppose the stated data exist. If $D = 0$, the ideal $J_Y$ is zero, so the first membership in (6.3) already contradicts the nonzero monomial $a_(1 \, 1) a_(2 \, 1) a_(3 \, 1)$. We may assume $D > 0$. Set
  $ Q_i \( y_i \) = P_i \( 0 \, y_i \) \, #h(2em) F \( C \) = Psi \( 0 \, C \) = sum_i #scale(x: 120%, y: 120%)[\(] Q_i \( C_i^(+) \) - Q_i \( C_i^(-) \) #scale(x: 120%, y: 120%)[\)] \, $
  and use the complexes and residue in (6.4). The two graphs
  $ Gamma_(+) = Y \( 0 \, t \) \, #h(2em) Gamma_(-) = sigma Y \( 0 \, t \) $
  have complementary tangent spaces. They are smooth formal graphs because their tangent maps are injective and can be completed to invertible coordinate maps. The function $F$ vanishes on both: this follows from (6.2) and $F \( sigma C \) = - F \( C \)$.
  Choose once and for all a constant matrix $L$ whose columns complement the image of $A$, and use the inverse coordinates of
  #[#set math.equation(numbering: n => "(6.15)")
   $ C = Y \( 0 \, t \) + L u $ <frob:fixed-complement>]
  to define the normal cycle $alpha$ for $Gamma_(+)$. Choose any fixed ordered normal coordinates for $Gamma_(-)$ and define its normal cycle $beta$. Lemma 42 gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ delta alpha = delta beta = upright(d) alpha = upright(d) beta = 0 \, #h(2em) chevron.l \[ alpha \] \, \[ beta \] chevron.r eq.not 0 . $ <frob:initial-pair>]
  The second membership in (6.3), at $a = 0$, transfers to $Gamma_(-)$ as follows. Regard $sigma$ also as the permutation of scalar-coordinate indices. Differentiating $F \( sigma C \) = - F \( C \)$ gives
  $ \( partial_(C_nu) F \) \( Y \( 0 \, t \) \) = - \( partial_(C_(sigma \( nu \))) F \) \( sigma Y \( 0 \, t \) \) . $
  On $Gamma_(-)$, the positive block $C_i^(+)$ equals $Y_i^(-) \( 0 \, t \)$. Thus permuting the derivative entries and negating their witnesses turns that membership into
  $ #scale(x: 120%, y: 120%)[\(] p_i \( C_i^(+) \) p_j \( C_j^(+) \) p_k \( C_k^(+) \) #scale(x: 120%, y: 120%)[\)] \|_(Gamma_(-)) in #scale(x: 120%, y: 120%)[\(] \( partial_(C_nu) F \) \|_(Gamma_(-)) #scale(x: 120%, y: 120%)[\)]_nu . $
  The explicit primitive in Lemma 42 therefore proves
  #[#set math.equation(numbering: n => "(6.17)")
   $ p_i \( C_i^(+) \) p_j \( C_j^(+) \) p_k \( C_k^(+) \) \[ beta \] = 0 quad upright("in ") H $ <frob:triple-annihilation>]
  for every distinct triple. This is an ambient Koszul boundary statement, not just an identity after restriction to the graph.
  The separated expression for $F$ identifies $\( Omega \, delta \)$ with the graded tensor product of the $2 d$ block complexes. A positive block has differential $delta_i^(+) = upright(d) Q_i and $ and a negative block has differential $delta_i^(-) = - upright(d) Q_i and $. Under the identification a tensor is sent to the wedge of its factors in the fixed block order; both the Koszul differential and ordinary differentiation carry the sign $\( - 1 \)^(sum_(c < b) \| x_c \|)$ in block $b$. Consequently there is a natural identification
  #[#set math.equation(numbering: n => "(6.18)")
   $ H = ⨂_(i = 1)^d \( H_i^(+) ⊗ H_i^(-) \) \, #h(2em) cal(D) = upright("the signed tensor differential induced by ordinary ") upright(d)_i^plus.minus . $ <frob:kunnet>]
  For completeness, the cohomology assertion uses only field linear algebra: split each finite complex into representatives for its cohomology with zero differential and pairs $e \, delta e$. Each pair is contractible, and its tensor product with any complex is contractible by the signed tensor homotopy. The remaining tensor of the representative spaces is precisely the displayed cohomology. Naturality of the tensor cycle map gives the asserted ordinary differential on it.
  On $H_i^(+)$ let $S_i$ be multiplication by $p_i$, and let $cal(D)_i$ be the differential induced by ordinary differentiation. Define
  #[#set math.equation(numbering: n => "(6.19)")
   $ N_i = ker S_i \, #h(2em) K_i = N_i ∩ cal(D)_i^(- 1) N_i . $ <frob:ki>]
  Multiplication by $p_i$ commutes with the block Koszul differential. The degree-one operator $upright(d) p_i and $ anticommutes with that differential and induces on $H_i^(+)$ the commutator
  #[#set math.equation(numbering: n => "(6.20)")
   $ \[ cal(D)_i \, S_i \] = cal(D)_i S_i - S_i cal(D)_i = \[ upright(d) p_i and  \] . $ <frob:commutator>]
  This operator vanishes on $K_i$, since both $S_i x$ and $S_i cal(D)_i x$ vanish there.
  Let $z = \[ beta \]$. By (6.17) and Lemma 44, $z$ lies in the sum of tensor subspaces having at least $d - 2$ positive slots in $N_i$. Apply the retractions of Lemma 43 in all positive slots, taking $r_b = 1$ and $h_b = 0$ in negative slots. Their tensor $R$ sends that sum into the analogous sum with at least $d - 2$ slots in $K_i$. Since $cal(D) z = 0$, (6.14) gives
  $ R z - z = - cal(D) \( cal(H) z \) . $
  Pairing with $\[ alpha \]$ kills this ordinary-differential boundary. Indeed if $omega$ is any Koszul-cycle representative of a class, then $upright(d) alpha = 0$ and (6.5) imply
  #[#set math.equation(numbering: n => "(6.21)")
   $ "Res"_C \( alpha and upright(d) omega \) = \( - 1 \)^D "Res"_C #scale(x: 120%, y: 120%)[\(] upright(d) \( alpha and omega \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <frob:pair-homotopy>]
  Changing representatives adds a Koszul boundary, which pairs to zero by (6.6); ordinary differentiation of a changed representative adds another Koszul boundary by anticommutation. Thus (6.21) is genuinely an identity on $H$. It follows from (6.16) that $chevron.l \[ alpha \] \, R z chevron.r eq.not 0$.
  All subspaces and complements used above are graded, and $R z$ has form degree $D$. Express it as a finite sum of homogeneous simple tensors in the indicated sum of subspaces, keeping only total degree $D$. One such tensor, denoted $k$, satisfies
  #[#set math.equation(numbering: n => "(6.22)")
   $ chevron.l \[ alpha \] \, k chevron.r eq.not 0 $ <frob:selected-pair>]
  and has at least $d - 2 gt.eq 3$ positive factors in their $K_i$. Fix three of these labels $i_1 \, i_2 \, i_3$. The selected tensor need not be $cal(D)$-closed. What will be used is that each of its homogeneous factors has a homogeneous cycle representative for its #emph[block Koszul differential].
  === 6.4 Three parameters and all mixed terms <frob:three-parameters>
  Set
  #[#set math.equation(numbering: n => "(6.23)")
   $ B = 𝕜 \[ s_1 \, s_2 \, s_3 \] \/ \( s_1^2 \, s_2^2 \, s_3^2 \) \, #h(2em) frak(m)_B = \( s_1 \, s_2 \, s_3 \) \, #h(2em) w = s_1 s_2 s_3 . $ <frob:base>]
  Substitute $a_(i_r \, 1) = s_r$ for $r = 1 \, 2 \, 3$, and set all other slope coordinates to zero. Write this substitution as $a = a \( s \)$. By the separated form (6.1) and $s_r^2 = 0$, exactly
  #[#set math.equation(numbering: n => "(6.24)")
   $ W_s \( C \) := Psi \( a \( s \) \, C \) = F \( C \) + sum_(r = 1)^3 s_r p_(i_r) \( C_(i_r)^(+) \) . $ <frob:deformed-potential>]
  There are no mixed-parameter terms in this potential: each summand $P_i$ involves only its own $a_i$. Products of distinct parameters do survive in $B$ and must be retained in a cycle lift.
  From now on the common ambient complex is
  #[#set math.equation(numbering: n => "(6.25)")
   $ T_B = B \[ \[ C \] \] \/ \( C_nu^ell \)_nu \, #h(2em) Omega_B = T_B ⊗_B and.big_B chevron.l upright(d) C_nu chevron.r \, #h(2em) delta_s = upright(d)_C W_s and  . $ <frob:common-complex>]
  Every differential and contraction here is relative to $B$; in particular $upright(d)_C s_r = 0$. Choose homogeneous block-cycle representatives $x_b$ for every factor of $k$. In each selected positive slot $i_r$, (6.20) and membership in $K_(i_r)$ give a homogeneous form $y_(i_r)$ of the same degree as $x_(i_r)$ with
  #[#set math.equation(numbering: n => "(6.26)")
   $ delta_(i_r)^(+) y_(i_r) = - upright(d) p_(i_r) and x_(i_r) . $ <frob:factor-correction>]
  Thus
  $ \( delta_(i_r)^(+) + s_r upright(d) p_(i_r) and  \) \( x_(i_r) + s_r y_(i_r) \) = 0 . $
  Use $x_(i_r) + s_r y_(i_r)$ in the selected slots and $x_b$ in every other slot, and take their ordered tensor product. This defines $kappa_s in Omega_B^D$. To display every term, suppress the unchanged factors while retaining them in their original positions in the actual tensor, and abbreviate the three selected pairs by $x_r \, y_r$:
  #[#set math.equation(numbering: n => "(6.27)")
   $ kappa_s =  & x_1 ⊗ x_2 ⊗ x_3 + s_1 y_1 ⊗ x_2 ⊗ x_3 + s_2 x_1 ⊗ y_2 ⊗ x_3 + s_3 x_1 ⊗ x_2 ⊗ y_3\
 & + s_1 s_2 y_1 ⊗ y_2 ⊗ x_3 + s_1 s_3 y_1 ⊗ x_2 ⊗ y_3 + s_2 s_3 x_1 ⊗ y_2 ⊗ y_3 + s_1 s_2 s_3 y_1 ⊗ y_2 ⊗ y_3 . $ <frob:eight-terms>]
  No permutation of the actual factors is being made in this display. If $kappa_A$ denotes the coefficient of $s_A = product_(r in A) s_r$, the coefficient of $s_A$ in $delta_s kappa_s$ is
  #[#set math.equation(numbering: n => "(6.28)")
   $ delta kappa_A + sum_(r in A) \( upright(d) p_(i_r) and  \)_(i_r) kappa_(A \\ { r }) \, $ <frob:lift-coefficients>]
  where slot operators carry the usual preceding-degree sign. In its first term only the differentials acting on a $y_(i_r)$ can be nonzero; by (6.26) these cancel exactly the corresponding terms in the sum. Their signs agree because $y_(i_r)$ and $x_(i_r)$ have the same form degree. An additional perturbation in a slot already carrying $s_r$ is zero by $s_r^2 = 0$. This proves the cancellation for every subset $A$, including $\| A \| = 2$ and $\| A \| = 3$. We have therefore constructed an actual cycle with the required specified reduction:
  #[#set math.equation(numbering: n => "(6.29)")
   $ delta_s kappa_s = 0 \, #h(2em) kappa_s med mod med frak(m)_B = kappa_0 \, #h(2em) \[ kappa_0 \] = k . $ <frob:lifted-cycle>]
  === 6.5 The moving graph in the same coordinate quotient <frob:moving-graph>
  Keep the exact matrix $L$ and ordering used to define $alpha$ in (6.15). Consider
  #[#set math.equation(numbering: n => "(6.30)")
   $ Theta_s \( t \, u \) = Y \( a \( s \) \, t \) + L u . $ <frob:moving-coordinate-map>]
  This has a formal inverse over $B$ despite its possible nonzero nilpotent constant term in the $C$ variables. To see this without assuming that it is centered in those variables, first regard $s_1 \, s_2 \, s_3$ as unrestricted formal variables over $𝕜$. The augmented map
  $ \( s \, t \, u \) mapsto \( s \, Y \( a \( s \) \, t \) + L u \) $
  is centered at the full origin and has invertible Jacobian: its diagonal blocks are the identity in $s$ and $\[ A med L \]$. The formal inverse function construction, solving each homogeneous degree using this invertible linear matrix, supplies an inverse fixing $s$. It descends modulo $\( s_1^2 \, s_2^2 \, s_3^2 \)$. The resulting maps are continuous in the $\( frak(m)_B \, C \)$-adic and $\( frak(m)_B \, t \, u \)$-adic topologies. Since $frak(m)_B^4 = 0$, these topologies are equivalent to the respective coordinate-adic topologies. Write the inverse coordinates as
  $ \( t \, u \) = \( T_s \( C \) \, U_s \( C \) \) . $
  Their $C$-constant terms belong to $frak(m)_B$, because the reduced inverse at $s = 0$ is centered.
  Every $b in frak(m)_B$ has $b^ell = 0$. Indeed write it as a $𝕜$-linear combination of nonempty squarefree monomials in the $s_r$ and apply Frobenius; the $ell$th power of each monomial contains a factor $s_r^2$. Thus for any component of either the forward or the inverse coordinate map, written as $f \( z \) = b + sum_(e eq.not 0) c_e z^e$, we have
  #[#set math.equation(numbering: n => "(6.31)")
   $ f \( z \)^ell = b^ell + sum_(e eq.not 0) c_e^ell z^(ell e) in \( z_1^ell \, dots.h \, z_(2 D)^ell \) . $ <frob:both-directions>]
  The two already inverse formal maps therefore induce inverse isomorphisms
  #[#set math.equation(numbering: n => "(6.32)")
   $ B \[ \[ C \] \] \/ \( C_nu^ell \)_nu tilde.eq B \[ \[ t \, u \] \] \/ \( t_1^ell \, dots.h \, t_D^ell \, u_1^ell \, dots.h \, u_D^ell \) . $ <frob:translated-quotient>]
  This argument checks the constant shifts and every nonlinear term in both directions. It uses the actual base $B$, not an assertion about arbitrary nilpotent rings. Relative forms and their ordinary differentials transport across the isomorphism; all the displayed Frobenius relations have zero relative differential.
  Define the moving normal form in the original coordinates by
  #[#set math.equation(numbering: n => "(6.33)")
   $ alpha_s = (product_(b = 1)^D U_(s \, b) \( C \)^(ell - 1)) upright(d)_C U_(s \, 1) \( C \) and dots.h.c and upright(d)_C U_(s \, D) \( C \) in Omega_B^D . $ <frob:moving-normal>]
  The graph identity (6.2) says $W_s \( Theta_s \( t \, 0 \) \) = 0$, so $W_s compose Theta_s in \( u \)$. The calculation of Lemma 42, now over $B$, gives
  #[#set math.equation(numbering: n => "(6.34)")
   $ \( U_s \) alpha_s = 0 \, #h(2em) upright(d)_C alpha_s = delta_s alpha_s = 0 . $ <frob:moving-normal-identities>]
  Inversion of the augmented formal coordinate map commutes with reduction modulo $frak(m)_B$, by uniqueness of the inverse. Relative differentiation also commutes with reduction. Because the same $L$ and the same normal-coordinate order were retained, this gives the precise equality
  #[#set math.equation(numbering: n => "(6.35)")
   $ alpha_s med mod med frak(m)_B = alpha . $ <frob:alpha-reduction>]
  It is the originally chosen form, with its original Jacobian factors.
  === 6.6 An ambient primitive and a unit residue <frob:contradiction>
  Use the first membership in (6.3) for the selected triple and substitute $a = a \( s \)$. There are $h_nu \( s \, t \) in B \[ \[ t \] \]$ with
  #[#set math.equation(numbering: n => "(6.36)")
   $ w = sum_(nu = 1)^(2 D) h_nu \( s \, t \) \( partial_(C_nu) W_s \) \( Y \( a \( s \) \, t \) \) . $ <frob:w-restricted>]
  Lift the witnesses to the ambient formal ring by $tilde(h)_nu \( s \, C \) = h_nu \( s \, T_s \( C \) \)$. Before Frobenius truncation, subtraction of the $u = 0$ value in adapted coordinates gives
  #[#set math.equation(numbering: n => "(6.37)")
   $ w - sum_nu tilde(h)_nu \( s \, C \) partial_(C_nu) W_s \( C \) in \( U_(s \, 1) \, dots.h \, U_(s \, D) \) . $ <frob:w-discrepancy>]
  It remains true after truncation. In the adapted quotient the kernel of evaluation $u = 0$ is exactly $\( u \)$, as the monomial basis shows. That evaluation is legitimate in the original quotient by (6.32); formal partial differentiation is legitimate there because derivatives of $C_nu^ell$ vanish.
  Let $iota_nu$ now be the original $C$-coordinate contraction on $Omega_B$. The relative version of (6.10) reads
  $ delta_s iota_nu + iota_nu delta_s = \( partial_(C_nu) W_s \) "id" . $
  Consequently the explicit ambient form
  #[#set math.equation(numbering: n => "(6.38)")
   $ eta_s = sum_(nu = 1)^(2 D) tilde(h)_nu iota_nu alpha_s in Omega_B^(D - 1) quad upright("satisfies") quad delta_s eta_s = w alpha_s . $ <frob:w-primitive>]
  Here (6.37) is killed by (6.34). Again no derivatives of the witnesses appear, because $delta_s$ is coefficient-linear wedge multiplication. This boundary identity holds in precisely the same complex (6.25) as (6.29).
  Extend $"Res"_C$ to $Omega_B$ by the identical original coordinate-coefficient rule, now $B$-linearly. Its reduction modulo $frak(m)_B$ is the previous residue. By (6.35), (6.29), and (6.22), the scalar
  $ b_s = "Res"_C \( alpha_s and kappa_s \) $
  has reduction
  #[#set math.equation(numbering: n => "(6.39)")
   $ b_0 = "Res"_C \( alpha and kappa_0 \) = chevron.l \[ alpha \] \, k chevron.r eq.not 0 . $ <frob:unit-reduction>]
  Hence $b_s$ is a unit in $B$. Explicitly, if $b_s = b_0 + n$ with $n in frak(m)_B$, then
  $ b_s^(- 1) = b_0^(- 1) sum_(q = 0)^3 \( - n \/ b_0 \)^q . $
  On the other hand the exact wedge identity
  $ \( delta_s eta_s \) and kappa_s = \( - 1 \)^(D - 1) eta_s and delta_s kappa_s = 0 $
  and (6.38) give
  $ 0 = "Res"_C \( \( delta_s eta_s \) and kappa_s \) = w b_s . $
  Multiplication by $b_s^(- 1)$ forces $w = 0$, but the eight squarefree monomials in $s_1 \, s_2 \, s_3$ form a $𝕜$-basis of $B$, and $w = s_1 s_2 s_3$ is one of them. This is the contradiction. ◻
]

The contradiction takes place entirely in the finite coefficient ring $B$ and the complex $Omega_B$. In particular, no flatness of the deformed Koszul cohomology is required. The order-three hypothesis on the potentials records the input of Section 5; the proof above uses only separation, the zero-graph identity, complementary tangents, and the two cubic membership laws.

== 7 Proof of the main theorem <sec:conclusion>

#proof[
  Choose $d = 5$ in Proposition 11. This gives a compact connected oriented smooth manifold $M$, the proper disc maps $f_r$, and the individually embedded framed spheres $g_r$. Corollary 9 proves (1.2); reindex the finite set $cal(R)$ by $1 \, dots.h \, k$.
  Suppose the prescribed boundary link bounded pairwise disjoint locally flat discs. Proposition 11 would then give the walls and complementary region. Their deformation and connection data, summarized in Corollary 30, satisfy Definition 31.
  Theorem 38 replaces the potentials and corrects their common evaluation graph. Its output retains the separated potentials, the complementary tangent spaces, and witnesses for both cubic gradient-ideal memberships, while making the total potential vanish exactly on the graph. Corollary 40 preserves all these properties over a finite field of characteristic $ell > 2$. They are precisely the hypotheses excluded, for $d = 5$, by Theorem 41. This contradiction proves the result. ◻
]

The construction of the walls uses the actual images of the prospective embedded discs and imposes only their prescribed boundary condition. The contradiction therefore excludes every such boundary filling, regardless of its relative homotopy classes or normal framings.


#bibliography("refs.bib", style: "ieee", title: [References])
