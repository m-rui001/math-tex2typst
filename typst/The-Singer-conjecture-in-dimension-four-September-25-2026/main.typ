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

#align(center)[#text(size: 16pt, weight: "bold")[The Singer conjecture in dimension four]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The Singer conjecture predicts that the $L^2$-homology of the universal cover of a closed aspherical manifold is concentrated in its middle dimension. In dimension four, Poincaré duality reduces the problem to vanishing in degree one. The conclusion forces the Euler characteristic to be nonnegative. We prove this vanishing for closed aspherical topological four-manifolds and, more generally, for finite aspherical integral Poincaré complexes of formal dimension four.

A connected CW complex or manifold is #emph[aspherical] if its universal cover is contractible. Throughout, a closed manifold is compact and has no boundary. A #emph[finite integral Poincaré complex of formal dimension four] means a finite connected CW complex $Q$ equipped with an orientation character $w : pi_1 \( Q \) arrow.r { 1 \, - 1 }$ and a fundamental class $\[ Q \] in H_4 \( Q \; bb(Z)^w \)$ for which cap product gives duality in every degree with every local coefficient system, with the orientation twist on homology. This is absolute duality for $Q$, not duality for a Poincaré pair. Equivalently, the duality condition can be tested on the regular group-ring local system #cite(label("Wall1967")) Lemma 1.1.

For a discrete group $Gamma$, write $cal(N) Gamma$ for its group von Neumann algebra and $dim_(cal(N) Gamma)$ for the extended Murray–von Neumann dimension. If $tilde(Q) arrow.r Q$ is the universal cover, with deck group $Gamma = pi_1 \( Q \)$, set

$ b_p^(\( 2 \)) \( tilde(Q) \) = dim_(cal(N) Gamma) H_p #scale(x: 120%, y: 120%)[\(] cal(N) Gamma ⊗_(bb(Z) Gamma) C_(*)^s \( tilde(Q) \) #scale(x: 120%, y: 120%)[\)] \, $

where $C_(*)^s$ denotes singular chains. This definition applies to CW complexes and topological manifolds and agrees with the usual cellular definition #cite(label("Luck2002")) Definition 6.50 and Lemmas 6.51–6.53.

#thm([Theorem 1.1.])[
  #emph[Let $Q$ be a finite connected aspherical integral Poincaré complex of formal dimension four, with arbitrary orientation character. Then 
$ b_p^(\( 2 \)) \( tilde(Q) \) = 0 #h(2em) \( p gt.eq 0 \, med p eq.not 2 \) . $

]
] <thm:main>

#thm([Corollary 1.2.])[
  #emph[Let $M$ be a closed connected aspherical topological four-manifold. Then 
$ b_p^(\( 2 \)) \( tilde(M) \) = 0 #h(2em) \( p gt.eq 0 \, med p eq.not 2 \) . $

]
] <cor:singer-manifolds>

#proof[
  Lemma 3 supplies a finite aspherical integral Poincaré-complex homotopy model of $M$. A homotopy equivalence lifts to an equivariant homotopy equivalence of universal covers and preserves the singular-chain invariants above. Theorem 1 applies to the model. ◻
]

Corollary 2 establishes the Singer conjecture in dimension four. Neither orientability nor a geometric structure on $M$ is required. The substantive assertion is the vanishing in degree one; Poincaré duality supplies the other nonmiddle degrees. In particular, the corollary includes manifolds that admit no smooth structure or triangulation. The finite complex used for such a manifold is a homotopy model.

For every $Q$ in Theorem 1, the remaining invariant is

$ chi \( Q \) = b_2^(\( 2 \)) \( tilde(Q) \) gt.eq 0 . $

Thus $chi \( Q \) = 0$ exactly when all its $L^2$-Betti numbers vanish. For an oriented manifold $M$ in Corollary 2, the $L^2$-signature theorem also gives $chi \( M \) gt.eq \| sigma \( M \) \|$. Along a nested normal tower of finite covers with trivial subgroup intersection, $L^2$ approximation determines the limits of normalized rational Betti numbers. Section 11 gives the precise statements and proofs of these consequences.

The finite-Poincaré-complex extension was formulated in the earlier literature #cite(label("Luck2016Approximation")) Remark 11.3. It applies beyond manifold models: the companion #emph[A PD4 group without an aspherical manifold model] constructs a finite oriented aspherical integral Poincaré complex of formal dimension four whose fundamental group is not that of any closed aspherical topological four-manifold #cite(label("OpenAIPD4Nonmanifold2026")) Theorem 1.1. Theorem 1 applies to that example directly.

=== 1.1 History and significance <history-and-significance>

Atiyah’s $L^2$ index theorem explains the connection with Euler characteristic. For an elliptic operator on a closed smooth manifold, its index agrees with the von Neumann index of the lifted operator on a normal cover #cite(label("Atiyah1976")) Theorem 3.8 and Section 6.4. Applied to differential forms, this identifies the Euler characteristic with the alternating sum of the $L^2$-Betti numbers. Dodziuk’s analytic–simplicial comparison and homotopy-invariance theorem #cite(label("Dodziuk1977")) Theorems 1–2 connect this analytic description to topology. The algebraic definition used here also applies to finite complexes and topological manifolds without a smooth structure.

Dodziuk records Singer’s proposal to obtain the Euler-characteristic sign from vanishing of $L^2$-harmonic forms on universal covers #cite(label("Dodziuk1979")) p. 396. His discussion concerns nonpositive curvature. The later aspherical-manifold formulation asks that, for a closed aspherical $n$-manifold, the $L^2$-Betti numbers vanish whenever $p eq.not n \/ 2$; see #cite(label("DavisOkun2001")) Conjecture 0.3 and #cite(label("KirsteinKremerLuck2025")) Conjecture 4.1. For even $n = 2 m$, concentration would give $\( - 1 \)^m chi \( M \) = b_m^(\( 2 \)) \( tilde(M) \) gt.eq 0$. In dimension four the remaining vanishing question is $b_1^(\( 2 \)) = 0$: the degree-zero vanishing and Poincaré duality determine the other nonmiddle degrees. Lott and Lück’s work on three-manifolds #cite(label("LottLuck1995")) Theorem 0.1 illustrates an earlier route through geometric decomposition. In the closed case, their computation assumed that each prime factor had a finite cover homotopy equivalent to a Haken, Seifert, or hyperbolic manifold; geometrization later removed this restriction for closed aspherical three-manifolds.

Several four-dimensional cases precede the general result. Davis and Okun proved the vanishing for right-angled Coxeter groups whose nerves are flag triangulations of the three-sphere #cite(label("DavisOkun2001")) Theorem 11.1.1. Okun and Schreve established the Singer conjecture in dimensions at most four for groups of type $upright("VF")$ admitting a hierarchy, and for Coxeter groups whose nerves are arbitrary triangulations of the three-sphere #cite(label("OkunSchreve2016")) Theorems 4.16–4.17. Here type $upright("VF")$ means that a finite-index subgroup has a finite classifying space. A hierarchy, in their sense, repeatedly cuts a contractible manifold carrying a proper cocompact group action along invariant locally flat hypersurfaces with contractible components, ending in compact contractible pieces. The Singer conclusion concerns an initial manifold without boundary. These results permit topological manifolds. Their extra input is the specified decomposition, which is not supplied by Poincaré duality alone.

Complex geometry provides another route. The closed aspherical Kähler surface case follows from Gromov’s restriction on Kähler groups with positive first $L^2$-Betti number, as explained in #cite(label("AlbaneseDiCerboLombardi2025")) Theorem 4.1. Albanese, Di Cerbo and Lombardi also prove Singer vanishing for closed aspherical complex surfaces with residually finite fundamental group, and for those outside class $upright("VII")_0^(+)$ without that hypothesis #cite(label("AlbaneseDiCerboLombardi2025")) Theorems 1.5 and 4.2. Their residual-finite argument uses the Albanese map, classification of complex surfaces and $L^2$ approximation. Class $upright("VII")_0^(+)$ consists of minimal non-Kähler surfaces with Kodaira dimension $- oo$ and positive second Betti number. The separate companion global spherical shell theorem #cite(label("OpenAIGlobalSphericalShells2026")) Theorem 1.1 and Corollary 1.2 gives these surfaces fundamental group $bb(Z)$, excluding asphericity because an aspherical complex surface with that group would be homotopy equivalent to $S^1$ and have zero second Betti number. Combined with the cited Theorem 4.2, this gives an independent argument for the complex-surface case. It is not an input to the proof below.

Avramidi, Okun and Schreve prove the conjecture for the even-dimensional Gromov–Thurston cyclic branched covers arising from a closed oriented hyperbolic manifold and two separating transverse totally geodesic hypersurfaces #cite(label("AvramidiOkunSchreve2025")) Section 3, p. 2628. The branch locus is their intersection; the cyclic covering is specified by algebraic intersection with a chosen half of one hypersurface. Their cutting argument covers every positive branching degree in this even-dimensional setting. The proof here uses the algebraic consequences of integral Poincaré duality to construct a boundary and control its topology.

Finite-energy functions have a classical role in constructing boundaries. For graphs, the Royden compactification uses all bounded functions of finite Dirichlet energy #cite(label("KellerLenzSchmidtWojciechowski2017")) Section 4. We select a countable invariant family and add coordinates recording components of coordinate neighborhoods. This produces a metrizable boundary; its convergence dynamics and graph-path properties are proved directly. Bowditch’s complete median pretree and dendritic quotient organize the cut points #cite(label("Bowditch1999Treelike")) #cite(label("Bowditch1999Connected")). The invariant finite-interval reduction in the all-parabolic case and the continuous retraction onto a block require the additional arguments given below. Our separation counts adapt Bowditch’s annulus-system method #cite(label("Bowditch1998Topological")) Sections 6–7; the component labels and the threshold uniform over all sufficiently deep paths are proved in the present setting. The path-pushing strategy follows the Bestvina–Mess viewpoint as expounded by Hruska and Ruane #cite(label("HruskaRuane2024")) Sections 1 and 3. Here annular depth, component labels, and three anchors adapt that strategy to graphs that may have infinite valence and infinite stabilizers; the word-hyperbolic local-connectivity theorem is not being applied.

=== 1.2 The proof in outline <the-proof-in-outline>

Suppose the first $L^2$-Betti number is positive. A finite presentation of $Gamma$ gives a locally finite Cayley graph, and the corresponding reduced $L^2$-cohomology supplies a bounded function of finite Dirichlet energy whose behavior at infinity is nonconstant. Here finite energy means that the sum of the squared differences across all graph edges is finite.

We use translates of this function to build a compactification $X = Gamma union.sq B$. Its boundary $B$ is a nondegenerate continuum, meaning a compact connected metric space with more than one point. Additional coordinates distinguish the graph components of suitable coordinate neighborhoods. This construction ensures a precise connectivity property: vertices tending to the same boundary point can be joined by paths whose vertices tend uniformly to that point. This is a property of paths in the graph; local connectivity of $B$ will require a separate argument.

The square-summable edge lengths in $X$ control translated level sets. They give a #emph[convergence action] on $B$: every sequence of distinct group elements has a subsequence converging uniformly on compact sets away from one boundary point to a constant. They also give $dim B lt.eq 1$ for covering dimension. The group-ring cohomology vanishing supplied by Poincaré duality also gives $caron(H)^1 \( B \; bb(F)_2 \) = 0$. A #emph[cut point] is a point whose removal disconnects the space. If $B$ has no cut points, set $L = B$. Otherwise, Bowditch’s theory of pretrees reduces the problem to a subcontinuum $L subset B$ without cut points. It is a retract: there is a continuous map $B arrow.r L$ fixing every point of $L$. We give the required extension of the finite-interval reduction to parabolic cut points explicitly. The resulting $L$ remains nondegenerate and satisfies

$ dim L lt.eq 1 \, #h(2em) caron(H)^1 \( L \; bb(F)_2 \) = 0 . $

The remaining step is local connectivity of $L$. We measure how deeply graph vertices lie in a boundary neighborhood by chains of nested annuli. Cohomology makes the nearby component labels well defined, and convergence dynamics makes those labels stable as the depth increases. A key point is uniformity: after fixing the neighborhood and a finite list of edge and stabilizer moves, one depth threshold works for every deeper graph path, independently of its endpoints and length. We obtain this threshold from three fixed boundary points and a majority-label argument. Thus paths can be pushed to arbitrary depth while their endpoints approach two prescribed nearby boundary points. Limits of these paths give small connected subsets of $L$. This argument applies even when the auxiliary graph has infinite stabilizers and infinite valence; it uses compactness of the ambient space in place of local finiteness of that graph.

Finally, the dimension and cohomology properties imply that $L$ contains no embedded circle. A locally connected compact metric continuum without an embedded circle is called a #emph[dendrite]. Every nondegenerate dendrite has a cut point, giving the contradiction. The finite-energy compactification and the annular argument are the two constructions that connect the cohomological input to this continuum-theoretic conclusion.

The topological input is used before any boundary is constructed: a finite four-dimensional homotopy model supplies finite cellular chains, local-coefficient duality supplies the group-ring cohomology vanishings, and von Neumann dimension identifies the positive first $L^2$ class with a finite-energy gradient. Later, Bowditch’s pretree theorems apply to a continuum before local connectivity is known. The latter is obtained only after the retraction and uniform path argument. This order is essential, since the block stabilizer may be infinitely generated and its graph may have infinite valence.

Section 2 establishes the algebraic and topological inputs. Sections 3–4 construct the boundary and its dynamics; Section 5 proves its dimension and cohomology properties. Sections 6–7 remove cut points. Sections 8–9 prove local connectivity, Section 10 completes the proof, and Section 11 derives the consequences stated above.

== 2 Topological and algebraic reductions <sec:foundations>

Fix a finite connected aspherical integral Poincaré complex $Q$ of formal dimension four, with the absolute duality convention of the introduction, and put $Gamma = pi_1 \( Q \)$ and $k = bb(F)_2$. This section reduces Theorem 1 to a statement about functions on a Cayley graph. We first justify the topological and coefficient conventions, then extract the group-theoretic restrictions needed below.

#thm([Lemma 2.1.])[
  #emph[The complex $Q$ is homotopy equivalent to a finite four-dimensional CW complex. The group $Gamma$ is infinite, finitely presented, and torsion-free.]
  #emph[Every closed connected aspherical topological four-manifold is homotopy equivalent to a finite connected aspherical integral Poincaré complex of formal dimension four.]
] <found:model>

#proof[
  Wall’s dimension theorem #cite(label("Wall1967")) Theorem 2.2 gives a four-dimensional CW complex homotopy equivalent to $Q$. It can be chosen finite because $Q$ is finite, so its reduced finiteness obstruction vanishes. The model is aspherical, and its universal cover is contractible. Its augmented cellular chain complex is consequently a free $bb(Z) Gamma$-resolution of $bb(Z)$ of length four. In particular, $Gamma$ is finitely presented and has finite integral cohomological dimension. To see directly why it has no torsion, a finite-order element would yield a subgroup $C$ of prime order. Restricting the resolution to $bb(Z) C$ preserves freeness and finite length. This contradicts the usual two-periodic resolution of a cyclic group, which gives nonzero groups $H^(2 j) \( C \; bb(Z) \)$ for every $j gt.eq 1$. If $Gamma$ were finite, torsion-freeness would make it trivial, so asphericity would make $Q$ contractible. But duality over $k$ gives $H_4 \( Q \; k \) tilde.equiv H^0 \( Q \; k \) tilde.equiv k$. Hence $Gamma$ is infinite.
  For the manifold assertion, let $M$ be a closed connected aspherical topological four-manifold. A compact topological manifold is metrizable. Its coordinate neighborhoods are absolute neighborhood retracts, so Hanner’s locality theorem makes $M$ an absolute neighborhood retract; see #cite(label("Hanner1951")) Theorems 3.2–3.3. To check its covering dimension, shrink a finite coordinate cover to a finite closed cover. Each member has small inductive dimension at most four, by the subspace theorem and the dimension of Euclidean space. The closed-sum and coincidence theorems give $dim M lt.eq 4$; conversely, a coordinate chart contains a copy of an open four-ball, so subspace monotonicity gives $dim M gt.eq 4$. These dimension facts are #cite(label("Engelking1978")) Theorems 1.1.2, 1.5.3, 1.7.7 and 1.8.2. West’s homotopy dimension estimate #cite(label("West1977")) Corollary 5.4 therefore supplies a finite four-dimensional simplicial complex homotopy equivalent to $M$. This complex is a homotopy model, not a triangulation of the manifold. It is aspherical. Transport the orientation character and fundamental class of $M$ to this model. Topological Poincaré duality with the orientation local system gives cap-product isomorphisms for every local coefficient system on $M$ #cite(label("Sun2017")) Theorem 1, with $R = bb(Z)$. Since $M$ is compact, compactly supported cohomology there is ordinary cohomology. Transporting these isomorphisms along the homotopy equivalence gives the required absolute integral duality on the model; see also #cite(label("Spanier1993")) Theorem 10.2 and Remark 10.3, and #cite(label("FNOP2025")) Theorem A.16 for the oriented chain version. ◻
]

=== 2.1 The singular-chain definition and duality <the-singular-chain-definition-and-duality>

We write $b_p^(\( 2 \)) \( tilde(Q) \)$ for the invariant defined using $cal(N) \( Gamma \) ⊗_(bb(Z) Gamma) C_(*)^s \( tilde(Q) \)$. The following comparison explains the passage from that definition to finite cellular matrices and, later, to a presentation graph.

#thm([Lemma 2.2.])[
  #emph[Let $Lambda$ be a group and let $P_(*)$ be a free $bb(Z) Lambda$-resolution of $bb(Z)$ whose terms in degrees $0 \, 1 \, 2$ are finitely generated. Suppose that a contractible space $Z$ has a free $Lambda$-action for which its singular chains are free $bb(Z) Lambda$-modules. Then 
$ b_1^(\( 2 \)) \( Z \; cal(N) \( Lambda \) \) = dim_(cal(N) \( Lambda \)) #scale(x: 120%, y: 120%)[\(] ker partial_1 ∩ ker partial_2^(*) #scale(x: 120%, y: 120%)[\)] \, $

 where the operators on the right act on the finite Hilbert modules $ell^2 \( Lambda \) ⊗_(bb(Z) Lambda) P_i$. The same space represents first reduced Hilbert cohomology for $d_0 = partial_1^(*)$ and $d_1 = partial_2^(*)$. The analogous comparison holds in every degree of a finite free cellular complex.]
] <found:comparison>

#proof[
  The augmented singular chains of $Z$ are a free resolution of $bb(Z)$. The comparison theorem for free resolutions gives chain homotopy equivalences with $P_(*)$. Tensoring preserves these homotopies, so it preserves the homology in the definition of $b_1^(\( 2 \))$; no flatness of $cal(N) \( Lambda \)$ over the group ring is required.
  The remaining assertion is the finite-matrix comparison for von Neumann dimension. For a matrix over $cal(N) \( Lambda \)$, the algebraic kernel has dimension equal to the trace of the projection onto its Hilbert kernel. The algebraic image has dimension equal to the trace of the projection onto the closure of its Hilbert image. Additivity of dimension thus identifies the dimension of first algebraic homology with that of
  $ ker partial_1 ⊖ overline("im" partial_2) = ker partial_1 ∩ ker partial_2^(*) . $
  On the other hand, the harmonic representative space for reduced cohomology is
  $ ker d_1 ⊖ overline("im" d_0) = ker partial_2^(*) ∩ ker partial_1 . $
  These are the same closed Hilbert submodule. The same argument works in each degree with finite free neighboring terms. This is the comparison underlying #cite(label("Luck2002")) Remark 1.31 and Lemmas 6.51–6.53. ◻
]

#thm([Lemma 2.3.])[
  #emph[For the Poincaré complex $Q$ fixed above, 
$ b_0^(\( 2 \)) \( tilde(Q) \) = b_4^(\( 2 \)) \( tilde(Q) \) = 0 \, #h(2em) b_3^(\( 2 \)) \( tilde(Q) \) = b_1^(\( 2 \)) \( tilde(Q) \) \, $

 and $b_p^(\( 2 \)) \( tilde(Q) \) = 0$ for $p > 4$. Consequently it suffices to prove $b_1^(\( 2 \)) \( tilde(Q) \) = 0$.]
] <found:reduction>

#proof[
  Use the finite four-dimensional model in Lemma 3. A homotopy equivalence with $Q$ lifts to an equivariant homotopy equivalence of universal covers, and cellular and singular chains compute the same invariant; see #cite(label("Luck2002")) Definition 6.50 and Lemmas 6.51–6.53. There are no cellular chains above degree four, proving the assertion for $p > 4$. A harmonic square-summable $0$-cochain on the connected universal cover is constant. Since $Gamma$ is infinite, that constant must be zero. The degree-zero version of Lemma 4 gives $b_0^(\( 2 \)) = 0$.
  Here is the duality argument, including nontrivial orientation characters. Let $Gamma^(+)$ be the kernel of the orientation character $Gamma arrow.r { 1 \, - 1 }$, and let $Q^(+)$ be the corresponding connected cover. Its degree $d = \[ Gamma : Gamma^(+) \]$ is either one or two. Finite-sheeted covers of Poincaré complexes are again Poincaré complexes of the same formal dimension #cite(label("Stark1996")) p. 567, paragraph preceding Corollary 4.4. The induced orientation character of $Q^(+)$ is the restriction to $Gamma^(+)$ and is trivial. Thus $Q^(+)$ is a finite connected aspherical oriented integral Poincaré complex of formal dimension four, and Lemma 3 supplies a finite four-dimensional homotopy model $F$.
  Transport the fundamental class of $Q^(+)$ to $F$. Poincaré duality with local coefficients applies to $Q^(+)$ and hence to $F$; see #cite(label("Wall1967")) Lemma 1.1. In particular, applying it to the regular group-ring local system shows that the cap-product map from the degree-reversed dual of $C_(*) \( tilde(F) \; bb(Z) \)$ to $C_(*) \( tilde(F) \; bb(Z) \)$ is a quasi-isomorphism. Here right modules are converted to left modules by the involution $g mapsto g^(- 1)$. Both complexes are bounded and finitely generated free over $bb(Z) Gamma^(+)$. The mapping cone is therefore a bounded acyclic complex of free modules, which is contractible: starting in its lowest degree, split each surjection onto the kernel already obtained. Thus cap product is a chain homotopy equivalence.
  Extend scalars to $cal(N) \( Gamma^(+) \)$. The homotopies are preserved, and finite-matrix dimension comparison identifies dual Hilbert complexes with equal von Neumann dimensions. It follows that
  $ b_p^(\( 2 \)) \( tilde(Q) \; cal(N) \( Gamma^(+) \) \) = b_(4 - p)^(\( 2 \)) \( tilde(Q) \; cal(N) \( Gamma^(+) \) \) \, #h(2em) 0 lt.eq p lt.eq 4 . $
  This is the finite-chain argument underlying the $L^2$-duality proof in #cite(label("Luck2002")) Theorem 1.35(3) and its proof; here Poincaré-complex duality supplies the required chain equivalence. Finally, finite-index scaling #cite(label("Luck2002")) Theorem 1.35(9) gives
  $ b_p^(\( 2 \)) \( tilde(Q) \; cal(N) \( Gamma^(+) \) \) = d thin b_p^(\( 2 \)) \( tilde(Q) \; cal(N) \( Gamma \) \) . $
  Dividing by $d$ proves the same duality for $Q$ and completes the reduction. ◻
]

=== 2.2 Cohomology, ends, and splittings <cohomology-ends-and-splittings>

For the boundary argument we use mod-two coefficients. If $J lt.eq Gamma$, write $k \[ Gamma \/ J \]$ for the left permutation module on left cosets. Its elements are finite sums of cosets.

#thm([Lemma 2.4.])[
  #emph[The group $Gamma$ satisfies 
$ H^i \( Gamma \; k Gamma \) = 0 quad \( i = 1 \, 2 \) . $

 For every subgroup $J lt.eq Gamma$ there is an isomorphism 
$ H^1 \( Gamma \; k \[ Gamma \/ J \] \) tilde.equiv H_3 \( J \; k \) . $

 In particular, this group vanishes when $J$ is finite or two-ended.]
] <found:duality>

#proof[
  The orientation twist of $Q$ is trivial over $k$. Since $Q$ is aspherical, its absolute integral Poincaré duality, applied to local systems of $k$-vector spaces, gives, for every left $k Gamma$-module $V$,
  $ H^i \( Gamma \; V \) tilde.equiv H_(4 - i) \( Gamma \; V \) . $
  For clarity, the induction used on the right is homological. Indeed, $k \[ Gamma \/ J \] = k Gamma ⊗_(k J) k$, and a free right $k Gamma$-resolution $R_(*)$ of $k$ satisfies
  $ R_(*) ⊗_(k Gamma) \( k Gamma ⊗_(k J) k \) tilde.equiv \( R_(*) \|_J \) ⊗_(k J) k . $
  Restriction to $k J$ preserves a free resolution. This proves $H_j \( Gamma \; k \[ Gamma \/ J \] \) tilde.equiv H_j \( J \; k \)$, the homological Shapiro isomorphism; compare #cite(label("Brown1982")) Chapter III, Section 6. Taking $J$ trivial gives the assertion for $k Gamma$, and taking $i = 1$ gives the displayed isomorphism for arbitrary $J$.
  A finite subgroup is trivial by Lemma 3. A two-ended group has a finite normal subgroup with quotient infinite cyclic or infinite dihedral; see #cite(label("Wall1967")) Lemma 4.1. If it is torsion-free the finite subgroup is trivial and the dihedral case is impossible; thus a two-ended subgroup of $Gamma$ is infinite cyclic. Both the trivial group and the infinite cyclic group have zero third homology over $k$. ◻
]

#thm([Lemma 2.5.])[
  #emph[The group $Gamma$ is one-ended.]
] <found:ends>

#proof[
  Choose a finite presentation, and consider its simply connected Cayley two-complex. Because there are finitely many cell orbits in degrees at most two, finite-support cellular cochains in these degrees identify with group-ring-valued equivariant cochains. Explicitly, a finite-support $k$-cochain $a$ corresponds to
  $ c mapsto sum_(g in Gamma) a \( g^(- 1) c \) g . $
  Taking the identity coefficient recovers $a$, and the identification commutes with coboundaries. The augmented cellular complex is exact in degrees zero and one; adjoining free modules in higher degrees extends it to a resolution without changing its cohomology calculation in degree one.
  Suppose that removing finitely many vertices of the Cayley graph leaves two infinite components. Let $f$ be the indicator of one infinite component, with value zero on the deleted vertices. Its gradient $d f$ is a finitely supported edge cochain, because the graph is locally finite, and it is a cellular cocycle. By Lemma 6, $d f = d u$ for a finitely supported vertex function $u$. Connectedness makes $f - u$ constant. This is impossible: $f$ takes each of its values on infinitely many vertices, whereas $u$ has finite support. The infinite connected locally finite Cayley graph has at least one end, so it has exactly one. ◻
]

We also need a form of the splitting obstruction that applies to tree actions arising during the proof. An action on a simplicial tree is #emph[without inversions] if no element exchanges the endpoints of an edge it preserves. It is #emph[minimal] if the tree has no proper nonempty invariant subtree.

#thm([Lemma 2.6.])[
  #emph[For an action of $Gamma$ without inversions on a simplicial tree:]
  + #emph[if the action has no fixed vertex, its edge stabilizers cannot all be finite or two-ended;]
  + #emph[if the action is minimal and the tree has an edge, every edge stabilizer is neither finite nor two-ended.]
  #emph[Consequently $Gamma$ has no nontrivial splitting over a finite or two-ended subgroup.]
] <found:trees>

#proof[
  Fix a vertex $o$ and an edge orbit $E$ whose stabilizer is $J$. Identify $E$ with $Gamma \/ J$, and define $c \( g \)$ to be the mod-two sum of the edges of $E$ on the geodesic $\[ o \, g o \]$. Cancellation of edges traversed twice gives
  $ c \( g h \) = c \( g \) + g c \( h \) . $
  If $J$ is finite or two-ended, Lemma 6 makes this cocycle principal: $c \( g \) = g v - v$ for some $v in k \[ Gamma \/ J \]$. Therefore
  #[#set math.equation(numbering: n => "(2.1)")
   $ \| \[ o \, g o \] ∩ E \| lt.eq 2 \| "supp" v \| #h(2em) \( g in Gamma \) . $ <found:crossing-bound>]
  For the first assertion, let $S$ be a finite generating set of $Gamma$. The paths $\[ o \, s o \]$, $s in S$, contain finitely many edges. Their translates contain every path $\[ o \, g o \]$, by writing $g$ as a word in $S$ and cancelling backtracking. Thus only finitely many edge orbits occur in these paths. An action without a fixed vertex has unbounded vertex orbits: a bounded tree orbit has an invariant center, which gives a fixed vertex when inversions are absent. Hence one of the finitely many edge-orbit crossing counts is unbounded. If all edge stabilizers were finite or two-ended, this would contradict (2.1).
  For the second assertion, fix any edge orbit $E$ and collapse each connected component of the union of edges outside $E$. The quotient is a nontrivial simplicial tree without inversions. It has no fixed vertex: the preimage of one would be a proper nonempty invariant subtree of the original tree. Its orbits are therefore unbounded, and distance in this quotient counts exactly the edges of $E$ in the original path $\[ o \, g o \]$. Again (2.1) excludes a finite or two-ended stabilizer. Apply this to the Bass–Serre tree to obtain the last assertion. ◻
]

=== 2.3 The Hilbert space of finite-energy gradients <the-hilbert-space-of-finite-energy-gradients>

We now translate the remaining contradiction assumption into the analytic input for the compactification. Choose a finite presentation of $Gamma$ with relators of length at most three; subdividing longer relators by new generators achieves this by Tietze transformations. Let $cal(C)$ be its Cayley two-complex and $G$ its graph. The vertex set is $Gamma$. The complex $cal(C)$ is simply connected, $G$ is connected and locally finite, and each cellular edge belongs to a uniformly bounded number of cell boundaries. Keep parallel edges and loops as separate cellular edges, and choose one orientation of each edge.

For a real function $f$ on $Gamma$ and an oriented edge $e = u v$, put $d f \( e \) = f \( v \) - f \( u \)$. Define

$ cal(D) & = {d f : f : Gamma arrow.r bb(R) \, med sum_(e in E \( G \)) \| d f \( e \) \|^2 < oo} \,\
cal(D)_0 & = overline({ d f : f upright(" has finite support") }) \, $

where the closure is in $ell^2 \( E \( G \) \; bb(R) \)$ and the sum counts each cellular edge once.

#thm([Lemma 2.7.])[
  #emph[The space $cal(D)$ is a closed real Hilbert subspace of $ell^2 \( E \( G \) \; bb(R) \)$, and $cal(D)_0 subset.eq cal(D)$. If $b_1^(\( 2 \)) \( tilde(Q) \) > 0$, then $cal(D)_0 eq.not cal(D)$.]
] <found:gradient>

#proof[
  Write $F \( cal(C) \)$ for the set of two-cells. The cellular coboundary
  $ d_1 : ell^2 \( E \( G \) \; bb(R) \) arrow.r ell^2 \( F \( cal(C) \) \; bb(R) \) $
  is bounded: each relator has at most three edges, counted with their cellular multiplicities, and edge–cell incidence is uniformly bounded. An ordinary cellular $1$-cocycle on $cal(C)$ is a gradient: integrate it along edge paths from a fixed vertex, using simple connectivity to show independence of the path. It follows that $cal(D) = ker d_1$, which is closed.
  Likewise $d_0 : ell^2 \( Gamma \; bb(R) \) arrow.r ell^2 \( E \( G \) \; bb(R) \)$ is bounded by the bounded vertex degree. Since finite-support functions are dense in $ell^2 \( Gamma \)$,
  $ overline("im" d_0) = cal(D)_0 . $
  This does not assert that $"im" d_0$ itself is closed.
  The augmented cellular chains of $cal(C)$ are exact in degrees zero and one. Extend them to a free resolution by choosing a free module $P_3$ mapping onto $ker \( partial_2 : C_2 \( cal(C) \) arrow.r C_1 \( cal(C) \) \)$, and then mapping free modules onto successive kernels. The original cellular terms in degrees zero, one, and two are retained and are finite free. The singular chains of $tilde(Q)$ are free $bb(Z) Gamma$-modules: a deck transformation fixing a singular simplex fixes its image points and is therefore the identity. Thus Lemma 4 applies. Over $bb(C)$, it identifies $b_1^(\( 2 \)) \( tilde(Q) \)$ with the dimension of $ker d_1 ⊖ overline("im" d_0)$. All matrices are real, so this complex Hilbert space is the complexification of $cal(D) ⊖ cal(D)_0$. If $cal(D) = cal(D)_0$, its dimension would be zero. The asserted strict inclusion follows. ◻
]

Henceforth assume, toward a contradiction, $b_1^(\( 2 \)) \( tilde(Q) \) > 0$. We have obtained a nonzero quotient $cal(D) \/ cal(D)_0$, together with one-endedness, the two cohomology vanishings, and the tree-action obstruction. The next construction turns this finite-energy information into a compact boundary.

== 3 A boundary from finite-energy functions <sec:compactification>

We now construct the compact space used in the boundary argument. The inputs are the group $Gamma$, its triangular Cayley $2$-complex $cal(C)$, its graph $G$, and the proper closed inclusion $cal(D)_0 subset.neq cal(D)$ obtained above. Thus $G$ is connected, locally finite, and one-ended; $cal(C)$ is simply connected; and the number of cells incident to an edge is uniformly bounded. We retain cellular edges, including parallel edges, in all energy sums. The output will be a compact metrizable space $X = Gamma union.sq B$, with a nondegenerate connected boundary $B$. In addition, vertices approaching the same boundary point will admit joining paths uniformly near that point. This last property concerns vertex paths in $G$; local connectivity of $B$ is a separate question.

=== 3.1 A function with connected level sides <a-function-with-connected-level-sides>

For a real function $F$ on the vertices, write

$ cal(E) \( F \) = sum_e \| d F \( e \) \|^2 \, #h(2em) d F \( e \) = F \( e^(+) \) - F \( e^(-) \) \, $

where one orientation of each cellular edge is used. We call $F$ a finite-energy function when $cal(E) \( F \) < oo$. A level $t$ is #emph[regular for $F$] if it is not a vertex value. At such a level put

$ S \( F \, t \) = { e : min \( F \( e^(-) \) \, F \( e^(+) \) \) < t < max \( F \( e^(-) \) \, F \( e^(+) \) \) } . $

These are the edges crossing the level. Two edges in a set of crossing edges are #emph[dually adjacent] if they occur on the boundary of a common $2$-cell. Dual components are components for this adjacency relation.

#thm([Lemma 3.1.])[
  #emph[There exists a finite-energy function $f : Gamma arrow.r \[ 0 \, 1 \]$ which does not tend to a single constant outside finite subsets of $Gamma$, and for which both ${ f < t }$ and ${ f > t }$ are connected vertex subgraphs whenever $0 < t < 1$ is regular for $f$. Every such $S \( f \, t \)$ is dually connected.]
] <compact:potential>

#proof[
  Fix a vertex $a$. For each $b eq.not a$, the functional
  $ L_b \( d f \) = f \( b \) - f \( a \) $
  is well defined on $cal(D)$. A finite path from $a$ to $b$ of length $ell$ gives $\| L_b \( d f \) \| lt.eq sqrt(ell) thin parallel d f parallel_2$. The functional is nonzero, as one sees by testing the gradient of the singleton indicator of $b$. Let $r_b in cal(D)$ be its Riesz representer. The unique gradient of minimum norm subject to $L_b \( d f \) = 1$ is
  $ d f_b = frac(r_b, parallel r_b parallel_2^2) \; $
  normalize its potential by $f_b \( a \) = 0$.
  The vectors $r_b$ span densely in $cal(D)$. Indeed, a gradient orthogonal to all of them has a potential constant at every vertex and is therefore zero. Since $cal(D)_0$ is a proper closed subspace, some $d f_b$ lies outside $cal(D)_0$. Fix this minimizer and write it as $d f$. Replacing $f$ by $min \( 1 \, max \( 0 \, f \) \)$ preserves the values $0 \, 1$ at $a \, b$ and cannot increase any edge energy. Uniqueness of the minimizer implies $0 lt.eq f lt.eq 1$.
  Suppose $f$ tends to a constant $c$ outside finite vertex sets. For $epsilon.alt > 0$ define
  $ u_epsilon.alt \( v \) = "sgn" \( f \( v \) - c \) max \( \| f \( v \) - c \| - epsilon.alt \, 0 \) . $
  Each $u_epsilon.alt$ has finite support. The function $\( f - c \) - u_epsilon.alt$ is the truncation of $f - c$ to $\[ - epsilon.alt \, epsilon.alt \]$, so its edge differences are bounded in absolute value by $\| d f \|$ and tend pointwise to zero. Dominated convergence gives $d u_epsilon.alt arrow.r d f$ in edge $ell^2$, contrary to $d f in.not cal(D)_0$.
  Fix a regular $t in \( 0 \, 1 \)$. If a component $U$ of ${ f > t }$ misses $b$, replace $f$ by $t$ on $U$. Both prescribed values are preserved. Internal edge energies decrease to zero. At a boundary edge with one endpoint in $U$, the other endpoint has value below $t$, so its energy decreases strictly. Such an edge exists because $G$ is connected and $a in.not U$. This modification is legitimate even when $U$ is infinite: each edge energy weakly decreases, and at least one decreases by a positive amount. It contradicts minimality. Hence every upper component contains $b$, and the upper side is connected. The lower side is connected by the same argument with $a$.
  Let $C$ be a dual component of $S \( f \, t \)$, and restrict the cochain $d 1_({ f > t })$ to $C$, setting it to zero on other edges. In any cell, all crossing edges lie in one dual component. The signed sum of the restricted cochain around that cell is therefore either the original zero sum or an entirely zero sum. This remains true when an edge has several occurrences on the cell boundary. Simple connectivity of $cal(C)$ gives a potential for the restricted cochain. That potential is constant on each of the two connected level sides, and an edge of $C$ shows that the constants differ. It consequently has nonzero difference across every edge of $S \( f \, t \)$, so no crossing edge could have been omitted. Thus $C = S \( f \, t \)$. ◻
]

For a function $F$ and $g in Gamma$, define its translate by $\( g F \) \( v \) = F \( g^(- 1) v \)$. Let $cal(F)_0$ consist of all translates of $f$, together with the singleton indicators $1_({ v })$ for $v in Gamma$. These are countably many $\[ 0 \, 1 \]$-valued finite-energy functions.

#thm([Lemma 3.2.])[
  #emph[Every regular cut of a coordinate in $cal(F)_0$ has finitely many dual components. A nonempty regular cut of a translate of $f$ is dually connected, and a regular cut of a singleton indicator is finite.]
] <compact:wall-components>

#proof[
  The assertion for translates follows from Lemma 10; levels outside $\[ 0 \, 1 \]$ have empty cuts. The only nonempty cuts of a singleton indicator consist of edges incident to its vertex, a finite set by local finiteness. ◻
]

=== 3.2 Boxes with finitely many components <boxes-with-finitely-many-components>

A box in the base-coordinate cube $\[ 0 \, 1 \]^(cal(F)_0)$ is specified by finitely many conditions

$ O = { \( z_F \) : a_i < z_(F_i) < b_i \, quad 1 lt.eq i lt.eq m } \, #h(2em) F_i in cal(F)_0 . $

Endpoints outside $\[ 0 \, 1 \]$ are allowed. We retain the defining inequalities as part of the box data and translate them without changing their endpoints. We use the same symbol for its vertex set, obtained by evaluating the coordinates. A box is #emph[good] if all its endpoints are regular and any two of its endpoint cuts have only finitely many pairs of edges which coincide or occur on a common cell.

#thm([Lemma 3.3.])[
  #emph[Good boxes form a basis of the base-coordinate cube. Every good box has finitely many graph components on its vertex set. There is a countable $Gamma$-invariant basis of good boxes.]
] <compact:good-boxes>

#proof[
  Write $e tilde.op e'$ when $e = e'$ or the edges occur on a common cell. This symmetric relation has degree bounded by a constant $D$, by bounded cell incidence and bounded cell length. For finite-energy coordinates $F \, F'$, Tonelli’s theorem and Cauchy–Schwarz give
  $ & integral_(bb(R)^2) \# { \( e \, e' \) : e tilde.op e' \, med e in S \( F \, s \) \, med e' in S \( F' \, t \) } thin d s thin d t\
 & #h(15mm)  = sum_(e tilde.op e') \| d F \( e \) \| thin \| d F' \( e' \) \| lt.eq D parallel d F parallel_2 parallel d F' parallel_2 < oo . $
  Thus almost every pair of endpoint parameters has finitely many interactions. The argument also applies when $F = F'$, since the two parameters remain independent. For a fixed finite list of box conditions, intersect the finitely many full-measure conditions for endpoint pairs and exclude the countably many vertex values. The resulting endpoint tuples are dense in their parameter domain. They therefore supply arbitrarily small good boxes about every point of the cube.
  Fix a good box and list its endpoint cuts as $S_1 \, dots.h \, S_N$. Delete all of their edges from $G$, obtaining a graph $G'$. On every component of $G'$ all endpoint signs are constant. Let $E$ be the finite set of cut edges which also occur in another cut or share a cell with an edge of another cut. For each $i$, the dual graph on $S_i \\ E$ still has finitely many components. Indeed, its original dual graph has finitely many components by Lemma 11, has bounded degree, and has had only finitely many vertices deleted.
  Consider two dually adjacent edges of $S_i \\ E$. On their common triangular cell, their endpoints on a specified side of cut $i$ either coincide or are joined by the remaining cell edge. This joining edge is not in $S_i$. Moreover, the cell contains no edge of any other endpoint cut, by the definition of $E$. The joining edge therefore lies in $G'$. Following a finite dual path shows that all endpoints on either specified side of a dual component of $S_i \\ E$ belong to one component of $G'$. Such a dual component is incident to at most two components of $G'$. Each edge of $E$ is likewise incident to at most two.
  If any cut is nonempty, every component of $G'$ is incident to a cut edge, since the original graph is connected. The preceding finite count proves that $G'$ has finitely many components. If all cuts are empty, $G' = G$ is connected. The vertex set of $O$ is a union of those components with the specified signs; its induced subgraph has exactly these components. This proves the required finiteness. The argument also covers repeated vertices or edges on a triangular boundary: the same-side joining path then either has length zero or uses the remaining edge.
  There are countably many finite lists of base coordinates. For each list, choose a countable dense set of good endpoint tuples. The resulting boxes form a countable basis. Add all their translates; this remains countable, and goodness is preserved by the action. ◻
]

Fix such an invariant countable basis, denoted $cal(O)$. A box can have several components even though each individual level side is connected. We next add coordinates which remember the component of each box. The preceding finiteness will make that information persist at boundary points.

=== 3.3 Coordinates which distinguish box components <coordinates-which-distinguish-box-components>

For $O in cal(O)$, with conditions $a_i < F_i < b_i$, put

$ psi_O = max #scale(x: 120%, y: 120%)[\(] 0 \, min #scale(x: 120%, y: 120%)[\(] { 1 } union { F_i - a_i \, b_i - F_i : 1 lt.eq i lt.eq m } #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\)] . $

This is a continuous function of the base coordinates, with values in $\[ 0 \, 1 \]$, positive precisely inside $O$. For each graph component $U$ of the vertex set of $O$, define on vertices

#[#set math.equation(numbering: n => "(3.1)")
 $ h_(O \, U) = psi_O 1_U . $ <compact:localized>]

Let $cal(F)$ be the family consisting of $cal(F)_0$ and all these localized coordinates. It is countable and invariant under $Gamma$, since translation carries components of a box to components of its translated box.

#thm([Lemma 3.4.])[
  #emph[Every member of $cal(F)$ has finite energy. For almost every $t in \( 0 \, 1 \)$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ S \( h_(O \, U) \, t \) subset.eq union.big_(i = 1)^m #scale(x: 120%, y: 120%)[\(] S \( F_i \, a_i + t \) union S \( F_i \, b_i - t \) #scale(x: 120%, y: 120%)[\)] \, $ <compact:shifted-walls>]

 where every displayed level is regular for its coordinate.]
] <compact:localized-energy>

#proof[
  The operations defining the margin give
  $ \| d psi_O \( e \) \| lt.eq max_(1 lt.eq i lt.eq m) \| d F_i \( e \) \| . $
  Two adjacent vertices with positive margin belong to the same component of $O$. Thus either both endpoints contribute their margin to $h_(O \, U)$, both contribute zero, or the endpoint outside $U$ has zero margin. In every case
  $ \| d h_(O \, U) \( e \) \| lt.eq \| d psi_O \( e \) \| \, #h(2em) parallel d h_(O \, U) parallel_2^2 lt.eq sum_(i = 1)^m parallel d F_i parallel_2^2 . $
  If there are no conditions, the margin and localized coordinate are constant and their gradients vanish.
  For the cut inclusion, the endpoint where $h_(O \, U) > t$ belongs to $U$ and satisfies every margin inequality strictly above $t$. At the other endpoint, either it still belongs to $U$ and some margin is below $t$, or it lies outside $U$. In the latter case its margin must be zero by adjacency, and again one of the margin inequalities fails. Since $t < 1$, the constant cap in the definition of $psi_O$ contributes no additional cut. The crossed margin is one of the levels $a_i + t$ or $b_i - t$, proving (3.2). All exceptional values, for which one of these levels or $t$ itself is a vertex value of its coordinate, form a countable set. ◻
]

=== 3.4 The compact space and its boundary <the-compact-space-and-its-boundary>

Compactifying a graph by bounded finite-energy functions is the Royden method #cite(label("KellerLenzSchmidtWojciechowski2017")) Section 4. We use a selected countable family, with localized coordinates that record components of boxes.

Map each $v in Gamma$ to its profile $\( F \( v \) \)_(F in cal(F))$ and let $X$ be the closure of these profiles in $\[ 0 \, 1 \]^(cal(F))$. The singleton indicators make this map injective, so we identify vertices with their profiles. They also make each vertex isolated in $X$: the coordinate $1_({ v })$ equals $1$ only at $v$, even after taking the profile closure. Define

$ B = X \\ Gamma . $

Then $X$ is compact metrizable and $B$ is closed. Every coordinate in $cal(F)$ extends continuously to $X$; we retain its name. A margin $psi_O$ also extends, through its expression in base coordinates. The invariant family makes left translation extend to a homeomorphism of $X$: it is the restriction of a coordinate permutation, with the inverse permutation induced by the inverse group element.

Enumerate $cal(F) = { F_1 \, F_2 \, dots.h }$ and choose positive numbers $c_j$ satisfying

$ sum_j c_j \( 1 + parallel d F_j parallel_2 \) < oo \; $

for example, take $c_j = 2^(- j) \/ \( 1 + parallel d F_j parallel_2 \)$. Equip $X$ with the compatible metric

#[#set math.equation(numbering: n => "(3.3)")
 $ rho \( x \, y \) = sum_j c_j \| F_j \( x \) - F_j \( y \) \| \, #h(2em) lambda \( e \) = rho \( e^(-) \, e^(+) \) . $ <compact:metric>]

Uniform convergence gives continuity of $rho$, and positivity of all weights makes it induce the product topology. Minkowski’s inequality for finite partial sums, followed by monotone convergence, yields

#[#set math.equation(numbering: n => "(3.4)")
 $ parallel lambda parallel_(ell^2 \( E \( G \) \)) lt.eq sum_j c_j parallel d F_j parallel_2 < oo . $ <compact:edge-lengths>]

In particular, for any fixed $epsilon.alt > 0$ only finitely many edges have $rho$-length at least $epsilon.alt$.

#thm([Lemma 3.5.])[
  #emph[The boundary $B$ is a nondegenerate compact connected metric space.]
] <compact:boundary>

#proof[
  A closed subset of $X$ contained in its isolated vertices is finite, since it is compact and discrete. Since $Gamma$ is infinite, this first implies $B eq.not diameter$. If $B$ were a singleton ${ x }$, then, for each $epsilon.alt > 0$, the vertex set where $\| f \( v \) - f \( x \) \| gt.eq epsilon.alt$ would be finite. This would make $f$ tend to a constant at infinity, contrary to Lemma 10. Thus $B$ has at least two points.
  If $B$ were disconnected, write it as a disjoint union of two nonempty compact sets. Choose neighborhoods of those sets in $X$ whose closures have positive distance apart. Their complement is a closed subset of $X$ disjoint from $B$, hence a finite vertex set. Each neighborhood contains infinitely many vertices. Only finitely many graph edges join the two neighborhoods, by (3.4). Delete their endpoints together with the finite complement. The remaining graph has infinitely many vertices on each side and no path between the sides. A connected locally finite graph minus finitely many vertices has only finitely many components, so each side contains an infinite component. This contradicts one-endedness of $G$. ◻
]

=== 3.5 Paths near a boundary point <paths-near-a-boundary-point>

We have a connected boundary, but connectedness alone does not control paths near one of its points. The extra coordinates in (3.1) give exactly the following control of vertex paths.

#thm([Lemma 3.6.])[
  #emph[For every $x in B$ and every open neighborhood $W$ of $x$ in $X$, there is an open neighborhood $V subset W$ of $x$ such that any two vertices in $V$ can be joined by a finite graph path whose vertices all lie in $W$.]
  #emph[Equivalently, if $u_n \, v_n in Gamma$ tend to the same $x in B$, there are joining graph paths $P_n$ with $sup { rho \( w \, x \) : w upright(" is a vertex of ") P_n } arrow.r 0$.]
] <compact:near-path>

#proof[
  For a good box $O$ with its finite component list $U_1 \, dots.h \, U_r$, the identities
  #[#set math.equation(numbering: n => "(3.5)")
   $ sum_(j = 1)^r h_(O \, U_j) = psi_O \, #h(2em) h_(O \, U_i) h_(O \, U_j) = 0 quad \( i eq.not j \) $ <compact:component-identities>]
  hold on vertices and therefore, by continuity, on all of $X$. Consequently, if $psi_O \( x \) > 0$, exactly one component, denoted $U_O \( x \)$, satisfies
  #[#set math.equation(numbering: n => "(3.6)")
   $ h_(O \, U_O \( x \)) \( x \) = psi_O \( x \) > 0 . $ <compact:selected-component>]
  All sufficiently near vertices belong to this component. This is where the finiteness assertion in Lemma 12 is used.
  Shrink $W$ to a neighborhood defined by finitely many coordinate conditions, each allowing a positive tolerance about its value at $x$. The base coordinates define a continuous projection from $X$ to $\[ 0 \, 1 \]^(cal(F)_0)$. Choose a good basis box $O'$ about the base profile of $x$, small enough to have the following properties. First, every tested base coordinate satisfies its prescribed tolerance throughout $O'$. Second, for every tested $h_(O \, U)$ with $psi_O \( x \) > 0$, we have $O' subset O$ and the variation of $psi_O$ from $psi_O \( x \)$ on $O'$ is smaller than the prescribed tolerance. Third, if a tested box has $psi_O \( x \) = 0$, its margin is smaller than that tolerance throughout $O'$. These are finitely many open conditions on the base profile, so Lemma 12 supplies such an $O'$.
  We have $psi_(O') \( x \) > 0$. Let $U' = U_(O') \( x \)$ be the component selected by (3.6). For any tested box $O$ of positive margin at $x$, the inclusion $O' subset O$ and connectedness of $U'$ place $U'$ in one component of $O$. That component is $U_O \( x \)$. Indeed, density of the vertices in $X$ supplies a vertex near $x$ at which the two coordinates selecting $U'$ and $U_O \( x \)$ are both positive.
  Every tested localized coordinate therefore satisfies its condition on $U'$. If its box has positive margin and its component is $U_O \( x \)$, it equals $psi_O$, whose variation was controlled. If its component differs from $U_O \( x \)$, it is identically zero on $U'$ and at $x$. This includes the case of zero localized value with positive box margin. Finally, a tested box of zero margin satisfies $0 lt.eq h_(O \, U) lt.eq psi_O$, so the third condition on $O'$ controls its value. Thus all vertices of $U'$ lie in $W$.
  The open set
  $ V = W ∩ { y in X : h_(O' \, U') \( y \) > 1 / 2 psi_(O') \( x \) } $
  contains $x$, and every vertex in it belongs to $U'$. Joining two such vertices inside the graph component $U'$ proves the first assertion. Applying that assertion to successively smaller metric balls about $x$, and choosing their radii slowly enough for both endpoint sequences, proves the sequential formulation. Conversely, failure for one fixed $W$ would give two sequences converging to $x$ with no joining paths in $W$, contradicting that formulation. ◻
]

== 4 Convergence dynamics from finite energy <sec:dynamics>

We retain the Cayley graph $G$, the compactification $X = Gamma union.sq B$, and its metric $rho$ from the preceding section. Write $lambda \( e \) = rho \( e^(-) \, e^(+) \)$ for the length of an edge. Thus $lambda in ell^2 \( E \( G \) \)$. We will show that translations collapse the regular coordinate cuts. Two such cuts then detect the attracting and repelling points of every escaping sequence of group elements.

First observe that, for every fixed $s in Gamma$,

#[#set math.equation(numbering: n => "(4.1)")
 $ rho \( u \, u s \) arrow.r 0 #h(2em) \( u arrow.r oo upright(" in ") Gamma \) . $ <eq:dyn-right-move>]

Here and below, tending to infinity in a discrete group means leaving every finite subset. Indeed, translate a fixed finite edge path from $1$ to $s$ by $u$. Each translated edge escapes every finite edge set, and an $ell^2$ function tends to zero outside finite sets. Summing the finitely many edge lengths proves (4.1). The convergence is uniform over any fixed finite set of choices of $s$.

=== 4.1 Lengths of translated cuts <lengths-of-translated-cuts>

Recall that $S \( F \, t \)$ consists of the edges whose endpoint values of $F$ lie on opposite sides of $t$. We always exclude levels attained at vertices. Call two edges near if they belong to the boundary of a common cell, or are equal. Enlarging this relation by a fixed graph distance would not affect the following argument. Its incidence is uniformly bounded in either variable.

#thm([Lemma 4.1.])[
  (Translated cut lengths).  #emph[For every base coordinate $F$ and $g in Gamma$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ integral_0^1 sum_(e in S \( F \, t \)) sum_(e' upright(" near ") e) lambda \( g e' \) thin d t = sum_e \| d F \( e \) \| sum_(e' upright(" near ") e) lambda \( g e' \) . $ <eq:dyn-length>]

 This quantity is finite and tends to zero as $g arrow.r oo$. There is a constant $C$, independent of $g \, F \, t$, such that for every dually connected set $D$ of edges, 
#[#set math.equation(numbering: n => "(4.3)")
 $ "diam"_rho { g v : v upright(" is an endpoint of an edge of ") D } lt.eq C sum_(e in D) sum_(e' upright(" near ") e) lambda \( g e' \) . $ <eq:dyn-dual-diameter>]

 The sum of these diameter bounds over distinct dual components is bounded by the same expression with their union in place of $D$.]
] <dyn:length>

#proof[
  For each edge, the set of straddled levels has Lebesgue measure $\| d F \( e \) \|$. Tonelli’s theorem gives (4.2). Bounded incidence implies that
  $ a \( e' \) = sum_(e : med e' upright(" near ") e) \| d F \( e \) \| $
  belongs to $ell^2 \( E \( G \) \)$. The right side of (4.2) is $sum_(e') a \( e' \) lambda \( g e' \)$, so it is finite by Cauchy–Schwarz. Translates of a fixed finite edge set eventually avoid any other fixed finite edge set. Approximate both $a$ and $lambda$ in $ell^2$ by finitely supported functions and apply Cauchy–Schwarz to the errors. Their translated pairing therefore tends to zero.
  To prove (4.3), join any two edges of $D$ by a simple path in the dual adjacency graph. For each consecutive pair, traverse the boundary of a cell containing both edges. This joins their endpoints using edges near $D$. The simple dual path uses each of its edges at most once; bounded cell size and incidence give a uniform bound on the multiplicity with which any near edge is used. The triangle inequality proves the estimate. Sum it over the components to obtain the last assertion. ◻
]

#thm([Lemma 4.2.])[
  (Collapse of translated cuts).  #emph[Suppose $g_n arrow.r a in B$. Given finitely many coordinates from the enlarged coordinate family, there is a subsequence such that, for almost every level of each coordinate, all endpoints of the $g_n$-translated straddling set tend uniformly to $a$. If also $g_n^(- 1) arrow.r b in B$, the subsequence can be chosen so that the corresponding inverse-translated straddling sets tend uniformly to $b$.]
] <dyn:walls>

#proof[
  For a finite list of base functions, Lemma 16 permits a subsequence along which the sum over $n$ of all the integrals in (4.2) is finite. For almost every level, the corresponding nonnegative length sums then tend to zero. Each regular base cut has finitely many dual components. Choose one endpoint in each nonempty component. The translates of these finitely many fixed vertices tend to $a$ by (4.1). The diameter estimate in Lemma 16 therefore makes every endpoint of the translated cut tend uniformly to $a$.
  For an added coordinate associated with a box, its straddling set is contained in a finite union of base straddling sets at levels of the form $a_i + t$ and $b_i - t$. Include those base coordinates in the list. Translations and reflections of the level parameter preserve null sets, so almost every $t$ has the required estimates for all the covering cuts. Levels outside $\[ 0 \, 1 \]$ give empty cuts. This proves the assertion for added coordinates. To obtain both directions, choose the summable subsequence simultaneously for $g_n$ and $g_n^(- 1)$. ◻
]

=== 4.2 The convergence action <the-convergence-action>

#thm([Proposition 4.3.])[
  #emph[If $g_n arrow.r a in B$ and $g_n^(- 1) arrow.r b in B$, then 
#[#set math.equation(numbering: n => "(4.4)")
 $ g_n x arrow.r a quad upright("uniformly for ") x upright(" in each compact subset of ") X \\ { b } . $ <eq:dyn-convergence>]

 Consequently the action of $Gamma$ on the space of distinct triples of $B$ is properly discontinuous; in particular, its action on $B$ is a convergence action.]
] <dyn:convergence>

#proof[
  Suppose (4.4) fails. After taking a subsequence, there are $x_n arrow.r r eq.not b$ with $g_n x_n arrow.r s eq.not a$. For each $n$, density of the vertices and continuity of the particular map $g_n$ give a vertex $v_n$ such that
  $ rho \( v_n \, x_n \) < 1 \/ n \, #h(2em) rho \( g_n v_n \, g_n x_n \) < 1 \/ n . $
  Thus $v_n arrow.r r$ and $g_n v_n arrow.r s$.
  Choose a coordinate separating $r$ from $b$, and another separating $s$ from $a$. Apply Lemma 17 to these two coordinates. Choose regular levels strictly between the respective values and outside its null exceptional sets. Call the resulting cuts the first and second cuts. The translated first cut has all endpoints uniformly near $a$, while the inverse-translated second cut has all endpoints uniformly near $b$.
  Let $C_n$ be the graph component of the $r$-side of the first cut containing $v_n$. Write $F$ for its coordinate and $t$ for its level; for definiteness suppose $F \( b \) < t < F \( r \)$. A neighborhood of $b$ then misses the entire $r$-side, whose vertices satisfy $F > t$. Both sides have vertices. A path from $v_n$ to the other side has a first straddling edge; its endpoint $w_n$ on the $r$-side lies in $C_n$. Since the inverse-translated second cut is uniformly near $b$, none of its edges can have an endpoint on the $r$-side for large $n$. Consequently no edge of $g_n C_n$ straddles the second cut. Yet $g_n v_n$ lies on its $s$-side, whereas $g_n w_n$ is uniformly near $a$ and lies on the opposite side. The image of a path in $C_n$ between $v_n$ and $w_n$ must straddle that cut, a contradiction.
  For proper discontinuity, suppose infinitely many distinct group elements take a point of one compact set of distinct triples to a point of another such compact set. Pass to convergent source and target triples and to subsequences with $g_n arrow.r a$ and $g_n^(- 1) arrow.r b$. The latter limits belong to $B$, since group vertices are isolated. At least two coordinates of the limiting source triple differ from $b$. Equation (4.4) sends both to $a$, contradicting distinctness of the limiting target triple. ◻
]

For a convergence action on a compact Hausdorff space with at least three points, every infinite-order element is either #emph[parabolic], with one fixed point, or #emph[loxodromic], with two fixed points #cite(label("Bowditch1999Treelike")) Lemma 6.2. Moreover, a point stabilizer containing a loxodromic element is virtually cyclic #cite(label("Bowditch1999Treelike")) Proposition 6.4 and its preceding paragraph. These statements apply because $B$ is a nondegenerate continuum.

#thm([Lemma 4.4.])[
  (Parabolic comparison).  #emph[Let $h in Gamma$ be parabolic with fixed point $p in B$. Then $h^n arrow.r p$ and $h^(- n) arrow.r p$ as vertices of $X$. Both sequences of maps converge to $p$ uniformly on compact subsets of $X \\ { p }$ and pointwise on all of $B$. Furthermore, 
#[#set math.equation(numbering: n => "(4.5)")
 $ rho \( g \, g p \) arrow.r 0 #h(2em) \( g arrow.r oo upright(" in ") Gamma \) . $ <eq:dyn-parabolic-comparison>]

]
] <dyn:parabolic>

#proof[
  The powers $h^n$ escape every finite vertex set as $n arrow.r + oo$ or $n arrow.r - oo$. If a subsequence tends to $z in B$, (4.1) gives $rho \( h^n \, h^(n + 1) \) arrow.r 0$, whereas continuity of left multiplication by $h$ gives $h^(n + 1) arrow.r h z$. Thus $h z = z$, and uniqueness of the parabolic fixed point gives $z = p$. Compactness proves convergence of the entire sequences. Proposition 18 now supplies their compact-uniform convergence off $p$; they fix $p$ itself.
  If (4.5) fails, take a subsequence with $g_n arrow.r a$ and $g_n p arrow.r c eq.not a$. The cosets $g_n chevron.l h chevron.r$ escape every finite vertex set. Otherwise some fixed $w$ belongs to infinitely many of them, so $g_n = w h^(j_n)$ on a subsequence, with $\| j_n \| arrow.r oo$. Then both $g_n$ and $g_n p$ tend to $w p$, a contradiction.
  For fixed $n$, the sequence $u_(n \, j) = g_n h^j$, $j gt.eq 0$, starts at $g_n$ and tends to $g_n p$. By whole-coset escape and (4.1),
  $ sup_(j gt.eq 0) rho \( u_(n \, j) \, u_(n \, j + 1) \) arrow.r 0 . $
  Choose three distinct numbers strictly between $0$ and $rho \( a \, c \)$. For each number choose the first index $j$ at which $rho \( a \, u_(n \, j) \)$ reaches it. The vanishing step size and compactness provide, after a common subsequence, three selected vertex sequences with distinct limits $z_1 \, z_2 \, z_3 in B$.
  The conjugate $k_n = g_n h g_n^(- 1)$ sends each selected vertex to its successor, so asymptotically fixes these three sequences. If $k_n$ escapes finite sets, pass to limits of $k_n$ and $k_n^(- 1)$ in $B$. At least two of the $z_i$ avoid the repelling limit; Proposition 18 would send both to the same attracting limit, a contradiction. Otherwise take a constant subsequence of the $k_n$. By continuity, that fixed conjugate of $h$ fixes all three $z_i$, again a contradiction. This proves (4.5). ◻
]

#thm([Proposition 4.5.])[
  #emph[The action of $Gamma$ on $B$ is minimal: every orbit is dense.]
] <dyn:minimal>

#proof[
  Every invariant subset with at least two points is dense. Indeed, given $a in B$, choose vertices $g_n arrow.r a$ and pass to $g_n^(- 1) arrow.r b in B$. An invariant subset with at least two points contains $z eq.not b$, and Proposition 18 gives $g_n z arrow.r a$.
  It remains to exclude a global fixed point $c$. Choose $a in B$ different from $c$ and vertices $g_n arrow.r a$. After passing to a subsequence, Proposition 18 and $g_n c = c$ force $g_n^(- 1) arrow.r c$. Choose disjoint nonempty closed neighborhoods $A \, C$ of $a \, c$ in $B$. For large $n$,
  $ g_n A subset A \, #h(2em) g_n^(- 1) C subset C . $
  Fix one such nonidentity $g_n$. Since $Gamma$ is torsion-free, it has infinite order. It cannot be parabolic: Lemma 19 would make the forward orbit of a point of $A$ and the backward orbit of a point of $C$ tend to the same point, which would belong to both disjoint closed sets. It is therefore loxodromic. Since all of $Gamma$ fixes $c$, the stabilizer statement cited above would make $Gamma$ virtually cyclic. An infinite virtually cyclic group has two ends, contrary to the established one-endedness of $Gamma$. ◻
]

== 5 Dimension and cohomology of the boundary <sec:boundary-topology>

The compactification $X = Gamma union.sq B$ has two topological properties that will drive the contradiction: $B$ has covering dimension at most one, and its first Čech cohomology vanishes. Neither assertion requires local connectivity. The first comes from the small accumulation sets of coordinate cuts; the second transfers a finite-cover cocycle to the presentation complex and removes its finite coboundary there.

=== 5.1 Thin transition sets and covering dimension <thin-transition-sets-and-covering-dimension>

For a coordinate $F$ and a level $t$ avoiding its vertex values, let $P \( F \, t \)$ be the set of endpoints of edges in $S \( F \, t \)$, and put

$ E \( F \, t \) = overline(P \( F \, t \)) ∩ B . $

Thus $E \( F \, t \)$ records where the cut accumulates in the boundary. All closures and diameters below use the metric $rho$ on $X$.

#thm([Lemma 5.1.])[
  #emph[For every coordinate $F$, the compact set $E \( F \, t \)$ has $cal(H)_rho^1$-measure zero for almost every $t in \( 0 \, 1 \)$.]
] <topo:thin-walls>

#proof[
  First suppose that $F$ is a base coordinate. The level-length estimate of Lemma 16, with the identity translate, gives
  $ sum_(e in S \( F \, t \)) med sum_(e' upright(" near ") e) lambda \( e' \) < oo $
  for almost every $t$. Here the fixed neighborhood of an edge includes the boundaries of its incident cells. Traversing these boundaries along a simple dual path shows that the diameter of the endpoint set of a dual component $D$ is at most
  $ C sum_(e in D) med sum_(e' upright(" near ") e) lambda \( e' \) \, $
  where $C$ depends only on the finite presentation. Bounded local incidence bounds the multiplicity with which a nearby edge is used.
  Fix a level with the finite sum above. The wall has finitely many dual components, and the dual adjacency graph is locally finite. Delete finite subsets $D_n subset S \( F \, t \)$ increasing to the entire wall. At each stage only finitely many dual components remain: deleting finitely many vertices from a connected locally finite graph creates only finitely many components. Their endpoint-set closures cover $E \( F \, t \)$, since deleting finitely many isolated graph vertices does not change boundary accumulation. The sum of their diameters is at most
  $ C sum_(e in S \( F \, t \) \\ D_n) med sum_(e' upright(" near ") e) lambda \( e' \) arrow.r 0 . $
  Their maximum diameter also tends to zero. These finite covers prove that $cal(H)_rho^1 \( E \( F \, t \) \) = 0$.
  For a localized coordinate, its straddling edges are contained in a finite union of base-coordinate walls at the shifted levels appearing in its definition. The corresponding boundary accumulation set is therefore contained in the finite union of their accumulation sets. Each shifted level is admissible for almost every original level; translations and reflections of the level parameter preserve null sets. The result follows. ◻
]

#thm([Proposition 5.2.])[
  #emph[The boundary $B$ has covering dimension at most one.]
] <topo:dimension>

#proof[
  We construct arbitrarily fine finite open covers of multiplicity at most two. Choose a finite grid of levels in finitely many coordinates. Each level avoids vertex values and satisfies Lemma 21. Let $E$ be the union of the corresponding sets $E \( F \, t \)$. It is compact and has $cal(H)_rho^1$-measure zero.
  The set $E$ has arbitrarily small finite clopen partitions. Indeed, for $x in E$, the distance map $y mapsto rho \( x \, y \)$ is Lipschitz, so its image on $E$ has Lebesgue measure zero. There are arbitrarily small positive radii $r$ for which the sphere of radius $r$ about $x$ misses $E$. The sets $E ∩ B_rho \( x \, r \)$ are then clopen in $E$. Compactness gives a finite small clopen cover, which becomes a disjoint partition by successively subtracting its previous members.
  Each selected cut has a locally constant sign on the complement of its accumulation set. To define it at $x in.not E \( F \, t \)$, choose a neighborhood $W$ of $x$ in $X$ that contains no endpoint of a straddling edge. Lemma 15 joins all vertices sufficiently near $x$ by paths with vertices in $W$. Along such a path the sign of $F - t$ cannot change. Hence all sufficiently near vertices have the same sign. This sign also applies at all sufficiently nearby boundary points, so it is locally constant. This definition is valid even when $F \( x \) = t$: it uses the signs on graph vertices approaching $x$.
  The finitely many sign tuples partition $B \\ E$ into finitely many disjoint sets open in $B$. Within any one such set, each tested coordinate belongs to the closure of one grid interval. First choose enough coordinates that the remaining tail of the metric $rho = sum_j c_j \| F_j \( x \) - F_j \( y \) \|$ is small, and then choose the grids sufficiently fine. Every sign-tuple set consequently has arbitrarily small diameter.
  Partition $E$ into finitely many small clopen sets. They are disjoint compact subsets of $B$, so they admit pairwise disjoint open neighborhoods in $B$, still of arbitrarily small diameter. These neighborhoods, together with the sign-tuple sets, cover $B$. At each point at most one neighborhood and at most one sign-tuple set occur. The cover therefore has multiplicity at most two. A Lebesgue number for any prescribed finite open cover shows that a sufficiently fine cover of this form refines it. This is the assertion $dim B lt.eq 1$. ◻
]

=== 5.2 A finite-support correction and Čech cohomology <a-finite-support-correction-and-čech-cohomology>

The next argument uses only the near-path property, the shrinking diameters of cell boundaries at infinity, and the group-cohomological vanishing from Lemma 6. In particular, it does not replace Čech cohomology by singular cohomology on the possibly nonlocally connected boundary.

#thm([Proposition 5.3.])[
  #emph[With coefficients $k = bb(F)_2$, one has $caron(H)^1 \( B \; k \) = 0$.]
] <topo:cech>

#proof[
  Let $d = \( d_(i j) \)$ be a simplicial $1$-cocycle on the nerve of a finite open cover ${ U_i }_(i = 1)^N$ of $B$, with $d_(i i) = 0$. We show that it becomes a coboundary after refinement.
  ===== 5.2.1 Labeling graph vertices. <labeling-graph-vertices.>
  Choose $delta > 0$ so that every ball of radius $3 delta$ in $B$ is contained in some $U_i$. For each vertex $u in Gamma$, choose a nearest point $b \( u \) in B$ and a label $i \( u \)$ with
  $ B_B \( b \( u \) \, 3 delta \) subset U_(i \( u \)) . $
  If $u arrow.r x in B$, then $rho \( b \( u \) \, x \) lt.eq 2 rho \( u \, x \) arrow.r 0$. Thus all labels occurring sufficiently near $x$ contain a fixed neighborhood of $x$ in $B$.
  Define a cellular $1$-cochain on $cal(C)$ by
  $ alpha \( u v \) = d_(i \( u \) i \( v \)) $
  when that pair occurs in the cover nerve, and by zero otherwise. Its coboundary has finite support. Otherwise choose infinitely many distinct cells where the coboundary is nonzero. Local finiteness forces their vertices to escape every finite set. Each cell boundary has at most three edges, whose lengths tend to zero, so a subsequence of the vertex sets converges to one point $x in B$. All labels on every sufficiently late cell contain $x$. The nerve cocycle identity then gives zero around its boundary, a contradiction. Repeated labels or boundary edges cause no difficulty: the identity is a cellular sum, and $d_(i i) = 0$.
  ===== 5.2.2 The group-ring cocycle. <the-group-ring-cocycle.>
  We explain why the finite-support cochain $omega = d alpha$ represents a group $2$-cocycle. Start a free $k Gamma$-resolution with the cellular chains of $cal(C)$ through degree two. This is possible because $cal(C)$ is simply connected: choose the next free module to map onto $ker partial_2$, and continue. For any finite-support scalar cellular cochain $omega$, the formula
  $ Phi_omega \( c \) = sum_(g in Gamma) omega \( g^(- 1) c \) g $
  defines a $k Gamma$-module cochain. The sum is finite for every finite cellular chain $c$, and its identity coefficient is $omega \( c \)$. Conversely, since the quotient has finitely many cells in each relevant degree, every module cochain through degree two is obtained in this way.
  For every finite cellular $2$-cycle $z$ and every $g in Gamma$,
  $ omega \( g^(- 1) z \) = alpha #scale(x: 120%, y: 120%)[\(] partial \( g^(- 1) z \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  Thus $Phi_omega$ vanishes on $ker partial_2$, so it is a cocycle on the extended free resolution. Lemma 6 gives $H^2 \( Gamma \, k Gamma \) = 0$. There is therefore a module $1$-cochain whose coboundary is $Phi_omega$. Taking identity coefficients yields a finite-support scalar $1$-cochain $eta$ with
  $ d eta = d alpha . $
  Ordinary simple connectivity of $cal(C)$ now supplies a scalar function $l$ on its vertices such that
  $ alpha - eta = d l . $
  ===== 5.2.3 Returning to the boundary. <returning-to-the-boundary.>
  Fix $x in U_i$. Choose a neighborhood $W$ of $x$ in $X$ avoiding all endpoints of edges in the support of $eta$, and small enough that every vertex label occurring in $W$ contains $x$. If $u v$ is an edge with vertices in $W$, the sets $U_i \, U_(i \( u \)) \, U_(i \( v \))$ meet at $x$. The cocycle identity and the equation $d l = alpha$ on this edge imply
  $ l \( u \) + d_(i \, i \( u \)) = l \( v \) + d_(i \, i \( v \)) . $
  By Lemma 15, this expression has one constant value on all vertices sufficiently near $x$. Denote that value by $l_i \( x \)$. It is independent of the chosen neighborhood, since graph vertices approach every boundary point.
  The function $l_i$ is locally constant on $U_i$. Indeed, a smaller neighborhood on whose graph vertices the displayed expression is constant also computes the same germ at every sufficiently nearby boundary point. On an overlap $U_i ∩ U_j$, the cocycle identity gives
  $ l_i + l_j = d_(i j) . $
  Refine the cover by the open sets $U_i ∩ l_i^(- 1) \( a \)$, for $a in k$, omitting empty sets. On this finite refinement the original cocycle is the coboundary of the assignment $a$ to the corresponding cover member. Its Čech class vanishes. ◻
]

We have proved that $B$ has covering dimension at most one and has no first Čech cohomology. These properties alone do not ensure local connectivity. The next steps isolate a continuum without cut points and prove its local connectivity by pushing graph paths toward the boundary.

== 6 The tree of global cut points <sec:pretree>

We now isolate the part of the boundary argument that uses its global cut points. Throughout this section, $B$ is a nondegenerate compact metric continuum on which a finitely presented, torsion-free, one-ended group $Gamma$ acts minimally as a convergence group. We also assume that $Gamma$ has no nontrivial splitting over a finite or two-ended subgroup. These properties have been established for the boundary constructed above. Our aim is to place the global cut points in a simplicial tree with finite quotient, retaining which cut points separate which. In the next section, we will project onto the cut points adjacent to one of the tree’s other vertices. The closure of that neighboring set will be the continuum without cut points needed for the rest of the proof.

=== 6.1 The cut-point pretree <the-cut-point-pretree>

A point $p in B$ is a #emph[global cut point] if $B \\ { p }$ is disconnected. Write $P$ for their set. We shall only need the present construction when $P eq.not diameter$. For distinct $a \, p \, b in P$, write $a p b$ when an open separation of $B \\ { p }$ places $a$ and $b$ on opposite sides.

This relation is a #emph[pretree]: it is a strict betweenness relation with the following properties:

$ not \( a b a \) \, #h(2em) a b c arrow.l.r.double c b a \, #h(2em) not \( a b c and a c b \) \, #h(2em) a b c \, d eq.not b arrow.r.double a b d med upright("or") med c b d . $

Write $\( a \, b \) = { p : a p b }$ and $\[ a \, b \] = \( a \, b \) union { a \, b }$, with $\[ a \, a \] = { a }$. A subset is #emph[full] if it contains $\[ a \, b \]$ whenever it contains $a \, b$. A pretree is #emph[median] if every triple has a point in the three pairwise closed intervals; this point is unique and is denoted by $"med" \( a \, b \, c \)$. It is #emph[complete] if every nonempty full linearly ordered subset is an interval, allowing open and half-open intervals. These are order-theoretic notions; we do not assert that intervals in the cut-point pretree are arcs in $B$.

We use the following precise part of Bowditch’s construction. It supplies the established pretree machinery; the argument after it proves the additional assertion needed when the cut points are parabolic.

#thm([Proposition 6.1.])[
  (Bowditch’s cut-point construction).  #emph[Let a group act minimally by convergence on a nondegenerate compact metric continuum $B$, and let $P eq.not diameter$ be its set of global cut points. There is a complete median pretree $Phi$ containing $P$ equivariantly, with the same betweenness on $P$, with these properties.]
  + #emph[ Two distinct points are called adjacent if their open interval is empty. Every adjacent pair in $Phi$ has one point in $P$ and one outside $P$. A full subset whose intervals are finite is the vertex set of a simplicial tree, with these adjacent pairs as edges.]
  + #emph[ There is an equivariant map $phi.alt : B arrow.r Phi$, equal to the identity on $P$, and, for every $q in Phi$, an equivariantly assigned nonempty compact subset $R_B \( q \) subset B$. For $q in P$ this set is ${ q }$; for $q in.not P$ it satisfies 
#[#set math.equation(numbering: n => "(6.1)")
 $ R_B \( q \) = phi.alt^(- 1) \( q \) union Lambda \( q \) \, #h(2em) Lambda \( q \) = { p in P : p upright(" is adjacent to ") q } . $ <pret:support>]

 No point of $Phi$ is fixed by the whole group.]
  + #emph[ Starting with equality on $Phi$, successively collapse finite-interval classes (two points belong to one such class when their closed interval in the current quotient is finite), and at limit ordinals take the union of the preceding equivalence relations. This process stabilizes. Its final quotient is the canonical dendritic quotient $D \( B \)$ of $B$. In particular, $D \( B \)$ is a dendrite and there is a continuous equivariant surjection $B arrow.r D \( B \)$. The induced action on $D \( B \)$ is minimal and convergence.]
  + #emph[ If a loxodromic element fixes $q \, r in Phi$ with $\[ q \, r \]$ infinite, then $q \, r$ are terminal in $Phi$: neither lies strictly between two points. If a parabolic element has its unique fixed point in $B \\ P$, then it has exactly one fixed point in $Phi$.]
] <pret:package>

#proof[
  #emph[References for the construction.] The complete median pretree $Phi$ is the flow completion of $P$ in #cite(label("Bowditch1999Treelike")) Theorem 3.19. The embedding preserves the separation betweenness of the cut set. Adjacency and the simplicial-tree description are Lemmas 3.28 and 3.34. The compact supports are constructed in Section 5; their formula is Lemma 6.8, and the absence of a fixed point is Lemma 6.11. Full equivalence relations and their successive finite-interval collapses are treated in Lemmas 4.2–4.4. Their terminal quotient is identified with the dendritic quotient in Section 5, and Theorem 5.23 makes it a dendrite. Lemma 6.5 gives the induced convergence action; minimality follows from equivariance and surjectivity. Finally, the fixed-point assertions are Lemmas 6.9 and 6.10. All these constructions apply to a continuum before any local connectivity is known. ◻
]

We seek a $Gamma$-invariant full subset of $Phi$ whose intervals are finite. By part (i) of the proposition, it is already a simplicial tree; a dense orbit of cut points will then show that it contains all of $P$. To find it, we first use the splitting obstruction to understand the final quotient $D \( B \)$ and the stabilizers of cut points. We will return to the successive collapses after establishing these dynamical facts.

#thm([Lemma 6.2.])[
  #emph[Under the assumptions of this section, $D \( B \)$ is a point and every $p in P$ has infinite stabilizer containing no loxodromic element. In particular, each such stabilizer contains a parabolic element of infinite order fixing $p$.]
] <pret:parabolic-cuts>

#proof[
  Bowditch’s dendrite obstruction #cite(label("Bowditch1999Connected")) Lemma 1.4 applies to a finitely presented one-ended group with no infinite torsion subgroup acting minimally by convergence on a dendrite, provided every two-ended subgroup over which the group splits is parabolic on that dendrite. Here there are no such splittings, so the last condition is vacuous; torsion-freeness implies the torsion condition. Proposition 24 therefore gives $D \( B \)$ a single point.
  By #cite(label("Bowditch1999Treelike")) Theorem 6.1, a minimal convergence action of a finitely generated one-ended group with no infinite torsion subgroup on a continuum has a nontrivial dendritic quotient whenever there is a cut point which is not parabolic. Its contrapositive shows that every point of $P$ is parabolic. Here “parabolic point” means that its stabilizer is infinite and contains no loxodromic element. Any nonidentity element of this stabilizer has infinite order because $Gamma$ is torsion-free; the convergence-action classification then makes it parabolic. ◻
]

Theorem 6.1 in the cited paper does not itself produce an invariant finite-interval class when all cut points are parabolic. We now prove that assertion. The transfinite argument adapts the limit and higher-successor steps of Bowditch’s proof of Theorem 6.1, following his Lemma 6.13. The parabolic fixed-point observation below permits those steps in the present all-parabolic case. The parabolic fixed-point description is recorded in the remark after Lemma 6.10 of #cite(label("Bowditch1999Treelike")); we include its short proof to make the extension explicit.

#thm([Lemma 6.3.])[
  (Parabolic fixed points in the completion).  #emph[Let $gamma$ be a parabolic element with unique fixed point $a in P$. Every point of $Phi$ fixed by $gamma$ is either $a$ or adjacent to $a$. Consequently, if an infinite-order element fixes two points of $Phi$ whose interval is infinite, the element is loxodromic and both points are terminal.]
] <pret:parabolic-star>

#proof[
  Every nonempty compact $gamma$-invariant subset of $B$ contains $a$, because the iterates of each point different from $a$ converge to $a$. If $q in Phi$ is fixed, $R_B \( q \)$ is such a subset. For $q in P$, uniqueness of the fixed point in $B$ gives $q = a$. If $q in.not P$, then $a in R_B \( q \)$ and $phi.alt \( a \) = a eq.not q$. Formula (6.1) therefore gives $a in Lambda \( q \)$, as required.
  Any two points equal or adjacent to $a$ have a finite interval between them, contained in the union of their intervals to $a$. Thus a parabolic element fixing a point of $P$ cannot have the two fixed points in the last assertion. A parabolic element whose fixed point is outside $P$ cannot have them either, by Proposition 24(iv). The infinite-order classification and the loxodromic assertion in that proposition complete the proof. ◻
]

=== 6.2 An invariant finite-interval class <an-invariant-finite-interval-class>

The final quotient $D \( B \)$ is a point. We now show that an invariant class already appears at the first collapse, where its intervals are finite in the original pretree. This is the stage that yields the simplicial tree we need.

An equivalence relation on $Phi$ is #emph[full] if all its classes are full. For a full relation $tilde.op$, the quotient pretree has the induced betweenness: a class $V$ lies between distinct classes $U \, W$ when some $v in V$ lies between every $u in U$ and $w in W$. Write $tilde.op_0$ for equality and define

#[#set math.equation(numbering: n => "(6.2)")
 $ x tilde.op_(beta + 1) y & quad arrow.l.r.double quad \[ x \, y \] upright(" meets finitely many ") tilde.op_beta upright("-classes") \,\
tilde.op_lambda & = union.big_(beta < lambda) tilde.op_beta #h(2em) \( lambda upright(" a limit ordinal") \) . $ <pret:relations>]

These are the increasing invariant full relations in Proposition 24(iii); their quotients remain complete median pretrees. In particular, $x tilde.op_1 y$ means precisely that $\[ x \, y \]$ is finite. Our goal is a fixed point of $Phi \/ tilde.op_1$.

We record an elementary consequence of completeness that will identify the direction of an edge between collapsed classes. If disjoint nonempty full subsets $U \, V$ of a complete median pretree have full union, a #emph[facing point of $V$ toward $U$] is a point $p in V$ satisfying

#[#set math.equation(numbering: n => "(6.3)")
 $ \[ u \, v \] ∩ V = \[ p \, v \] #h(2em) \( u in U \, v in V \) . $ <pret:facing>]

There is at most one such point on each side, and there is one on at least one side. To see existence, choose $u in U \, v in V$ and partition $\[ u \, v \]$ by the two full sets. Its initial part $A = \[ u \, v \] ∩ U$ has the form $\[ u \, t \]$ or $\[ u \, t \)$ by completeness. In the closed case $t in U$. In the half-open case put $m = "med" \( u \, v \, t \)$. If $m eq.not t$, then $A = \[ u \, m \]$, reducing to the closed case. Otherwise $t in \[ u \, v \]$ and $t in.not A$, so $t in V$. Thus the initial part has an endpoint in $\[ u \, v \]$. If the endpoint belongs to $U$, it is the facing point there; otherwise it is the facing point in $V$. Interchanging $U \, V$ if needed, denote this point by $p in V$. The median of $u \, u' \, p$ shows that the same endpoint works for every $u' in U$; the median of $u \, v' \, p$ then gives (6.3) for every $v' in V$. If $p \, p' in V$ both worked, $"med" \( u \, p \, p' \)$ would force $p = p'$. This is also #cite(label("Bowditch1999Treelike")) Lemma 6.13.

#thm([Lemma 6.4.])[
  #emph[Under the assumptions of this section, $Gamma$ preserves a finite-interval class of $Phi$.]
] <pret:invariant-class>

#proof[
  Lemma 25 says that the terminal quotient in (6.2) is a point. Let $alpha$ be the least ordinal for which $Phi \/ tilde.op_alpha$ has a point fixed by $Gamma$. Proposition 24(ii) gives $alpha eq.not 0$. We shall rule out limits and successors greater than one.
  #emph[A limit cannot be first.] Suppose $alpha$ is a limit ordinal, and choose $x$ in an invariant $tilde.op_alpha$-class. For each member $s$ of a finite generating set, $x tilde.op_alpha s x$ holds at some stage $beta_s < alpha$. Let $beta$ be the maximum of these finitely many stages. Invariance and transitivity of $tilde.op_beta$ give $x tilde.op_beta g x$ for every word $g$ in the generators and their inverses. Thus the $tilde.op_beta$-class of $x$ is invariant, contrary to the choice of $alpha$.
  #emph[A higher successor creates a simplicial tree.] Suppose $alpha = beta + 1$ with $beta gt.eq 1$, and let $Xi subset Phi$ be an invariant $tilde.op_alpha$-class. Its $tilde.op_beta$-classes form a simplicial tree $Sigma = Xi \/ tilde.op_beta$. The action on this tree has no fixed vertex, by the minimality of $alpha$.
  For adjacent classes $U \, V in Sigma$, their union is full in $Phi$. The facing-point observation supplies a point on at least one side. There cannot be facing points on both sides: they would be adjacent in $Phi$, hence $tilde.op_1$-equivalent and therefore $tilde.op_beta$-equivalent. This contradicts $U eq.not V$. Exactly one side has a facing point, so an automorphism cannot interchange $U$ and $V$. The action on $Sigma$ has no edge inversions.
  We next show that every edge of $Sigma$ with infinite stabilizer is a leaf edge. This is the only step in which the dynamics on $B$ enters the ordinal argument.
  Let $U V$ have infinite stabilizer, and write $p in V$ for its facing point. Choose a nonidentity stabilizing element $gamma$; it has infinite order. Since the edge is not inverted, $gamma$ preserves $U \, V$ and fixes their uniquely specified point $p$. We claim that $gamma$ fixes another point outside $V$. For $y in U$ put
  $ x = "med" \( p \, y \, gamma y \) . $
  Fullness gives $x in \[ y \, gamma y \] subset U$, and both $x \, gamma x$ lie in the linearly ordered interval $\[ p \, gamma y \]$. If $x = gamma x$, the claim is proved. Otherwise, after replacing $\( gamma \, x \)$ by $\( gamma^(- 1) \, gamma x \)$ if needed, we have $x in \( p \, gamma x \)$. The intervals $\[ p \, gamma^n x \]$, $n gt.eq 0$, are then strictly increasing. Their union is a full directed arc with first point $p$ and no last point. Completeness supplies an endpoint $z$ with
  #[#set math.equation(numbering: n => "(6.4)")
   $ union.big_(n gt.eq 0) \[ p \, gamma^n x \] = \[ p \, z \) . $ <pret:endpoint>]
  The endpoint is unique in a median pretree #cite(label("Bowditch1999Treelike")) Lemma 3.13 and the following observation. The union in (6.4) is $gamma$-invariant, so $z$ is fixed. Since $x in \( p \, z \)$ but $x in.not V$, fullness of $V$ implies $z in.not V$. This proves the claim.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.855, -0.48), (0, 0.56), fill: rgb("#f2f2f2"), stroke: none)
  content((-0.5225, 0.28), [$V$])
  line((0, 0), (5.605, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, -0.1764), [$p$], anchor: "north", padding: 0.1176cm)
  circle((1.33, 0), radius: 0.07056, fill: black, stroke: none)
  content((1.33, -0.1764), [$x$], anchor: "north", padding: 0.1176cm)
  circle((2.517, 0), radius: 0.07056, fill: black, stroke: none)
  content((2.517, -0.1764), [$gamma x$], anchor: "north", padding: 0.1176cm)
  circle((3.467, 0), radius: 0.07056, fill: black, stroke: none)
  content((3.467, -0.1764), [$gamma^2x$], anchor: "north", padding: 0.1176cm)
  content((4.37, 0.16), [$dots.h$])
  circle((5.605, 0), radius: 0.07056, fill: black, stroke: none)
  content((5.605, -0.1764), [$z$], anchor: "north", padding: 0.1176cm)
  line((1.33, 0.52), (3.705, 0.52), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.565, 0.52), [$U$], anchor: "south", padding: 0.1176cm)
  content((5.89, 0), [$z in.not V$], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: The interval argument for an edge between higher-stage classes. The element fixes the facing point $p$. If it moves points of $U$ away from $p$, completeness supplies a second fixed endpoint $z$ outside $V$. The picture depicts betweenness in $Phi$, not an arc in $B$. ],
  ) <fig:pretree-endpoint>
  Let $q in.not V$ be the second fixed point. The points $p \, q$ belong to different $tilde.op_beta$-classes; as $beta gt.eq 1$, their original interval is infinite. Lemma 26 makes $p$ terminal in $Phi$. For every $v in V$ and $u in U$, formula (6.3) puts $p in \[ u \, v \]$. Since $p eq.not u$, terminality forces $v = p$. Thus $V = { p }$. This vertex is a leaf of $Sigma$: if it had two neighbors, $p$ would lie strictly between representatives of them in $Phi$, again contradicting terminality.
  Delete every edge with infinite stabilizer, together with its leaf endpoint. The remaining vertices form a nonempty invariant subtree. Indeed, removing selected leaves preserves all paths between remaining vertices. If nothing remained, the original tree would have at most two vertices. Such an action without inversions has a fixed vertex, which has already been excluded. All remaining edges have finite stabilizer, and a fixed vertex of the remaining tree would also be fixed in $Sigma$.
  A finitely generated one-ended group acting without inversions on a simplicial tree with finite edge stabilizers fixes a vertex #cite(label("Bowditch1999Treelike")) Lemma 6.6. Applying this fact gives the desired contradiction.
  The least ordinal is therefore $alpha = 1$, which is exactly the assertion of the lemma. ◻
]

=== 6.3 The simplicial tree spanning the cut set <the-simplicial-tree-spanning-the-cut-set>

The ordinal argument is complete. We now work only with an ordinary simplicial tree, whose vertices retain the separation information in $B$.

#thm([Proposition 6.5.])[
  #emph[Let $Gamma$ be a finitely presented torsion-free one-ended group with no nontrivial splitting over a finite or two-ended subgroup. Suppose it acts minimally by convergence on a nondegenerate compact metric continuum $B$ whose set $P$ of global cut points is nonempty. Then there is a nontrivial minimal simplicial $Gamma$-tree $cal(T)$, with no edge inversions and finite quotient, such that:]
  + #emph[$P$ is an invariant subset of its vertices, and every edge has one endpoint in $P$ and one outside $P$;]
  + #emph[$cal(T)$ is spanned by $P$; its other vertices have degree at least two;]
  + #emph[every edge stabilizer is infinite;]
  + #emph[if $a \, b \, q in P$ and $q$ separates $a \, b$ in $B$, then $q in \[ a \, b \]_(cal(T))$.]
  #emph[Every point of $P$ is fixed by an infinite-order parabolic element.]
] <pret:tree>

#proof[
  Let $C subset Phi$ be the invariant finite-interval class supplied by Lemma 27. It contains more than one point, because $Phi$ has no fixed point. Therefore its simplicial tree has an edge, and Proposition 24(i) places one endpoint of that edge in $P$.
  Choose $p in C ∩ P$. The orbit $Gamma p$ is dense in $B$ and lies in $C$. If $q in P$, take an open separation of $B \\ { q }$. Both sides are nonempty open subsets of $B$, so each meets $Gamma p$. For orbit points $a \, b$ on opposite sides, separation gives $q in \[ a \, b \]_Phi$. Since $C$ is full, $q in C$. We have proved $P subset C$.
  Let $cal(T)$ be the subtree of $C$ spanned by $P$, that is, the union of the intervals between its points. Its intervals agree with those of $Phi$, proving the asserted separation compatibility. The adjacency property gives the indicated bipartition and rules out edge inversions. A vertex outside $P$ cannot be a leaf of a tree spanned by $P$.
  To prove minimality, let $cal(S) subset cal(T)$ be a nonempty invariant subtree. A singleton would be a fixed point of $Phi$. Otherwise $cal(S)$ contains an edge, hence a point of $P$. Its orbit is again dense in $B$; the separation argument of the preceding paragraph gives $P subset cal(S)$. Thus $cal(S) = cal(T)$.
  Choose a vertex $o$ and a finite generating set $S$ for $Gamma$. The union of the finitely many finite paths $\[ o \, s o \]$, $s in S$, is a finite subtree after adjoining $o$. Its translates form a connected invariant subtree and therefore cover $cal(T)$ by minimality. Consequently the quotient has finitely many vertex and edge orbits.
  Finally suppose an edge had finite stabilizer. Collapsing the edges outside its orbit gives a nontrivial tree with one edge orbit and a minimal action without inversions. Bass–Serre theory then yields a nontrivial splitting over that edge stabilizer, contrary to the hypotheses. Thus every edge stabilizer is infinite. The parabolic assertion is Lemma 25. ◻
]

== 7 A continuum without cut points <sec:blocks>

The remaining argument will use paths in a graph whose vertices accumulate on a continuum without cut points. We already have such a continuum if the boundary $B$ has no cut points. Otherwise, the cut-point tree provides one of its blocks. We construct the graph on that block and prove the topological properties needed below. In particular, none of the arguments in this section assumes that $B$ is locally connected.

Recall that $X = Gamma union.sq B$ is our compact metric space, with metric $rho$, and that $B$ is a nondegenerate continuum. Propositions 22 and 23 give

$ dim B lt.eq 1 \, #h(2em) caron(H)^1 \( B \; bb(F)_2 \) = 0 . $

Let $P$ be the set of cut points of $B$. Throughout the construction below, suppose that $P eq.not diameter$. By Proposition 28, there is a nontrivial minimal simplicial $Gamma$-tree $cal(T)$ spanned by $P$, with finite quotient and bipartition into $P$ and the remaining vertices. All its edge stabilizers are infinite. We will also use its separation property: if $q in P$ separates $a \, b in P$ in $B$, then $q$ belongs to the open tree interval between $a$ and $b$. Every point of $P$ is a parabolic fixed point. In particular, Lemma 19 gives

#[#set math.equation(numbering: n => "(7.1)")
 $ rho \( g p \, g \) arrow.r 0 quad upright("as ") g arrow.r oo upright(" in ") Gamma \, #h(2em) p in P . $ <block:parabolic-comparison>]

Here, and below, escape to infinity in a discrete group means escape from every finite subset.

Choose a vertex $r in cal(T) \\ P$, and write

$ R = { p in P : p upright(" is adjacent to ") r upright(" in ") cal(T) } \, #h(2em) H = Gamma \( r \) . $

Since $cal(T)$ is spanned by $P$, a vertex outside $P$ cannot be a leaf. Thus $R$ has at least two points. For distinct $a \, b in R$, their tree interval is $a - r - b$. The separation property therefore shows that no cut point of $B$ separates $a$ and $b$. Also, $H$ is exactly the setwise stabilizer of $R$: an element preserving $R$ preserves the unique midpoint $r$ of the interval between two distinct members of $R$.

=== 7.1 A graph on the cut points <a-graph-on-the-cut-points>

The graph construction in Lemma 29 adapts Bowditch’s peripheral-splitting construction #cite(label("Bowditch2001Peripheral")) Section 4, Lemma 4.3 and its proof. We give the graph argument explicitly. The subsequent near-path argument and continuous retraction are extensions established here, not an invocation of a retraction theorem from that source.

#thm([Lemma 7.1.])[
  #emph[There is a connected $Gamma$-graph $K^(*)$ with vertex set $P$ and finitely many edge orbits, such that the endpoints of each edge have distance two in $cal(T)$. The graph $K$ induced by $K^(*)$ on $R$ is connected and has finitely many $H$-orbits of vertices and edges.]
  #emph[Define $pi : P arrow.r R$ by letting $pi \( p \)$ be the neighbor of $r$ on the tree interval from $r$ to $p$. An edge of $K^(*)$ with endpoints in $R$ is fixed by $pi$, and every other edge is collapsed to a vertex. Moreover, the stabilizer in $H$ of every vertex of $K$ is infinite.]
] <block:graph>

#proof[
  The finite quotient of $cal(T)$ gives finitely many $Gamma$-orbits in $P$. Choose representatives $p_0 \, dots.h \, p_k$ and a finite symmetric generating set $S$ of $Gamma$. Start with the graph formed by all translates of the edges from $p_0$ to $s p_0$, for $s in S$, and from $p_0$ to $p_i$, for $1 lt.eq i lt.eq k$. Omit loops. The generator edges connect the orbit of $p_0$, and the other edges connect every orbit to it, so this graph is connected. It has finitely many edge orbits.
  Replace each edge by the consecutive pairs of $P$-vertices along the tree interval between its endpoints. These intervals are finite, and the replacement is equivariant. Thus the resulting graph $K^(*)$ is still connected, still has finitely many edge orbits, and has the required distance-two property.
  For an edge $a b$ of $K^(*)$, let $a - s - b$ be its tree interval. If $s = r$, then $a \, b in R$ and $pi$ fixes both endpoints. If $s eq.not r$, then $a$ and $b$ lie in the same component of $cal(T) \\ { r }$, so $pi \( a \) = pi \( b \)$. This proves the projection assertion. Projecting a path between two members of $R$ and deleting stationary steps gives a path in $K$, proving its connectedness.
  If a group element carries one edge of $K$ to another, it carries their unique tree midpoints to one another. Both midpoints are $r$, so that element lies in $H$. Consequently, each $Gamma$-orbit of edges in $K^(*)$ meets $K$ in at most one $H$-orbit. There are therefore finitely many $H$-edge orbits in $K$. Since $K$ is connected and has at least two vertices, every vertex is incident to an edge; hence there are also finitely many $H$-vertex orbits. Finally, for $p in R$, the stabilizer $H_p$ is the stabilizer of the tree edge $r p$, which is infinite. ◻
]

The graph $K$ need not be locally finite, and its stabilizers need not be finite. These facts cause no difficulty: our arguments use finite orbit sets, rather than finite valence or a proper graph action.

#thm([Lemma 7.2.])[
  #emph[If $a_n \, b_n in P$ both tend to $x in B$, there are paths in $K^(*)$ from $a_n$ to $b_n$ all of whose vertices tend uniformly to $x$.]
  #emph[If the projections of the endpoints of a path in $K^(*)$ are distinct, then, after stationary steps are removed, its projected path uses only vertices of the original path.]
] <block:near-path>

#proof[
  Using the finitely many orbit representatives chosen in Lemma 29, write $a_n = g_n p_(i_n)$ and $b_n = h_n p_(j_n)$. We may choose $g_n$ and $h_n$ to escape every finite subset of $Gamma$: each representative has infinite stabilizer, so there are infinitely many choices for each representing element. Equation (7.1), applied to this finite list of representatives, gives $g_n arrow.r x$ and $h_n arrow.r x$ in $X$.
  By Lemma 15, there are Cayley graph paths from $g_n$ to $h_n$ whose vertices tend uniformly to $x$. Fix finite $K^(*)$-paths from $p_0$ to $s p_0$ for each Cayley generator $s$, and from $p_0$ to each representative $p_i$. Replace a Cayley step $g arrow.r g s$ by the $g$-translate of the first appropriate path. At the endpoints, use the translates of the paths to $p_(i_n)$ and $p_(j_n)$. The result is a $K^(*)$-path from $a_n$ to $b_n$.
  Only finitely many points $t in P$ occur in the fixed path templates. For each such point, $rho \( g t \, g \) arrow.r 0$ as $g$ escapes, by (7.1). The Cayley path vertices escape finite sets uniformly, because they tend uniformly to the boundary point $x$. Hence all vertices of the transferred paths tend uniformly to $x$ as well.
  For the last assertion, Lemma 29 says that every nonconstant projected edge was already an edge of the original path. When the projected endpoints differ, every vertex of the projected path after stationary steps are removed is incident to one of these edges. It therefore occurred in the original path. ◻
]

=== 7.2 Retraction onto a block <retraction-onto-a-block>

#thm([Proposition 7.3.])[
  #emph[The map $pi : P arrow.r R$ extends to a continuous retraction 
$ frak(r) : B arrow.r L \, #h(2em) L = overline(R)^(thin B) \, $

 which is locally constant on $B \\ L$. The space $L$ is a nondegenerate continuum without cut points, and 
$ dim L lt.eq 1 \, #h(2em) caron(H)^1 \( L \; bb(F)_2 \) = 0 . $

]
] <block:retraction>

#proof[
  By the minimality established in Proposition 20, the nonempty invariant set $P$ is dense in $B$. We first determine the limit of $pi \( p_n \)$ whenever $p_n in P$ tends to a point of $B$.
  Let $x in B \\ L$, and choose a neighborhood $O$ of $x$ in $B$ disjoint from $L$. The map $pi$ is constant on $P ∩ V$ for some neighborhood $V subset O$ of $x$. Otherwise, we could choose $a_n \, b_n arrow.r x$ with $pi \( a_n \) eq.not pi \( b_n \)$. Lemma 30 would join them by paths whose vertices eventually all lie in $O$. Their nonconstant projected paths contain vertices in $R$ that also belong to the original paths. This contradicts $O ∩ R = diameter$.
  Now let $x in L$ and $a_n in P$ tend to $x$. Choose $b_n in R$ tending to $x$, and join $a_n$ to $b_n$ by the paths supplied by Lemma 30. Whenever $pi \( a_n \) eq.not b_n$, the same Lemma places $pi \( a_n \)$ on the original path. Therefore $pi \( a_n \) arrow.r x$. The indices for which $pi \( a_n \) = b_n$ satisfy the same conclusion directly.
  Take the closure of the graph of $pi$ in $B times L$. Density of $P$ and compactness of $L$ show that this closed set projects onto $B$. The preceding two paragraphs show that it has exactly one point over each point of $B$. Its projection onto $B$ is consequently a continuous bijection from a compact space to a Hausdorff space, hence a homeomorphism. The second coordinate defines the desired continuous map $frak(r)$. It is the identity on $L$, and the first paragraph makes it locally constant on $B \\ L$.
  Since $B$ is connected, its image $L$ is connected. The set $R$ has at least two points, so $L$ is nondegenerate. The dimension bound follows because $L$ is a closed subset of the compact metric space $B$. If $i : L arrow.r.hook B$ denotes inclusion, then $frak(r) compose i = "id"_L$. Functoriality of Čech cohomology gives $i^(*) frak(r)^(*) = "id"_(caron(H)^1 \( L \; bb(F)_2 \))$. Thus $frak(r)^(*)$ injects this group into $caron(H)^1 \( B \; bb(F)_2 \) = 0$.
  It remains to rule out a cut point of $L$. Suppose that $L \\ { q } = U union.sq V$ is a separation into nonempty open sets. Density supplies $a in R ∩ U$ and $b in R ∩ V$. The extra fiber
  $ F = frak(r)^(- 1) \( { q } \) \\ { q } $
  is closed in $B \\ { q }$ by continuity. It is also open there: it lies in $B \\ L$, where $frak(r)$ is locally constant. Consequently,
  $ B \\ { q } = #scale(x: 120%, y: 120%)[\(] frak(r)^(- 1) \( U \) union F #scale(x: 120%, y: 120%)[\)] union.sq frak(r)^(- 1) \( V \) $
  is a separation, with $a$ and $b$ on opposite sides. This would make $q$ a cut point of $B$ separating two members of $R$, contrary to the separation property of the tree noted above. Hence $L$ has no cut points. ◻
]

=== 7.3 The common setting for path pushing <the-common-setting-for-path-pushing>

We now include the case $P = diameter$ and collect the exact inputs for path pushing. The first two properties below retain the boundary topology and convergence dynamics. The graph conditions describe how vertices and edges approach the boundary: finite orbit sets and comparison with group vertices will control edge lengths even when the graph has infinite valence. When graph vertices lie in the boundary, stabilizer powers send any prescribed finite set of boundary points toward the vertex they fix; this will connect the convergence dynamics to graph components during path pushing. All closures and metrics in the following proposition are inherited from $X$.

#thm([Proposition 7.4.])[
  #emph[There are a subgroup $H lt.eq Gamma$, a compact space $Y = H union.sq L subset X$, and a connected $H$-graph $K$ with vertex set $I subset Y$, with the following properties.]
  + #emph[$Y = overline(H)^(thin X)$. The points of $H$ are isolated in $Y$, and $L$ is a nondegenerate continuum without cut points satisfying 
$ dim L lt.eq 1 \, #h(2em) caron(H)^1 \( L \; bb(F)_2 \) = 0 . $

]
  + #emph[If $h_n arrow.r a in L$ and $h_n^(- 1) arrow.r b in L$, then $h_n$ converges to the constant map $a$, uniformly on compact subsets of $Y \\ { b }$.]
  + #emph[The graph $K$ has finitely many $H$-orbits of vertices and edges. Either $I = H$, or $I subset L$. Every point of $L$ is the limit of a sequence of distinct vertices in $I$.]
  + #emph[For each fixed $w in I$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ rho \( h w \, h \) arrow.r 0 quad upright("as ") h arrow.r oo upright(" in ") H . $ <block:comparison>]

]
  + #emph[For every $x in L$ and every neighborhood $W$ of $x$ in $Y$, there is a neighborhood $V$ of $x$ in $Y$ such that any two vertices of $I ∩ V$ can be joined by a path in $K$ all of whose vertices belong to $W$.]
  + #emph[If $I subset L$, then for each $p in I$ there is an infinite-order element $h in H_p$ such that 
$ h^j z arrow.r p quad \( j arrow.r + oo \) \, #h(2em) z in L . $

]
  #emph[No finite generation assumption on $H$ or local finiteness assumption on $K$ is included in these conclusions.]
] <block:setting>

#proof[
  If $P = diameter$, take $H = Gamma$, $Y = X$, $L = B$, and let $K$ be the original Cayley graph, with $I = H$. The continuum properties are those already proved for $B$, and absence of cut points is the definition of this case. The closure, convergence, finite orbit, and near-path assertions follow from the construction of $X$, Proposition 18, and Lemma 15. Every boundary point is approached by distinct group vertices, since the group vertices are isolated and dense in $X$.
  For completeness, the comparison assertion in this case also follows from convergence. If it failed for a fixed $w in H$, choose escaping $h_n$ with $rho \( h_n w \, h_n \)$ bounded away from zero. After passing to a subsequence, compactness gives $h_n arrow.r a in B$ and $h_n^(- 1) arrow.r b in B$. Since $w in H$ is different from $b$, Proposition 18 gives $h_n w arrow.r a$, a contradiction. The last assertion has no content in this case.
  If $P eq.not diameter$, use the objects constructed above:
  $ H = Gamma \( r \) \, #h(2em) I = R \, #h(2em) L = overline(R)^(thin B) \, #h(2em) Y = H union.sq L \, $
  and let $K$ be the graph of Lemma 29. The continuum and finite orbit assertions follow from that Lemma and Proposition 31. We verify the remaining interfaces explicitly.
  First, $Y = overline(H)^(thin X)$. Fix $p in R$. If an escaping sequence $h_n in H$ converges to a boundary point, then (7.1) and $h_n p in R$ show that its limit belongs to $L$. Conversely, for any $p in R$, the infinite stabilizer $H_p$ supplies distinct elements $h_n$ with $h_n p = p$. Equation (7.1) gives $h_n arrow.r p$. Thus $R subset overline(H)^(thin X)$, and taking closures gives $L subset overline(H)^(thin X)$. No point of $Gamma \\ H$ belongs to this closure, since all group vertices are isolated. This proves the equality and compactness of $Y$. The subgroup $H$ preserves both $L$ and $Y$, and the convergence assertion is the restriction of Proposition 18.
  The set $R$ is dense in the nondegenerate continuum $L$, which has no isolated points. It follows that every point of $L$ is approached by distinct members of $R$: otherwise a sufficiently small neighborhood would meet $R$ in at most one point and make that point isolated in $L$. Equation (7.2) is exactly (7.1) restricted to $H$.
  For the near-path assertion, take two sequences in $R$ tending to the same point of $L$. Lemma 30 joins them by $K^(*)$-paths whose vertices tend uniformly to that point. Project to $R$. If the endpoints differ, the projected paths use only vertices of the original paths; if they agree, use the constant path. Thus the projected $K$-paths still tend uniformly to that point. In metric spaces this sequential statement gives the stated neighborhood formulation: a failure for some $W$ would yield endpoints in successively smaller balls that cannot be joined inside $W$.
  Finally, $H_p$ is infinite by Lemma 29. Since $Gamma$ is torsion-free, it contains an infinite-order element. The cut-point stabilizer conclusions in Lemma 25 make this element parabolic with fixed point $p$. Its powers have the asserted dynamics by Lemma 19. ◻
]

== 8 Component labels and annular depth <sec:annuli>

The graph paths supplied by Proposition 32 stay near a boundary point, but they may pass through vertices that we need to remove. We first show how to assign a component of the remaining graph to a nearby boundary point. We then construct an invariant integer-valued depth on group vertices. These are the two inputs for pushing paths towards the boundary in the next section.

We use the following setting from Proposition 32. The compact metric space $\( Y \, rho \)$ is the disjoint union $H union.sq L$, where $H$ is a group, its points are isolated, and $H$ acts on $Y$ by homeomorphisms extending left multiplication. The space $L$ is a nondegenerate continuum, has no cut point, and satisfies $dim L lt.eq 1$ and $caron(H)^1 \( L \; bb(F)_2 \) = 0$. If distinct elements $g_n in H$ satisfy $g_n arrow.r a$ and $g_n^(- 1) arrow.r b$, then $a \, b in L$ and $g_n$ converges to $a$ uniformly on compact subsets of $Y \\ { b }$.

There is a connected $H$-graph $K$ with vertex set $I$, where either $I = H$ or $I subset L$. It has finitely many vertex and edge orbits. Every point of $L$ is a limit of distinct vertices of $K$, and, for every $x in L$ and neighborhood $W$ of $x$ in $Y$, there is a neighborhood $V$ of $x$ such that any two vertices in $I ∩ V$ can be joined by a finite path of $K$ whose vertices lie in $W$. For each fixed $w in I$,

$ rho \( g w \, g \) arrow.r 0 #h(2em) \( g in H upright(" leaving every finite set") \) . $

When $I subset L$, every $p in I$ has an infinite-order stabilizer element $h in H$ for which $h^j z arrow.r p$ for every $z in L$ as $j arrow.r + oo$. No local finiteness of $K$ or finite generation of $H$ is assumed here.

=== 8.1 Extending labels across a deleted point <extending-labels-across-a-deleted-point>

We write $k = bb(F)_2$ with its discrete topology. A locally constant map to $k$ records a division into two open and closed parts. The cohomology hypothesis prevents such a division from appearing only after one point has been removed from a small neighborhood. The circle shows why absence of cut points alone would not suffice: removing the midpoint of a small open arc leaves two sides that can carry different constant labels.

#thm([Lemma 8.1.])[
  #emph[Let $L$ be a nondegenerate compact metric continuum with no cut point and $caron(H)^1 \( L \; k \) = 0$. If $x in L$ and $V$ is an open neighborhood of $x$ in $L$, every locally constant map $u : V \\ { x } arrow.r k$ extends uniquely to a locally constant map on $V$.]
] <ann:extension>

#proof[
  Put $U = L \\ { x }$. We prove directly, using finite-cover cohomology, that there are locally constant maps $f_U : U arrow.r k$ and $f_V : V arrow.r k$ such that
  $ u = f_U + f_V quad upright("on ") U ∩ V . $
  Choose open sets $U_0 \, V_0$ covering $L$ whose closures are contained in $U \, V$, respectively. The set $C = overline(U_0) ∩ overline(V_0)$ is a compact subset of $U ∩ V$. Its two subsets $C ∩ u^(- 1) \( 0 \)$ and $C ∩ u^(- 1) \( 1 \)$ are disjoint compact sets. Choose $delta > 0$ smaller than their distance when both are nonempty; if either is empty, any positive $delta$ suffices.
  Take a finite open cover $\( W_i \)$ of $L$ refining $\( U_0 \, V_0 \)$, with each $W_i$ of diameter less than $delta$, and give it a parent $P_i in { U \, V }$ according to this refinement. On every nonempty $W_i ∩ W_j$, define $c_(i j) = 0$ if $P_i = P_j$, and define $c_(i j)$ to be the value of $u$ there otherwise. This latter value is constant: the intersection lies in $C$ and cannot meet both of its two compact parts. At a triple intersection either all parents agree, or exactly two of the three transition values equal the same value of $u$. Thus $\( c_(i j) \)$ is a $1$-cocycle on the nerve of $\( W_i \)$.
  Since $caron(H)^1 \( L \; k \) = 0$, some finite open refinement $\( Z_alpha \)$, with refinement map $r$, admits constants $a_alpha in k$ satisfying
  $ a_alpha + a_beta = c_(r \( alpha \) r \( beta \)) quad upright("whenever ") Z_alpha ∩ Z_beta eq.not diameter . $
  For $z in U ∩ Z_alpha$, set $f_U \( z \) = a_alpha$ if $P_(r \( alpha \)) = U$, and set $f_U \( z \) = a_alpha + u \( z \)$ otherwise. The displayed identity makes these definitions agree on overlaps. They are locally constant. Define $f_V$ by the same rule, with $U \, V$ interchanged. Then $f_U + f_V = u$ on $U ∩ V$.
  Since $x$ is not a cut point, $U$ is connected, so $f_U$ has one constant value, say $c$. The map $f_V + c$ is the required extension. Uniqueness follows because a nondegenerate continuum has no isolated points, so $V \\ { x }$ is dense in $V$. ◻
]

For a set $D subset Y$, denote by $D'$ the set of limits in $Y$ of sequences of distinct points of $D$. In a metric space $D'$ is closed. For an allowed vertex set $T subset I$, put

$ Omega_T = L \\ \( I \\ T \)' . $

This is precisely the open set of boundary points near which deleted vertices do not accumulate as distinct points. We use graph components of the induced graph $K \[ T \]$.

#thm([Lemma 8.2.])[
  #emph[In the setting above, each $x in Omega_T$ determines a unique component $Q_T \( x \)$ of $K \[ T \]$ such that all allowed vertices in some neighborhood of $x$ belong to $Q_T \( x \)$. Every $x in Omega_T$ is a limit of distinct allowed vertices, and the assignment $Q_T$ is locally constant on $Omega_T$. If $t in T ∩ L ∩ Omega_T$, then $Q_T \( t \)$ is the component containing the vertex $t$ itself.]
] <ann:component>

#proof[
  There is a neighborhood $W$ of $x$ such that $\( I \\ T \) ∩ W subset { x }$. Since $x$ is a limit of distinct vertices of $I$, it is consequently a limit of distinct vertices of $T$ as well.
  Suppose first that $x$ is not a deleted vertex. After shrinking $W$, it contains no deleted vertex. The near-path property then puts all vertices sufficiently near $x$ in one component of $K \[ T \]$. There are allowed vertices arbitrarily near $x$, so this component is unique. The same neighborhood, together with approximation by allowed vertices, shows that the component assignment is locally constant near $x$. When $x$ itself is an allowed vertex, it belongs to this component.
  The remaining case has $I subset L$ and $x in I \\ T$. Choose an open neighborhood $V$ of $x$ in $L$ containing no other deleted vertex. By the preceding case, every $y in V \\ { x }$ has a component label, and these labels form a locally constant map
  $ q : V \\ { x } arrow.r { upright("components of ") K \[ T \] } . $
  Every map from this label set to $k$, composed with $q$, extends across $x$ by Lemma 33. We claim this forces $q$ itself to be constant sufficiently near $x$.
  To see this, call a label recurrent if it occurs arbitrarily near $x$. If two labels are recurrent, a coloring separating them contradicts the extension property. If exactly one label is recurrent but $q$ is not eventually constant, color that label $0$ and all others $1$ to obtain the same contradiction. If no label is recurrent, a sequence of points tending to $x$ can be chosen with pairwise distinct labels: at each step, first exclude the finitely many labels already chosen. Color these successive labels alternately $0$ and $1$. This again contradicts extension as a locally constant map. Thus one component label occurs throughout a small punctured neighborhood of $x$. Every allowed vertex there belongs to its own label by the first case, so all these vertices belong to that component.
  This proves existence at a deleted vertex too. Approximation by allowed vertices proves uniqueness and, on shrinking the neighborhood once more, local constancy of $Q_T$ there. ◻
]

=== 8.2 An invariant system of annuli <an-invariant-system-of-annuli>

We use the annulus-system method of #cite(label("Bowditch1998Topological")) Sections 6–7, with the following nesting convention. The construction and the two properties needed here are proved explicitly; the sides need not be connected.

An #emph[annulus] in $Y$ is an ordered pair $sigma = \( sigma^(-) \, sigma^(+) \)$ of disjoint closed subsets of $Y$ such that each side meets $L$ and $sigma^(-) union sigma^(+) eq.not Y$. Its sides need not be connected. For annuli $sigma \, tau$, write

$ sigma < tau quad arrow.l.r.double quad sigma^(+) union tau^(-) = Y . $

Then $sigma^(-) subset "int" \( tau^(-) \)$ and $tau^(+) subset "int" \( sigma^(+) \)$. The relation is transitive and irreflexive. Thus a nested chain $sigma_1 < dots.h.c < sigma_n$ contains distinct annuli. A chain goes #emph[from $F$ to $E$] if $F subset sigma_1^(-)$ and $E subset sigma_n^(+)$.

#thm([Lemma 8.3.])[
  #emph[There is a set $cal(A)$ of annuli invariant under $H$ and under interchange of the two sides, with the following properties.]
  + #emph[For every $delta > 0$, only finitely many annuli in $cal(A)$ have both sides of diameter at least $delta$.]
  + #emph[For every closed $F subset Y$, every $x in L \\ F$, and every integer $n gt.eq 1$, there is a chain of $n$ annuli in $cal(A)$ from $F$ to a neighborhood of $x$ in $Y$.]
] <ann:system>

#proof[
  We first record a uniform consequence of convergence. For every $r \, epsilon > 0$, all but finitely many $g in H$ admit a point $b_g in L$ such that
  $ "diam" g #scale(x: 120%, y: 120%)[\(] Y \\ B_rho \( b_g \, r \) #scale(x: 120%, y: 120%)[\)] < epsilon . $
  Otherwise choose distinct exceptions $g_n$ and pass to a subsequence with $g_n arrow.r a in L$ and $g_n^(- 1) arrow.r b in L$. Uniform convergence on the compact set $Y \\ B_rho \( b \, r \)$ gives a contradiction.
  Choose $r_i arrow.b 0$ with $r_i < "diam" \( L \) \/ 3$, and put $epsilon_i = 2^(- i)$. Apply the preceding observation with $r = r_i \/ 4$ and $epsilon = epsilon_i$, obtaining a finite exceptional set $E_i subset H$. Uniform continuity of the finitely many maps in $E_i$ permits a common choice $0 < s_i < r_i \/ 4$ such that
  $ "diam" g #scale(x: 120%, y: 120%)[\(] overline(B_rho \( y \, s_i \)) #scale(x: 120%, y: 120%)[\)] < epsilon_i quad \( g in E_i \, med y in L \) . $
  Choose finitely many centers $y_(i j) in L$ whose $s_i \/ 2$-balls cover $L$. At each center take the seed annulus
  $ sigma_(i j)^(-) = Y \\ B_rho \( y_(i j) \, r_i \) \, #h(2em) sigma_(i j)^(+) = overline(B_rho \( y_(i j) \, s_i \)) . $
  Its sides are disjoint and have distance at least $r_i - s_i$. The positive side contains its center. The negative side meets $L$ because every point of $L$ is at distance at least $"diam" \( L \) \/ 2$ from some point of $L$. The sides cannot cover $L$, since their nonempty closed intersections with $L$ would disconnect it.
  Let $cal(A)$ consist of all distinct translates of these annuli and their reversals. A ball of radius $r_i \/ 4$ cannot meet both sides of a seed annulus, whose mutual distance exceeds $3 r_i \/ 4$. For $g in.not E_i$, one side therefore lies outside the exceptional ball for $g$ and has image of diameter less than $epsilon_i$. For $g in E_i$, the positive side has that property by the choice of $s_i$. Consequently every translated level-$i$ annulus has at least one side of diameter less than $epsilon_i$.
  For a fixed seed and fixed $delta > 0$, only finitely many distinct translates can have both sides of diameter at least $delta$. If not, choose corresponding distinct group elements and a convergence subsequence with repeller $b$. At least one of the two closed seed sides excludes $b$, so its images have diameter tending to zero. There are only finitely many seeds at each level, and levels with $epsilon_i < delta$ contribute no annuli with two such large sides. This proves the first assertion.
  For the second assertion, let $F$ be closed and $x in L \\ F$. At a sufficiently fine level, choose a center $y_(i j)$ with $rho \( x \, y_(i j) \) < s_i \/ 2$ and $r_i + s_i \/ 2 < "dist" \( x \, F \)$ when $F$ is nonempty. The negative side contains $F$, and the positive side contains a neighborhood of $x$. Suppose an annulus already chosen has positive side containing $B_rho \( x \, eta \)$. Choose a finer level with $r_j + s_j \/ 2 < eta$, and a center $y$ within $s_j \/ 2$ of $x$. Then $B_rho \( y \, r_j \) subset B_rho \( x \, eta \)$, so the new annulus is larger in the order $<$, and its positive side again contains a neighborhood of $x$. Repeating gives any prescribed finite length. ◻
]

Fix such a system $cal(A)$. For $F subset Y$ and $v in Y$, define

$ D \( F \, v \) = sup { n gt.eq 1 : upright("a chain of length ") n upright(" in ") cal(A) upright(" goes from ") F upright(" to ") { v } } \, $

with value $0$ if there is no such chain. In general the value belongs to ${ 0 \, 1 \, 2 \, dots.h } union { oo }$. We abbreviate $D \( { u } \, v \)$ to $D \( u \, v \)$. This function counts separating annuli; it is not asserted to be a metric.

#thm([Lemma 8.4.])[
  #emph[For $g in H$, $F subset Y$, and $v in Y$, 
$ D \( g F \, g v \) = D \( F \, v \) . $

 If $F$ contains a point of $H$ and $v in H$, then $D \( F \, v \)$ is finite. When it is positive, a chain attains this finite maximum. If $F$ is closed, $x in L \\ F$, and $N gt.eq 1$, there is a neighborhood $V_N$ of $x$ in $Y$ such that $D \( F \, v \) gt.eq N$ for every $v in V_N$.]
] <ann:depth>

#proof[
  Translation carries annuli and chains bijectively to annuli and chains, which proves equivariance. Suppose $h in F ∩ H$ and $v in H$. As $L$ is closed and excludes $h \, v$, the number
  $ delta = min { "dist" \( h \, L \) \, "dist" \( v \, L \) } $
  is positive. Throughout a chain from $F$ to $v$, every negative side contains $h$ and meets $L$, and every positive side contains $v$ and meets $L$. Both sides therefore have diameter at least $delta$. Lemma 35 supplies only finitely many such annuli, and a strict chain cannot repeat one. This proves finiteness. A finite nonzero supremum of possible integer lengths is attained. The final assertion is precisely the second part of Lemma 35, using its terminal neighborhood. ◻
]

== 9 Pushing paths and local connectedness <sec:path-pushing>

We work in the setting of Proposition 32, with compact metric space $Y = H union.sq L$ and graph $K$ on $I$, and use the annulus system of Lemma 35. Our aim is to turn paths near a point of $L$ into connected subsets of $L$. To do this we push the paths arbitrarily far from a fixed closed set and then take limits of their vertex sets. The graph can have infinite valence and infinite vertex stabilizers; none of the arguments below requires finite generation of $H$.

At a fixed depth, nearby boundary points determine components of the remaining graph. We will prove that, beyond one common threshold, increasing the depth cannot separate points with the same component label. Iterating this fact produces a single boundary neighborhood whose points retain the same component label at every greater depth. Limits of the resulting graph paths will then lie entirely in the boundary.

=== 9.1 A uniform depth comparison <a-uniform-depth-comparison>

Fix a closed subset $A subset Y$ with $1 in A$ and $L \\ A eq.not diameter$. The annular depth $D \( F \, v \)$ is the maximum length of a chain from $F$ to $v$ when it is finite, as in Lemma 36. Write

$ d_0 = "dist" \( 1 \, L \) > 0 \, #h(2em) N \( a \, b \) = \# { sigma : "diam" sigma^(-) gt.eq a \, "diam" sigma^(+) gt.eq b } quad \( a \, b > 0 \) . $

The number $N \( a \, b \)$ is finite by Lemma 35. A side containing $1$ has diameter at least $d_0$, because every side meets $L$.

#thm([Lemma 9.1.])[
  #emph[Let $g_n in H$ satisfy $D \( A \, g_n \) arrow.r oo$, and set $F_n = g_n^(- 1) A$. After passage to a subsequence there is $q in L$ such that $F_n$ converges in the Hausdorff metric to ${ q }$.]
] <push:shrinking>

#proof[
  By equivariance, $D \( F_n \, 1 \) = D \( A \, g_n \)$. In any chain from $F_n$ to $1$, every positive side contains $1$. If the chain has more than $N \( epsilon.alt \, d_0 \)$ members, one of its negative sides has diameter less than $epsilon.alt$. This side contains $F_n$. Hence $"diam" F_n arrow.r 0$.
  Lemma 36 gives $D \( A \, g \) < oo$ for each fixed $g in H$. Thus $g_n$ escapes every finite subset of $H$, as does $g_n^(- 1)$. Since $1 in A$, we have $g_n^(- 1) in F_n$. Compactness of $Y$ and isolatedness of its group vertices give a subsequence $g_n^(- 1) arrow.r q in L$. The diameter conclusion now gives the assertion. ◻
]

#thm([Lemma 9.2.])[
  #emph[Suppose $F_n = g_n^(- 1) A$ converges to ${ q }$ as in Lemma 37. For each $r > 0$, set 
$ C_r = N \( r \/ 2 \, d_0 \) + N \( d_0 \, r \) + 2 . $

 For all sufficiently large $n$, uniformly over every $b in H$ with $rho \( b \, q \) gt.eq 3 r$, one has 
#[#set math.equation(numbering: n => "(9.1)")
 $ D \( F_n \, b \) gt.eq D \( F_n \, 1 \) + D \( { 1 } \, b \) - C_r . $ <eq:push-depth-comparison>]

 Consequently, if $b_n in H$ tends to $z in L \\ { q }$, then 
$ D \( F_n \, b_n \) gt.eq D \( F_n \, 1 \) + D \( { 1 } \, b_n \) - C quad upright("and") quad D \( { 1 } \, b_n \) arrow.r oo $

 for a constant $C$ independent of $n$.]
] <push:depth-comparison>

#proof[
  Choose $n$ large enough that $F_n subset B \( q \, r \/ 2 \)$ and $ell = D \( F_n \, 1 \) > N \( r \/ 2 \, d_0 \) + 1$. Take a chain $sigma_1 < dots.h.c < sigma_ell$ of maximum length from $F_n$ to $1$, and put $U = B \( q \, r \)$. If $sigma_j^(-) subset.not U$, its negative side contains a point of $F_n$ and a point outside $U$, so has diameter at least $r \/ 2$. Its positive side has diameter at least $d_0$. There are therefore at most $N_(-) = N \( r \/ 2 \, d_0 \)$ such annuli. Because negative sides increase along a chain, these form a terminal segment. Remove that segment and one further annulus. The retained initial chain has at least $ell - N_(-) - 1$ members. The negative side of the next annulus lies in $U$, so the last retained positive side contains $Y \\ U$. In particular, this retained chain already ends on the side containing any $b$ under consideration.
  Let $t = D \( { 1 } \, b \)$, and take a maximum chain $tau_1 < dots.h.c < tau_t$ from $1$ to $b$ when $t > 0$. Put $V = Y \\ overline(B \( q \, 2 r \))$. A positive side not contained in $V$ contains both $b$ and a point at distance at most $2 r$ from $q$, so has diameter at least $r$. Every negative side contains $1$, so has diameter at least $d_0$. Thus at most $N_(+) = N \( d_0 \, r \)$ positive sides fail to lie in $V$; these form an initial segment. If $t > N_(+) + 1$, remove this initial segment and one further annulus. The retained final chain has at least $t - N_(+) - 1$ members, and its first negative side contains $Y \\ V$.
  Since $U ∩ V = diameter$, the last positive side of the first retained chain and the first negative side of the second cover $Y$. The defining order relation therefore concatenates the two chains. Their total length is at least $ell + t - N_(-) - N_(+) - 2$. If $t lt.eq N_(+) + 1$, the first retained chain alone has at least this length. This proves (9.1), including a constant and threshold independent of $b$.
  For the final assertion choose $r$ with $4 r < rho \( q \, z \)$. Eventually $rho \( b_n \, q \) gt.eq 3 r$, so the inequality applies. For any prescribed integer $N$, Lemma 35 supplies a chain of length $N$ from ${ 1 }$ to a neighborhood of $z$. Eventually this neighborhood contains $b_n$, proving $D \( { 1 } \, b_n \) arrow.r oo$. ◻
]

Figure 2 illustrates this pruning and concatenation for a sequence $b_n arrow.r z eq.not q$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$F_n$]])
  content((3.1, 0), [#box(inset: (x: 0.2822cm, y: 0.3333em), radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$sigma_1< dots.h < sigma_i$]]])])
  content((7.25, 0), [#box(inset: (x: 0.2469cm, y: 0.3333em), radius: 2pt, stroke: (paint: rgb("#4d4d4d"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#262626"))[#text(size: 9pt)[discard $lt.eq N_-+1$]]]])])
  content((10.1, 0), [#text(size: 9pt)[$1$]])
  line((0.3072, 0), (2.31, 0), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, fill: black)))
  line((3.89, 0), (5.979, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.17cm, fill: rgb("#4d4d4d"))))
  line((8.521, 0), (9.896, 0), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.17cm, fill: rgb("#4d4d4d"))))
  content((0, -1.2), [#text(size: 9pt)[$1$]])
  content((2.85, -1.2), [#box(inset: (x: 0.2469cm, y: 0.3333em), radius: 2pt, stroke: (paint: rgb("#4d4d4d"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#262626"))[#text(size: 9pt)[discard $lt.eq N_++1$]]]])])
  content((7, -1.2), [#box(inset: (x: 0.2822cm, y: 0.3333em), radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$tau_j< dots.h < tau_t$]]])])
  content((10.1, -1.2), [#text(size: 9pt)[$b_n$]])
  line((0.204, -1.2), (1.579, -1.2), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.17cm, fill: rgb("#4d4d4d"))))
  line((4.121, -1.2), (6.21, -1.2), stroke: (paint: rgb("#4d4d4d"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", length: 0.17cm, fill: rgb("#4d4d4d"))))
  line((7.79, -1.2), (9.84, -1.2), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, fill: black)))
  content((5.05, -2.48), [#text(size: 9pt)[$Y without U subset sigma_i^+#h(0.1667em) , U inter V= nothing#h(0.1667em) , Y without V subset tau_j^-$#linebreak() $sigma_i^+ union tau_j^-=Y arrow.r.double.long sigma_i< tau_j$]])
  content((5.05, -3.82), [#box(inset: (x: 0.4233cm, y: 0.3333em), radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$sigma_1< dots.h < sigma_i< tau_j< dots.h < tau_t$]]])])
  content((0, -3.82), [#text(size: 9pt)[$F_n$]])
  content((10.1, -3.82), [#text(size: 9pt)[$b_n$]])
  line((0.3072, -3.82), (3.531, -3.82), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, fill: black)))
  line((6.569, -3.82), (9.84, -3.82), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.17cm, fill: black)))
})],
  caption: [Figure 2: Concatenating annular chains after bounded pruning. Choose fixed disjoint neighborhoods $U$ of $q$ and $V$ of $z$, where $F_n$ shrinks to $q$ and $b_n arrow.r z eq.not q$. The terminal positive side of the first retained chain contains $Y \\ U$; the initial negative side of the second contains $Y \\ V$. Their union is $Y$, which is exactly the annulus-order criterion for joining the chains. The diagram records order and containment only; the sides need not be connected. ],
) <fig:annular-chains>

=== 9.2 Components of the deeper vertex sets <components-of-the-deeper-vertex-sets>

Choose one representative $p_i$ for each of the finitely many $H$-orbits in $I$. When $I = H$, use only $p_1 = 1$. For a vertex $u$ in the orbit of $p_i$, define its set of representatives in the group by

$ C \( u \) = { g in H : g p_i = u } . $

For integers $m gt.eq 0$ define

#[#set math.equation(numbering: n => "(9.2)")
 $ I_m = {u in I \\ A : min_(g in C \( u \)) D \( A \, g \) gt.eq m} . $ <eq:push-deep-vertices>]

Each depth in this minimum is a finite nonnegative integer, so the minimum exists. The condition concerns #emph[every] representative of $u$. This will allow us to move through an infinite stabilizer without losing the depth bound.

#thm([Lemma 9.3.])[
  #emph[For each fixed $m$, the deleted vertices $I \\ I_m$ have no accumulation by distinct vertices at any point of $L \\ A$. Consequently Lemma 34 defines a locally constant map 
$ Q_m : L \\ A arrow.r { upright("components of ") K \[ I_m \] } \, $

 whose value at $x$ contains all vertices of $I_m$ sufficiently near $x$. Every $x in L \\ A$ is approached by distinct vertices with this label. Moreover, for each finite subset $E subset I$ one has $E ∩ I_m = diameter$ for all sufficiently large $m$.]
] <push:component-labels>

#proof[
  For $m = 0$ the first assertion follows from $I_0 = I \\ A$. Suppose $m gt.eq 1$. Suppose that distinct $u_n in I \\ I_m$ tend to $x in L \\ A$. Eventually $u_n in.not A$, so choose $a_n in C \( u_n \)$ with $D \( A \, a_n \) < m$. Since there are only finitely many orbit representatives and the $u_n$ are distinct, $a_n$ escapes every finite subset of $H$. The comparison $rho \( g p_i \, g \) arrow.r 0$ in Proposition 32, applied to the finite list of representatives, gives $a_n arrow.r x$. A chain from $A$ to a neighborhood of $x$ of length $m$, supplied by Lemma 35, contradicts $D \( A \, a_n \) < m$ for large $n$. The assertions about $Q_m$ and approximation follow from Lemma 34.
  Finally, for each $u in E \\ A$ choose a single $a_u in C \( u \)$. The depth $D \( A \, a_u \)$ is finite. Taking $m$ larger than all these finitely many depths excludes every vertex of $E$ from $I_m$. ◻
]

Our goal is now to find one depth threshold beyond which increasing $m$ to $m + 1$ never separates boundary points with the same component label. The next three lemmas establish the uniformity needed for Lemma 43.

The next lemma is the main use of the uniform depth estimate. It says that translating from a vertex of large depth leaves only finitely many deleted vertices in any fixed region away from one boundary point. The exceptional finite set is independent of the index of the sequence.

#thm([Lemma 9.4.])[
  #emph[Let $m_n arrow.r oo$ and $D \( A \, g_n \) gt.eq m_n$. Pass to a subsequence for which $F_n = g_n^(- 1) A$ tends to ${ q }$, with $q in L$. For every compact $E subset Y \\ { q }$ there are a finite set $S_E subset I$ and an index $n_E$ such that 
$ E ∩ g_n^(- 1) \( I \\ I_(m_n + 1) \) subset S_E #h(2em) \( n gt.eq n_E \) . $

]
] <push:translated-deletions>

#proof[
  If no such finite set and index exist, choose indices tending to infinity and pairwise distinct vertices; relabel them so that
  $ w_n in E ∩ g_n^(- 1) \( I \\ I_(m_n + 1) \) . $
  Compactness gives a further subsequence $w_n arrow.r z in E$. The limit lies in $L$: this is automatic when $I subset L$, and follows from isolatedness of group vertices when $I = H$. Since $F_n$ tends to $q in.not E$, eventually $w_n in.not F_n$. The deletion of $g_n w_n$ therefore gives a representative $g_n b_n in C \( g_n w_n \)$ such that
  $ D \( F_n \, b_n \) = D \( A \, g_n b_n \) < m_n + 1 . $
  After restricting to one orbit representative we have $w_n = b_n p_i$. Distinctness of the $w_n$ forces $b_n$ to escape finite subsets of $H$, and the comparison with group vertices gives $b_n arrow.r z eq.not q$. Lemma 38 now yields
  $ D \( F_n \, b_n \) gt.eq m_n + D \( { 1 } \, b_n \) - C > m_n + 1 $
  for large $n$, a contradiction. ◻
]

#thm([Lemma 9.5.])[
  #emph[For the sequences in Lemma 40, define 
$ ell_n \( z \) = Q_(m_n + 1) \( g_n z \) $

 whenever $z in L$ and $g_n z in.not A$. For each $z in L \\ { q }$ there are a relative neighborhood $V_z subset L \\ { q }$ and an index $n_z$ such that all values $ell_n \( w \)$ with $w in V_z$ and $n gt.eq n_z$ are defined and 
$ ell_n \( w \) = ell_n \( z \) #h(2em) \( w in V_z \, med n gt.eq n_z \) . $

 For any two points $z \, z' in L \\ { q }$ one consequently has $ell_n \( z \) = ell_n \( z' \)$ for all sufficiently large $n$. The last threshold may depend on the two points.]
] <push:eventual-labels>

#proof[
  Choose an open neighborhood $O$ of $z$ in $Y$ whose closure misses $q$. Apply Lemma 40 to the compact set $E = overline(O)$. There are a finite set $S subset I$ and an index $n_0$ such that
  $ T = \( I ∩ O \) \\ S quad upright("satisfies") quad g_n T subset I_(m_n + 1) #h(2em) \( n gt.eq n_0 \) . $
  The deleted vertices $I \\ T$ have no distinct accumulation at any point of $O ∩ L$. Lemma 34 therefore gives a neighborhood $V_z subset O ∩ L$ on which the component of $K \[ T \]$ approached by vertices is constant; denote it by $C$. Shrink $V_z$ if needed. Since $F_n arrow.r { q }$, all $g_n w$ for $w in V_z$ lie outside $A$ once $n$ is large.
  Fix such an $n$. Every $w in V_z$ is approached by vertices of $C$. Their images approach $g_n w$ and lie in the connected subgraph $g_n C$ of $K \[ I_(m_n + 1) \]$. The defining property of $Q_(m_n + 1)$ therefore identifies $ell_n \( w \)$ with the component containing $g_n C$, for every $w in V_z$. This gives the asserted neighborhood and threshold, simultaneously for all its points.
  On $L \\ { q }$, declare $z tilde.op z'$ if their labels agree for all sufficiently large $n$. Eventual equality is an equivalence relation, even though the label set can change with $n$. The first part shows that every equivalence class is open. Since $q$ is not a cut point, $L \\ { q }$ is connected, so this partition has one class. ◻
]

=== 9.3 A common threshold for all graph paths <a-common-threshold-for-all-graph-paths>

So far the conclusions concerned a chosen sequence of deep group vertices. We now use three fixed boundary points to obtain one threshold that works for every graph path. The number three ensures that two of these points always avoid the single exceptional point in Lemma 41.

Choose a set $Z subset L$ of three distinct points; it exists because $L$ is a nondegenerate continuum.

#thm([Lemma 9.6.])[
  #emph[For every finite set $S subset H$, there is an integer $M = M \( A \, Z \, S \) gt.eq 1$ with the following properties for all integers $m gt.eq M$.]
  + #emph[If $D \( A \, g \) gt.eq m$, at least two points of $g Z$ lie in $L \\ A$ and have a common $Q_(m + 1)$ label. Denote this unique majority label by $J_m \( g \)$.]
  + #emph[If $s in S$ and $D \( A \, g \) \, D \( A \, g s \) gt.eq m$, then $J_m \( g \) = J_m \( g s \)$.]
] <push:majority>

#proof[
  If the first assertion fails at arbitrarily large depths, choose $m_n arrow.r oo$ and $g_n$ violating it with $D \( A \, g_n \) gt.eq m_n$. Pass to a subsequence with $g_n^(- 1) A arrow.r { q }$. Two fixed points of $Z$ avoid $q$. By Lemma 41, their images under $g_n$ eventually lie outside $A$ and have the same $Q_(m_n + 1)$ label, a contradiction. This also proves uniqueness of the majority label, since two different labels cannot each occur at two points of a three-point set.
  After choosing a threshold for the first assertion, suppose that the second fails at arbitrarily large $m$. Choose a violating sequence and, since $S$ is finite, restrict to one fixed $s in S$. Again pass to a subsequence with $g_n^(- 1) A arrow.r { q }$. Choose two points of $Z \\ { q }$ and two points of $s Z \\ { q }$. Lemma 41 makes the labels of all four images under $g_n$ equal for all sufficiently large $n$. They determine the majority labels of both $g_n Z$ and $g_n s Z$, contradicting the chosen inequality. ◻
]

We choose the finite set $S$ once and for all as follows. There are finitely many orbits of ordered edges: allowing both orientations at most doubles the number of edge orbits. For each representative $\( u_e \, v_e \)$ choose $a_e \, b_e in H$ and indices $i \( e \) \, j \( e \)$ such that

$ u_e = a_e p_(i \( e \)) \, #h(2em) v_e = b_e p_(j \( e \)) \, $

and include $a_e^(- 1) b_e$ in $S$. Thus the endpoints of every edge have representatives $g$ and $g s$ for some $s in S$. When $I subset L$, also include, for each $p_i$, a stabilizing element $h_i in H$ supplied by Proposition 32, with

$ h_i p_i = p_i \, #h(2em) h_i^j z arrow.r p_i quad \( z in L \, med j arrow.r + oo \) . $

Fix the threshold $M$ of Lemma 42 for this list.

#thm([Lemma 9.7.])[
  #emph[For every $m gt.eq M$ and all $x \, y in L \\ A$, 
#[#set math.equation(numbering: n => "(9.3)")
 $ Q_m \( x \) = Q_m \( y \) quad arrow.r.double quad Q_(m + 1) \( x \) = Q_(m + 1) \( y \) . $ <eq:push-refinement>]

 In particular, the threshold $M$ is independent of $x$ and $y$.]
] <push:refinement>

#proof[
  First suppose $I subset L$. We claim that for every $v in I_m$ and every $g in C \( v \)$,
  #[#set math.equation(numbering: n => "(9.4)")
   $ J_m \( g \) = Q_(m + 1) \( v \) . $ <eq:push-support-label>]
  Let $v = g p_i$. For all $j gt.eq 0$, the element $g h_i^j$ also belongs to $C \( v \)$. The minimum in (9.2) gives $D \( A \, g h_i^j \) gt.eq m$ for every $j$. The move $h_i$ belongs to $S$, so Lemma 42 gives
  $ J_m \( g \) = J_m \( g h_i \) = J_m \( g h_i^2 \) = dots.h.c . $
  Here $g$ and $m$ are fixed. As $j arrow.r oo$, the three anchors $g h_i^j Z$ tend to $v$. Since $v in L \\ A$ and $Q_(m + 1)$ is locally constant there, all three anchors eventually have label $Q_(m + 1) \( v \)$. This proves (9.4). The label at $v$ is defined even when $v in.not I_(m + 1)$; it records the component approached by allowed vertices near $v$.
  If $v \, w in I_m$ are adjacent, choose their representatives $g \, g s$ using the finite edge list. Both depths are at least $m$ by the minimum convention. Lemma 42 and (9.4) give $Q_(m + 1) \( v \) = Q_(m + 1) \( w \)$. Thus $Q_(m + 1)$ is constant along every path in $K \[ I_m \]$. If $Q_m \( x \) = Q_m \( y \)$, choose vertices in this component sufficiently near $x$ and $y$ that their $Q_(m + 1)$ labels equal those of $x$ and $y$. Such vertices exist by Lemma 39 and local constancy of $Q_(m + 1)$. A path in their common component proves (9.3).
  Now suppose $I = H$. There is a single representative $p_1 = 1$, and $C \( v \) = { v }$. The finite edge moves and Lemma 42 imply that $J_m$ is constant along paths of $K \[ I_m \]$. For a fixed $x in L \\ A$ and fixed $m gt.eq M$, we claim that
  $ J_m \( g \) = Q_(m + 1) \( x \) quad upright("for all group vertices ") g upright(" sufficiently near ") x . $
  These vertices belong to $I_m$ when sufficiently near $x$, by Lemma 39. If the claim fails, take a sequence $g_n arrow.r x$ with the wrong label, and pass to a subsequence $g_n^(- 1) arrow.r b in L$. The convergence property in Proposition 32 sends at least two fixed points of $Z \\ { b }$ to $x$ under $g_n$. Local constancy of $Q_(m + 1)$ near $x$ gives the asserted majority label, a contradiction. Approximating $x$ and $y$ inside their common $Q_m$ component and using constancy of $J_m$ along a connecting path now proves (9.3) in this case as well. ◻
]

=== 9.4 Limits of the pushed paths <limits-of-the-pushed-paths>

#thm([Proposition 9.8.])[
  #emph[In the setting of Proposition 32, the continuum $L$ is locally connected.]
] <push:local-connected>

#proof[
  Fix $x in L$ and a relatively open neighborhood $U subset L$ of $x$. Choose an open neighborhood $O$ of $x$ in $Y$ with $1 in.not O$ and $overline(O) ∩ L subset U$, and apply the preceding construction to $A = Y \\ O$. Let $M$ be the threshold in Lemma 43. By local constancy of $Q_M$, there is a relative neighborhood $V subset L \\ A$ of $x$ such that $Q_M \( y \) = Q_M \( x \)$ for all $y in V$. Induction using Lemma 43 gives
  $ Q_m \( y \) = Q_m \( x \) #h(2em) \( y in V \, med m gt.eq M \) . $
  Fix $y in V$. For each $m gt.eq M$ choose vertices $a_m \, b_m in I_m$ in this common component with $rho \( a_m \, x \) < 1 \/ m$ and $rho \( b_m \, y \) < 1 \/ m$, and choose a finite path $P_m$ in $K \[ I_m \]$ joining them. Every vertex of $P_m$ lies in $O$. We next show that the maximum distance between consecutive vertices of these paths tends to zero.
  Use the finite list of edge representatives $\( u_e \, v_e \)$. The comparison with group vertices gives
  $ rho \( g u_e \, g v_e \) lt.eq rho \( g u_e \, g \) + rho \( g \, g v_e \) arrow.r 0 #h(2em) \( g arrow.r oo upright(" in ") H \) \, $
  uniformly over this finite list. For each $epsilon.alt > 0$, choose a finite $F subset H$ outside which every one of these edge distances is less than $epsilon.alt$. There are only finitely many endpoints of the edges $\( g u_e \, g v_e \)$ with $g in F$. By Lemma 39, none of these endpoints belongs to $I_m$ once $m$ is large. Consequently every edge in $K \[ I_m \]$ then has endpoint distance less than $epsilon.alt$. This proves the mesh assertion without any local-finiteness assumption on $K$.
  Regard $P_m$ as its finite vertex set. The space of nonempty closed subsets of the compact metric space $Y$ is compact in the Hausdorff metric, so pass to a subsequence with $P_m arrow.r C$. The limit contains $x \, y$ and lies in $overline(O)$. It also lies in $L$: this is immediate if $I subset L$; if $I = H$, Lemma 39 excludes each fixed group vertex from $P_m$ for large $m$, and isolatedness of that vertex excludes it from the Hausdorff limit.
  The limit $C$ is connected. Otherwise write it as a union of disjoint nonempty compact sets $C_0 \, C_1$, whose distance is some $delta > 0$. For large $m$, the set $P_m$ lies in the union of their disjoint $delta \/ 3$-neighborhoods and meets both. A path with these vertices must have two consecutive vertices in different neighborhoods, at distance at least $delta \/ 3$. This contradicts the mesh assertion. Thus $C$ is a connected subset of $overline(O) ∩ L subset U$ containing $x$ and $y$.
  Every $y in V$ therefore belongs to the component of $x$ in $U$. Repeating the argument at every point of every open subset of $L$ shows that its components are open. This is local connectedness of $L$. ◻
]

== 10 The continuum contradiction <sec:conclusion>

The path-pushing argument supplies the last property needed for a short topological contradiction. We first record why covering dimension one allows a cohomology class on a closed subset to extend to the whole space.

#thm([Lemma 10.1.])[
  #emph[If $Z$ is a compact metric space with $dim Z lt.eq 1$, $A subset Z$ is closed, and $k$ is an abelian coefficient group, then restriction induces a surjection 
$ caron(H)^1 \( Z \; k \) arrow.r caron(H)^1 \( A \; k \) . $

]
] <end:restriction>

#proof[
  Represent a class on $A$ by a cocycle on the nerve of a finite relative open cover ${ V_i }$ of $A$. Choose open sets $W_i subset Z$ with $W_i ∩ A = V_i$. The cover consisting of the $W_i$ and $Z \\ A$ has a finite open refinement $cal(U)$ of multiplicity at most two. Its nerve is a graph. Retain the indices of the cover members when restricting to $A$, even if two restrictions coincide. After empty restrictions are discarded, the nerve of $cal(U) \|_A$ is a subgraph of this graph. A refinement map pulls the original cocycle back to that subgraph. Extend the resulting $1$-cochain by zero on all remaining edges of $N \( cal(U) \)$. Since there are no $2$-simplices, the extension is a cocycle. Its Čech class restricts to the prescribed class on $A$. ◻
]

#thm([Lemma 10.2.])[
  #emph[Let $L$ be a locally connected compact metric space with metric $d$, and let $U subset L$ be connected and open. Any two points $a \, b in U$ are joined by a continuous path in $U$.]
] <end:paths-in-regions>

#proof[
  Every connected open set $V subset L$ is covered by connected open sets $W$ whose closures lie in $V$ and whose diameters are at most any prescribed $epsilon > 0$. Indeed, choose a sufficiently small metric ball about each point with closure in $V$, then a connected open neighborhood inside a still smaller ball. The intersection graph of this cover is connected: otherwise the unions belonging to its graph components would separate $V$. Thus any two points of $V$ can be joined by a finite chain $W_1 \, dots.h \, W_m$ from this cover, with the first point in $W_1$, the last in $W_m$, and $W_i ∩ W_(i + 1) eq.not diameter$. We may arrange $m gt.eq 2$ by repeating a member if necessary.
  Starting with $\[ 0 \, 1 \]$, the set $U$, and endpoint values $a \, b$, construct successive finite interval partitions $cal(P)_n$ as follows. Associate to every interval $I in cal(P)_n$ a connected open set $V_I$ containing its two already assigned endpoint values. For $n gt.eq 1$ require $"diam" V_I lt.eq 2^(- n)$. Inside $V_I$, choose the finite chain above with closures in $V_I$ and diameters at most $2^(- \( n + 1 \))$. Subdivide $I$ into $m$ equal intervals and associate these to the chain members. At each new division point assign a point of the corresponding consecutive intersection. Keep the old endpoint values. These assignments agree at shared endpoints, and both endpoints of every child interval lie in its associated open set.
  Every subdivision has at least two children, so $"mesh" \( cal(P)_n \) lt.eq 2^(- n)$. The set $D$ of all partition endpoints is therefore dense in $\[ 0 \, 1 \]$, and the compatible assignments define $f : D arrow.r L$. Nesting ensures that $f \( D ∩ I \) subset V_I$ for every $I in cal(P)_n$. For fixed $n gt.eq 1$, let $delta_n > 0$ be the minimum length of a cell of $cal(P)_n$. If $s \, t in D$ and $\| s - t \| < delta_n$, they lie in the same or adjacent cells. In the adjacent case use the assigned value at their common endpoint. In either case,
  $ d \( f \( s \) \, f \( t \) \) lt.eq 2^(1 - n) . $
  Thus $f$ is uniformly continuous and extends continuously to $\[ 0 \, 1 \]$ by completeness of $L$. For each cell $I in cal(P)_1$, its extended image lies in $overline(V_I) subset U$. Hence the entire path lies in $U$, and its endpoints are $a \, b$. ◻
]

The image of a continuous path in a metric space contains an embedded arc joining any two distinct points of that image; see #cite(label("Kamiya1930")) pp. 301–304 for an elementary proof of Moore’s theorem. Consequently every connected open subset of $L$ in Lemma 46 is arcwise connected.

#thm([Lemma 10.3.])[
  #emph[Every nondegenerate locally connected compact metric continuum $L$ with 
$ dim L lt.eq 1 \, #h(2em) caron(H)^1 \( L \; bb(F)_2 \) = 0 $

 has a cut point.]
] <end:continuum>

#proof[
  The continuum contains no embedded circle. Such a circle $C$ would be closed, and Lemma 45 would give a surjection from $caron(H)^1 \( L \; bb(F)_2 \) = 0$ onto $caron(H)^1 \( C \; bb(F)_2 \) tilde.equiv bb(F)_2$.
  A locally connected compact metric continuum is a Peano continuum. Lemma 46 and Moore’s theorem give an arc between any two distinct points of a connected open subset of $L$. Choose an arc between two distinct points $a \, b$ of $L$ and an interior point $p$ of that arc. If $p$ were not a cut point, the connected open set $L \\ { p }$ would contain a second arc between $a$ and $b$. The component of the first arc minus the second that contains $p$ is an open subarc with both endpoints on the second arc. Its closure, together with the subarc of the second joining those endpoints, is an embedded circle. This contradiction shows that $p$ is a cut point. ◻
]

#proof[
  Suppose that $b_1^(\( 2 \)) \( tilde(Q) \) > 0$. The finite-energy construction, the boundary topology proved in Propositions 22 and 23, and the reduction of Proposition 32 give a nondegenerate compact metric continuum $L$ without cut points, with $dim L lt.eq 1$ and $caron(H)^1 \( L \; bb(F)_2 \) = 0$. Proposition 44 makes $L$ locally connected. Lemma 47 is a contradiction. Hence $b_1^(\( 2 \)) \( tilde(Q) \) = 0$.
  Lemma 5 gives $b_0^(\( 2 \)) = b_4^(\( 2 \)) = 0$, $b_3^(\( 2 \)) = b_1^(\( 2 \))$, and vanishing in degrees above four. Its duality argument includes nontrivial orientation characters. Consequently $b_p^(\( 2 \)) \( tilde(Q) \; cal(N) \( Gamma \) \) = 0$ for every $p gt.eq 0$ with $p eq.not 2$, as asserted. ◻
]

== 11 Euler characteristic, signature, and finite covers <sec:consequences>

The concentration theorem determines the remaining $L^2$-Betti number from an ordinary topological invariant. It also gives restrictions on four-manifold signatures and, when sufficiently many finite covers exist, on their rational homology.

#thm([Corollary 11.1.])[
  #emph[Let $Q$ be a finite connected aspherical integral Poincaré complex of formal dimension four, with arbitrary orientation character. Then 
$ chi \( Q \) = b_2^(\( 2 \)) \( tilde(Q) \) gt.eq 0 . $

 Moreover, $chi \( Q \) = 0$ if and only if every $L^2$-Betti number of $tilde(Q)$ vanishes. The same conclusions hold for closed connected aspherical topological four-manifolds.]
] <cor:euler>

#proof[
  For a finite CW complex the $L^2$ Euler–Poincaré formula is
  $ chi \( Q \) = sum_(p gt.eq 0) \( - 1 \)^p b_p^(\( 2 \)) \( tilde(Q) \) $
  #cite(label("Luck2002")) Theorem 1.35(2). Theorem 1 leaves only the degree-two term, whose von Neumann dimension is nonnegative. The characterization of zero follows from the same theorem. For a topological manifold, pass to the finite homotopy model of Lemma 3; both invariants are preserved. ◻
]

The middle term need not vanish: for closed oriented surfaces $Sigma_g \, Sigma_h$ of genera $g \, h gt.eq 2$, the aspherical product has $chi \( Sigma_g times Sigma_h \) = 4 \( g - 1 \) \( h - 1 \) > 0$. The four-torus is an example with $chi = 0$.

For an oriented closed four-manifold $M$, let $sigma \( M \)$ be the signature of its real intersection pairing on $H_2 \( M \; bb(R) \)$. The next consequence is the Euler–signature inequality discussed by Gromov and Lück; see #cite(label("AlbaneseDiCerboLombardi2025")) Conjecture 1.3.

#thm([Corollary 11.2.])[
  #emph[Every closed connected oriented aspherical topological four-manifold satisfies 
$ chi \( M \) gt.eq \| sigma \( M \) \| . $

 In particular, $chi \( M \) = 0$ implies $sigma \( M \) = 0$.]
] <cor:signature>

#proof[
  The topological $L^2$-signature theorem gives $sigma \( M \) = sigma^(\( 2 \)) \( tilde(M) \)$ #cite(label("LuckSchick2003")) Theorem 0.2. The latter is the difference of the positive and negative von Neumann dimensions of the lifted middle-dimensional intersection form, so $\| sigma^(\( 2 \)) \( tilde(M) \) \| lt.eq b_2^(\( 2 \)) \( tilde(M) \)$. Corollary 48 now proves the inequality. ◻
]

This corollary includes nonsmoothable manifolds: the cited signature theorem is topological. Its equality between ordinary and $L^2$ signatures is an additional input; it has not been assumed for arbitrary finite Poincaré complexes.

#thm([Corollary 11.3.])[
  #emph[Let $Q$ be as in Corollary 48, and suppose that $Gamma = pi_1 \( Q \)$ admits a descending sequence $Gamma = Gamma_0 supset.eq Gamma_1 supset.eq dots.h.c$ of finite-index normal subgroups with $⋂_i Gamma_i = { 1 }$. Let $Q_i arrow.r Q$ be the associated covers. For every $p gt.eq 0$, 
$ lim_(i arrow.r oo) frac(b_p \( Q_i \; bb(Q) \), \[ Gamma : Gamma_i \]) = cases(delim: "{", chi \( Q \) \, & p = 2 \,, 0 \, & p eq.not 2 .) $

 The same statement holds for a closed connected aspherical topological four-manifold and its corresponding covers.]
] <cor:betti-growth>

#proof[
  Lück’s approximation theorem #cite(label("Luck1994Approximation")) Theorem 0.1 identifies the limit with $b_p^(\( 2 \)) \( tilde(Q) \)$. Apply Theorem 1 and Corollary 48. A finite homotopy model of a topological manifold lifts to a homotopy equivalence on each corresponding finite cover, giving the last assertion. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
