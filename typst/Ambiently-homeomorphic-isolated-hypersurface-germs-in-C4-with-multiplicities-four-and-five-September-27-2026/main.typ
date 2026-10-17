#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 65.2pt, y: 65.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Ambiently homeomorphic isolated hypersurface germs in $bb(C)^4$ with multiplicities four and five]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

Let $f in bb(C) { z_1 \, dots.h \, z_N }$ be a nonzero convergent power series with $f \( 0 \) = 0$. The hypersurface germ $V \( f \)$ is #emph[reduced] when $f$ has no repeated irreducible factor. Its #emph[multiplicity] is $"ord"_0 f$, the least total degree of a nonzero term of $f$. Two hypersurface germs are #emph[ambiently homeomorphic] if a homeomorphism between neighborhoods of the origin, fixing the origin, takes one zero set onto the other. Equivalently, their ambient pair germs $\( bb(C)^N \, V \( f \) \, 0 \)$ are homeomorphic.

Zariski’s multiplicity question asks whether this embedded topological germ determines multiplicity. He posed the question explicitly in 1971 #cite(label("Zariski1971")), following his work on the topology and equisingularity of plane curves #cite(label("Zariski1932")) #cite(label("Zariski1965")). In that classical setting, the embedded topology determines the characteristic data of the branches and their mutual intersection numbers, and hence the multiplicity; see also the proof of #cite(label("KoikeParusinski2010")) Theorem 3.1. The higher-dimensional question asks whether this relation between an equation’s lowest degree and its embedded topology persists.

For an isolated critical point, Milnor’s fibration gives a way to study that topology through the #emph[link] $V \( f \) ∩ S_epsilon^(2 N - 1)$ on a sufficiently small sphere and the associated open book, whose complement fibration is $f \/ \| f \|$ #cite(label("Milnor1968")). We answer Zariski’s question negatively in four complex variables.

#thm([Theorem 1.1.])[
  #emph[There are reduced convergent holomorphic function germs $f_4 \, f_5 : \( bb(C)^4 \, 0 \) arrow.r \( bb(C) \, 0 \)$, each with an isolated critical point at the origin, such that 
$ "ord"_0 f_4 = 4 \, #h(2em) "ord"_0 f_5 = 5 \, $

 and a homeomorphism germ of ambient pairs 
$ \( bb(C)^4 \, V \( f_4 \) \, 0 \) #h(0.27778em) tilde.equiv #h(0.27778em) \( bb(C)^4 \, V \( f_5 \) \, 0 \) . $

]
] <thm:main>

The Milnor open book has a compact page whose middle-dimensional cycles carry an integral Seifert form: it records the linking of a cycle on a reference page with a cycle transported to a positive neighboring page. For the open books on $S^7$ used here, a classification theorem turns a congruence of these integral forms into an equivalence of the embedded links. The proof is therefore organized around obtaining that integral congruence while retaining the different orders of the equations.

=== Context and predecessors <context-and-predecessors>

A major line of work concerns multiplicity within a deformation. The Milnor number $mu$ is the dimension of the local algebra defined by the first derivatives; for a convergent isolated germ it is also the rank of the middle homology of the Milnor page. Greuel and O’Shea independently proved equimultiplicity for $mu$-constant deformations of an isolated quasihomogeneous singularity #cite(label("Greuel1986")) #cite(label("OShea1987")). Fernández de Bobadilla and Pełka proved the general family theorem: every coefficientwise continuous path of formal power series with finite constant Milnor number has constant multiplicity #cite(label("BobadillaPelka2024")) Theorem 1.1. The germs of Theorem 1 therefore cannot be endpoints of such a path.

The distinction between a family and an arbitrary pair is substantial. Fernández de Bobadilla and Pełka’s Example 8.6 gives a four-variable comparison: double suspension of Du Bois–Michel plane curves with isometric integral Seifert forms yields topologically equivalent germs of equal multiplicity two, with no connecting $mu$-constant family #cite(label("BobadillaPelka2024")) Example 8.6. Du Bois and Michel’s plane curves have different embedded types despite their isometric forms #cite(label("DuBoisMichel1994")).

Another positive result retains geometric information beyond the smooth embedded link. McLean proved that two isolated polynomial singularities with embedded contactomorphic links have equal multiplicity #cite(label("McLean2019")) Theorem 1.1: the ambient sphere map must preserve the natural contact structures as well as the links. His Floer-theoretic characterization of multiplicity is a starting point for the family theorem of Fernández de Bobadilla and Pełka. The comparison in this paper uses smooth open books and their integral Seifert forms.

Koike and Parusiński proposed high-power suspension of plane curves with isometric Seifert forms as a route to topologically equivalent four-variable germs, asking whether their Fukui numerical sets—the sets of orders attained along analytic arcs—could differ. Their test of the Du Bois–Michel family gives equal sets #cite(label("KoikeParusinski2010")) Section 5, pp. 294–296. The smooth sum and tensor calculation underlying our construction belongs to the product theory of Sakamoto and Kauffman–Neumann #cite(label("Sakamoto1974")) #cite(label("KauffmanNeumann1977")).

A separate article by OpenAI, #emph[Ambiently homeomorphic isolated hypersurfaces of multiplicities two and three], constructs real-coefficient, positive-weight homogeneous polynomials in one finite complex dimension $N > 3$, divisible by eight, with orders two and three and homeomorphic ambient germs #cite(label("OpenAI2026Multiplicity23")) Theorem 1.1. That construction uses weighted homogeneous sums and spherical-link classification. The present four-variable construction uses convergent equations in analytic charts, a finite-map lattice calculation, and the nonspherical open-book theorem. The two arguments are independent, and their dimension, equation format, and exact multiplicities are distinct. The ambient three-variable case remains untreated by either result.

=== Proof strategy <proof-strategy>

The construction starts from the plane curve

$ h \( X \, T \) = T \( X - T^2 \) \( X - 2 T^2 \) $

and two degree-four finite maps $pi_0 \, pi_1$ obtained by projecting smooth graph surfaces to the $\( X \, T \)$-plane. Their pullbacks $d_i = h compose pi_i$ are six-branch plane curves of the same embedded type, so their integral plane Seifert forms are isometric. Thus the plane curves themselves already have the same topology, whereas Du Bois and Michel’s examples separate topology from the abstract Seifert form. Here the distinction lies in the maps to a common base curve, whose branch-degree patterns differ. We retain their induced homology maps separately from the abstract plane-form isometry. Section 2 proves that isometry and the separate pushforward and transfer identities.

A small rescaling of each graph equation smooths the cone $y z = w^4$. On each resulting smooth fourfold we use the function $h + w \( y^a + z^b \)$, with one common choice of $a \, b$. In Section 3, that choice is fixed before use; analytic elimination gives orders five and four, and the subsequent arc argument proves isolation. To compute the Milnor pages, we cut each into an inner smoothing region and an exterior inherited from the cone. An exterior cycle closes with an inner plane cycle only when their boundary residues agree modulo four. This condition depends on the pushforward for the particular graph map and is not determined by the abstract plane Seifert form. Sections 4–8 establish the condition by a signed Mayer–Vietoris cut and an oriented Bockstein calculation, then compute the two filling pairings in one convention. The quotient by the cone’s cyclic degree-four cover and its signed integral gluing are established in this tube calculation. The resulting lattice and form belong to the actual local Milnor page, as required for the link theorem.

Two boundary directions of the cone page then give different splittings of this integral lattice. Their coprime indices make the associated rational maps integral at complementary sets of primes, including the dyadic prime. Section 9 compares those maps on the relevant quadratic and Hermitian eigenspaces, lifts their discrepancy to the spin and special unitary groups, and checks the real and lattice-stabilizer hypotheses for strong approximation #cite(label("Platonov1969")) #cite(label("Platonov1970")) #cite(label("Rapinchuk2014")) Theorem 2.3. This produces one integral Seifert-form congruence.

Finally, Kato’s classification of simple spinnable structures on $S^7$ applies to these Milnor open books without requiring their bindings to be homotopy spheres #cite(label("Kato1974")) Theorem B. Kato credits Durfee’s independent work #cite(label("Durfee1974")); Saeki explains the singularity-facing formulation #cite(label("Saeki1999")) Definition 2.1 and pp. 698–699. After the page and orientation hypotheses are checked, the integral congruence gives an equivalence of embedded links. The analytic ambient-pair cone theorem #cite(label("Massey2015LeCycles")) Theorem 1.4 extends it to the ambient pair germs; this is the analytic form of the conical construction used by Milnor #cite(label("Milnor1968")) Section 2.

== 2 Plane curves and the finite maps <sec:plane-cover>

We first construct two finite maps to a common plane. Their pulled-back curves will supply isometric integral Seifert forms and the monodromy sectors needed later. We also retain the homology maps induced by each projection, because those maps determine the integral boundary condition in the fourfold construction.

Set

$ h \( X \, T \) & = T \( X - T^2 \) \( X - 2 T^2 \) \,\
q_1 \( u \, w \) & = \( u - w - w^8 \) \( u - w - 2 w^8 \) \( u - w^2 \) \,\
q_2 \( u \, w \) & = q_1 \( u \, w \) - u^2 . $

We use two graph maps to the $\( X \, T \)$-plane:

$ pi_0 \( u \, w \) & = #scale(x: 120%, y: 120%)[\(] phi \( u \, w \) \, u #scale(x: 120%, y: 120%)[\)] \, & phi \( u \, w \) & = u^2 + q_1 \( u \, w \) \,\
pi_1 \( x \, w \) & = #scale(x: 120%, y: 120%)[\(] x \, psi \( x \, w \) #scale(x: 120%, y: 120%)[\)] \, & psi \( x \, w \) & = u \( u - w^2 \) q_2 \( u \, w \) \, quad u = x + w . $

Write $d_i = h compose pi_i$. For $g in { h \, d_0 \, d_1 }$, let $F_g$ denote the chosen sufficiently small compact oriented Milnor page of $g$. Set $cal(H) = F_h$, $cal(D)_i = F_(d_i)$, and put $H = H_1 \( cal(H) \; bb(Z) \)$, $D_i = H_1 \( cal(D)_i \; bb(Z) \)$. Throughout, $s \( a \, b \)$ is the ordered intersection of a filling of $a$ on a reference page with a filling of the positive neighboring-page transport of $b$, in the acyclic total Milnor tube.

#thm([Lemma 2.1.])[
  (Plane data).  #emph[Each $pi_i$ is a finite map germ of degree four. The curves $d_i = 0$ are reduced, have isolated singularities at the origin, and have the same six-branch embedded type. Their integral Milnor Seifert forms are isometric, and each has Milnor number $51$. Let $Phi_5 \( t \) = t^4 + t^3 + t^2 + t + 1$. If $M_h$ is the monodromy on $H_(bb(Q)) = H ⊗ bb(Q)$, then 
$ dim_(bb(Q)) ker \( M_h - I \) = 2 \, #h(2em) dim_(bb(Q)) ker Phi_5 \( M_h \) = 4 . $

 The monodromy on either $D_i ⊗ bb(C)$ is semisimple at eigenvalue $1$ and at every primitive fifth root of unity.]
] <lem:plane-data>

#proof[
  #emph[Finite maps and branch contacts.] At $u = 0$,
  $ phi \( 0 \, w \) = - w^4 \( 1 + w^7 \) \( 1 + 2 w^7 \) \, $
  and at $x = 0$,
  $ psi \( 0 \, w \) = - w^4 \( 1 - w \) + O \( w^19 \) . $
  Weierstrass preparation in $w$ therefore makes both graph projections finite of degree four.
  In the first graph $d_0 = u q_1 q_2$. Introduce invertible local coordinates $x = u - w \, med t = u$. Two branches of $q_1 = 0$ satisfy
  $ x = A_e \( t \) = e thin t^8 + O \( t^15 \) \, #h(2em) e = 1 \, 2 . $
  The branch $u = w^2$ satisfies $t = x^2 + O \( x^3 \)$, and $u = 0$ gives $t = 0$. The other two local branches arise from $q_2 = 0$. Substituting $u = v w^2$ gives
  $ q_2 \( v w^2 \, w \) = w^4 \( v - 1 - v^2 \) + O \( w^5 \) . $
  The two roots of $v^2 - v + 1 = 0$ are simple; hence the implicit-function theorem gives two branches
  $ t = B_f \( x \) = f thin x^2 + O \( x^3 \) \, #h(2em) f = frac(1 + i sqrt(3), 2) \, med frac(1 - i sqrt(3), 2) . $
  These exhaust the local branches of $q_2 = 0$: indeed $q_2 \( u \, 0 \) = u^2 \( u - 1 \)$, so Weierstrass preparation in $u$ has degree two. Together with $f = 0 \, 1$, these are four branches $t = B_f \( x \)$. All six are smooth and distinct.
  In the second graph,
  $ d_1 = psi \( x \, w \) #scale(x: 120%, y: 120%)[\(] x - psi \( x \, w \)^2 #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] x - 2 psi \( x \, w \)^2 #scale(x: 120%, y: 120%)[\)] . $
  The four branches of $psi = 0$ are exactly the four $t = B_f \( x \)$ above. Since $psi \( 0 \, w \) = - w^4 + O \( w^5 \)$, the last two factors each have a unique smooth branch $x = e w^8 + O \( w^9 \)$, $e = 1 \, 2$, and these read $x = e t^8 + upright("higher terms")$ in $t = x + w$. Thus both $d_i$ are units times products of two $x = A_e \( t \)$ factors and four $t = B_f \( x \)$ factors with the same first distinguishing coefficients.
  The two $A$-branches meet with multiplicity $8$; any pair of $B$-branches meets with multiplicity $2$; a branch from each group meets transversely. Hence
  $ delta \( d_i \) = 8 + binom(4, 2) thin 2 + 2 dot.op 4 = 28 \, #h(2em) mu \( d_i \) = 2 delta \( d_i \) - 6 + 1 = 51 . $
  #emph[The integral plane-form comparison.] Interpolate only the terms above the displayed leading coefficients and interpolate the nonvanishing units through units. This joins both germs to the same leading product
  $ d_compose = \( x - t^8 \) \( x - 2 t^8 \) product_(f in { 0 \, 1 \, \( 1 + i sqrt(3) \) \/ 2 \, \( 1 - i sqrt(3) \) \/ 2 }) \( t - f x^2 \) . $
  We now verify uniform isolation and boundary transversality along the interpolation, which yield an oriented isotopy of its Milnor tubes. In the sector $\| x \| lt.eq 2 \| t \|$, if $x \/ t^8$ stays bounded, weighted rescaling has the noncritical model $t^4 \( x - t^8 \) \( x - 2 t^8 \)$ at $t = 1$; its factors have distinct simple roots, and its weighted Euler derivative excludes other critical points. If $\| x \/ t^8 \| arrow.r oo$, all $t - B_f \( x \)$ factors are $t \( 1 + o \( 1 \) \)$, both $x - A_e \( t \)$ factors are $x \( 1 + o \( 1 \) \)$, and $x thin partial_x d \/ d arrow.r 2$. In the sector $\| t \| lt.eq 2 \| x \|$, the analogous rescaling for bounded $t \/ x^2$ gives $x^2 product_f \( t - f x^2 \)$; for $\| t \/ x^2 \| arrow.r oo$ one has $t thin partial_t d \/ d arrow.r 4$. These estimates and their first derivatives are uniform in the interpolation parameter after the ball is shrunk. The six branch parametrizations also meet small spheres transversely and remain disjoint there. The associated Milnor tubes and boundary open books consequently form an oriented isotopy. Transporting cycles and filling chains through it preserves the integral Seifert pairing. Thus $D_0$ and $D_1$ have isometric integral Seifert forms.
  #emph[The required monodromy sectors.] The plane-form comparison is now established. We finish by computing the two sectors used in the arithmetic argument and excluding Jordan blocks there. The three smooth branches of $h$ have pairwise intersections $1 \, 1 \, 2$; thus $mu \( h \) = 6$. The weighted rotation $\( X \, T \) mapsto \( zeta^2 X \, zeta T \)$, $zeta^5 = 1$, preserves $h$ and has order five. Its nontrivial generator has no fixed point on $F_h$. Lefschetz therefore gives trace $1$ on $H_(bb(Q))$. Over $bb(Q)$, a representation of the cyclic group of order five is a sum of trivial and four-dimensional cyclotomic representations. Its rank and trace equations force ranks $2$ and $4$, respectively.
  It remains to justify the asserted Jordan condition for $d_compose$. On a sufficiently small sphere, write its argument in the sector $\| x \| lt.eq 2 \| t \|$ as the argument of
  $ t^4 \( x - t^8 \) \( x - 2 t^8 \) product_f \( 1 - f x^2 \/ t \) \, $
  and in $\| t \| lt.eq 2 \| x \|$ as the argument of
  $ x^2 product_f \( t - f x^2 \) product_(e = 1 \, 2) \( 1 - e t^8 \/ x \) . $
  The displayed correction products are uniformly close to $1$ where used. Smooth cutoffs in the ratio $\| x \| \/ \| t \|$ remove their small arguments by an isotopy of argument fibrations. To see regularity through that isotopy, use the angular fields of the weighted rotations with rates $\( 8 \, 1 \) \/ 20$ on the $t$-side and $\( 1 \, 2 \) \/ 10$ on the $x$-side. Each differentiates its corresponding leading phase at rate one. On their common sector, both differentiate $2 arg x + 4 arg t$ at rate one; the derivatives of the small correction terms can be made arbitrarily small. Their convex angular interpolation therefore remains positively transverse to every intermediate phase. Near the binding only the appropriate weighted field is used and is tangent to the binding. Thus the isotopy preserves the open-book monodromy.
  This periodic-piece description follows the plane-link calculus of #cite(label("EisenbudNeumann1985")) Sections 11 and 13. The final phase in the overlap is $2 theta_x + 4 theta_t$. Each regular phase level there has two annuli, both parametrized by the radial ratio and the free angle $theta_t$, with the same orientation. A single phase circuit exchanges their cores $gamma_1 \, gamma_2$ while preserving their angular orientations. Outside the overlap, twenty circuits of either weighted rotation return identically. Across each overlap annulus the $theta_t$-return varies from one turn on the $t$-side to four turns on the $x$-side; hence the twentieth return makes the same signed threefold Dehn twist on both annuli. The oriented boundary of the $t$-side subsurface is $gamma_1 + gamma_2$ modulo actual page-boundary circles. The latter lie in the radical of the surface intersection form. Write $M_compose$ for the monodromy of $d_compose$. Then
  $ "im" \( M_compose^20 - I \) subset.eq bb(Q) \( gamma_1 - gamma_2 \) \, #h(2em) M_compose \( gamma_1 - gamma_2 \) = - \( gamma_1 - gamma_2 \) . $
  Since $M_compose^20 - I$ commutes with $M_compose$, it vanishes on the generalized eigenspaces at $1$ and at primitive fifth roots. The polynomial $z^20 - 1$ has simple roots; $M_compose$ is therefore semisimple on those sectors. ◻
]

The two projections retain different degree profiles on the branches. Here each tuple lists the degrees of the branches above the indicated component of $h = 0$:

$ upright("base branch") & pi_0 & pi_1\
T = 0 & \( 4 \) & \( 1 \, 1 \, 1 \, 1 \)\
X = T^2 & \( 1 \, 1 \, 2 \) & \( 4 \)\
X = 2 T^2 & \( 2 \, 2 \) & \( 4 \) $

We use the integral isometry of $D_0$ and $D_1$ only as an isometry of their abstract forms; no compatibility with the two projections to $H$ is assumed. The next lemma records the two maps on homology associated with each projection.

#thm([Lemma 2.2.])[
  (Finite-cover adjunction).  #emph[For $i = 0 \, 1$, the page maps induce $pi_(i *) : D_i arrow.r H$ and a full-preimage transfer $pi_i^(!) : H arrow.r D_i$ satisfying 
$ pi_(i *) pi_i^(!) = 4 thin upright("id")_H . $

 If $s_h \, s_(d_i)$ are the Seifert forms computed by ordered filling-chain intersection in the total Milnor tubes, then 
$ s_(d_i) \( pi_i^(!) a \, b \) = s_h \( a \, pi_(i *) b \) \, #h(2em) s_(d_i) \( b \, pi_i^(!) a \) = s_h \( pi_(i *) b \, a \) . $

 Consequently, after tensoring with $bb(Q)$, 
$ D_(i \, bb(Q)) = \( ker pi_(i *) \)_(bb(Q)) med perp med pi_i^(!) H_(bb(Q)) \, #h(2em) "pr"_i \( l \) = l - 1 / 4 pi_i^(!) pi_(i *) l $

 is the projection onto $\( ker pi_(i *) \)_(bb(Q))$ for both orders of the form.]
] <lem:cover-adjunction>

#proof[
  For an analytic germ $f$ that is not locally constant, an ordinary Milnor tube $B_epsilon.alt ∩ f^(- 1) \( D_delta \)$, with $0 < delta lt.double epsilon.alt lt.double 1$, has contractible total; this is the consequence of Milnor’s proof recorded in #cite(label("Massey2015LeCycles")) Theorem 1.8 and Remark 1.9. We compare the finite graph cuts used here with those ordinary tubes. Choose finite proper graph representatives over one sufficiently small closed base ball, and choose ordinary Milnor balls for $h \, d_i$ inside the corresponding cuts. The branch parametrizations above allow regular radii to be chosen so that the zero set in each closed intervening region is exactly a disjoint union of branch annuli. The cut boundaries are smooth near these annuli, and each annulus is transverse to both boundaries. The function is a complex submersion normal to each annulus. A field along the annulus directed from the inner boundary to the outer one therefore extends, by this submersion, to a field tangent to the nearby function levels. The disjoint flows give a value-preserving collar of a neighborhood of the entire collection of annuli. Properness makes the closed intervening region compact. Outside a neighborhood of these annuli the absolute value of the function has a positive lower bound, so a sufficiently small value disk confines the intervening tube to that collar. Attaching the collar to the ordinary tube preserves its homotopy type and gives regular lateral boundaries. Thus these selected cut totals are acyclic. Choose nearby pages whose base branch values lie in their interiors. Represent a base class by loops avoiding these finitely many values; the full preimage is a cycle upstairs. This operation is Poincaré–Lefschetz dual to pullback in relative first cohomology of the pages, so it depends only on the homology class of the loops. Counting the four sheets gives $pi_(i *) pi_i^(!) = 4$.
  For the first pairing identity, fill the base loop $a$ on the reference page in the acyclic base total tube, and fill the positive neighboring-page transport of $b$ upstairs. Pull the first oriented surface chain back through the finite holomorphic map, and push the second filling forward. Put both fillings and their boundary collars in general position. The base filling meets the generic branch curve at isolated points, and the other filling can be moved off their preimages; hence intersections relevant to the pairing occur away from ramification. At each such intersection the usual oriented projection formula counts the same local number before and after pushforward. The finite map is over the value disk, so it also commutes with positive nearby-page transport. This proves the first identity; reversing the two filling arguments proves the second. Finally, $pi_i^(!) H$ is rationally nondegenerate, since its restricted form is $4 s_h$ by adjunction. Its two-sided orthogonal complement is $ker pi_(i *)$, and the displayed formula is the corresponding projection. ◻
]

We have obtained the plane-form isometry together with a separate pushforward, transfer, and rational projection for each graph. The next section uses the graph equations to construct the two smooth fourfold germs and to read their ordinary orders in analytic coordinates.

== 3 Smooth ambient germs and their ordinary orders <sec:ambient-germs>

Starting from the two graph maps, we now construct the smooth fourfold germs and compute the first nonzero terms of their functions. We first fix one parameter choice for both graphs. The same choice will satisfy the later arithmetic requirements, while the estimates proved here supply the local isolation argument in Lemma 9.

#thm([Lemma 3.1.])[
  (One common parameter choice).  #emph[For every sufficiently large integer $r$, choose an integer $n_0$ such that 
$ n_0 equiv 1 med \( mod med 2^r \) \, #h(2em) n_0 equiv 2 med \( mod med 5 \) \, #h(2em) n_0 > 5 dot.op 2^r \, $

 and define 
$ n_1 & = n_0 + 5 dot.op 2^r \, & a & = \( n_0^2 - 1 \) \/ 4 \, & b & = \( n_1^2 - 1 \) \/ 4 \,\
alpha & = frac(4 b, a + b) \, & beta & = frac(4 a, a + b) . $

 Then $a \, b$ are positive comparable integers, $n_0 \, n_1 equiv 1 med \( mod med 4 \)$, and $gcd \( n_0 \, n_1 \) = 1$. Moreover 
$ alpha + beta = 4 \, #h(2em) a alpha = b beta \, #h(2em) frac(\( a - 2 \) alpha, 4) > 4 \, #h(2em) frac(\( b - 2 \) beta, 4) > 4 . $

]
] <lem:simultaneous-parameters>

#proof[
  The Chinese remainder theorem supplies arbitrarily large $n_0$ with the two congruences, so the strict lower bound can also be imposed. For large $r$ we have $r gt.eq 2$, and both $n_j$ are $1 med \( mod med 4 \)$; therefore $a \, b$ are integers. The lower bound on $n_0$ gives $n_0 < n_1 < 2 n_0$, so $a \, b$ are positive, comparable, and grow without bound with $r$. A common divisor of $n_0 \, n_1$ divides $5 dot.op 2^r$. Both integers are odd and $2 med \( mod med 5 \)$, proving $gcd \( n_0 \, n_1 \) = 1$.
  The identities for $alpha \, beta$ follow from their definitions. Since $b > a$,
  $ frac(\( a - 2 \) alpha, 4) = frac(a b, a + b) - frac(2 b, a + b) > a / 2 - 2 \, #h(2em) frac(\( b - 2 \) beta, 4) = frac(a b, a + b) - frac(2 a, a + b) > a / 2 - 2 . $
  The right sides exceed four for sufficiently large $r$. In particular, the chosen $a \, b$ exceed four. ◻
]

Fix this choice for the rest of the paper, and set

$ g = gcd \( a \, b \) \, #h(2em) m = 4 a b + a + b . $

Lemma 17 proves the additional arithmetic properties of these same integers: $a \, b equiv 2 med \( mod med 5 \)$, $5 divides.not g$, $g gt.eq 2^(r - 1) > 5$, and, for each $q in { 1 \, 4 }$, the existence of positive integers $i \, j$ satisfying

$ i equiv j med \( mod med 4 \) \, #h(2em) frac(b i + a j, m) = q / 5 . $

The deformation parameter $s$ will be chosen sufficiently small only after this tuple has been fixed.

Put $p = \( X \, T \)$. Let $R_0 \( p \, w \)$ and $R_1 \( p \, w \)$ be the monic degree-four Weierstrass polynomials in the graph equations

$ X - T^2 - q_1 \( T \, w \) & = U_0 \( p \, w \) R_0 \( p \, w \) \,\
T - psi \( X \, w \) & = U_1 \( p \, w \) R_1 \( p \, w \) \, $

where $U_0 \, U_1$ are analytic units. For a fixed small real $s > 0$, set

$ R_(i \, s) \( p \, w \) & = s^4 R_i \( p \, w \/ s \) \,\
C_(i \, s) & = { \( p \, y \, z \, w \) : y z = R_(i \, s) \( p \, w \) } \,\
f_(i \, s) & = h \( p \) + w \( y^a + z^b \)\|_(C_(i \, s)) . $

#thm([Proposition 3.2.])[
  (Analytic germs and their orders).  #emph[For the parameters of Lemma 4 and every sufficiently small $s > 0$, each $C_(i \, s)$ is a smooth complex fourfold near the origin, and $f_(i \, s)$ has an isolated critical point there, as proved in Lemma 9. After solving the smooth ambient equations in analytic local coordinates, $f_(0 \, s)$ has order five and $f_(1 \, s)$ has order four. Both are reduced convergent germs.]
] <prop:ambient-orders>

#proof[
  The specializations in Lemma 2 give $R_i \( 0 \, w \) = w^4$ and $U_i \( 0 \) = 1$. Hence
  $ partial_X R_0 \( 0 \) = 1 \, #h(2em) partial_T R_1 \( 0 \) = 1 . $
  These derivatives remain nonzero along the respective local root loci after shrinking. For $s > 0$, the corresponding derivatives of $R_(i \, s)$ are multiplied by the nonzero factor $s^4$. At a point of $C_(i \, s)$ with $y eq.not 0$ or $z eq.not 0$, its defining equation has a nonzero vertical derivative; at $y = z = 0$, one of the displayed base derivatives is nonzero. Thus the ambient germs are smooth.
  The two ambient equations are equivalently the implicit equations
  $ X & = T^2 + q_1 \( T \, w \/ s \) + s^(- 4) U_0 \( p \, w \/ s \) y z \,\
T & = psi \( X \, w \/ s \) + s^(- 4) U_1 \( p \, w \/ s \) y z \, $
  respectively. In the first, $q_1 \( T \, w \/ s \)$ has ordinary order at least three. Since $U_0 \( 0 \) = 1$, analytic implicit solution gives
  $ X = T^2 + s^(- 4) y z + O_(gt.eq 3) \( T \, y \, z \, w \) . $
  In the second graph $q_2 = q_1 - u^2$ has order two, and $psi = u \( u - w^2 \) q_2$ has order four. Therefore
  $ T = s^(- 4) y z + O_(gt.eq 3) \( X \, y \, z \, w \) . $
  Here $s$ is fixed and $O_(gt.eq j)$ denotes terms of ordinary total degree at least $j$; in particular all $w^4$ terms lie in these remainders. The chosen $a \, b$ exceed four, so $w \( y^a + z^b \)$ has order greater than five. Substitution in $h$ gives the nonzero initial forms
  $ "in" \( f_(0 \, s) \) = T \( s^(- 4) y z \) \( s^(- 4) y z - T^2 \) \, #h(2em) "in" \( f_(1 \, s) \) = s^(- 4) y z X^2 . $
  They have degrees five and four, respectively.
  It remains to justify the isolated critical points claimed in the proposition. The input from the base curve is the following explicit gradient estimate. Along an analytic arc, let $nu$ denote order in the arc parameter, with $nu 0 = oo$; for a vector, $nu$ is the minimum of its component orders. If an analytic arc $p = \( X \, T \) eq.not 0$ has $m_0 = nu p = min \( nu X \, nu T \)$, then
  #[#set math.equation(numbering: n => "(3.1)")
   $ nu nabla h lt.eq 4 m_0 . $ <eq:plane-gradient>]
  Indeed $h_X = T \( 2 X - 3 T^2 \)$ and $h_T = X^2 - 9 T^2 X + 10 T^4$. If $nu X < 2 nu T$, the first term of $h_T$ has order $2 nu X lt.eq 4 m_0$. If $nu X > 2 nu T$, the term $- 3 T^3$ of $h_X$ has order $3 nu T lt.eq 4 m_0$. In the equality case, put $X \/ T^2 = c + upright("higher terms")$; $2 c - 3$ and $c^2 - 9 c + 10$ have no common root, so one derivative has order at most $4 nu T = 4 m_0$. The cases in which one coordinate vanishes identically are immediate.
  The full multiplier argument, including the cases where a vertical variable vanishes, is given in Lemma 9; it uses the two strict bounds in Lemma 4 with the gradient exponent $4$ just proved.
  Finally, if a convergent hypersurface germ had a repeated irreducible factor, its gradient would vanish at generic nonzero smooth points of that factor. Lemma 9 therefore also implies reducedness. ◻
]

Choose one $s > 0$ below the thresholds for both graphs and choose analytic charts $C_(i \, s) tilde.equiv \( bb(C)^4 \, 0 \)$. The germs in Theorem 1 are then $f_5 = f_(0 \, s)$ and $f_4 = f_(1 \, s)$.

== 4 The cone tube and integral gluing <sec:tube>

We now compute the integral middle homology and ordered Seifert pairing for the functions constructed in the preceding section. The calculation keeps the projection and transfer of each graph map visible: these maps determine how cycles close across the boundary of the smoothing region. Throughout this calculation $k = 4$; the letter $k$ records the covering degree in the formulas.

Let $p = \( X \, T \)$, $h = T \( X - T^2 \) \( X - 2 T^2 \)$, and let $pi : \( bb(C)^2 \, 0 \) arrow.r \( bb(C)^2 \, 0 \)$ be one of the two degree-four finite graph maps $pi_i$, with $i in { 0 \, 1 }$ in the construction. Write $d = h compose pi$, and let

$ R \( p \, w \) = w^k + sum_(j < k) A_j \( p \) w^j \, #h(2em) k = 4 \, $

be its prepared equation, so $A_j \( 0 \) = 0$ and $R \( 0 \, w \) = w^k$. The root surface $R = 0$ is smooth near the origin; one component of $R_p$ is a unit. For $s > 0$, put $R_s \( p \, w \) = s^k R \( p \, w \/ s \)$ and

$ C_s = { \( p \, y \, z \, w \) : y z = R_s \( p \, w \) } \, #h(2em) f_s = h \( p \) + P \( y \, z \, w \) \, quad P = w \( y^a + z^b \) . $

The germ $C_s$ is smooth of complex dimension four. The tube statement below is formulated for any sufficiently large positive integers $a \, b$ satisfying its two displayed inequalities. For the two germs of this paper we use the single tuple already fixed in Lemma 4. For such a qualifying pair, set

$ alpha = frac(k b, a + b) \, #h(2em) beta = frac(k a, a + b) \, #h(2em) alpha + beta = k \, #h(2em) a alpha = b beta . $

Let $cal(H) \, cal(D)$ be the pages of $h \, d$. Let $Q$ be a small fiber $P^(- 1) \( c \)$ in the cone ${ y z = w^k }$, with $c eq.not 0$; it lies entirely in the smooth nonvertex locus. Their middle homology groups are $H = H_1 \( cal(H) \; bb(Z) \)$, $D = H_1 \( cal(D) \; bb(Z) \)$, and $E = H_1 \( Q \; bb(Z) \)$. The finite map has projection and transfer $pi_(*) : D arrow.r H$, $pi^(!) : H arrow.r D$, with $pi_(*) pi^(!) = k$. Put $K = ker pi_(*)$ and $"pr" l = l - k^(- 1) pi^(!) pi_(*) l in K_(bb(Q))$. The cone link $L$ is a lens space, $H_1 \( L \) = bb(Z) \/ k$, and $tau : E arrow.r bb(Z) \/ k$ is induced by weighted radial projection $Q arrow.r L$, equivalently by page inclusion in the link open-book model. Write $s_h \, s_d$ for the tube filling forms in the ordered neighboring-page convention fixed in Section 2. The cyclic map $\( U \, V \) mapsto \( U^k \, V^k \, U V \)$ to the cone pulls $P$ back to $tilde(P) \( U \, V \) = U V \( U^(k a) + V^(k b) \)$. Let $tilde(Q)$ be its plane Milnor page, and let $tilde(s)$ be its plane-page form. The cyclic cover of the nonvertex cone gives a full-lift map $"tr" : E arrow.r H_1 \( tilde(Q) \; bb(Z) \)$; define

$ e \( v \, v' \) = 1 / k tilde(s) \( "tr" v \, "tr" v' \) . $

This form is a priori rational because of the factor $1 \/ k$. The theorem below specifies the integral page lattice on which the rational form is evaluated.

#thm([Theorem 4.1.])[
  (Tube, lattice, and pairing).  #emph[For sufficiently large $a \, b$ satisfying 
$ frac(\( a - 2 \) alpha, k) > L_0 \, #h(2em) frac(\( b - 2 \) beta, k) > L_0 \, $

 where $L_0 = 4$ is the gradient exponent in (3.1), and for sufficiently small $s > 0$, the germ $f_s : C_s arrow.r bb(C)$ has its sole critical point at the origin in a fixed small tube. Its integral Milnor lattice, in rational coordinates, is 
#[#set math.equation(numbering: n => "(4.1)")
 $ Lambda_pi = {\( "pr" l \, z \) : l in D \, med z in H ⊗ E \, quad pi_(*) l med mod med k H = \( 1 ⊗ tau \) z} subset K_(bb(Q)) xor \( H ⊗ E \)_(bb(Q)) . $ <eq:tube-1>]

 The rational orthogonal filling form on these coordinates is 
#[#set math.equation(numbering: n => "(4.2)")
 $ - s_d \|_K med perp med \( s_h ⊗ e \) . $ <eq:tube-2>]

 The lattice and form are those of a genuine local Milnor page of $f_s$ in the smooth ambient germ $C_s$.]
] <thm:tube>

In (4.1), $z$ records the exterior product class, while $l$ indexes an inner closing chain. The equality of residues is the condition for these pieces to close, and $"pr" l$ is the resulting rational inner coordinate.

Section 5 supplies boundary regularity, compatible continuations, and isolation. Section 6 computes the inner homology and proves acyclicity of the large total. It then compares the large and local total/page pairs, identifying the page homology and ordered form with the ordinary local Milnor data. Its signed exterior cut determines which exterior cycles extend. Section 7 then determines the integral lattice in these rational coordinates through the Bockstein and transfer, and Section 8 computes the two ordered filling forms.

== 5 Boundary geometry and the Milnor representative <sec:boundary-geometry>

The tube calculation must describe a genuine local Milnor page. We choose a larger representative whose inner and exterior parts admit the required continuations. This section proves its boundary regularity, constructs compatible changes of model on the inner and exterior pieces, and proves isolation. The next section uses those models to prove acyclicity and then compares this representative with an ordinary small Milnor tube.

Fix $M > 3$, with $M^(a + b) > 1 + k max \( a \, b \)$, and for $t > 0$ set

$ Y_t = { \| y \| lt.eq M t^alpha \, med \| z \| lt.eq M t^beta \, med \| w \| lt.eq t } . $

Choose a sufficiently small base ball $cal(B)$ for both plane tubes. Then choose $rho > 0$, $epsilon > 0$, $delta > 0$, $lambda > 0$, and $s > 0$, in that order, with

#[#set math.equation(numbering: n => "(5.1)")
 $ 0 < delta < epsilon \/ 4 \, #h(2em) 0 < lambda lt.double rho \, #h(2em) sup_(Y_lambda) \| P \| < delta \/ 4 \, $ <eq:tube-3>]

and with every root of $R_s \( p \, dot.op \)$, for $p in cal(B)$, in $\| w \| < lambda \/ 4$. The last condition follows because the roots are $s$ times the roots of $R \( p \, dot.op \)$ on the compact base cut. Our larger closed total tube is

#[#set math.equation(numbering: n => "(5.2)")
 $ hat(cal(T))_s = { p in cal(B) \, med \| h \| lt.eq epsilon \, med \( y \, z \, w \) in Y_rho \, med y z = R_s \( p \, w \) \, med \| h + P \| lt.eq delta } \, $ <eq:tube-4>]

and $cal(T)_s = f_s^(- 1) \( c \) ∩ hat(cal(T))_s$ for $\| c \| = delta$. Write $X_s$ for the same cut set with the final inequality $\| h + P \| lt.eq delta$ omitted. Its outer lateral strata are formed by the base-ball, $\| h \| = epsilon$, and $partial Y_rho$ faces and their active corners. Let $W$ be the part of $cal(T)_s$ in $Y_lambda$, let $M_(upright("ext"))$ be the part of $cal(T)_s$ outside the interior of $Y_lambda$, and let $J$ be their bicollared interface. Hats denote the corresponding total disk pieces. The auxiliary interface $J$ is an interior cut of $X_s$, rather than one of its outer lateral strata.

=== 5.1 Regularity on the outer boundary <regularity-on-the-outer-boundary>

#thm([Lemma 5.1.])[
  (Outer boundary regularity).  #emph[For every sufficiently small fixed $s > 0$, the map $f_s$ on the compact outer lateral boundary of $X_s$ over ${ \| v \| lt.eq delta }$ is proper, and its restriction to every stratum has real rank two throughout that disk. In particular, all active lateral faces and corners of (5.2) are independent of the horizontal face over $\| f_s \| = delta$. The horizontal boundary map is proper on the union of lateral strata and a submersion on each stratum.]
] <lem:boundary>

#proof[
  We first estimate the vertical faces and corners, then prove uniform regularity on the remaining outer strata.
  At $s = 0$ the vertical equation is $y z = w^k$. Its link on $partial Y_t$ is the cyclic quotient of a 3-sphere, hence a lens space. The cone is smooth away from its vertex. The $y$- and $z$-faces cannot meet: if both were active, then $\| y z \| = M^2 t^k > \| w \|^k$. On the $y$-face,
  #[#set math.equation(numbering: n => "(5.3)")
   $ lr(|z^b / y^a|) lt.eq M^(- \( a + b \)) (frac(\| w \|, t))^(k b) < 1 . $ <eq:tube-5>]
  After eliminating $z = w^k \/ y$, the free derivative is $P_w = y^a + \( k b + 1 \) z^b$, which is nonzero by the stronger choice of $M$. The $z$-face is symmetric, with $P_w = z^b + \( k a + 1 \) y^a$. These estimates persist for small positive $s$ by uniform convergence of $R_s$ and $partial_w R_s$ on the fixed outer face. At a $y \/ w$ corner the bound
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| P \| gt.eq t^(1 + a alpha) \( M^a - M^(- b) \) > 0 $ <eq:tube-6>]
  holds; similarly at a $z \/ w$ corner. Choose $epsilon + delta$ below both lower bounds at $t = rho$. On the $w$-face, near a zero of $P$ with $w eq.not 0$, use $y$ as the free coordinate and $z = w^k \/ y$. Then $d P \( partial_(log y) \) = w \( a y^a - b z^b \) = w \( a + b \) y^a eq.not 0$ at $P = 0$. On the compact outer $w$-face, this nonvanishing persists in one uniform small-value neighborhood; choose $epsilon + delta$ within it. The quotient expression $tilde(P) = U V \( U^(k a) + V^(k b) \)$ also shows submersivity of $P$ in the nonvertex cone interior: if $U \, V eq.not 0$, its two partials cannot vanish simultaneously because that would imply $\( k a + 1 \) \( k b + 1 \) = 1$; on each axis the transverse partial is nonzero. These calculations cover the vertical faces and corners near the small values used in (5.2).
  To finish the regularity claim on the genuine outer strata, consider a sequence approaching the cone vertex while $s arrow.r 0$, and let $𝜚 = max \( \| y \|^(1 \/ alpha) \, \| z \|^(1 \/ beta) \, \| w \| \)$. If $𝜚 \/ s arrow.r oo$, weighted rescaling by $𝜚$ gives smooth convergence at a nonvertex cone point; all lower Weierstrass terms vanish because $A_j$ is bounded and $\( s \/ 𝜚 \)^(k - j) arrow.r 0$. If $𝜚 \/ s$ is bounded, rescale by $s$, with $\( Y \, Z \, u \) = \( y \/ s^alpha \, z \/ s^beta \, w \/ s \)$; the limit is the smooth model $Y Z = R \( p \, u \)$. For $\( Y \, Z \) eq.not \( 0 \, 0 \)$ the base projection is a submersion; at $Y = Z = 0$ its differential contains the tangent image of the smooth root graph. The specified $h \, d$ Milnor cuts have the needed transversality on $partial cal(B)$, including corners with $\| h \| = epsilon$. For the actual function $f_s$, these arguments give the stated outer lateral regularity over the whole value disk. Indeed $\| P \| lt.eq epsilon + delta$ whenever $\| f_s \| lt.eq delta$, so all the outer vertical-face estimates apply throughout that disk, also at their intersections with base faces because the free vertical directions keep the base fixed. On an outer stratum with no vertical face, a hypothetical failure with unbounded $𝜚 \/ s$ would contradict submersivity of $P$ on the nonvertex cone after rescaling. If $𝜚 \/ s$ is bounded, then $P = s^(1 + a alpha) u \( Y^a + Z^b \) = o \( 1 \)$ in the smooth rescaled model. The face $\| h \| = epsilon$ is then absent over $\| f_s \| lt.eq delta < epsilon \/ 4$. On the remaining base-ball face, the boundary fibrations of $h$ and $d$ over their full small value disks give rank two, respectively where $\( Y \, Z \) eq.not \( 0 \, 0 \)$ and on the smooth root graph. Compactness and the preceding smooth convergence preserve these ranks for small $s$. This assertion concerns the outer cuts of $X_s$; it does not assert disk-wide submersivity on the auxiliary $J$. The remaining interior critical-point possibility is excluded in Lemma 9. All statements here are open in compact families of smooth strata, so one uniform upper bound on $s$ works for all strata. ◻
]

=== 5.2 Compatible continuations and the lens circle <compatible-continuations-and-the-lens-circle>

The inner and exterior computations use different models. To glue classes computed in them, we must carry the same oriented lens circle over each labeled base loop. This retains the labeling of the interface tori; in Section 7 it will identify the full finite-map transfer.

For $\| c \| = delta$, write $cal(H)_c = cal(B) ∩ { h = c }$. Choose a smooth $h$-trivialization of pairs, respecting the base-ball boundary, $Phi \( p_0 \, q \)$, over a disk about $c$ containing ${ \| q - c \| lt.eq delta \/ 4 }$, with $p_0 in cal(H)_c$, $Phi \( p_0 \, c \) = p_0$, and $h \( Phi \( p_0 \, q \) \) = q$. Set $w_0 = lambda \/ 2$.

#thm([Lemma 5.2.])[
  (Compatible continuations).  #emph[For sufficiently small $s > 0$, the exterior total/page pairs continue to $s = 0$. On the inner part, the sublevel totals and horizontal-boundary fibrations continue from $h + P$ to $h$ through $h + theta P$, $0 lt.eq theta lt.eq 1$. These continuations preserve the complex value on the horizontal boundary and agree on $J$ up to isotopy through their two-parameter rectangle.]
  #emph[They can be chosen to preserve the label $p_0$, the coordinate $w_0$, and the exact positive $y$-angle $phi.alt$ on the interface circles characterized by 
$ p = Phi \( p_0 \, q \) \, #h(2em) w = w_0 \, #h(2em) y = M lambda^alpha e^(i phi.alt) \, #h(2em) h \( p \) + theta P \( y \, z \, w \) = c . $

 Here $z = R_s \( p \, w_0 \) \/ y$, and $q$ is the unique value near $c$ that satisfies these equations. The inner continuation is an isotopy of sublevel totals; value preservation is required on its horizontal boundary, not through its critical region.]
] <lem:continuations>

#proof[
  At the inner interface, (5.1) and $\| h + theta P \| = delta$ imply
  #[#set math.equation(numbering: n => "(5.5)")
   $ 3 delta \/ 4 lt.eq \| h \| lt.eq 5 delta \/ 4 < epsilon quad \( 0 lt.eq theta lt.eq 1 \) . $ <eq:tube-7>]
  Thus $h$ is regular there, including on its base-ball cut, and the $\| h \| = epsilon$ cut is absent. On the inner $w$-face, (5.5) makes $h$ regular, and $lambda$ can be decreased until $P$ is small in $C^1$ there. The zero-parameter cone is smooth along this interface, so the same assertion holds throughout the $\( s \, theta \)$ rectangle for small $s$. We use regularity of the horizontal boundary to isotope the #emph[sublevel totals] as manifolds with corners; we do not assert that $h$ is submersive through every value in the disk at $theta = 0$.
  We first construct the prescribed circle family. For fixed $\( p_0 \, phi.alt \, theta \, s \)$, solve
  $ q + theta P (y \, frac(R_s \( Phi \( p_0 \, q \) \, w_0 \), y) \, w_0) = c $
  for $q$ near $c$, then set $p = Phi \( p_0 \, q \)$ and $z = R_s \( p \, w_0 \) \/ y$. The root bound gives $\| R_s \( p \, w_0 \) \| lt.eq \( 3 lambda \/ 4 \)^k$, so these circles lie on the $y$-face and strictly away from the $z$- and $w$-faces. Thus the small bound for $P$ applies there. The solution is unique and smooth by the real implicit-function theorem: $P$ is uniformly small there, and its real derivative $D_q P arrow.r 0$ as $s arrow.r 0$, since every $p$-dependent term of $R_s \( p \, w_0 \)$ contains a positive power of $s$. Decrease $s$ until $lr(bar.v.double D_q P bar.v.double) < 1 \/ 2$ uniformly on this neighborhood. This lift keeps the $h$-page label $p_0$, $w_0$, and the exact oriented $y$-angle $phi.alt$ fixed; the physical $p$ may move. At $theta = 0$, the $s$-motion keeps $p_0 \, y \, w_0$ fixed and only changes $z = R_s \( p_0 \, w_0 \) \/ y$. Hence the family of anchored circles is $cal(H)_c times S^1$, with no base-to-circle shear. To make this family the restriction of the boundary isotopy, use the same coordinates near its compact trace and put
  $ cal(P)_s \( p_0 \, q \, y \, w \) = P (y \, frac(R_s \( Phi \( p_0 \, q \) \, w \), y) \, w) . $
  The real operator $I + theta D_q cal(P)_s$ is uniformly invertible there. The local lifts that fix $p_0 \, y \, w$ have
  $ dot(q)_theta = - \( I + theta D_q cal(P)_s \)^(- 1) cal(P)_s \, #h(2em) dot(q)_s = - \( I + theta D_q cal(P)_s \)^(- 1) theta thin partial_s cal(P)_s . $
  Differentiating $q + theta cal(P)_s$ verifies that both lifts preserve its complex value. They are tangent to the $y$-face and to the base-ball face, because $y$ and the pair-trivialization label $p_0$ are fixed. Their restrictions to the circles are exactly the derivatives of the displayed implicit solution.
  We extend these local lifts to the sublevel continuations. Near $J$, vary $lambda$ slightly to obtain bicollars. For the $theta$-motion the ambient $C_s$ is fixed. On a collar of $\| h + theta P \| = delta$, the map consisting of $h + theta P$ and the active lateral defining functions is a submersion. Choose a parameter field $V$ tangent to every active lateral face and satisfying $d \( h + theta P \) \( V \) + P = 0$ there. Near the compact anchor trace, patch it with the local $theta$-lift above by a cutoff equal to one on that trace. The lift equation and all active-face tangency conditions are affine, so this patch remains a valid lift. Extend only its spatial correction by a cutoff supported in that collar and zero near the critical region, retaining the parameter direction, and integrate. This isotopes the smooth sublevel totals and preserves the complex value on their horizontal boundary. For the $s$-motion on the exterior, identify the smooth ambient family away from the cone vertex and make the same horizontal-collar correction, patched with the displayed local $s$-lift near the anchors. Uniqueness of the flows makes their restrictions exactly the anchored family, fixing $p_0 \, w_0 \, phi.alt$. On the interface rectangle (5.5) keeps $h$ regular, so its collar lifts exist along every edge and path homotopy gives isotopic boundary identifications relative to these anchors. Locally this is explicit in the coordinates $\( p_0 \, q + theta cal(P)_s \, y \, w \, theta \, s \)$, in which the two anchored lifts are parameter coordinate fields. At $s = 0$, the cone is independent of $p$, so on the entire page interface this normalization can be chosen explicitly as
  $ \( p_0 \, v \) mapsto #scale(x: 120%, y: 120%)[\(] Phi \( p_0 \, c - theta P \( v \) \) \, v #scale(x: 120%, y: 120%)[\)] \, #h(2em) v = \( y \, z \, w \) in L = { y z = w^k } ∩ partial Y_lambda . $
  The bound $\| P \( v \) \| < delta \/ 4$ keeps this formula in the chosen trivialization. It agrees with the anchored circles and identifies the interface with $cal(H)_c times L$ while retaining the same base label. No value-preserving lift is used through the critical inner total. ◻
]

=== 5.3 Isolation in the chosen tube <isolation-in-the-chosen-tube>

#thm([Lemma 5.3.])[
  (Uniform critical-point isolation).  #emph[For sufficiently large $a \, b$ as in Theorem 6, the only critical point of $f_s$ in (5.2) for all sufficiently small $s > 0$ is the origin.]
] <lem:isolation>

#proof[
  The gradient ideal of the isolated plane singularity $h$ contains a power of the maximal ideal. For this $h$, use the same $L_0 = 4$ supplied by (3.1): on each nonconstant analytic arc $p arrow.r 0$, $nu \( h_p \) lt.eq L_0 nu \( p \)$. For fixed $s$, at a constrained critical point in the ambient coordinates, write the spatial differential equation
  $ d \( h + P \) = chi_(upright("orig")) thin d \( y z - R_s \) . $
  After the change $y = s^alpha Y$, $z = s^beta Z$, $w = s u$, put $xi = s^(1 + a alpha)$. Then $h + P = h + xi u \( Y^a + Z^b \)$, while the constraint is $s^k \( Y Z - R \) = 0$. We write $chi = s^k chi_(upright("orig"))$ for the multiplier of the rescaled constraint $Y Z - R = 0$; the two symbols will be kept distinct. The rescaled spatial critical equations are
  #[#set math.equation(numbering: n => "(5.6)")
   $ h_p & = - chi R_p \, & xi \( Y^a + Z^b \) & = - chi R_u \,\
xi a u Y^(a - 1) & = chi Z \, & xi b u Z^(b - 1) & = chi Y . $ <eq:tube-10>]
  We first dispose of points over $p = 0$, then of points with $y = z = w = 0$ and $p eq.not 0$. Any remaining hypothetical critical sequence as $s arrow.r 0$ has, after a subsequence, either $p arrow.r p_0 eq.not 0$ or $p arrow.r 0$. We exclude the first alternative by the cone and root-graph calculations and the second by valuations.
  At $p = 0$, $R_s \( 0 \, w \) = w^k$ exactly, so the vertical constrained critical equations are those of $P$ on $y z = w^k$. If $w eq.not 0$, then $y \, z eq.not 0$. Multiplying the $y$- and $z$-equations by $y$ and $z$, respectively, and eliminating $chi_(upright("orig")) w^(k - 1)$ from the $w$-equation gives
  $ \( k a + 1 \) y^a + z^b = 0 \, #h(2em) y^a + \( k b + 1 \) z^b = 0 . $
  Their determinant is $k \( k a b + a + b \) eq.not 0$, which would force $y^a = z^b = 0$, a contradiction. If $w = 0$, then $y z = 0$; at a nonzero point on either axis $P_w = y^a + z^b eq.not 0$, whereas the $w$-derivative of $y z - w^k$ is zero. Thus the vertical equations exclude every point over $p = 0$ except the origin, without a condition on $w \/ s$. At $y = z = w = 0$ with $p eq.not 0$, constrained criticality is exactly criticality of $d$ on its smooth root graph and is excluded near the origin.
  First exclude critical points whose base coordinate tends to $p_0 eq.not 0$ while $s arrow.r 0$. Let $𝜚 = max \( \| y \|^(1 \/ alpha) \, \| z \|^(1 \/ beta) \, \| w \| \)$. If $𝜚 \/ s arrow.r oo$, weighted rescaling by $𝜚$ leaves a nonvertex cone point: every lower term in $R_s \/ 𝜚^k$ tends to zero. The normalized vertical critical equations would make $P$ critical on the smooth nonvertex cone, which is impossible. If $𝜚 \/ s$ is bounded, use the rescaled variables and multiplier in (5.6). The variables $Y \, Z \, u$ are bounded and $xi arrow.r 0$. On the bounded $\( p \, u \)$-set, $R_p$ is bounded, while $h_p \( p \)$ stays bounded away from zero because $h_p \( p_0 \) eq.not 0$. The base equation $h_p = - chi R_p$ therefore bounds $\| chi \|$ away from zero. The $Y$- and $Z$-equations in (5.6), with bounded $u \, Y \, Z$ and $xi arrow.r 0$, now force $Y \, Z arrow.r 0$. After passing to a subsequence $u arrow.r u_0$, the constraint gives $R \( p_0 \, u_0 \) = 0$. All roots over the selected base cut lie in the chosen local graph representative; only at this point do we use its unit component of $R_p$. The base equation then bounds $chi$ above, so a further subsequence has a nonzero finite limit $chi_(upright("lim"))$. The $u$-equation in (5.6) gives $R_u \( p_0 \, u_0 \) = 0$. Together with $R \( p_0 \, u_0 \) = 0$ and $h_p \( p_0 \) = - chi_(upright("lim")) R_p \( p_0 \, u_0 \)$, this says $h$ is critical on the smooth root graph $R = 0$ away from its origin, contrary to isolation of $d$.
  Thus a remaining critical sequence has $p arrow.r 0$. Real-analytic curve selection gives an arc; write $nu$ for its valuation, and set
  $ m_0 = nu \( p \) > 0 \, #h(2em) nu_(upright(v)) = min #scale(x: 120%, y: 120%)[\(] nu \( y \) \/ alpha \, nu \( z \) \/ beta \, nu \( w \) #scale(x: 120%, y: 120%)[\)] . $
  The case $nu_(upright(v)) = oo$ was already covered by the root graph, so assume it is finite. Write $𝜚$ for an arc scale with $nu \( 𝜚 \) = nu_(upright(v))$. If the lower Weierstrass terms all vanish under rescaling by $𝜚$, the vertical equation limits to $y z = w^k$ at a nonvertex point. Normalize the original critical multiplier to $chi_(upright("cone")) = chi_(upright("orig")) \/ 𝜚^(d_P - k)$, where $d_P = 1 + a alpha$. A nonzero component of the cone gradient bounds this multiplier through the corresponding vertical critical equation; a convergent subsequence of all the equations then gives $d \( P \|_(y z = w^k) \) = 0$, contradicting the submersivity just proved. Thus, for some $j < k$,
  #[#set math.equation(numbering: n => "(5.7)")
   $ \( k - j \) \( nu s - nu_(upright(v)) \) + nu A_j \( p \) lt.eq 0 . $ <eq:tube-8>]
  Since $A_j \( 0 \) = 0$, $nu A_j \( p \) gt.eq m_0$, and therefore
  #[#set math.equation(numbering: n => "(5.8)")
   $ nu_(upright(v)) - nu s gt.eq m_0 \/ k . $ <eq:tube-9>]
  Return to the rescaled variables and multiplier in (5.6). By (5.8), $p \, u \, Y \, Z arrow.r 0$ and $nu Y gt.eq alpha m_0 \/ k$, $nu Z gt.eq beta m_0 \/ k$. The unit component of $R_p$ and the gradient bound give $nu chi lt.eq L_0 m_0 = 4 m_0$. If $Y \, Z \, u eq.not 0$, the $Y$- and $Z$-equations in (5.6) give
  $ nu Z - nu Y & = nu xi + nu u + \( a - 2 \) nu Y - nu chi\
 & gt.eq nu xi + nu u + (frac(\( a - 2 \) alpha, k) - L_0) m_0 > 0 \,\
nu Y - nu Z & = nu xi + nu u + \( b - 2 \) nu Z - nu chi\
 & gt.eq nu xi + nu u + (frac(\( b - 2 \) beta, k) - L_0) m_0 > 0 . $
  Here $nu xi \, nu u > 0$, and the strict signs use the two inequalities on $a \, b$ in Theorem 6, together with $m_0 > 0$. The two conclusions are incompatible. If exactly one of $Y \, Z$ vanishes, or if $u = 0$ while both are nonzero, (5.6) forces $chi = 0$, hence $h_p = 0$, contrary to $p eq.not 0$. If both vanish, then $R = 0$ and the remaining critical equations make $h$ critical on the root graph, contrary to isolation of $d$. This exhausts the arc. ◻
]

The outer boundary, the compatible model changes, and isolation are now established. We next compute the inner collapse and prove acyclicity of the large total; the local-page comparison will then follow without any additional geometric assumption on the custom cuts.

== 6 Circle collapse and integral homology <sec:circle-collapse>

We first compute the inner page in the $h$-model and prove acyclicity of the large total. These facts allow a complete comparison with an ordinary local Milnor tube. We then cut the exterior page in the cone model to determine which classes in $H ⊗ E$ extend across the inner piece. Section 7 will determine the inner coordinate of each integral extension.

=== 6.1 The circle collapse <the-circle-collapse>

#thm([Lemma 6.1.])[
  (inner homology and acyclic total).  #emph[There are natural identifications 
#[#set math.equation(numbering: n => "(6.1)")
 $ H_3 \( W \) = K \, #h(2em) H_2 \( W \) = H \/ pi_(*) D \, #h(2em) Psi : H_3 \( W \; bb(Z) \/ k \) arrow.r.hook D \/ k D . $ <eq:tube-11>]

 The large total $hat(cal(T))_s$ is acyclic.]
] <lem:acyclic>

#proof[
  Replace $h + P$ by $h$ on the inner piece using Lemma 8. The base-with-$w$ page is
  $ G = \( cal(B) ∩ { h = c } \) times { \| w \| lt.eq lambda } \, $
  and its root subpage $cal(D)$ is a page of $d$. For $R_s eq.not 0$, we retract the vertical hyperbola to a circle; over the root page, that circle collapses. We realize this model by balancing the two moduli inside the inner block. For fixed $\( p \, w \)$, write $A = \| y \|^2 \/ sigma^2$, $B = sigma^2 \| z \|^2$, so $A B = \| R_s \|^2$, and choose $sigma$ near $lambda^(\( alpha - beta \) \/ 2)$. For $0 lt.eq t lt.eq 1$, replace $A - B$ by $\( 1 - t \) \( A - B \)$ while retaining $A B$ and the circle angle. The positive solution for $A \, B$ is continuous at $R_s = 0$; on an axis it shrinks the active coordinate to zero. Both moduli stay between their starting and final values. Since $max \| R_s \| lt.eq \( 1 + o \( 1 \) \) lambda^k$, the core $\| y \| = sigma sqrt(\| R_s \|)$, $\| z \| = sigma^(- 1) sqrt(\| R_s \|)$ stays strictly within the $M$-bounds. This is a deformation retraction, relative to the constant-angle section, onto
  #[#set math.equation(numbering: n => "(6.2)")
   $ X \( G \, cal(D) \) = \( G times S^1 \) \/ \( { g } times S^1 upright(" collapsed for each ") g in cal(D) \) . $ <eq:tube-12>]
  The constant-angle section splits off the homology of $G$. Quotienting that section gives $\( G \/ cal(D) \) and S^1$, so the remaining homology is $H_(* - 1) \( G \, cal(D) \)$, naturally for moving roots. The spaces $G$ and $cal(D)$ are connected and have only first reduced homology. Their relative long exact sequence therefore gives
  $ 0 arrow.r H_2 \( G \, cal(D) \) arrow.r D arrow.r^(pi_(*)) H arrow.r H_1 \( G \, cal(D) \) arrow.r 0 . $
  Thus the underlying groups are $H_3 \( W \) tilde.equiv K$ and $H_2 \( W \) tilde.equiv H \/ pi_(*) D$. We next fix the signs of these identifications and of the mod-$k$ injection; these signs determine the residue condition in Theorem 6.
  Orient this $S^1$ by increasing $arg y$. For an arc $I$ from $w_0$ to a root, use the circle-first orientation $\[ S_y^1 \] times I$ on its sweep; the collapsed root end leaves boundary $+ gamma$ at $w_0$. Write $frak(S) \( C \) = \[ S_y^1 \] times C$ for circle-first suspension. The cross-product boundary rule gives
  $ partial frak(S) \( C \) = - frak(S) \( partial C \) \, #h(2em) frak(S) \( a_0 times I \) = - a_0 times \( \[ S_y^1 \] times I \) $
  in a product chart over an oriented base interval $a_0$, with its endpoint faces taken relatively. The root part of the boundary of $a_0 times I$ is $- \[ a_(0 \, upright("root")) \]$; write $partial_(cal(D))$ for this root-endpoint boundary, and for the resulting relative connecting map on relative cycles. Define $Psi$ as the #emph[negative] of the relative root-endpoint connecting map under this circle-first suspension, namely $- partial_(cal(D)) frak(S)^(- 1)$. Thus the local chain $- a_0 times \( S_y^1 times I \)$ has signed root contribution $+ \[ a_(0 \, upright("root")) \]$. The interval endpoint faces and the remaining $w_0$-boundary must cancel before a homology class is defined. The next section supplies this cancellation by a lens chain with a cap at the seam, whose local root vector is diagonal. Then $Psi$ applies to the resulting mod-$k$ class with the sign just computed; no individual root is assumed to close around the whole base loop. This fixes the sign of $Psi$ throughout. We use the same suspension convention for $H_3 \( W \) = K$. In degree two, identify $H_2 \( W \)$ with $H \/ pi_(*) D$ by the negative of circle-first unsuspension. Künneth products on $J tilde.eq cal(H) times L$ are ordered with the base factor first: for a closed oriented base loop $a$, $\[ a times gamma \] = - frak(S) \( a \)$. This normalization therefore sends the interface torus $\[ a times gamma \]$ to $+ a med mod med pi_(*) D$. The quotient is defined on $H \/ k H$ because $k H subset.eq pi_(*) D$, by $pi_(*) pi^(!) = k$. With $bb(Z) \/ k$ coefficients, the same relative sequence injects $H_2 \( G \, cal(D) \; bb(Z) \/ k \)$ into $H_1 \( cal(D) \; bb(Z) \/ k \) = D \/ k D$. Under suspension, the signed injection from $H_3 \( W \; bb(Z) \/ k \)$ is the negative relative boundary just fixed, namely $Psi$ in (6.1).
  It remains to prove acyclicity of the large total. The same collapse argument for total disks first shows that $hat(W)$ is acyclic, because the total tubes of $h \, d$ are acyclic. We control the exterior attachment using the explicit contraction of the cone model.
  At $s = 0$, put $d_P = 1 + a alpha = 1 + b beta$. The explicit contraction
  #[#set math.equation(numbering: n => "(6.3)")
   $ \( X \, T \; y \, z \, w \) mapsto #scale(x: 120%, y: 120%)[\(] t^(2 \/ 5) X \, t^(1 \/ 5) T \; med t^(alpha \/ d_P) y \, t^(beta \/ d_P) z \, t^(1 \/ d_P) w #scale(x: 120%, y: 120%)[\)] \, #h(2em) 0 lt.eq t lt.eq 1 \, $ <eq:tube-12a>]
  scales both $h$ and $P$ by $t$, and scales both $y z$ and $w^k$ by $t^(k \/ d_P)$. It preserves the base ball, its $\| h \|$-cut, the vertical block cuts, and the $\| h + P \|$-cut. Hence $hat(cal(T))_0$ and its inner part are contractible. Mayer–Vietoris therefore makes $hat(J)_0 arrow.r hat(M)_(upright("ext") \, 0)$ a homology equivalence. Transport by Lemma 8 gives the same statement at positive $s$. Attaching the acyclic $hat(W)$ along $hat(J)$ leaves $hat(cal(T))_s$ acyclic. ◻
]

=== 6.2 Comparison with an ordinary Milnor tube <comparison-with-an-ordinary-milnor-tube>

Acyclicity lets us identify page homology through relative homology: for an acyclic total, the connecting map identifies relative $H_4$ with page $H_3$. We compare the large and ordinary total/page pairs first, retaining the filling chains that determine the ordered form.

#thm([Lemma 6.2.])[
  (The large tube computes the local page).  #emph[The middle homology and filling pairing of the page of (5.2) are naturally those of a sufficiently small ordinary Milnor representative of $f_s$.]
] <lem:local>

#proof[
  Fix $s > 0$ after Lemmas 7 and 9. In a holomorphic chart on the smooth germ $C_s$, choose a closed ordinary Milnor ball $B_(upright(m))$ inside the interior of every outer cut of $X_s$. Choose $0 < delta' lt.eq delta$ so that its sphere is transverse to all fibers over ${ \| v \| lt.eq delta' }$. The corresponding ordinary analytic total
  $ hat(N)_s = B_(upright(m)) ∩ f_s^(- 1) \( { \| v \| lt.eq delta' } \) $
  is contractible; this is the ordinary tube consequence of Milnor’s proof recorded in #cite(label("Massey2015LeCycles")) Theorem 1.8 and Remark 1.9. It does not apply by itself to the custom outer cuts.
  Let $hat(cal(T))'_s$ be the large total with value radius $delta'$, and set
  $ hat(A)_s = \( X_s \\ "int" B_(upright(m)) \) ∩ f_s^(- 1) \( { \| v \| lt.eq delta' } \) \, #h(2em) hat(S)_s = partial B_(upright(m)) ∩ f_s^(- 1) \( { \| v \| lt.eq delta' } \) . $
  Write $N_s \, A_s \, S_s \, cal(T)'_s$ for the corresponding pages at a fixed $\| c' \| = delta'$. Stratify $hat(A)_s$ by the genuine outer faces and the new Milnor-sphere face. The auxiliary cut $J$ remains ordinary interior in this comparison. Lemma 7 gives rank two on the outer strata over the whole disk, the Milnor choice gives it on the sphere, and Lemma 9 gives it in the intervening interior. The cuts are compact, so $f_s$ is a proper stratified submersion on $hat(A)_s$ and on $hat(S)_s$ over this disk, stratified by its interior and boundary circle. The face-preserving Ehresmann argument over the contractible disk therefore makes $A_s arrow.r.hook hat(A)_s$ and $S_s arrow.r.hook hat(S)_s$ homotopy equivalences. Their relative homology groups vanish. Relative Mayer–Vietoris for
  $ \( hat(cal(T))'_s \, cal(T)'_s \) = \( hat(N)_s \, N_s \) med union med \( hat(A)_s \, A_s \) \, #h(2em) \( hat(N)_s \, N_s \) ∩ \( hat(A)_s \, A_s \) = \( hat(S)_s \, S_s \) $
  now identifies the large total/page relative homology with the ordinary local one.
  The disk-wide outer regularity and isolation away from value zero also permit the large radius to shrink from $delta$ to $delta'$ through all positive intermediate radii: horizontal collar fields are tangent to every outer face and vanish near the critical region. Lemma 10 proves that $hat(cal(T))_s$ is acyclic at the original radius; this isotopy therefore makes $hat(cal(T))'_s$ acyclic. The ordinary total $hat(N)_s$ is contractible as above. The connecting maps in the relative long exact sequences of these two acyclic totals identify their relative $H_4$-groups with the page $H_3$-groups, proving the homology assertion. A local filling can be used unchanged in the large total. Transporting the two page cycles from the smaller to the original value circle along two disjoint angular rays adds collars at disjoint complex values, hence no new intersections. Thus the filling pairing is identical. ◻
]

=== 6.3 The signed exterior cut <the-signed-exterior-cut>

For the gluing, the inner page has middle group $K$, and a boundary torus $\[ a times gamma \]$ dies there precisely when $a in pi_(*) D$. We next compute the boundary torus carried by an exterior cycle.

The exterior page admits a useful two-sided cut. We normalize the value $c$ to lie on the positive real axis; the picture shows the $q = h$ value disk, not the spatial cone block.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-4.15, 1.5), (4.3, 1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((4.3, 1.5), [$"Re" (q"/"c)$], anchor: "west", padding: 0.1176cm)
  line((-2, 1.4), (-2, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2, 1.6), [$0$], anchor: "south", padding: 0.1176cm)
  line((0, 1.4), (0, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 1.6), [$1"/"2$], anchor: "south", padding: 0.1176cm)
  line((2, 1.4), (2, 1.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, 1.6), [$1$], anchor: "south", padding: 0.1176cm)
  rect((-4, 0), (0, 1), fill: rgb("#e6e6ff"), stroke: none)
  rect((0, 0), (4, 1), fill: rgb("#ffebd6"), stroke: none)
  rect((-4, 0), (4, 1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, -0.07), (0, 1.15), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((-2, 0.53), [$P=c-q != 0$#linebreak()side retracts to $Q$])
  content((2, 0.53), [radial contraction#linebreak()stops at $partial Y_ lambda$])
  content((0, -0.12), [overlap $tilde.eq cal(H) times Q$], anchor: "north", padding: 0.1176cm)
  line((2, -0.07), (2, -0.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2, -0.75), [$J tilde.eq cal(H) times L$#linebreak()attaches to inner $W$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The exterior cut uses $q = h$, with the full page equation $P = c - q$, shown by its real-part projection. The left side keeps $P$ away from zero; the right side retracts to the actual interface $J$ by stopping weighted radial contraction at $partial Y_lambda$, where $P$ need not vanish. The interface continuation identifies $J$ with $cal(H) times L$. The overlap-to-$J$ map is $upright("id")_(cal(H)) times \( Q arrow.r L \)$. This is schematic: the disk radius $epsilon$ and point $c$ are not to scale. ],
) <fig:split>

#thm([Lemma 6.3.])[
  (Mayer–Vietoris boundary).  #emph[The full page has an exact sequence 
#[#set math.equation(numbering: n => "(6.4)")
 $ 0 arrow.r K arrow.r H_3 \( cal(T)_s \) arrow.r^partial H ⊗ E arrow.r^(overline(1 ⊗ tau)) H \/ pi_(*) D . $ <eq:tube-13>]

 The image of the exterior page in $H_3 \( cal(T)_s \)$ maps isomorphically under $partial$ to $H ⊗ ker tau$.]
] <lem:mv>

#proof[
  Use Lemma 8 to compute the exterior at $s = 0$. Normalize $c > 0$, and put $q = h$. Cut at $"Re" q = c \/ 2$, as in Figure 1, calling the left and right pieces $A$ and $B$, respectively. On $A$, $\| P \| = \| c - q \| gt.eq c \/ 2$, so the removed inner block is absent. The allowed $P$-values form a convex region avoiding zero, and the boundary estimates of Lemma 7 trivialize its $P$-pages with their outer cuts. Contracting the base by the positive weights of $h$ and carrying these pages through the trivialization retracts $A$ to $Q$.
  On $B$, choose one boundary-respecting trivialization of the $h$-pages over the convex regular-value region ${ \| q \| lt.eq epsilon \, med "Re" q gt.eq c \/ 2 }$. It can agree near $c$ with the page labels used in Lemma 8. For $v = \( y \, z \, w \)$, define the radius of its block by
  $ r \( v \) = max {\( \| y \| \/ M \)^(1 \/ alpha) \, med \( \| z \| \/ M \)^(1 \/ beta) \, med \| w \|} . $
  The exterior condition is $lambda lt.eq r \( v \) lt.eq rho$. Scale $v$ by the cone weights, from $t = 1$ down to $t = lambda \/ r \( v \)$, while retaining its $h$-page label and setting
  $ v_t = \( t^alpha y \, t^beta z \, t w \) \, #h(2em) q_t = c - t^(d_P) P \( v \) = \( 1 - t^(d_P) \) c + t^(d_P) q \, #h(2em) d_P = 1 + a alpha . $
  This keeps $lambda lt.eq r \( v_t \) lt.eq rho$, and $q_t$ stays in the same convex $h$-region. The base-ball cut is preserved by the trivialization. The homotopy therefore stays in $B$ and stops at the actual interface $J$, fixing $J$ pointwise. At its endpoint $v_L in L$, the value is $q = c - P \( v_L \)$, generally different from $c$. The $s = 0$ interface continuation of Lemma 8 retains $v_L$ and the base label while changing this value to $c$. It identifies the retract with $cal(H) times L$.
  The seam values form the contractible interval $I = { q = c \/ 2 + i u : \| q \| lt.eq epsilon }$. Trivializing both page factors along $I$ identifies the overlap $C = A ∩ B$ with $cal(H) times Q times I$. After contracting $I$, its map to $J tilde.eq cal(H) times L$ is homotopic to $upright("id")_(cal(H)) times \( Q arrow.r L \)$, where $Q arrow.r L$ is weighted radial projection. Both $cal(H) \, Q$ have homotopy dimension one, so overlap $H_3 = 0$, while overlap $H_2 = H ⊗ E$. Moreover $H_2 \( J \) = H ⊗ bb(Z) \/ k = H \/ k H$ and $H_3 \( J \) = bb(Z)$. The latter generator maps to zero in $H_3 \( W \) = K$: it is the full inner fiber over a regular base point, whose $H_3$ vanishes in the collapse model. We record the orientation of the remaining interface map. For a full-page 3-cycle write its exterior chain as $e = e_A + e_B$, with the inner chain $w$ satisfying $partial w = b_J \, med partial e = - b_J$. Define $t_C = - partial e_A in Z_2 \( C \)$. Then
  #[#set math.equation(numbering: n => "(6.5)")
   $ partial e_B = t_C - b_J \, #h(2em) z := \[ t_C \] in H_2 \( C \) = H ⊗ E . $ <eq:mv-cut-chain>]
  This fixes the sign of the Mayer–Vietoris coordinate. Let $r_t : C arrow.r B$, $0 lt.eq t lt.eq 1$, be the stopped radial homotopy just constructed, reparametrized to end in $J$. Its endpoint is the actual interface, with the same $h$-page label under the compatible parameter rectangle. For the cycle $t_C$, the interval-first prism chain $S = r_(*) \( \[ 0 \, 1 \] times t_C \)$ has $partial S = r_(1 *) t_C - t_C$. Consequently
  #[#set math.equation(numbering: n => "(6.6)")
   $ partial \( e_B + S \) = r_(1 *) t_C - b_J \, #h(2em) \[ b_J \] = r_(1 *) \[ t_C \] = \( 1 ⊗ tau \) z quad upright("in ") H_2 \( J \) = H \/ k H . $ <eq:mv-strip>]
  Under the degree-two normalization fixed after (6.2), this is the positive sign of the last arrow in (6.4). The Mayer–Vietoris sequence now gives (6.4), with final map the quotient of $1 ⊗ tau$. Before $W$ is attached, exterior $H_3$ differs from its $H ⊗ ker tau$ contribution by precisely the image of $H_3 \( J \)$; that image dies after attachment. This proves the last statement. ◻
]

== 7 The mod-four Bockstein and the exact lattice <sec:integral-lattice>

The signed cut determines whether an exterior coordinate extends, but an integral extension may have a fractional $K_(bb(Q))$-coordinate. We determine that coordinate from the torsion boundary in $H_2 \( J \)$. Write $beta_(upright("Bock")) : H_3 \( J \; bb(Z) \/ k \) arrow.r H_2 \( J \)$ for the coefficient Bockstein, using the same notation on restricted interfaces below. Our convention is

$ beta_(upright("Bock")) \[ overline(C) \] = \[ partial C \/ k \] $

when $C$ is an integral lift of a mod-$k$ cycle $overline(C)$. Under (6.1), the signed root boundary views a class of $H_3 \( W \; bb(Z) \/ k \)$ in $D \/ k D$. Let $i = i_W : J arrow.r.hook W$ be the inclusion. We also write $pi^(!)$ for the induced map $H \/ k H arrow.r D \/ k D$; it is well defined because $pi^(!) \( k H \) subset.eq k D$.

#thm([Lemma 7.1.])[
  (Bockstein equals finite-map transfer).  #emph[For $b in H \/ k H = H_2 \( J \)$, and any $eta in H_3 \( J \; bb(Z) \/ k \)$ with $beta_(upright("Bock")) eta = b$, 
#[#set math.equation(numbering: n => "(7.1)")
 $ Psi \( i_(*) eta \) = pi^(!) b med \( mod med k D \) \, $ <eq:tube-14>]

 with the orientation of $Psi$ fixed after (6.2).]
] <lem:bock>

#proof[
  First note that the ambiguity in $eta$ is reduction of an integral class in $H_3 \( J \) = bb(Z)$, and this class dies in $H_3 \( W \)$ by Lemma 12; thus the left-hand side is unambiguous. It suffices to test on loops in $cal(H)$ avoiding the finite branch discriminant. Take $w_0 = lambda \/ 2$, with every root in $\| w \| < lambda \/ 4$. On the $theta = 0$, $h = c$ model of the interface lens fiber, for $p in cal(H)_c$ the $y$-angle loop
  $ gamma_p = { w = w_0 \, med y = M lambda^alpha e^(i phi.alt) \, med z = R_s \( p \, w_0 \) \/ y } $
  is the positive generator of $H_1 \( L \) = bb(Z) \/ k$. Indeed, at $s = 0$ the quotient $\( U \, V \) mapsto \( U^k \, V^k \, U V \)$ lifts one positive turn of the $y$-angle to a path ending at the deck transform $\( U \, V \) mapsto \( omega U \, omega^(- 1) V \)$, where $omega = e^(2 pi i \/ k)$. This generates the deck group. The anchored $s$-continuation preserves the same oriented loop. Let $tilde(gamma)_p$ denote its image on the actual $f_s = c$ interface under the explicit lift in Lemma 8. That lift preserves the $h$-page label $p$, $w_0$, and the exact $y$-angle, though physical $p$ moves. We compute below in the $theta = 0$ model and transport all relative classes to the actual $J$ and $W$ by this isotopy. In the model, the exact sequence of the pair $\( L \, gamma_p \)$ reads
  $ 0 = H_2 \( L \) arrow.r H_2 \( L \, gamma_p \) arrow.r^partial H_1 \( gamma_p \) = bb(Z) arrow.r H_1 \( L \) = bb(Z) \/ k . $
  It supplies a unique relative class $S_p$ with $partial S_p = k gamma_p$.
  Let $F_p$ be the inner $y z = R_s \( p \, w \)$ fiber above a regular $p$, and let $r_1 \, dots.h \, r_k$ be the roots in the $w$-disk $Delta$. Let $X_p = X \( Delta \, { r_1 \, dots.h \, r_k } \)$ be its balanced collapse core, and let $gamma_p^(upright("core"))$ be the circle over $w_0$ in that core. The balancing retraction does not fix the outer circle $gamma_p$ pointwise. It gives a map of pairs
  $ r_p : \( F_p \, gamma_p \) arrow.r \( X_p \, gamma_p^(upright("core")) \) $
  that is an absolute homotopy equivalence and restricts to the orientation-preserving circle homeomorphism retaining the $y$-angle. The long exact sequences of the two pairs therefore show that $r_p$ induces an isomorphism on relative homology. The constant-angle section of $X_p$ is a disk meeting $gamma_p^(upright("core"))$ in one point. Adjoining that disk to the relative subspace does not change relative homology; quotienting it and $gamma_p^(upright("core"))$ gives the circle suspension of $Delta \/ \( { r_1 \, dots.h \, r_k \, w_0 } \)$. Hence there is a natural isomorphism
  #[#set math.equation(numbering: n => "(7.2)")
   $ H_2 \( F_p \, gamma_p \) & tilde.equiv H_1 \( Delta \, { r_1 \, dots.h \, r_k \, w_0 } \)\
 & tilde.equiv { \( a_1 \, dots.h \, a_k \, a_0 \) in bb(Z)^(k + 1) : a_1 + dots.h.c + a_k + a_0 = 0 } . $ <eq:tube-15>]
  Use $r_p$ to identify the oriented boundary classes of $gamma_p$ and $gamma_p^(upright("core"))$ in this calculation. The class of an arc from $w_0$ to $r_i$, swept by the $y$-angle, has root coefficient $+ 1$ and $gamma_p$-boundary $+ 1$, fixing the convention. The image of $S_p$ has $a_0 = - k$. To compute this one fiber class, let $r_i \( t \)$, $0 lt.eq t lt.eq 1$, be any braid of distinct roots in $\| w \| < lambda \/ 4$, starting at the roots of $R_s \( p \, dot.op \)$ and returning to the same unordered root set. Put $Q_t \( w \) = product_(i = 1)^k \( w - r_i \( t \) \)$, so $Q_1 = Q_0$, and consider the compact fibers $F_t = { y z = Q_t \( w \) } ∩ Y_lambda$, their boundaries $L_t$, and the circles $gamma_t$ defined by the same $w_0$ and $y$-angle formula as $gamma_p$, with $R_s \( p \, w_0 \)$ replaced by $Q_t \( w_0 \)$. Choose a smooth disk velocity $v_t \( w \)$, supported in $\| w \| < lambda \/ 4$, equal to $dot(r)_i \( t \)$ near each moving root. Then
  $ ell_t \( w \) = frac(dot(Q)_t \( w \) + Q'_t \( w \) v_t \( w \), Q_t \( w \)) $
  extends smoothly across the roots. Indeed, near $r_i \( t \)$, writing $Q_t = \( w - r_i \) B_(i \, t)$ gives $ell_t = \( dot(B)_(i \, t) + dot(r)_i B'_(i \, t) \) \/ B_(i \, t)$, with $B_(i \, t) eq.not 0$.
  The $y$- and $z$-faces of these fibers never meet, since $\| Q_t \( w \) \| lt.eq \( 5 lambda \/ 4 \)^4 < M^2 lambda^4$. Choose a smooth real cutoff $chi$, depending on $\| y \|^2 \, \| z \|^2$, that is zero near the $y$-face and one near the $z$-face. The time-dependent lift
  $ dot(w) = v_t \( w \) \, #h(2em) dot(y) = chi "Re" \( ell_t \) y \, #h(2em) dot(z) = #scale(x: 120%, y: 120%)[\(] ell_t - chi "Re" \( ell_t \) #scale(x: 120%, y: 120%)[\)] z $
  is smooth also at the roots and axes, and differentiation gives $frac(d, d t) \( y z - Q_t \( w \) \) = ell_t \( y z - Q_t \( w \) \)$. It is tangent to the $y$-face because $dot(y) = 0$ there, to the $z$-face because the coefficient of $z$ is purely imaginary there, and to the $w$-face because $v_t = 0$ there; these statements also cover all corners. Compactness therefore gives transport of the full triples $\( F_t \, L_t \, gamma_t \)$. On $gamma_t$, it fixes $w_0$ and $y = M lambda^alpha e^(i phi.alt)$ exactly, and gives $dot(z) = dot(Q)_t \( w_0 \) \/ y$. Thus the return fixes the parametrized circle $gamma_p$ pointwise.
  The return maps of $\( L \, gamma_p \)$ and $\( F_p \, gamma_p \)$ commute with inclusion. The former fixes the unique class $S_p$ with boundary $k gamma_p$; hence the latter fixes its image in $H_2 \( F_p \, gamma_p \)$. To compute that same return map in (7.2), observe that the lift covers the disk flow $psi_t$ of $v_t$ and preserves the $y$-angle wherever defined. It therefore intertwines the balancing collapses with the map $\( w \, e^(i phi.alt) \) mapsto \( psi_t \( w \) \, e^(i phi.alt) \)$ on the circle models; collapsed root fibers are carried to collapsed root fibers. The endpoint isomorphism in (7.2) consequently sends its action to the permutation of the root coefficients $a_i$, with $a_0$ fixed. Every root permutation is available, and no additional term can occur because the endpoint map is an isomorphism. Invariance of the image of $S_p$, together with $a_0 = - k$, now gives $a_1 = dots.h.c = a_k = 1$. Reducing $S_p$ modulo $k$ closes its boundary and yields the diagonal root vector in the absolute mod-$k$ collapse homology.
  Now work over an oriented base loop $a subset cal(H)_c$ missing branch values, still in the $theta = 0$, $h = c$ model. Write $cal(D)_a = pi^(- 1) \( a \)$. Let $W_a$ be the restriction of the inner family $F_p$ to $p in a$, and let $J_a subset W_a$ be its restricted lens-interface family, with inclusion $i_a : J_a arrow.r.hook W_a$. The compatible isotopy of Lemma 8 transports their inclusions to the actual pieces $J subset W$; the vertical maps below use this transport. The same circle-first suspension and negative relative root boundary define
  $ Psi_a : H_3 \( W_a \; bb(Z) \/ k \) arrow.r H_1 \( cal(D)_a \; bb(Z) \/ k \) . $
  The target remains the root homology in the $h$-model, with its inclusion into $H_1 \( cal(D) \; bb(Z) \/ k \)$. The actual covering monodromy over $a$ may be a smaller braid subgroup, with several orbits. Over a small arc $I subset a$, the same transport tracks roots and preserves the circle angle. Collapse relative to the constant-angle section, take the relative root boundary, and slice over $\( I \, partial I \)$. Each operation is natural under this product trivialization: on chains its relative map is the fiber operation times $\[ I \, partial I \]$. Restriction and inclusion give the following naturality diagram:
  #[#set math.equation(numbering: n => "(7.3)")
   $ H_3 \( J_a \; bb(Z) \/ k \) & arrow.r^(i_(a *)) & H_3 \( W_a \; bb(Z) \/ k \) & arrow.r^(Psi_a) & H_1 \( cal(D)_a \; bb(Z) \/ k \)\
arrow.b &  & arrow.b &  & arrow.b\
H_3 \( J \; bb(Z) \/ k \) & arrow.r^(i_(*)) & H_3 \( W \; bb(Z) \/ k \) & arrow.r^Psi & H_1 \( cal(D) \; bb(Z) \/ k \) . $ <eq:tube-16>]
  The common orientation of the normal circle fixes the sign of the two right-hand maps. The fiber endpoint calculation gives the diagonal root vector after slicing the top row at $p$. We construct a Bockstein lift on $J_a$ by first closing a swept chain at the seam. The anchored circles trace the base-first torus $a times gamma_p$ over $a$. Cut $a$ at one point, choose a representative $S_0$ of $S_p$ with $partial S_0 = k gamma_p$, transport it along the resulting interval, and call its endpoint $S_1$. The anchored circle is fixed at the seam, so $partial S_0 = partial S_1 = k gamma_p$. Uniqueness of the relative class makes $S_1 - S_0$ a null-homologous $2$-cycle in $L$; choose a seam cap $C_a$ with $partial C_a = S_1 - S_0$, using $H_2 \( L \) = 0$. Let $T_a$ be the interval-first sweep. Then
  $ partial T_a = S_1 - S_0 - k \( a times gamma_p \) \, #h(2em) partial \( T_a - C_a \) = - k \( a times gamma_p \) . $
  The second boundary is divisible by $k$, so the reduction is a cycle. Set
  $ eta_a = - \[ \( T_a - C_a \) med mod med k \] in H_3 \( J_a \; bb(Z) \/ k \) \, $
  and let $eta$ be its image in $H_3 \( J \; bb(Z) \/ k \)$ under inclusion and transport. The Bockstein convention gives $beta_(upright("Bock")) eta_a = \[ a times gamma_p \]$ on $J_a$, and $beta_(upright("Bock")) eta = \[ a times gamma_p \]$ on $J$, with the torus transported in the second identity. Changing the cap changes $eta_a$ by the reduction modulo $k$ of an integral class from $H_3 \( L \)$, and changes $eta$ by its image. The integral class maps to zero in $H_3 \( W \)$ by the fiber calculation used in Lemma 12, so its mod-$k$ image dies as well. Thus both $Psi i_(*) eta$ and the full transfer $pi^(!) \[ a \]$ are images of classes in $H_1 \( cal(D)_a \; bb(Z) \/ k \)$. Choose the slice away from the seam. Slicing at $p in a$ sends each oriented component circle of the unramified cover $cal(D)_a arrow.r a$ to the sum of the roots in its monodromy orbit. Distinct orbits have disjoint supports, so this slice map is injective on $H_1 \( cal(D)_a \; bb(Z) \/ k \)$. The fiber calculation gives the diagonal root vector for $Psi_a i_(a *) eta_a$, and the full transfer has the same vector. Their classes agree already in $H_1 \( cal(D)_a \; bb(Z) \/ k \)$, hence in $D \/ k D$. Such base loops generate $H_1 \( cal(H) \)$, proving (7.1). ◻
]

We now define the rational coordinates of an integral page class. For $x in H_3 \( cal(T)_s \)$, let $z = partial x$ and $b = \( 1 ⊗ tau \) z in H \/ k H$. Since $k z in H ⊗ ker tau$, Lemma 12 supplies a unique $x_(upright("ext")) \( k z \)$ in the exterior image with coordinate $k z$. Define

$ u := k x - x_(upright("ext")) \( k z \) in K \, #h(2em) x mapsto \( u \/ k \, z \) in K_(bb(Q)) xor \( H ⊗ E \)_(bb(Q)) . $

We call $u$ the integral numerator of the inner coordinate. The Bockstein lemma supplies $+ pi^(!) b$; the cap calculation below shows that subtracting the interface cap gives the numerator residue $u equiv - pi^(!) b med \( mod med k D \)$.

#thm([Lemma 7.2.])[
  (integral extension).  #emph[In these rational coordinates, the image of $H_3 \( cal(T)_s \)$ is exactly the lattice 
$ Lambda_pi = {\( "pr" l \, z \) : l in D \, med z in H ⊗ E \, quad pi_(*) l med mod med k H = \( 1 ⊗ tau \) z} subset K_(bb(Q)) xor \( H ⊗ E \)_(bb(Q)) $

 from (4.1), where $"pr" l = l - k^(- 1) pi^(!) pi_(*) l$.]
] <lem:lattice>

#proof[
  Fix $x$, with $z \, b \, u$ as above. Orient $J$ as the outgoing boundary of $W$, and represent $x$ by page chains $w in C_3 \( W \)$ and $v in C_3 \( M_(upright("ext")) \)$ with $partial w = b_J$ and $partial v = - b_J$. The oriented prism calculation (6.5)–(6.6) gives $\[ b_J \] = b = \( 1 ⊗ tau \) z$ in $H_2 \( J \) = H \/ k H$. Because this group is killed by $k$, choose an integral $A in C_3 \( J \)$ with $partial A = k b_J$. Write $i_(upright("ext")) : J arrow.r.hook M_(upright("ext"))$ for the exterior inclusion. The chains
  #[#set math.equation(numbering: n => "(7.4)")
   $ w_k := k w - i_(W *) A \, #h(2em) v_k := k v + i_(upright("ext") *) A $ <eq:tube-16a>]
  are closed in their respective pieces. Their sum in the full page is $k x$: the two copies of $A$ cancel on $J$. The exterior class $\[ v_k \]$ has second coordinate $k z$, hence is $x_(upright("ext")) \( k z \)$ in the full page; its possible $H_3 \( J \)$ ambiguity dies after attaching $W$. Consequently $u = \[ w_k \] in K$. Modulo $k$, $\[ w_k \] = - i_(W *) \[ A med mod med k \]$. The coefficient convention gives $beta_(upright("Bock")) \[ A med mod med k \] = \[ partial A \/ k \] = \[ b_J \] = b$. With the $Psi$ orientation fixed after (6.2), Lemma 13 gives $Psi i_(*) \[ A med mod med k \] = + pi^(!) b$. The preceding minus sign in $\[ w_k \] = - i_(W *) \[ A med mod med k \]$ therefore gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ u equiv - pi^(!) b med \( mod med k D \) . $ <eq:tube-17>]
  Choose $b_H in H$ lifting $b$ and put $l = \( u + pi^(!) b_H \) \/ k$. The congruence makes $l in D$, and $pi_(*) l = b_H$, $"pr" l = u \/ k$. Conversely, if $l \, z$ obey the condition in (4.1), the last arrow of (6.4) kills $z$. Choose any $x$ with that $z$, and put
  $ u_x := k x - x_(upright("ext")) \( k z \) in K \, #h(2em) u_l := k l - pi^(!) pi_(*) l in K . $
  Here $u_x$ is the integral numerator of the rational inner coordinate $u_x \/ k$. By (7.5), $u_x - u_l in K ∩ k D$. This intersection equals $k K$: if $k v in K$ for $v in D$, then $k pi_(*) v = 0$, and $H$ is torsion free, so $v in K$. Adjust $x$ by $\( u_l - u_x \) \/ k in K$ through the first arrow of (6.4). The adjusted class has rational coordinate $\( "pr" l \, z \)$. Thus every pair in (4.1) occurs. Replacing $b_H$ by $b_H + k h$ changes $l$ by $pi^(!) h$ and does not change $"pr" l$, so the coordinate description is independent of the lift. ◻
]

We have now located every integral page class in $K_(bb(Q)) xor \( H ⊗ E \)_(bb(Q))$. The residue condition in (4.1) retains the particular projection $pi_(*)$; an abstract isometry of the two plane Seifert lattices does not identify it. It remains to compute the ordered filling form on this exact lattice.

== 8 The two filling summands <sec:filling-summands>

The integral lattice is now fixed by (4.1). We compute its ordered filling form on the two rational summands, first by separating inner and exterior fillings and then by examining the normal disks of an inner filling. Throughout, the first filling bounds the first cycle on the reference page, and the second bounds the positive neighboring-page transport of the second cycle. The boundary continuations preserve these complex page values and arise from oriented ambient isotopies, so they preserve this order and the intersection numbers.

#thm([Lemma 8.1.])[
  (orthogonality and exterior form).  #emph[The $K_(bb(Q))$ and $\( H ⊗ E \)_(bb(Q))$ summands are orthogonal for the tube filling form. The second summand has form $s_h ⊗ e$.]
] <lem:exterior>

#proof[
  The inner classes bound in the acyclic $hat(W)$. For an exterior page class representing an element of $H ⊗ ker tau$, its image in $H_3 \( hat(M)_(upright("ext")) \)$ may be nonzero. The compatible sublevel continuations take $hat(J)$ to the product of the acyclic base total of $h$ with $L$. Its integral $H_3$ is therefore generated by one oriented lens fiber. Lemma 10 then gives $H_3 \( hat(J) \) tilde.equiv H_3 \( hat(M)_(upright("ext")) \) tilde.equiv bb(Z)$. Under the interface continuation, the inclusion $J arrow.r.hook hat(J)$ sends the oriented lens-fiber generator of $H_3 \( J \)$ to a generator of $H_3 \( hat(J) \)$. Subtract the corresponding integral multiple of the page-interface generator, which is zero in the full page. The adjusted exterior class bounds in $hat(M)_(upright("ext"))$. This can be done compatibly under a short value-circle transport arc. Put the two fillings on opposite sides of a bicollar of $hat(J)$; their interiors are then disjoint, proving orthogonality.
  Continue the exterior piece to $s = 0$. Its full lift to $\( U \, V \)$ lies off the cone vertex, where the cyclic map is an orientation-preserving unramified $k$-cover. Thus intersections of full lifts are $k$ times intersections downstairs. This covering count uses the original fillings off the cone vertex. In the contractible upstairs total, the filling pairing is unchanged when those fillings are replaced by the radial fillings used below. The smooth join calculation follows Sakamoto’s product formula #cite(label("Sakamoto1974")) Theorem 2, p. 715 and the product construction of #cite(label("KauffmanNeumann1977")); the cone extension and integral gluing were established here. The lifted cycles also live in the full smooth tube for $h + tilde(P)$, whose total is contractible by weights. Its page Mayer–Vietoris coordinate is $H ⊗ H_1 \( tilde(Q) \)$; the lift of $z in H ⊗ E$ has coordinate $\( 1 ⊗ "tr" \) z$. For pure tensors, represent this class by the join of loops in the two factor pages, varying their values as $\( t c \, \( 1 - t \) c \)$, $0 lt.eq t lt.eq 1$. It meets the equal-value cut in the product of the two loops. Fill the join by the two factor radial cone fillings with values in ${ \( t \, t' \) c : t \, t' gt.eq 0 \, med t + t' lt.eq 1 }$. The two ordered fillings meet only at the common origins of the factors because their neighboring rays are disjoint away from zero. Near each intersection they are products of two real 2-dimensional filling intersections. Their Koszul sign is $\( - 1 \)^(2 dot.op 2) = + 1$; any uniform join-orientation sign occurs in both fillings and cancels. Hence the upstairs form is $s_h ⊗ tilde(s)$. Division by $k$ gives $s_h ⊗ e$ downstairs. Since $k E subset.eq ker tau$, exterior classes span their rational summand, so the identity holds on all of it. ◻
]

The exterior calculation has now fixed both cross terms and the product form. The remaining calculation compares an inner filling with the plane filling that supplies its class in $K$.

#thm([Lemma 8.2.])[
  (the inner negative sign).  #emph[The restriction of the filling form to $K$ is $- s_d \|_K$.]
] <lem:inner>

#proof[
  Starting from two plane fillings, we build relative chains and sweep them by the normal circle at two distinct balancing radii. The sweeps will be separated away from the root locus, so each remaining intersection is an intersection of the plane fillings multiplied by the sign of two normal disks. We first construct the sweeps as filling chains and then compute that normal sign.
  Use the $h$-model of Lemma 8 over the value disk ${ \| v \| lt.eq delta }$. For $\| v \| lt.eq delta$, set
  $ G_v = \( cal(B) ∩ { h = v } \) times { \| w \| lt.eq lambda } \, #h(2em) hat(G) = \( cal(B) ∩ { \| h \| lt.eq delta } \) times { \| w \| lt.eq lambda } \, $
  and let $hat(cal(D)) = hat(G) ∩ { R_s = 0 }$ be its root total. By the selected plane cut calculation used in Lemma 10, $hat(cal(D))$ is acyclic; the same holds for $hat(G)$, the base total times a disk.
  Choose the initial chains as finite integral sums of mapped oriented simplices, piecewise smooth after compatible subdivision. The swept chains will be continuous at the conical strata described below and piecewise smooth elsewhere. Intersections mean transverse intersections of the maps on their smooth common contacts, counted with their integer coefficients; we retain set notation for their images. For two classes $l_1 \, l_2 in K$, take $c_1$ as the reference page and $c_2$ as its positive neighbor, and represent $l_i$ by cycles on the root page in $G_(c_i)$. Their images vanish in $H_1 \( G_(c_i) \)$ because $l_i in K = ker pi_(*)$. This vanishing and the acyclicity of $hat(cal(D))$ let us choose surface chains $Sigma_i subset hat(cal(D))$ with $partial Sigma_i = l_i$ and $V_i subset G_(c_i)$ with $partial V_i = - l_i$. Arrange $Sigma_1 \, Sigma_2$ transversely in the real four-dimensional $hat(cal(D))$, with generic $V_i$ and disjoint page-boundary collars. Since $H_2 \( hat(G) \) = 0$, the closed chain $Sigma_i + V_i$ bounds a $3$-chain $Gamma_i subset hat(G)$. Prescribe a collar of the $Sigma_i$-face on which $R_s = t gt.eq 0$ is a positive-real normal coordinate. Near $l_i$, make its normal lift tangent to $h = c_i$, possible because $\( h \, R_s \)$ is a submersion there, and join it to a collar of $V_i$. Keep these collars fixed. Perturb only the remaining interiors of $Gamma_1 \, Gamma_2$ relative to their boundary chains, and make
  $ I_i = \( Gamma_i \\ upright("prescribed collar") \) ∩ hat(cal(D)) $
  transverse there. Each $I_i$ is a real one-dimensional chain, with any endpoints on the prescribed $V_i$ contacts. Relative transversality gives $I_1 ∩ Sigma_2 = Sigma_1 ∩ I_2 = I_1 ∩ I_2 = diameter$: the respective dimension sums are $1 + 2 < 4$ and $1 + 1 < 4$. Separate their finite boundary contacts in the distinct page-value collars. Thus the only common root contacts are the prescribed $Sigma_1 ∩ Sigma_2$ intersections.
  Choose distinct $sigma_1 \, sigma_2$ sufficiently near $lambda^(\( alpha - beta \) \/ 2)$ that the strict balancing bounds in Lemma 10 hold for both; their circles then stay inside $Y_lambda$. Sweep each $Gamma_i$ by the $y$-angle using $\| y \| = sigma_i sqrt(\| R_s \|)$, $\| z \| = sigma_i^(- 1) sqrt(\| R_s \|)$, and $z = R_s \/ y$ away from the root. This is the chain-level relative suspension $C_3 \( hat(G) \, hat(cal(D)) \) arrow.r C_4 \( hat(W) \)$. To realize it by mapped chains, triangulate the domains compatibly with the prescribed collars, the transverse root curves, and their boundary faces. Sweep each oriented top simplex, collapse its circle over the root, and push the resulting top chain into $hat(W)$. The internal faces cancel with the original chain coefficients. The $Sigma_i$-face is zero in the relative complex, so it contributes no boundary after collapse. Write $frak(S)$ also for the circle-first suspension of Section 6 followed by this collapse and pushforward. Give the sweep the negative of the raw product orientation. In the relative quotient chain complex the two relevant signs are
  $ partial #scale(x: 120%, y: 120%)[\(] - frak(S) \( Gamma_i \) #scale(x: 120%, y: 120%)[\)] = + frak(S) \( V_i \) \, #h(2em) - partial_(cal(D)) V_i = l_i . $
  The second identity says that this boundary is the positive $K$-page class in the convention fixed after (6.2). The same reversal for both fillings does not change their intersection product.
  We now verify that the mapped sweeps have the claimed filling boundary at root contacts. Along the prescribed normal collar, the collapsed circle is the center of a disk. At an incidental transverse root curve $I_i$, the local quotient is $I_i times "cone" \( T^2 \)$: its torus link is closed and oriented. The oriented top simplices of a triangulated cone have cancelling internal faces, and its tip is not a codimension-one face; hence this local model contributes no additional chain boundary. The map extends continuously to $y = z = 0$ there.
  We next locate the intersections of the two sweeps. Where $R_s eq.not 0$, the sweeps are disjoint at a common base point because their $\| y \|$ differ. Where $R_s = 0$, their possible common contacts are $\( Sigma_1 union I_1 \) ∩ \( Sigma_2 union I_2 \) = Sigma_1 ∩ Sigma_2$. Thus all intersections occur above the prescribed transverse surface intersections. In particular, the conical tips over $I_i$ are disjoint from the other swept chain. A small general-position approximation in disjoint neighborhoods of those tips, fixed on the prescribed collars and with each boundary kept in its assigned page, preserves the filling classes and adds no intersections. Thus the filling intersection is computed entirely on the smooth prescribed collars. Only the intersection sign of the normal disks remains. In complex normal coordinates $y \, z$ there, each swept collar is the real disk $z = sigma_i^(- 2) overline(y)$. In real coordinates $y = x + i t$, its graph map has matrix $upright("diag") \( sigma_i^(- 2) \, - sigma_i^(- 2) \)$, so the ordered intersection determinant is
  $ det #scale(x: 120%, y: 120%)[\(] upright("diag") \( sigma_2^(- 2) \, - sigma_2^(- 2) \) - upright("diag") \( sigma_1^(- 2) \, - sigma_1^(- 2) \) #scale(x: 120%, y: 120%)[\)] = - \( sigma_2^(- 2) - sigma_1^(- 2) \)^2 < 0 . $
  Both collar disks have the same orientation relative to the complex $y$-orientation (both are reversed by the chosen sweep), so their common reversals cancel in the intersection product. Also, interchanging a disk past a root surface contributes $\( - 1 \)^(2 dot.op 2) = + 1$. Thus every root-surface intersection sign is reversed. The root-surface filling intersections are exactly $s_d \( l_1 \, l_2 \)$ by the common nearby-page convention, proving the lemma. Changing the uniform sign of the $K$-coordinate does not change this bilinear restriction. ◻
]

#emph[Proof of Theorem 6.] Lemmas 7, 8, and 9 provide a proper Milnor-model tube with a unique critical point. The acyclicity proved in Lemma 10 completes the comparison in Lemma 11, identifying its page and pairing with the ordinary local Milnor data. Lemmas 10, 12, 13, and 14 give the integral lattice (4.1), while Lemmas 15 and 16 give (4.2). 0◻

== 9 From the integral lattice to an embedded link <sec:fourfold-arithmetic>

We now compare the two actual Milnor lattices supplied by Theorem 6. Two boundary classes of the cone page give rational Seifert isometries that are integral at complementary sets of primes. We compare these two maps and use strong approximation to replace their local choices by one integral isometry. The final subsection then identifies the embedded links. Throughout, we use the full integral lattice formula, including its mod-four boundary condition and the signs of both filling forms.

The parameters $r \, n_0 \, n_1 \, a \, b \, alpha \, beta$ remain the single choice fixed in Lemma 4. Its analytic bounds are already available. We begin with the remaining divisibility facts and positive indices needed for the real-sign calculation.

#thm([Lemma 9.1.])[
  (Divisibility and positive indices).  #emph[For the parameters fixed in Lemma 4, put 
$ g = gcd \( a \, b \) \, #h(2em) m = 4 a b + a + b . $

 Then $a \, b equiv 2 med \( mod med 5 \)$, $5 divides.not g$, and $g gt.eq 2^(r - 1) > 5$. For each $q in { 1 \, 4 }$, there are positive integers $i \, j$ satisfying 
$ i equiv j med \( mod med 4 \) \, #h(2em) frac(b i + a j, m) = q / 5 . $

]
] <lem:parameter-indices>

#proof[
  Both $n_0 \, n_1$ are $2 med \( mod med 5 \)$, so $\( n_j^2 - 1 \) \/ 4 equiv 2 med \( mod med 5 \)$. Thus $a \, b equiv 2 med \( mod med 5 \)$ and $5 divides.not g$. Also $2^r divides n_j - 1$ and $2 divides n_j + 1$, whence $2^(r - 1) divides a \, b$ and $g gt.eq 2^(r - 1) > 5$.
  Write $a = g a'$, $b = g b'$, with $gcd \( a' \, b' \) = 1$. The desired index equations, on writing $i = j + 4 t$, become
  $ \( a' + b' \) j + 4 b' t = frac(q m, 5 g) . $
  Reduction modulo five gives $m = 4 a b + a + b equiv 0 med \( mod med 5 \)$; since $5 divides.not g$, we have $5 divides m \/ g$. Let $d = gcd \( a' + b' \, 4 b' \)$. The equality $gcd \( a' + b' \, b' \) = 1$ gives $d divides 4$, and $d$ also divides $m \/ g = 4 g a' b' + a' + b'$. Hence $d divides m \/ \( 5 g \)$, so the displayed equation has integer solutions for $q = 1 \, 4$. Its homogeneous solutions change $j$ by $4 b' \/ d$; choose a solution with $1 lt.eq j lt.eq 4 b' \/ d lt.eq 4 b'$. For $q = 1$,
  $ frac(m, 5 g) = frac(4 g a' b' + a' + b', 5) > 4 a' b' $
  because $g > 5$. Thus $i = \( q m \/ \( 5 g \) - a' j \) \/ b' > 0$ for both values of $q$. ◻
]

Put $k = 4$. For $nu in { 0 \, 1 }$ let $pi_nu : cal(D)_nu arrow.r cal(H)$ be the degree-$k$ map of plane-curve Milnor pages constructed above. Write

$ H & = H_1 \( cal(H) \; bb(Z) \) \, & D_nu & = H_1 \( cal(D)_nu \; bb(Z) \) \,\
K_nu & = ker \( pi_(nu *) : D_nu arrow.r H \) \, & "pr"_nu l & = l - 1 / k pi_nu^(!) pi_(nu *) l . $

The transfer identities are $pi_(nu *) pi_nu^(!) = k$ and $s_(d_nu) \( pi_nu^(!) x \, l \) = s_h \( x \, pi_(nu *) l \)$ in both argument orders. In particular $"pr"_nu$ projects rationally onto $K_nu$ along $pi_nu^(!) H_(bb(Q))$, orthogonally for the Seifert forms. The plane-curve argument has supplied an integral Seifert isometry

#[#set math.equation(numbering: n => "(9.1)")
 $ cal(I) : \( D_0 \, s_(d_0) \) arrow.r^(med tilde.op med) \( D_1 \, s_(d_1) \) \, $ <eq:arith-plane-isometry>]

and has shown that their monodromies are semisimple at eigenvalue $1$ and at primitive fifth roots. These facts are separate inputs to the present section.

Let $Q$ be a Milnor page of $P = w \( y^a + z^b \)$ on the cone $S = { y z = w^4 }$, let $E = H_1 \( Q \; bb(Z) \)$, and let $tau : E arrow.r H_1 \( "link" \( S \) \) = bb(Z) \/ 4$ be induced by weighted radial projection $Q arrow.r "link" \( S \)$, equivalently by page inclusion in the link open-book model. The rational form $e$ on $E$ is one fourth of the upstairs Seifert pairing of transferred cycles. Theorem 6 identifies the Milnor lattice and its Seifert form $s_nu$, in one convention on both sides, as follows:

#[#set math.equation(numbering: n => "(9.2)")
 $ F_nu & = \( K_nu \)_(bb(Q)) xor \( H ⊗ E \)_(bb(Q)) \,\
s_nu & = \( - s_(d_nu) \|_(K_nu) \) perp \( s_h ⊗ e \) \,\
Lambda_nu & = {\( "pr"_nu l \, z \) : l in D_nu \, med z in H ⊗ E \, quad pi_(nu *) l equiv \( 1 ⊗ tau \) z med \( mod med 4 H \)} . $ <eq:arith-input-lattice>]

The rational vector space $F_nu$ is $Lambda_nu ⊗ bb(Q)$. Every later localization uses this complete integral lattice with the displayed residue condition; all tensor products and pairings use the displayed identification.

=== 9.1 Two boundary vectors <subsec:arith-boundary>

The graph index $nu in { 0 \, 1 }$ and the boundary index $j in { 0 \, 1 }$ are independent.

The quotient map $\( U \, V \) mapsto \( U^4 \, V^4 \, U V \)$ identifies $S$ with $bb(C)^2 \/ mu_4$, with action $\( U \, V \) mapsto \( omega U \, omega^(- 1) V \)$. Upstairs the cone-page equation is

#[#set math.equation(numbering: n => "(9.3)")
 $ tilde(P) \( U \, V \) = U V \( U^(4 a) + V^(4 b) \) . $ <eq:arith-upstairs-page>]

Orient the boundary class $b_0 in E$ of the $y$-axis as a complex branch and the class $b_1$ of the $z$-axis oppositely to its complex orientation. The quotient lens space has $H_1 = bb(Z) \/ 4$; with the positive $y$-axis class as generator, both have $tau \( b_j \) = 1$.

#thm([Lemma 9.2.])[
  (Boundary pairings).  #emph[The classes $b_0 \, b_1$ are fixed by the page monodromy, and 
#[#set math.equation(numbering: n => "(9.4)")
 $ e \( b_j \, b_j \) & = - n_j^2 / 4 \, & e \( b_0 \, b_1 \) & = - 1 / 4 \,\
4 e \( b_j \, x \) & equiv - tau \( x \) med \( mod med 4 \) &  & \( x in E \) . $ <eq:arith-boundary-pairings>]

]
] <lem:arith-boundary>

#proof[
  The weighted rotation preserves each axis, hence its boundary homology class. Transfer of either axis boundary is a single boundary circle of the upstairs plane-curve page. In a positive plane-curve Seifert convention, the pairing of two distinct complex branch boundaries is their positive local intersection multiplicity. The sum of all oriented boundary classes is zero, so the self-pairing of the $V = 0$ boundary is $- \( 1 + 4 a \) = - n_0^2$, and that of $U = 0$ is $- \( 1 + 4 b \) = - n_1^2$. The two axes meet once. Reversing the second orientation gives the mixed value $- 1$ upstairs. Division by the covering degree proves the first two formulas.
  The integer-valued functional $x mapsto 4 e \( b_j \, x \)$ reduces modulo $4$ through $tau$. Indeed a loop whose $tau$-class is zero lifts closed; its full transfer consists of four deck translates, and the transferred axis class is deck invariant. The four Seifert pairings are equal, so their sum is divisible by $4$. A class in $ker tau$ can be represented by such loop systems, and $tau \( b_j \) = 1$ generates $bb(Z) \/ 4$. Evaluation at $b_j$ gives $4 e \( b_j \, b_j \) = - n_j^2 equiv - 1 med \( mod med 4 \)$, proving the last congruence. ◻
]

=== 9.2 Two complementary local splittings <subsec:arith-local>

We first make explicit why the Seifert operator of $e$ is defined. Over $bb(Q)$, transfer identifies $E_(bb(Q))$ with the deck-invariant summand of the upstairs page homology. Let $tilde(s)$ be the nondegenerate upstairs Milnor Seifert form in the same ordered convention. The deck transformations are $tilde(s)$-isometries, so their averaging projection $p = 1 / 4 sum_(gamma in mu_4) gamma$ satisfies $tilde(s) \( p x \, y \) = tilde(s) \( x \, p y \)$. Its image and kernel are therefore orthogonal in both orders, and the restriction of $tilde(s)$ to the invariant summand is nondegenerate. Under transfer, $e$ is one fourth of this restriction, so $e$ is nondegenerate and $A_e = e^(- 1) e^(sans(t))$ is the restriction of $tilde(A) = tilde(s)^(- 1) tilde(s)^(sans(t))$. The weighted rotation $tilde(M)$ has rational weights $b \/ m \, a \/ m$, hence finite order, and commutes with the deck action. The identity relating a plane-curve Seifert form and monodromy reads $tilde(A) = tilde(M)^epsilon$ for one fixed $epsilon in { 1 \, - 1 }$ in the common convention. The same $epsilon$ applies to the base page. Thus $A_e$ has finite order and fixes the classes $b_j$, since the weighted rotation fixes their transferred axis boundaries.

Set $v_j = b_j \/ n_j in E_(bb(Q))$. Since $A_e b_j = b_j$, the form $e$ pairs $v_j$ symmetrically with every vector: $e \( v_j \, x \) = e \( x \, A_e v_j \) = e \( x \, v_j \)$. Equation (9.4) gives

#[#set math.equation(numbering: n => "(9.5)")
 $ e \( v_j \, v_j \) = - 1 / 4 . $ <eq:arith-v-norm>]

For a rational prime $ell divides.not n_j$, write $E_(bb(Z)_ell) = E ⊗ bb(Z)_ell$ and let

$ tau_(bb(Z)_ell) : E_(bb(Z)_ell) arrow.r \( bb(Z) \/ 4 \) ⊗ bb(Z)_ell tilde.equiv bb(Z)_ell \/ 4 bb(Z)_ell $

be the scalar extension of $tau$. For $x in E_(bb(Z)_ell)$, the value $- 4 e \( v_j \, x \)$ lies in $bb(Z)_ell$, since $4 e \( b_j \, x \)$ is integral and $n_j$ is a unit. In this coefficient ring, (9.4) gives

$ - 4 e \( v_j \, x \) equiv tau_(bb(Z)_ell) \( x \) med \( mod med 4 bb(Z)_ell \) . $

The target is zero at odd primes. At $ell = 2$, the congruence uses $n_j equiv 1 med \( mod med 4 \)$ from Lemma 4.

#thm([Lemma 9.3.])[
  (Local splitting).  #emph[For every rational prime $ell divides.not n_j$, the lattice $E_(bb(Z)_ell)$ has the following $bb(Z)_ell$-module splitting, orthogonal for the $bb(Q)_ell$-valued form $e$: 
$ E_(bb(Z)_ell) = bb(Z)_ell v_j perp U_(j \, ell) \, #h(2em) U_(j \, ell) subset ker \( tau_(bb(Z)_ell) \) . $

 For $nu = 0 \, 1$ this induces an integral Seifert isometry 
#[#set math.equation(numbering: n => "(9.6)")
 $ alpha_(nu \, j) : & \( D_nu \, - s_(d_nu) \)_(bb(Z)_ell) perp \( H ⊗ U_(j \, ell) \, s_h ⊗ e \) arrow.r^(med tilde.op med) \( Lambda_nu \, s_nu \)_(bb(Z)_ell) \,\
 & \( l \, u \) mapsto #scale(x: 120%, y: 120%)[\(] "pr"_nu l \, med pi_(nu *) l ⊗ v_j + u #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-local-alpha>]

 It also holds over $bb(Q)$.]
] <lem:arith-local-splitting>

#proof[
  The coefficient of $x in E_(bb(Z)_ell)$ on $v_j$ is $c_j \( x \) = - 4 e \( v_j \, x \)$. It is integral because $4 e \( b_j \, x \)$ is integral and $n_j$ is a unit in $bb(Z)_ell$, and it sends $v_j$ to $1$ by (9.5). Its kernel $U_(j \, ell)$ is therefore an integral orthogonal summand. The local congruence above gives $tau_(bb(Z)_ell) \( U_(j \, ell) \) = 0$. At $ell = 2$, $c_j \( x \) equiv tau_(bb(Z)_2) \( x \) med \( mod med 4 bb(Z)_2 \)$ because $n_j equiv 1 med \( mod med 4 \)$; at odd primes the target of $tau_(bb(Z)_ell)$ is zero. Thus the projection $x mapsto c_j \( x \) v_j$ is integral also at $ell = 2$: all divisions are by the unit $n_j$.
  The image of (9.6) satisfies the lattice congruence (9.2). Conversely, write the second coordinate of an arbitrary lattice element as $z = x_H ⊗ v_j + u$. Its congruence says $x_H - pi_(nu *) l in 4 H_(bb(Z)_ell)$. Replacing $l$ by
  $ l + pi_nu^(!) (\( x_H - pi_(nu *) l \) \/ 4) $
  is legitimate even at $ell = 2$, because the numerator belongs to $4 H_(bb(Z)_ell)$. It does not alter $"pr"_nu l$ and makes its image under $pi_(nu *)$ equal to $x_H$. This proves surjectivity; injectivity follows from the rational direct sum.
  The $H ⊗ U_(j \, ell)$ summand is orthogonal to the image of $D_nu$. On two vectors from $D_nu$, transfer adjunction gives
  $ s_(d_nu) \( "pr"_nu l \, "pr"_nu l' \) = s_(d_nu) \( l \, l' \) - 1 / 4 s_h \( pi_(nu *) l \, pi_(nu *) l' \) . $
  The product-form contribution on $v_j$ is the negative of the last fraction, by $e \( v_j \, v_j \) = - 1 \/ 4$. Combined with the leading minus sign on $K_nu$ in (9.2), the result is $- s_(d_nu) \( l \, l' \)$, as claimed. ◻
]

Use the fixed plane isometry $cal(I)$ from (9.1) on the $D$-summands and the identity on $H ⊗ U_(j \, bb(Q))$. The rational versions of (9.6) give Seifert isometries

#[#set math.equation(numbering: n => "(9.7)")
 $ J_j = alpha_(1 \, j) \( cal(I) xor 1 \) alpha_(0 \, j)^(- 1) : \( F_0 \, s_0 \) arrow.r^(med tilde.op med) \( F_1 \, s_1 \) . $ <eq:arith-two-J>]

They are lattice isometries at every $ell divides.not n_j$. No compatibility between $cal(I)$ and the two maps $pi_nu$ is required: those maps enter only through the explicit changes of coordinates $alpha_(nu \, j)$. Since $gcd \( n_0 \, n_1 \) = 1$, the two isometries $J_0 \, J_1$ cover all primes locally.

=== 9.3 The discrepancy on two primary sectors <subsec:arith-correction>

The local choices will give one integral isometry if their discrepancy

$ Delta = J_0^(- 1) J_1 : F_0 arrow.r F_0 $

can be corrected at the primes dividing $n_0$ without disturbing the source lattice at the other primes. We first identify the rational isometry groups containing this discrepancy. The normalized boundary vectors $v_0 \, v_1$ are exchanged by a reflection; comparison of the corresponding reflections on $F_0$ and $F_1$ will remove the determinant and spinor obstructions. To state that comparison, we describe the two monodromy sectors on which the reflections act.

Let $A_nu = s_nu^(- 1) s_nu^(sans(t))$ be the Seifert operator. It is an isometry of $s_nu$. By the rational orthogonal decomposition (9.2), its action is the operator of $d_nu$ on $K_nu$ and the tensor product of the operators of $h$ and $e$ on $H ⊗ E$. The operator of $e$ has finite order because (9.3) is weighted homogeneous; the operator of $h$ has order $5$. The plane-curve semisimplicity input therefore shows that $A_nu$ is semisimple at $1$ and at primitive fifth roots. Let

$ F_(nu \, 1) = ker \( A_nu - 1 \) \, #h(2em) F_(nu \, 5) = ker Phi_5 \( A_nu \) \, #h(2em) B_nu = s_nu + s_nu^(sans(t)) . $

These primary spaces split off rationally and orthogonally, because their eigenvalue sets are stable under inversion. On them $B_nu$ is nondegenerate: $s_nu^(sans(t)) = s_nu A_nu$, hence $B_nu = s_nu \( 1 + A_nu \)$, and neither primary sector has eigenvalue $- 1$. On $F_(nu \, 1)$ it is a rational quadratic form. On $F_(nu \, 5)$ the action of $A_nu$ makes the space a vector space over $L = bb(Q) \( zeta \)$, $zeta = e^(2 pi i \/ 5)$, with $L^(+) = bb(Q) \( zeta + zeta^(- 1) \)$. Define the $L$-valued form $frak(h)_(nu \, 5)$ on $F_(nu \, 5)$ by trace duality:

$ "Tr"_(L \/ bb(Q)) #h(-0.16667em) (c thin frak(h)_(nu \, 5) \( x \, y \)) = B_nu \( c x \, y \) #h(2em) \( c in L \) . $

The $B_nu$-adjoint of $c$ is $macron(c)$, because $A_nu$ is a $B_nu$-isometry. Nondegeneracy of the field trace pairing therefore gives sesquilinearity and Hermitian symmetry for $L \/ L^(+)$, and nondegeneracy follows from that of $B_nu$. The same identity shows that every $L$-linear $B_nu$-isometry preserves $frak(h)_(nu \, 5)$.

For the base form on $H_(bb(Q))$, set

$ A_h = s_h^(- 1) s_h^(sans(t)) \, #h(2em) H^(\( 1 \)) = ker \( A_h - 1 \) \, #h(2em) H^(\( 5 \)) = ker Phi_5 \( A_h \) . $

With the same convention as above, $A_h = M_h^epsilon$.

#thm([Lemma 9.4.])[
  (The discrepancy lifts).  #emph[The rational Seifert isometry $Delta = J_0^(- 1) J_1$ acts as the identity outside $F_(0 \, 1) xor F_(0 \, 5)$. Its restriction to $F_(0 \, 1)$ lifts to the rational points of the spin group of $B_0 \| F_(0 \, 1)$. Its restriction to $F_(0 \, 5)$ lies in the special unitary group of the $L \/ L^(+)$ Hermitian form.]
] <lem:arith-discrepancy>

#proof[
  The two $v_j$ have the same norm $- 1 \/ 4$, while $e \( v_0 \, v_1 \) = - 1 \/ \( 4 n_0 n_1 \)$. Therefore
  $ w = v_0 - v_1 \, #h(2em) e \( w \, w \) = - 1 / 2 (1 - frac(1, n_0 n_1)) eq.not 0 . $
  The vector $w$ is monodromy fixed and hence pairs symmetrically for $e$. Reflection
  $ R_w \( x \) = x - frac(2 e \( x \, w \), e \( w \, w \)) w $
  is consequently an $e$-isometry commuting with monodromy, and it exchanges $v_0 \, v_1$. Define $rho_nu$ on $F_nu$ as identity on $\( K_nu \)_(bb(Q))$ and $1_H ⊗ R_w$ on $\( H ⊗ E \)_(bb(Q))$. This is a rational Seifert involution. Let $cal(R)_nu$ be identity on $D_nu$ and $1_H ⊗ R_w$ from $H ⊗ U_(0 \, bb(Q))$ to $H ⊗ U_(1 \, bb(Q))$. Equation (9.6) gives $rho_nu alpha_(nu \, 0) = alpha_(nu \, 1) cal(R)_nu$. The same $R_w$ occurs for both coverings, so the square formed by $cal(R)_0 \, cal(R)_1$ and $cal(I) xor 1$ commutes. Consequently
  #[#set math.equation(numbering: n => "(9.8)")
   $ J_1 = rho_1 J_0 rho_0^(- 1) \, #h(2em) Delta = \( J_0^(- 1) rho_1 J_0 \) rho_0^(- 1) . $ <eq:arith-J-conjugacy>]
  The minus space of $rho_nu$ is $W_nu = H_(bb(Q)) ⊗ bb(Q) w$. Its restricted Seifert form is $e \( w \, w \) s_h$, so its Seifert operator is $A_h$. In particular it lies entirely in $F_(nu \, 1) xor F_(nu \, 5)$. Both factors of (9.8), and therefore $Delta$, act identically on every other rational primary summand.
  The minus spaces within the two primary sectors are
  $ W_(nu \, 1) = H^(\( 1 \)) ⊗ bb(Q) w \, #h(2em) W_(nu \, 5) = H^(\( 5 \)) ⊗ bb(Q) w . $
  The canonical map $x ⊗ w mapsto x ⊗ w$ from $W_0$ to $W_1$ preserves the restricted Seifert and symmetric forms and intertwines $A_h$. It therefore restricts to isometries on the individual sectors displayed above. These restrictions are nondegenerate: $e \( w \, w \) eq.not 0$, and $s_h + s_h^(sans(t))$ is nondegenerate on both $H^(\( 1 \))$ and $H^(\( 5 \))$. Since the Seifert isometry $J_0$ intertwines $A_0$ and $A_1$, composition with $J_0^(- 1)$ identifies, separately on each sector, the minus spaces of $rho_0$ and $J_0^(- 1) rho_1 J_0$. On $F_(0 \, 5)$ the isometry $Delta$ commutes with the $L$-action and preserves the Hermitian form recovered from $B_0$. The two involutions in (9.8) have the same $L$-dimension of their minus spaces, so their $L$-determinants cancel: $det_L Delta = 1$. It is therefore an $L^(+)$-rational special-unitary element.
  On $F_(0 \, 1)$ the same comparison gives determinant $1$. The spinor norm of an involution with nondegenerate minus space is the product, modulo rational squares, of the quadratic values of an orthogonal basis of that space. The minus spaces just identified are isometric, so their spinor norms are equal and cancel in the product. Thus $Delta$ has trivial spinor norm. The standard exact sequence for $"Spin" arrow.r "SO"$ now supplies a rational spin lift #cite(label("Conrad2014Reductive")) Section C.5, paragraph before Example C.5.5 and Lemma C.5.8. ◻
]

=== 9.4 Noncompact real factors <subsec:arith-real>

Lemma 20 places the required correction in a spin group over $bb(Q)$ and a special unitary group over $L^(+)$. Strong approximation in these groups requires noncompactness at an archimedean place. We now prove the corresponding indefiniteness of the quadratic and Hermitian forms. Both signs come from holomorphic and antiholomorphic classes of the cone page.

#thm([Lemma 9.5.])[
  (Real signs).  #emph[The quadratic form $B_nu \| F_(nu \, 1)$ is indefinite and has dimension at least five. The Hermitian form on $F_(nu \, 5)$ has dimension at least two over $L$ and is indefinite at the real place of $L^(+)$ indexed by the pair ${ zeta \, macron(zeta) }$. Both assertions hold for $nu = 0 \, 1$.]
] <lem:arith-real-signs>

#proof[
  By Lemma 2, the rational primary parts $H^(\( 1 \))$ and $H^(\( 5 \))$ have dimensions two and four, respectively, and together equal $H_(bb(Q))$. Their eigenvalue sets are stable under inversion, so they are nondegenerate orthogonal summands for $s_h$. The restriction to $H^(\( 1 \))$ is symmetric, and each complex primitive fifth eigenspace is one-dimensional and pairs nondegenerately with its inverse eigenspace.
  To obtain both Hodge signs in the primitive fifth eigenspaces of $E_(bb(C))$, we construct holomorphic forms with inverse primitive fifth characters. Their conjugate antiholomorphic classes will give opposite cup-product signs. Set $m = 4 a b + a + b$, and write $a = g a'$, $b = g b'$ with $gcd \( a' \, b' \) = 1$. The weights of $U \, V$ in (9.3) are $b \/ m \, a \/ m$. For $q = 1$ and $q = 4$ there are positive integers $i \, j$, congruent modulo $4$, with
  #[#set math.equation(numbering: n => "(9.9)")
   $ frac(b i + a j, m) = q / 5 . $ <eq:arith-weight-indices>]
  The existence and positivity of these two index pairs were proved in Lemma 17.
  On the smooth affine curve $tilde(P) = 1$, the differential
  #[#set math.equation(numbering: n => "(9.10)")
   $ omega_(i \, j) = U^(i - 1) V^(j - 1) frac(d U, partial_V tilde(P)) = - U^(i - 1) V^(j - 1) frac(d V, partial_U tilde(P)) $ <eq:arith-eigenform>]
  is regular and nonzero. The second expression is used where $partial_V tilde(P) = 0$. Its deck character is $omega^(i - j) = 1$, so it descends to the quotient, and its weighted rotation character is $e^(2 pi i q \/ 5)$. To obtain the needed holomorphic classes, we check that these differentials extend across every end of the normalized compactification. At an end put $u = "ord" U$, $v = "ord" V$. If $4 a u < 4 b v$, then $u < 0$ and $v = - \( 4 a + 1 \) u$; the order of (9.10) is $\( i - \( 4 a + 1 \) j \) u - 1 gt.eq 0$. Here $i < 4 a + 1$, because (9.9), $q lt.eq 4$ and $j gt.eq 1$ give $b i lt.eq 4 m \/ 5 - a < b \( 4 a + 1 \)$. The case $4 b v < 4 a u$ is symmetric, using the second expression and $j < 4 b + 1$. In the remaining case $4 a u = 4 b v < 0$, leading terms in $U^(4 a) + V^(4 b)$ cancel and $"ord" \( partial_V tilde(P) \) = u + 4 b v$. There is a positive integer $c$ with $\( u \, v \) = - c \( b' \, a' \)$; the order is
  $ \( i - 1 \) u + \( j - 1 - 4 b \) v - 1 = c (1 - q / 5) m / g - 1 gt.eq 0 . $
  These are all possible ends, since one of $U \, V$ has a pole.
  The two differentials for $q = 1 \, 4$ thus give nonzero holomorphic forms on the smooth compactification with characters $zeta$ and $macron(zeta)$. Complex conjugation gives antiholomorphic forms of the opposite characters. The cup-product Hermitian form has opposite signs on holomorphic and antiholomorphic forms. Poincaré duality exchanges reciprocal characters and gives opposite signs for the Hermitian intersection form on the corresponding homology classes. Since both characters have been constructed, each of the two homology eigenspaces has both signs. With complex coefficients, the map from affine-page homology to compactification homology is surjective and preserves intersections. Average a linear section of this map over the finite group generated by the commuting deck transformations and weighted rotation. The resulting equivariant section lifts the classes with their characters and intersection numbers unchanged. Transfer over $bb(C)$ identifies the deck-invariant part with $E_(bb(C))$ and preserves the monodromy characters. Since $e - e^(sans(t))$ is, up to our common Seifert convention, the page intersection form, the Hermitian form $i \( e - e^(sans(t)) \) \( x \, macron(x) \)$ has both signs in each of $E_zeta$ and $E_(macron(zeta))$.
  We transfer these signs to the fixed quadratic sector by tensoring a primitive base eigenspace with the inverse eigenspace of $E$. After complexifying, choose $lambda in { zeta \, macron(zeta) }$ and a nonzero $x in ker \( A_h - lambda \) subset H_(bb(C))$. This eigenspace is one-dimensional and pairs nondegenerately with its inverse eigenspace. The preceding statement that both signs occur applies to $ker \( A_e - lambda^(- 1) \) subset E_(bb(C))$ under either inverse monodromy convention. For $y$ in this eigenspace, put
  $ I_H = i \( s_h - s_h^(sans(t)) \) \( x \, macron(x) \) \, #h(2em) I_E = i \( e - e^(sans(t)) \) \( y \, macron(y) \) . $
  These are real, and $I_H eq.not 0$. The relation $s^(sans(t)) = s A$ in each factor, together with the vanishing of $s_h \( x \, x \)$ and $e \( y \, y \)$ when $lambda^2 eq.not 1$, gives
  $ B_nu \( x ⊗ y + macron(x) ⊗ macron(y) \, thin x ⊗ y + macron(x) ⊗ macron(y) \) = - frac(4 I_H I_E, \| 1 - lambda \|^2) . $
  The vectors in this display lie in $F_(nu \, 1) ⊗_(bb(Q)) bb(R)$, and the two signs of $I_E$ prove that $B_nu \| F_(nu \, 1)$ is indefinite. These tensors and their conjugates already contribute at least four real dimensions. The invariant part of $H$ has dimension two, and $b_0$ is a nonzero invariant vector of $E$ by (9.4); its tensor contributes at least two more dimensions.
  For the Hermitian sector, we tensor the primitive eigenspace of $E$ with a fixed base vector. Choose $x in H ∩ H^(\( 1 \))$ with $s_h \( x \, x \) eq.not 0$. Such an integral vector exists: the nondegenerate symmetric restriction to $H^(\( 1 \))$ has a rational vector of nonzero norm, and clearing denominators puts it in $H$. Tensor $x$ with $E_zeta$. This lies in the $zeta$ component of $F_(nu \, 5)$ for one of the two inverse monodromy conventions. If the eigenvalue of $A_e$ on $E_zeta$ is $lambda in { zeta \, zeta^(- 1) }$, then on this eigenspace
  $ \( e + e^(sans(t)) \) \( y \, macron(y) \) = frac(1 + lambda^(- 1), i \( 1 - lambda^(- 1) \)) i \( e - e^(sans(t)) \) \( y \, macron(y) \) \, $
  and the displayed ratio is a nonzero real number. The two signs found above therefore give both signs for the Hermitian form of $B_nu$ at this real embedding. Its dimension is at least two. ◻
]

=== 9.5 A single integral isometry <subsec:arith-approximation>

We can now combine the rational lift of the discrepancy with the real noncompactness just proved. The approximation will be imposed inside stabilizers of the full lattice $Lambda_0$, so it preserves the mod-four gluing even though the rational primary decomposition need not split that lattice integrally.

#thm([Proposition 9.6.])[
  (Integral Seifert congruence).  #emph[For the two germs constructed above, the two integral Milnor Seifert forms $\( Lambda_0 \, s_0 \)$ and $\( Lambda_1 \, s_1 \)$ are isometric.]
] <prop:arith-integral-congruence>

#proof[
  By Lemma 21, $G_1 = "Spin" \( F_(0 \, 1) \, B_0 \)$ is a connected, simply connected, absolutely almost simple group over $bb(Q)$ of quadratic dimension at least five #cite(label("Conrad2014Reductive")) Proposition C.3.10, Lemma C.4.1, Proposition C.4.10, and Example C.6.6. The proved indefiniteness makes it noncompact over $bb(R)$. The second correction group $G_5 = "SU" \( F_(0 \, 5) \, frak(h)_(0 \, 5) \)$ is connected, simply connected, and absolutely almost simple over $L^(+)$: after algebraic closure it is $"SL"_d$, with $d gt.eq 2$ #cite(label("Milne2022")) Proposition 24.40(b), equation (158), and Summary 21.96. It is noncompact at the real place found in Lemma 21. We use $G = G_1 times "Res"_(L^(+) \/ bb(Q)) G_5$, acting on the indicated primary spaces and as identity on their $s_0$-orthogonal primary complement. The Spin action preserves $B_0$ and commutes with $A_0 = 1$ on $F_(0 \, 1)$. The special-unitary action preserves the Hermitian form, hence $B_0$, and commutes with $A_0$ on $F_(0 \, 5)$ by $L$-linearity. On both sectors $1 + A_0$ is invertible and
  $ s_0 = B_0 \( 1 + A_0 \)^(- 1) . $
  Consequently this action of $G$ preserves the Seifert form $s_0$. We obtain the density assertion for $G$ by treating its two factors separately.
  The strong-approximation theorem of Kneser and Platonov, in the precise form of #cite(label("Rapinchuk2014")) Theorem 2.3, says that for a connected, simply connected, absolutely almost simple group over a number field, noncompactness at a place in the omitted finite set implies density of rational points in the adeles away from that set. Apply it to $G_1$ over $bb(Q)$ and to $G_5$ over $L^(+)$, omitting all archimedean places. Restriction of scalars and a finite product give density of $G \( bb(Q) \)$ in $G \( bb(A)_f \)$.
  Write $rho : G arrow.r "GL" \( F_0 \)$ for this rational action. Lemma 20 gives a rational lift $tilde(Delta) in G \( bb(Q) \)$ with $rho \( tilde(Delta) \) = Delta$. For each rational prime $ell$, put $a_ell = tilde(Delta)$ if $ell divides n_0$, and $a_ell = 1$ otherwise. The tuple $upright(bold(a)) = \( a_ell \)_ell$ has finite support and lies in $G \( bb(A)_f \)$. We seek one rational point $g_(upright("rat")) in G \( bb(Q) \)$ whose localizations $g_(upright("rat") \, ell)$ differ from these selected corrections by automorphisms of the full source lattice:
  $ rho \( a_ell^(- 1) g_(upright("rat") \, ell) \) \( Lambda_0 ⊗ bb(Z)_ell \) = Lambda_0 ⊗ bb(Z)_ell quad upright("for every ") ell . $
  To construct a suitable open neighborhood of $upright(bold(a))$, define the exact source-lattice stabilizer
  $ C_ell = {gamma in G \( bb(Q)_ell \) : rho \( gamma \) \( Lambda_0 ⊗ bb(Z)_ell \) = Lambda_0 ⊗ bb(Z)_ell} . $
  Each $C_ell$ is compact open. Here the spin action has finite central kernel, so it need not be faithful; compactness follows from finiteness of the covering onto its algebraic image. For the adelic topology we only need compact opens inside these stabilizers. Spread out $G$ and its rational action on $F_0$ to a smooth affine group scheme $cal(G)$ over $bb(Z) \[ 1 \/ N \]$, enlarging $N$ so that the action preserves $Lambda_0 ⊗ bb(Z) \[ 1 \/ N \]$. At every $ell divides.not N$ its standard compact open $cal(G) \( bb(Z)_ell \)$ lies in $C_ell$. For each of the finitely many primes $ell divides N$, choose a compact open subgroup $K_ell subset C_ell$; at the other primes put $K_ell = cal(G) \( bb(Z)_ell \)$. Then $cal(K) = product_ell K_ell$ is compact open in $G \( bb(A)_f \)$ and $upright(bold(a)) cal(K)$ is an open coset contained in the desired set of local integral corrections.
  At $ell divides.not n_0$, Lemma 19 makes $J_0$ an integral lattice isometry. At $ell divides n_0$ we have $ell divides.not n_1$, so $J_0 rho \( a_ell \) = J_1$ is integral. Consequently
  $ J_0 rho \( a_ell \) \( Lambda_0 ⊗ bb(Z)_ell \) = Lambda_1 ⊗ bb(Z)_ell quad upright("for every ") ell . $
  Density supplies $g_(upright("rat")) in G \( bb(Q) \) ∩ upright(bold(a)) cal(K)$. Writing $g_(upright("rat") \, ell) = a_ell k_ell$ with $k_ell in K_ell subset C_ell$ shows that $J_0 rho \( g_(upright("rat")) \)$ induces the same local lattice equality at every prime. A full $bb(Z)$-lattice in a rational vector space is the intersection of its localizations at all primes; applying this to both sides yields $J_0 rho \( g_(upright("rat")) \) Lambda_0 = Lambda_1$. Since $J_0$ and $rho \( g_(upright("rat")) \)$ preserve their respective Seifert forms, this is the asserted integral congruence. ◻
]

=== 9.6 The embedded links <subsec:arith-links>

The final step uses Kato’s Theorem B and his definition in Section 2 #cite(label("Kato1974")) pp. 454–455. The theorem has no homotopy-sphere hypothesis on the binding. In his terminology, a spinnable structure on an oriented $\( 2 n + 1 \)$-manifold is an open book with compact $2 n$-dimensional page $F$, characteristic diffeomorphism fixed near $partial F$, and an identification of its open-book quotient with the ambient manifold. It is simple when $F$ is obtained from a ball by handles of index at most $n$. Theorem B states that for $n gt.eq 3$ two such structures on $S^(2 n + 1)$ with congruent integral Seifert matrices are isomorphic. Kato explicitly notes on p. 454 that this applies to isolated complex hypersurface singularities; his footnote credits Durfee’s independent result #cite(label("Durfee1974")).

For each function constructed above, the origin is an isolated critical point in a smooth complex four-dimensional chart. Its Milnor open book lies on the standard $S^7$, so $n = 3$; its compact page has real dimension six and its binding has real dimension five. We use the analytic form of Milnor’s theorem, recalled explicitly by Némethi #cite(label("Nemethi1999SeifertInfinity")) pp. 63–64: an isolated analytic germ supplies a simple spinnable Milnor structure. In our four-dimensional charts this gives the handle bound required by Kato.

We also specify the characteristic diffeomorphism near the binding. The Milnor open book has the local product model $partial F times D^2$, with the fibration given by the angular coordinate on $D^2 \\ { 0 }$. Choose the horizontal angular field to be the product rotation on a smaller such neighborhood, and extend it over the complement by a partition of unity among horizontal lifts. Its return after one turn fixes a collar of $partial F$ pointwise.

Theorem 6 identifies (9.2) with the actual integral Milnor Seifert forms in the same ordered push-off convention. Proposition 22 is an onto isometry of these integral lattices. In integral bases of the page groups $H_3 \( F \; bb(Z) \)$, its matrix is therefore unimodular and gives exactly an integral congruence of Seifert matrices. The common complex and positive-target orientations make any universal sign or transpose in the conversion to Kato’s convention the same on both sides, so the congruence is preserved. Kato’s Theorem B now gives an orientation-preserving diffeomorphism $phi.alt$ of the two sphere-link pairs: the isomorphism of open books carries pages and therefore their embedded boundaries.

To pass to the germs, use the analytic ambient-pair cone theorem, attributed to Łojasiewicz in #cite(label("Massey2015LeCycles")) Theorem 1.4. It identifies each sufficiently small ball pair, including its center, with the cone on its sphere-link pair. The map $\[ u \, t \] mapsto \[ phi.alt \( u \) \, t \]$ is a homeomorphism of the two cone pairs. Conjugating it by the two analytic pair-cone homeomorphisms gives the required homeomorphism germ of ambient pairs.

#proof[
  Proposition 5 and Lemma 9 give smooth ambient fourfold germs and reduced isolated functions of orders five and four. Theorem 6 identifies their actual integral Milnor Seifert forms, and Proposition 22 gives an integral congruence. The Kato argument above identifies their embedded links. The analytic pair-cone construction above extends that equivalence to an ambient homeomorphism germ, proving the assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
