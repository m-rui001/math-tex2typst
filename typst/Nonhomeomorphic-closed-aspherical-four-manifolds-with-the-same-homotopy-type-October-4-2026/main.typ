#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Nonhomeomorphic closed aspherical four-manifolds \
with the same homotopy type]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

A connected manifold is #emph[aspherical] if its universal cover is contractible. Its fundamental group then determines its homotopy type. The topological Borel conjecture commonly asks whether every homotopy equivalence between closed aspherical manifolds is homotopic to a homeomorphism [2,20]. The weaker #emph[homeomorphism-existence formulation] asks only whether homotopy-equivalent closed aspherical manifolds are homeomorphic. Our main result disproves this formulation in dimension four.

#thm([Theorem 1.1.])[
  #emph[There exist closed connected aspherical topological four-manifolds $M$ and $N$ that are homotopy equivalent but not homeomorphic. Their common fundamental group is word-hyperbolic.]
] <thm:pair>

The conclusion excludes every homeomorphism between the two manifolds, without prescribing a homotopy class. The construction also yields a separate obstruction for a self-map of one manifold.

#thm([Theorem 1.2.])[
  #emph[There exist a closed connected aspherical topological four-manifold $M$ and a homotopy equivalence $f : M arrow.r M$ such that no homeomorphism $M arrow.r M$ is homotopic to $f$.]
] <thm:self-map>

We prove this assertion separately and use the same $M$ in Theorem 1. A nonhomeomorphic pair alone would not imply the self-map assertion.

The homeomorphism-existence question already appears in Borel’s letter to Serre of May 2, 1953, phrased for compact manifolds that are classifying spaces [5]. Rigidity holds classically in dimensions at most two, and for closed orientable aspherical three-manifolds by geometrization and three-dimensional rigidity [19] Theorem 0.7 and Section 5. In higher dimensions, Hsiang and Wall proved the homeomorphism-existence statement for homotopy tori in dimensions at least five [17], and Farrell and Jones established it for closed negatively curved manifolds in those dimensions [11]. Bartels and Lück proved the prescribed-class formulation in dimensions at least five for a class of groups containing word-hyperbolic groups and groups acting geometrically on finite-dimensional CAT(0) spaces [2] Theorem A.

In dimension four, these rigidity theorems use further geometric input. Bartels and Lück’s four-dimensional application assumes that the fundamental group is good in the sense of Freedman [2] Proposition 0.3. For closed aspherical topological four-manifolds with torsion-free word-hyperbolic fundamental group, Khan proves rigidity up to topological $s$-cobordism [18] Theorem 1.22 and Corollary 1.23; the product theorem for five-dimensional topological $s$-cobordisms in Freedman–Quinn assumes a good fundamental group [12] Theorem 7.1A. The word-hyperbolicity in Theorem 1 therefore lies within the group-theoretic range of these rigidity results, while the dimension is essential to their topological conclusion. Recent examples of Davis, Hayden, Huang, Ruberman, and Sunukjian are closed aspherical smooth four-manifolds that are homeomorphic but not diffeomorphic [10] Theorem 1.1. Their proof uses Davis reflection and a characteristic-subgroup argument to force a hypothetical diffeomorphism between these manifolds to lift to covers distinguished by the genera of smoothly embedded homologically essential surfaces [10]. Our conclusion concerns homeomorphism in the topological category.

The proof uses two companion constructions. The marked tensor obstruction of [22] supplies plumbing blocks, marked grope bodies, and algebraic potentials associated to three-dimensional cuts. The reflection and realization results of [23] turn the absence of a marked filling into the absence of a closed manifold model for an aspherical Poincaré complex. We also use its universal-development and support arguments. We state the imported results at their points of use and verify their hypotheses for the chambers constructed here. The principal inputs are the marked algebraicity theorem [22] Theorem 5.1, the controlled filling implication [23] Sections 3–5, and the support construction [23] Lemma 3.3.

=== The construction <the-construction>

Start with a finite collared Poincaré chamber $\( P \, S \)$ of dimension four, where $P$ has the homotopy type of a finite graph and its fundamental group has an epimorphism to $bb(Z)$. Write $S_d$ for the boundary in the connected cyclic cover of degree $d$. A #emph[marked filling] of $S_d$ is a compact four-manifold with this identified boundary and the prescribed graph homotopy type, including the boundary map. The double cover $S_2$ has a marked filling, whereas $S_d$ has none for odd $d gt.eq 3$.

This parity comes from two colors of plumbing caps. Each grope has four terminal caps grouped into two red–blue pairs. In the double cover, choosing red caps at one vertex and blue caps at the other makes the selected sheets disjoint and gives the filling. For odd $d gt.eq 3$, a hypothetical filling of $S_d$ instead produces formal data on a cycle of $d$ vertices with five red and five blue edges between each neighboring pair. The endpoint-assignment theorem would assign every edge to one endpoint so that each vertex receives at most one edge in some color. Choose one such color at each vertex. Adjacent vertices cannot choose the same color, since together they would receive at most two of the five edges of that color between them. The choices would alternate around the cycle, impossible when the cycle is odd.

We formulate the endpoint-assignment theorem for arbitrary finite loopless multigraphs. The cyclic-cover criterion works in every manifold dimension. It converts a double-cover model and eventual nonexistence of odd-cover models into a self-homotopy equivalence not represented by any homeomorphism. The proof composes a lifted homeomorphism with a large deck translation and imposes no finite-order condition on that homeomorphism. This last distinction separates the criterion from finite-group Nielsen realization obstructions such as [4] Theorem 1.6.

To construct the pair, use the reflection method of Davis [8,9] in the Poincaré-chamber form of [23]. A full reflection of $P$ has no manifold model in its cyclic covers of odd degree $d gt.eq 3$. We quotient its elementary abelian group of chamber labels by a binary relation space that acts freely and forces every simplicial symmetry preserving the relations to be trivial. The quotient is a finite aspherical complex $Q$ with the same odd-cover obstruction.

There are two ways to replace the chambers of $Q_2$ by the filling of $S_2$. In one, every boundary identification is the same. In the other, it is twisted by the double-cover deck involution according to a nonzero linear functional $ell$ on the label group $sans(A)$. Both gluings are closed manifold models of $Q_2$. They realize two subgroups of outer automorphisms of the common group $Pi$: the horizontal subgroup $sans(A)$ on $M$ and the graph subgroup $sans(B)_ell$ on $N$. These lie in $sans(A) times chevron.l delta chevron.r lt.eq "Out" \( Pi \)$, where $delta$ is the cyclic involution. The cyclic-cover criterion forbids $delta$ on $M$ and at the same time proves Theorem 2. The subgroups $sans(A)$ and $sans(B)_ell$ are not conjugate in $"Out" \( Pi \)$: they contain different numbers of elements admitting finite-order lifts to $"Aut" \( Pi \)$.

The remaining step controls all possible homotopy classes of a homeomorphism between the models. We prove that $"Out" \( Pi \)$ is finite: a uniform bound on square grids makes the support cubulation hyperbolic, and Poincaré duality with the homological Shapiro lemma excludes the virtually cyclic splittings forced by an infinite outer automorphism group. A direct rigidity argument for the right-angled Coxeter group of the infinite lifted triangulation then gives

$ N_("Out" \( Pi \)) \( sans(A) \) = sans(A) times chevron.l delta chevron.r . $

The normalizer equality and the absence of $delta$ make $sans(A)$ a Sylow $2$-subgroup of the outer automorphisms realized on $M$. A homeomorphism from $M$ to $N$ would transport $sans(B)_ell$ into that realized group and force the forbidden conjugacy. This proves Theorem 1.

Section 2 gives the two realization criteria. Section 3 states the chamber data and derives the reflected odd-cover obstruction. Sections 4 and 5 construct the two models and identify their outer actions. Sections 6 and 7 prove the group-theoretic statements and the main theorem. Finally, Sections 8–10 prove the chamber data, including the general tensor theorem and the odd-cover obstruction.

All manifolds are connected unless otherwise indicated. Boundaries have collars, and cornered constructions are rounded. Homotopies of markings are part of the data when boundary maps are prescribed. We use singular cohomology unless a differential-form model is specified, and write $Gamma_j F$ for the lower central series of a group $F$.

== 2 Cyclic covers and realized symmetries <sec:cyclic>

Two criteria organize the passage from a filling obstruction to the homeomorphism conclusions. The first forbids a prescribed outer automorphism from being induced by a homeomorphism. The second uses finite symmetry groups to distinguish two manifold models without prescribing the homotopy class of a possible homeomorphism.

=== 2.1 A criterion from cyclic covers <a-criterion-from-cyclic-covers>

We first isolate the passage from manifold existence in finite covers to a homotopy equivalence that cannot be represented by a homeomorphism. This passage is independent of the four-dimensional construction. A #emph[closed topological $n$-manifold model] of a space is a closed, connected topological $n$-manifold equipped with a homotopy equivalence to that space.

#thm([Theorem 2.1.])[
  (Cyclic-cover criterion).  #emph[Let $Q$ be a connected finite aspherical CW complex, put $G = pi_1 \( Q \)$, and let $w : G arrow.r.twohead bb(Z)$ be an epimorphism. For every positive integer $d$, write 
$ G_d = w^(- 1) \( d bb(Z) \) #h(2em) upright("and") #h(2em) Q_d arrow.r Q $

 for the associated connected cyclic cover. Fix an integer $n gt.eq 1$. Suppose that $Q_2$ has a closed topological $n$-manifold model $M$, but that $Q_d$ has no such model for every sufficiently large odd integer $d$.]
  #emph[Choose $gamma in G$ with $w \( gamma \) = 1$, and use the model equivalence to identify $pi_1 \( M \)$ with $G_2$. The outer automorphism of $G_2$ represented by 
$ alpha \( g \) = gamma g gamma^(- 1) $

 is induced by a self-homotopy equivalence of $M$. No homeomorphism of $M$ induces this outer automorphism. In particular, that self-homotopy equivalence is not homotopic to a homeomorphism.]
] <cyc:criterion>

#proof[
  The manifold $M$ is aspherical, since it is homotopy equivalent to $Q_2$. Topological manifolds have CW homotopy type [21]. The classification of maps between Eilenberg–Mac Lane spaces therefore realizes $alpha$ by a map $f : M arrow.r M$, and realizes its inverse by a homotopy inverse to $f$; see [16] Proposition 1B.9.
  Suppose that a homeomorphism $h : M arrow.r M$ induces the outer class of $alpha$. We will construct closed manifold models for all sufficiently large odd-degree covers of $Q$. Put $K = ker w$, and let
  $ X = K without tilde(M) $
  be the infinite cyclic cover of $M$, where $tilde(M)$ is its universal cover. We use left deck actions throughout. The element $gamma^2 in G_2$ induces a deck transformation $T$ of $X$, and $T$ generates its deck group over $M$.
  Choose a lift $u : tilde(M) arrow.r tilde(M)$ of $h$ that intertwines the deck action by exactly $alpha$:
  #[#set math.equation(numbering: n => "(2.1)")
   $ u g u^(- 1) = gamma g gamma^(- 1) #h(2em) \( g in G_2 \) . $ <cyc:exact-lift>]
  Indeed, any lift induces an automorphism in the prescribed outer class. Composing that lift with a deck transformation removes the inner discrepancy. Since $alpha \( K \) = K$, the map $u$ descends to a homeomorphism $h' : X arrow.r X$. Moreover, $alpha \( gamma^2 \) = gamma^2$, so (2.1) gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ h' T = T h' . $ <cyc:commutation>]
  We next show that a sufficiently large translation composed with $h'$ acts freely and cocompactly on $X$. Represent the homomorphism $w \/ 2 : G_2 arrow.r bb(Z)$ by a map $M arrow.r S^1$ and lift that map to obtain a continuous height function
  $ tau : X arrow.r bb(R) \, #h(2em) tau \( T x \) = tau \( x \) + 1 . $
  This height is proper. To see this, choose a compact set $C subset X$ whose $T$-translates cover $X$, using compactness of $M$, and choose $a \, b in bb(R)$ with $tau \( C \) subset \[ a \, b \]$. A bounded closed height band $tau^(- 1) \( \[ A \, B \] \)$ is a closed subset of
  $ union.big_(j in bb(Z)\
A - b lt.eq j lt.eq B - a) T^j C \, $
  which is a finite union of compact sets.
  By (2.2), the continuous function $x mapsto tau \( h' x \) - tau \( x \)$ is $T$-invariant. It is therefore bounded, say in absolute value by $c gt.eq 0$. For an integer $r > c + 1$, put
  $ F_r = T^r h' . $
  For every $x in X$ we have
  #[#set math.equation(numbering: n => "(2.3)")
   $ 0 < r - c lt.eq tau \( F_r x \) - tau \( x \) lt.eq r + c . $ <cyc:height-increment>]
  Consequently no nonzero power of $F_r$ fixes a point. Iterating the lower bound shows that only finitely many translates of any compact set can meet that set; thus the $bb(Z)$-action generated by $F_r$ is properly discontinuous. Finally, along every orbit the height tends to $+ oo$ in positive time and to $- oo$ in negative time. The first nonnegative height on such an orbit belongs to $\[ 0 \, r + c \]$, by the upper bound in (2.3). The compact band $tau^(- 1) \( \[ 0 \, r + c \] \)$ therefore meets every orbit. This proves cocompactness.
  It follows that
  $ Y_r = X \/ chevron.l F_r chevron.r $
  is a closed connected topological $n$-manifold. Its universal cover is $tilde(M)$, so $Y_r$ is aspherical. To identify its fundamental group, lift $F_r$ to
  $ tilde(F)_r = gamma^(2 r) u quad upright("on ") tilde(M) . $
  Equation (2.1) gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ tilde(F)_r k tilde(F)_r^(- 1) = gamma^(2 r + 1) k gamma^(- \( 2 r + 1 \)) #h(2em) \( k in K \) . $ <cyc:odd-action>]
  The deck group over $Y_r$ is generated by $K$ and $tilde(F)_r$. Its quotient by $K$ is infinite cyclic, since its action on $X$ is generated freely by $F_r$. Hence (2.4) identifies it with
  $ pi_1 \( Y_r \) tilde.equiv K times.r_("Ad"_(gamma^(2 r + 1))) bb(Z) tilde.equiv G_(2 r + 1) . $
  For the second isomorphism, send the generator of $bb(Z)$ to $gamma^(2 r + 1)$ and act identically on $K$. This is bijective because every element of $G_(2 r + 1)$ has a unique expression $k gamma^(\( 2 r + 1 \) j)$ with $k in K$ and $j in bb(Z)$.
  Both $Y_r$ and $Q_(2 r + 1)$ are Eilenberg–Mac Lane spaces, so this group isomorphism is realized by a homotopy equivalence. Taking $r$ sufficiently large contradicts the assumed absence of odd-degree manifold models. ◻
]

#prodef([Remark 2.2.])[
  The equivalence $f$ in Theorem 3 satisfies $f^2 tilde.eq "id"_M$. Indeed, $alpha^2 = "Ad"_(gamma^2)$ is inner because $gamma^2 in G_2$, and unbased homotopy classes of maps between aspherical CW-type spaces are classified by homomorphisms modulo inner automorphisms of the target. The proof nevertheless imposes no order condition on a hypothetical realizing homeomorphism. Its only geometric input is the bounded height displacement of a lift commuting with the deck translation.
] <cyc:homotopy-involution>

=== 2.2 A criterion for distinct manifold models <a-criterion-for-distinct-manifold-models>

Let $X$ be a connected topological manifold and choose an isomorphism $mu_X : pi_1 \( X \) arrow.r^tilde.equiv Pi$ to a group $Pi$. Basepoint paths affect an induced automorphism only by an inner automorphism, so this marking defines a subgroup

$ R_X = "im" #scale(x: 120%, y: 120%)[\(] "Homeo" \( X \) arrow.r "Out" \( Pi \) #scale(x: 120%, y: 120%)[\)] . $

Changing the marking conjugates $R_X$ in $"Out" \( Pi \)$. More generally, if $X$ and $Y$ are so marked and $f : X arrow.r Y$ is a homeomorphism, the outer isomorphism $rho$ defined by $mu_Y f_(*) mu_X^(- 1)$ satisfies

#[#set math.equation(numbering: n => "(2.5)")
 $ R_Y = rho R_X rho^(- 1) . $ <sym:transport>]

This follows by transporting self-homeomorphisms through $f$.

#thm([Proposition 2.3.])[
  (A Sylow criterion for manifold models).  #emph[Let $X$ and $Y$ be connected topological manifolds whose fundamental groups are marked by a group $Pi$, and suppose that $"Out" \( Pi \)$ is finite. Let $sans(A) \, sans(B) lt.eq "Out" \( Pi \)$ be $2$-subgroups of the same order. Suppose that there is an involution $delta$ for which 
$ N_("Out" \( Pi \)) \( sans(A) \) = sans(A) times chevron.l delta chevron.r $

 is an internal direct product, and that 
$ sans(A) lt.eq R_X \, #h(2em) sans(B) lt.eq R_Y \, #h(2em) delta in.not R_X . $

 If $sans(A)$ and $sans(B)$ are not conjugate in $"Out" \( Pi \)$, then $X$ and $Y$ are not homeomorphic.]
] <sym:criterion>

#proof[
  Since $sans(A) lt.eq R_X$, the inclusion of any $a delta$ with $a in sans(A)$ in $R_X$ would imply $delta in R_X$. Hence
  $ N_(R_X) \( sans(A) \) = R_X ∩ #scale(x: 120%, y: 120%)[\(] sans(A) times chevron.l delta chevron.r #scale(x: 120%, y: 120%)[\)] = sans(A) . $
  Choose a Sylow $2$-subgroup $P$ of $R_X$ containing $sans(A)$. A proper subgroup of a finite $2$-group is strictly contained in its normalizer. For completeness, this follows by induction on the group order: an element of the center outside the subgroup enlarges its normalizer, while if the center is contained in the subgroup the claim follows from the induction hypothesis in the quotient by the center. Thus $sans(A) < P$ would contradict the displayed equality, and $sans(A)$ is a Sylow $2$-subgroup of $R_X$.
  If a homeomorphism $X arrow.r Y$ existed, (2.5) would place a conjugate of $sans(B)$ inside $R_X$. Its order is $\| sans(A) \|$, so it too would be a Sylow $2$-subgroup of $R_X$. Sylow conjugacy in $R_X$ would make $sans(A)$ and $sans(B)$ conjugate in $"Out" \( Pi \)$, contrary to the hypothesis. ◻
]

== 3 Reflected cyclic covers <sec:reflection>

The proof begins with a chamber whose double cyclic cover admits a marked filling and whose odd cyclic covers of degree at least three do not. We state the precise chamber data below; Sections 8–10 construct them. This section then passes from marked fillings to closed manifold models, using the reflection construction and its filling implication from [23].

=== 3.1 The reflection input <the-reflection-input>

We recall the finite version of the reflection construction. It uses the framework of Davis [8,9], with the chamber and group calculations established in [23] Section 3. Let $B$ be a space with a collared boundary $S$, and choose a finite flag triangulation $cal(L)$ of $S$. Here #emph[flag] means that every set of pairwise adjacent vertices spans a simplex. For a vertex $s$ of $cal(L)$, let $S_s$ be its closed dual block in the barycentric subdivision. These blocks form the panels of $S$. If $S$ is a three-manifold, a nonempty intersection $⋂_(s in I) S_s$ is a ball of dimension $4 - \| I \|$; such an intersection occurs exactly when $I$ spans a simplex of $cal(L)$.

Write $cal(V)$ for the vertex set, put $A = \( bb(Z) \/ 2 \)^(cal(V))$, and denote its coordinate vectors by $e_s$. For $x in S$, set $I \( x \) = { s : x in S_s }$ and $A_(I \( x \)) = chevron.l e_s : s in I \( x \) chevron.r$. For $x$ in the interior of $B$, set $A_(I \( x \)) = 0$. Define

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(R)_A \( B \) = \( A times B \) \/ tilde.op \, #h(2em) \( a \, x \) tilde.op \( a' \, x \) arrow.l.r.double med a - a' in A_(I \( x \)) . $ <refl:finite-reflection>]

Thus chambers are labeled by $A$, and crossing the panel $S_s$ changes the label by $e_s$. This is the quotient of the right-angled Coxeter development by the kernel of the homomorphism sending each panel generator to its own coordinate in $A$.

The following statement is extracted from the proof in [23] Sections 3–5. It includes the precise manifold-to-filling implication that we require, obtained there by stable realization and controlled removal of middle homology.

#thm([Theorem 3.1.])[
  (Reflection and marked fillings, [23]).  #emph[Let $D$ be a compact connected oriented smooth four-manifold with connected boundary $S$ and free fundamental group $H$. Suppose that $D$ has the homotopy type of a finite graph with $2 k$ two-spheres, and that its whole middle module $H_2 \( tilde(D) \; bb(Z) \)$ over $bb(Z) H$ has a specified framed immersed hyperbolic basis of $k$ planes, with vanishing quadratic self-intersections. Attach three-cells along the basis spheres to obtain a map of collared pairs 
$ \( D \, S \) arrow.r \( P \, S \) $

 that is the identity on $S$ and induces the given identification of fundamental groups. Assume that $\( P \, S \)$ is an oriented Poincaré pair of dimension four, that $P tilde.eq B H$, and that $pi_1 \( S \) arrow.r H$ is surjective.]
  #emph[For a finite flag triangulation of $S$, let $Q = cal(R)_A \( P \)$ be (3.1). Then $Q$ is a finite aspherical oriented Poincaré complex of dimension four. If $Q$ has a closed topological four-manifold model, then $S$ admits a marked graph-type filling: there is a compact oriented topological four-manifold $V$ with an orientation-preserving boundary identification $partial V = S$ and a homotopy equivalence $V arrow.r P$ whose boundary restriction is homotopic to the given inclusion $S arrow.r P$.]
] <refl:input>

For the first assertion, the relevant reflected-pair statement is [23] Proposition 3.2, together with its universal-development argument. Section 3 of that paper also constructs a proper cocompact CAT(0) action for the reflected group and obtains the Farrell–Jones assembly results used in its stable realization argument. Thus these are consequences of the stated chamber input, rather than additional hypotheses on a model. Under the manifold-model hypothesis, [23] Proposition 4.6 supplies periodically labeled standard hyperbolic pairs after stabilization, with the prescribed chamber markings. The removal argument ends in [23] Proposition 5.5, which produces the marked filling. These arguments use the chamber hypotheses stated in Theorem 6; the particular obstruction to filling in that paper is applied only after the filling has been produced. The orientation of a hypothetical model is obtained from its homotopy equivalence to the oriented Poincaré complex $Q$.

=== 3.2 The parity chamber <the-parity-chamber>

The following proposition isolates the geometric data used in the rest of the proof. In particular, it records the lifted chamber hypotheses needed to apply Theorem 6 in every cyclic cover.

#thm([Proposition 3.2.])[
  (Parity chamber data).  #emph[There are chamber data $\( D \, P \, S \, H \)$ satisfying the chamber hypotheses of Theorem 6, with $H$ a finitely generated nonabelian free group, and a distinguished epimorphism $w : H arrow.r bb(Z)$ with the following properties. For $d gt.eq 1$, put $H_d = w^(- 1) \( d bb(Z) \)$, let $D_d \, P_d$ be the associated connected cyclic covers, and let $S_d$ be the preimage of $S$.]
  + #emph[For every $d$, the boundary $S_d$ is connected, and $\( D_d \, P_d \, S_d \, H_d \)$ satisfies all the chamber hypotheses of Theorem 6, with the full framed immersed hyperbolic basis and its vanishing quadratic self-intersections lifted from $D$.]
  + #emph[There is a compact oriented topological four-manifold $V$ with an orientation-preserving boundary identification $partial V = S_2$ and a homotopy equivalence 
$ j : \( V \, S_2 \) arrow.r \( P_2 \, S_2 \) $

 equal to the identity on the boundary.]
  + #emph[For every odd $d gt.eq 3$, there is no compact oriented topological four-manifold $V_d$ with an orientation-preserving boundary identification $partial V_d = S_d$ and a homotopy equivalence $V_d arrow.r P_d$ whose boundary restriction is homotopic to the inclusion $S_d arrow.r P_d$.]
] <refl:chamber-data>

#proof[
  Propositions 38 and 40, together with Corollary 41, construct the base chamber and verify the chamber hypotheses of Theorem 6. The character is the one in (8.11). Lemma 42 proves the assertions about every lifted chamber. Proposition 44 gives the relative filling $j$, and Proposition 52 gives the last assertion, using the marking in Definition 43. These results are proved in Sections 8–10 from the explicitly stated inputs of [22,23]. ◻
]

=== 3.3 Comparing reflected cyclic covers <comparing-reflected-cyclic-covers>

Fix the chamber of Proposition 7. Choose any finite flag triangulation $cal(L)$ of $S$, with vertex set $cal(V)$, and put

$ sans(A)_0 = \( bb(Z) \/ 2 \)^(cal(V)) \, #h(2em) Q^0 = cal(R)_(sans(A)_0) \( P \) \, #h(2em) G^0 = pi_1 \( Q^0 \) . $

There is a folding map

#[#set math.equation(numbering: n => "(3.2)")
 $ r^0 : Q^0 arrow.r P \, #h(2em) r^0 \( \[ a \, x \] \) = x . $ <refl:folding>]

Its restriction to every chamber is the identity. Thus $r_(*)^0$ is a split epimorphism onto $H$. Compose it with the epimorphism $w : H arrow.r bb(Z)$ in (8.11), and use $w$ also for this epimorphism $G^0 arrow.r bb(Z)$. For a positive integer $d$, let $Q_d^0 arrow.r Q^0$ denote its connected degree-$d$ cyclic cover and put $G_d^0 = pi_1 \( Q_d^0 \) = w^(- 1) \( d bb(Z) \)$.

The pullback of $P_d arrow.r P$ along (3.2) is $Q_d^0$. In particular, $Q_d^0$ has the following concrete chamber description: use one copy of $P_d$ for each label in $sans(A)_0$, and cross every lift of $S_s$ by adding the original coordinate $e_s$. This pullback is connected because the composite $G^0 arrow.r bb(Z) \/ d$ is surjective. The boundary of each chamber carries the lifted triangulation $cal(L)_d$ of $S_d$.

Theorem 6 uses an independent coordinate for every panel of its chamber boundary, whereas $Q_d^0$ reuses the downstairs coordinates. The next lemma separates the lifted panel labels by passing to a finite cover, to which the theorem applies directly.

#thm([Lemma 3.3.])[
  #emph[The triangulation $cal(L)_d$ is flag. Let $sans(A)_d = \( bb(Z) \/ 2 \)^(cal(V)_d)$, where $cal(V)_d$ is its vertex set, and distinguish all its lifted panels in the reflection 
$ hat(Q)_d = cal(R)_(sans(A)_d) \( P_d \) . $

 There is a connected finite covering $hat(Q)_d arrow.r Q_d^0$.]
] <refl:cover-comparison>

#proof[
  A clique of vertices in $cal(L)_d$ projects to distinct pairwise adjacent vertices of $cal(L)$. Flagness downstairs supplies a simplex containing their images. Lift that simplex from one vertex of the clique. The clique edges incident to that vertex project to edges of this simplex; uniqueness of their lifts places all vertices of the clique in the chosen lifted simplex. Thus $cal(L)_d$ is flag.
  Define a surjective homomorphism
  $ pi_d : sans(A)_d arrow.r sans(A)_0 $
  by sending the coordinate of a lifted panel to the coordinate of its downstairs panel. In the chamber description of $Q_d^0$ above, the formula $\[ a \, x \] mapsto \[ pi_d \( a \) \, x \]$ is well-defined and surjective. At a point belonging to a set of meeting lifted panels, those panels project to distinct panels downstairs. The homomorphism $pi_d$ therefore restricts to an isomorphism on their coordinate subgroups. The sector identifications in (3.1) consequently give covering charts at this point; in chamber interiors the assertion is immediate. The map is finite because $sans(A)_d$ is finite. Finally, $P_d$ is connected, and each coordinate generator of $sans(A)_d$ is realized by crossing its nonempty panel. All its chambers are therefore in one connected component. ◻
]

#thm([Proposition 3.4.])[
  #emph[For every odd integer $d gt.eq 3$, the space $Q_d^0$ has no closed topological four-manifold model.]
] <refl:odd-models>

#proof[
  Suppose that $Q_d^0$ has such a model. The finite cover of Lemma 8 determines, through the model equivalence, a finite cover of that closed manifold. Lifting the equivalence gives a closed topological four-manifold model for $hat(Q)_d$.
  Proposition 7 verifies all the hypotheses of Theorem 6 for $\( D_d \, P_d \, S_d \, H_d \)$, with the lifted hyperbolic basis and boundary marking. The theorem therefore gives a marked filling of $S_d$, contradicting the last assertion of Proposition 7. ◻
]

=== 3.4 The triangulation used in the construction <the-triangulation-used-in-the-construction>

For the rest of the paper, choose $cal(L)$ to be a finite flag-no-square PL triangulation of $S$ with at least $5000$ vertices. Here #emph[flag-no-square] means flag with no induced four-cycle in the one-skeleton. Such a triangulation exists by [26] Proposition 2.13 and Corollary 2.14: start with a finite PL triangulation, subdivide until it has at least $5000$ vertices, and then use their flag-no-square subdivision, which retains the old vertices. We keep the notation $cal(V)$, $sans(A)_0$, $Q^0$, and $Q_d^0$ for this choice.

For any finite PL triangulation used below, we make compatible cellular choices for the later chamber gluings. Give $S$ the subdivision in which every dual panel is a subcomplex, and extend this finite triangulation over a collar and then over the smooth manifold $D$. Cellular approximation of the finitely many interior three-cell attaching maps gives a finite CW pair $\( P \, S \)$ in the same homotopy type relative to $S$. These choices pass to finite covers. In particular, every union of panels is a boundary subcomplex and its inclusion in a collared chamber is a cofibration. Replacing the chamber by this relative CW model changes no reflected homotopy type: adjoining the finitely many chambers in turn and using the gluing lemma for homotopy pushouts proves this from the relative homotopy equivalence. We use these models without changing notation.

== 4 Two manifold models of the same double cover <mod:section>

We now construct the two closed manifolds that will be distinguished later. We first replace the independent panel labels of the full reflection by a quotient of their label group. The quotient will retain the covering and odd-degree nonexistence properties, while recording enough information to rule out nontrivial symmetries of the triangulation that preserve its label relations. We then fill the doubled chambers with boundary identifications depending on a linear function of the chamber label. Every choice gives a manifold model of the same space, and the choice determines a subgroup of the geometric symmetries that acts by homeomorphisms on that model.

Retain the finite flag-no-square PL triangulation $cal(L)$ of $S$ chosen at the end of Section 3, with vertex set $cal(V)$ of cardinality at least $5000$. Write $S_s$ for its closed dual panel at $s$. Thus

$ I \( x \) = { s in cal(V) : x in S_s } quad \( x in S \) \, #h(2em) I \( x \) = diameter quad \( x in P \\ S \) \, $

and each nonempty $I \( x \)$ is the vertex set of a simplex of $cal(L)$. In particular, it has at most four elements. The full label group is $sans(A)_0 = bb(F)_2^(cal(V))$, with basis $e_s$, and its reflection is $Q^0$. We use the compatible finite CW structures on the chamber and panels fixed in that section.

=== 4.1 A rigid space of label relations <a-rigid-space-of-label-relations>

For $v = sum_s v_s e_s in sans(A)_0$, write

$ "supp" \( v \) = { s : v_s = 1 } \, #h(2em) "wt" \( v \) = \| "supp" \( v \) \| . $

Choose a tetrahedron with vertices $m_1 \, m_2 \, m_3 \, m_4$. For $0 lt.eq i lt.eq 7$, choose pairwise disjoint subsets

$ T_i subset cal(V) \\ { m_1 \, m_2 \, m_3 \, m_4 } \, #h(2em) \| T_i \| = 16 dot.op 2^i - 1 . $

There are enough vertices: these subsets require $16 \( 2^8 - 1 \) - 8 = 4072$ vertices outside the tetrahedron. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ c_i = e_(m_(floor.l i \/ 2 floor.r + 1)) + sum_(s in T_i) e_s \, #h(2em) sans(C) = chevron.l c_0 \, dots.h \, c_7 chevron.r lt.eq sans(A)_0 . $ <mod:relation-space>]

The two vectors associated with $m_j$ have precisely that vertex in common support. All other overlaps between these eight supports are empty.

#thm([Lemma 4.1.])[
  (Rigid label relations).  #emph[The subspace $sans(C)$ has dimension eight, and every nonzero element of $sans(C)$ has weight at least eight. If a simplicial automorphism $sigma$ of $cal(L)$ has $sigma_(*) \( sans(C) \) = sans(C)$, where $sigma_(*) \( e_s \) = e_(sigma \( s \))$, then $sigma$ is the identity.]
] <mod:rigid-relations>

#proof[
  For $J subset { 0 \, dots.h \, 7 }$, let $r \( J \)$ be the number of pairs ${ 2 j - 2 \, 2 j - 1 }$, $1 lt.eq j lt.eq 4$, contained in $J$. Cancellation occurs only at the marked vertex of such a pair, so
  #[#set math.equation(numbering: n => "(4.2)")
   $ "wt" (sum_(i in J) c_i) = 16 sum_(i in J) 2^i - 2 r \( J \) \, #h(2em) 0 lt.eq 2 r \( J \) lt.eq 8 . $ <mod:weight-formula>]
  For distinct $J \, J'$, the first terms on the right differ by at least $16$, while their correction terms differ by at most $8$. Thus all subset sums have different weights. Every nonempty subset sum has weight at least $16 - 8 = 8$, so the $c_i$ are independent.
  A coordinate permutation preserves weight. Since each element of $sans(C)$ has a different weight from the other elements, any coordinate permutation preserving $sans(C)$ fixes every $c_i$. It consequently fixes each singleton
  $ "supp" \( c_(2 j - 2) \) ∩ "supp" \( c_(2 j - 1) \) = { m_j } . $
  In particular, $sigma$ fixes the chosen tetrahedron pointwise. Every triangular face of a closed triangulated three-manifold belongs to exactly two tetrahedra. If one of them is fixed pointwise, an automorphism fixing that face must preserve the other tetrahedron and fix its fourth vertex. This propagates pointwise fixation across faces. The tetrahedron adjacency graph is connected: a path between interior points of two tetrahedra can be put in PL general position with respect to the triangulation, avoiding the one-skeleton and crossing triangular faces one at a time. Propagation along that graph shows that every vertex of $cal(L)$ is fixed. ◻
]

Pass to the quotient labels

#[#set math.equation(numbering: n => "(4.3)")
 $ sans(A) = sans(A)_0 \/ sans(C) \, #h(2em) a_s = e_s med mod med sans(C) . $ <mod:label-quotient>]

For $J subset cal(V)$, put

$ sans(A)_0 \( J \) = chevron.l e_s : s in J chevron.r \, #h(2em) sans(A) \( J \) = chevron.l a_s : s in J chevron.r . $

The labels $a_s$ span $sans(A)$. They are nonzero and are distinct for distinct $s$, because a relation of weight one or two cannot lie in $sans(C)$. If $J$ is a simplex of $cal(L)$, then

#[#set math.equation(numbering: n => "(4.4)")
 $ sans(C) ∩ sans(A)_0 \( J \) = 0 \, #h(2em) dim_(bb(F)_2) sans(A) \( J \) = \| J \| \, $ <mod:simplex-independence>]

since $\| J \| lt.eq 4$ and every nonzero element of $sans(C)$ has weight at least eight. Finally, $dim_(bb(F)_2) sans(A) = \| cal(V) \| - 8 > 0$.

=== 4.2 The quotient reflection and its cyclic covers <the-quotient-reflection-and-its-cyclic-covers>

Use the quotient labels to define

#[#set math.equation(numbering: n => "(4.5)")
 $ Q = \( sans(A) times P \) \/ tilde.op \,\
\( b \, x \) tilde.op \( b' \, x' \) med arrow.l.r.double med x = x' med upright(" and ") med b - b' in sans(A) \( I \( x \) \) . $ <mod:reflection>]

Write its points as $\[ b \, x \]$. The label quotient gives a map

$ q : Q^0 arrow.r Q \, #h(2em) \[ b_0 \, x \] mapsto \[ b_0 med mod med sans(C) \, x \] . $

#thm([Lemma 4.2.])[
  #emph[The map $q$ is a regular finite covering with deck group $sans(C)$. The space $Q$ is a connected finite aspherical CW complex. The folding map 
#[#set math.equation(numbering: n => "(4.6)")
 $ r : Q arrow.r P \, #h(2em) r \( \[ b \, x \] \) = x \, $ <mod:folding>]

 is split by the inclusion of any chamber.]
] <mod:quotient-cover>

#proof[
  The group $sans(C)$ acts on $Q^0$ by translation of its $sans(A)_0$-labels. The stabilizer of $\[ b_0 \, x \]$ in $sans(A)_0$ is $sans(A)_0 \( I \( x \) \)$. Equation (4.4) shows that its intersection with $sans(C)$ is trivial. Hence $sans(C)$ acts freely.
  The orbit relation for this action, written on $sans(A)_0 times P$, identifies two points precisely when their chamber coordinates agree and their label difference lies in $sans(C) + sans(A)_0 \( I \( x \) \)$. Its image under the label quotient is exactly the relation in (4.5). Thus $Q^0 \/ sans(C) = Q$, with the quotient topologies. A free action of a finite group on a Hausdorff space is a covering action: for a point, choose disjoint neighborhoods of it and each of its nontrivial translates, then intersect the finitely many resulting neighborhoods to obtain one whose translates are pairwise disjoint. The space $Q^0$ is Hausdorff because it is a finite CW complex, so this applies and proves the covering assertion.
  For each open cell of $P$, the set $I \( x \)$ is constant on that cell, because every panel is a subcomplex. The relation in (4.5) therefore identifies entire copies of an open cell by the identity. The resulting finitely many open cells, with the attaching maps induced from those of $P$, give a finite CW structure on $Q$. The chamber $P$ is connected. Each panel is nonempty, and crossing $S_s$ joins a chamber labeled $b$ to one labeled $b + a_s$. Since the $a_s$ span $sans(A)$, all chambers belong to one component. Covering maps induce isomorphisms on all higher homotopy groups. The asphericity of $Q^0$ from Theorem 6 thus gives the asphericity of $Q$. The formula for $r$ is well-defined and continuous, and its restriction to each chamber is the identity on $P$. ◻
]

Set $G = pi_1 \( Q \)$, choosing basepoints in a chamber. Compose the split epimorphism $r_(*) : G arrow.r H$ with the chamber character $w : H arrow.r bb(Z)$, and again denote the resulting epimorphism by $w : G arrow.r bb(Z)$. For $d gt.eq 1$, let

$ G_d = w^(- 1) \( d bb(Z) \) \, #h(2em) Q_d arrow.r Q $

be the corresponding connected cyclic cover. If $p_d : P_d arrow.r P$ denotes the chamber cover, then $Q_d$ is the pullback of $p_d$ along $r$. Indeed, its subgroup is $r_(*)^(- 1) \( H_d \) = G_d$, and the pullback is connected because $G arrow.r bb(Z) \/ d$ is onto. In particular, it has the chamber description

#[#set math.equation(numbering: n => "(4.7)")
 $ Q_d = \( sans(A) times P_d \) \/ tilde.op_d \,\
\( b \, y \) tilde.op_d \( b' \, y' \) med arrow.l.r.double med y = y' med upright(" and ") med b - b' in sans(A) \( I \( p_d \( y \) \) \) . $ <mod:cyclic-chambers>]

One way to verify this description, including its topology, is to map $\( b \, y \)$ to $\( \[ b \, p_d \( y \) \] \, y \)$ in $Q times_P P_d$. Its fibers are the displayed equivalence classes, and the induced continuous bijection is a homeomorphism because its source is compact and the pullback is Hausdorff. Thus each chamber is $P_d$; every lift of a panel $S_s$ retains the label change $a_s$.

#thm([Proposition 4.3.])[
  #emph[For every odd integer $d gt.eq 3$, the space $Q_d$ has no closed topological four-manifold model.]
] <mod:odd-models>

#proof[
  The fold for $Q^0$ also has a chamber section. Its connected cyclic cover is consequently $Q_d^0 = Q^0 times_P P_d$. Commutativity of the folding maps gives
  $ Q_d^0 tilde.equiv Q^0 times_Q \( Q times_P P_d \) = Q^0 times_Q Q_d . $
  It follows that $q$ pulls back to a finite covering $q_d : Q_d^0 arrow.r Q_d$; its total space is connected by the preceding description of $Q_d^0$.
  Suppose that $f : Z arrow.r Q_d$ is a homotopy equivalence from a closed connected topological four-manifold. Under the isomorphism $f_(*)$, the subgroup defining $Q_d^0$ determines a connected finite cover $Z' arrow.r Z$. Choose compatible basepoints and lift $f$ to $f' : Z' arrow.r Q_d^0$. A homotopy inverse to $f$ and the two inverse homotopies lift to the corresponding covers, so $f'$ is a homotopy equivalence. The finite cover $Z'$ is again a closed connected topological four-manifold. This contradicts Proposition 9 for $Q_d^0$. ◻
]

=== 4.3 Filling doubled chambers <filling-doubled-chambers>

The next construction uses only local independence and spanning of the panel labels. We formulate it for arbitrary labels with these properties so that the same proof also retains the double-cover model for a full reflection.

Let $K$ be a finite PL triangulation of $S$, with vertex set $cal(U)$ and closed dual panels $S_u^K$. Use the panel-compatible chamber CW structures of Section 3 for this choice of $K$, and their lifts to $\( P_2 \, S_2 \)$. For $y in S_2$, write $macron(y) = p_2 \( y \)$ and set

$ J_K \( y \) = { u in cal(U) : macron(y) in S_u^K } \; $

set $J_K \( y \) = diameter$ for $y in P_2 \\ S_2$. Let $sans(F)$ be a finite-dimensional $bb(F)_2$-vector space with labels $lambda_u in sans(F)$, $u in cal(U)$, which span $sans(F)$ and are linearly independent on every simplex of $K$. For $J subset cal(U)$, put $sans(F) \( J \) = chevron.l lambda_u : u in J chevron.r$. The corresponding doubled reflection is

#[#set math.equation(numbering: n => "(4.8)")
 $ R_2 = \( sans(F) times P_2 \) \/ tilde.op_lambda \,\
\( b \, y \) tilde.op_lambda \( c \, y' \) med arrow.l.r.double med y = y' med upright(" and ") med b - c in sans(F) \( J_K \( y \) \) . $ <mod:general-double-reflection>]

Here $R_2$ depends on $K \, sans(F)$, and its labels. For $K = cal(L)$, $sans(F) = sans(A)$, and $lambda_s = a_s$, it is $Q_2$ by (4.7).

Let

$ j : \( V \, S_2 \) arrow.r \( P_2 \, S_2 \) $

be the relative filling equivalence of Proposition 7; we identify $partial V = S_2$, so $j$ is the identity on the boundary. Let $theta$ be the nontrivial deck transformation of $P_2 arrow.r P$. It preserves $S_2$, and $overline(theta y) = macron(y)$. In particular it preserves the sets of lifted panels used in (4.8).

Fix a linear map $epsilon.alt : sans(F) arrow.r bb(F)_2$. Take one copy $V_b$ of $V$ for each $b in sans(F)$, and use the homotopy equivalence

#[#set math.equation(numbering: n => "(4.9)")
 $ j_b = theta^(epsilon.alt \( b \)) compose j : V_b arrow.r P_2 . $ <mod:twisted-chamber-maps>]

Its boundary restriction is the homeomorphism $h_b = theta^(epsilon.alt \( b \)) : partial V_b = S_2 arrow.r S_2$. In this notation a point $v$ in $V_b$ means the point corresponding to $v in V$ under the fixed identification of the copies.

Define $cal(M)_epsilon.alt$ as the quotient of $product.co_(b in sans(F)) V_b$ by the following relation. Interior points are identified only with themselves. For boundary points $v in partial V_b$ and $v' in partial V_c$, set

#[#set math.equation(numbering: n => "(4.10)")
 $ \( b \, v \) approx_epsilon.alt \( c \, v' \)\
arrow.l.r.double med h_b \( v \) = h_c \( v' \) = : y quad upright("and") quad b - c in sans(F) \( J_K \( y \) \) . $ <mod:boundary-relation>]

Across a lifted $u$-panel, the copies labeled $b$ and $b + lambda_u$ are glued on their identified boundaries by $v mapsto theta^(epsilon.alt \( lambda_u \)) v$; at a meeting of panels, (4.10) includes the corresponding combinations of label changes. For a fixed coordinate $y$, the allowed label differences form a subgroup, so this is an equivalence relation. The chamber maps give a continuous comparison map

#[#set math.equation(numbering: n => "(4.11)")
 $ phi_epsilon.alt : cal(M)_epsilon.alt arrow.r R_2 \, #h(2em) \[ b \, v \] mapsto \[ b \, j_b \( v \) \] . $ <mod:comparison-map>]

It is well-defined because equivalent boundary points have the same target coordinate and an allowed label difference.

We record the local shape of the panel decomposition. This also specifies the charts needed when $V$ has no chosen triangulation.

#thm([Lemma 4.4.])[
  (Panel coordinates).  #emph[Let $y in S_2$, and enumerate $J_K \( y \) = { u_1 \, dots.h \, u_q }$. Then $1 lt.eq q lt.eq 4$. A neighborhood of $\( y \, 0 \)$ in $S_2 times \[ 0 \, oo \)$ has coordinates in a relative-open neighborhood of the origin in $bb(R)^(4 - q) times \[ 0 \, oo \)^q$ such that the lifted panel $p_2^(- 1) \( S_(u_i)^K \) times { 0 }$ is the face $x_i = 0$. The neighborhood may be chosen to meet no lifted panel with label outside $J_K \( y \)$.]
] <mod:panel-coordinates>

#proof[
  The dual panels cover $S$, and panels meet precisely over simplices, which gives $1 lt.eq q lt.eq 4$. In a geometric simplex, the closed dual block of a vertex consists of the points at which that vertex’s barycentric coordinate is maximal. Let $sigma$ be the simplex of $K$ whose relative interior contains $macron(y)$. At $macron(y)$ the $q$ coordinates indexed by $J_K \( y \)$ are tied for the maximum; all other coordinates are strictly smaller. After shrinking a neighborhood, only these $q$ coordinates can be maximal.
  The PL local product about a point of the relative interior of $sigma$ has the directions in $sigma$ and the transverse cone on its link. Because $K$ triangulates a PL three-manifold, that cone supplies PL Euclidean transverse directions. In this product the barycentric coordinates belonging to $sigma$ acquire a common positive scale factor in a transverse direction. Their comparisons are therefore determined by the coordinates within $sigma$. Take the deviations of the $q$ relevant coordinates from their mean, denoted $d_1 \, dots.h \, d_q$, so that $sum_i d_i = 0$. These are $q - 1$ independent local coordinates in $sigma$; the other simplex directions and the transverse directions together give $4 - q$ coordinates. In this chart the $u_i$-panel is given by $d_i = max_j d_j$. Lifting a sufficiently small neighborhood to $S_2$ gives the same description there.
  Adjoin the inward collar coordinate $t gt.eq 0$. On the factor ${ \( d_i \) : sum_i d_i = 0 } times \[ 0 \, oo \)$, define
  #[#set math.equation(numbering: n => "(4.12)")
   $ x_i = t + max_j d_j - d_i \, #h(2em) 1 lt.eq i lt.eq q . $ <mod:orthant-coordinates>]
  This is a homeomorphism onto $\[ 0 \, oo \)^q$. Its continuous inverse is
  $ t = min_i x_i \, #h(2em) d_i = 1 / q sum_j x_j - x_i . $
  Moreover, $x_i = 0$ holds exactly when $t = 0$ and $d_i = max_j d_j$. Thus it identifies the panels with the indicated zero faces. The finitely many panels not containing $y$ are closed, so the initial neighborhood can be chosen disjoint from all of them. ◻
]

#thm([Proposition 4.5.])[
  (Manifold models from doubled chambers).  #emph[Let $K$ be a finite PL triangulation of $S$. Let $sans(F)$ be a finite-dimensional $bb(F)_2$-vector space with labels $\( lambda_u \)_(u in cal(U))$ spanning $sans(F)$ and linearly independent on every simplex of $K$. Using the fixed relative filling $j : \( V \, S_2 \) arrow.r \( P_2 \, S_2 \)$, for every linear map $epsilon.alt : sans(F) arrow.r bb(F)_2$ the space $cal(M)_epsilon.alt$ defined by (4.10) is a closed connected topological four-manifold, and $phi_epsilon.alt : cal(M)_epsilon.alt arrow.r R_2$ in (4.11) is a homotopy equivalence. If $R_2$ is aspherical, then $cal(M)_epsilon.alt$ is aspherical.]
] <mod:models>

#proof[
  For $a in sans(F)$, the set of boundary coordinates allowing the label difference $a$ is
  #[#set math.equation(numbering: n => "(4.13)")
   $ Omega_a & = { y in S_2 : a in sans(F) \( J_K \( y \) \) }\
 & = union.big_(J subset cal(U)\
sum_(u in J) lambda_u = a) med ⋂_(u in J) p_2^(- 1) \( S_u^K \) . $ <mod:allowed-coordinates>]
  The empty intersection is understood to be $S_2$. The equality holds because an element of $sans(F) \( J_K \( y \) \)$ is the sum of the labels of some subset of $J_K \( y \)$. Each $Omega_a$ is a finite union of closed panel intersections. The relation between two fixed chamber boundaries in (4.10) is the equality of their $h_b$-coordinates over $Omega_(b - c)$, hence is closed. On a single chamber the relation is its full diagonal, because $h_b$ is injective. The finitely many closed relations between distinct chambers, together with these diagonals, give a closed equivalence relation on the compact Hausdorff space $product.co_b V_b$. Its quotient $cal(M)_epsilon.alt$ is therefore compact Hausdorff, and each chamber embeds in it. The same argument with $P_2$ in place of $V$ shows that $R_2$ is compact Hausdorff and that its chambers embed. The panel-compatible CW structures also give $R_2$ a finite CW structure by the cell argument in Lemma 11.
  The manifold $V$ is connected, since $j$ is a homotopy equivalence and $P_2$ is connected. Every lifted panel is nonempty. Consequently, for each $u$ the chambers labeled $b$ and $b + lambda_u$ meet. Since the labels span $sans(F)$, these intersections connect all the chambers, proving connectedness.
  Interior points already have four-manifold charts. Consider a boundary point with coordinate $y$, and write $J_K \( y \) = { u_1 \, dots.h \, u_q }$. The labels of the chambers containing its equivalence class form
  $ b + sans(F) \( J_K \( y \) \) = {b + sum_(i = 1)^q eta_i lambda_(u_i) : \( eta_1 \, dots.h \, eta_q \) in bb(F)_2^q} . $
  Local independence makes this parametrization bijective, so there are exactly $2^q$ chambers at the point. Choose collars of their boundaries, transporting the boundary coordinate to $S_2$ by the maps $h_b$. Lemma 13 supplies the same chart in each collar. Shrink it to a relative-open product box
  $ \( - rho \, rho \)^(4 - q) times \[ 0 \, rho \)^q $
  that meets no panel outside $J_K \( y \)$. These boxes together form an open saturated subset of the disjoint union of chambers: every allowed label change within them belongs to $sans(F) \( J_K \( y \) \)$.
  In the chamber indexed by $eta in bb(F)_2^q$, map this box to $bb(R)^(4 - q) times bb(R)^q$ by
  $ \( z \, x_1 \, dots.h \, x_q \) mapsto \( z \, \( - 1 \)^(eta_1) x_1 \, dots.h \, \( - 1 \)^(eta_q) x_q \) . $
  Two such images agree exactly on the faces on which the relevant coordinates are zero, and these are precisely the identifications in (4.10). The quotient of the boxes is therefore $\( - rho \, rho \)^4$. More explicitly, the displayed map is a continuous bijection after taking the quotient, and its inverse is continuous by the pasting lemma on the finitely many closed orthants of $\( - rho \, rho \)^4$. This gives a chart without boundary. Thus $cal(M)_epsilon.alt$ is locally Euclidean of dimension four. Compactness supplies a finite cover by such charts and interior charts, so their countable bases also give a countable basis for $cal(M)_epsilon.alt$. We have proved that it is a closed topological four-manifold.
  It remains to prove that $phi_epsilon.alt$ is a homotopy equivalence. Enumerate the finitely many labels, and in both $cal(M)_epsilon.alt$ and $R_2$ take the images of their chambers one at a time. These images and their finite unions are compact, hence closed. When the new label is $b$ and the earlier labels are $c$, its attaching set in the boundary coordinate $S_2$ is
  $ K_b = union.big_(upright("earlier ") c) Omega_(b - c) . $
  Formula (4.13) expresses $K_b$ as a finite union of lifted panel intersections. It is therefore a subcomplex of the lifted boundary CW structure. In the new source chamber the attaching set is $h_b^(- 1) \( K_b \)$; in the new target chamber it is $K_b$. The comparison on them is exactly the homeomorphism $h_b$. The quotient descriptions and the chamber embeddings show that adjoining the new chamber is the pushout along these attaching sets. For example, the natural map from that pushout to the corresponding union is a continuous bijection from a compact space to a Hausdorff space and hence is a homeomorphism.
  The inclusions of $K_b$ into $S_2$, and of $h_b^(- 1) \( K_b \)$ into $partial V_b$, are cofibrations because they are, up to the boundary homeomorphism, inclusions of CW subcomplexes. The inclusions of the boundaries into $P_2$ and $V_b$ are cofibrations by their collars. Composing these cofibrations gives cofibrations from the attaching sets into the new chambers on both sides. Hence each ordinary pushout is a homotopy pushout: its comparison with the double mapping cylinder is a homotopy equivalence. Homotopy pushouts preserve a map of spans that is a homotopy equivalence at all three objects. Here the map on the attaching set is $h_b$, the map on the new chamber is the homotopy equivalence $j_b$, and the map on the preceding union is a homotopy equivalence by induction. The first chamber starts the induction. This proves that $phi_epsilon.alt$ is a homotopy equivalence. If $R_2$ is aspherical, lifting this equivalence to universal covers shows that the universal cover of $cal(M)_epsilon.alt$ is contractible. ◻
]

#thm([Corollary 4.6.])[
  (The double cover of a full reflection).  #emph[For every finite flag triangulation $K$ of $S$, let $Q^0 \( K \)$ be its full reflection, using one independent basis label for each vertex. The connected double cyclic cover of $Q^0 \( K \)$ defined by the folding character has a closed connected aspherical topological four-manifold model.]
] <refl:even-model>

#proof[
  First suppose that the triangulation is PL relative to the fixed PL structure on $S$. Take $sans(F) = bb(F)_2^(cal(U))$, $lambda_u = e_u$, and $epsilon.alt = 0$ in Proposition 14. These labels span and are independent on every simplex. The target $R_2$ is the pullback description of the double cyclic cover of $Q^0 \( K \)$ from Section 3. The proposition supplies its four-manifold model. The full reflection is aspherical by Theorem 6, so the cover and the model are aspherical.
  For an arbitrary finite triangulation, its abstract complex is a combinatorial three-manifold [24] Section 2.1, p. 3, and hence induces a PL structure on $S$. By [15] Theorem 2(2), p. 64, an isotopy $h_t : S arrow.r S$ from the identity ends at a PL homeomorphism from this structure to the fixed one. The triangulation $h_1 \( K \)$ has the same abstract flag complex and is PL for the fixed structure. For this comparison, use the panel-compatible collared CW representative of $P$ for $h_1 \( K \)$ on both sides. Extend $h_t$ across its collar, fixed away from that collar, to an isotopy with endpoint $h_P$, and use the pulled-back CW structure on the $K$ side. The relative comparison maps from Section 3 fix $S$. Since $pi_1 \( S \) arrow.r H$ is surjective, they preserve the marking of $H$ and the folding character, so the induced reflected homotopy equivalences lift to the corresponding cyclic covers. Identify the full label spaces by $e_u mapsto e_(h_1 \( u \))$. With this identification, the map $\[ a \, x \] mapsto \[ a \, h_P \( x \) \]$ is a homeomorphism from $Q^0 \( K \)$ to $Q^0 \( h_1 \( K \) \)$, since it carries each panel to its corresponding panel. It also identifies the cyclic covers: the folding maps commute with $h_P$, and an isotopy to the identity preserves the character $w$ on fundamental groups, up to an inner automorphism. The PL case therefore supplies a model for the double cover of $Q^0 \( K \)$ as well. ◻
]

=== 4.4 The two models and their actions <the-two-models-and-their-actions>

Return to the fixed triangulation $cal(L)$ and the quotient labels $\( sans(A) \, a_s \)$. They satisfy the hypotheses of Proposition 14 by (4.4). For each linear $epsilon.alt : sans(A) arrow.r bb(F)_2$, denote the resulting manifold $cal(M)_epsilon.alt$ by $M_epsilon.alt$, and its comparison map by

$ f_epsilon.alt : M_epsilon.alt arrow.r Q_2 . $

The target is $Q_2$ by (4.7). It is aspherical as a cover of $Q$, so every $M_epsilon.alt$ is a closed connected aspherical topological four-manifold. Set

#[#set math.equation(numbering: n => "(4.14)")
 $ Pi = pi_1 \( Q_2 \) = G_2 \, $ <mod:common-group>]

using compatible basepoints. Each $f_epsilon.alt$ gives a marking of $pi_1 \( M_epsilon.alt \)$ by $Pi$, well-defined up to inner automorphism when basepoint paths are suppressed.

The group $sans(A) times bb(F)_2$ acts on $Q_2$ by

#[#set math.equation(numbering: n => "(4.15)")
 $ \( a \, t \) \[ b \, y \] = \[ b + a \, theta^t y \] . $ <mod:ambient-action>]

The formula respects the relation in (4.7) because $overline(theta^t y) = macron(y)$. For a linear $epsilon.alt : sans(A) arrow.r bb(F)_2$, define the graph subgroup

#[#set math.equation(numbering: n => "(4.16)")
 $ sans(B)_epsilon.alt = { \( a \, epsilon.alt \( a \) \) : a in sans(A) } lt.eq sans(A) times bb(F)_2 . $ <mod:graph-subgroup>]

#thm([Proposition 4.7.])[
  (Actions on the manifold models).  #emph[The action (4.15) is faithful. For each linear $epsilon.alt : sans(A) arrow.r bb(F)_2$, its restriction to $sans(B)_epsilon.alt$ is realized by a faithful action by homeomorphisms on $M_epsilon.alt$, and $f_epsilon.alt$ is equivariant for these actions. Under the marking by $Pi$, the outer automorphism induced by each of these homeomorphisms is the one induced by the corresponding action on $Q_2$.]
] <mod:actions>

#proof[
  An element of $sans(A) times bb(F)_2$ acting trivially on $Q_2$ must fix a point in a chamber interior. Interior coordinates are not identified between labels, and the nontrivial deck transformation of $P_2$ fixes no point. The element therefore has both coordinates zero, proving faithfulness.
  For $a in sans(A)$, define a map on the copies of $V$ by changing the label from $b$ to $b + a$ and using the identity on $V$. Its boundary coordinates satisfy
  $ h_(b + a) \( v \) = theta^(epsilon.alt \( a \)) h_b \( v \) . $
  Thus two previously identified boundary coordinates are both changed by $theta^(epsilon.alt \( a \))$. Their projections to $S$ stay the same, and their label difference stays the same. The map respects (4.10), and descends to a homeomorphism
  $ T_a^epsilon.alt : M_epsilon.alt arrow.r M_epsilon.alt \, #h(2em) T_a^epsilon.alt \[ b \, v \] = \[ b + a \, v \] . $
  The maps compose according to addition in $sans(A)$. Their action is faithful because an interior point in a chamber labeled $b$ is sent to an interior point in the distinct chamber labeled $b + a$ when $a eq.not 0$.
  Finally, linearity of $epsilon.alt$ gives the exact equality
  $ f_epsilon.alt T_a^epsilon.alt \[ b \, v \] & = \[ b + a \, theta^(epsilon.alt \( b + a \)) j \( v \) \]\
 & = \( a \, epsilon.alt \( a \) \) \[ b \, theta^(epsilon.alt \( b \)) j \( v \) \] = \( a \, epsilon.alt \( a \) \) f_epsilon.alt \[ b \, v \] . $
  This is the required equivariance. Passing to fundamental groups and suppressing the basepoint paths gives the stated equality of outer automorphisms. ◻
]

Choose a nonzero linear functional $ell : sans(A) arrow.r bb(F)_2$, which exists because $dim_(bb(F)_2) sans(A) > 0$, and set

#[#set math.equation(numbering: n => "(4.17)")
 $ M = M_0 \, #h(2em) N = M_ell . $ <mod:two-models>]

Their equivalences to $Q_2$ make them homotopy equivalent. The homeomorphisms just constructed realize $sans(B)_0 = sans(A) times { 0 }$ on $M$ and $sans(B)_ell$ on $N$. We identify $sans(B)_0$ with $sans(A)$ in the remaining group-theoretic argument.

== 5 The reflection extension and its outer actions <ext:section>

The models $M = M_0$ and $N = M_ell$ realize two graph subgroups of $sans(A) times bb(F)_2$ on $Q_2$. We now place these actions inside $"Out" \( Pi \)$, where $Pi = pi_1 \( Q_2 \)$. A reflection extension of $Pi$ will identify the prohibited cyclic action and will also distinguish the two graph subgroups by an intrinsic property of their elements. Throughout this section we identify fundamental groups with deck groups using left actions.

=== 5.1 The lifted development <the-lifted-development>

Let $tilde(P) arrow.r P$ be the universal cover of the chamber. Its deck group is $H$. The preimage of $S$ is connected because $pi_1 \( S \) arrow.r H$ is surjective; denote it by $hat(S)$. It is the regular cover of $S$ associated to the kernel of that epimorphism, and its deck group is $H$. Let $hat(cal(L))$ be the lift of the chosen PL triangulation $cal(L)$, and write $hat(cal(V))$ for its vertex set. For $u in hat(cal(V))$, write $overline(u) in cal(V)$ for its image.

#thm([Lemma 5.1.])[
  #emph[The complex $hat(cal(L))$ is a connected, locally finite, flag-no-square PL triangulation of the three-manifold $hat(S)$. The deck action of $H$ is free on its vertices, and its quotient is $cal(L)$. In particular, each vertex link is a PL two-sphere.]
] <ext:lifted-nerve>

#proof[
  The local assertions about the triangulation and its links follow by lifting PL charts. The action is free because a deck transformation of a connected covering that fixes a point is the identity. Its quotient is $cal(L)$ because the covering is regular with deck group $H$.
  A clique upstairs projects to a clique of distinct vertices downstairs. Flagness gives a simplex on their images. Lift this simplex from one vertex of the clique. Uniqueness of the lifts of its incident edges places every other vertex of the clique in that lifted simplex. Thus $hat(cal(L))$ is flag.
  For a four-cycle upstairs, adjacent vertices have distinct images. Opposite vertices also have distinct images: otherwise, at an intervening vertex, two incident lifted edges would be lifts of the same downstairs edge. The projected four-cycle therefore has four distinct vertices. It has a diagonal because $cal(L)$ has no induced four-cycle. The diagonal and two consecutive sides span a triangle downstairs by flagness. Lifting that triangle from their common vertex lifts the diagonal to the original four-cycle. Consequently the lifted cycle is not induced. ◻
]

Let $W$ be the right-angled Coxeter group on the graph of $hat(cal(L))$:

$ W = ⟨u med \( u in hat(cal(V)) \) med mid(bar.v) med u^2 = 1 \, quad u v = v u med upright("if ") u v upright(" is an edge")⟩ . $

We use a vertex and its Coxeter generator interchangeably. The deck action permutes these generators and gives the semidirect product

$ cal(E) = W times.r H \, #h(2em) \( d \, h \) \( d' \, h' \) = \( d thin h \( d' \) \, h h' \) . $

Define an $H$-invariant homomorphism $chi_0 : W arrow.r sans(A)_0$ by $chi_0 \( u \) = e_(overline(u))$. Extend it to $cal(E)$ by making it zero on $H$, and let $chi : cal(E) arrow.r sans(A)$ be its composition with the quotient $sans(A)_0 arrow.r sans(A)$. Finally, define

#[#set math.equation(numbering: n => "(5.1)")
 $ eta : cal(E) arrow.r sans(A) times bb(F)_2 \, #h(2em) eta \( d \, h \) = #scale(x: 120%, y: 120%)[\(] chi \( d \, h \) \, w \( h \) med mod med 2 #scale(x: 120%, y: 120%)[\)] . $ <ext:eta>]

This map is onto: the generators of $W$ give every label $a_s$, and the epimorphism $w : H arrow.r bb(Z)$ gives the second factor independently.

The stabilizers in the development will be special subgroups. We record their elementary support properties before using them.

#thm([Lemma 5.2.])[
  (Special subgroups and support).  #emph[Let $W \( cal(G) \)$ be a right-angled Coxeter group on an arbitrary simple graph with vertex set $V$. For $J subset.eq V$, the special subgroup $W_J$ generated by $J$ is the right-angled Coxeter group on the induced graph, and 
$ W_J ∩ W_K = W_(J ∩ K) . $

 Every $d in W \( cal(G) \)$ has a unique smallest vertex set $"supp" \( d \)$ for which $d in W_("supp" \( d \))$. This support is finite, and graph automorphisms transport supports.]
] <ext:support>

#proof[
  Killing every generator outside $J$ defines a retraction onto the Coxeter group of the induced graph on $J$. Its composition with the natural map of that group into $W \( cal(G) \)$ is the identity, so that natural map is injective and gives $W_J$. If $d in W_J ∩ W_K$, apply the retraction onto $W_J$ to a word for $d$ on $K$. The result is a word on $J ∩ K$ for $d$, proving the intersection formula.
  Choose a finite set $F$ supporting a word for $d$. Intersect $F$ with every supporting set. Because $F$ is finite, the result is already the intersection of finitely many of those sets; repeated use of the intersection formula shows that it still supports $d$. It is therefore the unique smallest support. Its characterization makes it equivariant under graph automorphisms. This is the right-angled form of the standard Coxeter support statement [9] Proposition 4.1.1 and Corollary 4.1.2. ◻
]

Apply this notation to $W$. At $x in tilde(P)$, let $J \( x \)$ be the vertices of the lifted panels containing $x$, with $J \( x \) = diameter$ off $hat(S)$. This set spans a simplex, so $W_(J \( x \))$ is the elementary abelian group on $J \( x \)$. Form

#[#set math.equation(numbering: n => "(5.2)")
 $ tilde(Q) = \( W times tilde(P) \) \/ tilde.op \, #h(2em) \( c \, x \) tilde.op \( c' \, x \) med arrow.l.r.double med c^(- 1) c' in W_(J \( x \)) . $ <ext:universal-space>]

The relation never changes the chamber coordinate. Since $J \( h x \) = h J \( x \)$, the formula

#[#set math.equation(numbering: n => "(5.3)")
 $ \( d \, h \) \[ c \, x \] = \[ d thin h \( c \) \, h x \] $ <ext:action>]

defines an action of $cal(E)$ on $tilde(Q)$.

#thm([Proposition 5.3.])[
  #emph[The space $tilde(Q)$ is contractible. If $overline(x)$ and $x_2$ are the images of $x$ in $P$ and $P_2$, respectively, the maps 
$ \[ c \, x \] & mapsto \[ chi_0 \( c \) \, overline(x) \] in Q^0 \,\
 & mapsto \[ chi \( c \) \, overline(x) \] in Q \,\
 & mapsto \[ chi \( c \) \, x_2 \] in Q_2 $

 are universal coverings. With the chosen deck-group convention, 
#[#set math.equation(numbering: n => "(5.4)")
 $ pi_1 \( Q^0 \) = ker chi_0 \, #h(2em) G := pi_1 \( Q \) = ker chi \, #h(2em) Pi := pi_1 \( Q_2 \) = ker eta . $ <ext:groups>]

 The homomorphism $w : G arrow.r bb(Z)$ induced by the folding map is $w$ composed with the projection $cal(E) arrow.r H$.]
] <ext:development>

#proof[
  The contractibility assertion is the universal-development argument in [23] Section 3, subsection #emph[The universal development], immediately before Proposition 3.2. Its chamber hypotheses are the ones verified for $\( P \, S \)$ in the reflection construction. That argument filters the chambers of (5.2) by word length in $W$. A new chamber is contractible and meets the preceding chambers in the nonempty ball of its descent panels. The argument treats an infinite word-length layer simultaneously and takes a CW direct limit, giving a contractible development even when the lifted generator set is infinite. This is the lifted-mirror construction of Davis [9] Section 9.1, Equations (9.1)–(9.3) and Theorem 9.1.5; Equation (9.3) there is (5.3).
  Here is the quotient and covering check for the label groups in this paper. The set $J \( x \)$ projects bijectively to the set of panels meeting $overline(x)$. The restrictions of $chi_0$ and $chi$ to $W_(J \( x \))$ are therefore injective: for $chi_0$ the images are distinct coordinate vectors, and for $chi$ they are the simplex-independent labels $a_s$. Their images are exactly the label subgroups used in the respective reflection identifications. This proves that the three displayed maps are well-defined. They are onto because every label has a representative in $W$ and every chamber coordinate lifts.
  We check their fibers uniformly. Use $lambda = chi_0$ or $chi$ and the chamber cover $P_d$, where the three cases are $\( lambda \, d \) = \( chi_0 \, 1 \) \, \( chi \, 1 \) \, \( chi \, 2 \)$, with $P_1 = P$, $H_1 = H$, and $H_2 = w^(- 1) \( 2 bb(Z) \)$. For these cases put
  $ K_(lambda \, d) = { \( d_0 \, h \) in cal(E) : lambda \( d_0 \) = 0 \, med h in H_d } . $
  Suppose $\[ c \, x \]$ and $\[ c' \, x' \]$ have the same image. Equality of their chamber coordinates gives $x' = h x$ for some $h in H_d$, and equality of the reflected points says that $lambda \( c' \) - lambda \( c \)$ belongs to $lambda \( W_(J \( x' \)) \)$. Choose $t in W_(J \( x' \))$ with
  $ lambda \( t \) = lambda \( c' \) - lambda \( c \) . $
  Then $d_0 = c' t thin h \( c \)^(- 1)$ satisfies $lambda \( d_0 \) = 0$, since $lambda$ is $H$-invariant and the label groups have characteristic two. Formula (5.3) sends $\[ c \, x \]$ by $\( d_0 \, h \)$ to $\[ c' t \, x' \] = \[ c' \, x' \]$. Conversely, every element of $K_(lambda \, d)$ preserves the displayed map. Thus its fibers are exactly the $K_(lambda \, d)$-orbits.
  These orbit maps are covering maps, including at the panels. At an interior point choose an evenly covered chamber neighborhood disjoint from the boundary. At a boundary point choose a small lifted collar neighborhood meeting only the panels in $J \( x \)$ and mapping homeomorphically to its chamber neighborhood. The adjacent chamber sectors are indexed by $W_(J \( x \))$ upstairs and by $lambda \( W_(J \( x \)) \)$ downstairs. The isomorphism between these two finite groups identifies their sector gluings, so each such assembled neighborhood maps homeomorphically onto the corresponding neighborhood in the reflection. The different $K_(lambda \, d)$-translates give the disjoint sheets. The point stabilizer in $cal(E)$ at $\[ c \, x \]$ is $c W_(J \( x \)) c^(- 1)$: a fixing element has $h = 1$ because $H$ acts freely on $tilde(P)$, and the relation (5.2) then gives this conjugate. The subgroup $K_(lambda \, d)$ meets it trivially by the injectivity just proved. These are precisely the covering charts used in the cited universal-development argument.
  For comparison with the notation of [23], let $C_(cal(L))$ be the downstairs right-angled Coxeter group. The homomorphism forgetting the lift of each generator is $q : W arrow.r C_(cal(L))$, and that paper uses $Delta = ker \( C_(cal(L)) arrow.r sans(A)_0 \)$ and $rho \( d \, h \) = q \( d \)$. Its group $rho^(- 1) \( Delta \)$ is exactly $ker chi_0$. Thus the first identification in (5.4) is also the group formula in the cited subsection of [23]. The fiber calculation gives the identifications for $Q$ and $Q_2$. Since $tilde(Q)$ is contractible, these coverings are universal.
  Finally, the map $\[ c \, x \] mapsto x$ from $tilde(Q)$ to $tilde(P)$ is equivariant for the projection $cal(E) arrow.r H$. It covers the folding map $Q arrow.r P$. Consequently the fold-induced homomorphism on $G$ is that projection, which proves the assertion about $w$. ◻
]

The preimages of the two coordinate factors are

#[#set math.equation(numbering: n => "(5.5)")
 $ G & = eta^(- 1) \( { 0 } times bb(F)_2 \) \,\
cal(E)_2 & = W times.r H_2 = eta^(- 1) \( sans(A) times { 0 } \) \,\
G ∩ cal(E)_2 & = Pi . $ <ext:e2>]

All three groups are normal in $cal(E)$.

=== 5.2 Embedding the extension in the automorphism group <embedding-the-extension-in-the-automorphism-group>

The extension acts on its normal subgroup $Pi$ by conjugation. Finite support and the free deck action show that this action is faithful.

#thm([Proposition 5.4.])[
  #emph[Conjugation gives an injection $cal(E) arrow.r.hook "Aut" \( Pi \)$. It identifies $Pi$ with $"Inn" \( Pi \)$ and induces an inclusion 
#[#set math.equation(numbering: n => "(5.6)")
 $ cal(E) \/ Pi = sans(A) times chevron.l delta chevron.r med lt.eq med "Out" \( Pi \) \, #h(2em) delta = \( 0 \, 1 \) . $ <ext:outer>]

 Here $chevron.l delta chevron.r tilde.equiv bb(F)_2$. Inside $"Aut" \( Pi \)$, $cal(E)$ is the full preimage of the product in (5.6); $cal(E)_2$ and $G$ are the full preimages of its factors $sans(A)$ and $chevron.l delta chevron.r$, respectively.]
] <ext:embedding>

#proof[
  The subgroup $Pi$ is normal in $cal(E)$ by (5.4). Suppose that $\( d \, h \)$ centralizes $Pi$. It commutes with $\( 1 \, k \)$ for every $k in H_2 subset.eq Pi$. The semidirect-product formula gives
  $ h k = k h \, #h(2em) d = k \( d \) #h(2em) \( k in H_2 \) . $
  The finite-index subgroup $H_2$ of the nonabelian free group $H$ is itself nonabelian. If $h eq.not 1$, the first equality would put $H_2$ inside the cyclic centralizer of $h$ in $H$, a contradiction. Thus $h = 1$.
  The second equality and Lemma 18 make the finite set $"supp" \( d \)$ invariant under $H_2$. Every $H_2$-orbit of vertices is infinite: $H_2$ is infinite and its deck action is free. Hence $"supp" \( d \)$ is empty, so $d = 1$. This proves the injection and also proves that $Z \( Pi \) = 1$.
  Conjugation by the elements of $Pi$ gives exactly $"Inn" \( Pi \)$, and it is injective because the center is trivial. Taking quotients now gives (5.6) through (5.1). To see that the preimage is full, let an automorphism of $Pi$ have the same outer class as conjugation by some $e in cal(E)$. It differs from that conjugation by conjugation by an element $gamma in Pi$, and is therefore conjugation by $gamma e in cal(E)$. Taking the preimages of the two factors and using (5.5) gives the last assertion. ◻
]

#thm([Proposition 5.5.])[
  #emph[Under (5.6), the action of $cal(E) \/ Pi$ on $Q_2$ is the label-translation and cyclic-deck action 
$ \( a \, t \) \[ b \, y \] = \[ a + b \, theta^t y \] \, #h(2em) \( a \, t \) in sans(A) times bb(F)_2 . $

 With the markings supplied by Proposition 14, the graph action on $M_epsilon.alt$ from Proposition 16 induces exactly the subgroup 
$ sans(B)_epsilon.alt = { \( a \, epsilon.alt \( a \) \) : a in sans(A) } lt.eq "Out" \( Pi \) . $

 In particular, every element of $sans(A) = sans(B)_0$ is induced by a homeomorphism of $M$, and every element of $sans(B)_ell$ is induced by a homeomorphism of $N$.]
] <ext:outer-actions>

#proof[
  In the covering map to $Q_2$ from Proposition 19, Equation (5.3) changes the label by $chi \( d \, h \)$ and the chamber coordinate by the action of $h$ on $P_2$. The latter action is $theta^(w \( h \) med mod med 2)$. This gives the displayed formula. Conjugation on the universal deck group is the induced outer automorphism, so (5.6) identifies these actions with the stated outer classes. The equivariance of the model maps in Proposition 16 then identifies the classes of the graph actions on the manifolds. ◻
]

#thm([Proposition 5.6.])[
  #emph[With the marking $pi_1 \( M \) tilde.equiv Pi$, no homeomorphism of $M$ induces the outer automorphism $delta$.]
] <ext:delta>

#proof[
  The quotient reflection $Q$ is a connected finite aspherical complex. Its folding homomorphism is the epimorphism $w : G arrow.r bb(Z)$ of Proposition 19. The space $Q_2$ has the closed topological four-manifold model $M$ by Proposition 14, whereas Proposition 12 excludes such a model for every odd $d gt.eq 3$. These facts verify all hypotheses of Theorem 3, with $n = 4$.
  Choose $h in H$ with $w \( h \) = 1$. The element $gamma = \( 1 \, h \)$ lies in $G = ker chi$, has $w \( gamma \) = 1$, and maps to $\( 0 \, 1 \)$ under (5.1). Consequently conjugation by $gamma$ on $Pi$ represents $delta$ in (5.6). The cyclic-cover criterion gives a self-homotopy equivalence $f : M arrow.r M$ inducing this class, and asserts that no homeomorphism of $M$ induces it. This proves Proposition 22. A map homotopic to $f$ induces the same outer automorphism, so $f$ is not homotopic to a homeomorphism. This proves Theorem 2. ◻
]

#thm([Proposition 5.7.])[
  #emph[The subgroups $sans(A)$ and $sans(B)_ell$ of $"Out" \( Pi \)$ are not conjugate.]
] <ext:nonconjugate>

#proof[
  Consider the property that an outer automorphism has a finite-order lift to $"Aut" \( Pi \)$. This property is invariant under conjugation in $"Out" \( Pi \)$: if $F$ represents the conjugating outer automorphism and $alpha$ is a finite-order lift, then $F alpha F^(- 1)$ is a finite-order lift of the conjugate.
  Every lift of an element $\( a \, 1 \)$ in (5.6) belongs to $cal(E)$ by Proposition 20. Its projection to $H$ has odd, hence nonzero, $w$-value. It therefore has infinite order in $cal(E)$ and, by the injection into $"Aut" \( Pi \)$, infinite order as an automorphism. Thus no $\( a \, 1 \)$ has the property. In contrast, each $\( a_s \, 0 \)$ has a finite-order lift: any Coxeter generator above $s$ is an involution in $cal(E)$ lifting it.
  The graph subgroup $sans(B)_ell$ and the horizontal subgroup $sans(A)$ have identical elements over $ker ell$. Every element of $sans(B)_ell$ over its complement has second coordinate $1$ and lacks a finite-order lift. Some $a_s$ lies in that complement, since the $a_s$ span $sans(A)$ and $ell eq.not 0$; the corresponding element of $sans(A)$ does have such a lift. Hence $sans(B)_ell$ has strictly fewer elements with the property than $sans(A)$. Conjugate finite subgroups have the same number, proving the claim. ◻
]

The normalizer calculation below will ensure that a homeomorphism between the models would force the conjugacy just excluded. It will be combined with the finiteness of $"Out" \( Pi \)$ established in the next section.

== 6 Hyperbolicity and outer automorphisms <hyp:section>

We now prove that the common manifold group $Pi$ has finite outer automorphism group. The geometric step is to show that the reflection extension $cal(E) = W times.r H$ is word-hyperbolic. We use the support construction of [23] Lemma 3.3 and its proof to obtain a cubical model for $cal(E)$, and then bound the size of isometric square grids in its edge graph. Poincaré duality will exclude the virtually cyclic splittings that an infinite outer automorphism group would force.

Write $hat(cal(V)) = hat(cal(L))^(\( 0 \))$ for the generating set of $W$. Recall that $hat(cal(L))$ is a locally finite flag triangulation of a PL three-manifold, and that its graph has no induced four-cycle. In particular, every clique has at most four vertices. The deck group $H$ acts freely on $hat(cal(L))$ with finite quotient.

=== 6.1 The cubical model and its edge graph <the-cubical-model-and-its-edge-graph>

The ordinary Davis complex of $W$ has infinitely many generator types. The following construction, recalled from [23] Lemma 3.3, arranges Davis complexes of finitely generated special subgroups over a tree on which $H$ acts. We record the resulting edge graph because the hyperbolicity argument will use its labels directly.

#thm([Lemma 6.1.])[
  (Support construction).  #emph[There are a locally finite tree $T$ with a free cocompact $H$-action, an $H$-equivariant family of finite subtrees $\( T_u \)_(u in hat(cal(V)))$, and a locally finite CAT(0) cube complex $X$ with a proper cocompact $cal(E)$-action, with the following properties:]
  + #emph[If $u \, u'$ are adjacent in $hat(cal(L))$, then $T_u$ and $T_(u')$ meet at a vertex. Moreover, 
$ b_T := sup_(u in hat(cal(V))) \| T_u^(\( 0 \)) \| < oo . $

]
  + #emph[The vertices of $X$ are the pairs $\( a \, t \) in W times T^(\( 0 \))$. Its edges are exactly 
#[#set math.equation(numbering: n => "(6.1)")
 $ \( a \, t \) & arrow.l.r \( a u \, t \) &  & upright("if ") u in hat(cal(V)) upright(" and ") t in T_u^(\( 0 \)) \,\
\( a \, t \) & arrow.l.r \( a \, t' \) &  & upright("if ") \[ t \, t' \] upright(" is an edge of ") T . $ <hyp:edge-graph>]

]
  + #emph[On these vertices the action is 
$ \( b \, h \) \( a \, t \) = \( b thin h \( a \) \, h t \) #h(2em) \( b in W \, med h in H \) . $

 The cubes of $X$ have dimension at most five.]
] <hyp:cubical-model>

#proof[
  The group $H$ is finitely generated: its free action on the connected locally finite graph $hat(cal(L))^(\( 1 \))$ has finite quotient, so lifting a spanning tree of that quotient leaves only finitely many edge identifications needed to generate the deck group. Choose the Cayley tree $T$ of a finite free basis of $H$. It is locally finite, and $H$ acts freely and cocompactly without inversions.
  Choose points $a_u in T^(\( 0 \))$, equivariantly in $u in hat(cal(V))$; one chooses them on representatives of the finitely many $H$-orbits and then translates. Freeness of the deck action makes this assignment well defined. There are also only finitely many orbits of edges of $hat(cal(L))$. Thus $d_T \( a_u \, a_(u') \)$, for adjacent $u \, u'$, has a common finite bound. Choose an integer $r gt.eq 0$ at least this bound and let $T_u$ be the closed combinatorial ball of radius $r$ about $a_u$. These balls are subtrees. Adjacent vertices have supports meeting at a vertex, and the number of vertices in each support is bounded uniformly by a finite number $b_T$. In particular $b_T gt.eq 1$.
  For a vertex $t$ and an edge $e$ of $T$, define
  $ cal(U)_t = { u : t in T_u } \, #h(2em) cal(U)_e = { u : e subset T_u } . $
  Both kinds of set have uniformly bounded finite size. Indeed, a support containing $t$ has its center in the radius-$r$ ball about $t$; that ball contains uniformly finitely many orbit points, and there are only finitely many generator orbits. The assertion for $cal(U)_e$ follows from the assertion for either endpoint. Since each $T_u$ is a subtree, for $e = \[ t \, t' \]$ we have
  #[#set math.equation(numbering: n => "(6.2)")
   $ cal(U)_e = cal(U)_t ∩ cal(U)_(t') . $ <hyp:endpoint-supports>]
  Let $W_t$ and $W_e$ be the special subgroups of $W$ generated by $cal(U)_t$ and $cal(U)_e$, respectively. The edge maps $W_e arrow.r W_t \, W_(t')$ are special subgroup inclusions.
  These groups form a graph of groups over $T$ whose fundamental group is $W$. To see the presentation explicitly, the copies of a generator $u$ in the vertex groups are identified along precisely the connected subtree $T_u$, by (6.2). Every commutation relation of $W$ occurs in a vertex group, since the supports of its two adjacent generators meet at a vertex. Each vertex group is defined by the induced subgraph on $cal(U)_t$, so it introduces only relations of $W$. The resulting presentation is therefore the right-angled presentation of $W$. Special subgroups inject, so the Bass–Serre tree of this graph of groups has vertices $\( a W_t \, t \)$ and edges $\( a W_e \, e \)$, with the evident endpoint maps. This Bass–Serre tree, which can have infinite valence, is the tree over which the next spaces are assembled.
  For a finite set $J subset hat(cal(V))$, let $Sigma_J$ denote the Davis cube complex of $W_J$. Its vertices are the elements of $W_J$. For each clique $C subset J$ and each coset $k W_C$ in $W_J$, it has a cube whose vertex set is $k W_C$; its dimension is $\| C \|$, since $W_C tilde.equiv \( bb(Z) \/ 2 \)^(\| C \|)$. For $J = diameter$ this is a single vertex. These complexes are CAT(0), and inclusions of special subgroups induce closed convex cubical inclusions of their Davis complexes; see [9] Chapters 7 and 12. Set $Sigma_t = Sigma_(cal(U)_t)$ and $Sigma_e = Sigma_(cal(U)_e)$.
  Following the support construction of [23] Lemma 3.3, use the vertex spaces $W times_(W_t) Sigma_t$ and the edge cylinders
  $ W times_(W_e) #scale(x: 120%, y: 120%)[\(] Sigma_e times \[ 0 \, 1 \] #scale(x: 120%, y: 120%)[\)] . $
  Here $W times_K Z$ identifies $\( a k \, z \)$ with $\( a \, k z \)$ for $k in K$. Choose an ordering $e = \[ t \, t' \]$ of the endpoints of each edge of $T$, and glue the cylinder at $0$ and $1$ into the corresponding vertex spaces by the special-subcomplex inclusions. Give $\[ 0 \, 1 \]$ its single-edge cubulation. The resulting cubical complex $X$ is a tree of spaces over the Bass–Serre tree just described.
  We can now identify its graph. A vertex of $W times_(W_t) Sigma_t$ is represented by $\[ a \, k \]$ with $k in W_t$, and $\[ a \, k \] mapsto a k$ is a bijection from these vertices to $W$. An edge in $Sigma_t$ joins $k$ to $k u$ for $u in cal(U)_t$, so the vertex-space edges are exactly the first line of (6.1). The same identification gives one vertex labeled by each element of $W$ in $W times_(W_e) Sigma_e$. Each endpoint inclusion preserves this label. Thus its cylinder has an edge from $\( a \, t \)$ to $\( a \, t' \)$ for every $a in W$. The cylinder has no vertices over the interior of $\[ 0 \, 1 \]$; its remaining edges lie in its endpoint spaces and are already vertex-space edges. This proves that (6.1) lists every edge, including when $cal(U)_e = diameter$.
  For completeness, the local and metric properties in the cited construction are compatible with this graph description. For a fixed edge $e$ incident to $t$, the translates of $Sigma_e$ in a vertex copy of $Sigma_t$ have as their vertex sets the cosets of $W_e$ in $W_t$. Those cosets partition the Cayley vertices. Hence a finite subcomplex meets only finitely many such translates, even if the Bass–Serre vertex has infinite valence. There are only finitely many edges of $T$ incident to $t$, and $Sigma_t$ is locally finite. It follows that $X$ is locally finite. A vertex cube has dimension at most four and an edge cylinder at most five, by the clique bound. The unit-cube length metric is consequently proper and complete. Convex CAT(0) gluing first over finite subtrees of the Bass–Serre tree, and then over their union, proves that $X$ is CAT(0): the finite-subtree gluings are CAT(0) and convex in larger ones, and completeness follows from the local finiteness just checked.
  Left multiplication defines the $W$-action. Equivariance of the supports defines the $H$-action on the vertex and edge spaces, and on vertices the combined action is $\( b \, h \) \( a \, t \) = \( b thin h \( a \) \, h t \)$. This action is free on vertices: if it fixes $\( a \, t \)$, then $h$ fixes $t$, whence $h = 1$, and then $b a = a$ gives $b = 1$. Local finiteness makes the cellular action proper. There are finitely many vertex orbits, because $W$ acts transitively on the first coordinate and $T \/ H$ is finite. Local finiteness then gives finitely many cube orbits, so the action is cocompact. ◻
]

=== 6.2 A uniform bound on square grids <a-uniform-bound-on-square-grids>

Give $X^(\( 1 \))$ its edge-path metric $d_1$. Label an edge in the first line of (6.1) by its generator $u$, and label an edge in the second line by the unoriented edge $\[ t \, t' \]$ of $T$. We call these Coxeter labels and tree labels, respectively. For an integer $n gt.eq 0$, a square grid of side length $n$ means the graph on ${ 0 \, dots.h \, n }^2$ with its $ell^1$ metric.

#thm([Lemma 6.2.])[
  #emph[Every isometric embedding of a square grid of side length $n$ into $X^(\( 1 \))$ satisfies 
$ n lt.eq 16 b_T - 1 . $

]
] <hyp:bounded-grids>

#proof[
  First consider any embedded four-cycle in $X^(\( 1 \))$. Projection to $T$ shows that a cycle containing tree edges has either two or four of them. Four tree edges would give an embedded cycle in a tree, because the $W$-coordinate would be constant. With two tree edges, the projected closed walk traverses the same tree edge twice. They cannot be consecutive in the four-cycle, since two such consecutive steps would repeat a vertex. They are therefore opposite. The two remaining edges are also opposite and have the same Coxeter label, as their product in $W$ is the identity.
  If all four edges have Coxeter labels, their label word is trivial in $W$. The abelianization of $W$ is the direct sum of copies of $bb(Z) \/ 2$ indexed by $hat(cal(V))$, so each label occurs an even number of times. Embeddedness forbids consecutive equal labels, including at the closing vertex. Thus two distinct labels alternate. They commute: if they were nonadjacent, the special subgroup on them would be the infinite dihedral group, in which their alternating word of length four is nontrivial. We have proved that opposite edges of every embedded four-cycle have equal labels, adjacent edges cannot both have tree labels, and adjacent Coxeter labels are distinct and commute.
  Let an isometric grid of side length $n$ be given. Each of its elementary four-cycles is embedded. Equality of labels on opposite edges shows that the label at a fixed horizontal step is independent of the vertical coordinate, and the label at a fixed vertical step is independent of the horizontal coordinate. If each direction had a tree label, the elementary square where those steps meet would have adjacent tree edges. After interchanging the directions if necessary, all vertical labels are therefore Coxeter labels.
  Suppose $n gt.eq 16$. The vertical labels include two that do not commute. Indeed, if they all commuted, their distinct labels would form a clique of size at most four. They would generate a group of order at most $2^4 = 16$. Each column has constant tree coordinate, so its $n + 1$ distinct vertices would have at most 16 possible $W$-coordinates, a contradiction.
  Every horizontal Coxeter label is distinct from and commutes with every vertical label, by the elementary-square calculation. If two horizontal Coxeter labels did not commute, they and the two noncommuting vertical labels would be four distinct vertices whose cross pairs are adjacent and whose two same-direction pairs are nonadjacent. They would form an induced four-cycle in $hat(cal(L))$. Hence the horizontal Coxeter labels form a clique and generate a group of order at most 16. Along any one row, tree edges leave the $W$-coordinate unchanged, so all $W$-coordinates lie in a single left coset of this finite group.
  Fix one vertical label $u$. Each column has constant tree coordinate, and the $u$-edge occurs in every column at the same vertical step. The edge description (6.1) therefore places every tree coordinate of the row in $T_u^(\( 0 \))$. There are at most $b_T$ such coordinates and at most 16 $W$-coordinates. The row has $n + 1$ distinct vertices, so
  $ n + 1 lt.eq 16 b_T . $
  This proves the claimed bound when $n gt.eq 16$. If $n lt.eq 15$, the same bound follows from $b_T gt.eq 1$. ◻
]

=== 6.3 From grids to hyperbolicity <from-grids-to-hyperbolicity>

We next explain why this grid bound implies thin triangles. We use the standard hyperplane description of the median graph of a CAT(0) cube complex, as in [7] Theorem 6.1, Lemmas 6.3–6.4, and the paragraph following Lemma 6.4. For vertices $x \, z$, let $J_x \( z \)$ be the finite set of hyperplanes separating them. If $d_1$ denotes the graph metric, then

#[#set math.equation(numbering: n => "(6.3)")
 $ d_1 \( z \, z' \) = \| J_x \( z \) triangle.stroked.t J_x \( z' \) \| . $ <hyp:hyperplane-distance>]

In particular, $z$ belongs to the interval

$ I \( x \, y \) := { z : d_1 \( x \, z \) + d_1 \( z \, y \) = d_1 \( x \, y \) } $

exactly when $J_x \( z \) subset J_x \( y \)$. Every triple of vertices has a median, the unique vertex in all three pairwise intervals. Its side of each hyperplane is the side containing at least two of the three vertices. Equivalently, for any vertices $a \, b \, c$,

#[#set math.equation(numbering: n => "(6.4)")
 $ J_x \( "med" \( a \, b \, c \) \) = #scale(x: 120%, y: 120%)[\(] J_x \( a \) ∩ J_x \( b \) #scale(x: 120%, y: 120%)[\)] union #scale(x: 120%, y: 120%)[\(] J_x \( b \) ∩ J_x \( c \) #scale(x: 120%, y: 120%)[\)] union #scale(x: 120%, y: 120%)[\(] J_x \( c \) ∩ J_x \( a \) #scale(x: 120%, y: 120%)[\)] . $ <hyp:median-sides>]

#thm([Lemma 6.3.])[
  #emph[Let $Y$ be a CAT(0) cube complex. Suppose every isometrically embedded square grid in its edge graph has side length at most $K$, where $K$ is a nonnegative integer. Then any two vertices of $I \( x \, y \)$ at the same distance from $x$ are at distance at most $2 K$, uniformly in $x \, y$. Every geodesic triangle with vertex corners in the edge graph is $4 K$-thin at its vertices.]
] <hyp:grids-to-triangles>

#proof[
  Use the notation and hyperplane facts above for $Y$. Fix $v \, v' in I \( x \, y \)$ with $d_1 \( x \, v \) = d_1 \( x \, v' \)$. Then $J_x \( v \) \, J_x \( v' \) subset J_x \( y \)$ and these two finite sets have equal cardinality. Put
  $ B = J_x \( v \) ∩ J_x \( v' \) \, #h(2em) n = \| J_x \( v \) \\ J_x \( v' \) \| = \| J_x \( v' \) \\ J_x \( v \) \| . $
  For $m = "med" \( x \, v \, v' \)$, Equation (6.4) gives $J_x \( m \) = B$. Choose edge geodesics
  $ v_0 = m \, v_1 \, dots.h \, v_n = v \, #h(2em) v'_0 = m \, v'_1 \, dots.h \, v'_n = v' . $
  Their lengths are $n$ by (6.3). Along each geodesic, the separating sets add exactly one hyperplane at each step: its endpoint set contains its initial set, and removing a hyperplane or adding one outside the endpoint set would require an extra crossing. Thus
  $ J_x \( v_i \) = B union A_i \, #h(2em) J_x \( v'_j \) = B union A'_j \, $
  where $A_i$ and $A'_j$ are increasing chains of sets of cardinalities $i$ and $j$, respectively. All $A_i$ lie in $J_x \( v \) \\ J_x \( v' \)$, and all $A'_j$ lie in the disjoint set $J_x \( v' \) \\ J_x \( v \)$.
  For $0 lt.eq i \, j lt.eq n$, set $z_(i j) = "med" \( y \, v_i \, v'_j \)$. Since the two separating sets for $v_i \, v'_j$ are contained in $J_x \( y \)$, the majority formula gives
  $ J_x \( z_(i j) \) = J_x \( v_i \) union J_x \( v'_j \) = B union A_i union A'_j . $
  The two chains add disjoint hyperplanes. Their nesting and (6.3) therefore give
  $ d_1 \( z_(i j) \, z_(k l) \) = \| i - k \| + \| j - l \| #h(2em) \( 0 lt.eq i \, j \, k \, l lt.eq n \) . $
  In particular these vertices are distinct and form an isometrically embedded square grid of side length $n$. Hence $n lt.eq K$, and
  $ d_1 \( v \, v' \) = \| J_x \( v \) triangle.stroked.t J_x \( v' \) \| = 2 n lt.eq 2 K . $
  This proves the uniform assertion about intervals.
  For vertices $a \, b \, c$, let $m$ be their median and choose one edge geodesic from $m$ to each corner. Concatenating the appropriate two chosen paths gives a geodesic between each pair of corners, because $m$ belongs to every pairwise interval. Each of these three chosen sides lies in the union of the other two.
  Now take arbitrary edge-geodesic sides of the triangle. A vertex on the arbitrary side from $a$ to $b$ and the vertex at the same distance from $a$ on the chosen side both belong to $I \( a \, b \)$, so they are at distance at most $2 K$. The latter vertex lies on the chosen side from $a$ to $c$ or the chosen side from $b$ to $c$. Matching its distance from the corresponding endpoint on that arbitrary side costs at most another $2 K$. Thus every vertex on each arbitrary side is within $4 K$ of the other two sides. This vertex formulation is the usual thin-triangle criterion for the unit-edge graph. ◻
]

#thm([Proposition 6.4.])[
  #emph[The groups $cal(E)$ and $Pi$ are word-hyperbolic.]
] <hyp:word-hyperbolic>

#proof[
  Lemmas 25 and 26, with $K = 16 b_T - 1$, show that $X^(\( 1 \))$ is a hyperbolic graph. Its unit-edge metric is proper because $X$ is locally finite. The $cal(E)$-action on this graph is proper and cocompact by Lemma 24. The Švarc–Milnor lemma [6] Proposition I.8.19 gives a quasi-isometry from a Cayley graph of $cal(E)$ to $X^(\( 1 \))$. Hyperbolicity is invariant under quasi-isometry [6] Theorem III.H.1.9, so $cal(E)$ is word-hyperbolic. The subgroup $Pi$ has finite index in $cal(E)$, and hence is word-hyperbolic as well. ◻
]

=== 6.4 Poincaré duality and outer automorphisms <poincaré-duality-and-outer-automorphisms>

We use the closed aspherical topological four-manifold model of $Pi$ to exclude splittings over virtually cyclic groups. The argument detects a splitting by a finitely supported path cocycle; duality and the homological form of Shapiro’s lemma then force its cohomology group to vanish.

#thm([Lemma 6.5.])[
  #emph[The group $Pi$ admits no nontrivial splitting over a virtually cyclic subgroup. It has one end.]
] <hyp:no-vc-splitting>

#proof[
  The finite aspherical complex $Q_2$ is a finite-dimensional $K \( Pi \, 1 \)$. Its lifted cellular chain complex gives $"cd"_(bb(Z)) Pi < oo$. A group of finite integral cohomological dimension is torsion-free: if it contained a subgroup of prime order, restricting a finite projective resolution to that subgroup would contradict the nonzero integral cohomology of a cyclic group of prime order in arbitrarily high degrees. Thus $Pi$ is torsion-free. Also, $Pi ∩ H$ has finite index in the nonabelian free group $H$, so it is a nonabelian free group. In particular, $Pi$ is infinite and is not virtually cyclic.
  Suppose that $Pi$ has a splitting as an amalgamated product or HNN extension with virtually cyclic edge group $U$. Assume the splitting is nontrivial, meaning that the Bass–Serre tree $cal(B)$ has no global fixed vertex; the action has no inversions. Its unoriented edges form the $Pi$-set $Pi \/ U$. Fix a vertex $p$ of $cal(B)$, and define
  $ c \( g \) = sum_(e upright(" on ") \[ p \, g p \]) e med in med bb(F)_2 \[ Pi \/ U \] #h(2em) \( g in Pi \) \, $
  where the sum is empty when $g p = p$. All sums have finite support. Concatenating the paths from $p$ to $g p$ and from $g p$ to $g h p$, and canceling edges traversed twice, gives the path from $p$ to $g h p$. Over $bb(F)_2$ this says
  $ c \( g h \) = c \( g \) + g thin c \( h \) . $
  Thus $c$ is a group-cohomology cocycle.
  The orbit of $p$ is unbounded. Otherwise its bounded invariant subtree would have a center fixed by $Pi$; the center is a vertex or an edge midpoint, and in the latter case the absence of inversions also fixes its endpoints. Either case contradicts nontriviality. Consequently
  $ \| "supp" c \( g \) \| = d_(cal(B)) \( p \, g p \) $
  is unbounded as $g$ varies. On the other hand, a coboundary $g q - q$, for $q in bb(F)_2 \[ Pi \/ U \]$, has support size at most $2 \| "supp" q \|$ for every $g$. Hence
  #[#set math.equation(numbering: n => "(6.5)")
   $ \[ c \] eq.not 0 quad upright("in") quad H^1 \( Pi \; bb(F)_2 \[ Pi \/ U \] \) . $ <hyp:path-class>]
  Let $M$ be the closed aspherical topological four-manifold with fundamental group $Pi$. Poincaré duality with local coefficients on $M$ applies to arbitrary $bb(F)_2 Pi$-modules, including the possibly infinite-dimensional permutation module $bb(F)_2 \[ Pi \/ U \]$; see [27] Theorem 10.2. The orientation twist is trivial over $bb(F)_2$. Using the description of local coefficients by modules over the fundamental group in [16] Section 3.H, asphericity and duality therefore give
  $ H^1 \( Pi \; bb(F)_2 \[ Pi \/ U \] \) tilde.equiv H_3 \( Pi \; bb(F)_2 \[ Pi \/ U \] \) . $
  The permutation module is the induced module $bb(F)_2 Pi ⊗_(bb(F)_2 U) bb(F)_2$, with trivial $U$-action on the last factor. Homological Shapiro’s lemma [29] Lemma 6.3.2 gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ H_3 \( Pi \; bb(F)_2 \[ Pi \/ U \] \) tilde.equiv H_3 \( U \; bb(F)_2 \) . $ <hyp:shapiro>]
  Indeed, if $P_(*)$ is a free right $bb(F)_2 Pi$-resolution of $bb(F)_2$, then
  $ P_(*) ⊗_(bb(F)_2 Pi) \( bb(F)_2 Pi ⊗_(bb(F)_2 U) bb(F)_2 \) tilde.equiv P_(*) ⊗_(bb(F)_2 U) bb(F)_2 . $
  The restriction of $P_(*)$ is a free $bb(F)_2 U$-resolution, so the right-hand complex computes the homology of $U$. This also makes explicit why the induced, finite-support module is the one used here.
  A torsion-free virtually cyclic group is either trivial or infinite cyclic [28] Sections 4.A.6.2 and 5.B.1. Thus $U$ has a classifying space that is a point or a circle, and $H_3 \( U \; bb(F)_2 \) = 0$; see [29] Examples 6.1.3–6.1.4. Duality and (6.6) now contradict (6.5). This proves nonsplitting.
  Finally $Pi$ is finitely generated by Proposition 27 and is infinite. Stallings’ ends theorem [28] Section 1.B.6 says that a finitely generated group with more than one end has a nontrivial splitting over a finite subgroup. Such a subgroup is virtually cyclic, so the splitting just excluded would exist if $Pi$ had more than one end. Therefore $Pi$ has one end. ◻
]

#thm([Proposition 6.6.])[
  #emph[The outer automorphism group $"Out" \( Pi \)$ is finite.]
] <hyp:finite-out>

#proof[
  Bestvina and Feighn, using Paulin’s construction of a limiting action on an $bb(R)$-tree [25], prove that a word-hyperbolic group with infinite outer automorphism group splits nontrivially over a virtually cyclic subgroup [3] Corollary 1.3. The group $Pi$ is word-hyperbolic by Proposition 27, while Lemma 28 excludes every such splitting. The stated splitting theorem therefore implies that $"Out" \( Pi \)$ is finite. ◻
]

== 7 The normalizer of the label subgroup <nor:section>

By Proposition 29, $"Out" \( Pi \)$ is finite. It contains the two realized subgroups $sans(A)$ and $sans(B)_ell$, which are not conjugate by Proposition 23. To apply the Sylow criterion, we determine the normalizer of $sans(A)$. Conjugation by a representative of a normalizer element preserves the full preimage $cal(E)_2$ of $sans(A)$. We will show that it preserves $W$ and that its restriction to $W$ is an inner automorphism followed by an automorphism induced by a simplicial symmetry of the infinite nerve $hat(cal(L))$; the label relations will then force that symmetry to be a deck transformation. The rigidity proof uses finite supports and the topology of links.

=== 7.1 Rigidity of the Coxeter generators <rigidity-of-the-coxeter-generators>

For a simplicial complex $X$, write $W \( X \)$ for the right-angled Coxeter group on its graph. In the subscript of a special subgroup, a subcomplex denotes its vertex set. For a graph $cal(G)$, the notation $"st"_(cal(G)) \( u \)$ means the closed neighbor set consisting of $u$ and all its neighbors, and $"lk"_(cal(G)) \( u \)$ means the neighbor set. The following facts are standard for finite graphs [14] Lemmas 2.4–2.7. The proof records why they also hold for an arbitrary vertex set.

#thm([Lemma 7.1.])[
  #emph[Let $W \( cal(G) \)$ be the right-angled Coxeter group on a simple graph $cal(G)$ with vertex set $V$.]
  + #emph[For $u in V$, 
$ C_(W \( cal(G) \)) \( u \) = W_("st"_(cal(G)) \( u \)) . $

]
  + #emph[Every finite-order element is conjugate to a product of distinct generators supported on a clique, with the empty product allowed.]
  + #emph[The center is the special subgroup on the universal vertices: 
$ Z \( W \( cal(G) \) \) = W_({ v in V : med v upright(" is adjacent to every ") u eq.not v }) . $

]
] <nor:coxeter-facts>

#proof[
  Put $L = "lk"_(cal(G)) \( u \)$. The presentations and the special-subgroup injections of Lemma 18 give
  $ W \( cal(G) \) = W_(V \\ { u }) *_(W_L) #scale(x: 120%, y: 120%)[\(] W_L times chevron.l u chevron.r #scale(x: 120%, y: 120%)[\)] . $
  If $u$ is adjacent to every other vertex, the second factor is the whole group and the centralizer assertion is immediate. Otherwise consider the Bass–Serre tree of this amalgam. The element $u$ fixes the vertex of the second factor. It fixes no edge incident to that vertex: every such edge stabilizer is a conjugate of $W_L$ within $W_L times chevron.l u chevron.r$, hence is $W_L$, which does not contain $u$. The fixed subtree of $u$ is therefore that single vertex. Its centralizer must stabilize this vertex and so lies in the second factor. That factor centralizes $u$, proving the first assertion.
  For the second assertion, a finite-order element lies in a special subgroup on a finite supporting set by Lemma 18. Work in that finite induced graph and induct on its number of vertices. A finite-order element in the displayed amalgam fixes a vertex of its Bass–Serre tree, so is conjugate into one of the factors. The first factor has fewer generators. In the second factor its projection to $W_L$ has finite order; induction conjugates that projection to a product on a clique in $L$. Multiplying by the possible $u$-factor still gives a clique. This also covers the degenerate direct-product case, and starts with the trivial group.
  Finally, an element is central exactly when it belongs to all the centralizers in the first assertion. By Lemma 18, its support must then lie in $⋂_(u in V) "st"_(cal(G)) \( u \)$, the set of universal vertices. Every generator in that set is central. This gives the asserted equality, also for an infinite graph. ◻
]

#thm([Lemma 7.2.])[
  #emph[Every automorphism of $W$ induces a permutation of the coordinate vectors in 
$ W_(upright("ab")) = xor.big_(u in hat(cal(V))) bb(F)_2 thin upright(bold(e))_u . $

 The resulting vertex permutation is a simplicial automorphism of $hat(cal(L))$. After composing with the inverse of that generator permutation, the original automorphism sends each Coxeter generator to a conjugate of itself.]
] <nor:generator-lines>

#proof[
  Let $cal(T) subset.eq W_(upright("ab"))$ consist of the vectors represented by finite-order elements of $W$. Lemma 30 shows that these are exactly the vectors supported on cliques, including the zero vector: the converse holds because a product of commuting involutions has finite order.
  We first recover tetrahedra from this set. Suppose a vector subspace $U$ is contained in $cal(T)$. Any two coordinates that occur somewhere in $U$ occur together in one vector of $U$: choose a witness for each coordinate; if neither witness has both coordinates, their sum does. That vector is supported on a clique. It follows that the union of all supports in $U$ is a clique. Conversely, the full span of every clique lies in $cal(T)$. Hence a maximal subspace contained in $cal(T)$ is exactly the full span of a maximal clique. These spaces are
  $ V_tau = "span"_(bb(F)_2) { upright(bold(e))_u : u upright(" is a vertex of ") tau } \, $
  where $tau$ is a maximal clique. The triangulation is flag and is a pure three-manifold triangulation, so its maximal cliques are precisely its tetrahedra.
  We next recover each coordinate line from those subspaces. For a vertex $u$,
  #[#set math.equation(numbering: n => "(7.1)")
   $ ⋂_(tau in.rev u) V_tau = chevron.l upright(bold(e))_u chevron.r \, $ <nor:line-intersection>]
  where the intersection ranges over tetrahedra containing $u$. Indeed, if another vertex $v$ lay in all those tetrahedra, then $v$ would occur in every maximal triangle of $"lk"_(hat(cal(L))) \( u \)$. This link is a pure PL two-sphere. Every one of its simplices lies in a maximal triangle, so the link would equal the star of $v$ and would be a cone. That contradicts its being a two-sphere. This proves (7.1). Conversely, every one-dimensional intersection of tetrahedron subspaces is a coordinate line: an intersection of subspaces spanned by subsets of a fixed basis is the span of the intersection of those subsets.
  An automorphism of $W$ preserves $cal(T)$ and hence permutes its maximal vector subspaces. Its induced invertible linear map preserves intersections, so (7.1) and the converse show that it permutes all coordinate lines. Over $bb(F)_2$ it therefore permutes the coordinate vectors themselves. For distinct $u \, v$, adjacency is equivalent to $upright(bold(e))_u + upright(bold(e))_v in cal(T)$. The permutation preserves adjacency, and flagness makes it a simplicial automorphism.
  The image of a Coxeter generator has finite order. By Lemma 30 it is conjugate to a clique product; its abelianization is the sum of the coordinates in that product. Since the abelianization just obtained is one coordinate vector, the product consists of the corresponding single generator. Composing with the inverse generator permutation gives the final assertion. ◻
]

It remains to make the conjugating elements for different generators agree. For right-angled Coxeter groups with finite defining graphs, comparison of conjugators on overlapping special subgroups also appears in [13] Section 4. Here we compare stars and use connected links; this gives a proof for the infinite nerve as well.

#thm([Lemma 7.3.])[
  #emph[Let $X$ be $hat(cal(L))$ or the link in $hat(cal(L))$ of a simplex of dimension $0$, $1$, or $2$. If an automorphism $phi$ of $W \( X \)$ sends each vertex generator to a conjugate of itself, then $phi$ is inner.]
] <nor:conjugating>

#proof[
  The links in the statement are flag PL spheres of dimensions $2$, $1$, and $0$. We prove the assertion for them in increasing dimension, and then for $hat(cal(L))$. The link of a vertex at each induction step is one of the lower-dimensional links already treated.
  For the zero-sphere, $W \( X \) = chevron.l r \, s divides r^2 = s^2 = 1 chevron.r$ is infinite dihedral. After an inner adjustment, arrange that $phi \( r \) = r$. With $t = r s$, every conjugate of $s$, and hence its image, has the form $t^j r$. The subgroup generated by $r$ and $t^j r$ is $chevron.l r \, t^j chevron.r$; it is the whole group only if $j = plus.minus 1$. Since $s = t^(- 1) r$ and $r s r = t r$, these two possibilities give the identity or conjugation by $r$. This proves the base case.
  Now let $X$ have positive dimension and suppose the result is known for its vertex links. For each vertex $u$, we claim that one element $g_u in W \( X \)$ implements $phi$ on all the generators of its star. Choose $b_u$ with $phi \( u \) = b_u u b_u^(- 1)$ and put $psi = c_(b_u^(- 1)) compose phi$, where $c_g$ denotes conjugation by $g$. The automorphism $psi$ fixes $u$ and therefore preserves its centralizer. Flagness identifies that centralizer, by Lemma 30, as
  #[#set math.equation(numbering: n => "(7.2)")
   $ C_(W \( X \)) \( u \) = chevron.l u chevron.r times W \( "lk"_X \( u \) \) . $ <nor:star-product>]
  For a link generator $v$, write $psi \( v \) = q_v v q_v^(- 1)$. The image belongs to the star subgroup because it commutes with $u$. Apply the star retraction from Lemma 18 to this equation. Writing the retracted conjugator as $u^(epsilon.alt_v) k_v$ under (7.2), with $k_v in W \( "lk"_X \( u \) \)$, gives
  $ psi \( v \) = k_v v k_v^(- 1) . $
  Thus $psi$ maps the link subgroup into itself and conjugates each of its generators inside that subgroup.
  This restricted map is onto. Given $y in W \( "lk"_X \( u \) \)$, surjectivity of $psi$ on the centralizer supplies a preimage $u^epsilon.alt k$ with $k in W \( "lk"_X \( u \) \)$. Because $psi \( u \) = u$ and $psi \( k \)$ is in the link subgroup, $y = u^epsilon.alt psi \( k \)$. Uniqueness of the direct-product coordinates forces $epsilon.alt = 0$. Hence the restriction of $psi$ is a conjugating automorphism of the link subgroup. By induction it is conjugation by some $k in W \( "lk"_X \( u \) \)$. That conjugation also fixes $u$, so $psi$ is conjugation by $k$ on the whole star. Undoing the adjustment gives the claimed element $g_u = b_u k$.
  We now synchronize the elements $g_u$. If $u \, v$ are adjacent, put $d_(u v) = g_u^(- 1) g_v$. The two star conjugations agree on every generator in the intersection of the stars, so $d_(u v)$ centralizes all those generators. In particular it centralizes $u$ and $v$. The centralizer formula and the intersection formula of Lemma 18 first put it in the special subgroup on the intersection of the star vertex sets. Flagness identifies the common neighbors with the vertices of the edge link, giving
  $ d_(u v) in W_("st"_X \( u \) ∩ "st"_X \( v \)) = chevron.l u \, v chevron.r times W \( "lk"_X \( { u \, v } \) \) . $
  It is central in this subgroup. The link factor has trivial center. If the edge link is empty this is immediate. Otherwise it is a flag PL sphere. A universal vertex in its graph would extend every simplex to that vertex by flagness, making the sphere a cone. There is no such vertex, and the center formula of Lemma 30 applies. Consequently
  #[#set math.equation(numbering: n => "(7.3)")
   $ d_(u v) in chevron.l u \, v chevron.r \, #h(2em) d_(u v) = u^(lambda_(u \, v)) v^(lambda_(v \, u)) \, quad lambda_(u \, v) \, lambda_(v \, u) in bb(F)_2 . $ <nor:edge-difference>]
  The subgroup $chevron.l u \, v chevron.r$ is elementary abelian, so $d_(v u) = d_(u v)^(- 1) = d_(u v)$; the two coefficients in (7.3) depend on the underlying edge and its indicated endpoint, not on its orientation.
  For a triangle with vertices $u \, v \, z$, the exact identity $d_(u v) d_(v z) d_(z u) = 1$ follows by cancellation of the $g$’s. In the abelianization of $W \( X \)$, its $u$-coordinate says
  $ lambda_(u \, v) = lambda_(u \, z) . $
  When $dim X gt.eq 2$, the link of every vertex is connected. Any two neighbors of $u$ can therefore be joined by a link edge path; each edge of that path gives such a triangle with $u$. The coefficient $lambda_(u \, v)$ is thus independent of the neighbor $v$.
  The remaining positive-dimensional case is a link circle. Enumerate its vertices cyclically as $u_0 \, dots.h \, u_(m - 1)$. Cancellation of the $g$’s gives
  $ d_(u_0 u_1) d_(u_1 u_2) dots.h.c d_(u_(m - 1) u_0) = 1 . $
  In its abelianization, the coordinate of $u_i$ occurs only in the two incident edge differences. Their coefficients are equal. This gives the same independence at each vertex of the circle.
  Write $lambda_u$ for the common coefficient at $u$, and replace $g_u$ by $g'_u = g_u u^(lambda_u)$. This still implements the star conjugation because $u$ centralizes its star. For every edge $u v$, Equation (7.3) gives
  $ \( g'_u \)^(- 1) g'_v = u^(lambda_u) d_(u v) v^(lambda_v) = 1 . $
  The graph of $X$ is connected, so all $g'_u$ are equal. This last step requires only a finite edge path between two vertices and therefore also holds for the infinite graph $hat(cal(L))$. The common element conjugates every generator as $phi$ does, proving that $phi$ is inner. ◻
]

#thm([Proposition 7.4.])[
  #emph[Every automorphism of $W$ is a composite of an inner automorphism and an automorphism induced by a simplicial automorphism of $hat(cal(L))$.]
] <nor:rigidity>

#proof[
  Lemma 31 gives the simplicial permutation and reduces the remaining automorphism to one that sends each generator to a conjugate of itself. Lemma 32, applied to $X = hat(cal(L))$, makes that remaining automorphism inner. Moving an inner automorphism past a generator permutation, if necessary, gives the stated order of the two factors. ◻
]

=== 7.2 The normalizer calculation <the-normalizer-calculation>

We now apply Proposition 33 in the normalizer calculation, using the full-preimage description of $cal(E)_2$.

#thm([Proposition 7.5.])[
  #emph[Inside $"Out" \( Pi \)$, 
#[#set math.equation(numbering: n => "(7.4)")
 $ N_("Out" \( Pi \)) \( sans(A) \) = sans(A) times chevron.l delta chevron.r . $ <nor:normalizer-equality>]

]
] <nor:normalizer>

#proof[
  Let $omega in N_("Out" \( Pi \)) \( sans(A) \)$ and choose a representative $F in "Aut" \( Pi \)$. View $cal(E)_2 subset.eq "Aut" \( Pi \)$ using Proposition 20. It is the full preimage of $sans(A)$, so conjugation by $F$ restricts to an automorphism
  $ Phi : cal(E)_2 arrow.r cal(E)_2 . $
  It preserves the inner copy of $Pi$. More precisely, $Phi \( c_gamma \) = c_(F \( gamma \))$ for $gamma in Pi$. Since $Pi$ is centerless, under its identification with $"Inn" \( Pi \)$ this says that $Phi \|_Pi = F$.
  The subgroup $W$ is characteristic in $cal(E)_2$. Indeed, every finite-order element projects trivially to the torsion-free group $H_2$, and so belongs to $W$. Conversely, $W$ is generated by its vertex involutions. It is therefore exactly the subgroup generated by all finite-order elements of $cal(E)_2$, a characteristic description. Proposition 33 applies to $Phi \|_W$. After composing $Phi$ with conjugation by an element of $W$, we may assume that this restriction is a simplicial permutation $sigma$ of $hat(cal(L))$. This adjustment preserves $Pi$ because $Pi$ is normal in $cal(E)$.
  The adjusted automorphism induces an automorphism $beta$ of $cal(E)_2 \/ Pi = sans(A)$. For a vertex $u$ above $s in cal(V)$, it satisfies
  #[#set math.equation(numbering: n => "(7.5)")
   $ beta \( a_s \) = a_(overline(sigma \( u \))) . $ <nor:fiber-labels>]
  The right side is therefore the same for all vertices over $s$. Because the labels $a_s$ are distinct, $sigma$ takes each fiber of the vertex projection into one fiber. Moreover, the target fibers for distinct $s$ are distinct by injectivity of $beta$. The finite set $cal(V)$ thus acquires a permutation $f$ with $overline(sigma \( u \)) = f \( overline(u) \)$; bijectivity of $sigma$ makes the maps of fibers onto. Every simplex of $cal(L)$ has a lift, whose image under $sigma$ projects to the simplex on the $f$-images of its vertices. Applying the same argument to $sigma^(- 1)$ shows that $f$ is a simplicial automorphism.
  Let $pi : sans(A)_0 arrow.r sans(A)$ be the label quotient, and let $f_(*)$ permute the coordinate basis of $sans(A)_0$. Equation (7.5) on each $e_s$ says $beta pi = pi f_(*)$. Taking kernels, and using the same identity for the inverses, gives $f_(*) \( sans(C) \) = sans(C)$. Lemma 10 excludes every nonidentity simplicial automorphism with this property. Hence $f = 1$.
  It follows that $sigma$ is a simplicial automorphism over the identity of $cal(L)$. To see explicitly that it is a deck transformation, choose one lifted vertex $u_0$. Regularity of $hat(S) arrow.r S$ supplies $h_0 in H$ with $h_0 u_0 = sigma \( u_0 \)$. Both $h_0^(- 1) sigma$ and $upright("id")_(hat(S))$ are lifts of the covering projection $hat(S) arrow.r S$, and they agree at $u_0$. Uniqueness of lifts on the connected domain makes them equal. Thus $sigma$ is the deck permutation given by $h_0$.
  Both $cal(E)_2$ and $Pi$ are normal in $cal(E)$. We may consequently compose further with conjugation by $\( 1 \, h_0^(- 1) \) in cal(E)$ and assume that $Phi$ fixes $W$ pointwise. For $h in H_2$, write $Phi \( 1 \, h \) = \( d \, h' \)$ with $d in W$ and $h' in H_2$. Applying $Phi$ to the conjugation action of $h$ on $W$ shows
  $ c_d compose h' = h quad upright("as automorphisms of ") W . $
  Inner automorphisms act trivially on $W_(upright("ab"))$, so $h'$ and $h$ induce the same permutation of its coordinate basis. The deck action on vertices is faithful, giving $h' = h$. The displayed identity then places $d$ in $Z \( W \)$. This center is trivial by Lemma 30: the vertex set is infinite because the infinite group $H$ acts freely on it, while local finiteness makes every vertex star finite, so there is no universal vertex. Hence $d = 1$. The adjusted $Phi$ fixes $H_2$ as well as $W$ and is the identity on $cal(E)_2$.
  Undoing the adjustments, the original $Phi$ is conjugation on $cal(E)_2$ by an element $e in cal(E)$. For $gamma in Pi$, its action on the inner copy of $Pi$ then gives $c_(F \( gamma \)) = c_(e gamma e^(- 1))$. Centerlessness of $Pi$ implies $F \( gamma \) = e gamma e^(- 1)$ for every $gamma$. Thus $omega$ is the class of $e$ and belongs to $cal(E) \/ Pi = sans(A) times chevron.l delta chevron.r$. The reverse inclusion in (7.4) holds because that direct product is abelian and contains $sans(A)$. ◻
]

#proof[
  The specialization of Proposition 14 to the chosen labels gives closed connected topological four-manifolds $M \, N$ with homotopy equivalences to $Q_2$. Since $Q_2$ is aspherical, both manifolds are aspherical. Their common fundamental group $Pi$ is word-hyperbolic by Proposition 27. It remains to exclude a homeomorphism between them.
  Use the realization subgroups $R_M \, R_N lt.eq "Out" \( Pi \)$ from Proposition 5, with the markings of these two models. The ambient group $"Out" \( Pi \)$ is finite by Proposition 29. The graph groups $sans(A)$ and $sans(B)_ell$ are $2$-subgroups of the same order. Proposition 21 gives
  $ sans(A) lt.eq R_M \, #h(2em) sans(B)_ell lt.eq R_N \, $
  and Proposition 22 gives $delta in.not R_M$. The element $delta$ is an involution and $sans(A) times chevron.l delta chevron.r$ is an internal direct product by Proposition 20; this is the normalizer of $sans(A)$ by Proposition 34. Finally, Proposition 23 gives the required nonconjugacy. All hypotheses of Proposition 5 hold with $X = M$, $Y = N$, and $sans(B) = sans(B)_ell$. That proposition proves that $M$ and $N$ are not homeomorphic. ◻
]

== 8 Marked chambers and the even cover <sec:chambers>

We now construct the data $\( D \, P \, S \, H \, w \)$ of Proposition 7 and verify its lifted-chamber hypotheses and double-cover filling. The boundary laws proved here, together with the tensor obstruction of Section 9, will prove its odd-cover nonfilling assertion in Section 10. The chamber construction follows [23] Section 2; its new ingredient is a four-tip grope with two red–blue pairs of tips. We first give its marked geometric model, since both the boundary relations and the double-cover filling depend on that model.

=== 8.1 Plumbing blocks and four-tip bodies <plumbing-blocks-and-four-tip-bodies>

Fix integers

$ m_R = m_B = 5 \, #h(2em) m = m_R + m_B \, #h(2em) p gt.eq 9 . $

Start with the plumbing construction of [22] Section 2.2, “The plumbing blocks”. Thus a four-dimensional one-handlebody has $2 m + p$ one-handles, and the first $2 m$ are canceled by two-handles with their product framings. Before plumbing, the resulting block $B$ is a one-handlebody on the $p$ remaining handles. Pair the canceling two-handles and mutually plumb each pair at a small product patch, interchanging base and fiber. The patches are disjoint, and there are no self-plumbings. Each end of a paired plumbing is called a #emph[port], indexed by its canceling two-handle. Give $m_R$ plumbing types the color red and the other $m_B$ the color blue. Both ports belonging to one plumbing type have the same color.

Locally the two plumbing branches are

#[#set math.equation(numbering: n => "(8.1)")
 $ \( D_R^2 times D_r^2 \) med union med \( D_r^2 times D_R^2 \) subset bb(R)^2 times bb(R)^2 \, #h(2em) 0 < r < R . $ <ch:plumbing-chart>]

Their overlap is the product ball $D_r^2 times D_r^2$. The coordinate core disks $D_R^2 times { 0 }$ and ${ 0 } times D_R^2$ meet once; separated parallel core sheets can intersect only when they belong to opposite branches. Rounding corners gives the smooth plumbing chart with its product framings.

The resulting compact smooth oriented four-manifold is denoted by $X$. Its regular cover associated to the quotient onto the plumbing group $F_m$ consists of copies of $B$ indexed by the Cayley tree of $F_m$, joined at product balls. The contractible overlaps are cofibrations, so the homotopy type is obtained by joining the block graphs along this tree. Passing to the quotient gives

#[#set math.equation(numbering: n => "(8.2)")
 $ pi_1 X = F \( tau_1 \, dots.h \, tau_m \, l_1 \, dots.h \, l_p \) \, #h(2em) X tilde.eq or.big^(m + p) S^1 . $ <ch:plumbing-group>]

Here $tau_r$ crosses the join of plumbing type $r$, and the $l_s$ are the extra handle generators. This description also fixes the markings in finite covers: paths through the joins are based using fixed paths inside the blocks.

The exposed boundary piece of the block at a plumbing vertex $v$ is

#[#set math.equation(numbering: n => "(8.3)")
 $ K_v tilde.equiv #scale(x: 120%, y: 120%)[\(] \#^p \( S^1 times S^2 \) #scale(x: 120%, y: 120%)[\)] \\ "int" nu \( L_(2 m) \) \, $ <ch:outside-piece>]

where $L_(2 m)$ is an unlink in a ball. Write $x_i = kappa_i m_i kappa_i^(- 1)$, where $m_i$ is the oriented meridian at the $i$th port and $kappa_i$ is its standard whisker from a fixed outside basepoint. The $x_i$ and the extra loops $l_1 \, dots.h \, l_p$ freely generate $pi_1 K_v$. Each $x_i$ dies in $B$. At a join torus the plumbing interchanges meridian and longitude, and each longitude bounds in its own outside piece. We suppress product collars in this description.

Our grope body consists of a bottom punctured torus $F$, with upper punctured tori $U_a \, U_b$ attached to the respective members $a \, b$ of its symplectic basis. The two basis curves of the first upper torus are tips $1 \, 2$, and those of the second are tips $3 \, 4$. The ordered colors of the tips are

$ \( R \, B \) \, quad \( R \, B \) . $

A cap at a tip will be a product parallel of the core belonging to its assigned port. Figure 1 records the incidence and color data; it does not depict an embedding.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$F$]])
  content((-1.76, 1.188), [#text(size: 9pt)[$U_a$]])
  content((1.76, 1.188), [#text(size: 9pt)[$U_b$]])
  content((-2.64, 2.332), [#text(size: 9pt)[$1:R$]])
  content((-0.88, 2.332), [#text(size: 9pt)[$2:B$]])
  content((0.88, 2.332), [#text(size: 9pt)[$3:R$]])
  content((2.64, 2.332), [#text(size: 9pt)[$4:B$]])
  line((-0.2516, 0.1699), (-1.453, 0.9806), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.88, 0.594), [#text(size: 9pt)[$a$]], anchor: "east", padding: 0.1176cm)
  line((0.2516, 0.1699), (1.453, 0.9806), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.88, 0.594), [#text(size: 9pt)[$b$]], anchor: "west", padding: 0.1176cm)
  line((-1.958, 1.445), (-2.461, 2.099), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.461, 2.099), (-1.958, 1.445), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.562, 1.445), (-1.059, 2.099), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.4696, 2.154), (1.453, 1.321), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.562, 1.445), (1.059, 2.099), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.059, 2.099), (1.562, 1.445), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.958, 1.445), (2.461, 2.099), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, -0.264), (0, -0.704), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.968), [#text(size: 9pt)[initial boundary]])
})],
  caption: [Figure 1: The four-tip body. At a vertex where red ports are selected, each upper torus can be compressed using its red cap; at the other vertex of the double cover, both compressions use blue caps. ],
) <ch:grope-figure>

Put $cal(C) = { 1 \, l_1 \, dots.h \, l_p }$. Install one body for every ordered quadruple $\( i_1 \, i_2 \, i_3 \, i_4 \)$ of distinct ports with colors $\( R \, B \, R \, B \)$, every independent choice $c_alpha in cal(C)$, and every independent sign $epsilon_alpha in { 1 \, - 1 }$. Its based tips must represent

#[#set math.equation(numbering: n => "(8.4)")
 $ X_alpha = c_alpha x_(i_alpha)^(epsilon_alpha) c_alpha^(- 1) \, #h(2em) 1 lt.eq alpha lt.eq 4 \, $ <ch:tip-markings>]

in the outside piece. There are finitely many bodies; denote their number by $k$, and use the same list in every translate of a block.

#thm([Lemma 8.1.])[
  (The four-tip marked body).  #emph[The four-tip body has a three-dimensional handlebody thickening that, with its four marked tip annuli, is a boundary connected sum of four solid tori with longitudinal marked annuli. The finite list above can be placed with disjoint bodies and the markings (8.4) in the outside pieces of the plumbing. The bottom surfaces are proper inward pushes of disjoint boundary surfaces of $X$. Each terminal cap is embedded and framed; it misses all body sheets away from its own attachment. The only possible cap–cap intersections occur between opposite ports of a plumbing.]
] <ch:four-tip-model>

#proof[
  We extend the marked three-tip model of [22] Lemma 2.3. Thicken a punctured torus to its product with an interval and put its two basis annuli on opposite faces. Two disjoint cutting arcs, each dual to one basis curve and disjoint from the other, give disjoint meridian disks in the product. To see these arcs explicitly, puncture the square torus near $\( 1 \/ 2 \, 1 \/ 2 \)$, take the basis circles at $x = 1 \/ 4$ and $y = 1 \/ 4$, and cut along the arcs at $y = 1 \/ 2$ and $x = 1 \/ 2$. The puncture removes their only mutual intersection. Each product disk meets its own marked annulus in one essential arc and misses the other.
  Cutting the thickening along these disks gives a ball. Each marked annulus becomes a rectangle joining the two faces of its own cutting disk. The rectangle and those two disk faces have a disk neighbourhood in the boundary sphere, disjoint from the analogous neighbourhood for the other annulus. A boundary homeomorphism, extended over the ball, identifies this marked configuration with the standard one. After reattaching the handles, the lower thickening is therefore a boundary connected sum of two longitudinal-annulus collars. This is a statement about the annuli themselves, not just their elements of the free group.
  Attach an upper punctured-torus thickening along each of these two annuli. A longitudinal-annulus collar is a solid torus viewed as an annulus times an interval; gluing it on merely collars the attaching annulus of its upper thickening. The single boundary-sum tube of the lower model now joins the two upper thickenings. Extend the two meridian disks from each upper thickening through its own collar. The feet of the joining tube can be chosen arbitrarily small in the complement of the attaching annuli and moved away from the finitely many extending disk strips. The four extended disks are thus disjoint and dual to the four tip annuli. Cutting along them and repeating the preceding ball argument proves the asserted four-tip marked model. There is only one joining tube between the upper handlebodies, so no additional free generator is introduced. The initial boundary and all the surface markings are transported with this identification.
  For placement we use the refinement of [23] Section 2.2, “The exterior with its side marking”: place the bodies in the complement of sufficiently thin attaching solid tori in the initial one-handlebody boundary, and lengthen only the returning tip collars to the attaching regions. The connectors and their basing paths then lie in $K_v$ after plumbing. Reserve separated product parallels of the attaching curves, one for each occurrence of a tip, and join their thin longitudinal collars by tubes along a rooted tree. Let $eta$ run from the outside basepoint to its root and let $p_alpha$ be the tree path from that root to the $alpha$th tip collar. Choose these paths so that $eta p_alpha$ is homotopic relative to its endpoints to $c_alpha kappa_(i_alpha)$, using the product tracks to identify the parallel meridians. Then
  $ \( eta p_alpha \) m_(i_alpha)^(epsilon_alpha) \( eta p_alpha \)^(- 1) = c_alpha x_(i_alpha)^(epsilon_alpha) c_alpha^(- 1) quad upright("in ") pi_1 K_v . $
  There is no compatibility restriction among the four chosen classes: finitely many arcs in a three-manifold can realize them disjointly away from their common root, with parallel tracks for repeated portions and with the reserved returning strips avoided. The tree paths fix the required basing; other paths inside the resulting handlebody add only words in its four tip generators. The initial boundaries remain in the outside pieces, and the bottom surfaces are proper pushes of disjoint boundary surfaces of $X$.
  We finally specify the framings. The surface-product model frames a surface by its oriented normal in the three-dimensional body and the collar direction. At a terminal annulus use the framing adjustment in the proof of [22] Lemma 2.3, before fixing the returning collar. In a separated solid-torus neighbourhood this is the ribbon twist
  $ \( theta \, z \) mapsto \( theta \, e^(i n theta) z \) . $
  Replace $e^(i n theta)$, if necessary, by a smooth degree-$n$ circle map $phi.alt \( theta \)$ equal to $1$ near the connector feet. The twist is then the identity at those feet and extends by the identity over the joining tubes. Apply it to the complete marked body, including the initial boundary and the lower and upper attaching annuli.
  The returning collar is constructed after this transport. In coordinates $S_theta^1 times D_z^2 times \[ 0 \, 1 \]_u$, choose an embedded smooth regular plane arc $\( r \( s \) \, u \( s \) \)$ from $\( 0 \, 0 \)$ to $\( 0 \, 1 \)$, departing in the positive $r$ direction and vertical near its endpoint, with $u$ strictly increasing for $s > 0$. The collar
  $ \( theta \, s \) mapsto \( theta \, r \( s \) i phi.alt \( theta \) \, u \( s \) \) $
  leaves the transported surface ribbon in its outgoing normal direction and ends at the same product circle $z = 0 \, u = 1$. Its normal quotient has frame
  $ v = phi.alt \( theta \) \, #h(2em) w = r' \( s \) partial_u - u' \( s \) i phi.alt \( theta \) . $
  At the first end this is the surface-transverse and collar frame; at the last, up to a fixed constant change of frame, it has winding $n$ relative to the core product frame. Choose $n$ to match those framings. The four disjoint longitudinal neighbourhoods make the adjustments independent and leave the external basing paths fixed. The initial-boundary link and its surface framing are fixed after these transports. At each of the three symplectic pairs, the attachments depart on opposite normal sides. Put the bodies at an inner collar level and extend the tips into separated product parallels of the handle cores. The collar separation and the plumbing charts give the final assertions. ◻
]

We use the group commutator convention $\[ x \, y \] = x y x^(- 1) y^(- 1)$.

#thm([Lemma 8.2.])[
  (The boundary laws).  #emph[For each installed body, its initial boundary represents, up to overall conjugation, a word $L$ in the four based tips satisfying 
#[#set math.equation(numbering: n => "(8.5)")
 $ L \|_(X_alpha = 1) = 1 quad \( 1 lt.eq alpha lt.eq 4 \) \, #h(2em) L equiv \[ \[ X_1 \, X_2 \] \, \[ X_3 \, X_4 \] \] med \( mod med Gamma_5 F \( X_1 \, X_2 \, X_3 \, X_4 \) \) . $ <ch:law-properties>]

 Here $Gamma_r$ is the lower central series, and orientations are chosen for the displayed sign.]
] <ch:laws>

#proof[
  The boundary of a punctured torus is the commutator of its based symplectic generators. Apply this first to the two upper tori and then to the bottom torus. Internal paths may conjugate a tip or an upper commutator by words in the four tips. Such conjugations change the weight-four expression only in weight at least five. If any one tip is set equal to the identity, the commutator at its upper torus becomes trivial, and then so does the bottom commutator. These are word identities in the abstract tips; substituting the markings (8.4) gives the corresponding initial-boundary words in $pi_1 K_v$. ◻
]

=== 8.2 The exterior and its homotopy type <the-exterior-and-its-homotopy-type>

Write $F_1 \, dots.h \, F_k$ for the bottom punctured tori, and $a_j \, b_j$ for their two branch curves. Both branch curves are null-homotopic in $X$: an upper punctured torus and its terminal caps give a null-homotopy. Since $F_j$ retracts to its two branch curves and $X$ has graph homotopy type, the entire map $F_j arrow.r X$ is null-homotopic.

Remove the interiors of disjoint product tubes of the $F_j$, including their proper boundary collars, and put

$ E = X \\ union.big_(j = 1)^k "int" nu \( F_j \) . $

The tubes can be chosen to avoid the upper caps and meet the upper surfaces only along short attaching collars. The exterior is connected, since paths can be moved off the proper codimension-two surfaces and then off sufficiently thin tubes.

The surface-product trivializations specify the following input from [23] Lemma 2.2.

#thm([Lemma 8.3.])[
  (The marked exterior model).  #emph[There is a homotopy-pushout model 
#[#set math.equation(numbering: n => "(8.6)")
 $ E tilde.eq X union_(product.co_j F_j) product.co_j \( F_j times S^1 \) \, $ <ch:exterior-pushout>]

 where $F_j$ maps to $F_j times S^1$ by its inward section. Under this model the displayed maps from $F_j times S^1$ are the actual tube-side maps, and $S^1$ is the normal circle.]
] <ch:exterior-model>

The marking of the side maps is essential here. The hypotheses of the cited lemma hold because Lemma 35 places the $F_j$ as proper pushes of disjoint boundary surfaces with their surface-product trivializations. The model can be seen in a boundary collar: the outer part of the exterior contributes a bridge across the deleted surface, while its inward normal semicircle supplies a specified return path in the inner $X$ piece. The bridge followed by that return is exactly the tube’s normal circle. This identifies the section and side maps in (8.6), as required for the following gluing.

For each $j$, regard a solid torus $V_j$ as a compression body from $F_j$ to a disk, compressing $a_j$. Define

#[#set math.equation(numbering: n => "(8.7)")
 $ D = E union_(product.co_j \( F_j times S^1 \)) product.co_j \( V_j times S^1 \) \, #h(2em) S = partial D \, $ <ch:chamber-definition>]

using the product framings and rounding corners. The remaining disk face of $V_j$ contributes a solid torus to $S$. Hence $S$ is the surface-framed surgery of $partial X$ along the initial-boundary link. In particular, $S$ is connected.

#thm([Proposition 8.4.])[
  (The chamber homotopy type).  #emph[With the markings induced by the preceding construction, 
#[#set math.equation(numbering: n => "(8.8)")
 $ H := pi_1 D = pi_1 X * F \( z_1 \, dots.h \, z_k \) \, #h(2em) D tilde.eq B H or or.big^(2 k) S^2 \, $ <ch:group-and-spheres>]

 where $B H$ is a finite graph and $z_j$ is the normal-circle generator of the $j$th replacement. On the common surgery-link exterior in the boundary, killing the $z_j$ recovers the original marking into $pi_1 X$.]
] <ch:homotopy-type>

#proof[
  The side-marked model of Lemma 37 gives
  $ D tilde.eq X union_(product.co_j F_j) product.co_j \( V_j times S^1 \) . $
  Because each attaching map $F_j arrow.r X$ is null-homotopic, the additional based summand is the homotopy cofiber of $F_j arrow.r V_j times S^1$. Retract $V_j times S^1$ to the torus on its longitude $b_j$ and normal circle $z_j$. Since $F_j$ retracts to $a_j or b_j$, its cone adds one two-cell on the trivial loop $a_j$ and another killing $b_j$. Cancel the latter one/two-cell pair. The old torus two-cell, originally attached by $\[ b_j \, z_j \]$, now has trivial attaching map. The cofiber is therefore
  $ S_(z_j)^1 or S^2 or S^2 . $
  This proves (8.8). The model retains the normal-circle marking, so its quotient killing the new generators is the old $X$-marking. Equivalently, the classifying map to the graph of $X$ extends over each replacement, since both $a_j$ and $b_j$ map trivially and the new normal circle is sent to the identity. Its restriction to the common boundary exterior is the original classifying map. ◻
]

=== 8.3 The middle form and the Poincaré chamber <the-middle-form-and-the-poincaré-chamber>

We next identify the entire middle homotopy module by framed hyperbolic pairs. This serves two purposes: it produces the graph-type Poincaré pair required for reflection, and it makes the double-cover filling an explicit geometric operation. All intersection pairings below use fixed whiskers and the involution $h mapsto h^(- 1)$ on the group ring.

Compress either upper punctured torus along either one of its terminal caps. Cutting the torus along that basis curve gives a pair of pants, whose two new boundary curves are filled by opposite parallel copies of the selected cap. The result is an embedded framed disk along the corresponding bottom branch, subject only to intersections with other selected cap sheets. The unused cap does not belong to this disk. The outgoing collar and its framing are the local compression model of [22] Lemma 2.4. At the bottom torus the two upper attachments use distinct normal angles, so this construction applies simultaneously on the $a_j$- and $b_j$-branches.

#thm([Lemma 8.5.])[
  (Algebraic duals).  #emph[There are proper framed immersed disks $f_j$ in $E$, bounded by the truncated $a_j$-branch curves, and framed spheres $g_j$ in $E$ such that 
#[#set math.equation(numbering: n => "(8.9)")
 $ lambda \( f_i \, g_j \) = delta_(i j) \, #h(2em) lambda \( g_i \, g_j \) = 0 quad upright("over ") bb(Z) \[ pi_1 E \] . $ <ch:dual-pairings>]

 Each $g_j$ is embedded with trivial normal bundle. If all terminal caps selected for the branch compressions are mutually disjoint, these representatives have exactly one geometric intersection between $f_j$ and $g_j$ and no other intersections.]
] <ch:exterior-duals>

#proof[
  Choose one terminal cap on each upper torus. Let $f_j$ be the proper truncation of the compression disk on the $a_j$-branch, and let $C_j$ be the compression disk on the $b_j$-branch. Near the tube side over $b_j$, take the normal-circle torus and compress it with two parallels of $C_j$. Denote the resulting sphere by $g_j$.
  Here is the local collar calculation, from [22] Lemma 2.4, that also checks its applicability to the new $a_j$-branch. Use coordinates $\( s \, t \, r \, theta \)$, where $s$ runs along $b_j$, $t$ is transverse to $b_j$ in $F_j$, and $\( r \, theta \)$ are polar coordinates normal to $F_j$. The rim torus is $t = 0$, $r = rho$. The outgoing $a_j$-disk collar and the $b_j$-upper attachment have distinct angles $theta_A \, theta_B$. Cut the rim torus at a narrow band around $theta_B$ and keep the annulus containing $theta_A$. Place the interiors of its two compression disks outside $r = rho$. The retained annulus meets the $a_j$-disk collar once. Orient and base this point to contribute $1$. This calculation only uses the outgoing framed collar of that disk, so it remains valid when the disk itself is obtained by upper-torus compression. The disjoint body neighbourhoods exclude collar intersections between different indices.
  Every remaining intersection occurs in a cap–cap plumbing chart. Within $g_j$, label the two copies of $C_j$ by $epsilon.alt in { + 1 \, - 1 }$ and the two cap sheets in a fixed copy by $eta in { + 1 \, - 1 }$. Their orientation coefficients are $epsilon.alt eta$. Fix $epsilon.alt$ and an opposing sheet. The whisker on the opposing sheet is held fixed in this comparison. The two paths on $g_j$ share the whole stem from the rim to the fixed copy of $C_j$ and split only inside its upper torus. Their difference there is the other basis loop, which bounds the unused terminal cap in $E$: no upper cap was removed with the bottom tubes. A small normal turn around the upper surface also bounds in $E$, because that surface has not been deleted. The two intersection labels are consequently the same element $h in pi_1 E$, and their contributions cancel as
  $ epsilon.alt eta h + epsilon.alt \( - eta \) h = 0 . $
  Figure 2 displays the two cancellations. The outer index $epsilon.alt$ is fixed throughout this cancellation; we make no identification of paths that differ by a bottom normal circle. The opposing sheet may come either from another rim sphere or from the compressed $a$-branch. This proves (8.9).
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.2), [#text(size: 9pt)[$eta =+1$]])
  content((7.2, 2.2), [#text(size: 9pt)[$eta =-1$]])
  content((-1.1, 1.3), [#text(size: 9pt)[$epsilon =+1$]], anchor: "east", padding: 0.1176cm)
  content((-1.1, 0), [#text(size: 9pt)[$epsilon =-1$]], anchor: "east", padding: 0.1176cm)
  content((0, 1.3), [#box(width: 1.6cm, height: 0.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$+h_+$]]])])
  content((7.2, 1.3), [#box(width: 1.6cm, height: 0.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$-h_+$]]])])
  content((0, 0), [#box(width: 1.6cm, height: 0.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$-h_-$]]])])
  content((7.2, 0), [#box(width: 1.6cm, height: 0.8cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$+h_-$]]])])
  line((0.8, 1.3), (6.4, 1.3), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((3.6, 1.3), [#text(size: 9pt)[unused upper tip loop $=1$]], anchor: "south", padding: 0.1176cm)
  line((0.8, 0), (6.4, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((3.6, 0), [#text(size: 9pt)[unused upper tip loop $=1$]], anchor: "south", padding: 0.1176cm)
})],
    caption: [Figure 2: The four cap-sheet contributions in $g_j$, for one fixed opposing sheet and up to its common intersection sign. Rows index the outer parallel copies of $C_j$ by $epsilon.alt$; columns index the inner cap parallels by $eta$. The unused cap identifies the two group labels within each row, so that row cancels. No comparison between $h_(+)$ and $h_(-)$ is made: the paths for different rows can differ by a bottom normal circle. This is a diagram of contributions, not a projection of embedded surfaces, following the sheet calculation in [22] Lemma 2.4. ],
  ) <ch:sheet-cancellation>
  A rim sphere uses only parallel copies of a single selected terminal cap. That core has no self-plumbing. The separated collars therefore make each sphere embedded, and the product compression framings give its trivial normal bundle. If the selected caps are all disjoint, there are no plumbing intersections at all; the single collar intersection in each pair is then the complete geometric intersection set. ◻
]

Close $f_j$ by the meridian disk of $V_j$ at its fixed normal-circle coordinate, obtaining a sphere $u_j subset D$. The framings agree: on the $f_j$ side the frame is transverse to $a_j$ inside $F_j$ together with the circle direction, while on the meridian-disk side it extends as the solid-torus transverse direction and the product-circle direction. Thus $u_j$ is framed. Lemma 39 gives

#[#set math.equation(numbering: n => "(8.10)")
 $ lambda \( u_i \, g_j \) = delta_(i j) \, #h(2em) lambda \( g_i \, g_j \) = 0 quad upright("over ") Lambda := bb(Z) H . $ <ch:middle-pairings>]

#thm([Proposition 8.6.])[
  (The Poincaré chamber).  #emph[The manifold $D$ has a specified framed immersed hyperbolic basis for its full module $pi_2 D$, with vanishing quadratic self-intersections. Attach one three-cell on each of these $2 k$ basis spheres, and call the resulting space $P$. Then $\( P \, S \)$ is an oriented finite four-dimensional Poincaré pair, the inclusion $\( D \, S \) arrow.r \( P \, S \)$ preserves the fundamental group and the boundary, and $P tilde.eq B H$.]
] <ch:poincare-chamber>

#proof[
  We give the middle-form verification used in [23] Section 2.3, “The middle form and the Poincaré pair”. The hermitian matrix of the $u_i$ has even identity coefficient on its diagonal, since their normal framings give zero Stiefel–Whitney evaluations. The free group $H$ has no nonidentity element of order two. Hence each diagonal entry can be written $z + overline(z)$: choose one coefficient from each nonidentity inverse pair and halve the even identity coefficient. Subtracting suitable $Lambda$-linear combinations of the $g_j$ from the $u_i$, using a triangular half off the diagonal and these halves on the diagonal, makes all pairings among the modified $u_i$ vanish. The cross-pairings and the $g_i \, g_j$ pairings in (8.10) are unchanged.
  Represent these classes by immersed spheres using the usual tubing operations. Their even normal parity permits framed representatives. Write $mu$ for the full framed Wall invariant in the additive quotient
  $ Lambda \/ chevron.l h - h^(- 1) : h in H chevron.r_(bb(Z)) \; $
  in particular, its identity coefficient is retained. For a framed representative, the symmetrization identity
  $ lambda \( v \, v \) = mu \( v \) + overline(mu \( v \)) $
  and the absence of order-two elements show that its Wall quadratic self-intersection is zero when its self-pairing vanishes. This is the framed immersed-sphere calculation in the cited section; no embedded-surgery theorem is used. Write $A_j \, B_j$ for the resulting hyperbolic pairs.
  They form a basis of the whole module. By Proposition 38, $pi_2 D$ is free of rank $2 k$ over $Lambda$. Relative to any such basis, the square matrix with columns $A_j \, B_j$ has a left inverse supplied by its nonsingular hyperbolic pairing. Matrix rings over $bb(Z) H$ are directly finite: pass a one-sided inverse identity to every finite quotient of $H$, use the finite dimensional regular representation over $bb(C)$ to obtain the reverse identity, and then use residual finiteness to separate the finite support of any nonzero group-ring entry. The matrix therefore has a two-sided inverse.
  A map from $B H or or.big^(2 k) S^2$ to $D$ realizing this basis is a homotopy equivalence: it induces the marked isomorphism on $pi_1$ and an isomorphism on the homology of the simply connected covers. Attaching the indicated three-cells cancels the sphere summands in that homotopy type. Thus $P tilde.eq B H$.
  For completeness, the duality argument of [23] Section 2.3 applies to exactly this basis. The middle sphere module of $D$ maps isomorphically to a split summand of $H_2 \( D \, S \; Lambda \)$ by its nonsingular intersection form. The three-cell attachments quotient the absolute and relative middle homology by these summands; their attaching map is injective on the summands, so no new third homology appears. In cohomology the pullbacks identify the new groups with the annihilators of the sphere summands. If $i : \( D \, S \) arrow.r \( P \, S \)$ is the inclusion and $\[ P \, S \] = i_(*) \[ D \, S \]$, cap-product naturality gives
  $ alpha frown \[ P \, S \] = i_(*) #scale(x: 120%, y: 120%)[\(] i^(*) alpha frown \[ D \, S \] #scale(x: 120%, y: 120%)[\)] . $
  The duality isomorphisms for $\( D \, S \)$ consequently induce duality on these annihilators and quotients. The finite free chain complexes over $Lambda$ give the regular-coefficient criterion for Poincaré duality with all local coefficients. This proves the assertion for $\( P \, S \)$, with its original boundary collar and orientation. ◻
]

#thm([Corollary 8.7.])[
  (Connected lifted boundary).  #emph[The boundary marking $pi_1 S arrow.r H$ is surjective.]
] <ch:boundary-surjectivity>

#proof[
  Duality for $\( P \, S \)$ and the graph homotopy type of $P$ give
  $ H_1 \( P \, S \; bb(Z) H \) = H_0 \( P \, S \; bb(Z) H \) = 0 . $
  Therefore $H_0 \( S \; bb(Z) H \) arrow.r H_0 \( P \; bb(Z) H \)$ is an isomorphism. The source is free abelian on the cosets of the image of $pi_1 S$, whereas the target is $bb(Z)$. There is only one coset. ◻
]

=== 8.4 Cyclic covers and marked fillings <ch:cyclic-covers>

Define the epimorphism

#[#set math.equation(numbering: n => "(8.11)")
 $ w : H arrow.r bb(Z) \, #h(2em) w \( tau_r \) = 1 \, quad w \( l_s \) = w \( z_j \) = 0 . $ <ch:cover-character>]

For $d gt.eq 1$, let

$ H_d = ker \( H arrow.r^w bb(Z) arrow.r bb(Z) \/ d \) \, $

and denote the associated connected covers by $D_d \, P_d \, S_d$. We also write $X_d$ for the plumbing cover obtained by restricting $w$ to $pi_1 X$. The plumbing graph of $X_d$ has vertices $bb(Z) \/ d$, an edge of each type $r$ from $v$ to $v + 1$, and $p$ extra loops at every vertex. Its bodies are copies of the full marked list at each vertex.

#thm([Lemma 8.8.])[
  (Persistence of the chamber data).  #emph[For every $d$, the data $\( D_d \, P_d \, S_d \, H_d \)$ satisfy Propositions 38 and 40 with all the bodies and basis spheres lifted. In particular, $S_d$ is connected, $H_d$ is free, $P_d tilde.eq B H_d$, and $\( P_d \, S_d \)$ is the oriented Poincaré pair obtained by attaching three-cells to a specified framed immersed hyperbolic basis of $D_d$.]
] <ch:cover-data>

#proof[
  Corollary 41 gives connectedness of $S_d$. The side-marked exterior model identifies the covering character on $pi_1 E$ with the one inherited from $X$, with each normal circle sent to zero. Its restriction to $pi_1 \( V_j times S^1 \)$ is trivial: the longitude maps trivially in $H$ and $w \( z_j \) = 0$. Thus the cover of each replacement is trivial, and performing the chamber construction on every lifted body in $X_d$ gives $D_d$. The cofiber calculation is unchanged.
  Each basis sphere has $d$ lifts. Algebraically, the universal cover is the same and its free middle module is restricted from $bb(Z) H$ to $bb(Z) H_d$. Pairings of two chosen lifts are obtained by taking, in the pairing of their corresponding coset translates, the coefficients supported in $H_d$. The lifted hyperbolic pairings are therefore standard. The Wall invariant of a chosen lift is obtained, after the corresponding change of whisker, by retaining precisely the self-intersection labels in $H_d$. Because $H_d$ is closed under inversion, this additive coefficient projection retains the identity and both members of every retained inverse pair. It therefore descends to the framed Wall quotient and carries the zero downstairs invariant to zero. The lifted sphere classes are a basis of the restricted module. The three-cell attachments and the orientation lift, giving the asserted pair. ◻
]

#prodef([Definition 8.9.])[
  (Marked filling).  A marked filling of $S_d$ is a compact oriented topological four-manifold $D'_d$, an orientation-preserving identification $partial D'_d = S_d$, and a homotopy equivalence $D'_d arrow.r B H_d$ whose boundary restriction is homotopic to the marking $S_d arrow.r P_d tilde.eq B H_d$.
] <ch:marked-filling>

Such a filling also admits a homotopy equivalence

#[#set math.equation(numbering: n => "(8.12)")
 $ \( D'_d \, S_d \) arrow.r \( P_d \, S_d \) $ <ch:relative-filling-map>]

that is the identity on $S_d$. Indeed, compose its marking with a homotopy inverse $B H_d arrow.r P_d$. The boundary restriction is homotopic to the prescribed inclusion; the homotopy extension property of a boundary collar changes the map to one equal to that inclusion, without changing its homotopy-equivalence class.

#thm([Proposition 8.10.])[
  (The double-cover filling).  #emph[The boundary $S_2$ has a marked filling $D'_2$. It can be obtained from $D_2$ by replacing disjoint punctured $S^2 times S^2$ neighbourhoods by four-balls. In particular, there is a homotopy equivalence $\( D'_2 \, S_2 \) arrow.r \( P_2 \, S_2 \)$ equal to the identity on the boundary.]
] <ch:even-filling>

#proof[
  At vertex $0$ of the plumbing double cover select all red ports, and at vertex $1$ select all blue ports. Every plumbing edge joins these two vertices and has the same color at both ends. Exactly one end is selected. Consequently all product cap parallels belonging to selected ports are mutually disjoint. This also accounts for the two different lifts of each original plumbing type: each has one selected end, independently of its orientation in the two-vertex graph.
  Each upper torus of each body has one red and one blue tip. Compress it using the cap selected at its vertex. Use these choices on both upper branches to construct $u_j \, g_j$ in $D_2$, with $j$ now ranging over the lifted bodies. Lemma 39 and the matching meridian-disk framings show that these are embedded framed pairs with a single transverse intersection inside each pair and no intersections between different pairs. Their hyperbolic pairing and the known free rank show, by the same direct-finiteness argument as in Proposition 40, that their classes form a basis of $pi_2 D_2$.
  A regular neighbourhood $N_j$ of one such pair is the normal plumbing of two trivial disk bundles over $S^2$ at one point. This is the standard punctured $S^2 times S^2$: take tubular neighbourhoods of the two factor spheres in $S^2 times S^2$, whose rounded complement is a ball. Reversing one sphere orientation if necessary matches the intersection sign. Thus $partial N_j tilde.equiv S^3$. Choose these neighbourhoods disjointly in the interior of $D_2$, and set
  $ A = overline(D_2 \\ union.big_j N_j) \, #h(2em) D'_2 = A union_(product.co_j partial N_j) product.co_j B^4 . $
  The complement $A$ is connected: any segment of a path through $N_j$ can be replaced by a path along its connected boundary. Since $N_j$, $partial N_j$, and $B^4$ are simply connected, van Kampen gives the same marked fundamental group $H_2$ for $A$, $D_2$, and $D'_2$.
  We verify contractibility of the universal cover of $D'_2$. Write $tilde(A)$ for the common lifted complement. The universal cover of $D_2$ is obtained by adjoining all lifts of the $N_j$, whereas the universal cover of $D'_2$ is obtained by adjoining balls at the same boundary spheres. These are locally finite families, and their homology contributions are direct sums. In degree two, Mayer–Vietoris gives
  $ H_2 \( tilde(A) \; bb(Z) \) xor xor.big_(tilde(N)_j) H_2 \( tilde(N)_j \; bb(Z) \) med tilde.equiv med H_2 \( tilde(D)_2 \; bb(Z) \) . $
  The second summand maps isomorphically onto the right-hand side because the lifted sphere pairs are a free middle basis. Hence $H_2 \( tilde(A) \; bb(Z) \) = 0$. Since $tilde(D)_2$ has the homotopy type of a wedge of two-spheres, the same exact sequence in the adjacent degrees gives
  $ H_4 \( tilde(A) \; bb(Z) \) = 0 \, #h(2em) xor.big_(tilde(N)_j) H_3 \( partial tilde(N)_j \; bb(Z) \) arrow.r^(med tilde.equiv med) H_3 \( tilde(A) \; bb(Z) \) . $
  Adjoining the balls kills exactly these third-homology classes and produces no fourth homology. It leaves the zero second homology unchanged. The resulting cover is simply connected, and its reduced homology vanishes in every degree. Manifolds have CW homotopy type, so the homological Whitehead theorem makes this cover contractible. Therefore $D'_2 tilde.eq B H_2$.
  All modifications were interior, and the fundamental-group identifications above agree on $S_2$. A classifying map $D'_2 arrow.r B H_2$ consequently has the prescribed boundary marking, since maps to $B H_2$ are determined up to homotopy by that group marking. This is the required marked filling, and (8.12) gives the relative homotopy equivalence to $P_2$. ◻
]

The remaining task for the chamber is the converse parity phenomenon: for every odd $d gt.eq 3$, no marked filling of $S_d$ exists. Its proof uses all the boundary laws from Lemma 36; the color choice used above explains why the corresponding obstruction must distinguish odd cycles from the two-vertex cover.

== 9 A tensor obstruction on a graph <sec:tensors>

The obstruction needed here is governed by the plumbing graph associated to a hypothetical marked filling. We prove that formal data on the corresponding cut pieces force an assignment of every edge to one endpoint such that, at each vertex, no prescribed set of incident edges is assigned entirely to that vertex. On the colored odd cycle used in the construction, no such assignment exists. The truncated differential forms and the two successive homologies in the proof come from the finite tensor obstruction of [22] Section 3. We give the algebraic argument in full, including the passage from two vertices to an arbitrary graph.

=== 9.1 The incidence theorem <the-incidence-theorem>

Let $Gamma = \( V \, E \)$ be a finite multigraph without loops. Distinguish its two endpoints as $v_(+) \( e \)$ and $v_(-) \( e \)$ for every $e in E$. Write $E_(+) \( v \)$, $E_(-) \( v \)$, and $E \( v \)$ for the edges having plus endpoint $v$, minus endpoint $v$, and either endpoint $v$, respectively. An endpoint assignment is a function $a : E arrow.r V$ with $a \( e \) in { v_(+) \( e \) \, v_(-) \( e \) }$.

For a field $K$, denote by $K chevron.l h chevron.r$ the ring of algebraic power series, viewed as the henselization of $K \[ h \]_(\( h \))$ inside $K \[ \[ h \] \]$. Thus its elements have finite pointed $acute(e)$tale presentations. All derivatives below act on internal coordinates; the parameters $t_e$ are held fixed. Empty products are equal to one, and a coordinate block is allowed to have dimension zero.

#thm([Theorem 9.1.])[
  (Endpoint assignment).  #emph[Let $K$ have characteristic zero, and let $Gamma$ be a finite loopless multigraph with distinguished endpoints as above. For each edge $e$, choose a coordinate block $h_e$ of dimension $N_e gt.eq 0$ and functions $F_e \, b_e in K chevron.l h_e chevron.r$. For each vertex $v$, choose a family $cal(L)_v$ of nonempty subsets of $E \( v \)$, and set 
#[#set math.equation(numbering: n => "(9.1)")
 $ T_v & = K \[ t_e : e in E_(+) \( v \) \] \/ \( t_e^2 : e in E_(+) \( v \) \) \,\
cal(S)_v \( h \, t \) & = sum_(e in E_(+) \( v \)) \( F_e \( h_e \) + t_e b_e \( h_e \) \) - sum_(e in E_(-) \( v \)) F_e \( h_e \) . $ <ten:parameters>]

 Suppose there are formal parametrizations 
$ M_v \( y_v \, t \) in \( y_v \, t \) T_v \[ \[ y_v \] \]^(sum_(e in E \( v \)) N_e) \, #h(2em) y_v = \( y_(v \, 1) \, dots.h \, y_(v \, a_v) \) \, $

 satisfying the following conditions.]
  + #emph[The central tangent maps $A_v = partial_(y_v) M_v \( 0 \, 0 \)$ are injective, and the difference map 
#[#set math.equation(numbering: n => "(9.2)")
 $ Lambda : xor.big_(v in V) K^(a_v) & arrow.r xor.big_(e in E) K^(N_e) \,\
\( xi_v \)_v & mapsto #scale(x: 120%, y: 120%)[\(] \( A_(v_(+) \( e \)) xi_(v_(+) \( e \)) \)_e - \( A_(v_(-) \( e \)) xi_(v_(-) \( e \)) \)_e #scale(x: 120%, y: 120%)[\)]_e $ <ten:transversality>]

 is an isomorphism.]
  + #emph[One has $cal(S)_v \( M_v \( y_v \, t \) \, t \) = 0$ identically for every vertex $v$.]
  + #emph[For every $L in cal(L)_v$, put $I = L ∩ E_(+) \( v \)$ and $J = L ∩ E_(-) \( v \)$. Then 
#[#set math.equation(numbering: n => "(9.3)")
 $ (product_(i in I) t_i) (product_(j in J) b_j) \( M_v \) in #scale(x: 120%, y: 120%)[\(] \( partial_h cal(S)_v \) \( M_v \) #scale(x: 120%, y: 120%)[\)] subset T_v \[ \[ y_v \] \] . $ <ten:law-membership>]

 The ideal on the right is generated by all restricted internal partial derivatives of $cal(S)_v$.]
  #emph[There is an endpoint assignment $a : E arrow.r V$ such that, for every $v in V$ and $L in cal(L)_v$, at least one edge of $L$ is assigned to its endpoint other than $v$.]
] <ten:assignment>

Injectivity in the first condition makes every parametrization a smooth formal graph, also over the full parameter ring $T_v$. In particular, nilpotent constant displacements are permitted. The relations in (9.1) are individual relations: products of distinct parameters remain present.

Before proving the theorem, we record its consequence for the graph used in the chamber construction.

#thm([Corollary 9.2.])[
  (Colored odd cycles).  #emph[Let $d gt.eq 3$ be odd. On the cycle with vertices $bb(Z) \/ d bb(Z)$, replace every neighboring pair by five red and five blue parallel edges. Distinguish the two endpoints of each edge arbitrarily. At each vertex let $cal(L)_v$ consist of every four-element subset of incident edges containing two red and two blue edges. There are no data satisfying the hypotheses of Theorem 45 for this graph and these law families.]
] <ten:odd-cycle>

#proof[
  An assignment supplied by Theorem 45 cannot assign two red and two blue edges to the same vertex. Hence every vertex receives at most one edge in at least one of the two colors. Call such a color deficient at that vertex. Two adjacent vertices cannot share a deficient color: each of the five edges of that color joining them must be assigned to one of the two vertices, whereas together the two vertices could receive at most two. Thus the nonempty sets of deficient colors at adjacent vertices are disjoint. Each such set is consequently a singleton, and the deficient colors alternate around the cycle. This is impossible when $d$ is odd; see Figure 3. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  bezier((1.061e-16, 1.732), (1.648, 0.5354), (0.6662, 1.3), (1.03, 1.035), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.061e-16, 1.732), (1.648, 0.5354), (0.6173, 1.233), (0.9815, 0.968), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.648, 0.5354), (1.018, -1.402), (1.442, -0.2319), (1.303, -0.6601), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.648, 0.5354), (1.018, -1.402), (1.363, -0.2062), (1.224, -0.6344), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.018, -1.402), (-1.018, -1.402), (0.2251, -1.443), (-0.2251, -1.443), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.018, -1.402), (-1.018, -1.402), (0.2251, -1.36), (-0.2251, -1.36), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  bezier((-1.018, -1.402), (-1.648, 0.5354), (-1.303, -0.6601), (-1.442, -0.2319), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  bezier((-1.018, -1.402), (-1.648, 0.5354), (-1.224, -0.6344), (-1.363, -0.2062), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  bezier((-1.648, 0.5354), (1.061e-16, 1.732), (-1.03, 1.035), (-0.6662, 1.3), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  bezier((-1.648, 0.5354), (1.061e-16, 1.732), (-0.9815, 0.968), (-0.6173, 1.233), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  content((-0.2828, 1.45), (0.2828, 2.015), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$R$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.365, 0.2525), (1.931, 0.8182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.7355, -1.684), (1.301, -1.119), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$R$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.301, -1.684), (-0.7355, -1.119), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.931, 0.2525), (-1.365, 0.8182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$R$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.945, 1.418), [#text(size: 9pt)[same deficient color:#linebreak()impossible]], anchor: "south-east", padding: 0.1176cm)
  content((2.257, 0), [#text(size: 9pt)[each red stroke: five red edges#linebreak()each blue stroke: five blue edges]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 3: The deficient-color contradiction on a five-cycle. Letters denote colors in which the vertex receives at most one edge. Adjacent vertices must have different letters, so the forced alternation fails when the cycle closes. ],
) <ten:cycle-figure>

For the application, a hypothetical filling is cut into vertex pieces meeting along three-dimensional edge cuts. Section 10 constructs the functions $F_e \, b_e$ and graphs $M_v$ from connection data on these pieces. The three hypotheses arise from transversality, cancellation of boundary actions, and disk-bounding marked laws; the gradient ideals encode flatness in the chosen formal families.

It remains to prove Theorem 45. The proof converts the vertex graphs into tensors whose contraction along all edges is nonzero. The law memberships force certain coefficients of these tensors to vanish. A nonzero term of the contraction then chooses the required endpoint for every edge. The argument uses the given graph directly; it does not require a bipartition.

=== 9.2 Reduction to a finite-dimensional setting <reduction-to-a-finite-dimensional-setting>

#thm([Lemma 9.3.])[
  (Finite specialization).  #emph[If data satisfying the hypotheses of Theorem 45 exist, the same algebraic identities, ideal memberships, and tangent conditions can be realized over a finite field of characteristic $q$, for arbitrarily large primes $q$, with the same graph and law families. The functions $F_e \, b_e$ remain algebraic and depend only on their own edge block.]
] <ten:specialization>

#proof[
  At each vertex choose a linear projection of the ambient coordinate space onto $K^(a_v)$ that is invertible on the central tangent image. Its composite with $M_v$ has a formal inverse over $T_v$, with parameters fixed. The possible constant displacement lies in the nilpotent ideal $\( t \)$, so the substitution is well defined. Reparametrize to make this projection of $M_v$ equal to $y_v$.
  For a subset $A subset E_(+) \( v \)$, write $t_A = product_(e in A) t_e$. Expand the graph and every coefficient witnessing (9.3) in the finite basis ${ t_A }_A$ of $T_v$. All the resulting unknown coefficient series have the same independent variables $y_v$. Represent the fixed edge functions on pointed $acute(e)$tale neighborhoods. Implicit differentiation expresses their ambient derivatives in the same finite presentations, with inverse Jacobian determinants included among the units. Auxiliary variables for these presentations and units turn the following requirements into a finite polynomial system in the unknown coefficient series: the presentation equations, the fixed graph projection, the vanishing of $cal(S)_v$, and all the ideal-membership identities. No derivative of an unknown coefficient series occurs.
  Artin approximation over $K \[ y_v \]_(\( y_v \))^h$ [1] Theorem 1.10 gives algebraic coefficient series that still solve this polynomial system exactly and agree with the original solution through first order. In particular, the central graph tangent and all chosen branch centers are preserved. Apply it separately at each vertex. These systems share only the fixed edge functions, and their mutual transversality is a condition on the preserved first jets. Thus no nested approximation is involved. When $a_v = 0$, the coefficient system already consists of equations over $K$, and no approximation is needed there. The preserved branch centers and invertible Jacobians identify the auxiliary solutions uniquely with the compositions of the fixed edge germs and the approximated graph.
  We now have finitely many algebraic germs and exact identities between them. Each is represented at a finite stage of a henselization, and every identity holds at a sufficiently large finite stage. Descend these presentations, compositions, branch centers, and identities to a finitely generated integral $bb(Z)$-subalgebra $A subset K$. Include the inverse $acute(e)$tale Jacobians and the inverse determinant in (9.2). The implicit differentiation identities descend as well, so specialization preserves the meaning of the gradient entries. The original presentations for $F_e \, b_e$ still use only $h_e$.
  There are specializations of $A$ to finite fields in arbitrarily large characteristic. Indeed, a maximal quotient of the nonzero finite-type $bb(Q)$-algebra $A ⊗ bb(Q)$ is a number field $E_0$. The images of a finite set of generators of $A$, including all the specified inverses, lie in $cal(O)_(E_0) \[ 1 \/ d_0 \]$ for some positive integer $d_0$. Reduction at a prime above any rational prime not dividing $d_0$ gives the desired specialization. All declared units remain invertible. The pointed $acute(e)$tale presentations therefore give formal germs satisfying the same identities and tangent conditions over the residue field. ◻
]

Fix such a field $k$ of characteristic $q > 2$. For each edge define

$ R_e = k \[ h_(e \, 1) \, dots.h \, h_(e \, N_e) \] \/ \( h_(e \, 1)^q \, dots.h \, h_(e \, N_e)^q \) \, #h(2em) Omega_e = R_e ⊗_k and.big chevron.l upright(d) h_(e \, 1) \, dots.h \, upright(d) h_(e \, N_e) chevron.r . $

Let $upright(d)$ denote the exterior differential. It is well defined because $upright(d) \( h_(e \, r)^q \) = 0$. We always use the graded tensor convention: moving homogeneous factors of exterior degrees $r \, s$ past one another contributes $\( - 1 \)^(r s)$.

Order the coordinates in each block and define integration to be zero outside exterior degree $N_e$, and otherwise to extract the coefficient of $product_r h_(e \, r)^(q - 1)$ from the coefficient of $upright(d) h_(e \, 1) and dots.h.c and upright(d) h_(e \, N_e)$. For a zero-dimensional block, this is the identity on $k$. Integration kills exact forms, since differentiating a monomial cannot produce exponent $q - 1$ in the differentiated coordinate. Thus

#[#set math.equation(numbering: n => "(9.4)")
 $ integral upright(d) alpha and beta = - \( - 1 \)^(\| alpha \|) integral alpha and upright(d) beta $ <ten:integration-parts>]

for homogeneous forms.

These constructions extend to products of edge blocks and to the square-free parameter rings by tensoring and differentiating only the internal coordinates. They turn the formal graphs into finite tensors without discarding any of the parameter coefficients needed by the laws.

The projection normalization in Lemma 47 also provides explicit graph equations. Complete its projected coordinates $x$ to linear ambient coordinates $\( x \, z \)$. The graph is then $\( x \, f \( x \, t \) \)$, and its equations are $c_s = z_s - f_s \( x \, t \)$. We use these equations for the vertex graphs in the next construction.

#thm([Lemma 9.4.])[
  (Graph forms).  #emph[Let $c_1 \, dots.h \, c_r$ be graph equations for a smooth formal graph over one of the square-free parameter rings, centered modulo its parameter ideal. In the truncated differential forms of its ambient space, set 
#[#set math.equation(numbering: n => "(9.5)")
 $ U_c = and.big_(s = 1)^r c_s^(q - 1) upright(d) c_s . $ <ten:graph-form>]

 Then $upright(d) U_c = 0$; the graph ideal annihilates $U_c$; and every internal one-form restricting to zero on the graph wedges to zero with $U_c$.]
] <ten:graph-forms>

#proof[
  Every centered-modulo-parameters series $c$ has $c^q = 0$ in the truncated ring. By Frobenius, a nonconstant internal monomial acquires an exponent at least $q$, and a positive parameter monomial has zero $q$-th power. Consequently every formal coordinate change with such a center preserves the truncation ideal; its inverse proves equality of the ideals. This also justifies evaluating the formal series in the truncated ring.
  Each factor $c_s^(q - 1) upright(d) c_s$ is closed, and multiplication by $c_s$ kills it. In graph coordinates, a one-form vanishing on the graph is a sum of graph-ideal multiples of one-forms and multiples of the $upright(d) c_s$. Both types wedge to zero with $U_c$. The coordinate invariance just proved permits this calculation after truncation and over the full parameter ring. ◻
]

Choose a graph form $U_(v \, t)$ for each $M_v$, and let

$ D_(v \, t) = upright(d) cal(S)_v and \( - \) . $

The exact graph identity gives $D_(v \, t) U_(v \, t) = 0$. The law memberships have a useful stronger consequence at the level of actual forms:

#[#set math.equation(numbering: n => "(9.6)")
 $ (product_(i in I) t_i) (product_(j in J) b_j) U_(v \, t) in "im" D_(v \, t) . $ <ten:law-boundary>]

To see this, lift each membership coefficient from the graph to its ambient coordinates. The error in the resulting scalar identity is in the graph ideal and hence kills $U_(v \, t)$. If $iota_r$ is contraction with an ambient coordinate vector, then

$ iota_r D_(v \, t) + D_(v \, t) iota_r = \( partial_(h_r) cal(S)_v \) "id" . $

Applying this identity to the cycle $U_(v \, t)$ writes the scalar multiple as a boundary. The operator $D_(v \, t)$ is multiplication by a one-form and does not differentiate the membership coefficients. In particular, (9.6) survives every parameter specialization as an equation on forms; no assertion about homology base change is needed.

=== 9.3 Two homologies and a nonzero contraction <two-homologies-and-a-nonzero-contraction>

At each edge set

#[#set math.equation(numbering: n => "(9.7)")
 $ D_e = upright(d) F_e and \( - \) \, #h(2em) cal(H)_e = H \( Omega_e \, D_e \) \, #h(2em) delta_e = \[ upright(d) \] \, #h(2em) cal(W)_e = H \( cal(H)_e \, delta_e \) . $ <ten:edge-homologies>]

Here $delta_e$ is well defined because $upright(d) D_e + D_e upright(d) = 0$. The two homologies serve different purposes: $D_e$-boundaries encode the gradient memberships, while $delta_e$-cycles supply the parameter lifts used below.

The wedge pairing followed by integration is perfect on $Omega_e$, pairing complementary exterior degrees. This follows directly by pairing complementary monomials and complementary exterior basis elements. For any one-form $theta$,

#[#set math.equation(numbering: n => "(9.8)")
 $ \( theta and alpha \) and beta = \( - 1 \)^(\| alpha \|) alpha and \( theta and beta \) . $ <ten:wedge-adjoint>]

Thus the annihilator of the $D_e$-cycles is exactly the space of $D_e$-boundaries: one inclusion follows from (9.8), and equality follows from the equality of the ranks of an operator and its adjoint. The pairing descends to a perfect pairing on $cal(H)_e$. Equation (9.4) gives the same argument for $delta_e$, and hence a perfect pairing on $cal(W)_e$. Replacing $D_e$ by $- D_e$ changes neither its cycles nor its boundaries.

For clarity, the Künneth identifications used here are purely finite-dimensional linear algebra. Any finite-dimensional complex over a field splits as its homology representatives with zero differential and a direct sum of contractible two-term complexes. A tensor product with a contractible factor is contractible, using its contracting homotopy with the graded tensor signs. It follows that the homology of a finite tensor product is the tensor product of the homologies.

Let $U_v = U_(v \, 0)$. Since it is closed for both $D_(v \, 0)$ and $upright(d)$, the preceding identifications give classes

#[#set math.equation(numbering: n => "(9.9)")
 $ u_v in ⨂_(e in E \( v \)) cal(H)_e \, #h(2em) omega_v in ⨂_(e in E \( v \)) cal(W)_e . $ <ten:vertex-tensors>]

In the first tensor product, $u_v$ is a cycle for the tensor differential induced by the $delta_e$.

Fix orders of vertices, edges, and incidences. To contract tensors along edges, reorder their factors with the graded signs, put the plus factor before the minus factor at each edge, and apply its pairing. This defines a scalar contraction on the vertex tensors in (9.9).

#thm([Lemma 9.5.])[
  (Transverse contraction).  #emph[The total contraction of $\( omega_v \)_(v in V)$ is nonzero.]
] <ten:nonzero>

#proof[
  First perform the contraction on graph forms, identifying the two copies of every edge block, wedging, and integrating. Put $N = sum_e N_e$ and $n_v = sum_(e in E \( v \)) N_e$. The isomorphism (9.2) gives $sum_v a_v = N$, whereas $sum_v n_v = 2 N$. Thus the total number of graph equations is $sum_v \( n_v - a_v \) = N$.
  After identifying edge coordinates, their linear parts are independent. Indeed, a vector annihilated by all these linear equations determines a tangent vector in the image of each $A_v$. The tangent parameters are unique by injectivity, and their edge coordinates agree at opposite ends. They therefore lie in $ker Lambda = 0$. Let $C$ be the resulting invertible $N$-by-$N$ matrix of linear graph equations.
  The polynomial coefficient of the wedge of all graph forms has degree at least $N \( q - 1 \)$, the highest possible degree in the truncated polynomial ring. Only the linear terms of the graph equations and the constant terms of their differentials can contribute. A linear change with matrix $C$ acts on the polynomial socle $k product h_(e \, r)^(q - 1)$ by $det \( C \)^(q - 1)$, and on the exterior top form by $det \( C \)$. The socle identity can be checked on diagonal matrices, permutations, and elementary transvections: for a transvection, each nonconstant term has an exponent at least $q$ and vanishes. These matrices generate the general linear group. The contraction is therefore $plus.minus det \( C \)^q eq.not 0$. If $N = 0$, the same calculation uses the empty determinant, equal to one.
  This contraction descends to the two homologies. For the first descent, replace the graph form at one vertex by a $D_(v \, 0)$-boundary and keep cycles at the other vertices. In the product of all incidence blocks, apply the sum of the vertex differentials to the product with that vertex’s primitive. Only the chosen vertex contributes. Upon edge identification the sum of its multiplying one-forms is zero, since every $upright(d) F_e$ occurs once with each sign. The contraction of the boundary is therefore zero. Under Künneth this is exactly the edgewise pairing on $cal(H)_e$. For the second descent, (9.4) makes that pairing a chain pairing for the $delta_e$; hence contracting a boundary against cycles gives zero. The resulting scalar is the contraction of the $omega_v$, and retains the computed nonzero value. ◻
]

=== 9.4 Kernel representatives and parameter lifts <kernel-representatives-and-parameter-lifts>

For each edge, multiplication by $b_e$ commutes with $D_e$. Define

#[#set math.equation(numbering: n => "(9.10)")
 $ B_e : cal(H)_e arrow.r cal(H)_e \, #h(2em) B_e \[ a \] = \[ b_e a \] \, #h(2em) cal(K)_e = ker B_e \,\
overline(cal(K))_e = "im" #scale(x: 120%, y: 120%)[\(] cal(K)_e ∩ ker delta_e arrow.r cal(W)_e #scale(x: 120%, y: 120%)[\)] . $ <ten:kernels>]

The space $cal(K)_e$ need not be a subcomplex. The following elementary projection allows us nevertheless to retain its cycle representatives when passing to the second homology.

#thm([Lemma 9.6.])[
  (Projection preserving a subspace).  #emph[Let $\( H \, delta \)$ be a finite-dimensional graded complex over a field and let $K_0 subset H$ be a graded subspace. There is a chain projection $P : H arrow.r H$, chain-homotopic to the identity, whose image lies in $ker delta$ and maps isomorphically onto $H \( H \, delta \)$, and such that $P \( K_0 \) subset K_0 ∩ ker delta$.]
] <ten:projection>

#proof[
  Write $Z = ker delta$ and $B = "im" delta$. Choose a complement $A_0$ to $K_0 ∩ B$ in $K_0 ∩ Z$, and extend it to a complement $A$ to $B$ in $Z$. Choose a complement $W_0$ to $K_0 ∩ Z$ in $K_0$; it meets $Z$ trivially, so it extends to a complement $W$ to $Z$ in $H$. Make every choice degree by degree. In the decomposition
  $ H = B xor A xor W \, $
  projection onto $A$ sends $K_0$ into $A_0$. It is a chain map. The restriction $delta : W arrow.r B$ is an isomorphism with degree shift. Its inverse on $B$, extended by zero on $A xor W$, is a homotopy $s$ satisfying $"id" - P = delta s + s delta$. ◻
]

#thm([Lemma 9.7.])[
  (Lifting a kernel cycle).  #emph[Let $x in cal(K)_e ∩ ker delta_e$ be homogeneous and let $a$ be a homogeneous $D_e$-cycle representing $x$. There is a form $a'$ of the same exterior degree such that 
#[#set math.equation(numbering: n => "(9.11)")
 $ \( D_e + t thin upright(d) b_e and \( - \) \) \( a + t a' \) = 0 quad upright("in ") Omega_e \[ t \] \/ \( t^2 \) . $ <ten:lift-equation>]

]
] <ten:lift>

#proof[
  On $cal(H)_e$, the commutator $delta_e B_e - B_e delta_e$ is induced by $upright(d) b_e and \( - \)$. Both terms kill $x$, so $upright(d) b_e and a$ is a $D_e$-boundary. Choose $a'$ with $D_e a' = - upright(d) b_e and a$. Expansion, using $t^2 = 0$, proves (9.11). ◻
]

We now have a nonzero contraction and, at each edge, the subspace $overline(cal(K))_e$ whose representatives admit such lifts. The next step translates each law into a restriction on the basis coefficients that can occur at its vertex.

=== 9.5 From local laws to an endpoint assignment <from-local-laws-to-an-endpoint-assignment>

#proof[
  Use Lemma 47 and the constructions above. Choose a homogeneous basis $\( beta_(e \, s) \)_s$ of $cal(W)_e$ whose first members form a basis of $overline(cal(K))_e$. At the minus end use this basis, and at the plus end use its pairing-dual basis $\( beta_(e \, s)^or \)_s$, normalized by $chevron.l beta_(e \, s)^or \, beta_(e \, r) chevron.r = delta_(s r)$. The same index labels the two bases. Call an index a kernel index if its element $beta_(e \, s)$ lies in the chosen basis of $overline(cal(K))_e$.
  A term of the total contraction has one common index at the two ends of every edge. The assignment attached to such a term sends an edge to its plus endpoint for a kernel index, and to its minus endpoint otherwise. We will prove that a nonzero term obeys every local prohibition.
  We claim that the coefficient of $omega_v$ at any tuple of indices is zero whenever, for some $L in cal(L)_v$, all its plus edges $I = L ∩ E_(+) \( v \)$ have kernel indices and all its minus edges $J = L ∩ E_(-) \( v \)$ have nonkernel indices.
  Fix those plus indices. For each $i in I$, choose a homogeneous representative $x_i in cal(K)_i ∩ ker delta_i$ of $beta_(i \, s_i)$, and a homogeneous $D_i$-cycle $a_i$ representing $x_i$. By Lemma 51, choose a cycle $a_i + t_i a'_i$ for $D_i + t_i upright(d) b_i and \( - \)$. Set all other parameters at $v$ equal to zero in the actual boundary identity (9.6). Move its factors in $I$ before the remaining ones, with the graded signs, and pair them with the tensor of these lifts, integrating in just those blocks. Because the perturbations act on separate blocks, the tensor of the lifts is a cycle for the full tensor differential over $k \[ t_i : i in I \] \/ \( t_i^2 \)$, including all mixed parameter terms.
  Write $Phi_t$ for this partial contraction, and let $D_R$ be the signed tensor differential on the remaining blocks. It is independent of the retained parameters. If $m = sum_(i in I) \( N_i - \| a_i \| \)$, the homogeneous map $Phi_t$ has degree $- m$. Equation (9.8), with the graded tensor convention, gives $Phi_t D_(v \, t) = \( - 1 \)^m D_R Phi_t$. In particular it takes $D_(v \, t)$-boundaries to $D_R$-boundaries. Applying it to (9.6) and taking the coefficient of $t_I = product_(i in I) t_i$ gives
  #[#set math.equation(numbering: n => "(9.12)")
   $ (product_(j in J) b_j) Phi_0 \( U_v \) in "im" D_R . $ <ten:contracted-kernel>]
  Indeed, multiplication by $t_I$ kills every positive-degree parameter coefficient on the left. This coefficient extraction also applies when $I$ is empty, with $Phi_t$ the identity.
  In the first homology, let $x$ denote the partial contraction of $u_v$ with the classes $x_i$. Equation (9.12) gives
  $ (product_(j in J) B_j) x = 0 . $
  The class $x$ is a cycle for the remaining tensor differential $delta$: the edge pairings on $cal(H)_e$ satisfy (9.4), and every inserted class $x_i$ is a $delta_i$-cycle.
  If $J$ is empty, the equation already says $x = 0$. Otherwise,
  #[#set math.equation(numbering: n => "(9.13)")
   $ x in sum_(j in J) (cal(K)_j ⊗ ⨂_(e in E \( v \) \\ \( I union { j } \)) cal(H)_e) \, $ <ten:kernel-sum>]
  where the factors are placed in their fixed order. To verify this kernel description, quotient the tensor product by the displayed sum. It becomes the tensor product with $cal(H)_j \/ cal(K)_j$ in each position $j in J$. Each induced map $cal(H)_j \/ cal(K)_j arrow.r cal(H)_j$ is injective, and tensoring injections over a field preserves injectivity.
  The decomposition in (9.13) need not be a sum of $delta$-cycles. The projections of Lemma 50 replace it by cycle representatives without changing the second-homology class or losing the indicated kernel factors.
  On every remaining $\( cal(H)_e \, delta_e \)$, choose the projection of Lemma 50 for $cal(K)_e$. Their tensor product is chain-homotopic to the identity: expand $"id" - ⨂_e P_e$ by telescoping and use each individual homotopy with the graded signs. Applied to the cycle $x$, this projection therefore represents the same second-homology class. By (9.13), that class belongs to the sum of tensor subspaces having a factor $overline(cal(K))_j$ for some $j in J$. The class is exactly the contraction of $omega_v$ against the selected $beta_(i \, s_i)$ in its plus positions. Since all the $J$-positions are minus positions, their bases are the $beta_(j \, s)$. A coefficient with nonkernel indices at every one of those positions must vanish. This proves the claim.
  Expand the total contraction of the $omega_v$ in the chosen bases. It is a finite signed sum of products of vertex coefficients, with equal indices at the two ends of every edge. By Lemma 49, at least one such product is nonzero. Choose its indices and use the assignment attached to that term. If a law $L in cal(L)_v$ had all its edges assigned to $v$, its plus indices would all be kernel indices and its minus indices would all be nonkernel indices. The coefficient at $v$ would vanish by the claim, a contradiction. The assignment has the required property. ◻
]

== 10 The obstruction in odd cyclic covers <sec:formal>

The degree-two filling constructed in Section 8 will be contrasted with the following obstruction. Throughout this section, a marked filling has the boundary identification and the graph marking specified there.

#thm([Proposition 10.1.])[
  (Odd covers do not fill).  #emph[For every odd integer $d gt.eq 3$, the marked boundary $S_d$ admits no marked filling.]
] <for:odd-nonfilling>

Suppose, toward a contradiction, that such a filling exists. We first undo the law-curve surgeries and cut the resulting graph-type manifold into pieces indexed by the plumbing graph. For each cut, the peripheral direction detected in degree-one cohomology determines the plus endpoint; the other endpoint is minus. We then construct the formal data of Theorem 45 using these designations. They are independent from edge to edge, so a vertex may meet both kinds of endpoint.

=== 10.1 Recovering the marked cut pieces <recovering-the-marked-cut-pieces>

Let $Gamma_d$ denote the plumbing graph of the degree-$d$ cover. Its vertices are indexed by $bb(Z) \/ d$, and each consecutive pair is joined by five red and five blue edges. There are also $p$ named extra loops at every vertex in the graph model of $X_d$; these loops are not edges of $Gamma_d$. Since $d gt.eq 3$, every plumbing edge has two different endpoints, and the distinct ports of a law give distinct incident edges.

#thm([Lemma 10.2.])[
  (Marked cuts).  #emph[A marked filling of $S_d$ gives a compact connected topological four-manifold $W$ with boundary identified with $partial X_d$ and with the marked graph homotopy type of $X_d$. It admits a decomposition over $Gamma_d$ with connected vertex pieces $V_v$ and connected three-dimensional cuts $Y_e$ such that:]
  + #emph[the outside boundary face of $V_v$ is the prescribed $K_v$, and $partial Y_e$ is precisely the prescribed join torus;]
  + #emph[every marked four-slot law at $v$ bounds a disk in $V_v$;]
  + #emph[the cuts are compact smooth three-manifolds, and the filled vertex pieces are smooth away from finitely many interior points.]
  #emph[The identifications retain the based port meridians, their longitudes, and the named extra loops.]
] <for:cuts>

#proof[
  We use the dual-handle and cut construction of [23] Section 2.4, keeping the full cyclic quotient instead of passing to its parity quotient. Attach to the proposed filling the dual two-handles that undo surgery on the initial law curves. The attaching circles represent, with their prescribed paths, the lifted normal-circle generators $z_j$. Indeed $w \( z_j \) = 0$, so every replacement piece and each such generator has an individual lift. These are free-factor generators in the graph marking of the filling. Attaching the two-cells therefore cancels the corresponding one-cells in its homotopy type, leaving the marked graph of $X_d$.
  The boundary after these attachments is $partial X_d$. On the common link exterior its map to the remaining graph is the original marking: the quotient has killed exactly the normal-circle generators. The same holds on the restored solid tori, whose group elements come from their gluing tori. Equality of the resulting fundamental-group maps is equality up to homotopy of graph-valued maps. Thus the marking of $W$ is the required one. The two-handle cocores are disjoint proper locally flat disks with the original law curves as boundaries.
  For the cuts, pass to the cover associated to the quotient that forgets the extra loops. Its deck group is $pi_1 Gamma_d$, acting freely on the universal covering tree of $Gamma_d$. The fundamental group of this cover of $W$ is freely generated by the named extra loops at tree vertices, with their whiskers. Prescribe an equivariant map to the tree to be constant at the appropriate vertex on each outside face and each cocore neighborhood, and to cross the appropriate edge on every join-torus collar. The prescriptions agree on overlaps. They extend over the remaining space because the associated tree bundle has contractible fiber, as in the cut construction of [23] Section 2.4.
  Choose the punctured smoothing used in that construction, with its punctures away from the prescribed disks and collars. Make the tree map constant near each puncture. Smooth approximation over the middle of the edges and regular values then give compact smooth cuts, disjoint from the disks. It remains to obtain connected cuts and connected vertex pieces; regular values alone do not ensure this.
  Form the component graph of these cuts in the tree cover. Its fundamental group is a quotient of that of the cover: a graph path can be lifted by joining successive crossings inside connected pieces. Each named extra generator is conjugate to a loop lying in one piece, and hence has trivial image in the component graph. The component graph is therefore a tree. The outside faces and prescribed torus collars embed the original plumbing tree in it. In fact different tree-vertex labels cannot lie in the same component after the target midpoints have been removed, and the prescribed collars give exactly the edges joining these principal vertices.
  Every component outside this principal subtree attaches at a unique principal vertex. A deck transformation stabilizing that component fixes its attaching vertex, and hence is the identity. There are only finitely many orbits of cut and complementary components in the finite quotient. Since an orbit meets the branches attached to a fixed principal vertex at most once, those branches have uniformly finitely many edges and vertices. Discard their closed cuts and merge their pieces into the principal pieces. This leaves exactly one connected cut with each prescribed torus as its entire boundary. The disk prescriptions and boundary markings are unchanged. Descending to $Gamma_d$ proves the lemma. ◻
]

The filled vertex pieces in this lemma need not be smooth. We use precisely the replacement for ordinary forms supplied by [23] Lemma 2.4. For completeness, if $Z_v$ is the finite puncture set in $V_v$, take smooth functions on $V_v \\ Z_v$ that are separately constant near each puncture in degree zero, and smooth forms vanishing near the punctures in positive degrees. This is a differential graded algebra computing $H^(*) \( V_v \; bb(C) \)$. Viewed as a sheaf on $V_v$, it has the constant sheaf as its degree-zero cohomology sheaf and no higher cohomology sheaves. Partitions of unity can be made constant on smaller puncture neighborhoods, so the complex is a fine resolution. Requiring degree-zero functions to vanish at a chosen point of $K_v$ removes only $H^0$.

All subsequent vertex recursions and gauges take place in this algebra. Each coefficient of a positive-degree formal form vanishes near the punctures, so Stokes’ formula is computed on a compact smooth subdomain, with zero contribution from its additional end boundaries. One common vanishing neighborhood for the entire formal series is unnecessary: a fixed coefficient uses only finitely many terms. Collar extensions and the coefficientwise divisions used below have the same property. Removing interior points in dimension four does not change the fundamental group; gauges between flat systems may be separately constant at these ends. Thus the based holonomy calculation uses the filled fundamental group and the filled cohomology. Only the unchanged compact smooth three-manifolds $Y_e$ enter the edge-potential theorem.

=== 10.2 Restriction maps and peripheral directions <restriction-maps-and-peripheral-directions>

All cohomology in this subsection has coefficients in $bb(C)$. Give the edges any temporary orientation, and let

$ Delta^q : xor.big_v H^q \( V_v \) arrow.r xor.big_e H^q \( Y_e \) $

be the difference of restrictions at their two endpoints.

#thm([Lemma 10.3.])[
  (Linear cut data).  #emph[The map $Delta^2$ is an isomorphism. The map $Delta^1$ is surjective and restricts to an isomorphism on the subspace where evaluation on every named extra loop is zero. For each cut $Y_e$, the image of $H^1 \( Y_e \)$ in $H^1 \( partial Y_e \)$ is one of the two original coordinate lines.]
] <for:linear>

#proof[
  The graph homotopy type of $W$ gives $H^2 \( W \) = H^3 \( W \) = 0$. Mayer–Vietoris for the decomposition over $Gamma_d$ consequently makes $Delta^2$ an isomorphism and $Delta^1$ surjective. Since the pieces and cuts are connected, the kernel of $Delta^1$ is
  $ H^1 \( W \) #scale(x: 120%, y: 120%)[\/] H^1 \( Gamma_d \) . $
  The graph classes vanish on the named extra loops. By the retained marking, evaluation on those $d p$ loops has rank $d p$, and $b_1 \( W \) = b_1 \( Gamma_d \) + d p$. These evaluations therefore identify the displayed quotient with $bb(C)^(d p)$. Given any restrictions on the cuts, its unique kernel correction makes all extra evaluations zero, proving the second assertion.
  For a connected oriented three-manifold with one torus boundary, half-lives/half-dies makes the boundary image in degree one a line. The restrictions from the two vertex ends span $H^1 \( Y_e \)$. At the torus, each end restriction annihilates its longitude, which bounds in its outside face $K_v$. These two longitudes are the two different coordinate slopes, because plumbing interchanges meridian and longitude. A line different from both coordinate lines meets each of them trivially; if it were the boundary image, all vertex restrictions would vanish at the boundary, contradicting surjectivity onto that nonzero line. Thus it is one coordinate line. ◻
]

For every $e$, denote by $alpha_e$ the coordinate loop detected by this line and by $beta_e$ the other coordinate loop. Call the endpoint whose port meridian is $alpha_e$ the #emph[plus endpoint], denoted $v_(+) \( e \)$; at the other, or #emph[minus endpoint] $v_(-) \( e \)$, the port meridian is $beta_e$. At a plus endpoint $beta_e$ bounds in $K_v$; at a minus endpoint $alpha_e$ bounds there. Orient $Y_e$ as a face of $V_(v_(+) \( e \))$, and use the opposite orientation at the other end. Put

$ E_(+) \( v \) = { e : v_(+) \( e \) = v } \, #h(2em) E_(-) \( v \) = { e : v_(-) \( e \) = v } . $

These designations are determined independently on the different edges; in particular they impose no orientation on the underlying cycle.

Set $frak(g) = frak(s l)_2 \( bb(C) \)$ with its invariant trace pairing, and define the internal edge tangent space

$ cal(E)_e = H^1 \( Y_e \, partial Y_e \; bb(C) \) ⊗ frak(g) \, #h(2em) N_e = dim_(bb(C)) cal(E)_e . $

Since both $Y_e$ and its boundary are connected, relative degree-one cohomology identifies with the kernel of boundary restriction. After the extra evaluations have been fixed, evaluation on $alpha_e$ comes only from its plus endpoint. Lemma 54 therefore gives

#[#set math.equation(numbering: n => "(10.1)")
 $ xor.big_v cal(A)_v arrow.r^(med tilde.equiv med) xor.big_e cal(E)_e \, $ <for:tangent-isomorphism>]

where $cal(A)_v$ is the subspace of $H^1 \( V_v \) ⊗ frak(g)$ with zero extra evaluations and zero evaluations on its plus meridians; the map is the signed difference of restrictions. In particular all the extra and plus evaluations are independent conditions on the vertex spaces. We shall also use the perfect pairing

#[#set math.equation(numbering: n => "(10.2)")
 $ H^1 \( Y_e \, partial Y_e \) ⊗ frak(g) med times med H^2 \( Y_e \) ⊗ frak(g) arrow.r bb(C) \, #h(2em) \( a \, b \) mapsto integral_(Y_e) "tr" \( a and b \) . $ <for:edge-pairing>]

By Lemma 54, restriction of each vertex $H^2$ summand to its incident cuts is injective.

=== 10.3 The formal data to be constructed <the-formal-data-to-be-constructed>

For each vertex $v$, let $cal(L)_v$ consist of the four-element sets of incident edges containing two red and two blue edges. The ports at $v$ correspond bijectively to incident edges, including parallel edges, since $d gt.eq 3$. Order each such set into two red–blue pairs. Lemma 36 then supplies the independently conjugated laws with leading bracket $\[ \[ X_1 \, X_2 \] \, \[ X_3 \, X_4 \] \]$, with a red and a blue input in each pair. The following proposition is the interface with the tensor argument. The ideals in its statement, and throughout its proof, are actual ideals rather than radicals.

#thm([Proposition 10.4.])[
  (Formal data from the cuts).  #emph[For the cut pieces of Lemma 53, there are a characteristic-zero field $K$, coordinate blocks $h_e = \( h_(e \, 1) \, dots.h \, h_(e \, N_e) \)$, and algebraic power-series germs $F_e \( h_e \) \, b_e \( h_e \)$ over $K$, with $F_e \( 0 \) = b_e \( 0 \) = 0$, as follows. For each vertex set 
#[#set math.equation(numbering: n => "(10.3)")
 $ T_v & = K \[ t_e : e in E_(+) \( v \) \] \/ \( t_e^2 : e in E_(+) \( v \) \) \,\
cal(S)_v & = sum_(e in E_(+) \( v \)) \( F_e + t_e b_e \) - sum_(e in E_(-) \( v \)) F_e . $ <for:vertex-potentials>]

 There are smooth formal graph parametrizations $M_v \( y_v \, t \)$ in the incident $h_e$ blocks over $T_v$, centered modulo $\( t \)$, such that:]
  + #emph[their central tangent maps are injective, and the difference map from the sum of the vertex tangent spaces to the sum of the edge blocks is an isomorphism;]
  + #emph[$cal(S)_v \( M_v \) = 0$;]
  + #emph[for $L in cal(L)_v$, with $I = L ∩ E_(+) \( v \)$ and $J = L ∩ E_(-) \( v \)$, 
#[#set math.equation(numbering: n => "(10.4)")
 $ (product_(i in I) t_i) (product_(j in J) b_j) \( M_v \) in #scale(x: 120%, y: 120%)[\(] \( partial_h cal(S)_v \) \( M_v \) #scale(x: 120%, y: 120%)[\)] subset T_v \[ \[ y_v \] \] . $ <for:mixed-membership>]

]
  #emph[Empty products equal one. In every parameter ring, only the individual squares $t_e^2$ vanish; mixed products are retained. One can take $K = bb(C) \( \( sigma \) \)$.]
] <for:formal-data>

We prove this proposition in the next four subsections. The edge results are imported unchanged from [22] Proposition 4.5 and Theorem 5.1. What requires verification here is their assembly at vertices with both kinds of endpoint, and the conversion of the four-slot laws into (10.4).

We first use Stokes’ formula to put the signed sum of edge potentials at each vertex in the square of the ideal of its flatness equations. A gradient calculation identifies this ideal with the restricted gradient ideal and permits a correction to exact zero. Next we pass to algebraic central edge potentials and algebraic lifts of the marked $beta_e$-holonomies on their critical schemes, and recenter at a common flat background. The four-slot laws then put the required products of plus parameters and logarithmic holonomy entries at minus ends into that ideal. Finally, we replace the logarithmic perturbations by polynomials in those lifts and use a nilpotent correction to restore exact vanishing while preserving those memberships.

=== 10.4 Flat backgrounds and the vertex identities <flat-backgrounds-and-the-vertex-identities>

On $partial Y_e$ choose closed strip one-forms $zeta_e \, xi_e$ with periods respectively $\( 1 \, 0 \)$ and $\( 0 \, 1 \)$ on $\( alpha_e \, beta_e \)$, and put $epsilon.alt_e = integral_(partial Y_e) zeta_e and xi_e$. A trace in the $xi_e$ polarization means a matrix multiple of $xi_e$. Fix a basepoint on that torus and a nonzero $T_e in frak(g)$. A #emph[based gauge] is a gauge transformation equal to identity at this point. For a formal family $s$ of connection one-forms, its #emph[curvature ideal] is generated by the scalar coefficient functions of $d s + 1 / 2 \[ s \, s \]$. The input below gives a finite residual presentation of this ideal and identifies it with a gradient ideal. The formal critical scheme of a potential means the formal germ cut out by that actual gradient ideal.

#thm([Lemma 10.5.])[
  (Single-cut input from MT).  #emph[Let $Y_e$ be compact, connected, oriented and smooth, with connected torus boundary and based coordinate slopes $alpha_e \, beta_e$. Suppose the image of $H^1 \( Y_e \; bb(C) \)$ on the boundary detects $alpha_e$ and vanishes on $beta_e$. With internal coordinates $h_e$ on $cal(E)_e$ and a scalar parameter $tau^2 = 0$, there is a formal family $s_e \( h_e \, tau \)$ of connection one-forms, centered at the trivial connection, and formal functions $f_e in \( h_e \)^3$, $b_e^(upright("form")) in \( h_e \)^2$ such that:]
  + #emph[The boundary trace is $tau T_e zeta_e + v_e \( h_e \, tau \) xi_e$. The internal gradient ideal of $f_e + tau b_e^(upright("form"))$ equals the full curvature ideal of $s_e \( h_e \, tau \)$ in $bb(C) \[ \[ h_e \] \] \[ tau \] \/ \( tau^2 \)$.]
  + #emph[Its quotient represents, over every local Artinian coefficient algebra, flat connections modulo based gauges with $G_(alpha_e) = exp \( - tau T_e \)$; equivalently, it is the formal germ of based representations of $pi_1 Y_e$ with that condition. On this quotient $G_(beta_e) = exp \( - v_e \( h_e \, tau \) \)$. Once a flat connection has the displayed torus trace, its gauge into this family is equal to identity on the whole torus.]
  + #emph[At $tau = 0$, writing $G_(beta_e)$ for the marked holonomy on the central critical scheme, one has 
#[#set math.equation(numbering: n => "(10.5)")
 $ b_e^(upright("form")) = - epsilon.alt_e "tr" \( T_e log G_(beta_e) \) med \( mod med "Jac" \( f_e \) \) . $ <for:edge-log-coefficient>]

]
] <for:edge-input>

This is [22] Proposition 4.5, with the based-gauge identification of Lemma 4.4. In its convention the connection is $d + s_e$, accounting for the minus signs in the holonomies. We call the family $s_e$ a #emph[slice]; the assertion about the quotient says that it represents all such based gauge classes with the prescribed peripheral holonomy. The hypotheses have been verified for our cuts in Lemmas 53 and 54. We use this input with $tau = t_e$ at a plus end and with $tau = 0$ at a minus end, always in the same central edge coordinates.

We first work jointly formally at a parameter $sigma = 0$, before inverting $sigma$. Choose the standard basis $\( e_0 \, h_0 \, f_0 \)$ of $frak(s l)_2 \( bb(C) \)$, with $\[ e_0 \, f_0 \] = h_0$, $\[ h_0 \, e_0 \] = 2 e_0$, and $\[ h_0 \, f_0 \] = - 2 f_0$, and put

$ g_(a b) \( sigma \) = exp \( a sigma e_0 \) exp \( b sigma f_0 \) \, #h(2em) a \, b in { 0 \, 1 \, 2 } . $

By [22] Lemma 6.5, the nine operators $"Ad" \( g_(a b) \)$ span $"End"_(bb(C) \( \( sigma \) \)) \( frak(g) ⊗ bb(C) \( \( sigma \) \) \)$. Assign the eight nonidentity matrices to eight named extra loops at each vertex, and assign identity to the remaining extra loops. All port-meridian holonomies are initially trivial. These assignments extend to a common flat background on the marked ambient graph: the extra loops are independent vertex generators in its free groupoid, and the transports along plumbing edges can be chosen freely. Choose them so the frames on the two sides of each join agree with the prescribed basing paths. A cycle in $Gamma_d$ contributes a free groupoid generator, not an additional relation among these choices. For the later law tests, enumerate these nine matrices as $g_1 \, dots.h \, g_9$.

The vertex construction of [22] Section 6.2 applies to the based form complex described above. Choose a cohomological contraction $\( iota_v \, pi_v \, sans(K)_v \)$ there, with degree-zero cohomology removed: $iota_v$ chooses cohomology representatives, $pi_v$ projects onto cohomology, and $sans(K)_v$ has degree $- 1$, with

$ d sans(K)_v + sans(K)_v d = 1 - iota_v pi_v \, quad pi_v iota_v = 1 \, quad sans(K)_v^2 = sans(K)_v iota_v = pi_v sans(K)_v = 0 . $

Its recursion in the full degree-one coordinates $y_v^(upright("full"))$ is

$ a_v = iota_v y_v^(upright("full")) - 1 / 2 sans(K)_v \[ a_v \, a_v \] \, #h(2em) cal(F)_v = d a_v + 1 / 2 \[ a_v \, a_v \] \, #h(2em) r_v = pi_v cal(F)_v . $

The finite list $r_v$ has $q_v = dim \( H^2 \( V_v \; bb(C) \) ⊗ frak(g) \)$ entries. Bianchi’s identity and the slice equation give

#[#set math.equation(numbering: n => "(10.6)")
 $ cal(F)_v = \( 1 + sans(K)_v "ad"_(a_v) \)^(- 1) iota_v r_v . $ <for:curvature-list>]

Thus the curvature ideal is generated by this list, whose entries have order at least two. The leading coefficient forms against the list are the chosen representatives of $H^2 \( V_v \) ⊗ frak(g)$. No independence or regular-sequence assertion about its entries is needed.

Prescribe the chosen logarithmic holonomies on the extra loops, and prescribe $- t_e T_e$ on every plus meridian at $v$. The linearization of based logarithmic holonomy is signed evaluation of a one-form. Equation (10.1) consequently makes these conditions a smooth formal parameter slice. Write its remaining coordinates as $y_v$, and set

$ R_v = bb(C) \[ \[ sigma \, y_v \] \] \[ t_e : e in E_(+) \( v \) \] \/ \( t_e^2 \) \, #h(2em) cal(I)_v = \( r_v \) subset R_v . $

The list has been substituted into this ring. Its entries remain in the square of the joint maximal ideal $frak(m)_v = \( sigma \, y_v \, t \)$. Modulo $cal(I)_v$ the vertex system is flat. At a plus end its peripheral holonomies are the prescribed $alpha_e$ holonomy and trivial $beta_e$ holonomy; at a minus end the $alpha_e$ holonomy is trivial and the $beta_e$ holonomy varies. Therefore the minus restriction uses the #emph[central] edge slice even if other ends of that vertex carry parameters.

Let

$ cal(S)_v^(upright("form")) = sum_(e in E_(+) \( v \)) \( f_e + t_e b_e^(upright("form")) \) - sum_(e in E_(-) \( v \)) f_e . $

We need a smooth section in the edge coordinates, not merely their values on the residual quotient $R_v \/ cal(I)_v$. The following is the local extension of [22] Lemma 6.3.

#thm([Lemma 10.6.])[
  (Vertex identities with both endpoint signs).  #emph[The flat edge restrictions lift to a formal parametrization $M_v^(upright("form"))$ over $R_v$ satisfying 
#[#set math.equation(numbering: n => "(10.7)")
 $ cal(S)_v^(upright("form")) \( M_v^(upright("form")) \) in cal(I)_v^2 \, #h(2em) \( partial_h cal(S)_v^(upright("form")) \) \( M_v^(upright("form")) \) = L_v r_v \, $ <for:square-gradient>]

 where $L_v$ has a full-column minor that is a unit at the joint origin. With $sigma$ and the $t_e$ fixed, the tangent maps at the joint origin are the restriction maps in (10.1).]
] <for:vertex-identities>

#proof[
  We give the boundary calculation to distinguish the present statement from the two-vertex conclusion of [22] Proposition 6.1. For a Lie-algebra-valued one-form $a$ on an oriented three-manifold $Y$, the action and its coefficient variation are
  #[#set math.equation(numbering: n => "(10.8)")
   $ cal(C)_Y \( a \) & = integral_Y "tr" (1 / 2 a and d a + 1 / 6 a and \[ a \, a \]) \,\
dot(cal(C))_Y \( a \) & = integral_Y "tr" \( dot(a) and cal(F)_a \) - 1 / 2 integral_(partial Y) "tr" \( a and dot(a) \) \, #h(2em) cal(F)_a = d a + 1 / 2 \[ a \, a \] . $ <for:action-convention>]
  For the edge slice $s_e$ with trace $u_e zeta_e + v_e xi_e$ and $u_e = t_e T_e$, the adjusted potential of [22] Proposition 4.5 is precisely
  $ f_e + t_e b_e^(upright("form")) = cal(C)_(Y_e) \( s_e \) + epsilon.alt_e / 2 "tr" \( u_e v_e \) . $
  This normalization will cancel the fixed-$u_e$ boundary variation.
  On the free outside face $K_v$, normalize the flat quotient connection to its strip representative: a sum of the signed based holonomy logarithms times closed one-forms dual to the free generators, with disjoint supports. The disjoint meridian-dual disks and extra-loop-dual spheres in the standard outside face supply these strips. Each boundary torus meets only its own port strip. Thus the choices at different tori coexist in one representative: a plus port supplies a $zeta_e$ trace and a minus port a $xi_e$ trace. This representative has zero Chern–Simons action. Its torus trace is $u_e zeta_e$ at a plus end, where $u_e = t_e T_e$, and is in the $xi_e$ polarization at a minus end. The strip forms and torus normalizations are those of [22] Sections 4 and 6.3.
  After this normalization, gauges equal to identity on the tori put the flat restrictions on the cuts into their central or perturbed edge slices. The boundary traces agree exactly in the residual quotient: at a plus end $G_(beta_e) = 1$ forces $v_e = 0$ there, while at a minus end both traces have zero $alpha_e$ coefficient and the same based $beta_e$ logarithm. The torus-identity slice gauge of [22] Lemma 4.4 therefore applies at every end, and the gauges on intersecting faces agree. Lift the edge coordinates and gauge logarithms from $R_v \/ cal(I)_v$ to $R_v$, and extend the logarithms through collars. The lifting and division argument in [22] Section 6.3 uses a fixed finite residual list: coefficientwise formal division expresses each discrepancy as an actual sum $sum_a r_(v \, a) gamma_a$ of form-valued series. Every output coefficient uses finitely many input coefficients. This also works in the punctured form complex. Finally change the lifted connection by such ideal multiples so that its restriction to $K_v$ is exactly the strip representative. Call the result $hat(a)_v$.
  The curvature of $hat(a)_v$ lies in $cal(I)_v$, and its edge restrictions agree with the chosen slices modulo that ideal. The added ideal multiples change the leading curvature coefficient forms in (10.6) only by exact forms; the gauges have identity constant term. Stokes’ formula gives
  $ cal(C)_(partial V_v) \( hat(a)_v \) = 1 / 2 integral_(V_v) "tr" \( cal(F)_(hat(a)_v) and cal(F)_(hat(a)_v) \) in cal(I)_v^2 . $
  The outside-face contribution is zero. Interpolating an edge restriction to its chosen slice has an interior action variation in $cal(I)_v^2$: the displacement and the curvature are both in $cal(I)_v$. At a minus end the boundary variation is zero because both traces are in the $xi_e$ polarization. At a plus end the traces change from $u_e zeta_e$ to $u_e zeta_e + v_e xi_e$, and the torus variation is
  $ - epsilon.alt_e / 2 "tr" \( u_e v_e \) . $
  The adjustment in the perturbed edge potential cancels this term exactly. Reversing the orientation of a boundary face changes its action by a sign. Summing these per-end formulas proves the first identity of (10.7), including all mixed parameter terms.
  The internal edge variation formula pairs slice curvature with a derivative of the slice. It gives the second identity with an actual coefficient matrix against the fixed list $r_v$. At the joint origin its entry for an edge tangent representative $theta_(e \, k)$ and a vertex residual representative $omega_(v \, a)$ is, with the face sign,
  $ integral_(Y_e) "tr" \( theta_(e \, k) and omega_(v \, a) \|_(Y_e) \) . $
  Here $theta_(e \, k)$ is a closed relative one-form. Added exact two-forms do not change this pairing, by integration by parts and its zero boundary trace. Injectivity of the vertex $H^2$ restriction and the perfect pairing (10.2) make this matrix have full column rank. Its selected minor is a unit. This argument computes the coefficient matrix from curvature, and so does not assume that the residual list has no syzygies. Finally, every lift has the same first derivatives as its residual-quotient restriction because $cal(I)_v$ has order at least two. These are exactly the cohomological tangent maps already identified. ◻
]

We can now arrange exact zero action without changing a flat marking. Apply [22] Lemma 6.4 separately at each vertex to (10.7). Its hypotheses are visible here: $cal(I)_v$ has order at least two, and the internal Hessian of $cal(S)_v^(upright("form"))$ vanishes at the joint origin, since the central potentials have order at least three and all other terms carry a parameter. The correction is by $cal(I)_v$-multiples, preserves the tangent, and leaves the gradient ideal equal to $cal(I)_v$.

More explicitly, a unit full-column minor of $L_v$ expresses an error in $frak(m)_v^n cal(I)_v^2$ as the internal gradient paired with a displacement in $frak(m)_v^n cal(I)_v$. Cancel that linear error. The Hessian condition puts the Taylor remainder in $frak(m)_v^(2 n + 1) cal(I)_v^2$ and changes the gradient coefficient matrix only by a matrix in $frak(m)_v^(n + 1)$. Iteration converges and preserves its unit minor. Holding the list $r_v$ fixed throughout gives corrected sections with

#[#set math.equation(numbering: n => "(10.9)")
 $ cal(S)_v^(upright("form")) \( M_v^(upright("form")) \) = 0 \, #h(2em) #scale(x: 120%, y: 120%)[\(] \( partial_h cal(S)_v^(upright("form")) \) \( M_v^(upright("form")) \) #scale(x: 120%, y: 120%)[\)] = cal(I)_v . $ <for:exact-before-algebraic>]

When $q_v = 0$, the ideal is zero and no correction is needed. Everything so far is local to a vertex except for the common edge coordinates and background. In particular it applies to a vertex with no plus ends as well. From now on write $M_v$ for these corrected sections, retaining that notation when the sections are transported through subsequent coordinate changes and recentering.

=== 10.5 Algebraic coordinates and recentering <algebraic-coordinates-and-recentering>

We have exact formal equations and their actual gradient ideals. The tensor theorem also requires algebraic edge functions. We use the marked algebraicity theorem [22] Theorem 5.1, whose formal comparison is [22] Proposition 5.2. Separately on every edge, it gives an invertible formal coordinate change making the central potential an algebraic germ $F_e$, together with algebraic matrix lifts $G_e$ of the marked $beta_e$ holonomy on its full critical scheme. Choose $G_e \( 0 \) = 1$. Transport all vertex sections and residual identifications along these changes.

In these coordinates, (10.5) says that the perturbation coefficient differs from

$ ell_e \( G_e \) = - epsilon.alt_e "tr" \( T_e log G_e \) $

by an element of $"Jac" \( F_e \)$. A separate internal coordinate change linear in $t_e$ absorbs that difference exactly. Write $b_e^(upright("form")) - ell_e \( G_e \) = sum_k c_(e \, k) partial_(h_(e \, k)) F_e$, and introduce new coordinates $x_e = h_e + t_e c_e \( h_e \)$. The identity

$ F_e \( h_e + t_e c_e \( h_e \) \) = F_e \( h_e \) + t_e sum_k c_(e \, k) \( h_e \) partial_(h_(e \, k)) F_e \( h_e \) $

is exact because $t_e^2 = 0$, so the potential expressed in $x_e$ is $F_e \( x_e \) + t_e ell_e \( G_e \( x_e \) \)$. Rename $x_e$ as $h_e$. Such a change is made only at the plus end carrying that parameter, and is identity at parameter zero. Thus both endpoints retain the same central coordinates and potential; the minus end still uses just $- F_e$. Exact vanishing, the gradient ideal, and the quotient marking are transported with the sections.

The prescribed flat background has coordinates $y_v^0 \( sigma \)$ and $h_e^0 \( sigma \)$ of positive $sigma$ order. The two endpoint sections have the same $h_e^0$, because their flat restrictions use the common marked background, and all section corrections vanished on the residual quotients. As in [22] Section 6.5, recenter by

$ y_v = y_v^0 \( sigma \) + z_v \, #h(2em) h_e = h_e^0 \( sigma \) + z_e $

#emph[before] adjoining Laurent coefficients. These substitutions are continuous in the joint formal rings: every coefficient in $z$ is a $sigma$-adically convergent sum. Only afterward pass to $K = bb(C) \( \( sigma \) \)$ and complete in the new internal coordinates. Rename these coordinates $y_v \, h_e$.

The shifted $F_e$ and $G_e$ remain algebraic germs over $K$, by substitution into their finite algebraic presentations. The background is central-critical and its port holonomies are trivial, so $G_e \( 0 \) = 1$. Also $F_e \( 0 \) = 0$: along the original formal background curve its derivative with respect to $sigma$ is zero, since the central gradient vanishes there, and its value at $sigma = 0$ is zero. The full-column minors, the injective tangent minors, and the determinant in (10.1) all had nonzero constant term at the joint origin. Evaluating at the background leaves units in $bb(C) \[ \[ sigma \] \]$, hence nonzero elements of $K$.

We keep the notation $r_v \, cal(I)_v$ for the recentered list and ideal in $T_v \[ \[ y_v \] \]$. They may now have linear terms. We shall not again use their earlier quadratic order. Subsequent substitutions into Laurent-coefficient series are centered, or have only nilpotent parameter constants; no such series is translated by a nonzero $sigma$-dependent constant after this passage.

=== 10.6 Four-slot laws in the residual ideals <four-slot-laws-in-the-residual-ideals>

We now use the marked laws for the first time in the formal calculation. Fix $v$ and a law set $L in cal(L)_v$, ordered as two red–blue pairs. Let $X_1 \, dots.h \, X_4$ be lifts of the based port logarithms to $T_v \[ \[ y_v \] \]$ that vanish at the recentered background. Fix these four lifts once for the entire family of laws on $L$. Evaluate each marked word using those lifts and its prescribed extra-loop conjugators. This off-shell word expression agrees with the actual law holonomy in the flat quotient; no off-shell homotopy invariance of path holonomy is assumed. Define $cal(J)_L$ to be the ideal generated by all products of one matrix coordinate from each $X_j$.

Every corresponding law holds in the flat quotient by $cal(I)_v$, because its marked curve bounds a disk in $V_v$. Before making that quotient, each entry of a law minus identity belongs to $cal(J)_L$. Indeed the law is Brunnian in its four slots: setting any one slot equal to zero makes the logarithmic expression trivial. Its leading terms, up to the fixed signs and an invertible overall conjugation, are scalar entries of

#[#set math.equation(numbering: n => "(10.10)")
 $ \[ \[ "Ad" \( g_(a_1) \) X_1 \, "Ad" \( g_(a_2) \) X_2 \] \, \[ "Ad" \( g_(a_3) \) X_3 \, "Ad" \( g_(a_4) \) X_4 \] \] \, $ <for:four-linear-law>]

with $a_1 \, a_2 \, a_3 \, a_4 in { 1 \, dots.h \, 9 }$ chosen independently. Internal basing changes in the marked body are words in its four tips; they are identity when the tips vanish and change only higher terms. Every higher term belongs to $frak(m)_v cal(J)_L$, where now $frak(m)_v = \( y_v \, t \)$ is the recentered maximal ideal. These statements are first identities in independent logarithms and then remain ideal statements under their substitution in the vertex ring.

The multilinear tensor $\[ \[ U_1 \, U_2 \] \, \[ U_3 \, U_4 \] \]$ on $frak(s l)_2$ is nonzero. For example, with $\[ h_0 \, e_0 \] = 2 e_0$ and $\[ h_0 \, f_0 \] = - 2 f_0$, its value at $\( h_0 \, e_0 \, h_0 \, f_0 \)$ is $- 4 h_0$. Because the prescribed adjoints span the full endomorphism algebra over $K$, their independent actions on the four inputs of this nonzero tensor span every scalar coordinate product. To see this directly, choose input vectors on which the tensor is nonzero and an output functional detecting it; rank-one endomorphisms send any selected input coordinate to those vectors. Expanding each such endomorphism in the prescribed adjoints expresses the desired coordinate product as a linear combination of the scalar tests in (10.10).

Let $Q_L$ be the ideal generated by the entries of the actual marked law matrices minus identity, for all the specified conjugators and signs; these are the relations, not merely their leading terms. The preceding calculation gives

$ Q_L subset cal(J)_L ∩ cal(I)_v \, #h(2em) cal(J)_L = Q_L + frak(m)_v cal(J)_L . $

Nakayama’s lemma for the finitely generated module $cal(J)_L \/ Q_L$ yields

#[#set math.equation(numbering: n => "(10.11)")
 $ cal(J)_L subset cal(I)_v . $ <for:four-product-ideal>]

This is the four-slot, mixed-endpoint version of [22] Lemma 6.6; the proof uses neither reducedness nor flatness over the parameter ring.

Partition $L = I product.co J$ by the plus and minus designations. In the flat quotient, every plus logarithm is $- t_i T_i$. Choose a nonzero coordinate of each $T_i$. At a minus end use instead the variable port holonomy, which is its marked $beta_j$ holonomy. Since each entry of $exp \( X_j \) - 1$ is in the ideal generated by the entries of $X_j$, (10.11) implies that

#[#set math.equation(numbering: n => "(10.12)")
 $ (product_(i in I) t_i) product_(j in J) \( G_j - 1 \)_(a_j b_j) \( M_v \) in cal(I)_v $ <for:mixed-holonomy>]

for every choice of one matrix entry at each minus end. Here the algebraic $G_j$ agrees with the indicated holonomy on the section modulo $cal(I)_v$, since that end uses the central slice. Extra nilpotents from plus ends outside $L$ remain in the same ring and do not alter this argument.

=== 10.7 Polynomial perturbations and completion of the proof <polynomial-perturbations-and-completion-of-the-proof>

The remaining perturbation coefficients $ell_e \( G_e \)$ contain formal logarithms. Replace them by the algebraic germs

#[#set math.equation(numbering: n => "(10.13)")
 $ b_e = - epsilon.alt_e "tr" (T_e #scale(x: 120%, y: 120%)[\(] \( G_e - 1 \) - 1 / 2 \( G_e - 1 \)^2 #scale(x: 120%, y: 120%)[\)]) . $ <for:polynomial-weight>]

They vanish at the origin. We must restore exact vanishing after this replacement while retaining (10.12).

At a plus end, set its own parameter $t_e$ equal to zero while retaining all other parameters of that vertex. In the residual quotient the edge is then central-critical and has both peripheral holonomies trivial: $alpha_e$ is prescribed trivial, and $beta_e$ bounds in $K_v$. The marking property of $G_e$ therefore gives

$ G_e \( M_v \) - 1 in \( cal(I)_v \, t_e \) . $

This is a quotient-ring identity. The earlier coordinate change linear in $t_e$ becomes identity under this specialization. The logarithmic remainder $R_e = ell_e \( G_e \) - b_e$ has order at least three in the entries of $G_e - 1$, and its internal derivatives have order at least two there. Consequently

#[#set math.equation(numbering: n => "(10.14)")
 $ t_e R_e \( M_v \) in t_e cal(I)_v^3 \, #h(2em) t_e \( partial_h R_e \) \( M_v \) in t_e cal(I)_v^2 \, $ <for:replacement-estimates>]

because $t_e^2 = 0$. Write $frak(t)_v = \( t_e : e in E_(+) \( v \) \)$. The replaced function $cal(S)_v$ has value in $frak(t)_v cal(I)_v^2$ on the existing section, and its gradient is a matrix times the same fixed list $r_v$, still with a unit full-column minor.

Apply the nilpotent correction of [22] Lemma 3.9. Its mechanism also explains why the recentered Hessian need not vanish. An error in $frak(t)_v^n cal(I)_v^2$ is canceled to first order by a displacement in $frak(t)_v^n cal(I)_v$, using the unit minor. The Taylor remainder belongs to $frak(t)_v^(2 n) cal(I)_v^2$, and the gradient coefficient matrix changes by a $frak(t)_v^n$-multiple. Since $frak(t)_v$ is nilpotent, iteration terminates. The resulting section still agrees with the old one modulo $cal(I)_v$, and

$ cal(S)_v \( M_v \) = 0 \, #h(2em) #scale(x: 120%, y: 120%)[\(] \( partial_h cal(S)_v \) \( M_v \) #scale(x: 120%, y: 120%)[\)] = cal(I)_v . $

There is no correction at a vertex with no plus ends. In every case the central tangent is unchanged. The corrections allow all products of distinct parameters; they do not replace $frak(t)_v$ by a square-zero ideal.

Each $b_j$ in (10.13) is a polynomial without constant term in entries of $G_j - 1$. Equation (10.12) therefore gives (10.4), and the last corrections preserve it because they are identity modulo $cal(I)_v$.

Finally, these sections are smooth formal graphs over the full ring $T_v$. Choose a linear projection of the incident edge coordinates that is invertible on the central tangent of $M_v$. Its composite with $M_v$ has invertible Jacobian over $T_v \[ \[ y_v \] \]$, since it does modulo $frak(t)_v$. Its constant term may lie in the nilpotent ideal $frak(t)_v$; translation by such a constant is a legitimate formal substitution. The formal inverse theorem thus puts the section into graph form. The same reparametrization transports all memberships. The central tangent difference remains the isomorphism (10.1), transported through common invertible central edge coordinates. This proves Proposition 55.

#proof[
  A marked filling would give the cut pieces of Lemma 53, and hence the formal data of Proposition 55 on $Gamma_d$. Its law family consists of every choice of two red and two blue incident edges. Corollary 46 forbids exactly these data when $d$ is odd. This contradiction proves the proposition. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Artin, #emph[Algebraic approximation of structures over complete local rings], Publ. Math. Inst. Hautes Études Sci. #strong[36] (1969), 23--58. #link("https://doi.org/10.1007/BF02684596")[doi:10.1007/BF02684596].]
#bibitem([2])[A.~Bartels and W.~Lück, #emph[The Borel conjecture for hyperbolic and CAT(0)-groups], Ann. of Math. (2) #strong[175] (2012), no.~2, 631--689. #link("https://doi.org/10.4007/annals.2012.175.2.5")[doi:10.4007/annals.2012.175.2.5].]
#bibitem([3])[M.~Bestvina and M.~Feighn, #emph[Stable actions of groups on real trees], Invent. Math. #strong[121] (1995), 287--321. #link("https://doi.org/10.1007/BF01884300")[doi:10.1007/BF01884300].]
#bibitem([4])[J.~Block and S.~Weinberger, #emph[On the generalized Nielsen realization problem], Comment. Math. Helv. #strong[83] (2008), no.~1, 21--33. #link("https://doi.org/10.4171/CMH/116")[doi:10.4171/CMH/116].]
#bibitem([5])[A.~Borel, #emph[Letter to Jean-Pierre Serre], May~2, 1953, reproduced with commentary by A.~Ranicki in #emph[The birth of the Borel conjecture], September~22, 2016. #link("https://www.maths.ed.ac.uk/~v1ranick/surgery/borel.pdf").]
#bibitem([6])[M.~R.~Bridson and A.~Haefliger, #emph[Metric spaces of non-positive curvature], Grundlehren der mathematischen Wissenschaften, vol.~319, Springer-Verlag, Berlin, 1999. #link("https://doi.org/10.1007/978-3-662-12494-9")[doi:10.1007/978-3-662-12494-9].]
#bibitem([7])[V.~Chepoi, #emph[Graphs of some CAT(0) complexes], Adv. Appl. Math. #strong[24] (2000), no.~2, 125--179. #link("https://doi.org/10.1006/aama.1999.0677")[doi:10.1006/aama.1999.0677].]
#bibitem([8])[M.~W.~Davis, #emph[Groups generated by reflections and aspherical manifolds not covered by Euclidean space], Ann. of Math. (2) #strong[117] (1983), no.~2, 293--324. #link("https://doi.org/10.2307/2007079")[doi:10.2307/2007079].]
#bibitem([9])[M.~W.~Davis, #emph[The geometry and topology of Coxeter groups], London Mathematical Society Monographs Series, vol.~32, Princeton University Press, Princeton, NJ, 2008.]
#bibitem([10])[M.~Davis, K.~Hayden, J.~Huang, D.~Ruberman, and N.~Sunukjian, #emph[Exotic aspherical $4$-manifolds], Ann. of Math. (2) #strong[204] (2026), no.~2, 777--794. #link("https://doi.org/10.4007/annals.2026.204.2.6")[doi:10.4007/annals.2026.204.2.6].]
#bibitem([11])[F.~T.~Farrell and L.~E.~Jones, #emph[Compact negatively curved manifolds (of dim $eq.not 3 \, 4$) are topologically rigid], Proc. Natl. Acad. Sci. USA #strong[86] (1989), no.~10, 3461--3463. #link("https://doi.org/10.1073/pnas.86.10.3461")[doi:10.1073/pnas.86.10.3461].]
#bibitem([12])[M.~H.~Freedman and F.~Quinn, #emph[Topology of $4$-manifolds], Princeton Mathematical Series, vol.~39, Princeton University Press, Princeton, NJ, 1990.]
#bibitem([13])[M.~Gutierrez and A.~Kaul, #emph[Automorphisms of right-angled Coxeter groups], Int. J. Math. Math. Sci. #strong[2008] (2008), Article ID 976390, 10 pp. #link("https://doi.org/10.1155/2008/976390")[doi:10.1155/2008/976390].]
#bibitem([14])[M.~Gutierrez, A.~Piggott, and K.~Ruane, #emph[On the automorphisms of a graph product of abelian groups], Groups Geom. Dyn. #strong[6] (2012), no.~1, 125--153. #link("https://doi.org/10.4171/GGD/153")[doi:10.4171/GGD/153].]
#bibitem([15])[A.~J.~S.~Hamilton, #emph[The triangulation of $3$-manifolds], Quart. J. Math. Oxford Ser. (2) #strong[27] (1976), no.~1, 63--70. #link("https://doi.org/10.1093/qmath/27.1.63")[doi:10.1093/qmath/27.1.63].]
#bibitem([16])[A.~Hatcher, #emph[Algebraic topology], Cambridge University Press, Cambridge, 2002.]
#bibitem([17])[W.-C.~Hsiang and C.~T.~C.~Wall, #emph[On homotopy tori II], Bull. London Math. Soc. #strong[1] (1969), no.~3, 341--342. #link("https://doi.org/10.1112/blms/1.3.341")[doi:10.1112/blms/1.3.341].]
#bibitem([18])[Q.~Khan, #emph[Homotopy invariance of $4$-manifold decompositions: Connected sums], Topology Appl. #strong[159] (2012), no.~16, 3432--3444. #link("https://doi.org/10.1016/j.topol.2012.08.005")[doi:10.1016/j.topol.2012.08.005].]
#bibitem([19])[M.~Kreck and W.~Lück, #emph[Topological rigidity for non-aspherical manifolds], Pure Appl. Math. Q. #strong[5] (2009), no.~3, 873--914. #link("https://arxiv.org/abs/math/0509238").]
#bibitem([20])[W.~Lück, #emph[Survey on aspherical manifolds], in #emph[European Congress of Mathematics], European Mathematical Society, Zürich, 2010, 53--82. #link("https://doi.org/10.4171/077-1/4")[doi:10.4171/077-1/4].]
#bibitem([21])[J.~Milnor, #emph[On spaces having the homotopy type of a CW-complex], Trans. Amer. Math. Soc. #strong[90] (1959), no.~2, 272--280. #link("https://doi.org/10.1090/S0002-9947-1959-0100267-4")[doi:10.1090/S0002-9947-1959-0100267-4].]
#bibitem([22])[OpenAI, #emph[A marked tensor obstruction to four-dimensional disk embedding], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/A-marked-tensor-obstruction-to-four-dimensional-disk-embedding-September-24-2026/paper.pdf")[OAI:A-marked-tensor-obstruction-to-four-dimensional-disk-embedding-September-24-2026], 2026.]
#bibitem([23])[OpenAI, #emph[A PD4 group without an aspherical manifold model], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/A-PD4-group-without-an-aspherical-manifold-model-September-24-2026/paper.pdf")[OAI:A-PD4-group-without-an-aspherical-manifold-model-September-24-2026], 2026.]
#bibitem([24])[J.~Paixão and J.~Spreer, #emph[Random collapsibility and $3$-sphere recognition], #link("https://arxiv.org/abs/1509.07607v1")[arXiv:1509.07607v1] \[math.GT\], September 25, 2015.]
#bibitem([25])[F.~Paulin, #emph[Outer automorphisms of hyperbolic groups and small actions on $bb(R)$-trees], in #emph[Arboreal group theory] (Berkeley, CA, 1988), R.~C.~Alperin (ed.), Mathematical Sciences Research Institute Publications, vol.~19, Springer-Verlag, New York, 1991, 331--343. #link("https://doi.org/10.1007/978-1-4612-3142-4_12")[doi:10.1007/978-1-4612-3142-4\_12].]
#bibitem([26])[P.~Przytycki and J.~Świątkowski, #emph[Flag-no-square triangulations and Gromov boundaries in dimension $3$], Groups Geom. Dyn. #strong[3] (2009), no.~3, 453--468. #link("https://doi.org/10.4171/GGD/66")[doi:10.4171/GGD/66].]
#bibitem([27])[E.~Spanier, #emph[Singular homology and cohomology with local coefficients and duality for manifolds], Pacific J. Math. #strong[160] (1993), no.~1, 165--200. #link("https://doi.org/10.2140/pjm.1993.160.165")[doi:10.2140/pjm.1993.160.165].]
#bibitem([28])[J.~Stallings, #emph[Group theory and three-dimensional manifolds], Yale University Press, New Haven and London, 1971.]
#bibitem([29])[C.~A.~Weibel, #emph[An introduction to homological algebra], Cambridge Studies in Advanced Mathematics, vol.~38, Cambridge University Press, Cambridge, 1994.]


