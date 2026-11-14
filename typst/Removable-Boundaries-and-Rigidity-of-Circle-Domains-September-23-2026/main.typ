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

#align(center)[#text(size: 16pt, weight: "bold")[Removable Boundaries and Rigidity of Circle Domains]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A circle domain is a nonempty connected open subset of the Riemann sphere $hat(bb(C)) =
  bb(C) union { oo }$ whose complementary components are points or closed round disks;
  the complement may be empty. Circle boundaries give a particularly concrete conformal model of a plane domain.
  Their usefulness depends on two separate questions: whether such a model exists,
  and whether its conformal structure determines its placement in the sphere up to a Möbius transformation.
  This paper addresses the second question under conformal removability of the boundary.

A compact set $E subset hat(bb(C))$ is #emph[conformally removable] if every orientation-preserving homeomorphism
  of the sphere that is conformal on $hat(bb(C)) \\ E$ is Möbius.
  A circle domain is #emph[conformally rigid] if every conformal equivalence from it onto another circle domain is
  the restriction of a Möbius transformation. The definitions have different starting data:
  removability concerns a map already defined on the sphere, whereas rigidity concerns only a map between the domains.

#thm([Theorem 1.1.])[
  #emph[Every circle domain with conformally removable boundary is conformally rigid.
    More explicitly, if $Omega \, Omega' subset hat(bb(C))$ are circle domains,
    $partial Omega$ is conformally removable, and $f : Omega arrow.r Omega'$ is a conformal equivalence,
    then there is a Möbius transformation $M$ such that $f = M \|_Omega$.]
] <thm:main>

The theorem allows arbitrary cardinality of the complementary component set.
  The required boundary control is a conclusion of the argument; no boundary extension of $f$ is part of the hypothesis.

=== 1.1 Rigidity and removability <rigidity-and-removability>

He and Schramm proved circle-domain uniformization for countably connected domains and rigidity for countably
  connected circle domains #cite(label("HeSchramm1993")). Their subsequent rigidity theorem permits uncountably
  many complementary components when the boundary has $sigma$-finite linear measure #cite(label("HeSchramm1994")).
  They conjectured that a circle domain is rigid if and only if its boundary is conformally removable.
  The forward implication in this proposed equivalence is false:
  Rajala constructed a rigid circle domain with a non-removable boundary #cite(label("Rajala2025")) Theorem 1.1.
  Theorem 1 establishes the remaining removability-to-rigidity implication positively.

Several intermediate results clarify the role of boundary geometry.
  Younsi studied the formulations involving removability of the whole boundary and of its Cantor subsets,
  and proved that conformal rigidity is equivalent to quasiconformal rigidity #cite(label("Younsi2016"))
  Theorems 3–5. Ntalampekos and Younsi proved rigidity under square integrability of the quasihyperbolic distance
  in a bounded portion of the domain; this includes Hölder and John circle domains #cite(label("NY2020"))
  Theorem 1.6 and Corollary 1.7. Ntalampekos subsequently proved rigidity when every compact subset of the set of
  point boundary components is #emph[countably negligible for extremal distance],
  or CNED #cite(label("Ntalampekos2023")) Theorem 1.2. For every pair of disjoint nondegenerate continua,
  the CNED condition says that restricting the joining curves to those that meet the exceptional set in at most
  countably many points leaves their conformal modulus unchanged.
  These results develop methods for controlling boundary traces under explicit geometric or extremal-distance
  hypotheses.

Continuous Sobolev extension is a second relevant line of work.
  Jones and Smirnov related removability for continuous Sobolev functions to quasiconformal removability and
  proved criteria based on the geometry near a domain boundary #cite(label("JonesSmirnov2000")) Definition 2 and
  Theorems 2, 4. For closed CNED sets, Ntalampekos proved continuous $W^(1 \, n)$ extension in dimension
  $n$ #cite(label("NtalampekosCNED2024")) Theorem 1.4. Our intermediate Theorem 10 treats compact totally
  disconnected planar sets under conformal removability itself:
  a scalar function continuous across such a set, with finite Dirichlet energy on its complement,
  is globally Sobolev. Continuity across the set is an essential hypothesis of this intermediate statement.

=== 1.2 The proof and its quantitative input <the-proof-and-its-quantitative-input>

The first difficulty is to use removability before a conformal map is known to extend to the sphere.
  We handle it initially for the complement of a compact totally disconnected set $B$.
  A normalized conformal map $h$ of $hat(bb(C)) \\ B$ may replace a point of $B$ by a nonpoint complementary
  component in its image. Component correspondence supplies a continuous inverse collapse map $pi_h$ on the target
  sphere. For a continuous scalar function $u$ on the source sphere, the function $u compose
  pi_h$ therefore has the prescribed constant value on each target component.
  We call $h$ a model retaining $u$ when this continuation is globally Sobolev and its gradient vanishes on the
  omitted set.

The companion paper #cite(label("KoebeCompanion")) proves a quantitative retained-test transfer and selection
  theorem. We use its scalar form in Section 3: compatible finite lists of scalar functions are retained exactly
  on exhausting cores, while the remaining energy and the square sum of boundary oscillations tend to zero.
  Compatibility here is the condition that the joint image of $B$ under each pair of tests has planar area zero.
  Filling the finite round holes and passing to a weak limit produces the required models.
  A separate contour argument identifies their values on all omitted components,
  including point components whose union can have positive area.
  This is the quantitative part of the uniformization theorem needed in this paper.

The next step varies the model. Among maps retaining a fixed finite list,
  we nearly maximize the real part of the first Laurent coefficient at infinity.
  A conductivity deformation, constructed through the classical Beltrami equation,
  then gives a scalar height close to the ordinary vertical coordinate, with arbitrarily small Dirichlet error.
  A level-set argument makes this height compatible with the retained tests.
  After flattening the countably many values belonging to nonpoint holes,
  a horizontal coordinate can be added as well. Together the two coordinates yield barriers around all source ends
  with arbitrarily small energy.

We save these barriers while enlarging the finite test lists.
  If a limiting model had a nonpoint omitted component, its projection on one axis would contain an interval of
  positive length. Every transverse line over that interval would force a saved barrier to change from one to zero
  in a bounded distance. The resulting fixed lower bound on its energy contradicts the construction.
  Thus every omitted component is a point, and component correspondence extends the limiting model to a sphere
  homeomorphism. Removability makes the normalized limit the identity;
  weak Sobolev compactness then proves the scalar extension theorem.

Finally we return to a conformal equivalence $f : Omega arrow.r Omega'$.
  Point components may correspond to disks, and disks to points,
  so direct continuation of a coordinate of $f$ need not be continuous.
  We mask the countably many disk-containing pairs and apply the scalar theorem to the remaining common point
  components. The masks show that their traces have null axial projections on almost every line.
  This use of linewise variation is related to the Sobolev-removability arguments of Jones and
  Smirnov #cite(label("JonesSmirnov2000")) and to the boundary-control methods in #cite(label("NY2020"))
  #cite(label("Ntalampekos2023")); the mask construction here accommodates all common point components
  simultaneously. Integrating the resulting slice estimates gives a flux inequality.
  Comparison with source and target area bounds forces equality, and hence forces $f$ to be Möbius.

Section 2 constructs component correspondence and records normalization bounds.
  Section 3 obtains models retaining prescribed tests. Section 4 supplies the conductivity and level-set
  estimates, and Section 5 uses them to prove scalar Sobolev extension.
  Section 6 constructs the masks and proves the trace statement. Section 7 completes the flux and area argument.

== 2 Contours, ends, and normalization <sec:preliminaries>

Write $D_R = { z in bb(C) : \| z \| < R }$. Unless specified otherwise,
  gradients and area elements in a Dirichlet integral are Euclidean.
  In dimension two that integral is conformally invariant; global $W^(1 \, 2) \( hat(bb(C)) \)$ uses spherical
  area for the function norm. A #emph[null family] of compact sets has only finitely many members of diameter
  greater than any given positive number.

The following topological fact concerns components, rather than a pointwise extension across their boundaries.

#thm([Lemma 2.1.])[
  (Component correspondence).  #emph[Let $g : V arrow.r V'$ be an orientation-preserving homeomorphism of sphere
    domains, with $oo in V ∩ V'$ and $g \( oo \) = oo$. There is a bijection $K mapsto
    K'$ between their complementary components. The relation
$ cal(R)_g \( z \) = cases(delim: "{", { g \( z \) } \, & z in V \,, K' \, & z in K subset hat(bb(C)) \\ V) $

 is upper semicontinuous: for every complementary component $K$ and every open neighborhood $W$ of $K'$,
   some open neighborhood $O$ of $K$ satisfies $cal(R)_g \( z \) subset W$ for all $z in O$.
   In particular the relation has closed graph. The analogous assertion holds for $g^(- 1)$.]
  #emph[If $hat(bb(C)) \\ V = B$ is totally disconnected, the inverse map $g^(- 1)$ extends continuously to the
    sphere by collapsing each target component to its corresponding point of $B$.
    If both complements are totally disconnected, $g$ extends to an orientation-preserving homeomorphism of the sphere.]
] <lem:ends>

#proof[
  We give the contour construction from the component quotient, using Moore’s classical decomposition theorem.
    Collapse every component of $F = hat(bb(C)) \\ V$ to a point, leaving domain points as singletons.
    This decomposition has closed equivalence relation. For convergent related pairs,
    a subsequence in domain singleton classes forces equal limits.
    Otherwise pass to a Hausdorff limit of complementary components;
    it is a continuum in $F$ containing both limiting points, which therefore remain in the same component.
    Every component $K$ is nonseparating. Indeed $V$ lies in one component of $hat(bb(C)) \\ K$;
    any other component $A$ would miss $V$, making $K union overline(A)$ a connected subset of $F$ strictly larger
    than $K$. Moore’s Decomposition Theorem #cite(label("Moore1925")) therefore gives a closed monotone quotient
    $pi : hat(bb(C)) arrow.r X$ onto a topological sphere. Its restriction to $V$ is a homeomorphism onto an open
    subset. The omitted set $B_X subset X$ is compact and totally disconnected:
    the inverse image of a continuum under a closed monotone map is connected,
    so a continuum in $B_X$ lifts into a single component of $F$.
  For a physical Jordan curve $C subset V$ avoiding infinity, $pi \|_C$ is a homeomorphism onto a Jordan curve.
    Every other decomposition element is connected and misses $C$, so each physical Jordan side is saturated.
    Their images are therefore disjoint connected open sets partitioning $X \\ pi \( C \)$,
    hence are its two Jordan sides; the bounded physical side maps to the side missing $pi \( oo \)$.
    The quotient disks below are these images of bounded physical disks.
  The compact metric space $B_X$ has a clopen base. Partition it into finitely many clopen pieces in small
    quotient Jordan neighborhoods. Their physical inverse images have disjoint open neighborhoods avoiding the
    other pieces. Regular levels of smooth cutoffs around these compact inverse images give finitely many smooth
    curves in $V$. Fill the outer curves, discard nested ones,
    and discard any resulting disk that misses the omitted set.
    Filling stays inside the chosen quotient Jordan neighborhood:
    the inverse image of its complement is connected, contains infinity, and misses the curve.
    It therefore lies on the unbounded side. This constructs finite families of physical Jordan disks with
    disjoint closures and smooth boundaries in $V$, whose quotient images cover $B_X$ by their interiors.
  Refine these covers with new closures inside old disks and quotient mesh tending to zero.
    Their closed exteriors are connected smooth cores $L_n subset V$ with
  $ L_n subset "int" L_(n + 1) \, wide union.big_n L_n = V . $
  For $b in B_X$, let $U_n \( b \) subset X$ be its containing quotient disk and let $C_n \( b \) =
    pi^(- 1) \( partial U_n \( b \) \) subset V$ be the corresponding physical boundary. Then
  $ overline(U_(n + 1) \( b \)) subset U_n \( b \) \, wide ⋂_n overline(U_n \( b \)) = { b } . $
  The corresponding physical disks shrink to $pi^(- 1) \( b \)$; their physical diameters need not tend to zero.
  All these curves and cores lie in $V$, where $g$ is already defined.
    The compact embedded surface $g \( L_n \)$ is the closed exterior of the disjoint bounded Jordan disks
    enclosed by its boundary curves. Orientation fixes their sides,
    since the interior of the core is connected and contains infinity.
    Let $Q_n \( b \)$ be the closed bounded disk enclosed by $g \( C_n \( b \) \)$. Refinement gives
  $ Q_(n + 1) \( b \) subset "int" Q_n \( b \) \, wide K'_b = ⋂_n Q_n \( b \) . $
  This intersection is a nonempty continuum missing $V'$, because the image cores exhaust $V'$.
    Conversely every point outside $V'$ lies in one image disk at each level.
    The corresponding nested source disks determine a unique $b$ by their quotient mesh.
    A connected subset of the target complement cannot cross an image contour,
    so $K'_b$ is exactly a complementary component. This proves the bijection without any countability assumption.
  Given an open $W supset K'_b$, nested compactness gives $Q_n \( b \) subset W$ for sufficiently large $n$.
    The physical inverse image of $U_n \( b \)$ is an open neighborhood of $pi^(- 1) \( b \)$,
    and every fiber over this neighborhood lies in $Q_n \( b \)$. This proves upper semicontinuity.
    Applying the same argument to $g^(- 1)$ proves the inverse assertion.
    Singleton source fibers then give the stated continuous collapse map.
    When both sets of fibers are singletons, the extension is a continuous bijection of compact spheres and hence
    a homeomorphism. Its orientation is fixed by its restriction to $V$. ◻
]

#thm([Lemma 2.2.])[
  (Normalized maps).  #emph[Let $G subset hat(bb(C))$ be a fixed domain whose complement is contained in
    $D_(R_0)$. The univalent conformal maps on $G$ with expansion
$ h \( z \) = z + frac(b \( h \), z) + O \( z^(- 2) \) wide \( z arrow.r oo \) $

 have uniformly bounded $b \( h \)$ and uniformly bounded omitted sets.
   They form a normal family on compact subsets of $G$, and every convergent subsequence has a nonconstant
   univalent limit with the same normalization. Uniformly over this family, $h \( z \) = z +
   O \( \| z \|^(- 1) \)$ for large $\| z \|$.]
] <lem:normalization>

#proof[
  Apply the Exterior Area Theorem #cite(label("Ahlfors1973")) to $h \( R_0 zeta \) \/ R_0$.
    For $h \( z \) = z + sum_(n gt.eq 1) alpha_n z^(- n)$ it gives
  $ sum_(n gt.eq 1) n \| alpha_n \|^2 R_0^(- 2 n) lt.eq R_0^2 . $
  Thus $\| b \( h \) \| lt.eq R_0^2$, and Cauchy–Schwarz gives the asserted uniform exterior estimate.
    In particular $h \( partial D_(2 R_0) \)$ lies in a fixed disk.
    Its bounded side contains the whole omitted set and $h \( G ∩ D_(2 R_0) \)$:
    injectivity prevents an interior image point from crossing this image circle,
    and points just inside the circle lie on its bounded side.
    Thus the maps are uniformly bounded on $G ∩ D_(2 R_0)$ as well as on exterior compact sets,
    proving local normality. The uniform exterior estimate prevents a constant limit and preserves the
    normalization. Hurwitz’s Theorem then makes every limit univalent. ◻
]

#thm([Lemma 2.3.])[
  (Area zero).  #emph[A conformally removable compact set has spherical area zero.
    Every compact subset of a conformally removable compact set is conformally removable.]
] <lem:null-area>

#proof[
  If a removable compact set had positive area, choose a bounded measurable subset $A$ of positive planar area in
    a coordinate chart and a coefficient $mu = k upright(bold(1))_A$ with $0 < k < 1$.
    The Measurable Riemann Mapping Theorem #cite(label("Ahlfors2006")) gives an orientation-preserving
    quasiconformal sphere homeomorphism with this Beltrami coefficient.
    It is conformal off the compact set and is not Möbius, since its coefficient is nonzero on a set of positive
    area. This is a contradiction. For the second assertion, a homeomorphism conformal off a smaller compact set
    is also conformal off the larger one, so the defining removability implication applies. ◻
]

== 3 Models retaining finitely many scalar tests <sec:models>

Let $B subset bb(C)$ be compact and totally disconnected, and put $G = hat(bb(C)) \\ B$.
  For a normalized univalent map $h$ on $G$, Lemma 2 gives a continuous collapse map $pi_h : hat(bb(C)) arrow.r
  hat(bb(C))$: it equals $h^(- 1)$ on $h \( G \)$ and sends the complementary component corresponding to $b in
  B$ to $b$.

#prodef([Definition 3.1.])[
  Let $u_1 \, dots.h \, u_m$ be bounded continuous real functions on $hat(bb(C))$ whose restrictions to $G$ belong
    to $W^(1 \, 2) \( G \)$. A #emph[model] for this list is a univalent conformal map
  $ h \( z \) = z + frac(b \( h \), z) + O \( z^(- 2) \) wide \( z arrow.r oo \) $
  such that its nonpoint complementary components form a finite or countable null family of closed Jordan disks, and
  $ U_i = u_i compose pi_h in W^(1 \, 2) \( hat(bb(C)) \) \, wide nabla U_i = 0 quad
    upright("a.e. on ") hat(bb(C)) \\ h \( G \) . $
  A family is null if only finitely many members have diameter greater than any prescribed positive number.
] <def:model>

The conductivity argument below postcomposes models with quasiconformal homeomorphisms.
  These preserve Jordan disks and null families but need not preserve circles,
  which is why the model class allows Jordan disks. The existence result below will nevertheless supply round disks.

We require the pairwise trace condition

#[#set math.equation(numbering: n => "(3.1)")
 $ "area" #scale(x: 120%, y: 120%)[\(] \( u_i \, u_j \) \( B \) #scale(x: 120%, y: 120%)[\)] =
   0 wide \( i eq.not j \) . $ <eq:pair-null>]

Only the values on $B$ occur in this condition.

#thm([Proposition 3.2.])[
  #emph[Every finite list in Definition 5 satisfying (3.1) has a model.
    A model can, in fact, be chosen with circle-domain image.]
] <prop:models>

The uniformization input below is the finite-transfer construction of #cite(label("KoebeCompanion")).
  Its control of the retained scalar tests is essential; circle-domain existence by itself would not give Proposition 6.

=== 3.1 The precise retained-test input <the-precise-retained-test-input>

We use the following specialization of #cite(label("KoebeCompanion")).
  It is a consequence of the companion’s , whose selection begins with the prescribed tests and preserves them
  through all later compatible extensions.

First suppose the tests $u_1 \, dots.h \, u_m$ in Proposition 6 are smooth on $G$.
  For any sequence $epsilon_n > 0$ tending to zero, there are nested compact smooth cores $K_n subset G$,
  finite bordered completions $Q_n$ containing neighborhoods of $K_n$ with their original conformal structure,
  normalized conformal maps $f_n : Q_n^compose arrow.r Omega_n$ onto finite circle domains,
  and smooth transferred tests $v_(i \, n)$ on $Omega_n$ with the following properties.
  Every compact subset of $G$ is contained in $"int" K_n$ for all sufficiently large $n$, and

#[#set math.equation(numbering: n => "(3.2)")
 $ v_(i \, n) compose f_n & = u_i &  & upright("near ") K_n \,\
integral_(Omega_n \\ f_n \( K_n \)) \| nabla v_(i \, n) \|^2 & lt.eq epsilon_n^2 \,\
sum_T A_(i \, n) \( T \)^2 & lt.eq epsilon_n^2 . $ <eq:model-core>]

Here $T$ ranges over the complementary round disks of $Omega_n$,
  and the cluster values of $v_(i \, n)$ at $T$ lie in an interval of length $A_(i \, n) \( T \)$.
  The first equality also preserves energy near $K_n$. The companion actually bounds the sum of the tail energies
  over the whole retained finite list by $epsilon_n^2$.

These assertions hold on one shared sequence. In particular,
  every fixed source contour and its collar are retained eventually.
  If $C$ is an oriented source Jordan contour and $z in K_n$ lies on its bounded side,
  then $f_n \( z \)$ lies on the bounded side of $f_n \( C \)$; the converse holds for retained-core points.
  After passage to a subsequence,

#[#set math.equation(numbering: n => "(3.3)")
 $ f_n arrow.r h quad upright("locally uniformly on ") G \, wide
   h \( G \) upright(" is a circle domain") . $ <eq:model-map-limit>]

All omitted disks of the finite domains lie in one fixed disk $D_L$.
  For every fixed source dust contour, its bounded target sides also lie in a fixed disk.
  The omitted-set bound depends only on a fixed exterior radius for $G$;
  the contour bound may also depend on that fixed contour. Neither depends on the number of retained tests.

Here the quotient sphere in the scalar corollary is the source sphere itself,
  because every source complementary component is a point. Thus the prescribed $u_i$ are continuous on that
  quotient, smooth on $G$, and of finite Dirichlet energy there.
  Their boundary value at $b$ is the single number $u_i \( b \)$,
  and condition (3.1) is precisely the corollary’s pairwise trace hypothesis.
  The corollary retains all these original tests while adding auxiliary tests for the circle-domain selection.
  Consequently the core agreement, energy and oscillation bounds,
  and contour assertions above hold simultaneously for the prescribed list. No countability assumption on $B$ is needed.

It remains to turn these finite transferred tests into their prescribed continuous Sobolev continuations on the
  limiting sphere. That passage, including the values on positive-area point dust, is proved next.

=== 3.2 Filling holes and identifying the limiting tests <filling-holes-and-identifying-the-limiting-tests>

We record explicitly the small error introduced by filling round holes.
  Suppose $v$ is bounded and locally Sobolev on a finite circle domain containing infinity, has finite energy,
  and has cluster interval of length at most $A \( T \)$ at each hole $T$.
  Fill $T$ by a constant in its cluster interval, call the resulting function $tilde(v)$,
  and extend $nabla v$ by zero on the holes to a vector field $g$.
  If $r \( T \)$ is the radius of $T$, then for $j = 1 \, 2$ and $phi in C_c^oo \( bb(C) \)$,

#[#set math.equation(numbering: n => "(3.4)")
 $ lr(|integral tilde(v) thin partial_j phi + integral g_j phi|) lt.eq
   4 parallel phi parallel_oo sum_T r \( T \) A \( T \) . $ <eq:model-jump>]

Indeed, on almost every line parallel to the $j$th axis the function is locally absolutely continuous on each
  domain interval and has finite variation on its bounded portions relevant to the support of the test function.
  At either endpoint of a hole the jump to its chosen constant is at most $A \( T \)$.
  Integrating the two endpoint errors over the transverse projection of that hole, of length $2 r \( T \)$,
  gives (3.4). Point holes affect only finitely many transverse parameters.
  Compactly supported test functions remove any issue at infinity.

Fix one original smooth test $u = u_i$. Clip $v_(i \, n)$ to a fixed closed interval containing the range of $u$.
  This preserves (3.2), decreases energy and cluster oscillations, and supplies a uniform bound.
  Fill the holes as above, obtaining $tilde(v)_n$, and write $g_n$ for the domain gradient extended by zero over
  the holes. Disjointness and the common target bound imply

$ sum_T r_n \( T \)^2 lt.eq L^2 \, wide sum_T r_n \( T \) A_(i \, n) \( T \) lt.eq L epsilon_n . $

Moreover, writing $E_u = integral_G \| nabla u \|^2$, we have

#[#set math.equation(numbering: n => "(3.5)")
 $ integral \| g_n \|^2 lt.eq E_u + epsilon_n^2 . $ <eq:model-energy-bound>]

Take weak subsequential limits of the bounded functions in spherical $L^2$ and of their differentials in $L^2$.
  Equation (3.4) shows that the limiting differential is the weak derivative of the limiting function $V$.
  This argument takes place in the planar chart containing all holes;
  near infinity the retained core gives the ordinary Sobolev derivatives.
  Hence $V in W^(1 \, 2) \( hat(bb(C)) \)$ and $integral \| nabla V \|^2 lt.eq E_u$.
  On compact subsets of $h \( G \)$, inverse convergence and (3.2) give

$ V = u compose h^(- 1) quad upright("a.e. on ") h \( G \) . $

By conformal invariance the energy of this function on $h \( G \)$ is already $E_u$. Thus

#[#set math.equation(numbering: n => "(3.6)")
 $ nabla V = 0 quad upright("a.e. on ") F := hat(bb(C)) \\ h \( G \) . $ <eq:model-energy-saturation>]

Zero gradient alone does not identify values on a positive-area set of point components.
  We now determine those values. Fix a source dust disk $U$ with smooth boundary $C subset G$,
  and an interval $\[ alpha \, beta \]$ containing $u \( overline(U) \)$.
  Retain $C$ and a collar in every sufficiently late core. Let $O_n$ and $O$ be the bounded sides of $f_n \( C \)$
  and $h \( C \)$, respectively. Define

$ e_n^(+) = cases(delim: "{", \( tilde(v)_n - beta \)_(+) & upright("on ") O_n \,, 0 & upright("off ") O_n \,)
  wide e_n^(-) = cases(delim: "{", \( alpha - tilde(v)_n \)_(+) & upright("on ") O_n \,, 0 & upright("off ") O_n .) $

Every retained-core point mapping into $O_n$ comes from $U$, by the contour-side correspondence.
  Both excesses therefore vanish on those core pieces and on an inner collar of $f_n \( C \)$.
  Extending them by zero creates no jump across that contour.
  Their extended gradient norms are at most $epsilon_n$, by (3.2), and their hole-jump errors satisfy (3.4),
  since positive-part maps are $1$-Lipschitz. They are uniformly bounded and supported in one fixed disk.
  Every weak limit consequently has zero distributional gradient and bounded support, and is zero.

To pass this conclusion to $V$, take a nonnegative smooth function $phi$ compactly supported in $O$.
  Winding-number stability puts its support in $O_n$ eventually. Therefore

$ integral phi \( tilde(v)_n - beta \) lt.eq integral phi e_n^(+) arrow.r 0 \, wide
  integral phi \( alpha - tilde(v)_n \) lt.eq integral phi e_n^(-) arrow.r 0 . $

Weak convergence gives $alpha lt.eq V lt.eq beta$ almost everywhere on $O$.
  In particular, we have not interchanged a nonlinear operation with a weak limit.

For every integer $ell gt.eq 1$, choose one finite source dust-disk cover of $B$ so fine that $u$ oscillates by
  less than $1 \/ ell$ on each closed disk. Apply the preceding conclusion to those finitely many intervals.
  The union of all their exceptional null sets, over all $ell$, is still null.
  If $w in F$ is outside this union and its source end is $b$,
  the whole component containing $w$ lies inside the image contour of each cover disk containing $b$.
  It follows that $\| V \( w \) - u \( b \) \| lt.eq 1 \/ ell$ for every $ell$, and hence $V \( w \) = u \( b \)$.
  This also identifies the values on a collection of point components of positive total area.

The continuous function $u compose pi_h$ now agrees almost everywhere with $V$.
  It is the required Sobolev representative, with the prescribed value on #emph[every] complementary component,
  and (3.6) gives its zero gradient there. The argument applies to each of the finitely many tests.
  Finally, the nonpoint components of $F$ are disjoint round disks in a bounded region.
  Their squared radii have finite sum, so they are countable and form a null family.
  This proves Proposition 6 for smooth tests.

=== 3.3 Exact traces under smoothing <exact-traces-under-smoothing>

We use the following elementary extension fact.

#thm([Lemma 3.3.])[
  #emph[Let $F subset hat(bb(C))$ be closed. If $w in C \( hat(bb(C)) \, bb(R) \)$ vanishes on $F$,
    is locally Sobolev on $hat(bb(C)) \\ F$, and has finite Dirichlet energy there,
    then $w in W^(1 \, 2) \( hat(bb(C)) \)$ and $nabla w = 0$ almost everywhere on $F$.]
] <lem:zero-trace-extension>

#proof[
  For $delta > 0$ the signed truncation $w_delta = "sgn" \( w \) \( \| w \| - delta \)_(+)$ has compact support
    away from $F$. It is globally Sobolev by localization, and its gradient norm is at most that of $w$ off $F$;
    its gradient is zero on $F$. Since $parallel w_delta - w parallel_oo lt.eq delta$,
    weak compactness proves the assertion, including the vanishing gradient on $F$. ◻
]

For a continuous test $u$ as in the proposition, choose a locally finite smooth partition of unity $\( rho_k \)$
  on $G$, with each support compact in $G$. Local mollification gives smooth functions $a_k$ near these supports,
  with both uniform error and local gradient error at most $eta_k$. Choose the positive $eta_k$ so that

$ eta_k arrow.r 0 \, wide sum_k eta_k #scale(x: 120%, y: 120%)[\(] 1 +
  parallel nabla rho_k parallel_2 #scale(x: 120%, y: 120%)[\)] < oo . $

Then $hat(u) = sum_k rho_k a_k$ is bounded and smooth on $G$, and the product rule shows that $nabla hat(u) -
  nabla u in L^2 \( G \)$. As a point approaches $B$, every fixed finite collection of supports is eventually
  avoided. The bound $\| hat(u) - u \| lt.eq max { eta_k : rho_k eq.not 0 }$ therefore tends to zero there.
  Defining $hat(u) = u$ on $B$ gives a continuous function on the sphere with exactly the original trace.
  The same construction in a chart at infinity is included in the partition.

Apply this to each test. Their traces and the pairwise condition (3.1) are unchanged.
  The smooth case provides one circle-domain model $h$ for the $hat(u)_i$. Each function

$ w_i = \( u_i - hat(u)_i \) compose pi_h $

is continuous, vanishes on $F$, is locally Sobolev on $h \( G \)$,
  and has finite energy there by conformal invariance. Lemma 7 makes it globally Sobolev with zero gradient on
  $F$. Adding it to $hat(u)_i compose pi_h$ proves the model properties for the original $u_i$.
  If $B$ is empty, the identity is already a model. Proposition 6 follows in all cases.

== 4 Almost straight coordinates and null trace pairs <sec:conductivity>

Fix a compact totally disconnected set $B subset bb(C)$, put $G = hat(bb(C)) \\ B$,
  and fix a finite list of tests satisfying (3.1). Let $cal(M)$ be its nonempty class of models from Definition 5. Write

$ h \( z \) = z + frac(b \( h \), z) + O \( z^(- 2) \) \, wide beta = sup_(h in cal(M)) Re b \( h \) . $

Lemma 3 makes $beta$ finite and places all model omitted sets in one fixed disk.
  In this section $w = X + i Y$ denotes the target coordinate.

We construct a height coordinate close to the usual vertical coordinate on compact sets,
  with a small global gradient error. The subsequent level-set argument will allow it to be combined with the
  retained tests while preserving the pairwise trace condition.

#thm([Proposition 4.1.])[
  #emph[Suppose $d > 0$ and $h in cal(M)$ satisfies $Re b \( h \) > beta - d$. Set $F = bb(C) \\ h \( G \)$.
    There is a continuous $v in W_(upright("loc"))^(1 \, 2) \( bb(C) \)$, constant on every component of $F$,
    such that $nabla v = 0$ almost everywhere on $F$ and
#[#set math.equation(numbering: n => "(4.1)")
 $ integral_(bb(C)) \| nabla \( v - Y \) \|^2 thin upright(d) A lt.eq 2 pi d . $ <eq:height-energy>]

 The function $v$ is a locally uniform limit of imaginary coordinates of normalized plane homeomorphisms conformal
   outside a fixed disk. Moreover, for each compact $K subset bb(C)$, the quantities $parallel v -
   Y parallel_(C \( K \))$ tend to zero as $d arrow.b 0$, uniformly over these choices of nearly maximizing
   models. The exterior bounds used here depend only on $B$.]
] <prop:height>

#proof[
  For an integer $n gt.eq 2$, set $k = n$ on $F$ and $k = 1$ elsewhere.
    We first construct the principal quasiconformal coordinate $phi.alt_n = a_n + i v_n$ satisfying
  #[#set math.equation(numbering: n => "(4.2)")
   $ \( a_n \)_X = k \( v_n \)_Y \, wide \( a_n \)_Y = - k \( v_n \)_X \, wide phi.alt_n \( w \) = w + c_n / w +
     O \( w^(- 2) \) . $ <eq:conductivity-system>]
  Indeed this system is equivalent to the real-linear Beltrami equation
  $ \( phi.alt_n \)_(macron(w)) = q thin overline(\( phi.alt_n \)_w) \, wide q = frac(k - 1, k + 1) . $
  We use the classical Cauchy–Beurling construction of the Beltrami solution #cite(label("AhlforsBers1960"))
    Sections 1–3. Let $cal(C)$ be the plane Cauchy transform and $cal(S) =
    partial cal(C)$ its $L^2$-isometric Beurling transform, with $macron(partial) cal(C) g = g$. The equation
  $ g = q thin overline(1 + cal(S) g) $
  is an affine contraction on $L^2 \( bb(C) \)$ considered as a real Banach space.
    Its solution is supported on $F$. Thus $phi.alt_n = w + cal(C)
    g$ is locally Sobolev and has the expansion in (4.2); compact support also makes $g$ integrable.
    Set $mu = \( phi.alt_n \)_(macron(w)) \/ \( phi.alt_n \)_w$ where the denominator is nonzero, and $mu =
    0$ otherwise. The distortion inequality $\| \( phi.alt_n \)_(macron(w)) \| lt.eq
    parallel q parallel_oo \| \( phi.alt_n \)_w \|$ shows that $\( phi.alt_n \)_(macron(w)) =
    mu \( phi.alt_n \)_w$ almost everywhere, $parallel mu parallel_oo < 1$, and $mu = 0$ off $F$.
    Standard planar weak-solution regularity, the Measurable Riemann Mapping Theorem,
    and holomorphic factorization #cite(label("AhlforsBers1960")) #cite(label("Ahlfors2006"))
    #cite(label("AstalaIwaniecMartin2009")) give a continuous representative $phi.alt_n = H compose psi$,
    where $psi$ is the principal quasiconformal plane homeomorphism solving $psi_(macron(w)) =
    mu psi_w$ and $H$ is entire. Since $psi \( w \) = w + O \( 1 \/ w \)$ and $phi.alt_n$ has the displayed
    principal expansion, $H \( w \) = w + O \( 1 \/ w \)$ near infinity.
    Liouville’s Theorem makes $H$ the identity. Consequently $phi.alt_n$ itself is a homeomorphism.
    Direct differentiation gives the signs and the Jacobian:
  #[#set math.equation(numbering: n => "(4.3)")
   $ \( phi.alt_n \)_w = frac(k + 1, 2) #scale(x: 120%, y: 120%)[\(] \( v_n \)_Y +
     i \( v_n \)_X #scale(x: 120%, y: 120%)[\)] \, quad \( phi.alt_n \)_(macron(w)) =
     frac(k - 1, 2) #scale(x: 120%, y: 120%)[\(] \( v_n \)_Y - i \( v_n \)_X #scale(x: 120%, y: 120%)[\)] \, quad
     J_(phi.alt_n) = k \| nabla v_n \|^2 . $ <eq:conductivity-derivatives>]
  The map $phi.alt_n compose h$ is again a model. It is conformal on $G$, and its new coefficient is $b \( h \) +
    c_n$. A homeomorphism carries complementary components to complementary components,
    preserving points and Jordan disks; uniform continuity on a compact set containing $F$ preserves the
    null-family property. For an old continued test $U$, its new continuation is exactly $U compose
    phi.alt_n^(- 1)$, with the same prescribed constant on the corresponding component.
    Quasiconformal composition preserves its global $W^(1 \, 2) \( hat(bb(C)) \)$ membership and its zero gradient
    on the transformed complement. To see also the null-set issue in this statement,
    approximate the continuous $U$ uniformly and strongly in $W^(1 \, 2)$ by smooth sphere functions.
    The quasiconformal Dirichlet inequality makes their compositions converge in gradient norm,
    and uniform convergence identifies the limit. The almost-everywhere chain rule then applies.
    The forward Lusin N property of $phi.alt_n$ maps the source-null exceptions to target-null sets,
    so the resulting gradient vanishes almost everywhere on $phi.alt_n \( F \)$. Approximate maximality therefore gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ Re c_n lt.eq d . $ <eq:coefficient-gain>]
  For $D$ larger than a disk containing $F$, the area formula and the boundary Laurent expansion give
  $ integral_(D_D) J_(phi.alt_n) thin upright(d) A = "area" #scale(x: 120%, y: 120%)[\(] phi.alt_n \( D_D \)
    #scale(x: 120%, y: 120%)[\)] = pi D^2 + o \( 1 \) quad \( D arrow.r oo \) . $
  Here $D_D = { w : \| w \| < D }$. The Divergence Theorem,
    or the weak boundary formula on this smooth exterior circle, gives the exact identity
  $ integral_(D_D) \( v_n \)_Y thin upright(d) A = integral_(partial D_D) v_n thin nu_Y thin upright(d) s =
    pi D^2 - pi Re c_n \; $
  all other Laurent terms have zero contribution. Expanding the square, using (4.3), and then letting $D arrow.r
    oo$ yields
  #[#set math.equation(numbering: n => "(4.5)")
   $ integral_(bb(C)) \| nabla \( v_n - Y \) \|^2 thin upright(d) A + \( n - 1 \) integral_F \| nabla v_n \|^2
     thin upright(d) A = 2 pi Re c_n lt.eq 2 pi d . $ <eq:conductivity-energy>]
  In particular both terms on the left are controlled, with the stated normalization constant.
  We next obtain compactness without a uniform quasiconformal distortion bound.
    A coordinate of a plane homeomorphism attains its maximum and minimum on the boundary of every relatively
    compact open set: an interior coordinate extremum contradicts openness.
    For almost every circle centered at $x$, the Sobolev circle restriction and Cauchy–Schwarz therefore give,
    for $0 < r < R$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ #scale(x: 120%, y: 120%)[\(] "osc"_(overline(D \( x \, r \))) v_n #scale(x: 120%, y: 120%)[\)]^2
     log \( R \/ r \) lt.eq 2 pi integral_(D \( x \, R \)) \| nabla v_n \|^2 thin upright(d) A .
     $ <eq:coordinate-modulus>]
  One obtains this inequality by bounding the oscillation on the smaller disk by that on a circle of radius $t
    in \( r \, R \)$, bounding the latter by the integral of $\| nabla v_n \|$ around that circle,
    and integrating with respect to $upright(d) t \/ t$. Equation (4.5) bounds the right-hand side locally,
    uniformly in $n$. Exterior univalence and principal normalization, on a common exterior disk, give
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| v_n \( w \) - Y \| lt.eq C \/ \| w \| wide \( \| w \| gt.eq R_0 \) \, $ <eq:height-exterior>]
  where $C \, R_0$ depend only on the common bound for $F$, hence only on $B$.
    The maximum and minimum principles give uniform bounds on compact sets as well.
    Thus (4.6) gives local equicontinuity.
  Pass to a locally uniform and locally Sobolev-weak subsequential limit $v$.
    Lower semicontinuity proves (4.1), and the second term of (4.5) forces $nabla v = 0$ almost everywhere on $F$.
    The function is therefore constant on the connected interior of each Jordan disk component,
    and continuity extends the same value to its boundary. Singleton components need no argument.
    The coordinate maximum and minimum principles and the exterior estimate pass to the limit.
  Finally, allow the nearly maximizing models to vary and let $d arrow.r 0$.
    The same modulus and exterior bounds give compactness on every compact set.
    Any subsequential limit of $v - Y$ has zero distributional gradient by (4.1), hence is constant.
    Estimate (4.7), with arbitrarily large $\| w \|$, makes the constant zero.
    This proves the uniform compact-set closeness asserted in the proposition. ◻
]

#thm([Lemma 4.2.])[
  #emph[Let $F$ and $v$ be as in Proposition 8. Every point $x in
    bb(C)$ lies in a compact nondegenerate continuum of its $v$-level contained in any prescribed closed ball of
    positive radius centered at $x$ and meeting that ball’s boundary.
    If $U in C \( bb(C) \) ∩ W_(upright("loc"))^(1 \, 2) \( bb(C) \)$ is real-valued and $nabla U =
    0$ almost everywhere on $F$, then
#[#set math.equation(numbering: n => "(4.8)")
 $ "area" #scale(x: 120%, y: 120%)[\(] \( U \, v \) \( F \) #scale(x: 120%, y: 120%)[\)] = 0 \, wide
   "area" #scale(x: 120%, y: 120%)[\(] \( U \, X \) \( F \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:level-null-pairs>]

]
] <lem:level-pairs>

#proof[
  For the approximating homeomorphism $phi.alt_n$, the inverse image of the horizontal line through
    $phi.alt_n \( x \)$ is a proper simple curve through $x$.
    Stop one branch at its first exit from the prescribed ball.
    The resulting compact arcs have a Hausdorff convergent subsequence.
    Their limit is connected, contains $x$, and meets the ball boundary.
    Local uniform convergence $v_n arrow.r v$ places it in the actual level $v^(- 1) \( v \( x \) \)$.
    This proves the first assertion pointwise.
  We use the scalar Sobolev Coarea Theorem, due to Federer #cite(label("Federer1969")),
    in the precise-representative form of Malý, Swanson, and Ziemer #cite(label("MSZ2003")) Theorem 1.1.
    With domain dimension $2$, target dimension $1$, and exponent $2$, it gives,
    for every nonnegative Borel weight $a$ supported in a bounded region,
  #[#set math.equation(numbering: n => "(4.9)")
   $ integral_(bb(R)) integral_(v^(- 1) \( t \)) a thin upright(d) cal(H)^1 thin upright(d) t =
     integral_(bb(C)) a \| nabla v \| thin upright(d) A . $ <eq:scalar-coarea>]
  Continuity makes $v$ equal everywhere to its precise representative, so these are the full pointwise level sets.
    In particular, almost every level has finite length in any fixed compact box.
    Formula (4.9) also implies that planar null sets have zero length on almost every level.
  Choose a closed box $Q$ with $F$ in its interior. On a neighborhood of $Q$,
    smooth approximation of the continuous Sobolev function $U$ provides $U_j arrow.r U$ uniformly on $Q$ with
  $ sum_j parallel nabla U_j - nabla U parallel_(L^2 \( Q \)) < oo . $
  Let $g$ be a nonnegative Borel representative of $\| nabla U \|$.
    By (4.9) and Cauchy–Schwarz, outside one null set of values $t$ we have simultaneously
  $ cal(H)^1 \( Q ∩ v^(- 1) \( t \) \) < oo \, wide integral_(Q ∩ v^(- 1) \( t \)) g thin upright(d) cal(H)^1 < oo \,\
sum_j integral_(Q ∩ v^(- 1) \( t \)) \| nabla U_j - nabla U \| thin upright(d) cal(H)^1 < oo \, wide
  integral_(F ∩ v^(- 1) \( t \)) g thin upright(d) cal(H)^1 = 0 . $
  The last assertion uses $g = 0$ almost everywhere on $F$;
    the coarea identity makes the choice on the planar-null exceptional set irrelevant.
    For every such good level and #emph[every] rectifiable simple arc $gamma subset Q ∩ v^(- 1) \( t \)$,
    the smooth arc inequality passes to the limit to give
  #[#set math.equation(numbering: n => "(4.10)")
   $ \| U \( x \) - U \( y \) \| lt.eq integral_gamma g thin upright(d) cal(H)^1
     wide \( x \, y upright(" the endpoints of ") gamma \) . $ <eq:level-arc>]
  Indeed the gradient error on any arc is bounded by the error on the entire level section,
    whereas uniform convergence controls both endpoints. Thus the exceptional levels do not depend on the choice
    of arc or its endpoints.
  Fix a good level. Its nondegenerate components in $Q$ form an at most countable family of finite-length
    continua. Each such continuum is locally connected: failure of local connectedness, by boundary bumping,
    would give infinitely many disjoint subcontinua of diameter bounded below, contrary to finite length.
    A locally connected metric continuum is locally arcwise connected,
    so its connected relatively open subsets are arcwise connected.
    All their simple arcs are rectifiable, since their lengths are bounded by the length of the whole continuum.
  Let $K$ be one of these components and $A = F ∩ K$. The finite measure $g cal(H)^1 \|_K$ vanishes on $A$.
    Given $epsilon.alt > 0$, choose a relatively open neighborhood $O$ of $A$ in $K$ with $integral_O g thin
    upright(d) cal(H)^1 < epsilon.alt$. Local connectedness and second countability make its connected components
    $O_i$ a countable family of relatively open sets. Joining any two points of $O_i$ by a simple arc there and
    using (4.10) shows
  $ "diam" U \( O_i \) lt.eq integral_(O_i) g thin upright(d) cal(H)^1 . $
  Since each $U \( O_i \)$ is an interval, the outer length of $U \( A \)$ is at most $epsilon.alt$,
    and hence is zero. Every point of $F ∩ v^(- 1) \( t \)$ belongs to a nondegenerate component of $Q ∩
    v^(- 1) \( t \)$ by the first assertion of the lemma, using a small ball inside $Q$.
    Thus the countable family of components covers #emph[every] such point,
    and $U \( F ∩ v^(- 1) \( t \) \)$ has length zero. The compact set $\( U \, v \) \( F \)$ now has almost every
    horizontal section of length zero. Fubini proves its area is zero.
  For the companion pair, the continuous Sobolev representative has the absolute continuity on lines (ACL)
    property. Thus $U$ is absolutely continuous on almost every vertical line.
    Fubini gives $partial_Y U = 0$ almost everywhere on that line’s intersection with $F$.
    The one-dimensional area inequality for an absolutely continuous function therefore makes the image of this
    intersection length-null. Applying Fubini to the compact set $\( U \, X \) \( F \)$ proves the second equality
    in (4.8). ◻
]

== 5 Sobolev extension across removable dust <sec:sobolev>

Throughout this section, $B subset bb(C)$ is compact and totally disconnected, and $G = hat(bb(C)) \\ B$.
  For a finite vector of scalar functions, the gradient norm means the $L^2$ norm of its matrix of gradients.
  Small changes of an old test will always mean small changes both uniformly on the sphere and in gradient norm on $G$.

#thm([Theorem 5.1.])[
  (Continuous Sobolev extension).  #emph[If $B subset bb(C)$ is compact, totally disconnected,
    and conformally removable, then every continuous real function $u$ on $hat(bb(C))$ whose restriction to $G =
    hat(bb(C)) \\ B$ belongs to $W^(1 \, 2) \( G \)$ belongs to $W^(1 \, 2) \( hat(bb(C)) \)$.]
] <thm:dust-sobolev>

The next lemma supplies small-energy barriers around the source ends.
  Its stability assertion will let us retain those barriers while adding further tests.

#thm([Lemma 5.2.])[
  (Appending separating tests).  #emph[There is a radius $D_0$, depending only on $B$,
    with the following property. Suppose $u_1 \, dots.h \, u_m$ satisfy the hypotheses of Proposition 6.
    Given $delta \, eta > 0$, they may be replaced by tests $tilde(u)_i$ satisfying
$ parallel tilde(u)_i - u_i parallel_oo < delta \, wide parallel nabla \( tilde(u)_i - u_i \) parallel_(2 \, G) <
  delta \, $

 and two tests $p \, q$ may be appended, so that the enlarged finite list still satisfies the pair-null
   condition (3.1). There are finitely many smooth Jordan curves $gamma_l subset G ∩
   D_(D_0)$ whose bounded sides cover $B$, and smooth functions $Phi_l : bb(R)^2 arrow.r \[ 0 \, 1 \]$, such that
#[#set math.equation(numbering: n => "(5.1)")
 $ Phi_l \( p \, q \) = 1 upright(" near ") gamma_l \, wide Phi_l \( p \, q \) =
   0 upright(" on a fixed collar of ") partial D_(D_0) \,\
parallel nabla Phi_l \( p \, q \) parallel_(2 \, G ∩ D_(D_0)) < eta . $ <eq:saved-barriers>]

 The barrier conclusions (5.1), with the same curves and functions $Phi_l$,
   survive sufficiently small subsequent changes of the coordinates $p \, q$.]
] <lem:append-tests>

#proof[
  We construct a continuous pair $P = \( p \, q \)$ and obtain the barriers by composing it with translates of a
    radial cutoff of small Dirichlet energy. By conformal invariance,
    composing the cutoff with a model map $h$ does not increase its Dirichlet energy,
    so we will compare $P$ with $\( Re h \, Im h \)$ on a fixed source disk.
    Proposition 8 supplies a height $v$ whose pullback gives the vertical coordinate.
    We make small range compressions of this pullback and the old tests so that they become constant near every
    source end corresponding to a nonpoint model hole, then modify the horizontal coordinate there.
    These modifications preserve pair-nullity and make the gradient error small on the source disk.
    The vertical error is uniformly small; the horizontal changes are confined to neighborhoods where $h$ has
    small energy.
  Choose $a gt.eq 1$ with $B subset D_a$. For every normalized univalent map $h$ on $G$, the Exterior Area Theorem gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ \| h \( z \) - z \| lt.eq a sqrt(- log \( 1 - a^2 \/ \| z \|^2 \)) wide \( \| z \| > a \) . $ <eq:sob-exterior>]
  Indeed, apply Cauchy–Schwarz to the Laurent series and the area-theorem coefficient bound.
    Hence $h \( partial D_(2 a) \) subset D_(3 a)$, and the omitted set $F =
    bb(C) \\ h \( G \)$ lies on its bounded side. In particular, $F subset D_(3 a)$ for every model of every list.
    Fix $D_0 = 64 a$. The image of $G ∩ D_(65 a)$ lies in $D_(67 a)$;
    these uniform bounds also bound the energy of $\( Re h \, Im h \)$ on that source disk.
  Choose a smooth radial cutoff $Phi$, equal to one on a disk of radius $r > 0$ and zero outside $D_(4 a)$,
    with $parallel nabla Phi parallel_(2 \, bb(C)) < eta \/ 3$.
    Such a cutoff is obtained by smoothing a logarithmic profile and taking $r$ sufficiently small.
    All its translates have the same derivative bounds. We shall use translates centered at the eventual traces of
    $\( p \, q \)$ on $B$.
  By Proposition 8, take a model $h$ sufficiently close to the supremum of its real Laurent coefficient that the
    associated height $v$ satisfies
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel v - Y parallel_(oo \, D_(67 a)) med upright("and") med
     parallel nabla \( v - Y \) parallel_(2 \, bb(C)) quad upright("as small as required below") \, wide
     Y \( w \) = Im w . $ <eq:height-errors-for-tests>]
  Write $U_i$ for the global model continuation of $u_i$. The function $v$ is constant on every component of $F$,
    so $v compose h$ extends continuously to $B$ by Lemma 2.
  #emph[Flattening the hole values.] For a continuous, locally Sobolev real function $s$ of finite Dirichlet
    energy on a region, the measure
  $ mu_s \( I \) = integral_({ s in I }) \| nabla s \|^2 $
  has no atom at any real number: the Sobolev gradient is zero almost everywhere on each fixed level set.
    Thus, given countably many values, we can surround them by open intervals whose total length and total
    $mu_s$-measure are arbitrarily small. If $O$ is their union, then
  $ T \( t \) = integral_0^t upright(bold(1))_(bb(R) \\ O) \( tau \) thin upright(d) tau $
  is $1$-Lipschitz, satisfies $parallel T - upright("id") parallel_oo lt.eq \| O \|$,
    and is constant near each specified value. The chain rule bounds the squared gradient error by $mu_s \( O \)$.
    This remains valid when the specified values are dense.
  Apply this construction to each $u_i$, at its values at the source ends corresponding to nonpoint components of
    $F$, and to $v$ at its values on those components. For $v$ use only the energy on $D_(67 a)$.
    Denote the flattened old tests by $tilde(u)_i = T_i compose u_i$, and put $q_0 = T compose v compose h$.
    Their errors can be arbitrarily small, and the required bounds by $delta$ hold for the old tests.
    In particular, $q_0$ is uniformly and energetically close to $Im h$ on $G ∩ D_(65 a)$.
    By Lemma 9 and coordinatewise Lipschitz composition, the traces of $q_0$ form null-area pairs with the
    flattened old tests. The old pairs also remain null. Each nonpoint-hole end $b_j$ now has a source
    neighborhood on which all $tilde(u)_i$ and $q_0$ are constant.
  #emph[The horizontal coordinate.] Let $F_j$ be the nonpoint component corresponding to $b_j$,
    and choose $c_j in Re F_j$. Around each $b_j$ choose a ball $B_j subset
    D_(2 a)$ in the preceding common constancy neighborhood. Its radius may be required to tend to zero and its
    image in $G$ to lie within $2^(- j) a$ of $F_j$. The balls can also satisfy
  #[#set math.equation(numbering: n => "(5.4)")
   $ parallel upright(bold(1))_S nabla H parallel_2 < tau \, wide S = union.big_j B_j \, wide
     H = \( Re h \, Im h \) \, $ <eq:small-change-support>]
  for any prescribed $tau > 0$: the energy is integrable, and each center is a single source point.
    Choose logarithmic cutoffs $chi_j$ supported in $B_j$, equal to one near $b_j$,
    with $sum_j parallel nabla chi_j parallel_2 < tau$. Put
  #[#set math.equation(numbering: n => "(5.5)")
   $ w_j = chi_j product_(i < j) \( 1 - chi_i \) \, wide rho = product_j \( 1 - chi_j \) \, wide p_0 = rho Re h +
     sum_j w_j c_j quad upright("on ") G . $ <eq:priority-interpolation>]
  These expressions are locally finite in $G$, since the radii tend to zero and all centers belong to $B$.
    They are convex interpolations. On $S$, all horizontal values used have absolute value at most $4 a$.
    The product rule, applied to the finite formula locally, gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ \| nabla p_0 - rho nabla Re h \| lt.eq 8 a sum_j \| nabla chi_j \| \, wide
     parallel nabla \( p_0 - Re h \) parallel_(2 \, G ∩ D_(65 a)) lt.eq \( 1 + 8 a \) tau . $ <eq:priority-gradient>]
  No disjointness of the balls is required.
  At $b_j$, the factor $chi_j = 1$ makes (5.5) terminate after index $j$ on a neighborhood.
    It is therefore a finite continuous expression there. At a point end $b$, write $F_b = { zeta_b }$ and $x_b =
    Re zeta_b$. Early nonzero weights may change the trace from $x_b$.
    To prove continuity, compare $p_0$ with the finite continuous function
  $ x_b + sum_(j lt.eq N) w_j \( z \) \( c_j - x_b \) . $
  For sufficiently large $N$ and sufficiently small neighborhoods of $b$,
    every later ball meeting that neighborhood has its center near $b$.
    Upper semicontinuity of the end correspondence then puts its entire component $F_j$, and hence $c_j$,
    arbitrarily close to $zeta_b$ and $x_b$. Also $Re h \( z \) arrow.r x_b$ from $G$.
    The remaining weight is a convex combination of these close values,
    so the difference from the displayed finite expression is uniformly arbitrarily small.
    This proves continuous extension at $b$, including when early supports overlap.
    The same estimate controls the prescribed values at nearby ends.
  The new pairs are now checked on all of $B$. On each ball $B_j$, every coordinate other than $p_0$ is constant,
    so a pair involving $p_0$ has image in a line. Countably many balls contribute zero planar area.
    Outside $S$, all ends are point ends and $p_0$ is their horizontal trace.
    Apply the horizontal assertion of Lemma 9 to $T_i compose U_i$ and to $T compose v$, respectively.
    Their gradients vanish on $F$, so this proves nullity of the pairs with every old test and with $q_0$.
    Together with the earlier pair checks, this proves the full pair-null condition.
    Multiply $p_0 \, q_0$ by a smooth source cutoff equal to one on $D_(65 a)$ and zero outside a larger disk.
    The resulting $p \, q$ are bounded continuous tests of finite energy on $G$;
    no trace or working-disk calculation changes.
  #emph[Small energy and strict margins.] Let $P = \( p \, q \)$ on the working disk.
    Outside $S$ its first coordinate equals that of $H$, and write $e = parallel q - Im h parallel_oo$ there.
    For any translate $Phi_l$ of $Phi$, with derivative bounds $M_1 = parallel D Phi parallel_oo$ and $M_2 =
    parallel D^2 Phi parallel_oo$, the chain rule gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ parallel nabla Phi_l \( P \) - nabla Phi_l \( H \) parallel_2 & lt.eq M_1 parallel nabla P -
     nabla H parallel_2 + M_2 e parallel nabla H parallel_2 + 2 M_1 parallel upright(bold(1))_S nabla H
     parallel_2 . $ <eq:barrier-comparison>]
  All norms here are on $G ∩ D_(D_0)$. The first and last terms tend to zero by the choices above;
    the middle term does so by (5.3) and flattening. This estimate does not require a small uniform horizontal
    error on $S$. Conformal invariance gives $parallel nabla Phi_l \( H \) parallel_2 < eta \/ 3$,
    so the choices can ensure the strict bound in (5.1), uniformly over all translates.
  Take the total vertical uniform error less than $a$. On $B$, $\| p \| lt.eq 3 a$ by convexity and $\| q \| lt.eq
    4 a$, so every trace center has norm at most $5 a$. On the collar $63 a lt.eq \| z \| lt.eq 65 a$,
    the first coordinate is $Re h$ and the second differs from $Im h$ by less than $a$.
    Equation (5.2) puts its distance from every trace center above $50 a$, well beyond the support radius $4 a$.
    At each $b in B$, the translate centered at $P \( b \)$ is one wherever $\| P - P \( b \) \| < r$.
    Choose a smaller source neighborhood whose closure has $\| P - P \( b \) \| < r \/ 2$.
    Compactness and the contour construction in the proof of Lemma 2 give finitely many inner contours in such
    neighborhoods with bounded sides covering $B$.
  Finally, for a fixed saved pair $A = \( p \, q \)$ and any perturbed pair $A'$,
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel nabla Phi_l \( A' \) - nabla Phi_l \( A \) parallel_2 lt.eq M_1 parallel nabla A' -
     nabla A parallel_2 + M_2 parallel A' - A parallel_oo parallel nabla A parallel_2 . $ <eq:saved-stability>]
  The positive plateau and zero-region margins preserve the exact values one and zero under small uniform changes.
    The positive energy slack and (5.8) preserve the strict norm bound.
    This proves the stability assertion and the lemma. ◻
]

#proof[
  The empty case is immediate. Fix $0 < epsilon.alt < 1$ and start with the one-element list $u$,
    for which pair-nullity is vacuous. Apply Lemma 11 successively with $eta = 1 \/ k$,
    saving at stage $k$ its pair, curves, and functions $Phi_(k \, l)$.
    By the strict margins and (5.8), there is $t_k > 0$ such that total uniform and gradient changes of that pair
    below $t_k$ preserve all its saved conclusions with norm less than $1 \/ k$.
  At stage $n$, require each earlier scalar coordinate to change by less than
  $ d_n = 2^(- n - 3) / sqrt(2) min \( 1 \, epsilon.alt \, t_1 \, dots.h \, t_(n - 1) \) $
  in both norms (omit the $t$’s when $n = 1$). Each stage has only finitely many requirements,
    and the lemma permits arbitrarily small changes. For every fixed $k$,
    the sum of subsequent pair errors is less than $t_k \/ 4$.
    Thus all saved barriers work at every later finite stage. If $a_n$ is the first coordinate at stage $n$, then
  #[#set math.equation(numbering: n => "(5.9)")
   $ a_n arrow.r u_epsilon.alt upright(" uniformly") \, wide parallel u_epsilon.alt -
     u parallel_oo < epsilon.alt \, wide parallel nabla a_n parallel_(2 \, G) lt.eq
     parallel nabla u parallel_(2 \, G) + 1 . $ <eq:first-test-control>]
  Only finite lists are required to be pair-null. In particular,
    no infinite-list model assertion or limiting pair-null assertion is being used.
  Choose a model $h_n$ of each resulting finite list by Proposition 6.
    Lemma 3 gives a subsequence converging locally uniformly on $G$ to a normalized univalent map $h$.
    We claim that every component of its omitted set is a point.
    Otherwise, by Lemma 2, some source end $b$ has a nondegenerate target component $K$.
    One axial projection of $K$ contains an interval $J$ of positive length.
  For each $k$, choose a saved inner contour $gamma_(k \, l)$ enclosing $b$.
    Its limiting image strictly encloses $K$. Uniform convergence on the contour and winding-number stability
    imply that $h_n \( gamma_(k \, l) \)$ also encloses $K$ for all sufficiently large $n$ in the subsequence.
    Use the two continued model coordinates at stage $n$ in $Phi_(k \, l)$,
    on the bounded side of $h_n \( partial D_(D_0) \)$, and extend by zero outside.
    Denote this function by $V_(n \, k)$. It is continuous and globally Sobolev:
    the saved zero collar removes any interface jump, and the model coordinates are globally Sobolev.
    Their gradients vanish on the model holes. The chain rule and conformal invariance therefore give
  #[#set math.equation(numbering: n => "(5.10)")
   $ parallel nabla V_(n \, k) parallel_(2 \, bb(C)) < 1 \/ k . $ <eq:vanishing-barrier-energy>]
  It equals one on $h_n \( gamma_(k \, l) \)$. Moreover all such functions are zero outside one fixed disk $D_L$,
    for example with $L = 67 D_0 \/ 64$ by the uniform bounds in the preceding proof.
    The radius does not depend on $k$, $n$, or the coordinate list.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 2.573, fill: rgb("#f7f7ff"), stroke: none)
  circle((0, 0), radius: 2.573, stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10))
  content((1.732, 1.869), [#text(size: 9pt)[$D_L$]], anchor: "south-west", padding: 0.1176cm)
  circle((-0.42, 0), radius: (1.26, 1.47), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((-0.7245, 1.68), [#text(size: 9pt)[$C$]])
  content((0, 2.079), [#text(size: 9pt)[$V=1$ on $C$]])
  merge-path({bezier((-0.9345, -0.7245), (-0.9765, 0.567), (-1.176, -0.189), (-0.6405, 0.0315)); bezier((-0.9765, 0.567), (0.0735, 0.735), (-0.5775, 0.861), (-0.084, 0.5145)); bezier((0.0735, 0.735), (0.357, -0.2625), (0.4935, 0.42), (0.021, 0.0945)); bezier((0.357, -0.2625), (-0.9345, -0.7245), (0.147, -0.8295), (-0.462, -0.546))}, close: false, fill: rgb("#dfdfdf"), stroke: (paint: rgb("#5a5a5a"), thickness: 0.4pt, miter-limit: 10))
  content((-0.483, -0.1785), [#text(size: 9pt)[$K$]])
  line((-2.919, -0.5775), (2.888, -0.5775), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-2.919, 0.4725), (2.888, 0.4725), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-2.961, -0.5775), (-2.961, 0.4725), stroke: (paint: rgb("#0000b2"), thickness: 1.2pt, miter-limit: 10))
  line((-3.035, -0.5775), (-2.888, -0.5775), stroke: (paint: rgb("#0000b2"), thickness: 0.4pt, miter-limit: 10))
  line((-3.035, 0.4725), (-2.888, 0.4725), stroke: (paint: rgb("#0000b2"), thickness: 0.4pt, miter-limit: 10))
  content((-3.087, -0.0525), [#text(size: 9pt)[$J$]], anchor: "east", padding: 0.1176cm)
  line((-2.888, 0), (2.993, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  circle((0.84, 0), radius: 0.03675, fill: black, stroke: none)
  circle((2.573, 0), radius: 0.03675, fill: black, stroke: none)
  line((0.84, 0), (2.573, 0), stroke: (paint: rgb("#d96d00"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#d96d00"))))
  content((1.712, 0.0945), [#text(fill: rgb("#bf6000"))[#text(size: 9pt)[$1 arrow.r.long 0$]]], anchor: "south", padding: 0.1176cm)
  content((2.604, -0.063), [#text(size: 9pt)[$V=0$]], anchor: "north-west", padding: 0.1176cm)
  content((0, -3.077), [#text(size: 9pt)[$ integral_( "slice" )| "nabla" V|^2 thin upright(d) s gt.eq frac(1, 2L)$]])
})],
    caption: [Figure 1: A fixed interval $J$ in a projection of a nondegenerate component $K$ forces a uniform energy cost. Each corresponding line meets the inner contour $C$, where the barrier is one, and then reaches zero within a segment of length at most $2 L$. Integrating over $J$ contradicts arbitrarily small barrier energy. Here $V = V_(n \, k)$ and $C = h_n \( gamma_(k \, l) \)$. ],
  ) <fig:line-payment>
  For definiteness suppose $J$ is the vertical projection interval.
    Every horizontal line at a height in $J$ meets the inner image contour, where $V_(n \, k) = 1$.
    On almost every such line, the Sobolev restriction is absolutely continuous and agrees with the continuous
    restriction. It takes value zero at the left and right ends of the segment with horizontal coordinates $-
    L$ and $L$. Cauchy–Schwarz, followed by integration over $J$, gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ integral_(bb(C)) \| nabla V_(n \, k) \|^2 gt.eq frac(\| J \|, 2 L) > 0 . $ <eq:line-payment-sobolev>]
  The argument only uses the value one on the contour, as illustrated in Figure 1.
    Choose $k$ so large that $k^(- 2) < \| J \| \/ \( 2 L \)$,
    and then choose $n$ sufficiently late for that saved contour. Equations (5.10) and (5.11) contradict each other.
  All limit components are therefore singletons. Lemma 2 now extends $h$ to an orientation-preserving
    homeomorphism of the sphere. Removability of $B$ makes it a Möbius map; the normalization $h \( z \) = z +
    O \( 1 \/ z \)$ makes it the identity.
  Let $A_n$ denote the globally continued first test of the model $h_n$.
    Its values on holes are the source endpoint values, and its gradient vanishes there. Consequently
  $ parallel A_n parallel_oo lt.eq parallel u parallel_oo + 1 \, wide
    parallel nabla A_n parallel_(2 \, hat(bb(C))) = parallel nabla a_n parallel_(2 \, G) lt.eq
    parallel nabla u parallel_(2 \, G) + 1 . $
  Take a weakly convergent subsequence in $W^(1 \, 2) \( hat(bb(C)) \)$.
    Since $h_n arrow.r upright("id")$ locally uniformly on $G$, inverse convergence and (5.9) give $A_n arrow.r
    u_epsilon.alt$ locally uniformly on $G$. Thus the weak limit equals $u_epsilon.alt$ there.
    Lemma 4 gives $\| B \| = 0$, so the equality holds almost everywhere on the sphere.
    This proves global Sobolev membership of $u_epsilon.alt$, with a bound independent of $epsilon.alt$.
    Finally let $epsilon.alt arrow.b 0$ and use uniform convergence to $u$ and weak Sobolev compactness once more.
    This proves the theorem. ◻
]

== 6 Null projections of the common point traces <sec:traces>

We now apply Theorem 10 to a conformal equivalence between circle domains.
  The scalar functions used below are arranged to be continuous even when a point component corresponds to a disk.

We first record a packing estimate closely related to #cite(label("Ntalampekos2023")) Lemma 2.1.
  We include its short proof from the Hardy–Littlewood Maximal Theorem #cite(label("Stein1970")).

#thm([Lemma 6.1.])[
  (Ball synthesis).  #emph[Let $B_j subset bb(R)^2$ be balls of radii $d_j > 0$.
    Suppose there are pairwise disjoint measurable sets $E_j subset B_j$ with $\| E_j \| gt.eq c d_j^2$,
    where $c > 0$ is fixed. For nonnegative $\( a_j \) in ell^2$,
$ ∥sum_j a_j / d_j upright(bold(1))_(B_j)∥_(L^2 \( bb(R)^2 \)) lt.eq C_c (sum_j a_j^2)^(1 \/ 2) . $

]
] <lem:ball-synthesis>

#proof[
  Let $g gt.eq 0$ belong to $L^2$, and let $M g$ be its centered maximal function.
    For every $x in B_j$, the average of $g$ on $B_j$ is at most $4 M g \( x \)$,
    since $B_j subset B \( x \, 2 d_j \)$. Consequently
  $ integral g sum_j a_j / d_j upright(bold(1))_(B_j) & lt.eq 4 pi sum_j a_j d_j inf_(E_j) M g\
 & lt.eq C_c (sum_j a_j^2)^(1 \/ 2) (sum_j integral_(E_j) \( M g \)^2)^(1 \/ 2) lt.eq
   C_c parallel \( a_j \) parallel_(ell^2) parallel g parallel_2 . $
  Here the last inequality uses disjointness and the $L^2$ Maximal Theorem.
    Duality proves the assertion for finite sums, and monotone convergence proves it for countable sums. ◻
]

For $e in { 1 \, i }$ write $pi_e \( w \) = Re \( overline(e) w \)$.

#thm([Proposition 6.2.])[
  (Common point traces).  #emph[Let $Omega \, Omega'$ be circle domains containing infinity, and let $f :
    Omega arrow.r Omega'$ be a conformal equivalence with $f \( oo \) = oo$.
    Suppose $partial Omega$ is conformally removable. Let $C$ be the set of point components of
    $hat(bb(C)) \\ Omega$ whose corresponding components in $hat(bb(C)) \\ Omega'$ are also points,
    and denote their positions by $f_(*) \( x \)$, $x in C$. For each $e in { 1 \,
    i }$ and almost every line $ell$ parallel to $e$,
$ \| { pi_e \( f_(*) \( x \) \) : x in C ∩ ell } #scale(x: 120%, y: 120%)[\|] = 0 . $

 Here and below $\| dot.op \|$ for a subset of a line denotes Lebesgue length.]
] <prop:trace-null>

#proof[
  We fix $e$ throughout. All complementary components on either side lie in bounded planar regions.
    Index those pairs $\( K_j \, K'_j \)$ for which at least one component is a disk of positive radius.
    The index set is finite or countable, since disjoint positive-radius disks have disjoint nonempty interiors. Write
  $ K_j = overline(B) \( a_j \, r_j \) \, wide K'_j = overline(B) \( a'_j \, s_j \) \, $
  allowing radius zero, and set $beta_j = pi_e \( a'_j \)$. Disjointness and boundedness give
  #[#set math.equation(numbering: n => "(6.1)")
   $ sum_j r_j^2 < oo \, wide sum_j s_j^2 < oo . $ <eq:trace-radius-sums>]
  The other components are precisely the common points in $C$.
  #emph[Scalar data and shrinking neighborhoods.] Choose a smooth planar cutoff $chi$,
    equal to one on a sufficiently large disk containing the source complement and all the neighborhoods
    introduced below, with its transition region compactly contained in $Omega$. On $Omega$ put
  $ b = chi thin pi_e \( f \) \, $
  and extend $b$ by $beta_j$ on $K_j$, by $pi_e \( f_(*) \( x \) \)$ on $C$, and by zero at infinity.
    This is bounded. Indeed, $f \( oo \) = oo$ implies that the image of a bounded source region is bounded.
    The area formula for the univalent map $f$ then shows that $b$ has finite Dirichlet energy on $Omega$;
    the cutoff-derivative term is supported in a compact subset of $Omega$.
  Although $b$ need not be continuous at $K_j$, it is continuous at every common point.
    Moreover, the cluster values near $K_j$ lie in $\[ beta_j - s_j \, beta_j + s_j \]$.
    These statements include approaches through other complementary components and follow from the
    upper-semicontinuous correspondence in Lemma 2.
  Choose $epsilon_j > 0$ tending to zero with $sum_j epsilon_j^2 < oo$, and put
  $ I_j = \( beta_j - s_j - epsilon_j \, thin beta_j + s_j + epsilon_j \) \, wide l_j = \| I_j \| . $
  Thus $\( l_j \) in ell^2$. Fix $A$ so large that all these intervals and all values of $b$ lie in
    $\( - A \, A \)$. Choose positive $Delta_j$ with
  #[#set math.equation(numbering: n => "(6.2)")
   $ sum_(i > j) Delta_i^2 < 1 / 2 Delta_j^2 \; $ <eq:trace-small-radii>]
  for example, a sufficiently small multiple of $2^(- j)$ suffices. For each integer $m gt.eq 1$, define the balloons
  $ B_(j \, m) = B \( a_j \, d_(j \, m) \) \, wide d_(j \, m) =
    cases(delim: "{", \( 1 + 1 \/ m \) r_j \, & r_j > 0 \,, Delta_j \/ m \, & r_j = 0 .) $
  These balls are all in one bounded region, and decrease to $K_j$ as $m arrow.r oo$.
    Choose radial Lipschitz functions $0 lt.eq lambda_(j \, m) lt.eq
    1$ that vanish on an open neighborhood of $K_j$, equal one outside $B_(j \, m)$, and satisfy
  #[#set math.equation(numbering: n => "(6.3)")
   $ \| nabla lambda_(j \, m) \| lt.eq C_m / d_(j \, m) upright(bold(1))_(B_(j \, m)) quad
     upright("almost everywhere") . $ <eq:trace-cutoff-gradient>]
  One may take $C_m = 2 \( m + 1 \)$, interpolating radially between $\( 1 + 1 \/ \( 2 m \) \)
    r_j$ and $\( 1 + 1 \/ m \) r_j$ when $r_j > 0$, and between $d_(j \, m) \/ 2$ and $d_(j \, m)$ otherwise.
  For the moment fix $m$ and suppress it from the notation.
    We will transform the scalar value $b \( z \)$ before applying Sobolev extension.
    Near $K_j$ the transformation should be constant on $I_j$,
    so it does not distinguish the possible cluster values of $b$.
    The cutoff $lambda_j$ imposes no restriction outside $B_j$.
    Taking the infimum of the cutoffs whose intervals contain a given scalar value enforces these requirements
    simultaneously, including where the intervals and neighborhoods overlap.
    Integrating in the scalar variable makes the spatial cost proportional to $l_j$,
    as the estimate below will show. Define
  #[#set math.equation(numbering: n => "(6.4)")
   $ L \( z \, t \) = inf_(j : thin t in I_j) lambda_j \( z \) \, wide F \( z \, t \) =
     integral_(- A)^t L \( z \, s \) thin upright(d) s \, wide U \( z \) = F \( z \, b \( z \) \) \, $ <eq:trace-mask>]
  with the empty infimum equal to one. We shall prove that $U$ is continuous and belongs to
    $W^(1 \, 2) \( hat(bb(C)) \)$.
  #emph[An energy density.] Set
  #[#set math.equation(numbering: n => "(6.5)")
   $ P = C_m sum_j l_j / d_j upright(bold(1))_(B_j) . $ <eq:trace-density>]
  This belongs to $L^2 \( bb(C) \)$. For the positive-radius sublist,
    the interiors of the original disks $K_j$ are disjoint subsets of $B_j$ of area at least $pi d_j^2 \/ 4$,
    so Lemma 12 applies. For the zero-radius sublist use instead
  $ E_j = B_j \\ union.big_(i > j \, thin r_i = 0) B_i . $
  These sets are pairwise disjoint: if $i < j$, then $E_i$ excludes $B_j supset E_j$.
    Since all zero-radius balloons in this system use the same factor $1 \/ m$, (6.2) gives
  $ \| E_j \| gt.eq pi d_j^2 - pi sum_(i > j \, thin r_i = 0) d_i^2 gt.eq 1 / 2 pi d_j^2 . $
  Apply Lemma 12 separately to this sublist and then add the two $L^2$ bounds.
    Overlap between the two sublists is irrelevant.
  #emph[Continuity of the masks.] We spell out the accumulation issue. For fixed $m$, $d_j arrow.r 0$.
    If distinct balloon supports accumulate at a common point $x$,
    their centers and source components approach $x$. By Lemma 2 their target components approach ${
    f_(*) \( x \) }$; as $epsilon_j arrow.r 0$, the corresponding intervals $I_j$ approach the scalar $b \( x \)$.
    Consequently, given $delta > 0$, there are a neighborhood $V$ of $x$ and a finite initial list such that every
    remaining balloon meeting $V$ has its interval in $\( b \( x \) - delta \, b \( x \) + delta \)$.
    The finite-mask version of $F$ differs from $F$ by at most $2 delta$ on $V$, uniformly in the upper endpoint.
    Since the finite-mask version is continuous in its two variables and $b$ is continuous at $x$,
    $U$ is continuous there.
  For an indexed component $K_j$, choose a neighborhood $V_j$ of the entire closed component on which $lambda_j =
    0$ and $b in I_j$. This is possible because $I_j$ has a positive margin around all its cluster values.
    On $V_j$ the upper endpoint in (6.4) may be replaced by the fixed value $beta_j$.
    All sufficiently late intervals of balloons meeting a sufficiently small neighborhood of $K_j$ lie in $I_j$.
    To verify the uniformity of this assertion, a failure would give $i_nu arrow.r
    oo$ and $z_nu in B_(i_nu)$ with $"dist" \( z_nu \, K_j \) arrow.r 0$, but $I_(i_nu) subset.not I_j$.
    Passing to a subsequence gives $z_nu arrow.r x in K_j$; the shrinking radii imply $K_(i_nu) arrow.r { x }$.
    Component correspondence puts their target components arbitrarily close to $K'_j$,
    and the vanishing extra margins then force $I_(i_nu) subset I_j$, a contradiction.
    These late intervals have no effect on $L$ near $K_j$: there $lambda_j = 0$, so $L \( z \, t \) =
    0$ for $t in I_j$. Thus near $K_j$ the fixed-endpoint expression is a finite continuous mask.
    This proves continuity there, including when $r_j = 0 < s_j$.
  In $Omega$ the cutoffs are locally finite, and near infinity they are all one.
    Hence the remaining continuity assertions are immediate, with $U = A$ near infinity.
  #emph[Sobolev regularity and the residual dust.] Let $L_N \, F_N \,
    U_N$ denote the masks using just the first $N$ indices. For $t in \[ - A \, A \]$ and any $x \, y$,
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| F_N \( x \, t \) - F_N \( y \, t \) \| lt.eq sum_(j lt.eq N) l_j \| lambda_j \( x \) -
     lambda_j \( y \) \| . $ <eq:trace-finite-variation>]
  This follows from the elementary difference bound for finite minima,
    integrated over the intervals on which a cutoff can occur.
    Changing the upper endpoint costs at most its change, since $0 lt.eq L_N lt.eq 1$.
    It follows that $U_N$ has gradient bounded by $\| nabla b \| + P$ locally in $Omega$.
    On $V_j$, once $N gt.eq j$, its endpoint can be fixed at $beta_j$, and its gradient is bounded by $P$.
  Bounded pointwise convergence of the finite masks gives local strong $L^2$ convergence.
    Weak Sobolev compactness therefore proves that $U$ is locally Sobolev on
  $ O = Omega union union.big_j V_j \, $
  with the same gradient bounds. These yield the finite total energy estimate
  #[#set math.equation(numbering: n => "(6.7)")
   $ integral_O \| nabla U \|^2 lt.eq 2 integral_Omega \| nabla b \|^2 +
     2 integral_(bb(C)) P^2 < oo . $ <eq:trace-off-dust-energy>]
  Here the open union is integrated once; no multiplicity is introduced by overlapping neighborhoods.
  The residual set $B_(*) = hat(bb(C)) \\ O$ is compact and bounded, and consists only of common point components.
    Every connected subset of $B_(*)$ lies in one component of $hat(bb(C)) \\ Omega$, hence is a singleton.
    Thus $B_(*)$ is totally disconnected. Moreover $B_(*) subset partial Omega$,
    and so it is conformally removable by inclusion. Theorem 10,
    applied to the continuous bounded function $U$ and (6.7), proves $U in W^(1 \, 2) \( hat(bb(C)) \)$.
    If $B_(*)$ is empty, this conclusion already follows from the local Sobolev statement and the energy bound.
    We have established the conclusion for every mask system $m$; denote its function and density by $U_m \, P_m$.
  #emph[A typical line and compression.] Choose a line $ell$ parallel to $e$ on which all $U_m$ are locally
    absolutely continuous and all $P_m$ are locally integrable.
    Almost every such line has these properties, since there are only countably many systems. We also require
  #[#set math.equation(numbering: n => "(6.8)")
   $ \| partial Omega ∩ ell \| = 0 \, wide sum_(j : thin B_(j \, 1) ∩ ell eq.not diameter) l_j < oo .
     $ <eq:trace-line-tail>]
  The first condition holds on almost every line by Lemma 4 and Fubini.
    For the second, write $ell_tau$ for the parallel line with transverse coordinate $tau$. Tonelli gives
  $ integral_(bb(R)) sum_(j : thin B_(j \, 1) ∩ ell_tau eq.not diameter) l_j thin upright(d) tau =
    2 sum_j l_j d_(j \, 1) < oo \, $
  by Cauchy–Schwarz and (6.1)–(6.2). Fix a line satisfying all these conditions.
  For $N gt.eq 1$ let
  $ I^(\( N \)) = union.big_(j > N\
B_(j \, 1) ∩ ell eq.not diameter) I_j \, wide H_N \( t \) =
  integral_(- A)^t upright(bold(1))_(bb(R) \\ I^(\( N \))) \( s \) thin upright(d) s . $
  Equation (6.8) implies $\| I^(\( N \)) \| arrow.r 0$. For any $x in C ∩ ell$,
    the distance from $x$ to each of the first $N$ closed components is positive.
    Some system $m$ therefore has an open line neighborhood $J$ of $x$ missing its first $N$ balloons.
    On $J$, every active cutoff belongs to the tail appearing in $I^(\( N \))$, and hence
  $ L_m \( z \, t \) gt.eq upright(bold(1))_(bb(R) \\ I^(\( N \))) \( t \) . $
  The fixed-endpoint variation estimate extends to the infinite mask:
    for any segment $\[ x \, y \] subset ell$ and fixed $t in \[ - A \, A \]$,
  #[#set math.equation(numbering: n => "(6.9)")
   $ \| F_m \( x \, t \) - F_m \( y \, t \) \| lt.eq integral_(\[ x \, y \]) P_m thin upright(d) s .
     $ <eq:trace-segment-variation>]
  Indeed (6.3) and (6.6) give this for finite masks, and dominated convergence in the integration variable gives
    the limit. The estimate uses only the globally Lipschitz cutoffs,
    so it remains valid when the segment crosses indexed components where $b$ is discontinuous.
  If $x \, y in C ∩ J$, compare the two upper endpoints at one fixed location, and then use (6.9).
    The nonnegative-integrand inequality above gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ \| H_N \( b \( x \) \) - H_N \( b \( y \) \) \| & lt.eq \| U_m \( x \) - U_m \( y \) \| +
     integral_(\[ x \, y \]) P_m thin upright(d) s\
 & lt.eq integral_(\[ x \, y \]) \( \| U'_m \| + P_m \) thin upright(d) s . $ <eq:trace-compression-bound>]
  For example, when $b \( x \) lt.eq b \( y \)$, first bound the compressed increment by
    $F_m \( x \, b \( y \) \) - F_m \( x \, b \( x \) \)$ and then replace $F_m \( x \, b \( y \) \)$ by
    $F_m \( y \, b \( y \) \)$. The other order is identical.
  The set $C ∩ J$ has length zero. A general elementary consequence of (6.10) is therefore
  $ \| H_N \( b \( C ∩ J \) \) \| = 0 . $
  To see this with outer length, work first in a compact subinterval of $J$.
    Cover its null set of common points by an open set on which the integral of $\| U'_m \| +
    P_m$ is arbitrarily small. On each component interval, (6.10) bounds the diameter of the image of the common
    points by that integral. Summing gives arbitrarily small interval covers of the image.
    A countable exhaustion proves the assertion on $J$.
  We recover the uncompressed values by the one-dimensional area formula.
    The common-point set is Borel, since it is the compact complement with the countable union of the indexed
    closed components removed. Its trace map is continuous in the relative topology.
    Thus $b \( C ∩ J \)$ is analytic and Lebesgue measurable. Put $S = b \( C ∩ J \) \\ I^(\( N \))$.
    The nondecreasing Lipschitz function $H_N$ has derivative one almost everywhere outside $I^(\( N \))$, and hence
  $ \| S \| = integral_S \| H'_N \| = integral_(bb(R)) \# { t in S : H_N \( t \) = u } thin upright(d) u = 0 . $
  The last integrand is supported on the null set $H_N \( b \( C ∩ J \) \)$.
    This reasoning allows both noninjectivity of $H_N$ and its null set of derivative exceptions.
  For fixed $N$, countably many of the neighborhoods $J$ suffice to cover $C ∩ ell$,
    by the countable base of the line. It follows that $b \( C ∩ ell \) \\ I^(\( N \))$ is null.
    Finally $\| I^(\( N \)) \| arrow.r 0$, so $\| b \( C ∩ ell \) \| = 0$.
    Since $b \( x \) = pi_e \( f_(*) \( x \) \)$ on common points, this is the required conclusion.
    Empty or finite indexed lists are included by interpreting the corresponding sums and tails in the evident way. ◻
]

== 7 The length–area argument <sec:rigidity>

The trace statement now supplies the line estimates needed for a flux lower bound.
  Comparing that bound with the source and target area bounds will force the normalized conformal map to have
  derivative of unit modulus and corresponding disks to have equal radii.

#proof[
  If $Omega = hat(bb(C))$, its conformal image is also the sphere, by compactness,
    and its automorphisms are Möbius transformations. Assume henceforth that the complement is nonempty.
    Apply separate Möbius changes in source and target to move a domain point and its image to infinity.
    A further target affine change gives
  #[#set math.equation(numbering: n => "(7.1)")
   $ f \( z \) = z + sum_(n gt.eq 1) alpha_n z^(- n) quad upright("near infinity") . $ <eq:rigidity-normalization>]
  These changes preserve circle domains and conformal removability.
    All complementary components are now bounded Euclidean disks or points. Their correspondence is supplied by Lemma 2.
  Index by $j$ precisely those corresponding pairs for which at least one component is nondegenerate. Write
  $ K_j = overline(D) \( a_j \, r_j \) \, wide K'_j = overline(D) \( b_j \, s_j \) \, $
  allowing a zero radius to mean a singleton. The index set is finite or countable, and
  #[#set math.equation(numbering: n => "(7.2)")
   $ sum_j r_j^2 < oo \, wide sum_j s_j^2 < oo \, wide sum_j r_j s_j < oo . $ <eq:radius-summability>]
  Indeed the positive-radius disks on each side have disjoint interiors in a bounded region,
    and the last assertion follows by Cauchy–Schwarz. All other complementary components are common points:
    both the source and target component are singletons. Let $tau$ denote their correspondence.
  Choose $R$ strictly larger than a radius containing the source complement.
    Define a vector field $F$ on $overline(D)_R$ by using $f$ in $Omega$, the center $b_j$ on $K_j$,
    and $tau \( p \)$ at every common point $p$. This is a bounded measurable field.
    Boundedness follows from Lemma 2, or from the bounded side of the image outer contour.
    Measurability follows since there are countably many indexed closed components, the common-point set is Borel,
    and its singleton trace map is continuous relative to that set.
    No continuity of $F$ at an indexed component is asserted.
  ===== 7.1 A slice estimate. <a-slice-estimate.>
  Remove disjoint slightly enlarged concentric disks around the first $N$ indexed source components,
    using a positive enlargement also when $r_j = 0$. Denote the remaining round region by $A_N$.
    The sizes of the enlargements will tend to zero with $N$ fixed.
  Consider a closed component segment $J = \[ x \, y \]$ of an axial slice of $A_N$,
    directed toward increasing coordinate. At domain points use the projected value of $f$;
    at a complementary component use the entire projection interval of its corresponding target component.
    These fibers are compact intervals in a fixed bounded interval,
    and their relation has closed graph by Lemma 2. Their union over $J$ is connected.
    To verify this directly, a missing value $t$ between two attained values would place each fiber wholly below
    or wholly above $t$. Upper semicontinuity makes these two classes open in $J$, giving a separation of the segment.
  Consequently all values between the selected endpoint values are covered by the projected images of domain arcs,
    common-point traces, and the full intervals of met indexed components.
    By Proposition 13, the common traces have length zero on almost every such line.
    The countably many domain arcs have total projected-image length at most the integral of $\| f' \|$ over them.
    Each met indexed component contributes at most $2 s_j$. Writing $F_(upright("ax"))$ for the coordinate along
    the slice, we obtain
  #[#set math.equation(numbering: n => "(7.3)")
   $ F_(upright("ax")) \( y \) - F_(upright("ax")) \( x \) lt.eq integral_(J ∩ Omega) \| f' \| thin upright(d) s +
     sum_(j > N\
K_j ∩ J eq.not diameter) 2 s_j $ <eq:slice-estimate>]
  for almost every line in either direction. In fact the same argument bounds the absolute endpoint difference.
    Endpoints on an enlarged circle use the same field $F$ for both slicing directions.
  ===== 7.2 Multiplicity of the tail terms. <multiplicity-of-the-tail-terms.>
  For fixed $N$ the enlargements can be chosen so that each remaining positive-radius source component meets at
    most one enlarged disk. For $N gt.eq 2$, let $delta > 0$ be the minimum separation of the first $N$ source
    components. Make their enlargements small enough to retain gaps greater than $delta \/ 2$.
    A remaining disk of diameter less than $delta \/ 2$ cannot meet two of them.
    Only finitely many remaining disks have larger diameter, and their positive distances from the first $N$
    components permit further shrinking of the enlargements so that these finitely many disks meet none.
    This argument includes point components among the first $N$.
    For $N = 1$ there is nothing to prove, and for $N = 0$ nothing is removed.
  A line meets a remaining disk in an interval; deleting at most one enlarged-disk interval leaves at most two
    retained pieces. Thus its cost in (7.3) is counted at most twice.
    Integrating transversely gives at most $8 r_j s_j$ per direction and at most $16 r_j s_j$ for both directions.
    Indexed source point components are missed by almost every axial line,
    even when their target components are disks. All exceptional indexed point lines form a countable set.
    The tail estimates are integrable by (7.2).
  ===== 7.3 Flux. <flux.>
  Integrating (7.3) over horizontal and vertical lines gives the flux through the outer circle minus the flux
    through the enlarged inner circles. This is the elementary projection formula for arclength on a circle:
    the transverse projection Jacobians are $\| n_X \|$ for horizontal slices and $\| n_Y \|$ for vertical slices.
    It applies to bounded measurable boundary values. The normal on an inner circle is taken outward from its
    removed disk. The two domain integrals are bounded by $2 integral_(Omega ∩ D_R) \| f' \| thin upright(d) A$.
  On the outer circle $F = f$, and (7.1) gives exactly
  #[#set math.equation(numbering: n => "(7.4)")
   $ integral_(partial D_R) F dot.op n thin upright(d) s = "Re" integral_0^(2 pi) f \( R e^(i t) \) e^(- i t) R
     thin upright(d) t = 2 pi R^2 . $ <eq:outer-flux>]
  On the enlarged circle about $K_j$, subtract the constant target center $b_j$, whose flux is zero.
    As its radius decreases to $r_j$, Lemma 2 puts all its assigned values within distance $s_j +
    o \( 1 \)$ of $b_j$, uniformly along the circle. Hence its inner outward flux $I_j$ satisfies
  #[#set math.equation(numbering: n => "(7.5)")
   $ limsup I_j lt.eq 2 pi r_j s_j . $ <eq:inner-flux>]
  When $r_j = 0$ the circle length tends to zero; when $s_j = 0$ the target displacement tends to zero.
    Thus both types of mismatch are covered.
  Moving the inner fluxes to the right and letting the finitely many enlargements shrink,
    while retaining the preceding multiplicity property, gives
  $ 2 pi R^2 lt.eq 2 integral_(Omega ∩ D_R) \| f' \| thin upright(d) A + 2 pi sum_(j lt.eq N) r_j s_j +
    16 sum_(j > N) r_j s_j . $
  Let $N$ exhaust the indexed components. In the finite or empty case the corresponding terminal sum is already
    zero. We conclude that
  #[#set math.equation(numbering: n => "(7.6)")
   $ 2 pi R^2 lt.eq 2 integral_(Omega ∩ D_R) \| f' \| thin upright(d) A + 2 pi sum_j r_j s_j . $ <eq:limiting-flux>]
  ===== 7.4 Area and equality. <area-and-equality.>
  The source domain portion and the interiors of its complementary disks are disjoint subsets of $D_R$, so
  #[#set math.equation(numbering: n => "(7.7)")
   $ integral_(Omega ∩ D_R) 1 thin upright(d) A + pi sum_j r_j^2 lt.eq pi R^2 . $ <eq:source-area>]
  The image of $partial D_R$ is a Jordan contour. Its bounded side contains $f \( Omega ∩ D_R \)$ and all target
    complementary components: the compact exterior source disk is mapped homeomorphically onto the closed Jordan
    side containing infinity. Indeed its interior is mapped openly, its boundary is the image contour,
    and compactness makes its image closed in that side; connectedness then identifies the entire side.
    These pieces are disjoint. By the Laurent area formula its enclosed area is
  $ pi R^2 - pi sum_(n gt.eq 1) n \| alpha_n \|^2 R^(- 2 n) lt.eq pi R^2 . $
  Conformal change of variables therefore gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ integral_(Omega ∩ D_R) \| f' \|^2 thin upright(d) A + pi sum_j s_j^2 lt.eq pi R^2 . $ <eq:target-area>]
  No area-zero assertion about the target dust is needed: any area in its uncountably many singleton components is
    simply omitted from the left side of this inequality.
  Adding (7.7) and (7.8), then using (7.6), yields
  #[#set math.equation(numbering: n => "(7.9)")
   $ #box(stroke: black, inset: 3pt, [$ integral_(Omega ∩ D_R) \( \| f' \| - 1 \)^2 thin upright(d) A +
     pi sum_j \( r_j - s_j \)^2 lt.eq 0 . $]) $ <eq:nonnegative-rigidity>]
  Both terms are nonnegative. Continuity of the integrand shows that $\| f' \| =
    1$ throughout the nonempty open set $Omega ∩ D_R$. On any disk compactly contained in this set,
    the Open Mapping Theorem makes $f'$ constant, so $f \( z \) = lambda z + c$ there.
    The meromorphic Identity Theorem on the connected domain $Omega$ gives this equality everywhere in $Omega$.
    Finally (7.1) forces $lambda = 1$ and $c = 0$. Undoing the source and target changes of coordinates proves
    that the original equivalence is the restriction of a Möbius transformation. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
